#include "particle.h"

#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "constants/particle.h"
#include "constants/samus.h"

#include "data/engine_pointers.h"
#include "data/particle_data.h"
#include "data/projectile_data.h"

#include "structs/escape.h"
#include "structs/particle.h"
#include "structs/projectile.h"
#include "structs/samus.h"

/**
 * @brief Checks if the current particle is on screen
 * 
 */
void ParticleCheckOnScreen(void)
{
    u16 bgY, bgX;
    u16 bgBaseY, bgBaseX;
    u16 bgRightBoundry, bgTopBoundry, bgLeftBoundry, bgBottomBoundry;
    u16 particleY, particleX;

    if (gCurrentParticle.status & PARTICLE_STATUS_ABSOLUTE_POSITION)
    {
        gCurrentParticle.status |= PARTICLE_STATUS_ONSCREEN;
        return;
    }

    bgY = gBg1YPosition;
    bgX = gBg1XPosition;

    bgBaseY = bgY + BLOCK_SIZE * 8;
    particleY = gCurrentParticle.yPosition + BLOCK_SIZE * 8;
    bgBottomBoundry = bgBaseY - BLOCK_SIZE * 2;
    bgTopBoundry = bgBaseY + BLOCK_SIZE * 12;

    bgBaseX = bgX + BLOCK_SIZE * 8;
    particleX = gCurrentParticle.xPosition + BLOCK_SIZE * 8;
    bgLeftBoundry = bgBaseX - BLOCK_SIZE * 2;
    bgRightBoundry = bgBaseX + BLOCK_SIZE * 17;

    if (bgLeftBoundry < particleX && particleX < bgRightBoundry &&
        bgBottomBoundry < particleY && particleY < bgTopBoundry)
    {
        gCurrentParticle.status |= PARTICLE_STATUS_ONSCREEN;
    }
    else
    {
        if (gCurrentParticle.status & PARTICLE_STATUS_LIVE_OFF_SCREEN)
            gCurrentParticle.status &= ~PARTICLE_STATUS_ONSCREEN;
        else
            gCurrentParticle.status = 0;
    }
}

/**
 * @brief Draws a particle effect
 * 
 * @param particleSlot Particle slot (unused)
 */
void ParticleDraw(s32 particleSlot)
{
    s32 prevSlot;
    s32 partCount;
    const u16* src;
    u16* dst;
    u16 yPosition;
    u16 xPosition;
    u16 bgPriority;
    u16 part;
    s32 i;
    
    prevSlot = gNextOamSlot;
    src = gCurrentParticleEffectOamFramePointer;

    partCount = *src++;
    
    if (partCount + prevSlot < OAM_BUFFER_DATA_SIZE)
    {
        dst = (u16*)(gOamData + prevSlot);

        if (gCurrentParticle.status & PARTICLE_STATUS_ABSOLUTE_POSITION)
        {
            yPosition = gCurrentParticle.yPosition;
            xPosition = gCurrentParticle.xPosition;
        }
        else
        {
            yPosition = SUB_PIXEL_TO_PIXEL(gCurrentParticle.yPosition) - SUB_PIXEL_TO_PIXEL(gBg1YPosition);
            xPosition = SUB_PIXEL_TO_PIXEL(gCurrentParticle.xPosition) - SUB_PIXEL_TO_PIXEL(gBg1XPosition);
        }

        if (gCurrentParticle.status & PARTICLE_STATUS_LOW_BG_PRIORITY)
        {
            if (gSamusOnTopOfBackgrounds)
                bgPriority = 1;
            else
                bgPriority = 2;
        }
        else
            bgPriority = 0;

        for (i = 0; i < partCount; i++)
        {
            part = *src++;
            *dst++ = part;
            gOamData[prevSlot + i].split.y = part + yPosition;

            part = *src++;
            *dst++ = part;
            gOamData[prevSlot + i].split.x = MOD_AND(part + xPosition, 512); // Needed to produce matching ASM.

            *dst++ = *src++;
            gOamData[prevSlot + i].split.priority = bgPriority;
            
            dst++;
        }

        gNextOamSlot = partCount + prevSlot;
    }
}

