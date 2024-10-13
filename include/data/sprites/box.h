#ifndef BOX_DATA_H
#define BOX_DATA_H

#include "types.h"
#include "oam.h"

#include "structs/sprite.h"

enum BoxOam {
    FRAMEDATA_3479A8,
    FRAMEDATA_3479B8,
    FRAMEDATA_3479F0,
    FRAMEDATA_347A00,
    FRAMEDATA_347A10,
    FRAMEDATA_347A20,
    FRAMEDATA_347A30,
    FRAMEDATA_347A40,
    FRAMEDATA_347A50,
    FRAMEDATA_347A60,
    FRAMEDATA_347A70,
    FRAMEDATA_347A80,
    FRAMEDATA_347A90,
    FRAMEDATA_347AA0,
    FRAMEDATA_347AB0,
    FRAMEDATA_347AE8,
    FRAMEDATA_347AF8,
    FRAMEDATA_347B08,
    FRAMEDATA_347B18,
    FRAMEDATA_347B28,
    FRAMEDATA_347B38,
    FRAMEDATA_347B48,
    FRAMEDATA_347B58,
    FRAMEDATA_347B68,
    FRAMEDATA_347B78,
    FRAMEDATA_347B88,
    FRAMEDATA_347B98,
    FRAMEDATA_347BA8,
    FRAMEDATA_347BB8,
    FRAMEDATA_347BC8,
    FRAMEDATA_347BD8,
    FRAMEDATA_347C38,
    FRAMEDATA_347C70,
    FRAMEDATA_347C98,
    FRAMEDATA_347CA8,
    FRAMEDATA_347CD8,
    FRAMEDATA_347CF8,
    FRAMEDATA_347D18,
    FRAMEDATA_347D28,
    FRAMEDATA_347D38,
    FRAMEDATA_347D48,
    FRAMEDATA_347D58,
    FRAMEDATA_347D68,
    FRAMEDATA_347D88,
    FRAMEDATA_347E58,
    FRAMEDATA_347E80,
    FRAMEDATA_347FA8,
    FRAMEDATA_347FB8,
    FRAMEDATA_347FC8,
    FRAMEDATA_347FD8,
    FRAMEDATA_347FE8,
    FRAMEDATA_347FF8,
    FRAMEDATA_348008,
    FRAMEDATA_348018,
    FRAMEDATA_348028,
    FRAMEDATA_348038,
    FRAMEDATA_348048,
    FRAMEDATA_3480A8,

    BOX_OAM_END
};

enum BoxPart {
    BOX_PART_FRONT_LEFT_LEG_COVER,
    BOX_PART_FRONT_LEFT_LEG,
    BOX_PART_FRONT_RIGHT_LEG_COVER,
    BOX_PART_FRONT_RIGHT_LEG,
    BOX_PART_MIDDLE_LEFT_LEG,
    BOX_PART_MIDDLE_RIGHT_LEG,
    BOX_PART_COVER,
    BOX_PART_BRAIN,
    BOX_PART_CENTER_BOTTOM,
    BOX_PART_LAUNCHER,
    BOX_PART_BACK_LEFT_LEG,
    BOX_PART_BACK_RIGHT_LEG,

    BOX_PART_END
};

extern const s16 sBoxFirstJumpSpeed[24];
extern const s16 sBoxJumpingSpeed[20];
extern const s16 sBoxBonkingSpeed[20];
extern const s16 sBoxBombSecondBounceSpeed[5];
extern const s16 sBoxBombFirstBounceSpeed[6];
extern const s16 sBoxBombLaunchingSpeed[11];
extern const s16 sBoxBombFallingSpeed[16];

