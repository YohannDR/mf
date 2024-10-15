#include "macros.h"
#include "globals.h"

#include "data/frame_data_pointers.h"
#include "data/sprite_data.h"
#include "data/sprites/box.h"

#include "constants/samus.h"
#include "constants/particle.h"

#include "structs/samus.h"
#include "structs/clipdata.h"

#define BOX_BRAIN_DRAW_ORDER 12

void SpriteUtilUpdateSubSpriteData1Animation(void) {
    gSubSpriteData1.animationDurationCounter++;
    if (gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].timer < gSubSpriteData1.animationDurationCounter) {
        gSubSpriteData1.animationDurationCounter = 1;
        gSubSpriteData1.currentAnimationFrame += 1;
        if (gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].timer == 0) {
            gSubSpriteData1.currentAnimationFrame = 0;
        }
    }
}

void SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position(void) {
    MultiSpriteDataInfo_T pData;

    pData = gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].pData;
    gCurrentSprite.yPosition = gSubSpriteData1.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];
    gCurrentSprite.xPosition = gSubSpriteData1.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
}

void BoxSyncSubSprites(void) {
    MultiSpriteDataInfo_T pData;
    u16 oamIdx;

    pData = gSubSpriteData1.pMultiOam[gSubSpriteData1.currentAnimationFrame].pData;

    oamIdx = pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX];
    
    if (gCurrentSprite.pOam != sBoxFrameDataPointers[oamIdx])
    {
        gCurrentSprite.pOam = sBoxFrameDataPointers[oamIdx];
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }

    gCurrentSprite.yPosition = gSubSpriteData1.yPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET];
    gCurrentSprite.xPosition = gSubSpriteData1.xPosition + pData[gCurrentSprite.roomSlot][MULTI_SPRITE_DATA_ELEMENT_X_OFFSET];
}

u8 BoxXMovement(u16 movement, u8 collidedPose) {
    u8 collided;

    collided = FALSE;
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition - 0x10, gSubSpriteData1.xPosition + 0x6e);
        if (gPreviousCollisionCheck != 0) {
            gCurrentSprite.pose = collidedPose;
            collided = TRUE;
        } else {
            gSubSpriteData1.xPosition += movement;
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition - 0x10, gSubSpriteData1.xPosition - 0x6e);
        if (gPreviousCollisionCheck != 0) {
            gCurrentSprite.pose = collidedPose;
            collided = TRUE;
        } else {
            gSubSpriteData1.xPosition -= movement;
        }
    }
    return collided;
}

void BoxInit(void) {
    if (!EventCheckOn_BoxRumble()) {
        gCurrentSprite.status = 0;
    } else {
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
        gCurrentSprite.drawDistanceTop = 0x10;
        gCurrentSprite.drawDistanceBottom = 0x10;
        gCurrentSprite.drawDistanceHorizontal = 0x10;
        gCurrentSprite.hitboxTop = -0x28;
        gCurrentSprite.hitboxBottom = 0x40;
        gCurrentSprite.hitboxLeft = -0x30;
        gCurrentSprite.hitboxRight = 0x30;
        gCurrentSprite.work0 = 7;
        gCurrentSprite.drawOrder = BOX_BRAIN_DRAW_ORDER;
        gCurrentSprite.frozenPaletteRowOffset = 2;
        gCurrentSprite.roomSlot = BOX_PART_BRAIN;
        gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
        gCurrentSprite.pOam = sBoxPartOam_Brain;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gSubSpriteData1.yPosition = gCurrentSprite.yPosition;
        gSubSpriteData1.xPosition = gCurrentSprite.xPosition;
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Defeated;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        gSubSpriteData1.work0 = 0;
        gCurrentSprite.work2 = 0;
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
        gCurrentSprite.pose = 0x3f;
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_FRONT_LEFT_LEG_COVER, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_FRONT_LEFT_LEG, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_FRONT_RIGHT_LEG_COVER, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_FRONT_RIGHT_LEG, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_MIDDLE_LEFT_LEG, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_MIDDLE_RIGHT_LEG, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_CENTER, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_CENTER_BOTTOM, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_LAUNCHER, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_BACK_LEFT_LEG, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
        SpriteSpawnSecondary(SSPRITE_BOX_PART, BOX_PART_BACK_RIGHT_LEG, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gSubSpriteData1.yPosition, gSubSpriteData1.xPosition, 0);
    }
}

void BoxWaitingToEmergeInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FinishedCrawling;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gSubSpriteData1.xPosition += 0x100;
    gCurrentSprite.pose = 0x40;
    gCurrentSprite.work1 = 0;
    unk_3b1c(0x26d);
    ScreenShakeStartHorizontal(40, 0x81);
    gCurrentSprite.work4 = 0;
}

void BoxWaitingToEmerge(void) {
    u16 y;
    u16 x;

    if (++gCurrentSprite.work4 > 60) {
        unk_3b1c(0x26d);
        ScreenShakeStartHorizontal(40, 0x81);
        gCurrentSprite.work4 = 0;
    }
    y = gCurrentSprite.yPosition;
    x = gCurrentSprite.xPosition;
    switch (gCurrentSprite.work1) {
        case 0:
            ParticleSet(y, x, 0x2e);
            break;
        case 4:
            ParticleSet(y, x, 0x2f);
            break;
        case 8:
            ParticleSet(y-0x1c, x+0x1c, 0x2e);
            break;
        case 16:
            ParticleSet(y+0x20, x-0x20, 0x2f);
            break;
        case 20:
            ParticleSet(y-0x1c, x-0x2e, 0x2e);
            break;
        case 24:
            ParticleSet(y+0x40, x-0x40, 0x2f);
            break;
        case 28:
            ParticleSet(y+0x58, x, 0x2f);
            break;
        case 32:
            ParticleSet(y-0x5a, x+0x10, 0x2f);
            break;
        case 36:
            gCurrentSprite.work1 = UCHAR_MAX;
    }
    gCurrentSprite.work1++;
    if (SpriteUtilCheckSamusNearSpriteLeftRight(0x200, 0x200) == NSLR_LEFT) {
        gCurrentSprite.pose = 0x41;
        ParticleSet(y, x-0xa0, 0x2f);
        PlayMusic(0x1b, 7);
    }
}

void BoxFirstJumpInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Jumping;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x42;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.status &= ~SS_FACING_RIGHT;
    SoundPlay(0x265);
}

void BoxFirstJump(void) {
    u8 offset;
    s16 movement;

    offset = gCurrentSprite.work4;
    movement = sBoxFirstJumpSpeed[gCurrentSprite.work4];
    if (movement == SHORT_MAX) {
        gCurrentSprite.pose = 0x19;
        ParticleSet(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition + 0xb4, 0x35);
        SoundPlay(0x266);
        ScreenShakeStartVertical(60, 0x81);
    } else {
        offset++;
        gCurrentSprite.work4 = offset;
        gSubSpriteData1.yPosition += movement;
        gSubSpriteData1.xPosition -= 10;
    }
}

void BoxWaitingToRunInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_WaitingToRun;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.work1 = 0;
    SoundPlay(0x26a);
}

void BoxWaitingToRun(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim() && ++gCurrentSprite.work1 == 1) {
        gCurrentSprite.pose = 0x19;
    }
    if (gCurrentSprite.work2 != 0) {
        gCurrentSprite.pose = 0x3b;
    }
}

void BoxSlowRunningInit(void) {
    SpriteUtilMakeSpriteFaceSamusDirection();
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_SlowRun_Right;
    } else {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_SlowRun_Left;
    }
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x1a;
    gCurrentSprite.work1 = 0;
}

void BoxSlowRun(void) {
    if (gSubSpriteData1.currentAnimationFrame == 3 && gSubSpriteData1.animationDurationCounter == 1) {
        SoundPlay(0x262);
    }
    if (!BoxXMovement(gCurrentSprite.work1, 0x37)) {
        if (SpriteUtilCheckNearEndSubSprite1Anim() && ++gCurrentSprite.work1 == 7) {
            gCurrentSprite.pose = 0x1b;
        }
        if (gCurrentSprite.work2 != 0) {
            gCurrentSprite.pose = 0x3b;
        }
    }
}

