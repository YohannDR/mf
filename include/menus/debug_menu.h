#ifndef DEBUG_MENU_H
#define DEBUG_MENU_H

#include "types.h"

void DebugMenuSoubroutine(void);
u32 DebugMenuModifyValues(void);
void DebugMenuDrawEventText(u8 event);
void DebugMenuDrawSection(u8 section);
void SetAbilityCount(u8 abilityCount);
u32 DebugMenuModifiyAbilityCount(u8 cursorX);
void DebugMenuDrawAbilityCount(void);
void DebugMenuDrawMenuAndDoor(void);
void DebugMenuDrawIgt(void);
void unk_7e224(void);
u32 DebugMenuModifyHealthAndAmmo(u8 cursorX, u8 section);
void DebugMenuDrawHealthAmmoAndEvent(u8 section);
void DebugMenuDrawNumber(u16 value, u8 section);
void DebugMenuCheckSetMaxHealthOrAmmo(void);
void DebugMenuDrawEverything(void);
void DebugMenuSetupCursor(void);

#endif /* DEBUG_MENU_H */
