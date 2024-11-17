#include "sprites_AI/serris.h"
#include "globals.h"
#include "gba.h"
#include "macros.h"

#include "data/generic_data.h"
#include "data/sprite_data.h"
#include "data/sprites/core_x.h"
#include "data/sprites/x_parasite.h"
#include "data/sprites/serris.h"

#include "constants/audio.h"
#include "constants/particle.h"
#include "constants/samus.h"
#include "constants/sprite.h"

#include "structs/clipdata.h"
#include "structs/samus.h"
#include "structs/sprite.h"

#define SERRIS_ROOM_WATER_Y (BLOCK_SIZE * 11)
#define SERRIS_ROOM_WIDTH (BLOCK_SIZE * 24)

/**
 * Boss work variables for serris :
 * 0 - Unused
 * 1 - Palette phase
 * 2 - Next movement pattern (pose)
 * 3 - Is next pattern flipped on the X axis
 * 4 - Time before emerging
 * 5 - Speedboosting timer
*/

/*
 * Serris has 4 movement patterns, below is each pattern described in a small text, followed by an ASCII representation of the pattern
 * Each pattern can be flipped on the X axis
 * ■ is a normal platform block, | is vertical movement, / and \ are turns, - is horizontal movement and ... is a transition into another representation
 * Transitions exist because some patterns pass through the same place multiple times, which makes them hard to represent
 * 
 * Zig zag pattern :
 * Serris emerges from the ground at an end of the room until it reaches the platforms
 * Then it rotates around each of them in a zig zag pattern until it reaches the other end of the room
 * Then it performs a large rotation that reaches the ceiling and ends between the last 2 platforms of the other end of room
 * 
 *     /...
 *    |           
 *    |      /---\       /---\
 *    | ■■■ | ■■■ | ■■■ | ■■■ |
 *     \---/       \---/      |
 *                            |
 * 
 *      ...----------\
 *                    \
 *                     \
 *      ■■■   ■■■   ■■■ | ■■■
 *                      |
 *                      |
 * 
 * 
 * Loop around pattern :
 * Serris emerges from the ground at an end of the room until it reaches the platforms
 * Then it travels horizontally above every platform until it reaches the other end of the room
 * Then it dives back down up to the bottom of the room, after which it slides on the floor until it reaches between the last 2 platforms
 * Then it travels back up to the platforms, slides horizontally across them until it reaches between the last 2 platforms and dives back down
 * 
 *     /---------------------\
 *    | ■■■   ■■■   ■■■   ■■■ |
 *    |                       |
 *     \----------...         |
 *
 *           /---------\
 *      ■■■ | ■■■   ■■■ | ■■■  
 *          |           |       
 *          |     ...--/
 * 
 * 
 * Middle arc pattern :
 * Serris emerges from the ground in the middle of the room until it reaches the platforms
 * Then it performs a large rotation up to one end of room, after which it dives back down
 * 
 *      /-------\
 *     /         \
 *    | ■■■   ■■■ | ■■■   ■■■
 *    |           |
 *    |           |
 * 
 * Edge arc pattern :
 * Serris emerges from between the last 2 platforms on one end of the room until it reaches the platforms
 * Then it performs a large rotation to the last 2 platforms on the other side of room, after which it dives back down
 * 
 *           /-------\
 *          /         \
 *    ■■■  | ■■■   ■■■ | ■■■
 *         |           |
 *         |           |
*/

/**
 * @brief 47464 | 88 | Updates the palette of serris based on its health
 * 
 */
void SerrisUpdatePalette(void)
{
    u8 updatePalette;
    u16 health;
    u16 maxHealth;
    const u16* pPal;

    updatePalette = FALSE;
    health = gCurrentSprite.health;
    maxHealth = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);

    switch (gBossWork1)
    {
        case 0:
            if (health <= maxHealth * 2 / 3)
            {
                pPal = sSerrisSecondPhasePal;
                gBossWork1 = 1;
                updatePalette = TRUE;
            }
            break;

        case 1:
            if (health <= maxHealth / 3)
            {
                pPal = sSerrisThirdPhasePal;
                gBossWork1 = 2;
                updatePalette = TRUE;
            }
    }

    if (updatePalette)
    {
        DMA_SET(3, pPal, PALRAM_OBJ + 0x100, C_32_2_16(DMA_ENABLE, 16 * 2));
    }
}

/**
 * @brief 474ec | a4 | Gets the current platform on which samus is on
 * 
 * @return u8 Platform id (from left to right)
 */
u8 SerrisGetCurrentSamusPlatform(void)
{
    u16 samusY;
    u16 samusX;
    u16 serrisY;
    u16 serrisX;

    samusY = gSamusData.yPosition;
    samusX = gSamusData.xPosition;

    serrisY = gSerrisSpawnYPosition;
    serrisX = gSerrisSpawnXPosition;

    if (samusY > serrisY - (SERRIS_ROOM_WATER_Y + BLOCK_SIZE) && samusY < serrisY - BLOCK_SIZE * 9)
    {
        if (samusX > serrisX - BLOCK_SIZE * 5 && samusX < serrisX - BLOCK_SIZE * 1)
            return 4;

        if (samusX > serrisX - BLOCK_SIZE * 11 && samusX < serrisX - BLOCK_SIZE * 7)
            return 3;

        if (samusX > serrisX - BLOCK_SIZE * 17 && samusX < serrisX - BLOCK_SIZE * 13)
            return 2;

        if (samusX > serrisX - BLOCK_SIZE * 23 && samusX < serrisX - BLOCK_SIZE * 19)
            return 1;
    }

    return 0;
}

/**
 * @brief 47590 | bc | Rotates the current sprite around a point given the parameters
 * 
 * @param centerY Rotation center Y
 * @param centerX Rotation center X
 * @param radius Rotation radius
 * @param rotation Rotation angle
 */
void SerrisRotateAroundPoint(s16 centerY, s16 centerX, s16 radius, s16 rotation)
{
    s32 s;
    s32 c;
    s16 offset;

    s = SIN(rotation);

    // Compute new Y position by doing centerY + radius * sin(rotation)
    if (s < 0)
    {
        s = -s;

        offset = Q_8_8_TO_SHORT_DIV(radius * s);

        gCurrentSprite.yPosition = centerY - offset;
    }
    else
    {
        offset = Q_8_8_TO_SHORT_DIV(radius * s);

        gCurrentSprite.yPosition = centerY + offset;
    }

    c = COS(rotation);

    // Compute new X position by doing  centerX + radius * cos(rotation)
    if (c < 0)
    {
        c = -c;

        offset = Q_8_8_TO_SHORT_DIV(radius * c);

        gCurrentSprite.xPosition = centerX - offset;
    }
    else
    {
        offset = Q_8_8_TO_SHORT_DIV(radius * c);

        gCurrentSprite.xPosition = centerX + offset;
    }
}

/**
 * @brief 4764c | 9c | Handles the rotation movement of 
 * 
 */
void SerrisHandleRotationMovement(void)
{
    u8 deltaRotation;

    // Get delta rotation based on the radius
    if (gCurrentSprite.work3 == 3)
        deltaRotation = Q_8_8(.005f);
    else if (gCurrentSprite.work3 == 2)
        deltaRotation = Q_8_8(.01f);
    else
        deltaRotation = Q_8_8(.0175f);

    // Apply delta rotaiton to radius (work2) and actual sprite rotation
    // Adding to the rotation rotates the sprite clockwise
    // Substracting to the rotation rotates the sprite counter-clockwise
    if (gCurrentSprite.status & SS_SAMUS_DETECTED)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            gCurrentSprite.work2 += deltaRotation;
            gCurrentSprite.rotation += deltaRotation;
        }
        else
        {
            gCurrentSprite.work2 -= deltaRotation;
            gCurrentSprite.rotation -= deltaRotation;
        }
    }
    else
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            gCurrentSprite.work2 -= deltaRotation;
            gCurrentSprite.rotation -= deltaRotation;
        }
        else
        {
            gCurrentSprite.work2 += deltaRotation;
            gCurrentSprite.rotation += deltaRotation;
        }
    }

    // Rotate sprite
    SerrisRotateAroundPoint(gCurrentSprite.xParasiteTimer, gCurrentSprite.unk_8, gCurrentSprite.work3 * BLOCK_SIZE * 3, gCurrentSprite.work2);
}

