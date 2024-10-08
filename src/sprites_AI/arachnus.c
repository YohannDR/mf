#include "macros.h"
#include "globals.h"

#include "data/sprites/arachnus.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/particle.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/sprite.h"
#include "structs/samus.h"

void ArachnusSetStandingHitbox(void) {
    gCurrentSprite.hitboxTop = -0x80;
    gCurrentSprite.hitboxBottom = 0;
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x20;
        gCurrentSprite.hitboxRight = 0x80;
    } else {
        gCurrentSprite.hitboxLeft = -0x80;
        gCurrentSprite.hitboxRight = 0x20;
    }
}

void ArachnusShootingFireInit(void) {
    gCurrentSprite.pose = 0x40;
    gCurrentSprite.pOam = sFrameData_302a44;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
    gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_COLLIDING;
    SetSecondarySpriteOAMPointer(sFrameData_302a74);
}

void ArachnusScreamingInit(void) {
    gCurrentSprite.pose = 0x3e;
    gCurrentSprite.pOam = sFrameData_302d54;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.hitboxTop = -0xe0;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x48;
    gCurrentSprite.hitboxRight = 0x48;
    SetSecondarySpriteOAMPointer(sFrameData_302d8c);
    SoundPlay(0xbb);
}

void ArachnusDyingInit(void) {
    gCurrentSprite.pose = 0x42;
    if (gCurrentSprite.pOam != sFrameData_302d54) {
        gCurrentSprite.pOam = sFrameData_302d54;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.hitboxTop = -0xe0;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -0x48;
        gCurrentSprite.hitboxRight = 0x48;
        SetSecondarySpriteOAMPointer(sFrameData_302d8c);
    }
    gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
    gCurrentSprite.status |= SPRITE_STATUS_ENABLE_MOSAIC;
    gCurrentSprite.samusCollision = 0;
    gCurrentSprite.health = 1;
    gCurrentSprite.invincibilityStunFlashTimer = 0;
    gCurrentSprite.paletteRow = 0;
    gCurrentSprite.xParasiteTimer = 0x2c;
    gCurrentSprite.unk_8 = 1;
    SoundPlay(0xbe);
}

void ArachnusRollingInit(void) {
    u32 shellSpriteSlot;

    gCurrentSprite.pose = 0x3a;
    gCurrentSprite.status |= SPRITE_STATUS_UNKNOWN_2000;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED) {
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_COLLIDING;
    }
    SetSecondarySpriteOAMPointer(sFrameData_302c94);
    shellSpriteSlot = gCurrentSprite.work2;
    gSpriteData[shellSpriteSlot].hitboxTop = -0x60;
    gSpriteData[shellSpriteSlot].hitboxBottom = 0;
    gSpriteData[shellSpriteSlot].hitboxLeft = -0x40;
    gSpriteData[shellSpriteSlot].hitboxRight = 0x40;
    SoundPlay(0xb4);
}

void ArachnusSlashingInit(void) {
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.pOam = sFrameData_302aa4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
    SetSecondarySpriteOAMPointer(sFrameData_302b74);
    SoundPlay(0xba);
}

void ArachnusSlashing(void) {
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
        if (gCurrentSprite.currentAnimationFrame < 16) {
            gCurrentSprite.hitboxRight = 0xa0;
        } else if (gCurrentSprite.currentAnimationFrame < 18) {
            gCurrentSprite.hitboxRight = 0x60;
        } else if (gCurrentSprite.currentAnimationFrame < 24) {
            gCurrentSprite.hitboxRight = 0xc0;
            if (gCurrentSprite.currentAnimationFrame == 18 && gCurrentSprite.animationDurationCounter == 3) {
                SpriteSpawnSecondary(SSPRITE_ARACHNUS_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x10, gCurrentSprite.xPosition + 0x8c, SPRITE_STATUS_X_FLIP);
                SoundPlay(0xb9);
            }
        } else {
            gCurrentSprite.hitboxRight = 0x80;
        }
    } else {
        if (gCurrentSprite.currentAnimationFrame < 16) {
            gCurrentSprite.hitboxLeft = -0xa0;
        } else if (gCurrentSprite.currentAnimationFrame < 18) {
            gCurrentSprite.hitboxLeft = -0x60;
        } else if (gCurrentSprite.currentAnimationFrame < 24) {
            gCurrentSprite.hitboxLeft = -0xc0;
            if (gCurrentSprite.currentAnimationFrame == 18 && gCurrentSprite.animationDurationCounter == 3) {
                SpriteSpawnSecondary(SSPRITE_ARACHNUS_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x10, gCurrentSprite.xPosition - 0x8c, 0);
                SoundPlay(0xb9);
            }
        } else {
            gCurrentSprite.hitboxLeft = -0x80;
        }
    }
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 1;
        gCurrentSprite.work1 = 120;
    }
}

