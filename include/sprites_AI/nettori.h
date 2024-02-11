#ifndef NETTORI_AI_H
#define NETTORI_AI_H

#include "types.h"

enum NettoriPart {
    NETTORI_PART_HEAD,
    NETTORI_PART_LEG,
    NETTORI_PART_RIGHT_ARM,
    NETTORI_PART_LEFT_ARM,
    NETTORI_PART_HEAD_VINES,
    NETTORI_PART_BODY_VINES,
    NETTORI_PART_PLASMA_SHOOTER,

    NETTORI_PART_END
};

enum SamusEaterSporePart {
    SAMUS_EATER_SPORE_PART_FLOATING,
    SAMUS_EATER_SPORE_PART_MOVING
};

#define NETTORI_POSE_DYING_INIT 0x45
#define NETTORI_POSE_DYING 0x46

#define NETTORI_PART_POSE_FALLING 0x38
#define NETTORI_PART_POSE_EXPLODING 0x3A

#define NETTORI_PLASMA_BEAM_POSE_MOVING_INIT 0x18
#define NETTORI_PLASMA_BEAM_POSE_MOVING 0x1A

#define SAMUS_EATER_POSE_EATING_SAMUS 0x2A
#define SAMUS_EATER_POSE_DYING_INIT 0x45
#define SAMUS_EATER_POSE_DYING 0x46

#define SAMUS_EATER_BUD_POSE_TURNING_AROUND_INIT 0x3
#define SAMUS_EATER_BUD_POSE_TURNING_AROUND_FIRST_PART 0x4
#define SAMUS_EATER_BUD_POSE_TURNING_AROUND_SECOND_PART 0x5
#define SAMUS_EATER_BUD_POSE_SHOOTING 0x2A
#define SAMUS_EATER_BUD_POSE_DYING_INIT 0x45
#define SAMUS_EATER_BUD_POSE_DYING 0x46

#define SAMUS_EATER_SPORE_POSE_MOVING 0x18
#define SAMUS_EATER_SPORE_POSE_EXPLODING_INIT 0x37
#define SAMUS_EATER_SPORE_POSE_EXPLODING 0x38

void NettoriRemoveCollision(void);
void NettoriDestroySamusEaterAndSpores(void);
u8 SamusEaterCheckNettoriHealthThreshold(void);
void NettoriUpdateGlowingPalette(void);
void NettoriUpdatePalette(void);
void NettoriInit(void);
void NettoriIdle(void);
void NettoriDyingInit(void);
void NettoriTransformingIntoCoreX(void);
void NettoriPartInit(void);
void NettoriPartIdle(void);
void NettoriPartFalling(void);
void NettoriPartExploding(void);
void NettoriPlasmaBeamInit(void);
void NettoriPlasmaBeamEmerging(void);
void NettoriPlasmaBeamMovingInit(void);
void NettoriPlasmaBeamMoving(void);
void SamusEaterInit(void);
void SamusEaterIdleInit(void);
void SamusEaterIdle(void);
void SamusEaterEatingSamus(void);
void SamusEaterDyingInit(void);
void SamusEaterDying(void);
void SamusEaterBudSetSidesHitboxes(void);
void SamusEaterBudInit(void);
void SamusEaterBudIdleInit(void);
void SamusEaterBudIdle(void);
void SamusEaterBudTurningAroundInit(void);
void SamusEaterBudTurningAround(void);
void SamusEaterBudTurningAroundSecondPart(void);
void SamusEaterBudShooting(void);
void SamusEaterBudDyingInit(void);
void SamusEaterBudDying(void);
void SamusEaterSporeInit(void);
void SamusEaterSporeFloating(void);
void SamusEaterSporeMoving(void);
void SamusEaterSporeExplodingInit(void);
void SamusEaterSporeExploding(void);
void Nettori(void);
void NettoriPart(void);
void NettoriPlasmaBeam(void);
void SamusEater(void);
void SamusEaterBud(void);
void SamusEaterSpore(void);

#endif /* NETTORI_AI_H */