void BoxFastRunInit(void) {
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FastRun_Right;
    } else {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FastRun_Left;
    }
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x1c;
    gCurrentSprite.work1 = 10;
}

void BoxFastRun(void) {
    if (gSubSpriteData1.currentAnimationFrame == 3 && gSubSpriteData1.animationDurationCounter == 1) {
        SoundPlay(0x262);
    }
    if (!BoxXMovement(8, 0x37)) {
        if (gCurrentSprite.work1 != 0) {
            gCurrentSprite.work1--;
            return;
        } else {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                if (gSubSpriteData1.xPosition - 200 > gSamusData.xPosition) {
                    gCurrentSprite.pose = 0x1d;
                }
            } else {
                if (gSubSpriteData1.xPosition + 200 < gSamusData.xPosition) {
                    gCurrentSprite.pose = 0x1d;
                }
            }
        }
    }
    if (gCurrentSprite.work2 != 0) {
        gCurrentSprite.pose = 0x3b;
    }
}

void BoxSkiddingInit(void) {
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Skidding_Right;
    } else {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Skidding_Left;
    }
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x1e;
    gCurrentSprite.work1 = 0x20;
    SoundPlay(0x263);
}

void BoxSkidding(void) {
    u8 collidedPose;

    if (gCurrentSprite.work1 / 4 > 5) {
        collidedPose = 0x37;
    } else {
        collidedPose = 0x1f;
    }
    if (!BoxXMovement(gCurrentSprite.work1 / 4, collidedPose)) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = 0x1f;
        }
        if (gCurrentSprite.work2 != 0) {
            gCurrentSprite.pose = 0x3b;
        }
    }
}

void BoxStopSkiddingInit(void) {
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_StopSkidding_Right;
    } else {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_StopSkidding_Left;
    }
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x20;
}

void BoxStopSkidding(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = 0x3b;
        gCurrentSprite.work2 = 3;
    } else {
        if (gCurrentSprite.work2 != 0) {
            gCurrentSprite.pose = 0x3b;
        }
    }
}

void BoxBonkingInit(void) {
    gSubSpriteData1.yPosition -= 0x10;
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Jumping;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.status ^= SS_FACING_RIGHT;
    SoundPlay(0x267);
    ScreenShakeStartHorizontal(20, 0x81);
}

void BoxBonking(void) {
    u32 blockTop;
    u8 offset;
    s16 movement;

    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition);
    if (gPreviousVerticalCollisionCheck != 0) {
        gSubSpriteData1.yPosition = blockTop;
        gCurrentSprite.pose = 0x4b;
    } else {
        offset = gCurrentSprite.work4;
        movement = sBoxBonkingSpeed[offset];
        if (movement == SHORT_MAX) {
            movement = sBoxBonkingSpeed[offset - 1];
            gSubSpriteData1.yPosition += movement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gSubSpriteData1.yPosition += movement;
        }
        if (gCurrentSprite.status & SS_FACING_RIGHT) {
            gSubSpriteData1.xPosition += 6;
        } else {
            gSubSpriteData1.xPosition -= 6;
        }
    }
}

void BoxLandingFromBonkInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Landing;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x4c;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work4 = 0;
    SoundPlay(0x266);
}

void BoxLandingFromBonk(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = 0x17;
    }
}

void BoxLandingInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Landing;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x3a;
    gCurrentSprite.work4 = 0;
    SoundPlay(0x266);
}

void BoxLanding(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        if (gCurrentSprite.work2 == 0) {
            gCurrentSprite.pose = 0x27;
        } else {
            gCurrentSprite.work2--;
            if ((gCurrentSprite.work2 & 0x7f) == 0) {
                gCurrentSprite.work2 = 0;
            }
            gCurrentSprite.pose = 0x3b;
        }
    }
}

void BoxFinishedCrawlingInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FinishedCrawling;
    gCurrentSprite.work1 = 2;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 8;
    SoundPlay(0x264);
}

void BoxFinishedCrawling(void) {
    if (gCurrentSprite.work1 > 1) {
        if (SpriteUtilCheckEndSubSprite1Anim()) {
            gCurrentSprite.work1--;
        }
    } else {
        if (SpriteUtilCheckNearEndSubSprite1Anim()) {
            if (SamusCheckOnCeilingLadder()) {
                gCurrentSprite.pose = 0x3b;
            } else {
                if (gCurrentSprite.work2 != 0) {
                    gCurrentSprite.pose = 0x3b;
                } else {
                    gCurrentSprite.pose = 0x19;
                }
            }
        }
    }
}

void BoxStoppingToFireBombInit(); // need to do this so the compiler won't throw a warning for some reason

void BoxJumpWarningInit(void) {
    u16 samusX;

    samusX = gSamusData.xPosition;
    if (gSubSpriteData1.xPosition - 0x78 < samusX && gSubSpriteData1.xPosition + 0x78 > samusX) {
        BoxStoppingToFireBombInit();
    } else {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_JumpWarning;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x3c;
    }
}

void BoxJumpWarning(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = 0x3d;
    }
}

void BoxJumpingInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Jumping;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x3e;
    gCurrentSprite.work4 = 0;
    if ((gCurrentSprite.work2 & 0x80) == 0) {
        if (SamusCheckOnCeilingLadder()) {
            SpriteUtilMakeSpriteFaceSamusDirection();
        } else {
            SpriteUtilMakeSpriteFaceAwayFromSamusDirection();
        }
        if (gCurrentSprite.status & SS_FACING_RIGHT) {
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition - 300, gSubSpriteData1.xPosition + 300);
            if (gPreviousCollisionCheck != 0) {
                gCurrentSprite.status &= ~SS_FACING_RIGHT;
                gCurrentSprite.work2 = 0x83;
            }
        } else {
            SpriteUtilCheckCollisionAtPosition(gSubSpriteData1.yPosition - 300, gSubSpriteData1.xPosition - 300);
            if (gPreviousCollisionCheck != 0) {
                gCurrentSprite.status |= SS_FACING_RIGHT;
                gCurrentSprite.work2 = 0x83;
            }
        }
    }
    SoundPlay(0x265);
}

void BoxJumping(void) {
    u8 offset;
    s16 movement;

    offset = gCurrentSprite.work4;
    movement = sBoxJumpingSpeed[offset];
    if (movement == SHORT_MAX) {
        gCurrentSprite.pose = 0x39;
    } else {
        offset++;
        gCurrentSprite.work4 = offset;
        gSubSpriteData1.yPosition += movement;
        BoxXMovement(0xc, 0x37);
    }
}

void BoxStoppingToFireBombInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FinishedCrawling;
    gCurrentSprite.work1 = 3;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x28;
    SoundPlay(0x264);
}

void BoxStoppingToFireBomb(void) {
    if (gCurrentSprite.work1 > 1) {
        if (SpriteUtilCheckEndSubSprite1Anim()) {
            gCurrentSprite.work1--;
        }
    } else {
        if (SpriteUtilCheckNearEndSubSprite1Anim()) {
            gCurrentSprite.pose = 0x29;
        }
    }
}

void BoxLoweringToFireBombInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_LoweringToFireBomb;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2a;
    SoundPlay(0x268);
}

void BoxLoweringToFireBomb(void) {
    if (SpriteUtilCheckEndSubSprite1Anim()) {
        gCurrentSprite.pose = 0x2c;
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FiringBomb;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
    }
}

void BoxFiringBomb(void) {
    u16 x;
    u16 y;

    if (SpriteUtilCheckEndSubSprite1Anim()) {
        gCurrentSprite.pose = 0x2e;
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_DoneFiringBomb;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
        SoundPlay(0x269);
    } else {
        y = gCurrentSprite.yPosition;
        x = gCurrentSprite.xPosition;
        if (gSubSpriteData1.currentAnimationFrame == 1 && gSubSpriteData1.animationDurationCounter == 2) {
            if (x > gSamusData.xPosition) {
                SpriteSpawnSecondary(SSPRITE_BOX_BOMB, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, y-100, x, 0);
            }
            else {
                SpriteSpawnSecondary(SSPRITE_BOX_BOMB, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, y-100, x, SS_FACING_RIGHT);
            }
        }
    }
}

