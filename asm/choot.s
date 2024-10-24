    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ChootSetOpenHitbox
ChootSetOpenHitbox: @ 0x0803F57C
	ldr r1, _0803F590 @ =gCurrentSprite
	ldr r0, _0803F594 @ =0x0000FFE0
	strh r0, [r1, #0xa]
	movs r0, #4
	strh r0, [r1, #0xc]
	ldr r0, _0803F598 @ =0x0000FFC4
	strh r0, [r1, #0xe]
	movs r0, #0x3c
	strh r0, [r1, #0x10]
	bx lr
	.align 2, 0
_0803F590: .4byte gCurrentSprite
_0803F594: .4byte 0x0000FFE0
_0803F598: .4byte 0x0000FFC4

	thumb_func_start ChootSetClosedHitbox
ChootSetClosedHitbox: @ 0x0803F59C
	ldr r1, _0803F5B0 @ =gCurrentSprite
	ldr r0, _0803F5B4 @ =0x0000FFD0
	strh r0, [r1, #0xa]
	movs r0, #0xc
	strh r0, [r1, #0xc]
	ldr r0, _0803F5B8 @ =0x0000FFE0
	strh r0, [r1, #0xe]
	movs r0, #0x20
	strh r0, [r1, #0x10]
	bx lr
	.align 2, 0
_0803F5B0: .4byte gCurrentSprite
_0803F5B4: .4byte 0x0000FFD0
_0803F5B8: .4byte 0x0000FFE0

	thumb_func_start ChootInit
ChootInit: @ 0x0803F5BC
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803F5E8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F5EC
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803F5EC
	strh r0, [r2]
	b _0803F650
	.align 2, 0
_0803F5E8: .4byte gCurrentSprite
_0803F5EC:
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	ldr r5, _0803F640 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x27
	movs r4, #0
	movs r2, #0x10
	strb r2, [r0]
	adds r1, r5, #0
	adds r1, #0x28
	movs r0, #8
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x29
	strb r2, [r0]
	bl ChootSetOpenHitbox
	ldr r0, _0803F644 @ =0x083598FC
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	ldr r2, _0803F648 @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803F64C
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r5, #6]
	b _0803F650
	.align 2, 0
_0803F640: .4byte gCurrentSprite
_0803F644: .4byte 0x083598FC
_0803F648: .4byte sPrimarySpriteStats
_0803F64C:
	movs r0, #1
	strb r0, [r1]
_0803F650:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ChootIdleInit
ChootIdleInit: @ 0x0803F658
	ldr r1, _0803F670 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803F674 @ =0x083598FC
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0803F670: .4byte gCurrentSprite
_0803F674: .4byte 0x083598FC

	thumb_func_start ChootIdle
ChootIdle: @ 0x0803F678
	push {r4, r5, lr}
	ldr r4, _0803F6D8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803F6D2
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803F6DC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F6AA
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803F6CA
_0803F6AA:
	ldr r0, _0803F6E0 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x48
	ldr r4, _0803F6D8 @ =gCurrentSprite
	ldrh r1, [r4, #2]
	cmp r0, r1
	bgt _0803F6D2
	movs r0, #0xa0
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F6D2
_0803F6CA:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
_0803F6D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F6D8: .4byte gCurrentSprite
_0803F6DC: .4byte gPreviousCollisionCheck
_0803F6E0: .4byte gSamusData

	thumb_func_start ChootLaunchingInit
ChootLaunchingInit: @ 0x0803F6E4
	ldr r1, _0803F6F8 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0803F6FC @ =0x0835990C
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803F6F8: .4byte gCurrentSprite
_0803F6FC: .4byte 0x0835990C

	thumb_func_start ChootLaunching
ChootLaunching: @ 0x0803F700
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803F712
	ldr r0, _0803F718 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2b
	strb r1, [r0]
_0803F712:
	pop {r0}
	bx r0
	.align 2, 0
_0803F718: .4byte gCurrentSprite

	thumb_func_start ChootGoingUpInit
ChootGoingUpInit: @ 0x0803F71C
	push {r4, lr}
	ldr r4, _0803F758 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r4, #0x1c]
	movs r2, #0
	strh r0, [r4, #0x16]
	ldr r0, _0803F75C @ =0x08359924
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x31
	strb r2, [r0]
	bl ChootSetClosedHitbox
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F750
	movs r0, #0xd1
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803F750:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F758: .4byte gCurrentSprite
_0803F75C: .4byte 0x08359924

	thumb_func_start ChootGoingUp
ChootGoingUp: @ 0x0803F760
	push {r4, r5, r6, lr}
	ldr r4, _0803F7AC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803F7B0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F7A2
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803F7A2
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r1, _0803F7B4 @ =0x08358F64
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803F7B8 @ =0x00007FFF
	cmp r1, r0
	bne _0803F7BC
_0803F7A2:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2d
	strb r0, [r1]
	b _0803F7C6
	.align 2, 0
_0803F7AC: .4byte gCurrentSprite
_0803F7B0: .4byte gPreviousCollisionCheck
_0803F7B4: .4byte 0x08358F64
_0803F7B8: .4byte 0x00007FFF
_0803F7BC:
	adds r0, r2, #1
	strb r0, [r5]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
_0803F7C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ChootOpeningInit
ChootOpeningInit: @ 0x0803F7CC
	push {lr}
	ldr r1, _0803F7E8 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0803F7EC @ =0x08359934
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
	bl ChootSetOpenHitbox
	pop {r0}
	bx r0
	.align 2, 0
_0803F7E8: .4byte gCurrentSprite
_0803F7EC: .4byte 0x08359934

	thumb_func_start ChootOpening
ChootOpening: @ 0x0803F7F0
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803F802
	ldr r0, _0803F808 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
_0803F802:
	pop {r0}
	bx r0
	.align 2, 0
_0803F808: .4byte gCurrentSprite

	thumb_func_start ChootGoingDownInit
ChootGoingDownInit: @ 0x0803F80C
	ldr r0, _0803F828 @ =gCurrentSprite
	movs r1, #0
	strb r1, [r0, #0x1c]
	movs r3, #0
	strh r1, [r0, #0x16]
	ldr r1, _0803F82C @ =0x0835995C
	str r1, [r0, #0x18]
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x30
	strb r1, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	bx lr
	.align 2, 0
_0803F828: .4byte gCurrentSprite
_0803F82C: .4byte 0x0835995C

	thumb_func_start ChootGoingDown
ChootGoingDown: @ 0x0803F830
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0803F850 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803F854 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803F858
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	b _0803F8B8
	.align 2, 0
_0803F850: .4byte gCurrentSprite
_0803F854: .4byte gPreviousCollisionCheck
_0803F858:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803F870
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	b _0803F8B8
_0803F870:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r1, #0x3f
	ands r1, r0
	cmp r1, #0
	bne _0803F8B0
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x3e
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803F8B0
	ldr r0, _0803F8C4 @ =0x000001A3
	bl SoundPlayNotAlreadyPlaying
_0803F8B0:
	ldr r1, _0803F8C8 @ =gCurrentSprite
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
_0803F8B8:
	strb r0, [r1]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803F8C4: .4byte 0x000001A3
_0803F8C8: .4byte gCurrentSprite

	thumb_func_start ChootSpitInit
ChootSpitInit: @ 0x0803F8CC
	push {r4, lr}
	ldr r0, _0803F934 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803F938 @ =0x0000FFFB
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
	strb r3, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0803F93C @ =0x0000FFE0
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r4, [r2, #0xc]
	adds r0, #0x10
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	mov r1, ip
	adds r1, #0x25
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0803F940 @ =0x08359984
	str r0, [r2, #0x18]
	adds r1, #0xc
	movs r0, #8
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F934: .4byte gCurrentSprite
_0803F938: .4byte 0x0000FFFB
_0803F93C: .4byte 0x0000FFE0
_0803F940: .4byte 0x08359984

	thumb_func_start ChootSpitSpawning
ChootSpitSpawning: @ 0x0803F944
	push {lr}
	ldr r2, _0803F97C @ =gCurrentSprite
	ldrh r0, [r2, #2]
	adds r0, #1
	movs r3, #0
	strh r0, [r2, #2]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0803F976
	strb r3, [r2, #0x1c]
	strh r0, [r2, #0x16]
	ldr r0, _0803F980 @ =0x08359994
	str r0, [r2, #0x18]
	subs r1, #0xa
	movs r0, #0x16
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r3, [r0]
_0803F976:
	pop {r0}
	bx r0
	.align 2, 0
_0803F97C: .4byte gCurrentSprite
_0803F980: .4byte 0x08359994

	thumb_func_start ChootSpitExplodingInit
ChootSpitExplodingInit: @ 0x0803F984
	push {r4, lr}
	ldr r4, _0803F9A4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803F9A8 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803F9B0
	ldr r0, _0803F9AC @ =0x083599CC
	b _0803F9B2
	.align 2, 0
_0803F9A4: .4byte gCurrentSprite
_0803F9A8: .4byte gPreviousCollisionCheck
_0803F9AC: .4byte 0x083599CC
_0803F9B0:
	ldr r0, _0803F9C8 @ =0x083599A4
_0803F9B2:
	str r0, [r4, #0x18]
	ldr r0, _0803F9CC @ =gCurrentSprite
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F9C8: .4byte 0x083599A4
_0803F9CC: .4byte gCurrentSprite

	thumb_func_start ChootSpitExploding
ChootSpitExploding: @ 0x0803F9D0
	push {r4, lr}
	ldr r4, _0803F9F0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803F9E8
	movs r0, #0
	strh r0, [r4]
_0803F9E8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803F9F0: .4byte gCurrentSprite

	thumb_func_start Choot
Choot: @ 0x0803F9F4
	push {r4, lr}
	ldr r4, _0803FA20 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803FA0E
	movs r0, #0xd2
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803FA0E:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803FA24
	bl SpriteUtilUpdateFreezeTimer
	b _0803FC00
	.align 2, 0
_0803FA20: .4byte gCurrentSprite
_0803FA24:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803FA30
	b _0803FC00
_0803FA30:
	lsls r0, r0, #2
	ldr r1, _0803FA3C @ =_0803FA40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FA3C: .4byte _0803FA40
_0803FA40: @ jump table
	.4byte _0803FBB0 @ case 0
	.4byte _0803FBB6 @ case 1
	.4byte _0803FBBA @ case 2
	.4byte _0803FC00 @ case 3
	.4byte _0803FC00 @ case 4
	.4byte _0803FC00 @ case 5
	.4byte _0803FC00 @ case 6
	.4byte _0803FC00 @ case 7
	.4byte _0803FC00 @ case 8
	.4byte _0803FC00 @ case 9
	.4byte _0803FC00 @ case 10
	.4byte _0803FC00 @ case 11
	.4byte _0803FC00 @ case 12
	.4byte _0803FC00 @ case 13
	.4byte _0803FC00 @ case 14
	.4byte _0803FC00 @ case 15
	.4byte _0803FC00 @ case 16
	.4byte _0803FC00 @ case 17
	.4byte _0803FC00 @ case 18
	.4byte _0803FC00 @ case 19
	.4byte _0803FC00 @ case 20
	.4byte _0803FC00 @ case 21
	.4byte _0803FC00 @ case 22
	.4byte _0803FC00 @ case 23
	.4byte _0803FC00 @ case 24
	.4byte _0803FC00 @ case 25
	.4byte _0803FC00 @ case 26
	.4byte _0803FC00 @ case 27
	.4byte _0803FC00 @ case 28
	.4byte _0803FC00 @ case 29
	.4byte _0803FC00 @ case 30
	.4byte _0803FC00 @ case 31
	.4byte _0803FC00 @ case 32
	.4byte _0803FC00 @ case 33
	.4byte _0803FC00 @ case 34
	.4byte _0803FC00 @ case 35
	.4byte _0803FC00 @ case 36
	.4byte _0803FC00 @ case 37
	.4byte _0803FC00 @ case 38
	.4byte _0803FC00 @ case 39
	.4byte _0803FC00 @ case 40
	.4byte _0803FBC0 @ case 41
	.4byte _0803FBC4 @ case 42
	.4byte _0803FBCA @ case 43
	.4byte _0803FBCE @ case 44
	.4byte _0803FBD4 @ case 45
	.4byte _0803FBD8 @ case 46
	.4byte _0803FBDE @ case 47
	.4byte _0803FBE2 @ case 48
	.4byte _0803FC00 @ case 49
	.4byte _0803FC00 @ case 50
	.4byte _0803FC00 @ case 51
	.4byte _0803FC00 @ case 52
	.4byte _0803FC00 @ case 53
	.4byte _0803FC00 @ case 54
	.4byte _0803FC00 @ case 55
	.4byte _0803FC00 @ case 56
	.4byte _0803FC00 @ case 57
	.4byte _0803FC00 @ case 58
	.4byte _0803FC00 @ case 59
	.4byte _0803FC00 @ case 60
	.4byte _0803FC00 @ case 61
	.4byte _0803FC00 @ case 62
	.4byte _0803FC00 @ case 63
	.4byte _0803FC00 @ case 64
	.4byte _0803FC00 @ case 65
	.4byte _0803FC00 @ case 66
	.4byte _0803FC00 @ case 67
	.4byte _0803FC00 @ case 68
	.4byte _0803FC00 @ case 69
	.4byte _0803FC00 @ case 70
	.4byte _0803FC00 @ case 71
	.4byte _0803FC00 @ case 72
	.4byte _0803FC00 @ case 73
	.4byte _0803FC00 @ case 74
	.4byte _0803FC00 @ case 75
	.4byte _0803FC00 @ case 76
	.4byte _0803FC00 @ case 77
	.4byte _0803FC00 @ case 78
	.4byte _0803FC00 @ case 79
	.4byte _0803FC00 @ case 80
	.4byte _0803FC00 @ case 81
	.4byte _0803FC00 @ case 82
	.4byte _0803FC00 @ case 83
	.4byte _0803FC00 @ case 84
	.4byte _0803FC00 @ case 85
	.4byte _0803FC00 @ case 86
	.4byte _0803FBE8 @ case 87
	.4byte _0803FBEC @ case 88
	.4byte _0803FBF2 @ case 89
	.4byte _0803FBF6 @ case 90
	.4byte _0803FBFC @ case 91
_0803FBB0:
	bl ChootInit
	b _0803FC00
_0803FBB6:
	bl ChootIdleInit
_0803FBBA:
	bl ChootIdle
	b _0803FC00
_0803FBC0:
	bl ChootLaunchingInit
_0803FBC4:
	bl ChootLaunching
	b _0803FC00
_0803FBCA:
	bl ChootGoingUpInit
_0803FBCE:
	bl ChootGoingUp
	b _0803FC00
_0803FBD4:
	bl ChootOpeningInit
_0803FBD8:
	bl ChootOpening
	b _0803FC00
_0803FBDE:
	bl ChootGoingDownInit
_0803FBE2:
	bl ChootGoingDown
	b _0803FC00
_0803FBE8:
	bl SpriteDyingInit
_0803FBEC:
	bl SpriteDying
	b _0803FC00
_0803FBF2:
	bl ChootInit
_0803FBF6:
	bl SpriteSpawningFromX
	b _0803FC00
_0803FBFC:
	bl XParasiteInit
_0803FC00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ChootSpit
ChootSpit: @ 0x0803FC08
	push {lr}
	ldr r0, _0803FC20 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	bls _0803FC16
	b _0803FD22
_0803FC16:
	lsls r0, r0, #2
	ldr r1, _0803FC24 @ =_0803FC28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803FC20: .4byte gCurrentSprite
_0803FC24: .4byte _0803FC28
_0803FC28: @ jump table
	.4byte _0803FD08 @ case 0
	.4byte _0803FD22 @ case 1
	.4byte _0803FD0E @ case 2
	.4byte _0803FD22 @ case 3
	.4byte _0803FD22 @ case 4
	.4byte _0803FD22 @ case 5
	.4byte _0803FD22 @ case 6
	.4byte _0803FD14 @ case 7
	.4byte _0803FD18 @ case 8
	.4byte _0803FD22 @ case 9
	.4byte _0803FD22 @ case 10
	.4byte _0803FD22 @ case 11
	.4byte _0803FD22 @ case 12
	.4byte _0803FD22 @ case 13
	.4byte _0803FD22 @ case 14
	.4byte _0803FD22 @ case 15
	.4byte _0803FD22 @ case 16
	.4byte _0803FD22 @ case 17
	.4byte _0803FD22 @ case 18
	.4byte _0803FD22 @ case 19
	.4byte _0803FD22 @ case 20
	.4byte _0803FD22 @ case 21
	.4byte _0803FD1E @ case 22
	.4byte _0803FD22 @ case 23
	.4byte _0803FD22 @ case 24
	.4byte _0803FD22 @ case 25
	.4byte _0803FD22 @ case 26
	.4byte _0803FD22 @ case 27
	.4byte _0803FD22 @ case 28
	.4byte _0803FD22 @ case 29
	.4byte _0803FD22 @ case 30
	.4byte _0803FD22 @ case 31
	.4byte _0803FD22 @ case 32
	.4byte _0803FD22 @ case 33
	.4byte _0803FD22 @ case 34
	.4byte _0803FD22 @ case 35
	.4byte _0803FD22 @ case 36
	.4byte _0803FD22 @ case 37
	.4byte _0803FD22 @ case 38
	.4byte _0803FD22 @ case 39
	.4byte _0803FD22 @ case 40
	.4byte _0803FD22 @ case 41
	.4byte _0803FD22 @ case 42
	.4byte _0803FD22 @ case 43
	.4byte _0803FD22 @ case 44
	.4byte _0803FD22 @ case 45
	.4byte _0803FD22 @ case 46
	.4byte _0803FD22 @ case 47
	.4byte _0803FD22 @ case 48
	.4byte _0803FD22 @ case 49
	.4byte _0803FD22 @ case 50
	.4byte _0803FD22 @ case 51
	.4byte _0803FD22 @ case 52
	.4byte _0803FD22 @ case 53
	.4byte _0803FD22 @ case 54
	.4byte _0803FD14 @ case 55
_0803FD08:
	bl ChootSpitInit
	b _0803FD22
_0803FD0E:
	bl ChootSpitSpawning
	b _0803FD22
_0803FD14:
	bl ChootSpitExplodingInit
_0803FD18:
	bl ChootSpitExploding
	b _0803FD22
_0803FD1E:
	bl SpriteUtilCurrentSpriteFalling
_0803FD22:
	pop {r0}
	bx r0
	.align 2, 0
