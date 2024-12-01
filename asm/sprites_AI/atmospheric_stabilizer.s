    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start AtmosphericStabilizerInit
AtmosphericStabilizerInit: @ 0x0802C7A0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, _0802C800 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x22
	movs r5, #0
	movs r0, #0xc
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	movs r3, #0
	strh r0, [r4, #2]
	ldr r2, _0802C804 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	strb r3, [r4, #0x1c]
	strh r5, [r4, #0x16]
	adds r0, #5
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bl SpriteUtilChooseRandomXDirection
	ldrb r0, [r4, #0x1d]
	subs r0, #0x2c
	cmp r0, #4
	bls _0802C7F6
	b _0802CA18
_0802C7F6:
	lsls r0, r0, #2
	ldr r1, _0802C808 @ =_0802C80C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802C800: .4byte gCurrentSprite
_0802C804: .4byte sPrimarySpriteStats
_0802C808: .4byte _0802C80C
_0802C80C: @ jump table
	.4byte _0802C820 @ case 0
	.4byte _0802C86C @ case 1
	.4byte _0802C820 @ case 2
	.4byte _0802C840 @ case 3
	.4byte _0802C840 @ case 4
_0802C820:
	movs r6, #0x23
	ldr r1, _0802C838 @ =gCurrentSprite
	movs r3, #0
	ldr r2, _0802C83C @ =0x0000FFA0
	strh r2, [r1, #0xa]
	movs r0, #0x60
	strh r0, [r1, #0xc]
	strh r2, [r1, #0xe]
	movs r0, #0x20
	strh r0, [r1, #0x10]
	b _0802C854
	.align 2, 0
_0802C838: .4byte gCurrentSprite
_0802C83C: .4byte 0x0000FFA0
_0802C840:
	movs r6, #0x24
	ldr r1, _0802C860 @ =gCurrentSprite
	movs r3, #0
	ldr r0, _0802C864 @ =0x0000FFA0
	strh r0, [r1, #0xa]
	movs r2, #0x60
	strh r2, [r1, #0xc]
	adds r0, #0x40
	strh r0, [r1, #0xe]
	strh r2, [r1, #0x10]
_0802C854:
	adds r0, r1, #0
	adds r0, #0x2f
	strb r3, [r0]
	ldr r0, _0802C868 @ =sAtmosphericStabilizerOam_3277f8
	b _0802C888
	.align 2, 0
_0802C860: .4byte gCurrentSprite
_0802C864: .4byte 0x0000FFA0
_0802C868: .4byte sAtmosphericStabilizerOam_3277f8
_0802C86C:
	movs r6, #0x13
	ldr r1, _0802C8C0 @ =gCurrentSprite
	ldr r2, _0802C8C4 @ =0x0000FFA0
	strh r2, [r1, #0xa]
	movs r0, #0x20
	strh r0, [r1, #0xc]
	strh r2, [r1, #0xe]
	movs r0, #0x60
	strh r0, [r1, #0x10]
	adds r2, r1, #0
	adds r2, #0x2f
	movs r0, #1
	strb r0, [r2]
	ldr r0, _0802C8C8 @ =sAtmosphericStabilizerOam_327660
_0802C888:
	str r0, [r1, #0x18]
	adds r4, r1, #0
	ldrb r2, [r4, #0x1d]
	adds r0, r2, #0
	subs r0, #0x2c
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _0802C8CC @ =gAtmosphericStabilizersOnline
	ldrh r0, [r0]
	asrs r0, r2
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #1
	ands r5, r0
	cmp r5, #0
	beq _0802C8E4
	adds r1, #0x25
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C8D4
	ldr r0, _0802C8D0 @ =sAtmosphericStabilizerOam_327640
	b _0802C8D6
	.align 2, 0
_0802C8C0: .4byte gCurrentSprite
_0802C8C4: .4byte 0x0000FFA0
_0802C8C8: .4byte sAtmosphericStabilizerOam_327660
_0802C8CC: .4byte gAtmosphericStabilizersOnline
_0802C8D0: .4byte sAtmosphericStabilizerOam_327640
_0802C8D4:
	ldr r0, _0802C8E0 @ =sAtmosphericStabilizerOam_3277d8
_0802C8D6:
	str r0, [r4, #0x18]
	movs r0, #0xfe
	bl SoundPlay
	b _0802CA26
	.align 2, 0
_0802C8E0: .4byte sAtmosphericStabilizerOam_3277d8
_0802C8E4:
	adds r2, r4, #0
	adds r2, #0x25
	movs r0, #2
	strb r0, [r2]
	cmp r6, #0x23
	bne _0802C94E
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x23
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _0802C914
	b _0802CA18
_0802C914:
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x23
	movs r1, #1
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _0802CA18
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x2b
	movs r1, #1
	b _0802CA0C
_0802C94E:
	cmp r6, #0x24
	bne _0802C9AE
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x24
	movs r1, #2
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _0802CA18
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x24
	movs r1, #3
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _0802CA18
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x2b
	movs r1, #2
	b _0802CA0C
_0802C9AE:
	cmp r6, #0x13
	bne _0802CA1C
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x13
	movs r1, #4
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _0802CA18
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x13
	movs r1, #5
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _0802CA18
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x2b
	movs r1, #3
_0802CA0C:
	bl SpriteSpawnNewXParasite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _0802CA20
_0802CA18:
	strh r5, [r4]
	b _0802CA2E
_0802CA1C:
	strh r5, [r1]
	b _0802CA2E
_0802CA20:
	movs r0, #0xff
	bl SoundPlay
_0802CA26:
	ldr r0, _0802CA38 @ =gCurrentSprite
	adds r0, #0x2a
	movs r1, #0x10
	strb r1, [r0]
_0802CA2E:
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802CA38: .4byte gCurrentSprite

	thumb_func_start AtmosphericStabilizerBackOnlineInit
AtmosphericStabilizerBackOnlineInit: @ 0x0802CA3C
	push {lr}
	ldr r3, _0802CA64 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	movs r0, #0
	strh r1, [r3, #0x16]
	adds r2, #1
	strb r0, [r2]
	strh r1, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802CA6C
	ldr r0, _0802CA68 @ =sAtmosphericStabilizerOam_3276e0
	b _0802CA6E
	.align 2, 0
_0802CA64: .4byte gCurrentSprite
_0802CA68: .4byte sAtmosphericStabilizerOam_3276e0
_0802CA6C:
	ldr r0, _0802CA7C @ =sAtmosphericStabilizerOam_327878
_0802CA6E:
	str r0, [r3, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0802CA7C: .4byte sAtmosphericStabilizerOam_327878

	thumb_func_start AtmosphericStabilizerBackOnline
AtmosphericStabilizerBackOnline: @ 0x0802CA80
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802CABA
	ldr r3, _0802CAA8 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802CAB0
	ldr r0, _0802CAAC @ =sAtmosphericStabilizerOam_327640
	b _0802CAB2
	.align 2, 0
_0802CAA8: .4byte gCurrentSprite
_0802CAAC: .4byte sAtmosphericStabilizerOam_327640
_0802CAB0:
	ldr r0, _0802CAC0 @ =sAtmosphericStabilizerOam_3277d8
_0802CAB2:
	str r0, [r3, #0x18]
	movs r0, #1
	bl StartStopEventBasedEffect
_0802CABA:
	pop {r0}
	bx r0
	.align 2, 0
_0802CAC0: .4byte sAtmosphericStabilizerOam_3277d8

	thumb_func_start AtmosphericStabilizerCoverInit
AtmosphericStabilizerCoverInit: @ 0x0802CAC4
	push {r4, lr}
	ldr r0, _0802CB1C @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x25
	movs r4, #0
	movs r3, #2
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0802CB20 @ =sSecondarySpriteStats
	mov r2, ip
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r2, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r0, ip
	strb r2, [r0, #0x1c]
	strh r4, [r0, #0x16]
	adds r0, #0x24
	strb r3, [r0]
	mov r1, ip
	ldrb r0, [r1, #0x1e]
	mov r2, ip
	cmp r0, #7
	bls _0802CB12
	b _0802CC34
_0802CB12:
	lsls r0, r0, #2
	ldr r1, _0802CB24 @ =_0802CB28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CB1C: .4byte gCurrentSprite
_0802CB20: .4byte sSecondarySpriteStats
_0802CB24: .4byte _0802CB28
_0802CB28: @ jump table
	.4byte _0802CB48 @ case 0
	.4byte _0802CB74 @ case 1
	.4byte _0802CB84 @ case 2
	.4byte _0802CBA8 @ case 3
	.4byte _0802CBC0 @ case 4
	.4byte _0802CBE4 @ case 5
	.4byte _0802CBF4 @ case 6
	.4byte _0802CC1C @ case 7
_0802CB48:
	ldrh r1, [r2]
	ldr r0, _0802CB68 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0802CB6C @ =sAtmosphericStabilizerOam_327a30
	str r0, [r2, #0x18]
	ldr r0, _0802CB70 @ =0x0000FFA0
	strh r0, [r2, #0xa]
	adds r0, #0x40
	strh r0, [r2, #0xc]
	movs r0, #0x20
	strh r0, [r2, #0xe]
	movs r0, #0x60
	strh r0, [r2, #0x10]
	b _0802CC38
	.align 2, 0
_0802CB68: .4byte 0x0000FFFB
_0802CB6C: .4byte sAtmosphericStabilizerOam_327a30
_0802CB70: .4byte 0x0000FFA0
_0802CB74:
	ldr r0, _0802CB80 @ =sAtmosphericStabilizerOam_327a30
	str r0, [r2, #0x18]
	movs r1, #0x20
	strh r1, [r2, #0xa]
	b _0802CC26
	.align 2, 0
_0802CB80: .4byte sAtmosphericStabilizerOam_327a30
_0802CB84:
	ldrh r1, [r2]
	ldr r0, _0802CB9C @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0802CBA0 @ =sAtmosphericStabilizerOam_327a40
	str r0, [r2, #0x18]
	movs r0, #0x20
	strh r0, [r2, #0xa]
	movs r0, #0x60
	strh r0, [r2, #0xc]
	ldr r0, _0802CBA4 @ =0x0000FFA0
	b _0802CC08
	.align 2, 0
_0802CB9C: .4byte 0x0000FFFB
_0802CBA0: .4byte sAtmosphericStabilizerOam_327a40
_0802CBA4: .4byte 0x0000FFA0
_0802CBA8:
	ldr r0, _0802CBB4 @ =sAtmosphericStabilizerOam_327a40
	str r0, [r2, #0x18]
	ldr r1, _0802CBB8 @ =0x0000FFA0
	strh r1, [r2, #0xa]
	ldr r0, _0802CBBC @ =0x0000FFE0
	b _0802CC28
	.align 2, 0
_0802CBB4: .4byte sAtmosphericStabilizerOam_327a40
_0802CBB8: .4byte 0x0000FFA0
_0802CBBC: .4byte 0x0000FFE0
_0802CBC0:
	ldrh r1, [r2]
	ldr r0, _0802CBD8 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0802CBDC @ =sAtmosphericStabilizerOam_327a20
	str r0, [r2, #0x18]
	movs r0, #0x20
	strh r0, [r2, #0xa]
	movs r0, #0x60
	strh r0, [r2, #0xc]
	ldr r0, _0802CBE0 @ =0x0000FFA0
	b _0802CC08
	.align 2, 0
_0802CBD8: .4byte 0x0000FFFB
_0802CBDC: .4byte sAtmosphericStabilizerOam_327a20
_0802CBE0: .4byte 0x0000FFA0
_0802CBE4:
	ldr r0, _0802CBF0 @ =sAtmosphericStabilizerOam_327a20
	str r0, [r2, #0x18]
	movs r1, #0x20
	strh r1, [r2, #0xa]
	b _0802CC26
	.align 2, 0
_0802CBF0: .4byte sAtmosphericStabilizerOam_327a20
_0802CBF4:
	ldrh r1, [r2]
	ldr r0, _0802CC10 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	ldr r0, _0802CC14 @ =sAtmosphericStabilizerOam_327a60
	str r0, [r2, #0x18]
	ldr r0, _0802CC18 @ =0x0000FFA0
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
_0802CC08:
	strh r0, [r2, #0xe]
	adds r0, #0x40
	strh r0, [r2, #0x10]
	b _0802CC38
	.align 2, 0
_0802CC10: .4byte 0x0000FFFB
_0802CC14: .4byte sAtmosphericStabilizerOam_327a60
_0802CC18: .4byte 0x0000FFA0
_0802CC1C:
	ldr r0, _0802CC30 @ =sAtmosphericStabilizerOam_327a60
	str r0, [r2, #0x18]
	movs r1, #0
	movs r0, #0x20
	strh r0, [r2, #0xa]
_0802CC26:
	movs r0, #0x60
_0802CC28:
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	b _0802CC38
	.align 2, 0
_0802CC30: .4byte sAtmosphericStabilizerOam_327a60
_0802CC34:
	mov r2, ip
	strh r4, [r2]
_0802CC38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AtmosphericStabilizerCoverIdle
AtmosphericStabilizerCoverIdle: @ 0x0802CC40
	push {lr}
	ldr r3, _0802CC74 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0802CC78 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r3, #2]
	ldrh r1, [r0, #4]
	strh r1, [r3, #4]
	adds r0, #0x24
	ldrb r2, [r0]
	cmp r2, #0x18
	bne _0802CC8A
	ldrh r1, [r3]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0802CC7C
	movs r0, #0
	strh r0, [r3]
	b _0802CC8A
	.align 2, 0
_0802CC74: .4byte gCurrentSprite
_0802CC78: .4byte gSpriteData
_0802CC7C:
	adds r0, r3, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0
	strb r0, [r1]
_0802CC8A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AtmosphericStabilizerCoverExploding
AtmosphericStabilizerCoverExploding: @ 0x0802CC90
	push {r4, r5, r6, r7, lr}
	ldr r6, _0802CCCC @ =gCurrentSprite
	ldrh r4, [r6, #2]
	ldrh r5, [r6, #4]
	ldrh r0, [r6]
	movs r1, #4
	eors r0, r1
	strh r0, [r6]
	adds r7, r6, #0
	adds r7, #0x2e
	ldrb r1, [r7]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0802CCB4
	ldr r0, _0802CCD0 @ =0x000001BF
	bl SoundPlay
_0802CCB4:
	ldrb r0, [r6, #0x1e]
	cmp r0, #0
	bne _0802CDAA
	ldrb r0, [r7]
	cmp r0, #0x18
	bls _0802CCC2
	b _0802D096
_0802CCC2:
	lsls r0, r0, #2
	ldr r1, _0802CCD4 @ =_0802CCD8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CCCC: .4byte gCurrentSprite
_0802CCD0: .4byte 0x000001BF
_0802CCD4: .4byte _0802CCD8
_0802CCD8: @ jump table
	.4byte _0802CD3C @ case 0
	.4byte _0802D096 @ case 1
	.4byte _0802CD44 @ case 2
	.4byte _0802D096 @ case 3
	.4byte _0802CD4C @ case 4
	.4byte _0802D096 @ case 5
	.4byte _0802CD56 @ case 6
	.4byte _0802D024 @ case 7
	.4byte _0802CD5C @ case 8
	.4byte _0802CD66 @ case 9
	.4byte _0802CD70 @ case 10
	.4byte _0802D096 @ case 11
	.4byte _0802CD78 @ case 12
	.4byte _0802D096 @ case 13
	.4byte _0802CD82 @ case 14
	.4byte _0802D096 @ case 15
	.4byte _0802CD8C @ case 16
	.4byte _0802CD96 @ case 17
	.4byte _0802CDA0 @ case 18
	.4byte _0802D080 @ case 19
	.4byte _0802D096 @ case 20
	.4byte _0802D096 @ case 21
	.4byte _0802D096 @ case 22
	.4byte _0802D096 @ case 23
	.4byte _0802D090 @ case 24
_0802CD3C:
	adds r0, r4, #0
	subs r0, #0x30
	adds r1, r5, #4
	b _0802D088
_0802CD44:
	adds r0, r4, #0
	adds r0, #0x40
	subs r1, r5, #4
	b _0802D088
_0802CD4C:
	adds r0, r4, #0
	subs r0, #8
	adds r1, r5, #0
	subs r1, #0x40
	b _0802D088
_0802CD56:
	adds r0, r4, #0
	subs r0, #0x26
	b _0802D028
_0802CD5C:
	adds r0, r4, #0
	subs r0, #0x3c
	adds r1, r5, #0
	adds r1, #0x3c
	b _0802D088
_0802CD66:
	adds r0, r4, #0
	adds r0, #0x32
	adds r1, r5, #0
	adds r1, #0x32
	b _0802D088
_0802CD70:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	b _0802D02C
_0802CD78:
	adds r0, r4, #0
	adds r0, #0x50
	adds r1, r5, #0
	subs r1, #0x34
	b _0802D088
_0802CD82:
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	subs r1, #0x44
	b _0802D088
_0802CD8C:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _0802D088
_0802CD96:
	adds r0, r4, #0
	adds r0, #0x58
	adds r1, r5, #0
	adds r1, #0x10
	b _0802D088
_0802CDA0:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	adds r1, #0x50
	b _0802D088
_0802CDAA:
	cmp r0, #2
	bne _0802CE96
	ldrb r0, [r7]
	cmp r0, #0x18
	bls _0802CDB6
	b _0802D096
_0802CDB6:
	lsls r0, r0, #2
	ldr r1, _0802CDC0 @ =_0802CDC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CDC0: .4byte _0802CDC4
_0802CDC4: @ jump table
	.4byte _0802CE28 @ case 0
	.4byte _0802D096 @ case 1
	.4byte _0802CE30 @ case 2
	.4byte _0802D096 @ case 3
	.4byte _0802CE38 @ case 4
	.4byte _0802D096 @ case 5
	.4byte _0802CE42 @ case 6
	.4byte _0802D024 @ case 7
	.4byte _0802CE48 @ case 8
	.4byte _0802CE52 @ case 9
	.4byte _0802CE5C @ case 10
	.4byte _0802D096 @ case 11
	.4byte _0802CE64 @ case 12
	.4byte _0802D096 @ case 13
	.4byte _0802CE6E @ case 14
	.4byte _0802D096 @ case 15
	.4byte _0802CE78 @ case 16
	.4byte _0802CE82 @ case 17
	.4byte _0802CE8C @ case 18
	.4byte _0802D080 @ case 19
	.4byte _0802D096 @ case 20
	.4byte _0802D096 @ case 21
	.4byte _0802D096 @ case 22
	.4byte _0802D096 @ case 23
	.4byte _0802D090 @ case 24
_0802CE28:
	adds r0, r4, #0
	subs r0, #0x30
	adds r1, r5, #4
	b _0802D088
_0802CE30:
	adds r0, r4, #0
	adds r0, #0x40
	subs r1, r5, #4
	b _0802D088
_0802CE38:
	adds r0, r4, #0
	subs r0, #8
	adds r1, r5, #0
	adds r1, #0x40
	b _0802D088
_0802CE42:
	adds r0, r4, #0
	subs r0, #0x26
	b _0802D028
_0802CE48:
	adds r0, r4, #0
	subs r0, #0x3c
	adds r1, r5, #0
	adds r1, #0x3c
	b _0802D088
_0802CE52:
	adds r0, r4, #0
	adds r0, #0x32
	adds r1, r5, #0
	adds r1, #0x32
	b _0802D088
_0802CE5C:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	b _0802D02C
_0802CE64:
	adds r0, r4, #0
	adds r0, #0x50
	adds r1, r5, #0
	subs r1, #0x34
	b _0802D088
_0802CE6E:
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0x44
	b _0802D088
_0802CE78:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _0802D088
_0802CE82:
	adds r0, r4, #0
	adds r0, #0x48
	adds r1, r5, #0
	subs r1, #8
	b _0802D088
_0802CE8C:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	adds r1, #0x50
	b _0802D088
_0802CE96:
	cmp r0, #4
	bne _0802CF82
	ldrb r0, [r7]
	cmp r0, #0x18
	bls _0802CEA2
	b _0802D096
_0802CEA2:
	lsls r0, r0, #2
	ldr r1, _0802CEAC @ =_0802CEB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CEAC: .4byte _0802CEB0
_0802CEB0: @ jump table
	.4byte _0802CF14 @ case 0
	.4byte _0802D096 @ case 1
	.4byte _0802CF1C @ case 2
	.4byte _0802D096 @ case 3
	.4byte _0802CF24 @ case 4
	.4byte _0802D096 @ case 5
	.4byte _0802CF2E @ case 6
	.4byte _0802D024 @ case 7
	.4byte _0802CF34 @ case 8
	.4byte _0802CF3E @ case 9
	.4byte _0802CF48 @ case 10
	.4byte _0802D096 @ case 11
	.4byte _0802CF50 @ case 12
	.4byte _0802D096 @ case 13
	.4byte _0802CF5A @ case 14
	.4byte _0802D096 @ case 15
	.4byte _0802CF64 @ case 16
	.4byte _0802CF6E @ case 17
	.4byte _0802CF78 @ case 18
	.4byte _0802D080 @ case 19
	.4byte _0802D096 @ case 20
	.4byte _0802D096 @ case 21
	.4byte _0802D096 @ case 22
	.4byte _0802D096 @ case 23
	.4byte _0802D090 @ case 24
_0802CF14:
	adds r0, r4, #0
	subs r0, #0x30
	adds r1, r5, #4
	b _0802D088
_0802CF1C:
	adds r1, r5, #0
	subs r1, #0x48
	adds r0, r4, #0
	b _0802D088
_0802CF24:
	adds r0, r4, #0
	subs r0, #8
	adds r1, r5, #0
	adds r1, #0x40
	b _0802D088
_0802CF2E:
	adds r0, r4, #0
	subs r0, #0x26
	b _0802D028
_0802CF34:
	adds r0, r4, #0
	subs r0, #0x3c
	adds r1, r5, #0
	adds r1, #0x3c
	b _0802D088
_0802CF3E:
	adds r0, r4, #0
	adds r0, #0x32
	adds r1, r5, #0
	adds r1, #0x32
	b _0802D088
_0802CF48:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	b _0802D088
_0802CF50:
	adds r0, r4, #0
	adds r0, #0x50
	adds r1, r5, #0
	subs r1, #0x34
	b _0802D088
_0802CF5A:
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0x44
	b _0802D088
_0802CF64:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _0802D088
_0802CF6E:
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	subs r1, #0x40
	b _0802D088
_0802CF78:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	adds r1, #0x50
	b _0802D088
_0802CF82:
	cmp r0, #6
	beq _0802CF88
	b _0802D0A8
_0802CF88:
	ldrb r0, [r7]
	cmp r0, #0x18
	bls _0802CF90
	b _0802D096
_0802CF90:
	lsls r0, r0, #2
	ldr r1, _0802CF9C @ =_0802CFA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802CF9C: .4byte _0802CFA0
_0802CFA0: @ jump table
	.4byte _0802D004 @ case 0
	.4byte _0802D096 @ case 1
	.4byte _0802D00C @ case 2
	.4byte _0802D096 @ case 3
	.4byte _0802D014 @ case 4
	.4byte _0802D096 @ case 5
	.4byte _0802D01E @ case 6
	.4byte _0802D024 @ case 7
	.4byte _0802D034 @ case 8
	.4byte _0802D03E @ case 9
	.4byte _0802D048 @ case 10
	.4byte _0802D096 @ case 11
	.4byte _0802D050 @ case 12
	.4byte _0802D096 @ case 13
	.4byte _0802D058 @ case 14
	.4byte _0802D096 @ case 15
	.4byte _0802D062 @ case 16
	.4byte _0802D06C @ case 17
	.4byte _0802D076 @ case 18
	.4byte _0802D080 @ case 19
	.4byte _0802D096 @ case 20
	.4byte _0802D096 @ case 21
	.4byte _0802D096 @ case 22
	.4byte _0802D096 @ case 23
	.4byte _0802D090 @ case 24
_0802D004:
	adds r0, r4, #0
	subs r0, #0x30
	adds r1, r5, #4
	b _0802D088
_0802D00C:
	adds r1, r5, #0
	subs r1, #0x48
	adds r0, r4, #0
	b _0802D088
_0802D014:
	adds r0, r4, #0
	subs r0, #8
	adds r1, r5, #0
	adds r1, #0x40
	b _0802D088
_0802D01E:
	adds r0, r4, #0
	subs r0, #0x26
	b _0802D028
_0802D024:
	adds r0, r4, #0
	adds r0, #0x26
_0802D028:
	adds r1, r5, #0
	subs r1, #0x30
_0802D02C:
	movs r2, #0x26
	bl ParticleSet
	b _0802D096
_0802D034:
	adds r0, r4, #0
	subs r0, #0x3c
	adds r1, r5, #0
	adds r1, #0x3c
	b _0802D088
_0802D03E:
	adds r0, r4, #0
	adds r0, #0x32
	adds r1, r5, #0
	adds r1, #0x32
	b _0802D088
_0802D048:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	b _0802D088
_0802D050:
	adds r0, r4, #0
	adds r0, #0x50
	adds r1, r5, #0
	b _0802D088
_0802D058:
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0x44
	b _0802D088
_0802D062:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _0802D088
_0802D06C:
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	subs r1, #0x40
	b _0802D088
_0802D076:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	adds r1, #0x50
	b _0802D088
_0802D080:
	adds r0, r4, #0
	adds r0, #0x4e
	adds r1, r5, #0
	adds r1, #0x48
_0802D088:
	movs r2, #0x25
	bl ParticleSet
	b _0802D096
_0802D090:
	ldr r1, _0802D0A4 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_0802D096:
	ldr r1, _0802D0A4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _0802D0AE
	.align 2, 0
_0802D0A4: .4byte gCurrentSprite
_0802D0A8:
	movs r0, #0
	strh r0, [r6]
	adds r1, r6, #0
_0802D0AE:
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0x19
	bne _0802D136
	ldr r0, _0802D100 @ =gAtmosphericStabilizersOnline
	ldrh r2, [r0]
	adds r3, r2, #0
	movs r0, #1
	ands r0, r2
	movs r1, #2
	ands r1, r2
	cmp r1, #0
	beq _0802D0CC
	adds r0, #1
_0802D0CC:
	movs r1, #4
	ands r1, r2
	cmp r1, #0
	beq _0802D0DA
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0802D0DA:
	movs r1, #8
	ands r2, r1
	cmp r2, #0
	beq _0802D0E8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0802D0E8:
	movs r1, #0x10
	ands r3, r1
	cmp r3, #0
	beq _0802D0F6
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_0802D0F6:
	cmp r0, #1
	bne _0802D104
	movs r1, #1
	b _0802D122
	.align 2, 0
_0802D100: .4byte gAtmosphericStabilizersOnline
_0802D104:
	cmp r0, #2
	bne _0802D10C
	movs r1, #2
	b _0802D122
_0802D10C:
	cmp r0, #3
	bne _0802D114
	movs r1, #3
	b _0802D122
_0802D114:
	cmp r0, #4
	bne _0802D11C
	movs r1, #4
	b _0802D122
_0802D11C:
	cmp r0, #5
	bne _0802D136
	movs r1, #5
_0802D122:
	cmp r0, #0
	beq _0802D136
	adds r0, r1, #0
	bl TrySpawnMessageBanner
	ldr r1, _0802D13C @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
_0802D136:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D13C: .4byte gPreventMovementTimer

	thumb_func_start AtmosphericStabilizerParasiteInit
AtmosphericStabilizerParasiteInit: @ 0x0802D140
	push {r4, lr}
	ldr r3, _0802D194 @ =gCurrentSprite
	ldrh r1, [r3]
	ldr r0, _0802D198 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #3
	movs r0, #5
	strb r0, [r1]
	adds r1, #0x13
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0802D19C @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r0, [r3, #0x1e]
	adds r1, r3, #0
	cmp r0, #2
	beq _0802D1C4
	cmp r0, #2
	bgt _0802D1A0
	cmp r0, #1
	beq _0802D1AA
	b _0802D208
	.align 2, 0
_0802D194: .4byte gCurrentSprite
_0802D198: .4byte 0x0000FFFB
_0802D19C: .4byte sPrimarySpriteStats
_0802D1A0:
	cmp r0, #3
	beq _0802D1D0
	cmp r0, #4
	beq _0802D1EC
	b _0802D208
_0802D1AA:
	ldr r0, _0802D1BC @ =0x0000FFE0
	strh r0, [r1, #0xa]
	movs r0, #0x20
	strh r0, [r1, #0xc]
	ldr r0, _0802D1C0 @ =0x0000FFE8
	strh r0, [r1, #0xe]
	movs r0, #0x30
	strh r0, [r1, #0x10]
	b _0802D20C
	.align 2, 0
_0802D1BC: .4byte 0x0000FFE0
_0802D1C0: .4byte 0x0000FFE8
_0802D1C4:
	ldr r0, _0802D1CC @ =0x0000FFE0
	strh r0, [r1, #0xa]
	movs r0, #0x20
	b _0802D1F2
	.align 2, 0
_0802D1CC: .4byte 0x0000FFE0
_0802D1D0:
	ldr r0, _0802D1E4 @ =0x0000FFE8
	strh r0, [r1, #0xa]
	movs r0, #0x30
	strh r0, [r1, #0xc]
	ldr r0, _0802D1E8 @ =0x0000FFE0
	strh r0, [r1, #0xe]
	movs r0, #0x20
	strh r0, [r1, #0x10]
	b _0802D20C
	.align 2, 0
_0802D1E4: .4byte 0x0000FFE8
_0802D1E8: .4byte 0x0000FFE0
_0802D1EC:
	ldr r0, _0802D200 @ =0x0000FFE8
	strh r0, [r1, #0xa]
	movs r0, #0x30
_0802D1F2:
	strh r0, [r1, #0xc]
	ldr r0, _0802D204 @ =0x0000FFD0
	strh r0, [r1, #0xe]
	movs r0, #0x18
	strh r0, [r1, #0x10]
	b _0802D20C
	.align 2, 0
_0802D200: .4byte 0x0000FFE8
_0802D204: .4byte 0x0000FFD0
_0802D208:
	movs r0, #0
	strh r0, [r1]
_0802D20C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start AtmosphericStabilizerParasiteIdleInit
AtmosphericStabilizerParasiteIdleInit: @ 0x0802D214
	ldr r0, _0802D230 @ =gCurrentSprite
	ldr r1, _0802D234 @ =sAtmosphericStabilizerOam_327970
	str r1, [r0, #0x18]
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
	adds r2, r0, #0
	adds r2, #0x2e
	movs r1, #0x78
	strb r1, [r2]
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802D230: .4byte gCurrentSprite
_0802D234: .4byte sAtmosphericStabilizerOam_327970

	thumb_func_start AtmosphericStabilizerParasiteIdle
AtmosphericStabilizerParasiteIdle: @ 0x0802D238
	push {r4, lr}
	ldr r4, _0802D268 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0802D26C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r0, [r0, #4]
	strh r0, [r4, #4]
	bl CountPrimarySpritesThatCantAbsorbX
	cmp r0, #4
	ble _0802D270
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	b _0802D2AA
	.align 2, 0
_0802D268: .4byte gCurrentSprite
_0802D26C: .4byte gSpriteData
_0802D270:
	adds r3, r4, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802D2AA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0802D2B0 @ =sAtmosphericStabilizerOam_3279f8
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldrh r0, [r4]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x2c
	strb r0, [r3]
	ldr r1, _0802D2B4 @ =gWrittenToMosaic_H
	ldr r0, _0802D2B8 @ =sXParasiteMosaicValues
	adds r0, #0x58
	ldrh r0, [r0]
	strh r0, [r1]
_0802D2AA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D2B0: .4byte sAtmosphericStabilizerOam_3279f8
_0802D2B4: .4byte gWrittenToMosaic_H
_0802D2B8: .4byte sXParasiteMosaicValues

	thumb_func_start AtmosphericStabilizerParasiteSpawnX
AtmosphericStabilizerParasiteSpawnX: @ 0x0802D2BC
	push {r4, lr}
	sub sp, #0x10
	ldr r0, _0802D330 @ =gCurrentSprite
	mov ip, r0
	mov r4, ip
	adds r4, #0x23
	ldrb r1, [r4]
	ldr r2, _0802D334 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	mov r2, ip
	strh r1, [r2, #2]
	ldrh r0, [r0, #4]
	strh r0, [r2, #4]
	mov r0, ip
	adds r0, #0x2e
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	ldr r3, _0802D338 @ =gWrittenToMosaic_H
	ldr r2, _0802D33C @ =sXParasiteMosaicValues
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r2, #0
	bne _0802D328
	mov r0, ip
	ldrh r1, [r0]
	ldr r0, _0802D340 @ =0x0000FFDF
	ands r0, r1
	mov r1, ip
	strh r0, [r1]
	ldrb r3, [r4]
	movs r0, #0x20
	str r0, [sp]
	ldrh r0, [r1, #2]
	str r0, [sp, #4]
	ldrh r0, [r1, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	bl AtmosphericStabilizerParasiteIdleInit
_0802D328:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D330: .4byte gCurrentSprite
_0802D334: .4byte gSpriteData
_0802D338: .4byte gWrittenToMosaic_H
_0802D33C: .4byte sXParasiteMosaicValues
_0802D340: .4byte 0x0000FFDF

	thumb_func_start AtmosphericStabilizerParasiteDeath
AtmosphericStabilizerParasiteDeath: @ 0x0802D344
	push {lr}
	ldr r1, _0802D390 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r2, [r0]
	ldr r0, _0802D394 @ =sAtmosphericStabilizerOam_327970
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r1, _0802D398 @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x17
	strb r1, [r2]
	ldrb r0, [r0, #0x1d]
	subs r0, #0x2c
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r0
	lsrs r1, r1, #0x10
	ldr r2, _0802D39C @ =gAtmosphericStabilizersOnline
	ldrh r0, [r2]
	orrs r1, r0
	strh r1, [r2]
	cmp r1, #0x1f
	bne _0802D38C
	movs r0, #0x10
	bl EventCheckAdvance
_0802D38C:
	pop {r0}
	bx r0
	.align 2, 0
_0802D390: .4byte gCurrentSprite
_0802D394: .4byte sAtmosphericStabilizerOam_327970
_0802D398: .4byte gSpriteData
_0802D39C: .4byte gAtmosphericStabilizersOnline

	thumb_func_start AtmosphericStabilizer
AtmosphericStabilizer: @ 0x0802D3A0
	push {lr}
	ldr r1, _0802D3B8 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0
	beq _0802D3BC
	bl SpriteUtilUpdateFreezeTimer
	b _0802D464
	.align 2, 0
_0802D3B8: .4byte gCurrentSprite
_0802D3BC:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _0802D3DC
	cmp r0, #0x17
	bgt _0802D3D0
	cmp r0, #0
	beq _0802D3D6
	b _0802D3F4
_0802D3D0:
	cmp r0, #0x18
	beq _0802D3E0
	b _0802D3F4
_0802D3D6:
	bl AtmosphericStabilizerInit
	b _0802D464
_0802D3DC:
	bl AtmosphericStabilizerBackOnlineInit
_0802D3E0:
	ldr r0, _0802D3F0 @ =gCurrentSprite
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	bl AtmosphericStabilizerBackOnline
	b _0802D464
	.align 2, 0
_0802D3F0: .4byte gCurrentSprite
_0802D3F4:
	ldr r0, _0802D420 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802D464
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802D42C
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802D424
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	b _0802D444
	.align 2, 0
_0802D420: .4byte gFrameCounter8Bit
_0802D424:
	ldrh r0, [r2, #4]
	subs r0, #1
	strh r0, [r2, #4]
	b _0802D444
_0802D42C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802D43E
	ldrh r0, [r2, #2]
	adds r0, #1
	b _0802D442
_0802D43E:
	ldrh r0, [r2, #2]
	subs r0, #1
_0802D442:
	strh r0, [r2, #2]
_0802D444:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D464
	movs r0, #0x40
	strb r0, [r1]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
_0802D464:
	pop {r0}
	bx r0

	thumb_func_start AtmosphericStabilizerCover
AtmosphericStabilizerCover: @ 0x0802D468
	push {lr}
	ldr r0, _0802D480 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0802D48E
	cmp r0, #2
	bgt _0802D484
	cmp r0, #0
	beq _0802D48A
	b _0802D498
	.align 2, 0
_0802D480: .4byte gCurrentSprite
_0802D484:
	cmp r0, #0x18
	beq _0802D494
	b _0802D498
_0802D48A:
	bl AtmosphericStabilizerCoverInit
_0802D48E:
	bl AtmosphericStabilizerCoverIdle
	b _0802D498
_0802D494:
	bl AtmosphericStabilizerCoverExploding
_0802D498:
	pop {r0}
	bx r0

	thumb_func_start AtmosphericStabilizerParasite
AtmosphericStabilizerParasite: @ 0x0802D49C
	push {r4, lr}
	ldr r4, _0802D4D4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0802D4B6
	movs r0, #0xb0
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0802D4B6:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _0802D500
	cmp r0, #0x18
	bgt _0802D4DE
	cmp r0, #1
	beq _0802D4F6
	cmp r0, #1
	bgt _0802D4D8
	cmp r0, #0
	beq _0802D4F2
	b _0802D518
	.align 2, 0
_0802D4D4: .4byte gCurrentSprite
_0802D4D8:
	cmp r0, #2
	beq _0802D4FA
	b _0802D518
_0802D4DE:
	cmp r0, #0x58
	beq _0802D50E
	cmp r0, #0x58
	bgt _0802D4EC
	cmp r0, #0x57
	beq _0802D506
	b _0802D518
_0802D4EC:
	cmp r0, #0x5b
	beq _0802D514
	b _0802D518
_0802D4F2:
	bl AtmosphericStabilizerParasiteInit
_0802D4F6:
	bl AtmosphericStabilizerParasiteIdleInit
_0802D4FA:
	bl AtmosphericStabilizerParasiteIdle
	b _0802D518
_0802D500:
	bl AtmosphericStabilizerParasiteSpawnX
	b _0802D518
_0802D506:
	bl AtmosphericStabilizerParasiteDeath
	bl SpriteDyingInit
_0802D50E:
	bl SpriteDying
	b _0802D518
_0802D514:
	bl XParasiteInit
_0802D518:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
