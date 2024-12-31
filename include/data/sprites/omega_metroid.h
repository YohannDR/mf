#ifndef OMEGA_METROID_DATA_H
#define OMEGA_METROID_DATA_H

#include "macros.h"
#include "oam.h"

#include "structs/sprite.h"

enum OmegaMetroidOam {
    OmegaMetroidPartOam_39a204,
    OmegaMetroidPartOam_39a22c,
    OmegaMetroidPartOam_39a254,
    OmegaMetroidPartOam_39a26c,
    OmegaMetroidPartOam_39a284,
    OmegaMetroidPartOam_39a29c,
    OmegaMetroidPartOam_39a2b4,
    OmegaMetroidPartOam_39a2d4,
    OmegaMetroidPartOam_39a2f4,
    OmegaMetroidPartOam_39a324,
    OmegaMetroidPartOam_39a354,
    OmegaMetroidPartOam_39a37c,
    OmegaMetroidPartOam_39a3a4,
    OmegaMetroidPartOam_39a3dc,
    OmegaMetroidPartOam_39a414,
    OmegaMetroidPartOam_39a424,
    OmegaMetroidPartOam_39a44c,
    OmegaMetroidPartOam_39a49c,
    OmegaMetroidPartOam_39a514,
    OmegaMetroidPartOam_39a524,
    OmegaMetroidPartOam_39a59c,
    OmegaMetroidPartOam_39a5dc,
    OmegaMetroidPartOam_39a634,
    OmegaMetroidPartOam_39a68c,
    OmegaMetroidPartOam_39a6a4,
    OmegaMetroidPartOam_39a6bc,
    OmegaMetroidPartOam_39a6cc,
    OmegaMetroidPartOam_39a6dc,
    OmegaMetroidPartOam_39a734,
    OmegaMetroidPartOam_39a78c,
    OmegaMetroidPartOam_39a7a4,
    OmegaMetroidPartOam_39a7bc,
    OmegaMetroidPartOam_39a7cc,
    OmegaMetroidPartOam_39a7dc,
    OmegaMetroidPartOam_39a7ec,
    OmegaMetroidPartOam_39a7fc,
    OmegaMetroidPartOam_39a80c,
    OmegaMetroidPartOam_39a81c,
    OmegaMetroidPartOam_39a82c,
    OmegaMetroidPartOam_39a83c,
    OmegaMetroidPartOam_39a84c,
    OmegaMetroidPartOam_39a85c,
    OmegaMetroidPartOam_39a86c,
    OmegaMetroidPartOam_39a87c,
    OmegaMetroidPartOam_39a8a4,
    OmegaMetroidPartOam_39a8cc,
    OmegaMetroidPartOam_39a8dc,
    OmegaMetroidPartOam_39a904,
    OmegaMetroidPartOam_39a95c,
    OmegaMetroidPartOam_39a9b4,
    OmegaMetroidPartOam_39a9c4,
    OmegaMetroidPartOam_39a9d4,
    OmegaMetroidPartOam_39aa04,

    OMEGA_METROID_OAM_END
};

enum OmegaMetroidPart {
    OMEGA_METROID_PART_0,
    OMEGA_METROID_PART_1,
    OMEGA_METROID_PART_2,
    OMEGA_METROID_PART_3,
    OMEGA_METROID_PART_4,
    OMEGA_METROID_PART_5,
    OMEGA_METROID_PART_6,
    OMEGA_METROID_PART_7,

    OMEGA_METROID_PART_END
};

extern const s16 sOmegaMetroidFirstJumpVelocity[36];
extern const s16 sOmegaMetroidJumpVelocity[24];
extern const s16 sOmegaMetroidFallVelocity[12];
extern const s16 sOmegaMetroidVerticalJumpVelocity[16];
extern const s16 sOmegaMetroid_3959b0[28];
extern const s16 sOmegaMetroid_3959e8[16];

extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_3965d8[5];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396600[5];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396628[7];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396660[5];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396688[3];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_3966a0[3];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_3966b8[4];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_3966d8[6];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396708[5];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396730[5];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396758[11];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_3967b0[3];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_3967c8[2];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_3967d8[11];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396830[3];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396848[2];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396858[3];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396870[5];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396898[3];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_3968b0[11];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396908[2];
extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_396918[6];

