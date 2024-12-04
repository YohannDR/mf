    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SkulteraSetSidesHitboxes
SkulteraSetSidesHitboxes: @ 0x0803A250
	push {lr}
	ldr r2, _0803A270 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803A284
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A278
	ldr r0, _0803A274 @ =0x0000FFE8
	strh r0, [r2, #0xe]
	movs r0, #0x28
	b _0803A2A2
	.align 2, 0
_0803A270: .4byte gCurrentSprite
_0803A274: .4byte 0x0000FFE8
_0803A278:
	ldr r0, _0803A280 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x20
	b _0803A2A2
	.align 2, 0
_0803A280: .4byte 0x0000FFF0
_0803A284:
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A29C
	ldr r0, _0803A298 @ =0x0000FFD8
	strh r0, [r2, #0xe]
	movs r0, #0x18
	b _0803A2A2
	.align 2, 0
_0803A298: .4byte 0x0000FFD8
_0803A29C:
	ldr r0, _0803A2A8 @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x10
_0803A2A2:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0803A2A8: .4byte 0x0000FFE0

	thumb_func_start SkulteraXMovement
SkulteraXMovement: @ 0x0803A2AC
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _0803A2D0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0803A2F8
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A2D4
	ldrh r0, [r4, #4]
	adds r0, #0x38
	b _0803A2D8
	.align 2, 0
_0803A2D0: .4byte gCurrentSprite
_0803A2D4:
	ldrh r0, [r4, #4]
	adds r0, #0x28
_0803A2D8:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803A2F4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0803A320
	ldrh r0, [r4, #4]
	adds r0, r5, r0
	b _0803A32C
	.align 2, 0
_0803A2F4: .4byte gPreviousCollisionCheck
_0803A2F8:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A308
	ldrh r0, [r4, #4]
	subs r0, #0x38
	b _0803A30C
_0803A308:
	ldrh r0, [r4, #4]
	subs r0, #0x28
_0803A30C:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803A324 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0803A328
_0803A320:
	movs r0, #1
	b _0803A330
	.align 2, 0
_0803A324: .4byte gPreviousCollisionCheck
_0803A328:
	ldrh r0, [r4, #4]
	subs r0, r0, r5
_0803A32C:
	strh r0, [r4, #4]
	movs r0, #0
_0803A330:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SkulteraTurningIntoX
SkulteraTurningIntoX: @ 0x0803A338
	push {lr}
	sub sp, #0x10
	ldr r2, _0803A370 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A374
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	subs r0, #0x30
	str r0, [sp, #4]
	ldrh r0, [r2, #4]
	subs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _0803A37A
	.align 2, 0
_0803A370: .4byte gCurrentSprite
_0803A374:
	ldrh r0, [r2, #2]
	subs r0, #0x20
	strh r0, [r2, #2]
_0803A37A:
	add sp, #0x10
	pop {r0}
	bx r0

	thumb_func_start SkulteraInit
SkulteraInit: @ 0x0803A380
	push {r4, r5, lr}
	ldr r2, _0803A3B4 @ =gCurrentSprite
	adds r4, r2, #0
	adds r4, #0x24
	ldrb r3, [r4]
	cmp r3, #0
	bne _0803A3D8
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _0803A3C2
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803A3B8
	adds r0, r2, #0
	adds r0, #0x2d
	strb r3, [r0]
	b _0803A3C6
	.align 2, 0
_0803A3B4: .4byte gCurrentSprite
_0803A3B8:
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	b _0803A3C6
_0803A3C2:
	strh r3, [r2]
	b _0803A498
_0803A3C6:
	bl SpriteUtilChooseRandomXFlip
	ldr r0, _0803A3D4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	b _0803A3EA
	.align 2, 0
_0803A3D4: .4byte gCurrentSprite
_0803A3D8:
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x5a
	strb r0, [r4]
	movs r0, #0x2c
	strh r0, [r2, #6]
_0803A3EA:
	ldr r1, _0803A440 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x25
	movs r4, #0
	movs r0, #2
	strb r0, [r2]
	strb r4, [r1, #0x1c]
	movs r5, #0
	strh r4, [r1, #0x16]
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #2
	bne _0803A44C
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0803A444 @ =sSkulteraOam_34f074
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0803A448 @ =0x0000FF80
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r1, #0xc
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x6a
	strb r0, [r3, #0x1d]
	b _0803A484
	.align 2, 0
_0803A440: .4byte gCurrentSprite
_0803A444: .4byte sSkulteraOam_34f074
_0803A448: .4byte 0x0000FF80
_0803A44C:
	ldr r0, _0803A4A0 @ =sSkulteraOam_34efec
	str r0, [r3, #0x18]
	ldrb r0, [r3, #0x1d]
	cmp r0, #0xb5
	beq _0803A462
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
_0803A462:
	adds r0, r3, #0
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x28
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x29
	strb r2, [r0]
	ldr r0, _0803A4A4 @ =0x0000FFC0
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r1, #0xe
	movs r0, #1
	strb r0, [r1]
_0803A484:
	ldr r2, _0803A4A8 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	bl SkulteraSetSidesHitboxes
_0803A498:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A4A0: .4byte sSkulteraOam_34efec
_0803A4A4: .4byte 0x0000FFC0
_0803A4A8: .4byte sPrimarySpriteStats

	thumb_func_start SkulteraIdleInit
SkulteraIdleInit: @ 0x0803A4AC
	push {lr}
	ldr r0, _0803A4DC @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0, #4]
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1, #8]
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	strb r2, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A4E4
	ldr r0, _0803A4E0 @ =sSkulteraOam_34f074
	mov r1, ip
	str r0, [r1, #0x18]
	adds r1, #0x2e
	movs r0, #3
	b _0803A4EE
	.align 2, 0
_0803A4DC: .4byte gCurrentSprite
_0803A4E0: .4byte sSkulteraOam_34f074
_0803A4E4:
	ldr r0, _0803A4F4 @ =sSkulteraOam_34efec
	mov r1, ip
	str r0, [r1, #0x18]
	adds r1, #0x2e
	movs r0, #4
_0803A4EE:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0803A4F4: .4byte sSkulteraOam_34efec

	thumb_func_start SkulteraIdle
SkulteraIdle: @ 0x0803A4F8
	push {r4, lr}
	ldr r4, _0803A520 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A572
	movs r0, #4
	bl SkulteraXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A524
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	b _0803A570
	.align 2, 0
_0803A520: .4byte gCurrentSprite
_0803A524:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803A53E
	ldrh r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	cmp r0, r1
	bge _0803A552
	b _0803A54A
_0803A53E:
	ldrh r0, [r4, #8]
	ldr r1, _0803A564 @ =0xFFFFFE00
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	cmp r0, r1
	ble _0803A552
_0803A54A:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0803A552:
	ldr r1, _0803A568 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A56C
	adds r1, #0x2e
	movs r0, #3
	b _0803A570
	.align 2, 0
_0803A564: .4byte 0xFFFFFE00
_0803A568: .4byte gCurrentSprite
_0803A56C:
	adds r1, #0x2e
	movs r0, #4
_0803A570:
	strb r0, [r1]
_0803A572:
	ldr r0, _0803A5AC @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A5D2
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #0x40
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	bne _0803A5D2
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r0, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldr r3, _0803A5B0 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803A5BA
	cmp r2, #8
	bne _0803A5B4
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0803A5D0
	.align 2, 0
_0803A5AC: .4byte 0x03001346
_0803A5B0: .4byte gCurrentSprite
_0803A5B4:
	cmp r2, #4
	bne _0803A5D2
	b _0803A5CA
_0803A5BA:
	cmp r2, #4
	bne _0803A5C6
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0803A5D0
_0803A5C6:
	cmp r2, #8
	bne _0803A5D2
_0803A5CA:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #3
_0803A5D0:
	strb r0, [r1]
_0803A5D2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SkulteraChasingSamusInit
SkulteraChasingSamusInit: @ 0x0803A5D8
	push {lr}
	ldr r3, _0803A5F8 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x2a
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A600
	ldr r0, _0803A5FC @ =sSkulteraOam_34f0e4
	b _0803A602
	.align 2, 0
_0803A5F8: .4byte gCurrentSprite
_0803A5FC: .4byte sSkulteraOam_34f0e4
_0803A600:
	ldr r0, _0803A608 @ =sSkulteraOam_34f054
_0803A602:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0803A608: .4byte sSkulteraOam_34f054

	thumb_func_start SkulteraChasingSamus
SkulteraChasingSamus: @ 0x0803A60C
	push {r4, r5, lr}
	ldr r2, _0803A654 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _0803A658 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r2
	ble _0803A664
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803A65C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A682
	ldr r0, _0803A660 @ =gCurrentAffectingClipdata
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _0803A682
	ldrh r0, [r4, #2]
	subs r0, #2
	b _0803A680
	.align 2, 0
_0803A654: .4byte gSamusData
_0803A658: .4byte gCurrentSprite
_0803A65C: .4byte gPreviousCollisionCheck
_0803A660: .4byte gCurrentAffectingClipdata
_0803A664:
	adds r0, r1, #0
	adds r0, #0x40
	cmp r0, r2
	bge _0803A682
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803A6AC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A682
	ldrh r0, [r4, #2]
	adds r0, #2
_0803A680:
	strh r0, [r4, #2]
_0803A682:
	ldr r4, _0803A6B0 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A6C2
	movs r0, #4
	bl SkulteraXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803A6B4
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0803A6C2
	.align 2, 0
_0803A6AC: .4byte gPreviousCollisionCheck
_0803A6B0: .4byte gCurrentSprite
_0803A6B4:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803A6C0
	movs r0, #3
_0803A6C0:
	strb r0, [r5]
_0803A6C2:
	ldr r0, _0803A6D4 @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803A6DC
	ldr r0, _0803A6D8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	b _0803A730
	.align 2, 0
_0803A6D4: .4byte 0x03001346
_0803A6D8: .4byte gCurrentSprite
_0803A6DC:
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #0x40
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	bne _0803A730
	movs r1, #0xa0
	lsls r1, r1, #1
	movs r0, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldr r3, _0803A714 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803A718
	cmp r2, #8
	beq _0803A730
	cmp r2, #4
	bne _0803A728
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #3
	b _0803A72E
	.align 2, 0
_0803A714: .4byte gCurrentSprite
_0803A718:
	cmp r2, #4
	beq _0803A730
	cmp r2, #8
	bne _0803A728
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #3
	b _0803A72E
_0803A728:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #1
_0803A72E:
	strb r0, [r1]
_0803A730:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SkulteraTurningAroundInit
SkulteraTurningAroundInit: @ 0x0803A738
	push {lr}
	ldr r3, _0803A77C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2d
	ldrb r1, [r0]
	cmp r1, #2
	bne _0803A78C
	ldr r0, _0803A780 @ =sSkulteraOam_34f09c
	str r0, [r3, #0x18]
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	bne _0803A7B2
	ldr r0, _0803A784 @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A7B2
	ands r1, r2
	cmp r1, #0
	beq _0803A7B2
	ldr r0, _0803A788 @ =0x00000193
	bl SoundPlayNotAlreadyPlaying
	b _0803A7B2
	.align 2, 0
_0803A77C: .4byte gCurrentSprite
_0803A780: .4byte sSkulteraOam_34f09c
_0803A784: .4byte 0x03001346
_0803A788: .4byte 0x00000193
_0803A78C:
	ldr r0, _0803A7B8 @ =sSkulteraOam_34f00c
	str r0, [r3, #0x18]
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	bne _0803A7B2
	ldr r0, _0803A7BC @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A7B2
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0803A7B2
	ldr r0, _0803A7C0 @ =0x00000191
	bl SoundPlayNotAlreadyPlaying
_0803A7B2:
	pop {r0}
	bx r0
	.align 2, 0
_0803A7B8: .4byte sSkulteraOam_34f00c
_0803A7BC: .4byte 0x03001346
_0803A7C0: .4byte 0x00000191

	thumb_func_start SkulteraTurningAround
SkulteraTurningAround: @ 0x0803A7C4
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803A7E0
	bl SkulteraIdleInit
	ldr r0, _0803A7E4 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r2, #0x40
	eors r1, r2
	strh r1, [r0]
	bl SkulteraSetSidesHitboxes
_0803A7E0:
	pop {r0}
	bx r0
	.align 2, 0
_0803A7E4: .4byte gCurrentSprite

	thumb_func_start Skultera
Skultera: @ 0x0803A7E8
	push {lr}
	ldr r1, _0803A810 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0803A814
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803A82A
	movs r0, #0xca
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0803A82A
	.align 2, 0
_0803A810: .4byte gCurrentSprite
_0803A814:
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803A82A
	movs r0, #0xc9
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803A82A:
	ldr r1, _0803A83C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803A840
	bl SpriteUtilUpdateFreezeTimer
	b _0803AA0E
	.align 2, 0
_0803A83C: .4byte gCurrentSprite
_0803A840:
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803A84C
	b _0803AA0E
_0803A84C:
	lsls r0, r0, #2
	ldr r1, _0803A858 @ =_0803A85C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803A858: .4byte _0803A85C
_0803A85C: @ jump table
	.4byte _0803A9CC @ case 0
	.4byte _0803A9D2 @ case 1
	.4byte _0803A9D8 @ case 2
	.4byte _0803A9DE @ case 3
	.4byte _0803A9E2 @ case 4
	.4byte _0803AA0E @ case 5
	.4byte _0803AA0E @ case 6
	.4byte _0803AA0E @ case 7
	.4byte _0803AA0E @ case 8
	.4byte _0803AA0E @ case 9
	.4byte _0803AA0E @ case 10
	.4byte _0803AA0E @ case 11
	.4byte _0803AA0E @ case 12
	.4byte _0803AA0E @ case 13
	.4byte _0803AA0E @ case 14
	.4byte _0803AA0E @ case 15
	.4byte _0803AA0E @ case 16
	.4byte _0803AA0E @ case 17
	.4byte _0803AA0E @ case 18
	.4byte _0803AA0E @ case 19
	.4byte _0803AA0E @ case 20
	.4byte _0803AA0E @ case 21
	.4byte _0803AA0E @ case 22
	.4byte _0803AA0E @ case 23
	.4byte _0803AA0E @ case 24
	.4byte _0803AA0E @ case 25
	.4byte _0803AA0E @ case 26
	.4byte _0803AA0E @ case 27
	.4byte _0803AA0E @ case 28
	.4byte _0803AA0E @ case 29
	.4byte _0803AA0E @ case 30
	.4byte _0803AA0E @ case 31
	.4byte _0803AA0E @ case 32
	.4byte _0803AA0E @ case 33
	.4byte _0803AA0E @ case 34
	.4byte _0803AA0E @ case 35
	.4byte _0803AA0E @ case 36
	.4byte _0803AA0E @ case 37
	.4byte _0803AA0E @ case 38
	.4byte _0803AA0E @ case 39
	.4byte _0803AA0E @ case 40
	.4byte _0803A9E8 @ case 41
	.4byte _0803A9EC @ case 42
	.4byte _0803AA0E @ case 43
	.4byte _0803AA0E @ case 44
	.4byte _0803AA0E @ case 45
	.4byte _0803AA0E @ case 46
	.4byte _0803AA0E @ case 47
	.4byte _0803AA0E @ case 48
	.4byte _0803AA0E @ case 49
	.4byte _0803AA0E @ case 50
	.4byte _0803AA0E @ case 51
	.4byte _0803AA0E @ case 52
	.4byte _0803AA0E @ case 53
	.4byte _0803AA0E @ case 54
	.4byte _0803AA0E @ case 55
	.4byte _0803AA0E @ case 56
	.4byte _0803AA0E @ case 57
	.4byte _0803AA0E @ case 58
	.4byte _0803AA0E @ case 59
	.4byte _0803AA0E @ case 60
	.4byte _0803AA0E @ case 61
	.4byte _0803AA0E @ case 62
	.4byte _0803AA0E @ case 63
	.4byte _0803AA0E @ case 64
	.4byte _0803AA0E @ case 65
	.4byte _0803AA0E @ case 66
	.4byte _0803AA0E @ case 67
	.4byte _0803AA0E @ case 68
	.4byte _0803AA0E @ case 69
	.4byte _0803AA0E @ case 70
	.4byte _0803AA0E @ case 71
	.4byte _0803AA0E @ case 72
	.4byte _0803AA0E @ case 73
	.4byte _0803AA0E @ case 74
	.4byte _0803AA0E @ case 75
	.4byte _0803AA0E @ case 76
	.4byte _0803AA0E @ case 77
	.4byte _0803AA0E @ case 78
	.4byte _0803AA0E @ case 79
	.4byte _0803AA0E @ case 80
	.4byte _0803AA0E @ case 81
	.4byte _0803AA0E @ case 82
	.4byte _0803AA0E @ case 83
	.4byte _0803AA0E @ case 84
	.4byte _0803AA0E @ case 85
	.4byte _0803AA0E @ case 86
	.4byte _0803A9F2 @ case 87
	.4byte _0803A9F6 @ case 88
	.4byte _0803A9FC @ case 89
	.4byte _0803AA00 @ case 90
	.4byte _0803AA06 @ case 91
_0803A9CC:
	bl SkulteraInit
	b _0803AA0E
_0803A9D2:
	bl SkulteraIdleInit
	b _0803AA0E
_0803A9D8:
	bl SkulteraIdle
	b _0803AA0E
_0803A9DE:
	bl SkulteraTurningAroundInit
_0803A9E2:
	bl SkulteraTurningAround
	b _0803AA0E
_0803A9E8:
	bl SkulteraChasingSamusInit
_0803A9EC:
	bl SkulteraChasingSamus
	b _0803AA0E
_0803A9F2:
	bl SpriteDyingInit
_0803A9F6:
	bl SpriteDying
	b _0803AA0E
_0803A9FC:
	bl SkulteraInit
_0803AA00:
	bl SpriteSpawningFromX
	b _0803AA0E
_0803AA06:
	bl SkulteraTurningIntoX
	bl XParasiteInit
_0803AA0E:
	pop {r0}
	bx r0
	.align 2, 0
