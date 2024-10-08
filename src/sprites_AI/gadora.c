#include "sprites_AI/gadora.h"
#include "macros.h"
#include "globals.h"

#include "data/sprite_data.h"
#include "data/sprites/target.h"
#include "data/sprites/x_parasite.h"
#include "data/sprites/gadora.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/sprite.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"

/**
 * @brief 42d74 | 50 | Sets the clipdata collision for a gadora
 * 
 * @param caa Clipdata affecting action
 */
void GadoraSetCollision(u8 caa)
{
    u16 yPosition;
    u16 xPosition;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    // Upper middle block
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (HALF_BLOCK_SIZE + BLOCK_SIZE * 0), xPosition);

    // Upper block
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition - (HALF_BLOCK_SIZE + BLOCK_SIZE * 1), xPosition);

    // Lower middle block
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition + (HALF_BLOCK_SIZE + BLOCK_SIZE * 0), xPosition);

    // Lower block
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(yPosition + (HALF_BLOCK_SIZE + BLOCK_SIZE * 1), xPosition);
}

/**
 * @brief 42dc4 | b4 | Sets the direction and position of a gadora
 * 
 * @param caa Clipdata affecting action
 */
void GadoraSetDirectionAndPosition(u8 caa)
{
    switch (gCurrentSprite.spriteId)
    {
        case PSPRITE_GADORA_ARACHNUS:
        case PSPRITE_GADORA_ZAZABI:
        case PSPRITE_GADORA_SERRIS:
        case PSPRITE_GADORA_VARIA_CORE:
        case PSPRITE_GADORA_NIGHTMARE:
            if (caa == CAA_MAKE_SOLID)
            {
                // Facing left
                gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
                gCurrentSprite.xPosition -= (QUARTER_BLOCK_SIZE - PIXEL_SIZE);
            }
            break;

        case PSPRITE_GADORA_CHARGE_BEAM:
        case PSPRITE_GADORA_WIDE_BEAM:
        case PSPRITE_GADORA_RIDLEY:
            if (caa == CAA_MAKE_SOLID)
            {
                // Facing right
                gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
                gCurrentSprite.xPosition += (QUARTER_BLOCK_SIZE - PIXEL_SIZE);
            }
            break;

        case PSPRITE_GADORA_NETTORI:
            if (caa == CAA_MAKE_SOLID)
            {
                // Facing left
                gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
                gCurrentSprite.xPosition -= (QUARTER_BLOCK_SIZE - PIXEL_SIZE);
            }

            GadoraSetCollision(caa);
            break;

        case PSPRITE_GADORA_YAKUZA:
            if (caa == CAA_MAKE_SOLID)
            {
                // Facing right
                gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
                gCurrentSprite.xPosition += (QUARTER_BLOCK_SIZE - PIXEL_SIZE);
            }

            GadoraSetCollision(caa);
            break;

        default:
            // Invalid gadora, destroy sprite
            gCurrentSprite.status = 0;
    }
}

/**
 * @brief 42e78 | 3c | Handles the death of a gadora
 * 
 */
void GadoraDeath(void)
{
    u8 spriteId;
    u16 gadoraBit;
    u16 yPosition;
    u16 xPosition;

    // All gadora sprite ids are next to each other numerically, so doing spriteId - firstGadoraId offsets the id to start at 0
    spriteId = gCurrentSprite.spriteId - PSPRITE_GADORA_ARACHNUS;

    // Get bit affected by the current gadora
    gadoraBit = 1 << spriteId;

    // Register gadora as destroyed
    gGadorasDestroyed |= gadoraBit;

    // Remove collision if necessary
    GadoraSetDirectionAndPosition(CAA_REMOVE_SOLID);

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    // Free hatch linked to the gadora
    UpdateGadoraHatch(xPosition, yPosition, TRUE);
}

/**
 * @brief 42eb4 | 164 | Initializes a gadora sprite
 * 
 */
