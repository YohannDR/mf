#include "data/sprites/fake_tank.h"

const s16 sFakeTankFlyingYMovement[65] = {
    0, 0, 0, 0,
    1, 0, 1, 0,
    1, 0, 1, 0,
    1, 1, 1, 2,
    2, 1, 1, 1,
    0, 1, 0, 1,
    0, 1, 0, 1,
    0, 0, 0, 0,
    0, 0, 0, 0,
    -1, 0, -1, 0,
    -1, 0, -1, 0,
    -1, -1, -1, -2,
    -2, -1, -1, -1,
    0, -1, 0, -1,
    0, -1, 0, -1,
    0, 0, 0, 0,
    SHORT_MAX
};

const u32 sFakeEnergyTankGfx[1 * 512] = INCBIN_U32("data/sprites/fake_energy_tank.gfx");
const u16 sFakeEnergyTankPal[1 * 16] = INCBIN_U16("data/sprites/fake_energy_tank.pal");

static const u16 sFakeEnergyTankOam_37d85c_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sFakeEnergyTankOam_37d884_Frame0[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xf2, 0x1f1, OBJ_PALETTE_8 | 0x219,
    0xf2, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x219
};

static const u16 sFakeEnergyTankOam_37d884_Frame1[] = {
    5,
    0xfa, 0x1f8, OBJ_PALETTE_8 | 0x238,
    0xfa, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x238,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1f1, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFakeEnergyTankOam_37d884_Frame2[] = {
    5,
    0xfa, 0x1f8, OBJ_PALETTE_8 | 0x239,
    0xfa, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1f3, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x5, OBJ_PALETTE_8 | 0x21b
};

static const u16 sFakeEnergyTankOam_37d884_Frame3[] = {
    5,
    0xfa, 0x1f8, OBJ_PALETTE_8 | 0x239,
    0xfa, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x21b
};

static const u16 sFakeEnergyTankOam_37d884_Frame4[] = {
    5,
    0xfa, 0x1f8, OBJ_PALETTE_8 | 0x239,
    0xfa, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x21c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFakeEnergyTankOam_37d884_Frame5[] = {
    5,
    0xfa, 0x1f8, OBJ_PALETTE_8 | 0x239,
    0xfa, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x21e,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFakeEnergyTankOam_37d85c_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sFakeEnergyTankOam_37d85c_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

const struct FrameData sFakeEnergyTankOam_37d85c[5] = {
    [0] = {
        .pFrame = sFakeEnergyTankOam_37d85c_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFakeEnergyTankOam_37d85c_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sFakeEnergyTankOam_37d85c_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sFakeEnergyTankOam_37d85c_Frame0,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFakeEnergyTankOam_37d884[7] = {
    [0] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame2,
        .timer = 5
    },
    [3] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame3,
        .timer = 11
    },
    [4] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame5,
        .timer = 15
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFakeEnergyTankOam_37d8bc[5] = {
    [0] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame3,
        .timer = 4
    },
    [1] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame4,
        .timer = 4
    },
    [2] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame5,
        .timer = 4
    },
    [3] = {
        .pFrame = sFakeEnergyTankOam_37d884_Frame4,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const u32 sFakeMissileTankGfx[1 * 512] = INCBIN_U32("data/sprites/fake_missile_tank.gfx");
const u16 sFakeMissileTankPal[1 * 16] = INCBIN_U16("data/sprites/fake_missile_tank.pal");

static const u16 sFakeMissileTankOam_37e214_Frame0[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sFakeMissileTankOam_37e23c_Frame0[] = {
    5,
    0xfb, 0x1f6, OBJ_PALETTE_8 | 0x238,
    0xfb, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x238,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xef, 0x1f0, OBJ_PALETTE_8 | 0x219,
    0xef, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x219
};

static const u16 sFakeMissileTankOam_37e23c_Frame1[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1f1, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0x7, OBJ_PALETTE_8 | 0x21a,
    0xfd, 0x1f6, OBJ_PALETTE_8 | 0x238,
    0xfd, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x238,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208
};

static const u16 sFakeMissileTankOam_37e23c_Frame2[] = {
    5,
    0xfc, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x1f6, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1f0, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | 0x8, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFakeMissileTankOam_37e23c_Frame3[] = {
    6,
    0xfc, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x1f6, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe8, 0x1fc, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1ef, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x21a
};

static const u16 sFakeMissileTankOam_37e23c_Frame4[] = {
    6,
    0xfc, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x1f6, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe8, 0x1fc, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, OBJ_PALETTE_8 | 0x21b,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x21b
};

static const u16 sFakeMissileTankOam_37e23c_Frame5[] = {
    6,
    0xfc, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x1f6, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe8, 0x1fc, OBJ_PALETTE_8 | 0x20e,
    0xf0, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x21c,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x21c
};

static const u16 sFakeMissileTankOam_37e23c_Frame6[] = {
    6,
    0xfc, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x239,
    0xfc, 0x1f6, OBJ_PALETTE_8 | 0x239,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe8, 0x1fc, OBJ_PALETTE_8 | 0x20e,
    0xef, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x21e,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x21e
};

static const u16 sFakeMissileTankOam_37e214_Frame1[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sFakeMissileTankOam_37e214_Frame2[] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

const struct FrameData sFakeMissileTankOam_37e214[5] = {
    [0] = {
        .pFrame = sFakeMissileTankOam_37e214_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFakeMissileTankOam_37e214_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sFakeMissileTankOam_37e214_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sFakeMissileTankOam_37e214_Frame0,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFakeMissileTankOam_37e23c[8] = {
    [0] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame3,
        .timer = 15
    },
    [4] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame4,
        .timer = 9
    },
    [5] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame5,
        .timer = 9
    },
    [6] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame6,
        .timer = 10
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFakeMissileTankOam_37e27c[5] = {
    [0] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame4,
        .timer = 4
    },
    [1] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame5,
        .timer = 4
    },
    [2] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame6,
        .timer = 4
    },
    [3] = {
        .pFrame = sFakeMissileTankOam_37e23c_Frame5,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};
