#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/zeela.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u8 ZeelaCheckCollidingWithAir(void) {
    u8 midair = FALSE;

    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck == COLLISION_AIR) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition);
                if (gPreviousCollisionCheck == COLLISION_AIR) midair = TRUE;
            }
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 4);
            if (gPreviousCollisionCheck == COLLISION_AIR) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x20, gCurrentSprite.xPosition - 4);
                if (gPreviousCollisionCheck == COLLISION_AIR) midair = TRUE;
            }
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x20);
            if (gPreviousCollisionCheck == COLLISION_AIR) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x20);
                if (gPreviousCollisionCheck == COLLISION_AIR) midair = TRUE;
            }
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
            if (gPreviousCollisionCheck == COLLISION_AIR) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
                if (gPreviousCollisionCheck == COLLISION_AIR) midair = TRUE;
            }
        }
    }

    return midair;
}

void ZeelaUpdateHitbox(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxTop = -0x28;
            gCurrentSprite.hitboxBottom = 0x28;
            gCurrentSprite.hitboxLeft = -0x40;
            gCurrentSprite.hitboxRight = 0x10;
        } else {
            gCurrentSprite.hitboxTop = -0x28;
            gCurrentSprite.hitboxBottom = 0x28;
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x40;
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            gCurrentSprite.hitboxTop = 0x10;
            gCurrentSprite.hitboxBottom = 0x40;
            gCurrentSprite.hitboxLeft = -0x28;
            gCurrentSprite.hitboxRight = 0x28;
        } else {
            gCurrentSprite.hitboxTop = -0x40;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -0x28;
            gCurrentSprite.hitboxRight = 0x28;
        }
    }
}

void ZeelaSetCrawlingOam(void) {
    if (gCurrentSprite.work0)
        gCurrentSprite.pOam = sZeelaOam_CrawlingVertical;
    else
        gCurrentSprite.pOam = sZeelaOam_CrawlingHorizontal;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ZeelaSetFallingOam(void) {
    if (gCurrentSprite.work0)
        gCurrentSprite.pOam = sZeelaOam_FallingVertical;
    else
        gCurrentSprite.pOam = sZeelaOam_FallingHorizontal;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ZeelaShootProjectiles(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        if (++gCurrentSprite.work2 >= 4)
            gCurrentSprite.work2 = 0;
        return;
    }
    if (gCurrentSprite.work2 > 0) return;
    if (gCurrentSprite.currentAnimationFrame == 0 && gCurrentSprite.animationDurationCounter == 1 && gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(SOUND_ZEELA_SHOOTING);
    if (gCurrentSprite.currentAnimationFrame == 1 && gCurrentSprite.animationDurationCounter == 8) {
        if (gCurrentSprite.work0) {
            if (gCurrentSprite.status & SS_X_FLIP)
                SpriteSpawnSecondary(SSPRITE_ZEELA_PROJECTILE, 3, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition + 0x34, gCurrentSprite.xPosition - 0x3c, SS_X_FLIP);
            else
                SpriteSpawnSecondary(SSPRITE_ZEELA_PROJECTILE, 2, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition + 0x34, gCurrentSprite.xPosition + 0x3c, SS_X_FLIP);
        } else {
            if (gCurrentSprite.status & SS_Y_FLIP)
                SpriteSpawnSecondary(SSPRITE_ZEELA_PROJECTILE, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition + 0x3c, gCurrentSprite.xPosition + 0x34, SS_X_FLIP);
            else
                SpriteSpawnSecondary(SSPRITE_ZEELA_PROJECTILE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition - 0x3c, gCurrentSprite.xPosition + 0x34, SS_X_FLIP);
        }
    } else if (gCurrentSprite.currentAnimationFrame == 2 && gCurrentSprite.animationDurationCounter == 8) {
        if (gCurrentSprite.work0) {
            if (gCurrentSprite.status & SS_X_FLIP)
                SpriteSpawnSecondary(SSPRITE_ZEELA_PROJECTILE, 3, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition - 0x34, gCurrentSprite.xPosition - 0x3c, 0);
            else
                SpriteSpawnSecondary(SSPRITE_ZEELA_PROJECTILE, 2, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition - 0x34, gCurrentSprite.xPosition + 0x3c, 0);
        } else {
            if (gCurrentSprite.status & SS_Y_FLIP)
                SpriteSpawnSecondary(SSPRITE_ZEELA_PROJECTILE, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition + 0x3c, gCurrentSprite.xPosition - 0x34, 0);
            else
                SpriteSpawnSecondary(SSPRITE_ZEELA_PROJECTILE, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition - 0x3c, gCurrentSprite.xPosition - 0x34, 0);
        }
    }
}

void ZeelaTurningIntoX(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition -= 0x20;
        else
            gCurrentSprite.xPosition += 0x20;
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP)
            gCurrentSprite.yPosition += 0x20;
        else
            gCurrentSprite.yPosition -= 0x20;
    }
}

void ZeelaInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.work0 = FALSE;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x44, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                gCurrentSprite.work0 = FALSE;
                gCurrentSprite.status |= SS_Y_FLIP;
                gCurrentSprite.yPosition -= 0x40;
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x24);
                if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                    gCurrentSprite.work0 = TRUE;
                    gCurrentSprite.yPosition -= 0x20;
                    gCurrentSprite.xPosition -= 0x20;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x20);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                        gCurrentSprite.work0 = TRUE;
                        gCurrentSprite.status |= SS_X_FLIP;
                        gCurrentSprite.yPosition -= 0x20;
                        gCurrentSprite.xPosition += 0x20;
                    } else {
                        gCurrentSprite.status = 0;
                        return;
                    }
                }
            }
        }
    }
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    ZeelaSetCrawlingOam();
    ZeelaUpdateHitbox();
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
}

