#include "sprites_AI/arachnus.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/arachnus.h"
#include "data/sprites/core_x.h"
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
    gCurrentSprite.pose = ARACHNUS_POSE_SHOOTING_FIRE;
    gCurrentSprite.pOam = sArachnusOam_ShootingFire;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
    gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_COLLIDING;
    SetSecondarySpriteOAMPointer(sArachnusShellOam_ShootingFire);
}

void ArachnusScreamingInit(void) {
    gCurrentSprite.pose = ARACHNUS_POSE_SCREAMING;
    gCurrentSprite.pOam = sArachnusOam_Screaming;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.hitboxTop = -0xe0;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -0x48;
    gCurrentSprite.hitboxRight = 0x48;
    SetSecondarySpriteOAMPointer(sArachnusShellOam_Screaming);
    SoundPlay(0xbb);
}

void ArachnusDyingInit(void) {
    gCurrentSprite.pose = ARACHNUS_POSE_DYING;
    if (gCurrentSprite.pOam != sArachnusOam_Screaming) {
        gCurrentSprite.pOam = sArachnusOam_Screaming;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.hitboxTop = -0xe0;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.hitboxLeft = -0x48;
        gCurrentSprite.hitboxRight = 0x48;
        SetSecondarySpriteOAMPointer(sArachnusShellOam_Screaming);
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

    gCurrentSprite.pose = ARACHNUS_POSE_ROLLING;
    gCurrentSprite.status |= SPRITE_STATUS_HIDDEN;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    if (gCurrentSprite.status & SPRITE_STATUS_SAMUS_DETECTED) {
        gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
        gCurrentSprite.status ^= SPRITE_STATUS_SAMUS_COLLIDING;
    }
    SetSecondarySpriteOAMPointer(sArachnusOam_Curling);
    shellSpriteSlot = gCurrentSprite.work2;
    gSpriteData[shellSpriteSlot].hitboxTop = -0x60;
    gSpriteData[shellSpriteSlot].hitboxBottom = 0;
    gSpriteData[shellSpriteSlot].hitboxLeft = -0x40;
    gSpriteData[shellSpriteSlot].hitboxRight = 0x40;
    SoundPlay(0xb4);
}

void ArachnusSlashingInit(void) {
    gCurrentSprite.pose = ARACHNUS_POSE_SLASHING;
    gCurrentSprite.pOam = sArachnusOam_Slashing;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.status &= ~SPRITE_STATUS_SAMUS_DETECTED;
    SetSecondarySpriteOAMPointer(sArachnusShellOam_Slashing);
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
        gCurrentSprite.pose = ARACHNUS_POSE_WALKING_INIT;
        gCurrentSprite.work1 = 120;
    }
}

