eventNames = [
    "EVENT_NONE", # 0
    "EVENT_NAVIGATION_ROOM_BEFORE_QUARANTINE_BAY", # 1
    "EVENT_QUARANTINE_BAY_HORNOAD_DEAD", # 2
    "EVENT_NAVIGATION_ROOM_AFTER_QUARANTINE_BAY", # 3
    "EVENT_NAVIGATION_ROOM_BEFORE_ELEVATOR", # 4
    "EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_1", # 5
    "EVENT_ENTERED_MISSILE_DATA_ROOM", # 6
    "EVENT_MISSILE_DATA_DOWNLOADED", # 7
    "EVENT_ENTERED_NAVIGATION_ROOM_POWER_OUTAGE", # 8
    "EVENT_NAVIGATION_ROOM_AFTER_MISSILES", # 9
    "EVENT_MORPH_BALL_ABILITY_RECOVERED", # 0xa
    "EVENT_NAVIGATION_ROOM_AFTER_MORPH_BALL", # 0xb
    "EVENT_ENTERED_ELEVATOR_ROOM", # 0xc
    "EVENT_SA_X_ELEVATOR_CUTSCENE_ENDS", # 0xd
    "EVENT_NAVIGATION_ROOM_ENTERING_SRX", # 0xe
    "EVENT_CHARGE_BEAM_ABILITY_RECOVERED", # 0xf
    "EVENT_ALL_STABILIZERS_ONLINE", # 0x10
    "EVENT_NAVIGATION_ROOM_LEAVING_SRX", # 0x11
    "EVENT_NAVIGATION_ROOM_ENTERING_TRO", # 0x12
    "EVENT_SECURITY_LEVEL_1_UNLOCKED", # 0x13
    "EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_2", # 0x14
    "EVENT_ENTERING_BOMB_DATA_ROOM", # 0x15
    "EVENT_BOMB_DATA_DOWNLOADED", # 0x16
    "EVENT_SA_X_QUAKE", # 0x17
    "EVENT_LEFT_SA_X_QUAKE_ROOM", # 0x18
    "EVENT_HIGH_JUMP_ABILITY_RECOVERED", # 0x19
    "EVENT_ESCAPED_TRO_1_SA_X", # 0x1a
    "EVENT_NAVIGATION_ROOM_LEAVING_TRO", # 0x1b
    "EVENT_NAVIGATION_ROOM_ENTERING_AQA", # 0x1c
    "EVENT_SPEED_BOOSTER_ABILITY_RECOVERED", # 0x1d
    "EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_3", # 0x1e
    "EVENT_ENTERED_PUMP_CONTROL_UNIT", # 0x1f
    "EVENT_WATER_LEVEL_LOWERED", # 0x20
    "EVENT_NAVIGATION_ROOM_LEAVING_AQA", # 0x21
    "EVENT_NAVIGATION_ROOM_ENTERING_PYR", # 0x22
    "EVENT_SECURITY_LEVEL_2_UNLOCKED", # 0x23
    "EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_4", # 0x24
    "EVENT_ENTERED_SUPER_MISSILE_DATA_ROOM", # 0x25
    "EVENT_SUPER_MISSILE_DATA_DOWNLOADED", # 0x26
    "EVENT_TRIGGERED_BOX_RUMBLE", # 0x27
    "EVENT_BOX_DEFEATED", # 0x28
    "EVENT_NAVIGATION_ROOM_LEAVING_PYR", # 0x29
    "EVENT_LEFT_NAVIGATION_ROOM", # 0x2a
    "EVENT_SECRET_CONVERSATION", # 0x2b
    "EVENT_SECRET_CONVERSATION_OVER", # 0x2c
    "EVENT_SKIPPED_BY_USING_NOC_NAVIGATION_ROOM", # 0x2d
    "EVENT_ENTERED_NOC_NAVIGATION_ROOM", # 0x2e
    "EVENT_NAVIGATION_ROOM_ENTERING_NOC", # 0x2f
    "EVENT_NOC_SA_X_ENCOUNTER", # 0x30
    "EVENT_ESCAPED_NOC_SA_X", # 0x31
    "EVENT_NOC_DATA_ROOM_DESTROYED", # 0x32
    "EVENT_VARIA_SUIT_ABILITY_RECOVERED", # 0x33
    "EVENT_REACHED_TOP_OF_ROOM_AFTER_VARIA", # 0x34
    "EVENT_NAVIGATION_ROOM_LEAVING_NOC", # 0x35
    "EVENT_NAVIGATION_ROOM_ENTERING_ARC", # 0x36
    "EVENT_SECURITY_LEVEL_3_UNLOCKED", # 0x37
    "EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_5", # 0x38
    "EVENT_ENTERED_ICE_MISSILE_DATA_ROOM", # 0x39
    "EVENT_ICE_MISSILE_DATA_DOWNLOADED", # 0x3a
    "EVENT_NAVIGATION_ROOM_LEAVING_ARC", # 0x3b
    "EVENT_WIDE_BEAM_ABILITY_RECOVERED", # 0x3c
    "EVENT_COOLING_UNIT_OPERATIONAL", # 0x3d
    "EVENT_NAVIGATION_ROOM_LEAVING_PYR_2", # 0x3e
    "EVENT_ANIMALS_RELEASED", # 0x3f
    "EVENT_NAVIGATION_ROOM_AFTER_ANIMALS", # 0x40
    "EVENT_NAVIGATION_ROOM_ENTERING_ARC_2", # 0x41
    "EVENT_POWER_BOMB_DATA_DOWNLOADED", # 0x42
    "EVENT_ARC_SA_X_ENCOUNTER", # 0x43
    "EVENT_ESCAPED_ARC_SA_X", # 0x44
    "EVENT_NAVIGATION_ROOM_LEAVING_ARC_2", # 0x45
    "EVENT_POWER_OUTAGE", # 0x46
    "EVENT_ENTERED_SHIP", # 0x47
    "EVENT_ENTERED_YAKUZA_ROOM", # 0x48
    "EVENT_SPACE_JUMP_ABILITY_RECOVERED", # 0x49
    "EVENT_AUXILARY_POWER_ENGAGED", # 0x4a
    "EVENT_NAVIGATION_ROOM_AFTER_YAKUZA", # 0x4b
    "EVENT_ENGAGED_TRO_2_SA_X", # 0x4c
    "EVENT_ESCAPED_TRO_2_SA_X", # 0x4d
    "EVENT_PLASMA_BEAM_ABILITY_RECOVERED", # 0x4e
    "EVENT_NAVIGATION_ROOM_LEAVING_TRO_2", # 0x4f
    "EVENT_NAVIGATION_ROOM_ENTERING_ARC_3", # 0x50
    "EVENT_GRAVITY_SUIT_ABILITY_RECOVERED", # 0x51
    "EVENT_ENTERED_LEVEL_4_SECURITY_ROOM", # 0x52
    "EVENT_SECURITY_LEVEL_4_UNLOCKED", # 0x53
    "EVENT_SECRET_MESSAGE_2", # 0x54
    "EVENT_ENTERED_DIFFUSION_MISSILE_DATA_ROOM", # 0x55
    "EVENT_DIFFUSION_MISSILE_DATA_DOWNLOADED", # 0x56
    "EVENT_NAVIGATION_ROOM_LEAVING_AQA_2", # 0x57
    "EVENT_NAVIGATION_ROOM_ENTERING_NOC_2", # 0x58
    "EVENT_RESTRICTED_ZONE_WARNING", # 0x59
    "EVENT_TRIGGERED_BOX_2_RUMBLE", # 0x5a
    "EVENT_WAVE_BEAM_ABILITY_RECOVERED", # 0x5b
    "EVENT_RESTRICTED_LABORATORY_EXPLOSION", # 0x5c
    "EVENT_60_SECONDS_TO_DETACHMENT", # 0x5d
    "EVENT_ESCAPED_RESTRICTED_LABORATORY", # 0x5e
    "EVENT_NAVIGATION_ROOM_AFTER_RESTRICTED_LABORATORY", # 0x5f
    "EVENT_SCREW_ATTACK_ABILITY_RECOVERED", # 0x60
    "EVENT_NAVIGATION_ROOM_LEAVING_SRX_2", # 0x61
    "EVENT_END_OF_FIRST_CONVERSATION", # 0x62
    "EVENT_SECOND_CONVERSATION", # 0x63
    "EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_6", # 0x64
    "EVENT_ENTERED_OPERATION_DECK", # 0x65
    "EVENT_SA_X_DEFEATED", # 0x66
    "EVENT_ORBIT_CHANGE_IMPLEMENTED", # 0x67
    "EVENT_SKIPPED_BY_NOT_TALKING_TO_COMPUTER_7", # 0x68
    "EVENT_ENTERED_SHIP_ROOM", # 0x69
    "EVENT_SA_X_KILLED_BY_OMEGA_METROID", # 0x6a
    "EVENT_ICE_BEAM_ABILITY_RECOVERED", # 0x6b
    "EVENT_OMEGA_METROID_DEFEATED", # 0x6c
    "EVENT_ESCAPED_ON_SHIP", # 0x6d
]

