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
    "SSP_CAN_ABSORB_ADDITIONAL_X",
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

def getPointers():
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
        while True:
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
                pointers[pScroll] = ([areaIdx], "Scroll")
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

def extractTilesets(pointers):
    out = ""
    sortedPointers = sorted(pointers.items())
    for i in range(len(pointers)-1):
        (pointer, (metadata, group)) = sortedPointers[i]
        (nextPointer, (nextMetadata, nextGroup)) = sortedPointers[i+1]

        out += f"\n// {pointer:x}\n"

        if group == "BG":
            if metadata[3] == "RLE":
                out += f"const u8 s{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}[] = {{\n"
                out += f"    {romRead(1)}, {romRead(1)},\n"
                out += f"    _INCBIN_U8(\"data/rooms/{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}.tt.rle\")\n"
                out += "};\n"
                (decompressed, size) = decomp_rle(rom, pointer+2) # First 2 bytes hold width and height
                pointer += size + 2
            else:
                out += f"const u8 s{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}[] = {{\n"
                out += f"    {romRead(1)}, {romRead(1)}, {romRead(1)}, {romRead(1)},\n"
                out += f"    _INCBIN_U8(\"data/rooms/{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}.tt.lz\")\n"
                out += "};\n"
                (decompressed, size) = decomp_lz77(rom, pointer+4)
                pointer += size + 4
            if metadata[0] != nextMetadata[0] or metadata[3] == "LZ77":
                out += "ALIGN2();\n"
                pointer = (pointer + 3) // 4 * 4 # align if next room
            if pointer not in pointers:
                out += f"Unused pointer after s{areaNames[metadata[1]]}_{metadata[0]}_Bg{metadata[2]}: {pointer:x}\n"

        if group == "Clipdata":
            out += f"const u8 s{areaNames[metadata[1]]}_{metadata[0]}_Clipdata[] = {{\n"
            out += f"    {romRead(1)}, {romRead(1)},\n"
            out += f"    _INCBIN_U8(\"data/rooms/{areaNames[metadata[1]]}_{metadata[0]}_Clipdata.tt.rle\")\n"
            out += "};\n"
            (decompressed, size) = decomp_rle(rom, pointer+2) # First 2 bytes hold width and height
            pointer += size + 2
            if metadata[0] != nextMetadata[0]:
                out += "ALIGN2();\n"
                pointer = (pointer + 3) // 4 * 4 # align if next room
            if pointer  not in pointers:
                out += f"Unused pointer after s{areaNames[metadata[1]]}_{metadata[0]}_Clipdata: {pointer:x}\n"

        if group == "SpriteData":
            rom.seek(pointer)
            spriteData = []
            while True:
                sprite = [romRead(1), romRead(1), romRead(1)]
                if sprite[0] == 0xff: # terminator
                    break
                spriteData.append(sprite)

            out += f"const u8 s{areaNames[metadata[1]]}_{metadata[0]}_SpriteData{metadata[2]}[ROOM_SPRITE_DATA_SIZE({len(spriteData)})] = {{\n"
            for sprite in spriteData:
                spritesetSlot = ""
                if sprite[2] <= 0x10:
                    spritesetSlot = targetNames[sprite[2] - 1]
                else:
                    if sprite[2] & 0x80 != 0:
                        spritesetSlot += "SSP_HIDDEN_ON_LOAD | "
                    if (sprite[2] >> 4) & 7 != 0:
                        spritesetSlot += f"{xParasitePropertyNames[(sprite[2] >> 4) & 7]} | "
                    spritesetSlot += f"SPRITESET_IDX({(sprite[2] & 0xf) - 1})"
                    
                out += f"    {sprite[0]}, {sprite[1]}, {spritesetSlot},\n"
            out += "    ROOM_SPRITE_DATA_TERMINATOR\n};\n"
            if metadata[0] != nextMetadata[0] or rom.tell() == 0x551dc2:
                out += "ALIGN2();\n"
                rom.seek((rom.tell() + 3) // 4 * 4) # align if next room
            if rom.tell() not in pointers:
                out += f"Unused pointer after s{areaNames[metadata[1]]}_{metadata[0]}_SpriteData{metadata[2]}: {rom.tell():x}\n"

        if group == "Scroll":
            rom.seek(pointer)
            room = romRead(1)
            count = romRead(1)
            out += f"const u8 s{areaNames[metadata[0]]}_{room}_Scrolls[SCROLL_DATA_SIZE({count})] = {{\n"
            out += f"    {room}, // Room\n"
            out += f"    {count}, // Count\n"
            for i in range(count):
                out += f"\n    // Scroll {i}\n"
                out += f"    {romRead(1)}, {romRead(1)}, // X bounds\n"
                out += f"    {romRead(1)}, {romRead(1)}, // Y bounds\n"
                out += f"    {fmtByte(romRead(1))}, {fmtByte(romRead(1))}, // Breakable block position\n"
                out += f"    {fmtByte(romRead(1))}, // Breakable block direction\n"
                out += f"    {fmtByte(romRead(1))}, // Breakable block Y bound extension\n"
            out += "};\n"
            if rom.tell() not in pointers:
                out += f"Unused pointer after s{areaNames[metadata[0]]}_{room}_Scrolls: {rom.tell():x}\n"

        if group == "TileGraphics":
            out += f"const u8 sTileset_{metadata[0]}_Gfx[] = INCBIN_U8(\"data/tilesets/{metadata[0]}.gfx.lz\"); ALIGN2();\n"
            (decompressed, size) = decomp_lz77(rom, pointer)
            size = (size + 3) // 4 * 4 # align
            if pointer + size not in pointers:
                out += f"Unused pointer after sTileset_{metadata[0]}_Gfx: {pointer + size:x}\n"

        if group == "Palette":
            out += f"const u16 sTileset_{metadata[0]}_Pal[14 * 16] = INCBIN_U16(\"data/tilesets/{metadata[0]}.pal\");\n"

        if group == "BackgroundGraphics":
            out += f"const u8 sTileset_{metadata[0]}_Bg_Gfx[] = INCBIN_U8(\"data/tilesets/{metadata[0]}_Bg.gfx.lz\"); ALIGN2();\n"
            (decompressed, size) = decomp_lz77(rom, pointer)
            size = (size + 3) // 4 * 4 # align
            if pointer + size not in pointers:
                out += f"Unused pointer after sTileset_{metadata[0]}_Bg_Gfx: {pointer + size:x}\n"

        if group == "Tilemap":
            out += f"const u16 sTileset_{metadata[0]}_Tilemap[0x{(nextPointer-pointer)//2:x}] = INCBIN_U16(\"data/tilesets/{metadata[0]}.tm\");\n"

        if group == "AnimatedPalette":
            out += f"const u16 sAnimatedPal_{metadata[0]}[{metadata[1]} * 16] = INCBIN_U16(\"data/tilesets/animated_palettes/{metadata[0]}.pal\");\n"

    return out

rom = open("../mf_us_baserom.gba", "rb")
out = open("out.txt", "w")
pointers = getPointers()
out.write(extractTilesets(pointers))
rom.close()
out.close()
