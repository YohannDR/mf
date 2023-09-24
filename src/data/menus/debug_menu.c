#include "data/menus/debug_menu.h"
#include "macros.h"
#include "gba.h"
#include "globals.h"

#include "constants/samus.h"

const u8 sDebugMenuBeamFlags[5] = {
    [0] = BF_CHARGE_BEAM,
    [1] = BF_WIDE_BEAM,
    [2] = BF_PLASMA_BEAM,
    [3] = BF_WAVE_BEAM,
    [4] = BF_ICE_BEAM,
};

const u8 sDebugMenuMissileFlags[4] = {
    [0] = MBF_MISSILES,
    [1] = MBF_SUPER_MISSILES,
    [2] = MBF_ICE_MISSILES,
    [3] = MBF_DIFFUSION_MISSILES,
};

const u8 sDebugMenuBombFlags[2] = {
    [0] = MBF_BOMBS,
    [1] = MBF_POWER_BOMBS,
};

const u8 sDebugMenuSuitFlags[2] = {
    [0] = SMF_VARIA_SUIT,
    [1] = SMF_GRAVITY_SUIT,
};

const u8 sDebugMenuMiscFlags[5] = {
    [0] = SMF_MORPH_BALL,
    [1] = SMF_HIGH_JUMP,
    [2] = SMF_SPEED_BOOSTER,
    [3] = SMF_SPACE_JUMP,
    [4] = SMF_SCREW_ATTACK,
};

const u8 sStatusScreenSectionSizes[5] = {
    [0] = ARRAY_SIZE(sDebugMenuBeamFlags),
    [1] = ARRAY_SIZE(sDebugMenuMissileFlags),
    [2] = ARRAY_SIZE(sDebugMenuBombFlags),
    [3] = ARRAY_SIZE(sDebugMenuSuitFlags),
    [4] = ARRAY_SIZE(sDebugMenuMiscFlags),
};

const u16 sDebugMenuNumbersIncrementValues[5] = {
    [0] = 1,
    [1] = 10,
    [2] = 100,
    [3] = 1000,
    [4] = 10000,
};

const u16 sDebugMenuNumbersMaxValues[3] = {
    [DEBUG_AMMO_TYPE_HEALTH] = 2099,
    [DEBUG_AMMO_TYPE_MISSILES] = 255,
    [DEBUG_AMMO_TYPE_POWER_BOMBS] = 254,
};

const u8 sMinimap_576190[48];
const u8 sMinimap_5761C0[48];

const void* const sPauseScreen_5761f0[8] = {
    [0] = VRAM_OBJ + 0x3760 + 0x60 * 1,
    [1] = VRAM_OBJ + 0x3760 + 0x60 * 2,
    [2] = VRAM_OBJ + 0x3B60 + 0x60 * 1,
    [3] = VRAM_OBJ + 0x3B60 + 0x60 * 2,
    [4] = VRAM_OBJ + 0x3F60 + 0x60 * 1,
    [5] = VRAM_OBJ + 0x3F60 + 0x60 * 2,
    [6] = VRAM_OBJ + 0x3360 + 0x60 * 1,
    [7] = VRAM_OBJ + 0x3360 + 0x60 * 2,
};

const u8 sMaintainedInputDelays[7] = {
    [0] = 15,
    [1] = 10,
    [2] = 6,
    [3] = 4,
    [4] = 4,
    [5] = 4,
    [6] = 2,
};

// ... 

