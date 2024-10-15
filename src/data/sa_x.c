#include "macros.h"

#include "data/sprites/sa_x.h"
#include "structs/sa_x.h"

#define SA_X_GFX_SIZE(top, bottom) (2+(top+bottom)*32)

#define SA_X_ANIM_TERMINATOR \
{\
    .pGraphics = NULL,\
    .pOamFrame = NULL,\
    .timer = 0,\
}

static const u8 sSaXGfx_28ff60[SA_X_GFX_SIZE(6, 4)] = {
    6, 4,
    _INCBIN_U8("data/sa_x/28ff60.gfx")
};

static const u8 sSaXGfx_2900a2[SA_X_GFX_SIZE(7, 5)] = {
    7, 5,
    _INCBIN_U8("data/sa_x/2900a2.gfx")
};

static const u8 sSaXGfx_290224[SA_X_GFX_SIZE(8, 5)] = {
    8, 5,
    _INCBIN_U8("data/sa_x/290224.gfx")
};

static const u8 sSaXGfx_2903c6[SA_X_GFX_SIZE(9, 7)] = {
    9, 7,
    _INCBIN_U8("data/sa_x/2903c6.gfx")
};

static const u8 sSaXGfx_2905c8[SA_X_GFX_SIZE(7, 5)] = {
    7, 5,
    _INCBIN_U8("data/sa_x/2905c8.gfx")
};

static const u8 sSaXGfx_29074a[SA_X_GFX_SIZE(7, 4)] = {
    7, 4,
    _INCBIN_U8("data/sa_x/29074a.gfx")
};

static const u8 sSaXGfx_2908ac[SA_X_GFX_SIZE(8, 5)] = {
    8, 5,
    _INCBIN_U8("data/sa_x/2908ac.gfx")
};

static const u8 sSaXGfx_290a4e[SA_X_GFX_SIZE(9, 7)] = {
    9, 7,
    _INCBIN_U8("data/sa_x/290a4e.gfx")
};

static const u8 sSaXGfx_290c50[SA_X_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/sa_x/290c50.gfx")
};

static const u8 sSaXGfx_290e32[SA_X_GFX_SIZE(7, 5)] = {
    7, 5,
    _INCBIN_U8("data/sa_x/290e32.gfx")
};

static const u8 sSaXGfx_290fb4[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/290fb4.gfx")
};

static const u8 sSaXGfx_291136[SA_X_GFX_SIZE(8, 5)] = {
    8, 5,
    _INCBIN_U8("data/sa_x/291136.gfx")
};

static const u8 sSaXGfx_2912d8[SA_X_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/sa_x/2912d8.gfx")
};

static const u8 sSaXGfx_2914ba[SA_X_GFX_SIZE(11, 7)] = {
    11, 7,
    _INCBIN_U8("data/sa_x/2914ba.gfx")
};

static const u8 sSaXGfx_2916fc[SA_X_GFX_SIZE(8, 5)] = {
    8, 5,
    _INCBIN_U8("data/sa_x/2916fc.gfx")
};

static const u8 sSaXGfx_29189e[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/29189e.gfx")
};

static const u8 sSaXGfx_291a20[SA_X_GFX_SIZE(10, 5)] = {
    10, 5,
    _INCBIN_U8("data/sa_x/291a20.gfx")
};

static const u8 sSaXGfx_291c02[SA_X_GFX_SIZE(11, 9)] = {
    11, 9,
    _INCBIN_U8("data/sa_x/291c02.gfx")
};

static const u8 sSaXGfx_291e84[SA_X_GFX_SIZE(11, 8)] = {
    11, 8,
    _INCBIN_U8("data/sa_x/291e84.gfx")
};

static const u8 sSaXGfx_2920e6[SA_X_GFX_SIZE(10, 7)] = {
    10, 7,
    _INCBIN_U8("data/sa_x/2920e6.gfx")
};

static const u8 sSaXGfx_292308[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/292308.gfx")
};

static const u8 sSaXGfx_29248a[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/29248a.gfx")
};

static const u8 sSaXGfx_29260c[SA_X_GFX_SIZE(9, 5)] = {
    9, 5,
    _INCBIN_U8("data/sa_x/29260c.gfx")
};

static const u8 sSaXGfx_2927ce[SA_X_GFX_SIZE(10, 5)] = {
    10, 5,
    _INCBIN_U8("data/sa_x/2927ce.gfx")
};

static const u8 sSaXGfx_2929b0[SA_X_GFX_SIZE(9, 5)] = {
    9, 5,
    _INCBIN_U8("data/sa_x/2929b0.gfx")
};

static const u8 sSaXGfx_292b72[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/292b72.gfx")
};

static const u8 sSaXGfx_292cf4[SA_X_GFX_SIZE(9, 4)] = {
    9, 4,
    _INCBIN_U8("data/sa_x/292cf4.gfx")
};

static const u8 sSaXGfx_292e96[SA_X_GFX_SIZE(9, 5)] = {
    9, 5,
    _INCBIN_U8("data/sa_x/292e96.gfx")
};

static const u8 sSaXGfx_293058[SA_X_GFX_SIZE(9, 4)] = {
    9, 4,
    _INCBIN_U8("data/sa_x/293058.gfx")
};

static const u8 sSaXGfx_2931fa[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/2931fa.gfx")
};

static const u8 sSaXGfx_29337c[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/29337c.gfx")
};

static const u8 sSaXGfx_2934fe[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/2934fe.gfx")
};

static const u8 sSaXGfx_293680[SA_X_GFX_SIZE(9, 5)] = {
    9, 5,
    _INCBIN_U8("data/sa_x/293680.gfx")
};

static const u8 sSaXGfx_293842[SA_X_GFX_SIZE(10, 5)] = {
    10, 5,
    _INCBIN_U8("data/sa_x/293842.gfx")
};

static const u8 sSaXGfx_293a24[SA_X_GFX_SIZE(9, 5)] = {
    9, 5,
    _INCBIN_U8("data/sa_x/293a24.gfx")
};

static const u8 sSaXGfx_293be6[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/293be6.gfx")
};

static const u8 sSaXGfx_293d68[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/293d68.gfx")
};

static const u8 sSaXGfx_293f6a[SA_X_GFX_SIZE(11, 7)] = {
    11, 7,
    _INCBIN_U8("data/sa_x/293f6a.gfx")
};

static const u8 sSaXGfx_2941ac[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/2941ac.gfx")
};

static const u8 sSaXGfx_2943ce[SA_X_GFX_SIZE(8, 4)] = {
    8, 4,
    _INCBIN_U8("data/sa_x/2943ce.gfx")
};

static const u8 sSaXGfx_294550[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/294550.gfx")
};

static const u8 sSaXGfx_2947f2[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/2947f2.gfx")
};

static const u8 sSaXGfx_294a94[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/294a94.gfx")
};

static const u8 sSaXGfx_294d36[SA_X_GFX_SIZE(13, 7)] = {
    13, 7,
    _INCBIN_U8("data/sa_x/294d36.gfx")
};

static const u8 sSaXGfx_294fb8[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/294fb8.gfx")
};

static const u8 sSaXGfx_29525a[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/29525a.gfx")
};

static const u8 sSaXGfx_2954fc[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/2954fc.gfx")
};

static const u8 sSaXGfx_29579e[SA_X_GFX_SIZE(13, 7)] = {
    13, 7,
    _INCBIN_U8("data/sa_x/29579e.gfx")
};

static const u8 sSaXGfx_295a20[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/295a20.gfx")
};

static const u8 sSaXGfx_295c42[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/295c42.gfx")
};

static const u8 sSaXGfx_295e64[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/295e64.gfx")
};

static const u8 sSaXGfx_296086[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/296086.gfx")
};

static const u8 sSaXGfx_296288[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/296288.gfx")
};

static const u8 sSaXGfx_29648a[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/29648a.gfx")
};

static const u8 sSaXGfx_29668c[SA_X_GFX_SIZE(12, 6)] = {
    12, 6,
    _INCBIN_U8("data/sa_x/29668c.gfx")
};

static const u8 sSaXGfx_2968ce[SA_X_GFX_SIZE(12, 6)] = {
    12, 6,
    _INCBIN_U8("data/sa_x/2968ce.gfx")
};

static const u8 sSaXGfx_296b10[SA_X_GFX_SIZE(12, 6)] = {
    12, 6,
    _INCBIN_U8("data/sa_x/296b10.gfx")
};

static const u8 sSaXGfx_296d52[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/296d52.gfx")
};

static const u8 sSaXGfx_296f54[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/296f54.gfx")
};

static const u8 sSaXGfx_297156[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/297156.gfx")
};

static const u8 sSaXGfx_297358[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/297358.gfx")
};

static const u8 sSaXGfx_29755a[SA_X_GFX_SIZE(13, 7)] = {
    13, 7,
    _INCBIN_U8("data/sa_x/29755a.gfx")
};

static const u8 sSaXGfx_2977dc[SA_X_GFX_SIZE(12, 7)] = {
    12, 7,
    _INCBIN_U8("data/sa_x/2977dc.gfx")
};

static const u8 sSaXGfx_297a3e[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/297a3e.gfx")
};

static const u8 sSaXGfx_297ce0[SA_X_GFX_SIZE(15, 7)] = {
    15, 7,
    _INCBIN_U8("data/sa_x/297ce0.gfx")
};

static const u8 sSaXGfx_297fa2[SA_X_GFX_SIZE(15, 7)] = {
    15, 7,
    _INCBIN_U8("data/sa_x/297fa2.gfx")
};

static const u8 sSaXGfx_298264[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/298264.gfx")
};

static const u8 sSaXGfx_298486[SA_X_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/sa_x/298486.gfx")
};

static const u8 sSaXGfx_298588[SA_X_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/sa_x/298588.gfx")
};

static const u8 sSaXGfx_29868a[SA_X_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/sa_x/29868a.gfx")
};

static const u8 sSaXGfx_29870c[SA_X_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/sa_x/29870c.gfx")
};

static const u8 sSaXGfx_29878e[SA_X_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/sa_x/29878e.gfx")
};

static const u8 sSaXGfx_298810[SA_X_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/sa_x/298810.gfx")
};

static const u8 sSaXGfx_298892[SA_X_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/sa_x/298892.gfx")
};

static const u8 sSaXGfx_298914[SA_X_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/sa_x/298914.gfx")
};

static const u8 sSaXGfx_298996[SA_X_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/sa_x/298996.gfx")
};

static const u8 sSaXGfx_298a18[SA_X_GFX_SIZE(2, 2)] = {
    2, 2,
    _INCBIN_U8("data/sa_x/298a18.gfx")
};

static const u8 sSaXGfx_298a9a[SA_X_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/sa_x/298a9a.gfx")
};

static const u8 sSaXGfx_298b9c[SA_X_GFX_SIZE(5, 3)] = {
    5, 3,
    _INCBIN_U8("data/sa_x/298b9c.gfx")
};

static const u8 sSaXGfx_298c9e[SA_X_GFX_SIZE(15, 7)] = {
    15, 7,
    _INCBIN_U8("data/sa_x/298c9e.gfx")
};

static const u8 sSaXGfx_298f60[SA_X_GFX_SIZE(15, 7)] = {
    15, 7,
    _INCBIN_U8("data/sa_x/298f60.gfx")
};

static const u8 sSaXGfx_299222[SA_X_GFX_SIZE(15, 7)] = {
    15, 7,
    _INCBIN_U8("data/sa_x/299222.gfx")
};

static const u8 sSaXGfx_2994e4[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/2994e4.gfx")
};

static const u8 sSaXGfx_299786[SA_X_GFX_SIZE(15, 7)] = {
    15, 7,
    _INCBIN_U8("data/sa_x/299786.gfx")
};

static const u8 sSaXGfx_299a48[SA_X_GFX_SIZE(15, 7)] = {
    15, 7,
    _INCBIN_U8("data/sa_x/299a48.gfx")
};

static const u8 sSaXGfx_299d0a[SA_X_GFX_SIZE(15, 7)] = {
    15, 7,
    _INCBIN_U8("data/sa_x/299d0a.gfx")
};

static const u8 sSaXGfx_299fcc[SA_X_GFX_SIZE(14, 7)] = {
    14, 7,
    _INCBIN_U8("data/sa_x/299fcc.gfx")
};

static const u16 sSaXOam_29a26e[OAM_DATA_SIZE(3)] = {
    3,
    0xd8, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fb, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_29a282[OAM_DATA_SIZE(4)] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x205
};

