#include "sprites_AI/nettori.h"
#include "macros.h"
#include "gba.h"
#include "globals.h"

#include "data/sprite_data.h"
#include "data/sprites/nettori.h"
#include "data/sprites/x_parasite.h"

#include "constants/particle.h"
#include "constants/samus.h"
#include "constants/sprite.h"

#include "structs/clipdata.h"
#include "structs/samus.h"
#include "structs/sprite.h"

#define NETTORI_PLASMA_BEAM_SPEED (QUARTER_BLOCK_SIZE + PIXEL_SIZE)
#define NETTORI_GLOWING_PALETTE_DELAY 16

enum NettoriShootingPosition {
    NETTORI_SHOOTING_POSITION_NONE,
    NETTORI_SHOOTING_POSITION_HIGH,
    NETTORI_SHOOTING_POSITION_LOW,
};

/**
 * @brief 43a88 | 8c | Removes the wall collision behind nettori
 * 
 */
void NettoriRemoveCollision(void)
{
    u16 yPosition;
    u16 xPosition;
    u8 caa;

    caa = CAA_REMOVE_SOLID;
    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    // Remove line of 8 blocks right behind nettori

    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (BLOCK_SIZE * 0 + HALF_BLOCK_SIZE), xPosition + HALF_BLOCK_SIZE);
    
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (BLOCK_SIZE * 1 + HALF_BLOCK_SIZE), xPosition + HALF_BLOCK_SIZE);
    
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (BLOCK_SIZE * 2 + HALF_BLOCK_SIZE), xPosition + HALF_BLOCK_SIZE);
    
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (BLOCK_SIZE * 3 + HALF_BLOCK_SIZE), xPosition + HALF_BLOCK_SIZE);
    
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (BLOCK_SIZE * 4 + HALF_BLOCK_SIZE), xPosition + HALF_BLOCK_SIZE);
    
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (BLOCK_SIZE * 5 + HALF_BLOCK_SIZE), xPosition + HALF_BLOCK_SIZE);
    
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (BLOCK_SIZE * 6 + HALF_BLOCK_SIZE), xPosition + HALF_BLOCK_SIZE);
    
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (BLOCK_SIZE * 7 + HALF_BLOCK_SIZE), xPosition + HALF_BLOCK_SIZE);
}

/**
 * @brief 43b14 | 58 | Destroys the samus eater and spores
 * 
 */
void NettoriDestroySamusEaterAndSpores(void)
{
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (!(gSpriteData[i].properties & SP_SECONDARY_SPRITE))
        {
            // Set eater buds to be dying
            if (gSpriteData[i].spriteId == PSPRITE_SAMUS_EATER_BUD)
                gSpriteData[i].pose = SAMUS_EATER_BUD_POSE_DYING_INIT;
        }
        else
        {
            // Destroy spores
            if (gSpriteData[i].spriteId == SSPRITE_SAMUS_EATER_SPORE)
                gSpriteData[i].status = 0;
        }
    }
}

/**
 * @brief 43b6c | 58 | Checks if nettori has reached the second phase health threshold
 * 
 * @return u8 bool, threshold reached
 */
u8 SamusEaterCheckNettoriHealthThreshold(void)
{
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (gSpriteData[i].properties & SP_SECONDARY_SPRITE)
            continue;

        if (gSpriteData[i].spriteId == PSPRITE_NETTORI)
        {
            if (gSpriteData[i].health < GET_PSPRITE_HEALTH(PSPRITE_NETTORI) / 2)
                return TRUE;

            return FALSE;
        }
    }

    return FALSE;
}

/**
 * @brief 43bc4 | 98 | Updates the glowing palette of nettori
 * 
 */
void NettoriUpdateGlowingPalette(void)
{
    const u16* pPal;

    gBossWork3--;

    if (gBossWork3 != 0)
        return;

    gBossWork3 = NETTORI_GLOWING_PALETTE_DELAY;
    gBossWork2++;

    if (gBossWork2 >= 6)
        gBossWork2 = 0;

    switch (gBossWork2)
    {
        case 0:
            pPal = sNettoriPal;
            break;

        case 1:
            pPal = sNettoriGlowingPal_1;
            break;

        case 2:
            pPal = sNettoriGlowingPal_2;
            break;

        case 3:
            pPal = sNettoriGlowingPal_3;
            break;

        case 4:
            pPal = sNettoriGlowingPal_2;
            break;

        case 5:
            pPal = sNettoriGlowingPal_1;
            break;
    }

    DMA_SET(3, pPal, PALRAM_OBJ + 0x100, C_32_2_16(DMA_ENABLE, 16 / sizeof(u16)));
}

/**
 * @brief 43c5c | c0 | Updates the health based palette of nettori
 * 
 */
void NettoriUpdatePalette(void)
{
    u8 transferPal;
    u16 health;
    u16 maxHealth;
    const u16* pPal;

    transferPal = FALSE;
    health = gCurrentSprite.health;
    maxHealth = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    switch (gBossWork1)
    {
        case 0:
            pPal = sNettoriPal;
            
            // Only transfer 1 row
            DMA_SET(3, pPal, PALRAM_OBJ + 0x100, C_32_2_16(DMA_ENABLE, 16 / sizeof(u16)));

            gBossWork1++;
            break;

        case 1:
            // Turn purple when below 1/3 of health
            if (health <= maxHealth / 3)
            {
                pPal = sNettoriPal_Purple;
                gBossWork1++;
                transferPal = TRUE;
            }
            break;

        case 2:
            // Turn red when below 1/6 of health
            if (health <= maxHealth / 6)
            {
                pPal = sNettoriPal_Red;
                gBossWork1++;
                transferPal = TRUE;
            }
            break;
    }

    if (transferPal)
    {
        // Transfer 2 rows
        DMA_SET(3, pPal, PALRAM_OBJ + 0x100, C_32_2_16(DMA_ENABLE, 16 * 2 / sizeof(u16)));
    }
}

