#ifndef EVENT_CONSTANTS_H
#define EVENT_CONSTANTS_H

#include "types.h"

enum Event {
    EVENT_NONE,
    EVENT_NAVIGATION_ROOM_BEFORE_QUARANTINE_BAY,
    EVENT_QUARANTINE_BAY_HORNOAD_DEAD,
    EVENT_NAVIGATION_ROOM_AFTER_QUARANTINE_BAY,
    EVENT_NAVIGATION_ROOM_BEFORE_ELEVATOR,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_1,
    EVENT_ENTERED_MISSILE_DATA_ROOM,
    EVENT_MISSILE_DATA_DOWNLOADED,
    EVENT_ENTERED_NAVIGATION_ROOM_POWER_OUTAGE,
    EVENT_NAVIGATION_ROOM_AFTER_MISSILES,
    EVENT_MORPH_BALL_ABILITY_RECOVERED,
    EVENT_NAVIGATION_ROOM_AFTER_MORPH_BALL,
    EVENT_ENTERED_ELEVATOR_ROOM,
    EVENT_SA_X_ELEVATOR_CUTSCENE_ENDS,
    EVENT_NAVIGATION_ROOM_ENTERING_SRX,
    EVENT_CHARGE_BEAM_ABILITY_RECOVERED,
    EVENT_ALL_STABILIZERS_ONLINE,
    EVENT_NAVIGATION_ROOM_LEAVING_SRX,
    EVENT_NAVIGATION_ROOM_ENTERING_TRO,
    EVENT_SECURITY_LEVEL_1_UNLOCKED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_2,
    EVENT_ENTERING_BOMB_DATA_ROOM,
    EVENT_BOMB_DATA_DOWNLOADED,
    EVENT_SA_X_QUAKE,
    EVENT_LEFT_SA_X_QUAKE_ROOM,
    EVENT_HIGH_JUMP_ABILITY_RECOVERED,
    EVENT_ESCAPED_TRO_1_SA_X,
    EVENT_NAVIGATION_ROOM_LEAVING_TRO,
    EVENT_NAVIGATION_ROOM_ENTERING_AQA,
    EVENT_SPEED_BOOSTER_ABILITY_RECOVERED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_3,
    EVENT_ENTERED_PUMP_CONTROL_UNIT,
    EVENT_WATER_LEVEL_LOWERED,
    EVENT_NAVIGATION_ROOM_LEAVING_AQA,
    EVENT_NAVIGATION_ROOM_ENTERING_PYR,
    EVENT_SECURITY_LEVEL_2_UNLOCKED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_4,
    EVENT_ENTERED_SUPER_MISSILE_DATA_ROOM,
    EVENT_SUPER_MISSILE_DATA_DOWNLOADED,
    EVENT_TRIGGERED_BOX_RUMBLE,
    EVENT_BOX_DEFEATED,
    EVENT_NAVIGATION_ROOM_LEAVING_PYR,
    EVENT_LEFT_NAVIGATION_ROOM,
    EVENT_SECRET_CONVERSATION,
    EVENT_SECRET_CONVERSATION_OVER,
    EVENT_SKIPPED_BY_USING_NOC_NAVIGATION_ROOM,
    EVENT_ENTERED_NOC_NAVIGATION_ROOM,
    EVENT_NAVIGATION_ROOM_ENTERING_NOC,
    EVENT_NOC_SA_X_ENCOUNTER,
    EVENT_ESCAPED_NOC_SA_X,
    EVENT_NOC_DATA_ROOM_DESTROYED,
    EVENT_VARIA_SUIT_ABILITY_RECOVERED,
    EVENT_REACHED_TOP_OF_ROOM_AFTER_VARIA,
    EVENT_NAVIGATION_ROOM_LEAVING_NOC,
    EVENT_NAVIGATION_ROOM_ENTERING_ARC,
    EVENT_SECURITY_LEVEL_3_UNLOCKED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_5,
    EVENT_ENTERED_ICE_MISSILE_DATA_ROOM,
    EVENT_ICE_MISSILE_DATA_DOWNLOADED,
    EVENT_NAVIGATION_ROOM_LEAVING_ARC,
    EVENT_WIDE_BEAM_ABILITY_RECOVERED,
    EVENT_COOLING_UNIT_OPERATIONAL,
    EVENT_NAVIGATION_ROOM_LEAVING_PYR_2,
    EVENT_ANIMALS_RELEASED,
    EVENT_NAVIGATION_ROOM_AFTER_ANIMALS,
    EVENT_NAVIGATION_ROOM_ENTERING_ARC_2,
    EVENT_POWER_BOMB_DATA_DOWNLOADED,
    EVENT_ARC_SA_X_ENCOUNTER,
    EVENT_ESCAPED_ARC_SA_X,
    EVENT_NAVIGATION_ROOM_LEAVING_ARC_2,
    EVENT_POWER_OUTAGE,
    EVENT_ENTERED_SHIP,
    EVENT_ENTERED_YAKUZA_ROOM,
    EVENT_SPACE_JUMP_ABILITY_RECOVERED,
    EVENT_AUXILARY_POWER_ENGAGED,
    EVENT_NAVIGATION_ROOM_AFTER_YAKUZA,
    EVENT_ENGAGED_TRO_2_SA_X,
    EVENT_ESCAPED_TRO_2_SA_X,
    EVENT_PLASMA_BEAM_ABILITY_RECOVERED,
    EVENT_NAVIGATION_ROOM_LEAVING_TRO_2,
    EVENT_NAVIGATION_ROOM_ENTERING_ARC_3,
    EVENT_GRAVITY_SUIT_ABILITY_RECOVERED,
    EVENT_ENTERED_LEVEL_4_SECURITY_ROOM,
    EVENT_SECURITY_LEVEL_4_UNLOCKED,
    EVENT_SECRET_MESSAGE_2,
    EVENT_ENTERED_DIFFUSION_MISSILE_DATA_ROOM,
    EVENT_DIFFUSION_MISSILE_DATA_DOWNLOADED,
    EVENT_NAVIGATION_ROOM_LEAVING_AQA_2,
    EVENT_NAVIGATION_ROOM_ENTERING_NOC_2,
    EVENT_RESTRICTED_ZONE_WARNING,
    EVENT_TRIGGERED_BOX_2_RUMBLE,
    EVENT_WAVE_BEAM_ABILITY_RECOVERED,
    EVENT_RESTRICTED_LABORATORY_EXPLOSION,
    EVENT_60_SECONDS_TO_DETACHMENT,
    EVENT_ESCAPED_RESTRICTED_LABORATORY,
    EVENT_NAVIGATION_ROOM_AFTER_RESTRICTED_LABORATORY,
    EVENT_SCREW_ATTACK_ABILITY_RECOVERED,
    EVENT_NAVIGATION_ROOM_LEAVING_SRX_2,
    EVENT_END_OF_FIRST_CONVERSATION,
    EVENT_SECOND_CONVERSATION,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_6,
    EVENT_ENTERED_OPERATION_DECK,
    EVENT_SA_X_DEFEATED,
    EVENT_ORBIT_CHANGE_IMPLEMENTED,
    EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_7,
    EVENT_ENTERED_SHIP_ROOM,
    EVENT_SA_X_KILLED_BY_OMEGA_METROID,
    EVENT_ICE_BEAM_ABILITY_RECOVERED,
    EVENT_OMEGA_METROID_DEFEATED,
    EVENT_ESCAPED_ON_SHIP,

