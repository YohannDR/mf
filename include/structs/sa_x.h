#ifndef SA_X_STRUCTS_H
#define SA_X_STRUCTS_H

#include "types.h"
#include "oam.h"

struct SaXData {
    u8 screenFlag;
    u8 pose;
    u8 turning;
    u8 diagonalAim;
    u8 missilesArmed;
    u8 frozen;
    u8 mosaic;
    u16 direction;
    u16 xPosition;
    u16 yPosition;
    s16 xVelocity;
    s16 yVelocity;
    u8 animationDurationCounter;
    u8 currentAnimationFrame;
    const u8* pTopGfx;
    const u8* pBottomGfx;
    u16 topGfxLength;
    u16 bottomGfxLength;
    const u16* pOamFrame;
};

struct SaXVision {
    u8 unk_0;
    u8 unk_1;
    u8 inYRange;
    u8 samusOnTop;
    u8 samusOnRight;
    u8 inXRange;
    u8 unk_6;
    u8 unk_7;
};

extern struct SaXData gSaXData;
extern struct SaXVision gSaXVision;
extern struct RawCoordsX gSaXSpawnPosition;

#endif /* SA_X_STRUCTS_H */
