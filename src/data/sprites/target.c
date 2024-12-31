#include "data/sprites/target.h"
#include "macros.h"

static const u16 sTargetOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, 0x3151
};

static const u16 sTargetOam_Idle_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, 0x3150
};

const struct FrameData sTargetOam_Idle[3] = {
    [0] = {
        .pFrame = sTargetOam_Idle_Frame0,
        .timer = 30
    },
    [1] = {
        .pFrame = sTargetOam_Idle_Frame1,
        .timer = 30
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sTargetOam_Unused[2] = {
    [0] = {
        .pFrame = sTargetOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const s16 sTargetCircles_Unused[17] = {
     0,  0, -1, -2,
    -3, -3, -2, -1,
     0,  0,  1,  2,
     3,  3,  2,  1,
    SHORT_MAX
};

const s16 sTargetCirclesYMovement[65] = {
     0,  0,  0,  0,
     1,  1,  1,  1,
     2,  2,  2,  2,
     3,  3,  3,  3,
     3,  3,  3,  3,
     2,  2,  2,  2,
     1,  1,  1,  1,
     0,  0,  0,  0,
     0,  0,  0,  0,
    -1, -1, -1, -1,
    -2, -2, -2, -2,
    -3, -3, -3, -3,
    -3, -3, -3, -3,
    -2, -2, -2, -2,
    -1, -1, -1, -1,
     0,  0,  0,  0,
    SHORT_MAX
};

const s16 sTargetCirclesXMovement[81] = {
     0,  0,  1,  1,
     2,  2,  3,  3,
     4,  4,  5,  5,
     6,  6,  7,  7,
     7,  7,  8,  8,
     8,  8,  7,  7,
     7,  7,  6,  6,
     5,  5,  4,  4,
     3,  3,  2,  2,
     1,  1,  0,  0,
     0,  0, -1, -1,
    -2, -2, -3, -3,
    -4, -4, -5, -5,
    -6, -6, -7, -7,
    -7, -7, -8, -8,
    -8, -8, -7, -7,
    -7, -7, -6, -6,
    -5, -5, -4, -4,
    -3, -3, -2, -2,
    -1, -1,  0,  0,
    SHORT_MAX
};

const u32 sSpritePlaceholderGfx[1 * 512] = INCBIN_U32("data/sprites/placeholder.gfx");
const u16 sSpritePlaceholderPal[1 * 16] = INCBIN_U16("data/sprites/placeholder.pal");
