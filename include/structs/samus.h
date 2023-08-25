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
    u8 arimRunningFlag;
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

extern struct SamusData gSamusData;
extern struct SamusData gSamusDataCopy;
extern struct Equipment gEquipment;

extern u16 gPreviousXPosition;
extern u16 gPoseLock;
extern u16 gPreventMovementTimer;

#endif /* SAMUS_STRUCTS_H */