/**
 * @brief  Processes all the particle effects (calls subroutine and calls the draw function)
 * 
 */
void ParticleUpdate(void) {
    s32 i;
    u8 status;

    if (gSubGameMode1 == SUB_GAME_MODE_PLAYING)
    {
        for (i = 0; i < MAX_AMOUNT_OF_PARTICLES; i++)
        {
            if ((gParticleEffects[i].status & (PARTICLE_STATUS_EXISTS | PARTICLE_STATUS_HIGH_OAM_PRIORITY)) == (PARTICLE_STATUS_EXISTS | PARTICLE_STATUS_HIGH_OAM_PRIORITY))
            {
                // Copy to current particle
                gCurrentParticle = gParticleEffects[i];

                sProcessParticleFunctionPointers[gCurrentParticle.effect](); // Call subroutine

                if (gCurrentParticle.status & PARTICLE_STATUS_EXISTS)
                {
                    ParticleCheckOnScreen();
                    status = (gCurrentParticle.status & (PARTICLE_STATUS_ONSCREEN | PARTICLE_STATUS_NOT_DRAWN));
                    if (status == PARTICLE_STATUS_ONSCREEN)
                        ParticleDraw(i);
                }

                // Copy back to particle data
                gParticleEffects[i] = gCurrentParticle;
            }
        }

        for (i = 0; i < MAX_AMOUNT_OF_PARTICLES; i++)
        {
            if ((gParticleEffects[i].status & (PARTICLE_STATUS_EXISTS | PARTICLE_STATUS_HIGH_OAM_PRIORITY)) == PARTICLE_STATUS_EXISTS)
            {
                // Copy to current particle
                gCurrentParticle = gParticleEffects[i];

                sProcessParticleFunctionPointers[gCurrentParticle.effect](); // Call subroutine

                if (gCurrentParticle.status & PARTICLE_STATUS_EXISTS)
                {
                    ParticleCheckOnScreen();
                    status = (gCurrentParticle.status & (PARTICLE_STATUS_ONSCREEN | PARTICLE_STATUS_NOT_DRAWN));
                    if (status == PARTICLE_STATUS_ONSCREEN)
                        ParticleDraw(i);
                }

                // Copy back to particle data
                gParticleEffects[i] = gCurrentParticle;
            }
        }

        EscapeUpdate();
    }
}

/**
 * @brief Sets a new particle effect with the given parameters
 * 
 */
void ParticleSet(u16 yPosition, u16 xPosition, u8 effect)
{
    s32 i;
    u8 low;
    u8 counter;
    u8 counterMax;
    u8 count;

    // Try to find an empty slot
    counter = FALSE;
    for (i = 0; i < MAX_AMOUNT_OF_PARTICLES; i++)
    {
        if (!gParticleEffects[i].status)
        {
            counter = TRUE;
            break;
        }
    }

    if (!counter)
    {
        // Couldn't find an empty slot, try to find a particle with the highest frame counter

        low = UCHAR_MAX;
        for (i = 0; i < MAX_AMOUNT_OF_PARTICLES; i++)
        {
            if (gParticleEffects[i].effect < PE_CHARGING_BEAM)
            {
                // Get counter
                counterMax = gParticleEffects[i].frameCounter;
            }
            else
            {
                // Includes PE_CHARGING_BEAM, PE_CHARGING_BEAM_SPARKS and PE_ESCAPE, those 2 particles aren't included in the search
                counterMax = 0;
            }

            if (counter < counterMax)
            {
                // Found new highest, update counter
                counter = counterMax;

                // Store particle index
                low = i;
            }
        }

        if (low != UCHAR_MAX)
        {
            // Found a particle, restore it
            i = low;
        }
        else
        {
            // Couldn't find a particle, abort
            return;
        }
    }

    // Initialize
    gParticleEffects[i].status = PARTICLE_STATUS_EXISTS;

    gParticleEffects[i].yPosition = yPosition;
    gParticleEffects[i].xPosition = xPosition;

    gParticleEffects[i].currentAnimationFrame = 0;
    gParticleEffects[i].animationDurationCounter = 0;

    gParticleEffects[i].effect = effect;
    gParticleEffects[i].stage = 0;
    gParticleEffects[i].frameCounter = 0;
}

