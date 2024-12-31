#include "data/hud_data.h"

const u16 sCommonOamPal[6 * 16] = INCBIN_U16("data/oam_common.pal");
const u8 sCommonOamGfx[14 * 32 * 32] = INCBIN_U8("data/oam_common.gfx");

const u8 sMissileIconGfx[4 * 32] = INCBIN_U8("data/hud/missile_icon.gfx");
const u8 sPowerBombIconGfx[4 * 32] = INCBIN_U8("data/hud/power_bomb_icon.gfx");
const u8 sAmmoDigitsGfx[1152] = INCBIN_U8("data/hud/ammo_digits.gfx");
const u8 sEnergyDigitsGfx[32 * 10] = INCBIN_U8("data/hud/energy_digits.gfx");
const u8 sEnergyTanksGfx_Full[256 * 5] = INCBIN_U8("data/hud/energy_tanks_full.gfx");
const u8 sEnergyTanksGfx_Empty[256 * 11] = INCBIN_U8("data/hud/energy_tanks_empty.gfx");
const u8 sEnergyTankGfx_OneFull[32 * 1] = INCBIN_U8("data/hud/energy_tank_one_full.gfx");
const u8 sEnergyTankGfx_OneFullOneEmpty[32 * 1] = INCBIN_U8("data/hud/energy_tank_one_full_one_empty.gfx");

const u16 sEscapeDigitsPal[16 * 3] = INCBIN_U16("data/hud/escape_timer_digits.pal");
const u8 sEscapeDigitsGfx[2048] = INCBIN_U8("data/hud/escape_timer_digits.gfx");

const u16 sEscapeDigitsOam[OAM_DATA_SIZE(8)] = {
    0x8,
    OBJ_SHAPE_VERTICAL | 0x0, 0x0, OBJ_SPRITE_OAM | 0x73c0,
    OBJ_SHAPE_VERTICAL | 0x0, 0x8, OBJ_SPRITE_OAM | 0x73c0,
    0x0, 0x10, OBJ_SPRITE_OAM | 0x73ca,
    OBJ_SHAPE_VERTICAL | 0x0, 0x18, OBJ_SPRITE_OAM | 0x73c0,
    OBJ_SHAPE_VERTICAL | 0x0, 0x20, OBJ_SPRITE_OAM | 0x73c0,
    0x0, 0x28, OBJ_SPRITE_OAM | 0x73ea,
    OBJ_SHAPE_VERTICAL | 0x0, 0x30, OBJ_SPRITE_OAM | 0x73c0,
    OBJ_SHAPE_VERTICAL | 0x0, 0x38, OBJ_SPRITE_OAM | 0x73c0
};

const struct FrameData sEscapeTimerFrameData[2] = {
    [0] = {
        .pFrame = sEscapeDigitsOam,
        .timer = UCHAR_MAX
    },
    [1] = FRAME_DATA_TERMINATOR
};
