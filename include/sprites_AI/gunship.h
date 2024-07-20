#ifndef GUNSHIP_H
#define GUNSHIP_H

#include "types.h"

void GunshipCheckSpawnBeam(void);
void GunshipInit(void);
void GunshipNavigation(void);
void GunshipIdle(void);
void GunshipLockingSamus(void);
void GunshipPullingSamusUp(void);
void GunshipRefill(void);
void GunshipSavePrompt(void);
void GunshipSpawnSavedPrompt(void);
void GunshipSavedPrompt(void);
void GunshipReleasingSamus(void);
void GunshipSamusReleased(void);
void GunshipLoadingSave(void);
void GunshipBeamInit(void);
void GunshipBeamMovingDown(void);
void GunshipBeamMovingUp(void);
void GunshipUpdatePalette(void);
void Gunship(void);
void GunshipBeam(void);
void GunshipPart(void);

#endif /* GUNSHIP_H */
