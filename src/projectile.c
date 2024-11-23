#include "projectile.h"
#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "data/engine_pointers.h"
#include "data/generic_data.h"
#include "data/particle_data.h"
#include "data/projectile_data.h"
#include "data/sprite_data.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/particle.h"
#include "constants/projectile.h"

#include "structs/clipdata.h"
#include "structs/samus.h"
#include "structs/sprite.h"
#include "structs/particle.h"
#include "structs/power_bomb.h"
#include "structs/projectile.h"
#include "structs/sprite_debris.h"

/**
 * @brief 8116c | 50 | Checks if the number of projectiles currently existing is above/under the specified limit
 * 
 * @param type Projectile type
 * @param limit Limit
 * @return u8 bool, under limit
 */
u8 ProjectileCount(u8 type, u8 limit)
{
    u8 i;
    u8 count;

    count = 0;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if (gProjectileData[i].status & PROJ_STATUS_EXISTS && gProjectileData[i].type == type)
        {
            count++;

            if (count >= limit)
                return FALSE;
        }
    }

    return TRUE;
}

/**
 * @brief 811bc | a0 | Initializes a new projectile
 * 
 * @param type Projectile type
 * @param yPosition Y position
 * @param xPosition X position
 * @param part Projectile part
 * @return u8 
 */
u8 ProjectileInit(u8 type, u16 yPosition, u16 xPosition, u8 part)
{
    u8 i;
    u8 slot;

    slot = UCHAR_MAX;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if (gProjectileData[i].status & PROJ_STATUS_EXISTS)
            continue;

        // Set initial status and X flip
        if (gSamusData.direction & KEY_RIGHT)
            gProjectileData[i].status = PROJ_STATUS_EXISTS | PROJ_STATUS_ON_SCREEN | PROJ_STATUS_NOT_DRAWN | PROJ_STATUS_X_FLIP;
        else
            gProjectileData[i].status = PROJ_STATUS_EXISTS | PROJ_STATUS_ON_SCREEN | PROJ_STATUS_NOT_DRAWN;

        gProjectileData[i].type = type;
        gProjectileData[i].yPosition = yPosition;
        gProjectileData[i].xPosition = xPosition;

        gProjectileData[i].movementStage = 0;
        gProjectileData[i].palette = 0;

        gProjectileData[i].part = part;
        gProjectileData[i].timer = 0;

        gProjectileData[i].direction = gSamusData.armCannonDirection;

        gProjectileData[i].primaryProjectileSlot = i;

        slot = i;
        break;
    }

    return slot;
}

/**
 * @brief 8125c | 94 | Initializes a secondary projectile
 * 
 * @param type Projectile type
 * @param yPosition Y position
 * @param xPosition X position
 * @param part Projectile part
 * @param status Status to add
 * @param direction Direction
 * @param ramSlot Primary projectile ram slot
 */
void ProjectileInitSecondary(u8 type, u16 yPosition, u16 xPosition, u8 part, u8 status, u8 direction, u8 ramSlot)
{
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if (gProjectileData[i].status & PROJ_STATUS_EXISTS)
            continue;

        gProjectileData[i].status = (PROJ_STATUS_EXISTS | PROJ_STATUS_ON_SCREEN | PROJ_STATUS_NOT_DRAWN) | status;

        gProjectileData[i].type = type;
        gProjectileData[i].yPosition = yPosition;
        gProjectileData[i].xPosition = xPosition;

        gProjectileData[i].movementStage = 0;
        gProjectileData[i].palette = 0;

        gProjectileData[i].part = part;
        gProjectileData[i].timer = 0;

        gProjectileData[i].direction = direction;

        gProjectileData[i].primaryProjectileSlot = ramSlot;

        break;
    }
}

void ProjectileUpdate(void)
{
    s32 i;
    u8 checks;
    s32 beams, missiles;

    u8 primarySlot;
    u8 direction;
    u8 flip;

    if (gSubGameMode1 != SUB_GAME_MODE_PLAYING)
        return;

    // Update the arm cannon position offset fields
    CallUpdateArmCannonOffset();

    // Samus position is in sub pixels, the offsets are in pixel, and the final result is in sub pixels
    gArmCannonY = PIXEL_TO_SUB_PIXEL(SUB_PIXEL_TO_PIXEL(gSamusData.yPosition) + gSamusGraphicsInfo.armCannonYOffset);
    gArmCannonX = PIXEL_TO_SUB_PIXEL(SUB_PIXEL_TO_PIXEL(gSamusData.xPosition) + gSamusGraphicsInfo.armCannonXOffset);

    // Check spawn the charging beam particle effect
    if (gSamusData.chargeBeamCounter == 0x10)
    {
        checks = FALSE;

        for (i = 0; i < MAX_AMOUNT_OF_PARTICLES; i++)
        {
            // Verify it doesn't already exist
            if (gParticleEffects[i].status & PARTICLE_STATUS_EXISTS && gParticleEffects[i].effect == PE_CHARGING_BEAM)
            {
                checks++;
                break;
            }
        }

        if (!checks)
        {
            ParticleSet(gArmCannonY, gArmCannonX, PE_CHARGING_BEAM);
            ParticleSet(gArmCannonY, gArmCannonX, PE_CHARGING_MISSILES);
        }
    }

    if ((u32)gSamusEnvironmentalEffects[1].externalTimer == 0x10)
    {
        checks = FALSE;

        for (i = 0; i < MAX_AMOUNT_OF_PARTICLES; i++)
        {
            // Verify it doesn't already exist
            if (gParticleEffects[i].status & PARTICLE_STATUS_EXISTS && gParticleEffects[i].effect == PE_ESCAPE)
            {
                checks++;
                break;
            }
        }

        if (!checks)
        {
            ParticleSet(gArmCannonY, gArmCannonX, PE_ESCAPE);
        }
    }

    // Try to spawn the requested new projectile, first it checks for the limit for that kind of projectile, then it tries to spawn it
    // If the spawn is successful, cooldown and other things are set depending on the type of projectile.
    switch (gSamusData.newProjectile)
    {
        case 1:
            beams = gEquipment.beamStatus;
            if (beams & BF_WAVE_BEAM)
            {
                if (ProjectileCount(PROJ_TYPE_WAVE_BEAM, 7))
                {
                    ProjectileInit(PROJ_TYPE_WAVE_BEAM, gArmCannonY, gArmCannonX, 0);
                    ProjectileInit(PROJ_TYPE_WAVE_BEAM, gArmCannonY, gArmCannonX, 1);
                    ProjectileInit(PROJ_TYPE_WAVE_BEAM, gArmCannonY, gArmCannonX, 2);
                    gSamusData.cooldownTimer = 7;
                    ParticleSet(gArmCannonY, gArmCannonX, PE_FIRE_BEAM);
                }
            }
            else if (beams & BF_PLASMA_BEAM)
            {
                if (ProjectileCount(PROJ_TYPE_PLASMA_BEAM, 7))
                {
                    ProjectileInit(PROJ_TYPE_PLASMA_BEAM, gArmCannonY, gArmCannonX, 0);
                    ProjectileInit(PROJ_TYPE_PLASMA_BEAM, gArmCannonY, gArmCannonX, 1);
                    ProjectileInit(PROJ_TYPE_PLASMA_BEAM, gArmCannonY, gArmCannonX, 2);
                    gSamusData.cooldownTimer = 7;
                    ParticleSet(gArmCannonY, gArmCannonX, PE_FIRE_BEAM);
                }
            }
            else if (beams & BF_WIDE_BEAM)
            {
                if (ProjectileCount(PROJ_TYPE_WIDE_BEAM, 7))
                {
                    ProjectileInit(PROJ_TYPE_WIDE_BEAM, gArmCannonY, gArmCannonX, 0);
                    ProjectileInit(PROJ_TYPE_WIDE_BEAM, gArmCannonY, gArmCannonX, 1);
                    ProjectileInit(PROJ_TYPE_WIDE_BEAM, gArmCannonY, gArmCannonX, 2);
                    gSamusData.cooldownTimer = 7;
                    ParticleSet(gArmCannonY, gArmCannonX, PE_FIRE_BEAM);
                }
            }
            else if (beams & BF_CHARGE_BEAM)
            {
                if (ProjectileCount(PROJ_TYPE_CHARGE_BEAM, 7))
                {
                    primarySlot = ProjectileInit(PROJ_TYPE_CHARGE_BEAM, gArmCannonY, gArmCannonX, 0);
                    direction = gProjectileData[primarySlot].direction;
                    flip = gProjectileData[primarySlot].status & PROJ_STATUS_X_FLIP;

                    ProjectileInitSecondary(PROJ_TYPE_CHARGE_BEAM, gArmCannonY, gArmCannonX, 1,
                        flip, direction, primarySlot);
                    ProjectileInitSecondary(PROJ_TYPE_CHARGE_BEAM, gArmCannonY, gArmCannonX, 2,
                        flip, direction, primarySlot);

                    gSamusData.cooldownTimer = 7;
                    ParticleSet(gArmCannonY, gArmCannonX, PE_FIRE_BEAM);
                }
            }
            else
            {
                if (ProjectileCount(PROJ_TYPE_NORMAL_BEAM, 3))
                {
                    ProjectileInit(PROJ_TYPE_NORMAL_BEAM, gArmCannonY, gArmCannonX, 0);
                    gSamusData.cooldownTimer = 7;
                    ParticleSet(gArmCannonY, gArmCannonX, PE_FIRE_BEAM);
                }
            }

            gSamusData.newProjectile = 0;
            break;

        case 2:
            missiles = gEquipment.weaponsStatus;
            if (missiles & MBF_DIFFUSION_MISSILES)
            {
                if (ProjectileCount(PROJ_TYPE_DIFFUSION_MISSILE, 2))
                {
                    if (gSamusEnvironmentalEffects[1].externalTimer < 0)
                        ProjectileInit(PROJ_TYPE_CHARGED_DIFFUSION_MISSILE, gArmCannonY, gArmCannonX, 0);
                    else
                        ProjectileInit(PROJ_TYPE_DIFFUSION_MISSILE, gArmCannonY, gArmCannonX, 0);
                    gSamusData.cooldownTimer = 16;
                    gSamusEnvironmentalEffects[1].externalTimer = 0;
                }
            }
            else if (missiles & MBF_ICE_MISSILES)
            {
                if (ProjectileCount(PROJ_TYPE_ICE_MISSILE, 2))
                {
                    ProjectileInit(PROJ_TYPE_ICE_MISSILE, gArmCannonY, gArmCannonX, 0);
                    gSamusData.cooldownTimer = 15;
                }
            }
            else if (missiles & MBF_SUPER_MISSILES)
            {
                if (ProjectileCount(PROJ_TYPE_SUPER_MISSILE, 2))
                {
                    ProjectileInit(PROJ_TYPE_SUPER_MISSILE, gArmCannonY, gArmCannonX, 0);
                    gSamusData.cooldownTimer = 14;
                }
            }
            else
            {
                if (ProjectileCount(PROJ_TYPE_NORMAL_MISSILE, 2))
                {
                    ProjectileInit(PROJ_TYPE_NORMAL_MISSILE, gArmCannonY, gArmCannonX, 0);
                    gSamusData.cooldownTimer = 9;
                }
            }

            gSamusData.newProjectile = 0;
            break;

        case 4:
            if (ProjectileCount(PROJ_TYPE_BOMB, 4))
            {
                ProjectileInit(PROJ_TYPE_BOMB, gSamusData.yPosition, gSamusData.xPosition, 0);
                gSamusData.cooldownTimer = 7;
            }

            gSamusData.newProjectile = 0;
            break;

        case 6:
            if (ProjectileCount(PROJ_TYPE_POWER_BOMB, 1) && gCurrentPowerBomb.animationState == 0)
            {
                ProjectileInit(PROJ_TYPE_POWER_BOMB, gSamusData.yPosition, gSamusData.xPosition, 0);
                gSamusData.cooldownTimer = 5;
            }

            gSamusData.newProjectile = 0;
            break;

        case 5:
            beams = gEquipment.beamStatus;
            if (beams & BF_WAVE_BEAM)
            {
                if (ProjectileCount(PROJ_TYPE_CHARGED_WAVE_BEAM, 7))
                {
                    ProjectileInit(PROJ_TYPE_CHARGED_WAVE_BEAM, gArmCannonY, gArmCannonX, 0);
                    ProjectileInit(PROJ_TYPE_CHARGED_WAVE_BEAM, gArmCannonY, gArmCannonX, 1);
                    ProjectileInit(PROJ_TYPE_CHARGED_WAVE_BEAM, gArmCannonY, gArmCannonX, 2);
                    gSamusData.cooldownTimer = 3;
                    ProjectileInit(PROJ_TYPE_FLARE, gArmCannonY, gArmCannonX, 0);
                }
            }
            else if (beams & BF_PLASMA_BEAM)
            {
                if (ProjectileCount(PROJ_TYPE_CHARGED_PLASMA_BEAM, 7))
                {
                    ProjectileInit(PROJ_TYPE_CHARGED_PLASMA_BEAM, gArmCannonY, gArmCannonX, 0);
                    ProjectileInit(PROJ_TYPE_CHARGED_PLASMA_BEAM, gArmCannonY, gArmCannonX, 1);
                    ProjectileInit(PROJ_TYPE_CHARGED_PLASMA_BEAM, gArmCannonY, gArmCannonX, 2);
                    gSamusData.cooldownTimer = 3;
                    ProjectileInit(PROJ_TYPE_FLARE, gArmCannonY, gArmCannonX, 0);
                }
            }
            else if (beams & BF_WIDE_BEAM)
            {
                if (ProjectileCount(PROJ_TYPE_CHARGED_WIDE_BEAM, 7))
                {
                    ProjectileInit(PROJ_TYPE_CHARGED_WIDE_BEAM, gArmCannonY, gArmCannonX, 0);
                    ProjectileInit(PROJ_TYPE_CHARGED_WIDE_BEAM, gArmCannonY, gArmCannonX, 1);
                    ProjectileInit(PROJ_TYPE_CHARGED_WIDE_BEAM, gArmCannonY, gArmCannonX, 2);
                    gSamusData.cooldownTimer = 3;
                    ProjectileInit(PROJ_TYPE_FLARE, gArmCannonY, gArmCannonX, 0);
                }
            }
            else if (beams & BF_CHARGE_BEAM)
            {
                if (ProjectileCount(PROJ_TYPE_CHARGED_CHARGE_BEAM, 7))
                {
                    primarySlot = ProjectileInit(PROJ_TYPE_CHARGED_CHARGE_BEAM, gArmCannonY, gArmCannonX, 0);
                    direction = gProjectileData[primarySlot].direction;
                    flip = gProjectileData[primarySlot].status & PROJ_STATUS_X_FLIP;

                    ProjectileInitSecondary(PROJ_TYPE_CHARGED_CHARGE_BEAM, gArmCannonY, gArmCannonX, 1,
                        flip, direction, primarySlot);
                    ProjectileInitSecondary(PROJ_TYPE_CHARGED_CHARGE_BEAM, gArmCannonY, gArmCannonX, 2,
                        flip, direction, primarySlot);

                    gSamusData.cooldownTimer = 3;
                    ProjectileInit(PROJ_TYPE_FLARE, gArmCannonY, gArmCannonX, 0);
                }
            }
            else
            {
                if (ProjectileCount(PROJ_TYPE_CHARGED_NORMAL_BEAM, 3))
                {
                    ProjectileInit(PROJ_TYPE_CHARGED_NORMAL_BEAM, gArmCannonY, gArmCannonX, 0);
                    gSamusData.cooldownTimer = 3;
                    ProjectileInit(PROJ_TYPE_FLARE, gArmCannonY, gArmCannonX, 0);
                }
            }

            gSamusData.newProjectile = 0;
            break;

    }

    // Handle projectile/sprite collision
    ProjectileCheckHittingSprite();

    // Update projectiles
    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if (gProjectileData[i].status & PROJ_STATUS_EXISTS)
        {
            // Copy to current projectile
            gCurrentProjectile = gProjectileData[i];

            // Call AI
            sProcessProjectileFunctionPointers[gCurrentProjectile.type]();

            // Update animation and check despawn
            ProjectileUpdateAnimation();
            ProjectileCheckOnScreen();

            // Copy back to projectile data
            gProjectileData[i] = gCurrentProjectile;
        }
    }
}

