#include "fixed_point.h"
#include "macros.h"

/**
 * @brief b10 | 1c | Fixed point multiplication
 * 
 * @param a A
 * @param b B
 * @return s16 Result
 */
s16 FixedMultiplication(s16 a, s16 b)
{
    s32 res;

    res = a;
    res *= b;

    res = Q_8_8_TO_INT(res);

    return res;
}

/**
 * @brief b2c | 18 | Fixed point division
 * 
 * @param a A
 * @param b B
 * @return s16 Result
 */
s16 FixedDivision(s16 a, s16 b)
{
    return Q_24_8(a) / b;
}

/**
 * @brief b44 | 18 | Fixed point inversion
 * 
 * @param a A
 * @return s16 Result
 */
s16 FixedInverse(s16 a)
{
    s32 one;

    one = Q_16_16(1.f);
    return one / a;
}
