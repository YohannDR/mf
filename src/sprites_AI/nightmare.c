#include "macros.h"
#include "globals.h"

#include "data/frame_data_pointers.h"
#include "data/sprite_data.h"
#include "data/sprites/core_x.h"
#include "data/sprites/nightmare.h"
#include "data/sprites/x_parasite.h"

#include "constants/audio.h"
#include "constants/particle.h"
#include "constants/projectile.h"
#include "constants/samus.h"

#include "structs/projectile.h"
#include "structs/samus.h"

#ifdef NON_MATCHING
void NightmareMoveToPosition(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor) {
    // https://decomp.me/scratch/UyiOq
    u8 flip;
    u16 velocity;

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        // Move to right
        if (gCurrentSprite.work2 == 0)
        {
            if (gSubSpriteData1.xPosition > dstX + PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                gSubSpriteData1.xPosition += (gCurrentSprite.work3 >> speedDivisor);
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
                gSubSpriteData1.xPosition += (gCurrentSprite.work2 >> speedDivisor);
            else
                flip = TRUE;
        }
    }
    else
    {
        // Move to left
        if (gCurrentSprite.work2 == 0)
        {
            if (gSubSpriteData1.xPosition < dstX - PIXEL_SIZE)
                gCurrentSprite.work2 = gCurrentSprite.work3;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work3 < xSpeedCap)
                    gCurrentSprite.work3++;

                // Apply speed
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gSubSpriteData1.xPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gSubSpriteData1.xPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work2 != 0)
            {
                velocity = gCurrentSprite.work2 >> speedDivisor;
                if ((gSubSpriteData1.xPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work2 = 0;
                }
                else
                    gSubSpriteData1.xPosition -= velocity;
            }
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.work3 = 1;
        SoundPlayNotAlreadyPlaying(0x2a6);
    }

    flip = FALSE;
    if (gCurrentSprite.status & SS_FACING_DOWN)
    {
        // Move down
        if (gCurrentSprite.work1 == 0)
        {
            if (gSubSpriteData1.yPosition > dstY - PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                gSubSpriteData1.yPosition += (gCurrentSprite.work4 >> speedDivisor);
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
                gSubSpriteData1.yPosition += (gCurrentSprite.work1 >> speedDivisor);
            else
                flip = TRUE;
        }
    }
    else
    {
        // Move left
        if (gCurrentSprite.work1 == 0)
        {
            if (gSubSpriteData1.yPosition < dstY + PIXEL_SIZE)
                gCurrentSprite.work1 = gCurrentSprite.work4;
            else
            {
                // Increase speed if below cap
                if (gCurrentSprite.work4 < ySpeedCap)
                    gCurrentSprite.work4++;

                // Apply speed
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gSubSpriteData1.yPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gSubSpriteData1.yPosition -= velocity;
            }
        }
        else
        {
            if (--gCurrentSprite.work1 != 0)
            {
                velocity = gCurrentSprite.work1 >> speedDivisor;
                if ((gSubSpriteData1.yPosition - velocity) & 0x8000)
                {
                    flip = TRUE;
                    gCurrentSprite.work1 = 0;
                }
                else
                    gSubSpriteData1.yPosition -= velocity;
            }
            else
                flip = TRUE;
        }
    }

    if (flip)
    {
        gCurrentSprite.status ^= SS_FACING_DOWN;
        gCurrentSprite.work4 = 1;
        SoundPlayNotAlreadyPlaying(0x2a6);
    }
}
#else
NAKED_FUNCTION
void NightmareMoveToPosition(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor) {
    asm(" \n\
    push {r4, r5, r6, r7, lr} \n\
    mov r7, sl \n\
    mov r6, sb \n\
    mov r5, r8 \n\
    push {r5, r6, r7} \n\
    sub sp, #4 \n\
    ldr r4, [sp, #0x24] \n\
    lsl r0, r0, #0x10 \n\
    lsr r0, r0, #0x10 \n\
    mov sl, r0 \n\
    lsl r1, r1, #0x10 \n\
    lsr r5, r1, #0x10 \n\
    add r7, r5, #0 \n\
    lsl r2, r2, #0x18 \n\
    lsr r2, r2, #0x18 \n\
    str r2, [sp] \n\
    lsl r3, r3, #0x18 \n\
    lsr r6, r3, #0x18 \n\
    mov r8, r6 \n\
    lsl r4, r4, #0x18 \n\
    lsr r4, r4, #0x18 \n\
    movs r0, #0 \n\
    mov sb, r0 \n\
    ldr r2, _0805DA60 @ =gCurrentSprite \n\
    ldrh r1, [r2] \n\
    movs r0, #0x80 \n\
    lsl r0, r0, #2 \n\
    and r0, r1 \n\
    lsl r0, r0, #0x10 \n\
    lsr r3, r0, #0x10 \n\
    cmp r3, #0 \n\
    beq _0805DAA0 \n\
    movs r1, #0x2f \n\
    add r1, r1, r2 \n\
    mov ip, r1 \n\
    ldrb r0, [r1] \n\
    cmp r0, #0 \n\
    bne _0805DA82 \n\
    ldr r3, _0805DA64 @ =gSubSpriteData1 \n\
    ldrh r1, [r3, #0xa] \n\
    add r0, r5, #4 \n\
    cmp r1, r0 \n\
    ble _0805DA68 \n\
    add r0, r2, #0 \n\
    add r0, #0x30 \n\
    ldrb r0, [r0] \n\
    mov r2, ip \n\
    strb r0, [r2] \n\
    b _0805DB34 \n\
    .align 2, 0 \n\
_0805DA60: .4byte gCurrentSprite \n\
_0805DA64: .4byte gSubSpriteData1 \n\
_0805DA68: \n\
    add r1, r2, #0 \n\
    add r1, #0x30 \n\
    ldrb r0, [r1] \n\
    cmp r0, r6 \n\
    bhs _0805DA76 \n\
    add r0, #1 \n\
    strb r0, [r1] \n\
_0805DA76: \n\
    ldrb r0, [r1] \n\
    asr r0, r4 \n\
    ldrh r5, [r3, #0xa] \n\
    add r0, r0, r5 \n\
    strh r0, [r3, #0xa] \n\
    b _0805DB34 \n\
_0805DA82: \n\
    sub r0, #1 \n\
    mov r6, ip \n\
    strb r0, [r6] \n\
    lsl r0, r0, #0x18 \n\
    cmp r0, #0 \n\
    beq _0805DB3A \n\
    ldr r1, _0805DA9C @ =gSubSpriteData1 \n\
    ldrb r0, [r6] \n\
    asr r0, r4 \n\
    ldrh r2, [r1, #0xa] \n\
    add r0, r0, r2 \n\
    strh r0, [r1, #0xa] \n\
    b _0805DB34 \n\
    .align 2, 0 \n\
_0805DA9C: .4byte gSubSpriteData1 \n\
_0805DAA0: \n\
    movs r5, #0x2f \n\
    add r5, r5, r2 \n\
    mov ip, r5 \n\
    ldrb r0, [r5] \n\
    add r5, r0, #0 \n\
    cmp r5, #0 \n\
    bne _0805DAFA \n\
    ldr r3, _0805DAC4 @ =gSubSpriteData1 \n\
    ldrh r1, [r3, #0xa] \n\
    sub r0, r7, #4 \n\
    cmp r1, r0 \n\
    bge _0805DAC8 \n\
    add r0, r2, #0 \n\
    add r0, #0x30 \n\
    ldrb r0, [r0] \n\
    mov r6, ip \n\
    strb r0, [r6] \n\
    b _0805DB34 \n\
    .align 2, 0 \n\
_0805DAC4: .4byte gSubSpriteData1 \n\
_0805DAC8: \n\
    add r1, r2, #0 \n\
    add r1, #0x30 \n\
    ldrb r0, [r1] \n\
    cmp r0, r8 \n\
    bhs _0805DAD6 \n\
    add r0, #1 \n\
    strb r0, [r1] \n\
_0805DAD6: \n\
    ldrb r0, [r1] \n\
    asr r0, r4 \n\
    lsl r0, r0, #0x10 \n\
    lsr r1, r0, #0x10 \n\
    ldrh r0, [r3, #0xa] \n\
    sub r1, r0, r1 \n\
    movs r0, #0x80 \n\
    lsl r0, r0, #8 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    beq _0805DAF6 \n\
    movs r0, #1 \n\
    mov sb, r0 \n\
    mov r1, ip \n\
    strb r5, [r1] \n\
    b _0805DB34 \n\
_0805DAF6: \n\
    strh r1, [r3, #0xa] \n\
    b _0805DB34 \n\
_0805DAFA: \n\
    sub r0, #1 \n\
    mov r2, ip \n\
    strb r0, [r2] \n\
    lsl r0, r0, #0x18 \n\
    cmp r0, #0 \n\
    beq _0805DB30 \n\
    ldrb r0, [r2] \n\
    asr r0, r4 \n\
    lsl r0, r0, #0x10 \n\
    lsr r1, r0, #0x10 \n\
    ldr r2, _0805DB28 @ =gSubSpriteData1 \n\
    ldrh r0, [r2, #0xa] \n\
    sub r1, r0, r1 \n\
    movs r0, #0x80 \n\
    lsl r0, r0, #8 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    beq _0805DB2C \n\
    movs r5, #1 \n\
    mov sb, r5 \n\
    mov r6, ip \n\
    strb r3, [r6] \n\
    b _0805DB34 \n\
    .align 2, 0 \n\
_0805DB28: .4byte gSubSpriteData1 \n\
_0805DB2C: \n\
    strh r1, [r2, #0xa] \n\
    b _0805DB34 \n\
_0805DB30: \n\
    movs r0, #1 \n\
    mov sb, r0 \n\
_0805DB34: \n\
    mov r1, sb \n\
    cmp r1, #0 \n\
    beq _0805DB54 \n\
_0805DB3A: \n\
    ldr r2, _0805DB8C @ =gCurrentSprite \n\
    ldrh r0, [r2] \n\
    movs r3, #0x80 \n\
    lsl r3, r3, #2 \n\
    add r1, r3, #0 \n\
    eor r0, r1 \n\
    strh r0, [r2] \n\
    add r2, #0x30 \n\
    movs r0, #1 \n\
    strb r0, [r2] \n\
    ldr r0, _0805DB90 @ =0x000002A6 \n\
    bl SoundPlayNotAlreadyPlaying \n\
_0805DB54: \n\
    movs r5, #0 \n\
    mov sb, r5 \n\
    ldr r2, _0805DB8C @ =gCurrentSprite \n\
    ldrh r1, [r2] \n\
    movs r0, #0x80 \n\
    lsl r0, r0, #3 \n\
    and r0, r1 \n\
    lsl r0, r0, #0x10 \n\
    lsr r6, r0, #0x10 \n\
    cmp r6, #0 \n\
    beq _0805DBD4 \n\
    movs r6, #0x2e \n\
    add r6, r6, r2 \n\
    mov ip, r6 \n\
    ldrb r0, [r6] \n\
    cmp r0, #0 \n\
    bne _0805DBB4 \n\
    ldr r3, _0805DB94 @ =gSubSpriteData1 \n\
    ldrh r1, [r3, #8] \n\
    mov r0, sl \n\
    sub r0, #4 \n\
    cmp r1, r0 \n\
    ble _0805DB98 \n\
    add r0, r2, #0 \n\
    add r0, #0x31 \n\
    ldrb r0, [r0] \n\
    strb r0, [r6] \n\
    b _0805DC6C \n\
    .align 2, 0 \n\
_0805DB8C: .4byte gCurrentSprite \n\
_0805DB90: .4byte 0x000002A6 \n\
_0805DB94: .4byte gSubSpriteData1 \n\
_0805DB98: \n\
    add r1, r2, #0 \n\
    add r1, #0x31 \n\
    ldrb r0, [r1] \n\
    ldr r5, [sp] \n\
    cmp r0, r5 \n\
    bhs _0805DBA8 \n\
    add r0, #1 \n\
    strb r0, [r1] \n\
_0805DBA8: \n\
    ldrb r0, [r1] \n\
    asr r0, r4 \n\
    ldrh r6, [r3, #8] \n\
    add r0, r0, r6 \n\
    strh r0, [r3, #8] \n\
    b _0805DC6C \n\
_0805DBB4: \n\
    sub r0, #1 \n\
    mov r1, ip \n\
    strb r0, [r1] \n\
    lsl r0, r0, #0x18 \n\
    cmp r0, #0 \n\
    beq _0805DC72 \n\
    ldr r1, _0805DBD0 @ =gSubSpriteData1 \n\
    mov r3, ip \n\
    ldrb r0, [r3] \n\
    asr r0, r4 \n\
    ldrh r5, [r1, #8] \n\
    add r0, r0, r5 \n\
    strh r0, [r1, #8] \n\
    b _0805DC6C \n\
    .align 2, 0 \n\
_0805DBD0: .4byte gSubSpriteData1 \n\
_0805DBD4: \n\
    movs r0, #0x2e \n\
    add r0, r0, r2 \n\
    mov ip, r0 \n\
    ldrb r0, [r0] \n\
    add r5, r0, #0 \n\
    cmp r5, #0 \n\
    bne _0805DC30 \n\
    ldr r3, _0805DBFC @ =gSubSpriteData1 \n\
    ldrh r1, [r3, #8] \n\
    mov r0, sl \n\
    add r0, #4 \n\
    cmp r1, r0 \n\
    bge _0805DC00 \n\
    add r0, r2, #0 \n\
    add r0, #0x31 \n\
    ldrb r0, [r0] \n\
    mov r1, ip \n\
    strb r0, [r1] \n\
    b _0805DC6C \n\
    .align 2, 0 \n\
_0805DBFC: .4byte gSubSpriteData1 \n\
_0805DC00: \n\
    add r1, r2, #0 \n\
    add r1, #0x31 \n\
    ldrb r0, [r1] \n\
    ldr r6, [sp] \n\
    cmp r0, r6 \n\
    bhs _0805DC10 \n\
    add r0, #1 \n\
    strb r0, [r1] \n\
_0805DC10: \n\
    ldrb r0, [r1] \n\
    asr r0, r4 \n\
    lsl r0, r0, #0x10 \n\
    lsr r1, r0, #0x10 \n\
    ldrh r0, [r3, #8] \n\
    sub r1, r0, r1 \n\
    movs r0, #0x80 \n\
    lsl r0, r0, #8 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    beq _0805DC64 \n\
    movs r0, #1 \n\
    mov sb, r0 \n\
    mov r1, ip \n\
    strb r5, [r1] \n\
    b _0805DC6C \n\
_0805DC30: \n\
    sub r0, #1 \n\
    mov r3, ip \n\
    strb r0, [r3] \n\
    lsl r0, r0, #0x18 \n\
    cmp r0, #0 \n\
    beq _0805DC68 \n\
    ldrb r0, [r3] \n\
    asr r0, r4 \n\
    lsl r0, r0, #0x10 \n\
    lsr r1, r0, #0x10 \n\
    ldr r3, _0805DC60 @ =gSubSpriteData1 \n\
    ldrh r0, [r3, #8] \n\
    sub r1, r0, r1 \n\
    movs r0, #0x80 \n\
    lsl r0, r0, #8 \n\
    and r0, r1 \n\
    cmp r0, #0 \n\
    beq _0805DC64 \n\
    movs r5, #1 \n\
    mov sb, r5 \n\
    mov r0, ip \n\
    strb r6, [r0] \n\
    b _0805DC6C \n\
    .align 2, 0 \n\
_0805DC60: .4byte gSubSpriteData1 \n\
_0805DC64: \n\
    strh r1, [r3, #8] \n\
    b _0805DC6C \n\
_0805DC68: \n\
    movs r1, #1 \n\
    mov sb, r1 \n\
_0805DC6C: \n\
    mov r3, sb \n\
    cmp r3, #0 \n\
    beq _0805DC8C \n\
_0805DC72: \n\
    ldrh r0, [r2] \n\
    movs r5, #0x80 \n\
    lsl r5, r5, #3 \n\
    add r1, r5, #0 \n\
    eor r0, r1 \n\
    strh r0, [r2] \n\
    add r1, r2, #0 \n\
    add r1, #0x31 \n\
    movs r0, #1 \n\
    strb r0, [r1] \n\
    ldr r0, _0805DC9C @ =0x000002A6 \n\
    bl SoundPlayNotAlreadyPlaying \n\
_0805DC8C: \n\
    add sp, #4 \n\
    pop {r3, r4, r5} \n\
    mov r8, r3 \n\
    mov sb, r4 \n\
    mov sl, r5 \n\
    pop {r4, r5, r6, r7} \n\
    pop {r0} \n\
    bx r0 \n\
    .align 2, 0 \n\
_0805DC9C: .4byte 0x000002A6 \n\
    ");
}
#endif

void NightmareSyncSubSprites(void) {
    MultiSpriteDataInfo_T pData;
    u16 oamIdx;

    pData = gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].pData;

    oamIdx = pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX];
    
    if (gCurrentSprite.pOam != sNightmareFrameDataPointers[oamIdx])
    {
        gCurrentSprite.pOam = sNightmareFrameDataPointers[oamIdx];
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }

    gCurrentSprite.yPosition = gSubSpriteData1.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];
    gCurrentSprite.xPosition = gSubSpriteData1.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
}

