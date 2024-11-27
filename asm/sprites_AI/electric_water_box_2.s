    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ElectricWaterDamageBox2Init
ElectricWaterDamageBox2Init: @ 0x08056C24
	push {r4, lr}
	ldr r0, _08056C78 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	movs r0, #4
	movs r2, #0
	movs r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08056C7C @ =0x0000FF80
	mov r4, ip
	strh r0, [r4, #0xa]
	movs r1, #0x20
	strh r1, [r4, #0xc]
	adds r0, #0x60
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08056C80 @ =sBox2ElectricWaterDamageOam_39f658
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056C78: .4byte gCurrentSprite
_08056C7C: .4byte 0x0000FF80
_08056C80: .4byte sBox2ElectricWaterDamageOam_39f658

	thumb_func_start ElectricWaterDamageBox2Idle
ElectricWaterDamageBox2Idle: @ 0x08056C84
	push {lr}
	ldr r2, _08056CA8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08056CAC @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _08056CA4
	subs r1, #2
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0
	strb r0, [r1]
_08056CA4:
	pop {r0}
	bx r0
	.align 2, 0
_08056CA8: .4byte gCurrentSprite
_08056CAC: .4byte 0x03001346

	thumb_func_start ElectricWaterDamageBox2DamagingSamus
ElectricWaterDamageBox2DamagingSamus: @ 0x08056CB0
	push {lr}
	ldr r2, _08056CDC @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08056CE0 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08056CE4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	strh r0, [r2, #2]
	ldrh r0, [r1, #0x16]
	strh r0, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08056CE8
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0xb
	b _08056CEE
	.align 2, 0
_08056CDC: .4byte gCurrentSprite
_08056CE0: .4byte 0x0000FFFB
_08056CE4: .4byte gSamusData
_08056CE8:
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
_08056CEE:
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08056D1C @ =0x03001346
	ldrb r3, [r0]
	cmp r3, #0
	bne _08056D18
	subs r1, #0xa
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _08056D20 @ =sBox2ElectricWaterDamageOam_39f6c8
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	movs r1, #0
	strh r3, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x25
	strb r1, [r0]
_08056D18:
	pop {r0}
	bx r0
	.align 2, 0
_08056D1C: .4byte 0x03001346
_08056D20: .4byte sBox2ElectricWaterDamageOam_39f6c8

	thumb_func_start ElectricWaterDamageBox2Stopping
ElectricWaterDamageBox2Stopping: @ 0x08056D24
	push {r4, r5, lr}
	ldr r4, _08056D6C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08056D70 @ =gSamusData
	ldrh r0, [r1, #0x18]
	movs r5, #0
	strh r0, [r4, #2]
	ldrh r0, [r1, #0x16]
	strh r0, [r4, #4]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08056D64
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4]
	ldr r0, _08056D74 @ =sBox2ElectricWaterDamageOam_39f658
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x25
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
_08056D64:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056D6C: .4byte gCurrentSprite
_08056D70: .4byte gSamusData
_08056D74: .4byte sBox2ElectricWaterDamageOam_39f658

	thumb_func_start ElectricWaterDamageBox2
ElectricWaterDamageBox2: @ 0x08056D78
	push {lr}
	ldr r0, _08056D90 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08056DA4
	cmp r0, #2
	bgt _08056D94
	cmp r0, #0
	beq _08056D9E
	b _08056DB4
	.align 2, 0
_08056D90: .4byte gCurrentSprite
_08056D94:
	cmp r0, #0x18
	beq _08056DAA
	cmp r0, #0x1a
	beq _08056DB0
	b _08056DB4
_08056D9E:
	bl ElectricWaterDamageBox2Init
	b _08056DB4
_08056DA4:
	bl ElectricWaterDamageBox2Idle
	b _08056DB4
_08056DAA:
	bl ElectricWaterDamageBox2DamagingSamus
	b _08056DB4
_08056DB0:
	bl ElectricWaterDamageBox2Stopping
_08056DB4:
	ldr r0, _08056DCC @ =gCurrentEventBasedEffect
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08056DC6
	ldr r1, _08056DD0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08056DC6:
	pop {r0}
	bx r0
	.align 2, 0
_08056DCC: .4byte gCurrentEventBasedEffect
_08056DD0: .4byte gCurrentSprite
