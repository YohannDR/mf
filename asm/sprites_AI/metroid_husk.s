    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start MetroidHusk
MetroidHusk: @ 0x08059054
	push {r4, r5, lr}
	ldr r3, _080590A8 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r5, r3, #0
	adds r5, #0x24
	ldrb r4, [r5]
	cmp r4, #0
	bne _080590A0
	adds r0, r3, #0
	adds r0, #0x22
	movs r2, #4
	strb r2, [r0]
	adds r0, #3
	strb r4, [r0]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _080590AC @ =0x0000FFFC
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	strh r0, [r3, #0xe]
	strh r2, [r3, #0x10]
	movs r0, #2
	strb r0, [r5]
	ldr r0, _080590B0 @ =sMetroidHuskOam
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r4, [r3, #0x16]
_080590A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080590A8: .4byte gCurrentSprite
_080590AC: .4byte 0x0000FFFC
_080590B0: .4byte sMetroidHuskOam
