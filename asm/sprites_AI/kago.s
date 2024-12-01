    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start KagoSetCollision
KagoSetCollision: @ 0x0802F624
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0802F678 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	ldrh r5, [r0, #4]
	adds r6, r1, #0
	subs r6, #0x60
	adds r1, r5, #0
	adds r1, #0x60
	adds r0, r6, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r4, _0802F67C @ =gPreviousCollisionCheck
	ldrb r0, [r4]
	cmp r0, #0x11
	bne _0802F670
	adds r1, r5, #0
	subs r1, #0x60
	adds r0, r6, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r4]
	cmp r0, #0x11
	bne _0802F670
	ldr r4, _0802F680 @ =gCurrentClipdataAffectingAction
	strb r7, [r4]
	adds r1, r5, #0
	adds r1, #0x20
	adds r0, r6, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r1, r5, #0
	subs r1, #0x20
	adds r0, r6, #0
	bl ClipdataProcess
_0802F670:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F678: .4byte gCurrentSprite
_0802F67C: .4byte gPreviousCollisionCheck
_0802F680: .4byte gCurrentClipdataAffectingAction

	thumb_func_start KagoPlaySound
KagoPlaySound: @ 0x0802F684
	push {r4, lr}
	ldr r4, _0802F6A4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802F6AC
	ldr r0, _0802F6A8 @ =0x0000016B
	bl SoundPlayNotAlreadyPlaying
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0x28
	b _0802F714
	.align 2, 0
_0802F6A4: .4byte gCurrentSprite
_0802F6A8: .4byte 0x0000016B
_0802F6AC:
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #4
	bne _0802F6C8
	ldr r0, _0802F6C4 @ =0x0000016D
	bl SoundPlayNotAlreadyPlaying
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0x48
	b _0802F714
	.align 2, 0
_0802F6C4: .4byte 0x0000016D
_0802F6C8:
	cmp r0, #3
	bne _0802F6DC
	movs r0, #0xb7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0x38
	b _0802F714
_0802F6DC:
	cmp r0, #2
	bne _0802F6F4
	ldr r0, _0802F6F0 @ =0x0000016F
	bl SoundPlayNotAlreadyPlaying
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0x1e
	b _0802F714
	.align 2, 0
_0802F6F0: .4byte 0x0000016F
_0802F6F4:
	cmp r0, #1
	bne _0802F708
	movs r0, #0xb8
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0x12
	b _0802F714
_0802F708:
	ldr r0, _0802F71C @ =0x00000171
	bl SoundPlayNotAlreadyPlaying
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0xc
_0802F714:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F71C: .4byte 0x00000171

	thumb_func_start KagoTurningIntoX
