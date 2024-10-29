#include "data/sprites/metroid_husk.h"
#include "macros.h"

const u32 sMetroidHuskGfx[512 * 1] = INCBIN_U32("data/sprites/metroid_husk.gfx");
const u16 sMetroidHuskPal[16 * 1] = INCBIN_U16("data/sprites/metroid_husk.pal");

static const u16 sMetroidHuskOam_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x204,
    0xe4, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x208,
    0xf4, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xdc, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x20c
};

const struct FrameData sMetroidHuskOam[2] = {
    [0] = {
        .pFrame = sMetroidHuskOam_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
