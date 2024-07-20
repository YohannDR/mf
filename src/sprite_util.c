#include "sprite_util.h"
#include "macros.h"
#include "gba.h"
#include "globals.h"

#include "data/sprite_data.h"
#include "data/samus_data.h"
#include "data/projectile_data.h"

#include "constants/clipdata.h"
#include "constants/samus.h"
#include "constants/sprite.h"

#include "structs/samus.h"

/**
 * @brief fd90 | 88 | Initializes a location text sprite
 * 
 */
void SpriteUtilInitLocationText(void)
{
    u8 gfxSlot;

    gfxSlot = LocationTextCheckLoad();

    if (gfxSlot < 8)
    {
        gSpriteData[0].status = SPRITE_STATUS_EXISTS | SPRITE_STATUS_ON_SCREEN | SPRITE_STATUS_NOT_DRAWN |
            SPRITE_STATUS_UNKNOWN_10 | SPRITE_STATUS_IGNORE_PROJECTILES;

        gSpriteData[0].properties = SP_ABSOLUTE_POSITION;
        gSpriteData[0].spritesetGfxSlot = gfxSlot;
        gSpriteData[0].spriteId = PSPRITE_AREA_BANNER;

        gSpriteData[0].yPosition = gSamusData.yPosition;
        gSpriteData[0].xPosition = gSamusData.xPosition;
    
        gSpriteData[0].bgPriority = 0;
        gSpriteData[0].drawOrder = 1;
        gSpriteData[0].pose = 0;
        gSpriteData[0].health = 0;
        gSpriteData[0].invincibilityStunFlashTimer = 0;
        gSpriteData[0].work0 = 0;
        gSpriteData[0].paletteRow = 0;
        gSpriteData[0].frozenPaletteRowOffset = 0;

        gSpriteData[0].ignoreSamusCollisionTimer = 1;

        gSpriteData[0].primarySpriteRamSlot = 0;
        gSpriteData[0].spritesetSlotAndProperties = 0x10;

        gSpriteData[0].freezeTimer = 0;
        gSpriteData[0].work5 = 1;
    }
}

/**
 * @brief fe18 | 110 | Calculates and applies the damage samus takes from a sprite
 * 
 * @param kbFlag Knockback samus flag
 * @param spriteSlot Sprite slot
 * @param dmgMultiplier Damage multiplier
 */
void SpriteUtilTakeDamageFromSprite(u8 kbFlag, u8 spriteSlot, u16 dmgMultiplier)
{
    u16 damage;
    u16 reductionType;
    u16 suitStatus;

    // Get damage and suit reduction
    if (gSpriteData[spriteSlot].properties & SP_SECONDARY_SPRITE)
    {
        damage = GET_SSPRITE_DAMAGE(gSpriteData[spriteSlot].spriteId);
        reductionType = MOD_AND(GET_SSPRITE_SUIT_REDUCTION(gSpriteData[spriteSlot].spriteId), SDRT_END);
    }
    else
    {
        damage = GET_PSPRITE_DAMAGE(gSpriteData[spriteSlot].spriteId);
        reductionType = MOD_AND(GET_PSPRITE_SUIT_REDUCTION(gSpriteData[spriteSlot].spriteId), SDRT_END);
    }

    // Apply damage multiplier
    damage *= dmgMultiplier;

    // Apply suit reduction, multiply damage by reduction/10
    suitStatus = gEquipment.suitMiscStatus;
    if (suitStatus & SMF_GRAVITY_SUIT)
        damage = FRACT_MUL(damage, sSuitDamageReductionPercent[reductionType][SDR_GRAVITY_SUIT], 10);
    else if (suitStatus & SMF_VARIA_SUIT)
        damage = FRACT_MUL(damage, sSuitDamageReductionPercent[reductionType][SDR_VARIA_SUIT], 10);
    else
        damage = FRACT_MUL(damage, sSuitDamageReductionPercent[reductionType][SDR_POWER_SUIT], 10);

    // Force damage
    if (damage == 0)
        damage = 1;

    // Apply damage
    if (gEquipment.currentEnergy > damage)
        gEquipment.currentEnergy -= damage;
    else
        gEquipment.currentEnergy = 0;

    // Check set new pose
    if (kbFlag)
    {
        SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
    }
    else
    {
        if (gEquipment.currentEnergy == 0)
            SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
    }
}

/**
 * @brief ff28 | 98 | Handles samus taking damage from the SA-X ice beam when in power suit
 * 
 */
void SpriteUtilTakeDamageFromSA_XIceBeamWithPowerSuit(u8 spriteSlot)
{
    u16 damage;
    u16 reductionType;

    // Get damage and reduction
    damage = GET_SSPRITE_DAMAGE(SSPRITE_SA_X_ICE_BEAM);
    reductionType = GET_SSPRITE_SUIT_REDUCTION(SSPRITE_SA_X_ICE_BEAM) & 3;

    // Compute damage
    damage = FRACT_MUL(damage, sSuitDamageReductionPercent[reductionType][0], 10);

    // Force damage
    if (damage == 0)
        damage = 1;

    // Apply damage
    if (gEquipment.currentEnergy > damage)
    {
        gEquipment.currentEnergy -= damage;
    }
    else
    {
        // One shot protection, drop samus at 1 HP before killing her
        if (gEquipment.currentEnergy == 1)
           gEquipment.currentEnergy = 0;
        else
            gEquipment.currentEnergy = 1;
    }

    // Kill or freeze
    if (gEquipment.currentEnergy == 0)
        SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
    else
        SAMUS_SET_POSE(SPOSE_FROZEN_REQUEST);
}

/**
 * @brief ffc0 | 68 | Handles samus taking constant damage from a sprite
 * 
 */
void SpriteUtilTakeConstantDamage(void)
{
    // Apply damage every 8 frames
    if (MOD_AND(gFrameCounter8Bit, SPRITE_CONSTANT_DAMAGE_INTERVAL) != 0)
        return;

    // Play a sound every 16 frames
    if (MOD_AND(gFrameCounter8Bit, 16) == 0)
        SoundPlay(0x282);

    // Set invincible
    gSamusData.invincibilityTimer = SPRITE_CONSTANT_DAMAGE_INTERVAL;

    // Apply damage
    if (gEquipment.currentEnergy > 1)
        gEquipment.currentEnergy--;
    else
        gEquipment.currentEnergy = 0;

    // Check kill
    if (gEquipment.currentEnergy == 0)
        SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
}

/**
 * @brief 10028 | a4 | Handles taking damage from an omega metroid swipe
 * 
 * @param spriteSlot Sprite slot
 */
void SpriteUtilTakeDamageFromOmegaMetroidSwiping(u8 spriteSlot)
{
    u16 damage;

    // Get damage
    if (gSpriteData[spriteSlot].properties & SP_SECONDARY_SPRITE)
        damage = GET_SSPRITE_DAMAGE(gSpriteData[spriteSlot].spriteId);
    else
        damage = GET_PSPRITE_DAMAGE(gSpriteData[spriteSlot].spriteId);

    if (gEquipment.beamStatus & BF_ICE_BEAM)
    {
        // Has ice beam, apply double damage
        damage *= 2;

        if (gEquipment.currentEnergy > damage)
            gEquipment.currentEnergy -= damage;
        else
            gEquipment.currentEnergy = 0;
    }
    else
    {
        // Doesn't have ice beam, set to 1 health
        gEquipment.currentEnergy = 1;
        ScreenShakeStartVertical(40, 0x80 | 1);
        SoundPlay(0x2AF);
    }

    // Always hurt
    SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
}

/**
 * @brief 100cc | 4c | Handles taking damage from a yakuza slam
 * 
 */
void SpriteUtilTakeDamageFromYakuzaSlamming(void)
{
    u16 damage;

    // Get damage
    damage = GET_PSPRITE_DAMAGE(PSPRITE_YAKUZA) * 5;

    // Apply damage
    if (gEquipment.currentEnergy > damage)
        gEquipment.currentEnergy -= damage;
    else
        gEquipment.currentEnergy = 0;

    // Always hurt
    SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
}

/**
 * @brief 10118 | 98 | Handles taking constant damage from yakuza
 * 
 */
void SpriteUtilTakeConstantDamageFromYakuza(void)
{
    u16 damage;

    // Apply damage every 16 frames
    if (MOD_AND(gFrameCounter8Bit, SPRITE_CONSTANT_DAMAGE_INTERVAL * 2) != 0)
        return;

    // Get damage
    damage = GET_PSPRITE_DAMAGE(PSPRITE_YAKUZA) / 10;

    // Apply damage
    if (gEquipment.currentEnergy > damage)
    {
        gEquipment.currentEnergy -= damage;
        gSamusData.invincibilityTimer = SPRITE_CONSTANT_DAMAGE_INTERVAL;
    }
    else
    {
        gEquipment.currentEnergy = 0;
        SAMUS_SET_POSE(SPOSE_HURT_REQUEST);
    }

    if (gEquipment.currentEnergy != 0)
    {
        // Play hurt sounds
        if (MOD_AND(gEquipment.currentEnergy, 16) == 0)
            unk_2894(0x88);
        else if (MOD_AND(gEquipment.currentEnergy, 16) == 7)
            unk_2894(0x88);

        unk_2894(0x89);
    }
}

/**
 * @brief 101b0 | 20 | Handles taking a knockback
 * 
 */
void SpriteUtilTakeKnockback(u8 spriteSlot)
{
    SAMUS_SET_POSE(SPOSE_KNOCKBACK_REQUEST);
}

/**
 * @brief 101d0 | 50 | Checks if 2 objects are touching (AABB collision)
 * 
 * @param o1Top Object 1 top
 * @param o1Bottom Object 1 bottom
 * @param o1Left Object 1 left
 * @param o1Right Object 1 right
 * @param o2Top Object 2 top
 * @param o2Bottom Object 2 bottom
 * @param o2Left Object 2 left
 * @param o2Right Object 2 right
 * @return u32 bool, touching
 */
u32 SpriteUtilCheckObjectsTouching(u16 o1Top, u16 o1Bottom, u16 o1Left, u16 o1Right, u16 o2Top, u16 o2Bottom, u16 o2Left, u16 o2Right)
{
    if (o2Bottom >= o1Top && o2Top < o1Bottom && o2Right >= o1Left && o2Left < o1Right)
        return TRUE;

    return FALSE;
}

/**
 * @brief 10220 | e38 | Handles the collision between samus and the sprites
 * 
 */
