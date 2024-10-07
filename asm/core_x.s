    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start MakeXParasitesFlee
MakeXParasitesFlee: @ 0x08025270
	push {r4, r5, lr}
	movs r4, #0
	ldr r5, _080252C0 @ =gSpriteData
_08025276:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080252B0
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _080252B0
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x32
	bne _080252B0
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5d
	bne _080252B0
	strh r3, [r2, #6]
	movs r0, #0x61
	strb r0, [r1]
_080252B0:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bls _08025276
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080252C0: .4byte gSpriteData

	thumb_func_start CoreXAbilityTransfromation
CoreXAbilityTransfromation: @ 0x080252C4
	push {lr}
	ldr r1, _080252F0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0
	beq _080252FC
	ldr r2, _080252F4 @ =gWrittenToMosaic_H
	ldr r1, _080252F8 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0802531A
	.align 2, 0
_080252F0: .4byte gCurrentSprite
_080252F4: .4byte gWrittenToMosaic_H
_080252F8: .4byte sXParasiteMosaicValues
_080252FC:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0802532C @ =0x0000FFDF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08025330 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
_0802531A:
	ldrh r0, [r3, #6]
	cmp r0, #7
	bhi _08025334
	adds r2, r0, #0
	movs r0, #0x21
	movs r1, #6
	bl SpriteLoadGfx
	b _08025342
	.align 2, 0
_0802532C: .4byte 0x0000FFDF
_08025330: .4byte gIoRegisters
_08025334:
	cmp r0, #8
	bne _08025342
	movs r0, #0x21
	movs r1, #6
	movs r2, #2
	bl SpriteLoadPal
_08025342:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CoreXAbilityInit
CoreXAbilityInit: @ 0x08025348
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r2, #0
	movs r4, #0x3a
	movs r0, #0x1b
	mov ip, r0
	ldr r0, _0802537C @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x26
	movs r3, #1
	strb r3, [r1]
	subs r1, #2
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0x59
	bne _08025400
	ldrb r0, [r5, #0x1d]
	subs r0, #0x3f
	cmp r0, #0xa
	bhi _080253E2
	lsls r0, r0, #2
	ldr r1, _08025380 @ =_08025384
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802537C: .4byte gCurrentSprite
_08025380: .4byte _08025384
_08025384: @ jump table
	.4byte _080253B0 @ case 0
	.4byte _080253E2 @ case 1
	.4byte _080253E2 @ case 2
	.4byte _080253E2 @ case 3
	.4byte _080253E2 @ case 4
	.4byte _080253BC @ case 5
	.4byte _080253C2 @ case 6
	.4byte _080253E2 @ case 7
	.4byte _080253C6 @ case 8
	.4byte _080253CC @ case 9
	.4byte _080253DE @ case 10
_080253B0:
	ldrh r0, [r5, #2]
	subs r0, #0x80
	strh r0, [r5, #2]
	movs r1, #0x1b
	mov ip, r1
	b _080253E2
_080253BC:
	movs r3, #0x5e
	mov ip, r3
	b _080253E2
_080253C2:
	movs r0, #0x5f
	b _080253E0
_080253C6:
	movs r1, #0x61
	mov ip, r1
	b _080253E2
_080253CC:
	ldrh r0, [r5, #2]
	subs r0, #0x80
	strh r0, [r5, #2]
	ldrh r0, [r5, #4]
	subs r0, #0x40
	strh r0, [r5, #4]
	movs r3, #0x62
	mov ip, r3
	b _080253E2
_080253DE:
	movs r0, #0x63
_080253E0:
	mov ip, r0
_080253E2:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r5, #6]
	ldrh r1, [r5]
	movs r0, #0x20
	orrs r0, r1
	ldr r1, _080253FC @ =0x0000F3FF
	ands r0, r1
	strh r0, [r5]
	b _08025464
	.align 2, 0
_080253FC: .4byte 0x0000F3FF
_08025400:
	ldrb r0, [r5, #0x1d]
	cmp r0, #0x3f
	beq _0802540C
	cmp r0, #0x44
	beq _08025420
	b _08025438
_0802540C:
	ldr r0, _0802541C @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08025434
	b _08025438
	.align 2, 0
_0802541C: .4byte gEquipment
_08025420:
	ldr r0, _08025440 @ =gEquipment
	ldrb r1, [r0, #0xc]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0802542E
	movs r2, #1
_0802542E:
	movs r4, #0x4b
	movs r1, #0x5e
	mov ip, r1
_08025434:
	cmp r2, #0
	beq _08025444
_08025438:
	movs r0, #0
	strh r0, [r5]
	b _0802555C
	.align 2, 0
_08025440: .4byte gEquipment
_08025444:
	ldr r0, _08025524 @ =gBossFormationSpriteId
	strb r4, [r0]
	ldr r1, _08025528 @ =gCoreXFormationSpriteId
	ldrb r0, [r5, #0x1d]
	strb r0, [r1]
	ldrh r0, [r5, #2]
	strh r0, [r5, #6]
	ldrh r1, [r5, #4]
	strh r1, [r5, #8]
	ldr r3, _0802552C @ =0xFFFFFE80
	adds r0, r0, r3
	strh r0, [r5, #2]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_08025464:
	adds r4, r5, #0
	ldr r2, _08025530 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	movs r6, #0
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08025534 @ =0x0000FFE0
	strh r1, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08025538 @ =0x08306008
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	adds r7, r4, #0
	adds r7, #0x23
	ldrb r3, [r7]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	mov r0, ip
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08025520
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08025520
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #1
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _0802553C
_08025520:
	strh r6, [r4]
	b _0802555C
	.align 2, 0
_08025524: .4byte gBossFormationSpriteId
_08025528: .4byte gCoreXFormationSpriteId
_0802552C: .4byte 0xFFFFFE80
_08025530: .4byte sPrimarySpriteStats
_08025534: .4byte 0x0000FFE0
_08025538: .4byte 0x08306008
_0802553C:
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #2
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _0802555C
	strh r6, [r5]
_0802555C:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CoreXAbilityIdleInit
CoreXAbilityIdleInit: @ 0x08025564
	ldr r3, _08025580 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	subs r1, #2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08025584 @ =0x08306008
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	bx lr
	.align 2, 0
_08025580: .4byte gCurrentSprite
_08025584: .4byte 0x08306008

	thumb_func_start CoreXAbilityIdle
CoreXAbilityIdle: @ 0x08025588
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r4, _0802577C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #0
	mov r8, r0
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r3, _08025780 @ =0x083031E0
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r7, _08025784 @ =0x00007FFF
	mov ip, r7
	cmp r0, ip
	bne _080255C4
	ldrh r2, [r3]
	movs r1, #0
_080255C4:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #2]
	adds r6, r0, r2
	strh r6, [r4, #2]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r3, _08025788 @ =0x08303262
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, ip
	bne _080255E8
	ldrh r2, [r3]
	movs r1, #0
_080255E8:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r1, [r4, #4]
	adds r1, r1, r2
	strh r1, [r4, #4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x12
	ldr r0, _0802578C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r1, _08025790 @ =gSamusData
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x18]
	cmp r0, r1
	blo _08025610
	b _0802576E
_08025610:
	cmp r2, #0x14
	bhi _08025616
	b _0802576E
_08025616:
	cmp r2, #0xdb
	bls _0802561C
	b _0802576E
_0802561C:
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	movs r5, #0x30
	str r5, [sp]
	ldrh r0, [r4, #2]
	adds r0, #0xb4
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x14
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	movs r0, #0x40
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08025656
	ldr r0, _08025794 @ =gSpriteData
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xb4
	strh r0, [r1, #6]
_08025656:
	ldrb r3, [r6]
	str r5, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0xc8
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0xa
	str r0, [sp, #8]
	mov r7, r8
	str r7, [sp, #0xc]
	movs r0, #0x40
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnNewXParasite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _0802568A
	ldr r0, _08025794 @ =gSpriteData
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xb4
	strh r0, [r1, #6]
_0802568A:
	ldrb r3, [r6]
	str r5, [sp]
	ldrh r0, [r4, #2]
	adds r0, #0x82
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x8c
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	movs r0, #0x40
	movs r1, #2
	movs r2, #0
	bl SpriteSpawnNewXParasite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _080256BE
	ldr r0, _08025794 @ =gSpriteData
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xb4
	strh r0, [r1, #6]
_080256BE:
	ldrb r3, [r6]
	str r5, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x82
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x96
	str r0, [sp, #8]
	mov r7, r8
	str r7, [sp, #0xc]
	movs r0, #0x40
	movs r1, #3
	movs r2, #0
	bl SpriteSpawnNewXParasite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _080256F2
	ldr r0, _08025794 @ =gSpriteData
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xb4
	strh r0, [r1, #6]
_080256F2:
	ldrb r3, [r6]
	str r5, [sp]
	ldrh r0, [r4, #2]
	adds r0, #0x8c
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0xa0
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	movs r0, #0x40
	movs r1, #4
	movs r2, #0
	bl SpriteSpawnNewXParasite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08025726
	ldr r0, _08025794 @ =gSpriteData
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xb4
	strh r0, [r1, #6]
_08025726:
	ldrb r3, [r6]
	str r5, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x96
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x82
	str r0, [sp, #8]
	mov r6, r8
	str r6, [sp, #0xc]
	movs r0, #0x40
	movs r1, #5
	movs r2, #0
	bl SpriteSpawnNewXParasite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _0802575A
	ldr r0, _08025794 @ =gSpriteData
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #0xb4
	strh r0, [r1, #6]
_0802575A:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x50
	strb r0, [r1]
	subs r1, #3
	movs r0, #0xbe
	strb r0, [r1]
_0802576E:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802577C: .4byte gCurrentSprite
_08025780: .4byte 0x083031E0
_08025784: .4byte 0x00007FFF
_08025788: .4byte 0x08303262
_0802578C: .4byte gBg1XPosition
_08025790: .4byte gSamusData
_08025794: .4byte gSpriteData

	thumb_func_start CoreXAbilityMovingToSpawnPoint
CoreXAbilityMovingToSpawnPoint: @ 0x08025798
	push {r4, r5, r6, r7, lr}
	ldr r2, _08025840 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	movs r1, #0
	mov ip, r1
	strh r0, [r2]
	adds r5, r2, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r4, _08025844 @ =0x083031E0
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _08025848 @ =0x00007FFF
	cmp r0, r6
	bne _080257CC
	ldrh r3, [r4]
	movs r1, #0
_080257CC:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _0802584C @ =0x08303262
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _080257F0
	ldrh r3, [r4]
	movs r1, #0
_080257F0:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	ldr r0, _08025850 @ =gBossFormationSpriteId
	ldrb r0, [r0]
	cmp r0, #0x4b
	bne _08025860
	ldrh r1, [r2, #2]
	ldrh r0, [r2, #6]
	ldr r3, _08025854 @ =0xFFFFFEC0
	adds r0, r0, r3
	cmp r1, r0
	blt _080258B8
	strh r0, [r2, #2]
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080258CA
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x2c
	strb r0, [r1]
	ldr r1, _08025858 @ =gWrittenToMosaic_H
	ldr r0, _0802585C @ =sXParasiteMosaicValues
	adds r0, #0x58
	ldrh r0, [r0]
	strh r0, [r1]
	movs r0, #0x1a
	b _080258A2
	.align 2, 0
_08025840: .4byte gCurrentSprite
_08025844: .4byte 0x083031E0
_08025848: .4byte 0x00007FFF
_0802584C: .4byte 0x08303262
_08025850: .4byte gBossFormationSpriteId
_08025854: .4byte 0xFFFFFEC0
_08025858: .4byte gWrittenToMosaic_H
_0802585C: .4byte sXParasiteMosaicValues
_08025860:
	ldrh r1, [r2, #2]
	ldrh r0, [r2, #6]
	subs r0, #0x64
	cmp r1, r0
	blt _080258B8
	strh r0, [r2, #2]
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080258CA
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x2c
	strb r0, [r1]
	ldr r1, _080258AC @ =gWrittenToMosaic_H
	ldr r0, _080258B0 @ =sXParasiteMosaicValues
	adds r0, #0x58
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _080258B4 @ =gDemoState
	ldrb r0, [r0]
	cmp r0, #0
	bne _080258BC
	movs r0, #0x19
_080258A2:
	movs r1, #7
	bl PlayMusic
	b _080258BC
	.align 2, 0
_080258AC: .4byte gWrittenToMosaic_H
_080258B0: .4byte sXParasiteMosaicValues
_080258B4: .4byte gDemoState
_080258B8:
	adds r0, r1, #1
	strh r0, [r2, #2]
_080258BC:
	ldr r1, _080258FC @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0
	beq _080258D4
_080258CA:
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_080258D4:
	adds r4, r2, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	cmp r0, #0x50
	bne _080258E4
	movs r0, #0xc4
	bl SoundPlay
_080258E4:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080258F4
	movs r0, #0x50
	strb r0, [r4]
_080258F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080258FC: .4byte gCurrentSprite

	thumb_func_start CoreXAbilitySpawningBoss
CoreXAbilitySpawningBoss: @ 0x08025900
	push {r4, lr}
	ldr r2, _08025938 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #4
	eors r1, r0
	strh r1, [r2]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	adds r4, r2, #0
	cmp r0, #0
	beq _08025944
	ldr r2, _0802593C @ =gWrittenToMosaic_H
	ldr r1, _08025940 @ =sXParasiteMosaicValues
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08025958
	.align 2, 0
_08025938: .4byte gCurrentSprite
_0802593C: .4byte gWrittenToMosaic_H
_08025940: .4byte sXParasiteMosaicValues
_08025944:
	ldr r0, _08025970 @ =0x0000FFFB
	ands r1, r0
	strh r1, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	ldr r0, _08025974 @ =gBossFormationSpriteId
	ldrb r0, [r0]
	strb r0, [r4, #0x1d]
_08025958:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0x1f
	bhi _08025978
	ldr r0, _08025974 @ =gBossFormationSpriteId
	ldrb r0, [r0]
	ldrb r2, [r1]
	movs r1, #0
	bl SpriteLoadGfx
	b _08025988
	.align 2, 0
_08025970: .4byte 0x0000FFFB
_08025974: .4byte gBossFormationSpriteId
_08025978:
	cmp r0, #0x20
	bne _08025988
	ldr r0, _08025990 @ =gBossFormationSpriteId
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #4
	bl SpriteLoadPal
_08025988:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025990: .4byte gBossFormationSpriteId

	thumb_func_start CoreXAbilityMovingInit
CoreXAbilityMovingInit: @ 0x08025994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r6, _08025A70 @ =gCurrentSprite
	adds r7, r6, #0
	adds r7, #0x23
	ldrb r3, [r7]
	movs r5, #0x20
	str r5, [sp]
	ldrh r0, [r6, #2]
	adds r0, #0x64
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r3, [r7]
	str r5, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x64
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r3, [r7]
	str r5, [sp]
	ldrh r0, [r6, #2]
	adds r0, #0x22
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	adds r0, #0x64
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r3, [r7]
	str r5, [sp]
	ldrh r0, [r6, #2]
	adds r0, #0x22
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	subs r0, #0x64
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r3, [r7]
	str r5, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x22
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	adds r0, #0x64
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r3, [r7]
	str r5, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x22
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	subs r0, #0x64
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x2f
	strb r4, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r4, [r0]
	adds r0, #3
	strb r1, [r0]
	subs r0, #4
	strb r4, [r0]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025A70: .4byte gCurrentSprite

	thumb_func_start CoreXAbilityMoving
CoreXAbilityMoving: @ 0x08025A74
	push {lr}
	sub sp, #8
	ldr r1, _08025A9C @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0xc0
	str r2, [sp, #4]
	movs r2, #0x1c
	movs r3, #0x28
	bl XParasiteMoveWithSound
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08025A9C: .4byte gSamusData

	thumb_func_start CoreXAbilityMovingToTargetInit
CoreXAbilityMovingToTargetInit: @ 0x08025AA0
	push {lr}
	ldr r0, _08025AE0 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x5d
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	movs r2, #0
	mov r0, ip
	strh r3, [r0, #0x14]
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	subs r0, #0xb
	strb r1, [r0]
	movs r0, #0x18
	movs r1, #6
	bl PlayMusic
	pop {r0}
	bx r0
	.align 2, 0
_08025AE0: .4byte gCurrentSprite

	thumb_func_start CoreXAbilityMovingToTarget
CoreXAbilityMovingToTarget: @ 0x08025AE4
	push {r4, r5, r6, lr}
	sub sp, #8
	bl MakeXParasitesFlee
	ldr r0, _08025B68 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08025B02
	ldr r0, _08025B6C @ =gCurrentSprite
	ldrh r1, [r0]
	movs r2, #4
	eors r1, r2
	strh r1, [r0]
_08025B02:
	ldr r5, _08025B6C @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08025B70 @ =gAbilityRestingYPosition
	ldrh r0, [r4]
	ldr r6, _08025B74 @ =gAbilityRestingXPosition
	ldrh r1, [r6]
	movs r2, #2
	str r2, [sp]
	ldr r2, _08025B78 @ =0x00000141
	str r2, [sp, #4]
	movs r2, #0x10
	movs r3, #0x18
	bl XParasiteMoveWithSound
	ldrh r2, [r5, #2]
	ldrh r1, [r4]
	adds r0, r1, #6
	cmp r2, r0
	bge _08025B60
	subs r0, r1, #6
	cmp r2, r0
	ble _08025B60
	ldrh r2, [r5, #4]
	ldrh r1, [r6]
	adds r0, r1, #6
	cmp r2, r0
	bge _08025B60
	subs r0, r1, #6
	cmp r2, r0
	ble _08025B60
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x5e
	strb r0, [r1]
	ldrh r1, [r5]
	ldr r0, _08025B7C @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_08025B60:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025B68: .4byte gFrameCounter8Bit
_08025B6C: .4byte gCurrentSprite
_08025B70: .4byte gAbilityRestingYPosition
_08025B74: .4byte gAbilityRestingXPosition
_08025B78: .4byte 0x00000141
_08025B7C: .4byte 0x0000FFFB

	thumb_func_start CoreXAbilityWaitingAtTarget
CoreXAbilityWaitingAtTarget: @ 0x08025B80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08025C64 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r1, [r0]
	ldr r3, _08025C68 @ =0x083031E0
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r7, _08025C6C @ =0x00007FFF
	mov r8, r7
	cmp r0, r8
	bne _08025BA8
	ldrh r2, [r3]
	movs r1, #0
_08025BA8:
	adds r0, r1, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	movs r6, #0
	strh r0, [r4, #2]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r3, _08025C70 @ =0x08303262
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r8
	bne _08025BD0
	ldrh r2, [r3]
	movs r1, #0
_08025BD0:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	ldrh r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r3
	cmp r0, #0
	bne _08025BE8
	b _08025D04
_08025BE8:
	ldr r1, _08025C74 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x5f
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	adds r1, #9
	strb r6, [r1]
	strb r0, [r5]
	subs r1, #1
	strb r6, [r1]
	mov r5, ip
	strb r0, [r5]
	movs r0, #0x80
	orrs r0, r3
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	movs r0, #0x14
	strh r0, [r4, #6]
	strb r6, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x16]
	ldr r0, _08025C78 @ =0x08306098
	str r0, [r4, #0x18]
	ldr r2, _08025C7C @ =gSamusData
	movs r7, #0x26
	ldrsh r0, [r2, r7]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	movs r2, #0x1d
	bl ParticleSet
	ldrb r0, [r4, #0x1d]
	subs r0, #0x3f
	cmp r0, #0xa
	bhi _08025CE6
	lsls r0, r0, #2
	ldr r1, _08025C80 @ =_08025C84
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025C64: .4byte gCurrentSprite
_08025C68: .4byte 0x083031E0
_08025C6C: .4byte 0x00007FFF
_08025C70: .4byte 0x08303262
_08025C74: .4byte gPreventMovementTimer
_08025C78: .4byte 0x08306098
_08025C7C: .4byte gSamusData
_08025C80: .4byte _08025C84
_08025C84: @ jump table
	.4byte _08025CB0 @ case 0
	.4byte _08025CE6 @ case 1
	.4byte _08025CE6 @ case 2
	.4byte _08025CE6 @ case 3
	.4byte _08025CE6 @ case 4
	.4byte _08025CB8 @ case 5
	.4byte _08025CC0 @ case 6
	.4byte _08025CC8 @ case 7
	.4byte _08025CD0 @ case 8
	.4byte _08025CD8 @ case 9
	.4byte _08025CE0 @ case 10
_08025CB0:
	movs r0, #0xa
	bl EventCheckAdvance
	b _08025CE6
_08025CB8:
	movs r0, #0x19
	bl EventCheckAdvance
	b _08025CE6
_08025CC0:
	movs r0, #0x1d
	bl EventCheckAdvance
	b _08025CE6
_08025CC8:
	movs r0, #0x33
	bl EventCheckAdvance
	b _08025CE6
_08025CD0:
	movs r0, #0x49
	bl EventCheckAdvance
	b _08025CE6
_08025CD8:
	movs r0, #0x51
	bl EventCheckAdvance
	b _08025CE6
_08025CE0:
	movs r0, #0x60
	bl EventCheckAdvance
_08025CE6:
	movs r0, #0xc8
	lsls r0, r0, #1
	movs r1, #0x32
	movs r2, #0xa
	bl RefillSamus
	ldr r1, _08025D00 @ =0x030012F0
	movs r0, #0x30
	strb r0, [r1, #3]
	movs r0, #0x92
	bl SoundPlay
	b _08025D16
	.align 2, 0
_08025D00: .4byte 0x030012F0
_08025D04:
	ldr r0, _08025D20 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08025D16
	movs r0, #0xc3
	bl SoundPlay
_08025D16:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025D20: .4byte gFrameCounter8Bit

	thumb_func_start CoreXAbilityGettingAbsorbed
CoreXAbilityGettingAbsorbed: @ 0x08025D24
	push {r4, lr}
	sub sp, #0xc
	ldr r4, _08025D44 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl XParasiteStickToSamus
	ldrh r0, [r4, #6]
	adds r1, r0, #0
	cmp r1, #0
	beq _08025D48
	subs r0, #1
	strh r0, [r4, #6]
	b _08025D70
	.align 2, 0
_08025D44: .4byte gCurrentSprite
_08025D48:
	ldrh r0, [r4, #0x12]
	cmp r0, #0x50
	bls _08025D54
	subs r0, #8
	strh r0, [r4, #0x12]
	b _08025D70
_08025D54:
	strh r1, [r4]
	ldr r0, _08025D78 @ =gAbilityRestingYPosition
	ldrh r0, [r0]
	str r0, [sp]
	ldr r0, _08025D7C @ =gAbilityRestingXPosition
	ldrh r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x21
	movs r1, #0
	movs r2, #6
	movs r3, #0x10
	bl SpriteSpawnPrimary
_08025D70:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08025D78: .4byte gAbilityRestingYPosition
_08025D7C: .4byte gAbilityRestingXPosition

	thumb_func_start CoreXAbility
CoreXAbility: @ 0x08025D80
	push {lr}
	ldr r0, _08025D98 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5f
	bls _08025D8E
	b _08025F66
_08025D8E:
	lsls r0, r0, #2
	ldr r1, _08025D9C @ =_08025DA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08025D98: .4byte gCurrentSprite
_08025D9C: .4byte _08025DA0
_08025DA0: @ jump table
	.4byte _08025F2A @ case 0
	.4byte _08025F30 @ case 1
	.4byte _08025F34 @ case 2
	.4byte _08025F66 @ case 3
	.4byte _08025F66 @ case 4
	.4byte _08025F66 @ case 5
	.4byte _08025F66 @ case 6
	.4byte _08025F66 @ case 7
	.4byte _08025F66 @ case 8
	.4byte _08025F66 @ case 9
	.4byte _08025F66 @ case 10
	.4byte _08025F66 @ case 11
	.4byte _08025F66 @ case 12
	.4byte _08025F66 @ case 13
	.4byte _08025F66 @ case 14
	.4byte _08025F66 @ case 15
	.4byte _08025F66 @ case 16
	.4byte _08025F66 @ case 17
	.4byte _08025F66 @ case 18
	.4byte _08025F66 @ case 19
	.4byte _08025F66 @ case 20
	.4byte _08025F66 @ case 21
	.4byte _08025F66 @ case 22
	.4byte _08025F66 @ case 23
	.4byte _08025F3A @ case 24
	.4byte _08025F66 @ case 25
	.4byte _08025F40 @ case 26
	.4byte _08025F46 @ case 27
	.4byte _08025F4A @ case 28
	.4byte _08025F66 @ case 29
	.4byte _08025F66 @ case 30
	.4byte _08025F66 @ case 31
	.4byte _08025F66 @ case 32
	.4byte _08025F66 @ case 33
	.4byte _08025F66 @ case 34
	.4byte _08025F66 @ case 35
	.4byte _08025F66 @ case 36
	.4byte _08025F66 @ case 37
	.4byte _08025F66 @ case 38
	.4byte _08025F66 @ case 39
	.4byte _08025F66 @ case 40
	.4byte _08025F66 @ case 41
	.4byte _08025F66 @ case 42
	.4byte _08025F66 @ case 43
	.4byte _08025F66 @ case 44
	.4byte _08025F66 @ case 45
	.4byte _08025F66 @ case 46
	.4byte _08025F66 @ case 47
	.4byte _08025F66 @ case 48
	.4byte _08025F66 @ case 49
	.4byte _08025F66 @ case 50
	.4byte _08025F66 @ case 51
	.4byte _08025F66 @ case 52
	.4byte _08025F66 @ case 53
	.4byte _08025F66 @ case 54
	.4byte _08025F66 @ case 55
	.4byte _08025F66 @ case 56
	.4byte _08025F66 @ case 57
	.4byte _08025F66 @ case 58
	.4byte _08025F66 @ case 59
	.4byte _08025F66 @ case 60
	.4byte _08025F66 @ case 61
	.4byte _08025F66 @ case 62
	.4byte _08025F66 @ case 63
	.4byte _08025F66 @ case 64
	.4byte _08025F66 @ case 65
	.4byte _08025F66 @ case 66
	.4byte _08025F66 @ case 67
	.4byte _08025F66 @ case 68
	.4byte _08025F66 @ case 69
	.4byte _08025F66 @ case 70
	.4byte _08025F66 @ case 71
	.4byte _08025F66 @ case 72
	.4byte _08025F66 @ case 73
	.4byte _08025F66 @ case 74
	.4byte _08025F66 @ case 75
	.4byte _08025F66 @ case 76
	.4byte _08025F66 @ case 77
	.4byte _08025F66 @ case 78
	.4byte _08025F66 @ case 79
	.4byte _08025F66 @ case 80
	.4byte _08025F66 @ case 81
	.4byte _08025F66 @ case 82
	.4byte _08025F66 @ case 83
	.4byte _08025F66 @ case 84
	.4byte _08025F66 @ case 85
	.4byte _08025F66 @ case 86
	.4byte _08025F66 @ case 87
	.4byte _08025F66 @ case 88
	.4byte _08025F20 @ case 89
	.4byte _08025F24 @ case 90
	.4byte _08025F66 @ case 91
	.4byte _08025F50 @ case 92
	.4byte _08025F56 @ case 93
	.4byte _08025F5C @ case 94
	.4byte _08025F62 @ case 95
_08025F20:
	bl CoreXAbilityInit
_08025F24:
	bl CoreXAbilityTransfromation
	b _08025F66
_08025F2A:
	bl CoreXAbilityInit
	b _08025F66
_08025F30:
	bl CoreXAbilityIdleInit
_08025F34:
	bl CoreXAbilityIdle
	b _08025F66
_08025F3A:
	bl CoreXAbilityMovingToSpawnPoint
	b _08025F66
_08025F40:
	bl CoreXAbilitySpawningBoss
	b _08025F66
_08025F46:
	bl CoreXAbilityMovingInit
_08025F4A:
	bl CoreXAbilityMoving
	b _08025F66
_08025F50:
	bl CoreXAbilityMovingToTargetInit
	b _08025F66
_08025F56:
	bl CoreXAbilityMovingToTarget
	b _08025F66
_08025F5C:
	bl CoreXAbilityWaitingAtTarget
	b _08025F66
_08025F62:
	bl CoreXAbilityGettingAbsorbed
_08025F66:
	ldr r2, _08025F84 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1a
	bhi _08025F7E
	ldr r1, _08025F88 @ =gXParasiteTargetYPosition
	ldrh r0, [r2, #2]
	strh r0, [r1]
	ldr r1, _08025F8C @ =gXParasiteTargetXPosition
	ldrh r0, [r2, #4]
	strh r0, [r1]
_08025F7E:
	pop {r0}
	bx r0
	.align 2, 0
_08025F84: .4byte gCurrentSprite
_08025F88: .4byte gXParasiteTargetYPosition
_08025F8C: .4byte gXParasiteTargetXPosition

	thumb_func_start CoreXShell
CoreXShell: @ 0x08025F90
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r2, _08025FD4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _08025FD8 @ =sSecondarySpriteStats
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r7, r2, #0
	adds r7, #0x24
	ldrb r4, [r7]
	adds r5, r2, #0
	cmp r4, #0
	beq _08025FDC
	cmp r4, #0x18
	bne _08026040
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	bne _08025FCE
	b _08026338
_08025FCE:
	movs r0, #0
	strh r0, [r5]
	b _08026338
	.align 2, 0
_08025FD4: .4byte gCurrentSprite
_08025FD8: .4byte sSecondarySpriteStats
_08025FDC:
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r3, #0
	orrs r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r5]
	ldr r0, _0802606C @ =0x0000FFFB
	ands r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08026070 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	strh r6, [r5, #0x14]
	adds r0, r5, #0
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r1, _08026074 @ =0x0000FFB0
	strh r1, [r5, #0xa]
	movs r0, #0x50
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _08026078 @ =0x08306498
	str r0, [r5, #0x18]
	strb r3, [r5, #0x1c]
	strh r4, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #2
	strb r0, [r7]
_08026040:
	ldr r2, _0802607C @ =gSpriteData
	mov r0, r8
	lsls r3, r0, #3
	subs r0, r3, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r5, #2]
	ldrh r1, [r0, #4]
	strh r1, [r5, #4]
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	mov ip, r2
	adds r7, r3, #0
	cmp r0, #0
	beq _08026080
	ldrh r0, [r5]
	movs r1, #0x20
	orrs r0, r1
	b _08026086
	.align 2, 0
_0802606C: .4byte 0x0000FFFB
_08026070: .4byte gIoRegisters
_08026074: .4byte 0x0000FFB0
_08026078: .4byte 0x08306498
_0802607C: .4byte gSpriteData
_08026080:
	ldrh r1, [r5]
	ldr r0, _080260A8 @ =0x0000FFDF
	ands r0, r1
_08026086:
	strh r0, [r5]
	mov r1, r8
	subs r0, r7, r1
	lsls r0, r0, #3
	add r0, ip
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x1b
	bls _0802609C
	b _08026338
_0802609C:
	lsls r0, r0, #2
	ldr r1, _080260AC @ =_080260B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080260A8: .4byte 0x0000FFDF
_080260AC: .4byte _080260B0
_080260B0: @ jump table
	.4byte _08026134 @ case 0
	.4byte _08026134 @ case 1
	.4byte _08026338 @ case 2
	.4byte _08026338 @ case 3
	.4byte _08026338 @ case 4
	.4byte _08026338 @ case 5
	.4byte _08026338 @ case 6
	.4byte _08026338 @ case 7
	.4byte _08026338 @ case 8
	.4byte _08026338 @ case 9
	.4byte _08026338 @ case 10
	.4byte _08026338 @ case 11
	.4byte _08026338 @ case 12
	.4byte _08026338 @ case 13
	.4byte _08026338 @ case 14
	.4byte _08026338 @ case 15
	.4byte _08026338 @ case 16
	.4byte _08026338 @ case 17
	.4byte _08026338 @ case 18
	.4byte _08026338 @ case 19
	.4byte _08026338 @ case 20
	.4byte _08026338 @ case 21
	.4byte _08026338 @ case 22
	.4byte _08026134 @ case 23
	.4byte _08026338 @ case 24
	.4byte _08026120 @ case 25
	.4byte _08026146 @ case 26
	.4byte _0802614E @ case 27
_08026120:
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	add r0, ip
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0x20
	bhi _08026134
	movs r0, #0
	strh r0, [r5]
_08026134:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
	b _08026338
_08026146:
	ldrh r1, [r5]
	ldr r0, _08026180 @ =0x00007FFF
	ands r0, r1
	strh r0, [r5]
_0802614E:
	ldrh r4, [r5, #0x14]
	cmp r4, #0
	bne _08026188
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	ldr r0, _08026184 @ =0x083061C0
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	mov r3, r8
	subs r0, r7, r3
	lsls r0, r0, #3
	add r0, ip
	adds r0, #0x24
	movs r1, #0x5c
	strb r1, [r0]
	movs r0, #0xc1
	bl SoundPlay
	b _08026338
	.align 2, 0
_08026180: .4byte 0x00007FFF
_08026184: .4byte 0x083061C0
_08026188:
	adds r0, r6, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bhi _080261A8
	ldr r0, _080261A4 @ =0x083064B8
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #3
	b _080261C0
	.align 2, 0
_080261A4: .4byte 0x083064B8
_080261A8:
	ldrh r4, [r5, #0x14]
	lsls r0, r6, #1
	movs r1, #3
	bl __divsi3
	cmp r4, r0
	bgt _080261C2
	ldr r0, _08026204 @ =0x083064A8
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #2
_080261C0:
	strb r0, [r1]
_080261C2:
	adds r6, r5, #0
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #1
	bne _08026208
	movs r0, #0x32
	bl CountPrimarySprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bhi _080262BE
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r3, [r0]
	movs r0, #0x20
	str r0, [sp]
	ldrh r0, [r6, #2]
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _080262BE
	.align 2, 0
_08026204: .4byte 0x083064A8
_08026208:
	cmp r1, #0x10
	bne _080262BE
	movs r0, #0xc2
	bl SoundPlay
	adds r2, r5, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _08026248 @ =gSpriteData
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0xb4
	strb r0, [r1]
	ldrh r1, [r5, #2]
	ldr r0, _0802624C @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x40
	cmp r1, r0
	ble _08026250
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	b _08026256
	.align 2, 0
_08026248: .4byte gSpriteData
_0802624C: .4byte gSamusData
_08026250:
	ldrh r1, [r3]
	ldr r0, _0802627C @ =0x0000FBFF
	ands r0, r1
_08026256:
	strh r0, [r3]
	ldr r0, _08026280 @ =gCurrentSprite
	ldr r1, _08026284 @ =gSamusData
	ldrh r0, [r0, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0802628C
	ldr r0, _08026288 @ =gSpriteData
	mov r3, r8
	subs r1, r7, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r2
	b _0802629C
	.align 2, 0
_0802627C: .4byte 0x0000FBFF
_08026280: .4byte gCurrentSprite
_08026284: .4byte gSamusData
_08026288: .4byte gSpriteData
_0802628C:
	ldr r0, _080262FC @ =gSpriteData
	mov r2, r8
	subs r1, r7, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	ldr r0, _08026300 @ =0x0000FDFF
	ands r0, r2
_0802629C:
	strh r0, [r1]
	ldr r1, _080262FC @ =gSpriteData
	mov r3, r8
	subs r0, r7, r3
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2f
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	movs r1, #0x1c
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
_080262BE:
	ldr r1, _080262FC @ =gSpriteData
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r4, [r0]
	mov ip, r1
	cmp r4, #0
	beq _08026338
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _0802630E
	movs r0, #4
	ands r4, r0
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08026308
	ldr r0, _08026304 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	ldrb r3, [r0, #0x1f]
	adds r1, r1, r3
	movs r2, #0xd
	subs r2, r2, r1
	adds r0, #0x20
	strb r2, [r0]
	b _0802630E
	.align 2, 0
_080262FC: .4byte gSpriteData
_08026300: .4byte 0x0000FDFF
_08026304: .4byte gCurrentSprite
_08026308:
	ldr r0, _08026344 @ =gCurrentSprite
	adds r0, #0x20
	strb r1, [r0]
_0802630E:
	mov r1, r8
	subs r0, r7, r1
	lsls r0, r0, #3
	add r0, ip
	adds r0, #0x2d
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r4, #0
	bne _08026338
	ldr r1, _08026344 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x34
	ldrb r2, [r3]
	movs r0, #0xbf
	ands r0, r2
	strb r0, [r3]
	adds r1, #0x20
	strb r4, [r1]
_08026338:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08026344: .4byte gCurrentSprite

	thumb_func_start AbilityAura
AbilityAura: @ 0x08026348
	push {r4, r5, r6, lr}
	ldr r1, _080263BC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r4, [r0]
	adds r6, r1, #0
	adds r6, #0x24
	ldrb r5, [r6]
	mov ip, r1
	cmp r5, #0
	bne _080263E6
	ldrh r1, [r1]
	ldr r0, _080263C0 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x22
	movs r2, #4
	strb r2, [r0]
	ldr r0, _080263C4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _080263C8 @ =0x0000FFFC
	mov r1, ip
	strh r0, [r1, #0xa]
	strh r2, [r1, #0xc]
	strh r0, [r1, #0xe]
	strh r2, [r1, #0x10]
	strb r3, [r1, #0x1c]
	strh r5, [r1, #0x16]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #2
	strb r0, [r6]
	ldrb r0, [r1, #0x1e]
	cmp r0, #2
	bne _080263D0
	ldr r0, _080263CC @ =0x08306100
	b _080263E4
	.align 2, 0
_080263BC: .4byte gCurrentSprite
_080263C0: .4byte 0x0000FFFB
_080263C4: .4byte gIoRegisters
_080263C8: .4byte 0x0000FFFC
_080263CC: .4byte 0x08306100
_080263D0:
	cmp r0, #1
	bne _080263E0
	ldr r0, _080263DC @ =0x083060D8
	mov r5, ip
	str r0, [r5, #0x18]
	b _080263E6
	.align 2, 0
_080263DC: .4byte 0x083060D8
_080263E0:
	ldr r0, _08026410 @ =0x083060B0
	mov r1, ip
_080263E4:
	str r0, [r1, #0x18]
_080263E6:
	ldr r2, _08026414 @ =gSpriteData
	lsls r3, r4, #3
	subs r0, r3, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	mov r5, ip
	strh r1, [r5, #2]
	ldrh r1, [r0, #4]
	strh r1, [r5, #4]
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08026418
	ldrh r0, [r5]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r5]
	b _08026424
	.align 2, 0
_08026410: .4byte 0x083060B0
_08026414: .4byte gSpriteData
_08026418:
	mov r0, ip
	ldrh r1, [r0]
	ldr r0, _08026440 @ =0x0000FFDF
	ands r0, r1
	mov r1, ip
	strh r0, [r1]
_08026424:
	subs r0, r3, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x5e
	bls _08026436
	b _08026642
_08026436:
	lsls r0, r0, #2
	ldr r1, _08026444 @ =_08026448
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026440: .4byte 0x0000FFDF
_08026444: .4byte _08026448
_08026448: @ jump table
	.4byte _080265E2 @ case 0
	.4byte _080265E2 @ case 1
	.4byte _08026642 @ case 2
	.4byte _08026642 @ case 3
	.4byte _08026642 @ case 4
	.4byte _08026642 @ case 5
	.4byte _08026642 @ case 6
	.4byte _08026642 @ case 7
	.4byte _08026642 @ case 8
	.4byte _08026642 @ case 9
	.4byte _08026642 @ case 10
	.4byte _08026642 @ case 11
	.4byte _08026642 @ case 12
	.4byte _08026642 @ case 13
	.4byte _08026642 @ case 14
	.4byte _08026642 @ case 15
	.4byte _08026642 @ case 16
	.4byte _08026642 @ case 17
	.4byte _08026642 @ case 18
	.4byte _08026642 @ case 19
	.4byte _08026642 @ case 20
	.4byte _08026642 @ case 21
	.4byte _08026642 @ case 22
	.4byte _080265E2 @ case 23
	.4byte _08026642 @ case 24
	.4byte _080265CE @ case 25
	.4byte _08026642 @ case 26
	.4byte _08026642 @ case 27
	.4byte _08026642 @ case 28
	.4byte _08026642 @ case 29
	.4byte _08026642 @ case 30
	.4byte _08026642 @ case 31
	.4byte _08026642 @ case 32
	.4byte _08026642 @ case 33
	.4byte _08026642 @ case 34
	.4byte _08026642 @ case 35
	.4byte _08026642 @ case 36
	.4byte _08026642 @ case 37
	.4byte _08026642 @ case 38
	.4byte _08026642 @ case 39
	.4byte _08026642 @ case 40
	.4byte _08026642 @ case 41
	.4byte _08026642 @ case 42
	.4byte _08026642 @ case 43
	.4byte _08026642 @ case 44
	.4byte _08026642 @ case 45
	.4byte _08026642 @ case 46
	.4byte _08026642 @ case 47
	.4byte _08026642 @ case 48
	.4byte _08026642 @ case 49
	.4byte _08026642 @ case 50
	.4byte _08026642 @ case 51
	.4byte _08026642 @ case 52
	.4byte _08026642 @ case 53
	.4byte _080265C4 @ case 54
	.4byte _080265C4 @ case 55
	.4byte _080265C4 @ case 56
	.4byte _080265C4 @ case 57
	.4byte _080265C4 @ case 58
	.4byte _08026628 @ case 59
	.4byte _08026642 @ case 60
	.4byte _08026642 @ case 61
	.4byte _08026642 @ case 62
	.4byte _08026642 @ case 63
	.4byte _08026642 @ case 64
	.4byte _08026642 @ case 65
	.4byte _08026642 @ case 66
	.4byte _08026642 @ case 67
	.4byte _08026642 @ case 68
	.4byte _08026642 @ case 69
	.4byte _08026642 @ case 70
	.4byte _08026642 @ case 71
	.4byte _08026642 @ case 72
	.4byte _08026642 @ case 73
	.4byte _08026642 @ case 74
	.4byte _08026642 @ case 75
	.4byte _08026642 @ case 76
	.4byte _08026642 @ case 77
	.4byte _08026642 @ case 78
	.4byte _08026642 @ case 79
	.4byte _08026642 @ case 80
	.4byte _08026642 @ case 81
	.4byte _08026642 @ case 82
	.4byte _08026642 @ case 83
	.4byte _08026642 @ case 84
	.4byte _08026642 @ case 85
	.4byte _08026642 @ case 86
	.4byte _08026642 @ case 87
	.4byte _08026642 @ case 88
	.4byte _08026642 @ case 89
	.4byte _08026642 @ case 90
	.4byte _080265EC @ case 91
	.4byte _0802660C @ case 92
	.4byte _08026628 @ case 93
	.4byte _0802663C @ case 94
_080265C4:
	mov r5, ip
	ldrh r1, [r5]
	movs r0, #4
	orrs r0, r1
	b _08026640
_080265CE:
	subs r0, r3, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0x20
	bhi _080265E2
	movs r0, #0
	mov r5, ip
	strh r0, [r5]
_080265E2:
	mov r1, ip
	ldrh r0, [r1]
	movs r1, #4
	eors r0, r1
	b _0802663E
_080265EC:
	mov r1, ip
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	beq _080265FA
	movs r0, #0
	strh r0, [r1]
	b _08026642
_080265FA:
	mov r5, ip
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	ldr r0, _08026608 @ =0x08306350
	str r0, [r5, #0x18]
	b _08026642
	.align 2, 0
_08026608: .4byte 0x08306350
_0802660C:
	ldr r0, _08026624 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08026642
	mov r1, ip
	ldrh r0, [r1]
	movs r1, #4
	eors r0, r1
	b _0802663E
	.align 2, 0
_08026624: .4byte gFrameCounter8Bit
_08026628:
	mov r0, ip
	ldrh r1, [r0]
	ldr r0, _08026638 @ =0x0000FFFB
	ands r0, r1
	mov r1, ip
	strh r0, [r1]
	b _08026642
	.align 2, 0
_08026638: .4byte 0x0000FFFB
_0802663C:
	movs r0, #0
_0802663E:
	mov r5, ip
_08026640:
	strh r0, [r5]
_08026642:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