    EVENT_END
};

enum SubEvent {
    SUB_EVENT_NONE,

    SUB_EVENT_FIRST_CONVERSATION_STARTED,
    SUB_EVENT_FIRST_CONVERSATION_ENDED,
    SUB_EVENT_ENTERED_ROOM_AFTER_FIRST_NAVIGATION_ROOM,
    SUB_EVENT_CONVERSATION_AFTER_QUARANTINE_BAY_ENDED,
    SUB_EVENT_LEFT_NAV_ROOM_AFTER_QUARANTINE_BAY,
    SUB_EVENT_OPERATIONS_DECK_ELEVATOR_MONOLOGUE_STARTED,
    SUB_EVENT_OPERATIONS_DECK_ELEVATOR_MONOLOGUE_ENDED,
    SUB_EVENT_OPERATIONS_DECK_ELEVATOR_ENDED,
    SUB_EVENT_ENTERED_OPERATIONS_DECK_LOBBY,
    SUB_EVENT_10,
    SUB_EVENT_DOWNLOADED_MISSILES,
    SUB_EVENT_ENTERED_NAV_ROOM_AFTER_MISSILES,
    SUB_EVENT_ENTERED_DARK_VERTICAL_SHAFT,
    SUB_EVENT_ENTERED_ARACHNUS_ROOM,
    SUB_EVENT_MORPH_BALL_ABILITY_RECOVERED,
    SUB_EVENT_LEFT_ARACHNUS_ROOM,
    SUB_EVENT_POST_ARACHNUS_NAV_CONVERSATION_ENDED,
    SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_START,
    SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_EXPLOSION,
    SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_DOOR_SHOT,
    SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_RUMBLE_1,
    SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_RUMBLE_2,
    SUB_EVENT_ENTERED_SECTOR_1_NAV_ROOM,
    SUB_EVENT_SECTOR_1_NAV_CONVERSATION_ENDED,
    SUB_EVENT_ENTERED_CHARGE_BEAM_ROOM,
    SUB_EVENT_CHARGE_BEAM_ABILITY_RECOVERED,
    SUB_EVENT_LEFT_CHARGE_BEAM_ROOM,
    SUB_EVENT_ENTERED_NAV_ROOM_BEFORE_LEAVING_SECTOR_1,
    SUB_EVENT_29,
    SUB_EVENT_LEAVING_SECTOR_1_NAV_CONVERSATION_ENDED,
    SUB_EVENT_STARTING_ELEVATOR_TO_TRO,
    SUB_EVENT_ENTERED_TRO,
    SUB_EVENT_ENTERED_SECTOR_2_NAV_ROOM,
    SUB_EVENT_SECTOR_2_NAV_CONVERSATION_ENDED,
    SUB_EVENT_ENTERED_FIRST_ROOM_SECTOR_2,
    SUB_EVENT_UNLOCKED_SECURITY_LEVEL_1,
    SUB_EVENT_DOWNLOADED_BOMBS,
    SUB_EVENT_ENTERED_ZAZABI_ROOM,
    SUB_EVENT_HIGH_JUMP_ABILITY_RECOVERED,
    SUB_EVENT_LEFT_ZAZABI_ROOM,
    SUB_EVENT_ENTERED_SA_X_TR0_1_ROOM,
    SUB_EVENT_LEFT_SA_X_TR0_1_ROOM,
    SUB_EVENT_LEAVING_SECTOR_2_NAV_CONVERSATION_ENDED,
    SUB_EVENT_TRO_ELEVATOR_MONOLOGUE_STARTED,
    SUB_EVENT_TRO_ELEVATOR_MONOLOGUE_ENDED,
    SUB_EVENT_TRO_ELEVATOR_ENDED,
    SUB_EVENT_ENTERED_AQA_NAV_ROOM,
    SUB_EVENT_ENTERING_SECTOR_4_NAV_CONVERSATION_ENDED,
    SUB_EVENT_ENTERED_FIRST_ROOM_SECTOR_4,
    SUB_EVENT_ENTERED_SERRIS_TANK_ROOM,
    SUB_EVENT_ENTERED_SERRIS_ROOM,
    SUB_EVENT_SPEED_BOOSTER_ABILITY_RECOVERED,
    SUB_EVENT_LEFT_SERRIS_ROOM,
    SUB_EVENT_LEAVING_SECTOR_4_NAV_CONVERSATION_ENDED,
    SUB_EVENT_ENTERED_SECTOR_3_SECURITY_ROOM,
    SUB_EVENT_UNLOCKED_SECURITY_LEVEL_2,
    SUB_EVENT_LEFT_SECTOR_3_SECURITY_ROOM,
    SUB_EVENT_ENTERED_SECTOR_3_DATA_ROOM,
    SUB_EVENT_DOWNLOADED_SUPER_MISSILES,
    SUB_EVENT_LEFT_SECTOR_3_DATA_ROOM,
    SUB_EVENT_ENTERED_BOX_ROOM,
    SUB_EVENT_LEFT_BOX_ROOM,
    SUB_EVENT_LEAVING_SECTOR_3_NAV_CONVERSATION_ENDED,
    SUB_EVENT_SECRET_CONVERSATION_STARTED,
    SUB_EVENT_SECRET_CONVERSATION_ENDED,
    SUB_EVENT_ENTERED_NOC_NAV_ROOM,
    SUB_EVENT_67,
    SUB_EVENT_68,
    SUB_EVENT_69,
    SUB_EVENT_70,
    SUB_EVENT_71,
    SUB_EVENT_72,
    SUB_EVENT_73,
    SUB_EVENT_74,
    SUB_EVENT_75,
    SUB_EVENT_76,
    SUB_EVENT_77,
    SUB_EVENT_78,
    SUB_EVENT_79,
    SUB_EVENT_80,
    SUB_EVENT_81,
    SUB_EVENT_82,
    SUB_EVENT_83,
    SUB_EVENT_84,
    SUB_EVENT_85,
    SUB_EVENT_86,
    SUB_EVENT_87,
    SUB_EVENT_88,
    SUB_EVENT_89,
    SUB_EVENT_90,
    SUB_EVENT_91,
    SUB_EVENT_92,
    SUB_EVENT_93,
    SUB_EVENT_94,
    SUB_EVENT_95,
    SUB_EVENT_96,
    SUB_EVENT_97,
    SUB_EVENT_98,
    SUB_EVENT_99,
    SUB_EVENT_100,
    SUB_EVENT_101,
    SUB_EVENT_102,
    SUB_EVENT_103,
    SUB_EVENT_104,
    SUB_EVENT_105,
    SUB_EVENT_106,
    SUB_EVENT_107,
    SUB_EVENT_108,
    SUB_EVENT_109,
    SUB_EVENT_110,
    SUB_EVENT_111,
    SUB_EVENT_112,
    SUB_EVENT_113,
    SUB_EVENT_114,
    SUB_EVENT_115,
    SUB_EVENT_116,
    SUB_EVENT_117,
    SUB_EVENT_118,
    SUB_EVENT_119,
    SUB_EVENT_120,
    SUB_EVENT_121,
    SUB_EVENT_122,
    SUB_EVENT_123,
    SUB_EVENT_124,
    SUB_EVENT_125,
    SUB_EVENT_126,
    SUB_EVENT_127,
    SUB_EVENT_128,
    SUB_EVENT_129,
    SUB_EVENT_130,
    SUB_EVENT_131,
    SUB_EVENT_132,
    SUB_EVENT_133,
    SUB_EVENT_134,
    SUB_EVENT_135,
    SUB_EVENT_136,
    SUB_EVENT_137,
    SUB_EVENT_138,
    SUB_EVENT_139,
    SUB_EVENT_140,
    SUB_EVENT_141,
    SUB_EVENT_142,
    SUB_EVENT_143,
    SUB_EVENT_144,
    SUB_EVENT_145,
    SUB_EVENT_146,
    SUB_EVENT_147,
    SUB_EVENT_148,
    SUB_EVENT_149,
    SUB_EVENT_150,
    SUB_EVENT_151,
    SUB_EVENT_152,
    SUB_EVENT_153,
    SUB_EVENT_154,
    SUB_EVENT_155,