void BoxDoneFiringBomb(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = 0x17;
    }
}

void BoxDefeatedInit(void) {
    gCurrentSprite.pOam = sBoxPartOam_Brain;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 0x44;
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Defeated;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
}

void BoxDefeated(void) {
    u32 blockTop;

    if (gCurrentSprite.work1 == 0) {
        blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition);
        if (gPreviousVerticalCollisionCheck != 0) {
            gSubSpriteData1.yPosition = blockTop;
            gCurrentSprite.work1++;
        } else {
            gSubSpriteData1.yPosition += 0x10;
        }
    } else {
        if (++gCurrentSprite.work1 > 30) {
            gCurrentSprite.pose = 0x45;
        }
    }
}

void BoxMovingToFinalJumpInit(void) {
    u8 debrisRamSlot;

    gCurrentSprite.pOam = sBoxPartOam_Brain;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x46;
    debrisRamSlot = SpriteUtilFindPrimarySprite(PSPRITE_BOX_DEBRIS);
    gCurrentSprite.unk_8 = gSpriteData[debrisRamSlot].xPosition;
    gCurrentSprite.work2 = debrisRamSlot;
    if (gSubSpriteData1.xPosition > gCurrentSprite.unk_8) {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Crawling_Left;
        gCurrentSprite.status &= ~SS_FACING_RIGHT;
    } else {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Crawling_Right;
        gCurrentSprite.status |= SS_FACING_RIGHT;
    }
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
}

