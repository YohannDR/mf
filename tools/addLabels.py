import os
import labels

dirs = [
    "./asm/",
    "./asm/menus",
    "./asm/sprites_AI"
]

labels = labels.extract_labels(string=True)

for directory in dirs:
    for entry in os.scandir(directory):
        if entry.is_file() and entry.path.endswith(".s"):
            file = open(entry.path, "r")

            newlines = []
            changedALine = False
            line = file.readline()
            while line != '':
                line = line.splitlines()[0]
                pos = line.find("=0x02")
                if pos == -1:
                    pos = line.find("=0x03")
                if pos == -1:
                    pos = line.find("=0x08")
                if pos != -1:
                    addr = line[pos+1:pos+11]
                    if addr.lower() in labels:
                        line = line.replace(addr, labels[addr.lower()])
                        changedALine = True
                else:
                    pos = line.find(".4byte 0x02")
                    if pos == -1:
                        pos = line.find(".4byte 0x03")
                    if pos == -1:
                        pos = line.find(".4byte 0x08")
                    if pos != -1:
                        addr = line[pos+7:pos+17]
                        if addr.lower() in labels:
                            line = line.replace(addr, labels[addr.lower()])
                            changedALine = True
                newlines.append(line)
                line = file.readline()

            file.close()

            if changedALine:
                out = open(entry.path, "w")
                for line in newlines:
                    out.write(line + '\n')
                out.close()
