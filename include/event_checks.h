#ifndef EVENT_CHECKS_H
#define EVENT_CHECKS_H

#include "types.h"

u32 EventCheckAdvance(u8 event);
u32 EventCheckOn_NavAfterYakuza(void);
u32 EventCheckOn_EngagedSaXTro2(void);
u32 EventCheckAfter_IceBeamRecovered(void);
u32 EventCheckAfter_SaXKilledByOmega(void);
u32 EventCheckOn_EnteredOperationsDeck(void);
u32 EventCheckOn_TriggeredBox2Rumble(void);
u32 EventCheckOn_RestrictedZoneWarning(void);
u32 EventCheckAfter_ReachedTopOfRoomAfterVaria(void);
u32 EventCheckOn_PowerOutage(void);
u32 EventCheckOn_WaveBeamRecovered(void);
u32 EventCheckOn_RestrictedLabExplosion(void);
u32 EventCheckOn_BombsQuake(void);
u32 EventCheckOn_BombsDownloaded(void);
u32 EventCheckOn_EscapedSaXNoc(void);
u32 EventCheckOn_EngagedSaXArc(void);
u32 EventCheckOn_PowerBombsDownloaded(void);
u32 EventCheckOn_EngagedSaXNoc(void);
u32 EventCheckOn_NavigationRoomEnteringNoc(void);
u32 EventCheckOn_HighJumpRecovered(void);
u32 EventCheckAfter_EscapedSaXTro1(void);
u32 EventCheckAfter_BoxDefeated(void);
u32 EventCheckOn_BoxRumble(void);
u32 EventCheckOn_SuperMissileDownloaded(void);
u32 EventCheckOn_EnteredSuperMissileDataRoom(void);
u32 EventCheckAfter_WaterLowered(void);
u32 EventCheckOn_NavigationRoomBeforeQuarantineBay(void);
u32 EventCheckWith_SaveDisabled(void);
u32 EventCheckWith_NavigationDisabled(void);
u32 EventCheckWith_RechargeDisabled(void);
u32 EventCheckOn_EnteredPumpControlUnit(void);
u32 EventCheckOn_Meltdown(void);
u32 EventCheckOn_NavigationRoomLeavingPyr2(void);
u32 EventCheckAfter_AnimalsReleased(void);
u32 EventCheckOn_SpaceJumpRecovered(void);
u32 EventCheckOn_SaXDefeated(void);
u32 EventCheckAfter_OrbitChange(void);
u32 EventCheckOn_Escape(void);
u32 EventCheckOn_EndEscape(void);

#endif /* EVENT_CHECKS_H */