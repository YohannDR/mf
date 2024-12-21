#include "macros.h"
#include "globals.h"

#include "data/sprites/zebesian_wall.h"
#include "data/sprites/x_parasite.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

#define ZEBESIAN_WALL_CRAWLING_INIT 1
#define ZEBESIAN_WALL_CRAWLING 2
#define ZEBESIAN_WALL_TURNING_AROUND_INIT 0x19
#define ZEBESIAN_WALL_TURNING_AROUND 0x1a
#define ZEBESIAN_WALL_JUMPING 0x1c
#define ZEBESIAN_WALL_IDLE_INIT 7
#define ZEBESIAN_WALL_IDLE 8
#define ZEBESIAN_WALL_SHOOTING_INIT 0x29
#define ZEBESIAN_WALL_SHOOTING 0x2a

void ZebesianWallSetSideHitboxes(void) {
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x50;
        gCurrentSprite.hitboxRight = 4;
    } else {
        gCurrentSprite.hitboxLeft = -4;
        gCurrentSprite.hitboxRight = 0x50;
    }
}

void ZebesianWallDecideRandomAction(void) {
    switch (gSpriteRandomNumber) {
        case 0:
        case 1:
        case 2:
        case 3:
            gCurrentSprite.status &= ~SS_FACING_RIGHT;
            gCurrentSprite.pose = ZEBESIAN_WALL_CRAWLING_INIT;
            break;
        case 4:
        case 5:
        case 6:
        case 7:
            gCurrentSprite.status |= SS_FACING_RIGHT;
            gCurrentSprite.pose = ZEBESIAN_WALL_CRAWLING_INIT;
            break;
        case 8:
        case 9:
            gCurrentSprite.pose = ZEBESIAN_WALL_TURNING_AROUND_INIT;
            break;
        case 10:
        case 11:
        case 12:
            gCurrentSprite.pose = ZEBESIAN_WALL_SHOOTING_INIT;
            break;
        default:
            gCurrentSprite.pose = ZEBESIAN_WALL_IDLE_INIT;
    }
}

void ZebesianWallInit(void) {
    SpriteUtilTrySetAbsorbXFlag();
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.drawDistanceTop = 0x28;
    gCurrentSprite.drawDistanceBottom = 0x28;
    gCurrentSprite.drawDistanceHorizontal = 0x20;
    gCurrentSprite.pOam = sZebesianWallOam_Crawling;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    if (gCurrentSprite.pose == SPRITE_POSE_SPAWNING_FROM_X_INIT) {
        gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X;
        gCurrentSprite.unk_8 = X_PARASITE_MOSAIC_MAX_INDEX;
    } else {
        gCurrentSprite.bgPriority = 1;
        gCurrentSprite.pose = ZEBESIAN_WALL_CRAWLING;
        gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
        SpriteUtilCheckCollisionAtPosition(gCurrentSprite.yPosition, gCurrentSprite.xPosition + BLOCK_SIZE);
        if (gPreviousCollisionCheck & COLLISION_FLAGS_UNKNOWN_F0) {
            gCurrentSprite.status |= SS_X_FLIP;
            gCurrentSprite.xPosition += 0x20;
        } else {
            gCurrentSprite.xPosition -= 0x20;
        }
        SpriteUtilChooseRandomXDirection();
    }
    if (gCurrentSprite.properties & SP_CAN_ABSORB_X) {
        if (!(gCurrentSprite.status & SS_HIDDEN)) {
            gCurrentSprite.status = 0;
            return;
        }
        gCurrentSprite.numberOfXToForm = 2;
        gCurrentSprite.hitboxTop = -0x70;
    } else {
        gCurrentSprite.hitboxTop = -0x60;
    }
    gCurrentSprite.hitboxBottom = 0x50;
    ZebesianWallSetSideHitboxes();
}

void ZebesianWallFormingFromX(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (--gCurrentSprite.unk_8 > 0) {
        gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.unk_8];
    } else {
        gCurrentSprite.pose = 2;
        gCurrentSprite.status &= ~SS_ENABLE_MOSAIC;
        gCurrentSprite.status &= ~SS_IGNORE_PROJECTILES;
    }
}

