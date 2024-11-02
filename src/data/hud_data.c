#include "data/hud_data.h"
#include "macros.h"

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
