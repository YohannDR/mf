from array import array
from io import BufferedReader
import os
import shutil

DATA_PATH = "audio/"
subDirs: array = [
    "samples",
    "tracks",
    "voice_groups"
]

try:
    for dir in subDirs:
        shutil.rmtree(DATA_PATH + dir, ignore_errors=False, onerror=None)
except:
    pass

# Create directories
for dir in subDirs:
    os.mkdir(DATA_PATH + dir)

file: BufferedReader = open("mf_us_baserom.gba", "rb")

def ReadPtr(f: BufferedReader) -> int:
    value: int = int.from_bytes(f.read(4), "little")
    return value - 0x8000000

voiceGroupsAddr = [
    0xa5710, #perc, also used in track 1 as a voice group
    0xa59e0,
    0xa5a28, #perc
    0xa5b3c,
    0xa5bc0, #gap
    0xa5bd8,
    0xa5c8c, #gap
    0xa5ca4,
    0xa5cf8,
    0xa5d94,
    0xa5e30, #gap
    0xa5e3c,
    0xa5f2c, #perc
    0xa5f68,
    0xa5fbc,
    0xa6064, #perc
    0xa6094,
    0xa61d8, #perc
    0xa61fc,
    0xa62ec, #gap
    0xa62f8,
    0xa64c0,
    0xa6544,
    0xa6628,
    0xa6718,
    0xa6808, #gap
    0xa682c,
    0xa6af0,
    0xa6d54,
    0xa71ec,
    0xa74c8,
    0xa7654,
    0xa7750,
    0xa7798,
    0xa7aa4,
    0xa7c0c, #gap
    0xa7d14,
    0xa7e10,
    0xa7f24,
    0xa8008,
    0xa8080, #gap
    0xa808c,
    0xa81d0, #gap
    0xa81e8,
    0xa826c,
    0xa82f0,
    0xa838c,
    0xa8404, #perc
    0xa8554,
    0xa8af4,
    0xa8c44  #terminator
]

gaps = [
    0xa5bc0,
    0xa5c8c,
    0xa5e30,
    0xa62ec,
    0xa6808,
    0xa7c0c,
    0xa8080,
    0xa81d0
]

percVoiceGroups = {
    0xa5560: 0xa5710,
    0xa57b8: 0xa5a28,
    0xa5c5c: 0xa5f2c,
    0xa5eb4: 0xa6064,
    0xa5f08: 0xa61d8,
    0xa81c4: 0xa8404
}

percVoiceGroupsBack = {
    0xa5710: 0xa5560,
    0xa5a28: 0xa57b8,
    0xa5f2c: 0xa5c5c,
    0xa6064: 0xa5eb4,
    0xa61d8: 0xa5f08,
    0xa8404: 0xa81c4
}

prog_waveforms = {
    0xa8c8c: "sine",
    0xa8c9c: "triangle",
    0xa8cac: "sawtooth",
    0xa8cbc: "square",
    0xa8ccc: "half_sine"
}

extractedSamples = {}
global voiceGroupsAddrAndCount
voiceGroupsAddrAndCount = {}
global maxVoiceNum
maxVoiceNum = 0

def GetVoiceGroupName(x: int):
    if voiceGroupsAddr[x] in percVoiceGroupsBack:
        name: str = "perc_" + str(x)
    elif voiceGroupsAddr[x] in gaps:
        name: str = "voice_group_gap_" + str(x)
    else:
        name: str = "voice_group_" + str(x)
    return name