subEvents = [
    "SUB_EVENT_NONE",

    "SUB_EVENT_FIRST_CONVERSATION_STARTED",
    "SUB_EVENT_FIRST_CONVERSATION_ENDED",
    "SUB_EVENT_ENTERED_ROOM_AFTER_FIRST_NAVIGATION_ROOM",
    "SUB_EVENT_CONVERSATION_AFTER_QUARANTINE_BAY_ENDED",
    "SUB_EVENT_LEFT_NAV_ROOM_AFTER_QUARANTINE_BAY",
    "SUB_EVENT_OPERATIONS_DECK_ELEVATOR_MONOLOGUE_STARTED",
    "SUB_EVENT_OPERATIONS_DECK_ELEVATOR_MONOLOGUE_ENDED",
    "SUB_EVENT_OPERATIONS_DECK_ELEVATOR_ENDED",
    "SUB_EVENT_ENTERED_OPERATIONS_DECK_LOBBY",
    "SUB_EVENT_10",
    "SUB_EVENT_DOWNLOADED_MISSILES",
    "SUB_EVENT_ENTERED_NAV_ROOM_AFTER_MISSILES",
    "SUB_EVENT_ENTERED_DARK_VERTICAL_SHAFT",
    "SUB_EVENT_ENTERED_ARACHNUS_ROOM",
    "SUB_EVENT_MORPH_BALL_ABILITY_RECOVERED",
    "SUB_EVENT_LEFT_ARACHNUS_ROOM",
    "SUB_EVENT_POST_ARACHNUS_NAV_CONVERSATION_ENDED",
    "SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_START",
    "SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_EXPLOSION",
    "SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_DOOR_SHOT",
    "SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_RUMBLE_1",
    "SUB_EVENT_SA_X_ELEVATOR_CUTSCENE_RUMBLE_2",
    "SUB_EVENT_ENTERED_SECTOR_1_NAV_ROOM",
    "SUB_EVENT_SECTOR_1_NAV_CONVERSATION_ENDED",
    "SUB_EVENT_ENTERED_CHARGE_BEAM_ROOM",
    "SUB_EVENT_CHARGE_BEAM_ABILITY_RECOVERED",
    "SUB_EVENT_LEFT_CHARGE_BEAM_ROOM",
    "SUB_EVENT_ENTERED_NAV_ROOM_BEFORE_LEAVING_SECTOR_1",
    "SUB_EVENT_29",
    "SUB_EVENT_LEAVING_SECTOR_1_NAV_CONVERSATION_ENDED",
    "SUB_EVENT_STARTING_ELEVATOR_TO_TRO",
    "SUB_EVENT_ENTERED_TRO",
    "SUB_EVENT_ENTERED_SECTOR_2_NAV_ROOM",
    "SUB_EVENT_SECTOR_2_NAV_CONVERSATION_ENDED",
    "SUB_EVENT_ENTERED_FIRST_ROOM_SECTOR_2",
    "SUB_EVENT_UNLOCKED_SECURITY_LEVEL_1",
    "SUB_EVENT_DOWNLOADED_BOMBS",
    "SUB_EVENT_ENTERED_ZAZABI_ROOM",
    "SUB_EVENT_HIGH_JUMP_ABILITY_RECOVERED",
    "SUB_EVENT_LEFT_ZAZABI_ROOM",
    "SUB_EVENT_ENTERED_SA_X_TR0_1_ROOM",
    "SUB_EVENT_LEFT_SA_X_TR0_1_ROOM",
    "SUB_EVENT_LEAVING_SECTOR_2_NAV_CONVERSATION_ENDED",
    "SUB_EVENT_TRO_ELEVATOR_MONOLOGUE_STARTED",
    "SUB_EVENT_TRO_ELEVATOR_MONOLOGUE_ENDED",
    "SUB_EVENT_TRO_ELEVATOR_ENDED",
    "SUB_EVENT_ENTERED_AQA_NAV_ROOM",
    "SUB_EVENT_ENTERING_SECTOR_4_NAV_CONVERSATION_ENDED",
    "SUB_EVENT_ENTERED_FIRST_ROOM_SECTOR_4",
    "SUB_EVENT_ENTERED_SERRIS_TANK_ROOM",
    "SUB_EVENT_ENTERED_SERRIS_ROOM",
    "SUB_EVENT_SPEED_BOOSTER_ABILITY_RECOVERED",
    "SUB_EVENT_LEFT_SERRIS_ROOM",
    "SUB_EVENT_LEAVING_SECTOR_4_NAV_CONVERSATION_ENDED",
    "SUB_EVENT_ENTERED_SECTOR_3_SECURITY_ROOM",
    "SUB_EVENT_UNLOCKED_SECURITY_LEVEL_2",
    "SUB_EVENT_LEFT_SECTOR_3_SECURITY_ROOM",
    "SUB_EVENT_ENTERED_SECTOR_3_DATA_ROOM",
    "SUB_EVENT_DOWNLOADED_SUPER_MISSILES",
    "SUB_EVENT_LEFT_SECTOR_3_DATA_ROOM",
    "SUB_EVENT_ENTERED_BOX_ROOM",
    "SUB_EVENT_LEFT_BOX_ROOM",
    "SUB_EVENT_LEAVING_SECTOR_3_NAV_CONVERSATION_ENDED",
    "SUB_EVENT_SECRET_CONVERSATION_STARTED",
    "SUB_EVENT_SECRET_CONVERSATION_ENDED",
    "SUB_EVENT_ENTERED_NOC_NAV_ROOM",
    "SUB_EVENT_67",
    "SUB_EVENT_68",
    "SUB_EVENT_69",
    "SUB_EVENT_70",
    "SUB_EVENT_71",
    "SUB_EVENT_72",
    "SUB_EVENT_73",
    "SUB_EVENT_74",
    "SUB_EVENT_75",
    "SUB_EVENT_76",
    "SUB_EVENT_77",
    "SUB_EVENT_78",
    "SUB_EVENT_79",
    "SUB_EVENT_80",
    "SUB_EVENT_81",
    "SUB_EVENT_82",
    "SUB_EVENT_83",
    "SUB_EVENT_84",
    "SUB_EVENT_85",
    "SUB_EVENT_86",
    "SUB_EVENT_87",
    "SUB_EVENT_88",
    "SUB_EVENT_89",
    "SUB_EVENT_90",
    "SUB_EVENT_91",
    "SUB_EVENT_92",
    "SUB_EVENT_93",
    "SUB_EVENT_94",
    "SUB_EVENT_95",
    "SUB_EVENT_96",
    "SUB_EVENT_97",
    "SUB_EVENT_98",
    "SUB_EVENT_99",
    "SUB_EVENT_100",
    "SUB_EVENT_101",
    "SUB_EVENT_102",
    "SUB_EVENT_103",
    "SUB_EVENT_104",
    "SUB_EVENT_105",
    "SUB_EVENT_106",
    "SUB_EVENT_107",
    "SUB_EVENT_108",
    "SUB_EVENT_109",
    "SUB_EVENT_110",
    "SUB_EVENT_111",
    "SUB_EVENT_112",
    "SUB_EVENT_113",
    "SUB_EVENT_114",
    "SUB_EVENT_115",
    "SUB_EVENT_116",
    "SUB_EVENT_117",
    "SUB_EVENT_118",
    "SUB_EVENT_119",
    "SUB_EVENT_120",
    "SUB_EVENT_121",
    "SUB_EVENT_122",
    "SUB_EVENT_123",
    "SUB_EVENT_124",
    "SUB_EVENT_125",
    "SUB_EVENT_126",
    "SUB_EVENT_127",
    "SUB_EVENT_128",
    "SUB_EVENT_129",
    "SUB_EVENT_130",
    "SUB_EVENT_131",
    "SUB_EVENT_132",
    "SUB_EVENT_133",
    "SUB_EVENT_134",
    "SUB_EVENT_135",
    "SUB_EVENT_136",
    "SUB_EVENT_137",
    "SUB_EVENT_138",
    "SUB_EVENT_139",
    "SUB_EVENT_140",
    "SUB_EVENT_141",
    "SUB_EVENT_142",
    "SUB_EVENT_143",
    "SUB_EVENT_144",
    "SUB_EVENT_145",
    "SUB_EVENT_146",
    "SUB_EVENT_147",
    "SUB_EVENT_148",
    "SUB_EVENT_149",
    "SUB_EVENT_150",
    "SUB_EVENT_151",
    "SUB_EVENT_152",
    "SUB_EVENT_153",
    "SUB_EVENT_154",
    "SUB_EVENT_155",
]