/**
 * @brief 476e8 | 54 | Starts an X aligned rotation for serris
 * 
 * @param centerY Rotation center Y
 * @param centerX Rotation center X
 * @param radius Rotation radius
 */
void SerrisStartRotationXAligned(u16 centerY, u16 centerX, u16 radius)
{
    if (gCurrentSprite.status & SS_FACING_RIGHT)
    {
        gCurrentSprite.unk_8 = centerX + radius * BLOCK_SIZE * 3;

        // Start rotation points right ->
        gCurrentSprite.work2 = PI;
    }
    else
    {
        gCurrentSprite.unk_8 = centerX - radius * BLOCK_SIZE * 3;

        // Start rotation points left <-
        gCurrentSprite.work2 = 0;
    }

    gCurrentSprite.xParasiteTimer = centerY;
    gCurrentSprite.work3 = radius;
}

/**
 * @brief 4773c | 54 | Starts an Y aligned rotation for serris
 * 
 * @param centerY Rotation center Y
 * @param centerX Rotation center X
 * @param radius Rotation radius
 */
void SerrisStartRotationYAligned(u16 centerY, u16 centerX, u16 radius)
{
    if (gCurrentSprite.status & SS_SAMUS_DETECTED)
    {
        // Start rotation points down v
        gCurrentSprite.work2 = 3 * PI / 2;
        gCurrentSprite.xParasiteTimer = centerY + radius * BLOCK_SIZE * 3;
    }
    else
    {
        // Start rotation points up ^
        gCurrentSprite.work2 = PI / 2;
        gCurrentSprite.xParasiteTimer = centerY - radius * BLOCK_SIZE * 3;
    }

    gCurrentSprite.unk_8 = centerX;
    gCurrentSprite.work3 = radius;
}

/**
 * @brief 47790 | 88 | Sets the facing oam for serris
 * 
 */
void SerrisSetFacingOam(void)
{
    if (gCurrentSprite.properties & SP_SECONDARY_SPRITE)
    {
        if (gCurrentSprite.roomSlot == SERRIS_PART_HEAD_JOINT)
        {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.pOam = sSerrisPartOam_Right;
            else
                gCurrentSprite.pOam = sSerrisPartOam_Left;
        }
    }
    else
    {
        if (gBossWork5 != 0)
        {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.pOam = sSerrisOam_SpeedboostingRight;
            else
                gCurrentSprite.pOam = sSerrisOam_SpeedboostingLeft;
        }
        else
        {
            if (gCurrentSprite.status & SS_X_FLIP)
                gCurrentSprite.pOam = sSerrisOam_Right;
            else
                gCurrentSprite.pOam = sSerrisOam_Left;
        }
    }

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;
}

/**
 * @brief 47818 | 190 | Initializes serris
 * 
 */
