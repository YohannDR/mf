#ifndef PROJECTILE_STRUCTS_H
#define PROJECTILE_STRUCTS_H

#include "types.h"
#include "oam.h"

struct ProjectileData {
    u8 status;
    const struct FrameData* pOam;
    u16 yPosition;
    u16 xPosition;
    u16 currentAnimationFrame;
    u8 animationDurationCounter;
    u8 type;
    u8 direction;
    u8 palette;
    u8 movementStage;
    u8 part;
    u8 drawDistanceY;
    u8 drawDistanceX;
    s16 hitboxTop;
    s16 hitboxBottom;
    s16 hitboxLeft;
    s16 hitboxRight;
    u8 timer;
    u8 primaryProjectileSlot;
};

#define MAX_AMOUNT_OF_PROJECTILES 16

extern struct ProjectileData gProjectileData[MAX_AMOUNT_OF_PROJECTILES];
extern struct ProjectileData gCurrentProjectile;
extern u16 gArmCannonY;
extern u16 gArmCannonX;

#endif /* PROJECTILE_STRUCTS_H */
