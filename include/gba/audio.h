#ifndef GBA_AUDIO_H
#define GBA_AUDIO_H

#include "memory.h"

#define REG_SOUND1CNT_L (REG_BASE + 0x60)
#define REG_SOUND1CNT_H (REG_BASE + 0x62)
#define REG_SOUND1CNT_X (REG_BASE + 0x64)

#define REG_SOUND2CNT_L (REG_BASE + 0x68)
#define REG_SOUND2CNT_H (REG_BASE + 0x6C)

#define REG_SOUND3CNT_L (REG_BASE + 0x70)
#define REG_SOUND3CNT_H (REG_BASE + 0x72)
#define REG_SOUND3CNT_X (REG_BASE + 0x74)

#define REG_SOUND4CNT_L (REG_BASE + 0x78)
#define REG_SOUND4CNT_H (REG_BASE + 0x7C)

#define REG_SOUNDCNT_L (REG_BASE + 0x80)
#define REG_SOUNDCNT_H (REG_BASE + 0x82)

#define REG_SOUNDCNT_X (REG_BASE + 0x84)
#define REG_SOUNDBIAS (REG_BASE + 0x88)

#define REG_FIFO_A (REG_BASE + 0xA0)
#define REG_FIFO_B (REG_BASE + 0xA4)

#define SOUNDCNT_RESTART_SOUND (1 << 15)

#endif /* GBA_AUDIO_H */