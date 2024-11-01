    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start YardCheckShouldStartle
YardCheckShouldStartle: @ 0x0803C490
	push {lr}
	ldr r0, _0803C4B4 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C4D8
	ldr r1, _0803C4B8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x18
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C4C0
	ldr r0, _0803C4BC @ =sYardOam_355490
	b _0803C4C2
	.align 2, 0
_0803C4B4: .4byte gCurrentPowerBomb
_0803C4B8: .4byte gCurrentSprite
_0803C4BC: .4byte sYardOam_355490
_0803C4C0:
	ldr r0, _0803C4D4 @ =sYardOam_355370
_0803C4C2:
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x30
	movs r0, #0xb4
	strb r0, [r1]
	movs r0, #1
	b _0803C4DA
	.align 2, 0
_0803C4D4: .4byte sYardOam_355370
_0803C4D8:
	movs r0, #0
_0803C4DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YardCheckCollidingWithAir
YardCheckCollidingWithAir: @ 0x0803C4E0
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0803C514 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C540
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803C51C
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803C518 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0803C584
	.align 2, 0
_0803C514: .4byte gCurrentSprite
_0803C518: .4byte gPreviousCollisionCheck
_0803C51C:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803C53C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803C584
	.align 2, 0
_0803C53C: .4byte gPreviousCollisionCheck
_0803C540:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C56C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803C568 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	ldrh r0, [r4, #2]
	subs r0, #4
	b _0803C580
	.align 2, 0
_0803C568: .4byte gPreviousCollisionCheck
_0803C56C:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803C598 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	ldrh r0, [r4, #2]
_0803C580:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0803C584:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803C590
	movs r6, #1
_0803C590:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803C598: .4byte gPreviousCollisionCheck

	thumb_func_start YardUpdateHitbox
YardUpdateHitbox: @ 0x0803C59C
	push {lr}
	ldr r2, _0803C5D4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C630
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C5F8
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803C5E0
	ldr r0, _0803C5D8 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0803C5DC @ =0x0000FFC8
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803C69A
	.align 2, 0
_0803C5D4: .4byte gCurrentSprite
_0803C5D8: .4byte 0x0000FFE4
_0803C5DC: .4byte 0x0000FFC8
_0803C5E0:
	ldr r0, _0803C5F0 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0803C5F4 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x38
	b _0803C69A
	.align 2, 0
_0803C5F0: .4byte 0x0000FFE4
_0803C5F4: .4byte 0x0000FFF0
_0803C5F8:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C618
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x38
	strh r0, [r2, #0xc]
	ldr r0, _0803C614 @ =0x0000FFE4
	strh r0, [r2, #0xe]
	movs r0, #0x1c
	b _0803C69A
	.align 2, 0
_0803C614: .4byte 0x0000FFE4
_0803C618:
	ldr r0, _0803C628 @ =0x0000FFC8
	strh r0, [r2, #0xa]
	movs r0, #0x10
	strh r0, [r2, #0xc]
	ldr r0, _0803C62C @ =0x0000FFE4
	strh r0, [r2, #0xe]
	movs r0, #0x1c
	b _0803C69A
	.align 2, 0
_0803C628: .4byte 0x0000FFC8
_0803C62C: .4byte 0x0000FFE4
_0803C630:
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C678
	ldrh r1, [r2]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0803C660
	ldr r0, _0803C658 @ =0x0000FFE0
	strh r0, [r2, #0xa]
	movs r0, #0x20
	strh r0, [r2, #0xc]
	ldr r0, _0803C65C @ =0x0000FFC0
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803C69A
	.align 2, 0
_0803C658: .4byte 0x0000FFE0
_0803C65C: .4byte 0x0000FFC0
_0803C660:
	ldr r0, _0803C670 @ =0x0000FFE0
	strh r0, [r2, #0xa]
	movs r0, #0x20
	strh r0, [r2, #0xc]
	ldr r0, _0803C674 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	strh r3, [r2, #0x10]
	b _0803C69C
	.align 2, 0
_0803C670: .4byte 0x0000FFE0
_0803C674: .4byte 0x0000FFF0
_0803C678:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803C68C
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x40
	b _0803C692
_0803C68C:
	ldr r0, _0803C6A0 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r0, #0x10
_0803C692:
	strh r0, [r2, #0xc]
	ldr r0, _0803C6A4 @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x20
_0803C69A:
	strh r0, [r2, #0x10]
_0803C69C:
	pop {r0}
	bx r0
	.align 2, 0
_0803C6A0: .4byte 0x0000FFC0
_0803C6A4: .4byte 0x0000FFE0

	thumb_func_start YardSetCrawlingOam
YardSetCrawlingOam: @ 0x0803C6A8
	push {lr}
	ldr r2, _0803C6CC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	beq _0803C6DC
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C6D4
	ldr r0, _0803C6D0 @ =sYardOam_355540
	b _0803C6F2
	.align 2, 0
_0803C6CC: .4byte gCurrentSprite
_0803C6D0: .4byte sYardOam_355540
_0803C6D4:
	ldr r0, _0803C6D8 @ =sYardOam_355530
	b _0803C6F2
	.align 2, 0
_0803C6D8: .4byte sYardOam_355530
_0803C6DC:
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C6F0
	ldr r0, _0803C6EC @ =sYardOam_3553e8
	b _0803C6F2
	.align 2, 0
_0803C6EC: .4byte sYardOam_3553e8
_0803C6F0:
	ldr r0, _0803C700 @ =sYardOam_3552c8
_0803C6F2:
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C700: .4byte sYardOam_3552c8

	thumb_func_start YardSetTurningAroundOam
YardSetTurningAroundOam: @ 0x0803C704
	push {lr}
	ldr r0, _0803C718 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C720
	ldr r0, _0803C71C @ =sYardOam_3554c8
	b _0803C722
	.align 2, 0
_0803C718: .4byte gCurrentSprite
_0803C71C: .4byte sYardOam_3554c8
_0803C720:
	ldr r0, _0803C730 @ =sYardOam_3553a8
_0803C722:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C730: .4byte sYardOam_3553a8

	thumb_func_start YardSetTurningAroundSecondPartOam
YardSetTurningAroundSecondPartOam: @ 0x0803C734
	push {lr}
	ldr r0, _0803C748 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C750
	ldr r0, _0803C74C @ =sYardOam_3554e8
	b _0803C752
	.align 2, 0
_0803C748: .4byte gCurrentSprite
_0803C74C: .4byte sYardOam_3554e8
_0803C750:
	ldr r0, _0803C760 @ =sYardOam_3553c8
_0803C752:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C760: .4byte sYardOam_3553c8

	thumb_func_start YardSetChargingOam
YardSetChargingOam: @ 0x0803C764
	push {lr}
	ldr r0, _0803C778 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C780
	ldr r0, _0803C77C @ =sYardOam_355408
	b _0803C782
	.align 2, 0
_0803C778: .4byte gCurrentSprite
_0803C77C: .4byte sYardOam_355408
_0803C780:
	ldr r0, _0803C790 @ =sYardOam_3552e8
_0803C782:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C790: .4byte sYardOam_3552e8

	thumb_func_start YardSetShootingOam
YardSetShootingOam: @ 0x0803C794
	push {lr}
	ldr r0, _0803C7A8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C7B0
	ldr r0, _0803C7AC @ =sYardOam_355438
	b _0803C7B2
	.align 2, 0
_0803C7A8: .4byte gCurrentSprite
_0803C7AC: .4byte sYardOam_355438
_0803C7B0:
	ldr r0, _0803C7C0 @ =sYardOam_355318
_0803C7B2:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C7C0: .4byte sYardOam_355318

	thumb_func_start YardSetRecoilOam
YardSetRecoilOam: @ 0x0803C7C4
	push {lr}
	ldr r0, _0803C7D8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803C7E0
	ldr r0, _0803C7DC @ =sYardOam_355470
	b _0803C7E2
	.align 2, 0
_0803C7D8: .4byte gCurrentSprite
_0803C7DC: .4byte sYardOam_355470
_0803C7E0:
	ldr r0, _0803C7F0 @ =sYardOam_355350
_0803C7E2:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0803C7F0: .4byte sYardOam_355350

	thumb_func_start YardCheckShoot
YardCheckShoot: @ 0x0803C7F4
	push {r4, lr}
	ldr r1, _0803C808 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803C80C
	subs r0, #1
	strb r0, [r2]
	b _0803C866
	.align 2, 0
_0803C808: .4byte gCurrentSprite
_0803C80C:
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803C824
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r2, #0
	adds r1, r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehindY
	b _0803C830
_0803C824:
	movs r2, #0xa0
	lsls r2, r2, #2
	adds r0, r2, #0
	adds r1, r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
_0803C830:
	adds r1, r0, #0
	cmp r1, #3
	bne _0803C844
	ldr r0, _0803C840 @ =gCurrentSprite
	adds r0, #0x24
	strb r1, [r0]
	b _0803C866
	.align 2, 0
_0803C840: .4byte gCurrentSprite
_0803C844:
	cmp r1, #0xc
	bne _0803C866
	ldr r4, _0803C86C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bl YardSetChargingOam
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803C866
	ldr r0, _0803C870 @ =0x00000195
	bl SoundPlayNotAlreadyPlaying
_0803C866:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803C86C: .4byte gCurrentSprite
_0803C870: .4byte 0x00000195

	thumb_func_start YardCharging
YardCharging: @ 0x0803C874
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803C892
	ldr r0, _0803C898 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x2e
	movs r1, #0x1e
	strb r1, [r2]
	adds r0, #0x24
	movs r1, #0x2c
	strb r1, [r0]
	bl YardSetShootingOam
_0803C892:
	pop {r0}
	bx r0
	.align 2, 0
_0803C898: .4byte gCurrentSprite

	thumb_func_start YardShooting
YardShooting: @ 0x0803C89C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl YardCheckShouldStartle
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0803C8AE
	b _0803CA2C
_0803C8AE:
	ldr r1, _0803C8CC @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r2, r0, #1
	strb r2, [r3]
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _0803C8D0
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
	bl YardSetRecoilOam
	b _0803CA2C
	.align 2, 0
_0803C8CC: .4byte gCurrentSprite
_0803C8D0:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	beq _0803C8DA
	b _0803CA2C
_0803C8DA:
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	cmp r6, #0
	beq _0803C972
	ldrh r2, [r1]
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0803C930
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803C918
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x54
	str r0, [sp, #4]
	str r7, [sp, #8]
	b _0803C9F0
_0803C918:
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x40
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x54
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _0803C9A4
_0803C930:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803C95E
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x54
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3a
	movs r1, #3
	bl SpriteSpawnSecondary
	b _0803CA18
_0803C95E:
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x40
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x54
	b _0803C9C0
_0803C972:
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0803C9CE
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803C9AE
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x54
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	str r6, [sp, #8]
_0803C9A4:
	movs r0, #0x3a
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0803CA18
_0803C9AE:
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	adds r0, #0x54
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x40
_0803C9C0:
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x3a
	movs r1, #2
	bl SpriteSpawnSecondary
	b _0803CA18
_0803C9CE:
	movs r0, #0x40
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0803C9FA
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x54
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	str r5, [sp, #8]
_0803C9F0:
	movs r0, #0x3a
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0803CA18
_0803C9FA:
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x54
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x40
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x3a
	movs r1, #3
	bl SpriteSpawnSecondary
_0803CA18:
	ldr r0, _0803CA34 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CA2C
	movs r0, #0xcb
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803CA2C:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CA34: .4byte gCurrentSprite

	thumb_func_start YardRecoil
YardRecoil: @ 0x0803CA38
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803CA52
	ldr r1, _0803CA58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #3
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
_0803CA52:
	pop {r0}
	bx r0
	.align 2, 0
_0803CA58: .4byte gCurrentSprite

	thumb_func_start YardTurningIntoX
YardTurningIntoX: @ 0x0803CA5C
	push {lr}
	ldr r2, _0803CA7C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803CA88
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803CA80
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _0803CAA0
	.align 2, 0
_0803CA7C: .4byte gCurrentSprite
_0803CA80:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _0803CAA0
_0803CA88:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803CA9A
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _0803CA9E
_0803CA9A:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_0803CA9E:
	strh r0, [r2, #2]
_0803CAA0:
	pop {r0}
	bx r0

	thumb_func_start YardInit
YardInit: @ 0x0803CAA4
	push {r4, r5, r6, r7, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r4, _0803CAF0 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0x59
	bne _0803CB04
	ldrh r0, [r4]
	ldr r2, _0803CAF4 @ =0x0000FF7F
	ands r2, r0
	strh r2, [r4]
	movs r0, #0x5a
	strb r0, [r5]
	movs r0, #0x2c
	strh r0, [r4, #6]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803CAD2
	b _0803CC0A
_0803CAD2:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0803CADE
	b _0803CC0A
_0803CADE:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0803CAF8
	movs r1, #0x40
	adds r0, r2, #0
	b _0803CBB8
	.align 2, 0
_0803CAF0: .4byte gCurrentSprite
_0803CAF4: .4byte 0x0000FF7F
_0803CAF8:
	ldr r0, _0803CB00 @ =0x0000FFBF
	ands r0, r2
	strh r0, [r4]
	b _0803CC0A
	.align 2, 0
_0803CB00: .4byte 0x0000FFBF
_0803CB04:
	bl SpriteUtilChooseRandomXDirection
	movs r0, #2
	strb r0, [r5]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803CB3C @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	movs r7, #0xf0
	adds r5, r7, #0
	ands r5, r0
	cmp r5, #0
	beq _0803CB40
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CC0A
	movs r0, #0x40
	b _0803CBB8
	.align 2, 0
_0803CB3C: .4byte gPreviousCollisionCheck
_0803CB40:
	ldrh r0, [r4, #2]
	subs r0, #0x44
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803CB7C
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CC0A
	movs r0, #0x40
	b _0803CC06
_0803CB7C:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803CBBE
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CC0A
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_0803CBB8:
	orrs r0, r1
	strh r0, [r4]
	b _0803CC0A
_0803CBBE:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	adds r2, r7, #0
	ands r2, r0
	cmp r2, #0
	bne _0803CBD8
	strh r2, [r4]
	b _0803CC74
_0803CBD8:
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x40
	movs r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	strh r0, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CC0A
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_0803CC06:
	orrs r1, r0
	strh r1, [r4]
_0803CC0A:
	ldr r1, _0803CC28 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x34
	ldrb r2, [r3]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0803CC2C
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	movs r0, #8
	orrs r0, r2
	b _0803CC36
	.align 2, 0
_0803CC28: .4byte gCurrentSprite
_0803CC2C:
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	movs r0, #0xf7
	ands r0, r2
_0803CC36:
	strb r0, [r3]
	bl YardSetCrawlingOam
	bl YardUpdateHitbox
	ldr r3, _0803CC7C @ =gCurrentSprite
	ldr r2, _0803CC80 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r3, #0x14]
	adds r2, r3, #0
	adds r2, #0x25
	movs r0, #2
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #8
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_0803CC74:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CC7C: .4byte gCurrentSprite
_0803CC80: .4byte sPrimarySpriteStats

	thumb_func_start YardCheckRoll
YardCheckRoll: @ 0x0803CC84
	push {r4, r5, lr}
	ldr r4, _0803CCC0 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #1
	bne _0803CCF0
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CCF0
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803CCB6
	movs r5, #0x80
	lsls r5, r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803CCC4
_0803CCB6:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _0803CCF0
	.align 2, 0
_0803CCC0: .4byte gCurrentSprite
_0803CCC4:
	bl SpriteUtilMakeSpriteFaceAwayFromSamusDirection
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	bne _0803CCF0
	movs r1, #0
	movs r0, #0x80
	orrs r0, r2
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r1, [r0]
	strh r5, [r4, #0x12]
_0803CCF0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardRolling
YardRolling: @ 0x0803CCF8
	push {r4, r5, r6, r7, lr}
	bl YardCheckRoll
	movs r7, #0
	bl SpriteUtilAlignYPosOnSlope
	ldr r5, _0803CD38 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	adds r1, r2, #0
	cmp r1, #0
	bne _0803CD72
	ldr r4, _0803CD3C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CD40
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _0803CD50
	cmp r0, #4
	beq _0803CD64
	cmp r0, #2
	beq _0803CD36
	b _0803CE5E
_0803CD36:
	b _0803CD64
	.align 2, 0
_0803CD38: .4byte gPreviousVerticalCollisionCheck
_0803CD3C: .4byte gCurrentSprite
_0803CD40:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803CD5A
_0803CD50:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _0803CED0
_0803CD5A:
	cmp r0, #5
	beq _0803CD64
	cmp r0, #3
	beq _0803CD64
	b _0803CE5E
_0803CD64:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _0803CE5E
_0803CD72:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _0803CDF8
	ldr r4, _0803CDB8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803CDC4
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803CDBC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0803CDAE
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803CE5E
_0803CDAE:
	ldrh r1, [r4]
	ldr r0, _0803CDC0 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	b _0803CED0
	.align 2, 0
_0803CDB8: .4byte gCurrentSprite
_0803CDBC: .4byte gPreviousCollisionCheck
_0803CDC0: .4byte 0x0000FDFF
_0803CDC4:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0803CDF4 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0
	beq _0803CDE8
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _0803CE5E
_0803CDE8:
	ldrh r1, [r4]
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r4]
	b _0803CED0
	.align 2, 0
_0803CDF4: .4byte gPreviousCollisionCheck
_0803CDF8:
	cmp r1, #4
	beq _0803CE00
	cmp r1, #2
	bne _0803CE28
_0803CE00:
	ldr r1, _0803CE24 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	bne _0803CE80
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #1
	bne _0803CE5E
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r5]
	b _0803CE80
	.align 2, 0
_0803CE24: .4byte gCurrentSprite
_0803CE28:
	cmp r1, #5
	beq _0803CE30
	cmp r1, #3
	bne _0803CE5E
_0803CE30:
	ldr r1, _0803CE54 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _0803CE5C
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #1
	bne _0803CE5E
	ldr r0, _0803CE58 @ =0x0000FDFF
	ands r0, r2
	strh r0, [r5]
	b _0803CE80
	.align 2, 0
_0803CE54: .4byte gCurrentSprite
_0803CE58: .4byte 0x0000FDFF
_0803CE5C:
	movs r7, #1
_0803CE5E:
	ldr r5, _0803CE7C @ =gCurrentSprite
	cmp r7, #0
	bne _0803CE80
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803CE8E
	subs r1, #0xa
	movs r0, #1
	strb r0, [r1]
	b _0803CED0
	.align 2, 0
_0803CE7C: .4byte gCurrentSprite
_0803CE80:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0xf
	bhi _0803CE8E
	movs r0, #0x10
	strb r0, [r1]
_0803CE8E:
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsrs r4, r0, #3
	adds r0, r4, #0
	bl unk_11604
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CEB2
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, r0, r4
	b _0803CEBA
_0803CEB2:
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, r0, r4
_0803CEBA:
	strb r0, [r1]
	ldr r0, _0803CED8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0803CED0
	movs r0, #0xcc
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803CED0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803CED8: .4byte gFrameCounter8Bit

	thumb_func_start YardStartled
YardStartled: @ 0x0803CEDC
	push {lr}
	bl YardCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CEF8
	ldr r0, _0803CEF4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0803CF10
	.align 2, 0
_0803CEF4: .4byte gCurrentSprite
_0803CEF8:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803CF10
	ldr r1, _0803CF14 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
_0803CF10:
	pop {r0}
	bx r0
	.align 2, 0
_0803CF14: .4byte gCurrentSprite

	thumb_func_start YardIdleInit
YardIdleInit: @ 0x0803CF18
	push {lr}
	bl YardSetCrawlingOam
	ldr r0, _0803CF2C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0803CF2C: .4byte gCurrentSprite

	thumb_func_start YardIdle
YardIdle: @ 0x0803CF30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	movs r0, #1
	mov sb, r0
	movs r6, #0
	bl YardCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CF5C
	ldr r0, _0803CF58 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0803D2C0
	.align 2, 0
_0803CF58: .4byte gCurrentSprite
_0803CF5C:
	ldr r4, _0803CF74 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803CF78
	bl YardCheckRoll
	b _0803D2C0
	.align 2, 0
_0803CF74: .4byte gCurrentSprite
_0803CF78:
	bl YardCheckShouldStartle
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803CF84
	b _0803D2C0
_0803CF84:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	bne _0803D050
	ldrh r1, [r4, #2]
	ldrh r2, [r4, #4]
	ldrh r0, [r4, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r4, #0xc]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	ldrh r0, [r4, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r4, #0x10]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r5, #0
	str r4, [sp, #0x18]
_0803CFBE:
	ldr r0, [sp, #0x18]
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r5, r0
	beq _0803D03E
	ldr r1, _0803D04C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	mov ip, r0
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803D03E
	mov r1, ip
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x6d
	bne _0803D03E
	mov r0, ip
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0
	bne _0803D03E
	mov r0, ip
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _0803D03E
	mov r7, ip
	ldrh r3, [r7, #2]
	ldrh r4, [r7, #4]
	ldrh r2, [r7, #0xa]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r0, [r7, #0xc]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r1, [r7, #0xe]
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r7, #0x10]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, sl
	mov r3, r8
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _0803D03E
	b _0803D296
_0803D03E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _0803CFBE
	b _0803D054
	.align 2, 0
_0803D04C: .4byte gSpriteData
_0803D050:
	subs r0, #1
	strb r0, [r1]
_0803D054:
	ldr r4, _0803D098 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803D062
	b _0803D168
_0803D062:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803D0E0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D0A0
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D09C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803D08E
	b _0803D270
_0803D08E:
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0803D10A
	.align 2, 0
_0803D098: .4byte gCurrentSprite
_0803D09C: .4byte gPreviousCollisionCheck
_0803D0A0:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D0DC @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803D0B8
	b _0803D270
_0803D0B8:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803D0D0
	b _0803D270
_0803D0D0:
	ldrh r0, [r4, #2]
	mov r1, sb
	subs r0, r0, r1
	strh r0, [r4, #2]
	b _0803D2B0
	.align 2, 0
_0803D0DC: .4byte gPreviousCollisionCheck
_0803D0E0:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D128
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D124 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803D104
	b _0803D270
_0803D104:
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
_0803D10A:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803D11A
	b _0803D270
_0803D11A:
	ldrh r0, [r4, #2]
	add r0, sb
	strh r0, [r4, #2]
	b _0803D2B0
	.align 2, 0
_0803D124: .4byte gPreviousCollisionCheck
_0803D128:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D164 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803D142
	b _0803D270
_0803D142:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803D158
	b _0803D270
_0803D158:
	ldrh r0, [r4, #2]
	mov r7, sb
	subs r0, r0, r7
	strh r0, [r4, #2]
	b _0803D2B0
	.align 2, 0
_0803D164: .4byte gPreviousCollisionCheck
_0803D168:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803D1EC
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D1B8
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D1B4 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D270
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803D270
	ldrh r0, [r4, #4]
	add r0, sb
	b _0803D2AE
	.align 2, 0
_0803D1B4: .4byte gPreviousCollisionCheck
_0803D1B8:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803D1E8 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D270
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803D270
	b _0803D2A8
	.align 2, 0
_0803D1E8: .4byte gPreviousCollisionCheck
_0803D1EC:
	bl SpriteUtilAlignYPosOnSlope
	ldr r0, _0803D23C @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r5, #0xf0
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D284
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D244
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _0803D240 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D270
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0803D270
	ldrh r0, [r4, #4]
	add r0, sb
	b _0803D2AE
	.align 2, 0
_0803D23C: .4byte gPreviousVerticalCollisionCheck
_0803D240: .4byte gPreviousCollisionCheck
_0803D244:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _0803D278 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D270
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0803D27C
_0803D270:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0803D2B0
	.align 2, 0
_0803D278: .4byte gPreviousCollisionCheck
_0803D27C:
	ldrh r0, [r4, #4]
	mov r7, sb
	subs r0, r0, r7
	b _0803D2AE
_0803D284:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D2A8
	ldrh r0, [r4, #4]
	add r0, sb
	b _0803D2AE
_0803D296:
	ldr r1, [sp, #0x18]
	adds r1, #0x2f
	movs r0, #0x78
	strb r0, [r1]
	ldr r1, [sp, #0x18]
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0803D2C0
_0803D2A8:
	ldrh r0, [r4, #4]
	mov r1, sb
	subs r0, r0, r1
_0803D2AE:
	strh r0, [r4, #4]
_0803D2B0:
	cmp r6, #0
	beq _0803D2BC
	ldr r0, _0803D2D0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
	strb r1, [r0]
_0803D2BC:
	bl YardCheckShoot
_0803D2C0:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D2D0: .4byte gCurrentSprite

	thumb_func_start YardTurningAroundInit
YardTurningAroundInit: @ 0x0803D2D4
	push {lr}
	ldr r0, _0803D2E8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #4
	strb r1, [r0]
	bl YardSetTurningAroundOam
	pop {r0}
	bx r0
	.align 2, 0
_0803D2E8: .4byte gCurrentSprite

	thumb_func_start YardTurningAround
YardTurningAround: @ 0x0803D2EC
	push {r4, lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803D332
	ldr r4, _0803D318 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #5
	strb r1, [r0]
	bl YardSetTurningAroundSecondPartOam
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D31C
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	b _0803D320
	.align 2, 0
_0803D318: .4byte gCurrentSprite
_0803D31C:
	ldrh r0, [r4]
	movs r1, #0x40
_0803D320:
	eors r0, r1
	strh r0, [r4]
	ldr r0, _0803D338 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_0803D332:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D338: .4byte gCurrentSprite

	thumb_func_start YardTurningAroundSecondPart
YardTurningAroundSecondPart: @ 0x0803D33C
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803D34E
	ldr r0, _0803D354 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0803D34E:
	pop {r0}
	bx r0
	.align 2, 0
_0803D354: .4byte gCurrentSprite

	thumb_func_start YardFallingInit
YardFallingInit: @ 0x0803D358
	push {lr}
	ldr r1, _0803D374 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bl YardSetCrawlingOam
	pop {r0}
	bx r0
	.align 2, 0
_0803D374: .4byte gCurrentSprite

	thumb_func_start YardFalling
YardFalling: @ 0x0803D378
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _0803D3A0 @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D3A4
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803D3B0
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0803D3B0
	.align 2, 0
_0803D3A0: .4byte gCurrentSprite
_0803D3A4:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803D3B8
_0803D3B0:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0803D3B8:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0803D410 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D444
	ldr r4, _0803D414 @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803D3DE
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803D3DE:
	ldrh r1, [r4]
	ldr r0, _0803D418 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r4]
	movs r0, #0
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bl YardUpdateHitbox
	bl YardSetCrawlingOam
	cmp r5, #0
	beq _0803D424
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803D41C
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _0803D420
	.align 2, 0
_0803D410: .4byte gPreviousVerticalCollisionCheck
_0803D414: .4byte gCurrentSprite
_0803D418: .4byte 0x0000FEFF
_0803D41C:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_0803D420:
	subs r0, r0, r1
	strh r0, [r4, #4]
_0803D424:
	ldr r2, _0803D440 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D488
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #4]
	movs r2, #0x28
	bl ParticleSet
	b _0803D488
	.align 2, 0
_0803D440: .4byte gCurrentSprite
_0803D444:
	ldr r3, _0803D470 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0803D474 @ =sSpritesFallingSpeedSlow
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0803D478 @ =0x00007FFF
	cmp r1, r0
	bne _0803D47C
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0803D486
	.align 2, 0
_0803D470: .4byte gCurrentSprite
_0803D474: .4byte sSpritesFallingSpeedSlow
_0803D478: .4byte 0x00007FFF
_0803D47C:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0803D486:
	strh r0, [r3, #2]
_0803D488:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardProjectileInit
YardProjectileInit: @ 0x0803D490
	push {r4, lr}
	ldr r0, _0803D4FC @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803D500 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r2, #0xb
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0803D504 @ =0x0000FFF8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _0803D508 @ =sYardOam_355508
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0803D50C @ =gIoRegisters
	ldrb r1, [r1, #0xa]
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D4FC: .4byte gCurrentSprite
_0803D500: .4byte 0x0000FFFB
_0803D504: .4byte 0x0000FFF8
_0803D508: .4byte sYardOam_355508
_0803D50C: .4byte gIoRegisters

	thumb_func_start YardProjectileMoving
YardProjectileMoving: @ 0x0803D510
	push {lr}
	ldr r1, _0803D528 @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	bne _0803D52C
	ldrh r0, [r1, #2]
	subs r0, #3
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	subs r0, #3
	b _0803D554
	.align 2, 0
_0803D528: .4byte gCurrentSprite
_0803D52C:
	cmp r0, #1
	bne _0803D53C
	ldrh r0, [r1, #2]
	adds r0, #3
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	subs r0, #3
	b _0803D554
_0803D53C:
	cmp r0, #2
	bne _0803D546
	ldrh r0, [r1, #2]
	adds r0, #3
	b _0803D54E
_0803D546:
	cmp r0, #3
	bne _0803D556
	ldrh r0, [r1, #2]
	subs r0, #3
_0803D54E:
	strh r0, [r1, #2]
	ldrh r0, [r1, #4]
	adds r0, #3
_0803D554:
	strh r0, [r1, #4]
_0803D556:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardProjectileExplodingInit
YardProjectileExplodingInit: @ 0x0803D55C
	ldr r3, _0803D578 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	ldr r0, _0803D57C @ =sYardOam_355550
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_0803D578: .4byte gCurrentSprite
_0803D57C: .4byte sYardOam_355550

	thumb_func_start YardProjectileExploding
YardProjectileExploding: @ 0x0803D580
	push {r4, lr}
	ldr r4, _0803D5A0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803D598
	movs r0, #0
	strh r0, [r4]
_0803D598:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D5A0: .4byte gCurrentSprite

	thumb_func_start Yard
Yard: @ 0x0803D5A4
	push {r4, lr}
	ldr r4, _0803D5CC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803D5BC
	ldr r0, _0803D5D0 @ =0x00000197
	bl SoundPlayNotAlreadyPlaying
_0803D5BC:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803D5D4
	bl SpriteUtilUpdateFreezeTimer
	b _0803D7C4
	.align 2, 0
_0803D5CC: .4byte gCurrentSprite
_0803D5D0: .4byte 0x00000197
_0803D5D4:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803D5E0
	b _0803D7C4
_0803D5E0:
	lsls r0, r0, #2
	ldr r1, _0803D5EC @ =_0803D5F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803D5EC: .4byte _0803D5F0
_0803D5F0: @ jump table
	.4byte _0803D760 @ case 0
	.4byte _0803D766 @ case 1
	.4byte _0803D76A @ case 2
	.4byte _0803D776 @ case 3
	.4byte _0803D77A @ case 4
	.4byte _0803D780 @ case 5
	.4byte _0803D7C4 @ case 6
	.4byte _0803D7C4 @ case 7
	.4byte _0803D7C4 @ case 8
	.4byte _0803D7C4 @ case 9
	.4byte _0803D7C4 @ case 10
	.4byte _0803D7C4 @ case 11
	.4byte _0803D7C4 @ case 12
	.4byte _0803D7C4 @ case 13
	.4byte _0803D7C4 @ case 14
	.4byte _0803D7C4 @ case 15
	.4byte _0803D7C4 @ case 16
	.4byte _0803D7C4 @ case 17
	.4byte _0803D7C4 @ case 18
	.4byte _0803D7C4 @ case 19
	.4byte _0803D7C4 @ case 20
	.4byte _0803D786 @ case 21
	.4byte _0803D78A @ case 22
	.4byte _0803D7C4 @ case 23
	.4byte _0803D770 @ case 24
	.4byte _0803D7C4 @ case 25
	.4byte _0803D7C4 @ case 26
	.4byte _0803D7C4 @ case 27
	.4byte _0803D7C4 @ case 28
	.4byte _0803D7C4 @ case 29
	.4byte _0803D7C4 @ case 30
	.4byte _0803D7C4 @ case 31
	.4byte _0803D7C4 @ case 32
	.4byte _0803D7C4 @ case 33
	.4byte _0803D7C4 @ case 34
	.4byte _0803D7C4 @ case 35
	.4byte _0803D7C4 @ case 36
	.4byte _0803D7C4 @ case 37
	.4byte _0803D7C4 @ case 38
	.4byte _0803D7C4 @ case 39
	.4byte _0803D7C4 @ case 40
	.4byte _0803D7C4 @ case 41
	.4byte _0803D790 @ case 42
	.4byte _0803D7C4 @ case 43
	.4byte _0803D796 @ case 44
	.4byte _0803D7C4 @ case 45
	.4byte _0803D79C @ case 46
	.4byte _0803D7C4 @ case 47
	.4byte _0803D7C4 @ case 48
	.4byte _0803D7C4 @ case 49
	.4byte _0803D7C4 @ case 50
	.4byte _0803D7C4 @ case 51
	.4byte _0803D7C4 @ case 52
	.4byte _0803D7C4 @ case 53
	.4byte _0803D7C4 @ case 54
	.4byte _0803D7C4 @ case 55
	.4byte _0803D7A2 @ case 56
	.4byte _0803D7C4 @ case 57
	.4byte _0803D7C4 @ case 58
	.4byte _0803D7C4 @ case 59
	.4byte _0803D7C4 @ case 60
	.4byte _0803D7C4 @ case 61
	.4byte _0803D7C4 @ case 62
	.4byte _0803D7C4 @ case 63
	.4byte _0803D7C4 @ case 64
	.4byte _0803D7C4 @ case 65
	.4byte _0803D7C4 @ case 66
	.4byte _0803D7C4 @ case 67
	.4byte _0803D7C4 @ case 68
	.4byte _0803D7C4 @ case 69
	.4byte _0803D7C4 @ case 70
	.4byte _0803D7C4 @ case 71
	.4byte _0803D7C4 @ case 72
	.4byte _0803D7C4 @ case 73
	.4byte _0803D7C4 @ case 74
	.4byte _0803D7C4 @ case 75
	.4byte _0803D7C4 @ case 76
	.4byte _0803D7C4 @ case 77
	.4byte _0803D7C4 @ case 78
	.4byte _0803D7C4 @ case 79
	.4byte _0803D7C4 @ case 80
	.4byte _0803D7C4 @ case 81
	.4byte _0803D7C4 @ case 82
	.4byte _0803D7C4 @ case 83
	.4byte _0803D7C4 @ case 84
	.4byte _0803D7C4 @ case 85
	.4byte _0803D7C4 @ case 86
	.4byte _0803D7A8 @ case 87
	.4byte _0803D7AC @ case 88
	.4byte _0803D7B2 @ case 89
	.4byte _0803D7B6 @ case 90
	.4byte _0803D7BC @ case 91
_0803D760:
	bl YardInit
	b _0803D7C4
_0803D766:
	bl YardIdleInit
_0803D76A:
	bl YardIdle
	b _0803D7C4
_0803D770:
	bl YardStartled
	b _0803D7C4
_0803D776:
	bl YardTurningAroundInit
_0803D77A:
	bl YardTurningAround
	b _0803D7C4
_0803D780:
	bl YardTurningAroundSecondPart
	b _0803D7C4
_0803D786:
	bl YardFallingInit
_0803D78A:
	bl YardFalling
	b _0803D7C4
_0803D790:
	bl YardCharging
	b _0803D7C4
_0803D796:
	bl YardShooting
	b _0803D7C4
_0803D79C:
	bl YardRecoil
	b _0803D7C4
_0803D7A2:
	bl YardRolling
	b _0803D7C4
_0803D7A8:
	bl SpriteDyingInit
_0803D7AC:
	bl SpriteDying
	b _0803D7C4
_0803D7B2:
	bl YardInit
_0803D7B6:
	bl SpriteSpawningFromX
	b _0803D7C4
_0803D7BC:
	bl YardTurningIntoX
	bl XParasiteInit
_0803D7C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YardProjectile
YardProjectile: @ 0x0803D7CC
	push {lr}
	ldr r0, _0803D7E4 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803D7F2
	cmp r0, #2
	bgt _0803D7E8
	cmp r0, #0
	beq _0803D7EE
	b _0803D7FE
	.align 2, 0
_0803D7E4: .4byte gCurrentSprite
_0803D7E8:
	cmp r0, #0x38
	beq _0803D7F8
	b _0803D7FE
_0803D7EE:
	bl YardProjectileInit
_0803D7F2:
	bl YardProjectileMoving
	b _0803D802
_0803D7F8:
	bl YardProjectileExploding
	b _0803D802
_0803D7FE:
	bl YardProjectileExplodingInit
_0803D802:
	pop {r0}
	bx r0
	.align 2, 0
