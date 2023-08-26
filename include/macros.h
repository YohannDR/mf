#include "types.h"

#define LOW_BYTE(value) ((value) & UCHAR_MAX)
#define HIGH_BYTE(value) (((value) & UCHAR_MAX << 8) >> 8)

#define LOW_SHORT(value) ((value) & USHORT_MAX)
#define HIGH_SHORT(value) ((value) >> 16)

/**
 * @brief Performs a modulo (value % mod) operation on a value using the and operation (WARNING only use a value for mod that is divisble by 2)
 * 
 * @param value Value
 * @param mod Modulo
 */
#define MOD_AND(value, mod) ((value) & ((mod) - 1))

/**
 * @brief Multiplies a number by a fraction (num/den)
 * 
 * @param value Value
 * @param num Numerator
 * @param den Denominator
 */
#define FRACT_MUL(value, num, den) ((value) * (num) / (den))

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

#define PI (Q_8_8(.5f))

#define SIN(angle) (sSineTable[angle])
#define COS(angle) (sSineTable[angle + PI / 2])

#define RED(c) ((c) & COLOR_MASK)
#define GREEN(c) (((c) & (COLOR_MASK << 5)) >> 5)
#define BLUE(c) (((c) & (COLOR_MASK << 10)) >> 10)
#define COLOR(r, g, b) (((b) << 10) | ((g) << 5) | (r))
#define COLOR_GRAD(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
#define COLOR_WHITE COLOR(COLOR_MASK, COLOR_MASK, COLOR_MASK)
#define COLOR_BLACK COLOR(0, 0, 0)
#define COLOR_MASK 0x1F

#define SET_BACKDROP_COLOR(color) (write16(PALRAM_BASE, (color)))

#define GET_PSPRITE_HEALTH(id) sPrimarySpriteStats[(id)][0]
#define GET_SSPRITE_HEALTH(id) sSecondarySpriteStats[(id)][0]

#define GET_PSPRITE_DAMAGE(id) sPrimarySpriteStats[(id)][1]
#define GET_SSPRITE_DAMAGE(id) sSecondarySpriteStats[(id)][1]

#define GET_PSPRITE_SUIT_REDUCTION(id) sPrimarySpriteStats[(id)][2]
#define GET_SSPRITE_SUIT_REDUCTION(id) sSecondarySpriteStats[(id)][2]

#define SPRITE_HAS_ISFT(sprite) ((sprite).invincibilityStunFlashTimer & 0x7F)
#define SPRITE_CLEAR_ISFT(sprite) ((sprite).invincibilityStunFlashTimer &= 0x80)
#define SPRITE_SET_ISFT(sprite, value) ((sprite).invincibilityStunFlashTimer |= (value))
#define SPRITE_CLEAR_AND_SET_ISFT(sprite, value)\
{                                               \
    SPRITE_CLEAR_ISFT(sprite);                  \
    SPRITE_SET_ISFT(sprite, value);             \
}

#define SUB_PIXEL_TO_PIXEL(pixel) ((pixel) / SUB_PIXEL_RATIO)
#define SUB_PIXEL_TO_PIXEL_(pixel) (DIV_SHIFT(pixel, SUB_PIXEL_RATIO))
#define PIXEL_TO_SUBPIXEL(pixel) ((pixel) * SUB_PIXEL_RATIO)
#define SUB_PIXEL_TO_BLOCK(pixel) ((pixel) / BLOCK_SIZE)
#define BLOCK_TO_SUB_PIXEL(block) ((block) * BLOCK_SIZE)
#define VELOCITY_TO_SUB_PIXEL(velocity) (DIV_SHIFT((velocity), 8))
#define SUB_PIXEL_TO_VELOCITY(velocity) ((velocity) * 8)

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
