#include "macros.h"

#include "data/projectile_data.h"

const s16 sWaveBeamPartVelocity[16] = {
    24, 16, 8, 4,
    4, 8, 16, 24,
    32, 20, 8, 4,
    4, 8, 20, 32
};

static const u8 sBlob_58b3ec_58eb78[] = INCBIN_U8("data/Blob_58b3ec_58eb78.bin");

const u8 sFlareHorizontalGfx[80 * 32] = INCBIN_U8("data/projectiles/flare_horizontal.gfx");
const u8 sFlareDiagonalGfx[80 * 32] = INCBIN_U8("data/projectiles/flare_diagonal.gfx");
const u8 sFlareVerticalGfx[80 * 32] = INCBIN_U8("data/projectiles/flare_vertical.gfx");

static const u16 sFlareOam_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_2 | 0x94,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_2 | 0x98
};

const struct FrameData sFlareOam[2] = {
    [0] = {
        .pFrame = sFlareOam_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
