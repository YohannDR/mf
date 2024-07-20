#include "sprites_AI/destroyed_data_pad.h"
#include "macros.h"
#include "globals.h"

#include "data/sprites/destroyed_data_pad.h"

#include "constants/event.h"
#include "constants/samus.h"
#include "constants/particle.h"
#include "constants/sprite.h"

#include "structs/samus.h"
#include "structs/sprite.h"

/**
 * @brief 4378c | 2fc | Destroyed data pad AI
 * 
 */
void DestroyedDataPad(void)
{
    // FIXME data pad oam

    u16 yPosition;
    u16 xPosition;

    yPosition = gCurrentSprite.yPosition;
    xPosition = gCurrentSprite.xPosition;

    gCurrentSprite.ignoreSamusCollisionTimer = 1;

    switch (gCurrentSprite.pose)
    {
        case SPRITE_POSE_UNINITIALIZED:
            gCurrentSprite.samusCollision = SSC_NONE;
            gCurrentSprite.drawOrder = 12;

            gCurrentSprite.drawDistanceTop = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 3);
            gCurrentSprite.drawDistanceBottom = SUB_PIXEL_TO_PIXEL(0);
            gCurrentSprite.drawDistanceHorizontal = SUB_PIXEL_TO_PIXEL(BLOCK_SIZE * 2 + HALF_BLOCK_SIZE);

            gCurrentSprite.hitboxTop = -PIXEL_SIZE;
            gCurrentSprite.hitboxBottom = PIXEL_SIZE;
            gCurrentSprite.hitboxLeft = -PIXEL_SIZE;
            gCurrentSprite.hitboxRight = PIXEL_SIZE;

            gCurrentSprite.animationDurationCounter = 0;
            gCurrentSprite.currentAnimationFrame = 0;

            if (EventCheckOn_EscapedSaXNoc())
            {
                gCurrentSprite.pOam = (const struct FrameData*)0x8321afc;
                gCurrentSprite.work1 = 60 * 2;
                gCurrentSprite.pose = SPRITE_POSE_IDLE;
            }
            else
            {
                gCurrentSprite.pOam = sDestroyedDataPadOam_Destroyed;
                gCurrentSprite.pose = 0x8;
            }
            break;

        case SPRITE_POSE_IDLE:
            gCurrentSprite.work1--;
            if (gCurrentSprite.work1 == 0)
            {
                gCurrentSprite.pOam = (const struct FrameData*)0x8321aec;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;
                gCurrentSprite.pose = 0x18;
                gCurrentSprite.work1 = 10;
            }
            break;

        case 0x18:
            gCurrentSprite.work1--;
            if (gCurrentSprite.work1 == 0)
            {
                gCurrentSprite.pose = 0x1A;
                gCurrentSprite.work1 = 60 * 2 + 1;
            }
            break;

        case 0x1A:
            gCurrentSprite.work1--;

            if (gCurrentSprite.work1 == 60 * 2)
            {
                ParticleSet(yPosition + QUARTER_BLOCK_SIZE, xPosition, PE_0x2F);
                unk_3b1c(0x232);
            }
            else if (gCurrentSprite.work1 == 110)
            {
                ParticleSet(yPosition, xPosition - (BLOCK_SIZE - PIXEL_SIZE), PE_0x2F);
            }
            else if (gCurrentSprite.work1 == 100)
            {
                ParticleSet(yPosition - EIGHTH_BLOCK_SIZE, xPosition + BLOCK_SIZE, PE_0x2F);
            }
            else if (gCurrentSprite.work1 == 90)
            {
                ParticleSet(yPosition - (BLOCK_SIZE + EIGHTH_BLOCK_SIZE), xPosition - (HALF_BLOCK_SIZE + QUARTER_BLOCK_SIZE + PIXEL_SIZE), PE_0x2F);
            }
            else if (gCurrentSprite.work1 == 80)
            {
                ParticleSet(yPosition - (BLOCK_SIZE + QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE),
                    xPosition + (BLOCK_SIZE - PIXEL_SIZE), PE_0x2F);
            }
            else if (gCurrentSprite.work1 == 70)
            {
                ParticleSet(yPosition + HALF_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE, PE_0x2F);
            }
            else if (gCurrentSprite.work1 == 69)
            {

            }
            else if (gCurrentSprite.work1 == 68)
            {

            }
            else if (gCurrentSprite.work1 == 67)
            {

            }
            else if (gCurrentSprite.work1 == 66)
            {

            }
            else if (gCurrentSprite.work1 == 65)
            {
                gCurrentSprite.pOam = sDestroyedDataPadOam_Destroyed;
                gCurrentSprite.animationDurationCounter = 0;
                gCurrentSprite.currentAnimationFrame = 0;

                gCurrentSprite.spritesetGfxSlot = 7;
            }
            else if (gCurrentSprite.work1 == 60)
            {
                ParticleSet(yPosition + QUARTER_BLOCK_SIZE + EIGHTH_BLOCK_SIZE, xPosition - BLOCK_SIZE, PE_0x30);
            }
            else if (gCurrentSprite.work1 == 50)
            {
                ParticleSet(yPosition + QUARTER_BLOCK_SIZE, xPosition + BLOCK_SIZE, PE_0x30);
            }
            else if (gCurrentSprite.work1 == 40)
            {
                ParticleSet(yPosition, xPosition, PE_0x30);
            }
            else if (gCurrentSprite.work1 == 30)
            {
                ParticleSet(yPosition - (BLOCK_SIZE + PIXEL_SIZE), xPosition + (BLOCK_SIZE - PIXEL_SIZE), PE_0x30);
            }
            else if (gCurrentSprite.work1 == 20)
            {
                ParticleSet(yPosition - BLOCK_SIZE, xPosition - (BLOCK_SIZE + EIGHTH_BLOCK_SIZE), PE_0x30);
            }
            else if (gCurrentSprite.work1 == 10)
            {
                ParticleSet(yPosition + HALF_BLOCK_SIZE, xPosition - EIGHTH_BLOCK_SIZE, PE_0x30);
                gCurrentSprite.pose = 0x1C;
                gCurrentSprite.work1 = 30;
            }
            break;

        case 0x1C:
            gCurrentSprite.work1--;
            if (gCurrentSprite.work1 == 25)
            {
                ParticleSet(yPosition - PIXEL_SIZE, xPosition - (BLOCK_SIZE - PIXEL_SIZE), PE_0x35);
            }
            else if (gCurrentSprite.work1 == 20)
            {
                ParticleSet(yPosition, xPosition + (BLOCK_SIZE + PIXEL_SIZE + PIXEL_SIZE / 2), PE_SMOKE);
            }
            else if (gCurrentSprite.work1 == 15)
            {
                ParticleSet(yPosition, xPosition + (BLOCK_SIZE + PIXEL_SIZE + PIXEL_SIZE / 2), PE_0x35);
            }
            else if (gCurrentSprite.work1 == 10)
            {
                ParticleSet(yPosition + PIXEL_SIZE, xPosition - (BLOCK_SIZE - PIXEL_SIZE), PE_SMOKE);
            }
            else if (gCurrentSprite.work1 == 5)
            {
                ParticleSet(yPosition, xPosition, PE_SMOKE);
                gCurrentSprite.work1 = 60;
                gCurrentSprite.pose = 0x1E;
            }
            break;

        case 0x1E:
            gCurrentSprite.work1--;
            if (gCurrentSprite.work1 == 0)
            {
                EventCheckAdvance(EVENT_NOC_DATA_ROOM_DESTROYED);
                gCurrentSprite.pose = 0x8;
            }
            break;
    }
}
