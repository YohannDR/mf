    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ElectricWaterDamageInit
ElectricWaterDamageInit: @ 0x08030CC0
	push {r4, lr}
	ldr r0, _08030D14 @ =gCurrentSprite
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
	ldr r0, _08030D18 @ =0x0000FF80
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
	ldr r0, _08030D1C @ =sElectricWaterDamageOam_Idle
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030D14: .4byte gCurrentSprite
_08030D18: .4byte 0x0000FF80
_08030D1C: .4byte sElectricWaterDamageOam_Idle

	thumb_func_start ElectricWaterDamageIdle
ElectricWaterDamageIdle: @ 0x08030D20
	push {lr}
	ldr r2, _08030D44 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08030D48 @ =gSamusUnderwaterFlag
	ldrb r0, [r0]
	cmp r0, #0
	beq _08030D40
	subs r1, #2
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0
	strb r0, [r1]
_08030D40:
	pop {r0}
	bx r0
	.align 2, 0
_08030D44: .4byte gCurrentSprite
_08030D48: .4byte gSamusUnderwaterFlag

	thumb_func_start ElectricWaterDamageDamagingSamus
ElectricWaterDamageDamagingSamus: @ 0x08030D4C
	push {lr}
	ldr r2, _08030D78 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08030D7C @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08030D80 @ =gSamusData
	ldrh r0, [r1, #0x18]
	strh r0, [r2, #2]
	ldrh r0, [r1, #0x16]
	strh r0, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _08030D84
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0xb
	b _08030D8A
	.align 2, 0
_08030D78: .4byte gCurrentSprite
_08030D7C: .4byte 0x0000FFFB
_08030D80: .4byte gSamusData
_08030D84:
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
_08030D8A:
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08030DB8 @ =gSamusUnderwaterFlag
	ldrb r3, [r0]
	cmp r3, #0
	bne _08030DB4
	subs r1, #0xa
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _08030DBC @ =sElectricWaterDamageOam_Stopping
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	movs r1, #0
	strh r3, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x25
	strb r1, [r0]
_08030DB4:
	pop {r0}
	bx r0
	.align 2, 0
_08030DB8: .4byte gSamusUnderwaterFlag
_08030DBC: .4byte sElectricWaterDamageOam_Stopping

	thumb_func_start ElectricWaterDamageStopping
ElectricWaterDamageStopping: @ 0x08030DC0
	push {r4, r5, lr}
	ldr r4, _08030E08 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08030E0C @ =gSamusData
	ldrh r0, [r1, #0x18]
	movs r5, #0
	strh r0, [r4, #2]
	ldrh r0, [r1, #0x16]
	strh r0, [r4, #4]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08030E00
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4]
	ldr r0, _08030E10 @ =sElectricWaterDamageOam_Idle
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
_08030E00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030E08: .4byte gCurrentSprite
_08030E0C: .4byte gSamusData
_08030E10: .4byte sElectricWaterDamageOam_Idle

	thumb_func_start ElectricWireInit
ElectricWireInit: @ 0x08030E14
	push {r4, r5, r6, r7, lr}
	ldr r4, _08030E7C @ =gCurrentSprite
	adds r2, r4, #0
	adds r2, #0x25
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	adds r2, #2
	movs r0, #8
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x28
	movs r7, #0x30
	strb r7, [r0]
	adds r2, #2
	movs r0, #0x18
	strb r0, [r2]
	movs r5, #0
	ldr r6, _08030E80 @ =0x0000FFD0
	strh r6, [r4, #0xa]
	movs r0, #0x60
	strh r0, [r4, #0xc]
	strb r5, [r4, #0x1c]
	strh r1, [r4, #0x16]
	ldr r0, _08030E84 @ =sElectricWireOam
	str r0, [r4, #0x18]
	ldr r0, _08030E88 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x80
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08030E8C @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08030E90
	ldrh r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r4]
	strh r6, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x10]
	b _08030E96
	.align 2, 0
_08030E7C: .4byte gCurrentSprite
_08030E80: .4byte 0x0000FFD0
_08030E84: .4byte sElectricWireOam
_08030E88: .4byte gIoRegisters
_08030E8C: .4byte gPreviousCollisionCheck
_08030E90:
	ldr r0, _08030EAC @ =0x0000FFE0
	strh r0, [r4, #0xe]
	strh r7, [r4, #0x10]
_08030E96:
	bl EventCheckAfter_WaterLowered
	cmp r0, #0
	beq _08030EB8
	ldr r0, _08030EB0 @ =0x00000117
	bl SoundPlay
	ldr r0, _08030EB4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x18
	b _08030EBE
	.align 2, 0
_08030EAC: .4byte 0x0000FFE0
_08030EB0: .4byte 0x00000117
_08030EB4: .4byte gCurrentSprite
_08030EB8:
	ldr r0, _08030EC8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
_08030EBE:
	strb r1, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030EC8: .4byte gCurrentSprite

	thumb_func_start ElectricWireIdle
ElectricWireIdle: @ 0x08030ECC
	push {r4, lr}
	ldr r0, _08030EF4 @ =gWaterLowered
	ldrb r0, [r0]
	cmp r0, #0
	beq _08030EEC
	ldr r4, _08030EF8 @ =gCurrentSprite
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _08030EEC
	ldr r0, _08030EFC @ =0x00000117
	bl SoundPlay
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_08030EEC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030EF4: .4byte gWaterLowered
_08030EF8: .4byte gCurrentSprite
_08030EFC: .4byte 0x00000117

	thumb_func_start ElectricWaterInit
ElectricWaterInit: @ 0x08030F00
	push {r4, lr}
	ldr r0, _08030F6C @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0, #4]
	adds r0, #0x20
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1, #4]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x80
	strb r0, [r1]
	ldr r0, _08030F70 @ =0x0000FFC0
	mov r1, ip
	strh r0, [r1, #0xa]
	strh r4, [r1, #0xc]
	ldr r0, _08030F74 @ =0x0000FE20
	strh r0, [r1, #0xe]
	movs r0, #0xf0
	lsls r0, r0, #1
	strh r0, [r1, #0x10]
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	strb r3, [r0, #0x1c]
	strh r4, [r0, #0x16]
	ldr r0, _08030F78 @ =sElectricWaterOam
	mov r1, ip
	str r0, [r1, #0x18]
	movs r0, #0x8b
	lsls r0, r0, #1
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030F6C: .4byte gCurrentSprite
_08030F70: .4byte 0x0000FFC0
_08030F74: .4byte 0x0000FE20
_08030F78: .4byte sElectricWaterOam

	thumb_func_start ElectricWaterIdle
ElectricWaterIdle: @ 0x08030F7C
	ldr r1, _08030F88 @ =gCurrentSprite
	ldr r0, _08030F8C @ =gEffectYPosition
	ldrh r0, [r0]
	adds r0, #0x20
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
_08030F88: .4byte gCurrentSprite
_08030F8C: .4byte gEffectYPosition

	thumb_func_start ElectricWaterDamage
ElectricWaterDamage: @ 0x08030F90
	push {lr}
	ldr r0, _08030FA8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08030FBC
	cmp r0, #2
	bgt _08030FAC
	cmp r0, #0
	beq _08030FB6
	b _08030FCC
	.align 2, 0
_08030FA8: .4byte gCurrentSprite
_08030FAC:
	cmp r0, #0x18
	beq _08030FC2
	cmp r0, #0x1a
	beq _08030FC8
	b _08030FCC
_08030FB6:
	bl ElectricWaterDamageInit
	b _08030FCC
_08030FBC:
	bl ElectricWaterDamageIdle
	b _08030FCC
_08030FC2:
	bl ElectricWaterDamageDamagingSamus
	b _08030FCC
_08030FC8:
	bl ElectricWaterDamageStopping
_08030FCC:
	ldr r0, _08030FE0 @ =gWaterLowered
	ldrb r0, [r0]
	cmp r0, #0
	beq _08030FDA
	ldr r1, _08030FE4 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08030FDA:
	pop {r0}
	bx r0
	.align 2, 0
_08030FE0: .4byte gWaterLowered
_08030FE4: .4byte gCurrentSprite

	thumb_func_start ElectricWire
ElectricWire: @ 0x08030FE8
	push {lr}
	ldr r0, _08030FFC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031000
	cmp r0, #2
	beq _08031006
	b _0803100A
	.align 2, 0
_08030FFC: .4byte gCurrentSprite
_08031000:
	bl ElectricWireInit
	b _0803100A
_08031006:
	bl ElectricWireIdle
_0803100A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ElectricWater
ElectricWater: @ 0x08031010
	push {lr}
	ldr r0, _0803102C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031030
	cmp r0, #2
	beq _08031034
	b _08031038
	.align 2, 0
_0803102C: .4byte gCurrentSprite
_08031030:
	bl ElectricWaterInit
_08031034:
	bl ElectricWaterIdle
_08031038:
	ldr r0, _0803104C @ =gWaterLowered
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031046
	ldr r1, _08031050 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08031046:
	pop {r0}
	bx r0
	.align 2, 0
_0803104C: .4byte gWaterLowered
_08031050: .4byte gCurrentSprite
