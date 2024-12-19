#include "globals.h"

#include "data/samus_data.h"
#include "data/sprites/sciser.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

u8 SciserCheckCollisions(void) {
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

void SciserUpdateHitbox(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxTop = -0x30;
            gCurrentSprite.hitboxBottom = 0x30;
            gCurrentSprite.hitboxLeft = -0x48;
            gCurrentSprite.hitboxRight = 0x10;
        } else {
            gCurrentSprite.hitboxTop = -0x30;
            gCurrentSprite.hitboxBottom = 0x30;
            gCurrentSprite.hitboxLeft = -0x10;
            gCurrentSprite.hitboxRight = 0x48;
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            gCurrentSprite.hitboxTop = 0x10; // BUG: should be -0x10
            gCurrentSprite.hitboxBottom = 0x48;
            gCurrentSprite.hitboxLeft = -0x30;
            gCurrentSprite.hitboxRight = 0x30;
        } else {
            gCurrentSprite.hitboxTop = -0x48;
            gCurrentSprite.hitboxBottom = 0x10;
            gCurrentSprite.hitboxLeft = -0x30;
            gCurrentSprite.hitboxRight = 0x30;
        }
    }
}

void SciserSetCrawlingGFX(void) {
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        if (gCurrentSprite.work0)
            gCurrentSprite.pOam = sSciserOam_DancingInBackgroundVertical;
        else
            gCurrentSprite.pOam = sSciserOam_DancingInBackgroundHorizontal;
    } else {
        if (gCurrentSprite.work0)
            gCurrentSprite.pOam = sSciserOam_CrawlingVertical;
        else
            gCurrentSprite.pOam = sSciserOam_CrawlingHorizontal;
    }
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void SciserSetIdleGFX(void) {
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        if (gCurrentSprite.work0)
            gCurrentSprite.pOam = sSciserOam_DancingInBackgroundVertical;
        else
            gCurrentSprite.pOam = sSciserOam_DancingInBackgroundHorizontal;
    } else {
        if (gCurrentSprite.work0)
            gCurrentSprite.pOam = sSciserOam_IdleVertical;
        else
            gCurrentSprite.pOam = sSciserOam_IdleHorizontal;
    }
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void SciserCheckSamusInRange(void) {
    if (!(gCurrentSprite.status & SS_ON_SCREEN)) return;
    if (gCurrentSprite.work1 > 0) {
        gCurrentSprite.work1--;
        return;
    }
    if (SpriteUtilCheckSamusNearSpriteLeftRight(0x140, 0x140) != NSLR_OUT_OF_RANGE) {
        gCurrentSprite.pose = 0x2a;
        if (gCurrentSprite.work0)
            gCurrentSprite.pOam = sSciserOam_PreparingToShootVertical;
        else
            gCurrentSprite.pOam = sSciserOam_PreparingToShootHorizontal;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.work1 = 30;
        SoundPlayNotAlreadyPlaying(SOUND_SCISER_PREPARING_TO_SHOOT);
    }
}

void SciserShooting(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.pOam == sSciserOam_PreparingToShootVertical) {
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.pOam = sSciserOam_ShootingVertical;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work1 = 60;
                SoundPlayNotAlreadyPlaying(SOUND_SCISER_SHOOTING);
            }
            return;
        }
    } else {
        if (gCurrentSprite.pOam == sSciserOam_PreparingToShootHorizontal) {
            if (--gCurrentSprite.work1 == 0) {
                gCurrentSprite.pOam = sSciserOam_ShootingHorizontal;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.work1 = 60;
                SoundPlayNotAlreadyPlaying(SOUND_SCISER_SHOOTING);
            }
            return;
        }
    }
    if (gCurrentSprite.work1 == 50) {
        if (gCurrentSprite.work0) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                SpriteSpawnSecondary(SSPRITE_SCISER_PROJECTILE, FALSE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x30, gCurrentSprite.xPosition - 0x40, 0);
                SpriteSpawnSecondary(SSPRITE_SCISER_PROJECTILE, TRUE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x30, gCurrentSprite.xPosition - 0x40, 0);
            } else {
                SpriteSpawnSecondary(SSPRITE_SCISER_PROJECTILE, FALSE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x30, gCurrentSprite.xPosition + 0x40, SS_X_FLIP);
                SpriteSpawnSecondary(SSPRITE_SCISER_PROJECTILE, TRUE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x30, gCurrentSprite.xPosition + 0x40, SS_X_FLIP);
            }
        } else {
            if (gCurrentSprite.status & SS_Y_FLIP) {
                SpriteSpawnSecondary(SSPRITE_SCISER_PROJECTILE, TRUE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition - 0x30, 0);
                SpriteSpawnSecondary(SSPRITE_SCISER_PROJECTILE, TRUE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition + 0x40, gCurrentSprite.xPosition + 0x30, SS_X_FLIP);
            } else {
                SpriteSpawnSecondary(SSPRITE_SCISER_PROJECTILE, FALSE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition - 0x30, 0);
                SpriteSpawnSecondary(SSPRITE_SCISER_PROJECTILE, FALSE, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x40, gCurrentSprite.xPosition + 0x30, SS_X_FLIP);
            }
        }
    }
    if (--gCurrentSprite.work1 == 0) {
        gCurrentSprite.pose = 7;
        gCurrentSprite.work1 = 120;
    }
}

