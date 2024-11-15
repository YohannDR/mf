    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start RidleyPreSpawnInit
RidleyPreSpawnInit: @ 0x0805B590
	push {r4, r5, lr}
	ldr r0, _0805B5AC @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r5, #8
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0805B5B4
	ldr r1, _0805B5B0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0805B5FC
	.align 2, 0
_0805B5AC: .4byte gEquipment
_0805B5B0: .4byte gCurrentSprite
_0805B5B4:
	ldr r3, _0805B604 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x40
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x58
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r5, [r0]
	adds r1, #2
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _0805B608 @ =0x0000FEE0
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r0, #0xc0
	strh r0, [r3, #0xe]
	movs r0, #0x60
	strh r0, [r3, #0x10]
	ldr r0, _0805B60C @ =sRidleyPreSpawnOam_3b0a9c
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	subs r1, #5
	movs r0, #1
	strb r0, [r1]
_0805B5FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B604: .4byte gCurrentSprite
_0805B608: .4byte 0x0000FEE0
_0805B60C: .4byte sRidleyPreSpawnOam_3b0a9c

	thumb_func_start RidleyPreSpawnWaitingForSamus
RidleyPreSpawnWaitingForSamus: @ 0x0805B610
	push {lr}
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #8
	bne _0805B642
	ldr r0, _0805B648 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #2
	strb r1, [r2]
	ldr r1, _0805B64C @ =sRidleyPreSpawnOam_3b0aac
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0xa0
	strb r1, [r0]
	movs r0, #0xee
	lsls r0, r0, #1
	bl SoundPlay
_0805B642:
	pop {r0}
	bx r0
	.align 2, 0
_0805B648: .4byte gCurrentSprite
_0805B64C: .4byte sRidleyPreSpawnOam_3b0aac

	thumb_func_start RidleyPreSpawnOpeningEye
RidleyPreSpawnOpeningEye: @ 0x0805B650
	push {lr}
	ldr r3, _0805B67C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805B676
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	ldr r0, _0805B680 @ =sRidleyPreSpawnOam_3b0ae4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
_0805B676:
	pop {r0}
	bx r0
	.align 2, 0
_0805B67C: .4byte gCurrentSprite
_0805B680: .4byte sRidleyPreSpawnOam_3b0ae4

	thumb_func_start RidleyPreSpawnClosingEye
RidleyPreSpawnClosingEye: @ 0x0805B684
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0805B6A8
	ldr r0, _0805B6AC @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x1a
	strb r1, [r2]
	ldr r1, _0805B6B0 @ =sRidleyPreSpawnOam_3b0a9c
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x3c
	strb r1, [r0]
_0805B6A8:
	pop {r0}
	bx r0
	.align 2, 0
_0805B6AC: .4byte gCurrentSprite
_0805B6B0: .4byte sRidleyPreSpawnOam_3b0a9c

	thumb_func_start RidleyPreSpawnEyeClosed
RidleyPreSpawnEyeClosed: @ 0x0805B6B4
	push {lr}
	ldr r2, _0805B6E8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805B6E2
	subs r1, #0xa
	movs r0, #0x1c
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x2c
	strh r0, [r2, #6]
	movs r0, #0x42
	movs r1, #7
	bl PlayMusic
_0805B6E2:
	pop {r0}
	bx r0
	.align 2, 0
_0805B6E8: .4byte gCurrentSprite

	thumb_func_start RidleyPreSpawnTurningIntoRidley
RidleyPreSpawnTurningIntoRidley: @ 0x0805B6EC
	push {r4, lr}
	ldr r2, _0805B734 @ =gWrittenToMosaic_H
	ldr r1, _0805B738 @ =sXParasiteMosaicValues
	ldr r4, _0805B73C @ =gCurrentSprite
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bhi _0805B744
	ldrh r2, [r4, #6]
	movs r0, #0xcb
	movs r1, #0
	bl SpriteLoadGfx
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0805B752
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	movs r0, #0xcb
	strb r0, [r4, #0x1d]
	ldrh r0, [r4]
	ldr r2, _0805B740 @ =0x00008004
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	b _0805B752
	.align 2, 0
_0805B734: .4byte gWrittenToMosaic_H
_0805B738: .4byte sXParasiteMosaicValues
_0805B73C: .4byte gCurrentSprite
_0805B740: .4byte 0x00008004
_0805B744:
	cmp r0, #0x20
	bne _0805B752
	movs r0, #0xcb
	movs r1, #0
	movs r2, #8
	bl SpriteLoadPal
_0805B752:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyPreSpawn
RidleyPreSpawn: @ 0x0805B758
	push {lr}
	ldr r0, _0805B770 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _0805B80E
	lsls r0, r0, #2
	ldr r1, _0805B774 @ =_0805B778
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B770: .4byte gCurrentSprite
_0805B774: .4byte _0805B778
_0805B778: @ jump table
	.4byte _0805B7EC @ case 0
	.4byte _0805B7F2 @ case 1
	.4byte _0805B7F8 @ case 2
	.4byte _0805B80E @ case 3
	.4byte _0805B80E @ case 4
	.4byte _0805B80E @ case 5
	.4byte _0805B80E @ case 6
	.4byte _0805B80E @ case 7
	.4byte _0805B80E @ case 8
	.4byte _0805B80E @ case 9
	.4byte _0805B80E @ case 10
	.4byte _0805B80E @ case 11
	.4byte _0805B80E @ case 12
	.4byte _0805B80E @ case 13
	.4byte _0805B80E @ case 14
	.4byte _0805B80E @ case 15
	.4byte _0805B80E @ case 16
	.4byte _0805B80E @ case 17
	.4byte _0805B80E @ case 18
	.4byte _0805B80E @ case 19
	.4byte _0805B80E @ case 20
	.4byte _0805B80E @ case 21
	.4byte _0805B80E @ case 22
	.4byte _0805B80E @ case 23
	.4byte _0805B7FE @ case 24
	.4byte _0805B80E @ case 25
	.4byte _0805B804 @ case 26
	.4byte _0805B80E @ case 27
	.4byte _0805B80A @ case 28
_0805B7EC:
	bl RidleyPreSpawnInit
	b _0805B80E
_0805B7F2:
	bl RidleyPreSpawnWaitingForSamus
	b _0805B80E
_0805B7F8:
	bl RidleyPreSpawnOpeningEye
	b _0805B80E
_0805B7FE:
	bl RidleyPreSpawnClosingEye
	b _0805B80E
_0805B804:
	bl RidleyPreSpawnEyeClosed
	b _0805B80E
_0805B80A:
	bl RidleyPreSpawnTurningIntoRidley
_0805B80E:
	pop {r0}
	bx r0
	.align 2, 0