void BoxMovingToFinalJump(void) {
    if (gSubSpriteData1.currentAnimationFrame == 3 && gSubSpriteData1.animationDurationCounter == 1) {
        SoundPlay(0x262);
    }
    if ((gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 0xb;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
    if ((gSubSpriteData1.xPosition & 0xfff8) == (gCurrentSprite.unk_8 & 0xfff8)) {
        gCurrentSprite.pose = 0x47;
    } else {
        if (gCurrentSprite.status & SS_FACING_RIGHT) {
            gSubSpriteData1.xPosition += 2;
        } else {
            gSubSpriteData1.xPosition -= 2;
        }
    }
}

void BoxWaitingForFinalJumpInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Defeated;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x48;
    SoundPlay(0x276);
}

void BoxWaitingForFinalJump(void) {
    if ((gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 0xb;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
    if ((u32)(((gCurrentSprite.xPosition / 4 - gBg1XPosition / 4) << 0x10) - 0x190000) >> 0x10 < 0xbf) { // umm...?
        if (SpriteUtilCheckNearEndSubSprite1Anim()) {
            gCurrentSprite.pose = 0x49;
        }
    }
}

void BoxCrouchingForFinalJumpInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_JumpWarning;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x4a;
}

void BoxCrouchingForFinalJump(void) {
    if ((gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 0xb;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = 0x4d;
        unk_36c4();
    }
}

void BoxFinalJumpInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Jumping;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x4e;
    gCurrentSprite.work1 = 0x1e;
    SoundPlay(0x277);
}

void BoxFinalJump(void) {
    if ((gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 0xb;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
    gSubSpriteData1.yPosition -= 0x28;
    gCurrentSprite.work1 -= 1;
    if (gCurrentSprite.work1 == 0) {
        gSpriteData[gCurrentSprite.work2].pose = 0x18;
        gCurrentSprite.status = 0;
    }
}

void BoxCrawlingInit(void) {
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Crawling_Right;
    } else {
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Crawling_Left;
    }
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
}

void BoxCrawling(void) {
    BoxXMovement(1, 7);
}

void BoxPartSetBoxWorkVar2(u8 ramSlot, u8 value) {
    if (gSpriteData[ramSlot].work2 < value) {
        gSpriteData[ramSlot].work2 = value;
    }
}

void BoxPartCenterSetImmunity(u8 ramSlot) {
    switch (gSpriteData[ramSlot].pose) {
        case 0x29:
        case 0x2a:
        case 0x2c:
            if ((gSpriteData[ramSlot].work0 & 3) != 0) {
                gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            } else {
                gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;
            }
            break;
        case 0x3f:
        case 0x40:
        case 0x41:
        case 0x42:
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            break;
        default:
            gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;
            break;
    }
}

void BoxPartRemoveIgnoreProjectiles(void) {
    gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
}

void BoxPartInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.pose = 2;
    if (gCurrentSprite.roomSlot < BOX_PART_BRAIN) {
        gCurrentSprite.drawOrder = BOX_BRAIN_DRAW_ORDER-1;
    } else {
        gCurrentSprite.drawOrder = BOX_BRAIN_DRAW_ORDER+1;
    }
    switch (gCurrentSprite.roomSlot) {
        case BOX_PART_FRONT_LEFT_LEG_COVER:
        case BOX_PART_FRONT_RIGHT_LEG_COVER: {
            gCurrentSprite.hitboxTop = -0x48;
            gCurrentSprite.hitboxBottom = 0x48;
            gCurrentSprite.hitboxLeft = -0x20;
            gCurrentSprite.hitboxRight = 0x20;
            gCurrentSprite.frozenPaletteRowOffset = 2;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
            gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            break;
        }
        case BOX_PART_CENTER: {
            gCurrentSprite.hitboxTop = -0x30;
            gCurrentSprite.hitboxBottom = 0x40;
            gCurrentSprite.hitboxLeft = -0x20;
            gCurrentSprite.hitboxRight = 0x20;
            gCurrentSprite.frozenPaletteRowOffset = 1;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
            gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
            break;
        }
        case BOX_PART_LAUNCHER: {
            gCurrentSprite.hitboxTop = -0x20;
            gCurrentSprite.hitboxBottom = 0x20;
            gCurrentSprite.hitboxLeft = -0x40;
            gCurrentSprite.hitboxRight = 0x40;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
            gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
            gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            break;
        }
        case BOX_PART_FRONT_LEFT_LEG:
        case BOX_PART_FRONT_RIGHT_LEG:
        case BOX_PART_MIDDLE_LEFT_LEG:
        case BOX_PART_MIDDLE_RIGHT_LEG:
        case BOX_PART_CENTER_BOTTOM:
        case BOX_PART_BACK_LEFT_LEG:
        case BOX_PART_BACK_RIGHT_LEG: {
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
            gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
            break;
        }
        default: {
            gCurrentSprite.status = 0;
            break;
        }
    }
    BoxSyncSubSprites();
}


void BoxPartFrontLeftLeg(void) {
    u8 brainRamSlot;
    u16 y;
    u16 x;

    brainRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (!(gSpriteData[brainRamSlot].status & SS_EXISTS)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.status & SS_HIDDEN) {
        return;
    }
    y = gCurrentSprite.yPosition;
    x = gCurrentSprite.xPosition;
    if (gSpriteData[brainRamSlot].pose == 0x44 && gCurrentSprite.pOam != sBoxPartOam_FrontLeftLegCoverDamaged) {
        ParticleSet(y+0x3c, x, 0x30);
        gCurrentSprite.pOam = sBoxPartOam_FrontLeftLegCoverDamaged;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
    if ((gSpriteData[brainRamSlot].work0 & 4) == 0 && (gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 0xb;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
}

void BoxPartFrontRightLeg(void) {
    u8 brainRamSlot;
    u16 y;
    u16 x;

    brainRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (!(gSpriteData[brainRamSlot].status & SS_EXISTS)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.status & SS_HIDDEN) {
        return;
    }
    y = gCurrentSprite.yPosition;
    x = gCurrentSprite.xPosition;
    if (gSpriteData[brainRamSlot].pose == 0x44 && gCurrentSprite.pOam != sBoxPartOam_FrontRightLegCoverDamaged) {
        ParticleSet(y+0x3c, x, 0x30);
        gCurrentSprite.pOam = sBoxPartOam_FrontRightLegCoverDamaged;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
    if ((gSpriteData[brainRamSlot].work0 & 4) == 0 && (gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 0xb;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
}

void BoxPartCenter(void) {
    u8 brainRamSlot;
    u16 maxHealth;
    u16 y;
    u16 x;

    brainRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (!(gSpriteData[brainRamSlot].status & SS_EXISTS)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.status & SS_HIDDEN) {
        return;
    }
    if ((gSpriteData[brainRamSlot].work0 & 4) == 0) {
        if ((gFrameCounter8Bit & 7) == 0) {
            if ((gFrameCounter8Bit & 8) != 0) {
                gCurrentSprite.paletteRow = 0xc;
            } else {
                gCurrentSprite.paletteRow = 0;
            }
        }
        return;
    }
    maxHealth = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    y = gCurrentSprite.yPosition;
    x = gCurrentSprite.xPosition;
    BoxPartCenterSetImmunity(brainRamSlot);
    if (gCurrentSprite.health == 0) {
        gSpriteData[brainRamSlot].work0 &= ~4;
        ParticleSet(y+0x32, x, 0x2f);
        gSpriteData[brainRamSlot].pose = 0x43;
    } else {
        if (gCurrentSprite.health < maxHealth / 4) {
            if (gCurrentSprite.pOam != sBoxPartOam_CenterHeavilyDamaged) {
                gCurrentSprite.pOam = sBoxPartOam_CenterHeavilyDamaged;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                ParticleSet(y+0x24, x, 0x30);
            }
        } else if (gCurrentSprite.health < maxHealth / 2) {
            if (gCurrentSprite.pOam != sBoxPartOam_CenterModeratelyDamaged) {
                gCurrentSprite.pOam = sBoxPartOam_CenterModeratelyDamaged;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                ParticleSet(y+0x24, x, 0x30);
            }
        } else if (gCurrentSprite.health < maxHealth * 3 / 4) {
            if (gCurrentSprite.pOam != sBoxPartOam_CenterSlightlyDamaged) {
                gCurrentSprite.pOam = sBoxPartOam_CenterSlightlyDamaged;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                ParticleSet(y+0x24, x, 0x30);
            }
        }
    }
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4) {
        BoxPartSetBoxWorkVar2(brainRamSlot, 2);
        SoundPlay(0x278);
    }
}

void BoxPartCenterBottom(void) {
    u8 brainRamSlot;

    brainRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (!(gSpriteData[brainRamSlot].status & SS_EXISTS)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.status & SS_HIDDEN) {
        return;
    }
    switch (gSpriteData[brainRamSlot].pose) {
        case 8:
        case 0x18:
        case 0x3c: {
            if (gCurrentSprite.pOam != sFrameData_347ca8) {
                gCurrentSprite.pOam = sFrameData_347ca8;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            }
            break;
        }
        case 0x44:
        case 0x45:
        case 0x46:
        case 0x47:
        case 0x48:
        case 0x49:
        case 0x4a:
        case 0x4d:
        case 0x4e: {
            if (gCurrentSprite.pOam != sFrameData_347ca8) {
                gCurrentSprite.pOam = sFrameData_347ca8;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            }
            if ((gFrameCounter8Bit & 7) == 0) {
                if ((gFrameCounter8Bit & 8) != 0) {
                    gCurrentSprite.paletteRow = 0xc;
                } else {
                    gCurrentSprite.paletteRow = 0;
                }
            }
            break;
        }
        default: {
            if (gCurrentSprite.pOam != sFrameData_347c98) {
                gCurrentSprite.pOam = sFrameData_347c98;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            }
            break;
        }
    }
}

void BoxPartDefault(void) {
    u8 brainRamSlot;

    brainRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (!(gSpriteData[brainRamSlot].status & SS_EXISTS)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.status & SS_HIDDEN) {
        return;
    }
    switch (gSpriteData[brainRamSlot].pose) {
        case 0x44:
        case 0x45:
        case 0x46:
        case 0x47:
        case 0x48:
        case 0x49:
        case 0x4a:
        case 0x4d:
        case 0x4e: {
            if ((gFrameCounter8Bit & 7) == 0) {
                if ((gFrameCounter8Bit & 8) != 0) {
                    gCurrentSprite.paletteRow = 0xd;
                } else {
                    gCurrentSprite.paletteRow = 0;
                }
            }
            break;
        }
    }
}

void BoxMissileInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
    gCurrentSprite.bgPriority = gIoRegisters.bg1Cnt & 3;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -8;
    gCurrentSprite.hitboxBottom = 8;
    gCurrentSprite.hitboxLeft = -8;
    gCurrentSprite.hitboxRight = 8;
    gCurrentSprite.pOam = sBoxMissileOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.rotation = Q_8_8(0.75f);
    gCurrentSprite.scaling = Q_8_8(1);
    gCurrentSprite.work1 = 0x24;
    gCurrentSprite.xParasiteTimer = 300;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    SoundPlay(0x26b);
}

void BoxMissileSpawning(void) {
    u32 movement;

    if (gCurrentSprite.health == 0) {
        gCurrentSprite.pose = 0x37;
    }
    movement = gCurrentSprite.work1 / 2;
    gCurrentSprite.yPosition -= movement;
    if (movement < 3) {
        gCurrentSprite.rotation = RotateSpriteTowardsSamus(gCurrentSprite.rotation,
            gSamusData.yPosition - 0x40, gSamusData.xPosition, gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    }
    gCurrentSprite.work1 -= 2;
    if (gCurrentSprite.work1 < 2) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.work2 = 0;
        gCurrentSprite.work3 = 1;
        gCurrentSprite.work1 = 0;
        gCurrentSprite.work4 = 1;
    }
}

void BoxMissileMoving(void) {
    u16 targetYOffset;
    if (--gCurrentSprite.xParasiteTimer != 0 && gCurrentSprite.health != 0) {
        if (gCurrentSprite.roomSlot == 3) {
            targetYOffset = 8;
        } else if (gCurrentSprite.roomSlot == 2) {
            targetYOffset = 0x28;
        } else if (gCurrentSprite.roomSlot == 1) {
            targetYOffset = 0x48;
        } else {
            targetYOffset = 0x68;
        }
        MoveSpriteTowardsTarget((u16)(gSamusData.yPosition - targetYOffset), gSamusData.xPosition, 0x18, 0x28, 2);
        gCurrentSprite.rotation = RotateSpriteTowardsSamus(gCurrentSprite.rotation,
            gSamusData.yPosition - 0x40, gSamusData.xPosition, gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck != 0) {
            gCurrentSprite.pose = 0x37;
        }
    } else {
        gCurrentSprite.pose = 0x37;
    }
}

void BoxMissileExploding(void) {
    gCurrentSprite.status = 0;
    ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0x25);
    SoundPlay(0x26c);
}

void BoxBombInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x1c;
    gCurrentSprite.hitboxBottom = 0x1c;
    gCurrentSprite.hitboxLeft = -0x1c;
    gCurrentSprite.hitboxRight = 0x1c;
    gCurrentSprite.pOam = sBoxBombOam_Moving;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.rotation = 0;
    gCurrentSprite.scaling = Q_8_8(1);
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 7;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    SoundPlay(0x270);
}

void BoxBombMoving(void) {
    u32 blockTop;
    u8 offset;
    u16 movement;
    
    if (gCurrentSprite.health == 0) {
        gCurrentSprite.pose = 0x37;
        return;
    }
    if (gCurrentSprite.work2 == 0) {
        offset = gCurrentSprite.work4;
        movement = sBoxBombLaunchingSpeed[offset];
        if (movement == SHORT_MAX) {
            movement = 0;
            gCurrentSprite.work2 += 1;
            gCurrentSprite.work4 = 0;
        } else {
            gCurrentSprite.work4 += 1;
        }
        if (gCurrentSprite.work4 == 3) {
            gCurrentSprite.work3 = 7;
        }
        gCurrentSprite.yPosition += movement;
    }
    else if (gCurrentSprite.work2 == 2) {
        offset = gCurrentSprite.work4;
        movement = sBoxBombFirstBounceSpeed[offset];
        if (movement == SHORT_MAX) {
            movement = 0;
            gCurrentSprite.work2 += 1;
            gCurrentSprite.work4 = 0;
        } else {
            gCurrentSprite.work4 += 1;
        }
        gCurrentSprite.yPosition += movement;
    } else if (gCurrentSprite.work2 == 4) {
        offset = gCurrentSprite.work4;
        movement = sBoxBombSecondBounceSpeed[offset];
        if (movement == SHORT_MAX) {
            movement = 0;
            gCurrentSprite.work2 += 1;
            gCurrentSprite.work4 = 0;
        } else {
            gCurrentSprite.work4 += 1;
        }
        gCurrentSprite.yPosition += movement;
    } else {
        if (gCurrentSprite.work2 == 6) {
            gCurrentSprite.pose = 0x18;
            gCurrentSprite.work1 = 60;
        } else {
            offset = gCurrentSprite.work4;
            movement = sBoxBombFallingSpeed[offset];
            if (movement == SHORT_MAX) {
                movement = sBoxBombFallingSpeed[gCurrentSprite.work4 - 1];
            } else {
                offset++;
                gCurrentSprite.work4 = offset;
            }
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition);
            if (gPreviousVerticalCollisionCheck != 0) {
                gCurrentSprite.yPosition = blockTop - 0x20;
                if (gCurrentSprite.work2 == 1) {
                    SoundPlay(0x271);
                }
                gCurrentSprite.work2 += 1;
                gCurrentSprite.work4 = 0;
                gCurrentSprite.work3 -= 2;
            } else {
                gCurrentSprite.yPosition += movement;
            }
        }
    }
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        gCurrentSprite.rotation += (6 - gCurrentSprite.work2) * 8;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
        if (gPreviousCollisionCheck == 0) {
            gCurrentSprite.xPosition += gCurrentSprite.work3;
        }
    } else {
        gCurrentSprite.rotation += (6 - gCurrentSprite.work2) * -8;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
        if (gPreviousCollisionCheck == 0) {
            gCurrentSprite.xPosition -= gCurrentSprite.work3;
        }
    }
}

void BoxBombLanded(void) {
    if (gCurrentSprite.health == 0) {
        gCurrentSprite.pose = 0x37;
    } else {
        if (--gCurrentSprite.work1 == 0) {
            SpriteSpawnSecondary(SSPRITE_BOX_FIRE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition, 0);
            SpriteSpawnSecondary(SSPRITE_BOX_FIRE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition, SS_FACING_RIGHT);
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0x22);
            gCurrentSprite.status = 0;
            SoundPlay(0x272);
        }
    }
}

void BoxBombExploding(void) {
    ParticleSet(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition, 0x32);
    gCurrentSprite.status = 0;
    SoundPlay(0x273);
}

void BoxFireInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawDistanceTop = 0x68;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x20;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x10;
    gCurrentSprite.hitboxRight = 0x10;
    gCurrentSprite.pOam = sBoxFireOam_MovingHigh;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
}

