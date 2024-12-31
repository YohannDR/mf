saXPoseNames = [
    "SA_X_POSE_RUNNING",
    "SA_X_POSE_WALKING",
    "SA_X_POSE_STANDING",
    "SA_X_POSE_SHOOTING",
    "SA_X_POSE_TURNING",
    "SA_X_POSE_MID_AIR",
    "SA_X_POSE_LANDING",
    "SA_X_POSE_FALLING",
    "SA_X_POSE_GETTING_HURT",
    "SA_X_POSE_SHOOTING_RESTRICTED_LABORATORY",
    "SA_X_POSE_COVERED_BY_METROIDS",
    "SA_X_POSE_KNEELING",
    "SA_X_POSE_TRANSFORMING_INTO_MONSTER",
    "SA_X_POSE_MORPHING",
    "SA_X_POSE_UNMORPHING",
    "SA_X_POSE_MORPH_BALL",
    "SA_X_POSE_ROLLING",
    "SA_X_POSE_SWAG_WALK",
    "SA_X_POSE_TURNING_TOWARDS_CAMERA",
    "SA_X_POSE_TURNING_AWAY_FROM_CAMERA"
]

diagAimNames = [
    "DIAG_AIM_NONE",
    "DIAG_AIM_UP",
    "DIAG_AIM_DOWN"
]

diagAimPoses = [
    "sSaXOamDataPointers_Standing_Armed",
    "sSaXOamDataPointers_Standing",
    "sSaXOamDataPointers_Shooting_Armed",
    "sSaXOamDataPointers_Shooting",
    "sSaXOamDataPointers_Turning"
]

def ParseGfx():
    startAddr = file.tell()

    topLength = int.from_bytes(file.read(1), "little")
    bottomLength = int.from_bytes(file.read(1), "little")

    file.read((topLength + bottomLength) * 32)

    result = f"static const u8 sSaXGfx_{startAddr:x}[SA_X_GFX_SIZE({topLength}, {bottomLength})] = " + "{\n"
    result += f"    {topLength}, {bottomLength},\n"
    result += f"    _INCBIN_U8(\"data/sa_x/{startAddr:x}.gfx\")\n" + "};\n"

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
    result = f"static const u16 sSaXOam_{file.tell()-2:x}[OAM_DATA_SIZE({part_count})] = " + "{\n"
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

def ParseAnim():
    startAddr = file.tell()
    animationData = []
    while True:
        pGraphics = int.from_bytes(file.read(4), "little") & 0x1ffffff
        pOamFrame = int.from_bytes(file.read(4), "little") & 0x1ffffff
        timer = int.from_bytes(file.read(4), "little")
        if timer == 0:
            break
        animationData.append((pGraphics, pOamFrame, timer))

    result = f"const struct SaXAnimationData sSaXAnim_{startAddr:x}[{(len(animationData)+1)}] = " + "{\n"

    index = 0
    for (pGraphics, pOamFrame, timer) in animationData:
        result += f"    [{index}] = " + "{\n"
        result += f"        .pGraphics = sSaXGfx_{pGraphics:x},\n"
        result += f"        .pOamFrame = sSaXOam_{pOamFrame:x},\n"
        result += f"        .timer = {timer}\n" + "    },\n"
        index += 1
    result += f"    [{index}] = SA_X_ANIM_TERMINATOR\n" + "};\n"

    return result

def PrintGfxOamAnim():
    while True:
        currentAddr = file.tell()
        end = int.from_bytes(file.read(2), "little") & 0xff00
        file.seek(currentAddr)
        if end == 0:
            break
        print(ParseGfx())
        '''topLength = int.from_bytes(file.read(1), "little")
        bottomLength = int.from_bytes(file.read(1), "little")
        file.read((topLength + bottomLength) * 32)
        print(f"sa_x/{currentAddr:x}.gfx;{topLength+bottomLength};{currentAddr+2:x};32")
    print()'''

    pOamFrames = set()
    while True:
        currentAddr = file.tell()
        if currentAddr % 4 != 0:
            file.read(4 - (currentAddr % 4)) # align
        file.read(4)
        pointer = int.from_bytes(file.read(4), 'little')
        if pointer in pOamFrames:
            file.seek(file.tell()-8)
            break
        file.seek(currentAddr)
        pOamFrames |= {currentAddr | 0x8000000}
        print(ParseOam())
        #ParseOam()

    while True:
        file.read(4)
        pointer = int.from_bytes(file.read(4), 'little')
        file.seek(file.tell()-8)
        if pointer not in pOamFrames:
            break
        print(ParseAnim())
        #ParseAnim()


file = open("../mf_us_baserom.gba", "rb")

def Func():
    file.seek(0x28ff60)

    for i in range(5):
        PrintGfxOamAnim()

    '''file.seek(0x2b403c)

    print("extern const struct SaXAnimationData* const sSaXOamDataPointers[SA_X_POSE_END][2] = {")
    for name in saXPoseNames:
        print("    [" + name + "] = {")
        print(f"        sSaXAnim_{int.from_bytes(file.read(4), 'little') & 0x1ffffff:x},")
        print(f"        sSaXAnim_{int.from_bytes(file.read(4), 'little') & 0x1ffffff:x}")
        print("    },")
    print("};\n")

    for diagAimPose in diagAimPoses:
        print("const struct SaXAnimationData* const " + diagAimPose + "[DIAG_AIM_END][2] = {")
        for name in diagAimNames:
            print("    [" + name + "] = {")
            print(f"        sSaXAnim_{int.from_bytes(file.read(4), 'little') & 0x1ffffff:x},")
            print(f"        sSaXAnim_{int.from_bytes(file.read(4), 'little') & 0x1ffffff:x}")
            print("    },")
        print("};\n")'''

    input(f"End: {file.tell():x}")

Func()