// non-matching (https://decomp.me/scratch/JYp6j)
#ifdef NON_MATCHING
void ArachnusRolling(void) {
    u32 shellSpriteSlot;
    s16 speed;
    u32 rotationDelta;
    u32 hitWall;
    u32 xPosition;
    u32 yPosition;

    shellSpriteSlot = gCurrentSprite.work2;
    if (gSpriteData[shellSpriteSlot].pOam == sFrameData_302c94) {
        if (SpriteUtilCheckEndSpriteAnim(shellSpriteSlot)) {
            SetSecondarySpriteOAMPointer(sFrameData_302dc4);
            gSpriteData[shellSpriteSlot].status |= 0x80;
            gSpriteData[shellSpriteSlot].rotation = 0;
            gSpriteData[shellSpriteSlot].scaling = 0x100;
        }
    } else {
        speed = sArachnusRollingSpeed[gCurrentSprite.work3 >> 2];
        if (gCurrentSprite.work3 < 0x2f) {
            gCurrentSprite.work3++;
        }
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gSpriteData[shellSpriteSlot].yPosition - 0x48, gSpriteData[shellSpriteSlot].xPosition + gSpriteData[shellSpriteSlot].hitboxRight);
            if ((gPreviousCollisionCheck & 0xf) == 0) {
                gCurrentSprite.xPosition += speed;
                xPosition = gCurrentSprite.xPosition;
                yPosition = gCurrentSprite.yPosition;
                gSpriteData[shellSpriteSlot].xPosition += speed;
                rotationDelta = gCurrentSprite.work3 / 2;
                if (rotationDelta > 0x10) {
                    rotationDelta = 0x10;
                }
                gSpriteData[shellSpriteSlot].rotation += rotationDelta;
                if (gSpriteRandomNumber > 12) {
                    if ((gSpriteRandomNumber & 1) != 0) {
                        SpriteDebrisInit(0, 4, yPosition - 0x10, xPosition + (gFrameCounter8Bit & 0x1f));
                    } else {
                        SpriteDebrisInit(0, 0x11, yPosition, xPosition + (gFrameCounter8Bit & 0x1f));
                    }
                }
                hitWall = FALSE;
            } else {
                hitWall = TRUE;
            }
        } else {
            SpriteUtilCheckCollisionAtPosition(gSpriteData[shellSpriteSlot].yPosition - 0x48, gSpriteData[shellSpriteSlot].xPosition + gSpriteData[shellSpriteSlot].hitboxLeft);
            if ((gPreviousCollisionCheck & 0xf) == 0) {
                gCurrentSprite.xPosition -= speed;
                xPosition = gCurrentSprite.xPosition;
                yPosition = gCurrentSprite.yPosition;
                gSpriteData[shellSpriteSlot].xPosition -= speed;
                rotationDelta = gCurrentSprite.work3 / 2;
                if (rotationDelta > 0x10) {
                    rotationDelta = 0x10;
                }
                gSpriteData[shellSpriteSlot].rotation -= rotationDelta;
                if (gSpriteRandomNumber > 12) {
                    if ((gSpriteRandomNumber & 1) != 0) {
                        SpriteDebrisInit(0, 0x13, yPosition - 0x10, xPosition - (gFrameCounter8Bit & 0x1f));
                    } else {
                        SpriteDebrisInit(0, 0x12, yPosition, xPosition - (gFrameCounter8Bit & 0x1f));
                    }
                }
                hitWall = FALSE;
            } else {
                hitWall = TRUE;
            }
        }
        if (hitWall) {
            gCurrentSprite.pose = 0x3c;
            gCurrentSprite.work4 = 0;
            ScreenShakeStartHorizontal(0x28, 0x81);
            SoundPlay(0xb7);
        } else if ((gFrameCounter8Bit & 0xf) == 0) {
            SoundPlay(0xb6);
        }
    }
}
#else
NAKED_FUNCTION
void ArachnusRolling(void) {
    asm(" \n\
    push {r4, r5, r6, r7, lr} \n\
	mov r7, r8 \n\
	push {r7} \n\
	ldr r5, _08023B70 @ =gCurrentSprite \n\
	add r0, r5, #0 \n\
	add r0, #0x2f \n\
	ldrb r2, [r0] \n\
	ldr r7, _08023B74 @ =gSpriteData \n\
	lsl r0, r2, #3 \n\
	sub r0, r0, r2 \n\
	lsl r6, r0, #3 \n\
	add r0, r7, #0 \n\
	add r0, #0x18 \n\
	add r0, r6, r0 \n\
	ldr r1, [r0] \n\
	ldr r0, _08023B78 @ =sFrameData_302c94 \n\
	cmp r1, r0 \n\
	bne _08023B80 \n\
	add r0, r2, #0 \n\
	bl SpriteUtilCheckEndSpriteAnim \n\
	cmp r0, #0 \n\
	bne _08023B50 \n\
	b _08023D0A \n\
_08023B50: \n\
	ldr r0, _08023B7C @ =sFrameData_302dc4 \n\
	bl SetSecondarySpriteOAMPointer \n\
	add r1, r6, r7 \n\
	ldrh r2, [r1] \n\
	movs r0, #0x80 \n\
	movs r3, #0 \n\
	orr r0, r2 \n\
	strh r0, [r1] \n\
	add r0, r1, #0 \n\
	add r0, #0x2b \n\
	strb r3, [r0] \n\
	movs r0, #0x80 \n\
	lsl r0, r0, #1 \n\
	strh r0, [r1, #0x12] \n\
	b _08023D0A \n\
	.align 2, 0 \n\
_08023B70: .4byte gCurrentSprite \n\
_08023B74: .4byte gSpriteData \n\
_08023B78: .4byte sFrameData_302c94 \n\
_08023B7C: .4byte sFrameData_302dc4 \n\
_08023B80: \n\
	ldr r0, _08023C18 @ =sArachnusRollingSpeed \n\
	movs r1, #0x30 \n\
	add r1, r1, r5 \n\
	mov r8, r1 \n\
	ldrb r3, [r1] \n\
	lsl r1, r3, #0x18 \n\
	lsr r2, r1, #0x18 \n\
	lsr r1, r1, #0x1a \n\
	lsl r1, r1, #1 \n\
	add r1, r1, r0 \n\
	ldrh r4, [r1] \n\
	cmp r2, #0x2e \n\
	bhi _08023BA0 \n\
	add r0, r3, #1 \n\
	mov r2, r8 \n\
	strb r0, [r2] \n\
_08023BA0: \n\
	ldrh r1, [r5] \n\
	movs r0, #0x40 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	beq _08023C40 \n\
	add r6, r6, r7 \n\
	ldrh r0, [r6, #2] \n\
	sub r0, #0x48 \n\
	movs r2, #0x10 \n\
	ldrsh r1, [r6, r2] \n\
	ldrh r2, [r6, #4] \n\
	add r1, r1, r2 \n\
	bl SpriteUtilCheckCollisionAtPosition \n\
	ldr r0, _08023C1C @ =gPreviousCollisionCheck \n\
	ldrb r1, [r0] \n\
	movs r0, #0xf \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	beq _08023BCA \n\
	b _08023CD0 \n\
_08023BCA: \n\
	ldrh r0, [r5, #4] \n\
	add r0, r4, r0 \n\
	strh r0, [r5, #4] \n\
	ldrh r7, [r5, #4] \n\
	ldrh r2, [r5, #2] \n\
	ldrh r0, [r6, #4] \n\
	add r0, r4, r0 \n\
	strh r0, [r6, #4] \n\
	mov r1, r8 \n\
	ldrb r0, [r1] \n\
	lsr r4, r0, #1 \n\
	cmp r4, #0x10 \n\
	bls _08023BE6 \n\
	movs r4, #0x10 \n\
_08023BE6: \n\
	add r0, r6, #0 \n\
	add r0, #0x2b \n\
	ldrb r1, [r0] \n\
	add r1, r1, r4 \n\
	strb r1, [r0] \n\
	ldr r0, _08023C20 @ =gFrameCounter8Bit \n\
	ldrb r1, [r0] \n\
	cmp r1, #0xc \n\
	bls _08023CCA \n\
	movs r0, #1 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	beq _08023C28 \n\
	sub r2, #0x10 \n\
	ldr r0, _08023C24 @ =gFrameCounter8Bit \n\
	ldrb r0, [r0] \n\
	movs r3, #0x1f \n\
	and r3, r0 \n\
	add r3, r7, r3 \n\
	movs r0, #0 \n\
	movs r1, #4 \n\
	bl SpriteDebrisInit \n\
	b _08023CCA \n\
	.align 2, 0 \n\
_08023C18: .4byte sArachnusRollingSpeed \n\
_08023C1C: .4byte gPreviousCollisionCheck \n\
_08023C20: .4byte gSpriteRandomNumber \n\
_08023C24: .4byte gFrameCounter8Bit \n\
_08023C28: \n\
	ldr r0, _08023C3C @ =gFrameCounter8Bit \n\
	ldrb r0, [r0] \n\
	movs r3, #0x1f \n\
	and r3, r0 \n\
	add r3, r7, r3 \n\
	movs r0, #0 \n\
	movs r1, #0x11 \n\
	bl SpriteDebrisInit \n\
	b _08023CCA \n\
	.align 2, 0 \n\
_08023C3C: .4byte gFrameCounter8Bit \n\
_08023C40: \n\
	add r6, r6, r7 \n\
	ldrh r0, [r6, #2] \n\
	sub r0, #0x48 \n\
	movs r2, #0xe \n\
	ldrsh r1, [r6, r2] \n\
	ldrh r2, [r6, #4] \n\
	add r1, r1, r2 \n\
	bl SpriteUtilCheckCollisionAtPosition \n\
	ldr r0, _08023CAC @ =gPreviousCollisionCheck \n\
	ldrb r1, [r0] \n\
	movs r0, #0xf \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	bne _08023CD0 \n\
	ldrh r0, [r5, #4] \n\
	sub r0, r0, r4 \n\
	strh r0, [r5, #4] \n\
	ldrh r7, [r5, #4] \n\
	ldrh r2, [r5, #2] \n\
	ldrh r0, [r6, #4] \n\
	sub r0, r0, r4 \n\
	strh r0, [r6, #4] \n\
	mov r1, r8 \n\
	ldrb r0, [r1] \n\
	lsr r4, r0, #1 \n\
	cmp r4, #0x10 \n\
	bls _08023C7A \n\
	movs r4, #0x10 \n\
_08023C7A: \n\
	add r0, r6, #0 \n\
	add r0, #0x2b \n\
	ldrb r1, [r0] \n\
	sub r1, r1, r4 \n\
	strb r1, [r0] \n\
	ldr r0, _08023CB0 @ =gFrameCounter8Bit \n\
	ldrb r1, [r0] \n\
	cmp r1, #0xc \n\
	bls _08023CCA \n\
	movs r0, #1 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	beq _08023CB8 \n\
	sub r2, #0x10 \n\
	ldr r0, _08023CB4 @ =gFrameCounter8Bit \n\
	ldrb r0, [r0] \n\
	movs r3, #0x1f \n\
	and r3, r0 \n\
	sub r3, r7, r3 \n\
	movs r0, #0 \n\
	movs r1, #0x13 \n\
	bl SpriteDebrisInit \n\
	b _08023CCA \n\
	.align 2, 0 \n\
_08023CAC: .4byte gPreviousCollisionCheck \n\
_08023CB0: .4byte gSpriteRandomNumber \n\
_08023CB4: .4byte gFrameCounter8Bit \n\
_08023CB8: \n\
	ldr r0, _08023CF0 @ =gFrameCounter8Bit \n\
	ldrb r0, [r0] \n\
	movs r3, #0x1f \n\
	and r3, r0 \n\
	sub r3, r7, r3 \n\
	movs r0, #0 \n\
	movs r1, #0x12 \n\
	bl SpriteDebrisInit \n\
_08023CCA: \n\
	movs r0, #0 \n\
	cmp r0, #0 \n\
	beq _08023CF8 \n\
_08023CD0: \n\
	ldr r1, _08023CF4 @ =gCurrentSprite \n\
	add r2, r1, #0 \n\
	add r2, #0x24 \n\
	movs r3, #0 \n\
	movs r0, #0x3c \n\
	strb r0, [r2] \n\
	add r1, #0x31 \n\
	strb r3, [r1] \n\
	movs r0, #0x28 \n\
	movs r1, #0x81 \n\
	bl ScreenShakeStartHorizontal \n\
	movs r0, #0xb7 \n\
	bl SoundPlay \n\
	b _08023D0A \n\
	.align 2, 0 \n\
_08023CF0: .4byte gFrameCounter8Bit \n\
_08023CF4: .4byte gCurrentSprite \n\
_08023CF8: \n\
	ldr r0, _08023D14 @ =gFrameCounter8Bit \n\
	ldrb r1, [r0] \n\
	movs r0, #0xf \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	bne _08023D0A \n\
	movs r0, #0xb6 \n\
	bl SoundPlay \n\
_08023D0A: \n\
	pop {r3} \n\
	mov r8, r3 \n\
	pop {r4, r5, r6, r7} \n\
	pop {r0} \n\
	bx r0 \n\
	.align 2, 0 \n\
_08023D14: .4byte gFrameCounter8Bit \n\
    ");
}
#endif