areaNames = [
    "MAIN_DECK",
    "SECTOR_1",
    "SECTOR_2",
    "SECTOR_3",
    "SECTOR_4",
    "SECTOR_5",
    "SECTOR_6",

    "NORMAL_END"
]

subAreas = [
    "SUB_AREA_NONE",
    "SUB_AREA_OPERATIONS_DECK",
    "SUB_AREA_DOCKING_BAYS",
    "SUB_AREA_HABITATION_DECK",
    "SUB_AREA_MAIN_DECK",
    "SUB_AREA_REACTOR_SILO",
    "SUB_AREA_RESTRICTED_ZONE",
    "SUB_AREA_SECTOR_1",
    "SUB_AREA_SECTOR_2",
    "SUB_AREA_SECTOR_3",
    "SUB_AREA_SECTOR_4",
    "SUB_AREA_SECTOR_5",
    "SUB_AREA_SECTOR_6",

    "SUB_AREA_END"
]

areaNamesWithDebug = [
    "MAIN_DECK",
    "SECTOR_1",
    "SECTOR_2",
    "SECTOR_3",
    "SECTOR_4",
    "SECTOR_5",
    "SECTOR_6",

    "DEBUG_1",
    "DEBUG_2",
    "DEBUG_3",

    "END"
]

navRooms = [
    "NAV_ROOM_MAIN_DECK_ROOM_0",
    "NAV_ROOM_MAIN_DECK_ROOM_16",
    "NAV_ROOM_MAIN_DECK_ROOM_9",
    "NAV_ROOM_MAIN_DECK_ROOM_32",
    "NAV_ROOM_SECTOR_1_ROOM_2",
    "NAV_ROOM_SECTOR_2_ROOM_2",
    "NAV_ROOM_SECTOR_3_ROOM_2",
    "NAV_ROOM_SECTOR_4_ROOM_2",
    "NAV_ROOM_SECTOR_5_ROOM_2",
    "NAV_ROOM_SECTOR_6_ROOM_2",
    "NAV_ROOM_MAIN_DECK_ROOM_56",
    "NAV_ROOM_MAIN_DECK_ROOM_66",

    "NAV_ROOM_END"
]