void SerrisInit(void)
{
    u8 gfxSlot;
    u8 ramSlot;
    u16 yPosition;
    u16 xPosition;

    if (gEquipment.suitMiscStatus & SMF_SPEED_BOOSTER)
    {
        gCurrentSprite.status = 0;
        return;
    }

    gCurrentSprite.yPosition += BLOCK_SIZE;

    gSerrisSpawnYPosition = gCurrentSprite.yPosition;
    gSerrisSpawnXPosition = gCurrentSprite.xPosition;

    gCurrentSprite.status |= SS_NOT_DRAWN | SS_ROTATE_SCALE_WHOLE | SS_SAMUS_COLLIDING | SS_IGNORE_PROJECTILES;
    
    gCurrentSprite.rotation = 0;
    gCurrentSprite.scaling = Q_8_8(1.f);

    gCurrentSprite.health = GET_PSPRITE_HEALTH(gCurrentSprite.spriteId);
    gCurrentSprite.samusCollision = SSC_NONE;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

    gCurrentSprite.hitboxTop = -(HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;
    gCurrentSprite.hitboxLeft = -(HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
    gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE + EIGHTH_BLOCK_SIZE;

    gCurrentSprite.pose = SERRIS_POSE_WAITING_TO_APPEAR_INIT;

    gCurrentSprite.pOam = sSerrisOam_Left;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.work0 = 0;
    gBossWork1 = 0;

    gfxSlot = gCurrentSprite.spritesetGfxSlot;
    ramSlot = gCurrentSprite.primarySpriteRamSlot;
    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_HEAD_JOINT, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_SECTION_1, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_SECTION_2, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_SECTION_3, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_SECTION_4, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_SECTION_5, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_SECTION_6, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_MIDDLE_END, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_TAIL_JOINT, gfxSlot, ramSlot, yPosition, xPosition, 0);
    SpriteSpawnSecondary(SSPRITE_SERRIS_PART, SERRIS_PART_TAIL, gfxSlot, ramSlot, yPosition, xPosition, 0);
}

/**
 * @brief 479a8 | 140 | Initializes serris to be waiting to appear
 * 
 */
void SerrisWaitingToAppearInit(void)
{
    u16 yPosition;
    u16 xPosition;

    yPosition = gSerrisSpawnYPosition - (BLOCK_SIZE * 10 + HALF_BLOCK_SIZE);
    xPosition = gSerrisSpawnXPosition;

    // Spawn the serris blocks, ■ is a normal platform block, X is serris block, and O is the serris block that the function will spawn

    // ■■■XXX■■■XXX■■■XXO■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 5, 0);

    // ■■■XXX■■■XXX■■■XOX■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 6, 0);

    // ■■■XXX■■■XXX■■■OXX■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 7, 0);

    // ■■■XXX■■■XXO■■■XXX■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 11, 0);

    // ■■■XXX■■■XOX■■■XXX■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 12, 0);

    // ■■■XXX■■■OXX■■■XXX■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 13, 0);

    // ■■■XXO■■■XXX■■■XXX■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 17, 0);

    // ■■■XOX■■■XXX■■■XXX■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 1, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 18, 0);

    // ■■■OXX■■■XXX■■■XXX■■■
    SpriteSpawnSecondary(SSPRITE_SERRIS_BLOCK, 0, gCurrentSprite.spritesetGfxSlot, gCurrentSprite.primarySpriteRamSlot, yPosition,
        xPosition - BLOCK_SIZE * 19, 0);

    gCurrentSprite.pose = SERRIS_POSE_WAITING_TO_APPEAR;
}

/**
 * @brief 47ae8 | 38 | Handles serris waiting to appear
 * 
 */
void SerrisWaitingToAppear(void)
{
    u8 platformId;

    platformId = SerrisGetCurrentSamusPlatform();

    // Wait for samus to be on the third platform
    if (platformId == 3)
    {
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;

        // Full screen shake
        ScreenShakeStartHorizontal(60, 0x80 | 1);
        ScreenShakeStartVertical(60, 0x80 | 1);

        unk_3b1c(0x288);
    }
}

/**
 * @brief 47b20 | 18 | Handles serris starting the fight
 * 
 */
void SerrisStartFight(void)
{
    gCurrentSprite.pose = SERRIS_POSE_FIRST_ARC_INIT;
    SerrisSetFacingOam();
}

/**
 * @brief 47b38 | 20 | Initializes serris' first arc
 * 
 */
void SerrisFirstArcInit(void)
{
    SerrisEdgeArcPatternInit();

    if (gCurrentSprite.pose == SERRIS_POSE_EDGE_ARC_PATTERN)
    {
        // Overwrite with first arc
        gCurrentSprite.pose = SERRIS_POSE_FIRST_ARC;
    }
}

/**
 * @brief 47b58 | 20 | Handles serris' first arc
 * 
 */
void SerrisFirstArc(void)
{
    SerrisEdgeArcPattern();

    if (gCurrentSprite.pose == SERRIS_POSE_END_PATTERN)
    {
        // Edge arc pattern ended, end first arc
        gCurrentSprite.pose = SERRIS_POSE_FIRST_ARC_ENDED;
    }
}

/**
 * @brief 47b78 | 7c | Handles the end of serris' first arc
 * 
 */
void SerrisFirstArcEnd(void)
{
    if (gCurrentSprite.status & SS_X_FLIP)
        gCurrentSprite.rotation = PI / 2;
    else
        gCurrentSprite.rotation = 3 * PI / 2;

    // Wait to be really deep in the floor
    if (gCurrentSprite.yPosition >= BLOCK_SIZE * 30)
    {
        gCurrentSprite.status &= ~(SS_NOT_DRAWN | SS_IGNORE_PROJECTILES);

        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;
        gCurrentSprite.samusCollision = SSC_RIDLEY_TAIL_SERRIS_SEGMENT;

        if (!(gCurrentSprite.properties & SP_SECONDARY_SPRITE))
        {
            // Is main sprite, set first arc done
            gCurrentSprite.pose = SERRIS_POSE_FIRST_ARC_DONE;
            PlayMusic(MUSIC_SERRIS_YAKUZA_BATTLE, 7);
        }
        else
        {
            // Part of serris, directly start zig zag pattern
            gCurrentSprite.pose = SERRIS_POSE_ZIG_ZAG_PATTERN_INIT;
        }
    }
    else
    {
        gCurrentSprite.yPosition += QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 47bf4 | 38 | Initializes serris to be dying
 * 
 */
void SerrisDyingInit(void)
{
    gCurrentSprite.pose = SERRIS_POSE_DYING;

    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.invincibilityStunFlashTimer = 0;

    // Death duration
    gCurrentSprite.work1 = 60 * 3;
    gCurrentSprite.work2 = 0;
}

/**
 * @brief 47c2c | 70 | Handles serris dying
 * 
 */
void SerrisDying(void)
{
    if (MOD_AND(gCurrentSprite.work1, 4))
    {
        // Make serris flicker between regular palette and the stun palette
        if (gCurrentSprite.work1 & 4)
            SPRITE_SET_ABSOLUTE_PALETTE_ROW(gCurrentSprite, SPRITE_FLASHING_PALETTE_ROW);
        else
            gCurrentSprite.paletteRow = 0;
    }

    // Spin gradually faster
    if (gCurrentSprite.work2 < UCHAR_MAX)
        gCurrentSprite.work2++;

    // Spin
    gCurrentSprite.rotation += gCurrentSprite.work2 / 4;
    gCurrentSprite.work1--;

    if (gCurrentSprite.work1 == 0)
        gCurrentSprite.pose = SERRIS_POSE_TURNING_INTO_X_INIT;
}

/**
 * @brief 47c9c | 3c | Initializes serris to be turning into an X
 * 
 */
void SerrisTurningIntoXInit(void)
{
    gCurrentSprite.pose = SERRIS_POSE_TURNING_INTO_X;

    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    gCurrentSprite.status |= SS_ENABLE_MOSAIC;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.health = 1;
    gCurrentSprite.invincibilityStunFlashTimer = 0;
    gCurrentSprite.paletteRow = 0;

    gCurrentSprite.xParasiteTimer = X_PARASITE_MOSAIC_MAX_INDEX;
}

/**
 * @brief 47cd8 | 19c | Handles serris turning into an X
 * 
 */
void SerrisTurningIntoX(void)
{
    u16 yPosition;
    u16 xPosition;

    // Spin
    gCurrentSprite.rotation += gCurrentSprite.work2 / 4;

    gWrittenToMosaic_H = sXParasiteMosaicValues[gCurrentSprite.xParasiteTimer];
    gCurrentSprite.xParasiteTimer--;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    switch (gCurrentSprite.xParasiteTimer)
    {
        case 40:
            ParticleSet(yPosition + QUARTER_BLOCK_SIZE - PIXEL_SIZE, xPosition + QUARTER_BLOCK_SIZE + PIXEL_SIZE, PE_0x2F);

            ParticleSet(yPosition + HALF_BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE, PE_0x25);
            break;

        case 30:
            ParticleSet(yPosition - HALF_BLOCK_SIZE, xPosition + HALF_BLOCK_SIZE - PIXEL_SIZE, PE_0x26);

            ParticleSet(yPosition + BLOCK_SIZE, xPosition + HALF_BLOCK_SIZE, PE_0x25);
            break;

        case 20:
            ParticleSet(yPosition - HALF_BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE, PE_0x26);

            ParticleSet(yPosition + BLOCK_SIZE, xPosition - QUARTER_BLOCK_SIZE, PE_0x25);
            break;

        case 10:
            ParticleSet(yPosition - (QUARTER_BLOCK_SIZE - PIXEL_SIZE), xPosition + QUARTER_BLOCK_SIZE + PIXEL_SIZE, PE_0x2F);

            ParticleSet(yPosition + HALF_BLOCK_SIZE, xPosition + HALF_BLOCK_SIZE, PE_0x25);
            break;

        case 0:
            // Turn into speedbooster ability
            gCurrentSprite.status &= ~SS_ROTATE_SCALE_WHOLE;
            gCurrentSprite.pose = SPRITE_POSE_SPAWNING_FROM_X_INIT;

            gCurrentSprite.spriteId = PSPRITE_SPEEDBOOSTER_ABILITY;
            break;
    }

    // Load speedbooster ability graphics and palette
    if (gCurrentSprite.xParasiteTimer < sizeof(sSpeedBoosterCoreXGfx) / 512)
    {
        SpriteLoadGfx(PSPRITE_SPEEDBOOSTER_ABILITY, 0, gCurrentSprite.xParasiteTimer);
    }
    else if (gCurrentSprite.xParasiteTimer == sizeof(sSpeedBoosterCoreXGfx) / 512)
    {
        SpriteLoadPal(PSPRITE_SPEEDBOOSTER_ABILITY, 0, ARRAY_SIZE(sSpeedBoosterCoreXPal) / 16);
    }
}

/**
 * @brief 47e74 | 1b8 | Initializes a serris part
 * 
 */
void SerrisPartInit(void)
{
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
    
    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SERRIS_POSE_WAITING_TO_APPEAR_INIT;
    gCurrentSprite.health = GET_SSPRITE_HEALTH(gCurrentSprite.spriteId);

    gCurrentSprite.rotation = 0;
    gCurrentSprite.scaling = Q_8_8(1.f);

    gCurrentSprite.work4 = (gCurrentSprite.roomSlot + 1) * 5;

    switch (gCurrentSprite.roomSlot)
    {
        case SERRIS_PART_HEAD_JOINT:
            gCurrentSprite.status |= SS_ROTATE_SCALE_WHOLE | SS_ENABLE_MOSAIC;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2);

            gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

            gCurrentSprite.pOam = sSerrisPartOam_Left;
            break;

        case SERRIS_PART_SECTION_1:
        case SERRIS_PART_SECTION_2:
        case SERRIS_PART_SECTION_3:
        case SERRIS_PART_SECTION_4:
        case SERRIS_PART_SECTION_5:
        case SERRIS_PART_SECTION_6:
            gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

            gCurrentSprite.pOam = sSerrisPartOam_Middle;
            break;

        case SERRIS_PART_MIDDLE_END:
            gCurrentSprite.work4 = (SERRIS_PART_MIDDLE_END + 1) * 5;
            gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxBottom = HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxLeft = -HALF_BLOCK_SIZE;
            gCurrentSprite.hitboxRight = HALF_BLOCK_SIZE;

            gCurrentSprite.pOam = sSerrisPartOam_MiddleEnd;
            break;

        case SERRIS_PART_TAIL_JOINT:
            gCurrentSprite.work4 = (SERRIS_PART_TAIL_JOINT + 1) * 5 - 2;
            gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxBottom = (QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);
            gCurrentSprite.hitboxRight = (QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE);

            gCurrentSprite.pOam = sSerrisPartOam_TailJoint;
            break;

        case SERRIS_PART_TAIL:
            gCurrentSprite.work4 = (SERRIS_PART_TAIL + 1) * 5 - 4;
            gCurrentSprite.status |= SS_ROTATE_SCALE_INDIVIDUAL;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -(QUARTER_BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxBottom = (QUARTER_BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxLeft = -(QUARTER_BLOCK_SIZE - PIXEL_SIZE);
            gCurrentSprite.hitboxRight = (QUARTER_BLOCK_SIZE - PIXEL_SIZE);

            gCurrentSprite.pOam = sSerrisPartOam_Tail;
            break;

        default:
            gCurrentSprite.status = 0;
    }
}

/**
 * @brief 4802c | 30 | Handles a serris part waiting to appear
 * 
 */
void SerrisPartWaitingToAppear(void)
{
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == SPRITE_POSE_IDLE_INIT)
        gCurrentSprite.pose = SPRITE_POSE_IDLE_INIT;
}

/**
 * @brief 4805c | 28 | Handles a serris part during the start of the fight
 * 
 */
void SerrisPartStartFight(void)
{
    gCurrentSprite.work4--;

    if (gCurrentSprite.work4 == 0)
    {
        gCurrentSprite.pose = SERRIS_POSE_FIRST_ARC_INIT;
        SerrisSetFacingOam();
    }
}

/**
 * @brief 48084 | 184 | Handles serris doing a zig zag pattern
 * 
 */
void SerrisZigZagPattern(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;
    u8 endRotation;
    u16 yLimit;

    // Y position of the horizontal "line" around which serris will change rotation
    yLimit = SERRIS_ROOM_WATER_Y + BLOCK_SIZE + HALF_BLOCK_SIZE;

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.work1 == 0)
    {
        // Check if is above the Y line
        if (rotationCenterY <= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        // Is below the line, start next rotation
        gCurrentSprite.work1 = 1;

        // Flip rotation vertically
        gCurrentSprite.status &= ~SS_SAMUS_DETECTED;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }

    if (gCurrentSprite.work1 == 1)
    {
        // Check if is below the Y line
        if (rotationCenterY >= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        // Is above the line, start next rotation
        gCurrentSprite.work1 = 2;

        // Flip rotation vertically
        gCurrentSprite.status |= SS_SAMUS_DETECTED;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }

    if (gCurrentSprite.work1 == 2)
    {
        // Check if is above the Y line
        if (rotationCenterY <= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        // Is below the line, start next rotation
        gCurrentSprite.work1 = 3;

        // Flip rotation vertically
        gCurrentSprite.status &= ~SS_SAMUS_DETECTED;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }

    if (gCurrentSprite.work1 == 3)
    {
        // Check if is below the Y line
        if (rotationCenterY >= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        // Is above the line, start next rotation
        gCurrentSprite.work1 = 4;

        // Flip rotation vertically
        gCurrentSprite.status |= SS_SAMUS_DETECTED;
        // Flip rotation horizontally
        gCurrentSprite.status ^= SS_FACING_RIGHT;

        // Start large rotation
        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 3);
    }

    if (gCurrentSprite.work1 == 4)
    {
        // Check if is above the Y line
        if (rotationCenterY <= yLimit)
        {
            SerrisHandleRotationMovement();
            return;
        }

        // End pattern
        gCurrentSprite.pose = SERRIS_POSE_END_PATTERN;
    }

    // Below is an unused pattern, it seems to be bugged
    if (gCurrentSprite.work1 == 5)
    {
        if (rotationCenterY < BLOCK_SIZE * 17 - 1)
        {
            gCurrentSprite.yPosition += QUARTER_BLOCK_SIZE;
            return;
        }

        gCurrentSprite.work1 = 6;
        gCurrentSprite.status &= ~SS_SAMUS_DETECTED;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }

    if (gCurrentSprite.work1 == 6)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = SERRIS_POSE_LOOP_AROUND_PATTERN_INIT;
    }

    if (gCurrentSprite.work1 == 7)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 == endRotation)
            gCurrentSprite.pose = SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT;
        else
            SerrisHandleRotationMovement();

    }
}

/**
 * @brief 48208 | 250 | Handles serris doing a loop around pattern
 * 
 */
void SerrisLoopAroundPattern(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;
    u8 endRotation;
    u32 movement;

    movement = QUARTER_BLOCK_SIZE;

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.work1 == 0)
    {
        // Wait until the first rotation to reach above the platforms ended
        if (gCurrentSprite.work2 != 3 * PI / 2)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 1;
    }

    if (gCurrentSprite.work1 == 1)
    {
        // Move along the platforms until one end of the room is reached
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 3 > rotationCenterX)
            {
                gCurrentSprite.xPosition += movement;
                return;
            }

            gCurrentSprite.work1 = 2;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 1);
        }
        else
        {
            if (gSerrisSpawnXPosition - (SERRIS_ROOM_WIDTH - BLOCK_SIZE * 3) < rotationCenterX)
            {
                gCurrentSprite.xPosition -= movement;
                return;
            }

            gCurrentSprite.work1 = 2;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 1);
        }
    }

    if (gCurrentSprite.work1 == 2)
    {
        // Get end rotation
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        // Wait until the rotation to dive under water ended
        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 3;
        gCurrentSprite.status &= ~SS_SAMUS_DETECTED;
        gCurrentSprite.status ^= SS_FACING_RIGHT;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 2);
    }

    if (gCurrentSprite.work1 == 3)
    {
        // Wait until the rotation underwater ended
        if (gCurrentSprite.work2 != PI / 2)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 4;
    }

    if (gCurrentSprite.work1 == 4)
    {
        // Move along the floor underwater
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            if (gSerrisSpawnXPosition - SERRIS_ROOM_WIDTH / 2 <= rotationCenterX)
            {
                gCurrentSprite.work1 = 5;
                SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 2);
            }
            else
            {
                gCurrentSprite.xPosition += movement;
                return;
            }

        }
        else
        {
            if (gSerrisSpawnXPosition - SERRIS_ROOM_WIDTH / 2 < rotationCenterX)
            {
                gCurrentSprite.xPosition -= movement;
                return;
            }

            gCurrentSprite.work1 = 5;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 2);
        }
    }

    if (gCurrentSprite.work1 == 5)
    {
        // Get end rotation
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = PI;
        else
            endRotation = 0;

        // Wait until the rotation to dive under water ended
        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = SERRIS_POSE_END_PATTERN;
    }

    // Below is an unused pattern that transitions into the zig zag pattern
    if (gCurrentSprite.work1 == 6)
    {
        if (gCurrentSprite.work2 != PI / 2)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 7;
    }

    if (gCurrentSprite.work1 == 7)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 3 <= rotationCenterX)
            {
                gCurrentSprite.work1 = 8;
                SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 1);
            }
            else
            {
                gCurrentSprite.xPosition += movement;
                return;
            }

        }
        else
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 21 < rotationCenterX)
            {
                gCurrentSprite.xPosition -= movement;
                return;
            }

            gCurrentSprite.work1 = 8;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 1);
        }
    }

    if (gCurrentSprite.work1 == 8)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 == endRotation)
            gCurrentSprite.pose = SERRIS_POSE_ZIG_ZAG_PATTERN_INIT;
        else
            SerrisHandleRotationMovement();
    }
}

