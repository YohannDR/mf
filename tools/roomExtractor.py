from decompressor import decomp_rle, decomp_lz77

def romRead(n):
    return int.from_bytes(rom.read(n), "little")

fmtByte = lambda b: "UCHAR_MAX" if b == 0xff else b

areaNames = [
    "MainDeck",
    "Sector1",
    "Sector2",
    "Sector3",
    "Sector4",
    "Sector5",
    "Sector6",
    "Debug1",
    "Debug2",
    "Debug3"
]

areaNamesLowercase = [
    "main_deck",
    "sector_1",
    "sector_2",
    "sector_3",
    "sector_4",
    "sector_5",
    "sector_6",
    "debug_1",
    "debug_2",
    "debug_3"
]

xParasitePropertyNames = [
    "SSP_EMPTY",
    "SSP_UNINFECTED_OR_BOSS",
    "SSP_X_ABSORBABLE_BY_SAMUS",
    "SSP_X_UNABSORBABLE_BY_SAMUS",
    "SSP_40"
]

targetNames = [
    "PSPRITE_TARGET_CIRCLES",
    "PSPRITE_TARGET_DIAGONAL",
    "PSPRITE_TARGET_SIDEWAYS",
    "PSPRITE_UNUSED_3",
    "PSPRITE_UNUSED_4",
    "PSPRITE_UNUSED_5",
    "PSPRITE_UNUSED_6",
    "PSPRITE_UNUSED_7",
    "PSPRITE_UNUSED_8",
    "PSPRITE_UNUSED_9",
    "PSPRITE_UNUSED_10",
    "PSPRITE_UNUSED_11",
    "PSPRITE_UNUSED_12",
    "PSPRITE_UNUSED_13",
    "PSPRITE_CORE_X_TARGET",
    "PSPRITE_UNUSED_15",
    "PSPRITE_UNUSED_16"
]