abilityCount = [
    "ABILITY_COUNT_NONE",
    "ABILITY_COUNT_MISSILES",
    "ABILITY_COUNT_MORPH_BALL",
    "ABILITY_COUNT_CHARGE_BEAM",
    "ABILITY_COUNT_BOMBS",
    "ABILITY_COUNT_HIGH_JUMP",
    "ABILITY_COUNT_SPEED_BOOSTER",
    "ABILITY_COUNT_SUPER_MISSILES",
    "ABILITY_COUNT_VARIA_SUIT",
    "ABILITY_COUNT_ICE_MISSILES",
    "ABILITY_COUNT_WIDE_BEAM",
    "ABILITY_COUNT_POWER_BOMBS",
    "ABILITY_COUNT_SPACE_JUMP",
    "ABILITY_COUNT_PLASMA_BEAM",
    "ABILITY_COUNT_GRAVITY_SUIT",
    "ABILITY_COUNT_DIFFUSION_MISSILES",
    "ABILITY_COUNT_WAVE_BEAM",
    "ABILITY_COUNT_SCREW_ATTACK",
    "ABILITY_COUNT_ICE_BEAM",
]

smf = {
    0: "0",
    1: "SMF_HIGH_JUMP",
    2: "SMF_SPEED_BOOSTER",
    4: "SMF_SPACE_JUMP",
    8: "SMF_SCREW_ATTACK",
    0x10: "SMF_VARIA_SUIT",
    0x20: "SMF_GRAVITY_SUIT",
    0x40: "SMF_MORPH_BALL",
    0x80: "SMF_SA_X_SUIT"
}

