#include "gba.h"
#include "macros.h"
#include "globals.h"

#include "data/hud_data.h"

#include "constants/event.h"
#include "constants/particle.h"

#include "structs/escape.h"
#include "structs/hud.h"
#include "structs/minimap.h"
#include "structs/particle.h"

/**
 * @brief Loads the common sprites graphics
 * 
 */
void HudGenericLoadCommonSpriteGfx(void) {
    DMA_SET(3, sCommonOamGfx, VRAM_OBJ + 0x800, C_32_2_16(DMA_ENABLE, sizeof(sCommonOamGfx) / 2))
}

/**
 * @brief Resets the HUD data and the particles
 * 
 */
void HudGenericResetHUDData(void) {
    s32 i;
    u8* tmp;

    if (gUnk_03000be3 != 0) {
        if (gPauseScreenFlag == 0) {
            for (i = 0; i < MAX_AMOUNT_OF_PARTICLES; i++) {
                if (gParticleEffects[i].effect < PE_CHARGING_BEAM)
                    gParticleEffects[i].status = 0;
                else if (gParticleEffects[i].effect == PE_ESCAPE && EventCheckOn_Escape() == ESCAPE_NONE)
                    gParticleEffects[i].status = 0;
            }
        }
    } else {
        for (i = 0; i < MAX_AMOUNT_OF_PARTICLES; i++)
            gParticleEffects[i].status = 0;
        tmp = &gPowerBombHighlightStatus; // Needed to produce matching ASM.
        CREATE_ENERGY_DIGITS(gEnergyDigits, 9999);
        CREATE_ENERGY_DIGITS(gMaxEnergyDigits, 9999);
        CREATE_AMMO_DIGITS(gMissileDigits, 999);
        CREATE_AMMO_DIGITS(gPowerBombDigits, 999);
        gMissileHighlightStatus = FALSE;
        gPowerBombHighlightStatus = FALSE;
        gMinimapUpdateFlag = 3;
        gEscapeStatus = ESCAPE_STATUS_NONE;
    }
}
