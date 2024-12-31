# Uses code from PJBoy's scripts for Super Metroid, modified for GBATroid: https://patrickjohnston.org/ASM/ROM%20data/Super%20Metroid/
# Also uses modified code from SpriteSomething: https://github.com/Artheau/SpriteSomething
# Also modified from H A M's Super Metroid OAM extractor: https://github.com/H-A-M-G-E-R/nspc-track-disassembler/blob/main/enemy%20spritemap%20extractor.py

from PIL import Image
import numpy as np
import os

gba2hex = lambda address: address & 0x1FFFFFF
hex2gba = lambda address: address & 0x1FFFFFF | 0x8000000

def romRead(n = 1, address = None):
    if address is not None:
        prevAddress = rom.tell()
        rom.seek(gba2hex(address))

    ret = int.from_bytes(rom.read(n), 'little')
    if address is not None:
        rom.seek(prevAddress)
        
    return ret

def romSeek(address):
    return rom.seek(gba2hex(address))

def romTell():
    return hex2gba(rom.tell())

tile_dimensions = [[(8,8),(16,16),(32,32),(64,64)],[(16,8),(32,8),(32,16),(64,32)],[(8,16),(8,32),(16,32),(32,64)]]

''' Modified From SpriteSomething (https://github.com/Artheau/SpriteSomething) '''
def image_from_raw_data(tilemaps, DMA_writes):
    # expects:
    #  a list of tilemaps in the 3 2-byte format: essentially [
    #                                                        Y position + shape,
    #                                                        X position + flip + size,
    #                                                        index + palette
    #                                                       ]
    #  a dictionary consisting of writes to the DMA and what should be there

    canvas = {}

    for tilemap in reversed(tilemaps):
        # tilemap[0] contains Y offset and shape
        y_offset = (tilemap[0] & 0x7F) - (tilemap[0] & 0x80)
        shape = tilemap[0] >> 0xE

        # tilemap[1] contains X offset, flip and size
        x_offset = (tilemap[1] & 0xFF) - (tilemap[1] & 0x100)
        v_flip = tilemap[1] & (1 << 0xD)
        h_flip = tilemap[1] & (1 << 0xC)
        size = tilemap[1] >> 0xE

        # tilemap[2] contains tile index and palette
        index = tilemap[2] & 0x3FF
        palette = tilemap[2] >> 0x8 & 0xF0

        # grab tile dimensions depending on shape and size
        width = tile_dimensions[shape][size][0]
        height = tile_dimensions[shape][size][1]

        def draw_tile_to_canvas(new_x_offset, new_y_offset, new_index):
            tile_to_write = convert_4bpp_tile_gba(DMA_writes[new_index], palette)
            if h_flip:
                tile_to_write = np.flipud(tile_to_write)
            if v_flip:
                tile_to_write = np.fliplr(tile_to_write)
            for (i, j), value in np.ndenumerate(tile_to_write):
                if value & 0xF != 0:  # if not transparent
                    canvas[(new_x_offset + i, new_y_offset + j)] = int(value)

        for x in range(width//8):
            for y in range(height//8):
                draw_tile_to_canvas(x_offset+abs(x*8-(width-8 if h_flip else 0)), y_offset+abs(y*8-(height-8 if v_flip else 0)), index+x+y*32)

    return to_image(canvas)


def to_image(canvas):
    # Returns an image centered at the midpoint
    if canvas.keys():
        x_min = min([x for (x, y) in canvas.keys()])
        y_min = min([y for (x, y) in canvas.keys()])
        x_max = max([x for (x, y) in canvas.keys()]) + 1
        y_max = max([y for (x, y) in canvas.keys()]) + 1

        width = max(abs(x_min), abs(x_max)) * 2
        height = max(abs(y_min), abs(y_max)) * 2

        image = Image.new("P", (width, height), 0)

        pixels = image.load()

        for (i, j), value in canvas.items():
            pixels[(i + width//2, j + height//2)] = value

    else:  # the canvas is empty
        image = Image.new("P", (2, 2), 0)

    return image


def convert_4bpp_tile_gba(raw_tile, palette):
    tile = np.zeros(64, dtype=np.uint8)

    for i in range(32):
        tile[i*2] = raw_tile[i] & 0xF | palette
        tile[i*2+1] = raw_tile[i] >> 4 | palette

    returnvalue = tile.reshape(8, 8)
    returnvalue = returnvalue.swapaxes(0, 1)
    return returnvalue

rom = open("../mf_us_baserom.gba", 'rb')

def Func():
    spriteIndex = int(input("Sprite ID in hex: "), 16)

    tilesAddr = romRead(4, romRead(4, 0xF878)+(spriteIndex-0x10)*4)
    rows = romRead(4, romRead(4, 0xF880)+(spriteIndex-0x10)*4)//0x800
    paletteAddr = romRead(4, romRead(4, 0xF884)+(spriteIndex-0x10)*4)
    spritemapAddr = paletteAddr+0x20*rows # doesn't work with a few sprites
    if spriteIndex == 0x51: # yakuza
        spritemapAddr += 0x100
    if spriteIndex == 0xBE or spriteIndex == 0x4D: # zozoro and ice beam X (omega)
        spritemapAddr -= 0x20

    romSeek(paletteAddr)
    palette555 = [romRead(2) for i in range(rows*16)]

    paletteRgba = [0]*(4*256)
    for i in range(rows*16):
        paletteRgba[(i+0x80)*4] = (palette555[i] & 0x1F) << 3
        paletteRgba[(i+0x80)*4+1] = (palette555[i] >> 5 & 0x1F) << 3
        paletteRgba[(i+0x80)*4+2] = (palette555[i] >> 10 & 0x1F) << 3
        paletteRgba[(i+0x80)*4+3] = 255

    tiles = [[0]*0x20]*0x400
    romSeek(tilesAddr)
    for i in range(0x40*rows):
        tiles[0x200+i] = [romRead() for j in range(0x20)] # in case of overflow

    romSeek(spritemapAddr)
    imageIndex = 0
    usedImages = set()
    if not os.access(f'0x{spriteIndex:x}', os.W_OK):
        os.mkdir(f'0x{spriteIndex:x}')
    while True:
        spritemap = []

        if spritemapAddr % 4 != 0:
            romRead(4 - (spritemapAddr % 4)) # align
        possibleOamAddr = romRead(4, romTell())
        if possibleOamAddr in usedImages: # start of animations
            if spriteIndex == 0x3A and romTell() == 0x83028F4: # arachnus
                spritemapAddr = 0x8302E3C
            else:
                break
        romSeek(spritemapAddr)
        usedImages |= {hex2gba(spritemapAddr)}

        for i in range(romRead(2)):
            spritemap.append([romRead(2), romRead(2), romRead(2)])

        if len(spritemap) > 128:
            break

        image = image_from_raw_data(spritemap, tiles)
        image.putpalette(paletteRgba, 'RGBA')
        image.save(f'0x{spriteIndex:x}/0x{spriteIndex:02x}_{imageIndex}_0x{gba2hex(spritemapAddr):x}.png')
        imageIndex += 1
        spritemapAddr = romTell()

    Func()

Func()