/**
 * @brief 81964 | 3c | Updates the animation of a projectile
 * 
 */
void ProjectileUpdateAnimation(void)
{
    gCurrentProjectile.animationDurationCounter++;

    if (gCurrentProjectile.pOam[gCurrentProjectile.currentAnimationFrame].timer < gCurrentProjectile.animationDurationCounter)
    {
        gCurrentProjectile.animationDurationCounter = 1;
        gCurrentProjectile.currentAnimationFrame++;

        if (gCurrentProjectile.pOam[gCurrentProjectile.currentAnimationFrame].timer == 0)
            gCurrentProjectile.currentAnimationFrame = 0;
    }
}

/**
 * @brief 819a0 | 4c | Draw all the projectile that don't have the 0x80 status flag set
 * 
 */
void ProjectileDrawAll_False(void)
{
    s32 i;

    if (gSubGameMode1 != SUB_GAME_MODE_PLAYING)
        return;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if ((gProjectileData[i].status & PROJ_STATUS_DRAW_CHECK) != PROJ_STATUS_DRAW_COND)
            continue;

        gCurrentProjectile = gProjectileData[i];

        ProjectileDraw(i);
    }
}

/**
 * @brief 819ec | 4c | Draw all the projectile that have the 0x80 status flag set
 * 
 */
void ProjectileDrawAll_True(void)
{
    s32 i;

    if (gSubGameMode1 != SUB_GAME_MODE_PLAYING)
        return;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if ((gProjectileData[i].status & PROJ_STATUS_DRAW_CHECK) != (PROJ_STATUS_DRAW_COND | PROJ_STATUS_LOW_OAM_PRIORITY))
            continue;

        gCurrentProjectile = gProjectileData[i];

        ProjectileDraw(i);
    }
}

/**
 * @brief 81a38 | 1c0 | Draws a projectile
 * 
 * @param projectileSlot Projectile slot (unused)
 */
void ProjectileDraw(s32 projectileSlot)
{
    const u16* src;
    u16* dst;
    s32 partCount;
    u16 yPosition;
    u16 xPosition;
    u16 part1;
    u16 part2;
    s32 prevSlot;
    s32 currSlot;
    u8 xFlip;
    u8 yFlip;
    s32 i;
    u32 shape;
    u32 size;
    u32 bgPriority;
    u8 palette;
    u32 offset;
    
    prevSlot = gNextOamSlot;
    src = gCurrentProjectile.pOam[gCurrentProjectile.currentAnimationFrame].pFrame;

    partCount = *src++;

    if (partCount + prevSlot < OAM_BUFFER_DATA_SIZE)
    {
        dst = (u16*)(gOamData + prevSlot);

        yPosition = (gCurrentProjectile.yPosition >> 2) - gBg1YPosition / 4;
        xPosition = (gCurrentProjectile.xPosition >> 2) - gBg1XPosition / 4;

        xFlip = gCurrentProjectile.status & PROJ_STATUS_X_FLIP;
        yFlip = gCurrentProjectile.status & PROJ_STATUS_Y_FLIP;

        palette = gCurrentProjectile.palette;

        bgPriority = (gIoRegisters.bg1Cnt & 3);
        if (!(gCurrentProjectile.status & PROJ_STATUS_ABOVE_BG1))
            bgPriority++;

        for (i = 0; i < partCount; i++)
        {
            part1 = *src++;
            *dst++ = part1;
            gOamData[prevSlot + i].split.y = part1 + yPosition;

            part2 = *src++;
            *dst++ = part2;
            gOamData[prevSlot + i].split.x = part2 + xPosition;

            *dst++ = *src++;
            gOamData[prevSlot + i].split.priority = bgPriority;

            gOamData[prevSlot + i].split.paletteNum += palette;

            if (xFlip)
            {
                gOamData[prevSlot + i].split.xFlip ^= TRUE;
                
                shape = gOamData[prevSlot + i].split.shape;
                size = gOamData[prevSlot + i].split.size;
                offset = sOamXFlipOffsets[shape][size];
                
                gOamData[prevSlot + i].split.x = xPosition - (part2 + offset * 8);
            }

            if (yFlip)
            {
                gOamData[prevSlot + i].split.yFlip ^= TRUE;
                
                shape = gOamData[prevSlot + i].split.shape;
                size = gOamData[prevSlot + i].split.size;
                offset = sOamYFlipOffsets[shape][size];
                
                gOamData[prevSlot + i].split.y = yPosition - (part1 + offset * 8);
            }
            
            dst++;
        }

        gNextOamSlot = partCount + prevSlot;
    }
}

/**
 * @brief 81bf8 | 104 | Checks if a projectile is on screen
 * 
 */
void ProjectileCheckOnScreen(void)
{
    u16 projY;
    u16 projX;

    u16 bgY;
    u16 bgX;

    u16 var_0;
    u16 yDistance;
    u16 var_2;
    u16 var_3;

    u16 var_4;
    u16 xDistance;
    u16 var_6;
    u16 var_7;

    u16 tmp;
    u16 tmp2;

    if (!(gCurrentProjectile.status & PROJ_STATUS_EXISTS))
        return;

    bgY = gBg1YPosition;
    bgX = gBg1XPosition;

    projY = gCurrentProjectile.yPosition;
    projX = gCurrentProjectile.xPosition;

    var_0 = bgY + BLOCK_SIZE * 4;
    yDistance = projY + BLOCK_SIZE * 4;

    var_2 = var_0 - PIXEL_TO_SUB_PIXEL(gCurrentProjectile.drawDistanceY);
    tmp = PIXEL_TO_SUB_PIXEL(gCurrentProjectile.drawDistanceY) + SCREEN_SIZE_Y_SUB_PIXEL;
    var_3 = var_0 + tmp;

    var_4 = bgX + BLOCK_SIZE * 4;
    xDistance = projX + BLOCK_SIZE * 4;

    var_6 = var_4 - PIXEL_TO_SUB_PIXEL(gCurrentProjectile.drawDistanceX);
    tmp2 = PIXEL_TO_SUB_PIXEL(gCurrentProjectile.drawDistanceX) + SCREEN_SIZE_X_SUB_PIXEL;
    var_7 = var_4 + tmp2;

    if (var_6 < xDistance && xDistance < var_7 && var_2 < yDistance && yDistance < var_3)
    {
        gCurrentProjectile.status |= PROJ_STATUS_ON_SCREEN;
        return;
    }

    gCurrentProjectile.status &= ~PROJ_STATUS_ON_SCREEN;

    if (PROJ_IS_BOMB_OR_FLAKE(gCurrentProjectile.type))
        return;

    yDistance = gSamusData.yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);
    xDistance = gSamusData.xPosition;

    if (projY > yDistance)
        yDistance = projY - yDistance;
    else
        yDistance = yDistance - projY;

    if (projX > xDistance)
        xDistance = projX - xDistance;
    else
        xDistance = xDistance - projX;

    if (yDistance > FRACT_MUL(SCREEN_SIZE_Y_SUB_PIXEL, 6, 5) || xDistance > FRACT_MUL(SCREEN_SIZE_X_SUB_PIXEL, 2, 3))
        gCurrentProjectile.status = 0;
}

void ProjectileLoadEyeCoreXGraphics(void)
{
    u8 spriteId = gCurrentSprite.spriteId;

    if (spriteId == PSPRITE_WAVE_BEAM_CORE_X) {
        DMA_SET(3, sWaveBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 0x18), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sWaveBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 0x19), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sWaveBeamPal, PALRAM_OBJ + 12 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else if (spriteId == PSPRITE_PLASMA_BEAM_CORE_X) {
        DMA_SET(3, sPlasmaBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 0x18), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sPlasmaBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 0x19), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sPlasmaBeamPal, PALRAM_OBJ + 12 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else if (spriteId == PSPRITE_WIDE_BEAM_CORE_X) {
        DMA_SET(3, sWideBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 0x18), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sWideBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 0x19), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sWideBeamPal, PALRAM_OBJ + 12 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else if (spriteId == PSPRITE_CHARGE_BEAM_CORE_X) {
        DMA_SET(3, sChargeBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 0x18), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sChargeBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 0x19), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sChargeBeamPal, PALRAM_OBJ + 12 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else {
        DMA_SET(3, sIceBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 0x18), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sIceBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 0x19), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sIceBeamPal, PALRAM_OBJ + 12 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    }
}

void ProjectileLoadBeamGraphics(void)
{
    u8 beamStatus = gEquipment.beamStatus;

    if (beamStatus & BF_ICE_BEAM) {
        DMA_SET(3, sIceBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 4), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sIceBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 5), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sIceBeamPal, PALRAM_OBJ + 2 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else if (beamStatus & BF_WAVE_BEAM) {
        DMA_SET(3, sWaveBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 4), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sWaveBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 5), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sWaveBeamPal, PALRAM_OBJ + 2 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else if (beamStatus & BF_PLASMA_BEAM) {
        DMA_SET(3, sPlasmaBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 4), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sPlasmaBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 5), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sPlasmaBeamPal, PALRAM_OBJ + 2 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else if (beamStatus & BF_WIDE_BEAM) {
        DMA_SET(3, sWideBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 4), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sWideBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 5), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sWideBeamPal, PALRAM_OBJ + 2 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else if (beamStatus & BF_CHARGE_BEAM) {
        DMA_SET(3, sChargeBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 4), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sChargeBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 5), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sChargeBeamPal, PALRAM_OBJ + 2 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    } else {
        DMA_SET(3, sNormalBeamGfx_Top, VRAM_OBJ_ADDR_COORDS(0, 4), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sNormalBeamGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0, 5), C_32_2_16(DMA_ENABLE, 0x14 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sNormalBeamPal, PALRAM_OBJ + 2 * 32, C_32_2_16(DMA_ENABLE, 5 * sizeof(u16) / 2));
    }
}

void ProjectileLoadMissileGraphics(void)
{
    u8 weaponsStatus = gEquipment.weaponsStatus;

    if (weaponsStatus & MBF_DIFFUSION_MISSILES) {
        DMA_SET(3, sDiffusionMissileGfx_Top, VRAM_OBJ_ADDR_COORDS(0x1c, 4), C_32_2_16(DMA_ENABLE, 4 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sDiffusionMissileGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0x1c, 5), C_32_2_16(DMA_ENABLE, 4 * VRAM_TILE_SIZE / 2));
    } else if (weaponsStatus & MBF_ICE_MISSILES) {
        DMA_SET(3, sIceMissileGfx_Top, VRAM_OBJ_ADDR_COORDS(0x1c, 4), C_32_2_16(DMA_ENABLE, 4 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sIceMissileGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0x1c, 5), C_32_2_16(DMA_ENABLE, 4 * VRAM_TILE_SIZE / 2));
    } else if (weaponsStatus & MBF_SUPER_MISSILES) {
        DMA_SET(3, sSuperMissileGfx_Top, VRAM_OBJ_ADDR_COORDS(0x1c, 4), C_32_2_16(DMA_ENABLE, 4 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sSuperMissileGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0x1c, 5), C_32_2_16(DMA_ENABLE, 4 * VRAM_TILE_SIZE / 2));
    } else if (weaponsStatus & MBF_MISSILES) {
        DMA_SET(3, sNormalMissileGfx_Top, VRAM_OBJ_ADDR_COORDS(0x1c, 4), C_32_2_16(DMA_ENABLE, 4 * VRAM_TILE_SIZE / 2));
        DMA_SET(3, sNormalMissileGfx_Bottom, VRAM_OBJ_ADDR_COORDS(0x1c, 5), C_32_2_16(DMA_ENABLE, 4 * VRAM_TILE_SIZE / 2));
    }
}

/**
 * @brief 820ec | 34 | Loads the projectiles graphics and clears all of the projectiles
 * 
 */
void ProjectileCallLoadGraphicsAndClearProjectiles(void)
{
    s32 i;

    ProjectileLoadBeamGraphics();
    ProjectileLoadMissileGraphics();

    if (gPauseScreenFlag != 0x0)
        return;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
        gProjectileData[i].status = 0;
}

void ProjectileMove(u8 distance)
{
    s16 samusVelocity;
    s16 leftVelocity;
    s16 rightVelocity;

    switch (gCurrentProjectile.direction)
    {
        case ACD_UP:
            gCurrentProjectile.yPosition -= distance;
            return;

        case ACD_DOWN:
            gCurrentProjectile.yPosition += distance;
            return;

        case ACD_DIAGONAL_UP:
            distance = distance * 3 / 4;

            gCurrentProjectile.yPosition -= distance;

            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
                gCurrentProjectile.xPosition += distance;
            else
                gCurrentProjectile.xPosition -= distance;
            break;

        case ACD_DIAGONAL_DOWN:
            distance = distance * 3 / 4;

            gCurrentProjectile.yPosition += distance;

            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
                gCurrentProjectile.xPosition += distance;
            else
                gCurrentProjectile.xPosition -= distance;
            break;

        default:
            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
                gCurrentProjectile.xPosition += distance;
            else
                gCurrentProjectile.xPosition -= distance;
    }

    // Check add samus' velocity if moving in the same direction
    samusVelocity = gSamusData.xVelocity;
    leftVelocity = VELOCITY_TO_SUB_PIXEL(gSamusData.xVelocity);
    rightVelocity = leftVelocity;

    if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
    {
        if (samusVelocity > 0)
            gCurrentProjectile.xPosition += leftVelocity;
    }
    else
    {
        if (samusVelocity < 0)
            gCurrentProjectile.xPosition += rightVelocity;
    }
}

/**
 * @brief 821ec | 40 | Checks if a projectile is hitting a solid block
 * 
 * @return u32 
 */
u32 ProjectileCheckHittingSolid(void)
{
    if (!(gCurrentProjectile.status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT))
    {
        gCurrentClipdataAffectingAction = CAA_NONE;
        return FALSE;
    }

    if (ClipdataProcess(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition) & CLIPDATA_TYPE_SOLID_FLAG)
        return TRUE;

    return FALSE;
}

/**
 * @brief 8222c | 238 | Checks the vertical collision for a projectile
 * 
 * @param pProj Projectile data pointer
 * @return u32 Collision result
 */