/**
 * @brief 48458 | 154 | Handles serris doing a middle arc pattern
 * 
 */
void SerrisMiddleArcPattern(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;
    s32 endRotation;
    u32 movement;

    movement = QUARTER_BLOCK_SIZE;

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    if (gCurrentSprite.work1 == 0)
    {
        // Get end rotation
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        // Wait for rotation to end
        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = SERRIS_POSE_END_PATTERN;
    }

    // Below is an unused pattern that transitions into the loop around pattern
    if (gCurrentSprite.work1 == 1)
    {
        if (rotationCenterY < BLOCK_SIZE * 13 - 1)
        {
            gCurrentSprite.yPosition += movement;
            return;
        }

        gCurrentSprite.work1 = 2;
        gCurrentSprite.status &= ~SS_SAMUS_DETECTED;
        gCurrentSprite.status ^= SS_FACING_RIGHT;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 2);
    }

    if (gCurrentSprite.work1 == 2)
    {
        if (gCurrentSprite.work2 != PI / 2)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.work1 = 3;
    }

    if (gCurrentSprite.work1 == 3)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 6 <= rotationCenterX)
            {
                gCurrentSprite.work1 = 4;
                SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 2);
            }
            else
            {
                gCurrentSprite.xPosition += movement;
                return;
            }
        }
        else
        {
            if (gSerrisSpawnXPosition - BLOCK_SIZE * 18 < rotationCenterX)
            {
                gCurrentSprite.xPosition -= movement;
                return;
            }

            gCurrentSprite.work1 = 4;
            SerrisStartRotationYAligned(rotationCenterY, rotationCenterX, 2);

        }
    }

    if (gCurrentSprite.work1 == 4)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 == endRotation)
            gCurrentSprite.pose = SERRIS_POSE_LOOP_AROUND_PATTERN_INIT;
        else
            SerrisHandleRotationMovement();
    }
}

/**
 * @brief 485ac | 74 | Handles serris doing an edge arc pattern
 * 
 */