/*const u8 sDebugMenuEventNames[EVENT_END][EVENT_NAME_SIZE] = {
    [EVENT_NONE] = {
        "TOHOKANKO   ﾄｸﾍﾞﾂﾎｶﾝｺﾍ ﾑｶｴ  "
    },
    [EVENT_NAVIGATION_ROOM_BEFORE_QUARANTINE_BAY] = {
        "TOHOKANKO2  ﾄｸﾍﾞﾂﾎｶﾝｺﾉ ﾁｮｳｻ "
    },
    [EVENT_QUARANTINE_BAY_HORNOAD_DEAD] = {
        "HOKANKO     ﾅﾋﾞﾍ ﾓﾄﾞﾚ       "
    },
    [EVENT_NAVIGATION_ROOM_AFTER_QUARANTINE_BAY] = {
        "TOMARUKARA  ｷｮﾀﾞｲｾｲﾌﾞﾂｦ ﾀｵｾ "
    },
    [EVENT_NAVIGATION_ROOM_BEFORE_ELEVATOR] = {
        "TOMISSILE   ﾐｻｲﾙｦ ﾆｭｳｼｭｾﾖ   "
    },
    [EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_1] = {
        "DATA3       ﾄﾅﾘﾉ ﾍﾔﾍ        "
    },
    [EVENT_ENTERED_MISSILE_DATA_ROOM] = {
        "TODATA      ﾃﾞｰﾀﾙｰﾑﾆ ﾊｲﾙ    "
    },
    [EVENT_MISSILE_DATA_DOWNLOADED] = {
        "MISSILE     ﾃﾞｰﾀﾙｰﾑﾃﾞ ﾐｻｲﾙｦ "
    },
    [EVENT_ENTERED_NAVIGATION_ROOM_POWER_OUTAGE] = {
        "DOWNENE     ﾃﾞﾝｹﾞﾝｶﾞ ｵﾁﾀ    "
    },
    [EVENT_NAVIGATION_ROOM_AFTER_MISSILES] = {
        "TOMARUKARA2 ｷｮﾀﾞｲｾｲﾌﾞﾂｦ ﾀｵｾ2"
    },
    [EVENT_MORPH_BALL_ABILITY_RECOVERED] = {
        "DOWNBOSS1   ﾅﾋﾞﾍ ﾑｶｴ        "
    },
    [EVENT_NAVIGATION_ROOM_AFTER_MORPH_BALL] = {
        "TOKUTYOU    SR388ﾍ ﾑｶｴ      "
    },
    [EVENT_ENTERED_ELEVATOR_ROOM] = {
        "ELESTART    ｴﾚﾃﾞﾓ SR388ﾍﾑｶｴ "
    },
    [EVENT_SA_X_ELEVATOR_CUTSCENE_ENDS] = {
        "ELEEND      ﾃﾞﾓｴﾝﾄﾞ SR388ﾍ  "
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_SRX] = {
        "TOKUTYOU2   ｸｳﾁｮｳﾒﾛﾝｦ ﾀｵｾ   "
    },
    [EVENT_CHARGE_BEAM_ABILITY_RECOVERED] = {
        "POWERB      ｺｱXｺﾞ ﾉｺﾘﾊｶｲｾﾖ  "
    },
    [EVENT_ALL_STABILIZERS_ONLINE] = {
        "KUTYOU      ﾊｶｲｺﾞ ﾅﾋﾞﾍ ﾑｶｴ  "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_SRX] = {
        "TOBOM       ﾎﾞﾑｦ ﾆｭｳｼｭｾﾖ    "
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_TRO] = {
        "TOLV1KEY    ﾚﾍﾞﾙ1ｦ ｶｲｼﾞｮｾﾖ  "
    },
    [EVENT_SECURITY_LEVEL_1_UNLOCKED] = {
        "LV1KEY      ﾚﾍﾞﾙ1ｶｲｼﾞｮ      "
    },
    [EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_2] = {
        "TOBOM2      ｶｲｼﾞｮｺﾞ ﾎﾞﾑﾃﾞｰﾀﾍ"
    },
    [EVENT_ENTERING_BOMB_DATA_ROOM] = {
        "DATATRO     ﾃﾞｰﾀﾙｰﾑﾆ ﾊｲﾙ    "
    },
    [EVENT_BOMB_DATA_DOWNLOADED] = {
        "BOM         ﾈｯﾀｲｶﾗ ﾀﾞｯｼｭﾂｾﾖ "
    },
    [EVENT_SA_X_QUAKE] = {
        "BOMQUAKE    ﾎﾞﾑｺﾞ ｼﾞｼﾝ      "
    },
    [EVENT_LEFT_SA_X_QUAKE_ROOM] = {
        "BOMQUAKE2   ｼﾞｼﾝ ｼｭｳﾘｮｳ     "
    },
    [EVENT_HIGH_JUMP_ABILITY_RECOVERED] = {
        "DOWNBOSS2   ﾎﾞｽﾉﾉﾁ ﾀﾞｯｼｭﾂ   "
    },
    [EVENT_ESCAPED_TRO_1_SA_X] = {
        "TROSAX      SAXｶﾗ ﾆｹﾞﾙ      "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_TRO] = {
        "TOWATER     ｽｲﾁｭｳｾｸｼｮﾝﾍ     "
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_AQA] = {
        "WATER       ｽｲｲｦ ｻｹﾞﾛ       "
    },
    [EVENT_SPEED_BOOSTER_ABILITY_RECOVERED] = {
        "DOWNBOSS3   ﾎﾞｽﾉﾉﾁ ｽｲｲｦｻｹﾞﾛ "
    },
    [EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_3] = {
        "TOWATSWITCH ﾀﾞｯｼｭﾉ ｾﾂﾒｲ     "
    },
    [EVENT_ENTERED_PUMP_CONTROL_UNIT] = {
        "WATSWTROOM  ｽｲｲﾍﾝｺｳﾍﾔ       "
    },
    [EVENT_WATER_LEVEL_LOWERED] = {
        "WATSWITCH   ｽｲｲﾍﾝｺｳ         "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_AQA] = {
        "TOPWMISSILE ﾊﾟﾜｰﾐｻｲﾙｦ ﾃﾆｲﾚﾛ "
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_PYR] = {
        "TOLV2KEY    ﾚﾍﾞﾙ2ｦ ｶｲｼﾞｮｾﾖ  "
    },
    [EVENT_SECURITY_LEVEL_2_UNLOCKED] = {
        "LV2KEY      ﾚﾍﾞﾙ2ｶｲｼﾞｮ      "
    },
    [EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_4] = {
        "TOPWMISSILE2Pﾐｻｲﾙﾍ ｶｲｼﾞｮｺﾞ  "
    },
    [EVENT_ENTERED_SUPER_MISSILE_DATA_ROOM] = {
        "DATABUR     ﾃﾞｰﾀﾙｰﾑﾆ ﾊｲﾙ    "
    },
    [EVENT_SUPER_MISSILE_DATA_DOWNLOADED] = {
        "PWMISSILE   ﾊﾟﾜｰﾐｻｲﾙ ｶﾝﾘｮｳ  "
    },
    [EVENT_TRIGGERED_BOX_RUMBLE] = {
        "DOTADOTA    ｵｰﾄﾃﾞﾓｺﾞﾆ ﾓﾄﾞﾚ  "
    },
    [EVENT_BOX_DEFEATED] = {
        "DOWNBOSSA1  ﾎﾞｽA ﾀｵｽ        "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_PYR] = {
        "TOENEGAS    ｱﾝｺｸｾｸｼｮﾝﾍ ﾑｶｴ  "
    },
    [EVENT_LEFT_NAVIGATION_ROOM] = {
        "ADAMRENPO   ｱﾀﾞﾑ ﾚﾝﾎﾟｳ      "
    },
    [EVENT_SECRET_CONVERSATION] = {
        "ADAMRENPODEMOｱﾀﾞﾑﾚﾝﾎﾟｳﾁｭ    "
    },
    [EVENT_SECRET_CONVERSATION_OVER] = {
        "ADAMRENPOENDｱﾀﾞﾑﾚﾝﾎﾟｴﾝﾄﾞ    "
    },
    [EVENT_SKIPPED_BY_USING_NOC_NAVIGATION_ROOM] = {
        "TOANKOKU    ｱﾝｺｸ ｲｶﾞｲﾃﾞ ｺｳｼﾝ"
    },
    [EVENT_ENTERED_NOC_NAVIGATION_ROOM] = {
        "DARNAVI     ｱﾝｺｸﾅﾋﾞﾆ ﾊｲﾙ    "
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_NOC] = {
        "TOENEGAS2   ﾎﾞｽ4ｦ ﾀｵｾ       "
    },
    [EVENT_NOC_SA_X_ENCOUNTER] = {
        "DARSAX      SAXﾆ ｱｳ         "
    },
    [EVENT_ESCAPED_NOC_SA_X] = {
        "DARSAXESC   SAXｶﾗ ﾆｹﾞｷﾙ     "
    },
    [EVENT_NOC_DATA_ROOM_DESTROYED] = {
        "BARILOSS    ﾊﾞﾘｱ ｽﾜﾚﾙ       "
    },
    [EVENT_VARIA_SUIT_ABILITY_RECOVERED] = {
        "DOWNBOSS4   ﾅﾋﾞﾍ ﾓﾄﾞﾚ       "
    },
    [EVENT_REACHED_TOP_OF_ROOM_AFTER_VARIA] = {
        "CXESCAPE    ｺｰﾙﾄﾞX ﾆｹﾞﾙ     "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_NOC] = {
        "TOFREEZEM   ｺﾞｯｶﾝｾｸｼｮﾝﾍ ﾑｶｴ "
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_ARC] = {
        "TOLV3KEY    ﾚﾍﾞﾙ3ｦ ｶｲｼﾞｮｾﾖ  "
    },
    [EVENT_SECURITY_LEVEL_3_UNLOCKED] = {
        "LV3KEY      ﾚﾍﾞﾙ3ｶｲｼﾞｮ      "
    },
    [EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_5] = {
        "TOFREEZEM2  ｱｲｽﾐｻｲﾙｦ ﾆｭｳｼｭｾﾖ"
    },
    [EVENT_ENTERED_ICE_MISSILE_DATA_ROOM] = {
        "DATAFRI     ﾃﾞｰﾀﾙｰﾑﾆ ﾊｲﾙ    "
    },
    [EVENT_ICE_MISSILE_DATA_DOWNLOADED] = {
        "FREEZEM     ｱｲｽﾐｻｲﾙ ｶﾝﾘｮｳ   "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_ARC] = {
        "TOENEBALL   ﾈﾂﾎﾞｳｿｳ ｶｲｼ     "
    },
    [EVENT_WIDE_BEAM_ABILITY_RECOVERED] = {
        "WIDEB       ｺﾝｿｰﾙｦ ｵｾ       "
    },
    [EVENT_COOLING_UNIT_OPERATIONAL] = {
        "ENEBALL     ﾅﾋﾞﾍ ﾓﾄﾞﾚ       "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_PYR_2] = {
        "TOETEKON    ｷｮｼﾞｭｳｸﾍ ﾑｶｴ    "
    },
    [EVENT_ANIMALS_RELEASED] = {
        "ETEKON      ﾅﾋﾞﾍ ｷｭｳｼｭﾂｺﾞ   "
    },
    [EVENT_NAVIGATION_ROOM_AFTER_ANIMALS] = {
        "TOPBOM      ﾊﾟﾜｰﾎﾞﾑｦ ﾆｭｳｼｭｾﾖ"
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_ARC_2] = {
        "TOPBOM2     ｺﾞｯｶﾝ ｺｳｼﾝ      "
    },
    [EVENT_POWER_BOMB_DATA_DOWNLOADED] = {
        "PBOM        ﾊﾟﾜｰﾎﾞﾑ ｶﾝﾘｮｳ   "
    },
    [EVENT_ARC_SA_X_ENCOUNTER] = {
        "FRISAX      SAXﾆ ﾃﾞｱｳ       "
    },
    [EVENT_ESCAPED_ARC_SA_X] = {
        "FRISAXESC   SAXｶﾗ ﾆｹﾞｷﾙ     "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_ARC_2] = {
        "TOSTARSHIP  ｽﾍﾟｰｽｼｯﾌﾟﾍ ﾑｶｴ  "
    },
    [EVENT_POWER_OUTAGE] = {
        "ENGDOWN     ｽﾍﾟｰｽｼｯﾌﾟﾍﾑｶｴ   "
    },
    [EVENT_ENTERED_SHIP] = {
        "TODOURYOKU  ﾎｼﾞｮ ﾃﾞﾝｹﾞﾝｦ ｲﾚﾛ"
    },
    [EVENT_ENTERED_YAKUZA_ROOM] = {
        "BOSS5ROOM   ﾎﾞｽ ﾍﾔ          "
    },
    [EVENT_SPACE_JUMP_ABILITY_RECOVERED] = {
        "DOWNBOSS5   ﾎｼﾞｮﾃﾞﾝｹﾞﾝｦｲﾚﾛ  "
    },
    [EVENT_AUXILARY_POWER_ENGAGED] = {
        "SUBENG      ﾎｼﾞｮﾃﾞﾝｹﾞﾝ ｶﾝﾘｮｳ"
    },
    [EVENT_NAVIGATION_ROOM_AFTER_YAKUZA] = {
        "TOPLASMAB   ﾈｯﾀｲｾｸｼｮﾝﾍ ﾑｶｴ  "
    },
    [EVENT_ENGAGED_TRO_2_SA_X] = {
        "TROSAX2     SAXﾆ ﾃﾞｱｳ       "
    },
    [EVENT_ESCAPED_TRO_2_SA_X] = {
        "TROSAX2ESC  SAXｶﾗ ﾆｹﾞｷﾙ     "
    },
    [EVENT_PLASMA_BEAM_ABILITY_RECOVERED] = {
        "PLASMAB     ﾄﾞｳﾘｮｸ ｶｲﾌｸ ﾅﾋﾞﾍ"
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_TRO_2] = {
        "TOGOKAN     ｺﾞｯｶﾝ ﾎﾞｽｦ ﾀｵｾ  "
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_ARC_3] = {
        "TOGOKAN2    ｺﾞｯｶﾝﾅﾋﾞﾃﾞ ｺｳｼﾝ "
    },
    [EVENT_GRAVITY_SUIT_ABILITY_RECOVERED] = {
        "DOWNBOSS6   ﾎﾞｽ ﾀｵｽ ﾅﾋﾞﾍ    "
    },
    [EVENT_ENTERED_LEVEL_4_SECURITY_ROOM] = {
        "TOLV4KEY    ﾚﾍﾞﾙ4ｦ ｶｲｼﾞｮｾﾖ  "
    },
    [EVENT_SECURITY_LEVEL_4_UNLOCKED] = {
        "LV4KEY      ﾚﾍﾞﾙ4ｶｲｼﾞｮ      "
    },
    [EVENT_SECRET_MESSAGE_2] = {
        "TOKAKUSAN2  ｶｸｻﾝｦ ﾆｭｳｼｭｾﾖ2  "
    },
    [EVENT_ENTERED_DIFFUSION_MISSILE_DATA_ROOM] = {
        "DATAWAT     ﾃﾞｰﾀﾙｰﾑﾆ ﾊｲﾙ    "
    },
    [EVENT_DIFFUSION_MISSILE_DATA_DOWNLOADED] = {
        "KAKUSAN     ｶｸｻﾝ ﾆｭｳｼｭ ﾅﾋﾞﾍ "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_AQA_2] = {
        "TOANKOKUOKU ｱﾝｺｸ ｶｸｼｦ ｻｶﾞｾ  "
    },
    [EVENT_NAVIGATION_ROOM_ENTERING_NOC_2] = {
        "TOSHUTTER   ｱﾝｺｸﾅﾋﾞﾃﾞ ｺｳｼﾝ  "
    },
    [EVENT_RESTRICTED_ZONE_WARNING] = {
        "SHUTTER     ｱﾝｺｸﾉ ｵｸﾍ       "
    },
    [EVENT_TRIGGERED_BOX_2_RUMBLE] = {
        "SHUTTER2    ｼｬｯﾀｰ ｼﾞｼﾝ      "
    },
    [EVENT_WAVE_BEAM_ABILITY_RECOVERED] = {
        "WAVEB       ｱﾝｺｸﾉ ｵｸﾍ2      "
    },
    [EVENT_RESTRICTED_LABORATORY_EXPLOSION] = {
        "TOGOKUHIKEN ｺﾞｸﾋ ﾃﾞﾓ        "
    },
    [EVENT_60_SECONDS_TO_DETACHMENT] = {
        "RANSHA      ﾗﾝｼｬ ｱﾝﾄﾞ ﾀｲﾏｰ  "
    },
    [EVENT_ESCAPED_RESTRICTED_LABORATORY] = {
        "TOKIRIHANA  ｷﾘﾊﾅｼ           "
    },
    [EVENT_NAVIGATION_ROOM_AFTER_RESTRICTED_LABORATORY] = {
        "KIRIHANA    ｶｻｲｺﾞ ｺｳｼﾝ      "
    },
    [EVENT_SCREW_ATTACK_ABILITY_RECOVERED] = {
        "DOWNBOSS7   ﾎﾞｽ7 ﾀｵｼ ﾀﾞｯｼｭﾂ "
    },
    [EVENT_NAVIGATION_ROOM_LEAVING_SRX_2] = {
        "TOOPE       ｼﾝｼﾞﾂ           "
    },
    [EVENT_END_OF_FIRST_CONVERSATION] = {
        "TOOPEMONO   ﾓﾉﾛｰｸﾞ          "
    },
    [EVENT_SECOND_CONVERSATION] = {
        "TOOPE2      ｷﾄﾞｳｦ ｶｴﾛ       "
    },
    [EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_6] = {
        "TOOPE3      ｱﾀﾞﾑ ｻｲﾄﾞ ｺｳｼﾝ  "
    },
    [EVENT_ENTERED_OPERATION_DECK] = {
        "INTOOPE     ｵﾍﾟﾚｰｼｮﾝﾆ ﾊｲﾙ   "
    },
    [EVENT_SA_X_DEFEATED] = {
        "DOWNSAX     SAXｦ ﾀｵｽ        "
    },
    [EVENT_ORBIT_CHANGE_IMPLEMENTED] = {
        "KIDOUKAE    ｷﾄﾞｳｦ ｶｴﾙ       "
    },
    [EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_7] = {
        "ESCAPE      ｷﾄﾞｳﾍﾝｺｳｺﾞ ｺｳｼﾝ "
    },
    [EVENT_ENTERED_SHIP_ROOM] = {
        "OMEGA       ﾒﾄﾛｲﾄﾞ ﾄ ｾﾝﾄｳ   "
    },
    [EVENT_SA_X_KILLED_BY_OMEGA_METROID] = {
        "DOWNSAX2    ｵﾒｶﾞ SAXｦ ﾀｵｽ   "
    },
    [EVENT_ICE_BEAM_ABILITY_RECOVERED] = {
        "ICEBEAM     ｱｲｽﾋﾞｰﾑ ｶｸﾄｸ    "
    },
    [EVENT_OMEGA_METROID_DEFEATED] = {
        "DOWNOMEGA   ﾒﾄﾛｲﾄﾞ ｦ ﾀｵｽ    "
    },
    [EVENT_ESCAPED_ON_SHIP] = {
        "END         ｴﾝﾄﾞ            "
    }
};*/

