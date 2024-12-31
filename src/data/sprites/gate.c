#include "data/sprites/gate.h"

const u32 sGateGfx[1 * 512] = INCBIN_U32("data/sprites/gate.gfx");
const u16 sGatePal[1 * 16] = INCBIN_U16("data/sprites/gate.pal");

static const u16 sGateOam_OpenedThin_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200
};

static const u16 sGateOam_ClosedThin_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sGateOam_OpenedFat_Frame0[] = {
    1,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220
};

static const u16 sGateOam_ClosedFat_Frame0[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateSwitchOam_IdleLeft_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1d7, OBJ_PALETTE_8 | 0x228,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1d7, OBJ_PALETTE_8 | 0x208
};

static const u16 sGateSwitchOam_PressingLeft_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1d7, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xc7, 0x1d7, OBJ_PALETTE_8 | 0x228
};

static const u16 sGateSwitchOam_PressingLeft_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1d7, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xc5, 0x1d7, OBJ_PALETTE_8 | 0x228
};

static const u16 sGateSwitchOam_PressedLeft_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1d7, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xc3, 0x1d7, OBJ_PALETTE_8 | 0x228
};

static const u16 sGateSwitchOam_IdleRight_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0xb, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x19, OBJ_PALETTE_8 | 0x228
};

static const u16 sGateSwitchOam_PressingRight_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0xb, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xc7, 0x19, OBJ_PALETTE_8 | 0x228
};

static const u16 sGateSwitchOam_PressingRight_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0xb, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xc5, 0x19, OBJ_PALETTE_8 | 0x228
};

static const u16 sGateSwitchOam_PressedRight_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0xb, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xc3, 0x19, OBJ_PALETTE_8 | 0x228
};

static const u16 sGateSwitchOam_IdleLeft_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1d7, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1d7, OBJ_PALETTE_8 | 0x21e
};

static const u16 sGateSwitchOam_IdleLeft_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1d7, OBJ_PALETTE_8 | 0x208,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1d7, OBJ_PALETTE_8 | 0x23e
};

static const u16 sGateSwitchOam_IdleRight_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0xb, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x19, OBJ_PALETTE_8 | 0x21e
};

static const u16 sGateSwitchOam_IdleRight_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0xb, OBJ_PALETTE_8 | 0x216,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x19, OBJ_PALETTE_8 | 0x23e
};

static const u16 sGateOam_ClosingThin_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    OBJ_SHAPE_HORIZONTAL | 0xc4, 0x1f8, OBJ_PALETTE_8 | 0x226
};

static const u16 sGateOam_ClosingThin_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xc0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sGateOam_ClosingThin_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xc4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sGateOam_ClosingThin_Frame3[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206
};

