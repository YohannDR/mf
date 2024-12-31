import json
import os

dirs = [
    "asm/menus",
    "asm/sprites_AI",
    "asm/"
]

exclude = [
    "asm/audio_internal.s",
    "asm/crt0.s",
    "asm/intr_main.s",
    "asm/libgcc.s",
    "asm/romheader.s",
    "asm/syscalls.s"
]

entries = []
units = []
for directory in dirs:
    entries2 = []
    for entry in os.scandir(directory):
        if entry.is_file() and entry.path.endswith(".s") and entry.path not in exclude:
            entries2.append(entry.path)
    entries += sorted(entries2)
for entry in entries:
    units.append({
        "name": f"{entry[4:-2]}.o",
        "target_path": f"build/{entry[:-2]}.o",
        "base_path": f"build/src/{entry[4:-2]}.o"
    })

file = open("objdiff.json", "w")
json.dump({
  "build_base": True,
  "build_target": False,
  "watch_patterns": [
    "*.c"
  ],
  "units": units
}, file)