void ArachnusBonking(void) {
    u32 shellSpriteSlot;
    u8 offset;
    u16 movement;
    u16 xSpeed;

    shellSpriteSlot = gCurrentSprite.work2;
    if (gSpriteData[shellSpriteSlot].pOam == sFrameData_302cf4) {
        if (SpriteUtilCheckNearEndSpriteAnim(shellSpriteSlot)) {
            gCurrentSprite.pose = 7;
            gCurrentSprite.work1 = 0xff;
        }
    } else {
        offset = gCurrentSprite.work4;
        movement = sArachnusBonkingSpeed[offset];
        if (movement == SHORT_MAX) {
            movement = sArachnusBonkingSpeed[offset - 1];
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
        }
        gCurrentSprite.yPosition += movement;
        gSpriteData[shellSpriteSlot].yPosition += movement;
        if (gCurrentSprite.work4 < 12) {
            xSpeed = 8;
        } else if (gCurrentSprite.work4 <= 20) {
            xSpeed = 4;
        } else {
            xSpeed = 0;
        }
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            gCurrentSprite.xPosition -= xSpeed;
            gSpriteData[shellSpriteSlot].xPosition -= xSpeed;
            gSpriteData[shellSpriteSlot].rotation -= xSpeed / 2;
        } else {
            gCurrentSprite.xPosition += xSpeed;
            gSpriteData[shellSpriteSlot].xPosition += xSpeed;
            gSpriteData[shellSpriteSlot].rotation += xSpeed / 2;
        }
        if (gCurrentSprite.work4 == 0x22) {
            SetSecondarySpriteOAMPointer(sFrameData_302cf4);
            gSpriteData[shellSpriteSlot].status &= ~SPRITE_STATUS_ROTATION_SCALING;
            SoundPlay(0xb5);
        }
    }
}

