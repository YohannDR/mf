#include "data/sprites/gunship.h"
#include "macros.h"

const u32 sGunshipGfx[6 * 512] = INCBIN_U32("data/sprites/gunship.gfx");
const u16 sGunshipPal[6 * 16] = INCBIN_U16("data/sprites/gunship.pal");

static const u16 sGunshipPartOam_Idle_Frame0[OAM_DATA_SIZE(14)] = {
    0xe,
    0xc8, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x12d0,
    0xe8, 0x1fc, OBJ_SPRITE_OAM | 0x1351,
    0x98, OBJ_SIZE_64x64 | 0x1b0, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1d0, OBJ_SPRITE_OAM | 0x130c,
    0xd8, OBJ_SIZE_32x32 | 0x1b0, OBJ_SPRITE_OAM | 0x1308,
    OBJ_SHAPE_VERTICAL | 0xb8, OBJ_SIZE_16x32 | 0x1a0, OBJ_SPRITE_OAM | 0x1286,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_16x32 | 0x1a0, OBJ_SPRITE_OAM | 0x1306,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_SIZE_32x8 | 0x1ac, OBJ_SPRITE_OAM | 0x12e0,
    0x98, OBJ_X_FLIP | OBJ_SIZE_64x64 | 0x10, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x10, OBJ_SPRITE_OAM | 0x130c,
    0xd8, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x30, OBJ_SPRITE_OAM | 0x1308,
    OBJ_SHAPE_VERTICAL | 0xb8, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x50, OBJ_SPRITE_OAM | 0x1286,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x50, OBJ_SPRITE_OAM | 0x1306,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | OBJ_SIZE_32x8 | 0x34, OBJ_SPRITE_OAM | 0x12e0
};

static const u16 sGunshipOam_Idle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0x98, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x1210,
    0xa8, OBJ_SIZE_32x32 | 0x1e8, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xa8, OBJ_SIZE_16x32 | 0x8, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x281
};

static const u16 sGunshipBeamOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x2c0
};

static const u16 sGunshipBeamOam_Idle_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f1, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1ff, OBJ_SPRITE_OAM | 0x2c2
};

static const u16 sGunshipBeamOam_Idle_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1f2, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_HORIZONTAL | 0xfc, 0x1fe, OBJ_SPRITE_OAM | 0x2c2
};


const struct FrameData sGunshipOam_Idle[2] = {
    [0] = {
        .pFrame = sGunshipOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGunshipBeamOam_Idle[5] = {
    [0] = {
        .pFrame = sGunshipBeamOam_Idle_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sGunshipBeamOam_Idle_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sGunshipBeamOam_Idle_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sGunshipBeamOam_Idle_Frame1,
        .timer = 3
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGunshipPartOam_Idle[2] = {
    [0] = {
        .pFrame = sGunshipPartOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const u16 sGunshipFlashingPal[7 * 16] = INCBIN_U16("data/sprites/gunship_flashing.pal");

static const u8 sBlob_2f4818_35dd74[] = INCBIN_U8("data/Blob_2f4818_35dd74.bin");
