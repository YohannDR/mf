#include "data/sprites/yakuza.h"
#include "macros.h"

const s16 sYakuzaFireBurningSpeed[5] = {
    4, -4, -4, 4, SHORT_MAX
};

const s16 sYakuza_3b0b0e[24] = {
    -28, -24, -20, -16,
    -14, -12, -10, -8,
    -8, -8, -8, -8,
    -6, -4, -2, 0,
    0, 0, 0, 0,
    0, 0, 0, SHORT_MAX
};

const s16 sYakuzaSlammingSpeed[24] = {
    0, 1, 2, 3,
    4, 5, 6, 7,
    8, 9, 10, 11,
    12, 13, 14, 15,
    16, 17, 18, 19,
    20, 21, 22, SHORT_MAX
};

const u8 sYakuzaMouthStartChargingPalOffset[18] = {
    8, 9, 8, 9,
    8, 9, 10, 11,
    10, 11, 10, 11,
    12, 13, 12, 13,
    14, 13
};

const u8 sYakuzaMouthChargingPalOffset[12] = {
    14, 15, 14, 15,
    14, 15, 14, 15,
    14, 15, 14, 15
};

const u8 sYakuzaMouthEndChargingPalOffset[8] = {
    14, 13, 12, 11,
    10, 9, 8, 0
};

const s16 sYakuzaPhase2Speed[16] = {
    -8, -12, -16, -20,
    -16, -12, -8, 0,
    1, 2, 3, 4,
    6, 8, 12, 16
};

static const s16 sMultiSpriteData_3b0f28_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b0f28_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b0f28_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b0f50_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F30, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7088, 0, 0)
};

static const s16 sMultiSpriteData_3b0f60_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B70B0, 0, 0)
};

static const s16 sMultiSpriteData_3b0f60_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B70B0, 0, 0)
};

static const s16 sMultiSpriteData_3b0f60_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B70B0, 0, 0)
};

static const s16 sMultiSpriteData_3b0f88_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F30, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B70F8, 0, 0)
};

static const s16 sMultiSpriteData_3b0f98_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7120, 0, 0)
};

static const s16 sMultiSpriteData_3b0f98_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7120, 0, 0)
};

static const s16 sMultiSpriteData_3b0f98_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7120, 0, 0)
};

static const s16 sMultiSpriteData_3b0fc0_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7140, 0, 0)
};

static const s16 sMultiSpriteData_3b0fc0_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7140, 0, 0)
};

static const s16 sMultiSpriteData_3b0fc0_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7140, 0, 0)
};

static const s16 sMultiSpriteData_3b0fe8_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F40, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b0fe8_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F40, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1000_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F68, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1000_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F68, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1000_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -1, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F68, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1028_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -1, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F90, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1028_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F90, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1040_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6FA8, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1050_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6FC0, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1060_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6FD0, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1060_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6FD0, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1078_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6FE8, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1078_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -1, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6FE8, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b1078_Frame3[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6FE8, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b10a0_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7010, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b10b0_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7028, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b10b0_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7028, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b10b0_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7028, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7060, 0, 0)
};

static const s16 sMultiSpriteData_3b10e8_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b10e8_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b10e8_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1150_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F58, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1110_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F40, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1110_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F40, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1160_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -1, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F90, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1160_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F90, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1128_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F68, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1128_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F68, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1128_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -1, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F68, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7150, 0, 0)
};

static const s16 sMultiSpriteData_3b1178_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F30, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7198, 0, 0)
};

static const s16 sMultiSpriteData_3b1188_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B71C0, 0, 0)
};

static const s16 sMultiSpriteData_3b1188_Frame1[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -3, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B71C0, 0, 0)
};

static const s16 sMultiSpriteData_3b1188_Frame2[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -2, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F08, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B71C0, 0, 0)
};

static const s16 sMultiSpriteData_3b11b0_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F30, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7208, 0, 0)
};

static const s16 sMultiSpriteData_3b11c0_Frame0[YAKUZA_PART_END][MULTI_SPRITE_DATA_ELEMENT_END] = {
    [YAKUZA_PART_EYE] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7230, -4, -16),
    [YAKUZA_PART_BODY] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B6F30, 0, 0),
    [YAKUZA_PART_LEGS] = MULTI_SPRITE_DATA_INFO(FRAMEDATA_3B7188, 0, 0)
};

