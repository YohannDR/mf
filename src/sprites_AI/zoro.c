#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/zoro.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u8 ZoroCheckCollidingWithAir(void) {
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

void ZoroSetHitboxAndDrawDistance(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxTop = -0x3c;
            gCurrentSprite.hitboxBottom = 0x3c;
            gCurrentSprite.hitboxLeft = -0x3c;
            gCurrentSprite.hitboxRight = 0x10;
        } else {
            gCurrentSprite.hitboxTop = -0x3c;
            gCurrentSprite.hitboxBottom = 0x3c;
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x3c;
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            gCurrentSprite.hitboxTop = 0x10; // BUG: should be -0x10
            gCurrentSprite.hitboxBottom = 0x3c;
            gCurrentSprite.hitboxLeft = -0x3c;
            gCurrentSprite.hitboxRight = 0x3c;
        } else {
            gCurrentSprite.hitboxTop = -0x3c;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -0x3c;
            gCurrentSprite.hitboxRight = 0x3c;
        }
    }
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
}

void ZoroSetCrawlingOam(void) {
    if (gCurrentSprite.work0)
        gCurrentSprite.pOam = sZoroOam_CrawlingVertical;
    else
        gCurrentSprite.pOam = sZoroOam_CrawlingHorizontal;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ZoroSetTurningOam(void) {
    if (gCurrentSprite.work0)
        gCurrentSprite.pOam = sZoroOam_TurningAroundVertical1;
    else
        gCurrentSprite.pOam = sZoroOam_TurningAroundHorizontal1;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ZoroSetTurningAroundSecondPartOam(void) {
    if (gCurrentSprite.work0) {
        gCurrentSprite.status ^= SS_Y_FLIP;
        gCurrentSprite.pOam = sZoroOam_TurningAroundVertical2;
    } else {
        gCurrentSprite.status ^= SS_X_FLIP;
        gCurrentSprite.pOam = sZoroOam_TurningAroundHorizontal2;
    }
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ZoroSetDeathPosition(void) {
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

void ZoroInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X && !(gCurrentSprite.status & SS_HIDDEN)) {
        gCurrentSprite.status = 0;
        return;
    }
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        SpriteUtilChooseRandomXDirection();
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.work0 = FALSE;
            if (gCurrentSprite.status & SS_FACING_RIGHT)
                gCurrentSprite.status |= SS_X_FLIP;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x44, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                gCurrentSprite.work0 = FALSE;
                gCurrentSprite.status |= SS_Y_FLIP;
                gCurrentSprite.yPosition -= 0x40;
                if (gCurrentSprite.status & SS_FACING_RIGHT)
                    gCurrentSprite.status |= SS_X_FLIP;
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x24);
                if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                    gCurrentSprite.work0 = TRUE;
                    gCurrentSprite.yPosition -= 0x20;
                    gCurrentSprite.xPosition -= 0x20;
                    if (gCurrentSprite.status & SS_FACING_RIGHT)
                        gCurrentSprite.status |= SS_Y_FLIP;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x20);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                        gCurrentSprite.work0 = TRUE;
                        gCurrentSprite.status |= SS_X_FLIP;
                        gCurrentSprite.yPosition -= 0x20;
                        gCurrentSprite.xPosition += 0x20;
                        if (gCurrentSprite.status & SS_FACING_RIGHT)
                            gCurrentSprite.status |= SS_Y_FLIP;
                    } else {
                        gCurrentSprite.status = 0;
                        return;
                    }
                }
            }
        }
    }
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    ZoroSetCrawlingOam();
    ZoroSetHitboxAndDrawDistance();
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
}

void ZoroCrawlingInit(void) {
    ZoroSetCrawlingOam();
    gCurrentSprite.pose = 2;
    if (gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_1);
}

u16 ZoroRedGetSpeed(void) {
    u16 speed;
    u8 onScreen;
    
    if (gCurrentSprite.status & SS_ON_SCREEN)
        onScreen = TRUE;
    else
        onScreen = FALSE;
    if (gCurrentSprite.health < GET_PSPRITE_HEALTH(PSPRITE_ZORO) / 2) {
        switch (gCurrentSprite.currentAnimationFrame) {
            case 1:
            case 2:
                speed = 1;
                break;
            case 4:
            case 5:
                speed = 2;
                break;
            case 3:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_2);
                speed = 4;
                break;
            case 0:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_1);
            default:
                speed = 0;
        }
        gCurrentSprite.animationDurationCounter++; // Double animation speed
    } else {
        switch (gCurrentSprite.currentAnimationFrame) {
            case 1:
            case 2:
            case 4:
            case 5:
                speed = 1;
                break;
            case 3:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_2);
                speed = 2;
                break;
            case 0:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_1);
            default:
                speed = 0;
        }
    }
    return speed;
}

