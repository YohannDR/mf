#include "data/samus/samus_graphics.h"
#include "data/samus_data.h"

#define SAMUS_ANIM_TERMINATOR \
{                             \
    .pTopGfx = NULL,          \
    .pBottomGfx = NULL,       \
    .pOam = NULL,             \
    .timer = 0,               \
}

static const u8 sSamusGfx_Top_Left_Running_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame3[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame3[] = {
    6, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame4[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame5[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame5[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame6[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame6.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame6[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame7[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame7.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame7[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame7.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame8[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame8.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame8[] = {
    6, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame8.gfx")
};

static const u8 sSamusGfx_Top_Left_Running_Frame9[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Running_Frame9.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Running_Frame9[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Running_Frame9.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_Running_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_Running_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_Running_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Forward_Running_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Forward_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Forward_Running_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Forward_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Forward_Running_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Forward_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_Running_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_Running_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_Running_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_Shooting_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_Shooting_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_Shooting_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_Shooting_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_Standing_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_Standing_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_Standing_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_Standing_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_Shooting_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_Shooting_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_Standing_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_Standing_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_Standing_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_Shooting_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Standing_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Standing_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Standing_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Standing_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Standing_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Standing_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Shooting_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_Standing_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalDown_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_Standing_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalDown_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_Standing_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalDown_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_Shooting_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_Crouching_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_Crouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_Crouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_Crouching_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_Crouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_Crouching_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Crouching_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Crouching_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Crouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Crouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalDown_Crouching_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalDown_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalDown_Crouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalDown_Crouching_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame3[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame4[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame5[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame6[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame7[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame7.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame8[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame8.gfx")
};

static const u8 sSamusGfx_Top_Right_Running_Frame9[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Running_Frame9.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_Running_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_Running_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_Running_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_Forward_Running_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Forward_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Forward_Running_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Forward_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Forward_Running_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Forward_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_Running_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_Running_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_Running_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_Running_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_Running_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_Running_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_Standing_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_Standing_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_Standing_Frame2[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_Shooting_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Up_Shooting_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Up_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_Standing_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_Standing_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_Standing_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_Shooting_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Standing_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Standing_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Standing_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_Shooting_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_Standing_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_Standing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_Standing_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_Standing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_Standing_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_Standing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_Shooting_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_Shooting_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Up_Crouching_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Up_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Up_Crouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Up_Crouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_DiagonalUp_Crouching_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_DiagonalUp_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Right_DiagonalUp_Crouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_DiagonalUp_Crouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Crouching_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Crouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Crouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_DiagonalDown_Crouching_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_DiagonalDown_Crouching_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Right_DiagonalDown_Crouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_DiagonalDown_Crouching_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Skidding_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_Skidding_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Skidding_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Skidding_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Armed_Skidding_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_Armed_Skidding_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Skidding_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_Skidding_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Armed_Skidding_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_Armed_Skidding_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_HitByOmegaMetroid_Frame0[] = {
    7, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HitByOmegaMetroid_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HitByOmegaMetroid_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_HitByOmegaMetroid_Frame1[] = {
    7, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HitByOmegaMetroid_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HitByOmegaMetroid_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_HitByOmegaMetroid_Frame2[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HitByOmegaMetroid_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HitByOmegaMetroid_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_LookingUp_HitByOmegaMetroid_Frame0[] = {
    7, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_LookingUp_HitByOmegaMetroid_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_LookingUp_HitByOmegaMetroid_Frame1[] = {
    7, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_LookingUp_HitByOmegaMetroid_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_LookingUp_HitByOmegaMetroid_Frame2[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_LookingUp_HitByOmegaMetroid_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_HitByOmegaMetroid_Frame0[] = {
    8, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_HitByOmegaMetroid_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_HitByOmegaMetroid_Frame1[] = {
    7, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_HitByOmegaMetroid_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_HitByOmegaMetroid_Frame2[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_HitByOmegaMetroid_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_LookingUp_HitByOmegaMetroid_Frame0[] = {
    8, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_LookingUp_HitByOmegaMetroid_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_LookingUp_HitByOmegaMetroid_Frame1[] = {
    7, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_LookingUp_HitByOmegaMetroid_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_LookingUp_HitByOmegaMetroid_Frame2[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_LookingUp_HitByOmegaMetroid_Frame2.gfx")
};

static const u16 sSamusOam_Left_Running_Frame0[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xd6, 0x1f8, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_Running_Frame1[] = {
    4,
    0xd7, 0x1fa, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_Running_Frame2[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f2, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x2, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17
};

static const u16 sSamusOam_Left_Running_Frame3[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1f0, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18,
    0xd5, 0x1f8, 0x3
};

static const u16 sSamusOam_Left_Running_Frame4[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f5, 0x2
};

static const u16 sSamusOam_Left_Running_Frame5[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16,
    0xd6, 0x1f8, 0x2
};

static const u16 sSamusOam_Left_Running_Frame6[] = {
    3,
    0xdb, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_Running_Frame7[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe2, 0x1f0, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16
};

static const u16 sSamusOam_Left_Running_Frame8[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe3, 0x1ee, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_Left_Running_Frame9[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame0[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1ef, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1ff, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ef, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame2[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1fe, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame3[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x1fe, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame4[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ef, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame5[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1fe, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame6[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ee, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame7[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1ed, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1fd, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Running_Frame9[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ee, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17
};

static const u16 sSamusOam_Left_Forward_Running_Frame0[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe6, 0x1ef, 0x2,
    0xd6, 0x1f8, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_Forward_Running_Frame1[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe5, 0x1ee, 0x2,
    0xd5, 0x1f7, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_Forward_Running_Frame2[] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe5, 0x1ee, 0x2,
    0xd5, 0x1f7, 0x3,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17
};

static const u16 sSamusOam_Left_Forward_Running_Frame3[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe4, 0x1ee, 0x2,
    0xd4, 0x1f7, 0x3,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_Left_Forward_Running_Frame4[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe6, 0x1ef, 0x2,
    0xd6, 0x1f8, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x16
};

static const u16 sSamusOam_Left_Forward_Running_Frame5[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe6, 0x1ee, 0x2,
    0xd6, 0x1f7, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_Forward_Running_Frame7[] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    0xe5, 0x1ed, 0x2,
    0xd5, 0x1f6, 0x3,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16
};

static const u16 sSamusOam_Left_Forward_Running_Frame8[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    0xe4, 0x1ed, 0x2,
    0xd4, 0x1f6, 0x3,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_Left_Forward_Running_Frame9[] = {
    6,
    0xde, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe6, 0x1ee, 0x2,
    0xd6, 0x1f7, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame0[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f2, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame1[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f0, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame2[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f0, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame3[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame4[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f2, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f1, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame7[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1ef, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame8[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ef, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_Left_DiagonalDown_Running_Frame9[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f1, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17
};

static const u16 sSamusOam_Left_Up_Standing_Frame2[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd2, 0x1f7, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16
};

static const u16 sSamusOam_Left_Up_Standing_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd2, 0x1f7, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_Left_DiagonalUp_Standing_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1fd, 0x2,
    0xda, OBJ_SIZE_16x16 | 0x1ed, 0x0,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_Left_DiagonalUp_Standing_Frame1[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ed, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_Left_DiagonalUp_Shooting_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_Left_Standing_Frame0[] = {
    6,
    0xd7, 0x1f8, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xe7, 0x1ec, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_Left_Standing_Frame1[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xe7, 0x1ec, 0x2,
    0xd7, 0x1f8, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_Left_Standing_Frame2[] = {
    6,
    0xe7, 0x1ec, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    0xd7, 0x1f8, 0x3
};

static const u16 sSamusOam_Left_Shooting_Frame0[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f4, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_Left_DiagonalDown_Standing_Frame0[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1ee, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Standing_Frame1[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_Left_DiagonalDown_Standing_Frame2[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1ee, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Shooting_Frame0[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_Left_Up_Crouching_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_Up_Crouching_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xdb, 0x1f7, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Crouching_Frame1[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1fe, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Crouching_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_Crouching_Frame1[] = {
    5,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xf0, 0x1ee, 0x2,
    0xe0, 0x1fa, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_Crouching_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f6, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Crouching_Frame1[] = {
    4,
    0xe6, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Crouching_Frame0[] = {
    4,
    0xe5, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Right_Running_Frame0[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fa, 0x2,
    0xe5, 0xa, 0x4,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_Running_Frame1[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fa, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_Running_Frame2[] = {
    6,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x6, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f6, 0x3,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17
};

static const u16 sSamusOam_Right_Running_Frame3[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, 0x2,
    0xe3, 0x8, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_Right_Running_Frame4[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1fa, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x16
};

static const u16 sSamusOam_Right_Running_Frame5[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f9, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_Running_Frame6[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe5, 0x9, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_Running_Frame7[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x8, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16
};

static const u16 sSamusOam_Right_Running_Frame8[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0xa, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_Right_Running_Frame9[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe5, 0xa, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f0, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame0[] = {
    3,
    0xdd, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame1[] = {
    3,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame2[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xa, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame3[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0xa, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame4[] = {
    3,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame5[] = {
    3,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame6[] = {
    3,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame7[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xb, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Running_Frame9[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f0, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17
};

static const u16 sSamusOam_Right_Forward_Running_Frame0[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xd6, OBJ_X_FLIP | 0x0, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_Forward_Running_Frame1[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xd5, OBJ_X_FLIP | 0x1, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_Forward_Running_Frame2[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xd5, OBJ_X_FLIP | 0x1, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17
};

static const u16 sSamusOam_Right_Forward_Running_Frame3[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18,
    0xd4, OBJ_X_FLIP | 0x1, 0x2
};

static const u16 sSamusOam_Right_Forward_Running_Frame4[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x16,
    0xd6, OBJ_X_FLIP | 0x0, 0x2
};

static const u16 sSamusOam_Right_Forward_Running_Frame5[] = {
    4,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16,
    0xde, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xd6, OBJ_X_FLIP | 0x1, 0x2
};

static const u16 sSamusOam_Right_Forward_Running_Frame7[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    0xd5, OBJ_X_FLIP | 0x2, 0x2
};

static const u16 sSamusOam_Right_Forward_Running_Frame8[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18,
    0xd4, OBJ_X_FLIP | 0x2, 0x2
};

static const u16 sSamusOam_Right_Forward_Running_Frame9[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f0, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17,
    0xd6, OBJ_X_FLIP | 0x1, 0x2
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame0[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xea, 0x1fe, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame1[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, 0x0, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame2[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, 0x0, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame3[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, 0x0, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame4[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xea, 0x1ff, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xea, 0x1ff, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame7[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe9, 0x1, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame8[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, 0x1, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_Right_DiagonalDown_Running_Frame9[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xea, 0x0, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f0, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17
};

static const u16 sSamusOam_Right_Up_Standing_Frame0[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16
};

static const u16 sSamusOam_Right_Up_Standing_Frame1[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17
};

static const u16 sSamusOam_Right_Up_Shooting_Frame0[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17,
    0xdb, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Standing_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17
};

static const u16 sSamusOam_Right_DiagonalUp_Shooting_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xa, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17
};

static const u16 sSamusOam_Right_Standing_Frame0[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    0xd7, OBJ_X_FLIP | 0x0, 0x2
};

static const u16 sSamusOam_Right_Standing_Frame2[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    0xd7, OBJ_X_FLIP | 0x0, 0x2
};

static const u16 sSamusOam_Right_Shooting_Frame0[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    0xd7, OBJ_X_FLIP | 0x1ff, 0x2
};

static const u16 sSamusOam_Right_DiagonalDown_Standing_Frame0[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xec, 0x2, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Standing_Frame1[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xec, 0x2, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17
};

static const u16 sSamusOam_Right_DiagonalDown_Shooting_Frame0[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xec, 0x1, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17
};

static const u16 sSamusOam_Right_Up_Crouching_Frame1[] = {
    3,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_Up_Crouching_Frame0[] = {
    3,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Crouching_Frame1[] = {
    4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x9, 0x2
};

static const u16 sSamusOam_Right_DiagonalUp_Crouching_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x8, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_Crouching_Frame1[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16,
    0xe0, OBJ_X_FLIP | 0x1ff, 0x2
};

static const u16 sSamusOam_Right_Crouching_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16,
    0xe0, OBJ_X_FLIP | 0x1fe, 0x2
};

static const u16 sSamusOam_Right_DiagonalDown_Crouching_Frame1[] = {
    4,
    0xe6, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xf6, 0x2, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Crouching_Frame0[] = {
    4,
    0xe5, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf5, 0x1, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_2bdcc8_Frame3[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1f1, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x16 | 0x1f2, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1fa, 0x18,
    0xd6, 0x1f9, 0x3
};

static const u16 sSamusOam_2bdcc8_Frame8[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe4, 0x1ef, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x16 | 0x1f2, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1fa, 0x18
};

static const u16 sSamusOam_2bdd78_Frame3[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f7, 0x2,
    0xe4, 0x7, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ee, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f6, 0x18
};

static const u16 sSamusOam_2bdd78_Frame8[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x9, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ee, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f6, 0x18
};

static const u16 sSamusOam_Left_Skidding_Frame0[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f0, 0x16,
    0xde, OBJ_SIZE_16x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_2bcec4[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f0, 0x16,
    0xde, OBJ_SIZE_16x16 | 0x1ef, 0x4
};

static const u16 sSamusOam_Right_Skidding_Frame0[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x8, 0x16,
    0xdd, OBJ_SIZE_16x16 | 0x1, 0x4
};

static const u16 sSamusOam_Right_Armed_Skidding_Frame0[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x8, 0x16,
    0xdd, OBJ_SIZE_16x16 | 0x1, 0x4
};

static const u16 sSamusOam_Left_HitByOmegaMetroid_Frame0[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf8, 0x1f9, 0x6,
    0xe7, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, 0x4
};

static const u16 sSamusOam_Left_HitByOmegaMetroid_Frame1[] = {
    6,
    0xeb, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xfb, 0x1f9, 0x6,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, 0x4
};

static const u16 sSamusOam_Left_HitByOmegaMetroid_Frame2[] = {
    5,
    0xec, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, 0x4
};

static const u16 sSamusOam_Left_LookingUp_HitByOmegaMetroid_Frame0[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf8, 0x1f8, 0x6,
    0xe6, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, 0x4
};

static const u16 sSamusOam_Left_LookingUp_HitByOmegaMetroid_Frame1[] = {
    6,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xfb, 0x1f8, 0x6,
    0xe7, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, 0x4
};

static const u16 sSamusOam_Left_LookingUp_HitByOmegaMetroid_Frame2[] = {
    5,
    0xec, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, 0x4
};

static const u16 sSamusOam_Right_HitByOmegaMetroid_Frame0[] = {
    6,
    0xec, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fd, 0x6
};

static const u16 sSamusOam_Right_HitByOmegaMetroid_Frame1[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fa, 0x4,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1fc, 0x5
};

static const u16 sSamusOam_Right_HitByOmegaMetroid_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f9, 0x4,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16
};

static const u16 sSamusOam_Right_LookingUp_HitByOmegaMetroid_Frame0[] = {
    6,
    0xec, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fd, 0x6
};

static const u16 sSamusOam_Right_LookingUp_HitByOmegaMetroid_Frame1[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, 0x4,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1fc, 0x5
};

static const u16 sSamusOam_Right_LookingUp_HitByOmegaMetroid_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fa, 0x4,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16
};

const struct SamusAnimationData sSamusAnim_Left_Running[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Left_Running_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Left_Running_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Left_Running_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Left_Running_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Left_Running_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Left_Running_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Left_Running_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Left_Running_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Left_Running_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Left_Running_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_Running[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame3,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Left_DiagonalUp_Running_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Forward_Running[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Left_Forward_Running_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Left_Forward_Running_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Left_Forward_Running_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Left_Forward_Running_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Left_Forward_Running_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Left_Forward_Running_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Left_Forward_Running_Frame5,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Left_Forward_Running_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Left_Forward_Running_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Left_Forward_Running_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_Running[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame1,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Left_DiagonalDown_Running_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_Standing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Standing_Frame0,
        .pOam = sSamusOam_Left_Up_Standing_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Standing_Frame0,
        .pOam = sSamusOam_Left_Up_Standing_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_Standing_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Standing_Frame2,
        .pOam = sSamusOam_Left_Up_Standing_Frame2,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_Shooting[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Shooting_Frame0,
        .pOam = sSamusOam_Left_Up_Standing_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_Shooting_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Shooting_Frame1,
        .pOam = sSamusOam_Left_Up_Standing_Frame2,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_Standing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_Standing_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Standing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame1,
        .pOam = sSamusOam_Left_DiagonalUp_Standing_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Standing_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame2,
        .pOam = sSamusOam_Left_DiagonalUp_Standing_Frame1,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_Shooting[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame2,
        .pOam = sSamusOam_Left_DiagonalUp_Shooting_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_Standing_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Standing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame0,
        .pOam = sSamusOam_Left_Standing_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Standing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame1,
        .pOam = sSamusOam_Left_Standing_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Standing_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame2,
        .pOam = sSamusOam_Left_Standing_Frame2,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Shooting[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame2,
        .pOam = sSamusOam_Left_Shooting_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame0,
        .pOam = sSamusOam_Left_Standing_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_Standing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_Standing_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Standing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame1,
        .pOam = sSamusOam_Left_DiagonalDown_Standing_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Standing_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame2,
        .pOam = sSamusOam_Left_DiagonalDown_Standing_Frame2,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_Shooting[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame2,
        .pOam = sSamusOam_Left_DiagonalDown_Shooting_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_Standing_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_Crouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Crouching_Frame0,
        .pOam = sSamusOam_Left_Up_Crouching_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_Shooting_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Crouching_Frame1,
        .pOam = sSamusOam_Left_Up_Crouching_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_Crouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Crouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_Crouching_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Crouching_Frame1,
        .pOam = sSamusOam_Left_DiagonalUp_Crouching_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Crouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Crouching_Frame0,
        .pOam = sSamusOam_Left_Crouching_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Crouching_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Crouching_Frame1,
        .pOam = sSamusOam_Left_Crouching_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_Crouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Crouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_Crouching_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Crouching_Frame1,
        .pOam = sSamusOam_Left_DiagonalDown_Crouching_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Running[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Right_Running_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Right_Running_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Right_Running_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Right_Running_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Right_Running_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Right_Running_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Right_Running_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Right_Running_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Right_Running_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Right_Running_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_Running[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame3,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Right_DiagonalUp_Running_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Forward_Running[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Right_Forward_Running_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Right_Forward_Running_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Right_Forward_Running_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Right_Forward_Running_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Right_Forward_Running_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Right_Forward_Running_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Right_Forward_Running_Frame5,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Right_Forward_Running_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Right_Forward_Running_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Right_Forward_Running_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_Running[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame1,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Right_DiagonalDown_Running_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_Standing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Shooting_Frame1,
        .pOam = sSamusOam_Right_Up_Standing_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_Standing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Standing_Frame0,
        .pOam = sSamusOam_Right_Up_Standing_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_Standing_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Standing_Frame2,
        .pOam = sSamusOam_Right_Up_Standing_Frame0,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_Shooting[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Up_Shooting_Frame0,
        .pOam = sSamusOam_Right_Up_Shooting_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_Shooting_Frame1,
        .pOam = sSamusOam_Right_Up_Standing_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_Standing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_Standing_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Standing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame1,
        .pOam = sSamusOam_Right_DiagonalUp_Standing_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Standing_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame2,
        .pOam = sSamusOam_Right_DiagonalUp_Standing_Frame0,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_Shooting[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame2,
        .pOam = sSamusOam_Right_DiagonalUp_Shooting_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_Standing_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_Standing_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Standing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame0,
        .pOam = sSamusOam_Right_Standing_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Standing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame1,
        .pOam = sSamusOam_Right_Standing_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Standing_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame2,
        .pOam = sSamusOam_Right_Standing_Frame2,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Shooting[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame2,
        .pOam = sSamusOam_Right_Shooting_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame0,
        .pOam = sSamusOam_Right_Standing_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_Standing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_Standing_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Standing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame1,
        .pOam = sSamusOam_Right_DiagonalDown_Standing_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Standing_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame2,
        .pOam = sSamusOam_Right_DiagonalDown_Standing_Frame0,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_Shooting[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Standing_Frame2,
        .pOam = sSamusOam_Right_DiagonalDown_Shooting_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_Standing_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_Standing_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_Crouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Up_Crouching_Frame0,
        .pOam = sSamusOam_Right_Up_Crouching_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Up_Crouching_Frame1,
        .pOam = sSamusOam_Right_Up_Crouching_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_Crouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_Crouching_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_Crouching_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_Crouching_Frame1,
        .pOam = sSamusOam_Right_DiagonalUp_Crouching_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Crouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Crouching_Frame0,
        .pOam = sSamusOam_Right_Crouching_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Crouching_Frame1,
        .pOam = sSamusOam_Right_Crouching_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_Crouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Shooting_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalDown_Crouching_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_Crouching_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_Standing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalDown_Crouching_Frame1,
        .pOam = sSamusOam_Right_DiagonalDown_Crouching_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdb68[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Left_Running_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Left_Running_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Left_Running_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Left_Running_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Left_Running_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Left_Running_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Left_Running_Frame6,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Left_Running_Frame7,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Left_Running_Frame8,
        .timer = 2
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Left_Running_Frame9,
        .timer = 2
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdc18[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Right_Running_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Right_Running_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Right_Running_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_Right_Running_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Right_Running_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Right_Running_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Right_Running_Frame6,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Right_Running_Frame7,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_Right_Running_Frame8,
        .timer = 2
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Right_Running_Frame9,
        .timer = 2
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdcc8[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Left_Running_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Left_Running_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Left_Running_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_2bdcc8_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Left_Running_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Left_Running_Frame5,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Left_Running_Frame6,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Left_Running_Frame7,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_2bdcc8_Frame8,
        .timer = 2
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_Running_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Left_Running_Frame9,
        .timer = 1
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdd78[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame0,
        .pOam = sSamusOam_Right_Running_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame1,
        .pOam = sSamusOam_Right_Running_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame2,
        .pOam = sSamusOam_Right_Running_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame3,
        .pOam = sSamusOam_2bdd78_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame4,
        .pOam = sSamusOam_Right_Running_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame5,
        .pOam = sSamusOam_Right_Running_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame6,
        .pOam = sSamusOam_Right_Running_Frame6,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame7,
        .pOam = sSamusOam_Right_Running_Frame7,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame8,
        .pOam = sSamusOam_2bdd78_Frame8,
        .timer = 2
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Right_Running_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Left_Running_Frame9,
        .pOam = sSamusOam_Right_Running_Frame9,
        .timer = 1
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Skidding[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Skidding_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Skidding_Frame0,
        .pOam = sSamusOam_Left_Skidding_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Armed_Skidding[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Armed_Skidding_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Skidding_Frame0,
        .pOam = sSamusOam_Left_Skidding_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Skidding[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Skidding_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Skidding_Frame0,
        .pOam = sSamusOam_Right_Skidding_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Armed_Skidding[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Armed_Skidding_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Skidding_Frame0,
        .pOam = sSamusOam_Right_Armed_Skidding_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_HitByOmegaMetroid[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_HitByOmegaMetroid_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame0,
        .pOam = sSamusOam_Left_HitByOmegaMetroid_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_HitByOmegaMetroid_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1,
        .pOam = sSamusOam_Left_HitByOmegaMetroid_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_HitByOmegaMetroid_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame2,
        .pOam = sSamusOam_Left_HitByOmegaMetroid_Frame2,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_HitByOmegaMetroid_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1,
        .pOam = sSamusOam_Left_HitByOmegaMetroid_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_LookingUp_HitByOmegaMetroid[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_LookingUp_HitByOmegaMetroid_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame0,
        .pOam = sSamusOam_Left_LookingUp_HitByOmegaMetroid_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_LookingUp_HitByOmegaMetroid_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1,
        .pOam = sSamusOam_Left_LookingUp_HitByOmegaMetroid_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_LookingUp_HitByOmegaMetroid_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame2,
        .pOam = sSamusOam_Left_LookingUp_HitByOmegaMetroid_Frame2,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_LookingUp_HitByOmegaMetroid_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1,
        .pOam = sSamusOam_Left_LookingUp_HitByOmegaMetroid_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_HitByOmegaMetroid[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_HitByOmegaMetroid_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame0,
        .pOam = sSamusOam_Right_HitByOmegaMetroid_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_HitByOmegaMetroid_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1,
        .pOam = sSamusOam_Right_HitByOmegaMetroid_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_HitByOmegaMetroid_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame2,
        .pOam = sSamusOam_Right_HitByOmegaMetroid_Frame2,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_HitByOmegaMetroid_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1,
        .pOam = sSamusOam_Right_HitByOmegaMetroid_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_LookingUp_HitByOmegaMetroid[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_LookingUp_HitByOmegaMetroid_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame0,
        .pOam = sSamusOam_Right_LookingUp_HitByOmegaMetroid_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_LookingUp_HitByOmegaMetroid_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1,
        .pOam = sSamusOam_Right_LookingUp_HitByOmegaMetroid_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_LookingUp_HitByOmegaMetroid_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame2,
        .pOam = sSamusOam_Right_LookingUp_HitByOmegaMetroid_Frame2,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_LookingUp_HitByOmegaMetroid_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HitByOmegaMetroid_Frame1,
        .pOam = sSamusOam_Right_LookingUp_HitByOmegaMetroid_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_Left_DelayBeforeShinesparking_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DelayBeforeShinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DelayBeforeShinesparking_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DelayBeforeShinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_MidAir_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MidAir_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_MidAir_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MidAir_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_MidAir_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MidAir_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_MidAir_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MidAir_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MidAir_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MidAir_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_MidAir_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MidAir_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MidAir_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MidAir_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Left_MidAir_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MidAir_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MidAir_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MidAir_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_Landing_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_Landing_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Landing_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Landing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Landing_Frame1[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_Landing_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Landing_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Landing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_MidAir_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_MidAir_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_MidAir_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Forward_MidAir_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Forward_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Forward_MidAir_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Forward_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Forward_MidAir_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Forward_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c42a8_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c42a8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c42c8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2c42c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c42e8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c42e8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4308_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4308_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_GrabbedByYakuza_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_GrabbedByYakuza_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_GrabbedByYakuza_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_GrabbedByYakuza_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4328_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4328_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c4328_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4328_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DelayBeforeShinesparking_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DelayBeforeShinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_DelayBeforeShinesparking_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_DelayBeforeShinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_MidAir_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_MidAir_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_MidAir_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_MidAir_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MidAir_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Right_MidAir_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MidAir_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Right_MidAir_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MidAir_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Right_Landing_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_Landing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Landing_Frame1[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_Landing_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Landing_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Landing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_MidAir_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_MidAir_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_MidAir_Frame2[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_Forward_MidAir_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Forward_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Forward_MidAir_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Forward_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Forward_MidAir_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Forward_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_2c101c[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/2c101c.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_MidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_MidAir_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_MidAir_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c4668_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4668_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4688_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2c4688_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c46a8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c46a8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c46c8_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c46c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_GrabbedByYakuza_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_GrabbedByYakuza_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c46e8_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c46e8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Spinning_Frame0[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_Spinning_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Spinning_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_Spinning_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Spinning_Frame2[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_Spinning_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Spinning_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_Spinning_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Right_Spinning_Frame0[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Right_Spinning_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Spinning_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_Spinning_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Spinning_Frame2[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Right_Spinning_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_Spinning_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_Spinning_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_StartingSpinJump_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_StartingSpinJump_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_StartingSpinJump_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_StartingSpinJump_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_StartingSpinJump_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_StartingSpinJump_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Shinesparking_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_Shinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Shinesparking_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Shinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Shinesparking_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_Shinesparking_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Shinesparking_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Shinesparking_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Shinesparking_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_Shinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Shinesparking_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_Shinesparking_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Sidewards_Shinesparking_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Left_Sidewards_Shinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Sidewards_Shinesparking_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Sidewards_Shinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Sidewards_Shinesparking_Frame1[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Left_Sidewards_Shinesparking_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Sidewards_Shinesparking_Frame1[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Sidewards_Shinesparking_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Sidewards_Shinesparking_Frame0[] = {
    7, 7,
    _INCBIN_U8("data/samus/gfx/Top_Right_Sidewards_Shinesparking_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Sidewards_Shinesparking_Frame1[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_Sidewards_Shinesparking_Frame1.gfx")
};

static const u16 sSamusOam_Left_DelayBeforeShinesparking_Frame0[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe3, 0x1f0, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, 0x16,
    0xf8, 0x7, 0x18
};

static const u16 sSamusOam_Left_MidAir_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18,
    0xe0, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_Left_MidAir_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16,
    0xe0, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_Left_MidAir_Frame2[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16,
    0xe7, OBJ_SIZE_16x16 | 0x1f3, 0x2
};

static const u16 sSamusOam_Left_MidAir_Frame3[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16,
    0xe5, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_Left_MidAir_Frame4[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16,
    0xe2, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_Left_MidAir_Frame5[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16,
    0xe3, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_Left_Landing_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16,
    0xea, OBJ_SIZE_16x16 | 0x1f3, 0x2
};

static const u16 sSamusOam_Left_Landing_Frame1[] = {
    5,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xd9, 0x1f8, 0x4,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, 0x16,
    0xe8, OBJ_SIZE_16x16 | 0x1f3, 0x2
};

static const u16 sSamusOam_2c347a[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd1, 0x1f7, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, 0x16,
    0xf8, 0x7, 0x18
};

static const u16 sSamusOam_Left_Up_MidAir_Frame0[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd0, 0x1f7, 0x2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18
};

static const u16 sSamusOam_Left_Up_MidAir_Frame1[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd3, 0x1f7, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Up_MidAir_Frame2[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd6, 0x1f7, 0x2,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16
};

static const u16 sSamusOam_Left_Up_MidAir_Frame3[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd4, 0x1f7, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Up_MidAir_Frame4[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd1, 0x1f7, 0x2,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16
};

static const u16 sSamusOam_Left_Up_MidAir_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd2, 0x1f7, 0x2,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Up_Landing_Frame0[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd7, 0x1f7, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16
};

static const u16 sSamusOam_Left_Up_Landing_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd4, 0x1f7, 0x2,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c3570[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, 0x16,
    0xf8, 0x7, 0x18
};

static const u16 sSamusOam_Left_DiagonalUp_MidAir_Frame0[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x1ee, 0x2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18
};

static const u16 sSamusOam_Left_DiagonalUp_MidAir_Frame1[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1ee, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_MidAir_Frame2[] = {
    4,
    0xe1, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x1ee, 0x2,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_MidAir_Frame3[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1ee, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_MidAir_Frame4[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ee, 0x2,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_MidAir_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ef, 0x2,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Landing_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x1ee, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_Landing_Frame1[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1ee, 0x2,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c3666[] = {
    6,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd6, 0x1f8, 0x2,
    0xe6, 0x1ef, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, 0x16,
    0xf8, 0x7, 0x18
};

static const u16 sSamusOam_Left_Forward_MidAir_Frame0[] = {
    6,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd4, 0x1f7, 0x2,
    0xe4, 0x1ee, 0x3,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18
};

static const u16 sSamusOam_Left_Forward_MidAir_Frame1[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd5, 0x1f7, 0x2,
    0xe5, 0x1ee, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Forward_MidAir_Frame2[] = {
    5,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xda, 0x1f7, 0x2,
    0xea, 0x1ee, 0x3,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16
};

static const u16 sSamusOam_Left_Forward_MidAir_Frame3[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd7, 0x1f7, 0x2,
    0xe7, 0x1ee, 0x3,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Forward_MidAir_Frame4[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd4, 0x1f7, 0x2,
    0xe4, 0x1ee, 0x3,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16
};

static const u16 sSamusOam_Left_Forward_MidAir_Frame5[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd5, 0x1f7, 0x2,
    0xe5, 0x1ee, 0x3,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Forward_Landing_Frame0[] = {
    5,
    0xe4, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdc, 0x1f7, 0x2,
    0xec, 0x1ee, 0x3,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16
};

static const u16 sSamusOam_Left_Forward_Landing_Frame1[] = {
    5,
    0xe1, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd9, 0x1f7, 0x2,
    0xe9, 0x1ee, 0x3,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c3792[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f0, 0x2,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, 0x16,
    0xf8, 0x7, 0x18
};

static const u16 sSamusOam_Left_DiagonalDown_MidAir_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ef, 0x2,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18
};

static const u16 sSamusOam_Left_DiagonalDown_MidAir_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ef, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0
};

static const u16 sSamusOam_Left_DiagonalDown_MidAir_Frame2[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, 0x2,
    0xdd, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_MidAir_Frame3[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1ef, 0x2,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_MidAir_Frame4[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1ef, 0x2,
    0xd7, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_MidAir_Frame5[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1ef, 0x2,
    0xd9, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Landing_Frame0[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f0, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_Landing_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1ef, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c42a8_Frame0[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd5, 0x1f7, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c42c8_Frame0[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1ed, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c42e8_Frame0[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f5, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c4308_Frame0[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1ef, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_GrabbedByYakuza_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf2, OBJ_SIZE_16x16 | 0x1fe, 0x16
};

static const u16 sSamusOam_2c4328_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1fc, 0x14,
    0xf2, OBJ_SIZE_16x16 | 0x1fc, 0x16
};

static const u16 sSamusOam_Right_DelayBeforeShinesparking_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1fd, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f9, 0x16,
    0xf8, OBJ_X_FLIP | 0x1f1, 0x18
};

static const u16 sSamusOam_Right_MidAir_Frame0[] = {
    5,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_Right_MidAir_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_MidAir_Frame2[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_MidAir_Frame3[] = {
    4,
    0xe5, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_MidAir_Frame4[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1fe, 0x0,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_MidAir_Frame5[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1fe, 0x0,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Landing_Frame0[] = {
    4,
    0xea, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_Right_Landing_Frame1[] = {
    5,
    0xe8, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16,
    0xd9, OBJ_X_FLIP | 0x0, 0x4
};

static const u16 sSamusOam_2c3a20[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f9, 0x16,
    0xf8, OBJ_X_FLIP | 0x1f1, 0x18
};

static const u16 sSamusOam_Right_Up_MidAir_Frame0[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_Right_Up_MidAir_Frame1[] = {
    3,
    0xdb, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Up_MidAir_Frame2[] = {
    3,
    0xdf, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Up_MidAir_Frame3[] = {
    3,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Up_MidAir_Frame4[] = {
    3,
    0xd9, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_Up_MidAir_Frame5[] = {
    3,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Up_Landing_Frame0[] = {
    3,
    0xdf, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_2c3acc[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x9, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f9, 0x16,
    0xf8, OBJ_X_FLIP | 0x1f1, 0x18
};

static const u16 sSamusOam_Right_DiagonalUp_MidAir_Frame0[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0xa, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_Right_DiagonalUp_MidAir_Frame1[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0xa, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_MidAir_Frame2[] = {
    4,
    0xe1, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe1, 0xa, 0x2,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_MidAir_Frame3[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0xa, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_MidAir_Frame4[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xa, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_MidAir_Frame5[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x9, 0x2,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Landing_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe3, 0xa, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_Landing_Frame1[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdf, 0xa, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c3bc2[] = {
    5,
    0xd6, OBJ_X_FLIP | 0x0, 0x2,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f9, 0x16,
    0xf8, OBJ_X_FLIP | 0x1f1, 0x18
};

static const u16 sSamusOam_Right_Forward_MidAir_Frame0[] = {
    5,
    0xd4, OBJ_X_FLIP | 0x1, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_Right_Forward_MidAir_Frame1[] = {
    4,
    0xd5, OBJ_X_FLIP | 0x1, 0x2,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Forward_MidAir_Frame2[] = {
    4,
    0xda, OBJ_X_FLIP | 0x1, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Forward_MidAir_Frame3[] = {
    4,
    0xd7, OBJ_X_FLIP | 0x1, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Forward_MidAir_Frame4[] = {
    4,
    0xd4, OBJ_X_FLIP | 0x1, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_Forward_MidAir_Frame5[] = {
    4,
    0xd5, OBJ_X_FLIP | 0x1, 0x2,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Forward_Landing_Frame0[] = {
    4,
    0xdc, OBJ_X_FLIP | 0x1, 0x2,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_Right_Forward_Landing_Frame1[] = {
    4,
    0xd9, OBJ_X_FLIP | 0x1, 0x2,
    0xe1, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c3cb8[] = {
    5,
    0xea, 0x0, 0x2,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f9, 0x16,
    0xf8, OBJ_X_FLIP | 0x1f1, 0x18
};

static const u16 sSamusOam_Right_DiagonalDown_MidAir_Frame0[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, 0x1, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_Right_DiagonalDown_MidAir_Frame1[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, 0x1, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_MidAir_Frame2[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xed, 0x0, 0x2,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_MidAir_Frame3[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xea, 0x1, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_MidAir_Frame4[] = {
    4,
    0xd7, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe7, 0x1, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_MidAir_Frame5[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe9, 0x1, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Landing_Frame0[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xef, 0x0, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_Landing_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xec, 0x1, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4668_Frame0[] = {
    3,
    0xdd, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4688_Frame0[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0xb, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c46a8_Frame0[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | 0x1fb, 0x2,
    0xe0, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_GrabbedByYakuza_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1fc, 0x2,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x16
};

static const u16 sSamusOam_2c46e8_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1fc, 0x2,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f4, 0x14,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f4, 0x16
};

static const u16 sSamusOam_Left_Spinning_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe3, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_Left_Spinning_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xeb, OBJ_SIZE_32x16 | 0x1f0, 0x0
};

static const u16 sSamusOam_Left_Spinning_Frame3[] = {
    2,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, 0x2
};

static const u16 sSamusOam_Left_Spinning_Frame4[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe3, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_Left_Spinning_Frame5[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xeb, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0
};

static const u16 sSamusOam_Left_Spinning_Frame7[] = {
    2,
    0xf2, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe2, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2
};

static const u16 sSamusOam_Left_StartingSpinJump_Frame0[] = {
    4,
    0xe4, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16,
    0xeb, OBJ_SIZE_16x16 | 0x1f4, 0x2
};

static const u16 sSamusOam_Right_StartingSpinJump_Frame0[] = {
    4,
    0xe5, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xed, 0xa, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Shinesparking_Frame0[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Shinesparking_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Shinesparking_Frame0[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Shinesparking_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xd8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Sidewards_Shinesparking_Frame0[] = {
    4,
    0xec, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x5, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f5, 0x14
};

static const u16 sSamusOam_Left_Sidewards_Shinesparking_Frame1[] = {
    5,
    0xed, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x6, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f6, 0x14,
    0xf2, 0x16, 0x18
};

static const u16 sSamusOam_Right_Sidewards_Shinesparking_Frame0[] = {
    5,
    0xec, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xe0, OBJ_SIZE_16x16 | 0x1f3, 0x4,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x3, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1eb, 0x14
};

static const u16 sSamusOam_Right_Sidewards_Shinesparking_Frame1[] = {
    5,
    0xed, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f2, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x2, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ea, 0x14,
    0xf2, OBJ_X_FLIP | 0x1e2, 0x18
};

const struct SamusAnimationData sSamusAnim_Left_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Left_MidAir_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Left_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Left_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Left_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Left_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Left_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Landing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Left_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Landing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame1,
        .pOam = sSamusOam_Left_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Left_Up_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Left_Up_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Left_Up_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Left_Up_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Left_Up_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Left_Up_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Left_Up_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame1,
        .pOam = sSamusOam_Left_Up_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Left_DiagonalUp_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Left_DiagonalUp_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Left_DiagonalUp_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Left_DiagonalUp_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Left_DiagonalUp_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame1,
        .pOam = sSamusOam_Left_DiagonalUp_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Forward_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Left_Forward_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Left_Forward_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Left_Forward_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Left_Forward_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Left_Forward_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Left_Forward_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Forward_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Left_Forward_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Forward_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame1,
        .pOam = sSamusOam_Left_Forward_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Left_DiagonalDown_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Left_DiagonalDown_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Left_DiagonalDown_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Left_DiagonalDown_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Left_DiagonalDown_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame1,
        .pOam = sSamusOam_Left_DiagonalDown_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c42a8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c42a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_2c42a8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c42c8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c42c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_2c42c8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c42e8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c42e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_2c42e8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4308[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4308_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_2c4308_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4328[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4328_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c4328_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Right_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Right_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Right_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Right_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Right_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Right_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Landing_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Right_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Landing_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Right_Landing_Frame1,
        .pOam = sSamusOam_Right_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Right_Up_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Right_Up_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Right_Up_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Right_Up_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Right_Up_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Right_Up_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Right_Up_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Right_Landing_Frame1,
        .pOam = sSamusOam_Right_Up_MidAir_Frame3,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Right_DiagonalUp_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Right_DiagonalUp_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Right_DiagonalUp_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Right_DiagonalUp_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Right_DiagonalUp_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Right_Landing_Frame1,
        .pOam = sSamusOam_Right_DiagonalUp_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Forward_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Right_Forward_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Right_Forward_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Right_Forward_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Right_Forward_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Right_Forward_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Right_Forward_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Forward_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Right_Forward_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Forward_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Right_Landing_Frame1,
        .pOam = sSamusOam_Right_Forward_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_MidAir[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_MidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Right_DiagonalDown_MidAir_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Right_DiagonalDown_MidAir_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Right_DiagonalDown_MidAir_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame4,
        .pOam = sSamusOam_Right_DiagonalDown_MidAir_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame5,
        .pOam = sSamusOam_Right_DiagonalDown_MidAir_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_Landing[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_Landing_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_Landing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Right_Landing_Frame1,
        .pOam = sSamusOam_Right_DiagonalDown_Landing_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4668[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4668_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_2c4668_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4688[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4688_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_2c4688_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c46a8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c46a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_2c46a8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c46c8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c46c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame3,
        .pOam = sSamusOam_Right_DiagonalDown_Landing_Frame1,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c46e8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c46e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c46e8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_GrabbedByYakuza[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_GrabbedByYakuza_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_GrabbedByYakuza_Frame0,
        .pOam = sSamusOam_Left_GrabbedByYakuza_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4328_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c4328_Frame0,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4328_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c4328_Frame0,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4328_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c4328_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4328_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c4328_Frame0,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4328_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c4328_Frame0,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_GrabbedByYakuza[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_GrabbedByYakuza_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_GrabbedByYakuza_Frame0,
        .pOam = sSamusOam_Right_GrabbedByYakuza_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c46e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c46e8_Frame0,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c46e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c46e8_Frame0,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c46e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c46e8_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c46e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c46e8_Frame0,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c46e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4328_Frame0,
        .pOam = sSamusOam_2c46e8_Frame0,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Spinning[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame7,
        .timer = 2
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Spinning[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame7,
        .timer = 2
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_StartingSpinJump[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_StartingSpinJump_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_StartingSpinJump_Frame0,
        .pOam = sSamusOam_Left_StartingSpinJump_Frame0,
        .timer = 2
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_StartingSpinJump[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_StartingSpinJump_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_StartingSpinJump_Frame0,
        .pOam = sSamusOam_Right_StartingSpinJump_Frame0,
        .timer = 2
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DelayBeforeShinesparking[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DelayBeforeShinesparking_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DelayBeforeShinesparking_Frame0,
        .pOam = sSamusOam_Left_DelayBeforeShinesparking_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Left_MidAir_Frame0,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Left_MidAir_Frame1,
        .timer = 6
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Left_MidAir_Frame2,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Shinesparking[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Shinesparking_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Shinesparking_Frame0,
        .pOam = sSamusOam_Left_Shinesparking_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Shinesparking_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Shinesparking_Frame1,
        .pOam = sSamusOam_Left_Shinesparking_Frame1,
        .timer = 255
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DelayBeforeShinesparking[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DelayBeforeShinesparking_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DelayBeforeShinesparking_Frame0,
        .pOam = sSamusOam_Right_DelayBeforeShinesparking_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame0,
        .pOam = sSamusOam_Right_MidAir_Frame0,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame1,
        .pOam = sSamusOam_Right_MidAir_Frame1,
        .timer = 6
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_MidAir_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MidAir_Frame2,
        .pOam = sSamusOam_Right_MidAir_Frame2,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Shinesparking[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Shinesparking_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Shinesparking_Frame0,
        .pOam = sSamusOam_Right_Shinesparking_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Shinesparking_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Shinesparking_Frame1,
        .pOam = sSamusOam_Right_Shinesparking_Frame1,
        .timer = 255
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Sidewards_Shinesparking[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Sidewards_Shinesparking_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Sidewards_Shinesparking_Frame0,
        .pOam = sSamusOam_Left_Sidewards_Shinesparking_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Sidewards_Shinesparking_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Sidewards_Shinesparking_Frame1,
        .pOam = sSamusOam_Left_Sidewards_Shinesparking_Frame1,
        .timer = 255
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Sidewards_Shinesparking[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Sidewards_Shinesparking_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Sidewards_Shinesparking_Frame0,
        .pOam = sSamusOam_Right_Sidewards_Shinesparking_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Sidewards_Shinesparking_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Sidewards_Shinesparking_Frame1,
        .pOam = sSamusOam_Right_Sidewards_Shinesparking_Frame1,
        .timer = 255
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DelayAfterShinesparking[10] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Shinesparking_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Shinesparking_Frame1,
        .pOam = sSamusOam_Left_Shinesparking_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame1,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame3,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame5,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame7,
        .timer = 2
    },
    [9] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DelayAfterShinesparking[10] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Shinesparking_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Shinesparking_Frame1,
        .pOam = sSamusOam_Right_Shinesparking_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame1,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame3,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame5,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame7,
        .timer = 2
    },
    [9] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Sidewards_DelayAfterShinesparking[10] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Sidewards_Shinesparking_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Sidewards_Shinesparking_Frame1,
        .pOam = sSamusOam_Left_Sidewards_Shinesparking_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame1,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame3,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame5,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame7,
        .timer = 2
    },
    [9] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Sidewards_DelayAfterShinesparking[10] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Sidewards_Shinesparking_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Sidewards_Shinesparking_Frame1,
        .pOam = sSamusOam_Right_Sidewards_Shinesparking_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame1,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame3,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame5,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame4,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_Spinning_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Spinning_Frame7,
        .timer = 2
    },
    [9] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_Left_Up_UnusedCrouching_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_2c4dca[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/2c4dca.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_TurningAround_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_TurningAround_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_TurningAround_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_TurningAround_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_TurningAround_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_TurningAround_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_UnusedCrouching_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_UnusedCrouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_2c5276[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/2c5276.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_TurningAround_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_TurningAround_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_TurningAround_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_UnusedCrouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_UnusedCrouching_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_2c5782[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/2c5782.gfx")
};

static const u8 sSamusGfx_Top_Left_TurningAround_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_TurningAround_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_TurningAround_Frame1[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_TurningAround_Frame1.gfx")
};

static const u8 sSamusGfx_2c5a68[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/2c5a68.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_UnusedCrouching_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_2c5c4c[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/2c5c4c.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_TurningAround_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_TurningAround_Frame1.gfx")
};

static const u8 sSamusGfx_2c5f52[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/2c5f52.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_UnusedCrouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_TurningAroundAndCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_UnusedCrouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_UnusedCrouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_UnusedCrouching_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalDown_UnusedCrouching_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalDown_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_UnusedCrouching_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_UnusedCrouching_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_TurningAroundMidAir_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_TurningAroundMidAir_Frame0[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_TurningAroundMidAir_Frame0.gfx")
};

static const u8 sSamusGfx_2c6746[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/2c6746.gfx")
};

static const u8 sSamusGfx_Top_Left_Unmorphing_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_Unmorphing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Morphing_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_Morphing_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Morphing_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Morphing_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_MorphBall_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_MorphBall_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Morphing_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Morphing_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_MorphBall_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_MorphBall_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_OnSavePad_Frame1[] = {
    9, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnSavePad_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_OnSavePad_Frame2[] = {
    9, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnSavePad_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_OnSavePad_Frame3[] = {
    9, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnSavePad_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_OnNavigationPad_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnNavigationPad_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_OnNavigationPad_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_OnNavigationPad_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_OnNavigationPad_Frame1[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnNavigationPad_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_OnNavigationPad_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_OnNavigationPad_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_OnNavigationPad_Frame0[] = {
    6, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_OnNavigationPad_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_OnNavigationPad_Frame2[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnNavigationPad_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_OnNavigationPad_Frame3[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnNavigationPad_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_OnNavigationPad_Frame6[] = {
    7, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnNavigationPad_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Left_OnNavigationPad_Frame7[] = {
    8, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnNavigationPad_Frame7.gfx")
};

static const u8 sSamusGfx_Top_Left_OnNavigationPad_Frame14[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnNavigationPad_Frame14.gfx")
};

static const u8 sSamusGfx_Top_Left_OnNavigationPad_Frame12[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_OnNavigationPad_Frame12.gfx")
};

static const u8 sSamusGfx_Top_Left_UsingAnElevator_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_UsingAnElevator_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_UsingAnElevator_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_UsingAnElevator_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_UsingAnElevator_Frame2[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_UsingAnElevator_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_UsingAnElevator_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_UsingAnElevator_Frame2.gfx")
};

static const u8 sSamusGfx_2c8178[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/2c8178.gfx")
};

static const u8 sSamusGfx_2c829a[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/2c829a.gfx")
};

static const u8 sSamusGfx_Top_Right_UsingAnElevator_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_UsingAnElevator_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DownloadingAbility_Frame0[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DownloadingAbility_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DownloadingAbility_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DownloadingAbility_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DownloadingAbility_Frame2[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DownloadingAbility_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DownloadingAbility_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DownloadingAbility_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_DownloadingAbility_Frame4[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DownloadingAbility_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DownloadingAbility_Frame4[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DownloadingAbility_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Left_DownloadingAbility_Frame6[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DownloadingAbility_Frame6.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DownloadingAbility_Frame6[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DownloadingAbility_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Left_DownloadingAbility_Frame3[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DownloadingAbility_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DownloadingAbility_Frame3[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DownloadingAbility_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_DownloadingAbility_Frame5[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DownloadingAbility_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DownloadingAbility_Frame5[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DownloadingAbility_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_DownloadingAbility_Frame7[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DownloadingAbility_Frame7.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DownloadingAbility_Frame7[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DownloadingAbility_Frame7.gfx")
};

static const u8 sSamusGfx_Top_Left_DownloadingAbility_Frame9[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DownloadingAbility_Frame9.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DownloadingAbility_Frame9[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DownloadingAbility_Frame9.gfx")
};

static const u8 sSamusGfx_Top_Left_BeingRecharged_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_BeingRecharged_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_BeingRecharged_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_BeingRecharged_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_BeingRecharged_Frame2[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_BeingRecharged_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_BeingRecharged_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_BeingRecharged_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_BeingRecharged_Frame4[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_BeingRecharged_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_Left_BeingRecharged_Frame4[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_BeingRecharged_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Left_BeingRecharged_Frame6[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_BeingRecharged_Frame6.gfx")
};

static const u8 sSamusGfx_Bottom_Left_BeingRecharged_Frame6[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_BeingRecharged_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Left_BeingRecharged_Frame1[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_BeingRecharged_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_BeingRecharged_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_BeingRecharged_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_BeingRecharged_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_BeingRecharged_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_BeingRecharged_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_BeingRecharged_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_BeingRecharged_Frame4[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_BeingRecharged_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Right_BeingRecharged_Frame6[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_BeingRecharged_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Right_BeingRecharged_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_BeingRecharged_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_UnlockingSecurity_Frame0[] = {
    7, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_UnlockingSecurity_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_UnlockingSecurity_Frame0[] = {
    6, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_UnlockingSecurity_Frame0.gfx")
};

static const u8 sSamusGfx_Top_UnlockingHabitationsDeck_Frame0[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_UnlockingHabitationsDeck_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_UnlockingHabitationsDeck_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_UnlockingHabitationsDeck_Frame0.gfx")
};

static const u8 sSamusGfx_Top_UnlockingHabitationsDeck_Frame1[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_UnlockingHabitationsDeck_Frame1.gfx")
};

static const u8 sSamusGfx_Top_UnlockingHabitationsDeck_Frame4[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_UnlockingHabitationsDeck_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_UnlockingHabitationsDeck_Frame4[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_UnlockingHabitationsDeck_Frame4.gfx")
};

static const u16 sSamusOam_2ca66a[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd2, 0x1f7, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_Left_Up_TurningAround_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xd2, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_Left_Up_TurningAround_Frame1[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xd2, 0x0, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17
};

static const u16 sSamusOam_2ca6ca[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xd2, 0x1, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17
};

static const u16 sSamusOam_2ca6ea[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ed, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_TurningAround_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1f0, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_TurningAround_Frame1[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xda, 0xa, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16
};

static const u16 sSamusOam_2ca74a[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16
};

static const u16 sSamusOam_2ca76a[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f7, 0x2,
    0xe7, 0x1ef, 0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_Left_TurningAround_Frame0[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, 0x3,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f0, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_Left_TurningAround_Frame1[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f8, 0x2,
    0xe0, 0x8, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16
};

static const u16 sSamusOam_2ca7dc[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f9, 0x2,
    0xe7, 0x9, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17
};

static const u16 sSamusOam_2ca802[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe5, OBJ_SIZE_16x16 | 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_Left_DiagonalDown_TurningAround_Frame0[] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f3, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x3, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f3, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_TurningAround_Frame1[] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f8, 0x3,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16
};

static const u16 sSamusOam_2ca86e[] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x3, 0x2,
    0xe5, 0xb, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17
};

static const u16 sSamusOam_Left_Up_TurningAroundAndCrouching_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_Up_TurningAroundAndCrouching_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xda, 0x0, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_Right_Up_UnusedCrouching_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x0, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_UnusedCrouching_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_TurningAroundAndCrouching_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1f1, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_TurningAroundAndCrouching_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe2, 0x9, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_Right_DiagonalUp_UnusedCrouching_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x9, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_Left_UnusedCrouching_Frame0[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f7, 0x2,
    0xef, 0x1ef, 0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_TurningAroundAndCrouching_Frame0[] = {
    5,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f7, 0x3,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_TurningAroundAndCrouching_Frame1[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f8, 0x2,
    0xe8, 0x8, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_Right_UnusedCrouching_Frame0[] = {
    4,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f9, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_UnusedCrouching_Frame0[] = {
    4,
    0xe7, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xef, OBJ_SIZE_16x16 | 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_TurningAroundAndCrouching_Frame0[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1f2, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x2, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f2, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_TurningAroundAndCrouching_Frame1[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f8, 0x3,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_UnusedCrouching_Frame0[] = {
    4,
    0xe7, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xf7, 0x3, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_Left_Up_TurningAroundMidAir_Frame0[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xd6, 0x1f8, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Up_TurningAroundMidAir_Frame1[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xd6, 0x0, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_TurningAroundMidAir_Frame0[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1f0, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_DiagonalUp_TurningAroundMidAir_Frame1[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xde, 0xa, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_TurningAroundMidAir_Frame0[] = {
    5,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f8, 0x3,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f0, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_TurningAroundMidAir_Frame1[] = {
    5,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdb, 0x1f8, 0x2,
    0xe4, 0x8, 0x4,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_TurningAroundMidAir_Frame0[] = {
    6,
    0xe1, OBJ_SIZE_16x16 | 0x1f3, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x3, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f3, 0x3,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16,
    0xf2, 0x1f1, OBJ_PALETTE_1 | 0x5
};

static const u16 sSamusOam_Left_DiagonalDown_TurningAroundMidAir_Frame1[] = {
    5,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f8, 0x3,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2cab26[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xd7, 0x1fa, 0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    0xe4, OBJ_SIZE_16x16 | 0x1f1, 0x2
};

static const u16 sSamusOam_2cab4c[] = {
    6,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd7, OBJ_X_FLIP | 0x1fe, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x2
};

static const u16 sSamusOam_Left_Unmorphing_Frame2[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x3
};

static const u16 sSamusOam_Left_Morphing_Frame0[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x3,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x2
};

static const u16 sSamusOam_Left_Morphing_Frame1[] = {
    1,
    0xef, OBJ_SIZE_16x16 | 0x1f7, 0x0
};

static const u16 sSamusOam_Left_MorphBall_Frame0[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Left_MorphBall_Frame1[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Left_MorphBall_Frame2[] = {
    2,
    0xef, 0x1f8, 0x2,
    0xee, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Left_MorphBall_Frame3[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xef, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Left_MorphBall_Frame4[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Left_MorphBall_Frame5[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xef, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Left_MorphBall_Frame6[] = {
    2,
    0xef, 0x1f8, 0x2,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Left_Morphing_Frame2[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Right_Unmorphing_Frame2[] = {
    3,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x3
};

static const u16 sSamusOam_Right_Morphing_Frame0[] = {
    3,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x3,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x2
};

static const u16 sSamusOam_Right_Morphing_Frame1[] = {
    1,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0
};

static const u16 sSamusOam_Left_OnSavePad_Frame1[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, 0x6,
    0xf8, 0x4, 0x8,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, 0x5
};

static const u16 sSamusOam_Left_OnNavigationPad_Frame0[] = {
    3,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_Left_OnNavigationPad_Frame1[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x5, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, 0x3,
    0xe8, 0x5, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_Right_OnNavigationPad_Frame0[] = {
    4,
    0xe4, OBJ_SIZE_16x16 | 0x1fe, 0x0,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f9, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14
};

static const u16 sSamusOam_Left_OnNavigationPad_Frame2[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x1f5, 0x2,
    0xe8, 0x1f5, 0x5,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fd, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_Left_OnNavigationPad_Frame6[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1ed, 0x0,
    0xe8, 0x1f5, 0x6,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fd, 0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_Left_OnNavigationPad_Frame7[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1ed, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ed, 0x4,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fd, 0x6,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_Left_OnNavigationPad_Frame12[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fd, 0x3,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x1f5, 0x2,
    0xe8, 0x1f5, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_Left_UsingAnElevator_Frame2[] = {
    6,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x5, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, 0x3,
    0xe8, 0x5, 0x5
};

static const u16 sSamusOam_2cad7a[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x7, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x3,
    0xe8, 0x6, 0x5
};

static const u16 sSamusOam_Right_UsingAnElevator_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x1f7, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, 0x3
};

static const u16 sSamusOam_Left_DownloadingAbility_Frame0[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f4, 0x3,
    0xe8, 0x4, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, 0x16
};

static const u16 sSamusOam_Left_BeingRecharged_Frame0[] = {
    5,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f5, 0x2,
    0xe8, 0x1ed, 0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_Right_BeingRecharged_Frame0[] = {
    4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fb, 0x2
};

static const u16 sSamusOam_Right_BeingRecharged_Frame1[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16
};

static const u16 sSamusOam_Left_UnlockingSecurity_Frame0[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f5, 0x2,
    0xe8, 0x1ed, 0x6,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ed, 0x4
};

static const u16 sSamusOam_Right_UnlockingSecurity_Frame0[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x3, 0x4
};

static const u16 sSamusOam_UnlockingHabitationsDeck_Frame0[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f3, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x3, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f3, 0x3,
    0xea, 0x3, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_UnlockingHabitationsDeck_Frame4[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x7, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, 0x3,
    0xe9, 0x7, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf8, 0x7, 0x16
};

const struct SamusAnimationData sSamusAnim_Left_Up_TurningAround[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAround_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAround_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAround_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAround_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_TurningAround[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAround_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAround_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAround_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAround_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_TurningAround[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAround_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAround_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_TurningAround[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAround_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAround_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_TurningAround[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_TurningAround_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_TurningAround_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_TurningAround[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_TurningAround_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_TurningAround_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_TurningAround[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAround_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAround_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_TurningAround[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAround_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAround_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_TurningAroundAndCrouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundAndCrouching_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundAndCrouching_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_TurningAroundAndCrouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundAndCrouching_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundAndCrouching_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_TurningAroundAndCrouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAroundAndCrouching_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAroundAndCrouching_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_TurningAroundAndCrouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAroundAndCrouching_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAroundAndCrouching_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_TurningAroundAndCrouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_TurningAroundAndCrouching_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_TurningAroundAndCrouching_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_TurningAroundAndCrouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_TurningAroundAndCrouching_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_TurningAroundAndCrouching_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_TurningAroundAndCrouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAroundAndCrouching_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAroundAndCrouching_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_TurningAroundAndCrouching[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAroundAndCrouching_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundAndCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAroundAndCrouching_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_TurningAroundMidAir[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundMidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundMidAir_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_TurningAroundMidAir[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundMidAir_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundMidAir_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_TurningAroundMidAir[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAroundMidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAroundMidAir_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_TurningAroundMidAir[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAroundMidAir_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_TurningAroundMidAir_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_TurningAroundMidAir[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_TurningAroundMidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_TurningAroundMidAir_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_TurningAroundMidAir[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_TurningAroundMidAir_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_TurningAroundMidAir_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_TurningAroundMidAir[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAroundMidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAroundMidAir_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAroundMidAir_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_TurningAroundMidAir[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAroundMidAir_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_TurningAroundMidAir_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_TurningAroundMidAir_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_TurningAroundMidAir_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_UnusedCrouching[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_UnusedCrouching_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_UnusedCrouching_Frame0,
        .pOam = sSamusOam_Left_Up_TurningAroundAndCrouching_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_UnusedCrouching[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_UnusedCrouching_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_UnusedCrouching_Frame0,
        .pOam = sSamusOam_Right_Up_UnusedCrouching_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_UnusedCrouching[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_UnusedCrouching_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_UnusedCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_UnusedCrouching_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_UnusedCrouching[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_UnusedCrouching_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_UnusedCrouching_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_UnusedCrouching_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_UnusedCrouching[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_UnusedCrouching_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_UnusedCrouching_Frame0,
        .pOam = sSamusOam_Left_UnusedCrouching_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_UnusedCrouching[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_UnusedCrouching_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_UnusedCrouching_Frame0,
        .pOam = sSamusOam_Right_UnusedCrouching_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_UnusedCrouching[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_UnusedCrouching_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_UnusedCrouching_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_UnusedCrouching_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_UnusedCrouching[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_UnusedCrouching_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_UnusedCrouching_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_UnusedCrouching_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Morphing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Morphing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Morphing_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Morphing_Frame2,
        .timer = 2
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_MorphBall[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_MorphBall_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_MorphBall_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_MorphBall_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_MorphBall_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Morphing_Frame2,
        .timer = 3
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Unmorphing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Morphing_Frame1,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Morphing_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Unmorphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Unmorphing_Frame2,
        .timer = 1
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Morphing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Morphing_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Morphing_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame1,
        .timer = 2
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_MorphBall[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_MorphBall_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Morphing_Frame2,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_MorphBall_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame6,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame5,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_MorphBall_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame3,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_MorphBall_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame2,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_MorphBall_Frame1,
        .timer = 3
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Unmorphing[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Morphing_Frame1,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Morphing_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Morphing_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Unmorphing_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Unmorphing_Frame2,
        .timer = 1
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_OnSavePad[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_TurningAround_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_OnSavePad[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_TurningAround_Frame1,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_FacingForeground[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_TurningAround_Frame0,
        .timer = 4
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_FacingForeground[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAround_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_TurningAround_Frame0,
        .pOam = sSamusOam_Left_TurningAround_Frame1,
        .timer = 4
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_OnNavigationPad[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame0,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame0,
        .timer = 6
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame6,
        .timer = 4
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame6,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame7,
        .timer = 4
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame6,
        .timer = 4
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame12,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame12,
        .timer = 4
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 12
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame14,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 30
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 8
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_FacingBackground[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame0,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame0,
        .timer = 4
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_OnNavigationPad[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_OnNavigationPad_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame0,
        .pOam = sSamusOam_Right_OnNavigationPad_Frame0,
        .timer = 6
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame6,
        .timer = 4
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame6,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame7,
        .timer = 4
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame2,
        .timer = 4
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame6,
        .timer = 4
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame12,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame12,
        .timer = 4
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 12
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame14,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 30
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 8
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_FacingBackground[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_OnNavigationPad_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame0,
        .pOam = sSamusOam_Right_OnNavigationPad_Frame0,
        .timer = 8
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_UsingAnElevator[6] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_UsingAnElevator_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_UsingAnElevator_Frame0,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame0,
        .timer = 6
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_UsingAnElevator_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_UsingAnElevator_Frame2,
        .pOam = sSamusOam_Left_UsingAnElevator_Frame2,
        .timer = 6
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_UsingAnElevator_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_UsingAnElevator_Frame2,
        .pOam = sSamusOam_Left_UsingAnElevator_Frame2,
        .timer = 255
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_UsingAnElevator_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_UsingAnElevator_Frame2,
        .pOam = sSamusOam_Left_UsingAnElevator_Frame2,
        .timer = 4
    },
    [5] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_UsingAnElevator[6] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_UsingAnElevator_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_UsingAnElevator_Frame0,
        .pOam = sSamusOam_Right_UsingAnElevator_Frame0,
        .timer = 6
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_UsingAnElevator_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_UsingAnElevator_Frame2,
        .pOam = sSamusOam_Left_UsingAnElevator_Frame2,
        .timer = 6
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_UsingAnElevator_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_UsingAnElevator_Frame2,
        .pOam = sSamusOam_Left_UsingAnElevator_Frame2,
        .timer = 255
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_UsingAnElevator_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_UsingAnElevator_Frame2,
        .pOam = sSamusOam_Left_UsingAnElevator_Frame2,
        .timer = 4
    },
    [5] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DownloadingAbility[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame0,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame2,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame3,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame4,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame5,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame6,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame7,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame0,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame9,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame2,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame7,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame4,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame5,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame6,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame3,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DownloadingAbility[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame0,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_OnSavePad_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_OnSavePad_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame2,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame3,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame4,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame5,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame6,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame7,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame0,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame9,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame2,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame7,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame4,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame5,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame6,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_Left_DownloadingAbility_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_DownloadingAbility_Frame3,
        .pOam = sSamusOam_Left_DownloadingAbility_Frame0,
        .timer = 1
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_BeingRecharged[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_BeingRecharged_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame0,
        .pOam = sSamusOam_Left_BeingRecharged_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_BeingRecharged_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Left_BeingRecharged_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_BeingRecharged_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame2,
        .pOam = sSamusOam_Left_BeingRecharged_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_BeingRecharged_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Left_BeingRecharged_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_BeingRecharged_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame4,
        .pOam = sSamusOam_Left_BeingRecharged_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_BeingRecharged_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Left_BeingRecharged_Frame0,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_BeingRecharged_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame6,
        .pOam = sSamusOam_Left_BeingRecharged_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_BeingRecharged_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Left_BeingRecharged_Frame0,
        .timer = 1
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_BeingRecharged[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_BeingRecharged_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame0,
        .pOam = sSamusOam_Right_BeingRecharged_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_BeingRecharged_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Right_BeingRecharged_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_BeingRecharged_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame2,
        .pOam = sSamusOam_Right_BeingRecharged_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_BeingRecharged_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Right_BeingRecharged_Frame1,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_BeingRecharged_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame4,
        .pOam = sSamusOam_Right_BeingRecharged_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_BeingRecharged_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Right_BeingRecharged_Frame1,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_BeingRecharged_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame6,
        .pOam = sSamusOam_Right_BeingRecharged_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_BeingRecharged_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Right_BeingRecharged_Frame1,
        .timer = 1
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_UnlockingSecurity[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_UnlockingSecurity_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Left_UnlockingSecurity_Frame0,
        .timer = 60
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_UnlockingSecurity[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_UnlockingSecurity_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_BeingRecharged_Frame1,
        .pOam = sSamusOam_Right_UnlockingSecurity_Frame0,
        .timer = 60
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_UnlockingHabitationsDeck[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_UnlockingHabitationsDeck_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_UnlockingHabitationsDeck_Frame0,
        .pOam = sSamusOam_UnlockingHabitationsDeck_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_UnlockingHabitationsDeck_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_UnlockingHabitationsDeck_Frame0,
        .pOam = sSamusOam_UnlockingHabitationsDeck_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_UnlockingHabitationsDeck_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_UnlockingHabitationsDeck_Frame0,
        .pOam = sSamusOam_UnlockingHabitationsDeck_Frame0,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_OnNavigationPad_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame1,
        .pOam = sSamusOam_Left_OnNavigationPad_Frame7,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_UnlockingHabitationsDeck_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_UnlockingHabitationsDeck_Frame4,
        .pOam = sSamusOam_UnlockingHabitationsDeck_Frame4,
        .timer = 32
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_OnNavigationPad_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_OnNavigationPad_Frame0,
        .pOam = sSamusOam_Right_OnNavigationPad_Frame0,
        .timer = 4
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame3[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingFromVerticalLadder_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingFromVerticalLadder_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame4[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingFromVerticalLadder_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame4[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingFromVerticalLadder_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame5[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingFromVerticalLadder_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame5[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingFromVerticalLadder_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingFromVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingFromVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame1[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingFromVerticalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingFromVerticalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame2[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingFromVerticalLadder_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingFromVerticalLadder_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingFromVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame1[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingFromVerticalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame2[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingFromVerticalLadder_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame3[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingFromVerticalLadder_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame4[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingFromVerticalLadder_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame5[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingFromVerticalLadder_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1[] = {
    6, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_ShootingOnVerticalLadder_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_ShootingOnVerticalLadder_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_ShootingOnVerticalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_ShootingOnVerticalLadder_Frame0[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_StartingWallJump_Frame0[] = {
    7, 7,
    _INCBIN_U8("data/samus/gfx/Top_Left_StartingWallJump_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_StartingWallJump_Frame1[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_StartingWallJump_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_StartingWallJump_Frame0[] = {
    7, 7,
    _INCBIN_U8("data/samus/gfx/Top_Right_StartingWallJump_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_StartingWallJump_Frame1[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_StartingWallJump_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingOnLedge_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingOnLedge_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingOnLedge_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingOnLedge_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingOnLedge_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingOnLedge_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingOnLedge_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingOnLedge_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingOnLedge_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingOnLedge_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingOnLedge_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingOnLedge_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingOnLedge_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingOnLedge_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingOnLedge_Frame5[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingOnLedge_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingOnLedge_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingOnLedge_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingOnLedge_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingOnLedge_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_PullingYourselfUpFromHanging_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_PullingYourselfUpFromHanging_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_PullingYourselfUpFromHanging_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_PullingYourselfUpFromHanging_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_PullingYourselfUpFromHanging_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_PullingYourselfUpFromHanging_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_PullingYourselfUpFromHanging_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_PullingYourselfUpFromHanging_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_PullingYourselfForwardFromHanging_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_PullingYourselfForwardFromHanging_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_PullingYourselfForwardFromHanging_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_PullingYourselfForwardFromHanging_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_PullingYourselfForwardFromHanging_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_PullingYourselfForwardFromHanging_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_PullingYourselfForwardFromHanging_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_PullingYourselfForwardFromHanging_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingOnLedge_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingOnLedge_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingOnLedge_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingOnLedge_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingOnLedge_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingOnLedge_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingOnLedge_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingOnLedge_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingOnLedge_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingOnLedge_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_PullingYourselfUpFromHanging_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_PullingYourselfUpFromHanging_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_PullingYourselfUpFromHanging_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_PullingYourselfUpFromHanging_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_PullingYourselfForwardFromHanging_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_PullingYourselfForwardFromHanging_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_PullingYourselfForwardFromHanging_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Right_PullingYourselfForwardFromHanging_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_PullingYourselfForwardFromHanging_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_PullingYourselfForwardFromHanging_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_PullingYourselfIntoMorphBallTunnel_Frame0[] = {
    7, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_PullingYourselfIntoMorphBallTunnel_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_PullingYourselfIntoMorphBallTunnel_Frame0[] = {
    7, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_PullingYourselfIntoMorphBallTunnel_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d67bc_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d67bc_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d67bc_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d67bc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d67bc_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d67bc_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2d67bc_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d67bc_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d67bc_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d67bc_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2d67bc_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d67bc_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame1[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame3[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame4[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame4[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame5[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame5[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame6[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame6.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame6[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame7[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame7.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame7[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame7.gfx")
};

static const u8 sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame8[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Left_MovingOnHorizontalLadder_Frame8.gfx")
};

static const u8 sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame8[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_MovingOnHorizontalLadder_Frame8.gfx")
};

static const u8 sSamusGfx_Top_Left_TurningAroundOnHorizontalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_TurningAroundOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_TurningAroundOnHorizontalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_TurningAroundOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_TurningAroundOnHorizontalLadder_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_TurningAroundOnHorizontalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d691c_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d691c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d691c_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d691c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d691c_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d691c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame1[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame2[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame5[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame6[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame7[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame7.gfx")
};

static const u8 sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame8[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_MovingOnHorizontalLadder_Frame8.gfx")
};

static const u8 sSamusGfx_Top_Left_HangingOnHorizontalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_HangingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_HangingOnHorizontalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_HangingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_ShootingOnHorizontalLadder_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_ShootingOnHorizontalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Down_ShootingOnHorizontalLadder_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_Down_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Down_ShootingOnHorizontalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Down_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_HangingOnHorizontalLadder_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_HangingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_ShootingOnHorizontalLadder_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Right_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_DiagonalDown_ShootingOnHorizontalLadder_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_Right_DiagonalDown_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Down_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Down_DelayAfterShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Down_ShootingOnHorizontalLadder_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_Down_ShootingOnHorizontalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6c5c_Frame0[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d6c5c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6c5c_Frame4[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d6c5c_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2d6c5c_Frame5[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d6c5c_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d6cdc_Frame0[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d6cdc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6cdc_Frame4[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d6cdc_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2d6cdc_Frame5[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d6cdc_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Up_ShootingOnVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Up_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Up_ShootingOnVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Up_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_Down_ShootingOnVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Right_Down_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_Down_ShootingOnVerticalLadder_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_Down_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Up_ShootingOnVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Up_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Up_ShootingOnVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Up_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Down_ShootingOnVerticalLadder_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_Left_Down_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_Down_ShootingOnVerticalLadder_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_Down_ShootingOnVerticalLadder_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Left_ReadyToJump_HangingOnLedge_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Left_ReadyToJump_HangingOnLedge_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_Right_ReadyToJump_HangingOnLedge_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_Right_ReadyToJump_HangingOnLedge_Frame0.gfx")
};

static const u16 sSamusOam_Left_HangingFromVerticalLadder_Frame3[] = {
    5,
    0xe0, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x4
};

static const u16 sSamusOam_Left_HangingFromVerticalLadder_Frame4[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16,
    0xdb, OBJ_SIZE_16x16 | 0x1f4, 0x4
};

static const u16 sSamusOam_Left_HangingFromVerticalLadder_Frame5[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16,
    0xdf, OBJ_SIZE_16x16 | 0x1f5, 0x4
};

static const u16 sSamusOam_Left_HangingFromVerticalLadder_Frame0[] = {
    5,
    0xd7, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x2,
    0xea, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f7, 0x16,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x4
};

static const u16 sSamusOam_Left_HangingFromVerticalLadder_Frame1[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x4
};

static const u16 sSamusOam_Left_HangingFromVerticalLadder_Frame2[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, 0x4
};

static const u16 sSamusOam_Right_HangingFromVerticalLadder_Frame0[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x4
};

static const u16 sSamusOam_Right_HangingFromVerticalLadder_Frame1[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xdc, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, 0x4
};

static const u16 sSamusOam_Right_HangingFromVerticalLadder_Frame2[] = {
    5,
    0xd7, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16,
    0xde, OBJ_SIZE_16x16 | 0x1fa, 0x4
};

static const u16 sSamusOam_Right_HangingFromVerticalLadder_Frame3[] = {
    5,
    0xd7, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x1f9, 0x16,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x4
};

static const u16 sSamusOam_Right_HangingFromVerticalLadder_Frame4[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x4
};

static const u16 sSamusOam_Right_HangingFromVerticalLadder_Frame5[] = {
    5,
    0xe1, 0x7, 0x4,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x2
};

static const u16 sSamusOam_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    5,
    0xe3, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1f8, 0x16,
    0xd7, OBJ_SIZE_16x16 | 0x1fa, 0x4
};

static const u16 sSamusOam_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1[] = {
    4,
    0xe4, OBJ_SIZE_16x16 | 0x1f2, 0x0,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    0xe4, 0x1f2, 0x4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0[] = {
    4,
    0xe5, 0x1f2, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0
};

static const u16 sSamusOam_Left_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x1f2, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x3
};

static const u16 sSamusOam_Left_ShootingOnVerticalLadder_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x1f3, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x3
};

static const u16 sSamusOam_Left_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    0xe7, 0x1f2, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x2
};

static const u16 sSamusOam_Left_DiagonalDown_ShootingOnVerticalLadder_Frame0[] = {
    4,
    0xe6, 0x1f3, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x2
};

static const u16 sSamusOam_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x7, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14
};

static const u16 sSamusOam_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xea, 0x9, 0x2,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14
};

static const u16 sSamusOam_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    0xda, 0x1f7, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xe4, 0x6, 0x3
};

static const u16 sSamusOam_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0[] = {
    4,
    0xda, 0x1f7, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe5, 0x5, 0x3
};

static const u16 sSamusOam_Right_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    0xe9, 0x9, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14
};

static const u16 sSamusOam_Right_ShootingOnVerticalLadder_Frame0[] = {
    4,
    0xe9, 0x7, 0x2,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Right_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x7, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14
};

static const u16 sSamusOam_Right_DiagonalDown_ShootingOnVerticalLadder_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x5, 0x2,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Left_StartingWallJump_Frame0[] = {
    3,
    0xdf, OBJ_SIZE_16x16 | 0x1ea, 0x4,
    OBJ_SHAPE_VERTICAL | 0xdf, 0xfa, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x16 | 0x1e8, 0x0
};

static const u16 sSamusOam_Left_StartingWallJump_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1e8, 0x3,
    0xe6, 0x1f8, 0x5,
    0xee, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fe, 0x2
};

static const u16 sSamusOam_Right_StartingWallJump_Frame0[] = {
    3,
    0xde, OBJ_SIZE_16x16 | 0x1fe, 0x4,
    OBJ_SHAPE_VERTICAL | 0xde, 0xe, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_Right_StartingWallJump_Frame1[] = {
    4,
    0xee, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xee, 0xa, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, 0x3,
    0xe6, 0x10, 0x5
};

static const u16 sSamusOam_Left_HangingOnLedge_Frame2[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_HangingOnLedge_Frame3[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f6, 0x16,
    0xf7, OBJ_SIZE_16x16 | 0x1f6, 0x14
};

static const u16 sSamusOam_Left_HangingOnLedge_Frame1[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xef, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_HangingOnLedge_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xef, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_HangingOnLedge_Frame0[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdf, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xed, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    0xfd, 0x1fb, 0x16
};

static const u16 sSamusOam_Left_PullingYourselfUpFromHanging_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f7, 0x16
};

static const u16 sSamusOam_Left_PullingYourselfUpFromHanging_Frame2[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, 0x16
};

static const u16 sSamusOam_Left_PullingYourselfForwardFromHanging_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f9, 0x2,
    0xe1, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x3
};

static const u16 sSamusOam_Left_PullingYourselfForwardFromHanging_Frame1[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xe4, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf8, 0x1, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_X_FLIP | 0x1f8, 0x2
};

static const u16 sSamusOam_Left_PullingYourselfForwardFromHanging_Frame2[] = {
    4,
    0xe4, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fb, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ed, 0x2
};

static const u16 sSamusOam_Left_PullingYourselfForwardFromHanging_Frame3[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1ef, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_Right_HangingOnLedge_Frame2[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_HangingOnLedge_Frame3[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_X_FLIP | 0x1fa, 0x16,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14
};

static const u16 sSamusOam_Right_HangingOnLedge_Frame1[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xef, OBJ_X_FLIP | 0x0, 0x16
};

static const u16 sSamusOam_Right_HangingOnLedge_Frame5[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xef, OBJ_X_FLIP | 0x1ff, 0x16
};

static const u16 sSamusOam_Right_HangingOnLedge_Frame0[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    0xfd, OBJ_X_FLIP | 0x1fd, 0x16
};

static const u16 sSamusOam_Right_PullingYourselfUpFromHanging_Frame1[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_Right_PullingYourselfUpFromHanging_Frame2[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_PullingYourselfForwardFromHanging_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1ff, 0x2,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_PullingYourselfForwardFromHanging_Frame1[] = {
    4,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x0, 0x2,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf8, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_Right_PullingYourselfForwardFromHanging_Frame2[] = {
    4,
    0xe9, OBJ_SIZE_16x16 | 0x1, 0x0,
    0xe3, OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Right_PullingYourselfForwardFromHanging_Frame3[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_Left_PullingYourselfIntoMorphBallTunnel_Frame0[] = {
    5,
    0xf2, 0x1f9, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xe3, 0x1f4, 0x3,
    0xeb, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xea, 0x4, 0x2,
    0xfa, 0x4, 0x6
};

static const u16 sSamusOam_Right_PullingYourselfIntoMorphBallTunnel_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xec, 0x1fe, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe3, OBJ_X_FLIP | 0x1fc, 0x4,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, 0x0,
    OBJ_SHAPE_VERTICAL | 0xea, OBJ_X_FLIP | 0x1f4, 0x3,
    0xfa, OBJ_X_FLIP | 0x1f4, 0x6
};

static const u16 sSamusOam_2d67bc_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    0x2, 0x1fe, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x0, 0x3
};

static const u16 sSamusOam_2d67bc_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    0x2, 0x1fe, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x0, 0x3
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x4,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f8, 0x16,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x2
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame1[] = {
    5,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xdb, 0x0, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1ef, 0x2
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x3, 0x2,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f3, 0x3,
    0xe3, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame3[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fc, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xdb, 0x1f7, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1fa, 0x16
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame4[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f4, 0x3,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f9, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0x2, 0x1ff, 0x16
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame5[] = {
    5,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, 0x0,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f7, 0x16,
    0xdb, 0x1ff, 0x4
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame6[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1f1, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x1, 0x3,
    0xf1, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f6, 0x16
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame7[] = {
    5,
    0xda, 0x1f5, 0x3,
    0xf1, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f6, 0x16,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x5, 0x2
};

static const u16 sSamusOam_Left_MovingOnHorizontalLadder_Frame8[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f6, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1, 0x3
};

static const u16 sSamusOam_Left_TurningAroundOnHorizontalLadder_Frame0[] = {
    5,
    0xdb, 0x1fc, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xf3, 0x1f4, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f4, 0x14,
    0x2, 0x1fc, 0x16
};

static const u16 sSamusOam_Left_TurningAroundOnHorizontalLadder_Frame1[] = {
    5,
    0xe3, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdb, 0x1fe, 0x2,
    0xf3, 0x1f7, 0x3,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0x2, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2d691c_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f8, 0x2,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x3,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0x2, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_2d691c_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1f8, 0x2,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0x2, OBJ_X_FLIP | 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x3
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame0[] = {
    5,
    0xe9, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0x2, OBJ_X_FLIP | 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fb, 0x4
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame1[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x0, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f7, 0x4,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1f6, 0x4,
    0xda, OBJ_SIZE_16x16 | 0x0, 0x0,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_X_FLIP | 0x1fa, 0x16
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame3[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xda, 0x4, 0x2,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_X_FLIP | 0x1fa, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1f5, 0x3,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame4[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1, 0x2,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f7, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1f7, 0x3
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame5[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fa, 0x4,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f8, 0x16,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x2
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame6[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f8, 0x2,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1fe, 0x3
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame7[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f3, 0x2,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x2, 0x3,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_Right_MovingOnHorizontalLadder_Frame8[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f4, 0x3,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1, 0x2,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x3, OBJ_X_FLIP | 0x1f6, 0x16
};

static const u16 sSamusOam_Left_HangingOnHorizontalLadder_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xdb, 0x1fd, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    0x2, 0x1fd, 0x16
};

static const u16 sSamusOam_Left_ShootingOnHorizontalLadder_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f5, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f7, 0x16
};

static const u16 sSamusOam_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f8, 0x16
};

static const u16 sSamusOam_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdb, 0x1fe, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0x2, 0x1ff, 0x16
};

static const u16 sSamusOam_Left_Down_ShootingOnHorizontalLadder_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0x1, 0x0, 0x16
};

static const u16 sSamusOam_Right_HangingOnHorizontalLadder_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1fd, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    0x2, OBJ_X_FLIP | 0x1fb, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x3
};

static const u16 sSamusOam_Right_ShootingOnHorizontalLadder_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1fc, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x3,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1fb, 0x16
};

static const u16 sSamusOam_Right_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x2,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x4
};

static const u16 sSamusOam_Right_DiagonalDown_ShootingOnHorizontalLadder_Frame0[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f8, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x4
};

static const u16 sSamusOam_Right_Down_DelayAfterShootingOnHorizontalLadder_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0x2, OBJ_X_FLIP | 0x1f9, 0x16,
    0xdb, OBJ_X_FLIP | 0x1fa, 0x2
};

static const u16 sSamusOam_Right_Down_ShootingOnHorizontalLadder_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0x1, OBJ_X_FLIP | 0x1f8, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x2
};

static const u16 sSamusOam_2d6c5c_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdf, 0x1fd, 0x4,
    0xe0, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1f6, 0x16,
    0xf6, OBJ_SIZE_16x16 | 0x1f6, 0x14
};

static const u16 sSamusOam_2d6c5c_Frame4[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdf, 0x1fd, 0x4,
    0xe0, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xee, 0x1f8, 0x16
};

static const u16 sSamusOam_2d6c5c_Frame5[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdf, 0x1fd, 0x4,
    0xdf, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xee, 0x1f8, 0x16
};

static const u16 sSamusOam_2d6cdc_Frame0[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xdf, OBJ_X_FLIP | 0x1fb, 0x4,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | 0x1fa, 0x16,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14
};

static const u16 sSamusOam_2d5f76[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xdf, OBJ_X_FLIP | 0x1fb, 0x4,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xee, OBJ_X_FLIP | 0x0, 0x16
};

static const u16 sSamusOam_2d6cdc_Frame5[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xdf, OBJ_X_FLIP | 0x1fb, 0x4,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xee, OBJ_X_FLIP | 0x1ff, 0x16
};

static const u16 sSamusOam_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    0xd8, 0x1f7, 0x2,
    0xe0, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xea, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfa, 0x1f8, 0x16
};

static const u16 sSamusOam_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    3,
    0xda, 0x1f7, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd8, 0x1, 0x2,
    0xea, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfa, 0x0, 0x16
};

static const u16 sSamusOam_Left_Up_ShootingOnVerticalLadder_Frame0[] = {
    4,
    0xd8, 0x1, 0x2,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xea, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfa, 0x0, 0x16
};

static const u16 sSamusOam_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0[] = {
    4,
    0xda, 0x1, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf2, 0x1f0, 0x16
};

static const u16 sSamusOam_Left_Down_ShootingOnVerticalLadder_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x0, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_Left_ReadyToJump_HangingOnLedge_Frame0[] = {
    4,
    0xeb, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f6, 0x16,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x6, 0x2
};

static const u16 sSamusOam_Right_ReadyToJump_HangingOnLedge_Frame0[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f2, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x2, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f9, 0x16
};

const struct SamusAnimationData sSamusAnim_Left_HangingFromVerticalLadder[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame1,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame1,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame2,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame3,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame3,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame4,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame4,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame5,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame5,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame0,
        .timer = 4
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_HangingFromVerticalLadder[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame3,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame4,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame1,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame5,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame3,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame1,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame4,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame2,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame5,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame3,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame0,
        .timer = 4
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d617c[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame5,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame5,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame4,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame4,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame3,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame3,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame2,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame2,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame1,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame1,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingFromVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_HangingFromVerticalLadder_Frame0,
        .timer = 4
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d61ec[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame2,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame5,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame1,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame4,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame3,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame5,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame2,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame4,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame1,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingFromVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingFromVerticalLadder_Frame3,
        .pOam = sSamusOam_Right_HangingFromVerticalLadder_Frame0,
        .timer = 4
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .pOam = sSamusOam_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_StartingToPutAwayYourArmCannonOutOnAVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .pOam = sSamusOam_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalUp_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_ShootingOnVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_ShootingOnVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .pOam = sSamusOam_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_StartingToPutAwayYourArmCannonOutOnAVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .pOam = sSamusOam_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_StartingToHoldYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalUp_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_ShootingOnVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_ShootingOnVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_StartingWallJump[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_StartingWallJump_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_StartingWallJump_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_StartingWallJump_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_StartingWallJump_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_StartingWallJump[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_StartingWallJump_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_StartingWallJump_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_StartingWallJump_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_StartingWallJump_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_HangingOnLedge[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame2,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame3,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame1,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame5,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame5,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame1,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_PullingYourselfUpFromHanging[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_PullingYourselfUpFromHanging_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfUpFromHanging_Frame1,
        .pOam = sSamusOam_Left_PullingYourselfUpFromHanging_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_PullingYourselfUpFromHanging_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfUpFromHanging_Frame2,
        .pOam = sSamusOam_Left_PullingYourselfUpFromHanging_Frame2,
        .timer = 3
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_PullingYourselfForwardFromHanging[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame0,
        .pOam = sSamusOam_Left_PullingYourselfForwardFromHanging_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame1,
        .pOam = sSamusOam_Left_PullingYourselfForwardFromHanging_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame2,
        .pOam = sSamusOam_Left_PullingYourselfForwardFromHanging_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame3,
        .pOam = sSamusOam_Left_PullingYourselfForwardFromHanging_Frame3,
        .timer = 2
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_PullingYourselfIntoMorphBallTunnel[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_PullingYourselfIntoMorphBallTunnel_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_PullingYourselfIntoMorphBallTunnel_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_HangingOnLedge[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame2,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame3,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame1,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame5,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame5,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame1,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_PullingYourselfUpFromHanging[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_PullingYourselfUpFromHanging_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfUpFromHanging_Frame1,
        .pOam = sSamusOam_Right_PullingYourselfUpFromHanging_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_PullingYourselfUpFromHanging_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfUpFromHanging_Frame2,
        .pOam = sSamusOam_Right_PullingYourselfUpFromHanging_Frame2,
        .timer = 3
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_PullingYourselfForwardFromHanging[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame0,
        .pOam = sSamusOam_Right_PullingYourselfForwardFromHanging_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame1,
        .pOam = sSamusOam_Right_PullingYourselfForwardFromHanging_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Right_PullingYourselfForwardFromHanging_Frame2,
        .pOam = sSamusOam_Right_PullingYourselfForwardFromHanging_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfForwardFromHanging_Frame3,
        .pOam = sSamusOam_Right_PullingYourselfForwardFromHanging_Frame3,
        .timer = 2
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_PullingYourselfIntoMorphBallTunnel[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_PullingYourselfIntoMorphBallTunnel_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_PullingYourselfIntoMorphBallTunnel_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d67bc[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d67bc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame0,
        .pOam = sSamusOam_2d67bc_Frame0,
        .timer = 14
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d67bc_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame1,
        .pOam = sSamusOam_2d67bc_Frame0,
        .timer = 14
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d67bc_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame2,
        .pOam = sSamusOam_2d67bc_Frame2,
        .timer = 14
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d67bc_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame1,
        .pOam = sSamusOam_2d67bc_Frame0,
        .timer = 14
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_MovingOnHorizontalLadder[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame1,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame1,
        .timer = 5
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame2,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame3,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame3,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame4,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame4,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame5,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame5,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame6,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame6,
        .timer = 5
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame7,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_MovingOnHorizontalLadder_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame8,
        .pOam = sSamusOam_Left_MovingOnHorizontalLadder_Frame8,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2d67bc_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame2,
        .pOam = sSamusOam_2d67bc_Frame2,
        .timer = 4
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_TurningAroundOnHorizontalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAroundOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_TurningAroundOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_TurningAroundOnHorizontalLadder_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAroundOnHorizontalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_TurningAroundOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_TurningAroundOnHorizontalLadder_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_TurningAroundOnHorizontalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAroundOnHorizontalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_TurningAroundOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_TurningAroundOnHorizontalLadder_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_TurningAroundOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_TurningAroundOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_TurningAroundOnHorizontalLadder_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d691c[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d691c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame0,
        .pOam = sSamusOam_2d691c_Frame0,
        .timer = 14
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d691c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame1,
        .pOam = sSamusOam_2d691c_Frame0,
        .timer = 14
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d691c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame2,
        .pOam = sSamusOam_2d691c_Frame2,
        .timer = 14
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d691c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame1,
        .pOam = sSamusOam_2d691c_Frame0,
        .timer = 14
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_MovingOnHorizontalLadder[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame4,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame5,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame1,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame6,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame2,
        .timer = 5
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame7,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame3,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame8,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame4,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame5,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame1,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame6,
        .timer = 5
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame2,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Right_MovingOnHorizontalLadder_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_Left_MovingOnHorizontalLadder_Frame3,
        .pOam = sSamusOam_Right_MovingOnHorizontalLadder_Frame8,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2d691c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d67bc_Frame2,
        .pOam = sSamusOam_2d691c_Frame2,
        .timer = 4
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_HangingOnHorizontalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_HangingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_ShootingOnHorizontalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_ShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_ShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_HangingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_DiagonalDown_ShootingOnHorizontalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Down_DelayAfterShootingOnHorizontalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Down_ShootingOnHorizontalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Down_ShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_ShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_Down_ShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_HangingOnHorizontalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_HangingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_ShootingOnHorizontalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_ShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_ShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_HangingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_DelayAfterShootingOnHorizontalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_DiagonalDown_ShootingOnHorizontalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_ShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_ShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_ShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_DiagonalDown_DelayAfterShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Down_DelayAfterShootingOnHorizontalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Down_ShootingOnHorizontalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Down_ShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_ShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_Down_ShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .pOam = sSamusOam_Right_Down_DelayAfterShootingOnHorizontalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_PullingYourselfDownToStartHanging[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_PullingYourselfUpFromHanging_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfUpFromHanging_Frame1,
        .pOam = sSamusOam_Left_PullingYourselfUpFromHanging_Frame1,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_HangingOnLedge_Frame0,
        .timer = 3
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_PullingYourselfDownToStartHanging[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_PullingYourselfUpFromHanging_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Left_PullingYourselfUpFromHanging_Frame1,
        .pOam = sSamusOam_Right_PullingYourselfUpFromHanging_Frame1,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_HangingOnLedge_Frame0,
        .timer = 3
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6c5c[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_2d6c5c_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_2d6c5c_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_2d6c5c_Frame0,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_2d6c5c_Frame0,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_2d6c5c_Frame4,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame5,
        .pOam = sSamusOam_2d6c5c_Frame5,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_2d6c5c_Frame4,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6cdc[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame3,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame5,
        .pOam = sSamusOam_2d6cdc_Frame5,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_Left_HangingOnLedge_Frame1,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Up_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Up_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Down_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_Down_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Down_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Right_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Up_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_Up_ShootingOnVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_Up_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_Down_ShootingOnVerticalLadder[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Down_ShootingOnVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_ShootingOnVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_Down_ShootingOnVerticalLadder_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .pOam = sSamusOam_Left_Down_HoldingYourArmCannonOutOnAVerticalLadder_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_ReadyToJump_HangingOnLedge[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Left_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_ReadyToJump_HangingOnLedge[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0,
        .pOam = sSamusOam_Right_ReadyToJump_HangingOnLedge_Frame0,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_Left_SpaceJumping_Frame0[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_SpaceJumping_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_SpaceJumping_Frame1[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_SpaceJumping_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_SpaceJumping_Frame2[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_SpaceJumping_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_SpaceJumping_Frame3[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_SpaceJumping_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Left_ScrewAttacking_Frame8[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_ScrewAttacking_Frame8.gfx")
};

static const u8 sSamusGfx_Top_Left_ScrewAttacking_Frame5[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_ScrewAttacking_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_ScrewAttacking_Frame6[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_ScrewAttacking_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Left_ScrewAttacking_Frame7[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_ScrewAttacking_Frame7.gfx")
};

static const u16 sSamusOam_Left_SpaceJumping_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_Left_SpaceJumping_Frame4[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_Right_SpaceJumping_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_Right_SpaceJumping_Frame4[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

const struct SamusAnimationData sSamusAnim_Left_SpaceJumping[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_SpaceJumping[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Left_ScrewAttacking[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame0,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_SpaceJumping_Frame4,
        .timer = 1
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_ScrewAttacking[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_SpaceJumping_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame0,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_Left_ScrewAttacking_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_SpaceJumping_Frame4,
        .timer = 1
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_Left_Dying_Frame0[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_Dying_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Left_Dying_Frame1[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_Dying_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Left_Dying_Frame2[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_Dying_Frame2.gfx")
};

static const u8 sSamusGfx_Top_Left_Dying_Frame4[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_Dying_Frame4.gfx")
};

static const u8 sSamusGfx_Top_Left_Dying_Frame5[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_Dying_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Left_Dying_Frame6[] = {
    9, 8,
    _INCBIN_U8("data/samus/gfx/Top_Left_Dying_Frame6.gfx")
};

static const u8 sSamusGfx_Top_Left_Dying_Frame7[] = {
    4, 0,
    _INCBIN_U8("data/samus/gfx/Top_Left_Dying_Frame7.gfx")
};

static const u8 sSamusGfx_Top_Left_Dying_Frame8[] = {
    2, 0,
    _INCBIN_U8("data/samus/gfx/Top_Left_Dying_Frame8.gfx")
};

static const u16 sSamusOam_Left_Dying_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_Left_Dying_Frame6[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    0xd8, 0x1f8, 0x8
};

static const u16 sSamusOam_Left_Dying_Frame7[] = {
    4,
    0xde, OBJ_X_FLIP | 0x1eb, 0x0,
    0xde, OBJ_Y_FLIP | 0x2, 0x1,
    0xf7, 0x1ee, 0x2,
    0xcf, 0xa, 0x3
};

static const u16 sSamusOam_Left_Dying_Frame8[] = {
    2,
    0xde, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, 0x0,
    0xe6, 0x1e6, 0x1
};

static const u16 sSamusOam_Right_Dying_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_Right_Dying_Frame6[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4,
    0xd8, OBJ_X_FLIP | 0x0, 0x8
};

static const u16 sSamusOam_Right_Dying_Frame7[] = {
    4,
    0xde, 0xd, 0x0,
    0xde, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f6, 0x1,
    0xf7, OBJ_X_FLIP | 0xa, 0x2,
    0xcf, OBJ_X_FLIP | 0x1ee, 0x3
};

static const u16 sSamusOam_Right_Dying_Frame8[] = {
    2,
    0xde, OBJ_Y_FLIP | 0x1f4, 0x0,
    0xe6, OBJ_X_FLIP | 0x12, 0x1
};

const struct SamusAnimationData sSamusAnim_Left_Dying[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame0,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame4,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame0,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame0,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Left_Dying_Frame8,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 4
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_Right_Dying[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame0,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame4,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame0,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame0,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Right_Dying_Frame8,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Left_Dying_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 4
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_LoadingSave_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_LoadingSave_Frame1.gfx")
};

static const u8 sSamusGfx_Top_LoadingSave_Frame3[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_LoadingSave_Frame3.gfx")
};

static const u8 sSamusGfx_Top_LoadingSave_Frame5[] = {
    8, 5,
    _INCBIN_U8("data/samus/gfx/Top_LoadingSave_Frame5.gfx")
};

static const u8 sSamusGfx_Top_LoadingSave_Frame2[] = {
    8, 6,
    _INCBIN_U8("data/samus/gfx/Top_LoadingSave_Frame2.gfx")
};

static const u8 sSamusGfx_Top_LoadingSave_Frame4[] = {
    8, 6,
    _INCBIN_U8("data/samus/gfx/Top_LoadingSave_Frame4.gfx")
};

static const u8 sSamusGfx_Top_LoadingSave_Frame6[] = {
    9, 6,
    _INCBIN_U8("data/samus/gfx/Top_LoadingSave_Frame6.gfx")
};

static const u16 sSamusOam_LoadingSave_Frame1[] = {
    3,
    0xda, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x4, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f4, 0x3
};

static const u16 sSamusOam_LoadingSave_Frame3[] = {
    3,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x5, 0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, 0x2
};

static const u16 sSamusOam_LoadingSave_Frame5[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f3, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x3, 0x4,
    0xe9, OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xe9, 0x1f3, 0x7,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1fb, 0x5
};

static const u16 sSamusOam_LoadingSave_Frame2[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f7, 0x6
};

static const u16 sSamusOam_LoadingSave_Frame4[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fa, 0x6
};

static const u16 sSamusOam_LoadingSave_Frame6[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, 0x6,
    0xf8, 0x4, 0x8,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, 0x5
};

const struct SamusAnimationData sSamusAnim_LoadingSave[29] = {
    [0] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 10
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame1,
        .timer = 7
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame2,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame3,
        .timer = 7
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame4,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame5,
        .timer = 7
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame2,
        .timer = 7
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame4,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame4,
        .timer = 7
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [16] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [17] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [18] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [19] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [20] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [21] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [22] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [23] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [24] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [25] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 1
    },
    [26] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 4
    },
    [27] = {
        .pTopGfx = sSamusGfx_Top_LoadingSave_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_LoadingSave_Frame6,
        .timer = 180
    },
    [28] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_Saving_Frame32[] = {
    19, 1,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame32.gfx")
};

static const u8 sSamusGfx_Bottom_Saving_Frame0[] = {
    10, 8,
    _INCBIN_U8("data/samus/gfx/Bottom_Saving_Frame0.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame34[] = {
    17, 2,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame34.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame36[] = {
    16, 3,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame36.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame38[] = {
    16, 3,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame38.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame33[] = {
    20, 16,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame33.gfx")
};

static const u8 sSamusGfx_Bottom_Saving_Frame9[] = {
    12, 8,
    _INCBIN_U8("data/samus/gfx/Bottom_Saving_Frame9.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame35[] = {
    20, 15,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame35.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame37[] = {
    20, 15,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame37.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame39[] = {
    20, 15,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame39.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame1.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame3.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame5.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame7[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame7.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame9[] = {
    13, 5,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame9.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame11[] = {
    11, 5,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame11.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame13[] = {
    11, 5,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame13.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame15[] = {
    12, 6,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame15.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame17[] = {
    17, 9,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame17.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame19[] = {
    15, 9,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame19.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame21[] = {
    15, 9,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame21.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame23[] = {
    16, 10,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame23.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame16[] = {
    10, 0,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame16.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame18[] = {
    10, 1,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame18.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame20[] = {
    9, 2,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame20.gfx")
};

static const u8 sSamusGfx_Top_Saving_Frame22[] = {
    8, 1,
    _INCBIN_U8("data/samus/gfx/Top_Saving_Frame22.gfx")
};

static const u16 sSamusOam_Saving_Frame32[] = {
    20,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x10, 0x0,
    0xf3, 0x5, 0xb,
    0xf1, 0x1e5, 0xc,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ed, 0x1,
    0xf8, 0x1fd, 0xd,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fb, 0x3,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1eb, 0x5,
    0xe5, 0x7, 0xe,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xe2, 0x1e8, 0xf,
    0xe8, 0x1f0, 0x10,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f8, 0x7,
    0xeb, 0x8, 0x11,
    0xeb, 0x1e6, 0x12,
    0xe0, 0x1ed, 0x12,
    0xda, 0x1f6, 0x12,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x0, 0x9,
    0xdc, 0x12, 0x12
};

static const u16 sSamusOam_Saving_Frame34[] = {
    19,
    0xf2, 0x1e8, 0xc,
    0xf8, 0x1f0, 0xd,
    0xf6, 0x1fe, 0xe,
    0xf2, 0x8, 0xe,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x10, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fb, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1eb, 0x4,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x8, 0x1,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xe3, 0x1ec, 0xf,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1ec, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x0, 0x8,
    0xee, 0x1e6, 0x10,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fe, 0xa,
    0xe2, 0x1eb, 0x10,
    0xdb, 0x1f3, 0x10,
    0xda, 0x11, 0x10
};

static const u16 sSamusOam_Saving_Frame36[] = {
    20,
    0xf5, 0x1e6, 0xb,
    0xf8, 0x1f3, 0xc,
    0xf6, 0x1, 0xc,
    0xf0, 0xa, 0xd,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x10, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1f8, 0x3,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1e8, 0x5,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x8, 0x1,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1ea, 0x2,
    0xea, 0x1f5, 0xe,
    0xed, 0x1fd, 0xe,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x2, 0x7,
    0xf0, 0x1e3, 0xf,
    0xe4, 0x1e6, 0xf,
    0xdc, 0x1ee, 0xf,
    0xd8, 0x1f8, 0xf,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x8, 0x9
};

static const u16 sSamusOam_Saving_Frame38[] = {
    20,
    0xf8, 0x1e8, 0x9,
    0xf8, 0x1f6, 0xa,
    0xf5, 0x4, 0xa,
    0xf0, 0xe, 0xb,
    OBJ_SHAPE_VERTICAL | 0xda, 0x10, 0x0,
    0xdd, 0x1ed, 0xc,
    0xde, 0x1f7, 0xc,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1ff, 0x3,
    0xe7, 0x7, 0xd,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1e9, 0x1,
    0xe8, 0x1f0, 0xe,
    0xec, 0x1f9, 0xe,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1, 0x5,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1e7, 0x2,
    0xdd, 0x1ef, 0xf,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, 0x7,
    0xd7, 0xe, 0xf
};

static const u16 sSamusOam_Saving_Frame33[] = {
    26,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x10, 0x8,
    0xf3, 0x5, 0x13,
    0xf1, 0x1e5, 0x29,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ed, 0x9,
    0xf8, 0x1fd, 0x2a,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fb, 0xb,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1eb, 0xd,
    0xe5, 0x7, 0x2b,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xe2, 0x1e8, 0x2c,
    0xe8, 0x1f0, 0x2d,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f8, 0xf,
    0xeb, 0x8, 0x2e,
    0xeb, 0x1e6, 0x2f,
    0xe0, 0x1ed, 0x2f,
    0xda, 0x1f6, 0x2f,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x0, 0x11,
    0xdc, 0x12, 0x2f,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame35[] = {
    25,
    0xf2, 0x1e8, 0x2a,
    0xf8, 0x1f0, 0x2b,
    0xf6, 0x1fe, 0x2c,
    0xf2, 0x8, 0x2c,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x10, 0x8,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fb, 0xa,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1eb, 0xc,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x8, 0x9,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xe3, 0x1ec, 0x2d,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1ec, 0xe,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x0, 0x10,
    0xee, 0x1e6, 0x2e,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fe, 0x12,
    0xe2, 0x1eb, 0x2e,
    0xdb, 0x1f3, 0x2e,
    0xda, 0x11, 0x2e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x1e
};

static const u16 sSamusOam_Saving_Frame37[] = {
    26,
    0xf5, 0x1e6, 0x13,
    0xf8, 0x1f3, 0x2b,
    0xf6, 0x1, 0x2b,
    0xf0, 0xa, 0x2c,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x10, 0x8,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1f8, 0xb,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1e8, 0xd,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x8, 0x9,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1ea, 0xa,
    0xea, 0x1f5, 0x2d,
    0xed, 0x1fd, 0x2d,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x2, 0xf,
    0xf0, 0x1e3, 0x2e,
    0xe4, 0x1e6, 0x2e,
    0xdc, 0x1ee, 0x2e,
    0xd8, 0x1f8, 0x2e,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x8, 0x11,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame39[] = {
    26,
    0xf8, 0x1e8, 0x11,
    0xf8, 0x1f6, 0x12,
    0xf5, 0x4, 0x12,
    0xf0, 0xe, 0x13,
    OBJ_SHAPE_VERTICAL | 0xda, 0x10, 0x8,
    0xdd, 0x1ed, 0x2b,
    0xde, 0x1f7, 0x2b,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1ff, 0xb,
    0xe7, 0x7, 0x2c,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1e9, 0x9,
    0xe8, 0x1f0, 0x2d,
    0xec, 0x1f9, 0x2d,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1, 0xd,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1e7, 0xa,
    0xdd, 0x1ef, 0x2e,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, 0xf,
    0xd7, 0xe, 0x2e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x0
};

static const u16 sSamusOam_Saving_Frame9[] = {
    18,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x10, 0x4,
    0xf3, 0x5, 0x9,
    0xf1, 0x1e5, 0xa,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ed, 0x5,
    0xf8, 0x1fd, 0xb,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xeb, 0x1e6, 0xc,
    0xe0, 0x1ed, 0xc,
    0xda, 0x1f6, 0xc,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x0, 0x7,
    0xdc, 0x12, 0xc,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame11[] = {
    18,
    0xf2, 0x1e8, 0x7,
    0xf8, 0x1f0, 0x8,
    0xf6, 0x1fe, 0x9,
    0xf2, 0x8, 0x9,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x10, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xee, 0x1e6, 0xa,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fe, 0x5,
    0xe2, 0x1eb, 0xa,
    0xdb, 0x1f3, 0xa,
    0xda, 0x11, 0xa,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame13[] = {
    18,
    0xf5, 0x1e6, 0x7,
    0xf8, 0x1f3, 0x8,
    0xf6, 0x1, 0x8,
    0xf0, 0xa, 0x9,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x10, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xf0, 0x1e3, 0xa,
    0xe4, 0x1e6, 0xa,
    0xdc, 0x1ee, 0xa,
    0xd8, 0x1f8, 0xa,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x8, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame15[] = {
    17,
    0xf8, 0x1e8, 0x8,
    0xf8, 0x1f6, 0x9,
    0xf5, 0x4, 0x9,
    0xf0, 0xe, 0xa,
    OBJ_SHAPE_VERTICAL | 0xda, 0x10, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1e7, 0x5,
    0xdd, 0x1ef, 0xb,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, 0x6,
    0xd7, 0xe, 0xb,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame17[] = {
    19,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x10, 0x8,
    0xf3, 0x5, 0xd,
    0xf1, 0x1e5, 0xe,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ed, 0x9,
    0xf8, 0x1fd, 0xf,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xeb, 0x1e6, 0x10,
    0xe0, 0x1ed, 0x10,
    0xda, 0x1f6, 0x10,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x0, 0xb,
    0xdc, 0x12, 0x10,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame19[] = {
    19,
    0xf2, 0x1e8, 0xb,
    0xf8, 0x1f0, 0xc,
    0xf6, 0x1fe, 0xd,
    0xf2, 0x8, 0xd,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x10, 0x8,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xee, 0x1e6, 0xe,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fe, 0x9,
    0xe2, 0x1eb, 0xe,
    0xdb, 0x1f3, 0xe,
    0xda, 0x11, 0xe,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame21[] = {
    19,
    0xf5, 0x1e6, 0xb,
    0xf8, 0x1f3, 0xc,
    0xf6, 0x1, 0xc,
    0xf0, 0xa, 0xd,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x10, 0x8,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xf0, 0x1e3, 0xe,
    0xe4, 0x1e6, 0xe,
    0xdc, 0x1ee, 0xe,
    0xd8, 0x1f8, 0xe,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x8, 0x9,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame23[] = {
    18,
    0xf8, 0x1e8, 0xc,
    0xf8, 0x1f6, 0xd,
    0xf5, 0x4, 0xd,
    0xf0, 0xe, 0xe,
    OBJ_SHAPE_VERTICAL | 0xda, 0x10, 0x8,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1e7, 0x9,
    0xdd, 0x1ef, 0xf,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, 0xa,
    0xd7, 0xe, 0xf,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | 0x0, 0x1e,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x0, 0x1e
};

static const u16 sSamusOam_Saving_Frame16[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1eb, 0x2,
    0xe5, 0x7, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xe2, 0x1e8, 0x7,
    0xe8, 0x1f0, 0x8,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1f8, 0x4,
    0xeb, 0x8, 0x9
};

static const u16 sSamusOam_Saving_Frame18[] = {
    9,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fb, 0x1,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1eb, 0x3,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    0xe3, 0x1ec, 0x9,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1ec, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x0, 0x7
};

static const u16 sSamusOam_Saving_Frame20[] = {
    10,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1f8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1e8, 0x4,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1ea, 0x1,
    0xea, 0x1f5, 0x8,
    0xed, 0x1fd, 0x8,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x2, 0x6
};

static const u16 sSamusOam_Saving_Frame22[] = {
    11,
    0xdd, 0x1ed, 0x5,
    0xde, 0x1f7, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1ff, 0x1,
    0xe7, 0x7, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1e9, 0x0,
    0xe8, 0x1f0, 0x7,
    0xec, 0x1f9, 0x7,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1, 0x3
};

static const u16 sSamusOam_Saving_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c
};

const struct SamusAnimationData sSamusAnim_Saving[73] = {
    [0] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame9,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame11,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame11,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame13,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame13,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame15,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame15,
        .timer = 1
    },
    [16] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame16,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame16,
        .timer = 1
    },
    [17] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame17,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame17,
        .timer = 1
    },
    [18] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame18,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame18,
        .timer = 1
    },
    [19] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame19,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame19,
        .timer = 1
    },
    [20] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame20,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame20,
        .timer = 1
    },
    [21] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame21,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame21,
        .timer = 1
    },
    [22] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame22,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame22,
        .timer = 1
    },
    [23] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame23,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame23,
        .timer = 1
    },
    [24] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame16,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame16,
        .timer = 1
    },
    [25] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame17,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame17,
        .timer = 1
    },
    [26] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame18,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame18,
        .timer = 1
    },
    [27] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame19,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame19,
        .timer = 1
    },
    [28] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame20,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame20,
        .timer = 1
    },
    [29] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame21,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame21,
        .timer = 1
    },
    [30] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame22,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame22,
        .timer = 1
    },
    [31] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame23,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame23,
        .timer = 1
    },
    [32] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame32,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame32,
        .timer = 1
    },
    [33] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame33,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame33,
        .timer = 1
    },
    [34] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame34,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame34,
        .timer = 1
    },
    [35] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame35,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame35,
        .timer = 1
    },
    [36] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame36,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame36,
        .timer = 1
    },
    [37] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame37,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame37,
        .timer = 1
    },
    [38] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame38,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame38,
        .timer = 1
    },
    [39] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame39,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame39,
        .timer = 1
    },
    [40] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame16,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame16,
        .timer = 1
    },
    [41] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame17,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame17,
        .timer = 1
    },
    [42] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame18,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame18,
        .timer = 1
    },
    [43] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame19,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame19,
        .timer = 1
    },
    [44] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame20,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame20,
        .timer = 1
    },
    [45] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame21,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame21,
        .timer = 1
    },
    [46] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame22,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame22,
        .timer = 1
    },
    [47] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame23,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame23,
        .timer = 1
    },
    [48] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame16,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame16,
        .timer = 1
    },
    [49] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame17,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame17,
        .timer = 1
    },
    [50] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame18,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame18,
        .timer = 1
    },
    [51] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame19,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame19,
        .timer = 1
    },
    [52] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame20,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame20,
        .timer = 1
    },
    [53] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame21,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame21,
        .timer = 1
    },
    [54] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame22,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame22,
        .timer = 1
    },
    [55] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame23,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame23,
        .timer = 1
    },
    [56] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [57] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame9,
        .timer = 1
    },
    [58] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [59] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame11,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame11,
        .timer = 1
    },
    [60] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [61] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame13,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame13,
        .timer = 1
    },
    [62] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [63] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame15,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame9,
        .pOam = sSamusOam_Saving_Frame15,
        .timer = 1
    },
    [64] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [65] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    [66] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [67] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    [68] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [69] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    [70] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame0,
        .timer = 1
    },
    [71] = {
        .pTopGfx = sSamusGfx_Top_Saving_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_Saving_Frame0,
        .pOam = sSamusOam_Saving_Frame1,
        .timer = 1
    },
    [72] = SAMUS_ANIM_TERMINATOR
};

static const u8 sBlob_2de9b0_2e4904[] = INCBIN_U8("data/Blob_2de9b0_2e4904.bin");
