def ParseGfx(topLength, bottomLength):
    startAddr = file.tell()-2

    file.read((topLength + bottomLength) * 32)

    result = f"static const u8 sSamusGfx_{startAddr:x}[] = " + "{\n"
    result += f"    {topLength}, {bottomLength},\n"
    result += f"    _INCBIN_U8(\"data/samus/gfx/{startAddr:x}.gfx\")\n" + "};\n\n"

    return result

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
    if part_count == 0 or part_count > 128:
        return
    result = f"static const u16 sSamusOam_{file.tell()-2:x}[] = " + "{\n"
    result += f"    {part_count},\n    "

    for x in range(0, part_count):
        part0 = ParsePart0(int.from_bytes(file.read(2), "little"))
        result += part0 + ", "
        result += ParsePart1(part0, int.from_bytes(file.read(2), "little")) + ", "
        result += ParsePart2(int.from_bytes(file.read(2), "little"))
        if x < part_count - 1:
            result += ",\n    "

    result += "\n};\n\n"

    return result

def ParseAnim():
    startAddr = file.tell()
    animationData = []
    while True:
        pTopGfx = int.from_bytes(file.read(4), "little") & 0x1ffffff
        pBottomGfx = int.from_bytes(file.read(4), "little") & 0x1ffffff
        pOam = int.from_bytes(file.read(4), "little") & 0x1ffffff
        timer = int.from_bytes(file.read(4), "little")
        if timer == 0:
            break
        animationData.append((pTopGfx, pBottomGfx, pOam, timer))

    result = f"const struct SamusAnimationData sSamusAnim_{startAddr:x}[{(len(animationData)+1)}] = " + "{\n"

    index = 0
    for (pTopGfx, pBottomGfx, pOam, timer) in animationData:
        result += f"    [{index}] = " + "{\n"
        result += f"        .pTopGfx = sSamusGfx_{pTopGfx:x},\n"
        result += f"        .pBottomGfx = sSamusGfx_{pBottomGfx:x},\n"
        result += f"        .pOam = sSamusOam_{pOam:x},\n"
        result += f"        .timer = {timer}\n" + "    },\n"
        index += 1
    result += f"    [{index}] = SAMUS_ANIM_TERMINATOR\n" + "};\n\n"

    return (result, animationData)

def ParseGfxOamAnim():
    file.seek(0x2b5058)

    output = ""
    pOamFrames = {0x828998e} # start with empty data
    namedFrames = {0x28998c: "Empty", 0x28998e: "Empty"}
    animations = []
    gfxs = []
    for setIndex in range(8):
        while True:
            currentAddr = file.tell()
            topLength = int.from_bytes(file.read(1), "little")
            bottomLength = int.from_bytes(file.read(1), "little")
            if bottomLength == 0 and currentAddr not in (0x2d8f50, 0x2d8fd2, 0x2dd700):
                file.seek(currentAddr)
                break
            output += ParseGfx(topLength, bottomLength)
            gfxs.append((currentAddr, topLength+bottomLength))

        while True:
            currentAddr = file.tell()
            if currentAddr % 4 != 0:
                file.read(2) # align
            file.read(8)
            pointer = int.from_bytes(file.read(4), 'little')
            if pointer in pOamFrames:
                file.seek(file.tell()-12)
                break
            file.seek(currentAddr)
            pOamFrames |= {currentAddr | 0x8000000}
            output += ParseOam()

        while True:
            currentAddr = file.tell()
            file.read(8)
            pointer = int.from_bytes(file.read(4), 'little')
            file.seek(currentAddr)
            if pointer not in pOamFrames:
                break
            (result, animationData) = ParseAnim()
            output += result
            for i in range(len(animationData)):
                if animationData[i][0] not in namedFrames:
                    namedFrames[animationData[i][0]] = f"Top_{currentAddr:x}_Frame{i}"
                if animationData[i][1] not in namedFrames:
                    namedFrames[animationData[i][1]] = f"Bottom_{currentAddr:x}_Frame{i}"
                if animationData[i][2] not in namedFrames:
                    namedFrames[animationData[i][2]] = f"{currentAddr:x}_Frame{i}"
            animations.append((currentAddr, len(animationData)+1))

    for (addr, length) in gfxs:
        output += f"samus/gfx/{addr:x}.gfx;{length};{addr+2:x};32\n"

    for (addr, name) in namedFrames.items():
        output = output.replace(f"{addr:x}", name)

    for (addr, length) in animations:
        output += f"extern const struct SamusAnimationData sSamusAnim_{addr:x}[{length}];\n"

    return output


file = open("../mf_us_baserom.gba", "rb")
out = open("out.txt", "w")

def Func():
    out.write(ParseGfxOamAnim())
    print(hex(file.tell()))

    file.close()
    out.close()

Func()
