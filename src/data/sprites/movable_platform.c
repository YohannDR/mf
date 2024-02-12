#include "data/sprites/movable_platform.h"
#include "macros.h"

const u32 sMovablePlatformGfx[512] = INCBIN_U32("data/sprites/movable_platform.gfx");
const u16 sMovablePlatformPal[16 * 1] = INCBIN_U16("data/sprites/movable_platform.pal");

static const u16 sMovablePlatformOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x200
};

const struct FrameData sMovablePlatformOam_Idle[2] = {
    [0] = {
        .pFrame = sMovablePlatformOam_Idle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

static const u8 sBlob_2edb20_363d4c[] = INCBIN_U8("data/Blob_2edb20_363d4c.bin");
