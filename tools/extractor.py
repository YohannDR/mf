from array import array
from io import BufferedReader
import shutil
import os

from decompressor import decomp_rle, decomp_lz77

DATA_PATH = "data/"
subDirs: array = [
    "sa_x",
    "samus",
    "samus/gfx",
    "sprites",
    "hud",
    "escape",
    "rooms",
    "tilesets",
    "tilesets/animated_palettes",
    "projectiles",
    "menus",
    "menus/title_screen",
    "sa_x_close_up"
]

if __name__ == "__main__":
    try:
        shutil.rmtree(DATA_PATH, ignore_errors=False, onerror=None)
    except:
        pass

    # Create directories
    os.mkdir(DATA_PATH)
    for dir in subDirs:
        os.mkdir(DATA_PATH.__add__(dir))

    rom: BufferedReader = open("mf_us_baserom.gba", "rb")
    db: BufferedReader = open("database.txt", "r")

    line: str = db.readline()
    blobSize: int = 0
    while line != '':
        # Formatted as follows : name;length;address;size or name;start;end
        # The symbol # can be used as the first character of a line to make the extractor ignore it
        if line[0] != '\n' and line[0] != '#':
            info: array = line.split(";")

            name: str = info[0]
            print("Extracting", name)
            if name.endswith(".rle"):
                (decompressed, size) = decomp_rle(rom, int(info[1], 16))

                output: BufferedReader = open(DATA_PATH.__add__(name), "ab")
                rom.seek(int(info[1], 16))
                output.write(rom.read(size))
                output.close()

                output: BufferedReader = open(DATA_PATH.__add__(name.removesuffix(".rle")), "ab")
                output.write(decompressed)
                output.close()
            elif name.endswith(".lz"):
                (decompressed, size) = decomp_lz77(rom, int(info[1], 16))

                output: BufferedReader = open(DATA_PATH.__add__(name), "ab")
                rom.seek(int(info[1], 16))
                output.write(rom.read(size))
                output.close()

                output: BufferedReader = open(DATA_PATH.__add__(name.removesuffix(".lz")), "ab")
                output.write(decompressed)
                output.close()
            elif len(info) == 3:
                rom.seek(int(info[1], 16))

                output: BufferedReader = open(DATA_PATH.__add__(name), "ab")
                output.write(rom.read(int(info[2], 16) - int(info[1], 16)))
                if info[0].startswith("Blob"):
                    blobSize += int(info[2], 16) - int(info[1], 16)

                output.close()
            else:
                rom.seek(int(info[2], 16))

                output: BufferedReader = open(DATA_PATH.__add__(name), "ab")
                output.write(rom.read(int(info[1]) * int(info[3])))
                if info[0].startswith("Blob"):
                    blobSize += int(info[1]) * int(info[3])

                output.close()
        line = db.readline()

    rom.close()

    print(f"\n0x{0x6f9d24 - blobSize:x}/0x6f9d24 bytes of data not in blobs ({int((0x6f9d24 - blobSize) / 0x6f9d24 * 10000) / 100}%, 0x{blobSize:x} left)")
