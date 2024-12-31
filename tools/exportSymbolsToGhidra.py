# Use it with ImportSymbolsScript.py

import labels

labels = labels.extract_labels(string=True)
out = open("tools/ghidra_symbols.txt", "w")
for (addr, label) in labels.items():
    if label.startswith("unk_") or label == "memcpy" or label == "memset":
        out.write(f"{label} {addr} f\n")
    elif label[0].islower():
        out.write(f"{label} {addr} l\n")
    else:
        out.write(f"{label} {addr} f\n")
out.close()    
