#ifndef BOX_2_DATA_H
#define BOX_2_DATA_H

#include "macros.h"
#include "oam.h"

#include "structs/sprite.h"

enum Box2Oam {
    Box2Oam_395348,
    Box2Oam_3953c8,
    Box2Oam_395400,
    Box2Oam_395410,
    Box2Oam_395420,
    Box2Oam_395430,
    Box2Oam_395440,
    Box2Oam_395450,
    Box2Oam_395460,
    Box2Oam_395470,
    Box2Oam_395480,
    Box2Oam_395490,
    Box2Oam_3954a0,
    Box2Oam_3954b0,
    Box2Oam_395530,
    Box2Oam_395568,
    Box2Oam_395578,
    Box2Oam_395588,
    Box2Oam_395598,
    Box2Oam_3955a8,
    Box2Oam_3955b8,
    Box2Oam_3955c8,
    Box2Oam_3955d8,
    Box2Oam_3955e8,
    Box2Oam_3955f8,
    Box2Oam_395608,
    Box2Oam_395618,
    Box2Oam_395628,
    Box2Oam_395638,
    Box2Oam_395648,
    Box2Oam_395658,
    Box2Oam_3956b8,
    Box2Oam_3956f0,
    Box2Oam_395718,
    Box2Oam_395728,
    Box2Oam_395758,
    Box2Oam_395778,
    Box2Oam_395798,
    Box2Oam_3957a8,
    Box2Oam_3957b8,
    Box2Oam_3957c8,
    Box2Oam_3957d8,
    Box2Oam_3957e8,
    Box2Oam_395808,
    Box2Oam_395868,
    Box2Oam_3958c8,

    BOX_2_OAM_END
};

enum Box2Part {
    BOX_2_PART_FRONT_LEFT_LEG_COVER,
    BOX_2_PART_FRONT_LEFT_LEG,
    BOX_2_PART_FRONT_RIGHT_LEG_COVER,
    BOX_2_PART_FRONT_RIGHT_LEG,
    BOX_2_PART_MIDDLE_LEFT_LEG,
    BOX_2_PART_MIDDLE_RIGHT_LEG,
    BOX_2_PART_CENTER,
    BOX_2_PART_BRAIN,
    BOX_2_PART_CENTER_BOTTOM,
    BOX_2_PART_LAUNCHER,
    BOX_2_PART_BACK_LEFT_LEG,
    BOX_2_PART_BACK_RIGHT_LEG,

    BOX_2_PART_END
};

extern const s16 sBox2JumpingSpeed[28];
extern const s16 sBox2BonkingSpeed[20];
extern const s16 sBox2BrainFloatingMovement[65];

extern const struct MultiSpriteData sBox2MultiSpriteData_391214[2];
extern const struct MultiSpriteData sBox2MultiSpriteData_391224[4];
extern const struct MultiSpriteData sBox2MultiSpriteData_391244[5];
extern const struct MultiSpriteData sBox2MultiSpriteData_39126c[5];
extern const struct MultiSpriteData sBox2MultiSpriteData_391294[6];
extern const struct MultiSpriteData sBox2MultiSpriteData_3912c4[6];
extern const struct MultiSpriteData sBox2MultiSpriteData_3912f4[6];
extern const struct MultiSpriteData sBox2MultiSpriteData_391324[6];
extern const struct MultiSpriteData sBox2MultiSpriteData_391354[6];
extern const struct MultiSpriteData sBox2MultiSpriteData_391384[6];
extern const struct MultiSpriteData sBox2MultiSpriteData_3913b4[5];
extern const struct MultiSpriteData sBox2MultiSpriteData_3913dc[9];
extern const struct MultiSpriteData sBox2MultiSpriteData_391424[2];
extern const struct MultiSpriteData sBox2MultiSpriteData_391434[2];
extern const struct MultiSpriteData sBox2MultiSpriteData_391444[2];
extern const struct MultiSpriteData sBox2MultiSpriteData_391454[2];
extern const struct MultiSpriteData sBox2MultiSpriteData_391464[8];
extern const struct MultiSpriteData sBox2MultiSpriteData_3914a4[13];
extern const struct MultiSpriteData sBox2MultiSpriteData_39150c[9];

extern const u32 sBox2Gfx[7 * 512];
extern const u16 sBox2Pal[7 * 16];

extern const struct FrameData sBox2Oam_395348[16];
extern const struct FrameData sBox2Oam_3953c8[7];
extern const struct FrameData sBox2Oam_395400[2];
extern const struct FrameData sBox2Oam_395410[2];
extern const struct FrameData sBox2Oam_395420[2];
extern const struct FrameData sBox2Oam_395430[2];
extern const struct FrameData sBox2Oam_395440[2];
extern const struct FrameData sBox2Oam_395450[2];
extern const struct FrameData sBox2Oam_395460[2];
extern const struct FrameData sBox2Oam_395470[2];
extern const struct FrameData sBox2Oam_395480[2];
extern const struct FrameData sBox2Oam_395490[2];
extern const struct FrameData sBox2Oam_3954a0[2];
extern const struct FrameData sBox2Oam_3954b0[16];
extern const struct FrameData sBox2Oam_395530[7];
extern const struct FrameData sBox2Oam_395568[2];
extern const struct FrameData sBox2Oam_395578[2];
extern const struct FrameData sBox2Oam_395588[2];
extern const struct FrameData sBox2Oam_395598[2];
extern const struct FrameData sBox2Oam_3955a8[2];
extern const struct FrameData sBox2Oam_3955b8[2];
extern const struct FrameData sBox2Oam_3955c8[2];
extern const struct FrameData sBox2Oam_3955d8[2];
extern const struct FrameData sBox2Oam_3955e8[2];
extern const struct FrameData sBox2Oam_3955f8[2];
extern const struct FrameData sBox2Oam_395608[2];
extern const struct FrameData sBox2Oam_395618[2];
extern const struct FrameData sBox2Oam_395628[2];
extern const struct FrameData sBox2Oam_395638[2];
extern const struct FrameData sBox2Oam_395648[2];
extern const struct FrameData sBox2Oam_395658[12];
extern const struct FrameData sBox2Oam_3956b8[7];
extern const struct FrameData sBox2Oam_3956f0[5];
extern const struct FrameData sBox2Oam_395718[2];
extern const struct FrameData sBox2Oam_395728[6];
extern const struct FrameData sBox2Oam_395758[4];
extern const struct FrameData sBox2Oam_395778[4];
extern const struct FrameData sBox2Oam_395798[2];
extern const struct FrameData sBox2Oam_3957a8[2];
extern const struct FrameData sBox2Oam_3957b8[2];
extern const struct FrameData sBox2Oam_3957c8[2];
extern const struct FrameData sBox2Oam_3957d8[2];
extern const struct FrameData sBox2Oam_3957e8[4];
extern const struct FrameData sBox2Oam_395808[12];
extern const struct FrameData sBox2Oam_395868[12];
extern const struct FrameData sBox2Oam_3958c8[2];
extern const struct FrameData sBox2Oam_3958d8[5];

#endif /* BOX_2_DATA_H */
