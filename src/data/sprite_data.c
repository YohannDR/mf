#include "data/sprite_data.h"
#include "macros.h"
#include "constants/sprite.h"

const u8 sOamXFlipOffsets[3][4] = {
    [0] = {
        1, 2, 4, 8
    },
    [1] = {
        2, 4, 4, 8
    },
    [2] = {
        1, 1, 2, 4
    }
};

const u8 sOamYFlipOffsets[3][4] = {
    [0] = {
        1, 2, 4, 8
    },
    [1] = {
        1, 1, 2, 4
    },
    [2] = {
        2, 4, 4, 8
    }
};

const u8 sRandomNumberTable[32] = {
    13, 2,  6,  8,
    7,  9,  14, 10,
    2,  4,  14, 4,
    12, 15, 13, 12,
    11, 1,  3,  15,
    0,  6,  7,  8,
    11, 5,  0,  3,
    5,  1,  9,  10
};

const u16 sSuitDamageReductionPercent[SDRT_END][SDR_END] = {
    [SDRT_30_10] = {
        [SDR_POWER_SUIT]   = 10,
        [SDR_VARIA_SUIT]   = 3,
        [SDR_GRAVITY_SUIT] = 1
    },
    [SDRT_60_30] = {
        [SDR_POWER_SUIT]   = 10,
        [SDR_VARIA_SUIT]   = 6,
        [SDR_GRAVITY_SUIT] = 3
    },
    [SDRT_80_10] = {
        [SDR_POWER_SUIT]   = 10,
        [SDR_VARIA_SUIT]   = 8,
        [SDR_GRAVITY_SUIT] = 1
    },
    [SDRT_90_80] = {
        [SDR_POWER_SUIT]   = 10,
        [SDR_VARIA_SUIT]   = 9,
        [SDR_GRAVITY_SUIT] = 8
    }
};

const s16 sSpritesFallingSpeedHovering[20] = {
    -12, -10, -8, -6,
    -4,  -2,   0,  0,
     0,   0,   1,  2,
     4,   6,   8,  10,
     12,  14,  16, SHORT_MAX
};

const s16 sSpritesFallingSpeedMissileHatchDebris[16] = {
    -12, -10, -8, -6,
    -4,  -2,   0,  0,
     1,   2,   4,  6,
     8,   12,  16, SHORT_MAX
};

const s16 sSpritesFallingSpeed_2e499c[18] = {
    -14, -12, -10, -8, -6, -4,
    -2,   0,   0,   0,  1,  2,
     4,   8,   12,  14, 16, SHORT_MAX
};

const s16 sSpritesFallingSpeedCeiling[16] = {
    -4,  -4,  -4, -4,
    -4,  -4,  -8, -8,
    -8,  -12, -12, -12,
    -12, -12, -16, SHORT_MAX
};

const s16 sSpritesFallingSpeed[16] = {
    4,  4,  4,  4,
    4,  4,  8,  8,
    8,  12, 12, 12,
    12, 12, 16, SHORT_MAX
};

const s16 sSpritesFallingSpeedQuickAcceleration[8] = {
    4,  6,  8,  10,
    12, 14, 16, SHORT_MAX
};

const s16 sSpritesFallingSpeedSlow[16] = {
    1, 1, 2, 2,
    3, 3, 4, 4,
    5, 5, 6, 6,
    7, 7, 8, SHORT_MAX
};

const s16 sSpritesFallingSpeedFast[16] = {
    4,  4,  4,  4,
    8,  8,  8,  8,
    12, 12, 12, 16,
    16, 16, 20, SHORT_MAX
};

