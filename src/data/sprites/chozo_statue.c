#include "data/sprites/chozo_statue.h"

const u32 sChozoStatueGfx[1 * 512] = INCBIN_U32("data/sprites/chozo_statue.gfx");
const u16 sChozoStatuePal[1 * 16] = INCBIN_U16("data/sprites/chozo_statue.pal");

static const u16 sChozoStatueOam_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x20e
};

static const u16 sFakeChozoBallOam_Exposed_Frame0[] = {
    1,
    0xd2, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x216
};

static const u16 sFakeChozoBallOam_Exposed_Frame1[] = {
    1,
    0xd2, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x214
};

static const u16 sFakeChozoBallOam_Exposed_Frame2[] = {
    1,
    0xd2, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x212
};

static const u16 sFakeChozoBallOam_Exposed_Frame3[] = {
    1,
    0xd2, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x210
};

static const u16 sFakeChozoBallOam_Idle_Frame0[] = {
    1,
    0xd3, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x218
};

static const u16 sFakeChozoBallOam_328378[] = {
    1,
    0xd2, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x210
};

const struct FrameData sChozoStatueOam[2] = {
    [0] = {
        .pFrame = sChozoStatueOam_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFakeChozoBallOam_Idle[2] = {
    [0] = {
        .pFrame = sFakeChozoBallOam_Idle_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFakeChozoBallOam_Exposed[7] = {
    [0] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame0,
        .timer = 25
    },
    [1] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame1,
        .timer = 15
    },
    [2] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame2,
        .timer = 15
    },
    [3] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame3,
        .timer = 18
    },
    [4] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame2,
        .timer = 15
    },
    [5] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame1,
        .timer = 15
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChozoStatueOam_3283d8[7] = {
    [0] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame0,
        .timer = 25
    },
    [1] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame1,
        .timer = 15
    },
    [2] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame2,
        .timer = 15
    },
    [3] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame3,
        .timer = 18
    },
    [4] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame2,
        .timer = 15
    },
    [5] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame1,
        .timer = 15
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChozoStatueOam_328410[7] = {
    [0] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame0,
        .timer = 25
    },
    [1] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame1,
        .timer = 15
    },
    [2] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame2,
        .timer = 15
    },
    [3] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame3,
        .timer = 18
    },
    [4] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame2,
        .timer = 15
    },
    [5] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame1,
        .timer = 15
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sChozoStatueOam_328448[7] = {
    [0] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame0,
        .timer = 25
    },
    [1] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame1,
        .timer = 15
    },
    [2] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame2,
        .timer = 15
    },
    [3] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame3,
        .timer = 18
    },
    [4] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame2,
        .timer = 15
    },
    [5] = {
        .pFrame = sFakeChozoBallOam_Exposed_Frame1,
        .timer = 15
    },
    [6] = FRAME_DATA_TERMINATOR
};