u32 ProjectileCheckVerticalCollisionAtPosition(void)
{
    u16 yPosition;
    u16 xPosition;
    u32 clipdata;
    u32 result;
    u16 collisionY;
    u16 collisionX;

    if (!(gCurrentProjectile.status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT))
    {
        gCurrentClipdataAffectingAction = CAA_NONE;
        result = COLLISION_AIR;
        return result;
    }

    yPosition = gCurrentProjectile.yPosition;
    xPosition = gCurrentProjectile.xPosition;
    collisionY = yPosition;
    collisionX = xPosition;

    clipdata = ClipdataProcess(yPosition, xPosition);

    if (clipdata & CLIPDATA_TYPE_SOLID_FLAG)
    {
        result = COLLISION_SOLID;
    }
    else
    {
        result = COLLISION_AIR;
        return result;
    }

    switch (LOW_BYTE(clipdata))
    {
        case CLIPDATA_TYPE_RIGHT_STEEP_FLOOR_SLOPE:
            collisionY = (s16)((yPosition & BLOCK_POSITION_FLAG) - ((xPosition & SUB_PIXEL_POSITION_FLAG) - 0x3F));
            collisionX = (s16)((xPosition & BLOCK_POSITION_FLAG) - ((yPosition & SUB_PIXEL_POSITION_FLAG) - SUB_PIXEL_POSITION_FLAG));
            result = COLLISION_RIGHT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_LOWER_SLIGHT_FLOOR_SLOPE:
            collisionY = (s16)((yPosition & BLOCK_POSITION_FLAG) - (((xPosition & SUB_PIXEL_POSITION_FLAG) >> 1) - 0x3F));
            collisionX = (xPosition & BLOCK_POSITION_FLAG) - (((yPosition & SUB_PIXEL_POSITION_FLAG) << 1) - 0x7E);
            result = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_UPPER_SLIGHT_FLOOR_SLOPE:
            collisionY = (s16)((yPosition & BLOCK_POSITION_FLAG) - (((xPosition & SUB_PIXEL_POSITION_FLAG) >> 1) - 0x1F));
            collisionX = (xPosition & BLOCK_POSITION_FLAG) - (((yPosition & SUB_PIXEL_POSITION_FLAG) << 1) - 0x3E);
            result = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_STEEP_FLOOR_SLOPE:
            collisionY = (yPosition & BLOCK_POSITION_FLAG) | (xPosition & SUB_PIXEL_POSITION_FLAG);
            collisionX = (xPosition & BLOCK_POSITION_FLAG) | (yPosition & SUB_PIXEL_POSITION_FLAG);
            result = COLLISION_LEFT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_LOWER_SLIGHT_FLOOR_SLOPE:
            collisionY = (yPosition & BLOCK_POSITION_FLAG) | (((xPosition & SUB_PIXEL_POSITION_FLAG) >> 1) + 0x1F);
            collisionX = (xPosition & BLOCK_POSITION_FLAG) + (((yPosition & SUB_PIXEL_POSITION_FLAG) << 1) - 0x3F);
            result = COLLISION_LEFT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_UPPER_SLIGHT_FLOOR_SLOPE:
            collisionY = (yPosition & BLOCK_POSITION_FLAG) | ((xPosition & SUB_PIXEL_POSITION_FLAG) >> 1);
            collisionX = (xPosition & BLOCK_POSITION_FLAG) + (((yPosition & SUB_PIXEL_POSITION_FLAG) << 1));
            result = COLLISION_LEFT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_PASS_THROUGH_BOTTOM:
            collisionY = yPosition & BLOCK_POSITION_FLAG;
            result = COLLISION_PASS_THROUGH_BOTTOM;
            break;

        default:
            collisionY = yPosition & BLOCK_POSITION_FLAG;
            collisionX = xPosition & BLOCK_POSITION_FLAG;
            if (!(gCurrentProjectile.status & PROJ_STATUS_X_FLIP))
                collisionX += BLOCK_SIZE;
            break;
    }

    switch (gCurrentProjectile.direction)
    {
        case ACD_DIAGONAL_UP:
        case ACD_DIAGONAL_DOWN:
            if (result == COLLISION_PASS_THROUGH_BOTTOM)
                result = COLLISION_AIR;
            break;

        case ACD_UP:
            if (result == COLLISION_SOLID)
                gCurrentProjectile.yPosition = collisionY + BLOCK_SIZE;
            else
                result = COLLISION_AIR;
            break;

        case ACD_DOWN:
            if (yPosition >= collisionY)
                gCurrentProjectile.yPosition = collisionY;
            else
                result = COLLISION_AIR;
            break;

        default:
            if (result != 0xC)
            {
                if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
                {
                    if (xPosition >= collisionX)
                        gCurrentProjectile.xPosition = collisionX;
                    else
                        result = COLLISION_AIR;
                }
                else
                {
                    if (xPosition <= collisionX)
                        gCurrentProjectile.xPosition = collisionX;
                    else
                        result = COLLISION_AIR;
                }
            }
            else
                result = COLLISION_AIR;
            break;
    }

    return result;
}

void ProjectileMovePart(void)
{
    u16 diagonalMovement = PIXEL_SIZE;
    u16 straightMovement = diagonalMovement * 1.4;

    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP) {
                if (gCurrentProjectile.part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                }
            } else {
                if (gCurrentProjectile.part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                }
            }
            break;
        case ACD_DIAGONAL_UP:
            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP) {
                if (gCurrentProjectile.part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                }
            } else {
                if (gCurrentProjectile.part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                }
            }
            break;
        case ACD_UP:
        case ACD_DOWN:
            if (gCurrentProjectile.part == 1)
                gCurrentProjectile.xPosition -= straightMovement;
            else
                gCurrentProjectile.xPosition += straightMovement;
            break;
        case ACD_FORWARD:
        default:
            if (gCurrentProjectile.part == 1)
                gCurrentProjectile.yPosition -= straightMovement;
            else
                gCurrentProjectile.yPosition += straightMovement;
            break;
    }
}

void ProjectileMoveWaveBeamParts(void)
{
    u8 offset = MOD_AND(gCurrentProjectile.timer, 8);
    u16 diagonalMovement = sWaveBeamPartVelocity[offset];
    u16 straightMovement = diagonalMovement * 1.4;
    u8 part = gCurrentProjectile.part;

    if (offset >= 4) {
        if (part == 1)
            part = 2;
        else if (part == 2)
            part = 1;
    }

    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP) {
                if (part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                }
            } else {
                if (part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                }
            }
            break;
        case ACD_DIAGONAL_UP:
            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP) {
                if (part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                }
            } else {
                if (part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                }
            }
            break;
        case ACD_UP:
        case ACD_DOWN:
            if (part == 1)
                gCurrentProjectile.xPosition -= straightMovement;
            else
                gCurrentProjectile.xPosition += straightMovement;
            break;
        case ACD_FORWARD:
        default:
            if (part == 1)
                gCurrentProjectile.yPosition -= straightMovement;
            else
                gCurrentProjectile.yPosition += straightMovement;
            break;
    }
}

void ProjectileMoveWaveBeamParts_Unused(void)
{
    u8 offset = MOD_AND(gCurrentProjectile.timer, 16);
    u16 diagonalMovement = sWaveBeamPartVelocity_Unused[offset];
    u16 straightMovement = diagonalMovement * 1.4;
    u8 part = gCurrentProjectile.part;

    if (offset >= 8) {
        if (part == 1)
            part = 2;
        else if (part == 2)
            part = 1;
    }

    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP) {
                if (part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                }
            } else {
                if (part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                }
            }
            break;
        case ACD_DIAGONAL_UP:
            if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP) {
                if (part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                }
            } else {
                if (part == 1) {
                    gCurrentProjectile.yPosition -= diagonalMovement;
                    gCurrentProjectile.xPosition += diagonalMovement;
                } else {
                    gCurrentProjectile.yPosition += diagonalMovement;
                    gCurrentProjectile.xPosition -= diagonalMovement;
                }
            }
            break;
        case ACD_UP:
        case ACD_DOWN:
            if (part == 1)
                gCurrentProjectile.xPosition -= straightMovement;
            else
                gCurrentProjectile.xPosition += straightMovement;
            break;
        case ACD_FORWARD:
        default:
            if (part == 1)
                gCurrentProjectile.yPosition -= straightMovement;
            else
                gCurrentProjectile.yPosition += straightMovement;
            break;
    }
}

void ProjectileSetMissileTrail(u8 particle, u8 delay)
{
    if ((gCurrentProjectile.part & delay) == 0) {
        u16 movement = 0x20;
        u16 y = gCurrentProjectile.yPosition;
        u16 x = gCurrentProjectile.xPosition;
        u16 particleY, particleX;
        switch (gCurrentProjectile.direction) {
            case ACD_UP:
                y += movement;
                break;
            case ACD_DOWN:
                y -= movement;
                break;
            case ACD_DIAGONAL_UP:
                y += movement * 3 / 4;
                if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
                    x -= movement * 3 / 4;
                else
                    x += movement * 3 / 4;
                break;
            case ACD_DIAGONAL_DOWN:
                y -= movement * 3 / 4;
                if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP) {
                    x -= movement * 3 / 4;
                } else {
                    x += movement * 3 / 4;
                }
                break;
            default:
                if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
                    x -= movement;
                else
                    x += movement;
                break;
        }
        ParticleSet(y, x, particle);
    }
    gCurrentProjectile.part++;
}

void ProjectileSetBeamTrail(u8 particle, u8 delay)
{
    if ((gCurrentProjectile.timer & delay) == 0) {
        u16 movement = 0x20;
        u16 y = gCurrentProjectile.yPosition;
        u16 x = gCurrentProjectile.xPosition;
        u16 particleY, particleX;
        switch (gCurrentProjectile.direction) {
            case ACD_UP:
                y += movement;
                break;
            case ACD_DOWN:
                y -= movement;
                break;
            case ACD_DIAGONAL_UP:
                y += movement * 3 / 4;
                if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
                    x -= movement * 3 / 4;
                else
                    x += movement * 3 / 4;
                break;
            case ACD_DIAGONAL_DOWN:
                y -= movement * 3 / 4;
                if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP) {
                    x -= movement * 3 / 4;
                } else {
                    x += movement * 3 / 4;
                }
                break;
            default:
                if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
                    x -= movement;
                else
                    x += movement;
                break;
        }
        ParticleSet(y, x, particle);
    }
}

/**
 * @brief 82888 | 764 | Checks if the projectiles are hitting sprite
 * 
 */