u16 ZoroBlueGetSpeed(void) {
    u16 speed;
    u8 onScreen;
    
    if (gCurrentSprite.status & SS_ON_SCREEN)
        onScreen = TRUE;
    else
        onScreen = FALSE;
    if (gCurrentSprite.health < GET_PSPRITE_HEALTH(PSPRITE_BLUE_ZORO) / 3) {
        switch (gCurrentSprite.currentAnimationFrame) {
            case 1:
            case 2:
                speed = 2;
                break;
            case 4:
            case 5:
                speed = 4;
                break;
            case 3:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_2);
                speed = 6;
                break;
            case 0:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_1);
            default:
                speed = 0;
        }
        gCurrentSprite.animationDurationCounter += 2; // Triple animation speed
    } else if (gCurrentSprite.health < GET_PSPRITE_HEALTH(PSPRITE_BLUE_ZORO) * 2 / 3) {
        switch (gCurrentSprite.currentAnimationFrame) {
            case 1:
            case 2:
                speed = 1;
                break;
            case 4:
            case 5:
                speed = 2;
                break;
            case 3:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_2);
                speed = 4;
                break;
            case 0:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_1);
            default:
                speed = 0;
        }
        gCurrentSprite.animationDurationCounter++; // Double animation speed
    } else {
        switch (gCurrentSprite.currentAnimationFrame) {
            case 1:
            case 2:
            case 4:
            case 5:
                speed = 1;
                break;
            case 3:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_2);
                speed = 2;
                break;
            case 0:
                if (gCurrentSprite.animationDurationCounter == 1 && onScreen)
                    SoundPlayNotAlreadyPlaying(SOUND_ZORO_CRAWLING_1);
            default:
                speed = 0;
        }
    }
    return speed;
}

void ZoroCrawl(void) {
    u8 turn;
    u16 speed;

    if (gCurrentSprite.spriteId == PSPRITE_BLUE_ZORO)
        speed = ZoroBlueGetSpeed();
    else
        speed = ZoroRedGetSpeed();
    if (ZoroCheckCollidingWithAir()) {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }
    turn = FALSE;
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (gCurrentSprite.status & SS_Y_FLIP) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition - 4);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.yPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition - 4);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.yPosition -= speed;
                }
            }
        } else {
            if (gCurrentSprite.status & SS_Y_FLIP) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition - 4);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.yPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition - 4);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.yPosition -= speed;
                }
            }
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x40);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x40);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.xPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x40);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x40);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.xPosition -= speed;
                }
            }
        } else {
            if (gCurrentSprite.status & SS_X_FLIP) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x40);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x40);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.xPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x40);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn = TRUE;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x40);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn = TRUE;
                    else
                        gCurrentSprite.xPosition -= speed;
                }
            }
        }
    }
    if (turn)
        gCurrentSprite.pose = 3;
}

void ZoroTurningInit(void) {
    gCurrentSprite.pose = 4;
    ZoroSetTurningOam();
}

void ZoroTurningAround(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 5;
        ZoroSetTurningAroundSecondPartOam();
    }
}

void ZoroTurningAroundSecondPart(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void ZoroFallingInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.work4 = 0;
    ZoroSetCrawlingOam();
}

void ZoroFalling(void) {
    u16 yCollisionPoint;
    u16 xCollisionPoint;
    u32 blockTop;
    u8 onWall;
    u8 offset;
    s16 movement;

    onWall = FALSE;
    yCollisionPoint = gCurrentSprite.yPosition;
    xCollisionPoint = gCurrentSprite.xPosition;
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP)
            xCollisionPoint -= PIXEL_SIZE;
        yCollisionPoint += gCurrentSprite.hitboxBottom;
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP)
            yCollisionPoint += gCurrentSprite.hitboxBottom;
    }
    blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(yCollisionPoint, xCollisionPoint);
    if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
        gCurrentSprite.yPosition = blockTop;
        if (gCurrentSprite.work0)
            onWall++;
        gCurrentSprite.status &= ~SS_Y_FLIP;
        gCurrentSprite.work0 = FALSE;
        ZoroSetHitboxAndDrawDistance();
        if (onWall) {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxRight;
            else
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxLeft;
        }
        gCurrentSprite.pose = SPRITE_POSE_IDLE;
        ZoroSetCrawlingOam();
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

void Zoro(void) {
    if (gCurrentSprite.spriteId == PSPRITE_BLUE_ZORO) {
        if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
            SoundPlayNotAlreadyPlaying(SOUND_BLUE_ZORO_HURT);
    } else {
        if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
            SoundPlayNotAlreadyPlaying(SOUND_RED_ZORO_HURT);
    }
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ZoroInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            ZoroCrawlingInit();
        case SPRITE_POSE_IDLE:
            ZoroCrawl();
            break;
        case 3:
            ZoroTurningInit();
        case 4:
            ZoroTurningAround();
            break;
        case 5:
            ZoroTurningAroundSecondPart();
            break;
        case SPRITE_POSE_FALLING_INIT:
            ZoroFallingInit();
        case SPRITE_POSE_FALLING:
            ZoroFalling();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            ZoroInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            ZoroSetDeathPosition();
            XParasiteInit();
    }
}