void BoxFireMovingHigh(void) {
    u16 hitboxTop;

    switch (gCurrentSprite.currentAnimationFrame) {
        case 0:
        case 1:
        case 2:
            hitboxTop = -0x20;
            break;
        case 3:
            hitboxTop = -0x40;
            break;
        case 4:
            hitboxTop = -0x60;
            if (gCurrentSprite.animationDurationCounter == 1) {
                SoundPlay(0x274);
            }
            break;
        case 6:
            hitboxTop = -0xc0;
            break;
        case 27:
            if (gCurrentSprite.animationDurationCounter == 1) {
                SoundPlay(0x275);
            }
        case 28:
            hitboxTop = -0x160;
            break;
        case 8:
        case 29:
        case 30:
            hitboxTop = -0x140;
            break;
        case 31:
            hitboxTop = -0x120;
            break;
        case 7:
        case 32:
            hitboxTop = -0x100;
            break;
        case 33:
            hitboxTop = -0xe0;
            break;
        case 5:
        case 34:
            hitboxTop = -0x80;
            break;
        case 35:
            hitboxTop = -0x60;
            break;
        default:
            hitboxTop = -0x180;
            break;
    }
    gCurrentSprite.hitboxTop = hitboxTop;
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sBoxFireOam_MovingLow;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.work1 = 60;
        gCurrentSprite.hitboxTop = -0x30;
    }
    if (!(gCurrentSprite.status & SS_FACING_RIGHT)) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition - 0x20);
        if (gPreviousCollisionCheck != 0) {
            gCurrentSprite.status = 0;
        } else {
            gCurrentSprite.xPosition += 3;
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition + 0x20);
        if (gPreviousCollisionCheck != 0) {
            gCurrentSprite.status = 0;
        } else {
            gCurrentSprite.xPosition -= 3;
        }
    }
}

void BoxFireMovingLow(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pOam = sBoxFireOam_MovingHigh;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 2;
        gCurrentSprite.hitboxTop = -0x20;
    }
    if (!(gCurrentSprite.status & SS_FACING_RIGHT)) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition - 0x20);
        if (gPreviousCollisionCheck != 0) {
            gCurrentSprite.status = 0;
        } else {
            gCurrentSprite.xPosition += 3;
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition + 0x20);
        if (gPreviousCollisionCheck != 0) {
            gCurrentSprite.status = 0;
        } else {
            gCurrentSprite.xPosition -= 3;
        }
    }
}

void BoxSpawnFallingDebris(void) {
    u16 y;
    u16 x;
    
    y = gCurrentSprite.yPosition;
    x = gCurrentSprite.xPosition;
    SpriteSpawnSecondary(0x4b, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0xe8, 0);
    SpriteSpawnSecondary(0x4b, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x + 0xbe, 0);
    SpriteSpawnSecondary(0x4b, 2, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0x156, 0);
    SpriteSpawnSecondary(0x4b, 3, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0xa0, 0);
    SpriteSpawnSecondary(0x4b, 4, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0x106, 0);
    SpriteSpawnSecondary(0x4b, 5, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x + 0xdc, 0);
    SpriteSpawnSecondary(0x4b, 6, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0x50, 0);
    SpriteSpawnSecondary(0x4b, 7, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0x124, 0);
    SpriteSpawnSecondary(0x4b, 8, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x + 0x8c, 0);
}

void BoxSetDebrisClipdata(u8 caa) {
    u16 y;
    u16 x;
    
    y = gCurrentSprite.yPosition;
    x = gCurrentSprite.xPosition;
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y-0xe0, x+0x20);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y-0xe0, x-0x20);
}

void BoxDebrisInit(void) {
    gCurrentSprite.status |= SS_HIDDEN;
    gCurrentSprite.drawDistanceTop = 0x40;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
    gCurrentSprite.hitboxTop = -0xf0;
    gCurrentSprite.hitboxBottom = 0x10;
    gCurrentSprite.hitboxLeft = -0x30;
    gCurrentSprite.hitboxRight = 0x30;
    gCurrentSprite.pOam = sBoxDebrisOam;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = 1;
    gCurrentSprite.properties |= 8;
    gCurrentSprite.drawOrder = 0xc;
    gCurrentSprite.samusCollision = 1;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    gCurrentSprite.xPosition -= 0x20;
    if (EventCheckAfter_BoxDefeated()) {
        gCurrentSprite.pose = 0x1e;
        gCurrentSprite.status &= ~SS_HIDDEN;
        if (gPreviousCollisionCheck == 0) {
            gCurrentSprite.status = 0;
        } else {
            BoxSetDebrisClipdata(CAA_MAKE_SOLID);
            BoxSpawnFallingDebris();
        }
    } else {
        gCurrentSprite.pose = 2;
        if (gPreviousCollisionCheck != 0) {
            gCurrentSprite.status = 0;
        }
    }
}

void BoxDebrisIdle(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
}

void BoxDebrisFallingInit(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.status &= ~SS_HIDDEN;
    gCurrentSprite.pose = 0x1a;
}

void BoxDebrisWaitToFall(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if ((u32)(((gCurrentSprite.xPosition / 4 - gBg1XPosition / 4) << 0x10) - 0x210000) >> 0x10 < 0xaf) {
        gCurrentSprite.work1 = 0;
        gCurrentSprite.work4 = 0;
        gCurrentSprite.pose = 0x1c;
        ScreenShakeStartHorizontal(40, 0x81);
        ScreenShakeStartVertical(40, 0x81);
        BoxSpawnFallingDebris();
        unk_3b1c(0x230);
    }
}

