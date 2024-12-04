def toPixels(value):
    if value > 0x7FFF:
        value = -(0x10000 - value)

    return value//4

partNames = [
    "BOX_2_PART_FRONT_LEFT_LEG_COVER",
    "BOX_2_PART_FRONT_LEFT_LEG",
    "BOX_2_PART_FRONT_RIGHT_LEG_COVER",
    "BOX_2_PART_FRONT_RIGHT_LEG",
    "BOX_2_PART_MIDDLE_LEFT_LEG",
    "BOX_2_PART_MIDDLE_RIGHT_LEG",
    "BOX_2_PART_CENTER",
    "BOX_2_PART_BRAIN",
    "BOX_2_PART_CENTER_BOTTOM",
    "BOX_2_PART_LAUNCHER",
    "BOX_2_PART_BACK_LEFT_LEG",
    "BOX_2_PART_BACK_RIGHT_LEG",

    "BOX_2_PART_END"
]

def ParseMultiSpriteFrame():
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
        result += f"    [{partNames[i]}] = MULTI_SPRITE_DATA_INFO(Box2Oam_{animations[multiSpriteData[i][0]]:x}, {toPixels(multiSpriteData[i][1])}, {toPixels(multiSpriteData[i][2])})"
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

    result = f"const struct MultiSpriteData sBox2MultiSpriteData_{startAddr:x}[{(len(frameData)+1)}] = " + "{\n"

    index = 0
    for (pFrame, timer) in frameData:
        result += f"    [{index}] = " + "{\n" + f"        .pData = sMultiSpriteFrame_{pFrame:x},\n" + f"        .timer = {timer}\n" + "    },\n"
        index += 1
    result += f"    [{index}] = MULTI_SPRITE_DATA_TERMINATOR\n" + "};\n"

    return (result, frameData)

file = open("../mf_us_baserom.gba", "rb")
file.seek(0x79b560)
animations = [int.from_bytes(file.read(4), 'little') & 0x1ffffff for i in range(46)]

print("const struct FrameData* const sBox2FrameDataPointers[BOX_2_OAM_END] = {")
for addr in animations:
    print(f"    [Box2Oam_{addr:x}] = sBox2Oam_{addr:x},")
print("};\n")

print("enum Box2Oam {")
for addr in animations:
    print(f"    Box2Oam_{addr:x},")
print("\n    BOX_2_OAM_END\n};\n")

file.seek(0x3905fa)
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
    output += ParseMultiSpriteFrame() + '\n'

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
            namedFrames[frameData[i][0]] = f"sBox2MultiSpriteData_{currentAddr:x}_Frame{i}"

for (addr, name) in namedFrames.items():
    output = output.replace(f"sMultiSpriteFrame_{addr:x}", name)
print(output)

for (addr, count) in animations:
    print(f"extern const struct MultiSpriteData sBox2MultiSpriteData_{addr:x}[{count}];")

print(f"\nEnd: {file.tell():x}\n")

file.close()
input()
