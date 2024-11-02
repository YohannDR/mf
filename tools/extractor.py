from array import array
from io import BufferedReader
import shutil
import os

DATA_PATH = "data/"
subDirs: array = [
    "sa_x",
    "samus",
    "samus/gfx",
    "sprites",
    "hud",
    "escape",
    "menus",
    "menus/title_screen"
]

MIN_MATCH_SIZE = 3
MAX_MATCH_SIZE = 18
MAX_WINDOW_SIZE = 0x1000

# Modified from https://github.com/biosp4rk/mf-zm-info/blob/main/tools/compress.py
def decomp_rle(addr: int) -> (bytes, int):
    rom.seek(addr)
    passes = []
    half = None
    # for each pass
    for p in range(2):
        if p == 1:
            half = len(passes)
        num_bytes = int.from_bytes(rom.read(1), "little")
        while True:
            amount = None
            compare = None
            if num_bytes == 1:
                amount = int.from_bytes(rom.read(1), "little")
                compare = 0x80
            else:
                # num_bytes == 2
                amount = int.from_bytes(rom.read(1), "big")
                compare = 0x8000

            if amount == 0:
                break

            if (amount & compare) != 0:
                # compressed
                amount %= compare
                val = int.from_bytes(rom.read(1), "little")
                while amount > 0:
                    passes.append(val)
                    amount -= 1
            else:
                # uncompressed
                while amount > 0:
                    passes.append(int.from_bytes(rom.read(1), "little"))
                    amount -= 1
    
    # each pass must be equal length
    if len(passes) != half * 2:
        raise ValueError()
    
    # combine passes to get output
    out_list = bytearray()
    for i in range(half):
        out_list.append(passes[i])
        out_list.append(passes[half + i])
    
    # return bytes and compressed size
    comp_size = rom.tell() - addr
    return bytes(out_list), comp_size


def decomp_lz77(addr: int) -> (bytes, int):
    rom.seek(addr)
    # check for 0x10 flag
    if int.from_bytes(rom.read(1), "little") != 0x10:
        raise ValueError("Missing 0x10 flag")

    # get length of decompressed data
    remain = int.from_bytes(rom.read(3), "little")
    output = bytearray([0] * remain)

    # check for valid data size
    if remain < 32 or remain % 32 != 0:
        raise ValueError("Invalid data size")

    dst = 0

    # decompress
    while (True):
        cflag = int.from_bytes(rom.read(1), "little")

        for _ in range(8):
            if (cflag & 0x80) == 0:
                # uncompressed
                output[dst] = int.from_bytes(rom.read(1), "little")
                dst += 1
                remain -= 1
            else:
                # compressed
                val = int.from_bytes(rom.read(1), "little")
                amount_to_copy = (val >> 4) + MIN_MATCH_SIZE
                window = ((val & 0xF) << 8) + int.from_bytes(rom.read(1), "little") + 1
                remain -= amount_to_copy
                
                for _ in range(amount_to_copy):
                    output[dst] = output[dst - window]
                    dst += 1

            if remain <= 0:
                if remain < 0:
                    raise ValueError("Too many bytes copied at end")
                comp_size = rom.tell() - addr
                return bytes(output), comp_size
            cflag <<= 1


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
                (decompressed, size) = decomp_rle(int(info[1], 16))

                output: BufferedReader = open(DATA_PATH.__add__(name), "ab")
                rom.seek(int(info[1], 16))
                output.write(rom.read(size))
                output.close()

                output: BufferedReader = open(DATA_PATH.__add__(name.removesuffix(".rle")), "ab")
                output.write(decompressed)
                output.close()
            if name.endswith(".lz"):
                (decompressed, size) = decomp_lz77(int(info[1], 16))

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
