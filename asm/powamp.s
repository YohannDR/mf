    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start PowampInit
PowampInit: @ 0x0804F8D8
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r3, _0804F938 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x27
	movs r4, #0
	movs r5, #0x30
	strb r5, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #0x10
	strb r0, [r1]
	ldr r2, _0804F93C @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #0xe
	strb r0, [r1]
	ldr r0, _0804F940 @ =0x08386638
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804F958
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0804F944
	strh r4, [r3]
	b _0804F98C
	.align 2, 0
_0804F938: .4byte gCurrentSprite
_0804F93C: .4byte sPrimarySpriteStats
_0804F940: .4byte 0x08386638
_0804F944:
	ldr r0, _0804F954 @ =0x0000FFB8
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r0, #0x18
	strh r0, [r3, #0xe]
	strh r5, [r3, #0x10]
	b _0804F968
	.align 2, 0
_0804F954: .4byte 0x0000FFB8
_0804F958:
	ldr r0, _0804F980 @ =0x0000FFCC
	strh r0, [r3, #0xa]
	adds r0, #0x20
	strh r0, [r3, #0xc]
	subs r0, #0x14
	strh r0, [r3, #0xe]
	movs r0, #0x28
	strh r0, [r3, #0x10]
_0804F968:
	ldr r2, _0804F984 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804F988
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r2, #6]
	b _0804F98C
	.align 2, 0
_0804F980: .4byte 0x0000FFCC
_0804F984: .4byte gCurrentSprite
_0804F988:
	movs r0, #2
	strb r0, [r1]
_0804F98C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PowampIdleInit
PowampIdleInit: @ 0x0804F994
	ldr r1, _0804F9AC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0804F9B0 @ =0x08386638
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804F9AC: .4byte gCurrentSprite
_0804F9B0: .4byte 0x08386638

	thumb_func_start PowampIdle
PowampIdle: @ 0x0804F9B4
	push {r4, lr}
	ldr r4, _0804F9E4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0804F9DC
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r1, #0xc0
	bl CheckSamusNearSpriteAboveBelowSeparateRanges
	cmp r0, #0
	beq _0804F9DC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_0804F9DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9E4: .4byte gCurrentSprite

	thumb_func_start PowampExtendingInit
PowampExtendingInit: @ 0x0804F9E8
	push {lr}
	ldr r1, _0804FA14 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x18
	strb r0, [r2]
	ldr r0, _0804FA18 @ =0x08386678
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804FA10
	movs r0, #0xe7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804FA10:
	pop {r0}
	bx r0
	.align 2, 0
_0804FA14: .4byte gCurrentSprite
_0804FA18: .4byte 0x08386678

	thumb_func_start PowampExtending
PowampExtending: @ 0x0804FA1C
	push {lr}
	ldr r1, _0804FA44 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804FA30
	ldrb r0, [r1, #0x1c]
	cmp r0, #4
	bne _0804FA30
	ldr r0, _0804FA48 @ =0x0000FF74
	strh r0, [r1, #0xa]
_0804FA30:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804FA40
	ldr r0, _0804FA44 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x19
	strb r1, [r0]
_0804FA40:
	pop {r0}
	bx r0
	.align 2, 0
_0804FA44: .4byte gCurrentSprite
_0804FA48: .4byte 0x0000FF74

	thumb_func_start PowampExtendedInit
PowampExtendedInit: @ 0x0804FA4C
	ldr r1, _0804FA64 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _0804FA68 @ =0x08386658
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804FA64: .4byte gCurrentSprite
_0804FA68: .4byte 0x08386658

	thumb_func_start PowampExtended
PowampExtended: @ 0x0804FA6C
	push {lr}
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r1, #0xc0
	bl CheckSamusNearSpriteAboveBelowSeparateRanges
	cmp r0, #0
	bne _0804FA86
	ldr r0, _0804FA8C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1b
	strb r1, [r0]
_0804FA86:
	pop {r0}
	bx r0
	.align 2, 0
_0804FA8C: .4byte gCurrentSprite

	thumb_func_start PowampRetractingInit
PowampRetractingInit: @ 0x0804FA90
	push {lr}
	ldr r1, _0804FABC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _0804FAC0 @ =0x083866B0
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804FAB6
	ldr r0, _0804FAC4 @ =0x000001CF
	bl SoundPlayNotAlreadyPlaying
_0804FAB6:
	pop {r0}
	bx r0
	.align 2, 0
_0804FABC: .4byte gCurrentSprite
_0804FAC0: .4byte 0x083866B0
_0804FAC4: .4byte 0x000001CF

	thumb_func_start PowampRetracting
PowampRetracting: @ 0x0804FAC8
	push {lr}
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r1, #0xc0
	bl CheckSamusNearSpriteAboveBelowSeparateRanges
	cmp r0, #0
	beq _0804FB00
	ldr r1, _0804FAF4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _0804FAF8 @ =0x08386658
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _0804FAFC @ =0x0000FF74
	strh r0, [r1, #0xa]
	b _0804FB22
	.align 2, 0
_0804FAF4: .4byte gCurrentSprite
_0804FAF8: .4byte 0x08386658
_0804FAFC: .4byte 0x0000FF74
_0804FB00:
	ldr r1, _0804FB28 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #2
	bne _0804FB12
	ldrb r0, [r1, #0x1c]
	cmp r0, #4
	bne _0804FB12
	ldr r0, _0804FB2C @ =0x0000FFCC
	strh r0, [r1, #0xa]
_0804FB12:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804FB22
	ldr r0, _0804FB28 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0804FB22:
	pop {r0}
	bx r0
	.align 2, 0
_0804FB28: .4byte gCurrentSprite
_0804FB2C: .4byte 0x0000FFCC

	thumb_func_start Powamp
Powamp: @ 0x0804FB30
	push {r4, lr}
	ldr r4, _0804FB5C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804FB4A
	movs r0, #0xe8
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804FB4A:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804FB60
	bl SpriteUtilUpdateFreezeTimer
	b _0804FD3A
	.align 2, 0
_0804FB5C: .4byte gCurrentSprite
_0804FB60:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804FB6C
	b _0804FD3A
_0804FB6C:
	lsls r0, r0, #2
	ldr r1, _0804FB78 @ =_0804FB7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804FB78: .4byte _0804FB7C
_0804FB7C: @ jump table
	.4byte _0804FCEC @ case 0
	.4byte _0804FCF2 @ case 1
	.4byte _0804FCF6 @ case 2
	.4byte _0804FD3A @ case 3
	.4byte _0804FD3A @ case 4
	.4byte _0804FD3A @ case 5
	.4byte _0804FD3A @ case 6
	.4byte _0804FD3A @ case 7
	.4byte _0804FD3A @ case 8
	.4byte _0804FD3A @ case 9
	.4byte _0804FD3A @ case 10
	.4byte _0804FD3A @ case 11
	.4byte _0804FD3A @ case 12
	.4byte _0804FD3A @ case 13
	.4byte _0804FD3A @ case 14
	.4byte _0804FD3A @ case 15
	.4byte _0804FD3A @ case 16
	.4byte _0804FD3A @ case 17
	.4byte _0804FD3A @ case 18
	.4byte _0804FD3A @ case 19
	.4byte _0804FD3A @ case 20
	.4byte _0804FD3A @ case 21
	.4byte _0804FD3A @ case 22
	.4byte _0804FCFC @ case 23
	.4byte _0804FD00 @ case 24
	.4byte _0804FD06 @ case 25
	.4byte _0804FD0A @ case 26
	.4byte _0804FD10 @ case 27
	.4byte _0804FD14 @ case 28
	.4byte _0804FD3A @ case 29
	.4byte _0804FD3A @ case 30
	.4byte _0804FD3A @ case 31
	.4byte _0804FD3A @ case 32
	.4byte _0804FD3A @ case 33
	.4byte _0804FD3A @ case 34
	.4byte _0804FD3A @ case 35
	.4byte _0804FD3A @ case 36
	.4byte _0804FD3A @ case 37
	.4byte _0804FD3A @ case 38
	.4byte _0804FD3A @ case 39
	.4byte _0804FD3A @ case 40
	.4byte _0804FD3A @ case 41
	.4byte _0804FD3A @ case 42
	.4byte _0804FD3A @ case 43
	.4byte _0804FD3A @ case 44
	.4byte _0804FD3A @ case 45
	.4byte _0804FD3A @ case 46
	.4byte _0804FD3A @ case 47
	.4byte _0804FD3A @ case 48
	.4byte _0804FD3A @ case 49
	.4byte _0804FD3A @ case 50
	.4byte _0804FD3A @ case 51
	.4byte _0804FD3A @ case 52
	.4byte _0804FD3A @ case 53
	.4byte _0804FD3A @ case 54
	.4byte _0804FD3A @ case 55
	.4byte _0804FD3A @ case 56
	.4byte _0804FD3A @ case 57
	.4byte _0804FD3A @ case 58
	.4byte _0804FD3A @ case 59
	.4byte _0804FD3A @ case 60
	.4byte _0804FD3A @ case 61
	.4byte _0804FD3A @ case 62
	.4byte _0804FD3A @ case 63
	.4byte _0804FD3A @ case 64
	.4byte _0804FD3A @ case 65
	.4byte _0804FD3A @ case 66
	.4byte _0804FD3A @ case 67
	.4byte _0804FD3A @ case 68
	.4byte _0804FD3A @ case 69
	.4byte _0804FD3A @ case 70
	.4byte _0804FD3A @ case 71
	.4byte _0804FD3A @ case 72
	.4byte _0804FD3A @ case 73
	.4byte _0804FD3A @ case 74
	.4byte _0804FD3A @ case 75
	.4byte _0804FD3A @ case 76
	.4byte _0804FD3A @ case 77
	.4byte _0804FD3A @ case 78
	.4byte _0804FD3A @ case 79
	.4byte _0804FD3A @ case 80
	.4byte _0804FD3A @ case 81
	.4byte _0804FD3A @ case 82
	.4byte _0804FD3A @ case 83
	.4byte _0804FD3A @ case 84
	.4byte _0804FD3A @ case 85
	.4byte _0804FD3A @ case 86
	.4byte _0804FD1A @ case 87
	.4byte _0804FD1E @ case 88
	.4byte _0804FD24 @ case 89
	.4byte _0804FD28 @ case 90
	.4byte _0804FD2E @ case 91
_0804FCEC:
	bl PowampInit
	b _0804FD3A
_0804FCF2:
	bl PowampIdleInit
_0804FCF6:
	bl PowampIdle
	b _0804FD3A
_0804FCFC:
	bl PowampExtendingInit
_0804FD00:
	bl PowampExtending
	b _0804FD3A
_0804FD06:
	bl PowampExtendedInit
_0804FD0A:
	bl PowampExtended
	b _0804FD3A
_0804FD10:
	bl PowampRetractingInit
_0804FD14:
	bl PowampRetracting
	b _0804FD3A
_0804FD1A:
	bl SpriteDyingInit
_0804FD1E:
	bl SpriteDying
	b _0804FD3A
_0804FD24:
	bl PowampInit
_0804FD28:
	bl SpriteSpawningFromX
	b _0804FD3A
_0804FD2E:
	bl XParasiteInit
	ldr r1, _0804FD40 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x30
	strh r0, [r1, #2]
_0804FD3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD40: .4byte gCurrentSprite
