    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start GeemerCheckCollisions
GeemerCheckCollisions: @ 0x08022AFC
	push {lr}
	ldr r2, _08022B18 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08022B28
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022B1C
	ldrh r0, [r2, #2]
	b _08022B38
	.align 2, 0
_08022B18: .4byte gCurrentSprite
_08022B1C:
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	b _08022B48
_08022B28:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08022B40
	ldrh r0, [r2, #2]
	subs r0, #4
_08022B38:
	ldrh r1, [r2, #4]
	bl SpriteUtilCheckCollisionAtPosition
	b _08022B48
_08022B40:
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #4]
	bl SpriteUtilCheckCollisionAtPosition
_08022B48:
	pop {r0}
	bx r0

	thumb_func_start GeemerSetHitbox
GeemerSetHitbox: @ 0x08022B4C
	push {lr}
	ldr r0, _08022B7C @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r2, [r1]
	adds r3, r0, #0
	cmp r2, #0
	beq _08022B94
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08022B84
	movs r2, #0
	ldr r1, _08022B80 @ =0x0000FFD0
	strh r1, [r3, #0xa]
	movs r0, #0x30
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r2, [r3, #0x10]
	b _08022BBA
	.align 2, 0
_08022B7C: .4byte gCurrentSprite
_08022B80: .4byte 0x0000FFD0
_08022B84:
	ldr r0, _08022B90 @ =0x0000FFD0
	strh r0, [r3, #0xa]
	movs r0, #0x30
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	b _08022BB8
	.align 2, 0
_08022B90: .4byte 0x0000FFD0
_08022B94:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08022BAC
	strh r2, [r3, #0xa]
	movs r0, #0x28
	strh r0, [r3, #0xc]
	b _08022BB2
_08022BAC:
	ldr r0, _08022BD0 @ =0x0000FFD8
	strh r0, [r3, #0xa]
	strh r1, [r3, #0xc]
_08022BB2:
	ldr r0, _08022BD4 @ =0x0000FFD0
	strh r0, [r3, #0xe]
	movs r0, #0x30
_08022BB8:
	strh r0, [r3, #0x10]
_08022BBA:
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08022BD0: .4byte 0x0000FFD8
_08022BD4: .4byte 0x0000FFD0

	thumb_func_start GeemerSetCrawlingGFX
GeemerSetCrawlingGFX: @ 0x08022BD8
	push {lr}
	ldr r0, _08022BEC @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _08022BF4
	ldr r0, _08022BF0 @ =0x082FCF90
	b _08022BF6
	.align 2, 0
_08022BEC: .4byte gCurrentSprite
_08022BF0: .4byte 0x082FCF90
_08022BF4:
	ldr r0, _08022C04 @ =0x082FCE00
_08022BF6:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_08022C04: .4byte 0x082FCE00

	thumb_func_start GeemerSetIdleGFX
GeemerSetIdleGFX: @ 0x08022C08
	push {lr}
	ldr r0, _08022C1C @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _08022C24
	ldr r0, _08022C20 @ =0x082FCF28
	b _08022C26
	.align 2, 0
_08022C1C: .4byte gCurrentSprite
_08022C20: .4byte 0x082FCF28
_08022C24:
	ldr r0, _08022C34 @ =0x082FCD98
_08022C26:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_08022C34: .4byte 0x082FCD98

	thumb_func_start GeemerCheckShouldHide
GeemerCheckShouldHide: @ 0x08022C38
	push {r4, lr}
	ldr r4, _08022C90 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08022CC0
	ldr r0, _08022C94 @ =gChangedInput
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	cmp r0, #0
	beq _08022C5C
	strb r2, [r1]
_08022C5C:
	ldrb r0, [r1]
	cmp r0, #0x78
	bhi _08022CC0
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _08022CC0
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x42
	strb r1, [r0]
	adds r0, #9
	ldrb r0, [r0]
	cmp r0, #0
	beq _08022CA0
	ldr r0, _08022C98 @ =0x082FD058
	str r0, [r4, #0x18]
	ldr r0, _08022C9C @ =0x0000FFD8
	strh r0, [r4, #0xa]
	movs r0, #0x28
	strh r0, [r4, #0xc]
	b _08022CAC
	.align 2, 0
_08022C90: .4byte gCurrentSprite
_08022C94: .4byte gChangedInput
_08022C98: .4byte 0x082FD058
_08022C9C: .4byte 0x0000FFD8
_08022CA0:
	ldr r0, _08022CC8 @ =0x082FCEC8
	str r0, [r4, #0x18]
	ldr r0, _08022CCC @ =0x0000FFD8
	strh r0, [r4, #0xe]
	movs r0, #0x28
	strh r0, [r4, #0x10]
_08022CAC:
	ldr r0, _08022CD0 @ =gCurrentSprite
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0xa
	strb r1, [r0]
	ldr r0, _08022CD4 @ =0x00000165
	bl SoundPlayNotAlreadyPlaying
_08022CC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08022CC8: .4byte 0x082FCEC8
_08022CCC: .4byte 0x0000FFD8
_08022CD0: .4byte gCurrentSprite
_08022CD4: .4byte 0x00000165

	thumb_func_start GeemerDelayBeforeHiding
GeemerDelayBeforeHiding: @ 0x08022CD8
	push {lr}
	ldr r1, _08022CF8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08022CF2
	adds r1, #0x24
	movs r0, #0x44
	strb r0, [r1]
_08022CF2:
	pop {r0}
	bx r0
	.align 2, 0
_08022CF8: .4byte gCurrentSprite

	thumb_func_start GeemerHiding
GeemerHiding: @ 0x08022CFC
	push {lr}
	bl GeemerCheckCollisions
	ldr r0, _08022D14 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08022D1C
	ldr r0, _08022D18 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _08022D7E
	.align 2, 0
_08022D14: .4byte gPreviousCollisionCheck
_08022D18: .4byte gCurrentSprite
_08022D1C:
	ldr r0, _08022D30 @ =gChangedInput
	ldrh r0, [r0]
	cmp r0, #0
	beq _08022D38
	ldr r1, _08022D34 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #0
	b _08022D42
	.align 2, 0
_08022D30: .4byte gChangedInput
_08022D34: .4byte gCurrentSprite
_08022D38:
	ldr r1, _08022D64 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r0, #1
_08022D42:
	strb r0, [r2]
	adds r2, r1, #0
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0x78
	bls _08022D7E
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x46
	strb r1, [r0]
	adds r0, #9
	ldrb r0, [r0]
	cmp r0, #0
	beq _08022D6C
	ldr r0, _08022D68 @ =0x082FD098
	b _08022D6E
	.align 2, 0
_08022D64: .4byte gCurrentSprite
_08022D68: .4byte 0x082FD098
_08022D6C:
	ldr r0, _08022D84 @ =0x082FCF08
_08022D6E:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	movs r0, #0xb3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08022D7E:
	pop {r0}
	bx r0
	.align 2, 0
_08022D84: .4byte 0x082FCF08

	thumb_func_start GeemerUncovering
GeemerUncovering: @ 0x08022D88
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _08022DA2
	bl GeemerSetHitbox
	bl GeemerSetIdleGFX
	ldr r0, _08022DA8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
_08022DA2:
	pop {r0}
	bx r0
	.align 2, 0
_08022DA8: .4byte gCurrentSprite

	thumb_func_start GeemerTurningIntoX
GeemerTurningIntoX: @ 0x08022DAC
	push {lr}
	ldr r2, _08022DCC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08022DD8
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022DD0
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _08022DF0
	.align 2, 0
_08022DCC: .4byte gCurrentSprite
_08022DD0:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _08022DF0
_08022DD8:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08022DEA
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _08022DEE
_08022DEA:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_08022DEE:
	strh r0, [r2, #2]
_08022DF0:
	pop {r0}
	bx r0

	thumb_func_start GeemerInit
GeemerInit: @ 0x08022DF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08022E20 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08022E24
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08022E24
	strh r0, [r2]
	b _08022F98
	.align 2, 0
_08022E20: .4byte gCurrentSprite
_08022E24:
	ldr r4, _08022E3C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _08022E40
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _08022F6E
	.align 2, 0
_08022E3C: .4byte gCurrentSprite
_08022E40:
	movs r0, #2
	strb r0, [r1]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08022E64 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	movs r7, #0xf0
	adds r5, r7, #0
	ands r5, r0
	cmp r5, #0
	beq _08022E68
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	b _08022EF6
	.align 2, 0
_08022E64: .4byte gPreviousCollisionCheck
_08022E68:
	ldrh r0, [r4, #2]
	subs r0, #0x44
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08022E96
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
	b _08022EF6
_08022E96:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08022EC0
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	b _08022EF4
_08022EC0:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	adds r2, r7, #0
	ands r2, r0
	cmp r2, #0
	bne _08022EDA
	strh r2, [r4]
	b _08022F98
_08022EDA:
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0x20
_08022EF4:
	strh r0, [r4, #4]
_08022EF6:
	ldr r0, _08022F18 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _08022F28
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08022F1C
	ldrh r5, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x24
	b _08022F22
	.align 2, 0
_08022F18: .4byte gCurrentSprite
_08022F1C:
	ldrh r5, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0x24
_08022F22:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _08022F44
_08022F28:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08022F3A
	ldrh r0, [r4, #2]
	adds r0, #0x24
	b _08022F3E
_08022F3A:
	ldrh r0, [r4, #2]
	subs r0, #0x24
_08022F3E:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #4]
_08022F44:
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	adds r3, r4, #0
	adds r3, #0x23
	ldrb r3, [r3]
	str r5, [sp]
	str r0, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0xc
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _08022F68
	strh r5, [r4]
	b _08022F98
_08022F68:
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
_08022F6E:
	bl GeemerSetCrawlingGFX
	bl GeemerSetHitbox
	ldr r3, _08022FA0 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x25
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldr r2, _08022FA4 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
_08022F98:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08022FA0: .4byte gCurrentSprite
_08022FA4: .4byte sPrimarySpriteStats

	thumb_func_start GeemerCrawlingInit
GeemerCrawlingInit: @ 0x08022FA8
	push {lr}
	bl GeemerSetCrawlingGFX
	ldr r0, _08022FBC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08022FBC: .4byte gCurrentSprite

	thumb_func_start GeemerCrawling
GeemerCrawling: @ 0x08022FC0
	push {r4, r5, r6, lr}
	bl GeemerCheckCollisions
	ldr r5, _08022FD8 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08022FE0
	ldr r0, _08022FDC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _08023284
	.align 2, 0
_08022FD8: .4byte gPreviousCollisionCheck
_08022FDC: .4byte gCurrentSprite
_08022FE0:
	ldr r4, _0802302C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08022FEE
	b _0802311C
_08022FEE:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802305A
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08023030
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0802301E
	b _0802326C
_0802301E:
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0802308C
	.align 2, 0
_0802302C: .4byte gCurrentSprite
_08023030:
	movs r2, #0xa
	ldrsh r0, [r4, r2]
	ldrh r3, [r4, #2]
	adds r0, r0, r3
	ldrh r1, [r4, #4]
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0802304C
	b _0802326C
_0802304C:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	subs r1, #4
	b _080230E8
_0802305A:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080230C0
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08023080
	b _0802326C
_08023080:
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	ldrh r3, [r4, #2]
	adds r0, r0, r3
	ldrh r1, [r4, #4]
	adds r1, #4
_0802308C:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802309C
	b _0802326C
_0802309C:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	ldr r2, _080230BC @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	adds r1, #1
	strh r1, [r0, #2]
	b _08023266
	.align 2, 0
_080230BC: .4byte gSpriteData
_080230C0:
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _080230DC
	b _0802326C
_080230DC:
	movs r3, #0xa
	ldrsh r0, [r4, r3]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #4
_080230E8:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080230F8
	b _0802326C
_080230F8:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	ldr r2, _08023118 @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	subs r1, #1
	strh r1, [r0, #2]
	b _08023266
	.align 2, 0
_08023118: .4byte gSpriteData
_0802311C:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080231BC
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802318C
	ldrh r0, [r4, #2]
	subs r0, #4
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08023150
	b _0802326C
_08023150:
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0802316A
	b _0802326C
_0802316A:
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	ldr r2, _08023188 @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	adds r1, #1
	b _08023264
	.align 2, 0
_08023188: .4byte gSpriteData
_0802318C:
	ldrh r0, [r4, #2]
	subs r0, #4
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0802326C
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	b _08023244
_080231BC:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08023218
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0802326C
	ldrh r0, [r4, #2]
	subs r0, #4
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0802326C
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
	ldr r2, _08023214 @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	adds r1, #1
	b _08023264
	.align 2, 0
_08023214: .4byte gSpriteData
_08023218:
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0802326C
	ldrh r0, [r4, #2]
	subs r0, #4
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r3, [r4, #4]
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
_08023244:
	ands r0, r1
	cmp r0, #0
	bne _0802326C
	ldrh r0, [r4, #4]
	subs r0, #1
	strh r0, [r4, #4]
	ldr r2, _0802328C @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	subs r1, #1
_08023264:
	strh r1, [r0, #4]
_08023266:
	movs r0, #0
	cmp r0, #0
	beq _08023280
_0802326C:
	ldr r2, _08023290 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
_08023280:
	bl GeemerCheckShouldHide
_08023284:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802328C: .4byte gSpriteData
_08023290: .4byte gCurrentSprite

	thumb_func_start GeemerIdleInit
GeemerIdleInit: @ 0x08023294
	push {lr}
	ldr r0, _080232A8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	bl GeemerSetIdleGFX
	pop {r0}
	bx r0
	.align 2, 0
_080232A8: .4byte gCurrentSprite

	thumb_func_start GeemerIdle
GeemerIdle: @ 0x080232AC
	push {lr}
	bl GeemerCheckCollisions
	ldr r0, _080232C4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _080232CC
	ldr r0, _080232C8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _080232E0
	.align 2, 0
_080232C4: .4byte gPreviousCollisionCheck
_080232C8: .4byte gCurrentSprite
_080232CC:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _080232DC
	ldr r0, _080232E4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_080232DC:
	bl GeemerCheckShouldHide
_080232E0:
	pop {r0}
	bx r0
	.align 2, 0
_080232E4: .4byte gCurrentSprite

	thumb_func_start GeemerFallingInit
GeemerFallingInit: @ 0x080232E8
	push {lr}
	ldr r1, _08023308 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bl GeemerSetHitbox
	bl GeemerSetIdleGFX
	pop {r0}
	bx r0
	.align 2, 0
_08023308: .4byte gCurrentSprite

	thumb_func_start GeemerFalling
GeemerFalling: @ 0x0802330C
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _08023334 @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08023338
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023344
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08023344
	.align 2, 0
_08023334: .4byte gCurrentSprite
_08023338:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802334C
_08023344:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0802334C:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08023398 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08023410
	ldr r4, _0802339C @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _08023372
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08023372:
	ldrh r0, [r4]
	ldr r1, _080233A0 @ =0x0000FEFF
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strb r0, [r2]
	bl GeemerSetHitbox
	cmp r5, #0
	beq _080233AC
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080233A4
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _080233A8
	.align 2, 0
_08023398: .4byte gPreviousVerticalCollisionCheck
_0802339C: .4byte gCurrentSprite
_080233A0: .4byte 0x0000FEFF
_080233A4:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_080233A8:
	subs r0, r0, r1
	strh r0, [r4, #4]
_080233AC:
	ldr r4, _080233CC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080233D0
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	bl GeemerSetCrawlingGFX
	b _08023454
	.align 2, 0
_080233CC: .4byte gCurrentSprite
_080233D0:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	bl GeemerSetIdleGFX
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	ldr r2, _08023408 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r4, #2]
	subs r0, #0x24
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	ldr r2, _0802340C @ =0x0000FFF4
	strh r2, [r1, #0xa]
	movs r0, #0x20
	strh r0, [r1, #0xc]
	strh r2, [r1, #0xe]
	movs r0, #0xc
	strh r0, [r1, #0x10]
	b _08023454
	.align 2, 0
_08023408: .4byte gSpriteData
_0802340C: .4byte 0x0000FFF4
_08023410:
	ldr r3, _0802343C @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _08023440 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08023444 @ =0x00007FFF
	cmp r1, r0
	bne _08023448
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08023452
	.align 2, 0
_0802343C: .4byte gCurrentSprite
_08023440: .4byte sSpritesFallingSpeed
_08023444: .4byte 0x00007FFF
_08023448:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_08023452:
	strh r0, [r3, #2]
_08023454:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Geemer
Geemer: @ 0x0802345C
	push {r4, lr}
	ldr r4, _08023494 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08023476
	movs r0, #0xb2
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08023476:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08023498
	bl SpriteUtilUpdateFreezeTimer
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0xc
	bl SpriteUtilUpdateSecondarySpritesFreezeTimer
	b _08023686
	.align 2, 0
_08023494: .4byte gCurrentSprite
_08023498:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _080234A4
	b _08023686
_080234A4:
	lsls r0, r0, #2
	ldr r1, _080234B0 @ =_080234B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080234B0: .4byte _080234B4
_080234B4: @ jump table
	.4byte _08023624 @ case 0
	.4byte _0802362A @ case 1
	.4byte _0802362E @ case 2
	.4byte _08023686 @ case 3
	.4byte _08023686 @ case 4
	.4byte _08023686 @ case 5
	.4byte _08023686 @ case 6
	.4byte _08023634 @ case 7
	.4byte _08023638 @ case 8
	.4byte _08023686 @ case 9
	.4byte _08023686 @ case 10
	.4byte _08023686 @ case 11
	.4byte _08023686 @ case 12
	.4byte _08023686 @ case 13
	.4byte _08023686 @ case 14
	.4byte _08023686 @ case 15
	.4byte _08023686 @ case 16
	.4byte _08023686 @ case 17
	.4byte _08023686 @ case 18
	.4byte _08023686 @ case 19
	.4byte _08023686 @ case 20
	.4byte _0802363E @ case 21
	.4byte _08023642 @ case 22
	.4byte _08023686 @ case 23
	.4byte _08023686 @ case 24
	.4byte _08023686 @ case 25
	.4byte _08023686 @ case 26
	.4byte _08023686 @ case 27
	.4byte _08023686 @ case 28
	.4byte _08023686 @ case 29
	.4byte _08023686 @ case 30
	.4byte _08023686 @ case 31
	.4byte _08023686 @ case 32
	.4byte _08023686 @ case 33
	.4byte _08023686 @ case 34
	.4byte _08023686 @ case 35
	.4byte _08023686 @ case 36
	.4byte _08023686 @ case 37
	.4byte _08023686 @ case 38
	.4byte _08023686 @ case 39
	.4byte _08023686 @ case 40
	.4byte _08023686 @ case 41
	.4byte _08023686 @ case 42
	.4byte _08023686 @ case 43
	.4byte _08023686 @ case 44
	.4byte _08023686 @ case 45
	.4byte _08023686 @ case 46
	.4byte _08023686 @ case 47
	.4byte _08023686 @ case 48
	.4byte _08023686 @ case 49
	.4byte _08023686 @ case 50
	.4byte _08023686 @ case 51
	.4byte _08023686 @ case 52
	.4byte _08023686 @ case 53
	.4byte _08023686 @ case 54
	.4byte _08023686 @ case 55
	.4byte _08023686 @ case 56
	.4byte _08023686 @ case 57
	.4byte _08023686 @ case 58
	.4byte _08023686 @ case 59
	.4byte _08023686 @ case 60
	.4byte _08023686 @ case 61
	.4byte _08023686 @ case 62
	.4byte _08023686 @ case 63
	.4byte _08023686 @ case 64
	.4byte _08023686 @ case 65
	.4byte _08023648 @ case 66
	.4byte _08023686 @ case 67
	.4byte _0802364E @ case 68
	.4byte _08023686 @ case 69
	.4byte _08023654 @ case 70
	.4byte _08023686 @ case 71
	.4byte _08023686 @ case 72
	.4byte _08023686 @ case 73
	.4byte _08023686 @ case 74
	.4byte _08023686 @ case 75
	.4byte _08023686 @ case 76
	.4byte _08023686 @ case 77
	.4byte _08023686 @ case 78
	.4byte _08023686 @ case 79
	.4byte _08023686 @ case 80
	.4byte _08023686 @ case 81
	.4byte _08023686 @ case 82
	.4byte _08023686 @ case 83
	.4byte _08023686 @ case 84
	.4byte _08023686 @ case 85
	.4byte _08023686 @ case 86
	.4byte _0802365A @ case 87
	.4byte _0802366A @ case 88
	.4byte _08023674 @ case 89
	.4byte _08023678 @ case 90
	.4byte _0802367E @ case 91
_08023624:
	bl GeemerInit
	b _08023686
_0802362A:
	bl GeemerCrawlingInit
_0802362E:
	bl GeemerCrawling
	b _08023686
_08023634:
	bl GeemerIdleInit
_08023638:
	bl GeemerIdle
	b _08023686
_0802363E:
	bl GeemerFallingInit
_08023642:
	bl GeemerFalling
	b _08023686
_08023648:
	bl GeemerDelayBeforeHiding
	b _08023686
_0802364E:
	bl GeemerHiding
	b _08023686
_08023654:
	bl GeemerUncovering
	b _08023686
_0802365A:
	ldr r0, _08023670 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0xc
	bl SpriteUtilUnfreezeSecondarySprites
	bl SpriteDyingInit
_0802366A:
	bl SpriteDying
	b _08023686
	.align 2, 0
_08023670: .4byte gCurrentSprite
_08023674:
	bl GeemerInit
_08023678:
	bl SpriteSpawningFromX
	b _08023686
_0802367E:
	bl GeemerTurningIntoX
	bl XParasiteInit
_08023686:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GeemerFlashingLight
GeemerFlashingLight: @ 0x0802368C
	push {r4, r5, r6, r7, lr}
	ldr r1, _080236B0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #0
	beq _080236B4
	bl SpriteUtilUpdateFreezeTimer
	bl SpriteUtilUpdatePrimarySpriteFreezeTimer
	b _08023812
	.align 2, 0
_080236B0: .4byte gCurrentSprite
_080236B4:
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r0]
	adds r6, r3, #0
	adds r6, #0x24
	ldrb r4, [r6]
	ldr r7, _08023724 @ =gSpriteData
	cmp r4, #0
	bne _08023772
	subs r0, #1
	movs r1, #3
	strb r1, [r0]
	ldr r2, _08023728 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x27
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0802372C @ =0x082FCD78
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #2
	strb r0, [r6]
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r1, r0, r7
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08023744
	ldrh r1, [r1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023734
	ldr r0, _08023730 @ =0x0000FFF4
	strh r0, [r3, #0xa]
	movs r1, #0xc
	strh r1, [r3, #0xc]
	strh r0, [r3, #0xe]
	movs r0, #0x20
	b _08023770
	.align 2, 0
_08023724: .4byte gSpriteData
_08023728: .4byte sSecondarySpriteStats
_0802372C: .4byte 0x082FCD78
_08023730: .4byte 0x0000FFF4
_08023734:
	ldr r0, _08023740 @ =0x0000FFF4
	strh r0, [r3, #0xa]
	movs r1, #0xc
	strh r1, [r3, #0xc]
	subs r0, #0x14
	b _0802375A
	.align 2, 0
_08023740: .4byte 0x0000FFF4
_08023744:
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08023764
	ldr r0, _08023760 @ =0x0000FFE0
	strh r0, [r3, #0xa]
	movs r1, #0xc
	strh r1, [r3, #0xc]
	adds r0, #0x14
_0802375A:
	strh r0, [r3, #0xe]
	strh r1, [r3, #0x10]
	b _08023772
	.align 2, 0
_08023760: .4byte 0x0000FFE0
_08023764:
	ldr r0, _08023794 @ =0x0000FFF4
	strh r0, [r3, #0xa]
	movs r1, #0x20
	strh r1, [r3, #0xc]
	strh r0, [r3, #0xe]
	movs r0, #0xc
_08023770:
	strh r0, [r3, #0x10]
_08023772:
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	mov ip, r0
	ldrh r1, [r0]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08023798
	ldrh r1, [r3]
	adds r0, r4, #0
	orrs r0, r1
	b _08023810
	.align 2, 0
_08023794: .4byte 0x0000FFF4
_08023798:
	ldrh r1, [r3]
	ldr r0, _080237DC @ =0x0000DFFF
	ands r0, r1
	movs r6, #0
	strh r0, [r3]
	ldrh r4, [r3, #0x14]
	cmp r4, #0
	bne _080237E0
	mov r1, ip
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x56
	bhi _080237E0
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	strh r4, [r0, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r6, [r0]
	subs r0, #0x12
	strb r6, [r0]
	strh r4, [r3]
	b _08023812
	.align 2, 0
_080237DC: .4byte 0x0000DFFF
_080237E0:
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x44
	beq _080237FE
	cmp r0, #0x44
	blt _0802380A
	cmp r0, #0x58
	bgt _0802380A
	cmp r0, #0x57
	blt _0802380A
	movs r0, #0
	b _08023810
_080237FE:
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	b _08023810
_0802380A:
	ldrh r1, [r3]
	ldr r0, _08023818 @ =0x00007FFF
	ands r0, r1
_08023810:
	strh r0, [r3]
_08023812:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023818: .4byte 0x00007FFF