    SUB_EVENT_END
};

enum AbilityCount {
    ABILITY_COUNT_NONE,
    ABILITY_COUNT_MISSILES,
    ABILITY_COUNT_MORPH_BALL,
    ABILITY_COUNT_CHARGE_BEAM,
    ABILITY_COUNT_BOMBS,
    ABILITY_COUNT_HIGH_JUMP,
    ABILITY_COUNT_SPEED_BOOSTER,
    ABILITY_COUNT_SUPER_MISSILES,
    ABILITY_COUNT_VARIA_SUIT,
    ABILITY_COUNT_ICE_MISSILES,
    ABILITY_COUNT_WIDE_BEAM,
    ABILITY_COUNT_POWER_BOMBS,
    ABILITY_COUNT_SPACE_JUMP,
    ABILITY_COUNT_PLASMA_BEAM,
    ABILITY_COUNT_GRAVITY_SUIT,
    ABILITY_COUNT_DIFFUSION_MISSILES,
    ABILITY_COUNT_WAVE_BEAM,
    ABILITY_COUNT_SCREW_ATTACK,
    ABILITY_COUNT_ICE_BEAM,

    ABILITY_COUNT_END,
};

enum PowerOutageState {
    POWER_OUTAGE_BEFORE,
    POWER_OUTAGE_DURING,
    POWER_OUTAGE_AFTER,
};

