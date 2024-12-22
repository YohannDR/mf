    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start UpdateMenuOamDataID
UpdateMenuOamDataID: @ 0x0807486C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0807488C @ =gNonGameplayRam
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r3
	adds r0, r3, #0
	adds r0, #0x36
	movs r2, #0
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807488C: .4byte gNonGameplayRam

	thumb_func_start EventSet
EventSet: @ 0x08074890
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080748AC @ =gEventCounter
	strb r1, [r0]
	movs r4, #0
	cmp r1, #0x6b
	bls _080748A2
	b _08074B3A
_080748A2:
	lsls r0, r1, #2
	ldr r1, _080748B0 @ =_080748B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080748AC: .4byte gEventCounter
_080748B0: .4byte _080748B4
_080748B4: @ jump table
	.4byte _08074A64 @ case 0
	.4byte _08074B3A @ case 1
	.4byte _08074B3A @ case 2
	.4byte _08074A80 @ case 3
	.4byte _08074B3A @ case 4
	.4byte _08074B3A @ case 5
	.4byte _08074B3A @ case 6
	.4byte _08074B38 @ case 7
	.4byte _08074B3A @ case 8
	.4byte _08074B3A @ case 9
	.4byte _08074B38 @ case 10
	.4byte _08074B3A @ case 11
	.4byte _08074B3A @ case 12
	.4byte _08074B3A @ case 13
	.4byte _08074B3A @ case 14
	.4byte _08074B38 @ case 15
	.4byte _08074B3A @ case 16
	.4byte _08074B3A @ case 17
	.4byte _08074B3A @ case 18
	.4byte _08074A8C @ case 19
	.4byte _08074B3A @ case 20
	.4byte _08074B3A @ case 21
	.4byte _08074B38 @ case 22
	.4byte _08074B3A @ case 23
	.4byte _08074B3A @ case 24
	.4byte _08074B38 @ case 25
	.4byte _08074B3A @ case 26
	.4byte _08074B3A @ case 27
	.4byte _08074B3A @ case 28
	.4byte _08074B38 @ case 29
	.4byte _08074B3A @ case 30
	.4byte _08074B3A @ case 31
	.4byte _08074B3A @ case 32
	.4byte _08074B3A @ case 33
	.4byte _08074B3A @ case 34
	.4byte _08074AA0 @ case 35
	.4byte _08074B3A @ case 36
	.4byte _08074B3A @ case 37
	.4byte _08074B38 @ case 38
	.4byte _08074B3A @ case 39
	.4byte _08074B3A @ case 40
	.4byte _08074B3A @ case 41
	.4byte _08074B3A @ case 42
	.4byte _08074B3A @ case 43
	.4byte _08074B3A @ case 44
	.4byte _08074B3A @ case 45
	.4byte _08074B3A @ case 46
	.4byte _08074B3A @ case 47
	.4byte _08074B3A @ case 48
	.4byte _08074B3A @ case 49
	.4byte _08074B3A @ case 50
	.4byte _08074B38 @ case 51
	.4byte _08074B3A @ case 52
	.4byte _08074B3A @ case 53
	.4byte _08074B3A @ case 54
	.4byte _08074AB4 @ case 55
	.4byte _08074B3A @ case 56
	.4byte _08074B3A @ case 57
	.4byte _08074B38 @ case 58
	.4byte _08074B3A @ case 59
	.4byte _08074B38 @ case 60
	.4byte _08074B3A @ case 61
	.4byte _08074B3A @ case 62
	.4byte _08074B3A @ case 63
	.4byte _08074B3A @ case 64
	.4byte _08074B3A @ case 65
	.4byte _08074B38 @ case 66
	.4byte _08074B3A @ case 67
	.4byte _08074B3A @ case 68
	.4byte _08074B3A @ case 69
	.4byte _08074AEE @ case 70
	.4byte _08074B3A @ case 71
	.4byte _08074B3A @ case 72
	.4byte _08074B38 @ case 73
	.4byte _08074B3A @ case 74
	.4byte _08074B3A @ case 75
	.4byte _08074AE4 @ case 76
	.4byte _08074B3A @ case 77
	.4byte _08074B10 @ case 78
	.4byte _08074B3A @ case 79
	.4byte _08074B3A @ case 80
	.4byte _08074B38 @ case 81
	.4byte _08074B3A @ case 82
	.4byte _08074AC8 @ case 83
	.4byte _08074B3A @ case 84
	.4byte _08074B3A @ case 85
	.4byte _08074B38 @ case 86
	.4byte _08074B3A @ case 87
	.4byte _08074B3A @ case 88
	.4byte _08074B3A @ case 89
	.4byte _08074B3A @ case 90
	.4byte _08074B38 @ case 91
	.4byte _08074B3A @ case 92
	.4byte _08074B3A @ case 93
	.4byte _08074B3A @ case 94
	.4byte _08074B3A @ case 95
	.4byte _08074B38 @ case 96
	.4byte _08074B3A @ case 97
	.4byte _08074B3A @ case 98
	.4byte _08074B3A @ case 99
	.4byte _08074B3A @ case 100
	.4byte _08074B3A @ case 101
	.4byte _08074B3A @ case 102
	.4byte _08074B3A @ case 103
	.4byte _08074B3A @ case 104
	.4byte _08074B3A @ case 105
	.4byte _08074B3A @ case 106
	.4byte _08074B38 @ case 107
