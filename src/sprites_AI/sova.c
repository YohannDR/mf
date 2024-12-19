#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/sova.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u8 SovaCheckCollidingWithAir(void) {
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
        if (gCurrentSprite.work2) {
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

void SovaUpdateHitbox(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxTop = -0x1c;
            gCurrentSprite.hitboxBottom = 0x1c;
            gCurrentSprite.hitboxLeft = -0x40;
            gCurrentSprite.hitboxRight = 0x10;
        } else {
            gCurrentSprite.hitboxTop = -0x1c;
            gCurrentSprite.hitboxBottom = 0x1c;
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x40;
        }
    } else {
        if (gCurrentSprite.work2) {
            gCurrentSprite.hitboxTop = 0x10;
            gCurrentSprite.hitboxBottom = 0x40;
            gCurrentSprite.hitboxLeft = -0x1c;
            gCurrentSprite.hitboxRight = 0x1c;
        } else {
            gCurrentSprite.hitboxTop = -0x40;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -0x1c;
            gCurrentSprite.hitboxRight = 0x1c;
        }
    }
}

void SovaSetCrawlingOam(void) {
    if (gCurrentSprite.work0)
        gCurrentSprite.pOam = sSovaOam_CrawlingOnWall;
    else if (gCurrentSprite.work2)
        gCurrentSprite.pOam = sSovaOam_CrawlingOnCeiling;
    else
        gCurrentSprite.pOam = sSovaOam_CrawlingOnFlatGround;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void SovaTurningIntoX(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition -= 0x20;
        else
            gCurrentSprite.xPosition += 0x20;
    } else {
        if (gCurrentSprite.work2)
            gCurrentSprite.yPosition += 0x20;
        else
            gCurrentSprite.yPosition -= 0x20;
    }
}

void SovaInit(void) {
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
        gCurrentSprite.work2 = FALSE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.work0 = FALSE;
            gCurrentSprite.work3 = gSpriteRandomNumber * 4 + 70;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x44, gCurrentSprite.xPosition);
            if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                gCurrentSprite.work0 = FALSE;
                gCurrentSprite.yPosition -= 0x40;
                gCurrentSprite.work2 = TRUE;
                gCurrentSprite.work3 = gSpriteRandomNumber * 4 + 30;
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition - 0x24);
                if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                    gCurrentSprite.work0 = TRUE;
                    gCurrentSprite.yPosition -= 0x20;
                    gCurrentSprite.xPosition -= 0x20;
                    gCurrentSprite.work3 = gSpriteRandomNumber * 4 + 30;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x20, gCurrentSprite.xPosition + 0x20);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                        gCurrentSprite.work0 = TRUE;
                        gCurrentSprite.status |= SS_X_FLIP;
                        gCurrentSprite.yPosition -= 0x20;
                        gCurrentSprite.xPosition += 0x20;
                        gCurrentSprite.work3 = gSpriteRandomNumber * 4 + 30;
                    } else {
                        gCurrentSprite.status = 0;
                        return;
                    }
                }
            }
        }
    }
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    SovaSetCrawlingOam();
    SovaUpdateHitbox();
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
}

void SovaIdleInit(void) {
    SovaSetCrawlingOam();
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
}

