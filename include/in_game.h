#ifndef IN_GAME_H
#define IN_GAME_H

#include "types.h"

u32 InGameSubroutine(void);
void InGameSetVblank(void);
void TransferSamusGraphics(s32 updatePalette);
void VBlankCodeInGameLoad(void);
void unk_e26c(void);
void VBlankCodeInGame(void);
void VBlankInGame_Empty(void);
void InitAndLoadGenerics(void);
void UpdateFreeMovement_Debug(void);

#endif /* IN_GAME_H */
