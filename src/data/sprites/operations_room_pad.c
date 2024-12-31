#include "data/sprites/operations_room_pad.h"

const u32 sOperationsRoomPadGfx[2 * 512] = INCBIN_U32("data/sprites/operations_room_pad.gfx");
const u16 sOperationsRoomPadPal[2 * 16] = INCBIN_U16("data/sprites/operations_room_pad.pal");

static const u16 sOperationsRoomPadOam_34c244_Frame0[] = {
    6,
    0xe0, OBJ_SIZE_32x32 | 0x1d8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_8x32 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1e0, OBJ_PALETTE_8 | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x26a
};

static const u16 sOperationsRoomPadOam_34c2f4_Frame0[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x21a,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x21a,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_9 | 0x245,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x246,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24a,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207
};

static const u16 sOperationsRoomPadOam_34c254_Frame0[] = {
    15,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x21a,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x21a,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x21c,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_PALETTE_9 | 0x245,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x246,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24a,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207
};

static const u16 sOperationsRoomPadOam_34c254_Frame1[] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x23a,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x23a,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x23c,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e9, OBJ_PALETTE_9 | 0x245,
    0x9, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_9 | 0x246,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0xf, OBJ_PALETTE_9 | 0x245,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_9 | 0x24a,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x24a,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207
};

static const u16 sOperationsRoomPadOam_34c254_Frame2[] = {
    13,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x21d,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x21f,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e8, OBJ_PALETTE_9 | 0x245,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x246,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_9 | 0x245,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207
};

static const u16 sOperationsRoomPadOam_34c254_Frame3[] = {
    13,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_PALETTE_9 | 0x21d,
    0x0, 0x1f8, OBJ_PALETTE_9 | 0x21f,
    0x0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x21f,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_9 | 0x248,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_PALETTE_9 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e7, OBJ_PALETTE_9 | 0x245,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_9 | 0x246,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_9 | 0x246,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x11, OBJ_PALETTE_9 | 0x245,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_PALETTE_9 | 0x207,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_9 | 0x205,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_PALETTE_9 | 0x207
};

static const u16 sOperationsRoomPadOam_34c27c_Frame0[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x20a,
    0xe0, 0x1e0, OBJ_PALETTE_8 | 0x23d,
    0xe0, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x23d
};

static const u16 sOperationsRoomPadOam_34c27c_Frame1[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x20d,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x20d,
    0xe0, 0x1e0, OBJ_PALETTE_8 | 0x23e,
    0xe0, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x23e
};

static const u16 sOperationsRoomPadOam_34c27c_Frame2[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x210,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x210,
    0xe0, 0x1e0, OBJ_PALETTE_8 | 0x23f,
    0xe0, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x23f
};

static const u16 sOperationsRoomPadOam_34c2a4_Frame0[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x213,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x211,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x213,
    0xe0, 0x1e0, OBJ_PALETTE_8 | 0x259,
    0xe0, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x259
};

static const u16 sOperationsRoomPadOam_34c2a4_Frame1[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x216,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x216,
    0xe0, 0x1e0, OBJ_PALETTE_8 | 0x25a,
    0xe0, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x25a
};

static const u16 sOperationsRoomPadOam_34c2a4_Frame2[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x219,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x219,
    0xe0, 0x1e0, OBJ_PALETTE_8 | 0x25b,
    0xe0, OBJ_X_FLIP | 0x18, OBJ_PALETTE_8 | 0x25b
};

static const u16 sOperationsRoomPadOam_34c304_Frame0[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x24c,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x24c
};

static const u16 sOperationsRoomPadOam_34c304_Frame1[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x1e0, OBJ_PALETTE_8 | 0x250,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x16 | 0x0, OBJ_PALETTE_8 | 0x250
};

static const u16 sOperationsRoomPadOam_34c31c_Frame0[] = {
    12,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sOperationsRoomPadOam_34c31c_Frame1[] = {
    15,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fc, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x1fc, OBJ_PALETTE_8 | 0x256,
    OBJ_SHAPE_VERTICAL | 0x4, 0x1fc, OBJ_PALETTE_8 | 0x256,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sOperationsRoomPadOam_34c31c_Frame2[] = {
    14,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f0, OBJ_PALETTE_8 | 0x257,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x0, OBJ_PALETTE_8 | 0x257,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

static const u16 sOperationsRoomPadOam_34c31c_Frame3[] = {
    16,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1e0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x0, OBJ_PALETTE_8 | 0x277,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x10, OBJ_PALETTE_8 | 0x277,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0xfc, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x254,
    0x4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x254
};

const struct FrameData sOperationsRoomPadOam_34c244[2] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c244_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c254[5] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c27c[5] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c27c_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sOperationsRoomPadOam_34c27c_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sOperationsRoomPadOam_34c27c_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sOperationsRoomPadOam_34c27c_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c2a4[5] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c2a4_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sOperationsRoomPadOam_34c2a4_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sOperationsRoomPadOam_34c2a4_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sOperationsRoomPadOam_34c2a4_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c2cc[5] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame3,
        .timer = 6
    },
    [1] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame1,
        .timer = 6
    },
    [3] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame0,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c2f4[2] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c2f4_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c304[3] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c304_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sOperationsRoomPadOam_34c304_Frame1,
        .timer = 2
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c31c[5] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c31c_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sOperationsRoomPadOam_34c31c_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sOperationsRoomPadOam_34c31c_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sOperationsRoomPadOam_34c31c_Frame3,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c344[2] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c254_Frame3,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sOperationsRoomPadOam_34c354[5] = {
    [0] = {
        .pFrame = sOperationsRoomPadOam_34c31c_Frame3,
        .timer = 3
    },
    [1] = {
        .pFrame = sOperationsRoomPadOam_34c31c_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sOperationsRoomPadOam_34c31c_Frame1,
        .timer = 3
    },
    [3] = {
        .pFrame = sOperationsRoomPadOam_34c31c_Frame0,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};