bf = {
    0: "0",
    1: "BF_CHARGE_BEAM",
    2: "BF_WIDE_BEAM",
    4: "BF_PLASMA_BEAM",
    8: "BF_WAVE_BEAM",
    0x10: "BF_ICE_BEAM"
}

mbf = {
    0: "0",
    1: "MBF_MISSILES",
    2: "MBF_SUPER_MISSILES",
    4: "MBF_ICE_MISSILES",
    8: "MBF_DIFFUSION_MISSILES",
    0x10: "MBF_BOMBS",
    0x20: "MBF_POWER_BOMBS"
}

subEventTriggerTypes = {
    0: "SEVENT_TTYPE_NONE",
    2: "SEVENT_TTYPE_STARTING_ROOM_LOAD",
    3: "SEVENT_TTYPE_3",
    4: "SEVENT_TTYPE_CUTSCENE_START",
    5: "SEVENT_TTYPE_CUTSCENE_END",
    6: "SEVENT_TTYPE_STARTING_NAVIGATION_CONVERSATION",
    7: "SEVENT_TTYPE_ENDING_NAVIGATION_CONVERSATION",
    8: "SEVENT_TTYPE_SA_X_ENCOUNTER",
    9: "SEVENT_TTYPE_DOWNLOADING_ITEM",
    10: "SEVENT_TTYPE_UNLOCKING_SECURITY",
    11: "SEVENT_TTYPE_11",
    32: "SEVENT_TTYPE_32",
    33: "SEVENT_TTYPE_ENTERING_ROOM",
    34: "SEVENT_TTYPE_34",
    64: "SEVENT_TTYPE_STARTING_ELEVATOR_RIDE_UP",
    65: "SEVENT_TTYPE_STARTING_ELEVATOR_RIDE_DOWN",
    66: "SEVENT_TTYPE_ENDING_ELEVATOR_RIDE_UP",
    67: "SEVENT_TTYPE_ENDING_ELEVATOR_RIDE_DOWN",
    128: "SEVENT_TTYPE_128"
}