void SerrisEdgeArcPattern(void)
{
    s32 endRotation;

    if (gCurrentSprite.work1 == 0)
    {
        // Get end rotation
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        // Wait for the rotation to end
        if (gCurrentSprite.work2 != endRotation)
        {
            SerrisHandleRotationMovement();
            return;
        }

        gCurrentSprite.pose = SERRIS_POSE_END_PATTERN;
    }

    // Below is an unused pattern that transitions into the loop around pattern 
    if (gCurrentSprite.work1 == 1)
    {
        if (gCurrentSprite.status & SS_FACING_RIGHT)
            endRotation = 0;
        else
            endRotation = PI;

        if (gCurrentSprite.work2 == endRotation)
            gCurrentSprite.pose = SERRIS_POSE_LOOP_AROUND_PATTERN_INIT;
        else
            SerrisHandleRotationMovement();
    }
}

/**
 * @brief 48620 | a4 | Initializes serris to do a zig zag pattern
 * 
 */
void SerrisZigZagPatternInit(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;

    // Set starting rotation and starting position
    if (gCurrentSprite.status & SS_X_FLIP)
    {
        // Rotate to face upwards
        // 3 * PI * 2 instead of just PI / 2 to compensate for the X flip
        gCurrentSprite.rotation = 3 * PI / 2;
        // Start on the left end of the room
        gCurrentSprite.xPosition = gSerrisSpawnXPosition - SERRIS_ROOM_WIDTH;
    }
    else
    {
        // Rotate to face upwards
        gCurrentSprite.rotation = PI / 2;
        // Start on the right end of the room
        gCurrentSprite.xPosition = gSerrisSpawnXPosition;
    }

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    // Wait for serris to reach just below the water to start the first rotation
    if (gCurrentSprite.yPosition < SERRIS_ROOM_WATER_Y + BLOCK_SIZE + HALF_BLOCK_SIZE)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.status |= SS_FACING_RIGHT;
        else
            gCurrentSprite.status &= ~SS_FACING_RIGHT;

        gCurrentSprite.status |= SS_SAMUS_DETECTED;
        gCurrentSprite.pose = SERRIS_POSE_ZIG_ZAG_PATTERN;
        gCurrentSprite.work1 = 0;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }
    else
    {
        // Go up
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 486c4 | a4 | Initializes serris to do a loop around pattern
 * 
 */
void SerrisLoopAroundPatternInit(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;

    // Set starting rotation and starting position
    if (gCurrentSprite.status & SS_X_FLIP)
    {
        // Rotate to face upwards
        // 3 * PI * 2 instead of just PI / 2 to compensate for the X flip
        gCurrentSprite.rotation = 3 * PI / 2;
        // Start on the left end of the room
        gCurrentSprite.xPosition = gSerrisSpawnXPosition - SERRIS_ROOM_WIDTH;
    }
    else
    {
        // Rotate to face upwards
        gCurrentSprite.rotation = PI / 2;
        // Start on the right end of the room
        gCurrentSprite.xPosition = gSerrisSpawnXPosition;
    }

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    // Wait for serris to reach just below the water to start the first rotation
    if (gCurrentSprite.yPosition < SERRIS_ROOM_WATER_Y + BLOCK_SIZE * 2)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.status |= SS_FACING_RIGHT;
        else
            gCurrentSprite.status &= ~SS_FACING_RIGHT;

        gCurrentSprite.status |= SS_SAMUS_DETECTED;
        gCurrentSprite.pose = SERRIS_POSE_LOOP_AROUND_PATTERN;
        gCurrentSprite.work1 = 0;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 1);
    }
    else
    {
        // Go up
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 48768 | 9c | Initializes serris to do a middle arc pattern
 * 
 */
void SerrisMiddleArcPatternInit(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;

    // Set starting rotation
    if (gCurrentSprite.status & SS_X_FLIP)
    {
        // Rotate to face upwards
        // 3 * PI * 2 instead of just PI / 2 to compensate for the X flip
        gCurrentSprite.rotation = 3 * PI / 2;
    }
    else
    {
        // Rotate to face upwards
        gCurrentSprite.rotation = PI / 2;
    }
    
    // Spawn in the middle of the room
    gCurrentSprite.xPosition = gSerrisSpawnXPosition - SERRIS_ROOM_WIDTH / 2;

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    // Wait for serris to reach just below the water to start the first rotation
    if (gCurrentSprite.yPosition < SERRIS_ROOM_WATER_Y + BLOCK_SIZE)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.status |= SS_FACING_RIGHT;
        else
            gCurrentSprite.status &= ~SS_FACING_RIGHT;

        gCurrentSprite.status |= SS_SAMUS_DETECTED;
        gCurrentSprite.pose = SERRIS_POSE_MIDDLE_ARC_PATTERN;
        gCurrentSprite.work1 = 0;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 2);
    }
    else
    {
        // Go up
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 48804 | ac | Initializes serris to do an edge arc pattern
 * 
 */
void SerrisEdgeArcPatternInit(void)
{
    u16 rotationCenterY;
    u16 rotationCenterX;

    // Set starting rotation and starting position
    if (gCurrentSprite.status & SS_X_FLIP)
    {
        // Rotate to face upwards
        // 3 * PI * 2 instead of just PI / 2 to compensate for the X flip
        gCurrentSprite.rotation = 3 * PI / 2;
        // Start between the last 2 platforms on the left of the room
        gCurrentSprite.xPosition = gSerrisSpawnXPosition + -(SERRIS_ROOM_WIDTH - BLOCK_SIZE * 6);
    }
    else
    {
        // Rotate to face upwards
        gCurrentSprite.rotation = PI / 2;
        // Start between the last 2 platforms on the right of the room
        gCurrentSprite.xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 6;
    }

    rotationCenterY = gCurrentSprite.yPosition;
    rotationCenterX = gCurrentSprite.xPosition;

    // Wait for serris to reach just below the water to start the first rotation
    if (gCurrentSprite.yPosition < SERRIS_ROOM_WATER_Y + BLOCK_SIZE)
    {
        if (gCurrentSprite.status & SS_X_FLIP)
            gCurrentSprite.status |= SS_FACING_RIGHT;
        else
            gCurrentSprite.status &= ~SS_FACING_RIGHT;

        gCurrentSprite.status |= SS_SAMUS_DETECTED;
        gCurrentSprite.pose = SERRIS_POSE_EDGE_ARC_PATTERN;
        gCurrentSprite.work1 = 0;

        SerrisStartRotationXAligned(rotationCenterY, rotationCenterX, 2);
    }
    else
    {
        // Go up
        gCurrentSprite.yPosition -= QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 488b0 | ac | Determines the next pattern of serris
 * 
 */
void SerrisDeterminePattern(void)
{
    u8 pose;
    u8 xFlipped;
    u32 rng;
    u32 rngParam;

    xFlipped = FALSE;

    rngParam = gXParasiteTargetYPosition;
    rngParam = gSpriteRandomNumber;
    rng = gXParasiteTargetYPosition + gSpriteRandomNumber;

    // Each pattern has 1/4 chance of happening
    switch (rng % 16)
    {
        case 1:
        case 2:
        case 3:
        case 4:
            pose = SERRIS_POSE_ZIG_ZAG_PATTERN_INIT;
            break;

        case 5:
        case 6:
        case 7:
        case 8:
            pose = SERRIS_POSE_LOOP_AROUND_PATTERN_INIT;
            break;

        case 9:
        case 10:
        case 11:
        case 12:
            pose = SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT;
            break;

        case 13:
        case 14:
        default: // Handles 0 and 15
            pose = SERRIS_POSE_EDGE_ARC_PATTERN_INIT;
    }

    // 1/2 to be flipped
    if ((gFrameCounter16Bit + gCurrentSprite.currentAnimationFrame) % 2)
        xFlipped++;

    gBossWork2 = pose;
    gBossWork3 = xFlipped;
}

/**
 * @brief 4895c | 60 | Determines the next pattern of serris when speedboosting
 * 
 */
void SerrisDetermineSpeedboostingPattern(void)
{
    u8 pose;
    u8 xFlipped;
    u8 rng;

    xFlipped = FALSE;

    rng = MOD_AND(gSpriteRandomNumber, 8);

    // Each pattern has a 1/4 of happening and 1/2 of being flipped
    if (rng == 1)
    {
        pose = SERRIS_POSE_ZIG_ZAG_PATTERN_INIT;
    }
    else if (rng == 2)
    {
        pose = SERRIS_POSE_ZIG_ZAG_PATTERN_INIT;
        xFlipped = TRUE;
    }
    else if (rng == 3)
    {
        pose = SERRIS_POSE_LOOP_AROUND_PATTERN_INIT;
    }
    else if (rng == 4)
    {
        pose = SERRIS_POSE_LOOP_AROUND_PATTERN_INIT;
        xFlipped = TRUE;
    }
    else if (rng == 5)
    {
        pose = SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT;
    }
    else if (rng == 6)
    {
        pose = SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT;
        xFlipped = TRUE;
    }
    else if (rng == 7)
    {
        pose = SERRIS_POSE_ZIG_ZAG_PATTERN_INIT;
    }
    else
    {
        pose = SERRIS_POSE_ZIG_ZAG_PATTERN_INIT;
        xFlipped = TRUE;
    }

    gBossWork2 = pose;
    gBossWork3 = xFlipped;
}

/**
 * @brief 489bc | 70 | Ends a movement pattern
 * 
 */
void SerrisEndPattern(void)
{
    // Set facing down rotation
    if (gCurrentSprite.status & SS_X_FLIP)
    {
        gCurrentSprite.rotation = PI / 2;
    }
    else
    {
        gCurrentSprite.rotation = 3 * PI / 2;
    }

    // Wait to be very deep in the floor
    if (gCurrentSprite.yPosition >= BLOCK_SIZE * 30)
    {
        if (!(gCurrentSprite.properties & SP_SECONDARY_SPRITE))
            gBossWork4 = 65 + gSpriteRandomNumber * 2;

        gCurrentSprite.work4 = gBossWork4;
        gCurrentSprite.pose = SERRIS_POSE_WAITING_TO_EMERGE;
    }
    else
    {
        // Go down
        gCurrentSprite.yPosition += QUARTER_BLOCK_SIZE;
    }
}

/**
 * @brief 48a2c | 11c | Handles serris waiting to emerge
 * 
 */
void SerrisWaitingToEmerge(void)
{
    u16 xPosition;

    gCurrentSprite.work4--;

    if (gCurrentSprite.work4 == 0)
    {
        // Set queried pattern
        gCurrentSprite.pose = gBossWork2;

        // Set X flipping
        if (gBossWork3)
            gCurrentSprite.status |= SS_X_FLIP;
        else
            gCurrentSprite.status &= ~SS_X_FLIP;

        gCurrentSprite.yPosition = gSerrisSpawnYPosition;
        SerrisSetFacingOam();
        return;
    }

    if (gCurrentSprite.work4 != 40)
        return;

    // Only query pattern if it's the main sprite
    if (gCurrentSprite.properties & SP_SECONDARY_SPRITE)
        return;

    // Query next pattern
    if (gBossWork5 != 0)
        SerrisDetermineSpeedboostingPattern();
    else
        SerrisDeterminePattern();

    // Get emerging X position of the pattern to play the particles
    if (gBossWork2 == SERRIS_POSE_EDGE_ARC_PATTERN_INIT)
    {
        if (gBossWork3)
            xPosition = gSerrisSpawnXPosition + -(SERRIS_ROOM_WIDTH - BLOCK_SIZE * 6);
        else
            xPosition = gSerrisSpawnXPosition - BLOCK_SIZE * 6;
    }
    else if (gBossWork2 == SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT)
    {
        xPosition = gSerrisSpawnXPosition - SERRIS_ROOM_WIDTH / 2;
    }
    else
    {
        if (gBossWork3)
            xPosition = gSerrisSpawnXPosition - SERRIS_ROOM_WIDTH;
        else
            xPosition = gSerrisSpawnXPosition;
    }

    // Spawn particles
    ParticleSet(gSerrisSpawnYPosition - (BLOCK_SIZE * 2 - EIGHTH_BLOCK_SIZE), xPosition, PE_SPRITE_ENTER_OR_EXIT_WATER);
    SoundPlay(0x293);
}

/**
 * @brief 48b48 | 34 | Initializes a serris part to be dying
 * 
 */
void SerrisPartDyingInit(void)
{
    gCurrentSprite.pose = SERRIS_POSE_DYING;

    // Delay before the dying part starts slightly falling, scales with the part number to make them fall one after the other
    gCurrentSprite.work1 = (gCurrentSprite.roomSlot + 1) * 16;
    gCurrentSprite.work4 = 0;

    gCurrentSprite.samusCollision = SSC_NONE;
    gCurrentSprite.status |= SS_IGNORE_PROJECTILES;
}

/**
 * @brief 48b7c | 90 | Handles a serris part dying
 * 
 */
void SerrisPartDying(void)
{
    s16 velocity;
    u8 offset;

    gCurrentSprite.status ^= SS_NOT_DRAWN;

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;

        if (gCurrentSprite.work1 == 0 && gCurrentSprite.status & SS_ON_SCREEN)
        {
            ParticleSet(gCurrentSprite.yPosition, gCurrentSprite.xPosition, PE_0x2F);
            SoundPlay(0x294);
        }
    }
    else
    {
        offset = gCurrentSprite.work4;
        velocity = sSerrisPartDyingVelocity[offset];

        if (velocity == SHORT_MAX)
        {
            gCurrentSprite.pose = SERRIS_POSE_TURNING_INTO_X;
            gCurrentSprite.work1 = 4;
            gCurrentSprite.work4 = 0;
            gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;
        }
        else
        {
            offset++;
            gCurrentSprite.work4 = offset;
            gCurrentSprite.yPosition += velocity;
        }
    }
}

/**
 * @brief 48c0c | c8 | Handles the serris part falling
 * 
 */
void SerrisPartFalling(void)
{
    s16 velocity;
    u8 offset;

    gCurrentSprite.status ^= SS_NOT_DRAWN;

    if (gCurrentSprite.work1 != 0)
    {
        gCurrentSprite.work1--;
        return;
    }

    offset = gCurrentSprite.work4;
    velocity = sSerrisPartFallingVelocity[offset];

    if (velocity == SHORT_MAX)
    {
        velocity = sSerrisPartFallingVelocity[offset - 1];
        gCurrentSprite.yPosition += velocity;
    }
    else
    {
        offset++;
        gCurrentSprite.work4 = offset;
        gCurrentSprite.yPosition += velocity;
    }

    // Check is in water, xParasiteTimer temporarly holds the Y position of the previous frame
    if (gCurrentSprite.xParasiteTimer < SERRIS_ROOM_WATER_Y && gCurrentSprite.yPosition >= SERRIS_ROOM_WATER_Y)
    {
        if (gCurrentSprite.roomSlot >= SERRIS_PART_MIDDLE_END)
        {
            // Any tail part, do a small splash
            ParticleSet(gCurrentSprite.yPosition + BLOCK_SIZE + PIXEL_SIZE, gCurrentSprite.xPosition, PE_ENTER_OR_EXIT_WATER);
        }
        else
        {
            // Any body part, do a big splash
            ParticleSet(gCurrentSprite.yPosition + BLOCK_SIZE + PIXEL_SIZE, gCurrentSprite.xPosition, PE_ENTER_OR_EXIT_WATER_BIG);
        }

        SoundPlay(0x295);
    }

    gCurrentSprite.xParasiteTimer = gCurrentSprite.yPosition;

    if (gCurrentSprite.yPosition > SERRIS_ROOM_WATER_Y && !(gCurrentSprite.status & SS_ON_SCREEN))
    {
        // Kill if in the water and off screen
        gCurrentSprite.status = 0;
    }
}

/**
 * @brief 48cd4 | 1c | Sets the collision for a serris block
 * 
 * @param caa Clipdata affecting action
 */
void SerrisBlockSetCollision(u8 caa)
{
    gCurrentClipdataAffectingAction = caa;

    ClipdataProcess(gCurrentSprite.yPosition, gCurrentSprite.xPosition);
}

/**
 * @brief 48cf0 | 6c | Initializes a serris block
 * 
 */
void SerrisBlockInit(void)
{
    gCurrentSprite.status &= ~SS_NOT_DRAWN;

    gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);
    gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(HALF_BLOCK_SIZE);

    gCurrentSprite.hitboxTop = -PIXEL_SIZE;
    gCurrentSprite.hitboxBottom = PIXEL_SIZE;
    gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
    gCurrentSprite.hitboxRight = PIXEL_SIZE;

    if (gCurrentSprite.roomSlot != 0)
        gCurrentSprite.pOam = sSerrisBlockOam_Idle1;
    else
        gCurrentSprite.pOam = sSerrisBlockOam_Idle0;

    gCurrentSprite.animationDurationCounter = 0;
    gCurrentSprite.currentAnimationFrame = 0;

    gCurrentSprite.pose = SPRITE_POSE_IDLE;
    gCurrentSprite.samusCollision = SSC_NONE;

    SerrisBlockSetCollision(CAA_MAKE_SOLID);
}

/**
 * @brief 48d5c | 40 | Handles a serris block being idle
 * 
 */
void SerrisBlockIdle(void)
{
    // Wait for serris to spawn
    if (gSpriteData[gCurrentSprite.primarySpriteRamSlot].pose == SPRITE_POSE_IDLE_INIT)
    {
        gCurrentSprite.pose = SERRIS_BLOCK_POSE_CRUMBLING;

        // Set random timer before the block starts crumbling 
        gCurrentSprite.work1 = 8 + gSpriteRandomNumber * 2;
    }
}

/**
 * @brief 48d9c | 9c | Handles a serris block crumbling
 * 
 */
void SerrisBlockCrumbling(void)
{
    if (gCurrentSprite.work1 != 0)
    {
        // Delay before crumbling
        gCurrentSprite.work1--;
        if (gCurrentSprite.work1 == 0)
        {
            // Set crumbling animation
            if (gCurrentSprite.roomSlot != 0)
                gCurrentSprite.pOam = sSerrisBlockOam_Crumbling1;
            else
                gCurrentSprite.pOam = sSerrisBlockOam_Crumbling0;

            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;
        }
    }
    else if (SpriteUtilCheckEndCurrentSpriteAnim())
    {
        // Finished crumbling, set falling
        if (gCurrentSprite.roomSlot != 0)
            gCurrentSprite.pOam = sSerrisBlockOam_Falling1;
        else
            gCurrentSprite.pOam = sSerrisBlockOam_Falling0;

        gCurrentSprite.animationDurationCounter = 0;
        gCurrentSprite.currentAnimationFrame = 0;

        gCurrentSprite.pose = SERRIS_BLOCK_POSE_FALLING;
    }
    else if (gCurrentSprite.currentAnimationFrame == ARRAY_SIZE(sSerrisBlockOam_Crumbling1) / 2)
    {
        // ^ Probably intended to check for the middle of the animation
        // so using FRAME_DATA_LAST_ANIM_FRAME instead of ARRAY_SIZE might be better

        if (gCurrentSprite.animationDurationCounter == 1)
        {
            // Remove collision
            SerrisBlockSetCollision(CAA_REMOVE_SOLID);
        }
        else if (gCurrentSprite.animationDurationCounter == 4)
        {
            ParticleSet(gCurrentSprite.yPosition + HALF_BLOCK_SIZE + PIXEL_SIZE, gCurrentSprite.xPosition, PE_ENTER_OR_EXIT_WATER);
        }
    }
}

/**
 * @brief 48e38 | 30 | Handles a serris block falling
 * 
 */
void SerrisBlockFalling(void)
{
    gCurrentSprite.yPosition += QUARTER_BLOCK_SIZE;
    gCurrentSprite.yPosition += ONE_SUB_PIXEL;

    // Wait for the sprite to exit the room and be off screen
    if (gCurrentSprite.yPosition >= BLOCK_SIZE * 20 && !(gCurrentSprite.status & SS_ON_SCREEN))
    {
        // Destroy sprite
        gCurrentSprite.status = 0;
    }
}

/**
 * @brief 48e68 | cc | Checks if samus is colliding with the water
 * 
 */
void SerrisCheckInWater(void)
{
    // gUnk_030007c0[0] has the previous Y position of serris

    if (gUnk_030007c0[0] > gCurrentSprite.yPosition)
    {
        if (gUnk_030007c0[0] > SERRIS_ROOM_WATER_Y && gCurrentSprite.yPosition <= SERRIS_ROOM_WATER_Y)
        {
            if (!(gCurrentSprite.status & SS_NOT_DRAWN))
            {
                ParticleSet(gCurrentSprite.yPosition + BLOCK_SIZE, gCurrentSprite.xPosition, PE_SPRITE_ENTER_OR_EXIT_WATER);

                if (gBossWork5 != 0)
                    SoundPlay(0x28D);
                else
                    SoundPlay(0x28A);
            }

            gCurrentSprite.status &= ~SS_SAMUS_COLLIDING;
        }
    }
    else if (gUnk_030007c0[0] < gCurrentSprite.yPosition)
    {
        if (gUnk_030007c0[0] < SERRIS_ROOM_WATER_Y && gCurrentSprite.yPosition >= SERRIS_ROOM_WATER_Y)
        {
            if (!(gCurrentSprite.status & SS_NOT_DRAWN))
            {
                ParticleSet(gCurrentSprite.yPosition + HALF_BLOCK_SIZE, gCurrentSprite.xPosition, PE_SPRITE_ENTER_OR_EXIT_WATER);

                if (gBossWork5 != 0)
                    SoundPlay(0x28C);
                else
                    SoundPlay(0x289);
            }

            gCurrentSprite.status |= SS_SAMUS_COLLIDING;
        }
    }
}

/**
 * @brief 48f34 | 4f8 | serris AI
 * 
 */
void Serris(void)
{
    // Check was damaged
    if (SPRITE_HAS_ISFT(gCurrentSprite) == 0x10 && gCurrentSprite.health != 0)
    {
        // "Stun" timer before serris goes into speedbooster mode
        gCurrentSprite.work0 = 30;
        gCurrentSprite.properties |= SP_IMMUNE_TO_PROJECTILES;

        unk_3b1c(0x290);
    }

    // "Stun" before going into speedbooster mode
    if (gCurrentSprite.work0 != 0)
    {
        gCurrentSprite.work0--;

        if (gCurrentSprite.work0 != 0)
            return;

        // Set long speedbooster timer
        gBossWork5 = 60 * 7 + 30;
        SerrisSetFacingOam();
    }

    // Check dead and initialized (a sprite has 0 health when spawning)
    if (gCurrentSprite.health == 0 && gCurrentSprite.pose != SPRITE_POSE_UNINITIALIZED)
    {
        // Set dying if not already
        if (gCurrentSprite.pose < SERRIS_POSE_DYING_INIT)
        {
            gCurrentSprite.pose = SERRIS_POSE_DYING_INIT;
            unk_3b1c(0x291);
        }
    }
    else
    {
        if (gCurrentSprite.pose == SERRIS_POSE_FIRST_ARC_DONE)
        {
            // Force zig zag pattern after the first arc
            gCurrentSprite.pose = SERRIS_POSE_ZIG_ZAG_PATTERN_INIT;

            // Set small speedbooster timer
            gBossWork5 = 60 * 2;
            SerrisSetFacingOam();
            SoundPlay(0x292);
        }

        if (gBossWork5 != 0)
        {
            // Flicker speedbooster palette
            if (gFrameCounter8Bit & 8)
                gCurrentSprite.paletteRow = 4;
            else
                gCurrentSprite.paletteRow = 5;

            // Play speedboosting sound
            if (MOD_AND(gFrameCounter8Bit, 16) == 0 && gCurrentSprite.pose != SERRIS_POSE_WAITING_TO_EMERGE)
                unk_3b1c(0x28F);

            // Update timer
            gBossWork5--;

            if (gBossWork5 == 0)
            {
                // Make vulnerable again
                gCurrentSprite.properties &= ~SP_IMMUNE_TO_PROJECTILES;
                SerrisSetFacingOam();
            }
        }
        else
        {
            // Not speedboosting, set default palette
            gCurrentSprite.paletteRow = 0;
        }

        if ((gCurrentSprite.status & (SS_NOT_DRAWN | SS_SAMUS_COLLIDING)) == SS_SAMUS_COLLIDING &&
            MOD_AND(gFrameCounter8Bit, 32) == 0 && gCurrentSprite.pose != SERRIS_POSE_WAITING_TO_EMERGE)
        {
            if (gBossWork5 != 0)
                SoundPlay(0x28E);
            else
                SoundPlay(0x28B);
        }
    }

    // Save previous Y position
    gUnk_030007c0[0] = gCurrentSprite.yPosition;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SerrisInit();
            break;

        case SERRIS_POSE_DYING_INIT:
            SerrisDyingInit();
            break;

        case SERRIS_POSE_DYING:
            SerrisDying();
            break;

        case SERRIS_POSE_TURNING_INTO_X_INIT:
            SerrisTurningIntoXInit();

        case SERRIS_POSE_TURNING_INTO_X:
            SerrisTurningIntoX();
            break;

        case SERRIS_POSE_WAITING_TO_APPEAR_INIT:
            SerrisWaitingToAppearInit();
            break;

        case SERRIS_POSE_WAITING_TO_APPEAR:
            SerrisWaitingToAppear();
            break;

        case SPRITE_POSE_IDLE_INIT:
            SerrisStartFight();
            break;

        case SERRIS_POSE_FIRST_ARC_INIT:
            SerrisFirstArcInit();
            break;

        case SERRIS_POSE_FIRST_ARC:
            SerrisFirstArc();
            break;

        case SERRIS_POSE_FIRST_ARC_ENDED:
            SerrisFirstArcEnd();
            break;

        case SERRIS_POSE_WAITING_TO_EMERGE:
            SerrisWaitingToEmerge();
            break;

        case SERRIS_POSE_END_PATTERN:
            SerrisEndPattern();
            break;

        case SERRIS_POSE_ZIG_ZAG_PATTERN_INIT:
            SerrisZigZagPatternInit();
            break;

        case SERRIS_POSE_LOOP_AROUND_PATTERN_INIT:
            SerrisLoopAroundPatternInit();
            break;

        case SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT:
            SerrisMiddleArcPatternInit();
            break;

        case SERRIS_POSE_EDGE_ARC_PATTERN_INIT:
            SerrisEdgeArcPatternInit();
            break;

        case SERRIS_POSE_ZIG_ZAG_PATTERN:
            SerrisZigZagPattern();
            break;

        case SERRIS_POSE_LOOP_AROUND_PATTERN:
            SerrisLoopAroundPattern();
            break;

        case SERRIS_POSE_MIDDLE_ARC_PATTERN:
            SerrisMiddleArcPattern();
            break;

        case SERRIS_POSE_EDGE_ARC_PATTERN:
            SerrisEdgeArcPattern();
    }

    SerrisCheckInWater();
    SerrisUpdatePalette();

    // If speedboosting, call the movement functions again to make serris go faster
    if (gBossWork5 != 0)
    {
        gUnk_030007c0[0] = gCurrentSprite.yPosition;

        switch (gCurrentSprite.pose)
        {
            case SERRIS_POSE_WAITING_TO_EMERGE:
                SerrisWaitingToEmerge();
                break;

            case SERRIS_POSE_END_PATTERN:
                SerrisEndPattern();
                break;

            case SERRIS_POSE_ZIG_ZAG_PATTERN_INIT:
                SerrisZigZagPatternInit();
                break;

            case SERRIS_POSE_LOOP_AROUND_PATTERN_INIT:
                SerrisLoopAroundPatternInit();
                break;

            case SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT:
                SerrisMiddleArcPatternInit();
                break;

            case SERRIS_POSE_EDGE_ARC_PATTERN_INIT:
                SerrisEdgeArcPatternInit();
                break;

            case SERRIS_POSE_ZIG_ZAG_PATTERN:
                SerrisZigZagPattern();
                break;

            case SERRIS_POSE_LOOP_AROUND_PATTERN:
                SerrisLoopAroundPattern();
                break;

            case SERRIS_POSE_MIDDLE_ARC_PATTERN:
                SerrisMiddleArcPattern();
                break;

            case SERRIS_POSE_EDGE_ARC_PATTERN:
                SerrisEdgeArcPattern();
        }

        SerrisCheckInWater();
    }
}