/**
 * @brief 43d1c | 154 | Initializes nettori
 * 
 */
void NettoriInit(void)
{
    u16 yPosition;
    u16 xPosition;

    if (gEquipment.beamStatus & BF_PLASMA_BEAM)
    {
        gCurrentSprite.status = 0;
        return;
    }

    gBossWork1 = 0;
    gBossWork2 = 0;
    gBossWork3 = NETTORI_GLOWING_PALETTE_DELAY;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 6);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 6 - QUARTER_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -BLOCK_SIZE;
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.work0 = NETTORI_SHOOTING_POSITION_NONE;

    gCurrentSprite.pOam = sNettoriOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.drawOrder = 6;
    gCurrentSprite.xPosition += HALF_BLOCK_SIZE;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    SpriteSpawnSecondary(SSPRITE_NETTORI_PART, NETTORI_PART_HEAD, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_NETTORI_PART, NETTORI_PART_LEG, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_NETTORI_PART, NETTORI_PART_RIGHT_ARM, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_NETTORI_PART, NETTORI_PART_LEFT_ARM, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_NETTORI_PART, NETTORI_PART_HEAD_VINES, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_NETTORI_PART, NETTORI_PART_BODY_VINES, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_NETTORI_PART, NETTORI_PART_PLASMA_SHOOTER, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, yPosition, xPosition, 0);
}

/**
 * @brief 43e70 | b4 | Handles nettori being idle
 * 
 */
void NettoriIdle(void)
{
    u8 i;

    // Set correct oam, either charging or idle
    if (gCurrentSprite.work0 != NETTORI_SHOOTING_POSITION_NONE)
    {
        if (gCurrentSprite.pOam == sNettoriOam_Idle)
        {
            gCurrentSprite.pOam = sNettoriOam_ChargingBeam;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
    else
    {
        if (gCurrentSprite.pOam == sNettoriOam_ChargingBeam)
        {
            gCurrentSprite.pOam = sNettoriOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }

    if (gCurrentSprite.health == 0)
    {
        // Set dying
        gCurrentSprite.pose = NETTORI_POSE_DYING_INIT;

        // Destroy or set dying all the sub sprites of the boss
        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
                continue;

            if (!(gSpriteData[i].properties & SP_SECONDARY_SPRITE))
            {
                if (gSpriteData[i].spriteId == PSPRITE_SAMUS_EATER_BUD || gSpriteData[i].spriteId == PSPRITE_SAMUS_EATER)
                    gSpriteData[i].pose = SAMUS_EATER_BUD_POSE_DYING_INIT;
            }
            else
            {
                if (gSpriteData[i].spriteId == SSPRITE_SAMUS_EATER_SPORE || gSpriteData[i].spriteId == SSPRITE_NETTORI_PLASMA_BEAM)
                    gSpriteData[i].status = 0;
            }
        }
    }
}

/**
 * @brief 43f24 | 3c | Initializes nettori to be dying
 * 
 */
void NettoriDyingInit(void)
{
    gCurrentSprite.pose = NETTORI_POSE_DYING;

    gCurrentSprite.status |= SPRITE_STATUS_ENABLE_MOSAIC | SPRITE_STATUS_IGNORE_PROJECTILES;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.xParasiteTimer = ARRAY_SIZE(sXParasiteMosaicValues);

    NettoriRemoveCollision();
    PlayMusic(0x43, 7);
}

/**
 * @brief 43f60 | 74 | Handles nettori transforming into a core X
 * 
 */
void NettoriTransformingIntoCoreX(void)
{
    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    gCurrentSprite.xParasiteTimer--;

    if (gCurrentSprite.xParasiteTimer < 20)
    {
        SpriteLoadGfx(PSPRITE_PLASMA_BEAM_CORE_X, 0, gCurrentSprite.xParasiteTimer);

        if (gCurrentSprite.xParasiteTimer == 0)
        {
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
            gCurrentSprite.spriteId = PSPRITE_PLASMA_BEAM_CORE_X;

            gCurrentSprite.yPosition -= BLOCK_SIZE * 3;
            gCurrentSprite.xPosition -= BLOCK_SIZE - QUARTER_BLOCK_SIZE;

            gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
        }
    }
    else if (gCurrentSprite.xParasiteTimer == 20)
    {
        SpriteLoadPal(PSPRITE_PLASMA_BEAM_CORE_X, 0, 5);
    }
}

/**
 * @brief 43fd4 | 16c | Initializes a nettori part
 * 
 */
void NettoriPartInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    switch (gCurrentSprite.roomSlot)
    {
        case NETTORI_PART_HEAD:
            gCurrentSprite.pOam = sNettoriPartOam_HeadIdle;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 10);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 3);
            break;

        case NETTORI_PART_LEG:
            gCurrentSprite.pOam = sNettoriPartOam_LegIdle;
            gCurrentSprite.drawOrder = 3;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 3);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            break;

        case NETTORI_PART_RIGHT_ARM:
            gCurrentSprite.pOam = sNettoriPartOam_RightArmIdle;
            gCurrentSprite.drawOrder = 5;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 3 + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE);
            break;

        case NETTORI_PART_LEFT_ARM:
            gCurrentSprite.pOam = sNettoriPartOam_LeftArmIdle;
            gCurrentSprite.drawOrder = 2;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 4);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            break;

        case NETTORI_PART_HEAD_VINES:
            gCurrentSprite.pOam = sNettoriPartOam_HeadVinesIdle;
            gCurrentSprite.drawOrder = 2;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 6);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
            break;

        case NETTORI_PART_BODY_VINES:
            gCurrentSprite.pOam = sNettoriPartOam_BodyVinesIdle;
            gCurrentSprite.drawOrder = 1;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 3);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            break;

        case NETTORI_PART_PLASMA_SHOOTER:
            gCurrentSprite.pOam = sNettoriPartOam_PlasmaShootingHigh;
            gCurrentSprite.drawOrder = 3;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 6);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

            gCurrentSprite.frozenPaletteRowOffset = 3,
            gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.work1 = 0;
            break;

        default:
            gCurrentSprite.status = 0;
    }
}