void ArachnusRolling(void) {
    u32 shellSpriteSlot;
    u16 speed;
    u32 hitWall;
    u32 xPosition;
    u32 yPosition;

    shellSpriteSlot = gCurrentSprite.work2;
    if (gSpriteData[shellSpriteSlot].pOam == sArachnusOam_Curling) {
        if (SpriteUtilCheckEndSpriteAnim(shellSpriteSlot)) {
            SetSecondarySpriteOAMPointer(sArachnusOam_Rolling);
            gSpriteData[shellSpriteSlot].status |= SPRITE_STATUS_ROTATION_SCALING;
            gSpriteData[shellSpriteSlot].rotation = 0;
            gSpriteData[shellSpriteSlot].scaling = Q_8_8(1);
        }
    } else {
        speed = sArachnusRollingSpeed[gCurrentSprite.work3 >> 2];
        if (gCurrentSprite.work3 < 0x2f) {
            gCurrentSprite.work3++;
        }
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gSpriteData[shellSpriteSlot].yPosition - 0x48,
                gSpriteData[shellSpriteSlot].xPosition + gSpriteData[shellSpriteSlot].hitboxRight);
            if (gPreviousCollisionCheck & 0xf) {
                hitWall = TRUE;
            } else {
                gCurrentSprite.xPosition += speed;
                xPosition = gCurrentSprite.xPosition;
                yPosition = gCurrentSprite.yPosition;
                gSpriteData[shellSpriteSlot].xPosition += speed;
                speed = gCurrentSprite.work3 / 2;
                if (speed > 0x10) {
                    speed = 0x10;
                }
                gSpriteData[shellSpriteSlot].rotation += speed;
                if (gSpriteRandomNumber > 12) {
                    if ((gSpriteRandomNumber & 1) != 0) {
                        SpriteDebrisInit(0, 4, yPosition - 0x10, xPosition + (gFrameCounter8Bit & 0x1f));
                    } else {
                        SpriteDebrisInit(0, 0x11, yPosition, xPosition + (gFrameCounter8Bit & 0x1f));
                    }
                }
            }
        } else {
            SpriteUtilCheckCollisionAtPosition(gSpriteData[shellSpriteSlot].yPosition - 0x48,
                gSpriteData[shellSpriteSlot].xPosition + gSpriteData[shellSpriteSlot].hitboxLeft);
            if (gPreviousCollisionCheck & 0xf) {
                hitWall = TRUE;
            } else {
                gCurrentSprite.xPosition -= speed;
                xPosition = gCurrentSprite.xPosition;
                yPosition = gCurrentSprite.yPosition;
                gSpriteData[shellSpriteSlot].xPosition -= speed;
                speed = gCurrentSprite.work3 / 2;
                if (speed > 0x10) {
                    speed = 0x10;
                }
                gSpriteData[shellSpriteSlot].rotation -= speed;
                if (gSpriteRandomNumber > 12) {
                    if ((gSpriteRandomNumber & 1) != 0) {
                        SpriteDebrisInit(0, 0x13, yPosition - 0x10, xPosition - (gFrameCounter8Bit & 0x1f));
                    } else {
                        SpriteDebrisInit(0, 0x12, yPosition, xPosition - (gFrameCounter8Bit & 0x1f));
                    }
                }
                hitWall = FALSE;
            }
        }
        if (hitWall) {
            gCurrentSprite.pose = ARACHNUS_POSE_BONKING;
            gCurrentSprite.work4 = 0;
            ScreenShakeStartHorizontal(0x28, 0x81);
            SoundPlay(0xb7);
            return;
        }
        if ((gFrameCounter8Bit & 0xf) == 0) {
            SoundPlay(0xb6);
        }
    }
}

void ArachnusBonking(void) {
    u32 shellSpriteSlot;
    u8 offset;
    u16 movement;
    u16 xSpeed;

    shellSpriteSlot = gCurrentSprite.work2;
    if (gSpriteData[shellSpriteSlot].pOam == sArachnusOam_Uncurling) {
        if (SpriteUtilCheckNearEndSpriteAnim(shellSpriteSlot)) {
            gCurrentSprite.pose = ARACHNUS_POSE_IDLE_INIT;
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
            SetSecondarySpriteOAMPointer(sArachnusOam_Uncurling);
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
                gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;
                gCurrentSprite.spriteId = gCoreXFormationSpriteId;
        }
        if (gCurrentSprite.xParasiteTimer < ARRAY_SIZE(sMorphBallCoreXGfx) / 512 * 4) {
            SpriteLoadGfx(gCoreXFormationSpriteId, 0, gCurrentSprite.xParasiteTimer);
        } else if (gCurrentSprite.xParasiteTimer == ARRAY_SIZE(sMorphBallCoreXGfx) / 512 * 4) {
            SpriteLoadPal(gCoreXFormationSpriteId, 0, ARRAY_SIZE(sMorphBallCoreXPal) / 16);
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
        gCurrentSprite.pose = ARACHNUS_POSE_WALKING_INIT;
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
        gCurrentSprite.pose = ARACHNUS_POSE_IDLE_INIT;
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
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.yPosition += 100;
        gCurrentSprite.bgPriority = 2;
        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.status &= ~(SPRITE_STATUS_SAMUS_DETECTED | SPRITE_STATUS_SAMUS_COLLIDING);
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = 44;
    } else {
        gCurrentSprite.pose = ARACHNUS_POSE_IDLE;
    }
    gCurrentSprite.pOam = sArachnusOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    ArachnusSetStandingHitbox();
    ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_SHELL, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    gCurrentSprite.work2 = ramSlot;
    ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_HEAD, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_LEFT_ARM, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
        return;
    }
    ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_RIGHT_ARM, gCurrentSprite.roomSlot, gCurrentSprite.spritesetGfxSlot,
        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
    if (ramSlot == UCHAR_MAX) {
        gCurrentSprite.status = 0;
    }
}

