#include "data/sprites/owtch.h"
#include "macros.h"

const u32 sOwtchGfx[512] = INCBIN_U32("data/sprites/owtch.gfx");
const u16 sOwtchPal[16] = INCBIN_U16("data/sprites/owtch.pal");

static const u16 sOam_378ff0[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x200
};

static const u16 sOam_378ff8[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x202
};

static const u16 sOam_379000[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x204
};

static const u16 sOam_379008[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1fb, OBJ_SPRITE_OAM | 0x212,
    0x1, 0x0, OBJ_SPRITE_OAM | 0x214,
    0xf9, 0xb, OBJ_SPRITE_OAM | 0x234
};

static const u16 sOam_37901c[OAM_DATA_SIZE(3)] = {
    3,
    0xf5, OBJ_SIZE_16x16 | 0x1fb, OBJ_SPRITE_OAM | 0x20f,
    0xfd, 0xb, OBJ_SPRITE_OAM | 0x231,
    0xed, 0x1fb, OBJ_SPRITE_OAM | 0x211
};

static const u16 sOam_379030[OAM_DATA_SIZE(3)] = {
    3,
    0xf7, OBJ_SIZE_16x16 | 0x1fd, OBJ_SPRITE_OAM | 0x20c,
    0xef, 0x5, OBJ_SPRITE_OAM | 0x22e,
    0xf7, 0xd, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sOam_379044[OAM_DATA_SIZE(1)] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x206
};

static const u16 sOam_37904c[OAM_DATA_SIZE(1)] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x208
};

static const u16 sOam_379054[OAM_DATA_SIZE(1)] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x20a
};

static const u16 sOam_37905c[OAM_DATA_SIZE(3)] = {
    3,
    0xef, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x212,
    0xff, 0x1fc, OBJ_SPRITE_OAM | 0x214,
    0xf7, 0x7, OBJ_SPRITE_OAM | 0x234
};

static const u16 sOam_379070[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f6, OBJ_SPRITE_OAM | 0x20f,
    0xf9, 0x6, OBJ_SPRITE_OAM | 0x231,
    0xe9, 0x1f6, OBJ_SPRITE_OAM | 0x211
};

static const u16 sOam_379084[OAM_DATA_SIZE(3)] = {
    3,
    0xf1, OBJ_SIZE_16x16 | 0x1f7, OBJ_SPRITE_OAM | 0x20c,
    0xe9, 0x1ff, OBJ_SPRITE_OAM | 0x22e,
    0xf1, 0x7, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sOam_379098[OAM_DATA_SIZE(3)] = {
    3,
    0xf9, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x20c,
    0xf1, 0x8, OBJ_SPRITE_OAM | 0x22e,
    0xf9, 0x10, OBJ_SPRITE_OAM | 0x20e
};

static const u16 sOam_3790ac[OAM_DATA_SIZE(3)] = {
    3,
    0xf9, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x20f,
    0x1, 0x10, OBJ_SPRITE_OAM | 0x231,
    0xf1, 0x0, OBJ_SPRITE_OAM | 0x211
};

static const u16 sOam_3790c0[OAM_DATA_SIZE(3)] = {
    3,
    0xf7, OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x212,
    0x7, 0x5, OBJ_SPRITE_OAM | 0x214,
    0xff, 0x10, OBJ_SPRITE_OAM | 0x234
};

const struct FrameData sFrameData_3790d4[4] = {
    [0] = {
        .pFrame = sOam_378ff0,
        .timer = 8,
    },
    [1] = {
        .pFrame = sOam_378ff8,
        .timer = 8,
    },
    [2] = {
        .pFrame = sOam_379000,
        .timer = 8,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3790f4[4] = {
    [0] = {
        .pFrame = sOam_378ff0,
        .timer = 6,
    },
    [1] = {
        .pFrame = sOam_378ff8,
        .timer = 6,
    },
    [2] = {
        .pFrame = sOam_379000,
        .timer = 6,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379114[4] = {
    [0] = {
        .pFrame = sOam_379008,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_37901c,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_379030,
        .timer = 2,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379134[4] = {
    [0] = {
        .pFrame = sOam_379030,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_37901c,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_379008,
        .timer = 2,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379154[4] = {
    [0] = {
        .pFrame = sOam_379044,
        .timer = 8,
    },
    [1] = {
        .pFrame = sOam_37904c,
        .timer = 8,
    },
    [2] = {
        .pFrame = sOam_379054,
        .timer = 8,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379174[4] = {
    [0] = {
        .pFrame = sOam_379044,
        .timer = 6,
    },
    [1] = {
        .pFrame = sOam_37904c,
        .timer = 6,
    },
    [2] = {
        .pFrame = sOam_379054,
        .timer = 6,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_379194[4] = {
    [0] = {
        .pFrame = sOam_37905c,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_379070,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_379084,
        .timer = 2,
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3791b4[4] = {
    [0] = {
        .pFrame = sOam_379098,
        .timer = 2,
    },
    [1] = {
        .pFrame = sOam_3790ac,
        .timer = 2,
    },
    [2] = {
        .pFrame = sOam_3790c0,
        .timer = 2,
    },
    [3] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_3791d4_3bdebc[] = INCBIN_U8("data/Blob_3791d4_3bdebc.bin");
