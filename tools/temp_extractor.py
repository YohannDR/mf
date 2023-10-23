demos = [
    "DEMO_ID_SECTOR_2",
    "DEMO_ID_SECTOR_5",
    "DEMO_ID_SECTOR_4",
    "DEMO_ID_MAIN_DECK",
    "DEMO_ID_WALL_JUMP",
    "DEMO_ID_SHINESPARK",
    "DEMO_ID_LADDERS",
    "DEMO_ID_POWER_BOMBS",
    "DEMO_ID_SECTOR_3",
    "DEMO_ID_SECTOR_6",
    "DEMO_ID_ARACHNUS",
    "DEMO_ID_SCREW_ATTACK",
]

def GetInput(value: int) -> str:    
    result = ""

    if value == 0:
        return "KEY_NONE"

    if value & (1 << 0):
        result = "KEY_A"

    if value & (1 << 1):
        if result == "":
            result = "KEY_B"
        else:
            result += " | KEY_B"

    if value & (1 << 2):
        if result == "":
            result = "KEY_SELECT"
        else:
            result += " | KEY_SELECT"

    if value & (1 << 3):
        if result == "":
            result = "KEY_START"
        else:
            result += " | KEY_START"

    if value & (1 << 4):
        if result == "":
            result = "KEY_RIGHT"
        else:
            result += " | KEY_RIGHT"

    if value & (1 << 5):
        if result == "":
            result = "KEY_LEFT"
        else:
            result += " | KEY_LEFT"

    if value & (1 << 6):
        if result == "":
            result = "KEY_UP"
        else:
            result += " | KEY_UP"

    if value & (1 << 7):
        if result == "":
            result = "KEY_DOWN"
        else:
            result += " | KEY_DOWN"

    if value & (1 << 8):
        if result == "":
            result = "KEY_R"
        else:
            result += " | KEY_R"

    if value & (1 << 9):
        if result == "":
            result = "KEY_L"
        else:
            result += " | KEY_L"

    return result

file = open("../mf_us_baserom.gba", "rb")

def Func():
    addr: int = 0x3e3eac
    size: int = 12

    file.seek(addr)

    result = ""

    for x in range(0, size):
        result += "static const u16 sDemoInputs_" + str(x) + "["

        ptr: int = int.from_bytes(file.read(4), "little") - 0x8000000
        size: int = int.from_bytes(file.read(4), "little")

        currAddr: int = file.tell()

        file.seek(ptr)

        result += str(int(size / 2)) + "] = {\n"

        for y in range(0, int(size / 2)):
            result += "\t [" + str(y) + "] = " + GetInput(int.from_bytes(file.read(2), "little")) + ",\n"

        result += "};\n\nstatic const u16 sDemoInputDurations_" + str(x) + "["

        file.seek(currAddr)

        ptr: int = int.from_bytes(file.read(4), "little") - 0x8000000
        size: int = int.from_bytes(file.read(4), "little")

        currAddr: int = file.tell()

        file.seek(ptr)

        result += str(int(size / 2)) + "] = {\n"

        for y in range(0, int(size / 2)):
            result += "\t [" + str(y) + "] = " + str(int.from_bytes(file.read(2), "little")) + ",\n"

        result += "};\n\n"

        file.seek(currAddr)

    file.seek(addr)
    size = 12

    result += "struct DemoData sDemoData[DEMO_ID_END] = {\n\t"

    for x in range(0, size):
        result += "[" + str(demos[x]) + "] = {\n\t\t.pInputs = sDemoInputs_" + str(x) + ",\n\t\t"
        result += ".inputsLength = ARRAY_SIZE(sDemoInputs_" + str(x) + "),\n\t\t"
        result += ".pDurations = sDemoInputDurations_" + str(x) + ",\n\t\t"
        result += ".inputsLength = ARRAY_SIZE(sDemoInputDurations_" + str(x) + ")\n\t},\n\t"

    return result

f = open("demos.txt", "w")
f.write(Func())