void SovaIdle(void) {
    u8 turn;
    s16 speed;

    if (gCurrentSprite.status & SS_HIDDEN) return;
    speed = 1;
    turn = FALSE;
    gCurrentSprite.work3--;
    if (gCurrentSprite.work0) {
        if (SovaCheckCollidingWithAir()) {
            // Fall if in midair
            gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
            return;
        }
        if (gCurrentSprite.status & SS_X_FLIP) {
            // On right wall
            if (gCurrentSprite.work3 == 0) {
                // Drop falling flames periodically
                SpriteSpawnSecondary(SSPRITE_SOVA_FIRE, TRUE, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition + 0x14, gCurrentSprite.xPosition - 0x14, 0);
                gCurrentSprite.work3 = 160;
                if (gCurrentSprite.status & SS_ON_SCREEN)
                    SoundPlayNotAlreadyPlaying(SOUND_SOVA_DROPPING_FLAME);
            }
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                // Moving down
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x28, gCurrentSprite.xPosition);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++; // Turn if it encountered a ledge
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x28, gCurrentSprite.xPosition - 4);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++; // Turn if it encountered a floor
                    else
                        gCurrentSprite.yPosition += speed;
                }
            } else {
                // Moving up
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x28, gCurrentSprite.xPosition);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++; // Turn if it encountered a ledge
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x28, gCurrentSprite.xPosition - 4);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++; // Turn if it encountered a ceiling
                    else
                        gCurrentSprite.yPosition -= speed;
                }
            }
        } else {
            // On left wall
            if (gCurrentSprite.work3 == 0) {
                // Drop falling flames periodically
                SpriteSpawnSecondary(SSPRITE_SOVA_FIRE, TRUE, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition + 0x14, gCurrentSprite.xPosition + 0x14, 0);
                gCurrentSprite.work3 = 160;
                if (gCurrentSprite.status & SS_ON_SCREEN)
                    SoundPlayNotAlreadyPlaying(SOUND_SOVA_DROPPING_FLAME);
            }
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                // Moving down
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x28, gCurrentSprite.xPosition - 4);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++; // Turn if it encountered a ledge
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x28, gCurrentSprite.xPosition);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++; // Turn if it encountered a floor
                    else
                        gCurrentSprite.yPosition += speed;
                }
            } else {
                // Moving up
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x28, gCurrentSprite.xPosition - 4);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++; // Turn if it encountered a ledge
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x28, gCurrentSprite.xPosition);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++; // Turn if it encountered a ceiling
                    else
                        gCurrentSprite.yPosition -= speed;
                }
            }
        }
    } else {
        if (gCurrentSprite.work2) {
            // On ceiling
            if (gCurrentSprite.work3 == 0) {
                // Drop falling flames periodically
                SpriteSpawnSecondary(SSPRITE_SOVA_FIRE, TRUE, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot,
                    gCurrentSprite.yPosition + 0x14, gCurrentSprite.xPosition, 0);
                gCurrentSprite.work3 = 160;
                if (gCurrentSprite.status & SS_ON_SCREEN)
                    SoundPlayNotAlreadyPlaying(SOUND_SOVA_DROPPING_FLAME);
            }
            if (SovaCheckCollidingWithAir()) {
                gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
                return;
            }
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x28);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x28);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.xPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x28);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x28);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.xPosition -= speed;
                }
            }
        } else {
            // Drop trailing flames periodically
            if (gCurrentSprite.work3 == 64 || gCurrentSprite.work3 == 32) {
                SpriteSpawnSecondary(SSPRITE_SOVA_FIRE, FALSE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                if (gCurrentSprite.status & SS_ON_SCREEN)
                    SoundPlayNotAlreadyPlaying(SOUND_SOVA_DROPPING_FLAME);
            } else if (gCurrentSprite.work3 == 0) {
                SpriteSpawnSecondary(SSPRITE_SOVA_FIRE, FALSE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
                gCurrentSprite.work3 = 210;
                if (gCurrentSprite.status & SS_ON_SCREEN)
                    SoundPlayNotAlreadyPlaying(SOUND_SOVA_DROPPING_FLAME);
            }
            SpriteUtilAlignYPosOnSlope();
            if (gPreviousVerticalCollisionCheck == COLLISION_AIR) {
                // About to fall off a ledge
                if (gCurrentSprite.status & SS_X_FLIP) {
                    SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
                    if (gPreviousVerticalCollisionCheck == COLLISION_AIR) {
                        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
                        return;
                    } else
                        gCurrentSprite.xPosition += speed;
                } else {
                    SpriteUtilCheckVerticalCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
                    if (gPreviousVerticalCollisionCheck == COLLISION_AIR) {
                        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
                        return;
                    } else
                        gCurrentSprite.xPosition -= speed;
                }
            } else {
                if (gPreviousVerticalCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
                    // On flat ground
                    if (gCurrentSprite.pOam == sSovaOam_CrawlingOnSlope) {
                        // Set on flat ground OAM and remove X flip if previously on slope
                        gCurrentSprite.pOam = sSovaOam_CrawlingOnFlatGround;
                        if (gCurrentSprite.status & SS_X_FLIP)
                            gCurrentSprite.status &= ~SS_X_FLIP;
                    }
                    if (gCurrentSprite.status & SS_FACING_RIGHT) {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x28);
                        if (gPreviousCollisionCheck == COLLISION_AIR)
                            turn++; // Turn if it encountered a ledge
                        else {
                            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x28);
                            if (gPreviousCollisionCheck == COLLISION_SOLID)
                                turn++; // Turn if it encountered a wall
                        }
                    } else {
                        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x28);
                        if (gPreviousCollisionCheck == COLLISION_AIR)
                            turn++; // Turn if it encountered a ledge
                        else {
                            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x28);
                            if (gPreviousCollisionCheck == COLLISION_SOLID)
                                turn++; // Turn if it encountered a wall
                        }
                    }
                } else {
                    // On slope, set on slope OAM and apply X flip on right slopes if previously on ground
                    // Assumes that ledges and walls are not encountered
                    if ((gPreviousVerticalCollisionCheck == COLLISION_LEFT_SLIGHT_FLOOR_SLOPE
                        || gPreviousVerticalCollisionCheck == COLLISION_LEFT_STEEP_FLOOR_SLOPE)
                        && gCurrentSprite.pOam == sSovaOam_CrawlingOnFlatGround)
                        gCurrentSprite.pOam = sSovaOam_CrawlingOnSlope;
                    if ((gPreviousVerticalCollisionCheck == COLLISION_RIGHT_SLIGHT_FLOOR_SLOPE
                        || gPreviousVerticalCollisionCheck == COLLISION_RIGHT_STEEP_FLOOR_SLOPE)
                        && gCurrentSprite.pOam == sSovaOam_CrawlingOnFlatGround) {
                        gCurrentSprite.pOam = sSovaOam_CrawlingOnSlope;
                        gCurrentSprite.status |= SS_X_FLIP;
                    }
                }
                // Move forward if not turning
                if (!turn) {
                    if (gCurrentSprite.status & SS_FACING_RIGHT)
                        gCurrentSprite.xPosition += speed;
                    else
                        gCurrentSprite.xPosition -= speed;
                }
            }
        }
    }
    if (turn) {
        gCurrentSprite.status ^= SS_FACING_RIGHT;
        gCurrentSprite.pose = 7;
    }
}

