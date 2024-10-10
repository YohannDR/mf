    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start FrozenRidleySetCollision
FrozenRidleySetCollision: @ 0x08056DD4
	push {lr}
	adds r3, r0, #0
	ldr r1, _08056DEC @ =gCurrentSprite
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	ldr r2, _08056DF0 @ =gCurrentClipdataAffectingAction
	strb r3, [r2]
	adds r0, #0x20
	bl ClipdataProcess
	pop {r0}
	bx r0
	.align 2, 0
_08056DEC: .4byte gCurrentSprite
_08056DF0: .4byte gCurrentClipdataAffectingAction

	thumb_func_start FrozenRidleyInit
FrozenRidleyInit: @ 0x08056DF4
	push {r4, r5, lr}
	ldr r4, _08056E64 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x21
	movs r3, #0
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x58
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x48
	strb r0, [r1]
	movs r5, #0
	ldr r0, _08056E68 @ =0x0000FE98
	strh r0, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	ldr r0, _08056E6C @ =0x0000FFA0
	strh r0, [r4, #0xe]
	movs r0, #0x60
	strh r0, [r4, #0x10]
	strb r5, [r4, #0x1c]
	strh r3, [r4, #0x16]
	bl EventCheckOn_PowerOutage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08056E74
	movs r1, #1
	strh r0, [r4, #0x14]
	ldr r0, _08056E70 @ =0x083A123C
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #2
	bl FrozenRidleySetCollision
	b _08056EAE
	.align 2, 0
_08056E64: .4byte gCurrentSprite
_08056E68: .4byte 0x0000FE98
_08056E6C: .4byte 0x0000FFA0
_08056E70: .4byte 0x083A123C
_08056E74:
	cmp r0, #2
	bne _08056E90
	ldr r0, _08056E8C @ =0x083A12F4
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r5, [r0]
	b _08056EAE
	.align 2, 0
_08056E8C: .4byte 0x083A12F4
_08056E90:
	movs r2, #1
	movs r0, #1
	strh r0, [r4, #0x14]
	ldr r0, _08056EB4 @ =0x083A123C
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #2
	bl FrozenRidleySetCollision
_08056EAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056EB4: .4byte 0x083A123C

	thumb_func_start FrozenRidleyWaitForSamus
FrozenRidleyWaitForSamus: @ 0x08056EB8
	push {lr}
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #4
	bne _08056EEA
	ldr r0, _08056EF0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #2
	strb r1, [r2]
	ldr r1, _08056EF4 @ =0x083A124C
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0xa0
	strb r1, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	bl SoundPlay
_08056EEA:
	pop {r0}
	bx r0
	.align 2, 0
_08056EF0: .4byte gCurrentSprite
_08056EF4: .4byte 0x083A124C

	thumb_func_start FrozenRidleySpawningX
FrozenRidleySpawningX: @ 0x08056EF8
	push {r4, lr}
	sub sp, #0xc
	ldr r2, _08056F44 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08056F3C
	subs r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08056F48 @ =0x083A1284
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r4, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	subs r0, #0xa0
	str r0, [sp]
	ldrh r0, [r2, #4]
	subs r0, #0x20
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x73
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
_08056F3C:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056F44: .4byte gCurrentSprite
_08056F48: .4byte 0x083A1284

	thumb_func_start FrozenRidleyClosingEye
FrozenRidleyClosingEye: @ 0x08056F4C
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08056F70
	ldr r0, _08056F74 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x1a
	strb r1, [r2]
	ldr r1, _08056F78 @ =0x083A123C
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x3c
	strb r1, [r0]
_08056F70:
	pop {r0}
	bx r0
	.align 2, 0
_08056F74: .4byte gCurrentSprite
_08056F78: .4byte 0x083A123C

	thumb_func_start FrozenRidleyXSpawning
FrozenRidleyXSpawning: @ 0x08056F7C
	push {lr}
	ldr r2, _08056FB4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08056FAE
	subs r1, #0xa
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _08056FB8 @ =0x083A12A4
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	movs r0, #0
	strh r3, [r2, #0x16]
	adds r1, #1
	strb r0, [r1]
	strh r3, [r2, #0x14]
	ldr r0, _08056FBC @ =0x00000235
	bl SoundPlay
_08056FAE:
	pop {r0}
	bx r0
	.align 2, 0
_08056FB4: .4byte gCurrentSprite
_08056FB8: .4byte 0x083A12A4
_08056FBC: .4byte 0x00000235

	thumb_func_start FrozenRidleyCrumbling
FrozenRidleyCrumbling: @ 0x08056FC0
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08056FF0
	ldr r1, _08056FE8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #8
	strb r0, [r2]
	ldr r0, _08056FEC @ =0x083A12F4
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	movs r0, #1
	bl FrozenRidleySetCollision
	b _08057008
	.align 2, 0
_08056FE8: .4byte gCurrentSprite
_08056FEC: .4byte 0x083A12F4
_08056FF0:
	ldr r1, _0805700C @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #4
	bne _08057008
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _08057008
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x3b
	bl ParticleSet
_08057008:
	pop {r0}
	bx r0
	.align 2, 0
_0805700C: .4byte gCurrentSprite

	thumb_func_start FrozenRidleyXInit
FrozenRidleyXInit: @ 0x08057010
	push {r4, r5, lr}
	ldr r0, _08057088 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r3, _0805708C @ =0x0000FFFB
	ands r3, r0
	movs r4, #0
	movs r5, #0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08057090 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	movs r0, #0x20
	orrs r3, r0
	mov r1, ip
	strh r3, [r1]
	adds r1, #0x2e
	movs r0, #0x2c
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08057094 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	strb r4, [r2, #0x1c]
	strh r5, [r2, #0x16]
	ldr r0, _08057098 @ =sFrameData_306008
	str r0, [r2, #0x18]
	mov r0, ip
	adds r0, #0x25
	strb r4, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0805709C @ =0x00000236
	bl SoundPlay
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057088: .4byte gCurrentSprite
_0805708C: .4byte 0x0000FFFB
_08057090: .4byte gIoRegisters
_08057094: .4byte 0x0000FFFC
_08057098: .4byte sFrameData_306008
_0805709C: .4byte 0x00000236

	thumb_func_start FrozenRidleyXRidleySpawning
FrozenRidleyXRidleySpawning: @ 0x080570A0
	push {lr}
	ldr r2, _08057104 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080570BC
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_080570BC:
	mov r1, ip
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080570EE
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _08057108 @ =0x0000FFDF
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	adds r3, r2, #0
	adds r3, #0x2f
	movs r0, #0x1e
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_080570EE:
	ldr r2, _0805710C @ =gWrittenToMosaic_H
	ldr r1, _08057110 @ =sXParasiteMosaicValues
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08057104: .4byte gCurrentSprite
_08057108: .4byte 0x0000FFDF
_0805710C: .4byte gWrittenToMosaic_H
_08057110: .4byte sXParasiteMosaicValues

	thumb_func_start FrozenRidleyXFlyingAway
FrozenRidleyXFlyingAway: @ 0x08057114
	push {r4, r5, r6, lr}
	ldr r2, _08057144 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805712E
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_0805712E:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08057148
	subs r0, #1
	strb r0, [r1]
	b _08057198
	.align 2, 0
_08057144: .4byte gCurrentSprite
_08057148:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	movs r6, #0x31
	adds r6, r6, r2
	mov ip, r6
	ldrb r3, [r6]
	ldr r5, _08057184 @ =0x0839F718
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08057188 @ =0x00007FFF
	cmp r1, r0
	bne _0805718C
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08057196
	.align 2, 0
_08057184: .4byte 0x0839F718
_08057188: .4byte 0x00007FFF
_0805718C:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
_08057196:
	strh r0, [r2, #2]
_08057198:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FrozenRidley
FrozenRidley: @ 0x080571A0
	push {lr}
	ldr r0, _080571B8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _08057256
	lsls r0, r0, #2
	ldr r1, _080571BC @ =_080571C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080571B8: .4byte gCurrentSprite
_080571BC: .4byte _080571C0
_080571C0: @ jump table
	.4byte _08057234 @ case 0
	.4byte _0805723A @ case 1
	.4byte _08057240 @ case 2
	.4byte _08057256 @ case 3
	.4byte _08057256 @ case 4
	.4byte _08057256 @ case 5
	.4byte _08057256 @ case 6
	.4byte _08057256 @ case 7
	.4byte _08057256 @ case 8
	.4byte _08057256 @ case 9
	.4byte _08057256 @ case 10
	.4byte _08057256 @ case 11
	.4byte _08057256 @ case 12
	.4byte _08057256 @ case 13
	.4byte _08057256 @ case 14
	.4byte _08057256 @ case 15
	.4byte _08057256 @ case 16
	.4byte _08057256 @ case 17
	.4byte _08057256 @ case 18
	.4byte _08057256 @ case 19
	.4byte _08057256 @ case 20
	.4byte _08057256 @ case 21
	.4byte _08057256 @ case 22
	.4byte _08057256 @ case 23
	.4byte _08057246 @ case 24
	.4byte _08057256 @ case 25
	.4byte _0805724C @ case 26
	.4byte _08057256 @ case 27
	.4byte _08057252 @ case 28
_08057234:
	bl FrozenRidleyInit
	b _08057256
_0805723A:
	bl FrozenRidleyWaitForSamus
	b _08057256
_08057240:
	bl FrozenRidleySpawningX
	b _08057256
_08057246:
	bl FrozenRidleyClosingEye
	b _08057256
_0805724C:
	bl FrozenRidleyXSpawning
	b _08057256
_08057252:
	bl FrozenRidleyCrumbling
_08057256:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FrozenRidleyX
FrozenRidleyX: @ 0x0805725C
	push {lr}
	ldr r0, _08057274 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08057284
	cmp r0, #2
	bgt _08057278
	cmp r0, #0
	beq _0805727E
	b _0805728E
	.align 2, 0
_08057274: .4byte gCurrentSprite
_08057278:
	cmp r0, #0x18
	beq _0805728A
	b _0805728E
_0805727E:
	bl FrozenRidleyXInit
	b _0805728E
_08057284:
	bl FrozenRidleyXRidleySpawning
	b _0805728E
_0805728A:
	bl FrozenRidleyXFlyingAway
_0805728E:
	pop {r0}
	bx r0
	.align 2, 0