/**
 * @brief 44170 | 3a4 | Handles a nettori part being idle
 * 
 */
void NettoriPartIdle(void)
{
    u8 shouldFall;
    u8 ramSlot;
    u16 maxHealth;
    u16 health;

    shouldFall = FALSE;
    ramSlot = gCurrentSprite.primarySpriteRamSlot;
    maxHealth = GET_PSPRITE_HEALTH(PSPRITE_NETTORI);
    health = gSpriteData[ramSlot].health;

    switch (gCurrentSprite.roomSlot)
    {
        case NETTORI_PART_HEAD:
            gCurrentSprite.paletteRow = gSpriteData[ramSlot].paletteRow;

            // Fall if below 1/2 health
            if (health < maxHealth / 2)
            {
                shouldFall++;
                NettoriDestroySamusEaterAndSpores();
            }
            break;

        case NETTORI_PART_LEG:
            gCurrentSprite.paletteRow = gSpriteData[ramSlot].paletteRow;

            // Fall if below 5/8 health
            if (health < FRACT_MUL(maxHealth, 5, 8))
            {
                shouldFall++;
            }
            break;

        case NETTORI_PART_RIGHT_ARM:
            gCurrentSprite.paletteRow = gSpriteData[ramSlot].paletteRow;

            // Fall if below 6/8 health
            if (health < FRACT_MUL(maxHealth, 6, 8))
            {
                shouldFall++;
            }
            break;

        case NETTORI_PART_LEFT_ARM:
            gCurrentSprite.paletteRow = gSpriteData[ramSlot].paletteRow;

            // Fall if below 7/8 health
            if (health < FRACT_MUL(maxHealth, 7, 8))
            {
                shouldFall++;
            }
            break;

        case NETTORI_PART_HEAD_VINES:
            gCurrentSprite.paletteRow = gSpriteData[ramSlot].paletteRow;

            if (health == 0)
            {
                gCurrentSprite.pose = NETTORI_PART_POSE_EXPLODING;
                gCurrentSprite.work1 = 30;
                gCurrentSprite.paletteRow = 0;
                break;
            }

            // Set correct oam, either shooting or idle
            if (gSpriteData[ramSlot].work0 == NETTORI_SHOOTING_POSITION_HIGH)
            {
                if (gCurrentSprite.pOam == sNettoriPartOam_HeadVinesIdle)
                {
                    gCurrentSprite.pOam = sNettoriPartOam_HeadVinesShooting;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                }
            }
            else if (gSpriteData[ramSlot].work0 == NETTORI_SHOOTING_POSITION_NONE)
            {
                if (gCurrentSprite.pOam == sNettoriPartOam_HeadVinesShooting)
                {
                    gCurrentSprite.pOam = sNettoriPartOam_HeadVinesIdle;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                }
            }
            break;

        case NETTORI_PART_BODY_VINES:
            gCurrentSprite.paletteRow = gSpriteData[ramSlot].paletteRow;

            if (health == 0)
            {
                gCurrentSprite.pose = NETTORI_PART_POSE_EXPLODING;
                gCurrentSprite.work1 = 30;
                gCurrentSprite.paletteRow = 0;
                break;
            }

            // Set correct oam, either shooting or idle
            if (gSpriteData[ramSlot].work0 == NETTORI_SHOOTING_POSITION_LOW)
            {
                if (gCurrentSprite.pOam == sNettoriPartOam_BodyVinesIdle)
                {
                    gCurrentSprite.pOam = sNettoriPartOam_BodyVinesShooting;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                }
            }
            else if (gSpriteData[ramSlot].work0 == NETTORI_SHOOTING_POSITION_NONE)
            {
                if (gCurrentSprite.pOam == sNettoriPartOam_BodyVinesShooting)
                {
                    gCurrentSprite.pOam = sNettoriPartOam_BodyVinesIdle;
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                }
            }
            break;

        case NETTORI_PART_PLASMA_SHOOTER:
            if (health == 0)
            {
                gCurrentSprite.status = 0;
                break;
            }

            if (health < maxHealth / 2)
            {
                if (gCurrentSprite.work1 == 20)
                {
                    gCurrentSprite.animationDurationCounter = 0;
                    gCurrentSprite.currentAnimationFrame = 0;
                    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

                    // Set shooting position
                    if (gCurrentSprite.pOam == sNettoriPartOam_PlasmaShootingHigh)
                        gSpriteData[ramSlot].work0 = NETTORI_SHOOTING_POSITION_HIGH;
                    else
                        gSpriteData[ramSlot].work0 = NETTORI_SHOOTING_POSITION_LOW;

                    // Shoot plasma beam
                    if (gCurrentSprite.pOam == sNettoriPartOam_PlasmaShootingHigh)
                    {
                        SpriteSpawnSecondary(SSPRITE_NETTORI_PLASMA_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - (BLOCK_SIZE * 4 + QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE),
                            gCurrentSprite.xPosition - (BLOCK_SIZE + EIGHTH_BLOCK_SIZE), 0);
                    }
                    else
                    {
                        SpriteSpawnSecondary(SSPRITE_NETTORI_PLASMA_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - (BLOCK_SIZE * 2 + HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE),
                            gCurrentSprite.xPosition - HALF_BLOCK_SIZE, 0);
                    }
                }

                // Update palette based on animation frame
                if (gCurrentSprite.currentAnimationFrame == 0 || gCurrentSprite.currentAnimationFrame == 2)
                {
                    gCurrentSprite.paletteRow = 1;
                }
                else if (gCurrentSprite.currentAnimationFrame == 4 || gCurrentSprite.currentAnimationFrame == 6)
                {
                    gCurrentSprite.paletteRow = 2;
                }
                else if (gCurrentSprite.currentAnimationFrame == 8 || gCurrentSprite.currentAnimationFrame == 10 ||
                    gCurrentSprite.currentAnimationFrame == 12)
                {
                    gCurrentSprite.paletteRow = 3;
                }
                else if (gCurrentSprite.currentAnimationFrame == 14)
                {
                    gCurrentSprite.paletteRow = 0;

                    if (gCurrentSprite.work1 == 90)
                    {
                        gCurrentSprite.status |= SPRITE_STATUS_NOT_DRAWN;
                        gSpriteData[ramSlot].work0 = NETTORI_SHOOTING_POSITION_NONE;
                        gCurrentSprite.work1 = 0;

                        // Choose shooting position, always low if crouched/morphed, otherwise leave to rng
                        // Rng has 2/3 of being low, and 1/3 of being high
                        if (SpriteUtilSamusCheckCrouchingOrMorphed())
                            gCurrentSprite.pOam = sNettoriPartOam_PlasmaShootingLow;
                        else if (gSpriteRandomNumber >= 10)
                            gCurrentSprite.pOam = sNettoriPartOam_PlasmaShootingLow;
                        else
                            gCurrentSprite.pOam = sNettoriPartOam_PlasmaShootingHigh;
                    }
                }

                gCurrentSprite.work1++;
            }
            else
            {
                // Choose shooting position, doesn't matter because in this health threshold nettori doesn't shoot
                if (SpriteUtilSamusCheckCrouchingOrMorphed())
                    gCurrentSprite.pOam = sNettoriPartOam_PlasmaShootingLow;
                else if (gSamusData.yPosition < gCurrentSprite.yPosition - (BLOCK_SIZE * 3 + HALF_BLOCK_SIZE))
                    gCurrentSprite.pOam = sNettoriPartOam_PlasmaShootingHigh;
                else if (MOD_AND(gSpriteRandomNumber, 2) != 0)
                    gCurrentSprite.pOam = sNettoriPartOam_PlasmaShootingLow;
                else
                    gCurrentSprite.pOam = sNettoriPartOam_PlasmaShootingHigh;
            }
            break;

        default:
            gCurrentSprite.status = 0;
    }

    if (shouldFall)
    {
        // Set falling
        gCurrentSprite.work4 = 0;
        gCurrentSprite.pose = NETTORI_PART_POSE_FALLING;
    }
}