const u32 sSpritesGraphicsLength[PSPRITE_END - 0x10] = {
    [PSPRITE_UNUSED_16 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_SA_X_ELEVATOR - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_HORNOAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_HALZYN - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_ZEBESIAN_WALL - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_HORNOAD_SPAWNER - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_GATE - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_MOVABLE_PLATFORM_1 - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_MOTO - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_NAVIGATION_PAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_GUNSHIP - 0x10] = SPRITE_GFX_SIZE(6),
    [PSPRITE_YAMEBA - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_SECURITY_PAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_AREA_BANNER - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_DATA_PAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_SAVE_PAD - 0x10] = SPRITE_GFX_SIZE(3),

    [PSPRITE_PRE_BOX_CEILING_DEBRIS - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_MESSAGE_BOX - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_KAGO - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_ELECTRIC_WATER_DAMAGE - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_ELECTRIC_WATER - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_WIRE - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_SAMUS_EATER_BUD - 0x10] = SPRITE_GFX_SIZE(8),
    [PSPRITE_SAMUS_EATER - 0x10] = SPRITE_GFX_SIZE(8),

    [PSPRITE_ENERGY_RECHARGE_PAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_AMMO_RECHARGE_PAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_ENERGY_AMMO_RECHARGE_PAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_ATMOSPHERIC_STABILIZER_PARASITE - 0x10] = SPRITE_GFX_SIZE(3),

    [PSPRITE_ATMOSPHERIC_STABILIZER_2 - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_ATMOSPHERIC_STABILIZER_1 - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_ATMOSPHERIC_STABILIZER_3 - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_ATMOSPHERIC_STABILIZER_4 - 0x10] = SPRITE_GFX_SIZE(3),

    [PSPRITE_ATMOSPHERIC_STABILIZER_5 - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_ZEELA - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_X_PARASITE_CORE_X_OR_PARASITE - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_SKREE - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_X_PARASITE_IN_ROOM - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_TOXIC_GAS - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_X_PARASITE_IN_ROOM_PROXIMITY - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_ZOMBIE - 0x10] = SPRITE_GFX_SIZE(3),

    [PSPRITE_X_PARASITE - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_GEEMER - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_ARACHNUS - 0x10] = SPRITE_GFX_SIZE(8),
    [PSPRITE_WAVER - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_SCISER - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_SIDEHOPPER - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_DESSGEEGA - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_MORPH_BALL_ABILITY - 0x10] = SPRITE_GFX_SIZE(5),

    [PSPRITE_X_PARASITE_CORE_X_FORMATION - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_NORMAL_1 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_NORMAL_2 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_NORMAL_3 - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_HIGH_JUMP_ABILITY - 0x10] = SPRITE_GFX_SIZE(5),
    [PSPRITE_SPEEDBOOSTER_ABILITY - 0x10] = SPRITE_GFX_SIZE(5),
    [PSPRITE_VARIA_SUIT_ABILITY - 0x10] = SPRITE_GFX_SIZE(8),
    [PSPRITE_SPACE_JUMP_ABILITY - 0x10] = SPRITE_GFX_SIZE(5),

    [PSPRITE_GRAVITY_SUIT_ABILITY - 0x10] = SPRITE_GFX_SIZE(5),
    [PSPRITE_SCREW_ATTACK_ABILITY - 0x10] = SPRITE_GFX_SIZE(5),
    [PSPRITE_MOVABLE_PLATFORM_2 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_ZAZABI - 0x10] = SPRITE_GFX_SIZE(8),

    [PSPRITE_OMEGA_METROID_HUSK - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_ICE_BEAM_ABILITY - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_MOVABLE_PLATFORM_3 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_MOVABLE_PLATFORM_4 - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_MOVABLE_PLATFORM_5 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_YAKUZA - 0x10] = SPRITE_GFX_SIZE(8),
    [PSPRITE_CHOZO_STATUE - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_SCIENTIST - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_NETTORI - 0x10] = SPRITE_GFX_SIZE(8),
    [PSPRITE_BOX_2 - 0x10] = SPRITE_GFX_SIZE(7),
    [PSPRITE_CHARGE_BEAM_CORE_X - 0x10] = SPRITE_GFX_SIZE(5),
    [PSPRITE_WIDE_BEAM_CORE_X - 0x10] = SPRITE_GFX_SIZE(5),

    [PSPRITE_PLASMA_BEAM_CORE_X - 0x10] = SPRITE_GFX_SIZE(5),
    [PSPRITE_WAVE_BEAM_CORE_X - 0x10] = SPRITE_GFX_SIZE(5),
    [PSPRITE_ZORO - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_KIHUNTER_FLYING - 0x10] = SPRITE_GFX_SIZE(3),

    [PSPRITE_KIHUNTER_GROUND - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_KIHUNTER_HIVE - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_REO - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_LAVA_PLUME - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_NAHIME - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_FUNE - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_BOX - 0x10] = SPRITE_GFX_SIZE(8),
    [PSPRITE_BLUE_ZORO - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_GERUDA - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_PUMP_CONTROL_PAD - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_BOILER_CONTROL_PAD - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_AUXILARY_POWER_PAD - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_HABITAION_PAD - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_OPERATIONS_ROOM_PAD - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_SKULTERA_LARGE - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_SKULTERA_SMALL_1 - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_SOVA - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_YARD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_EVIR - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_BULL - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_MEMU - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_GERUBOSS - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_CHOOT - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_ZEBESIAN_GROUND - 0x10] = SPRITE_GFX_SIZE(3),

    [PSPRITE_BLUE_X - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_MISSILE_HATCH - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_QUARANTINE_BAY_HORNOAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_BOX_DEBRIS - 0x10] = SPRITE_GFX_SIZE(8),

    [PSPRITE_X_BARRIER_CORE_SUPER_1 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_SUPER_2 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_SUPER_3 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_SUPER_4 - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_X_BARRIER_CORE_SUPER_5 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_SUPER_6 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_SUPER_7 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_X_BARRIER_CORE_SUPER_8 - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_1 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_2 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_3 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_4 - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_5 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_6 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_7 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_8 - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_RIPPER - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_ZORO_COCOON - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_ZORO_HUSK - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_GOLD_SCISER - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_SA_X_TRO_1 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_SA_X_NOC - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_PRE_DESTROYED_DATA_PAD - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_GADORA_ARACHNUS - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_GADORA_CHARGE_BEAM - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_ZAZABI - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_SERRIS - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_VARIA_CORE - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_GADORA_WIDE_BEAM - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_NIGHTMARE - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_RIDLEY - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_NETTORI - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_GADORA_YAKUZA - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_1 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_2 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_3 - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_GADORA_4 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_5 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GADORA_6 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_SHAKE_TRIGGER - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_SA_X_ARC - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_ELEVATOR_PAD - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_GOLD_ZEBESIAN - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_RED_ZEELA - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_OWTCH - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_GEEGA - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_SERRIS - 0x10] = SPRITE_GFX_SIZE(8),
    [PSPRITE_PILLAR - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_GENESIS - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_PUYO - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_BUBBLES_1 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_BUBBLES_2 - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_WATER_DROP - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_FAKE_ENERGY_TANK - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_FAKE_MISSILE_TANK - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_CORE_X_ABILITY_BEFORE_VARIA_CORE - 0x10] = SPRITE_GFX_SIZE(4),

    [PSPRITE_BIG_FLASHING_NUMBER - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_FLASHING_NUMBER - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_DESTROYED_DATA_PAD - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_ZEBESIAN_AQUA - 0x10] = SPRITE_GFX_SIZE(2),

    [PSPRITE_ZEBESIAN_PRE_AQUA - 0x10] = SPRITE_GFX_SIZE(3),
    [PSPRITE_SKULTERA_SMALL_2 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_ETECOON - 0x10] = SPRITE_GFX_SIZE(4),
    [PSPRITE_TIRE_SWING - 0x10] = SPRITE_GFX_SIZE(4),

    [PSPRITE_DACHORA - 0x10] = SPRITE_GFX_SIZE(4),
    [PSPRITE_X_PARASITE_AQUA_ZEBESIAN - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_METROID - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_LAB_DEBRIS - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_SA_X_LAB - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_POWAMP - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_ZOZORO - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_CONTINUAL_X_SPAWNER - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_SA_X_BOSS - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_SA_X_MONSTER - 0x10] = SPRITE_GFX_SIZE(8),
    [PSPRITE_ICE_BEAM_CORE_X - 0x10] = SPRITE_GFX_SIZE(5),
    [PSPRITE_OMEGA_METROID - 0x10] = SPRITE_GFX_SIZE(5),

    [PSPRITE_GUNSHIP_END - 0x10] = SPRITE_GFX_SIZE(7),
    [PSPRITE_ELECTRIC_WATER_DAMAGE_BOX_2 - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_FROZEN_RIDLEY - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_GOLD_SCISER_DOOR_LOCK - 0x10] = SPRITE_GFX_SIZE(1),

    [PSPRITE_GOLD_ZEBESIAN_DOOR_LOCK - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_SA_X_OMEGA_CUTSCENE - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_METROID_HUSK - 0x10] = SPRITE_GFX_SIZE(1),
    [PSPRITE_RIDLEY - 0x10] = SPRITE_GFX_SIZE(8),

    [PSPRITE_RIDLEY_PRE_SPAWN - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_SA_X_TRO_2 - 0x10] = SPRITE_GFX_SIZE(2),
    [PSPRITE_NIGHTMARE - 0x10] = SPRITE_GFX_SIZE(8)
};

