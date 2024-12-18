#include "data/samus_data.h"

const u8 sSamusGfx_Empty[2] = {
    0, 0
};

const u16 sSamusOam_Empty[1] = {
    0
};

const struct ArmCannonOffset sArmCannonOffset_Empty = {
    .x = 0,
    .y = 0
};

static const u8 sBlob_289994_28fd04[] = INCBIN_U8("data/Blob_289994_28fd04.bin");

const SamusSetPose_T sSamusSetPoseFunctionPointer[1] = {
    (SamusSetPose_T)0x8008fa1
};

static const u8 sBlob_28fd08_28ff60[] = INCBIN_U8("data/Blob_28fd08_28ff60.bin");