void ProjectileCheckHittingSprite(void)
{
    u8 i;
    u8 j;
    u8 drawOrder;
    u16 xCheck;
    u32 contactDamage;
    u16 spriteCheck;

    u16 o1Y;
    u16 o1X;
    u16 o1Top;
    u16 o1Bottom;
    u16 o1Left;
    u16 o1Right;

    u16 o2Y;
    u16 o2X;
    u16 o2Top;
    u16 o2Bottom;
    u16 o2Left;
    u16 o2Right;

    if (gCurrentPowerBomb.animationState != 0 && gEquipment.weaponsStatus & MBF_POWER_BOMBS)
    {
        o1Y = gCurrentPowerBomb.yPosition;
        o1X = gCurrentPowerBomb.xPosition;

        o1Top = o1Y + gCurrentPowerBomb.hitboxTop;
        o1Bottom = o1Y + gCurrentPowerBomb.hitboxBottom;
        o1Left = o1X + gCurrentPowerBomb.hitboxLeft;
        o1Right = o1X + gCurrentPowerBomb.hitboxRight;

        spriteCheck = SS_EXISTS | SS_HIDDEN | SS_IGNORE_PROJECTILES;
        xCheck = SS_EXISTS | SS_HIDDEN;

        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
            {
                if ((gSpriteData[i].status & spriteCheck) != SS_EXISTS)
                    continue;

                if (gSpriteData[i].health == 0)
                    continue;

                if (gSpriteData[i].invincibilityStunFlashTimer & 0x80)
                    continue;

                o2Y = gSpriteData[i].yPosition;
                o2X = gSpriteData[i].xPosition;

                o2Top = o2Y + gSpriteData[i].hitboxTop;
                o2Bottom = o2Y + gSpriteData[i].hitboxBottom;
                o2Left = o2X + gSpriteData[i].hitboxLeft;
                o2Right = o2X + gSpriteData[i].hitboxRight;

                if (SpriteUtilCheckObjectsTouching(o2Top, o2Bottom, o2Left, o2Right, o1Top, o1Bottom, o1Left, o1Right))
                {
                    ProjectilePowerBombHitSprite(i);
                }
            }
            else
            {
                if ((gSpriteData[i].status & xCheck) != SS_EXISTS)
                    continue;

                if (gSpriteData[i].health == 0)
                    continue;

                o2Y = gSpriteData[i].yPosition;
                o2X = gSpriteData[i].xPosition;

                o2Top = o2Y + gSpriteData[i].hitboxTop;
                o2Bottom = o2Y + gSpriteData[i].hitboxBottom;
                o2Left = o2X + gSpriteData[i].hitboxLeft;
                o2Right = o2X + gSpriteData[i].hitboxRight;

                if (SpriteUtilCheckObjectsTouching(o2Top, o2Bottom, o2Left, o2Right, o1Top, o1Bottom, o1Left, o1Right))
                {
                    ProjectileSetIsftForPowerBomb(i);
                }
                else
                {
                    ProjectileBringSpriteToPowerBombCenter(i);
                }
            }
        }
    }

    contactDamage = 0x0;

    if (SpriteUtilCheckSamusDamagingPose())
        contactDamage = 0x1;
    else if (SpriteUtilCheckSamusSudoScrew(0x80))
        contactDamage = 0x2;

    if (contactDamage != 0x0)
    {
        o1Y = gSamusData.yPosition;
        o1X = gSamusData.xPosition;

        o1Top = o1Y + gSamusData.drawDistanceTop;
        o1Bottom = o1Y + gSamusData.drawDistanceBottom;
        o1Left = o1X + gSamusData.drawDistanceLeft;
        o1Right = o1X + gSamusData.drawDistanceRight;

        spriteCheck = SS_EXISTS | SS_HIDDEN | SS_IGNORE_PROJECTILES;

        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if ((gSpriteData[i].status & spriteCheck) != SS_EXISTS)
                continue;

            if (gSpriteData[i].health == 0)
                continue;

            o2Y = gSpriteData[i].yPosition;
            o2X = gSpriteData[i].xPosition;

            o2Top = o2Y + gSpriteData[i].hitboxTop;
            o2Bottom = o2Y + gSpriteData[i].hitboxBottom;
            o2Left = o2X + gSpriteData[i].hitboxLeft;
            o2Right = o2X + gSpriteData[i].hitboxRight;

            if (SpriteUtilCheckObjectsTouching(o2Top, o2Bottom, o2Left, o2Right, o1Top, o1Bottom, o1Left, o1Right) && gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
            {
                if (contactDamage == 0x1)
                    ProjectileContactDamageHitSprite(i, o2Top + (o2Bottom - o2Top) / 2, o2Left + (o2Right - o2Left) / 2);
                else if (contactDamage == 0x2)
                    ProjectileSudoScrewHitSprite(i, o2Top + (o2Bottom - o2Top) / 2, o2Left + (o2Right - o2Left) / 2);
            }
        }
    }

    spriteCheck = SS_EXISTS | SS_HIDDEN | SS_IGNORE_PROJECTILES;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if ((gSpriteData[i].status & spriteCheck) == SS_EXISTS && gSpriteData[i].health != 0)
            gSpriteDrawOrder[i] = gSpriteData[i].drawOrder;
        else
            gSpriteDrawOrder[i] = 0;
    }

    for (drawOrder = 1; drawOrder < 17; drawOrder++)
    {
        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if (gSpriteDrawOrder[i] != drawOrder)
                continue;

            o1Y = gSpriteData[i].yPosition;
            o1X = gSpriteData[i].xPosition;

            o1Top = o1Y + gSpriteData[i].hitboxTop;
            o1Bottom = o1Y + gSpriteData[i].hitboxBottom;
            o1Left = o1X + gSpriteData[i].hitboxLeft;
            o1Right = o1X + gSpriteData[i].hitboxRight;

            spriteCheck = PROJ_STATUS_EXISTS | PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;

            for (j = 0; j < MAX_AMOUNT_OF_PROJECTILES; j++)
            {
                if ((gProjectileData[j].status & spriteCheck) != spriteCheck)
                    continue;

                o2Y = gProjectileData[j].yPosition;
                o2X = gProjectileData[j].xPosition;

                o2Top = o2Y + gProjectileData[j].hitboxTop;
                o2Bottom = o2Y + gProjectileData[j].hitboxBottom;
                o2Left = o2X + gProjectileData[j].hitboxLeft;
                o2Right = o2X + gProjectileData[j].hitboxRight;

                if (!SpriteUtilCheckObjectsTouching(o1Top, o1Bottom, o1Left, o1Right, o2Top, o2Bottom, o2Left, o2Right))
                    continue;

                switch (gProjectileData[j].type)
                {
                    case PROJ_TYPE_NORMAL_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileNormalBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_CHARGE_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileChargeBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cc8(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_WIDE_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileWideBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_PLASMA_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectilePlasmaBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_WAVE_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileWaveBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_CHARGED_NORMAL_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileChargedNormalBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_CHARGED_CHARGE_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileChargedChargeBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cc8(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_CHARGED_WIDE_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileChargedWideBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_CHARGED_PLASMA_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileChargedPlasmaBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_CHARGED_WAVE_BEAM:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileChargedWaveBeamHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_FLARE:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileFlareHitSprite(i, o2Y, o2X, o1Y, o1X);
                        else
                            gSpriteData[i].invincibilityStunFlashTimer = 0x78;
                        break;

                    case PROJ_TYPE_NORMAL_MISSILE:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileNormalMissileHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84ce4(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_SUPER_MISSILE:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileSuperMissileHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84ce4(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_ICE_MISSILE:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileIceMissileHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84ce4(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_DIFFUSION_MISSILE:
                    case PROJ_TYPE_CHARGED_DIFFUSION_MISSILE:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileDiffusionMissileHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84ce4(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_DIFFUSION_FLAKE:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileDiffusionFlakeHitSprite(i, j, o2Y, o2X);
                        else
                            unk_84ce4(i, j, o2Y, o2X);
                        break;

                    case PROJ_TYPE_BOMB:
                        if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
                            ProjectileBombHitSprite(i, o2Y, o2X);
                        else
                            unk_84cac(i, j, o2Y, o2X);
                        break;
                }
            }
        }
    }
}

/**
 * @brief 82fec | 58 | Checks if a sprite can create debris
 * 
 * @param spriteSlot Sprite slot
 * @return u16 can create debris
 */
u16 ProjectileCheckSpriteCreateDebris(u8 spriteSlot)
{
    u16 sdr;
    
    if (gSpriteData[spriteSlot].properties & SP_SECONDARY_SPRITE)
        sdr = GET_SSPRITE_SUIT_REDUCTION(gSpriteData[spriteSlot].spriteId);
    else
        sdr = GET_PSPRITE_SUIT_REDUCTION(gSpriteData[spriteSlot].spriteId);

    sdr &= SDRT_CAN_CREATE_DEBRIS;

    return sdr;
}

/**
 * @brief 83044 | 4c | Gets the weakness of a sprite
 * 
 * @param spriteSlot Sprite slot
 * @return u16 Weakness
 */
u16 ProjectileGetSpriteWeakness(u8 spriteSlot)
{
    u16 weakness;
    
    if (gSpriteData[spriteSlot].properties & SP_SECONDARY_SPRITE)
        weakness = GET_SSPRITE_WEAKNESS(gSpriteData[spriteSlot].spriteId);
    else
        weakness = GET_PSPRITE_WEAKNESS(gSpriteData[spriteSlot].spriteId);

    return weakness;
}

/**
 * @brief 83090 | 134 | Spawns random sprite debris at the given location
 * 
 * @param cloudType Cloud type
 * @param flashTimer Flash timer
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileRandomSpriteDebris(u8 cloudType, u8 flashTimer, u16 yPosition, u16 xPosition)
{
    switch (flashTimer)
    {
        case 0x5:
            if (MOD_AND(gFrameCounter8Bit, 2))
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_RIGHT, yPosition - EIGHTH_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
            }
            else
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_LEFT, yPosition + EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
            }
            break;

        case 0x9:
            if (MOD_AND(gFrameCounter8Bit, 2))
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_RIGHT, yPosition - EIGHTH_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition + EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
            }
            else
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_LEFT, yPosition - EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_RIGHT, yPosition, xPosition + EIGHTH_BLOCK_SIZE);
            }
            break;

        case 0x11:
            if (MOD_AND(gFrameCounter8Bit, 2))
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_LEFT, yPosition - EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_RIGHT, yPosition - QUARTER_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition + EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
            }
            else
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_RIGHT, yPosition - QUARTER_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_RIGHT, yPosition + EIGHTH_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition + QUARTER_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
            }
            break;
    }

    SoundPlay(0x1BF);
}

/**
 * @brief 831c4 | f8 | Spawns random sprite debris at the given location (for a pierce)
 * 
 * @param cloudType Cloud type
 * @param flashTimer Flash timer
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileRandomSpriteDebrisPiercing(u8 cloudType, u8 flashTimer, u16 yPosition, u16 xPosition)
{
    switch (flashTimer)
    {
        case 0x5:
            if (MOD_AND(gFrameCounter8Bit, 2))
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_RIGHT, yPosition - EIGHTH_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
            }
            else
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_LEFT, yPosition + EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
            }
            break;

        case 0x9:
            if (MOD_AND(gFrameCounter8Bit, 2))
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_RIGHT, yPosition - EIGHTH_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition + EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
            }
            else
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_LEFT, yPosition - EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_RIGHT, yPosition, xPosition + EIGHTH_BLOCK_SIZE);
            }
            break;

        case 0x11:
            if (MOD_AND(gFrameCounter8Bit, 2))
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_LEFT, yPosition - EIGHTH_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
            }
            else
            {
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_SLOW_RIGHT, yPosition - QUARTER_BLOCK_SIZE, xPosition + EIGHTH_BLOCK_SIZE);
                SpriteDebrisInit(cloudType, DEBRIS_TYPE_HOPPING_FAST_LEFT, yPosition + QUARTER_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE);
            }
            break;
    }

    SoundPlay(0x1BF);
}

/**
 * @brief 832bc | 30 | Sets the isft for a sprite hit by a power bomb
 * 
 * @param spriteSlot Sprite slot
 */
void ProjectileSetIsftForPowerBomb(u8 spriteSlot)
{
    if (gSpriteData[spriteSlot].ignoreSamusCollisionTimer == 0)
    {
        SPRITE_SET_ISFT(gSpriteData[spriteSlot], 0x80);
    }
}

/**
 * @brief 832ec | 84 | Brings a sprite to the center of the power bomb
 * 
 * @param spriteSlot Sprite slot
 */
void ProjectileBringSpriteToPowerBombCenter(u8 spriteSlot)
{
    u16 spriteY;
    u16 spriteX;
    u16 powerBombY;
    u16 powerBombX;
    u16 xSpeed;

    if (gCurrentPowerBomb.animationState != 4)
        return;

    if (gSpriteData[spriteSlot].ignoreSamusCollisionTimer != 0)
        return;

    if (!(gSpriteData[spriteSlot].invincibilityStunFlashTimer & 0x80))
        return;

    spriteY = gSpriteData[spriteSlot].yPosition;
    spriteX = gSpriteData[spriteSlot].xPosition;
    powerBombY = gCurrentPowerBomb.yPosition;
    powerBombX = gCurrentPowerBomb.xPosition;

    xSpeed = QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;

    if (spriteY > powerBombY)
    {
        spriteY -= QUARTER_BLOCK_SIZE + PIXEL_SIZE;
    }
    else if (spriteY < powerBombY)
    {
        u32 tmp = QUARTER_BLOCK_SIZE + PIXEL_SIZE + 0x10000; // Needed to produce matching ASM.
        tmp++, tmp--;
        spriteY += tmp;
    }

    if (spriteX > powerBombX)
    {
        spriteX -= xSpeed;
    }
    else if (spriteX < powerBombX)
    {
        spriteX += xSpeed;
    }

    gSpriteData[spriteSlot].yPosition = spriteY;
    gSpriteData[spriteSlot].xPosition = spriteX;
}

/**
 * @brief 83370 | 104 | Handles a power bomb hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 */
void ProjectilePowerBombHitSprite(u8 spriteSlot)
{
    u8 props;
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
        return;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        return;
    }

    if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_POWER_BOMB)
    {
        if (gSpriteData[spriteSlot].health > 0x32)
        {
            gSpriteData[spriteSlot].health -= 0x32;
        }
        else
        {
            gSpriteData[spriteSlot].health = 0;
            gSpriteData[spriteSlot].properties |= SP_DESTROYED;
            gSpriteData[spriteSlot].freezeTimer = 0;
            gSpriteData[spriteSlot].paletteRow = 0;

            if (gSpriteData[spriteSlot].standingOnSprite != 0 && gSamusData.standingStatus == STANDING_ENEMY)
                gSamusData.standingStatus = STANDING_MID_AIR;

            props = gSpriteData[spriteSlot].spritesetSlotAndProperties - 0x20;

            if (props < 0x30)
            {
                gSpriteData[spriteSlot].pose = SPRITE_POSE_DYING_INIT;
                gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 1;
            }
            else
            {
                gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 40;
            }
        }

        isft = 17;
    }
    else
    {
        isft = 2;
    }
    
    if (SPRITE_HAS_ISFT(gSpriteData[spriteSlot]) < isft)
        gSpriteData[spriteSlot].invincibilityStunFlashTimer = 0x80 | isft;
    else
        SPRITE_SET_ISFT(gSpriteData[spriteSlot], 0x80);
}

/**
 * @brief 83474 | 184 | Handles a sprite getting damage with samus contact
 * 
 * @param spriteSlot Sprite slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileContactDamageHitSprite(u8 spriteSlot, u16 yPosition, u16 xPosition)
{
    u8 props;
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
        return;

    if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        if (gSpriteData[spriteSlot].spriteId != PSPRITE_SA_X_BOSS && gSpriteData[spriteSlot].spriteId != PSPRITE_GOLD_ZEBESIAN)
            return;
    }

    if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK)
    {
        gSpriteData[spriteSlot].health = 0;
        gSpriteData[spriteSlot].properties |= SP_DESTROYED;
        gSpriteData[spriteSlot].freezeTimer = 0;
        gSpriteData[spriteSlot].paletteRow = 0;

        if (gSpriteData[spriteSlot].standingOnSprite != 0 && gSamusData.standingStatus == STANDING_ENEMY)
            gSamusData.standingStatus = STANDING_MID_AIR;

        props = gSpriteData[spriteSlot].spritesetSlotAndProperties - 0x20;

        if (props < 0x30)
        {
            gSpriteData[spriteSlot].pose = SPRITE_POSE_DYING_INIT;
            gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 1;
        }
        else
        {
            gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 40;
        }

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            if (gSamusData.pose == SPOSE_SCREW_ATTACKING)
                ParticleSet(yPosition, xPosition, 0x3D);
            else if (gSamusData.pose == SPOSE_SHINESPARKING)
                ParticleSet(yPosition, xPosition, 0x3F);
            else
                ParticleSet(yPosition, xPosition, 0x3E);
        }
    }
    else
    {
        if (gSpriteData[spriteSlot].spriteId == PSPRITE_SA_X_BOSS)
        {
            ProjecileDealDamage(spriteSlot, 10);

            if (gSamusData.xPosition > gSpriteData[spriteSlot].xPosition)
                gSamusData.direction = KEY_LEFT;
            else
                gSamusData.direction = KEY_RIGHT;

            SpriteUtilTakeDamageFromSprite(TRUE, spriteSlot, 1);
            return;
        }

        isft = 2;
    }
    
    if (SPRITE_HAS_ISFT(gSpriteData[spriteSlot]) < isft)
    {
        SPRITE_CLEAR_AND_SET_ISFT(gSpriteData[spriteSlot], isft);
    }
}

/**
 * @brief 835f8 | cc | Handles a projectile dealing damage to a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param damage Damage
 * @return u8 Isft
 */
u8 ProjecileDealDamage(u8 spriteSlot, u16 damage)
{
    u8 isft;
    u8 props;

    if (gSpriteData[spriteSlot].health > damage)
    {
        gSpriteData[spriteSlot].health -= damage;

        isft = 5;

        if (damage > 2)
        {
            if (damage <= 3)
                isft = 9;
            else
                isft = 17;
        }
    }
    else
    {
        gSpriteData[spriteSlot].health = 0;
        gSpriteData[spriteSlot].properties |= SP_DESTROYED;
        gSpriteData[spriteSlot].freezeTimer = 0;
        gSpriteData[spriteSlot].paletteRow = 0;

        if (gSpriteData[spriteSlot].standingOnSprite != 0 && gSamusData.standingStatus == STANDING_ENEMY)
            gSamusData.standingStatus = STANDING_MID_AIR;

        props = gSpriteData[spriteSlot].spritesetSlotAndProperties - 0x20;

        if (props < 0x30)
        {
            gSpriteData[spriteSlot].pose = SPRITE_POSE_DYING_INIT;
            gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 1;
        }
        else
        {
            gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 40;
        }

        isft = 17;
    }

    if (SPRITE_HAS_ISFT(gSpriteData[spriteSlot]) < isft)
    {
        SPRITE_CLEAR_AND_SET_ISFT(gSpriteData[spriteSlot], isft);
    }

    return isft;
}

/**
 * @brief 836c4 | c4 | Handles a sprite getting hit by a sudo screw
 * 
 * @param spriteSlot Sprite slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileSudoScrewHitSprite(u8 spriteSlot, u16 yPosition, u16 xPosition)
{
    u16 damage;
    u8 flags;

    if (gSpriteData[spriteSlot].properties & (SP_SOLID_FOR_PROJECTILES | SP_IMMUNE_TO_PROJECTILES))
        return;

    if (!(ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS)))
        return;

    gSamusData.chargeBeamCounter = 0;
    damage = NORMAL_BEAM_SUDO_SCREW_DAMAGE;

    flags = gEquipment.beamStatus;

    if (flags & BF_ICE_BEAM)
        damage = ICE_BEAM_SUDO_SCREW_DAMAGE;
    else if (flags & BF_WAVE_BEAM)
        damage = WAVE_BEAM_SUDO_SCREW_DAMAGE;
    else if (flags & BF_PLASMA_BEAM)
        damage = PLASMA_BEAM_SUDO_SCREW_DAMAGE;
    else if (flags & BF_WIDE_BEAM)
        damage = WIDE_BEAM_SUDO_SCREW_DAMAGE;
    else if (flags & BF_CHARGE_BEAM)
        damage = CHARGE_BEAM_SUDO_SCREW_DAMAGE;

    if (damage == 0)
        return;

    ProjecileDealDamage(spriteSlot, damage);

    if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        ParticleSet(yPosition, xPosition, 0x40);

    if (gSpriteData[spriteSlot].health != 0)
        gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 0;
}

/**
 * @brief 83788 | 168 | Handles an ice missile dealing damage to a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param damage Damage
 * @return u8 Isft
 */
u8 ProjectileIceMissileDealDamage(u8 spriteSlot, u8 projectileSlot, u16 damage)
{
    u8 flashTimer;
    u8 freezeTimer;
    u8 props;
    u16 weakness;

    flashTimer = 0;
    freezeTimer = 0;

    weakness = ProjectileGetSpriteWeakness(spriteSlot);

    if (weakness & (WEAKNESS_SUPER_MISSILES | WEAKNESS_MISSILES))
    {
        if (gSpriteData[spriteSlot].health > damage)
        {
            gSpriteData[spriteSlot].health -= damage;
            flashTimer = 17;

            if (weakness & WEAKNESS_CAN_BE_FROZEN)
                freezeTimer = 60 * 4;
        }
        else
        {
            flashTimer = 17;

            if (weakness & WEAKNESS_CAN_BE_FROZEN && gSpriteData[spriteSlot].freezeTimer == 0)
            {
                gSpriteData[spriteSlot].health = 1;
                freezeTimer = 60 * 4;
            }
            else
            {
                gSpriteData[spriteSlot].health = 0;
                gSpriteData[spriteSlot].properties |= SP_DESTROYED;
                gSpriteData[spriteSlot].freezeTimer = 0;
                gSpriteData[spriteSlot].paletteRow = 0;

                if (gSpriteData[spriteSlot].standingOnSprite != 0 && gSamusData.standingStatus == STANDING_ENEMY)
                    gSamusData.standingStatus = STANDING_MID_AIR;

                props = gSpriteData[spriteSlot].spritesetSlotAndProperties - 0x20;

                if (props < 0x30)
                {
                    gSpriteData[spriteSlot].pose = SPRITE_POSE_DYING_INIT;
                    gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 1;
                }
                else
                {
                    gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 40;
                }
            }
        }
    
        if (SPRITE_HAS_ISFT(gSpriteData[spriteSlot]) < flashTimer)
        {
            SPRITE_CLEAR_AND_SET_ISFT(gSpriteData[spriteSlot], flashTimer);
        }
    }
    else
    {
        freezeTimer = 60 * 4;
    }

    if (freezeTimer != 0)
    {
        gSpriteData[spriteSlot].standingOnSprite = FALSE;
        gSpriteData[spriteSlot].freezeTimer = freezeTimer;
        SPRITE_SET_ABSOLUTE_PALETTE_ROW(gSpriteData[spriteSlot], SPRITE_FROZEN_PALETTE_ROW);
        SoundPlayNotAlreadyPlaying(0x146);
    }

    return flashTimer;
}

/**
 * @brief 838f0 | 15c | Handles a diffusion flake dealing damage to a sprite
 * 
 * @param spriteSlot 
 * @param projectileSlot 
 * @return u8 
 */
u8 ProjectileDiffusionFlakeDealDamage(u8 spriteSlot, u8 projectileSlot)
{
    u8 flashTimer;
    u8 freezeTimer;
    u8 props;
    u16 weakness;

    flashTimer = 0;
    freezeTimer = 0;

    weakness = ProjectileGetSpriteWeakness(spriteSlot);

    if (weakness & (WEAKNESS_SUPER_MISSILES | WEAKNESS_MISSILES))
    {
        if (gSpriteData[spriteSlot].health > 1)
        {
            gSpriteData[spriteSlot].health -= 1;
            flashTimer = 5;

            if (weakness & WEAKNESS_CAN_BE_FROZEN)
                freezeTimer = 60 * 4;
        }
        else
        {
            flashTimer = 17;

            if (weakness & WEAKNESS_CAN_BE_FROZEN && gSpriteData[spriteSlot].freezeTimer == 0)
            {
                gSpriteData[spriteSlot].health = 1;
                freezeTimer = 60 * 4;
            }
            else
            {
                gSpriteData[spriteSlot].health = 0;
                gSpriteData[spriteSlot].properties |= SP_DESTROYED;
                gSpriteData[spriteSlot].freezeTimer = 0;
                gSpriteData[spriteSlot].paletteRow = 0;

                if (gSpriteData[spriteSlot].standingOnSprite != 0 && gSamusData.standingStatus == STANDING_ENEMY)
                    gSamusData.standingStatus = STANDING_MID_AIR;

                props = gSpriteData[spriteSlot].spritesetSlotAndProperties - 0x20;

                if (props < 0x30)
                {
                    gSpriteData[spriteSlot].pose = SPRITE_POSE_DYING_INIT;
                    gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 1;
                }
                else
                {
                    gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 40;
                }
            }
        }
    
        if (SPRITE_HAS_ISFT(gSpriteData[spriteSlot]) < flashTimer)
        {
            SPRITE_CLEAR_AND_SET_ISFT(gSpriteData[spriteSlot], flashTimer);
        }
    }
    else
    {
        freezeTimer = 60 * 4;
    }

    if (freezeTimer != 0)
    {
        gSpriteData[spriteSlot].standingOnSprite = FALSE;
        gSpriteData[spriteSlot].freezeTimer = freezeTimer;
        SPRITE_SET_ABSOLUTE_PALETTE_ROW(gSpriteData[spriteSlot], SPRITE_FROZEN_PALETTE_ROW);
        SoundPlayNotAlreadyPlaying(0x146);
    }

    return flashTimer;
}

/**
 * @brief 83a4c | 12c | Handles an ice beam delaing damage to a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param damage Damage
 * @return u8 Isft
 */
u8 ProjectileIceBeamDealDamage(u8 spriteSlot, u8 projectileSlot, u16 damage)
{
    u8 flashTimer;
    u8 freezeTimer;
    u8 props;
    u16 weakness;

    flashTimer = 0;
    freezeTimer = 0;

    weakness = ProjectileGetSpriteWeakness(spriteSlot);

    if (weakness & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS))
    {
        if (gSpriteData[spriteSlot].health > damage)
        {
            gSpriteData[spriteSlot].health -= damage;
            flashTimer = 17;

            if (weakness & WEAKNESS_CAN_BE_FROZEN)
                freezeTimer = 60 * 4;
        }
        else
        {
            flashTimer = 17;

            gSpriteData[spriteSlot].health = 0;
            gSpriteData[spriteSlot].properties |= SP_DESTROYED;
            gSpriteData[spriteSlot].freezeTimer = 0;
            gSpriteData[spriteSlot].paletteRow = 0;

            if (gSpriteData[spriteSlot].standingOnSprite != 0 && gSamusData.standingStatus == STANDING_ENEMY)
                gSamusData.standingStatus = STANDING_MID_AIR;

            props = gSpriteData[spriteSlot].spritesetSlotAndProperties - 0x20;

            if (props < 0x30)
            {
                gSpriteData[spriteSlot].pose = SPRITE_POSE_DYING_INIT;
                gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 1;
            }
            else
            {
                gSpriteData[spriteSlot].ignoreSamusCollisionTimer = 40;
            }
        }

        if (SPRITE_HAS_ISFT(gSpriteData[spriteSlot]) < flashTimer)
        {
            SPRITE_CLEAR_AND_SET_ISFT(gSpriteData[spriteSlot], flashTimer);
        }
    }
    else
    {
        freezeTimer = 60 * 4;
    }

    if (freezeTimer != 0)
    {
        gSpriteData[spriteSlot].standingOnSprite = FALSE;
        gSpriteData[spriteSlot].freezeTimer = freezeTimer;
        SPRITE_SET_ABSOLUTE_PALETTE_ROW(gSpriteData[spriteSlot], SPRITE_FROZEN_PALETTE_ROW);
        SoundPlayNotAlreadyPlaying(0x146);
    }

    return flashTimer;
}

/**
 * @brief 83b78 | 34 | Sets the isft for a solid sprite
 * 
 * @param spriteSlot Sprite slot
 * @return u32 Garbage
 */
u32 ProjectileSetIsftForSolid(u8 spriteSlot)
{
    u8 isft;

    isft = 2;
    if (SPRITE_HAS_ISFT(gSpriteData[spriteSlot]) < isft)
    {
        SPRITE_CLEAR_AND_SET_ISFT(gSpriteData[spriteSlot], isft);
    }

    return;
}

/**
 * @brief 83bac | c4 | Handles a normal beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileNormalBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, PE_NORMAL_BEAM_HIT);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, PE_INVINCIBLE_HIT);
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_BEAM_BOMBS)
    {
        isft = ProjecileDealDamage(spriteSlot, 2);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, PE_NORMAL_BEAM_HIT);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, PE_INVINCIBLE_HIT);
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 83c70 | c4 | Handles a charged normal beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileChargedNormalBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x3);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS))
    {
        isft = ProjecileDealDamage(spriteSlot, 10);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, 0x3);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 83d34 | e0 | Handles a charge beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileChargeBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, PE_CHARGE_BEAM_HIT);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, PE_INVINCIBLE_HIT);
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_BEAM_BOMBS)
    {
        isft = ProjecileDealDamage(spriteSlot, 2);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, PE_CHARGE_BEAM_HIT);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, PE_INVINCIBLE_HIT);
    }

    if (gProjectileData[projectileSlot].status & PROJ_STATUS_NOT_DRAWN)
    {
        if (gProjectileData[gProjectileData[projectileSlot].primaryProjectileSlot].movementStage < 4)
            gProjectileData[gProjectileData[projectileSlot].primaryProjectileSlot].movementStage = 4;
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 83e14 | e0 | Handles a charged charge beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileChargedChargeBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x4);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS))
    {
        isft = ProjecileDealDamage(spriteSlot, 10);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, 0x4);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
    }

    if (gProjectileData[projectileSlot].status & PROJ_STATUS_NOT_DRAWN)
    {
        if (gProjectileData[gProjectileData[projectileSlot].primaryProjectileSlot].movementStage < 4)
            gProjectileData[gProjectileData[projectileSlot].primaryProjectileSlot].movementStage = 4;
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 83ef4 | c4 | Handles a wide beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileWideBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x5);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_BEAM_BOMBS)
    {
        isft = ProjecileDealDamage(spriteSlot, 3);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, 0x5);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 83fb8 | c4 | Handles a charged wide beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileChargedWideBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x5);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS))
    {
        isft = ProjecileDealDamage(spriteSlot, 15);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, 0x5);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 8407c | e0 | Handles a plasma beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectilePlasmaBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x6);
        gProjectileData[projectileSlot].status = 0;
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
        gProjectileData[projectileSlot].status = 0;
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_BEAM_BOMBS)
    {
        isft = ProjecileDealDamage(spriteSlot, 3);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebrisPiercing(1, isft, yPosition, xPosition);
        }
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
    }
}

/**
 * @brief 8415c | e0 | Handles a charged plasma beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileChargedPlasmaBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x6);
        gProjectileData[projectileSlot].status = 0;
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
        gProjectileData[projectileSlot].status = 0;
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS))
    {
        isft = ProjecileDealDamage(spriteSlot, 9);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebrisPiercing(1, isft, yPosition, xPosition);
        }
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
    }
}

/**
 * @brief 8423c | 164 | Handles a wave beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileWaveBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        
        if (gEquipment.beamStatus & BF_ICE_BEAM && gSpriteData[spriteSlot].freezeTimer == 0 && ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_CAN_BE_FROZEN)
        {
            gSpriteData[spriteSlot].standingOnSprite = FALSE;
            gSpriteData[spriteSlot].freezeTimer = 60 * 4;
            SPRITE_SET_ABSOLUTE_PALETTE_ROW(gSpriteData[spriteSlot], SPRITE_FROZEN_PALETTE_ROW);
        }
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
        gProjectileData[projectileSlot].status = 0;
    }
    else if (gEquipment.beamStatus & BF_ICE_BEAM)
    {
        if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_BEAM_BOMBS | WEAKNESS_CAN_BE_FROZEN))
        {
            isft = ProjectileIceBeamDealDamage(spriteSlot, projectileSlot, 6);

            if (ProjectileCheckSpriteCreateDebris(spriteSlot))
            {
                ProjectileRandomSpriteDebrisPiercing(2, isft, yPosition, xPosition);
            }
        }
        else
        {
            ProjectileSetIsftForSolid(spriteSlot);
            ParticleSet(yPosition, xPosition, 0x7);
        }
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_BEAM_BOMBS)
    {
        isft = ProjecileDealDamage(spriteSlot, 3);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebrisPiercing(1, isft, yPosition, xPosition);
        }
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
    }
}

/**
 * @brief 843a0 | 194 | Handles a charged wave beam hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileChargedWaveBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        
        if (gEquipment.beamStatus & BF_ICE_BEAM && gSpriteData[spriteSlot].freezeTimer == 0 && ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_CAN_BE_FROZEN)
        {
            gSpriteData[spriteSlot].standingOnSprite = FALSE;
            gSpriteData[spriteSlot].freezeTimer = 60 * 4;
            SPRITE_SET_ABSOLUTE_PALETTE_ROW(gSpriteData[spriteSlot], SPRITE_FROZEN_PALETTE_ROW);
        }
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
        gProjectileData[projectileSlot].status = 0;
    }
    else if (gEquipment.beamStatus & BF_ICE_BEAM)
    {
        if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS | WEAKNESS_CAN_BE_FROZEN))
        {
            isft = ProjectileIceBeamDealDamage(spriteSlot, projectileSlot, 12);

            if (ProjectileCheckSpriteCreateDebris(spriteSlot))
            {
                ProjectileRandomSpriteDebrisPiercing(2, isft, yPosition, xPosition);
            }
        }
        else
        {
            ProjectileSetIsftForSolid(spriteSlot);
            ParticleSet(yPosition, xPosition, 0x7);
        }
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS))
    {
        isft = ProjecileDealDamage(spriteSlot, 9);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebrisPiercing(1, isft, yPosition, xPosition);
        }
    }
    else
    {
        if (gSpriteData[spriteSlot].spriteId == PSPRITE_SA_X_BOSS)
        {
            isft = ProjecileDealDamage(spriteSlot, 9);

            if (ProjectileCheckSpriteCreateDebris(spriteSlot))
            {
                ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
            }
        }
        else
        {
            ProjectileSetIsftForSolid(spriteSlot);
            ParticleSet(yPosition, xPosition, 0x7);
        }
    }
}

/**
 * @brief 84534 | 12c | Handles a flare hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param yPosition Y position
 * @param xPosition X position
 * @param spriteY Sprite Y position
 * @param spriteX Sprite X position
 */
void ProjectileFlareHitSprite(u8 spriteSlot, u16 yPosition, u16 xPosition, u16 spriteY, u16 spriteX)
{
    u16 damage;
    u8 isft;
    u16 hitY;
    u16 hitX;
    u8 flags;

    if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
        return;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        return;
    }

    if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_CHARGE_BEAM | WEAKNESS_BEAM_BOMBS))
    {
        flags = gEquipment.beamStatus;
        if (flags & BF_WAVE_BEAM)
            damage = 15;
        else if (flags & BF_PLASMA_BEAM)
            damage = 12;
        else if (flags & BF_WIDE_BEAM)
            damage = 9;
        else
            damage = 6;

        isft = ProjecileDealDamage(spriteSlot, damage);
        
        hitY = yPosition;
        hitX = xPosition;

        if (spriteY > yPosition)
        {
            if (spriteY - yPosition > BLOCK_SIZE + HALF_BLOCK_SIZE)
                hitY = yPosition + BLOCK_SIZE;
        }
        else
        {
            if (yPosition - spriteY > BLOCK_SIZE + HALF_BLOCK_SIZE)
                hitY = yPosition - BLOCK_SIZE;
        }

        if (spriteX > xPosition)
        {
            if (spriteX - xPosition > BLOCK_SIZE - QUARTER_BLOCK_SIZE)
                hitX = xPosition + BLOCK_SIZE;
        }
        else
        {
            if (xPosition - spriteX > BLOCK_SIZE - QUARTER_BLOCK_SIZE)
                hitX = xPosition - BLOCK_SIZE;
        }

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(0, isft, hitY, hitX);
        }

        ParticleSet(hitY, hitX, 0x2);
        SoundPlay(0xF7);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
    }
}