static const u16 sGateOam_ClosingThin_Frame4[] = {
    3,
    0xcc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xc4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame5[] = {
    3,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame6[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xd4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xc4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame7[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xd8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame8[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xcc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame9[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame10[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xcc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame11[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xe8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame12[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xec, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xdc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xcc, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc4, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingThin_Frame13[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosingFat_Frame0[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xc4, OBJ_SIZE_32x8 | 0x1ec, OBJ_PALETTE_8 | 0x232
};

static const u16 sGateOam_ClosingFat_Frame1[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212
};

static const u16 sGateOam_ClosingFat_Frame2[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xc4, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212
};

static const u16 sGateOam_ClosingFat_Frame3[] = {
    2,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212
};

static const u16 sGateOam_ClosingFat_Frame4[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xcc, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xc4, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x22f
};

static const u16 sGateOam_ClosingFat_Frame5[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosingFat_Frame6[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xd4, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xc4, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosingFat_Frame7[] = {
    3,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosingFat_Frame8[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xdc, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xcc, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc4, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x22f
};

static const u16 sGateOam_ClosingFat_Frame9[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosingFat_Frame10[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xe4, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xd4, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc4, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosingFat_Frame11[] = {
    4,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xe8, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xd8, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc8, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosingFat_Frame12[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xec, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xdc, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xcc, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc4, OBJ_SIZE_32x8 | 0x1f4, OBJ_PALETTE_8 | 0x22f
};

static const u16 sGateOam_ClosingFat_Frame13[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame1[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame2[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame3[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame4[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame5[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame7[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame8[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame9[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame10[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame11[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame13[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame14[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame15[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1fa, OBJ_PALETTE_8 | 0x236,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame16[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedFat_Frame17[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1fa, OBJ_PALETTE_8 | 0x23c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1fa, OBJ_PALETTE_8 | 0x21c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x220,
    OBJ_SHAPE_HORIZONTAL | 0xf0, OBJ_SIZE_32x16 | 0x1ec, OBJ_PALETTE_8 | 0x212,
    OBJ_SHAPE_HORIZONTAL | 0xe0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xd0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x16 | 0x1f4, OBJ_PALETTE_8 | 0x20f
};

static const u16 sGateOam_ClosedThin_Frame1[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame2[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame3[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, OBJ_PALETTE_8 | 0x20c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame4[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame5[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame6[] = {
    5,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame7[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame8[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame9[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame10[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xd8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xe0, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame11[] = {
    7,
    OBJ_SHAPE_HORIZONTAL | 0xd0, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xe8, 0x1f8, OBJ_PALETTE_8 | 0x22a,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

static const u16 sGateOam_ClosedThin_Frame12[] = {
    6,
    OBJ_SHAPE_HORIZONTAL | 0xc8, 0x1f8, OBJ_PALETTE_8 | 0x22c,
    OBJ_SHAPE_HORIZONTAL | 0xc0, OBJ_SIZE_32x8 | 0x1f0, OBJ_PALETTE_8 | 0x200,
    0xf0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x206,
    0xe0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xd0, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204,
    0xc8, OBJ_SIZE_16x16 | 0x1f8, OBJ_PALETTE_8 | 0x204
};

const struct FrameData sGateOam_OpenedThin[2] = {
    [0] = {
        .pFrame = sGateOam_OpenedThin_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateOam_ClosingThin[15] = {
    [0] = {
        .pFrame = sGateOam_ClosingThin_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sGateOam_ClosingThin_Frame1,
        .timer = 3
    },
    [2] = {
        .pFrame = sGateOam_ClosingThin_Frame2,
        .timer = 3
    },
    [3] = {
        .pFrame = sGateOam_ClosingThin_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sGateOam_ClosingThin_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sGateOam_ClosingThin_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sGateOam_ClosingThin_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sGateOam_ClosingThin_Frame7,
        .timer = 2
    },
    [8] = {
        .pFrame = sGateOam_ClosingThin_Frame8,
        .timer = 1
    },
    [9] = {
        .pFrame = sGateOam_ClosingThin_Frame9,
        .timer = 1
    },
    [10] = {
        .pFrame = sGateOam_ClosingThin_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sGateOam_ClosingThin_Frame11,
        .timer = 1
    },
    [12] = {
        .pFrame = sGateOam_ClosingThin_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sGateOam_ClosingThin_Frame13,
        .timer = 1
    },
    [14] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateOam_OpeningThin[15] = {
    [0] = {
        .pFrame = sGateOam_ClosingThin_Frame13,
        .timer = 1
    },
    [1] = {
        .pFrame = sGateOam_ClosingThin_Frame12,
        .timer = 1
    },
    [2] = {
        .pFrame = sGateOam_ClosingThin_Frame11,
        .timer = 1
    },
    [3] = {
        .pFrame = sGateOam_ClosingThin_Frame10,
        .timer = 1
    },
    [4] = {
        .pFrame = sGateOam_ClosingThin_Frame9,
        .timer = 1
    },
    [5] = {
        .pFrame = sGateOam_ClosingThin_Frame8,
        .timer = 1
    },
    [6] = {
        .pFrame = sGateOam_ClosingThin_Frame7,
        .timer = 1
    },
    [7] = {
        .pFrame = sGateOam_ClosingThin_Frame6,
        .timer = 1
    },
    [8] = {
        .pFrame = sGateOam_ClosingThin_Frame5,
        .timer = 1
    },
    [9] = {
        .pFrame = sGateOam_ClosingThin_Frame4,
        .timer = 1
    },
    [10] = {
        .pFrame = sGateOam_ClosingThin_Frame3,
        .timer = 1
    },
    [11] = {
        .pFrame = sGateOam_ClosingThin_Frame2,
        .timer = 1
    },
    [12] = {
        .pFrame = sGateOam_ClosingThin_Frame1,
        .timer = 1
    },
    [13] = {
        .pFrame = sGateOam_ClosingThin_Frame0,
        .timer = 1
    },
    [14] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateOam_ClosedThin[14] = {
    [0] = {
        .pFrame = sGateOam_ClosedThin_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sGateOam_ClosedThin_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sGateOam_ClosedThin_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sGateOam_ClosedThin_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sGateOam_ClosedThin_Frame4,
        .timer = 10
    },
    [5] = {
        .pFrame = sGateOam_ClosedThin_Frame5,
        .timer = 10
    },
    [6] = {
        .pFrame = sGateOam_ClosedThin_Frame6,
        .timer = 10
    },
    [7] = {
        .pFrame = sGateOam_ClosedThin_Frame7,
        .timer = 10
    },
    [8] = {
        .pFrame = sGateOam_ClosedThin_Frame8,
        .timer = 10
    },
    [9] = {
        .pFrame = sGateOam_ClosedThin_Frame9,
        .timer = 10
    },
    [10] = {
        .pFrame = sGateOam_ClosedThin_Frame10,
        .timer = 10
    },
    [11] = {
        .pFrame = sGateOam_ClosedThin_Frame11,
        .timer = 10
    },
    [12] = {
        .pFrame = sGateOam_ClosedThin_Frame12,
        .timer = 10
    },
    [13] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateOam_OpenedFat[2] = {
    [0] = {
        .pFrame = sGateOam_OpenedFat_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateOam_ClosingFat[15] = {
    [0] = {
        .pFrame = sGateOam_ClosingFat_Frame0,
        .timer = 2
    },
    [1] = {
        .pFrame = sGateOam_ClosingFat_Frame1,
        .timer = 2
    },
    [2] = {
        .pFrame = sGateOam_ClosingFat_Frame2,
        .timer = 2
    },
    [3] = {
        .pFrame = sGateOam_ClosingFat_Frame3,
        .timer = 2
    },
    [4] = {
        .pFrame = sGateOam_ClosingFat_Frame4,
        .timer = 2
    },
    [5] = {
        .pFrame = sGateOam_ClosingFat_Frame5,
        .timer = 2
    },
    [6] = {
        .pFrame = sGateOam_ClosingFat_Frame6,
        .timer = 2
    },
    [7] = {
        .pFrame = sGateOam_ClosingFat_Frame7,
        .timer = 2
    },
    [8] = {
        .pFrame = sGateOam_ClosingFat_Frame8,
        .timer = 2
    },
    [9] = {
        .pFrame = sGateOam_ClosingFat_Frame9,
        .timer = 1
    },
    [10] = {
        .pFrame = sGateOam_ClosingFat_Frame10,
        .timer = 1
    },
    [11] = {
        .pFrame = sGateOam_ClosingFat_Frame11,
        .timer = 1
    },
    [12] = {
        .pFrame = sGateOam_ClosingFat_Frame12,
        .timer = 1
    },
    [13] = {
        .pFrame = sGateOam_ClosingFat_Frame13,
        .timer = 1
    },
    [14] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateOam_OpeningFat[15] = {
    [0] = {
        .pFrame = sGateOam_ClosingFat_Frame13,
        .timer = 1
    },
    [1] = {
        .pFrame = sGateOam_ClosingFat_Frame12,
        .timer = 1
    },
    [2] = {
        .pFrame = sGateOam_ClosingFat_Frame11,
        .timer = 1
    },
    [3] = {
        .pFrame = sGateOam_ClosingFat_Frame10,
        .timer = 1
    },
    [4] = {
        .pFrame = sGateOam_ClosingFat_Frame9,
        .timer = 1
    },
    [5] = {
        .pFrame = sGateOam_ClosingFat_Frame8,
        .timer = 1
    },
    [6] = {
        .pFrame = sGateOam_ClosingFat_Frame7,
        .timer = 1
    },
    [7] = {
        .pFrame = sGateOam_ClosingFat_Frame6,
        .timer = 1
    },
    [8] = {
        .pFrame = sGateOam_ClosingFat_Frame5,
        .timer = 1
    },
    [9] = {
        .pFrame = sGateOam_ClosingFat_Frame4,
        .timer = 1
    },
    [10] = {
        .pFrame = sGateOam_ClosingFat_Frame3,
        .timer = 1
    },
    [11] = {
        .pFrame = sGateOam_ClosingFat_Frame2,
        .timer = 1
    },
    [12] = {
        .pFrame = sGateOam_ClosingFat_Frame1,
        .timer = 1
    },
    [13] = {
        .pFrame = sGateOam_ClosingFat_Frame0,
        .timer = 1
    },
    [14] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateOam_ClosedFat[19] = {
    [0] = {
        .pFrame = sGateOam_ClosedFat_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sGateOam_ClosedFat_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sGateOam_ClosedFat_Frame2,
        .timer = 10
    },
    [3] = {
        .pFrame = sGateOam_ClosedFat_Frame3,
        .timer = 10
    },
    [4] = {
        .pFrame = sGateOam_ClosedFat_Frame4,
        .timer = 10
    },
    [5] = {
        .pFrame = sGateOam_ClosedFat_Frame5,
        .timer = 10
    },
    [6] = {
        .pFrame = sGateOam_ClosedFat_Frame0,
        .timer = 10
    },
    [7] = {
        .pFrame = sGateOam_ClosedFat_Frame7,
        .timer = 10
    },
    [8] = {
        .pFrame = sGateOam_ClosedFat_Frame8,
        .timer = 10
    },
    [9] = {
        .pFrame = sGateOam_ClosedFat_Frame9,
        .timer = 10
    },
    [10] = {
        .pFrame = sGateOam_ClosedFat_Frame10,
        .timer = 10
    },
    [11] = {
        .pFrame = sGateOam_ClosedFat_Frame11,
        .timer = 10
    },
    [12] = {
        .pFrame = sGateOam_ClosedFat_Frame0,
        .timer = 10
    },
    [13] = {
        .pFrame = sGateOam_ClosedFat_Frame13,
        .timer = 10
    },
    [14] = {
        .pFrame = sGateOam_ClosedFat_Frame14,
        .timer = 10
    },
    [15] = {
        .pFrame = sGateOam_ClosedFat_Frame15,
        .timer = 10
    },
    [16] = {
        .pFrame = sGateOam_ClosedFat_Frame16,
        .timer = 10
    },
    [17] = {
        .pFrame = sGateOam_ClosedFat_Frame17,
        .timer = 10
    },
    [18] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateSwitchOam_IdleLeft[4] = {
    [0] = {
        .pFrame = sGateSwitchOam_IdleLeft_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sGateSwitchOam_IdleLeft_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sGateSwitchOam_IdleLeft_Frame2,
        .timer = 10
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateSwitchOam_PressingLeft[3] = {
    [0] = {
        .pFrame = sGateSwitchOam_PressingLeft_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sGateSwitchOam_PressingLeft_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateSwitchOam_IdleRight[4] = {
    [0] = {
        .pFrame = sGateSwitchOam_IdleRight_Frame0,
        .timer = 10
    },
    [1] = {
        .pFrame = sGateSwitchOam_IdleRight_Frame1,
        .timer = 10
    },
    [2] = {
        .pFrame = sGateSwitchOam_IdleRight_Frame2,
        .timer = 10
    },
    [3] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateSwitchOam_PressingRight[3] = {
    [0] = {
        .pFrame = sGateSwitchOam_PressingRight_Frame0,
        .timer = 3
    },
    [1] = {
        .pFrame = sGateSwitchOam_PressingRight_Frame1,
        .timer = 3
    },
    [2] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateSwitchOam_PressedLeft[2] = {
    [0] = {
        .pFrame = sGateSwitchOam_PressedLeft_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};

const struct FrameData sGateSwitchOam_PressedRight[2] = {
    [0] = {
        .pFrame = sGateSwitchOam_PressedRight_Frame0,
        .timer = 255
    },
    [1] = FRAME_DATA_TERMINATOR
};
