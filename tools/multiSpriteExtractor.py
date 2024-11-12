def toPixels(value):
    if value > 0x7FFF:
        value = -(0x10000 - value)

    return value//4

bodyPartNames = [
    "RIDLEY_PART_FRONT_WING",
    "RIDLEY_PART_TAIL_START",
    "RIDLEY_PART_BODY",
    "RIDLEY_PART_BACK_WING",

    "RIDLEY_PART_END"
]

tailPartNames = [
    "RIDLEY_TAIL_PART_0",
    "RIDLEY_TAIL_PART_1",
    "RIDLEY_TAIL_PART_2",
    "RIDLEY_TAIL_PART_3",
    "RIDLEY_TAIL_PART_4",
    "RIDLEY_TAIL_PART_5",
    "RIDLEY_TAIL_PART_6",
    "RIDLEY_TAIL_PART_TIP",

    "RIDLEY_TAIL_PART_END"
]

def ParseMultiSpriteFrame(partNames):
    global animations
    startAddr = file.tell()
    multiSpriteData = []
    for i in range(len(partNames)-1):
        index = int.from_bytes(file.read(2), "little")
        y = int.from_bytes(file.read(2), "little")
        x = int.from_bytes(file.read(2), "little")
        multiSpriteData.append((index, y, x))

    result = f"static const s16 sMultiSpriteFrame_{startAddr:x}[{partNames[len(partNames)-1]}][MULTI_SPRITE_DATA_ELEMENT_END] = " + "{\n"
    for i in range(len(partNames)-1):
        result += f"    [{partNames[i]}] = MULTI_SPRITE_DATA_INFO(RIDLEY_PART_OAM_{animations[multiSpriteData[i][0]]:X}, {toPixels(multiSpriteData[i][1])}, {toPixels(multiSpriteData[i][2])})"
        if i < len(partNames)-2:
            result += ",\n"
    result += "\n};\n"

    return result

def ParseMultiSpriteData():
    startAddr = file.tell()
    frameData = []
    while True:
        pFrame = int.from_bytes(file.read(4), "little") & 0x1ffffff
        timer = int.from_bytes(file.read(4), "little")
        if pFrame == 0:
            break
        frameData.append((pFrame, timer))

    result = f"const struct MultiSpriteData sRidleyMultiSpriteData_{startAddr:x}[{(len(frameData)+1)}] = " + "{\n"

    index = 0
    for (pFrame, timer) in frameData:
        result += f"    [{index}] = " + "{\n" + f"        .pData = sMultiSpriteFrame_{pFrame:x},\n" + f"        .timer = {timer}\n" + "    },\n"
        index += 1
    result += f"    [{index}] = MULTI_SPRITE_DATA_TERMINATOR\n" + "};\n"

    return (result, frameData)

file = open("../mf_us_baserom.gba", "rb")
file.seek(0x79b708)
animations = [int.from_bytes(file.read(4), 'little') & 0x1ffffff for i in range(31)]

print("const struct FrameData* const sRidleyFrameDataPointers[RIDLEY_OAM_END] = {")
for addr in animations:
    print(f"    [RIDLEY_PART_OAM_{addr:X}] = sRidleyPartOam_{addr:x},")
print("};\n")

print("enum RidleyOam {")
for addr in animations:
    print(f"    RIDLEY_PART_OAM_{addr:X},")
print("\n    RIDLEY_OAM_END\n};\n")

file.seek(0x3a8f54)
frames = set()
output = ""
while True:
    currentAddr = file.tell()
    if currentAddr % 4 != 0:
        file.read(2) # align
    pointer = int.from_bytes(file.read(4), 'little')
    if pointer in frames:
        file.seek(file.tell()-4)
        break
    file.seek(currentAddr)
    frames |= {currentAddr | 0x8000000}
    if currentAddr < 0x3a917c or currentAddr >= 0x3a98fc:
        output += ParseMultiSpriteFrame(bodyPartNames) + '\n'
    else:
        output += ParseMultiSpriteFrame(tailPartNames) + '\n'

animations = []
namedFrames = {}
while True:
    currentAddr = file.tell()
    pointer = int.from_bytes(file.read(4), 'little')
    file.seek(currentAddr)
    if pointer not in frames:
        break

    (result, frameData) = ParseMultiSpriteData()
    output += result + '\n'
    animations.append((currentAddr, len(frameData)+1))
    for i in range(len(frameData)):
        if frameData[i][0] not in namedFrames:
            namedFrames[frameData[i][0]] = f"sRidleyMultiSpriteData_{currentAddr:x}_Frame{i}"

for (addr, name) in namedFrames.items():
    output = output.replace(f"sMultiSpriteFrame_{addr:x}", name)
print(output)

for (addr, count) in animations:
    print(f"extern const struct MultiSpriteData sRidleyMultiSpriteData_{addr:x}[{count}];")

print(f"\nEnd: {file.tell():x}\n")

input()
