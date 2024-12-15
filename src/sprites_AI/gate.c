#include "globals.h"

#include "data/generic_data.h"
#include "data/samus_data.h"
#include "data/sprites/gate.h"
#include "data/sprite_data.h"

#include "constants/audio.h"
#include "constants/clipdata.h"
#include "constants/sprite.h"
#include "constants/samus.h"

#include "structs/clipdata.h"
#include "structs/sprite.h"
#include "structs/samus.h"

enum GateType {
    GATE_TYPE_LEFT_THIN = 1,
    GATE_TYPE_RIGHT_THIN,
    GATE_TYPE_LEFT_FAT,
    GATE_TYPE_RIGHT_FAT,
    GATE_TYPE_HABITATION
};

void GateSetCollision(u8 caa) {
    u16 y = gCurrentSprite.yPosition;
    u16 x = gCurrentSprite.xPosition;
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(0.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(1.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(2.5), x);
    gCurrentClipdataAffectingAction = caa;
    ClipdataProcess(y - BLOCK_TO_SUB_PIXEL(3.5), x);
}

void GateInit(void) {
    u8 type;

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.drawDistanceTop = 0x40;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x10;
    gCurrentSprite.hitboxTop = -4;
    gCurrentSprite.hitboxBottom = 0;
    gCurrentSprite.hitboxLeft = -4;
    gCurrentSprite.hitboxRight = 4;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    switch (gCurrentSprite.spritesetSlotAndProperties) {
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_LEFT_THIN:
            type = GATE_TYPE_LEFT_THIN;
            gCurrentSprite.pOam = sGateOam_ClosedThin;
            break;
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_RIGHT_THIN:
            type = GATE_TYPE_RIGHT_THIN;
            gCurrentSprite.pOam = sGateOam_ClosedThin;
            break;
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_LEFT_FAT:
            type = GATE_TYPE_LEFT_FAT;
            gCurrentSprite.pOam = sGateOam_ClosedFat;
            break;
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_RIGHT_FAT:
            type = GATE_TYPE_RIGHT_FAT;
            gCurrentSprite.pOam = sGateOam_ClosedFat;
            break;
        default:
            type = GATE_TYPE_HABITATION;
            if (EventCheckAfter_AnimalsReleased()) {
                gCurrentSprite.pose = 0x1a;
                gCurrentSprite.pOam = sGateOam_OpenedThin;
                return;
            }
            gCurrentSprite.pOam = sGateOam_ClosedThin;
            gCurrentSprite.properties |= SP_ALWAYS_ACTIVE;
            gCurrentSprite.xParasiteTimer = 210;
            break;
    }
    GateSetCollision(CAA_MAKE_SOLID);
    if (type < 5) {
        type = SpriteSpawnSecondary(SSPRITE_GATE_SWITCH, type, gCurrentSprite.spritesetGfxSlot,
            gCurrentSprite.primarySpriteRamSlot, gCurrentSprite.yPosition, gCurrentSprite.xPosition, 0);
        if (type == UCHAR_MAX)
            gCurrentSprite.status = 0;
    }
}

void GateClosed(void) {
    switch (gCurrentSprite.spritesetSlotAndProperties) {
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_LEFT_THIN:
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_RIGHT_THIN:
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_LEFT_FAT:
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_RIGHT_FAT:
            break;
        default:
            if (EventCheckAfter_AnimalsReleased())
                if (--gCurrentSprite.xParasiteTimer == 0)
                    gCurrentSprite.pose = 0x17;
    }
}

void GateOpeningInit(void) {
    GateSetCollision(CAA_REMOVE_SOLID);
    gCurrentSprite.pose = 0x18;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    switch (gCurrentSprite.spritesetSlotAndProperties) {
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_LEFT_THIN:
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_RIGHT_THIN:
            gCurrentSprite.pOam = sGateOam_OpeningThin;
            SoundPlay(SOUND_114);
            break;
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_LEFT_FAT:
        case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_RIGHT_FAT:
            gCurrentSprite.pOam = sGateOam_OpeningFat;
            SoundPlay(SOUND_115);
            break;
        default:
            gCurrentSprite.pOam = sGateOam_OpeningThin;
            SoundPlay(SOUND_114);
            break;
    }
}

void GateOpening(void) {
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        switch (gCurrentSprite.spritesetSlotAndProperties) {
            case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_LEFT_THIN:
            case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_RIGHT_THIN:
                gCurrentSprite.pOam = sGateOam_OpenedThin;
                break;
            case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_LEFT_FAT:
            case SSP_UNINFECTED_OR_BOSS | GATE_TYPE_RIGHT_FAT:
                gCurrentSprite.pOam = sGateOam_OpenedFat;
                break;
            default:
                gCurrentSprite.pOam = sGateOam_OpenedThin;
                break;
        }
    }
}

