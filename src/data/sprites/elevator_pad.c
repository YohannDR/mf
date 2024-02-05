#include "data/sprites/elevator_pad.h"
#include "macros.h"

const u32 sElevatorPadGfx[512] = INCBIN_U32("data/sprites/elevator_pad.gfx");
const u16 sElevatorPadPal[16 * 1] = INCBIN_U16("data/sprites/elevator_pad.pal");

static const u16 sElevatorPadOam_Idle_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x200
};

static const u16 sElevatorPadOam_Idle_Frame1[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x204
};

static const u16 sElevatorPadOam_Idle_Frame2[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x208
};

static const u16 sElevatorPadOam_Idle_Frame3[OAM_DATA_SIZE(1)] = {
    0x1,
    OBJ_SHAPE_HORIZONTAL | 0xfc, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x20c
};

const struct FrameData sElevatorPadOam_Idle[7] = {
    [0] = {
        .pFrame = sElevatorPadOam_Idle_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sElevatorPadOam_Idle_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sElevatorPadOam_Idle_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sElevatorPadOam_Idle_Frame3,
        .timer = 8
    },
    [4] = {
        .pFrame = sElevatorPadOam_Idle_Frame2,
        .timer = 8
    },
    [5] = {
        .pFrame = sElevatorPadOam_Idle_Frame1,
        .timer = 8
    },
    [6] = FRAME_DATA_TERMINATOR
};
