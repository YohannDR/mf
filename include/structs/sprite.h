#ifndef SPRITE_STRUCTS_H
#define SPRITE_STRUCTS_H

#include "types.h"
#include "oam.h"

#define MAX_AMOUNT_OF_SPRITES 24
#define MAX_AMOUNT_OF_SPRITE_TYPES 15
#define ENEMY_ROOM_DATA_SIZE 3

enum MultiSpriteDataElements {
    MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX,
    MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET,
    MULTI_SPRITE_DATA_ELEMENT_X_OFFSET,

    MULTI_SPRITE_DATA_ELEMENT_END
};

typedef const s16 (*MultiSpriteDataInfo_T)[MULTI_SPRITE_DATA_ELEMENT_END];

struct MultiSpriteData {
    MultiSpriteDataInfo_T pData;
    u8 timer;
};

#define MULTI_SPRITE_DATA_INFO(index, y, x) \
{\
    [MULTI_SPRITE_DATA_ELEMENT_OAM_INDEX] = (index),\
    [MULTI_SPRITE_DATA_ELEMENT_Y_OFFSET]  = PIXEL_TO_SUB_PIXEL(y),\
    [MULTI_SPRITE_DATA_ELEMENT_X_OFFSET]  = PIXEL_TO_SUB_PIXEL(x)\
}

#define MULTI_SPRITE_DATA_TERMINATOR \
{\
    .pData = NULL,\
    .timer = 0\
}

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
    u8 numberOfXToForm;
};

struct SubSpriteData {
    const struct MultiSpriteData* pMultiOam;
    u16 currentAnimationFrame;
    u8 animationDurationCounter;
    u16 yPosition;
    u16 xPosition;
    u16 health;
    u8 work0;
    u8 work1;
};

extern struct SpriteData gCurrentSprite;
extern struct SpriteData gSpriteData[MAX_AMOUNT_OF_SPRITES];
extern u8 gSpriteDrawOrder[MAX_AMOUNT_OF_SPRITES];

extern u8 gSpritesetSpriteIds[MAX_AMOUNT_OF_SPRITE_TYPES];
extern u8 gSpritesetSpriteGfxSlots[MAX_AMOUNT_OF_SPRITE_TYPES];

extern struct SubSpriteData gSubSpriteData1;
extern struct SubSpriteData gSubSpriteData2;

extern u8 gIgnoreSamusAndSpriteCollision;
extern u8 gPreviousCollisionCheck;
extern u8 gPreviousVerticalCollisionCheck;

extern u16 gUnk_030007c0[MAX_AMOUNT_OF_SPRITES];

extern u8 gSpriteRandomNumber;

extern u16 gAtmosphericStabilizersOnline;
extern u16 gNormalXBarrierCoresDestroyed;
extern u16 gSuperXBarrierCoresDestroyed;
extern u16 gPowerBombXBarrierCoresDestroyed;
extern u16 gGadorasDestroyed;
extern u8 gMissilesHatchDestroyed;
extern u8 gWaterLowered;

extern u8 gBossWork0;
extern u8 gBossWork1;
extern u8 gBossWork2;
extern u8 gBossWork3;
extern u8 gBossWork4;
extern u16 gBossWork5;

extern u16 gXParasiteTargetYPosition;
extern u16 gXParasiteTargetXPosition;
extern u16 gAbilityRestingYPosition;
extern u16 gAbilityRestingXPosition;
extern u16 gSerrisSpawnYPosition;
extern u16 gSerrisSpawnXPosition;

extern u8 gBossFormationSpriteId;
extern u8 gCoreXFormationSpriteId;

#endif /* SPRITE_STRUCTS_H */