void ArachnusScreaming(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        if (SpriteUtilCountSecondarySprites(SSPRITE_ARACHNUS_FIRE_BALL) != 0) {
            if (gSpriteRandomNumber < 8) {
                ArachnusSlashingInit();
            } else {
                ArachnusRollingInit();
            }
        } else {
            if (gSpriteRandomNumber > 10) {
                ArachnusSlashingInit();
            } else if (gSpriteRandomNumber > 6) {
                ArachnusRollingInit();
            } else {
                ArachnusShootingFireInit();
            }
        }
    }
}

void ArachnusDying(void) {
    u16 x;
    u16 y;

    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    gCurrentSprite.xParasiteTimer--;
    y = gCurrentSprite.yPosition - 0xa0;
    x = gCurrentSprite.xPosition;
    if (gCurrentSprite.unk_8 != 0) {
        switch (gCurrentSprite.xParasiteTimer) {
            case 40:
                ParticleSet(y-0x10, x, 0x25);
                ParticleSet(y+0x10, x, 0x26);
                return;
            case 30:
                ParticleSet(y-0x20, x+0x1c, 0x25);
                return;
            case 20:
                ParticleSet(y+0x40, x-0x10, 0x26);
                return;
            case 10:
                ParticleSet(y-0x40, x+0x1c, 0x25);
                return;
            case 0:
                gCurrentSprite.unk_8 = 0;
                gCurrentSprite.xParasiteTimer = 44;
                return;
        }
    } else {
        switch (gCurrentSprite.xParasiteTimer) {
            case 40:
                ParticleSet(y-0x40, x-0x10, 0x26);
                ParticleSet(y+0x20, x-0x10, 0x25);
                break;
            case 30:
                ParticleSet(y-0x20, x+0x1c, 0x26);
                ParticleSet(y+0x40, x+0x20, 0x25);
                break;
            case 20:
                ParticleSet(y-0x20, x-0x10, 0x26);
                ParticleSet(y+0x40, x-0x10, 0x25);
                break;
            case 10:
                ParticleSet(y-0x40, x+0x1c, 0x26);
                ParticleSet(y+0x20, x+0x20, 0x25);
                break;
            case 0:
                gCurrentSprite.pose = 0x59;
                gCurrentSprite.spriteId = gCoreXFormationSpriteId;
        }
        if (gCurrentSprite.xParasiteTimer < 0x14) {
            SpriteLoadGfx(gCoreXFormationSpriteId, 0, gCurrentSprite.xParasiteTimer);
        } else if (gCurrentSprite.xParasiteTimer == 0x14) {
            SpriteLoadPal(gCoreXFormationSpriteId, 0, 5);
        }
    }
}

