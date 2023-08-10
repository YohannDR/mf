    .include "asm/macros.inc"

    .syntax unified
    
    thumb_func_start memset
memset: @ 0x080A4F50
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _080A4F96
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _080A4F96
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _080A4F8A
_080A4F76:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _080A4F76
	b _080A4F8A
_080A4F86:
	stm r1!, {r3}
	subs r2, #4
_080A4F8A:
	cmp r2, #3
	bhi _080A4F86
	adds r3, r1, #0
	b _080A4F96
_080A4F92:
	strb r4, [r3]
	adds r3, #1
_080A4F96:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _080A4F92
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0