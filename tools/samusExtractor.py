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

animNamesBase = [
    "Standing", # 0
    "TurningAround", # 1
    "Shooting", # 2
    "Running", # 3
    "MidAir", # 4
    "TurningAroundMidAir", # 5
    "Landing", # 6
    "UnusedCrouching", # 7
    "TurningAroundAndCrouching", # 8
    "Crouching", # 9
    "StartingSpinJump", # 0xa
    "Spinning", # 0xb
    "Morphing", # 0xc
    "MorphBall", # 0xd
    "Rolling", # 0xe
    "Unmorphing", # 0xf
    "MorphBallMidAir", # 0x10
    "GettingHurt", # 0x11
    "GettingHurtInMorphBall", # 0x12
    "GettingKnockedBack", # 0x13
    "GettingKnockedBackInMorphBall", # 0x14
    "StartingWallJump", # 0x15
    "WallJumping", # 0x16
    "UsingAnElevator", # 0x17
    "HangingOnLedge", # 0x18
    "PullingYourselfUpFromHanging", # 0x19
    "PullingYourselfForwardFromHanging", # 0x1a
    "PullingYourselfIntoMorphBallTunnel", # 0x1b
    "PullingYourselfDownToStartHanging", # 0x1c
    "SpaceJumping", # 0x1d
    "ScrewAttacking", # 0x1e
    "Skidding", # 0x1f
    "OnSavePad", # 0x20
    "OnRechargeOrSecurityPad", # 0x21
    "TurningAroundToRechargeOrUnlockDoors", # 0x22
    "DelayBeforeShinesparking", # 0x23
    "Shinesparking", # 0x24
    "DelayAfterShinesparking", # 0x25
    "HangingFromVerticalLadder", # 0x26
    "StartingToHoldYourArmCannonOutOnAVerticalLadder", # 0x27
    "HoldingYourArmCannonOutOnAVerticalLadder", # 0x28
    "ShootingOnVerticalLadder", # 0x29
    "StartingToPutAwayYourArmCannonOutOnAVerticalLadder", # 0x2a
    "HangingOnHorizontalLadder", # 0x2b
    "MovingOnHorizontalLadder", # 0x2c
    "TurningAroundOnHorizontalLadder", # 0x2d
    "DelayAfterShootingOnHorizontalLadder", # 0x2e
    "ShootingOnHorizontalLadder", # 0x2f
    "Frozen", # 0x30
    "FrozenAndFalling", # 0x31
    "FrozenInMorphBall", # 0x32
    "FrozenInMorphBallAndFalling", # 0x33
    "UnlockingSecurity", # 0x34
    "Saving", # 0x35
    "OnNavigationPad", # 0x36
    "DownloadingAbility", # 0x37
    "BeingRecharged", # 0x38
    "FacingForeground", # 0x39
    "FacingBackground", # 0x3a
    "UnlockingHabitationsDeck", # 0x3b
    "GrabbedByZazabi", # 0x3c
    "LoadingSave", # 0x3d
    "Dying", # 0x3e
    "HitByOmegaMetroid", # 0x3f
    "GrabbedByYakuza", # 0x40

    "Standing",
    "Forward_Standing",
    "DiagonalUp_Standing",
    "DiagonalDown_Standing",
    "Up_Standing",

    "TurningAround",
    "Forward_TurningAround",
    "DiagonalUp_TurningAround",
    "DiagonalDown_TurningAround",
    "Up_TurningAround",

    "Shooting",
    "Forward_Shooting",
    "DiagonalUp_Shooting",
    "DiagonalDown_Shooting",
    "Up_Shooting",

    "Running",
    "Forward_Running",
    "DiagonalUp_Running",
    "DiagonalDown_Running",

    "MidAir",
    "Forward_MidAir",
    "DiagonalUp_MidAir",
    "DiagonalDown_MidAir",
    "Up_MidAir",
    "Down_MidAir",

    "TurningAroundMidAir",
    "Forward_TurningAroundMidAir",
    "DiagonalUp_TurningAroundMidAir",
    "DiagonalDown_TurningAroundMidAir",
    "Up_TurningAroundMidAir",
    "Down_TurningAroundMidAir",

    "Landing",
    "Forward_Landing",
    "DiagonalUp_Landing",
    "DiagonalDown_Landing",
    "Up_Landing",

    # unused animations
    "UnusedCrouching",
    "Forward_UnusedCrouching",
    "DiagonalUp_UnusedCrouching",
    "DiagonalDown_UnusedCrouching",
    "Up_UnusedCrouching",

    "TurningAroundAndCrouching",
    "Forward_TurningAroundAndCrouching",
    "DiagonalUp_TurningAroundAndCrouching",
    "DiagonalDown_TurningAroundAndCrouching",
    "Up_TurningAroundAndCrouching",

    "Crouching",
    "Forward_Crouching",
    "DiagonalUp_Crouching",
    "DiagonalDown_Crouching",
    "Up_Crouching",

    "HangingOnLedge",
    "ReadyToJump_HangingOnLedge",

    # there's a random gap here for screw attack electricity OAM frame data pointers for some reason
    "gap",

    "Skidding",
    "Armed_Skidding",

    "Shinesparking",
    "Sidewards_Shinesparking",
    "DiagonalUp_Shinesparking",

    "DelayAfterShinesparking",
    "Sidewards_DelayAfterShinesparking",
    "DiagonalUp_DelayAfterShinesparking",

    "HoldingYourArmCannonOutOnAVerticalLadder",
    "Forward_HoldingYourArmCannonOutOnAVerticalLadder",
    "DiagonalUp_HoldingYourArmCannonOutOnAVerticalLadder",
    "DiagonalDown_HoldingYourArmCannonOutOnAVerticalLadder",
    "Up_HoldingYourArmCannonOutOnAVerticalLadder",
    "Down_HoldingYourArmCannonOutOnAVerticalLadder",

    "ShootingOnVerticalLadder",
    "Forward_ShootingOnVerticalLadder",
    "DiagonalUp_ShootingOnVerticalLadder",
    "DiagonalDown_ShootingOnVerticalLadder",
    "Up_ShootingOnVerticalLadder",
    "Down_ShootingOnVerticalLadder",

    "DelayAfterShootingOnHorizontalLadder",
    "Forward_DelayAfterShootingOnHorizontalLadder",
    "DiagonalUp_DelayAfterShootingOnHorizontalLadder",
    "DiagonalDown_DelayAfterShootingOnHorizontalLadder",
    "Up_DelayAfterShootingOnHorizontalLadder",
    "Down_DelayAfterShootingOnHorizontalLadder",

    "ShootingOnHorizontalLadder",
    "Forward_ShootingOnHorizontalLadder",
    "DiagonalUp_ShootingOnHorizontalLadder",
    "DiagonalDown_ShootingOnHorizontalLadder",
    "Up_ShootingOnHorizontalLadder",
    "Down_ShootingOnHorizontalLadder",

    # gaps for unlocking security and loading save effect OAM frame data pointers
    "gap",
    "gap",

    "HitByOmegaMetroid",
    "LookingUp_HitByOmegaMetroid"
]