file = open("./mf_us_baserom.gba", "rb")

# event_data.c
file.seek(0x575a60)
print("const struct EventLocationAndNavigationInfo sEventLocationAndNavigationInfo[EVENT_END] = {")
for i in range(len(eventNames)):
    print(f"    [{len(eventNames) if i == len(eventNames) else eventNames[i]}] = {{")
    area = int.from_bytes(file.read(1), "little")
    room = int.from_bytes(file.read(1), "little")
    xStart = int.from_bytes(file.read(1), "little")
    yStart = int.from_bytes(file.read(1), "little")
    xEnd = int.from_bytes(file.read(1), "little")
    yEnd = int.from_bytes(file.read(1), "little")
    navConversation = int.from_bytes(file.read(1), "little")
    navRoom = int.from_bytes(file.read(1), "little")
    downloadskippable = int.from_bytes(file.read(1), "little")
    file.read(3)
    print(f"        .area = {"UCHAR_MAX" if area == 255 else f"AREA_{areaNames[area]}"},")
    print(f"        .room = {"UCHAR_MAX" if room == 255 else f"{areaNames[area]}_{room-1} + 1"},")
    print(f"        .xStart = {"UCHAR_MAX" if xStart == 255 else xStart},")
    print(f"        .yStart = {"UCHAR_MAX" if yStart == 255 else yStart},")
    print(f"        .xEnd = {"UCHAR_MAX" if xEnd == 255 else xEnd},")
    print(f"        .yEnd = {"UCHAR_MAX" if yEnd == 255 else yEnd},")
    print(f"        .navConversation = NAV_CONVERSATION_{"NONE" if navConversation == 0 else navConversation},")
    print(f"        .navRoom = {navRooms[navRoom]},")
    print(f"        .download = {"TRUE" if downloadskippable & 1 else "FALSE"},")
    print(f"        .skippable = {"TRUE" if downloadskippable & 2 else "FALSE"}")
    print("    },")