void BoxDebrisFalling(void) {
    u32 blockTop;
    u16 y;
    u16 x;
    u8 offset;
    s16 movement;
    u32 work1;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    gCurrentSprite.work1++;
    work1 = gCurrentSprite.work1;
    y = gCurrentSprite.yPosition;
    x = gCurrentSprite.xPosition;
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(y, x);
    if (gPreviousVerticalCollisionCheck != 0) {
        gCurrentSprite.yPosition = blockTop;
        gCurrentSprite.pose = 0x1e;
        ScreenShakeStartVertical(30, 0x81);
        ParticleSet(y, x, 0x31);
        ParticleSet(y, x+0x20,0x31);
        EventCheckAdvance(0x28);
        BoxSetDebrisClipdata(2);
        PlayMusic(0x18, 6);
    } else {
        offset = gCurrentSprite.work4;
        movement = sSpritesFallingSpeedFast[offset];
        if (movement == SHORT_MAX) {
            movement = sSpritesFallingSpeedFast[offset - 1];
            gCurrentSprite.yPosition += movement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += movement;
        }
        if ((work1 & 0xf) == 0) {
            ParticleSet(y, x, 0x34);
        } else if ((work1 + 4 & 0xf) == 0) {
            ParticleSet(y-0xa0, x+0x28, 0x33);
        } else if ((work1 + 8 & 0xf) == 0) {
            ParticleSet(y-0x82, x-0x28, 0x33);
        }
    }
}

void BoxFallingDebrisInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 4;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    switch (gCurrentSprite.roomSlot) {
        case 0:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_0;
            gCurrentSprite.drawDistanceTop = 0x30;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.hitboxTop = -0x88;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 0x44;
            gCurrentSprite.drawOrder = 0xb;
            gCurrentSprite.samusCollision = SSC_SOLID;
            gCurrentSprite.health = 1;
            gCurrentSprite.properties |= SP_SOLID_FOR_PROJECTILES;
            gCurrentSprite.work1 = 30;
            break;
        case 1:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_1;
            gCurrentSprite.drawOrder = 10;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 0x18;
            gCurrentSprite.work1 = 60;
            if (!EventCheckAfter_BoxDefeated()) {
                gCurrentSprite.yPosition += 0xc0;
            }
            break;
        case 2:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_2;
            gCurrentSprite.drawOrder = 10;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x10;
            gCurrentSprite.work1 = 40;
            break;
        case 3:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_3;
            gCurrentSprite.drawOrder = 10;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x10;
            gCurrentSprite.work1 = 80;
            break;
        case 4:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_4;
            gCurrentSprite.drawOrder = 9;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 8;
            gCurrentSprite.work1 = 100;
            break;
        case 5:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_5;
            gCurrentSprite.drawOrder = 9;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 8;
            gCurrentSprite.work1 = 120;
            if (!EventCheckAfter_BoxDefeated()) {
                gCurrentSprite.yPosition += 0xc0;
            }
            break;
        case 6:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_6;
            gCurrentSprite.drawOrder = 5;
            gCurrentSprite.drawDistanceTop = 0x18;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x10;
            gCurrentSprite.work1 = 10;
            break;
        case 7:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_7;
            gCurrentSprite.drawDistanceTop = 0x10;
            gCurrentSprite.drawDistanceBottom = 0x10;
            gCurrentSprite.drawDistanceHorizontal = 0x10;
            gCurrentSprite.work1 = 20;
            break;
        case 8:
            gCurrentSprite.pOam = sBoxFallingDebrisOam_8;
            gCurrentSprite.drawOrder = 3;
            gCurrentSprite.drawDistanceTop = 8;
            gCurrentSprite.drawDistanceBottom = 8;
            gCurrentSprite.drawDistanceHorizontal = 8;
            gCurrentSprite.work1 = 60;
            if (!EventCheckAfter_BoxDefeated()) {
                gCurrentSprite.yPosition += 0xc0;
            }
            break;
        default:
            gCurrentSprite.status = 0;
            break;
    }
    if (EventCheckAfter_BoxDefeated()) {
        gCurrentSprite.pose = 0x1e;
    } else {
        gCurrentSprite.pose = 2;
    }
}