/**
 * @brief 44514 | 150 | Handles a nettori part falling
 * 
 */
void NettoriPartFalling(void)
{
    u16 yPosition;
    u16 xPosition;
    u16 particleY;
    u16 particleX;

    u8 offset;
    s16 movement;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    switch (gCurrentSprite.roomSlot)
    {
        case NETTORI_PART_HEAD:
            yPosition -= BLOCK_SIZE * 4;
            xPosition -= BLOCK_SIZE + HALF_BLOCK_SIZE;

            particleY = yPosition - HALF_BLOCK_SIZE;
            particleX = xPosition + HALF_BLOCK_SIZE;
            break;

        case NETTORI_PART_LEG:
            yPosition -= BLOCK_SIZE * 2;
            xPosition -= HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;

            particleY = yPosition;
            particleX = xPosition;
            break;

        case NETTORI_PART_RIGHT_ARM:
            yPosition -= BLOCK_SIZE * 2;
            xPosition -= BLOCK_SIZE * 2 - QUARTER_BLOCK_SIZE;

            particleY = yPosition - BLOCK_SIZE;
            particleX = xPosition + QUARTER_BLOCK_SIZE;
            break;

        case NETTORI_PART_LEFT_ARM:
            yPosition -= BLOCK_SIZE * 2;
            xPosition -= BLOCK_SIZE;

            particleY = yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE);
            particleX = xPosition + (QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            break;

        default:
            gCurrentSprite.status = 0;

            // /!\ UB, particleY and particleX aren't set in this case of the switch, but they are used right after
    }

    if (MOD_AND(gCurrentSprite.work4, 4) == 0)
        ParticleSet(particleY, particleX, PE_HEAVY_DUST_1);

    SpriteUtilCheckVerticalCollisionAtPositionSlopes(yPosition, xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.paletteRow = 0;
        gCurrentSprite.pose = 0x3A;
        gCurrentSprite.work1 = 30;

        ParticleSet(yPosition, xPosition, PE_0x32);
        SoundPlay(0x298);
    }
    else
    {
        offset = gCurrentSprite.work4;
        movement = sSpritesFallingSpeedSlow[offset];

        if (movement == SHORT_MAX)
        {
            movement = sSpritesFallingSpeedSlow[offset - 1];
            gCurrentSprite.yPosition += movement;
        }
        else
        {
            gCurrentSprite.work4++;            
            gCurrentSprite.yPosition += movement;
        }
    }
}

