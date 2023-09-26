#ifndef HUD_H
#define HUD_H

#include "types.h"

void HudDrawOam(void);
void HudDrawEnergy(void);
void HudDrawMissiles(u8 skipUpdatingNumber);
void HudDrawPowerBombs(u8 skipUpdatingNumber);
void HudUpdateGfx(void);
void HudDraw(void);

#endif /* HUD_H */