void NightmarePlaySound(void) {
    if (gCurrentSprite.samusCollision != SSC_NONE && gSubSpriteData1.currentAnimationFrame == 0 && gSubSpriteData1.animationDurationCounter == 12) {
        SoundPlay(0x2a1);
    }
}

void NightmareMakeMissilesFall(void) {
    u8 i;
    u8 typeToCheck = PROJ_TYPE_ICE_MISSILE;
    u16 fallingSpeed;

    for (i = 0; i < MAX_AMOUNT_OF_PROJECTILES; i++) {
        if (!(gProjectileData[i].status & PROJ_STATUS_EXISTS))
            continue;
        if (!(gProjectileData[i].status & PROJ_STATUS_CAN_AFFECT_ENVIRONMENT))
            continue;
        if (gProjectileData[i].type != typeToCheck)
            continue;

        if ((gProjectileData[i].part & 3) == 0)
            gProjectileData[i].part++;
        if (gProjectileData[i].part < 0x2a)
            fallingSpeed = gProjectileData[i].part;
        else
            fallingSpeed = 0x2a;
        gProjectileData[i].yPosition += fallingSpeed;
    }
}

void NightmareReduceSamusXVelocity(void) {
    if (gEquipment.currentEnergy != 0) {
        if (gSamusData.xVelocity > 4)
            gSamusData.xVelocity -= 2;
        else if (gSamusData.xVelocity < -4)
            gSamusData.xVelocity += 2;
    }
}