print("};\n")

print("const u8 sNumberOfTanksPerArea[AREA_NORMAL_END + 1][3] = {")
for i in range(8):
    print(f"    [AREA_{areaNames[i]}] = {{")
    print(f"        {", ".join(str(int.from_bytes(file.read(1), "little")) for j in range(3))}")
    print(f"    }},")
print("};\n")

print("const u8 sObtainItemEvents[ABILITY_COUNT_END] = {")
for i in range(len(abilityCount)):
    print(f"    [{abilityCount[i]}] = {eventNames[int.from_bytes(file.read(1), "little")]},")
print("};\n")

file.read(1) # align

print("const struct AbilityRamValue sAbilityRamValues[ABILITY_COUNT_END] = {")
for i in range(len(abilityCount)):
    print(f"    [{abilityCount[i]}] = {{")
    print(f"        .beamStatus = {bf[int.from_bytes(file.read(1), "little")]},")
    print(f"        .weaponStatus = {mbf[int.from_bytes(file.read(1), "little")]},")
    print(f"        .suitStatus = {smf[int.from_bytes(file.read(1), "little")]},")
    print(f"        .isSuit = {"TRUE" if int.from_bytes(file.read(1), "little") else "FALSE"},")
    print(f"        .messageNumber = MESSAGE_{int.from_bytes(file.read(1), "little")},")
    file.read(1)
    subEvent = int.from_bytes(file.read(2), "little")
    print(f"        .subEvent = {"SUB_EVENT_NONE" if subEvent == 0 else f"{subEvents[subEvent + 1]} - 1"}")
    print("    },")
print("};\n")

print("const u8 sAreaNavigationRoomPairs[NAV_ROOM_END + 1][2] = {")
for i in range(len(navRooms) - 1):
    area = int.from_bytes(file.read(1), "little")
    room = int.from_bytes(file.read(1), "little")
    print(f"    [{navRooms[i]}] = {{")
    print(f"        AREA_{areaNames[area]},")
    print(f"        {areaNames[area]}_{room-1} + 1")
    print("    },")