void ProjectileStartMissileTumble(u8 spriteSlot, u8 projectileSlot)
{
    gProjectileData[projectileSlot].movementStage = 7;
    gProjectileData[projectileSlot].timer = 0;

    gProjectileData[projectileSlot].status &= ~PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
    gProjectileData[projectileSlot].status |= PROJ_STATUS_ABOVE_BG1;

    gProjectileData[projectileSlot].animationDurationCounter = 0;
    gProjectileData[projectileSlot].currentAnimationFrame = 0;
    gProjectileData[projectileSlot].pOam = sOam_58ea20;

    if (gProjectileData[projectileSlot].xPosition > gSpriteData[spriteSlot].xPosition)
        gProjectileData[projectileSlot].status |= PROJ_STATUS_X_FLIP;
    else
        gProjectileData[projectileSlot].status &= ~PROJ_STATUS_X_FLIP;
}

/**
 * @brief 846c4 | d8 | Handles a missile hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileNormalMissileHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x8);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
        ProjectileStartMissileTumble(spriteSlot, projectileSlot);
        return;
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_MISSILES)
    {
        isft = ProjecileDealDamage(spriteSlot, 10);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, 0x8);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
        ProjectileStartMissileTumble(spriteSlot, projectileSlot);
        return;
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 8479c | d0 | Handles a super missile hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileSuperMissileHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x9);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
        ProjectileStartMissileTumble(spriteSlot, projectileSlot);
        return;
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_MISSILES | WEAKNESS_SUPER_MISSILES))
    {
        isft = ProjecileDealDamage(spriteSlot, 30);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, 0x9);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
        ProjectileStartMissileTumble(spriteSlot, projectileSlot);
        return;
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 8486c | 118 | Handles an ice missile hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileIceMissileHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0xA);

        if (gSpriteData[spriteSlot].freezeTimer == 0 && ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_CAN_BE_FROZEN)
        {
            gSpriteData[spriteSlot].standingOnSprite = FALSE;
            gSpriteData[spriteSlot].freezeTimer = 60 * 4;
            SPRITE_SET_ABSOLUTE_PALETTE_ROW(gSpriteData[spriteSlot], SPRITE_FROZEN_PALETTE_ROW);
        }
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
        ProjectileStartMissileTumble(spriteSlot, projectileSlot);
        return;
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_MISSILES | WEAKNESS_SUPER_MISSILES | WEAKNESS_CAN_BE_FROZEN))
    {
        isft = ProjectileIceMissileDealDamage(spriteSlot, projectileSlot, 40);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(2, isft, yPosition, xPosition);
        }

        ParticleSet(yPosition, xPosition, 0xA);
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
        ProjectileStartMissileTumble(spriteSlot, projectileSlot);
        return;
    }

    gProjectileData[projectileSlot].status = 0;
}

/**
 * @brief 84984 | 1dc | Handles a diffusion missile hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileDiffusionMissileHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;
    u8 spawnFlakes;

    spawnFlakes = FALSE;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);

        if (gProjectileData[projectileSlot].type == PROJ_TYPE_CHARGED_DIFFUSION_MISSILE)
        {
            spawnFlakes = TRUE;
        }
        else
        {
            ParticleSet(yPosition, xPosition, 0xB);
        }

        if (gSpriteData[spriteSlot].freezeTimer == 0 && ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_CAN_BE_FROZEN)
        {
            gSpriteData[spriteSlot].standingOnSprite = FALSE;
            gSpriteData[spriteSlot].freezeTimer = 60 * 4;
            SPRITE_SET_ABSOLUTE_PALETTE_ROW(gSpriteData[spriteSlot], SPRITE_FROZEN_PALETTE_ROW);
        }
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
        ProjectileStartMissileTumble(spriteSlot, projectileSlot);
        return;
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & (WEAKNESS_MISSILES | WEAKNESS_SUPER_MISSILES | WEAKNESS_CAN_BE_FROZEN))
    {
        isft = ProjectileIceMissileDealDamage(spriteSlot, projectileSlot, 45);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(2, isft, yPosition, xPosition);
        }

        if (gProjectileData[projectileSlot].type != PROJ_TYPE_CHARGED_DIFFUSION_MISSILE)
        {
            ParticleSet(yPosition, xPosition, 0xB);
        }
        else
        {
            spawnFlakes = TRUE;
        }
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
        ParticleSet(yPosition, xPosition, 0x7);
        ProjectileStartMissileTumble(spriteSlot, projectileSlot);
        return;
    }

    if (spawnFlakes)
    {
        ParticleSet(yPosition, xPosition, 0xC);

        gProjectileData[projectileSlot].movementStage = 3;
        gProjectileData[projectileSlot].timer = 0;
        gProjectileData[projectileSlot].status &= ~PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
        gProjectileData[projectileSlot].status |= PROJ_STATUS_NOT_DRAWN;

        ProjectileInitSecondary(PROJ_TYPE_DIFFUSION_FLAKE, yPosition, xPosition, Q_8_8(0.f), 0, KEY_NONE, gProjectileData[projectileSlot].primaryProjectileSlot);
        ProjectileInitSecondary(PROJ_TYPE_DIFFUSION_FLAKE, yPosition, xPosition, Q_8_8(0.25f), 0, KEY_NONE, gProjectileData[projectileSlot].primaryProjectileSlot);
        ProjectileInitSecondary(PROJ_TYPE_DIFFUSION_FLAKE, yPosition, xPosition, Q_8_8(0.5f), 0, KEY_NONE, gProjectileData[projectileSlot].primaryProjectileSlot);
        ProjectileInitSecondary(PROJ_TYPE_DIFFUSION_FLAKE, yPosition, xPosition, Q_8_8(0.75f), 0, KEY_NONE, gProjectileData[projectileSlot].primaryProjectileSlot);
    }
    else
    {
        gProjectileData[projectileSlot].status = 0;
    }
}

/**
 * @brief 84b60 | d0 | Handles a diffusion missile hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileDiffusionFlakeHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
        return;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);

        if (gSpriteData[spriteSlot].freezeTimer == 0 && ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_CAN_BE_FROZEN)
        {
            gSpriteData[spriteSlot].standingOnSprite = FALSE;
            gSpriteData[spriteSlot].freezeTimer = 60 * 4;
            SPRITE_SET_ABSOLUTE_PALETTE_ROW(gSpriteData[spriteSlot], SPRITE_FROZEN_PALETTE_ROW);
        }
    }
    else if (gSpriteData[spriteSlot].freezeTimer == 0 && ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_CAN_BE_FROZEN)
    {
        isft = ProjectileDiffusionFlakeDealDamage(spriteSlot, projectileSlot);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(2, isft, yPosition, xPosition);
        }
    }
}

/**
 * @brief 84c30 | 7c | Handles a bomb hitting a sprite
 * 
 * @param spriteSlot Sprite slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void ProjectileBombHitSprite(u8 spriteSlot, u16 yPosition, u16 xPosition)
{
    u8 isft;

    if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
        return;

    if (gSpriteData[spriteSlot].properties & SP_SOLID_FOR_PROJECTILES)
    {
        ProjectileSetIsftForSolid(spriteSlot);
        return;
    }

    if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_BEAM_BOMBS)
    {
        isft = ProjecileDealDamage(spriteSlot, 8);

        if (ProjectileCheckSpriteCreateDebris(spriteSlot))
        {
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
        }
    }
    else
    {
        ProjectileSetIsftForSolid(spriteSlot);
    }
}

/**
 * @brief 84cac | 1c | To document
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void unk_84cac(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    gSpriteData[spriteSlot].invincibilityStunFlashTimer = 0x78;
}

/**
 * @brief 84cc8 | 1c | To document
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void unk_84cc8(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    gSpriteData[spriteSlot].invincibilityStunFlashTimer = 0x78;
}

/**
 * @brief 84ce4 | 1c | To document
 * 
 * @param spriteSlot Sprite slot
 * @param projectileSlot Projectile slot
 * @param yPosition Y position
 * @param xPosition X position
 */