void SpriteUtilSamusAndSpriteCollision(void)
{
    u16 samusY;
    u16 samusX;
    u16 samusTop;
    u16 samusBottom;
    u16 samusLeft;
    u16 samusRight;
    u16 previousX;

    u8 i;
    u16 status;

    u16 spriteY;
    u16 spriteX;
    u16 spriteTop;
    u16 spriteBottom;
    u16 spriteLeft;
    u16 spriteRight;

    u16 collisionCenterY;
    u16 collisionCenterX;
    u8 collisionFlags;
    u16 section;
    u16 statusCheckFlags;

    samusY = gSamusData.yPosition;
    samusX = gSamusData.xPosition;

    previousX = gPreviousXPosition;

    samusTop = samusY + gSamusData.drawDistanceTop;
    samusBottom = samusY + gSamusData.drawDistanceBottom;
    samusLeft = samusX + gSamusData.drawDistanceLeft;
    samusRight = samusX + gSamusData.drawDistanceRight;

    statusCheckFlags = SPRITE_STATUS_EXISTS | SPRITE_STATUS_ON_SCREEN | SPRITE_STATUS_UNKNOWN_2000;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        status = gSpriteData[i].status;
        if ((status & statusCheckFlags) != (SPRITE_STATUS_EXISTS | SPRITE_STATUS_ON_SCREEN))
            continue;

        if (gSpriteData[i].ignoreSamusCollisionTimer != 0)
            continue;

        spriteY = gSpriteData[i].yPosition;
        spriteX = gSpriteData[i].xPosition;

        spriteTop = spriteY + gSpriteData[i].hitboxTop;
        spriteBottom = spriteY + gSpriteData[i].hitboxBottom;
        spriteLeft = spriteX + gSpriteData[i].hitboxLeft;
        spriteRight = spriteX + gSpriteData[i].hitboxRight;

        if (!SpriteUtilCheckObjectsTouching(samusTop, samusBottom, samusLeft, samusRight, spriteTop, spriteBottom, spriteLeft, spriteRight))
            continue;

        gIgnoreSamusAndSpriteCollision = FALSE;

        collisionCenterY = spriteTop + (spriteBottom - spriteTop) / 2;
        collisionCenterX = spriteLeft + (spriteRight - spriteLeft) / 2;

        collisionFlags = SPRITE_COLLISION_FLAG_NONE;

        if (collisionCenterY - PIXEL_SIZE > samusBottom)
        {
            if (gSamusData.yVelocity <= 24)
                collisionFlags = SPRITE_COLLISION_FLAG_ON_TOP;
        }

        if (collisionCenterY + PIXEL_SIZE < samusTop)
            collisionFlags |= SPRITE_COLLISION_FLAG_ON_BOTTOM;

        if (collisionCenterX >= previousX)
            collisionFlags |= SPRITE_COLLISION_FLAG_ON_LEFT;
        else
            collisionFlags |= SPRITE_COLLISION_FLAG_ON_RIGHT;

        if (gSpriteData[i].freezeTimer != 0)
        {
            if (!SpriteUtilSamusCheckPassThroughSprite(i))
            {
                if (samusY - (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2) < spriteTop)
                {
                    SpriteUtilCheckCollisionAtPosition(spriteTop + ONE_SUB_PIXEL + gSamusData.drawDistanceTop, samusX);

                    if (gPreviousCollisionCheck == COLLISION_AIR)
                    {
                        gSamusData.yPosition = spriteTop + ONE_SUB_PIXEL;

                        gSpriteData[i].status |= SPRITE_STATUS_SAMUS_ON_TOP;
                        gSpriteData[i].standingOnSprite = 2;
                    }
                }
                else if (samusTop + QUARTER_BLOCK_SIZE > spriteBottom)
                {
                    SpriteUtilCheckCollisionAtPosition(spriteBottom - gSamusData.drawDistanceTop, samusX);

                    if (gPreviousCollisionCheck == COLLISION_AIR)
                    {
                        gSamusData.yPosition = spriteBottom - gSamusData.drawDistanceTop;

                        if (gSamusData.yVelocity > 0 && gEquipment.currentEnergy != 0)
                            gSamusData.yVelocity = 0;
                    }
                }
                else if (samusX < spriteLeft || samusX > spriteRight)
                {
                    if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                    {
                        SpriteUtilCheckCollisionAtPosition(samusY, spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                        if (gPreviousCollisionCheck == COLLISION_AIR)
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY - BLOCK_SIZE,
                                spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                            if (gPreviousCollisionCheck == COLLISION_AIR || SpriteUtilCheckMorphed())
                            {
                                gSamusData.xPosition = spriteLeft - gSamusData.drawDistanceRight;

                                if (gSamusData.direction & KEY_RIGHT && gEquipment.currentEnergy != 0)
                                    gSamusData.xVelocity = 0;
                            }
                        }
                    }
                    else
                    {
                        SpriteUtilCheckCollisionAtPosition(samusY, spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                        if (gPreviousCollisionCheck == COLLISION_AIR)
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY - BLOCK_SIZE,
                                spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                            if (gPreviousCollisionCheck == COLLISION_AIR || SpriteUtilCheckMorphed())
                            {
                                gSamusData.xPosition = spriteRight - gSamusData.drawDistanceLeft;

                                if (gSamusData.direction & KEY_LEFT && gEquipment.currentEnergy != 0)
                                    gSamusData.xVelocity = 0;
                            }
                        }
                    }
                }
            }
        }
        else
        {
            switch (gSpriteData[i].samusCollision)
            {
                case SSC_NONE:
                    break;

                case SSC_SOLID:
                    if (SpriteUtilSamusCheckPassThroughSprite(i))
                        break;

                    if (samusY - (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2) < spriteTop)
                    {
                        SpriteUtilCheckCollisionAtPosition(spriteTop + ONE_SUB_PIXEL + gSamusData.drawDistanceTop, samusX);

                        if (gPreviousCollisionCheck == COLLISION_AIR)
                        {
                            gSamusData.yPosition = spriteTop + ONE_SUB_PIXEL;

                            gSpriteData[i].status |= SPRITE_STATUS_SAMUS_ON_TOP;
                            gSpriteData[i].standingOnSprite = 2;
                        }
                    }
                    else if (samusTop + QUARTER_BLOCK_SIZE > spriteBottom)
                    {
                        SpriteUtilCheckCollisionAtPosition(spriteBottom - gSamusData.drawDistanceTop, samusX);

                        if (gPreviousCollisionCheck == COLLISION_AIR)
                        {
                            gSamusData.yPosition = spriteBottom - gSamusData.drawDistanceTop;

                            if (gSamusData.yVelocity > 0 && gEquipment.currentEnergy != 0)
                                gSamusData.yVelocity = 0;
                        }
                    }
                    else if (samusX < spriteLeft || samusX > spriteRight)
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY, spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                            {
                                SpriteUtilCheckCollisionAtPosition(samusY - BLOCK_SIZE,
                                    spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                                if (gPreviousCollisionCheck == COLLISION_AIR || SpriteUtilCheckMorphed())
                                {
                                    gSamusData.xPosition = spriteLeft - gSamusData.drawDistanceRight;

                                    if (gSamusData.direction & KEY_RIGHT && gEquipment.currentEnergy != 0)
                                        gSamusData.xVelocity = 0;
                                }
                            }
                        }
                        else
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY, spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                            {
                                SpriteUtilCheckCollisionAtPosition(samusY - BLOCK_SIZE,
                                    spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                                if (gPreviousCollisionCheck == COLLISION_AIR || SpriteUtilCheckMorphed())
                                {
                                    gSamusData.xPosition = spriteRight - gSamusData.drawDistanceLeft;

                                    if (gSamusData.direction & KEY_LEFT && gEquipment.currentEnergy != 0)
                                        gSamusData.xVelocity = 0;
                                }
                            }
                        }
                    }
                    break;

                case SSC_6:
                    gSpriteData[i].pose = 0x37;
                    
                case SSC_KNOCKS_BACK_SAMUS:
                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose() && !SpriteUtilCheckSudoScrew(i))
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                            gSamusData.direction = KEY_RIGHT;
                        else
                            gSamusData.direction = KEY_LEFT;

                        SpriteUtilTakeKnockback(i);
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 31;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_3:
                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose() && !SpriteUtilCheckSudoScrew(i))
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                            gSamusData.direction = KEY_RIGHT;
                        else
                            gSamusData.direction = KEY_LEFT;

                        SpriteUtilTakeDamageFromSprite(TRUE, i, 2);
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_HURTS_SAMUS_DIES_WHEN_HIT:
                    gSpriteData[i].pose = 0x37;

                case SSC_HURTS_SAMUS:
                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose() && !SpriteUtilCheckSudoScrew(i))
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                            gSamusData.direction = KEY_RIGHT;
                        else
                            gSamusData.direction = KEY_LEFT;

                        SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_RIDLEY_TAIL_SERRIS_SEGMENT:
                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose() && !SpriteUtilCheckSudoScrew(i))
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                            gSamusData.direction = KEY_RIGHT;
                        else
                            gSamusData.direction = KEY_LEFT;

                        SpriteUtilTakeDamageFromSprite(TRUE, i, 1);

                        if (gEquipment.currentEnergy != 0)
                        {
                            if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                                gSamusData.xVelocity -= 0x20;
                            else
                                gSamusData.xVelocity += 0x20;
                        }
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_1D:
                    if (gEquipment.currentEnergy != 0)
                    {
                        SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                        gSamusData.direction = KEY_RIGHT;

                        if (gEquipment.currentEnergy != 0)
                            gSamusData.xVelocity = -0x50;
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_19:
                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose() && !SpriteUtilCheckSudoScrew(i))
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                            gSamusData.direction = KEY_RIGHT;
                        else
                            gSamusData.direction = KEY_LEFT;

                        SpriteUtilTakeDamageFromSprite(TRUE, i, 2);

                        if (gEquipment.currentEnergy != 0)
                        {
                            if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                                gSamusData.xVelocity -= 0x20;
                            else
                                gSamusData.xVelocity += 0x20;
                        }
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_OMEGA_METROID_SWIPING:
                    if (gEquipment.currentEnergy != 0)
                    {
                        SpriteUtilTakeDamageFromOmegaMetroidSwiping(i);
                        gSamusData.direction = KEY_RIGHT;

                        if (gEquipment.currentEnergy != 0)
                        {
                            gPoseLock = 0x80;

                            section = SUB_PIXEL_TO_PIXEL(samusX) - SUB_PIXEL_TO_PIXEL(gBg1XPosition);

                            if (EventCheckAfter_IceBeamRecovered())
                            {
                                if (section > 0x50)
                                    gSamusData.xVelocity = -0x64;
                                else
                                    gSamusData.xVelocity = -0x46;
                            }
                            else
                            {
                                if (section > 0x64)
                                    gSamusData.xVelocity = -0x12C;
                                else if (section < 0x28)
                                    gSamusData.xVelocity = -0x64;
                                else
                                    gSamusData.xVelocity = -0xC8;
                            }
                        }
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_OMEGA_METROID_BODY:
                    if (gPoseLock == 0 && gSamusData.pose != SPOSE_HIT_BY_OMEGA_METROID && gEquipment.currentEnergy != 0)
                    {
                        SpriteUtilTakeDamageFromSprite(TRUE, i, 1);

                        gSamusData.direction = KEY_RIGHT;

                        if (gEquipment.currentEnergy != 0)
                        {
                            if (EventCheckAfter_IceBeamRecovered())
                                gSamusData.xVelocity = -0x46;
                            else
                                gSamusData.xVelocity = -0x78;
                        }
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_17:
                    if (gPoseLock == 0 && gSamusData.pose != SPOSE_HIT_BY_OMEGA_METROID && gEquipment.currentEnergy != 0)
                    {
                        gSamusData.direction = KEY_RIGHT;
                        SpriteUtilTakeDamageFromSprite(TRUE, i, 1);

                        if (gEquipment.currentEnergy != 0)
                            gSamusData.xVelocity = -0xA0;
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_YAMEBA:
                    gSpriteData[i].status |= SPRITE_STATUS_SAMUS_COLLIDING;

                    if (gSamusData.invincibilityTimer < 8 && !SpriteUtilCheckDamagingPose() && !SpriteUtilCheckSudoScrew(i))
                    {
                        SpriteUtilTakeDamageFromSprite(FALSE, i, 1);

                        if (gEquipment.currentEnergy != 0)
                        {
                            gSamusData.invincibilityTimer = 8;

                            if (MOD_AND(gEquipment.currentEnergy, 16) == 0)
                                unk_2894(0x88);
                            else if (MOD_AND(gEquipment.currentEnergy, 16) == 7)
                                unk_2894(0x88);

                            if (gSpriteData[i].spriteId == PSPRITE_ELECTRIC_WATER_DAMAGE || gSpriteData[i].spriteId == PSPRITE_ELECTRIC_WATER_DAMAGE_BOX_2)
                                unk_2894(0x8A);
                            else
                                unk_2894(0x89);
                        }
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_HURTS_SAMUS_SOLID:
                    if (!SamusCheckDamgingPose())
                    {
                        if (SpriteUtilCheckSudoScrew(i))
                        {
                            gIgnoreSamusAndSpriteCollision = TRUE;
                            break;
                        }

                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY, spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                                gSamusData.xPosition = spriteLeft - gSamusData.drawDistanceRight;
                        }
                        else
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY, spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                                gSamusData.xPosition = spriteRight - gSamusData.drawDistanceLeft;
                        }

                        if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose())
                        {
                            SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                        }
                        else
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY + ONE_SUB_PIXEL + gSamusData.drawDistanceTop, samusX);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                            {
                                if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                                    gSamusData.direction = KEY_RIGHT;
                                else
                                    gSamusData.direction = KEY_LEFT;

                                SpriteUtilTakeKnockback(i);
                            }
                        }
                    }
                    
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_E:
                    if (!SpriteUtilCheckDamagingPose() && !SpriteUtilCheckSudoScrew(i))
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY, spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                                gSamusData.xPosition = spriteLeft - gSamusData.drawDistanceRight;
                        }
                        else
                        {
                            SpriteUtilCheckCollisionAtPosition(samusY, spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                                gSamusData.xPosition = spriteRight - gSamusData.drawDistanceLeft;
                        }

                        if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose())
                        {
                            SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                        }
                    }
                    
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_CORE_X_ABILITY:
                case SSC_YELLOW_X_PARASITE_SPAWN_ON_ROOM_LOAD:
                case SSC_GREEN_X_PARASITE:
                case SSC_RED_X_PARASITE:
                case SSC_YELLOW_X_PARASITE:
                case SSC_BLUE_X_PARASITE:
                    gSpriteData[i].status |= SPRITE_STATUS_SAMUS_COLLIDING;

                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_SAVE_PLATFORM:
                    if (!(collisionFlags & SPRITE_COLLISION_FLAG_ON_TOP))
                        break;

                    gSamusData.yPosition = spriteTop + ONE_SUB_PIXEL;
                    gSpriteData[i].status |= SPRITE_STATUS_SAMUS_ON_TOP;
                    gSpriteData[i].standingOnSprite = 2;
                    break;

                case SSC_SA_X_ICE_BEAM:
                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose())
                    {
                        if (gEquipment.suitMiscStatus & SMF_VARIA_SUIT)
                            SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                        else
                            SpriteUtilTakeDamageFromSA_XIceBeamWithPowerSuit(i);

                        IniitializeSpriteDebris(2, 3, gSpriteData[i].yPosition - PIXEL_SIZE * 2, gSpriteData[i].xPosition - PIXEL_SIZE * 2);
                        IniitializeSpriteDebris(2, 4, gSpriteData[i].yPosition + PIXEL_SIZE * 2, gSpriteData[i].xPosition + PIXEL_SIZE * 2);
                    }

                    gSpriteData[i].pose = 0x37;
                    gSpriteData[i].samusCollision = SSC_NONE;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_SA_X_SUPER_MISSILE:
                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose())
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                            gSamusData.direction = KEY_RIGHT;
                        else
                            gSamusData.direction = KEY_LEFT;

                        SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                    }

                    gSpriteData[i].pose = 0x37;
                    gSpriteData[i].samusCollision = SSC_NONE;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_SA_X_POWER_BOMB:
                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose())
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                            gSamusData.direction = KEY_RIGHT;
                        else
                            gSamusData.direction = KEY_LEFT;

                        SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                    }

                    gSpriteData[i].samusCollision = SSC_NONE;
                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_14:
                    SAMUS_SET_POSE(SPOSE_GRABBED_BY_ZAZABI);
                    
                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gSpriteData[i].samusCollision = SSC_HURTS_SAMUS;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_RIDLEY_CLAW_CAN_GRAB:
                    if (gSpriteData[i].status & SPRITE_STATUS_X_FLIP)
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_BOTTOM && collisionFlags & SPRITE_COLLISION_FLAG_ON_RIGHT)
                        {
                            if (RidleyCheckGrabSamusRight(spriteY, spriteX))
                            {
                                gSpriteData[i].status |= SPRITE_STATUS_SAMUS_COLLIDING;
                                gSpriteData[i].samusCollision = SSC_RIDLEY_CLAW_GRABBED;
                                
                                gIgnoreSamusAndSpriteCollision = TRUE;
                                break;
                            }
                        }
                    }
                    else
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_BOTTOM && collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                        {
                            if (RidleyCheckGrabSamusLeft(spriteY, spriteX))
                            {
                                gSpriteData[i].status |= SPRITE_STATUS_SAMUS_COLLIDING;
                                gSpriteData[i].samusCollision = SSC_RIDLEY_CLAW_GRABBED;
                                
                                gIgnoreSamusAndSpriteCollision = TRUE;
                                break;
                            }
                        }
                    }

                    if (gSamusData.invincibilityTimer == 0 && !SpriteUtilCheckDamagingPose() && !SpriteUtilCheckSudoScrew(i))
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                            gSamusData.direction = KEY_RIGHT;
                        else
                            gSamusData.direction = KEY_LEFT;

                        SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                    }

                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_RIDLEY_CLAW_GRABBED:
                    gSpriteData[i].status |= SPRITE_STATUS_SAMUS_COLLIDING;

                    if (gSamusData.invincibilityTimer == 0)
                    {
                        SpriteUtilTakeDamageFromSprite(FALSE, i, 1);

                        if (gEquipment.currentEnergy != 0)
                        {
                            gSamusData.invincibilityTimer = 30;

                            if (MOD_AND(gEquipment.currentEnergy, 16) == 0)
                                unk_2894(0x88);
                            else if (MOD_AND(gEquipment.currentEnergy, 16) == 7)
                                unk_2894(0x88);

                            unk_2894(0x89);
                        }
                    }

                    if (SpriteUtilCheckMorphed() || gSamusData.pose == SPOSE_SPACE_JUMPING)
                        SAMUS_SET_POSE(SPOSE_MID_AIR);

                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                case SSC_1C:
                    if (collisionFlags & SPRITE_COLLISION_FLAG_ON_BOTTOM)
                    {
                        SAMUS_SET_POSE(SPOSE_GRABBED_BY_YAKUZA);
                        gSpriteData[i].pose = 0x27;
                        gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    }

                    gIgnoreSamusAndSpriteCollision = TRUE;
                    break;

                default:
                    gSpriteData[i].ignoreSamusCollisionTimer = 15;
                    gIgnoreSamusAndSpriteCollision = TRUE;
            }
        }

        if (gIgnoreSamusAndSpriteCollision)
            break;
    }
 
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (gSpriteData[i].ignoreSamusCollisionTimer != 0)
            gSpriteData[i].ignoreSamusCollisionTimer--;
    }
}