void GadoraInit(void)
{
    u16 gadoraBit;

    u8 spriteSlot;
    u16 yPosition;
    u16 xPosition;

    SpriteUtilTrySetAbsorbXFlag();

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X)
    {
        // A gadora can't absorb an X, destroy sprite if the flag is set
        gCurrentSprite.status = 0;
        return;
    }

    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT)
    {
        // Set spawning from X
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = ARRAY_SIZE(sXParasiteMosaicValues);
    }
    else
    {
        // Get offset for the current gadora
        spriteSlot = gCurrentSprite.spriteId;
        spriteSlot -= PSPRITE_GADORA_ARACHNUS;

        // Get bit affected by the current gadora
        gadoraBit = gGadorasDestroyed >> spriteSlot;

        if (gadoraBit & 1)
        {
            // Gadora was already destroyed, destroy sprite
            gCurrentSprite.status = 0;
            return;
        }

        // Update direction, position and clipdata collision
        GadoraSetDirectionAndPosition(CAA_MAKE_SOLID);

        yPosition = gCurrentSprite.yPosition;
        xPosition = gCurrentSprite.xPosition;

        // Lock hatch linked to the gadora
        UpdateGadoraHatch(xPosition, yPosition, FALSE);

        // Spawn roots
        SpriteSpawnSecondary(SSPRITE_GADORA_ROOTS, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
            yPosition, xPosition, gCurrentSprite.status & SPRITE_STATUS_X_FLIP);

        // Offset slightly forward for the eye position
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            xPosition += QUARTER_BLOCK_SIZE;
        else
            xPosition -= QUARTER_BLOCK_SIZE;

        // Spawn eye
        spriteSlot = SpriteSpawnSecondary(SSPRITE_GADORA_EYE, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, yPosition, xPosition, 0);

        if (spriteSlot == UCHAR_MAX)
        {
            // Couldn't spawn eye, destroy sprite
            gCurrentSprite.status = 0;
            return;
        }

        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
    }

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -(BLOCK_SIZE * 2);
    gCurrentSprite.hitboxBottom = BLOCK_SIZE * 2;
    gCurrentSprite.hitboxLeft = -(HALF_BLOCK_SIZE);
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

    gCurrentSprite.pOam = sGadoraOam_EyeClosed;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    // Counter for how many beams were shot
    gCurrentSprite.work2 = 0;

    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawOrder = 5;

    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
}

/**
 * @brief 43018 | 30 | Initializes a gadora to be idle
 * 
 */
void GadoraIdleInit(void)
{
    gCurrentSprite.pose = SPRITE_POSE_IDLE;

    gCurrentSprite.pOam = sGadoraOam_EyeClosed;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    // Timer for how long the gadora waits before opening its eye
    gCurrentSprite.work1 = 61 + gSpriteRandomNumber * 4;
}

/**
 * @brief 43048 | 48 | Hanbdles a gadora being idle
 * 
 */
void GadoraIdle(void)
{
    u32 nsfb;

    // Decrement timer
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
    {
        // Timer ended, check samus is in front
        nsfb = SpriteUtilCheckSamusNearSpriteFrontBehind(BLOCK_SIZE * 2, BLOCK_SIZE * 7, 0);

        if (nsfb == NSFB_IN_FRONT)
        {
            gCurrentSprite.pose = GADORA_POSE_OPENING_EYE_INIT;
        }
        else
        {
            // Samus isn't in front of the gadora, reset timer
            gCurrentSprite.work1 = 61 + gSpriteRandomNumber * 4;
        }
    }
}

/**
 * @brief 43090 | 34 | Initializes a gadora to open its eye
 * 
 */
void GadoraOpeningEyeInit(void)
{
    gCurrentSprite.pose = GADORA_POSE_OPENING_EYE;

    gCurrentSprite.pOam = sGadoraOam_OpeningEye;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(0x1B2);
}

/**
 * @brief 430c4 | 7c | Handles a gadora opening its eye
 * 
 */
