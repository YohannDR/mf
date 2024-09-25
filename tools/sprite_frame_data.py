def Parse():
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

    return result

file = open("../mf_us_baserom.gba", "rb")

def Func():
    start = int(input("Start address : "), 16) & 0x7fffff
    end = int(input("End address : "), 16) & 0x7fffff

    file.seek(start)

    while file.tell() < end:
        print(Parse())

    Func()

Func()
