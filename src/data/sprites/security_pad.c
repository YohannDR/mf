#include "data/sprites/security_pad.h"
#include "macros.h"

const u32 sSecurityPadGfx[3 * 512] = INCBIN_U32("data/sprites/security_pad.gfx");
const u16 sSecurityPadPal[3 * 16] = INCBIN_U16("data/sprites/security_pad.pal");

static const u16 sSecurityPadMonitorOam_Idle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_SPRITE_OAM | 0x255,
    0xf8, 0x5, OBJ_SPRITE_OAM | 0x257
};

static const u16 sSecurityPadMonitorOam_ArmExtending_Frame1[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_SPRITE_OAM | 0x255,
    0xf8, 0x5, OBJ_SPRITE_OAM | 0x257,
    0xe8, 0xa, OBJ_SPRITE_OAM | 0x250
};

static const u16 sSecurityPadMonitorOam_ArmExtending_Frame2[OAM_DATA_SIZE(5)] = {
    0x5,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_SPRITE_OAM | 0x255,
    0xf8, 0x5, OBJ_SPRITE_OAM | 0x257,
    0xe8, 0xc, OBJ_SPRITE_OAM | 0x251
};

static const u16 sSecurityPadMonitorOam_ArmExtending_Frame3[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_SPRITE_OAM | 0x255,
    0xf8, 0x5, OBJ_SPRITE_OAM | 0x257,
    0xe8, 0xe, OBJ_SPRITE_OAM | 0x252,
    0xe8, 0x6, OBJ_SPRITE_OAM | 0x254
};

static const u16 sSecurityPadMonitorOam_ArmExtending_Frame4[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_SPRITE_OAM | 0x255,
    0xf8, 0x5, OBJ_SPRITE_OAM | 0x257,
    0xe8, 0x10, OBJ_SPRITE_OAM | 0x253,
    0xe8, 0x8, OBJ_SPRITE_OAM | 0x254
};

static const u16 sSecurityPadMonitorOam_ArmRetracting_Frame0[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ed, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_SPRITE_OAM | 0x255,
    0xf8, 0x5, OBJ_SPRITE_OAM | 0x257,
    0xe8, 0x11, OBJ_SPRITE_OAM | 0x250,
    0xe8, 0x9, OBJ_SPRITE_OAM | 0x254
};

static const u16 sSecurityPadScreenOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x20c
};

static const u16 sSecurityPadScreenOam_Idle_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sSecurityPadScreenOam_Idle_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x210
};

static const u16 sSecurityPadScreenOam_Idle_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x212
};

static const u16 sSecurityPadScreenOam_Unlocking_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x214
};

static const u16 sSecurityPadScreenOam_Unlocking_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x216
};

static const u16 sSecurityPadScreenOam_Unlocking_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x218
};

static const u16 sSecurityPadScreenOam_Unlocking_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x21a
};

static const u16 sSecurityPadScreenOam_Inactive_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x202
};

static const u16 sSecurityPadScreenOam_Inactive_Frame1[OAM_DATA_SIZE(3)] = {
    0x3,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x1fd, OBJ_SPRITE_OAM | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1fd, OBJ_SPRITE_OAM | 0x23c,
    0xd8, 0x5, OBJ_SPRITE_OAM | 0x203
};

static const u16 sSecurityPadScreenOam_Inactive_Frame2[OAM_DATA_SIZE(3)] = {
    0x3,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x1fd, OBJ_SPRITE_OAM | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1fd, OBJ_SPRITE_OAM | 0x23e,
    0xd8, 0x5, OBJ_SPRITE_OAM | 0x203
};

static const u16 sSecurityPadScreenOam_Inactive_Frame3[OAM_DATA_SIZE(3)] = {
    0x3,
    0xe0, 0x1fd, OBJ_SPRITE_OAM | 0x21d,
    0xe0, 0x5, OBJ_SPRITE_OAM | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fd, OBJ_SPRITE_OAM | 0x202
};

static const u16 sSecurityPadOam_Idle_Frame0[OAM_DATA_SIZE(15)] = {
    0xf,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_SPRITE_OAM | 0x1245,
    0x0, 0x1f8, OBJ_SPRITE_OAM | 0x1247,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x1245,
    0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x1247,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_SPRITE_OAM | 0x1280,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_SPRITE_OAM | 0x1241,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1243,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_SPRITE_OAM | 0x1241,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_SPRITE_OAM | 0x1280,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, OBJ_SPRITE_OAM | 0x124e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x124e,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_SPRITE_OAM | 0x120a,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x120a
};

static const u16 sSecurityPadOam_Pressing_Frame0[OAM_DATA_SIZE(15)] = {
    0xf,
    0x8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1243,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_SPRITE_OAM | 0x1245,
    0x0, 0x1f8, OBJ_SPRITE_OAM | 0x1247,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x1245,
    0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x1247,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1e9, OBJ_SPRITE_OAM | 0x1280,
    0x8, OBJ_SIZE_16x16 | 0x1ee, OBJ_SPRITE_OAM | 0x1241,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_SPRITE_OAM | 0x1241,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_SPRITE_OAM | 0x1280,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f0, OBJ_SPRITE_OAM | 0x124e,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x124e,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_SPRITE_OAM | 0x120a,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x120a
};