void ArachnusWalkingInit(void) {
    gCurrentSprite.pose = ARACHNUS_POSE_WALKING;
    gCurrentSprite.pOam = sArachnusOam_Walking;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    ArachnusSetStandingHitbox();
    SetSecondarySpriteOAMPointer(sArachnusShellOam_Walking);
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
        gCurrentSprite.pose = ARACHNUS_POSE_IDLE_INIT;
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
        gCurrentSprite.status &= ~SPRITE_STATUS_HIDDEN;
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
    gCurrentSprite.pose = ARACHNUS_POSE_IDLE;
    gCurrentSprite.pOam = sArachnusOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    ArachnusSetStandingHitbox();
    SetSecondarySpriteOAMPointer(sArachnusShellOam_Idle);
}

void ArachnusIdle(void) {
    u32 newPose;

    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            if (gCurrentSprite.xPosition > gSamusData.xPosition) {
                newPose = ARACHNUS_POSE_TURNING_INIT;
            } else {
                newPose = ARACHNUS_POSE_WALKING_INIT;
            }
        } else {
            if (gCurrentSprite.xPosition < gSamusData.xPosition) {
                newPose = ARACHNUS_POSE_TURNING_INIT;
            } else {
                newPose = ARACHNUS_POSE_WALKING_INIT;
            }
        }
        gCurrentSprite.pose = newPose;
    }
}

void ArachnusTurningInit(void) {
    gCurrentSprite.pose = ARACHNUS_POSE_TURNING;
    gCurrentSprite.pOam = sArachnusOam_Turning;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.hitboxLeft = -0x20;
    gCurrentSprite.hitboxRight = 0x20;
    SetSecondarySpriteOAMPointer(sArachnusShellOam_Turning);
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
        gCurrentSprite.pose = ARACHNUS_POSE_WALKING_INIT;
    }
}

void Arachnus(void) {
    if (gCurrentSprite.pose != SPRITE_POSE_UNINITIALIZED) {
        if (gCurrentSprite.health > 0) {
            if (SPRITE_HAS_ISFT(gCurrentSprite) >= 6) {
                if ((gCurrentSprite.pose == ARACHNUS_POSE_WALKING || gCurrentSprite.pose == ARACHNUS_POSE_IDLE) && gCurrentSprite.pose != ARACHNUS_POSE_SCREAMING) {
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
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            ArachnusInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            ArachnusCoreXTransformation();
            break;
        case SPRITE_POSE_UNINITIALIZED:
            ArachnusInit();
            break;
        case ARACHNUS_POSE_WALKING_INIT:
            ArachnusWalkingInit();
        case ARACHNUS_POSE_WALKING:
            ArachnusWalking();
            break;
        case ARACHNUS_POSE_IDLE_INIT:
            ArachnusIdleInit();
        case ARACHNUS_POSE_IDLE:
            ArachnusIdle();
            break;
        case ARACHNUS_POSE_TURNING_INIT:
            ArachnusTurningInit();
        case ARACHNUS_POSE_TURNING:
            ArachnusTurning();
            break;
        case ARACHNUS_POSE_SLASHING:
            ArachnusSlashing();
            break;
        case ARACHNUS_POSE_ROLLING:
            ArachnusRolling();
            break;
        case ARACHNUS_POSE_BONKING:
            ArachnusBonking();
            break;
        case ARACHNUS_POSE_SCREAMING:
            ArachnusScreaming();
            break;
        case ARACHNUS_POSE_SHOOTING_FIRE:
            ArachnusShootingFire();
            break;
        case ARACHNUS_POSE_DYING:
            ArachnusDying();
            break;
    }
}

void ArachnusShell(void) {
    u32 arachnusRamSlot;

    arachnusRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
        gCurrentSprite.status = gCurrentSprite.status & ~SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 5;
        gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
        gCurrentSprite.drawDistanceTop = 0x30;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x18;
        gCurrentSprite.hitboxTop = -0xa0;
        gCurrentSprite.hitboxBottom = 0;
        gCurrentSprite.pOam = sArachnusShellOam_Idle;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            gCurrentSprite.hitboxLeft = -0x50;
            gCurrentSprite.hitboxRight = 0;
        } else {
            gCurrentSprite.hitboxLeft = 0;
            gCurrentSprite.hitboxRight = 0x50;
        }
    }
    if (gSpriteData[arachnusRamSlot].pose == ARACHNUS_POSE_WALKING && SPRITE_HAS_ISFT(gCurrentSprite) > 0) {
        if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
            if (gCurrentSprite.xPosition > gSamusData.xPosition) {
                // Why not use "gSpriteData[arachnusRamSlot].pose = ARACHNUS_POSE_IDLE_INIT;"?
                gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose = ARACHNUS_POSE_IDLE_INIT;
            }
        } else {
            if (gCurrentSprite.xPosition < gSamusData.xPosition) {
                gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose = ARACHNUS_POSE_IDLE_INIT;
            }
        }
    }
    if (gSpriteData[arachnusRamSlot].status & SPRITE_STATUS_ENABLE_MOSAIC) {
        gCurrentSprite.status |= SPRITE_STATUS_ENABLE_MOSAIC;
    } else {
        gCurrentSprite.status &= ~SPRITE_STATUS_ENABLE_MOSAIC;
    }
    if (gSpriteData[arachnusRamSlot].pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.status = 0;
    }
}