/**
 * @brief 44664 | 34 | Handles a nettori part exploding
 * 
 */
void NettoriPartExploding(void)
{
    if (MOD_AND(gCurrentSprite.work1, 2) == 0)
        gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.work1--;
    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.status = 0;
}

/**
 * @brief 44698 | 90 | Initializes a nettori plasma beam
 * 
 */
void NettoriPlasmaBeamInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(HALF_BLOCK_SIZE - PIXEL_SIZE);
    gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE - PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -(HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE);
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE;

    gCurrentSprite.pOam = sNettoriPlasmaBeamOam_Emerging;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.drawOrder = 3;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.health = 1;
    gCurrentSprite.frozenPaletteRowOffset = 2;

    SoundPlay(0x29A);
}

/**
 * @brief 44728 | 44 | Handles a nettori plasma beam emerging
 * 
 */
void NettoriPlasmaBeamEmerging(void)
{
    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
    {
        gCurrentSprite.pOam = sNettoriPlasmaBeamOam_Charging;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.work1 = 2;
        gCurrentSprite.pose = NETTORI_PLASMA_BEAM_POSE_MOVING_INIT;
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        
        SoundPlay(0x29B);
    }
}

/**
 * @brief 4476c | 30 | Initializes a nettori plasma beam to be moving
 * 
 */
void NettoriPlasmaBeamMovingInit(void)
{
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pOam = sNettoriPlasmaBeamOam_Moving;
        // Doesn't reset ADC and CAF?

        gCurrentSprite.pose = NETTORI_PLASMA_BEAM_POSE_MOVING;
    }

    gCurrentSprite.xPosition -= NETTORI_PLASMA_BEAM_SPEED;
}

/**
 * @brief 4479c | 44 | Handles a nettori plasma beam moving
 * 
 */
void NettoriPlasmaBeamMoving(void)
{
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousCollisionCheck != COLLISION_AIR)
    {
        ParticleSet(gCurrentSprite.yPosition + HALF_BLOCK_SIZE, gCurrentSprite.xPosition, PE_0x2F);
        gCurrentSprite.status = 0;
        SoundPlay(0x29E);
    }
    else
    {
        gCurrentSprite.xPosition -= NETTORI_PLASMA_BEAM_SPEED;
    }
}

/**
 * @brief 447e0 | 98 | Initializes a samus eater
 * 
 */
void SamusEaterInit(void)
{
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_YAMEBA;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = QUARTER_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -(BLOCK_SIZE + HALF_BLOCK_SIZE);
    gCurrentSprite.hitboxRight = BLOCK_SIZE + HALF_BLOCK_SIZE;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sSamusEaterOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;

    // Start from a random frame in the animation
    gCurrentSprite.currentAnimationFrame = MOD_AND(gSpriteRandomNumber, FRAME_DATA_LAST_ANIM_FRAME(sSamusEaterOam_Idle) + 1);

    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.frozenPaletteRowOffset = 1;

    SpriteUtilChooseRandomXFlip();

    gCurrentSprite.work1 = 90 + gSpriteRandomNumber * 4;
}

/**
 * @brief 44878 | 20 | Initializes a samus eater to be idle
 * 
 */
void SamusEaterIdleInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sSamusEaterOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 44898 | a0 | Handles a samus eater being idle
 * 
 */
void SamusEaterIdle(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_COLLIDING)
    {
        // Set eating samus
        gCurrentSprite.pose = SAMUS_EATER_POSE_EATING_SAMUS;

        gCurrentSprite.pOam = sSamusEaterOam_EatingSamus;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        return;
    }

    if (SamusEaterCheckNettoriHealthThreshold())
    {
        // Nettori is shooting plasma beams, make samus eaters fire spores
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0)
        {
            gCurrentSprite.work1 = 90 + gSpriteRandomNumber * 4;

            SpriteSpawnSecondary(SSPRITE_SAMUS_EATER_SPORE, SAMUS_EATER_SPORE_PART_MOVING, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE), gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);

            SpriteSpawnSecondary(SSPRITE_SAMUS_EATER_SPORE, SAMUS_EATER_SPORE_PART_MOVING, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - (BLOCK_SIZE + HALF_BLOCK_SIZE), gCurrentSprite.xPosition, 0);

            SoundPlayNotAlreadyPlaying(0x29C);
        }
    }
}

/**
 * @brief 44938 | 74 | Handles a samus eater eating samus
 * 
 */
