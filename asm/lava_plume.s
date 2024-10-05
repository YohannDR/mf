    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start LavaPlumeInit
LavaPlumeInit: @ 0x080344EC
	ldr r0, _08034574 @ =gCurrentSprite
	mov ip, r0
	ldr r2, _08034578 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r3, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	adds r1, #0x25
	movs r0, #4
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x68
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	movs r1, #0x10
	strb r1, [r0]
	mov r2, ip
	strh r3, [r2, #0xa]
	movs r0, #0xa0
	strh r0, [r2, #0xc]
	ldr r0, _0803457C @ =0x0000FFF0
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldrh r0, [r2, #2]
	adds r0, #0x1c
	strh r0, [r2, #2]
	strh r0, [r2, #6]
	ldrh r0, [r2, #4]
	strh r0, [r2, #8]
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r2, _08034580 @ =0x00008004
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	ldr r0, _08034584 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x78
	adds r1, #0x2f
	strb r0, [r1]
	ldr r0, _08034588 @ =0x0833FEB8
	mov r1, ip
	str r0, [r1, #0x18]
	strb r2, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_08034574: .4byte gCurrentSprite
_08034578: .4byte sPrimarySpriteStats
_0803457C: .4byte 0x0000FFF0
_08034580: .4byte 0x00008004
_08034584: .4byte gSpriteRandomNumber
_08034588: .4byte 0x0833FEB8

	thumb_func_start LavaPlumeGoUpInit
LavaPlumeGoUpInit: @ 0x0803458C
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _080345D4 @ =gCurrentSprite
	mov ip, r0
	ldr r0, _080345D8 @ =0x0833FE38
	mov r1, ip
	str r0, [r1, #0x18]
	movs r4, #0
	strb r4, [r1, #0x1c]
	strh r4, [r1, #0x16]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	mov r5, ip
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0x1c
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x2d
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080345D4: .4byte gCurrentSprite
_080345D8: .4byte 0x0833FE38

	thumb_func_start LavaPlumeGoUp
LavaPlumeGoUp: @ 0x080345DC
	push {r4, lr}
	ldr r4, _08034614 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803461C
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0803464E
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldrh r0, [r4]
	ldr r1, _08034618 @ =0x00007FFB
	ands r1, r0
	strh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803464E
	movs r0, #0xc2
	lsls r0, r0, #1
	bl SoundPlay
	b _0803464E
	.align 2, 0
_08034614: .4byte gCurrentSprite
_08034618: .4byte 0x00007FFB
_0803461C:
	ldrh r0, [r4, #6]
	subs r0, #0x40
	ldrh r2, [r4, #2]
	cmp r0, r2
	ble _08034636
	ldrh r1, [r4, #4]
	adds r0, r2, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08034654 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08034646
_08034636:
	ldr r4, _08034658 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0xe
	strh r0, [r4, #2]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803464E
_08034646:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_0803464E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034654: .4byte gPreviousCollisionCheck
_08034658: .4byte gCurrentSprite

	thumb_func_start LavaPlumeStopFromSamusContact
LavaPlumeStopFromSamusContact: @ 0x0803465C
	push {lr}
	movs r0, #0xc2
	lsls r0, r0, #1
	bl SoundStop
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LavaPlumeStopInit
LavaPlumeStopInit: @ 0x0803466C
	push {lr}
	ldr r1, _080346A0 @ =gCurrentSprite
	ldr r0, _080346A4 @ =0x0833FEC8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x18
	strb r0, [r2]
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _0803469C
	ldr r0, _080346A8 @ =0x00000185
	bl SoundPlay
_0803469C:
	pop {r0}
	bx r0
	.align 2, 0
_080346A0: .4byte gCurrentSprite
_080346A4: .4byte 0x0833FEC8
_080346A8: .4byte 0x00000185

	thumb_func_start LavaPlumeStop
LavaPlumeStop: @ 0x080346AC
	push {r4, lr}
	ldr r4, _080346F0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080346EA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #4
	movs r2, #0
	orrs r0, r1
	strh r0, [r4]
	ldr r0, _080346F4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x78
	adds r1, r4, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldr r0, _080346F8 @ =0x0833FEB8
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x16]
_080346EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080346F0: .4byte gCurrentSprite
_080346F4: .4byte gSpriteRandomNumber
_080346F8: .4byte 0x0833FEB8

	thumb_func_start LavaPlumeIdle
LavaPlumeIdle: @ 0x080346FC
	push {lr}
	ldr r1, _0803472C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x26
	movs r3, #1
	strb r3, [r0]
	adds r2, r1, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034726
	adds r0, r1, #0
	adds r0, #0x24
	strb r3, [r0]
	ldrh r0, [r1, #6]
	strh r0, [r1, #2]
	ldrh r0, [r1, #8]
	strh r0, [r1, #4]
_08034726:
	pop {r0}
	bx r0
	.align 2, 0
_0803472C: .4byte gCurrentSprite

	thumb_func_start LavaPlumeWarningInit
LavaPlumeWarningInit: @ 0x08034730
	push {r4, lr}
	ldr r0, _08034788 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803478C @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #5
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _08034790 @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08034794 @ =0x0833FDE0
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034788: .4byte gCurrentSprite
_0803478C: .4byte 0x0000FFFB
_08034790: .4byte 0x0000FFFC
_08034794: .4byte 0x0833FDE0

	thumb_func_start LavaPlumeWarningIdle
LavaPlumeWarningIdle: @ 0x08034798
	push {lr}
	ldr r2, _080347BC @ =gSpriteData
	ldr r3, _080347C0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _080347C4
	movs r0, #0
	strh r0, [r3]
	b _080347FA
	.align 2, 0
_080347BC: .4byte gSpriteData
_080347C0: .4byte gCurrentSprite
_080347C4:
	ldr r0, _080347E0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	bne _080347FA
	ldr r0, _080347E4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #7
	bls _080347EC
	ldr r0, [r3, #0x18]
	ldr r2, _080347E8 @ =0x0833FE08
	b _080347F0
	.align 2, 0
_080347E0: .4byte gFrameCounter8Bit
_080347E4: .4byte gSpriteRandomNumber
_080347E8: .4byte 0x0833FE08
_080347EC:
	ldr r0, [r3, #0x18]
	ldr r2, _08034800 @ =0x0833FDE0
_080347F0:
	cmp r0, r2
	beq _080347FA
	str r2, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
_080347FA:
	pop {r0}
	bx r0
	.align 2, 0
_08034800: .4byte 0x0833FDE0

	thumb_func_start LavaPlume
LavaPlume: @ 0x08034804
	push {lr}
	ldr r0, _0803481C @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	bls _08034812
	b _08034928
_08034812:
	lsls r0, r0, #2
	ldr r1, _08034820 @ =_08034824
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803481C: .4byte gCurrentSprite
_08034820: .4byte _08034824
_08034824: @ jump table
	.4byte _08034904 @ case 0
	.4byte _0803490A @ case 1
	.4byte _08034910 @ case 2
	.4byte _08034928 @ case 3
	.4byte _08034928 @ case 4
	.4byte _08034928 @ case 5
	.4byte _08034928 @ case 6
	.4byte _08034928 @ case 7
	.4byte _08034928 @ case 8
	.4byte _08034928 @ case 9
	.4byte _08034928 @ case 10
	.4byte _08034928 @ case 11
	.4byte _08034928 @ case 12
	.4byte _08034928 @ case 13
	.4byte _08034928 @ case 14
	.4byte _08034928 @ case 15
	.4byte _08034928 @ case 16
	.4byte _08034928 @ case 17
	.4byte _08034928 @ case 18
	.4byte _08034928 @ case 19
	.4byte _08034928 @ case 20
	.4byte _08034928 @ case 21
	.4byte _08034928 @ case 22
	.4byte _0803491A @ case 23
	.4byte _0803491E @ case 24
	.4byte _08034928 @ case 25
	.4byte _08034924 @ case 26
	.4byte _08034928 @ case 27
	.4byte _08034928 @ case 28
	.4byte _08034928 @ case 29
	.4byte _08034928 @ case 30
	.4byte _08034928 @ case 31
	.4byte _08034928 @ case 32
	.4byte _08034928 @ case 33
	.4byte _08034928 @ case 34
	.4byte _08034928 @ case 35
	.4byte _08034928 @ case 36
	.4byte _08034928 @ case 37
	.4byte _08034928 @ case 38
	.4byte _08034928 @ case 39
	.4byte _08034928 @ case 40
	.4byte _08034928 @ case 41
	.4byte _08034928 @ case 42
	.4byte _08034928 @ case 43
	.4byte _08034928 @ case 44
	.4byte _08034928 @ case 45
	.4byte _08034928 @ case 46
	.4byte _08034928 @ case 47
	.4byte _08034928 @ case 48
	.4byte _08034928 @ case 49
	.4byte _08034928 @ case 50
	.4byte _08034928 @ case 51
	.4byte _08034928 @ case 52
	.4byte _08034928 @ case 53
	.4byte _08034928 @ case 54
	.4byte _08034916 @ case 55
_08034904:
	bl LavaPlumeInit
	b _08034928
_0803490A:
	bl LavaPlumeGoUpInit
	b _08034928
_08034910:
	bl LavaPlumeGoUp
	b _08034928
_08034916:
	bl LavaPlumeStopFromSamusContact
_0803491A:
	bl LavaPlumeStopInit
_0803491E:
	bl LavaPlumeStop
	b _08034928
_08034924:
	bl LavaPlumeIdle
_08034928:
	pop {r0}
	bx r0

	thumb_func_start LavaPlumeWarning
LavaPlumeWarning: @ 0x0803492C
	push {lr}
	ldr r0, _08034948 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803494C
	cmp r0, #2
	beq _08034950
	b _08034954
	.align 2, 0
_08034948: .4byte gCurrentSprite
_0803494C:
	bl LavaPlumeWarningInit
_08034950:
	bl LavaPlumeWarningIdle
_08034954:
	pop {r0}
	bx r0