def ExtractVoiceGroups(f: BufferedReader):
    global percSet
    
    for x in range(0, len(voiceGroupsAddr)-1):
        addr = voiceGroupsAddr[x]
        f.seek(addr)

        name: str = GetVoiceGroupName(x)

        output = open("audio/voice_groups/" + name + ".s", "w")
        content = ".align 2\n\n.section .rodata\n.global " + name + "\n\n" + name + ":\n"

        for y in range(0, (voiceGroupsAddr[x+1]-addr)//12):
            instrType: int = int.from_bytes(f.read(1), "little")
            note: int = int.from_bytes(f.read(1), "little") # only used in percussion instruments
            unk_2: int = int.from_bytes(f.read(1), "little")
            unk_3: int = int.from_bytes(f.read(1), "little")
            content += "\t.byte " + str(instrType) + ", " + notesTieEot[note] + ", " + str(unk_2) + ", " + str(unk_3) + " @ " + str(y)
            if voiceGroupsAddr[x] in percVoiceGroupsBack:
                content += " " + notesTieEot[(voiceGroupsAddr[x]-percVoiceGroupsBack[voiceGroupsAddr[x]])//12+y]
            content += "\n\t"
            
            if instrType == 0x40: # there's only one key split table in the game
                first_subinstr: int = ReadPtr(f)
                table: int = ReadPtr(f)
                content += ".word " + GetVoiceGroupName(voiceGroupsAddr.index(first_subinstr)) + "\n\t"
                content += ".word key_split_tbl_0-36\n\n"
            else:
                sample: int = ReadPtr(f)
                attack: int = int.from_bytes(f.read(1), "little")
                decay: int = int.from_bytes(f.read(1), "little")
                sustain: int = int.from_bytes(f.read(1), "little")
                release: int = int.from_bytes(f.read(1), "little")
                
                if sample < 0:
                    content += ".word " + str(sample + 0x8000000) + "\n\t"
                elif instrType == 0x80:
                    content += ".word perc_" + str(voiceGroupsAddr.index(percVoiceGroups[sample])) + "-" + str((percVoiceGroups[sample]-sample)) + "\n\t"
                elif instrType == 3 or instrType == 0xb:
                    content += ".word prog_waveform_" + prog_waveforms[sample] + "\n\t"
                else:
                    content += ".word sample_" + str(extractedSamples[sample]) + "\n\t"
                content += ".byte " + str(attack) + ", " + str(decay) + ", " + str(sustain) + ", " + str(release) + "\n\n"

        output.write(content)
        output.close()

    output = open("audio/voice_groups.s", "w")
    content = ".include \"audio/m_play_def.s\"\n\n.section .rodata\n\n"
    for x in range(0, len(voiceGroupsAddr)-1):
        content += ".include \"audio/voice_groups/" + GetVoiceGroupName(x) + ".s\"\n"
    output.write(content)
    output.close()

def ExtractSample(f: BufferedReader, addr: int, instrType: int):
    global sampleNum
    if addr <= 0:
        return
    
    if addr in extractedSamples:
        return

    if not (instrType == 0 or instrType == 8):
        return
    
    f.seek(addr)

    name: str = "sample_" + str(sampleNum)

    extractedSamples[addr] = sampleNum
    sampleNum += 1

    output = open("audio/samples/" + name + ".s", "w")

    content = ".align 2\n\n.section .rodata\n.global " + name + "\n\n" + name + ":\n"
        
    content += f"\t.byte {int.from_bytes(f.read(1), "little")}\n"
    content += f"\t.byte {int.from_bytes(f.read(1), "little")}\n"
    content += f"\t.byte {int.from_bytes(f.read(1), "little")}\n"
    content += f"\t.byte {int.from_bytes(f.read(1), "little")}\n" # loop flag
    frequency: int = int.from_bytes(f.read(4), "little")
    content += f"\t.word {frequency} @ {frequency//1024}\n" # frequency
    content += f"\t.word {int.from_bytes(f.read(4), "little")}\n" # loop start
    size: int = int.from_bytes(f.read(4), "little")
    content += f"\t.word {size}\n"

    data: bytearray = bytearray(f.read(size))

    size8: int = size // 8

    for x in range(0, size8):
        content += "\t.byte " + ", ".join(str(data[x * 8 + i]) for i in range(8)) + "\n"

    content += "\t.byte "

    remaining: int = size % 8
    content += ", ".join(str(data[size8 * 8 + x]) for x in range(remaining))

    content += "\n\n.align 2\n"
    output.write(content)
    output.close()

def ExtractSamples(f: BufferedReader):
    global sampleNum
    sampleNum = 0
    addr: int = 0xa5710

    f.seek(addr)

    for x in range(0, (0xa8c8c-0xa5710)//12):
        instrType = int.from_bytes(f.read(1), "little")
        f.read(3)

        currAddr: int = f.tell()
        ExtractSample(f, ReadPtr(f), instrType)

        f.seek(currAddr + 4)
        f.read(4)

    output = open("audio/samples.s", "w")
    content = ".section .rodata\n\n"
    for (addr, x) in sorted(extractedSamples.items()):
        content += ".include \"audio/samples/sample_" + str(x) + ".s\" @ " + hex(addr) + "\n"
    output.write(content)
    output.close()

waitCommand = [
    "W00",
    "W01",
    "W02",
    "W03",
    "W04",
    "W05",
    "W06",
    "W07",
    "W08",
    "W09",
    "W10",
    "W11",
    "W12",
    "W13",
    "W14",
    "W15",
    "W16",
    "W17",
    "W18",
    "W19",
    "W20",
    "W21",
    "W22",
    "W23",
    "W24",
    "W28",
    "W30",
    "W32",
    "W36",
    "W40",
    "W42",
    "W44",
    "W48",
    "W52",
    "W54",
    "W56",
    "W60",
    "W64",
    "W66",
    "W68",
    "W72",
    "W76",
    "W78",
    "W80",
    "W84",
    "W88",
    "W90",
    "W92",
    "W96",
]

codeCommands = [
    "FINE", # 0xb1
    "GOTO", # 0xb2
    "PATT", # 0xb3
    "PEND", # 0xb4
    "REPT", # 0xb5
    "0xB6", # 0xb6
    "0xB7", # 0xb7
    "0xB8", # 0xb8
    "MEMACC", # 0xb9
    "PRIO", # 0xba
    "TEMPO", # 0xbb
    "KEYSH", # 0xbc
    "VOICE", # 0xbd
    "VOL", # 0xbe
    "PAN", # 0xbf
    "BEND", # 0xc0
    "BENDR", # 0xc1
    "LFOS", # 0xc2
    "LFODL", # 0xc3
    "MOD", # 0xc4
    "MODT", # 0xc5
    "0xc6", # 0xc6
    "0xc7", # 0xc7
    "TUNE", # 0xc8
    "0xc9", # 0xc9
    "0xca", # 0xca
    "0xcb", # 0xcb
    "0xcc", # 0xcc
    "XCMD", # 0xcd
    "EOT", # 0xce
]

repeatableCommands = [
    "VOICE", # 0xbd
    "VOL", # 0xbe
    "PAN", # 0xbf
    "BEND", # 0xc0
    "BENDR", # 0xc1
    "LFOS", # 0xc2
    "MOD", # 0xc4
    "TUNE", # 0xc8
    "XCMD", # 0xcd
    "EOT", # 0xce
]

PARAM_TYPE_NONE = 0
PARAM_TYPE_BYTE = 1
PARAM_TYPE_C_V = 2
PARAM_TYPE_MEM = 3
PARAM_TYPE_MODT = 4
PARAM_TYPE_XCMD = 5
PARAM_TYPE_EOT = 6
PARAM_TYPE_PTR = 7
codeCommandsParamType = [
    PARAM_TYPE_NONE, # FINE
    PARAM_TYPE_PTR, # GOTO
    PARAM_TYPE_PTR, # PATT
    PARAM_TYPE_NONE, # PEND
    PARAM_TYPE_PTR, # REPT
    PARAM_TYPE_NONE, # 0xB6
    PARAM_TYPE_NONE, # 0xB7
    PARAM_TYPE_NONE, # 0xB8
    PARAM_TYPE_MEM, # MEMACC
    PARAM_TYPE_BYTE, # PRIO
    PARAM_TYPE_BYTE, # TEMPO
    PARAM_TYPE_BYTE, # KEYSH
    PARAM_TYPE_BYTE, # VOICE
    PARAM_TYPE_BYTE, # VOL
    PARAM_TYPE_C_V, # PAN
    PARAM_TYPE_C_V, # BEND
    PARAM_TYPE_BYTE, # BENDR
    PARAM_TYPE_BYTE, # LFOS
    PARAM_TYPE_BYTE, # LFODL
    PARAM_TYPE_BYTE, # MOD
    PARAM_TYPE_MODT, # MODT
    PARAM_TYPE_NONE, # 0xc6
    PARAM_TYPE_NONE, # 0xc7
    PARAM_TYPE_C_V, # TUNE
    PARAM_TYPE_NONE, # 0xc9
    PARAM_TYPE_NONE, # 0xca
    PARAM_TYPE_NONE, # 0xcb
    PARAM_TYPE_NONE, # 0xcc
    PARAM_TYPE_XCMD, # XCMD
    PARAM_TYPE_EOT, # EOT
]

memParams = [
    "mem_set",
    "mem_add",
    "mem_sub",
    "mem_mem_set",
    "mem_mem_add",
    "mem_mem_sub",
    "mem_beq",
    "mem_bne",
    "mem_bhi",
    "mem_bhs",
    "mem_bls",
    "mem_blo",
    "mem_mem_beq",
    "mem_mem_bne",
    "mem_mem_bhi",
    "mem_mem_bhs",
    "mem_mem_bls",
    "mem_mem_blo",
]

modtParams = [
    "mod_vib",
    "mod_tre",
    "mod_pan",
]

notesTieEot = [
    "CnM2",
    "CsM2",
    "DnM2",
    "DsM2",
    "EnM2",
    "FnM2",
    "FsM2",
    "GnM2",
    "GsM2",
    "AnM2",
    "AsM2",
    "BnM2",
    "CnM1",
    "CsM1",
    "DnM1",
    "DsM1",
    "EnM1",
    "FnM1",
    "FsM1",
    "GnM1",
    "GsM1",
    "AnM1",
    "AsM1",
    "BnM1",
    "Cn0",
    "Cs0",
    "Dn0",
    "Ds0",
    "En0",
    "Fn0",
    "Fs0",
    "Gn0",
    "Gs0",
    "An0",
    "As0",
    "Bn0",
    "Cn1",
    "Cs1",
    "Dn1",
    "Ds1",
    "En1",
    "Fn1",
    "Fs1",
    "Gn1",
    "Gs1",
    "An1",
    "As1",
    "Bn1",
    "Cn2",
    "Cs2",
    "Dn2",
    "Ds2",
    "En2",
    "Fn2",
    "Fs2",
    "Gn2",
    "Gs2",
    "An2",
    "As2",
    "Bn2",
    "Cn3",
    "Cs3",
    "Dn3",
    "Ds3",
    "En3",
    "Fn3",
    "Fs3",
    "Gn3",
    "Gs3",
    "An3",
    "As3",
    "Bn3",
    "Cn4",
    "Cs4",
    "Dn4",
    "Ds4",
    "En4",
    "Fn4",
    "Fs4",
    "Gn4",
    "Gs4",
    "An4",
    "As4",
    "Bn4",
    "Cn5",
    "Cs5",
    "Dn5",
    "Ds5",
    "En5",
    "Fn5",
    "Fs5",
    "Gn5",
    "Gs5",
    "An5",
    "As5",
    "Bn5",
    "Cn6",
    "Cs6",
    "Dn6",
    "Ds6",
    "En6",
    "Fn6",
    "Fs6",
    "Gn6",
    "Gs6",
    "An6",
    "As6",
    "Bn6",
    "Cn7",
    "Cs7",
    "Dn7",
    "Ds7",
    "En7",
    "Fn7",
    "Fs7",
    "Gn7",
    "Gs7",
    "An7",
    "As7",
    "Bn7",
    "Cn8",
    "Cs8",
    "Dn8",
    "Ds8",
    "En8",
    "Fn8",
    "Fs8",
    "Gn8",
]

notes = [
    "TIE",
    "N01",
    "N02",
    "N03",
    "N04",
    "N05",
    "N06",
    "N07",
    "N08",
    "N09",
    "N10",
    "N11",
    "N12",
    "N13",
    "N14",
    "N15",
    "N16",
    "N17",
    "N18",
    "N19",
    "N20",
    "N21",
    "N22",
    "N23",
    "N24",
    "N28",
    "N30",
    "N32",
    "N36",
    "N40",
    "N42",
    "N44",
    "N48",
    "N52",
    "N54",
    "N56",
    "N60",
    "N64",
    "N66",
    "N68",
    "N72",
    "N76",
    "N78",
    "N80",
    "N84",
    "N88",
    "N90",
    "N92",
    "N96",
]

def ExtractCommandParam(f: BufferedReader, val: int, name: str) -> str:
    global maxVoiceNum
    type = codeCommandsParamType[val]
    if type == PARAM_TYPE_NONE:
        return ""
    
    if type == PARAM_TYPE_BYTE:
        value: int = int.from_bytes(f.read(1), "little")
        if codeCommands[val] == "VOICE" and value > maxVoiceNum:
            maxVoiceNum = value
        return ", " + str(value)

    if type == PARAM_TYPE_C_V:
        value: int = int.from_bytes(f.read(1), "little")
        result = ", c_v"
        if value == 0x40:
            return result
        
        if value > 0x40:
            return result + "+" + str(value - 0x40)
        
        if value < 0x40:
            return result + "-" + str(0x40 - value)

    if type == PARAM_TYPE_MEM:
        value: int = int.from_bytes(f.read(1), "little")
        return ", " + memParams[value]

    if type == PARAM_TYPE_MODT:
        value: int = int.from_bytes(f.read(1), "little")
        if value < 3:
            return ", " + modtParams[value]
        else:
            return ", " + str(value) # can't extract sector 1 without doing this

    if type == PARAM_TYPE_XCMD:
        value: int = int.from_bytes(f.read(1), "little")

        if value == 8:
            result = ", xIECV"
        elif value == 9:
            result = ", xIECL"
        else:
            raise Exception("Invalid XCMD")

        value = int.from_bytes(f.read(1), "little")
        return result + ", " + str(value)

    if type == PARAM_TYPE_EOT:
        value: int = int.from_bytes(f.read(1), "little")

        if value <= 127:
            return ", " + notesTieEot[value]
        else:
            f.seek(f.tell() - 1)
            return ""

    if type == PARAM_TYPE_PTR:
        ptr = ReadPtr(f)

        return "\n\t\t.word " + name + hex(ptr).split("0x")[1]


def ExtractTrackCommands(f: BufferedReader, addr: int, trackNbr: int):
    global maxVoiceNum
    f.seek(addr)
    value: int = int.from_bytes(f.read(1), "little")
    name = "track_" + str(trackNbr) + "_lbl_"
    result = ""
    lastRepeatableCommand = 0

    while value != 0xB1:
        if value == 0xB6:
            value: int = int.from_bytes(f.read(1), "little")
            result += "\t.byte 0xB6"
            break

        if value >= 0x80 and value <= 0xb0:
            # Wait command
            value -= 0x80
            result += "\t.byte " + waitCommand[value]
        elif value >= 0xb1 and value <= 0xce and value != 0xb6:
            # Code command
            if codeCommands[value - 0xb1] in repeatableCommands:
                lastRepeatableCommand = value
            value -= 0xb1
            result += "\t.byte " + codeCommands[value]

            ret = ExtractCommandParam(f, value, name)

            if codeCommandsParamType[value] == PARAM_TYPE_PTR:
                ptr = int(ret.split("lbl_")[1], 16)
                result = result.replace(hex(ptr), hex(ptr).replace("0x", ""))

            result += ret

        elif value >= 0xcf:
            # Note command
            lastRepeatableCommand = value
            result += "\t.byte " + notes[value - 0xcf]
            value: int = int.from_bytes(f.read(1), "little")

            if value < 0x80:
                result += ", " + notesTieEot[value]
                value: int = int.from_bytes(f.read(1), "little")

                if value < 0x80:
                    result += f", v{value:03}"
                    value: int = int.from_bytes(f.read(1), "little")
                        
                    if value < 0x80:
                        result += ", " + str(value)
                    else:
                        f.seek(f.tell() - 1)
                else:
                    f.seek(f.tell() - 1)
            else:
                f.seek(f.tell() - 1)
        elif value < 0x80:
            # Repeat last command
            if lastRepeatableCommand <= 0xce:
                result += "\t.byte "
                f.seek(f.tell() - 1)
                ret = ExtractCommandParam(f, lastRepeatableCommand - 0xb1, "repeat")
                if ret == None:
                    print(hex(lastRepeatableCommand))

                if ret != "":
                    ret = ret[2:]
                result += ret
            else:
                result += "\t.byte " + notesTieEot[value]
                value: int = int.from_bytes(f.read(1), "little")

                if value < 0x80:
                    result += f", v{value:03}"
                    value: int = int.from_bytes(f.read(1), "little")
                        
                    if value < 0x80:
                        result += ", " + str(value)
                    else:
                        f.seek(f.tell() - 1)
                else:
                    f.seek(f.tell() - 1)

        result += "\n" + name + hex(f.tell()) + ":\n"
        value = int.from_bytes(f.read(1), "little")

    splitted = result.split("\n")
    result = ""
    for x in splitted:
        if x.find("0x") == -1:
            result += x + "\n"

    if value == 0xB1:
        result += "\t.byte FINE"
    else:
        result += "\t.byte 0xB6"

    result += "\n\n"
    return result

def ExtractSoundHeader(f: BufferedReader, addr: int, number: int):
    global maxVoiceNum
    f.seek(addr)

    name: str = "track_" + str(number)
    filePath: str = "audio/tracks/" + name + ".s"

    if os.path.exists(filePath):
        os.remove(filePath)

    output = open(filePath, "w")
    content = '.align 2\n\n.global ' + name + '\n\n'

    nbrTracks: int = int.from_bytes(f.read(1), "little")
    unk_1: int = int.from_bytes(f.read(1), "little")
    priority: int = int.from_bytes(f.read(1), "little")
    echoFeedBack: int = int.from_bytes(f.read(1), "little")
    voice: int = ReadPtr(f)
    maxVoiceNum = 0

    for x in range(0, nbrTracks):
        prevAddr: int = f.tell()
        ptr: int = ReadPtr(f)

        content += name + "_" + str(x) + ":\n"

        content += ExtractTrackCommands(f, ptr, number)

        f.seek(prevAddr + 4)

    if voice in voiceGroupsAddrAndCount:
        if maxVoiceNum+1 > voiceGroupsAddrAndCount[voice]:
            voiceGroupsAddrAndCount[voice] = maxVoiceNum+1
    else:
        voiceGroupsAddrAndCount[voice] = maxVoiceNum+1
    
    content += ".align 2\n\n"
    content += name + ":\n"
    content += "\t.byte " + str(nbrTracks)
    content += "\n\t.byte " + str(unk_1)
    content += "\n\t.byte " + str(priority)
    content += "\n\t.byte " + str(echoFeedBack)
    content += "\n\t.word " + GetVoiceGroupName(voiceGroupsAddr.index(voice))

    for x in range(0, nbrTracks):
        content += "\n\t.word " + name + "_" + str(x)

    content += "\n\n.align 2\n"

    output.write(content)
    output.close()

existingHeaders = {}

def ExtractTracks(f: BufferedReader):
    addr: int = 0xa8d3c
    file.seek(addr)
    
    output = open("audio/sound_entries.s", "w")
    content = ".align 2\n\n.section .rodata\n.global sSoundDataEntries\n\nsSoundDataEntries:\n"

    for x in range(0, 745):
        currAddr: int = f.tell()

        addr: int = ReadPtr(f)

        if addr == 0xaa484:
            content += "\t.word null_track"
        else:
            content += "\t.word track_" + str(x)
            ExtractSoundHeader(f, addr, x)
            existingHeaders[addr] = x

        f.seek(currAddr + 4)
        
        content += "\n\t.short " + str(int.from_bytes(f.read(2), "little"))
        content += ", " + str(int.from_bytes(f.read(2), "little")) + "\n\n"

    content += "\n"
    output.write(content)
    output.close()

    output = open("audio/tracks.s", "w")
    content = ".include \"audio/m_play_def.s\"\n\n.section .rodata\n\n"
    for (addr, x) in sorted(existingHeaders.items()):
        content += ".include \"audio/tracks/track_" + str(x) + ".s\" @ " + hex(addr) + "\n"
    output.write(content)
    output.close()

def Func():
    ExtractSamples(file)
    ExtractVoiceGroups(file)
    ExtractTracks(file)

Func()