const struct MultiSpriteData sMultiSpriteData_3b0f28[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b0f28_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b0f28_Frame1,
        .timer = 6
    },
    [2] = {
        .pData = sMultiSpriteData_3b0f28_Frame2,
        .timer = 6
    },
    [3] = {
        .pData = sMultiSpriteData_3b0f28_Frame1,
        .timer = 6
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b0f50[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b0f50_Frame0,
        .timer = 6
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b0f60[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b0f60_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b0f60_Frame1,
        .timer = 6
    },
    [2] = {
        .pData = sMultiSpriteData_3b0f60_Frame2,
        .timer = 6
    },
    [3] = {
        .pData = sMultiSpriteData_3b0f60_Frame1,
        .timer = 6
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b0f88[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b0f88_Frame0,
        .timer = 6
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b0f98[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b0f98_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b0f98_Frame1,
        .timer = 6
    },
    [2] = {
        .pData = sMultiSpriteData_3b0f98_Frame2,
        .timer = 6
    },
    [3] = {
        .pData = sMultiSpriteData_3b0f98_Frame1,
        .timer = 6
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b0fc0[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b0fc0_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b0fc0_Frame1,
        .timer = 6
    },
    [2] = {
        .pData = sMultiSpriteData_3b0fc0_Frame2,
        .timer = 6
    },
    [3] = {
        .pData = sMultiSpriteData_3b0fc0_Frame1,
        .timer = 6
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b0fe8[3] = {
    [0] = {
        .pData = sMultiSpriteData_3b0fe8_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b0fe8_Frame1,
        .timer = 6
    },
    [2] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1000[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b1000_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b1000_Frame1,
        .timer = 6
    },
    [2] = {
        .pData = sMultiSpriteData_3b1000_Frame2,
        .timer = 6
    },
    [3] = {
        .pData = sMultiSpriteData_3b1000_Frame1,
        .timer = 6
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1028[3] = {
    [0] = {
        .pData = sMultiSpriteData_3b1028_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b1028_Frame1,
        .timer = 6
    },
    [2] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1040[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b1040_Frame0,
        .timer = 4
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1050[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b1050_Frame0,
        .timer = 4
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1060[3] = {
    [0] = {
        .pData = sMultiSpriteData_3b1060_Frame0,
        .timer = 4
    },
    [1] = {
        .pData = sMultiSpriteData_3b1060_Frame1,
        .timer = 4
    },
    [2] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1078[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b1078_Frame0,
        .timer = 3
    },
    [1] = {
        .pData = sMultiSpriteData_3b1078_Frame1,
        .timer = 3
    },
    [2] = {
        .pData = sMultiSpriteData_3b1078_Frame0,
        .timer = 3
    },
    [3] = {
        .pData = sMultiSpriteData_3b1078_Frame3,
        .timer = 12
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b10a0[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b10a0_Frame0,
        .timer = 4
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b10b0[7] = {
    [0] = {
        .pData = sMultiSpriteData_3b10b0_Frame0,
        .timer = 2
    },
    [1] = {
        .pData = sMultiSpriteData_3b10b0_Frame1,
        .timer = 2
    },
    [2] = {
        .pData = sMultiSpriteData_3b10b0_Frame2,
        .timer = 2
    },
    [3] = {
        .pData = sMultiSpriteData_3b10b0_Frame1,
        .timer = 2
    },
    [4] = {
        .pData = sMultiSpriteData_3b10b0_Frame2,
        .timer = 2
    },
    [5] = {
        .pData = sMultiSpriteData_3b10b0_Frame1,
        .timer = 2
    },
    [6] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b10e8[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b10e8_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b10e8_Frame1,
        .timer = 6
    },
    [2] = {
        .pData = sMultiSpriteData_3b10e8_Frame2,
        .timer = 6
    },
    [3] = {
        .pData = sMultiSpriteData_3b10e8_Frame1,
        .timer = 6
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1110[3] = {
    [0] = {
        .pData = sMultiSpriteData_3b1110_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b1110_Frame1,
        .timer = 6
    },
    [2] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1128[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b1128_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b1128_Frame1,
        .timer = 6
    },
    [2] = {
        .pData = sMultiSpriteData_3b1128_Frame2,
        .timer = 6
    },
    [3] = {
        .pData = sMultiSpriteData_3b1128_Frame1,
        .timer = 6
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1150[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b1150_Frame0,
        .timer = 4
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1160[3] = {
    [0] = {
        .pData = sMultiSpriteData_3b1160_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b1160_Frame1,
        .timer = 6
    },
    [2] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1178[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b1178_Frame0,
        .timer = 6
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b1188[5] = {
    [0] = {
        .pData = sMultiSpriteData_3b1188_Frame0,
        .timer = 6
    },
    [1] = {
        .pData = sMultiSpriteData_3b1188_Frame1,
        .timer = 6
    },
    [2] = {
        .pData = sMultiSpriteData_3b1188_Frame2,
        .timer = 6
    },
    [3] = {
        .pData = sMultiSpriteData_3b1188_Frame1,
        .timer = 6
    },
    [4] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b11b0[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b11b0_Frame0,
        .timer = 6
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const struct MultiSpriteData sMultiSpriteData_3b11c0[2] = {
    [0] = {
        .pData = sMultiSpriteData_3b11c0_Frame0,
        .timer = 255
    },
    [1] = MULTI_SPRITE_DATA_TERMINATOR
};

const u32 sYakuzaGfx[512 * 8] = INCBIN_U32("data/sprites/yakuza.gfx");
const u16 sYakuzaPal[8][16] = INCBIN_U16("data/sprites/yakuza.pal");

const u16 sYakuzaMouthChargingPal[8][16] = INCBIN_U16("data/sprites/yakuza_mouth_charging.pal");

static const u16 sFrameData_3b6f08_Frame0[] = {
    12,
    0xe8, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d4,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xf8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3de,
    0x2, 0x1f8, OBJ_PALETTE_8 | 0x367,
    0x2, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x367,
    0x2, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x38e,
    0x2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x38e,
    0xfa, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x218,
    0xdd, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6f08_Frame1[] = {
    12,
    0xe9, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xf9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d4,
    0xe9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xf9, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3de,
    0x3, 0x1f8, OBJ_PALETTE_8 | 0x387,
    0x3, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x387,
    0x4, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x38e,
    0x4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x38e,
    0xfc, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x218,
    0xdd, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6f08_Frame2[] = {
    12,
    0xea, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xfa, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d4,
    0xea, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xfa, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3de,
    0x4, 0x1f8, OBJ_PALETTE_8 | 0x3a7,
    0x4, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3a7,
    0x4, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x38e,
    0x4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x38e,
    0xfd, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x218,
    0xdc, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6f40_Frame0[] = {
    11,
    0xe9, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xe9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xf9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x3, 0x1f8, OBJ_PALETTE_8 | 0x387,
    0x3, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x387,
    0x1, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x390,
    0x1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x390,
    0xfc, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x298,
    0xdd, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6f40_Frame1[] = {
    11,
    0xea, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xea, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xfa, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x4, 0x1f8, OBJ_PALETTE_8 | 0x3a7,
    0x4, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3a7,
    0x0, OBJ_SIZE_16x16 | 0x1e5, OBJ_PALETTE_8 | 0x3d0,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_PALETTE_8 | 0x3d0,
    0xff, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x318,
    0xde, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6f58_Frame0[] = {
    11,
    0xe9, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xe9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xf9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x3, 0x1f8, OBJ_PALETTE_8 | 0x3c7,
    0x3, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3c7,
    0xfe, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x3d0,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x3d0,
    0x1, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x21c,
    0xdf, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6fa8_Frame1[] = {
    11,
    0xe9, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xe9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xf9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x3, 0x1f8, OBJ_PALETTE_8 | 0x3c7,
    0x3, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3c7,
    0xfe, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x3d0,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x3d0,
    0x1, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x29c,
    0xdf, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6fc0_Frame0[] = {
    11,
    0xe9, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xe9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xf9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x3, 0x1f8, OBJ_PALETTE_8 | 0x3c7,
    0x3, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3c7,
    0xfe, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x3d0,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x3d0,
    0x1, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x31c,
    0xdf, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6fd0_Frame1[] = {
    11,
    0xe8, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xe8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xf8, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x2, 0x1f8, OBJ_PALETTE_8 | 0x3a7,
    0x2, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3a7,
    0xfd, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x3d0,
    0xfd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x3d0,
    0x0, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x31c,
    0xdf, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6fe8_Frame0[] = {
    11,
    0xe9, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xe9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xf9, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x3, 0x1f8, OBJ_PALETTE_8 | 0x3a7,
    0x3, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3a7,
    0xfe, OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_8 | 0x3d0,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x3d0,
    0x1, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x31c,
    0xde, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6fe8_Frame1[] = {
    11,
    0xeb, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xeb, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xfb, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x5, 0x1f8, OBJ_PALETTE_8 | 0x3a7,
    0x5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3a7,
    0x0, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x3d0,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x3d0,
    0x3, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_9 | 0x31c,
    0xdd, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6f68_Frame1[] = {
    11,
    0xea, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xea, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xfa, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x4, 0x1f8, OBJ_PALETTE_8 | 0x3c7,
    0x4, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3c7,
    0xff, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x3d0,
    0xff, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x3d0,
    0x2, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x21c,
    0xdf, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b6f68_Frame2[] = {
    11,
    0xeb, OBJ_SIZE_32x32 | 0x1f8, OBJ_PALETTE_8 | 0x396,
    0xeb, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x394,
    0xfb, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x3d2,
    0x5, 0x1f8, OBJ_PALETTE_8 | 0x3c7,
    0x5, OBJ_X_FLIP | 0x0, OBJ_PALETTE_8 | 0x3c7,
    0x0, OBJ_SIZE_16x16 | 0x1e4, OBJ_PALETTE_8 | 0x3d0,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xc, OBJ_PALETTE_8 | 0x3d0,
    0x3, OBJ_SIZE_32x32 | 0x1f0, OBJ_PALETTE_8 | 0x21c,
    0xde, OBJ_SIZE_32x32 | 0x1e8, OBJ_PALETTE_8 | 0x39a,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x39a,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x3da
};

static const u16 sFrameData_3b70b0_Frame0[] = {
    21,
    0xfa, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1e8, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_16x32 | 0x1db, OBJ_PALETTE_8 | 0x380,
    0x17, 0x1eb, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x9, OBJ_PALETTE_8 | 0x383,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1d, OBJ_PALETTE_8 | 0x20c,
    0x8, OBJ_X_FLIP | 0x1d, OBJ_PALETTE_8 | 0x28c,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x344,
    0xe5, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x3cb,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x15, OBJ_PALETTE_8 | 0x206
};

static const u16 sFrameData_3b70b0_Frame1[] = {
    22,
    0xf8, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1e8, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xfb, OBJ_SIZE_16x32 | 0x1d8, OBJ_PALETTE_8 | 0x380,
    0x13, 0x1e8, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0xfb, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x265,
    0xdd, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1da, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x266,
    OBJ_SHAPE_VERTICAL | 0x1, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x7, OBJ_PALETTE_8 | 0x383,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1e, OBJ_PALETTE_8 | 0x20c,
    0x10, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x28c,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x3cd,
    0xe2, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x206,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x226
};

static const u16 sFrameData_3b70b0_Frame2[] = {
    27,
    0xf8, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1e8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_SIZE_16x32 | 0x1d7, OBJ_PALETTE_8 | 0x380,
    0xd, 0x1e7, OBJ_PALETTE_8 | 0x3e2,
    0xe4, 0x1db, OBJ_PALETTE_8 | 0x203,
    0xec, OBJ_SIZE_16x16 | 0x1db, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1eb, OBJ_PALETTE_8 | 0x225,
    0xe6, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x226,
    0xde, 0x1e1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_8x32 | 0x1cf, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1d7, OBJ_PALETTE_8 | 0x209,
    0xf6, 0x1d7, OBJ_PALETTE_8 | 0x249,
    0xda, OBJ_SIZE_16x16 | 0x1ce, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1de, OBJ_PALETTE_8 | 0x38a,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xe, OBJ_PALETTE_8 | 0x385,
    0x1a, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x3e7,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x362,
    0xf8, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1e, OBJ_PALETTE_8 | 0x22a,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1a, OBJ_PALETTE_8 | 0x326,
    0xf8, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x366,
    0xe7, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x227,
    0xef, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x247,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x226
};

static const u16 sFrameData_3b70b0_Frame3[] = {
    25,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x1dc, OBJ_PALETTE_8 | 0x385,
    0xb, 0x1ec, OBJ_PALETTE_8 | 0x3e7,
    0xf4, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x320,
    0xe5, 0x1d8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_SIZE_16x32 | 0x1d0, OBJ_PALETTE_8 | 0x22a,
    0xec, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x344,
    0xe4, 0x1df, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_SIZE_16x16 | 0x1d1, OBJ_PALETTE_8 | 0x38b,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1e1, OBJ_PALETTE_8 | 0x38d,
    0xe6, OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_8 | 0x226,
    0xde, 0x1e2, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0x3, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x11, OBJ_PALETTE_8 | 0x385,
    0x1b, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x3e7,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x2e1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2c1,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x2e0,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2a, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x209,
    0x7, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x249,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x21, OBJ_PALETTE_8 | 0x326,
    0xf8, OBJ_X_FLIP | 0x29, OBJ_PALETTE_8 | 0x366,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2e7,
    0xe8, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2e6
};

static const u16 sFrameData_3b70b0_Frame4[] = {
    21,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_SIZE_16x32 | 0x1e7, OBJ_PALETTE_8 | 0x383,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_8x32 | 0x1db, OBJ_PALETTE_8 | 0x20c,
    0x8, 0x1db, OBJ_PALETTE_8 | 0x28c,
    0xed, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x344,
    0xe5, 0x1df, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_SIZE_16x16 | 0x1d7, OBJ_PALETTE_8 | 0x3cb,
    0xe6, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x226,
    0xde, 0x1e3, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x15, OBJ_PALETTE_8 | 0x380,
    0x17, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x3e2,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0x1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2a7,
    0xe6, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b70b0_Frame5[] = {
    22,
    OBJ_SHAPE_VERTICAL | 0x1, OBJ_SIZE_16x32 | 0x1e9, OBJ_PALETTE_8 | 0x383,
    0xf8, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1e3, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_8x32 | 0x1da, OBJ_PALETTE_8 | 0x20c,
    0x10, 0x1da, OBJ_PALETTE_8 | 0x28c,
    0xf1, OBJ_SIZE_16x16 | 0x1d9, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2e5,
    0xe0, OBJ_SIZE_16x16 | 0x1d7, OBJ_PALETTE_8 | 0x3cd,
    0xe2, 0x1e5, OBJ_PALETTE_8 | 0x206,
    0xe7, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x226,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xfb, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x380,
    0x13, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xeb, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0xfb, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x265,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x266
};

static const u16 sFrameData_3b70b0_Frame6[] = {
    27,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_SIZE_16x32 | 0x1e2, OBJ_PALETTE_8 | 0x385,
    0x1a, 0x1f2, OBJ_PALETTE_8 | 0x3e7,
    0xf8, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1e1, OBJ_PALETTE_8 | 0x362,
    0xf8, 0x1da, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_SIZE_16x32 | 0x1d2, OBJ_PALETTE_8 | 0x22a,
    0xf3, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_SIZE_16x16 | 0x1d6, OBJ_PALETTE_8 | 0x326,
    0xf8, 0x1d6, OBJ_PALETTE_8 | 0x366,
    0xe7, 0x1ea, OBJ_PALETTE_8 | 0x227,
    0xef, 0x1ea, OBJ_PALETTE_8 | 0x247,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1e2, OBJ_PALETTE_8 | 0x226,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x19, OBJ_PALETTE_8 | 0x380,
    0xd, OBJ_X_FLIP | 0x11, OBJ_PALETTE_8 | 0x3e2,
    0xe4, OBJ_X_FLIP | 0x1d, OBJ_PALETTE_8 | 0x203,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x225,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x29, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xe6, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x209,
    0xf6, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x249,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x22, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x38a
};

static const u16 sFrameData_3b70b0_Frame7[] = {
    25,
    OBJ_SHAPE_VERTICAL | 0x3, OBJ_SIZE_16x32 | 0x1df, OBJ_PALETTE_8 | 0x385,
    0x1b, 0x1ef, OBJ_PALETTE_8 | 0x3e7,
    0x0, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x2e1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e0, OBJ_PALETTE_8 | 0x2c1,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1d8, OBJ_PALETTE_8 | 0x2e0,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_8x32 | 0x1ce, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1d6, OBJ_PALETTE_8 | 0x209,
    0x7, 0x1d6, OBJ_PALETTE_8 | 0x249,
    0xf1, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_SIZE_16x16 | 0x1cf, OBJ_PALETTE_8 | 0x326,
    0xf8, 0x1cf, OBJ_PALETTE_8 | 0x366,
    0xe8, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2e7,
    0xe8, 0x1d6, OBJ_PALETTE_8 | 0x2e6,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x14, OBJ_PALETTE_8 | 0x385,
    0xb, OBJ_X_FLIP | 0xc, OBJ_PALETTE_8 | 0x3e7,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x320,
    0xe5, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x22a,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x344,
    0xe4, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f, OBJ_PALETTE_8 | 0x38b,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x38d,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x206
};

static const u16 sFrameData_3b7150_Frame0[] = {
    6,
    0xfa, 0x1e5, OBJ_PALETTE_8 | 0x2c0,
    0xf1, 0x1e8, OBJ_PALETTE_8 | 0x360,
    0xe8, 0x1e6, OBJ_PALETTE_8 | 0x361,
    0xfa, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x382,
    0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3a2,
    0xe8, OBJ_X_FLIP | 0x12, OBJ_PALETTE_8 | 0x3c2
};

static const u16 sFrameData_3b7150_Frame1[] = {
    6,
    0xe8, OBJ_X_FLIP | 0x12, OBJ_PALETTE_8 | 0x2c0,
    0xfa, 0x1e5, OBJ_PALETTE_8 | 0x360,
    0xf1, 0x1e8, OBJ_PALETTE_8 | 0x361,
    0xe8, 0x1e6, OBJ_PALETTE_8 | 0x382,
    0xfa, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x3a2,
    0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3c2
};

static const u16 sFrameData_3b7150_Frame2[] = {
    6,
    0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2c0,
    0xe8, OBJ_X_FLIP | 0x12, OBJ_PALETTE_8 | 0x360,
    0xfa, 0x1e5, OBJ_PALETTE_8 | 0x361,
    0xf1, 0x1e8, OBJ_PALETTE_8 | 0x382,
    0xe8, 0x1e6, OBJ_PALETTE_8 | 0x3a2,
    0xfa, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x3c2
};

static const u16 sFrameData_3b7150_Frame3[] = {
    6,
    0xfa, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x2c0,
    0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x360,
    0xe8, OBJ_X_FLIP | 0x12, OBJ_PALETTE_8 | 0x361,
    0xfa, 0x1e5, OBJ_PALETTE_8 | 0x382,
    0xf1, 0x1e8, OBJ_PALETTE_8 | 0x3a2,
    0xe8, 0x1e6, OBJ_PALETTE_8 | 0x3c2
};

static const u16 sFrameData_3b7150_Frame4[] = {
    6,
    0xe8, 0x1e6, OBJ_PALETTE_8 | 0x2c0,
    0xfa, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x360,
    0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x361,
    0xe8, OBJ_X_FLIP | 0x12, OBJ_PALETTE_8 | 0x382,
    0xfa, 0x1e5, OBJ_PALETTE_8 | 0x3a2,
    0xf1, 0x1e8, OBJ_PALETTE_8 | 0x3c2
};

static const u16 sFrameData_3b7150_Frame5[] = {
    6,
    0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2c0,
    0xe8, 0x1e6, OBJ_PALETTE_8 | 0x360,
    0xfa, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x361,
    0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x382,
    0xe8, OBJ_X_FLIP | 0x12, OBJ_PALETTE_8 | 0x3a2,
    0xfa, 0x1e5, OBJ_PALETTE_8 | 0x3c2
};

static const u16 sFrameData_3b70f8_Frame0[] = {
    20,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x9, OBJ_PALETTE_8 | 0x383,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1d, OBJ_PALETTE_8 | 0x20c,
    0x8, OBJ_X_FLIP | 0x1d, OBJ_PALETTE_8 | 0x28c,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x344,
    0xe5, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x3cb,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x15, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xfb, OBJ_SIZE_16x32 | 0x1d8, OBJ_PALETTE_8 | 0x380,
    0x13, 0x1e8, OBJ_PALETTE_8 | 0x3e2,
    0xf8, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1e8, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0xfb, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x265,
    0xdd, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1da, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x266
};

static const u16 sFrameData_3b70f8_Frame1[] = {
    23,
    OBJ_SHAPE_VERTICAL | 0x1, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x7, OBJ_PALETTE_8 | 0x383,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1e, OBJ_PALETTE_8 | 0x20c,
    0x10, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x28c,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x3cd,
    0xe2, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x206,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x226,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_16x32 | 0x1dc, OBJ_PALETTE_8 | 0x385,
    0xb, 0x1ec, OBJ_PALETTE_8 | 0x3e7,
    0xf4, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x320,
    0xe4, 0x1db, OBJ_PALETTE_8 | 0x203,
    0xec, OBJ_SIZE_16x16 | 0x1db, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1eb, OBJ_PALETTE_8 | 0x225,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_8x32 | 0x1cf, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1d7, OBJ_PALETTE_8 | 0x209,
    0xf6, 0x1d7, OBJ_PALETTE_8 | 0x249,
    0xe5, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x226,
    0xdd, 0x1e1, OBJ_PALETTE_8 | 0x206,
    0xda, OBJ_SIZE_16x16 | 0x1cf, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1df, OBJ_PALETTE_8 | 0x38a
};

static const u16 sFrameData_3b70f8_Frame2[] = {
    25,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xe, OBJ_PALETTE_8 | 0x385,
    0x1a, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x3e7,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x362,
    0xf8, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1e, OBJ_PALETTE_8 | 0x22a,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1a, OBJ_PALETTE_8 | 0x326,
    0xf8, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x366,
    0xe7, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x227,
    0xef, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x247,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x226,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_SIZE_16x32 | 0x1de, OBJ_PALETTE_8 | 0x385,
    0x12, 0x1ee, OBJ_PALETTE_8 | 0x3e7,
    0xfa, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x281,
    0xed, OBJ_SIZE_16x16 | 0x1d7, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1e7, OBJ_PALETTE_8 | 0x2a5,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_8x32 | 0x1cf, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1d7, OBJ_PALETTE_8 | 0x209,
    0xfe, 0x1d7, OBJ_PALETTE_8 | 0x249,
    0xe6, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x226,
    0xde, 0x1e1, OBJ_PALETTE_8 | 0x206,
    0xda, OBJ_SIZE_16x16 | 0x1ce, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1de, OBJ_PALETTE_8 | 0x38a
};

static const u16 sFrameData_3b70f8_Frame3[] = {
    27,
    OBJ_SHAPE_VERTICAL | 0x3, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x11, OBJ_PALETTE_8 | 0x385,
    0x1b, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x3e7,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x2e1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2c1,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x2e0,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2a, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x209,
    0x7, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x249,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x21, OBJ_PALETTE_8 | 0x326,
    0xf8, OBJ_X_FLIP | 0x29, OBJ_PALETTE_8 | 0x366,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2e7,
    0xe8, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2e6,
    OBJ_SHAPE_VERTICAL | 0x3, OBJ_SIZE_16x32 | 0x1df, OBJ_PALETTE_8 | 0x385,
    0x1b, 0x1ef, OBJ_PALETTE_8 | 0x3e7,
    0x0, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x2e1,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1e0, OBJ_PALETTE_8 | 0x2c1,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1d8, OBJ_PALETTE_8 | 0x2e0,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_8x32 | 0x1ce, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1d6, OBJ_PALETTE_8 | 0x209,
    0x7, 0x1d6, OBJ_PALETTE_8 | 0x249,
    0xf1, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2e5,
    0xdd, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1da, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x266
};

static const u16 sFrameData_3b7060_Frame0[] = {
    26,
    0xfa, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1e8, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_16x32 | 0x1db, OBJ_PALETTE_8 | 0x380,
    0x17, 0x1eb, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x15, OBJ_PALETTE_8 | 0x380,
    0x17, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0x1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2a7,
    0xe6, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b7120_Frame0[] = {
    28,
    0xf8, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x2c1,
    OBJ_SHAPE_HORIZONTAL | 0x8, 0x1e0, OBJ_PALETTE_8 | 0x301,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1d8, OBJ_PALETTE_8 | 0x2e0,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_SIZE_16x32 | 0x1df, OBJ_PALETTE_8 | 0x380,
    0x1a, 0x1ef, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x2c1,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x301,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x2e0,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x11, OBJ_PALETTE_8 | 0x380,
    0x1a, OBJ_X_FLIP | 0x9, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0x1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2a7,
    0xe6, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b7120_Frame1[] = {
    26,
    0xfa, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0xa, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x7, OBJ_SIZE_16x32 | 0x1e5, OBJ_PALETTE_8 | 0x380,
    0x1f, 0x1f5, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0xa, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x7, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xb, OBJ_PALETTE_8 | 0x380,
    0x1f, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0x1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2a7,
    0xe6, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b7120_Frame2[] = {
    26,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0x1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2a7,
    0xe6, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b7060_Frame1[] = {
    26,
    0xfa, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1e8, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_SIZE_16x32 | 0x1db, OBJ_PALETTE_8 | 0x380,
    0x18, 0x1eb, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x2, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe5, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x15, OBJ_PALETTE_8 | 0x380,
    0x18, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0x2, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2a5,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2a7,
    0xe6, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b7060_Frame2[] = {
    26,
    0xfb, OBJ_SIZE_16x16 | 0x1d9, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfb, 0x1e9, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_SIZE_16x32 | 0x1dc, OBJ_PALETTE_8 | 0x380,
    0x1a, 0x1ec, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_SIZE_8x32 | 0x1ce, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1d6, OBJ_PALETTE_8 | 0x209,
    0x2, 0x1d6, OBJ_PALETTE_8 | 0x249,
    0xef, OBJ_SIZE_16x16 | 0x1d9, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1e9, OBJ_PALETTE_8 | 0x2a5,
    0xe5, OBJ_SIZE_16x16 | 0x1c9, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1d9, OBJ_PALETTE_8 | 0x3ca,
    0xe7, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x2a7,
    0xe7, 0x1d7, OBJ_PALETTE_8 | 0x2a6,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfb, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x14, OBJ_PALETTE_8 | 0x380,
    0x1a, OBJ_X_FLIP | 0xc, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2a, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x209,
    0x2, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x249,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x2a5,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x27, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe5, OBJ_X_FLIP | 0x1f, OBJ_PALETTE_8 | 0x3ca,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x2a7,
    0xe7, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b7088_Frame1[] = {
    25,
    0xfa, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1e8, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_16x32 | 0x1db, OBJ_PALETTE_8 | 0x380,
    0x17, 0x1eb, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x240,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x242,
    OBJ_SHAPE_VERTICAL | 0xfb, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x18, OBJ_PALETTE_8 | 0x380,
    0x13, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xeb, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0xfb, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x265,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x266
};

static const u16 sFrameData_3b7088_Frame2[] = {
    27,
    0xfa, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1e8, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_16x32 | 0x1db, OBJ_PALETTE_8 | 0x380,
    0x17, 0x1eb, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x19, OBJ_PALETTE_8 | 0x380,
    0xd, OBJ_X_FLIP | 0x11, OBJ_PALETTE_8 | 0x3e2,
    0xe4, OBJ_X_FLIP | 0x1d, OBJ_PALETTE_8 | 0x203,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x225,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x29, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xe6, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x209,
    0xf6, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x249,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x22, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x38a
};

static const u16 sFrameData_3b7088_Frame3[] = {
    24,
    0xfa, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1e8, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_16x32 | 0x1db, OBJ_PALETTE_8 | 0x380,
    0x17, 0x1eb, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x14, OBJ_PALETTE_8 | 0x385,
    0xb, OBJ_X_FLIP | 0xc, OBJ_PALETTE_8 | 0x3e7,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x320,
    0xe5, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x22a,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x344,
    0xe4, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f, OBJ_PALETTE_8 | 0x38b,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x38d,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x206
};

static const u16 sFrameData_3b7230_Frame0[] = {
    1,
    0xfc, 0x1fc, OBJ_PALETTE_8 | 0x2c6
};

static const u16 sFrameData_3b7240_Frame0[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x392
};

static const u16 sFrameData_3b7240_Frame1[] = {
    1,
    0xf8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x39e
};

static const u16 sFrameData_3b7198_Frame1[] = {
    25,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xeb, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0xfb, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x265,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x266
};

static const u16 sFrameData_3b7198_Frame2[] = {
    27,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xe4, OBJ_X_FLIP | 0x1d, OBJ_PALETTE_8 | 0x203,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x225,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x29, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xe6, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x209,
    0xf6, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x249,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x22, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x38a
};

static const u16 sFrameData_3b7198_Frame3[] = {
    25,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    0xe5, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x22a,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x344,
    0xe4, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f, OBJ_PALETTE_8 | 0x38b,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x38d,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x206
};

static const u16 sFrameData_3b71c0_Frame0[] = {
    24,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0x1, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_SIZE_16x16 | 0x1c8, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1d8, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2a7,
    0xe6, 0x1d6, OBJ_PALETTE_8 | 0x2a6,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1d, OBJ_PALETTE_8 | 0x20c,
    0x8, OBJ_X_FLIP | 0x1d, OBJ_PALETTE_8 | 0x28c,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x344,
    0xe5, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x3cb,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x15, OBJ_PALETTE_8 | 0x206
};

static const u16 sFrameData_3b71c0_Frame1[] = {
    23,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0xfb, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x265,
    0xdd, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1da, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x266,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1e, OBJ_PALETTE_8 | 0x20c,
    0x10, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x28c,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x3cd,
    0xe2, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x206,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x226
};

static const u16 sFrameData_3b71c0_Frame2[] = {
    27,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    0xe4, 0x1db, OBJ_PALETTE_8 | 0x203,
    0xec, OBJ_SIZE_16x16 | 0x1db, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1eb, OBJ_PALETTE_8 | 0x225,
    0xe6, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x226,
    0xde, 0x1e1, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_8x32 | 0x1cf, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1d7, OBJ_PALETTE_8 | 0x209,
    0xf6, 0x1d7, OBJ_PALETTE_8 | 0x249,
    0xda, OBJ_SIZE_16x16 | 0x1ce, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1de, OBJ_PALETTE_8 | 0x38a,
    0xf8, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1e, OBJ_PALETTE_8 | 0x22a,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1a, OBJ_PALETTE_8 | 0x326,
    0xf8, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x366,
    0xe7, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x227,
    0xef, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x247,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x226
};

static const u16 sFrameData_3b71c0_Frame3[] = {
    25,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    0xe5, 0x1d8, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_SIZE_16x32 | 0x1d0, OBJ_PALETTE_8 | 0x22a,
    0xec, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x344,
    0xe4, 0x1df, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_SIZE_16x16 | 0x1d1, OBJ_PALETTE_8 | 0x38b,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1e1, OBJ_PALETTE_8 | 0x38d,
    0xe6, OBJ_SIZE_16x16 | 0x1e2, OBJ_PALETTE_8 | 0x226,
    0xde, 0x1e2, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2a, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x209,
    0x7, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x249,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x21, OBJ_PALETTE_8 | 0x326,
    0xf8, OBJ_X_FLIP | 0x29, OBJ_PALETTE_8 | 0x366,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2e7,
    0xe8, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2e6
};

static const u16 sFrameData_3b71c0_Frame4[] = {
    24,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_8x32 | 0x1db, OBJ_PALETTE_8 | 0x20c,
    0x8, 0x1db, OBJ_PALETTE_8 | 0x28c,
    0xed, OBJ_SIZE_16x16 | 0x1df, OBJ_PALETTE_8 | 0x344,
    0xe5, 0x1df, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_SIZE_16x16 | 0x1d7, OBJ_PALETTE_8 | 0x3cb,
    0xe6, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x226,
    0xde, 0x1e3, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0x1, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2a5,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x28, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xe4, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x3ca,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2a7,
    0xe6, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b71c0_Frame5[] = {
    23,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_SIZE_8x32 | 0x1da, OBJ_PALETTE_8 | 0x20c,
    0x10, 0x1da, OBJ_PALETTE_8 | 0x28c,
    0xf1, OBJ_SIZE_16x16 | 0x1d9, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2e5,
    0xe0, OBJ_SIZE_16x16 | 0x1d7, OBJ_PALETTE_8 | 0x3cd,
    0xe2, 0x1e5, OBJ_PALETTE_8 | 0x206,
    0xe7, OBJ_SIZE_16x16 | 0x1e3, OBJ_PALETTE_8 | 0x226,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2b, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xeb, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x209,
    0xfb, OBJ_X_FLIP | 0x23, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x265,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x26, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x266
};

static const u16 sFrameData_3b71c0_Frame6[] = {
    27,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    0xf8, 0x1da, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_SIZE_16x32 | 0x1d2, OBJ_PALETTE_8 | 0x22a,
    0xf3, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_SIZE_16x16 | 0x1d6, OBJ_PALETTE_8 | 0x326,
    0xf8, 0x1d6, OBJ_PALETTE_8 | 0x366,
    0xe7, 0x1ea, OBJ_PALETTE_8 | 0x227,
    0xef, 0x1ea, OBJ_PALETTE_8 | 0x247,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1e2, OBJ_PALETTE_8 | 0x226,
    0xe4, OBJ_X_FLIP | 0x1d, OBJ_PALETTE_8 | 0x203,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x225,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x29, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xe6, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x209,
    0xf6, OBJ_X_FLIP | 0x21, OBJ_PALETTE_8 | 0x249,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x22, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x1a, OBJ_PALETTE_8 | 0x38a
};

static const u16 sFrameData_3b71c0_Frame7[] = {
    25,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_8x32 | 0x1ce, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1d6, OBJ_PALETTE_8 | 0x209,
    0x7, 0x1d6, OBJ_PALETTE_8 | 0x249,
    0xf1, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_SIZE_16x16 | 0x1cf, OBJ_PALETTE_8 | 0x326,
    0xf8, 0x1cf, OBJ_PALETTE_8 | 0x366,
    0xe8, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x2e7,
    0xe8, 0x1d6, OBJ_PALETTE_8 | 0x2e6,
    0xe5, OBJ_X_FLIP | 0x20, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xed, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x20, OBJ_PALETTE_8 | 0x22a,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x344,
    0xe4, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f, OBJ_PALETTE_8 | 0x38b,
    OBJ_SHAPE_VERTICAL | 0xda, OBJ_X_FLIP | 0x17, OBJ_PALETTE_8 | 0x38d,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x206
};

static const u16 sFrameData_3b7208_Frame0[] = {
    23,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xf3, OBJ_SIZE_8x32 | 0x1cd, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xeb, 0x1d5, OBJ_PALETTE_8 | 0x209,
    0xfb, 0x1d5, OBJ_PALETTE_8 | 0x249,
    0xee, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x263,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1e8, OBJ_PALETTE_8 | 0x265,
    0xdd, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1da, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x266,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1d, OBJ_PALETTE_8 | 0x20c,
    0x8, OBJ_X_FLIP | 0x1d, OBJ_PALETTE_8 | 0x28c,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x11, OBJ_PALETTE_8 | 0x344,
    0xe5, OBJ_X_FLIP | 0x19, OBJ_PALETTE_8 | 0x324,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x3cb,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x226,
    0xde, OBJ_X_FLIP | 0x15, OBJ_PALETTE_8 | 0x206
};

static const u16 sFrameData_3b7208_Frame1[] = {
    25,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    0xe4, 0x1db, OBJ_PALETTE_8 | 0x203,
    0xec, OBJ_SIZE_16x16 | 0x1db, OBJ_PALETTE_8 | 0x223,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1eb, OBJ_PALETTE_8 | 0x225,
    OBJ_SHAPE_VERTICAL | 0xee, OBJ_SIZE_8x32 | 0x1cf, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1d7, OBJ_PALETTE_8 | 0x209,
    0xf6, 0x1d7, OBJ_PALETTE_8 | 0x249,
    0xe5, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x226,
    0xdd, 0x1e1, OBJ_PALETTE_8 | 0x206,
    0xda, OBJ_SIZE_16x16 | 0x1cf, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1df, OBJ_PALETTE_8 | 0x38a,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x1e, OBJ_PALETTE_8 | 0x20c,
    0x10, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x28c,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x17, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x19, OBJ_PALETTE_8 | 0x3cd,
    0xe2, OBJ_X_FLIP | 0x13, OBJ_PALETTE_8 | 0x206,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_PALETTE_8 | 0x226
};

static const u16 sFrameData_3b7208_Frame2[] = {
    26,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    0xed, OBJ_SIZE_16x16 | 0x1d7, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xed, 0x1e7, OBJ_PALETTE_8 | 0x2a5,
    OBJ_SHAPE_VERTICAL | 0xf6, OBJ_SIZE_8x32 | 0x1cf, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1d7, OBJ_PALETTE_8 | 0x209,
    0xfe, 0x1d7, OBJ_PALETTE_8 | 0x249,
    0xe6, OBJ_SIZE_16x16 | 0x1e1, OBJ_PALETTE_8 | 0x226,
    0xde, 0x1e1, OBJ_PALETTE_8 | 0x206,
    0xda, OBJ_SIZE_16x16 | 0x1ce, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1de, OBJ_PALETTE_8 | 0x38a,
    0xf8, OBJ_X_FLIP | 0x1e, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1e, OBJ_PALETTE_8 | 0x22a,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1a, OBJ_PALETTE_8 | 0x326,
    0xf8, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x366,
    0xe7, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x227,
    0xef, OBJ_X_FLIP | 0xe, OBJ_PALETTE_8 | 0x247,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x16, OBJ_PALETTE_8 | 0x226
};

static const u16 sFrameData_3b7208_Frame3[] = {
    25,
    0xf9, OBJ_SIZE_16x16 | 0x1e0, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, 0x1e0, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_SIZE_16x32 | 0x1e4, OBJ_PALETTE_8 | 0x380,
    0x1d, 0x1f4, OBJ_PALETTE_8 | 0x3e2,
    0xf9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x10, OBJ_PALETTE_8 | 0x322,
    OBJ_SHAPE_HORIZONTAL | 0x9, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x362,
    OBJ_SHAPE_VERTICAL | 0x5, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0xc, OBJ_PALETTE_8 | 0x380,
    0x1d, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x3e2,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_SIZE_8x32 | 0x1ce, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1d6, OBJ_PALETTE_8 | 0x209,
    0x7, 0x1d6, OBJ_PALETTE_8 | 0x249,
    0xf1, OBJ_SIZE_16x16 | 0x1d8, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, 0x1e8, OBJ_PALETTE_8 | 0x2e5,
    0xdd, OBJ_SIZE_16x16 | 0x1ca, OBJ_PALETTE_8 | 0x388,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1da, OBJ_PALETTE_8 | 0x38a,
    0xe3, OBJ_SIZE_16x16 | 0x1de, OBJ_PALETTE_8 | 0x266,
    OBJ_SHAPE_VERTICAL | 0xff, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x2a, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x209,
    0x7, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x249,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x18, OBJ_PALETTE_8 | 0x2e3,
    OBJ_SHAPE_VERTICAL | 0xf1, OBJ_X_FLIP | 0x10, OBJ_PALETTE_8 | 0x2e5,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x21, OBJ_PALETTE_8 | 0x326,
    0xf8, OBJ_X_FLIP | 0x29, OBJ_PALETTE_8 | 0x366,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x12, OBJ_PALETTE_8 | 0x2e7,
    0xe8, OBJ_X_FLIP | 0x22, OBJ_PALETTE_8 | 0x2e6
};

static const u16 sFrameData_3b7320_Frame0[] = {
    4,
    0xfb, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfb, 0x1fa, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_SIZE_16x32 | 0x1ed, OBJ_PALETTE_8 | 0x380,
    0x18, 0x1fd, OBJ_PALETTE_8 | 0x3e2
};

static const u16 sFrameData_3b7330_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_SIZE_8x32 | 0x1df, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1e7, OBJ_PALETTE_8 | 0x209,
    0xa, 0x1e7, OBJ_PALETTE_8 | 0x249,
    0xf7, OBJ_SIZE_16x16 | 0x1ea, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1fa, OBJ_PALETTE_8 | 0x2a5
};

static const u16 sFrameData_3b7340_Frame0[] = {
    4,
    0xf5, OBJ_SIZE_16x16 | 0x1db, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xf5, 0x1eb, OBJ_PALETTE_8 | 0x3ca,
    0xf7, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x2a7,
    0xf7, 0x1e9, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b7350_Frame0[] = {
    4,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x280,
    OBJ_SHAPE_VERTICAL | 0xfb, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x282,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x3, OBJ_PALETTE_8 | 0x380,
    0x18, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x3e2
};

static const u16 sFrameData_3b7360_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0x2, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0x19, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | 0x11, OBJ_PALETTE_8 | 0x209,
    0xa, OBJ_X_FLIP | 0x11, OBJ_PALETTE_8 | 0x249,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x2a3,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x2a5
};

static const u16 sFrameData_3b7370_Frame0[] = {
    4,
    0xf5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_PALETTE_8 | 0x3c8,
    OBJ_SHAPE_VERTICAL | 0xf5, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x3ca,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x2a7,
    0xf7, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x2a6
};

static const u16 sFrameData_3b72c0_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_16x32 | 0x1f4, OBJ_PALETTE_12 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_8x32 | 0x4, OBJ_PALETTE_12 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_12 | 0x28d,
    0xf8, 0x4, OBJ_PALETTE_12 | 0x28f
};

static const u16 sFrameData_3b72c0_Frame1[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_16x32 | 0x1f4, OBJ_PALETTE_12 | 0x210,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_8x32 | 0x4, OBJ_PALETTE_12 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_12 | 0x290,
    0xf8, 0x4, OBJ_PALETTE_12 | 0x292
};

static const u16 sFrameData_3b72c0_Frame2[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_16x32 | 0x1f4, OBJ_PALETTE_12 | 0x213,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_SIZE_8x32 | 0x4, OBJ_PALETTE_12 | 0x215,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_12 | 0x293,
    0xf8, 0x4, OBJ_PALETTE_12 | 0x295
};

static const u16 sFrameData_3b72e0_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_12 | 0x216
};

static const u16 sFrameData_3b72e0_Frame1[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_12 | 0x296
};

static const u16 sFrameData_3b72e0_Frame2[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_12 | 0x316
};

static const u16 sFrameData_3b7300_Frame0[] = {
    2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_12 | 0x328,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_12 | 0x368
};

static const u16 sFrameData_3b7300_Frame1[] = {
    2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_12 | 0x32a,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_12 | 0x36a
};

static const u16 sFrameData_3b7300_Frame2[] = {
    2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_12 | 0x32c,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_12 | 0x36c
};

static const u16 sFrameData_3b7288_Frame0[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_8 | 0x2a9
};

static const u16 sFrameData_3b7288_Frame1[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_8 | 0x2ac,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x2cb
};

static const u16 sFrameData_3b7288_Frame2[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_8 | 0x2ae,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_8 | 0x2d0
};

static const u16 sFrameData_3b7288_Frame3[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_8 | 0x2b1,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_8 | 0x2d3
};

static const u16 sFrameData_3b7288_Frame4[] = {
    1,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_8 | 0x2b4
};

static const u16 sFrameData_3b7288_Frame5[] = {
    2,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f8, OBJ_PALETTE_8 | 0x30f,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f0, OBJ_PALETTE_8 | 0x34e
};

const struct FrameData sFrameData_3b6f08[5] = {
    [0] = {
        .pFrame = sFrameData_3b6f08_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_3b6f08_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_3b6f08_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFrameData_3b6f08_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6f30[2] = {
    [0] = {
        .pFrame = sFrameData_3b6f08_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6f40[3] = {
    [0] = {
        .pFrame = sFrameData_3b6f40_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_3b6f40_Frame1,
        .timer = 6
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6f58[2] = {
    [0] = {
        .pFrame = sFrameData_3b6f58_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6f68[5] = {
    [0] = {
        .pFrame = sFrameData_3b6f58_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_3b6f68_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_3b6f68_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFrameData_3b6f68_Frame1,
        .timer = 6
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6f90[3] = {
    [0] = {
        .pFrame = sFrameData_3b6f40_Frame1,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_3b6f40_Frame0,
        .timer = 6
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6fa8[3] = {
    [0] = {
        .pFrame = sFrameData_3b6f58_Frame0,
        .timer = 20
    },
    [1] = {
        .pFrame = sFrameData_3b6fa8_Frame1,
        .timer = 14
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6fc0[2] = {
    [0] = {
        .pFrame = sFrameData_3b6fc0_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6fd0[3] = {
    [0] = {
        .pFrame = sFrameData_3b6fc0_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_3b6fd0_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b6fe8[5] = {
    [0] = {
        .pFrame = sFrameData_3b6fe8_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sFrameData_3b6fe8_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sFrameData_3b6fe8_Frame0,
        .timer = 3
    },
    [3] = {
        .pFrame = sFrameData_3b6fd0_Frame1,
        .timer = 12
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7010[3] = {
    [0] = {
        .pFrame = sFrameData_3b6fa8_Frame1,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_3b6f58_Frame0,
        .timer = 6
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7028[7] = {
    [0] = {
        .pFrame = sFrameData_3b6f08_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3b6f08_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3b6f08_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3b6f40_Frame0,
        .timer = 2
    },
    [4] = {
        .pFrame = sFrameData_3b6f08_Frame2,
        .timer = 2
    },
    [5] = {
        .pFrame = sFrameData_3b6f08_Frame1,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7060[5] = {
    [0] = {
        .pFrame = sFrameData_3b7060_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_3b7060_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sFrameData_3b7060_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sFrameData_3b7060_Frame1,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7088[5] = {
    [0] = {
        .pFrame = sFrameData_3b7060_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3b7088_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3b7088_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3b7088_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b70b0[9] = {
    [0] = {
        .pFrame = sFrameData_3b70b0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3b70b0_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3b70b0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3b70b0_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sFrameData_3b70b0_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sFrameData_3b70b0_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sFrameData_3b70b0_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sFrameData_3b70b0_Frame7,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b70f8[5] = {
    [0] = {
        .pFrame = sFrameData_3b70f8_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3b70f8_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3b70f8_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3b70f8_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7120[4] = {
    [0] = {
        .pFrame = sFrameData_3b7120_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_3b7120_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sFrameData_3b7120_Frame2,
        .timer = 255
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7140[2] = {
    [0] = {
        .pFrame = sFrameData_3b7120_Frame0,
        .timer = 4
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7150[7] = {
    [0] = {
        .pFrame = sFrameData_3b7150_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_3b7150_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sFrameData_3b7150_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sFrameData_3b7150_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sFrameData_3b7150_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sFrameData_3b7150_Frame5,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7188[2] = {
    [0] = {
        .pFrame = sFrameData_3b7120_Frame2,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7198[5] = {
    [0] = {
        .pFrame = sFrameData_3b7120_Frame2,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3b7198_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3b7198_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3b7198_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b71c0[9] = {
    [0] = {
        .pFrame = sFrameData_3b71c0_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3b71c0_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3b71c0_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3b71c0_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sFrameData_3b71c0_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sFrameData_3b71c0_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sFrameData_3b71c0_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sFrameData_3b71c0_Frame7,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7208[5] = {
    [0] = {
        .pFrame = sFrameData_3b7208_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3b7208_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3b7208_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3b7208_Frame3,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7230[2] = {
    [0] = {
        .pFrame = sFrameData_3b7230_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7240[4] = {
    [0] = {
        .pFrame = sFrameData_3b7240_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sFrameData_3b7240_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sFrameData_3b7240_Frame0,
        .timer = 4
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7260[5] = {
    [0] = {
        .pFrame = sFrameData_3b7240_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sFrameData_3b7240_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sFrameData_3b7240_Frame0,
        .timer = 2
    },
    [3] = {
        .pFrame = sFrameData_3b7230_Frame0,
        .timer = 2
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7288[7] = {
    [0] = {
        .pFrame = sFrameData_3b7288_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sFrameData_3b7288_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sFrameData_3b7288_Frame2,
        .timer = 6
    },
    [3] = {
        .pFrame = sFrameData_3b7288_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sFrameData_3b7288_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sFrameData_3b7288_Frame5,
        .timer = 6
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b72c0[4] = {
    [0] = {
        .pFrame = sFrameData_3b72c0_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sFrameData_3b72c0_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sFrameData_3b72c0_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b72e0[4] = {
    [0] = {
        .pFrame = sFrameData_3b72e0_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sFrameData_3b72e0_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sFrameData_3b72e0_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7300[4] = {
    [0] = {
        .pFrame = sFrameData_3b7300_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sFrameData_3b7300_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sFrameData_3b7300_Frame2,
        .timer = 3
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7320[2] = {
    [0] = {
        .pFrame = sFrameData_3b7320_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7330[2] = {
    [0] = {
        .pFrame = sFrameData_3b7330_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7340[2] = {
    [0] = {
        .pFrame = sFrameData_3b7340_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7350[2] = {
    [0] = {
        .pFrame = sFrameData_3b7350_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7360[2] = {
    [0] = {
        .pFrame = sFrameData_3b7360_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sFrameData_3b7370[2] = {
    [0] = {
        .pFrame = sFrameData_3b7370_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
