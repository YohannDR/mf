#include "macros.h"
#include "globals.h"

#include "data/frame_data_pointers.h"
#include "data/sprite_data.h"
#include "data/sprites/box.h"

#include "constants/audio.h"
#include "constants/event.h"
#include "constants/particle.h"

#include "structs/samus.h"
#include "structs/clipdata.h"

#define BOX_POSE_CRAWLING_INIT 1
#define BOX_POSE_CRAWLING 2
#define BOX_POSE_WAITING_TO_RUN_INIT 0x17
#define BOX_POSE_WAITING_TO_RUN 0x18
#define BOX_POSE_SLOW_RUN_INIT 0x19
#define BOX_POSE_SLOW_RUN 0x1a
#define BOX_POSE_FAST_RUN_INIT 0x1b
#define BOX_POSE_FAST_RUN 0x1c
#define BOX_POSE_SKIDDING_INIT 0x1d
#define BOX_POSE_SKIDDING 0x1e
#define BOX_POSE_STOP_SKIDDING_INIT 0x1f
#define BOX_POSE_STOP_SKIDDING 0x20
#define BOX_POSE_FINISHED_CRAWLING_INIT 7
#define BOX_POSE_FINISHED_CRAWLING 8
#define BOX_POSE_BONKING_INIT 0x37
#define BOX_POSE_BONKING 0x38
#define BOX_POSE_LANDING_FROM_BONK_INIT 0x4b
#define BOX_POSE_LANDING_FROM_BONK 0x4c
#define BOX_POSE_LANDING_INIT 0x39
#define BOX_POSE_LANDING 0x3a
#define BOX_POSE_JUMP_WARNING_INIT 0x3b
#define BOX_POSE_JUMP_WARNING 0x3c
#define BOX_POSE_JUMPING_INIT 0x3d
#define BOX_POSE_JUMPING 0x3e
#define BOX_POSE_STOPPING_TO_FIRE_BOMB_INIT 0x27
#define BOX_POSE_STOPPING_TO_FIRE_BOMB 0x28
#define BOX_POSE_LOWERING_TO_FIRE_BOMB_INIT 0x29
#define BOX_POSE_LOWERING_TO_FIRE_BOMB 0x2a
#define BOX_POSE_FIRING_BOMB 0x2c
#define BOX_POSE_DONE_FIRING_BOMB 0x2e
#define BOX_POSE_WAITING_TO_EMERGE_INIT 0x3f
#define BOX_POSE_WAITING_TO_EMERGE 0x40
#define BOX_POSE_FIRST_JUMP_INIT 0x41
#define BOX_POSE_FIRST_JUMP 0x42
#define BOX_POSE_DEFEATED_INIT 0x43
#define BOX_POSE_DEFEATED 0x44
#define BOX_POSE_MOVING_TO_FINAL_JUMP_INIT 0x45
#define BOX_POSE_MOVING_TO_FINAL_JUMP 0x46
#define BOX_POSE_WAITING_FOR_FINAL_JUMP_INIT 0x47
#define BOX_POSE_WAITING_FOR_FINAL_JUMP 0x48
#define BOX_POSE_CROUCHING_FOR_FINAL_JUMP_INIT 0x49
#define BOX_POSE_CROUCHING_FOR_FINAL_JUMP 0x4a
#define BOX_POSE_FINAL_JUMP_INIT 0x4d
#define BOX_POSE_FINAL_JUMP 0x4e

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
        gCurrentSprite.pose = BOX_POSE_WAITING_TO_EMERGE_INIT;
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
    gCurrentSprite.pose = BOX_POSE_WAITING_TO_EMERGE;
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
            ParticleSet(y, x, PE_TAIL_EXPLOSION_SMOKE);
            break;
        case 4:
            ParticleSet(y, x, PE_0x2F);
            break;
        case 8:
            ParticleSet(y-0x1c, x+0x1c, PE_TAIL_EXPLOSION_SMOKE);
            break;
        case 16:
            ParticleSet(y+0x20, x-0x20, PE_0x2F);
            break;
        case 20:
            ParticleSet(y-0x1c, x-0x2e, PE_TAIL_EXPLOSION_SMOKE);
            break;
        case 24:
            ParticleSet(y+0x40, x-0x40, PE_0x2F);
            break;
        case 28:
            ParticleSet(y+0x58, x, PE_0x2F);
            break;
        case 32:
            ParticleSet(y-0x5a, x+0x10, PE_0x2F);
            break;
        case 36:
            gCurrentSprite.work1 = UCHAR_MAX;
    }
    gCurrentSprite.work1++;
    if (SpriteUtilCheckSamusNearSpriteLeftRight(0x200, 0x200) == NSLR_LEFT) {
        gCurrentSprite.pose = BOX_POSE_FIRST_JUMP_INIT;
        ParticleSet(y, x-0xa0, PE_0x2F);
        PlayMusic(MUSIC_BOX_BATTLE, 7);
    }
}

void BoxFirstJumpInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Jumping;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_FIRST_JUMP;
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
        gCurrentSprite.pose = BOX_POSE_SLOW_RUN_INIT;
        ParticleSet(gSubSpriteData1.yPosition, gSubSpriteData1.xPosition + 0xb4, PE_0x35);
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
    gCurrentSprite.pose = BOX_POSE_WAITING_TO_RUN;
    gCurrentSprite.work1 = 0;
    SoundPlay(0x26a);
}

void BoxWaitingToRun(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim() && ++gCurrentSprite.work1 == 1) {
        gCurrentSprite.pose = BOX_POSE_SLOW_RUN_INIT;
    }
    if (gCurrentSprite.work2 != 0) {
        gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
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
    gCurrentSprite.pose = BOX_POSE_SLOW_RUN;
    gCurrentSprite.work1 = 0;
}

void BoxSlowRun(void) {
    if (gSubSpriteData1.currentAnimationFrame == 3 && gSubSpriteData1.animationDurationCounter == 1) {
        SoundPlay(0x262);
    }
    if (!BoxXMovement(gCurrentSprite.work1, BOX_POSE_BONKING_INIT)) {
        if (SpriteUtilCheckNearEndSubSprite1Anim() && ++gCurrentSprite.work1 == 7) {
            gCurrentSprite.pose = BOX_POSE_FAST_RUN_INIT;
        }
        if (gCurrentSprite.work2 != 0) {
            gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
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
    gCurrentSprite.pose = BOX_POSE_FAST_RUN;
    gCurrentSprite.work1 = 10;
}

void BoxFastRun(void) {
    if (gSubSpriteData1.currentAnimationFrame == 3 && gSubSpriteData1.animationDurationCounter == 1) {
        SoundPlay(0x262);
    }
    if (!BoxXMovement(8, BOX_POSE_BONKING_INIT)) {
        if (gCurrentSprite.work1 != 0) {
            gCurrentSprite.work1--;
            return;
        } else {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                if (gSubSpriteData1.xPosition - 200 > gSamusData.xPosition) {
                    gCurrentSprite.pose = BOX_POSE_SKIDDING_INIT;
                }
            } else {
                if (gSubSpriteData1.xPosition + 200 < gSamusData.xPosition) {
                    gCurrentSprite.pose = BOX_POSE_SKIDDING_INIT;
                }
            }
        }
    }
    if (gCurrentSprite.work2 != 0) {
        gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
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
    gCurrentSprite.pose = BOX_POSE_SKIDDING;
    gCurrentSprite.work1 = 0x20;
    SoundPlay(0x263);
}

void BoxSkidding(void) {
    u8 collidedPose;

    if (gCurrentSprite.work1 / 4 > 5) {
        collidedPose = BOX_POSE_BONKING_INIT;
    } else {
        collidedPose = BOX_POSE_STOP_SKIDDING_INIT;
    }
    if (!BoxXMovement(gCurrentSprite.work1 / 4, collidedPose)) {
        if (--gCurrentSprite.work1 == 0) {
            gCurrentSprite.pose = BOX_POSE_STOP_SKIDDING_INIT;
        }
        if (gCurrentSprite.work2 != 0) {
            gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
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
    gCurrentSprite.pose = BOX_POSE_STOP_SKIDDING;
}

void BoxStopSkidding(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
        gCurrentSprite.work2 = 3;
    } else {
        if (gCurrentSprite.work2 != 0) {
            gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
        }
    }
}

void BoxBonkingInit(void) {
    gSubSpriteData1.yPosition -= 0x10;
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Jumping;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_BONKING;
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
        gCurrentSprite.pose = BOX_POSE_LANDING_FROM_BONK_INIT;
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
    gCurrentSprite.pose = BOX_POSE_LANDING_FROM_BONK;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work4 = 0;
    SoundPlay(0x266);
}

void BoxLandingFromBonk(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = BOX_POSE_WAITING_TO_RUN_INIT;
    }
}

void BoxLandingInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Landing;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_LANDING;
    gCurrentSprite.work4 = 0;
    SoundPlay(0x266);
}

void BoxLanding(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        if (gCurrentSprite.work2 == 0) {
            gCurrentSprite.pose = BOX_POSE_STOPPING_TO_FIRE_BOMB_INIT;
        } else {
            gCurrentSprite.work2--;
            if ((gCurrentSprite.work2 & 0x7f) == 0) {
                gCurrentSprite.work2 = 0;
            }
            gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
        }
    }
}

void BoxFinishedCrawlingInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FinishedCrawling;
    gCurrentSprite.work1 = 2;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_FINISHED_CRAWLING;
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
                gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
            } else {
                if (gCurrentSprite.work2 != 0) {
                    gCurrentSprite.pose = BOX_POSE_JUMP_WARNING_INIT;
                } else {
                    gCurrentSprite.pose = BOX_POSE_SLOW_RUN_INIT;
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
        gCurrentSprite.pose = BOX_POSE_JUMP_WARNING;
    }
}

void BoxJumpWarning(void) {
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = BOX_POSE_JUMPING_INIT;
    }
}

void BoxJumpingInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Jumping;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_JUMPING;
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
        gCurrentSprite.pose = BOX_POSE_LANDING_INIT;
    } else {
        offset++;
        gCurrentSprite.work4 = offset;
        gSubSpriteData1.yPosition += movement;
        BoxXMovement(0xc, BOX_POSE_BONKING_INIT);
    }
}

void BoxStoppingToFireBombInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FinishedCrawling;
    gCurrentSprite.work1 = 3;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_STOPPING_TO_FIRE_BOMB;
    SoundPlay(0x264);
}

void BoxStoppingToFireBomb(void) {
    if (gCurrentSprite.work1 > 1) {
        if (SpriteUtilCheckEndSubSprite1Anim()) {
            gCurrentSprite.work1--;
        }
    } else {
        if (SpriteUtilCheckNearEndSubSprite1Anim()) {
            gCurrentSprite.pose = BOX_POSE_LOWERING_TO_FIRE_BOMB_INIT;
        }
    }
}

void BoxLoweringToFireBombInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_LoweringToFireBomb;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_LOWERING_TO_FIRE_BOMB;
    SoundPlay(0x268);
}

void BoxLoweringToFireBomb(void) {
    if (SpriteUtilCheckEndSubSprite1Anim()) {
        gCurrentSprite.pose = BOX_POSE_FIRING_BOMB;
        gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_FiringBomb;
        gSubSpriteData1.animationDurationCounter = 0;
        gSubSpriteData1.currentAnimationFrame = 0;
    }
}

void BoxFiringBomb(void) {
    u16 x;
    u16 y;

    if (SpriteUtilCheckEndSubSprite1Anim()) {
        gCurrentSprite.pose = BOX_POSE_DONE_FIRING_BOMB;
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
        gCurrentSprite.pose = BOX_POSE_WAITING_TO_RUN_INIT;
    }
}