def getRoomPointers():
    pointers = {}

    # Rooms
    pRoomEntries = []
    for areaIdx in range(len(areaNames)-3):
        rom.seek(0x79b8bc+areaIdx*4)
        pRoomEntries.append(romRead(4) & 0x1ffffff)
    pRoomEntries.append(0x3c85d4) # Terminator for Sector 6 rooms

    for areaIdx in range(len(areaNames)-3):
        rom.seek(pRoomEntries[areaIdx])
        i = 0
        print(f"enum {areaNames[areaIdx]}Rooms {{")
        while True:
            print(f"    {areaNamesLowercase[areaIdx].upper()}_{i},")
            tileset = romRead(1)
            Bg0Prop = romRead(1)
            Bg1Prop = romRead(1)
            Bg2Prop = romRead(1)
            Bg3Prop = romRead(1)
            romRead(3)

            pBg0Data = romRead(4) & 0x1ffffff
            if pBg0Data not in pointers:
                if Bg0Prop & 0x10:
                    pointers[pBg0Data] = ([i, areaIdx, 0, "RLE"], "BG")
                elif Bg0Prop & 0x40:
                    pointers[pBg0Data] = ([i, areaIdx, 0, "LZ77"], "BG")

            pBg1Data = romRead(4) & 0x1ffffff
            if pBg1Data not in pointers:
                pointers[pBg1Data] = ([i, areaIdx, 1, "RLE"], "BG")

            pBg2Data = romRead(4) & 0x1ffffff
            if pBg2Data not in pointers:
                pointers[pBg2Data] = ([i, areaIdx, 2, "RLE"], "BG")

            pClipData = romRead(4) & 0x1ffffff
            if pClipData not in pointers:
                pointers[pClipData] = ([i, areaIdx], "Clipdata")

            pBg3Data = romRead(4) & 0x1ffffff
            if pBg3Data not in pointers:
                pointers[pBg3Data] = ([i, areaIdx, 3, "LZ77"], "BG")

            Bg3Scrolling = romRead(1)
            transparency = romRead(1)
            romRead(2)

            pDefaultSpriteData = romRead(4) & 0x1ffffff
            if pDefaultSpriteData not in pointers:
                pointers[pDefaultSpriteData] = ([i, areaIdx, 0], "SpriteData")
            defaultSpriteset = romRead(1)

            firstSpritesetEvent = romRead(1)
            romRead(2)
            pFirstSpriteData = romRead(4) & 0x1ffffff
            if pFirstSpriteData not in pointers:
                pointers[pFirstSpriteData] = ([i, areaIdx, 1], "SpriteData")
            firstSpriteset = romRead(1)

            secondSpritesetEvent = romRead(1)
            romRead(2)
            pSecondSpriteData = romRead(4) & 0x1ffffff
            if pSecondSpriteData not in pointers:
                pointers[pSecondSpriteData] = ([i, areaIdx, 2], "SpriteData")
            secondSpriteset = romRead(1)

            mapX = romRead(1)
            mapY = romRead(1)
            effect = romRead(1)
            effectY = romRead(1)
            romRead(1)
            music = romRead(2)

            if rom.tell() in pRoomEntries:
                print("};\n")
                break
            i += 1

    # Scrolls
    for areaIdx in range(len(areaNames)):
        rom.seek(0x79bb08+areaIdx*4)
        rom.seek(romRead(4) & 0x1ffffff)
        i = 0
        while True:
            pScroll = romRead(4) & 0x1ffffff
            if pScroll == 0x3c9230: # Terminator
                break
            if pScroll not in pointers:
                currentAddr = rom.tell()
                rom.seek(pScroll)
                room = romRead(1)
                rom.seek(currentAddr)
                pointers[pScroll] = ([room, areaIdx], "Scroll")
            i += 1

    # Tilesets
    rom.seek(0x3bf888)
    for i in range(98):
        pTileGraphics = romRead(4) & 0x1ffffff
        if pTileGraphics not in pointers:
            pointers[pTileGraphics] = ([i], "TileGraphics")

        pPalette = romRead(4) & 0x1ffffff
        if pPalette not in pointers:
            pointers[pPalette] = ([i], "Palette")

        pBackgroundGraphics = romRead(4) & 0x1ffffff
        if pBackgroundGraphics not in pointers:
            pointers[pBackgroundGraphics] = ([i], "BackgroundGraphics")

        pTilemap = romRead(4) & 0x1ffffff
        if pTilemap not in pointers:
            pointers[pTilemap] = ([i], "Tilemap")

        animatedTileset = romRead(1)
        animatedPalette = romRead(1)
        romRead(2)

    # Animated palettes
    rom.seek(0x3e3764)
    for i in range(33):
        paletteype = romRead(1)
        framesPerState = romRead(1)
        numbersOfStates = romRead(1)
        romRead(1)

        pPalette = romRead(4) & 0x1ffffff
        if pPalette not in pointers:
            pointers[pPalette] = ([i, numbersOfStates], "AnimatedPalette")

    # Unused
    pointers[0x46fa8a] = ([3, 0, 1], "SpriteData")
    pointers[0x46fc9c] = ([4, 0, 1], "SpriteData")
    pointers[0x46fe0e] = ([5, 0, 2, "RLE"], "BG")
    pointers[0x47e3fb] = ([68, 0, 0, "RLE"], "BG")
    pointers[0x49b9ed] = ([13, 1, 0, "RLE"], "BG")
    pointers[0x51622e] = ([6, 5, 1], "SpriteData")
    pointers[0x51c9cc] = ([35, 5, 1], "SpriteData")
    pointers[0x51cc87] = ([36, 5, 1], "SpriteData")
    pointers[0x5554d7] = ([27, 6, 1], "SpriteData")

    return pointers