void GateSwitchInit(void) {
    gCurrentSprite.status &= ~SS_NOT_DRAWN;
    gCurrentSprite.drawOrder = 3;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_SOLID;
    gCurrentSprite.drawDistanceTop = 0x40;
    gCurrentSprite.drawDistanceBottom = 0;
    gCurrentSprite.drawDistanceHorizontal = 0x28;
    gCurrentSprite.hitboxTop = -0x100;
    gCurrentSprite.hitboxBottom = -0xc0;
    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
    switch (gCurrentSprite.roomSlot) {
        case GATE_TYPE_LEFT_THIN:
        case GATE_TYPE_LEFT_FAT:
            gCurrentSprite.hitboxLeft = -0x94;
            gCurrentSprite.hitboxRight = -0x74;
            gCurrentSprite.pOam = sGateSwitchOam_IdleLeft;
            break;
        case GATE_TYPE_RIGHT_THIN:
        case GATE_TYPE_RIGHT_FAT:
            gCurrentSprite.hitboxLeft = 0x74;
            gCurrentSprite.hitboxRight = 0x94;
            gCurrentSprite.pOam = sGateSwitchOam_IdleRight;
            break;
        default:
            gCurrentSprite.status = 0;
    }
}

void GateSwitchIdle(void) {
    if (gCurrentSprite.health == 0) {
        gCurrentSprite.pose = 0x18;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gCurrentSprite.samusCollision = SSC_NONE;
        switch (gCurrentSprite.roomSlot) {
            case GATE_TYPE_LEFT_THIN:
            case GATE_TYPE_LEFT_FAT:
                gCurrentSprite.pOam = sGateSwitchOam_PressingLeft;
                break;
            case GATE_TYPE_RIGHT_THIN:
            case GATE_TYPE_RIGHT_FAT:
                gCurrentSprite.pOam = sGateSwitchOam_PressingRight;
                break;
            default:
                gCurrentSprite.status = 0;
        }
    }
}

void GateSwitchPressing(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    if (SpriteUtilCheckEndCurrentSpriteAnim()) {
        gCurrentSprite.pose = 0x1a;
        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;
        gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose = 0x17;
        switch (gCurrentSprite.roomSlot) {
            case GATE_TYPE_LEFT_THIN:
            case GATE_TYPE_LEFT_FAT:
                gCurrentSprite.pOam = sGateSwitchOam_PressedLeft;
                break;
            case GATE_TYPE_RIGHT_THIN:
            case GATE_TYPE_RIGHT_FAT:
                gCurrentSprite.pOam = sGateSwitchOam_PressedRight;
                break;
            default:
                gCurrentSprite.status = 0;
        }
    }
}

void GateSwitchPressed(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
}

void Gate(void) {
    gCurrentSprite.ignoreSamusCollisionTimer = 1;
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            GateInit();
            break;
        case SPRITE_POSE_IDLE:
            GateClosed();
            break;
        case 0x17:
            GateOpeningInit();
            break;
        case 0x18:
            GateOpening();
    }
}

void GateSwitch(void) {
    switch (gCurrentSprite.pose) {
        case SPRITE_POSE_UNINITIALIZED:
            GateSwitchInit();
            break;
        case SPRITE_POSE_IDLE:
            GateSwitchIdle();
            break;
        case 0x18:
            GateSwitchPressing();
            break;
        case 0x1a:
            GateSwitchPressed();
    }
}