void ArachnusShootingFire(void) {
    if (gCurrentSprite.currentAnimationFrame == 3 && gCurrentSprite.animationDurationCounter == 1) {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            SpriteSpawnSecondary(SSPRITE_ARACHNUS_FIRE_BALL, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition + 0x40, SPRITE_STATUS_X_FLIP);
        } else {
            SpriteSpawnSecondary(SSPRITE_ARACHNUS_FIRE_BALL, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x80, gCurrentSprite.xPosition - 0x40, 0);
        }
        SoundPlay(0xbc);
    }
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 1;
        gCurrentSprite.work1 = 120;
    }
}

void ArachnusDetermineAttack(void) {
    if (gCurrentSprite.work1 > 0) {
        if (gCurrentSprite.work1 == 0xff) {
            ArachnusSlashingInit();
        }
        gCurrentSprite.work1--;
    } else {
        if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED) {
            if (SpriteUtilCountSecondarySprites(SSPRITE_ARACHNUS_FIRE_BALL) == 0) {
                if (!(gCurrentSprite.status & SPRITE_STATUS_SAMUS_COLLIDING)) {
                    ArachnusShootingFireInit();
                } else {
                    ArachnusRollingInit();
                }
            } else {
                ArachnusRollingInit();
            }
        } else {
            if (SamusCheckHangingOnLedge()) {
                ArachnusRollingInit();
            } else {
                if (SpriteUtilCheckSamusNearSpriteFrontBehind(0xc0, 0x180, 0x180) == NSFB_IN_FRONT) {
                    ArachnusSlashingInit();
                } else {
                    if (SpriteUtilCheckSamusNearSpriteFrontBehind(0xc0, 0x200, 0x200) == NSFB_IN_FRONT) {
                        ArachnusRollingInit();
                    }
                }
            }
        }
    }
}