def getLabelName(metadata, group):
    if group == "BG":
        return f"s{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}"
    if group == "Clipdata":
        return f"s{areaNames[metadata[1]]}_{metadata[0]}_Clipdata"
    if group == "SpriteData":
        return f"s{areaNames[metadata[1]]}_{metadata[0]}_SpriteData{metadata[2]}"
    if group == "Scroll":
        return f"s{areaNames[metadata[1]]}_{metadata[0]}_Scrolls"
    if group == "TileGraphics":
        return f"sTileset_{metadata[0]}_Gfx"
    if group == "Palette":
        return f"sTileset_{metadata[0]}_Pal"
    if group == "BackgroundGraphics":
        return f"sTileset_{metadata[0]}_Bg_Gfx"
    if group == "Tilemap":
        return f"sTileset_{metadata[0]}_Tilemap"
    if group == "AnimatedPalette":
        return f"sAnimatedPal_{metadata[0]}"

def extractRooms(pointers):
    out = ""
    header = ""
    database = ""
    sortedPointers = sorted(pointers.items())
    for i in range(len(pointers)):
        (pointer, (metadata, group)) = sortedPointers[i]
        if i < len(pointers) - 1:
            (nextPointer, (nextMetadata, nextGroup)) = sortedPointers[i+1]
        labelName = getLabelName(metadata, group)
        rom.seek(pointer)

        out += f"\n"

        if group == "BG":
            if metadata[3] == "RLE":
                out += f"const u8 {labelName}[] = {{\n"
                out += f"    {romRead(1)}, {romRead(1)},\n"
                out += f"    _INCBIN_U8(\"data/rooms/{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}.tt.rle\")\n"
                out += "};\n"
                header += f"extern const u8 {labelName}[];\n"
                database += f"rooms/{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}.tt.rle;0x{rom.tell():x}\n"
                (decompressed, size) = decomp_rle(rom, rom.tell()) # First 2 bytes hold width and height
            else:
                out += f"const u32 {labelName}[] = {{\n"
                out += f"    {romRead(4)}, _INCBIN_U32(\"data/rooms/{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}.tt.lz\")\n"
                out += "};\n"
                header += f"extern const u32 {labelName}[];\n"
                database += f"rooms/{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}.tt.lz;0x{rom.tell():x}\n"
                (decompressed, size) = decomp_lz77(rom, rom.tell())
            if metadata[0] != nextMetadata[0] and metadata[3] == "RLE":
                out += "ALIGN2();\n"
                rom.seek((rom.tell() + 3) // 4 * 4) # align if next room

        if group == "Clipdata":
            out += f"const u8 {labelName}[] = {{\n"
            out += f"    {romRead(1)}, {romRead(1)},\n"
            out += f"    _INCBIN_U8(\"data/rooms/{areaNames[metadata[1]]}_{metadata[0]}_Clipdata.tt.rle\")\n"
            out += "};\n"
            header += f"extern const u8 {labelName}[];\n"
            database += f"rooms/{areaNames[metadata[1]]}_{metadata[0]}_Clipdata.tt.rle;0x{rom.tell():x}\n"
            (decompressed, size) = decomp_rle(rom, rom.tell()) # First 2 bytes hold width and height
            if metadata[0] != nextMetadata[0]:
                out += "ALIGN2();\n"
                rom.seek((rom.tell() + 3) // 4 * 4) # align if next room

        if group == "SpriteData":
            spriteData = []
            while True:
                sprite = [romRead(1), romRead(1), romRead(1)]
                if sprite[0] == 0xff: # terminator
                    break
                spriteData.append(sprite)

            out += f"const u8 {labelName}[ROOM_SPRITE_DATA_COUNT({len(spriteData)})] = {{\n"
            for sprite in spriteData:
                spritesetSlot = ""
                if sprite[2] <= 0x10:
                    spritesetSlot = f"ROOM_SPRITESET_IDX({targetNames[sprite[2] - 1]})"
                else:
                    if sprite[2] & 0x80 != 0:
                        spritesetSlot += "SSP_HIDDEN_ON_ROOM_LOAD | "
                    if (sprite[2] >> 4) & 7 != 0:
                        spritesetSlot += f"{xParasitePropertyNames[(sprite[2] >> 4) & 7]} | "
                    spritesetSlot += f"ROOM_SPRITESET_IDX({(sprite[2] & 0xf) - 1})"
                    
                out += f"    {sprite[0]}, {sprite[1]}, {spritesetSlot},\n"
            out += "    ROOM_SPRITE_DATA_TERMINATOR\n};\n"
            header += f"extern const u8 {labelName}[ROOM_SPRITE_DATA_COUNT({len(spriteData)})];\n"
            if metadata[0] != nextMetadata[0]:
                out += "ALIGN2();\n"
                rom.seek((rom.tell() + 3) // 4 * 4) # align if next room

        if group == "Scroll":
            room = romRead(1)
            count = romRead(1)
            out += f"const u8 {labelName}[SCROLL_DATA_COUNT({count})] = {{\n"
            out += f"    {areaNamesLowercase[metadata[1]].upper()}_{room}, // Room\n"
            out += f"    {count}, // Count\n"
            for i in range(count):
                out += f"\n    // Scroll {i}\n"
                out += f"    {romRead(1)}, {romRead(1)}, // X bounds\n"
                out += f"    {romRead(1)}, {romRead(1)}, // Y bounds\n"
                out += f"    {fmtByte(romRead(1))}, {fmtByte(romRead(1))}, // Breakable block position\n"
                out += f"    {fmtByte(romRead(1))}, // Breakable block direction\n"
                out += f"    {fmtByte(romRead(1))}, // Breakable block Y bound extension\n"
            out += "};\n"
            header += f"extern const u8 {labelName}[SCROLL_DATA_COUNT({count})];\n"

        if group == "TileGraphics":
            out += f"const u32 {labelName}[] = INCBIN_U32(\"data/tilesets/{metadata[0]}.gfx.lz\");\n"
            header += f"extern const u32 {labelName}[];\n"
            database += f"tilesets/{metadata[0]}.gfx.lz;0x{pointer:x}\n"
            (decompressed, size) = decomp_lz77(rom, rom.tell())
            rom.seek((rom.tell() + 3) // 4 * 4) # align

        if group == "Palette":
            out += f"const u16 {labelName}[14 * 16] = INCBIN_U16(\"data/tilesets/{metadata[0]}.pal\");\n"
            header += f"extern const u16 {labelName}[14 * 16];\n"
            database += f"tilesets/{metadata[0]}.pal;14;0x{pointer:x};32\n"
            romRead(14 * 32)

        if group == "BackgroundGraphics":
            out += f"const u32 {labelName}[] = INCBIN_U32(\"data/tilesets/{metadata[0]}_Bg.gfx.lz\");\n"
            header += f"extern const u32 {labelName}[];\n"
            database += f"tilesets/{metadata[0]}_Bg.gfx.lz;0x{pointer:x}\n"
            (decompressed, size) = decomp_lz77(rom, rom.tell())
            rom.seek((rom.tell() + 3) // 4 * 4) # align

        if group == "Tilemap":
            out += f"const u16 {labelName}[0x{(nextPointer-pointer)//2:x}] = INCBIN_U16(\"data/tilesets/{metadata[0]}.tt\");\n"
            header += f"extern const u16 {labelName}[0x{(nextPointer-pointer)//2:x}];\n"
            database += f"tilesets/{metadata[0]}.tt;{(nextPointer-pointer)//2};0x{pointer:x};2\n"
            rom.seek(nextPointer)

        if group == "AnimatedPalette":
            out += f"const u16 {labelName}[{metadata[1]} * 16] = INCBIN_U16(\"data/tilesets/animated_palettes/{metadata[0]}.pal\");\n"
            header += f"extern const u16 {labelName}[{metadata[1]} * 16];\n"
            database += f"tilesets/animated_palettes/{metadata[0]}.pal;{metadata[1]};0x{pointer:x};32\n"
            romRead(metadata[1] * 32)

        if rom.tell() not in pointers:
                out += f"Unused pointer after {labelName}: {rom.tell():x}, current pointer: {pointer:x}, next pointer: {nextPointer:x}\n"

    out += header
    out += database

    return out

rom = open("../mf_us_baserom.gba", "rb")
out = open("out.txt", "w")
pointers = getRoomPointers()
out.write(extractRooms(pointers))
rom.close()
out.close()