void ArachnusPart(void) {
    u32 arachnusRamSlot;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    arachnusRamSlot = gCurrentSprite.primarySpriteRamSlot;
    switch (gSpriteData[arachnusRamSlot].pose) {
        case ARACHNUS_POSE_WALKING:
            break;
        case ARACHNUS_POSE_WALKING_INIT:
            gCurrentSprite.status &= ~SPRITE_STATUS_HIDDEN;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        case ARACHNUS_POSE_IDLE_INIT:
            break;
        default:
            gCurrentSprite.status |= SPRITE_STATUS_HIDDEN;
    }
    gCurrentSprite.yPosition = gSpriteData[arachnusRamSlot].yPosition;
    gCurrentSprite.xPosition = gSpriteData[arachnusRamSlot].xPosition;
    gCurrentSprite.paletteRow = gSpriteData[arachnusRamSlot].paletteRow;
    if (gSpriteData[arachnusRamSlot].status & SPRITE_STATUS_X_FLIP) {
        gCurrentSprite.status |= SPRITE_STATUS_X_FLIP;
    } else {
        gCurrentSprite.status &= ~SPRITE_STATUS_X_FLIP;
    }
    if (gSpriteData[arachnusRamSlot].pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.status = 0;
    }
}

void ArachnusHead(void) {
    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
        gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 3;
        gCurrentSprite.drawDistanceTop = 0x30;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x20;
        gCurrentSprite.hitboxTop = -4;
        gCurrentSprite.hitboxBottom = 4;
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 4;
        gCurrentSprite.pOam = sArachnusHeadOam;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
    }
    ArachnusPart();
}

void ArachnusArm1(void) {
    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
        gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.drawDistanceTop = 0x20;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x28;
        gCurrentSprite.hitboxTop = -4;
        gCurrentSprite.hitboxBottom = 4;
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 4;
        gCurrentSprite.pOam = sArachnusArm1Oam;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
    }
    ArachnusPart();
}

void ArachnusArm2(void) {
    if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
        gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
        gCurrentSprite.drawOrder = 2;
        gCurrentSprite.drawDistanceTop = 0x20;
        gCurrentSprite.drawDistanceBottom = 0;
        gCurrentSprite.drawDistanceHorizontal = 0x28;
        gCurrentSprite.hitboxTop = -4;
        gCurrentSprite.hitboxBottom = 4;
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 4;
        gCurrentSprite.pOam = sArachnusArm2Oam;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
    }
    ArachnusPart();
}

