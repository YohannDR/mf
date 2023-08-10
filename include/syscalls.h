#ifndef SYSCALLS_H
#define SYSCALLS_H

#include "types.h"s

void CpuFastSet(void *src, void *dst, u16 size);
void CpuSet(void *src, void *dst, u32 size);
s32 DivArmDiv(s32 number, s32 denom);
s32 DivArmMod(s32 denom, s32 number);
void LZ77UncompVram(const void *src, void *dst);
void LZ77UncompWram(const void *src, void *dst);
u32 Midikey2Freq(u32* wd, u8 mk, u8 fp);
void SoundBias0(void);
void SoundBias1(void);

#endif /* SYSCALLS_H */
