#ifndef X_PARASITE_UTIL_H
#define X_PARASITE_UTIL_H

#include "types.h"

enum XParasiteType {
    X_PARASITE_TYPE_IN_ROOM,
    X_PARASITE_TYPE_FROM_SPRITE,
    X_PARASITE_TYPE_FROM_CORE_X
};

enum XParasiteFlyingStage {
    X_PARASITE_FLYING_STAGE_FREE_FLOATING,
    X_PARASITE_FLYING_STAGE_FLYING_TO_SPRITE,
    X_PARASITE_FLYING_STAGE_TOUCHED_SPRITE
};

u32 CheckSpriteThatCantAbsorbX(void);
u8 CountPrimarySpritesThatCantAbsorbX(void);
void XParasiteMove(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor);
void XParasiteMoveWithSound(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor, u16 sound);
void SamusAbsorbX(void);
void XParasiteGettingAbsorbedInit(void);
void SpriteDyingInit(void);
void SpriteDying(void);
void XParasiteSpawningInit(void);
void XParasiteDetermineColor(u8 unk, u8 spriteId);
void XParasiteInit(void);
void XParasiteFlyingInit(void);
void XParasiteIdleFloating(void);
void XParasiteFlying(void);
void XParasiteGettingAbsorbed(void);
u8 XParasiteFlyingMovement(void);
void XParasiteFlyingAway(void);
void XParasiteWaitingForEnoughXToFormInit(void);
void XParasiteWaitingForEnoughXToForm(void);
void XParasiteFormingInit(void);
void XParasiteForming(void);
void SpriteSpawningFromX(void);
void unk_62328(void);
void XParasiteStickToSamus(void);

#endif /* X_PARASITE_UTIL_H */
