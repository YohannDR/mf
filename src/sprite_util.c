#include "sprite_util.h"
#include "macros.h"
#include "gba.h"
#include "globals.h"

#include "data/sprite_data.h"
#include "data/samus_data.h"

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

    gfxSlot = CheckLoadAreaBanner();

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
        reductionType = GET_SSPRITE_SUIT_REDUCTION(gSpriteData[spriteSlot].spriteId) & 3;
    }
    else
    {
        damage = GET_PSPRITE_DAMAGE(gSpriteData[spriteSlot].spriteId);
        reductionType = GET_PSPRITE_SUIT_REDUCTION(gSpriteData[spriteSlot].spriteId) & 3;
    }

    // Apply damage multiplier
    damage *= dmgMultiplier;

    // Apply suit reduction, multiply damage by reduction/10
    suitStatus = gEquipment.suitMiscStatus;
    if (suitStatus & SMF_GRAVITY_SUIT)
        damage = FRACT_MUL(damage, sSuitDamageReductionPercent[reductionType][2], 10);
    else if (suitStatus & SMF_VARIA_SUIT)
        damage = FRACT_MUL(damage, sSuitDamageReductionPercent[reductionType][1], 10);
    else
        damage = FRACT_MUL(damage, sSuitDamageReductionPercent[reductionType][0], 10);

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
void SamusAndSpriteCollision(void)
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
            if (!SamusCheckPassThroughFrozenSprite(i))
            {
                if (samusY - (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2) < spriteTop)
                {
                    CheckCollisionAtPosition(spriteTop + ONE_SUB_PIXEL + gSamusData.drawDistanceTop, samusX);

                    if (gPreviousCollisionCheck == COLLISION_AIR)
                    {
                        gSamusData.yPosition = spriteTop + ONE_SUB_PIXEL;

                        gSpriteData[i].status |= SPRITE_STATUS_SAMUS_ON_TOP;
                        gSpriteData[i].standingOnSprite = 2;
                    }
                }
                else if (samusTop + QUARTER_BLOCK_SIZE > spriteBottom)
                {
                    CheckCollisionAtPosition(spriteBottom - gSamusData.drawDistanceTop, samusX);

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
                        CheckCollisionAtPosition(samusY, spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                        if (gPreviousCollisionCheck == COLLISION_AIR)
                        {
                            CheckCollisionAtPosition(samusY - BLOCK_SIZE,
                                spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                            if (gPreviousCollisionCheck == COLLISION_AIR || SamusCheckMorphed())
                            {
                                gSamusData.xPosition = spriteLeft - gSamusData.drawDistanceRight;

                                if (gSamusData.direction & KEY_RIGHT && gEquipment.currentEnergy != 0)
                                    gSamusData.xVelocity = 0;
                            }
                        }
                    }
                    else
                    {
                        CheckCollisionAtPosition(samusY, spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                        if (gPreviousCollisionCheck == COLLISION_AIR)
                        {
                            CheckCollisionAtPosition(samusY - BLOCK_SIZE,
                                spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                            if (gPreviousCollisionCheck == COLLISION_AIR || SamusCheckMorphed())
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
                    if (SamusCheckPassThroughFrozenSprite(i))
                        break;

                    if (samusY - (QUARTER_BLOCK_SIZE + QUARTER_BLOCK_SIZE / 2) < spriteTop)
                    {
                        CheckCollisionAtPosition(spriteTop + ONE_SUB_PIXEL + gSamusData.drawDistanceTop, samusX);

                        if (gPreviousCollisionCheck == COLLISION_AIR)
                        {
                            gSamusData.yPosition = spriteTop + ONE_SUB_PIXEL;

                            gSpriteData[i].status |= SPRITE_STATUS_SAMUS_ON_TOP;
                            gSpriteData[i].standingOnSprite = 2;
                        }
                    }
                    else if (samusTop + QUARTER_BLOCK_SIZE > spriteBottom)
                    {
                        CheckCollisionAtPosition(spriteBottom - gSamusData.drawDistanceTop, samusX);

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
                            CheckCollisionAtPosition(samusY, spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                            {
                                CheckCollisionAtPosition(samusY - BLOCK_SIZE,
                                    spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                                if (gPreviousCollisionCheck == COLLISION_AIR || SamusCheckMorphed())
                                {
                                    gSamusData.xPosition = spriteLeft - gSamusData.drawDistanceRight;

                                    if (gSamusData.direction & KEY_RIGHT && gEquipment.currentEnergy != 0)
                                        gSamusData.xVelocity = 0;
                                }
                            }
                        }
                        else
                        {
                            CheckCollisionAtPosition(samusY, spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                            {
                                CheckCollisionAtPosition(samusY - BLOCK_SIZE,
                                    spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                                if (gPreviousCollisionCheck == COLLISION_AIR || SamusCheckMorphed())
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
                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose() && !SamusCheckSudoScrew(i))
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
                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose() && !SamusCheckSudoScrew(i))
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
                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose() && !SamusCheckSudoScrew(i))
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
                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose() && !SamusCheckSudoScrew(i))
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
                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose() && !SamusCheckSudoScrew(i))
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

                            if (CheckAfterEventIceBeamRecovered())
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
                            if (CheckAfterEventIceBeamRecovered())
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

                    if (gSamusData.invincibilityTimer < 8 && !SamusCheckDamagingPose() && !SamusCheckSudoScrew(i))
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
                        if (SamusCheckSudoScrew(i))
                        {
                            gIgnoreSamusAndSpriteCollision = TRUE;
                            break;
                        }

                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                        {
                            CheckCollisionAtPosition(samusY, spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                                gSamusData.xPosition = spriteLeft - gSamusData.drawDistanceRight;
                        }
                        else
                        {
                            CheckCollisionAtPosition(samusY, spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                                gSamusData.xPosition = spriteRight - gSamusData.drawDistanceLeft;
                        }

                        if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose())
                        {
                            SpriteUtilTakeDamageFromSprite(TRUE, i, 1);
                        }
                        else
                        {
                            CheckCollisionAtPosition(samusY + ONE_SUB_PIXEL + gSamusData.drawDistanceTop, samusX);

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
                    if (!SamusCheckDamagingPose() && !SamusCheckSudoScrew(i))
                    {
                        if (collisionFlags & SPRITE_COLLISION_FLAG_ON_LEFT)
                        {
                            CheckCollisionAtPosition(samusY, spriteLeft - gSamusData.drawDistanceRight + gSamusData.drawDistanceLeft);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                                gSamusData.xPosition = spriteLeft - gSamusData.drawDistanceRight;
                        }
                        else
                        {
                            CheckCollisionAtPosition(samusY, spriteRight - gSamusData.drawDistanceLeft + gSamusData.drawDistanceRight);

                            if (gPreviousCollisionCheck == COLLISION_AIR)
                                gSamusData.xPosition = spriteRight - gSamusData.drawDistanceLeft;
                        }

                        if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose())
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
                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose())
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
                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose())
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
                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose())
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

                    if (gSamusData.invincibilityTimer == 0 && !SamusCheckDamagingPose() && !SamusCheckSudoScrew(i))
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

                    if (SamusCheckMorphed() || gSamusData.pose == SPOSE_SPACE_JUMPING)
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
u16 SpriteUtilCheckVerticalCollisionAtPosition(u16 yPosition, u16 xPosition)
{
    s16 blockTop;
    u32 clipdata;

    clipdata = ClipdataProcess(yPosition, xPosition);

    if (clipdata & CLIPDATA_TYPE_SOLID_FLAG)
        gPreviousVerticalCollisionCheck = COLLISION_SOLID;
    else
        gPreviousVerticalCollisionCheck = COLLISION_AIR;

    switch (LOW_BYTE(clipdata))
    {
        case CLIPDATA_TYPE_RIGHT_STEEP_FLOOR_SLOPE:
            blockTop = (yPosition & BLOCK_POSITION_FLAG) - ((xPosition & SUB_PIXEL_POSITION_FLAG) - SUB_PIXEL_POSITION_FLAG);
            gPreviousVerticalCollisionCheck = COLLISION_RIGHT_STEEP_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_LOWER_SLIGHT_FLOOR_SLOPE:
            blockTop = (yPosition & BLOCK_POSITION_FLAG) - (((xPosition & SUB_PIXEL_POSITION_FLAG) / 2) - SUB_PIXEL_POSITION_FLAG);
            gPreviousVerticalCollisionCheck = COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE;
            break;

        case CLIPDATA_TYPE_RIGHT_UPPER_SLIGHT_FLOOR_SLOPE:
            blockTop = ((yPosition & BLOCK_POSITION_FLAG) - (((xPosition & SUB_PIXEL_POSITION_FLAG) / 2) - (SUB_PIXEL_POSITION_FLAG / 2)));
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