void ArachnusCoreXTransformation(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.xParasiteTimer -= 1;
    if (gCurrentSprite.xParasiteTimer > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    } else {
        gCurrentSprite.status &= ~SPRITE_STATUS_IGNORE_PROJECTILES;
        gCurrentSprite.pose = 7;
        gCurrentSprite.status &= ~SPRITE_STATUS_ENABLE_MOSAIC;
    }
}

void ArachnusInit(void) {
    u8 ramSlot;

    gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawDistanceTop = 0x40;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x40;
    gCurrentSprite.work1 = 100;
    if (gCurrentSprite.pose == 0x59) {
        gCurrentSprite.yPosition += 100;
        gCurrentSprite.bgPriority = 2;
        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.status &= ~(SPRITE_STATUS_SAMUS_DETECTED | SPRITE_STATUS_SAMUS_COLLIDING);
        gCurrentSprite.pose = 0x5a;
        gCurrentSprite.xParasiteTimer = 0x2c;
    } else {
        gCurrentSprite.pose = 8;
    }
    gCurrentSprite.pOam = sFrameData_302c44;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    ArachnusSetStandingHitbox();
    ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_SHELL, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.work2 = ramSlot;
    ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_HEAD, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_LEFT_ARM, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_RIGHT_ARM, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
    }
}

void ArachnusWalkingInit(void) {
    gCurrentSprite.pose = 2;
    gCurrentSprite.pOam = sFrameData_3028f4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    ArachnusSetStandingHitbox();
    SetSecondarySpriteOAMPointer(sFrameData_302924);
}

void ArachnusWalking(void) {
    u32 turn;
    u16 movement;

    turn = FALSE;
    if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
        if ((gPreviousCollisionCheck & 0xf0) == 0) {
            // on ledge
            turn = TRUE;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x48, gCurrentSprite.xPosition + gCurrentSprite.hitboxRight);
            if ((gPreviousCollisionCheck & 0xf) != 0) {
                // hit wall
                turn = TRUE;
            }
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
        if ((gPreviousCollisionCheck & 0xf0) == 0) {
            turn = TRUE;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x48, gCurrentSprite.xPosition + gCurrentSprite.hitboxLeft);
            if ((gPreviousCollisionCheck & 0xf) != 0) {
                turn = TRUE;
            }
        }
    }
    if (turn) {
        gCurrentSprite.pose = 7;
    } else {
        switch (gCurrentSprite.currentAnimationFrame) {
            case 0:
                movement = 1;
                if (gCurrentSprite.animationDurationCounter == 9) {
                    SoundPlay(0xb8);
                }
                break;
            case 1:
                movement = 2;
                break;
            case 2:
                movement = 3;
                break;
            case 3:
                movement = 2;
                break;
            default:
                movement = 0;
        }
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            gCurrentSprite.xPosition += movement;
            gSpriteData[gCurrentSprite.work2].xPosition += movement;
        } else {
            gCurrentSprite.xPosition -= movement;
            gSpriteData[gCurrentSprite.work2].xPosition -= movement;
        }
    }
    ArachnusDetermineAttack();
}