const u8 sDebugLocationSectionInfo[2][2] = {
    [0] = {
        [0] = 12,
        [1] = 17,
    },
    [1] = {
        [0] = 13,
        [1] = 17,
    }
};

const u8 sDebugSectionInfo[DEBUG_SECTION_END][5] = {
    [DEBUG_SECTION_BEAM] = {
        [0] = 4,
        [1] = 4 + ARRAY_SIZE(sDebugMenuBeamFlags) - 1,
        [2] = 1,
        [3] = 7,
        [4] = DEBUG_SECTION_BEAM,
    },
    [DEBUG_SECTION_MISSILE] = {
        [0] = 11,
        [1] = 11 + ARRAY_SIZE(sDebugMenuMissileFlags) - 1,
        [2] = 1,
        [3] = 7,
        [4] = DEBUG_SECTION_MISSILE,
    },
    [DEBUG_SECTION_BOMB] = {
        [0] = 3,
        [1] = 3 + ARRAY_SIZE(sDebugMenuBombFlags) - 1,
        [2] = 9,
        [3] = 15,
        [4] = DEBUG_SECTION_BOMB,
    },
    [DEBUG_SECTION_SUIT] = {
        [0] = 7,
        [1] = 7 + ARRAY_SIZE(sDebugMenuSuitFlags) - 1,
        [2] = 9,
        [3] = 15,
        [4] = DEBUG_SECTION_SUIT,
    },
    [DEBUG_SECTION_MISC] = {
        [0] = 11,
        [1] = 11 + ARRAY_SIZE(sDebugMenuMiscFlags) - 1,
        [2] = 9,
        [3] = 15,
        [4] = DEBUG_SECTION_MISC,
    },
    [DEBUG_SECTION_ENERGY_CURRENT] = {
        [0] = 2,
        [1] = 2,
        [2] = 25,
        [3] = 28,
        [4] = DEBUG_SECTION_ENERGY_CURRENT,
    },
    [DEBUG_SECTION_ENERGY_MAX] = {
        [0] = 3,
        [1] = 3,
        [2] = 25,
        [3] = 28,
        [4] = DEBUG_SECTION_ENERGY_MAX,
    },
    [DEBUG_SECTION_SUPPLY] = {
        [0] = UCHAR_MAX,
        [1] = UCHAR_MAX,
        [2] = 1,
        [3] = 1,
        [4] = DEBUG_SECTION_SUPPLY,
    },
    [DEBUG_SECTION_MISSILE_CURRENT] = {
        [0] = 5,
        [1] = 5,
        [2] = 26,
        [3] = 28,
        [4] = DEBUG_SECTION_MISSILE_CURRENT,
    },
    [DEBUG_SECTION_MISSILE_MAX] = {
        [0] = 6,
        [1] = 6,
        [2] = 26,
        [3] = 28,
        [4] = DEBUG_SECTION_MISSILE_MAX,
    },
    [DEBUG_SECTION_POWER_BOMB_CURRENT] = {
        [0] = 7,
        [1] = 7,
        [2] = 26,
        [3] = 28,
        [4] = DEBUG_SECTION_POWER_BOMB_CURRENT,
    },
    [DEBUG_SECTION_POWER_BOMB_MAX] = {
        [0] = 8,
        [1] = 8,
        [2] = 26,
        [3] = 28,
        [4] = DEBUG_SECTION_POWER_BOMB_MAX,
    },
    [DEBUG_SECTION_ABILITY_COUNT] = {
        [0] = 9,
        [1] = 9,
        [2] = 27,
        [3] = 28,
        [4] = DEBUG_SECTION_ABILITY_COUNT,
    },
    [DEBUG_SECTION_SECURITY] = {
        [0] = 15,
        [1] = 15,
        [2] = 24,
        [3] = 24 + SECURITY_LEVEL_4,
        [4] = DEBUG_SECTION_SECURITY,
    },
    [DEBUG_SECTION_MAP] = {
        [0] = 18,
        [1] = 18,
        [2] = 1,
        [3] = 1 + AREA_NORMAL_END,
        [4] = DEBUG_SECTION_MAP,
    },
    [DEBUG_SECTION_EVENT] = {
        [0] = 10,
        [1] = 10,
        [2] = 26,
        [3] = 28,
        [4] = DEBUG_SECTION_EVENT,
    },
    [DEBUG_SECTION_SUB_EVENT] = {
        [0] = 14,
        [1] = 14,
        [2] = 26,
        [3] = 28,
        [4] = DEBUG_SECTION_SUB_EVENT,
    },
    [DEBUG_SECTION_IN_GAME_TIME] = {
        [0] = 18,
        [1] = 18,
        [2] = 23,
        [3] = 28,
        [4] = DEBUG_SECTION_IN_GAME_TIME,
    },
    [DEBUG_SECTION_QUICK_SAVE] = {
        [0] = 15,
        [1] = 15,
        [2] = 17,
        [3] = 21,
        [4] = DEBUG_SECTION_QUICK_SAVE,
    },
};