void NightmareInit(void) {
    if (gEquipment.suitMiscStatus & SMF_GRAVITY_SUIT)
        gCurrentSprite.status = 0;
    else {
        u32 y, x;
        u8 primaryRamSlot, eyeRamSlot, mouthRamSlot;

        gCurrentSprite.yPosition += 0x2c0;
        gCurrentSprite.xPosition += 0x40;
        gSubSpriteData1.yPosition = gCurrentSprite.yPosition;
        gSubSpriteData1.xPosition = gCurrentSprite.xPosition;
        gCurrentSprite.roomSlot = NIGHTMARE_PART_BODY;
        gCurrentSprite.drawOrder = 12;
        gCurrentSprite.drawDistanceTop = 0x50;
        gCurrentSprite.drawDistanceBottom = 8;
        gCurrentSprite.drawDistanceHorizontal = 0x40;
        gCurrentSprite.hitboxTop = -0x100;
        gCurrentSprite.hitboxBottom = -0x20;
        gCurrentSprite.hitboxLeft = -0xa0;
        gCurrentSprite.hitboxRight = 0xc0;
        gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
        gSubSpriteData1.pMultiOam = sMultiSpriteData_3b83bc;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.work0 = 0;
        gCurrentSprite.pose = 0x37;
        gCurrentSprite.work1 = 180;
        gBossWork3 = 180;
        y = gSubSpriteData1.yPosition;
        x = gSubSpriteData1.xPosition;
        primaryRamSlot = gCurrentSprite.primarySpriteRamSlot;
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_CHIN_SLUDGE, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_EYE_SLUDGE, 0, primaryRamSlot, y, x, 0);
        eyeRamSlot = SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_EYE, 0, primaryRamSlot, y, x, 0);
        mouthRamSlot = SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_MOUTH, 0, primaryRamSlot, y, x, 0);
        gSpriteData[eyeRamSlot].work5 = mouthRamSlot;
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_RIGHT_ARM_TOP, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_RIGHT_TURRET_1, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_RIGHT_TURRET_2, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_RIGHT_TURRET_3, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_RIGHT_ARM_BOTTOM, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_GENERATOR, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_LEFT_TURRET_1, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_LEFT_TURRET_2, 0, primaryRamSlot, y, x, 0);
        SpriteSpawnSecondary(SSPRITE_80, NIGHTMARE_PART_LEFT_TURRET_3, 0, primaryRamSlot, y, x, 0);
    }
}