void ArachnusIdleInit(void) {
    u32 shellSpriteSlot;

    shellSpriteSlot = gCurrentSprite.work2;
    if (gCurrentSprite.work1 == 0xff) {
        gCurrentSprite.status &= ~SPRITE_STATUS_UNKNOWN_2000;
        gSpriteData[shellSpriteSlot].status &= ~SPRITE_STATUS_ROTATION_SCALING;
        gSpriteData[shellSpriteSlot].hitboxTop = -0xa0;
        gSpriteData[shellSpriteSlot].hitboxBottom = 0;
        if (gSpriteData[shellSpriteSlot].status & SPRITE_STATUS_X_FLIP) {
            gSpriteData[shellSpriteSlot].hitboxLeft = -0x50;
            gSpriteData[shellSpriteSlot].hitboxRight = 0;
        }
        else {
            gSpriteData[shellSpriteSlot].hitboxLeft = 0;
            gSpriteData[shellSpriteSlot].hitboxRight = 0x50;
        }
    }
    gCurrentSprite.pose = 8;
    gCurrentSprite.pOam = sFrameData_302c44;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    ArachnusSetStandingHitbox();
    SetSecondarySpriteOAMPointer(sFrameData_302c6c);
}

void ArachnusIdle(void) {
    u32 newPose;

    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            if (gCurrentSprite.xPosition > gSamusData.xPosition) {
                newPose = 3;
            } else {
                newPose = 1;
            }
        } else {
            if (gCurrentSprite.xPosition < gSamusData.xPosition) {
                newPose = 3;
            } else {
                newPose = 1;
            }
        }
        gCurrentSprite.pose = newPose;
    }
}

void ArachnusTurningInit(void) {
    gCurrentSprite.pose = 4;
    gCurrentSprite.pOam = sFrameData_3029c4;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    SetSecondarySpriteOAMPointer(sFrameData_302a04);
}

void ArachnusTurning(void) {
    u32 shellSpriteSlot;

    shellSpriteSlot = gCurrentSprite.work2;
    if (gCurrentSprite.animationDurationCounter == 4 && gCurrentSprite.currentAnimationFrame == 2) {
        gCurrentSprite.status ^= SPRITE_STATUS_X_FLIP;
        gSpriteData[shellSpriteSlot].status ^= SPRITE_STATUS_X_FLIP;
        if (gSpriteData[shellSpriteSlot].status & SPRITE_STATUS_X_FLIP) {
            gSpriteData[shellSpriteSlot].hitboxLeft = -0x50;
            gSpriteData[shellSpriteSlot].hitboxRight = 0;
        } else {
            gSpriteData[shellSpriteSlot].hitboxLeft = 0;
            gSpriteData[shellSpriteSlot].hitboxRight = 0x50;
        }
    }
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 1;
    }
}

void Arachnus(void) {
    if (gCurrentSprite.pose != 0) {
        if (gCurrentSprite.health > 0) {
            if (SPRITE_HAS_ISFT(gCurrentSprite) >= 6) {
                if ((gCurrentSprite.pose == 2 || gCurrentSprite.pose == 8) && gCurrentSprite.pose != 0x3e) {
                    ArachnusScreamingInit();
                }
            } else if (SPRITE_HAS_ISFT(gCurrentSprite) >= 3) {
                gCurrentSprite.status |= SPRITE_STATUS_SAMUS_DETECTED;
                if (gCurrentSprite.work1 != 0xff) {
                    gCurrentSprite.work1 = 0;
                }
            }
        } else {
            ArachnusDyingInit();
        }
    }
    switch(gCurrentSprite.pose) {
        case 0x59:
            ArachnusInit();
        case 0x5a:
            ArachnusCoreXTransformation();
            break;
        case 0:
            ArachnusInit();
            break;
        case 1:
            ArachnusWalkingInit();
        case 2:
            ArachnusWalking();
            break;
        case 7:
            ArachnusIdleInit();
        case 8:
            ArachnusIdle();
            break;
        case 3:
            ArachnusTurningInit();
        case 4:
            ArachnusTurning();
            break;
        case 0x38:
            ArachnusSlashing();
            break;
        case 0x3a:
            ArachnusRolling();
            break;
        case 0x3c:
            ArachnusBonking();
            break;
        case 0x3e:
            ArachnusScreaming();
            break;
        case 0x40:
            ArachnusShootingFire();
            break;
        case 0x42:
            ArachnusDying();
            break;
    }
}