void SovaTurningAroundInit(void) {
    gCurrentSprite.pose = 8;
    gCurrentSprite.work1 = 30; // Stop for half of a second
}

void SovaTurningAround(void) {
    if (SovaCheckCollidingWithAir())
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
    else if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

void SovaFallingInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.work4 = 0;
}

void SovaFalling(void) {
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
        gCurrentSprite.pose = 7;
        gCurrentSprite.work0 = FALSE;
        gCurrentSprite.status &= ~SS_Y_FLIP;
        gCurrentSprite.work2 = FALSE;
        SovaSetCrawlingOam();
        SovaUpdateHitbox();
        if (onWall) {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxRight;
            else
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxLeft;
        }
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

void SovaFireInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 0x20;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -0x28;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -8;
    gCurrentSprite.hitboxRight = 8;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawOrder = 5;
    if (gCurrentSprite.roomSlot) {
        // Falling flame
        gCurrentSprite.pOam = sSovaFallingFlameOam_Falling;
        gCurrentSprite.pose = SPRITE_POSE_FALLING;
        gCurrentSprite.work4 = 0;
    } else {
        // Flame on ground
        gCurrentSprite.pOam = sSovaGroundFlameOam_Big;
        gCurrentSprite.pose = 2;
        gCurrentSprite.work1 = 50;
    }
}

void SovaFireBig(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.hitboxTop = -0x1c;
        gCurrentSprite.pOam = sSovaGroundFlameOam_Small;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.work1 = 50;
    }
}

void SovaFireSmall(void) {
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.hitboxTop = -0x10;
        gCurrentSprite.pOam = sSovaGroundFlameOam_Disappearing;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.work1 = 30;
    }
}

void SovaFireDisappearing(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (MOD_AND(gCurrentSprite.work1, 2) == 0)
        gCurrentSprite.status ^= SS_NOT_DRAWN;
    if (--gCurrentSprite.work1 == 0)
        gCurrentSprite.status = 0;
}

void SovaFireExplodingInit(void) {
    gCurrentSprite.pOam = sSovaFallingFlameOam_Exploding;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = SPRITE_POSE_LANDED;
    if (gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(SOUND_SOVA_FALLING_FLAME_EXPLODING);
}

void SovaFireExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void Sova(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_SOVA_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            SovaInit();
            break;
        case SPRITE_POSE_IDLE_INIT:
            SovaIdleInit();
        case SPRITE_POSE_IDLE:
            SovaIdle();
            break;
        case 7:
            SovaTurningAroundInit();
        case 8:
            SovaTurningAround();
            break;
        case SPRITE_POSE_FALLING_INIT:
            SovaFallingInit();
        case SPRITE_POSE_FALLING:
            SovaFalling();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            SovaInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            SovaTurningIntoX();
            XParasiteInit();
    }
}

void SovaFire(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            SovaFireInit();
            break;
        case 2:
            SovaFireBig();
            break;
        case 0x18:
            SovaFireSmall();
            break;
        case 0x1a:
            SovaFireDisappearing();
            break;
        case SPRITE_POSE_FALLING:
            SpriteUtilCurrentSpriteFalling();
            break;
        case SPRITE_POSE_LANDED_INIT:
            SovaFireExplodingInit();
        case SPRITE_POSE_LANDED:
            SovaFireExploding();
    }
}
