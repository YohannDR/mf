#ifndef TITLE_SCREEN_STRUCTS_H
#define TITLE_SCREEN_STRUCTS_H

#include "types.h"
#include "oam.h"

struct TitleScreenObject;
typedef void (*TitleScreenObjectFunc_T)(struct TitleScreenObject*);

struct TitleScreenObject {
    u16 xPosition;
    u16 yPosition;
    u8 callSubroutine;
    u8 unk_5;
    u8 isDrawn;
    u8 currentAnimationFrame;
    u8 animationDurationCounter;
    u8 unk_9;
    u8 unk_A;
    u8 objMode;
    u8 unk_C;
    const struct FrameData* pOam;
    TitleScreenObjectFunc_T pSubroutine;
};

struct TitleScreenData {
    u16 unk_0;
    u16 unk_2;
    u8 unk_4;
    u8 unk_5;
    u8 padding_6[6];
    struct TitleScreenObject objects[4];
};

#endif /* TITLE_SCREEN_STRUCTS_H */
