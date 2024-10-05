    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start BullInit
BullInit: @ 0x0803E3B4
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0803E3E0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803E3E4
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803E3E4
	strh r0, [r2]
	b _0803E474
	.align 2, 0
_0803E3E0: .4byte gCurrentSprite
_0803E3E4:
	ldr r4, _0803E45C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x27
	movs r2, #0
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r5, #0
	ldr r1, _0803E460 @ =0x0000FFE0
	strh r1, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _0803E464 @ =0x08357540
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r5, [r0]
	ldr r2, _0803E468 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl SpriteUtilChooseRandomXFlip
	bl SpriteUtilChooseRandomXDirection
	ldr r0, _0803E46C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #8
	bls _0803E448
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0803E448:
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803E470
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0803E474
	.align 2, 0
_0803E45C: .4byte gCurrentSprite
_0803E460: .4byte 0x0000FFE0
_0803E464: .4byte 0x08357540
_0803E468: .4byte sPrimarySpriteStats
_0803E46C: .4byte gSpriteRandomNumber
_0803E470:
	movs r0, #1
	strb r0, [r1]
_0803E474:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BullIdleInit
BullIdleInit: @ 0x0803E47C
	ldr r0, _0803E498 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #2
	strb r1, [r2]
	ldr r1, _0803E49C @ =0x08357540
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803E498: .4byte gCurrentSprite
_0803E49C: .4byte 0x08357540

	thumb_func_start BullIdle
BullIdle: @ 0x0803E4A0
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r4, _0803E4EC @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803E4B8
	b _0803E5BC
_0803E4B8:
	movs r0, #3
	strb r0, [r1]
	ldrh r1, [r4]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E4FE
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803E4F0 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803E4F8
	ldrh r1, [r4]
	ldr r0, _0803E4F4 @ =0x0000FDFF
	ands r0, r1
	b _0803E51E
	.align 2, 0
_0803E4EC: .4byte gCurrentSprite
_0803E4F0: .4byte gPreviousCollisionCheck
_0803E4F4: .4byte 0x0000FDFF
_0803E4F8:
	ldrh r0, [r4, #4]
	adds r0, #4
	b _0803E52C
_0803E4FE:
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803E524 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803E528
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
_0803E51E:
	strh r0, [r4]
	movs r5, #1
	b _0803E52E
	.align 2, 0
_0803E524: .4byte gPreviousCollisionCheck
_0803E528:
	ldrh r0, [r4, #4]
	subs r0, #4
_0803E52C:
	strh r0, [r4, #4]
_0803E52E:
	ldr r4, _0803E560 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803E572
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803E564 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803E56C
	ldrh r0, [r4]
	ldr r1, _0803E568 @ =0x0000FBFF
	ands r1, r0
	b _0803E592
	.align 2, 0
_0803E560: .4byte gCurrentSprite
_0803E564: .4byte gPreviousCollisionCheck
_0803E568: .4byte 0x0000FBFF
_0803E56C:
	ldrh r0, [r4, #2]
	subs r0, #4
	b _0803E5A4
_0803E572:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803E59C @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0803E5A0
	ldrh r0, [r4]
	adds r1, r6, #0
	orrs r1, r0
_0803E592:
	strh r1, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0803E5A6
	.align 2, 0
_0803E59C: .4byte gPreviousCollisionCheck
_0803E5A0:
	ldrh r0, [r4, #2]
	adds r0, #4
_0803E5A4:
	strh r0, [r4, #2]
_0803E5A6:
	cmp r5, #0
	beq _0803E5BC
	ldr r0, _0803E5C4 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803E5BC
	ldr r0, _0803E5C8 @ =0x00000199
	bl SoundPlayNotAlreadyPlaying
_0803E5BC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803E5C4: .4byte gCurrentSprite
_0803E5C8: .4byte 0x00000199

	thumb_func_start Bull
Bull: @ 0x0803E5CC
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0803E5E4 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E5E8
	bl SpriteUtilUpdateFreezeTimer
	b _0803E68E
	.align 2, 0
_0803E5E4: .4byte gCurrentSprite
_0803E5E8:
	mov r0, ip
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803E62C
	mov r0, ip
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E62C
	mov r0, ip
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	bne _0803E62C
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	subs r0, #0xc
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x3d
	movs r1, #0
	bl SpriteSpawnSecondary
	movs r0, #0xcd
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803E62C:
	ldr r0, _0803E648 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x57
	beq _0803E676
	cmp r0, #0x57
	bgt _0803E652
	cmp r0, #1
	beq _0803E66A
	cmp r0, #1
	bgt _0803E64C
	cmp r0, #0
	beq _0803E664
	b _0803E68E
	.align 2, 0
_0803E648: .4byte gCurrentSprite
_0803E64C:
	cmp r0, #2
	beq _0803E670
	b _0803E68E
_0803E652:
	cmp r0, #0x59
	beq _0803E680
	cmp r0, #0x59
	blt _0803E67A
	cmp r0, #0x5a
	beq _0803E684
	cmp r0, #0x5b
	beq _0803E68A
	b _0803E68E
_0803E664:
	bl BullInit
	b _0803E68E
_0803E66A:
	bl BullIdleInit
	b _0803E68E
_0803E670:
	bl BullIdle
	b _0803E68E
_0803E676:
	bl SpriteDyingInit
_0803E67A:
	bl SpriteDying
	b _0803E68E
_0803E680:
	bl BullInit
_0803E684:
	bl SpriteSpawningFromX
	b _0803E68E
_0803E68A:
	bl XParasiteInit
_0803E68E:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BullSmoke
BullSmoke: @ 0x0803E698
	push {r4, r5, r6, r7, lr}
	ldr r4, _0803E70C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r5, [r0]
	adds r7, r5, #0
	movs r0, #0x24
	adds r0, r0, r4
	mov ip, r0
	ldrb r6, [r0]
	cmp r6, #0
	bne _0803E720
	ldrh r1, [r4]
	ldr r0, _0803E710 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x21
	movs r3, #1
	strb r3, [r0]
	adds r2, r4, #0
	adds r2, #0x22
	movs r0, #3
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	ldr r0, _0803E714 @ =0x08357568
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0803E718 @ =0x0000FF80
	strh r1, [r4, #0xa]
	movs r0, #0x80
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r0, ip
	strb r2, [r0]
	ldr r1, _0803E71C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2f
	strb r3, [r0]
	b _0803E750
	.align 2, 0
_0803E70C: .4byte gCurrentSprite
_0803E710: .4byte 0x0000FFFB
_0803E714: .4byte 0x08357568
_0803E718: .4byte 0x0000FF80
_0803E71C: .4byte gSpriteData
_0803E720:
	ldrh r0, [r4, #0x16]
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0803E734
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
_0803E734:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803E750
	movs r2, #0
	movs r0, #0
	strh r0, [r4]
	ldr r1, _0803E758 @ =gSpriteData
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2f
	strb r2, [r0]
_0803E750:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E758: .4byte gSpriteData
