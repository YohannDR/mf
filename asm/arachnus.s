    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ArachnusFire
ArachnusFire: @ 0x08024C34
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r3, _08024C80 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _08024C84 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	adds r4, r3, #0
	cmp r0, #0x42
	bne _08024C68
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x38
	beq _08024C68
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x28
	strb r0, [r1]
_08024C68:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x38
	bls _08024C74
	b _08024FD2
_08024C74:
	lsls r0, r0, #2
	ldr r1, _08024C88 @ =_08024C8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024C80: .4byte gCurrentSprite
_08024C84: .4byte gSpriteData
_08024C88: .4byte _08024C8C
_08024C8C: @ jump table
	.4byte _08024D70 @ case 0
	.4byte _08024FD2 @ case 1
	.4byte _08024E00 @ case 2
	.4byte _08024FD2 @ case 3
	.4byte _08024FD2 @ case 4
	.4byte _08024FD2 @ case 5
	.4byte _08024FD2 @ case 6
	.4byte _08024FD2 @ case 7
	.4byte _08024FD2 @ case 8
	.4byte _08024FD2 @ case 9
	.4byte _08024FD2 @ case 10
	.4byte _08024FD2 @ case 11
	.4byte _08024FD2 @ case 12
	.4byte _08024FD2 @ case 13
	.4byte _08024FD2 @ case 14
	.4byte _08024FD2 @ case 15
	.4byte _08024FD2 @ case 16
	.4byte _08024FD2 @ case 17
	.4byte _08024FD2 @ case 18
	.4byte _08024FD2 @ case 19
	.4byte _08024FD2 @ case 20
	.4byte _08024FD2 @ case 21
	.4byte _08024FD2 @ case 22
	.4byte _08024FD2 @ case 23
	.4byte _08024E60 @ case 24
	.4byte _08024FD2 @ case 25
	.4byte _08024EE0 @ case 26
	.4byte _08024FD2 @ case 27
	.4byte _08024F10 @ case 28
	.4byte _08024FD2 @ case 29
	.4byte _08024FD2 @ case 30
	.4byte _08024FD2 @ case 31
	.4byte _08024FD2 @ case 32
	.4byte _08024FD2 @ case 33
	.4byte _08024FD2 @ case 34
	.4byte _08024FD2 @ case 35
	.4byte _08024FD2 @ case 36
	.4byte _08024FD2 @ case 37
	.4byte _08024FD2 @ case 38
	.4byte _08024FD2 @ case 39
	.4byte _08024FD2 @ case 40
	.4byte _08024FD2 @ case 41
	.4byte _08024F40 @ case 42
	.4byte _08024FD2 @ case 43
	.4byte _08024F70 @ case 44
	.4byte _08024FD2 @ case 45
	.4byte _08024FD2 @ case 46
	.4byte _08024FD2 @ case 47
	.4byte _08024FD2 @ case 48
	.4byte _08024FD2 @ case 49
	.4byte _08024FD2 @ case 50
	.4byte _08024FD2 @ case 51
	.4byte _08024FD2 @ case 52
	.4byte _08024FD2 @ case 53
	.4byte _08024FD2 @ case 54
	.4byte _08024FC4 @ case 55
	.4byte _08024F90 @ case 56
