    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SidehopperCheckSamusInRange
SidehopperCheckSamusInRange: @ 0x08028420
	push {r4, lr}
	movs r4, #0
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _08028438
	movs r4, #1
	bl SpriteUtilMakeSpriteFaceSamusDirection
_08028438:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SidehopperInit
SidehopperInit: @ 0x08028440
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0802846C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08028470
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08028470
	strh r0, [r2]
	b _0802853A
	.align 2, 0
_0802846C: .4byte gCurrentSprite
_08028470:
	ldr r1, _08028488 @ =gCurrentSprite
	adds r5, r1, #0
	adds r5, #0x24
	ldrb r0, [r5]
	adds r4, r1, #0
	cmp r0, #0x59
	bne _0802848C
	movs r0, #0x5a
	strb r0, [r5]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _080284C0
	.align 2, 0
_08028488: .4byte gCurrentSprite
_0802848C:
	ldrh r0, [r4, #2]
	subs r0, #0x44
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080284E4 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080284B4
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
_080284B4:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
	movs r0, #8
	strb r0, [r5]
_080284C0:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080284EC
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	movs r0, #0x58
	strh r0, [r4, #0xc]
	ldr r0, _080284E8 @ =0x0000FFE0
	strh r0, [r4, #0xa]
	b _08028502
	.align 2, 0
_080284E4: .4byte gPreviousCollisionCheck
_080284E8: .4byte 0x0000FFE0
_080284EC:
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08028540 @ =0x0000FFA8
	strh r0, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
_08028502:
	adds r1, r4, #0
	adds r1, #0x29
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _08028544 @ =0x0000FFC0
	strh r0, [r4, #0xe]
	movs r0, #0x40
	strh r0, [r4, #0x10]
	ldr r0, _08028548 @ =sSidehopperOam_31aca0
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldr r2, _0802854C @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	bl SpriteUtilChooseRandomXDirection
_0802853A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028540: .4byte 0x0000FFA8
_08028544: .4byte 0x0000FFC0
_08028548: .4byte sSidehopperOam_31aca0
_0802854C: .4byte sPrimarySpriteStats

	thumb_func_start SidehopperPreparingtoJumpInit
SidehopperPreparingtoJumpInit: @ 0x08028550
	ldr r1, _08028568 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0802856C @ =sSidehopperOam_31ad10
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08028568: .4byte gCurrentSprite
_0802856C: .4byte sSidehopperOam_31ad10

	thumb_func_start SidehopperJumpingInit
SidehopperJumpingInit: @ 0x08028570
	push {r4, lr}
	ldr r3, _080285A4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r4, #0
	strh r2, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x31
	strb r4, [r0]
	ldr r0, _080285A8 @ =sSidehopperOam_31ad30
	str r0, [r3, #0x18]
	ldr r0, _080285AC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080285B0
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	b _080285B6
	.align 2, 0
_080285A4: .4byte gCurrentSprite
_080285A8: .4byte sSidehopperOam_31ad30
_080285AC: .4byte gSpriteRandomNumber
_080285B0:
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
_080285B6:
	movs r0, #0xbd
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SidehopperLandingInit
SidehopperLandingInit: @ 0x080285C4
	push {lr}
	ldr r1, _080285E4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x1a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _080285E8 @ =sSidehopperOam_31ad50
	str r0, [r1, #0x18]
	ldr r0, _080285EC @ =0x0000017B
	bl SoundPlayNotAlreadyPlaying
	pop {r0}
	bx r0
	.align 2, 0
_080285E4: .4byte gCurrentSprite
_080285E8: .4byte sSidehopperOam_31ad50
_080285EC: .4byte 0x0000017B

	thumb_func_start SidehopperIdle
SidehopperIdle: @ 0x080285F0
	push {lr}
	bl SidehopperCheckSamusInRange
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _08028604
	bl SidehopperPreparingtoJumpInit
	b _0802864C
_08028604:
	ldr r2, _0802863C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	movs r0, #0
	strh r3, [r2, #0x16]
	adds r1, #0xa
	strb r0, [r1]
	ldr r0, _08028640 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	adds r3, r2, #0
	adds r3, #0x2f
	strb r0, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #7
	bls _08028648
	ldr r0, _08028644 @ =sSidehopperOam_31acc8
	str r0, [r2, #0x18]
	movs r0, #0xbe
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0802864C
	.align 2, 0
_0802863C: .4byte gCurrentSprite
_08028640: .4byte gSpriteRandomNumber
_08028644: .4byte sSidehopperOam_31acc8
_08028648:
	ldr r0, _08028650 @ =sSidehopperOam_31aca0
	str r0, [r2, #0x18]
_0802864C:
	pop {r0}
	bx r0
	.align 2, 0
_08028650: .4byte sSidehopperOam_31aca0

	thumb_func_start SidehopperFallingInit
SidehopperFallingInit: @ 0x08028654
	ldr r3, _08028670 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x16
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r0, #0
	strh r2, [r3, #0x16]
	adds r1, #0xd
	strb r0, [r1]
	ldr r0, _08028674 @ =sSidehopperOam_31ad30
	str r0, [r3, #0x18]
	bx lr
	.align 2, 0
_08028670: .4byte gCurrentSprite
_08028674: .4byte sSidehopperOam_31ad30

	thumb_func_start SidehopperPreparingToJumpGround
SidehopperPreparingToJumpGround: @ 0x08028678
	push {r4, r5, lr}
	ldr r4, _080286B8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080286CC
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080286BC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080286C0
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080286C0
	bl SidehopperFallingInit
	b _080286CC
	.align 2, 0
_080286B8: .4byte gCurrentSprite
_080286BC: .4byte gPreviousCollisionCheck
_080286C0:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080286CC
	bl SidehopperJumpingInit
_080286CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SidehopperPreparingToJumpCeiling
SidehopperPreparingToJumpCeiling: @ 0x080286D4
	push {lr}
	ldr r0, _080286F4 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _080286F0
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080286F0
	bl SidehopperJumpingInit
_080286F0:
	pop {r0}
	bx r0
	.align 2, 0
_080286F4: .4byte gCurrentSprite

	thumb_func_start SidehopperJumpingGround
SidehopperJumpingGround: @ 0x080286F8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _0802870C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _08028714
	ldr r1, _08028710 @ =sSidehopperLittleHopVelocity
	b _08028716
	.align 2, 0
_0802870C: .4byte gCurrentSprite
_08028710: .4byte sSidehopperLittleHopVelocity
_08028714:
	ldr r1, _08028758 @ =sSidehopperBigHopVelocity
_08028716:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r4, _0802875C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08028778
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08028760 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08028764
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #6
	b _0802879C
	.align 2, 0
_08028758: .4byte sSidehopperBigHopVelocity
_0802875C: .4byte gCurrentSprite
_08028760: .4byte gPreviousCollisionCheck
_08028764:
	lsls r0, r5, #0x10
	adds r1, r0, #0
	cmp r1, #0
	ble _08028772
	ldrh r0, [r4, #4]
	adds r0, #4
	b _080287BA
_08028772:
	ldrh r0, [r4, #4]
	adds r0, #5
	b _080287BA
_08028778:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080287A4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _080287A8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #6
_0802879C:
	strh r0, [r4, #4]
	lsls r1, r5, #0x10
	b _080287BC
	.align 2, 0
_080287A4: .4byte gPreviousCollisionCheck
_080287A8:
	lsls r0, r5, #0x10
	adds r1, r0, #0
	cmp r1, #0
	ble _080287B6
	ldrh r0, [r4, #4]
	subs r0, #4
	b _080287BA
_080287B6:
	ldrh r0, [r4, #4]
	subs r0, #5
_080287BA:
	strh r0, [r4, #4]
_080287BC:
	ldr r4, _08028800 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0x26
	bhi _080287D2
	adds r0, #1
	strb r0, [r2]
_080287D2:
	cmp r1, #0
	ble _0802884C
	cmp r6, #0
	beq _080287E6
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
_080287E6:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _08028804 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08028808
	strh r1, [r4, #2]
	bl SidehopperLandingInit
	b _080288CA
	.align 2, 0
_08028800: .4byte gCurrentSprite
_08028804: .4byte gPreviousVerticalCollisionCheck
_08028808:
	cmp r6, #0
	bne _080288CA
	ldrh r0, [r4, #2]
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0802883E
	ldrh r0, [r4, #2]
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0802883A
	movs r6, #1
_0802883A:
	cmp r6, #0
	beq _080288CA
_0802883E:
	ldr r0, _08028848 @ =gCurrentSprite
	strh r1, [r0, #2]
	bl SidehopperLandingInit
	b _080288CA
	.align 2, 0
_08028848: .4byte gCurrentSprite
_0802884C:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802888C
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08028888 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _080288B8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #6
	strh r0, [r4, #4]
	bl SidehopperFallingInit
	b _080288B8
	.align 2, 0
_08028888: .4byte gPreviousCollisionCheck
_0802888C:
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080288D0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _080288B8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #6
	strh r0, [r4, #4]
	bl SidehopperFallingInit
_080288B8:
	cmp r6, #0
	beq _080288CA
	ldr r0, _080288D4 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_080288CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080288D0: .4byte gPreviousCollisionCheck
_080288D4: .4byte gCurrentSprite

	thumb_func_start SidehopperJumpingCeiling
SidehopperJumpingCeiling: @ 0x080288D8
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r2, _080288EC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _080288F4
	ldr r1, _080288F0 @ =sSidehopperLittleHopVelocity
	b _080288F6
	.align 2, 0
_080288EC: .4byte gCurrentSprite
_080288F0: .4byte sSidehopperLittleHopVelocity
_080288F4:
	ldr r1, _08028938 @ =sSidehopperBigHopVelocity
_080288F6:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r4, _0802893C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08028958
	ldrh r0, [r4, #2]
	adds r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08028940 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08028944
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #6
	b _0802897C
	.align 2, 0
_08028938: .4byte sSidehopperBigHopVelocity
_0802893C: .4byte gCurrentSprite
_08028940: .4byte gPreviousCollisionCheck
_08028944:
	lsls r0, r5, #0x10
	adds r1, r0, #0
	cmp r1, #0
	ble _08028952
	ldrh r0, [r4, #4]
	adds r0, #4
	b _0802899A
_08028952:
	ldrh r0, [r4, #4]
	adds r0, #5
	b _0802899A
_08028958:
	ldrh r0, [r4, #2]
	adds r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08028984 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08028988
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #6
_0802897C:
	strh r0, [r4, #4]
	lsls r1, r5, #0x10
	b _0802899C
	.align 2, 0
_08028984: .4byte gPreviousCollisionCheck
_08028988:
	lsls r0, r5, #0x10
	adds r1, r0, #0
	cmp r1, #0
	ble _08028996
	ldrh r0, [r4, #4]
	subs r0, #4
	b _0802899A
_08028996:
	ldrh r0, [r4, #4]
	subs r0, #5
_0802899A:
	strh r0, [r4, #4]
_0802899C:
	ldr r4, _080289F0 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, r0, r5
	strh r0, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0x26
	bhi _080289B2
	adds r0, #1
	strb r0, [r2]
_080289B2:
	cmp r1, #0
	bge _08028A40
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080289F8
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080289F4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08028A24
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #6
	strh r0, [r4, #4]
	bl SidehopperFallingInit
	b _08028A24
	.align 2, 0
_080289F0: .4byte gCurrentSprite
_080289F4: .4byte gPreviousCollisionCheck
_080289F8:
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08028A38 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08028A24
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #6
	strh r0, [r4, #4]
	bl SidehopperFallingInit
_08028A24:
	cmp r7, #0
	beq _08028AC2
	ldr r0, _08028A3C @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
	b _08028AC2
	.align 2, 0
_08028A38: .4byte gPreviousCollisionCheck
_08028A3C: .4byte gCurrentSprite
_08028A40:
	cmp r7, #0
	beq _08028A50
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
_08028A50:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r5, _08028A74 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08028A78
	adds r0, r2, #0
	adds r0, #0x40
	strh r0, [r4, #2]
	bl SidehopperLandingInit
	b _08028AC2
	.align 2, 0
_08028A74: .4byte gPreviousVerticalCollisionCheck
_08028A78:
	cmp r7, #0
	bne _08028AC2
	ldrh r0, [r4, #2]
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08028AB6
	ldrh r0, [r4, #2]
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08028AB2
	movs r7, #1
_08028AB2:
	cmp r7, #0
	beq _08028AC2
_08028AB6:
	ldr r1, _08028AC8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x40
	strh r0, [r1, #2]
	bl SidehopperLandingInit
_08028AC2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08028AC8: .4byte gCurrentSprite

	thumb_func_start SidehopperLanding
SidehopperLanding: @ 0x08028ACC
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08028ADA
	bl SidehopperIdle
_08028ADA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SidehopperFallingGround
SidehopperFallingGround: @ 0x08028AE0
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _08028B34 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _08028B38 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08028B2A
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08028B2A
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _08028B26
	movs r6, #1
_08028B26:
	cmp r6, #0
	beq _08028B3C
_08028B2A:
	ldr r0, _08028B34 @ =gCurrentSprite
	strh r1, [r0, #2]
	bl SidehopperLandingInit
	b _08028B7C
	.align 2, 0
_08028B34: .4byte gCurrentSprite
_08028B38: .4byte gPreviousVerticalCollisionCheck
_08028B3C:
	adds r3, r4, #0
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08028B68 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08028B6C @ =0x00007FFF
	cmp r1, r0
	bne _08028B70
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _08028B7C
	.align 2, 0
_08028B68: .4byte sSpritesFallingSpeed
_08028B6C: .4byte 0x00007FFF
_08028B70:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_08028B7C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SidehopperFallingCeiling
SidehopperFallingCeiling: @ 0x08028B84
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _08028BDC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r5, _08028BE0 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08028BCE
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08028BCE
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _08028BCA
	movs r6, #1
_08028BCA:
	cmp r6, #0
	beq _08028BE4
_08028BCE:
	ldr r1, _08028BDC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x40
	strh r0, [r1, #2]
	bl SidehopperLandingInit
	b _08028C24
	.align 2, 0
_08028BDC: .4byte gCurrentSprite
_08028BE0: .4byte gPreviousVerticalCollisionCheck
_08028BE4:
	adds r3, r4, #0
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08028C10 @ =sSpritesFallingSpeedCeiling
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08028C14 @ =0x00007FFF
	cmp r1, r0
	bne _08028C18
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _08028C24
	.align 2, 0
_08028C10: .4byte sSpritesFallingSpeedCeiling
_08028C14: .4byte 0x00007FFF
_08028C18:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_08028C24:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SidehopperIdleGround
SidehopperIdleGround: @ 0x08028C2C
	push {r4, r5, lr}
	bl SidehopperCheckSamusInRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028C96
	ldr r4, _08028C6C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08028C70 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08028C74
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08028C74
	bl SidehopperFallingInit
	b _08028CB0
	.align 2, 0
_08028C6C: .4byte gCurrentSprite
_08028C70: .4byte gPreviousCollisionCheck
_08028C74:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08028CB0
	ldr r2, _08028C9C @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x2f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _08028CA0
_08028C96:
	bl SidehopperPreparingtoJumpInit
	b _08028CB0
	.align 2, 0
_08028C9C: .4byte gCurrentSprite
_08028CA0:
	ldr r1, [r2, #0x18]
	ldr r0, _08028CB8 @ =sSidehopperOam_31acc8
	cmp r1, r0
	bne _08028CB0
	movs r0, #0xbe
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08028CB0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08028CB8: .4byte sSidehopperOam_31acc8

	thumb_func_start SidehopperIdleCeiling
SidehopperIdleCeiling: @ 0x08028CBC
	push {lr}
	bl SidehopperCheckSamusInRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08028CEA
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08028D04
	ldr r2, _08028CF0 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x2f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bne _08028CF4
_08028CEA:
	bl SidehopperPreparingtoJumpInit
	b _08028D04
	.align 2, 0
_08028CF0: .4byte gCurrentSprite
_08028CF4:
	ldr r1, [r2, #0x18]
	ldr r0, _08028D08 @ =sSidehopperOam_31acc8
	cmp r1, r0
	bne _08028D04
	movs r0, #0xbe
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08028D04:
	pop {r0}
	bx r0
	.align 2, 0
_08028D08: .4byte sSidehopperOam_31acc8

	thumb_func_start Sidehopper
Sidehopper: @ 0x08028D0C
	push {r4, lr}
	ldr r4, _08028D34 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08028D24
	ldr r0, _08028D38 @ =0x0000017D
	bl SoundPlayNotAlreadyPlaying
_08028D24:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08028D3C
	bl SpriteUtilUpdateFreezeTimer
	b _08028F8E
	.align 2, 0
_08028D34: .4byte gCurrentSprite
_08028D38: .4byte 0x0000017D
_08028D3C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08028D48
	b _08028F8E
_08028D48:
	lsls r0, r0, #2
	ldr r1, _08028D54 @ =_08028D58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028D54: .4byte _08028D58
_08028D58: @ jump table
	.4byte _08028EC8 @ case 0
	.4byte _08028ECE @ case 1
	.4byte _08028ED2 @ case 2
	.4byte _08028F8E @ case 3
	.4byte _08028F8E @ case 4
	.4byte _08028F8E @ case 5
	.4byte _08028F8E @ case 6
	.4byte _08028F8E @ case 7
	.4byte _08028F18 @ case 8
	.4byte _08028F8E @ case 9
	.4byte _08028F8E @ case 10
	.4byte _08028F8E @ case 11
	.4byte _08028F8E @ case 12
	.4byte _08028F8E @ case 13
	.4byte _08028F8E @ case 14
	.4byte _08028F8E @ case 15
	.4byte _08028F8E @ case 16
	.4byte _08028F8E @ case 17
	.4byte _08028F8E @ case 18
	.4byte _08028F8E @ case 19
	.4byte _08028F8E @ case 20
	.4byte _08028F8E @ case 21
	.4byte _08028F36 @ case 22
	.4byte _08028F8E @ case 23
	.4byte _08028EF2 @ case 24
	.4byte _08028F8E @ case 25
	.4byte _08028F12 @ case 26
	.4byte _08028F8E @ case 27
	.4byte _08028F8E @ case 28
	.4byte _08028F8E @ case 29
	.4byte _08028F8E @ case 30
	.4byte _08028F8E @ case 31
	.4byte _08028F8E @ case 32
	.4byte _08028F8E @ case 33
	.4byte _08028F8E @ case 34
	.4byte _08028F8E @ case 35
	.4byte _08028F8E @ case 36
	.4byte _08028F8E @ case 37
	.4byte _08028F8E @ case 38
	.4byte _08028F8E @ case 39
	.4byte _08028F8E @ case 40
	.4byte _08028F8E @ case 41
	.4byte _08028F8E @ case 42
	.4byte _08028F8E @ case 43
	.4byte _08028F8E @ case 44
	.4byte _08028F8E @ case 45
	.4byte _08028F8E @ case 46
	.4byte _08028F8E @ case 47
	.4byte _08028F8E @ case 48
	.4byte _08028F8E @ case 49
	.4byte _08028F8E @ case 50
	.4byte _08028F8E @ case 51
	.4byte _08028F8E @ case 52
	.4byte _08028F8E @ case 53
	.4byte _08028F8E @ case 54
	.4byte _08028F8E @ case 55
	.4byte _08028F8E @ case 56
	.4byte _08028F8E @ case 57
	.4byte _08028F8E @ case 58
	.4byte _08028F8E @ case 59
	.4byte _08028F8E @ case 60
	.4byte _08028F8E @ case 61
	.4byte _08028F8E @ case 62
	.4byte _08028F8E @ case 63
	.4byte _08028F8E @ case 64
	.4byte _08028F8E @ case 65
	.4byte _08028F8E @ case 66
	.4byte _08028F8E @ case 67
	.4byte _08028F8E @ case 68
	.4byte _08028F8E @ case 69
	.4byte _08028F8E @ case 70
	.4byte _08028F8E @ case 71
	.4byte _08028F8E @ case 72
	.4byte _08028F8E @ case 73
	.4byte _08028F8E @ case 74
	.4byte _08028F8E @ case 75
	.4byte _08028F8E @ case 76
	.4byte _08028F8E @ case 77
	.4byte _08028F8E @ case 78
	.4byte _08028F8E @ case 79
	.4byte _08028F8E @ case 80
	.4byte _08028F8E @ case 81
	.4byte _08028F8E @ case 82
	.4byte _08028F8E @ case 83
	.4byte _08028F8E @ case 84
	.4byte _08028F8E @ case 85
	.4byte _08028F8E @ case 86
	.4byte _08028F56 @ case 87
	.4byte _08028F5A @ case 88
	.4byte _08028F60 @ case 89
	.4byte _08028F64 @ case 90
	.4byte _08028F6A @ case 91
_08028EC8:
	bl SidehopperInit
	b _08028F8E
_08028ECE:
	bl SidehopperPreparingtoJumpInit
_08028ED2:
	ldr r0, _08028EE8 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08028EEC
	bl SidehopperPreparingToJumpCeiling
	b _08028F8E
	.align 2, 0
_08028EE8: .4byte gCurrentSprite
_08028EEC:
	bl SidehopperPreparingToJumpGround
	b _08028F8E
_08028EF2:
	ldr r0, _08028F08 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08028F0C
	bl SidehopperJumpingCeiling
	b _08028F8E
	.align 2, 0
_08028F08: .4byte gCurrentSprite
_08028F0C:
	bl SidehopperJumpingGround
	b _08028F8E
_08028F12:
	bl SidehopperLanding
	b _08028F8E
_08028F18:
	ldr r0, _08028F2C @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08028F30
	bl SidehopperIdleCeiling
	b _08028F8E
	.align 2, 0
_08028F2C: .4byte gCurrentSprite
_08028F30:
	bl SidehopperIdleGround
	b _08028F8E
_08028F36:
	ldr r0, _08028F4C @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08028F50
	bl SidehopperFallingCeiling
	b _08028F8E
	.align 2, 0
_08028F4C: .4byte gCurrentSprite
_08028F50:
	bl SidehopperFallingGround
	b _08028F8E
_08028F56:
	bl SpriteDyingInit
_08028F5A:
	bl SpriteDying
	b _08028F8E
_08028F60:
	bl SidehopperInit
_08028F64:
	bl SpriteSpawningFromX
	b _08028F8E
_08028F6A:
	ldr r2, _08028F80 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08028F84
	ldrh r0, [r2, #2]
	adds r0, #0x40
	b _08028F88
	.align 2, 0
_08028F80: .4byte gCurrentSprite
_08028F84:
	ldrh r0, [r2, #2]
	subs r0, #0x40
_08028F88:
	strh r0, [r2, #2]
	bl XParasiteInit
_08028F8E:
	pop {r4}
	pop {r0}
	bx r0
