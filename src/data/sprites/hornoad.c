#include "data/sprites/hornoad.h"
#include "macros.h"

const s16 sHornoadSpitYMovement[21] = {
    -4, -4, -3, -3
    -2, -2, -1, -1,
     0,  0,  0,  0,
     1,  1,  2,  2,
     4,  4,  8,  8,
     SHORT_MAX
};

const s16 sHornoadJumpVelocityHigh[10] = {
    -6, -12, -6, -3,
     0,   4,  8,  12,
    16,  16
};

const s16 sHornoadJumpVelocityLow[10] = {
    -4,  -8, -4, -3,
     0,   4,  8, 16,
    16,  16
};

const u32 sHornoadGfx[1536] = INCBIN_U32("data/sprites/hornoad.gfx");
const u16 sHornoadPal[16 * 3] = INCBIN_U16("data/sprites/hornoad.pal");

static const u16 sHornoadOam_TiltingHeadHidden_Frame3[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf2, 0x1fc, OBJ_SPRITE_OAM | 0x218,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_SPRITE_OAM | 0x20f
};

static const u16 sHornoadOam_TiltingHeadHidden_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf1, 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_SPRITE_OAM | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_TiltingHeadHidden_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x218,
    0xec, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x210,
    OBJ_SHAPE_VERTICAL | 0xec, 0x0, OBJ_SPRITE_OAM | 0x212
};

static const u16 sHornoadOam_MunchingHidden_Frame1[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf3, 0x1f0, OBJ_SPRITE_OAM | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_MunchingHidden_Frame4[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ef, OBJ_SPRITE_OAM | 0x208,
    0xeb, OBJ_SIZE_16x16 | 0x1ef, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1ff, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_MunchingHidden_Frame5[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_SPRITE_OAM | 0x263,
    0xeb, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_MouthHangingOpenHidden_Frame1[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf2, 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_SPRITE_OAM | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_MouthHangingOpenHidden_Frame2[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_SPRITE_OAM | 0x257,
    0xf0, 0x1fe, OBJ_SPRITE_OAM | 0x238,
    0xf2, 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f0, OBJ_SPRITE_OAM | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_SPRITE_OAM | 0x202,
};

static const u16 sHornoadOam_TurningAroundHidden_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_SPRITE_OAM | 0x249,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, OBJ_SPRITE_OAM | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f5, OBJ_SPRITE_OAM | 0x249
};

static const u16 sHornoadOam_2eabe0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_SPRITE_OAM | 0x249,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x240,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f4, OBJ_SPRITE_OAM | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x3, OBJ_SPRITE_OAM | 0x249
};

static const u16 sHornoadOam_2eabfa[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x237,
    0xf1, OBJ_X_FLIP | 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_2eac1a[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x237,
    0xf2, OBJ_X_FLIP | 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1ff, OBJ_SPRITE_OAM | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | 0x1ff, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x1f7, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_2eabe0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_SPRITE_OAM | 0x237,
    0xf2, OBJ_X_FLIP | 0x1fc, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x26a,
    OBJ_SHAPE_HORIZONTAL | 0xed, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_IdleHidden_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf2, 0x1fb, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1f0, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_IdleHidden_Frame1[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf2, 0x1fb, OBJ_SPRITE_OAM | 0x218,
    0xf6, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x25b,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_SPRITE_OAM | 0x202
};

static const u16 sHornoadOam_IdleHidden_Frame3[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x237,
    0xf3, 0x1fb, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f0, OBJ_SPRITE_OAM | 0x243,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xee, 0x0, OBJ_SPRITE_OAM | 0x202
};








const struct FrameData sHornoadOam_TiltingHeadHidden[5];
const struct FrameData sHornoadOam_MunchingHidden[9];
const struct FrameData sHornoadOam_MouthHangingOpenHidden[5];
const struct FrameData sHornoadOam_TurningAroundHidden[3];
const struct FrameData sHornoadOam_TurninSecondPartHidden[3];
const struct FrameData sHornoadOam_IdleHidden[5];
const struct FrameData sHornoadOam_JumpingHidden[5];
const struct FrameData sHornoadOam_LandingHidden[3];
const struct FrameData sHornoadOam_FallingHidden[3];
const struct FrameData sHornoadOam_2eb594[3];

const struct FrameData sHornoadSpawnerOam_Idle[4];
const struct FrameData sHornoadSpawnerOam_BeforeSpawning[7];

const struct FrameData sHornoadOam_TiltingHead[5];
const struct FrameData sHornoadOam_Munching[9];
const struct FrameData sHornoadOam_MouthHangingOpen[5];
const struct FrameData sHornoadOam_TurningAround[3];
const struct FrameData sHornoadOam_TurninSecondPart[3];
const struct FrameData sHornoadOam_Idle[5];
const struct FrameData sHornoadOam_Jumping[5];
const struct FrameData sHornoadOam_Landing[3];
const struct FrameData sHornoadOam_Spitting[7];

const struct FrameData sHornoadSpitOam_Idle[3];
const struct FrameData sHornoadSpitOam_2eb784[4];
const struct FrameData sHornoadSpitOam_2eb7a4[4];
const struct FrameData sHornoadSpitOam_Exploding[4];
const struct FrameData sHornoadSpitOam_2eb7e4[2];

const struct FrameData sHornoadSpawnerOam_Spawning[4];

const struct FrameData sHornoadOam_Falling[3];
const struct FrameData sHornoadOam_2eb82c[3];
const struct FrameData sHornoadOam_2eb844[3];