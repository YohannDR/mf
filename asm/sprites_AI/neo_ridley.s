    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start RidleyMove
RidleyMove: @ 0x080590B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r6, r4, #0x18
	movs r0, #0
	mov r8, r0
	movs r7, #0
	ldr r1, _0805911C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r2, #0xc8
	cmp r0, #0x1b
	bne _080590F4
	adds r2, #0x58
_080590F4:
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059128
	ldr r1, _08059120 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059124 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059140
	movs r1, #1
	mov r8, r1
	b _08059140
	.align 2, 0
_0805911C: .4byte gCurrentSprite
_08059120: .4byte gSubSpriteData1
_08059124: .4byte gPreviousCollisionCheck
_08059128:
	ldr r1, _08059170 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	subs r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059174 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059140
	movs r2, #1
	mov r8, r2
_08059140:
	ldr r0, _08059178 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805917C
	ldr r4, _08059170 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0xe0
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08059174 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059192
	ldrh r0, [r4, #8]
	adds r0, #0xa0
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	b _0805918E
	.align 2, 0
_08059170: .4byte gSubSpriteData1
_08059174: .4byte gPreviousCollisionCheck
_08059178: .4byte gCurrentSprite
_0805917C:
	ldr r1, _080591E4 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldr r5, _080591E8 @ =0xFFFFFE80
	adds r0, r0, r5
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080591EC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
_0805918E:
	cmp r0, #0
	beq _08059198
_08059192:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08059198:
	movs r4, #0
	ldr r2, _080591F0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _08059214
	mov r0, r8
	cmp r0, #0
	bne _0805927E
	movs r1, #0x2f
	adds r1, r1, r3
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080591F4
	ldr r2, _080591E4 @ =gSubSpriteData1
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sb
	cmp r1, r0
	bgt _08059232
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _080591D8
	adds r0, #1
	strb r0, [r1]
_080591D8:
	ldrb r0, [r1]
	asrs r0, r6
	ldrh r5, [r2, #0xa]
	adds r0, r0, r5
	strh r0, [r2, #0xa]
	b _0805927A
	.align 2, 0
_080591E4: .4byte gSubSpriteData1
_080591E8: .4byte 0xFFFFFE80
_080591EC: .4byte gPreviousCollisionCheck
_080591F0: .4byte gCurrentSprite
_080591F4:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805927E
	ldr r1, _08059210 @ =gSubSpriteData1
	mov r2, ip
	ldrb r0, [r2]
	asrs r0, r6
	ldrh r5, [r1, #0xa]
	adds r0, r0, r5
	strh r0, [r1, #0xa]
	b _0805927A
	.align 2, 0
_08059210: .4byte gSubSpriteData1
_08059214:
	mov r0, r8
	cmp r0, #0
	bne _08059278
	movs r1, #0x2f
	adds r1, r1, r3
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805925A
	ldr r2, _08059240 @ =gSubSpriteData1
	ldrh r1, [r2, #0xa]
	ldr r0, _08059244 @ =0xFFFFFF00
	add r0, sb
	cmp r1, r0
	bge _08059248
_08059232:
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r2, ip
	strb r0, [r2]
	b _0805927A
	.align 2, 0
_08059240: .4byte gSubSpriteData1
_08059244: .4byte 0xFFFFFF00
_08059248:
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _08059256
	adds r0, #1
	strb r0, [r1]
_08059256:
	ldrb r1, [r1]
	b _0805926A
_0805925A:
	subs r0, #1
	mov r5, ip
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805927E
	ldr r2, _08059274 @ =gSubSpriteData1
	ldrb r1, [r5]
_0805926A:
	asrs r1, r6
	ldrh r0, [r2, #0xa]
	subs r0, r0, r1
	strh r0, [r2, #0xa]
	b _0805927A
	.align 2, 0
_08059274: .4byte gSubSpriteData1
_08059278:
	movs r4, #1
_0805927A:
	cmp r4, #0
	beq _080592A2
_0805927E:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _080592A2
	subs r1, #0xc
	movs r0, #3
	strb r0, [r1]
_080592A2:
	movs r4, #0
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08059318
	cmp r7, #0
	bne _0805937A
	movs r5, #0x2e
	adds r5, r5, r3
	mov ip, r5
	ldrb r0, [r5]
	cmp r0, #0
	bne _080592F8
	ldr r2, _080592D8 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _080592DC
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r5]
	b _08059376
	.align 2, 0
_080592D8: .4byte gSubSpriteData1
_080592DC:
	adds r1, r3, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r5, [sp, #4]
	cmp r0, r5
	bhs _080592EC
	adds r0, #1
	strb r0, [r1]
_080592EC:
	ldrb r0, [r1]
	asrs r0, r6
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #8]
	b _08059376
_080592F8:
	subs r0, #1
	mov r2, ip
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805937A
	ldr r1, _08059314 @ =gSubSpriteData1
	ldrb r0, [r2]
	asrs r0, r6
	ldrh r5, [r1, #8]
	adds r0, r0, r5
	strh r0, [r1, #8]
	b _08059376
	.align 2, 0
_08059314: .4byte gSubSpriteData1
_08059318:
	cmp r7, #0
	bne _08059374
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059356
	ldr r2, _08059340 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, [sp]
	adds r0, #4
	cmp r1, r0
	bge _08059344
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	b _08059376
	.align 2, 0
_08059340: .4byte gSubSpriteData1
_08059344:
	adds r1, r3, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r5, [sp, #4]
	cmp r0, r5
	bhs _08059364
	adds r0, #1
	strb r0, [r1]
	b _08059364
_08059356:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805937A
	ldr r2, _08059370 @ =gSubSpriteData1
_08059364:
	ldrb r1, [r1]
	asrs r1, r6
	ldrh r0, [r2, #8]
	subs r0, r0, r1
	strh r0, [r2, #8]
	b _08059376
	.align 2, 0
_08059370: .4byte gSubSpriteData1
_08059374:
	movs r4, #1
_08059376:
	cmp r4, #0
	beq _0805938E
_0805937A:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0805938E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UpdateSubSpriteData2Animation
UpdateSubSpriteData2Animation: @ 0x080593A0
	push {lr}
	ldr r2, _080593D8 @ =gSubSpriteData2
	ldrb r0, [r2, #6]
	adds r0, #1
	strb r0, [r2, #6]
	ldrh r1, [r2, #4]
	ldr r3, [r2]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrb r1, [r1, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhs _080593D4
	movs r0, #1
	strb r0, [r2, #6]
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080593D4
	strh r0, [r2, #4]
_080593D4:
	pop {r0}
	bx r0
	.align 2, 0
_080593D8: .4byte gSubSpriteData2

	thumb_func_start RidleySyncSubSpritesPosition
RidleySyncSubSpritesPosition: @ 0x080593DC
	push {r4, lr}
	ldr r4, _0805941C @ =gSubSpriteData2
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08059420 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059424
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _08059436
	.align 2, 0
_0805941C: .4byte gSubSpriteData2
_08059420: .4byte gCurrentSprite
_08059424:
	ldrb r0, [r2, #0x1e]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_08059436:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleySyncSubSprites
RidleySyncSubSprites: @ 0x0805943C
	push {r4, lr}
	ldr r4, _080594A0 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _080594A4 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _080594A8 @ =sRidleyFrameDataPointers
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805946E
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805946E:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	ldrb r1, [r2, #0x1e]
	cmp r0, #0
	beq _080594AC
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _080594BC
	.align 2, 0
_080594A0: .4byte gSubSpriteData1
_080594A4: .4byte gCurrentSprite
_080594A8: .4byte sRidleyFrameDataPointers
_080594AC:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_080594BC:
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bne _080594CC
	ldr r0, _080594D4 @ =gSubSpriteData2
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
_080594CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080594D4: .4byte gSubSpriteData2

	thumb_func_start RidleyTailSyncSubSprites
RidleyTailSyncSubSprites: @ 0x080594D8
	push {r4, lr}
	ldr r4, _0805953C @ =gSubSpriteData2
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08059540 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08059544 @ =sRidleyFrameDataPointers
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805950A
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805950A:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	ldrb r1, [r2, #0x1e]
	cmp r0, #0
	beq _08059548
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _08059558
	.align 2, 0
_0805953C: .4byte gSubSpriteData2
_08059540: .4byte gCurrentSprite
_08059544: .4byte sRidleyFrameDataPointers
_08059548:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_08059558:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyUpdatePalette
RidleyUpdatePalette: @ 0x08059560
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _08059584 @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r2, _08059588 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r4, _0805958C @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _08059590
	cmp r1, #1
	beq _080595A8
	b _080595BE
	.align 2, 0
_08059584: .4byte gCurrentSprite
_08059588: .4byte sPrimarySpriteStats
_0805958C: .4byte gBossWork1
_08059590:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _080595BE
	ldr r7, _080595A4 @ =0x083AE06C
	movs r0, #1
	strb r0, [r4]
	b _080595C2
	.align 2, 0
_080595A4: .4byte 0x083AE06C
_080595A8:
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _080595BE
	ldr r7, _080595D8 @ =0x083AE0AC
	movs r0, #2
	strb r0, [r4]
	movs r6, #1
_080595BE:
	cmp r6, #0
	beq _080595D0
_080595C2:
	ldr r1, _080595DC @ =0x040000D4
	str r7, [r1]
	ldr r0, _080595E0 @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _080595E4 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080595D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080595D8: .4byte 0x083AE0AC
_080595DC: .4byte 0x040000D4
_080595E0: .4byte 0x05000300
_080595E4: .4byte 0x80000020

	thumb_func_start RidleySetBackgroundPriority
RidleySetBackgroundPriority: @ 0x080595E8
	push {lr}
	ldr r2, _0805960C @ =gCurrentSprite
	ldrh r0, [r2, #2]
	lsrs r0, r0, #2
	ldr r1, _08059610 @ =gBg1YPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08059614 @ =0xFF410000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x1c
	bhi _08059618
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #2
	b _08059624
	.align 2, 0
_0805960C: .4byte gCurrentSprite
_08059610: .4byte gBg1YPosition
_08059614: .4byte 0xFF410000
_08059618:
	ldr r0, _0805962C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
_08059624:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805962C: .4byte gIoRegisters

	thumb_func_start RidleyUpdateClawOam
RidleyUpdateClawOam: @ 0x08059630
	push {lr}
	ldr r0, _08059654 @ =gCurrentSprite
	adds r3, r0, #0
	adds r3, #0x25
	ldrb r0, [r3]
	cmp r0, #0x1b
	bne _08059660
	ldr r1, _08059658 @ =gSubSpriteData1
	ldr r0, [r1]
	ldr r2, _0805965C @ =sRidleyMultiSpriteData_3a9f74
	cmp r0, r2
	beq _08059676
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	b _08059676
	.align 2, 0
_08059654: .4byte gCurrentSprite
_08059658: .4byte gSubSpriteData1
_0805965C: .4byte sRidleyMultiSpriteData_3a9f74
_08059660:
	ldr r1, _0805967C @ =gSubSpriteData1
	ldr r0, [r1]
	ldr r2, _08059680 @ =sRidleyMultiSpriteData_3a9944
	cmp r0, r2
	beq _08059676
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	movs r0, #0x1a
	strb r0, [r3]
_08059676:
	pop {r0}
	bx r0
	.align 2, 0
_0805967C: .4byte gSubSpriteData1
_08059680: .4byte sRidleyMultiSpriteData_3a9944

	thumb_func_start RidleyTailStrikingCheckPlayEffects
RidleyTailStrikingCheckPlayEffects: @ 0x08059684
	push {lr}
	ldr r2, _080596B4 @ =gCurrentSprite
	ldrh r0, [r2, #6]
	adds r0, #0x14
	ldr r1, _080596B8 @ =0x0000053E
	cmp r0, r1
	bgt _080596AA
	ldrh r0, [r2, #2]
	adds r0, #0x14
	cmp r0, r1
	ble _080596AA
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	movs r0, #0xf4
	lsls r0, r0, #1
	bl SoundPlay
_080596AA:
	ldr r1, _080596B4 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	pop {r0}
	bx r0
	.align 2, 0
_080596B4: .4byte gCurrentSprite
_080596B8: .4byte 0x0000053E

	thumb_func_start RidleyTailStrikeYMovement
RidleyTailStrikeYMovement: @ 0x080596BC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080596EC @ =gSamusData
	ldr r4, _080596F0 @ =gSubSpriteData1
	ldrh r2, [r4, #8]
	ldrh r0, [r0, #0x18]
	adds r1, r2, #0
	cmp r0, r1
	blo _080596E6
	ldr r0, _080596F4 @ =0x0000043F
	cmp r1, r0
	bhi _080596E6
	ldr r0, _080596F8 @ =gCurrentSprite
	ldrh r0, [r0, #2]
	adds r0, #0x14
	ldr r1, _080596FC @ =0x0000053E
	cmp r0, r1
	bgt _080596E6
	adds r0, r3, r2
	strh r0, [r4, #8]
_080596E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080596EC: .4byte gSamusData
_080596F0: .4byte gSubSpriteData1
_080596F4: .4byte 0x0000043F
_080596F8: .4byte gCurrentSprite
_080596FC: .4byte 0x0000053E

	thumb_func_start RidleyFloatingMovement
RidleyFloatingMovement: @ 0x08059700
	push {r4, lr}
	sub sp, #4
	ldr r0, _08059718 @ =gCurrentSprite
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08059724
	ldr r0, _0805971C @ =gXParasiteTargetYPosition
	ldrh r2, [r0]
	ldr r0, _08059720 @ =gXParasiteTargetXPosition
	ldrh r1, [r0]
	b _0805975C
	.align 2, 0
_08059718: .4byte gCurrentSprite
_0805971C: .4byte gXParasiteTargetYPosition
_08059720: .4byte gXParasiteTargetXPosition
_08059724:
	ldr r0, _08059748 @ =gFrameCounter8Bit
	ldrb r2, [r0]
	ldr r0, _0805974C @ =gSamusData
	ldrh r4, [r0, #0x18]
	ldr r1, _08059750 @ =0x000002BF
	adds r3, r0, #0
	cmp r4, r1
	bls _08059758
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	bne _08059758
	ldr r1, _08059754 @ =0xFFFFFE00
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _0805975A
	.align 2, 0
_08059748: .4byte gFrameCounter8Bit
_0805974C: .4byte gSamusData
_08059750: .4byte 0x000002BF
_08059754: .4byte 0xFFFFFE00
_08059758:
	ldrh r2, [r3, #0x18]
_0805975A:
	ldrh r1, [r3, #0x16]
_0805975C:
	movs r0, #2
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0x18
	movs r3, #0x18
	bl RidleyMove
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyUpdateHealthThreshold
RidleyUpdateHealthThreshold: @ 0x08059774
	push {r4, lr}
	ldr r4, _080597B4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08059820
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _08059798
	ldr r0, _080597B8 @ =0x000001E1
	bl SoundPlayNotAlreadyPlaying
_08059798:
	ldrh r2, [r4, #0x14]
	cmp r2, #0
	bne _080597C4
	ldr r0, _080597BC @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _080597C4
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x1f
	strb r1, [r0]
	ldr r0, _080597C0 @ =gBossWork5
	strh r2, [r0]
	b _08059818
	.align 2, 0
_080597B4: .4byte gCurrentSprite
_080597B8: .4byte 0x000001E1
_080597BC: .4byte gSubSpriteData1
_080597C0: .4byte gBossWork5
_080597C4:
	ldr r2, _080597F8 @ =gBossWork5
	ldr r0, _080597FC @ =gSubSpriteData1
	ldr r3, _08059800 @ =gCurrentSprite
	ldrh r0, [r0, #0xc]
	ldrh r1, [r3, #0x14]
	subs r0, r0, r1
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	movs r1, #0xfa
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08059804
	adds r1, r3, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x18
	beq _080597F2
	cmp r0, #0x1a
	beq _080597F2
	movs r0, #0x1f
	strb r0, [r1]
_080597F2:
	movs r0, #0
	strh r0, [r2]
	b _08059818
	.align 2, 0
_080597F8: .4byte gBossWork5
_080597FC: .4byte gSubSpriteData1
_08059800: .4byte gCurrentSprite
_08059804:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08059818
	ldr r0, _08059828 @ =0x000001DF
	bl SoundPlayNotAlreadyPlaying
_08059818:
	ldr r0, _0805982C @ =gSubSpriteData1
	ldr r1, _08059830 @ =gCurrentSprite
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0xc]
_08059820:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059828: .4byte 0x000001DF
_0805982C: .4byte gSubSpriteData1
_08059830: .4byte gCurrentSprite

	thumb_func_start RidleyWaveBeamCollsiion
RidleyWaveBeamCollsiion: @ 0x08059834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r3, _08059908 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080598F8
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _080598F8
	ldrh r1, [r3, #2]
	ldrh r2, [r3, #4]
	ldrh r0, [r3, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r3, #0xc]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r0, [r3, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r3, #0x10]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r7, #0
_08059882:
	ldr r1, _0805990C @ =gProjectileData
	lsls r0, r7, #5
	adds r4, r0, r1
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080598EE
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080598EE
	ldrb r0, [r4, #0xf]
	cmp r0, #4
	bne _080598EE
	ldrh r5, [r4, #8]
	ldrh r6, [r4, #0xa]
	ldrh r0, [r4, #0x16]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x18]
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #0x1a]
	adds r2, r6, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r3, [r4, #0x1c]
	adds r3, r6, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov ip, r3
	ldr r3, [sp, #0x10]
	str r3, [sp]
	mov r3, sl
	str r3, [sp, #4]
	mov r3, sb
	str r3, [sp, #8]
	mov r3, r8
	str r3, [sp, #0xc]
	mov r3, ip
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _080598EE
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
_080598EE:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _08059882
_080598F8:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059908: .4byte gCurrentSprite
_0805990C: .4byte gProjectileData

	thumb_func_start RidleyCheckGrabSamusLeft
RidleyCheckGrabSamusLeft: @ 0x08059910
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #0x10
	adds r0, r0, r2
	lsrs r7, r0, #0x10
	ldr r0, _08059938 @ =gSubSpriteData1
	ldr r2, [r0]
	ldr r0, _0805993C @ =sRidleyMultiSpriteData_3a9a2c
	cmp r2, r0
	beq _08059930
	ldr r0, _08059940 @ =sRidleyMultiSpriteData_3a9a44
	cmp r2, r0
	bne _08059944
_08059930:
	adds r0, r1, #0
	subs r0, #0x82
	b _08059948
	.align 2, 0
_08059938: .4byte gSubSpriteData1
_0805993C: .4byte sRidleyMultiSpriteData_3a9a2c
_08059940: .4byte sRidleyMultiSpriteData_3a9a44
_08059944:
	adds r0, r1, #0
	subs r0, #0xe6
_08059948:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r6, _08059978 @ =gSamusData
	movs r0, #0x24
	ldrsh r1, [r6, r0]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0805997C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059980
	movs r2, #0x28
	ldrsh r1, [r6, r2]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059980
	movs r0, #1
	b _08059982
	.align 2, 0
_08059978: .4byte gSamusData
_0805997C: .4byte gPreviousCollisionCheck
_08059980:
	movs r0, #0
_08059982:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start RidleyCheckGrabSamusRight
RidleyCheckGrabSamusRight: @ 0x08059988
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #0x10
	adds r0, r0, r2
	lsrs r7, r0, #0x10
	ldr r0, _080599B0 @ =gSubSpriteData1
	ldr r2, [r0]
	ldr r0, _080599B4 @ =sRidleyMultiSpriteData_3a9a2c
	cmp r2, r0
	beq _080599A8
	ldr r0, _080599B8 @ =sRidleyMultiSpriteData_3a9a44
	cmp r2, r0
	bne _080599BC
_080599A8:
	adds r0, r1, #0
	adds r0, #0x82
	b _080599C0
	.align 2, 0
_080599B0: .4byte gSubSpriteData1
_080599B4: .4byte sRidleyMultiSpriteData_3a9a2c
_080599B8: .4byte sRidleyMultiSpriteData_3a9a44
_080599BC:
	adds r0, r1, #0
	adds r0, #0xe6
_080599C0:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r6, _080599F0 @ =gSamusData
	movs r0, #0x24
	ldrsh r1, [r6, r0]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080599F4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080599F8
	movs r2, #0x28
	ldrsh r1, [r6, r2]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080599F8
	movs r0, #1
	b _080599FA
	.align 2, 0
_080599F0: .4byte gSamusData
_080599F4: .4byte gPreviousCollisionCheck
_080599F8:
	movs r0, #0
_080599FA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start RidleySamusGrabbed
RidleySamusGrabbed: @ 0x08059A00
	push {r4, lr}
	ldr r2, _08059A40 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08059A78
	ldr r3, _08059A44 @ =0x0000F7FF
	ands r3, r1
	strh r3, [r2]
	ldr r4, _08059A48 @ =gSamusData
	ldrh r0, [r2, #2]
	adds r0, #0xb4
	strh r0, [r4, #0x18]
	ldr r0, _08059A4C @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _08059A50 @ =sRidleyMultiSpriteData_3a9a2c
	cmp r1, r0
	beq _08059A2E
	ldr r0, _08059A54 @ =sRidleyMultiSpriteData_3a9a44
	cmp r1, r0
	bne _08059A60
_08059A2E:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08059A58
	ldrh r0, [r2, #4]
	adds r0, #0x82
	strh r0, [r4, #0x16]
	b _08059A86
	.align 2, 0
_08059A40: .4byte gCurrentSprite
_08059A44: .4byte 0x0000F7FF
_08059A48: .4byte gSamusData
_08059A4C: .4byte gSubSpriteData1
_08059A50: .4byte sRidleyMultiSpriteData_3a9a2c
_08059A54: .4byte sRidleyMultiSpriteData_3a9a44
_08059A58:
	ldrh r0, [r2, #4]
	subs r0, #0x82
	strh r0, [r4, #0x16]
	b _08059A86
_08059A60:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08059A70
	ldrh r0, [r2, #4]
	adds r0, #0xe6
	strh r0, [r4, #0x16]
	b _08059A86
_08059A70:
	ldrh r0, [r2, #4]
	subs r0, #0xe6
	strh r0, [r4, #0x16]
	b _08059A86
_08059A78:
	adds r1, r2, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _08059A86
	movs r0, #0x1a
	strb r0, [r1]
_08059A86:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleySetSideHitboxes
RidleySetSideHitboxes: @ 0x08059A8C
	push {lr}
	ldr r2, _08059AA4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059AAC
	ldr r0, _08059AA8 @ =0x0000FF80
	strh r0, [r2, #0xe]
	movs r0, #0xe0
	b _08059AB2
	.align 2, 0
_08059AA4: .4byte gCurrentSprite
_08059AA8: .4byte 0x0000FF80
_08059AAC:
	ldr r0, _08059AB8 @ =0x0000FF20
	strh r0, [r2, #0xe]
	movs r0, #0x80
_08059AB2:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08059AB8: .4byte 0x0000FF20

	thumb_func_start RidleyXMovement_Unused
RidleyXMovement_Unused: @ 0x08059ABC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r7, r5, #0
	movs r6, #0
	ldr r1, _08059AFC @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r2, #0xa0
	cmp r0, #0x1b
	bne _08059AD6
	adds r2, #0x80
_08059AD6:
	ldrh r1, [r1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059B08
	ldr r4, _08059B00 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B04 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059B1E
	ldrh r0, [r4, #0xa]
	adds r0, r5, r0
	b _08059B30
	.align 2, 0
_08059AFC: .4byte gCurrentSprite
_08059B00: .4byte gSubSpriteData1
_08059B04: .4byte gPreviousCollisionCheck
_08059B08:
	ldr r4, _08059B24 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	subs r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B28 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059B2C
_08059B1E:
	movs r6, #1
	b _08059B32
	.align 2, 0
_08059B24: .4byte gSubSpriteData1
_08059B28: .4byte gPreviousCollisionCheck
_08059B2C:
	ldrh r0, [r4, #0xa]
	subs r0, r0, r7
_08059B30:
	strh r0, [r4, #0xa]
_08059B32:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RidleyTailXMovement
RidleyTailXMovement: @ 0x08059B3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r8, r6
	ldr r0, _08059B84 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r5, [r0]
	movs r7, #0
	ldr r1, _08059B88 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059B94
	ldr r4, _08059B8C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	adds r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B90 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059BAA
	ldrh r0, [r4, #0xa]
	adds r0, r6, r0
	b _08059BBE
	.align 2, 0
_08059B84: .4byte gCurrentSprite
_08059B88: .4byte gSpriteData
_08059B8C: .4byte gSubSpriteData1
_08059B90: .4byte gPreviousCollisionCheck
_08059B94:
	ldr r4, _08059BB0 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	subs r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059BB4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059BB8
_08059BAA:
	movs r7, #1
	b _08059BC4
	.align 2, 0
_08059BB0: .4byte gSubSpriteData1
_08059BB4: .4byte gPreviousCollisionCheck
_08059BB8:
	ldrh r0, [r4, #0xa]
	mov r1, r8
	subs r0, r0, r1
_08059BBE:
	strh r0, [r4, #0xa]
	cmp r7, #0
	beq _08059BDA
_08059BC4:
	ldr r1, _08059BE8 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_08059BDA:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08059BE8: .4byte gSpriteData

	thumb_func_start RidleyScreamingInit
RidleyScreamingInit: @ 0x08059BEC
	push {r4, r5, lr}
	ldr r1, _08059C3C @ =gSubSpriteData1
	ldr r0, _08059C40 @ =sRidleyMultiSpriteData_3a9a14
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r4, _08059C44 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	bne _08059C20
	ldr r1, _08059C48 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08059C4C @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
_08059C20:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059C50
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0x3c
	strb r0, [r1]
	movs r0, #0xef
	lsls r0, r0, #1
	bl SoundPlay
	b _08059C64
	.align 2, 0
_08059C3C: .4byte gSubSpriteData1
_08059C40: .4byte sRidleyMultiSpriteData_3a9a14
_08059C44: .4byte gCurrentSprite
_08059C48: .4byte sSamusSetPoseFunctionPointer
_08059C4C: .4byte gSamusData
_08059C50:
	movs r0, #0
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0xb4
	strb r0, [r1]
	movs r0, #0xf0
	lsls r0, r0, #1
	bl unk_3b1c
_08059C64:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyScreaming
RidleyScreaming: @ 0x08059C6C
	push {r4, r5, lr}
	ldr r4, _08059C94 @ =gCurrentSprite
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _08059CCC
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059C98
	bl RidleyUpdateClawOam
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08059E32
	.align 2, 0
_08059C94: .4byte gCurrentSprite
_08059C98:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	orrs r0, r2
	adds r1, r4, #0
	adds r1, #0x2c
	strb r2, [r1]
	subs r1, #0xc
	strb r2, [r1]
	movs r1, #0x2c
	strh r1, [r4, #6]
	ldr r1, _08059CC8 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	b _08059E32
	.align 2, 0
_08059CC8: .4byte 0x0000FFFB
_08059CCC:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059CE2
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _08059CDC
	b _08059E32
_08059CDC:
	bl RidleyFloatingMovement
	b _08059E32
_08059CE2:
	ldr r0, _08059D04 @ =gSubSpriteData1
	ldrh r4, [r0, #8]
	ldrh r5, [r0, #0xa]
	ldrb r0, [r2]
	cmp r0, #0x40
	beq _08059DB0
	cmp r0, #0x40
	bgt _08059D12
	cmp r0, #0x10
	bne _08059CF8
	b _08059DFC
_08059CF8:
	cmp r0, #0x10
	bgt _08059D08
	cmp r0, #0
	bne _08059D02
	b _08059E18
_08059D02:
	b _08059E32
	.align 2, 0
_08059D04: .4byte gSubSpriteData1
_08059D08:
	cmp r0, #0x20
	beq _08059DE4
	cmp r0, #0x30
	beq _08059DC8
	b _08059E32
_08059D12:
	cmp r0, #0x70
	beq _08059D5E
	cmp r0, #0x70
	bgt _08059D24
	cmp r0, #0x50
	beq _08059D94
	cmp r0, #0x60
	beq _08059D7C
	b _08059E32
_08059D24:
	cmp r0, #0x80
	beq _08059D46
	cmp r0, #0x90
	beq _08059D2E
	b _08059E32
_08059D2E:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	subs r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	subs r1, #0x1a
	b _08059D74
_08059D46:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x1c
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	adds r1, #0x34
	b _08059DDC
_08059D5E:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x4c
_08059D74:
	movs r2, #0x25
	bl ParticleSet
	b _08059E32
_08059D7C:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x58
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	adds r1, #0x20
	b _08059E10
_08059D94:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	adds r1, #0x2a
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	subs r1, #0x1e
	adds r0, r4, #0
	movs r2, #0x21
	bl ParticleSet
	b _08059E32
_08059DB0:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _08059DDC
_08059DC8:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x1c
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x46
	adds r1, r5, #0
_08059DDC:
	movs r2, #0x22
	bl ParticleSet
	b _08059E32
_08059DE4:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x58
	b _08059E10
_08059DFC:
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	adds r1, #0x4c
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
_08059E10:
	movs r2, #0x2f
	bl ParticleSet
	b _08059E32
_08059E18:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	subs r1, #0x2a
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r4, #0
	movs r2, #0x21
	bl ParticleSet
_08059E32:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start RidleyTurningIntoCoreX
RidleyTurningIntoCoreX: @ 0x08059E38
	push {lr}
	ldr r2, _08059E74 @ =gWrittenToMosaic_H
	ldr r1, _08059E78 @ =sXParasiteMosaicValues
	ldr r3, _08059E7C @ =gCurrentSprite
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08059E62
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x49
	strb r0, [r3, #0x1d]
_08059E62:
	ldrh r0, [r3, #6]
	cmp r0, #0x13
	bhi _08059E80
	adds r2, r0, #0
	movs r0, #0x49
	movs r1, #0
	bl SpriteLoadGfx
	b _08059E8E
	.align 2, 0
_08059E74: .4byte gWrittenToMosaic_H
_08059E78: .4byte sXParasiteMosaicValues
_08059E7C: .4byte gCurrentSprite
_08059E80:
	cmp r0, #0x14
	bne _08059E8E
	movs r0, #0x49
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_08059E8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyForming
RidleyForming: @ 0x08059E94
	push {r4, r5, lr}
	ldr r3, _08059ED0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08059ED4 @ =gSubSpriteData1
	ldrb r0, [r4, #6]
	subs r0, #1
	strb r0, [r4, #6]
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _08059EE0
	ldr r2, _08059ED8 @ =gWrittenToMosaic_H
	ldr r1, _08059EDC @ =sXParasiteMosaicValues
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08059EFA
	.align 2, 0
_08059ED0: .4byte gCurrentSprite
_08059ED4: .4byte gSubSpriteData1
_08059ED8: .4byte gWrittenToMosaic_H
_08059EDC: .4byte sXParasiteMosaicValues
_08059EE0:
	ldrh r1, [r3]
	ldr r0, _08059F00 @ =0x00007FDF
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08059F04 @ =sRidleyMultiSpriteData_3a9a5c
	str r0, [r4]
	strb r2, [r4, #6]
	strh r5, [r4, #4]
_08059EFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059F00: .4byte 0x00007FDF
_08059F04: .4byte sRidleyMultiSpriteData_3a9a5c

	thumb_func_start RidleyScreamingAfterSpawn
RidleyScreamingAfterSpawn: @ 0x08059F08
	push {lr}
	ldr r1, _08059F70 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #4
	bne _08059F1E
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _08059F1E
	ldr r0, _08059F74 @ =0x000001DD
	bl SoundPlay
_08059F1E:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08059F6A
	ldr r2, _08059F78 @ =gSubSpriteData1
	ldr r0, _08059F7C @ =sRidleyMultiSpriteData_3a996c
	str r0, [r2]
	movs r0, #0
	strb r0, [r2, #6]
	movs r3, #0
	strh r0, [r2, #4]
	ldr r0, _08059F70 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	ldrh r0, [r2, #8]
	subs r0, #0xe0
	strh r0, [r2, #8]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0xe0
	strh r0, [r1, #2]
	adds r1, #0x27
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _08059F80 @ =0x0000FFA0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r0, #0xa0
	strh r0, [r1, #0xc]
_08059F6A:
	pop {r0}
	bx r0
	.align 2, 0
_08059F70: .4byte gCurrentSprite
_08059F74: .4byte 0x000001DD
_08059F78: .4byte gSubSpriteData1
_08059F7C: .4byte sRidleyMultiSpriteData_3a996c
_08059F80: .4byte 0x0000FFA0

	thumb_func_start RidleyRisingAfterSpawn
RidleyRisingAfterSpawn: @ 0x08059F84
	push {r4, r5, r6, r7, lr}
	ldr r5, _08059FB8 @ =gSubSpriteData1
	ldrh r3, [r5, #8]
	ldr r0, _08059FBC @ =0x0000027F
	cmp r3, r0
	bls _08059FD8
	ldr r0, _08059FC0 @ =gCurrentSprite
	adds r0, #0x31
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08059FC4 @ =sRidleyRisingAfterSpawnSpeed
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08059FC8 @ =0x00007FFF
	cmp r1, r0
	bne _08059FCC
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r5, #8]
	b _0805A014
	.align 2, 0
_08059FB8: .4byte gSubSpriteData1
_08059FBC: .4byte 0x0000027F
_08059FC0: .4byte gCurrentSprite
_08059FC4: .4byte sRidleyRisingAfterSpawnSpeed
_08059FC8: .4byte 0x00007FFF
_08059FCC:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	adds r0, r3, r4
	strh r0, [r5, #8]
	b _0805A014
_08059FD8:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805A014
	bl RidleyUpdateClawOam
	ldr r3, _0805A01C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	ldr r0, _0805A020 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, r3, #0
	adds r1, #0x2b
	strb r0, [r1]
_0805A014:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A01C: .4byte gCurrentSprite
_0805A020: .4byte gSpriteRandomNumber

	thumb_func_start RidleyInit
RidleyInit: @ 0x0805A024
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0805A1B0 @ =gBossWork1
	movs r0, #0
	strb r0, [r1]
	ldr r7, _0805A1B4 @ =gCurrentSprite
	ldrh r1, [r7]
	ldr r2, _0805A1B8 @ =0x00008240
	adds r0, r2, #0
	movs r6, #0
	movs r5, #0
	orrs r0, r1
	strh r0, [r7]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	movs r4, #2
	strb r4, [r0]
	adds r1, #5
	movs r0, #0x58
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x29
	movs r0, #0x50
	strb r0, [r2]
	ldr r0, _0805A1BC @ =0x0000FEC0
	strh r0, [r7, #0xa]
	strh r1, [r7, #0xc]
	bl RidleySetSideHitboxes
	strb r4, [r7, #0x1e]
	ldr r2, _0805A1C0 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
	ldr r4, _0805A1C4 @ =gSubSpriteData1
	strh r0, [r4, #0xc]
	ldr r0, _0805A1C8 @ =gBossWork5
	strh r5, [r0]
	adds r1, r7, #0
	adds r1, #0x24
	movs r0, #0x5a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	strb r0, [r1]
	ldrh r1, [r7]
	ldr r0, _0805A1CC @ =0x0000FFFB
	ands r0, r1
	strh r0, [r7]
	ldrh r0, [r7, #2]
	strh r0, [r4, #8]
	ldrh r0, [r7, #4]
	strh r0, [r4, #0xa]
	ldr r0, _0805A1D0 @ =sRidleyMultiSpriteData_3a9a5c
	str r0, [r4]
	strb r6, [r4, #6]
	strh r5, [r4, #4]
	strb r6, [r4, #0xe]
	ldrb r2, [r7, #0x1f]
	adds r6, r7, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #3
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A1B0: .4byte gBossWork1
_0805A1B4: .4byte gCurrentSprite
_0805A1B8: .4byte 0x00008240
_0805A1BC: .4byte 0x0000FEC0
_0805A1C0: .4byte sPrimarySpriteStats
_0805A1C4: .4byte gSubSpriteData1
_0805A1C8: .4byte gBossWork5
_0805A1CC: .4byte 0x0000FFFB
_0805A1D0: .4byte sRidleyMultiSpriteData_3a9a5c

	thumb_func_start RidleyIdleInit
RidleyIdleInit: @ 0x0805A1D4
	push {lr}
	bl RidleyUpdateClawOam
	ldr r3, _0805A21C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0805A220 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, #7
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	beq _0805A216
	movs r0, #0x1a
	strb r0, [r1]
_0805A216:
	pop {r0}
	bx r0
	.align 2, 0
_0805A21C: .4byte gCurrentSprite
_0805A220: .4byte gSpriteRandomNumber

	thumb_func_start RidleyIdle
RidleyIdle: @ 0x0805A224
	push {r4, r5, lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	ldr r4, _0805A258 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805A25C
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	beq _0805A26E
	movs r0, #0x7d
	bl SpriteUtilCountSecondarySprites
	cmp r0, #0
	bne _0805A260
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	b _0805A368
	.align 2, 0
_0805A258: .4byte gCurrentSprite
_0805A25C:
	subs r0, #1
	strb r0, [r1]
_0805A260:
	ldr r0, _0805A278 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x25
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0x1b
	bne _0805A280
_0805A26E:
	ldr r0, _0805A27C @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	ldr r5, _0805A278 @ =gCurrentSprite
	b _0805A284
	.align 2, 0
_0805A278: .4byte gCurrentSprite
_0805A27C: .4byte gXParasiteTargetXPosition
_0805A280:
	ldr r0, _0805A2E0 @ =gSamusData
	ldrh r2, [r0, #0x16]
_0805A284:
	adds r4, r5, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A304
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A2F0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	beq _0805A36E
	ldr r0, _0805A2E0 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805A2E4 @ =gSubSpriteData1
	ldrh r0, [r0, #8]
	adds r0, #0x80
	cmp r1, r0
	ble _0805A36E
	ldrh r0, [r4, #4]
	lsrs r0, r0, #2
	ldr r1, _0805A2E8 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x63
	bhi _0805A36E
	ldr r0, _0805A2EC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805A36E
	movs r0, #0x7d
	bl SpriteUtilCountSecondarySprites
	cmp r0, #0
	bne _0805A36E
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	b _0805A368
	.align 2, 0
_0805A2E0: .4byte gSamusData
_0805A2E4: .4byte gSubSpriteData1
_0805A2E8: .4byte gBg1XPosition
_0805A2EC: .4byte gSpriteRandomNumber
_0805A2F0:
	ldr r0, _0805A300 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	cmp r2, r0
	bhs _0805A36E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #9
	b _0805A36C
	.align 2, 0
_0805A300: .4byte gSubSpriteData1
_0805A304:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A324
	ldr r0, _0805A320 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	cmp r2, r0
	bls _0805A36E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #9
	b _0805A36C
	.align 2, 0
_0805A320: .4byte gSubSpriteData1
_0805A324:
	adds r4, r5, #0
	adds r4, #0x25
	ldrb r0, [r4]
	cmp r0, #0x1b
	beq _0805A36E
	ldr r0, _0805A374 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805A378 @ =gSubSpriteData1
	ldrh r0, [r0, #8]
	adds r0, #0x80
	cmp r1, r0
	ble _0805A36E
	ldrh r0, [r5, #4]
	lsrs r0, r0, #2
	ldr r1, _0805A37C @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x8c
	bls _0805A36E
	ldr r0, _0805A380 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805A36E
	movs r0, #0x7d
	bl SpriteUtilCountSecondarySprites
	cmp r0, #0
	bne _0805A36E
	movs r0, #2
	strb r0, [r4]
	adds r1, r5, #0
_0805A368:
	adds r1, #0x24
	movs r0, #0x2f
_0805A36C:
	strb r0, [r1]
_0805A36E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A374: .4byte gSamusData
_0805A378: .4byte gSubSpriteData1
_0805A37C: .4byte gBg1XPosition
_0805A380: .4byte gSpriteRandomNumber

	thumb_func_start RidleyTurningAroundInit
RidleyTurningAroundInit: @ 0x0805A384
	ldr r1, _0805A39C @ =gSubSpriteData1
	ldr r0, _0805A3A0 @ =sRidleyMultiSpriteData_3a9a2c
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A3A4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805A39C: .4byte gSubSpriteData1
_0805A3A0: .4byte sRidleyMultiSpriteData_3a9a2c
_0805A3A4: .4byte gCurrentSprite

	thumb_func_start RidleyTurningAround
RidleyTurningAround: @ 0x0805A3A8
	push {lr}
	bl RidleyFloatingMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805A3D8
	ldr r1, _0805A3DC @ =gSubSpriteData1
	ldr r0, _0805A3E0 @ =sRidleyMultiSpriteData_3a9a44
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r2, _0805A3E4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #5
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
	bl RidleySetSideHitboxes
_0805A3D8:
	pop {r0}
	bx r0
	.align 2, 0
_0805A3DC: .4byte gSubSpriteData1
_0805A3E0: .4byte sRidleyMultiSpriteData_3a9a44
_0805A3E4: .4byte gCurrentSprite

	thumb_func_start RidleyTurningAroundSecondPart
RidleyTurningAroundSecondPart: @ 0x0805A3E8
	push {lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805A406
	bl RidleyUpdateClawOam
	ldr r0, _0805A40C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
_0805A406:
	pop {r0}
	bx r0
	.align 2, 0
_0805A40C: .4byte gCurrentSprite

	thumb_func_start RidleyFlyingBackwardsInit
RidleyFlyingBackwardsInit: @ 0x0805A410
	ldr r0, _0805A420 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	movs r2, #0xa
	strb r2, [r1]
	adds r0, #0x2b
	strb r2, [r0]
	bx lr
	.align 2, 0
_0805A420: .4byte gCurrentSprite

	thumb_func_start RidleyFlyingBackwards
RidleyFlyingBackwards: @ 0x0805A424
	push {lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	ldr r1, _0805A44C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A446
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0805A446:
	pop {r0}
	bx r0
	.align 2, 0
_0805A44C: .4byte gCurrentSprite

	thumb_func_start RidleyPreparingTailAttack
RidleyPreparingTailAttack: @ 0x0805A450
	push {lr}
	bl RidleyUpdateClawOam
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyTailAttack
RidleyTailAttack: @ 0x0805A45C
	push {lr}
	bl RidleyUpdateClawOam
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyShootingFireInit
RidleyShootingFireInit: @ 0x0805A468
	ldr r1, _0805A480 @ =gSubSpriteData1
	ldr r0, _0805A484 @ =sRidleyMultiSpriteData_3a9994
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A488 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805A480: .4byte gSubSpriteData1
_0805A484: .4byte sRidleyMultiSpriteData_3a9994
_0805A488: .4byte gCurrentSprite

	thumb_func_start RidleyShootingFire
RidleyShootingFire: @ 0x0805A48C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl RidleyFloatingMovement
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0805A4EE
	ldr r2, _0805A4B8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A4C4
	ldr r0, _0805A4BC @ =gSamusData
	ldr r1, _0805A4C0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	blo _0805A4D0
	b _0805A4E4
	.align 2, 0
_0805A4B8: .4byte gCurrentSprite
_0805A4BC: .4byte gSamusData
_0805A4C0: .4byte gSubSpriteData1
_0805A4C4:
	ldr r0, _0805A4DC @ =gSamusData
	ldr r1, _0805A4E0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bls _0805A4E4
_0805A4D0:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0805A58E
	.align 2, 0
_0805A4DC: .4byte gSamusData
_0805A4E0: .4byte gSubSpriteData1
_0805A4E4:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0805A58E
_0805A4EE:
	ldr r2, _0805A508 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _0805A50C
	movs r6, #0x80
	lsls r6, r6, #2
	ldrh r0, [r5, #4]
	adds r0, #0xa0
	b _0805A512
	.align 2, 0
_0805A508: .4byte gCurrentSprite
_0805A50C:
	movs r6, #0
	ldrh r0, [r5, #4]
	subs r0, #0xa0
_0805A512:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r3, r5, #0
	ldrh r0, [r3, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r7, r1, #0
	ldr r2, _0805A550 @ =gSubSpriteData1
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _0805A58E
	ldrh r0, [r2, #4]
	cmp r0, #3
	bne _0805A558
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #0
	bl SpriteSpawnSecondary
	ldr r0, _0805A554 @ =0x000001E3
	bl SoundPlay
	b _0805A58E
	.align 2, 0
_0805A550: .4byte gSubSpriteData1
_0805A554: .4byte 0x000001E3
_0805A558:
	cmp r0, #7
	bne _0805A574
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #2
	bl SpriteSpawnSecondary
	b _0805A58E
_0805A574:
	cmp r0, #0xb
	bne _0805A58E
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r7, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #4
	bl SpriteSpawnSecondary
_0805A58E:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyPartInit
RidleyPartInit: @ 0x0805A598
	push {r4, lr}
	ldr r2, _0805A5CC @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _0805A5D0 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	strh r0, [r2]
	ldr r0, _0805A5D4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r3, #3
	adds r0, r3, #0
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	ldrb r1, [r2, #0x1e]
	cmp r1, #1
	beq _0805A5F4
	cmp r1, #1
	bgt _0805A5D8
	cmp r1, #0
	beq _0805A5DE
	b _0805A658
	.align 2, 0
_0805A5CC: .4byte gCurrentSprite
_0805A5D0: .4byte 0x0000FFFB
_0805A5D4: .4byte gIoRegisters
_0805A5D8:
	cmp r1, #3
	beq _0805A624
	b _0805A658
_0805A5DE:
	adds r0, r2, #0
	adds r0, #0x22
	strb r3, [r0]
	adds r0, #5
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _0805A640
_0805A5F4:
	adds r0, r2, #0
	adds r0, #0x27
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805A620 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x25
	strb r4, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	b _0805A65A
	.align 2, 0
_0805A620: .4byte 0x0000FFFC
_0805A624:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x20
	strb r0, [r1]
_0805A640:
	ldr r1, _0805A654 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x25
	strb r4, [r0]
	b _0805A65C
	.align 2, 0
_0805A654: .4byte 0x0000FFFC
_0805A658:
	movs r0, #0
_0805A65A:
	strh r0, [r2]
_0805A65C:
	bl RidleySyncSubSprites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyPartIdle
RidleyPartIdle: @ 0x0805A668
	push {lr}
	ldr r2, _0805A69C @ =gCurrentSprite
	ldrh r0, [r2, #0x16]
	ldr r1, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xf0
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	cmp r0, r1
	bne _0805A6A0
	adds r1, r2, #0
	adds r1, #0x35
	movs r0, #0
	strb r0, [r1]
	adds r3, r2, #0
	adds r3, #0x27
	movs r1, #0x40
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x28
	b _0805A6B2
	.align 2, 0
_0805A69C: .4byte gCurrentSprite
_0805A6A0:
	adds r1, r2, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0xe
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x38
_0805A6B2:
	strb r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start RidleyTailPartInit
RidleyTailPartInit: @ 0x0805A6B8
	push {r4, r5, r6, lr}
	ldr r3, _0805A73C @ =gCurrentSprite
	ldrh r0, [r3]
	ldr r4, _0805A740 @ =0x0000FFFB
	ands r4, r0
	movs r5, #0
	movs r6, #0
	strh r4, [r3]
	ldr r0, _0805A744 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r3, #0x14]
	ldrb r1, [r3, #0x1e]
	adds r0, r1, #4
	subs r2, #0x12
	strb r0, [r2]
	adds r2, #3
	movs r0, #0x18
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #7
	bne _0805A754
	ldr r0, _0805A748 @ =gSubSpriteData2
	ldr r1, _0805A74C @ =sRidleyMultiSpriteData_3a9b1c
	str r1, [r0]
	strb r5, [r0, #6]
	strh r6, [r0, #4]
	movs r1, #8
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	adds r0, r3, #0
	adds r0, #0x2b
	strb r5, [r0]
	strh r6, [r3, #6]
	ldr r1, _0805A750 @ =0x0000FFE4
	strh r1, [r3, #0xa]
	movs r0, #0x1c
	b _0805A75A
	.align 2, 0
_0805A73C: .4byte gCurrentSprite
_0805A740: .4byte 0x0000FFFB
_0805A744: .4byte gIoRegisters
_0805A748: .4byte gSubSpriteData2
_0805A74C: .4byte sRidleyMultiSpriteData_3a9b1c
_0805A750: .4byte 0x0000FFE4
_0805A754:
	ldr r1, _0805A768 @ =0x0000FFEC
	strh r1, [r3, #0xa]
	movs r0, #0x14
_0805A75A:
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A768: .4byte 0x0000FFEC

	thumb_func_start RidleyTailPartHandleRotation
RidleyTailPartHandleRotation: @ 0x0805A76C
	push {r4, lr}
	ldr r1, _0805A790 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _0805A79C
	adds r3, r1, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0xe0
	bne _0805A798
	ldr r0, _0805A794 @ =0x0000FBFF
	ands r0, r2
	strh r0, [r1]
	b _0805A7B2
	.align 2, 0
_0805A790: .4byte gCurrentSprite
_0805A794: .4byte 0x0000FBFF
_0805A798:
	subs r0, #1
	b _0805A7B0
_0805A79C:
	adds r3, r1, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0x20
	bne _0805A7AE
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r1]
	b _0805A7B2
_0805A7AE:
	adds r0, #1
_0805A7B0:
	strb r0, [r3]
_0805A7B2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyTailPartIdle
RidleyTailPartIdle: @ 0x0805A7B8
	push {r4, lr}
	ldr r0, _0805A818 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r4, [r0]
	bl RidleyTailPartHandleRotation
	ldr r0, _0805A81C @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _0805A820 @ =sRidleyMultiSpriteData_3a9a14
	cmp r1, r0
	beq _0805A7E2
	ldr r2, _0805A824 @ =gSubSpriteData2
	ldr r1, [r2]
	ldr r0, _0805A828 @ =sRidleyMultiSpriteData_3a9b9c
	cmp r1, r0
	bne _0805A7E2
	ldr r0, _0805A82C @ =sRidleyMultiSpriteData_3a9b1c
	str r0, [r2]
	movs r0, #0
	strb r0, [r2, #6]
	strh r0, [r2, #4]
_0805A7E2:
	ldr r0, _0805A830 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x29
	bne _0805A810
	ldr r2, _0805A818 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x38
	strb r0, [r1]
	ldr r1, _0805A824 @ =gSubSpriteData2
	ldr r0, _0805A834 @ =sRidleyMultiSpriteData_3a9c1c
	str r0, [r1]
	strb r3, [r1, #6]
	movs r0, #0
	strh r3, [r1, #4]
	adds r2, #0x2b
	strb r0, [r2]
_0805A810:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A818: .4byte gCurrentSprite
_0805A81C: .4byte gSubSpriteData1
_0805A820: .4byte sRidleyMultiSpriteData_3a9a14
_0805A824: .4byte gSubSpriteData2
_0805A828: .4byte sRidleyMultiSpriteData_3a9b9c
_0805A82C: .4byte sRidleyMultiSpriteData_3a9b1c
_0805A830: .4byte gSpriteData
_0805A834: .4byte sRidleyMultiSpriteData_3a9c1c

	thumb_func_start RidleyTailPartWaitingTOWindUp
RidleyTailPartWaitingTOWindUp: @ 0x0805A838
	push {lr}
	bl SpriteUtilCheckEndSubSpriteData2Anim
	cmp r0, #0
	beq _0805A856
	ldr r1, _0805A85C @ =gSubSpriteData2
	ldr r0, _0805A860 @ =sRidleyMultiSpriteData_3a9c74
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A864 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3a
	strb r1, [r0]
_0805A856:
	pop {r0}
	bx r0
	.align 2, 0
_0805A85C: .4byte gSubSpriteData2
_0805A860: .4byte sRidleyMultiSpriteData_3a9c74
_0805A864: .4byte gCurrentSprite

	thumb_func_start RidleyTailPartWindingUp1
RidleyTailPartWindingUp1: @ 0x0805A868
	push {r4, lr}
	ldr r4, _0805A8BC @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805A8C0 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805A8C4 @ =0x00010003
	cmp r0, r1
	bne _0805A87E
	ldr r0, _0805A8C8 @ =0x000001E5
	bl SoundPlay
_0805A87E:
	bl SpriteUtilCheckEndSubSpriteData2Anim
	cmp r0, #0
	beq _0805A8A6
	ldr r0, _0805A8CC @ =sRidleyMultiSpriteData_3a9cdc
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	ldr r1, _0805A8D0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3c
	strb r0, [r2]
	ldr r0, _0805A8D4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #1
	adds r0, #2
	adds r1, #0x2e
	strb r0, [r1]
_0805A8A6:
	ldr r2, _0805A8D8 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805A8DC @ =0x0000027F
	cmp r1, r0
	bls _0805A8B4
	subs r0, r1, #2
	strh r0, [r2, #8]
_0805A8B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A8BC: .4byte gSubSpriteData2
_0805A8C0: .4byte 0x00FFFFFF
_0805A8C4: .4byte 0x00010003
_0805A8C8: .4byte 0x000001E5
_0805A8CC: .4byte sRidleyMultiSpriteData_3a9cdc
_0805A8D0: .4byte gCurrentSprite
_0805A8D4: .4byte gSpriteRandomNumber
_0805A8D8: .4byte gSubSpriteData1
_0805A8DC: .4byte 0x0000027F

	thumb_func_start RidleyTailPartWindingUp2
RidleyTailPartWindingUp2: @ 0x0805A8E0
	push {r4, r5, r6, lr}
	ldr r0, _0805A940 @ =gSubSpriteData2
	ldr r0, [r0, #4]
	ldr r1, _0805A944 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805A948 @ =0x00010003
	cmp r0, r1
	bne _0805A8F6
	ldr r0, _0805A94C @ =0x000001E5
	bl SoundPlay
_0805A8F6:
	ldr r5, _0805A950 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r4, [r0]
	movs r6, #0
	bl SpriteUtilCheckEndSubSpriteData2Anim
	cmp r0, #0
	bne _0805A90A
	b _0805A9FC
_0805A90A:
	ldr r1, _0805A954 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x19
	strb r0, [r1]
	ldrh r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0805A970
	ldr r0, _0805A958 @ =gSubSpriteData1
	ldr r1, _0805A95C @ =gSamusData
	ldrh r0, [r0, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0805A964
	ldr r0, _0805A960 @ =0x0000FDFF
	ands r0, r2
	b _0805A998
	.align 2, 0
_0805A940: .4byte gSubSpriteData2
_0805A944: .4byte 0x00FFFFFF
_0805A948: .4byte 0x00010003
_0805A94C: .4byte 0x000001E5
_0805A950: .4byte gCurrentSprite
_0805A954: .4byte gSpriteData
_0805A958: .4byte gSubSpriteData1
_0805A95C: .4byte gSamusData
_0805A960: .4byte 0x0000FDFF
_0805A964:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r3]
	b _0805A99E
_0805A970:
	ldr r0, _0805A984 @ =gSubSpriteData1
	ldr r1, _0805A988 @ =gSamusData
	ldrh r0, [r0, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0805A990
	ldr r0, _0805A98C @ =0x0000FDFF
	ands r0, r2
	strh r0, [r3]
	b _0805A99E
	.align 2, 0
_0805A984: .4byte gSubSpriteData1
_0805A988: .4byte gSamusData
_0805A98C: .4byte 0x0000FDFF
_0805A990:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r0, r2
_0805A998:
	strh r0, [r3]
	cmp r6, #0
	beq _0805A9C0
_0805A99E:
	ldr r1, _0805A9B4 @ =gSubSpriteData2
	ldr r0, _0805A9B8 @ =sRidleyMultiSpriteData_3a9d44
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A9BC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x44
	strb r1, [r0]
	b _0805A9FC
	.align 2, 0
_0805A9B4: .4byte gSubSpriteData2
_0805A9B8: .4byte sRidleyMultiSpriteData_3a9d44
_0805A9BC: .4byte gCurrentSprite
_0805A9C0:
	ldr r0, _0805A9E8 @ =gSubSpriteData2
	ldr r1, _0805A9EC @ =sRidleyMultiSpriteData_3a9df4
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	ldr r2, _0805A9F0 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3e
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A9F4
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0xe0
	b _0805A9FA
	.align 2, 0
_0805A9E8: .4byte gSubSpriteData2
_0805A9EC: .4byte sRidleyMultiSpriteData_3a9df4
_0805A9F0: .4byte gCurrentSprite
_0805A9F4:
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0x20
_0805A9FA:
	strb r0, [r1]
_0805A9FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyTailPartStrikingDown1
RidleyTailPartStrikingDown1: @ 0x0805AA04
	push {r4, lr}
	ldr r4, _0805AA38 @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805AA3C @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805AA40 @ =0x00010003
	cmp r0, r1
	bne _0805AA1A
	ldr r0, _0805AA44 @ =0x000001E7
	bl SoundPlay
_0805AA1A:
	bl SpriteUtilCheckEndSubSpriteData2Anim
	cmp r0, #0
	beq _0805AA50
	ldr r0, _0805AA48 @ =sRidleyMultiSpriteData_3a9e64
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	ldr r0, _0805AA4C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x40
	strb r1, [r0]
	b _0805AA78
	.align 2, 0
_0805AA38: .4byte gSubSpriteData2
_0805AA3C: .4byte 0x00FFFFFF
_0805AA40: .4byte 0x00010003
_0805AA44: .4byte 0x000001E7
_0805AA48: .4byte sRidleyMultiSpriteData_3a9e64
_0805AA4C: .4byte gCurrentSprite
_0805AA50:
	ldrh r0, [r4, #4]
	cmp r0, #7
	bhi _0805AA5E
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AA6E
_0805AA5E:
	ldr r2, _0805AA80 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AA84 @ =0x0000027F
	cmp r1, r0
	bls _0805AA6E
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AA6E:
	movs r0, #2
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AA78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA80: .4byte gSubSpriteData1
_0805AA84: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingDown2
RidleyTailPartStrikingDown2: @ 0x0805AA88
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805AB10 @ =gSubSpriteData2
	ldr r0, [r0, #4]
	ldr r1, _0805AB14 @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _0805AAA0
	ldr r0, _0805AB18 @ =0x000001E7
	bl SoundPlay
_0805AAA0:
	movs r5, #0
	ldr r6, _0805AB1C @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl SpriteUtilCheckEndSubSpriteData2Anim
	cmp r0, #0
	beq _0805AB5C
	ldr r0, _0805AB20 @ =gSamusData
	ldr r1, _0805AB24 @ =gSubSpriteData1
	ldrh r2, [r0, #0x18]
	adds r7, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #8]
	cmp r2, r0
	blo _0805AAD4
	ldr r0, _0805AB28 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _0805AADC
_0805AAD4:
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
_0805AADC:
	ldr r1, _0805AB1C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #0
	beq _0805AB34
	ldr r1, _0805AB28 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AB2C
	ldrh r0, [r3, #0xa]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bls _0805AB3A
	b _0805AB34
	.align 2, 0
_0805AB10: .4byte gSubSpriteData2
_0805AB14: .4byte 0x00FFFFFF
_0805AB18: .4byte 0x000001E7
_0805AB1C: .4byte gCurrentSprite
_0805AB20: .4byte gSamusData
_0805AB24: .4byte gSubSpriteData1
_0805AB28: .4byte gSpriteData
_0805AB2C:
	ldrh r0, [r3, #0xa]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bhs _0805AB3A
_0805AB34:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0805AB3A:
	cmp r5, #0
	beq _0805AB5C
	ldr r1, _0805AB54 @ =gSubSpriteData2
	ldr r0, _0805AB58 @ =sRidleyMultiSpriteData_3a9ebc
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x42
	strb r0, [r1]
	b _0805AB8A
	.align 2, 0
_0805AB54: .4byte gSubSpriteData2
_0805AB58: .4byte sRidleyMultiSpriteData_3a9ebc
_0805AB5C:
	ldr r0, _0805AB6C @ =gSubSpriteData2
	ldrh r0, [r0, #4]
	cmp r0, #4
	bhi _0805AB70
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AB80
	.align 2, 0
_0805AB6C: .4byte gSubSpriteData2
_0805AB70:
	ldr r2, _0805AB90 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AB94 @ =0x0000027F
	cmp r1, r0
	bls _0805AB80
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AB80:
	movs r0, #4
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AB8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB90: .4byte gSubSpriteData1
_0805AB94: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingDown3
RidleyTailPartStrikingDown3: @ 0x0805AB98
	push {r4, lr}
	ldr r4, _0805ABD8 @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805ABDC @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _0805ABB0
	ldr r0, _0805ABE0 @ =0x000001E7
	bl SoundPlay
_0805ABB0:
	bl SpriteUtilCheckEndSubSpriteData2Anim
	cmp r0, #0
	beq _0805AC08
	ldr r2, _0805ABE4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	cmp r1, #0
	beq _0805ABEC
	ldr r0, _0805ABE8 @ =sRidleyMultiSpriteData_3a9cdc
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	b _0805AC30
	.align 2, 0
_0805ABD8: .4byte gSubSpriteData2
_0805ABDC: .4byte 0x00FFFFFF
_0805ABE0: .4byte 0x000001E7
_0805ABE4: .4byte gCurrentSprite
_0805ABE8: .4byte sRidleyMultiSpriteData_3a9cdc
_0805ABEC:
	ldr r0, _0805AC04 @ =sRidleyMultiSpriteData_3a9f44
	str r0, [r4]
	strb r1, [r4, #6]
	strh r1, [r4, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	b _0805AC30
	.align 2, 0
_0805AC04: .4byte sRidleyMultiSpriteData_3a9f44
_0805AC08:
	ldrh r0, [r4, #4]
	cmp r0, #4
	bhi _0805AC16
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AC26
_0805AC16:
	ldr r2, _0805AC38 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AC3C @ =0x0000027F
	cmp r1, r0
	bls _0805AC26
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AC26:
	movs r0, #2
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AC30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AC38: .4byte gSubSpriteData1
_0805AC3C: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingForward
RidleyTailPartStrikingForward: @ 0x0805AC40
	push {r4, r5, r6, lr}
	ldr r6, _0805ACBC @ =gSubSpriteData2
	ldr r0, [r6, #4]
	ldr r1, _0805ACC0 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805ACC4 @ =0x00010003
	cmp r0, r1
	bne _0805AC58
	movs r0, #0xf3
	lsls r0, r0, #1
	bl SoundPlay
_0805AC58:
	ldr r5, _0805ACC8 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl SpriteUtilCheckEndSubSpriteData2Anim
	cmp r0, #0
	beq _0805ACF8
	ldr r0, _0805ACCC @ =gSamusData
	ldr r1, _0805ACD0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x18]
	ldrh r1, [r1, #8]
	cmp r0, r1
	blo _0805AC86
	ldr r0, _0805ACD4 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _0805AC8E
_0805AC86:
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
_0805AC8E:
	ldr r2, _0805ACC8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	movs r3, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805ACDC
	ldr r0, _0805ACBC @ =gSubSpriteData2
	ldr r1, _0805ACD8 @ =sRidleyMultiSpriteData_3a9f44
	str r1, [r0]
	strb r3, [r0, #6]
	strh r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	b _0805AD34
	.align 2, 0
_0805ACBC: .4byte gSubSpriteData2
_0805ACC0: .4byte 0x00FFFFFF
_0805ACC4: .4byte 0x00010003
_0805ACC8: .4byte gCurrentSprite
_0805ACCC: .4byte gSamusData
_0805ACD0: .4byte gSubSpriteData1
_0805ACD4: .4byte gSpriteData
_0805ACD8: .4byte sRidleyMultiSpriteData_3a9f44
_0805ACDC:
	ldr r0, _0805ACF0 @ =gSubSpriteData2
	ldr r1, _0805ACF4 @ =sRidleyMultiSpriteData_3a9cdc
	str r1, [r0]
	strb r3, [r0, #6]
	strh r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	b _0805AD34
	.align 2, 0
_0805ACF0: .4byte gSubSpriteData2
_0805ACF4: .4byte sRidleyMultiSpriteData_3a9cdc
_0805ACF8:
	ldrh r0, [r6, #4]
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _0805AD28
	ldr r1, _0805AD1C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805AD24
	ldr r0, _0805AD20 @ =sRidleyPartOam_3af4b8
	b _0805AD26
	.align 2, 0
_0805AD1C: .4byte gSpriteData
_0805AD20: .4byte sRidleyPartOam_3af4b8
_0805AD24:
	ldr r0, _0805AD3C @ =sRidleyPartOam_3af800
_0805AD26:
	str r0, [r5, #0x18]
_0805AD28:
	movs r0, #4
	bl RidleyTailStrikeYMovement
	movs r0, #1
	bl RidleyTailXMovement
_0805AD34:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AD3C: .4byte sRidleyPartOam_3af800

	thumb_func_start RidleyTailPartDoneStriking
RidleyTailPartDoneStriking: @ 0x0805AD40
	push {r4, r5, r6, lr}
	ldr r6, _0805ADB0 @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl SpriteUtilCheckEndSubSpriteData2Anim
	cmp r0, #0
	beq _0805ADCA
	ldr r1, _0805ADB4 @ =gSubSpriteData2
	ldr r0, _0805ADB8 @ =sRidleyMultiSpriteData_3a9b1c
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r5, #0
	strh r0, [r1, #4]
	adds r0, r6, #0
	adds r0, #0x24
	movs r2, #2
	strb r2, [r0]
	ldr r1, _0805ADBC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, #0xb
	strb r5, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r5, [r0]
	adds r0, #3
	strb r1, [r0]
	ldr r0, _0805ADC0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, r3, #0
	adds r1, #0x2b
	strb r0, [r1]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805ADC4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	b _0805ADC8
	.align 2, 0
_0805ADB0: .4byte gCurrentSprite
_0805ADB4: .4byte gSubSpriteData2
_0805ADB8: .4byte sRidleyMultiSpriteData_3a9b1c
_0805ADBC: .4byte gSpriteData
_0805ADC0: .4byte gSpriteRandomNumber
_0805ADC4:
	ldr r0, _0805ADD0 @ =0x0000FDFF
	ands r0, r1
_0805ADC8:
	strh r0, [r3]
_0805ADCA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADD0: .4byte 0x0000FDFF

	thumb_func_start RidleyFireInit
RidleyFireInit: @ 0x0805ADD4
	push {r4, r5, r6, lr}
	ldr r0, _0805AE68 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r4, _0805AE6C @ =0x0000FFFB
	ands r4, r0
	movs r5, #0
	movs r3, #0
	movs r0, #0x80
	orrs r4, r0
	orrs r4, r5
	mov r1, ip
	strh r4, [r1]
	ldr r0, _0805AE70 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	adds r0, #5
	movs r1, #0xc
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805AE74 @ =0x0000FFE0
	mov r6, ip
	strh r1, [r6, #0xa]
	movs r0, #0x20
	strh r0, [r6, #0xc]
	strh r1, [r6, #0xe]
	strh r0, [r6, #0x10]
	ldr r0, _0805AE78 @ =sRidleyPartOam_3af7f0
	str r0, [r6, #0x18]
	strb r5, [r6, #0x1c]
	strh r3, [r6, #0x16]
	mov r0, ip
	adds r0, #0x2b
	strb r5, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x12]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x30
	strb r5, [r0]
	subs r0, #0xc
	strb r2, [r0]
	subs r1, #9
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0805AE7C @ =gSamusData
	ldrh r0, [r6, #2]
	ldrh r1, [r1, #0x18]
	cmp r0, r1
	bhs _0805AE60
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r4, r0
	strh r4, [r6]
_0805AE60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE68: .4byte gCurrentSprite
_0805AE6C: .4byte 0x0000FFFB
_0805AE70: .4byte gIoRegisters
_0805AE74: .4byte 0x0000FFE0
_0805AE78: .4byte sRidleyPartOam_3af7f0
_0805AE7C: .4byte gSamusData

	thumb_func_start RidleyFireMoving
RidleyFireMoving: @ 0x0805AE80
	push {r4, lr}
	ldr r3, _0805AEA8 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r2, r3, #0
	cmp r0, #0
	beq _0805AEAC
	ldrh r0, [r2, #4]
	adds r0, r4, r0
	b _0805AEB0
	.align 2, 0
_0805AEA8: .4byte gCurrentSprite
_0805AEAC:
	ldrh r0, [r2, #4]
	subs r0, r0, r4
_0805AEB0:
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	ldrb r1, [r2, #0x1e]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AED0
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #0x20
	b _0805AED8
_0805AED0:
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
_0805AED8:
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805AF06
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	strb r3, [r4]
	adds r0, #1
	strb r1, [r0]
_0805AF06:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyFireMovingTowardsSamus
RidleyFireMovingTowardsSamus: @ 0x0805AF0C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0805AF60 @ =gCurrentSprite
	ldrb r0, [r0, #0x1e]
	movs r2, #8
	cmp r0, #4
	beq _0805AF2E
	movs r2, #0x28
	cmp r0, #3
	beq _0805AF2E
	movs r2, #0x48
	cmp r0, #2
	beq _0805AF2E
	movs r2, #0x82
	cmp r0, #1
	bne _0805AF2E
	movs r2, #0x68
_0805AF2E:
	ldr r1, _0805AF64 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0x20
	movs r3, #0x28
	bl SpriteUtilMoveRidleyFireball
	ldr r2, _0805AF60 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AF68
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #0x20
	b _0805AF70
	.align 2, 0
_0805AF60: .4byte gCurrentSprite
_0805AF64: .4byte gSamusData
_0805AF68:
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
_0805AF70:
	strb r0, [r1]
	ldr r4, _0805AF94 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805AF98 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805AF8C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_0805AF8C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AF94: .4byte gCurrentSprite
_0805AF98: .4byte gPreviousCollisionCheck

	thumb_func_start RidleyFireExploding
RidleyFireExploding: @ 0x0805AF9C
	push {lr}
	ldr r1, _0805AFBC @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x25
	bl ParticleSet
	movs r0, #0xf2
	lsls r0, r0, #1
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805AFBC: .4byte gCurrentSprite

	thumb_func_start Ridley
Ridley: @ 0x0805AFC0
	push {lr}
	bl RidleyWaveBeamCollsiion
	bl RidleySamusGrabbed
	bl RidleyUpdateHealthThreshold
	ldr r0, _0805AFE8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x59
	bls _0805AFDC
	b _0805B1B8
_0805AFDC:
	lsls r0, r0, #2
	ldr r1, _0805AFEC @ =_0805AFF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AFE8: .4byte gCurrentSprite
_0805AFEC: .4byte _0805AFF0
_0805AFF0: @ jump table
	.4byte _0805B180 @ case 0
	.4byte _0805B184 @ case 1
	.4byte _0805B194 @ case 2
	.4byte _0805B198 @ case 3
	.4byte _0805B19E @ case 4
	.4byte _0805B1B8 @ case 5
	.4byte _0805B1B8 @ case 6
	.4byte _0805B1B8 @ case 7
	.4byte _0805B18A @ case 8
	.4byte _0805B18E @ case 9
	.4byte _0805B1B8 @ case 10
	.4byte _0805B1B8 @ case 11
	.4byte _0805B1B8 @ case 12
	.4byte _0805B1B8 @ case 13
	.4byte _0805B1B8 @ case 14
	.4byte _0805B1B8 @ case 15
	.4byte _0805B1B8 @ case 16
	.4byte _0805B1B8 @ case 17
	.4byte _0805B1B8 @ case 18
	.4byte _0805B1B8 @ case 19
	.4byte _0805B1B8 @ case 20
	.4byte _0805B1B8 @ case 21
	.4byte _0805B1B8 @ case 22
	.4byte _0805B164 @ case 23
	.4byte _0805B1B8 @ case 24
	.4byte _0805B16A @ case 25
	.4byte _0805B1B8 @ case 26
	.4byte _0805B1B8 @ case 27
	.4byte _0805B1B8 @ case 28
	.4byte _0805B1B8 @ case 29
	.4byte _0805B170 @ case 30
	.4byte _0805B174 @ case 31
	.4byte _0805B1B8 @ case 32
	.4byte _0805B1B8 @ case 33
	.4byte _0805B1B8 @ case 34
	.4byte _0805B1B8 @ case 35
	.4byte _0805B1B8 @ case 36
	.4byte _0805B1B8 @ case 37
	.4byte _0805B1B8 @ case 38
	.4byte _0805B1B8 @ case 39
	.4byte _0805B1A4 @ case 40
	.4byte _0805B1AA @ case 41
	.4byte _0805B1B8 @ case 42
	.4byte _0805B1B8 @ case 43
	.4byte _0805B1B8 @ case 44
	.4byte _0805B1B8 @ case 45
	.4byte _0805B1B0 @ case 46
	.4byte _0805B1B4 @ case 47
	.4byte _0805B1B8 @ case 48
	.4byte _0805B1B8 @ case 49
	.4byte _0805B1B8 @ case 50
	.4byte _0805B1B8 @ case 51
	.4byte _0805B1B8 @ case 52
	.4byte _0805B1B8 @ case 53
	.4byte _0805B1B8 @ case 54
	.4byte _0805B17A @ case 55
	.4byte _0805B1B8 @ case 56
	.4byte _0805B1B8 @ case 57
	.4byte _0805B1B8 @ case 58
	.4byte _0805B1B8 @ case 59
	.4byte _0805B1B8 @ case 60
	.4byte _0805B1B8 @ case 61
	.4byte _0805B1B8 @ case 62
	.4byte _0805B1B8 @ case 63
	.4byte _0805B1B8 @ case 64
	.4byte _0805B1B8 @ case 65
	.4byte _0805B1B8 @ case 66
	.4byte _0805B1B8 @ case 67
	.4byte _0805B1B8 @ case 68
	.4byte _0805B1B8 @ case 69
	.4byte _0805B1B8 @ case 70
	.4byte _0805B1B8 @ case 71
	.4byte _0805B1B8 @ case 72
	.4byte _0805B1B8 @ case 73
	.4byte _0805B1B8 @ case 74
	.4byte _0805B1B8 @ case 75
	.4byte _0805B1B8 @ case 76
	.4byte _0805B1B8 @ case 77
	.4byte _0805B1B8 @ case 78
	.4byte _0805B1B8 @ case 79
	.4byte _0805B1B8 @ case 80
	.4byte _0805B1B8 @ case 81
	.4byte _0805B1B8 @ case 82
	.4byte _0805B1B8 @ case 83
	.4byte _0805B1B8 @ case 84
	.4byte _0805B1B8 @ case 85
	.4byte _0805B1B8 @ case 86
	.4byte _0805B1B8 @ case 87
	.4byte _0805B158 @ case 88
	.4byte _0805B15E @ case 89
_0805B158:
	bl RidleyInit
	b _0805B1B8
_0805B15E:
	bl RidleyForming
	b _0805B1B8
_0805B164:
	bl RidleyScreamingAfterSpawn
	b _0805B1B8
_0805B16A:
	bl RidleyRisingAfterSpawn
	b _0805B1B8
_0805B170:
	bl RidleyScreamingInit
_0805B174:
	bl RidleyScreaming
	b _0805B1B8
_0805B17A:
	bl RidleyTurningIntoCoreX
	b _0805B1B8
_0805B180:
	bl RidleyIdleInit
_0805B184:
	bl RidleyIdle
	b _0805B1B8
_0805B18A:
	bl RidleyFlyingBackwardsInit
_0805B18E:
	bl RidleyFlyingBackwards
	b _0805B1B8
_0805B194:
	bl RidleyTurningAroundInit
_0805B198:
	bl RidleyTurningAround
	b _0805B1B8
_0805B19E:
	bl RidleyTurningAroundSecondPart
	b _0805B1B8
_0805B1A4:
	bl RidleyPreparingTailAttack
	b _0805B1B8
_0805B1AA:
	bl RidleyTailAttack
	b _0805B1B8
_0805B1B0:
	bl RidleyShootingFireInit
_0805B1B4:
	bl RidleyShootingFire
_0805B1B8:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl RidleySyncSubSprites
	bl RidleySetBackgroundPriority
	bl RidleyUpdatePalette
	pop {r0}
	bx r0

	thumb_func_start RidleyPart
RidleyPart: @ 0x0805B1CC
	push {r4, r5, r6, lr}
	ldr r0, _0805B1E8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r5, [r1]
	adds r1, #1
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	bne _0805B1EC
	bl RidleyPartInit
	b _0805B2B6
	.align 2, 0
_0805B1E8: .4byte gCurrentSprite
_0805B1EC:
	ldr r2, _0805B20C @ =gSpriteData
	lsls r3, r5, #3
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	adds r6, r3, #0
	cmp r0, #0
	beq _0805B210
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	b _0805B216
	.align 2, 0
_0805B20C: .4byte gSpriteData
_0805B210:
	ldrh r1, [r4]
	ldr r0, _0805B23C @ =0x0000FFBF
	ands r0, r1
_0805B216:
	strh r0, [r4]
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805B240
	ldrh r0, [r4]
	movs r1, #0x20
	orrs r1, r0
	strh r1, [r4]
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x49
	bne _0805B248
	movs r0, #0
	strh r0, [r4]
	b _0805B2B6
	.align 2, 0
_0805B23C: .4byte 0x0000FFBF
_0805B240:
	ldrh r1, [r4]
	ldr r0, _0805B280 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r4]
_0805B248:
	bl RidleySyncSubSprites
	ldr r4, _0805B284 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0805B2B6
	bl RidleyPartIdle
	ldr r1, _0805B288 @ =gSpriteData
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r3, [r0]
	cmp r3, #0
	beq _0805B28C
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	movs r1, #0xd
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _0805B292
	.align 2, 0
_0805B280: .4byte 0x0000FFDF
_0805B284: .4byte gCurrentSprite
_0805B288: .4byte gSpriteData
_0805B28C:
	adds r0, r4, #0
	adds r0, #0x20
	strb r3, [r0]
_0805B292:
	ldr r1, _0805B2BC @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	bne _0805B2B6
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0805B2B6
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0805B2B6
	ldr r1, [r1, #0x18]
	ldr r0, _0805B2C0 @ =sRidleyPartOam_3af648
	cmp r1, r0
	beq _0805B2B6
	movs r0, #0xf1
	lsls r0, r0, #1
	bl SoundPlay
_0805B2B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B2BC: .4byte gCurrentSprite
_0805B2C0: .4byte sRidleyPartOam_3af648

	thumb_func_start RidleyTailPart
RidleyTailPart: @ 0x0805B2C4
	push {r4, r5, r6, lr}
	ldr r3, _0805B2FC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r0]
	ldr r2, _0805B300 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r6, r0, r2
	ldrh r1, [r6]
	movs r0, #0x20
	ands r0, r1
	adds r4, r3, #0
	cmp r0, #0
	beq _0805B308
	ldrh r0, [r4]
	ldr r3, _0805B304 @ =0x00008020
	adds r1, r3, #0
	orrs r1, r0
	strh r1, [r4]
	ldrb r0, [r6, #0x1d]
	cmp r0, #0x49
	bne _0805B310
	movs r0, #0
	strh r0, [r4]
	b _0805B54A
	.align 2, 0
_0805B2FC: .4byte gCurrentSprite
_0805B300: .4byte gSpriteData
_0805B304: .4byte 0x00008020
_0805B308:
	ldrh r1, [r4]
	ldr r0, _0805B330 @ =0x00007FDF
	ands r0, r1
	strh r0, [r4]
_0805B310:
	ldrb r0, [r4, #0x1e]
	cmp r0, #7
	beq _0805B354
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805B334
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	b _0805B33A
	.align 2, 0
_0805B330: .4byte 0x00007FDF
_0805B334:
	ldrh r1, [r4]
	ldr r0, _0805B350 @ =0x0000FFBF
	ands r0, r1
_0805B33A:
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805B34A
	bl RidleyTailPartInit
_0805B34A:
	bl RidleyTailSyncSubSprites
	b _0805B54A
	.align 2, 0
_0805B350: .4byte 0x0000FFBF
_0805B354:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0805B384
	ldrh r1, [r4]
	movs r2, #0
	movs r3, #0
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
	ldr r0, _0805B380 @ =sRidleyPartOam_3af800
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	b _0805B396
	.align 2, 0
_0805B380: .4byte sRidleyPartOam_3af800
_0805B384:
	ldrh r1, [r4]
	ldr r0, _0805B3D0 @ =0x0000FFBF
	ands r0, r1
	movs r1, #0
	strh r0, [r4]
	ldr r0, _0805B3D4 @ =sRidleyPartOam_3af4b8
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r2, [r4, #0x16]
_0805B396:
	ldr r0, _0805B3D8 @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _0805B3DC @ =sRidleyMultiSpriteData_3a9a14
	cmp r1, r0
	bne _0805B3BA
	ldr r1, _0805B3E0 @ =gSubSpriteData2
	ldr r0, [r1]
	ldr r2, _0805B3E4 @ =sRidleyMultiSpriteData_3a9b9c
	cmp r0, r2
	beq _0805B3BA
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
_0805B3BA:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x46
	bls _0805B3C6
	b _0805B542
_0805B3C6:
	lsls r0, r0, #2
	ldr r1, _0805B3E8 @ =_0805B3EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B3D0: .4byte 0x0000FFBF
_0805B3D4: .4byte sRidleyPartOam_3af4b8
_0805B3D8: .4byte gSubSpriteData1
_0805B3DC: .4byte sRidleyMultiSpriteData_3a9a14
_0805B3E0: .4byte gSubSpriteData2
_0805B3E4: .4byte sRidleyMultiSpriteData_3a9b9c
_0805B3E8: .4byte _0805B3EC
_0805B3EC: @ jump table
	.4byte _0805B508 @ case 0
	.4byte _0805B542 @ case 1
	.4byte _0805B50E @ case 2
	.4byte _0805B542 @ case 3
	.4byte _0805B542 @ case 4
	.4byte _0805B542 @ case 5
	.4byte _0805B542 @ case 6
	.4byte _0805B542 @ case 7
	.4byte _0805B542 @ case 8
	.4byte _0805B542 @ case 9
	.4byte _0805B542 @ case 10
	.4byte _0805B542 @ case 11
	.4byte _0805B542 @ case 12
	.4byte _0805B542 @ case 13
	.4byte _0805B542 @ case 14
	.4byte _0805B542 @ case 15
	.4byte _0805B542 @ case 16
	.4byte _0805B542 @ case 17
	.4byte _0805B542 @ case 18
	.4byte _0805B542 @ case 19
	.4byte _0805B542 @ case 20
	.4byte _0805B542 @ case 21
	.4byte _0805B542 @ case 22
	.4byte _0805B542 @ case 23
	.4byte _0805B542 @ case 24
	.4byte _0805B542 @ case 25
	.4byte _0805B542 @ case 26
	.4byte _0805B542 @ case 27
	.4byte _0805B542 @ case 28
	.4byte _0805B542 @ case 29
	.4byte _0805B542 @ case 30
	.4byte _0805B542 @ case 31
	.4byte _0805B542 @ case 32
	.4byte _0805B542 @ case 33
	.4byte _0805B542 @ case 34
	.4byte _0805B542 @ case 35
	.4byte _0805B542 @ case 36
	.4byte _0805B542 @ case 37
	.4byte _0805B542 @ case 38
	.4byte _0805B542 @ case 39
	.4byte _0805B542 @ case 40
	.4byte _0805B542 @ case 41
	.4byte _0805B542 @ case 42
	.4byte _0805B542 @ case 43
	.4byte _0805B542 @ case 44
	.4byte _0805B542 @ case 45
	.4byte _0805B542 @ case 46
	.4byte _0805B542 @ case 47
	.4byte _0805B542 @ case 48
	.4byte _0805B542 @ case 49
	.4byte _0805B542 @ case 50
	.4byte _0805B542 @ case 51
	.4byte _0805B542 @ case 52
	.4byte _0805B542 @ case 53
	.4byte _0805B542 @ case 54
	.4byte _0805B542 @ case 55
	.4byte _0805B514 @ case 56
	.4byte _0805B542 @ case 57
	.4byte _0805B51A @ case 58
	.4byte _0805B542 @ case 59
	.4byte _0805B520 @ case 60
	.4byte _0805B542 @ case 61
	.4byte _0805B526 @ case 62
	.4byte _0805B542 @ case 63
	.4byte _0805B52C @ case 64
	.4byte _0805B542 @ case 65
	.4byte _0805B532 @ case 66
	.4byte _0805B542 @ case 67
	.4byte _0805B538 @ case 68
	.4byte _0805B542 @ case 69
	.4byte _0805B53E @ case 70
_0805B508:
	bl RidleyTailPartInit
	b _0805B542
_0805B50E:
	bl RidleyTailPartIdle
	b _0805B542
_0805B514:
	bl RidleyTailPartWaitingTOWindUp
	b _0805B542
_0805B51A:
	bl RidleyTailPartWindingUp1
	b _0805B542
_0805B520:
	bl RidleyTailPartWindingUp2
	b _0805B542
_0805B526:
	bl RidleyTailPartStrikingDown1
	b _0805B542
_0805B52C:
	bl RidleyTailPartStrikingDown2
	b _0805B542
_0805B532:
	bl RidleyTailPartStrikingDown3
	b _0805B542
_0805B538:
	bl RidleyTailPartStrikingForward
	b _0805B542
_0805B53E:
	bl RidleyTailPartDoneStriking
_0805B542:
	bl UpdateSubSpriteData2Animation
	bl RidleySyncSubSpritesPosition
_0805B54A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start RidleyFire
RidleyFire: @ 0x0805B550
	push {lr}
	ldr r0, _0805B568 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0805B57C
	cmp r0, #2
	bgt _0805B56C
	cmp r0, #0
	beq _0805B576
	b _0805B58C
	.align 2, 0
_0805B568: .4byte gCurrentSprite
_0805B56C:
	cmp r0, #0x18
	beq _0805B582
	cmp r0, #0x37
	beq _0805B588
	b _0805B58C
_0805B576:
	bl RidleyFireInit
	b _0805B58C
_0805B57C:
	bl RidleyFireMoving
	b _0805B58C
_0805B582:
	bl RidleyFireMovingTowardsSamus
	b _0805B58C
_0805B588:
	bl RidleyFireExploding
_0805B58C:
	pop {r0}
	bx r0

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
