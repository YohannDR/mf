#include "data/sprites/zazabi.h"
#include "macros.h"
#include "sprites_AI/zazabi.h"

static const s16 sZazabiMultiOam_Idle4_Frame2[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    29, -72, 0,
    12, 24, 0,
    51, 8, 0,
    26, 8, 0,
    8, 136, 0,
    4, 196, 0,
    0, 244, 0
};

static const s16 sZazabiMultiOam_Idle4_Frame1[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    29, -76, 0,
    12, 20, 0,
    51, 4, 0,
    26, 4, 0,
    8, 132, 0,
    4, 188, 0,
    0, 236, 0
};

static const s16 sZazabiMultiOam_Crawling4_Frame2[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    29, -80, 0,
    12, 16, 0,
    51, 0, 0,
    26, 0, 0,
    8, 124, 0,
    4, 180, 0,
    0, 228, 0
};

static const s16 sZazabiMultiOam_Idle4_Frame0[ZAZABI_PART_END * 3] = {
    19, 276, 0,
    52, 368, 0,
    29, -92, 0,
    12, 4, 0,
    51, -12, 0,
    26, -12, 0,
    8, 108, 0,
    4, 164, 0,
    0, 212, 0
};

static const s16 sZazabiMultiOam_Crawling4_Frame4[ZAZABI_PART_END * 3] = {
    20, 280, 0,
    52, 368, 0,
    29, -96, 0,
    12, 0, 0,
    51, -16, 0,
    26, -16, 0,
    8, 108, 0,
    4, 164, 0,
    0, 216, 0
};

static const s16 sZazabiMultiOam_JumpWarning4_Frame0[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    30, -60, 0,
    12, 36, 0,
    51, 20, 0,
    26, 20, 0,
    8, 136, 0,
    4, 192, 0,
    0, 240, 0
};

static const s16 sZazabiMultiOam_JumpWarning4_Frame1[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    30, -24, 0,
    12, 72, 0,
    51, 56, 0,
    26, 56, 0,
    8, 164, 0,
    4, 216, 0,
    0, 260, 0
};

static const s16 sZazabiMultiOam_JumpingSmall4_Frame0[ZAZABI_PART_END * 3] = {
    20, 264, 0,
    52, 368, 0,
    31, -112, 0,
    12, -16, 0,
    51, -32, 0,
    26, -32, 0,
    8, 96, 0,
    4, 152, 0,
    0, 200, 0
};

static const s16 sZazabiMultiOam_JumpingSmall4_Frame1[ZAZABI_PART_END * 3] = {
    20, 268, 0,
    52, 368, 0,
    32, -128, 0,
    12, -32, 0,
    51, -48, 0,
    26, -48, 0,
    8, 88, 0,
    4, 152, 0,
    0, 204, 0
};