void ArachnusFire(void) {
    u32 arachnusRamSlot; // needed for matching

    arachnusRamSlot = gCurrentSprite.primarySpriteRamSlot;
    if (gSpriteData[arachnusRamSlot].pose == ARACHNUS_POSE_DYING && gCurrentSprite.pose != ARACHNUS_PROJECTILE_POSE_ARACHNUS_DYING) {
        gCurrentSprite.pose = ARACHNUS_PROJECTILE_POSE_ARACHNUS_DYING;
        gCurrentSprite.work1 = 40;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED: {
            gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
            gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.drawOrder = 2;
            gCurrentSprite.drawDistanceTop = 0x28;
            gCurrentSprite.drawDistanceBottom = 0;
            gCurrentSprite.drawDistanceHorizontal = 8;
            gCurrentSprite.hitboxBottom = 0;
            gCurrentSprite.hitboxLeft = -0x18;
            gCurrentSprite.hitboxRight = 0x18;
            gCurrentSprite.work1 = 0;
            if (gCurrentSprite.roomSlot == 0) {
                gCurrentSprite.pOam = sArachnusFireballOam;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
                gCurrentSprite.pose = ARACHNUS_FIRE_POSE_FIREBALL;
                gCurrentSprite.hitboxTop = -0x30;
            } else {
                gCurrentSprite.pOam = sArachnusFireTrailOam_Short;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
                gCurrentSprite.pose = ARACHNUS_FIRE_POSE_FIRE_TRAIL_1;
                gCurrentSprite.hitboxTop = -0x40;
                SoundPlay(0xbd);
            }
            break;
        }
        case ARACHNUS_FIRE_POSE_FIREBALL: {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck != 0) {
                gCurrentSprite.pose = ARACHNUS_FIRE_POSE_FIRE_TRAIL_1;
                gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
                gCurrentSprite.pOam = sArachnusFireTrailOam_Short;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.hitboxTop = -0x40;
                SoundPlay(0xbd);
            } else {
                gCurrentSprite.yPosition += 5;
                if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
                    gCurrentSprite.xPosition += 6;
                } else {
                    gCurrentSprite.xPosition -= 6;
                }
            }
            break;
        }
        case ARACHNUS_FIRE_POSE_FIRE_TRAIL_1: {
            if (++gCurrentSprite.work1 == 8 && gCurrentSprite.roomSlot < 7) {
                if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
                    SpriteSpawnSecondary(SSPRITE_ARACHNUS_FIRE_BALL, gCurrentSprite.roomSlot + 1, gCurrentSprite.spritesetGfxSlot,
                        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x38, SPRITE_STATUS_X_FLIP);
                } else {
                    SpriteSpawnSecondary(SSPRITE_ARACHNUS_FIRE_BALL, gCurrentSprite.roomSlot + 1, gCurrentSprite.spritesetGfxSlot,
                        gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x38, 0);
                }
            }
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.pose = ARACHNUS_FIRE_POSE_FIRE_TRAIL_2;
                gCurrentSprite.pOam = sArachnusFireTrailOam_Medium;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.hitboxTop = -0x60;
            }
            break;
        }
        case ARACHNUS_FIRE_POSE_FIRE_TRAIL_2: {
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.pose = ARACHNUS_FIRE_POSE_FIRE_TRAIL_3;
                gCurrentSprite.pOam = sArachnusFireTrailOam_Tall;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.hitboxTop = -0x80;
            }
            break;
        }
        case ARACHNUS_FIRE_POSE_FIRE_TRAIL_3: {
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.pose = ARACHNUS_FIRE_POSE_FIRE_TRAIL_4;
                gCurrentSprite.pOam = sArachnusFireTrailOam_Medium;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.hitboxTop = -0x60;
            }
            break;
        }
        case ARACHNUS_FIRE_POSE_FIRE_TRAIL_4: {
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.pose = ARACHNUS_FIRE_POSE_FIRE_TRAIL_DIE;
                gCurrentSprite.pOam = sArachnusFireTrailOam_Short;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.hitboxTop = -0x40;
            }
            break;
        }
        case ARACHNUS_FIRE_POSE_FIRE_TRAIL_DIE: {
            if (SpriteUtilCheckEndCurrentSpriteAnim()) {
                gCurrentSprite.status = 0;
                ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0x25);
            }
            break;
        }
        case ARACHNUS_PROJECTILE_POSE_ARACHNUS_DYING: {
            gCurrentSprite.ignoreSamusCollisionTimer = 1;
            if ((gFrameCounter8Bit & 1) == 0) {
                gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;
            }
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.status = 0;
            }
            break;
        }
        case ARACHNUS_FIRE_POSE_UNUSED: {
            gCurrentSprite.status = 0;
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0x25);
            break;
        }
    }
}