file.read(2)
print(f"    [{navRooms[len(navRooms) - 1]}] = {{ // Terminator")
print(f"        UCHAR_MAX,")
print(f"        UCHAR_MAX")
print("    }")
print("};\n")

print("const u8 sAreasOfSubAreas[SUB_AREA_END] = {")
for i in range(len(subAreas) - 1):
    print(f"    [{subAreas[i]}] = AREA_{areaNames[int.from_bytes(file.read(1), "little")]},")
print("};\n")

print("const u8 sSubAreasOfSectors[AREA_END] = {")
for i in range(len(areaNamesWithDebug) - 1):
    print(f"    [AREA_{areaNamesWithDebug[i]}] = {subAreas[int.from_bytes(file.read(1), "little")]},")
print("};\n")

print("const u8 sUnk_57607d[SUB_AREA_END] = {")
for i in range(len(subAreas) - 1):
    val = int.from_bytes(file.read(1), "little")
    print(f"    [{subAreas[i]}] = {"UCHAR_MAX" if val == 0xff else val},")
print("};\n")

print("const u8 sUnk_57608a[SUB_AREA_END] = {")
for i in range(len(subAreas) - 1):
    val = int.from_bytes(file.read(1), "little")
    print(f"    [{subAreas[i]}] = {"UCHAR_MAX" if val == 0xff else val},")
print("};\n")

file.read(1) # align

# print("const struct MonologueEvent sMonologueEvents[MONOLOGUE_EVENT_END] = {")

file.seek(0x5760c8)
print("const struct SecurityUnlockEvent sSecurityUnlockEvents[SECURITY_LEVEL_END - 1] = {")
for i in range(4):
    print(f"    [SECURITY_LEVEL_{i + 1} - 1] = {{")
    print(f"        .securityLevel = SECURITY_LEVEL_{int.from_bytes(file.read(1), "little")},")
    print(f"        .area = AREA_{areaNames[int.from_bytes(file.read(1), "little")]},")
    print(f"        .previousEvent = {eventNames[int.from_bytes(file.read(1), "little")]},")
    print(f"        .nextEvent = {eventNames[int.from_bytes(file.read(1), "little")]},")
    print(f"        .subEvent = {subEvents[int.from_bytes(file.read(2), "little") + 1]} - 1")
    file.read(2)
    print("    },")
print("};\n")

print("const u8 sSubAreasOfMainDeckRooms[] = {")
print(f"    [0] = {subAreas[int.from_bytes(file.read(1), "little")]},")
for i in range(87):
    print(f"    [MAIN_DECK_{i} + 1] = {subAreas[int.from_bytes(file.read(1), "little")]},")
for i in range(87, 89):
    print(f"    [{i} + 1] = {subAreas[int.from_bytes(file.read(1), "little")]},")
print("};\n")

# sub_event_data.c
'''file.seek(0x79bbcc)
print("const u16 sSubEventNavConversations[22][2] = {")
for i in range(22):
    print(f"    [{i}] = {{")
    print(f"        NAV_CONVERSATION_{int.from_bytes(file.read(2), "little")}, {subEvents[int.from_bytes(file.read(2), "little")]}")
    print("    },")
print("};\n")

print("const u8 sSubEventTriggerTypes[SUB_EVENT_END] = {")
for subEvent in subEvents:
    print(f"    [{subEvent}] = {subEventTriggerTypes[int.from_bytes(file.read(1), "little")]},")
print("};\n")'''
'''print("enum NavigationConversation {\n    NAV_CONVERSATION_NONE,")
for i in range(1, 58):
    print(f"    NAV_CONVERSATION_{i},")
print("\n    NAV_CONVERSATION_END\n};\n")'''

'''print("enum MessageId {")
for i in range(48):
    print(f"    MESSAGE_{i},")
print("\n    MESSGAE_END\n};\n")'''