/**
 * @brief Updates the animation of a particle effect
 * 
 * @param pOam Oam pointer of the particle
 */
void ParticleUpdateAnimation(const struct FrameData* pOam)
{
    gCurrentParticle.animationDurationCounter++;

    if (pOam[gCurrentParticle.currentAnimationFrame].timer <= gCurrentParticle.animationDurationCounter)
    {
        gCurrentParticle.animationDurationCounter = 0;
        gCurrentParticle.currentAnimationFrame++;

        if (pOam[gCurrentParticle.currentAnimationFrame].timer == 0)
            gCurrentParticle.currentAnimationFrame = 0;
    }

    // Update oam pointer
    gCurrentParticleEffectOamFramePointer = pOam[gCurrentParticle.currentAnimationFrame].pFrame;
}

void ParticleNone(void) {
    if (gCurrentParticle.stage == 0) {
        ParticleUpdateAnimation(sBombOam_Slow);
        gCurrentParticle.stage = 80;
        gCurrentParticle.status |= (PARTICLE_STATUS_LIVE_OFF_SCREEN | PARTICLE_STATUS_HIGH_OAM_PRIORITY);
    } else {
        gCurrentParticle.stage--;
        if (gCurrentParticle.stage > 30) {
            ParticleUpdateAnimation(sBombOam_Slow);
            return;
        } else if (gCurrentParticle.stage == 30) {
            gCurrentParticle.currentAnimationFrame = 0;
            gCurrentParticle.animationDurationCounter = 0;
        }
        ParticleUpdateAnimation(sBombOam_Fast);
        if (gCurrentParticle.stage == 0)
            gCurrentParticle.status = 0;
    }
}

void ParticleBomb(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Bomb);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_HIGH_OAM_PRIORITY;
        SoundPlay(0xde);
    }
}

void ParticleFlareHit(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_FlareHit);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0xf6);
    }
}

void ParticleNormalBeamHit(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_NormalBeamHit);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0xf2);
    }
}

void ParticleChargeBeamHit(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargeBeamHit);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0xf3);
    }
}

void ParticleWideBeamHit(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_WideBeamHit);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0xf4);
    }
}

void ParticlePlasmaBeamHit(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_PlasmaBeamHit);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0xf5);
    }
}

void ParticleInvincibleHit(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_InvincibleHit);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlayNotAlreadyPlaying(0xf8);
    }
}

void ParticleNormalMissileExplosion(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_NormalMissileExplosion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundStop(0xcf);
        SoundPlay(0xd0);
    }
}

void ParticleSuperMissileExplosion(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_SuperMissileExplosion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundStop(0xd2);
        SoundPlay(0xd3);
        ScreenShakeStartHorizontal(10, 0x81);
        ScreenShakeStartVertical(10, 0x81);
    }
}

void ParticleIceMissileExplosion(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_IceMissileExplosion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundStop(0xd5);
        SoundPlay(0xd6);
        ScreenShakeStartHorizontal(20, 0x81);
        ScreenShakeStartVertical(20, 0x81);
    }
}

void ParticleDiffusionMissileExplosion(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_DiffusionMissileExplosion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundStop(0xd8);
        SoundPlay(0xd9);
        ScreenShakeStartHorizontal(30, 0x81);
        ScreenShakeStartVertical(30, 0x81);
    }
}

void ParticleChargedDiffusionMissileExplosion(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargedDiffusionMissileExplosion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundStop(0xdb);
        SoundPlay_3b1c(0xdc);
        ScreenShakeStartHorizontal(40, 0x81);
        ScreenShakeStartVertical(40, 0x81);
    }
}