void GadoraOpeningEye(void)
{
    if (!SpriteUtilCheckEndCurrentSpriteAnim())
        return;

    // Determine whether or not to shoot, ~50% chance and didn't already shoot more than 3 beams
    if (gSpriteRandomNumber >= 7 && gCurrentSprite.work2 <= 3)
    {
        // Set shooting

        // Increment beam shot counter
        gCurrentSprite.work2++;
        gCurrentSprite.pose = GADORA_POSE_SHOOTING;

        gCurrentSprite.pOam = sGadoraOam_Shooting;

        if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
            SoundPlayNotAlreadyPlaying(0x1B5);

        // Timer for how long the eye stays open
        gCurrentSprite.work1 = 48;
    }
    else
    {
        // Set vulnerable
        
        gCurrentSprite.work2 = 0;
        gCurrentSprite.pose = GADORA_POSE_VULNERABLE;

        gCurrentSprite.pOam = sGadoraOam_Vulnerable;

        // Timer for how long the eye stays open
        gCurrentSprite.work1 = 80;
    }

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 43140 | 44 | Handles a gadora being vulnerable
 * 
 */
void GadoraVulnerable(void)
{
    if (gCurrentSprite.work1 == 0)
    {
        gCurrentSprite.pose = GADORA_POSE_CLOSING_EYE;

        gCurrentSprite.pOam = sGadoraOam_ClosingEye;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
            SoundPlayNotAlreadyPlaying(0x1B3);
    }
    else
    {
        // Decrement timer
        gCurrentSprite.work1--;
    }
}

/**
 * @brief 43184 | 88 | Handles a gadora shooting
 * 
 */
void GadoraShooting(void)
{
    u16 xPosition;
    u16 status;

    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 != 0)
        return;

    // Get spawn X position and status
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        xPosition = gCurrentSprite.xPosition + QUARTER_BLOCK_SIZE;
        status = SPRITE_STATUS_X_FLIP;
    }
    else
    {
        xPosition = gCurrentSprite.xPosition - QUARTER_BLOCK_SIZE;
        status = 0;
    }

    // Spawn beam
    SpriteSpawnSecondary(SSPRITE_GADORA_BEAM, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.yPosition, xPosition, status);

    if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(0x1B6);

    gCurrentSprite.pose = GADORA_POSE_CLOSING_EYE;

    gCurrentSprite.pOam = sGadoraOam_ClosingEye;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 4320c | 1c | Handles a gadora closing its eye
 * 
 */
void GadoraClosingEye(void)
{
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

/**
 * @brief 43228 | 1dc | Gadora AI
 * 
 */
void Gadora(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            GadoraInit();
            break;

        case SPRITE_POSE_IDLE_INIT:
            GadoraIdleInit();

        case SPRITE_POSE_IDLE:
            GadoraIdle();
            break;

        case GADORA_POSE_OPENING_EYE_INIT:
            GadoraOpeningEyeInit();

        case GADORA_POSE_OPENING_EYE:
            GadoraOpeningEye();
            break;

        case GADORA_POSE_VULNERABLE:
            GadoraVulnerable();
            break;

        case GADORA_POSE_SHOOTING:
            GadoraShooting();
            break;

        case GADORA_POSE_CLOSING_EYE:
            GadoraClosingEye();
            break;

        case SPRITE_POSE_DYING_INIT:
            GadoraDeath();
            SpriteDyingInit();

        case SPRITE_POSE_DYING:
            SpriteDying();
            break;

        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            GadoraInit();

        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;

        case SPRITE_POSE_TURNING_INTO_X:
            XParasiteInit();
            break;
    }
}

/**
 * @brief 43404 | 198 | Gadora eye AI
 * 
 */