void unk_84ce4(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{
    gSpriteData[spriteSlot].invincibilityStunFlashTimer = 0x78;
}

/**
 * @brief 84d00 | 74 | Handles dealing damage to zazabi
 * 
 * @param damage Damage
 */
void ProjectileDealDamageToZazabi(u16 damage)
{
    if (gCurrentSprite.health > damage)
    {
        gCurrentSprite.health -= damage;
    }
    else
    {
        gCurrentSprite.health = 0;
        gCurrentSprite.properties |= SP_DESTROYED;
        gCurrentSprite.freezeTimer = 0;
        gCurrentSprite.paletteRow = 0;

        if (gCurrentSprite.standingOnSprite != 0 && gSamusData.standingStatus == STANDING_ENEMY)
            gSamusData.standingStatus = STANDING_MID_AIR;
    }

    if (SPRITE_HAS_ISFT(gCurrentSprite) < 17)
    {
        SPRITE_CLEAR_AND_SET_ISFT(gCurrentSprite, 17);
    }
}

void ProjectileChargedNormalBeamInit(void)
{
    SoundPlay(0xc8);
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0x10;
    gCurrentProjectile.hitboxBottom = 0x10;
    gCurrentProjectile.hitboxLeft = -0x10;
    gCurrentProjectile.hitboxRight = 0x10;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_DIAGONAL_UP:
            gCurrentProjectile.pOam = sOam_58d80c;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            gCurrentProjectile.pOam = sOam_58d824;
            break;
        case ACD_FORWARD:
        default:
            gCurrentProjectile.pOam = sOam_58d7f4;
            break;
    }
}

void ProjectileChargedNormalBeamSubroutine(void)
{
    gCurrentClipdataAffectingAction = CAA_BEAM;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_NORMAL_BEAM_HIT);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        default:
            ProjectileMove(0x18);
            ProjectileSetBeamTrail(PE_CHARGED_NORMAL_BEAM_TRAIL, 4-1);
            break;
        case 0:
            ProjectileChargedNormalBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
    }
    gCurrentProjectile.timer++;
}

void ProjectileNormalBeamInit(void)
{
    SoundPlay(0xc8);
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0x8;
    gCurrentProjectile.hitboxBottom = 0x8;
    gCurrentProjectile.hitboxLeft = -0x8;
    gCurrentProjectile.hitboxRight = 0x8;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_DIAGONAL_UP:
            gCurrentProjectile.pOam = sOam_58d7c4;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            gCurrentProjectile.pOam = sOam_58d7dc;
            break;
        case ACD_FORWARD:
        default:
            gCurrentProjectile.pOam = sOam_58d7ac;
            break;
    }
}

void ProjectileNormalBeamSubroutine(void)
{
    gCurrentClipdataAffectingAction = CAA_BEAM;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_NORMAL_BEAM_HIT);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        default:
            ProjectileMove(0x18);
            break;
        case 0:
            ProjectileNormalBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
    }
    gCurrentProjectile.timer++;
}

void ProjectileMissileInit(u8 type)
{
    // Decrement missiles, and if no missiles, toggle off missiles
    if (gEquipment.currentMissiles > 0)
        if (--gEquipment.currentMissiles == 0)
            gSamusData.weaponHighlighted ^= 1;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
    gCurrentProjectile.movementStage++;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_DIAGONAL_UP:
            if (type == 0)
                gCurrentProjectile.pOam = sOam_58e7c0;
            else if (type == 1)
                gCurrentProjectile.pOam = sOam_58e858;
            else
                gCurrentProjectile.pOam = sOam_58e998;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            if (type == 0)
                gCurrentProjectile.pOam = sOam_58e7d8;
            else if (type == 1)
                gCurrentProjectile.pOam = sOam_58e870;
            else
                gCurrentProjectile.pOam = sOam_58e9b0;
            break;
        case ACD_FORWARD:
        default:
            if (type == 0)
                gCurrentProjectile.pOam = sOam_58e7a8;
            else if (type == 1)
                gCurrentProjectile.pOam = sOam_58e840;
            else
                gCurrentProjectile.pOam = sOam_58e980;
            break;
    }
}

void ProjectileMoveTumblingMissile(void)
{
    if (!(gCurrentProjectile.status & PROJ_STATUS_ON_SCREEN)) {
        gCurrentProjectile.status = 0;
    } else {
        u8 offset = gCurrentProjectile.timer;
        s16 movement = sTumblingMissileFallingVelocity[offset];
        if (movement == SHORT_MAX) {
            movement = sTumblingMissileFallingVelocity[offset - 1];
            gCurrentProjectile.yPosition += movement;
        } else {
            offset++;
            gCurrentProjectile.timer = offset;
            gCurrentProjectile.yPosition += movement;
        }
        if (gCurrentProjectile.status & PROJ_STATUS_X_FLIP)
            gCurrentProjectile.xPosition += PIXEL_SIZE;
        else
            gCurrentProjectile.xPosition -= PIXEL_SIZE;
    }
}

void ProjectileNormalMissileSubroutine(void)
{
    gCurrentClipdataAffectingAction = CAA_MISSILE;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_MISSILE_EXPLOSION);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            gCurrentProjectile.hitboxTop = -8;
            gCurrentProjectile.hitboxBottom = 8;
            gCurrentProjectile.hitboxLeft = -8;
            gCurrentProjectile.hitboxRight = 8;
            ProjectileMissileInit(0);
            SoundPlay(0xce);
            SoundPlay(0xcf);
            break;
        case 1:
            gCurrentProjectile.movementStage = 2;
            ProjectileMove(0x30);
            break;
        case 7:
            ProjectileMoveTumblingMissile();
            break;
        default:
            ProjectileMove(sNormalMissileVelocity[gCurrentProjectile.timer / 4]);
            if (gCurrentProjectile.timer < ARRAY_SIZE(sNormalMissileVelocity) * 4 - 1)
                gCurrentProjectile.timer += 1;
            ProjectileSetMissileTrail(PE_MISSILE_TRAIL, 8-1);
    }
}

void ProjectileSuperMissileSubroutine(void)
{
    gCurrentClipdataAffectingAction = CAA_MISSILE;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_SUPER_MISSILE_EXPLOSION);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            gCurrentProjectile.hitboxTop = -0xc;
            gCurrentProjectile.hitboxBottom = 0xc;
            gCurrentProjectile.hitboxLeft = -0xc;
            gCurrentProjectile.hitboxRight = 0xc;
            ProjectileMissileInit(0);
            SoundPlay(0xd1);
            SoundPlay(0xd2);
            break;
        case 1:
            gCurrentProjectile.movementStage = 2;
            ProjectileMove(0x30);
            break;
        case 7:
            ProjectileMoveTumblingMissile();
            break;
        default:
            ProjectileMove(sSuperMissileVelocity[gCurrentProjectile.timer / 4]);
            if (gCurrentProjectile.timer < ARRAY_SIZE(sSuperMissileVelocity) * 4 - 1)
                gCurrentProjectile.timer += 1;
            ProjectileSetMissileTrail(PE_SUPER_MISSILE_TRAIL, 8-1);
    }
}

void ProjectileIceMissileSubroutine(void)
{
    gCurrentClipdataAffectingAction = CAA_MISSILE;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_ICE_MISSILE_EXPLOSION);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            gCurrentProjectile.hitboxTop = -0xc;
            gCurrentProjectile.hitboxBottom = 0xc;
            gCurrentProjectile.hitboxLeft = -0x10;
            gCurrentProjectile.hitboxRight = 0x10;
            ProjectileMissileInit(1);
            SoundPlay(0xd4);
            SoundPlay(0xd5);
            break;
        case 1:
            gCurrentProjectile.movementStage = 2;
            ProjectileMove(0x30);
            break;
        case 7:
            ProjectileMoveTumblingMissile();
            break;
        default:
            ProjectileMove(sIceMissileVelocity[gCurrentProjectile.timer / 4]);
            if (gCurrentProjectile.timer < ARRAY_SIZE(sIceMissileVelocity) * 4 - 1)
                gCurrentProjectile.timer += 1;
            ProjectileSetMissileTrail(PE_ICE_MISSILE_TRAIL, 4-1);
    }
}

