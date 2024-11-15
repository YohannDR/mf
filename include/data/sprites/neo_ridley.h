#ifndef NEO_RIDLEY_DATA_H
#define NEO_RIDLEY_DATA_H

#include "types.h"
#include "oam.h"

#include "structs/sprite.h"

enum RidleyOam {
    RIDLEY_PART_OAM_3AF270,
    RIDLEY_PART_OAM_3AF298,
    RIDLEY_PART_OAM_3AF318,
    RIDLEY_PART_OAM_3AF330,
    RIDLEY_PART_OAM_3AF348,
    RIDLEY_PART_OAM_3AF360,
    RIDLEY_PART_OAM_3AF420,
    RIDLEY_PART_OAM_3AF430,
    RIDLEY_PART_OAM_3AF440,
    RIDLEY_PART_OAM_3AF450,
    RIDLEY_PART_OAM_3AF468,
    RIDLEY_PART_OAM_3AF480,
    RIDLEY_PART_OAM_3AF498,
    RIDLEY_PART_OAM_3AF4A8,
    RIDLEY_PART_OAM_3AF4B8,
    RIDLEY_PART_OAM_3AF4C8,
    RIDLEY_PART_OAM_3AF528,
    RIDLEY_PART_OAM_3AF588,
    RIDLEY_PART_OAM_3AF5E8,
    RIDLEY_PART_OAM_3AF648,
    RIDLEY_PART_OAM_3AF670,
    RIDLEY_PART_OAM_3AF698,
    RIDLEY_PART_OAM_3AF6D8,
    RIDLEY_PART_OAM_3AF718,
    RIDLEY_PART_OAM_3AF750,
    RIDLEY_PART_OAM_3AF788,
    RIDLEY_PART_OAM_3AF798,
    RIDLEY_PART_OAM_3AF7D0,
    RIDLEY_PART_OAM_3AF7F0,
    RIDLEY_PART_OAM_3AF800,
    RIDLEY_PART_OAM_3AF810,

    RIDLEY_OAM_END
};

enum RidleyPart {
    RIDLEY_PART_FRONT_WING,
    RIDLEY_PART_TAIL_START,
    RIDLEY_PART_BODY,
    RIDLEY_PART_BACK_WING,

    RIDLEY_PART_END
};

enum RidleyTailPart {
    RIDLEY_TAIL_PART_0,
    RIDLEY_TAIL_PART_1,
    RIDLEY_TAIL_PART_2,
    RIDLEY_TAIL_PART_3,
    RIDLEY_TAIL_PART_4,
    RIDLEY_TAIL_PART_5,
    RIDLEY_TAIL_PART_6,
    RIDLEY_TAIL_PART_TIP,

    RIDLEY_TAIL_PART_END
};

extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9944[5];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a996c[5];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9994[16];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9a14[3];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9a2c[3];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9a44[3];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9a5c[24];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9b1c[16];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9b9c[16];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9c1c[11];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9c74[13];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9cdc[13];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9d44[22];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9df4[14];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9e64[11];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9ebc[17];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9f44[6];
extern const struct MultiSpriteData sRidleyMultiSpriteData_3a9f74[5];

extern const s16 sRidleyRisingAfterSpawnSpeed[12];
extern const s16 sArray_3a9fb4[12];
extern const s16 sArray_3a9fcc[32];

extern const u32 sRidleyGfx[512 * 8];
extern const u16 sRidleyPal[16 * 8];

extern const struct FrameData sRidleyPartOam_3af270[5];
extern const struct FrameData sRidleyPartOam_3af298[16];
extern const struct FrameData sRidleyPartOam_3af318[3];
extern const struct FrameData sRidleyPartOam_3af330[3];
extern const struct FrameData sRidleyPartOam_3af348[3];
extern const struct FrameData sRidleyPartOam_3af360[24];
extern const struct FrameData sRidleyPartOam_3af420[2];
extern const struct FrameData sRidleyPartOam_3af430[2];
extern const struct FrameData sRidleyPartOam_3af440[2];
extern const struct FrameData sRidleyPartOam_3af450[3];
extern const struct FrameData sRidleyPartOam_3af468[3];
extern const struct FrameData sRidleyPartOam_3af480[3];
extern const struct FrameData sRidleyPartOam_3af498[2];
extern const struct FrameData sRidleyPartOam_TailSegment[2];
extern const struct FrameData sRidleyPartOam_TailTip[2];
extern const struct FrameData sRidleyPartOam_3af4c8[12];
extern const struct FrameData sRidleyPartOam_3af528[12];
extern const struct FrameData sRidleyPartOam_3af588[12];
extern const struct FrameData sRidleyPartOam_3af5e8[12];
extern const struct FrameData sRidleyPartOam_3af648[5];
extern const struct FrameData sRidleyPartOam_3af670[5];
extern const struct FrameData sRidleyPartOam_3af698[8];
extern const struct FrameData sRidleyPartOam_3af6d8[8];
extern const struct FrameData sRidleyPartOam_3af718[7];
extern const struct FrameData sRidleyPartOam_3af750[7];
extern const struct FrameData sRidleyPartOam_3af788[2];
extern const struct FrameData sRidleyPartOam_3af798[7];
extern const struct FrameData sRidleyPartOam_3af7d0[4];
extern const struct FrameData sRidleyFireballOam_Big[2];
extern const struct FrameData sRidleyPartOam_3af800[2];
extern const struct FrameData sRidleyPartOam_3af810[5];

#endif /* NEO_RIDLEY_DATA_H */