namedAnims = {}

def ParseAnimNames():
    file.seek(0x28d2bc)

    for animIndex in range(len(animNamesBase)):
        if animNamesBase[animIndex] != "gap":
            right = int.from_bytes(file.read(4), "little") & 0x1ffffff
            left = int.from_bytes(file.read(4), "little") & 0x1ffffff

            if right == left:
                if right not in namedAnims: # there's only 1 dirction
                    namedAnims[right] = animNamesBase[animIndex]
            else:
                if right not in namedAnims:
                    namedAnims[right] = "Right_" + animNamesBase[animIndex]
                if left not in namedAnims:
                    namedAnims[left] = "Left_" + animNamesBase[animIndex]
        else:
            file.read(8)

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
            if currentAddr not in namedAnims:
                namedAnims[currentAddr] = f"{currentAddr:x}" # unused animation
            for i in range(len(animationData)):
                if animationData[i][0] not in namedFrames:
                    namedFrames[animationData[i][0]] = f"Top_{namedAnims[currentAddr]}_Frame{i}"
                if animationData[i][1] not in namedFrames:
                    namedFrames[animationData[i][1]] = f"Bottom_{namedAnims[currentAddr]}_Frame{i}"
                if animationData[i][2] not in namedFrames:
                    namedFrames[animationData[i][2]] = f"{namedAnims[currentAddr]}_Frame{i}"
            animations.append((currentAddr, len(animationData)+1))

    for (addr, length) in gfxs:
        output += f"samus/gfx/{addr:x}.gfx;{length};{addr+2:x};32\n"

    for (addr, name) in namedFrames.items():
        output = output.replace(f"{addr:x}", name)

    for (addr, name) in namedAnims.items():
        output = output.replace(f"{addr:x}", name)

    for (addr, length) in animations:
        output += f"extern const struct SamusAnimationData sSamusAnim_{namedAnims[addr]}[{length}];\n"

    return output


file = open("../mf_us_baserom.gba", "rb")
out = open("out.txt", "w")

def Func():
    ParseAnimNames()
    '''for (addr, name) in sorted(namedAnims.items()):
        print(f"{addr:x}: {name}")'''
    out.write(ParseGfxOamAnim())
    print(hex(file.tell()))

    file.close()
    #input()
    out.close()

Func()
