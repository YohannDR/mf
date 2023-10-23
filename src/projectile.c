#include "projectile.h"
#include "gba.h"
#include "macros.h"
#include "globals.h"
#include "sprite_util.h"

#include "data/sprite_data.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/projectile.h"

#include "structs/clipdata.h"
#include "structs/samus.h"
#include "structs/sprite.h"
#include "structs/power_bomb.h"
#include "structs/projectile.h"

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
        if ((gProjectileData[i].status & PROJ_STATUS_DRAW_CHECK) != (PROJ_STATUS_DRAW_COND | PROJ_STATUS_UNKNOWN_80))
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
        if (!(gCurrentProjectile.status & PROJ_STATUS_HIGH_PRIORITY))
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

    var_2 = var_0 - PIXEL_TO_SUBPIXEL(gCurrentProjectile.drawDistanceY);
    tmp = PIXEL_TO_SUBPIXEL(gCurrentProjectile.drawDistanceY) + SCREEN_SIZE_Y_SUB_PIXEL;
    var_3 = var_0 + tmp;

    var_4 = bgX + BLOCK_SIZE * 4;
    xDistance = projX + BLOCK_SIZE * 4;

    var_6 = var_4 - PIXEL_TO_SUBPIXEL(gCurrentProjectile.drawDistanceX);
    tmp2 = PIXEL_TO_SUBPIXEL(gCurrentProjectile.drawDistanceX) + SCREEN_SIZE_X_SUB_PIXEL;
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

}

void ProjectileLoadBeamGraphics(void)
{

}

