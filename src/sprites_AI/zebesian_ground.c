#include "macros.h"
#include "globals.h"

#include "data/sprites/zebesian_ground.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/clipdata.h"
#include "constants/samus.h"
#include "gba/keys.h"

#include "structs/sprite.h"
#include "structs/samus.h"

u8 ZebesianGroundCheckInShootingRange(void) {
    if (gSamusData.yPosition + gSamusData.drawDistanceTop / 2 > gCurrentSprite.yPosition) {
        return NSFB_OUT_OF_RANGE;
    } else {
        u32 nsfb = SpriteUtilCheckSamusNearSpriteFrontBehind(0xc0, 0x100, 0x340);
        if (nsfb == NSFB_IN_FRONT) {
            gCurrentSprite.pose = 0x17;
            gCurrentSprite.work2 = FALSE;
            gCurrentSprite.work1 = 0;
            return NSFB_IN_FRONT;
        } else {
            if (gCurrentSprite.work1 > 0)
                if (--gCurrentSprite.work1 > 0)
                    return NSFB_OUT_OF_RANGE;
            nsfb = SpriteUtilCheckSamusNearSpriteFrontBehind(0x180, 0x340, 0x340);
            if (nsfb == NSFB_IN_FRONT) {
                gCurrentSprite.pose = 0x29;
            } else if (nsfb == NSFB_BEHIND) {
                gCurrentSprite.pose = 3;
                gCurrentSprite.work2 = TRUE;
            }
            return nsfb;
        }
    }
}

u8 ZebesianGroundCheckCollidingWithAir(void) {
    u8 cond = FALSE;
    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x24);
    if (gPreviousCollisionCheck == 0) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x24);
        if (gPreviousCollisionCheck == 0) cond = TRUE;
    }
    return cond;
}

void ZebesianGroundSetIdleHitbox(void) {
    gCurrentSprite.hitboxTop = -0xc0;
    gCurrentSprite.hitboxBottom = 0;
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x20;
        gCurrentSprite.hitboxRight = 0x38;
    } else {
        gCurrentSprite.hitboxLeft = -0x38;
        gCurrentSprite.hitboxRight = 0x20;
    }
}

void ZebesianGroundSetShootingHitbox(void) {
    if (gCurrentSprite.work2)
        gCurrentSprite.hitboxTop = -0x80;
    else
        gCurrentSprite.hitboxTop = -0xc0;
    gCurrentSprite.hitboxBottom = 0;
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x20;
        gCurrentSprite.hitboxRight = 0x70;
    } else {
        gCurrentSprite.hitboxLeft = -0x70;
        gCurrentSprite.hitboxRight = 0x20;
    }
}

void ZebesianGroundInit(void) {
    if (gCurrentSprite.pose == 0x59) {
        gCurrentSprite.pose = 0x5a;
        gCurrentSprite.work1 = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        if (gCurrentSprite.spriteId == PSPRITE_ZEBESIAN_PRE_AQUA) {
            if (gCurrentSprite.status & SS_HIDDEN) {
                gCurrentSprite.status = 0;
                return;
            }
            gCurrentSprite.properties |= SP_CAN_ABSORB_X;
        } else {
            SpriteUtilTrySetAbsorbXFlag();
            if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
                if (!(gCurrentSprite.status & SS_HIDDEN)) {
                    gCurrentSprite.status = 0;
                    return;
                }
                gCurrentSprite.numberOfXToForm = 2;
            }
        }
        SpriteUtilChooseRandomXFlip();
        gCurrentSprite.pose = 2;
        gCurrentSprite.work1 = 30;
    }
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 0x38;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x20;
    gCurrentSprite.pOam = sZebesianGroundOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work2 = FALSE;
    ZebesianGroundSetIdleHitbox();
}

void ZebesianGroundSpawningFromX(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.work1 > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.work1];
    } else {
        if (gCurrentSprite.spriteId == PSPRITE_ZEBESIAN_PRE_AQUA) {
            gCurrentSprite.spritesetGfxSlot = 0;
            gCurrentSprite.spriteId = PSPRITE_ZEBESIAN_AQUA;
            gCurrentSprite.properties &= ~SP_CAN_ABSORB_X;
            gCurrentSprite.pose = 0x59;
            gCurrentSprite.yPosition -= 0x40;
        } else {
            gCurrentSprite.pose = 2;
            gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
            gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
        }
    }
}