void NightmareWaitingToAppear(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 0x38;
        ScreenShakeStartHorizontal(60, 0x81);
        ScreenShakeStartVertical(60, 0x81);
        gCurrentSprite.work1 = 60;
        unk_3b1c(0x2a0);
    }
}

void NightmareAppearing(void) {
    gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.work1 == 0) {
        ScreenShakeStartHorizontal(60, 0x81);
        ScreenShakeStartVertical(60, 0x81);
        gCurrentSprite.work1 = 60;
        unk_3b1c(0x2a0);
    }
    if (gSubSpriteData1.yPosition > 0x400)
        gSubSpriteData1.yPosition -= 1;
    else
        gCurrentSprite.pose = 0x39;
}

void NightmarePhase1Init(void) {
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.status &= ~(SS_IGNORE_PROJECTILES | SS_NOT_DRAWN);
    gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;
    gCurrentSprite.pose = 0x3a;
    PlayMusic(MUSIC_NIGHTMARE_BATTLE, 7);
}

void NightmarePhase1(void) {
    NightmareMoveToPosition(gSamusData.yPosition - 0x100, gAbilityRestingXPosition + 0xc0, 0x28, 8, 2);
}

void NightmarePhase2ResettingPosition(void) {
    u8 reachedDst = 0;
    u16 dstY = gAbilityRestingYPosition - 0x80;
    u16 dstX = gAbilityRestingXPosition + 0x100;
    if (gSubSpriteData1.xPosition < dstX)
        gCurrentSprite.status |= SS_FACING_RIGHT;
    else
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    if (gSubSpriteData1.yPosition < dstY)
        gCurrentSprite.status |= SS_FACING_DOWN;
    else
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    if (gSubSpriteData1.yPosition < dstY + 6 && gSubSpriteData1.yPosition > dstY - 6)
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_DOWN)
        gSubSpriteData1.yPosition += 1;
    else
        gSubSpriteData1.yPosition -= 1;
    if (gSubSpriteData1.xPosition < dstX + 6 && gSubSpriteData1.xPosition > dstX - 6)
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_RIGHT)
        gSubSpriteData1.xPosition += 1;
    else
        gSubSpriteData1.xPosition -= 1;
    if (reachedDst == 2) {
        gCurrentSprite.pose = 1;
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    }
}

