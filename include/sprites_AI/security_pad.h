#ifndef SECURITY_PAD_AI_H
#define SECURITY_PAD_AI_H

#include "types.h"

void SecurityPadUpdatePalette(void);
void SecurityPadInit(void);
void SecurityPadIdleActiveInit(void);
void SecurityPadIdleActive(void);
void SecurityPadPressingSwitch(void);
void SecurityPadGrabSamus(void);
void SecurityPadDepressingSwitch(void);
void SecurityPadIdleBeforeUnlocking(void);
void SecurityPadUnlocking(void);
void SecurityPadFinishedUnlocking(void);
void SecurityPadMonitorInit(void);
void SecurityPadMonitorIdle(void);
void SecurityPadMonitorArmExtending(void);
void SecurityPadMonitorUnlocking(void);
void SecurityPadMonitorArmRetracting(void);
void SecurityPadScreenInit(void);
void SecurityPadScreenIdle(void);
void SecurityPadScreenUnlocking(void);
void SecurityPad(void);
void SecurityPadMonitor(void);
void SecurityPadScreen(void);

#endif /* SECURITY_PAD_AI_H */