/**
 * @brief 11058 | 11c | Checks the vertical collision at the position
 * 
 * @param yPosition Y Position
 * @param xPosition X Position
 * @return u16 Block top position
 */
u32 SpriteUtilCheckVerticalCollisionAtPosition(u16 yPosition, u16 xPosition)
{
    u16 blockTop;
    u32 clipdata;

    clipdata = ClipdataProcess(yPosition, xPosition);

    if (clipdata & CLIPDATA_TYPE_SOLID_FLAG)
        gPreviousVerticalCollisionCheck = COLLISION_SOLID;
    else
        gPreviousVerticalCollisionCheck = COLLISION_AIR;

    switch (LOW_BYTE(clipdata))
    {
        case CLIPDATA_TYPE_RIGHT_STEEP_FLOOR_SLOPE:
            blockTop = (s16)((yPosition & BLOCK_POSITION_FLAG) - ((xPosition & SUB_PIXEL_POSITION_FLAG) - SUB_PIXEL_POSITION_FLAG));
            gPreviousVerticalCollisionCheck = COLLISION_RIGHT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_LOWER_SLIGHT_FLOOR_SLOPE:
            blockTop = (s16)((yPosition & BLOCK_POSITION_FLAG) - (((xPosition & SUB_PIXEL_POSITION_FLAG) / 2) - SUB_PIXEL_POSITION_FLAG));
            gPreviousVerticalCollisionCheck = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_UPPER_SLIGHT_FLOOR_SLOPE:
            blockTop = (s16)(((yPosition & BLOCK_POSITION_FLAG) - (((xPosition & SUB_PIXEL_POSITION_FLAG) / 2) - (SUB_PIXEL_POSITION_FLAG / 2))));
            gPreviousVerticalCollisionCheck = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_STEEP_FLOOR_SLOPE:
            blockTop = (yPosition & BLOCK_POSITION_FLAG) | (xPosition & SUB_PIXEL_POSITION_FLAG);
            gPreviousVerticalCollisionCheck = COLLISION_LEFT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_LOWER_SLIGHT_FLOOR_SLOPE:
            blockTop = (yPosition & BLOCK_POSITION_FLAG) | (((xPosition & SUB_PIXEL_POSITION_FLAG) / 2) + (SUB_PIXEL_POSITION_FLAG / 2)); 
            gPreviousVerticalCollisionCheck = COLLISION_LEFT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_UPPER_SLIGHT_FLOOR_SLOPE:
            blockTop = (yPosition & BLOCK_POSITION_FLAG) | (xPosition & SUB_PIXEL_POSITION_FLAG) / 2; 
            gPreviousVerticalCollisionCheck = COLLISION_LEFT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_PASS_THROUGH_BOTTOM:
            gPreviousVerticalCollisionCheck = COLLISION_PASS_THROUGH_BOTTOM;

        default:
            blockTop = yPosition & BLOCK_POSITION_FLAG;
    }

    return blockTop;
}

/**
 * @brief 11174 | 128 | Checks the vertical collision at the position, accounts for slopes
 * 
 * @param yPosition Y Position
 * @param xPosition X Position
 * @return u16 Block top position
 */
u16 SpriteUtilCheckVerticalCollisionAtPositionSlopes(u16 yPosition, u16 xPosition)
{
    u32 clipdata;
    u8 collision;
    u16 blockTop;

    clipdata = ClipdataProcess(yPosition, xPosition);

    if (clipdata & CLIPDATA_TYPE_SOLID_FLAG)
        collision = COLLISION_SOLID;
    else
        collision = COLLISION_AIR;

    clipdata = LOW_BYTE(clipdata);
    
    switch (clipdata)
    {
        case CLIPDATA_TYPE_RIGHT_STEEP_FLOOR_SLOPE:
            blockTop = (s16)((yPosition & BLOCK_POSITION_FLAG) - ((xPosition & SUB_PIXEL_POSITION_FLAG) - SUB_PIXEL_POSITION_FLAG));
            collision = COLLISION_RIGHT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_LOWER_SLIGHT_FLOOR_SLOPE:
            blockTop = (s16)((yPosition & BLOCK_POSITION_FLAG) - (((xPosition & SUB_PIXEL_POSITION_FLAG) / 2) - SUB_PIXEL_POSITION_FLAG));
            collision = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_UPPER_SLIGHT_FLOOR_SLOPE:
            blockTop = (s16)((yPosition & BLOCK_POSITION_FLAG) - (((xPosition & SUB_PIXEL_POSITION_FLAG) / 2) - SUB_PIXEL_POSITION_FLAG / 2));
            collision = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_STEEP_FLOOR_SLOPE:
            blockTop = (yPosition & BLOCK_POSITION_FLAG) | (xPosition & SUB_PIXEL_POSITION_FLAG);
            collision = COLLISION_LEFT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_LOWER_SLIGHT_FLOOR_SLOPE:
            blockTop = (yPosition & BLOCK_POSITION_FLAG) | (((xPosition & SUB_PIXEL_POSITION_FLAG) / 2) + SUB_PIXEL_POSITION_FLAG / 2); 
            collision = COLLISION_LEFT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_UPPER_SLIGHT_FLOOR_SLOPE:
            blockTop = (yPosition & BLOCK_POSITION_FLAG) | (xPosition & SUB_PIXEL_POSITION_FLAG) / 2; 
            collision = COLLISION_LEFT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_PASS_THROUGH_BOTTOM:
            collision = COLLISION_PASS_THROUGH_BOTTOM;
            
        default:
            blockTop = yPosition & BLOCK_POSITION_FLAG;
    }

    if (clipdata == CLIPDATA_TYPE_PASS_THROUGH_BOTTOM)
    {
        if ((u32)(yPosition - blockTop) < 0x1A)
            gPreviousVerticalCollisionCheck = collision;
        else
            gPreviousVerticalCollisionCheck = COLLISION_AIR;
    }
    else
    {
        if (yPosition >= blockTop)
            gPreviousVerticalCollisionCheck = collision;
        else
            gPreviousVerticalCollisionCheck = COLLISION_AIR;
    }

    return blockTop;
}

/**
 * @brief 1129c | 74 | To document
 * 
 */