enum MeltdownState {
    MELTDOWN_NONE,
    MELTDOWN_DURING,
    MELTDOWN_CAN_BE_STOPPED,
};

enum TimerEvent {
    ESCAPE_NONE,
    ESCAPE_MELTDOWN,
    ESCAPE_RESTRICTED_LAB,
    ESCAPE_ORBIT_CHANGE,
};

#define SEVENT_TTYPE_NONE 0
#define SEVENT_TTYPE_STARTING_ROOM_LOAD 2
#define SEVENT_TTYPE_CUTSCENE_START 4
#define SEVENT_TTYPE_CUTSCENE_END 5
#define SEVENT_TTYPE_STARTING_NAVIGATION_CONVERSATION 6
#define SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION 7
#define SEVENT_TTYPE_SA_X_ENCOUNTER 8
#define SEVENT_TTYPE_DOWNLOADING_ITEM 9
#define SEVENT_TTYPE_UNLOCKING_SECURITY 10
#define SEVENT_TTYPE_11 11
#define SEVENT_TTYPE_32 32
#define SEVENT_TTYPE_ENTERING_ROOM 33
#define SEVENT_TTYPE_34 34
#define SEVENT_TTYPE_STARTING_ELEVATOR_RIDE_UP 64
#define SEVENT_TTYPE_STARTING_ELEVATOR_RIDE_DOWN 65
#define SEVENT_TTYPE_ENDING_ELEVATOR_RIDE_UP 66
#define SEVENT_TTYPE_ENDING_ELEVATOR_RIDE_DOWN 67
#define SEVENT_TTYPE_128 128

#endif /* EVENT_CONSTANTS_H */