static const u16 sSaXOam_29a29c[OAM_DATA_SIZE(5)] = {
    5,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x205,
    0xe0, 0x1f0, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_29a2bc[OAM_DATA_SIZE(4)] = {
    4,
    0xe0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29a2d6[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f1, OBJ_PALETTE_8 | 0x205,
    0xd8, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x9, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_29a2f0[OAM_DATA_SIZE(4)] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fc, OBJ_PALETTE_8 | 0x204,
    0xe8, 0x1f4, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a30a[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f9, OBJ_PALETTE_8 | 0x205,
    0xe0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x9, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x202,
    0xf0, 0x1f9, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_29a32a[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xdf, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xd7, 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xef, 0x8, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a344[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f9, OBJ_PALETTE_8 | 0x206,
    0xe0, 0x1f1, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_29a35e[OAM_DATA_SIZE(4)] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0xa, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f2, OBJ_PALETTE_8 | 0x205
};

static const u16 sSaXOam_29a378[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1fc, OBJ_PALETTE_8 | 0x204,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a392[OAM_DATA_SIZE(5)] = {
    5,
    0xe3, 0x2, OBJ_PALETTE_8 | 0x207,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x0, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x205
};

static const u16 sSaXOam_29a3b2[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x4, OBJ_PALETTE_8 | 0x204,
    0xe0, 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1f0, OBJ_PALETTE_8 | 0x205,
    0xf8, 0x0, OBJ_PALETTE_8 | 0x207,
    0xe0, 0x8, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_29a3de[OAM_DATA_SIZE(6)] = {
    6,
    0xe2, 0x6, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe0, 0x1f7, OBJ_PALETTE_8 | 0x20a,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_29a404[OAM_DATA_SIZE(5)] = {
    5,
    0xe5, 0x1, OBJ_PALETTE_8 | 0x207,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ff, OBJ_PALETTE_8 | 0x205,
    0xe8, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1ff, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_29a424[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xe7, 0x1fd, OBJ_PALETTE_8 | 0x204,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a43e[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1f6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f7, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x1ff, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x202,
    0xf0, 0x1ff, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_29a464[OAM_DATA_SIZE(5)] = {
    5,
    0xe3, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x0, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_29a484[OAM_DATA_SIZE(5)] = {
    5,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f7, OBJ_PALETTE_8 | 0x208,
    0xe0, 0x7, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_29a4a4[OAM_DATA_SIZE(6)] = {
    6,
    0xe6, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    0xe6, 0x2, OBJ_PALETTE_8 | 0x209,
    0xd8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1ee, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fe, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_29a4ca[OAM_DATA_SIZE(4)] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f7, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a4e4[OAM_DATA_SIZE(4)] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a4fe[OAM_DATA_SIZE(5)] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f5, OBJ_PALETTE_8 | 0x205,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_29a51e[OAM_DATA_SIZE(6)] = {
    6,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f6, OBJ_PALETTE_8 | 0x205,
    0xe3, 0x6, OBJ_PALETTE_8 | 0x209,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_29a544[OAM_DATA_SIZE(5)] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f5, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x5, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_29a564[OAM_DATA_SIZE(4)] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f5, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a57e[OAM_DATA_SIZE(5)] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f6, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x6, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_29a59e[OAM_DATA_SIZE(5)] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f6, OBJ_PALETTE_8 | 0x205,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_29a5be[OAM_DATA_SIZE(4)] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f6, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a5d8[OAM_DATA_SIZE(4)] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a5f2[OAM_DATA_SIZE(4)] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a60c[OAM_DATA_SIZE(5)] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1fa, OBJ_PALETTE_8 | 0x205,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_29a62c[OAM_DATA_SIZE(6)] = {
    6,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1fa, OBJ_PALETTE_8 | 0x205,
    0xe3, 0x1f2, OBJ_PALETTE_8 | 0x209,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_29a652[OAM_DATA_SIZE(5)] = {
    5,
    0xdb, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1fb, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x1f3, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_29a672[OAM_DATA_SIZE(4)] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1fb, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a68c[OAM_DATA_SIZE(6)] = {
    6,
    0xe6, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    0xeb, 0x2, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x206,
    0xf8, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_29a6b2[OAM_DATA_SIZE(6)] = {
    6,
    0xe6, OBJ_SIZE_16x16 | 0x1ff, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1fa, OBJ_PALETTE_8 | 0x207,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a6d8[OAM_DATA_SIZE(6)] = {
    6,
    0xe6, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1fa, OBJ_PALETTE_8 | 0x206,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x208,
    0xf8, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_29a6fe[OAM_DATA_SIZE(4)] = {
    4,
    0xdb, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1fa, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_29a718[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f5, OBJ_PALETTE_8 | 0x207,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x2, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f2, OBJ_PALETTE_8 | 0x209,
    0xf8, 0x2, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29a74a[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f6, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ee, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29a776[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1fb, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x209,
    0xdf, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x20b,
    0xf8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20d
};

static const u16 sSaXOam_29a7a8[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1fb, OBJ_PALETTE_8 | 0x209,
    0xdf, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x20b,
    0xf8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20d
};

static const u16 sSaXOam_29a7da[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x2, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fa, OBJ_PALETTE_8 | 0x209,
    0xde, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29a806[OAM_DATA_SIZE(7)] = {
    7,
    0xde, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1f9, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x208,
    0xd0, 0x1f0, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_29a832[OAM_DATA_SIZE(7)] = {
    7,
    0xde, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xde, 0x4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x208,
    0xd0, 0x1f0, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_29a85e[OAM_DATA_SIZE(7)] = {
    7,
    0xde, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xde, 0x6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1f6, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x208,
    0xd0, 0x1f0, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_29a88a[OAM_DATA_SIZE(6)] = {
    6,
    0xde, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1f9, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_29a8b0[OAM_DATA_SIZE(6)] = {
    6,
    0xde, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xde, 0x4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_29a8d6[OAM_DATA_SIZE(6)] = {
    6,
    0xde, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xde, 0x7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1f7, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_29a8fc[OAM_DATA_SIZE(8)] = {
    8,
    0xd8, OBJ_SIZE_16x16 | 0x1f1, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x1, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f1, OBJ_PALETTE_8 | 0x206,
    0xe8, 0x1, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x208,
    0xd0, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29a92e[OAM_DATA_SIZE(8)] = {
    8,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f4, OBJ_PALETTE_8 | 0x206,
    0xe8, 0x4, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x208,
    0xd0, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29a960[OAM_DATA_SIZE(8)] = {
    8,
    0xd8, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, OBJ_PALETTE_8 | 0x206,
    0xe8, 0x7, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x208,
    0xd0, OBJ_Y_FLIP | 0x1f0, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29a992[OAM_DATA_SIZE(7)] = {
    7,
    0xdb, 0x1fd, OBJ_PALETTE_8 | 0x208,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x5, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x5, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x5, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_29a9be[OAM_DATA_SIZE(7)] = {
    7,
    0xd8, 0x1fd, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x5, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xd8, 0x5, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_29a9ea[OAM_DATA_SIZE(9)] = {
    9,
    0xd8, 0x1fd, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f5, OBJ_PALETTE_8 | 0x207,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x5, OBJ_PALETTE_8 | 0x205,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x5, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_PALETTE_8 | 0x209,
    0xf8, 0x5, OBJ_PALETTE_8 | 0x20c
};

static const u16 sSaXOam_29aa22[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_VERTICAL | 0xdb, 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x1f5, OBJ_PALETTE_8 | 0x207,
    0xd8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x5, OBJ_PALETTE_8 | 0x205,
    0xe8, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x5, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f5, OBJ_PALETTE_8 | 0x209,
    0xf8, 0x5, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29aa54[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1fb, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x209,
    0xdf, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x20b,
    0xf8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20d
};

static const u16 sSaXOam_29aa86[OAM_DATA_SIZE(9)] = {
    9,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1fb, OBJ_PALETTE_8 | 0x209,
    0xdf, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xdc, 0x1fe, OBJ_PALETTE_8 | 0x20d,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x20b,
    0xf8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_29aabe[OAM_DATA_SIZE(9)] = {
    9,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1fb, OBJ_PALETTE_8 | 0x209,
    0xdf, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xdc, 0x1ff, OBJ_PALETTE_8 | 0x20d,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x20b,
    0xf8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_29aaf6[OAM_DATA_SIZE(7)] = {
    7,
    0xdc, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    0xde, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xde, 0x7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1f7, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_29ab22[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, OBJ_PALETTE_8 | 0x203
};

static const u16 sSaXOam_29ab36[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29ab3e[OAM_DATA_SIZE(1)] = {
    1,
    0xef, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29ab46[OAM_DATA_SIZE(1)] = {
    1,
    0xee, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29ab4e[OAM_DATA_SIZE(1)] = {
    1,
    0xef, OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29ab56[OAM_DATA_SIZE(1)] = {
    1,
    0xf0, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29ab5e[OAM_DATA_SIZE(1)] = {
    1,
    0xef, OBJ_X_FLIP | OBJ_Y_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29ab66[OAM_DATA_SIZE(1)] = {
    1,
    0xee, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29ab6e[OAM_DATA_SIZE(1)] = {
    1,
    0xef, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_29ab76[OAM_DATA_SIZE(3)] = {
    3,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x203
};

static const u16 sSaXOam_29ab8a[OAM_DATA_SIZE(9)] = {
    9,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f5, OBJ_PALETTE_8 | 0x207,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x2, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f2, OBJ_PALETTE_8 | 0x209,
    0xf8, 0x2, OBJ_PALETTE_8 | 0x20d,
    0xe7, 0x1e9, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29abc2[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f6, OBJ_PALETTE_8 | 0x207,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x209,
    0xe6, 0x1eb, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ee, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_29abf4[OAM_DATA_SIZE(9)] = {
    9,
    0xe7, OBJ_X_FLIP | 0xf, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1fb, OBJ_PALETTE_8 | 0x209,
    0xdf, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x20b,
    0xf8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_29ac2c[OAM_DATA_SIZE(8)] = {
    8,
    0xe6, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x2, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fa, OBJ_PALETTE_8 | 0x209,
    0xde, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20b
};

const struct SaXAnimationData sSaXAnim_Running_Left[11] = {
    [0] = {
        .pGraphics = sSaXGfx_28ff60,
        .pOamFrame = sSaXOam_29a26e,
        .timer = 3
    },
    [1] = {
        .pGraphics = sSaXGfx_2900a2,
        .pOamFrame = sSaXOam_29a282,
        .timer = 3
    },
    [2] = {
        .pGraphics = sSaXGfx_290224,
        .pOamFrame = sSaXOam_29a29c,
        .timer = 3
    },
    [3] = {
        .pGraphics = sSaXGfx_2903c6,
        .pOamFrame = sSaXOam_29a2bc,
        .timer = 3
    },
    [4] = {
        .pGraphics = sSaXGfx_2905c8,
        .pOamFrame = sSaXOam_29a2d6,
        .timer = 3
    },
    [5] = {
        .pGraphics = sSaXGfx_29074a,
        .pOamFrame = sSaXOam_29a2f0,
        .timer = 3
    },
    [6] = {
        .pGraphics = sSaXGfx_2908ac,
        .pOamFrame = sSaXOam_29a30a,
        .timer = 3
    },
    [7] = {
        .pGraphics = sSaXGfx_290a4e,
        .pOamFrame = sSaXOam_29a32a,
        .timer = 3
    },
    [8] = {
        .pGraphics = sSaXGfx_290c50,
        .pOamFrame = sSaXOam_29a344,
        .timer = 3
    },
    [9] = {
        .pGraphics = sSaXGfx_290e32,
        .pOamFrame = sSaXOam_29a35e,
        .timer = 3
    },
    [10] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Running_Right[11] = {
    [0] = {
        .pGraphics = sSaXGfx_290fb4,
        .pOamFrame = sSaXOam_29a378,
        .timer = 3
    },
    [1] = {
        .pGraphics = sSaXGfx_291136,
        .pOamFrame = sSaXOam_29a392,
        .timer = 3
    },
    [2] = {
        .pGraphics = sSaXGfx_2912d8,
        .pOamFrame = sSaXOam_29a3b2,
        .timer = 3
    },
    [3] = {
        .pGraphics = sSaXGfx_2914ba,
        .pOamFrame = sSaXOam_29a3de,
        .timer = 3
    },
    [4] = {
        .pGraphics = sSaXGfx_2916fc,
        .pOamFrame = sSaXOam_29a404,
        .timer = 3
    },
    [5] = {
        .pGraphics = sSaXGfx_29189e,
        .pOamFrame = sSaXOam_29a424,
        .timer = 3
    },
    [6] = {
        .pGraphics = sSaXGfx_291a20,
        .pOamFrame = sSaXOam_29a43e,
        .timer = 3
    },
    [7] = {
        .pGraphics = sSaXGfx_291c02,
        .pOamFrame = sSaXOam_29a464,
        .timer = 3
    },
    [8] = {
        .pGraphics = sSaXGfx_291e84,
        .pOamFrame = sSaXOam_29a484,
        .timer = 3
    },
    [9] = {
        .pGraphics = sSaXGfx_2920e6,
        .pOamFrame = sSaXOam_29a4a4,
        .timer = 3
    },
    [10] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_SwagWalk_Left[11] = {
    [0] = {
        .pGraphics = sSaXGfx_292308,
        .pOamFrame = sSaXOam_29a4ca,
        .timer = 8
    },
    [1] = {
        .pGraphics = sSaXGfx_29248a,
        .pOamFrame = sSaXOam_29a4e4,
        .timer = 8
    },
    [2] = {
        .pGraphics = sSaXGfx_29260c,
        .pOamFrame = sSaXOam_29a4fe,
        .timer = 8
    },
    [3] = {
        .pGraphics = sSaXGfx_2927ce,
        .pOamFrame = sSaXOam_29a51e,
        .timer = 8
    },
    [4] = {
        .pGraphics = sSaXGfx_2929b0,
        .pOamFrame = sSaXOam_29a544,
        .timer = 8
    },
    [5] = {
        .pGraphics = sSaXGfx_292b72,
        .pOamFrame = sSaXOam_29a564,
        .timer = 8
    },
    [6] = {
        .pGraphics = sSaXGfx_292cf4,
        .pOamFrame = sSaXOam_29a57e,
        .timer = 8
    },
    [7] = {
        .pGraphics = sSaXGfx_292e96,
        .pOamFrame = sSaXOam_29a59e,
        .timer = 8
    },
    [8] = {
        .pGraphics = sSaXGfx_293058,
        .pOamFrame = sSaXOam_29a57e,
        .timer = 8
    },
    [9] = {
        .pGraphics = sSaXGfx_2931fa,
        .pOamFrame = sSaXOam_29a5be,
        .timer = 8
    },
    [10] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_SwagWalk_Right[11] = {
    [0] = {
        .pGraphics = sSaXGfx_29337c,
        .pOamFrame = sSaXOam_29a5d8,
        .timer = 8
    },
    [1] = {
        .pGraphics = sSaXGfx_2934fe,
        .pOamFrame = sSaXOam_29a5f2,
        .timer = 8
    },
    [2] = {
        .pGraphics = sSaXGfx_293680,
        .pOamFrame = sSaXOam_29a60c,
        .timer = 8
    },
    [3] = {
        .pGraphics = sSaXGfx_293842,
        .pOamFrame = sSaXOam_29a62c,
        .timer = 8
    },
    [4] = {
        .pGraphics = sSaXGfx_293a24,
        .pOamFrame = sSaXOam_29a652,
        .timer = 8
    },
    [5] = {
        .pGraphics = sSaXGfx_293be6,
        .pOamFrame = sSaXOam_29a672,
        .timer = 8
    },
    [6] = {
        .pGraphics = sSaXGfx_293d68,
        .pOamFrame = sSaXOam_29a68c,
        .timer = 8
    },
    [7] = {
        .pGraphics = sSaXGfx_293f6a,
        .pOamFrame = sSaXOam_29a6b2,
        .timer = 8
    },
    [8] = {
        .pGraphics = sSaXGfx_2941ac,
        .pOamFrame = sSaXOam_29a6d8,
        .timer = 8
    },
    [9] = {
        .pGraphics = sSaXGfx_2943ce,
        .pOamFrame = sSaXOam_29a6fe,
        .timer = 8
    },
    [10] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_29ae70[11] = {
    [0] = {
        .pGraphics = sSaXGfx_292308,
        .pOamFrame = sSaXOam_29a4ca,
        .timer = 6
    },
    [1] = {
        .pGraphics = sSaXGfx_29248a,
        .pOamFrame = sSaXOam_29a4e4,
        .timer = 6
    },
    [2] = {
        .pGraphics = sSaXGfx_29260c,
        .pOamFrame = sSaXOam_29a4fe,
        .timer = 6
    },
    [3] = {
        .pGraphics = sSaXGfx_2927ce,
        .pOamFrame = sSaXOam_29a51e,
        .timer = 6
    },
    [4] = {
        .pGraphics = sSaXGfx_2929b0,
        .pOamFrame = sSaXOam_29a544,
        .timer = 6
    },
    [5] = {
        .pGraphics = sSaXGfx_292b72,
        .pOamFrame = sSaXOam_29a564,
        .timer = 6
    },
    [6] = {
        .pGraphics = sSaXGfx_292cf4,
        .pOamFrame = sSaXOam_29a57e,
        .timer = 6
    },
    [7] = {
        .pGraphics = sSaXGfx_292e96,
        .pOamFrame = sSaXOam_29a59e,
        .timer = 6
    },
    [8] = {
        .pGraphics = sSaXGfx_293058,
        .pOamFrame = sSaXOam_29a57e,
        .timer = 6
    },
    [9] = {
        .pGraphics = sSaXGfx_2931fa,
        .pOamFrame = sSaXOam_29a5be,
        .timer = 6
    },
    [10] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_29aef4[11] = {
    [0] = {
        .pGraphics = sSaXGfx_29337c,
        .pOamFrame = sSaXOam_29a5d8,
        .timer = 6
    },
    [1] = {
        .pGraphics = sSaXGfx_2934fe,
        .pOamFrame = sSaXOam_29a5f2,
        .timer = 6
    },
    [2] = {
        .pGraphics = sSaXGfx_293680,
        .pOamFrame = sSaXOam_29a60c,
        .timer = 6
    },
    [3] = {
        .pGraphics = sSaXGfx_293842,
        .pOamFrame = sSaXOam_29a62c,
        .timer = 6
    },
    [4] = {
        .pGraphics = sSaXGfx_293a24,
        .pOamFrame = sSaXOam_29a652,
        .timer = 6
    },
    [5] = {
        .pGraphics = sSaXGfx_293be6,
        .pOamFrame = sSaXOam_29a672,
        .timer = 6
    },
    [6] = {
        .pGraphics = sSaXGfx_293d68,
        .pOamFrame = sSaXOam_29a68c,
        .timer = 6
    },
    [7] = {
        .pGraphics = sSaXGfx_293f6a,
        .pOamFrame = sSaXOam_29a6b2,
        .timer = 6
    },
    [8] = {
        .pGraphics = sSaXGfx_2941ac,
        .pOamFrame = sSaXOam_29a6d8,
        .timer = 6
    },
    [9] = {
        .pGraphics = sSaXGfx_2943ce,
        .pOamFrame = sSaXOam_29a6fe,
        .timer = 6
    },
    [10] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Left[4] = {
    [0] = {
        .pGraphics = sSaXGfx_294550,
        .pOamFrame = sSaXOam_29a718,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_2947f2,
        .pOamFrame = sSaXOam_29a718,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_294a94,
        .pOamFrame = sSaXOam_29a718,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Left[3] = {
    [0] = {
        .pGraphics = sSaXGfx_294d36,
        .pOamFrame = sSaXOam_29a74a,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_2947f2,
        .pOamFrame = sSaXOam_29a718,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Right[4] = {
    [0] = {
        .pGraphics = sSaXGfx_294fb8,
        .pOamFrame = sSaXOam_29a776,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_29525a,
        .pOamFrame = sSaXOam_29a7a8,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_2954fc,
        .pOamFrame = sSaXOam_29a7a8,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Right[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29579e,
        .pOamFrame = sSaXOam_29a7da,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_29525a,
        .pOamFrame = sSaXOam_29a7a8,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_29b020[3] = {
    [0] = {
        .pGraphics = sSaXGfx_295a20,
        .pOamFrame = sSaXOam_29a806,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_295e64,
        .pOamFrame = sSaXOam_29a85e,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_29b044[3] = {
    [0] = {
        .pGraphics = sSaXGfx_295e64,
        .pOamFrame = sSaXOam_29a85e,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_295a20,
        .pOamFrame = sSaXOam_29a806,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Turning_Left[3] = {
    [0] = {
        .pGraphics = sSaXGfx_296086,
        .pOamFrame = sSaXOam_29a88a,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_29648a,
        .pOamFrame = sSaXOam_29a8d6,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Turning_Right[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29648a,
        .pOamFrame = sSaXOam_29a8d6,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_296086,
        .pOamFrame = sSaXOam_29a88a,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_29b0b0[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29668c,
        .pOamFrame = sSaXOam_29a8fc,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_296b10,
        .pOamFrame = sSaXOam_29a960,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_29b0d4[3] = {
    [0] = {
        .pGraphics = sSaXGfx_296b10,
        .pOamFrame = sSaXOam_29a960,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_29668c,
        .pOamFrame = sSaXOam_29a8fc,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_TurningTowardsCamera[12] = {
    [0] = {
        .pGraphics = sSaXGfx_294fb8,
        .pOamFrame = sSaXOam_29a776,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_29525a,
        .pOamFrame = sSaXOam_29a7a8,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_2954fc,
        .pOamFrame = sSaXOam_29a7a8,
        .timer = 16
    },
    [3] = {
        .pGraphics = sSaXGfx_297a3e,
        .pOamFrame = sSaXOam_29aa54,
        .timer = 10
    },
    [4] = {
        .pGraphics = sSaXGfx_297ce0,
        .pOamFrame = sSaXOam_29aa86,
        .timer = 10
    },
    [5] = {
        .pGraphics = sSaXGfx_297fa2,
        .pOamFrame = sSaXOam_29aabe,
        .timer = 30
    },
    [6] = {
        .pGraphics = sSaXGfx_296d52,
        .pOamFrame = sSaXOam_29a992,
        .timer = 8
    },
    [7] = {
        .pGraphics = sSaXGfx_296f54,
        .pOamFrame = sSaXOam_29a9be,
        .timer = 6
    },
    [8] = {
        .pGraphics = sSaXGfx_297156,
        .pOamFrame = sSaXOam_29a9be,
        .timer = 6
    },
    [9] = {
        .pGraphics = sSaXGfx_29755a,
        .pOamFrame = sSaXOam_29a9ea,
        .timer = 6
    },
    [10] = {
        .pGraphics = sSaXGfx_2977dc,
        .pOamFrame = sSaXOam_29aa22,
        .timer = 6
    },
    [11] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Morphing_Left[3] = {
    [0] = {
        .pGraphics = sSaXGfx_298486,
        .pOamFrame = sSaXOam_29ab22,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_298588,
        .pOamFrame = sSaXOam_29ab22,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Unmorphing_Left[3] = {
    [0] = {
        .pGraphics = sSaXGfx_298588,
        .pOamFrame = sSaXOam_29ab22,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_298486,
        .pOamFrame = sSaXOam_29ab22,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_MorphBall_Left[9] = {
    [0] = {
        .pGraphics = sSaXGfx_29868a,
        .pOamFrame = sSaXOam_29ab36,
        .timer = 3
    },
    [1] = {
        .pGraphics = sSaXGfx_29870c,
        .pOamFrame = sSaXOam_29ab3e,
        .timer = 3
    },
    [2] = {
        .pGraphics = sSaXGfx_29878e,
        .pOamFrame = sSaXOam_29ab46,
        .timer = 3
    },
    [3] = {
        .pGraphics = sSaXGfx_298810,
        .pOamFrame = sSaXOam_29ab4e,
        .timer = 3
    },
    [4] = {
        .pGraphics = sSaXGfx_298892,
        .pOamFrame = sSaXOam_29ab56,
        .timer = 3
    },
    [5] = {
        .pGraphics = sSaXGfx_298914,
        .pOamFrame = sSaXOam_29ab5e,
        .timer = 3
    },
    [6] = {
        .pGraphics = sSaXGfx_298996,
        .pOamFrame = sSaXOam_29ab66,
        .timer = 3
    },
    [7] = {
        .pGraphics = sSaXGfx_298a18,
        .pOamFrame = sSaXOam_29ab6e,
        .timer = 3
    },
    [8] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Morphing_Right[3] = {
    [0] = {
        .pGraphics = sSaXGfx_298a9a,
        .pOamFrame = sSaXOam_29ab76,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_298b9c,
        .pOamFrame = sSaXOam_29ab76,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Unmorphing_Right[3] = {
    [0] = {
        .pGraphics = sSaXGfx_298b9c,
        .pOamFrame = sSaXOam_29ab76,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_298a9a,
        .pOamFrame = sSaXOam_29ab76,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_MorphBall_Right[9] = {
    [0] = {
        .pGraphics = sSaXGfx_29868a,
        .pOamFrame = sSaXOam_29ab36,
        .timer = 3
    },
    [1] = {
        .pGraphics = sSaXGfx_298a18,
        .pOamFrame = sSaXOam_29ab6e,
        .timer = 3
    },
    [2] = {
        .pGraphics = sSaXGfx_298996,
        .pOamFrame = sSaXOam_29ab66,
        .timer = 3
    },
    [3] = {
        .pGraphics = sSaXGfx_298914,
        .pOamFrame = sSaXOam_29ab5e,
        .timer = 3
    },
    [4] = {
        .pGraphics = sSaXGfx_298892,
        .pOamFrame = sSaXOam_29ab56,
        .timer = 3
    },
    [5] = {
        .pGraphics = sSaXGfx_298810,
        .pOamFrame = sSaXOam_29ab4e,
        .timer = 3
    },
    [6] = {
        .pGraphics = sSaXGfx_29878e,
        .pOamFrame = sSaXOam_29ab46,
        .timer = 3
    },
    [7] = {
        .pGraphics = sSaXGfx_29870c,
        .pOamFrame = sSaXOam_29ab3e,
        .timer = 3
    },
    [8] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_TurningAwayFromCamera[3] = {
    [0] = {
        .pGraphics = sSaXGfx_2977dc,
        .pOamFrame = sSaXOam_29aa22,
        .timer = 12
    },
    [1] = {
        .pGraphics = sSaXGfx_296d52,
        .pOamFrame = sSaXOam_29a992,
        .timer = 12
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Left_Armed[4] = {
    [0] = {
        .pGraphics = sSaXGfx_298c9e,
        .pOamFrame = sSaXOam_29ab8a,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_298f60,
        .pOamFrame = sSaXOam_29ab8a,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_299222,
        .pOamFrame = sSaXOam_29ab8a,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Left_Armed[3] = {
    [0] = {
        .pGraphics = sSaXGfx_2994e4,
        .pOamFrame = sSaXOam_29abc2,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_298f60,
        .pOamFrame = sSaXOam_29ab8a,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Right_Armed[4] = {
    [0] = {
        .pGraphics = sSaXGfx_299786,
        .pOamFrame = sSaXOam_29abf4,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_299a48,
        .pOamFrame = sSaXOam_29abf4,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_299d0a,
        .pOamFrame = sSaXOam_29abf4,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Right_Armed[3] = {
    [0] = {
        .pGraphics = sSaXGfx_299fcc,
        .pOamFrame = sSaXOam_29ac2c,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_299a48,
        .pOamFrame = sSaXOam_29abf4,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

static const u8 sSaXGfx_29b3bc[SA_X_GFX_SIZE(12, 9)] = {
    12, 9,
    _INCBIN_U8("data/sa_x/29b3bc.gfx")
};

static const u8 sSaXGfx_29b65e[SA_X_GFX_SIZE(12, 9)] = {
    12, 9,
    _INCBIN_U8("data/sa_x/29b65e.gfx")
};

static const u8 sSaXGfx_29b900[SA_X_GFX_SIZE(12, 9)] = {
    12, 9,
    _INCBIN_U8("data/sa_x/29b900.gfx")
};

static const u8 sSaXGfx_29bba2[SA_X_GFX_SIZE(12, 9)] = {
    12, 9,
    _INCBIN_U8("data/sa_x/29bba2.gfx")
};

static const u8 sSaXGfx_29be44[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/29be44.gfx")
};

static const u8 sSaXGfx_29c106[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/29c106.gfx")
};

static const u8 sSaXGfx_29c3c8[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/29c3c8.gfx")
};

static const u8 sSaXGfx_29c68a[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/29c68a.gfx")
};

static const u8 sSaXGfx_29c94c[SA_X_GFX_SIZE(13, 8)] = {
    13, 8,
    _INCBIN_U8("data/sa_x/29c94c.gfx")
};

static const u8 sSaXGfx_29cbee[SA_X_GFX_SIZE(13, 8)] = {
    13, 8,
    _INCBIN_U8("data/sa_x/29cbee.gfx")
};

static const u8 sSaXGfx_29ce90[SA_X_GFX_SIZE(13, 8)] = {
    13, 8,
    _INCBIN_U8("data/sa_x/29ce90.gfx")
};

static const u8 sSaXGfx_29d132[SA_X_GFX_SIZE(13, 10)] = {
    13, 10,
    _INCBIN_U8("data/sa_x/29d132.gfx")
};

static const u8 sSaXGfx_29d414[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/29d414.gfx")
};

static const u8 sSaXGfx_29d6d6[SA_X_GFX_SIZE(15, 11)] = {
    15, 11,
    _INCBIN_U8("data/sa_x/29d6d6.gfx")
};

static const u8 sSaXGfx_29da18[SA_X_GFX_SIZE(15, 11)] = {
    15, 11,
    _INCBIN_U8("data/sa_x/29da18.gfx")
};

static const u8 sSaXGfx_29dd5a[SA_X_GFX_SIZE(15, 11)] = {
    15, 11,
    _INCBIN_U8("data/sa_x/29dd5a.gfx")
};

static const u8 sSaXGfx_29e09c[SA_X_GFX_SIZE(8, 6)] = {
    8, 6,
    _INCBIN_U8("data/sa_x/29e09c.gfx")
};

static const u8 sSaXGfx_29e25e[SA_X_GFX_SIZE(8, 5)] = {
    8, 5,
    _INCBIN_U8("data/sa_x/29e25e.gfx")
};

static const u8 sSaXGfx_29e400[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/29e400.gfx")
};

static const u8 sSaXGfx_29e602[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/29e602.gfx")
};

static const u8 sSaXGfx_29e804[SA_X_GFX_SIZE(11, 7)] = {
    11, 7,
    _INCBIN_U8("data/sa_x/29e804.gfx")
};

static const u8 sSaXGfx_29ea46[SA_X_GFX_SIZE(12, 6)] = {
    12, 6,
    _INCBIN_U8("data/sa_x/29ea46.gfx")
};

static const u8 sSaXGfx_29ec88[SA_X_GFX_SIZE(12, 6)] = {
    12, 6,
    _INCBIN_U8("data/sa_x/29ec88.gfx")
};

static const u8 sSaXGfx_29eeca[SA_X_GFX_SIZE(9, 5)] = {
    9, 5,
    _INCBIN_U8("data/sa_x/29eeca.gfx")
};

static const u8 sSaXGfx_29f08c[SA_X_GFX_SIZE(11, 5)] = {
    11, 5,
    _INCBIN_U8("data/sa_x/29f08c.gfx")
};

static const u8 sSaXGfx_29f28e[SA_X_GFX_SIZE(11, 5)] = {
    11, 5,
    _INCBIN_U8("data/sa_x/29f28e.gfx")
};

static const u8 sSaXGfx_29f490[SA_X_GFX_SIZE(12, 8)] = {
    12, 8,
    _INCBIN_U8("data/sa_x/29f490.gfx")
};

static const u8 sSaXGfx_29f712[SA_X_GFX_SIZE(11, 5)] = {
    11, 5,
    _INCBIN_U8("data/sa_x/29f712.gfx")
};

static const u8 sSaXGfx_29f914[SA_X_GFX_SIZE(13, 10)] = {
    13, 10,
    _INCBIN_U8("data/sa_x/29f914.gfx")
};

static const u8 sSaXGfx_29fbf6[SA_X_GFX_SIZE(12, 8)] = {
    12, 8,
    _INCBIN_U8("data/sa_x/29fbf6.gfx")
};

static const u8 sSaXGfx_29fe78[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/29fe78.gfx")
};

static const u8 sSaXGfx_2a013a[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/2a013a.gfx")
};

static const u8 sSaXGfx_2a03fc[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/2a03fc.gfx")
};

static const u8 sSaXGfx_2a06be[SA_X_GFX_SIZE(13, 9)] = {
    13, 9,
    _INCBIN_U8("data/sa_x/2a06be.gfx")
};

static const u8 sSaXGfx_2a0980[SA_X_GFX_SIZE(14, 9)] = {
    14, 9,
    _INCBIN_U8("data/sa_x/2a0980.gfx")
};

static const u8 sSaXGfx_2a0c62[SA_X_GFX_SIZE(14, 9)] = {
    14, 9,
    _INCBIN_U8("data/sa_x/2a0c62.gfx")
};

static const u8 sSaXGfx_2a0f44[SA_X_GFX_SIZE(14, 9)] = {
    14, 9,
    _INCBIN_U8("data/sa_x/2a0f44.gfx")
};

static const u8 sSaXGfx_2a1226[SA_X_GFX_SIZE(14, 9)] = {
    14, 9,
    _INCBIN_U8("data/sa_x/2a1226.gfx")
};

static const u8 sSaXGfx_2a1508[SA_X_GFX_SIZE(14, 8)] = {
    14, 8,
    _INCBIN_U8("data/sa_x/2a1508.gfx")
};

static const u8 sSaXGfx_2a17ca[SA_X_GFX_SIZE(14, 8)] = {
    14, 8,
    _INCBIN_U8("data/sa_x/2a17ca.gfx")
};

static const u8 sSaXGfx_2a1a8c[SA_X_GFX_SIZE(14, 8)] = {
    14, 8,
    _INCBIN_U8("data/sa_x/2a1a8c.gfx")
};

static const u8 sSaXGfx_2a1d4e[SA_X_GFX_SIZE(14, 10)] = {
    14, 10,
    _INCBIN_U8("data/sa_x/2a1d4e.gfx")
};

static const u8 sSaXGfx_2a2050[SA_X_GFX_SIZE(14, 9)] = {
    14, 9,
    _INCBIN_U8("data/sa_x/2a2050.gfx")
};

static const u8 sSaXGfx_2a2332[SA_X_GFX_SIZE(16, 11)] = {
    16, 11,
    _INCBIN_U8("data/sa_x/2a2332.gfx")
};

static const u8 sSaXGfx_2a2694[SA_X_GFX_SIZE(16, 11)] = {
    16, 11,
    _INCBIN_U8("data/sa_x/2a2694.gfx")
};

static const u8 sSaXGfx_2a29f6[SA_X_GFX_SIZE(16, 11)] = {
    16, 11,
    _INCBIN_U8("data/sa_x/2a29f6.gfx")
};

static const u8 sSaXGfx_2a2d58[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/2a2d58.gfx")
};

static const u8 sSaXGfx_2a2f5a[SA_X_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/sa_x/2a2f5a.gfx")
};

static const u8 sSaXGfx_2a313c[SA_X_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/sa_x/2a313c.gfx")
};

static const u8 sSaXGfx_2a331e[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/2a331e.gfx")
};

static const u8 sSaXGfx_2a3520[SA_X_GFX_SIZE(8, 5)] = {
    8, 5,
    _INCBIN_U8("data/sa_x/2a3520.gfx")
};

static const u8 sSaXGfx_2a36c2[SA_X_GFX_SIZE(8, 5)] = {
    8, 5,
    _INCBIN_U8("data/sa_x/2a36c2.gfx")
};

static const u8 sSaXGfx_2a3864[SA_X_GFX_SIZE(9, 8)] = {
    9, 8,
    _INCBIN_U8("data/sa_x/2a3864.gfx")
};

static const u8 sSaXGfx_2a3a86[SA_X_GFX_SIZE(10, 8)] = {
    10, 8,
    _INCBIN_U8("data/sa_x/2a3a86.gfx")
};

static const u8 sSaXGfx_2a3cc8[SA_X_GFX_SIZE(11, 8)] = {
    11, 8,
    _INCBIN_U8("data/sa_x/2a3cc8.gfx")
};

static const u8 sSaXGfx_2a3f2a[SA_X_GFX_SIZE(13, 10)] = {
    13, 10,
    _INCBIN_U8("data/sa_x/2a3f2a.gfx")
};

static const u8 sSaXGfx_2a420c[SA_X_GFX_SIZE(14, 14)] = {
    14, 14,
    _INCBIN_U8("data/sa_x/2a420c.gfx")
};

static const u8 sSaXGfx_2a458e[SA_X_GFX_SIZE(14, 14)] = {
    14, 14,
    _INCBIN_U8("data/sa_x/2a458e.gfx")
};

static const u8 sSaXGfx_2a4910[SA_X_GFX_SIZE(17, 15)] = {
    17, 15,
    _INCBIN_U8("data/sa_x/2a4910.gfx")
};

static const u8 sSaXGfx_2a4d12[SA_X_GFX_SIZE(26, 19)] = {
    26, 19,
    _INCBIN_U8("data/sa_x/2a4d12.gfx")
};

static const u8 sSaXGfx_2a52b4[SA_X_GFX_SIZE(25, 18)] = {
    25, 18,
    _INCBIN_U8("data/sa_x/2a52b4.gfx")
};

static const u8 sSaXGfx_2a5816[SA_X_GFX_SIZE(32, 22)] = {
    32, 22,
    _INCBIN_U8("data/sa_x/2a5816.gfx")
};

static const u8 sSaXGfx_2a5ed8[SA_X_GFX_SIZE(10, 9)] = {
    10, 9,
    _INCBIN_U8("data/sa_x/2a5ed8.gfx")
};

static const u8 sSaXGfx_2a613a[SA_X_GFX_SIZE(10, 7)] = {
    10, 7,
    _INCBIN_U8("data/sa_x/2a613a.gfx")
};

static const u8 sSaXGfx_2a635c[SA_X_GFX_SIZE(12, 9)] = {
    12, 9,
    _INCBIN_U8("data/sa_x/2a635c.gfx")
};

static const u8 sSaXGfx_2a65fe[SA_X_GFX_SIZE(14, 11)] = {
    14, 11,
    _INCBIN_U8("data/sa_x/2a65fe.gfx")
};

static const u8 sSaXGfx_2a6920[SA_X_GFX_SIZE(16, 16)] = {
    16, 16,
    _INCBIN_U8("data/sa_x/2a6920.gfx")
};

static const u8 sSaXGfx_2a6d22[SA_X_GFX_SIZE(16, 16)] = {
    16, 16,
    _INCBIN_U8("data/sa_x/2a6d22.gfx")
};

static const u8 sSaXGfx_2a7124[SA_X_GFX_SIZE(20, 16)] = {
    20, 16,
    _INCBIN_U8("data/sa_x/2a7124.gfx")
};

static const u8 sSaXGfx_2a75a6[SA_X_GFX_SIZE(32, 25)] = {
    32, 25,
    _INCBIN_U8("data/sa_x/2a75a6.gfx")
};

static const u8 sSaXGfx_2a7cc8[SA_X_GFX_SIZE(31, 20)] = {
    31, 20,
    _INCBIN_U8("data/sa_x/2a7cc8.gfx")
};

static const u8 sSaXGfx_2a832a[SA_X_GFX_SIZE(32, 26)] = {
    32, 26,
    _INCBIN_U8("data/sa_x/2a832a.gfx")
};

static const u16 sSaXOam_2a8a6c[OAM_DATA_SIZE(7)] = {
    7,
    0xdd, 0x1fd, OBJ_PALETTE_8 | 0x20b,
    0xdc, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, OBJ_PALETTE_8 | 0x209,
    0xd9, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8a98[OAM_DATA_SIZE(7)] = {
    7,
    0xde, 0x1fe, OBJ_PALETTE_8 | 0x20b,
    0xdd, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, OBJ_PALETTE_8 | 0x209,
    0xda, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8ac4[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fa, OBJ_PALETTE_8 | 0x209,
    0xe3, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, OBJ_PALETTE_8 | 0x20b,
    0xe4, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8af0[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fc, OBJ_PALETTE_8 | 0x209,
    0xe2, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, OBJ_PALETTE_8 | 0x20b,
    0xe2, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8b1c[OAM_DATA_SIZE(8)] = {
    8,
    0xde, 0x1fd, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fb, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xd7, 0xb, OBJ_PALETTE_8 | 0x206,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2a8b4e[OAM_DATA_SIZE(8)] = {
    8,
    0xde, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fb, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xd7, 0xb, OBJ_PALETTE_8 | 0x206,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2a8b80[OAM_DATA_SIZE(8)] = {
    8,
    0xde, 0x1fc, OBJ_PALETTE_8 | 0x20c,
    0xd8, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0xe, OBJ_PALETTE_8 | 0x208,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x20a,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8bb2[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f8, OBJ_PALETTE_8 | 0x209,
    0xe3, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20b,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8bde[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f8, OBJ_PALETTE_8 | 0x20b,
    0xe3, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20d,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x206,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a8c10[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1f7, OBJ_PALETTE_8 | 0x20b,
    0xe1, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x20d,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x206,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a8c42[OAM_DATA_SIZE(5)] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xda, 0x0, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8c62[OAM_DATA_SIZE(5)] = {
    5,
    0xda, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    0xda, 0x9, OBJ_PALETTE_8 | 0x207,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x205
};

static const u16 sSaXOam_2a8c82[OAM_DATA_SIZE(6)] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x3, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f3, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a8ca8[OAM_DATA_SIZE(6)] = {
    6,
    0xdd, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1f6, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a8cce[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe4, 0x1f4, OBJ_PALETTE_8 | 0x207,
    0xe6, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe6, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x206,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x1ec, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_2a8cf4[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xe1, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ec, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2a8d1a[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xdc, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    0xf8, OBJ_X_FLIP | 0x2, OBJ_PALETTE_8 | 0x20a,
    0xf8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a8d46[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xed, 0x4, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1fc, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xe6, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe3, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202
};

static const u16 sSaXOam_2a8d66[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x4, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1fc, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xe1, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xde, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_2a8d8c[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xdd, 0x1fc, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xdc, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xf8, 0x1f6, OBJ_PALETTE_8 | 0x209,
    0xf8, 0x2, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2a8db8[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1fb, OBJ_PALETTE_8 | 0x208,
    0xde, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe9, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1fa, OBJ_PALETTE_8 | 0x20a,
    0xe3, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8dde[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f1, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1, OBJ_PALETTE_8 | 0x204,
    0xdd, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe9, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf9, 0x1fb, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ef, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_2a8e04[OAM_DATA_SIZE(7)] = {
    7,
    0xdf, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    0xe0, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x202,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x20a,
    0xde, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a8e30[OAM_DATA_SIZE(7)] = {
    7,
    0xe0, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe0, 0xa, OBJ_PALETTE_8 | 0x206,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xe9, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf9, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x0, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_VERTICAL | 0xdf, OBJ_X_FLIP | 0x1f9, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2a8e5c[OAM_DATA_SIZE(8)] = {
    8,
    0xdd, 0x1fd, OBJ_PALETTE_8 | 0x20b,
    0xdc, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, OBJ_PALETTE_8 | 0x209,
    0xd8, 0x1eb, OBJ_PALETTE_8 | 0x20c,
    0xd9, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8e8e[OAM_DATA_SIZE(8)] = {
    8,
    0xde, 0x1fe, OBJ_PALETTE_8 | 0x20b,
    0xdd, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, OBJ_PALETTE_8 | 0x209,
    0xd9, 0x1ec, OBJ_PALETTE_8 | 0x20c,
    0xda, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8ec0[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fa, OBJ_PALETTE_8 | 0x209,
    0xe3, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, OBJ_PALETTE_8 | 0x20b,
    0xed, 0x1ec, OBJ_PALETTE_8 | 0x20d,
    0xe4, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8ef2[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fc, OBJ_PALETTE_8 | 0x209,
    0xe2, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, OBJ_PALETTE_8 | 0x20b,
    0xec, 0x1ed, OBJ_PALETTE_8 | 0x20d,
    0xe3, OBJ_SIZE_16x16 | 0x1ee, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a8f24[OAM_DATA_SIZE(9)] = {
    9,
    0xd8, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xd7, 0xb, OBJ_PALETTE_8 | 0x206,
    0xde, 0x1fd, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fb, OBJ_PALETTE_8 | 0x208,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2a8f5c[OAM_DATA_SIZE(9)] = {
    9,
    0xd8, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x20c,
    0xde, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xd7, 0xb, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fb, OBJ_PALETTE_8 | 0x208,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2a8f94[OAM_DATA_SIZE(9)] = {
    9,
    0xd8, OBJ_X_FLIP | 0xd, OBJ_PALETTE_8 | 0x20c,
    0xde, 0x1fd, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xd7, 0xb, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fb, OBJ_PALETTE_8 | 0x208,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20a,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2a8fcc[OAM_DATA_SIZE(9)] = {
    9,
    0xd9, OBJ_X_FLIP | 0xc, OBJ_PALETTE_8 | 0x20c,
    0xde, 0x1fc, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_VERTICAL | 0xd8, 0xe, OBJ_PALETTE_8 | 0x208,
    0xd8, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x20a,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a9004[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f8, OBJ_PALETTE_8 | 0x209,
    0xed, OBJ_X_FLIP | 0xc, OBJ_PALETTE_8 | 0x20d,
    0xe3, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20b,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a9036[OAM_DATA_SIZE(9)] = {
    9,
    0xed, OBJ_X_FLIP | 0xc, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1f8, OBJ_PALETTE_8 | 0x20b,
    0xe3, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f3, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x20d,
    0xe4, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x206,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a906e[OAM_DATA_SIZE(9)] = {
    9,
    0xec, OBJ_X_FLIP | 0xb, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xde, 0x1f7, OBJ_PALETTE_8 | 0x20b,
    0xe1, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x20d,
    0xe3, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x206,
    0xe2, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a90a6[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xe0, 0x1f4, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f2, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x2, OBJ_PALETTE_8 | 0x209,
    0xef, OBJ_SIZE_16x16 | 0x1f2, OBJ_PALETTE_8 | 0x202
};

static const u16 sSaXOam_2a90d2[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe9, 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x3, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f3, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x3, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x202
};

static const u16 sSaXOam_2a90f8[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xea, 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x4, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x4, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x202
};

static const u16 sSaXOam_2a911e[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x204,
    0xed, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x208,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fe, OBJ_PALETTE_8 | 0x206,
    0xf8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_2a914a[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe9, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x1fa, OBJ_PALETTE_8 | 0x203,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_8 | 0x205,
    0xf8, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2a9170[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xea, OBJ_X_FLIP | 0x1ff, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xee, 0x1f8, OBJ_PALETTE_8 | 0x203,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x205,
    0xf8, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2a9196[OAM_DATA_SIZE(5)] = {
    5,
    0xe5, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x200,
    0xf5, 0x1fc, OBJ_PALETTE_8 | 0x208,
    0xe1, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xea, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a91b6[OAM_DATA_SIZE(6)] = {
    6,
    0xe2, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xf2, 0x1fb, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xe2, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    0xda, 0x1f6, OBJ_PALETTE_8 | 0x209,
    0xe7, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2a91dc[OAM_DATA_SIZE(7)] = {
    7,
    0xd8, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x3, OBJ_PALETTE_8 | 0x206,
    0xe8, OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, 0x3, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f3, OBJ_PALETTE_8 | 0x208,
    0xf8, 0x3, OBJ_PALETTE_8 | 0x20a,
    0xe8, OBJ_SIZE_16x16 | 0x1eb, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2a9208[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ed, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ed, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ed, OBJ_PALETTE_8 | 0x20a,
    0xf8, 0x4, OBJ_PALETTE_8 | 0x20c,
    0xe4, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a9228[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x208,
    0xe1, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x20c
};

static const u16 sSaXOam_2a9242[OAM_DATA_SIZE(4)] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x208,
    0xe0, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x20c
};

static const u16 sSaXOam_2a925c[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xdd, 0xc, OBJ_PALETTE_8 | 0x20e,
    0xf8, 0xc, OBJ_PALETTE_8 | 0x20f,
    0xc8, 0x1f4, OBJ_PALETTE_8 | 0x210,
    0xe0, OBJ_SIZE_16x16 | 0x1ec, OBJ_PALETTE_8 | 0x20c
};

static const u16 sSaXOam_2a9288[OAM_DATA_SIZE(12)] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_SIZE_32x16 | 0x1e7, OBJ_PALETTE_8 | 0x200,
    0xc8, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1e7, OBJ_PALETTE_8 | 0x204,
    0xd8, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x20e,
    0xe8, 0xf, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf0, 0xf, OBJ_PALETTE_8 | 0x212,
    0xf8, 0x1e7, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ef, OBJ_PALETTE_8 | 0x213,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ff, OBJ_PALETTE_8 | 0x215,
    0xc0, 0x1f7, OBJ_PALETTE_8 | 0x219,
    0xdd, OBJ_SIZE_16x16 | 0x1e6, OBJ_PALETTE_8 | 0x210
};

static const u16 sSaXOam_2a92d2[OAM_DATA_SIZE(12)] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_SIZE_32x16 | 0x1e7, OBJ_PALETTE_8 | 0x200,
    0xc8, OBJ_SIZE_16x16 | 0x7, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1e7, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x7, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ef, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf0, 0xf, OBJ_PALETTE_8 | 0x211,
    0xf8, 0x1e7, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ef, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ff, OBJ_PALETTE_8 | 0x214,
    0xe8, 0xf, OBJ_PALETTE_8 | 0x217,
    0xc0, 0x1f7, OBJ_PALETTE_8 | 0x218,
    0xe0, OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_2a931c[OAM_DATA_SIZE(12)] = {
    12,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x200,
    0xc8, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xc0, 0x1f8, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xc0, 0x8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xe2, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x208,
    0xd8, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x6, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1ea, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1e8, OBJ_PALETTE_8 | 0x20c,
    0xf0, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x214
};

static const u16 sSaXOam_2a9366[OAM_DATA_SIZE(6)] = {
    6,
    0xea, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xe5, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f3, OBJ_PALETTE_8 | 0x202,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xed, 0x0, OBJ_PALETTE_8 | 0x208,
    0xe7, 0x1ff, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_2a938c[OAM_DATA_SIZE(7)] = {
    7,
    0xe1, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xf1, 0x0, OBJ_PALETTE_8 | 0x207,
    0xe1, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x204,
    0xd9, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xe2, 0x4, OBJ_PALETTE_8 | 0x206,
    0xf2, 0x4, OBJ_PALETTE_8 | 0x209
};

static const u16 sSaXOam_2a93b8[OAM_DATA_SIZE(8)] = {
    8,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xd8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x207,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe8, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_8 | 0x209,
    0xf8, OBJ_X_FLIP | 0x1f5, OBJ_PALETTE_8 | 0x20b,
    0xe2, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2a93ea[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xe5, 0x1f2, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f3, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x3, OBJ_PALETTE_8 | 0x20b,
    0xf8, OBJ_X_FLIP | 0x1f4, OBJ_PALETTE_8 | 0x20d,
    0xe1, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2a9410[OAM_DATA_SIZE(5)] = {
    5,
    0xdd, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x208,
    0xdd, OBJ_SIZE_16x16 | 0x4, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_2a9430[OAM_DATA_SIZE(5)] = {
    5,
    0xdd, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x208,
    0xdc, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_2a9450[OAM_DATA_SIZE(8)] = {
    8,
    0xde, OBJ_SIZE_16x16 | 0x1ef, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xee, 0x1ef, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x208,
    0xf8, OBJ_X_FLIP | 0x1ec, OBJ_PALETTE_8 | 0x212,
    0xc8, OBJ_X_FLIP | 0x4, OBJ_PALETTE_8 | 0x213,
    0xe0, OBJ_SIZE_16x16 | 0x5, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_2a9482[OAM_DATA_SIZE(15)] = {
    15,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1e4, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1ec, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f9, OBJ_PALETTE_8 | 0x208,
    0xd8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x212,
    0xe8, OBJ_X_FLIP | 0x1e9, OBJ_PALETTE_8 | 0x21f,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1e9, OBJ_PALETTE_8 | 0x216,
    0xf8, OBJ_X_FLIP | 0x11, OBJ_PALETTE_8 | 0x237,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x219,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x21b,
    0xc0, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x238,
    0xdb, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xeb, 0x6, OBJ_PALETTE_8 | 0x21d
};

static const u16 sSaXOam_2a94de[OAM_DATA_SIZE(15)] = {
    15,
    0xd9, OBJ_SIZE_16x16 | 0x1ed, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1ed, OBJ_PALETTE_8 | 0x214,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    0xc8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e9, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f9, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xd8, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f1, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xf0, OBJ_X_FLIP | 0x1e9, OBJ_PALETTE_8 | 0x213,
    0xf8, OBJ_X_FLIP | 0x11, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f1, OBJ_PALETTE_8 | 0x218,
    0xe8, OBJ_X_FLIP | 0x1e9, OBJ_PALETTE_8 | 0x21d,
    0xc0, OBJ_X_FLIP | 0x1, OBJ_PALETTE_8 | 0x21e,
    0xdc, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xec, 0x6, OBJ_PALETTE_8 | 0x21a
};

static const u16 sSaXOam_2a953a[OAM_DATA_SIZE(16)] = {
    16,
    0xd3, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_VERTICAL | 0xd3, 0x1f7, OBJ_PALETTE_8 | 0x216,
    0xe3, OBJ_SIZE_16x16 | 0x1e7, OBJ_PALETTE_8 | 0x20e,
    OBJ_SHAPE_VERTICAL | 0xe3, 0x1f7, OBJ_PALETTE_8 | 0x217,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    0xc8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x210,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x218,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_X_FLIP | 0x1e8, OBJ_PALETTE_8 | 0x21a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x6, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f6, OBJ_PALETTE_8 | 0x21e,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1e8, OBJ_PALETTE_8 | 0x212,
    0xde, OBJ_SIZE_16x16 | 0x8, OBJ_PALETTE_8 | 0x214,
    0xee, 0x8, OBJ_PALETTE_8 | 0x238,
    0xee, 0x10, OBJ_PALETTE_8 | 0x239
};

const struct SaXAnimationData sSaXAnim_Standing_Left_DiagonalUp[4] = {
    [0] = {
        .pGraphics = sSaXGfx_29b3bc,
        .pOamFrame = sSaXOam_2a8a6c,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_29b65e,
        .pOamFrame = sSaXOam_2a8a6c,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_29b900,
        .pOamFrame = sSaXOam_2a8a6c,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Left_DiagonalUp[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29bba2,
        .pOamFrame = sSaXOam_2a8a98,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_29b65e,
        .pOamFrame = sSaXOam_2a8a6c,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Left_DiagonalDown[4] = {
    [0] = {
        .pGraphics = sSaXGfx_29be44,
        .pOamFrame = sSaXOam_2a8ac4,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_29c106,
        .pOamFrame = sSaXOam_2a8ac4,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_29c3c8,
        .pOamFrame = sSaXOam_2a8ac4,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Left_DiagonalDown[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29c68a,
        .pOamFrame = sSaXOam_2a8af0,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_29c106,
        .pOamFrame = sSaXOam_2a8ac4,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Right_DiagonalUp[4] = {
    [0] = {
        .pGraphics = sSaXGfx_29c94c,
        .pOamFrame = sSaXOam_2a8b1c,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_29cbee,
        .pOamFrame = sSaXOam_2a8b4e,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_29ce90,
        .pOamFrame = sSaXOam_2a8b1c,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Right_DiagonalUp[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29d132,
        .pOamFrame = sSaXOam_2a8b80,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_29cbee,
        .pOamFrame = sSaXOam_2a8b4e,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Right_DiagonalDown[4] = {
    [0] = {
        .pGraphics = sSaXGfx_29d414,
        .pOamFrame = sSaXOam_2a8bb2,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_29d6d6,
        .pOamFrame = sSaXOam_2a8bde,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_29da18,
        .pOamFrame = sSaXOam_2a8bde,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Right_DiagonalDown[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29dd5a,
        .pOamFrame = sSaXOam_2a8c10,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_29d6d6,
        .pOamFrame = sSaXOam_2a8bde,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Turning_Left_DiagonalUp[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29e09c,
        .pOamFrame = sSaXOam_2a8c42,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_29e25e,
        .pOamFrame = sSaXOam_2a8c62,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Turning_Right_DiagonalUp[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29e25e,
        .pOamFrame = sSaXOam_2a8c62,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_29e09c,
        .pOamFrame = sSaXOam_2a8c42,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Turning_Left_DiagonalDown[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29e400,
        .pOamFrame = sSaXOam_2a8c82,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_29e602,
        .pOamFrame = sSaXOam_2a8ca8,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Turning_Right_DiagonalDown[3] = {
    [0] = {
        .pGraphics = sSaXGfx_29e602,
        .pOamFrame = sSaXOam_2a8ca8,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_29e400,
        .pOamFrame = sSaXOam_2a8c82,
        .timer = 2
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Landing_Left[4] = {
    [0] = {
        .pGraphics = sSaXGfx_29e804,
        .pOamFrame = sSaXOam_2a8cce,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_29ea46,
        .pOamFrame = sSaXOam_2a8cf4,
        .timer = 2
    },
    [2] = {
        .pGraphics = sSaXGfx_29ec88,
        .pOamFrame = sSaXOam_2a8d1a,
        .timer = 2
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Landing_Right[4] = {
    [0] = {
        .pGraphics = sSaXGfx_29eeca,
        .pOamFrame = sSaXOam_2a8d46,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_29f08c,
        .pOamFrame = sSaXOam_2a8d66,
        .timer = 2
    },
    [2] = {
        .pGraphics = sSaXGfx_29f28e,
        .pOamFrame = sSaXOam_2a8d8c,
        .timer = 2
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Falling_Left[2] = {
    [0] = {
        .pGraphics = sSaXGfx_29f490,
        .pOamFrame = sSaXOam_2a8db8,
        .timer = 4
    },
    [1] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_GettingHurt_Left[2] = {
    [0] = {
        .pGraphics = sSaXGfx_29f712,
        .pOamFrame = sSaXOam_2a8dde,
        .timer = 4
    },
    [1] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Falling_Right[2] = {
    [0] = {
        .pGraphics = sSaXGfx_29f914,
        .pOamFrame = sSaXOam_2a8e04,
        .timer = 4
    },
    [1] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_GettingHurt_Right[2] = {
    [0] = {
        .pGraphics = sSaXGfx_29fbf6,
        .pOamFrame = sSaXOam_2a8e30,
        .timer = 4
    },
    [1] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Left_DiagonalUp_Armed[4] = {
    [0] = {
        .pGraphics = sSaXGfx_29fe78,
        .pOamFrame = sSaXOam_2a8e5c,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_2a013a,
        .pOamFrame = sSaXOam_2a8e5c,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_2a03fc,
        .pOamFrame = sSaXOam_2a8e5c,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Left_DiagonalUp_Armed[3] = {
    [0] = {
        .pGraphics = sSaXGfx_2a06be,
        .pOamFrame = sSaXOam_2a8e8e,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_2a013a,
        .pOamFrame = sSaXOam_2a8e5c,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Left_DiagonalDown_Armed[4] = {
    [0] = {
        .pGraphics = sSaXGfx_2a0980,
        .pOamFrame = sSaXOam_2a8ec0,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_2a0c62,
        .pOamFrame = sSaXOam_2a8ec0,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_2a0f44,
        .pOamFrame = sSaXOam_2a8ec0,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Left_DiagonalDown_Armed[3] = {
    [0] = {
        .pGraphics = sSaXGfx_2a1226,
        .pOamFrame = sSaXOam_2a8ef2,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_2a0c62,
        .pOamFrame = sSaXOam_2a8ec0,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Right_DiagonalUp_Armed[4] = {
    [0] = {
        .pGraphics = sSaXGfx_2a1508,
        .pOamFrame = sSaXOam_2a8f24,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_2a17ca,
        .pOamFrame = sSaXOam_2a8f5c,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_2a1a8c,
        .pOamFrame = sSaXOam_2a8f94,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Right_DiagonalUp_Armed[3] = {
    [0] = {
        .pGraphics = sSaXGfx_2a1d4e,
        .pOamFrame = sSaXOam_2a8fcc,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_2a17ca,
        .pOamFrame = sSaXOam_2a8f5c,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Standing_Right_DiagonalDown_Armed[4] = {
    [0] = {
        .pGraphics = sSaXGfx_2a2050,
        .pOamFrame = sSaXOam_2a9004,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_2a2332,
        .pOamFrame = sSaXOam_2a9036,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_2a2694,
        .pOamFrame = sSaXOam_2a9036,
        .timer = 16
    },
    [3] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Shooting_Right_DiagonalDown_Armed[3] = {
    [0] = {
        .pGraphics = sSaXGfx_2a29f6,
        .pOamFrame = sSaXOam_2a906e,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_2a2332,
        .pOamFrame = sSaXOam_2a9036,
        .timer = 4
    },
    [2] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Kneeling_Left[5] = {
    [0] = {
        .pGraphics = sSaXGfx_2a2d58,
        .pOamFrame = sSaXOam_2a90a6,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_2a2f5a,
        .pOamFrame = sSaXOam_2a90d2,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_2a313c,
        .pOamFrame = sSaXOam_2a90f8,
        .timer = 16
    },
    [3] = {
        .pGraphics = sSaXGfx_2a2f5a,
        .pOamFrame = sSaXOam_2a90d2,
        .timer = 16
    },
    [4] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Kneeling_Right[5] = {
    [0] = {
        .pGraphics = sSaXGfx_2a331e,
        .pOamFrame = sSaXOam_2a911e,
        .timer = 16
    },
    [1] = {
        .pGraphics = sSaXGfx_2a3520,
        .pOamFrame = sSaXOam_2a914a,
        .timer = 16
    },
    [2] = {
        .pGraphics = sSaXGfx_2a36c2,
        .pOamFrame = sSaXOam_2a9170,
        .timer = 16
    },
    [3] = {
        .pGraphics = sSaXGfx_2a3520,
        .pOamFrame = sSaXOam_2a914a,
        .timer = 16
    },
    [4] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_TransformingIntoMonster_Left[35] = {
    [0] = {
        .pGraphics = sSaXGfx_2a2d58,
        .pOamFrame = sSaXOam_2a90a6,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_2a3864,
        .pOamFrame = sSaXOam_2a9196,
        .timer = 4
    },
    [2] = {
        .pGraphics = sSaXGfx_2a2d58,
        .pOamFrame = sSaXOam_2a90a6,
        .timer = 4
    },
    [3] = {
        .pGraphics = sSaXGfx_2a3864,
        .pOamFrame = sSaXOam_2a9196,
        .timer = 4
    },
    [4] = {
        .pGraphics = sSaXGfx_2a3a86,
        .pOamFrame = sSaXOam_2a91b6,
        .timer = 4
    },
    [5] = {
        .pGraphics = sSaXGfx_2a3864,
        .pOamFrame = sSaXOam_2a9196,
        .timer = 4
    },
    [6] = {
        .pGraphics = sSaXGfx_2a3a86,
        .pOamFrame = sSaXOam_2a91b6,
        .timer = 4
    },
    [7] = {
        .pGraphics = sSaXGfx_2a3cc8,
        .pOamFrame = sSaXOam_2a91dc,
        .timer = 4
    },
    [8] = {
        .pGraphics = sSaXGfx_2a3a86,
        .pOamFrame = sSaXOam_2a91b6,
        .timer = 4
    },
    [9] = {
        .pGraphics = sSaXGfx_2a3cc8,
        .pOamFrame = sSaXOam_2a91dc,
        .timer = 4
    },
    [10] = {
        .pGraphics = sSaXGfx_2a3f2a,
        .pOamFrame = sSaXOam_2a9208,
        .timer = 4
    },
    [11] = {
        .pGraphics = sSaXGfx_2a420c,
        .pOamFrame = sSaXOam_2a9228,
        .timer = 4
    },
    [12] = {
        .pGraphics = sSaXGfx_2a3f2a,
        .pOamFrame = sSaXOam_2a9208,
        .timer = 4
    },
    [13] = {
        .pGraphics = sSaXGfx_2a420c,
        .pOamFrame = sSaXOam_2a9228,
        .timer = 4
    },
    [14] = {
        .pGraphics = sSaXGfx_2a3f2a,
        .pOamFrame = sSaXOam_2a9208,
        .timer = 4
    },
    [15] = {
        .pGraphics = sSaXGfx_2a420c,
        .pOamFrame = sSaXOam_2a9228,
        .timer = 4
    },
    [16] = {
        .pGraphics = sSaXGfx_2a458e,
        .pOamFrame = sSaXOam_2a9242,
        .timer = 4
    },
    [17] = {
        .pGraphics = sSaXGfx_2a420c,
        .pOamFrame = sSaXOam_2a9228,
        .timer = 4
    },
    [18] = {
        .pGraphics = sSaXGfx_2a458e,
        .pOamFrame = sSaXOam_2a9242,
        .timer = 4
    },
    [19] = {
        .pGraphics = sSaXGfx_2a4910,
        .pOamFrame = sSaXOam_2a925c,
        .timer = 5
    },
    [20] = {
        .pGraphics = sSaXGfx_2a458e,
        .pOamFrame = sSaXOam_2a9242,
        .timer = 5
    },
    [21] = {
        .pGraphics = sSaXGfx_2a4910,
        .pOamFrame = sSaXOam_2a925c,
        .timer = 5
    },
    [22] = {
        .pGraphics = sSaXGfx_2a458e,
        .pOamFrame = sSaXOam_2a9242,
        .timer = 5
    },
    [23] = {
        .pGraphics = sSaXGfx_2a4910,
        .pOamFrame = sSaXOam_2a925c,
        .timer = 5
    },
    [24] = {
        .pGraphics = sSaXGfx_2a4d12,
        .pOamFrame = sSaXOam_2a9288,
        .timer = 5
    },
    [25] = {
        .pGraphics = sSaXGfx_2a4910,
        .pOamFrame = sSaXOam_2a925c,
        .timer = 5
    },
    [26] = {
        .pGraphics = sSaXGfx_2a4d12,
        .pOamFrame = sSaXOam_2a9288,
        .timer = 5
    },
    [27] = {
        .pGraphics = sSaXGfx_2a4910,
        .pOamFrame = sSaXOam_2a925c,
        .timer = 5
    },
    [28] = {
        .pGraphics = sSaXGfx_2a4d12,
        .pOamFrame = sSaXOam_2a9288,
        .timer = 5
    },
    [29] = {
        .pGraphics = sSaXGfx_2a52b4,
        .pOamFrame = sSaXOam_2a92d2,
        .timer = 5
    },
    [30] = {
        .pGraphics = sSaXGfx_2a5816,
        .pOamFrame = sSaXOam_2a931c,
        .timer = 5
    },
    [31] = {
        .pGraphics = sSaXGfx_2a4d12,
        .pOamFrame = sSaXOam_2a9288,
        .timer = 5
    },
    [32] = {
        .pGraphics = sSaXGfx_2a52b4,
        .pOamFrame = sSaXOam_2a92d2,
        .timer = 5
    },
    [33] = {
        .pGraphics = sSaXGfx_2a5816,
        .pOamFrame = sSaXOam_2a931c,
        .timer = 5
    },
    [34] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_TransformingIntoMonster_Right[35] = {
    [0] = {
        .pGraphics = sSaXGfx_2a331e,
        .pOamFrame = sSaXOam_2a911e,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_2a5ed8,
        .pOamFrame = sSaXOam_2a9366,
        .timer = 4
    },
    [2] = {
        .pGraphics = sSaXGfx_2a331e,
        .pOamFrame = sSaXOam_2a911e,
        .timer = 4
    },
    [3] = {
        .pGraphics = sSaXGfx_2a5ed8,
        .pOamFrame = sSaXOam_2a9366,
        .timer = 4
    },
    [4] = {
        .pGraphics = sSaXGfx_2a613a,
        .pOamFrame = sSaXOam_2a938c,
        .timer = 4
    },
    [5] = {
        .pGraphics = sSaXGfx_2a5ed8,
        .pOamFrame = sSaXOam_2a9366,
        .timer = 4
    },
    [6] = {
        .pGraphics = sSaXGfx_2a613a,
        .pOamFrame = sSaXOam_2a938c,
        .timer = 4
    },
    [7] = {
        .pGraphics = sSaXGfx_2a635c,
        .pOamFrame = sSaXOam_2a93b8,
        .timer = 4
    },
    [8] = {
        .pGraphics = sSaXGfx_2a613a,
        .pOamFrame = sSaXOam_2a938c,
        .timer = 4
    },
    [9] = {
        .pGraphics = sSaXGfx_2a635c,
        .pOamFrame = sSaXOam_2a93b8,
        .timer = 4
    },
    [10] = {
        .pGraphics = sSaXGfx_2a65fe,
        .pOamFrame = sSaXOam_2a93ea,
        .timer = 4
    },
    [11] = {
        .pGraphics = sSaXGfx_2a6920,
        .pOamFrame = sSaXOam_2a9410,
        .timer = 4
    },
    [12] = {
        .pGraphics = sSaXGfx_2a65fe,
        .pOamFrame = sSaXOam_2a93ea,
        .timer = 4
    },
    [13] = {
        .pGraphics = sSaXGfx_2a6920,
        .pOamFrame = sSaXOam_2a9410,
        .timer = 4
    },
    [14] = {
        .pGraphics = sSaXGfx_2a65fe,
        .pOamFrame = sSaXOam_2a93ea,
        .timer = 4
    },
    [15] = {
        .pGraphics = sSaXGfx_2a6920,
        .pOamFrame = sSaXOam_2a9410,
        .timer = 4
    },
    [16] = {
        .pGraphics = sSaXGfx_2a6d22,
        .pOamFrame = sSaXOam_2a9430,
        .timer = 4
    },
    [17] = {
        .pGraphics = sSaXGfx_2a6920,
        .pOamFrame = sSaXOam_2a9410,
        .timer = 4
    },
    [18] = {
        .pGraphics = sSaXGfx_2a6d22,
        .pOamFrame = sSaXOam_2a9430,
        .timer = 4
    },
    [19] = {
        .pGraphics = sSaXGfx_2a7124,
        .pOamFrame = sSaXOam_2a9450,
        .timer = 5
    },
    [20] = {
        .pGraphics = sSaXGfx_2a6d22,
        .pOamFrame = sSaXOam_2a9430,
        .timer = 5
    },
    [21] = {
        .pGraphics = sSaXGfx_2a7124,
        .pOamFrame = sSaXOam_2a9450,
        .timer = 5
    },
    [22] = {
        .pGraphics = sSaXGfx_2a6d22,
        .pOamFrame = sSaXOam_2a9430,
        .timer = 5
    },
    [23] = {
        .pGraphics = sSaXGfx_2a7124,
        .pOamFrame = sSaXOam_2a9450,
        .timer = 5
    },
    [24] = {
        .pGraphics = sSaXGfx_2a75a6,
        .pOamFrame = sSaXOam_2a9482,
        .timer = 5
    },
    [25] = {
        .pGraphics = sSaXGfx_2a7124,
        .pOamFrame = sSaXOam_2a9450,
        .timer = 5
    },
    [26] = {
        .pGraphics = sSaXGfx_2a75a6,
        .pOamFrame = sSaXOam_2a9482,
        .timer = 5
    },
    [27] = {
        .pGraphics = sSaXGfx_2a7124,
        .pOamFrame = sSaXOam_2a9450,
        .timer = 5
    },
    [28] = {
        .pGraphics = sSaXGfx_2a75a6,
        .pOamFrame = sSaXOam_2a9482,
        .timer = 5
    },
    [29] = {
        .pGraphics = sSaXGfx_2a7cc8,
        .pOamFrame = sSaXOam_2a94de,
        .timer = 5
    },
    [30] = {
        .pGraphics = sSaXGfx_2a832a,
        .pOamFrame = sSaXOam_2a953a,
        .timer = 5
    },
    [31] = {
        .pGraphics = sSaXGfx_2a75a6,
        .pOamFrame = sSaXOam_2a9482,
        .timer = 5
    },
    [32] = {
        .pGraphics = sSaXGfx_2a7cc8,
        .pOamFrame = sSaXOam_2a94de,
        .timer = 5
    },
    [33] = {
        .pGraphics = sSaXGfx_2a832a,
        .pOamFrame = sSaXOam_2a953a,
        .timer = 5
    },
    [34] = SA_X_ANIM_TERMINATOR
};

static const u8 sSaXGfx_2a9d4c[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2a9d4c.gfx")
};

static const u8 sSaXGfx_2a9f4e[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2a9f4e.gfx")
};

static const u8 sSaXGfx_2aa150[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2aa150.gfx")
};

static const u8 sSaXGfx_2aa352[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2aa352.gfx")
};

static const u8 sSaXGfx_2aa554[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2aa554.gfx")
};

static const u8 sSaXGfx_2aa756[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2aa756.gfx")
};

static const u8 sSaXGfx_2aa958[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2aa958.gfx")
};

static const u8 sSaXGfx_2aab5a[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2aab5a.gfx")
};

static const u8 sSaXGfx_2aad5c[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2aad5c.gfx")
};

static const u8 sSaXGfx_2aaf5e[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2aaf5e.gfx")
};

static const u8 sSaXGfx_2ab160[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2ab160.gfx")
};

static const u8 sSaXGfx_2ab362[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2ab362.gfx")
};

static const u8 sSaXGfx_2ab564[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2ab564.gfx")
};

static const u8 sSaXGfx_2ab766[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2ab766.gfx")
};

static const u8 sSaXGfx_2ab968[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2ab968.gfx")
};

static const u8 sSaXGfx_2abb6a[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2abb6a.gfx")
};

static const u16 sSaXOam_2abd6c[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2abd7a[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe5, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf5, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

const struct SaXAnimationData sSaXAnim_MidAir_Left[9] = {
    [0] = {
        .pGraphics = sSaXGfx_2a9d4c,
        .pOamFrame = sSaXOam_2abd6c,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_2a9f4e,
        .pOamFrame = sSaXOam_2abd6c,
        .timer = 2
    },
    [2] = {
        .pGraphics = sSaXGfx_2aa150,
        .pOamFrame = sSaXOam_2abd6c,
        .timer = 2
    },
    [3] = {
        .pGraphics = sSaXGfx_2aa352,
        .pOamFrame = sSaXOam_2abd6c,
        .timer = 2
    },
    [4] = {
        .pGraphics = sSaXGfx_2aa554,
        .pOamFrame = sSaXOam_2abd6c,
        .timer = 2
    },
    [5] = {
        .pGraphics = sSaXGfx_2aa756,
        .pOamFrame = sSaXOam_2abd6c,
        .timer = 2
    },
    [6] = {
        .pGraphics = sSaXGfx_2aa958,
        .pOamFrame = sSaXOam_2abd6c,
        .timer = 2
    },
    [7] = {
        .pGraphics = sSaXGfx_2aab5a,
        .pOamFrame = sSaXOam_2abd6c,
        .timer = 2
    },
    [8] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_MidAir_Right[9] = {
    [0] = {
        .pGraphics = sSaXGfx_2aad5c,
        .pOamFrame = sSaXOam_2abd7a,
        .timer = 2
    },
    [1] = {
        .pGraphics = sSaXGfx_2aaf5e,
        .pOamFrame = sSaXOam_2abd7a,
        .timer = 2
    },
    [2] = {
        .pGraphics = sSaXGfx_2ab160,
        .pOamFrame = sSaXOam_2abd7a,
        .timer = 2
    },
    [3] = {
        .pGraphics = sSaXGfx_2ab362,
        .pOamFrame = sSaXOam_2abd7a,
        .timer = 2
    },
    [4] = {
        .pGraphics = sSaXGfx_2ab564,
        .pOamFrame = sSaXOam_2abd7a,
        .timer = 2
    },
    [5] = {
        .pGraphics = sSaXGfx_2ab766,
        .pOamFrame = sSaXOam_2abd7a,
        .timer = 2
    },
    [6] = {
        .pGraphics = sSaXGfx_2ab968,
        .pOamFrame = sSaXOam_2abd7a,
        .timer = 2
    },
    [7] = {
        .pGraphics = sSaXGfx_2abb6a,
        .pOamFrame = sSaXOam_2abd7a,
        .timer = 2
    },
    [8] = SA_X_ANIM_TERMINATOR
};

static const u8 sSaXGfx_2abe60[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/2abe60.gfx")
};

static const u8 sSaXGfx_2ac082[SA_X_GFX_SIZE(10, 7)] = {
    10, 7,
    _INCBIN_U8("data/sa_x/2ac082.gfx")
};

static const u8 sSaXGfx_2ac2a4[SA_X_GFX_SIZE(10, 8)] = {
    10, 8,
    _INCBIN_U8("data/sa_x/2ac2a4.gfx")
};

static const u8 sSaXGfx_2ac4e6[SA_X_GFX_SIZE(10, 7)] = {
    10, 7,
    _INCBIN_U8("data/sa_x/2ac4e6.gfx")
};

static const u8 sSaXGfx_2ac708[SA_X_GFX_SIZE(10, 7)] = {
    10, 7,
    _INCBIN_U8("data/sa_x/2ac708.gfx")
};

static const u8 sSaXGfx_2ac92a[SA_X_GFX_SIZE(10, 8)] = {
    10, 8,
    _INCBIN_U8("data/sa_x/2ac92a.gfx")
};

static const u8 sSaXGfx_2acb6c[SA_X_GFX_SIZE(10, 8)] = {
    10, 8,
    _INCBIN_U8("data/sa_x/2acb6c.gfx")
};

static const u8 sSaXGfx_2acdae[SA_X_GFX_SIZE(12, 8)] = {
    12, 8,
    _INCBIN_U8("data/sa_x/2acdae.gfx")
};

static const u8 sSaXGfx_2ad030[SA_X_GFX_SIZE(12, 8)] = {
    12, 8,
    _INCBIN_U8("data/sa_x/2ad030.gfx")
};

static const u8 sSaXGfx_2ad2b2[SA_X_GFX_SIZE(11, 8)] = {
    11, 8,
    _INCBIN_U8("data/sa_x/2ad2b2.gfx")
};

static const u8 sSaXGfx_2ad514[SA_X_GFX_SIZE(11, 8)] = {
    11, 8,
    _INCBIN_U8("data/sa_x/2ad514.gfx")
};

static const u8 sSaXGfx_2ad776[SA_X_GFX_SIZE(11, 8)] = {
    11, 8,
    _INCBIN_U8("data/sa_x/2ad776.gfx")
};

static const u8 sSaXGfx_2ad9d8[SA_X_GFX_SIZE(12, 8)] = {
    12, 8,
    _INCBIN_U8("data/sa_x/2ad9d8.gfx")
};

static const u8 sSaXGfx_2adc5a[SA_X_GFX_SIZE(11, 8)] = {
    11, 8,
    _INCBIN_U8("data/sa_x/2adc5a.gfx")
};

static const u8 sSaXGfx_2adebc[SA_X_GFX_SIZE(12, 8)] = {
    12, 8,
    _INCBIN_U8("data/sa_x/2adebc.gfx")
};

static const u8 sSaXGfx_2ae13e[SA_X_GFX_SIZE(13, 10)] = {
    13, 10,
    _INCBIN_U8("data/sa_x/2ae13e.gfx")
};

static const u8 sSaXGfx_2ae420[SA_X_GFX_SIZE(13, 10)] = {
    13, 10,
    _INCBIN_U8("data/sa_x/2ae420.gfx")
};

static const u8 sSaXGfx_2ae702[SA_X_GFX_SIZE(15, 8)] = {
    15, 8,
    _INCBIN_U8("data/sa_x/2ae702.gfx")
};

static const u8 sSaXGfx_2ae9e4[SA_X_GFX_SIZE(15, 8)] = {
    15, 8,
    _INCBIN_U8("data/sa_x/2ae9e4.gfx")
};

static const u8 sSaXGfx_2aecc6[SA_X_GFX_SIZE(9, 6)] = {
    9, 6,
    _INCBIN_U8("data/sa_x/2aecc6.gfx")
};

static const u8 sSaXGfx_2aeea8[SA_X_GFX_SIZE(9, 9)] = {
    9, 9,
    _INCBIN_U8("data/sa_x/2aeea8.gfx")
};

static const u8 sSaXGfx_2af0ea[SA_X_GFX_SIZE(10, 9)] = {
    10, 9,
    _INCBIN_U8("data/sa_x/2af0ea.gfx")
};

static const u8 sSaXGfx_2af34c[SA_X_GFX_SIZE(12, 10)] = {
    12, 10,
    _INCBIN_U8("data/sa_x/2af34c.gfx")
};

static const u8 sSaXGfx_2af60e[SA_X_GFX_SIZE(9, 8)] = {
    9, 8,
    _INCBIN_U8("data/sa_x/2af60e.gfx")
};

static const u8 sSaXGfx_2af830[SA_X_GFX_SIZE(11, 8)] = {
    11, 8,
    _INCBIN_U8("data/sa_x/2af830.gfx")
};

static const u8 sSaXGfx_2afa92[SA_X_GFX_SIZE(11, 10)] = {
    11, 10,
    _INCBIN_U8("data/sa_x/2afa92.gfx")
};

static const u8 sSaXGfx_2afd34[SA_X_GFX_SIZE(11, 10)] = {
    11, 10,
    _INCBIN_U8("data/sa_x/2afd34.gfx")
};

static const u8 sSaXGfx_2affd6[SA_X_GFX_SIZE(11, 11)] = {
    11, 11,
    _INCBIN_U8("data/sa_x/2affd6.gfx")
};

static const u8 sSaXGfx_2b0298[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/2b0298.gfx")
};

static const u8 sSaXGfx_2b049a[SA_X_GFX_SIZE(8, 8)] = {
    8, 8,
    _INCBIN_U8("data/sa_x/2b049a.gfx")
};

static const u8 sSaXGfx_2b069c[SA_X_GFX_SIZE(10, 8)] = {
    10, 8,
    _INCBIN_U8("data/sa_x/2b069c.gfx")
};

static const u16 sSaXOam_2b08de[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x5, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1, OBJ_PALETTE_8 | 0x204,
    0xda, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xdd, 0x1f6, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x205
};

static const u16 sSaXOam_2b090a[OAM_DATA_SIZE(7)] = {
    7,
    0xe2, 0x5, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ff, OBJ_PALETTE_8 | 0x204,
    0xda, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1f5, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f6, OBJ_PALETTE_8 | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x6, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2b0936[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1ff, OBJ_PALETTE_8 | 0x204,
    0xdb, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1f4, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x5, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f9, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0962[OAM_DATA_SIZE(7)] = {
    7,
    0xdb, 0x1ff, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xd3, 0x7, OBJ_PALETTE_8 | 0x204,
    0xda, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xdc, 0x1f3, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f9, OBJ_PALETTE_8 | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2b098e[OAM_DATA_SIZE(7)] = {
    7,
    0xdc, 0x1fe, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xd5, 0x6, OBJ_PALETTE_8 | 0x204,
    0xda, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1f2, OBJ_PALETTE_8 | 0x205,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2b09ba[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xda, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    0xd4, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f9, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b09e0[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xdb, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x200,
    0xd6, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f9, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0a06[OAM_DATA_SIZE(7)] = {
    7,
    0xda, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xdd, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xda, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xd5, 0x1fd, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0a32[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1f5, OBJ_PALETTE_8 | 0x206,
    0xdb, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xd6, 0x1fe, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0a5e[OAM_DATA_SIZE(7)] = {
    7,
    0xdd, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    0xda, OBJ_SIZE_16x16 | 0x1fb, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xd8, 0x0, OBJ_PALETTE_8 | 0x206,
    0xd6, 0x1f4, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0a8a[OAM_DATA_SIZE(7)] = {
    7,
    0xde, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xda, 0x2, OBJ_PALETTE_8 | 0x206,
    0xd8, 0x1f7, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe9, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0ab6[OAM_DATA_SIZE(7)] = {
    7,
    0xdd, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xda, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1fe, OBJ_PALETTE_8 | 0x206,
    0xe3, 0x1f2, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f7, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0ae2[OAM_DATA_SIZE(8)] = {
    8,
    0xdd, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    0xda, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xda, 0x1, OBJ_PALETTE_8 | 0x206,
    0xe3, 0x1f4, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xe2, 0x1, OBJ_PALETTE_8 | 0x20b,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0b14[OAM_DATA_SIZE(7)] = {
    7,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xda, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xd9, 0x1ff, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207,
    0xe5, 0x1f6, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2b0b40[OAM_DATA_SIZE(8)] = {
    8,
    0xda, OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1f4, OBJ_PALETTE_8 | 0x206,
    0xdd, OBJ_SIZE_16x16 | 0x2, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x4, OBJ_PALETTE_8 | 0x207,
    0xe5, 0x1f6, OBJ_PALETTE_8 | 0x20a,
    0xe5, 0x2, OBJ_PALETTE_8 | 0x20b
};

static const u16 sSaXOam_2b0b72[OAM_DATA_SIZE(6)] = {
    6,
    0xe2, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x204,
    0xdd, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x206,
    0xda, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x208,
    0xdd, 0x1f7, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_2b0b98[OAM_DATA_SIZE(6)] = {
    6,
    0xe2, OBJ_SIZE_16x16 | 0x1, OBJ_PALETTE_8 | 0x204,
    0xdd, OBJ_SIZE_16x16 | 0x1fc, OBJ_PALETTE_8 | 0x206,
    0xda, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x208,
    0xde, 0x1f5, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_2b0bbe[OAM_DATA_SIZE(8)] = {
    8,
    0xe6, OBJ_SIZE_16x16 | 0x6, OBJ_PALETTE_8 | 0x204,
    0xe3, 0x3, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1ff, OBJ_PALETTE_8 | 0x208,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xde, 0x1f8, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xdf, 0x7, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_2b0bf0[OAM_DATA_SIZE(8)] = {
    8,
    0xe5, OBJ_SIZE_16x16 | 0x3, OBJ_PALETTE_8 | 0x204,
    0xe3, 0x1, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xdf, 0x1fd, OBJ_PALETTE_8 | 0x208,
    0xdc, OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x206,
    0xdf, 0x1f6, OBJ_PALETTE_8 | 0x20d,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe1, 0x4, OBJ_PALETTE_8 | 0x20e
};

static const u16 sSaXOam_2b0c22[OAM_DATA_SIZE(4)] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f4, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x4, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2b0c3c[OAM_DATA_SIZE(4)] = {
    4,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xe0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_2b0c56[OAM_DATA_SIZE(5)] = {
    5,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd8, 0x1f0, OBJ_PALETTE_8 | 0x209,
    0xe0, OBJ_SIZE_16x16 | 0x1f0, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sSaXOam_2b0c76[OAM_DATA_SIZE(4)] = {
    4,
    0xd0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f0, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2b0c90[OAM_DATA_SIZE(6)] = {
    6,
    0xd0, OBJ_SIZE_16x16 | 0x1fd, OBJ_PALETTE_8 | 0x200,
    0xd8, 0x1f5, OBJ_PALETTE_8 | 0x208,
    0xe0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_VERTICAL | 0xe0, 0x5, OBJ_PALETTE_8 | 0x206,
    0xf0, OBJ_SIZE_16x16 | 0x1f5, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_VERTICAL | 0xf0, 0x5, OBJ_PALETTE_8 | 0x207
};

static const u16 sSaXOam_2b0cb6[OAM_DATA_SIZE(5)] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xd0, 0x1fd, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f5, OBJ_PALETTE_8 | 0x204,
    0xf8, 0x1f5, OBJ_PALETTE_8 | 0x209,
    0xf8, 0x5, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2b0cd6[OAM_DATA_SIZE(4)] = {
    4,
    0xd0, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xd8, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2b0cf0[OAM_DATA_SIZE(4)] = {
    4,
    0xd2, OBJ_SIZE_16x16 | 0x0, OBJ_PALETTE_8 | 0x208,
    0xda, 0x1f8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe2, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2b0d0a[OAM_DATA_SIZE(4)] = {
    4,
    0xd2, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_VERTICAL | 0xd2, 0x8, OBJ_PALETTE_8 | 0x20a,
    OBJ_SHAPE_HORIZONTAL | 0xe2, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2b0d24[OAM_DATA_SIZE(4)] = {
    4,
    0xd8, OBJ_SIZE_16x16 | 0x1fe, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1f6, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1ee, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1fe, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2b0d3e[OAM_DATA_SIZE(2)] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xe2, OBJ_SIZE_32x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2b0d4c[OAM_DATA_SIZE(3)] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f0, OBJ_PALETTE_8 | 0x204
};

const struct SaXAnimationData sSaXAnim_ShootingRestrictedLaboratory[51] = {
    [0] = {
        .pGraphics = sSaXGfx_2ac92a,
        .pOamFrame = sSaXOam_2b09ba,
        .timer = 4
    },
    [1] = {
        .pGraphics = sSaXGfx_2acb6c,
        .pOamFrame = sSaXOam_2b09e0,
        .timer = 4
    },
    [2] = {
        .pGraphics = sSaXGfx_2ad2b2,
        .pOamFrame = sSaXOam_2b0a5e,
        .timer = 4
    },
    [3] = {
        .pGraphics = sSaXGfx_2ad514,
        .pOamFrame = sSaXOam_2b0a8a,
        .timer = 4
    },
    [4] = {
        .pGraphics = sSaXGfx_2ad2b2,
        .pOamFrame = sSaXOam_2b0a5e,
        .timer = 4
    },
    [5] = {
        .pGraphics = sSaXGfx_2ad514,
        .pOamFrame = sSaXOam_2b0a8a,
        .timer = 4
    },
    [6] = {
        .pGraphics = sSaXGfx_2ad2b2,
        .pOamFrame = sSaXOam_2b0a5e,
        .timer = 4
    },
    [7] = {
        .pGraphics = sSaXGfx_2acdae,
        .pOamFrame = sSaXOam_2b0a06,
        .timer = 4
    },
    [8] = {
        .pGraphics = sSaXGfx_2ac92a,
        .pOamFrame = sSaXOam_2b09ba,
        .timer = 4
    },
    [9] = {
        .pGraphics = sSaXGfx_2ac4e6,
        .pOamFrame = sSaXOam_2b0962,
        .timer = 4
    },
    [10] = {
        .pGraphics = sSaXGfx_2ac708,
        .pOamFrame = sSaXOam_2b098e,
        .timer = 4
    },
    [11] = {
        .pGraphics = sSaXGfx_2ac4e6,
        .pOamFrame = sSaXOam_2b0962,
        .timer = 4
    },
    [12] = {
        .pGraphics = sSaXGfx_2ac708,
        .pOamFrame = sSaXOam_2b098e,
        .timer = 4
    },
    [13] = {
        .pGraphics = sSaXGfx_2ac4e6,
        .pOamFrame = sSaXOam_2b0962,
        .timer = 4
    },
    [14] = {
        .pGraphics = sSaXGfx_2ac92a,
        .pOamFrame = sSaXOam_2b09ba,
        .timer = 4
    },
    [15] = {
        .pGraphics = sSaXGfx_2acb6c,
        .pOamFrame = sSaXOam_2b09e0,
        .timer = 4
    },
    [16] = {
        .pGraphics = sSaXGfx_2acdae,
        .pOamFrame = sSaXOam_2b0a06,
        .timer = 4
    },
    [17] = {
        .pGraphics = sSaXGfx_2ad030,
        .pOamFrame = sSaXOam_2b0a32,
        .timer = 4
    },
    [18] = {
        .pGraphics = sSaXGfx_2ad2b2,
        .pOamFrame = sSaXOam_2b0a5e,
        .timer = 4
    },
    [19] = {
        .pGraphics = sSaXGfx_2ad514,
        .pOamFrame = sSaXOam_2b0a8a,
        .timer = 4
    },
    [20] = {
        .pGraphics = sSaXGfx_2ad776,
        .pOamFrame = sSaXOam_2b0ab6,
        .timer = 4
    },
    [21] = {
        .pGraphics = sSaXGfx_2ad9d8,
        .pOamFrame = sSaXOam_2b0ae2,
        .timer = 4
    },
    [22] = {
        .pGraphics = sSaXGfx_2ad776,
        .pOamFrame = sSaXOam_2b0ab6,
        .timer = 4
    },
    [23] = {
        .pGraphics = sSaXGfx_2ad9d8,
        .pOamFrame = sSaXOam_2b0ae2,
        .timer = 4
    },
    [24] = {
        .pGraphics = sSaXGfx_2ad776,
        .pOamFrame = sSaXOam_2b0ab6,
        .timer = 4
    },
    [25] = {
        .pGraphics = sSaXGfx_2adc5a,
        .pOamFrame = sSaXOam_2b0b14,
        .timer = 8
    },
    [26] = {
        .pGraphics = sSaXGfx_2adebc,
        .pOamFrame = sSaXOam_2b0b40,
        .timer = 8
    },
    [27] = {
        .pGraphics = sSaXGfx_2ae13e,
        .pOamFrame = sSaXOam_2b0b72,
        .timer = 4
    },
    [28] = {
        .pGraphics = sSaXGfx_2ae420,
        .pOamFrame = sSaXOam_2b0b98,
        .timer = 4
    },
    [29] = {
        .pGraphics = sSaXGfx_2ae13e,
        .pOamFrame = sSaXOam_2b0b72,
        .timer = 4
    },
    [30] = {
        .pGraphics = sSaXGfx_2adc5a,
        .pOamFrame = sSaXOam_2b0b14,
        .timer = 8
    },
    [31] = {
        .pGraphics = sSaXGfx_2ad776,
        .pOamFrame = sSaXOam_2b0ab6,
        .timer = 4
    },
    [32] = {
        .pGraphics = sSaXGfx_2ad9d8,
        .pOamFrame = sSaXOam_2b0ae2,
        .timer = 4
    },
    [33] = {
        .pGraphics = sSaXGfx_2ad776,
        .pOamFrame = sSaXOam_2b0ab6,
        .timer = 4
    },
    [34] = {
        .pGraphics = sSaXGfx_2ad9d8,
        .pOamFrame = sSaXOam_2b0ae2,
        .timer = 4
    },
    [35] = {
        .pGraphics = sSaXGfx_2ad776,
        .pOamFrame = sSaXOam_2b0ab6,
        .timer = 4
    },
    [36] = {
        .pGraphics = sSaXGfx_2adc5a,
        .pOamFrame = sSaXOam_2b0b14,
        .timer = 8
    },
    [37] = {
        .pGraphics = sSaXGfx_2adebc,
        .pOamFrame = sSaXOam_2b0b40,
        .timer = 8
    },
    [38] = {
        .pGraphics = sSaXGfx_2ae13e,
        .pOamFrame = sSaXOam_2b0b72,
        .timer = 4
    },
    [39] = {
        .pGraphics = sSaXGfx_2ae420,
        .pOamFrame = sSaXOam_2b0b98,
        .timer = 4
    },
    [40] = {
        .pGraphics = sSaXGfx_2ae13e,
        .pOamFrame = sSaXOam_2b0b72,
        .timer = 4
    },
    [41] = {
        .pGraphics = sSaXGfx_2ae702,
        .pOamFrame = sSaXOam_2b0bbe,
        .timer = 4
    },
    [42] = {
        .pGraphics = sSaXGfx_2ae9e4,
        .pOamFrame = sSaXOam_2b0bf0,
        .timer = 4
    },
    [43] = {
        .pGraphics = sSaXGfx_2ae702,
        .pOamFrame = sSaXOam_2b0bbe,
        .timer = 4
    },
    [44] = {
        .pGraphics = sSaXGfx_2abe60,
        .pOamFrame = sSaXOam_2b08de,
        .timer = 4
    },
    [45] = {
        .pGraphics = sSaXGfx_2ac082,
        .pOamFrame = sSaXOam_2b090a,
        .timer = 4
    },
    [46] = {
        .pGraphics = sSaXGfx_2ac2a4,
        .pOamFrame = sSaXOam_2b0936,
        .timer = 4
    },
    [47] = {
        .pGraphics = sSaXGfx_2ac4e6,
        .pOamFrame = sSaXOam_2b0962,
        .timer = 4
    },
    [48] = {
        .pGraphics = sSaXGfx_2ac708,
        .pOamFrame = sSaXOam_2b098e,
        .timer = 4
    },
    [49] = {
        .pGraphics = sSaXGfx_2ac4e6,
        .pOamFrame = sSaXOam_2b0962,
        .timer = 4
    },
    [50] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_CoveredByMetroids[23] = {
    [0] = {
        .pGraphics = sSaXGfx_2af34c,
        .pOamFrame = sSaXOam_2b0c76,
        .timer = 6
    },
    [1] = {
        .pGraphics = sSaXGfx_2af60e,
        .pOamFrame = sSaXOam_2b0c90,
        .timer = 6
    },
    [2] = {
        .pGraphics = sSaXGfx_2af830,
        .pOamFrame = sSaXOam_2b0cb6,
        .timer = 6
    },
    [3] = {
        .pGraphics = sSaXGfx_2af60e,
        .pOamFrame = sSaXOam_2b0c90,
        .timer = 6
    },
    [4] = {
        .pGraphics = sSaXGfx_2af0ea,
        .pOamFrame = sSaXOam_2b0c56,
        .timer = 6
    },
    [5] = {
        .pGraphics = sSaXGfx_2aecc6,
        .pOamFrame = sSaXOam_2b0c22,
        .timer = 12
    },
    [6] = {
        .pGraphics = sSaXGfx_2aeea8,
        .pOamFrame = sSaXOam_2b0c3c,
        .timer = 8
    },
    [7] = {
        .pGraphics = sSaXGfx_2af0ea,
        .pOamFrame = sSaXOam_2b0c56,
        .timer = 8
    },
    [8] = {
        .pGraphics = sSaXGfx_2af34c,
        .pOamFrame = sSaXOam_2b0c76,
        .timer = 8
    },
    [9] = {
        .pGraphics = sSaXGfx_2af60e,
        .pOamFrame = sSaXOam_2b0c90,
        .timer = 8
    },
    [10] = {
        .pGraphics = sSaXGfx_2af830,
        .pOamFrame = sSaXOam_2b0cb6,
        .timer = 6
    },
    [11] = {
        .pGraphics = sSaXGfx_2afa92,
        .pOamFrame = sSaXOam_2b0cd6,
        .timer = 6
    },
    [12] = {
        .pGraphics = sSaXGfx_2afd34,
        .pOamFrame = sSaXOam_2b0cf0,
        .timer = 3
    },
    [13] = {
        .pGraphics = sSaXGfx_2affd6,
        .pOamFrame = sSaXOam_2b0d0a,
        .timer = 3
    },
    [14] = {
        .pGraphics = sSaXGfx_2afd34,
        .pOamFrame = sSaXOam_2b0cf0,
        .timer = 3
    },
    [15] = {
        .pGraphics = sSaXGfx_2affd6,
        .pOamFrame = sSaXOam_2b0d0a,
        .timer = 3
    },
    [16] = {
        .pGraphics = sSaXGfx_2afd34,
        .pOamFrame = sSaXOam_2b0cf0,
        .timer = 3
    },
    [17] = {
        .pGraphics = sSaXGfx_2affd6,
        .pOamFrame = sSaXOam_2b0d0a,
        .timer = 3
    },
    [18] = {
        .pGraphics = sSaXGfx_2b0298,
        .pOamFrame = sSaXOam_2b0d24,
        .timer = 10
    },
    [19] = {
        .pGraphics = sSaXGfx_2b049a,
        .pOamFrame = sSaXOam_2b0d3e,
        .timer = 4
    },
    [20] = {
        .pGraphics = sSaXGfx_2b069c,
        .pOamFrame = sSaXOam_2b0d4c,
        .timer = 4
    },
    [21] = {
        .pGraphics = sSaXGfx_2aeea8,
        .pOamFrame = sSaXOam_2b0c3c,
        .timer = 8
    },
    [22] = SA_X_ANIM_TERMINATOR
};

static const u8 sSaXGfx_2b10d8[SA_X_GFX_SIZE(10, 6)] = {
    10, 6,
    _INCBIN_U8("data/sa_x/2b10d8.gfx")
};

static const u8 sSaXGfx_2b12da[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/2b12da.gfx")
};

static const u8 sSaXGfx_2b14fc[SA_X_GFX_SIZE(12, 6)] = {
    12, 6,
    _INCBIN_U8("data/sa_x/2b14fc.gfx")
};

static const u8 sSaXGfx_2b173e[SA_X_GFX_SIZE(12, 6)] = {
    12, 6,
    _INCBIN_U8("data/sa_x/2b173e.gfx")
};

static const u8 sSaXGfx_2b1980[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/2b1980.gfx")
};

static const u8 sSaXGfx_2b1ba2[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/2b1ba2.gfx")
};

static const u8 sSaXGfx_2b1dc4[SA_X_GFX_SIZE(13, 8)] = {
    13, 8,
    _INCBIN_U8("data/sa_x/2b1dc4.gfx")
};

static const u8 sSaXGfx_2b2066[SA_X_GFX_SIZE(13, 8)] = {
    13, 8,
    _INCBIN_U8("data/sa_x/2b2066.gfx")
};

static const u8 sSaXGfx_2b2308[SA_X_GFX_SIZE(13, 8)] = {
    13, 8,
    _INCBIN_U8("data/sa_x/2b2308.gfx")
};

static const u8 sSaXGfx_2b25aa[SA_X_GFX_SIZE(11, 6)] = {
    11, 6,
    _INCBIN_U8("data/sa_x/2b25aa.gfx")
};

static const u8 sSaXGfx_2b27cc[SA_X_GFX_SIZE(9, 5)] = {
    9, 5,
    _INCBIN_U8("data/sa_x/2b27cc.gfx")
};

static const u8 sSaXGfx_2b298e[SA_X_GFX_SIZE(10, 5)] = {
    10, 5,
    _INCBIN_U8("data/sa_x/2b298e.gfx")
};

static const u8 sSaXGfx_2b2b70[SA_X_GFX_SIZE(11, 5)] = {
    11, 5,
    _INCBIN_U8("data/sa_x/2b2b70.gfx")
};

static const u8 sSaXGfx_2b2d72[SA_X_GFX_SIZE(11, 5)] = {
    11, 5,
    _INCBIN_U8("data/sa_x/2b2d72.gfx")
};

static const u8 sSaXGfx_2b2f74[SA_X_GFX_SIZE(10, 5)] = {
    10, 5,
    _INCBIN_U8("data/sa_x/2b2f74.gfx")
};

static const u8 sSaXGfx_2b3156[SA_X_GFX_SIZE(10, 5)] = {
    10, 5,
    _INCBIN_U8("data/sa_x/2b3156.gfx")
};

static const u8 sSaXGfx_2b3338[SA_X_GFX_SIZE(12, 7)] = {
    12, 7,
    _INCBIN_U8("data/sa_x/2b3338.gfx")
};

static const u8 sSaXGfx_2b359a[SA_X_GFX_SIZE(12, 7)] = {
    12, 7,
    _INCBIN_U8("data/sa_x/2b359a.gfx")
};

static const u8 sSaXGfx_2b37fc[SA_X_GFX_SIZE(12, 7)] = {
    12, 7,
    _INCBIN_U8("data/sa_x/2b37fc.gfx")
};

static const u8 sSaXGfx_2b3a5e[SA_X_GFX_SIZE(10, 5)] = {
    10, 5,
    _INCBIN_U8("data/sa_x/2b3a5e.gfx")
};

static const u16 sSaXOam_2b3c40[OAM_DATA_SIZE(6)] = {
    6,
    0xdb, 0x1fd, OBJ_PALETTE_8 | 0x208,
    0xde, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xe8, 0x1fc, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ec, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2b3c66[OAM_DATA_SIZE(7)] = {
    7,
    0xdb, 0x1fd, OBJ_PALETTE_8 | 0x208,
    0xde, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xe8, 0x1fb, OBJ_PALETTE_8 | 0x209,
    0xf0, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x202,
    0xf7, 0x6, OBJ_PALETTE_8 | 0x20a,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ec, OBJ_PALETTE_8 | 0x206
};

static const u16 sSaXOam_2b3c92[OAM_DATA_SIZE(7)] = {
    7,
    0xdc, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x6, OBJ_PALETTE_8 | 0x20b,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2b3cbe[OAM_DATA_SIZE(7)] = {
    7,
    0xdc, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f6, OBJ_PALETTE_8 | 0x206,
    0xf8, 0x6, OBJ_PALETTE_8 | 0x20b,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2b3cea[OAM_DATA_SIZE(6)] = {
    6,
    0xdc, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2b3d10[OAM_DATA_SIZE(6)] = {
    6,
    0xdb, 0x1fd, OBJ_PALETTE_8 | 0x20a,
    0xde, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f9, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, 0x1f9, OBJ_PALETTE_8 | 0x206,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ec, OBJ_PALETTE_8 | 0x208
};

static const u16 sSaXOam_2b3d36[OAM_DATA_SIZE(6)] = {
    6,
    0xdb, 0x1fd, OBJ_PALETTE_8 | 0x20c,
    0xde, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x1ec, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2b3d5c[OAM_DATA_SIZE(6)] = {
    6,
    0xdc, 0x1fd, OBJ_PALETTE_8 | 0x20c,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ed, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, OBJ_PALETTE_8 | 0x208,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2b3d82[OAM_DATA_SIZE(6)] = {
    6,
    0xdc, 0x1fd, OBJ_PALETTE_8 | 0x20c,
    0xdf, OBJ_SIZE_16x16 | 0x1f4, OBJ_PALETTE_8 | 0x204,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f5, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1f5, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f6, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x1ec, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2b3da8[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x4, OBJ_PALETTE_8 | 0x205,
    0xdd, 0x1fb, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | 0x1fc, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202
};

static const u16 sSaXOam_2b3dce[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x4, OBJ_PALETTE_8 | 0x205,
    0xdd, 0x1fb, OBJ_PALETTE_8 | 0x207,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | 0x1fd, OBJ_PALETTE_8 | 0x208,
    0xf0, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x200,
    0xf7, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x209,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202
};

static const u16 sSaXOam_2b3dfa[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x205,
    0xde, 0x1fb, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x207,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    0xf8, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2b3e26[OAM_DATA_SIZE(7)] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x205,
    0xde, 0x1fb, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1fa, OBJ_PALETTE_8 | 0x207,
    0xf8, OBJ_X_FLIP | 0x1f2, OBJ_PALETTE_8 | 0x20a
};

static const u16 sSaXOam_2b3e52[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x205,
    0xde, 0x1fb, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x207,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202
};

static const u16 sSaXOam_2b3e78[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x4, OBJ_PALETTE_8 | 0x205,
    0xdd, 0x1fb, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1fe, OBJ_PALETTE_8 | 0x204,
    0xe8, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1f7, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xf8, OBJ_X_FLIP | 0x1f7, OBJ_PALETTE_8 | 0x207,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x202
};

static const u16 sSaXOam_2b3e9e[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe5, 0x4, OBJ_PALETTE_8 | 0x207,
    0xdd, 0x1fb, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xde, 0x1fe, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1f8, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1eb, OBJ_PALETTE_8 | 0x200,
    0xdb, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2b3ec4[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x207,
    0xde, 0x1fb, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1fe, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1f3, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x209,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204
};

static const u16 sSaXOam_2b3eea[OAM_DATA_SIZE(6)] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe6, 0x4, OBJ_PALETTE_8 | 0x207,
    0xde, 0x1fb, OBJ_PALETTE_8 | 0x20b,
    OBJ_SHAPE_VERTICAL | 0xdf, 0x1fe, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_X_FLIP | 0x1fb, OBJ_PALETTE_8 | 0x209,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_X_FLIP | OBJ_SIZE_32x16 | 0x1eb, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_X_FLIP | OBJ_SIZE_16x16 | 0x1fa, OBJ_PALETTE_8 | 0x204
};

const struct SaXAnimationData sSaXAnim_Walking_Left[11] = {
    [0] = {
        .pGraphics = sSaXGfx_2b10d8,
        .pOamFrame = sSaXOam_2b3c40,
        .timer = 6
    },
    [1] = {
        .pGraphics = sSaXGfx_2b12da,
        .pOamFrame = sSaXOam_2b3c66,
        .timer = 5
    },
    [2] = {
        .pGraphics = sSaXGfx_2b14fc,
        .pOamFrame = sSaXOam_2b3c92,
        .timer = 4
    },
    [3] = {
        .pGraphics = sSaXGfx_2b173e,
        .pOamFrame = sSaXOam_2b3cbe,
        .timer = 8
    },
    [4] = {
        .pGraphics = sSaXGfx_2b1980,
        .pOamFrame = sSaXOam_2b3cea,
        .timer = 6
    },
    [5] = {
        .pGraphics = sSaXGfx_2b1ba2,
        .pOamFrame = sSaXOam_2b3d10,
        .timer = 6
    },
    [6] = {
        .pGraphics = sSaXGfx_2b1dc4,
        .pOamFrame = sSaXOam_2b3d36,
        .timer = 5
    },
    [7] = {
        .pGraphics = sSaXGfx_2b2066,
        .pOamFrame = sSaXOam_2b3d5c,
        .timer = 4
    },
    [8] = {
        .pGraphics = sSaXGfx_2b2308,
        .pOamFrame = sSaXOam_2b3d82,
        .timer = 8
    },
    [9] = {
        .pGraphics = sSaXGfx_2b25aa,
        .pOamFrame = sSaXOam_2b3cea,
        .timer = 6
    },
    [10] = SA_X_ANIM_TERMINATOR
};

const struct SaXAnimationData sSaXAnim_Walking_Right[11] = {
    [0] = {
        .pGraphics = sSaXGfx_2b27cc,
        .pOamFrame = sSaXOam_2b3da8,
        .timer = 6
    },
    [1] = {
        .pGraphics = sSaXGfx_2b298e,
        .pOamFrame = sSaXOam_2b3dce,
        .timer = 5
    },
    [2] = {
        .pGraphics = sSaXGfx_2b2b70,
        .pOamFrame = sSaXOam_2b3dfa,
        .timer = 4
    },
    [3] = {
        .pGraphics = sSaXGfx_2b2d72,
        .pOamFrame = sSaXOam_2b3e26,
        .timer = 8
    },
    [4] = {
        .pGraphics = sSaXGfx_2b2f74,
        .pOamFrame = sSaXOam_2b3e52,
        .timer = 6
    },
    [5] = {
        .pGraphics = sSaXGfx_2b3156,
        .pOamFrame = sSaXOam_2b3e78,
        .timer = 6
    },
    [6] = {
        .pGraphics = sSaXGfx_2b3338,
        .pOamFrame = sSaXOam_2b3e9e,
        .timer = 5
    },
    [7] = {
        .pGraphics = sSaXGfx_2b359a,
        .pOamFrame = sSaXOam_2b3ec4,
        .timer = 4
    },
    [8] = {
        .pGraphics = sSaXGfx_2b37fc,
        .pOamFrame = sSaXOam_2b3eea,
        .timer = 8
    },
    [9] = {
        .pGraphics = sSaXGfx_2b3a5e,
        .pOamFrame = sSaXOam_2b3e52,
        .timer = 6
    },
    [10] = SA_X_ANIM_TERMINATOR
};

const struct SaXData sSaXData_Empty = {
    .screenFlag = 0,
    .pose = 2,
    .turning = 0,
    .diagonalAim = 0,
    .missilesArmed = 0,
    .paletteRow = 0,
    .mosaic = 0,
    .direction = 0x10,
    .xPosition = 0,
    .yPosition = 0,
    .xVelocity = 0,
    .yVelocity = 0,
    .animationDurationCounter = 0,
    .currentAnimationFrame = 0,
    .pTopGfx = NULL,
    .pBottomGfx = NULL,
    .topGfxLength = 0,
    .bottomGfxLength = 0,
    .pOamFrame = NULL
};

const struct SaXAnimationData* const sSaXOamDataPointers[SA_X_POSE_END][2] = {
    [SA_X_POSE_RUNNING] = {
        sSaXAnim_Running_Right,
        sSaXAnim_Running_Left
    },
    [SA_X_POSE_WALKING] = {
        sSaXAnim_Walking_Right,
        sSaXAnim_Walking_Left
    },
    [SA_X_POSE_STANDING] = {
        sSaXAnim_Standing_Right,
        sSaXAnim_Standing_Left
    },
    [SA_X_POSE_SHOOTING] = {
        sSaXAnim_Shooting_Right,
        sSaXAnim_Shooting_Left
    },
    [SA_X_POSE_TURNING] = {
        sSaXAnim_Turning_Right,
        sSaXAnim_Turning_Left
    },
    [SA_X_POSE_MID_AIR] = {
        sSaXAnim_MidAir_Right,
        sSaXAnim_MidAir_Left
    },
    [SA_X_POSE_LANDING] = {
        sSaXAnim_Landing_Right,
        sSaXAnim_Landing_Left
    },
    [SA_X_POSE_FALLING] = {
        sSaXAnim_Falling_Right,
        sSaXAnim_Falling_Left
    },
    [SA_X_POSE_GETTING_HURT] = {
        sSaXAnim_GettingHurt_Right,
        sSaXAnim_GettingHurt_Left
    },
    [SA_X_POSE_SHOOTING_RESTRICTED_LABORATORY] = {
        sSaXAnim_ShootingRestrictedLaboratory,
        sSaXAnim_ShootingRestrictedLaboratory
    },
    [SA_X_POSE_COVERED_BY_METROIDS] = {
        sSaXAnim_CoveredByMetroids,
        sSaXAnim_CoveredByMetroids
    },
    [SA_X_POSE_KNEELING] = {
        sSaXAnim_Kneeling_Right,
        sSaXAnim_Kneeling_Left
    },
    [SA_X_POSE_TRANSFORMING_INTO_MONSTER] = {
        sSaXAnim_TransformingIntoMonster_Right,
        sSaXAnim_TransformingIntoMonster_Left
    },
    [SA_X_POSE_MORPHING] = {
        sSaXAnim_Morphing_Right,
        sSaXAnim_Morphing_Left
    },
    [SA_X_POSE_UNMORPHING] = {
        sSaXAnim_Unmorphing_Right,
        sSaXAnim_Unmorphing_Left
    },
    [SA_X_POSE_MORPH_BALL] = {
        sSaXAnim_MorphBall_Right,
        sSaXAnim_MorphBall_Left
    },
    [SA_X_POSE_ROLLING] = {
        sSaXAnim_MorphBall_Right,
        sSaXAnim_MorphBall_Left
    },
    [SA_X_POSE_SWAG_WALK] = {
        sSaXAnim_SwagWalk_Right,
        sSaXAnim_SwagWalk_Left
    },
    [SA_X_POSE_TURNING_TOWARDS_CAMERA] = {
        sSaXAnim_TurningTowardsCamera,
        sSaXAnim_TurningTowardsCamera
    },
    [SA_X_POSE_TURNING_AWAY_FROM_CAMERA] = {
        sSaXAnim_TurningAwayFromCamera,
        sSaXAnim_TurningAwayFromCamera
    }
};

const struct SaXAnimationData* const sSaXOamDataPointers_Standing[DIAG_AIM_END][2] = {
    [DIAG_AIM_NONE] = {
        sSaXAnim_Standing_Right,
        sSaXAnim_Standing_Left
    },
    [DIAG_AIM_UP] = {
        sSaXAnim_Standing_Right_DiagonalUp,
        sSaXAnim_Standing_Left_DiagonalUp
    },
    [DIAG_AIM_DOWN] = {
        sSaXAnim_Standing_Right_DiagonalDown,
        sSaXAnim_Standing_Left_DiagonalDown
    }
};

const struct SaXAnimationData* const sSaXOamDataPointers_Standing_Armed[DIAG_AIM_END][2] = {
    [DIAG_AIM_NONE] = {
        sSaXAnim_Standing_Right_Armed,
        sSaXAnim_Standing_Left_Armed
    },
    [DIAG_AIM_UP] = {
        sSaXAnim_Standing_Right_DiagonalUp_Armed,
        sSaXAnim_Standing_Left_DiagonalUp_Armed
    },
    [DIAG_AIM_DOWN] = {
        sSaXAnim_Standing_Right_DiagonalDown_Armed,
        sSaXAnim_Standing_Left_DiagonalDown_Armed
    }
};

const struct SaXAnimationData* const sSaXOamDataPointers_Shooting[DIAG_AIM_END][2] = {
    [DIAG_AIM_NONE] = {
        sSaXAnim_Shooting_Right,
        sSaXAnim_Shooting_Left
    },
    [DIAG_AIM_UP] = {
        sSaXAnim_Shooting_Right_DiagonalUp,
        sSaXAnim_Shooting_Left_DiagonalUp
    },
    [DIAG_AIM_DOWN] = {
        sSaXAnim_Shooting_Right_DiagonalDown,
        sSaXAnim_Shooting_Left_DiagonalDown
    }
};

const struct SaXAnimationData* const sSaXOamDataPointers_Shooting_Armed[DIAG_AIM_END][2] = {
    [DIAG_AIM_NONE] = {
        sSaXAnim_Shooting_Right_Armed,
        sSaXAnim_Shooting_Left_Armed
    },
    [DIAG_AIM_UP] = {
        sSaXAnim_Shooting_Right_DiagonalUp_Armed,
        sSaXAnim_Shooting_Left_DiagonalUp_Armed
    },
    [DIAG_AIM_DOWN] = {
        sSaXAnim_Shooting_Right_DiagonalDown_Armed,
        sSaXAnim_Shooting_Left_DiagonalDown_Armed
    }
};

const struct SaXAnimationData* const sSaXOamDataPointers_Turning[DIAG_AIM_END][2] = {
    [DIAG_AIM_NONE] = {
        sSaXAnim_Turning_Right,
        sSaXAnim_Turning_Left
    },
    [DIAG_AIM_UP] = {
        sSaXAnim_Turning_Right_DiagonalUp,
        sSaXAnim_Turning_Left_DiagonalUp
    },
    [DIAG_AIM_DOWN] = {
        sSaXAnim_Turning_Right_DiagonalDown,
        sSaXAnim_Turning_Left_DiagonalDown
    }
};

static const u8 sBlob_2b4154_2b4168[] = INCBIN_U8("data/Blob_2b4154_2b4168.bin");

const u16 sSaXPalette_Fading[16 * 16] = INCBIN_U16("data/sa_x/fading.pal");
const u16 sSaXPalette_MidAir[4 * 16] = INCBIN_U16("data/sa_x/screw_attack.pal");
const u16 sSaXPalette_TransformingIntoMonster[1 * 16] = INCBIN_U16("data/sa_x/transforming_into_monster.pal");

static const u8 sBlob_2b4408_2e4904[] = INCBIN_U8("data/Blob_2b4408_2e4904.bin");