void ProjectileDiffusionMissileSubroutine(void)
{
    u16 y = gCurrentProjectile.yPosition;
    u16 x = gCurrentProjectile.xPosition;
    gCurrentClipdataAffectingAction = CAA_MISSILE;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        if (gCurrentProjectile.type != PROJ_TYPE_CHARGED_DIFFUSION_MISSILE) {
            ParticleSet(y, x, PE_DIFFUSION_MISSILE_EXPLOSION);
            gCurrentProjectile.status = 0;
            return;
        }
        ParticleSet(y, x, PE_CHARGED_DIFFUSION_MISSILE_EXPLOSION);
        gCurrentProjectile.movementStage = 3;
        gCurrentProjectile.timer = 0;
        gCurrentProjectile.status &= ~PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
        gCurrentProjectile.status |= PROJ_STATUS_NOT_DRAWN;
        ProjectileInitSecondary(PROJ_TYPE_DIFFUSION_FLAKE, y, x, 0, 0, 0, gCurrentProjectile.primaryProjectileSlot);
        ProjectileInitSecondary(PROJ_TYPE_DIFFUSION_FLAKE, y, x, Q_8_8(0.25f), 0, 0, gCurrentProjectile.primaryProjectileSlot);
        ProjectileInitSecondary(PROJ_TYPE_DIFFUSION_FLAKE, y, x, Q_8_8(0.5f), 0, 0, gCurrentProjectile.primaryProjectileSlot);
        ProjectileInitSecondary(PROJ_TYPE_DIFFUSION_FLAKE, y, x, Q_8_8(0.75f), 0, 0, gCurrentProjectile.primaryProjectileSlot);
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            gCurrentProjectile.hitboxTop = -0xc;
            gCurrentProjectile.hitboxBottom = 0xc;
            gCurrentProjectile.hitboxLeft = -0x10;
            gCurrentProjectile.hitboxRight = 0x10;
            if (gCurrentProjectile.type == PROJ_TYPE_CHARGED_DIFFUSION_MISSILE) {
                ProjectileMissileInit(2);
                ProjectileSetMissileTrail(PE_CHARGED_DIFFUSION_MISSILE_TRAIL, 4-1);
                SoundPlay(0xda);
                SoundPlay(0xdb);
            } else {
                ProjectileMissileInit(2);
                ProjectileSetMissileTrail(PE_DIFFUSION_MISSILE_TRAIL, 4-1);
                SoundPlay(0xd7);
                SoundPlay(0xd8);
            }
            break;
        case 1:
            gCurrentProjectile.movementStage = 2;
            ProjectileMove(0x30);
            break;
        case 3:
            if (++gCurrentProjectile.timer > 2 * 60)
                gCurrentProjectile.status = 0;
            break;
        case 7:
            ProjectileMoveTumblingMissile();
            break;
        default:
            ProjectileMove(sDiffusionMissileVelocity[gCurrentProjectile.timer / 4]);
            if (gCurrentProjectile.timer < ARRAY_SIZE(sDiffusionMissileVelocity) * 4 - 1)
                gCurrentProjectile.timer += 1;
            if (gCurrentProjectile.type == PROJ_TYPE_CHARGED_DIFFUSION_MISSILE)
                ProjectileSetMissileTrail(PE_CHARGED_DIFFUSION_MISSILE_TRAIL, 4-1);
            else
                ProjectileSetMissileTrail(PE_DIFFUSION_MISSILE_TRAIL, 4-1);
    }
}

void ProjectileDiffusionFlakeSubroutine(void)
{
    s16 distance;
    u32 angle;
    s16 sin, cos;
    u16 offset;

    u8 primarySlot = gCurrentProjectile.primaryProjectileSlot;
    if (gCurrentProjectile.movementStage == 0) {
        gCurrentProjectile.movementStage++;
        gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT | PROJ_STATUS_ABOVE_BG1;
        gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
        gCurrentProjectile.drawDistanceY = 0x10;
        gCurrentProjectile.drawDistanceX = 0x10;
        gCurrentProjectile.hitboxTop = -0x10;
        gCurrentProjectile.hitboxBottom = 0x10;
        gCurrentProjectile.hitboxLeft = -0x10;
        gCurrentProjectile.hitboxRight = 0x10;
        gCurrentProjectile.pOam = sDiffusionFlakeOam;
        gCurrentProjectile.animationDurationCounter = 0;
        gCurrentProjectile.currentAnimationFrame = 0;
        return;
    }
    if (gProjectileData[primarySlot].status == 0) {
        gCurrentProjectile.status = 0;
        return;
    }

    gCurrentProjectile.direction += 2;
    distance = gCurrentProjectile.direction * 2;
    angle = gCurrentProjectile.part;
    gCurrentProjectile.part += 8;

    sin = SIN(angle);
    if (sin < 0) {
        offset = Q_8_8_TO_INT(distance * -sin);
        gCurrentProjectile.yPosition = gProjectileData[primarySlot].yPosition - offset;
    } else {
        offset = Q_8_8_TO_INT(distance * sin);
        gCurrentProjectile.yPosition = gProjectileData[primarySlot].yPosition + offset;
    }

    cos = COS(angle);
    if (cos < 0) {
        offset = Q_8_8_TO_INT(-cos * distance);
        gCurrentProjectile.xPosition = gProjectileData[primarySlot].xPosition - offset;
    } else {
        offset = Q_8_8_TO_INT(distance * cos);
        gCurrentProjectile.xPosition = gProjectileData[primarySlot].xPosition + offset;
    }

    if ((gFrameCounter8Bit & 3) == 0)
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_DIFFUSION_PARTICLES);
    gCurrentClipdataAffectingAction = CAA_MISSILE;
    ProjectileCheckHittingSolid();
}

void ProjectileCheckSamusBombBounce(void)
{
    u16 samusY;
    u16 samusX;
    u16 previousX;
    u16 samusTop;
    u16 samusBottom;
    u16 samusLeft;
    u16 samusRight;

    u16 projY;
    u16 projX;
    u16 projTop;
    u16 projBottom;
    u16 projLeft;
    u16 projRight;
    u8 direction;
    u16 bombMiddleX;

    samusY = gSamusData.yPosition;
    samusX = gSamusData.xPosition;

    if (!(ClipdataProcess(samusY + HALF_BLOCK_SIZE, samusX) & CLIPDATA_TYPE_SOLID_FLAG) ||
        !(ClipdataProcess(samusY - (BLOCK_SIZE + HALF_BLOCK_SIZE), samusX) & CLIPDATA_TYPE_SOLID_FLAG))
    {
        previousX = gPreviousXPosition;
        samusTop = samusY + gSamusData.drawDistanceTop;
        samusBottom = samusY + gSamusData.drawDistanceBottom;
        samusLeft = samusX + gSamusData.drawDistanceLeft;
        samusRight = samusX + gSamusData.drawDistanceRight;
    
        projY = gCurrentProjectile.yPosition;
        projX = gCurrentProjectile.xPosition;
        projTop = projY + gCurrentProjectile.hitboxTop;
        projBottom = projY + gCurrentProjectile.hitboxBottom;
        projLeft = projX + gCurrentProjectile.hitboxLeft;
        projRight = projX + gCurrentProjectile.hitboxRight;
    
        if (SpriteUtilCheckObjectsTouching(samusTop, samusBottom, samusLeft, samusRight, projTop, projBottom, projLeft, projRight))
        {
            if (gSamusData.pose == SPOSE_GRABBED_BY_ZAZABI)
            {
                // Make Zazabi spit Samus after enough bombs
                gBossWork0 = TRUE;
            }
            else
            {
                bombMiddleX = projLeft + (projRight - projLeft) / 2;
                if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckSamusDamagingPose())
                {
                    if (samusY - HALF_BLOCK_SIZE > projY)
                        direction = FORCED_MOVEMENT_BOMB_JUMP_ABOVE;
                    else
                        direction = FORCED_MOVEMENT_BOMB_JUMP;
        
                    if (samusX < projX + (PIXEL_SIZE + ONE_SUB_PIXEL) && samusX > projX - (PIXEL_SIZE + ONE_SUB_PIXEL))
                        SamusBombBounce(direction + FORCED_MOVEMENT_BOMB_JUMP_UP);
                    else if (bombMiddleX >= previousX)
                        SamusBombBounce(direction + FORCED_MOVEMENT_BOMB_JUMP_LEFT);
                    else
                        SamusBombBounce(direction + FORCED_MOVEMENT_BOMB_JUMP_RIGHT);
                }
            }
        }
    }
}

void ProjectileBombInit(void)
{
    SoundPlay(0xdd);
    gCurrentProjectile.pOam = sOam_58eae8;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 8;
    gCurrentProjectile.drawDistanceX = 8;
    gCurrentProjectile.hitboxTop = -0x20;
    gCurrentProjectile.hitboxBottom = 0x1c;
    gCurrentProjectile.hitboxLeft = -0x20;
    gCurrentProjectile.hitboxRight = 0x20;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    gCurrentProjectile.status |= PROJ_STATUS_ABOVE_BG1;
    gCurrentProjectile.timer = 50;
    gCurrentProjectile.movementStage++;
}

void ProjectileBombSubroutine(void)
{
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectileBombInit();
            break;
        case 1:
            if (--gCurrentProjectile.timer == 0) {
                gCurrentProjectile.pOam = sOam_58eb10;
                gCurrentProjectile.animationDurationCounter = 0;
                gCurrentProjectile.currentAnimationFrame = 0;
                gCurrentProjectile.timer = 30;
                gCurrentProjectile.movementStage++;
            }
            break;
        case 2:
            if (--gCurrentProjectile.timer == 0) {
                gCurrentProjectile.timer = 16;
                gCurrentProjectile.movementStage++;
                gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT | PROJ_STATUS_NOT_DRAWN;
                ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_BOMB);
            }
            break;
        case 3:
            if (--gCurrentProjectile.timer > 0) {
                if (gCurrentProjectile.timer == 15) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition - 8, gCurrentProjectile.xPosition);
                    ProjectileCheckSamusBombBounce();
                    gCurrentProjectile.status &= ~PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
                } else if (gCurrentProjectile.timer == 14) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition + 0x38, gCurrentProjectile.xPosition);
                } else if (gCurrentProjectile.timer == 13) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition - 8, gCurrentProjectile.xPosition + 0x30);
                } else if (gCurrentProjectile.timer == 12) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition - 8, gCurrentProjectile.xPosition - 0x30);
                } else if (gCurrentProjectile.timer == 11) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition + 0x38, gCurrentProjectile.xPosition + 0x24);
                } else if (gCurrentProjectile.timer == 10) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition + 0x38, gCurrentProjectile.xPosition - 0x24);
                } else if (gCurrentProjectile.timer == 9) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition - 0x48, gCurrentProjectile.xPosition);
                } else if (gCurrentProjectile.timer == 8) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition - 0x48, gCurrentProjectile.xPosition + 0x24);
                } else if (gCurrentProjectile.timer == 7) {
                    gCurrentClipdataAffectingAction = CAA_BOMB;
                    ClipdataProcess(gCurrentProjectile.yPosition - 0x48, gCurrentProjectile.xPosition - 0x24);
                }
            } else {
                gCurrentProjectile.status = 0;
            }
            break;
    }
}

void ProjectilePowerBombInit(void)
{
    u8 i;

    // Decrement power bombs, and if no power bombs, toggle off power bomb
    if (gEquipment.currentPowerBombs > 0)
        if (--gEquipment.currentPowerBombs == 0)
            gSamusData.weaponHighlighted ^= 0x10;
    gCurrentProjectile.pOam = sOam_58eb38;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 8;
    gCurrentProjectile.drawDistanceX = 8;
    gCurrentProjectile.hitboxTop = -0x10;
    gCurrentProjectile.hitboxBottom = 0x10;
    gCurrentProjectile.hitboxLeft = -0x10;
    gCurrentProjectile.hitboxRight = 0x10;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    gCurrentProjectile.status |= PROJ_STATUS_ABOVE_BG1;
    gCurrentProjectile.timer = 70;
    gCurrentProjectile.movementStage++;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
        if (gSpriteData[i].status & SS_EXISTS) {
            gSpriteData[i].invincibilityStunFlashTimer &= 0x7f; // TODO macro
        }
    }

    SoundPlay(0xdf);
    gCurrentPowerBomb.powerBombPlaced = TRUE;
}

void ProjectilePowerBombSubroutine(void)
{
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectilePowerBombInit();
            break;
        case 1:
            if (--gCurrentProjectile.timer == 0) {
                gCurrentProjectile.pOam = sOam_58eb58;
                gCurrentProjectile.animationDurationCounter = 0;
                gCurrentProjectile.currentAnimationFrame = 0;
                gCurrentProjectile.timer = 70;
                gCurrentProjectile.movementStage++;
            }
            break;
        case 2:
            if (gSubGameMode1 == 2) {
                if (--gCurrentProjectile.timer == 0) {
                    PowerBombExplosionStart(gCurrentProjectile.xPosition, gCurrentProjectile.yPosition, FALSE);
                    gCurrentProjectile.status = 0;
                }
            }
    }
}

void ProjectileChargedChargeBeamInit(void)
{
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0xc;
    gCurrentProjectile.hitboxBottom = 0xc;
    gCurrentProjectile.hitboxLeft = -0xc;
    gCurrentProjectile.hitboxRight = 0xc;
    if (gCurrentProjectile.part > 0) {
        gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
        switch (gCurrentProjectile.direction) {
            case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            case ACD_DIAGONAL_UP:
                gCurrentProjectile.pOam = sOam_58da60;
                break;
            case ACD_DOWN:
                gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            case ACD_UP:
                gCurrentProjectile.pOam = sOam_58da70;
                break;
            case ACD_FORWARD:
            default:
                gCurrentProjectile.pOam = sOam_58da50;
                break;
        }
    } else {
        SoundPlay(0xed);
        gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
        switch (gCurrentProjectile.direction) {
            case ACD_DIAGONAL_DOWN:
                gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            case ACD_DIAGONAL_UP:
                gCurrentProjectile.pOam = sOam_58da20;
                break;
            case ACD_DOWN:
                gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            case ACD_UP:
                gCurrentProjectile.pOam = sOam_58da38;
                break;
            case ACD_FORWARD:
            default:
                gCurrentProjectile.pOam = sOam_58da08;
                break;
        }
    }
}

void ProjectileChargedChargeBeamSubroutine(void)
{
    if (gCurrentProjectile.part != 0) {
        if (gCurrentProjectile.status & PROJ_STATUS_NOT_DRAWN && gProjectileData[gCurrentProjectile.primaryProjectileSlot].movementStage >= 4)
            gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
        gCurrentClipdataAffectingAction = CAA_BEAM;
        if (ProjectileCheckVerticalCollisionAtPosition() != COLLISION_AIR) {
            if (gCurrentProjectile.status & PROJ_STATUS_NOT_DRAWN && gProjectileData[gCurrentProjectile.primaryProjectileSlot].movementStage < 4)
                gProjectileData[gCurrentProjectile.primaryProjectileSlot].movementStage = 4;
            ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_CHARGE_BEAM_HIT);
            gCurrentProjectile.status = 0;
            return;
        }
        if (gCurrentProjectile.movementStage <= 2)
            ProjectileMovePart();
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectileChargedChargeBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
        case 2:
            gCurrentProjectile.movementStage++;
        case 3:
            ProjectileMove(0x18);
            if (gCurrentProjectile.part == 0)
                ProjectileSetBeamTrail(PE_CHARGED_CHARGE_BEAM_TRAIL, 4-1);
            break;
        case 4:
            gCurrentProjectile.movementStage++;
            break;
        default:
            gCurrentProjectile.status = 0;
    }
    gCurrentProjectile.timer++;
}

