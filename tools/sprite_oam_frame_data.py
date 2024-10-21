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
    result = f"static const u16 sOam_{file.tell()-2:x}[] = " + "{\n"
    if part_count == 0:
        result += f"    0"
    else:
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

def ParseFrameData(spriteName):
    startAddr = file.tell()
    frameData = []
    while True:
        pFrame = int.from_bytes(file.read(4), "little") & 0x1ffffff
        timer = int.from_bytes(file.read(4), "little")
        if pFrame == 0:
            break
        frameData.append((pFrame, timer))

    result = f"const struct FrameData s{spriteName}Oam_{startAddr:x}[{(len(frameData)+1)}] = " + "{\n"

    index = 0
    for (pFrame, timer) in frameData:
        result += f"    [{index}] = " + "{\n" + f"        .pFrame = sOam_{pFrame:x},\n" + f"        .timer = {timer}\n" + "    },\n"
        index += 1
    result += f"    [{index}] = FRAME_DATA_TERMINATOR\n" + "};\n"

    return (result, frameData)

file = open("../mf_us_baserom.gba", "rb")

def Func():
    spriteId = int(input("Primary sprite ID or first OAM entry pointer (in hex) : "), 16)
    spriteName = input("Name of sprite: ")

    if spriteId >= 0x100:
        file.seek(spriteId & 0x1ffffff)
    else:
        file.seek(0x79a5d8 + spriteId*4 - 0x40)
        gfxPointer = int.from_bytes(file.read(4), 'little') & 0x1ffffff

        file.seek(0x79a8d4 + spriteId*4 - 0x40) # usually OAM entries come right after palettes, but that's not always the case
        palPointer = int.from_bytes(file.read(4), 'little') & 0x1ffffff

        file.seek(0x2e4a50 + spriteId*4 - 0x40)
        rows = int.from_bytes(file.read(4), 'little')//0x800

        file.seek(palPointer+rows*16*2)

        print(f"sprites/{spriteName.lower()}.gfx;{rows};0x{gfxPointer:x};2048")
        print(f"sprites/{spriteName.lower()}.pal;{rows};0x{palPointer:x};32\n")

        print(f"const u32 s{spriteName}Gfx[512 * {rows}] = INCBIN_U32(\"data/sprites/{spriteName.lower()}.gfx\");")
        print(f"const u16 s{spriteName}Pal[512 * {rows}] = INCBIN_U32(\"data/sprites/{spriteName.lower()}.pal\");")

    frames = set()
    output = ""
    while True:
        currentAddr = file.tell()
        if currentAddr % 4 != 0:
            file.read(4 - (currentAddr % 4)) # align
        pointer = int.from_bytes(file.read(4), 'little')
        if pointer in frames:
            file.seek(file.tell()-4)
            break
        file.seek(currentAddr)
        frames |= {currentAddr | 0x8000000}
        output += ParseOam() + '\n'

    animations = []
    namedFrames = {}
    while True:
        currentAddr = file.tell()
        pointer = int.from_bytes(file.read(4), 'little')
        file.seek(currentAddr)
        if pointer not in frames:
            break

        (result, frameData) = ParseFrameData(spriteName)
        output += result + '\n'
        animations.append((currentAddr, len(frameData)+1))
        for i in range(len(frameData)):
            if frameData[i][0] not in namedFrames:
                namedFrames[frameData[i][0]] = f"s{spriteName}Oam_{currentAddr:x}_Frame{i}"

    for (addr, name) in namedFrames.items():
        output = output.replace(f"sOam_{addr:x}", name)
    print(output)

    for (addr, count) in animations:
        print(f"extern const struct FrameData s{spriteName}Oam_{addr:x}[{count}];")

    print(f"\nEnd: {file.tell():x}\n")
    Func()

Func()
