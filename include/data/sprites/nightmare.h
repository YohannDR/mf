#ifndef NIGHTMARE_DATA_H
#define NIGHTMARE_DATA_H

#include "types.h"
#include "oam.h"

#include "structs/sprite.h"

enum NightmareOam {
    FRAMEDATA_3BD4DC,
    FRAMEDATA_3BD4EC,
    FRAMEDATA_3BD51C,
    FRAMEDATA_3BD574,
    FRAMEDATA_3BD59C,
    FRAMEDATA_3BD5AC,
    FRAMEDATA_3BD5D4,
    FRAMEDATA_3BD5FC,
    FRAMEDATA_3BD654,
    FRAMEDATA_3BD67C,
    FRAMEDATA_3BD6D4,
    FRAMEDATA_3BD6FC,
    FRAMEDATA_3BD754,
    FRAMEDATA_3BD76C,
    FRAMEDATA_3BD784,
    FRAMEDATA_3BD794,
    FRAMEDATA_3BD7A4,
    FRAMEDATA_3BD7C4,
    FRAMEDATA_3BD7E4,
    FRAMEDATA_3BD804,
    FRAMEDATA_3BD824,
    FRAMEDATA_3BD844,
    FRAMEDATA_3BD864,
    FRAMEDATA_3BD874,
    FRAMEDATA_3BD884,
    FRAMEDATA_3BD894,
    FRAMEDATA_3BD8A4,
    FRAMEDATA_3BD8B4,
    FRAMEDATA_3BD8C4,
    FRAMEDATA_3BD8D4,
    FRAMEDATA_3BD8E4,
    FRAMEDATA_3BD95C,
    FRAMEDATA_3BD9D4,
    FRAMEDATA_3BDA4C,
    FRAMEDATA_3BDAC4,
    FRAMEDATA_3BDB3C,
    FRAMEDATA_3BDBB4,
    FRAMEDATA_3BDBC4,

    NIGHTMARE_OAM_END
};

enum NightmarePart {
    NIGHTMARE_PART_CHIN_SLUDGE,
    NIGHTMARE_PART_EYE_SLUDGE,
    NIGHTMARE_PART_EYE,
    NIGHTMARE_PART_MOUTH,
    NIGHTMARE_PART_RIGHT_ARM_TOP,
    NIGHTMARE_PART_RIGHT_TURRET_1,
    NIGHTMARE_PART_RIGHT_TURRET_2,
    NIGHTMARE_PART_RIGHT_TURRET_3,
    NIGHTMARE_PART_RIGHT_ARM_BOTTOM,
    NIGHTMARE_PART_GENERATOR,
    NIGHTMARE_PART_BODY,
    NIGHTMARE_PART_LEFT_TURRET_1,
    NIGHTMARE_PART_LEFT_TURRET_2,
    NIGHTMARE_PART_LEFT_TURRET_3,

    NIGHTMARE_PART_END
};

extern const s16 sNightmarePhase2XSpeed[13];
extern const s16 sNightmarePhase2YSpeed[32];
extern const u8 sNightmareGeneratorGlowingPaletteRow[8];

extern const struct MultiSpriteData sMultiSpriteData_3b82fc[9];
extern const struct MultiSpriteData sMultiSpriteData_3b8344[3];
extern const struct MultiSpriteData sMultiSpriteData_3b835c[9];
extern const struct MultiSpriteData sMultiSpriteData_3b83a4[3];
extern const struct MultiSpriteData sNightmareMultiOam_Used[9];
extern const struct MultiSpriteData sMultiSpriteData_3b8404[3];
extern const struct MultiSpriteData sMultiSpriteData_3b841c[9];
extern const struct MultiSpriteData sMultiSpriteData_3b8464[9];
extern const struct MultiSpriteData sMultiSpriteData_3b84ac[9];
extern const struct MultiSpriteData sMultiSpriteData_3b84f4[9];
extern const struct MultiSpriteData sMultiSpriteData_3b853c[9];
extern const struct MultiSpriteData sMultiSpriteData_3b8584[3];
extern const struct MultiSpriteData sMultiSpriteData_3b859c[3];
extern const struct MultiSpriteData sMultiSpriteData_3b85b4[3];

extern const u32 sNightmareGfx[512 * 8];
extern const u16 sNightmarePal[16 * 8];

extern const struct FrameData sNightmarePartBodyOam[2];
extern const struct FrameData sNightmarePartOam_EyeSludge[6];
extern const struct FrameData sNightmarePartOam_EyeSludgeDroppingToChin[11];
extern const struct FrameData sNightmarePartOam_ChinSludge[5];
extern const struct FrameData sNightmareBeamOam[2];
extern const struct FrameData sNightmareExplosionOam_Unused[5];
extern const struct FrameData sNightmarePartEyeOam_NotDrooping[5];
extern const struct FrameData sNightmarePartMouthOam_NotDrooping[11];
extern const struct FrameData sNightmarePartEyeOam_DroopingALittle[5];
extern const struct FrameData sNightmarePartMouthOam_DroopingALittle[11];
extern const struct FrameData sNightmarePartEyeOam_DroopingMore[5];
extern const struct FrameData sNightmarePartMouthOam_DroopingMore[11];
extern const struct FrameData sNightmarePartEyeAndMouthOam_DroopALittle[3];
extern const struct FrameData sNightmarePartEyeAndMouthOam_DroopMore[3];
extern const struct FrameData sFrameData_3bd784[2];
extern const struct FrameData sNightmarePartGeneratorOam_Stationary[2];
extern const struct FrameData sNightmarePartGeneratorOam_SpinningReallyFast[4];
extern const struct FrameData sNightmarePartGeneratorOam_SpinningFast[4];
extern const struct FrameData sNightmarePartGeneratorOam_SpinningALittleFaster[4];
extern const struct FrameData sNightmarePartGeneratorOam_SpinningALittleSlower[4];
extern const struct FrameData sNightmarePartGeneratorOam_SpinningSlow[4];
extern const struct FrameData sNightmarePartGeneratorOam_SpinningReallySlow[4];
extern const struct FrameData sFrameData_3bd864[2];
extern const struct FrameData sFrameData_3bd874[2];
extern const struct FrameData sFrameData_3bd884[2];
extern const struct FrameData sFrameData_3bd894[2];
extern const struct FrameData sFrameData_3bd8a4[2];
extern const struct FrameData sFrameData_3bd8b4[2];
extern const struct FrameData sFrameData_3bd8c4[2];
extern const struct FrameData sFrameData_3bd8d4[2];
extern const struct FrameData sFrameData_3bd8e4[15];
extern const struct FrameData sFrameData_3bd95c[15];
extern const struct FrameData sFrameData_3bd9d4[15];
extern const struct FrameData sFrameData_3bda4c[15];
extern const struct FrameData sFrameData_3bdac4[15];
extern const struct FrameData sFrameData_3bdb3c[15];
extern const struct FrameData sFrameData_3bdbb4[2];
extern const struct FrameData sFrameData_3bdbc4[5];
extern const struct FrameData sFrameData_3bdbec[15];
extern const struct FrameData sFrameData_3bdc64[15];
extern const struct FrameData sFrameData_3bdcdc[15];
extern const struct FrameData sFrameData_3bdd54[15];
extern const struct FrameData sFrameData_3bddcc[15];
extern const struct FrameData sFrameData_3bde44[15];

#endif /* NIGHTMARE_DATA_H */
