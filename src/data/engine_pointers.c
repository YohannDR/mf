#include "data/engine_pointers.h"
#include "projectile.h"

const Func_T sProcessProjectileFunctionPointers[PROJ_TYPE_END] = {
    [PROJ_TYPE_NORMAL_BEAM] = ProjectileNormalBeamSubroutine,
    [PROJ_TYPE_CHARGE_BEAM] = ProjectileChargeBeamSubroutine,
    [PROJ_TYPE_WIDE_BEAM] = ProjectileWideBeamSubroutine,
    [PROJ_TYPE_PLASMA_BEAM] = ProjectilePlasmaBeamSubroutine,
    [PROJ_TYPE_WAVE_BEAM] = ProjectileWaveBeamSubroutine,
    [PROJ_TYPE_CHARGED_NORMAL_BEAM] = ProjectileChargedNormalBeamSubroutine,
    [PROJ_TYPE_CHARGED_CHARGE_BEAM] = ProjectileChargedChargeBeamSubroutine,
    [PROJ_TYPE_CHARGED_WIDE_BEAM] = ProjectileChargedWideBeamSubroutine,
    [PROJ_TYPE_CHARGED_PLASMA_BEAM] = ProjectileChargedPlasmaBeamSubroutine,
    [PROJ_TYPE_CHARGED_WAVE_BEAM] = ProjectileChargedWaveBeamSubroutine,
    [PROJ_TYPE_NORMAL_MISSILE] = ProjectileNormalMissileSubroutine,
    [PROJ_TYPE_SUPER_MISSILE] = ProjectileSuperMissileSubroutine,
    [PROJ_TYPE_ICE_MISSILE] = ProjectileIceMissileSubroutine,
    [PROJ_TYPE_DIFFUSION_MISSILE] = ProjectileDiffusionMissileSubroutine,
    [PROJ_TYPE_CHARGED_DIFFUSION_MISSILE] = ProjectileDiffusionMissileSubroutine,
    [PROJ_TYPE_FLARE] = ProjectileFlareSubroutine,
    [PROJ_TYPE_BOMB] = ProjectileBombSubroutine,
    [PROJ_TYPE_POWER_BOMB] = ProjectilePowerBombSubroutine,
    [PROJ_TYPE_DIFFUSION_FLAKE] = ProjectileDiffusionFlakeSubroutine
};

static const u8 sBlob_79c2c8_79ecc8[] = INCBIN_U8("data/Blob_79c2c8_79ecc8.bin");
