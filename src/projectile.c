#include "projectile.h"
#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "data/sprite_data.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/projectile.h"

#include "structs/clipdata.h"
#include "structs/samus.h"
#include "structs/sprite.h"
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
        if (!(gCurrentProjectile.status & PROJ_STATUS_HIGH_BG_PRIORITY))
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

}

void ProjectileLoadBeamGraphics(void)
{

}

void ProjectileLoadMissileGraphics(void)
{
    u8 weaponsStatus = gEquipment.weaponsStatus;

    if (weaponsStatus & MBF_DIFFUSION_MISSILES) {
        DMA_SET(3, 0x858d624, VRAM_OBJ + 0x1380, C_32_2_16(DMA_ENABLE, 0x80 / 2))
        DMA_SET(3, 0x858d6a4, VRAM_OBJ + 0x1780, C_32_2_16(DMA_ENABLE, 0x80 / 2))
    } else if (weaponsStatus & MBF_ICE_MISSILES) {
        DMA_SET(3, 0x858d524, VRAM_OBJ + 0x1380, C_32_2_16(DMA_ENABLE, 0x80 / 2))
        DMA_SET(3, 0x858d5a4, VRAM_OBJ + 0x1780, C_32_2_16(DMA_ENABLE, 0x80 / 2))
    } else if (weaponsStatus & MBF_SUPER_MISSILES) {
        DMA_SET(3, 0x858d424, VRAM_OBJ + 0x1380, C_32_2_16(DMA_ENABLE, 0x80 / 2))
        DMA_SET(3, 0x858d4a4, VRAM_OBJ + 0x1780, C_32_2_16(DMA_ENABLE, 0x80 / 2))
    } else if (weaponsStatus & MBF_MISSILES) {
        DMA_SET(3, 0x858d324, VRAM_OBJ + 0x1380, C_32_2_16(DMA_ENABLE, 0x80 / 2))
        DMA_SET(3, 0x858d3a4, VRAM_OBJ + 0x1780, C_32_2_16(DMA_ENABLE, 0x80 / 2))
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

void ProjectileBringSpriteToPowerBombCenter(u8 spriteSlot)
{
    // https://decomp.me/scratch/kvjnc

    u16 spriteY;
    u16 spriteX;
    u16 powerBombY;
    u16 powerBombX;
    u16 ySpeed;
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

    ySpeed = QUARTER_BLOCK_SIZE + PIXEL_SIZE;
    xSpeed = QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;

    if (spriteY > powerBombY)
    {
        spriteY -= ySpeed;
    }
    else if (spriteY < powerBombY)
    {
        spriteY += ySpeed;
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
        gSpriteData[spriteSlot].paletteRow = 15 - (gSpriteData[spriteSlot].spritesetGfxSlot + gSpriteData[spriteSlot].frozenPaletteRowOffset);
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
        gSpriteData[spriteSlot].paletteRow = 15 - (gSpriteData[spriteSlot].spritesetGfxSlot + gSpriteData[spriteSlot].frozenPaletteRowOffset);
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
        gSpriteData[spriteSlot].paletteRow = 15 - (gSpriteData[spriteSlot].spritesetGfxSlot + gSpriteData[spriteSlot].frozenPaletteRowOffset);
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
        ParticleSet(yPosition, xPosition, 0x3);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_BEAM_BOMBS)
    {
        isft = ProjecileDealDamage(spriteSlot, 2);

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
        ParticleSet(yPosition, xPosition, 0x4);
    }
    else if (gSpriteData[spriteSlot].properties & SP_IMMUNE_TO_PROJECTILES)
    {
        ParticleSet(yPosition, xPosition, 0x7);
    }
    else if (ProjectileGetSpriteWeakness(spriteSlot) & WEAKNESS_BEAM_BOMBS)
    {
        isft = ProjecileDealDamage(spriteSlot, 2);

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
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
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
            ProjectileRandomSpriteDebris(1, isft, yPosition, xPosition);
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
            gSpriteData[spriteSlot].paletteRow = 15 - (gSpriteData[spriteSlot].spritesetGfxSlot + gSpriteData[spriteSlot].frozenPaletteRowOffset);
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
            gSpriteData[spriteSlot].paletteRow = 15 - (gSpriteData[spriteSlot].spritesetGfxSlot + gSpriteData[spriteSlot].frozenPaletteRowOffset);
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
    gProjectileData[projectileSlot].status |= PROJ_STATUS_HIGH_BG_PRIORITY;

    gProjectileData[projectileSlot].animationDurationCounter = 0;
    gProjectileData[projectileSlot].currentAnimationFrame = 0;
    gProjectileData[projectileSlot].pOam = (const struct FrameData*)0x858ea20;

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
            gSpriteData[spriteSlot].paletteRow = 15 - (gSpriteData[spriteSlot].spritesetGfxSlot + gSpriteData[spriteSlot].frozenPaletteRowOffset);
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
            gSpriteData[spriteSlot].paletteRow = 15 - (gSpriteData[spriteSlot].spritesetGfxSlot + gSpriteData[spriteSlot].frozenPaletteRowOffset);
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
            gSpriteData[spriteSlot].paletteRow = 15 - (gSpriteData[spriteSlot].spritesetGfxSlot + gSpriteData[spriteSlot].frozenPaletteRowOffset);
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
