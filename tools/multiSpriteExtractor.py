def toPixels(value):
    if value > 0x7FFF:
        value = -(0x10000 - value)

    return value//4

partNames = [
    "OMEGA_METROID_PART_0",
    "OMEGA_METROID_PART_1",
    "OMEGA_METROID_PART_2",
    "OMEGA_METROID_PART_3",
    "OMEGA_METROID_PART_4",
    "OMEGA_METROID_PART_5",
    "OMEGA_METROID_PART_6",
    "OMEGA_METROID_PART_7",

    "OMEGA_METROID_PART_END"
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
        result += f"    [{partNames[i]}] = MULTI_SPRITE_DATA_INFO(OmegaMetroidPartOam_{animations[multiSpriteData[i][0]]:x}, {toPixels(multiSpriteData[i][1])}, {toPixels(multiSpriteData[i][2])})"
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

    result = f"const struct MultiSpriteData sOmegaMetroidMultiSpriteData_{startAddr:x}[{(len(frameData)+1)}] = " + "{\n"

    index = 0
    for (pFrame, timer) in frameData:
        result += f"    [{index}] = " + "{\n" + f"        .pData = sMultiSpriteFrame_{pFrame:x},\n" + f"        .timer = {timer}\n" + "    },\n"
        index += 1
    result += f"    [{index}] = MULTI_SPRITE_DATA_TERMINATOR\n" + "};\n"

    return (result, frameData)

file = open("../mf_us_baserom.gba", "rb")
file.seek(0x79b634)
animations = [int.from_bytes(file.read(4), 'little') & 0x1ffffff for i in range(53)]

print("const struct FrameData* const sOmegaMetroidFrameDataPointers[OMEGA_METROID_OAM_END] = {")
for addr in animations:
    print(f"    [OmegaMetroidPartOam_{addr:x}] = sOmegaMetroidPartOam_{addr:x},")
print("};\n")

print("enum OmegaMetroidOam {")
for addr in animations:
    print(f"    OmegaMetroidPartOam_{addr:x},")
print("\n    OMEGA_METROID_OAM_END\n};\n")

file.seek(0x395a08)
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
            namedFrames[frameData[i][0]] = f"sOmegaMetroidMultiSpriteData_{currentAddr:x}_Frame{i}"

for (addr, name) in namedFrames.items():
    output = output.replace(f"sMultiSpriteFrame_{addr:x}", name)
print(output)

for (addr, count) in animations:
    print(f"extern const struct MultiSpriteData sOmegaMetroidMultiSpriteData_{addr:x}[{count}];")

print(f"\nEnd: {file.tell():x}\n")

file.close()
input()