void ParticleSuperMissileExplosionNoScreenShake(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_SuperMissileExplosion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleIceBeamTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_IceBeamTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleChargedNormalBeamTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargedNormalBeamTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleChargedChargeBeamTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargedChargeBeamTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleChargedWideBeamTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargedWideBeamTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleChargedPlasmaBeamTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargedPlasmaBeamTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleChargedWaveBeamTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargedWaveBeamTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleChargedIceBeamTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargedIceBeamTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleNormalMissileTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_NormalMissileTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleSuperMissileTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_SuperMissileTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleIceMissileTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_IceMissileTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleDiffusionMissileTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_DiffusionMissileTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleChargedDiffusionMissileTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ChargedDiffusionMissileTrail);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleAbsorbHealthX(void) {
    gCurrentParticle.frameCounter++;
    gCurrentParticle.yPosition = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    gCurrentParticle.xPosition = gSamusData.xPosition;
    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.stage = 1;
            ParticleUpdateAnimation(sParticleOam_AbsorbHealthXAbsorbing);
            break;
        case 1:
            if (gCurrentParticle.frameCounter > 27) {
                gCurrentParticle.stage = 2;
                gCurrentParticle.currentAnimationFrame = 0;
                gCurrentParticle.animationDurationCounter = 0;
                ParticleUpdateAnimation(sParticleOam_AbsorbHealthXEnding);
            } else {
                ParticleUpdateAnimation(sParticleOam_AbsorbHealthXAbsorbing);
            }
            break;
        case 2:
            ParticleUpdateAnimation(sParticleOam_AbsorbHealthXEnding);
            if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
                gCurrentParticle.status = 0;
            break;
        default:
            gCurrentParticle.status = 0;
    }
}

void ParticleAbsorbMissileX(void) {
    gCurrentParticle.frameCounter++;
    gCurrentParticle.yPosition = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    gCurrentParticle.xPosition = gSamusData.xPosition;
    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.stage = 1;
            ParticleUpdateAnimation(sParticleOam_3ea7ec);
            break;
        case 1:
            if (gCurrentParticle.frameCounter > 27) {
                gCurrentParticle.stage = 2;
                gCurrentParticle.currentAnimationFrame = 0;
                gCurrentParticle.animationDurationCounter = 0;
                ParticleUpdateAnimation(sParticleOam_3ea8f4);
            } else {
                ParticleUpdateAnimation(sParticleOam_3ea7ec);
            }
            break;
        case 2:
            ParticleUpdateAnimation(sParticleOam_3ea8f4);
            if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
                gCurrentParticle.status = 0;
            break;
        default:
            gCurrentParticle.status = 0;
    }
}

void ParticleAbsorbRedX(void) {
    gCurrentParticle.frameCounter++;
    gCurrentParticle.yPosition = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    gCurrentParticle.xPosition = gSamusData.xPosition;
    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.stage = 1;
            ParticleUpdateAnimation(sParticleOam_3eaac4);
            break;
        case 1:
            if (gCurrentParticle.frameCounter > 27) {
                gCurrentParticle.stage = 2;
                gCurrentParticle.currentAnimationFrame = 0;
                gCurrentParticle.animationDurationCounter = 0;
                ParticleUpdateAnimation(sParticleOam_3eabcc);
            } else {
                ParticleUpdateAnimation(sParticleOam_3eaac4);
            }
            break;
        case 2:
            ParticleUpdateAnimation(sParticleOam_3eabcc);
            if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
                gCurrentParticle.status = 0;
            break;
        default:
            gCurrentParticle.status = 0;
    }
}

void ParticleAbsorbCoreX(void) {
    gCurrentParticle.frameCounter++;
    gCurrentParticle.yPosition = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    gCurrentParticle.xPosition = gSamusData.xPosition;
    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.stage = 1;
            ParticleUpdateAnimation(sParticleOam_3eadd4);
            break;
        case 1:
            if (gCurrentParticle.frameCounter > 27) {
                gCurrentParticle.stage = 2;
                gCurrentParticle.currentAnimationFrame = 0;
                gCurrentParticle.animationDurationCounter = 0;
                ParticleUpdateAnimation(sParticleOam_3eaedc);
            } else {
                ParticleUpdateAnimation(sParticleOam_3eadd4);
            }
            break;
        case 2:
            ParticleUpdateAnimation(sParticleOam_3eaedc);
            if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
                gCurrentParticle.status = 0;
            break;
        default:
            gCurrentParticle.status = 0;
    }
}

