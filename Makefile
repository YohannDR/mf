# Disable built-in rules
.SUFFIXES:

TARGET = mf_us.gba
BASEROM = mf_us_baserom.gba
SHA1FILE = mf.sha1
ELF = $(TARGET:.gba=.elf)
MAP = $(TARGET:.gba=.map)
DUMPS = $(BASEROM:.gba=.dump) $(TARGET:.gba=.dump)

# ROM header
GAME_TITLE = METROID4USA
GAME_CODE = AMTE
MAKER_CODE = 01
GAME_REVISION = 00

# Binaries
CPP = cpp
TOOLCHAIN ?= arm-none-eabi-
AS = $(TOOLCHAIN)as
LD = $(TOOLCHAIN)ld
OBJCOPY = $(TOOLCHAIN)objcopy
OBJDUMP = $(TOOLCHAIN)objdump

CC = tools/agbcc

DIFF = diff -u
HOSTCC = cc
MKDIR = mkdir -p
RM = rm -f
SHA1SUM = sha1sum
TAIL = tail

# Tools
GBAFIX = tools/gbafix/gbafix
PYTHON = python3
EXTRACTOR = tools/extractor.py
PREPROC = tools/preproc/preproc

# Flags
ASFLAGS = -mcpu=arm7tdmi
CFLAGS = -O2 -mthumb-interwork -fhex-asm
CPPFLAGS = -nostdinc -Iinclude/
NOMORENOPS = '.text\n\t.align 2, 0 @ dont insert nops\n'

# Objects
CSRC = $(wildcard src/**.c) $(wildcard src/**/**.c) $(wildcard src/**/**/**.c)
.PRECIOUS: $(CSRC:%.c=build/%.s)
ASMSRC = $(wildcard asm/**.s) $(wildcard asm/**/*.s) $(wildcard audio/*.s) $(wildcard audio/**/*.s) $(wildcard audio/**/**/*.s)
OBJ = $(CSRC:%.c=build/%.o)  $(ASMSRC:%.s=build/%.o) 

# Build subdirectories in build/
$(shell mkdir -p  $(sort $(dir $(OBJ))))

# Enable verbose output
ifeq ($(V),1)
	Q =
	MSG = @:
else
	Q = @
	MSG = @echo " "
endif

.PHONY: all
all: $(TARGET)

.PHONY: check
check: all
	$(MSG) SHA1SUM $(SHA1FILE)
	$Q$(SHA1SUM) -c $(SHA1FILE)

.PHONY: dump
dump: $(DUMPS)

.PHONY: diff
diff: $(DUMPS)
	$(MSG) DIFF $^
	$Q$(DIFF) $^

.PHONY: clean
clean:
	$(MSG) RM $(TARGET)
	$Q$(RM) $(TARGET) $(ELF) $(MAP)
	$(MSG) RM \*.dump
	$Q$(RM) $(DUMPS)
	$(MSG) RM build/
	$Q$(RM) -r build
	$(MSG) RM $(GBAFIX)
	$Q$(RM) $(GBAFIX)
	$(MSG) RM data/
	$Q$(RM) -r data	

.PHONY: help
help:
	@echo 'Targets:'
	@echo '  all: build the ROM'
	@echo '  check: checksum the ROM'
	@echo '  dump: dump the ROMs'
	@echo '  diff: compare the ROM with the original'
	@echo '  clean: remove the ROM and intermediate files'
	@echo '  help: show this message'
	@echo ''
	@echo 'Flags:'
	@echo '  V=1: enable verbose output'

$(TARGET): $(ELF) $(GBAFIX)
	$(MSG) OBJCOPY $@
	$Q$(OBJCOPY) --strip-debug -O binary --gap-fill 0xff --pad-to 0x08800000 $< $@
	$(MSG) GBAFIX $@
	$Q$(GBAFIX) $@ -t$(GAME_TITLE) -c$(GAME_CODE) -m$(MAKER_CODE) -r$(GAME_REVISION)

$(ELF) $(MAP): $(OBJ) linker.ld
	$(MSG) LD $@
	$Qcd build && $(LD) $(LDFLAGS) -n -T ../linker.ld -Map=../$(MAP) -o ../$@

%.dump: %.gba
	$(MSG) OBJDUMP $@
	$Q$(OBJDUMP) -D -bbinary -marm7tdmi -Mforce-thumb  $< | $(TAIL) -n+3 >$@
#--stop-address 0x8c71c
build/%.o: %.s
	$(MSG) AS $@
	$Q$(AS) $(ASFLAGS) $< -o $@

build/%.o: %.c
	$(MSG) CC build/$*.s
	$Q$(PREPROC) $< | $(CPP) $(CPPFLAGS) | $(CC) -o build/$*.s $(CFLAGS) && printf $(NOMORENOPS) >> build/$*.s
	$(MSG) AS $@
	$Q$(AS) $(ASFLAGS) build/$*.s -o $@

build/src/sram/%.o: CFLAGS = -O1 -mthumb-interwork -fhex-asm
build/src/sram/%.o: src/sram/%.c

build/src/libgcc/%.o: CFLAGS = -O2 -fhex-asm
build/src/libgcc/%.o: src/libgcc/%.c

build/src/data/%.o: NOMORENOPS = '\n\t.align 2, 0 @ dont insert nops\n'
build/src/data/%.o: CFLAGS =

tools/%: tools/%.c
	$(MSG) HOSTCC $@
	$Q$(HOSTCC) $< $(HOSTCFLAGS) $(HOSTCPPFLAGS) -o $@
