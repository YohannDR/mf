#include "data/sprites/destroyed_data_pad.h"
#include "macros.h"

const u32 sDestroyedDataPadGfx[512] = INCBIN_U32("data/sprites/destroyed_data_pad.gfx");
const u16 sDestroyedDataPadPal[16 * 1] = INCBIN_U16("data/sprites/destroyed_data_pad.pal");

static const u16 sDestroyedDataPadOam_Destroyed_Frame0[OAM_DATA_SIZE(23)] = {
    0x17,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1e0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x0, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x20, OBJ_SPRITE_OAM | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1d8, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f8, OBJ_SPRITE_OAM | 0x20d,
    0xe8, OBJ_SIZE_16x16 | 0x18, OBJ_SPRITE_OAM | 0x211,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1d8, OBJ_SPRITE_OAM | 0x213,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f8, OBJ_SPRITE_OAM | 0x217,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x18, OBJ_SPRITE_OAM | 0x21b,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_SPRITE_OAM | 0x238,
    0x0, 0x1f8, OBJ_SPRITE_OAM | 0x23a,
    0x8, 0x1e0, OBJ_SPRITE_OAM | 0x23b,
    0x10, 0x1e0, OBJ_SPRITE_OAM | 0x23c,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x21d,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_SPRITE_OAM | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x238,
    0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x23a,
    0x8, OBJ_X_FLIP | 0x18, OBJ_SPRITE_OAM | 0x23b,
    0x10, OBJ_X_FLIP | 0x18, OBJ_SPRITE_OAM | 0x23c,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x21d,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x21f,
    0xd8, 0x1d8, OBJ_SPRITE_OAM | 0x233,
    0xe0, 0x1d8, OBJ_SPRITE_OAM | 0x234
};

const struct FrameData sDestroyedDataPadOam_Destroyed[2] = {
    [0] = {
        .pFrame = sDestroyedDataPadOam_Destroyed_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};
