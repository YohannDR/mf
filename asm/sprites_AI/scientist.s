    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ScientistInit
ScientistInit: @ 0x0803A088
	push {r4, r5, lr}
	ldr r2, _0803A0AC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0803A0B0 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r5, #2
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0803A0B4
	movs r0, #0
	strh r0, [r2]
	b _0803A0FC
	.align 2, 0
_0803A0AC: .4byte gCurrentSprite
_0803A0B0: .4byte gEquipment
_0803A0B4:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0803A104 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x25
	strb r5, [r0]
	adds r3, r2, #0
	adds r3, #0x27
	movs r0, #0x28
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x28
	strb r1, [r0]
	adds r3, #2
	movs r0, #0x10
	strb r0, [r3]
	ldr r0, _0803A108 @ =0x0000FF88
	strh r0, [r2, #0xa]
	strh r4, [r2, #0xc]
	adds r0, #0x64
	strh r0, [r2, #0xe]
	movs r0, #0x14
	strh r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x24
	strb r5, [r0]
	ldr r0, _0803A10C @ =sScientistOam_34d9ec
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r4, [r2, #0x16]
_0803A0FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803A104: .4byte 0x0000FFFB
_0803A108: .4byte 0x0000FF88
_0803A10C: .4byte sScientistOam_34d9ec

	thumb_func_start ScientistIdle
ScientistIdle: @ 0x0803A110
	push {lr}
	ldr r3, _0803A144 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bls _0803A13E
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0803A148 @ =sScientistOam_34dac4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
_0803A13E:
	pop {r0}
	bx r0
	.align 2, 0
_0803A144: .4byte gCurrentSprite
_0803A148: .4byte sScientistOam_34dac4

	thumb_func_start ScientistTurning
ScientistTurning: @ 0x0803A14C
	push {lr}
	ldr r1, _0803A16C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803A166
	adds r1, #0x24
	movs r0, #0x45
	strb r0, [r1]
_0803A166:
	pop {r0}
	bx r0
	.align 2, 0
_0803A16C: .4byte gCurrentSprite

	thumb_func_start ScientistTransformingInit
ScientistTransformingInit: @ 0x0803A170
	ldr r3, _0803A194 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r2, _0803A198 @ =0x00008020
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #0x2c
	strh r0, [r3, #6]
	bx lr
	.align 2, 0
_0803A194: .4byte gCurrentSprite
_0803A198: .4byte 0x00008020

	thumb_func_start ScientistTransforming
ScientistTransforming: @ 0x0803A19C
	push {r4, lr}
	ldr r2, _0803A1E4 @ =gWrittenToMosaic_H
	ldr r1, _0803A1E8 @ =sXParasiteMosaicValues
	ldr r4, _0803A1EC @ =gCurrentSprite
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
	cmp r0, #0x13
	bhi _0803A1F0
	ldrh r2, [r4, #6]
	movs r0, #0x57
	movs r1, #0
	bl SpriteLoadGfx
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0803A1FE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	movs r0, #0x57
	strb r0, [r4, #0x1d]
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4]
	b _0803A1FE
	.align 2, 0
_0803A1E4: .4byte gWrittenToMosaic_H
_0803A1E8: .4byte sXParasiteMosaicValues
_0803A1EC: .4byte gCurrentSprite
_0803A1F0:
	cmp r0, #0x14
	bne _0803A1FE
	movs r0, #0x57
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0803A1FE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Scientist
Scientist: @ 0x0803A204
	push {lr}
	ldr r0, _0803A224 @ =gCurrentSprite
	movs r1, #1
	strh r1, [r0, #0x14]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _0803A23E
	cmp r0, #0x18
	bgt _0803A228
	cmp r0, #0
	beq _0803A232
	cmp r0, #2
	beq _0803A238
	b _0803A24C
	.align 2, 0
_0803A224: .4byte gCurrentSprite
_0803A228:
	cmp r0, #0x45
	beq _0803A244
	cmp r0, #0x46
	beq _0803A248
	b _0803A24C
_0803A232:
	bl ScientistInit
	b _0803A24C
_0803A238:
	bl ScientistIdle
	b _0803A24C
_0803A23E:
	bl ScientistTurning
	b _0803A24C
_0803A244:
	bl ScientistTransformingInit
_0803A248:
	bl ScientistTransforming
_0803A24C:
	pop {r0}
	bx r0