void ParticleAbsorbIceXPreVaria(void) {
    gCurrentParticle.frameCounter++;
    gCurrentParticle.yPosition = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    gCurrentParticle.xPosition = gSamusData.xPosition;
    ParticleUpdateAnimation(sParticleOam_AbsorbIceXPreVaria);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleIceXTrail(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_IceXTrail);
    gCurrentParticle.status ^= PARTICLE_STATUS_LOW_BG_PRIORITY;
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleDiffusion(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Diffusion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleFireBeam(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_FireBeam);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleExplosion1(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion1);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion2(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion2);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion3(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion3);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion4(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion4);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion5(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion5);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion6(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion6);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_HIGH_OAM_PRIORITY;
    }
}

void ParticleHeavyDust1(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_HeavyDust);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleHeavyDust2(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_HeavyDust);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleEnterOrExitWater(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_EnterOrExitWater);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleEnterOrExitWaterBig(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_EnterOrExitWaterBig);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void ParticleSpriteEnterOrExitWater(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_SpriteEnterOrExitWater);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_LOW_BG_PRIORITY;
    }
}

void unk_73e90(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sWaterDropOam_Splashing);
    gCurrentParticle.yPosition = gEffectYPosition;
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosionSmoke(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ExplosionSmoke);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleTailExplosionSmoke(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_TailExplosionSmoke);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion7(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion7);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion10(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion10);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion8(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion8);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleSmoke(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Smoke);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleExplosion9(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Explosion9);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleTailSmoke1(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_TailSmoke1);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleTailExplosion(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_TailExplosion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleTailSmoke2(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_TailSmoke2);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleOutwardIceExplosion(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_OutwardIceExplosion);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleOutwardSmoke(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_OutwardSmoke);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleScrewAttackKilled(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ScrewAttackKilled);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0x148);
    }
}

void ParticleSpeedboosterKilled(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_SpeedboosterKilled);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0x149);
    }
}

void ParticleShinesparkKilled(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_ShinesparkKilled);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0x148);
    }
}

void ParticleSudoScrewKilled(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_SudoScrewKilled);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        SoundPlay(0x147);
    }
}

void PlayBeamChargingSound(void) {
    u8 beams = gEquipment.beamStatus;

    if (beams & BF_ICE_BEAM)
        SoundPlay(0xe9);
    else if (beams & BF_WAVE_BEAM)
        SoundPlay(0xe7);
    else if (beams & BF_PLASMA_BEAM)
        SoundPlay(0xe5);
    else if (beams & BF_WIDE_BEAM)
        SoundPlay(0xe3);
    else
        SoundPlay(0xe1);
}

void StopBeamChargingSound(void) {
    u8 beams = gEquipment.beamStatus;

    if (beams & BF_ICE_BEAM)
        SoundStop(0xe9);
    else if (beams & BF_WAVE_BEAM)
        SoundStop(0xe7);
    else if (beams & BF_PLASMA_BEAM)
        SoundStop(0xe5);
    else if (beams & BF_WIDE_BEAM)
        SoundStop(0xe3);
    else
        SoundStop(0xe1);
}

void PlayBeamChargedSound(void) {
    u8 beams = gEquipment.beamStatus;

    if (beams & BF_ICE_BEAM)
        SoundPlay(0xea);
    else if (beams & BF_WAVE_BEAM)
        SoundPlay(0xe8);
    else if (beams & BF_PLASMA_BEAM)
        SoundPlay(0xe6);
    else if (beams & BF_WIDE_BEAM)
        SoundPlay(0xe4);
    else
        SoundPlay(0xe2);
}