void NightmarePhase2MovementInit(void) {
    gCurrentSprite.pose = 2;
    gCurrentSprite.xParasiteTimer = 0;
    gCurrentSprite.work4 = 0;
}

void NightmarePhase2Movement(void) {
    u16 movement = sNightmarePhase2XSpeed[gCurrentSprite.xParasiteTimer >> 5];
    if (gCurrentSprite.xParasiteTimer < (ARRAY_SIZE(sNightmarePhase2XSpeed) << 5) - 1)
        gCurrentSprite.xParasiteTimer++;
    else {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.xParasiteTimer = 0;
    }
    if (gCurrentSprite.status & SS_FACING_RIGHT)
        gSubSpriteData1.xPosition += movement;
    else
        gSubSpriteData1.xPosition -= movement;

    movement = sNightmarePhase2YSpeed[gCurrentSprite.work4 >> 3];
    if (gCurrentSprite.work4 < (ARRAY_SIZE(sNightmarePhase2YSpeed) << 3) - 1)
        gCurrentSprite.work4++;
    else
        gCurrentSprite.work4 = 0;
    gSubSpriteData1.yPosition += movement;
}

void NightmareMovingToPhase3Init(void) {
    gCurrentSprite.pose = 0x18;
}

void NightmareMovingToPhase3(void) {
    u8 reachedDst = 0;
    u16 dstY = gAbilityRestingYPosition;
    u16 dstX = gAbilityRestingXPosition + 0xc0;
    if (gSubSpriteData1.xPosition < dstX)
        gCurrentSprite.status |= SS_FACING_RIGHT;
    else
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    if (gSubSpriteData1.yPosition < dstY)
        gCurrentSprite.status |= SS_FACING_DOWN;
    else
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    if (gSubSpriteData1.yPosition < dstY + 6 && gSubSpriteData1.yPosition > dstY - 6)
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_DOWN)
        gSubSpriteData1.yPosition += 1;
    else
        gSubSpriteData1.yPosition -= 1;
    if (gSubSpriteData1.xPosition < dstX + 6 && gSubSpriteData1.xPosition > dstX - 6)
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_RIGHT)
        gSubSpriteData1.xPosition += 1;
    else
        gSubSpriteData1.xPosition -= 1;
    if (reachedDst == 2) {
        gCurrentSprite.pose = 0x19;
    }
}