void ZebesianWallDeath(void) {
    gCurrentSprite.yPosition += 8;
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition -= 0x28;
    else
        gCurrentSprite.xPosition += 0x28;
    SpriteSpawnNewXParasite(PSPRITE_X_PARASITE, gCurrentSprite.spriteId, 0, gCurrentSprite.primarySpriteRamSlot,
        gCurrentSprite.spritesetSlotAndProperties, gCurrentSprite.yPosition - 0x38, gCurrentSprite.xPosition, SS_X_FLIP);
}

void ZebesianWallMovingVerticallyInit(void) {
    gCurrentSprite.pOam = sZebesianWallOam_Crawling;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.work1 = 64;
    gCurrentSprite.pose = ZEBESIAN_WALL_CRAWLING;
}

void ZebesianWallMoveVertically(void) {
    u32 action = FALSE;
    if (gCurrentSprite.status & SS_FACING_RIGHT) {
        if (gCurrentSprite.xParasiteTimer + 0x80 > gCurrentSprite.yPosition) {
            if (--gCurrentSprite.work1 > 0)
                gCurrentSprite.yPosition += 1;
            else
                action = TRUE;
        } else
            action = TRUE;
    } else {
        if (gCurrentSprite.xParasiteTimer - 0xc0 < gCurrentSprite.yPosition) {
            if (--gCurrentSprite.work1 > 0)
                gCurrentSprite.yPosition -= 1;
            else
                action = TRUE;
        } else
            action = TRUE;
    }
    if (gCurrentSprite.status & SS_HIDDEN) {
        if (action)
            gCurrentSprite.status ^= SS_FACING_RIGHT;
    } else {
        if (action)
            ZebesianWallDecideRandomAction();
    }
}

void ZebesianWallTurningAroundInit(void) {
    gCurrentSprite.pOam = sZebesianWallOam_TurningAround;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = ZEBESIAN_WALL_TURNING_AROUND;
}

void ZebesianWallTurningAround(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianWallOam_Jumping;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1c;
        gCurrentSprite.work3 = 0;
        gCurrentSprite.work4 = 0;
        gCurrentSprite.status ^= SS_X_FLIP;
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.xPosition += 0x80;
        else
            gCurrentSprite.xPosition -= 0x80;
        ZebesianWallSetSideHitboxes();
        SoundPlayNotAlreadyPlaying(SOUND_ZEBESIAN_WALL_JUMP);
    }
}

void ZebesianWallJumping(void) {
    u8 offset = gCurrentSprite.work4;
    s16 yMovement = sZebesianWallJumpYVelocity[offset];
    s16 xMovement = sZebesianWallJumpXVelocity[offset];
    gCurrentSprite.yPosition += yMovement;
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition += xMovement;
    else
        gCurrentSprite.xPosition -= xMovement;
    offset++;
    gCurrentSprite.work4 = offset;
    if (sZebesianWallJumpYVelocity[offset] == SHORT_MAX)
        ZebesianWallDecideRandomAction();
}

void ZebesianWallIdleInit(void) {
    gCurrentSprite.pOam = sZebesianWallOam_Idle;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 8;
}

void ZebesianWallIdle(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        ZebesianWallDecideRandomAction();
}

void ZebesianWallShootingInit(void) {
    gCurrentSprite.pOam = sZebesianWallOam_Shooting;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 0x2a;
}

void ZebesianWallShooting(void) {
    if (gCurrentSprite.currentAnimationFrame == 0x13 && gCurrentSprite.animationDurationCounter == 1) {
        if (gCurrentSprite.status & SS_X_FLIP)
            SpriteSpawnSecondary(SSPRITE_ZEBESIAN_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition - 0x88, SS_X_FLIP);
        else
            SpriteSpawnSecondary(SSPRITE_ZEBESIAN_BEAM, 0, gCurrentSprite.spritesetGfxSlot,
                gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition + 0x88, 0);
    }
    if (SpriteUtilCheckEndCurrentSpriteAnim())
        ZebesianWallDecideRandomAction();
}

void ZebesianBeamInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.properties |= SP_KILL_OFF_SCREEN;
    gCurrentSprite.drawDistanceTop = 8;
    gCurrentSprite.drawDistanceBottom = 8;
    gCurrentSprite.drawDistanceHorizontal = 0x30;
    gCurrentSprite.hitboxTop = -8;
    gCurrentSprite.hitboxBottom = 8;
    gCurrentSprite.pOam = sZebesianWallBeamOam_Spawning;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    gCurrentSprite.pose = 2;
    gCurrentSprite.samusCollision = SSC_HURTS_SAMUS;
    gCurrentSprite.drawOrder = 5;
    gCurrentSprite.bgPriority = 1;
    if (gCurrentSprite.status & SS_X_FLIP) {
        gCurrentSprite.hitboxLeft = -0x30;
        gCurrentSprite.hitboxRight = -0x10;
    } else {
        gCurrentSprite.hitboxLeft = 0x10;
        gCurrentSprite.hitboxRight = 0x30;
    }
    SoundPlayNotAlreadyPlaying(SOUND_ZEBESIAN_BEAM);
}

void ZebesianBeamSpawning(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianWallBeamOam_Extending;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x18;
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxLeft = -0x60;
            gCurrentSprite.hitboxRight = -0x20;
        } else {
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0x60;
        }
    }
}

void ZebesianBeamExtending(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pOam = sZebesianWallBeamOam_Extended;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.pose = 0x1a;
        if (gCurrentSprite.status & SS_X_FLIP) {
            gCurrentSprite.hitboxLeft = -0xa0;
            gCurrentSprite.hitboxRight = -0x20;
        } else {
            gCurrentSprite.hitboxLeft = 0x20;
            gCurrentSprite.hitboxRight = 0xa0;
        }
    }
}

void ZebesianWall(void) {
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 4)
        SoundPlayNotAlreadyPlaying(SOUND_ZEBESIAN_HURT);
    if (gCurrentSprite.freezeTimer > 0) {
        SpriteUtilUpdateFreezeTimer();
        return;
    }
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ZebesianWallInit();
            break;
        case ZEBESIAN_WALL_CRAWLING_INIT:
            ZebesianWallMovingVerticallyInit();
        case ZEBESIAN_WALL_CRAWLING:
            ZebesianWallMoveVertically();
            break;
        case ZEBESIAN_WALL_TURNING_AROUND_INIT:
            ZebesianWallTurningAroundInit();
        case ZEBESIAN_WALL_TURNING_AROUND:
            ZebesianWallTurningAround();
            break;
        case ZEBESIAN_WALL_JUMPING:
            ZebesianWallJumping();
            break;
        case ZEBESIAN_WALL_IDLE_INIT:
            ZebesianWallIdleInit();
        case ZEBESIAN_WALL_IDLE:
            ZebesianWallIdle();
            break;
        case ZEBESIAN_WALL_SHOOTING_INIT:
            ZebesianWallShootingInit();
        case ZEBESIAN_WALL_SHOOTING:
            ZebesianWallShooting();
            break;
        case SPRITE_POSE_DYING_INIT:
            SpriteDyingInit();
        case SPRITE_POSE_DYING:
            SpriteDying();
            break;
        case SPRITE_POSE_SPAWNING_FROM_X_INIT:
            ZebesianWallInit();
        case SPRITE_POSE_SPAWNING_FROM_X:
            ZebesianWallFormingFromX();
            break;
        case SPRITE_POSE_TURNING_INTO_X:
            ZebesianWallDeath();
            XParasiteInit();
    }
}

void ZebesianBeam(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            ZebesianBeamInit();
            break;
        case 2:
            ZebesianBeamSpawning();
            break;
        case 0x18:
            ZebesianBeamExtending();
            break;
    }
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.xPosition -= 10;
    else
        gCurrentSprite.xPosition += 10;
}
