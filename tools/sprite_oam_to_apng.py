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
def canvas_from_raw_data(tilemaps, DMA_writes):
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

    return canvas

def max_width(canvas):
    if canvas.keys():
        x_min = min([x for (x, y) in canvas.keys()])
        x_max = max([x for (x, y) in canvas.keys()]) + 1

        return max(abs(x_min), abs(x_max))
    else:
        return 0

def max_height(canvas):
    if canvas.keys():
        y_min = min([y for (x, y) in canvas.keys()])
        y_max = max([y for (x, y) in canvas.keys()]) + 1

        return max(abs(y_min), abs(y_max))
    else:
        return 0

def to_image(canvas, left, top, right, bottom):
    # Returns an image cropped by a bounding box
    image = Image.new("P", (right-left, bottom-top), 0)
    if canvas.keys():
        x_min = min([x for (x, y) in canvas.keys()])
        y_min = min([y for (x, y) in canvas.keys()])
        x_max = max([x for (x, y) in canvas.keys()]) + 1
        y_max = max([y for (x, y) in canvas.keys()]) + 1

        image = Image.new("P", (right-left, bottom-top), 0)

        pixels = image.load()

        for (i, j), value in canvas.items():
            pixels[(i-left, j-top)] = value

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

def exportAnimation(gfx, pal, pAnim, fileName):
    canvases = []
    durations = []
    width = 0
    height = 0

    romSeek(pAnim)
    while True:
        spritemapAddr = romRead(4)
        duration = romRead(4)
        if spritemapAddr < 0x8000000 or spritemapAddr >= 0xa000000 or duration == 0 or duration > 255:
            break
        durations.append(duration*17) # ceil(1000/60)
        currentAddr = rom.tell()
        romSeek(spritemapAddr)

        spritemap = []
        for i in range(romRead(2)):
            spritemap.append([romRead(2), romRead(2), romRead(2)])

        if len(spritemap) > 128:
            break

        romSeek(currentAddr)

        canvas = canvas_from_raw_data(spritemap, gfx)
        canvases.append(canvas)

        if max_width(canvas) > width:
            width = max_width(canvas)
        if max_height(canvas) > height:
            height = max_height(canvas)

    if len(canvases) == 0:
        return

    images = []
    for canvas in canvases:
        image = to_image(canvas, -width, -height, width, height)
        image.putpalette(pal, 'RGBA')
        images.append(image)

    images[0].save(fileName, save_all=True, n_frames=len(images), default_image=False, append_images=images[1:], duration=durations)
    
    return images[0]

labelsFile = open("./mf_us.map")
allAnimations = {}
lastpGfx = 0
lastpPal = 0

line = labelsFile.readline()
while line != '':
    line = line.splitlines()[0]
    if line.startswith("                0x08"):
        split = line.split()
        if len(split) == 2:
            if int(split[0], 16) < 0x082e926c: # sHornoadGfx
                line = labelsFile.readline()
                continue
            if int(split[0], 16) >= 0x083bdebc: # sXParasite_3bdebc
                break
            if split[1] == "sYakuzaMouthGlowingPal" or split[1] == "sBlueZoroGfx" or split[1] == "sBlueZoroPal":
                line = labelsFile.readline()
                continue
            if ("Oam" in split[1] or "FrameData" in split[1]) and "MultiOam" not in split[1]:
                if (lastpGfx, lastpPal) in allAnimations:
                    allAnimations[(lastpGfx, lastpPal)].append((int(split[0], 16), split[1]))
                else:
                    allAnimations[(lastpGfx, lastpPal)] = [(int(split[0], 16), split[1])]
            if "Gfx" in split[1]:
                lastpGfx = int(split[0], 16)
            if "Pal" in split[1]:
                lastpPal = int(split[0], 16)
    line = labelsFile.readline()

labelsFile.close()

rom = open("../mf_us_baserom.gba", 'rb')

if not os.access("tools/animations", os.W_OK):
    os.mkdir("tools/animations")

for ((pGfx, pPal), pAnims) in allAnimations.items():
    for (pAnim, name) in pAnims:
        if os.access(f'tools/animations/{name}.png', os.F_OK):
            continue

        romSeek(pPal)
        palette555 = [romRead(2) for i in range(8*16)]

        paletteRgba = [0]*(4*256)
        for i in range(8*16):
            paletteRgba[(i+0x80)*4] = (palette555[i] & 0x1F) << 3
            paletteRgba[(i+0x80)*4+1] = (palette555[i] >> 5 & 0x1F) << 3
            paletteRgba[(i+0x80)*4+2] = (palette555[i] >> 10 & 0x1F) << 3
            paletteRgba[(i+0x80)*4+3] = 255

        gfx = [[0]*0x20]*0x200
        romSeek(pGfx)
        for i in range(0x40*8):
            gfx.append([romRead() for j in range(0x20)])

        exportAnimation(gfx, paletteRgba, pAnim, f'tools/animations/{name}.png')