extern const struct MultiSpriteData sMultiSpriteData_342d98[2];
extern const struct MultiSpriteData sMultiSpriteData_342da8[4];
extern const struct MultiSpriteData sMultiSpriteData_342dc8[5];
extern const struct MultiSpriteData sMultiSpriteData_342df0[5];
extern const struct MultiSpriteData sMultiSpriteData_342e18[6];
extern const struct MultiSpriteData sMultiSpriteData_342e48[6];
extern const struct MultiSpriteData sMultiSpriteData_342e78[6];
extern const struct MultiSpriteData sMultiSpriteData_342ea8[6];
extern const struct MultiSpriteData sMultiSpriteData_342ed8[6];
extern const struct MultiSpriteData sMultiSpriteData_342f08[6];
extern const struct MultiSpriteData sMultiSpriteData_342f38[5];
extern const struct MultiSpriteData sMultiSpriteData_342f60[9];
extern const struct MultiSpriteData sMultiSpriteData_342fa8[2];
extern const struct MultiSpriteData sMultiSpriteData_342fb8[2];
extern const struct MultiSpriteData sMultiSpriteData_342fc8[2];
extern const struct MultiSpriteData sMultiSpriteData_342fd8[2];
extern const struct MultiSpriteData sMultiSpriteData_342fe8[8];
extern const struct MultiSpriteData sMultiSpriteData_343028[4];
extern const struct MultiSpriteData sMultiSpriteData_343048[9];

extern const u32 sBoxGfx[512 * 8];
extern const u16 sBoxPal[16 * 8];

extern const struct FrameData sFrameData_3479a8[2];
extern const struct FrameData sFrameData_3479b8[7];
extern const struct FrameData sFrameData_3479f0[2];
extern const struct FrameData sFrameData_347a00[2];
extern const struct FrameData sFrameData_347a10[2];
extern const struct FrameData sFrameData_347a20[2];
extern const struct FrameData sFrameData_347a30[2];
extern const struct FrameData sFrameData_347a40[2];
extern const struct FrameData sFrameData_347a50[2];
extern const struct FrameData sFrameData_347a60[2];
extern const struct FrameData sFrameData_347a70[2];
extern const struct FrameData sFrameData_347a80[2];
extern const struct FrameData sFrameData_347a90[2];
extern const struct FrameData sFrameData_347aa0[2];
extern const struct FrameData sFrameData_347ab0[7];
extern const struct FrameData sFrameData_347ae8[2];
extern const struct FrameData sFrameData_347af8[2];
extern const struct FrameData sFrameData_347b08[2];
extern const struct FrameData sFrameData_347b18[2];
extern const struct FrameData sFrameData_347b28[2];
extern const struct FrameData sFrameData_347b38[2];
extern const struct FrameData sFrameData_347b48[2];
extern const struct FrameData sFrameData_347b58[2];
extern const struct FrameData sFrameData_347b68[2];
extern const struct FrameData sFrameData_347b78[2];
extern const struct FrameData sFrameData_347b88[2];
extern const struct FrameData sFrameData_347b98[2];
extern const struct FrameData sFrameData_347ba8[2];
extern const struct FrameData sFrameData_347bb8[2];
extern const struct FrameData sFrameData_347bc8[2];
extern const struct FrameData sFrameData_347bd8[12];
extern const struct FrameData sFrameData_347c38[7];
extern const struct FrameData sFrameData_347c70[5];
extern const struct FrameData sFrameData_347c98[2];
extern const struct FrameData sFrameData_347ca8[6];
extern const struct FrameData sFrameData_347cd8[4];
extern const struct FrameData sFrameData_347cf8[4];
extern const struct FrameData sFrameData_347d18[2];
extern const struct FrameData sFrameData_347d28[2];
extern const struct FrameData sFrameData_347d38[2];
extern const struct FrameData sFrameData_347d48[2];
extern const struct FrameData sFrameData_347d58[2];
extern const struct FrameData sFrameData_347d68[4];
extern const struct FrameData sFrameData_347d88[26];
extern const struct FrameData sFrameData_347e58[5];
extern const struct FrameData sFrameData_347e80[37];
extern const struct FrameData sFrameData_347fa8[2];
extern const struct FrameData sFrameData_347fb8[2];
extern const struct FrameData sFrameData_347fc8[2];
extern const struct FrameData sFrameData_347fd8[2];
extern const struct FrameData sFrameData_347fe8[2];
extern const struct FrameData sFrameData_347ff8[2];
extern const struct FrameData sFrameData_348008[2];
extern const struct FrameData sFrameData_348018[2];
extern const struct FrameData sFrameData_348028[2];
extern const struct FrameData sFrameData_348038[2];
extern const struct FrameData sFrameData_348048[12];
extern const struct FrameData sFrameData_3480a8[4];

#endif /* BOX_DATA_H */