void ParticleChargingBeam(void) {
    gCurrentParticle.yPosition = gArmCannonY;
    gCurrentParticle.xPosition = gArmCannonX;

    if (gSamusData.chargeBeamCounter <= 15) { // FIXME define
        gCurrentParticle.status = 0;
        if (gCurrentParticle.stage <= 1)
            StopBeamChargingSound();
        return;
    }

    switch (gSamusData.pose) {
        case SPOSE_SPINNING:
        case SPOSE_WALL_JUMPING:
        case SPOSE_SPACE_JUMPING:
        case SPOSE_SCREW_ATTACKING:
            gCurrentParticle.status |= PARTICLE_STATUS_NOT_DRAWN;
            break;
        default:
            gCurrentParticle.status &= ~PARTICLE_STATUS_NOT_DRAWN;
    }

    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.status |= PARTICLE_STATUS_LIVE_OFF_SCREEN;
            gCurrentParticle.stage++;
            ParticleUpdateAnimation(sParticleOam_ChargingBeamBegin);
            PlayBeamChargingSound();
            break;
        case 1:
            if (gSamusData.chargeBeamCounter >= 64) { // FIXME define
                gCurrentParticle.stage++;
                gCurrentParticle.currentAnimationFrame = 0;
                gCurrentParticle.animationDurationCounter = 0;
                gCurrentParticle.frameCounter = 0;
                ParticleUpdateAnimation(sParticleOam_ChargingBeamCharged);
            } else {
                ParticleUpdateAnimation(sParticleOam_ChargingBeamBegin);
            }
            break;
        default:
            ParticleUpdateAnimation(sParticleOam_ChargingBeamCharged);
            if (MOD_AND(gCurrentParticle.frameCounter, 16) == 0)
                PlayBeamChargedSound();
            gCurrentParticle.frameCounter++;
    }
}

void ParticleChargingBeamSparks(void) {
    gCurrentParticle.yPosition = gArmCannonY;
    gCurrentParticle.xPosition = gArmCannonX;

    if (gSamusData.chargeBeamCounter <= 15) { // FIXME define
        gCurrentParticle.status = 0;
        return;
    }

    switch (gSamusData.pose) {
        case SPOSE_SPINNING:
        case SPOSE_WALL_JUMPING:
        case SPOSE_SPACE_JUMPING:
        case SPOSE_SCREW_ATTACKING:
            gCurrentParticle.status |= PARTICLE_STATUS_NOT_DRAWN;
            break;
        default:
            gCurrentParticle.status &= ~PARTICLE_STATUS_NOT_DRAWN;
    }

    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.status |= PARTICLE_STATUS_LIVE_OFF_SCREEN | PARTICLE_STATUS_HIGH_OAM_PRIORITY;
            gCurrentParticle.stage++;
            ParticleUpdateAnimation(sParticleOam_ChargingBeamSparksBegin);
            break;
        case 1:
            if (gSamusData.chargeBeamCounter >= 64) { // FIXME define
                gCurrentParticle.stage++;
                gCurrentParticle.currentAnimationFrame = 0;
                gCurrentParticle.animationDurationCounter = 0;
                ParticleUpdateAnimation(sParticleOam_ChargingBeamSparksCharged);
            } else {
                ParticleUpdateAnimation(sParticleOam_ChargingBeamSparksBegin);
            }
            break;
        default:
            ParticleUpdateAnimation(sParticleOam_ChargingBeamSparksCharged);
    }
}

void ParticleAbsorbingSuit(void) {
    gCurrentParticle.frameCounter++;
    gCurrentParticle.yPosition = gArmCannonY;
    gCurrentParticle.xPosition = gArmCannonX;
    ParticleUpdateAnimation(sParticleOam_AbsorbingSuit);
    if (gSamusData.unk_B == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleChargingMissile(void) {
    gCurrentParticle.yPosition = gArmCannonY;
    gCurrentParticle.xPosition = gArmCannonX;

    if ((u32)gSamusEnvironmentalEffects[1].externalTimer <= 15) { // FIXME define
        gCurrentParticle.status = 0;
        if (gCurrentParticle.stage <= 1)
            SoundStop(0xeb);
        return;
    }

    switch (gSamusData.pose) {
        case SPOSE_SPINNING:
        case SPOSE_WALL_JUMPING:
        case SPOSE_SPACE_JUMPING:
        case SPOSE_SCREW_ATTACKING:
            gCurrentParticle.status |= PARTICLE_STATUS_NOT_DRAWN;
            break;
        default:
            gCurrentParticle.status &= ~PARTICLE_STATUS_NOT_DRAWN;
    }

    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.status |= PARTICLE_STATUS_LIVE_OFF_SCREEN;
            gCurrentParticle.stage++;
            ParticleUpdateAnimation(sParticleOam_ChargingMissileBegin);
            SoundPlay(0xeb);
            break;
        case 1:
            if (gSamusEnvironmentalEffects[1].externalTimer < 0) {
                gCurrentParticle.stage++;
                gCurrentParticle.currentAnimationFrame = 0;
                gCurrentParticle.animationDurationCounter = 0;
                gCurrentParticle.frameCounter = 0;
                ParticleUpdateAnimation(sParticleOam_ChargingMissileCharged);
            } else {
                ParticleUpdateAnimation(sParticleOam_ChargingMissileBegin);
            }
            break;
        default:
            ParticleUpdateAnimation(sParticleOam_ChargingMissileCharged);
            if (MOD_AND(gCurrentParticle.frameCounter, 16) == 0)
                SoundPlay(0xec);
            gCurrentParticle.frameCounter++;
    }
}

void ParticleDust1(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Dust1);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleDust2(void) {
    gCurrentParticle.frameCounter++;
    ParticleUpdateAnimation(sParticleOam_Dust2);
    if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0)
        gCurrentParticle.stage++;
}