void ProjectileChargeBeamInit(void)
{
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0xc;
    gCurrentProjectile.hitboxBottom = 0xc;
    gCurrentProjectile.hitboxLeft = -0xc;
    gCurrentProjectile.hitboxRight = 0xc;
    if (gCurrentProjectile.part > 0) {
        gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
        switch (gCurrentProjectile.direction) {
            case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            case ACD_DIAGONAL_UP:
                gCurrentProjectile.pOam = sOam_58d9e8;
                break;
            case ACD_DOWN:
                gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            case ACD_UP:
                gCurrentProjectile.pOam = sOam_58d9f8;
                break;
            case ACD_FORWARD:
            default:
                gCurrentProjectile.pOam = sOam_58d9d8;
                break;
        }
    } else {
        SoundPlay(0xca);
        gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
        switch (gCurrentProjectile.direction) {
            case ACD_DIAGONAL_DOWN:
                gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            case ACD_DIAGONAL_UP:
                gCurrentProjectile.pOam = sOam_58d9a8;
                break;
            case ACD_DOWN:
                gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            case ACD_UP:
                gCurrentProjectile.pOam = sOam_58d9c0;
                break;
            case ACD_FORWARD:
            default:
                gCurrentProjectile.pOam = sOam_58d990;
                break;
        }
    }
}

void ProjectileChargeBeamSubroutine(void)
{
    if (gCurrentProjectile.part != 0) {
        if (gCurrentProjectile.status & PROJ_STATUS_NOT_DRAWN && gProjectileData[gCurrentProjectile.primaryProjectileSlot].movementStage >= 4)
            gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
        gCurrentClipdataAffectingAction = CAA_BEAM;
        if (ProjectileCheckVerticalCollisionAtPosition() != COLLISION_AIR) {
            if (gCurrentProjectile.status & PROJ_STATUS_NOT_DRAWN && gProjectileData[gCurrentProjectile.primaryProjectileSlot].movementStage < 4)
                gProjectileData[gCurrentProjectile.primaryProjectileSlot].movementStage = 4;
            ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_CHARGE_BEAM_HIT);
            gCurrentProjectile.status = 0;
            return;
        }
        if (gCurrentProjectile.movementStage <= 2)
            ProjectileMovePart();
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectileChargeBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
        case 2:
            gCurrentProjectile.movementStage++;
        case 3:
            ProjectileMove(0x18);
            break;
        case 4:
            gCurrentProjectile.movementStage++;
            break;
        default:
            gCurrentProjectile.status = 0;
    }
    gCurrentProjectile.timer++;
}

void ProjectileChargedWideBeamInit(void)
{
    SoundPlay(0xee);
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0x14;
    gCurrentProjectile.hitboxBottom = 0x14;
    gCurrentProjectile.hitboxLeft = -0x14;
    gCurrentProjectile.hitboxRight = 0x14;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            gCurrentProjectile.pOam = sOam_58dc54;
            break;
        case ACD_DIAGONAL_UP:
            gCurrentProjectile.pOam = sOam_58dc54;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            gCurrentProjectile.pOam = sOam_58dc6c;
            break;
        case ACD_FORWARD:
        default:
            gCurrentProjectile.pOam = sOam_58dc3c;
            break;
    }
}

void ProjectileChargedWideBeamSubroutine(void)
{
    if (gCurrentProjectile.part != 0 && gCurrentProjectile.movementStage < 9)
        ProjectileMovePart();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_WIDE_BEAM_HIT);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectileChargedWideBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
        default:
            if (gCurrentProjectile.movementStage < 9)
                gCurrentProjectile.movementStage++;
            ProjectileMove(0x18);
            ProjectileSetBeamTrail(PE_CHARGED_WIDE_BEAM_TRAIL, 4-1);
            break;
    }
    gCurrentProjectile.timer++;
}

void ProjectileWideBeamInit(void)
{
    SoundPlay(0xc9);
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0x10;
    gCurrentProjectile.hitboxBottom = 0x10;
    gCurrentProjectile.hitboxLeft = -0x10;
    gCurrentProjectile.hitboxRight = 0x10;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            gCurrentProjectile.pOam = sOam_58dbfc;
            break;
        case ACD_DIAGONAL_UP:
            gCurrentProjectile.pOam = sOam_58dbfc;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            gCurrentProjectile.pOam = sOam_58dc1c;
            break;
        case ACD_FORWARD:
        default:
            gCurrentProjectile.pOam = sOam_58dbdc;
            break;
    }
}

void ProjectileWideBeamSubroutine(void)
{
    if (gCurrentProjectile.part != 0 && gCurrentProjectile.movementStage < 9)
        ProjectileMovePart();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_WIDE_BEAM_HIT);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectileWideBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
        default:
            if (gCurrentProjectile.movementStage < 9)
                gCurrentProjectile.movementStage++;
            ProjectileMove(0x18);
            break;
    }
    gCurrentProjectile.timer++;
}

void ProjectileChargedPlasmaBeamInit(void)
{
    SoundPlay(0xef);
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0x14;
    gCurrentProjectile.hitboxBottom = 0x14;
    gCurrentProjectile.hitboxLeft = -0x14;
    gCurrentProjectile.hitboxRight = 0x14;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    gCurrentProjectile.movementStage++;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            gCurrentProjectile.pOam = sOam_58de54;
            break;
        case ACD_DIAGONAL_UP:
            gCurrentProjectile.pOam = sOam_58de54;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            gCurrentProjectile.pOam = sOam_58de6c;
            break;
        case ACD_FORWARD:
        default:
            gCurrentProjectile.pOam = sOam_58de3c;
            break;
    }
}

void ProjectileChargedPlasmaBeamSubroutine(void)
{
    if (gCurrentProjectile.part != 0 && gCurrentProjectile.movementStage < 9)
        ProjectileMovePart();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_PLASMA_BEAM_HIT);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectileChargedPlasmaBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
        default:
            if (gCurrentProjectile.movementStage < 9)
                gCurrentProjectile.movementStage++;
            ProjectileMove(0x1c);
            ProjectileSetBeamTrail(PE_CHARGED_PLASMA_BEAM_TRAIL, 4-1);
            break;
    }
    gCurrentProjectile.timer++;
}

void ProjectilePlasmaBeamInit(void)
{
    SoundPlay(0xcb);
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0xc;
    gCurrentProjectile.hitboxBottom = 0xc;
    gCurrentProjectile.hitboxLeft = -0xc;
    gCurrentProjectile.hitboxRight = 0xc;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            gCurrentProjectile.pOam = sOam_58de0c;
            break;
        case ACD_DIAGONAL_UP:
            gCurrentProjectile.pOam = sOam_58de0c;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            gCurrentProjectile.pOam = sOam_58de24;
            break;
        case ACD_FORWARD:
        default:
            gCurrentProjectile.pOam = sOam_58ddf4;
            break;
    }
}

void ProjectilePlasmaBeamSubroutine(void)
{
    if (gCurrentProjectile.part != 0 && gCurrentProjectile.movementStage < 9)
        ProjectileMovePart();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    if (ProjectileCheckVerticalCollisionAtPosition()) {
        gCurrentProjectile.status = 0;
        ParticleSet(gCurrentProjectile.yPosition, gCurrentProjectile.xPosition, PE_PLASMA_BEAM_HIT);
        return;
    }
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectilePlasmaBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
        default:
            if (gCurrentProjectile.movementStage < 9)
                gCurrentProjectile.movementStage++;
            ProjectileMove(0x1c);
            break;
    }
    gCurrentProjectile.timer++;
}

void ProjectileChargedWaveBeamInit(void)
{
    u8 equippedBeams = gEquipment.beamStatus;
    if (equippedBeams & BF_ICE_BEAM) {
        SoundPlay(0xf1);
        gCurrentProjectile.hitboxTop = -0xc;
        gCurrentProjectile.hitboxBottom = 0xc;
        gCurrentProjectile.hitboxLeft = -0xc;
        gCurrentProjectile.hitboxRight = 0xc;
    } else {
        SoundPlay(0xf0);
        gCurrentProjectile.hitboxTop = -0x14;
        gCurrentProjectile.hitboxBottom = 0x14;
        gCurrentProjectile.hitboxLeft = -0x14;
        gCurrentProjectile.hitboxRight = 0x14;
    }
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT | PROJ_STATUS_ABOVE_BG1;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            if (equippedBeams & BF_ICE_BEAM)
                gCurrentProjectile.pOam = sOam_58e218;
            else
                gCurrentProjectile.pOam = sOam_58dfac;
            break;
        case ACD_DIAGONAL_UP:
            if (equippedBeams & BF_ICE_BEAM)
                gCurrentProjectile.pOam = sOam_58e218;
            else
                gCurrentProjectile.pOam = sOam_58dfac;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            if (equippedBeams & BF_ICE_BEAM)
                gCurrentProjectile.pOam = sOam_58e228;
            else
                gCurrentProjectile.pOam = sOam_58dfc4;
            break;
        case ACD_FORWARD:
        default:
            if (equippedBeams & BF_ICE_BEAM)
                gCurrentProjectile.pOam = sOam_58e208;
            else
                gCurrentProjectile.pOam = sOam_58df94;
            break;
    }
}

void ProjectileChargedWaveBeamSubroutine(void)
{
    if (gCurrentProjectile.part != 0)
        ProjectileMoveWaveBeamParts();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    ProjectileCheckHittingSolid();
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectileChargedWaveBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
        default:
            ProjectileMove(0x1c);
            if (gEquipment.beamStatus & BF_ICE_BEAM)
                ProjectileSetBeamTrail(PE_CHARGED_ICE_BEAM_TRAIL, 4-1);
            else
                ProjectileSetBeamTrail(PE_CHARGED_WAVE_BEAM_TRAIL, 4-1);
            break;
    }
    gCurrentProjectile.timer++;
}

void ProjectileWaveBeamInit(void)
{
    u8 equippedBeams = gEquipment.beamStatus;
    if (equippedBeams & BF_ICE_BEAM) {
        SoundPlay(0xcd);
        gCurrentProjectile.hitboxTop = -0xc;
        gCurrentProjectile.hitboxBottom = 0xc;
        gCurrentProjectile.hitboxLeft = -0xc;
        gCurrentProjectile.hitboxRight = 0xc;
    } else {
        SoundPlay(0xcc);
        gCurrentProjectile.hitboxTop = -0x14;
        gCurrentProjectile.hitboxBottom = 0x14;
        gCurrentProjectile.hitboxLeft = -0x14;
        gCurrentProjectile.hitboxRight = 0x14;
    }
    gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT | PROJ_STATUS_ABOVE_BG1;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            if (equippedBeams & BF_ICE_BEAM)
                gCurrentProjectile.pOam = sOam_58e1e8;
            else
                gCurrentProjectile.pOam = sOam_58df74;
            break;
        case ACD_DIAGONAL_UP:
            if (equippedBeams & BF_ICE_BEAM)
                gCurrentProjectile.pOam = sOam_58e1e8;
            else
                gCurrentProjectile.pOam = sOam_58df74;
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_UP:
            if (equippedBeams & BF_ICE_BEAM)
                gCurrentProjectile.pOam = sOam_58e1f8;
            else
                gCurrentProjectile.pOam = sOam_58df84;
            break;
        case ACD_FORWARD:
        default:
            if (equippedBeams & BF_ICE_BEAM)
                gCurrentProjectile.pOam = sOam_58e1d8;
            else
                gCurrentProjectile.pOam = sOam_58df64;
            break;
    }
}

void ProjectileWaveBeamSubroutine(void)
{
    if (gCurrentProjectile.part != 0)
        ProjectileMoveWaveBeamParts();
    gCurrentClipdataAffectingAction = CAA_BEAM;
    ProjectileCheckHittingSolid();
    switch (gCurrentProjectile.movementStage) {
        case 0:
            ProjectileWaveBeamInit();
            gCurrentProjectile.movementStage++;
            break;
        case 1:
            ProjectileMove(0x10);
            gCurrentProjectile.movementStage++;
            break;
        default:
            ProjectileMove(0x1c);
            if (gEquipment.beamStatus & BF_ICE_BEAM)
                ProjectileSetBeamTrail(PE_ICE_BEAM_TRAIL, 4-1);
            break;
    }
    gCurrentProjectile.timer++;
}

void ProjectileFlareLoadGraphics(u8 stage)
{
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_UP:
        case ACD_DIAGONAL_DOWN:
            DMA_SET(3, sFlareDiagonalGfx_Top + stage * 8 * VRAM_TILE_SIZE, VRAM_OBJ_ADDR_COORDS(0x14, 4), C_32_2_16(DMA_ENABLE, 8 * VRAM_TILE_SIZE / 2));
            DMA_SET(3, sFlareDiagonalGfx_Bottom + stage * 8 * VRAM_TILE_SIZE, VRAM_OBJ_ADDR_COORDS(0x14, 5), C_32_2_16(DMA_ENABLE, 8 * VRAM_TILE_SIZE / 2));
            break;
        case ACD_UP:
        case ACD_DOWN:
            DMA_SET(3, sFlareVerticalGfx_Top + stage * 8 * VRAM_TILE_SIZE, VRAM_OBJ_ADDR_COORDS(0x14, 4), C_32_2_16(DMA_ENABLE, 8 * VRAM_TILE_SIZE / 2));
            DMA_SET(3, sFlareVerticalGfx_Bottom + stage * 8 * VRAM_TILE_SIZE, VRAM_OBJ_ADDR_COORDS(0x14, 5), C_32_2_16(DMA_ENABLE, 8 * VRAM_TILE_SIZE / 2));
            break;
        case ACD_FORWARD:
        default:
            DMA_SET(3, sFlareHorizontalGfx_Top + stage * 8 * VRAM_TILE_SIZE, VRAM_OBJ_ADDR_COORDS(0x14, 4), C_32_2_16(DMA_ENABLE, 8 * VRAM_TILE_SIZE / 2));
            DMA_SET(3, sFlareHorizontalGfx_Bottom + stage * 8 * VRAM_TILE_SIZE, VRAM_OBJ_ADDR_COORDS(0x14, 5), C_32_2_16(DMA_ENABLE, 8 * VRAM_TILE_SIZE / 2));
            break;
    }
}

void ProjectileFlareInit(void)
{
    gCurrentProjectile.pOam = sFlareOam;
    gCurrentProjectile.animationDurationCounter = 0;
    gCurrentProjectile.currentAnimationFrame = 0;
    gCurrentProjectile.drawDistanceY = 0x10;
    gCurrentProjectile.drawDistanceX = 0x10;
    gCurrentProjectile.hitboxTop = -0x40;
    gCurrentProjectile.hitboxBottom = 0x40;
    gCurrentProjectile.hitboxLeft = -0x40;
    gCurrentProjectile.hitboxRight = 0x40;
    gCurrentProjectile.status &= ~PROJ_STATUS_NOT_DRAWN;
    gCurrentProjectile.status |= PROJ_STATUS_ABOVE_BG1;
    gCurrentProjectile.movementStage++;
    switch (gCurrentProjectile.direction) {
        case ACD_DIAGONAL_UP:
            break;
        case ACD_DIAGONAL_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
            break;
        case ACD_UP:
            break;
        case ACD_DOWN:
            gCurrentProjectile.status |= PROJ_STATUS_Y_FLIP;
        case ACD_FORWARD:
        default:
            break;
    }
    ProjectileFlareLoadGraphics(0);
    SoundPlay(0xf6);
}

void ProjectileFlareSubroutine(void)
{
    gCurrentClipdataAffectingAction = CAA_BEAM;
    ProjectileCheckVerticalCollisionAtPosition();
    switch (gCurrentProjectile.timer) {
        case 0:
            ProjectileFlareInit();
            gCurrentProjectile.status |= PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
            break;
        case 1:
            gCurrentProjectile.status &= ~PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
            break;
        case 2:
            ProjectileFlareLoadGraphics(1);
            break;
        case 4:
            ProjectileFlareLoadGraphics(2);
            break;
        case 6:
            ProjectileFlareLoadGraphics(3);
            break;
        case 8:
            ProjectileFlareLoadGraphics(4);
            break;
        case 10:
            gCurrentProjectile.status = 0;
    }
    gCurrentProjectile.timer++;
}
