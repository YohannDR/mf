#include "syscall_wrappers.h"
#include "syscalls.h"

void CallLZ77UncompVram(const void *src, void *dst)
{
    LZ77UncompVram(src, dst);
}

void CallLZ77UncompWram(const void *src, void *dst)
{
    LZ77UncompWram(src, dst);
}

void TestDivArm(void)
{
    DivArmDiv(1, 1);
    DivArmMod(1, 1);
}

void EasySleepWrapper(void)
{
    SoundBias0();
    SYSCALL(3); /* SYSCALL_Halt */
    SoundBias1();
}
