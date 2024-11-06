    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start DessgeegaCheckSamusInRange
DessgeegaCheckSamusInRange: @ 0x08028F94
	push {r4, lr}
	movs r4, #0
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _08028FAC
	movs r4, #1
	bl SpriteUtilMakeSpriteFaceSamusDirection
_08028FAC:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start DessgeegaInit
DessgeegaInit: @ 0x08028FB4
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08028FE0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08028FE4
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08028FE4
	strh r0, [r2]
	b _080290AE
	.align 2, 0
_08028FE0: .4byte gCurrentSprite
_08028FE4:
	ldr r1, _08028FFC @ =gCurrentSprite
	adds r5, r1, #0
	adds r5, #0x24
	ldrb r0, [r5]
	adds r4, r1, #0
	cmp r0, #0x59
	bne _08029000
	movs r0, #0x5a
	strb r0, [r5]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _08029034
	.align 2, 0
_08028FFC: .4byte gCurrentSprite
_08029000:
	ldrh r0, [r4, #2]
	subs r0, #0x44
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08029058 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08029028
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
_08029028:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
	movs r0, #8
	strb r0, [r5]
_08029034:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029060
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x30
	strb r0, [r1]
	ldr r0, _0802905C @ =0x0000FFE0
	strh r0, [r4, #0xa]
	movs r0, #0x54
	strh r0, [r4, #0xc]
	b _08029076
	.align 2, 0
_08029058: .4byte gPreviousCollisionCheck
_0802905C: .4byte 0x0000FFE0
_08029060:
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #0x20
	strb r1, [r0]
	ldr r0, _080290B4 @ =0x0000FFAC
	strh r0, [r4, #0xa]
	strh r1, [r4, #0xc]
_08029076:
	adds r1, r4, #0
	adds r1, #0x29
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _080290B8 @ =0x0000FFC0
	strh r0, [r4, #0xe]
	movs r0, #0x40
	strh r0, [r4, #0x10]
	ldr r0, _080290BC @ =sDessgeegaOam_31b8f0
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldr r2, _080290C0 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	bl SpriteUtilChooseRandomXDirection
_080290AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080290B4: .4byte 0x0000FFAC
_080290B8: .4byte 0x0000FFC0
_080290BC: .4byte sDessgeegaOam_31b8f0
_080290C0: .4byte sPrimarySpriteStats

	thumb_func_start DessgeegaPreparingToJumpInit
DessgeegaPreparingToJumpInit: @ 0x080290C4
	ldr r1, _080290DC @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _080290E0 @ =sDessgeegaOam_31b960
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_080290DC: .4byte gCurrentSprite
_080290E0: .4byte sDessgeegaOam_31b960

	thumb_func_start DessgeegaJumpingGroundInit
DessgeegaJumpingGroundInit: @ 0x080290E4
	push {r4, lr}
	ldr r3, _08029118 @ =gCurrentSprite
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
	ldr r0, _0802911C @ =sDessgeegaOam_31b980
	str r0, [r3, #0x18]
	ldr r0, _08029120 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08029124
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	b _0802912A
	.align 2, 0
_08029118: .4byte gCurrentSprite
_0802911C: .4byte sDessgeegaOam_31b980
_08029120: .4byte gSpriteRandomNumber
_08029124:
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
_0802912A:
	movs r0, #0xbf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start DessgeegaLandingInit
DessgeegaLandingInit: @ 0x08029138
	push {lr}
	ldr r1, _08029158 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x1a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0802915C @ =sDessgeegaOam_31b9a0
	str r0, [r1, #0x18]
	ldr r0, _08029160 @ =0x0000017F
	bl SoundPlayNotAlreadyPlaying
	pop {r0}
	bx r0
	.align 2, 0
_08029158: .4byte gCurrentSprite
_0802915C: .4byte sDessgeegaOam_31b9a0
_08029160: .4byte 0x0000017F

	thumb_func_start DessgeegaIdleInit
DessgeegaIdleInit: @ 0x08029164
	push {lr}
	bl DessgeegaCheckSamusInRange
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _08029178
	bl DessgeegaPreparingToJumpInit
	b _080291C0
_08029178:
	ldr r2, _080291A8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	movs r0, #0
	strh r3, [r2, #0x16]
	adds r1, #0xa
	strb r0, [r1]
	ldr r0, _080291AC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	adds r3, r2, #0
	adds r3, #0x2f
	strb r0, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #7
	bls _080291B4
	ldr r0, _080291B0 @ =sDessgeegaOam_31b8f0
	str r0, [r2, #0x18]
	b _080291C0
	.align 2, 0
_080291A8: .4byte gCurrentSprite
_080291AC: .4byte gSpriteRandomNumber
_080291B0: .4byte sDessgeegaOam_31b8f0
_080291B4:
	ldr r0, _080291C4 @ =sDessgeegaOam_31b918
	str r0, [r2, #0x18]
	movs r0, #0xc0
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080291C0:
	pop {r0}
	bx r0
	.align 2, 0
_080291C4: .4byte sDessgeegaOam_31b918

	thumb_func_start DessgeegaFallingInit
DessgeegaFallingInit: @ 0x080291C8
	ldr r3, _080291E4 @ =gCurrentSprite
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
	ldr r0, _080291E8 @ =sDessgeegaOam_31b980
	str r0, [r3, #0x18]
	bx lr
	.align 2, 0
_080291E4: .4byte gCurrentSprite
_080291E8: .4byte sDessgeegaOam_31b980

	thumb_func_start DessgeegaJumpWarningGround
DessgeegaJumpWarningGround: @ 0x080291EC
	push {r4, r5, lr}
	ldr r4, _0802922C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08029240
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08029230 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08029234
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08029234
	bl DessgeegaFallingInit
	b _08029240
	.align 2, 0
_0802922C: .4byte gCurrentSprite
_08029230: .4byte gPreviousCollisionCheck
_08029234:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08029240
	bl DessgeegaJumpingGroundInit
_08029240:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DessgeegaJumpWarningCeiling
DessgeegaJumpWarningCeiling: @ 0x08029248
	push {lr}
	ldr r0, _08029268 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08029264
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08029264
	bl DessgeegaJumpingGroundInit
_08029264:
	pop {r0}
	bx r0
	.align 2, 0
_08029268: .4byte gCurrentSprite

	thumb_func_start DessgeegaJumpingGround
DessgeegaJumpingGround: @ 0x0802926C
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _08029280 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _08029288
	ldr r1, _08029284 @ =sDessgeegaLittleHopVelocity
	b _0802928A
	.align 2, 0
_08029280: .4byte gCurrentSprite
_08029284: .4byte sDessgeegaLittleHopVelocity
_08029288:
	ldr r1, _080292CC @ =sDessgeegaBigHopVelocity
_0802928A:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r4, _080292D0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080292EC
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080292D4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _080292D8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #6
	b _08029310
	.align 2, 0
_080292CC: .4byte sDessgeegaBigHopVelocity
_080292D0: .4byte gCurrentSprite
_080292D4: .4byte gPreviousCollisionCheck
_080292D8:
	lsls r0, r5, #0x10
	adds r1, r0, #0
	cmp r1, #0
	ble _080292E6
	ldrh r0, [r4, #4]
	adds r0, #4
	b _0802932E
_080292E6:
	ldrh r0, [r4, #4]
	adds r0, #5
	b _0802932E
_080292EC:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08029318 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0802931C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #6
_08029310:
	strh r0, [r4, #4]
	lsls r1, r5, #0x10
	b _08029330
	.align 2, 0
_08029318: .4byte gPreviousCollisionCheck
_0802931C:
	lsls r0, r5, #0x10
	adds r1, r0, #0
	cmp r1, #0
	ble _0802932A
	ldrh r0, [r4, #4]
	subs r0, #4
	b _0802932E
_0802932A:
	ldrh r0, [r4, #4]
	subs r0, #5
_0802932E:
	strh r0, [r4, #4]
_08029330:
	ldr r4, _08029374 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0x26
	bhi _08029346
	adds r0, #1
	strb r0, [r2]
_08029346:
	cmp r1, #0
	ble _080293C0
	cmp r6, #0
	beq _0802935A
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
_0802935A:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _08029378 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0802937C
	strh r1, [r4, #2]
	bl DessgeegaLandingInit
	b _0802943E
	.align 2, 0
_08029374: .4byte gCurrentSprite
_08029378: .4byte gPreviousVerticalCollisionCheck
_0802937C:
	cmp r6, #0
	bne _0802943E
	ldrh r0, [r4, #2]
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080293B2
	ldrh r0, [r4, #2]
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _080293AE
	movs r6, #1
_080293AE:
	cmp r6, #0
	beq _0802943E
_080293B2:
	ldr r0, _080293BC @ =gCurrentSprite
	strh r1, [r0, #2]
	bl DessgeegaLandingInit
	b _0802943E
	.align 2, 0
_080293BC: .4byte gCurrentSprite
_080293C0:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08029400
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080293FC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0802942C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #6
	strh r0, [r4, #4]
	bl DessgeegaFallingInit
	b _0802942C
	.align 2, 0
_080293FC: .4byte gPreviousCollisionCheck
_08029400:
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08029444 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0802942C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #6
	strh r0, [r4, #4]
	bl DessgeegaFallingInit
_0802942C:
	cmp r6, #0
	beq _0802943E
	ldr r0, _08029448 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_0802943E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029444: .4byte gPreviousCollisionCheck
_08029448: .4byte gCurrentSprite

	thumb_func_start DessgeegaJumpingCeiling
DessgeegaJumpingCeiling: @ 0x0802944C
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r2, _08029460 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _08029468
	ldr r1, _08029464 @ =sDessgeegaLittleHopVelocity
	b _0802946A
	.align 2, 0
_08029460: .4byte gCurrentSprite
_08029464: .4byte sDessgeegaLittleHopVelocity
_08029468:
	ldr r1, _080294AC @ =sDessgeegaBigHopVelocity
_0802946A:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r4, _080294B0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080294CC
	ldrh r0, [r4, #2]
	adds r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080294B4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _080294B8
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #6
	b _080294F0
	.align 2, 0
_080294AC: .4byte sDessgeegaBigHopVelocity
_080294B0: .4byte gCurrentSprite
_080294B4: .4byte gPreviousCollisionCheck
_080294B8:
	lsls r0, r5, #0x10
	adds r1, r0, #0
	cmp r1, #0
	ble _080294C6
	ldrh r0, [r4, #4]
	adds r0, #4
	b _0802950E
_080294C6:
	ldrh r0, [r4, #4]
	adds r0, #5
	b _0802950E
_080294CC:
	ldrh r0, [r4, #2]
	adds r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080294F8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _080294FC
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #6
_080294F0:
	strh r0, [r4, #4]
	lsls r1, r5, #0x10
	b _08029510
	.align 2, 0
_080294F8: .4byte gPreviousCollisionCheck
_080294FC:
	lsls r0, r5, #0x10
	adds r1, r0, #0
	cmp r1, #0
	ble _0802950A
	ldrh r0, [r4, #4]
	subs r0, #4
	b _0802950E
_0802950A:
	ldrh r0, [r4, #4]
	subs r0, #5
_0802950E:
	strh r0, [r4, #4]
_08029510:
	ldr r4, _08029564 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, r0, r5
	strh r0, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	cmp r0, #0x26
	bhi _08029526
	adds r0, #1
	strb r0, [r2]
_08029526:
	cmp r1, #0
	bge _080295B4
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802956C
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r3, #0x10
	ldrsh r1, [r4, r3]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08029568 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08029598
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #6
	strh r0, [r4, #4]
	bl DessgeegaFallingInit
	b _08029598
	.align 2, 0
_08029564: .4byte gCurrentSprite
_08029568: .4byte gPreviousCollisionCheck
_0802956C:
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080295AC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08029598
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #6
	strh r0, [r4, #4]
	bl DessgeegaFallingInit
_08029598:
	cmp r7, #0
	beq _08029636
	ldr r0, _080295B0 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
	b _08029636
	.align 2, 0
_080295AC: .4byte gPreviousCollisionCheck
_080295B0: .4byte gCurrentSprite
_080295B4:
	cmp r7, #0
	beq _080295C4
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
_080295C4:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r5, _080295E8 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080295EC
	adds r0, r2, #0
	adds r0, #0x40
	strh r0, [r4, #2]
	bl DessgeegaLandingInit
	b _08029636
	.align 2, 0
_080295E8: .4byte gPreviousVerticalCollisionCheck
_080295EC:
	cmp r7, #0
	bne _08029636
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
	bne _0802962A
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
	beq _08029626
	movs r7, #1
_08029626:
	cmp r7, #0
	beq _08029636
_0802962A:
	ldr r1, _0802963C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x40
	strh r0, [r1, #2]
	bl DessgeegaLandingInit
_08029636:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802963C: .4byte gCurrentSprite

	thumb_func_start DessgeegaLanding
DessgeegaLanding: @ 0x08029640
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802964E
	bl DessgeegaIdleInit
_0802964E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DessgeegaFallingGround
DessgeegaFallingGround: @ 0x08029654
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _080296A8 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _080296AC @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0802969E
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0802969E
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0802969A
	movs r6, #1
_0802969A:
	cmp r6, #0
	beq _080296B0
_0802969E:
	ldr r0, _080296A8 @ =gCurrentSprite
	strh r1, [r0, #2]
	bl DessgeegaLandingInit
	b _080296F0
	.align 2, 0
_080296A8: .4byte gCurrentSprite
_080296AC: .4byte gPreviousVerticalCollisionCheck
_080296B0:
	adds r3, r4, #0
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _080296DC @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _080296E0 @ =0x00007FFF
	cmp r1, r0
	bne _080296E4
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _080296F0
	.align 2, 0
_080296DC: .4byte sSpritesFallingSpeed
_080296E0: .4byte 0x00007FFF
_080296E4:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_080296F0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DessgeegaFallingCeiling
DessgeegaFallingCeiling: @ 0x080296F8
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _08029750 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r5, _08029754 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08029742
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08029742
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0802973E
	movs r6, #1
_0802973E:
	cmp r6, #0
	beq _08029758
_08029742:
	ldr r1, _08029750 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x40
	strh r0, [r1, #2]
	bl DessgeegaLandingInit
	b _08029798
	.align 2, 0
_08029750: .4byte gCurrentSprite
_08029754: .4byte gPreviousVerticalCollisionCheck
_08029758:
	adds r3, r4, #0
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08029784 @ =sSpritesFallingSpeedCeiling
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08029788 @ =0x00007FFF
	cmp r1, r0
	bne _0802978C
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _08029798
	.align 2, 0
_08029784: .4byte sSpritesFallingSpeedCeiling
_08029788: .4byte 0x00007FFF
_0802978C:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_08029798:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DessgeegaIdleGround
DessgeegaIdleGround: @ 0x080297A0
	push {r4, r5, lr}
	bl DessgeegaCheckSamusInRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802980A
	ldr r4, _080297E0 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080297E4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080297E8
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080297E8
	bl DessgeegaFallingInit
	b _08029824
	.align 2, 0
_080297E0: .4byte gCurrentSprite
_080297E4: .4byte gPreviousCollisionCheck
_080297E8:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08029824
	ldr r2, _08029810 @ =gCurrentSprite
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
	bne _08029814
_0802980A:
	bl DessgeegaPreparingToJumpInit
	b _08029824
	.align 2, 0
_08029810: .4byte gCurrentSprite
_08029814:
	ldr r1, [r2, #0x18]
	ldr r0, _0802982C @ =sDessgeegaOam_31b918
	cmp r1, r0
	bne _08029824
	movs r0, #0xc0
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08029824:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802982C: .4byte sDessgeegaOam_31b918

	thumb_func_start DessgeegaIdleCeiling
DessgeegaIdleCeiling: @ 0x08029830
	push {lr}
	bl DessgeegaCheckSamusInRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802985E
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08029878
	ldr r2, _08029864 @ =gCurrentSprite
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
	bne _08029868
_0802985E:
	bl DessgeegaPreparingToJumpInit
	b _08029878
	.align 2, 0
_08029864: .4byte gCurrentSprite
_08029868:
	ldr r1, [r2, #0x18]
	ldr r0, _0802987C @ =sDessgeegaOam_31b918
	cmp r1, r0
	bne _08029878
	movs r0, #0xc0
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08029878:
	pop {r0}
	bx r0
	.align 2, 0
_0802987C: .4byte sDessgeegaOam_31b918

	thumb_func_start DessgeegaSpikeInit
DessgeegaSpikeInit: @ 0x08029880
	push {r4, r5, lr}
	ldr r0, _080298E4 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _080298E8 @ =0x0000FFFB
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
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _080298EC @ =0x0000FFFC
	mov r5, ip
	strh r1, [r5, #0xa]
	movs r2, #4
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _080298F0 @ =sDessgeegaOam_31b9c0
	str r0, [r5, #0x18]
	strb r3, [r5, #0x1c]
	strh r4, [r5, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	subs r1, #2
	movs r0, #3
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080298E4: .4byte gCurrentSprite
_080298E8: .4byte 0x0000FFFB
_080298EC: .4byte 0x0000FFFC
_080298F0: .4byte sDessgeegaOam_31b9c0

	thumb_func_start DessgeegaSpikeMove
DessgeegaSpikeMove: @ 0x080298F4
	push {r4, lr}
	ldr r4, _0802990C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08029910
	strh r0, [r4]
	b _08029946
	.align 2, 0
_0802990C: .4byte gCurrentSprite
_08029910:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	ldr r0, _0802992C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08029930
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _08029946
	.align 2, 0
_0802992C: .4byte gPreviousVerticalCollisionCheck
_08029930:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08029940
	ldrh r0, [r4, #4]
	adds r0, #0xa
	b _08029944
_08029940:
	ldrh r0, [r4, #4]
	subs r0, #0xa
_08029944:
	strh r0, [r4, #4]
_08029946:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start DessgeegaSpikeExplodingInit
DessgeegaSpikeExplodingInit: @ 0x0802994C
	ldr r3, _08029968 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	ldr r0, _0802996C @ =sDessgeegaOam_31b9d0
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_08029968: .4byte gCurrentSprite
_0802996C: .4byte sDessgeegaOam_31b9d0

	thumb_func_start DessgeegaSpikeExploding
DessgeegaSpikeExploding: @ 0x08029970
	push {r4, r5, lr}
	ldr r4, _08029998 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r5, #0
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08029990
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08029992
_08029990:
	strh r5, [r4]
_08029992:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08029998: .4byte gCurrentSprite

	thumb_func_start Dessgeega
Dessgeega: @ 0x0802999C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r4, _080299B4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r7, [r0]
	cmp r7, #0
	beq _080299B8
	bl SpriteUtilUpdateFreezeTimer
	b _08029CAC
	.align 2, 0
_080299B4: .4byte gCurrentSprite
_080299B8:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _08029A72
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08029A72
	ldr r0, _08029A38 @ =0x00000181
	bl SoundPlayNotAlreadyPlaying
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08029A72
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r1, [r6]
	movs r0, #0x32
	bl SpriteUtilCountSecondarySpritesWithRamSlot
	cmp r0, #2
	bgt _08029A72
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08029A3C
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x4c
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x32
	bl SpriteSpawnSecondary
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x4c
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x40
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0x32
	bl SpriteSpawnSecondary
	b _08029A72
	.align 2, 0
_08029A38: .4byte 0x00000181
_08029A3C:
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x4c
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x32
	bl SpriteSpawnSecondary
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x4c
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x40
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0x32
	bl SpriteSpawnSecondary
_08029A72:
	ldr r1, _08029A8C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x5b
	bls _08029A82
	b _08029CAC
_08029A82:
	lsls r0, r0, #2
	ldr r1, _08029A90 @ =_08029A94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08029A8C: .4byte gCurrentSprite
_08029A90: .4byte _08029A94
_08029A94: @ jump table
	.4byte _08029C04 @ case 0
	.4byte _08029C0A @ case 1
	.4byte _08029C0E @ case 2
	.4byte _08029CAC @ case 3
	.4byte _08029CAC @ case 4
	.4byte _08029CAC @ case 5
	.4byte _08029CAC @ case 6
	.4byte _08029CAC @ case 7
	.4byte _08029C4C @ case 8
	.4byte _08029CAC @ case 9
	.4byte _08029CAC @ case 10
	.4byte _08029CAC @ case 11
	.4byte _08029CAC @ case 12
	.4byte _08029CAC @ case 13
	.4byte _08029CAC @ case 14
	.4byte _08029CAC @ case 15
	.4byte _08029CAC @ case 16
	.4byte _08029CAC @ case 17
	.4byte _08029CAC @ case 18
	.4byte _08029CAC @ case 19
	.4byte _08029CAC @ case 20
	.4byte _08029CAC @ case 21
	.4byte _08029C64 @ case 22
	.4byte _08029CAC @ case 23
	.4byte _08029C2E @ case 24
	.4byte _08029CAC @ case 25
	.4byte _08029C46 @ case 26
	.4byte _08029CAC @ case 27
	.4byte _08029CAC @ case 28
	.4byte _08029CAC @ case 29
	.4byte _08029CAC @ case 30
	.4byte _08029CAC @ case 31
	.4byte _08029CAC @ case 32
	.4byte _08029CAC @ case 33
	.4byte _08029CAC @ case 34
	.4byte _08029CAC @ case 35
	.4byte _08029CAC @ case 36
	.4byte _08029CAC @ case 37
	.4byte _08029CAC @ case 38
	.4byte _08029CAC @ case 39
	.4byte _08029CAC @ case 40
	.4byte _08029CAC @ case 41
	.4byte _08029CAC @ case 42
	.4byte _08029CAC @ case 43
	.4byte _08029CAC @ case 44
	.4byte _08029CAC @ case 45
	.4byte _08029CAC @ case 46
	.4byte _08029CAC @ case 47
	.4byte _08029CAC @ case 48
	.4byte _08029CAC @ case 49
	.4byte _08029CAC @ case 50
	.4byte _08029CAC @ case 51
	.4byte _08029CAC @ case 52
	.4byte _08029CAC @ case 53
	.4byte _08029CAC @ case 54
	.4byte _08029CAC @ case 55
	.4byte _08029CAC @ case 56
	.4byte _08029CAC @ case 57
	.4byte _08029CAC @ case 58
	.4byte _08029CAC @ case 59
	.4byte _08029CAC @ case 60
	.4byte _08029CAC @ case 61
	.4byte _08029CAC @ case 62
	.4byte _08029CAC @ case 63
	.4byte _08029CAC @ case 64
	.4byte _08029CAC @ case 65
	.4byte _08029CAC @ case 66
	.4byte _08029CAC @ case 67
	.4byte _08029CAC @ case 68
	.4byte _08029CAC @ case 69
	.4byte _08029CAC @ case 70
	.4byte _08029CAC @ case 71
	.4byte _08029CAC @ case 72
	.4byte _08029CAC @ case 73
	.4byte _08029CAC @ case 74
	.4byte _08029CAC @ case 75
	.4byte _08029CAC @ case 76
	.4byte _08029CAC @ case 77
	.4byte _08029CAC @ case 78
	.4byte _08029CAC @ case 79
	.4byte _08029CAC @ case 80
	.4byte _08029CAC @ case 81
	.4byte _08029CAC @ case 82
	.4byte _08029CAC @ case 83
	.4byte _08029CAC @ case 84
	.4byte _08029CAC @ case 85
	.4byte _08029CAC @ case 86
	.4byte _08029C7C @ case 87
	.4byte _08029C80 @ case 88
	.4byte _08029C86 @ case 89
	.4byte _08029C8A @ case 90
	.4byte _08029C90 @ case 91
_08029C04:
	bl DessgeegaInit
	b _08029CAC
_08029C0A:
	bl DessgeegaPreparingToJumpInit
_08029C0E:
	ldr r0, _08029C24 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029C28
	bl DessgeegaJumpWarningCeiling
	b _08029CAC
	.align 2, 0
_08029C24: .4byte gCurrentSprite
_08029C28:
	bl DessgeegaJumpWarningGround
	b _08029CAC
_08029C2E:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029C40
	bl DessgeegaJumpingCeiling
	b _08029CAC
_08029C40:
	bl DessgeegaJumpingGround
	b _08029CAC
_08029C46:
	bl DessgeegaLanding
	b _08029CAC
_08029C4C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029C5E
	bl DessgeegaIdleCeiling
	b _08029CAC
_08029C5E:
	bl DessgeegaIdleGround
	b _08029CAC
_08029C64:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029C76
	bl DessgeegaFallingCeiling
	b _08029CAC
_08029C76:
	bl DessgeegaFallingGround
	b _08029CAC
_08029C7C:
	bl SpriteDyingInit
_08029C80:
	bl SpriteDying
	b _08029CAC
_08029C86:
	bl DessgeegaInit
_08029C8A:
	bl SpriteSpawningFromX
	b _08029CAC
_08029C90:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08029CA2
	ldrh r0, [r2, #2]
	adds r0, #0x40
	b _08029CA6
_08029CA2:
	ldrh r0, [r2, #2]
	subs r0, #0x40
_08029CA6:
	strh r0, [r2, #2]
	bl XParasiteInit
_08029CAC:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DessgeegaSpike
DessgeegaSpike: @ 0x08029CB4
	push {lr}
	ldr r0, _08029CCC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08029CDC
	cmp r0, #2
	bgt _08029CD0
	cmp r0, #0
	beq _08029CD6
	b _08029CE8
	.align 2, 0
_08029CCC: .4byte gCurrentSprite
_08029CD0:
	cmp r0, #0x38
	beq _08029CE2
	b _08029CE8
_08029CD6:
	bl DessgeegaSpikeInit
	b _08029CEC
_08029CDC:
	bl DessgeegaSpikeMove
	b _08029CEC
_08029CE2:
	bl DessgeegaSpikeExploding
	b _08029CEC
_08029CE8:
	bl DessgeegaSpikeExplodingInit
_08029CEC:
	pop {r0}
	bx r0
