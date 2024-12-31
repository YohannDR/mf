#ifndef NEO_RIDLEY_DATA_H
#define NEO_RIDLEY_DATA_H

#include "types.h"
#include "oam.h"

#include "structs/sprite.h"

enum RidleyOam {
    RIDLEY_OAM_PART_BODY_IDLE,
    RIDLEY_OAM_PART_BODY_SHOOTING_FIRE,
    RIDLEY_OAM_PART_BODY_SCREAMING_IN_PAIN,
    RIDLEY_OAM_PART_BODY_TURNING_AROUND,
    RIDLEY_OAM_PART_BODY_TURNING_AROUND_UNUSED,
    RIDLEY_OAM_PART_BODY_SCREAMING_AFTER_SPAWN,
    RIDLEY_OAM_3AF420,
    RIDLEY_OAM_3AF430,
    RIDLEY_OAM_3AF440,
    RIDLEY_OAM_3AF450,
    RIDLEY_OAM_3AF468,
    RIDLEY_OAM_3AF480,
    RIDLEY_OAM_3AF498,
    RIDLEY_OAM_PART_TAIL_SEGMENT,
    RIDLEY_OAM_PART_TAIL_TIP,
    RIDLEY_OAM_PART_FRONT_WING_IDLE,
    RIDLEY_OAM_PART_BACK_WING_IDLE,
    RIDLEY_OAM_PART_FRONT_WING_RISING_AFTER_SPAWN,
    RIDLEY_OAM_PART_BACK_WING_RISING_AFTER_SPAWN,
    RIDLEY_OAM_PART_FRONT_WING_SHOOTING_FIRE_OR_SCREAMING,
    RIDLEY_OAM_PART_BACK_WING_SHOOTING_FIRE_OR_SCREAMING,
    RIDLEY_OAM_PART_FRONT_WING_SCREAMING_AFTER_SPAWN,
    RIDLEY_OAM_PART_BACK_WING_SCREAMING_AFTER_SPAWN,
    RIDLEY_OAM_PART_FRONT_WING_STARTING_LIFTOFF,
    RIDLEY_OAM_PART_BACK_WING_STARTING_LIFTOFF,
    RIDLEY_OAM_3AF788,
    RIDLEY_OAM_3AF798,
    RIDLEY_OAM_3AF7D0,
    RIDLEY_OAM_FIREBALL_BIG,
    RIDLEY_OAM_PART_TAIL_TIP_X_FLIPPED,
    RIDLEY_OAM_PART_BODY_GRABBING_SAMUS,

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

extern const struct MultiSpriteData sRidleyMultiSpriteData_Idle[5];
extern const struct MultiSpriteData sRidleyMultiSpriteData_RisingAfterSpawn[5];
extern const struct MultiSpriteData sRidleyMultiSpriteData_ShootingFire[16];
extern const struct MultiSpriteData sRidleyMultiSpriteData_ScreamingInPain[3];
extern const struct MultiSpriteData sRidleyMultiSpriteData_TurningAround1[3];
extern const struct MultiSpriteData sRidleyMultiSpriteData_TurningAround2[3];
extern const struct MultiSpriteData sRidleyMultiSpriteData_ScreamingAfterSpawn[24];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_Idle[16];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_RidleyInPain[16];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_WaitingToWindUp[11];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_WindingUp1[13];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_WindingUp2[13];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_StrikingForward[22];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_StrikingDown1[14];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_StrikingDown2[11];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_StrikingDown3[17];
extern const struct MultiSpriteData sRidleyTailMultiSpriteData_DoneStriking[6];
extern const struct MultiSpriteData sRidleyMultiSpriteData_GrabbingSamus[5];

extern const s16 sRidleyRisingAfterSpawnSpeed[12];
extern const s16 sArray_3a9fb4[12];
extern const s16 sArray_3a9fcc[32];

extern const u32 sRidleyGfx[512 * 8];
extern const u16 sRidleyPal[16 * 8];

extern const struct FrameData sRidleyPartOam_BodyIdle[5];
extern const struct FrameData sRidleyPartOam_BodyShootingFire[16];
extern const struct FrameData sRidleyPartOam_BodyScreamingInPain[3];
extern const struct FrameData sRidleyPartOam_BodyTurningAround[3];
extern const struct FrameData sRidleyPartOam_BodyTurningAroundUnused[3];
extern const struct FrameData sRidleyPartOam_BodyScreamingAfterSpawn[24];
extern const struct FrameData sRidleyOam_3af420[2];
extern const struct FrameData sRidleyOam_3af430[2];
extern const struct FrameData sRidleyOam_3af440[2];
extern const struct FrameData sRidleyOam_3af450[3];
extern const struct FrameData sRidleyOam_3af468[3];
extern const struct FrameData sRidleyOam_3af480[3];
extern const struct FrameData sRidleyOam_3af498[2];
extern const struct FrameData sRidleyPartOam_TailSegment[2];
extern const struct FrameData sRidleyPartOam_TailTip[2];
extern const struct FrameData sRidleyPartOam_FrontWingIdle[12];
extern const struct FrameData sRidleyPartOam_BackWingIdle[12];
extern const struct FrameData sRidleyPartOam_FrontWingRisingAfterSpawn[12];
extern const struct FrameData sRidleyPartOam_BackWingRisingAfterSpawn[12];
extern const struct FrameData sRidleyPartOam_FrontWingShootingFireOrScreaming[5];
extern const struct FrameData sRidleyPartOam_BackWingShootingFireOrScreaming[5];
extern const struct FrameData sRidleyPartOam_FrontWingScreamingAfterSpawn[8];
extern const struct FrameData sRidleyPartOam_BackWingScreamingAfterSpawn[8];
extern const struct FrameData sRidleyPartOam_FrontWingStartingLiftoff[7];
extern const struct FrameData sRidleyPartOam_BackWingStartingLiftoff[7];
extern const struct FrameData sRidleyOam_3af788[2]; // TODO find romanization of kanji symbol
extern const struct FrameData sRidleyOam_3af798[7];
extern const struct FrameData sRidleyOam_3af7d0[4];
extern const struct FrameData sRidleyFireballOam_Big[2];
extern const struct FrameData sRidleyPartOam_TailTip_XFlipped[2];
extern const struct FrameData sRidleyPartOam_BodyGrabbingSamus[5];

#endif /* NEO_RIDLEY_DATA_H */
