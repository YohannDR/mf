    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start KihunterGroundCheckInSpittingrange
KihunterGroundCheckInSpittingrange: @ 0x08031CB0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08031CC8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _08031CCC
	movs r0, #0
	b _08031CFE
	.align 2, 0
_08031CC8: .4byte gCurrentSprite
_08031CCC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08031CFC
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08031CFC
	movs r1, #0xb4
	lsls r1, r1, #1
	movs r0, #0x78
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031CF6
	cmp r2, #8
	bne _08031CFC
	b _08031CFA
_08031CF6:
	cmp r2, #4
	bne _08031CFC
_08031CFA:
	movs r5, #1
_08031CFC:
	adds r0, r5, #0
_08031CFE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start KihunterGroundDetectSamus
KihunterGroundDetectSamus: @ 0x08031D04
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08031D1C @ =gCurrentSprite
	ldrh r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _08031D20
	movs r0, #0
	b _08031DB0
	.align 2, 0
_08031D1C: .4byte gCurrentSprite
_08031D20:
	movs r3, #0xf0
	movs r1, #0xfa
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	beq _08031D3A
	adds r1, #0xc8
	adds r3, #0xc8
	ldr r0, _08031D60 @ =0x0000FBFF
	ands r0, r2
	strh r0, [r4]
_08031D3A:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08031DAE
	adds r0, r3, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031D72
	cmp r2, #8
	bne _08031D64
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	adds r1, #0x48
	b _08031D7E
	.align 2, 0
_08031D60: .4byte 0x0000FBFF
_08031D64:
	cmp r2, #4
	bne _08031DAE
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	subs r1, #0x48
	b _08031DA0
_08031D72:
	cmp r2, #4
	bne _08031D94
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	subs r1, #0x48
_08031D7E:
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08031D90 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08031DAE
	movs r5, #1
	b _08031DAE
	.align 2, 0
_08031D90: .4byte gPreviousCollisionCheck
_08031D94:
	cmp r2, #8
	bne _08031DAE
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	adds r1, #0x48
_08031DA0:
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08031DB8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08031DAE
	movs r5, #2
_08031DAE:
	adds r0, r5, #0
_08031DB0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08031DB8: .4byte gPreviousCollisionCheck

	thumb_func_start KihunterTurningIntoX
