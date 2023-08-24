#ifndef SPRITE_STRUCTS_H
#define SPRITE_STRUCTS_H

#include "types.h"
#include "oam.h"

#define MAX_AMOUNT_OF_SPRITES 24
#define MAX_AMOUNT_OF_SPRITE_TYPES 15

struct SpriteData {
    u16 status;
    u16 yPosition;
    u16 xPosition;
    u16 xParasiteTimer;
    u16 unk_8;
    s16 hitboxTop;
    s16 hitboxBottom;
    s16 hitboxLeft;
    s16 hitboxRight;
    u16 scaling;
    u16 health;
    u16 currentAnimationFrame;
    const struct FrameData* pOam;
    u8 animationDurationCounter;
    u8 spriteId;
    u8 roomSlot;
    u8 spritesetGfxSlot;
    u8 paletteRow;
    u8 bgPriority;
    u8 drawOrder;
    u8 primarySpriteRamSlot;
    u8 pose;
    u8 samusCollision;
    u8 ignoreSamusCollisionTimer;
    u8 drawDistanceTop;
    u8 drawDistanceBottom;
    u8 drawDistanceHorizontal;
    u8 spritesetSlotAndProperties;
    u8 rotation;
    u8 invincibilityStunFlashTimer;
    u8 work0;
    u8 work1;
    u8 work2;
    u8 work3;
    u8 work4;
    u8 freezeTimer;
    u8 standingOnSprite;
    u8 properties;
    u8 frozenPaletteRowOffset;
    u8 work5;
};

extern struct SpriteData gCurrentSprite;
extern struct SpriteData gSpriteData[MAX_AMOUNT_OF_SPRITES];
extern u8 gSpritesetSpriteIds[MAX_AMOUNT_OF_SPRITE_TYPES];
extern u8 gSpritesetSpriteGfxSlots[MAX_AMOUNT_OF_SPRITE_TYPES];

#endif /* SPRITE_STRUCTS_H */
