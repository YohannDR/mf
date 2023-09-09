#ifndef SA_X_BOSS_AI_H
#define SA_X_BOSS_AI_H

#include "types.h"

void SaXBossCheckCollisionRunning(void);
u8 SaXBossTrackSamus(void);
void SaXBossRunningInit(void);
void SaXBossRunning(void);
void SaXBossSpinJumpingInit(void);
void SaXBossSpinJumping(void);
void SaXBossWaitingToAppearInit(void);
void SaXBossWaitingToAppear(void);
void SaXBossInit(void);
void SaXBossFallingInit(void);
void SaXBossFalling(void);
void SaXBossTurningAroundChaseInit(void);
void SaXBossTurningAroundChase(void);
void SaxBossFallingFromKnockbackInit(void);
void SaxBossFallingFromKnockback(void);
void SaXBossVariableJumpHeightInit(void);
void SaXBossVariableJumpHeight(void);
void SaXBossUpdateMosaic(void);
void SaXBossKnockbackInit(void);
void SaXBossKnockback(void);
void SaXBossKneelingInit(void);
void SaXBossKneeling(void);
void SaXBossTransformingIntoMonsterInit(void);
void SaXBossTransformingIntoMonster(void);
void SaXBossAfterTransformation(void);
void SaXBoss(void);

#endif /* SA_X_BOSS_AI_H */