/**
 * @brief 4942c | 414 | serris part AI
 * 
 */
void SerrisPart(void)
{
    u8 ramSlot;

    ramSlot = gCurrentSprite.primarySpriteRamSlot;

    if (gSpriteData[ramSlot].work0 != 0)
    {
        // Main sprite is "stunned", so just do nothing here
        return;
    }

    if (gSpriteData[ramSlot].pose == SERRIS_POSE_DYING)
    {
        // Main sprite is dying, set part as dying too
        if (gCurrentSprite.pose < SERRIS_POSE_DYING_INIT)
            gCurrentSprite.pose = SERRIS_POSE_DYING_INIT;
    }
    else if (gBossWork5 != 0)
    {
        // Set speedboosting palette
        if (gFrameCounter8Bit & 4)
        {
            gCurrentSprite.paletteRow = 5;
        }        
        else
        {
            gCurrentSprite.paletteRow = 6;
        }
    }
    else
    {
        // Set default palette
        gCurrentSprite.paletteRow = 0;
    }

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SerrisPartInit();
            break;

        case SERRIS_POSE_WAITING_TO_APPEAR_INIT:
            SerrisPartWaitingToAppear();
            break;

        case SPRITE_POSE_IDLE_INIT:
            SerrisPartStartFight();
            break;

        case SERRIS_POSE_FIRST_ARC_INIT:
            SerrisFirstArcInit();
            break;

        case SERRIS_POSE_FIRST_ARC:
            SerrisFirstArc();
            break;

        case SERRIS_POSE_DYING_INIT:
            SerrisPartDyingInit();
            break;

        case SERRIS_POSE_DYING:
            SerrisPartDying();
            break;

        case SERRIS_PART_POSE_FALLING:
            SerrisPartFalling();
            break;

        case SERRIS_POSE_FIRST_ARC_ENDED:
            SerrisFirstArcEnd();
            break;

        case SERRIS_POSE_WAITING_TO_EMERGE:
            SerrisWaitingToEmerge();
            break;

        case SERRIS_POSE_END_PATTERN:
            SerrisEndPattern();
            break;

        case SERRIS_POSE_ZIG_ZAG_PATTERN_INIT:
            SerrisZigZagPatternInit();
            break;

        case SERRIS_POSE_LOOP_AROUND_PATTERN_INIT:
            SerrisLoopAroundPatternInit();
            break;

        case SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT:
            SerrisMiddleArcPatternInit();
            break;

        case SERRIS_POSE_EDGE_ARC_PATTERN_INIT:
            SerrisEdgeArcPatternInit();
            break;

        case SERRIS_POSE_ZIG_ZAG_PATTERN:
            SerrisZigZagPattern();
            break;

        case SERRIS_POSE_LOOP_AROUND_PATTERN:
            SerrisLoopAroundPattern();
            break;

        case SERRIS_POSE_MIDDLE_ARC_PATTERN:
            SerrisMiddleArcPattern();
            break;

        case SERRIS_POSE_EDGE_ARC_PATTERN:
            SerrisEdgeArcPattern();
    }

    // If speedboosting, call the movement functions again to make serris go faster
    if (gBossWork5 != 0)
    {
        switch (gCurrentSprite.pose)
        {
            case SERRIS_POSE_FIRST_ARC_ENDED:
                SerrisFirstArcEnd();
                break;

            case SERRIS_POSE_WAITING_TO_EMERGE:
                SerrisWaitingToEmerge();
                break;

            case SERRIS_POSE_END_PATTERN:
                SerrisEndPattern();
                break;

            case SERRIS_POSE_ZIG_ZAG_PATTERN_INIT:
                SerrisZigZagPatternInit();
                break;

            case SERRIS_POSE_LOOP_AROUND_PATTERN_INIT:
                SerrisLoopAroundPatternInit();
                break;

            case SERRIS_POSE_MIDDLE_ARC_PATTERN_INIT:
                SerrisMiddleArcPatternInit();
                break;

            case SERRIS_POSE_EDGE_ARC_PATTERN_INIT:
                SerrisEdgeArcPatternInit();
                break;

            case SERRIS_POSE_ZIG_ZAG_PATTERN:
                SerrisZigZagPattern();
                break;

            case SERRIS_POSE_LOOP_AROUND_PATTERN:
                SerrisLoopAroundPattern();
                break;

            case SERRIS_POSE_MIDDLE_ARC_PATTERN:
                SerrisMiddleArcPattern();
                break;

            case SERRIS_POSE_EDGE_ARC_PATTERN:
                SerrisEdgeArcPattern();
        }
    }
}

/**
 * @brief 49840 | 48 | serris block AI
 * 
 */
void SerrisBlock(void)
{
    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            SerrisBlockInit();
            break;

        case SPRITE_POSE_IDLE:
            SerrisBlockIdle();
            break;

        case SERRIS_BLOCK_POSE_CRUMBLING:
            SerrisBlockCrumbling();
            break;

        case SERRIS_BLOCK_POSE_FALLING:
            SerrisBlockFalling();
            break;
    }
}
