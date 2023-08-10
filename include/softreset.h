#ifndef SOFTRESET_H
#define SOFTRESET_H

#include "gba.h"

#define SOFTRESET_KEYS (KEY_A | KEY_B | KEY_SELECT | KEY_START)

void Softreset_VBlank(void);
void SoftresetCheck(void);
void Softreset_Empty(void);
void SoftReset(void);

#endif /* SOFTRESET_H */
