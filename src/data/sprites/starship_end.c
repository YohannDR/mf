#include "data/sprites/starship_end.h"

const s16 sStarshipEnd_39aa34[81] = {
    0, 1, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 0, 1, 1,
    1, 1, 0, 1,
    0, 1, 0, 1,
    0, 1, 0, 1,
    0, 0, 1, 0,
    0, 0, 1, 0,
    0, 0, 0, 0,
    0, -1, 0, 0,
    -1, 0, -1, 0,
    -1, 0, -1, 0,
    -1, 0, -1, -1,
    -1, -1, 0, -1,
    0, -1, 0, -1,
    0, -1, 0, -1,
    0, 0, -1, 0,
    0, -1, 0, 0,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sStarshipEnd_39aad6[5] = {
    4, 0, -4, 0,
    SHORT_MAX
};

const s16 sStarshipEndEnteringYMovement[65] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 0, 0, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, 0, -1, 0,
    -1, 0, 0, -1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sStarship_39ab62[49] = {
    0, 1, 0, 0,
    1, 0, 1, 0,
    0, 1, 0, 1,
    0, 0, 1, 0,
    0, 0, 1, 0,
    0, 0, 0, 0,
    0, -1, 0, 0,
    -1, 0, -1, 0,
    0, -1, 0, -1,
    0, 0, -1, 0,
    0, -1, 0, 0,
    0, 0, 0, 0,
    SHORT_MAX
};

const s16 sStarshipEndStartingEngineYMovement[96] = {
    0, -1, 0, 0,
    -1, 0, -1, 0,
    -1, 0, -1, 0,
    -1, 0, -1, -1,
    -1, -1, 0, -1,
    0, -1, 0, -1,
    0, -1, 0, -1,
    0, 0, -1, 0,
    0, 1, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 0, 1, 1,
    1, 1, 1, 1,
    1, 1, 1, 1,
    2, 2, 2, 2,
    2, 2, 2, 2,
    1, 1, 1, 1,
    1, 1, 1, 1,
    0, 1, 0, 1,
    0, 0, 1, 0,
    0, 0, 1, 0,
    0, 1, 0, 0,
    1, 0, 0, 1,
    0, 0, 0, SHORT_MAX
};

const u8 sStarshipEndTakingOffRotation[12] = {
    1, 1, 2, 2,
    3, 3, 4, 4,
    4, 4, 4, 4
};

const u16 sStarshipEndEnteringScaling[32] = {
    144, 148, 152, 155,
    160, 164, 168, 171,
    176, 180, 184, 187,
    192, 196, 200, 203,
    208, 212, 216, 219,
    224, 228, 232, 235,
    240, 244, 248, 251,
    256, 256, 256, 256
};

const u16 sStarshipEndTakingOffScaling[68] = {
    256, 260, 264, 267,
    272, 276, 280, 283,
    288, 292, 296, 299,
    304, 308, 312, 315,
    320, 324, 328, 331,
    336, 340, 344, 347,
    352, 356, 360, 363,
    368, 372, 376, 379,
    384, 388, 392, 395,
    400, 404, 408, 411,
    416, 420, 424, 427,
    432, 436, 440, 443,
    448, 452, 456, 459,
    464, 468, 472, 475,
    480, 484, 488, 491,
    491, 491, 491, 491,
    491, 491, 491, 491
};

const u32 sStarshipEndGfx[7 * 512] = INCBIN_U32("data/sprites/starship_end.gfx");
const u16 sStarshipEndPal[7 * 16] = INCBIN_U16("data/sprites/starship_end.pal");

static const u16 sStarshipEndOam_39eb38_Frame0[] = {
    13,
    0xdc, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x248,
    0xdc, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x240,
    0x1c, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x240,
    0x1c, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0x7, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x368,
    0x7, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_9 | 0x366,
    0x17, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_9 | 0x3a6,
    0x27, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0x7, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x368,
    0x7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_9 | 0x366,
    0x17, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_9 | 0x3a6,
    0x27, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39eb48_Frame3[] = {
    12,
    0xc9, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x208,
    0x9, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x39c,
    0x9, 0x1e8, OBJ_PALETTE_8 | 0x3a0,
    0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a0,
    0xc9, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x200,
    0xf9, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x2c1,
    0x19, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0x9, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_8 | 0x398,
    0xc9, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x200,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x2c1,
    0x19, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0x9, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_8 | 0x398
};

static const u16 sStarshipEndOam_39eb48_Frame2[] = {
    12,
    0xca, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x208,
    0xa, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x39c,
    0xa, 0x1e8, OBJ_PALETTE_8 | 0x3a0,
    0xa, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a0,
    0xca, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x200,
    0xfa, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x2c1,
    0x1a, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xa, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_8 | 0x398,
    0xca, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x200,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x2c1,
    0x1a, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0xa, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_8 | 0x398
};

static const u16 sStarshipEndOam_39eb48_Frame1[] = {
    12,
    0xcb, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x208,
    0xb, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x39c,
    0xb, 0x1e8, OBJ_PALETTE_8 | 0x3a0,
    0xb, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a0,
    0xcb, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x200,
    0xfb, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x2c1,
    0x1b, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xb, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_8 | 0x398,
    0xcb, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x200,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x2c1,
    0x1b, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0xb, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_8 | 0x398
};

static const u16 sStarshipEndOam_39eb48_Frame0[] = {
    12,
    0xcc, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x208,
    0xc, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x39c,
    0xc, 0x1e8, OBJ_PALETTE_8 | 0x3a0,
    0xc, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a0,
    0xcc, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x200,
    0xfc, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x2c1,
    0x1c, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xc, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_8 | 0x398,
    0xcc, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x200,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x2c1,
    0x1c, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0xc, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_8 | 0x398
};

static const u16 sStarshipEndOam_39eb80_Frame0[] = {
    18,
    0xcc, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x208,
    0xc, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x39c,
    0xc, 0x1e8, OBJ_PALETTE_8 | 0x3a0,
    0xc, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a0,
    0xcc, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x200,
    0xfc, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x2c1,
    0x1c, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xc, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_8 | 0x398,
    0xcc, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x200,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x2c1,
    0x1c, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0xc, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_8 | 0x398,
    0x7, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_9 | 0x391,
    0x7, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x394,
    0x27, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0x7, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_9 | 0x391,
    0x7, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x394,
    0x27, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39eb80_Frame1[] = {
    18,
    0xcd, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x208,
    0xd, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x39c,
    0xd, 0x1e8, OBJ_PALETTE_8 | 0x3a0,
    0xd, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a0,
    0xcd, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x200,
    0xfd, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x2c1,
    0x1d, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xd, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_8 | 0x398,
    0xcd, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x200,
    0xfd, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x2c1,
    0x1d, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0xd, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_8 | 0x398,
    0x6, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_9 | 0x391,
    0x6, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x394,
    0x26, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0x6, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_9 | 0x391,
    0x6, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x394,
    0x26, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39eb80_Frame2[] = {
    18,
    0xce, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x208,
    0xe, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x39c,
    0xe, 0x1e8, OBJ_PALETTE_8 | 0x3a0,
    0xe, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a0,
    0xce, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x200,
    0xfe, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x2c1,
    0x1e, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xe, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_8 | 0x398,
    0xce, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x200,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x2c1,
    0x1e, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0xe, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_8 | 0x398,
    0x5, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_9 | 0x391,
    0x5, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x394,
    0x25, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0x5, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_9 | 0x391,
    0x5, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x394,
    0x25, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39eb80_Frame3[] = {
    18,
    0xcf, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x208,
    0xf, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x39c,
    0xf, 0x1e8, OBJ_PALETTE_8 | 0x3a0,
    0xf, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a0,
    0xcf, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x200,
    0xff, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x2c1,
    0x1f, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xf, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_8 | 0x398,
    0xcf, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x200,
    0xff, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x2c1,
    0x1f, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0xf, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_8 | 0x398,
    0x4, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_9 | 0x391,
    0x4, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x394,
    0x24, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0x4, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_9 | 0x391,
    0x4, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x394,
    0x24, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39ebb8_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_10 | 0x3cb
};

static const u16 sStarshipEndOam_39ebb8_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f1, OBJ_PALETTE_10 | 0x3cb,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ff, OBJ_PALETTE_10 | 0x3cd
};

static const u16 sStarshipEndOam_39ebb8_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f2, OBJ_PALETTE_10 | 0x3cb,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fe, OBJ_PALETTE_10 | 0x3cd
};

static const u16 sStarshipEndOam_39ebe0_Frame0[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x391,
    OBJ_SHAPE_HORIZONTAL | 0xd7, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x39c,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x391,
    OBJ_SHAPE_HORIZONTAL | 0xd7, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x39c,
    OBJ_SHAPE_HORIZONTAL | 0xd, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x391,
    OBJ_SHAPE_HORIZONTAL | 0x1d, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x39c,
    OBJ_SHAPE_HORIZONTAL | 0xd, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x391,
    OBJ_SHAPE_HORIZONTAL | 0x1d, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x39c
};

static const u16 sStarshipEndOam_39ebe0_Frame2[] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xdb, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x395,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x395,
    OBJ_SHAPE_HORIZONTAL | 0xeb, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x3cb,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3cb,
    OBJ_SHAPE_HORIZONTAL | 0x13, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x395,
    0x13, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x395,
    OBJ_SHAPE_HORIZONTAL | 0x3, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x3cb,
    0x3, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3cb
};

static const u16 sStarshipEndOam_39ebe0_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x2a0
};

static const u16 sStarshipEndOam_39ec08_Frame0[] = {
    9,
    0xdc, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x210,
    0xdc, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x214,
    0xfc, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x290,
    0xdc, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x240,
    0x1c, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x240,
    0x1c, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0x17, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_9 | 0x3d2,
    0x17, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_9 | 0x3d2
};

static const u16 sStarshipEndOam_39ec08_Frame2[] = {
    9,
    0xd4, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x218,
    0xd4, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x21c,
    0xf4, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x298,
    0xdc, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x240,
    0x1c, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x240,
    0x1c, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341,
    0x17, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_9 | 0x3d2,
    0x17, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_9 | 0x3d2
};

static const u16 sStarshipEndOam_39ec30_Frame3[] = {
    6,
    0xa, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_9 | 0x391,
    0xa, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x394,
    0x2a, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0xa, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_9 | 0x391,
    0xa, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x394,
    0x2a, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39ec30_Frame2[] = {
    6,
    0x9, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_9 | 0x391,
    0x9, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x394,
    0x29, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0x9, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_9 | 0x391,
    0x9, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x394,
    0x29, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39ec30_Frame1[] = {
    6,
    0x8, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_9 | 0x391,
    0x8, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x394,
    0x28, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0x8, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_9 | 0x391,
    0x8, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x394,
    0x28, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39ec30_Frame0[] = {
    6,
    0x7, OBJ_SIZE_32x32 | 0x1c8, OBJ_PALETTE_9 | 0x391,
    0x7, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_9 | 0x394,
    0x27, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_9 | 0x386,
    0x7, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x18, OBJ_PALETTE_9 | 0x391,
    0x7, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_9 | 0x394,
    0x27, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_9 | 0x386
};

static const u16 sStarshipEndOam_39ec08_Frame1[] = {
    9,
    0xdc, OBJ_SIZE_32x32 | 0x1e0, OBJ_PALETTE_8 | 0x248,
    0xdc, OBJ_SIZE_32x32 | 0x0, OBJ_PALETTE_8 | 0x24c,
    0xfc, OBJ_SIZE_64x64 | 0x1e0, OBJ_PALETTE_8 | 0x2c8,
    0x1c, OBJ_SIZE_16x16 | 0x1d0, OBJ_PALETTE_8 | 0x346,
    0x1c, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x20, OBJ_PALETTE_8 | 0x346,
    0xdc, OBJ_SIZE_64x64 | 0x1a0, OBJ_PALETTE_8 | 0x240,
    0x1c, OBJ_SIZE_32x32 | 0x1a8, OBJ_PALETTE_8 | 0x341,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x20, OBJ_PALETTE_8 | 0x240,
    0x1c, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x38, OBJ_PALETTE_8 | 0x341
};

const struct FrameData sStarshipEndOam_39eb38[2] = {
    [0] = {
        .pFrame = sStarshipEndOam_39eb38_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sStarshipEndOam_39eb48[7] = {
    [0] = {
        .pFrame = sStarshipEndOam_39eb48_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sStarshipEndOam_39eb48_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sStarshipEndOam_39eb48_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sStarshipEndOam_39eb48_Frame3,
        .timer = 16
    },
    [4] = {
        .pFrame = sStarshipEndOam_39eb48_Frame2,
        .timer = 16
    },
    [5] = {
        .pFrame = sStarshipEndOam_39eb48_Frame1,
        .timer = 16
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sStarshipEndOam_39eb80[7] = {
    [0] = {
        .pFrame = sStarshipEndOam_39eb80_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sStarshipEndOam_39eb80_Frame1,
        .timer = 12
    },
    [2] = {
        .pFrame = sStarshipEndOam_39eb80_Frame2,
        .timer = 12
    },
    [3] = {
        .pFrame = sStarshipEndOam_39eb80_Frame3,
        .timer = 12
    },
    [4] = {
        .pFrame = sStarshipEndOam_39eb80_Frame2,
        .timer = 12
    },
    [5] = {
        .pFrame = sStarshipEndOam_39eb80_Frame1,
        .timer = 12
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sStarshipEndOam_39ebb8[5] = {
    [0] = {
        .pFrame = sStarshipEndOam_39ebb8_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sStarshipEndOam_39ebb8_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sStarshipEndOam_39ebb8_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sStarshipEndOam_39ebb8_Frame1,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sStarshipEndOam_39ebe0[5] = {
    [0] = {
        .pFrame = sStarshipEndOam_39ebe0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sStarshipEndOam_39ebe0_Frame1,
        .timer = 1
    },
    [2] = {
        .pFrame = sStarshipEndOam_39ebe0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sStarshipEndOam_39ebe0_Frame1,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sStarshipEndOam_39ec08[5] = {
    [0] = {
        .pFrame = sStarshipEndOam_39ec08_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sStarshipEndOam_39ec08_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sStarshipEndOam_39ec08_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sStarshipEndOam_39ec08_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sStarshipEndOam_39ec30[7] = {
    [0] = {
        .pFrame = sStarshipEndOam_39ec30_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sStarshipEndOam_39ec30_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sStarshipEndOam_39ec30_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sStarshipEndOam_39ec30_Frame3,
        .timer = 16
    },
    [4] = {
        .pFrame = sStarshipEndOam_39ec30_Frame2,
        .timer = 16
    },
    [5] = {
        .pFrame = sStarshipEndOam_39ec30_Frame1,
        .timer = 16
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sStarshipEndOam_39ec68[2] = {
    [0] = {
        .pFrame = sStarshipEndOam_39ec08_Frame1,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sStarshipEndOam_39ec78[3] = {
    [0] = {
        .pFrame = sStarshipEndOam_39ec08_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sStarshipEndOam_39ec08_Frame2,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};