KihunterTurningIntoX: @ 0x08031DBC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _08031E00 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08031E04
	ldrb r1, [r4, #0x1d]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x1c
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0x18
	b _08031E32
	.align 2, 0
_08031E00: .4byte gCurrentSprite
_08031E04:
	ldrb r1, [r4, #0x1d]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x1c
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x18
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x18
_08031E32:
	strh r0, [r4, #4]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start KihunterGroundInit
KihunterGroundInit: @ 0x08031E3C
	push {r4, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r4, _08031E60 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08031E64
	movs r0, #0
	strh r0, [r4]
	b _08031EDC
	.align 2, 0
_08031E60: .4byte gCurrentSprite
_08031E64:
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _08031ECC @ =0x0000FFA0
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	adds r0, #0x38
	strh r0, [r4, #0xe]
	movs r0, #0x28
	strh r0, [r4, #0x10]
	ldr r0, _08031ED0 @ =0x0833E5B4
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _08031EAC
	ldr r2, _08031ED4 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
_08031EAC:
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _08031ED8
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _08031EDC
	.align 2, 0
_08031ECC: .4byte 0x0000FFA0
_08031ED0: .4byte 0x0833E5B4
_08031ED4: .4byte sPrimarySpriteStats
_08031ED8:
	movs r0, #1
	strb r0, [r1]
_08031EDC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterGroundJumpWarningInit
KihunterGroundJumpWarningInit: @ 0x08031EE4
	push {lr}
	ldr r3, _08031F1C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08031F20 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08031F28
	adds r0, r3, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08031F24 @ =0x0833E554
	b _08031F30
	.align 2, 0
_08031F1C: .4byte gCurrentSprite
_08031F20: .4byte gSpriteRandomNumber
_08031F24: .4byte 0x0833E554
_08031F28:
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	ldr r0, _08031F38 @ =0x0833E57C
_08031F30:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_08031F38: .4byte 0x0833E57C

	thumb_func_start KihhunterGroundJumpInit
KihhunterGroundJumpInit: @ 0x08031F3C
	push {lr}
	ldr r3, _08031F68 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r0, #0
	strh r2, [r3, #0x16]
	adds r1, #0xd
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031F70
	ldrh r0, [r3, #2]
	subs r0, #0x30
	strh r0, [r3, #2]
	ldr r0, _08031F6C @ =0x0833E70C
	b _08031F78
	.align 2, 0
_08031F68: .4byte gCurrentSprite
_08031F6C: .4byte 0x0833E70C
_08031F70:
	ldrh r0, [r3, #2]
	subs r0, #0x20
	strh r0, [r3, #2]
	ldr r0, _08031F84 @ =0x0833E6FC
_08031F78:
	str r0, [r3, #0x18]
	ldr r0, _08031F88 @ =0x00000175
	bl SoundPlayNotAlreadyPlaying
	pop {r0}
	bx r0
	.align 2, 0
_08031F84: .4byte 0x0833E6FC
_08031F88: .4byte 0x00000175

	thumb_func_start KihunterGroundLandingInit
KihunterGroundLandingInit: @ 0x08031F8C
	ldr r1, _08031FA4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x1a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _08031FA8 @ =0x0833E5A4
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08031FA4: .4byte gCurrentSprite
_08031FA8: .4byte 0x0833E5A4

	thumb_func_start KihunterIdleInit
KihunterIdleInit: @ 0x08031FAC
	ldr r1, _08031FC4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #8
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _08031FC8 @ =0x0833E5B4
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08031FC4: .4byte gCurrentSprite
_08031FC8: .4byte 0x0833E5B4

	thumb_func_start KihunterFallingInit
KihunterFallingInit: @ 0x08031FCC
	ldr r3, _08031FE8 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	ldr r0, _08031FEC @ =0x0833E70C
	str r0, [r3, #0x18]
	bx lr
	.align 2, 0
_08031FE8: .4byte gCurrentSprite
_08031FEC: .4byte 0x0833E70C

	thumb_func_start KihunterGroundTurningAroundInit
KihunterGroundTurningAroundInit: @ 0x08031FF0
	ldr r3, _0803200C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r0, #0
	strh r2, [r3, #0x16]
	adds r1, #0xb
	strb r0, [r1]
	ldr r0, _08032010 @ =0x0833E5EC
	str r0, [r3, #0x18]
	bx lr
	.align 2, 0
_0803200C: .4byte gCurrentSprite
_08032010: .4byte 0x0833E5EC

	thumb_func_start KihunterGroundSpittingInit
KihunterGroundSpittingInit: @ 0x08032014
	push {lr}
	ldr r3, _08032040 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r1]
	ldr r0, _08032044 @ =0x0833E684
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _08032048 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803204C
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	b _08032054
	.align 2, 0
_08032040: .4byte gCurrentSprite
_08032044: .4byte 0x0833E684
_08032048: .4byte gSpriteRandomNumber
_0803204C:
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #2
	strb r0, [r1]
_08032054:
	pop {r0}
	bx r0

	thumb_func_start KihunterGroundJumpWarning
KihunterGroundJumpWarning: @ 0x08032058
	push {r4, r5, lr}
	ldr r4, _0803208C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08032090 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08032094
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08032094
	bl KihunterFallingInit
	b _080320A0
	.align 2, 0
_0803208C: .4byte gCurrentSprite
_08032090: .4byte gPreviousCollisionCheck
_08032094:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080320A0
	bl KihhunterGroundJumpInit
_080320A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterGroundJumping
KihunterGroundJumping: @ 0x080320A8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _080320BC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _080320C4
	ldr r1, _080320C0 @ =0x0833C266
	b _080320C6
	.align 2, 0
_080320BC: .4byte gCurrentSprite
_080320C0: .4byte 0x0833C266
_080320C4:
	ldr r1, _08032108 @ =0x0833C252
_080320C6:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r4, _0803210C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803211A
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08032110 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08032114
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #4
	b _08032148
	.align 2, 0
_08032108: .4byte 0x0833C252
_0803210C: .4byte gCurrentSprite
_08032110: .4byte gPreviousCollisionCheck
_08032114:
	ldrh r0, [r4, #4]
	adds r0, #2
	b _08032148
_0803211A:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08032140 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08032144
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #4
	b _08032148
	.align 2, 0
_08032140: .4byte gPreviousCollisionCheck
_08032144:
	ldrh r0, [r4, #4]
	subs r0, #2
_08032148:
	strh r0, [r4, #4]
	ldr r4, _08032180 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0x26
	bhi _08032160
	adds r0, #1
	strb r0, [r1]
_08032160:
	lsls r0, r5, #0x10
	cmp r0, #0
	ble _080321CC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _08032184 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08032188
	strh r1, [r4, #2]
	bl KihunterGroundLandingInit
	b _0803222E
	.align 2, 0
_08032180: .4byte gCurrentSprite
_08032184: .4byte gPreviousVerticalCollisionCheck
_08032188:
	cmp r6, #0
	bne _0803222E
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080321BE
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _080321BA
	movs r6, #1
_080321BA:
	cmp r6, #0
	beq _0803222E
_080321BE:
	ldr r0, _080321C8 @ =gCurrentSprite
	strh r1, [r0, #2]
	bl KihunterGroundLandingInit
	b _0803222E
	.align 2, 0
_080321C8: .4byte gCurrentSprite
_080321CC:
	movs r6, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803221C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803220A
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08032206
	movs r6, #1
_08032206:
	cmp r6, #0
	beq _0803222E
_0803220A:
	ldr r2, _08032220 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08032224
	ldrh r0, [r2, #4]
	subs r0, #4
	b _08032228
	.align 2, 0
_0803221C: .4byte gPreviousCollisionCheck
_08032220: .4byte gCurrentSprite
_08032224:
	ldrh r0, [r2, #4]
	adds r0, #4
_08032228:
	strh r0, [r2, #4]
	bl KihunterFallingInit
_0803222E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start KihunterGroundLanding
KihunterGroundLanding: @ 0x08032234
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08032284
	bl KihunterGroundCheckInSpittingrange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803224E
	bl KihunterGroundSpittingInit
	b _08032284
_0803224E:
	bl KihunterGroundDetectSamus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08032260
	bl KihhunterGroundJumpInit
	b _08032284
_08032260:
	cmp r0, #2
	bne _0803226A
	bl KihunterGroundTurningAroundInit
	b _08032284
_0803226A:
	ldr r0, _0803227C @ =gCurrentSprite
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #2
	bls _08032280
	bl KihunterIdleInit
	b _08032284
	.align 2, 0
_0803227C: .4byte gCurrentSprite
_08032280:
	bl KihunterGroundJumpWarningInit
_08032284:
	pop {r0}
	bx r0

	thumb_func_start KihunterGroundFalling
KihunterGroundFalling: @ 0x08032288
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _080322DC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _080322E0 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080322D2
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _080322D2
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _080322CE
	movs r6, #1
_080322CE:
	cmp r6, #0
	beq _080322E4
_080322D2:
	ldr r0, _080322DC @ =gCurrentSprite
	strh r1, [r0, #2]
	bl KihunterGroundLandingInit
	b _08032324
	.align 2, 0
_080322DC: .4byte gCurrentSprite
_080322E0: .4byte gPreviousVerticalCollisionCheck
_080322E4:
	adds r3, r4, #0
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08032310 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08032314 @ =0x00007FFF
	cmp r1, r0
	bne _08032318
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _08032324
	.align 2, 0
_08032310: .4byte sSpritesFallingSpeed
_08032314: .4byte 0x00007FFF
_08032318:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_08032324:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterGroundIdle
KihunterGroundIdle: @ 0x0803232C
	push {r4, r5, lr}
	ldr r4, _08032360 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08032364 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08032368
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08032368
	bl KihunterFallingInit
	b _080323A0
	.align 2, 0
_08032360: .4byte gCurrentSprite
_08032364: .4byte gPreviousCollisionCheck
_08032368:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080323A0
	bl KihunterGroundDetectSamus
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08032382
	bl KihunterGroundJumpWarningInit
	b _080323A0
_08032382:
	cmp r0, #2
	beq _08032390
	ldr r0, _08032398 @ =gCurrentSprite
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #2
	bls _0803239C
_08032390:
	bl KihunterGroundTurningAroundInit
	b _080323A0
	.align 2, 0
_08032398: .4byte gCurrentSprite
_0803239C:
	bl KihunterGroundJumpWarningInit
_080323A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterGroundTurningAround
KihunterGroundTurningAround: @ 0x080323A8
	push {r4, lr}
	ldr r4, _080323E4 @ =gCurrentSprite
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	beq _080323B8
	ldrh r0, [r4, #2]
	subs r0, #4
	strh r0, [r4, #2]
_080323B8:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080323DC
	ldrh r1, [r4]
	movs r0, #0x40
	eors r1, r0
	movs r2, #0
	movs r3, #0
	strh r1, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #5
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r0, _080323E8 @ =0x0833E604
	str r0, [r4, #0x18]
_080323DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080323E4: .4byte gCurrentSprite
_080323E8: .4byte 0x0833E604

	thumb_func_start KihunterGroundTurningAroundSecondPart
KihunterGroundTurningAroundSecondPart: @ 0x080323EC
	push {r4, lr}
	ldr r4, _08032428 @ =gCurrentSprite
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	beq _080323FC
	ldrh r0, [r4, #2]
	adds r0, #4
	strh r0, [r4, #2]
_080323FC:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08032430
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803242C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08032450
	ldrh r0, [r4, #4]
	subs r0, #4
	b _0803244E
	.align 2, 0
_08032428: .4byte gCurrentSprite
_0803242C: .4byte gPreviousCollisionCheck
_08032430:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08032464 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08032450
	ldrh r0, [r4, #4]
	adds r0, #4
_0803244E:
	strh r0, [r4, #4]
_08032450:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803245C
	bl KihunterIdleInit
_0803245C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032464: .4byte gPreviousCollisionCheck

	thumb_func_start KihunterGroundSpitting
KihunterGroundSpitting: @ 0x08032468
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _080324B0 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0, #0x16]
	cmp r0, #0xb
	bne _080324DC
	mov r1, ip
	ldrb r0, [r1, #0x1c]
	cmp r0, #3
	bne _080324DC
	ldrh r1, [r1]
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080324B4
	mov r4, ip
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x58
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x60
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x11
	bl SpriteSpawnSecondary
	b _080324D4
	.align 2, 0
_080324B0: .4byte gCurrentSprite
_080324B4:
	mov r5, ip
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0x58
	str r0, [sp]
	ldrh r0, [r5, #4]
	subs r0, #0x60
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x11
	bl SpriteSpawnSecondary
_080324D4:
	movs r0, #0xbc
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080324DC:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080324F8
	ldr r1, _08032500 @ =gCurrentSprite
	adds r1, #0x30
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080324F8
	bl KihunterGroundJumpWarningInit
_080324F8:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032500: .4byte gCurrentSprite

	thumb_func_start KihunterFlyingXMovement
KihunterFlyingXMovement: @ 0x08032504
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, r5, #0
	ldr r4, _08032534 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803253C
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08032538 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08032550
	ldrh r0, [r4, #4]
	adds r0, r5, r0
	b _0803255C
	.align 2, 0
_08032534: .4byte gCurrentSprite
_08032538: .4byte gPreviousCollisionCheck
_0803253C:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08032554 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08032558
_08032550:
	movs r0, #1
	b _08032560
	.align 2, 0
_08032554: .4byte gPreviousCollisionCheck
_08032558:
	ldrh r0, [r4, #4]
	subs r0, r0, r6
_0803255C:
	strh r0, [r4, #4]
	movs r0, #0
_08032560:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start KihunterFlyingInit
KihunterFlyingInit: @ 0x08032568
	push {r4, r5, lr}
	sub sp, #0xc
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r4, _0803258C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08032590
	movs r0, #0
	strh r0, [r4]
	b _08032646
	.align 2, 0
_0803258C: .4byte gCurrentSprite
_08032590:
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _080325FC @ =0x0000FFA0
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	adds r0, #0x38
	strh r0, [r4, #0xe]
	movs r0, #0x28
	strh r0, [r4, #0x10]
	ldr r0, _08032600 @ =0x0833E454
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	ldr r2, _08032604 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803260C
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	ldrh r1, [r4]
	ldr r0, _08032608 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	b _08032610
	.align 2, 0
_080325FC: .4byte 0x0000FFA0
_08032600: .4byte 0x0833E454
_08032604: .4byte sPrimarySpriteStats
_08032608: .4byte 0x0000FFFB
_0803260C:
	movs r0, #1
	strb r0, [r1]
_08032610:
	ldr r5, _08032650 @ =gCurrentSprite
	ldrh r0, [r5, #2]
	strh r0, [r5, #8]
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	ldrh r4, [r5]
	movs r0, #0x40
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x10
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08032646
	movs r0, #0
	strh r0, [r5]
_08032646:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08032650: .4byte gCurrentSprite

	thumb_func_start KihunterFlyingIdleInit
KihunterFlyingIdleInit: @ 0x08032654
	ldr r3, _08032678 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	ldr r0, _0803267C @ =0x0833E454
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_08032678: .4byte gCurrentSprite
_0803267C: .4byte 0x0833E454

	thumb_func_start KihunterFlyingTurningAroundInit
KihunterFlyingTurningAroundInit: @ 0x08032680
	ldr r1, _08032698 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0803269C @ =0x0833E5EC
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08032698: .4byte gCurrentSprite
_0803269C: .4byte 0x0833E5EC

	thumb_func_start KihunterFlyingIdle
KihunterFlyingIdle: @ 0x080326A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _080326D8 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _080326DC @ =0x0833C27A
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _080326E0 @ =0x00007FFF
	cmp r1, r0
	bne _080326C4
	ldrh r4, [r5]
	movs r2, #0
_080326C4:
	adds r0, r2, #1
	strb r0, [r6]
	lsls r0, r4, #0x10
	cmp r0, #0
	ble _080326E4
	ldrh r0, [r3, #2]
	ldrh r1, [r3, #4]
	bl SpriteUtilCheckCollisionAtPosition
	b _080326EE
	.align 2, 0
_080326D8: .4byte gCurrentSprite
_080326DC: .4byte 0x0833C27A
_080326E0: .4byte 0x00007FFF
_080326E4:
	ldrh r0, [r3, #2]
	subs r0, #0x60
	ldrh r1, [r3, #4]
	bl SpriteUtilCheckCollisionAtPosition
_080326EE:
	ldr r0, _08032714 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _080326FE
	ldr r1, _08032718 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	adds r0, r0, r4
	strh r0, [r1, #2]
_080326FE:
	movs r0, #2
	bl KihunterFlyingXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803271C
	ldr r0, _08032718 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
	strb r1, [r0]
	b _080327A8
	.align 2, 0
_08032714: .4byte gPreviousCollisionCheck
_08032718: .4byte gCurrentSprite
_0803271C:
	ldr r6, _08032780 @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x2f
	bne _080327A8
	movs r0, #0x2e
	adds r0, r0, r6
	mov r8, r0
	ldrb r0, [r0]
	adds r0, #1
	mov r1, r8
	strb r0, [r1]
	ldr r7, _08032784 @ =gSamusData
	ldrh r5, [r7, #0x18]
	ldrh r4, [r6, #2]
	subs r4, #0x60
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #0xf0
	lsls r1, r1, #2
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r4
	bhs _08032758
	movs r0, #0
_08032758:
	cmp r0, #0
	beq _080327A8
	ldrh r1, [r6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08032788
	ldrh r0, [r6, #4]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bls _080327A0
	mov r7, r8
	ldrb r0, [r7]
	cmp r0, #1
	bls _080327A8
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #3
	b _080327A6
	.align 2, 0
_08032780: .4byte gCurrentSprite
_08032784: .4byte gSamusData
_08032788:
	ldrh r0, [r6, #4]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bhs _080327A0
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #1
	bls _080327A8
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #3
	b _080327A6
_080327A0:
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0x29
_080327A6:
	strb r0, [r1]
_080327A8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterTurningAround
KihunterTurningAround: @ 0x080327B4
	push {r4, lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080327DC
	ldr r2, _080327E4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	eors r1, r0
	movs r3, #0
	movs r4, #0
	strh r1, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #5
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _080327E8 @ =0x0833E604
	str r0, [r2, #0x18]
_080327DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080327E4: .4byte gCurrentSprite
_080327E8: .4byte 0x0833E604

	thumb_func_start KihunterFlyingTurningAroundSecondPart
KihunterFlyingTurningAroundSecondPart: @ 0x080327EC
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080327FA
	bl KihunterFlyingIdleInit
_080327FA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterFlyingUpdateSwipeAnimation
KihunterFlyingUpdateSwipeAnimation: @ 0x08032800
	push {r4, lr}
	ldr r4, _08032830 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #3
	beq _0803287E
	movs r0, #0xa0
	movs r1, #0x80
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803284E
	ldr r0, [r4, #0x18]
	ldr r1, _08032834 @ =0x0833E50C
	cmp r0, r1
	beq _08032838
	str r1, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	b _0803287E
	.align 2, 0
_08032830: .4byte gCurrentSprite
_08032834: .4byte 0x0833E50C
_08032838:
	ldrh r0, [r4, #0x16]
	cmp r0, #2
	bne _0803287E
	ldrb r0, [r4, #0x1c]
	cmp r0, #4
	bne _0803287E
	movs r0, #0xbb
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0803287E
_0803284E:
	ldr r1, [r4, #0x18]
	ldr r0, _08032884 @ =0x0833E50C
	cmp r1, r0
	bne _0803287E
	ldrh r0, [r4, #0x16]
	cmp r0, #2
	bne _0803286A
	ldrb r0, [r4, #0x1c]
	cmp r0, #4
	bne _0803286A
	movs r0, #0xbb
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803286A:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803287E
	ldr r0, _08032888 @ =gCurrentSprite
	ldr r1, _0803288C @ =0x0833E454
	str r1, [r0, #0x18]
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
_0803287E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032884: .4byte 0x0833E50C
_08032888: .4byte gCurrentSprite
_0803288C: .4byte 0x0833E454

	thumb_func_start KihunterFlyingSwoopingDownInit
KihunterFlyingSwoopingDownInit: @ 0x08032890
	push {r4, lr}
	ldr r3, _080328EC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r4, [r0]
	subs r1, #0xa
	movs r0, #0x2a
	strb r0, [r1]
	ldr r2, _080328F0 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r3, #2]
	subs r0, r0, r1
	movs r1, #0xb4
	lsls r1, r1, #1
	cmp r0, r1
	bgt _080328D2
	ldr r0, _080328F4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xa
	bls _08032900
_080328D2:
	ldr r0, _080328F8 @ =0x0833E4A4
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #3
	strb r0, [r1]
	ldr r0, _080328FC @ =0x00000177
	bl SoundPlayNotAlreadyPlaying
	b _08032906
	.align 2, 0
_080328EC: .4byte gCurrentSprite
_080328F0: .4byte gSamusData
_080328F4: .4byte gSpriteRandomNumber
_080328F8: .4byte 0x0833E4A4
_080328FC: .4byte 0x00000177
_08032900:
	ldr r0, _0803290C @ =0x00000179
	bl SoundPlayNotAlreadyPlaying
_08032906:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803290C: .4byte 0x00000179

	thumb_func_start KihunterFlyingSwoopingDown
KihunterFlyingSwoopingDown: @ 0x08032910
	push {r4, r5, r6, lr}
	bl KihunterFlyingUpdateSwipeAnimation
	ldr r4, _08032958 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, #0x10
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803295C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08032960
	movs r0, #6
	bl KihunterFlyingXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803293E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2d
	strb r0, [r1]
_0803293E:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080329EC
	subs r1, #0xa
	movs r0, #0x2d
	strb r0, [r1]
	b _080329EC
	.align 2, 0
_08032958: .4byte gCurrentSprite
_0803295C: .4byte gPreviousCollisionCheck
_08032960:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #3
	bne _08032978
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	cmp r0, #4
	bls _08032986
	b _08032984
_08032978:
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #1
	cmp r0, #8
	bls _08032986
_08032984:
	movs r0, #8
_08032986:
	bl KihunterFlyingXMovement
	ldr r4, _080329A8 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, #0x80
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080329AC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _080329B0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2b
	strb r0, [r1]
	b _080329EC
	.align 2, 0
_080329A8: .4byte gCurrentSprite
_080329AC: .4byte gPreviousCollisionCheck
_080329B0:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _080329D8 @ =0x0833C2DC
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080329DC @ =0x00007FFF
	cmp r1, r0
	bne _080329E0
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080329EA
	.align 2, 0
_080329D8: .4byte 0x0833C2DC
_080329DC: .4byte 0x00007FFF
_080329E0:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_080329EA:
	strh r0, [r4, #2]
_080329EC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterFlyingSwoopingAcrossInit
KihunterFlyingSwoopingAcrossInit: @ 0x080329F4
	ldr r2, _08032A10 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	movs r1, #0
	movs r0, #0x14
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x31
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	bx lr
	.align 2, 0
_08032A10: .4byte gCurrentSprite

	thumb_func_start KihunterFlyingSwoopingAcross
KihunterFlyingSwoopingAcross: @ 0x08032A14
	push {r4, r5, r6, r7, lr}
	bl KihunterFlyingUpdateSwipeAnimation
	movs r0, #8
	bl KihunterFlyingXMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r4, _08032A5C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, #0x10
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08032A60 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _08032A64
	cmp r5, #0
	beq _08032A44
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2d
	strb r0, [r1]
_08032A44:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08032AC2
	subs r1, #0xa
	movs r0, #0x2d
	b _08032AC0
	.align 2, 0
_08032A5C: .4byte gCurrentSprite
_08032A60: .4byte gPreviousCollisionCheck
_08032A64:
	ldrh r0, [r4, #2]
	adds r0, #0x80
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _08032AB0
	adds r6, r4, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08032A9C @ =0x0833C2FC
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08032AA0 @ =0x00007FFF
	cmp r1, r0
	bne _08032AA4
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #2]
	b _08032AC2
	.align 2, 0
_08032A9C: .4byte 0x0833C2FC
_08032AA0: .4byte 0x00007FFF
_08032AA4:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	b _08032AC2
_08032AB0:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
	adds r1, #3
	strb r0, [r1]
	subs r1, #0xd
	movs r0, #0x2a
_08032AC0:
	strb r0, [r1]
_08032AC2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start KihunterFlyingAfterSwoopingInit
KihunterFlyingAfterSwoopingInit: @ 0x08032AC8
	push {lr}
	ldr r2, _08032AF8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	movs r3, #0
	strb r3, [r0]
	adds r0, #3
	strb r3, [r0]
	subs r0, #0xd
	movs r1, #0x2e
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #3
	bne _08032AF4
	ldr r0, _08032AFC @ =0x0833E454
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	movs r0, #2
	strb r0, [r1]
_08032AF4:
	pop {r0}
	bx r0
	.align 2, 0
_08032AF8: .4byte gCurrentSprite
_08032AFC: .4byte 0x0833E454

	thumb_func_start KihunterFlyingAfterSwooping
KihunterFlyingAfterSwooping: @ 0x08032B00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08032B24
	ldr r2, _08032B7C @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _08032B80 @ =0x0833E50C
	cmp r1, r0
	bne _08032B24
	ldr r0, _08032B84 @ =0x0833E454
	str r0, [r2, #0x18]
	strb r7, [r2, #0x1c]
	strh r7, [r2, #0x16]
_08032B24:
	movs r0, #6
	bl KihunterFlyingXMovement
	ldr r4, _08032B7C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08032B88 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08032BFA
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r1, [r2]
	cmp r1, #0
	bne _08032BAE
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r5, [r4, #2]
	cmp r0, r5
	bge _08032BA2
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _08032B8C @ =0x0833C30C
	mov r8, r1
	lsls r0, r2, #1
	add r0, r8
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08032B90 @ =0x00007FFF
	cmp r1, r0
	bne _08032B94
	subs r0, r2, #1
	lsls r0, r0, #1
	add r0, r8
	ldrh r3, [r0]
	adds r0, r5, r3
	strh r0, [r4, #2]
	b _08032C00
	.align 2, 0
_08032B7C: .4byte gCurrentSprite
_08032B80: .4byte 0x0833E50C
_08032B84: .4byte 0x0833E454
_08032B88: .4byte gPreviousCollisionCheck
_08032B8C: .4byte 0x0833C30C
_08032B90: .4byte 0x00007FFF
_08032B94:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	b _08032C00
_08032BA2:
	movs r0, #1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	b _08032C00
_08032BAE:
	ldrh r3, [r4, #2]
	ldrh r0, [r4, #8]
	mov ip, r3
	cmp r0, r3
	bhs _08032BFA
	movs r5, #0x31
	adds r5, r5, r4
	mov r8, r5
	ldrb r2, [r5]
	ldr r6, _08032BE4 @ =0x0833C324
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	mov sb, r1
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08032BE8 @ =0x00007FFF
	cmp r1, r0
	bne _08032BEC
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	add r0, ip
	strh r0, [r4, #2]
	b _08032C00
	.align 2, 0
_08032BE4: .4byte 0x0833C324
_08032BE8: .4byte 0x00007FFF
_08032BEC:
	adds r0, r2, #1
	mov r6, r8
	strb r0, [r6]
	mov r1, sb
	adds r0, r3, r1
	strh r0, [r4, #2]
	b _08032C00
_08032BFA:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08032C00:
	cmp r7, #0
	beq _08032C54
	ldr r2, _08032C2C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08032C34
	ldr r1, _08032C30 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08032C4C
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	b _08032C52
	.align 2, 0
_08032C2C: .4byte gCurrentSprite
_08032C30: .4byte gSamusData
_08032C34:
	ldr r1, _08032C48 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _08032C4C
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	b _08032C52
	.align 2, 0
_08032C48: .4byte gSamusData
_08032C4C:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
_08032C52:
	strb r0, [r1]
_08032C54:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start KihunterWingsInit
KihunterWingsInit: @ 0x08032C60
	push {r4, lr}
	ldr r0, _08032CDC @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _08032CE0 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08032C88
	mov r4, ip
	ldrh r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r4]
_08032C88:
	mov r0, ip
	ldrh r1, [r0]
	ldr r0, _08032CE4 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #0x27
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _08032CE8 @ =0x0000FFFC
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
	subs r1, #2
	movs r0, #3
	strb r0, [r1]
	ldr r0, _08032CEC @ =0x0833E474
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032CDC: .4byte gCurrentSprite
_08032CE0: .4byte gSpriteData
_08032CE4: .4byte 0x0000FFFB
_08032CE8: .4byte 0x0000FFFC
_08032CEC: .4byte 0x0833E474

	thumb_func_start KihunterWingsIdle
KihunterWingsIdle: @ 0x08032CF0
	push {r4, r5, lr}
	ldr r3, _08032D28 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r4, [r0]
	ldr r1, _08032D2C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2, #2]
	strh r0, [r3, #2]
	ldrh r0, [r2, #4]
	strh r0, [r3, #4]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x57
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r1, #0
	cmp r0, #1
	bhi _08032D30
	bl SpriteDyingInit
	bl SpriteDying
	b _08032DBA
	.align 2, 0
_08032D28: .4byte gCurrentSprite
_08032D2C: .4byte gSpriteData
_08032D30:
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08032D42
	ldrh r0, [r3]
	movs r1, #0x20
	orrs r0, r1
	b _08032D48
_08032D42:
	ldrh r1, [r3]
	ldr r0, _08032D64 @ =0x0000FFDF
	ands r0, r1
_08032D48:
	strh r0, [r3]
	lsls r2, r4, #3
	subs r0, r2, r4
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08032D68
	ldrh r1, [r3]
	movs r0, #0x40
	orrs r0, r1
	b _08032D6E
	.align 2, 0
_08032D64: .4byte 0x0000FFDF
_08032D68:
	ldrh r1, [r3]
	ldr r0, _08032DAC @ =0x0000FFBF
	ands r0, r1
_08032D6E:
	strh r0, [r3]
	subs r0, r2, r4
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r0, [r0, #0x14]
	cmp r0, #6
	bhi _08032DBA
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _08032DB0 @ =0x0833E4C4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	ldrh r0, [r3, #2]
	subs r0, #0x60
	strh r0, [r3, #2]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08032DB4
	ldrh r0, [r3, #4]
	subs r0, #0x20
	b _08032DB8
	.align 2, 0
_08032DAC: .4byte 0x0000FFBF
_08032DB0: .4byte 0x0833E4C4
_08032DB4:
	ldrh r0, [r3, #4]
	adds r0, #0x20
_08032DB8:
	strh r0, [r3, #4]
_08032DBA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start KihunterWingsFalling
KihunterWingsFalling: @ 0x08032DC0
	push {r4, lr}
	ldr r4, _08032DE8 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08032DEC @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08032DF0
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x28
	strb r0, [r1]
	b _08032DF6
	.align 2, 0
_08032DE8: .4byte gCurrentSprite
_08032DEC: .4byte gPreviousVerticalCollisionCheck
_08032DF0:
	ldrh r0, [r4, #2]
	adds r0, #2
	strh r0, [r4, #2]
_08032DF6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start KihunterWingsDisappearing
KihunterWingsDisappearing: @ 0x08032DFC
	push {lr}
	ldr r0, _08032E2C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	ldr r2, _08032E30 @ =gCurrentSprite
	cmp r0, #0
	bne _08032E14
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_08032E14:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08032E28
	strh r0, [r2]
_08032E28:
	pop {r0}
	bx r0
	.align 2, 0
_08032E2C: .4byte gFrameCounter8Bit
_08032E30: .4byte gCurrentSprite

	thumb_func_start KihunterSpitInit
KihunterSpitInit: @ 0x08032E34
	push {r4, lr}
	ldr r0, _08032E94 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08032E98 @ =0x0000FFFB
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
	ldr r0, _08032E9C @ =0x0000FFF8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _08032EA0 @ =0x0833E64C
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032E94: .4byte gCurrentSprite
_08032E98: .4byte 0x0000FFFB
_08032E9C: .4byte 0x0000FFF8
_08032EA0: .4byte 0x0833E64C

	thumb_func_start KihunterSpitMoving
KihunterSpitMoving: @ 0x08032EA4
	push {r4, r5, r6, lr}
	ldr r4, _08032EC8 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08032ECC @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08032ED0
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _08032F2A
	.align 2, 0
_08032EC8: .4byte gCurrentSprite
_08032ECC: .4byte gPreviousVerticalCollisionCheck
_08032ED0:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _08032EF8 @ =0x0833C228
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08032EFC @ =0x00007FFF
	cmp r1, r0
	bne _08032F00
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08032F0A
	.align 2, 0
_08032EF8: .4byte 0x0833C228
_08032EFC: .4byte 0x00007FFF
_08032F00:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_08032F0A:
	strh r0, [r4, #2]
	ldr r2, _08032F20 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08032F24
	ldrh r0, [r2, #4]
	adds r0, #0xc
	b _08032F28
	.align 2, 0
_08032F20: .4byte gCurrentSprite
_08032F24:
	ldrh r0, [r2, #4]
	subs r0, #0xc
_08032F28:
	strh r0, [r2, #4]
_08032F2A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start KihunterSpitExplodingInit
KihunterSpitExplodingInit: @ 0x08032F30
	ldr r3, _08032F4C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	ldr r0, _08032F50 @ =0x0833E664
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_08032F4C: .4byte gCurrentSprite
_08032F50: .4byte 0x0833E664

	thumb_func_start KihunterSpitExploding
KihunterSpitExploding: @ 0x08032F54
	push {r4, lr}
	ldr r4, _08032F74 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08032F6C
	movs r0, #0
	strh r0, [r4]
_08032F6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08032F74: .4byte gCurrentSprite

	thumb_func_start KihunterHiveInit
KihunterHiveInit: @ 0x08032F78
	push {r4, r5, r6, lr}
	sub sp, #0xc
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r5, _08032F9C @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08032FA0
	strh r0, [r5]
	b _08033032
	.align 2, 0
_08032F9C: .4byte gCurrentSprite
_08032FA0:
	adds r0, r5, #0
	adds r0, #0x27
	movs r4, #0
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r2, #0
	ldr r0, _0803303C @ =0x0000FFC0
	strh r0, [r5, #0xa]
	movs r1, #0x30
	strh r1, [r5, #0xc]
	adds r0, #0x10
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #1
	strb r0, [r1]
	adds r1, #0x10
	strb r0, [r1]
	subs r1, #0x13
	movs r0, #0xd
	strb r0, [r1]
	ldr r0, _08033040 @ =0x0833E61C
	str r0, [r5, #0x18]
	strb r2, [r5, #0x1c]
	strh r4, [r5, #0x16]
	ldr r2, _08033044 @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r0, r5, #0
	adds r0, #0x24
	strb r3, [r0]
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	adds r6, r5, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	adds r0, #0x60
	str r0, [sp]
	ldrh r0, [r5, #4]
	subs r0, #0x20
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x2b
	bl SpriteSpawnSecondary
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	adds r0, #0x60
	str r0, [sp]
	ldrh r0, [r5, #4]
	adds r0, #0x20
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x2b
	bl SpriteSpawnSecondary
	movs r0, #0x8c
	lsls r0, r0, #1
	bl unk_2894
_08033032:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803303C: .4byte 0x0000FFC0
_08033040: .4byte 0x0833E61C
_08033044: .4byte sPrimarySpriteStats

	thumb_func_start KihunterHiveSpawnKihunter
KihunterHiveSpawnKihunter: @ 0x08033048
	push {r4, lr}
	sub sp, #0xc
	ldr r3, _080330D0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	subs r1, #0xc
	movs r0, #0x10
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _080330D4 @ =0x00007FDF
	ands r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r3, #6]
	ldr r1, _080330D8 @ =gSamusData
	ldrh r0, [r3, #4]
	movs r4, #0x40
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0803307E
	movs r4, #0
_0803307E:
	ldrb r2, [r3, #0x1f]
	ldrh r0, [r3, #2]
	adds r0, #0x80
	str r0, [sp]
	ldrh r0, [r3, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x5b
	movs r1, #0
	movs r3, #0x20
	bl SpriteSpawnPrimary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080330DC @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x59
	strb r0, [r2]
	ldrh r0, [r1]
	ldr r3, _080330E0 @ =0x00008020
	adds r2, r3, #0
	orrs r0, r2
	movs r2, #0
	orrs r0, r2
	ldr r2, _080330E4 @ =0x0000DFFF
	ands r0, r2
	strh r0, [r1]
	adds r1, #0x34
	ldrb r2, [r1]
	movs r0, #0xfd
	ands r0, r2
	strb r0, [r1]
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080330D0: .4byte gCurrentSprite
_080330D4: .4byte 0x00007FDF
_080330D8: .4byte gSamusData
_080330DC: .4byte gSpriteData
_080330E0: .4byte 0x00008020
_080330E4: .4byte 0x0000DFFF

	thumb_func_start KihunterHiveSpawnCooldown
KihunterHiveSpawnCooldown: @ 0x080330E8
	push {lr}
	ldr r3, _08033110 @ =gCurrentSprite
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0803310A
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #2
	movs r0, #2
	strb r0, [r2]
	adds r2, #0x10
	ldrb r0, [r2]
	orrs r1, r0
	strb r1, [r2]
_0803310A:
	pop {r0}
	bx r0
	.align 2, 0
_08033110: .4byte gCurrentSprite

	thumb_func_start KihunterBugInit
KihunterBugInit: @ 0x08033114
	push {r4, lr}
	ldr r0, _08033180 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08033184 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08033188 @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _0803318C @ =0x0833E62C
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	mov r3, ip
	adds r3, #0x31
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	subs r1, #2
	movs r0, #0xc
	strb r0, [r1]
	ldr r1, _08033190 @ =gFrameCounter8Bit
	ldrb r0, [r1]
	lsls r0, r0, #2
	strb r0, [r3]
	ldrb r1, [r1]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08033194
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x14
	b _0803319A
	.align 2, 0
_08033180: .4byte gCurrentSprite
_08033184: .4byte 0x0000FFFB
_08033188: .4byte 0x0000FFFC
_0803318C: .4byte 0x0833E62C
_08033190: .4byte gSpriteRandomNumber
_08033194:
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x3c
_0803319A:
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterBugIdle
KihunterBugIdle: @ 0x080331A4
	push {r4, r5, r6, r7, lr}
	ldr r3, _0803321C @ =gCurrentSprite
	adds r5, r3, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r4, _08033220 @ =0x0833C104
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _08033224 @ =0x00007FFF
	cmp r0, r6
	bne _080331C4
	ldrh r2, [r4]
	movs r1, #0
_080331C4:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r3, #2]
	adds r0, r0, r2
	strh r0, [r3, #2]
	adds r5, r3, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _08033228 @ =0x0833C186
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _080331E8
	ldrh r2, [r4]
	movs r1, #0
_080331E8:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r3, #4]
	adds r0, r0, r2
	strh r0, [r3, #4]
	ldr r2, _0803322C @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	bne _08033216
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
_08033216:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803321C: .4byte gCurrentSprite
_08033220: .4byte 0x0833C104
_08033224: .4byte 0x00007FFF
_08033228: .4byte 0x0833C186
_0803322C: .4byte gSpriteData

	thumb_func_start KihunterBugChasingSamusInit
KihunterBugChasingSamusInit: @ 0x08033230
	push {r4, lr}
	ldr r4, _08033270 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	movs r2, #1
	strb r2, [r0]
	subs r0, #2
	strb r1, [r0]
	adds r0, #3
	strb r2, [r0]
	strh r1, [r4, #8]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldrh r2, [r4, #2]
	ldr r1, _08033274 @ =gSamusData
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	cmp r2, r0
	ble _0803327C
	ldrh r1, [r4]
	ldr r0, _08033278 @ =0x0000FBFF
	ands r0, r1
	b _08033286
	.align 2, 0
_08033270: .4byte gCurrentSprite
_08033274: .4byte gSamusData
_08033278: .4byte 0x0000FBFF
_0803327C:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
_08033286:
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterBugChasingSamus
KihunterBugChasingSamus: @ 0x08033290
	push {r4, r5, r6, r7, lr}
	ldr r1, _080332B4 @ =gSamusData
	ldrh r0, [r1, #0x26]
	ldrh r2, [r1, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r3, [r1, #0x16]
	movs r7, #0x1e
	movs r6, #0x28
	ldr r0, _080332B8 @ =gCurrentSprite
	ldrh r1, [r0, #8]
	adds r2, r0, #0
	cmp r1, #1
	beq _080332BC
	cmp r1, #3
	beq _080332D6
	b _080332F8
	.align 2, 0
_080332B4: .4byte gSamusData
_080332B8: .4byte gCurrentSprite
_080332BC:
	adds r0, r5, #0
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080332F0
	adds r0, r3, #0
	subs r0, #0x30
	b _080332F4
_080332D6:
	adds r0, r5, #0
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080332F0
	adds r0, r3, #0
	subs r0, #0x30
	b _080332F4
_080332F0:
	adds r0, r3, #0
	adds r0, #0x30
_080332F4:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080332F8:
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08033354
	movs r0, #0x2f
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803332E
	ldrh r1, [r2, #4]
	subs r0, r3, #4
	cmp r1, r0
	bgt _08033368
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r6
	bhs _08033328
	adds r0, #1
	strb r0, [r1]
_08033328:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	b _0803333E
_0803332E:
	subs r1, r0, #1
	mov r0, ip
	strb r1, [r0]
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _08033346
	lsrs r0, r0, #0x1a
_0803333E:
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	b _080333C2
_08033346:
	ldrh r1, [r2]
	ldr r0, _08033350 @ =0x0000FDFF
	ands r0, r1
	b _080333A8
	.align 2, 0
_08033350: .4byte 0x0000FDFF
_08033354:
	movs r0, #0x2f
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08033388
	ldrh r1, [r2, #4]
	adds r0, r3, #4
	cmp r1, r0
	bge _08033374
_08033368:
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	b _080333C2
_08033374:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r6
	bhs _08033382
	adds r0, #1
	strb r0, [r1]
_08033382:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0803339A
_08033388:
	subs r1, r0, #1
	mov r0, ip
	strb r1, [r0]
	lsls r0, r1, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _080333A2
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0803339A:
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	strh r0, [r2, #4]
	b _080333C2
_080333A2:
	ldrh r1, [r2]
	adds r0, r4, #0
	orrs r0, r1
_080333A8:
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _080333C2
	strh r3, [r2, #8]
_080333C2:
	adds r3, r2, #0
	ldrh r4, [r3]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _08033428
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	bne _08033406
	ldrh r1, [r3, #2]
	subs r0, r5, #4
	cmp r1, r0
	ble _080333EC
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r2]
	b _08033482
_080333EC:
	adds r1, r3, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r7
	bhs _080333FA
	adds r0, #1
	strb r0, [r1]
_080333FA:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r1, [r3, #2]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _08033482
_08033406:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0803341A
	lsrs r0, r0, #0x1a
	ldrh r2, [r3, #2]
	adds r0, r0, r2
	strh r0, [r3, #2]
	b _08033482
_0803341A:
	ldr r0, _08033424 @ =0x0000FBFF
	ands r0, r4
	strh r0, [r3]
	adds r1, r3, #0
	b _0803347C
	.align 2, 0
_08033424: .4byte 0x0000FBFF
_08033428:
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803345A
	ldrh r1, [r3, #2]
	adds r0, r5, #4
	cmp r1, r0
	bge _08033446
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r1, ip
	b _08033480
_08033446:
	adds r1, r3, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r7
	bhs _08033454
	adds r0, #1
	strb r0, [r1]
_08033454:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0803346A
_0803345A:
	subs r1, r0, #1
	mov r0, ip
	strb r1, [r0]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08033472
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0803346A:
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #2]
	b _08033482
_08033472:
	ldrh r1, [r2]
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r2]
	adds r1, r2, #0
_0803347C:
	adds r1, #0x31
	movs r0, #1
_08033480:
	strb r0, [r1]
_08033482:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start KihunterGround
KihunterGround: @ 0x08033488
	push {r4, r5, r6, lr}
	ldr r4, _080334B4 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2c
	ldrb r1, [r5]
	movs r6, #0x7f
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #4
	bne _080334A4
	movs r0, #0xba
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080334A4:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _080334B8
	bl SpriteUtilUpdateFreezeTimer
	b _080336C6
	.align 2, 0
_080334B4: .4byte gCurrentSprite
_080334B8:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _080334E0
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080334E0
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080334E0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_080334E0:
	ldr r0, _080334F8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _080334EC
	b _080336C6
_080334EC:
	lsls r0, r0, #2
	ldr r1, _080334FC @ =_08033500
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080334F8: .4byte gCurrentSprite
_080334FC: .4byte _08033500
_08033500: @ jump table
	.4byte _08033670 @ case 0
	.4byte _08033676 @ case 1
	.4byte _0803367A @ case 2
	.4byte _080336C6 @ case 3
	.4byte _08033692 @ case 4
	.4byte _08033698 @ case 5
	.4byte _080336C6 @ case 6
	.4byte _080336C6 @ case 7
	.4byte _0803368C @ case 8
	.4byte _080336C6 @ case 9
	.4byte _080336C6 @ case 10
	.4byte _080336C6 @ case 11
	.4byte _080336C6 @ case 12
	.4byte _080336C6 @ case 13
	.4byte _080336C6 @ case 14
	.4byte _080336C6 @ case 15
	.4byte _080336C6 @ case 16
	.4byte _080336C6 @ case 17
	.4byte _080336C6 @ case 18
	.4byte _080336C6 @ case 19
	.4byte _080336C6 @ case 20
	.4byte _080336C6 @ case 21
	.4byte _080336A4 @ case 22
	.4byte _080336C6 @ case 23
	.4byte _08033680 @ case 24
	.4byte _080336C6 @ case 25
	.4byte _08033686 @ case 26
	.4byte _080336C6 @ case 27
	.4byte _080336C6 @ case 28
	.4byte _080336C6 @ case 29
	.4byte _080336C6 @ case 30
	.4byte _080336C6 @ case 31
	.4byte _080336C6 @ case 32
	.4byte _080336C6 @ case 33
	.4byte _080336C6 @ case 34
	.4byte _080336C6 @ case 35
	.4byte _080336C6 @ case 36
	.4byte _080336C6 @ case 37
	.4byte _080336C6 @ case 38
	.4byte _080336C6 @ case 39
	.4byte _080336C6 @ case 40
	.4byte _080336C6 @ case 41
	.4byte _0803369E @ case 42
	.4byte _080336C6 @ case 43
	.4byte _080336C6 @ case 44
	.4byte _080336C6 @ case 45
	.4byte _080336C6 @ case 46
	.4byte _080336C6 @ case 47
	.4byte _080336C6 @ case 48
	.4byte _080336C6 @ case 49
	.4byte _080336C6 @ case 50
	.4byte _080336C6 @ case 51
	.4byte _080336C6 @ case 52
	.4byte _080336C6 @ case 53
	.4byte _080336C6 @ case 54
	.4byte _080336C6 @ case 55
	.4byte _080336C6 @ case 56
	.4byte _080336C6 @ case 57
	.4byte _080336C6 @ case 58
	.4byte _080336C6 @ case 59
	.4byte _080336C6 @ case 60
	.4byte _080336C6 @ case 61
	.4byte _080336C6 @ case 62
	.4byte _080336C6 @ case 63
	.4byte _080336C6 @ case 64
	.4byte _080336C6 @ case 65
	.4byte _080336C6 @ case 66
	.4byte _080336C6 @ case 67
	.4byte _080336C6 @ case 68
	.4byte _080336C6 @ case 69
	.4byte _080336C6 @ case 70
	.4byte _080336C6 @ case 71
	.4byte _080336C6 @ case 72
	.4byte _080336C6 @ case 73
	.4byte _080336C6 @ case 74
	.4byte _080336C6 @ case 75
	.4byte _080336C6 @ case 76
	.4byte _080336C6 @ case 77
	.4byte _080336C6 @ case 78
	.4byte _080336C6 @ case 79
	.4byte _080336C6 @ case 80
	.4byte _080336C6 @ case 81
	.4byte _080336C6 @ case 82
	.4byte _080336C6 @ case 83
	.4byte _080336C6 @ case 84
	.4byte _080336C6 @ case 85
	.4byte _080336C6 @ case 86
	.4byte _080336AA @ case 87
	.4byte _080336AE @ case 88
	.4byte _080336B4 @ case 89
	.4byte _080336B8 @ case 90
	.4byte _080336BE @ case 91
_08033670:
	bl KihunterGroundInit
	b _080336C6
_08033676:
	bl KihunterGroundJumpWarningInit
_0803367A:
	bl KihunterGroundJumpWarning
	b _080336C6
_08033680:
	bl KihunterGroundJumping
	b _080336C6
_08033686:
	bl KihunterGroundLanding
	b _080336C6
_0803368C:
	bl KihunterGroundIdle
	b _080336C6
_08033692:
	bl KihunterGroundTurningAround
	b _080336C6
_08033698:
	bl KihunterGroundTurningAroundSecondPart
	b _080336C6
_0803369E:
	bl KihunterGroundSpitting
	b _080336C6
_080336A4:
	bl KihunterGroundFalling
	b _080336C6
_080336AA:
	bl SpriteDyingInit
_080336AE:
	bl SpriteDying
	b _080336C6
_080336B4:
	bl KihunterGroundInit
_080336B8:
	bl SpriteSpawningFromX
	b _080336C6
_080336BE:
	bl KihunterTurningIntoX
	bl XParasiteInit
_080336C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start KihunterFlying
KihunterFlying: @ 0x080336CC
	push {r4, lr}
	ldr r4, _08033704 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _080336E6
	movs r0, #0xba
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080336E6:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08033708
	bl SpriteUtilUpdateFreezeTimer
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x10
	bl SpriteUtilUpdateSecondarySpritesFreezeTimer
	b _08033918
	.align 2, 0
_08033704: .4byte gCurrentSprite
_08033708:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08033714
	b _080338FE
_08033714:
	lsls r0, r0, #2
	ldr r1, _08033720 @ =_08033724
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08033720: .4byte _08033724
_08033724: @ jump table
	.4byte _08033894 @ case 0
	.4byte _0803389A @ case 1
	.4byte _0803389E @ case 2
	.4byte _080338A4 @ case 3
	.4byte _080338A8 @ case 4
	.4byte _080338AE @ case 5
	.4byte _080338FE @ case 6
	.4byte _080338FE @ case 7
	.4byte _080338FE @ case 8
	.4byte _080338FE @ case 9
	.4byte _080338FE @ case 10
	.4byte _080338FE @ case 11
	.4byte _080338FE @ case 12
	.4byte _080338FE @ case 13
	.4byte _080338FE @ case 14
	.4byte _080338FE @ case 15
	.4byte _080338FE @ case 16
	.4byte _080338FE @ case 17
	.4byte _080338FE @ case 18
	.4byte _080338FE @ case 19
	.4byte _080338FE @ case 20
	.4byte _080338FE @ case 21
	.4byte _080338FE @ case 22
	.4byte _080338FE @ case 23
	.4byte _080338FE @ case 24
	.4byte _080338FE @ case 25
	.4byte _080338FE @ case 26
	.4byte _080338FE @ case 27
	.4byte _080338FE @ case 28
	.4byte _080338FE @ case 29
	.4byte _080338FE @ case 30
	.4byte _080338FE @ case 31
	.4byte _080338FE @ case 32
	.4byte _080338FE @ case 33
	.4byte _080338FE @ case 34
	.4byte _080338FE @ case 35
	.4byte _080338FE @ case 36
	.4byte _080338FE @ case 37
	.4byte _080338FE @ case 38
	.4byte _080338FE @ case 39
	.4byte _080338FE @ case 40
	.4byte _080338B4 @ case 41
	.4byte _080338B8 @ case 42
	.4byte _080338BE @ case 43
	.4byte _080338C2 @ case 44
	.4byte _080338C8 @ case 45
	.4byte _080338CC @ case 46
	.4byte _080338FE @ case 47
	.4byte _080338FE @ case 48
	.4byte _080338FE @ case 49
	.4byte _080338FE @ case 50
	.4byte _080338FE @ case 51
	.4byte _080338FE @ case 52
	.4byte _080338FE @ case 53
	.4byte _080338FE @ case 54
	.4byte _080338FE @ case 55
	.4byte _080338FE @ case 56
	.4byte _080338FE @ case 57
	.4byte _080338FE @ case 58
	.4byte _080338FE @ case 59
	.4byte _080338FE @ case 60
	.4byte _080338FE @ case 61
	.4byte _080338FE @ case 62
	.4byte _080338FE @ case 63
	.4byte _080338FE @ case 64
	.4byte _080338FE @ case 65
	.4byte _080338FE @ case 66
	.4byte _080338FE @ case 67
	.4byte _080338FE @ case 68
	.4byte _080338FE @ case 69
	.4byte _080338FE @ case 70
	.4byte _080338FE @ case 71
	.4byte _080338FE @ case 72
	.4byte _080338FE @ case 73
	.4byte _080338FE @ case 74
	.4byte _080338FE @ case 75
	.4byte _080338FE @ case 76
	.4byte _080338FE @ case 77
	.4byte _080338FE @ case 78
	.4byte _080338FE @ case 79
	.4byte _080338FE @ case 80
	.4byte _080338FE @ case 81
	.4byte _080338FE @ case 82
	.4byte _080338FE @ case 83
	.4byte _080338FE @ case 84
	.4byte _080338FE @ case 85
	.4byte _080338FE @ case 86
	.4byte _080338D2 @ case 87
	.4byte _080338E2 @ case 88
	.4byte _080338EC @ case 89
	.4byte _080338F0 @ case 90
	.4byte _080338F6 @ case 91
_08033894:
	bl KihunterFlyingInit
	b _080338FE
_0803389A:
	bl KihunterFlyingIdleInit
_0803389E:
	bl KihunterFlyingIdle
	b _080338FE
_080338A4:
	bl KihunterFlyingTurningAroundInit
_080338A8:
	bl KihunterTurningAround
	b _080338FE
_080338AE:
	bl KihunterFlyingTurningAroundSecondPart
	b _080338FE
_080338B4:
	bl KihunterFlyingSwoopingDownInit
_080338B8:
	bl KihunterFlyingSwoopingDown
	b _080338FE
_080338BE:
	bl KihunterFlyingSwoopingAcrossInit
_080338C2:
	bl KihunterFlyingSwoopingAcross
	b _080338FE
_080338C8:
	bl KihunterFlyingAfterSwoopingInit
_080338CC:
	bl KihunterFlyingAfterSwooping
	b _080338FE
_080338D2:
	ldr r0, _080338E8 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x10
	bl SpriteUtilUnfreezeSecondarySprites
	bl SpriteDyingInit
_080338E2:
	bl SpriteDying
	b _080338FE
	.align 2, 0
_080338E8: .4byte gCurrentSprite
_080338EC:
	bl KihunterFlyingInit
_080338F0:
	bl SpriteSpawningFromX
	b _080338FE
_080338F6:
	bl KihunterTurningIntoX
	bl XParasiteInit
_080338FE:
	ldr r2, _08033920 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x24
	ldrb r0, [r3]
	cmp r0, #0x56
	bhi _08033918
	ldrh r0, [r2, #0x14]
	cmp r0, #6
	bhi _08033918
	movs r1, #0
	movs r0, #0x5c
	strb r0, [r2, #0x1d]
	strb r1, [r3]
_08033918:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033920: .4byte gCurrentSprite

	thumb_func_start KihunterWings
KihunterWings: @ 0x08033924
	push {lr}
	ldr r1, _08033940 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08033944
	bl SpriteUtilUpdateFreezeTimer
	b _0803397A
	.align 2, 0
_08033940: .4byte gCurrentSprite
_08033944:
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0803396C
	cmp r0, #0x3a
	bgt _0803395C
	cmp r0, #0
	beq _08033972
	cmp r0, #0x38
	beq _08033966
	b _08033976
_0803395C:
	cmp r0, #0x58
	bne _08033976
	bl SpriteDying
	b _0803397A
_08033966:
	bl KihunterWingsFalling
	b _0803397A
_0803396C:
	bl KihunterWingsDisappearing
	b _0803397A
_08033972:
	bl KihunterWingsInit
_08033976:
	bl KihunterWingsIdle
_0803397A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterSpit
KihunterSpit: @ 0x08033980
	push {lr}
	ldr r0, _08033998 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080339A6
	cmp r0, #2
	bgt _0803399C
	cmp r0, #0
	beq _080339A2
	b _080339B2
	.align 2, 0
_08033998: .4byte gCurrentSprite
_0803399C:
	cmp r0, #0x38
	beq _080339AC
	b _080339B2
_080339A2:
	bl KihunterSpitInit
_080339A6:
	bl KihunterSpitMoving
	b _080339B6
_080339AC:
	bl KihunterSpitExploding
	b _080339B6
_080339B2:
	bl KihunterSpitExplodingInit
_080339B6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start KihunterHive
KihunterHive: @ 0x080339BC
	push {lr}
	ldr r0, _080339D4 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x59
	beq _080339E4
	cmp r0, #0x59
	bgt _080339D8
	cmp r0, #0
	beq _080339DE
	b _080339EE
	.align 2, 0
_080339D4: .4byte gCurrentSprite
_080339D8:
	cmp r0, #0x5a
	beq _080339EA
	b _080339EE
_080339DE:
	bl KihunterHiveInit
	b _080339EE
_080339E4:
	bl KihunterHiveSpawnKihunter
	b _080339EE
_080339EA:
	bl KihunterHiveSpawnCooldown
_080339EE:
	ldr r1, _080339FC @ =gCurrentSprite
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	bl unk_120ac
	pop {r0}
	bx r0
	.align 2, 0
_080339FC: .4byte gCurrentSprite

	thumb_func_start KihunterBug
KihunterBug: @ 0x08033A00
	push {lr}
	ldr r0, _08033A20 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08033A32
	cmp r0, #2
	bgt _08033A24
	cmp r0, #0
	beq _08033A2E
	b _08033A40
	.align 2, 0
_08033A20: .4byte gCurrentSprite
_08033A24:
	cmp r0, #0x17
	beq _08033A38
	cmp r0, #0x18
	beq _08033A3C
	b _08033A40
_08033A2E:
	bl KihunterBugInit
_08033A32:
	bl KihunterBugIdle
	b _08033A40
_08033A38:
	bl KihunterBugChasingSamusInit
_08033A3C:
	bl KihunterBugChasingSamus
_08033A40:
	pop {r0}
	bx r0
