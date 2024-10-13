from array import array
from io import BufferedReader
import shutil
import os

DATA_PATH = "data/"
subDirs: array = [
    "sprites",
    "hud",
    "escape",
    "menus",
    "menus/title_screen"
]

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
while line != '':
    # Formatted as follows : name;length;address;size or name;start;end
    # The symbol # can be used as the first character of a line to make the extractor ignore it
    if line[0] != '\n' and line[0] != '#':
        info: array = line.split(";")

        name: str = info[0]
        print("Extracting", name)
        if len(info) == 3:
            rom.seek(int(info[1], 16))

            output: BufferedReader = open(DATA_PATH.__add__(name), "ab")
            output.write(rom.read(int(info[2], 16) - int(info[1], 16)))

            output.close()
        else:
            rom.seek(int(info[2], 16))

            output: BufferedReader = open(DATA_PATH.__add__(name), "ab")
            output.write(rom.read(int(info[1]) * int(info[3])))

            output.close()
    line = db.readline()

rom.close()