void SciserTurningIntoX(void) {
    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition -= 0x28;
        else
            gCurrentSprite.xPosition += 0x28;
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP)
            gCurrentSprite.yPosition += 0x28;
        else
            gCurrentSprite.yPosition -= 0x28;
    }
}

void SciserInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        SpriteUtilChooseRandomXDirection();
        gCurrentSprite.pose = 2;
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
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
        gCurrentSprite.drawOrder = 12;
        gCurrentSprite.bgPriority = 3;
        gCurrentSprite.samusCollision = SSC_NONE;
    } else {
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        gCurrentSprite.drawOrder = 4;
        gCurrentSprite.bgPriority = 2;
        gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
        gCurrentSprite.frozenPaletteRowOffset = 1;
    }
    SciserSetCrawlingGFX();
    SciserUpdateHitbox();
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.work1 = 0;
    gCurrentSprite.work2 = 0;
    gCurrentSprite.work3 = 0;
    gCurrentSprite.drawDistanceTop = 0x18;
    gCurrentSprite.drawDistanceBottom = 0x18;
    gCurrentSprite.drawDistanceHorizontal = 0x18;
}

void SciserCrawlingInit(void) {
    SciserSetCrawlingGFX();
    gCurrentSprite.pose = 2;
}

void SciserCrawling(void) {
    u16 y, x, top, bottom, left, right;
    u16 otherY, otherX, otherTop, otherBottom, otherLeft, otherRight;
    u8 i;
    u8 turn;
    s16 speed;

    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        s16 movement;
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            movement = sSciserDancingSidewaysMovementRight[DIV_SHIFT(gCurrentSprite.work3, 8)];
        else
            movement = sSciserDancingSidewaysMovementLeft[DIV_SHIFT(gCurrentSprite.work3, 8)];
        if (gCurrentSprite.work0)
            gCurrentSprite.yPosition += movement;
        else
            gCurrentSprite.xPosition += movement;
        if (gCurrentSprite.work3 < ARRAY_SIZE(sSciserDancingSidewaysMovementRight) * 8 - 1)
            gCurrentSprite.work3 += 1;
        else
            gCurrentSprite.work3 = 0;
        return;
    }

    speed = 1;
    turn = FALSE;

    if (SciserCheckCollisions()) {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }

    // If touching another sciser, both turn around
    if (gCurrentSprite.work2 == 0) {
        y = gCurrentSprite.yPosition;
        x = gCurrentSprite.xPosition;
        top = y + gCurrentSprite.hitboxTop;
        bottom = y + gCurrentSprite.hitboxBottom;
        left = x + gCurrentSprite.hitboxLeft;
        right = x + gCurrentSprite.hitboxRight;
        for (i = 0; i < MAX_AMOUNT_OF_SPRITES; i++) {
            if (i == gCurrentSprite.primarySpriteRamSlot) continue;
            if (!(gSpriteData[i].status & SS_EXISTS)) continue;
            if (gSpriteData[i].properties & (SP_SECONDARY_SPRITE | SP_CAN_ABSORB_X)) continue;
            if (!(gSpriteData[i].spriteId == PSPRITE_SCISER || gSpriteData[i].spriteId == PSPRITE_GOLD_SCISER)) continue;
            otherY = gSpriteData[i].yPosition;
            otherX = gSpriteData[i].xPosition;
            otherTop = otherY + gSpriteData[i].hitboxTop;
            otherBottom = otherY + gSpriteData[i].hitboxBottom;
            otherLeft = otherX + gSpriteData[i].hitboxLeft;
            otherRight = otherX + gSpriteData[i].hitboxRight;
            if (SpriteUtilCheckObjectsTouching(top, bottom, left, right, otherTop, otherBottom, otherLeft, otherRight)) {
                gSpriteData[i].status ^= SS_FACING_RIGHT;
                gSpriteData[i].work2 = 120;
                gCurrentSprite.status ^= SS_FACING_RIGHT;
                gCurrentSprite.work2 = 120;
                break;
            }
        }
    } else
        gCurrentSprite.work2--;

    if (gCurrentSprite.work0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x38, gCurrentSprite.xPosition);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x38, gCurrentSprite.xPosition - 4);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.yPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition - 4);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.yPosition -= speed;
                }
            }
        } else {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x38, gCurrentSprite.xPosition - 4);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + 0x38, gCurrentSprite.xPosition);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.yPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition - 4);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.yPosition -= speed;
                }
            }
        }
    } else {
        if (gCurrentSprite.status & SS_Y_FLIP) {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x38);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x38);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.xPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x38);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x38);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.xPosition -= speed;
                }
            }
        } else {
            if (gCurrentSprite.status & SS_FACING_RIGHT) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x38);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x38);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
                    else
                        gCurrentSprite.xPosition += speed;
                }
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x38);
                if (!(gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0))
                    turn++;
                else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x38);
                    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F)
                        turn++;
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
    SciserCheckSamusInRange();
}

