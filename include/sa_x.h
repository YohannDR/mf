#ifndef SA_X_H
#define SA_X_H

#include "gba.h"

u8 SaXRunningGfx(void);
u8 SaXWalkingGfx(void);
u8 SaXStandingGfx(void);
u8 SaXShootingGfx(void);
u8 SaXTurningGfx(void);
u8 SaXMidAirGfx(void);
u8 SaXLandingGfx(void);
u8 SaXShootingRestrictedLaboratoryGfx(void);
u8 SaXCoveredByMetroidsGfx(void);
u8 SaXKneelingGfx(void);
u8 SaXTransformingIntoMonsterGfx(void);
u8 SaXMorphingGfx(void);
u8 SaXUnmorphingGfx(void);
u8 SaXMorphBallGfx(void);
u8 SaXSwagWalkGfx(void);
u8 SaXTurningTowardsCameraGfx(void);
u8 SaXTurningAwayFromCameraGfx(void);
void SaXSetPose(u8 pose);
void SaXUpdatePosition(void);
void SaXUpdateGraphicsAndDraw(void);
void SaXUpdateElevatorSprite(s32 spriteSlot);
void SaXDrawElevatorSprites(void);
void unk_d638(void);
u8 unk_d694(void);
u8 SaXElevatorBeforeBlowingUpWall(void);
u8 SaXElevatorBlowingUpWall(void);
u8 SaXElevatorWalkingBeforeTurningToCamera(void);
u8 SaXElevatorBeforeJumping(void);
u8 SaXElevatorBeforeShootingDoor(void);
u8 SaXElevatorWalkingOut(void);

#endif /* SA_X_H */