#ifdef NON_MATCHING
void BoxFallingDebrisFalling(void) {
    // https://decomp.me/scratch/bBJyP
    u32 blockTop;
    u16 y;
    u16 x;
    u8 offset;
    s16 movement;
    u8 work2;
    u8 roomSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.work1--;
    } else {
        gCurrentSprite.work2++;
        work2 = gCurrentSprite.work2;
        y = gCurrentSprite.yPosition;
        x = gCurrentSprite.xPosition;
        roomSlot = gCurrentSprite.roomSlot;
        if (gCurrentSprite.work3 < UCHAR_MAX) {
            gCurrentSprite.work3 += 1;
        }
        if (gCurrentSprite.work3 > 50) {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(y, x);
            if (gPreviousVerticalCollisionCheck != 0) {
                gCurrentSprite.yPosition = blockTop;
                gCurrentSprite.pose = 0x1e;
                if (roomSlot == 0) {
                    ScreenShakeStartVertical(30, 0x81);
                    ParticleSet(y, x-0x20, 0x31);
                    ParticleSet(y, x+0x20, 0x31);
                } else if (roomSlot == 1 || roomSlot == 6) {
                    ParticleSet(y, x, 0x31);
                } else if (roomSlot == 2 || roomSlot == 3 || roomSlot == 7) {
                    ParticleSet(y, x-0x10, 0x27);
                    ParticleSet(y, x+0x10, 0x27);
                } else {
                    ParticleSet(y, x, 0x27);
                }
                return;
            }
        }
        if (roomSlot == 0) {
            if ((work2 & 0xf) == 0) {
                ParticleSet(y, x, 0x31);
            } else if ((work2 + 4 & 0xf) == 0) {
                ParticleSet(y-0xa0, x+0x32, 0x2e);
            } else if ((work2 + 8 & 0xf) == 0) {
                ParticleSet(y, x-0x20, 0x33);
            }
            offset = gCurrentSprite.work4;
            movement = sSpritesFallingSpeedFast[offset];
            if (movement == SHORT_MAX) {
                movement = sSpritesFallingSpeedFast[offset - 1];
                gCurrentSprite.yPosition += movement;
            } else {
                offset++;
                gCurrentSprite.work4 = offset;
                gCurrentSprite.yPosition += movement;
            }
        } else if (roomSlot == 1 || roomSlot == 6) {
            if ((work2 & 0x1f) == 0) {
                ParticleSet(y, x, 0x27);
            }
            offset = gCurrentSprite.work4;
            movement = sSpritesFallingSpeedQuickAcceleration[offset];
            if (movement == SHORT_MAX) {
                movement = sSpritesFallingSpeedQuickAcceleration[offset - 1];
                gCurrentSprite.yPosition += movement;
            } else {
                offset++;
                gCurrentSprite.work4 = offset;
                gCurrentSprite.yPosition += movement;
            }
        } else if (roomSlot == 2 || roomSlot == 3 || roomSlot == 7) {
            if ((work2 + 7 & 0x1f) == 0) {
                ParticleSet(y, x, 0x33);
            }
            offset = gCurrentSprite.work4;
            movement = sSpritesFallingSpeed[offset];
            if (movement == SHORT_MAX) {
                movement = sSpritesFallingSpeed[offset - 1];
                gCurrentSprite.yPosition += movement;
            } else {
                offset++;
                gCurrentSprite.work4 = offset;
                gCurrentSprite.yPosition += movement;
            }
        } else {
            offset = gCurrentSprite.work4;
            movement = sSpritesFallingSpeedSlow[offset];
            if (movement == SHORT_MAX) {
                movement = sSpritesFallingSpeedSlow[offset - 1];
                gCurrentSprite.yPosition += movement;
            } else {
                offset++;
                gCurrentSprite.work4 = offset;
                gCurrentSprite.yPosition += movement;
            }
        }
    }
}
#else
NAKED_FUNCTION
void BoxFallingDebrisFalling(void) {
    asm(" \n\
	push {r4, r5, r6, r7, lr} \n\
	mov r7, r8 \n\
	push {r7} \n\
	ldr r4, _08038334 @ =gCurrentSprite \n\
	add r1, r4, #0 \n\
	add r1, #0x26 \n\
	movs r0, #1 \n\
	strb r0, [r1] \n\
	add r1, #8 \n\
	ldrb r0, [r1] \n\
	cmp r0, #0 \n\
	beq _08038338 \n\
	sub r0, #1 \n\
	strb r0, [r1] \n\
	b _08038542 \n\
	.align 2, 0 \n\
_08038334: .4byte gCurrentSprite \n\
_08038338: \n\
	add r1, r4, #0 \n\
	add r1, #0x2f \n\
	ldrb r0, [r1] \n\
	add r0, #1 \n\
	strb r0, [r1] \n\
	ldrb r6, [r1] \n\
	ldrh r7, [r4, #2] \n\
	ldrh r0, [r4, #4] \n\
	mov r8, r0 \n\
	ldrb r5, [r4, #0x1e] \n\
	add r1, #1 \n\
	ldrb r0, [r1] \n\
	cmp r0, #0xfe \n\
	bhi _08038358 \n\
	add r0, #1 \n\
	strb r0, [r1] \n\
_08038358: \n\
	ldrb r0, [r1] \n\
	cmp r0, #0x32 \n\
	bls _080383DE \n\
	add r0, r7, #0 \n\
	mov r1, r8 \n\
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes \n\
	add r1, r0, #0 \n\
	ldr r0, _08038398 @ =gPreviousVerticalCollisionCheck \n\
	ldrb r0, [r0] \n\
	cmp r0, #0 \n\
	beq _080383DE \n\
	strh r1, [r4, #2] \n\
	add r1, r4, #0 \n\
	add r1, #0x24 \n\
	movs r0, #0x1e \n\
	strb r0, [r1] \n\
	cmp r5, #0 \n\
	bne _0803839C \n\
	movs r1, #0x81 \n\
	bl ScreenShakeStartVertical \n\
	mov r1, r8 \n\
	sub r1, #0x20 \n\
	add r0, r7, #0 \n\
	movs r2, #0x31 \n\
	bl ParticleSet \n\
	mov r1, r8 \n\
	add r1, #0x20 \n\
	add r0, r7, #0 \n\
	b _080383A8 \n\
	.align 2, 0 \n\
_08038398: .4byte gPreviousVerticalCollisionCheck \n\
_0803839C: \n\
	cmp r5, #1 \n\
	beq _080383A4 \n\
	cmp r5, #6 \n\
	bne _080383B0 \n\
_080383A4: \n\
	add r0, r7, #0 \n\
	mov r1, r8 \n\
_080383A8: \n\
	movs r2, #0x31 \n\
	bl ParticleSet \n\
	b _08038542 \n\
_080383B0: \n\
	sub r0, r5, #2 \n\
	lsl r0, r0, #0x18 \n\
	lsr r0, r0, #0x18 \n\
	cmp r0, #1 \n\
	bls _080383BE \n\
	cmp r5, #7 \n\
	bne _080383D2 \n\
_080383BE: \n\
	mov r1, r8 \n\
	sub r1, #0x10 \n\
	add r0, r7, #0 \n\
	movs r2, #0x27 \n\
	bl ParticleSet \n\
	mov r1, r8 \n\
	add r1, #0x10 \n\
	add r0, r7, #0 \n\
	b _080383D6 \n\
_080383D2: \n\
	add r0, r7, #0 \n\
	mov r1, r8 \n\
_080383D6: \n\
	movs r2, #0x27 \n\
	bl ParticleSet \n\
	b _08038542 \n\
_080383DE: \n\
	cmp r5, #0 \n\
	bne _0803845C \n\
	movs r1, #0xf \n\
	add r0, r6, #0 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	bne _080383F8 \n\
	add r0, r7, #0 \n\
	mov r1, r8 \n\
	movs r2, #0x31 \n\
	bl ParticleSet \n\
	b _08038426 \n\
_080383F8: \n\
	add r0, r6, #4 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	bne _08038410 \n\
	add r0, r7, #0 \n\
	sub r0, #0xa0 \n\
	mov r1, r8 \n\
	add r1, #0x32 \n\
	movs r2, #0x2e \n\
	bl ParticleSet \n\
	b _08038426 \n\
_08038410: \n\
	add r0, r6, #0 \n\
	add r0, #8 \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	bne _08038426 \n\
	mov r1, r8 \n\
	sub r1, #0x20 \n\
	add r0, r7, #0 \n\
	movs r2, #0x33 \n\
	bl ParticleSet \n\
_08038426: \n\
	ldr r3, _08038450 @ =gCurrentSprite \n\
	add r6, r3, #0 \n\
	add r6, #0x31 \n\
	ldrb r2, [r6] \n\
	ldr r5, _08038454 @ =sSpritesFallingSpeedFast \n\
	lsl r0, r2, #1 \n\
	add r0, r0, r5 \n\
	ldrh r4, [r0] \n\
	movs r7, #0 \n\
	ldrsh r1, [r0, r7] \n\
	ldr r0, _08038458 @ =0x00007FFF \n\
	cmp r1, r0 \n\
	beq _08038442 \n\
	b _08038538 \n\
_08038442: \n\
	sub r1, r2, #1 \n\
	lsl r1, r1, #1 \n\
	add r1, r1, r5 \n\
	ldrh r0, [r3, #2] \n\
	ldrh r1, [r1] \n\
	add r0, r0, r1 \n\
	b _08038540 \n\
	.align 2, 0 \n\
_08038450: .4byte gCurrentSprite \n\
_08038454: .4byte sSpritesFallingSpeedFast \n\
_08038458: .4byte 0x00007FFF \n\
_0803845C: \n\
	cmp r5, #1 \n\
	beq _08038464 \n\
	cmp r5, #6 \n\
	bne _080384AC \n\
_08038464: \n\
	movs r0, #0x1f \n\
	and r6, r0 \n\
	cmp r6, #0 \n\
	bne _08038476 \n\
	add r0, r7, #0 \n\
	mov r1, r8 \n\
	movs r2, #0x27 \n\
	bl ParticleSet \n\
_08038476: \n\
	ldr r3, _080384A0 @ =gCurrentSprite \n\
	add r6, r3, #0 \n\
	add r6, #0x31 \n\
	ldrb r2, [r6] \n\
	ldr r5, _080384A4 @ =sSpritesFallingSpeedQuickAcceleration \n\
	lsl r0, r2, #1 \n\
	add r0, r0, r5 \n\
	ldrh r4, [r0] \n\
	movs r7, #0 \n\
	ldrsh r1, [r0, r7] \n\
	ldr r0, _080384A8 @ =0x00007FFF \n\
	cmp r1, r0 \n\
	bne _08038538 \n\
	sub r1, r2, #1 \n\
	lsl r1, r1, #1 \n\
	add r1, r1, r5 \n\
	ldrh r0, [r3, #2] \n\
	ldrh r1, [r1] \n\
	add r0, r0, r1 \n\
	b _08038540 \n\
	.align 2, 0 \n\
_080384A0: .4byte gCurrentSprite \n\
_080384A4: .4byte sSpritesFallingSpeedQuickAcceleration \n\
_080384A8: .4byte 0x00007FFF \n\
_080384AC: \n\
	sub r0, r5, #2 \n\
	lsl r0, r0, #0x18 \n\
	lsr r0, r0, #0x18 \n\
	cmp r0, #1 \n\
	bls _080384BA \n\
	cmp r5, #7 \n\
	bne _08038504 \n\
_080384BA: \n\
	add r0, r6, #7 \n\
	movs r1, #0x1f \n\
	and r0, r1 \n\
	cmp r0, #0 \n\
	bne _080384CE \n\
	add r0, r7, #0 \n\
	mov r1, r8 \n\
	movs r2, #0x33 \n\
	bl ParticleSet \n\
_080384CE: \n\
	ldr r3, _080384F8 @ =gCurrentSprite \n\
	add r6, r3, #0 \n\
	add r6, #0x31 \n\
	ldrb r2, [r6] \n\
	ldr r5, _080384FC @ =sSpritesFallingSpeed \n\
	lsl r0, r2, #1 \n\
	add r0, r0, r5 \n\
	ldrh r4, [r0] \n\
	movs r7, #0 \n\
	ldrsh r1, [r0, r7] \n\
	ldr r0, _08038500 @ =0x00007FFF \n\
	cmp r1, r0 \n\
	bne _08038538 \n\
	sub r1, r2, #1 \n\
	lsl r1, r1, #1 \n\
	add r1, r1, r5 \n\
	ldrh r0, [r3, #2] \n\
	ldrh r1, [r1] \n\
	add r0, r0, r1 \n\
	b _08038540 \n\
	.align 2, 0 \n\
_080384F8: .4byte gCurrentSprite \n\
_080384FC: .4byte sSpritesFallingSpeed \n\
_08038500: .4byte 0x00007FFF \n\
_08038504: \n\
	ldr r3, _0803852C @ =gCurrentSprite \n\
	add r6, r3, #0 \n\
	add r6, #0x31 \n\
	ldrb r2, [r6] \n\
	ldr r5, _08038530 @ =sSpritesFallingSpeedSlow \n\
	lsl r0, r2, #1 \n\
	add r0, r0, r5 \n\
	ldrh r4, [r0] \n\
	movs r7, #0 \n\
	ldrsh r1, [r0, r7] \n\
	ldr r0, _08038534 @ =0x00007FFF \n\
	cmp r1, r0 \n\
	bne _08038538 \n\
	sub r1, r2, #1 \n\
	lsl r1, r1, #1 \n\
	add r1, r1, r5 \n\
	ldrh r0, [r3, #2] \n\
	ldrh r1, [r1] \n\
	add r0, r0, r1 \n\
	b _08038540 \n\
	.align 2, 0 \n\
_0803852C: .4byte gCurrentSprite \n\
_08038530: .4byte sSpritesFallingSpeedSlow \n\
_08038534: .4byte 0x00007FFF \n\
_08038538: \n\
	add r0, r2, #1 \n\
	strb r0, [r6] \n\
	ldrh r0, [r3, #2] \n\
	add r0, r0, r4 \n\
_08038540: \n\
	strh r0, [r3, #2] \n\
_08038542: \n\
	pop {r3} \n\
	mov r8, r3 \n\
	pop {r4, r5, r6, r7} \n\
	pop {r0} \n\
	bx r0 \n\
    ");
}
#endif

