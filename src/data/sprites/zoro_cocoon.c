#include "data/sprites/zoro_cocoon.h"
#include "macros.h"

const u32 sZoroCocoonGfx[1024] = INCBIN_U32("data/sprites/zoro_cocoon.gfx");
const u16 sZoroCocoonPal[2 * 16] = INCBIN_U16("data/sprites/zoro_cocoon.pal");


static const u16 sZoroCocoonOam_TransformedVertical_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xf0, OBJ_SIZE_32x32 | 0x0, OBJ_SPRITE_OAM | 0x200
};

static const u16 sZoroCocoonOam_TransformedVertical_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf9, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x227,
    0xf0, OBJ_SIZE_32x32 | 0x1f8, OBJ_SPRITE_OAM | 0x203
};

static const u16 sZoroCocoonOam_TransformedVertical_Frame2[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x2, OBJ_SPRITE_OAM | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x0, OBJ_SPRITE_OAM | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1, OBJ_SPRITE_OAM | 0x247,
    0x0, OBJ_SIZE_16x16 | 0x1ff, OBJ_SPRITE_OAM | 0x20b,
    0xf0, OBJ_SIZE_32x32 | 0x1f8, OBJ_SPRITE_OAM | 0x203
};

static const u16 sZoroCocoonOam_TransformedVertical_Frame3[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ff, OBJ_SPRITE_OAM | 0x227,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x0, OBJ_SPRITE_OAM | 0x267,
    0x0, OBJ_SIZE_16x16 | 0x1ff, OBJ_SPRITE_OAM | 0x20b,
    0xf0, OBJ_SIZE_32x32 | 0x1f8, OBJ_SPRITE_OAM | 0x203
};

static const u16 sZoroCocoonOam_UntransformedVertical_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_SIZE_16x32 | 0x0, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x10, OBJ_SPRITE_OAM | 0x24b
};

static const u16 sZoroCocoonOam_TransformedHorizontal_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xe8, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x20d
};

static const u16 sZoroCocoonOam_TransformedHorizontal_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, OBJ_SPRITE_OAM | 0x256,
    0xe8, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x211
};

static const u16 sZoroCocoonOam_TransformedHorizontal_Frame2[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f0, OBJ_SPRITE_OAM | 0x255,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f8, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_VERTICAL | 0xef, 0x0, OBJ_SPRITE_OAM | 0x257,
    0xf1, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x259,
    0xe8, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x211
};

static const u16 sZoroCocoonOam_TransformedHorizontal_Frame3[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f0, OBJ_SPRITE_OAM | 0x255,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f8, OBJ_SPRITE_OAM | 0x256,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1ff, OBJ_SPRITE_OAM | 0x258,
    0xf1, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x259,
    0xe8, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x211
};

static const u16 sZoroCocoonOam_UntransformedHorizontal_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ef, OBJ_SPRITE_OAM | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, OBJ_SPRITE_OAM | 0x219
};


const struct FrameData sZoroCocoonOam_TransformedVertical[10] = {
    [0] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame1,
        .timer = 30
    },
    [2] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame0,
        .timer = 4
    },
    [5] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame1,
        .timer = 4
    },
    [6] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame2,
        .timer = 4
    },
    [7] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame3,
        .timer = 4
    },
    [8] = {
        .pFrame = sZoroCocoonOam_TransformedVertical_Frame2,
        .timer = 60
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroCocoonOam_UntransformedVertical[2] = {
    [0] = {
        .pFrame = sZoroCocoonOam_UntransformedVertical_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroCocoonOam_TransformedHorizontal[10] = {
    [0] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame1,
        .timer = 30
    },
    [2] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame0,
        .timer = 4
    },
    [5] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame1,
        .timer = 4
    },
    [6] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame2,
        .timer = 4
    },
    [7] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame3,
        .timer = 4
    },
    [8] = {
        .pFrame = sZoroCocoonOam_TransformedHorizontal_Frame2,
        .timer = 60
    },
    [9] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroCocoonOam_UntransformedHorizontal[2] = {
    [0] = {
        .pFrame = sZoroCocoonOam_UntransformedHorizontal_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};


const u32 sZoroHuskGfx[512] = INCBIN_U32("data/sprites/zoro_husk.gfx");
const u16 sZoroHuskPal[1 * 16] = INCBIN_U16("data/sprites/zoro_husk.pal");


static const u16 sZoroHuskOam_Vertical_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_SIZE_32x16 | 0x1f8, OBJ_SPRITE_OAM | 0x203
};

static const u16 sZoroHuskOam_Horizontal_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x20c
};

const struct FrameData sZoroHuskOam_Vertical[2] = {
    [0] = {
        .pFrame = sZoroHuskOam_Vertical_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZoroHuskOam_Horizontal[2] = {
    [0] = {
        .pFrame = sZoroHuskOam_Horizontal_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};
