    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start WaverCheckSamusInRange
WaverCheckSamusInRange: @ 0x08026C7C
	push {r4, lr}
	movs r4, #0
	ldr r0, _08026CA4 @ =gCurrentSprite
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	beq _08026C9A
	movs r1, #0xc8
	lsls r1, r1, #1
	movs r0, #0x28
	movs r2, #0x40
	bl SpriteUtilCheckSamusNearSpriteFrontBehindX
	cmp r0, #3
	bne _08026C9A
	movs r4, #1
_08026C9A:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08026CA4: .4byte gCurrentSprite

	thumb_func_start WaverSetFlyingGFX
WaverSetFlyingGFX: @ 0x08026CA8
	push {lr}
	ldr r2, _08026CC4 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08026CCC
	ldr r0, _08026CC8 @ =0x08317590
	b _08026CCE
	.align 2, 0
_08026CC4: .4byte gCurrentSprite
_08026CC8: .4byte 0x08317590
_08026CCC:
	ldr r0, _08026CD4 @ =0x08317580
_08026CCE:
	str r0, [r2, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_08026CD4: .4byte 0x08317580

	thumb_func_start WaverInit
WaverInit: @ 0x08026CD8
	push {lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08026D04 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08026D08
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08026D08
	strh r0, [r2]
	b _08026D88
	.align 2, 0
_08026D04: .4byte gCurrentSprite
_08026D08:
	ldr r1, _08026D20 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	ldrb r0, [r2]
	adds r3, r1, #0
	cmp r0, #0x59
	bne _08026D24
	movs r0, #0x5a
	strb r0, [r2]
	movs r0, #0x2c
	strh r0, [r3, #6]
	b _08026D40
	.align 2, 0
_08026D20: .4byte gCurrentSprite
_08026D24:
	movs r0, #2
	strb r0, [r2]
	ldr r0, _08026D8C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08026D40
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r3]
_08026D40:
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08026D90 @ =0x0000FFE0
	strh r1, [r3, #0xa]
	movs r0, #0x20
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldr r2, _08026D94 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #2
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #0x30
	strb r0, [r1]
	bl WaverSetFlyingGFX
	bl SpriteUtilChooseRandomXFlip
_08026D88:
	pop {r0}
	bx r0
	.align 2, 0
_08026D8C: .4byte gSpriteRandomNumber
_08026D90: .4byte 0x0000FFE0
_08026D94: .4byte sPrimarySpriteStats

	thumb_func_start WaverFlyingInit
WaverFlyingInit: @ 0x08026D98
	push {lr}
	ldr r0, _08026DAC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	bl WaverSetFlyingGFX
	pop {r0}
	bx r0
	.align 2, 0
_08026DAC: .4byte gCurrentSprite

	thumb_func_start WaverFlying
WaverFlying: @ 0x08026DB0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _08026DDC @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _08026DC6
	b _08026F56
_08026DC6:
	movs r0, #0
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	beq _08026DE0
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	b _08026DE4
	.align 2, 0
_08026DDC: .4byte gCurrentSprite
_08026DE0:
	movs r2, #0xa
	ldrsh r0, [r1, r2]
_08026DE4:
	ldrh r2, [r1, #2]
	adds r0, r0, r2
	ldrh r1, [r1, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08026E34 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08026DFA
	movs r0, #1
	mov r8, r0
_08026DFA:
	bl WaverCheckSamusInRange
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _08026E40
	ldr r3, _08026E38 @ =gCurrentSprite
	ldr r0, _08026E3C @ =0x083175D8
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	movs r2, #0
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r1, #0xa
	movs r0, #0x14
	strb r0, [r1]
	movs r0, #0xd3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _08026F56
	.align 2, 0
_08026E34: .4byte gPreviousCollisionCheck
_08026E38: .4byte gCurrentSprite
_08026E3C: .4byte 0x083175D8
_08026E40:
	ldr r1, _08026E84 @ =0x08316450
	ldr r2, _08026E88 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x31
	ldrb r0, [r3]
	lsrs r0, r0, #3
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r2, #0
	cmp r4, #0
	beq _08026E90
	mov r2, r8
	cmp r2, #0
	bne _08026E70
	ldrh r0, [r5, #2]
	adds r0, r0, r6
	strh r0, [r5, #2]
_08026E70:
	ldrb r0, [r3]
	cmp r0, #0x5e
	bls _08026EDA
	strb r7, [r3]
	ldrh r1, [r5]
	ldr r0, _08026E8C @ =0x0000FBFF
	ands r0, r1
	strh r0, [r5]
	b _08026EDA
	.align 2, 0
_08026E84: .4byte 0x08316450
_08026E88: .4byte gCurrentSprite
_08026E8C: .4byte 0x0000FBFF
_08026E90:
	ldr r1, [r5, #0x18]
	ldr r0, _08026F10 @ =0x08317590
	cmp r1, r0
	bne _08026EA8
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08026EA8
	ldr r0, _08026F14 @ =0x08317580
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
_08026EA8:
	ldr r5, _08026F18 @ =gCurrentSprite
	mov r0, r8
	cmp r0, #0
	bne _08026EB6
	ldrh r0, [r5, #2]
	subs r0, r0, r6
	strh r0, [r5, #2]
_08026EB6:
	adds r1, r5, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0x5e
	bls _08026EDA
	movs r3, #0
	strb r3, [r1]
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _08026F10 @ =0x08317590
	str r0, [r5, #0x18]
	strb r2, [r5, #0x1c]
	strh r3, [r5, #0x16]
_08026EDA:
	adds r4, r5, #0
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08026F2C
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08026F1C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08026F24
	ldrh r1, [r4]
	ldr r0, _08026F20 @ =0x0000FFBF
	ands r0, r1
	strh r0, [r4]
	b _08026F56
	.align 2, 0
_08026F10: .4byte 0x08317590
_08026F14: .4byte 0x08317580
_08026F18: .4byte gCurrentSprite
_08026F1C: .4byte gPreviousCollisionCheck
_08026F20: .4byte 0x0000FFBF
_08026F24:
	ldrh r0, [r4, #4]
	adds r0, #4
	strh r0, [r4, #4]
	b _08026F56
_08026F2C:
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08026F4C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08026F50
	ldrh r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r4]
	b _08026F56
	.align 2, 0
_08026F4C: .4byte gPreviousCollisionCheck
_08026F50:
	ldrh r0, [r5, #4]
	subs r0, #4
	strh r0, [r5, #4]
_08026F56:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start WaverCharging
WaverCharging: @ 0x08026F60
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _08026FBC @ =gCurrentSprite
	adds r3, r5, #0
	adds r3, #0x30
	ldrb r2, [r3]
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	lsrs r0, r0, #0x1b
	adds r4, r0, #6
	adds r6, r4, #0
	cmp r1, #0x27
	bhi _08026F7E
	adds r0, r2, #1
	strb r0, [r3]
_08026F7E:
	ldrh r1, [r5]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08026FCA
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08026FC0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08026FC4
	adds r1, r5, #0
	adds r1, #0x24
	movs r4, #0
	movs r0, #0x2b
	strb r0, [r1]
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _08026FF6
	.align 2, 0
_08026FBC: .4byte gCurrentSprite
_08026FC0: .4byte gPreviousCollisionCheck
_08026FC4:
	ldrh r0, [r5, #4]
	adds r0, r4, r0
	b _0802701C
_08026FCA:
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08027010 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08027018
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x2b
	strb r0, [r1]
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
_08026FF6:
	movs r0, #0x37
	bl SpriteSpawnSecondary
	ldrh r1, [r5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08027046
	ldr r0, _08027014 @ =0x000001A7
	bl SoundPlayNotAlreadyPlaying
	b _08027046
	.align 2, 0
_08027010: .4byte gPreviousCollisionCheck
_08027014: .4byte 0x000001A7
_08027018:
	ldrh r0, [r5, #4]
	subs r0, r0, r6
_0802701C:
	strh r0, [r5, #4]
	ldr r1, _08027050 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08027046
	movs r0, #0x14
	strb r0, [r2]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08027046
	movs r0, #0xd3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08027046:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027050: .4byte gCurrentSprite

	thumb_func_start WaverCrashingInit
WaverCrashingInit: @ 0x08027054
	ldr r1, _08027068 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x2c
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	bx lr
	.align 2, 0
_08027068: .4byte gCurrentSprite

	thumb_func_start WaverCrashing
WaverCrashing: @ 0x0802706C
	push {lr}
	ldr r1, _08027098 @ =gCurrentSprite
	ldrb r0, [r1, #0x1c]
	subs r0, #1
	strb r0, [r1, #0x1c]
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08027092
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #0x2e
	strb r1, [r0]
	movs r0, #0x44
	strb r0, [r2]
_08027092:
	pop {r0}
	bx r0
	.align 2, 0
_08027098: .4byte gCurrentSprite

	thumb_func_start WaverBackingOut
WaverBackingOut: @ 0x0802709C
	push {lr}
	ldr r2, _080270CC @ =gCurrentSprite
	ldrb r0, [r2, #0x1c]
	subs r0, #1
	strb r0, [r2, #0x1c]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _080270D4
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x30
	strb r1, [r0]
	ldr r0, _080270D0 @ =0x083175C0
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	b _080270EA
	.align 2, 0
_080270CC: .4byte gCurrentSprite
_080270D0: .4byte 0x083175C0
_080270D4:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080270E4
	ldrh r0, [r2, #4]
	subs r0, #1
	b _080270E8
_080270E4:
	ldrh r0, [r2, #4]
	adds r0, #1
_080270E8:
	strh r0, [r2, #4]
_080270EA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start WaverCheckBackingOutAnimEnded
WaverCheckBackingOutAnimEnded: @ 0x080270F0
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08027116
	ldr r2, _0802711C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x32
	strb r0, [r1]
	ldr r0, _08027120 @ =0x083175C0
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_08027116:
	pop {r0}
	bx r0
	.align 2, 0
_0802711C: .4byte gCurrentSprite
_08027120: .4byte 0x083175C0

	thumb_func_start WaverCheckTurningAnimNearEnded
WaverCheckTurningAnimNearEnded: @ 0x08027124
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _08027136
	ldr r0, _0802713C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_08027136:
	pop {r0}
	bx r0
	.align 2, 0
_0802713C: .4byte gCurrentSprite

	thumb_func_start WaverDebrisInit
WaverDebrisInit: @ 0x08027140
	push {r4, lr}
	ldr r0, _080271B0 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _080271B4 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _080271B8 @ =0x0000FFE0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	ldr r0, _080271BC @ =0x0000FFD8
	strh r0, [r2, #0xe]
	movs r0, #0x28
	strh r0, [r2, #0x10]
	ldr r0, _080271C0 @ =0x08317608
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r0, ip
	adds r0, #0x2e
	strb r1, [r0]
	adds r0, #3
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	subs r1, #2
	movs r0, #3
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080271B0: .4byte gCurrentSprite
_080271B4: .4byte 0x0000FFFB
_080271B8: .4byte 0x0000FFE0
_080271BC: .4byte 0x0000FFD8
_080271C0: .4byte 0x08317608

	thumb_func_start WaverDebrisFalling
WaverDebrisFalling: @ 0x080271C4
	push {r4, r5, r6, lr}
	ldr r4, _080271F4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r5, r0, #0
	cmp r5, #0
	bne _080271FC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	ldr r0, _080271F8 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027200
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x27
	bl ParticleSet
	strh r5, [r4]
	b _0802725A
	.align 2, 0
_080271F4: .4byte gCurrentSprite
_080271F8: .4byte gPreviousVerticalCollisionCheck
_080271FC:
	subs r0, #1
	strb r0, [r1]
_08027200:
	ldr r2, _0802722C @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _08027230 @ =0x08316414
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08027234 @ =0x00007FFF
	cmp r1, r0
	bne _08027238
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08027242
	.align 2, 0
_0802722C: .4byte gCurrentSprite
_08027230: .4byte 0x08316414
_08027234: .4byte 0x00007FFF
_08027238:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
_08027242:
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08027254
	ldrh r0, [r2, #4]
	adds r0, #4
	b _08027258
_08027254:
	ldrh r0, [r2, #4]
	subs r0, #4
_08027258:
	strh r0, [r2, #4]
_0802725A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start WaverDebrisExploding
WaverDebrisExploding: @ 0x08027260
	push {r4, lr}
	ldr r4, _08027278 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x25
	bl ParticleSet
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027278: .4byte gCurrentSprite

	thumb_func_start Waver
Waver: @ 0x0802727C
	push {r4, lr}
	ldr r4, _080272A8 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08027296
	movs r0, #0xd4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08027296:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _080272AC
	bl SpriteUtilUpdateFreezeTimer
	b _08027482
	.align 2, 0
_080272A8: .4byte gCurrentSprite
_080272AC:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _080272B8
	b _08027482
_080272B8:
	lsls r0, r0, #2
	ldr r1, _080272C4 @ =_080272C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080272C4: .4byte _080272C8
_080272C8: @ jump table
	.4byte _08027438 @ case 0
	.4byte _0802743E @ case 1
	.4byte _08027442 @ case 2
	.4byte _08027482 @ case 3
	.4byte _08027482 @ case 4
	.4byte _08027482 @ case 5
	.4byte _08027482 @ case 6
	.4byte _08027482 @ case 7
	.4byte _08027482 @ case 8
	.4byte _08027482 @ case 9
	.4byte _08027482 @ case 10
	.4byte _08027482 @ case 11
	.4byte _08027482 @ case 12
	.4byte _08027482 @ case 13
	.4byte _08027482 @ case 14
	.4byte _08027482 @ case 15
	.4byte _08027482 @ case 16
	.4byte _08027482 @ case 17
	.4byte _08027482 @ case 18
	.4byte _08027482 @ case 19
	.4byte _08027482 @ case 20
	.4byte _08027482 @ case 21
	.4byte _08027482 @ case 22
	.4byte _08027482 @ case 23
	.4byte _08027482 @ case 24
	.4byte _08027482 @ case 25
	.4byte _08027482 @ case 26
	.4byte _08027482 @ case 27
	.4byte _08027482 @ case 28
	.4byte _08027482 @ case 29
	.4byte _08027482 @ case 30
	.4byte _08027482 @ case 31
	.4byte _08027482 @ case 32
	.4byte _08027482 @ case 33
	.4byte _08027482 @ case 34
	.4byte _08027482 @ case 35
	.4byte _08027482 @ case 36
	.4byte _08027482 @ case 37
	.4byte _08027482 @ case 38
	.4byte _08027482 @ case 39
	.4byte _08027482 @ case 40
	.4byte _08027482 @ case 41
	.4byte _08027448 @ case 42
	.4byte _0802744E @ case 43
	.4byte _08027452 @ case 44
	.4byte _08027482 @ case 45
	.4byte _08027458 @ case 46
	.4byte _08027482 @ case 47
	.4byte _0802745E @ case 48
	.4byte _08027482 @ case 49
	.4byte _08027464 @ case 50
	.4byte _08027482 @ case 51
	.4byte _08027482 @ case 52
	.4byte _08027482 @ case 53
	.4byte _08027482 @ case 54
	.4byte _08027482 @ case 55
	.4byte _08027482 @ case 56
	.4byte _08027482 @ case 57
	.4byte _08027482 @ case 58
	.4byte _08027482 @ case 59
	.4byte _08027482 @ case 60
	.4byte _08027482 @ case 61
	.4byte _08027482 @ case 62
	.4byte _08027482 @ case 63
	.4byte _08027482 @ case 64
	.4byte _08027482 @ case 65
	.4byte _08027482 @ case 66
	.4byte _08027482 @ case 67
	.4byte _08027482 @ case 68
	.4byte _08027482 @ case 69
	.4byte _08027482 @ case 70
	.4byte _08027482 @ case 71
	.4byte _08027482 @ case 72
	.4byte _08027482 @ case 73
	.4byte _08027482 @ case 74
	.4byte _08027482 @ case 75
	.4byte _08027482 @ case 76
	.4byte _08027482 @ case 77
	.4byte _08027482 @ case 78
	.4byte _08027482 @ case 79
	.4byte _08027482 @ case 80
	.4byte _08027482 @ case 81
	.4byte _08027482 @ case 82
	.4byte _08027482 @ case 83
	.4byte _08027482 @ case 84
	.4byte _08027482 @ case 85
	.4byte _08027482 @ case 86
	.4byte _0802746A @ case 87
	.4byte _0802746E @ case 88
	.4byte _08027474 @ case 89
	.4byte _08027478 @ case 90
	.4byte _0802747E @ case 91
_08027438:
	bl WaverInit
	b _08027482
_0802743E:
	bl WaverFlyingInit
_08027442:
	bl WaverFlying
	b _08027482
_08027448:
	bl WaverCharging
	b _08027482
_0802744E:
	bl WaverCrashingInit
_08027452:
	bl WaverCrashing
	b _08027482
_08027458:
	bl WaverBackingOut
	b _08027482
_0802745E:
	bl WaverCheckBackingOutAnimEnded
	b _08027482
_08027464:
	bl WaverCheckTurningAnimNearEnded
	b _08027482
_0802746A:
	bl SpriteDyingInit
_0802746E:
	bl SpriteDying
	b _08027482
_08027474:
	bl WaverInit
_08027478:
	bl SpriteSpawningFromX
	b _08027482
_0802747E:
	bl XParasiteInit
_08027482:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start WaverExplosion
WaverExplosion: @ 0x08027488
	push {lr}
	ldr r0, _080274A8 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _080274AC
	cmp r0, #2
	beq _080274B0
	bl WaverDebrisExploding
	b _080274B4
	.align 2, 0
_080274A8: .4byte gCurrentSprite
_080274AC:
	bl WaverDebrisInit
_080274B0:
	bl WaverDebrisFalling
_080274B4:
	pop {r0}
	bx r0
