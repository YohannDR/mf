#include "types.h"

#define LOW_BYTE(value) ((value) & UCHAR_MAX)
#define HIGH_BYTE(value) (((value) & UCHAR_MAX << 8) >> 8)

#define LOW_SHORT(value) ((value) & USHORT_MAX)
#define HIGH_SHORT(value) ((value) >> 16)

#define OAM_PART_SIZE 3
#define OAM_DATA_SIZE(nbrOfParts) (1 + (nbrOfParts) * OAM_PART_SIZE)
#define GET_OAM_DATA_SIZE(size) (((size) - 1) / OAM_PART_SIZE)

#define OPPOSITE_DIRECTION(dir) ((dir) ^ (KEY_RIGHT | KEY_LEFT))
#define ARRAY_SIZE(a) ((int)(sizeof((a)) / sizeof((a)[0])))
#define OFFSET_OF(type, element) ((int)&(((type*)0)->element))
#define CHECK_ALL_FLAGS(value, flags) (((value) & (flags)) == (flags))
#define PALETTE_NBR_ROWS(pal) (ARRAY_SIZE((pal)) / 16)

#define CEIL(v) ((int)(((float)v) + .5) == (int)(v) ? ((int)(v)) : (int)(((float)v) + .5))

#define CLAMP(value, min, max)\
{                             \
    if (value > (max))        \
        value = (max);        \
    else if (value < (min))   \
        value = (min);        \
}
#define CLAMP2(value, min, max)\
{                              \
    if (value < (min))         \
        value = (min);         \
    else if (value > (max))    \
        value = (max);         \
}

#define SET_ABS_SUB(var, v1, v2)\
{                               \
    if ((v1) > (v2))            \
        var = (v1) - (v2);      \
    else                        \
        var = (v2) - (v1);      \
}
#define SET_ABS_SUB_2(var, v1, v2)\
{                                 \
    if ((v1) < (v2))              \
        var = (v2) - (v1);        \
    else                          \
        var = (v1) - (v2);        \
}
#define ABS_SUB(v1, v2) ((v1) > (v2) ? (v1) - (v2) : (v2) - (v1))
#define ABS_SUB_2(v1, v2) ((v1) < (v2) ? (v2) - (v1) : (v1) - (v2))

/**
 * @brief Performs a modulo (value % mod) operation on a value using the and operation (WARNING only use a value for mod that is a power of 2)
 * 
 * @param value Value
 * @param mod Modulo
 */
#define MOD_AND(value, mod) ((value) & ((mod) - 1))

/**
 * @brief Performs a division (value / div) operation on a value using the right shift operation (WARNING only use a value for div that is a power of 2 and <= 1024)
 * 
 * @param value Value
 * @param div Divisor
 */
#define DIV_SHIFT(value, div) ((value) >> ((div) == 2 ? 1 : ((div) == 4 ? 2 : ((div) == 8 ? 3 : ((div) == 16 ? 4 : ((div) == 32 ? 5 : ((div) == 64 ? 6 : ((div) == 128 ? 7 : ((div) == 256 ? 8 : ((div) == 512 ? 9 : ((div) == 1024 ? 10 : 0)))))))))))

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

/**
 * @brief Constructs a byte from 8 bits
 * 
 */
#define C_8_8_1(bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7) (((bit0) << 0) | ((bit1) << 1) | ((bit2) << 2) | ((bit3) << 3) | ((bit4) << 4) | ((bit5) << 5) | ((bit6) << 6) | ((bit7) << 7))

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

#define COLOR_MASK 0x1F
#define RED(c) ((c) & COLOR_MASK)
#define GREEN(c) (((c) & (COLOR_MASK << 5)) >> 5)
#define BLUE(c) (((c) & (COLOR_MASK << 10)) >> 10)
#define COLOR(r, g, b) (((b) << 10) | ((g) << 5) | (r))
#define COLOR_GRAD(r, g, b) ((r) | ((g) << 5) | ((b) << 10))
#define COLOR_WHITE COLOR(COLOR_MASK, COLOR_MASK, COLOR_MASK)
#define COLOR_BLACK COLOR(0, 0, 0)

#define SET_BACKDROP_COLOR(color) (write16(PALRAM_BASE, (color)))

#define GET_PSPRITE_HEALTH(id) sPrimarySpriteStats[(id)][0]
#define GET_SSPRITE_HEALTH(id) sSecondarySpriteStats[(id)][0]

#define GET_PSPRITE_DAMAGE(id) sPrimarySpriteStats[(id)][1]
#define GET_SSPRITE_DAMAGE(id) sSecondarySpriteStats[(id)][1]

#define GET_PSPRITE_SUIT_REDUCTION(id) sPrimarySpriteStats[(id)][2]
#define GET_SSPRITE_SUIT_REDUCTION(id) sSecondarySpriteStats[(id)][2]

#define GET_PSPRITE_WEAKNESS(id) sPrimarySpriteStats[(id)][3]
#define GET_SSPRITE_WEAKNESS(id) sSecondarySpriteStats[(id)][3]

#define SPRITE_HAS_ISFT(sprite) ((sprite).invincibilityStunFlashTimer & 0x7F)
#define SPRITE_CLEAR_ISFT(sprite) ((sprite).invincibilityStunFlashTimer &= 0x80)
#define SPRITE_SET_ISFT(sprite, value) ((sprite).invincibilityStunFlashTimer |= (value))
#define SPRITE_CLEAR_AND_SET_ISFT(sprite, value)\
{                                               \
    SPRITE_CLEAR_ISFT(sprite);                  \
    SPRITE_SET_ISFT(sprite, value);             \
}

#define SPRITE_SET_ABSOLUTE_PALETTE_ROW(sprite, row) ((sprite).paletteRow = (row) + 8 - ((sprite).spritesetGfxSlot + (sprite).frozenPaletteRowOffset))

#define SUB_PIXEL_TO_PIXEL(pixel) ((pixel) / SUB_PIXEL_RATIO)
#define SUB_PIXEL_TO_PIXEL_(pixel) (DIV_SHIFT(pixel, SUB_PIXEL_RATIO))
#define PIXEL_TO_SUB_PIXEL(pixel) ((s32)((pixel) * SUB_PIXEL_RATIO))
#define SUB_PIXEL_TO_BLOCK(pixel) ((pixel) / BLOCK_SIZE)
#define BLOCK_TO_SUB_PIXEL(block) ((s32)((block) * BLOCK_SIZE))
#define VELOCITY_TO_SUB_PIXEL(velocity) (DIV_SHIFT((velocity), 8))
#define SUB_PIXEL_TO_VELOCITY(velocity) ((s32)((velocity) * 8))

#define SCREEN_SIZE_X_SUB_PIXEL (PIXEL_TO_SUB_PIXEL(SCREEN_SIZE_X))
#define SCREEN_SIZE_Y_SUB_PIXEL (PIXEL_TO_SUB_PIXEL(SCREEN_SIZE_Y))

#define SCREEN_SIZE_X_BLOCKS (SUB_PIXEL_TO_BLOCK(SCREEN_SIZE_X_SUB_PIXEL))
#define SCREEN_SIZE_Y_BLOCKS (SUB_PIXEL_TO_BLOCK(SCREEN_SIZE_Y_SUB_PIXEL))

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

#define ALIGN1() asm(".align 1, 0")
#define ALIGN2() asm(".align 2, 0")
#define ALIGN4() asm(".align 4, 0")
