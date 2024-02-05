#include "sprites_AI/zazabi.h"
#include "macros.h"
#include "globals.h"

#include "constants/samus.h"
#include "constants/sprite.h"
#include "constants/projectile.h"

#include "structs/samus.h"
#include "structs/sprite.h"
#include "structs/projectile.h"

void ZazabiSyncSubSprites(void)
{

}

void ZazabiProjectilesCollision(void)
{

}

/**
 * @brief 45520 | 80 | Makes it so projectiles can hurt zazabi
 * 
 */
void ZazabiEnableProjectilesToPassThrough(void)
{
    u16 spriteY;
    u16 spriteX;
    u8 i;

    spriteY = gCurrentSprite.yPosition;
    spriteX = gCurrentSprite.xPosition;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++)
    {
        if (!(gProjectileData[i].status & PROJ_STATUS_EXISTS))
            continue;

        if (gProjectileData[i].movementStage <= 1)
            continue;

        if (gProjectileData[i].direction != ACD_UP)
            continue;

        if (gProjectileData[i].xPosition <= spriteX - (HALF_BLOCK_SIZE + PIXEL_SIZE))
            continue;

        if (gProjectileData[i].xPosition >= spriteX + (HALF_BLOCK_SIZE + PIXEL_SIZE))
            continue;

        if (gProjectileData[i].yPosition > spriteY + HALF_BLOCK_SIZE)
        {
            if (gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT)
                gProjectileData[i].status &= ~PROJ_STATUS_CAN_AFFECT_ENVIRONMENT;
        }
        else if (gProjectileData[i].yPosition < spriteY)
        {
            if (!(gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT))
                gProjectileData[i].status |= PROJ_STATUS_UNKNOWN_80;
        }
    }
}

/**
 * @brief 455a0 | 4 | Empty function
 * 
 */
void Zazabi_Empty(void)
{
    return;
}

u8 ZazabiXMovement(u16 movement)
{

}

void ZazabiSpawningFromX(void)
{

}

void ZazabiInit(void)
{

}

void ZazabiIdleInit(void)
{

}

void ZazabiIdle(void)
{

}

void ZazabiCrawlingInit(void)
{

}

void ZazabiCrawling(void)
{

}

void ZazabiJumpWarningInit(void)
{

}

void ZazabiJumpWarning(void)
{

}

void ZazabiJumpingInit(void)
{

}

void ZazabiJumping(void)
{

}

void ZazabiFallingInit(void)
{

}

void ZazabiFalling(void)
{

}

void ZazabiLandingMouthOpenInit(void)
{

}

void ZazabiLandingMouthOpen(void)
{

}

void ZazabiLandingInit(void)
{

}

void ZazabiLanding(void)
{

}

void ZazabiEatingSamus1Init(void)
{

}

void ZazabiEatingSamus1(void)
{

}

void ZazabiEatingSamus2Init(void)
{

}

void ZazabiEatingSamus2(void)
{

}

void ZazabiEatingSamus3Init(void)
{

}

void ZazabiEatingSamus3(void)
{

}

void ZazabiEatingSamus4Init(void)
{

}

void ZazabiEatingSamus4(void)
{

}

void ZazabiEatingSamus5Init(void)
{

}

void ZazabiEatingSamus5(void)
{

}

void ZazabiSpittingSamusInit(void)
{

}

void ZazabiSpittingSamus(void)
{

}

void ZazabiLandingAfterSpittingInit(void)
{

}

void ZazabiLandingAfterSpitting(void)
{

}

void ZazabiDyingInit(void)
{

}

void ZazabiDying(void)
{

}

void ZazabiPartInit(void)
{

}

void ZazabiPartDefault(void)
{

}

void ZazabiPartMouth(void)
{

}

void ZazabiPartEye(void)
{

}

void Zazabi(void)
{

}

void ZazabiPart(void)
{

}