void GadoraEye(void)
{
    u8 ramSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x1B8);

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gCurrentSprite.pose == 0)
    {
        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;

        gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);

        gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
        gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
        gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

        gCurrentSprite.hitboxTop = -(BLOCK_SIZE - QUARTER_BLOCK_SIZE);
        gCurrentSprite.hitboxBottom = BLOCK_SIZE - QUARTER_BLOCK_SIZE;
        gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE);
        gCurrentSprite.hitboxRight = QUARTER_BLOCK_SIZE;

        gCurrentSprite.pOam = sTargetOam_Idle;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
    }

    if (gSpriteData[ramSlot].status & SPRITE_STATUS_HIDDEN)
    {
        gCurrentSprite.status |= SPRITE_STATUS_HIDDEN;
        return;
    }

    gCurrentSprite.status &= ~SPRITE_STATUS_HIDDEN;
    gSpriteData[ramSlot].paletteRow = gCurrentSprite.paletteRow;

    // Check eye is dead
    if (gCurrentSprite.health == 0 && gSpriteData[ramSlot].pose < SPRITE_POSE_DYING_INIT)
    {
        // Set main gadora sprite to be dying
        gSpriteData[ramSlot].pose = SPRITE_POSE_DYING_INIT;
        gSpriteData[ramSlot].ignoreSamusCollisionTimer = 1;
        gSpriteData[ramSlot].health = 0;
        gSpriteData[ramSlot].properties |= SP_DESTROYED;
        gSpriteData[ramSlot].freezeTimer = 0;
        gSpriteData[ramSlot].paletteRow = 0;

        // Kill eye
        gCurrentSprite.status = 0;
    }
    else
    {
        // Sync vulnerability with the main sprite
        switch (gSpriteData[ramSlot].pose)
        {
            case GADORA_POSE_VULNERABLE:
                // Allow projectile collision
                gCurrentSprite.status &= ~SPRITE_STATUS_IGNORE_PROJECTILES;

                if (SPRITE_HAS_ISFT(gCurrentSprite))
                {
                    // Eye got it, set timer to 0 to close it right away
                    gSpriteData[ramSlot].work1 = 0;
                }
                break;

            default:
                // Prevent projectile collision
                gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
                break;

            case SPRITE_POSE_DYING_INIT:
            case SPRITE_POSE_DYING:
                gCurrentSprite.status = 0;
        }
    }
}

/**
 * @brief 4359c | f8 | Gadora roots AI
 * 
 */
void GadoraRoots(void)
{
    u8 ramSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gCurrentSprite.pose == 0)
    {
        gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;

        gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
        gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
        gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

        gCurrentSprite.hitboxTop = -PIXEL_SIZE;
        gCurrentSprite.hitboxBottom = PIXEL_SIZE;
        gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
        gCurrentSprite.hitboxRight = PIXEL_SIZE;

        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;

        gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;

        gCurrentSprite.pOam = sGadoraRootsOam_Idle;
    }

    if (gSpriteData[ramSlot].status & SPRITE_STATUS_HIDDEN)
    {
        gCurrentSprite.status |= SPRITE_STATUS_HIDDEN;
        return;
    }

    gCurrentSprite.status &= ~SPRITE_STATUS_HIDDEN;
    gSpriteData[ramSlot].paletteRow = gCurrentSprite.paletteRow;

    // Sync oam with main gadora sprite
    switch (gSpriteData[ramSlot].pose)
    {
        case SPRITE_POSE_IDLE_INIT:
            gCurrentSprite.pOam = sGadoraRootsOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            break;

        case GADORA_POSE_OPENING_EYE_INIT:
            gCurrentSprite.pOam = sGadoraRootsOam_OpeningEye;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            break;

        case SPRITE_POSE_DYING_INIT:
        case SPRITE_POSE_DYING:
            gCurrentSprite.status = 0;
    }
}

/**
 * @brief 43694 | f4 | Gadora beam AI
 * 
 */
void GadoraBeam(void)
{
    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE + HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxBottom = BLOCK_SIZE + PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

            gCurrentSprite.pOam = sGadoraBeamOam_Idle;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;

            gCurrentSprite.pose = SPRITE_POSE_IDLE;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;

            gCurrentSprite.drawOrder = 3;
            gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
            gCurrentSprite.frozenPaletteRowOffset = 1;

        case SPRITE_POSE_IDLE:
            // Move
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.xPosition += (QUARTER_BLOCK_SIZE - PIXEL_SIZE);
            else
                gCurrentSprite.xPosition -= (QUARTER_BLOCK_SIZE - PIXEL_SIZE);

            // Check collision
            gCurrentClipdataAffectingAction = CAA_ENEMY_PROJECTILE;
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

            if (gPreviousCollisionCheck != COLLISION_AIR)
            {
                // Destroy beam
                ParticleSet(gCurrentSprite.yPosition + (BLOCK_SIZE - QUARTER_BLOCK_SIZE), gCurrentSprite.xPosition, PE_0x2F);

                if (gCurrentSprite.status & SPRITE_STATUS_ON_SCREEN)
                    SoundPlayNotAlreadyPlaying(0x1B7);

                gCurrentSprite.status = 0;
            }
    }
}

/**
 * @brief 43788 | 4 | Unused gadora sprite AI
 * 
 */
void Gadora_UnusedSprite(void)
{
    return;
}
