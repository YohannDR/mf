#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "data/hud_data.h"

#include "constants/particle.h"

void LoadCommonGraphics(void) {
    DMA_SET(3, sCommonOamGfx, VRAM_OBJ + 0x800, C_32_2_16(DMA_ENABLE, sizeof(sCommonOamGfx) / 2))
}
