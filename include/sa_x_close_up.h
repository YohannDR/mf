#ifndef SA_X_CLOSEUP_H
#define SA_X_CLOSEUP_H

#include "types.h"

u32 SaXCloseUpSubroutine(void);
void SaXCloseUpInit(void);
void SaXCloseUpVblank(void);
void SaXCloseUpLoadingVblank(void);
u32 SaXCloseUp(void);
u32 SaXCloseUpProcess(void);

#endif /* SA_X_CLOSEUP_H */