KagoTurningIntoX: @ 0x0802F720
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0802F760 @ =gCurrentSprite
	ldrb r1, [r4, #0x1d]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	adds r0, #0x5c
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0xc
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r4, #2]
	subs r0, #0x1c
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0xc
	strh r0, [r4, #4]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F760: .4byte gCurrentSprite

	thumb_func_start KagoInit
KagoInit: @ 0x0802F764
	push {r4, r5, r6, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0802F798 @ =gCurrentSprite
	adds r4, r2, #0
	adds r4, #0x34
	ldrb r3, [r4]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0802F7A0
	movs r0, #8
	movs r1, #0
	orrs r0, r3
	strb r0, [r4]
	adds r3, r2, #0
	adds r3, #0x25
	movs r0, #1
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x28
	strb r1, [r0]
	movs r0, #0x10
	strh r0, [r2, #0xc]
	ldr r0, _0802F79C @ =sKagoOam_337b24
	b _0802F7C0
	.align 2, 0
_0802F798: .4byte gCurrentSprite
_0802F79C: .4byte sKagoOam_337b24
_0802F7A0:
	movs r0, #0xf7
	ands r0, r3
	strb r0, [r4]
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0xd
	strb r0, [r1]
	adds r1, #0x10
	movs r0, #1
	strb r0, [r1]
	subs r1, #0xd
	movs r0, #0x38
	strb r0, [r1]
	movs r0, #0xc0
	strh r0, [r2, #0xc]
	ldr r0, _0802F830 @ =sKagoOam_337b4c
_0802F7C0:
	str r0, [r2, #0x18]
	ldr r6, _0802F834 @ =gCurrentSprite
	ldr r2, _0802F838 @ =sPrimarySpriteStats
	ldrb r1, [r6, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r4, #0
	movs r5, #0
	strh r0, [r6, #0x14]
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #4
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x30
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	bl KagoPlaySound
	adds r1, r6, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	strb r4, [r6, #0x1c]
	strh r5, [r6, #0x16]
	adds r1, #5
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0802F83C @ =0x0000FF88
	strh r0, [r6, #0xa]
	adds r0, #0x48
	strh r0, [r6, #0xe]
	movs r0, #0x30
	strh r0, [r6, #0x10]
	adds r2, r6, #0
	adds r2, #0x24
	ldrb r0, [r2]
	cmp r0, #0x59
	bne _0802F840
	movs r0, #0x5a
	strb r0, [r2]
	movs r0, #0x2c
	strh r0, [r6, #6]
	movs r0, #0xb6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0802F864
	.align 2, 0
_0802F830: .4byte sKagoOam_337b4c
_0802F834: .4byte gCurrentSprite
_0802F838: .4byte sPrimarySpriteStats
_0802F83C: .4byte 0x0000FF88
_0802F840:
	ldrh r0, [r6, #4]
	adds r0, #0x20
	strh r0, [r6, #4]
	adds r0, r6, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0802F85A
	strb r3, [r2]
	b _0802F864
_0802F85A:
	movs r0, #0x18
	strb r0, [r2]
	ldrh r0, [r6, #2]
	subs r0, #0xc0
	strh r0, [r6, #2]
_0802F864:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KagoSpawningFromX
KagoSpawningFromX: @ 0x0802F86C
	push {r4, lr}
	ldr r4, _0802F8A4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4, #6]
	subs r3, r0, #1
	strh r3, [r4, #6]
	lsls r0, r3, #0x10
	cmp r0, #0
	beq _0802F8B0
	ldr r2, _0802F8A8 @ =gWrittenToMosaic_H
	ldr r1, _0802F8AC @ =sXParasiteMosaicValues
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x17
	bhi _0802F8C4
	ldrh r0, [r4, #2]
	subs r0, #8
	strh r0, [r4, #2]
	b _0802F8C4
	.align 2, 0
_0802F8A4: .4byte gCurrentSprite
_0802F8A8: .4byte gWrittenToMosaic_H
_0802F8AC: .4byte sXParasiteMosaicValues
_0802F8B0:
	ldrh r1, [r4]
	ldr r0, _0802F8CC @ =0x00007FFF
	ands r0, r1
	ldr r1, _0802F8D0 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_0802F8C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F8CC: .4byte 0x00007FFF
_0802F8D0: .4byte 0x0000FFDF

	thumb_func_start KagoIdleShort
KagoIdleShort: @ 0x0802F8D4
	push {lr}
	ldr r1, _0802F8F0 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802F8EA
	bl KagoPlaySound
_0802F8EA:
	pop {r0}
	bx r0
	.align 2, 0
_0802F8F0: .4byte gCurrentSprite

	thumb_func_start KagoIdleTall
KagoIdleTall: @ 0x0802F8F4
	push {lr}
	ldr r1, _0802F910 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802F90A
	bl KagoPlaySound
_0802F90A:
	pop {r0}
	bx r0
	.align 2, 0
_0802F910: .4byte gCurrentSprite

	thumb_func_start KagoDyingInit
KagoDyingInit: @ 0x0802F914
	push {r4, lr}
	ldr r4, _0802F950 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F928
	movs r0, #1
	bl KagoSetCollision
_0802F928:
	ldrh r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x58
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	strb r0, [r1]
	movs r0, #0xa1
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	bl SpriteDying
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F950: .4byte gCurrentSprite

	thumb_func_start KagoInsectExplodingInit
KagoInsectExplodingInit: @ 0x0802F954
	push {lr}
	ldr r0, _0802F97C @ =gCurrentSprite
	ldr r1, _0802F980 @ =sKagoOam_337dc4
	str r1, [r0, #0x18]
	movs r1, #0
	strb r1, [r0, #0x1c]
	movs r3, #0
	strh r1, [r0, #0x16]
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x38
	strb r1, [r2]
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #0xb9
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	pop {r0}
	bx r0
	.align 2, 0
_0802F97C: .4byte gCurrentSprite
_0802F980: .4byte sKagoOam_337dc4

	thumb_func_start KagoInsectExploding
KagoInsectExploding: @ 0x0802F984
	push {r4, lr}
	ldr r4, _0802F9A4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802F99C
	movs r0, #0
	strh r0, [r4]
_0802F99C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F9A4: .4byte gCurrentSprite

	thumb_func_start KagoInsectInit
KagoInsectInit: @ 0x0802F9A8
	push {r4, r5, lr}
	ldr r3, _0802FA24 @ =gCurrentSprite
	ldrh r1, [r3]
	ldr r0, _0802FA28 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	movs r2, #0
	strh r0, [r3]
	ldr r1, _0802FA2C @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x35
	movs r5, #1
	strb r5, [r0]
	ldr r0, _0802FA30 @ =sKagoOam_337da4
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r2, [r3, #0x16]
	adds r1, #2
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #8
	strb r0, [r1]
	ldr r0, _0802FA34 @ =0x0000FFD8
	strh r0, [r3, #0xa]
	adds r0, #0x20
	strh r0, [r3, #0xc]
	subs r0, #0xc
	strh r0, [r3, #0xe]
	movs r0, #0x14
	strh r0, [r3, #0x10]
	subs r1, #5
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0802FA38 @ =gFrameCounter8Bit
	ldrb r2, [r0]
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x1a
	adds r0, #5
	adds r1, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r4, [r0]
	lsrs r2, r2, #0x18
	cmp r2, #7
	bls _0802FA3C
	subs r0, #2
	strb r5, [r0]
	b _0802FA42
	.align 2, 0
_0802FA24: .4byte gCurrentSprite
_0802FA28: .4byte 0x0000FFFB
_0802FA2C: .4byte sSecondarySpriteStats
_0802FA30: .4byte sKagoOam_337da4
_0802FA34: .4byte 0x0000FFD8
_0802FA38: .4byte gSpriteRandomNumber
_0802FA3C:
	adds r0, r3, #0
	adds r0, #0x2f
	strb r4, [r0]
_0802FA42:
	bl SpriteUtilChooseRandomXFlip
	ldr r1, _0802FA60 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x14
	strh r0, [r1, #6]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FA60: .4byte gCurrentSprite

	thumb_func_start KagoInsectJumpWarningInit
KagoInsectJumpWarningInit: @ 0x0802FA64
	ldr r1, _0802FA7C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0802FA80 @ =sKagoOam_337d84
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0802FA7C: .4byte gCurrentSprite
_0802FA80: .4byte sKagoOam_337d84

	thumb_func_start KagoInsectJumpingInit
KagoInsectJumpingInit: @ 0x0802FA84
	push {r4, lr}
	ldr r3, _0802FAC0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0802FAC4 @ =sKagoOam_337da4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	movs r4, #0
	strh r2, [r3, #0x16]
	adds r1, #0xc
	movs r0, #5
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r4, [r0]
	ldr r0, _0802FAC8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0802FACC
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	b _0802FAD2
	.align 2, 0
_0802FAC0: .4byte gCurrentSprite
_0802FAC4: .4byte sKagoOam_337da4
_0802FAC8: .4byte gSpriteRandomNumber
_0802FACC:
	adds r0, r3, #0
	adds r0, #0x2f
	strb r4, [r0]
_0802FAD2:
	adds r2, r3, #0
	ldr r1, _0802FAF4 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0802FAF8
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802FB0C
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0
	strb r0, [r1]
	b _0802FB0C
	.align 2, 0
_0802FAF4: .4byte gSamusData
_0802FAF8:
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _0802FB0C
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
_0802FB0C:
	ldr r0, _0802FB18 @ =0x00000173
	bl SoundPlayNotAlreadyPlaying
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802FB18: .4byte 0x00000173

	thumb_func_start KagoInsectFallingInit
KagoInsectFallingInit: @ 0x0802FB1C
	ldr r0, _0802FB38 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x16
	strb r1, [r2]
	ldr r1, _0802FB3C @ =sKagoOam_337da4
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	movs r1, #0
	strh r3, [r0, #0x16]
	adds r0, #0x31
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802FB38: .4byte gCurrentSprite
_0802FB3C: .4byte sKagoOam_337da4

	thumb_func_start KagoInsectJumpWarning
KagoInsectJumpWarning: @ 0x0802FB40
	push {r4, r5, lr}
	ldr r4, _0802FB54 @ =gCurrentSprite
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _0802FB58
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0802FB98
	.align 2, 0
_0802FB54: .4byte gCurrentSprite
_0802FB58:
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0802FB88 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0802FB8C
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0802FB8C
	bl KagoInsectFallingInit
	b _0802FB98
	.align 2, 0
_0802FB88: .4byte gPreviousCollisionCheck
_0802FB8C:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802FB98
	bl KagoInsectJumpingInit
_0802FB98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KagoInsectJumping
KagoInsectJumping: @ 0x0802FBA0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _0802FBB8 @ =gCurrentSprite
	ldrh r1, [r0, #0x14]
	adds r3, r0, #0
	cmp r1, #0
	bne _0802FBBC
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0802FDBA
	.align 2, 0
_0802FBB8: .4byte gCurrentSprite
_0802FBBC:
	movs r7, #0
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r5, [r0]
	adds r4, r5, #0
	cmp r4, #0
	bne _0802FC10
	adds r0, #1
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0802FBE8
	ldrh r0, [r3]
	movs r1, #0x40
	eors r0, r1
	movs r1, #0
	strh r0, [r3]
	ldr r0, _0802FBE4 @ =sKagoOam_337db4
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	b _0802FBF2
	.align 2, 0
_0802FBE4: .4byte sKagoOam_337db4
_0802FBE8:
	cmp r0, #0x16
	bne _0802FBF4
	ldr r0, _0802FC08 @ =sKagoOam_337da4
	str r0, [r3, #0x18]
	strb r7, [r3, #0x1c]
_0802FBF2:
	strh r7, [r3, #0x16]
_0802FBF4:
	ldr r1, _0802FC0C @ =sKagoInsectLowJumpVelocity
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	b _0802FCD4
	.align 2, 0
_0802FC08: .4byte sKagoOam_337da4
_0802FC0C: .4byte sKagoInsectLowJumpVelocity
_0802FC10:
	ldr r1, _0802FC58 @ =sKagoInsectMediumJumpVelocity
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802FC7E
	ldrh r0, [r3, #2]
	subs r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r3, r2]
	ldrh r2, [r3, #4]
	adds r1, r1, r2
	adds r1, #4
	str r3, [sp]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0802FC5C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	ldr r3, [sp]
	cmp r0, #0x11
	bne _0802FC64
	ldrh r0, [r3, #4]
	subs r0, #4
	movs r2, #0
	strh r0, [r3, #4]
	ldrh r1, [r3]
	ldr r0, _0802FC60 @ =0x0000FFBF
	ands r0, r1
	b _0802FCAA
	.align 2, 0
_0802FC58: .4byte sKagoInsectMediumJumpVelocity
_0802FC5C: .4byte gPreviousCollisionCheck
_0802FC60: .4byte 0x0000FFBF
_0802FC64:
	lsls r0, r6, #0x10
	cmp r0, #0
	ble _0802FC78
	ldr r1, _0802FC74 @ =0x0000FFFD
	adds r0, r4, r1
	ldrh r2, [r3, #4]
	adds r0, r0, r2
	b _0802FCD2
	.align 2, 0
_0802FC74: .4byte 0x0000FFFD
_0802FC78:
	ldrh r0, [r3, #4]
	adds r0, r0, r5
	b _0802FCD2
_0802FC7E:
	ldrh r0, [r3, #2]
	subs r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r3, r2]
	ldrh r2, [r3, #4]
	adds r1, r1, r2
	subs r1, #4
	str r3, [sp]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0802FCB8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	ldr r3, [sp]
	cmp r0, #0x11
	bne _0802FCC0
	ldrh r0, [r3, #4]
	adds r0, #4
	movs r2, #0
	strh r0, [r3, #4]
	ldrh r0, [r3]
	movs r1, #0x40
	orrs r0, r1
_0802FCAA:
	strh r0, [r3]
	ldr r0, _0802FCBC @ =sKagoOam_337db4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r7, [r3, #0x16]
	b _0802FCD4
	.align 2, 0
_0802FCB8: .4byte gPreviousCollisionCheck
_0802FCBC: .4byte sKagoOam_337db4
_0802FCC0:
	lsls r0, r6, #0x10
	cmp r0, #0
	ble _0802FCCE
	subs r1, r4, #3
	ldrh r0, [r3, #4]
	subs r0, r0, r1
	b _0802FCD2
_0802FCCE:
	ldrh r0, [r3, #4]
	subs r0, r0, r5
_0802FCD2:
	strh r0, [r3, #4]
_0802FCD4:
	adds r4, r3, #0
	ldrh r0, [r4, #2]
	adds r0, r0, r6
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0x26
	bhi _0802FCEA
	adds r0, #1
	strb r0, [r1]
_0802FCEA:
	lsls r0, r6, #0x10
	cmp r0, #0
	ble _0802FD54
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _0802FD0C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0802FD10
	strh r1, [r4, #2]
	bl KagoInsectJumpWarningInit
	b _0802FDBA
	.align 2, 0
_0802FD0C: .4byte gPreviousVerticalCollisionCheck
_0802FD10:
	cmp r7, #0
	bne _0802FDBA
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0802FD46
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0802FD42
	movs r7, #1
_0802FD42:
	cmp r7, #0
	beq _0802FDBA
_0802FD46:
	ldr r0, _0802FD50 @ =gCurrentSprite
	strh r1, [r0, #2]
	bl KagoInsectJumpWarningInit
	b _0802FDBA
	.align 2, 0
_0802FD50: .4byte gCurrentSprite
_0802FD54:
	movs r7, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	str r3, [sp]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r4, _0802FDA8 @ =gPreviousCollisionCheck
	ldrb r0, [r4]
	ldr r3, [sp]
	cmp r0, #0x11
	beq _0802FD96
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	ldrh r2, [r3, #2]
	adds r0, r0, r2
	movs r2, #0xe
	ldrsh r1, [r3, r2]
	ldrh r3, [r3, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r4]
	cmp r0, #0x11
	bne _0802FD92
	movs r7, #1
_0802FD92:
	cmp r7, #0
	beq _0802FDBA
_0802FD96:
	ldr r2, _0802FDAC @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802FDB0
	ldrh r0, [r2, #4]
	subs r0, #4
	b _0802FDB4
	.align 2, 0
_0802FDA8: .4byte gPreviousCollisionCheck
_0802FDAC: .4byte gCurrentSprite
_0802FDB0:
	ldrh r0, [r2, #4]
	adds r0, #4
_0802FDB4:
	strh r0, [r2, #4]
	bl KagoInsectFallingInit
_0802FDBA:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KagoInsectFalling
KagoInsectFalling: @ 0x0802FDC4
	push {r4, r5, r6, r7, lr}
	ldr r4, _0802FDD8 @ =gCurrentSprite
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _0802FDDC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0802FE74
	.align 2, 0
_0802FDD8: .4byte gCurrentSprite
_0802FDDC:
	movs r6, #0
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _0802FE2C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0802FE22
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0802FE22
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0802FE1E
	movs r6, #1
_0802FE1E:
	cmp r6, #0
	beq _0802FE34
_0802FE22:
	ldr r0, _0802FE30 @ =gCurrentSprite
	strh r1, [r0, #2]
	bl KagoInsectJumpWarningInit
	b _0802FE74
	.align 2, 0
_0802FE2C: .4byte gPreviousVerticalCollisionCheck
_0802FE30: .4byte gCurrentSprite
_0802FE34:
	adds r3, r4, #0
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _0802FE60 @ =sSpritesFallingSpeedQuickAcceleration
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0802FE64 @ =0x00007FFF
	cmp r1, r0
	bne _0802FE68
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _0802FE74
	.align 2, 0
_0802FE60: .4byte sSpritesFallingSpeedQuickAcceleration
_0802FE64: .4byte 0x00007FFF
_0802FE68:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_0802FE74:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Kago
Kago: @ 0x0802FE7C
	push {lr}
	ldr r2, _0802FEAC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802FEB4
	ldr r0, _0802FEB0 @ =0x0000FF88
	strh r0, [r2, #0xa]
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #1
	bne _0802FEFA
	movs r0, #0xb5
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0802FEFA
	.align 2, 0
_0802FEAC: .4byte gCurrentSprite
_0802FEB0: .4byte 0x0000FF88
_0802FEB4:
	ldr r0, _0802FED4 @ =0x0000FF78
	strh r0, [r2, #0xa]
	adds r3, r2, #0
	adds r3, #0x31
	ldrb r0, [r3]
	cmp r0, #0
	beq _0802FEDC
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802FEFA
	ldr r0, _0802FED8 @ =sKagoOam_337b4c
	str r0, [r2, #0x18]
	b _0802FEFA
	.align 2, 0
_0802FED4: .4byte 0x0000FF78
_0802FED8: .4byte sKagoOam_337b4c
_0802FEDC:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #1
	bne _0802FEFA
	ldr r1, [r2, #0x18]
	ldr r0, _0802FF58 @ =sKagoOam_337b4c
	cmp r1, r0
	bne _0802FEFA
	ldr r0, _0802FF5C @ =sKagoOam_337ca4
	str r0, [r2, #0x18]
	movs r0, #0x3c
	strb r0, [r3]
_0802FEFA:
	ldr r1, _0802FF60 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802FF68
	ldr r0, _0802FF64 @ =0x0000FF88
	strh r0, [r1, #0xa]
	adds r2, r1, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	bne _0802FF28
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _0802FF28
	movs r0, #1
	strb r0, [r2]
	movs r0, #2
	bl KagoSetCollision
_0802FF28:
	bl SpriteUtilUpdateFreezeTimer
	ldr r1, _0802FF60 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r2, [r0]
	cmp r2, #0
	bne _0802FFE6
	adds r3, r1, #0
	adds r3, #0x30
	ldrb r0, [r3]
	cmp r0, #0
	beq _0802FFE6
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _0802FFE6
	strb r2, [r3]
	movs r0, #1
	bl KagoSetCollision
	b _0802FFE6
	.align 2, 0
_0802FF58: .4byte sKagoOam_337b4c
_0802FF5C: .4byte sKagoOam_337ca4
_0802FF60: .4byte gCurrentSprite
_0802FF64: .4byte 0x0000FF88
_0802FF68:
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x57
	beq _0802FFAE
	cmp r0, #0x57
	bgt _0802FF8A
	cmp r0, #2
	beq _0802FFA2
	cmp r0, #2
	bgt _0802FF84
	cmp r0, #0
	beq _0802FF9C
	b _0802FFCC
_0802FF84:
	cmp r0, #0x18
	beq _0802FFA8
	b _0802FFCC
_0802FF8A:
	cmp r0, #0x59
	beq _0802FFBA
	cmp r0, #0x59
	blt _0802FFB4
	cmp r0, #0x5a
	beq _0802FFBE
	cmp r0, #0x5b
	beq _0802FFC4
	b _0802FFCC
_0802FF9C:
	bl KagoInit
	b _0802FFCC
_0802FFA2:
	bl KagoIdleShort
	b _0802FFCC
_0802FFA8:
	bl KagoIdleTall
	b _0802FFCC
_0802FFAE:
	bl KagoDyingInit
	b _0802FFCC
_0802FFB4:
	bl SpriteDying
	b _0802FFCC
_0802FFBA:
	bl KagoInit
_0802FFBE:
	bl KagoSpawningFromX
	b _0802FFCC
_0802FFC4:
	bl KagoTurningIntoX
	bl XParasiteInit
_0802FFCC:
	ldr r2, _0802FFEC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802FFE6
	ldrh r0, [r2, #2]
	subs r0, #0x1e
	ldrh r1, [r2, #4]
	bl unk_120ac
_0802FFE6:
	pop {r0}
	bx r0
	.align 2, 0
_0802FFEC: .4byte gCurrentSprite

	thumb_func_start KagoInsect
KagoInsect: @ 0x0802FFF0
	push {lr}
	ldr r0, _08030008 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x38
	bls _0802FFFE
	b _08030114
_0802FFFE:
	lsls r0, r0, #2
	ldr r1, _0803000C @ =_08030010
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030008: .4byte gCurrentSprite
_0803000C: .4byte _08030010
_08030010: @ jump table
	.4byte _080300F4 @ case 0
	.4byte _08030114 @ case 1
	.4byte _080300FA @ case 2
	.4byte _08030114 @ case 3
	.4byte _08030114 @ case 4
	.4byte _08030114 @ case 5
	.4byte _08030114 @ case 6
	.4byte _08030114 @ case 7
	.4byte _08030114 @ case 8
	.4byte _08030114 @ case 9
	.4byte _08030114 @ case 10
	.4byte _08030114 @ case 11
	.4byte _08030114 @ case 12
	.4byte _08030114 @ case 13
	.4byte _08030114 @ case 14
	.4byte _08030114 @ case 15
	.4byte _08030114 @ case 16
	.4byte _08030114 @ case 17
	.4byte _08030114 @ case 18
	.4byte _08030114 @ case 19
	.4byte _08030114 @ case 20
	.4byte _08030114 @ case 21
	.4byte _08030106 @ case 22
	.4byte _08030114 @ case 23
	.4byte _08030100 @ case 24
	.4byte _08030114 @ case 25
	.4byte _08030114 @ case 26
	.4byte _08030114 @ case 27
	.4byte _08030114 @ case 28
	.4byte _08030114 @ case 29
	.4byte _08030114 @ case 30
	.4byte _08030114 @ case 31
	.4byte _08030114 @ case 32
	.4byte _08030114 @ case 33
	.4byte _08030114 @ case 34
	.4byte _08030114 @ case 35
	.4byte _08030114 @ case 36
	.4byte _08030114 @ case 37
	.4byte _08030114 @ case 38
	.4byte _08030114 @ case 39
	.4byte _08030114 @ case 40
	.4byte _08030114 @ case 41
	.4byte _08030114 @ case 42
	.4byte _08030114 @ case 43
	.4byte _08030114 @ case 44
	.4byte _08030114 @ case 45
	.4byte _08030114 @ case 46
	.4byte _08030114 @ case 47
	.4byte _08030114 @ case 48
	.4byte _08030114 @ case 49
	.4byte _08030114 @ case 50
	.4byte _08030114 @ case 51
	.4byte _08030114 @ case 52
	.4byte _08030114 @ case 53
	.4byte _08030114 @ case 54
	.4byte _0803010C @ case 55
	.4byte _08030110 @ case 56
_080300F4:
	bl KagoInsectInit
	b _08030114
_080300FA:
	bl KagoInsectJumpWarning
	b _08030114
_08030100:
	bl KagoInsectJumping
	b _08030114
_08030106:
	bl KagoInsectFalling
	b _08030114
_0803010C:
	bl KagoInsectExplodingInit
_08030110:
	bl KagoInsectExploding
_08030114:
	ldr r1, _0803013C @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08030138
	ldrh r0, [r1, #6]
	cmp r0, #0
	beq _08030138
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08030138
	ldr r0, _08030140 @ =0x00007FFF
	ands r0, r2
	strh r0, [r1]
_08030138:
	pop {r0}
	bx r0
	.align 2, 0
_0803013C: .4byte gCurrentSprite
_08030140: .4byte 0x00007FFF
