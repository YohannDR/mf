    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start GoldSciserDoorLockIdle
GoldSciserDoorLockIdle: @ 0x08057294
	push {lr}
	movs r0, #0x8b
	bl SpriteUtilCountPrimarySprites
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080572AE
	ldr r0, _080572B4 @ =gDoorUnlockTimer
	movs r1, #0x3c
	strb r1, [r0]
	ldr r0, _080572B8 @ =gCurrentSprite
	strh r2, [r0]
_080572AE:
	pop {r0}
	bx r0
	.align 2, 0
_080572B4: .4byte gDoorUnlockTimer
_080572B8: .4byte gCurrentSprite

	thumb_func_start GoldSciserDoorLock
GoldSciserDoorLock: @ 0x080572BC
	push {r4, r5, lr}
	ldr r2, _080572D8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r3, [r1]
	cmp r3, #0
	beq _080572DC
	cmp r3, #2
	beq _08057344
	b _08057348
	.align 2, 0
_080572D8: .4byte gCurrentSprite
_080572DC:
	adds r0, r2, #0
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #2
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r5, #0
	ldr r1, _08057330 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _08057334 @ =0x08337FA4
	str r0, [r2, #0x18]
	strb r5, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldr r0, _08057338 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, _0805733C @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	bne _08057328
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
_08057328:
	ldr r0, _08057340 @ =0x03000047
	strb r4, [r0]
	b _08057348
	.align 2, 0
_08057330: .4byte 0x0000FFFC
_08057334: .4byte 0x08337FA4
_08057338: .4byte gIoRegisters
_0805733C: .4byte gDebugFlag
_08057340: .4byte 0x03000047
_08057344:
	bl GoldSciserDoorLockIdle
_08057348:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GoldZebesianDoorLockIdle
GoldZebesianDoorLockIdle: @ 0x08057350
	push {lr}
	movs r0, #0xa2
	bl SpriteUtilCountPrimarySprites
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805736A
	ldr r0, _08057370 @ =gDoorUnlockTimer
	movs r1, #0x3c
	strb r1, [r0]
	ldr r0, _08057374 @ =gCurrentSprite
	strh r2, [r0]
_0805736A:
	pop {r0}
	bx r0
	.align 2, 0
_08057370: .4byte gDoorUnlockTimer
_08057374: .4byte gCurrentSprite

	thumb_func_start GoldZebesianDoorLock
GoldZebesianDoorLock: @ 0x08057378
	push {r4, r5, lr}
	ldr r2, _08057394 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r3, [r1]
	cmp r3, #0
	beq _08057398
	cmp r3, #2
	beq _08057400
	b _08057404
	.align 2, 0
_08057394: .4byte gCurrentSprite
_08057398:
	adds r0, r2, #0
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #2
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r5, #0
	ldr r1, _080573EC @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _080573F0 @ =0x08337FA4
	str r0, [r2, #0x18]
	strb r5, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldr r0, _080573F4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, _080573F8 @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	bne _080573E4
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
_080573E4:
	ldr r0, _080573FC @ =0x03000047
	strb r4, [r0]
	b _08057404
	.align 2, 0
_080573EC: .4byte 0x0000FFFC
_080573F0: .4byte 0x08337FA4
_080573F4: .4byte gIoRegisters
_080573F8: .4byte gDebugFlag
_080573FC: .4byte 0x03000047
_08057400:
	bl GoldZebesianDoorLockIdle
_08057404:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
