def ParsePart0(value):
    result = ""

    if value & 0x100:
        result = "OBJ_ROTATION_SCALING"

    if value & 0x200:
        if result != "":
            result += " | OBJ_DOUBLE_SIZE"
        else:
            result = "OBJ_DISABLE"

    if value & 0x400:
        if result != "":
            result += " | "
        result += "OBJ_MODE_SEMI_TRANSPARENT"
    
    if value & 0x1000:
        if result != "":
            result += " | "
        result += "OBJ_MOSAIC"

    if value & 0x2000:
        if result != "":
            result += " | "
        result += "OBJ_COLOR_256_1"

    if value & 0x4000:
        if result != "":
            result += " | "
        result += "OBJ_SHAPE_HORIZONTAL"

    if value & 0x8000:
        if result != "":
            result += " | "
        result += "OBJ_SHAPE_VERTICAL"

    if result != "":
        result += " | "
    
    result += hex(value & 0xFF)

    return result

def ParsePart1(part0, value):
    result = ""
    sizes = ["OBJ_SIZE_16x16", "OBJ_SIZE_32x32", "OBJ_SIZE_64x64"]

    if part0.__contains__("OBJ_ROTATION_SCALING"):
        result = hex(value & 0x3E00)
    else:
        if value & 0x1000:
            result = "OBJ_X_FLIP"
        
        if value & 0x2000:
            if result != "":
                result += " | "
            result += "OBJ_Y_FLIP"

    if part0.__contains__("OBJ_SHAPE_HORIZONTAL"):
        sizes = ["OBJ_SIZE_32x8", "OBJ_SIZE_32x16", "OBJ_SIZE_64x32"]
    elif part0.__contains__("OBJ_SHAPE_VERTICAL"):
        sizes = ["OBJ_SIZE_8x32", "OBJ_SIZE_16x32", "OBJ_SIZE_32x64"]
        
    if value >> 14 & 3 != 0:
        if result != "":
            result += " | "
        result += sizes[(value >> 14 & 3) - 1]


    if result != "":
        result += " | "
    
    result += hex(value & 0x1FF)

    return result

def ParsePart2(value):
    result = ""

    if value >> 12 & 0xF != 0:
        result += f"OBJ_PALETTE_{value >> 12 & 0xF}"
    
    if value >> 10 & 3 != 0:
        if result != "":
            result += " | "
        result += f"OBJ_PRIORITY_{value >> 10 & 3}"

    if result != "":
        result += " | "
    
    result += hex(value & 0x3FF)

    return result

def ParseOam():
    part_count = int.from_bytes(file.read(2), "little")
    result = f"static const u16 sOam_{file.tell()-2:x}[OAM_DATA_SIZE({part_count})] = " + "{\n"
    result += f"    {part_count},\n    "

    for x in range(0, part_count):
        part0 = ParsePart0(int.from_bytes(file.read(2), "little"))
        result += part0 + ", "
        result += ParsePart1(part0, int.from_bytes(file.read(2), "little")) + ", "
        result += ParsePart2(int.from_bytes(file.read(2), "little"))
        if x < part_count - 1:
            result += ",\n    "

    result += "\n};\n"

    return result

def ParseFrameData():
    startAddr = file.tell()
    frameData = []
    while True:
        pFrame = int.from_bytes(file.read(4), "little") & 0x7fffff
        timer = int.from_bytes(file.read(4), "little")
        if pFrame == 0:
            break
        frameData.append((pFrame, timer))

    result = f"const struct FrameData sFrameData_{startAddr:x}[{(len(frameData)+1)}] = " + "{\n"

    index = 0
    for (pFrame, timer) in frameData:
        result += f"    [{index}] = " + "{\n" + f"        .pFrame = sOam_{pFrame:x},\n" + f"        .timer = {timer},\n" + "    },\n"
        index += 1
    result += f"    [{index}] = FRAME_DATA_TERMINATOR\n" + "};\n"

    return (result, len(frameData)+1)

file = open("../mf_us_baserom.gba", "rb")

def Func():
    spriteId = int(input("Primary sprite ID or first OAM entry pointer (in hex) : "), 16)

    if spriteId >= 0x100:
        file.seek(spriteId & 0xffffff)
    else:
        file.seek(0x79a8d4 + spriteId*4 - 0x40) # usually OAM entries come right after palettes, but that's not always the case
        palettePointer = int.from_bytes(file.read(4), 'little') & 0xffffff

        file.seek(0x2e4a50 + spriteId*4 - 0x40)
        paletteRows = int.from_bytes(file.read(4), 'little')//0x800

        file.seek(palettePointer+paletteRows*16*2)

    frames = set()
    while True:
        currAddress = file.tell()
        pointer = int.from_bytes(file.read(4), 'little')
        file.seek(currAddress)
        if pointer in frames:
            break
        if pointer & 0xFFFF == 0:
            file.read(2) # align
            break
        frames |= {currAddress | 0x8000000}
        print(ParseOam())

    animations = []
    while True:
        currentAddr = file.tell()
        pointer = int.from_bytes(file.read(4), 'little')
        file.seek(currentAddr)
        if pointer not in frames:
            break

        (result, count) = ParseFrameData()
        print(result)
        animations.append((currentAddr, count))

    for (addr, count) in animations:
        print(f"extern const struct FrameData sFrameData_{addr:x}[{count}];")

    print(f"\nEnd: {file.tell():x}\n")
    Func()

Func()
