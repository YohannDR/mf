#include "types.h"

#define LOW_BYTE(value) ((value) & UCHAR_MAX)
#define HIGH_BYTE(value) (((value) & UCHAR_MAX << 8) >> 8)

#define LOW_SHORT(value) ((value) & USHORT_MAX)
#define HIGH_SHORT(value) ((value) >> 16)

/**
 * @brief Constructs an uint from 2 ushorts (high << 16 | low)
 * 
 * @param high High
 * @param low Low
 */
#define C_32_2_16(high, low) ((high) << 16 | (low))

/**
 * @brief Constructs an ushort from 2 bytes (high << 8 | low)
 * 
 * @param high High
 * @param low Low
 */
#define C_16_2_8(high, low) ((high) << 8 | (low))

// Converts a number to Q8.8 fixed-point format
#define Q_8_8(n) ((s16)((n) * 256))

// Converts a Q8.8 fixed-point format number to a regular short
#define Q_8_8_TO_SHORT(n) ((s16)((n) >> 8))

// Converts a Q8.8 fixed-point format number to a regular short
#define Q_8_8_TO_SHORT_DIV(n) (((n) / 256))

// Converts a number to Q4.12 fixed-point format
#define Q_4_12(n)  ((s16)((n) * 4096))

// Converts a number to Q16.16 fixed-point format
#define Q_16_16(n)  ((s32)((n) * 65536))

// Converts a number to Q24.8 fixed-point format
#define Q_24_8(n)  ((s32)((n) << 8))

// Converts a Q8.8 fixed-point format number to a regular integer
#define Q_8_8_TO_INT(n) ((s32)((n) / 256))

// Converts a Q4.12 fixed-point format number to a regular integer
#define Q_4_12_TO_INT(n)  ((s32)((n) / 4096))

// Converts a Q24.8 fixed-point format number to a regular integer
#define Q_24_8_TO_INT(n) ((s32)((n) >> 8))

#define RED(c) ((c) & COLOR_MASK)
#define GREEN(c) (((c) & (COLOR_MASK << 5)) >> 5)
#define BLUE(c) (((c) & (COLOR_MASK << 10)) >> 10)
#define COLOR(r, g, b) (((b) << 10) | ((g) << 5) | (r))
#define COLOR_GRAD(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
#define COLOR_WHITE COLOR(COLOR_MASK, COLOR_MASK, COLOR_MASK)
#define COLOR_BLACK COLOR(0, 0, 0)
#define COLOR_MASK 0x1F

#define SET_BACKDROP_COLOR(color) (write16(PALRAM_BASE, (color)))

#define INCBIN(...) {0}
#define INCBIN_U8   INCBIN
#define INCBIN_U16  INCBIN
#define INCBIN_U32  INCBIN
#define INCBIN_S8   INCBIN
#define INCBIN_S16  INCBIN
#define INCBIN_S32  INCBIN
#define _INCBIN_U8  INCBIN
#define _INCBIN_U16 INCBIN
#define _INCBIN_U32 INCBIN
#define _INCBIN_S8  INCBIN
#define _INCBIN_S16 INCBIN
#define _INCBIN_S32 INCBIN

#define FORCE_RODATA __attribute__((section(".rodata")))
#define NAKED_FUNCTION __attribute__((naked))
