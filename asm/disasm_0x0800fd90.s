    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SpriteUtilInitLocationText
SpriteUtilInitLocationText: @ 0x0800FD90
	push {r4, lr}
	bl LocationTextCheckLoad
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #7
	bhi _0800FE04
	ldr r0, _0800FE0C @ =gSpriteData
	mov ip, r0
	movs r2, #0
	movs r3, #0
	ldr r0, _0800FE10 @ =0x00008017
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x34
	movs r0, #0x20
	strb r0, [r1]
	mov r0, ip
	strb r4, [r0, #0x1f]
	movs r0, #0x1d
	mov r1, ip
	strb r0, [r1, #0x1d]
	ldr r1, _0800FE14 @ =gSamusData
	ldrh r0, [r1, #0x18]
	mov r4, ip
	strh r0, [r4, #2]
	ldrh r0, [r1, #0x16]
	strh r0, [r4, #4]
	mov r0, ip
	adds r0, #0x21
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r2, [r0]
	strh r3, [r4, #0x14]
	adds r0, #8
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	subs r0, #0xd
	strb r2, [r0]
	adds r0, #0x15
	strb r2, [r0]
	subs r0, #0xf
	strb r1, [r0]
	subs r0, #3
	strb r2, [r0]
	mov r3, ip
	adds r3, #0x2a
	movs r0, #0x10
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x32
	strb r2, [r0]
	adds r0, #4
	strb r1, [r0]
_0800FE04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FE0C: .4byte gSpriteData
_0800FE10: .4byte 0x00008017
_0800FE14: .4byte gSamusData

	thumb_func_start TakeDamageFromSprite
TakeDamageFromSprite: @ 0x0800FE18
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r2, _0800FE48 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r2
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FE50
	ldr r2, _0800FE4C @ =sSecondarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r1, r1, #3
	b _0800FE5A
	.align 2, 0
_0800FE48: .4byte gSpriteData
_0800FE4C: .4byte sSecondarySpriteStats
_0800FE50:
	ldr r2, _0800FE8C @ =sPrimarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #1
_0800FE5A:
	adds r0, r2, #2
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r2, #4
	adds r1, r1, r2
	ldrh r0, [r1]
	movs r4, #3
	ands r4, r0
	adds r0, r3, #0
	muls r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, _0800FE90 @ =gEquipment
	ldrb r2, [r1, #0xc]
	movs r0, #0x20
	ands r0, r2
	adds r5, r1, #0
	cmp r0, #0
	beq _0800FE98
	ldr r1, _0800FE94 @ =sSuitDamageReductionPercent
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r1, #4
	b _0800FEB8
	.align 2, 0
_0800FE8C: .4byte sPrimarySpriteStats
_0800FE90: .4byte gEquipment
_0800FE94: .4byte sSuitDamageReductionPercent
_0800FE98:
	movs r0, #0x10
	ands r2, r0
	cmp r2, #0
	beq _0800FEB0
	ldr r1, _0800FEAC @ =sSuitDamageReductionPercent
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r1, #2
	b _0800FEB8
	.align 2, 0
_0800FEAC: .4byte sSuitDamageReductionPercent
_0800FEB0:
	ldr r1, _0800FED8 @ =sSuitDamageReductionPercent
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
_0800FEB8:
	adds r0, r0, r1
	ldrh r0, [r0]
	muls r0, r3, r0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0800FECE
	movs r3, #1
_0800FECE:
	ldrh r0, [r5]
	cmp r0, r3
	bls _0800FEDC
	subs r0, r0, r3
	b _0800FEDE
	.align 2, 0
_0800FED8: .4byte sSuitDamageReductionPercent
_0800FEDC:
	movs r0, #0
_0800FEDE:
	strh r0, [r5]
	cmp r6, #0
	beq _0800FF00
	ldr r1, _0800FEF8 @ =sSamusSetPoseFunctionPointer
	ldr r0, _0800FEFC @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
	b _0800FF18
	.align 2, 0
_0800FEF8: .4byte sSamusSetPoseFunctionPointer
_0800FEFC: .4byte gSamusData
_0800FF00:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0800FF18
	ldr r1, _0800FF20 @ =sSamusSetPoseFunctionPointer
	ldr r0, _0800FF24 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
_0800FF18:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800FF20: .4byte sSamusSetPoseFunctionPointer
_0800FF24: .4byte gSamusData

	thumb_func_start TakeDamageFromSA_XIceBeamWithPowerSuit
TakeDamageFromSA_XIceBeamWithPowerSuit: @ 0x0800FF28
	push {r4, lr}
	ldr r0, _0800FF64 @ =sSecondarySpriteStats
	ldrh r3, [r0, #2]
	ldrh r0, [r0, #4]
	movs r1, #3
	ands r1, r0
	ldr r2, _0800FF68 @ =sSuitDamageReductionPercent
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	muls r0, r3, r0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0800FF52
	movs r3, #1
_0800FF52:
	ldr r0, _0800FF6C @ =gEquipment
	ldrh r2, [r0]
	adds r1, r2, #0
	adds r4, r0, #0
	cmp r1, r3
	bls _0800FF70
	subs r0, r2, r3
	b _0800FF7A
	.align 2, 0
_0800FF64: .4byte sSecondarySpriteStats
_0800FF68: .4byte sSuitDamageReductionPercent
_0800FF6C: .4byte gEquipment
_0800FF70:
	cmp r1, #1
	bne _0800FF78
	movs r0, #0
	b _0800FF7A
_0800FF78:
	movs r0, #1
_0800FF7A:
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	bne _0800FFA0
	ldr r1, _0800FF98 @ =sSamusSetPoseFunctionPointer
	ldr r0, _0800FF9C @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
	b _0800FFB2
	.align 2, 0
_0800FF98: .4byte sSamusSetPoseFunctionPointer
_0800FF9C: .4byte gSamusData
_0800FFA0:
	ldr r1, _0800FFB8 @ =sSamusSetPoseFunctionPointer
	ldr r0, _0800FFBC @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfb
	bl _call_via_r1
_0800FFB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800FFB8: .4byte sSamusSetPoseFunctionPointer
_0800FFBC: .4byte gSamusData

	thumb_func_start SpriteUtilTakeConstantDamageFromZazabi
SpriteUtilTakeConstantDamageFromZazabi: @ 0x0800FFC0
	push {r4, lr}
	ldr r0, _0800FFF4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r4, #7
	ands r4, r1
	cmp r4, #0
	bne _0801001C
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0800FFDC
	ldr r0, _0800FFF8 @ =0x00000282
	bl SoundPlay
_0800FFDC:
	ldr r0, _0800FFFC @ =gSamusData
	movs r1, #8
	strb r1, [r0, #5]
	ldr r1, _08010000 @ =gEquipment
	ldrh r2, [r1]
	adds r3, r0, #0
	cmp r2, #1
	bls _08010004
	subs r0, r2, #1
	strh r0, [r1]
	b _08010006
	.align 2, 0
_0800FFF4: .4byte gFrameCounter8Bit
_0800FFF8: .4byte 0x00000282
_0800FFFC: .4byte gSamusData
_08010000: .4byte gEquipment
_08010004:
	strh r4, [r1]
_08010006:
	ldrh r0, [r1]
	cmp r0, #0
	bne _0801001C
	ldr r0, _08010024 @ =sSamusSetPoseFunctionPointer
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0xfa
	bl _call_via_r1
_0801001C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010024: .4byte sSamusSetPoseFunctionPointer

	thumb_func_start TakeDamageFromOmegaMetroidSwiping
TakeDamageFromOmegaMetroidSwiping: @ 0x08010028
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08010054 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r3, r1, r2
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801005C
	ldr r1, _08010058 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r1, #2
	adds r0, r0, r1
	b _0801006A
	.align 2, 0
_08010054: .4byte gSpriteData
_08010058: .4byte sSecondarySpriteStats
_0801005C:
	ldr r2, _08010088 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, #2
	adds r0, r0, r2
_0801006A:
	ldrh r2, [r0]
	ldr r3, _0801008C @ =gEquipment
	ldrb r1, [r3, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08010096
	lsls r0, r2, #0x11
	lsrs r2, r0, #0x10
	ldrh r0, [r3]
	cmp r0, r2
	bls _08010090
	subs r0, r0, r2
	strh r0, [r3]
	b _080100A8
	.align 2, 0
_08010088: .4byte sPrimarySpriteStats
_0801008C: .4byte gEquipment
_08010090:
	movs r0, #0
	strh r0, [r3]
	b _080100A8
_08010096:
	movs r0, #1
	strh r0, [r3]
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080100C0 @ =0x000002AF
	bl SoundPlay
_080100A8:
	ldr r1, _080100C4 @ =sSamusSetPoseFunctionPointer
	ldr r0, _080100C8 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080100C0: .4byte 0x000002AF
_080100C4: .4byte sSamusSetPoseFunctionPointer
_080100C8: .4byte gSamusData

	thumb_func_start TakeDamageFromYakuzaSlamming
TakeDamageFromYakuzaSlamming: @ 0x080100CC
	push {lr}
	ldr r0, _080100EC @ =sPrimarySpriteStats
	movs r1, #0x8e
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _080100F0 @ =gEquipment
	ldrh r0, [r1]
	cmp r0, r2
	bls _080100F4
	subs r0, r0, r2
	b _080100F6
	.align 2, 0
_080100EC: .4byte sPrimarySpriteStats
_080100F0: .4byte gEquipment
_080100F4:
	movs r0, #0
_080100F6:
	strh r0, [r1]
	ldr r1, _08010110 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08010114 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08010110: .4byte sSamusSetPoseFunctionPointer
_08010114: .4byte gSamusData

	thumb_func_start TakeConstantDamageFromYakuza
TakeConstantDamageFromYakuza: @ 0x08010118
	push {r4, lr}
	ldr r0, _08010150 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r4, #0xf
	ands r4, r0
	cmp r4, #0
	bne _080101A8
	ldr r0, _08010154 @ =sPrimarySpriteStats
	movs r1, #0x8e
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08010158 @ =gEquipment
	ldrh r0, [r1]
	cmp r0, r2
	bls _08010160
	subs r0, r0, r2
	strh r0, [r1]
	ldr r1, _0801015C @ =gSamusData
	movs r0, #8
	strb r0, [r1, #5]
	b _08010174
	.align 2, 0
_08010150: .4byte gFrameCounter8Bit
_08010154: .4byte sPrimarySpriteStats
_08010158: .4byte gEquipment
_0801015C: .4byte gSamusData
_08010160:
	strh r4, [r1]
	ldr r1, _0801018C @ =sSamusSetPoseFunctionPointer
	ldr r0, _08010190 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
_08010174:
	ldr r0, _08010194 @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0
	beq _080101A8
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	bne _08010198
	movs r0, #0x88
	bl unk_2894
	b _080101A2
	.align 2, 0
_0801018C: .4byte sSamusSetPoseFunctionPointer
_08010190: .4byte gSamusData
_08010194: .4byte gEquipment
_08010198:
	cmp r1, #7
	bne _080101A2
	movs r0, #0x88
	bl unk_2894
_080101A2:
	movs r0, #0x89
	bl unk_2894
_080101A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start TakeKnockback
TakeKnockback: @ 0x080101B0
	push {lr}
	ldr r1, _080101C8 @ =sSamusSetPoseFunctionPointer
	ldr r0, _080101CC @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xf9
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_080101C8: .4byte sSamusSetPoseFunctionPointer
_080101CC: .4byte gSamusData

	thumb_func_start CheckObjectsTouching
CheckObjectsTouching: @ 0x080101D0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	mov r8, r5
	ldr r5, [sp, #0x20]
	ldr r6, [sp, #0x24]
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r7, r8
	lsls r7, r7, #0x10
	mov r8, r7
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	cmp r8, r0
	blo _08010214
	cmp r4, r1
	bhs _08010214
	cmp r6, r2
	blo _08010214
	cmp r5, r3
	bhs _08010214
	movs r0, #1
	b _08010216
_08010214:
	movs r0, #0
_08010216:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SpriteUtilSamusAndSpriteCollision
SpriteUtilSamusAndSpriteCollision: @ 0x08010220
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r1, _08010334 @ =gSamusData
	ldrh r0, [r1, #0x18]
	str r0, [sp, #0x10]
	ldrh r2, [r1, #0x16]
	str r2, [sp, #0x14]
	ldr r0, _08010338 @ =gPreviousXPosition
	ldrh r0, [r0]
	str r0, [sp, #0x28]
	ldrh r0, [r1, #0x26]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	ldrh r0, [r1, #0x2a]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
	ldrh r0, [r1, #0x24]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	ldrh r0, [r1, #0x28]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x24]
	movs r0, #0
	mov sl, r0
_0801026A:
	ldr r1, _0801033C @ =gSpriteData
	mov r3, sl
	lsls r2, r3, #3
	subs r0, r2, r3
	lsls r0, r0, #3
	adds r1, r0, r1
	ldrh r0, [r1]
	ldr r3, _08010340 @ =0x00002003
	ands r0, r3
	str r2, [sp, #0x34]
	cmp r0, #3
	beq _08010286
	bl _08010FF6
_08010286:
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r5, [r0]
	cmp r5, #0
	beq _08010294
	bl _08010FF6
_08010294:
	ldrh r0, [r1, #2]
	str r0, [sp, #0x2c]
	ldrh r2, [r1, #4]
	str r2, [sp, #0x30]
	ldrh r0, [r1, #0xa]
	ldr r3, [sp, #0x2c]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r1, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrh r0, [r1, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r0, [r1, #0x10]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r7, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl CheckObjectsTouching
	cmp r0, #0
	bne _080102E2
	bl _08010FF6
_080102E2:
	ldr r0, _08010344 @ =gIgnoreSamusAndSpriteCollision
	strb r5, [r0]
	mov r2, r8
	subs r0, r2, r4
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r3, sb
	subs r0, r3, r7
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r6, #0
	subs r0, r2, #4
	ldr r3, [sp, #0x1c]
	cmp r0, r3
	ble _0801031C
	ldr r0, _08010334 @ =gSamusData
	movs r3, #0x1c
	ldrsh r0, [r0, r3]
	cmp r0, #0x18
	bgt _0801031C
	movs r6, #1
_0801031C:
	adds r0, r2, #4
	ldr r2, [sp, #0x18]
	cmp r0, r2
	bge _08010328
	movs r0, #2
	orrs r6, r0
_08010328:
	ldr r3, [sp, #0x28]
	cmp r1, r3
	blo _08010348
	movs r0, #4
	b _0801034A
	.align 2, 0
_08010334: .4byte gSamusData
_08010338: .4byte gPreviousXPosition
_0801033C: .4byte gSpriteData
_08010340: .4byte 0x00002003
_08010344: .4byte gIgnoreSamusAndSpriteCollision
_08010348:
	movs r0, #8
_0801034A:
	orrs r6, r0
	lsls r0, r6, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _080103B4 @ =gSpriteData
	ldr r2, [sp, #0x34]
	mov r3, sl
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r5, r1, r0
	adds r0, r5, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010368
	b _08010470
_08010368:
	mov r0, sl
	bl SamusCheckPassThroughFrozenSprite
	cmp r0, #0
	beq _08010376
	bl _08010FEE
_08010376:
	ldr r0, [sp, #0x10]
	subs r0, #0x18
	cmp r0, r4
	bge _080103C0
	ldr r6, _080103B8 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r6, r1]
	adds r0, #1
	adds r0, r4, r0
	ldr r1, [sp, #0x14]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080103BC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801039A
	bl _08010FEE
_0801039A:
	adds r0, r4, #1
	strh r0, [r6, #0x18]
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x33
	movs r0, #2
	bl _08010FEC
	.align 2, 0
_080103B4: .4byte gSpriteData
_080103B8: .4byte gSamusData
_080103BC: .4byte gPreviousCollisionCheck
_080103C0:
	ldr r0, [sp, #0x18]
	adds r0, #0x10
	cmp r0, r8
	ble _080103FC
	ldr r4, _080103F4 @ =gSamusData
	movs r3, #0x26
	ldrsh r0, [r4, r3]
	mov r1, r8
	subs r0, r1, r0
	ldr r1, [sp, #0x14]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080103F8 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	cmp r1, #0
	beq _080103E4
	bl _08010FEE
_080103E4:
	ldrh r0, [r4, #0x26]
	mov r2, r8
	subs r0, r2, r0
	strh r0, [r4, #0x18]
	movs r3, #0x1c
	ldrsh r0, [r4, r3]
	b _08010598
	.align 2, 0
_080103F4: .4byte gSamusData
_080103F8: .4byte gPreviousCollisionCheck
_080103FC:
	ldr r0, [sp, #0x14]
	cmp r0, r7
	blo _0801040A
	cmp r0, sb
	bhi _0801040A
	bl _08010FEE
_0801040A:
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	bne _08010414
	b _08010630
_08010414:
	ldr r4, _08010468 @ =gSamusData
	movs r2, #0x28
	ldrsh r1, [r4, r2]
	subs r1, r7, r1
	movs r3, #0x24
	ldrsh r0, [r4, r3]
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801046C @ =gPreviousCollisionCheck
	ldrb r6, [r5]
	cmp r6, #0
	beq _08010434
	bl _08010FEE
_08010434:
	ldr r0, [sp, #0x10]
	subs r0, #0x40
	movs r2, #0x28
	ldrsh r1, [r4, r2]
	subs r1, r7, r1
	movs r3, #0x24
	ldrsh r2, [r4, r3]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801045A
	bl SpriteUtilCheckMorphed
	cmp r0, #0
	bne _0801045A
	bl _08010FEE
_0801045A:
	ldrh r0, [r4, #0x28]
	subs r0, r7, r0
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x12]
	movs r0, #0x10
	b _08010686
	.align 2, 0
_08010468: .4byte gSamusData
_0801046C: .4byte gPreviousCollisionCheck
_08010470:
	adds r0, r5, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x1d
	bls _0801047E
	bl _08010FE0
_0801047E:
	lsls r0, r0, #2
	ldr r1, _08010488 @ =_0801048C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010488: .4byte _0801048C
_0801048C: @ jump table
	.4byte _08010FEE @ case 0
	.4byte _08010504 @ case 1
	.4byte _0801077A @ case 2
	.4byte _08010714 @ case 3
	.4byte _08010768 @ case 4
	.4byte _080106C2 @ case 5
	.4byte _080106B0 @ case 6
	.4byte _08010CEC @ case 7
	.4byte _08010D70 @ case 8
	.4byte _08010DC0 @ case 9
	.4byte _08010CB4 @ case 10
	.4byte _08010A7C @ case 11
	.4byte _08010C94 @ case 12
	.4byte _08010B2C @ case 13
	.4byte _08010BFC @ case 14
	.4byte _08010C94 @ case 15
	.4byte _08010C94 @ case 16
	.4byte _08010C94 @ case 17
	.4byte _08010C94 @ case 18
	.4byte _08010C94 @ case 19
	.4byte _08010E10 @ case 20
	.4byte _0801091C @ case 21
	.4byte _080109B4 @ case 22
	.4byte _08010A20 @ case 23
	.4byte _080107D0 @ case 24
	.4byte _0801089C @ case 25
	.4byte _08010E4C @ case 26
	.4byte _08010F0C @ case 27
	.4byte _08010F9C @ case 28
	.4byte _08010854 @ case 29
_08010504:
	mov r0, sl
	bl SamusCheckPassThroughFrozenSprite
	cmp r0, #0
	beq _08010512
	bl _08010FEE
_08010512:
	ldr r0, [sp, #0x10]
	subs r0, #0x18
	cmp r0, r4
	bge _08010568
	ldr r5, _0801055C @ =gSamusData
	movs r2, #0x26
	ldrsh r0, [r5, r2]
	adds r0, #1
	adds r0, r4, r0
	ldr r1, [sp, #0x14]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08010560 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08010536
	bl _08010FEE
_08010536:
	adds r0, r4, #1
	strh r0, [r5, #0x18]
	ldr r0, _08010564 @ =gSpriteData
	mov r3, sl
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r1, #0x33
	movs r0, #2
	bl _08010FEC
	.align 2, 0
_0801055C: .4byte gSamusData
_08010560: .4byte gPreviousCollisionCheck
_08010564: .4byte gSpriteData
_08010568:
	ldr r0, [sp, #0x18]
	adds r0, #0x10
	cmp r0, r8
	ble _080105C0
	ldr r4, _080105B4 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	mov r2, r8
	subs r0, r2, r0
	ldr r1, [sp, #0x14]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080105B8 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	cmp r1, #0
	beq _0801058C
	bl _08010FEE
_0801058C:
	ldrh r0, [r4, #0x26]
	mov r3, r8
	subs r0, r3, r0
	strh r0, [r4, #0x18]
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
_08010598:
	cmp r0, #0
	bgt _080105A0
	bl _08010FEE
_080105A0:
	ldr r0, _080105BC @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0
	bne _080105AC
	bl _08010FEE
_080105AC:
	strh r1, [r4, #0x1c]
	bl _08010FEE
	.align 2, 0
_080105B4: .4byte gSamusData
_080105B8: .4byte gPreviousCollisionCheck
_080105BC: .4byte gEquipment
_080105C0:
	ldr r3, [sp, #0x14]
	cmp r3, r7
	blo _080105CE
	cmp r3, sb
	bhi _080105CE
	bl _08010FEE
_080105CE:
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _08010630
	ldr r4, _08010628 @ =gSamusData
	movs r0, #0x28
	ldrsh r1, [r4, r0]
	subs r1, r7, r1
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801062C @ =gPreviousCollisionCheck
	ldrb r6, [r5]
	cmp r6, #0
	beq _080105F6
	bl _08010FEE
_080105F6:
	ldr r0, [sp, #0x10]
	subs r0, #0x40
	movs r3, #0x28
	ldrsh r1, [r4, r3]
	subs r1, r7, r1
	movs r3, #0x24
	ldrsh r2, [r4, r3]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801061C
	bl SpriteUtilCheckMorphed
	cmp r0, #0
	bne _0801061C
	bl _08010FEE
_0801061C:
	ldrh r0, [r4, #0x28]
	subs r0, r7, r0
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x12]
	movs r0, #0x10
	b _08010686
	.align 2, 0
_08010628: .4byte gSamusData
_0801062C: .4byte gPreviousCollisionCheck
_08010630:
	ldr r4, _080106A4 @ =gSamusData
	movs r0, #0x24
	ldrsh r1, [r4, r0]
	mov r2, sb
	subs r1, r2, r1
	movs r3, #0x28
	ldrsh r0, [r4, r3]
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080106A8 @ =gPreviousCollisionCheck
	ldrb r6, [r5]
	cmp r6, #0
	beq _08010652
	bl _08010FEE
_08010652:
	ldr r0, [sp, #0x10]
	subs r0, #0x40
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	mov r3, sb
	subs r1, r3, r1
	movs r3, #0x28
	ldrsh r2, [r4, r3]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801067A
	bl SpriteUtilCheckMorphed
	cmp r0, #0
	bne _0801067A
	bl _08010FEE
_0801067A:
	ldrh r0, [r4, #0x24]
	mov r1, sb
	subs r0, r1, r0
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x12]
	movs r0, #0x20
_08010686:
	ands r0, r1
	cmp r0, #0
	bne _08010690
	bl _08010FEE
_08010690:
	ldr r0, _080106AC @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0
	bne _0801069C
	bl _08010FEE
_0801069C:
	strh r6, [r4, #0x1a]
	bl _08010FEE
	.align 2, 0
_080106A4: .4byte gSamusData
_080106A8: .4byte gPreviousCollisionCheck
_080106AC: .4byte gEquipment
_080106B0:
	ldr r0, _080106E8 @ =gSpriteData
	ldr r2, [sp, #0x34]
	mov r3, sl
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_080106C2:
	ldr r4, _080106EC @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _080106FA
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _080106FA
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	bne _080106FA
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _080106F0
	movs r0, #0x10
	b _080106F2
	.align 2, 0
_080106E8: .4byte gSpriteData
_080106EC: .4byte gSamusData
_080106F0:
	movs r0, #0x20
_080106F2:
	strh r0, [r4, #0x12]
	mov r0, sl
	bl TakeKnockback
_080106FA:
	ldr r1, _08010710 @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0x1f
	strb r1, [r0]
	bl _08010FE8
	.align 2, 0
_08010710: .4byte gSpriteData
_08010714:
	ldr r4, _0801073C @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _0801074E
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _0801074E
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	bne _0801074E
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _08010740
	movs r0, #0x10
	b _08010742
	.align 2, 0
_0801073C: .4byte gSamusData
_08010740:
	movs r0, #0x20
_08010742:
	strh r0, [r4, #0x12]
	movs r0, #1
	mov r1, sl
	movs r2, #2
	bl TakeDamageFromSprite
_0801074E:
	ldr r1, _08010764 @ =gSpriteData
	mov r3, sl
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	bl _08010FE8
	.align 2, 0
_08010764: .4byte gSpriteData
_08010768:
	ldr r0, _080107A0 @ =gSpriteData
	ldr r2, [sp, #0x34]
	mov r3, sl
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_0801077A:
	ldr r4, _080107A4 @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _080107B6
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _080107B6
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	bne _080107B6
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _080107A8
	movs r0, #0x10
	b _080107AA
	.align 2, 0
_080107A0: .4byte gSpriteData
_080107A4: .4byte gSamusData
_080107A8:
	movs r0, #0x20
_080107AA:
	strh r0, [r4, #0x12]
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
_080107B6:
	ldr r1, _080107CC @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	bl _08010FE8
	.align 2, 0
_080107CC: .4byte gSpriteData
_080107D0:
	ldr r4, _080107F8 @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _08010834
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _08010834
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	bne _08010834
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _080107FC
	movs r0, #0x10
	b _080107FE
	.align 2, 0
_080107F8: .4byte gSamusData
_080107FC:
	movs r0, #0x20
_080107FE:
	strh r0, [r4, #0x12]
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	ldr r0, _08010824 @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0
	beq _08010834
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _0801082C
	ldr r1, _08010828 @ =gSamusData
	ldrh r0, [r1, #0x1a]
	subs r0, #0x20
	b _08010832
	.align 2, 0
_08010824: .4byte gEquipment
_08010828: .4byte gSamusData
_0801082C:
	ldr r1, _0801084C @ =gSamusData
	ldrh r0, [r1, #0x1a]
	adds r0, #0x20
_08010832:
	strh r0, [r1, #0x1a]
_08010834:
	ldr r1, _08010850 @ =gSpriteData
	mov r3, sl
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	bl _08010FE8
	.align 2, 0
_0801084C: .4byte gSamusData
_08010850: .4byte gSpriteData
_08010854:
	ldr r4, _0801088C @ =gEquipment
	ldrh r0, [r4]
	cmp r0, #0
	beq _08010878
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	ldr r1, _08010890 @ =gSamusData
	movs r2, #0
	movs r0, #0x10
	strh r0, [r1, #0x12]
	ldrh r0, [r4]
	cmp r0, #0
	beq _08010878
	ldr r0, _08010894 @ =0x0000FFB0
	strh r0, [r1, #0x1a]
_08010878:
	ldr r1, _08010898 @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_0801088C: .4byte gEquipment
_08010890: .4byte gSamusData
_08010894: .4byte 0x0000FFB0
_08010898: .4byte gSpriteData
_0801089C:
	ldr r4, _080108C4 @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _08010900
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _08010900
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	bne _08010900
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _080108C8
	movs r0, #0x10
	b _080108CA
	.align 2, 0
_080108C4: .4byte gSamusData
_080108C8:
	movs r0, #0x20
_080108CA:
	strh r0, [r4, #0x12]
	movs r0, #1
	mov r1, sl
	movs r2, #2
	bl TakeDamageFromSprite
	ldr r0, _080108F0 @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0
	beq _08010900
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _080108F8
	ldr r1, _080108F4 @ =gSamusData
	ldrh r0, [r1, #0x1a]
	subs r0, #0x20
	b _080108FE
	.align 2, 0
_080108F0: .4byte gEquipment
_080108F4: .4byte gSamusData
_080108F8:
	ldr r1, _08010914 @ =gSamusData
	ldrh r0, [r1, #0x1a]
	adds r0, #0x20
_080108FE:
	strh r0, [r1, #0x1a]
_08010900:
	ldr r1, _08010918 @ =gSpriteData
	mov r3, sl
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_08010914: .4byte gSamusData
_08010918: .4byte gSpriteData
_0801091C:
	ldr r4, _08010960 @ =gEquipment
	ldrh r0, [r4]
	cmp r0, #0
	beq _08010998
	mov r0, sl
	bl TakeDamageFromOmegaMetroidSwiping
	ldr r6, _08010964 @ =gSamusData
	movs r7, #0
	movs r0, #0x10
	strh r0, [r6, #0x12]
	ldrh r0, [r4]
	cmp r0, #0
	beq _08010998
	ldr r1, _08010968 @ =gPoseLock
	movs r0, #0x80
	strb r0, [r1]
	ldr r0, [sp, #0x14]
	lsrs r1, r0, #2
	ldr r0, _0801096C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r5, r4, #0
	bl EventCheckAfter_IceBeamRecovered
	cmp r0, #0
	beq _0801097C
	cmp r4, #0x50
	bls _08010974
	ldr r0, _08010970 @ =0x0000FF9C
	b _08010996
	.align 2, 0
_08010960: .4byte gEquipment
_08010964: .4byte gSamusData
_08010968: .4byte gPoseLock
_0801096C: .4byte gBg1XPosition
_08010970: .4byte 0x0000FF9C
_08010974:
	ldr r0, _08010978 @ =0x0000FFBA
	b _08010996
	.align 2, 0
_08010978: .4byte 0x0000FFBA
_0801097C:
	cmp r4, #0x64
	bls _08010988
	ldr r0, _08010984 @ =0x0000FED4
	b _08010996
	.align 2, 0
_08010984: .4byte 0x0000FED4
_08010988:
	cmp r5, #0x27
	bhi _08010994
	ldr r0, _08010990 @ =0x0000FF9C
	b _08010996
	.align 2, 0
_08010990: .4byte 0x0000FF9C
_08010994:
	ldr r0, _080109AC @ =0x0000FF38
_08010996:
	strh r0, [r6, #0x1a]
_08010998:
	ldr r1, _080109B0 @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_080109AC: .4byte 0x0000FF38
_080109B0: .4byte gSpriteData
_080109B4:
	ldr r0, _080109F0 @ =gPoseLock
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010A04
	ldr r4, _080109F4 @ =gSamusData
	ldrb r0, [r4, #1]
	cmp r0, #0x3f
	beq _08010A04
	ldr r5, _080109F8 @ =gEquipment
	ldrh r0, [r5]
	cmp r0, #0
	beq _08010A04
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	movs r6, #0
	movs r0, #0x10
	strh r0, [r4, #0x12]
	ldrh r0, [r5]
	cmp r0, #0
	beq _08010A04
	bl EventCheckAfter_IceBeamRecovered
	cmp r0, #0
	beq _08010A00
	ldr r0, _080109FC @ =0x0000FFBA
	b _08010A02
	.align 2, 0
_080109F0: .4byte gPoseLock
_080109F4: .4byte gSamusData
_080109F8: .4byte gEquipment
_080109FC: .4byte 0x0000FFBA
_08010A00:
	ldr r0, _08010A18 @ =0x0000FF88
_08010A02:
	strh r0, [r4, #0x1a]
_08010A04:
	ldr r1, _08010A1C @ =gSpriteData
	mov r3, sl
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_08010A18: .4byte 0x0000FF88
_08010A1C: .4byte gSpriteData
_08010A20:
	ldr r0, _08010A68 @ =gPoseLock
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010A52
	ldr r4, _08010A6C @ =gSamusData
	ldrb r0, [r4, #1]
	cmp r0, #0x3f
	beq _08010A52
	ldr r5, _08010A70 @ =gEquipment
	ldrh r0, [r5]
	cmp r0, #0
	beq _08010A52
	movs r6, #0
	movs r0, #0x10
	strh r0, [r4, #0x12]
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	ldrh r0, [r5]
	cmp r0, #0
	beq _08010A52
	ldr r0, _08010A74 @ =0x0000FF60
	strh r0, [r4, #0x1a]
_08010A52:
	ldr r1, _08010A78 @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_08010A68: .4byte gPoseLock
_08010A6C: .4byte gSamusData
_08010A70: .4byte gEquipment
_08010A74: .4byte 0x0000FF60
_08010A78: .4byte gSpriteData
_08010A7C:
	ldr r0, _08010AD4 @ =gSpriteData
	ldr r3, [sp, #0x34]
	mov r2, sl
	subs r1, r3, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	ldr r4, _08010AD8 @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #7
	bhi _08010B12
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _08010B12
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	bne _08010B12
	movs r0, #0
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	ldr r0, _08010ADC @ =gEquipment
	ldrh r1, [r0]
	cmp r1, #0
	beq _08010B12
	movs r0, #8
	strb r0, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08010AE0
	movs r0, #0x88
	bl unk_2894
	b _08010AEA
	.align 2, 0
_08010AD4: .4byte gSpriteData
_08010AD8: .4byte gSamusData
_08010ADC: .4byte gEquipment
_08010AE0:
	cmp r0, #7
	bne _08010AEA
	movs r0, #0x88
	bl unk_2894
_08010AEA:
	ldr r1, _08010B08 @ =gSpriteData
	ldr r2, [sp, #0x34]
	mov r3, sl
	subs r0, r2, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x23
	beq _08010B00
	cmp r0, #0xc5
	bne _08010B0C
_08010B00:
	movs r0, #0x8a
	bl unk_2894
	b _08010B12
	.align 2, 0
_08010B08: .4byte gSpriteData
_08010B0C:
	movs r0, #0x89
	bl unk_2894
_08010B12:
	ldr r1, _08010B28 @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_08010B28: .4byte gSpriteData
_08010B2C:
	bl SamusCheckDamagingPose
	cmp r0, #0
	beq _08010B36
	b _08010FE8
_08010B36:
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	beq _08010B42
	b _08010FE8
_08010B42:
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _08010B74
	ldr r4, _08010B6C @ =gSamusData
	movs r3, #0x28
	ldrsh r1, [r4, r3]
	subs r1, r7, r1
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08010B70 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010B9A
	ldrh r0, [r4, #0x28]
	subs r0, r7, r0
	b _08010B98
	.align 2, 0
_08010B6C: .4byte gSamusData
_08010B70: .4byte gPreviousCollisionCheck
_08010B74:
	ldr r4, _08010BB8 @ =gSamusData
	movs r3, #0x24
	ldrsh r1, [r4, r3]
	mov r0, sb
	subs r1, r0, r1
	movs r2, #0x28
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08010BBC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010B9A
	ldrh r0, [r4, #0x24]
	mov r3, sb
	subs r0, r3, r0
_08010B98:
	strh r0, [r4, #0x16]
_08010B9A:
	ldr r0, _08010BB8 @ =gSamusData
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _08010BC0
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _08010BC0
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	b _08010FE8
	.align 2, 0
_08010BB8: .4byte gSamusData
_08010BBC: .4byte gPreviousCollisionCheck
_08010BC0:
	ldr r4, _08010BE8 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r4, r1]
	adds r0, #1
	ldr r2, [sp, #0x10]
	adds r0, r2, r0
	ldr r1, [sp, #0x14]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08010BEC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08010BDC
	b _08010FE8
_08010BDC:
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _08010BF0
	movs r0, #0x10
	b _08010BF2
	.align 2, 0
_08010BE8: .4byte gSamusData
_08010BEC: .4byte gPreviousCollisionCheck
_08010BF0:
	movs r0, #0x20
_08010BF2:
	strh r0, [r4, #0x12]
	mov r0, sl
	bl TakeKnockback
	b _08010FE8
_08010BFC:
	bl SamusCheckDamagingPose
	cmp r0, #0
	beq _08010C06
	b _08010FE8
_08010C06:
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	beq _08010C12
	b _08010FE8
_08010C12:
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _08010C44
	ldr r4, _08010C3C @ =gSamusData
	movs r3, #0x28
	ldrsh r1, [r4, r3]
	subs r1, r7, r1
	movs r2, #0x24
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08010C40 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010C6A
	ldrh r0, [r4, #0x28]
	subs r0, r7, r0
	b _08010C68
	.align 2, 0
_08010C3C: .4byte gSamusData
_08010C40: .4byte gPreviousCollisionCheck
_08010C44:
	ldr r4, _08010C8C @ =gSamusData
	movs r3, #0x24
	ldrsh r1, [r4, r3]
	mov r0, sb
	subs r1, r0, r1
	movs r2, #0x28
	ldrsh r0, [r4, r2]
	adds r1, r1, r0
	ldr r0, [sp, #0x10]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08010C90 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08010C6A
	ldrh r0, [r4, #0x24]
	mov r3, sb
	subs r0, r3, r0
_08010C68:
	strh r0, [r4, #0x16]
_08010C6A:
	ldr r0, _08010C8C @ =gSamusData
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _08010C74
	b _08010FE8
_08010C74:
	bl SamusCheckDamagingPose
	cmp r0, #0
	beq _08010C7E
	b _08010FE8
_08010C7E:
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	b _08010FE8
	.align 2, 0
_08010C8C: .4byte gSamusData
_08010C90: .4byte gPreviousCollisionCheck
_08010C94:
	ldr r0, _08010CB0 @ =gSpriteData
	mov r2, sl
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	b _08010FE8
	.align 2, 0
_08010CB0: .4byte gSpriteData
_08010CB4:
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	bne _08010CBE
	b _08010FEE
_08010CBE:
	ldr r1, _08010CE4 @ =gSamusData
	adds r0, r4, #1
	strh r0, [r1, #0x18]
	ldr r0, _08010CE8 @ =gSpriteData
	mov r2, sl
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r1, #0x33
	movs r0, #2
	b _08010FEC
	.align 2, 0
_08010CE4: .4byte gSamusData
_08010CE8: .4byte gSpriteData
_08010CEC:
	ldr r0, _08010D14 @ =gSamusData
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _08010D4E
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _08010D4E
	ldr r0, _08010D18 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08010D1C
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	b _08010D22
	.align 2, 0
_08010D14: .4byte gSamusData
_08010D18: .4byte gEquipment
_08010D1C:
	mov r0, sl
	bl TakeDamageFromSA_XIceBeamWithPowerSuit
_08010D22:
	ldr r0, _08010D6C @ =gSpriteData
	ldr r1, [sp, #0x34]
	mov r2, sl
	subs r4, r1, r2
	lsls r4, r4, #3
	adds r4, r4, r0
	ldrh r2, [r4, #2]
	subs r2, #8
	ldrh r3, [r4, #4]
	subs r3, #8
	movs r0, #2
	movs r1, #3
	bl SpriteDebrisInit
	ldrh r2, [r4, #2]
	adds r2, #8
	ldrh r3, [r4, #4]
	adds r3, #8
	movs r0, #2
	movs r1, #4
	bl SpriteDebrisInit
_08010D4E:
	ldr r1, _08010D6C @ =gSpriteData
	mov r3, sl
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x37
	strb r1, [r2]
	adds r0, #0x25
	strb r3, [r0]
	b _08010FE8
	.align 2, 0
_08010D6C: .4byte gSpriteData
_08010D70:
	ldr r4, _08010D8C @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _08010D9E
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _08010D9E
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _08010D90
	movs r0, #0x10
	b _08010D92
	.align 2, 0
_08010D8C: .4byte gSamusData
_08010D90:
	movs r0, #0x20
_08010D92:
	strh r0, [r4, #0x12]
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
_08010D9E:
	ldr r1, _08010DBC @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x37
	strb r1, [r2]
	adds r0, #0x25
	strb r3, [r0]
	b _08010FE8
	.align 2, 0
_08010DBC: .4byte gSpriteData
_08010DC0:
	ldr r4, _08010DDC @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _08010DEE
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _08010DEE
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _08010DE0
	movs r0, #0x10
	b _08010DE2
	.align 2, 0
_08010DDC: .4byte gSamusData
_08010DE0:
	movs r0, #0x20
_08010DE2:
	strh r0, [r4, #0x12]
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
_08010DEE:
	ldr r1, _08010E0C @ =gSpriteData
	mov r3, sl
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r2, r0, #0
	adds r2, #0x25
	movs r1, #0
	strb r1, [r2]
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_08010E0C: .4byte gSpriteData
_08010E10:
	ldr r1, _08010E40 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08010E44 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x3c
	bl _call_via_r1
	ldr r1, _08010E48 @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #0xf
	strb r1, [r2]
	adds r0, #0x25
	movs r1, #2
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_08010E40: .4byte sSamusSetPoseFunctionPointer
_08010E44: .4byte gSamusData
_08010E48: .4byte gSpriteData
_08010E4C:
	ldr r1, _08010E8C @ =gSpriteData
	ldr r3, [sp, #0x34]
	mov r2, sl
	subs r0, r3, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08010E90
	movs r1, #0xa
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0xa
	bne _08010EBA
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	bl RidleyCheckGrabSamusRight
	cmp r0, #0
	beq _08010EBA
	ldrh r1, [r4]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x1b
	b _08010FE6
	.align 2, 0
_08010E8C: .4byte gSpriteData
_08010E90:
	movs r1, #6
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #6
	bne _08010EBA
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	bl RidleyCheckGrabSamusLeft
	cmp r0, #0
	beq _08010EBA
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x1b
	b _08010FE6
_08010EBA:
	ldr r4, _08010EE0 @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _08010EF2
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _08010EF2
	mov r0, sl
	bl SamusCheckSudoScrew
	cmp r0, #0
	bne _08010EF2
	movs r0, #4
	ands r6, r0
	cmp r6, #0
	beq _08010EE4
	movs r0, #0x10
	b _08010EE6
	.align 2, 0
_08010EE0: .4byte gSamusData
_08010EE4:
	movs r0, #0x20
_08010EE6:
	strh r0, [r4, #0x12]
	movs r0, #1
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
_08010EF2:
	ldr r1, _08010F08 @ =gSpriteData
	mov r3, sl
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_08010F08: .4byte gSpriteData
_08010F0C:
	ldr r0, _08010F54 @ =gSpriteData
	mov r2, sl
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	ldr r4, _08010F58 @ =gSamusData
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _08010F70
	movs r0, #0
	mov r1, sl
	movs r2, #1
	bl TakeDamageFromSprite
	ldr r0, _08010F5C @ =gEquipment
	ldrh r1, [r0]
	cmp r1, #0
	beq _08010F70
	movs r0, #0x1e
	strb r0, [r4, #5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08010F60
	movs r0, #0x88
	bl unk_2894
	b _08010F6A
	.align 2, 0
_08010F54: .4byte gSpriteData
_08010F58: .4byte gSamusData
_08010F5C: .4byte gEquipment
_08010F60:
	cmp r0, #7
	bne _08010F6A
	movs r0, #0x88
	bl unk_2894
_08010F6A:
	movs r0, #0x89
	bl unk_2894
_08010F70:
	bl SpriteUtilCheckMorphed
	cmp r0, #0
	bne _08010F80
	ldr r0, _08010F94 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x1d
	bne _08010FE8
_08010F80:
	ldr r1, _08010F98 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08010F94 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #4
	bl _call_via_r1
	b _08010FE8
	.align 2, 0
_08010F94: .4byte gSamusData
_08010F98: .4byte sSamusSetPoseFunctionPointer
_08010F9C:
	movs r0, #2
	ands r6, r0
	cmp r6, #0
	beq _08010FE8
	ldr r1, _08010FD4 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08010FD8 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x40
	bl _call_via_r1
	ldr r1, _08010FDC @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x27
	strb r1, [r2]
	adds r0, #0x26
	movs r1, #0xf
	strb r1, [r0]
	b _08010FE8
	.align 2, 0
_08010FD4: .4byte sSamusSetPoseFunctionPointer
_08010FD8: .4byte gSamusData
_08010FDC: .4byte gSpriteData
_08010FE0:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #0xf
_08010FE6:
	strb r0, [r1]
_08010FE8:
	ldr r1, _08011050 @ =gIgnoreSamusAndSpriteCollision
	movs r0, #1
_08010FEC:
	strb r0, [r1]
_08010FEE:
	ldr r0, _08011050 @ =gIgnoreSamusAndSpriteCollision
	ldrb r0, [r0]
	cmp r0, #0
	bne _08011008
_08010FF6:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0x17
	bhi _08011008
	bl _0801026A
_08011008:
	movs r3, #0
	mov sl, r3
	ldr r3, _08011054 @ =gSpriteData
	movs r4, #1
_08011010:
	mov r1, sl
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r3
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08011032
	adds r1, r2, #0
	adds r1, #0x26
	ldrb r0, [r1]
	cmp r0, #0
	beq _08011032
	subs r0, #1
	strb r0, [r1]
_08011032:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	cmp r0, #0x17
	bls _08011010
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011050: .4byte gIgnoreSamusAndSpriteCollision
_08011054: .4byte gSpriteData

	thumb_func_start SpriteUtilCheckVerticalCollisionAtPosition
SpriteUtilCheckVerticalCollisionAtPosition: @ 0x08011058
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl ClipdataProcess
	adds r3, r0, #0
	movs r2, #0x80
	lsls r2, r2, #0x11
	ands r2, r3
	cmp r2, #0
	beq _08011084
	ldr r1, _08011080 @ =gPreviousVerticalCollisionCheck
	movs r0, #0x11
	strb r0, [r1]
	adds r2, r1, #0
	b _0801108A
	.align 2, 0
_08011080: .4byte gPreviousVerticalCollisionCheck
_08011084:
	ldr r0, _080110A0 @ =gPreviousVerticalCollisionCheck
	strb r2, [r0]
	adds r2, r0, #0
_0801108A:
	movs r0, #0xff
	ands r0, r3
	subs r0, #2
	cmp r0, #0xa
	bhi _08011164
	lsls r0, r0, #2
	ldr r1, _080110A4 @ =_080110A8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080110A0: .4byte gPreviousVerticalCollisionCheck
_080110A4: .4byte _080110A8
_080110A8: @ jump table
	.4byte _08011120 @ case 0
	.4byte _080110D4 @ case 1
	.4byte _08011148 @ case 2
	.4byte _08011134 @ case 3
	.4byte _080110F0 @ case 4
	.4byte _08011104 @ case 5
	.4byte _08011164 @ case 6
	.4byte _08011164 @ case 7
	.4byte _08011164 @ case 8
	.4byte _08011164 @ case 9
	.4byte _08011160 @ case 10
_080110D4:
	ldr r0, _080110EC @ =0x0000FFC0
	ands r0, r4
	movs r1, #0x3f
	ands r1, r5
	subs r1, #0x3f
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #5
	strb r0, [r2]
	b _08011168
	.align 2, 0
_080110EC: .4byte 0x0000FFC0
_080110F0:
	ldr r0, _08011100 @ =0x0000FFC0
	ands r0, r4
	movs r1, #0x3f
	ands r1, r5
	lsrs r1, r1, #1
	subs r1, #0x3f
	b _08011110
	.align 2, 0
_08011100: .4byte 0x0000FFC0
_08011104:
	ldr r0, _0801111C @ =0x0000FFC0
	ands r0, r4
	movs r1, #0x3f
	ands r1, r5
	lsrs r1, r1, #1
	subs r1, #0x1f
_08011110:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #3
	strb r0, [r2]
	b _08011168
	.align 2, 0
_0801111C: .4byte 0x0000FFC0
_08011120:
	ldr r1, _08011130 @ =0x0000FFC0
	ands r1, r4
	movs r0, #0x3f
	ands r0, r5
	orrs r1, r0
	movs r0, #4
	strb r0, [r2]
	b _08011168
	.align 2, 0
_08011130: .4byte 0x0000FFC0
_08011134:
	ldr r1, _08011144 @ =0x0000FFC0
	ands r1, r4
	movs r0, #0x3f
	ands r0, r5
	lsrs r0, r0, #1
	adds r0, #0x1f
	b _08011152
	.align 2, 0
_08011144: .4byte 0x0000FFC0
_08011148:
	ldr r1, _0801115C @ =0x0000FFC0
	ands r1, r4
	movs r0, #0x3f
	ands r0, r5
	lsrs r0, r0, #1
_08011152:
	orrs r1, r0
	movs r0, #2
	strb r0, [r2]
	b _08011168
	.align 2, 0
_0801115C: .4byte 0x0000FFC0
_08011160:
	movs r0, #0x10
	strb r0, [r2]
_08011164:
	ldr r1, _08011170 @ =0x0000FFC0
	ands r1, r4
_08011168:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08011170: .4byte 0x0000FFC0

	thumb_func_start SpriteUtilCheckVerticalCollisionAtPositionSlopes
SpriteUtilCheckVerticalCollisionAtPositionSlopes: @ 0x08011174
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl ClipdataProcess
	adds r6, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r6
	movs r3, #0
	cmp r0, #0
	beq _08011196
	movs r3, #0x11
_08011196:
	movs r0, #0xff
	ands r6, r0
	subs r0, r6, #2
	cmp r0, #0xa
	bhi _08011262
	lsls r0, r0, #2
	ldr r1, _080111AC @ =_080111B0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080111AC: .4byte _080111B0
_080111B0: @ jump table
	.4byte _08011224 @ case 0
	.4byte _080111DC @ case 1
	.4byte _0801124C @ case 2
	.4byte _08011238 @ case 3
	.4byte _080111F4 @ case 4
	.4byte _08011208 @ case 5
	.4byte _08011262 @ case 6
	.4byte _08011262 @ case 7
	.4byte _08011262 @ case 8
	.4byte _08011262 @ case 9
	.4byte _08011260 @ case 10
_080111DC:
	ldr r1, _080111F0 @ =0x0000FFC0
	ands r1, r5
	movs r0, #0x3f
	ands r0, r4
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r3, #5
	b _08011266
	.align 2, 0
_080111F0: .4byte 0x0000FFC0
_080111F4:
	ldr r1, _08011204 @ =0x0000FFC0
	ands r1, r5
	movs r0, #0x3f
	ands r0, r4
	lsrs r0, r0, #1
	subs r0, #0x3f
	b _08011214
	.align 2, 0
_08011204: .4byte 0x0000FFC0
_08011208:
	ldr r1, _08011220 @ =0x0000FFC0
	ands r1, r5
	movs r0, #0x3f
	ands r0, r4
	lsrs r0, r0, #1
	subs r0, #0x1f
_08011214:
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r3, #3
	b _08011266
	.align 2, 0
_08011220: .4byte 0x0000FFC0
_08011224:
	ldr r2, _08011234 @ =0x0000FFC0
	ands r2, r5
	movs r0, #0x3f
	ands r0, r4
	orrs r2, r0
	movs r3, #4
	b _08011266
	.align 2, 0
_08011234: .4byte 0x0000FFC0
_08011238:
	ldr r2, _08011248 @ =0x0000FFC0
	ands r2, r5
	movs r0, #0x3f
	ands r0, r4
	lsrs r0, r0, #1
	adds r0, #0x1f
	b _08011256
	.align 2, 0
_08011248: .4byte 0x0000FFC0
_0801124C:
	ldr r2, _0801125C @ =0x0000FFC0
	ands r2, r5
	movs r0, #0x3f
	ands r0, r4
	lsrs r0, r0, #1
_08011256:
	orrs r2, r0
	movs r3, #2
	b _08011266
	.align 2, 0
_0801125C: .4byte 0x0000FFC0
_08011260:
	movs r3, #0x10
_08011262:
	ldr r2, _08011274 @ =0x0000FFC0
	ands r2, r5
_08011266:
	cmp r6, #0xc
	bne _08011278
	subs r0, r5, r2
	cmp r0, #0x19
	bls _0801127C
	b _08011288
	.align 2, 0
_08011274: .4byte 0x0000FFC0
_08011278:
	cmp r5, r2
	blo _08011288
_0801127C:
	ldr r0, _08011284 @ =gPreviousVerticalCollisionCheck
	strb r3, [r0]
	b _0801128E
	.align 2, 0
_08011284: .4byte gPreviousVerticalCollisionCheck
_08011288:
	ldr r1, _08011298 @ =gPreviousVerticalCollisionCheck
	movs r0, #0
	strb r0, [r1]
_0801128E:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08011298: .4byte gPreviousVerticalCollisionCheck

	thumb_func_start SpriteUtilAdjustYPosOnSlope
SpriteUtilAdjustYPosOnSlope: @ 0x0801129C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r7, _08011308 @ =gCurrentSprite
	ldrh r5, [r7, #2]
	mov sb, r5
	ldrh r4, [r7, #4]
	mov sl, r4
	subs r0, r5, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPosition
	adds r2, r0, #0
	ldr r6, _0801130C @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf
	mov r8, r0
	ands r0, r1
	cmp r0, #1
	bhi _080112F6
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPosition
	adds r2, r0, #0
	ldrb r1, [r6]
	mov r0, r8
	ands r0, r1
	cmp r0, #1
	bhi _080112F6
	mov r0, sb
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	bl SpriteUtilCheckVerticalCollisionAtPosition
	adds r2, r0, #0
	ldrb r0, [r6]
	cmp r0, #0
	beq _080112F8
_080112F6:
	strh r2, [r7, #2]
_080112F8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011308: .4byte gCurrentSprite
_0801130C: .4byte gPreviousVerticalCollisionCheck

	thumb_func_start SpriteUtilAdjustYPosOnSlopeAtHitbox
SpriteUtilAdjustYPosOnSlopeAtHitbox: @ 0x08011310
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r6, _08011388 @ =gCurrentSprite
	ldrh r0, [r6, #0xc]
	ldrh r1, [r6, #2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov sb, r5
	ldrh r4, [r6, #4]
	mov sl, r4
	subs r0, r5, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPosition
	adds r2, r0, #0
	ldr r7, _0801138C @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r7]
	movs r0, #0xf
	mov r8, r0
	ands r0, r1
	cmp r0, #1
	bhi _08011372
	adds r0, r5, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPosition
	adds r2, r0, #0
	ldrb r1, [r7]
	mov r0, r8
	ands r0, r1
	cmp r0, #1
	bhi _08011372
	mov r0, sb
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, sl
	bl SpriteUtilCheckVerticalCollisionAtPosition
	adds r2, r0, #0
	ldrb r0, [r7]
	cmp r0, #0
	beq _08011378
_08011372:
	ldrh r0, [r6, #0xc]
	subs r0, r2, r0
	strh r0, [r6, #2]
_08011378:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011388: .4byte gCurrentSprite
_0801138C: .4byte gPreviousVerticalCollisionCheck

	thumb_func_start SpriteUtilCheckCollisionAtPosition
SpriteUtilCheckCollisionAtPosition: @ 0x08011390
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ClipdataProcess
	adds r3, r0, #0
	movs r2, #0x80
	lsls r2, r2, #0x11
	ands r2, r3
	cmp r2, #0
	beq _080113B8
	ldr r1, _080113B4 @ =gPreviousCollisionCheck
	movs r0, #0x11
	strb r0, [r1]
	adds r2, r1, #0
	b _080113BE
	.align 2, 0
_080113B4: .4byte gPreviousCollisionCheck
_080113B8:
	ldr r0, _080113D4 @ =gPreviousCollisionCheck
	strb r2, [r0]
	adds r2, r0, #0
_080113BE:
	movs r0, #0xff
	ands r0, r3
	subs r0, #2
	cmp r0, #0xa
	bhi _08011424
	lsls r0, r0, #2
	ldr r1, _080113D8 @ =_080113DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080113D4: .4byte gPreviousCollisionCheck
_080113D8: .4byte _080113DC
_080113DC: @ jump table
	.4byte _08011414 @ case 0
	.4byte _08011408 @ case 1
	.4byte _0801141C @ case 2
	.4byte _08011418 @ case 3
	.4byte _0801140C @ case 4
	.4byte _08011410 @ case 5
	.4byte _08011424 @ case 6
	.4byte _08011424 @ case 7
	.4byte _08011424 @ case 8
	.4byte _08011424 @ case 9
	.4byte _08011420 @ case 10
_08011408:
	movs r0, #5
	b _08011422
_0801140C:
	movs r0, #3
	b _08011422
_08011410:
	movs r0, #3
	b _08011422
_08011414:
	movs r0, #4
	b _08011422
_08011418:
	movs r0, #2
	b _08011422
_0801141C:
	movs r0, #2
	b _08011422
_08011420:
	movs r0, #0x10
_08011422:
	strb r0, [r2]
_08011424:
	pop {r0}
	bx r0

	thumb_func_start CurrentSpriteFalling
CurrentSpriteFalling: @ 0x08011428
	push {r4, r5, r6, lr}
	ldr r4, _0801144C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08011450 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08011454
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	b _08011490
	.align 2, 0
_0801144C: .4byte gCurrentSprite
_08011450: .4byte gPreviousVerticalCollisionCheck
_08011454:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0801147C @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08011480 @ =0x00007FFF
	cmp r1, r0
	bne _08011484
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0801148E
	.align 2, 0
_0801147C: .4byte sSpritesFallingSpeed
_08011480: .4byte 0x00007FFF
_08011484:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_0801148E:
	strh r0, [r4, #2]
_08011490:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SpriteUtilChooseRandomXFlip
SpriteUtilChooseRandomXFlip: @ 0x08011498
	push {lr}
	ldr r0, _080114B0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080114BC
	ldr r2, _080114B4 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _080114B8 @ =0x0000FFBF
	ands r0, r1
	b _080114C4
	.align 2, 0
_080114B0: .4byte gSpriteRandomNumber
_080114B4: .4byte gCurrentSprite
_080114B8: .4byte 0x0000FFBF
_080114BC:
	ldr r2, _080114CC @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	orrs r0, r1
_080114C4:
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080114CC: .4byte gCurrentSprite

	thumb_func_start SpriteUtilChooseRandomXDirection
SpriteUtilChooseRandomXDirection: @ 0x080114D0
	push {lr}
	ldr r0, _080114E8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080114F4
	ldr r2, _080114EC @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _080114F0 @ =0x0000FDFF
	ands r0, r1
	b _08011500
	.align 2, 0
_080114E8: .4byte gSpriteRandomNumber
_080114EC: .4byte gCurrentSprite
_080114F0: .4byte 0x0000FDFF
_080114F4:
	ldr r2, _08011508 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r1
_08011500:
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08011508: .4byte gCurrentSprite

	thumb_func_start SpriteUtilSpriteChooseRandomXDirectionWithRoomSlot
SpriteUtilSpriteChooseRandomXDirectionWithRoomSlot: @ 0x0801150C
	push {lr}
	ldr r2, _08011524 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801152C
	ldrh r1, [r2]
	ldr r0, _08011528 @ =0x0000FDFF
	ands r0, r1
	b _08011536
	.align 2, 0
_08011524: .4byte gCurrentSprite
_08011528: .4byte 0x0000FDFF
_0801152C:
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r1
_08011536:
	strh r0, [r2]
	pop {r0}
	bx r0

	thumb_func_start SpriteUtilMakeSpriteFaceSamusXFlip
SpriteUtilMakeSpriteFaceSamusXFlip: @ 0x0801153C
	push {lr}
	ldr r2, _08011554 @ =gCurrentSprite
	ldr r1, _08011558 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08011560
	ldrh r1, [r2]
	ldr r0, _0801155C @ =0x0000FFBF
	ands r0, r1
	b _08011566
	.align 2, 0
_08011554: .4byte gCurrentSprite
_08011558: .4byte gSamusData
_0801155C: .4byte 0x0000FFBF
_08011560:
	ldrh r1, [r2]
	movs r0, #0x40
	orrs r0, r1
_08011566:
	strh r0, [r2]
	pop {r0}
	bx r0

	thumb_func_start SpriteUtilMakeSpriteFaceSamusDirection
SpriteUtilMakeSpriteFaceSamusDirection: @ 0x0801156C
	push {lr}
	ldr r2, _08011584 @ =gCurrentSprite
	ldr r1, _08011588 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08011590
	ldrh r1, [r2]
	ldr r0, _0801158C @ =0x0000FDFF
	ands r0, r1
	b _0801159A
	.align 2, 0
_08011584: .4byte gCurrentSprite
_08011588: .4byte gSamusData
_0801158C: .4byte 0x0000FDFF
_08011590:
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r1
_0801159A:
	strh r0, [r2]
	pop {r0}
	bx r0

	thumb_func_start MakeSpriteFaceAwayFromSamusXFlip
MakeSpriteFaceAwayFromSamusXFlip: @ 0x080115A0
	push {lr}
	ldr r2, _080115B8 @ =gCurrentSprite
	ldr r1, _080115BC @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _080115C0
	ldrh r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	b _080115C6
	.align 2, 0
_080115B8: .4byte gCurrentSprite
_080115BC: .4byte gSamusData
_080115C0:
	ldrh r1, [r2]
	ldr r0, _080115CC @ =0x0000FFBF
	ands r0, r1
_080115C6:
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080115CC: .4byte 0x0000FFBF

	thumb_func_start SpriteUtilMakeSpriteFaceAwayFromSamusDirection
SpriteUtilMakeSpriteFaceAwayFromSamusDirection: @ 0x080115D0
	push {lr}
	ldr r2, _080115EC @ =gCurrentSprite
	ldr r1, _080115F0 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _080115F4
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r1
	b _080115FA
	.align 2, 0
_080115EC: .4byte gCurrentSprite
_080115F0: .4byte gSamusData
_080115F4:
	ldrh r1, [r2]
	ldr r0, _08011600 @ =0x0000FDFF
	ands r0, r1
_080115FA:
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08011600: .4byte 0x0000FDFF

	thumb_func_start unk_11604
unk_11604: @ 0x08011604
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r4, _08011638 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08011646
	ldr r0, _0801163C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #5
	bne _08011640
	lsls r0, r5, #0x10
	asrs r0, r0, #0xf
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	b _08011674
	.align 2, 0
_08011638: .4byte gCurrentSprite
_0801163C: .4byte gPreviousCollisionCheck
_08011640:
	cmp r0, #3
	bne _08011676
	b _08011664
_08011646:
	ldr r0, _0801165C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #4
	bne _08011660
	lsls r0, r5, #0x10
	asrs r0, r0, #0xf
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	b _08011674
	.align 2, 0
_0801165C: .4byte gPreviousCollisionCheck
_08011660:
	cmp r0, #2
	bne _08011676
_08011664:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r0, r1, r0
	cmp r0, #0
	bge _08011672
	adds r0, #3
_08011672:
	lsls r0, r0, #0xe
_08011674:
	lsrs r5, r0, #0x10
_08011676:
	ldr r2, _0801168C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08011690
	ldrh r0, [r2, #4]
	adds r0, r0, r5
	b _08011694
	.align 2, 0
_0801168C: .4byte gCurrentSprite
_08011690:
	ldrh r0, [r2, #4]
	subs r0, r0, r5
_08011694:
	strh r0, [r2, #4]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_1169c
unk_1169c: @ 0x0801169C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r4, _080116CC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080116DA
	ldr r0, _080116D0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #5
	bne _080116D4
	lsls r0, r5, #0x10
	asrs r0, r0, #0xf
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	b _08011708
	.align 2, 0
_080116CC: .4byte gCurrentSprite
_080116D0: .4byte gPreviousCollisionCheck
_080116D4:
	cmp r0, #3
	bne _0801170A
	b _080116F8
_080116DA:
	ldr r0, _080116F0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #4
	bne _080116F4
	lsls r0, r5, #0x10
	asrs r0, r0, #0xf
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #0x10
	b _08011708
	.align 2, 0
_080116F0: .4byte gPreviousCollisionCheck
_080116F4:
	cmp r0, #2
	bne _0801170A
_080116F8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r0, r1, r0
	cmp r0, #0
	bge _08011706
	adds r0, #3
_08011706:
	lsls r0, r0, #0xe
_08011708:
	lsrs r5, r0, #0x10
_0801170A:
	cmp r5, #0
	bne _08011710
	movs r5, #1
_08011710:
	ldr r2, _08011724 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08011728
	ldrh r0, [r2, #4]
	adds r0, r0, r5
	b _0801172C
	.align 2, 0
_08011724: .4byte gCurrentSprite
_08011728:
	ldrh r0, [r2, #4]
	subs r0, r0, r5
_0801172C:
	strh r0, [r2, #4]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start RotateSpriteTowardsSamus
RotateSpriteTowardsSamus: @ 0x08011734
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, [sp, #0x1c]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r0, r4, #0x10
	movs r2, #2
	mov r8, r2
	lsrs r2, r1, #0x10
	mov ip, r2
	lsrs r7, r3, #0x10
	cmp r1, r3
	bge _080117A0
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r2, r6, #0
	subs r2, #0x40
	mov r3, sb
	lsls r1, r3, #0x10
	asrs r3, r1, #0x10
	adds r4, r0, #0
	cmp r2, r3
	bge _08011776
	adds r0, r6, #0
	adds r0, #0x40
_08011776:
	cmp r1, r4
	ble _0801178A
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r2, ip
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	movs r2, #0xe0
	b _080117D2
_0801178A:
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r3, ip
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	movs r2, #0xa0
	cmp r1, #0x3f
	bgt _080117EC
	movs r2, #0x80
	b _08011814
_080117A0:
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	adds r2, r6, #0
	subs r2, #0x40
	mov r3, sb
	lsls r1, r3, #0x10
	asrs r3, r1, #0x10
	adds r4, r0, #0
	cmp r2, r3
	bge _080117C0
	adds r0, r6, #0
	adds r0, #0x40
	cmp r0, r3
	ble _080117C0
	movs r2, #0x40
	b _08011814
_080117C0:
	cmp r1, r4
	ble _080117D8
	mov r0, ip
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	movs r2, #0x20
_080117D2:
	cmp r1, #0x3f
	bgt _080117EC
	b _080117F0
_080117D8:
	mov r2, ip
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	movs r2, #0x60
	cmp r1, #0x3f
	bgt _080117EC
	movs r2, #0x80
_080117EC:
	cmp r2, #0
	bne _08011814
_080117F0:
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	ldr r3, _08011804 @ =0xFFFF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _08011808
	mov r1, r8
	subs r0, r5, r1
	b _08011920
	.align 2, 0
_08011804: .4byte 0xFFFF0000
_08011808:
	cmp r1, #0x7f
	bgt _0801180E
	b _08011924
_0801180E:
	mov r2, r8
	adds r0, r5, r2
	b _08011920
_08011814:
	cmp r2, #0x20
	bne _08011842
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0801182C @ =0xFFDF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _08011830
	mov r1, r8
	subs r0, r5, r1
	b _08011920
	.align 2, 0
_0801182C: .4byte 0xFFDF0000
_08011830:
	adds r0, r1, #0
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bls _08011924
	mov r2, r8
	adds r0, r5, r2
	b _08011920
_08011842:
	cmp r2, #0x40
	bne _08011872
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0801185C @ =0xFFBF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _08011860
	mov r1, r8
	subs r0, r5, r1
	b _08011920
	.align 2, 0
_0801185C: .4byte 0xFFBF0000
_08011860:
	adds r0, r1, #0
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bls _08011924
	mov r2, r8
	adds r0, r5, r2
	b _08011920
_08011872:
	cmp r2, #0x60
	bne _080118A2
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	ldr r3, _0801188C @ =0xFF9F0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _08011890
	mov r1, r8
	subs r0, r5, r1
	b _08011920
	.align 2, 0
_0801188C: .4byte 0xFF9F0000
_08011890:
	adds r0, r1, #0
	subs r0, #0x60
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bls _08011924
	mov r2, r8
	adds r0, r5, r2
	b _08011920
_080118A2:
	cmp r2, #0x80
	bne _080118C6
	lsls r0, r5, #0x10
	asrs r1, r0, #0x10
	ldr r3, _080118BC @ =0xFFFF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _080118C0
	mov r1, r8
	adds r0, r5, r1
	b _08011920
	.align 2, 0
_080118BC: .4byte 0xFFFF0000
_080118C0:
	cmp r1, #0x80
	ble _08011924
	b _0801191C
_080118C6:
	cmp r2, #0xa0
	bne _080118E0
	lsls r0, r5, #0x10
	ldr r3, _080118DC @ =0xFFDF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _08011918
	mov r1, r8
	adds r0, r5, r1
	b _08011920
	.align 2, 0
_080118DC: .4byte 0xFFDF0000
_080118E0:
	cmp r2, #0xc0
	bne _080118FC
	lsls r0, r5, #0x10
	ldr r3, _080118F8 @ =0xFFBF0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _08011918
	mov r1, r8
	adds r0, r5, r1
	b _08011920
	.align 2, 0
_080118F8: .4byte 0xFFBF0000
_080118FC:
	cmp r2, #0xe0
	bne _08011924
	lsls r0, r5, #0x10
	ldr r3, _08011914 @ =0xFF9F0000
	adds r0, r0, r3
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _08011918
	mov r1, r8
	adds r0, r5, r1
	b _08011920
	.align 2, 0
_08011914: .4byte 0xFF9F0000
_08011918:
	cmp r0, #0x7f
	bls _08011924
_0801191C:
	mov r2, r8
	subs r0, r5, r2
_08011920:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08011924:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SpriteUtilCheckEndCurrentSpriteAnim
SpriteUtilCheckEndCurrentSpriteAnim: @ 0x08011934
	push {lr}
	ldr r0, _08011960 @ =gCurrentSprite
	ldrb r1, [r0, #0x1c]
	ldrh r2, [r0, #0x16]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, [r0, #0x18]
	lsls r0, r2, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, r1
	bhs _08011964
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08011964
	movs r0, #1
	b _08011966
	.align 2, 0
_08011960: .4byte gCurrentSprite
_08011964:
	movs r0, #0
_08011966:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilCheckNearEndCurrentSpriteAnim
SpriteUtilCheckNearEndCurrentSpriteAnim: @ 0x0801196C
	push {lr}
	ldr r0, _0801199C @ =gCurrentSprite
	ldrb r1, [r0, #0x1c]
	ldrh r3, [r0, #0x16]
	lsls r1, r1, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	ldr r2, [r0, #0x18]
	lsls r0, r3, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, r1
	bhs _080119A0
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080119A0
	movs r0, #1
	b _080119A2
	.align 2, 0
_0801199C: .4byte gCurrentSprite
_080119A0:
	movs r0, #0
_080119A2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilCheckEndSpriteAnim
SpriteUtilCheckEndSpriteAnim: @ 0x080119A8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080119E4 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r3
	ldrb r2, [r0, #0x1c]
	ldrh r4, [r0, #0x16]
	adds r2, #1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r3, #0x18
	adds r1, r1, r3
	ldr r1, [r1]
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	cmp r0, r2
	bhs _080119E8
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080119E8
	movs r0, #1
	b _080119EA
	.align 2, 0
_080119E4: .4byte gSpriteData
_080119E8:
	movs r0, #0
_080119EA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SpriteUtilCheckNearEndSpriteAnim
SpriteUtilCheckNearEndSpriteAnim: @ 0x080119F0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _08011A30 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r0, r1, r3
	ldrb r2, [r0, #0x1c]
	ldrh r4, [r0, #0x16]
	lsls r2, r2, #0x18
	movs r0, #0x80
	lsls r0, r0, #0x12
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	adds r3, #0x18
	adds r1, r1, r3
	ldr r1, [r1]
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	cmp r0, r2
	bhs _08011A34
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08011A34
	movs r0, #1
	b _08011A36
	.align 2, 0
_08011A30: .4byte gSpriteData
_08011A34:
	movs r0, #0
_08011A36:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SpriteUtilCheckEndSubSprite1Anim
SpriteUtilCheckEndSubSprite1Anim: @ 0x08011A3C
	push {lr}
	ldr r0, _08011A68 @ =gSubSpriteData1
	ldrb r1, [r0, #6]
	ldrh r2, [r0, #4]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, [r0]
	lsls r0, r2, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, r1
	bhs _08011A6C
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08011A6C
	movs r0, #1
	b _08011A6E
	.align 2, 0
_08011A68: .4byte gSubSpriteData1
_08011A6C:
	movs r0, #0
_08011A6E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilCheckNearEndSubSprite1Anim
SpriteUtilCheckNearEndSubSprite1Anim: @ 0x08011A74
	push {lr}
	ldr r0, _08011AA4 @ =gSubSpriteData1
	ldrb r1, [r0, #6]
	ldrh r3, [r0, #4]
	lsls r1, r1, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	ldr r2, [r0]
	lsls r0, r3, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, r1
	bhs _08011AA8
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08011AA8
	movs r0, #1
	b _08011AAA
	.align 2, 0
_08011AA4: .4byte gSubSpriteData1
_08011AA8:
	movs r0, #0
_08011AAA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckEndOfSubSpriteData2Animation
CheckEndOfSubSpriteData2Animation: @ 0x08011AB0
	push {lr}
	ldr r0, _08011ADC @ =gSubSpriteData2
	ldrb r1, [r0, #6]
	ldrh r2, [r0, #4]
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, [r0]
	lsls r0, r2, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, r1
	bhs _08011AE0
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08011AE0
	movs r0, #1
	b _08011AE2
	.align 2, 0
_08011ADC: .4byte gSubSpriteData2
_08011AE0:
	movs r0, #0
_08011AE2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckNearEndOfSubSpriteData2Animation
CheckNearEndOfSubSpriteData2Animation: @ 0x08011AE8
	push {lr}
	ldr r0, _08011B18 @ =gSubSpriteData2
	ldrb r1, [r0, #6]
	ldrh r3, [r0, #4]
	lsls r1, r1, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x12
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	ldr r2, [r0]
	lsls r0, r3, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, r1
	bhs _08011B1C
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08011B1C
	movs r0, #1
	b _08011B1E
	.align 2, 0
_08011B18: .4byte gSubSpriteData2
_08011B1C:
	movs r0, #0
_08011B1E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilCheckSamusNearSpriteLeftRight
SpriteUtilCheckSamusNearSpriteLeftRight: @ 0x08011B24
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r6, #0
	ldr r2, _08011B54 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r4, [r2, #0x16]
	ldr r0, _08011B58 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	ldrh r2, [r0, #4]
	cmp r1, r3
	bls _08011B5C
	subs r0, r1, r3
	b _08011B5E
	.align 2, 0
_08011B54: .4byte gSamusData
_08011B58: .4byte gCurrentSprite
_08011B5C:
	subs r0, r3, r1
_08011B5E:
	cmp r0, r5
	blt _08011B66
	movs r0, #0
	b _08011B7E
_08011B66:
	cmp r2, r4
	bls _08011B74
	subs r0, r2, r4
	cmp r0, r7
	bge _08011B7C
	movs r6, #4
	b _08011B7C
_08011B74:
	subs r0, r4, r2
	cmp r0, r7
	bge _08011B7C
	movs r6, #8
_08011B7C:
	adds r0, r6, #0
_08011B7E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CheckSamusNearSpriteAboveBelow
CheckSamusNearSpriteAboveBelow: @ 0x08011B84
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r5, #0
	ldr r2, _08011BB4 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r2, #0x16]
	ldr r0, _08011BB8 @ =gCurrentSprite
	ldrh r2, [r0, #2]
	ldrh r0, [r0, #4]
	cmp r0, r1
	bls _08011BBC
	subs r0, r0, r1
	b _08011BBE
	.align 2, 0
_08011BB4: .4byte gSamusData
_08011BB8: .4byte gCurrentSprite
_08011BBC:
	subs r0, r1, r0
_08011BBE:
	cmp r0, r4
	blt _08011BC6
	movs r0, #0
	b _08011BDE
_08011BC6:
	cmp r2, r3
	bls _08011BD4
	subs r0, r2, r3
	cmp r0, r6
	bge _08011BDC
	movs r5, #1
	b _08011BDC
_08011BD4:
	subs r0, r3, r2
	cmp r0, r6
	bge _08011BDC
	movs r5, #2
_08011BDC:
	adds r0, r5, #0
_08011BDE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SpriteUtilCheckSamusNearSpriteFrontBehind
SpriteUtilCheckSamusNearSpriteFrontBehind: @ 0x08011BE4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov ip, r0
	movs r6, #0
	ldr r2, _08011C28 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r5, [r2, #0x16]
	ldr r0, _08011C2C @ =gCurrentSprite
	ldrh r2, [r0, #2]
	ldrh r4, [r0, #4]
	adds r1, r0, #0
	cmp r2, r3
	bls _08011C30
	subs r0, r2, r3
	b _08011C32
	.align 2, 0
_08011C28: .4byte gSamusData
_08011C2C: .4byte gCurrentSprite
_08011C30:
	subs r0, r3, r2
_08011C32:
	cmp r0, r7
	blt _08011C3A
	movs r0, #0
	b _08011C80
_08011C3A:
	ldrh r1, [r1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08011C46
	movs r6, #1
_08011C46:
	cmp r4, r5
	bls _08011C64
	cmp r6, #0
	beq _08011C5A
	subs r0, r4, r5
	cmp r0, r8
	bge _08011C7E
	movs r0, #0xc
	mov ip, r0
	b _08011C7E
_08011C5A:
	subs r0, r4, r5
	cmp r0, sb
	bge _08011C7E
	movs r1, #3
	b _08011C7C
_08011C64:
	cmp r6, #0
	beq _08011C74
	subs r0, r5, r4
	cmp r0, sb
	bge _08011C7E
	movs r0, #3
	mov ip, r0
	b _08011C7E
_08011C74:
	subs r0, r5, r4
	cmp r0, r8
	bge _08011C7E
	movs r1, #0xc
_08011C7C:
	mov ip, r1
_08011C7E:
	mov r0, ip
_08011C80:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CheckSamusNearSpriteFrontBehindY
CheckSamusNearSpriteFrontBehindY: @ 0x08011C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov ip, r0
	movs r6, #0
	ldr r2, _08011CD0 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r3, [r2, #0x16]
	ldr r0, _08011CD4 @ =gCurrentSprite
	ldrh r4, [r0, #2]
	ldrh r2, [r0, #4]
	adds r1, r0, #0
	cmp r2, r3
	bls _08011CD8
	subs r0, r2, r3
	b _08011CDA
	.align 2, 0
_08011CD0: .4byte gSamusData
_08011CD4: .4byte gCurrentSprite
_08011CD8:
	subs r0, r3, r2
_08011CDA:
	cmp r0, r7
	blt _08011CE2
	movs r0, #0
	b _08011D2A
_08011CE2:
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08011CF0
	movs r6, #1
_08011CF0:
	cmp r4, r5
	bls _08011D0E
	cmp r6, #0
	beq _08011D04
	subs r0, r4, r5
	cmp r0, r8
	bge _08011D28
	movs r0, #0xc
	mov ip, r0
	b _08011D28
_08011D04:
	subs r0, r4, r5
	cmp r0, sb
	bge _08011D28
	movs r1, #3
	b _08011D26
_08011D0E:
	cmp r6, #0
	beq _08011D1E
	subs r0, r5, r4
	cmp r0, sb
	bge _08011D28
	movs r0, #3
	mov ip, r0
	b _08011D28
_08011D1E:
	subs r0, r5, r4
	cmp r0, r8
	bge _08011D28
	movs r1, #0xc
_08011D26:
	mov ip, r1
_08011D28:
	mov r0, ip
_08011D2A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckSamusNearSpriteAboveBelowSeparateRanges
CheckSamusNearSpriteAboveBelowSeparateRanges: @ 0x08011D38
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r5, #0
	ldr r2, _08011D6C @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r2, #0x16]
	ldr r0, _08011D70 @ =gCurrentSprite
	ldrh r2, [r0, #2]
	ldrh r0, [r0, #4]
	cmp r0, r1
	bls _08011D74
	subs r0, r0, r1
	b _08011D76
	.align 2, 0
_08011D6C: .4byte gSamusData
_08011D70: .4byte gCurrentSprite
_08011D74:
	subs r0, r1, r0
_08011D76:
	cmp r0, r4
	blt _08011D7E
	movs r0, #0
	b _08011D96
_08011D7E:
	cmp r2, r3
	bls _08011D8C
	subs r0, r2, r3
	cmp r0, r6
	bge _08011D94
	movs r5, #1
	b _08011D94
_08011D8C:
	subs r0, r3, r2
	cmp r0, r7
	bge _08011D94
	movs r5, #2
_08011D94:
	adds r0, r5, #0
_08011D96:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SpriteUtilSamusStandingOnSprite
SpriteUtilSamusStandingOnSprite: @ 0x08011D9C
	push {r4, r5, lr}
	ldr r4, _08011DE4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	cmp r0, #0
	beq _08011DF4
	ldr r1, _08011DE8 @ =gSamusData
	adds r5, r1, #0
	adds r5, #0x20
	ldrb r0, [r5]
	cmp r0, #1
	beq _08011DD8
	cmp r0, #2
	bne _08011DD2
	ldr r0, _08011DEC @ =sSamusSetPoseFunctionPointer
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0xfd
	bl _call_via_r1
_08011DD2:
	movs r0, #1
	strb r0, [r5]
	adds r2, r4, #0
_08011DD8:
	ldrh r1, [r2]
	ldr r0, _08011DF0 @ =0x0000EFFF
	ands r0, r1
	strh r0, [r2]
	b _08011E3A
	.align 2, 0
_08011DE4: .4byte gCurrentSprite
_08011DE8: .4byte gSamusData
_08011DEC: .4byte sSamusSetPoseFunctionPointer
_08011DF0: .4byte 0x0000EFFF
_08011DF4:
	adds r2, r4, #0
	adds r2, #0x33
	ldrb r1, [r2]
	cmp r1, #1
	beq _08011E28
	cmp r1, #2
	bne _08011E3A
	movs r0, #1
	strb r0, [r2]
	ldr r0, _08011E20 @ =gSamusDataCopy
	ldr r1, _08011E24 @ =gSamusData
	ldrh r0, [r0, #0x18]
	ldrh r2, [r1, #0x18]
	cmp r0, r2
	bhi _08011E3A
	ldrh r0, [r4, #0xa]
	ldrh r4, [r4, #2]
	adds r0, r0, r4
	adds r0, #1
	strh r0, [r1, #0x18]
	b _08011E3A
	.align 2, 0
_08011E20: .4byte gSamusDataCopy
_08011E24: .4byte gSamusData
_08011E28:
	strb r0, [r2]
	ldr r0, _08011E40 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08011E3A
	movs r0, #2
	strb r0, [r1]
_08011E3A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011E40: .4byte gSamusData

	thumb_func_start SpriteUtilUpdateFreezeTimer
SpriteUtilUpdateFreezeTimer: @ 0x08011E44
	push {r4, r5, lr}
	ldr r0, _08011E90 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	ldr r4, _08011E94 @ =gCurrentSprite
	cmp r0, #0
	beq _08011E60
	adds r1, r4, #0
	adds r1, #0x32
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
_08011E60:
	adds r3, r4, #0
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r2, [r0]
	cmp r2, #0
	bne _08011E72
	ldrb r0, [r3, #0x1c]
	subs r0, #1
	strb r0, [r3, #0x1c]
_08011E72:
	cmp r2, #0x2d
	bhi _08011E9E
	adds r1, r5, #0
	ands r1, r2
	cmp r1, #0
	beq _08011E98
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r3, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r3, #0
	b _08011E9A
	.align 2, 0
_08011E90: .4byte gFrameCounter8Bit
_08011E94: .4byte gCurrentSprite
_08011E98:
	adds r0, r4, #0
_08011E9A:
	adds r0, #0x20
	strb r1, [r0]
_08011E9E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SpriteUtilUpdateSecondarySpritesFreezeTimer
SpriteUtilUpdateSecondarySpritesFreezeTimer: @ 0x08011EA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r0, _08011F38 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r0, [r1]
	cmp r0, #0
	beq _08011F2E
	movs r5, #0
	ldr r0, _08011F3C @ =gSpriteData
	mov r8, r0
	mov ip, r1
_08011EC6:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08011F24
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r4, [r0]
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _08011F24
	ldrb r0, [r2, #0x1d]
	cmp r0, r7
	bne _08011F24
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, r6
	bne _08011F24
	adds r3, r2, #0
	adds r3, #0x32
	mov r0, ip
	ldrb r1, [r0]
	ldrb r0, [r3]
	cmp r0, r1
	bhs _08011F24
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	bne _08011F24
	strb r1, [r3]
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08011F24:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _08011EC6
_08011F2E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011F38: .4byte gCurrentSprite
_08011F3C: .4byte gSpriteData

	thumb_func_start SpriteUtilUpdatePrimarySpriteFreezeTimer
SpriteUtilUpdatePrimarySpriteFreezeTimer: @ 0x08011F40
	push {r4, lr}
	ldr r0, _08011F98 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r4, [r1]
	adds r3, r4, #0
	cmp r3, #0
	beq _08011F90
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _08011F9C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	movs r0, #0x32
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, r3
	bhs _08011F90
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08011F90
	mov r1, ip
	strb r4, [r1]
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08011F90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011F98: .4byte gCurrentSprite
_08011F9C: .4byte gSpriteData

	thumb_func_start SpriteUtilUnfreezeSecondarySprites
SpriteUtilUnfreezeSecondarySprites: @ 0x08011FA0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r3, #0
	ldr r7, _08012004 @ =gSpriteData
	movs r4, #0
_08011FB0:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r7
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08011FF2
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08011FF2
	ldrb r0, [r2, #0x1d]
	cmp r0, r6
	bne _08011FF2
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, r5
	bne _08011FF2
	adds r1, r2, #0
	adds r1, #0x32
	ldrb r0, [r1]
	cmp r0, #0
	beq _08011FF2
	strb r4, [r1]
	adds r0, r2, #0
	adds r0, #0x20
	strb r4, [r0]
_08011FF2:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _08011FB0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012004: .4byte gSpriteData

	thumb_func_start unk_12008
unk_12008: @ 0x08012008
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r3, _0801203C @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bls _080120A4
	ldrh r1, [r3, #0x14]
	cmp r1, #0
	bne _080120A4
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r2, [r0]
	adds r6, r2, #0
	cmp r2, #0x19
	bhi _08012040
	strh r1, [r3]
	b _080120A4
	.align 2, 0
_0801203C: .4byte gCurrentSprite
_08012040:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08012050
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
_08012050:
	cmp r2, #0x1d
	beq _0801208A
	cmp r2, #0x1d
	bgt _0801205E
	cmp r2, #0x1a
	beq _0801209A
	b _080120A4
_0801205E:
	cmp r6, #0x20
	beq _08012080
	cmp r6, #0x26
	bne _080120A4
	adds r0, r4, #0
	subs r0, #0x10
	adds r1, r5, #0
	movs r2, #0x26
	bl ParticleSet
	ldr r0, _0801207C @ =0x00000145
	bl SoundPlay
	b _080120A4
	.align 2, 0
_0801207C: .4byte 0x00000145
_08012080:
	adds r0, r4, #0
	adds r0, #8
	adds r1, r5, #0
	subs r1, #0xa
	b _08012092
_0801208A:
	adds r0, r4, #0
	subs r0, #8
	adds r1, r5, #0
	adds r1, #0x14
_08012092:
	movs r2, #0x26
	bl ParticleSet
	b _080120A4
_0801209A:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x25
	bl ParticleSet
_080120A4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_120ac
unk_120ac: @ 0x080120AC
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r3, _080120E0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bls _08012146
	ldrh r1, [r3, #0x14]
	cmp r1, #0
	bne _08012146
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r2, [r0]
	adds r6, r2, #0
	cmp r2, #0x19
	bhi _080120E4
	strh r1, [r3]
	b _08012146
	.align 2, 0
_080120E0: .4byte gCurrentSprite
_080120E4:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _080120F4
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
_080120F4:
	cmp r2, #0x1d
	beq _0801212E
	cmp r2, #0x1d
	bgt _08012102
	cmp r2, #0x1a
	beq _0801213C
	b _08012146
_08012102:
	cmp r6, #0x20
	beq _08012124
	cmp r6, #0x26
	bne _08012146
	adds r0, r4, #0
	subs r0, #0x28
	adds r1, r5, #0
	subs r1, #0x1e
	movs r2, #0x25
	bl ParticleSet
	ldr r0, _08012120 @ =0x00000145
	bl SoundPlay
	b _08012146
	.align 2, 0
_08012120: .4byte 0x00000145
_08012124:
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	adds r1, #0x1e
	b _08012134
_0801212E:
	adds r1, r5, #0
	subs r1, #0x10
	adds r0, r4, #0
_08012134:
	movs r2, #0x25
	bl ParticleSet
	b _08012146
_0801213C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x24
	bl ParticleSet
_08012146:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_1214c
unk_1214c: @ 0x0801214C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0x25
	bl ParticleSet
	pop {r0}
	bx r0

	thumb_func_start unk_12160
unk_12160: @ 0x08012160
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r3, _08012180 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r2, [r0]
	adds r6, r2, #0
	cmp r2, #8
	bhi _080121DA
	cmp r2, #0
	bne _08012184
	strh r2, [r3]
	b _080121DA
	.align 2, 0
_08012180: .4byte gCurrentSprite
_08012184:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	bne _08012194
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
_08012194:
	cmp r2, #4
	beq _080121BC
	cmp r2, #4
	bgt _080121A2
	cmp r2, #2
	beq _080121CC
	b _080121DA
_080121A2:
	cmp r6, #6
	bne _080121DA
	adds r0, r4, #0
	subs r0, #0x10
	adds r1, r5, #0
	movs r2, #0x26
	bl ParticleSet
	movs r0, #0xa2
	lsls r0, r0, #1
	bl SoundPlay
	b _080121DA
_080121BC:
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	subs r1, #0x10
	movs r2, #0x26
	bl ParticleSet
	b _080121DA
_080121CC:
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0x10
	movs r2, #0x25
	bl ParticleSet
_080121DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_121e0
unk_121e0: @ 0x080121E0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r3, _0801222C @ =gSpriteData
	ldr r2, _08012230 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08012214
	adds r1, r2, #0
	adds r1, #0x26
	ldrb r0, [r1]
	cmp r0, #0xe
	bls _08012214
	movs r0, #0xe
	strb r0, [r1]
_08012214:
	adds r3, r2, #0
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r1, [r0]
	adds r6, r1, #0
	cmp r1, #0xe
	bhi _080122CA
	cmp r1, #0
	bne _08012234
	strh r1, [r3]
	b _080122CA
	.align 2, 0
_0801222C: .4byte gSpriteData
_08012230: .4byte gCurrentSprite
_08012234:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _08012244
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_08012244:
	subs r0, r6, #2
	cmp r0, #0xa
	bhi _080122CA
	lsls r0, r0, #2
	ldr r1, _08012254 @ =_08012258
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012254: .4byte _08012258
_08012258: @ jump table
	.4byte _080122C0 @ case 0
	.4byte _080122CA @ case 1
	.4byte _080122B0 @ case 2
	.4byte _080122CA @ case 3
	.4byte _080122A6 @ case 4
	.4byte _080122CA @ case 5
	.4byte _0801229C @ case 6
	.4byte _080122CA @ case 7
	.4byte _0801228C @ case 8
	.4byte _080122CA @ case 9
	.4byte _08012284 @ case 10
_08012284:
	adds r0, r4, #0
	subs r0, #0x10
	adds r1, r5, #0
	b _08012294
_0801228C:
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	subs r1, #0x10
_08012294:
	movs r2, #0x26
	bl ParticleSet
	b _080122CA
_0801229C:
	adds r0, r4, #0
	adds r0, #0x10
	adds r1, r5, #0
	adds r1, #0x10
	b _080122B8
_080122A6:
	adds r0, r4, #0
	adds r0, #0x18
	adds r1, r5, #0
	subs r1, #0x18
	b _080122B8
_080122B0:
	adds r0, r4, #0
	subs r0, #0x1c
	adds r1, r5, #0
	subs r1, #0x14
_080122B8:
	movs r2, #0x25
	bl ParticleSet
	b _080122CA
_080122C0:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x23
	bl ParticleSet
_080122CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_122d0
unk_122d0: @ 0x080122D0
	push {lr}
	adds r3, r0, #0
	ldr r0, _080122FC @ =gCurrentSprite
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080122F6
	ldr r2, _08012300 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r1, r0
	str r3, [r0]
	adds r1, r1, r2
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
_080122F6:
	pop {r0}
	bx r0
	.align 2, 0
_080122FC: .4byte gCurrentSprite
_08012300: .4byte gSpriteData

	thumb_func_start SetSecondarySpriteOAMPointer
SetSecondarySpriteOAMPointer: @ 0x08012304
	ldr r1, _08012324 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r1, [r1]
	ldr r3, _08012328 @ =gSpriteData
	lsls r2, r1, #3
	subs r2, r2, r1
	lsls r2, r2, #3
	adds r1, r3, #0
	adds r1, #0x18
	adds r1, r2, r1
	str r0, [r1]
	adds r2, r2, r3
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	bx lr
	.align 2, 0
_08012324: .4byte gCurrentSprite
_08012328: .4byte gSpriteData

	thumb_func_start SetEnergyAndAmmoToMax_Unused
SetEnergyAndAmmoToMax_Unused: @ 0x0801232C
	ldr r0, _0801233C @ =gEquipment
	ldrh r1, [r0, #2]
	strh r1, [r0]
	ldrh r1, [r0, #6]
	strh r1, [r0, #4]
	ldrb r1, [r0, #9]
	strb r1, [r0, #8]
	bx lr
	.align 2, 0
_0801233C: .4byte gEquipment

	thumb_func_start SpriteUtilRefillEnergy
SpriteUtilRefillEnergy: @ 0x08012340
	push {lr}
	ldr r2, _08012360 @ =gEquipment
	ldrh r0, [r2]
	ldrh r3, [r2, #2]
	adds r1, r3, #0
	cmp r0, r1
	bhs _08012364
	adds r0, #0xa
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bls _0801235C
	strh r3, [r2]
_0801235C:
	movs r0, #1
	b _08012366
	.align 2, 0
_08012360: .4byte gEquipment
_08012364:
	movs r0, #0
_08012366:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilRefillMissiles
SpriteUtilRefillMissiles: @ 0x0801236C
	push {lr}
	ldr r2, _0801238C @ =gEquipment
	ldrh r0, [r2, #4]
	ldrh r3, [r2, #6]
	adds r1, r3, #0
	cmp r0, r1
	bhs _08012390
	adds r0, #0xa
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bls _08012388
	strh r3, [r2, #4]
_08012388:
	movs r0, #1
	b _08012392
	.align 2, 0
_0801238C: .4byte gEquipment
_08012390:
	movs r0, #0
_08012392:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilRefillPowerBombs
SpriteUtilRefillPowerBombs: @ 0x08012398
	push {lr}
	ldr r2, _080123B8 @ =gEquipment
	ldrb r0, [r2, #8]
	ldrb r3, [r2, #9]
	adds r1, r3, #0
	cmp r0, r1
	bhs _080123BC
	adds r0, #0xa
	strb r0, [r2, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r1
	bls _080123B4
	strb r3, [r2, #8]
_080123B4:
	movs r0, #1
	b _080123BE
	.align 2, 0
_080123B8: .4byte gEquipment
_080123BC:
	movs r0, #0
_080123BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilRefillSamus
SpriteUtilRefillSamus: @ 0x080123C4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	ldr r1, _08012428 @ =gEquipment
	lsrs r0, r0, #0x10
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	ldrh r2, [r1, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, r2
	bls _080123E8
	strh r2, [r3]
_080123E8:
	ldrb r1, [r3, #0xb]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08012404
	ldrh r0, [r3, #4]
	adds r0, r4, r0
	strh r0, [r3, #4]
	ldrh r1, [r3, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bls _08012404
	strh r1, [r3, #4]
_08012404:
	ldrb r1, [r3, #0xb]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08012420
	ldrb r0, [r3, #8]
	adds r0, r0, r5
	strb r0, [r3, #8]
	ldrb r1, [r3, #9]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r1
	bls _08012420
	strb r1, [r3, #8]
_08012420:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08012428: .4byte gEquipment

	thumb_func_start HealSamusOfOneTank
HealSamusOfOneTank: @ 0x0801242C
	push {r4, r5, lr}
	ldr r0, _0801249C @ =gEquipment
	ldrh r3, [r0]
	ldrh r4, [r0, #2]
	adds r1, r4, #0
	adds r2, r0, #0
	cmp r3, r1
	beq _0801244C
	adds r0, r3, #0
	adds r0, #0x64
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r1
	bls _0801244C
	strh r4, [r2]
_0801244C:
	ldrh r4, [r2, #4]
	ldrh r5, [r2, #6]
	adds r3, r5, #0
	cmp r4, r3
	beq _08012470
	ldrb r1, [r2, #0xb]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08012470
	adds r0, r4, #0
	adds r0, #0x10
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, r3
	bls _08012470
	strh r5, [r2, #4]
_08012470:
	ldrb r4, [r2, #8]
	ldrb r5, [r2, #9]
	adds r3, r5, #0
	cmp r4, r3
	beq _08012494
	ldrb r1, [r2, #0xb]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08012494
	adds r0, r4, #0
	adds r0, #0x10
	strb r0, [r2, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r3
	bls _08012494
	strb r5, [r2, #8]
_08012494:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801249C: .4byte gEquipment

	thumb_func_start CheckEnergyFullAndMissilesNotFull
CheckEnergyFullAndMissilesNotFull: @ 0x080124A0
	push {lr}
	ldr r2, _080124C4 @ =gEquipment
	ldrh r0, [r2]
	ldrh r1, [r2, #2]
	cmp r0, r1
	bne _080124C8
	ldrb r1, [r2, #0xb]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080124C8
	ldrh r0, [r2, #4]
	ldrh r2, [r2, #6]
	cmp r0, r2
	bhs _080124C8
	movs r0, #1
	b _080124CA
	.align 2, 0
_080124C4: .4byte gEquipment
_080124C8:
	movs r0, #0
_080124CA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckMissilesFullAndEnergyNotFull
CheckMissilesFullAndEnergyNotFull: @ 0x080124D0
	push {lr}
	ldr r2, _080124F4 @ =gEquipment
	ldrb r1, [r2, #0xb]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080124EE
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #6]
	cmp r0, r1
	bne _080124F8
	ldrh r0, [r2]
	ldrh r2, [r2, #2]
	cmp r0, r2
	bhs _080124F8
_080124EE:
	movs r0, #1
	b _080124FA
	.align 2, 0
_080124F4: .4byte gEquipment
_080124F8:
	movs r0, #0
_080124FA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusCheckPassThroughFrozenSprite
SamusCheckPassThroughFrozenSprite: @ 0x08012500
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r4, #0
	ldr r1, _08012520 @ =gSamusData
	ldrb r0, [r1, #1]
	subs r0, #0xa
	adds r3, r1, #0
	cmp r0, #0x1a
	bhi _080125AE
	lsls r0, r0, #2
	ldr r1, _08012524 @ =_08012528
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012520: .4byte gSamusData
_08012524: .4byte _08012528
_08012528: @ jump table
	.4byte _08012594 @ case 0
	.4byte _08012594 @ case 1
	.4byte _080125AE @ case 2
	.4byte _080125AE @ case 3
	.4byte _080125AE @ case 4
	.4byte _080125AE @ case 5
	.4byte _080125AE @ case 6
	.4byte _080125AE @ case 7
	.4byte _080125AE @ case 8
	.4byte _080125AE @ case 9
	.4byte _080125AE @ case 10
	.4byte _08012594 @ case 11
	.4byte _08012594 @ case 12
	.4byte _080125AE @ case 13
	.4byte _080125B4 @ case 14
	.4byte _080125B4 @ case 15
	.4byte _080125B4 @ case 16
	.4byte _080125B4 @ case 17
	.4byte _080125AE @ case 18
	.4byte _08012594 @ case 19
	.4byte _080125B4 @ case 20
	.4byte _080125AE @ case 21
	.4byte _080125AE @ case 22
	.4byte _080125AE @ case 23
	.4byte _080125AE @ case 24
	.4byte _080125AE @ case 25
	.4byte _080125B4 @ case 26
_08012594:
	ldrb r0, [r3, #0xc]
	cmp r0, #0x3f
	bls _080125BA
	cmp r2, #0x80
	beq _080125B4
	adds r0, r2, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _080125BA
	b _080125B4
_080125AE:
	ldrb r0, [r3, #6]
	cmp r0, #0
	beq _080125BA
_080125B4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080125BA:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilSamusCheckCrouchingOrMorphed
SpriteUtilSamusCheckCrouchingOrMorphed: @ 0x080125C4
	push {lr}
	ldr r0, _080125DC @ =gSamusData
	ldrb r0, [r0, #1]
	subs r0, #7
	cmp r0, #0xb
	bhi _08012618
	lsls r0, r0, #2
	ldr r1, _080125E0 @ =_080125E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080125DC: .4byte gSamusData
_080125E0: .4byte _080125E4
_080125E4: @ jump table
	.4byte _08012614 @ case 0
	.4byte _08012614 @ case 1
	.4byte _08012614 @ case 2
	.4byte _08012618 @ case 3
	.4byte _08012618 @ case 4
	.4byte _08012614 @ case 5
	.4byte _08012614 @ case 6
	.4byte _08012614 @ case 7
	.4byte _08012614 @ case 8
	.4byte _08012614 @ case 9
	.4byte _08012618 @ case 10
	.4byte _08012614 @ case 11
_08012614:
	movs r0, #1
	b _0801261A
_08012618:
	movs r0, #0
_0801261A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilCheckMorphed
SpriteUtilCheckMorphed: @ 0x08012620
	push {lr}
	ldr r0, _08012638 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0xc
	blt _0801263C
	cmp r0, #0x10
	ble _08012632
	cmp r0, #0x12
	bne _0801263C
_08012632:
	movs r0, #1
	b _0801263E
	.align 2, 0
_08012638: .4byte gSamusData
_0801263C:
	movs r0, #0
_0801263E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilCheckStopSpritesPose
SpriteUtilCheckStopSpritesPose: @ 0x08012644
	push {lr}
	ldr r0, _08012654 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08012658
_0801264E:
	movs r0, #1
	b _080126F2
	.align 2, 0
_08012654: .4byte gPreventMovementTimer
_08012658:
	ldr r0, _0801266C @ =gSamusData
	ldrb r0, [r0, #1]
	subs r0, #0x20
	cmp r0, #0x1e
	bhi _080126F0
	lsls r0, r0, #2
	ldr r1, _08012670 @ =_08012674
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801266C: .4byte gSamusData
_08012670: .4byte _08012674
_08012674: @ jump table
	.4byte _0801264E @ case 0
	.4byte _080126F0 @ case 1
	.4byte _080126F0 @ case 2
	.4byte _080126F0 @ case 3
	.4byte _080126F0 @ case 4
	.4byte _080126F0 @ case 5
	.4byte _080126F0 @ case 6
	.4byte _080126F0 @ case 7
	.4byte _080126F0 @ case 8
	.4byte _080126F0 @ case 9
	.4byte _080126F0 @ case 10
	.4byte _080126F0 @ case 11
	.4byte _080126F0 @ case 12
	.4byte _080126F0 @ case 13
	.4byte _080126F0 @ case 14
	.4byte _080126F0 @ case 15
	.4byte _080126F0 @ case 16
	.4byte _080126F0 @ case 17
	.4byte _080126F0 @ case 18
	.4byte _080126F0 @ case 19
	.4byte _0801264E @ case 20
	.4byte _0801264E @ case 21
	.4byte _0801264E @ case 22
	.4byte _0801264E @ case 23
	.4byte _080126F0 @ case 24
	.4byte _0801264E @ case 25
	.4byte _0801264E @ case 26
	.4byte _0801264E @ case 27
	.4byte _080126F0 @ case 28
	.4byte _0801264E @ case 29
	.4byte _0801264E @ case 30
_080126F0:
	movs r0, #0
_080126F2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusCheckDamagingPose
SamusCheckDamagingPose: @ 0x080126F8
	push {lr}
	movs r1, #0
	ldr r2, _08012718 @ =gSamusData
	ldrb r0, [r2, #1]
	cmp r0, #0x1e
	beq _0801270E
	cmp r0, #0x24
	beq _0801270E
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _08012710
_0801270E:
	movs r1, #1
_08012710:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08012718: .4byte gSamusData

	thumb_func_start SamusCheckSudoScrew
SamusCheckSudoScrew: @ 0x0801271C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r4, #0
	ldr r1, _0801273C @ =gSamusData
	ldrb r0, [r1, #1]
	subs r0, #0xa
	adds r3, r1, #0
	cmp r0, #0x13
	bhi _080127B2
	lsls r0, r0, #2
	ldr r1, _08012740 @ =_08012744
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801273C: .4byte gSamusData
_08012740: .4byte _08012744
_08012744: @ jump table
	.4byte _08012794 @ case 0
	.4byte _08012794 @ case 1
	.4byte _080127B2 @ case 2
	.4byte _080127B2 @ case 3
	.4byte _080127B2 @ case 4
	.4byte _080127B2 @ case 5
	.4byte _080127B2 @ case 6
	.4byte _080127B2 @ case 7
	.4byte _080127B2 @ case 8
	.4byte _080127B2 @ case 9
	.4byte _080127B2 @ case 10
	.4byte _08012794 @ case 11
	.4byte _08012794 @ case 12
	.4byte _080127B2 @ case 13
	.4byte _080127B2 @ case 14
	.4byte _080127B2 @ case 15
	.4byte _080127B2 @ case 16
	.4byte _080127B2 @ case 17
	.4byte _080127B2 @ case 18
	.4byte _08012794 @ case 19
_08012794:
	ldrb r0, [r3, #0xc]
	cmp r0, #0x3f
	bls _080127B2
	cmp r2, #0x80
	beq _080127AC
	adds r0, r2, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _080127B2
_080127AC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080127B2:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusCheckHangingOnLedge
SamusCheckHangingOnLedge: @ 0x080127BC
	push {lr}
	ldr r0, _080127CC @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x18
	beq _080127D0
	movs r0, #0
	b _080127D2
	.align 2, 0
_080127CC: .4byte gSamusData
_080127D0:
	movs r0, #1
_080127D2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusCheckOnCeilingLadder
SamusCheckOnCeilingLadder: @ 0x080127D8
	push {lr}
	ldr r0, _080127EC @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x2f
	bgt _080127F0
	cmp r0, #0x2b
	blt _080127F0
	movs r0, #1
	b _080127F2
	.align 2, 0
_080127EC: .4byte gSamusData
_080127F0:
	movs r0, #0
_080127F2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusCheckPullingSelfUp
SamusCheckPullingSelfUp: @ 0x080127F8
	push {lr}
	ldr r0, _0801280C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x1b
	bgt _08012810
	cmp r0, #0x19
	blt _08012810
	movs r0, #1
	b _08012812
	.align 2, 0
_0801280C: .4byte gSamusData
_08012810:
	movs r0, #0
_08012812:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilTrySetAbsorbXFlag
SpriteUtilTrySetAbsorbXFlag: @ 0x08012818
	push {lr}
	ldr r2, _08012854 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801284E
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r3, [r0]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08012844
	adds r0, r3, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _0801284E
_08012844:
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
_0801284E:
	pop {r0}
	bx r0
	.align 2, 0
_08012854: .4byte gCurrentSprite

	thumb_func_start SpriteUtilCountSecondarySprites
SpriteUtilCountSecondarySprites: @ 0x08012858
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	movs r3, #0
	ldr r6, _080128A4 @ =gSpriteData
_08012864:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r6
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08012890
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08012890
	ldrb r0, [r2, #0x1d]
	cmp r0, r5
	bne _08012890
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08012890:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _08012864
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080128A4: .4byte gSpriteData

	thumb_func_start SpriteUtilCountPrimarySprites
SpriteUtilCountPrimarySprites: @ 0x080128A8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0
	movs r3, #0
	ldr r6, _080128F4 @ =gSpriteData
_080128B4:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r6
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080128E0
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080128E0
	ldrb r0, [r2, #0x1d]
	cmp r0, r5
	bne _080128E0
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080128E0:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _080128B4
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080128F4: .4byte gSpriteData

	thumb_func_start SpriteUtilFindPrimarySprite
SpriteUtilFindPrimarySprite: @ 0x080128F8
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r5, _0801292C @ =gSpriteData
_08012902:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08012930
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08012930
	ldrb r0, [r2, #0x1d]
	cmp r0, r4
	bne _08012930
	adds r0, r3, #0
	b _0801293C
	.align 2, 0
_0801292C: .4byte gSpriteData
_08012930:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _08012902
	movs r0, #0xff
_0801293C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start FindSecondarySprite
FindSecondarySprite: @ 0x08012944
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r5, _08012978 @ =gSpriteData
_0801294E:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801297C
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801297C
	ldrb r0, [r2, #0x1d]
	cmp r0, r4
	bne _0801297C
	adds r0, r3, #0
	b _08012988
	.align 2, 0
_08012978: .4byte gSpriteData
_0801297C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0801294E
	movs r0, #0xff
_08012988:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SpriteUtilSpriteUtilCountSecondarySpritesWithRamSlot
SpriteUtilSpriteUtilCountSecondarySpritesWithRamSlot: @ 0x08012990
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r4, #0
	movs r3, #0
	ldr r7, _080129E8 @ =gSpriteData
_080129A0:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r7
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080129D6
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080129D6
	ldrb r0, [r2, #0x1d]
	cmp r0, r6
	bne _080129D6
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, r5
	bne _080129D6
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080129D6:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _080129A0
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080129E8: .4byte gSpriteData

	thumb_func_start MoveEyeCoreXBeam
MoveEyeCoreXBeam: @ 0x080129EC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08012A0C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x2d
	ldrb r2, [r2]
	adds r4, r0, #0
	cmp r2, #3
	beq _08012A4A
	cmp r2, #3
	bgt _08012A10
	cmp r2, #2
	beq _08012A2A
	b _08012A6A
	.align 2, 0
_08012A0C: .4byte gCurrentSprite
_08012A10:
	cmp r2, #4
	beq _08012A1A
	cmp r2, #5
	beq _08012A22
	b _08012A6A
_08012A1A:
	ldrh r0, [r4, #2]
	subs r0, r0, r3
	strh r0, [r4, #2]
	b _08012A80
_08012A22:
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	b _08012A80
_08012A2A:
	lsls r0, r3, #1
	adds r0, r0, r3
	asrs r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r0, [r4, #2]
	subs r0, r0, r3
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08012A7A
	ldrh r0, [r4, #4]
	adds r0, r0, r3
	b _08012A7E
_08012A4A:
	lsls r0, r3, #1
	adds r0, r0, r3
	asrs r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r0, [r4, #2]
	adds r0, r0, r3
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08012A7A
	ldrh r0, [r4, #4]
	adds r0, r0, r3
	b _08012A7E
_08012A6A:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08012A7A
	ldrh r0, [r4, #4]
	adds r0, r0, r3
	b _08012A7E
_08012A7A:
	ldrh r0, [r4, #4]
	subs r0, r0, r3
_08012A7E:
	strh r0, [r4, #4]
_08012A80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_12a88
unk_12a88: @ 0x08012A88
	push {r4, lr}
	movs r3, #4
	movs r4, #5
	ldr r1, _08012AA8 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _08012B3C
	lsls r0, r0, #2
	ldr r1, _08012AAC @ =_08012AB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012AA8: .4byte gCurrentSprite
_08012AAC: .4byte _08012AB0
_08012AB0: @ jump table
	.4byte _08012B3C @ case 0
	.4byte _08012AE8 @ case 1
	.4byte _08012AC4 @ case 2
	.4byte _08012B26 @ case 3
	.4byte _08012B26 @ case 4
_08012AC4:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08012AD6
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	beq _08012B0A
	b _08012B18
_08012AD6:
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bne _08012AE2
	ldrh r0, [r2, #2]
	subs r0, r0, r3
	b _08012B1C
_08012AE2:
	ldrh r0, [r2, #2]
	adds r0, r3, r0
	b _08012B0E
_08012AE8:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08012B04
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bne _08012AFE
	ldrh r0, [r2, #2]
	subs r0, r0, r3
	b _08012B1C
_08012AFE:
	ldrh r0, [r2, #2]
	adds r0, r3, r0
	b _08012B0E
_08012B04:
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bne _08012B18
_08012B0A:
	ldrh r0, [r2, #2]
	subs r0, r0, r3
_08012B0E:
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	adds r0, r3, r0
	strh r0, [r2, #4]
	b _08012B4E
_08012B18:
	ldrh r0, [r2, #2]
	adds r0, r3, r0
_08012B1C:
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	subs r0, r0, r3
	strh r0, [r2, #4]
	b _08012B4E
_08012B26:
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bne _08012B34
	ldrh r0, [r2, #4]
	subs r0, r0, r4
	strh r0, [r2, #4]
	b _08012B4E
_08012B34:
	ldrh r0, [r2, #4]
	adds r0, r4, r0
	strh r0, [r2, #4]
	b _08012B4E
_08012B3C:
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bne _08012B48
	ldrh r0, [r2, #2]
	subs r0, r0, r4
	b _08012B4C
_08012B48:
	ldrh r0, [r2, #2]
	adds r0, r4, r0
_08012B4C:
	strh r0, [r2, #2]
_08012B4E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_12b54
unk_12b54: @ 0x08012B54
	push {r4, r5, r6, lr}
	ldr r5, _08012B90 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r4, #7
	ands r4, r0
	ldr r1, _08012B94 @ =0x0858B3CC
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r0, r6, #0
	bl __floatsidf
	ldr r2, _08012B98 @ =0x3FF66666
	ldr r3, _08012B9C @ =0x66666666
	bl __muldf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r2, [r5, #0x1e]
	cmp r4, #3
	bls _08012BA6
	cmp r2, #1
	bne _08012BA0
	movs r2, #2
	b _08012BA6
	.align 2, 0
_08012B90: .4byte gCurrentSprite
_08012B94: .4byte 0x0858B3CC
_08012B98: .4byte 0x3FF66666
_08012B9C: .4byte 0x66666666
_08012BA0:
	cmp r2, #2
	bne _08012BA6
	movs r2, #1
_08012BA6:
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _08012C42
	lsls r0, r0, #2
	ldr r1, _08012BBC @ =_08012BC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08012BBC: .4byte _08012BC0
_08012BC0: @ jump table
	.4byte _08012C42 @ case 0
	.4byte _08012BF4 @ case 1
	.4byte _08012BD4 @ case 2
	.4byte _08012C2E @ case 3
	.4byte _08012C2E @ case 4
_08012BD4:
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08012BE4
	cmp r2, #1
	beq _08012C12
	b _08012C20
_08012BE4:
	cmp r2, #1
	bne _08012BEE
	ldrh r0, [r5, #2]
	subs r0, r0, r6
	b _08012C24
_08012BEE:
	ldrh r0, [r5, #2]
	adds r0, r6, r0
	b _08012C16
_08012BF4:
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08012C0E
	cmp r2, #1
	bne _08012C08
	ldrh r0, [r5, #2]
	subs r0, r0, r6
	b _08012C24
_08012C08:
	ldrh r0, [r5, #2]
	adds r0, r6, r0
	b _08012C16
_08012C0E:
	cmp r2, #1
	bne _08012C20
_08012C12:
	ldrh r0, [r5, #2]
	subs r0, r0, r6
_08012C16:
	strh r0, [r5, #2]
	ldrh r0, [r5, #4]
	adds r0, r6, r0
	strh r0, [r5, #4]
	b _08012C52
_08012C20:
	ldrh r0, [r5, #2]
	adds r0, r6, r0
_08012C24:
	strh r0, [r5, #2]
	ldrh r0, [r5, #4]
	subs r0, r0, r6
	strh r0, [r5, #4]
	b _08012C52
_08012C2E:
	cmp r2, #1
	bne _08012C3A
	ldrh r0, [r5, #4]
	subs r0, r0, r3
	strh r0, [r5, #4]
	b _08012C52
_08012C3A:
	ldrh r0, [r5, #4]
	adds r0, r3, r0
	strh r0, [r5, #4]
	b _08012C52
_08012C42:
	cmp r2, #1
	bne _08012C4C
	ldrh r0, [r5, #2]
	subs r0, r0, r3
	b _08012C50
_08012C4C:
	ldrh r0, [r5, #2]
	adds r0, r3, r0
_08012C50:
	strh r0, [r5, #2]
_08012C52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start MoveBeamCoreX
MoveBeamCoreX: @ 0x08012C58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
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
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #8]
	movs r0, #0
	mov r8, r0
	movs r7, #0
	ldr r4, _08012CDC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08012CE4
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08012CE0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08012CFA
	ldrh r0, [r4, #2]
	adds r0, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08012D1E
	ldrh r0, [r4, #2]
	subs r0, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	b _08012D30
	.align 2, 0
_08012CDC: .4byte gCurrentSprite
_08012CE0: .4byte gPreviousCollisionCheck
_08012CE4:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08012D00 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08012D04
_08012CFA:
	movs r1, #1
	mov r8, r1
	b _08012D42
	.align 2, 0
_08012D00: .4byte gPreviousCollisionCheck
_08012D04:
	ldrh r0, [r4, #2]
	adds r0, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _08012D24
_08012D1E:
	movs r3, #1
	mov r8, r3
	b _08012D42
_08012D24:
	ldrh r0, [r4, #2]
	subs r0, #0x28
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
_08012D30:
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _08012D42
	movs r0, #1
	mov r8, r0
_08012D42:
	ldr r4, _08012D88 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08012D90
	ldrh r0, [r4, #2]
	adds r0, #0x3c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08012D8C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08012DDA
	ldrh r0, [r4, #2]
	adds r0, #0x3c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08012DDA
	ldrh r0, [r4, #2]
	adds r0, #0x3c
	b _08012DC4
	.align 2, 0
_08012D88: .4byte gCurrentSprite
_08012D8C: .4byte gPreviousCollisionCheck
_08012D90:
	ldrh r0, [r4, #2]
	subs r0, #0x3c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08012E24 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08012DDA
	ldrh r0, [r4, #2]
	subs r0, #0x3c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08012DDA
	ldrh r0, [r4, #2]
	subs r0, #0x3c
_08012DC4:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x28
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _08012DE0
_08012DDA:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08012DE0:
	movs r4, #0
	ldr r2, _08012E28 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08012E42
	mov r1, r8
	cmp r1, #0
	bne _08012E94
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _08012E2C
	ldrh r1, [r2, #4]
	mov r0, sb
	subs r0, #4
	cmp r1, r0
	bgt _08012E5C
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _08012E18
	adds r0, #1
	strb r0, [r1]
_08012E18:
	ldrb r0, [r1]
	asrs r0, r6
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _08012E90
	.align 2, 0
_08012E24: .4byte gPreviousCollisionCheck
_08012E28: .4byte gCurrentSprite
_08012E2C:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012E94
	ldrb r0, [r3]
	asrs r0, r6
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	b _08012E90
_08012E42:
	mov r3, r8
	cmp r3, #0
	bne _08012E8E
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _08012E78
	ldrh r1, [r2, #4]
	mov r0, sb
	adds r0, #4
	cmp r1, r0
	bge _08012E66
_08012E5C:
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r3]
	b _08012E90
_08012E66:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _08012E74
	adds r0, #1
	strb r0, [r1]
_08012E74:
	ldrb r1, [r1]
	b _08012E84
_08012E78:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012E94
	ldrb r1, [r3]
_08012E84:
	asrs r1, r6
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	strh r0, [r2, #4]
	b _08012E90
_08012E8E:
	movs r4, #1
_08012E90:
	cmp r4, #0
	beq _08012EAE
_08012E94:
	ldr r2, _08012EF4 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x30
	movs r0, #1
	strb r0, [r2]
	ldr r0, [sp, #8]
	bl SoundPlayNotAlreadyPlaying
_08012EAE:
	movs r4, #0
	ldr r2, _08012EF4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08012F0E
	cmp r7, #0
	bne _08012F60
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _08012EF8
	ldrh r1, [r2, #2]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	bgt _08012F26
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r3, [sp, #4]
	cmp r0, r3
	bhs _08012EE6
	adds r0, #1
	strb r0, [r1]
_08012EE6:
	ldrb r0, [r1]
	asrs r0, r6
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _08012F5C
	.align 2, 0
_08012EF4: .4byte gCurrentSprite
_08012EF8:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012F60
	ldrb r0, [r3]
	asrs r0, r6
	ldrh r3, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	b _08012F5C
_08012F0E:
	cmp r7, #0
	bne _08012F5A
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _08012F44
	ldrh r1, [r2, #2]
	ldr r0, [sp]
	adds r0, #4
	cmp r1, r0
	bge _08012F30
_08012F26:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _08012F5C
_08012F30:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r3, [sp, #4]
	cmp r0, r3
	bhs _08012F40
	adds r0, #1
	strb r0, [r1]
_08012F40:
	ldrb r1, [r1]
	b _08012F50
_08012F44:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08012F60
	ldrb r1, [r3]
_08012F50:
	asrs r1, r6
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _08012F5C
_08012F5A:
	movs r4, #1
_08012F5C:
	cmp r4, #0
	beq _08012F7A
_08012F60:
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, [sp, #8]
	bl SoundPlayNotAlreadyPlaying
_08012F7A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MoveBeamCoreX_Unused
MoveBeamCoreX_Unused: @ 0x08012F8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	mov sl, r7
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #8]
	movs r0, #0
	mov sb, r0
	ldr r2, _08012FF4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0801302A
	movs r1, #0x2f
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08013012
	ldrh r1, [r2, #4]
	subs r0, r6, #4
	cmp r1, r0
	ble _08012FF8
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r3, ip
	strb r0, [r3]
	b _080130AA
	.align 2, 0
_08012FF4: .4byte gCurrentSprite
_08012FF8:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r7
	bhs _08013006
	adds r0, #1
	strb r0, [r1]
_08013006:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r2, #4]
	adds r0, r0, r6
	strh r0, [r2, #4]
	b _080130AA
_08013012:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080130B0
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _080130AA
_0801302A:
	movs r6, #0x2f
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r5, r0, #0
	cmp r5, #0
	bne _08013078
	ldrh r3, [r2, #4]
	mov r0, r8
	adds r0, #4
	cmp r3, r0
	bge _0801304C
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r6]
	b _080130AA
_0801304C:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _0801305A
	adds r0, #1
	strb r0, [r1]
_0801305A:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080130A2
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _080130AA
_08013078:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080130A6
	ldrb r0, [r6]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080130A2
	movs r0, #1
	mov sb, r0
	strb r3, [r6]
	b _080130AA
_080130A2:
	strh r1, [r2, #4]
	b _080130AA
_080130A6:
	movs r1, #1
	mov sb, r1
_080130AA:
	mov r3, sb
	cmp r3, #0
	beq _080130CA
_080130B0:
	ldr r2, _08013100 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x30
	movs r0, #1
	strb r0, [r2]
	ldr r0, [sp, #8]
	bl SoundPlayNotAlreadyPlaying
_080130CA:
	movs r0, #0
	mov sb, r0
	ldr r2, _08013100 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08013136
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _08013120
	ldrh r1, [r2, #2]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _08013104
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _080131B8
	.align 2, 0
_08013100: .4byte gCurrentSprite
_08013104:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r3, [sp, #4]
	cmp r0, r3
	bhs _08013114
	adds r0, #1
	strb r0, [r1]
_08013114:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r2, #2]
	adds r0, r0, r6
	strh r0, [r2, #2]
	b _080131B8
_08013120:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080131BE
	ldrb r0, [r3]
	asrs r0, r4
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _080131B8
_08013136:
	movs r6, #0x2e
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r5, r0, #0
	cmp r5, #0
	bne _08013186
	ldrh r3, [r2, #2]
	ldr r0, [sp]
	adds r0, #4
	cmp r3, r0
	bge _08013158
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r6]
	b _080131B8
_08013158:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp, #4]
	cmp r0, r6
	bhs _08013168
	adds r0, #1
	strb r0, [r1]
_08013168:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080131B0
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _080131B8
_08013186:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080131B4
	ldrb r0, [r6]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080131B0
	movs r0, #1
	mov sb, r0
	strb r3, [r6]
	b _080131B8
_080131B0:
	strh r1, [r2, #2]
	b _080131B8
_080131B4:
	movs r1, #1
	mov sb, r1
_080131B8:
	mov r3, sb
	cmp r3, #0
	beq _080131D8
_080131BE:
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, [sp, #8]
	bl SoundPlayNotAlreadyPlaying
_080131D8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MoveSpriteTowardsTarget
MoveSpriteTowardsTarget: @ 0x080131E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r7, r5, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov sb, r0
	ldr r1, _0801325C @ =gCurrentSprite
	mov ip, r1
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0801327A
	mov r2, ip
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _08013260
	mov r6, ip
	ldrh r1, [r6, #4]
	subs r0, r5, #4
	cmp r1, r0
	bgt _08013290
	mov r1, ip
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r3
	bhs _0801324C
	adds r0, #1
	strb r0, [r1]
_0801324C:
	ldrb r0, [r1]
	asrs r0, r4
	mov r1, ip
	ldrh r1, [r1, #4]
	adds r0, r0, r1
	mov r2, ip
	strh r0, [r2, #4]
	b _080132F8
	.align 2, 0
_0801325C: .4byte gCurrentSprite
_08013260:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080132FE
	ldrb r0, [r2]
	asrs r0, r4
	mov r3, ip
	ldrh r3, [r3, #4]
	adds r0, r0, r3
	mov r6, ip
	strh r0, [r6, #4]
	b _080132F8
_0801327A:
	mov r2, ip
	adds r2, #0x2f
	ldrb r0, [r2]
	adds r5, r0, #0
	cmp r5, #0
	bne _080132C4
	mov r0, ip
	ldrh r3, [r0, #4]
	adds r0, r7, #4
	cmp r3, r0
	bge _0801329A
_08013290:
	mov r0, ip
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r2]
	b _080132F8
_0801329A:
	mov r1, ip
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r8
	bhs _080132A8
	adds r0, #1
	strb r0, [r1]
_080132A8:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080132EE
	movs r1, #1
	mov sb, r1
	strb r5, [r2]
	b _080132F8
_080132C4:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080132F4
	ldrb r0, [r2]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r3, ip
	ldrh r0, [r3, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080132EE
	movs r0, #1
	mov sb, r0
	strb r6, [r2]
	b _080132F8
_080132EE:
	mov r2, ip
	strh r1, [r2, #4]
	b _080132F8
_080132F4:
	movs r3, #1
	mov sb, r3
_080132F8:
	mov r6, sb
	cmp r6, #0
	beq _08013316
_080132FE:
	mov r1, ip
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	mov r3, ip
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_08013316:
	movs r6, #0
	mov sb, r6
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08013386
	mov r3, ip
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0801336C
	mov r2, ip
	ldrh r1, [r2, #2]
	mov r0, sl
	subs r0, #4
	cmp r1, r0
	ble _0801334C
	mov r0, ip
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _0801340E
_0801334C:
	mov r1, ip
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r3, [sp]
	cmp r0, r3
	bhs _0801335C
	adds r0, #1
	strb r0, [r1]
_0801335C:
	ldrb r0, [r1]
	asrs r0, r4
	mov r4, ip
	ldrh r4, [r4, #2]
	adds r0, r0, r4
	mov r6, ip
	strh r0, [r6, #2]
	b _0801340E
_0801336C:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013414
	ldrb r0, [r3]
	asrs r0, r4
	mov r1, ip
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	mov r2, ip
	strh r0, [r2, #2]
	b _0801340E
_08013386:
	mov r2, ip
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r5, r0, #0
	cmp r5, #0
	bne _080133DA
	mov r6, ip
	ldrh r3, [r6, #2]
	mov r0, sl
	adds r0, #4
	cmp r3, r0
	bge _080133A8
	mov r0, ip
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r2]
	b _0801340E
_080133A8:
	mov r1, ip
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp]
	cmp r0, r6
	bhs _080133B8
	adds r0, #1
	strb r0, [r1]
_080133B8:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080133D4
	movs r0, #1
	mov sb, r0
	strb r5, [r2]
	b _0801340E
_080133D4:
	mov r2, ip
	strh r1, [r2, #2]
	b _0801340E
_080133DA:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801340A
	ldrb r0, [r2]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013404
	movs r6, #1
	mov sb, r6
	strb r3, [r2]
	b _0801340E
_08013404:
	mov r0, ip
	strh r1, [r0, #2]
	b _0801340E
_0801340A:
	movs r1, #1
	mov sb, r1
_0801340E:
	mov r2, sb
	cmp r2, #0
	beq _0801342A
_08013414:
	mov r3, ip
	ldrh r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	eors r0, r1
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0801342A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_1343c
unk_1343c: @ 0x0801343C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	mov sl, r7
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #8]
	movs r0, #0
	mov sb, r0
	ldr r2, _080134A4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080134DA
	movs r1, #0x2f
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080134C2
	ldrh r1, [r2, #4]
	subs r0, r6, #4
	cmp r1, r0
	ble _080134A8
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r3, ip
	strb r0, [r3]
	b _0801355A
	.align 2, 0
_080134A4: .4byte gCurrentSprite
_080134A8:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r7
	bhs _080134B6
	adds r0, #1
	strb r0, [r1]
_080134B6:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r2, #4]
	adds r0, r0, r6
	strh r0, [r2, #4]
	b _0801355A
_080134C2:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013560
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _0801355A
_080134DA:
	movs r6, #0x2f
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r5, r0, #0
	cmp r5, #0
	bne _08013528
	ldrh r3, [r2, #4]
	mov r0, r8
	adds r0, #4
	cmp r3, r0
	bge _080134FC
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r6]
	b _0801355A
_080134FC:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _0801350A
	adds r0, #1
	strb r0, [r1]
_0801350A:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013552
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _0801355A
_08013528:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013556
	ldrb r0, [r6]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013552
	movs r0, #1
	mov sb, r0
	strb r3, [r6]
	b _0801355A
_08013552:
	strh r1, [r2, #4]
	b _0801355A
_08013556:
	movs r1, #1
	mov sb, r1
_0801355A:
	mov r3, sb
	cmp r3, #0
	beq _0801358E
_08013560:
	ldr r2, _080135C4 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _08013580
	movs r0, #0
	strh r0, [r2, #8]
_08013580:
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
	ldr r0, [sp, #8]
	bl SoundPlayNotAlreadyPlaying
_0801358E:
	movs r0, #0
	mov sb, r0
	ldr r2, _080135C4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080135FA
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _080135E4
	ldrh r1, [r2, #2]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _080135C8
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _0801367C
	.align 2, 0
_080135C4: .4byte gCurrentSprite
_080135C8:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r3, [sp, #4]
	cmp r0, r3
	bhs _080135D8
	adds r0, #1
	strb r0, [r1]
_080135D8:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r2, #2]
	adds r0, r0, r6
	strh r0, [r2, #2]
	b _0801367C
_080135E4:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013682
	ldrb r0, [r3]
	asrs r0, r4
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _0801367C
_080135FA:
	movs r6, #0x2e
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r5, r0, #0
	cmp r5, #0
	bne _0801364A
	ldrh r3, [r2, #2]
	ldr r0, [sp]
	adds r0, #4
	cmp r3, r0
	bge _0801361C
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r6]
	b _0801367C
_0801361C:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp, #4]
	cmp r0, r6
	bhs _0801362C
	adds r0, #1
	strb r0, [r1]
_0801362C:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013674
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _0801367C
_0801364A:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013678
	ldrb r0, [r6]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013674
	movs r0, #1
	mov sb, r0
	strb r3, [r6]
	b _0801367C
_08013674:
	strh r1, [r2, #2]
	b _0801367C
_08013678:
	movs r1, #1
	mov sb, r1
_0801367C:
	mov r3, sb
	cmp r3, #0
	beq _0801369C
_08013682:
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, [sp, #8]
	bl SoundPlayNotAlreadyPlaying
_0801369C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_136ac
unk_136ac: @ 0x080136AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r7, r5, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r8, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov sb, r0
	ldr r1, _08013720 @ =gCurrentSprite
	mov ip, r1
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0801373E
	mov r2, ip
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _08013724
	mov r6, ip
	ldrh r1, [r6, #4]
	subs r0, r5, #4
	cmp r1, r0
	bgt _08013754
	mov r1, ip
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r3
	bhs _08013710
	adds r0, #1
	strb r0, [r1]
_08013710:
	ldrb r0, [r1]
	asrs r0, r4
	mov r1, ip
	ldrh r1, [r1, #4]
	adds r0, r0, r1
	mov r2, ip
	strh r0, [r2, #4]
	b _080137BC
	.align 2, 0
_08013720: .4byte gCurrentSprite
_08013724:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080137C2
	ldrb r0, [r2]
	asrs r0, r4
	mov r3, ip
	ldrh r3, [r3, #4]
	adds r0, r0, r3
	mov r6, ip
	strh r0, [r6, #4]
	b _080137BC
_0801373E:
	mov r2, ip
	adds r2, #0x2f
	ldrb r0, [r2]
	adds r5, r0, #0
	cmp r5, #0
	bne _08013788
	mov r0, ip
	ldrh r3, [r0, #4]
	adds r0, r7, #4
	cmp r3, r0
	bge _0801375E
_08013754:
	mov r0, ip
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r2]
	b _080137BC
_0801375E:
	mov r1, ip
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0801376C
	adds r0, #1
	strb r0, [r1]
_0801376C:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080137B2
	movs r1, #1
	mov sb, r1
	strb r5, [r2]
	b _080137BC
_08013788:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080137B8
	ldrb r0, [r2]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r3, ip
	ldrh r0, [r3, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080137B2
	movs r0, #1
	mov sb, r0
	strb r6, [r2]
	b _080137BC
_080137B2:
	mov r2, ip
	strh r1, [r2, #4]
	b _080137BC
_080137B8:
	movs r3, #1
	mov sb, r3
_080137BC:
	mov r6, sb
	cmp r6, #0
	beq _080137EC
_080137C2:
	mov r1, ip
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	mov r3, ip
	strh r0, [r3]
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _080137E4
	movs r0, #0
	strh r0, [r3, #8]
_080137E4:
	mov r1, ip
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_080137EC:
	movs r6, #0
	mov sb, r6
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0801385C
	mov r3, ip
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _08013842
	mov r2, ip
	ldrh r1, [r2, #2]
	mov r0, sl
	subs r0, #4
	cmp r1, r0
	ble _08013822
	mov r0, ip
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _080138E4
_08013822:
	mov r1, ip
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r3, [sp]
	cmp r0, r3
	bhs _08013832
	adds r0, #1
	strb r0, [r1]
_08013832:
	ldrb r0, [r1]
	asrs r0, r4
	mov r4, ip
	ldrh r4, [r4, #2]
	adds r0, r0, r4
	mov r6, ip
	strh r0, [r6, #2]
	b _080138E4
_08013842:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080138EA
	ldrb r0, [r3]
	asrs r0, r4
	mov r1, ip
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	mov r2, ip
	strh r0, [r2, #2]
	b _080138E4
_0801385C:
	mov r2, ip
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r5, r0, #0
	cmp r5, #0
	bne _080138B0
	mov r6, ip
	ldrh r3, [r6, #2]
	mov r0, sl
	adds r0, #4
	cmp r3, r0
	bge _0801387E
	mov r0, ip
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r2]
	b _080138E4
_0801387E:
	mov r1, ip
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp]
	cmp r0, r6
	bhs _0801388E
	adds r0, #1
	strb r0, [r1]
_0801388E:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080138AA
	movs r0, #1
	mov sb, r0
	strb r5, [r2]
	b _080138E4
_080138AA:
	mov r2, ip
	strh r1, [r2, #2]
	b _080138E4
_080138B0:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080138E0
	ldrb r0, [r2]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080138DA
	movs r6, #1
	mov sb, r6
	strb r3, [r2]
	b _080138E4
_080138DA:
	mov r0, ip
	strh r1, [r0, #2]
	b _080138E4
_080138E0:
	movs r1, #1
	mov sb, r1
_080138E4:
	mov r2, sb
	cmp r2, #0
	beq _08013900
_080138EA:
	mov r3, ip
	ldrh r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r1, r4, #0
	eors r0, r1
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_08013900:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MoveRidleyFireBall
MoveRidleyFireBall: @ 0x08013910
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov sb, r0
	ldr r1, _0801397C @ =gCurrentSprite
	mov ip, r1
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0801399A
	mov r3, ip
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _08013980
	mov r5, ip
	adds r5, #0x30
	ldrb r2, [r5]
	cmp r2, r7
	bhs _08013972
	mov r0, ip
	ldrh r1, [r0, #4]
	subs r0, r6, #4
	cmp r1, r0
	bgt _080139BA
	adds r0, r2, #1
	strb r0, [r5]
_08013972:
	mov r0, ip
	adds r0, #0x30
	ldrb r0, [r0]
	b _0801398C
	.align 2, 0
_0801397C: .4byte gCurrentSprite
_08013980:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013A0E
	ldrb r0, [r3]
_0801398C:
	asrs r0, r4
	mov r1, ip
	ldrh r1, [r1, #4]
	adds r0, r0, r1
	mov r2, ip
	strh r0, [r2, #4]
	b _08013A08
_0801399A:
	mov r3, ip
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _080139D4
	mov r5, ip
	adds r5, #0x30
	ldrb r2, [r5]
	cmp r2, r7
	bhs _080139C2
	mov r0, ip
	ldrh r1, [r0, #4]
	mov r0, r8
	adds r0, #4
	cmp r1, r0
	bge _080139BE
_080139BA:
	strb r2, [r3]
	b _08013A08
_080139BE:
	adds r0, r2, #1
	strb r0, [r5]
_080139C2:
	mov r0, ip
	adds r0, #0x30
	ldrb r1, [r0]
	asrs r1, r4
	mov r2, ip
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	strh r0, [r2, #4]
	b _08013A08
_080139D4:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013A04
	ldrb r0, [r3]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r2, ip
	ldrh r0, [r2, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080139FE
	movs r0, #1
	mov sb, r0
	strb r5, [r3]
	b _08013A08
_080139FE:
	mov r2, ip
	strh r1, [r2, #4]
	b _08013A08
_08013A04:
	movs r0, #1
	mov sb, r0
_08013A08:
	mov r1, sb
	cmp r1, #0
	beq _08013A24
_08013A0E:
	mov r2, ip
	ldrh r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_08013A24:
	movs r2, #0
	mov sb, r2
	mov r0, ip
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08013A8C
	mov r2, ip
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	bne _08013A72
	mov r5, ip
	adds r5, #0x31
	ldrb r3, [r5]
	cmp r3, sl
	bhs _08013A5E
	mov r0, ip
	ldrh r1, [r0, #2]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	bgt _08013AE8
	adds r0, r3, #1
	strb r0, [r5]
_08013A5E:
	mov r0, ip
	adds r0, #0x31
	ldrb r0, [r0]
	asrs r0, r4
	mov r1, ip
	ldrh r1, [r1, #2]
	adds r0, r0, r1
	mov r2, ip
	strh r0, [r2, #2]
	b _08013AF6
_08013A72:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013AFC
	ldrb r0, [r2]
	asrs r0, r4
	mov r4, ip
	ldrh r4, [r4, #2]
	adds r0, r0, r4
	mov r1, ip
	strh r0, [r1, #2]
	b _08013AF6
_08013A8C:
	mov r2, ip
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	bne _08013AC2
	mov r5, ip
	adds r5, #0x31
	ldrb r3, [r5]
	cmp r3, sl
	bhs _08013AB0
	mov r0, ip
	ldrh r1, [r0, #2]
	ldr r0, [sp]
	adds r0, #4
	cmp r1, r0
	blt _08013AE8
	adds r0, r3, #1
	strb r0, [r5]
_08013AB0:
	mov r0, ip
	adds r0, #0x31
	ldrb r1, [r0]
	asrs r1, r4
	mov r2, ip
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _08013AF6
_08013AC2:
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08013AF2
	ldrb r0, [r2]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08013AEC
	movs r0, #1
	mov sb, r0
_08013AE8:
	strb r3, [r2]
	b _08013AF6
_08013AEC:
	mov r2, ip
	strh r1, [r2, #2]
	b _08013AF6
_08013AF2:
	movs r4, #1
	mov sb, r4
_08013AF6:
	mov r0, sb
	cmp r0, #0
	beq _08013B14
_08013AFC:
	mov r1, ip
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	eors r0, r1
	mov r4, ip
	strh r0, [r4]
	mov r1, ip
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_08013B14:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SpriteUtilUpdateStunTimer
SpriteUtilUpdateStunTimer: @ 0x08013B24
	push {lr}
	ldr r2, _08013B6C @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08013B92
	subs r0, r1, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08013B92
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _08013B92
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08013B70
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	beq _08013B92
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	b _08013B8A
	.align 2, 0
_08013B6C: .4byte gCurrentSprite
_08013B70:
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	beq _08013B92
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r1, [r0]
	cmp r1, #0
	beq _08013B8C
	adds r0, #3
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
_08013B8A:
	subs r1, r1, r0
_08013B8C:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08013B92:
	pop {r0}
	bx r0
	.align 2, 0