_08024D70:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	movs r5, #0
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r4]
	ldr r0, _08024DD4 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x28
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	strb r3, [r0]
	adds r1, #2
	movs r0, #8
	strb r0, [r1]
	strh r5, [r4, #0xc]
	ldr r0, _08024DD8 @ =0x0000FFE8
	strh r0, [r4, #0xe]
	movs r0, #0x18
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r3, [r0]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	bne _08024DE4
	ldr r0, _08024DDC @ =0x08303170
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r5, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	ldr r0, _08024DE0 @ =0x0000FFD0
	strh r0, [r4, #0xa]
	b _08024FD2
	.align 2, 0
_08024DD4: .4byte 0x0000FFFB
_08024DD8: .4byte 0x0000FFE8
_08024DDC: .4byte 0x08303170
_08024DE0: .4byte 0x0000FFD0
_08024DE4:
	ldr r0, _08024DFC @ =0x08303138
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r5, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	b _08024E28
	.align 2, 0
_08024DFC: .4byte 0x08303138
_08024E00:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08024E34 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024E40
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08024E38 @ =0x08303138
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
_08024E28:
	ldr r0, _08024E3C @ =0x0000FFC0
	strh r0, [r4, #0xa]
	movs r0, #0xbd
	bl SoundPlay
	b _08024FD2
	.align 2, 0
_08024E34: .4byte gPreviousCollisionCheck
_08024E38: .4byte 0x08303138
_08024E3C: .4byte 0x0000FFC0
_08024E40:
	ldrh r0, [r4, #2]
	adds r0, #5
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08024E58
	ldrh r0, [r4, #4]
	adds r0, #6
	strh r0, [r4, #4]
	b _08024FD2
_08024E58:
	ldrh r0, [r4, #4]
	subs r0, #6
	strh r0, [r4, #4]
	b _08024FD2
_08024E60:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _08024EC6
	ldrb r0, [r4, #0x1e]
	cmp r0, #6
	bhi _08024EC6
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08024EA8
	ldrb r1, [r4, #0x1e]
	adds r1, #1
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x38
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1a
	bl SpriteSpawnSecondary
	b _08024EC6
_08024EA8:
	ldrb r1, [r4, #0x1e]
	adds r1, #1
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x38
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x1a
	bl SpriteSpawnSecondary
_08024EC6:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	bne _08024ED0
	b _08024FD2
_08024ED0:
	ldr r1, _08024EDC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	b _08024F22
	.align 2, 0
_08024EDC: .4byte gCurrentSprite
_08024EE0:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08024FD2
	ldr r1, _08024F04 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _08024F08 @ =0x083030C8
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _08024F0C @ =0x0000FF80
	strh r0, [r1, #0xa]
	b _08024FD2
	.align 2, 0
_08024F04: .4byte gCurrentSprite
_08024F08: .4byte 0x083030C8
_08024F0C: .4byte 0x0000FF80
_08024F10:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08024FD2
	ldr r1, _08024F34 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x2a
_08024F22:
	strb r0, [r2]
	ldr r0, _08024F38 @ =0x08303100
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _08024F3C @ =0x0000FFA0
	strh r0, [r1, #0xa]
	b _08024FD2
	.align 2, 0
_08024F34: .4byte gCurrentSprite
_08024F38: .4byte 0x08303100
_08024F3C: .4byte 0x0000FFA0
_08024F40:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08024FD2
	ldr r1, _08024F64 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x2c
	strb r0, [r2]
	ldr r0, _08024F68 @ =0x08303138
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _08024F6C @ =0x0000FFC0
	strh r0, [r1, #0xa]
	b _08024FD2
	.align 2, 0
_08024F64: .4byte gCurrentSprite
_08024F68: .4byte 0x08303138
_08024F6C: .4byte 0x0000FFC0
_08024F70:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08024FD2
	ldr r1, _08024F8C @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x25
	bl ParticleSet
	b _08024FD2
	.align 2, 0
_08024F8C: .4byte gCurrentSprite
_08024F90:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08024FC0 @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08024FAA
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
_08024FAA:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08024FD2
	strh r0, [r4]
	b _08024FD2
	.align 2, 0
_08024FC0: .4byte gFrameCounter8Bit
_08024FC4:
	movs r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x25
	bl ParticleSet
_08024FD2:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ArachnusSlash
ArachnusSlash: @ 0x08024FDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r2, _08025028 @ =gSpriteData
	ldr r3, _0802502C @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	adds r2, r3, #0
	cmp r0, #0x42
	bne _08025010
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x38
	beq _08025010
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x28
	strb r0, [r1]
_08025010:
	adds r5, r2, #0
	adds r7, r5, #0
	adds r7, #0x24
	ldrb r6, [r7]
	cmp r6, #2
	beq _080250F8
	cmp r6, #2
	bgt _08025030
	cmp r6, #0
	beq _08025038
	b _080251BA
	.align 2, 0
_08025028: .4byte gSpriteData
_0802502C: .4byte gCurrentSprite
_08025030:
	cmp r6, #0x38
	bne _08025036
	b _0802518C
_08025036:
	b _080251BA
_08025038:
	ldrh r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r2, r1, #0
	movs r4, #0
	orrs r2, r0
	adds r3, r5, #0
	adds r3, #0x34
	ldrb r1, [r3]
	movs r0, #4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080250B0 @ =0x0000FFFB
	ands r2, r0
	strh r2, [r5]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _080250B4 @ =0x0000FF40
	strh r0, [r5, #0xa]
	strh r6, [r5, #0xc]
	adds r0, #0xa0
	strh r0, [r5, #0xe]
	movs r0, #0x20
	strh r0, [r5, #0x10]
	ldr r0, _080250B8 @ =0x08303198
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r6, [r5, #0x16]
	subs r1, #4
	movs r0, #2
	strb r0, [r1]
	strb r0, [r7]
	movs r4, #0x40
	ands r2, r4
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	cmp r1, #0
	beq _080250BC
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0xc
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _080250D0
	.align 2, 0
_080250B0: .4byte 0x0000FFFB
_080250B4: .4byte 0x0000FF40
_080250B8: .4byte 0x08303198
_080250BC:
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0xc
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
_080250D0:
	movs r0, #0x20
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	bne _080250EC
	ldr r1, _080250E8 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _080251BA
	.align 2, 0
_080250E8: .4byte gCurrentSprite
_080250EC:
	ldr r0, _080250F4 @ =gCurrentSprite
	adds r0, #0x2f
	strb r1, [r0]
	b _080251BA
	.align 2, 0
_080250F4: .4byte gCurrentSprite
_080250F8:
	ldrh r0, [r5, #2]
	subs r0, #0x60
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0802514C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025154
	movs r2, #0
	strh r2, [r5]
	ldr r3, _08025150 @ =gSpriteData
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r2, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0x60
	ldrh r1, [r5, #4]
	movs r2, #0x25
	bl ParticleSet
	ldrh r0, [r5, #2]
	subs r0, #0x20
	ldrh r1, [r5, #4]
	movs r2, #0x25
	bl ParticleSet
	ldrh r0, [r5, #2]
	subs r0, #0xa0
	ldrh r1, [r5, #4]
	movs r2, #0x25
	bl ParticleSet
	movs r0, #0xbf
	bl SoundPlayNotAlreadyPlaying
	b _080251BA
	.align 2, 0
_0802514C: .4byte gPreviousCollisionCheck
_08025150: .4byte gSpriteData
_08025154:
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08025164
	ldrh r0, [r5, #4]
	adds r0, #0xc
	b _08025168
_08025164:
	ldrh r0, [r5, #4]
	subs r0, #0xc
_08025168:
	strh r0, [r5, #4]
	ldr r3, _08025184 @ =gSpriteData
	ldr r2, _08025188 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r2, #4]
	strh r1, [r0, #4]
	b _080251BA
	.align 2, 0
_08025184: .4byte gSpriteData
_08025188: .4byte gCurrentSprite
_0802518C:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r1, _080251C4 @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080251A6
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
_080251A6:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080251BA
	strh r0, [r2]
_080251BA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080251C4: .4byte gFrameCounter8Bit

	thumb_func_start ArachnusSlashTrail
ArachnusSlashTrail: @ 0x080251C8
	push {r4, r5, r6, lr}
	ldr r2, _080251EC @ =gSpriteData
	ldr r0, _080251F0 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x42
	bne _080251F4
	movs r0, #0
	mov r1, ip
	strh r0, [r1]
	b _0802525E
	.align 2, 0
_080251EC: .4byte gSpriteData
_080251F0: .4byte gCurrentSprite
_080251F4:
	mov r1, ip
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x24
	ldrb r5, [r6]
	cmp r5, #0
	bne _0802525E
	mov r3, ip
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r2, r1, #0
	movs r4, #0
	orrs r2, r0
	adds r3, #0x34
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _08025264 @ =0x0000FFFB
	ands r2, r0
	mov r3, ip
	strh r2, [r3]
	mov r0, ip
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #0x40
	strb r0, [r1]
	ldr r1, _08025268 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldr r0, _0802526C @ =0x083031B8
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r5, [r3, #0x16]
	mov r0, ip
	adds r0, #0x25
	strb r4, [r0]
	strb r2, [r6]
_0802525E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025264: .4byte 0x0000FFFB
_08025268: .4byte 0x0000FFFC
_0802526C: .4byte 0x083031B8
