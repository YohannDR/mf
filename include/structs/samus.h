#ifndef SAMUS_STRUCTS_H
#define SAMUS_STRUCTS_H

#include "types.h"
#include "oam.h"

struct SamusData {
    u8 unk_0;
    u8 pose;
    u8 turning;
    u8 forcedMovement;
    u8 walljumpTimer;
    u8 invincibilityTimer;
    u8 speedboostingCounter;
    u8 armCannonDirection;
    u8 weaponHighlighted;
    u8 newProjectile;
    u8 cooldownTimer;
    u8 unk_B;
    u8 chargeBeamCounter;
    u8 diagonalAim;
    u8 armRunningFlag;
    u8 counter;
    u16 lastWallTouchedMidAir;
    u16 direction;
    u16 elevatorOrClimbingDirection;
    u16 xPosition;
    u16 yPosition;
    s16 xVelocity;
    s16 yVelocity;
    u16 slopeType;
    u8 standingStatus;
    u8 animationDurationCounter;
    u8 currentAnimationFrame;
    u8 shooting;
    s16 drawDistanceLeft;
    s16 drawDistanceTop;
    s16 drawDistanceRight;
    s16 drawDistanceBottom;
};

struct Equipment {
    u16 currentEnergy;
    u16 maxEnergy;
    u16 currentMissiles;
    u16 maxMissiles;
    u8 currentPowerBombs;
    u8 maxPowerBombs;
    u8 beamStatus;
    u8 weaponsStatus;
    u8 suitMiscStatus;
    u8 securityHatchLevel;
    u8 downloadedMaps;
    u8 lowHealth;
};

struct SamusGraphicsInfo {
    const u16* pSamusOamFrame;

    const u8* pBodyTopHalfGfx;
    u16 bodyTopHalfGfxLength;

    const u8* pBodyBottomHalfGfx;
    u16 bodyBottomHalfGfxLength;

    const u8* pLegsTopHalfGfx;
    u16 legsTopHalfGfxLength;

    const u8* pLegsBottomHalfGfx;
    u16 legsBottomHalfGfxLength;

    u16 armCannonXOffset;
    u16 armCannonYOffset;
    u16 unk_26;

    const u16* pArmCannonOamFrame;

    const u8* pArmCannonTopHalfGfx;
    u16 armCannonTopHalfGfxLength;

    const u8* pArmCannonBottomHalfGfx;
    u16 armCannonBottomHalfGfxLength;
};

struct SamusAnimationInfo {
    u8 loadingSave;
    u8 paletteAnimationCounter;
    u8 currentPaletteRow;
    u8 spaceJumpSpinCounter;
    u8 shinesparkTimer;
};

struct SamusPhysics {
    u8 slowed;
    s16 yAcceleration;
    s16 yVelocityCap;
    s16 midAirXAcceleration;
    s16 midAirXVelocityCap;
    s16 midAirMorphedXVelocityCap;
    s16 xAcceleration;
    s16 xVelocityCap;
};

struct SamusEnvironmentalEffect {
    u8 effect;
    u8 animationDurationCounter;
    u8 currentAnimationFrame;
    s8 externalTimer;
    u8 timer1;
    u8 timer2;
    u8 unk_6;
    u16 xPosition;
    u16 yPosition;
    const u16* pOamFrame;
};

extern struct SamusData gSamusData;
extern struct SamusData gSamusDataCopy;
extern struct SamusEnvironmentalEffect gSamusEnvironmentalEffects[2];
extern struct Equipment gEquipment;
extern struct SamusGraphicsInfo gSamusGraphicsInfo;
extern struct SamusAnimationInfo gSamusAnimationInfo;
extern struct SamusPhysics gSamusPhysics;

extern u16 gSamusPalette[3 * 16];
extern u16 gSamusPaletteLength;

extern u16 gPreviousXPosition;
extern u16 gPreviousYPosition;
extern u8 gPoseLock;
extern u16 gPreventMovementTimer;
extern u8 gDisableDrawingSamusAndScrollingFlag;

#endif /* SAMUS_STRUCTS_H */
