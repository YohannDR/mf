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
u16 SpriteUtilCheckVerticalCollisionAtPosition(u16 yPosition, u16 xPosition);

#endif /* SPRITE_UTIL_H */