static const s16 sZazabiMultiOam_JumpingSmall4_Frame2[ZAZABI_PART_END * 3] = {
    20, 268, 0,
    52, 368, 0,
    33, -116, 0,
    12, -20, 0,
    51, -36, 0,
    26, -36, 0,
    8, 92, 0,
    4, 152, 0,
    0, 204, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened4_Frame0[ZAZABI_PART_END * 3] = {
    21, 248, 0,
    22, 248, 0,
    30, -92, 0,
    12, 4, 0,
    51, -12, 0,
    26, -12, 0,
    8, 104, 0,
    4, 148, 0,
    0, 192, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened4_Frame1[ZAZABI_PART_END * 3] = {
    23, 216, 0,
    24, 216, 0,
    30, -84, 0,
    12, 12, 0,
    51, -4, 0,
    26, -4, 0,
    8, 96, 0,
    4, 132, 0,
    0, 164, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened4_Frame2[ZAZABI_PART_END * 3] = {
    25, 196, 0,
    52, 368, 0,
    30, -72, 0,
    12, 24, 0,
    51, 8, 0,
    26, 8, 0,
    8, 100, 0,
    4, 124, 0,
    0, 140, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened4_Frame3[ZAZABI_PART_END * 3] = {
    23, 216, 0,
    24, 216, 0,
    30, -32, 0,
    12, 64, 0,
    51, 48, 0,
    26, 48, 0,
    8, 144, 0,
    4, 152, 0,
    0, 184, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened4_Frame4[ZAZABI_PART_END * 3] = {
    21, 248, 0,
    22, 248, 0,
    30, -8, 0,
    12, 88, 0,
    51, 72, 0,
    26, 72, 0,
    8, 164, 0,
    4, 188, 0,
    0, 184, 0
};

static const s16 sZazabiMultiOam_FallingSlow4_Frame5[ZAZABI_PART_END * 3] = {
    19, 264, 0,
    52, 368, 0,
    30, 4, 0,
    12, 100, 0,
    51, 84, 0,
    26, 84, 0,
    8, 180, 0,
    4, 220, 0,
    0, 184, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen4_Frame0[ZAZABI_PART_END * 3] = {
    16, 300, 0,
    52, 368, 0,
    31, 68, 0,
    12, 164, 0,
    51, 148, 0,
    26, 148, 0,
    8, 224, 0,
    4, 252, 0,
    0, 272, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen4_Frame1[ZAZABI_PART_END * 3] = {
    17, 292, 0,
    52, 368, 0,
    31, 24, 0,
    12, 120, 0,
    51, 104, 0,
    26, 104, 0,
    8, 200, 0,
    4, 228, 0,
    0, 256, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen4_Frame2[ZAZABI_PART_END * 3] = {
    17, 292, 0,
    52, 368, 0,
    32, 28, 0,
    12, 124, 0,
    51, 108, 0,
    26, 108, 0,
    8, 204, 0,
    4, 232, 0,
    0, 260, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen4_Frame3[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    32, -12, 0,
    12, 84, 0,
    51, 68, 0,
    26, 68, 0,
    8, 172, 0,
    4, 208, 0,
    0, 248, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen4_Frame4[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    33, -8, 0,
    12, 88, 0,
    51, 72, 0,
    26, 72, 0,
    8, 176, 0,
    4, 212, 0,
    0, 252, 0
};

static const s16 sZazabiMultiOam_FallingSlow4_Frame2[ZAZABI_PART_END * 3] = {
    20, 200, 0,
    52, 368, 0,
    30, -72, 0,
    12, 24, 0,
    51, 8, 0,
    26, 8, 0,
    8, 100, 0,
    4, 124, 0,
    0, 140, 0
};

static const s16 sZazabiMultiOam_EatingSamus1_Frame0[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -80, 0,
    12, 16, 0,
    51, 0, 0,
    27, 0, 0,
    8, 124, 0,
    4, 180, 0,
    1, 228, 0
};

static const s16 sZazabiMultiOam_EatingSamus1_Frame1[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -76, 0,
    12, 20, 0,
    51, 4, 0,
    27, 4, 0,
    8, 132, 0,
    4, 188, 0,
    1, 236, 0
};

static const s16 sZazabiMultiOam_EatingSamus1_Frame2[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -72, 0,
    12, 24, 0,
    51, 8, 0,
    27, 8, 0,
    8, 136, 0,
    4, 196, 0,
    1, 244, 0
};

static const s16 sZazabiMultiOam_EatingSamus2_Frame0[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -80, 0,
    12, 16, 0,
    51, 0, 0,
    27, 0, 0,
    8, 124, 0,
    7, 180, 0,
    2, 228, 0
};

static const s16 sZazabiMultiOam_EatingSamus2_Frame1[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -76, 0,
    12, 20, 0,
    51, 4, 0,
    27, 4, 0,
    8, 132, 0,
    7, 188, 0,
    2, 236, 0
};

static const s16 sZazabiMultiOam_EatingSamus2_Frame2[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -72, 0,
    12, 24, 0,
    51, 8, 0,
    27, 8, 0,
    8, 136, 0,
    7, 196, 0,
    2, 244, 0
};

static const s16 sZazabiMultiOam_EatingSamus3_4_Frame0[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -80, 0,
    12, 16, 0,
    51, 0, 0,
    27, 0, 0,
    8, 124, 0,
    5, 180, 0,
    0, 228, 0
};

static const s16 sZazabiMultiOam_EatingSamus3_4_Frame1[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -76, 0,
    12, 20, 0,
    51, 4, 0,
    27, 4, 0,
    8, 132, 0,
    5, 188, 0,
    0, 236, 0
};

static const s16 sZazabiMultiOam_EatingSamus3_4_Frame2[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -72, 0,
    12, 24, 0,
    51, 8, 0,
    27, 8, 0,
    8, 136, 0,
    5, 196, 0,
    0, 244, 0
};

static const s16 sZazabiMultiOam_EatingSamus4_4_Frame0[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -80, 0,
    15, 16, 0,
    51, 0, 0,
    27, 0, 0,
    11, 124, 0,
    6, 180, 0,
    0, 228, 0
};

static const s16 sZazabiMultiOam_EatingSamus4_4_Frame1[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -76, 0,
    15, 20, 0,
    51, 4, 0,
    27, 4, 0,
    11, 132, 0,
    6, 188, 0,
    0, 236, 0
};

static const s16 sZazabiMultiOam_EatingSamus4_4_Frame2[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -72, 0,
    15, 24, 0,
    51, 8, 0,
    27, 8, 0,
    11, 136, 0,
    6, 196, 0,
    0, 244, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_4_Frame0[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -80, 0,
    13, 16, 0,
    51, 0, 0,
    27, 0, 0,
    9, 124, 0,
    4, 180, 0,
    0, 228, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_4_Frame1[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -76, 0,
    13, 20, 0,
    51, 4, 0,
    27, 4, 0,
    9, 132, 0,
    4, 188, 0,
    0, 236, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_4_Frame2[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -72, 0,
    13, 24, 0,
    51, 8, 0,
    27, 8, 0,
    9, 136, 0,
    4, 196, 0,
    0, 244, 0
};

static const s16 sZazabi_36acee[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -80, 0,
    14, 16, 0,
    51, 0, 0,
    27, 0, 0,
    10, 124, 0,
    7, 180, 0,
    0, 228, 0
};

static const s16 sZazabi_36ad24[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -76, 0,
    14, 20, 0,
    51, 4, 0,
    27, 4, 0,
    10, 132, 0,
    7, 188, 0,
    0, 236, 0
};

static const s16 sZazabi_36ad5a[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -72, 0,
    14, 24, 0,
    51, 8, 0,
    27, 8, 0,
    10, 136, 0,
    7, 196, 0,
    0, 244, 0
};

static const s16 sZazabi_36ad90[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -80, 0,
    12, 16, 0,
    51, 0, 0,
    27, 0, 0,
    8, 124, 0,
    6, 180, 0,
    3, 228, 0
};

static const s16 sZazabi_36adc6[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -76, 0,
    12, 20, 0,
    51, 4, 0,
    27, 4, 0,
    8, 132, 0,
    6, 188, 0,
    3, 236, 0
};

static const s16 sZazabi_36adfc[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -72, 0,
    12, 24, 0,
    51, 8, 0,
    27, 8, 0,
    8, 136, 0,
    6, 196, 0,
    3, 244, 0
};

static const s16 sZazabi_36ae32[ZAZABI_PART_END * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -80, 0,
    12, 16, 0,
    51, 0, 0,
    27, 0, 0,
    8, 124, 0,
    4, 180, 0,
    2, 228, 0
};

static const s16 sZazabi_36ae68[ZAZABI_PART_END * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -76, 0,
    12, 20, 0,
    51, 4, 0,
    27, 4, 0,
    8, 132, 0,
    4, 188, 0,
    2, 236, 0
};

static const s16 sZazabi_36ae9e[ZAZABI_PART_END * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -72, 0,
    12, 24, 0,
    51, 8, 0,
    26, 8, 0,
    8, 136, 0,
    4, 196, 0,
    2, 244, 0
};

static const s16 sZazabiMultiOam_JumpingBigRight4_Frame0[ZAZABI_PART_END * 3] = {
    20, 264, 0,
    52, 368, 0,
    41, -112, -32,
    35, -16, -32,
    51, -48, 0,
    53, -16, -32,
    39, 92, -4,
    4, 152, 0,
    0, 200, 0
};

static const s16 sZazabiMultiOam_JumpingBigRight4_Frame1[ZAZABI_PART_END * 3] = {
    20, 268, 0,
    52, 368, 0,
    42, -132, -40,
    35, -36, -36,
    51, -64, 0,
    53, -36, -36,
    39, 80, -4,
    4, 152, 0,
    0, 204, 0
};

static const s16 sZazabiMultiOam_JumpingBigRight4_Frame2[ZAZABI_PART_END * 3] = {
    20, 268, 0,
    52, 368, 0,
    43, -116, -36,
    35, -20, -32,
    51, -52, 0,
    53, -20, -32,
    39, 88, -4,
    4, 152, 0,
    0, 204, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft4_Frame2[ZAZABI_PART_END * 3] = {
    21, 248, 0,
    22, 248, 0,
    44, -92, -36,
    35, 4, -32,
    51, -28, -32,
    53, 4, -32,
    39, 100, -4,
    4, 148, 0,
    0, 192, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft4_Frame3[ZAZABI_PART_END * 3] = {
    23, 216, 0,
    24, 216, 0,
    44, -84, -36,
    35, 12, -32,
    51, -20, -32,
    53, 12, -32,
    39, 88, -4,
    4, 132, 0,
    0, 164, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft4_Frame4[ZAZABI_PART_END * 3] = {
    25, 196, 0,
    52, 368, 0,
    44, -76, -36,
    35, 20, -32,
    51, -12, -32,
    53, 20, -32,
    39, 96, -4,
    4, 124, 0,
    0, 140, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft4_Frame5[ZAZABI_PART_END * 3] = {
    23, 216, 0,
    24, 216, 0,
    45, -32, -12,
    36, 64, -8,
    51, 32, -8,
    54, 64, -8,
    8, 144, 0,
    4, 152, 0,
    0, 184, 0
};

static const s16 sZazabiMultiOam_JumpingBigLeft4_Frame0[ZAZABI_PART_END * 3] = {
    20, 264, 0,
    52, 368, 0,
    46, -112, 32,
    37, -16, 32,
    51, -48, 0,
    55, -16, 32,
    40, 92, 4,
    4, 152, 0,
    0, 200, 0
};

static const s16 sZazabiMultiOam_JumpingBigLeft4_Frame1[ZAZABI_PART_END * 3] = {
    20, 268, 0,
    52, 368, 0,
    47, -132, 40,
    37, -36, 36,
    51, -64, 0,
    55, -36, 36,
    40, 80, 4,
    4, 152, 0,
    0, 204, 0
};

static const s16 sZazabiMultiOam_JumpingBigLeft4_Frame2[ZAZABI_PART_END * 3] = {
    20, 268, 0,
    52, 368, 0,
    48, -116, 36,
    37, -20, 32,
    51, -52, 0,
    55, -20, 32,
    40, 88, 4,
    4, 152, 0,
    0, 204, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight4_Frame2[ZAZABI_PART_END * 3] = {
    21, 248, 0,
    22, 248, 0,
    49, -92, 36,
    37, 4, 32,
    51, -28, 0,
    55, 4, 32,
    40, 100, 4,
    4, 148, 0,
    0, 192, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight4_Frame3[ZAZABI_PART_END * 3] = {
    23, 216, 0,
    24, 216, 0,
    49, -84, 36,
    37, 12, 32,
    51, -20, 0,
    55, 12, 32,
    40, 88, 4,
    4, 132, 0,
    0, 164, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight4_Frame4[ZAZABI_PART_END * 3] = {
    25, 196, 0,
    52, 368, 0,
    49, -76, 36,
    37, 20, 32,
    51, -12, 32,
    55, 20, 32,
    40, 96, 4,
    4, 124, 0,
    0, 140, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight4_Frame5[ZAZABI_PART_END * 3] = {
    23, 216, 0,
    24, 216, 0,
    50, -32, 12,
    38, 64, 8,
    51, 32, 8,
    56, 64, 8,
    8, 144, 0,
    4, 152, 0,
    0, 184, 0
};

static const s16 sZazabiMultiOam_FallingLeft4_Frame4[ZAZABI_PART_END * 3] = {
    20, 200, 0,
    52, 368, 0,
    44, -76, -36,
    35, 20, -32,
    51, -12, -32,
    53, 20, -32,
    39, 96, -4,
    4, 124, 0,
    0, 140, 0
};

static const s16 sZazabiMultiOam_FallingRight4_Frame4[ZAZABI_PART_END * 3] = {
    20, 200, 0,
    52, 368, 0,
    49, -76, 36,
    37, 20, 32,
    51, -12, 32,
    55, 20, 32,
    40, 96, 4,
    4, 124, 0,
    0, 140, 0
};

static const s16 sZazabiMultiOam_FallingSlow4_Frame0[ZAZABI_PART_END * 3] = {
    20, 248, 0,
    52, 368, 0,
    30, -92, 0,
    12, 4, 0,
    51, -12, 0,
    26, -12, 0,
    8, 104, 0,
    4, 148, 0,
    0, 192, 0
};

static const s16 sZazabiMultiOam_FallingSlow4_Frame1[ZAZABI_PART_END * 3] = {
    20, 216, 0,
    52, 368, 0,
    30, -84, 0,
    12, 12, 0,
    51, -4, 0,
    26, -4, 0,
    8, 96, 0,
    4, 132, 0,
    0, 164, 0
};

static const s16 sZazabiMultiOam_FallingSlow4_Frame3[ZAZABI_PART_END * 3] = {
    20, 216, 0,
    52, 368, 0,
    30, -32, 0,
    12, 64, 0,
    51, 48, 0,
    26, 48, 0,
    8, 144, 0,
    4, 152, 0,
    0, 184, 0
};

static const s16 sZazabiMultiOam_FallingSlow4_Frame4[ZAZABI_PART_END * 3] = {
    20, 248, 0,
    52, 368, 0,
    30, -8, 0,
    12, 88, 0,
    51, 72, 0,
    26, 72, 0,
    8, 164, 0,
    4, 188, 0,
    0, 184, 0
};

static const s16 sZazabiMultiOam_FallingLeft4_Frame2[ZAZABI_PART_END * 3] = {
    20, 248, 0,
    52, 368, 0,
    44, -92, -36,
    35, 4, -32,
    51, -28, -32,
    53, 4, -32,
    39, 100, -4,
    4, 148, 0,
    0, 192, 0
};

static const s16 sZazabiMultiOam_FallingLeft4_Frame3[ZAZABI_PART_END * 3] = {
    20, 216, 0,
    52, 368, 0,
    44, -84, -36,
    35, 12, -32,
    51, -20, -32,
    53, 12, -32,
    39, 88, -4,
    4, 132, 0,
    0, 164, 0
};

static const s16 sZazabiMultiOam_FallingLeft4_Frame5[ZAZABI_PART_END * 3] = {
    20, 216, 0,
    52, 368, 0,
    45, -32, -12,
    36, 64, -8,
    51, 32, -8,
    54, 64, -8,
    8, 144, 0,
    4, 152, 0,
    0, 184, 0
};

static const s16 sZazabiMultiOam_FallingRight4_Frame2[ZAZABI_PART_END * 3] = {
    20, 248, 0,
    52, 368, 0,
    49, -92, 36,
    37, 4, 32,
    51, -28, 0,
    55, 4, 32,
    40, 100, 4,
    4, 148, 0,
    0, 192, 0
};

static const s16 sZazabiMultiOam_FallingRight4_Frame3[ZAZABI_PART_END * 3] = {
    20, 216, 0,
    52, 368, 0,
    49, -84, 36,
    37, 12, 32,
    51, -20, 0,
    55, 12, 32,
    40, 88, 4,
    4, 132, 0,
    0, 164, 0
};

static const s16 sZazabiMultiOam_FallingRight4_Frame5[ZAZABI_PART_END * 3] = {
    20, 216, 0,
    52, 368, 0,
    50, -32, 12,
    38, 64, 8,
    51, 32, 8,
    56, 64, 8,
    8, 144, 0,
    4, 152, 0,
    0, 184, 0
};


const struct FrameData sZazabiMultiOam_Idle4[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_Crawling4[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame2,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZazabiMultiOam_Crawling4_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame0,
        .timer = 8
    },
    [4] = {
        .pFrame = sZazabiMultiOam_Crawling4_Frame4,
        .timer = 10
    },
    [5] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame0,
        .timer = 8
    },
    [6] = {
        .pFrame = sZazabiMultiOam_Crawling4_Frame2,
        .timer = 8
    },
    [7] = {
        .pFrame = sZazabiMultiOam_Idle4_Frame1,
        .timer = 8
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpWarning4[3] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpWarning4_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpWarning4_Frame1,
        .timer = 16
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingSmall4[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingSmall4_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingSmall4_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingBigRight4[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight4_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight4_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingBigLeft4[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft4_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft4_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingSlow4[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame2,
        .timer = 100
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame5,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingSlowMouthOpened4[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame1,
        .timer = 6
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame2,
        .timer = 100
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame5,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingLeft4[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall4_Frame2,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight4_Frame2,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingLeft4_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingLeft4_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingLeft4_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingLeft4_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingMouthOpenedLeft4[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall4_Frame2,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight4_Frame2,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft4_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft4_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft4_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft4_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingRight4[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall4_Frame2,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft4_Frame2,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingRight4_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingRight4_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingRight4_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingRight4_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingMouthOpenedRight4[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall4_Frame2,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft4_Frame2,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight4_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight4_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight4_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight4_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_LandingMouthOpen4[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame4,
        .timer = 6
    },
    [5] = {
        .pFrame = sZazabiMultiOam_JumpWarning4_Frame0,
        .timer = 8
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_Landing4[3] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame3,
        .timer = 8
    },
    [2] =FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_SpittingSamus4[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall4_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame0,
        .timer = 5
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame1,
        .timer = 8
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened4_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow4_Frame5,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_LandingAfterSpitting4[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame0,
        .timer = 12
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen4_Frame3,
        .timer = 6
    },
    [3] = {
        .pFrame = sZazabiMultiOam_JumpWarning4_Frame0,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus1[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus1_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus1_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus1_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus1_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus2[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus2_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus2_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus2_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus2_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus3_4[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus3_4_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus3_4_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus3_4_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus3_4_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus4_4[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus4_4_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus4_4_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus4_4_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus4_4_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus5_4[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_4_Frame0,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_4_Frame1,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_4_Frame2,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_4_Frame1,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_36b840[5] = {
    [0] = {
        .pFrame = sZazabi_36acee,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabi_36ad24,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabi_36ad5a,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabi_36ad24,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_36b868[5] = {
    [0] = {
        .pFrame = sZazabi_36ad90,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabi_36adc6,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabi_36adfc,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabi_36adc6,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_36b890[5] = {
    [0] = {
        .pFrame = sZazabi_36ae32,
        .timer = 16
    },
    [1] = {
        .pFrame = sZazabi_36ae68,
        .timer = 16
    },
    [2] = {
        .pFrame = sZazabi_36ae9e,
        .timer = 16
    },
    [3] = {
        .pFrame = sZazabi_36ae68,
        .timer = 16
    },
    [4] = FRAME_DATA_TERMINATOR
};


static const s16 sZazabiMultiOam_Idle3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    29, -28, 0,
    12, 68, 0,
    51, 52, 0,
    26, 52, 0,
    8, 180, 0,
    4, 240, 0
};

static const s16 sZazabiMultiOam_Idle3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    29, -32, 0,
    12, 64, 0,
    51, 48, 0,
    26, 48, 0,
    8, 176, 0,
    4, 232, 0
};

static const s16 sZazabiMultiOam_Idle3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    29, -40, 0,
    12, 56, 0,
    51, 40, 0,
    26, 40, 0,
    8, 164, 0,
    4, 220, 0
};

static const s16 sZazabiMultiOam_Crawling3_Frame3[ZAZABI_PART_LOWER_SHELL * 3] = {
    19, 276, 0,
    52, 368, 0,
    29, -48, 0,
    12, 48, 0,
    51, 32, 0,
    26, 32, 0,
    8, 152, 0,
    4, 208, 0
};

static const s16 sZazabiMultiOam_Crawling3_Frame4[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 280, 0,
    52, 368, 0,
    29, -52, 0,
    12, 44, 0,
    51, 28, 0,
    26, 28, 0,
    8, 152, 0,
    4, 208, 0
};

static const s16 sZazabiMultiOam_JumpWarning3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    30, -16, 0,
    12, 80, 0,
    51, 64, 0,
    26, 64, 0,
    8, 180, 0,
    4, 236, 0
};

static const s16 sZazabiMultiOam_JumpWarning3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    30, 20, 0,
    12, 116, 0,
    51, 100, 0,
    26, 100, 0,
    8, 208, 0,
    4, 260, 0
};

static const s16 sZazabiMultiOam_JumpingSmall3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    31, -68, 0,
    12, 28, 0,
    51, 12, 0,
    26, 12, 0,
    8, 140, 0,
    4, 196, 0
};

static const s16 sZazabiMultiOam_JumpingSmall3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    32, -84, 0,
    12, 12, 0,
    51, -4, 0,
    26, -4, 0,
    8, 132, 0,
    4, 196, 0
};

static const s16 sZazabiMultiOam_JumpingSmall3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    33, -72, 0,
    12, 24, 0,
    51, 8, 0,
    26, 8, 0,
    8, 136, 0,
    4, 196, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    30, -48, 0,
    12, 48, 0,
    51, 32, 0,
    26, 32, 0,
    8, 148, 0,
    4, 192, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    30, -40, 0,
    12, 56, 0,
    51, 40, 0,
    26, 40, 0,
    8, 140, 0,
    4, 176, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    25, 196, 0,
    52, 368, 0,
    30, -28, 0,
    12, 68, 0,
    51, 52, 0,
    26, 52, 0,
    8, 144, 0,
    4, 168, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened3_Frame3[ZAZABI_PART_LOWER_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    30, 12, 0,
    12, 108, 0,
    51, 92, 0,
    26, 92, 0,
    8, 188, 0,
    4, 196, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened3_Frame4[ZAZABI_PART_LOWER_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    30, 36, 0,
    12, 132, 0,
    51, 116, 0,
    26, 116, 0,
    8, 208, 0,
    4, 232, 0
};

static const s16 sZazabiMultiOam_FallingSlow3_Frame5[ZAZABI_PART_LOWER_SHELL * 3] = {
    19, 264, 0,
    52, 368, 0,
    30, 48, 0,
    12, 144, 0,
    51, 128, 0,
    26, 128, 0,
    8, 224, 0,
    4, 264, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    16, 300, 0,
    52, 368, 0,
    31, 112, 0,
    12, 208, 0,
    51, 192, 0,
    26, 192, 0,
    8, 268, 0,
    4, 296, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 292, 0,
    52, 368, 0,
    31, 68, 0,
    12, 164, 0,
    51, 148, 0,
    26, 148, 0,
    8, 244, 0,
    4, 272, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 292, 0,
    52, 368, 0,
    32, 72, 0,
    12, 168, 0,
    51, 152, 0,
    26, 152, 0,
    8, 248, 0,
    4, 276, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen3_Frame3[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    32, 32, 0,
    12, 128, 0,
    51, 112, 0,
    26, 112, 0,
    8, 216, 0,
    4, 252, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen3_Frame4[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    33, 36, 0,
    12, 132, 0,
    51, 116, 0,
    26, 116, 0,
    8, 220, 0,
    4, 256, 0
};

static const s16 sZazabiMultiOam_FallingSlow3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 196, 0,
    52, 368, 0,
    30, -28, 0,
    12, 68, 0,
    51, 52, 0,
    26, 52, 0,
    8, 144, 0,
    4, 168, 0
};

static const s16 sZazabiMultiOam_EatingSamus3_3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -40, 0,
    12, 56, 0,
    51, 40, 0,
    27, 40, 0,
    8, 164, 0,
    5, 220, 0
};

static const s16 sZazabiMultiOam_EatingSamus3_3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -32, 0,
    12, 64, 0,
    51, 48, 0,
    27, 48, 0,
    8, 176, 0,
    5, 232, 0
};

static const s16 sZazabiMultiOam_EatingSamus3_3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -28, 0,
    12, 68, 0,
    51, 52, 0,
    27, 52, 0,
    8, 180, 0,
    5, 240, 0
};

static const s16 sZazabiMultiOam_EatingSamus4_3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -40, 0,
    15, 56, 0,
    51, 40, 0,
    27, 40, 0,
    11, 164, 0,
    6, 220, 0
};

static const s16 sZazabiMultiOam_EatingSamus4_3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -32, 0,
    15, 64, 0,
    51, 48, 0,
    27, 48, 0,
    11, 176, 0,
    6, 232, 0
};

static const s16 sZazabiMultiOam_EatingSamus4_3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -28, 0,
    15, 68, 0,
    51, 52, 0,
    27, 52, 0,
    11, 180, 0,
    6, 240, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -40, 0,
    13, 56, 0,
    51, 40, 0,
    27, 40, 0,
    9, 164, 0,
    4, 220, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -32, 0,
    13, 64, 0,
    51, 48, 0,
    27, 48, 0,
    9, 176, 0,
    4, 232, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -28, 0,
    13, 68, 0,
    51, 52, 0,
    27, 52, 0,
    9, 180, 0,
    4, 240, 0
};

static const s16 sZazabi_36be88[ZAZABI_PART_LOWER_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -40, 0,
    14, 56, 0,
    51, 40, 0,
    27, 40, 0,
    10, 164, 0,
    7, 220, 0
};

static const s16 sZazabi_36beb8[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -32, 0,
    14, 64, 0,
    51, 48, 0,
    27, 48, 0,
    10, 176, 0,
    7, 232, 0
};

static const s16 sZazabi_36bee8[ZAZABI_PART_LOWER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -28, 0,
    14, 68, 0,
    51, 52, 0,
    27, 52, 0,
    10, 180, 0,
    7, 240, 0
};

static const s16 sZazabi_36bf18[ZAZABI_PART_LOWER_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, -40, 0,
    12, 56, 0,
    51, 40, 0,
    27, 40, 0,
    8, 164, 0,
    6, 220, 0
};

static const s16 sZazabi_36bf48[ZAZABI_PART_LOWER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, -32, 0,
    12, 64, 0,
    51, 48, 0,
    27, 48, 0,
    8, 176, 0,
    6, 232, 0
};

static const s16 sZazabi_36bf78[ZAZABI_PART_LOWER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, -28, 0,
    12, 68, 0,
    51, 52, 0,
    27, 52, 0,
    8, 180, 0,
    6, 240, 0
};

static const s16 sZazabiMultiOam_JumpingBigRight3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    41, -64, -32,
    35, 32, -32,
    51, 16, 0,
    53, 32, -32,
    39, 140, -4,
    4, 196, 0
};

static const s16 sZazabiMultiOam_JumpingBigRight3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    42, -84, -40,
    35, 12, -36,
    51, 0, 0,
    53, 12, -36,
    39, 128, -4,
    4, 196, 0
};

static const s16 sZazabiMultiOam_JumpingBigRight3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    43, -68, -36,
    35, 28, -32,
    51, 12, 0,
    53, 28, -32,
    39, 136, -4,
    4, 196, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    44, -44, -36,
    35, 52, -32,
    51, 36, -32,
    53, 52, -32,
    39, 148, -4,
    4, 192, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft3_Frame3[ZAZABI_PART_LOWER_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    44, -36, -36,
    35, 60, -32,
    51, 44, -32,
    53, 60, -32,
    39, 136, -4,
    4, 180, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft3_Frame4[ZAZABI_PART_LOWER_SHELL * 3] = {
    25, 196, 0,
    52, 368, 0,
    44, -28, -36,
    35, 68, -32,
    51, 52, -32,
    53, 68, -32,
    39, 144, -4,
    4, 172, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft3_Frame5[ZAZABI_PART_LOWER_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    45, 16, -12,
    36, 112, -8,
    51, 96, -8,
    54, 112, -8,
    8, 192, 0,
    4, 200, 0
};

static const s16 sZazabiMultiOam_JumpingBigLeft3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    46, -64, 32,
    37, 32, 32,
    51, 16, 0,
    55, 32, 32,
    40, 140, 4,
    4, 196, 0
};

static const s16 sZazabiMultiOam_JumpingBigLeft3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    47, -84, 40,
    37, 12, 36,
    51, 0, 0,
    55, 12, 36,
    40, 128, 4,
    4, 196, 0
};

static const s16 sZazabiMultiOam_JumpingBigLeft3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    48, -68, 36,
    37, 28, 32,
    51, 12, 0,
    55, 28, 32,
    40, 136, 4,
    4, 196, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    49, -44, 36,
    37, 52, 32,
    51, 36, 0,
    55, 52, 32,
    40, 148, 4,
    4, 192, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight3_Frame3[ZAZABI_PART_LOWER_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    49, -36, 36,
    37, 60, 32,
    51, 44, 0,
    55, 60, 32,
    40, 136, 4,
    4, 180, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight3_Frame4[ZAZABI_PART_LOWER_SHELL * 3] = {
    25, 196, 0,
    52, 368, 0,
    49, -28, 36,
    37, 68, 32,
    51, 52, 32,
    55, 68, 32,
    40, 144, 4,
    4, 172, 0
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight3_Frame5[ZAZABI_PART_LOWER_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    50, 16, 12,
    38, 112, 8,
    51, 96, 8,
    56, 112, 8,
    8, 192, 0,
    4, 200, 0
};

static const s16 sZazabiMultiOam_FallingLeft3_Frame4[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 196, 0,
    52, 368, 0,
    44, -28, -36,
    35, 68, -32,
    51, 52, -32,
    53, 68, -32,
    39, 144, -4,
    4, 172, 0
};

static const s16 sZazabiMultiOam_FallingRight3_Frame4[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 196, 0,
    52, 368, 0,
    49, -28, 36,
    37, 68, 32,
    51, 52, 32,
    55, 68, 32,
    40, 144, 4,
    4, 172, 0
};

static const s16 sZazabiMultiOam_FallingSlow3_Frame0[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 248, 0,
    52, 368, 0,
    30, -48, 0,
    12, 48, 0,
    51, 32, 0,
    26, 32, 0,
    8, 148, 0,
    4, 192, 0
};

static const s16 sZazabiMultiOam_FallingSlow3_Frame1[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    30, -40, 0,
    12, 56, 0,
    51, 40, 0,
    26, 40, 0,
    8, 140, 0,
    4, 176, 0
};

static const s16 sZazabiMultiOam_FallingSlow3_Frame3[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    30, 12, 0,
    12, 108, 0,
    51, 92, 0,
    26, 92, 0,
    8, 188, 0,
    4, 196, 0
};

static const s16 sZazabiMultiOam_FallingSlow3_Frame4[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 248, 0,
    52, 368, 0,
    30, 36, 0,
    12, 132, 0,
    51, 116, 0,
    26, 116, 0,
    8, 208, 0,
    4, 232, 0
};

static const s16 sZazabiMultiOam_FallingLeft3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 248, 0,
    52, 368, 0,
    44, -44, -36,
    35, 52, -32,
    51, 36, -32,
    53, 52, -32,
    39, 148, -4,
    4, 192, 0
};

static const s16 sZazabiMultiOam_FallingLeft3_Frame3[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    44, -36, -36,
    35, 60, -32,
    51, 44, -32,
    53, 60, -32,
    39, 136, -4,
    4, 180, 0
};

static const s16 sZazabiMultiOam_FallingLeft3_Frame5[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    45, 16, -12,
    36, 112, -8,
    51, 96, -8,
    54, 112, -8,
    8, 192, 0,
    4, 200, 0
};

static const s16 sZazabiMultiOam_FallingRight3_Frame2[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 248, 0,
    52, 368, 0,
    49, -44, 36,
    37, 52, 32,
    51, 36, 0,
    55, 52, 32,
    40, 148, 4,
    4, 192, 0
};

static const s16 sZazabiMultiOam_FallingRight3_Frame3[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    49, -36, 36,
    37, 60, 32,
    51, 44, 0,
    55, 60, 32,
    40, 136, 4,
    4, 180, 0
};

static const s16 sZazabiMultiOam_FallingRight3_Frame5[ZAZABI_PART_LOWER_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    50, 16, 12,
    38, 112, 8,
    51, 96, 8,
    56, 112, 8,
    8, 192, 0,
    4, 200, 0
};


const struct FrameData sZazabiMultiOam_Idle3[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame0,
        .timer = 13
    },
    [1] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame1,
        .timer = 13
    },
    [2] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame2,
        .timer = 13
    },
    [3] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame1,
        .timer = 13
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_Crawling3[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame2,
        .timer = 7
    },
    [1] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame0,
        .timer = 7
    },
    [3] = {
        .pFrame = sZazabiMultiOam_Crawling3_Frame3,
        .timer = 7
    },
    [4] = {
        .pFrame = sZazabiMultiOam_Crawling3_Frame4,
        .timer = 8
    },
    [5] = {
        .pFrame = sZazabiMultiOam_Crawling3_Frame3,
        .timer = 7
    },
    [6] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame0,
        .timer = 7
    },
    [7] = {
        .pFrame = sZazabiMultiOam_Idle3_Frame1,
        .timer = 7
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpWarning3[3] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpWarning3_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpWarning3_Frame1,
        .timer = 13
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingSmall3[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall3_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingSmall3_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingSmall3_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingBigRight3[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight3_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight3_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight3_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingBigLeft3[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft3_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft3_Frame1,
        .timer = 7
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft3_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingSlow3[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame2,
        .timer = 100
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame5,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingSlowMouthOpened3[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame2,
        .timer = 100
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame5,
        .timer = 2
    },
    [6] =FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingLeft3[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall3_Frame2,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight3_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingLeft3_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingLeft3_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingLeft3_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingLeft3_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingMouthOpenedLeft3[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall3_Frame2,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight3_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft3_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft3_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft3_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft3_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingRight3[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall3_Frame2,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft3_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingRight3_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingRight3_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingRight3_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingRight3_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingMouthOpenedRight3[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall3_Frame2,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft3_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight3_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight3_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight3_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight3_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_LandingMouthOpen3[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sZazabiMultiOam_JumpWarning3_Frame0,
        .timer = 7
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_Landing3[3] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame3,
        .timer = 7
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_SpittingSamus3[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall3_Frame0,
        .timer = 7
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame0,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame1,
        .timer = 7
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened3_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow3_Frame5,
        .timer = 3
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_LandingAfterSpitting3[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen3_Frame3,
        .timer = 5
    },
    [3] = {
        .pFrame = sZazabiMultiOam_JumpWarning3_Frame0,
        .timer = 7
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus3_3[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus3_3_Frame0,
        .timer = 13
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus3_3_Frame1,
        .timer = 13
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus3_3_Frame2,
        .timer = 13
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus3_3_Frame1,
        .timer = 13
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus4_3[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus4_3_Frame0,
        .timer = 13
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus4_3_Frame1,
        .timer = 13
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus4_3_Frame2,
        .timer = 13
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus4_3_Frame1,
        .timer = 13
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus5_3[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_3_Frame0,
        .timer = 13
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_3_Frame1,
        .timer = 13
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_3_Frame2,
        .timer = 13
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_3_Frame1,
        .timer = 13
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_36c828[5] = {
    [0] = {
        .pFrame = sZazabi_36be88,
        .timer = 13
    },
    [1] = {
        .pFrame = sZazabi_36beb8,
        .timer = 13
    },
    [2] = {
        .pFrame = sZazabi_36bee8,
        .timer = 13
    },
    [3] = {
        .pFrame = sZazabi_36beb8,
        .timer = 13
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_36c850[5] = {
    [0] = {
        .pFrame = sZazabi_36bf18,
        .timer = 13
    },
    [1] = {
        .pFrame = sZazabi_36bf48,
        .timer = 13
    },
    [2] = {
        .pFrame = sZazabi_36bf78,
        .timer = 13
    },
    [3] = {
        .pFrame = sZazabi_36bf48,
        .timer = 13
    },
    [4] = FRAME_DATA_TERMINATOR
};


static const s16 sZazabiMultiOam_Idle2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    29, 28, 0,
    12, 124, 0,
    51, 108, 0,
    26, 108, 0,
    8, 236, 0
};

static const s16 sZazabiMultiOam_Idle2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    29, 24, 0,
    12, 120, 0,
    51, 104, 0,
    26, 104, 0,
    8, 232, 0
};

static const s16 sZazabiMultiOam_Idle2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    29, 16, 0,
    12, 112, 0,
    51, 96, 0,
    26, 96, 0,
    8, 220, 0
};

static const s16 sZazabiMultiOam_Crawling2_Frame3[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    19, 276, 0,
    52, 368, 0,
    29, 8, 0,
    12, 104, 0,
    51, 88, 0,
    26, 88, 0,
    8, 208, 0
};

static const s16 sZazabiMultiOam_Crawling2_Frame4[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 280, 0,
    52, 368, 0,
    29, 4, 0,
    12, 100, 0,
    51, 84, 0,
    26, 84, 0,
    8, 208, 0
};

static const s16 sZazabiMultiOam_JumpWarning2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    30, 40, 0,
    12, 136, 0,
    51, 120, 0,
    26, 120, 0,
    8, 236, 0
};

static const s16 sZazabiMultiOam_JumpWarning2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    30, 76, 0,
    12, 172, 0,
    51, 156, 0,
    26, 156, 0,
    8, 248, 0
};

static const s16 sZazabiMultiOam_JumpingSmall2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    31, -12, 0,
    12, 84, 0,
    51, 68, 0,
    26, 68, 0,
    8, 196, 0
};

static const s16 sZazabiMultiOam_JumpingSmall2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    32, -28, 0,
    12, 68, 0,
    51, 52, 0,
    26, 52, 0,
    8, 188, 0
};

static const s16 sZazabiMultiOam_JumpingSmall2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    33, -16, 0,
    12, 80, 0,
    51, 64, 0,
    26, 64, 0,
    8, 192, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    30, 8, 0,
    12, 104, 0,
    51, 88, 0,
    26, 88, 0,
    8, 188, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    30, 12, 0,
    12, 108, 0,
    51, 92, 0,
    26, 92, 0,
    8, 176, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    25, 196, 0,
    52, 368, 0,
    30, 28, 0,
    12, 124, 0,
    51, 108, 0,
    26, 108, 0,
    8, 176, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened2_Frame3[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    30, 52, 0,
    12, 148, 0,
    51, 132, 0,
    26, 132, 0,
    8, 212, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened2_Frame4[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    30, 68, 0,
    12, 164, 0,
    51, 148, 0,
    26, 148, 0,
    8, 216, 0
};

static const s16 sZazabiMultiOam_FallingSlow2_Frame5[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    19, 264, 0,
    52, 368, 0,
    30, 80, 0,
    12, 176, 0,
    51, 160, 0,
    26, 160, 0,
    8, 232, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    16, 300, 0,
    52, 368, 0,
    31, 108, 0,
    12, 204, 0,
    51, 188, 0,
    26, 188, 0,
    8, 244, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    17, 292, 0,
    52, 368, 0,
    31, 68, 0,
    12, 164, 0,
    51, 148, 0,
    26, 148, 0,
    8, 244, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    17, 292, 0,
    52, 368, 0,
    32, 72, 0,
    12, 168, 0,
    51, 152, 0,
    26, 152, 0,
    8, 248, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen2_Frame3[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    32, 52, 0,
    12, 148, 0,
    51, 132, 0,
    26, 132, 0,
    8, 232, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen2_Frame4[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    33, 56, 0,
    12, 152, 0,
    51, 136, 0,
    26, 136, 0,
    8, 236, 0
};

static const s16 sZazabiMultiOam_FallingSlow2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 196, 0,
    52, 368, 0,
    30, 28, 0,
    12, 124, 0,
    51, 108, 0,
    26, 108, 0,
    8, 176, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, 16, 0,
    13, 112, 0,
    51, 96, 0,
    27, 96, 0,
    9, 220, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, 24, 0,
    13, 120, 0,
    51, 104, 0,
    27, 104, 0,
    9, 232, 0
};

static const s16 sZazabiMultiOam_EatingSamus5_2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, 28, 0,
    13, 124, 0,
    51, 108, 0,
    27, 108, 0,
    9, 236, 0
};

static const s16 sZazabi_36cc92[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    34, 16, 0,
    14, 112, 0,
    51, 96, 0,
    27, 96, 0,
    10, 220, 0
};

static const s16 sZazabi_36ccbc[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    34, 24, 0,
    14, 120, 0,
    51, 104, 0,
    27, 104, 0,
    10, 232, 0
};

static const s16 sZazabi_36cce6[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    34, 28, 0,
    14, 124, 0,
    51, 108, 0,
    27, 108, 0,
    10, 236, 0
};

static const s16 sZazabiMultiOam_JumpingBigRight2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    41, -12, -32,
    35, 84, -32,
    51, 68, 0,
    53, 84, -32,
    39, 192, -4
};

static const s16 sZazabiMultiOam_JumpingBigRight2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    42, -32, -40,
    35, 64, -36,
    51, 52, 0,
    53, 64, -36,
    39, 180, -4
};

static const s16 sZazabiMultiOam_JumpingBigRight2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    43, -16, -36,
    35, 80, -32,
    51, 64, 0,
    53, 80, -32,
    39, 188, -4
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    44, 8, -36,
    35, 104, -32,
    51, 88, -32,
    53, 104, -32,
    39, 200, -4
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft2_Frame3[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    44, 16, -36,
    35, 112, -32,
    51, 96, -32,
    53, 112, -32,
    39, 188, -4
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft2_Frame4[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    25, 196, 0,
    52, 368, 0,
    44, 24, -36,
    35, 120, -32,
    51, 104, -32,
    53, 120, -32,
    39, 196, -4
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft2_Frame5[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    45, 68, -12,
    36, 164, -8,
    51, 148, -8,
    54, 164, -8,
    8, 204, 0
};

static const s16 sZazabiMultiOam_JumpingBigLeft2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    46, -12, 32,
    37, 84, 32,
    51, 68, 0,
    55, 84, 32,
    40, 192, 4
};

static const s16 sZazabiMultiOam_JumpingBigLeft2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    47, -32, 40,
    37, 64, 36,
    51, 52, 0,
    55, 64, 36,
    40, 180, 4
};

static const s16 sZazabiMultiOam_JumpingBigLeft2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    48, -16, 36,
    37, 80, 32,
    51, 64, 0,
    55, 80, 32,
    40, 188, 4
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    49, 8, 36,
    37, 104, 32,
    51, 88, 0,
    55, 104, 32,
    40, 200, 4
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight2_Frame3[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    49, 16, 36,
    37, 112, 32,
    51, 96, 0,
    55, 112, 32,
    40, 188, 4
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight2_Frame4[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    25, 196, 0,
    52, 368, 0,
    49, 24, 36,
    37, 120, 32,
    51, 104, 32,
    55, 120, 32,
    40, 196, 4
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight2_Frame5[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    23, 216, 0,
    24, 216, 0,
    50, 68, 12,
    38, 164, 8,
    51, 148, 8,
    56, 164, 8,
    8, 204, 0
};

static const s16 sZazabiMultiOam_FallingLeft2_Frame4[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 196, 0,
    52, 368, 0,
    44, 24, -36,
    35, 120, -32,
    51, 104, -32,
    53, 120, -32,
    39, 196, -4
};

static const s16 sZazabiMultiOam_FallingRight2_Frame4[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 196, 0,
    52, 368, 0,
    49, 24, 36,
    37, 120, 32,
    51, 104, 32,
    55, 120, 32,
    40, 196, 4
};

static const s16 sZazabiMultiOam_FallingSlow2_Frame0[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 248, 0,
    52, 368, 0,
    30, 8, 0,
    12, 104, 0,
    51, 88, 0,
    26, 88, 0,
    8, 188, 0
};

static const s16 sZazabiMultiOam_FallingSlow2_Frame1[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    30, 12, 0,
    12, 108, 0,
    51, 92, 0,
    26, 92, 0,
    8, 176, 0
};

static const s16 sZazabiMultiOam_FallingSlow2_Frame3[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    30, 52, 0,
    12, 148, 0,
    51, 132, 0,
    26, 132, 0,
    8, 212, 0
};

static const s16 sZazabiMultiOam_FallingSlow2_Frame4[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 248, 0,
    52, 368, 0,
    30, 68, 0,
    12, 164, 0,
    51, 148, 0,
    26, 148, 0,
    8, 216, 0
};

static const s16 sZazabiMultiOam_FallingLeft2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 248, 0,
    52, 368, 0,
    44, 8, -36,
    35, 104, -32,
    51, 88, -32,
    53, 104, -32,
    39, 200, -4
};

static const s16 sZazabiMultiOam_FallingLeft2_Frame3[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    44, 16, -36,
    35, 112, -32,
    51, 96, -32,
    53, 112, -32,
    39, 188, -4
};

static const s16 sZazabiMultiOam_FallingLeft2_Frame5[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    45, 68, -12,
    36, 164, -8,
    51, 148, -8,
    54, 164, -8,
    8, 204, 0
};

static const s16 sZazabiMultiOam_FallingRight2_Frame2[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 248, 0,
    52, 368, 0,
    49, 8, 36,
    37, 104, 32,
    51, 88, 0,
    55, 104, 32,
    40, 200, 4
};

static const s16 sZazabiMultiOam_FallingRight2_Frame3[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    49, 16, 36,
    37, 112, 32,
    51, 96, 0,
    55, 112, 32,
    40, 188, 4
};

static const s16 sZazabiMultiOam_FallingRight2_Frame5[ZAZABI_PART_MIDDLE_SHELL * 3] = {
    20, 216, 0,
    52, 368, 0,
    50, 68, 12,
    38, 164, 8,
    51, 148, 8,
    56, 164, 8,
    8, 204, 0
};


const struct FrameData sZazabiMultiOam_Idle2[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame0,
        .timer = 11
    },
    [1] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame1,
        .timer = 11
    },
    [2] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame2,
        .timer = 11
    },
    [3] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame1,
        .timer = 11
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_Crawling2[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame2,
        .timer = 5
    },
    [1] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame0,
        .timer = 5
    },
    [3] = {
        .pFrame = sZazabiMultiOam_Crawling2_Frame3,
        .timer = 5
    },
    [4] = {
        .pFrame = sZazabiMultiOam_Crawling2_Frame4,
        .timer = 7
    },
    [5] = {
        .pFrame = sZazabiMultiOam_Crawling2_Frame3,
        .timer = 5
    },
    [6] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame0,
        .timer = 5
    },
    [7] = {
        .pFrame = sZazabiMultiOam_Idle2_Frame1,
        .timer = 5
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpWarning2[3] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpWarning2_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpWarning2_Frame1,
        .timer = 11
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingSmall2[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall2_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingSmall2_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingSmall2_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingBigRight2[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight2_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight2_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight2_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingBigLeft2[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft2_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft2_Frame1,
        .timer = 5
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft2_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingSlow2[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame2,
        .timer = 100
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame5,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingSlowMouthOpened2[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame2,
        .timer = 100
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame5,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingLeft2[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall2_Frame2,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight2_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingLeft2_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingLeft2_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingLeft2_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingLeft2_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingMouthOpenedLeft2[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall2_Frame2,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight2_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft2_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft2_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft2_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft2_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingRight2[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall2_Frame2,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft2_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingRight2_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingRight2_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingRight2_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingRight2_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingMouthOpenedRight2[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall2_Frame2,
        .timer = 3
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft2_Frame2,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight2_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight2_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight2_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight2_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_LandingMouthOpen2[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame4,
        .timer = 4
    },
    [5] = {
        .pFrame = sZazabiMultiOam_JumpWarning2_Frame0,
        .timer = 5
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_Landing2[3] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame3,
        .timer = 5
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_SpittingSamus2[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall2_Frame0,
        .timer = 5
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame0,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame1,
        .timer = 5
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened2_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlow2_Frame5,
        .timer = 3
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_LandingAfterSpitting2[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen2_Frame3,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiMultiOam_JumpWarning2_Frame0,
        .timer = 5
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_EatingSamus5_2[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_2_Frame0,
        .timer = 11
    },
    [1] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_2_Frame1,
        .timer = 11
    },
    [2] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_2_Frame2,
        .timer = 11
    },
    [3] = {
        .pFrame = sZazabiMultiOam_EatingSamus5_2_Frame1,
        .timer = 11
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_36d4a4[5] = {
    [0] = {
        .pFrame = sZazabi_36cc92,
        .timer = 11
    },
    [1] = {
        .pFrame = sZazabi_36ccbc,
        .timer = 11
    },
    [2] = {
        .pFrame = sZazabi_36cce6,
        .timer = 11
    },
    [3] = {
        .pFrame = sZazabi_36ccbc,
        .timer = 11
    },
    [4] = FRAME_DATA_TERMINATOR
};


static const s16 sZazabiMultiOam_Idle1_Frame2[ZAZABI_PART_UPPER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    29, 92, 0,
    12, 188, 0,
    51, 172, 0,
    26, 172, 0
};

static const s16 sZazabiMultiOam_Idle1_Frame1[ZAZABI_PART_UPPER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    29, 88, 0,
    12, 184, 0,
    51, 168, 0,
    26, 168, 0
};

static const s16 sZazabiMultiOam_Idle1_Frame0[ZAZABI_PART_UPPER_SHELL * 3] = {
    18, 284, 0,
    52, 368, 0,
    29, 80, 0,
    12, 176, 0,
    51, 160, 0,
    26, 160, 0
};

static const s16 sZazabiMultiOam_Crawling1_Frame3[ZAZABI_PART_UPPER_SHELL * 3] = {
    19, 276, 0,
    52, 368, 0,
    29, 72, 0,
    12, 168, 0,
    51, 152, 0,
    26, 152, 0
};

static const s16 sZazabiMultiOam_Crawling1_Frame4[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 280, 0,
    52, 368, 0,
    29, 68, 0,
    12, 164, 0,
    51, 148, 0,
    26, 148, 0
};

static const s16 sZazabiMultiOam_JumpWarning1_Frame0[ZAZABI_PART_UPPER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    30, 88, 0,
    12, 184, 0,
    51, 168, 0,
    26, 168, 0
};

static const s16 sZazabiMultiOam_JumpWarning1_Frame1[ZAZABI_PART_UPPER_SHELL * 3] = {
    16, 292, 0,
    52, 368, 0,
    30, 104, 0,
    12, 200, 0,
    51, 184, 0,
    26, 184, 0
};

static const s16 sZazabiMultiOam_JumpingSmall1_Frame0[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    31, 52, 0,
    12, 148, 0,
    51, 132, 0,
    26, 132, 0
};

static const s16 sZazabiMultiOam_JumpingSmall1_Frame1[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    32, 48, 0,
    12, 144, 0,
    51, 128, 0,
    26, 128, 0
};

static const s16 sZazabiMultiOam_JumpingSmall1_Frame2[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    33, 56, 0,
    12, 152, 0,
    51, 136, 0,
    26, 136, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened1_Frame0[ZAZABI_PART_UPPER_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    30, 52, 0,
    12, 148, 0,
    51, 132, 0,
    26, 132, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened1_Frame1[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 232, 0,
    24, 232, 0,
    30, 40, 0,
    12, 136, 0,
    51, 120, 0,
    26, 120, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened1_Frame2[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 244, 0,
    24, 244, 0,
    30, 52, 0,
    12, 148, 0,
    51, 132, 0,
    26, 132, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened1_Frame3[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 256, 0,
    24, 256, 0,
    30, 84, 0,
    12, 180, 0,
    51, 164, 0,
    26, 164, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened1_Frame4[ZAZABI_PART_UPPER_SHELL * 3] = {
    21, 276, 0,
    22, 276, 0,
    30, 96, 0,
    12, 192, 0,
    51, 176, 0,
    26, 176, 0
};

static const s16 sZazabiMultiOam_FallingSlowMouthOpened1_Frame5[ZAZABI_PART_UPPER_SHELL * 3] = {
    19, 288, 0,
    52, 368, 0,
    30, 104, 0,
    12, 200, 0,
    51, 184, 0,
    26, 184, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen1_Frame0[ZAZABI_PART_UPPER_SHELL * 3] = {
    16, 300, 0,
    52, 368, 0,
    31, 144, 0,
    12, 240, 0,
    51, 224, 0,
    26, 224, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen1_Frame1[ZAZABI_PART_UPPER_SHELL * 3] = {
    17, 292, 0,
    52, 368, 0,
    31, 124, 0,
    12, 220, 0,
    51, 204, 0,
    26, 204, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen1_Frame2[ZAZABI_PART_UPPER_SHELL * 3] = {
    17, 292, 0,
    52, 368, 0,
    32, 120, 0,
    12, 216, 0,
    51, 200, 0,
    26, 200, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen1_Frame3[ZAZABI_PART_UPPER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    32, 88, 0,
    12, 184, 0,
    51, 168, 0,
    26, 168, 0
};

static const s16 sZazabiMultiOam_LandingMouthOpen1_Frame4[ZAZABI_PART_UPPER_SHELL * 3] = {
    17, 288, 0,
    52, 368, 0,
    33, 92, 0,
    12, 188, 0,
    51, 172, 0,
    26, 172, 0
};

static const s16 sZazabiMultiOam_JumpingBigRight1_Frame0[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    41, 52, -32,
    35, 148, -32,
    51, 132, 0,
    53, 148, -32
};

static const s16 sZazabiMultiOam_JumpingBigRight1_Frame1[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    42, 48, -40,
    35, 144, -36,
    51, 132, 0,
    53, 144, -36
};

static const s16 sZazabiMultiOam_JumpingBigRight1_Frame2[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    43, 56, -36,
    35, 152, -32,
    51, 136, 0,
    53, 152, -32
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft1_Frame2[ZAZABI_PART_UPPER_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    44, 52, -36,
    35, 148, -32,
    51, 132, -32,
    53, 148, -32
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft1_Frame3[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 232, 0,
    24, 232, 0,
    44, 40, -36,
    35, 136, -32,
    51, 120, -32,
    53, 136, -32
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft1_Frame5[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 256, 0,
    24, 256, 0,
    45, 84, -12,
    36, 180, -8,
    51, 164, -8,
    54, 180, -8
};

static const s16 sZazabiMultiOam_JumpingBigLeft1_Frame0[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 264, 0,
    52, 368, 0,
    46, 52, 32,
    37, 148, 32,
    51, 132, 0,
    55, 148, 32
};

static const s16 sZazabiMultiOam_JumpingBigLeft1_Frame1[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    47, 48, 40,
    37, 144, 36,
    51, 132, 0,
    55, 144, 36
};

static const s16 sZazabiMultiOam_JumpingBigLeft1_Frame2[ZAZABI_PART_UPPER_SHELL * 3] = {
    20, 268, 0,
    52, 368, 0,
    48, 56, 36,
    37, 152, 32,
    51, 136, 0,
    55, 152, 32
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight1_Frame2[ZAZABI_PART_UPPER_SHELL * 3] = {
    21, 248, 0,
    22, 248, 0,
    49, 52, 36,
    37, 148, 32,
    51, 132, 0,
    55, 148, 32
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight1_Frame3[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 232, 0,
    24, 232, 0,
    49, 40, 36,
    37, 136, 32,
    51, 120, 0,
    55, 136, 32
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight1_Frame5[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 256, 0,
    24, 256, 0,
    50, 84, 12,
    38, 180, 8,
    51, 164, 8,
    56, 180, 8
};

static const s16 sZazabiMultiOam_FallingMouthOpenedLeft1_Frame4[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 244, 0,
    24, 244, 0,
    44, 52, -36,
    35, 148, -32,
    51, 132, -32,
    53, 148, -32
};

static const s16 sZazabiMultiOam_FallingMouthOpenedRight1_Frame4[ZAZABI_PART_UPPER_SHELL * 3] = {
    23, 244, 0,
    24, 244, 0,
    49, 52, 36,
    37, 148, 32,
    51, 132, 32,
    55, 148, 32
};


const struct FrameData sZazabiMultiOam_Idle1[5] = {
    [0] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame1,
        .timer = 8
    },
    [2] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame2,
        .timer = 8
    },
    [3] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame1,
        .timer = 8
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_Crawling1[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame2,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame0,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiMultiOam_Crawling1_Frame3,
        .timer = 4
    },
    [4] = {
        .pFrame = sZazabiMultiOam_Crawling1_Frame4,
        .timer = 5
    },
    [5] = {
        .pFrame = sZazabiMultiOam_Crawling1_Frame3,
        .timer = 4
    },
    [6] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame0,
        .timer = 4
    },
    [7] = {
        .pFrame = sZazabiMultiOam_Idle1_Frame1,
        .timer = 4
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpWarning1[3] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpWarning1_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpWarning1_Frame1,
        .timer = 8
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingSmall1[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall1_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingSmall1_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingSmall1_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingBigRight1[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight1_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight1_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight1_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_JumpingBigLeft1[4] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft1_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft1_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft1_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingSlowMouthOpened1[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame2,
        .timer = 100
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame5,
        .timer = 2
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingMouthOpenedLeft1[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall1_Frame2,
        .timer = 2
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigRight1_Frame2,
        .timer = 2
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft1_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft1_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft1_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedLeft1_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_FallingMouthOpenedRight1[9] = {
    [0] = {
        .pFrame = sZazabiMultiOam_JumpingSmall1_Frame2,
        .timer = 2
    },
    [1] = {
        .pFrame = sZazabiMultiOam_JumpingBigLeft1_Frame2,
        .timer = 2
    },
    [2] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight1_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight1_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight1_Frame4,
        .timer = 100
    },
    [5] = {
        .pFrame = sZazabiMultiOam_FallingMouthOpenedRight1_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame4,
        .timer = 2
    },
    [7] = {
        .pFrame = sZazabiMultiOam_FallingSlowMouthOpened1_Frame5,
        .timer = 2
    },
    [8] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_LandingMouthOpen1[7] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen1_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen1_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen1_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen1_Frame3,
        .timer = 3
    },
    [4] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen1_Frame4,
        .timer = 3
    },
    [5] = {
        .pFrame = sZazabiMultiOam_JumpWarning1_Frame0,
        .timer = 4
    },
    [6] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiMultiOam_Landing1[3] = {
    [0] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen1_Frame0,
        .timer = 6
    },
    [1] = {
        .pFrame = sZazabiMultiOam_LandingMouthOpen1_Frame3,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};


const s16 sZazabiJumpingSpeedMouthOpened[40] = {
    -24, -23, -22, -21,
    -20, -19, -18, -17,
    -16, -16, -16, -16,
    -16, -16, -16, -16,
    -15, -14, -13, -12,
    -11, -10,  -9,  -8,
     -7,  -6,  -5,  -4,
     -3,  -2,  -1,   0,
      0,   0,   0,   0,
      0,   0,   0,
      SHORT_MAX
};

const s16 sZazabiFallingSpeedMouthOpened[8] = {
    0, 1, 2, 3,
    4, 6, 6,
    SHORT_MAX
};

const s16 sZazabiJumpingSpeed4[40] = {
    -24, -24, -24, -24,
    -24, -24, -24, -24,
    -24, -23, -22, -21,
    -19, -18, -17, -16,
    -15, -14, -13, -12,
    -11, -10,  -9,  -8,
     -7,  -6,  -5,  -4,
     -3,  -2,  -1,   0,
      0,   0,   0,   0,
      0,   0,   0,
      SHORT_MAX
};

const s16 sZazabiJumpingSpeed2[40] = {
    -24, -23, -22, -21,
    -20, -20, -20, -20,
    -20, -20, -20, -20,
    -19, -18, -17, -16,
    -15, -14, -13, -12,
    -11, -10,  -9,  -8,
     -7,  -6,  -5,  -4,
     -3,  -2,  -1,   0,
      0,   0,   0,   0,
      0,   0,   0,
      SHORT_MAX
};

const s16 sZazabiJumpingSpeed3[40] = {
    -24, -23, -22, -21,
    -20, -19, -18, -17,
    -16, -16, -16, -16,
    -16, -16, -16, -16,
    -15, -14, -13, -12,
    -11, -10,  -9,  -8,
     -7,  -6,  -5,  -4,
     -3,  -2,  -1,   0,
      0,   0,   0,   0,
      0,   0,   0,
      SHORT_MAX
};

const s16 sZazabiFallingSpeed[8] = {
     0,  4,  6, 8,
    10, 12, 16,
    SHORT_MAX
};

const u32 sZazabiGfx[4096] = INCBIN_U32("data/sprites/zazabi.gfx");
const u16 sZazabiPal[8 * 16] = INCBIN_U16("data/sprites/zazabi.pal");


static const u16 sZazabiPartOam_MouthIdle_Frame0[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf7, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x282,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f8, OBJ_SPRITE_OAM | 0x284,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x282,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x284,
    0x7, 0x1fc, OBJ_SPRITE_OAM | 0x2c4
};

static const u16 sZazabiPartOam_MouthLanding_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1e8, OBJ_SPRITE_OAM | 0x282,
    0xf6, 0x1f8, OBJ_SPRITE_OAM | 0x284,
    0xfe, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x242,
    0xfe, 0x1f8, OBJ_SPRITE_OAM | 0x244,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x282,
    0xf6, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x284,
    0xfe, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x242,
    0xfe, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x244,
    0x6, 0x1fc, OBJ_SPRITE_OAM | 0x264
};

static const u16 sZazabiPartOam_MouthCrawlingLow_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1e8, OBJ_SPRITE_OAM | 0x282,
    0xf5, 0x1f8, OBJ_SPRITE_OAM | 0x284,
    0xfd, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x202,
    0xfd, 0x1f8, OBJ_SPRITE_OAM | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x282,
    0xf5, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x284,
    0xfd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x202,
    0xfd, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x204,
    0x5, 0x1fc, OBJ_SPRITE_OAM | 0x224
};

static const u16 sZazabiPartOam_MouthCrawlingHigh_Frame0[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_SPRITE_OAM | 0x246,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x246,
    0xfc, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x205,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x1f8, OBJ_SPRITE_OAM | 0x207,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x205,
    OBJ_SHAPE_VERTICAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x207
};

static const u16 sZazabiPartOam_MouthCrawlingHalted_Frame0[OAM_DATA_SIZE(6)] = {
    0x6,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1f0, OBJ_SPRITE_OAM | 0x246,
    0xfc, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x265,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x1f8, OBJ_SPRITE_OAM | 0x267,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x246,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x265,
    OBJ_SHAPE_VERTICAL | 0xfc, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x267
};

static const u16 sZazabiPartOam_MouthOpening_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_VERTICAL | 0xfc, 0x1e8, OBJ_SPRITE_OAM | 0x228,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x209,
    OBJ_SHAPE_VERTICAL | 0xfc, OBJ_X_FLIP | 0x10, OBJ_SPRITE_OAM | 0x228
};

static const u16 sZazabi_371f0e[OAM_DATA_SIZE(2)] = {
    0x2,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x249,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x249
};

static const u16 sZazabi_371f1c[OAM_DATA_SIZE(5)] = {
    0x5,
    0xf3, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x22c,
    0xf3, 0x1e8, OBJ_SPRITE_OAM | 0x22b,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x22c,
    0xf3, OBJ_X_FLIP | 0x10, OBJ_SPRITE_OAM | 0x22b,
    0xeb, 0x1fc, OBJ_SPRITE_OAM | 0x20d
};

static const u16 sZazabi_371f3c[OAM_DATA_SIZE(7)] = {
    0x7,
    0xfb, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x26b,
    OBJ_SHAPE_VERTICAL | 0xfb, 0x1f8, OBJ_SPRITE_OAM | 0x26d,
    0xb, 0x1f0, OBJ_SPRITE_OAM | 0x2ac,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x26b,
    OBJ_SHAPE_VERTICAL | 0xfb, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x26d,
    0xb, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x2ac,
    0xb, 0x1fc, OBJ_SPRITE_OAM | 0x2ad
};

static const u16 sZazabiPartOam_MouthOpened_Frame0[OAM_DATA_SIZE(6)] = {
    0x6,
    0xf0, OBJ_SIZE_32x32 | 0x1e0, OBJ_SPRITE_OAM | 0x22e,
    0x10, 0x1ec, OBJ_SPRITE_OAM | 0x2af,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x0, OBJ_SPRITE_OAM | 0x22e,
    0x10, OBJ_X_FLIP | 0xc, OBJ_SPRITE_OAM | 0x2af,
    0xe8, 0x1fc, OBJ_SPRITE_OAM | 0x211,
    0x10, 0x1fc, OBJ_SPRITE_OAM | 0x2b1
};

static const u16 sZazabiPartOam_LowerShellIdle_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x332,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x332
};

static const u16 sZazabiPartOam_LowerShellEatingSamus_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x338,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x338
};

static const u16 sZazabiPartOam_LowerShellEatingSamus_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x33a,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33a
};

static const u16 sZazabiPartOam_LowerShellEatingSamus_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x33c,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33c
};

static const u16 sZazabiPartOam_LowerShellSwallowingSamus_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x33e,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x33e
};

static const u16 sZazabiPartOam_LowerShellSwallowingSamus_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x336,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x336
};

static const u16 sZazabiPartOam_LowerShellSwallowingSamus_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x334,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x334
};

static const u16 sZazabiPartOam_MiddleShellIdle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2f2,
    0xf4, 0x1f8, OBJ_SPRITE_OAM | 0x2d3,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2f2,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2d3
};

static const u16 sZazabiPartOam_MiddleShellEatingSamus_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2f8,
    0xf4, 0x1f8, OBJ_SPRITE_OAM | 0x2d9,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2f8,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2d9
};

static const u16 sZazabiPartOam_MiddleShellEatingSamus_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2fa,
    0xf4, 0x1f8, OBJ_SPRITE_OAM | 0x2db,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2fa,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2db
};

static const u16 sZazabiPartOam_MiddleShellEatingSamus_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2fc,
    0xf4, 0x1f8, OBJ_SPRITE_OAM | 0x2dd,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2fc,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2dd
};

static const u16 sZazabiPartOam_MiddleShellSwallowingSamus_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2fe,
    0xf4, 0x1f8, OBJ_SPRITE_OAM | 0x2df,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2fe,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2df
};

static const u16 sZazabiPartOam_MiddleShellSwallowingSamus_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2f6,
    0xf4, 0x1f8, OBJ_SPRITE_OAM | 0x2d7,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2f6,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2d7
};

static const u16 sZazabiPartOam_MiddleShellSwallowingSamus_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xfc, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2f4,
    0xf4, 0x1f8, OBJ_SPRITE_OAM | 0x2d5,
    0xfc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2f4,
    0xf4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2d5
};

static const u16 sZazabiPartOam_UpperShellIdle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x272,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f0, OBJ_SPRITE_OAM | 0x2b2,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x272,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2b2
};

static const u16 sZazabiPartOam_UpperShellEatingSamus_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x278,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f0, OBJ_SPRITE_OAM | 0x2b8,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x278,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2b8
};

static const u16 sZazabiPartOam_UpperShellEatingSamus_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x27a,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f0, OBJ_SPRITE_OAM | 0x2ba,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x27a,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2ba
};

static const u16 sZazabiPartOam_UpperShellEatingSamus_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x27c,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f0, OBJ_SPRITE_OAM | 0x2bc,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x27c,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2bc
};

static const u16 sZazabiPartOam_UpperShellSwallowingSamus_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x27e,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f0, OBJ_SPRITE_OAM | 0x2be,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x27e,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2be
};

static const u16 sZazabiPartOam_UpperShellSwallowingSamus_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f0, OBJ_SPRITE_OAM | 0x2b6,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x276,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2b6
};

static const u16 sZazabiPartOam_UpperShellSwallowingSamus_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    0xf4, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f0, OBJ_SPRITE_OAM | 0x2b4,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x274,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | 0x0, OBJ_SPRITE_OAM | 0x2b4
};

static const u16 sZazabiPartOam_EyeShellIdle_Frame0[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x0, OBJ_SPRITE_OAM | 0x200,
    0x8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x280,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x280
};

static const u16 sZazabiPartOam_EyeShellSwallowingSamusLow_Frame1[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x0, OBJ_SPRITE_OAM | 0x200,
    0x8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2c7,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2c7
};

static const u16 sZazabiPartOam_EyeShellSwallowingSamusLow_Frame2[OAM_DATA_SIZE(4)] = {
    0x4,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_16x32 | 0x1f0, OBJ_SPRITE_OAM | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x0, OBJ_SPRITE_OAM | 0x200,
    0x8, OBJ_SIZE_16x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2c9,
    0x8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x0, OBJ_SPRITE_OAM | 0x2c9
};

static const u16 sZazabiPartOam_EyeIdle_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_SPRITE_OAM | 0x252
};

static const u16 sZazabiPartOam_EyeEatingSamus_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_SPRITE_OAM | 0x256
};

static const u16 sZazabiPartOam_EyeEatingSamus_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_SPRITE_OAM | 0x254
};

static const u16 sZazabipartOam_PupilClosed_Frame0[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x20b
};

static const u16 sZazabiPartOam_PupilBlinking_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_SPRITE_OAM | 0x258
};

static const u16 sZazabiPartOam_PupilBlinking_Frame1[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_SPRITE_OAM | 0x25a
};

static const u16 sZazabiPartOam_PupilBlinking_Frame2[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_SPRITE_OAM | 0x25c
};

static const u16 sZazabiPartOam_PupilBlinking_Frame3[OAM_DATA_SIZE(2)] = {
    0x2,
    0xf4, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0x4, 0x1f8, OBJ_SPRITE_OAM | 0x25e
};

static const u16 sZazabiPartOam_HairMoving_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x380,
    0xe8, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f1, OBJ_SPRITE_OAM | 0x301,
    0xf8, OBJ_SIZE_16x16 | 0x1e3, OBJ_SPRITE_OAM | 0x341,
    0xf8, 0x1db, OBJ_SPRITE_OAM | 0x340,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x301,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x341,
    0xf8, OBJ_X_FLIP | 0x1d, OBJ_SPRITE_OAM | 0x340
};

static const u16 sZazabiPartOam_HairMoving_Frame1[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f4, OBJ_SPRITE_OAM | 0x388,
    0xea, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x2c2,
    0xfa, 0x1f1, OBJ_SPRITE_OAM | 0x303,
    0xf8, OBJ_SIZE_16x16 | 0x1db, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1eb, OBJ_SPRITE_OAM | 0x345,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x2c2,
    0xfa, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x303,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x345
};

static const u16 sZazabiPartOam_HairMoving_Frame2[OAM_DATA_SIZE(10)] = {
    0xa,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_SPRITE_OAM | 0x3cb,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ec, OBJ_SPRITE_OAM | 0x3aa,
    0xf2, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1e1, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1db, OBJ_SPRITE_OAM | 0x346,
    0x0, 0x1eb, OBJ_SPRITE_OAM | 0x348,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xea, OBJ_X_FLIP | 0x17, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x15, OBJ_SPRITE_OAM | 0x346,
    0x0, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x348
};

static const u16 sZazabiPartOam_HairMoving_Frame3[OAM_DATA_SIZE(10)] = {
    0xa,
    0xe8, OBJ_SIZE_16x16 | 0x1ec, OBJ_SPRITE_OAM | 0x3ad,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fc, OBJ_SPRITE_OAM | 0x3cf,
    0xf2, OBJ_SIZE_16x16 | 0x1e1, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f1, OBJ_SPRITE_OAM | 0x309,
    0x0, OBJ_SIZE_16x16 | 0x1db, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1eb, OBJ_SPRITE_OAM | 0x34b,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x309,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x34b
};

static const u16 sZazabiPartOam_HairMoving_Frame7[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1fc, OBJ_SPRITE_OAM | 0x388,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x2c2,
    0xfa, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x303,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x345,
    0xea, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x2c2,
    0xfa, 0x1f1, OBJ_SPRITE_OAM | 0x303,
    0xf8, OBJ_SIZE_16x16 | 0x1db, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1eb, OBJ_SPRITE_OAM | 0x345
};

static const u16 sZazabiPartOam_HairMoving_Frame8[OAM_DATA_SIZE(10)] = {
    0xa,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_SPRITE_OAM | 0x3cb,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x4, OBJ_SPRITE_OAM | 0x3aa,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xea, OBJ_X_FLIP | 0x17, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x15, OBJ_SPRITE_OAM | 0x346,
    0x0, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x348,
    0xf2, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1e1, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1db, OBJ_SPRITE_OAM | 0x346,
    0x0, 0x1eb, OBJ_SPRITE_OAM | 0x348
};

static const u16 sZazabiPartOam_HairMoving_Frame9[OAM_DATA_SIZE(10)] = {
    0xa,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x309,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x34b,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x4, OBJ_SPRITE_OAM | 0x3ad,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1fc, OBJ_SPRITE_OAM | 0x3cf,
    0xf2, OBJ_SIZE_16x16 | 0x1e1, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f1, OBJ_SPRITE_OAM | 0x309,
    0x0, OBJ_SIZE_16x16 | 0x1db, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1eb, OBJ_SPRITE_OAM | 0x34b
};

static const u16 sZazabiPartOam_HairDownLow_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3c6,
    0xf2, OBJ_SIZE_16x16 | 0x1e1, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f1, OBJ_SPRITE_OAM | 0x309,
    0x0, OBJ_SIZE_16x16 | 0x1db, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1eb, OBJ_SPRITE_OAM | 0x34b,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x309,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x34b
};

static const u16 sZazabiPartOam_HairDownMid_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3c4,
    0xf2, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1e1, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1db, OBJ_SPRITE_OAM | 0x346,
    0x0, 0x1eb, OBJ_SPRITE_OAM | 0x348,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xea, OBJ_X_FLIP | 0x17, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x15, OBJ_SPRITE_OAM | 0x346,
    0x0, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x348
};

static const u16 sZazabiPartOam_HairDownHigh_Frame0[OAM_DATA_SIZE(10)] = {
    0xa,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3a2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x3e2,
    0xea, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x2c2,
    0xfa, 0x1f1, OBJ_SPRITE_OAM | 0x303,
    0xf8, OBJ_SIZE_16x16 | 0x1db, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1eb, OBJ_SPRITE_OAM | 0x345,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x2c2,
    0xfa, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x303,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x345
};

static const u16 sZazabiPartOam_HairEatingSamus_Frame1[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xe1, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x380,
    0xea, OBJ_SIZE_16x16 | 0x1ea, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1f2, OBJ_SPRITE_OAM | 0x301,
    0xfa, OBJ_SIZE_16x16 | 0x1e5, OBJ_SPRITE_OAM | 0x341,
    0xfa, 0x1dd, OBJ_SPRITE_OAM | 0x340,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | 0x6, OBJ_SPRITE_OAM | 0x301,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_SPRITE_OAM | 0x341,
    0xfa, OBJ_X_FLIP | 0x1b, OBJ_SPRITE_OAM | 0x340
};

static const u16 sZazabiPartOam_HairEatingSamus_Frame3[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xdf, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x380,
    0xe7, OBJ_SIZE_16x16 | 0x1e8, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f0, OBJ_SPRITE_OAM | 0x301,
    0xf7, OBJ_SIZE_16x16 | 0x1e2, OBJ_SPRITE_OAM | 0x341,
    0xf7, 0x1da, OBJ_SPRITE_OAM | 0x340,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x8, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x8, OBJ_SPRITE_OAM | 0x301,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xe, OBJ_SPRITE_OAM | 0x341,
    0xf7, OBJ_X_FLIP | 0x1e, OBJ_SPRITE_OAM | 0x340
};

static const u16 sZazabiPartOam_EyeShellJumpingRight_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xe8, OBJ_SIZE_32x32 | 0x1f4, OBJ_SPRITE_OAM | 0x394,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_SIZE_8x32 | 0x1ec, OBJ_SPRITE_OAM | 0x393,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1f4, OBJ_SPRITE_OAM | 0x398
};

static const u16 sZazabiPartOam_EyeShellJumpingSmallRight_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe8, OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x39c,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x3d8
};

static const u16 sZazabiPartOam_EyeShellJumpingLeft_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1ec, OBJ_SPRITE_OAM | 0x394,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_8x32 | 0xc, OBJ_SPRITE_OAM | 0x393,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ec, OBJ_SPRITE_OAM | 0x398
};

static const u16 sZazabiPartOam_EyeShellJumpingSmallLeft_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_32x32 | 0x1f0, OBJ_SPRITE_OAM | 0x39c,
    OBJ_SHAPE_HORIZONTAL | 0x8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x3d8
};

static const u16 sZazabiPartOam_UpperShellJumpingRight_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2cc,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x30c
};

static const u16 sZazabiPartOam_UpperShellJumpingLeft_Frame0[OAM_DATA_SIZE(2)] = {
    0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf4, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_SPRITE_OAM | 0x2cc,
    OBJ_SHAPE_HORIZONTAL | 0x4, OBJ_X_FLIP | OBJ_SIZE_32x8 | 0x1f0, OBJ_SPRITE_OAM | 0x30c
};

static const u16 sZazabiPartOam_HairJumpingBigRight_1_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3c6,
    0xf4, OBJ_SIZE_16x16 | 0x1e1, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf4, 0x1f1, OBJ_SPRITE_OAM | 0x309,
    0x3, OBJ_SIZE_16x16 | 0x1dc, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x3, 0x1ec, OBJ_SPRITE_OAM | 0x34b,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf2, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x309,
    0x0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x0, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x34b
};

static const u16 sZazabiPartOam_HairJumpingBigRight_2_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3c4,
    0xf4, OBJ_SIZE_16x16 | 0x1ea, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1e2, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x3, 0x1dd, OBJ_SPRITE_OAM | 0x346,
    0x3, 0x1ed, OBJ_SPRITE_OAM | 0x348,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xea, OBJ_X_FLIP | 0x17, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x15, OBJ_SPRITE_OAM | 0x346,
    0x0, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x348
};

static const u16 sZazabi_3725a2[OAM_DATA_SIZE(10)] = {
    0xa,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3a2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_SPRITE_OAM | 0x3e2,
    0xec, OBJ_SIZE_16x16 | 0x1ea, OBJ_SPRITE_OAM | 0x2c2,
    0xfc, 0x1f2, OBJ_SPRITE_OAM | 0x303,
    0xfb, OBJ_SIZE_16x16 | 0x1dd, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xfb, 0x1ed, OBJ_SPRITE_OAM | 0x345,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x2c2,
    0xfa, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x303,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x15, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0xd, OBJ_SPRITE_OAM | 0x345
};

static const u16 sZazabiPartOam_HairLandingLeft_1_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x380,
    0xea, OBJ_SIZE_16x16 | 0x1ea, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xfa, 0x1f2, OBJ_SPRITE_OAM | 0x301,
    0xfb, OBJ_SIZE_16x16 | 0x1e5, OBJ_SPRITE_OAM | 0x341,
    0xfb, 0x1dd, OBJ_SPRITE_OAM | 0x340,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf7, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x301,
    0xf8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x341,
    0xf8, OBJ_X_FLIP | 0x1d, OBJ_SPRITE_OAM | 0x340
};

static const u16 sZazabiPartOam_HairLandingLeft_2_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x380,
    0xe9, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf9, 0x1f1, OBJ_SPRITE_OAM | 0x301,
    0xfa, OBJ_SIZE_16x16 | 0x1e3, OBJ_SPRITE_OAM | 0x341,
    0xfa, 0x1db, OBJ_SPRITE_OAM | 0x340,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf8, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x301,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x341,
    0xf7, OBJ_X_FLIP | 0x1d, OBJ_SPRITE_OAM | 0x340
};

static const u16 sZazabiPartOam_HairJumpingLeft_1_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3c6,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xf, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf4, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x309,
    0x3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x14, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x3, OBJ_X_FLIP | 0xc, OBJ_SPRITE_OAM | 0x34b,
    0xf2, OBJ_SIZE_16x16 | 0x1e1, OBJ_SPRITE_OAM | 0x307,
    OBJ_SHAPE_VERTICAL | 0xf2, 0x1f1, OBJ_SPRITE_OAM | 0x309,
    0x0, OBJ_SIZE_16x16 | 0x1db, OBJ_SPRITE_OAM | 0x349,
    OBJ_SHAPE_VERTICAL | 0x0, 0x1eb, OBJ_SPRITE_OAM | 0x34b
};

static const u16 sZazabiPartOam_HairJumpingLeft_2_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3c4,
    0xf4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xec, OBJ_X_FLIP | 0x16, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x3, OBJ_X_FLIP | 0x13, OBJ_SPRITE_OAM | 0x346,
    0x3, OBJ_X_FLIP | 0xb, OBJ_SPRITE_OAM | 0x348,
    0xf2, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x305,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1e1, OBJ_SPRITE_OAM | 0x2e4,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1db, OBJ_SPRITE_OAM | 0x346,
    0x0, 0x1eb, OBJ_SPRITE_OAM | 0x348
};

static const u16 sZazabi_3726c0[OAM_DATA_SIZE(10)] = {
    0xa,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x3a2,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x3e2,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_SPRITE_OAM | 0x2c2,
    0xfc, OBJ_X_FLIP | 0x6, OBJ_SPRITE_OAM | 0x303,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x13, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xfb, OBJ_X_FLIP | 0xb, OBJ_SPRITE_OAM | 0x345,
    0xea, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x2c2,
    0xfa, 0x1f1, OBJ_SPRITE_OAM | 0x303,
    0xf8, OBJ_SIZE_16x16 | 0x1db, OBJ_SPRITE_OAM | 0x343,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1eb, OBJ_SPRITE_OAM | 0x345
};

static const u16 sZazabiPartOam_HairLandingMouthOpened_1_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x380,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x6, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xfa, OBJ_X_FLIP | 0x6, OBJ_SPRITE_OAM | 0x301,
    0xfb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xb, OBJ_SPRITE_OAM | 0x341,
    0xfb, OBJ_X_FLIP | 0x1b, OBJ_SPRITE_OAM | 0x340,
    0xe7, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf7, 0x1f1, OBJ_SPRITE_OAM | 0x301,
    0xf8, OBJ_SIZE_16x16 | 0x1e3, OBJ_SPRITE_OAM | 0x341,
    0xf8, 0x1db, OBJ_SPRITE_OAM | 0x340
};

static const u16 sZazabiPartOam_HairLandingMouthOpened_2_Frame0[OAM_DATA_SIZE(9)] = {
    0x9,
    OBJ_SHAPE_VERTICAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_16x32 | 0x1f8, OBJ_SPRITE_OAM | 0x380,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x7, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf9, OBJ_X_FLIP | 0x7, OBJ_SPRITE_OAM | 0x301,
    0xfa, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0xd, OBJ_SPRITE_OAM | 0x341,
    0xfa, OBJ_X_FLIP | 0x1d, OBJ_SPRITE_OAM | 0x340,
    0xe8, OBJ_SIZE_16x16 | 0x1e9, OBJ_SPRITE_OAM | 0x2c0,
    OBJ_SHAPE_VERTICAL | 0xf8, 0x1f1, OBJ_SPRITE_OAM | 0x301,
    0xf7, OBJ_SIZE_16x16 | 0x1e3, OBJ_SPRITE_OAM | 0x341,
    0xf7, 0x1db, OBJ_SPRITE_OAM | 0x340
};

static const u16 sZazabi_37276e[OAM_DATA_SIZE(1)] = {
    0x1,
    0xfc, 0x1fc, OBJ_SPRITE_OAM | 0x20c
};

static const u16 sZazabiPartOam_EyeJumpingRight_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf3, 0x1fd, OBJ_SPRITE_OAM | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, OBJ_SPRITE_OAM | 0x32c,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1fb, OBJ_SPRITE_OAM | 0x36c
};

static const u16 sZazabiPartOam_EyeLandingRight_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf3, 0x1fb, OBJ_SPRITE_OAM | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x32e,
    OBJ_SHAPE_HORIZONTAL | 0x0, 0x1f8, OBJ_SPRITE_OAM | 0x36e
};

static const u16 sZazabiPartOam_EyeJumpingLeft_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf3, OBJ_X_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x208,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, OBJ_SPRITE_OAM | 0x32c,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x1f5, OBJ_SPRITE_OAM | 0x36c
};

static const u16 sZazabiPartOam_EyeLandingLeft_Frame0[OAM_DATA_SIZE(3)] = {
    0x3,
    0xf3, OBJ_X_FLIP | 0x1fa, OBJ_SPRITE_OAM | 0x208,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_SPRITE_OAM | 0x32e,
    OBJ_SHAPE_HORIZONTAL | 0x0, OBJ_X_FLIP | 0x1f8, OBJ_SPRITE_OAM | 0x36e
};


const struct FrameData sZazabiPartOam_LowerShellIdle[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_LowerShellIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_LowerShellEatingSamus[5] = {
    [0] = {
        .pFrame = sZazabiPartOam_LowerShellEatingSamus_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiPartOam_LowerShellEatingSamus_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiPartOam_LowerShellEatingSamus_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiPartOam_LowerShellEatingSamus_Frame1,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_LowerShellSwallowingSamus[4] = {
    [0] = {
        .pFrame = sZazabiPartOam_LowerShellSwallowingSamus_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiPartOam_LowerShellSwallowingSamus_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiPartOam_LowerShellSwallowingSamus_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372820[3] = {
    [0] = {
        .pFrame = sZazabiPartOam_LowerShellEatingSamus_Frame2,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiPartOam_LowerShellEatingSamus_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MiddleShellIdle[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_MiddleShellIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MiddleShellEatingSamus[5] = {
    [0] = {
        .pFrame = sZazabiPartOam_MiddleShellEatingSamus_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiPartOam_MiddleShellEatingSamus_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiPartOam_MiddleShellEatingSamus_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiPartOam_MiddleShellEatingSamus_Frame1,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MiddleShellSwallowingSamus[4] = {
    [0] = {
        .pFrame = sZazabiPartOam_MiddleShellSwallowingSamus_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiPartOam_MiddleShellSwallowingSamus_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiPartOam_MiddleShellSwallowingSamus_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372890[3] = {
    [0] = {
        .pFrame = sZazabiPartOam_MiddleShellEatingSamus_Frame2,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiPartOam_MiddleShellEatingSamus_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_UpperShellIdle[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_UpperShellIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_UpperShellEatingSamus[5] = {
    [0] = {
        .pFrame = sZazabiPartOam_UpperShellEatingSamus_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiPartOam_UpperShellEatingSamus_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiPartOam_UpperShellEatingSamus_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiPartOam_UpperShellEatingSamus_Frame1,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_UpperShellSwallowingSamus[4] = {
    [0] = {
        .pFrame = sZazabiPartOam_UpperShellSwallowingSamus_Frame0,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiPartOam_UpperShellSwallowingSamus_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiPartOam_UpperShellSwallowingSamus_Frame2,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372900[3] = {
    [0] = {
        .pFrame = sZazabiPartOam_UpperShellEatingSamus_Frame2,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiPartOam_UpperShellEatingSamus_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeShellIdle[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeShellIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeShellSwallowingSamusLow[5] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeShellIdle_Frame0,
        .timer = 4
    },
    [1] = {
        .pFrame = sZazabiPartOam_EyeShellSwallowingSamusLow_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiPartOam_EyeShellSwallowingSamusLow_Frame2,
        .timer = 4
    },
    [3] = {
        .pFrame = sZazabiPartOam_EyeShellSwallowingSamusLow_Frame1,
        .timer = 4
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372950[4] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeShellSwallowingSamusLow_Frame2,
        .timer = 12
    },
    [1] = {
        .pFrame = sZazabiPartOam_EyeShellSwallowingSamusLow_Frame1,
        .timer = 4
    },
    [2] = {
        .pFrame = sZazabiPartOam_EyeShellIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372970[3] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeShellSwallowingSamusLow_Frame2,
        .timer = 8
    },
    [1] = {
        .pFrame = sZazabiPartOam_EyeShellSwallowingSamusLow_Frame1,
        .timer = 4
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MouthIdle[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_MouthIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MouthLanding[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_MouthLanding_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MouthCrawlingLow[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_MouthCrawlingLow_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MouthCrawlingHigh[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_MouthCrawlingHigh_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MouthCrawlingHalted[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_MouthCrawlingHalted_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MouthOpening[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_MouthOpening_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_3729e8[2] = {
    [0] = {
        .pFrame = sZazabi_371f0e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_3729f8[2] = {
    [0] = {
        .pFrame = sZazabi_371f1c,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372a08[2] = {
    [0] = {
        .pFrame = sZazabi_371f3c,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_MouthOpened[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_MouthOpened_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeIdle[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeIdle_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeEatingSamus[5] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeIdle_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sZazabiPartOam_EyeEatingSamus_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sZazabiPartOam_EyeIdle_Frame0,
        .timer = 10
    },
    [3] = {
        .pFrame = sZazabiPartOam_EyeEatingSamus_Frame3,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_PupilBlinking[8] = {
    [0] = {
        .pFrame = sZazabiPartOam_PupilBlinking_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sZazabiPartOam_PupilBlinking_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sZazabiPartOam_PupilBlinking_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sZazabiPartOam_PupilBlinking_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sZazabiPartOam_PupilBlinking_Frame2,
        .timer = 2
    },
    [5] = {
        .pFrame = sZazabiPartOam_PupilBlinking_Frame1,
        .timer = 2
    },
    [6] = {
        .pFrame = sZazabiPartOam_PupilBlinking_Frame0,
        .timer = 2
    },
    [7] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairMoving[13] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame3,
        .timer = 6
    },
    [4] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame2,
        .timer = 10
    },
    [5] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame1,
        .timer = 10
    },
    [6] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame0,
        .timer = 6
    },
    [7] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame7,
        .timer = 10
    },
    [8] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame8,
        .timer = 10
    },
    [9] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame9,
        .timer = 6
    },
    [10] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame8,
        .timer = 10
    },
    [11] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame7,
        .timer = 10
    },
    [12] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairStill[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairDownLow[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairDownLow_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairDownMid[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairDownMid_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairDownHigh[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairDownHigh_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairEatingSamus[5] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sZazabiPartOam_HairEatingSamus_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sZazabiPartOam_HairMoving_Frame0,
        .timer = 10
    },
    [3] = {
        .pFrame = sZazabiPartOam_HairEatingSamus_Frame3,
        .timer = 10
    },
    [4] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeShellJumpingRight[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeShellJumpingRight_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeShellJumpingSmallRight[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeShellJumpingSmallRight_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeShellJumpingLeft[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeShellJumpingLeft_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeShellJumpingSmallLeft[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeShellJumpingSmallLeft_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_UpperShellJumpingRight[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_UpperShellJumpingRight_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_UpperShellJumpingLeft[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_UpperShellJumpingLeft_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairJumpingBigRight_1[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairJumpingBigRight_1_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairJumpingBigRight_2[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairJumpingBigRight_2_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372bf0[2] = {
    [0] = {
        .pFrame = sZazabi_3725a2,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairLandingLeft_1[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairLandingLeft_1_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairLandingLeft_2[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairLandingLeft_2_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairJumpingLeft_1[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairJumpingLeft_1_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairJumpingLeft_2[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairJumpingLeft_2_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372c40[2] = {
    [0] = {
        .pFrame = sZazabi_3726c0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairLandingMouthOpened_1[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairLandingMouthOpened_1_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_HairLandingMouthOpened_2[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_HairLandingMouthOpened_2_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_PupilClosed[2] = {
    [0] = {
        .pFrame = sZazabipartOam_PupilClosed_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabi_372c80[2] = {
    [0] = {
        .pFrame = sZazabi_37276e,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeJumpingRight[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeJumpingRight_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeLandingRight[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeLandingRight_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeJumpingLeft[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeJumpingLeft_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sZazabiPartOam_EyeLandingLeft[2] = {
    [0] = {
        .pFrame = sZazabiPartOam_EyeLandingLeft_Frame0,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};
