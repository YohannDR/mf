    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start BigFlashingNumber
BigFlashingNumber: @ 0x0804C578
	push {r4, r5, r6, r7, lr}
	ldr r4, _0804C5FC @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x24
	ldrb r6, [r3]
	cmp r6, #0
	bne _0804C65A
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	strb r6, [r0]
	adds r1, #2
	movs r0, #8
	strb r0, [r1]
	movs r2, #0
	ldr r1, _0804C600 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r5, #0xf
	ands r5, r0
	adds r7, r5, #0
	bl GetFlashingSectorNumber
	lsls r0, r0, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _0804C658
	cmp r5, #7
	bne _0804C608
	ldr r0, _0804C604 @ =sBigFlashingNumberOam_37edfc
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C5FC: .4byte gCurrentSprite
_0804C600: .4byte 0x0000FFFC
_0804C604: .4byte sBigFlashingNumberOam_37edfc
_0804C608:
	cmp r5, #8
	bne _0804C618
	ldr r0, _0804C614 @ =sBigFlashingNumberOam_37ee44
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C614: .4byte sBigFlashingNumberOam_37ee44
_0804C618:
	cmp r5, #9
	bne _0804C628
	ldr r0, _0804C624 @ =sBigFlashingNumberOam_37ee8c
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C624: .4byte sBigFlashingNumberOam_37ee8c
_0804C628:
	cmp r5, #0xa
	bne _0804C638
	ldr r0, _0804C634 @ =sBigFlashingNumberOam_37eed4
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C634: .4byte sBigFlashingNumberOam_37eed4
_0804C638:
	cmp r5, #0xb
	bne _0804C648
	ldr r0, _0804C644 @ =sBigFlashingNumberOam_37ef1c
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C644: .4byte sBigFlashingNumberOam_37ef1c
_0804C648:
	cmp r7, #0xc
	bne _0804C658
	ldr r0, _0804C654 @ =sBigFlashingNumberOam_37ef64
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C654: .4byte sBigFlashingNumberOam_37ef64
_0804C658:
	strh r6, [r4]
_0804C65A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start FlashingNumber
FlashingNumber: @ 0x0804C660
	push {r4, r5, r6, r7, lr}
	ldr r4, _0804C6E0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r6, [r5]
	cmp r6, #0
	bne _0804C73E
	ldrh r0, [r4, #4]
	adds r0, #0x20
	movs r3, #0
	strh r0, [r4, #4]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x27
	movs r2, #0x10
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #8
	strb r0, [r1]
	ldr r1, _0804C6E4 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	subs r0, #3
	strb r2, [r0]
	strb r3, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, #8
	ldrb r0, [r0]
	movs r5, #7
	ands r5, r0
	adds r7, r5, #0
	bl GetFlashingSectorNumber
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _0804C73C
	cmp r5, #1
	bne _0804C6EC
	ldr r0, _0804C6E8 @ =sFlashingNumberOam_37f948
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C6E0: .4byte gCurrentSprite
_0804C6E4: .4byte 0x0000FFFC
_0804C6E8: .4byte sFlashingNumberOam_37f948
_0804C6EC:
	cmp r5, #2
	bne _0804C6FC
	ldr r0, _0804C6F8 @ =sFlashingNumberOam_37f990
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C6F8: .4byte sFlashingNumberOam_37f990
_0804C6FC:
	cmp r5, #3
	bne _0804C70C
	ldr r0, _0804C708 @ =sFlashingNumberOam_37f9d8
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C708: .4byte sFlashingNumberOam_37f9d8
_0804C70C:
	cmp r5, #4
	bne _0804C71C
	ldr r0, _0804C718 @ =sFlashingNumberOam_37fa20
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C718: .4byte sFlashingNumberOam_37fa20
_0804C71C:
	cmp r5, #5
	bne _0804C72C
	ldr r0, _0804C728 @ =sFlashingNumberOam_37fa68
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C728: .4byte sFlashingNumberOam_37fa68
_0804C72C:
	cmp r7, #6
	bne _0804C73C
	ldr r0, _0804C738 @ =sFlashingNumberOam_37fab0
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C738: .4byte sFlashingNumberOam_37fab0
_0804C73C:
	strh r6, [r4]
_0804C73E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
