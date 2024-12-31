    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start PlayRoomMusicTrack
PlayRoomMusicTrack: @ 0x080715AC
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r2, _080715E4 @ =gMusicTrackInfo
	ldr r1, _080715E8 @ =0x0879B8BC
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #0x3a]
	strh r0, [r2]
	ldrh r0, [r2]
	bl CheckSetNewMusicTrack
	ldr r0, _080715EC @ =gDestinationDoor
	strb r4, [r0]
	movs r0, #0x21
	bl SubEventUpdateMusic
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080715E4: .4byte gMusicTrackInfo
_080715E8: .4byte 0x0879B8BC
_080715EC: .4byte gDestinationDoor

	thumb_func_start CheckUpdateMusicDuringRoomLoad
CheckUpdateMusicDuringRoomLoad: @ 0x080715F0
	push {lr}
	ldr r0, _08071604 @ =0x03000022
	ldrb r0, [r0]
	cmp r0, #0
	beq _08071608
	movs r0, #0
	bl SoundPlay
	b _080716CA
	.align 2, 0
_08071604: .4byte 0x03000022
_08071608:
	ldr r0, _08071648 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807167C
	ldr r0, _0807164C @ =gDemoState
	ldrb r0, [r0]
	cmp r0, #0
	bne _080716CA
	ldr r1, _08071650 @ =gMusicTrackInfo
	ldr r0, _08071654 @ =gCurrentRoomEntry
	ldrh r0, [r0, #0x16]
	strh r0, [r1]
	ldr r0, _08071658 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08071660
	bl unk_3ac4
	ldr r0, _0807165C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3d
	bne _080716CA
	movs r0, #0x11
	movs r1, #0
	bl MusicPlay_38a8
	b _080716CA
	.align 2, 0
_08071648: .4byte gUnk_03000be3
_0807164C: .4byte gDemoState
_08071650: .4byte gMusicTrackInfo
_08071654: .4byte gCurrentRoomEntry
_08071658: .4byte gIsLoadingFile
_0807165C: .4byte gSamusData
_08071660:
	ldr r0, _08071674 @ =gCurrentArea
	ldrb r1, [r0]
	ldr r0, _08071678 @ =gCurrentRoom
	ldrb r0, [r0]
	cmn r1, r0
	bne _080716CA
	movs r0, #3
	bl SubEventUpdateMusic
	b _080716CA
	.align 2, 0
_08071674: .4byte gCurrentArea
_08071678: .4byte gCurrentRoom
_0807167C:
	ldr r0, _080716B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080716C4
	cmp r0, #3
	bne _080716CA
	ldr r0, _080716B8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _080716CA
	movs r0, #3
	bl SubEventUpdateMusic
	ldr r0, _080716BC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x47
	bne _080716CA
	ldr r0, _080716C0 @ =gSubEventCounter
	ldrh r0, [r0]
	cmp r0, #0x64
	bne _080716CA
	movs r0, #0xc
	bl SetCurrentEventBasedEffect
	b _080716CA
	.align 2, 0
_080716B4: .4byte gPauseScreenFlag
_080716B8: .4byte gCurrentNavigationRoom
_080716BC: .4byte gEventCounter
_080716C0: .4byte gSubEventCounter
_080716C4:
	movs r0, #2
	bl SubEventUpdateMusic
_080716CA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LowerMusicVolume
LowerMusicVolume: @ 0x080716D0
	push {lr}
	bl DecreaseMusicVolume
	ldr r1, _080716E0 @ =gMusicTrackInfo
	movs r0, #1
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080716E0: .4byte gMusicTrackInfo

	thumb_func_start IncreaseMusicVolume
IncreaseMusicVolume: @ 0x080716E4
	push {lr}
	bl unk_3c84
	ldr r1, _080716F4 @ =gMusicTrackInfo
	movs r0, #0
	strb r0, [r1, #2]
	pop {r0}
	bx r0
	.align 2, 0
_080716F4: .4byte gMusicTrackInfo