/**
 * @brief Stats of the primary sprites
 * 0 : Spawn health
 * 1 : Damage
 * 2 : Suit reduction
 * 3 : Weaknesses
 * 4 : Health X probability
 * 5 : Missile X probability
 * 6 : Red X probability
 */
const u16 sPrimarySpriteStats[PSPRITE_END][7] = {
    [PSPRITE_TARGET_CIRCLES] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_TARGET_DIAGONAL] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_TARGET_SIDEWAYS] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_3] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_4] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_5] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_6] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_7] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_8] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_9] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_10] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_11] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_12] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_13] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_CORE_X_TARGET] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_15] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_UNUSED_16] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        0,
        0,
        0
    },
    [PSPRITE_SA_X_ELEVATOR] = {
        64000,
        500,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CAN_BE_FROZEN,
        1024,
        0,
        0
    },
    [PSPRITE_HORNOAD] = {
        4,
        15,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_HALZYN] = {
        4,
        42,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        723,
        300,
        1
    },
    [PSPRITE_ZEBESIAN_WALL] = {
        6,
        42,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        714,
        300,
        10
    },
    [PSPRITE_HORNOAD_SPAWNER] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GATE] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_MOVABLE_PLATFORM_1] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_MOTO] = {
        6,
        20,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        723,
        300,
        1
    },
    [PSPRITE_NAVIGATION_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GUNSHIP] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_YAMEBA] = {
        2,
        4,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_SECURITY_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_AREA_BANNER] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_DATA_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SAVE_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_PRE_BOX_CEILING_DEBRIS] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_MESSAGE_BOX] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_KAGO] = {
        5,
        34,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        424,
        300,
        300
    },
    [PSPRITE_ELECTRIC_WATER_DAMAGE] = {
        0,
        3,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ELECTRIC_WATER] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_WIRE] = {
        0,
        75,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SAMUS_EATER_BUD] = {
        1,
        20,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SAMUS_EATER] = {
        1,
        8,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ENERGY_RECHARGE_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_AMMO_RECHARGE_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ENERGY_AMMO_RECHARGE_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ATMOSPHERIC_STABILIZER_PARASITE] = {
        21,
        32,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_ATMOSPHERIC_STABILIZER_1] = {
        1,
        30,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ATMOSPHERIC_STABILIZER_2] = {
        1,
        30,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ATMOSPHERIC_STABILIZER_3] = {
        1,
        30,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ATMOSPHERIC_STABILIZER_4] = {
        1,
        30,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ATMOSPHERIC_STABILIZER_5] = {
        1,
        30,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ZEELA] = {
        8,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_X_PARASITE_CORE_X_OR_PARASITE] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SKREE] = {
        4,
        38,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_X_PARASITE_IN_ROOM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_TOXIC_GAS] = {
        1,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_X_PARASITE_IN_ROOM_PROXIMITY] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ZOMBIE] = {
        2,
        16,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        523,
        500,
        1
    },
    [PSPRITE_X_PARASITE] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GEEMER] = {
        4,
        45,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        1012,
        10,
        2
    },
    [PSPRITE_ARACHNUS] = {
        150,
        32,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        1024,
        0,
        0
    },
    [PSPRITE_WAVER] = {
        12,
        44,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        773,
        250,
        1
    },
    [PSPRITE_SCISER] = {
        8,
        42,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_SIDEHOPPER] = {
        24,
        52,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        523,
        500,
        1
    },
    [PSPRITE_DESSGEEGA] = {
        14,
        42,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        802,
        220,
        2
    },
    [PSPRITE_MORPH_BALL_ABILITY] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_X_PARASITE_CORE_X_FORMATION] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_X_BARRIER_CORE_NORMAL_1] = {
        30,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_NORMAL_2] = {
        30,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_NORMAL_3] = {
        30,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_HIGH_JUMP_ABILITY] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SPEEDBOOSTER_ABILITY] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_VARIA_SUIT_ABILITY] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SPACE_JUMP_ABILITY] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GRAVITY_SUIT_ABILITY] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SCREW_ATTACK_ABILITY] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_MOVABLE_PLATFORM_2] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ZAZABI] = {
        100,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_OMEGA_METROID_HUSK] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ICE_BEAM_ABILITY] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_MOVABLE_PLATFORM_3] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_MOVABLE_PLATFORM_4] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_MOVABLE_PLATFORM_5] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_YAKUZA] = {
        1000,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES,
        1024,
        0,
        0
    },
    [PSPRITE_CHOZO_STATUE] = {
        1,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SCIENTIST] = {
        1,
        8,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB,
        1024,
        0,
        0
    },
    [PSPRITE_NETTORI] = {
        2000,
        20,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB,
        1024,
        0,
        0
    },
    [PSPRITE_BOX_2] = {
        1,
        0,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_CHARGE_BEAM_CORE_X] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_WIDE_BEAM_CORE_X] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_PLASMA_BEAM_CORE_X] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_WAVE_BEAM_CORE_X] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ZORO] = {
        16,
        45,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        773,
        250,
        1
    },
    [PSPRITE_KIHUNTER_FLYING] = {
        40,
        86,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_KIHUNTER_GROUND] = {
        40,
        86,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_KIHUNTER_HIVE] = {
        16,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        1024,
        0,
        0
    },
    [PSPRITE_REO] = {
        10,
        44,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        873,
        150,
        1
    },
    [PSPRITE_LAVA_PLUME] = {
        1,
        62,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_NAHIME] = {
        82,
        78,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        721,
        300,
        3
    },
    [PSPRITE_FUNE] = {
        32,
        48,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        723,
        300,
        1
    },
    [PSPRITE_BOX] = {
        1,
        0,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_BLUE_ZORO] = {
        120,
        85,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        100,
        124,
        800
    },
    [PSPRITE_GERUDA] = {
        12,
        28,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_PUMP_CONTROL_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_BOILER_CONTROL_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_AUXILARY_POWER_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_HABITAION_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_OPERATIONS_ROOM_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SKULTERA_LARGE] = {
        28,
        85,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        500,
        500,
        24
    },
    [PSPRITE_SKULTERA_SMALL_1] = {
        12,
        42,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_SOVA] = {
        10,
        30,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        923,
        100,
        1
    },
    [PSPRITE_YARD] = {
        60,
        64,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        622,
        400,
        2
    },
    [PSPRITE_EVIR] = {
        80,
        10,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        521,
        500,
        3
    },
    [PSPRITE_BULL] = {
        18,
        60,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_MEMU] = {
        6,
        60,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        923,
        100,
        1
    },
    [PSPRITE_GERUBOSS] = {
        45,
        100,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        674,
        300,
        50
    },
    [PSPRITE_CHOOT] = {
        16,
        42,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_ZEBESIAN_GROUND] = {
        90,
        94,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        714,
        300,
        10
    },
    [PSPRITE_BLUE_X] = {
        1,
        3,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_MISSILE_HATCH] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES,
        1024,
        0,
        0
    },
    [PSPRITE_QUARANTINE_BAY_HORNOAD] = {
        4,
        15,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_BOX_DEBRIS] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_X_BARRIER_CORE_SUPER_1] = {
        90,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SUPER_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_SUPER_2] = {
        90,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SUPER_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_SUPER_3] = {
        90,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SUPER_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_SUPER_4] = {
        90,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SUPER_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_SUPER_5] = {
        90,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SUPER_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_SUPER_6] = {
        90,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SUPER_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_SUPER_7] = {
        90,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SUPER_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_SUPER_8] = {
        90,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SUPER_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        1024,
        0
    },
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_1] = {
        17,
        96,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        200,
        300,
        524
    },
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_2] = {
        17,
        96,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        200,
        300,
        524
    },
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_3] = {
        17,
        96,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        200,
        300,
        524
    },
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_4] = {
        17,
        96,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        200,
        300,
        524
    },
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_5] = {
        17,
        96,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        200,
        300,
        524
    },
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_6] = {
        17,
        96,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        200,
        300,
        524
    },
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_7] = {
        17,
        96,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        200,
        300,
        524
    },
    [PSPRITE_X_BARRIER_CORE_POWER_BOMB_8] = {
        17,
        96,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        200,
        300,
        524
    },
    [PSPRITE_RIPPER] = {
        1,
        50,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        794,
        200,
        30
    },
    [PSPRITE_ZORO_COCOON] = {
        1,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        1024,
        0,
        0
    },
    [PSPRITE_ZORO_HUSK] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GOLD_SCISER] = {
        16,
        40,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        373,
        650,
        1
    },
    [PSPRITE_SA_X_TRO_1] = {
        64000,
        500,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CAN_BE_FROZEN,
        1024,
        0,
        0
    },
    [PSPRITE_SA_X_NOC] = {
        64000,
        500,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CAN_BE_FROZEN,
        1024,
        0,
        0
    },
    [PSPRITE_PRE_DESTROYED_DATA_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GADORA_ARACHNUS] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_CHARGE_BEAM] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_ZAZABI] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_SERRIS] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_VARIA_CORE] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_WIDE_BEAM] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_NIGHTMARE] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_RIDLEY] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_NETTORI] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_YAKUZA] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_1] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_2] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_3] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_4] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_5] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_GADORA_6] = {
        1,
        50,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        0,
        0,
        1024
    },
    [PSPRITE_SHAKE_TRIGGER] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SA_X_ARC] = {
        64000,
        500,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CAN_BE_FROZEN,
        1024,
        0,
        0
    },
    [PSPRITE_ELEVATOR_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GOLD_ZEBESIAN] = {
        135,
        94,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        500,
        500,
        24
    },
    [PSPRITE_RED_ZEELA] = {
        82,
        80,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        0,
        0,
        1024
    },
    [PSPRITE_OWTCH] = {
        10,
        45,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        873,
        150,
        1
    },
    [PSPRITE_GEEGA] = {
        6,
        18,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        874,
        150,
        0
    },
    [PSPRITE_SERRIS] = {
        50,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES,
        1024,
        0,
        0
    },
    [PSPRITE_PILLAR] = {
        1,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GENESIS] = {
        60,
        80,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        714,
        300,
        10
    },
    [PSPRITE_PUYO] = {
        4,
        32,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        923,
        100,
        1
    },
    [PSPRITE_BUBBLES_1] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_BUBBLES_2] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_WATER_DROP] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_FAKE_ENERGY_TANK] = {
        1,
        7,
        SDRT_30_10,
        WEAKNESS_MISSILES,
        1000,
        0,
        24
    },
    [PSPRITE_FAKE_MISSILE_TANK] = {
        1,
        7,
        SDRT_30_10,
        WEAKNESS_MISSILES,
        0,
        1000,
        24
    },
    [PSPRITE_CORE_X_ABILITY_BEFORE_VARIA_CORE] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_BIG_FLASHING_NUMBER] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_FLASHING_NUMBER] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_DESTROYED_DATA_PAD] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ZEBESIAN_AQUA] = {
        90,
        120,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        714,
        300,
        10
    },
    [PSPRITE_ZEBESIAN_PRE_AQUA] = {
        90,
        94,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK,
        714,
        300,
        10
    },
    [PSPRITE_SKULTERA_SMALL_2] = {
        12,
        42,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        823,
        200,
        1
    },
    [PSPRITE_ETECOON] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_TIRE_SWING] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_DACHORA] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_X_PARASITE_AQUA_ZEBESIAN] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_METROID] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_LAB_DEBRIS] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SA_X_LAB] = {
        64000,
        500,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CAN_BE_FROZEN,
        1024,
        0,
        0
    },
    [PSPRITE_POWAMP] = {
        1,
        48,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        814,
        200,
        10
    },
    [PSPRITE_ZOZORO] = {
        8,
        48,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN,
        723,
        300,
        1
    },
    [PSPRITE_CONTINUAL_X_SPAWNER] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SA_X_BOSS] = {
        350,
        99,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CAN_BE_FROZEN,
        1024,
        0,
        0
    },
    [PSPRITE_SA_X_MONSTER] = {
        600,
        50,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM,
        1024,
        0,
        0
    },
    [PSPRITE_ICE_BEAM_CORE_X] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_OMEGA_METROID] = {
        1200,
        80,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS,
        1024,
        0,
        0
    },
    [PSPRITE_GUNSHIP_END] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_ELECTRIC_WATER_DAMAGE_BOX_2] = {
        0,
        4,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_FROZEN_RIDLEY] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GOLD_SCISER_DOOR_LOCK] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_GOLD_ZEBESIAN_DOOR_LOCK] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SA_X_OMEGA_CUTSCENE] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_METROID_HUSK] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_RIDLEY] = {
        4500,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES,
        1024,
        0,
        0
    },
    [PSPRITE_RIDLEY_PRE_SPAWN] = {
        0,
        0,
        SDRT_30_10,
        WEAKNESS_NONE,
        1024,
        0,
        0
    },
    [PSPRITE_SA_X_TRO_2] = {
        64000,
        500,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CAN_BE_FROZEN,
        1024,
        0,
        0
    },
    [PSPRITE_NIGHTMARE] = {
        1200,
        70,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE,
        1024,
        0,
        0
    }
};