void SamusEaterEatingSamus(void)
{
    u32 nslr;

    if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 2)
        SoundPlay(0x297);

    // Slowly pull samus towards the center
    if (gCurrentSprite.xPosition - PIXEL_SIZE > gSamusData.xPosition)
        gSamusData.xPosition += PIXEL_SIZE;
    else if (gCurrentSprite.xPosition + PIXEL_SIZE < gSamusData.xPosition)
        gSamusData.xPosition -= PIXEL_SIZE;

    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE, BLOCK_SIZE * 2);

    if (!(gCurrentSprite.status & SPRITE_STATUS_SAMUS_COLLIDING) && nslr == NSLR_OUT_OF_RANGE)
    {
        // Not colliding anymore and outside of the range, set idle
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
        SoundStop(0x297);
    }
}

/**
 * @brief 449ac | 2c | Initializes a samus eater to be dying
 * 
 */
void SamusEaterDyingInit(void)
{
    gCurrentSprite.pose = SAMUS_EATER_POSE_DYING;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.work1 = 16;
    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
}

/**
 * @brief 449d8 | 4c | Handles a samus eater dying
 * 
 */
void SamusEaterDying(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (MOD_AND(gCurrentSprite.work1, 2) == 0)
        gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.status = 0;

        ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_EXPLOSION_SMOKE);
        SoundPlayNotAlreadyPlaying(0x29D);
    }
}

/**
 * @brief 44a24 | 30 | Sets the side hitboxes of a samus eater
 * 
 */
void SamusEaterBudSetSidesHitboxes(void)
{
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        gCurrentSprite.hitboxLeft = -QUARTER_BLOCK_SIZE;
        gCurrentSprite.hitboxRight = BLOCK_SIZE - EIGHTH_BLOCK_SIZE;
    }
    else
    {
        gCurrentSprite.hitboxLeft = -(BLOCK_SIZE - EIGHTH_BLOCK_SIZE);
        gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 44a54 | 80 | Initializes a samus eater bud
 * 
 */
void SamusEaterBudInit(void)
{
    gCurrentSprite.yPosition -= BLOCK_SIZE;
    gCurrentSprite.xPosition += HALF_BLOCK_SIZE;

    SpriteUtilMakeSpriteFaceSamusXFlip();

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
    gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;
    SamusEaterBudSetSidesHitboxes();

    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sSamusEaterBudOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.frozenPaletteRowOffset = 1;

    // Why is this called when the sprite was made to face samus before?
    // Also this de-syncs the side hitboxes
    // Also doesn't matter because the eater bud constantly check to turn around based on samus' position
    SpriteUtilChooseRandomXFlip();
}

/**
 * @brief 44ad4 | 28 | Initializes a samus eater bud to be idle
 * 
 */
void SamusEaterBudIdleInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sSamusEaterBudOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
 
    SamusEaterBudSetSidesHitboxes();
}

/**
 * @brief 44afc | 98 | Handles a samus eater bud being idle
 * 
 */
void SamusEaterBudIdle(void)
{
    u8 canShoot;
    u32 nslr;

    canShoot = FALSE;
    nslr = SpriteUtilCheckSamusNearSpriteLeftRight(BLOCK_SIZE * 10, BLOCK_SIZE * 8);

    // Check turn around or shoot
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        if (nslr != NSLR_OUT_OF_RANGE)
        {
            if (gCurrentSprite.xPosition > gSamusData.xPosition)
                gCurrentSprite.pose = SAMUS_EATER_BUD_POSE_TURNING_AROUND_INIT;
            else
                canShoot = TRUE;
        }
    }
    else
    {
        if (nslr != NSLR_OUT_OF_RANGE)
        {
            if (gCurrentSprite.xPosition < gSamusData.xPosition)
                gCurrentSprite.pose = SAMUS_EATER_BUD_POSE_TURNING_AROUND_INIT;
            else
                canShoot = TRUE;
        }
    }

    if (canShoot && SpriteUtilCountSecondarySpriteWithRamSlot(SSPRITE_SAMUS_EATER_SPORE, gCurrentSprite.primarySpriteRamSlot) < 2)
    {
        // Set shooting
        gCurrentSprite.pose = SAMUS_EATER_BUD_POSE_SHOOTING;

        gCurrentSprite.pOam = sSamusEaterBudOam_Shooting;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        SoundPlayNotAlreadyPlaying(0x296);
    }
}

/**
 * @brief 44b94 | 2c | Initializes a samus eater bud to be turning around
 * 
 */
void SamusEaterBudTurningAroundInit(void)
{
    gCurrentSprite.pOam = sSamusEaterBudOam_TurningAround;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SAMUS_EATER_BUD_POSE_TURNING_AROUND_FIRST_PART;

    gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE + PIXEL_SIZE);
    gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE + PIXEL_SIZE;
}

/**
 * @brief 44bc0 | 24 | Handles the first part of a samus eater bud turning around
 * 
 */
void SamusEaterBudTurningAround(void)
{
    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
    {
        gCurrentSprite.status ^= SPRITE_STATUS_X_FLIP;
        gCurrentSprite.pose = SAMUS_EATER_BUD_POSE_TURNING_AROUND_SECOND_PART;
    }
}

/**
 * @brief 44be4 | 1c | Handles the second part of a samus eater bud turning around
 * 
 */