void Box(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            BoxInit();
            break;
        case 1:
            BoxCrawlingInit();
        case 2:
            BoxCrawling();
            break;
        case 0x17:
            BoxWaitingToRunInit();
        case 0x18:
            BoxWaitingToRun();
            break;
        case 0x19:
            BoxSlowRunningInit();
        case 0x1a:
            BoxSlowRun();
            break;
        case 0x1b:
            BoxFastRunInit();
        case 0x1c:
            BoxFastRun();
            break;
        case 0x1d:
            BoxSkiddingInit();
        case 0x1e:
            BoxSkidding();
            break;
        case 0x1f:
            BoxStopSkiddingInit();
        case 0x20:
            BoxStopSkidding();
            break;
        case 7:
            BoxFinishedCrawlingInit();
        case 8:
            BoxFinishedCrawling();
            break;
        case 0x37:
            BoxBonkingInit();
        case 0x38:
            BoxBonking();
            break;
        case 0x4b:
            BoxLandingFromBonkInit();
        case 0x4c:
            BoxLandingFromBonk();
            break;
        case 0x39:
            BoxLandingInit();
        case 0x3a:
            BoxLanding();
            break;
        case 0x3b:
            BoxJumpWarningInit();
        case 0x3c:
            BoxJumpWarning();
            break;
        case 0x3d:
            BoxJumpingInit();
        case 0x3e:
            BoxJumping();
            break;
        case 0x27:
            BoxStoppingToFireBombInit();
        case 0x28:
            BoxStoppingToFireBomb();
            break;
        case 0x29:
            BoxLoweringToFireBombInit();
        case 0x2a:
            BoxLoweringToFireBomb();
            break;
        case 0x2c:
            BoxFiringBomb();
            break;
        case 0x2e:
            BoxDoneFiringBomb();
            break;
        case 0x3f:
            BoxWaitingToEmergeInit();
        case 0x40:
            BoxWaitingToEmerge();
            break;
        case 0x41:
            BoxFirstJumpInit();
        case 0x42:
            BoxFirstJump();
            break;
        case 0x43:
            BoxDefeatedInit();
        case 0x44:
            BoxDefeated();
            break;
        case 0x45:
            BoxMovingToFinalJumpInit();
        case 0x46:
            BoxMovingToFinalJump();
            break;
        case 0x47:
            BoxWaitingForFinalJumpInit();
        case 0x48:
            BoxWaitingForFinalJump();
            break;
        case 0x49:
            BoxCrouchingForFinalJumpInit();
        case 0x4a:
            BoxCrouchingForFinalJump();
            break;
        case 0x4d:
            BoxFinalJumpInit();
        case 0x4e:
            BoxFinalJump();
    }
    SpriteUtilUpdateSubSpriteData1Animation();
    SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
}

void BoxPart(void) {
    if (gCurrentSprite.pose == 0) {
        BoxPartInit();
        return;
    }
    switch (gCurrentSprite.roomSlot) {
        case BOX_PART_FRONT_LEFT_LEG_COVER: {
            if (SPRITE_HAS_ISFT(gCurrentSprite) < (gSubSpriteData1.work0 & 0x7f)) {
                gCurrentSprite.invincibilityStunFlashTimer = gSubSpriteData1.work0;
            }
            BoxPartFrontLeftLeg();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        }
        case BOX_PART_FRONT_RIGHT_LEG_COVER: {
            if (SPRITE_HAS_ISFT(gCurrentSprite) < (gSubSpriteData1.work0 & 0x7f)) {
                gCurrentSprite.invincibilityStunFlashTimer = gSubSpriteData1.work0;
            }
            BoxPartFrontRightLeg();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        }
        case BOX_PART_CENTER: {
            gSubSpriteData1.work0 = gCurrentSprite.invincibilityStunFlashTimer;
            BoxPartCenter();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        }
        case BOX_PART_CENTER_BOTTOM: {
            if (SPRITE_HAS_ISFT(gCurrentSprite) < (gSubSpriteData1.work0 & 0x7f)) {
                gCurrentSprite.invincibilityStunFlashTimer = gSubSpriteData1.work0;
            }
            BoxPartCenterBottom();
            SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position();
            break;
        }
        default: {
            if (SPRITE_HAS_ISFT(gCurrentSprite) < (gSubSpriteData1.work0 & 0x7f)) {
                gCurrentSprite.invincibilityStunFlashTimer = gSubSpriteData1.work0;
            }
            BoxPartDefault();
            BoxSyncSubSprites();
            break;
        }
    }
}

void BoxMissile(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            BoxMissileInit();
            break;
        case 2:
            BoxMissileSpawning();
            break;
        case 0x18:
            BoxMissileMoving();
            break;
        case 0x37:
            BoxMissileExploding();
            break;
    }
}

void BoxBomb(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            BoxBombInit();
            break;
        case 2:
            BoxBombMoving();
            break;
        case 0x18:
            BoxBombLanded();
            break;
        case 0x37:
            BoxBombExploding();
            break;
    }
}

void BoxFire(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            BoxFireInit();
        case 2:
            BoxFireMovingHigh();
            break;
        case 0x18:
            BoxFireMovingLow();
            break;
    }
}

void BoxDebris(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            BoxDebrisInit();
            break;
        case 2:
            BoxDebrisIdle();
            break;
        case 0x18:
            BoxDebrisFallingInit();
            break;
        case 0x1a:
            BoxDebrisWaitToFall();
            break;
        case 0x1c:
            BoxDebrisFalling();
            break;
    }
}

void BoxFallingDebris(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            BoxFallingDebrisInit();
            break;
        case 2:
            BoxFallingDebrisFalling();
            break;
    }
}
