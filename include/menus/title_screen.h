#ifndef TITLE_SCREEN_H
#define TITLE_SCREEN_H

#include "types.h"
#include "structs/menus/title_screen.h"

s32 unk_86854(void);
void unk_8690c(void);
void TitleScreenVblank(void);
void TitleScreenVblank_Empty(void);
s32 unk_86b58(void);
u8 TitleScreenSetupObject(u8 section, u16 xPosition, u16 yPosition);
void unk_86cf0(struct TitleScreenObject* pObject);
void TitleScreenProcessPressStart(struct TitleScreenObject* pObject);
void TitleScreenProcessLanguage(struct TitleScreenObject* pObject);
void unk_86e94(struct TitleScreenObject* pObject);
void TitleScreenDrawAllObjects(void);
void TitleScreenDrawObject(struct TitleScreenObject* pObject);
void TitleScreenCallObjectsSubroutine(void);
void TitleScreenProcessCopyright(struct TitleScreenObject* pObject);
void TitleScreenInit(void);
s32 TitleScreenSpawningIn(void);
s32 TitleScreenSubroutine(void);
void TitleScreenDrawDebugText(const u8* src, u16* dst, u8 palette);

#endif /* TITLE_SCREEN_H */