void unk_1129c(void)
{
    u16 yPosition;
    u16 xPosition;
    u32 blockTop;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    blockTop = SpriteUtilCheckVerticalCollisionAtPosition(yPosition - PIXEL_SIZE, xPosition);

    if ((gPreviousVerticalCollisionCheck & 0xF) > 1)
    {
        gCurrentSprite.yPosition = blockTop;
        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPosition(yPosition, xPosition);

    if ((gPreviousVerticalCollisionCheck & 0xF) > 1)
    {
        gCurrentSprite.yPosition = blockTop;
        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPosition(yPosition + PIXEL_SIZE, xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
    }
}

/**
 * @brief 11310 | 80 | To document
 * 
 */
void unk_11310(void)
{
    u16 yPosition;
    u16 xPosition;
    u32 blockTop;

    yPosition = gCurrentSprite.yPosition + gCurrentSprite.hitboxBottom;
    xPosition = gCurrentSprite.xPosition;

    blockTop = SpriteUtilCheckVerticalCollisionAtPosition(yPosition - PIXEL_SIZE, xPosition);

    if ((gPreviousVerticalCollisionCheck & 0xF) > 1)
    {
        gCurrentSprite.yPosition = blockTop - gCurrentSprite.hitboxBottom;
        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPosition(yPosition, xPosition);

    if ((gPreviousVerticalCollisionCheck & 0xF) > 1)
    {
        gCurrentSprite.yPosition = blockTop - gCurrentSprite.hitboxBottom;
        return;
    }

    blockTop = SpriteUtilCheckVerticalCollisionAtPosition(yPosition + PIXEL_SIZE, xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop - gCurrentSprite.hitboxBottom;
    }
}

/**
 * @brief 11390 | 98 | Checks the collision at the position
 * 
 * @param yPosition Y Position
 * @param xPosition X Position
 */
void SpriteUtilCheckCollisionAtPosition(u16 yPosition, u16 xPosition)
{
    u32 clipdata;

    clipdata = ClipdataProcess(yPosition, xPosition);

    if (clipdata & CLIPDATA_TYPE_SOLID_FLAG)
        gPreviousCollisionCheck = COLLISION_SOLID;
    else
        gPreviousCollisionCheck = COLLISION_AIR;

    switch (LOW_BYTE(clipdata))
    {
        case CLIPDATA_TYPE_RIGHT_STEEP_FLOOR_SLOPE:
            gPreviousCollisionCheck = COLLISION_RIGHT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_LOWER_SLIGHT_FLOOR_SLOPE:
            gPreviousCollisionCheck = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_UPPER_SLIGHT_FLOOR_SLOPE:
            gPreviousCollisionCheck = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_STEEP_FLOOR_SLOPE:
            gPreviousCollisionCheck = COLLISION_LEFT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_LOWER_SLIGHT_FLOOR_SLOPE:
            gPreviousCollisionCheck = COLLISION_LEFT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_LEFT_UPPER_SLIGHT_FLOOR_SLOPE:
            gPreviousCollisionCheck = COLLISION_LEFT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_PASS_THROUGH_BOTTOM:
            gPreviousCollisionCheck = COLLISION_PASS_THROUGH_BOTTOM;
    }
}

/**
 * @brief 11428 | 70 | Handles the current sprite falling
 * 
 */
void SpriteUtilCurrentSpriteFalling(void)
{
    u32 blockTop;
    s16 movement;
    u8 offset;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
    {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.pose = 0x7;
        return;
    }

    offset = gCurrentSprite.work4;
    movement = sSpritesFallingSpeed[offset];

    if (movement == SHORT_MAX)
    {
        movement = sSpritesFallingSpeed[offset - 1];
        gCurrentSprite.yPosition += movement;
    }
    else
    {
        offset++;
        gCurrentSprite.work4 = offset;
        gCurrentSprite.yPosition += movement;
    }
}

/**
 * @brief 11498 | 38 | Chooses a random X flip for the current sprite
 * 
 */
void SpriteUtilChooseRandomXFlip(void)
{
    if (MOD_AND(gFrameCounter8Bit, 2))
        gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
    else
        gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
}

/**
 * @brief 114d0 | 3c | Chooses a random X direction for the current sprite
 * 
 */
void SpriteUtilChooseRandomXDirection(void)
{
    if (MOD_AND(gFrameCounter8Bit, 2))
        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
    else
        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
}

/**
 * @brief 1150c | 30 | Chooses a random X direction for the current sprite based on the room slot
 * 
 */
void SpriteUtilChooseRandomXDirectionRoomSlot(void)
{
    if (MOD_AND(gCurrentSprite.roomSlot, 2))
        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
    else
        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
}

/**
 * @brief 1153c | 30 | Makes the current sprite face samus (x flip)
 * 
 */
void SpriteUtilMakeSpriteFaceSamusXFlip(void)
{
    if (gCurrentSprite.xPosition > gSamusData.xPosition)
        gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
    else
        gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
}

/**
 * @brief 1156c | 34 | Makes the current sprite face samus (direction)
 * 
 */
void SpriteUtilMakeSpriteFaceSamusDirection(void)
{
    if (gCurrentSprite.xPosition > gSamusData.xPosition)
        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
    else
        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
}

/**
 * @brief 115a0 | 30 | Makes the current sprite face from samus (x flip)
 * 
 */
void SpriteUtilMakeSpriteFaceAwayFromSamusXFlip(void)
{
    if (gCurrentSprite.xPosition > gSamusData.xPosition)
        gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
    else
        gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
}

/**
 * @brief 115d0 | 34 | Makes the current sprite face from samus (direction)
 * 
 */
void SpriteUtilMakeSpriteFaceAwayFromSamusDirection(void)
{
    if (gCurrentSprite.xPosition > gSamusData.xPosition)
        gCurrentSprite.status |= SPRITE_STATUS_FACING_RIGHT;
    else
        gCurrentSprite.status &= ~SPRITE_STATUS_FACING_RIGHT;
}

/**
 * @brief 11604 | 98 | To document
 * 
 * @param movement Movement
 */
void unk_11604(s16 movement)
{
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gPreviousCollisionCheck == COLLISION_RIGHT_STEEP_FLOOR_SLOPE)
        {
            movement = FRACT_MUL(movement, 2, 3);
        }
        else if (gPreviousCollisionCheck == COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE)
        {
            movement = FRACT_MUL(movement, 3, 4);
        }
    }
    else
    {
        if (gPreviousCollisionCheck == COLLISION_LEFT_STEEP_FLOOR_SLOPE)
        {
            movement = FRACT_MUL(movement, 2, 3);
        }
        else if (gPreviousCollisionCheck == COLLISION_LEFT_SLIGHT_FLOOR_SLOPE)
        {
            movement = FRACT_MUL(movement, 3, 4);
        }
    }

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
        gCurrentSprite.xPosition += movement;
    else
        gCurrentSprite.xPosition -= movement;
}

/**
 * @brief 1169c | 98 | To document
 * 
 * @param movement Movement
 */
void unk_1169c(s16 movement)
{
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
    {
        if (gPreviousCollisionCheck == COLLISION_RIGHT_STEEP_FLOOR_SLOPE)
        {
            movement = FRACT_MUL(movement, 2, 3);
        }
        else if (gPreviousCollisionCheck == COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE)
        {
            movement = FRACT_MUL(movement, 3, 4);
        }
    }
    else
    {
        if (gPreviousCollisionCheck == COLLISION_LEFT_STEEP_FLOOR_SLOPE)
        {
            movement = FRACT_MUL(movement, 2, 3);
        }
        else if (gPreviousCollisionCheck == COLLISION_LEFT_SLIGHT_FLOOR_SLOPE)
        {
            movement = FRACT_MUL(movement, 3, 4);
        }
    }

    if (movement == 0)
        movement = 1;

    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        gCurrentSprite.xPosition += movement;
    else
        gCurrentSprite.xPosition -= movement;
}

u8 SpriteUtilMakeSpriteRotateTowardsTarget(s16 oamRotation, s16 targetY, s16 targetX, s16 spriteY, s16 spriteX)
{
    // https://decomp.me/scratch/bwCje

    u8 intensity;
    s32 targetRotation;

    intensity = Q_8_8(0.01f);

    if (targetY < spriteY)
    {
        if (spriteX - BLOCK_SIZE < targetX && spriteX + BLOCK_SIZE > targetX)
        {
            targetRotation = PI + PI / 2;
        }
        else if (targetX > spriteX)
        {
            if (spriteY - targetY < BLOCK_SIZE)
                targetRotation = 0;
            else
                targetRotation = PI + 3 * PI / 4;
        }
        else if (spriteY - targetY < BLOCK_SIZE)
        {
            targetRotation = PI;
        }
        else
        {
            targetRotation = PI + HALF_BLOCK_SIZE;
        }
    }
    else
    {
        if (spriteX - BLOCK_SIZE < targetX && spriteX + BLOCK_SIZE > targetX)
        {
            targetRotation = PI / 2;
        }
        else if (targetX > spriteX)
        {
            if (targetY - spriteY < BLOCK_SIZE)
                targetRotation = 0;
            else
                targetRotation = PI / 4;
        }
        else if (targetY - spriteY < BLOCK_SIZE)
        {
            targetRotation = PI;
        }
        else
        {
            targetRotation = 3 * PI / 4;
        }
    }

    if (targetRotation == 0)
    {
        if ((u16)(oamRotation - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
        else if (oamRotation > BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
    }
    else if (targetRotation == PI / 4)
    {
        if ((u16)(oamRotation - HALF_BLOCK_SIZE - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
        else if ((u16)(oamRotation - HALF_BLOCK_SIZE) > BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
    }
    else if (targetRotation == PI / 2)
    {
        if ((u16)(oamRotation - BLOCK_SIZE - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
        else if ((u16)(oamRotation - BLOCK_SIZE) > BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
    }
    else if (targetRotation == 3 * PI / 4)
    {
        if ((u16)(oamRotation - (BLOCK_SIZE + HALF_BLOCK_SIZE) - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
        else if ((u16)(oamRotation - (BLOCK_SIZE + HALF_BLOCK_SIZE)) > BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
    }
    else if (targetRotation == PI)
    {
        if ((u16)(oamRotation - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
        else if (oamRotation > BLOCK_SIZE * 2)
            oamRotation -= intensity;
    }
    else if (targetRotation == PI + PI / 4)
    {
        if ((u16)(oamRotation - HALF_BLOCK_SIZE - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
        else if ((u16)(oamRotation - HALF_BLOCK_SIZE - 1) > BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
    }
    else if (targetRotation == PI + PI / 2)
    {
        if ((u16)(oamRotation - BLOCK_SIZE - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
        else if ((u16)(oamRotation - BLOCK_SIZE - 1) > BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
    }
    else if (targetRotation == PI + 3 * PI / 4)
    {
        if ((u16)(oamRotation - (BLOCK_SIZE + HALF_BLOCK_SIZE) - 1) < BLOCK_SIZE * 2 - 1)
            oamRotation += intensity;
        else if ((u16)(oamRotation - (BLOCK_SIZE + HALF_BLOCK_SIZE) - 1) > BLOCK_SIZE * 2 - 1)
            oamRotation -= intensity;
    }

    return oamRotation;
}

/**
 * @brief 11934 | 38 | Checks if the animation of the current sprite has ended
 * 
 * @return u32 bool, ended
 */
u32 SpriteUtilCheckEndOfCurrentSpriteAnimation(void)
{
    u8 adc;
    u16 caf;

    adc = gCurrentSprite.animationDurationCounter;
    caf = gCurrentSprite.currentAnimationFrame;

    // Get animation duration counter for the next frame
    adc++;

    // Check if on the next frame, the current animation frame ends
    if (gCurrentSprite.pOam[caf].timer < adc)
    {
        // Get next animation frame
        caf++;

        // Checks if has a timer of 0, meaning the end of the animation
        if (gCurrentSprite.pOam[caf].timer == 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 1196c | 3c | Checks if the animation of the current sprite has nearly ended
 * 
 * @return u32 bool, nearly ended
 */
u32 SpriteUtilCheckNearEndOfCurrentSpriteAnimation(void)
{
    u8 adc;
    u16 caf;

    adc = gCurrentSprite.animationDurationCounter;
    caf = gCurrentSprite.currentAnimationFrame;

    // Get animation duration counter for the next next frame
    adc++;
    adc++;

    // Check if on the next frame, the current animation frame ends
    if (gCurrentSprite.pOam[caf].timer < adc)
    {
        // Get next animation frame
        caf++;

        // Checks if has a timer of 0, meaning the end of the animation
        if (gCurrentSprite.pOam[caf].timer == 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 119a8 | 48 | Checks if the animation of a sprite has ended
 * 
 * @param spriteSlot Sprite slot
 * @return u32 bool, ended
 */
u32 SpriteUtilCheckEndOfSpriteAnimation(u8 spriteSlot)
{
    u8 adc;
    u16 caf;

    adc = gSpriteData[spriteSlot].animationDurationCounter;
    caf = gSpriteData[spriteSlot].currentAnimationFrame;

    // Get animation duration counter for the next frame
    adc++;

    // Check if on the next frame, the current animation frame ends
    if (gSpriteData[spriteSlot].pOam[caf].timer < adc)
    {
        // Get next animation frame
        caf++;

        // Checks if has a timer of 0, meaning the end of the animation
        if (gSpriteData[spriteSlot].pOam[caf].timer == 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 119f0 | 4c | Checks if the animation of a sprite has nearly ended
 * 
 * @param spriteSlot Sprite slot
 * @return u32 bool, ended
 */
u32 SpriteUtilCheckNearEndOfSpriteAnimation(u8 spriteSlot)
{
    u8 adc;
    u16 caf;

    adc = gSpriteData[spriteSlot].animationDurationCounter;
    caf = gSpriteData[spriteSlot].currentAnimationFrame;

    // Get animation duration counter for the next next frame
    adc++;
    adc++;

    // Check if on the next frame, the current animation frame ends
    if (gSpriteData[spriteSlot].pOam[caf].timer < adc)
    {
        // Get next animation frame
        caf++;

        // Checks if has a timer of 0, meaning the end of the animation
        if (gSpriteData[spriteSlot].pOam[caf].timer == 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 11a3c | 38 | Checks if the animation of the sub sprite data 1 has ended
 * 
 * @return u32 bool, ended
 */
u32 SpriteUtilCheckEndOfSubSpriteData1Animation(void)
{
    u8 adc;
    u16 caf;

    adc = gSubSpriteData1.animationDurationCounter;
    caf = gSubSpriteData1.currentAnimationFrame;

    // Get animation duration counter for the next frame
    adc++;

    // Check if on the next frame, the current animation frame ends
    if (gSubSpriteData1.pMultiOam[caf].timer < adc)
    {
        // Get next animation frame
        caf++;

        // Checks if has a timer of 0, meaning the end of the animation
        if (gSubSpriteData1.pMultiOam[caf].timer == 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 11a74 | 3c | Checks if the animation of the sub sprite data 1 has nearly ended
 * 
 * @return u32 bool, ended
 */
u32 SpriteUtilCheckNearEndOfSubSpriteData1Animation(void)
{
    u8 adc;
    u16 caf;

    adc = gSubSpriteData1.animationDurationCounter;
    caf = gSubSpriteData1.currentAnimationFrame;

    // Get animation duration counter for the next next frame
    adc++;
    adc++;

    // Check if on the next frame, the current animation frame ends
    if (gSubSpriteData1.pMultiOam[caf].timer < adc)
    {
        // Get next animation frame
        caf++;

        // Checks if has a timer of 0, meaning the end of the animation
        if (gSubSpriteData1.pMultiOam[caf].timer == 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 11ab0 | 38 | Checks if the animation of the sub sprite data 2 has ended
 * 
 * @return u32 bool, ended
 */
u32 SpriteUtilCheckEndOfSubSpriteData2Animation(void)
{
    u8 adc;
    u16 caf;

    adc = gSubSpriteData2.animationDurationCounter;
    caf = gSubSpriteData2.currentAnimationFrame;

    // Get animation duration counter for the next frame
    adc++;

    // Check if on the next frame, the current animation frame ends
    if (gSubSpriteData2.pMultiOam[caf].timer < adc)
    {
        // Get next animation frame
        caf++;

        // Checks if has a timer of 0, meaning the end of the animation
        if (gSubSpriteData2.pMultiOam[caf].timer == 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 11ae8 | 3c | Checks if the animation of the sub sprite data 1 has nearly ended
 * 
 * @return u32 bool, ended
 */
u32 SpriteUtilCheckNearEndOfSubSpriteData2Animation(void)
{
    u8 adc;
    u16 caf;

    adc = gSubSpriteData2.animationDurationCounter;
    caf = gSubSpriteData2.currentAnimationFrame;

    // Get animation duration counter for the next next frame
    adc++;
    adc++;

    // Check if on the next frame, the current animation frame ends
    if (gSubSpriteData2.pMultiOam[caf].timer < adc)
    {
        // Get next animation frame
        caf++;

        // Checks if has a timer of 0, meaning the end of the animation
        if (gSubSpriteData2.pMultiOam[caf].timer == 0)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 11b24 | 60 | Checks if samus is in range of the current sprite (left or right)
 * 
 * @param yRange Y range
 * @param xRange X range
 * @return u8 NSLR result
 */
u8 SpriteUtilCheckSamusNearSpriteLeftRight(u16 yRange, u16 xRange)
{
    u8 result;
    u16 samusY;
    u16 samusX;
    u16 spriteY;
    u16 spriteX;

    result = NSLR_OUT_OF_RANGE;

    // Get samus center position
    samusY = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    samusX = gSamusData.xPosition;

    // Get sprite position
    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;

    // Check Y position
    if (spriteY > samusY)
    {
        // Sprite is below
        if (spriteY - samusY >= yRange)
            return NSLR_OUT_OF_RANGE;
    }
    else
    {
        // Sprite is above
        if (samusY - spriteY >= yRange)
            return NSLR_OUT_OF_RANGE;
    }
   
    // Check X position
    if (spriteX > samusX)
    {
        // Sprite is on left
        if (spriteX - samusX < xRange)
            result = NSLR_LEFT;
    }
    else
    {
        // Sprite is on right
        if (samusX - spriteX < xRange)
            result = NSLR_RIGHT;
    }

    return result;
}

/**
 * @brief 11b84 | 60 | Checks if samus is in range of the current sprite (above or below)
 * 
 * @param yRange Y range
 * @param xRange X range
 * @return u8 NSLR result
 */
u8 SpriteUtilCheckSamusNearSpriteAboveBelow(u16 yRange, u16 xRange)
{
    u8 result;
    u16 samusY;
    u16 samusX;
    u16 spriteY;
    u16 spriteX;

    result = NSAB_OUT_OF_RANGE;

    // Get samus middle position visually
    samusY = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    samusX = gSamusData.xPosition;

    // Get sprite position
    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;
    
    // Check X position
    if (spriteX > samusX)
    {
        // Sprite is on left
        if (spriteX - samusX >= xRange)
            return NSAB_OUT_OF_RANGE;
    }
    else
    {
        // Sprite is on right
        if (samusX - spriteX >= xRange)
            return NSAB_OUT_OF_RANGE;
    }
   
    // Check Y position
    if (spriteY > samusY)
    {
        // Sprite is below
        if (spriteY - samusY < yRange)
            result = NSAB_ABOVE;
    }
    else
    {
        // Sprite is above
        if (samusY - spriteY < yRange)
            result = NSAB_BELOW;
    }

    return result;
}

/**
 * @brief 11be4 | a8 | Checks if samus is in front or behind the current sprite 
 * 
 * @param yRange Y range
 * @param xRangeFront X range (in front)
 * @param xRangeBehind X range (behind)
 * @return u8 NSFB result
 */
u8 SpriteUtilCheckSamusNearSpriteFrontBehindX(u16 yRange, u16 xRangeFront, u16 xRangeBehind)
{
    u8 result;
    u16 samusY;
    u16 samusX;
    u16 spriteY;
    u16 spriteX;
    u8 xFlip;

    result = NSFB_OUT_OF_RANGE;
    xFlip = FALSE;

    // Get samus middle position visually
    samusY = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    samusX = gSamusData.xPosition;

    // Get sprite position
    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;
    
    // Check Y position
    if (spriteY > samusY)
    {
        // Sprite is below
        if (spriteY - samusY >= yRange)
            return NSFB_OUT_OF_RANGE;
    }
    else
    {
        // Sprite is above
        if (samusY - spriteY >= yRange)
            return NSFB_OUT_OF_RANGE;
    }

    // Get is flipped, this assume that when flipped the sprite faces right
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
        xFlip = TRUE;
    
    // Check X position
    if (spriteX > samusX)
    {
        // Sprite is on right
        if (xFlip)
        {
            // Sprite is facing right
            if (spriteX - samusX < xRangeBehind)
                result = NSFB_BEHIND;
        }
        else
        {
            // Sprite is facing left
            if (spriteX - samusX < xRangeFront)
                result = NSFB_IN_FRONT;
        }
    }
    else
    {
        // Sprite is on left
        if (xFlip)
        {
            // Sprite is facing right
            if (samusX - spriteX < xRangeFront)
                result = NSFB_IN_FRONT;
        }
        else
        {
            // Sprite is facing left
            if (samusX - spriteX < xRangeBehind)
                result = NSFB_BEHIND;
        }
    }

    return result;
}

/**
 * @brief 11c8c | ac | Checks if samus is in front or behind the current sprite
 * 
 * @param xRange X range
 * @param yRangeFront X range (in front)
 * @param yRangeBehind Y range (behind)
 * @return u8 NSFB result
 */
u8 SpriteUtilCheckSamusNearSpriteFrontBehindY(u16 xRange, u16 yRangeFront, u16 yRangeBehind)
{
    u8 result;
    u16 samusY;
    u16 samusX;
    u16 spriteY;
    u16 spriteX;
    u8 yFlip;

    result = NSFB_OUT_OF_RANGE;
    yFlip = FALSE;

    // Get samus middle position visually
    samusY = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    samusX = gSamusData.xPosition;

    // Get sprite position
    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;
    
    // Check Y position
    if (spriteX > samusX)
    {
        // Sprite is below
        if (spriteX - samusX >= xRange)
            return NSFB_OUT_OF_RANGE;
    }
    else
    {
        // Sprite is above
        if (samusX - spriteX >= xRange)
            return NSFB_OUT_OF_RANGE;
    }

    // Get is flipped, this assume that when flipped the sprite faces down
    if (gCurrentSprite.status & SPRITE_STATUS_Y_FLIP)
        yFlip = TRUE;
    
    // Check X position
    if (spriteY > samusY)
    {
        // Sprite is on right
        if (yFlip)
        {
            // Sprite is facing right
            if (spriteY - samusY < yRangeBehind)
                result = NSFB_BEHIND;
        }
        else
        {
            // Sprite is facing left
            if (spriteY - samusY < yRangeFront)
                result = NSFB_IN_FRONT;
        }
    }
    else
    {
        // Sprite is on left
        if (yFlip)
        {
            // Sprite is facing right
            if (samusY - spriteY < yRangeFront)
                result = NSFB_IN_FRONT;
        }
        else
        {
            // Sprite is facing left
            if (samusY - spriteY < yRangeBehind)
                result = NSFB_BEHIND;
        }
    }

    return result;
}

/**
 * @brief 11d38 | 64 | 
 * 
 * @param xRange 
 * @param yRangeBelow 
 * @param yRangeAbove 
 * @return u8 
 */
u8 SpriteUtilCheckSamusNearSpriteAboveBelowSeparateRanges(u16 xRange, u16 yRangeBelow, u16 yRangeAbove)
{
    u8 result;
    u16 samusY;
    u16 samusX;
    u16 spriteY;
    u16 spriteX;

    result = NSAB_OUT_OF_RANGE;

    // Get samus middle position visually
    samusY = gSamusData.yPosition + gSamusData.drawDistanceTop / 2;
    samusX = gSamusData.xPosition;

    // Get sprite position
    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;
    
    // Check X position
    if (spriteX > samusX)
    {
        // Sprite is on left
        if (spriteX - samusX >= xRange)
            return NSAB_OUT_OF_RANGE;
    }
    else
    {
        // Sprite is on right
        if (samusX - spriteX >= xRange)
            return NSAB_OUT_OF_RANGE;
    }
   
    // Check Y position
    if (spriteY > samusY)
    {
        // Sprite is below
        if (spriteY - samusY < yRangeAbove)
            result = NSAB_ABOVE;
    }
    else
    {
        // Sprite is above
        if (samusY - spriteY < yRangeBelow)
            result = NSAB_BELOW;
    }

    return result;
}

/**
 * @brief 11d9c | a8 | Handles samus standing on a sprite
 * 
 */
void SpriteUtilSamusStandingOnSprite(void)
{
    u8 standing;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_ON_TOP)
    {
        if (gSamusData.standingStatus != STANDING_ENEMY)
        {
            if (gSamusData.standingStatus == STANDING_MID_AIR)
                SAMUS_SET_POSE(SPOSE_LANDING_REQUEST);

            gSamusData.standingStatus = STANDING_ENEMY;
        }

        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_ON_TOP;
        return;
    }

    standing = gCurrentSprite.standingOnSprite;
    if (standing != 0x1)
    {            
        if (standing == 0x2)
        {
            gCurrentSprite.standingOnSprite = TRUE;

            if (gSamusDataCopy.yPosition <= gSamusData.yPosition)
            {
                // Set samus position to be on top of the current sprite
                gSamusData.yPosition = gCurrentSprite.yPosition + gCurrentSprite.hitboxTop + ONE_SUB_PIXEL;
            }
        }
    }
    else
    {
        // Remove standing on enemy status
        gCurrentSprite.standingOnSprite = FALSE;

        if (gSamusData.standingStatus == STANDING_ENEMY)
            gSamusData.standingStatus = STANDING_MID_AIR;
    }
}

/**
 * @brief 11e44 | 60 | Updates the freeze timer of the current sprite
 * 
 */
void SpriteUtilUpdateFreezeTimer(void)
{
    u8 freezeTimer;

    if (MOD_AND(gFrameCounter8Bit, 2))
        gCurrentSprite.freezeTimer--;

    freezeTimer = gCurrentSprite.freezeTimer;

    if (freezeTimer == 0)
        gCurrentSprite.animationDurationCounter--;

    if (freezeTimer < 46)
    {
        if (MOD_AND(freezeTimer, 2))
        {
            gCurrentSprite.paletteRow = 15 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
        }
        else
        {
            gCurrentSprite.paletteRow = 0;
        }
    }
}

/**
 * @brief 11ea4 | 9c | Updates the freeze timer of a specified secondary sprites binded to a primary sprite
 * 
 * @param spriteId Secondary sprite id
 * @param ramSlot Primary sprite slot
 */
void SpriteUtilUpdateSecondarySpritesFreezeTimer(u8 spriteId, u8 ramSlot)
{
    u8 i;

    if (gCurrentSprite.freezeTimer == 0)
        return;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (!(gSpriteData[i].properties & SP_SECONDARY_SPRITE))
            continue;

        if (gSpriteData[i].spriteId != spriteId)
            continue;

        if (gSpriteData[i].primarySpriteRamSlot != ramSlot)
            continue;

        if (gSpriteData[i].freezeTimer < gCurrentSprite.freezeTimer && !(gSpriteData[i].properties & SP_DESTROYED))
        {
            gSpriteData[i].freezeTimer = gCurrentSprite.freezeTimer;
            gSpriteData[i].paletteRow = 15 - (gSpriteData[i].spritesetGfxSlot + gSpriteData[i].frozenPaletteRowOffset);
        }
    }
}

/**
 * @brief 11f40 | 60 | Updates the freeze timer of the primary sprite of the current sprite
 * 
 */
void SpriteUtilUpdatePrimarySpriteFreezeTimer(void)
{
    u8 ramSlot;

    if (gCurrentSprite.freezeTimer == 0)
        return;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].freezeTimer < gCurrentSprite.freezeTimer && !(gSpriteData[ramSlot].properties & SP_DESTROYED))
    {
        gSpriteData[ramSlot].freezeTimer = gCurrentSprite.freezeTimer;
        gSpriteData[ramSlot].paletteRow = 15 - (gSpriteData[ramSlot].spritesetGfxSlot + gSpriteData[ramSlot].frozenPaletteRowOffset);
    }
}

/**
 * @brief 11fa0 | 68 | Unfreezes the specified secondary sprites binded to a primary sprite
 * 
 * @param spriteId Secondary sprite id
 * @param ramSlot Primary sprite slot
 */
void SpriteUtilUnfreezeSecondarySprites(u8 spriteId, u8 ramSlot)
{
    u8 i;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (!(gSpriteData[i].properties & SP_SECONDARY_SPRITE))
            continue;

        if (gSpriteData[i].spriteId != spriteId)
            continue;

        if (gSpriteData[i].primarySpriteRamSlot != ramSlot)
            continue;

        if (gSpriteData[i].freezeTimer != 0)
        {
            gSpriteData[i].freezeTimer = 0;
            gSpriteData[i].paletteRow = 0;
        }
    }
}

/**
 * @brief 12008 | a4 | To document
 * 
 * @param yPosition Y Position
 * @param xPosition X Position
 */
void unk_12008(u16 yPosition, u16 xPosition)
{
    u8 properties;
    u8 timer;

    properties = gCurrentSprite.spritesetSlotAndProperties - 0x20;

    if (properties < 0x30)
        return;

    if (gCurrentSprite.health != 0)
        return;

    timer = gCurrentSprite.ignoreSamusCollisionTimer;
    if (timer < 26)
    {
        gCurrentSprite.status = 0;
        return;
    }

    if (MOD_AND(timer, 2) == 0)
        gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;

    switch (timer)
    {
        case 38:
            ParticleSet(yPosition - QUARTER_BLOCK_SIZE, xPosition, 0x26);
            SoundPlay(0x145);
            break;

        case 32:
            ParticleSet(yPosition + PIXEL_SIZE * 2, xPosition - (PIXEL_SIZE * 2 + PIXEL_SIZE / 2), 0x26);
            break;

        case 29:
            ParticleSet(yPosition - PIXEL_SIZE * 2, xPosition + QUARTER_BLOCK_SIZE + PIXEL_SIZE, 0x26);
            break;

        case 26:
            ParticleSet(yPosition, xPosition, 0x25);
    }
}

/**
 * @brief 120ac | a0 | To document
 * 
 * @param yPosition Y Position
 * @param xPosition X Position
 */
void unk_120ac(u16 yPosition, u16 xPosition)
{
    u8 properties;
    u8 timer;

    properties = gCurrentSprite.spritesetSlotAndProperties - 0x20;

    if (properties < 0x30)
        return;

    if (gCurrentSprite.health != 0)
        return;

    timer = gCurrentSprite.ignoreSamusCollisionTimer;
    if (timer < 26)
    {
        gCurrentSprite.status = 0;
        return;
    }

    if (MOD_AND(timer, 2) == 0)
        gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;

    switch (timer)
    {
        case 38:
            ParticleSet(yPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), xPosition -(HALF_BLOCK_SIZE - PIXEL_SIZE / 2), 0x25);
            SoundPlay(0x145);
            break;

        case 32:
            ParticleSet(yPosition + QUARTER_BLOCK_SIZE + PIXEL_SIZE, xPosition + (HALF_BLOCK_SIZE - PIXEL_SIZE / 2), 0x25);
            break;

        case 29:
            ParticleSet(yPosition, xPosition - QUARTER_BLOCK_SIZE, 0x25);
            break;

        case 26:
            ParticleSet(yPosition, xPosition, 0x24);
    }
}

/**
 * @brief 1214c | 14 | To document
 * 
 * @param yPosition Y Position
 * @param xPosition X Position
 */
void unk_1214c(u16 yPosition, u16 xPosition)
{
    ParticleSet(yPosition, xPosition, 0x25);
}

/**
 * @brief 12160 | 80 | To document
 * 
 * @param yPosition Y Position
 * @param xPosition X Position
 */
void unk_12160(u16 yPosition, u16 xPosition)
{
    u8 timer;

    timer = gCurrentSprite.ignoreSamusCollisionTimer;

    if (timer > 8)
        return;

    if (timer == 0)
    {
        gCurrentSprite.status = 0;
        return;
    }

    if (MOD_AND(timer, 2) == 0)
        gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;

    switch (timer)
    {
        case 6:
            ParticleSet(yPosition - QUARTER_BLOCK_SIZE, xPosition, 0x26);
            SoundPlay(0x144);
            break;

        case 4:
            ParticleSet(yPosition + QUARTER_BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE, 0x26);
            break;

        case 2:
            ParticleSet(yPosition + QUARTER_BLOCK_SIZE, xPosition + QUARTER_BLOCK_SIZE, 0x25);
            break;
    }
}

/**
 * @brief 121e0 | f0 | To document
 * 
 * @param yPosition Y Position
 * @param xPosition X Position
 */
void unk_121e0(u16 yPosition, u16 xPosition)
{
    u8 timer;

    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].status & SPRITE_STATUS_ENABLE_MOSAIC && gCurrentSprite.ignoreSamusCollisionTimer > 14)
        gCurrentSprite.ignoreSamusCollisionTimer = 14;

    timer = gCurrentSprite.ignoreSamusCollisionTimer;
    if (timer > 14)
        return;

    if (timer == 0)
    {
        gCurrentSprite.status = 0;
        return;
    }

    if (MOD_AND(timer, 2) == 0)
        gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;

    switch (timer)
    {
        case 12:
            ParticleSet(yPosition - QUARTER_BLOCK_SIZE, xPosition, 0x26);
            break;

        case 10:
            ParticleSet(yPosition + QUARTER_BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE, 0x26);
            break;

        case 8:
            ParticleSet(yPosition + QUARTER_BLOCK_SIZE, xPosition + QUARTER_BLOCK_SIZE, 0x25);
            break;

        case 6:
            ParticleSet(yPosition + (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                xPosition - (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2), 0x25);
            break;

        case 4:
            ParticleSet(yPosition - (HALF_BLOCK_SIZE - PIXEL_SIZE),
                xPosition - (QUARTER_BLOCK_SIZE + PIXEL_SIZE), 0x25);
            break;

        case 2:
            ParticleSet(yPosition, xPosition, 0x23);
            break;
    }
}

/**
 * @brief 122d0 | 34 | To document
 * 
 * @param pOam Frame data pointer
 */
void unk_122d0(const struct FrameData* pOam)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.work0;

    if (ramSlot != UCHAR_MAX)
    {
        gSpriteData[ramSlot].pOam = pOam;
        gSpriteData[ramSlot].animationDurationCounter = 0;
        gSpriteData[ramSlot].currentAnimationFrame = 0;
    }
}

/**
 * @brief 12304 | 28 | Sets the oam pointer for a secondary sprite (with the ram slot being in work2)
 * 
 * @param pOam Frame data pointer
 */
void SpriteUtilSetSecondarySpriteOamPointer(const struct FrameData* pOam)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.work2;

    gSpriteData[ramSlot].pOam = pOam;
    gSpriteData[ramSlot].animationDurationCounter = 0;
    gSpriteData[ramSlot].currentAnimationFrame = 0;
}

/**
 * @brief 1232c | 14 | Fully refills samus, unused
 * 
 */
void SpriteUtilSetEnergyAndAmmoToMax_Unused(void)
{
    gEquipment.currentEnergy = gEquipment.maxEnergy;
    gEquipment.currentMissiles = gEquipment.maxMissiles;
    gEquipment.currentPowerBombs = gEquipment.maxPowerBombs;
}

/**
 * @brief 12340 | 2c | Refills the energy
 * 
 * @return u8 bool, still refilling
 */
u8 SpriteUtilRefillEnergy(void)
{
    if (gEquipment.currentEnergy < gEquipment.maxEnergy)
    {
        gEquipment.currentEnergy += 10;

        if (gEquipment.currentEnergy > gEquipment.maxEnergy)
            gEquipment.currentEnergy = gEquipment.maxEnergy;

        return TRUE;
    }

    return FALSE;
}

/**
 * @brief 1236c | 2c | Refills the missiles
 * 
 * @return u8 bool, still refilling
 */
u8 SpriteUtilRefillMissiles(void)
{
    if (gEquipment.currentMissiles < gEquipment.maxMissiles)
    {
        gEquipment.currentMissiles += 10;

        if (gEquipment.currentMissiles > gEquipment.maxMissiles)
            gEquipment.currentMissiles = gEquipment.maxMissiles;

        return TRUE;
    }

    return FALSE;
}

/**
 * @brief 12398 | 2c | Refills the power bombs
 * 
 * @return u8 bool, still refilling
 */
u8 SpriteUtilRefillPowerBombs(void)
{
    if (gEquipment.currentPowerBombs < gEquipment.maxPowerBombs)
    {
        gEquipment.currentPowerBombs += 10;

        if (gEquipment.currentPowerBombs > gEquipment.maxPowerBombs)
            gEquipment.currentPowerBombs = gEquipment.maxPowerBombs;

        return TRUE;
    }

    return FALSE;
}

/**
 * @brief 123c4 | 68 | Refills samus with the provided amount
 * 
 * @param energy Energy
 * @param missiles Missiles
 * @param powerBombs Power bombs
 */
void SpriteUtilRefillSamus(u16 energy, u16 missiles, u16 powerBombs)
{
    gEquipment.currentEnergy += energy;

    if (gEquipment.currentEnergy > gEquipment.maxEnergy)
        gEquipment.currentEnergy = gEquipment.maxEnergy;

    if (gEquipment.weaponsStatus & MBF_ANY_MISSILE)
    {
        gEquipment.currentMissiles += missiles;

        if (gEquipment.currentMissiles > gEquipment.maxMissiles)
            gEquipment.currentMissiles = gEquipment.maxMissiles;
    }

    if (gEquipment.weaponsStatus & MBF_POWER_BOMBS)
    {
        gEquipment.currentPowerBombs += powerBombs;

        if (gEquipment.currentPowerBombs > gEquipment.maxPowerBombs)
            gEquipment.currentPowerBombs = gEquipment.maxPowerBombs;
    }
}

/**
 * @brief 1242c | 74 | Refills samus of one tank of energy and weapons
 * 
 */
void SpriteUtilHealSamusOfOneTank(void)
{
    if (gEquipment.currentEnergy != gEquipment.maxEnergy)
    {
        gEquipment.currentEnergy += 100;

        if (gEquipment.currentEnergy > gEquipment.maxEnergy)
            gEquipment.currentEnergy = gEquipment.maxEnergy;
    }

    if (gEquipment.currentMissiles != gEquipment.maxMissiles && gEquipment.weaponsStatus & MBF_ANY_MISSILE)
    {
        gEquipment.currentMissiles += 16;

        if (gEquipment.currentMissiles > gEquipment.maxMissiles)
            gEquipment.currentMissiles = gEquipment.maxMissiles;
    }

    if (gEquipment.currentPowerBombs != gEquipment.maxPowerBombs && gEquipment.weaponsStatus & MBF_POWER_BOMBS)
    {
        gEquipment.currentPowerBombs += 16;

        if (gEquipment.currentPowerBombs > gEquipment.maxPowerBombs)
            gEquipment.currentPowerBombs = gEquipment.maxPowerBombs;
    }
}

/**
 * @brief 124a0 | 30 | Checks if samus is full energy and not full missiles
 * 
 * @return u8 nol, conditions met
 */
u8 SpriteUtilCheckEnergyFullAndMissilesNotFull(void)
{
    if (gEquipment.currentEnergy == gEquipment.maxEnergy)
    {
        if (gEquipment.weaponsStatus & MBF_ANY_MISSILE && gEquipment.currentMissiles < gEquipment.maxMissiles)
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 124d0 | 30 | Checks if samus is full missiles and not full energy
 * 
 * @return u8 nol, conditions met
 */
u8 SpriteUtilCheckMissilesFullAndEnergyNotFull(void)
{
    if (!(gEquipment.weaponsStatus & MBF_ANY_MISSILE))
        return TRUE;

    if (gEquipment.currentMissiles == gEquipment.maxMissiles && gEquipment.currentEnergy < gEquipment.maxEnergy)
        return TRUE;

    return FALSE;
}

/**
 * @brief 12500 | c4 | Checks if samus should pass through a sprite
 * 
 * @param spriteSlot Sprite slot
 * @return u32 bool, pass through
 */
u32 SpriteUtilSamusCheckPassThroughSprite(u8 spriteSlot)
{
    u8 passThrough;

    passThrough = FALSE;

    switch (gSamusData.pose)
    {
        case SPOSE_STARTING_SPIN_JUMP:
        case SPOSE_SPINNING:
        case SPOSE_STARTING_WALL_JUMP:
        case SPOSE_WALL_JUMPING:
        case SPOSE_SPACE_JUMPING:
            if (gSamusData.chargeBeamCounter >= 0x40) // FIXME define
            {
                if (spriteSlot == 0x80)
                {
                    passThrough++;
                    break;
                }

                if (ProjectileGetSpriteWeakness(spriteSlot) & (SPRITE_WEAKNESS_CHARGE_BEAM | SPRITE_WEAKNESS_BEAM_AND_BOMBS))
                    passThrough++;
            }
            break;

        default:
            if (gSamusData.speedboostingCounter != 0)
                passThrough++;
            break;

        case SPOSE_HANGING_ON_LEDGE:
        case SPOSE_PULLING_YOURSELF_UP_FROM_HANGING:
        case SPOSE_PULLING_YOURSELF_FORWARD_FROM_HANGING:
        case SPOSE_PULLING_YOURSELF_INTO_MORPH_BALL_TUNNEL:
        case SPOSE_SCREW_ATTACKING:
        case SPOSE_SHINESPARKING:
            passThrough++;
    }

    return passThrough;
}

/**
 * @brief 125c4 | 5c | Checks if samus is crouching or morphed
 * 
 * @return u32 bool, crouched or morphed
 */
u32 SpriteUtilCheckCrouchingOrMorphed(void)
{
    switch (gSamusData.pose)
    {
        case SPOSE_CROUCHING:
        case SPOSE_TURNING_AROUND_AND_CROUCHING:
        case SPOSE_SHOOTING_AND_CROUCHING:
        case SPOSE_MORPHING:
        case SPOSE_MORPH_BALL:
        case SPOSE_ROLLING:
        case SPOSE_UNMORPHING:
        case SPOSE_MORPH_BALL_MID_AIR:
        case SPOSE_GETTING_HURT_IN_MORPH_BALL:
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 12620 | 24 | Checks if samus is morphed
 * 
 * @return u32 bool, morphed
 */
u32 SpriteUtilCheckMorphed(void)
{
    switch (gSamusData.pose)
    {
        case SPOSE_MORPHING:
        case SPOSE_MORPH_BALL:
        case SPOSE_ROLLING:
        case SPOSE_UNMORPHING:
        case SPOSE_MORPH_BALL_MID_AIR:
        case SPOSE_GETTING_HURT_IN_MORPH_BALL:
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 12644 | b4 | Checks if samus is in a state that requires sprite behavior to be stopped
 * 
 * @return u32 bool, stop sprites
 */
u32 SpriteUtilCheckStopSpritesPose(void)
{
    if (gPreventMovementTimer != 0)
        return TRUE;

    switch (gSamusData.pose)
    {
        case SPOSE_ON_SAVE_PAD:
        case SPOSE_UNLOCKING_SECURITY:
        case SPOSE_SAVING:
        case SPOSE_ON_NAVIGATION_PAD:
        case SPOSE_DOWNLOADING_ABILITY:
        case SPOSE_FACING_FOREGROUND:
        case SPOSE_FACING_BACKGROUND:
        case SPOSE_UNLOCKING_HABITATIONS_DECK:
        case SPOSE_LOADING_SAVE:
        case SPOSE_DYING:
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 126f8 | 24 | Checks if samus is in a damaging pose
 * 
 * @return u32 bool, damaging pose
 */
u32 SpriteUtilCheckDamagingPose(void)
{
    u32 damaging;

    damaging = FALSE;

    switch (gSamusData.pose)
    {
        case SPOSE_SCREW_ATTACKING:
        case SPOSE_SHINESPARKING:
            damaging = TRUE;
            break;

        default:
            if (gSamusData.speedboostingCounter != 0)
                damaging = TRUE;
    }

    return damaging;
}

/**
 * @brief 1271c | a0 | Checks if samus is doing a sudo screw
 * 
 * @param spriteSlot Sprite slot
 * @return u32 bool, sudo screw
 */
u32 SpriteUtilCheckSudoScrew(u8 spriteSlot)
{
    u8 sudoCrew;

    sudoCrew = FALSE;
    switch (gSamusData.pose)
    {
        case SPOSE_STARTING_SPIN_JUMP:
        case SPOSE_SPINNING:
        case SPOSE_STARTING_WALL_JUMP:
        case SPOSE_WALL_JUMPING:
        case SPOSE_SPACE_JUMPING:
            if (gSamusData.chargeBeamCounter >= 0x40) // FIXME define
            {
                if (spriteSlot == 0x80)
                {
                    sudoCrew++;
                    break;
                }

                if (ProjectileGetSpriteWeakness(spriteSlot) & (SPRITE_WEAKNESS_CHARGE_BEAM | SPRITE_WEAKNESS_BEAM_AND_BOMBS))
                    sudoCrew++;
            }
    }

    return sudoCrew;
}

/**
 * @brief 127bc | 1c | Checks if samus is hanging on ledge
 * 
 * @return u32 bool, hanging on ledge
 */
u32 SpriteUtilCheckHangingOnLedge(void)
{
    switch (gSamusData.pose)
    {
        case SPOSE_HANGING_ON_LEDGE:
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 127d8 | 20 | Checks if samus is on a ceiling ladder
 * 
 * @return u32 bool, on ceiling ladder
 */
u32 SpriteUtilCheckOnCeilingLadder(void)
{
    switch (gSamusData.pose)
    {
        case SPOSE_HANGING_ON_HORIZONTAL_LADDER:
        case SPOSE_MOVING_ON_HORIZONTAL_LADDER:
        case SPOSE_TURNING_AROUND_ON_HORIZONTAL_LADDER:
        case SPOSE_DELAY_AFTER_SHOOTING_ON_HORIZONTAL_LADDER:
        case SPOSE_SHOOTING_ON_HORIZONTAL_LADDER:
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 127f8 | 20 | Checks if samus is pulling herself up
 * 
 * @return u32 bool, pulling self up
 */
u32 SpriteUtilCheckPullingSelfUp(void)
{
    switch (gSamusData.pose)
    {
        case SPOSE_HANGING_ON_LEDGE:
        case SPOSE_PULLING_YOURSELF_UP_FROM_HANGING:
        case SPOSE_PULLING_YOURSELF_FORWARD_FROM_HANGING:
        case SPOSE_PULLING_YOURSELF_INTO_MORPH_BALL_TUNNEL:
            return TRUE;
    }

    return FALSE;
}

/**
 * @brief 12818 | 40 | Tries to set absorb X flag
 * 
 */
void SpriteUtilTrySetAbsorbXFlag(void)
{
    u8 properties;

    if (gCurrentSprite.pose == 0)
    {
        properties = gCurrentSprite.spritesetSlotAndProperties;

        if (gCurrentSprite.status & SPRITE_STATUS_UNKNOWN_2000)
        {
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
            return;
        }

        if (properties == 16 || properties == 17 || properties == 18 || properties == 19 || properties == 20 || properties == 21 ||
            properties == 22 || properties == 23 || properties == 24 || properties == 25 || properties == 26 || properties == 27 ||
            properties == 28 || properties == 29 || properties == 30 || properties == 31)
        {
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
        }
    }
}

/**
 * @brief 12858 | 50 | Counts the number of a specified secondary sprite
 * 
 * @param spriteId Sprite ID
 * @return u8 count
 */
u8 SpriteUtilCountSecondarySprites(u8 spriteId)
{
    u8 i;
    u8 count;

    count = 0;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (!(gSpriteData[i].properties & SP_SECONDARY_SPRITE))
            continue;

        if (gSpriteData[i].spriteId == spriteId)
            count++;
    }

    return count;
}

/**
 * @brief 128a8 | 50 | Counts the number of a specified primary sprite
 * 
 * @param spriteId Sprite ID
 * @return u8 count
 */
u8 SpriteUtilCountPrimarySprites(u8 spriteId)
{
    u8 i;
    u8 count;

    count = 0;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (gSpriteData[i].properties & SP_SECONDARY_SPRITE)
            continue;

        if (gSpriteData[i].spriteId == spriteId)
            count++;
    }

    return count;
}

/**
 * @brief 128f8 | 4c | Finds the specified primary sprite
 * 
 * @param spriteId Sprite id
 * @return u8 Sprite ram slot
 */
u8 SpriteUtilFindPrimarySprite(u8 spriteId)
{
    u8 i;
    u8 count;

    count = 0;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (gSpriteData[i].properties & SP_SECONDARY_SPRITE)
            continue;

        if (gSpriteData[i].spriteId == spriteId)
            return i;
    }

    return UCHAR_MAX;
}

/**
 * @brief 12944 | 4c | Finds the specified secondary sprite
 * 
 * @param spriteId Sprite id
 * @return u8 Sprite ram slot
 */
u8 SpriteUtilFindSecondarySprite(u8 spriteId)
{
    u8 i;
    u8 count;

    count = 0;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (!(gSpriteData[i].properties & SP_SECONDARY_SPRITE))
            continue;

        if (gSpriteData[i].spriteId == spriteId)
            return i;
    }

    return UCHAR_MAX;
}

/**
 * @brief 12990 | 5c | Counts the number of a specified secondary sprite belonging to a specified primary sprite
 * 
 * @param spriteId Sprite ID
 * @param ramSlot Primary sprite ram slot
 * @return u8 Count
 */
u8 SpriteUtilCountSecondarySpriteWithRamSlot(u8 spriteId, u8 ramSlot)
{
    u8 i;
    u8 count;

    count = 0;
    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if (!(gSpriteData[i].status & SPRITE_STATUS_EXISTS))
            continue;

        if (!(gSpriteData[i].properties & SP_SECONDARY_SPRITE))
            continue;

        if (gSpriteData[i].spriteId == spriteId && gSpriteData[i].primarySpriteRamSlot == ramSlot)
            count++;
    }

    return count;
}

/**
 * @brief 129ec | 9c | Moves an eye core X beam
 * 
 * @param movement Movement
 */
void SpriteUtilMoveEyeCoreXBeam(u8 movement)
{
    switch (gCurrentSprite.work0)
    {
        case 4:
            gCurrentSprite.yPosition -= movement;
            break;

        case 5:
            gCurrentSprite.yPosition += movement;
            break;

        case 2:
            movement = movement * 3 / 4;

            gCurrentSprite.yPosition -= movement;

            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.xPosition += movement;
            else
                gCurrentSprite.xPosition -= movement;
            break;

        case 3:
            movement = movement * 3 / 4;

            gCurrentSprite.yPosition += movement;

            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.xPosition += movement;
            else
                gCurrentSprite.xPosition -= movement;
            break;

        default:
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
                gCurrentSprite.xPosition += movement;
            else
                gCurrentSprite.xPosition -= movement;
    }
}

/**
 * @brief 12a88 | cc | Moves an eye core X beam part to their starting position
 * 
 */
void SpriteUtilMoveEyeCoreXBeamPart(void)
{
    u16 diagonalMovement;
    u16 straightMovement;

    diagonalMovement = PIXEL_SIZE;
    straightMovement = PIXEL_SIZE + ONE_SUB_PIXEL;

    switch (gCurrentSprite.work0)
    {
        case 3:
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            {
                if (gCurrentSprite.roomSlot == 1)
                {
                    gCurrentSprite.yPosition -= diagonalMovement;
                    gCurrentSprite.xPosition += diagonalMovement;
                }
                else
                {
                    gCurrentSprite.yPosition += diagonalMovement;
                    gCurrentSprite.xPosition -= diagonalMovement;
                }
            }
            else
            {
                if (gCurrentSprite.roomSlot == 1)
                {
                    gCurrentSprite.yPosition -= diagonalMovement;
                    gCurrentSprite.xPosition -= diagonalMovement;
                }
                else
                {
                    gCurrentSprite.yPosition += diagonalMovement;
                    gCurrentSprite.xPosition += diagonalMovement;
                }
            }
            break;

        case 2:
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            {
                if (gCurrentSprite.roomSlot == 1)
                {
                    gCurrentSprite.yPosition -= diagonalMovement;
                    gCurrentSprite.xPosition -= diagonalMovement;
                }
                else
                {
                    gCurrentSprite.yPosition += diagonalMovement;
                    gCurrentSprite.xPosition += diagonalMovement;
                }
            }
            else
            {
                if (gCurrentSprite.roomSlot == 1)
                {
                    gCurrentSprite.yPosition -= diagonalMovement;
                    gCurrentSprite.xPosition += diagonalMovement;
                }
                else
                {
                    gCurrentSprite.yPosition += diagonalMovement;
                    gCurrentSprite.xPosition -= diagonalMovement;
                }
            }
            break;

        case 4:
        case 5:
            if (gCurrentSprite.roomSlot == 1)
                gCurrentSprite.xPosition -= straightMovement;
            else
                gCurrentSprite.xPosition += straightMovement;
            break;

        case 1:
        default:
            if (gCurrentSprite.roomSlot == 1)
                gCurrentSprite.yPosition -= straightMovement;
            else
                gCurrentSprite.yPosition += straightMovement;
            break;
    }
}

/**
 * @brief 12b54 | 104 | To document
 * 
 */
void unk_12b54(void)
{
    u8 offset;
    u16 diagonalMovement;
    u16 straightMovement;
    u8 roomSlot;

    offset = MOD_AND(gCurrentSprite.work1, 8);

    diagonalMovement = sWaveBeamPartVelocity[offset];
    straightMovement = diagonalMovement * 1.4;

    roomSlot = gCurrentSprite.roomSlot;

    if (offset > 3)
    {
        if (roomSlot == 1)
            roomSlot = 2;
        else if (roomSlot == 2)
            roomSlot = 1;
    }

    switch (gCurrentSprite.work0)
    {
        case 3:
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            {
                if (roomSlot == 1)
                {
                    gCurrentSprite.yPosition -= diagonalMovement;
                    gCurrentSprite.xPosition += diagonalMovement;
                }
                else
                {
                    gCurrentSprite.yPosition += diagonalMovement;
                    gCurrentSprite.xPosition -= diagonalMovement;
                }
            }
            else
            {
                if (roomSlot == 1)
                {
                    gCurrentSprite.yPosition -= diagonalMovement;
                    gCurrentSprite.xPosition -= diagonalMovement;
                }
                else
                {
                    gCurrentSprite.yPosition += diagonalMovement;
                    gCurrentSprite.xPosition += diagonalMovement;
                }
            }
            break;

        case 2:
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP)
            {
                if (roomSlot == 1)
                {
                    gCurrentSprite.yPosition -= diagonalMovement;
                    gCurrentSprite.xPosition -= diagonalMovement;
                }
                else
                {
                    gCurrentSprite.yPosition += diagonalMovement;
                    gCurrentSprite.xPosition += diagonalMovement;
                }
            }
            else
            {
                if (roomSlot == 1)
                {
                    gCurrentSprite.yPosition -= diagonalMovement;
                    gCurrentSprite.xPosition += diagonalMovement;
                }
                else
                {
                    gCurrentSprite.yPosition += diagonalMovement;
                    gCurrentSprite.xPosition -= diagonalMovement;
                }
            }
            break;

        case 4:
        case 5:
            if (roomSlot == 1)
                gCurrentSprite.xPosition -= straightMovement;
            else
                gCurrentSprite.xPosition += straightMovement;
            break;

        case 1:
        default:
            if (roomSlot == 1)
                gCurrentSprite.yPosition -= straightMovement;
            else
                gCurrentSprite.yPosition += straightMovement;
            break;
    }
}

/**
 * @brief 12c58 | 334 | Handles moving a beam core X
 * 
 * @param dstY Destination Y
 * @param dstX Destination X
 * @param yVelocity Y velocity cap
 * @param xVelocity X velocity cap
 * @param speedDivisor Speed divisor
 * @param soundId Sound to play when changing direction
 */
void SpriteUtilMoveBeamCoreX(u16 dstY, u16 dstX, u8 yVelocity, u8 xVelocity, u8 speedDivisor, u16 soundId)
{
    u8 collidingX;
    u8 collidingY;
    u8 turning;

    collidingX = FALSE;
    collidingY = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck != COLLISION_AIR)
        {
            collidingX++;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2,
                gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck != COLLISION_AIR)
            {
                collidingX++;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                    gCurrentSprite.xPosition + (BLOCK_SIZE - PIXEL_SIZE));

                if (gPreviousCollisionCheck != COLLISION_AIR)
                {
                    collidingX++;
                }
            }
        }
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

        if (gPreviousCollisionCheck != COLLISION_AIR)
        {
            collidingX++;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2,
                gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

            if (gPreviousCollisionCheck != COLLISION_AIR)
            {
                collidingX++;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2),
                    gCurrentSprite.xPosition - (BLOCK_SIZE - PIXEL_SIZE));

                if (gPreviousCollisionCheck != COLLISION_AIR)
                {
                    collidingX++;
                }
            }
        }
    }

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + (BLOCK_SIZE - PIXEL_SIZE), gCurrentSprite.xPosition);

        if (gPreviousCollisionCheck != COLLISION_AIR)
        {
            collidingY++;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + (BLOCK_SIZE - PIXEL_SIZE),
                gCurrentSprite.xPosition + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

            if (gPreviousCollisionCheck != COLLISION_AIR)
            {
                collidingY++;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + (BLOCK_SIZE - PIXEL_SIZE),
                    gCurrentSprite.xPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2));

                if (gPreviousCollisionCheck != COLLISION_AIR)
                {
                    collidingY++;
                }
            }
        }
    }
    else
    {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE - PIXEL_SIZE), gCurrentSprite.xPosition);

        if (gPreviousCollisionCheck != COLLISION_AIR)
        {
            collidingY++;
        }
        else
        {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE - PIXEL_SIZE),
                gCurrentSprite.xPosition + HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2);

            if (gPreviousCollisionCheck != COLLISION_AIR)
            {
                collidingY++;
            }
            else
            {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - (BLOCK_SIZE - PIXEL_SIZE),
                    gCurrentSprite.xPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2));

                if (gPreviousCollisionCheck != COLLISION_AIR)
                {
                    collidingY++;
                }
            }
        }
    }

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (collidingX)
        {
            turning = TRUE;
        }
        else
        {
            if (gCurrentSprite.work2 == 0)
            {
                if (gCurrentSprite.xPosition > dstX - PIXEL_SIZE)
                {
                    gCurrentSprite.work2 = gCurrentSprite.work3;
                }
                else
                {
                    if (gCurrentSprite.work3 < xVelocity)
                        gCurrentSprite.work3++;

                    gCurrentSprite.xPosition += gCurrentSprite.work3 >> speedDivisor;
                }
            }
            else
            {
                gCurrentSprite.work2--;

                if (gCurrentSprite.work2 != 0)
                    gCurrentSprite.xPosition += gCurrentSprite.work2 >> speedDivisor;
                else
                    turning = TRUE;
            }
        }
    }
    else
    {
        if (!collidingX)
        {
            if (gCurrentSprite.work2 == 0)
            {
                if (gCurrentSprite.xPosition < dstX + PIXEL_SIZE)
                {
                    gCurrentSprite.work2 = gCurrentSprite.work3;
                }
                else
                {
                    if (gCurrentSprite.work3 < xVelocity)
                        gCurrentSprite.work3++;

                    gCurrentSprite.xPosition -= gCurrentSprite.work3 >> speedDivisor;
                }
            }
            else
            {
                gCurrentSprite.work2--;

                if (gCurrentSprite.work2 != 0)
                    gCurrentSprite.xPosition -= gCurrentSprite.work2 >> speedDivisor;
                else
                    turning = TRUE;
            }
        }
        else
            turning = TRUE;
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
        SoundPlayNotAlreadyPlaying(soundId);
    }

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (collidingY)
        {
            turning = TRUE;
        }
        else
        {
            if (gCurrentSprite.work1 == 0)
            {
                if (gCurrentSprite.yPosition > dstY - PIXEL_SIZE)
                {
                    gCurrentSprite.work1 = gCurrentSprite.work4;
                }
                else
                {
                    if (gCurrentSprite.work4 < yVelocity)
                        gCurrentSprite.work4++;

                    gCurrentSprite.yPosition += gCurrentSprite.work4 >> speedDivisor;
                }
            }
            else
            {
                gCurrentSprite.work1--;

                if (gCurrentSprite.work1 != 0)
                    gCurrentSprite.yPosition += gCurrentSprite.work1 >> speedDivisor;
                else
                    turning = TRUE;
            }
        }
    }
    else
    {
        if (!collidingY)
        {
            if (gCurrentSprite.work1 == 0)
            {
                if (gCurrentSprite.yPosition < dstY + PIXEL_SIZE)
                {
                    gCurrentSprite.work1 = gCurrentSprite.work4;
                }
                else
                {
                    if (gCurrentSprite.work4 < yVelocity)
                        gCurrentSprite.work4++;

                    gCurrentSprite.yPosition -= gCurrentSprite.work4 >> speedDivisor;
                }
            }
            else
            {
                gCurrentSprite.work1--;

                if (gCurrentSprite.work1 != 0)
                    gCurrentSprite.yPosition -= gCurrentSprite.work1 >> speedDivisor;
                else
                    turning = TRUE;
            }
        }
        else
            turning = TRUE;
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.work4 = 1;
        SoundPlayNotAlreadyPlaying(soundId);
    }
}

/**
 * @brief 12f8c | 25c | Handles moving a beam core X (unused)
 * 
 * @param dstY Destination Y
 * @param dstX Destination X
 * @param yVelocity Y velocity cap
 * @param xVelocity X velocity cap
 * @param speedDivisor Speed divisor
 * @param soundId Sound to play when changing direction
 */
void SpriteUtilMoveBeamCoreX_Unused(u16 dstY, u16 dstX, u8 yVelocity, u8 xVelocity, u8 speedDivisor, u16 soundId)
{
    u8 turning;
    u16 velocity;

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > dstX - PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < xVelocity)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition += gCurrentSprite.work3 >> speedDivisor;
            }
        }
        else
        {
            gCurrentSprite.work2--;

            if (gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += gCurrentSprite.work2 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < dstX + PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < xVelocity)
                    gCurrentSprite.work3++;

                velocity = gCurrentSprite.work3 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
        }
        else
        {
            gCurrentSprite.work2--;

            if (gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
        SoundPlayNotAlreadyPlaying(soundId);
    }

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > dstY - PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < yVelocity)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition += gCurrentSprite.work4 >> speedDivisor;
            }
        }
        else
        {
            gCurrentSprite.work1--;

            if (gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += gCurrentSprite.work1 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < dstY + PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < yVelocity)
                    gCurrentSprite.work4++;

                velocity = gCurrentSprite.work4 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
        }
        else
        {
            gCurrentSprite.work1--;

            if (gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.work4 = 1;
        SoundPlayNotAlreadyPlaying(soundId);
    }
}

/**
 * @brief Makes a sprite move towards a specified target
 * 
 * @param dstY Destination Y
 * @param dstX Destination X
 * @param ySpeedCap Y Velocity
 * @param xSpeedCap X Velocity
 * @param speedDivisor Speed divisor
 */
void SpriteUtilMoveTowardsTarget(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor)
{
    u8 turning;
    u16 velocity;

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > dstX - PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition += gCurrentSprite.work3 >> speedDivisor;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += gCurrentSprite.work2 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < dstX + PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                velocity = gCurrentSprite.work3 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
    }

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > dstY - PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition += gCurrentSprite.work4 >> speedDivisor;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += gCurrentSprite.work1 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < dstY + PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                velocity = gCurrentSprite.work4 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.work4 = 1;
    }
}

/**
 * @brief 1343c | 270 | To document
 * 
 * @param dstY Destination Y
 * @param dstX Destination X
 * @param yVelocity Y velocity cap
 * @param xVelocity X velocity cap
 * @param speedDivisor Speed divisor
 * @param soundId Sound to play when changing direction
 */
void unk_1343c(u16 dstY, u16 dstX, u8 yVelocity, u8 xVelocity, u8 speedDivisor, u16 soundId)
{
    u8 turning;
    u16 velocity;

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > dstX - PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < xVelocity)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition += gCurrentSprite.work3 >> speedDivisor;
            }
        }
        else
        {
            gCurrentSprite.work2--;

            if (gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += gCurrentSprite.work2 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < dstX + PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < xVelocity)
                    gCurrentSprite.work3++;

                velocity = gCurrentSprite.work3 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
        }
        else
        {
            gCurrentSprite.work2--;

            if (gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;

        gCurrentSprite.unk_8++;
        if (gCurrentSprite.unk_8 > 3)
            gCurrentSprite.unk_8 = 0;
        
        gCurrentSprite.work3 = 1;
        SoundPlayNotAlreadyPlaying(soundId);
    }

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > dstY - PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < yVelocity)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition += gCurrentSprite.work4 >> speedDivisor;
            }
        }
        else
        {
            gCurrentSprite.work1--;

            if (gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += gCurrentSprite.work1 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < dstY + PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < yVelocity)
                    gCurrentSprite.work4++;

                velocity = gCurrentSprite.work4 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
        }
        else
        {
            gCurrentSprite.work1--;

            if (gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.work4 = 1;
        SoundPlayNotAlreadyPlaying(soundId);
    }
}

/**
 * @brief 136ac | 264 | To document
 * 
 * @param dstY Destination Y
 * @param dstX Destination X
 * @param ySpeedCap Y Velocity
 * @param xSpeedCap X Velocity
 * @param speedDivisor Speed divisor
 */
void unk_136ac(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor)
{
    u8 turning;
    u16 velocity;

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition > dstX - PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                gCurrentSprite.xPosition += gCurrentSprite.work3 >> speedDivisor;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += gCurrentSprite.work2 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work2 == 0)
        {
            if (gCurrentSprite.xPosition < dstX + PIXEL_SIZE)
            {
                gCurrentSprite.work2 = gCurrentSprite.work3;
            }
            else
            {
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                velocity = gCurrentSprite.work3 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;

        gCurrentSprite.unk_8++;
        if (gCurrentSprite.unk_8 > 3)
            gCurrentSprite.unk_8 = 0;
        
        gCurrentSprite.work3 = 1;
    }

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition > dstY - PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                gCurrentSprite.yPosition += gCurrentSprite.work4 >> speedDivisor;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += gCurrentSprite.work1 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work1 == 0)
        {
            if (gCurrentSprite.yPosition < dstY + PIXEL_SIZE)
            {
                gCurrentSprite.work1 = gCurrentSprite.work4;
            }
            else
            {
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                velocity = gCurrentSprite.work4 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.work4 = 1;
    }
}

void SpriteUtilMoveRidleyFireball(u16 dstY, u16 dstX, u8 yVelocity, u8 xVelocity, u8 speedDivisor)
{
    // https://decomp.me/scratch/oiQHP

    u8 turning;
    u16 velocity;
    u8 updatePos;

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_FACING_RIGHT)
    {
        if (gCurrentSprite.work2 == 0)
        {
            updatePos = FALSE;
            if (gCurrentSprite.work3 < xVelocity)
            {
                if (gCurrentSprite.xPosition <= dstX - PIXEL_SIZE)
                {
                    gCurrentSprite.work3++;
                    updatePos = TRUE;
                }
                else
                {
                    gCurrentSprite.work2 = gCurrentSprite.work3;
                    updatePos = FALSE;
                }
            }
            else
                updatePos = TRUE;

            if (updatePos)
                gCurrentSprite.xPosition += gCurrentSprite.work3 >> speedDivisor;
        }
        else
        {
            gCurrentSprite.work2--;

            if (gCurrentSprite.work2 != 0)
                gCurrentSprite.xPosition += gCurrentSprite.work2 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work2 == 0)
        {
            updatePos = FALSE;
            if (gCurrentSprite.work3 < xVelocity)
            {
                if (gCurrentSprite.xPosition <= dstX + PIXEL_SIZE)
                {
                    gCurrentSprite.work3++;
                    updatePos = TRUE;
                }
                else
                {
                    gCurrentSprite.work2 = gCurrentSprite.work3;
                    updatePos = FALSE;
                }
            }
            else
                updatePos = TRUE;

            if (updatePos)
                gCurrentSprite.xPosition -= gCurrentSprite.work3 >> speedDivisor;
        }
        else
        {
            gCurrentSprite.work2--;

            if (gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gCurrentSprite.xPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gCurrentSprite.xPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
    }

    turning = FALSE;

    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.work1 == 0)
        {
            updatePos = FALSE;
            if (gCurrentSprite.work4 < yVelocity)
            {
                if (gCurrentSprite.yPosition <= dstY - PIXEL_SIZE)
                {
                    gCurrentSprite.work4++;
                    updatePos = TRUE;
                }
                else
                {
                    gCurrentSprite.work1 = gCurrentSprite.work4;
                    updatePos = FALSE;
                }
            }
            else
                updatePos = TRUE;

            if (updatePos)
                gCurrentSprite.yPosition += gCurrentSprite.work4 >> speedDivisor;
        }
        else
        {
            gCurrentSprite.work1--;

            if (gCurrentSprite.work1 != 0)
                gCurrentSprite.yPosition += gCurrentSprite.work1 >> speedDivisor;
            else
                turning = TRUE;
        }
    }
    else
    {
        if (gCurrentSprite.work1 == 0)
        {
            updatePos = FALSE;
            if (gCurrentSprite.work4 < yVelocity)
            {
                if (gCurrentSprite.yPosition >= dstY + PIXEL_SIZE)
                {
                    gCurrentSprite.work4++;
                    updatePos = TRUE;
                }
                else
                {
                    gCurrentSprite.work1 = gCurrentSprite.work4;
                    updatePos = FALSE;
                }
            }
            else
                updatePos = TRUE;

            if (updatePos)
                gCurrentSprite.yPosition -= gCurrentSprite.work4 >> speedDivisor;
        }
        else
        {
            gCurrentSprite.work1--;

            if (gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gCurrentSprite.yPosition - velocity) & 0x8000)
                {
                    turning = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gCurrentSprite.yPosition -= velocity;
            }
            else
                turning = TRUE;
        }
    }

    if (turning)
    {
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.work4 = 1;
    }
}

/**
 * @brief 13b24 | 74 | Updates the stun flash timer of the current sprite
 * 
 */
void SpriteUtilUpdateStunTimer(void)
{
    u8 isft;

    if (!SPRITE_HAS_ISFT(gCurrentSprite))
        return;

    isft = --gCurrentSprite.invincibilityStunFlashTimer;

    if (MOD_AND(isft, 4) != 0)
        return;

    if (gCurrentSprite.pose >= 0x5B)
        return;

    if (isft & 4)
    {
        if (gCurrentSprite.health != 0)
            gCurrentSprite.paletteRow = 13 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);

        return;
    }

    if (gCurrentSprite.health != 0)
    {
        if (gCurrentSprite.freezeTimer != 0)
            gCurrentSprite.paletteRow = 15 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
        else
            gCurrentSprite.paletteRow = 0;
    }
}