/**
 * @brief Stats of the secondary sprites
 * 0 : Spawn health
 * 1 : Damage
 * 2 : Suit reduction
 * 3 : Weaknesses
 */
const u16 sSecondarySpriteStats[SSPRITE_END][4] = {
    [SSPRITE_SA_X_ICE_BEAM] = {
        0,
        200,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SA_X_SUPER_MISSILE] = {
        0,
        100,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_HORNOAD_SPIT] = {
        0,
        10,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_HALZYN_WING] = {
        15,
        42,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN
    },
    [SSPRITE_SCISER_PROJECTILE] = {
        0,
        20,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ZEBESIAN_BEAM] = {
        0,
        18,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_GUNSHIP_PART] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_NAVIGATION_CONSOLE] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_NAVIGATION_CONSOLE_SCREEN] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_NAVIGATION_SCREEN] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SAVE_PLATFORM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_MOTO_FRONT] = {
        6,
        35,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN
    },
    [SSPRITE_GEEMER_FLASHING_LIGHT] = {
        1,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK | WEAKNESS_CAN_BE_FROZEN
    },
    [SSPRITE_GUNSHIP_BEAM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_E] = {
        1,
        9,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK
    },
    [SSPRITE_GATE_SWITCH] = {
        1,
        0,
        SDRT_30_10,
        WEAKNESS_BEAM_BOMBS
    },
    [SSPRITE_KIHUNTER_WINGS] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_KIHUNTER_SPIT] = {
        0,
        33,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_12] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ATMOSPHERIC_STABILIZER_COVER_DOWN] = {
        1,
        32,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_14] = {
        1,
        10,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK
    },
    [SSPRITE_ARACHNUS_SHELL] = {
        1,
        32,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ARACHNUS_BEAM] = {
        0,
        24,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ARACHNUS_HEAD] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ARACHNUS_LEFT_ARM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ARACHNUS_RIGHT_ARM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ARACHNUS_FIRE_BALL] = {
        0,
        10,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_CORE_X_SHELL_MORPH_BALL] = {
        30,
        10,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_ABILITY_AURA] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_X_BARRIER_STEM] = {
        1,
        18,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_DATA_PAD_CENTER] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_DATA_PAD_SIDES] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ARACHNUS_BEAM_TRAIL] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_RECHARGE_PAD_MONITOR] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_RECHARGE_PAD_SCREEN] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_23] = {
        1,
        32,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_24] = {
        1,
        32,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SECURITY_PAD_MONITOR] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SAVE_YES_NO_CURSOR] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_FAKE_CHOZO_BALL] = {
        1,
        1,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB
    },
    [SSPRITE_CHARGE_BEAM_CORE_X_SHELL] = {
        1,
        15,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_CHARGE_BEAM_CORE_X_EYE] = {
        33,
        15,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_TOXIC_GAS_EXPLOSION] = {
        0,
        40,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_KIHUNTER_BUG] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_REO_WING] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_LAVA_PLUME_WARNING] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_NAMIHE_SPIT] = {
        0,
        54,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_FUNE_SPIT] = {
        0,
        34,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SAVE_PAD_HOLOGRAM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BOX_PART] = {
        300,
        45,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES
    },
    [SSPRITE_DESSGEEGA_SPIKE] = {
        0,
        12,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_33] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_OPERATIONS_ROOM_PAD_CONSOLE] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_OPERATIONS_ROOM_PAD_CONSOLE_SCREEN] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_OPERATIONS_ROOM_PAD_SCREEN] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_WAVER_DEBRIS] = {
        0,
        8,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ZEELA_PROJECTILE] = {
        0,
        36,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SOVA_FIRE] = {
        0,
        36,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_YARD_PROJECTILE] = {
        0,
        42,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_EVIR_COLLISION] = {
        20,
        94,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK
    },
    [SSPRITE_EVIR_PROJECTILE] = {
        1,
        56,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK
    },
    [SSPRITE_BULL_SMOKE] = {
        0,
        22,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_CHOOT_SPIT] = {
        0,
        40,
        SDRT_80_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ZEBESIAN_GROUND_BEAM] = {
        0,
        64,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BLUE_X_ABSORPTION] = {
        0,
        90,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_41] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_X_BARRIER_CORE_SUPER_STEM] = {
        1,
        56,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_X_BARRIER_CORE_POWER_BOMB_STEM] = {
        1,
        30,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SA_X_POWER_BOMB] = {
        0,
        20,
        SDRT_60_30 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_GADORA_ROOTS] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_GADORA_BEAM] = {
        0,
        10,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_GADORA_EYE] = {
        24,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES
    },
    [SSPRITE_48] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_NIGHTMARE_FALLING_ARM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_MEGA_X_SHIELD] = {
        1,
        20,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM
    },
    [SSPRITE_BOX_FALLING_DEBRIS] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_NETTORI_PART] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_4D] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BEAM_CORE_X_CHARGE_BEAM] = {
        0,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BEAM_CORE_X_WIDE_BEAM] = {
        0,
        50,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BEAM_CORE_X_PLASMA_BEAM] = {
        0,
        70,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BEAM_CORE_X_WAVE_BEAM] = {
        0,
        100,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SAMUS_EATER_SPORE] = {
        1,
        25,
        SDRT_90_80,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB
    },
    [SSPRITE_NETTORI_PLASMA_BEAM] = {
        1,
        70,
        SDRT_90_80,
        WEAKNESS_NONE
    },
    [SSPRITE_WIDE_BEAM_CORE_X_SHELL] = {
        1,
        16,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_WIDE_BEAM_CORE_X_EYE] = {
        150,
        16,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_PLASMA_BEAM_CORE_X_SHELL] = {
        1,
        24,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_PLASMA_BEAM_CORE_X_EYE] = {
        200,
        24,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_WAVE_BEAM_CORE_X_SHELL] = {
        1,
        32,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_WAVE_BEAM_CORE_X_EYE] = {
        170,
        32,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_ZAZABI_PART] = {
        1,
        35,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SERRIS_PART] = {
        1,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_CORE_X_STATIC_BEFORE_VARIA_CORE] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_CORE_X_SHELL_BEFORE_VARIA_CORE] = {
        180,
        40,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_CORE_X_SHELL_HIGH_JUMP] = {
        40,
        20,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_CORE_X_SHELL_SPEEDBOOSTER] = {
        50,
        30,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_CORE_X_SHELL_VARIA] = {
        180,
        40,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_CORE_X_SHELL_SPACE_JUMP] = {
        240,
        45,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_CORE_X_SHELL_GRAVITY] = {
        240,
        50,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_CORE_X_SHELL_SCREW_ATTACK] = {
        270,
        55,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_YAKUZA_PART] = {
        1,
        65,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_GENESIS_SPIT] = {
        0,
        90,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ZEBESIAN_AQUA_PROJECTILE] = {
        0,
        55,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_67] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_68] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BABY_DACHORA] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SA_X_SHOOTING_AT_LAB_EXPLOSION] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_SA_X_MONSTER_PART] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BOX_2_PART] = {
        500,
        90,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES
    },
    [SSPRITE_BOX_2_MISSILE] = {
        5,
        50,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK
    },
    [SSPRITE_BOX_2_BRAIN_TOP] = {
        1,
        10,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BOX_2_BRAIN_BOTTOM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_OMEGA_METROID_PART] = {
        1,
        50,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BOX_BOMB] = {
        1,
        25,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES
    },
    [SSPRITE_BOX_FIRE] = {
        1,
        20,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_FROZEN_RIDLEY_X] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_BEAM_CORE_X_ICE_BEAM] = {
        0,
        135,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ICE_BEAM_CORE_X_SHELL] = {
        1,
        40,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_ICE_BEAM_CORE_X_EYE] = {
        240,
        40,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_MISSILES
    },
    [SSPRITE_SERRIS_BLOCK] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_MEGA_X] = {
        100,
        40,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM
    },
    [SSPRITE_GUNSHIP_END_BEAM] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_7A] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_RIDLEY_PART] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_RIDLEY_TAIL_PART] = {
        100,
        40,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_RIDLEY_FIRE] = {
        0,
        25,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_YAKUZA_PROJECTILE] = {
        1,
        45,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_BEAM_BOMBS | WEAKNESS_MISSILES | WEAKNESS_POWER_BOMB | WEAKNESS_SPEEDBOOSTER_SCREW_ATTACK
    },
    [SSPRITE_YAKUZA_FALLING_LEG] = {
        0,
        0,
        SDRT_30_10 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    },
    [SSPRITE_NIGHTMARE_PART] = {
        600,
        50,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_CHARGE_BEAM | WEAKNESS_MISSILES
    },
    [SSPRITE_NIGHTMARE_BEAM] = {
        1,
        42,
        SDRT_90_80 | SDRT_CAN_CREATE_DEBRIS,
        WEAKNESS_NONE
    }
};
