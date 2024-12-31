#include "data/sprites/zoro.h"

const u32 sZoroGfx[1 * 512] = INCBIN_U32("data/sprites/zoro.gfx");
const u32 sBlueZoroGfx[1 * 512] = INCBIN_U32("data/sprites/blue_zoro.gfx");
const u16 sZoroPal[1 * 16] = INCBIN_U16("data/sprites/zoro.pal");
const u16 sBlueZoroPal[1 * 16] = INCBIN_U16("data/sprites/blue_zoro.pal");

static const u16 sZoroOam_CrawlingVertical_Frame0[] = {
    8,
    0xfd, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20e,
    0xfd, 0x10, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_VERTICAL | 0x1, 0x0, OBJ_PALETTE_8 | 0x212,
    0x9, 0x8, OBJ_PALETTE_8 | 0x208,
    0xf8, 0x10, OBJ_PALETTE_8 | 0x230,
    0xf7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20c,
    0xed, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    0xef, 0x0, OBJ_PALETTE_8 | 0x207
};

static const u16 sZoroOam_CrawlingVertical_Frame1[] = {
    8,
    0xfd, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20e,
    0xfd, 0x10, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_VERTICAL | 0x1, 0x0, OBJ_PALETTE_8 | 0x212,
    0x9, 0x8, OBJ_PALETTE_8 | 0x208,
    0xf8, 0x10, OBJ_PALETTE_8 | 0x230,
    0xf7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20c,
    0xec, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    0xed, 0x0, OBJ_PALETTE_8 | 0x207
};

static const u16 sZoroOam_CrawlingVertical_Frame2[] = {
    8,
    0xfe, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20e,
    0xfe, 0x10, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_VERTICAL | 0x2, 0x0, OBJ_PALETTE_8 | 0x212,
    0xa, 0x8, OBJ_PALETTE_8 | 0x208,
    0xf8, 0x10, OBJ_PALETTE_8 | 0x230,
    0xf7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20c,
    0xeb, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    0xeb, 0x0, OBJ_PALETTE_8 | 0x207
};

static const u16 sZoroOam_CrawlingVertical_Frame3[] = {
    8,
    0xff, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20e,
    0xff, 0x10, OBJ_PALETTE_8 | 0x231,
    OBJ_SHAPE_VERTICAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x212,
    0xc, 0x8, OBJ_PALETTE_8 | 0x208,
    0xf8, 0x10, OBJ_PALETTE_8 | 0x230,
    0xf7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20c,
    0xea, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a,
    0xea, 0x0, OBJ_PALETTE_8 | 0x207
};

static const u16 sZoroOam_TurningAroundVertical1_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x0, OBJ_PALETTE_8 | 0x210,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x10, OBJ_PALETTE_8 | 0x21c
};

static const u16 sZoroOam_TurningAroundVertical1_Frame1[] = {
    3,
    0xf4, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_HORIZONTAL | 0x3, OBJ_Y_FLIP | 0x0, OBJ_PALETTE_8 | 0x21d,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x10, OBJ_PALETTE_8 | 0x21f
};

static const u16 sZoroOam_CrawlingHorizontal_Frame0[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe8, 0x1fe, OBJ_PALETTE_8 | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x2, OBJ_PALETTE_8 | 0x228,
    0xf0, 0xa, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe8, 0x1f9, OBJ_PALETTE_8 | 0x226,
    0xf0, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x200,
    0xf8, 0x1f0, OBJ_PALETTE_8 | 0x206
};

static const u16 sZoroOam_CrawlingHorizontal_Frame1[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe8, 0x1fe, OBJ_PALETTE_8 | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x2, OBJ_PALETTE_8 | 0x228,
    0xf0, 0xa, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe8, 0x1f9, OBJ_PALETTE_8 | 0x226,
    0xf0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x200,
    0xf8, 0x1ee, OBJ_PALETTE_8 | 0x206
};

static const u16 sZoroOam_CrawlingHorizontal_Frame2[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x204,
    0xe8, 0x1ff, OBJ_PALETTE_8 | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x5, OBJ_PALETTE_8 | 0x228,
    0xf0, 0xd, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe8, 0x1f9, OBJ_PALETTE_8 | 0x226,
    0xf0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x200,
    0xf8, 0x1ec, OBJ_PALETTE_8 | 0x206
};

static const u16 sZoroOam_CrawlingHorizontal_Frame3[] = {
    8,
    0xf0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x204,
    0xe8, 0x0, OBJ_PALETTE_8 | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x7, OBJ_PALETTE_8 | 0x228,
    0xf0, 0xf, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe8, 0x1f9, OBJ_PALETTE_8 | 0x226,
    0xf0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x200,
    0xf8, 0x1eb, OBJ_PALETTE_8 | 0x206
};

static const u16 sZoroOam_TurningAroundHorizontal1_Frame0[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, OBJ_PALETTE_8 | 0x218
};

static const u16 sZoroOam_TurningAroundHorizontal1_Frame1[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, OBJ_PALETTE_8 | 0x238
};

const struct FrameData sZoroOam_CrawlingHorizontal[7] = {
    [0] = {
        .pFrame = sZoroOam_CrawlingHorizontal_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sZoroOam_CrawlingHorizontal_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sZoroOam_CrawlingHorizontal_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sZoroOam_CrawlingHorizontal_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sZoroOam_CrawlingHorizontal_Frame2,
        .timer = 6
    },
    [5] = {
        .pFrame = sZoroOam_CrawlingHorizontal_Frame1,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroOam_TurningAroundHorizontal1[3] = {
    [0] = {
        .pFrame = sZoroOam_TurningAroundHorizontal1_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZoroOam_TurningAroundHorizontal1_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroOam_TurningAroundHorizontal2[3] = {
    [0] = {
        .pFrame = sZoroOam_TurningAroundHorizontal1_Frame1,
        .timer = 4
    },
    [1] = {
        .pFrame = sZoroOam_TurningAroundHorizontal1_Frame0,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroOam_CrawlingVertical[7] = {
    [0] = {
        .pFrame = sZoroOam_CrawlingVertical_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sZoroOam_CrawlingVertical_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sZoroOam_CrawlingVertical_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sZoroOam_CrawlingVertical_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sZoroOam_CrawlingVertical_Frame2,
        .timer = 6
    },
    [5] = {
        .pFrame = sZoroOam_CrawlingVertical_Frame1,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroOam_TurningAroundVertical1[3] = {
    [0] = {
        .pFrame = sZoroOam_TurningAroundVertical1_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZoroOam_TurningAroundVertical1_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroOam_TurningAroundVertical2[3] = {
    [0] = {
        .pFrame = sZoroOam_TurningAroundVertical1_Frame1,
        .timer = 4
    },
    [1] = {
        .pFrame = sZoroOam_TurningAroundVertical1_Frame0,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};
