    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ToxicGasInit
ToxicGasInit: @ 0x0802F404
	push {r4, lr}
	ldr r3, _0802F484 @ =gCurrentSprite
	ldr r2, _0802F488 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	movs r1, #0
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	ldr r0, _0802F48C @ =sToxicGasOam_336828
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802F490 @ =0x0000FFD0
	strh r1, [r3, #0xa]
	movs r0, #0xb0
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrh r0, [r3]
	movs r4, #0x81
	lsls r4, r4, #7
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r0, _0802F494 @ =0x000001FF
	strh r0, [r3, #0x12]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #1
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F484: .4byte gCurrentSprite
_0802F488: .4byte sPrimarySpriteStats
_0802F48C: .4byte sToxicGasOam_336828
_0802F490: .4byte 0x0000FFD0
_0802F494: .4byte 0x000001FF

	thumb_func_start ToxicGasIdle
ToxicGasIdle: @ 0x0802F498
	push {r4, lr}
	sub sp, #0xc
	ldr r2, _0802F4C8 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
	adds r4, r2, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	adds r3, r2, #0
	cmp r0, #0
	beq _0802F4CC
	ldrh r0, [r3, #0x12]
	adds r0, #2
	strh r0, [r3, #0x12]
	lsls r0, r0, #0x10
	movs r1, #0xff
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _0802F4E0
	ldrb r0, [r4]
	subs r0, #1
	b _0802F4DE
	.align 2, 0
_0802F4C8: .4byte gCurrentSprite
_0802F4CC:
	ldrh r0, [r3, #0x12]
	subs r0, #2
	strh r0, [r3, #0x12]
	lsls r0, r0, #0x10
	ldr r1, _0802F524 @ =0x01CB0000
	cmp r0, r1
	bhi _0802F4E0
	ldrb r0, [r4]
	adds r0, #1
_0802F4DE:
	strb r0, [r4]
_0802F4E0:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #1
	bne _0802F51C
	ldrh r4, [r3, #2]
	adds r4, #0x40
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r0, [r3, #4]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrb r1, [r3, #0x1e]
	ldrb r2, [r3, #0x1f]
	adds r3, #0x23
	ldrb r3, [r3]
	str r4, [sp]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x2a
	bl SpriteSpawnSecondary
	movs r0, #0xad
	lsls r0, r0, #1
	bl SoundPlay
_0802F51C:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F524: .4byte 0x01CB0000

	thumb_func_start ToxicGas
ToxicGas: @ 0x0802F528
	push {lr}
	ldr r0, _0802F548 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802F540
	bl ToxicGasInit
_0802F540:
	bl ToxicGasIdle
	pop {r0}
	bx r0
	.align 2, 0
_0802F548: .4byte gCurrentSprite

	thumb_func_start ToxicGasExplosion
ToxicGasExplosion: @ 0x0802F54C
	push {r4, r5, r6, lr}
	ldr r3, _0802F5C8 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r4, [r0]
	adds r6, r3, #0
	adds r6, #0x24
	ldrb r5, [r6]
	cmp r5, #0
	bne _0802F5DC
	ldrh r1, [r3]
	ldr r0, _0802F5CC @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r3]
	adds r2, r3, #0
	adds r2, #0x21
	movs r0, #1
	strb r0, [r2]
	adds r2, #1
	movs r0, #3
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	ldr r0, _0802F5D0 @ =sToxicGasOam_3367d0
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r5, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802F5D4 @ =0x0000FF80
	strh r1, [r3, #0xa]
	movs r0, #0x80
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	strb r2, [r6]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0802F5D8 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	b _0802F612
	.align 2, 0
_0802F5C8: .4byte gCurrentSprite
_0802F5CC: .4byte 0x0000FFFB
_0802F5D0: .4byte sToxicGasOam_3367d0
_0802F5D4: .4byte 0x0000FF80
_0802F5D8: .4byte gSpriteData
_0802F5DC:
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802F5EA
	subs r0, #1
	b _0802F5F0
_0802F5EA:
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
_0802F5F0:
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802F612
	ldr r1, _0802F618 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0802F61C @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	ldr r0, _0802F620 @ =0x00007FFF
	ands r0, r2
	strh r0, [r1]
_0802F612:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F618: .4byte gCurrentSprite
_0802F61C: .4byte gSpriteData
_0802F620: .4byte 0x00007FFF
