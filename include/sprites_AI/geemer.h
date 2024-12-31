#ifndef GEEMER_AI_H
#define GEEMER_AI_H

#include "types.h"

void GeemerCheckCollisions(void);
void GeemerSetHitbox(void);
void GeemerSetCrawlingGFX(void);
void GeemerSetIdleGFX(void);
void GeemerCheckShouldHide(void);
void GeemerDelayBeforeHiding(void);
void GeemerHiding(void);
void GeemerUncovering(void);
void GeemerTurningIntoX(void);
void GeemerInit(void);
void GeemerCrawlingInit(void);
void GeemerCrawling(void);
void GeemerIdleInit(void);
void GeemerIdle(void);
void GeemerFallingInit(void);
void GeemerFalling(void);
void Geemer(void);
void GeemerFlashingLight(void);

#endif /* GEEMER_AI_H */
