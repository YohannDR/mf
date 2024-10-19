#include "data/sprites/owtch.h"
#include "macros.h"

const u32 sOwtchGfx[512] = INCBIN_U32("data/sprites/owtch.gfx");
const u16 sOwtchPal[16] = INCBIN_U16("data/sprites/owtch.pal");

static const u16 sFrameData_3790d4_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sFrameData_3790d4_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202
};

static const u16 sFrameData_3790d4_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sFrameData_379114_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x212,
    0x1, 0x0, OBJ_PALETTE_8 | 0x214,
    0xf9, 0xb, OBJ_PALETTE_8 | 0x234
};

static const u16 sFrameData_379114_Frame1[OAM_DATA_SIZE(3)] = {
    3,
    0xf5, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x20f,
    0xfd, 0xb, OBJ_PALETTE_8 | 0x231,
    0xed, 0x1fb, OBJ_PALETTE_8 | 0x211
};

static const u16 sFrameData_379114_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    0xf7, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x20c,
    0xef, 0x5, OBJ_PALETTE_8 | 0x22e,
    0xf7, 0xd, OBJ_PALETTE_8 | 0x20e
};

static const u16 sFrameData_379154_Frame0[OAM_DATA_SIZE(1)] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x206
};

static const u16 sFrameData_379154_Frame1[OAM_DATA_SIZE(1)] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208
};

static const u16 sFrameData_379154_Frame2[OAM_DATA_SIZE(1)] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20a
};

static const u16 sFrameData_379194_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    0xef, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x212,
    0xff, 0x1fc, OBJ_PALETTE_8 | 0x214,
    0xf7, 0x7, OBJ_PALETTE_8 | 0x234
};

static const u16 sFrameData_379194_Frame1[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x20f,
    0xf9, 0x6, OBJ_PALETTE_8 | 0x231,
    0xe9, 0x1f6, OBJ_PALETTE_8 | 0x211
};

static const u16 sFrameData_379194_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x20c,
    0xe9, 0x1ff, OBJ_PALETTE_8 | 0x22e,
    0xf1, 0x7, OBJ_PALETTE_8 | 0x20e
};

static const u16 sFrameData_3791b4_Frame0[OAM_DATA_SIZE(3)] = {
    3,
    0xf9, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20c,
    0xf1, 0x8, OBJ_PALETTE_8 | 0x22e,
    0xf9, 0x10, OBJ_PALETTE_8 | 0x20e
};

static const u16 sFrameData_3791b4_Frame1[OAM_DATA_SIZE(3)] = {
    3,
    0xf9, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x20f,
    0x1, 0x10, OBJ_PALETTE_8 | 0x231,
    0xf1, 0x0, OBJ_PALETTE_8 | 0x211
};

static const u16 sFrameData_3791b4_Frame2[OAM_DATA_SIZE(3)] = {
    3,
    0xf7, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x212,
    0x7, 0x5, OBJ_PALETTE_8 | 0x214,
    0xff, 0x10, OBJ_PALETTE_8 | 0x234
};

const struct FrameData sFrameData_3790d4[4] = {
    [0] = {
        .pFrame = sFrameData_3790d4_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFrameData_3790d4_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sFrameData_3790d4_Frame2,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3790f4[4] = {
    [0] = {
        .pFrame = sFrameData_3790d4_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_3790d4_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_3790d4_Frame2,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379114[4] = {
    [0] = {
        .pFrame = sFrameData_379114_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_379114_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_379114_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379134[4] = {
    [0] = {
        .pFrame = sFrameData_379114_Frame2,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_379114_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_379114_Frame0,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379154[4] = {
    [0] = {
        .pFrame = sFrameData_379154_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sFrameData_379154_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sFrameData_379154_Frame2,
        .timer = 8
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379174[4] = {
    [0] = {
        .pFrame = sFrameData_379154_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_379154_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_379154_Frame2,
        .timer = 6
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379194[4] = {
    [0] = {
        .pFrame = sFrameData_379194_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_379194_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_379194_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3791b4[4] = {
    [0] = {
        .pFrame = sFrameData_3791b4_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3791b4_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3791b4_Frame2,
        .timer = 2
    },
    [3] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_3791d4_3b0b04[] = INCBIN_U8("data/Blob_3791d4_3b0b04.bin");