static const u16 sSecurityPadOam_Pressing_Frame1[OAM_DATA_SIZE(15)] = {
    0xf,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_SPRITE_OAM | 0x1248,
    0x0, 0x1f8, OBJ_SPRITE_OAM | 0x124a,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x1248,
    0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x124a,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e9, OBJ_SPRITE_OAM | 0x1280,
    0x9, OBJ_SIZE_16x16 | 0x1ee, OBJ_SPRITE_OAM | 0x1241,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1243,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_SPRITE_OAM | 0x1241,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0xf, OBJ_SPRITE_OAM | 0x1280,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f0, OBJ_SPRITE_OAM | 0x124e,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x124e,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_SPRITE_OAM | 0x120a,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x120a
};

static const u16 sSecurityPadOam_Pressing_Frame2[OAM_DATA_SIZE(13)] = {
    0xd,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_SPRITE_OAM | 0x124b,
    0x0, 0x1f8, OBJ_SPRITE_OAM | 0x124d,
    0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x124d,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x124b,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e8, OBJ_SPRITE_OAM | 0x1280,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_SPRITE_OAM | 0x1241,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1243,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_SPRITE_OAM | 0x1241,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_SPRITE_OAM | 0x1280,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_SPRITE_OAM | 0x120a,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x120a
};

static const u16 sSecurityPadOam_Pressing_Frame3[OAM_DATA_SIZE(13)] = {
    0xd,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1e8, OBJ_SPRITE_OAM | 0x124b,
    0x0, 0x1f8, OBJ_SPRITE_OAM | 0x124d,
    0x0, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x124d,
    0x9, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x1243,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x124b,
    OBJ_SHAPE_VERTICAL | 0x9, 0x1e7, OBJ_SPRITE_OAM | 0x1280,
    0x9, OBJ_SIZE_16x16 | 0x1ed, OBJ_SPRITE_OAM | 0x1241,
    0x9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_SPRITE_OAM | 0x1241,
    OBJ_SHAPE_VERTICAL | 0x9, OBJ_X_FLIP | 0x11, OBJ_SPRITE_OAM | 0x1280,
    0x8, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, 0x1f8, OBJ_SPRITE_OAM | 0x120a,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x1208,
    OBJ_SHAPE_VERTICAL | 0x8, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x120a
};


const struct FrameData sSecurityPadMonitorOam_Idle[2] = {
    [0] = {
        .pFrame = sSecurityPadMonitorOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadMonitorOam_ArmExtending[6] = {
    [0] = {
        .pFrame = sSecurityPadMonitorOam_Idle_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSecurityPadMonitorOam_ArmExtending_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSecurityPadMonitorOam_ArmExtending_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSecurityPadMonitorOam_ArmExtending_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sSecurityPadMonitorOam_ArmExtending_Frame4,
        .timer = 8
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadScreenOam_Idle[5] = {
    [0] = {
        .pFrame = sSecurityPadScreenOam_Idle_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSecurityPadScreenOam_Idle_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSecurityPadScreenOam_Idle_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSecurityPadScreenOam_Idle_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadScreenOam_Unlocking[5] = {
    [0] = {
        .pFrame = sSecurityPadScreenOam_Unlocking_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSecurityPadScreenOam_Unlocking_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSecurityPadScreenOam_Unlocking_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSecurityPadScreenOam_Unlocking_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadScreenOam_Inactive[5] = {
    [0] = {
        .pFrame = sSecurityPadScreenOam_Inactive_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sSecurityPadScreenOam_Inactive_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sSecurityPadScreenOam_Inactive_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sSecurityPadScreenOam_Inactive_Frame3,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadMonitorOam_ArmRetracting[6] = {
    [0] = {
        .pFrame = sSecurityPadMonitorOam_ArmRetracting_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sSecurityPadMonitorOam_ArmExtending_Frame4,
        .timer = 6
    },
    [2] = {
        .pFrame = sSecurityPadMonitorOam_ArmExtending_Frame3,
        .timer = 6
    },
    [3] = {
        .pFrame = sSecurityPadMonitorOam_ArmExtending_Frame2,
        .timer = 6
    },
    [4] = {
        .pFrame = sSecurityPadMonitorOam_ArmExtending_Frame1,
        .timer = 6
    },
    [5] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadOam_Pressing[5] = {
    [0] = {
        .pFrame = sSecurityPadOam_Pressing_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sSecurityPadOam_Pressing_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sSecurityPadOam_Pressing_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sSecurityPadOam_Pressing_Frame3,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadOam_Depressing[5] = {
    [0] = {
        .pFrame = sSecurityPadOam_Pressing_Frame3,
        .timer = 6
    },
    [1] = {
        .pFrame = sSecurityPadOam_Pressing_Frame2,
        .timer = 6
    },
    [2] = {
        .pFrame = sSecurityPadOam_Pressing_Frame1,
        .timer = 6
    },
    [3] = {
        .pFrame = sSecurityPadOam_Pressing_Frame0,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadOam_Idle[2] = {
    [0] = {
        .pFrame = sSecurityPadOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadOam_Pressed[2] = {
    [0] = {
        .pFrame = sSecurityPadOam_Pressing_Frame3,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadMonitorOam_ArmExtended[2] = {
    [0] = {
        .pFrame = sSecurityPadMonitorOam_ArmRetracting_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sSecurityPadMonitorOam_2f78bc[2] = {
    [0] = {
        .pFrame = sSecurityPadMonitorOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const u16 sSecurityPad_2f78cc[16 * 16] = INCBIN_U16("data/sprites/security_pad_2f78cc.pal");