void ArachnusShell(void) {
    u32 arachnusRamSlot;

    arachnusRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (gCurrentSprite.pose == 0) {
        gCurrentSprite.status = gCurrentSprite.status & ~SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 5;
        gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
        gCurrentSprite.drawDistanceTop = 0x30;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x18;
        gCurrentSprite.hitboxTop = -0xa0;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.pOam = sFrameData_302c6c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = 2;
        gCurrentSprite.pose = 2;
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            gCurrentSprite.hitboxLeft = -0x50;
            gCurrentSprite.hitboxRight = 0;
        } else {
            gCurrentSprite.hitboxLeft = 0;
            gCurrentSprite.hitboxRight = 0x50;
        }
    }
    if (gSpriteData[arachnusRamSlot].pose == 2 && SPRITE_HAS_ISFT(gCurrentSprite) > 0) {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            if (gCurrentSprite.xPosition > gSamusData.xPosition) {
                // Why not use "gSpriteData[arachnusRamSlot].pose = 7;"?
                gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose = 7;
            }
        } else {
            if (gCurrentSprite.xPosition < gSamusData.xPosition) {
                gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose = 7;
            }
        }
    }
    if (gSpriteData[arachnusRamSlot].status & SPRITE_STATUS_ENABLE_MOSAIC) {
        gCurrentSprite.status |= SPRITE_STATUS_ENABLE_MOSAIC;
    }
    else {
        gCurrentSprite.status &= ~SPRITE_STATUS_ENABLE_MOSAIC;
    }
    if (gSpriteData[arachnusRamSlot].pose == 0x59) {
        gCurrentSprite.status = 0;
    }
}

void ArachnusPart(void) {
    u32 arachnusRamSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    arachnusRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gSpriteData[arachnusRamSlot].pose) {
        case 2:
            break;
        case 1:
            gCurrentSprite.status &= ~SPRITE_STATUS_UNKNOWN_2000;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        case 7:
            break;
        default:
            gCurrentSprite.status |= 0x2000;
    }
    gCurrentSprite.yPosition = gSpriteData[arachnusRamSlot].yPosition;
    gCurrentSprite.xPosition = gSpriteData[arachnusRamSlot].xPosition;
    gCurrentSprite.paletteRow = gSpriteData[arachnusRamSlot].paletteRow;
    if (gSpriteData[arachnusRamSlot].status & SPRITE_STATUS_X_FLIP) {
        gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
    }
    else {
        gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
    }
    if (gSpriteData[arachnusRamSlot].pose == 0x59) {
        gCurrentSprite.status = 0;
    }
}

void ArachnusHead(void) {
    if (gCurrentSprite.pose == 0) {
        gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 3;
        gCurrentSprite.drawDistanceTop = 0x30;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x20;
        gCurrentSprite.hitboxTop = -4;
        gCurrentSprite.hitboxBottom = 4;
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 4;
        gCurrentSprite.pOam = sFrameData_30294c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = 0;
        gCurrentSprite.pose = 2;
    }
    ArachnusPart();
}

void ArachnusArm1(void) {
    if (gCurrentSprite.pose == 0) {
        gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.drawDistanceTop = 0x20;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x28;
        gCurrentSprite.hitboxTop = -4;
        gCurrentSprite.hitboxBottom = 4;
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 4;
        gCurrentSprite.pOam = sFrameData_30299c;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = 0;
        gCurrentSprite.pose = 2;
    }
    ArachnusPart();
}

void ArachnusArm2(void) {
    if (gCurrentSprite.pose == 0) {
        gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 2;
        gCurrentSprite.drawDistanceTop = 0x20;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x28;
        gCurrentSprite.hitboxTop = -4;
        gCurrentSprite.hitboxBottom = 4;
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 4;
        gCurrentSprite.pOam = sFrameData_302974;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = 0;
        gCurrentSprite.pose = 2;
    }
    ArachnusPart();
}

/*void ArachnusFire(void) {
    
}

void ArachnusSlash(void) {
    
}

void ArachnusSlashTrail(void) {
    
}*/