void ProjectileLoadMissileGraphics(void)
{

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

void ProjectileMove(u8 movement)
{

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

u32 ProjectileCheckVerticalCollisionAtPosition(void)
{

}

void ProjectileMovePart(void)
{

}

void ProjectileMoveWaveBeamParts(void)
{

}

void ProjectileMoveWaveBeamParts_Unused(void)
{

}

void ProjectileSetMissileTrail(u8 particle, u8 delay)
{

}

void ProjectileSetBeamTrail(u8 particle, u8 delay)
{

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

        spriteCheck = SPRITE_STATUS_EXISTS | SPRITE_STATUS_UNKNOWN_2000 | SPRITE_STATUS_IGNORE_PROJECTILES;
        xCheck = SPRITE_STATUS_EXISTS | SPRITE_STATUS_UNKNOWN_2000;

        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if (gSpriteData[i].pose < SPRITE_POSE_TURNING_INTO_X)
            {
                if ((gSpriteData[i].status & spriteCheck) != SPRITE_STATUS_EXISTS)
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
                if ((gSpriteData[i].status & xCheck) != SPRITE_STATUS_EXISTS)
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

    if (SpriteUtilCheckDamagingPose())
        contactDamage = 0x1;
    else if (SpriteUtilCheckSudoScrew(0x80))
        contactDamage = 0x2;

    if (contactDamage != 0x0)
    {
        o1Y = gSamusData.yPosition;
        o1X = gSamusData.xPosition;

        o1Top = o1Y + gSamusData.drawDistanceTop;
        o1Bottom = o1Y + gSamusData.drawDistanceBottom;
        o1Left = o1X + gSamusData.drawDistanceLeft;
        o1Right = o1X + gSamusData.drawDistanceRight;

        spriteCheck = SPRITE_STATUS_EXISTS | SPRITE_STATUS_UNKNOWN_2000 | SPRITE_STATUS_IGNORE_PROJECTILES;

        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
        {
            if ((gSpriteData[i].status & spriteCheck) != SPRITE_STATUS_EXISTS)
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

    spriteCheck = SPRITE_STATUS_EXISTS | SPRITE_STATUS_UNKNOWN_2000 | SPRITE_STATUS_IGNORE_PROJECTILES;

    for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++)
    {
        if ((gSpriteData[i].status & spriteCheck) == SPRITE_STATUS_EXISTS && gSpriteData[i].health != 0)
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
                            ProjectileChargedPlasmalBeamHitSprite(i, j, o2Y, o2X);
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
                            ProjectileMissileHitSprite(i, j, o2Y, o2X);
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

void ProjectileRandomSpriteDebris(u8 cloudType, u8 flashTimer, u16 yPosition, u16 xPosition)
{

}

void ProjectileRandomSpriteDebrisPiercing(u8 cloudType, u8 flashTimer, u16 yPosition, u16 xPosition)
{

}

void ProjectileSetIsftForPowerBomb(u8 spriteSlot)
{

}

void ProjectileBringSpriteToPowerBombCenter(u8 spriteSlot)
{

}

void ProjectilePowerBombHitSprite(u8 spriteSlot)
{

}

void ProjectileContactDamageHitSprite(u8 spriteSlot, u16 yPosition, u16 xPosition)
{

}

u8 ProjecileDealDamage(u8 spriteSlot, u16 damage)
{

}

void ProjectileSudoScrewHitSprite(u8 spriteSlot, u16 yPosition, u16 xPosition)
{

}

u8 ProjectileIceMissileDealDamage(u8 spriteSlot, u8 projectileSlot)
{

}

u8 ProjectileDiffusionFlakeDealDamage(u8 spriteSlot, u8 projectileSlot)
{

}

u8 ProjectileIceBeamDealDamage(u8 spriteSlot, u8 projectileSlot, u16 damage)
{

}

void ProjectileSetIsftForSolid(u8 spriteSlot)
{

}

void ProjectileNormalBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileChargedNormalBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileChargeBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileChargedChargeBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileWideBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileChargedWideBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectilePlasmaBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileChargedPlasmaBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileWaveBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileChargedWaveBeamHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileFlareHitSprite(u8 spriteSlot, u16 yPosition, u16 xPosition, u16 spriteY, u16 spriteX)
{

}

void ProjectileStartMissileTumble(u8 spriteSlot, u8 projectileSlot)
{

}

void ProjectileNormalMissileHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileSuperMissileHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileIceMissileHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileDiffusionMissileHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileDiffusionFlakeHitSprite(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileBombHitSprite(u8 spriteSlot, u16 yPosition, u16 xPosition)
{

}

void unk_84cac(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void unk_84cc8(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void unk_84ce4(u8 spriteSlot, u8 projectileSlot, u16 yPosition, u16 xPosition)
{

}

void ProjectileDealDamageToZazabi(u16 damage)
{

}

void ProjectileChargedNormalBeamInit(void)
{

}

void ProjectileChargedNormalBeamSubroutine(void)
{

}

void ProjectileNormalBeamInit(void)
{

}

void ProjectileNormalBeamSubroutine(void)
{

}

void ProjectileMissileInit(u8 type)
{

}

void ProjectileMoveTumblingMissile(void)
{

}

void ProjectileNormalMissileSubroutine(void)
{

}

void ProjectileSuperMissileSubroutine(void)
{

}

void ProjectileIceMissilesSubroutine(void)
{

}

void ProjectileDiffusionMissileSubroutine(void)
{

}

void ProjectileDiffusionFlakeSubroutine(void)
{

}

void ProjectileCheckSamusBombBounce(void)
{

}

void ProjectileBombInit(void)
{

}

void ProjectileBombSubroutine(void)
{

}

void ProjectilePowerBombInit(void)
{

}

void ProjectilePowerBombSubroutine(void)
{

}

void ProjectileChargedChargeBeamInit(void)
{

}

void ProjectileChargedChargeBeamSubroutine(void)
{

}

void ProjectileChargeBeamInit(void)
{

}

void ProjectileChargeBeamSubroutine(void)
{

}

void ProjectileChargedWideBeaminit(void)
{

}

void ProjectileChargedWideBeamSubroutine(void)
{

}

void ProjectileWideBeamInit(void)
{

}

void ProjectileWideBeamSubroutine(void)
{

}

void ProjectileChargedPlasmaBeamInit(void)
{

}

void ProjectileChargedPlasmaBeamSubroutine(void)
{

}

void ProjectilePlasmaBeamInit(void)
{

}

void ProjectilePlasmaBeamSubroutine(void)
{

}

void ProjectileChargedWaveBeamInit(void)
{

}

void ProjectileChargedWaveBeamSubroutine(void)
{

}

void ProjectileWaveBeamInit(void)
{

}

void ProjectileWaveBeamSubroutine(void)
{

}

void ProjectileFlareLoadGraphics(u8 stage)
{

}

void ProjectileFlareInit(void)
{

}

void ProjectileFlareSubroutine(void)
{

}
