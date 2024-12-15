#include "data/sprites/shake_trigger.h"

static const u16 sShakeTriggerOam_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xc7
};

static const u16 sShakeTriggerOam_Frame1[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_3 | 0xc9
};

const struct FrameData sShakeTriggerOam_TriggeredNotRestrictedLab[3] = {
    [0] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 30
    },
    [1] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 30
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sShakeTriggerOam_Idle[2] = {
    [0] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sShakeTriggerOam_TriggeredRestrictedLab[49] = {
    [0] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 4
    },
    [3] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [4] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [5] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 4
    },
    [6] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [7] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [8] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 16
    },
    [9] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [10] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [11] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 4
    },
    [12] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [13] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [14] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 8
    },
    [15] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [16] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [17] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 4
    },
    [18] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [19] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [20] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 4
    },
    [21] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [22] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [23] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 4
    },
    [24] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [25] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [26] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 4
    },
    [27] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [28] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [29] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 24
    },
    [30] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [31] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [32] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 16
    },
    [33] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [34] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [35] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 4
    },
    [36] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [37] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [38] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 24
    },
    [39] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [40] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [41] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 8
    },
    [42] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [43] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [44] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 20
    },
    [45] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 2
    },
    [46] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 2
    },
    [47] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 8
    },
    [48] = FRAME_DATA_TERMINATOR
};

const struct FrameData sContinualXSpawnerGoldEnemyDoorLockOam[3] = {
    [0] = {
        .pFrame = sShakeTriggerOam_Frame0,
        .timer = 1
    },
    [1] = {
        .pFrame = sShakeTriggerOam_Frame1,
        .timer = 1
    },
    [2] = FRAME_DATA_TERMINATOR
};