void ZebesianPreAquaTurningintoX(void) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_AQUA_ZEBESIAN, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition + 0x20, SS_X_FLIP);
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_AQUA_ZEBESIAN, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x98, gCurrentSprite.xPosition - 0x10, 0);
    } else {
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_AQUA_ZEBESIAN, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition - 0x20, SS_X_FLIP);
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE_AQUA_ZEBESIAN, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x98, gCurrentSprite.xPosition + 0x10, 0);
    }
    gCurrentSprite.status = 0;
}

void ZebesianGroundTurningIntoX(void) {
    if (gCurrentSprite.spriteId == PSPRITE_GOLD_ZEBESIAN) {
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x1c, gCurrentSprite.xPosition - 0x18, SS_X_FLIP);
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition + 0x18, 0);
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x54, gCurrentSprite.xPosition - 0xc, SS_X_FLIP);
        SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
            gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x70, gCurrentSprite.xPosition + 0xc, 0);
        gCurrentSprite.yPosition -= 0x8c;
    } else {
        if (gCurrentSprite.status & SS_X_FLIP) {
            SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition + 0x20, SS_X_FLIP);
            gCurrentSprite.xPosition -= 0x10;
        } else {
            SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
                gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x60, gCurrentSprite.xPosition - 0x20, SS_X_FLIP);
            gCurrentSprite.xPosition += 0x10;
        }
        gCurrentSprite.yPosition -= 0x98;
    }
}

void ZebesianGroundFallingInit(void) {
    gCurrentSprite.pose = 0x16;
    gCurrentSprite.work4 = 0;
    gCurrentSprite.pOam = sZebesianGroundOam_Falling;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    ZebesianGroundSetIdleHitbox();
}

void ZebesianGroundIdleInit(void) {
    gCurrentSprite.pOam = sZebesianGroundOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
    ZebesianGroundSetIdleHitbox();
    gCurrentSprite.unk_8 = gCurrentSprite.xPosition;
}

void ZebesianGroundIdle(void) {
    u32 action;
    if (gCurrentSprite.status & SS_HIDDEN) return;
    action = 0;
    if (ZebesianGroundCheckCollidingWithAir()) {
        gCurrentSprite.pose = 0x15;
        return;
    }
    SpriteUtilAlignYPosOnSlope();
    if (gPreviousVerticalCollisionCheck & 0xf0) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
            if ((gPreviousCollisionCheck & 0xf0) == 0) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x60);
                if ((gPreviousCollisionCheck & 0xf0) == 0)
                    action = 1;
                else
                    action = 2;
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x40);
                if ((gPreviousCollisionCheck & 0xf) != 0) {
                    action = 1;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0xa0, gCurrentSprite.xPosition + 0x40);
                    if ((gPreviousCollisionCheck & 0xf) != 0)
                        action = 1;
                    else
                        gCurrentSprite.xPosition += 4;
                }
            }
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
            if ((gPreviousCollisionCheck & 0xf0) == 0) {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x60);
                if ((gPreviousCollisionCheck & 0xf0) == 0)
                    action = 1;
                else
                    action = 2;
            } else {
                SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x40);
                if ((gPreviousCollisionCheck & 0xf) != 0) {
                    action = 1;
                } else {
                    SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0xa0, gCurrentSprite.xPosition - 0x40);
                    if ((gPreviousCollisionCheck & 0xf) != 0)
                        action = 1;
                    else
                        gCurrentSprite.xPosition -= 4;
                }
            }
        }
    } else {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition += 4;
        else
            gCurrentSprite.xPosition -= 4;
    }
    if (gCurrentSprite.status & SS_ON_SCREEN) {
        if (gCurrentSprite.currentAnimationFrame == 2 && gCurrentSprite.animationDurationCounter == 1)
            SoundPlay(0x1af);
        else if (gCurrentSprite.currentAnimationFrame == 6 && gCurrentSprite.animationDurationCounter == 1)
            SoundPlay(0x1af);
    }
    if (!ZebesianGroundCheckInShootingRange()) {
        if (action == 1) {
            gCurrentSprite.pose = 9;
        } else if (action == 2) {
            gCurrentSprite.pose = 0x17;
            gCurrentSprite.work2 = TRUE;
        } else if (gCurrentSprite.work1 == 0) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                if (gCurrentSprite.unk_8 + 0x100 < gCurrentSprite.xPosition)
                    gCurrentSprite.pose = 9;
            } else {
                if (gCurrentSprite.unk_8 - 0x100 > gCurrentSprite.xPosition)
                    gCurrentSprite.pose = 9;
            }
        }
    }
}