void SamusEaterBudTurningAroundSecondPart(void)
{
    if (SpriteUtilCheckNearEndOfCurrentSpriteAnimation())
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

/**
 * @brief 44c00 | 88 | Handles a samus eater bud shooting
 * 
 */
void SamusEaterBudShooting(void)
{
    if (gCurrentSprite.currentAnimationFrame == 3 && gCurrentSprite.animationDurationCounter == 4)
    {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        {
            SpriteSpawnSecondary(SSPRITE_SAMUS_EATER_SPORE, SAMUS_EATER_SPORE_PART_FLOATING, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + HALF_BLOCK_SIZE,
                gCurrentSprite.xPosition + (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE), SPRITE_STATUS_X_FLIP);
        }
        else
        {
            SpriteSpawnSecondary(SSPRITE_SAMUS_EATER_SPORE, SAMUS_EATER_SPORE_PART_FLOATING, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + HALF_BLOCK_SIZE,
                gCurrentSprite.xPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE - PIXEL_SIZE), 0);
        }
    }

    if (SpriteUtilCheckNearEndOfCurrentSpriteAnimation())
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

/**
 * @brief 44c88 | 2c | Initializes a samus eater bud to be dying
 * 
 */
void SamusEaterBudDyingInit(void)
{
    gCurrentSprite.pose = 0x46;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.work1 = 8;
    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
}

/**
 * @brief 44cb4 | 4c | Handles a samus eater bud dying
 * 
 */
void SamusEaterBudDying(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (MOD_AND(gCurrentSprite.work1, 2) == 0)
        gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;

    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.status = 0;

        ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_EXPLOSION_SMOKE);
        SoundPlayNotAlreadyPlaying(0x299);
    }
}

/**
 * @brief 44d00 | b0 | Initializes a samus eater spore
 * 
 */
void SamusEaterSporeInit(void)
{
    gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -EIGHTH_BLOCK_SIZE;
    gCurrentSprite.hitboxBottom = EIGHTH_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -EIGHTH_BLOCK_SIZE;
    gCurrentSprite.hitboxRight = EIGHTH_BLOCK_SIZE;

    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.pOam = sSamusEaterSporeOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work4 = 0;
    gCurrentSprite.work3 = 0;

    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;

    gCurrentSprite.work2 = 0;

    if (gCurrentSprite.roomSlot != SAMUS_EATER_SPORE_PART_FLOATING)
        gCurrentSprite.pose = SAMUS_EATER_SPORE_POSE_MOVING;
    else
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

/**
 * @brief 44db0 | 130 | Handles a samus eater spore floating
 * 
 */
void SamusEaterSporeFloating(void)
{
    u8 offset;
    s16 yMovement;
    s16 xMovement;

    offset = gCurrentSprite.work4;
    yMovement = sNettoriEaterSporeFloatingYVelocity[offset];

    if (yMovement == SHORT_MAX)
    {
        yMovement = sNettoriEaterSporeFloatingYVelocity[0];
        offset = 0;
    }

    gCurrentSprite.work4 = offset + 1;
    gCurrentSprite.yPosition += yMovement;

    if (gCurrentSprite.work2)
        gCurrentSprite.yPosition += ONE_SUB_PIXEL * 2;
    else
        gCurrentSprite.yPosition += ONE_SUB_PIXEL * 1;

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        offset = gCurrentSprite.work3;
        xMovement = sNettoriEaterSporeFloatingSmallXVelocity[offset];

        if (xMovement == SHORT_MAX)
        {
            xMovement = sNettoriEaterSporeFloatingSmallXVelocity[0];
            offset = 0;
        }

        gCurrentSprite.work3 = offset + 1;
        gCurrentSprite.xPosition += xMovement;
        gCurrentSprite.xPosition += (PIXEL_SIZE - ONE_SUB_PIXEL);

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + QUARTER_BLOCK_SIZE);
    
        if (gPreviousCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.status ^= SPRITE_STATUS_X_FLIP;
            gCurrentSprite.work3 = 0;
            gCurrentSprite.work2 = TRUE;
        }
    }
    else
    {
        offset = gCurrentSprite.work3;
        xMovement = sNettoriEaterSporeFloatingLargeXVelocity[offset];

        if (xMovement == SHORT_MAX)
        {
            xMovement = sNettoriEaterSporeFloatingLargeXVelocity[0];
            offset = 0;
        }

        gCurrentSprite.work3 = offset + 1;
        gCurrentSprite.xPosition += xMovement;
        gCurrentSprite.xPosition -= (PIXEL_SIZE - ONE_SUB_PIXEL);

        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - QUARTER_BLOCK_SIZE);
    
        if (gPreviousCollisionCheck != COLLISION_AIR)
        {
            gCurrentSprite.status ^= SPRITE_STATUS_X_FLIP;
            gCurrentSprite.work3 = 0;
            gCurrentSprite.work2 = TRUE;
        }
    }

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + QUARTER_BLOCK_SIZE, gCurrentSprite.xPosition);

    if (gCurrentAffectingClipdata.hazard == HAZARD_WATER || gPreviousCollisionCheck != COLLISION_AIR || gCurrentSprite.health == 0)
        gCurrentSprite.pose = SAMUS_EATER_SPORE_POSE_EXPLODING_INIT;
}

/**
 * @brief 44ee0 | 98 | Handles a samus eater spore moving
 * 
 */
