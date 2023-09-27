#include "data/escape_data.h"

const u16 sEscapeDigitsPal[16 * 3] = INCBIN_U16("data/escape/palette.pal");
const u8 sEscapeDigitsGfx[2048] = INCBIN_U8("data/escape/graphics.gfx");

const u16 sEscapeDigitsOam[OAM_DATA_SIZE(8)] = {
    0x8,
    OBJ_SHAPE_VERTICAL | 0x0, 0x0, OBJ_SPRITE_OAM | 0x73c0,
    OBJ_SHAPE_VERTICAL | 0x0, 0x8, OBJ_SPRITE_OAM | 0x73c0,
    0x0, 0x10, OBJ_SPRITE_OAM | 0x73ca,
    OBJ_SHAPE_VERTICAL | 0x0, 0x18, OBJ_SPRITE_OAM | 0x73c0,
    OBJ_SHAPE_VERTICAL | 0x0, 0x20, OBJ_SPRITE_OAM | 0x73c0,
    0x0, 0x28, OBJ_SPRITE_OAM | 0x73ea,
    OBJ_SHAPE_VERTICAL | 0x0, 0x30, OBJ_SPRITE_OAM | 0x73c0,
    OBJ_SHAPE_VERTICAL | 0x0, 0x38, OBJ_SPRITE_OAM | 0x73c0
};

const struct FrameData sEscapeTimerFrameData[2] = {
    [0] = {
        .pFrame = sEscapeDigitsOam,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_3e9940_3ec038[9976] = INCBIN_U8("data/Blob_3e9940_3ec038.bin");