void ZeelaIdleInit(void) {
    ZeelaSetCrawlingOam();
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

void ZeelaIdle(void) {
    u8 turn;

    if (gCurrentSprite.status & SS_HIDDEN) return;
    ZeelaShootProjectiles();
    if (ZeelaCheckCollidingWithAir()) {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }
    turn = FALSE;
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x38, gCurrentSprite.xPosition);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x38, gCurrentSprite.xPosition - 4);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.yPosition += 1;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition - 4);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.yPosition -= 1;
                }
            }
        } else {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x38, gCurrentSprite.xPosition - 4);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x38, gCurrentSprite.xPosition);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.yPosition += 1;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition - 4);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.yPosition -= 1;
                }
            }
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x38);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x38);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.xPosition += 1;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x38);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x38);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.xPosition -= 1;
                }
            }
        } else {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x38);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x38);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.xPosition += 1;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x38);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x38);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.xPosition -= 1;
                }
            }
        }
    }
    if (turn) {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.pose = 7;
    }
}

void ZeelaTurningAroundInit(void) {
    gCurrentSprite.pose = 8;
    ZeelaSetFallingOam();
}

void ZeelaTurningAround(void) {
    if (ZeelaCheckCollidingWithAir())
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
    else if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 1;
}

void ZeelaFallingInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.work4 = 0;
    ZeelaSetFallingOam();
}

void ZeelaFalling(void) {
    u16 yCollisionPoint;
    u16 xCollisionPoint;
    u32 blockTop;
    u8 onWall;
    u8 offset;
    s16 movement;

    onWall = 0;
    yCollisionPoint = gCurrentSprite.yPosition;
    xCollisionPoint = gCurrentSprite.xPosition;
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            xCollisionPoint -= PIXEL_SIZE;
        }
        yCollisionPoint += gCurrentSprite.hitboxBottom;
    }
    else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            yCollisionPoint += gCurrentSprite.hitboxBottom;
        }
    }
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(yCollisionPoint, xCollisionPoint);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
        gCurrentSprite.yPosition = blockTop;
        if (gCurrentSprite.work0) {
            onWall += 1;
        }
        gCurrentSprite.status &= ~SS_Y_FLIP;
        gCurrentSprite.work0 = FALSE;
        ZeelaUpdateHitbox();
        if (onWall) {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxRight;
            else
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxLeft;
        }
        gCurrentSprite.pose = 8;
        ZeelaSetFallingOam();
    } else {
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
    }
}

void ZeelaProjectileInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -8;
    gCurrentSprite.hitboxBottom = 8;
    gCurrentSprite.hitboxLeft = -8;
    gCurrentSprite.hitboxRight = 8;
    gCurrentSprite.pOam = sZeelaProjectileOam_Moving;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.drawOrder = 3;
}

void ZeelaProjectileMoving(void) {
    u8 offset;
    s16 movement;

    gCurrentClipdataAffectingAction = CAA_ENEMY_PROJECTILE;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
        return;
    }
    offset = gCurrentSprite.work4;
    movement = sZeelaProjectileMovement[offset];
    if (movement == SHORT_MAX) {
        movement = sZeelaProjectileMovement[offset - 1];
    } else {
        offset++;
        gCurrentSprite.work4 = offset;
    }
    if (gCurrentSprite.roomSlot >= 2) {
        if (gCurrentSprite.roomSlot == 3)
            gCurrentSprite.xPosition += movement;
        else
            gCurrentSprite.xPosition -= movement;
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.yPosition += 6;
        else
            gCurrentSprite.yPosition -= 6;
    } else {
        if (gCurrentSprite.roomSlot != 0)
            gCurrentSprite.yPosition -= movement;
        else
            gCurrentSprite.yPosition += movement;
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition += 6;
        else
            gCurrentSprite.xPosition -= 6;
    }
}

void ZeelaProjectileExplodingInit(void) {
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.bgPriority = 1;
    if (MOD_AND(gSpriteRandomNumber, 2) != 0)
        gCurrentSprite.pOam = sZeelaProjectileOam_Exploding1;
    else
        gCurrentSprite.pOam = sZeelaProjectileOam_Exploding2;
}

void ZeelaProjectileExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void Zeela(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_ZEELA_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ZeelaInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            ZeelaIdleInit();
        case SPRITE_POSE_IDLE:
            ZeelaIdle();
            break;
        case 7:
            ZeelaTurningAroundInit();
        case 8:
            ZeelaTurningAround();
            break;
        case SPRITE_POSE_FALLING_INIT:
            ZeelaFallingInit();
        case SPRITE_POSE_FALLING:
            ZeelaFalling();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            ZeelaInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            ZeelaTurningIntoX();
            XParasiteInit();
    }
}

void ZeelaProjectile(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ZeelaProjectileInit();
        case 2:
            ZeelaProjectileMoving();
            break;
        case 0x38:
            ZeelaProjectileExploding();
            break;
        default:
            ZeelaProjectileExplodingInit();
    }
}