void ZebesianGroundTurningAroundInit(void) {
    gCurrentSprite.pose = 4;
    gCurrentSprite.pOam = sZebesianGroundOam_TurningAround;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

void ZebesianGroundTurningAround(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 5;
        gCurrentSprite.pOam = sZebesianGroundOam_TurningAroundSecondPart;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.status ^= SS_X_FLIP;
    }
}

void ZebesianGroundTurningAroundSecondPart(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        if (gCurrentSprite.work2) {
            gCurrentSprite.work2 = FALSE;
            gCurrentSprite.pose = 0x29;
        } else
            gCurrentSprite.pose = 1;
    }
}

void ZebesianGroundJumpWarningInit(void) {
    gCurrentSprite.pOam = sZebesianGroundOam_StartJumping;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x18;
}

void ZebesianGroundJumpWarning(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianGroundOam_Jumping;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.work4 = 0;
        gCurrentSprite.hitboxTop = -0xa0;
        if (gCurrentSprite.status & SS_ON_SCREEN)
            SoundPlayNotAlreadyPlaying(0x1ad);
    }
}

void ZebesianGroundLandingInit(void); // need to do this so the compiler won't throw a warning for some reason

void ZebesianGroundJumping(void) {
    u32 collided = FALSE;
    s16 movement;

    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition + 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            collided = TRUE;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x50, gCurrentSprite.xPosition + 0x40);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                collided = TRUE;
            else
                gCurrentSprite.xPosition += 10;
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x10, gCurrentSprite.xPosition - 0x40);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            collided = TRUE;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0x50, gCurrentSprite.xPosition - 0x40);
            if (gPreviousCollisionCheck == COLLISION_SOLID)
                collided = TRUE;
            else
                gCurrentSprite.xPosition -= 10;
        }
    }

    if (gCurrentSprite.work2) {
        movement = sZebesianGroundJumpingSpeedLow[gCurrentSprite.work4 / 2];
        gCurrentSprite.yPosition += movement;
        if (gCurrentSprite.work4 < ARRAY_SIZE(sZebesianGroundJumpingSpeedLow) * 2 - 1)
            gCurrentSprite.work4++;
    } else {
        movement = sZebesianGroundJumpingSpeedHigh[gCurrentSprite.work4 / 4];
        gCurrentSprite.yPosition += movement;
        if (gCurrentSprite.work4 < ARRAY_SIZE(sZebesianGroundJumpingSpeedHigh) * 4 - 1)
            gCurrentSprite.work4++;
    }

    if (movement > 0) {
        u32 blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
        if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
            gCurrentSprite.yPosition = blockTop;
            ZebesianGroundLandingInit();
        } else if (!collided) {
            blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x20);
            if (gPreviousVerticalCollisionCheck != COLLISION_AIR) {
                collided = TRUE;
            } else {
                blockTop = SpriteUtilCheckVerticalCollisionAtPositionSlopes(gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x20);
                if (gPreviousVerticalCollisionCheck != COLLISION_AIR)
                    collided = TRUE;
            }
            if (collided) {
                gCurrentSprite.yPosition = blockTop;
                ZebesianGroundLandingInit();
            }
        }
    } else {
        collided = FALSE;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition + 0x20);
        if (gPreviousCollisionCheck == COLLISION_SOLID) {
            collided = TRUE;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition + gCurrentSprite.hitboxTop, gCurrentSprite.xPosition - 0x20);
            if (gPreviousCollisionCheck == COLLISION_SOLID) collided = TRUE;
        }
        if (collided) ZebesianGroundFallingInit();
    }
}

void ZebesianGroundLandingInit(void) {
    gCurrentSprite.pOam = sZebesianGroundOam_Landing;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x1c;
    if (gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(0x1ae);
}

void ZebesianGroundLanding(void) {
    u32 hitWall = FALSE;

    if (!SpriteUtilCheckNearEndCurrentSpriteAnim()) return;
    if (gCurrentSprite.work2) {
        gCurrentSprite.pose = 1;
        return;
    }
    if (ZebesianGroundCheckInShootingRange()) return;
    if (gCurrentSprite.status & SS_X_FLIP) {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition + 0x40);
        if ((gPreviousCollisionCheck & 0xf) != 0) {
            hitWall = TRUE;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0xa0, gCurrentSprite.xPosition + 0x40);
            if ((gPreviousCollisionCheck & 0xf) != 0) hitWall = TRUE;
        }
    } else {
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 4, gCurrentSprite.xPosition - 0x40);
        if ((gPreviousCollisionCheck & 0xf) != 0) {
            hitWall = TRUE;
        } else {
            SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition - 0xa0, gCurrentSprite.xPosition - 0x40);
            if ((gPreviousCollisionCheck & 0xf) != 0) hitWall = TRUE;
        }
    }
    if (hitWall)
        gCurrentSprite.pose = 3;
    else
        gCurrentSprite.pose = 1;
}

