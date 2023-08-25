#ifndef SPRITE_UTIL_H
#define SPRITE_UTIL_H

#include "structs/sprite.h"

void SpriteUtilInitLocationText(void);
void SpriteUtilTakeDamageFromSprite(u8 kbFlag, u8 spriteSlot, u16 dmgMultiplier);
void SpriteUtilTakeDamageFromSA_XIceBeamWithPowerSuit(u8 spriteSlot);
void SpriteUtilTakeConstantDamage(void);
void SpriteUtilTakeDamageFromOmegaMetroidSwiping(u8 spriteSlot);
void SpriteUtilTakeDamageFromYakuzaSlamming(void);
void SpriteUtilTakeConstantDamageFromYakuza(void);
void SpriteUtilTakeKnockback(u8 spriteSlot);
u32 SpriteUtilCheckObjectsTouching(u16 o1Top, u16 o1Bottom, u16 o1Left, u16 o1Right, u16 o2Top, u16 o2Bottom, u16 o2Left, u16 o2Right);
void SamusAndSpriteCollision(void);
u32 SpriteUtilCheckVerticalCollisionAtPosition(u16 yPosition, u16 xPosition);
u16 SpriteUtilCheckVerticalCollisionAtPositionSlopes(u16 yPosition, u16 xPosition);
void unk_1129c(void);
void unk_11310(void);
void SpriteUtilCheckCollisionAtPosition(u16 yPosition, u16 xPosition);
void SpriteUtilCurrentSpriteFalling(void);
void SpriteUtilChooseRandomXFlip(void);
void SpriteUtilChooseRandomXDirection(void);
void SpriteUtilChooseRandomXDirectionRoomSlot(void);
void SpriteUtilMakeSpriteFaceSamusXFlip(void);
void SpriteUtilMakeSpriteFaceSamusDirection(void);
void SpriteUtilMakeSpriteFaceAwayFromSamusXFlip(void);
void SpriteUtilMakeSpriteFaceAwayFromSamusDirection(void);
void unk_11604(s16 movement);
u8 SpriteUtilMakeSpriteRotateTowardsTarget(s16 oamRotation, s16 targetY, s16 targetX, s16 spriteY, s16 spriteX);

#endif /* SPRITE_UTIL_H */
