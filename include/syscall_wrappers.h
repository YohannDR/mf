#ifndef SYSCALL_WRAPPERS_H
#define SYSCALL_WRAPPERS_H

#include "types.h"

#define SYSCALL(num) asm("svc " #num)

void CallLZ77UncompVram(const void *src, void *dst);
void CallLZ77UncompWram(const void *src, void *dst);
void TestDivArm(void);
void EasySleepWrapper(void);

#endif /* SYSCALL_WRAPPERS_H */