void SamusEaterSporeMoving(void)
{
    u8 offset;
    s16 movement;

    offset = gCurrentSprite.work4;
    movement = sNettoriEaterSporeMovingYVelocity[offset];

    if (movement == SHORT_MAX)
    {
        movement = sNettoriEaterSporeMovingYVelocity[offset - 1];
        gCurrentSprite.yPosition += movement;
    }
    else
    {
        gCurrentSprite.work4++;
        gCurrentSprite.yPosition += movement;
    }

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        gCurrentSprite.xPosition += PIXEL_SIZE;
    else
        gCurrentSprite.xPosition -= PIXEL_SIZE;

    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gCurrentAffectingClipdata.hazard == HAZARD_WATER || gPreviousCollisionCheck != COLLISION_AIR || gCurrentSprite.health == 0)
        gCurrentSprite.pose = 0x37;
}

/**
 * @brief 44f78 | 38 | Initializes a samus eater spore to be exploding
 * 
 */
void SamusEaterSporeExplodingInit(void)
{
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;

    gCurrentSprite.pOam = sSamusEaterSporeOam_Exploding;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 44fb0 | 24 | Handles a samus eater spore epxloding
 * 
 */
void SamusEaterSporeExploding(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (SpriteUtilCheckEndOfCurrentSpriteAnimation())
        gCurrentSprite.status = 0;
}

/**
 * @brief 44fd4 | 64 | Nettori AI
 * 
 */
void Nettori(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            NettoriInit();
            break;

        case SPRITE_POSE_IDLE:
            NettoriIdle();
            break;

        case NETTORI_POSE_DYING_INIT:
            NettoriDyingInit();

        case NETTORI_POSE_DYING:
            NettoriTransformingIntoCoreX();
    }

    if (gCurrentSprite.health >= GET_PSPRITE_HEALTH(PSPRITE_NETTORI) / 2)
        NettoriUpdateGlowingPalette();
    else
        NettoriUpdatePalette();
}

/**
 * @brief 45038 | 48 | Nettori part AI
 * 
 */
void NettoriPart(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            NettoriPartInit();
            break;

        case SPRITE_POSE_IDLE:
            NettoriPartIdle();
            break;

        case NETTORI_PART_POSE_FALLING:
            NettoriPartFalling();
            break;

        case NETTORI_PART_POSE_EXPLODING:
            NettoriPartExploding();
    }
}

/**
 * @brief 45080 | 40 | Nettori plasma beam AI
 * 
 */
void NettoriPlasmaBeam(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            NettoriPlasmaBeamInit();
            break;

        case SPRITE_POSE_IDLE:
            NettoriPlasmaBeamEmerging();
            break;

        case NETTORI_PLASMA_BEAM_POSE_MOVING_INIT:
            NettoriPlasmaBeamMovingInit();
            break;

        case NETTORI_PLASMA_BEAM_POSE_MOVING:
            NettoriPlasmaBeamMoving();
    }
}

/**
 * @brief 450c0 | 90 | Samus eater AI
 * 
 */
void SamusEater(void)
{
    if (gCurrentSprite.freezeTimer != 0)
    {
        if (gCurrentSprite.pose != SAMUS_EATER_POSE_DYING_INIT)
        {
            SpriteUtilUpdateFreezeTimer();
            return;
        }

        gCurrentSprite.paletteRow = 0;
        gCurrentSprite.freezeTimer = 0;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SamusEaterInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            SamusEaterIdleInit();

        case SPRITE_POSE_IDLE:
            SamusEaterIdle();
            break;

        case SAMUS_EATER_POSE_EATING_SAMUS:
            SamusEaterEatingSamus();
            break;

        case SAMUS_EATER_POSE_DYING_INIT:
            SamusEaterDyingInit();

        case SAMUS_EATER_POSE_DYING:
            SamusEaterDying();
    }

    gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_COLLIDING;
}

/**
 * @brief 45150 | 198 | Samus eater bud AI
 * 
 */
void SamusEaterBud(void)
{
    if (gCurrentSprite.freezeTimer != 0)
    {
        if (gCurrentSprite.pose != SAMUS_EATER_BUD_POSE_DYING_INIT)
        {
            SpriteUtilUpdateFreezeTimer();
            return;
        }

        gCurrentSprite.paletteRow = 0;
        gCurrentSprite.freezeTimer = 0;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SamusEaterBudInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            SamusEaterBudIdleInit();

        case SPRITE_POSE_IDLE:
            SamusEaterBudIdle();
            break;

        case SAMUS_EATER_BUD_POSE_TURNING_AROUND_INIT:
            SamusEaterBudTurningAroundInit();

        case SAMUS_EATER_BUD_POSE_TURNING_AROUND_FIRST_PART:
            SamusEaterBudTurningAround();
            break;

        case SAMUS_EATER_BUD_POSE_TURNING_AROUND_SECOND_PART:
            SamusEaterBudTurningAroundSecondPart();
            break;

        case SAMUS_EATER_BUD_POSE_SHOOTING:
            SamusEaterBudShooting();
            break;

        case SAMUS_EATER_BUD_POSE_DYING_INIT:
            SamusEaterBudDyingInit();

        case SAMUS_EATER_BUD_POSE_DYING:
            SamusEaterBudDying();
    }
}

/**
 * @brief 452e8 | 48 | Samus eater spore AI
 * 
 */
void SamusEaterSpore(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SamusEaterSporeInit();
            break;

        case SPRITE_POSE_IDLE:
            SamusEaterSporeFloating();
            break;

        case SAMUS_EATER_SPORE_POSE_MOVING:
            SamusEaterSporeMoving();
            break;

        case SAMUS_EATER_SPORE_POSE_EXPLODING:
            SamusEaterSporeExploding();
            break;

        default:
            SamusEaterSporeExplodingInit();
    }
}