_08074A64:
	ldr r0, _08074A78 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08074B3A
	ldr r1, _08074A7C @ =gEquipment
	movs r0, #0xff
	strb r0, [r1, #0xd]
	b _08074B3E
	.align 2, 0
_08074A78: .4byte gPauseScreenFlag
_08074A7C: .4byte gEquipment
_08074A80:
	ldr r0, _08074A88 @ =gEquipment
	movs r1, #0
	strb r1, [r0, #0xd]
	b _08074AFC
	.align 2, 0
_08074A88: .4byte gEquipment
_08074A8C:
	ldr r2, _08074A98 @ =gEquipment
	ldr r1, _08074A9C @ =sSecurityUnlockEvents
	ldrb r0, [r1]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #4]
	b _08074AD2
	.align 2, 0
_08074A98: .4byte gEquipment
_08074A9C: .4byte sSecurityUnlockEvents
_08074AA0:
	ldr r2, _08074AAC @ =gEquipment
	ldr r1, _08074AB0 @ =sSecurityUnlockEvents
	ldrb r0, [r1, #8]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0xc]
	b _08074AD2
	.align 2, 0
_08074AAC: .4byte gEquipment
_08074AB0: .4byte sSecurityUnlockEvents
_08074AB4:
	ldr r2, _08074AC0 @ =gEquipment
	ldr r1, _08074AC4 @ =sSecurityUnlockEvents
	ldrb r0, [r1, #0x10]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0x14]
	b _08074AD2
	.align 2, 0
_08074AC0: .4byte gEquipment
_08074AC4: .4byte sSecurityUnlockEvents
_08074AC8:
	ldr r2, _08074ADC @ =gEquipment
	ldr r1, _08074AE0 @ =sSecurityUnlockEvents
	ldrb r0, [r1, #0x18]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0x1c]
_08074AD2:
	movs r1, #0xa
	bl SubEventUpdate
	b _08074B3A
	.align 2, 0
_08074ADC: .4byte gEquipment
_08074AE0: .4byte sSecurityUnlockEvents
_08074AE4:
	movs r0, #0x71
	movs r1, #0xb
	bl SubEventUpdate
	b _08074B3A
_08074AEE:
	ldr r1, _08074B04 @ =gSecurityHatchLevelBackup
	ldr r2, _08074B08 @ =gEquipment
	ldrb r0, [r2, #0xd]
	strb r0, [r1]
	movs r1, #0xff
	orrs r0, r1
	strb r0, [r2, #0xd]
_08074AFC:
	ldr r0, _08074B0C @ =gSecurityHatchLevel
	strb r1, [r0]
	b _08074B3A
	.align 2, 0
_08074B04: .4byte gSecurityHatchLevelBackup
_08074B08: .4byte gEquipment
_08074B0C: .4byte gSecurityHatchLevel
_08074B10:
	ldr r2, _08074B2C @ =gSecurityHatchLevelBackup
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08074B3E
	ldr r0, _08074B30 @ =gEquipment
	strb r1, [r0, #0xd]
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _08074B34 @ =gCurrentEventBasedEffect
	movs r0, #2
	strb r0, [r1]
	b _08074B3E
	.align 2, 0
_08074B2C: .4byte gSecurityHatchLevelBackup
_08074B30: .4byte gEquipment
_08074B34: .4byte gCurrentEventBasedEffect
_08074B38:
	movs r4, #1
_08074B3A:
	cmp r4, #0
	beq _08074BA0
_08074B3E:
	movs r4, #0x12
	ldr r3, _08074B78 @ =gEventCounter
	ldr r2, _08074B7C @ =sObtainItemEvents
_08074B44:
	adds r1, r4, r2
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08074B9A
	ldr r0, _08074B80 @ =gAbilityCount
	strb r4, [r0]
	ldr r3, _08074B84 @ =gEquipment
	ldr r1, _08074B88 @ =sAbilityRamValues
	lsls r0, r4, #3
	adds r2, r0, r1
	ldrb r0, [r3, #0xa]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r3, #0xa]
	ldrb r0, [r3, #0xb]
	ldrb r1, [r2, #1]
	orrs r0, r1
	strb r0, [r3, #0xb]
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _08074B8C
	bl RecoveringSuitInit
	b _08074B94
	.align 2, 0
_08074B78: .4byte gEventCounter
_08074B7C: .4byte sObtainItemEvents
_08074B80: .4byte gAbilityCount
_08074B84: .4byte gEquipment
_08074B88: .4byte sAbilityRamValues
_08074B8C:
	ldrb r0, [r3, #0xc]
	ldrb r1, [r2, #2]
	orrs r0, r1
	strb r0, [r3, #0xc]
_08074B94:
	bl SubEventUpdateForAbility
	b _08074BA0
_08074B9A:
	subs r4, #1
	cmp r4, #0
	bne _08074B44
_08074BA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EventCheckPlayCutsceneDuringTransition
EventCheckPlayCutsceneDuringTransition: @ 0x08074BA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r0, _08074BEC @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _08074BFC
	ldr r0, _08074BF0 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5d
	beq _08074BC8
	b _08074CE0
_08074BC8:
	cmp r6, #0x4d
	beq _08074BCE
	b _08074CE0
_08074BCE:
	ldr r0, _08074BF4 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	beq _08074BD8
	b _08074CE0
_08074BD8:
	ldr r1, _08074BF8 @ =gCurrentCutscene
	movs r0, #0xa
	strb r0, [r1]
	movs r0, #0x8d
	movs r1, #4
	bl SubEventUpdate
	movs r1, #3
	mov r8, r1
	b _08074CE0
	.align 2, 0
_08074BEC: .4byte gSamusData
_08074BF0: .4byte gEventCounter
_08074BF4: .4byte gCurrentArea
_08074BF8: .4byte gCurrentCutscene
_08074BFC:
	movs r5, #0
	movs r1, #0
	ldr r7, _08074C34 @ =gEventCounter
	mov ip, r7
	ldr r2, _08074C38 @ =0x083C8BFC
	ldr r4, _08074C3C @ =0x08576098
	ldr r3, _08074C40 @ =gCurrentArea
_08074C0A:
	mov r7, ip
	ldrb r0, [r7]
	ldrb r7, [r4]
	cmp r0, r7
	bne _08074CB4
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08074C44
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #2]
	ldrb r3, [r3]
	cmp r0, r3
	bne _08074C5A
	ldrb r0, [r1, #3]
	cmp r0, r6
	bne _08074C5A
	movs r5, #1
	b _08074C5E
	.align 2, 0
_08074C34: .4byte gEventCounter
_08074C38: .4byte 0x083C8BFC
_08074C3C: .4byte 0x08576098
_08074C40: .4byte gCurrentArea
_08074C44:
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	ldrb r3, [r3]
	cmp r0, r3
	bne _08074C5A
	ldrb r0, [r1, #1]
	cmp r0, r6
	bne _08074C5A
	movs r5, #1
_08074C5A:
	cmp r5, #0
	beq _08074CE0
_08074C5E:
	ldr r0, _08074CA4 @ =gPreviousCutscene
	ldrb r2, [r4, #3]
	ldrb r0, [r0]
	adds r1, r2, #0
	cmp r0, r1
	beq _08074CBC
	ldr r0, _08074CA8 @ =gCurrentCutscene
	strb r2, [r0]
	movs r0, #1
	mov r8, r0
	cmp r1, #9
	bne _08074C90
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	ldr r1, _08074CAC @ =gPreviousNavigationConversation
	movs r0, #0xfe
	strb r0, [r1]
	ldr r1, _08074CB0 @ =gUnk_03000b85
	movs r0, #0
	strb r0, [r1]
_08074C90:
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _08074CBC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #4
	bl SubEventUpdate
	b _08074CBC
	.align 2, 0
_08074CA4: .4byte gPreviousCutscene
_08074CA8: .4byte gCurrentCutscene
_08074CAC: .4byte gPreviousNavigationConversation
_08074CB0: .4byte gUnk_03000b85
_08074CB4:
	adds r4, #8
	adds r1, #1
	cmp r1, #5
	ble _08074C0A
_08074CBC:
	cmp r5, #0
	bne _08074CE0
	ldr r0, _08074CEC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08074CE0
	cmp r6, #0x22
	bne _08074CE0
	ldr r0, _08074CF0 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	bne _08074CE0
	movs r0, #0x11
	movs r1, #4
	bl SubEventUpdate
	movs r7, #2
	mov r8, r7
_08074CE0:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074CEC: .4byte gEventCounter
_08074CF0: .4byte gCurrentArea

	thumb_func_start EventCheckUpdateAfterCutscene
EventCheckUpdateAfterCutscene: @ 0x08074CF4
	push {r4, lr}
	ldr r0, _08074D18 @ =gPreviousCutscene
	ldr r2, _08074D1C @ =gCurrentCutscene
	ldrb r1, [r2]
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r4, r2, #0
	cmp r1, #7
	bne _08074D0E
	movs r0, #0x62
	bl EventSet
_08074D0E:
	ldrb r0, [r4]
	cmp r0, #0xa
	bne _08074D20
	movs r0, #0x8e
	b _08074D36
	.align 2, 0
_08074D18: .4byte gPreviousCutscene
_08074D1C: .4byte gCurrentCutscene
_08074D20:
	movs r2, #0
	ldr r1, _08074D40 @ =0x08576098
_08074D24:
	ldrb r0, [r4]
	ldrb r3, [r1, #3]
	cmp r0, r3
	bne _08074D44
	ldrh r0, [r1, #6]
	cmp r0, #0
	beq _08074D4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08074D36:
	movs r1, #5
	bl SubEventUpdate
	b _08074D4C
	.align 2, 0
_08074D40: .4byte 0x08576098
_08074D44:
	adds r1, #8
	adds r2, #1
	cmp r2, #5
	ble _08074D24
_08074D4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EventCheckRoomHasEventTrigger
EventCheckRoomHasEventTrigger: @ 0x08074D54
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08074D9C @ =gEventCounter
	ldrb r0, [r0]
	adds r3, r0, #1
	ldr r1, _08074DA0 @ =gRoomEventTrigger
	movs r0, #0
	strb r0, [r1]
	movs r5, #0
	ldr r4, _08074DA4 @ =sEventLocationAndNavigationInfo
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r4
_08074D72:
	ldrb r0, [r2, #7]
	cmp r0, #0
	bne _08074DAC
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08074DAC
	ldr r0, _08074DA8 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r4, [r2]
	cmp r0, r4
	bne _08074DAC
	ldrb r0, [r2, #1]
	cmp r6, r0
	bne _08074DAC
	ldrb r0, [r2, #2]
	cmp r0, #0xff
	beq _08074DF4
	strb r3, [r1]
	b _08074DBC
	.align 2, 0
_08074D9C: .4byte gEventCounter
_08074DA0: .4byte gRoomEventTrigger
_08074DA4: .4byte sEventLocationAndNavigationInfo
_08074DA8: .4byte gCurrentArea
_08074DAC:
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08074DBC
	adds r2, #0xc
	adds r3, #1
	adds r5, #1
	b _08074D72
_08074DBC:
	cmp r5, #0
	beq _08074E1C
	ldr r0, _08074DE8 @ =gEventCounter
	ldrb r3, [r0]
	cmp r3, #0
	ble _08074E1C
	ldr r0, _08074DEC @ =sEventLocationAndNavigationInfo
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #6]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r4, r0, #0
	cmp r1, #0
	beq _08074DFE
	ldr r0, _08074DF0 @ =gPreviousNavigationConversation
	strb r2, [r0]
	b _08074E1C
	.align 2, 0
_08074DE8: .4byte gEventCounter
_08074DEC: .4byte sEventLocationAndNavigationInfo
_08074DF0: .4byte gPreviousNavigationConversation
_08074DF4:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	b _08074DBC
_08074DFE:
	subs r3, #1
	cmp r3, #0
	ble _08074E1C
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08074DFE
	ldr r0, _08074E24 @ =gPreviousNavigationConversation
	strb r1, [r0]
_08074E1C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074E24: .4byte gPreviousNavigationConversation

	thumb_func_start EventCheckRoomEventTrigger
EventCheckRoomEventTrigger: @ 0x08074E28
	push {r4, lr}
	ldr r2, _08074E7C @ =sEventLocationAndNavigationInfo
	ldr r4, _08074E80 @ =gRoomEventTrigger
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #2]
	lsls r0, r0, #6
	ldr r3, _08074E84 @ =gSamusData
	ldrh r2, [r3, #0x16]
	cmp r0, r2
	bgt _08074EA6
	ldrb r0, [r1, #4]
	lsls r0, r0, #6
	cmp r0, r2
	blt _08074EA6
	ldrb r0, [r1, #3]
	lsls r0, r0, #6
	ldrh r2, [r3, #0x18]
	cmp r0, r2
	bgt _08074EA6
	ldrb r0, [r1, #5]
	lsls r0, r0, #6
	cmp r0, r2
	blt _08074EA6
	ldrb r0, [r4]
	bl EventSet
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08074E88 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5c
	bne _08074E8C
	movs r0, #0xfa
	bl SoundPlay
	movs r0, #0x8b
	b _08074E92
	.align 2, 0
_08074E7C: .4byte sEventLocationAndNavigationInfo
_08074E80: .4byte gRoomEventTrigger
_08074E84: .4byte gSamusData
_08074E88: .4byte gEventCounter
_08074E8C:
	cmp r0, #0x59
	bne _08074E9A
	movs r0, #0x85
_08074E92:
	movs r1, #0xb
	bl SubEventUpdate
	b _08074EA6
_08074E9A:
	cmp r0, #0x5a
	bne _08074EA6
	movs r0, #0x86
	movs r1, #0xb
	bl SubEventUpdate
_08074EA6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EventCheckSetNavigationRoomEvent
EventCheckSetNavigationRoomEvent: @ 0x08074EAC
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _08074F18 @ =sEventLocationAndNavigationInfo
	ldr r0, _08074F1C @ =gEventCounter
	ldrb r0, [r0]
	adds r3, r0, #1
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _08074EF6
	ldr r4, _08074F20 @ =sAreaNavigationRoomPairs
	lsls r2, r0, #1
	adds r0, r2, r4
	ldr r1, _08074F24 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08074EDA
	cmp r0, #0xff
	bne _08074EF6
_08074EDA:
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r2, [r0]
	subs r1, r2, #1
	ldr r0, _08074F28 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r1, r0
	beq _08074EEE
	cmp r2, #0xff
	bne _08074EF6
_08074EEE:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
_08074EF6:
	ldr r0, _08074F24 @ =gCurrentArea
	movs r2, #1
	ldrb r0, [r0]
	lsls r2, r0
	ldr r3, _08074F2C @ =gEquipment
	ldrb r1, [r3, #0xe]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08074F10
	orrs r1, r2
	strb r1, [r3, #0xe]
	movs r5, #1
_08074F10:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08074F18: .4byte sEventLocationAndNavigationInfo
_08074F1C: .4byte gEventCounter
_08074F20: .4byte sAreaNavigationRoomPairs
_08074F24: .4byte gCurrentArea
_08074F28: .4byte gCurrentRoom
_08074F2C: .4byte gEquipment

	thumb_func_start EventCheckDownloadedDataItem
EventCheckDownloadedDataItem: @ 0x08074F30
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r4, #0
	ldr r1, _08074F68 @ =sEventLocationAndNavigationInfo
	ldr r0, _08074F6C @ =gEventCounter
	ldrb r0, [r0]
	adds r2, r0, #1
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08074F5E
	cmp r3, #0
	beq _08074F5C
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
_08074F5C:
	movs r4, #1
_08074F5E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08074F68: .4byte sEventLocationAndNavigationInfo
_08074F6C: .4byte gEventCounter

	thumb_func_start EventCheckUnlockSecurityLevel
EventCheckUnlockSecurityLevel: @ 0x08074F70
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r0, _08074F98 @ =gEquipment
	ldrb r4, [r0, #0xd]
	cmp r4, #0xff
	bne _08074F82
	movs r4, #0
_08074F82:
	movs r5, #0
	movs r3, #0
	ldr r0, _08074F9C @ =gCurrentArea
	ldr r1, _08074FA0 @ =sSecurityUnlockEvents
	ldrb r2, [r0]
	adds r6, r0, #0
	ldrb r0, [r1, #1]
	cmp r2, r0
	bne _08074FA4
	ldrb r5, [r1]
	b _08074FB8
	.align 2, 0
_08074F98: .4byte gEquipment
_08074F9C: .4byte gCurrentArea
_08074FA0: .4byte sSecurityUnlockEvents
_08074FA4:
	adds r3, #1
	cmp r3, #3
	bgt _08074FB8
	lsls r0, r3, #3
	adds r2, r0, r1
	ldrb r0, [r6]
	ldrb r7, [r2, #1]
	cmp r0, r7
	bne _08074FA4
	ldrb r5, [r2]
_08074FB8:
	cmp r4, r5
	blt _08074FC0
	movs r0, #0
	b _08074FF4
_08074FC0:
	ldr r2, _08074FEC @ =gEventCounter
	lsls r0, r3, #3
	adds r1, r0, r1
	ldrb r0, [r2]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _08074FF0
	mov r7, ip
	cmp r7, #0
	beq _08074FF2
	adds r0, #1
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08074FF2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	movs r0, #2
	bl SetCurrentEventBasedEffect
	b _08074FF2
	.align 2, 0
_08074FEC: .4byte gEventCounter
_08074FF0:
	movs r5, #0
_08074FF2:
	adds r0, r5, #0
_08074FF4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
