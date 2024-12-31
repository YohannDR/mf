import os

# libgcc isn't decompiled
dirs = [
    "src",
    "src/menus",
    "src/sprites_AI",
    "src/sram"
]

functionCount = 0
nonmatchingCount = 0

# Scan compiled files for functions
for directory in dirs:
    countInDir = 0
    nonmatchingInDir = 0

    for entry in os.scandir("build/" + directory):
        if entry.is_file() and entry.path.endswith(".s"):
            file = open(entry.path, "r")

            line = file.readline()
            while line != '':
                if line.startswith("\t.thumb_func"):
                    functionCount += 1
                    countInDir += 1
                line = file.readline()

            file.close()
    
    for entry in os.scandir(directory):
        if entry.is_file() and entry.path.endswith(".c"):
            file = open(entry.path, "r")

            line = file.readline()
            while line != '':
                if "decomp.me/scratch/" in line:
                    nonmatchingCount += 1
                    nonmatchingInDir += 1
                line = file.readline()

            file.close()

    print(f"Functions decompiled in {directory}: {countInDir - nonmatchingInDir}")
    print(f"Nonmatchings or fakematches in {directory}: {nonmatchingInDir}\n")

print(f"Functions decompiled in total: {functionCount - nonmatchingCount}")
print(f"Nonmatchings or fakematches in total: {nonmatchingCount}")
