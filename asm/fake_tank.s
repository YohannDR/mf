    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start FakeTankInit
FakeTankInit: @ 0x0804BDF0
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804BE1C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804BE20
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804BE20
	strh r0, [r2]
	b _0804BE98
	.align 2, 0
_0804BE1C: .4byte gCurrentSprite
_0804BE20:
	ldr r0, _0804BE88 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x27
	movs r4, #0
	movs r2, #0x10
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x28
	movs r3, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	movs r5, #0
	ldr r0, _0804BE8C @ =0x0000FFC0
	mov r1, ip
	strh r0, [r1, #0xa]
	strh r4, [r1, #0xc]
	adds r0, #0x20
	strh r0, [r1, #0xe]
	movs r0, #0x20
	strh r0, [r1, #0x10]
	strb r5, [r1, #0x1c]
	strh r4, [r1, #0x16]
	ldr r2, _0804BE90 @ =sPrimarySpriteStats
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x14]
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r5, [r0]
	subs r1, #0x10
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804BE94
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	mov r1, ip
	strh r0, [r1, #6]
	b _0804BE98
	.align 2, 0
_0804BE88: .4byte gCurrentSprite
_0804BE8C: .4byte 0x0000FFC0
_0804BE90: .4byte sPrimarySpriteStats
_0804BE94:
	movs r0, #1
	strb r0, [r1]
_0804BE98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FakeTankIdleInit
FakeTankIdleInit: @ 0x0804BEA0
	ldr r1, _0804BEB4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	bx lr
	.align 2, 0
_0804BEB4: .4byte gCurrentSprite

	thumb_func_start FakeTankIdle
FakeTankIdle: @ 0x0804BEB8
	push {r4, lr}
	ldr r4, _0804BEE4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0804BEDE
	movs r0, #0xc0
	movs r1, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804BEDE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_0804BEDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BEE4: .4byte gCurrentSprite

	thumb_func_start FakeTankWakingUpInit
FakeTankWakingUpInit: @ 0x0804BEE8
	ldr r3, _0804BF1C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	adds r2, #0x10
	ldrb r1, [r2]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0804BF20 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804BF1C: .4byte gCurrentSprite
_0804BF20: .4byte gIoRegisters

	thumb_func_start FakeTankWakingUp
FakeTankWakingUp: @ 0x0804BF24
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804BF36
	ldr r0, _0804BF3C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x19
	strb r1, [r0]
_0804BF36:
	pop {r0}
	bx r0
	.align 2, 0
_0804BF3C: .4byte gCurrentSprite

	thumb_func_start FakeTankFlyingInit
FakeTankFlyingInit: @ 0x0804BF40
	ldr r3, _0804BF64 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x1a
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	adds r2, #0xa
	movs r0, #0x3c
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_0804BF64: .4byte gCurrentSprite

	thumb_func_start FakeTankFlying
FakeTankFlying: @ 0x0804BF68
	push {r4, r5, r6, lr}
	ldr r2, _0804BF84 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804BF88
	subs r0, #1
	strb r0, [r1]
	ldrh r0, [r2, #2]
	subs r0, #4
	strh r0, [r2, #2]
	b _0804BFC8
	.align 2, 0
_0804BF84: .4byte gCurrentSprite
_0804BF88:
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _0804BFD0 @ =0x0837CEEC
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0804BFD4 @ =0x00007FFF
	cmp r1, r0
	bne _0804BFA6
	ldrh r4, [r5]
	movs r3, #0
_0804BFA6:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
	strh r0, [r2, #2]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804BFC8
	subs r1, #0xb
	movs r0, #0x1b
	strb r0, [r1]
_0804BFC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFD0: .4byte 0x0837CEEC
_0804BFD4: .4byte 0x00007FFF

	thumb_func_start FakeTankFlyingAwayInit
FakeTankFlyingAwayInit: @ 0x0804BFD8
	ldr r0, _0804C008 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x1c
	strb r0, [r1]
	movs r3, #0
	movs r0, #0x96
	lsls r0, r0, #1
	mov r1, ip
	strh r0, [r1, #6]
	strh r2, [r1, #8]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r3, [r0]
	adds r0, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C008: .4byte gCurrentSprite

	thumb_func_start FakeTankFlyingAway
FakeTankFlyingAway: @ 0x0804C00C
	push {lr}
	sub sp, #4
	ldr r0, _0804C028 @ =gXParasiteTargetYPosition
	ldrh r3, [r0]
	ldr r0, _0804C02C @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	ldr r1, _0804C030 @ =gCurrentSprite
	ldrh r0, [r1, #8]
	cmp r0, #1
	beq _0804C034
	cmp r0, #3
	beq _0804C04E
	b _0804C070
	.align 2, 0
_0804C028: .4byte gXParasiteTargetYPosition
_0804C02C: .4byte gXParasiteTargetXPosition
_0804C030: .4byte gCurrentSprite
_0804C034:
	adds r0, r3, #0
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804C068
	adds r0, r2, #0
	subs r0, #0x48
	b _0804C06C
_0804C04E:
	adds r0, r3, #0
	adds r0, #0x48
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804C068
	adds r0, r2, #0
	subs r0, #0x48
	b _0804C06C
_0804C068:
	adds r0, r2, #0
	adds r0, #0x48
_0804C06C:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0804C070:
	movs r0, #2
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r2, #0
	movs r2, #0x10
	movs r3, #0x18
	bl unk_136ac
	ldr r1, _0804C09C @ =gCurrentSprite
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804C094
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0804C094:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804C09C: .4byte gCurrentSprite

	thumb_func_start FakeTankLeaving
FakeTankLeaving: @ 0x0804C0A0
	push {r4, lr}
	ldr r0, _0804C0CC @ =gCurrentSprite
	adds r3, r0, #0
	adds r3, #0x30
	ldrb r2, [r3]
	adds r4, r0, #0
	cmp r2, #0xc7
	bhi _0804C0B4
	adds r0, r2, #1
	strb r0, [r3]
_0804C0B4:
	ldrb r0, [r3]
	lsrs r2, r0, #3
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804C0D0
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	b _0804C0D4
	.align 2, 0
_0804C0CC: .4byte gCurrentSprite
_0804C0D0:
	ldrh r0, [r4, #4]
	subs r0, r0, r2
_0804C0D4:
	strh r0, [r4, #4]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _0804C0E4
	adds r0, #1
	strb r0, [r1]
_0804C0E4:
	ldrb r0, [r1]
	lsrs r2, r0, #3
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804C0FA
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	b _0804C0FE
_0804C0FA:
	ldrh r0, [r4, #2]
	subs r0, r0, r2
_0804C0FE:
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804C110
	strh r0, [r4]
_0804C110:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FakeEnergyTank
FakeEnergyTank: @ 0x0804C118
	push {lr}
	ldr r0, _0804C130 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0804C134
	bl SpriteUtilUpdateFreezeTimer
	b _0804C340
	.align 2, 0
_0804C130: .4byte gCurrentSprite
_0804C134:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804C140
	b _0804C340
_0804C140:
	lsls r0, r0, #2
	ldr r1, _0804C14C @ =_0804C150
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804C14C: .4byte _0804C150
_0804C150: @ jump table
	.4byte _0804C2C0 @ case 0
	.4byte _0804C2D4 @ case 1
	.4byte _0804C2DC @ case 2
	.4byte _0804C340 @ case 3
	.4byte _0804C340 @ case 4
	.4byte _0804C340 @ case 5
	.4byte _0804C340 @ case 6
	.4byte _0804C340 @ case 7
	.4byte _0804C340 @ case 8
	.4byte _0804C340 @ case 9
	.4byte _0804C340 @ case 10
	.4byte _0804C340 @ case 11
	.4byte _0804C340 @ case 12
	.4byte _0804C340 @ case 13
	.4byte _0804C340 @ case 14
	.4byte _0804C340 @ case 15
	.4byte _0804C340 @ case 16
	.4byte _0804C340 @ case 17
	.4byte _0804C340 @ case 18
	.4byte _0804C340 @ case 19
	.4byte _0804C340 @ case 20
	.4byte _0804C340 @ case 21
	.4byte _0804C340 @ case 22
	.4byte _0804C2E8 @ case 23
	.4byte _0804C2F0 @ case 24
	.4byte _0804C2FC @ case 25
	.4byte _0804C304 @ case 26
	.4byte _0804C310 @ case 27
	.4byte _0804C314 @ case 28
	.4byte _0804C340 @ case 29
	.4byte _0804C31A @ case 30
	.4byte _0804C340 @ case 31
	.4byte _0804C340 @ case 32
	.4byte _0804C340 @ case 33
	.4byte _0804C340 @ case 34
	.4byte _0804C340 @ case 35
	.4byte _0804C340 @ case 36
	.4byte _0804C340 @ case 37
	.4byte _0804C340 @ case 38
	.4byte _0804C340 @ case 39
	.4byte _0804C340 @ case 40
	.4byte _0804C340 @ case 41
	.4byte _0804C340 @ case 42
	.4byte _0804C340 @ case 43
	.4byte _0804C340 @ case 44
	.4byte _0804C340 @ case 45
	.4byte _0804C340 @ case 46
	.4byte _0804C340 @ case 47
	.4byte _0804C340 @ case 48
	.4byte _0804C340 @ case 49
	.4byte _0804C340 @ case 50
	.4byte _0804C340 @ case 51
	.4byte _0804C340 @ case 52
	.4byte _0804C340 @ case 53
	.4byte _0804C340 @ case 54
	.4byte _0804C340 @ case 55
	.4byte _0804C340 @ case 56
	.4byte _0804C340 @ case 57
	.4byte _0804C340 @ case 58
	.4byte _0804C340 @ case 59
	.4byte _0804C340 @ case 60
	.4byte _0804C340 @ case 61
	.4byte _0804C340 @ case 62
	.4byte _0804C340 @ case 63
	.4byte _0804C340 @ case 64
	.4byte _0804C340 @ case 65
	.4byte _0804C340 @ case 66
	.4byte _0804C340 @ case 67
	.4byte _0804C340 @ case 68
	.4byte _0804C340 @ case 69
	.4byte _0804C340 @ case 70
	.4byte _0804C340 @ case 71
	.4byte _0804C340 @ case 72
	.4byte _0804C340 @ case 73
	.4byte _0804C340 @ case 74
	.4byte _0804C340 @ case 75
	.4byte _0804C340 @ case 76
	.4byte _0804C340 @ case 77
	.4byte _0804C340 @ case 78
	.4byte _0804C340 @ case 79
	.4byte _0804C340 @ case 80
	.4byte _0804C340 @ case 81
	.4byte _0804C340 @ case 82
	.4byte _0804C340 @ case 83
	.4byte _0804C340 @ case 84
	.4byte _0804C340 @ case 85
	.4byte _0804C340 @ case 86
	.4byte _0804C320 @ case 87
	.4byte _0804C324 @ case 88
	.4byte _0804C32A @ case 89
	.4byte _0804C32E @ case 90
	.4byte _0804C334 @ case 91
_0804C2C0:
	bl FakeTankInit
	ldr r1, _0804C2CC @ =gCurrentSprite
	ldr r0, _0804C2D0 @ =0x0837D85C
	str r0, [r1, #0x18]
	b _0804C340
	.align 2, 0
_0804C2CC: .4byte gCurrentSprite
_0804C2D0: .4byte 0x0837D85C
_0804C2D4:
	ldr r0, _0804C2E4 @ =0x0837D85C
	str r0, [r2, #0x18]
	bl FakeTankIdleInit
_0804C2DC:
	bl FakeTankIdle
	b _0804C340
	.align 2, 0
_0804C2E4: .4byte 0x0837D85C
_0804C2E8:
	ldr r0, _0804C2F8 @ =0x0837D884
	str r0, [r2, #0x18]
	bl FakeTankWakingUpInit
_0804C2F0:
	bl FakeTankWakingUp
	b _0804C340
	.align 2, 0
_0804C2F8: .4byte 0x0837D884
_0804C2FC:
	ldr r0, _0804C30C @ =0x0837D8BC
	str r0, [r2, #0x18]
	bl FakeTankFlyingInit
_0804C304:
	bl FakeTankFlying
	b _0804C340
	.align 2, 0
_0804C30C: .4byte 0x0837D8BC
_0804C310:
	bl FakeTankFlyingAwayInit
_0804C314:
	bl FakeTankFlyingAway
	b _0804C340
_0804C31A:
	bl FakeTankLeaving
	b _0804C340
_0804C320:
	bl SpriteDyingInit
_0804C324:
	bl SpriteDying
	b _0804C340
_0804C32A:
	bl FakeTankInit
_0804C32E:
	bl SpriteSpawningFromX
	b _0804C340
_0804C334:
	bl XParasiteInit
	ldr r1, _0804C344 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_0804C340:
	pop {r0}
	bx r0
	.align 2, 0
_0804C344: .4byte gCurrentSprite

	thumb_func_start FakeMissileTank
FakeMissileTank: @ 0x0804C348
	push {lr}
	ldr r0, _0804C360 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0804C364
	bl SpriteUtilUpdateFreezeTimer
	b _0804C570
	.align 2, 0
_0804C360: .4byte gCurrentSprite
_0804C364:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804C370
	b _0804C570
_0804C370:
	lsls r0, r0, #2
	ldr r1, _0804C37C @ =_0804C380
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804C37C: .4byte _0804C380
_0804C380: @ jump table
	.4byte _0804C4F0 @ case 0
	.4byte _0804C504 @ case 1
	.4byte _0804C50C @ case 2
	.4byte _0804C570 @ case 3
	.4byte _0804C570 @ case 4
	.4byte _0804C570 @ case 5
	.4byte _0804C570 @ case 6
	.4byte _0804C570 @ case 7
	.4byte _0804C570 @ case 8
	.4byte _0804C570 @ case 9
	.4byte _0804C570 @ case 10
	.4byte _0804C570 @ case 11
	.4byte _0804C570 @ case 12
	.4byte _0804C570 @ case 13
	.4byte _0804C570 @ case 14
	.4byte _0804C570 @ case 15
	.4byte _0804C570 @ case 16
	.4byte _0804C570 @ case 17
	.4byte _0804C570 @ case 18
	.4byte _0804C570 @ case 19
	.4byte _0804C570 @ case 20
	.4byte _0804C570 @ case 21
	.4byte _0804C570 @ case 22
	.4byte _0804C518 @ case 23
	.4byte _0804C520 @ case 24
	.4byte _0804C52C @ case 25
	.4byte _0804C534 @ case 26
	.4byte _0804C540 @ case 27
	.4byte _0804C544 @ case 28
	.4byte _0804C570 @ case 29
	.4byte _0804C54A @ case 30
	.4byte _0804C570 @ case 31
	.4byte _0804C570 @ case 32
	.4byte _0804C570 @ case 33
	.4byte _0804C570 @ case 34
	.4byte _0804C570 @ case 35
	.4byte _0804C570 @ case 36
	.4byte _0804C570 @ case 37
	.4byte _0804C570 @ case 38
	.4byte _0804C570 @ case 39
	.4byte _0804C570 @ case 40
	.4byte _0804C570 @ case 41
	.4byte _0804C570 @ case 42
	.4byte _0804C570 @ case 43
	.4byte _0804C570 @ case 44
	.4byte _0804C570 @ case 45
	.4byte _0804C570 @ case 46
	.4byte _0804C570 @ case 47
	.4byte _0804C570 @ case 48
	.4byte _0804C570 @ case 49
	.4byte _0804C570 @ case 50
	.4byte _0804C570 @ case 51
	.4byte _0804C570 @ case 52
	.4byte _0804C570 @ case 53
	.4byte _0804C570 @ case 54
	.4byte _0804C570 @ case 55
	.4byte _0804C570 @ case 56
	.4byte _0804C570 @ case 57
	.4byte _0804C570 @ case 58
	.4byte _0804C570 @ case 59
	.4byte _0804C570 @ case 60
	.4byte _0804C570 @ case 61
	.4byte _0804C570 @ case 62
	.4byte _0804C570 @ case 63
	.4byte _0804C570 @ case 64
	.4byte _0804C570 @ case 65
	.4byte _0804C570 @ case 66
	.4byte _0804C570 @ case 67
	.4byte _0804C570 @ case 68
	.4byte _0804C570 @ case 69
	.4byte _0804C570 @ case 70
	.4byte _0804C570 @ case 71
	.4byte _0804C570 @ case 72
	.4byte _0804C570 @ case 73
	.4byte _0804C570 @ case 74
	.4byte _0804C570 @ case 75
	.4byte _0804C570 @ case 76
	.4byte _0804C570 @ case 77
	.4byte _0804C570 @ case 78
	.4byte _0804C570 @ case 79
	.4byte _0804C570 @ case 80
	.4byte _0804C570 @ case 81
	.4byte _0804C570 @ case 82
	.4byte _0804C570 @ case 83
	.4byte _0804C570 @ case 84
	.4byte _0804C570 @ case 85
	.4byte _0804C570 @ case 86
	.4byte _0804C550 @ case 87
	.4byte _0804C554 @ case 88
	.4byte _0804C55A @ case 89
	.4byte _0804C55E @ case 90
	.4byte _0804C564 @ case 91
_0804C4F0:
	bl FakeTankInit
	ldr r1, _0804C4FC @ =gCurrentSprite
	ldr r0, _0804C500 @ =0x0837E214
	str r0, [r1, #0x18]
	b _0804C570
	.align 2, 0
_0804C4FC: .4byte gCurrentSprite
_0804C500: .4byte 0x0837E214
_0804C504:
	ldr r0, _0804C514 @ =0x0837E214
	str r0, [r2, #0x18]
	bl FakeTankIdleInit
_0804C50C:
	bl FakeTankIdle
	b _0804C570
	.align 2, 0
_0804C514: .4byte 0x0837E214
_0804C518:
	ldr r0, _0804C528 @ =0x0837E23C
	str r0, [r2, #0x18]
	bl FakeTankWakingUpInit
_0804C520:
	bl FakeTankWakingUp
	b _0804C570
	.align 2, 0
_0804C528: .4byte 0x0837E23C
_0804C52C:
	ldr r0, _0804C53C @ =0x0837E27C
	str r0, [r2, #0x18]
	bl FakeTankFlyingInit
_0804C534:
	bl FakeTankFlying
	b _0804C570
	.align 2, 0
_0804C53C: .4byte 0x0837E27C
_0804C540:
	bl FakeTankFlyingAwayInit
_0804C544:
	bl FakeTankFlyingAway
	b _0804C570
_0804C54A:
	bl FakeTankLeaving
	b _0804C570
_0804C550:
	bl SpriteDyingInit
_0804C554:
	bl SpriteDying
	b _0804C570
_0804C55A:
	bl FakeTankInit
_0804C55E:
	bl SpriteSpawningFromX
	b _0804C570
_0804C564:
	bl XParasiteInit
	ldr r1, _0804C574 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_0804C570:
	pop {r0}
	bx r0
	.align 2, 0
_0804C574: .4byte gCurrentSprite