void ParticleEscape(void) {
    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.stage = 1;
            gCurrentParticle.status |= (PARTICLE_STATUS_ABSOLUTE_POSITION | PARTICLE_STATUS_LIVE_OFF_SCREEN);
            EscapeSetDigits();
            gEscapeStatus = ESCAPE_STATUS_HAPPENNING;
            break;
        case 1:
            if (gEscapeStatus == ESCAPE_STATUS_FAILED) {
                gPreventMovementTimer = 1000;
                gCurrentParticle.stage = 3;
                gCurrentParticle.frameCounter = UCHAR_MAX;
                unk_6dee8();
            } else if (gEscapeStatus == ESCAPE_STATUS_HAPPENNING && EventCheckOn_EndEscape()) {
                gCurrentParticle.stage = 2;
                gCurrentParticle.frameCounter = 32;
            }
            break;
        case 2:
            gCurrentParticle.yPosition -= 2;
            if (--gCurrentParticle.frameCounter == 0)
                gCurrentParticle.status = 0;
            break;
    }
    EscapeUpdateOam();
    gCurrentParticleEffectOamFramePointer = gEscapeDigitsOam;
}

void ParticleGettingSuit(void) {
    gCurrentParticle.frameCounter++;
    gCurrentParticle.yPosition = gSamusData.yPosition + gSamusData.drawDistanceTop / 2 - HALF_BLOCK_SIZE;
    gCurrentParticle.xPosition = gSamusData.xPosition;
    switch (gCurrentParticle.stage) {
        case 0:
            gCurrentParticle.stage = 1;
            ParticleUpdateAnimation(sParticleOam_3ed1e4);
            break;
        case 1:
            if (!gPoseLock) {
                gCurrentParticle.stage = 2;
                gCurrentParticle.currentAnimationFrame = 0;
                gCurrentParticle.animationDurationCounter = 0;
                ParticleUpdateAnimation(sParticleOam_AbsorbingSuit);
            } else {
                ParticleUpdateAnimation(sParticleOam_3ed1e4);
            }
            break;
        case 2:
            ParticleUpdateAnimation(sParticleOam_AbsorbingSuit);
            if (gCurrentParticle.currentAnimationFrame == 0 && gCurrentParticle.animationDurationCounter == 0)
                gCurrentParticle.status = 0;
            break;
        default:
            gCurrentParticle.status = 0;
    }
}

void ParticleGettingSuitBeams(void) {
    gCurrentParticle.frameCounter++;
    gCurrentParticle.yPosition = gSamusData.yPosition + gSamusData.drawDistanceTop / 2 - HALF_BLOCK_SIZE;
    gCurrentParticle.xPosition = gSamusData.xPosition;
    ParticleUpdateAnimation(sParticleOam_GettingSuitBeams);
    if (!gPoseLock)
        gCurrentParticle.status = 0;
    if (gCurrentParticle.stage == 0) {
        gCurrentParticle.stage++;
        gCurrentParticle.status |= PARTICLE_STATUS_HIGH_OAM_PRIORITY;
    }
}