extern const u32 sOmegaMetroidGfx[5 * 512];
extern const u16 sOmegaMetroidPal[5 * 16];

extern const struct FrameData sOmegaMetroidPartOam_39a204[5];
extern const struct FrameData sOmegaMetroidPartOam_39a22c[5];
extern const struct FrameData sOmegaMetroidPartOam_39a254[3];
extern const struct FrameData sOmegaMetroidPartOam_39a26c[3];
extern const struct FrameData sOmegaMetroidPartOam_39a284[3];
extern const struct FrameData sOmegaMetroidPartOam_39a29c[3];
extern const struct FrameData sOmegaMetroidPartOam_39a2b4[4];
extern const struct FrameData sOmegaMetroidPartOam_39a2d4[4];
extern const struct FrameData sOmegaMetroidPartOam_39a2f4[6];
extern const struct FrameData sOmegaMetroidPartOam_39a324[6];
extern const struct FrameData sOmegaMetroidPartOam_39a354[5];
extern const struct FrameData sOmegaMetroidPartOam_39a37c[5];
extern const struct FrameData sOmegaMetroidPartOam_39a3a4[7];
extern const struct FrameData sOmegaMetroidPartOam_39a3dc[7];
extern const struct FrameData sOmegaMetroidPartOam_39a414[2];
extern const struct FrameData sOmegaMetroidPartOam_39a424[5];
extern const struct FrameData sOmegaMetroidPartOam_39a44c[10];
extern const struct FrameData sOmegaMetroidPartOam_39a49c[15];
extern const struct FrameData sOmegaMetroidPartOam_39a514[2];
extern const struct FrameData sOmegaMetroidPartOam_39a524[15];
extern const struct FrameData sOmegaMetroidPartOam_39a59c[8];
extern const struct FrameData sOmegaMetroidPartOam_39a5dc[11];
extern const struct FrameData sOmegaMetroidPartOam_39a634[11];
extern const struct FrameData sOmegaMetroidPartOam_39a68c[3];
extern const struct FrameData sOmegaMetroidPartOam_39a6a4[3];
extern const struct FrameData sOmegaMetroidPartOam_39a6bc[2];
extern const struct FrameData sOmegaMetroidPartOam_39a6cc[2];
extern const struct FrameData sOmegaMetroidPartOam_39a6dc[11];
extern const struct FrameData sOmegaMetroidPartOam_39a734[11];
extern const struct FrameData sOmegaMetroidPartOam_39a78c[3];
extern const struct FrameData sOmegaMetroidPartOam_39a7a4[3];
extern const struct FrameData sOmegaMetroidPartOam_39a7bc[2];
extern const struct FrameData sOmegaMetroidPartOam_39a7cc[2];
extern const struct FrameData sOmegaMetroidPartOam_39a7dc[2];
extern const struct FrameData sOmegaMetroidPartOam_39a7ec[2];
extern const struct FrameData sOmegaMetroidPartOam_39a7fc[2];
extern const struct FrameData sOmegaMetroidPartOam_39a80c[2];
extern const struct FrameData sOmegaMetroidPartOam_39a81c[2];
extern const struct FrameData sOmegaMetroidPartOam_39a82c[2];
extern const struct FrameData sOmegaMetroidPartOam_39a83c[2];
extern const struct FrameData sOmegaMetroidPartOam_39a84c[2];
extern const struct FrameData sOmegaMetroidPartOam_39a85c[2];
extern const struct FrameData sOmegaMetroidPartOam_39a86c[2];
extern const struct FrameData sOmegaMetroidPartOam_39a87c[5];
extern const struct FrameData sOmegaMetroidPartOam_39a8a4[5];
extern const struct FrameData sOmegaMetroidPartOam_39a8cc[2];
extern const struct FrameData sOmegaMetroidPartOam_39a8dc[5];
extern const struct FrameData sOmegaMetroidPartOam_39a904[11];
extern const struct FrameData sOmegaMetroidPartOam_39a95c[11];
extern const struct FrameData sOmegaMetroidPartOam_39a9b4[2];
extern const struct FrameData sOmegaMetroidPartOam_39a9c4[2];
extern const struct FrameData sOmegaMetroidPartOam_39a9d4[6];
extern const struct FrameData sOmegaMetroidPartOam_39aa04[6];

#endif /* OMEGA_METROID_DATA_H */
