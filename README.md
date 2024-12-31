# Metroid - Fusion Decomp

This is a work in progress decompilation of Metroid - Fusion.

2200/3607 functions decompiled (63.82%, 1407 left)

0x473873/0x6f9d24 bytes of data not in blobs (63.8%, 0x2864b1 left)

Progress can be seen here : https://docs.google.com/spreadsheets/d/19pUPm1dp-7IY9iCeJJA412dwgD2f1M6A1QafzlRV8ic/edit#gid=0

**This decomp is not shiftable, don't use it as a base to work on anything**

This produces the following ROMs:

- mf_us.gba: `sha1: CA33F4348C2C05DD330D37B97E2C5A69531DFE87`

**Discords**: 
- https://discord.gg/2MGB9Xbr9y MAGret
- https://discord.gg/WtekHKb MAGConst

**biospark's GBATroid Data Maps:** https://labk.org/maps/

## Dependencies

- [agbcc](https://github.com/pret/agbcc)
- `binutils-arm-none-eabi`
- `mf_us_baserom.gba` (`sha1: CA33F4348C2C05DD330D37B97E2C5A69531DFE87`)
- `python3`
- `g++`

## Setup

- **WINDOWS ONLY** : Install and setup [WSL](https://docs.microsoft.com/en-us/windows/wsl/install)
- Install the dependencies (an `apt update` might be necessary for binutils)
- Build agbcc (run `./build.sh`)
- Copy agbcc to `tools/`
- Build preproc (run `make` in tools/preproc)

## Build

- Run `make clean` if necessary
- Run the `extractor.py` and `soundExtractor.py` scripts in tools (`python3 tools/extractor.py && python3 tools/soundExtractor.py`) if necessary
- Run `make` (using the -j option is recommended to speed up the process)
