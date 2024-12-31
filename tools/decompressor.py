MIN_MATCH_SIZE = 3
MAX_MATCH_SIZE = 18
MAX_WINDOW_SIZE = 0x1000

# Modified from https://github.com/biosp4rk/mf-zm-info/blob/main/tools/compress.py
def decomp_rle(rom, addr: int) -> (bytes, int):
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
                amount = int.from_bytes(rom.read(2), "big")
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


def decomp_lz77(rom, addr: int) -> (bytes, int):
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
                # Round compressed size up to a multiple of 4
                rom.seek((rom.tell() + 3) // 4 * 4)
                comp_size = rom.tell() - addr
                return bytes(output), comp_size
            cflag <<= 1