void SciserIdleInit(void) {
    gCurrentSprite.pose = 8;
    SciserSetIdleGFX();
}

void SciserIdle(void) {
    if (SciserCheckCollisions()) {
        gCurrentSprite.pose = SPRITE_POSE_FALLING_INIT;
        return;
    }
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 1;
}

void SciserFallingInit(void) {
    gCurrentSprite.pose = SPRITE_POSE_FALLING;
    gCurrentSprite.work4 = 0;
    SciserSetIdleGFX();
}

void SciserFalling(void) {
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
        SciserUpdateHitbox();
        if (onWall) {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxRight;
            else
                gCurrentSprite.xPosition -= gCurrentSprite.hitboxLeft;
        }
        if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
            gCurrentSprite.pose = 2;
            SciserSetCrawlingGFX();
        } else {
            gCurrentSprite.pose = 8;
            SciserSetIdleGFX();
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

void SciserProjectileInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 8;
    gCurrentSprite.hitboxTop = -8;
    gCurrentSprite.hitboxBottom = 8;
    gCurrentSprite.hitboxLeft = -8;
    gCurrentSprite.hitboxRight = 8;
    gCurrentSprite.pOam = sSciserProjectileOam_Moving;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS_DIES_WHEN_HIT;
    gCurrentSprite.drawOrder = 3;
}

void SciserProjectileFalling(void) {
    u8 offset;
    s16 yMovement;
    u16 xMovement;

    gCurrentClipdataAffectingAction = CAA_ENEMY_PROJECTILE;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
    if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
        gCurrentSprite.pose = SPRITE_POSE_STOPPED;
        return;
    }
    if (gCurrentSprite.roomSlot) {
        offset = gCurrentSprite.work4;
        yMovement = sSciserProjectileThrownUpVelocity[offset];
        if (yMovement == SHORT_MAX) {
            yMovement = sSciserProjectileThrownUpVelocity[offset - 1];
            gCurrentSprite.yPosition += yMovement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += yMovement;
        }
        xMovement = 8;
    } else {
        offset = gCurrentSprite.work4;
        yMovement = sSciserProjectileThrownDownVelocity[offset];
        if (yMovement == SHORT_MAX) {
            yMovement = sSciserProjectileThrownDownVelocity[offset - 1];
            gCurrentSprite.yPosition += yMovement;
        } else {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += yMovement;
        }
        xMovement = 4;
    }
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition += xMovement;
    else
        gCurrentSprite.xPosition -= xMovement;
}

void SciserProjectileExplodingInit(void) {
    gCurrentSprite.pose = 0x38;
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.bgPriority = 1;
    if (MOD_AND(gSpriteRandomNumber, 2) != 0)
        gCurrentSprite.pOam = sSciserProjectileOam_Exploding1;
    else
        gCurrentSprite.pOam = sSciserProjectileOam_Exploding2;
}

void SciserProjectileExploding(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        gCurrentSprite.status = 0;
}

void Sciser(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4) {
        if (gCurrentSprite.spriteId == PSPRITE_GOLD_SCISER)
            SoundPlayNotAlreadyPlaying(SOUND_GOLD_SCISER_HURT);
        else
            SoundPlayNotAlreadyPlaying(SOUND_SCISER_HURT);
    }
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            SciserInit();
            break;
        case 1:
            SciserCrawlingInit();
        case 2:
            SciserCrawling();
            break;
        case 7:
            SciserIdleInit();
        case 8:
            SciserIdle();
            break;
        case SPRITE_POSE_FALLING_INIT:
            SciserFallingInit();
        case SPRITE_POSE_FALLING:
            SciserFalling();
            break;
        case 0x2a:
            SciserShooting();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            SciserInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            SpriteSpawningFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            SciserTurningIntoX();
            XParasiteInit();
    }
}

void SciserProjectile(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            SciserProjectileInit();
        case SPRITE_POSE_IDLE:
            SciserProjectileFalling();
            break;
        case 0x38:
            SciserProjectileExploding();
            break;
        default:
            SciserProjectileExplodingInit();
    }
}