void ArachnusSlash(void) {
    u8 ramSlot;

    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == ARACHNUS_POSE_DYING && gCurrentSprite.pose != ARACHNUS_PROJECTILE_POSE_ARACHNUS_DYING) {
        gCurrentSprite.pose = ARACHNUS_PROJECTILE_POSE_ARACHNUS_DYING;
        gCurrentSprite.work1 = 40;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED: {
            gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
            gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.drawOrder = 3;
            gCurrentSprite.drawDistanceTop = 0x30;
            gCurrentSprite.drawDistanceBottom = 0;
            gCurrentSprite.drawDistanceHorizontal = 0x38;
            gCurrentSprite.hitboxTop = -0xc0;
            gCurrentSprite.hitboxBottom = 0;
            gCurrentSprite.hitboxLeft = -0x20;
            gCurrentSprite.hitboxRight = 0x20;
            gCurrentSprite.pOam = sArachnusSlashOam;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
            gCurrentSprite.pose = ARACHNUS_SLASH_POSE_MOVING;
            if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
                ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_BEAM_TRAIL, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition - 0xc, gCurrentSprite.xPosition, SPRITE_STATUS_X_FLIP);
            } else {
                ramSlot = SpriteSpawnSecondary(SSPRITE_ARACHNUS_BEAM_TRAIL, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition - 0xc, gCurrentSprite.xPosition, 0);
            }
            if (ramSlot == UCHAR_MAX) {
                gCurrentSprite.status = 0;
            } else {
                gCurrentSprite.work2 = ramSlot;
            }
            break;
        }
        case ARACHNUS_SLASH_POSE_MOVING: {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck != 0) {
                gCurrentSprite.status = 0;
                gSpriteData[gCurrentSprite.work2].status = 0;
                ParticleSet(gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition, 0x25);
                ParticleSet(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition, 0x25);
                ParticleSet(gCurrentSprite.yPosition - 0xa0, gCurrentSprite.xPosition, 0x25);
                SoundPlayNotAlreadyPlaying(0xbf);
            } else {
                if (gCurrentSprite.status & SPRITE_STATUS_X_FLIP) {
                    gCurrentSprite.xPosition += 0xc;
                } else {
                    gCurrentSprite.xPosition -= 0xc;
                }
                gSpriteData[gCurrentSprite.work2].xPosition = gCurrentSprite.xPosition;
            }
            break;
        }
        case ARACHNUS_PROJECTILE_POSE_ARACHNUS_DYING: {
            gCurrentSprite.ignoreSamusCollisionTimer = 1;
            if ((gFrameCounter8Bit & 1) == 0) {
                gCurrentSprite.status ^= SPRITE_STATUS_NOT_DRAWN;
            }
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.status = 0;
            }
            break;
        }
    }
}

void ArachnusSlashTrail(void) {
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == ARACHNUS_POSE_DYING) {
        gCurrentSprite.status = 0;
    } else {
        gCurrentSprite.ignoreSamusCollisionTimer = 1;
        if (gCurrentSprite.pose == SPRITE_POSE_UNINITIALIZED) {
            gCurrentSprite.status |= SPRITE_STATUS_IGNORE_PROJECTILES;
            gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
            gCurrentSprite.status &= ~SPRITE_STATUS_NOT_DRAWN;
            gCurrentSprite.drawOrder = 2;
            gCurrentSprite.drawDistanceTop = 0x20;
            gCurrentSprite.drawDistanceBottom = 0;
            gCurrentSprite.drawDistanceHorizontal = 0x40;
            gCurrentSprite.hitboxTop = -4;
            gCurrentSprite.hitboxBottom = 4;
            gCurrentSprite.hitboxLeft = -4;
            gCurrentSprite.hitboxRight = 4;
            gCurrentSprite.pOam = sArachnusSlashTrailOam;
            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.pose = SPRITE_POSE_IDLE;
        }
    }
}