void NightmareReachedPhase3Position() {}

void NightmarePhase3SlowMovementInit(void) {}

void NightmarePhase3SlowMovement(void) {
    u8 switchToFastMovement = 0;
    if (gSubSpriteData1.yPosition < gSamusData.yPosition - 0x80)
        gSubSpriteData1.yPosition += 1;
    else
        switchToFastMovement++;
    // Check if Nightmare is near the wall
    SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition - 0xc0);
    if (gPreviousCollisionCheck != 0) {
        switchToFastMovement++;
    } else {
        gSubSpriteData1.xPosition -= 1;
    }
    if (switchToFastMovement == 2)
        gCurrentSprite.pose = 0x1b;
}

void NightmarePhase3FastMovementInit(void) {
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 1;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 1;
    gCurrentSprite.pose = 0x1c;
    gCurrentSprite.xParasiteTimer = 5 * 60;
}

void NightmarePhase3FastMovement(void) {
    u16 dstX;
    u16 dstY;
    if (gCurrentSprite.xParasiteTimer > 4 * 60) {
        dstY = gXParasiteTargetYPosition;
        dstX = gXParasiteTargetXPosition;
    } else {
        dstY = gSamusData.yPosition - 0x80;
        dstX = gSamusData.xPosition;
    }
    NightmareMoveToPosition(dstY, dstX, 0x30, 0x30, 2);
    if (gCurrentSprite.xParasiteTimer > 0) {
        gCurrentSprite.xParasiteTimer--;
    } else {
        u16 posOnScreen = SUB_PIXEL_TO_PIXEL_(gSubSpriteData1.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition);
        if (posOnScreen > 0x8c && posOnScreen < SCREEN_SIZE_X - 0x18) {
            posOnScreen = SUB_PIXEL_TO_PIXEL_(gSubSpriteData1.yPosition) - SUB_PIXEL_TO_PIXEL_(gBg1YPosition);
            if (posOnScreen > 0x14 && posOnScreen < SCREEN_SIZE_Y - 0x3c)
                if (gSamusData.xPosition < gSubSpriteData1.xPosition - 0x40)
                    gCurrentSprite.pose = 0x1e;
        }
    }
}

