#include "sprite_util.h"

#include "constants/sprite.h"

#include "structs/samus.h"

/**
 * @brief fd90 | 88 | Initializes a location text sprite
 * 
 */
void SpriteUtilInitLocationText(void)
{
    u8 gfxSlot;

    gfxSlot = CheckLoadAreaBanner();

    if (gfxSlot < 8)
    {
        gSpriteData[0].status = SPRITE_STATUS_EXISTS | SPRITE_STATUS_ON_SCREEN | SPRITE_STATUS_NOT_DRAWN |
            SPRITE_STATUS_UNKNOWN_10 | SPRITE_STATUS_IGNORE_PROJECTILES;

        gSpriteData[0].properties = SP_ABSOLUTE_POSITION;
        gSpriteData[0].spritesetGfxSlot = gfxSlot;
        gSpriteData[0].spriteId = PSPRITE_AREA_BANNER;

        gSpriteData[0].yPosition = gSamusData.yPosition;
        gSpriteData[0].xPosition = gSamusData.xPosition;
    
        gSpriteData[0].bgPriority = 0;
        gSpriteData[0].drawOrder = 1;
        gSpriteData[0].pose = 0;
        gSpriteData[0].health = 0;
        gSpriteData[0].invincibilityStunFlashTimer = 0;
        gSpriteData[0].work0 = 0;
        gSpriteData[0].paletteRow = 0;
        gSpriteData[0].frozenPaletteRowOffset = 0;

        gSpriteData[0].ignoreSamusCollisionTimer = 1;

        gSpriteData[0].primarySpriteRamSlot = 0;
        gSpriteData[0].spritesetSlotAndProperties = 0x10;

        gSpriteData[0].freezeTimer = 0;
        gSpriteData[0].work5 = 1;
    }
}
