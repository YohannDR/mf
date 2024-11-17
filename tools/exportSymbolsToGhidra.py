# Use it with ImportSymbolsScript.py

labelsFile = open("../mf_us.map")
labels = {}

line = labelsFile.readline()
while line != '':
    line = line.splitlines()[0]
    if line.startswith("                0x02") or line.startswith("                0x03"):
        split = line.split()
        if len(split) == 4:
            labels[split[0]] = split[1]
    if line.startswith("                0x08"):
        split = line.split()
        if len(split) == 2:
            labels[split[0]] = split[1]
    line = labelsFile.readline()

labelsFile.close()

out = open("ghidra_symbols.txt", "w")
for (addr, label) in labels.items():
    if label.startswith("unk_") or label == "memcpy" or label == "memset":
        out.write(f"{label} {addr} f\n")
    elif label[0].islower():
        out.write(f"{label} {addr} l\n")
    else:
        out.write(f"{label} {addr} f\n")
out.close()    