void ZebesianGroundWaitingInit(void) {
    gCurrentSprite.pOam = sZebesianGroundOam_Waiting;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 8;
    ZebesianGroundSetIdleHitbox();
}

void ZebesianGroundWaiting(void) {
    if (SpriteUtilCheckNearEndCurrentSpriteAnim()) gCurrentSprite.pose = 1;
}

void ZebesianGroundStandingInit(void) {
    gCurrentSprite.pOam = sZebesianGroundOam_Waiting;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 10;
    gCurrentSprite.work2 = gSpriteRandomNumber / 4 + 2;
}

void ZebesianGroundStanding(void) {
    if (ZebesianGroundCheckInShootingRange()) return;
    if (!SpriteUtilCheckNearEndCurrentSpriteAnim()) return;
    if (--gCurrentSprite.work2 == 0) gCurrentSprite.pose = 3;
}

void ZebesianGroundShootingInit(void) {
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2a;
    gCurrentSprite.work1 = 70;
    if (SpriteUtilCheckSamusCrouchingOrMorphed()) {
        gCurrentSprite.work2 = TRUE;
        gCurrentSprite.pOam = sZebesianGroundOam_ShootingWhileCrouching;
    } else {
        gCurrentSprite.work2 = FALSE;
        gCurrentSprite.pOam = sZebesianGroundOam_ShootingWhileStanding;
    }
    ZebesianGroundSetShootingHitbox();
}

void ZebesianGroundShooting(void) {
    if (gCurrentSprite.work2) {
        if (gCurrentSprite.currentAnimationFrame == 6 && gCurrentSprite.animationDurationCounter == 1) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                SpriteSpawnSecondary(SSPRITE_ZEBESIAN_GROUND_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x50, gCurrentSprite.xPosition + 0x58, SS_X_FLIP);
                SpriteSpawnSecondary(SSPRITE_ZEBESIAN_GROUND_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x30, gCurrentSprite.xPosition + 0x18, SS_X_FLIP);
            } else {
                SpriteSpawnSecondary(SSPRITE_ZEBESIAN_GROUND_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x50, gCurrentSprite.xPosition - 0x58, 0);
                SpriteSpawnSecondary(SSPRITE_ZEBESIAN_GROUND_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x30, gCurrentSprite.xPosition - 0x18, 0);
            }
        }
    } else {
        if (gCurrentSprite.currentAnimationFrame == 7 && gCurrentSprite.animationDurationCounter == 1) {
            if (gCurrentSprite.status & SS_X_FLIP) {
                SpriteSpawnSecondary(SSPRITE_ZEBESIAN_GROUND_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x78, gCurrentSprite.xPosition + 0x60, SS_X_FLIP);
                SpriteSpawnSecondary(SSPRITE_ZEBESIAN_GROUND_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x68, gCurrentSprite.xPosition + 0x10, SS_X_FLIP);
            } else {
                SpriteSpawnSecondary(SSPRITE_ZEBESIAN_GROUND_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x78, gCurrentSprite.xPosition - 0x60, 0);
                SpriteSpawnSecondary(SSPRITE_ZEBESIAN_GROUND_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                    gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition - 0x68, gCurrentSprite.xPosition - 0x10, 0);
            }
        }
    }
    if (SpriteUtilCheckNearEndCurrentSpriteAnim())
        gCurrentSprite.pose = 0x2b;
}

void ZebesianGroundShootingEndInit(void) {
    gCurrentSprite.pOam = sZebesianGroundOam_Waiting;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2c;
    ZebesianGroundSetIdleHitbox();
}

void ZebesianGroundShootingEnd(void) {
    if (gSamusData.yPosition + gSamusData.drawDistanceTop / 2 > gCurrentSprite.yPosition) {
        gCurrentSprite.pose = 1;
    } else {
        u32 nsfb = SpriteUtilCheckSamusNearSpriteFrontBehind(0xc0, 0x100, 0x340);
        if (nsfb == NSFB_IN_FRONT) {
            gCurrentSprite.pose = 0x17;
            gCurrentSprite.work2 = FALSE;
            gCurrentSprite.work1 = 0;
        } else {
            if (gCurrentSprite.work1 > 0) gCurrentSprite.work1--;
            nsfb = SpriteUtilCheckSamusNearSpriteFrontBehind(0x180, 0x340, 0x340);
            if (nsfb == NSFB_IN_FRONT) {
                if (gCurrentSprite.work1 == 0)
                    gCurrentSprite.pose = 0x29;
            } else if (nsfb == NSFB_BEHIND) {
                if (gCurrentSprite.work1 == 0) {
                    gCurrentSprite.pose = 3;
                    gCurrentSprite.work2 = TRUE;
                }
            } else {
                gCurrentSprite.pose = 1;
            }
        }
    }
}

void ZebesianGroundBeamInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x30;
    gCurrentSprite.hitboxTop = -8;
    gCurrentSprite.hitboxBottom = 8;
    gCurrentSprite.pOam = sZebesianGroundBeamOam_Spawning;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = 2;
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.bgPriority = 1;
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = 0x10;
        gCurrentSprite.hitboxRight = 0x30;
    } else {
        gCurrentSprite.hitboxLeft = -0x30;
        gCurrentSprite.hitboxRight = -0x10;
    }
    if (gCurrentSprite.status & SS_ON_SCREEN)
        SoundPlayNotAlreadyPlaying(0x15d);
}

void ZebesianGroundBeamSpawning(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianGroundBeamOam_SpawningSecondPart;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0x60;
        } else {
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = -0x20;
        }
    }
}

void ZebesianGroundBeamSpawningSecondPart(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianGroundBeamOam_Fired;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0xa0;
        } else {
            gCurrentSprite.hitboxLeft = -0xa0;
            gCurrentSprite.hitboxRight = -0x20;
        }
    }
}

u8 ZebesianGroundCheckSkipMovement(void) {
    if (gCurrentSprite.spriteId == PSPRITE_ZEBESIAN_PRE_AQUA && (gFrameCounter8Bit & 1) != 0) {
        gCurrentSprite.animationDurationCounter--;
        return TRUE;
    }
    return FALSE;
}

void ZebesianGround(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(0x15e);
    gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case 0:
            ZebesianGroundInit();
            break;
        case 1:
            ZebesianGroundIdleInit();
        case 2:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundIdle();
            break;
        case 7:
            ZebesianGroundWaitingInit();
        case 8:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundWaiting();
            break;
        case 9:
            ZebesianGroundStandingInit();
        case 0xa:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundStanding();
            break;
        case 3:
            ZebesianGroundTurningAroundInit();
        case 4:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundTurningAround();
            break;
        case 5:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundTurningAroundSecondPart();
            break;
        case 0x15:
            ZebesianGroundFallingInit();
        case 0x16:
            if (ZebesianGroundCheckSkipMovement()) return;
            SpriteUtilCurrentSpriteFalling();
            break;
        case 0x17:
            ZebesianGroundJumpWarningInit();
        case 0x18:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundJumpWarning();
            break;
        case 0x1a:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundJumping();
            break;
        case 0x1c:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundLanding();
            break;
        case 0x29:
            ZebesianGroundShootingInit();
        case 0x2a:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundShooting();
            break;
        case 0x2b:
            ZebesianGroundShootingEndInit();
        case 0x2c:
            if (ZebesianGroundCheckSkipMovement()) return;
            ZebesianGroundShootingEnd();
            break;
        case 0x57:
            SpriteDyingInit();
        case 0x58:
            SpriteDying();
            break;
        case 0x59:
            ZebesianGroundInit();
        case 0x5a:
            ZebesianGroundSpawningFromX();
            break;
        case 0x5b:
            if (gCurrentSprite.spriteId == PSPRITE_ZEBESIAN_PRE_AQUA) {
                ZebesianPreAquaTurningintoX();
            } else {
                ZebesianGroundTurningIntoX();
                XParasiteInit();
            }
    }
    if (gCurrentSprite.spriteId == PSPRITE_GOLD_ZEBESIAN) {
        if (gCurrentSprite.status & SS_X_FLIP) {
            if (!(gSamusData.direction & KEY_RIGHT))
                gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
        } else {
            if ((gSamusData.direction & KEY_RIGHT))
                gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
        }
    }
}

void ZebesianGroundBeam(void) {
    switch (gCurrentSprite.pose) {
        case 0:
            ZebesianGroundBeamInit();
            break;
        case 2:
            ZebesianGroundBeamSpawning();
            break;
        case 0x18:
            ZebesianGroundBeamSpawningSecondPart();
    }
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition += 10;
    else
        gCurrentSprite.xPosition -= 10;
}
