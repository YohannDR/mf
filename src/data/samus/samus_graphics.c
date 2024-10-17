#include "data/samus/samus_graphics.h"
#include "data/samus_data.h"

#define SAMUS_ANIM_TERMINATOR \
{                             \
    .pTopGfx = NULL,          \
    .pBottomGfx = NULL,       \
    .pOam = NULL,             \
    .timer = 0,               \
}

static const u8 sSamusGfx_Top_2bd0e8_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame3[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame3[] = {
    6, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame4[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame5[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame5[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame6[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame6.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame6[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame7[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame7.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame7[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame7.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame8[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame8.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame8[] = {
    6, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame8.gfx")
};

static const u8 sSamusGfx_Top_2bd0e8_Frame9[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd0e8_Frame9.gfx")
};

static const u8 sSamusGfx_Bottom_2bd0e8_Frame9[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd0e8_Frame9.gfx")
};

static const u8 sSamusGfx_Top_2bd198_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd198_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd198_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd198_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd198_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd198_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd248_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd248_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd248_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd248_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd248_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd248_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd2f8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd2f8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd2f8_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd2f8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd2f8_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd2f8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd3e8_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd3e8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd3e8_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd3e8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd3a8_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd3a8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd3a8_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd3a8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd3a8_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd3a8_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2bd3a8_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd3a8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd3e8_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd3e8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd3e8_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd3e8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd418_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd418_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd418_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd418_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd418_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd418_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd418_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd418_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd418_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd418_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2bd418_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd418_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd458_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd458_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd488_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd488_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd488_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd488_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd488_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd488_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd488_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd488_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd488_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd488_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2bd488_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd488_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd4c8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd4c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd4f8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd4f8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd4f8_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd4f8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd4f8_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd4f8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd4f8_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd4f8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd4f8_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd4f8_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2bd4f8_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd4f8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd538_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd538_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd568_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd568_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd568_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd568_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd598_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd598_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd598_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd598_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd5c8_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd5c8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd5c8_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd5c8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd5c8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd5c8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd5f8_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd5f8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bd5f8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd5f8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame3[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame4[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame5[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame6[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame7[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame7.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame8[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame8.gfx")
};

static const u8 sSamusGfx_Top_2bd628_Frame9[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd628_Frame9.gfx")
};

static const u8 sSamusGfx_Top_2bd6d8_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd6d8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd6d8_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd6d8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd6d8_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd6d8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd788_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd788_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd788_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd788_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd788_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd788_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd838_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd838_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd838_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd838_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd838_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd838_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd8e8_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd8e8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd8e8_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd8e8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd8e8_Frame2[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd8e8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd928_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd928_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bd928_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bd928_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd958_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd958_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd958_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd958_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd958_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd958_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bd998_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2bd998_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd9c8_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd9c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bd9c8_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd9c8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bd9c8_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bd9c8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bda08_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bda08_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bda38_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bda38_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bda38_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bda38_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bda38_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bda38_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bda78_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2bda78_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bdaa8_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdaa8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bdaa8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdaa8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bdad8_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdad8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bdad8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdad8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bdb08_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdb08_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bdb08_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdb08_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bdb38_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdb38_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bdb38_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdb38_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bde28_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bde28_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bde28_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bde28_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bde48_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bde48_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bde68_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bde68_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bde88_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bde88_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bdea8_Frame0[] = {
    7, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bdea8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2bdea8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdea8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bdea8_Frame1[] = {
    7, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bdea8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2bdea8_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdea8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bdea8_Frame2[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bdea8_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2bdea8_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2bdea8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bdef8_Frame0[] = {
    7, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bdef8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bdef8_Frame1[] = {
    7, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bdef8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bdef8_Frame2[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bdef8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bdf48_Frame0[] = {
    8, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bdf48_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bdf48_Frame1[] = {
    7, 5,
    _INCBIN_U8("data/samus/gfx/Top_2bdf48_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bdf48_Frame2[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2bdf48_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2bdf98_Frame0[] = {
    8, 6,
    _INCBIN_U8("data/samus/gfx/Top_2bdf98_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2bdf98_Frame1[] = {
    7, 5,
    _INCBIN_U8("data/samus/gfx/Top_2bdf98_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2bdf98_Frame2[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2bdf98_Frame2.gfx")
};

static const u16 sSamusOam_2bd0e8_Frame0[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xd6, 0x1f8, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd0e8_Frame1[] = {
    4,
    0xd7, 0x1fa, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd0e8_Frame2[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f2, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x2, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17
};

static const u16 sSamusOam_2bd0e8_Frame3[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1f0, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18,
    0xd5, 0x1f8, 0x3
};

static const u16 sSamusOam_2bd0e8_Frame4[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f5, 0x2
};

static const u16 sSamusOam_2bd0e8_Frame5[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16,
    0xd6, 0x1f8, 0x2
};

static const u16 sSamusOam_2bd0e8_Frame6[] = {
    3,
    0xdb, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd0e8_Frame7[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe2, 0x1f0, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16
};

static const u16 sSamusOam_2bd0e8_Frame8[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe3, 0x1ee, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_2bd0e8_Frame9[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17
};

static const u16 sSamusOam_2bd198_Frame0[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1ef, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1ff, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd198_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ef, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd198_Frame2[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1fe, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17
};

static const u16 sSamusOam_2bd198_Frame3[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x1fe, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_2bd198_Frame4[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ef, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x16
};

static const u16 sSamusOam_2bd198_Frame5[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1fe, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd198_Frame6[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ee, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd198_Frame7[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1ed, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1fd, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16
};

static const u16 sSamusOam_2bd198_Frame9[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ee, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17
};

static const u16 sSamusOam_2bd248_Frame0[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe6, 0x1ef, 0x2,
    0xd6, 0x1f8, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd248_Frame1[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe5, 0x1ee, 0x2,
    0xd5, 0x1f7, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd248_Frame2[] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe5, 0x1ee, 0x2,
    0xd5, 0x1f7, 0x3,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17
};

static const u16 sSamusOam_2bd248_Frame3[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe4, 0x1ee, 0x2,
    0xd4, 0x1f7, 0x3,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_2bd248_Frame4[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe6, 0x1ef, 0x2,
    0xd6, 0x1f8, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x16
};

static const u16 sSamusOam_2bd248_Frame5[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe6, 0x1ee, 0x2,
    0xd6, 0x1f7, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd248_Frame7[] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    0xe5, 0x1ed, 0x2,
    0xd5, 0x1f6, 0x3,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16
};

static const u16 sSamusOam_2bd248_Frame8[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    0xe4, 0x1ed, 0x2,
    0xd4, 0x1f6, 0x3,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_2bd248_Frame9[] = {
    6,
    0xde, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe6, 0x1ee, 0x2,
    0xd6, 0x1f7, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17
};

static const u16 sSamusOam_2bd2f8_Frame0[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f2, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd2f8_Frame1[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f0, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd2f8_Frame2[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f0, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17
};

static const u16 sSamusOam_2bd2f8_Frame3[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f0, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_2bd2f8_Frame4[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f2, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fe, 0x14,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x16
};

static const u16 sSamusOam_2bd2f8_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f1, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2bd2f8_Frame7[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1ef, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1f9, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, 0x9, 0x16
};

static const u16 sSamusOam_2bd2f8_Frame8[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ef, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f1, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f9, 0x18
};

static const u16 sSamusOam_2bd2f8_Frame9[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f1, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x17
};

static const u16 sSamusOam_2bd3a8_Frame2[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd2, 0x1f7, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16
};

static const u16 sSamusOam_2bd3a8_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd2, 0x1f7, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_2bd418_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1fd, 0x2,
    0xda, OBJ_SIZE_16x16 | 0x1ed, 0x0,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_2bd418_Frame1[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ed, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_2bd458_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_2bd488_Frame0[] = {
    6,
    0xd7, 0x1f8, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xe7, 0x1ec, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_2bd488_Frame1[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xe7, 0x1ec, 0x2,
    0xd7, 0x1f8, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_2bd488_Frame2[] = {
    6,
    0xe7, 0x1ec, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    0xd7, 0x1f8, 0x3
};

static const u16 sSamusOam_2bd4c8_Frame0[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f4, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_2bd4f8_Frame0[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1ee, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_2bd4f8_Frame1[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_2bd4f8_Frame2[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1ee, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_2bd538_Frame0[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_2bd568_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2bd568_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xdb, 0x1f7, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2bd598_Frame1[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1fe, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2bd598_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2bd5c8_Frame1[] = {
    5,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xf0, 0x1ee, 0x2,
    0xe0, 0x1fa, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2bd5c8_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f6, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2bd5f8_Frame1[] = {
    4,
    0xe6, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2bd5f8_Frame0[] = {
    4,
    0xe5, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2bd628_Frame0[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fa, 0x2,
    0xe5, 0xa, 0x4,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd628_Frame1[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1fa, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd628_Frame2[] = {
    6,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x6, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f6, 0x3,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17
};

static const u16 sSamusOam_2bd628_Frame3[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, 0x2,
    0xe3, 0x8, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_2bd628_Frame4[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1fa, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x16
};

static const u16 sSamusOam_2bd628_Frame5[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f9, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd628_Frame6[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe5, 0x9, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd628_Frame7[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x8, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16
};

static const u16 sSamusOam_2bd628_Frame8[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0xa, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_2bd628_Frame9[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe5, 0xa, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f0, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17
};

static const u16 sSamusOam_2bd6d8_Frame0[] = {
    3,
    0xdd, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd6d8_Frame1[] = {
    3,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd6d8_Frame2[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xa, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17
};

static const u16 sSamusOam_2bd6d8_Frame3[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0xa, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_2bd6d8_Frame4[] = {
    3,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x16
};

static const u16 sSamusOam_2bd6d8_Frame5[] = {
    3,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd6d8_Frame6[] = {
    3,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd6d8_Frame7[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xb, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16
};

static const u16 sSamusOam_2bd6d8_Frame9[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f0, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17
};

static const u16 sSamusOam_2bd788_Frame0[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xd6, OBJ_X_FLIP | 0x0, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd788_Frame1[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xd5, OBJ_X_FLIP | 0x1, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd788_Frame2[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xd5, OBJ_X_FLIP | 0x1, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17
};

static const u16 sSamusOam_2bd788_Frame3[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18,
    0xd4, OBJ_X_FLIP | 0x1, 0x2
};

static const u16 sSamusOam_2bd788_Frame4[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x16,
    0xd6, OBJ_X_FLIP | 0x0, 0x2
};

static const u16 sSamusOam_2bd788_Frame5[] = {
    4,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16,
    0xde, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xd6, OBJ_X_FLIP | 0x1, 0x2
};

static const u16 sSamusOam_2bd788_Frame7[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    0xd5, OBJ_X_FLIP | 0x2, 0x2
};

static const u16 sSamusOam_2bd788_Frame8[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18,
    0xd4, OBJ_X_FLIP | 0x2, 0x2
};

static const u16 sSamusOam_2bd788_Frame9[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f0, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17,
    0xd6, OBJ_X_FLIP | 0x1, 0x2
};

static const u16 sSamusOam_2bd838_Frame0[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xea, 0x1fe, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd838_Frame1[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, 0x0, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd838_Frame2[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, 0x0, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17
};

static const u16 sSamusOam_2bd838_Frame3[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, 0x0, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_2bd838_Frame4[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xea, 0x1ff, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f2, 0x14,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x16
};

static const u16 sSamusOam_2bd838_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xea, 0x1ff, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2bd838_Frame7[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe9, 0x1, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x17,
    OBJ_SHAPE_VERTICAL | 0xef, OBJ_X_FLIP | 0x1ef, 0x16
};

static const u16 sSamusOam_2bd838_Frame8[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, 0x1, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ef, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe6, OBJ_X_FLIP | 0x1f7, 0x18
};

static const u16 sSamusOam_2bd838_Frame9[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xea, 0x0, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f0, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17
};

static const u16 sSamusOam_2bd8e8_Frame0[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16
};

static const u16 sSamusOam_2bd8e8_Frame1[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17
};

static const u16 sSamusOam_2bd928_Frame0[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17,
    0xdb, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16
};

static const u16 sSamusOam_2bd958_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17
};

static const u16 sSamusOam_2bd998_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xa, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x17
};

static const u16 sSamusOam_2bd9c8_Frame0[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    0xd7, OBJ_X_FLIP | 0x0, 0x2
};

static const u16 sSamusOam_2bd9c8_Frame2[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    0xd7, OBJ_X_FLIP | 0x0, 0x2
};

static const u16 sSamusOam_2bda08_Frame0[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17,
    0xd7, OBJ_X_FLIP | 0x1ff, 0x2
};

static const u16 sSamusOam_2bda38_Frame0[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xec, 0x2, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f6, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16
};

static const u16 sSamusOam_2bda38_Frame1[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xec, 0x2, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17
};

static const u16 sSamusOam_2bda78_Frame0[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xec, 0x1, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, 0x17
};

static const u16 sSamusOam_2bdaa8_Frame1[] = {
    3,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_2bdaa8_Frame0[] = {
    3,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_2bdad8_Frame1[] = {
    4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x9, 0x2
};

static const u16 sSamusOam_2bdad8_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x8, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_2bdb08_Frame1[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16,
    0xe0, OBJ_X_FLIP | 0x1ff, 0x2
};

static const u16 sSamusOam_2bdb08_Frame0[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16,
    0xe0, OBJ_X_FLIP | 0x1fe, 0x2
};

static const u16 sSamusOam_2bdb38_Frame1[] = {
    4,
    0xe6, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xf6, 0x2, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1ff, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_2bdb38_Frame0[] = {
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

static const u16 sSamusOam_2bde28_Frame0[] = {
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

static const u16 sSamusOam_2bde68_Frame0[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x8, 0x16,
    0xdd, OBJ_SIZE_16x16 | 0x1, 0x4
};

static const u16 sSamusOam_2bde88_Frame0[] = {
    6,
    0xdf, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x8, 0x16,
    0xdd, OBJ_SIZE_16x16 | 0x1, 0x4
};

static const u16 sSamusOam_2bdea8_Frame0[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf8, 0x1f9, 0x6,
    0xe7, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, 0x4
};

static const u16 sSamusOam_2bdea8_Frame1[] = {
    6,
    0xeb, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xfb, 0x1f9, 0x6,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, 0x4
};

static const u16 sSamusOam_2bdea8_Frame2[] = {
    5,
    0xec, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, 0x4
};

static const u16 sSamusOam_2bdef8_Frame0[] = {
    6,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf8, 0x1f8, 0x6,
    0xe6, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, 0x4
};

static const u16 sSamusOam_2bdef8_Frame1[] = {
    6,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xfb, 0x1f8, 0x6,
    0xe7, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, 0x4
};

static const u16 sSamusOam_2bdef8_Frame2[] = {
    5,
    0xec, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, 0x4
};

static const u16 sSamusOam_2bdf48_Frame0[] = {
    6,
    0xec, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fd, 0x6
};

static const u16 sSamusOam_2bdf48_Frame1[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fa, 0x4,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1fc, 0x5
};

static const u16 sSamusOam_2bdf48_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f9, 0x4,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16
};

static const u16 sSamusOam_2bdf98_Frame0[] = {
    6,
    0xec, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf5, 0x1fd, 0x6
};

static const u16 sSamusOam_2bdf98_Frame1[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xef, 0x1fb, 0x4,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1fc, 0x5
};

static const u16 sSamusOam_2bdf98_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fa, 0x4,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, 0x16
};

const struct SamusAnimationData sSamusAnim_2bd0e8[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd0e8_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd0e8_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd0e8_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd0e8_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd0e8_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd0e8_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd0e8_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd0e8_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd0e8_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd0e8_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd198[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd198_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd198_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd198_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd198_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd198_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd198_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd198_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd198_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd198_Frame3,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd198_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd198_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd248[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd248_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd248_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd248_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd248_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd248_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd248_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd248_Frame5,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd248_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd248_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd248_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd248_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd2f8[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd2f8_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd2f8_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd2f8_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd2f8_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd2f8_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd2f8_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd2f8_Frame1,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd2f8_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd2f8_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd2f8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd2f8_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd3a8[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd3a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd3a8_Frame0,
        .pOam = sSamusOam_2bd3a8_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd3a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd3a8_Frame0,
        .pOam = sSamusOam_2bd3a8_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd3a8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd3a8_Frame2,
        .pOam = sSamusOam_2bd3a8_Frame2,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd3e8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd3e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd3e8_Frame0,
        .pOam = sSamusOam_2bd3a8_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd3e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd3e8_Frame1,
        .pOam = sSamusOam_2bd3a8_Frame2,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd418[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd418_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame0,
        .pOam = sSamusOam_2bd418_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd418_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame1,
        .pOam = sSamusOam_2bd418_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd418_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame2,
        .pOam = sSamusOam_2bd418_Frame1,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd458[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd458_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame2,
        .pOam = sSamusOam_2bd458_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd418_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame0,
        .pOam = sSamusOam_2bd418_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd488[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd488_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame0,
        .pOam = sSamusOam_2bd488_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd488_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame1,
        .pOam = sSamusOam_2bd488_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd488_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame2,
        .pOam = sSamusOam_2bd488_Frame2,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd4c8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd4c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame2,
        .pOam = sSamusOam_2bd4c8_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd488_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame0,
        .pOam = sSamusOam_2bd488_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd4f8[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd4f8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd4f8_Frame0,
        .pOam = sSamusOam_2bd4f8_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd4f8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd4f8_Frame1,
        .pOam = sSamusOam_2bd4f8_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd4f8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd4f8_Frame2,
        .pOam = sSamusOam_2bd4f8_Frame2,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd538[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd538_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame2,
        .pOam = sSamusOam_2bd538_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd4f8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd4f8_Frame0,
        .pOam = sSamusOam_2bd4f8_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd568[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd3e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd568_Frame0,
        .pOam = sSamusOam_2bd568_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd3e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd568_Frame1,
        .pOam = sSamusOam_2bd568_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd598[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd458_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd598_Frame0,
        .pOam = sSamusOam_2bd598_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd418_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd598_Frame1,
        .pOam = sSamusOam_2bd598_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd5c8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd4c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd5c8_Frame0,
        .pOam = sSamusOam_2bd5c8_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd5c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd5c8_Frame1,
        .pOam = sSamusOam_2bd5c8_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd5f8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd538_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd5f8_Frame0,
        .pOam = sSamusOam_2bd5f8_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd4f8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd5f8_Frame1,
        .pOam = sSamusOam_2bd5f8_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd628[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd628_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd628_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd628_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd628_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd628_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd628_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd628_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd628_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd628_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd628_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd6d8[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd6d8_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd6d8_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd6d8_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd6d8_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd6d8_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd6d8_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd6d8_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd6d8_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd6d8_Frame3,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd6d8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd6d8_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd788[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd788_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd788_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd788_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd788_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd788_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd788_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd788_Frame5,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd788_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd788_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd788_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd788_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd838[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd838_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd838_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd838_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd838_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd838_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd838_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd838_Frame1,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd838_Frame7,
        .timer = 3
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd838_Frame8,
        .timer = 3
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd838_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd838_Frame9,
        .timer = 3
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd8e8[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd8e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd3e8_Frame1,
        .pOam = sSamusOam_2bd8e8_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd8e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd3a8_Frame0,
        .pOam = sSamusOam_2bd8e8_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd8e8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd3a8_Frame2,
        .pOam = sSamusOam_2bd8e8_Frame0,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd928[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd928_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd928_Frame0,
        .pOam = sSamusOam_2bd928_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd8e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd3e8_Frame1,
        .pOam = sSamusOam_2bd8e8_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd958[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd958_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame0,
        .pOam = sSamusOam_2bd958_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd958_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame1,
        .pOam = sSamusOam_2bd958_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd958_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame2,
        .pOam = sSamusOam_2bd958_Frame0,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd998[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd998_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame2,
        .pOam = sSamusOam_2bd998_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd958_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd418_Frame0,
        .pOam = sSamusOam_2bd958_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bd9c8[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd9c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame0,
        .pOam = sSamusOam_2bd9c8_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd9c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame1,
        .pOam = sSamusOam_2bd9c8_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd9c8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame2,
        .pOam = sSamusOam_2bd9c8_Frame2,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bda08[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bda08_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame2,
        .pOam = sSamusOam_2bda08_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd9c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame0,
        .pOam = sSamusOam_2bd9c8_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bda38[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bda38_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd4f8_Frame0,
        .pOam = sSamusOam_2bda38_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bda38_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd4f8_Frame1,
        .pOam = sSamusOam_2bda38_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bda38_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd4f8_Frame2,
        .pOam = sSamusOam_2bda38_Frame0,
        .timer = 16
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bda78[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bda78_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd488_Frame2,
        .pOam = sSamusOam_2bda78_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bda38_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd4f8_Frame0,
        .pOam = sSamusOam_2bda38_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdaa8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd928_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdaa8_Frame0,
        .pOam = sSamusOam_2bdaa8_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd8e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdaa8_Frame1,
        .pOam = sSamusOam_2bdaa8_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdad8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd998_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdad8_Frame0,
        .pOam = sSamusOam_2bdad8_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd958_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdad8_Frame1,
        .pOam = sSamusOam_2bdad8_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdb08[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bda08_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdb08_Frame0,
        .pOam = sSamusOam_2bdb08_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd9c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdb08_Frame1,
        .pOam = sSamusOam_2bdb08_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdb38[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bda78_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdb38_Frame0,
        .pOam = sSamusOam_2bdb38_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bda38_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdb38_Frame1,
        .pOam = sSamusOam_2bdb38_Frame1,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdb68[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd0e8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd0e8_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd0e8_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd0e8_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd0e8_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd0e8_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd0e8_Frame6,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd0e8_Frame7,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd0e8_Frame8,
        .timer = 2
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd0e8_Frame9,
        .timer = 2
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdc18[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd628_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd628_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd628_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bd628_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd628_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd628_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd628_Frame6,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd628_Frame7,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bd628_Frame8,
        .timer = 2
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd628_Frame9,
        .timer = 2
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdcc8[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd0e8_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd0e8_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd0e8_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bdcc8_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd0e8_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd0e8_Frame5,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd0e8_Frame6,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd0e8_Frame7,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bdcc8_Frame8,
        .timer = 2
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd0e8_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd0e8_Frame9,
        .timer = 1
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdd78[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame0,
        .pOam = sSamusOam_2bd628_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame1,
        .pOam = sSamusOam_2bd628_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame2,
        .pOam = sSamusOam_2bd628_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame3,
        .pOam = sSamusOam_2bdd78_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame4,
        .pOam = sSamusOam_2bd628_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame5,
        .pOam = sSamusOam_2bd628_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame6,
        .pOam = sSamusOam_2bd628_Frame6,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame7,
        .pOam = sSamusOam_2bd628_Frame7,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame8,
        .pOam = sSamusOam_2bdd78_Frame8,
        .timer = 2
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2bd628_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2bd0e8_Frame9,
        .pOam = sSamusOam_2bd628_Frame9,
        .timer = 1
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bde28[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bde28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bde28_Frame0,
        .pOam = sSamusOam_2bde28_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bde48[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bde48_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bde28_Frame0,
        .pOam = sSamusOam_2bde28_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bde68[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bde68_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bde28_Frame0,
        .pOam = sSamusOam_2bde68_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bde88[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bde88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bde28_Frame0,
        .pOam = sSamusOam_2bde88_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdea8[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bdea8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame0,
        .pOam = sSamusOam_2bdea8_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bdea8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame1,
        .pOam = sSamusOam_2bdea8_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bdea8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame2,
        .pOam = sSamusOam_2bdea8_Frame2,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bdea8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame1,
        .pOam = sSamusOam_2bdea8_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdef8[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bdef8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame0,
        .pOam = sSamusOam_2bdef8_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bdef8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame1,
        .pOam = sSamusOam_2bdef8_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bdef8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame2,
        .pOam = sSamusOam_2bdef8_Frame2,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bdef8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame1,
        .pOam = sSamusOam_2bdef8_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdf48[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bdf48_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame0,
        .pOam = sSamusOam_2bdf48_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bdf48_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame1,
        .pOam = sSamusOam_2bdf48_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bdf48_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame2,
        .pOam = sSamusOam_2bdf48_Frame2,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bdf48_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame1,
        .pOam = sSamusOam_2bdf48_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2bdf98[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2bdf98_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame0,
        .pOam = sSamusOam_2bdf98_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2bdf98_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame1,
        .pOam = sSamusOam_2bdf98_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2bdf98_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame2,
        .pOam = sSamusOam_2bdf98_Frame2,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2bdf98_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2bdea8_Frame1,
        .pOam = sSamusOam_2bdf98_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_2c4948_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4948_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c4948_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4948_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c3f88_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c3f88_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c3f88_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c3f88_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c3f88_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c3f88_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2c3f88_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c3f88_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c3f88_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c3f88_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2c3f88_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c3f88_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c3f88_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c3f88_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_2c3f88_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c3f88_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2c3f88_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c3f88_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_2c3f88_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c3f88_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2c3f88_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c3f88_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_2c3f88_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c3f88_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2c3ff8_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c3ff8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c3ff8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c3ff8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c3ff8_Frame1[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c3ff8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2c3ff8_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c3ff8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4028_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4028_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4028_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4028_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4028_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4028_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c40c8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2c40c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c40c8_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2c40c8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c40c8_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2c40c8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c4168_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4168_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4168_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4168_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4168_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4168_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c4208_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4208_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4208_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4208_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4208_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4208_Frame2.gfx")
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

static const u8 sSamusGfx_Top_2c4708_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4708_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c4708_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4708_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4328_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4328_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c4328_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4328_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c49c8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c49c8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c49c8_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c49c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4348_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4348_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4348_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4348_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4348_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4348_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c4348_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4348_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2c4348_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4348_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2c4348_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4348_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2c43b8_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c43b8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c43b8_Frame1[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c43b8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2c43b8_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c43b8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c43e8_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c43e8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c43e8_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c43e8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c43e8_Frame2[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c43e8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c4488_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2c4488_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4488_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2c4488_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4488_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2c4488_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c4528_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4528_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4528_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4528_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4528_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4528_Frame2.gfx")
};

static const u8 sSamusGfx_2c101c[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/2c101c.gfx")
};

static const u8 sSamusGfx_Top_2c45c8_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c45c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c45c8_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c45c8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c45c8_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c45c8_Frame2.gfx")
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

static const u8 sSamusGfx_Top_2c4778_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4778_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c46e8_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c46e8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c47e8_Frame0[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2c47e8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c47e8_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c47e8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c47e8_Frame2[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2c47e8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c47e8_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c47e8_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2c4878_Frame0[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2c4878_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4878_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4878_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4878_Frame2[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2c4878_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2c4878_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4878_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2c4908_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4908_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c4908_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4908_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4928_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2c4928_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4998_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4998_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c4998_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4998_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4998_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4998_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2c4998_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4998_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4a18_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4a18_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4a18_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2c4a18_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4a48_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2c4a48_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2c4a48_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4a48_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4a48_Frame1[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2c4a48_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2c4a48_Frame1[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Bottom_2c4a48_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2c4a78_Frame0[] = {
    7, 7,
    _INCBIN_U8("data/samus/gfx/Top_2c4a78_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2c4a78_Frame1[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2c4a78_Frame1.gfx")
};

static const u16 sSamusOam_2c4948_Frame0[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe3, 0x1f0, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, 0x16,
    0xf8, 0x7, 0x18
};

static const u16 sSamusOam_2c3f88_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18,
    0xe0, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_2c3f88_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16,
    0xe0, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_2c3f88_Frame2[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16,
    0xe7, OBJ_SIZE_16x16 | 0x1f3, 0x2
};

static const u16 sSamusOam_2c3f88_Frame3[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16,
    0xe5, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_2c3f88_Frame4[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16,
    0xe2, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_2c3f88_Frame5[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16,
    0xe3, OBJ_SIZE_16x16 | 0x1f2, 0x2
};

static const u16 sSamusOam_2c3ff8_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16,
    0xea, OBJ_SIZE_16x16 | 0x1f3, 0x2
};

static const u16 sSamusOam_2c3ff8_Frame1[] = {
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

static const u16 sSamusOam_2c4028_Frame0[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd0, 0x1f7, 0x2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18
};

static const u16 sSamusOam_2c4028_Frame1[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd3, 0x1f7, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16
};

static const u16 sSamusOam_2c4028_Frame2[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd6, 0x1f7, 0x2,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16
};

static const u16 sSamusOam_2c4028_Frame3[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd4, 0x1f7, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c4028_Frame4[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd1, 0x1f7, 0x2,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16
};

static const u16 sSamusOam_2c4028_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd2, 0x1f7, 0x2,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4098_Frame0[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd7, 0x1f7, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16
};

static const u16 sSamusOam_2c4098_Frame1[] = {
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

static const u16 sSamusOam_2c40c8_Frame0[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x1ee, 0x2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18
};

static const u16 sSamusOam_2c40c8_Frame1[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1ee, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16
};

static const u16 sSamusOam_2c40c8_Frame2[] = {
    4,
    0xe1, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x1ee, 0x2,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16
};

static const u16 sSamusOam_2c40c8_Frame3[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1ee, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c40c8_Frame4[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ee, 0x2,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16
};

static const u16 sSamusOam_2c40c8_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1ef, 0x2,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4138_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x1ee, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16
};

static const u16 sSamusOam_2c4138_Frame1[] = {
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

static const u16 sSamusOam_2c4168_Frame0[] = {
    6,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd4, 0x1f7, 0x2,
    0xe4, 0x1ee, 0x3,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18
};

static const u16 sSamusOam_2c4168_Frame1[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd5, 0x1f7, 0x2,
    0xe5, 0x1ee, 0x3,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16
};

static const u16 sSamusOam_2c4168_Frame2[] = {
    5,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xda, 0x1f7, 0x2,
    0xea, 0x1ee, 0x3,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16
};

static const u16 sSamusOam_2c4168_Frame3[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd7, 0x1f7, 0x2,
    0xe7, 0x1ee, 0x3,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c4168_Frame4[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd4, 0x1f7, 0x2,
    0xe4, 0x1ee, 0x3,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16
};

static const u16 sSamusOam_2c4168_Frame5[] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd5, 0x1f7, 0x2,
    0xe5, 0x1ee, 0x3,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c41d8_Frame0[] = {
    5,
    0xe4, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdc, 0x1f7, 0x2,
    0xec, 0x1ee, 0x3,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16
};

static const u16 sSamusOam_2c41d8_Frame1[] = {
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

static const u16 sSamusOam_2c4208_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ef, 0x2,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, 0x1f8, 0x16,
    0xfe, 0x0, 0x18
};

static const u16 sSamusOam_2c4208_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ef, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0
};

static const u16 sSamusOam_2c4208_Frame2[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f0, 0x2,
    0xdd, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xec, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, 0x0, 0x16
};

static const u16 sSamusOam_2c4208_Frame3[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1ef, 0x2,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16
};

static const u16 sSamusOam_2c4208_Frame4[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1ef, 0x2,
    0xd7, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f9, 0x16
};

static const u16 sSamusOam_2c4208_Frame5[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1ef, 0x2,
    0xd9, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4278_Frame0[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f0, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f7, 0x16
};

static const u16 sSamusOam_2c4278_Frame1[] = {
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

static const u16 sSamusOam_2c4708_Frame0[] = {
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

static const u16 sSamusOam_2c49c8_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1fd, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f9, 0x16,
    0xf8, OBJ_X_FLIP | 0x1f1, 0x18
};

static const u16 sSamusOam_2c4348_Frame0[] = {
    5,
    0xe0, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_2c4348_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4348_Frame2[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4348_Frame3[] = {
    4,
    0xe5, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4348_Frame4[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1fe, 0x0,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_2c4348_Frame5[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1fe, 0x0,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c43b8_Frame0[] = {
    4,
    0xea, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_2c43b8_Frame1[] = {
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

static const u16 sSamusOam_2c43e8_Frame0[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_2c43e8_Frame1[] = {
    3,
    0xdb, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c43e8_Frame2[] = {
    3,
    0xdf, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c43e8_Frame3[] = {
    3,
    0xdc, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c43e8_Frame4[] = {
    3,
    0xd9, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_2c43e8_Frame5[] = {
    3,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4458_Frame0[] = {
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

static const u16 sSamusOam_2c4488_Frame0[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0xa, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_2c4488_Frame1[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0xa, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4488_Frame2[] = {
    4,
    0xe1, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe1, 0xa, 0x2,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4488_Frame3[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0xa, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4488_Frame4[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0xa, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_2c4488_Frame5[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x9, 0x2,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c44f8_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe3, 0xa, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_2c44f8_Frame1[] = {
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

static const u16 sSamusOam_2c4528_Frame0[] = {
    5,
    0xd4, OBJ_X_FLIP | 0x1, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_2c4528_Frame1[] = {
    4,
    0xd5, OBJ_X_FLIP | 0x1, 0x2,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4528_Frame2[] = {
    4,
    0xda, OBJ_X_FLIP | 0x1, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4528_Frame3[] = {
    4,
    0xd7, OBJ_X_FLIP | 0x1, 0x2,
    0xdf, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4528_Frame4[] = {
    4,
    0xd4, OBJ_X_FLIP | 0x1, 0x2,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_2c4528_Frame5[] = {
    4,
    0xd5, OBJ_X_FLIP | 0x1, 0x2,
    0xdd, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4598_Frame0[] = {
    4,
    0xdc, OBJ_X_FLIP | 0x1, 0x2,
    0xe4, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_2c4598_Frame1[] = {
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

static const u16 sSamusOam_2c45c8_Frame0[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, 0x1, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf6, OBJ_X_FLIP | 0x1f8, 0x16,
    0xfe, OBJ_X_FLIP | 0x1f8, 0x18
};

static const u16 sSamusOam_2c45c8_Frame1[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe8, 0x1, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c45c8_Frame2[] = {
    4,
    0xdd, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xed, 0x0, 0x2,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfc, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c45c8_Frame3[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xea, 0x1, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c45c8_Frame4[] = {
    4,
    0xd7, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe7, 0x1, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x16
};

static const u16 sSamusOam_2c45c8_Frame5[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe9, 0x1, 0x2,
    0xe7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4638_Frame0[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xef, 0x0, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_2c4638_Frame1[] = {
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

static const u16 sSamusOam_2c4778_Frame0[] = {
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

static const u16 sSamusOam_2c47e8_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe3, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_2c47e8_Frame1[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xeb, OBJ_SIZE_32x16 | 0x1f0, 0x0
};

static const u16 sSamusOam_2c47e8_Frame3[] = {
    2,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf3, OBJ_SIZE_16x16 | 0x1f8, 0x2
};

static const u16 sSamusOam_2c47e8_Frame4[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf3, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe3, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_2c47e8_Frame5[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xeb, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0
};

static const u16 sSamusOam_2c47e8_Frame7[] = {
    2,
    0xf2, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe2, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2
};

static const u16 sSamusOam_2c4908_Frame0[] = {
    4,
    0xe4, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16,
    0xeb, OBJ_SIZE_16x16 | 0x1f4, 0x2
};

static const u16 sSamusOam_2c4928_Frame0[] = {
    4,
    0xe5, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xed, 0xa, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4998_Frame0[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xda, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4998_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xe6, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf6, OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4a18_Frame0[] = {
    4,
    0xdf, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    0xda, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4a18_Frame1[] = {
    4,
    0xdc, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xd8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xe6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf6, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x16
};

static const u16 sSamusOam_2c4a48_Frame0[] = {
    4,
    0xec, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x5, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f5, 0x14
};

static const u16 sSamusOam_2c4a48_Frame1[] = {
    5,
    0xed, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x6, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f6, 0x14,
    0xf2, 0x16, 0x18
};

static const u16 sSamusOam_2c4a78_Frame0[] = {
    5,
    0xec, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xec, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xe0, OBJ_SIZE_16x16 | 0x1f3, 0x4,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x3, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1eb, 0x14
};

static const u16 sSamusOam_2c4a78_Frame1[] = {
    5,
    0xed, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f2, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x2, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1ea, 0x14,
    0xf2, OBJ_X_FLIP | 0x1e2, 0x18
};

const struct SamusAnimationData sSamusAnim_2c3f88[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c3f88_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c3f88_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c3f88_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c3f88_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c3f88_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c3f88_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c3ff8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c3ff8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c3ff8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c3ff8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame1,
        .pOam = sSamusOam_2c3ff8_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4028[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4028_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c4028_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4028_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c4028_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4028_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c4028_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4028_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4028_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4028_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c4028_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4028_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c4028_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4098[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4028_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c4098_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4028_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame1,
        .pOam = sSamusOam_2c4098_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c40c8[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c40c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c40c8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c40c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c40c8_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c40c8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c40c8_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c40c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c40c8_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c40c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c40c8_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c40c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c40c8_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4138[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c40c8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c4138_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c40c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame1,
        .pOam = sSamusOam_2c4138_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4168[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4168_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c4168_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4168_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c4168_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4168_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c4168_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4168_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4168_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4168_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c4168_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4168_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c4168_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c41d8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4168_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c41d8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4168_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame1,
        .pOam = sSamusOam_2c41d8_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4208[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4208_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c4208_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4208_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c4208_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4208_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c4208_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4208_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4208_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4208_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c4208_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4208_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c4208_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4278[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4208_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c4278_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4208_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame1,
        .pOam = sSamusOam_2c4278_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c42a8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c42a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c42a8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c42c8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c42c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c42c8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c42e8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c42e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c42e8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4308[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4308_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
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

const struct SamusAnimationData sSamusAnim_2c4348[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c4348_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c4348_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c4348_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4348_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c4348_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c4348_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c43b8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c43b8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c43b8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c43b8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c43b8_Frame1,
        .pOam = sSamusOam_2c43b8_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c43e8[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c43e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c43e8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c43e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c43e8_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c43e8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c43e8_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c43e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c43e8_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c43e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c43e8_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c43e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c43e8_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4458[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c43e8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c4458_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c43e8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c43b8_Frame1,
        .pOam = sSamusOam_2c43e8_Frame3,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4488[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4488_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c4488_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4488_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c4488_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4488_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c4488_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4488_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4488_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4488_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c4488_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4488_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c4488_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c44f8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4488_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c44f8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4488_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c43b8_Frame1,
        .pOam = sSamusOam_2c44f8_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4528[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4528_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c4528_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4528_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c4528_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4528_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c4528_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4528_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4528_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4528_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c4528_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4528_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c4528_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4598[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4528_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c4598_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4528_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c43b8_Frame1,
        .pOam = sSamusOam_2c4598_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c45c8[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c45c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c45c8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c45c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c45c8_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c45c8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c45c8_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c45c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c45c8_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c45c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame4,
        .pOam = sSamusOam_2c45c8_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c45c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame5,
        .pOam = sSamusOam_2c45c8_Frame5,
        .timer = 6
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4638[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c45c8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3ff8_Frame0,
        .pOam = sSamusOam_2c4638_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c45c8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c43b8_Frame1,
        .pOam = sSamusOam_2c4638_Frame1,
        .timer = 1
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4668[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4668_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4668_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4688[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4688_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4688_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c46a8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c46a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c46a8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c46c8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c46c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame3,
        .pOam = sSamusOam_2c4638_Frame1,
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

const struct SamusAnimationData sSamusAnim_2c4708[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4708_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4708_Frame0,
        .pOam = sSamusOam_2c4708_Frame0,
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

const struct SamusAnimationData sSamusAnim_2c4778[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4778_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4708_Frame0,
        .pOam = sSamusOam_2c4778_Frame0,
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

const struct SamusAnimationData sSamusAnim_2c47e8[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame7,
        .timer = 2
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4878[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame3,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame5,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame7,
        .timer = 2
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4908[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4908_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4908_Frame0,
        .pOam = sSamusOam_2c4908_Frame0,
        .timer = 2
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4928[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4928_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4908_Frame0,
        .pOam = sSamusOam_2c4928_Frame0,
        .timer = 2
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4948[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4948_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4948_Frame0,
        .pOam = sSamusOam_2c4948_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c3f88_Frame0,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c3f88_Frame1,
        .timer = 6
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c3f88_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c3f88_Frame2,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4998[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4998_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4998_Frame0,
        .pOam = sSamusOam_2c4998_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4998_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c4998_Frame1,
        .pOam = sSamusOam_2c4998_Frame1,
        .timer = 255
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c49c8[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c49c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c49c8_Frame0,
        .pOam = sSamusOam_2c49c8_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame0,
        .pOam = sSamusOam_2c4348_Frame0,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame1,
        .pOam = sSamusOam_2c4348_Frame1,
        .timer = 6
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4348_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2c3f88_Frame2,
        .pOam = sSamusOam_2c4348_Frame2,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4a18[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4a18_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4998_Frame0,
        .pOam = sSamusOam_2c4a18_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4a18_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c4998_Frame1,
        .pOam = sSamusOam_2c4a18_Frame1,
        .timer = 255
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4a48[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4a48_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4a48_Frame0,
        .pOam = sSamusOam_2c4a48_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4a48_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c4a48_Frame1,
        .pOam = sSamusOam_2c4a48_Frame1,
        .timer = 255
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4a78[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4a78_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2c4a48_Frame0,
        .pOam = sSamusOam_2c4a78_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4a78_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c4a48_Frame1,
        .pOam = sSamusOam_2c4a78_Frame1,
        .timer = 255
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4aa8[10] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4998_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c4998_Frame1,
        .pOam = sSamusOam_2c4998_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame1,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame3,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame5,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame7,
        .timer = 2
    },
    [9] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4b48[10] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4a18_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c4998_Frame1,
        .pOam = sSamusOam_2c4a18_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame1,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame3,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame5,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame7,
        .timer = 2
    },
    [9] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4be8[10] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4a48_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c4a48_Frame1,
        .pOam = sSamusOam_2c4a48_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame1,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame3,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame5,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2c47e8_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame7,
        .timer = 2
    },
    [9] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2c4c88[10] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2c4a78_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2c4a48_Frame1,
        .pOam = sSamusOam_2c4a78_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame1,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame0,
        .timer = 2
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame3,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame5,
        .timer = 2
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame4,
        .timer = 2
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2c4878_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2c47e8_Frame7,
        .timer = 2
    },
    [9] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_2cb348_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb348_Frame0.gfx")
};

static const u8 sSamusGfx_2c4dca[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/2c4dca.gfx")
};

static const u8 sSamusGfx_Top_2caec8_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2caec8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2caec8_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2caec8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2caec8_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2caec8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2cb368_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb368_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb388_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb388_Frame0.gfx")
};

static const u8 sSamusGfx_2c5276[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/2c5276.gfx")
};

static const u8 sSamusGfx_Top_2caf28_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2caf28_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2caf28_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2caf28_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2caf28_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2caf28_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2cb3a8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb3a8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb3c8_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb3c8_Frame0.gfx")
};

static const u8 sSamusGfx_2c5782[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/2c5782.gfx")
};

static const u8 sSamusGfx_Top_2caf88_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2caf88_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2caf88_Frame1[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2caf88_Frame1.gfx")
};

static const u8 sSamusGfx_2c5a68[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/2c5a68.gfx")
};

static const u8 sSamusGfx_Top_2cb408_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2cb408_Frame0.gfx")
};

static const u8 sSamusGfx_2c5c4c[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/2c5c4c.gfx")
};

static const u8 sSamusGfx_Top_2cafe8_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cafe8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cafe8_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cafe8_Frame1.gfx")
};

static const u8 sSamusGfx_2c5f52[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/2c5f52.gfx")
};

static const u8 sSamusGfx_Bottom_2cb348_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cb348_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cb048_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cb048_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cb388_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cb388_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cb3c8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cb3c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb3e8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb3e8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cb408_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cb408_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb428_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb428_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cb1c8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2cb1c8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb2e8_Frame0[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb2e8_Frame0.gfx")
};

static const u8 sSamusGfx_2c6746[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/2c6746.gfx")
};

static const u8 sSamusGfx_Top_2cb518_Frame2[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb518_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2cb448_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb448_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb448_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb448_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2cb488_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb488_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb448_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb448_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2cb488_Frame2[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb488_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2cb668_Frame1[] = {
    9, 6,
    _INCBIN_U8("data/samus/gfx/Top_2cb668_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2cb668_Frame2[] = {
    9, 6,
    _INCBIN_U8("data/samus/gfx/Top_2cb668_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2cb668_Frame3[] = {
    9, 6,
    _INCBIN_U8("data/samus/gfx/Top_2cb668_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2cb7a8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cb7a8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cb7a8_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2cb7a8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb7a8_Frame1[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb7a8_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2cb7a8_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cb7a8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2cb908_Frame0[] = {
    6, 4,
    _INCBIN_U8("data/samus/gfx/Top_2cb908_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cb7a8_Frame2[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb7a8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2cb7a8_Frame3[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb7a8_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2cb7a8_Frame6[] = {
    7, 4,
    _INCBIN_U8("data/samus/gfx/Top_2cb7a8_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2cb7a8_Frame7[] = {
    8, 4,
    _INCBIN_U8("data/samus/gfx/Top_2cb7a8_Frame7.gfx")
};

static const u8 sSamusGfx_Top_2cb7a8_Frame14[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb7a8_Frame14.gfx")
};

static const u8 sSamusGfx_Top_2cb7a8_Frame12[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cb7a8_Frame12.gfx")
};

static const u8 sSamusGfx_Top_2cba68_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cba68_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cba68_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2cba68_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cba68_Frame2[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cba68_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2cba68_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cba68_Frame2.gfx")
};

static const u8 sSamusGfx_2c8178[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/2c8178.gfx")
};

static const u8 sSamusGfx_2c829a[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/2c829a.gfx")
};

static const u8 sSamusGfx_Top_2cbac8_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbac8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cbb28_Frame0[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbb28_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cbb28_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbb28_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cbb28_Frame2[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbb28_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2cbb28_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbb28_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2cbb28_Frame4[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbb28_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_2cbb28_Frame4[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbb28_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2cbb28_Frame6[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbb28_Frame6.gfx")
};

static const u8 sSamusGfx_Bottom_2cbb28_Frame6[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbb28_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2cbb28_Frame3[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbb28_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_2cbb28_Frame3[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbb28_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2cbb28_Frame5[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbb28_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_2cbb28_Frame5[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbb28_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2cbb28_Frame7[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbb28_Frame7.gfx")
};

static const u8 sSamusGfx_Bottom_2cbb28_Frame7[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbb28_Frame7.gfx")
};

static const u8 sSamusGfx_Top_2cbb28_Frame9[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbb28_Frame9.gfx")
};

static const u8 sSamusGfx_Bottom_2cbb28_Frame9[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbb28_Frame9.gfx")
};

static const u8 sSamusGfx_Top_2cbd48_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbd48_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cbd48_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbd48_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cbd48_Frame2[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbd48_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2cbd48_Frame2[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbd48_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2cbd48_Frame4[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbd48_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_2cbd48_Frame4[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbd48_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2cbd48_Frame6[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbd48_Frame6.gfx")
};

static const u8 sSamusGfx_Bottom_2cbd48_Frame6[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbd48_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2cbd48_Frame1[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbd48_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2cbd48_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbd48_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2cbdd8_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbdd8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cbdd8_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbdd8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2cbdd8_Frame4[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbdd8_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2cbdd8_Frame6[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbdd8_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2cbdd8_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbdd8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2cbe68_Frame0[] = {
    7, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbe68_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cbe88_Frame0[] = {
    6, 2,
    _INCBIN_U8("data/samus/gfx/Top_2cbe88_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cbea8_Frame0[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbea8_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2cbea8_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbea8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2cbea8_Frame1[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbea8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2cbea8_Frame4[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2cbea8_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_2cbea8_Frame4[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2cbea8_Frame4.gfx")
};

static const u16 sSamusOam_2ca66a[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xd2, 0x1f7, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x17
};

static const u16 sSamusOam_2caec8_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xd2, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17
};

static const u16 sSamusOam_2caec8_Frame1[] = {
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

static const u16 sSamusOam_2caf28_Frame0[] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1f0, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_2caf28_Frame1[] = {
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

static const u16 sSamusOam_2caf88_Frame0[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, 0x3,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1f0, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_2caf88_Frame1[] = {
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

static const u16 sSamusOam_2cafe8_Frame0[] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f3, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x3, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f3, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, 0x17,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_2cafe8_Frame1[] = {
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

static const u16 sSamusOam_2cb048_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2cb048_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xda, 0x0, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_2cb368_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x0, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_2cb388_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2cb0a8_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1f1, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2cb0a8_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xe2, 0x9, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_2cb3a8_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x9, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_2cb3c8_Frame0[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f7, 0x2,
    0xef, 0x1ef, 0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2cb108_Frame0[] = {
    5,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f7, 0x3,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1ef, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2cb108_Frame1[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f8, 0x2,
    0xe8, 0x8, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_2cb3e8_Frame0[] = {
    4,
    0xe7, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f9, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_2cb408_Frame0[] = {
    4,
    0xe7, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xef, OBJ_SIZE_16x16 | 0x1ee, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2cb168_Frame0[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1f2, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x2, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f2, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f1, 0x16
};

static const u16 sSamusOam_2cb168_Frame1[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf7, 0x1f8, 0x3,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_2cb428_Frame0[] = {
    4,
    0xe7, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xf7, 0x3, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x7, 0x16
};

static const u16 sSamusOam_2cb1c8_Frame0[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xd6, 0x1f8, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16
};

static const u16 sSamusOam_2cb1c8_Frame1[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xd6, 0x0, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2cb228_Frame0[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1f0, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16
};

static const u16 sSamusOam_2cb228_Frame1[] = {
    4,
    0xde, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xde, 0xa, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2cb288_Frame0[] = {
    5,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f8, 0x3,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1f0, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16
};

static const u16 sSamusOam_2cb288_Frame1[] = {
    5,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xdb, 0x1f8, 0x2,
    0xe4, 0x8, 0x4,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2cb2e8_Frame0[] = {
    6,
    0xe1, OBJ_SIZE_16x16 | 0x1f3, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x3, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xf1, 0x1f3, 0x3,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16,
    0xf2, 0x1f1, OBJ_PALETTE_1 | 0x5
};

static const u16 sSamusOam_2cb2e8_Frame1[] = {
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

static const u16 sSamusOam_2cb518_Frame2[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x3
};

static const u16 sSamusOam_2cb448_Frame0[] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, 0x3,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, 0x2
};

static const u16 sSamusOam_2cb448_Frame1[] = {
    1,
    0xef, OBJ_SIZE_16x16 | 0x1f7, 0x0
};

static const u16 sSamusOam_2cb488_Frame0[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2cb488_Frame1[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2cb488_Frame2[] = {
    2,
    0xef, 0x1f8, 0x2,
    0xee, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2cb488_Frame3[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xef, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2cb488_Frame4[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xf0, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2cb488_Frame5[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xef, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2cb488_Frame6[] = {
    2,
    0xef, 0x1f8, 0x2,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2cb448_Frame2[] = {
    2,
    0xf0, 0x1f8, 0x2,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2cb628_Frame2[] = {
    3,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x3
};

static const u16 sSamusOam_2cb558_Frame0[] = {
    3,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, 0x3,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, 0x2
};

static const u16 sSamusOam_2cb558_Frame1[] = {
    1,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0
};

static const u16 sSamusOam_2cb668_Frame1[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, 0x6,
    0xf8, 0x4, 0x8,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, 0x5
};

static const u16 sSamusOam_2cb7a8_Frame0[] = {
    3,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, 0x2,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_2cb7a8_Frame1[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x5, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, 0x3,
    0xe8, 0x5, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_2cb908_Frame0[] = {
    4,
    0xe4, OBJ_SIZE_16x16 | 0x1fe, 0x0,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f9, 0x4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14
};

static const u16 sSamusOam_2cb7a8_Frame2[] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x1f5, 0x2,
    0xe8, 0x1f5, 0x5,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fd, 0x3,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_2cb7a8_Frame6[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1ed, 0x0,
    0xe8, 0x1f5, 0x6,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fd, 0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_2cb7a8_Frame7[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1ed, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ed, 0x4,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fd, 0x6,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_2cb7a8_Frame12[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1fd, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fd, 0x3,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x1f5, 0x2,
    0xe8, 0x1f5, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_2cba68_Frame2[] = {
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

static const u16 sSamusOam_2cbac8_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x1f7, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, 0x3
};

static const u16 sSamusOam_2cbb28_Frame0[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f4, 0x3,
    0xe8, 0x4, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, 0x16
};

static const u16 sSamusOam_2cbd48_Frame0[] = {
    5,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f5, 0x2,
    0xe8, 0x1ed, 0x4,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16
};

static const u16 sSamusOam_2cbdd8_Frame0[] = {
    4,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fb, 0x2
};

static const u16 sSamusOam_2cbdd8_Frame1[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16
};

static const u16 sSamusOam_2cbe68_Frame0[] = {
    6,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f5, 0x2,
    0xe8, 0x1ed, 0x6,
    0xf0, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f2, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ed, 0x4
};

static const u16 sSamusOam_2cbe88_Frame0[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fb, 0x2,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x6, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x3, 0x4
};

static const u16 sSamusOam_2cbea8_Frame0[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f3, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x3, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f3, 0x3,
    0xea, 0x3, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, 0x16
};

static const u16 sSamusOam_2cbea8_Frame4[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x7, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, 0x3,
    0xe9, 0x7, 0x5,
    0xf0, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xf8, 0x7, 0x16
};

const struct SamusAnimationData sSamusAnim_2caec8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caec8_Frame0,
        .pOam = sSamusOam_2caec8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caec8_Frame0,
        .pOam = sSamusOam_2caec8_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2caef8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caec8_Frame0,
        .pOam = sSamusOam_2caec8_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caec8_Frame0,
        .pOam = sSamusOam_2caec8_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2caf28[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf28_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf28_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2caf58[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf28_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf28_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2caf88[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf88_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf88_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cafb8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf88_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf88_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cafe8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2cafe8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2cafe8_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb018[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2cafe8_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2cafe8_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb048[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb048_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb048_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb078[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb048_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb048_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb0a8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb0a8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb0a8_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb0d8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb0a8_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb0a8_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb108[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb108_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb108_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb138[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb108_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb108_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb168[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb168_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb168_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb198[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb168_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb048_Frame0,
        .pOam = sSamusOam_2cb168_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb1c8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb1c8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb1c8_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb1f8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb1c8_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caec8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb1c8_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb228[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb228_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb228_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb258[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb228_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb228_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb288[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb288_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb288_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb2b8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb288_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb288_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb2e8[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb2e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb2e8_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb2e8_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb318[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cafe8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb2e8_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb2e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb1c8_Frame0,
        .pOam = sSamusOam_2cb2e8_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb348[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb348_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb348_Frame0,
        .pOam = sSamusOam_2cb048_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb368[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb368_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb348_Frame0,
        .pOam = sSamusOam_2cb368_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb388[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb388_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb388_Frame0,
        .pOam = sSamusOam_2cb388_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb3a8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb3a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb388_Frame0,
        .pOam = sSamusOam_2cb3a8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb3c8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb3c8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb3c8_Frame0,
        .pOam = sSamusOam_2cb3c8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb3e8[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb3e8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb3c8_Frame0,
        .pOam = sSamusOam_2cb3e8_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb408[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb408_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb408_Frame0,
        .pOam = sSamusOam_2cb408_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb428[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb428_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb408_Frame0,
        .pOam = sSamusOam_2cb428_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb448[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb448_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb448_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb448_Frame2,
        .timer = 2
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb488[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb488_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb488_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame2,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame3,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cb488_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame5,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2cb488_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb448_Frame2,
        .timer = 3
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb518[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb448_Frame1,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb448_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb518_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb518_Frame2,
        .timer = 1
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb558[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb558_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb558_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame1,
        .timer = 2
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb598[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb488_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb448_Frame2,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb488_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame6,
        .timer = 3
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame5,
        .timer = 3
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cb488_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame4,
        .timer = 3
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame3,
        .timer = 3
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2cb488_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame2,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb488_Frame1,
        .timer = 3
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb628[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb558_Frame1,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb448_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb558_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb518_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb628_Frame2,
        .timer = 1
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb668[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf88_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb6b8[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf88_Frame1,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb708[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf88_Frame0,
        .timer = 4
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb758[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2caf88_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2caf28_Frame0,
        .pOam = sSamusOam_2caf88_Frame1,
        .timer = 4
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb7a8[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame0,
        .pOam = sSamusOam_2cb7a8_Frame0,
        .timer = 6
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame6,
        .timer = 4
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame6,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame7,
        .timer = 4
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame6,
        .timer = 4
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame12,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame12,
        .timer = 4
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 12
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame14,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 30
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 8
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb8b8[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame0,
        .pOam = sSamusOam_2cb7a8_Frame0,
        .timer = 4
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cb908[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb908_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame0,
        .pOam = sSamusOam_2cb908_Frame0,
        .timer = 6
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame6,
        .timer = 4
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame6,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame7,
        .timer = 4
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame2,
        .timer = 4
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame6,
        .timer = 4
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame12,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame12,
        .timer = 4
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 12
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame14,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 30
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 8
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cba18[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame1,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb908_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame0,
        .pOam = sSamusOam_2cb908_Frame0,
        .timer = 8
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cba68[6] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cba68_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cba68_Frame0,
        .pOam = sSamusOam_2cb7a8_Frame0,
        .timer = 6
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cba68_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cba68_Frame2,
        .pOam = sSamusOam_2cba68_Frame2,
        .timer = 6
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cba68_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cba68_Frame2,
        .pOam = sSamusOam_2cba68_Frame2,
        .timer = 255
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cba68_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cba68_Frame2,
        .pOam = sSamusOam_2cba68_Frame2,
        .timer = 4
    },
    [5] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cbac8[6] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cbac8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cba68_Frame0,
        .pOam = sSamusOam_2cbac8_Frame0,
        .timer = 6
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cba68_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cba68_Frame2,
        .pOam = sSamusOam_2cba68_Frame2,
        .timer = 6
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cba68_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cba68_Frame2,
        .pOam = sSamusOam_2cba68_Frame2,
        .timer = 255
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cba68_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cba68_Frame2,
        .pOam = sSamusOam_2cba68_Frame2,
        .timer = 4
    },
    [5] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cbb28[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame0,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame2,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame3,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame4,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame5,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame6,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame7,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame0,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame9,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame2,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame7,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame4,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame5,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame6,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame3,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cbc38[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame0,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cb668_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2cb668_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame2,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame3,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame4,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame5,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame6,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame7,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame0,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame9,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame2,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame7,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame4,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame5,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame6,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_2cbb28_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2cbb28_Frame3,
        .pOam = sSamusOam_2cbb28_Frame0,
        .timer = 1
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cbd48[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cbd48_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame0,
        .pOam = sSamusOam_2cbd48_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cbd48_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbd48_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cbd48_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame2,
        .pOam = sSamusOam_2cbd48_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cbd48_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbd48_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cbd48_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame4,
        .pOam = sSamusOam_2cbd48_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cbd48_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbd48_Frame0,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2cbd48_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame6,
        .pOam = sSamusOam_2cbd48_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2cbd48_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbd48_Frame0,
        .timer = 1
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cbdd8[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cbdd8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame0,
        .pOam = sSamusOam_2cbdd8_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cbdd8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbdd8_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cbdd8_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame2,
        .pOam = sSamusOam_2cbdd8_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cbdd8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbdd8_Frame1,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cbdd8_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame4,
        .pOam = sSamusOam_2cbdd8_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cbdd8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbdd8_Frame1,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2cbdd8_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame6,
        .pOam = sSamusOam_2cbdd8_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2cbdd8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbdd8_Frame1,
        .timer = 1
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cbe68[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cbe68_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbe68_Frame0,
        .timer = 60
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cbe88[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cbe88_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbd48_Frame1,
        .pOam = sSamusOam_2cbe88_Frame0,
        .timer = 60
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2cbea8[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2cbea8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbea8_Frame0,
        .pOam = sSamusOam_2cbea8_Frame0,
        .timer = 8
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2cbea8_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2cbea8_Frame0,
        .pOam = sSamusOam_2cbea8_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2cbea8_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cbea8_Frame0,
        .pOam = sSamusOam_2cbea8_Frame0,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2cb7a8_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame1,
        .pOam = sSamusOam_2cb7a8_Frame7,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2cbea8_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2cbea8_Frame4,
        .pOam = sSamusOam_2cbea8_Frame4,
        .timer = 32
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2cb908_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2cb7a8_Frame0,
        .pOam = sSamusOam_2cb908_Frame0,
        .timer = 4
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_2d607c_Frame3[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d607c_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_2d607c_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d607c_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d607c_Frame4[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d607c_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_2d607c_Frame4[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d607c_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2d607c_Frame5[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d607c_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_2d607c_Frame5[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d607c_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d607c_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d607c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d607c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d607c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d607c_Frame1[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d607c_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2d607c_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d607c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d607c_Frame2[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d607c_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2d607c_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d607c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d60fc_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d60fc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d60fc_Frame1[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d60fc_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d60fc_Frame2[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d60fc_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d60fc_Frame3[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d60fc_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d60fc_Frame4[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d60fc_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2d60fc_Frame5[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d60fc_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d625c_Frame0[] = {
    6, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d625c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d625c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d625c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d625c_Frame1[] = {
    6, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d625c_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2d625c_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d625c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d62bc_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d62bc_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d62bc_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d62bc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d62dc_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d62dc_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d62dc_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d62dc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d630c_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d630c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d632c_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d632c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d635c_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d635c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d637c_Frame0[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d637c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d63ac_Frame0[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d63ac_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d63ac_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d63ac_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d63ac_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d63ac_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2d63ac_Frame1[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d63ac_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d640c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d640c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d640c_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d640c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d642c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d642c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d642c_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d642c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d645c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d645c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d647c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d647c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d64ac_Frame0[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d64ac_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d64cc_Frame0[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d64cc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d64fc_Frame0[] = {
    7, 7,
    _INCBIN_U8("data/samus/gfx/Top_2d64fc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d64fc_Frame1[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d64fc_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d652c_Frame0[] = {
    7, 7,
    _INCBIN_U8("data/samus/gfx/Top_2d652c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d652c_Frame1[] = {
    6, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d652c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d655c_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d655c_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2d655c_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d655c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d655c_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d655c_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_2d655c_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d655c_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d655c_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d655c_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2d655c_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d655c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d655c_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d655c_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_2d655c_Frame5[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d655c_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d655c_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d655c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d655c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d655c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d65dc_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d65dc_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2d65dc_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d65dc_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d65dc_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d65dc_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2d65dc_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d65dc_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d661c_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d661c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d661c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d661c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d661c_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d661c_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2d661c_Frame1[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d661c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d661c_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d661c_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2d661c_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d661c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d661c_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d661c_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_2d661c_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d661c_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d668c_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d668c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d668c_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d668c_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d668c_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d668c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d668c_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d668c_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d668c_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d668c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d670c_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d670c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d670c_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d670c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d674c_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d674c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d674c_Frame1[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d674c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d674c_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d674c_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2d674c_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d674c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d674c_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d674c_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d666c_Frame0[] = {
    7, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d666c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d679c_Frame0[] = {
    7, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d679c_Frame0.gfx")
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

static const u8 sSamusGfx_Top_2d680c_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d680c_Frame1[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame1.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d680c_Frame2[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame2.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame2[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d680c_Frame3[] = {
    5, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame3.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame3[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d680c_Frame4[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame4.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame4[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2d680c_Frame5[] = {
    5, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame5.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame5[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d680c_Frame6[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame6.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame6[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2d680c_Frame7[] = {
    4, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame7.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame7[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame7.gfx")
};

static const u8 sSamusGfx_Top_2d680c_Frame8[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d680c_Frame8.gfx")
};

static const u8 sSamusGfx_Bottom_2d680c_Frame8[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d680c_Frame8.gfx")
};

static const u8 sSamusGfx_Top_2d68bc_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d68bc_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d68bc_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d68bc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d68bc_Frame1[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d68bc_Frame1.gfx")
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

static const u8 sSamusGfx_Top_2d696c_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d696c_Frame1[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d696c_Frame2[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d696c_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d696c_Frame4[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2d696c_Frame5[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d696c_Frame6[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2d696c_Frame7[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame7.gfx")
};

static const u8 sSamusGfx_Top_2d696c_Frame8[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d696c_Frame8.gfx")
};

static const u8 sSamusGfx_Top_2d6a1c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6a1c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6a1c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6a1c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6a3c_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d6a3c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6a3c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6a3c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6a6c_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d6a6c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6a6c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6a6c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6a8c_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d6a8c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6a8c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6a8c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6abc_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6abc_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6abc_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6abc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6adc_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d6adc_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6adc_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6adc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6b0c_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d6b0c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6b2c_Frame0[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2d6b2c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6b5c_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d6b5c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6b7c_Frame0[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d6b7c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6bac_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6bac_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6bcc_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d6bcc_Frame0.gfx")
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

static const u8 sSamusGfx_Top_2d6d5c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6d5c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6d5c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6d5c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6d7c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6d7c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6d7c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6d7c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6dac_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6dac_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6dac_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6dac_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6dcc_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6dcc_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6dcc_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6dcc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6dfc_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6dfc_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6dfc_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6dfc_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6e1c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6e1c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6e1c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6e1c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6e4c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6e4c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6e4c_Frame0[] = {
    3, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6e4c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6e6c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Top_2d6e6c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6e6c_Frame0[] = {
    2, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6e6c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6e9c_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d6e9c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6e9c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6e9c_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d6f1c_Frame0[] = {
    3, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d6f1c_Frame0.gfx")
};

static const u8 sSamusGfx_Bottom_2d6f1c_Frame0[] = {
    4, 2,
    _INCBIN_U8("data/samus/gfx/Bottom_2d6f1c_Frame0.gfx")
};

static const u16 sSamusOam_2d607c_Frame3[] = {
    5,
    0xe0, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x4
};

static const u16 sSamusOam_2d607c_Frame4[] = {
    5,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16,
    0xdb, OBJ_SIZE_16x16 | 0x1f4, 0x4
};

static const u16 sSamusOam_2d607c_Frame5[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x2,
    0xe9, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1f8, 0x16,
    0xdf, OBJ_SIZE_16x16 | 0x1f5, 0x4
};

static const u16 sSamusOam_2d607c_Frame0[] = {
    5,
    0xd7, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x2,
    0xea, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfa, 0x1f7, 0x16,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x4
};

static const u16 sSamusOam_2d607c_Frame1[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x4
};

static const u16 sSamusOam_2d607c_Frame2[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f8, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, 0x4
};

static const u16 sSamusOam_2d60fc_Frame0[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x4
};

static const u16 sSamusOam_2d60fc_Frame1[] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xdc, OBJ_SIZE_16x16 | 0x1f5, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, 0x4
};

static const u16 sSamusOam_2d60fc_Frame2[] = {
    5,
    0xd7, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f8, 0x16,
    0xde, OBJ_SIZE_16x16 | 0x1fa, 0x4
};

static const u16 sSamusOam_2d60fc_Frame3[] = {
    5,
    0xd7, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    0xea, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfa, OBJ_X_FLIP | 0x1f9, 0x16,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x4
};

static const u16 sSamusOam_2d60fc_Frame4[] = {
    5,
    0xdf, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xde, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16,
    0xde, OBJ_SIZE_16x16 | 0x1f9, 0x4
};

static const u16 sSamusOam_2d60fc_Frame5[] = {
    5,
    0xe1, 0x7, 0x4,
    0xde, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f8, 0x16,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, 0x2
};

static const u16 sSamusOam_2d625c_Frame0[] = {
    5,
    0xe3, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xdf, OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xef, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xff, 0x1f8, 0x16,
    0xd7, OBJ_SIZE_16x16 | 0x1fa, 0x4
};

static const u16 sSamusOam_2d625c_Frame1[] = {
    4,
    0xe4, OBJ_SIZE_16x16 | 0x1f2, 0x0,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_2d62bc_Frame0[] = {
    4,
    0xe4, 0x1f2, 0x4,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_2d62dc_Frame0[] = {
    4,
    0xe5, 0x1f2, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0
};

static const u16 sSamusOam_2d630c_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x1f2, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x3
};

static const u16 sSamusOam_2d632c_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x1f3, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x3
};

static const u16 sSamusOam_2d635c_Frame0[] = {
    4,
    0xe7, 0x1f2, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x2
};

static const u16 sSamusOam_2d637c_Frame0[] = {
    4,
    0xe6, 0x1f3, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f9, 0x2
};

static const u16 sSamusOam_2d63ac_Frame0[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x7, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14
};

static const u16 sSamusOam_2d63ac_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xea, 0x9, 0x2,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14
};

static const u16 sSamusOam_2d640c_Frame0[] = {
    4,
    0xda, 0x1f7, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xe4, 0x6, 0x3
};

static const u16 sSamusOam_2d642c_Frame0[] = {
    4,
    0xda, 0x1f7, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe5, 0x5, 0x3
};

static const u16 sSamusOam_2d645c_Frame0[] = {
    4,
    0xe9, 0x9, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14
};

static const u16 sSamusOam_2d647c_Frame0[] = {
    4,
    0xe9, 0x7, 0x2,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2d64ac_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe7, 0x7, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14
};

static const u16 sSamusOam_2d64cc_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x5, 0x2,
    0xda, 0x1f7, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2d64fc_Frame0[] = {
    3,
    0xdf, OBJ_SIZE_16x16 | 0x1ea, 0x4,
    OBJ_SHAPE_VERTICAL | 0xdf, 0xfa, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_SIZE_32x16 | 0x1e8, 0x0
};

static const u16 sSamusOam_2d64fc_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1e8, 0x3,
    0xe6, 0x1f8, 0x5,
    0xee, OBJ_SIZE_16x16 | 0x1ee, 0x0,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1fe, 0x2
};

static const u16 sSamusOam_2d652c_Frame0[] = {
    3,
    0xde, OBJ_SIZE_16x16 | 0x1fe, 0x4,
    OBJ_SHAPE_VERTICAL | 0xde, 0xe, 0x6,
    OBJ_SHAPE_HORIZONTAL | 0xee, OBJ_SIZE_32x16 | 0x1f8, 0x0
};

static const u16 sSamusOam_2d652c_Frame1[] = {
    4,
    0xee, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    OBJ_SHAPE_VERTICAL | 0xee, 0xa, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x0, 0x3,
    0xe6, 0x10, 0x5
};

static const u16 sSamusOam_2d655c_Frame2[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f8, 0x16
};

static const u16 sSamusOam_2d655c_Frame3[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xef, 0x1f6, 0x16,
    0xf7, OBJ_SIZE_16x16 | 0x1f6, 0x14
};

static const u16 sSamusOam_2d655c_Frame1[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xef, 0x1f8, 0x16
};

static const u16 sSamusOam_2d655c_Frame5[] = {
    4,
    0xda, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xef, 0x1f8, 0x16
};

static const u16 sSamusOam_2d655c_Frame0[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdf, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xed, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    0xfd, 0x1fb, 0x16
};

static const u16 sSamusOam_2d65dc_Frame1[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f7, 0x16
};

static const u16 sSamusOam_2d65dc_Frame2[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdf, OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, 0x16
};

static const u16 sSamusOam_2d661c_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f9, 0x2,
    0xe1, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe7, OBJ_X_FLIP | 0x1f7, 0x3
};

static const u16 sSamusOam_2d661c_Frame1[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0xe4, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf8, 0x1, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_X_FLIP | 0x1f8, 0x2
};

static const u16 sSamusOam_2d661c_Frame2[] = {
    4,
    0xe4, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fb, 0x16,
    0xf0, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf4, 0x1ed, 0x2
};

static const u16 sSamusOam_2d661c_Frame3[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xe8, OBJ_SIZE_16x16 | 0x1ef, 0x2,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, 0x16
};

static const u16 sSamusOam_2d668c_Frame2[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2d668c_Frame3[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xef, OBJ_X_FLIP | 0x1fa, 0x16,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14
};

static const u16 sSamusOam_2d668c_Frame1[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xef, OBJ_X_FLIP | 0x0, 0x16
};

static const u16 sSamusOam_2d668c_Frame5[] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xe0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf7, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0xef, OBJ_X_FLIP | 0x1ff, 0x16
};

static const u16 sSamusOam_2d668c_Frame0[] = {
    4,
    0xd9, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xed, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    0xfd, OBJ_X_FLIP | 0x1fd, 0x16
};

static const u16 sSamusOam_2d670c_Frame1[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xeb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_2d670c_Frame2[] = {
    4,
    0xe2, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xdf, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_2d674c_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1ff, 0x2,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_2d674c_Frame1[] = {
    4,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x0, 0x2,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf8, OBJ_X_FLIP | 0x1f7, 0x16
};

static const u16 sSamusOam_2d674c_Frame2[] = {
    4,
    0xe9, OBJ_SIZE_16x16 | 0x1, 0x0,
    0xe3, OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2d674c_Frame3[] = {
    4,
    0xe8, OBJ_SIZE_16x16 | 0x1, 0x0,
    0xe0, OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f5, 0x16
};

static const u16 sSamusOam_2d666c_Frame0[] = {
    5,
    0xf2, 0x1f9, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xe3, 0x1f4, 0x3,
    0xeb, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xea, 0x4, 0x2,
    0xfa, 0x4, 0x6
};

static const u16 sSamusOam_2d679c_Frame0[] = {
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

static const u16 sSamusOam_2d680c_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x4,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f8, 0x16,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x2
};

static const u16 sSamusOam_2d680c_Frame1[] = {
    5,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xdb, 0x0, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1ef, 0x2
};

static const u16 sSamusOam_2d680c_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x3, 0x2,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f3, 0x3,
    0xe3, OBJ_SIZE_16x16 | 0x1fb, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f8, 0x16
};

static const u16 sSamusOam_2d680c_Frame3[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fc, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xdb, 0x1f7, 0x4,
    0xf2, OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1fa, 0x16
};

static const u16 sSamusOam_2d680c_Frame4[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f4, 0x3,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f9, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0x2, 0x1ff, 0x16
};

static const u16 sSamusOam_2d680c_Frame5[] = {
    5,
    0xe1, OBJ_SIZE_16x16 | 0x1f1, 0x0,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f7, 0x16,
    0xdb, 0x1ff, 0x4
};

static const u16 sSamusOam_2d680c_Frame6[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1f1, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xda, 0x1, 0x3,
    0xf1, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f6, 0x16
};

static const u16 sSamusOam_2d680c_Frame7[] = {
    5,
    0xda, 0x1f5, 0x3,
    0xf1, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x1, 0x1f6, 0x16,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x5, 0x2
};

static const u16 sSamusOam_2d680c_Frame8[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f6, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1, 0x3
};

static const u16 sSamusOam_2d68bc_Frame0[] = {
    5,
    0xdb, 0x1fc, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    0xf3, 0x1f4, 0x3,
    0xf2, OBJ_SIZE_16x16 | 0x1f4, 0x14,
    0x2, 0x1fc, 0x16
};

static const u16 sSamusOam_2d68bc_Frame1[] = {
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

static const u16 sSamusOam_2d696c_Frame0[] = {
    5,
    0xe9, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0x2, OBJ_X_FLIP | 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fb, 0x4
};

static const u16 sSamusOam_2d696c_Frame1[] = {
    5,
    0xde, OBJ_SIZE_16x16 | 0x0, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f7, 0x4,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f9, 0x16
};

static const u16 sSamusOam_2d696c_Frame2[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1f6, 0x4,
    0xda, OBJ_SIZE_16x16 | 0x0, 0x0,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x2,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_X_FLIP | 0x1fa, 0x16
};

static const u16 sSamusOam_2d696c_Frame3[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xda, 0x4, 0x2,
    0xf1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x1, OBJ_X_FLIP | 0x1fa, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x1f5, 0x3,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x0
};

static const u16 sSamusOam_2d696c_Frame4[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1, 0x2,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f7, 0x16,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1f7, 0x3
};

static const u16 sSamusOam_2d696c_Frame5[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fa, 0x4,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f8, 0x16,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, 0x2
};

static const u16 sSamusOam_2d696c_Frame6[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f8, 0x2,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f8, 0x16,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x1fe, 0x3
};

static const u16 sSamusOam_2d696c_Frame7[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f3, 0x2,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x2, 0x3,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f8, 0x16
};

static const u16 sSamusOam_2d696c_Frame8[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f4, 0x3,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1, 0x2,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x0,
    0xf3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x3, OBJ_X_FLIP | 0x1f6, 0x16
};

static const u16 sSamusOam_2d6a1c_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xdb, 0x1fd, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    0x2, 0x1fd, 0x16
};

static const u16 sSamusOam_2d6a3c_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f5, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f5, 0x16
};

static const u16 sSamusOam_2d6a6c_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f7, 0x16
};

static const u16 sSamusOam_2d6a8c_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, 0x1f8, 0x16
};

static const u16 sSamusOam_2d6abc_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xdb, 0x1fe, 0x2,
    0xf2, OBJ_SIZE_16x16 | 0x1f7, 0x14,
    0x2, 0x1ff, 0x16
};

static const u16 sSamusOam_2d6adc_Frame0[] = {
    4,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1fe, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    0xf1, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0x1, 0x0, 0x16
};

static const u16 sSamusOam_2d6b0c_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1fd, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f8, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    0x2, OBJ_X_FLIP | 0x1fb, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x3
};

static const u16 sSamusOam_2d6b2c_Frame0[] = {
    5,
    OBJ_SHAPE_VERTICAL | 0xe4, 0x1fc, 0x2,
    0xe3, OBJ_SIZE_16x16 | 0x1f7, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x3,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1fb, 0x16
};

static const u16 sSamusOam_2d6b5c_Frame0[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1fc, 0x0,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, 0x2,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f9, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x4
};

static const u16 sSamusOam_2d6b7c_Frame0[] = {
    5,
    0xe7, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x2,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0x2, OBJ_X_FLIP | 0x1f8, 0x16,
    OBJ_SHAPE_VERTICAL | 0xdb, OBJ_X_FLIP | 0x1fa, 0x4
};

static const u16 sSamusOam_2d6bac_Frame0[] = {
    4,
    0xe3, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xf2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, 0x14,
    0x2, OBJ_X_FLIP | 0x1f9, 0x16,
    0xdb, OBJ_X_FLIP | 0x1fa, 0x2
};

static const u16 sSamusOam_2d6bcc_Frame0[] = {
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

static const u16 sSamusOam_2d6d5c_Frame0[] = {
    4,
    0xd8, 0x1f7, 0x2,
    0xe0, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xea, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfa, 0x1f8, 0x16
};

static const u16 sSamusOam_2d6dac_Frame0[] = {
    3,
    0xda, 0x1f7, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1fa, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_2d6dfc_Frame0[] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xd8, 0x1, 0x2,
    0xea, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfa, 0x0, 0x16
};

static const u16 sSamusOam_2d6e1c_Frame0[] = {
    4,
    0xd8, 0x1, 0x2,
    0xe0, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xea, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xfa, 0x0, 0x16
};

static const u16 sSamusOam_2d6e4c_Frame0[] = {
    4,
    0xda, 0x1, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14,
    0xf2, 0x1f0, 0x16
};

static const u16 sSamusOam_2d6e6c_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xda, 0x0, 0x2,
    0xe2, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    0xf2, OBJ_SIZE_16x16 | 0x1f8, 0x14
};

static const u16 sSamusOam_2d6e9c_Frame0[] = {
    4,
    0xeb, OBJ_SIZE_16x16 | 0x1f6, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f6, 0x16,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x6, 0x2
};

static const u16 sSamusOam_2d6f1c_Frame0[] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f2, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x2, 0x2,
    0xeb, OBJ_SIZE_16x16 | 0x1f9, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xfb, 0x1f9, 0x16
};

const struct SamusAnimationData sSamusAnim_2d607c[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame0,
        .pOam = sSamusOam_2d607c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame1,
        .pOam = sSamusOam_2d607c_Frame1,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame2,
        .pOam = sSamusOam_2d607c_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame3,
        .pOam = sSamusOam_2d607c_Frame3,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame4,
        .pOam = sSamusOam_2d607c_Frame4,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame5,
        .pOam = sSamusOam_2d607c_Frame5,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame0,
        .pOam = sSamusOam_2d607c_Frame0,
        .timer = 4
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d60fc[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame3,
        .pOam = sSamusOam_2d60fc_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame4,
        .pOam = sSamusOam_2d60fc_Frame1,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame5,
        .pOam = sSamusOam_2d60fc_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame0,
        .pOam = sSamusOam_2d60fc_Frame3,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame1,
        .pOam = sSamusOam_2d60fc_Frame4,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame2,
        .pOam = sSamusOam_2d60fc_Frame5,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame3,
        .pOam = sSamusOam_2d60fc_Frame0,
        .timer = 4
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d617c[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame5,
        .pOam = sSamusOam_2d607c_Frame5,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame4,
        .pOam = sSamusOam_2d607c_Frame4,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame3,
        .pOam = sSamusOam_2d607c_Frame3,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame2,
        .pOam = sSamusOam_2d607c_Frame2,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame1,
        .pOam = sSamusOam_2d607c_Frame1,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d607c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame0,
        .pOam = sSamusOam_2d607c_Frame0,
        .timer = 4
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d61ec[7] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame2,
        .pOam = sSamusOam_2d60fc_Frame5,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame1,
        .pOam = sSamusOam_2d60fc_Frame4,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame0,
        .pOam = sSamusOam_2d60fc_Frame3,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame5,
        .pOam = sSamusOam_2d60fc_Frame2,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame4,
        .pOam = sSamusOam_2d60fc_Frame1,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d60fc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d607c_Frame3,
        .pOam = sSamusOam_2d60fc_Frame0,
        .timer = 4
    },
    [6] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d625c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d625c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d625c_Frame0,
        .pOam = sSamusOam_2d625c_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d625c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d625c_Frame1,
        .pOam = sSamusOam_2d625c_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d628c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d625c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d625c_Frame1,
        .pOam = sSamusOam_2d625c_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d625c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d625c_Frame0,
        .pOam = sSamusOam_2d625c_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d62bc[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d62bc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62bc_Frame0,
        .pOam = sSamusOam_2d62bc_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d62dc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d62dc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62dc_Frame0,
        .pOam = sSamusOam_2d62dc_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d62bc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62bc_Frame0,
        .pOam = sSamusOam_2d62bc_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d630c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d630c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62bc_Frame0,
        .pOam = sSamusOam_2d630c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d632c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d632c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62dc_Frame0,
        .pOam = sSamusOam_2d632c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d630c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62bc_Frame0,
        .pOam = sSamusOam_2d630c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d635c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d635c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62bc_Frame0,
        .pOam = sSamusOam_2d635c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d637c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d637c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62dc_Frame0,
        .pOam = sSamusOam_2d637c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d635c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d62bc_Frame0,
        .pOam = sSamusOam_2d635c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d63ac[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d63ac_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d63ac_Frame0,
        .pOam = sSamusOam_2d63ac_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d63ac_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d63ac_Frame1,
        .pOam = sSamusOam_2d63ac_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d63dc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d63ac_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d63ac_Frame1,
        .pOam = sSamusOam_2d63ac_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d63ac_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d63ac_Frame0,
        .pOam = sSamusOam_2d63ac_Frame0,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d640c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d640c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d640c_Frame0,
        .pOam = sSamusOam_2d640c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d642c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d642c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d642c_Frame0,
        .pOam = sSamusOam_2d642c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d640c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d640c_Frame0,
        .pOam = sSamusOam_2d640c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d645c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d645c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d640c_Frame0,
        .pOam = sSamusOam_2d645c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d647c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d647c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d642c_Frame0,
        .pOam = sSamusOam_2d647c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d645c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d640c_Frame0,
        .pOam = sSamusOam_2d645c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d64ac[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d64ac_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d640c_Frame0,
        .pOam = sSamusOam_2d64ac_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d64cc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d64cc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d642c_Frame0,
        .pOam = sSamusOam_2d64cc_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d64ac_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d640c_Frame0,
        .pOam = sSamusOam_2d64ac_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d64fc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d64fc_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d64fc_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d64fc_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d64fc_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d652c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d652c_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d652c_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d652c_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d652c_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d655c[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame0,
        .pOam = sSamusOam_2d655c_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d655c_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame2,
        .pOam = sSamusOam_2d655c_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d655c_Frame3,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d655c_Frame1,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame5,
        .pOam = sSamusOam_2d655c_Frame5,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d655c_Frame1,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d65dc[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame0,
        .pOam = sSamusOam_2d655c_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d65dc_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d65dc_Frame1,
        .pOam = sSamusOam_2d65dc_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d65dc_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d65dc_Frame2,
        .pOam = sSamusOam_2d65dc_Frame2,
        .timer = 3
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d661c[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d661c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d661c_Frame0,
        .pOam = sSamusOam_2d661c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d661c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d661c_Frame1,
        .pOam = sSamusOam_2d661c_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d661c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d661c_Frame2,
        .pOam = sSamusOam_2d661c_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d661c_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d661c_Frame3,
        .pOam = sSamusOam_2d661c_Frame3,
        .timer = 2
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d666c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d666c_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d666c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d668c[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame0,
        .pOam = sSamusOam_2d668c_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d668c_Frame1,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame2,
        .pOam = sSamusOam_2d668c_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d668c_Frame3,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d668c_Frame1,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame5,
        .pOam = sSamusOam_2d668c_Frame5,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d668c_Frame1,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d670c[4] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame0,
        .pOam = sSamusOam_2d668c_Frame0,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d670c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d65dc_Frame1,
        .pOam = sSamusOam_2d670c_Frame1,
        .timer = 3
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d670c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d65dc_Frame2,
        .pOam = sSamusOam_2d670c_Frame2,
        .timer = 3
    },
    [3] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d674c[5] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d674c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d661c_Frame0,
        .pOam = sSamusOam_2d674c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d674c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d661c_Frame1,
        .pOam = sSamusOam_2d674c_Frame1,
        .timer = 6
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d674c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d674c_Frame2,
        .pOam = sSamusOam_2d674c_Frame2,
        .timer = 2
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d674c_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d661c_Frame3,
        .pOam = sSamusOam_2d674c_Frame3,
        .timer = 2
    },
    [4] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d679c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d679c_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d679c_Frame0,
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

const struct SamusAnimationData sSamusAnim_2d680c[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame0,
        .pOam = sSamusOam_2d680c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame1,
        .pOam = sSamusOam_2d680c_Frame1,
        .timer = 5
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame2,
        .pOam = sSamusOam_2d680c_Frame2,
        .timer = 4
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame3,
        .pOam = sSamusOam_2d680c_Frame3,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame4,
        .pOam = sSamusOam_2d680c_Frame4,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame5,
        .pOam = sSamusOam_2d680c_Frame5,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame6,
        .pOam = sSamusOam_2d680c_Frame6,
        .timer = 5
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame7,
        .pOam = sSamusOam_2d680c_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2d680c_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame8,
        .pOam = sSamusOam_2d680c_Frame8,
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

const struct SamusAnimationData sSamusAnim_2d68bc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d68bc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d68bc_Frame0,
        .pOam = sSamusOam_2d68bc_Frame0,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d68bc_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d68bc_Frame0,
        .pOam = sSamusOam_2d68bc_Frame1,
        .timer = 2
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d68ec[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d68bc_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d68bc_Frame0,
        .pOam = sSamusOam_2d68bc_Frame1,
        .timer = 2
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d68bc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d68bc_Frame0,
        .pOam = sSamusOam_2d68bc_Frame0,
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

const struct SamusAnimationData sSamusAnim_2d696c[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame4,
        .pOam = sSamusOam_2d696c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame5,
        .pOam = sSamusOam_2d696c_Frame1,
        .timer = 4
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame2,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame6,
        .pOam = sSamusOam_2d696c_Frame2,
        .timer = 5
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame7,
        .pOam = sSamusOam_2d696c_Frame3,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame8,
        .pOam = sSamusOam_2d696c_Frame4,
        .timer = 4
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame0,
        .pOam = sSamusOam_2d696c_Frame5,
        .timer = 4
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame6,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame1,
        .pOam = sSamusOam_2d696c_Frame6,
        .timer = 5
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame2,
        .pOam = sSamusOam_2d696c_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2d696c_Frame8,
        .pBottomGfx = sSamusGfx_Bottom_2d680c_Frame3,
        .pOam = sSamusOam_2d696c_Frame8,
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

const struct SamusAnimationData sSamusAnim_2d6a1c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6a1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a1c_Frame0,
        .pOam = sSamusOam_2d6a1c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6a3c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6a3c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a3c_Frame0,
        .pOam = sSamusOam_2d6a3c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6a1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a1c_Frame0,
        .pOam = sSamusOam_2d6a1c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6a6c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6a6c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a6c_Frame0,
        .pOam = sSamusOam_2d6a6c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6a8c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6a8c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a8c_Frame0,
        .pOam = sSamusOam_2d6a8c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6a6c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a6c_Frame0,
        .pOam = sSamusOam_2d6a6c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6abc[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6abc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6abc_Frame0,
        .pOam = sSamusOam_2d6abc_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6adc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6adc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6adc_Frame0,
        .pOam = sSamusOam_2d6adc_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6abc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6abc_Frame0,
        .pOam = sSamusOam_2d6abc_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6b0c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6b0c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a1c_Frame0,
        .pOam = sSamusOam_2d6b0c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6b2c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6b2c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a3c_Frame0,
        .pOam = sSamusOam_2d6b2c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6b0c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a1c_Frame0,
        .pOam = sSamusOam_2d6b0c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6b5c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6b5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a6c_Frame0,
        .pOam = sSamusOam_2d6b5c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6b7c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6b7c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a8c_Frame0,
        .pOam = sSamusOam_2d6b7c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6b5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6a6c_Frame0,
        .pOam = sSamusOam_2d6b5c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6bac[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6bac_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6abc_Frame0,
        .pOam = sSamusOam_2d6bac_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6bcc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6bcc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6adc_Frame0,
        .pOam = sSamusOam_2d6bcc_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6bac_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6abc_Frame0,
        .pOam = sSamusOam_2d6bac_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6bfc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d65dc_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d65dc_Frame1,
        .pOam = sSamusOam_2d65dc_Frame1,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d655c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame0,
        .pOam = sSamusOam_2d655c_Frame0,
        .timer = 3
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6c2c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d670c_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2d65dc_Frame1,
        .pOam = sSamusOam_2d670c_Frame1,
        .timer = 3
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d668c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame0,
        .pOam = sSamusOam_2d668c_Frame0,
        .timer = 3
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6c5c[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d6c5c_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d6c5c_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d6c5c_Frame0,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d6c5c_Frame0,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d6c5c_Frame4,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame5,
        .pOam = sSamusOam_2d6c5c_Frame5,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d6c5c_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d6c5c_Frame4,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6cdc[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame3,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame5,
        .pOam = sSamusOam_2d6cdc_Frame5,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d6cdc_Frame4,
        .pBottomGfx = sSamusGfx_Bottom_2d655c_Frame1,
        .pOam = sSamusOam_2d6cdc_Frame0,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6d5c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6d5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6d5c_Frame0,
        .pOam = sSamusOam_2d6d5c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6d7c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6d7c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6d7c_Frame0,
        .pOam = sSamusOam_2d6d5c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6d5c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6d5c_Frame0,
        .pOam = sSamusOam_2d6d5c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6dac[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6dac_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6dac_Frame0,
        .pOam = sSamusOam_2d6dac_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6dcc[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6dcc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6dcc_Frame0,
        .pOam = sSamusOam_2d6dac_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6dac_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6dac_Frame0,
        .pOam = sSamusOam_2d6dac_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6dfc[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6dfc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6dfc_Frame0,
        .pOam = sSamusOam_2d6dfc_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6e1c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6e1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e1c_Frame0,
        .pOam = sSamusOam_2d6e1c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6dfc_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6dfc_Frame0,
        .pOam = sSamusOam_2d6dfc_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6e4c[2] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6e4c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e4c_Frame0,
        .pOam = sSamusOam_2d6e4c_Frame0,
        .timer = 4
    },
    [1] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6e6c[3] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6e6c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e6c_Frame0,
        .pOam = sSamusOam_2d6e6c_Frame0,
        .timer = 4
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6e4c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e4c_Frame0,
        .pOam = sSamusOam_2d6e4c_Frame0,
        .timer = 4
    },
    [2] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6e9c[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6e9c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e9c_Frame0,
        .pOam = sSamusOam_2d6e9c_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6e9c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e9c_Frame0,
        .pOam = sSamusOam_2d6e9c_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d6e9c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e9c_Frame0,
        .pOam = sSamusOam_2d6e9c_Frame0,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d6e9c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e9c_Frame0,
        .pOam = sSamusOam_2d6e9c_Frame0,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d6e9c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e9c_Frame0,
        .pOam = sSamusOam_2d6e9c_Frame0,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d6e9c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e9c_Frame0,
        .pOam = sSamusOam_2d6e9c_Frame0,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d6e9c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6e9c_Frame0,
        .pOam = sSamusOam_2d6e9c_Frame0,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d6f1c[8] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d6f1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6f1c_Frame0,
        .pOam = sSamusOam_2d6f1c_Frame0,
        .timer = 16
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d6f1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6f1c_Frame0,
        .pOam = sSamusOam_2d6f1c_Frame0,
        .timer = 16
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d6f1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6f1c_Frame0,
        .pOam = sSamusOam_2d6f1c_Frame0,
        .timer = 16
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d6f1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6f1c_Frame0,
        .pOam = sSamusOam_2d6f1c_Frame0,
        .timer = 16
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d6f1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6f1c_Frame0,
        .pOam = sSamusOam_2d6f1c_Frame0,
        .timer = 16
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d6f1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6f1c_Frame0,
        .pOam = sSamusOam_2d6f1c_Frame0,
        .timer = 16
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d6f1c_Frame0,
        .pBottomGfx = sSamusGfx_Bottom_2d6f1c_Frame0,
        .pOam = sSamusOam_2d6f1c_Frame0,
        .timer = 16
    },
    [7] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_2d7fe4_Frame0[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d7fe4_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d7fe4_Frame1[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d7fe4_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d7fe4_Frame2[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d7fe4_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d7fe4_Frame3[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d7fe4_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d8104_Frame8[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d8104_Frame8.gfx")
};

static const u8 sSamusGfx_Top_2d8104_Frame5[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d8104_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d8104_Frame6[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d8104_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2d8104_Frame7[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d8104_Frame7.gfx")
};

static const u16 sSamusOam_2d7fe4_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_2d7fe4_Frame4[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_2d8074_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_2d8074_Frame4[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_Y_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

const struct SamusAnimationData sSamusAnim_2d7fe4[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d8074[9] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [8] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d8104[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame0,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d7fe4_Frame4,
        .timer = 1
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d8214[17] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d7fe4_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame0,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_2d8104_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d8074_Frame4,
        .timer = 1
    },
    [16] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_2d90a8_Frame0[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d90a8_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2d90a8_Frame1[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d90a8_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d90a8_Frame2[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d90a8_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d90a8_Frame4[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d90a8_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2d90a8_Frame5[] = {
    8, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d90a8_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d90a8_Frame6[] = {
    9, 8,
    _INCBIN_U8("data/samus/gfx/Top_2d90a8_Frame6.gfx")
};

static const u8 sSamusGfx_Top_2d90a8_Frame7[] = {
    4, 0,
    _INCBIN_U8("data/samus/gfx/Top_2d90a8_Frame7.gfx")
};

static const u8 sSamusGfx_Top_2d90a8_Frame8[] = {
    2, 0,
    _INCBIN_U8("data/samus/gfx/Top_2d90a8_Frame8.gfx")
};

static const u16 sSamusOam_2d90a8_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_2d90a8_Frame6[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x4,
    0xd8, 0x1f8, 0x8
};

static const u16 sSamusOam_2d90a8_Frame7[] = {
    4,
    0xde, OBJ_X_FLIP | 0x1eb, 0x0,
    0xde, OBJ_Y_FLIP | 0x2, 0x1,
    0xf7, 0x1ee, 0x2,
    0xcf, 0xa, 0x3
};

static const u16 sSamusOam_2d90a8_Frame8[] = {
    2,
    0xde, OBJ_X_FLIP | OBJ_Y_FLIP | 0x4, 0x0,
    0xe6, 0x1e6, 0x1
};

static const u16 sSamusOam_2d9158_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4
};

static const u16 sSamusOam_2d9158_Frame6[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x0,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, 0x4,
    0xd8, OBJ_X_FLIP | 0x0, 0x8
};

static const u16 sSamusOam_2d9158_Frame7[] = {
    4,
    0xde, 0xd, 0x0,
    0xde, OBJ_X_FLIP | OBJ_Y_FLIP | 0x1f6, 0x1,
    0xf7, OBJ_X_FLIP | 0xa, 0x2,
    0xcf, OBJ_X_FLIP | 0x1ee, 0x3
};

static const u16 sSamusOam_2d9158_Frame8[] = {
    2,
    0xde, OBJ_Y_FLIP | 0x1f4, 0x0,
    0xe6, OBJ_X_FLIP | 0x12, 0x1
};

const struct SamusAnimationData sSamusAnim_2d90a8[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame0,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame4,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame0,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame0,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d90a8_Frame8,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 4
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

const struct SamusAnimationData sSamusAnim_2d9158[11] = {
    [0] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame0,
        .timer = 2
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame0,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame0,
        .timer = 4
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame4,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame0,
        .timer = 2
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame0,
        .timer = 2
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame6,
        .timer = 3
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame7,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame7,
        .timer = 4
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9158_Frame8,
        .timer = 4
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2d90a8_Frame8,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 4
    },
    [10] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_2d9c04_Frame1[] = {
    5, 3,
    _INCBIN_U8("data/samus/gfx/Top_2d9c04_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2d9c04_Frame3[] = {
    5, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d9c04_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2d9c04_Frame5[] = {
    8, 5,
    _INCBIN_U8("data/samus/gfx/Top_2d9c04_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2d9c04_Frame2[] = {
    8, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d9c04_Frame2.gfx")
};

static const u8 sSamusGfx_Top_2d9c04_Frame4[] = {
    8, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d9c04_Frame4.gfx")
};

static const u8 sSamusGfx_Top_2d9c04_Frame6[] = {
    9, 6,
    _INCBIN_U8("data/samus/gfx/Top_2d9c04_Frame6.gfx")
};

static const u16 sSamusOam_2d9c04_Frame1[] = {
    3,
    0xda, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xda, 0x4, 0x2,
    OBJ_SHAPE_HORIZONTAL | 0xea, 0x1f4, 0x3
};

static const u16 sSamusOam_2d9c04_Frame3[] = {
    3,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, 0x0,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x5, 0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, 0x2
};

static const u16 sSamusOam_2d9c04_Frame5[] = {
    5,
    0xd9, OBJ_SIZE_16x16 | 0x1f3, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x3, 0x4,
    0xe9, OBJ_SIZE_16x16 | 0x1fb, 0x2,
    0xe9, 0x1f3, 0x7,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1fb, 0x5
};

static const u16 sSamusOam_2d9c04_Frame2[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f7, 0x6
};

static const u16 sSamusOam_2d9c04_Frame4[] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x4,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, 0x5,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fa, 0x6
};

static const u16 sSamusOam_2d9c04_Frame6[] = {
    6,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, 0x0,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, 0x4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, 0x6,
    0xf8, 0x4, 0x8,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, 0x2,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, 0x5
};

const struct SamusAnimationData sSamusAnim_2d9c04[29] = {
    [0] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_Empty,
        .timer = 10
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame1,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame1,
        .timer = 7
    },
    [2] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame2,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame3,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame3,
        .timer = 7
    },
    [4] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame4,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame4,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame5,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame5,
        .timer = 7
    },
    [6] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame2,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame2,
        .timer = 7
    },
    [8] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame4,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame4,
        .timer = 7
    },
    [10] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [16] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [17] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [18] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [19] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [20] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [21] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [22] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [23] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [24] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [25] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 1
    },
    [26] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 4
    },
    [27] = {
        .pTopGfx = sSamusGfx_Top_2d9c04_Frame6,
        .pBottomGfx = sSamusGfx_Empty,
        .pOam = sSamusOam_2d9c04_Frame6,
        .timer = 180
    },
    [28] = SAMUS_ANIM_TERMINATOR
};

static const u8 sSamusGfx_Top_2de520_Frame32[] = {
    19, 1,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame32.gfx")
};

static const u8 sSamusGfx_Bottom_2de520_Frame0[] = {
    10, 8,
    _INCBIN_U8("data/samus/gfx/Bottom_2de520_Frame0.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame34[] = {
    17, 2,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame34.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame36[] = {
    16, 3,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame36.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame38[] = {
    16, 3,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame38.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame33[] = {
    20, 16,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame33.gfx")
};

static const u8 sSamusGfx_Bottom_2de520_Frame9[] = {
    12, 8,
    _INCBIN_U8("data/samus/gfx/Bottom_2de520_Frame9.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame35[] = {
    20, 15,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame35.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame37[] = {
    20, 15,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame37.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame39[] = {
    20, 15,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame39.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame1[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame1.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame3[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame3.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame5[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame5.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame7[] = {
    4, 4,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame7.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame9[] = {
    13, 5,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame9.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame11[] = {
    11, 5,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame11.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame13[] = {
    11, 5,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame13.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame15[] = {
    12, 6,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame15.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame17[] = {
    17, 9,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame17.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame19[] = {
    15, 9,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame19.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame21[] = {
    15, 9,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame21.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame23[] = {
    16, 10,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame23.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame16[] = {
    10, 0,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame16.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame18[] = {
    10, 1,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame18.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame20[] = {
    9, 2,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame20.gfx")
};

static const u8 sSamusGfx_Top_2de520_Frame22[] = {
    8, 1,
    _INCBIN_U8("data/samus/gfx/Top_2de520_Frame22.gfx")
};

static const u16 sSamusOam_2de520_Frame32[] = {
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

static const u16 sSamusOam_2de520_Frame34[] = {
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

static const u16 sSamusOam_2de520_Frame36[] = {
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

static const u16 sSamusOam_2de520_Frame38[] = {
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

static const u16 sSamusOam_2de520_Frame33[] = {
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

static const u16 sSamusOam_2de520_Frame35[] = {
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

static const u16 sSamusOam_2de520_Frame37[] = {
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

static const u16 sSamusOam_2de520_Frame39[] = {
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

static const u16 sSamusOam_2de520_Frame1[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, 0x0
};

static const u16 sSamusOam_2de520_Frame9[] = {
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

static const u16 sSamusOam_2de520_Frame11[] = {
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

static const u16 sSamusOam_2de520_Frame13[] = {
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

static const u16 sSamusOam_2de520_Frame15[] = {
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

static const u16 sSamusOam_2de520_Frame17[] = {
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

static const u16 sSamusOam_2de520_Frame19[] = {
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

static const u16 sSamusOam_2de520_Frame21[] = {
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

static const u16 sSamusOam_2de520_Frame23[] = {
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

static const u16 sSamusOam_2de520_Frame16[] = {
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

static const u16 sSamusOam_2de520_Frame18[] = {
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

static const u16 sSamusOam_2de520_Frame20[] = {
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

static const u16 sSamusOam_2de520_Frame22[] = {
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

static const u16 sSamusOam_2de520_Frame0[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f0, 0x14,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f0, 0x18,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, 0x1c
};

const struct SamusAnimationData sSamusAnim_2de520[73] = {
    [0] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [1] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame1,
        .timer = 1
    },
    [2] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [3] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame1,
        .timer = 1
    },
    [4] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [5] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame1,
        .timer = 1
    },
    [6] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [7] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame1,
        .timer = 1
    },
    [8] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [9] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame9,
        .timer = 1
    },
    [10] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [11] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame11,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame11,
        .timer = 1
    },
    [12] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [13] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame13,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame13,
        .timer = 1
    },
    [14] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [15] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame15,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame15,
        .timer = 1
    },
    [16] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame16,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame16,
        .timer = 1
    },
    [17] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame17,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame17,
        .timer = 1
    },
    [18] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame18,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame18,
        .timer = 1
    },
    [19] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame19,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame19,
        .timer = 1
    },
    [20] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame20,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame20,
        .timer = 1
    },
    [21] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame21,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame21,
        .timer = 1
    },
    [22] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame22,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame22,
        .timer = 1
    },
    [23] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame23,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame23,
        .timer = 1
    },
    [24] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame16,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame16,
        .timer = 1
    },
    [25] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame17,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame17,
        .timer = 1
    },
    [26] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame18,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame18,
        .timer = 1
    },
    [27] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame19,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame19,
        .timer = 1
    },
    [28] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame20,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame20,
        .timer = 1
    },
    [29] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame21,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame21,
        .timer = 1
    },
    [30] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame22,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame22,
        .timer = 1
    },
    [31] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame23,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame23,
        .timer = 1
    },
    [32] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame32,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame32,
        .timer = 1
    },
    [33] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame33,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame33,
        .timer = 1
    },
    [34] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame34,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame34,
        .timer = 1
    },
    [35] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame35,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame35,
        .timer = 1
    },
    [36] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame36,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame36,
        .timer = 1
    },
    [37] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame37,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame37,
        .timer = 1
    },
    [38] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame38,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame38,
        .timer = 1
    },
    [39] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame39,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame39,
        .timer = 1
    },
    [40] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame16,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame16,
        .timer = 1
    },
    [41] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame17,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame17,
        .timer = 1
    },
    [42] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame18,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame18,
        .timer = 1
    },
    [43] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame19,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame19,
        .timer = 1
    },
    [44] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame20,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame20,
        .timer = 1
    },
    [45] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame21,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame21,
        .timer = 1
    },
    [46] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame22,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame22,
        .timer = 1
    },
    [47] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame23,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame23,
        .timer = 1
    },
    [48] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame16,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame16,
        .timer = 1
    },
    [49] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame17,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame17,
        .timer = 1
    },
    [50] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame18,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame18,
        .timer = 1
    },
    [51] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame19,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame19,
        .timer = 1
    },
    [52] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame20,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame20,
        .timer = 1
    },
    [53] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame21,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame21,
        .timer = 1
    },
    [54] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame22,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame22,
        .timer = 1
    },
    [55] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame23,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame23,
        .timer = 1
    },
    [56] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [57] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame9,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame9,
        .timer = 1
    },
    [58] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [59] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame11,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame11,
        .timer = 1
    },
    [60] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [61] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame13,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame13,
        .timer = 1
    },
    [62] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [63] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame15,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame9,
        .pOam = sSamusOam_2de520_Frame15,
        .timer = 1
    },
    [64] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [65] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame1,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame1,
        .timer = 1
    },
    [66] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [67] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame3,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame1,
        .timer = 1
    },
    [68] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [69] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame5,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame1,
        .timer = 1
    },
    [70] = {
        .pTopGfx = sSamusGfx_Empty,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame0,
        .timer = 1
    },
    [71] = {
        .pTopGfx = sSamusGfx_Top_2de520_Frame7,
        .pBottomGfx = sSamusGfx_Bottom_2de520_Frame0,
        .pOam = sSamusOam_2de520_Frame1,
        .timer = 1
    },
    [72] = SAMUS_ANIM_TERMINATOR
};

static const u8 sBlob_2de9b0_2e4904[] = INCBIN_U8("data/Blob_2de9b0_2e4904.bin");
