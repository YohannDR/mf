#ifndef SPRITE_H
#define SPRITE_H

#include "structs/sprite.h"

void SpriteUpdateRandomNumber(u8 slot);
void SpriteUpdate(void);
void SpriteUpdateAnimation(void);
void unk_eb04(void);
void SpriteDrawAll(void);
void unk_ec38(void);
void SpriteDraw(s32 slot);
void SpriteCheckOnScreen(void);
void SpriteLoadAllData(void);
void SpriteLoadSpriteset(void);
void SpriteLoadGfx(u8 spriteId, u8 gfxRow, u8 srcOffset);
void SpriteLoadPal(u8 spriteId, u8 gfxRow, u8 length);
void SpriteClearData(void);
void SpriteLoadRoomSprites(void);
void SpriteInitPrimary(u8 gfxSlot, u16 yPosition, u16 xPosition, u8 roomSlot);
u8 SpriteSpawnSecondary(u8 spriteId, u8 partNumber, u8 gfxRow, u8 ramSlot, u16 yPosition, u16 xPosition, u16 statusToAdd);
u8 SpriteSpawnPrimary(u8 spriteId, u8 partNumber, u8 gfxRow, u8 spritesetSlot, u16 yPosition, u16 xPosition, u16 statusToAdd);
u8 SpriteSpawnNewXParasite(u8 spriteId, u8 partNumber, u8 gfxRow, u8 ramSlot, u8 spritesetSlot, u16 yPosition, u16 xPosition, u16 statusToAdd);

#endif /* SPRITE_H */