void NightmareDeathFlash(void) {
    u8 work2 = gCurrentSprite.work2++;
    if ((work2 & 3) == 0) {
        if ((work2 & 4) != 0)
            gCurrentSprite.paletteRow = 13 - (gCurrentSprite.spritesetGfxSlot + gCurrentSprite.frozenPaletteRowOffset);
        else
            gCurrentSprite.paletteRow = 0;
    }
}

void NightmareMovingToDeathPosition(void) {
    u8 reachedDst;
    u16 dstY, dstX;
    NightmareDeathFlash();
    reachedDst = 0;
    dstY = gAbilityRestingYPosition;
    dstX = gAbilityRestingXPosition + 0xc0;
    if (gSubSpriteData1.xPosition < dstX)
        gCurrentSprite.status |= SS_FACING_RIGHT;
    else
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    if (gSubSpriteData1.yPosition < dstY)
        gCurrentSprite.status |= SS_FACING_DOWN;
    else
        gCurrentSprite.status &= ~SS_FACING_DOWN;
    if (gSubSpriteData1.yPosition < dstY + 6 && gSubSpriteData1.yPosition > dstY - 6)
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_DOWN)
        gSubSpriteData1.yPosition += 1;
    else
        gSubSpriteData1.yPosition -= 1;
    if (gSubSpriteData1.xPosition < dstX + 6 && gSubSpriteData1.xPosition > dstX - 6)
        reachedDst++;
    else if (gCurrentSprite.status & SS_FACING_RIGHT)
        gSubSpriteData1.xPosition += 1;
    else
        gSubSpriteData1.xPosition -= 1;
    if (reachedDst == 2) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = 0x22;
            gCurrentSprite.work1 = 60;
            unk_3b1c(0x2a4);
        }
    }
}

void NightmareTurningIntoCoreX(void) {
    if (gCurrentSprite.work1 > 0) {
        NightmareDeathFlash();
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.status |= SS_ENABLE_MOSAIC;
            gCurrentSprite.invincibilityStunFlashTimer = 0;
            gCurrentSprite.paletteRow = 0;
            gCurrentSprite.xParasiteTimer = 44;
        }
    } else {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
        if (--gCurrentSprite.xParasiteTimer == 0) {
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
            gCurrentSprite.spriteId = PSPRITE_GRAVITY_SUIT_ABILITY;
        }
        if (gCurrentSprite.xParasiteTimer < ARRAY_SIZE(sGravityCoreXGfx) / 512 * 4)
            SpriteLoadGfx(PSPRITE_GRAVITY_SUIT_ABILITY, 0, gCurrentSprite.xParasiteTimer);
        else if (gCurrentSprite.xParasiteTimer == ARRAY_SIZE(sGravityCoreXGfx) / 512 * 4)
            SpriteLoadPal(PSPRITE_GRAVITY_SUIT_ABILITY, 0, ARRAY_SIZE(sGravityCoreXPal) / 16);
    }
}