void BoxDefeatedInit(void) {
    gCurrentSprite.pOam = sBoxPartOam_Brain;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = BOX_POSE_DEFEATED;
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
            gCurrentSprite.pose = BOX_POSE_MOVING_TO_FINAL_JUMP_INIT;
        }
    }
}

void BoxMovingToFinalJumpInit(void) {
    u8 debrisRamSlot;

    gCurrentSprite.pOam = sBoxPartOam_Brain;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_MOVING_TO_FINAL_JUMP;
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
            gCurrentSprite.paletteRow = 11;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
    if ((gSubSpriteData1.xPosition & 0xfff8) == (gCurrentSprite.unk_8 & 0xfff8)) {
        gCurrentSprite.pose = BOX_POSE_WAITING_FOR_FINAL_JUMP_INIT;
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
    gCurrentSprite.pose = BOX_POSE_WAITING_FOR_FINAL_JUMP;
    SoundPlay(0x276);
}

void BoxWaitingForFinalJump(void) {
    u16 xPosOnScreen;

    if ((gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 11;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
    xPosOnScreen = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition);
    if (xPosOnScreen > 0x18 && xPosOnScreen < SCREEN_SIZE_X - 0x18) {
        if (SpriteUtilCheckNearEndSubSprite1Anim()) {
            gCurrentSprite.pose = BOX_POSE_CROUCHING_FOR_FINAL_JUMP_INIT;
        }
    }
}

void BoxCrouchingForFinalJumpInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_JumpWarning;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_CROUCHING_FOR_FINAL_JUMP;
}

void BoxCrouchingForFinalJump(void) {
    if ((gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 11;
        } else {
            gCurrentSprite.paletteRow = 0;
        }
    }
    if (SpriteUtilCheckNearEndSubSprite1Anim()) {
        gCurrentSprite.pose = BOX_POSE_FINAL_JUMP_INIT;
        unk_36c4();
    }
}

void BoxFinalJumpInit(void) {
    gSubSpriteData1.pMultiOam = sBoxMultiSpriteData_Jumping;
    gSubSpriteData1.animationDurationCounter = 0;
    gSubSpriteData1.currentAnimationFrame = 0;
    gCurrentSprite.pose = BOX_POSE_FINAL_JUMP;
    gCurrentSprite.work1 = 30;
    SoundPlay(0x277);
}

void BoxFinalJump(void) {
    if ((gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 11;
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
    gCurrentSprite.pose = BOX_POSE_CRAWLING;
}

void BoxCrawling(void) {
    BoxXMovement(1, BOX_POSE_FINISHED_CRAWLING_INIT);
}

void BoxPartSetBoxWorkVar2(u8 ramSlot, u8 value) {
    if (gSpriteData[ramSlot].work2 < value) {
        gSpriteData[ramSlot].work2 = value;
    }
}

void BoxPartCenterSetImmunity(u8 ramSlot) {
    switch (gSpriteData[ramSlot].pose) {
        case BOX_POSE_LOWERING_TO_FIRE_BOMB_INIT:
        case BOX_POSE_LOWERING_TO_FIRE_BOMB:
        case BOX_POSE_FIRING_BOMB:
            if ((gSpriteData[ramSlot].work0 & 3) != 0) {
                gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
            } else {
                gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;
            }
            break;
        case BOX_POSE_WAITING_TO_EMERGE_INIT:
        case BOX_POSE_WAITING_TO_EMERGE:
        case BOX_POSE_FIRST_JUMP_INIT:
        case BOX_POSE_FIRST_JUMP:
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
    if (gSpriteData[brainRamSlot].pose == BOX_POSE_DEFEATED && gCurrentSprite.pOam != sBoxPartOam_FrontLeftLegCoverDamaged) {
        ParticleSet(y+0x3c, x, PE_0x30);
        gCurrentSprite.pOam = sBoxPartOam_FrontLeftLegCoverDamaged;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
    if ((gSpriteData[brainRamSlot].work0 & 4) == 0 && (gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 11;
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
    if (gSpriteData[brainRamSlot].pose == BOX_POSE_DEFEATED && gCurrentSprite.pOam != sBoxPartOam_FrontRightLegCoverDamaged) {
        ParticleSet(y+0x3c, x, PE_0x30);
        gCurrentSprite.pOam = sBoxPartOam_FrontRightLegCoverDamaged;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
    }
    if ((gSpriteData[brainRamSlot].work0 & 4) == 0 && (gFrameCounter8Bit & 7) == 0) {
        if ((gFrameCounter8Bit & 8) != 0) {
            gCurrentSprite.paletteRow = 11;
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
                gCurrentSprite.paletteRow = 12;
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
        ParticleSet(y+0x32, x, PE_0x2F);
        gSpriteData[brainRamSlot].pose = BOX_POSE_DEFEATED_INIT;
    } else if (gCurrentSprite.health < maxHealth / 4) {
        if (gCurrentSprite.pOam != sBoxPartOam_CenterHeavilyDamaged) {
            gCurrentSprite.pOam = sBoxPartOam_CenterHeavilyDamaged;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            ParticleSet(y+0x24, x, PE_0x30);
        }
    } else if (gCurrentSprite.health < maxHealth / 2) {
        if (gCurrentSprite.pOam != sBoxPartOam_CenterModeratelyDamaged) {
            gCurrentSprite.pOam = sBoxPartOam_CenterModeratelyDamaged;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            ParticleSet(y+0x24, x, PE_0x30);
        }
    } else if (gCurrentSprite.health < maxHealth * 3 / 4) {
        if (gCurrentSprite.pOam != sBoxPartOam_CenterSlightlyDamaged) {
            gCurrentSprite.pOam = sBoxPartOam_CenterSlightlyDamaged;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            ParticleSet(y+0x24, x, PE_0x30);
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
        case BOX_POSE_FINISHED_CRAWLING:
        case BOX_POSE_WAITING_TO_RUN:
        case BOX_POSE_JUMP_WARNING: {
            if (gCurrentSprite.pOam != sFrameData_347ca8) {
                gCurrentSprite.pOam = sFrameData_347ca8;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            }
            break;
        }
        case BOX_POSE_DEFEATED:
        case BOX_POSE_MOVING_TO_FINAL_JUMP_INIT:
        case BOX_POSE_MOVING_TO_FINAL_JUMP:
        case BOX_POSE_WAITING_FOR_FINAL_JUMP_INIT:
        case BOX_POSE_WAITING_FOR_FINAL_JUMP:
        case BOX_POSE_CROUCHING_FOR_FINAL_JUMP_INIT:
        case BOX_POSE_CROUCHING_FOR_FINAL_JUMP:
        case BOX_POSE_FINAL_JUMP_INIT:
        case BOX_POSE_FINAL_JUMP: {
            if (gCurrentSprite.pOam != sFrameData_347ca8) {
                gCurrentSprite.pOam = sFrameData_347ca8;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
            }
            if ((gFrameCounter8Bit & 7) == 0) {
                if ((gFrameCounter8Bit & 8) != 0) {
                    gCurrentSprite.paletteRow = 12;
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
        case BOX_POSE_DEFEATED:
        case BOX_POSE_MOVING_TO_FINAL_JUMP_INIT:
        case BOX_POSE_MOVING_TO_FINAL_JUMP:
        case BOX_POSE_WAITING_FOR_FINAL_JUMP_INIT:
        case BOX_POSE_WAITING_FOR_FINAL_JUMP:
        case BOX_POSE_CROUCHING_FOR_FINAL_JUMP_INIT:
        case BOX_POSE_CROUCHING_FOR_FINAL_JUMP:
        case BOX_POSE_FINAL_JUMP_INIT:
        case BOX_POSE_FINAL_JUMP: {
            if ((gFrameCounter8Bit & 7) == 0) {
                if ((gFrameCounter8Bit & 8) != 0) {
                    gCurrentSprite.paletteRow = 13;
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
    gCurrentSprite.xParasiteTimer = 5 * 60;
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
            gCurrentSprite.pose = SPRITE_POSE_SELF_DESTRUCT;
        }
    } else {
        gCurrentSprite.pose = SPRITE_POSE_SELF_DESTRUCT;
    }
}

void BoxMissileExploding(void) {
    gCurrentSprite.status = 0;
    ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x25);
    SoundPlay(0x26c);
}

enum BoxBombMovementStage {
    BOX_BOMB_MOVEMENT_STAGE_LAUNCHING, // 0
    BOX_BOMB_MOVEMENT_STAGE_FALLING_1, // 1
    BOX_BOMB_MOVEMENT_STAGE_FIRST_BOUNCE, // 2
    BOX_BOMB_MOVEMENT_STAGE_FALLING_2, // 3
    BOX_BOMB_MOVEMENT_STAGE_SECOND_BOUNCE, // 4
    BOX_BOMB_MOVEMENT_STAGE_FALLING_3, // 5
    BOX_BOMB_MOVEMENT_STAGE_LANDED // 6
};

void BoxBombInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;
    gCurrentSprite.drawDistanceTop = 0x10;
    gCurrentSprite.drawDistanceBottom = 0x10;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -PIXEL_TO_SUB_PIXEL(7);
    gCurrentSprite.hitboxBottom = PIXEL_TO_SUB_PIXEL(7);
    gCurrentSprite.hitboxLeft = -PIXEL_TO_SUB_PIXEL(7);
    gCurrentSprite.hitboxRight = PIXEL_TO_SUB_PIXEL(7);
    gCurrentSprite.pOam = sBoxBombOam_Moving;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.rotation = 0;
    gCurrentSprite.scaling = Q_8_8(1);
    gCurrentSprite.work2 = BOX_BOMB_MOVEMENT_STAGE_LAUNCHING; // Movement stage
    gCurrentSprite.work3 = PIXEL_TO_SUB_PIXEL(1.75f); // X speed
    gCurrentSprite.work4 = 0; // Y speed table index
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
    if (gCurrentSprite.work2 == BOX_BOMB_MOVEMENT_STAGE_LAUNCHING) {
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
    else if (gCurrentSprite.work2 == BOX_BOMB_MOVEMENT_STAGE_FIRST_BOUNCE) {
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
    } else if (gCurrentSprite.work2 == BOX_BOMB_MOVEMENT_STAGE_SECOND_BOUNCE) {
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
    } else if (gCurrentSprite.work2 == BOX_BOMB_MOVEMENT_STAGE_LANDED) {
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
            gCurrentSprite.work3 -= PIXEL_SIZE / 2;
        } else {
            gCurrentSprite.yPosition += movement;
        }
    }
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        gCurrentSprite.rotation += (BOX_BOMB_MOVEMENT_STAGE_LANDED - gCurrentSprite.work2) * Q_8_8(1./32);
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
        if (gPreviousCollisionCheck == 0) {
            gCurrentSprite.xPosition += gCurrentSprite.work3;
        }
    } else {
        gCurrentSprite.rotation += (BOX_BOMB_MOVEMENT_STAGE_LANDED - gCurrentSprite.work2) * -Q_8_8(1./32);
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
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x22);
            gCurrentSprite.status = 0;
            SoundPlay(0x272);
        }
    }
}

void BoxBombExploding(void) {
    ParticleSet(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition, PE_0x32);
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
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0xe8, 0);
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x + 0xbe, 0);
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 2, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0x156, 0);
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 3, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0xa0, 0);
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 4, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0x106, 0);
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 5, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x + 0xdc, 0);
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 6, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0x50, 0);
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 7, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x - 0x124, 0);
    SpriteSpawnSecondary(SSPRITE_BOX_FALLING_DEBRIS, 8, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, y, x + 0x8c, 0);
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
    gCurrentSprite.samusCollision = SSC_SOLID;
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
    u16 xPosOnScreen;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    xPosOnScreen = SUB_PIXEL_TO_PIXEL_(gCurrentSprite.xPosition) - SUB_PIXEL_TO_PIXEL_(gBg1XPosition);
    if (xPosOnScreen > 0x20 && xPosOnScreen < SCREEN_SIZE_X - 0x20) {
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
        ParticleSet(y, x, PE_SMOKE);
        ParticleSet(y, x+0x20, PE_SMOKE);
        EventCheckAdvance(EVENT_BOX_DEFEATED);
        BoxSetDebrisClipdata(CAA_MAKE_SOLID);
        PlayMusic(MUSIC_BOSS_TENSION, 6);
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
            ParticleSet(y, x, PE_TAIL_EXPLOSION);
        } else if (((work1 + 4) & 0xf) == 0) {
            ParticleSet(y-0xa0, x+0x28, PE_0x33);
        } else if (((work1 + 8) & 0xf) == 0) {
            ParticleSet(y-0x82, x-0x28, PE_0x33);
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
            gCurrentSprite.drawOrder = 11;
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

void BoxFallingDebrisFalling(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.work1--;
    } else {
        u16 y, x;
        u8 work2;
        u8 roomSlot;

        gCurrentSprite.work2++;
        work2 = gCurrentSprite.work2;
        y = gCurrentSprite.yPosition;
        x = gCurrentSprite.xPosition;
        roomSlot = gCurrentSprite.roomSlot;
        if (gCurrentSprite.work3 < UCHAR_MAX) {
            gCurrentSprite.work3 += 1;
        }
        if (gCurrentSprite.work3 > 50) {
            u32 blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(y, x);
            if (gPreviousVerticalCollisionCheck != 0) {
                gCurrentSprite.yPosition = blockTop;
                gCurrentSprite.pose = 0x1e;
                if (roomSlot == 0) {
                    ScreenShakeStartVertical(30, 0x81);
                    ParticleSet(y, x-0x20, PE_SMOKE);
                    ParticleSet(y, x+0x20, PE_SMOKE);
                } else if (roomSlot == 1 || roomSlot == 6) {
                    ParticleSet(y, x, PE_SMOKE);
                } else if (roomSlot == 2 || roomSlot == 3 || roomSlot == 7) {
                    ParticleSet(y, x-0x10, PE_HEAVY_DUST_1);
                    ParticleSet(y, x+0x10, PE_HEAVY_DUST_1);
                } else {
                    ParticleSet(y, x, PE_HEAVY_DUST_1);
                }
                return;
            }
        }
        if (roomSlot == 0) {
            u8 offset;
            s16 movement;
            if ((work2 & 0xf) == 0) {
                ParticleSet(y, x, PE_SMOKE);
            } else if (((work2 + 4) & 0xf) == 0) {
                ParticleSet(y-0xa0, x+0x32, PE_TAIL_EXPLOSION_SMOKE);
            } else if (((work2 + 8) & 0xf) == 0) {
                ParticleSet(y, x-0x20, PE_0x33);
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
            u8 offset;
            s16 movement;
            if ((work2 & 0x1f) == 0) {
                ParticleSet(y, x, PE_HEAVY_DUST_1);
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
            u8 offset;
            s16 movement;
            if (((work2 + 7) & 0x1f) == 0) {
                ParticleSet(y, x, PE_0x33);
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
            u8 offset;
            s16 movement;
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

void Box(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            BoxInit();
            break;
        case BOX_POSE_CRAWLING_INIT:
            BoxCrawlingInit();
        case BOX_POSE_CRAWLING:
            BoxCrawling();
            break;
        case BOX_POSE_WAITING_TO_RUN_INIT:
            BoxWaitingToRunInit();
        case BOX_POSE_WAITING_TO_RUN:
            BoxWaitingToRun();
            break;
        case BOX_POSE_SLOW_RUN_INIT:
            BoxSlowRunningInit();
        case BOX_POSE_SLOW_RUN:
            BoxSlowRun();
            break;
        case BOX_POSE_FAST_RUN_INIT:
            BoxFastRunInit();
        case BOX_POSE_FAST_RUN:
            BoxFastRun();
            break;
        case BOX_POSE_SKIDDING_INIT:
            BoxSkiddingInit();
        case BOX_POSE_SKIDDING:
            BoxSkidding();
            break;
        case BOX_POSE_STOP_SKIDDING_INIT:
            BoxStopSkiddingInit();
        case BOX_POSE_STOP_SKIDDING:
            BoxStopSkidding();
            break;
        case BOX_POSE_FINISHED_CRAWLING_INIT:
            BoxFinishedCrawlingInit();
        case BOX_POSE_FINISHED_CRAWLING:
            BoxFinishedCrawling();
            break;
        case BOX_POSE_BONKING_INIT:
            BoxBonkingInit();
        case BOX_POSE_BONKING:
            BoxBonking();
            break;
        case BOX_POSE_LANDING_FROM_BONK_INIT:
            BoxLandingFromBonkInit();
        case BOX_POSE_LANDING_FROM_BONK:
            BoxLandingFromBonk();
            break;
        case BOX_POSE_LANDING_INIT:
            BoxLandingInit();
        case BOX_POSE_LANDING:
            BoxLanding();
            break;
        case BOX_POSE_JUMP_WARNING_INIT:
            BoxJumpWarningInit();
        case BOX_POSE_JUMP_WARNING:
            BoxJumpWarning();
            break;
        case BOX_POSE_JUMPING_INIT:
            BoxJumpingInit();
        case BOX_POSE_JUMPING:
            BoxJumping();
            break;
        case BOX_POSE_STOPPING_TO_FIRE_BOMB_INIT:
            BoxStoppingToFireBombInit();
        case BOX_POSE_STOPPING_TO_FIRE_BOMB:
            BoxStoppingToFireBomb();
            break;
        case BOX_POSE_LOWERING_TO_FIRE_BOMB_INIT:
            BoxLoweringToFireBombInit();
        case BOX_POSE_LOWERING_TO_FIRE_BOMB:
            BoxLoweringToFireBomb();
            break;
        case BOX_POSE_FIRING_BOMB:
            BoxFiringBomb();
            break;
        case BOX_POSE_DONE_FIRING_BOMB:
            BoxDoneFiringBomb();
            break;
        case BOX_POSE_WAITING_TO_EMERGE_INIT:
            BoxWaitingToEmergeInit();
        case BOX_POSE_WAITING_TO_EMERGE:
            BoxWaitingToEmerge();
            break;
        case BOX_POSE_FIRST_JUMP_INIT:
            BoxFirstJumpInit();
        case BOX_POSE_FIRST_JUMP:
            BoxFirstJump();
            break;
        case BOX_POSE_DEFEATED_INIT:
            BoxDefeatedInit();
        case BOX_POSE_DEFEATED:
            BoxDefeated();
            break;
        case BOX_POSE_MOVING_TO_FINAL_JUMP_INIT:
            BoxMovingToFinalJumpInit();
        case BOX_POSE_MOVING_TO_FINAL_JUMP:
            BoxMovingToFinalJump();
            break;
        case BOX_POSE_WAITING_FOR_FINAL_JUMP_INIT:
            BoxWaitingForFinalJumpInit();
        case BOX_POSE_WAITING_FOR_FINAL_JUMP:
            BoxWaitingForFinalJump();
            break;
        case BOX_POSE_CROUCHING_FOR_FINAL_JUMP_INIT:
            BoxCrouchingForFinalJumpInit();
        case BOX_POSE_CROUCHING_FOR_FINAL_JUMP:
            BoxCrouchingForFinalJump();
            break;
        case BOX_POSE_FINAL_JUMP_INIT:
            BoxFinalJumpInit();
        case BOX_POSE_FINAL_JUMP:
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
        case SPRITE_POSE_SELF_DESTRUCT:
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
        case SPRITE_POSE_SELF_DESTRUCT:
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
