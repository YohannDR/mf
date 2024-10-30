#ifndef X_PARASITE_UTIL_H
#define X_PARASITE_UTIL_H

#include "types.h"

u32 unk_61004(void);
u8 CountPrimarySpritesThatCantAbsorbX(void);
void XParasiteMove(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor);
void XParasiteMoveWithSound(u16 dstY, u16 dstX, u8 ySpeedCap, u8 xSpeedCap, u8 speedDivisor, u16 sound);
void SamusAbsorbX(void);
void XParasiteGettingAbsorbedInit(void);
void SpriteDyingInit(void);
void SpriteDying(void);
void XParasiteSpawningInit(void);
void XParasiteDetermineType(u8 unk, u8 spriteId);
void XParasiteInit(void);
void XParasiteFlyingInit(void);
void XParasiteIdleFloating(void);
void XParasiteFlying(void);
void XParasiteGettingAbsorbed(void);
u8 XParasiteFlyingMovement(void);
void XParasiteFlyingAway(void);
void unk_620ec(void);
void unk_6212c(void);
void unk_6224c(void);
void unk_62288(void);
void SpriteSpawningFromX(void);
void unk_62328(void);
void XParasiteStickToSamus(void);

#endif /* X_PARASITE_UTIL_H */
