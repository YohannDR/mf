    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SramWriteUnckeckedInternal
SramWriteUnckeckedInternal: @ 0x08004BCC
	push {r4, lr}
	adds r4, r0, #0
	subs r3, r2, #1
	cmp r2, #0
	beq _08004BE8
	movs r2, #1
	rsbs r2, r2, #0
_08004BDA:
	ldrb r0, [r4]
	strb r0, [r1]
	adds r4, #1
	adds r1, #1
	subs r3, #1
	cmp r3, r2
	bne _08004BDA
_08004BE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SramWriteUnckecked
SramWriteUnckecked: @ 0x08004BF0
	push {r4, r5, r6, lr}
	sub sp, #0x80
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r2, _08004C1C @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08004C20 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _08004C24 @ =SramWriteUnckeckedInternal
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08004C28 @ =SramWriteUnckecked
	ldr r1, _08004C24 @ =SramWriteUnckeckedInternal
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08004C38
	.align 2, 0
_08004C1C: .4byte 0x04000204
_08004C20: .4byte 0x0000FFFC
_08004C24: .4byte SramWriteUnckeckedInternal
_08004C28: .4byte SramWriteUnckecked
_08004C2C:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08004C38:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08004C2C
	mov r3, sp
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0x80
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SramWrite
SramWrite: @ 0x08004C54
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _08004C8C @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08004C90 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _08004C84
	adds r1, r0, #0
_08004C76:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _08004C76
_08004C84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004C8C: .4byte 0x04000204
_08004C90: .4byte 0x0000FFFC

	thumb_func_start SRAMCheckInternal
SRAMCheckInternal: @ 0x08004C94
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	subs r4, r2, #1
	cmp r2, #0
	beq _08004CBA
	movs r2, #1
	rsbs r2, r2, #0
_08004CA4:
	ldrb r1, [r3]
	ldrb r0, [r5]
	adds r5, #1
	adds r3, #1
	cmp r1, r0
	beq _08004CB4
	subs r0, r3, #1
	b _08004CBC
_08004CB4:
	subs r4, #1
	cmp r4, r2
	bne _08004CA4
_08004CBA:
	movs r0, #0
_08004CBC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SRAMCheck
SRAMCheck: @ 0x08004CC4
	push {r4, r5, r6, lr}
	sub sp, #0xc0
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r2, _08004CF0 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _08004CF4 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _08004CF8 @ =SRAMCheckInternal
	movs r0, #1
	eors r3, r0
	mov r2, sp
	ldr r0, _08004CFC @ =SRAMCheck
	ldr r1, _08004CF8 @ =SRAMCheckInternal
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _08004D0C
	.align 2, 0
_08004CF0: .4byte 0x04000204
_08004CF4: .4byte 0x0000FFFC
_08004CF8: .4byte SRAMCheckInternal
_08004CFC: .4byte SRAMCheck
_08004D00:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_08004D0C:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08004D00
	mov r3, sp
	adds r3, #1
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _call_via_r3
	add sp, #0xc0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SramWriteChecked
SramWriteChecked: @ 0x08004D28
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r7, #0
	b _08004D3A
_08004D34:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08004D3A:
	cmp r7, #2
	bhi _08004D58
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SramWrite
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl SRAMCheck
	adds r3, r0, #0
	cmp r3, #0
	bne _08004D34
_08004D58:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CopySamusData
CopySamusData: @ 0x08004D60
	push {r4, r5, lr}
	ldr r2, _08004DBC @ =gSamusData
	ldr r0, _08004DC0 @ =gSamusDataCopy
	adds r1, r2, #0
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	ldm r1!, {r3, r4, r5}
	stm r0!, {r3, r4, r5}
	ldm r1!, {r3, r4}
	stm r0!, {r3, r4}
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08004D8A
	ldrh r0, [r2, #0x12]
	movs r1, #0x30
	eors r0, r1
	movs r1, #0
	strh r0, [r2, #0x12]
	strb r1, [r2, #2]
_08004D8A:
	movs r0, #0
	strb r0, [r2, #3]
	strb r0, [r2, #4]
	strb r0, [r2, #6]
	strb r0, [r2, #7]
	strb r0, [r2, #0xe]
	strb r0, [r2, #0xf]
	movs r1, #0
	strh r0, [r2, #0x10]
	strh r0, [r2, #0x1a]
	strh r0, [r2, #0x1c]
	adds r0, r2, #0
	adds r0, #0x21
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _08004DC4 @ =0x030012D8
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004DBC: .4byte gSamusData
_08004DC0: .4byte gSamusDataCopy
_08004DC4: .4byte 0x030012D8

	thumb_func_start SamusChangeVelocityOnSlope
SamusChangeVelocityOnSlope: @ 0x08004DC8
	push {lr}
	ldr r0, _08004DEC @ =gSamusData
	ldrh r2, [r0, #0x1a]
	ldrh r1, [r0, #0x12]
	ldrh r3, [r0, #0x1e]
	ands r1, r3
	cmp r1, #0
	beq _08004E00
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _08004DF0
	lsls r1, r2, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	b _08004DF4
	.align 2, 0
_08004DEC: .4byte gSamusData
_08004DF0:
	lsls r0, r2, #0x10
	asrs r0, r0, #0xe
_08004DF4:
	movs r1, #5
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08004E16
_08004E00:
	lsls r0, r2, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xa0
	ble _08004E0C
	movs r2, #0xa0
	b _08004E16
_08004E0C:
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08004E16
	ldr r2, _08004E20 @ =0x0000FF60
_08004E16:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_08004E20: .4byte 0x0000FF60

	thumb_func_start SetSuitPalette
SetSuitPalette: @ 0x08004E24
	push {r4, r5, r6, r7, lr}
	adds r7, r3, #0
	adds r3, r0, #0
	adds r4, r1, #0
	adds r6, r4, r2
	cmp r4, r6
	bge _08004E60
	ldr r2, _08004E48 @ =gSamusPalette
	ldr r1, _08004E4C @ =gSaXPalette
	lsls r0, r4, #1
	adds r5, r0, r1
	adds r1, r0, r2
	subs r4, r6, r4
_08004E3E:
	cmp r7, #0
	bne _08004E50
	ldrh r0, [r3]
	strh r0, [r1]
	b _08004E54
	.align 2, 0
_08004E48: .4byte gSamusPalette
_08004E4C: .4byte gSaXPalette
_08004E50:
	ldrh r0, [r3]
	strh r0, [r5]
_08004E54:
	adds r3, #2
	adds r5, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _08004E3E
_08004E60:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SamusUpdatePhysics
SamusUpdatePhysics: @ 0x08004E68
	push {r4, r5, lr}
	ldr r4, _08004E94 @ =0x03001346
	movs r1, #0
	strb r1, [r4]
	ldr r0, _08004E98 @ =0x03004810
	strb r1, [r0]
	movs r5, #0
	ldr r1, _08004E9C @ =gSamusData
	ldrh r0, [r1, #0x18]
	ldrh r1, [r1, #0x16]
	bl ClipdataUpdateCurrentAffecting
	adds r1, r0, #0
	movs r0, #0xff
	ands r1, r0
	cmp r1, #1
	beq _08004EA0
	cmp r1, #1
	blt _08004EC0
	cmp r1, #3
	bgt _08004EC0
	b _08004EA6
	.align 2, 0
_08004E94: .4byte 0x03001346
_08004E98: .4byte 0x03004810
_08004E9C: .4byte gSamusData
_08004EA0:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08004EA6:
	ldr r2, _08004EB8 @ =gEquipment
	ldrb r1, [r2, #0xc]
	movs r0, #0xa0
	ands r0, r1
	adds r4, r2, #0
	ldr r3, _08004EBC @ =0x03001330
	cmp r0, #0
	bne _08004ED2
	b _08004ED0
	.align 2, 0
_08004EB8: .4byte gEquipment
_08004EBC: .4byte 0x03001330
_08004EC0:
	ldr r2, _08004F04 @ =0x03001330
	ldrb r1, [r2]
	movs r0, #0x80
	ands r0, r1
	ldr r4, _08004F08 @ =gEquipment
	adds r3, r2, #0
	cmp r0, #0
	beq _08004ED2
_08004ED0:
	adds r5, #1
_08004ED2:
	cmp r5, #0
	beq _08004F10
	ldrb r0, [r3]
	cmp r0, #0x80
	beq _08004EE0
	movs r0, #1
	strb r0, [r3]
_08004EE0:
	movs r2, #0
	movs r0, #4
	strh r0, [r3, #2]
	movs r1, #0x30
	strh r1, [r3, #4]
	strh r0, [r3, #6]
	movs r0, #0x18
	strh r0, [r3, #8]
	movs r0, #0x14
	strh r0, [r3, #0xa]
	movs r0, #3
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	ldr r0, _08004F0C @ =gSamusData
	strb r2, [r0, #6]
	adds r5, r0, #0
	b _08004F40
	.align 2, 0
_08004F04: .4byte 0x03001330
_08004F08: .4byte gEquipment
_08004F0C: .4byte gSamusData
_08004F10:
	strb r5, [r3]
	movs r1, #6
	strh r1, [r3, #2]
	movs r0, #0x80
	strh r0, [r3, #4]
	movs r0, #8
	strh r0, [r3, #6]
	movs r0, #0x28
	strh r0, [r3, #0xa]
	strh r1, [r3, #0xc]
	ldr r0, _08004F34 @ =gSamusData
	ldrb r1, [r0, #6]
	adds r5, r0, #0
	cmp r1, #0
	beq _08004F38
	movs r0, #0xa0
	strh r0, [r3, #8]
	b _08004F3E
	.align 2, 0
_08004F34: .4byte gSamusData
_08004F38:
	movs r0, #0x30
	strh r0, [r3, #8]
	movs r0, #0x60
_08004F3E:
	strh r0, [r3, #0xe]
_08004F40:
	ldrb r1, [r4, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08004F52
	ldrb r1, [r4, #0xc]
	movs r0, #0x80
	orrs r0, r1
	b _08004F58
_08004F52:
	ldrb r1, [r4, #0xc]
	movs r0, #0x7f
	ands r0, r1
_08004F58:
	strb r0, [r4, #0xc]
	ldr r0, _08004FCC @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	ble _08004F6E
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08004F6E:
	ldr r1, _08004FD0 @ =0x03001340
	adds r4, r5, #0
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r1, _08004FD4 @ =gPreviousXPosition
	ldrh r0, [r4, #0x16]
	strh r0, [r1]
	ldr r1, _08004FD8 @ =gPreviousYPosition
	ldrh r0, [r4, #0x18]
	strh r0, [r1]
	ldr r1, _08004FDC @ =0x0828FD00
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	beq _08004FA8
	ldr r0, _08004FE0 @ =0x0828FD04
	ldrb r1, [r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
_08004FA8:
	ldr r1, _08004FE4 @ =0x0828FD18
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _08004FE8 @ =0x0828FD08
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08004FCC: .4byte gSubGameMode1
_08004FD0: .4byte 0x03001340
_08004FD4: .4byte gPreviousXPosition
_08004FD8: .4byte gPreviousYPosition
_08004FDC: .4byte 0x0828FD00
_08004FE0: .4byte 0x0828FD04
_08004FE4: .4byte 0x0828FD18
_08004FE8: .4byte 0x0828FD08

	thumb_func_start SamusUpdateCollisionData
SamusUpdateCollisionData: @ 0x08004FEC
	push {r4, r5, r6, lr}
	ldr r1, _08005020 @ =0x03001320
	movs r5, #0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strb r5, [r1, #0xc]
	strb r5, [r1, #0xd]
	strb r5, [r1, #0xe]
	ldr r0, _08005024 @ =0x03004D8C
	strb r5, [r0]
	ldr r2, _08005028 @ =gSamusData
	ldr r0, _0800502C @ =gPreviousXPosition
	ldrh r4, [r2, #0x16]
	ldrh r0, [r0]
	adds r3, r1, #0
	adds r6, r2, #0
	cmp r4, r0
	bls _08005034
	movs r0, #0x10
	strh r0, [r3]
	movs r0, #1
	strb r0, [r3, #4]
	strb r5, [r3, #5]
	ldr r0, _08005030 @ =0x0000FFFF
	b _0800505C
	.align 2, 0
_08005020: .4byte 0x03001320
_08005024: .4byte 0x03004D8C
_08005028: .4byte gSamusData
_0800502C: .4byte gPreviousXPosition
_08005030: .4byte 0x0000FFFF
_08005034:
	cmp r4, r0
	blo _08005050
	ldrh r1, [r6, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08005054
	movs r0, #1
	strb r0, [r3, #4]
	strb r5, [r3, #5]
	ldr r0, _0800504C @ =0x0000FFFF
	b _0800505C
	.align 2, 0
_0800504C: .4byte 0x0000FFFF
_08005050:
	movs r0, #0x20
	strh r0, [r3]
_08005054:
	strb r5, [r3, #4]
	movs r0, #1
	strb r0, [r3, #5]
	movs r0, #0x40
_0800505C:
	strh r0, [r3, #6]
	ldr r0, _0800506C @ =gPreviousYPosition
	ldrh r1, [r6, #0x18]
	ldrh r0, [r0]
	cmp r1, r0
	bls _08005070
	movs r0, #0x80
	b _08005076
	.align 2, 0
_0800506C: .4byte gPreviousYPosition
_08005070:
	cmp r1, r0
	bhs _08005078
	movs r0, #0x40
_08005076:
	strh r0, [r3, #2]
_08005078:
	ldr r1, _0800509C @ =0x0828FD0C
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _080050A0 @ =0x0828FD18
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800509C: .4byte 0x0828FD0C
_080050A0: .4byte 0x0828FD18

	thumb_func_start SamusCallUpdateGraphics
SamusCallUpdateGraphics: @ 0x080050A4
	push {r4, lr}
	bl SamusUpdateEnvironmentEffects
	ldr r4, _080050E0 @ =gSamusData
	ldrh r1, [r4, #0x12]
	movs r0, #0x10
	ands r0, r1
	movs r2, #1
	cmp r0, #0
	beq _080050BA
	movs r2, #0
_080050BA:
	ldr r1, _080050E4 @ =0x0828FD10
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r2, #0
	bl _call_via_r1
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #2
	bne _080050D8
	movs r0, #0
	strh r0, [r4, #0x1e]
_080050D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080050E0: .4byte gSamusData
_080050E4: .4byte 0x0828FD10

	thumb_func_start CallCheckPlayLowHealthSound
CallCheckPlayLowHealthSound: @ 0x080050E8
	push {lr}
	ldr r1, _08005100 @ =0x0828FD14
	ldr r0, _08005104 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	pop {r0}
	bx r0
	.align 2, 0
_08005100: .4byte 0x0828FD14
_08005104: .4byte gSamusData

	thumb_func_start CallUpdateArmCannonOffset
CallUpdateArmCannonOffset: @ 0x08005108
	push {lr}
	ldr r3, _08005130 @ =gSamusData
	ldrh r1, [r3, #0x12]
	movs r0, #0x10
	ands r0, r1
	movs r2, #1
	cmp r0, #0
	beq _0800511A
	movs r2, #0
_0800511A:
	ldr r0, _08005134 @ =0x0828FD1C
	ldrb r1, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r2, #0
	bl _call_via_r1
	pop {r0}
	bx r0
	.align 2, 0
_08005130: .4byte gSamusData
_08005134: .4byte 0x0828FD1C

	thumb_func_start SamusBombBounce
SamusBombBounce: @ 0x08005138
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _08005168 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	bne _080051A6
	movs r2, #0
	movs r0, #0x7f
	ands r0, r3
	cmp r0, #9
	bls _0800518A
	ldr r1, _0800516C @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x10
	beq _08005178
	cmp r0, #0x10
	bgt _08005170
	cmp r0, #0xe
	bgt _0800518A
	cmp r0, #0xc
	blt _0800518A
	b _08005174
	.align 2, 0
_08005168: .4byte 0x03001330
_0800516C: .4byte gSamusData
_08005170:
	cmp r0, #0x3c
	bne _0800518A
_08005174:
	adds r2, #1
	b _0800518A
_08005178:
	movs r4, #0x1c
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bgt _0800518A
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _0800518A
	movs r2, #1
_0800518A:
	cmp r2, #0
	beq _080051A6
	ldr r2, _080051AC @ =gSamusData
	movs r0, #0x7f
	ands r0, r3
	strb r0, [r2, #3]
	ldr r1, _080051B0 @ =0x0828FD04
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfe
	bl _call_via_r1
_080051A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080051AC: .4byte gSamusData
_080051B0: .4byte 0x0828FD04

	thumb_func_start SamusCheckSetNewEnvironmentEffect
SamusCheckSetNewEnvironmentEffect: @ 0x080051B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	cmp r1, #5
	bls _080051C2
	b _080055B4
_080051C2:
	lsls r0, r1, #2
	ldr r1, _080051CC @ =_080051D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080051CC: .4byte _080051D0
_080051D0: @ jump table
	.4byte _080051E8 @ case 0
	.4byte _080052C0 @ case 1
	.4byte _08005314 @ case 2
	.4byte _08005420 @ case 3
	.4byte _080054B4 @ case 4
	.4byte _0800555C @ case 5
_080051E8:
	ldr r2, _080051FC @ =gSamusData
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08005200
	ldrh r0, [r2, #0x16]
	adds r5, r0, #4
	b _08005204
	.align 2, 0
_080051FC: .4byte gSamusData
_08005200:
	ldrh r0, [r2, #0x16]
	subs r5, r0, #4
_08005204:
	ldrh r0, [r2, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	bl GetGroundEffectAtPosition
	adds r7, r0, #0
	cmp r7, #1
	bne _08005248
	ldr r0, _0800523C @ =0x030012F0
	mov r1, r8
	lsls r2, r1, #4
	adds r0, r2, r0
	strb r7, [r0]
	ldrb r1, [r0, #6]
	adds r1, #1
	strb r1, [r0, #6]
	adds r4, r2, #0
	mov r2, r8
	cmp r2, #0
	bne _08005240
	movs r0, #0x66
	bl PlaySound
	b _080052A2
	.align 2, 0
_0800523C: .4byte 0x030012F0
_08005240:
	movs r0, #0x67
	bl PlaySound
	b _080052A2
_08005248:
	cmp r7, #2
	bne _08005274
	ldr r1, _08005270 @ =0x030012F0
	mov r0, r8
	lsls r2, r0, #4
	adds r1, r2, r1
	movs r0, #3
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
	adds r4, r2, #0
	mov r1, r8
	cmp r1, #0
	beq _0800528E
	movs r0, #0x69
	bl PlaySound
	b _080052A2
	.align 2, 0
_08005270: .4byte 0x030012F0
_08005274:
	mov r2, r8
	lsls r4, r2, #4
	cmp r7, #3
	bne _080052A2
	ldr r0, _08005298 @ =0x030012F0
	adds r0, r4, r0
	movs r1, #4
	strb r1, [r0]
	ldrb r1, [r0, #6]
	adds r1, #1
	strb r1, [r0, #6]
	cmp r2, #0
	bne _0800529C
_0800528E:
	movs r0, #0x68
	bl PlaySound
	b _080052A2
	.align 2, 0
_08005298: .4byte 0x030012F0
_0800529C:
	movs r0, #0x69
	bl PlaySound
_080052A2:
	ldr r0, _080052B8 @ =0x030012F0
	adds r1, r4, r0
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _080052AE
	b _080055C6
_080052AE:
	strh r5, [r1, #8]
	ldr r0, _080052BC @ =gSamusData
	ldrh r0, [r0, #0x18]
_080052B4:
	strh r0, [r1, #0xa]
	b _080055B4
	.align 2, 0
_080052B8: .4byte 0x030012F0
_080052BC: .4byte gSamusData
_080052C0:
	ldr r1, _080052EC @ =gSamusData
	ldrh r0, [r1, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	bl GetGroundEffectAtPosition
	adds r7, r0, #0
	cmp r7, #1
	bne _080052F4
	ldr r2, _080052F0 @ =0x030012F0
	mov r0, r8
	lsls r3, r0, #4
	adds r1, r3, r2
	movs r0, #0xc
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
	adds r4, r3, #0
	b _0800530C
	.align 2, 0
_080052EC: .4byte gSamusData
_080052F0: .4byte 0x030012F0
_080052F4:
	subs r0, r7, #2
	ldr r2, _08005310 @ =0x030012F0
	mov r1, r8
	lsls r4, r1, #4
	cmp r0, #1
	bhi _0800530C
	adds r1, r4, r2
	movs r0, #0xd
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
_0800530C:
	adds r2, r4, r2
	b _08005402
	.align 2, 0
_08005310: .4byte 0x030012F0
_08005314:
	ldr r1, _08005344 @ =gSamusData
	ldrh r0, [r1, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	bl GetGroundEffectAtPosition
	adds r7, r0, #0
	cmp r7, #1
	bne _0800534C
	ldr r1, _08005348 @ =0x030012F0
	mov r2, r8
	lsls r4, r2, #4
	adds r1, r4, r1
	movs r0, #8
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
	movs r0, #0x78
	bl PlaySound
	b _080053FE
	.align 2, 0
_08005344: .4byte gSamusData
_08005348: .4byte 0x030012F0
_0800534C:
	cmp r7, #5
	bne _0800537C
	ldr r1, _08005374 @ =0x030012F0
	mov r0, r8
	lsls r2, r0, #4
	adds r1, r2, r1
	movs r0, #9
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
	ldr r0, _08005378 @ =0x03001330
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #1
	bne _080053FE
	movs r0, #0x7b
	bl PlaySound
	b _080053FE
	.align 2, 0
_08005374: .4byte 0x030012F0
_08005378: .4byte 0x03001330
_0800537C:
	cmp r7, #2
	bne _080053A0
	ldr r1, _0800539C @ =0x030012F0
	mov r2, r8
	lsls r4, r2, #4
	adds r1, r4, r1
	movs r0, #0xa
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
	movs r0, #0x79
	bl PlaySound
	b _080053FE
	.align 2, 0
_0800539C: .4byte 0x030012F0
_080053A0:
	cmp r7, #3
	bne _080053C4
	ldr r1, _080053C0 @ =0x030012F0
	mov r0, r8
	lsls r4, r0, #4
	adds r1, r4, r1
	movs r0, #0xb
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
	movs r0, #0x7a
	bl PlaySound
	b _080053FE
	.align 2, 0
_080053C0: .4byte 0x030012F0
_080053C4:
	ldr r0, _080053D8 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _080053DC
	movs r0, #0x97
	bl PlaySound
	mov r1, r8
	lsls r4, r1, #4
	b _080053FE
	.align 2, 0
_080053D8: .4byte 0x03001330
_080053DC:
	ldr r0, _080053F0 @ =gSamusDataCopy
	ldrh r0, [r0, #0x10]
	cmp r0, #0
	beq _080053F4
	movs r0, #0x75
	bl PlaySound
	mov r2, r8
	lsls r4, r2, #4
	b _080053FE
	.align 2, 0
_080053F0: .4byte gSamusDataCopy
_080053F4:
	movs r0, #0x74
	bl PlaySound
	mov r0, r8
	lsls r4, r0, #4
_080053FE:
	ldr r0, _08005418 @ =0x030012F0
	adds r2, r4, r0
_08005402:
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _0800540A
	b _080055C6
_0800540A:
	ldr r0, _0800541C @ =gSamusData
	ldrh r1, [r0, #0x16]
	strh r1, [r2, #8]
	ldrh r0, [r0, #0x18]
	strh r0, [r2, #0xa]
	b _080055B4
	.align 2, 0
_08005418: .4byte 0x030012F0
_0800541C: .4byte gSamusData
_08005420:
	ldr r4, _08005458 @ =gSamusData
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	adds r7, r0, #0
	movs r5, #0xff
	ands r7, r5
	ldr r6, _0800545C @ =gPreviousYPosition
	ldrh r0, [r6]
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	adds r1, r0, #0
	ands r1, r5
	ldrh r0, [r4, #0x18]
	ldrh r6, [r6]
	cmp r0, r6
	bhs _08005464
	ldr r2, _08005460 @ =0x030012F0
	mov r0, r8
	lsls r4, r0, #4
	cmp r7, #1
	beq _0800547E
	cmp r1, #1
	bne _0800547E
	b _08005472
	.align 2, 0
_08005458: .4byte gSamusData
_0800545C: .4byte gPreviousYPosition
_08005460: .4byte 0x030012F0
_08005464:
	ldr r2, _080054A4 @ =0x030012F0
	mov r0, r8
	lsls r4, r0, #4
	cmp r7, #1
	bne _0800547E
	cmp r1, #1
	beq _0800547E
_08005472:
	adds r1, r4, r2
	movs r0, #5
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
_0800547E:
	adds r1, r4, r2
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _08005488
	b _080055C6
_08005488:
	ldr r2, _080054A8 @ =gSamusData
	ldrh r0, [r2, #0x16]
	strh r0, [r1, #8]
	ldr r0, _080054AC @ =gEffectYPosition
	ldrh r0, [r0]
	cmp r0, #0
	beq _08005498
	b _080052B4
_08005498:
	ldr r0, _080054B0 @ =gPreviousYPosition
	ldrh r3, [r2, #0x18]
	ldrh r2, [r0]
	cmp r3, r2
	blo _08005534
	b _08005550
	.align 2, 0
_080054A4: .4byte 0x030012F0
_080054A8: .4byte gSamusData
_080054AC: .4byte gEffectYPosition
_080054B0: .4byte gPreviousYPosition
_080054B4:
	ldr r4, _080054EC @ =gSamusData
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	adds r7, r0, #0
	movs r5, #0xff
	ands r7, r5
	ldr r6, _080054F0 @ =gPreviousYPosition
	ldrh r0, [r6]
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	adds r1, r0, #0
	ands r1, r5
	ldrh r0, [r4, #0x18]
	ldrh r6, [r6]
	cmp r0, r6
	bhs _080054F8
	ldr r2, _080054F4 @ =0x030012F0
	mov r0, r8
	lsls r4, r0, #4
	cmp r7, #1
	beq _08005512
	cmp r1, #1
	bne _08005512
	b _08005506
	.align 2, 0
_080054EC: .4byte gSamusData
_080054F0: .4byte gPreviousYPosition
_080054F4: .4byte 0x030012F0
_080054F8:
	ldr r2, _0800553C @ =0x030012F0
	mov r0, r8
	lsls r4, r0, #4
	cmp r7, #1
	bne _08005512
	cmp r1, #1
	beq _08005512
_08005506:
	adds r1, r4, r2
	movs r0, #6
	strb r0, [r1]
	ldrb r0, [r1, #6]
	adds r0, #1
	strb r0, [r1, #6]
_08005512:
	adds r1, r4, r2
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _080055C6
	ldr r2, _08005540 @ =gSamusData
	ldrh r0, [r2, #0x16]
	strh r0, [r1, #8]
	ldr r0, _08005544 @ =gEffectYPosition
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800552A
	b _080052B4
_0800552A:
	ldr r0, _08005548 @ =gPreviousYPosition
	ldrh r3, [r2, #0x18]
	ldrh r2, [r0]
	cmp r3, r2
	bhs _08005550
_08005534:
	ldr r0, _0800554C @ =0x0000FFC0
	ands r0, r2
	b _080052B4
	.align 2, 0
_0800553C: .4byte 0x030012F0
_08005540: .4byte gSamusData
_08005544: .4byte gEffectYPosition
_08005548: .4byte gPreviousYPosition
_0800554C: .4byte 0x0000FFC0
_08005550:
	ldr r0, _08005558 @ =0x0000FFC0
	ands r0, r3
	b _080052B4
	.align 2, 0
_08005558: .4byte 0x0000FFC0
_0800555C:
	ldr r4, _080055A0 @ =gSamusData
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800556E
	ldrb r0, [r4, #1]
	cmp r0, #0x26
	bne _080055B4
_0800556E:
	ldr r1, _080055A4 @ =0x030012F0
	mov r2, r8
	lsls r0, r2, #4
	adds r3, r0, r1
	movs r2, #0
	movs r0, #0xe
	strb r0, [r3]
	ldrb r0, [r3, #6]
	adds r0, #1
	strb r0, [r3, #6]
	strb r2, [r1, #4]
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x18]
	adds r0, r0, r1
	adds r0, #0x10
	strh r0, [r3, #0xa]
	ldrh r1, [r4, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080055A8
	ldrh r0, [r4, #0x16]
	adds r0, #0xc
	b _080055AC
	.align 2, 0
_080055A0: .4byte gSamusData
_080055A4: .4byte 0x030012F0
_080055A8:
	ldrh r0, [r4, #0x16]
	subs r0, #0xc
_080055AC:
	strh r0, [r3, #8]
	movs r0, #0x93
	bl PlaySound
_080055B4:
	ldr r0, _080055D0 @ =0x030012F0
	mov r2, r8
	lsls r1, r2, #4
	adds r1, r1, r0
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _080055C6
	movs r0, #0
	strb r0, [r1, #2]
_080055C6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080055D0: .4byte 0x030012F0

	thumb_func_start SamusUpdateEnvironmentEffects
SamusUpdateEnvironmentEffects: @ 0x080055D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _080055F8 @ =0x030012F0
	movs r0, #0
	strb r0, [r1, #6]
	strb r0, [r1, #0x16]
	ldr r0, _080055FC @ =gSamusData
	ldrb r0, [r0, #1]
	subs r0, #3
	cmp r0, #0x30
	bls _080055EE
	b _08005710
_080055EE:
	lsls r0, r0, #2
	ldr r1, _08005600 @ =_08005604
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080055F8: .4byte 0x030012F0
_080055FC: .4byte gSamusData
_08005600: .4byte _08005604
_08005604: @ jump table
	.4byte _080056EA @ case 0
	.4byte _080056C8 @ case 1
	.4byte _080056C8 @ case 2
	.4byte _08005710 @ case 3
	.4byte _08005710 @ case 4
	.4byte _08005710 @ case 5
	.4byte _08005710 @ case 6
	.4byte _080056C8 @ case 7
	.4byte _080056C8 @ case 8
	.4byte _08005710 @ case 9
	.4byte _08005710 @ case 10
	.4byte _080056EA @ case 11
	.4byte _08005710 @ case 12
	.4byte _080056C8 @ case 13
	.4byte _080056C8 @ case 14
	.4byte _080056C8 @ case 15
	.4byte _080056C8 @ case 16
	.4byte _080056C8 @ case 17
	.4byte _08005710 @ case 18
	.4byte _080056C8 @ case 19
	.4byte _08005710 @ case 20
	.4byte _08005710 @ case 21
	.4byte _080056C8 @ case 22
	.4byte _08005710 @ case 23
	.4byte _08005710 @ case 24
	.4byte _08005710 @ case 25
	.4byte _080056C8 @ case 26
	.4byte _080056C8 @ case 27
	.4byte _08005710 @ case 28
	.4byte _08005710 @ case 29
	.4byte _08005710 @ case 30
	.4byte _08005710 @ case 31
	.4byte _080056C8 @ case 32
	.4byte _080056C8 @ case 33
	.4byte _08005710 @ case 34
	.4byte _080056EA @ case 35
	.4byte _08005710 @ case 36
	.4byte _08005710 @ case 37
	.4byte _08005710 @ case 38
	.4byte _08005710 @ case 39
	.4byte _08005710 @ case 40
	.4byte _08005710 @ case 41
	.4byte _08005710 @ case 42
	.4byte _08005710 @ case 43
	.4byte _08005710 @ case 44
	.4byte _08005710 @ case 45
	.4byte _080056C8 @ case 46
	.4byte _08005710 @ case 47
	.4byte _080056C8 @ case 48
_080056C8:
	ldr r0, _080056D8 @ =gSamusData
	ldr r1, _080056DC @ =gPreviousYPosition
	ldrh r0, [r0, #0x18]
	ldrh r1, [r1]
	cmp r0, r1
	bhs _080056E0
	movs r0, #0
	b _080056E2
	.align 2, 0
_080056D8: .4byte gSamusData
_080056DC: .4byte gPreviousYPosition
_080056E0:
	movs r0, #1
_080056E2:
	movs r1, #3
	bl SamusCheckSetNewEnvironmentEffect
	b _08005710
_080056EA:
	ldr r0, _08005700 @ =gSamusData
	ldr r1, _08005704 @ =gPreviousYPosition
	ldrh r0, [r0, #0x18]
	ldrh r1, [r1]
	cmp r0, r1
	bhs _08005708
	movs r0, #0
	movs r1, #4
	bl SamusCheckSetNewEnvironmentEffect
	b _08005710
	.align 2, 0
_08005700: .4byte gSamusData
_08005704: .4byte gPreviousYPosition
_08005708:
	movs r0, #1
	movs r1, #4
	bl SamusCheckSetNewEnvironmentEffect
_08005710:
	ldr r1, _08005738 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	bl ClipdataUpdateCurrentAffecting
	movs r1, #0xff
	ands r1, r0
	cmp r1, #1
	bne _0800575E
	ldr r1, _0800573C @ =0x030012F0
	ldrb r0, [r1, #4]
	cmp r0, #0xdb
	bhi _08005740
	adds r0, #1
	strb r0, [r1, #4]
	b _0800575E
	.align 2, 0
_08005738: .4byte gSamusData
_0800573C: .4byte 0x030012F0
_08005740:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08005750
	movs r0, #0
	movs r1, #5
	bl SamusCheckSetNewEnvironmentEffect
	b _0800575E
_08005750:
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _0800575E
	movs r0, #1
	movs r1, #5
	bl SamusCheckSetNewEnvironmentEffect
_0800575E:
	ldr r6, _08005774 @ =gSamusData
	ldrb r0, [r6, #1]
	cmp r0, #0x3e
	bne _0800577C
	ldr r0, _08005778 @ =0x030012F0
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #0x10]
	mov r8, r0
	b _080057FA
	.align 2, 0
_08005774: .4byte gSamusData
_08005778: .4byte 0x030012F0
_0800577C:
	ldr r0, _080057CC @ =0x030012F0
	ldrb r1, [r0, #0x10]
	mov r8, r0
	cmp r1, #0
	bne _080057FA
	ldrh r0, [r6, #0x18]
	ldrh r1, [r6, #0x16]
	bl ClipdataUpdateCurrentAffecting
	adds r5, r0, #0
	movs r4, #0xff
	ands r5, r4
	ldrh r0, [r6, #0x26]
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #0x16]
	bl ClipdataUpdateCurrentAffecting
	ands r0, r4
	cmp r5, #2
	bne _080057D4
	cmp r0, #2
	beq _080057D4
	ldr r0, _080057D0 @ =gEquipment
	ldrb r0, [r0, #0xc]
	movs r1, #0xa0
	ands r1, r0
	cmp r1, #0
	bne _080057EC
	movs r0, #7
	mov r2, r8
	strb r0, [r2, #0x10]
	strb r1, [r2, #0x12]
	movs r0, #0x8c
	bl PlaySound
	b _080057EC
	.align 2, 0
_080057CC: .4byte 0x030012F0
_080057D0: .4byte gEquipment
_080057D4:
	cmp r5, #3
	bne _080057EC
	cmp r0, #3
	beq _080057EC
	ldr r0, _08005824 @ =0x030012F0
	movs r2, #0
	movs r1, #7
	strb r1, [r0, #0x10]
	strb r2, [r0, #0x12]
	movs r0, #0x8c
	bl PlaySound
_080057EC:
	ldr r0, _08005828 @ =gEffectYPosition
	ldrh r0, [r0]
	ldr r1, _08005824 @ =0x030012F0
	mov r8, r1
	cmp r0, #0
	beq _080057FA
	strh r0, [r1, #0x1a]
_080057FA:
	movs r7, #0
_080057FC:
	lsls r0, r7, #4
	mov r2, r8
	adds r1, r0, r2
	ldrb r2, [r1]
	adds r4, r0, #0
	cmp r2, #0
	beq _08005810
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
_08005810:
	subs r6, r2, #1
	cmp r6, #0xd
	bls _08005818
	b _08005A32
_08005818:
	lsls r0, r6, #2
	ldr r1, _0800582C @ =_08005830
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005824: .4byte 0x030012F0
_08005828: .4byte gEffectYPosition
_0800582C: .4byte _08005830
_08005830: @ jump table
	.4byte _08005868 @ case 0
	.4byte _08005A32 @ case 1
	.4byte _08005868 @ case 2
	.4byte _08005878 @ case 3
	.4byte _08005888 @ case 4
	.4byte _080058C4 @ case 5
	.4byte _08005900 @ case 6
	.4byte _08005948 @ case 7
	.4byte _08005958 @ case 8
	.4byte _08005948 @ case 9
	.4byte _08005968 @ case 10
	.4byte _08005978 @ case 11
	.4byte _080059AC @ case 12
	.4byte _08005A04 @ case 13
_08005868:
	ldr r0, _08005870 @ =0x030012F0
	adds r2, r4, r0
	ldr r3, _08005874 @ =0x083ECBA4
	b _08005A0A
	.align 2, 0
_08005870: .4byte 0x030012F0
_08005874: .4byte 0x083ECBA4
_08005878:
	ldr r0, _08005880 @ =0x030012F0
	adds r2, r4, r0
	ldr r3, _08005884 @ =0x083ECD34
	b _08005A0A
	.align 2, 0
_08005880: .4byte 0x030012F0
_08005884: .4byte 0x083ECD34
_08005888:
	ldr r0, _080058BC @ =0x030012F0
	adds r2, r4, r0
	ldr r3, _080058C0 @ =0x083ECD94
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r1, [r2, #1]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _0800589E
	b _08005A32
_0800589E:
	movs r0, #0
	strb r0, [r2, #1]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080058B2
	b _08005A22
_080058B2:
	movs r0, #0x76
	bl PlaySound
	b _08005A32
	.align 2, 0
_080058BC: .4byte 0x030012F0
_080058C0: .4byte 0x083ECD94
_080058C4:
	ldr r0, _080058F8 @ =0x030012F0
	adds r2, r4, r0
	ldr r3, _080058FC @ =0x083ECEB4
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r1, [r2, #1]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _080058DA
	b _08005A32
_080058DA:
	movs r0, #0
	strb r0, [r2, #1]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _080058EE
	b _08005A22
_080058EE:
	movs r0, #0x77
	bl PlaySound
	b _08005A32
	.align 2, 0
_080058F8: .4byte 0x030012F0
_080058FC: .4byte 0x083ECEB4
_08005900:
	ldr r0, _0800593C @ =0x030012F0
	adds r2, r4, r0
	ldr r0, _08005940 @ =gSamusData
	ldrh r0, [r0, #0x16]
	movs r3, #0
	strh r0, [r2, #8]
	ldr r5, _08005944 @ =0x083ECC74
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r2, #1]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _0800591E
	b _08005A32
_0800591E:
	strb r3, [r2, #1]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08005934
	b _08005A32
_08005934:
	strb r3, [r2]
	strb r3, [r2, #2]
	b _08005A32
	.align 2, 0
_0800593C: .4byte 0x030012F0
_08005940: .4byte gSamusData
_08005944: .4byte 0x083ECC74
_08005948:
	ldr r0, _08005950 @ =0x030012F0
	adds r2, r4, r0
	ldr r3, _08005954 @ =0x083ECBD4
	b _08005A0A
	.align 2, 0
_08005950: .4byte 0x030012F0
_08005954: .4byte 0x083ECBD4
_08005958:
	ldr r0, _08005960 @ =0x030012F0
	adds r2, r4, r0
	ldr r3, _08005964 @ =0x083ECCEC
	b _08005A0A
	.align 2, 0
_08005960: .4byte 0x030012F0
_08005964: .4byte 0x083ECCEC
_08005968:
	ldr r0, _08005970 @ =0x030012F0
	adds r2, r4, r0
	ldr r3, _08005974 @ =0x083ECD5C
	b _08005A0A
	.align 2, 0
_08005970: .4byte 0x030012F0
_08005974: .4byte 0x083ECD5C
_08005978:
	mov r0, r8
	adds r3, r4, r0
	ldr r0, _080059A8 @ =0x083ECBD4
	ldrb r1, [r3, #2]
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r2, [r3, #1]
	adds r5, r0, #0
	ldrb r1, [r1, #4]
	cmp r2, r1
	blo _08005A32
	movs r0, #0
	strb r0, [r3, #1]
	ldrb r0, [r3, #2]
	adds r0, #1
	strb r0, [r3, #2]
	cmp r7, #0
	bne _080059E8
	mov r1, r8
	ldrb r0, [r1, #2]
	cmp r0, #3
	beq _080059D8
	b _080059E8
	.align 2, 0
_080059A8: .4byte 0x083ECBD4
_080059AC:
	mov r2, r8
	adds r3, r4, r2
	ldr r0, _080059E4 @ =0x083ECC34
	ldrb r1, [r3, #2]
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r2, [r3, #1]
	adds r5, r0, #0
	ldrb r1, [r1, #4]
	cmp r2, r1
	blo _08005A32
	movs r0, #0
	strb r0, [r3, #1]
	ldrb r0, [r3, #2]
	adds r0, #1
	strb r0, [r3, #2]
	cmp r7, #0
	bne _080059E8
	mov r1, r8
	ldrb r0, [r1, #2]
	cmp r0, #3
	bne _080059E8
_080059D8:
	movs r0, #1
	movs r1, #1
	bl SamusCheckSetNewEnvironmentEffect
	b _08005A32
	.align 2, 0
_080059E4: .4byte 0x083ECC34
_080059E8:
	ldr r0, _08005A00 @ =0x030012F0
	adds r1, r4, r0
	ldrb r0, [r1, #2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08005A32
	strb r0, [r1]
	strb r0, [r1, #2]
	b _08005A32
	.align 2, 0
_08005A00: .4byte 0x030012F0
_08005A04:
	ldr r0, _08005A68 @ =0x030012F0
	adds r2, r4, r0
	ldr r3, _08005A6C @ =0x083ECDDC
_08005A0A:
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r1, [r2, #1]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08005A32
	movs r0, #0
	strb r0, [r2, #1]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
_08005A22:
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08005A32
	strb r0, [r2]
	strb r0, [r2, #2]
_08005A32:
	ldr r1, _08005A70 @ =0x0828FD20
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, _08005A68 @ =0x030012F0
	adds r0, r4, r2
	ldrb r0, [r0, #2]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xc
	adds r0, r4, r0
	ldr r1, [r1]
	str r1, [r0]
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	mov r8, r2
	cmp r7, #1
	bhi _08005A5C
	b _080057FC
_08005A5C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08005A68: .4byte 0x030012F0
_08005A6C: .4byte 0x083ECDDC
_08005A70: .4byte 0x0828FD20

	thumb_func_start SamusAimCannonStanding
SamusAimCannonStanding: @ 0x08005A74
	push {lr}
	ldr r0, _08005A98 @ =gButtonInput
	ldr r1, _08005A9C @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _08005AC4
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08005AA4
	ldr r0, _08005AA0 @ =gSamusData
	movs r1, #3
	strb r1, [r0, #7]
	movs r1, #2
	strb r1, [r0, #0xd]
	b _08005ADC
	.align 2, 0
_08005A98: .4byte gButtonInput
_08005A9C: .4byte gButtonAssignments
_08005AA0: .4byte gSamusData
_08005AA4:
	ldr r1, _08005AC0 @ =gSamusData
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08005AB4
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08005ADC
_08005AB4:
	movs r0, #2
	strb r0, [r1, #7]
	movs r0, #1
	strb r0, [r1, #0xd]
	b _08005ADC
	.align 2, 0
_08005AC0: .4byte gSamusData
_08005AC4:
	ldr r1, _08005AD4 @ =gSamusData
	strb r0, [r1, #0xd]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08005AD8
	movs r0, #4
	b _08005ADA
	.align 2, 0
_08005AD4: .4byte gSamusData
_08005AD8:
	movs r0, #1
_08005ADA:
	strb r0, [r1, #7]
_08005ADC:
	pop {r0}
	bx r0

	thumb_func_start SamusAimCannonMidAir
SamusAimCannonMidAir: @ 0x08005AE0
	push {lr}
	ldr r0, _08005B04 @ =gButtonInput
	ldr r1, _08005B08 @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _08005B30
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08005B10
	ldr r0, _08005B0C @ =gSamusData
	movs r1, #3
	strb r1, [r0, #7]
	movs r1, #2
	strb r1, [r0, #0xd]
	b _08005B8A
	.align 2, 0
_08005B04: .4byte gButtonInput
_08005B08: .4byte gButtonAssignments
_08005B0C: .4byte gSamusData
_08005B10:
	ldr r1, _08005B2C @ =gSamusData
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08005B20
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08005B8A
_08005B20:
	movs r0, #2
	strb r0, [r1, #7]
	movs r0, #1
	strb r0, [r1, #0xd]
	b _08005B8A
	.align 2, 0
_08005B2C: .4byte gSamusData
_08005B30:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08005B50
	ldr r1, _08005B48 @ =gSamusData
	ldrh r0, [r1, #0x12]
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _08005B4C
	movs r0, #2
	b _08005B84
	.align 2, 0
_08005B48: .4byte gSamusData
_08005B4C:
	movs r0, #4
	b _08005B84
_08005B50:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08005B70
	ldr r1, _08005B68 @ =gSamusData
	ldrh r0, [r1, #0x12]
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _08005B6C
	movs r0, #3
	b _08005B84
	.align 2, 0
_08005B68: .4byte gSamusData
_08005B6C:
	movs r0, #5
	b _08005B84
_08005B70:
	ldr r0, _08005B90 @ =gSamusData
	ldrb r1, [r0, #0xd]
	adds r3, r0, #0
	cmp r1, #0
	bne _08005B82
	ldrh r0, [r3, #0x12]
	ands r0, r2
	cmp r0, #0
	beq _08005B86
_08005B82:
	movs r0, #1
_08005B84:
	strb r0, [r3, #7]
_08005B86:
	movs r0, #0
	strb r0, [r3, #0xd]
_08005B8A:
	pop {r0}
	bx r0
	.align 2, 0
_08005B90: .4byte gSamusData

	thumb_func_start SamusAimCannonRunning
SamusAimCannonRunning: @ 0x08005B94
	push {r4, lr}
	ldr r0, _08005BBC @ =gButtonInput
	ldr r1, _08005BC0 @ =gButtonAssignments
	ldrh r3, [r0]
	ldrh r1, [r1, #2]
	ands r1, r3
	cmp r1, #0
	beq _08005BEC
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08005BC8
	ldr r0, _08005BC4 @ =gSamusData
	movs r1, #3
	strb r1, [r0, #7]
	movs r1, #2
	strb r1, [r0, #0xd]
	adds r2, r0, #0
	b _08005BE2
	.align 2, 0
_08005BBC: .4byte gButtonInput
_08005BC0: .4byte gButtonAssignments
_08005BC4: .4byte gSamusData
_08005BC8:
	ldr r0, _08005BE8 @ =gSamusData
	ldrb r1, [r0, #0xd]
	adds r2, r0, #0
	cmp r1, #0
	beq _08005BDA
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08005BE2
_08005BDA:
	movs r0, #2
	strb r0, [r2, #7]
	movs r0, #1
	strb r0, [r2, #0xd]
_08005BE2:
	movs r0, #0
	strb r0, [r2, #0xe]
	b _08005C22
	.align 2, 0
_08005BE8: .4byte gSamusData
_08005BEC:
	ldr r2, _08005C04 @ =gSamusData
	strb r1, [r2, #0xd]
	movs r0, #0x40
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08005C08
	movs r0, #2
	strb r0, [r2, #7]
	strb r1, [r2, #0xe]
	b _08005C22
	.align 2, 0
_08005C04: .4byte gSamusData
_08005C08:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _08005C18
	movs r0, #3
	strb r0, [r2, #7]
	strb r4, [r2, #0xe]
	b _08005C22
_08005C18:
	ldrb r0, [r2, #0xe]
	cmp r0, #0
	bne _08005C22
	movs r0, #1
	strb r0, [r2, #7]
_08005C22:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SamusAimCannonHorizontalLadder
SamusAimCannonHorizontalLadder: @ 0x08005C28
	push {lr}
	ldr r0, _08005C44 @ =gButtonInput
	ldr r1, _08005C48 @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _08005C50
	ldr r0, _08005C4C @ =gSamusData
	movs r1, #3
	strb r1, [r0, #7]
	movs r1, #2
	strb r1, [r0, #0xd]
	b _08005C7A
	.align 2, 0
_08005C44: .4byte gButtonInput
_08005C48: .4byte gButtonAssignments
_08005C4C: .4byte gSamusData
_08005C50:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08005C70
	ldr r1, _08005C68 @ =gSamusData
	ldrh r0, [r1, #0x12]
	ands r0, r2
	cmp r0, #0
	beq _08005C6C
	movs r0, #3
	b _08005C74
	.align 2, 0
_08005C68: .4byte gSamusData
_08005C6C:
	movs r0, #5
	b _08005C74
_08005C70:
	ldr r1, _08005C80 @ =gSamusData
	movs r0, #1
_08005C74:
	strb r0, [r1, #7]
	movs r0, #0
	strb r0, [r1, #0xd]
_08005C7A:
	pop {r0}
	bx r0
	.align 2, 0
_08005C80: .4byte gSamusData

	thumb_func_start SamusCheckShooting
SamusCheckShooting: @ 0x08005C84
	push {r4, lr}
	movs r4, #0
	ldr r0, _08005CB4 @ =gSamusData
	ldr r1, [r0, #8]
	ldr r2, _08005CB8 @ =0x00FFFF00
	ands r1, r2
	adds r3, r0, #0
	cmp r1, #0
	bne _08005CCA
	ldr r0, _08005CBC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08005CCA
	ldrb r1, [r3, #8]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08005CC0
	strb r2, [r3, #9]
	strb r2, [r3, #0xc]
	b _08005CC4
	.align 2, 0
_08005CB4: .4byte gSamusData
_08005CB8: .4byte 0x00FFFF00
_08005CBC: .4byte gChangedInput
_08005CC0:
	movs r0, #2
	strb r0, [r3, #9]
_08005CC4:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08005CCA:
	cmp r4, #0
	bne _08005D2E
	ldrb r1, [r3, #8]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08005D28
	ldr r0, _08005D00 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08005D0E
	ldr r0, _08005D04 @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08005D28
	ldrb r0, [r3, #0xc]
	cmp r0, #0x4e
	bhi _08005D08
	adds r0, #1
	strb r0, [r3, #0xc]
	b _08005D2A
	.align 2, 0
_08005D00: .4byte gButtonInput
_08005D04: .4byte gEquipment
_08005D08:
	movs r0, #0x40
	strb r0, [r3, #0xc]
	b _08005D2A
_08005D0E:
	ldrb r0, [r3, #0xc]
	cmp r0, #0x3f
	bls _08005D1A
	movs r0, #5
	strb r0, [r3, #9]
	b _08005D20
_08005D1A:
	cmp r0, #0x19
	bls _08005D22
	strb r2, [r3, #9]
_08005D20:
	movs r4, #1
_08005D22:
	movs r0, #0
	strb r0, [r3, #0xc]
	b _08005D2A
_08005D28:
	strb r4, [r3, #0xc]
_08005D2A:
	cmp r4, #0
	beq _08005D3A
_08005D2E:
	ldrb r1, [r3, #7]
	cmp r1, #0
	bne _08005D3A
	movs r0, #1
	strb r0, [r3, #7]
	strb r1, [r3, #0xe]
_08005D3A:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusCheckNewProjectile
SamusCheckNewProjectile: @ 0x08005D44
	push {lr}
	ldr r1, _08005D64 @ =gSamusData
	adds r2, r1, #0
	adds r2, #0x23
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r1, #1]
	adds r2, r1, #0
	cmp r0, #0x3c
	bls _08005D5A
	b _08005EE4
_08005D5A:
	lsls r0, r0, #2
	ldr r1, _08005D68 @ =_08005D6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005D64: .4byte gSamusData
_08005D68: .4byte _08005D6C
_08005D6C: @ jump table
	.4byte _08005E60 @ case 0
	.4byte _08005E60 @ case 1
	.4byte _08005E60 @ case 2
	.4byte _08005E60 @ case 3
	.4byte _08005E60 @ case 4
	.4byte _08005E60 @ case 5
	.4byte _08005E60 @ case 6
	.4byte _08005E60 @ case 7
	.4byte _08005E60 @ case 8
	.4byte _08005E60 @ case 9
	.4byte _08005E60 @ case 10
	.4byte _08005E60 @ case 11
	.4byte _08005E70 @ case 12
	.4byte _08005EAA @ case 13
	.4byte _08005EAA @ case 14
	.4byte _08005EE4 @ case 15
	.4byte _08005EAA @ case 16
	.4byte _08005E70 @ case 17
	.4byte _08005EE4 @ case 18
	.4byte _08005E70 @ case 19
	.4byte _08005EE4 @ case 20
	.4byte _08005E70 @ case 21
	.4byte _08005E60 @ case 22
	.4byte _08005EE4 @ case 23
	.4byte _08005E70 @ case 24
	.4byte _08005E70 @ case 25
	.4byte _08005E70 @ case 26
	.4byte _08005EE4 @ case 27
	.4byte _08005E70 @ case 28
	.4byte _08005E60 @ case 29
	.4byte _08005E60 @ case 30
	.4byte _08005E70 @ case 31
	.4byte _08005EE4 @ case 32
	.4byte _08005EE4 @ case 33
	.4byte _08005EE4 @ case 34
	.4byte _08005EE4 @ case 35
	.4byte _08005EE4 @ case 36
	.4byte _08005EE4 @ case 37
	.4byte _08005E60 @ case 38
	.4byte _08005E70 @ case 39
	.4byte _08005E60 @ case 40
	.4byte _08005E60 @ case 41
	.4byte _08005E70 @ case 42
	.4byte _08005E60 @ case 43
	.4byte _08005E60 @ case 44
	.4byte _08005E60 @ case 45
	.4byte _08005E60 @ case 46
	.4byte _08005E60 @ case 47
	.4byte _08005EE4 @ case 48
	.4byte _08005EE4 @ case 49
	.4byte _08005EE4 @ case 50
	.4byte _08005EE4 @ case 51
	.4byte _08005EE4 @ case 52
	.4byte _08005EE4 @ case 53
	.4byte _08005EE4 @ case 54
	.4byte _08005EE4 @ case 55
	.4byte _08005EE4 @ case 56
	.4byte _08005EE4 @ case 57
	.4byte _08005EE4 @ case 58
	.4byte _08005EE4 @ case 59
	.4byte _08005EAA @ case 60
_08005E60:
	bl SamusCheckShooting
	ldr r1, _08005E6C @ =gSamusData
	adds r1, #0x23
	strb r0, [r1]
	b _08005EE8
	.align 2, 0
_08005E6C: .4byte gSamusData
_08005E70:
	ldr r0, _08005E94 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08005EA0
	ldr r0, _08005E98 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08005EE4
	ldrb r0, [r2, #0xc]
	cmp r0, #0x4e
	bhi _08005E9C
	adds r0, #1
	b _08005EE6
	.align 2, 0
_08005E94: .4byte gButtonInput
_08005E98: .4byte gEquipment
_08005E9C:
	movs r0, #0x40
	b _08005EE6
_08005EA0:
	ldrb r0, [r2, #0xc]
	cmp r0, #0x3f
	bls _08005EE4
	movs r0, #5
	b _08005EE2
_08005EAA:
	ldr r0, _08005ED8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08005EE4
	ldrb r0, [r2, #0xa]
	cmp r0, #0
	bne _08005EE4
	ldr r0, _08005EDC @ =gEquipment
	ldrb r1, [r0, #0xb]
	movs r3, #0x10
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08005EE4
	ldrb r1, [r2, #8]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08005EE0
	movs r0, #6
	b _08005EE2
	.align 2, 0
_08005ED8: .4byte gChangedInput
_08005EDC: .4byte gEquipment
_08005EE0:
	movs r0, #4
_08005EE2:
	strb r0, [r2, #9]
_08005EE4:
	movs r0, #0
_08005EE6:
	strb r0, [r2, #0xc]
_08005EE8:
	pop {r0}
	bx r0

	thumb_func_start SamusCheckStandingOnDropThroughClipdata
SamusCheckStandingOnDropThroughClipdata: @ 0x08005EEC
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _08005F40 @ =gSamusData
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	beq _08005F56
	ldrh r0, [r4, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	adds r1, #0x1e
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	adds r5, r0, #0
	ldrh r0, [r4, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	subs r1, #0x1e
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	adds r1, r0, #0
	movs r2, #0xff
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0xc
	bne _08005F44
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	bne _08005F56
	b _08005F54
	.align 2, 0
_08005F40: .4byte gSamusData
_08005F44:
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r5
	cmp r0, #0
	bne _08005F56
	ands r1, r2
	cmp r1, #0xc
	bne _08005F56
_08005F54:
	movs r6, #1
_08005F56:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusSetForcedMovementForJumpingOrDropping
SamusSetForcedMovementForJumpingOrDropping: @ 0x08005F60
	push {lr}
	ldr r0, _08005F8C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08005FA4
	ldr r0, _08005F90 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08005F98
	bl SamusCheckStandingOnDropThroughClipdata
	cmp r0, #0
	beq _08005F98
	ldr r1, _08005F94 @ =gSamusData
	movs r0, #3
	strb r0, [r1, #3]
	movs r0, #1
	b _08005FA6
	.align 2, 0
_08005F8C: .4byte gChangedInput
_08005F90: .4byte gButtonInput
_08005F94: .4byte gSamusData
_08005F98:
	ldr r1, _08005FA0 @ =gSamusData
	movs r0, #1
	strb r0, [r1, #3]
	b _08005FA6
	.align 2, 0
_08005FA0: .4byte gSamusData
_08005FA4:
	movs r0, #0
_08005FA6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusUpdateHighlightedWeaponsAndCharge
SamusUpdateHighlightedWeaponsAndCharge: @ 0x08005FAC
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r1, _08005FC8 @ =gSamusData
	ldrb r0, [r1, #1]
	subs r0, #0xd
	adds r6, r1, #0
	cmp r0, #0x33
	bls _08005FBE
	b _080060E8
_08005FBE:
	lsls r0, r0, #2
	ldr r1, _08005FCC @ =_08005FD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08005FC8: .4byte gSamusData
_08005FCC: .4byte _08005FD0
_08005FD0: @ jump table
	.4byte _080060A0 @ case 0
	.4byte _080060A0 @ case 1
	.4byte _080060E8 @ case 2
	.4byte _080060A0 @ case 3
	.4byte _080060E8 @ case 4
	.4byte _080060A0 @ case 5
	.4byte _080060E8 @ case 6
	.4byte _080060E8 @ case 7
	.4byte _080060E8 @ case 8
	.4byte _080060E8 @ case 9
	.4byte _080060D8 @ case 10
	.4byte _080060E8 @ case 11
	.4byte _080060E8 @ case 12
	.4byte _080060E8 @ case 13
	.4byte _080060E8 @ case 14
	.4byte _080060E8 @ case 15
	.4byte _080060E8 @ case 16
	.4byte _080060E8 @ case 17
	.4byte _080060E8 @ case 18
	.4byte _080060D8 @ case 19
	.4byte _080060D8 @ case 20
	.4byte _080060D8 @ case 21
	.4byte _080060D8 @ case 22
	.4byte _080060D8 @ case 23
	.4byte _080060D8 @ case 24
	.4byte _080060E8 @ case 25
	.4byte _080060E8 @ case 26
	.4byte _080060E8 @ case 27
	.4byte _080060E8 @ case 28
	.4byte _080060E8 @ case 29
	.4byte _080060E8 @ case 30
	.4byte _080060E8 @ case 31
	.4byte _080060E8 @ case 32
	.4byte _080060E8 @ case 33
	.4byte _080060E8 @ case 34
	.4byte _080060D8 @ case 35
	.4byte _080060D8 @ case 36
	.4byte _080060A0 @ case 37
	.4byte _080060A0 @ case 38
	.4byte _080060D8 @ case 39
	.4byte _080060D8 @ case 40
	.4byte _080060D8 @ case 41
	.4byte _080060D8 @ case 42
	.4byte _080060D8 @ case 43
	.4byte _080060D8 @ case 44
	.4byte _080060D8 @ case 45
	.4byte _080060D8 @ case 46
	.4byte _080060A0 @ case 47
	.4byte _080060D8 @ case 48
	.4byte _080060D8 @ case 49
	.4byte _080060E8 @ case 50
	.4byte _080060D8 @ case 51
_080060A0:
	ldr r0, _080060C8 @ =gButtonInput
	ldr r1, _080060CC @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	ldr r3, _080060D0 @ =0x030012F0
	cmp r0, #0
	beq _08006116
	ldr r2, _080060D4 @ =gEquipment
	ldrb r1, [r2, #0xb]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08006116
	ldrb r0, [r2, #8]
	cmp r0, #0
	beq _08006116
	movs r5, #0x10
	b _08006116
	.align 2, 0
_080060C8: .4byte gButtonInput
_080060CC: .4byte gButtonAssignments
_080060D0: .4byte 0x030012F0
_080060D4: .4byte gEquipment
_080060D8:
	ldr r1, _080060E4 @ =0x030012F0
	movs r0, #0
	strb r0, [r1, #0x13]
	adds r3, r1, #0
	b _08006116
	.align 2, 0
_080060E4: .4byte 0x030012F0
_080060E8:
	ldr r0, _08006134 @ =gButtonInput
	ldr r1, _08006138 @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	ldr r3, _0800613C @ =0x030012F0
	cmp r0, #0
	beq _08006116
	ldr r2, _08006140 @ =gEquipment
	ldrb r1, [r2, #0xb]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08006116
	ldrh r0, [r2, #4]
	cmp r0, #0
	beq _08006116
	movs r5, #1
	ldrb r0, [r6, #0xc]
	cmp r0, #0x3f
	bls _08006116
	movs r0, #5
	strb r0, [r6, #9]
_08006116:
	cmp r5, #1
	bne _08006144
	ldr r0, _08006140 @ =gEquipment
	ldrb r1, [r0, #0xb]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08006144
	ldrb r1, [r3, #0x13]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	blt _08006148
	adds r0, r1, #1
	b _08006146
	.align 2, 0
_08006134: .4byte gButtonInput
_08006138: .4byte gButtonAssignments
_0800613C: .4byte 0x030012F0
_08006140: .4byte gEquipment
_08006144:
	movs r0, #0
_08006146:
	strb r0, [r3, #0x13]
_08006148:
	adds r4, r6, #0
	ldrb r0, [r4, #8]
	cmp r0, r5
	bhs _08006156
	movs r0, #0x91
	bl PlaySound
_08006156:
	movs r1, #0
	strb r5, [r4, #8]
	cmp r5, #0
	bne _08006164
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _08006168
_08006164:
	strb r1, [r6, #0xc]
	strb r1, [r6, #0xe]
_08006168:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SamusSetSpinningPose
SamusSetSpinningPose: @ 0x08006170
	push {lr}
	ldr r0, _08006188 @ =gSamusData
	ldrb r2, [r0, #1]
	adds r3, r0, #0
	cmp r2, #0x16
	beq _08006196
	cmp r2, #0x16
	bgt _0800618C
	cmp r2, #0xb
	beq _08006196
	b _0800623C
	.align 2, 0
_08006188: .4byte gSamusData
_0800618C:
	cmp r2, #0x1d
	beq _080061C0
	cmp r2, #0x1e
	beq _080061FC
	b _0800623C
_08006196:
	ldr r0, _080061B8 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800623C
	ldr r0, _080061BC @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080061D0
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800623C
	movs r0, #0x1d
	strb r0, [r3, #1]
	b _0800623C
	.align 2, 0
_080061B8: .4byte 0x03001330
_080061BC: .4byte gEquipment
_080061C0:
	ldr r0, _080061D8 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _080061DC
_080061D0:
	movs r0, #0x1e
	strb r0, [r3, #1]
	b _0800623C
	.align 2, 0
_080061D8: .4byte gEquipment
_080061DC:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080061EC
	ldr r0, _080061F8 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800623C
_080061EC:
	movs r0, #0xb
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x22
	strb r2, [r0]
	b _0800623C
	.align 2, 0
_080061F8: .4byte 0x03001330
_080061FC:
	ldr r0, _08006210 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _08006214
	movs r0, #0
	movs r1, #0xb
	strb r1, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x22
	b _0800623A
	.align 2, 0
_08006210: .4byte 0x03001330
_08006214:
	ldr r0, _0800622C @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800623C
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08006230
	movs r0, #0x1d
	b _08006232
	.align 2, 0
_0800622C: .4byte gEquipment
_08006230:
	movs r0, #0xb
_08006232:
	strb r0, [r3, #1]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0
_0800623A:
	strb r0, [r1]
_0800623C:
	pop {r0}
	bx r0

	thumb_func_start SamusApplyXAcceleration
SamusApplyXAcceleration: @ 0x08006240
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	ldr r2, _0800626C @ =gSamusData
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08006270
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldrh r1, [r2, #0x1a]
	adds r0, r0, r1
	strh r0, [r2, #0x1a]
	lsls r0, r0, #0x10
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _0800628A
	strh r3, [r2, #0x1a]
	b _0800628A
	.align 2, 0
_0800626C: .4byte gSamusData
_08006270:
	ldrh r1, [r2, #0x1a]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	strh r1, [r2, #0x1a]
	movs r0, #0x1a
	ldrsh r1, [r2, r0]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0800628A
	strh r0, [r2, #0x1a]
_0800628A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SamusHazardDamage
SamusHazardDamage: @ 0x08006290
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _080062D8 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x3e
	bne _080062A0
	b _080063EC
_080062A0:
	ldr r5, _080062DC @ =0x030012F0
	ldrb r0, [r5, #0x14]
	adds r0, #1
	strb r0, [r5, #0x14]
	movs r6, #0
	mov r8, r6
	movs r7, #0
	ldrh r0, [r1, #0x18]
	ldrh r1, [r1, #0x16]
	bl ClipdataUpdateCurrentAffecting
	adds r4, r0, #0
	movs r0, #0xff
	ands r4, r0
	ldr r0, _080062E0 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0xa0
	ands r0, r1
	cmp r0, #0
	beq _080062E4
	cmp r4, #3
	bne _0800636A
	movs r6, #1
	ldrb r0, [r5, #0x14]
	cmp r0, #3
	bls _0800636A
	movs r7, #1
	b _0800636A
	.align 2, 0
_080062D8: .4byte gSamusData
_080062DC: .4byte 0x030012F0
_080062E0: .4byte gEquipment
_080062E4:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800630C
	cmp r4, #3
	bne _080062FC
	movs r6, #1
	ldrb r0, [r5, #0x14]
	cmp r0, #1
	bls _0800636A
	movs r7, #1
	b _0800636A
_080062FC:
	cmp r4, #2
	bne _0800636A
	movs r6, #1
	ldrb r0, [r5, #0x14]
	cmp r0, #4
	bls _0800636A
	movs r7, #1
	b _0800636A
_0800630C:
	cmp r4, #3
	bne _08006316
	movs r6, #1
	movs r7, #1
	b _0800636A
_08006316:
	cmp r4, #5
	bne _08006342
	movs r6, #1
	ldrb r0, [r5, #0x14]
	cmp r0, #3
	bls _0800632A
	movs r7, #1
	movs r0, #0x8f
	bl PlaySound
_0800632A:
	ldrb r0, [r5, #5]
	adds r1, r0, #1
	strb r1, [r5, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x57
	bls _0800636A
	mov r0, r8
	strb r0, [r5, #5]
	movs r0, #1
	mov r8, r0
	b _0800636A
_08006342:
	cmp r4, #2
	bne _08006352
	movs r6, #1
	ldrb r0, [r5, #0x14]
	cmp r0, #2
	bls _0800636A
	movs r7, #1
	b _0800636A
_08006352:
	cmp r4, #4
	beq _0800635A
	cmp r4, #6
	bne _0800636A
_0800635A:
	movs r6, #1
	ldrb r0, [r5, #0x14]
	cmp r0, #9
	bls _0800636A
	movs r7, #1
	movs r0, #0x8f
	bl PlaySound
_0800636A:
	cmp r6, #0
	bne _08006384
	ldr r0, _0800637C @ =0x030012F0
	strb r6, [r0, #5]
	strb r6, [r0, #0x14]
	strb r6, [r0, #0x15]
	ldr r2, _08006380 @ =gEquipment
	b _080063D4
	.align 2, 0
_0800637C: .4byte 0x030012F0
_08006380: .4byte gEquipment
_08006384:
	ldr r5, _080063A0 @ =0x030012F0
	ldrb r0, [r5, #0x15]
	adds r1, r0, #1
	strb r1, [r5, #0x15]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1a
	beq _080063AA
	cmp r0, #0x1a
	bgt _080063A4
	cmp r0, #1
	beq _080063AA
	b _080063C2
	.align 2, 0
_080063A0: .4byte 0x030012F0
_080063A4:
	cmp r0, #0x32
	beq _080063B8
	b _080063C2
_080063AA:
	subs r0, r4, #2
	cmp r0, #1
	bhi _080063C2
	movs r0, #0x8b
	bl PlaySound
	b _080063C2
_080063B8:
	movs r0, #0x88
	bl unk_3b78
	movs r0, #0
	strb r0, [r5, #0x15]
_080063C2:
	ldr r2, _080063E4 @ =gEquipment
	cmp r7, #0
	beq _080063D4
	ldr r1, _080063E8 @ =0x030012F0
	movs r0, #0
	strb r0, [r1, #0x14]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
_080063D4:
	ldrh r0, [r2]
	cmp r0, #0
	beq _080063E0
	mov r0, r8
	cmp r0, #0
	beq _080063EC
_080063E0:
	movs r0, #1
	b _080063EE
	.align 2, 0
_080063E4: .4byte gEquipment
_080063E8: .4byte 0x030012F0
_080063EC:
	movs r0, #0
_080063EE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SamusUpdate
SamusUpdate: @ 0x080063F8
	push {r4, r5, lr}
	bl SamusHazardDamage
	cmp r0, #0
	beq _08006406
	movs r0, #0xfa
	b _0800657C
_08006406:
	ldr r1, _0800647C @ =gSamusData
	ldrb r0, [r1, #0xa]
	cmp r0, #0
	beq _08006412
	subs r0, #1
	strb r0, [r1, #0xa]
_08006412:
	ldrb r0, [r1, #0xb]
	cmp r0, #0
	beq _0800641C
	subs r0, #1
	strb r0, [r1, #0xb]
_0800641C:
	ldr r4, _08006480 @ =0x030012D8
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _08006438
	movs r1, #0xf
	ands r0, r1
	cmp r0, #4
	bne _08006432
	movs r0, #0x98
	bl PlaySound
_08006432:
	ldrb r0, [r4, #4]
	subs r0, #1
	strb r0, [r4, #4]
_08006438:
	ldr r2, _08006484 @ =0x0300144F
	ldrb r0, [r2]
	cmp r0, #0
	beq _0800644E
	subs r0, #1
	strb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0800644E
	strb r1, [r2]
_0800644E:
	ldr r4, _08006488 @ =gPoseLock
	ldrb r0, [r4]
	cmp r0, #0
	beq _08006460
	ldr r0, _0800648C @ =0x030012F0
	movs r1, #0
	strb r1, [r0, #0x13]
	ldr r0, _0800647C @ =gSamusData
	strb r1, [r0, #0xc]
_08006460:
	bl SamusUpdateHighlightedWeaponsAndCharge
	bl SamusSetSpinningPose
	movs r5, #0xff
	ldrb r1, [r4]
	cmp r1, #0
	bne _08006494
	bl SamusCheckNewProjectile
	ldr r1, _08006490 @ =0x0828FD58
	ldr r0, _0800647C @ =gSamusData
	ldrb r0, [r0, #1]
	b _080064A8
	.align 2, 0
_0800647C: .4byte gSamusData
_08006480: .4byte 0x030012D8
_08006484: .4byte 0x0300144F
_08006488: .4byte gPoseLock
_0800648C: .4byte 0x030012F0
_08006490: .4byte 0x0828FD58
_08006494:
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080064D8
	ldr r2, _080064B8 @ =gSamusData
	ldrb r0, [r2, #1]
	cmp r0, #0x3f
	bne _080064C0
	ldr r1, _080064BC @ =0x0828FD58
_080064A8:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080064D8
	.align 2, 0
_080064B8: .4byte gSamusData
_080064BC: .4byte 0x0828FD58
_080064C0:
	ldr r0, _080064E4 @ =gEquipment
	ldrb r1, [r0, #0xc]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080064D8
	movs r1, #0x1a
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bne _080064D8
	ldr r0, _080064E8 @ =0x0000FF9C
	strh r0, [r2, #0x1a]
_080064D8:
	ldr r4, _080064EC @ =gSamusData
	ldrb r0, [r4, #1]
	cmp r0, #0x24
	bne _080064F0
	movs r0, #1
	b _08006526
	.align 2, 0
_080064E4: .4byte gEquipment
_080064E8: .4byte 0x0000FF9C
_080064EC: .4byte gSamusData
_080064F0:
	ldrh r0, [r4, #0x1a]
	adds r0, #0x9f
	lsls r0, r0, #0x10
	movs r1, #0x9f
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08006518
	ldrb r0, [r4, #6]
	adds r1, r0, #1
	strb r1, [r4, #6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _08006528
	movs r0, #0x2c
	strb r0, [r4, #6]
	movs r0, #0x6b
	bl PlaySound
	b _08006528
_08006518:
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _08006524
	movs r0, #0x6a
	bl StopSound
_08006524:
	movs r0, #0
_08006526:
	strb r0, [r4, #6]
_08006528:
	ldr r0, _08006548 @ =0x0300144F
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08006550
	ldr r1, _0800654C @ =gSamusData
	movs r2, #0x1a
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08006562
	movs r0, #0
	strh r0, [r1, #0x1a]
	b _08006562
	.align 2, 0
_08006548: .4byte 0x0300144F
_0800654C: .4byte gSamusData
_08006550:
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08006562
	ldr r1, _08006584 @ =gSamusData
	movs r3, #0x1a
	ldrsh r0, [r1, r3]
	cmp r0, #0
	ble _08006562
	strh r2, [r1, #0x1a]
_08006562:
	cmp r5, #0xff
	bne _0800657A
	ldr r1, _08006588 @ =0x0828FE5C
	ldr r0, _08006584 @ =gSamusData
	ldrb r0, [r0, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0800657A:
	adds r0, r5, #0
_0800657C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08006584: .4byte gSamusData
_08006588: .4byte 0x0828FE5C

	thumb_func_start SamusInactivity
SamusInactivity: @ 0x0800658C
	movs r0, #0xff
	bx lr

	thumb_func_start SamusStanding
SamusStanding: @ 0x08006590
	push {r4, r5, r6, lr}
	ldr r0, _080065C8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080065D8
	ldr r0, _080065CC @ =0x030012D8
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080065D8
	ldr r0, _080065D0 @ =0x0828FCCC
	ldrh r1, [r0, #0xa]
	subs r1, #0x20
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #0
	bne _080065D8
	ldr r1, _080065D4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	movs r0, #0x23
	b _080066EA
	.align 2, 0
_080065C8: .4byte gChangedInput
_080065CC: .4byte 0x030012D8
_080065D0: .4byte 0x0828FCCC
_080065D4: .4byte gSamusData
_080065D8:
	bl SamusSetForcedMovementForJumpingOrDropping
	cmp r0, #0
	beq _080065E4
	movs r0, #0xfe
	b _080066EA
_080065E4:
	ldr r0, _080065F8 @ =gButtonInput
	ldr r4, _080065FC @ =gSamusData
	ldrh r2, [r0]
	ldrh r1, [r4, #0x12]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08006600
	movs r0, #3
	b _080066EA
	.align 2, 0
_080065F8: .4byte gButtonInput
_080065FC: .4byte gSamusData
_08006600:
	movs r0, #0x30
	eors r0, r1
	ands r0, r2
	cmp r0, #0
	beq _08006618
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	bne _080066E0
	movs r0, #1
	b _080066EA
_08006618:
	ldr r0, _08006658 @ =gChangedInput
	ldrh r1, [r0]
	movs r5, #0x80
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0800667C
	ldrh r0, [r4, #0x18]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	asrs r0, r0, #0x10
	cmp r0, #1
	beq _0800669A
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _08006646
	ldrb r0, [r4, #7]
	cmp r0, #3
	bne _080066B0
_08006646:
	ldr r0, _0800665C @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _08006660
	movs r0, #0x95
	bl PlaySound
	b _08006666
	.align 2, 0
_08006658: .4byte gChangedInput
_0800665C: .4byte 0x03001330
_08006660:
	movs r0, #0x81
	bl PlaySound
_08006666:
	ldr r0, _08006674 @ =gSamusData
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _08006678
	movs r0, #9
	b _080066EA
	.align 2, 0
_08006674: .4byte gSamusData
_08006678:
	movs r0, #7
	b _080066EA
_0800667C:
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080066B0
	ldrh r0, [r4, #0x18]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _080066B0
_0800669A:
	ldrh r1, [r4, #0x16]
	ldr r0, _080066AC @ =0x0000FFC0
	ands r0, r1
	adds r0, #0x20
	strh r0, [r4, #0x16]
	strh r5, [r4, #0x14]
	movs r0, #0x17
	b _080066EA
	.align 2, 0
_080066AC: .4byte 0x0000FFC0
_080066B0:
	ldr r4, _080066E4 @ =gSamusData
	ldrb r5, [r4, #7]
	ldrb r6, [r4, #0xd]
	bl SamusAimCannonStanding
	ldrb r0, [r4, #0xf]
	cmp r0, #0
	beq _080066CE
	subs r0, #1
	strb r0, [r4, #0xf]
	ldrb r0, [r4, #7]
	cmp r0, #4
	bne _080066CE
	strb r5, [r4, #7]
	strb r6, [r4, #0xd]
_080066CE:
	ldr r1, _080066E4 @ =gSamusData
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _080066E8
	ldrb r0, [r1, #1]
	cmp r0, #2
	beq _080066E8
_080066E0:
	movs r0, #2
	b _080066EA
	.align 2, 0
_080066E4: .4byte gSamusData
_080066E8:
	movs r0, #0xff
_080066EA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SamusStandingGFX
SamusStandingGFX: @ 0x080066F0
	push {r4, lr}
	ldr r0, _0800672C @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08006730 @ =0x082BD9C8
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08006724
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08006724
	strb r0, [r2]
_08006724:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800672C: .4byte gSamusData
_08006730: .4byte 0x082BD9C8

	thumb_func_start SamusTurningAround
SamusTurningAround: @ 0x08006734
	push {lr}
	ldr r0, _0800676C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800677C
	ldr r0, _08006770 @ =0x030012D8
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0800677C
	ldr r0, _08006774 @ =0x0828FCCC
	ldrh r1, [r0, #0xa]
	subs r1, #0x20
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #0
	bne _0800677C
	ldr r1, _08006778 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	movs r0, #0x23
	b _080067EA
	.align 2, 0
_0800676C: .4byte gChangedInput
_08006770: .4byte 0x030012D8
_08006774: .4byte 0x0828FCCC
_08006778: .4byte gSamusData
_0800677C:
	ldr r0, _080067AC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080067BE
	ldr r1, _080067B0 @ =gSamusData
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08006796
	ldrb r0, [r1, #7]
	cmp r0, #3
	bne _080067BE
_08006796:
	movs r0, #8
	strb r0, [r1, #1]
	ldr r0, _080067B4 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _080067B8
	movs r0, #0x95
	bl PlaySound
	b _080067BE
	.align 2, 0
_080067AC: .4byte gChangedInput
_080067B0: .4byte gSamusData
_080067B4: .4byte 0x03001330
_080067B8:
	movs r0, #0x81
	bl PlaySound
_080067BE:
	bl SamusSetForcedMovementForJumpingOrDropping
	cmp r0, #0
	beq _080067CA
	movs r0, #0xfe
	b _080067EA
_080067CA:
	ldr r1, _080067E0 @ =gSamusData
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _080067E8
	ldrb r0, [r1, #1]
	cmp r0, #8
	bne _080067E4
	movs r0, #9
	b _080067EA
	.align 2, 0
_080067E0: .4byte gSamusData
_080067E4:
	movs r0, #2
	b _080067EA
_080067E8:
	movs r0, #0xff
_080067EA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusTurningAroundGFX
SamusTurningAroundGFX: @ 0x080067F0
	push {r4, lr}
	ldr r0, _08006828 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _0800682C @ =0x082CAFB8
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08006830
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08006830
	movs r0, #0
	b _08006832
	.align 2, 0
_08006828: .4byte gSamusData
_0800682C: .4byte 0x082CAFB8
_08006830:
	movs r0, #0xff
_08006832:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusShootingGFX
SamusShootingGFX: @ 0x08006838
	push {r4, lr}
	ldr r0, _08006870 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08006874 @ =0x082BDA08
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08006878
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08006878
	movs r0, #0
	b _0800687A
	.align 2, 0
_08006870: .4byte gSamusData
_08006874: .4byte 0x082BDA08
_08006878:
	movs r0, #0xff
_0800687A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusRunning
SamusRunning: @ 0x08006880
	push {r4, lr}
	ldr r0, _080068B0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080068BC
	ldr r0, _080068B4 @ =0x03001330
	ldrb r0, [r0]
	ldr r2, _080068B8 @ =gSamusData
	cmp r0, #0
	beq _080068A8
	ldrh r1, [r2, #0x1e]
	ldrh r0, [r2, #0x12]
	ands r0, r1
	cmp r0, #0
	beq _080068A8
	ldrh r0, [r2, #0x18]
	subs r0, #2
	strh r0, [r2, #0x18]
_080068A8:
	movs r0, #1
	strb r0, [r2, #3]
	movs r0, #0xfe
	b _08006982
	.align 2, 0
_080068B0: .4byte gChangedInput
_080068B4: .4byte 0x03001330
_080068B8: .4byte gSamusData
_080068BC:
	ldr r2, _080068E0 @ =0x03001330
	ldrh r4, [r2, #0xe]
	ldr r0, _080068E4 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08006920
	ldrb r0, [r2]
	cmp r0, #0
	bne _08006920
	ldr r0, _080068E8 @ =gSamusData
	ldrb r0, [r0, #0xf]
	cmp r0, #0x8b
	bls _080068EC
	movs r4, #0xa0
	b _080068F2
	.align 2, 0
_080068E0: .4byte 0x03001330
_080068E4: .4byte gEquipment
_080068E8: .4byte gSamusData
_080068EC:
	cmp r0, #0x77
	bls _080068F2
	movs r4, #0x8c
_080068F2:
	ldr r1, _0800691C @ =gSamusData
	ldrh r0, [r1, #0x1a]
	adds r0, #0x3f
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bls _08006922
	ldrb r0, [r1, #0xf]
	cmp r0, #0x9f
	bhi _08006926
	adds r0, #1
	strb r0, [r1, #0xf]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x91
	bne _08006926
	movs r0, #0x6a
	bl PlaySound
	b _08006926
	.align 2, 0
_0800691C: .4byte gSamusData
_08006920:
	ldr r1, _0800694C @ =gSamusData
_08006922:
	movs r0, #0
	strb r0, [r1, #0xf]
_08006926:
	ldr r0, _08006950 @ =gButtonInput
	ldr r1, _0800694C @ =gSamusData
	ldrh r3, [r0]
	ldrh r2, [r1, #0x12]
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _08006958
	ldr r0, _08006954 @ =0x03001330
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	bl SamusApplyXAcceleration
	bl SamusAimCannonRunning
	movs r0, #0xff
	b _08006982
	.align 2, 0
_0800694C: .4byte gSamusData
_08006950: .4byte gButtonInput
_08006954: .4byte 0x03001330
_08006958:
	ldrb r0, [r1, #6]
	cmp r0, #0
	beq _08006962
	movs r0, #0x1f
	b _08006982
_08006962:
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _08006970
	movs r0, #2
	b _08006982
_08006970:
	movs r0, #0x30
	eors r0, r2
	ands r0, r3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08006980
	movs r0, #1
	b _08006982
_08006980:
	movs r0, #0
_08006982:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusRunningGFX
SamusRunningGFX: @ 0x08006988
	push {r4, lr}
	ldr r4, _080069DC @ =0x082BD628
	ldr r3, _080069E0 @ =gSamusData
	movs r0, #0x22
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	ldrb r0, [r3, #6]
	cmp r0, #0
	beq _080069A8
	subs r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_080069A8:
	ldr r0, _080069E4 @ =0x03001330
	ldrb r2, [r0]
	cmp r2, #0
	beq _080069B4
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_080069B4:
	adds r3, #0x21
	ldrb r0, [r3]
	cmp r0, r1
	blo _08006A46
	movs r0, #0
	strb r0, [r3]
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r0, r1, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080069E8
	mov r1, ip
	strb r0, [r1]
	b _08006A46
	.align 2, 0
_080069DC: .4byte 0x082BD628
_080069E0: .4byte gSamusData
_080069E4: .4byte 0x03001330
_080069E8:
	cmp r1, #4
	beq _08006A20
	cmp r1, #4
	bgt _080069F6
	cmp r1, #1
	beq _08006A00
	b _08006A46
_080069F6:
	cmp r1, #6
	beq _08006A0C
	cmp r1, #9
	beq _08006A20
	b _08006A46
_08006A00:
	cmp r2, #1
	beq _08006A10
	movs r0, #0x64
	bl PlaySound
	b _08006A46
_08006A0C:
	cmp r2, #1
	bne _08006A18
_08006A10:
	movs r0, #0x95
	bl PlaySound
	b _08006A46
_08006A18:
	movs r0, #0x65
	bl PlaySound
	b _08006A46
_08006A20:
	ldr r1, _08006A34 @ =0x030012F0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08006A38
	movs r0, #0
	movs r1, #0
	bl SamusCheckSetNewEnvironmentEffect
	b _08006A46
	.align 2, 0
_08006A34: .4byte 0x030012F0
_08006A38:
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _08006A46
	movs r0, #1
	movs r1, #0
	bl SamusCheckSetNewEnvironmentEffect
_08006A46:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusMidAir
SamusMidAir: @ 0x08006A50
	push {r4, r5, r6, r7, lr}
	ldr r2, _08006A7C @ =gChangedInput
	ldrh r1, [r2]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08006A88
	ldr r0, _08006A80 @ =gSamusData
	ldrb r0, [r0, #7]
	cmp r0, #5
	bne _08006A88
	ldr r0, _08006A84 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08006A88
	movs r0, #0x7f
	bl PlaySound
	movs r0, #0x10
	b _08006B64
	.align 2, 0
_08006A7C: .4byte gChangedInput
_08006A80: .4byte gSamusData
_08006A84: .4byte gEquipment
_08006A88:
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08006ACC
	ldr r0, _08006AA0 @ =0x030012D8
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08006AA4
	movs r0, #0x23
	b _08006B64
	.align 2, 0
_08006AA0: .4byte 0x030012D8
_08006AA4:
	ldr r0, _08006AC4 @ =gButtonInput
	ldrh r0, [r0]
	movs r2, #0xc0
	ands r2, r0
	cmp r2, #0
	bne _08006ACC
	ldr r0, _08006AC8 @ =gSamusData
	movs r1, #0xb
	strb r1, [r0, #1]
	adds r1, r0, #0
	adds r1, #0x22
	strb r2, [r1]
	adds r0, #0x21
	strb r2, [r0]
	b _08006B62
	.align 2, 0
_08006AC4: .4byte gButtonInput
_08006AC8: .4byte gSamusData
_08006ACC:
	movs r6, #0
	ldr r5, _08006AF4 @ =0x03001330
	ldrh r2, [r5, #6]
	adds r7, r2, #0
	ldr r0, _08006AF8 @ =gButtonInput
	ldr r3, _08006AFC @ =gSamusData
	ldrh r4, [r0]
	ldrh r1, [r3, #0x12]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08006B00
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r2, #8
	ldrsh r1, [r5, r2]
	bl SamusApplyXAcceleration
	b _08006B3E
	.align 2, 0
_08006AF4: .4byte 0x03001330
_08006AF8: .4byte gButtonInput
_08006AFC: .4byte gSamusData
_08006B00:
	movs r0, #0x30
	eors r0, r1
	ands r0, r4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08006B10
	movs r6, #1
	b _08006B3E
_08006B10:
	ldrh r1, [r3, #0x1a]
	movs r4, #0x1a
	ldrsh r0, [r3, r4]
	cmp r0, #0
	ble _08006B2A
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	subs r0, r1, r0
	strh r0, [r3, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08006B3E
	b _08006B3C
_08006B2A:
	cmp r0, #0
	bge _08006B3E
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	strh r0, [r3, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	ble _08006B3E
_08006B3C:
	strh r6, [r3, #0x1a]
_08006B3E:
	bl SamusAimCannonMidAir
	cmp r6, #0
	beq _08006B4A
	movs r0, #5
	b _08006B64
_08006B4A:
	ldr r0, _08006B6C @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08006B62
	ldr r2, _08006B70 @ =gSamusData
	movs r3, #0x1c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _08006B62
	strh r1, [r2, #0x1c]
_08006B62:
	movs r0, #0xff
_08006B64:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006B6C: .4byte gButtonInput
_08006B70: .4byte gSamusData

	thumb_func_start SamusMidAirGFX
SamusMidAirGFX: @ 0x08006B74
	push {r4, lr}
	ldr r1, _08006B94 @ =gSamusData
	movs r2, #0x1c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	blt _08006B98
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #2
	bne _08006BA6
	adds r2, r1, #0
	adds r2, #0x21
	movs r0, #0
	b _08006BA4
	.align 2, 0
_08006B94: .4byte gSamusData
_08006B98:
	adds r2, r1, #0
	adds r2, #0x22
	ldrb r0, [r2]
	cmp r0, #1
	bhi _08006BA6
	movs r0, #2
_08006BA4:
	strb r0, [r2]
_08006BA6:
	adds r3, r1, #0
	adds r3, #0x21
	ldr r4, _08006BE0 @ =0x082C4348
	adds r2, r1, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08006BD8
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08006BD8
	subs r0, r1, #1
	strb r0, [r2]
_08006BD8:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08006BE0: .4byte 0x082C4348

	thumb_func_start SamusTurningAroundMidAir
SamusTurningAroundMidAir: @ 0x08006BE4
	push {lr}
	ldr r0, _08006C00 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08006C3C
	ldr r0, _08006C04 @ =0x030012D8
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08006C08
	movs r0, #0x23
	b _08006C6C
	.align 2, 0
_08006C00: .4byte gChangedInput
_08006C04: .4byte 0x030012D8
_08006C08:
	ldr r0, _08006C34 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08006C3C
	ldr r2, _08006C38 @ =gSamusData
	movs r0, #0xb
	strb r0, [r2, #1]
	ldrh r0, [r2, #0x12]
	movs r1, #0x30
	eors r0, r1
	movs r1, #0
	strh r0, [r2, #0x12]
	adds r0, r2, #0
	adds r0, #0x22
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	strb r1, [r2, #2]
	b _08006C6A
	.align 2, 0
_08006C34: .4byte gButtonInput
_08006C38: .4byte gSamusData
_08006C3C:
	ldr r2, _08006C50 @ =gSamusData
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _08006C54
	movs r0, #2
	strb r0, [r2, #3]
	movs r0, #0xfe
	b _08006C6C
	.align 2, 0
_08006C50: .4byte gSamusData
_08006C54:
	ldr r0, _08006C70 @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08006C6A
	movs r3, #0x1c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _08006C6A
	strh r1, [r2, #0x1c]
_08006C6A:
	movs r0, #0xff
_08006C6C:
	pop {r1}
	bx r1
	.align 2, 0
_08006C70: .4byte gButtonInput

	thumb_func_start SamusTurningAroundMidAirGFX
SamusTurningAroundMidAirGFX: @ 0x08006C74
	push {r4, r5, lr}
	ldr r3, _08006CB4 @ =gSamusData
	movs r0, #0x21
	adds r0, r0, r3
	mov ip, r0
	ldr r4, _08006CB8 @ =0x082CB2B8
	adds r2, r3, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	mov r5, ip
	ldrb r1, [r5]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08006CBC
	movs r0, #0
	strb r0, [r5]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08006CBC
	movs r0, #2
	strb r0, [r3, #3]
	movs r0, #0xfe
	b _08006CBE
	.align 2, 0
_08006CB4: .4byte gSamusData
_08006CB8: .4byte 0x082CB2B8
_08006CBC:
	movs r0, #0xff
_08006CBE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SamusLandingGFX
SamusLandingGFX: @ 0x08006CC4
	push {r4, lr}
	ldr r0, _08006D10 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08006D14 @ =0x082C43B8
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08006D24
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08006D24
	ldr r1, _08006D18 @ =gPoseLock
	ldrb r0, [r1]
	cmp r0, #0
	beq _08006D20
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08006D1C @ =gPreventMovementTimer
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x39
	b _08006D26
	.align 2, 0
_08006D10: .4byte gSamusData
_08006D14: .4byte 0x082C43B8
_08006D18: .4byte gPoseLock
_08006D1C: .4byte gPreventMovementTimer
_08006D20:
	movs r0, #0
	b _08006D26
_08006D24:
	movs r0, #0xff
_08006D26:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusCrouching
SamusCrouching: @ 0x08006D2C
	push {r4, r5, r6, lr}
	ldr r0, _08006D64 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08006D74
	ldr r0, _08006D68 @ =0x030012D8
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08006D74
	ldr r0, _08006D6C @ =0x0828FCCC
	ldrh r1, [r0, #0xa]
	subs r1, #0x20
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #0
	bne _08006D74
	ldr r1, _08006D70 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	movs r0, #0x23
	b _08006F64
	.align 2, 0
_08006D64: .4byte gChangedInput
_08006D68: .4byte 0x030012D8
_08006D6C: .4byte 0x0828FCCC
_08006D70: .4byte gSamusData
_08006D74:
	movs r5, #0
	ldr r6, _08006D8C @ =0x0828FCCC
	ldrh r1, [r6, #4]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #0
	bne _08006D90
	movs r5, #4
	b _08006DBA
	.align 2, 0
_08006D8C: .4byte 0x0828FCCC
_08006D90:
	cmp r0, #1
	bne _08006DA8
	ldr r1, _08006DA4 @ =gSamusData
	ldrh r0, [r6]
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #1
	b _08006DBA
	.align 2, 0
_08006DA4: .4byte gSamusData
_08006DA8:
	cmp r0, #8
	bne _08006DBA
	ldr r1, _08006DE0 @ =gSamusData
	ldrh r0, [r6, #2]
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #2
_08006DBA:
	bl SamusSetForcedMovementForJumpingOrDropping
	cmp r0, #0
	beq _08006E14
	cmp r5, #0
	beq _08006E84
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08006DEC
	ldr r1, _08006DE0 @ =gSamusData
	ldr r0, _08006DE4 @ =0x0000FFC0
	ands r4, r0
	ldr r0, _08006DE8 @ =0x0828FCCC
	ldrh r0, [r0]
	subs r0, r4, r0
	adds r0, #0x40
	b _08006E02
	.align 2, 0
_08006DE0: .4byte gSamusData
_08006DE4: .4byte 0x0000FFC0
_08006DE8: .4byte 0x0828FCCC
_08006DEC:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _08006E04
	ldr r1, _08006E08 @ =gSamusData
	ldr r0, _08006E0C @ =0x0000FFC0
	ands r4, r0
	ldr r0, _08006E10 @ =0x0828FCCC
	ldrh r0, [r0, #2]
	subs r0, r4, r0
	subs r0, #1
_08006E02:
	strh r0, [r1, #0x16]
_08006E04:
	movs r0, #0xfe
	b _08006F64
	.align 2, 0
_08006E08: .4byte gSamusData
_08006E0C: .4byte 0x0000FFC0
_08006E10: .4byte 0x0828FCCC
_08006E14:
	cmp r5, #0
	beq _08006E84
	ldr r0, _08006E4C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08006E84
	ldr r0, _08006E50 @ =gSamusData
	ldrb r1, [r0, #0xd]
	adds r2, r0, #0
	cmp r1, #0
	beq _08006E34
	ldrb r0, [r2, #7]
	cmp r0, #2
	bne _08006E84
_08006E34:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08006E5C
	ldr r0, _08006E54 @ =0x0000FFC0
	ands r4, r0
	ldr r0, _08006E58 @ =0x0828FCCC
	ldrh r0, [r0]
	subs r0, r4, r0
	adds r0, #0x40
	b _08006E70
	.align 2, 0
_08006E4C: .4byte gChangedInput
_08006E50: .4byte gSamusData
_08006E54: .4byte 0x0000FFC0
_08006E58: .4byte 0x0828FCCC
_08006E5C:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _08006E72
	ldr r0, _08006E7C @ =0x0000FFC0
	ands r4, r0
	ldr r0, _08006E80 @ =0x0828FCCC
	ldrh r0, [r0, #2]
	subs r0, r4, r0
	subs r0, #1
_08006E70:
	strh r0, [r2, #0x16]
_08006E72:
	movs r0, #6
	strb r0, [r2, #0xf]
_08006E76:
	movs r0, #0
	b _08006F64
	.align 2, 0
_08006E7C: .4byte 0x0000FFC0
_08006E80: .4byte 0x0828FCCC
_08006E84:
	ldr r0, _08006EB4 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08006EC0
	ldr r0, _08006EB8 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08006EC0
	ldr r1, _08006EBC @ =gSamusData
	ldrb r0, [r1, #0xd]
	cmp r0, #0
	beq _08006EAA
	ldrb r0, [r1, #7]
	cmp r0, #3
	bne _08006EC0
_08006EAA:
	movs r0, #0x7f
	bl PlaySound
	movs r0, #0xc
	b _08006F64
	.align 2, 0
_08006EB4: .4byte gChangedInput
_08006EB8: .4byte gEquipment
_08006EBC: .4byte gSamusData
_08006EC0:
	bl SamusAimCannonStanding
	ldr r1, _08006EE4 @ =gSamusData
	ldrb r0, [r1, #7]
	cmp r0, #4
	bne _08006ED0
	movs r0, #1
	strb r0, [r1, #7]
_08006ED0:
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _08006EE8
	ldrb r0, [r1, #1]
	cmp r0, #9
	beq _08006EE8
	movs r0, #9
	b _08006F64
	.align 2, 0
_08006EE4: .4byte gSamusData
_08006EE8:
	ldr r1, _08006F00 @ =gButtonInput
	ldr r3, _08006F04 @ =gSamusData
	ldrh r2, [r3, #0x12]
	movs r0, #0x30
	eors r0, r2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08006F08
	movs r0, #8
	b _08006F64
	.align 2, 0
_08006F00: .4byte gButtonInput
_08006F04: .4byte gSamusData
_08006F08:
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08006F60
	cmp r5, #0
	beq _08006F62
	ldrh r0, [r3, #0x10]
	adds r1, r0, #1
	strh r1, [r3, #0x10]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bls _08006F62
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08006F40
	ldr r0, _08006F38 @ =0x0000FFC0
	ands r4, r0
	ldr r0, _08006F3C @ =0x0828FCCC
	ldrh r0, [r0]
	subs r0, r4, r0
	adds r0, #0x40
	b _08006F54
	.align 2, 0
_08006F38: .4byte 0x0000FFC0
_08006F3C: .4byte 0x0828FCCC
_08006F40:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _08006E76
	ldr r0, _08006F58 @ =0x0000FFC0
	ands r4, r0
	ldr r0, _08006F5C @ =0x0828FCCC
	ldrh r0, [r0, #2]
	subs r0, r4, r0
	subs r0, #1
_08006F54:
	strh r0, [r3, #0x16]
	b _08006E76
	.align 2, 0
_08006F58: .4byte 0x0000FFC0
_08006F5C: .4byte 0x0828FCCC
_08006F60:
	strh r0, [r3, #0x10]
_08006F62:
	movs r0, #0xff
_08006F64:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusTurningAroundAndCrouching
SamusTurningAroundAndCrouching: @ 0x08006F6C
	push {r4, r5, r6, lr}
	ldr r0, _08006FA4 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08006FB4
	ldr r0, _08006FA8 @ =0x030012D8
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08006FB4
	ldr r0, _08006FAC @ =0x0828FCCC
	ldrh r1, [r0, #0xa]
	subs r1, #0x20
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #0
	bne _08006FB4
	ldr r1, _08006FB0 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x20
	strh r0, [r1, #0x18]
	movs r0, #0x23
	b _080070D6
	.align 2, 0
_08006FA4: .4byte gChangedInput
_08006FA8: .4byte 0x030012D8
_08006FAC: .4byte 0x0828FCCC
_08006FB0: .4byte gSamusData
_08006FB4:
	movs r5, #0
	ldr r6, _08006FCC @ =0x0828FCCC
	ldrh r1, [r6, #4]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #0
	bne _08006FD0
	movs r5, #4
	b _08006FFE
	.align 2, 0
_08006FCC: .4byte 0x0828FCCC
_08006FD0:
	cmp r0, #1
	bne _08006FE8
	ldr r1, _08006FE4 @ =gSamusData
	ldrh r0, [r6]
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #1
	b _08006FFE
	.align 2, 0
_08006FE4: .4byte gSamusData
_08006FE8:
	cmp r0, #8
	bne _08006FFA
	ldr r1, _08007030 @ =gSamusData
	ldrh r0, [r6, #2]
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #2
_08006FFA:
	cmp r5, #0
	beq _0800705A
_08006FFE:
	ldr r0, _08007034 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800705A
	ldr r0, _08007030 @ =gSamusData
	ldrb r1, [r0, #0xd]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800701A
	ldrb r0, [r2, #7]
	cmp r0, #2
	bne _0800705A
_0800701A:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _08007040
	ldr r0, _08007038 @ =0x0000FFC0
	ands r0, r4
	ldr r1, _0800703C @ =0x0828FCCC
	ldrh r1, [r1]
	subs r0, r0, r1
	adds r0, #0x40
	b _08007054
	.align 2, 0
_08007030: .4byte gSamusData
_08007034: .4byte gChangedInput
_08007038: .4byte 0x0000FFC0
_0800703C: .4byte 0x0828FCCC
_08007040:
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08007056
	ldr r0, _08007080 @ =0x0000FFC0
	ands r0, r4
	ldr r1, _08007084 @ =0x0828FCCC
	ldrh r1, [r1, #2]
	subs r0, r0, r1
	subs r0, #1
_08007054:
	strh r0, [r2, #0x16]
_08007056:
	movs r0, #1
	strb r0, [r2, #1]
_0800705A:
	bl SamusSetForcedMovementForJumpingOrDropping
	cmp r0, #0
	beq _080070B4
	cmp r5, #0
	beq _080070B4
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _0800708C
	ldr r1, _08007088 @ =gSamusData
	ldr r0, _08007080 @ =0x0000FFC0
	ands r4, r0
	ldr r0, _08007084 @ =0x0828FCCC
	ldrh r0, [r0]
	subs r0, r4, r0
	adds r0, #0x40
	b _080070A2
	.align 2, 0
_08007080: .4byte 0x0000FFC0
_08007084: .4byte 0x0828FCCC
_08007088: .4byte gSamusData
_0800708C:
	movs r0, #2
	ands r5, r0
	cmp r5, #0
	beq _080070A4
	ldr r1, _080070A8 @ =gSamusData
	ldr r0, _080070AC @ =0x0000FFC0
	ands r4, r0
	ldr r0, _080070B0 @ =0x0828FCCC
	ldrh r0, [r0, #2]
	subs r0, r4, r0
	subs r0, #1
_080070A2:
	strh r0, [r1, #0x16]
_080070A4:
	movs r0, #0xfe
	b _080070D6
	.align 2, 0
_080070A8: .4byte gSamusData
_080070AC: .4byte 0x0000FFC0
_080070B0: .4byte 0x0828FCCC
_080070B4:
	ldr r1, _080070CC @ =gSamusData
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _080070D4
	ldrb r0, [r1, #1]
	cmp r0, #1
	bne _080070D0
	movs r0, #2
	b _080070D6
	.align 2, 0
_080070CC: .4byte gSamusData
_080070D0:
	movs r0, #9
	b _080070D6
_080070D4:
	movs r0, #0xff
_080070D6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SamusTurningAroundAndCrouchingGFX
SamusTurningAroundAndCrouchingGFX: @ 0x080070DC
	push {r4, lr}
	ldr r0, _08007114 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08007118 @ =0x082CB138
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _0800711C
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _0800711C
	movs r0, #7
	b _0800711E
	.align 2, 0
_08007114: .4byte gSamusData
_08007118: .4byte 0x082CB138
_0800711C:
	movs r0, #0xff
_0800711E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusShootingAndCrouchingGFX
SamusShootingAndCrouchingGFX: @ 0x08007124
	push {r4, lr}
	ldr r0, _0800715C @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08007160 @ =0x082BDB08
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08007164
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007164
	movs r0, #7
	b _08007166
	.align 2, 0
_0800715C: .4byte gSamusData
_08007160: .4byte 0x082BDB08
_08007164:
	movs r0, #0xff
_08007166:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusStartingASpinJumpGFX
SamusStartingASpinJumpGFX: @ 0x0800716C
	push {r4, r5, lr}
	ldr r2, _080071B0 @ =gSamusData
	movs r0, #0x21
	adds r0, r0, r2
	mov ip, r0
	ldr r4, _080071B4 @ =0x082C4928
	adds r3, r2, #0
	adds r3, #0x22
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	mov r5, ip
	ldrb r1, [r5]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _080071A8
	movs r0, #0
	strb r0, [r5]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	cmp r1, #0
	bne _080071A8
	movs r0, #0xb
	strb r0, [r2, #1]
	strb r1, [r3]
_080071A8:
	movs r0, #0xff
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080071B0: .4byte gSamusData
_080071B4: .4byte 0x082C4928

	thumb_func_start SamusSpinning
SamusSpinning: @ 0x080071B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _080071D4 @ =gSamusData
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _080071D8
	movs r0, #0
	strb r0, [r3, #3]
	movs r0, #0xfe
	b _08007360
	.align 2, 0
_080071D4: .4byte gSamusData
_080071D8:
	ldr r0, _080071F4 @ =gButtonInput
	ldrh r2, [r0]
	movs r1, #0x30
	ands r1, r2
	cmp r1, #0
	bne _080071F8
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	beq _080071F8
	strb r1, [r3, #3]
	movs r0, #0xfe
	b _08007360
	.align 2, 0
_080071F4: .4byte gButtonInput
_080071F8:
	bl SamusAimCannonMidAir
	ldr r1, _08007240 @ =0x03001330
	ldrh r4, [r1, #6]
	ldr r0, _08007244 @ =gEquipment
	ldrb r2, [r0, #0xc]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08007258
	ldrb r0, [r1]
	cmp r0, #0
	bne _08007258
	ldr r0, _08007248 @ =gChangedInput
	ldrh r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	ldr r1, _0800724C @ =gSamusData
	mov r8, r1
	cmp r0, #0
	beq _080072BE
	movs r5, #0x1c
	ldrsh r1, [r1, r5]
	movs r0, #0x4e
	rsbs r0, r0, #0
	cmp r1, r0
	bgt _080072BE
	adds r0, r3, #0
	ands r0, r2
	cmp r0, #0
	beq _08007250
	movs r0, #0xdc
	mov r1, r8
	strh r0, [r1, #0x1c]
	b _0800735E
	.align 2, 0
_08007240: .4byte 0x03001330
_08007244: .4byte gEquipment
_08007248: .4byte gChangedInput
_0800724C: .4byte gSamusData
_08007250:
	movs r0, #0xaa
	mov r2, r8
	strh r0, [r2, #0x1c]
	b _0800735E
_08007258:
	ldr r0, _080072AC @ =gSamusData
	ldrb r1, [r0, #4]
	mov r8, r0
	cmp r1, #0
	beq _080072BE
	subs r0, r1, #1
	mov r3, r8
	strb r0, [r3, #4]
	ldrh r0, [r3, #0x12]
	ldrh r2, [r3, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _080072BE
	ldr r0, _080072B0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080072B8
	movs r0, #0x10
	ands r0, r2
	movs r7, #0x28
	cmp r0, #0
	beq _0800728A
	ldr r7, _080072B4 @ =0x0000FFD8
_0800728A:
	mov r5, r8
	ldrh r0, [r5, #0x18]
	ldrh r1, [r5, #0x16]
	adds r1, r1, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r0
	cmp r1, #0
	beq _080072B8
	ldrh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	movs r0, #0x15
	b _08007360
	.align 2, 0
_080072AC: .4byte gSamusData
_080072B0: .4byte gChangedInput
_080072B4: .4byte 0x0000FFD8
_080072B8:
	movs r4, #1
	ldr r0, _0800732C @ =gSamusData
	mov r8, r0
_080072BE:
	ldr r2, _08007330 @ =gButtonInput
	mov r6, r8
	ldrh r1, [r6, #0x12]
	movs r0, #0x30
	adds r3, r1, #0
	eors r3, r0
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08007338
	movs r0, #0
	strh r3, [r6, #0x12]
	strh r0, [r6, #0x1a]
	ldrh r1, [r6, #0x10]
	ands r3, r1
	cmp r3, #0
	beq _08007346
	movs r0, #0x10
	ands r0, r1
	movs r7, #0x20
	cmp r0, #0
	beq _080072EE
	ldr r7, _08007334 @ =0x0000FFE0
_080072EE:
	ldrh r0, [r6, #0x18]
	ldrh r1, [r6, #0x16]
	adds r1, r1, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	adds r5, r0, #0
	movs r4, #0x80
	lsls r4, r4, #0x11
	ands r5, r4
	ldrh r0, [r6, #0x18]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r6, #0x16]
	adds r1, r1, r7
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	ands r0, r4
	cmp r5, #0
	bne _08007322
	cmp r0, #0
	beq _08007346
_08007322:
	movs r0, #0xa
	mov r1, r8
	strb r0, [r1, #4]
	b _08007346
	.align 2, 0
_0800732C: .4byte gSamusData
_08007330: .4byte gButtonInput
_08007334: .4byte 0x0000FFE0
_08007338:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldr r1, _0800736C @ =0x03001330
	movs r2, #8
	ldrsh r1, [r1, r2]
	bl SamusApplyXAcceleration
_08007346:
	ldr r0, _08007370 @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0800735E
	ldr r2, _08007374 @ =gSamusData
	movs r3, #0x1c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0800735E
	strh r1, [r2, #0x1c]
_0800735E:
	movs r0, #0xff
_08007360:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800736C: .4byte 0x03001330
_08007370: .4byte gButtonInput
_08007374: .4byte gSamusData

	thumb_func_start SamusSpinningGFX
SamusSpinningGFX: @ 0x08007378
	push {r4, r5, lr}
	ldr r4, _080073DC @ =0x082C4878
	ldr r2, _080073E0 @ =gSamusData
	movs r0, #0x22
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r3, [r0, #0xc]
	ldr r0, _080073E4 @ =0x03001330
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _0800739A
	lsls r0, r3, #0x19
	lsrs r3, r0, #0x18
_0800739A:
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, r3
	blo _080073BE
	movs r0, #0
	strb r0, [r1]
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080073BE
	strb r0, [r1]
_080073BE:
	ldr r0, [r2, #0x20]
	ldr r1, _080073E8 @ =0x00FFFF00
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bne _080073F2
	ldrb r0, [r5]
	cmp r0, #1
	bne _080073EC
	movs r0, #0x94
	bl PlaySound
	b _080073F2
	.align 2, 0
_080073DC: .4byte 0x082C4878
_080073E0: .4byte gSamusData
_080073E4: .4byte 0x03001330
_080073E8: .4byte 0x00FFFF00
_080073EC:
	movs r0, #0x6e
	bl PlaySound
_080073F2:
	movs r0, #0xff
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusMorphing
SamusMorphing: @ 0x080073FC
	push {lr}
	ldr r0, _08007418 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08007410
	ldr r1, _0800741C @ =gSamusData
	movs r0, #0xf
	strb r0, [r1, #1]
_08007410:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_08007418: .4byte gChangedInput
_0800741C: .4byte gSamusData

	thumb_func_start SamusMorphingGFX
SamusMorphingGFX: @ 0x08007420
	push {r4, lr}
	ldr r0, _08007458 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _0800745C @ =0x082CB558
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08007460
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007460
	movs r0, #0xd
	b _08007462
	.align 2, 0
_08007458: .4byte gSamusData
_0800745C: .4byte 0x082CB558
_08007460:
	movs r0, #0xff
_08007462:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusMorphBall
SamusMorphBall: @ 0x08007468
	push {r4, lr}
	ldr r4, _0800747C @ =gSamusData
	ldrb r0, [r4, #3]
	adds r1, r0, #0
	cmp r1, #0x15
	bls _08007480
	movs r0, #1
	strb r0, [r4, #3]
_08007478:
	movs r0, #0xfe
	b _08007550
	.align 2, 0
_0800747C: .4byte gSamusData
_08007480:
	cmp r1, #0x13
	bls _0800748A
	adds r0, #1
	strb r0, [r4, #3]
	b _0800754E
_0800748A:
	bl SamusSetForcedMovementForJumpingOrDropping
	cmp r0, #0
	beq _080074A4
	ldrb r1, [r4, #3]
	cmp r1, #1
	bne _08007478
	ldr r0, _080074B8 @ =gEquipment
	ldrb r0, [r0, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _08007478
	strb r0, [r4, #3]
_080074A4:
	ldr r0, _080074BC @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	beq _080074C4
	ldr r0, _080074C0 @ =gSamusData
	strh r1, [r0, #0x12]
	movs r0, #0xe
	b _08007550
	.align 2, 0
_080074B8: .4byte gEquipment
_080074BC: .4byte gButtonInput
_080074C0: .4byte gSamusData
_080074C4:
	ldr r0, _080074F8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800754E
	ldr r4, _080074FC @ =0x0828FCCC
	ldrh r1, [r4, #4]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #1
	bne _08007508
	ldr r2, _08007500 @ =gSamusData
	ldrh r1, [r4]
	ldrh r3, [r2, #0x16]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08007504 @ =0x0000FFC0
	ands r3, r0
	subs r1, r3, r1
	adds r1, #0x40
	strh r1, [r2, #0x16]
	b _08007528
	.align 2, 0
_080074F8: .4byte gChangedInput
_080074FC: .4byte 0x0828FCCC
_08007500: .4byte gSamusData
_08007504: .4byte 0x0000FFC0
_08007508:
	cmp r0, #8
	bne _08007524
	ldr r2, _08007538 @ =gSamusData
	ldrh r1, [r4, #2]
	ldrh r3, [r2, #0x16]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0800753C @ =0x0000FFC0
	ands r3, r0
	subs r1, r3, r1
	subs r1, #1
	strh r1, [r2, #0x16]
	movs r0, #0
_08007524:
	cmp r0, #0
	bne _0800754E
_08007528:
	ldr r0, _08007540 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _08007544
	movs r0, #0x95
	bl PlaySound
	b _0800754A
	.align 2, 0
_08007538: .4byte gSamusData
_0800753C: .4byte 0x0000FFC0
_08007540: .4byte 0x03001330
_08007544:
	movs r0, #0x80
	bl PlaySound
_0800754A:
	movs r0, #0xf
	b _08007550
_0800754E:
	movs r0, #0xff
_08007550:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusMorphBallGFX
SamusMorphBallGFX: @ 0x08007558
	push {r4, lr}
	ldr r0, _08007594 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08007598 @ =0x082CB598
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _0800758C
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _0800758C
	strb r0, [r2]
_0800758C:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007594: .4byte gSamusData
_08007598: .4byte 0x082CB598

	thumb_func_start SamusRolling
SamusRolling: @ 0x0800759C
	push {lr}
	ldr r0, _080075C4 @ =gChangedInput
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080075D0
	ldr r0, _080075C8 @ =gEquipment
	ldrb r1, [r0, #0xc]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080075D0
	ldr r1, _080075CC @ =gSamusData
	movs r0, #1
	strb r0, [r1, #3]
	movs r0, #0xfe
	b _08007652
	.align 2, 0
_080075C4: .4byte gChangedInput
_080075C8: .4byte gEquipment
_080075CC: .4byte gSamusData
_080075D0:
	ldr r0, _080075FC @ =0x0828FCCC
	ldrh r1, [r0, #4]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #0
	bne _08007612
	ldr r0, _08007600 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08007612
	ldr r0, _08007604 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _08007608
	movs r0, #0x95
	bl PlaySound
	b _0800760E
	.align 2, 0
_080075FC: .4byte 0x0828FCCC
_08007600: .4byte gChangedInput
_08007604: .4byte 0x03001330
_08007608:
	movs r0, #0x80
	bl PlaySound
_0800760E:
	movs r0, #0xf
	b _08007652
_08007612:
	ldr r0, _08007634 @ =gButtonInput
	ldr r3, _08007638 @ =gSamusData
	ldrh r2, [r0]
	ldrh r1, [r3, #0x12]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08007640
	ldr r1, _0800763C @ =0x03001330
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	movs r2, #0xe
	ldrsh r1, [r1, r2]
	bl SamusApplyXAcceleration
	movs r0, #0xff
	b _08007652
	.align 2, 0
_08007634: .4byte gButtonInput
_08007638: .4byte gSamusData
_0800763C: .4byte 0x03001330
_08007640:
	movs r0, #0x30
	eors r0, r1
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08007650
	movs r0, #1
	strb r0, [r3, #2]
_08007650:
	movs r0, #0xd
_08007652:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusUnmorphing
SamusUnmorphing: @ 0x08007658
	push {lr}
	ldr r0, _08007670 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08007678
	ldr r1, _08007674 @ =gSamusData
	movs r0, #1
	strb r0, [r1, #3]
	movs r0, #0xfe
	b _08007688
	.align 2, 0
_08007670: .4byte gChangedInput
_08007674: .4byte gSamusData
_08007678:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08007686
	ldr r1, _0800768C @ =gSamusData
	movs r0, #0xc
	strb r0, [r1, #1]
_08007686:
	movs r0, #0xff
_08007688:
	pop {r1}
	bx r1
	.align 2, 0
_0800768C: .4byte gSamusData

	thumb_func_start SamusUnmorphingGFX
SamusUnmorphingGFX: @ 0x08007690
	push {r4, lr}
	ldr r0, _080076C8 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _080076CC @ =0x082CB628
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _080076D0
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080076D0
	movs r0, #7
	b _080076D2
	.align 2, 0
_080076C8: .4byte gSamusData
_080076CC: .4byte 0x082CB628
_080076D0:
	movs r0, #0xff
_080076D2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusMorphBallMidAir
SamusMorphBallMidAir: @ 0x080076D8
	push {r4, r5, lr}
	ldr r0, _08007708 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800771E
	ldr r0, _0800770C @ =0x0828FCCC
	ldrh r1, [r0, #0xa]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #0
	bne _0800771E
	ldr r0, _08007710 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _08007714
	movs r0, #0x95
	bl PlaySound
	b _0800771A
	.align 2, 0
_08007708: .4byte gChangedInput
_0800770C: .4byte 0x0828FCCC
_08007710: .4byte 0x03001330
_08007714:
	movs r0, #0x80
	bl PlaySound
_0800771A:
	movs r0, #4
	b _080077A0
_0800771E:
	ldr r0, _08007740 @ =gSamusData
	ldrb r1, [r0, #3]
	adds r4, r0, #0
	cmp r1, #0
	bne _08007748
	ldr r0, _08007744 @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08007754
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	ble _08007754
	strh r1, [r4, #0x1c]
	b _08007754
	.align 2, 0
_08007740: .4byte gSamusData
_08007744: .4byte gButtonInput
_08007748:
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #6
	bgt _08007754
	movs r0, #0
	strb r0, [r4, #3]
_08007754:
	movs r2, #0x1c
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _08007764
	movs r1, #0x1a
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08007774
_08007764:
	ldr r0, _08007784 @ =gButtonInput
	adds r5, r4, #0
	ldrh r2, [r0]
	ldrh r1, [r5, #0x12]
	adds r3, r2, #0
	ands r3, r1
	cmp r3, #0
	beq _0800778C
_08007774:
	ldr r1, _08007788 @ =0x03001330
	movs r2, #6
	ldrsh r0, [r1, r2]
	movs r2, #0xa
	ldrsh r1, [r1, r2]
	bl SamusApplyXAcceleration
	b _0800779E
	.align 2, 0
_08007784: .4byte gButtonInput
_08007788: .4byte 0x03001330
_0800778C:
	movs r0, #0x30
	eors r1, r0
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800779C
	strh r1, [r5, #0x12]
_0800779C:
	strh r3, [r4, #0x1a]
_0800779E:
	movs r0, #0xff
_080077A0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusGettingHurtGFX
SamusGettingHurtGFX: @ 0x080077A8
	push {r4, lr}
	ldr r4, _080077DC @ =gSamusData
	ldrb r0, [r4, #0xf]
	cmp r0, #0xc
	bls _080077E8
	ldr r0, _080077E0 @ =0x0828FCCC
	ldrh r1, [r0, #0xa]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	adds r2, r0, #0
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080077EC
	cmp r2, #0
	bne _080077EC
	ldrb r0, [r4, #1]
	cmp r0, #0x11
	bne _080077E4
	movs r0, #4
	b _080077EE
	.align 2, 0
_080077DC: .4byte gSamusData
_080077E0: .4byte 0x0828FCCC
_080077E4:
	movs r0, #0x10
	b _080077EE
_080077E8:
	adds r0, #1
	strb r0, [r4, #0xf]
_080077EC:
	movs r0, #0xff
_080077EE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusGettingKnockedBackGFX
SamusGettingKnockedBackGFX: @ 0x080077F4
	push {r4, lr}
	ldr r4, _08007828 @ =gSamusData
	ldrb r0, [r4, #0xf]
	cmp r0, #0xc
	bls _08007834
	ldr r0, _0800782C @ =0x0828FCCC
	ldrh r1, [r0, #0xa]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	adds r2, r0, #0
	movs r0, #0x1c
	ldrsh r1, [r4, r0]
	movs r0, #0x14
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08007838
	cmp r2, #0
	bne _08007838
	ldrb r0, [r4, #1]
	cmp r0, #0x13
	bne _08007830
	movs r0, #4
	b _0800783A
	.align 2, 0
_08007828: .4byte gSamusData
_0800782C: .4byte 0x0828FCCC
_08007830:
	movs r0, #0x10
	b _0800783A
_08007834:
	adds r0, #1
	strb r0, [r4, #0xf]
_08007838:
	movs r0, #0xff
_0800783A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusStartingWallJumpGFX
SamusStartingWallJumpGFX: @ 0x08007840
	push {r4, lr}
	ldr r0, _08007878 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _0800787C @ =0x082D652C
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08007880
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007880
	movs r0, #0xfe
	b _08007882
	.align 2, 0
_08007878: .4byte gSamusData
_0800787C: .4byte 0x082D652C
_08007880:
	movs r0, #0xff
_08007882:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusWallJumping
SamusWallJumping: @ 0x08007888
	push {lr}
	ldr r2, _080078B4 @ =gSamusData
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080078BC
	ldr r3, _080078B8 @ =0x03001330
	movs r0, #0x1a
	ldrsh r1, [r2, r0]
	movs r2, #8
	ldrsh r0, [r3, r2]
	cmp r1, r0
	bge _080078D2
	movs r1, #6
	ldrsh r0, [r3, r1]
	movs r2, #8
	ldrsh r1, [r3, r2]
	bl SamusApplyXAcceleration
	b _080078D2
	.align 2, 0
_080078B4: .4byte gSamusData
_080078B8: .4byte 0x03001330
_080078BC:
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	ldr r2, _080078E8 @ =0x03001330
	movs r3, #8
	ldrsh r1, [r2, r3]
	cmn r0, r1
	ble _080078D2
	movs r3, #6
	ldrsh r0, [r2, r3]
	bl SamusApplyXAcceleration
_080078D2:
	ldr r3, _080078EC @ =gSamusData
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _080078F0
	movs r0, #0
	strb r0, [r3, #3]
	movs r0, #0xfe
	b _0800796C
	.align 2, 0
_080078E8: .4byte 0x03001330
_080078EC: .4byte gSamusData
_080078F0:
	movs r1, #0x1c
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bgt _08007918
	ldr r0, _08007914 @ =gButtonInput
	ldrh r2, [r0]
	movs r1, #0x30
	ands r1, r2
	cmp r1, #0
	bne _08007918
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	beq _08007918
	strb r1, [r3, #3]
	movs r0, #0xfe
	b _0800796C
	.align 2, 0
_08007914: .4byte gButtonInput
_08007918:
	bl SamusAimCannonMidAir
	ldr r0, _08007944 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800792A
	ldr r1, _08007948 @ =gSamusData
	movs r0, #0xb
	strb r0, [r1, #1]
_0800792A:
	ldr r0, _0800794C @ =gButtonInput
	ldrh r3, [r0]
	movs r1, #1
	ands r1, r3
	cmp r1, #0
	bne _08007950
	ldr r2, _08007948 @ =gSamusData
	movs r3, #0x1c
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _08007966
	strh r1, [r2, #0x1c]
	b _08007966
	.align 2, 0
_08007944: .4byte 0x03001330
_08007948: .4byte gSamusData
_0800794C: .4byte gButtonInput
_08007950:
	ldr r2, _08007970 @ =gSamusData
	movs r1, #0x1c
	ldrsh r0, [r2, r1]
	cmp r0, #0
	bgt _0800796A
	ldrh r0, [r2, #0x12]
	movs r1, #0x30
	eors r0, r1
	ands r0, r3
	cmp r0, #0
	beq _0800796A
_08007966:
	movs r0, #0xb
	strb r0, [r2, #1]
_0800796A:
	movs r0, #0xff
_0800796C:
	pop {r1}
	bx r1
	.align 2, 0
_08007970: .4byte gSamusData

	thumb_func_start SamusUsingAnElevator
SamusUsingAnElevator: @ 0x08007974
	push {r4, r5, lr}
	ldr r2, _080079D4 @ =gSamusData
	ldrh r1, [r2, #0x14]
	movs r0, #0x40
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _080079DC
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	ble _080079DC
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	asrs r5, r0, #0x10
	ldrh r0, [r4, #0x18]
	subs r0, #0xa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	asrs r0, r0, #0x10
	cmp r5, #1
	bne _08007A24
	cmp r0, #1
	beq _08007A24
	ldrh r1, [r4, #0x18]
	ldr r0, _080079D8 @ =0x0000FFC0
	ands r0, r1
	subs r0, #1
	movs r1, #0
	movs r2, #0
	strh r0, [r4, #0x18]
	adds r3, r4, #0
	adds r3, #0x22
	movs r0, #4
	strb r0, [r3]
	adds r0, r4, #0
	adds r0, #0x21
	strb r1, [r0]
	strh r2, [r4, #0x1c]
	movs r0, #0xfc
	bl StopSound
	b _08007A24
	.align 2, 0
_080079D4: .4byte gSamusData
_080079D8: .4byte 0x0000FFC0
_080079DC:
	ldrh r1, [r4, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08007A24
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08007A24
	ldrh r0, [r4, #0x18]
	adds r0, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	asrs r5, r0, #0x10
	cmp r5, #2
	bne _08007A24
	ldrh r1, [r4, #0x18]
	movs r0, #0x3f
	orrs r0, r1
	movs r1, #0
	movs r2, #0
	strh r0, [r4, #0x18]
	adds r3, r4, #0
	adds r3, #0x22
	movs r0, #4
	strb r0, [r3]
	adds r0, r4, #0
	adds r0, #0x21
	strb r1, [r0]
	strh r2, [r4, #0x1c]
	movs r0, #0xfc
	bl StopSound
_08007A24:
	movs r0, #0xff
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SamusUsingAnElevatorGFX
SamusUsingAnElevatorGFX: @ 0x08007A2C
	push {r4, lr}
	ldr r2, _08007A9C @ =0x030012D8
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	ldr r3, _08007AA0 @ =0x0828BF98
	ldrb r1, [r2, #2]
	lsls r1, r1, #3
	adds r1, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _08007A60
	movs r0, #0
	strb r0, [r2, #1]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08007A60
	strb r0, [r2, #2]
_08007A60:
	ldr r0, _08007AA4 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08007AA8 @ =0x082CBAC8
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08007AAE
	movs r0, #0
	strb r0, [r3]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _08007AAC
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007AAE
	movs r0, #0x39
	b _08007AB0
	.align 2, 0
_08007A9C: .4byte 0x030012D8
_08007AA0: .4byte 0x0828BF98
_08007AA4: .4byte gSamusData
_08007AA8: .4byte 0x082CBAC8
_08007AAC:
	strb r1, [r2]
_08007AAE:
	movs r0, #0xff
_08007AB0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusHangingOnLedge
SamusHangingOnLedge: @ 0x08007AB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08007AE0 @ =0x030000F4
	ldrb r0, [r0]
	cmp r0, #0x1d
	bls _08007ACC
	b _08007BD6
_08007ACC:
	ldr r2, _08007AE4 @ =gSamusData
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	mov sl, r2
	cmp r0, #0
	beq _08007AE8
	ldrh r0, [r2, #0x16]
	adds r0, #0x20
	b _08007AEE
	.align 2, 0
_08007AE0: .4byte 0x030000F4
_08007AE4: .4byte gSamusData
_08007AE8:
	mov r1, sl
	ldrh r0, [r1, #0x16]
	subs r0, #0x20
_08007AEE:
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov sb, sl
	mov r2, sb
	ldrh r0, [r2, #0x18]
	subs r0, #0xd0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r7, #0
	bl ProcessClipdataForSamus
	mov r8, r0
	movs r4, #0x80
	lsls r4, r4, #0x11
	ands r0, r4
	mov r8, r0
	mov r1, sb
	ldrh r0, [r1, #0x18]
	subs r0, #0x90
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	bl ProcessClipdataForSamus
	adds r6, r0, #0
	ands r6, r4
	mov r2, sb
	ldrh r0, [r2, #0x18]
	subs r0, #0x90
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r7, #0
	bl ProcessClipdataForSamus
	adds r5, r0, #0
	ands r5, r4
	ldr r0, _08007B64 @ =gChangedInput
	ldrh r1, [r0]
	movs r4, #0x40
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08007B6C
	cmp r6, #0
	bne _08007BD6
	cmp r5, #0
	bne _08007BD6
	ldr r0, _08007B68 @ =gEquipment
	ldrb r1, [r0, #0xc]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08007BC4
	mov r0, r8
	cmp r0, #0
	beq _08007BC4
	movs r0, #0x1c
	b _08007C04
	.align 2, 0
_08007B64: .4byte gChangedInput
_08007B68: .4byte gEquipment
_08007B6C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08007BE0
	ldr r0, _08007B9C @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08007BD6
	mov r2, sb
	ldrh r3, [r2, #0x12]
	movs r0, #0x30
	adds r2, r3, #0
	eors r2, r0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08007BA0
	mov r0, sb
	strh r2, [r0, #0x12]
	movs r0, #0x15
	b _08007C04
	.align 2, 0
_08007B9C: .4byte gButtonInput
_08007BA0:
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08007BCC
	cmp r6, #0
	bne _08007BD6
	cmp r5, #0
	bne _08007BD6
	ldr r0, _08007BC8 @ =gEquipment
	ldrb r1, [r0, #0xc]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08007BC4
	mov r1, r8
	cmp r1, #0
	bne _08007BCC
_08007BC4:
	movs r0, #0x19
	b _08007C04
	.align 2, 0
_08007BC8: .4byte gEquipment
_08007BCC:
	ldr r0, _08007BDC @ =gSamusData
	movs r1, #2
	strb r1, [r0, #3]
	movs r1, #0x80
	strh r1, [r0, #0x1c]
_08007BD6:
	movs r0, #0xfe
	b _08007C04
	.align 2, 0
_08007BDC: .4byte gSamusData
_08007BE0:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08007BD6
	mov r2, sl
	ldrh r0, [r2, #0x18]
	subs r0, #0x7c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r7, #0
	bl ClipdataUpdateCurrentAffecting
	asrs r0, r0, #0x10
	cmp r0, #3
	beq _08007C02
	movs r0, #0xff
	b _08007C04
_08007C02:
	movs r0, #0x26
_08007C04:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusHangingOnLedgeGFX
SamusHangingOnLedgeGFX: @ 0x08007C14
	push {r4, lr}
	ldr r4, _08007C5C @ =0x082D668C
	ldr r2, _08007C60 @ =gSamusData
	adds r3, r2, #0
	adds r3, #0x22
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	ldr r0, _08007C64 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _08007C32
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_08007C32:
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, r1
	blo _08007C54
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007C54
	movs r0, #3
	strb r0, [r3]
_08007C54:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007C5C: .4byte 0x082D668C
_08007C60: .4byte gSamusData
_08007C64: .4byte 0x03001330

	thumb_func_start SamusPullingYourselfUpFromHanging
SamusPullingYourselfUpFromHanging: @ 0x08007C68
	ldr r1, _08007C74 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0xc
	strh r0, [r1, #0x18]
	movs r0, #0xff
	bx lr
	.align 2, 0
_08007C74: .4byte gSamusData

	thumb_func_start SamusPullingYourselfUpFromHangingGFX
SamusPullingYourselfUpFromHangingGFX: @ 0x08007C78
	push {r4, r5, lr}
	ldr r0, _08007CC4 @ =gSamusData
	adds r4, r0, #0
	adds r4, #0x21
	ldr r5, _08007CC8 @ =0x082D670C
	movs r1, #0x22
	adds r1, r1, r0
	mov ip, r1
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, r1, r5
	ldrb r2, [r4]
	adds r3, r0, #0
	ldrb r1, [r1, #0xc]
	cmp r2, r1
	blo _08007D00
	movs r0, #0
	strb r0, [r4]
	mov r2, ip
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007D00
	ldrh r1, [r3, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08007CCC
	ldrh r0, [r3, #0x16]
	adds r0, #8
	strh r0, [r3, #0x16]
	movs r2, #0x20
	b _08007CD4
	.align 2, 0
_08007CC4: .4byte gSamusData
_08007CC8: .4byte 0x082D670C
_08007CCC:
	ldrh r0, [r3, #0x16]
	subs r0, #8
	strh r0, [r3, #0x16]
	ldr r2, _08007CF8 @ =0x0000FFE0
_08007CD4:
	ldrh r0, [r3, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r3, #0x16]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r0
	cmp r1, #0
	beq _08007CFC
	movs r0, #0x1b
	b _08007D02
	.align 2, 0
_08007CF8: .4byte 0x0000FFE0
_08007CFC:
	movs r0, #0x1a
	b _08007D02
_08007D00:
	movs r0, #0xff
_08007D02:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SamusPullingYourselfForwardFromHanging
SamusPullingYourselfForwardFromHanging: @ 0x08007D08
	push {lr}
	ldr r2, _08007D28 @ =gSamusData
	ldrh r0, [r2, #0x1e]
	movs r3, #4
	cmp r0, #0
	beq _08007D16
	movs r3, #2
_08007D16:
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08007D2C
	ldrh r0, [r2, #0x16]
	adds r0, r3, r0
	b _08007D30
	.align 2, 0
_08007D28: .4byte gSamusData
_08007D2C:
	ldrh r0, [r2, #0x16]
	subs r0, r0, r3
_08007D30:
	strh r0, [r2, #0x16]
	movs r0, #0xff
	pop {r1}
	bx r1

	thumb_func_start SamusPullingYourselfForwardFromHangingGFX
SamusPullingYourselfForwardFromHangingGFX: @ 0x08007D38
	push {r4, r5, lr}
	ldr r2, _08007D80 @ =gSamusData
	adds r4, r2, #0
	adds r4, #0x21
	ldr r5, _08007D84 @ =0x082D674C
	movs r0, #0x22
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	lsls r0, r3, #4
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08007D8C
	cmp r3, #0
	bne _08007D64
	ldrh r1, [r2, #0x18]
	ldr r0, _08007D88 @ =0x0000FFC0
	ands r0, r1
	subs r0, #1
	strh r0, [r2, #0x18]
_08007D64:
	movs r0, #0
	strb r0, [r4]
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r1]
	lsls r0, r0, #4
	adds r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007D8C
	movs r0, #0
	b _08007D8E
	.align 2, 0
_08007D80: .4byte gSamusData
_08007D84: .4byte 0x082D674C
_08007D88: .4byte 0x0000FFC0
_08007D8C:
	movs r0, #0xff
_08007D8E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SamusPullingYourselfIntoMorphballTunnel
SamusPullingYourselfIntoMorphballTunnel: @ 0x08007D94
	push {lr}
	ldr r2, _08007DA8 @ =gSamusData
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08007DAC
	ldrh r0, [r2, #0x16]
	adds r0, #8
	b _08007DB0
	.align 2, 0
_08007DA8: .4byte gSamusData
_08007DAC:
	ldrh r0, [r2, #0x16]
	subs r0, #8
_08007DB0:
	strh r0, [r2, #0x16]
	movs r0, #0xff
	pop {r1}
	bx r1

	thumb_func_start SamusPullingYourselfIntoMorphballTunnelGFX
SamusPullingYourselfIntoMorphballTunnelGFX: @ 0x08007DB8
	push {lr}
	ldr r2, _08007DD8 @ =gSamusData
	adds r3, r2, #0
	adds r3, #0x21
	ldr r0, _08007DDC @ =0x082D679C
	adds r1, r2, #0
	adds r1, #0x22
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, r1, r0
	ldrb r0, [r3]
	ldrb r1, [r1, #0xc]
	cmp r0, r1
	bhs _08007DE0
	movs r0, #0xff
	b _08007DF2
	.align 2, 0
_08007DD8: .4byte gSamusData
_08007DDC: .4byte 0x082D679C
_08007DE0:
	ldrh r1, [r2, #0x18]
	ldr r0, _08007DF8 @ =0x0000FFC0
	ands r0, r1
	subs r0, #1
	strh r0, [r2, #0x18]
	movs r0, #0x7f
	bl PlaySound
	movs r0, #0xd
_08007DF2:
	pop {r1}
	bx r1
	.align 2, 0
_08007DF8: .4byte 0x0000FFC0

	thumb_func_start SamusPullingYourselfDownToStartHanging_Unused
SamusPullingYourselfDownToStartHanging_Unused: @ 0x08007DFC
	push {lr}
	ldr r0, _08007E18 @ =gDisableScrolling
	movs r1, #1
	strb r1, [r0]
	ldr r1, _08007E1C @ =gSamusData
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0
	bne _08007E20
	ldrh r0, [r1, #0x18]
	subs r0, #0xc
	b _08007E24
	.align 2, 0
_08007E18: .4byte gDisableScrolling
_08007E1C: .4byte gSamusData
_08007E20:
	ldrh r0, [r1, #0x18]
	adds r0, #0xc
_08007E24:
	strh r0, [r1, #0x18]
	movs r0, #0xff
	pop {r1}
	bx r1

	thumb_func_start SamusPullingYourselfDownToStartHanging_UnusedGFX
SamusPullingYourselfDownToStartHanging_UnusedGFX: @ 0x08007E2C
	push {r4, lr}
	ldr r0, _08007E64 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08007E68 @ =0x082D6C2C
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08007E6C
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007E6C
	movs r0, #0x18
	b _08007E6E
	.align 2, 0
_08007E64: .4byte gSamusData
_08007E68: .4byte 0x082D6C2C
_08007E6C:
	movs r0, #0xff
_08007E6E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusSpaceJumpingGFX
SamusSpaceJumpingGFX: @ 0x08007E74
	push {r4, lr}
	ldr r1, _08007EB8 @ =0x082D8074
	ldr r2, _08007EBC @ =gSamusData
	adds r0, r2, #0
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r4, [r0, #0xc]
	ldr r0, _08007EC0 @ =0x03001330
	ldrb r3, [r0]
	cmp r3, #0
	beq _08007E92
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
_08007E92:
	ldr r0, [r2, #0x20]
	ldr r1, _08007EC4 @ =0x00FFFF00
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bne _08007EDC
	ldr r0, _08007EC8 @ =0x030012D8
	ldrb r1, [r0, #3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08007ED2
	cmp r3, #1
	bne _08007ECC
	movs r0, #0x94
	bl PlaySound
	b _08007ED2
	.align 2, 0
_08007EB8: .4byte 0x082D8074
_08007EBC: .4byte gSamusData
_08007EC0: .4byte 0x03001330
_08007EC4: .4byte 0x00FFFF00
_08007EC8: .4byte 0x030012D8
_08007ECC:
	movs r0, #0x6f
	bl PlaySound
_08007ED2:
	ldr r1, _08007F0C @ =0x030012D8
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	ldr r2, _08007F10 @ =gSamusData
_08007EDC:
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, r4
	blo _08007F02
	movs r0, #0
	strb r0, [r1]
	adds r2, #0x22
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _08007F14 @ =0x082D8074
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r1
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007F02
	strb r0, [r2]
_08007F02:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08007F0C: .4byte 0x030012D8
_08007F10: .4byte gSamusData
_08007F14: .4byte 0x082D8074

	thumb_func_start SamusScrewAttackingGFX
SamusScrewAttackingGFX: @ 0x08007F18
	push {r4, r5, r6, r7, lr}
	ldr r7, _08007FB4 @ =0x082D8214
	ldr r5, _08007FB8 @ =gSamusData
	adds r6, r5, #0
	adds r6, #0x22
	ldrb r0, [r6]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r4, [r0, #0xc]
	ldr r0, _08007FBC @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _08007F36
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
_08007F36:
	ldr r0, [r5, #0x20]
	ldr r1, _08007FC0 @ =0x00FFFF00
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	cmp r0, r1
	bne _08007F4A
	movs r0, #0x70
	bl PlaySound
_08007F4A:
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, r4
	blo _08007F6C
	movs r0, #0
	strb r0, [r1]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrb r0, [r6]
	lsls r0, r0, #4
	adds r0, r0, r7
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08007F6C
	strb r0, [r6]
_08007F6C:
	ldr r1, _08007FC4 @ =0x030012D8
	ldrb r0, [r1, #1]
	adds r2, r0, #1
	strb r2, [r1, #1]
	ldr r3, _08007FC8 @ =0x0828CB14
	ldrb r0, [r1, #2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r4, [r0, #4]
	ldr r0, _08007FBC @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _08007F8A
	lsls r0, r4, #0x19
	lsrs r4, r0, #0x18
_08007F8A:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r4
	blo _08007FAA
	movs r0, #0
	strb r0, [r1, #1]
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	ldrb r0, [r1, #2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08007FAA
	strb r0, [r1, #2]
_08007FAA:
	movs r0, #0xff
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08007FB4: .4byte 0x082D8214
_08007FB8: .4byte gSamusData
_08007FBC: .4byte 0x03001330
_08007FC0: .4byte 0x00FFFF00
_08007FC4: .4byte 0x030012D8
_08007FC8: .4byte 0x0828CB14

	thumb_func_start SamusSkidding
SamusSkidding: @ 0x08007FCC
	push {lr}
	ldr r0, _08007FE4 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08007FEC
	ldr r1, _08007FE8 @ =gSamusData
	movs r0, #1
	strb r0, [r1, #3]
	movs r0, #0xfe
	b _08008046
	.align 2, 0
_08007FE4: .4byte gChangedInput
_08007FE8: .4byte gSamusData
_08007FEC:
	ldr r0, _08008000 @ =gButtonInput
	ldr r2, _08008004 @ =gSamusData
	ldrh r1, [r0]
	ldrh r3, [r2, #0x12]
	adds r0, r1, #0
	ands r0, r3
	cmp r0, #0
	beq _08008008
	movs r0, #3
	b _08008046
	.align 2, 0
_08008000: .4byte gButtonInput
_08008004: .4byte gSamusData
_08008008:
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _08008020
	ldr r1, _0800801C @ =0x030012D8
	movs r0, #0xb4
	strb r0, [r1, #4]
	movs r0, #7
	b _08008046
	.align 2, 0
_0800801C: .4byte 0x030012D8
_08008020:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08008038
	ldrh r0, [r2, #0x1a]
	subs r0, #0xa
	strh r0, [r2, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08008044
_08008034:
	movs r0, #0
	b _08008046
_08008038:
	ldrh r0, [r2, #0x1a]
	adds r0, #0xa
	strh r0, [r2, #0x1a]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08008034
_08008044:
	movs r0, #0xff
_08008046:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusOnSavePadGFX
SamusOnSavePadGFX: @ 0x0800804C
	push {r4, lr}
	ldr r0, _0800808C @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08008090 @ =0x082CB6B8
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008082
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008082
	movs r0, #1
	strb r0, [r2]
_08008082:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800808C: .4byte gSamusData
_08008090: .4byte 0x082CB6B8

	thumb_func_start SamusTurningAroundToRechargeOrUnlockSecurityGFX
SamusTurningAroundToRechargeOrUnlockSecurityGFX: @ 0x08008094
	push {r4, lr}
	ldr r0, _080080CC @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _080080D0 @ =0x082CAFB8
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _080080D4
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080080D4
	movs r0, #0x21
	b _080080D6
	.align 2, 0
_080080CC: .4byte gSamusData
_080080D0: .4byte 0x082CAFB8
_080080D4:
	movs r0, #0xff
_080080D6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusDelayBeforeShinesparkingGFX
SamusDelayBeforeShinesparkingGFX: @ 0x080080DC
	push {r4, r5, lr}
	ldr r1, _08008130 @ =0x030012D8
	movs r0, #2
	strb r0, [r1, #4]
	ldr r3, _08008134 @ =gSamusData
	movs r0, #0x21
	adds r0, r0, r3
	mov ip, r0
	ldr r4, _08008138 @ =0x082C49C8
	adds r2, r3, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	mov r5, ip
	ldrb r1, [r5]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008140
	movs r0, #0
	strb r0, [r5]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008140
	ldr r2, _0800813C @ =gButtonInput
	ldrh r0, [r3, #0x12]
	movs r1, #0x30
	eors r0, r1
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0800812C
	movs r0, #1
	strb r0, [r3, #2]
_0800812C:
	movs r0, #0x24
	b _08008142
	.align 2, 0
_08008130: .4byte 0x030012D8
_08008134: .4byte gSamusData
_08008138: .4byte 0x082C49C8
_0800813C: .4byte gButtonInput
_08008140:
	movs r0, #0xff
_08008142:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SamusShinesparking
SamusShinesparking: @ 0x08008148
	push {lr}
	ldr r1, _08008168 @ =gSamusData
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0800816C
	movs r2, #0x1c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _08008192
	movs r0, #0x1e
	movs r1, #1
	bl ScreenShakeStartVertical
	movs r0, #0x25
	b _08008194
	.align 2, 0
_08008168: .4byte gSamusData
_0800816C:
	cmp r0, #1
	bne _08008176
	movs r2, #0x1a
	ldrsh r0, [r1, r2]
	b _08008182
_08008176:
	movs r2, #0x1a
	ldrsh r0, [r1, r2]
	cmp r0, #0
	beq _08008186
	movs r2, #0x1c
	ldrsh r0, [r1, r2]
_08008182:
	cmp r0, #0
	bne _08008192
_08008186:
	movs r0, #0x1e
	movs r1, #1
	bl ScreenShakeStartHorizontal
	movs r0, #0x25
	b _08008194
_08008192:
	movs r0, #0xff
_08008194:
	pop {r1}
	bx r1

	thumb_func_start SamusShinesparkingGFX
SamusShinesparkingGFX: @ 0x08008198
	push {r4, lr}
	ldr r0, _080081D8 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _080081DC @ =0x082C4A18
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _080081CE
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r1, [r2]
	lsls r0, r1, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080081CE
	subs r0, r1, #1
	strb r0, [r2]
_080081CE:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080081D8: .4byte gSamusData
_080081DC: .4byte 0x082C4A18

	thumb_func_start SamusDelayAfterShinesparkingGFX
SamusDelayAfterShinesparkingGFX: @ 0x080081E0
	push {r4, lr}
	ldr r0, _08008218 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _0800821C @ =0x082C4B48
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008220
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008220
	movs r0, #0xfe
	b _08008222
	.align 2, 0
_08008218: .4byte gSamusData
_0800821C: .4byte 0x082C4B48
_08008220:
	movs r0, #0xff
_08008222:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusHangingFromVerticalLadder
SamusHangingFromVerticalLadder: @ 0x08008228
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800826C @ =gSamusData
	ldrb r1, [r0, #0xf]
	adds r5, r0, #0
	cmp r1, #0x13
	bhi _0800823C
	adds r0, r1, #1
	strb r0, [r5, #0xf]
_0800823C:
	ldr r2, _08008270 @ =gChangedInput
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _08008286
	ldrb r0, [r5, #0xf]
	cmp r0, #0x13
	bls _08008286
	ldr r1, _08008274 @ =gButtonInput
	ldrh r4, [r5, #0x12]
	movs r0, #0x30
	adds r3, r4, #0
	eors r3, r0
	ldrh r1, [r1]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08008278
	strh r3, [r5, #0x12]
	movs r0, #0x15
	b _080083E8
	.align 2, 0
_0800826C: .4byte gSamusData
_08008270: .4byte gChangedInput
_08008274: .4byte gButtonInput
_08008278:
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08008286
	movs r0, #0xfe
	b _080083E8
_08008286:
	adds r4, r5, #0
	ldrh r2, [r4, #0x12]
	movs r0, #0x30
	adds r3, r2, #0
	eors r3, r0
	ldrh r1, [r6]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080082A8
	ldr r7, _080082B0 @ =gButtonInput
	ldr r0, _080082B4 @ =gButtonAssignments
	ldrh r1, [r7]
	ldrh r0, [r0, #2]
	ands r0, r1
	cmp r0, #0
	beq _080082B8
_080082A8:
	strh r3, [r4, #0x12]
	movs r0, #0x27
	b _080083E8
	.align 2, 0
_080082B0: .4byte gButtonInput
_080082B4: .4byte gButtonAssignments
_080082B8:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _080082D8
	strh r3, [r4, #0x12]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080082D0
	movs r0, #5
	b _080082D2
_080082D0:
	movs r0, #4
_080082D2:
	strb r0, [r4, #7]
	movs r0, #0x29
	b _080083E8
_080082D8:
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x1c]
	movs r0, #0x10
	ands r0, r2
	ldr r6, _08008338 @ =0x0000FFE0
	cmp r0, #0
	beq _080082EA
	movs r6, #0x20
_080082EA:
	ldrh r0, [r4, #0x18]
	subs r0, #0x7d
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	adds r1, r1, r6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ClipdataUpdateCurrentAffecting
	asrs r2, r0, #0x10
	ldrh r1, [r7]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08008390
	cmp r2, #3
	bne _08008354
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0
	bne _08008346
	adds r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x21
	mov r1, r8
	strb r1, [r0]
	ldr r0, _0800833C @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _08008340
	movs r0, #0x95
	bl PlaySound
	b _08008346
	.align 2, 0
_08008338: .4byte 0x0000FFE0
_0800833C: .4byte 0x03001330
_08008340:
	movs r0, #0x86
	bl PlaySound
_08008346:
	ldr r0, _08008350 @ =gSamusData
	movs r1, #0x40
	strh r1, [r0, #0x14]
	movs r1, #4
	b _080083D2
	.align 2, 0
_08008350: .4byte gSamusData
_08008354:
	cmp r2, #4
	beq _080083D4
	ldr r0, _08008388 @ =gEquipment
	ldrb r1, [r0, #0xc]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _0800838C
	ldrh r0, [r4, #0x18]
	subs r0, #0xd0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	adds r1, r1, r6
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r0
	cmp r1, #0
	beq _0800838C
	movs r0, #0x1c
	b _080083E8
	.align 2, 0
_08008388: .4byte gEquipment
_0800838C:
	movs r0, #0x19
	b _080083E8
_08008390:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080083D4
	adds r1, r5, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0
	bne _080083CA
	movs r0, #6
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x21
	mov r1, r8
	strb r1, [r0]
	ldr r0, _080083C0 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _080083C4
	movs r0, #0x95
	bl PlaySound
	b _080083CA
	.align 2, 0
_080083C0: .4byte 0x03001330
_080083C4:
	movs r0, #0x86
	bl PlaySound
_080083CA:
	ldr r0, _080083F4 @ =gSamusData
	movs r1, #0x80
	strh r1, [r0, #0x14]
	ldr r1, _080083F8 @ =0x0000FFFC
_080083D2:
	strh r1, [r0, #0x1c]
_080083D4:
	ldr r0, _080083FC @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _080083E6
	ldr r1, _080083F4 @ =gSamusData
	ldrh r0, [r1, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r1, #0x1c]
_080083E6:
	movs r0, #0xff
_080083E8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080083F4: .4byte gSamusData
_080083F8: .4byte 0x0000FFFC
_080083FC: .4byte 0x03001330

	thumb_func_start SamusHangingFromVerticalLadderGFX
SamusHangingFromVerticalLadderGFX: @ 0x08008400
	push {r4, r5, r6, lr}
	ldr r0, _08008454 @ =gSamusData
	adds r4, r0, #0
	adds r4, #0x22
	ldrb r2, [r4]
	adds r3, r0, #0
	cmp r2, #0
	beq _08008464
	ldr r5, _08008458 @ =0x082D60FC
	ldrb r0, [r4]
	lsls r0, r0, #4
	adds r0, r0, r5
	ldrb r1, [r0, #0xc]
	ldr r0, _0800845C @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _08008426
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_08008426:
	movs r0, #0x21
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, r1
	blo _08008464
	movs r0, #0
	mov r1, ip
	strb r0, [r1]
	ldrh r1, [r3, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08008460
	adds r0, r2, #1
	strb r0, [r4]
	ldrb r0, [r4]
	lsls r0, r0, #4
	adds r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008464
	b _08008462
	.align 2, 0
_08008454: .4byte gSamusData
_08008458: .4byte 0x082D60FC
_0800845C: .4byte 0x03001330
_08008460:
	subs r0, r2, #1
_08008462:
	strb r0, [r4]
_08008464:
	adds r0, r3, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0
	bne _08008470
	strh r0, [r3, #0x1c]
_08008470:
	movs r0, #0xff
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SamusStartingToHoldYourArmCannonOutOnAVerticalLadder
SamusStartingToHoldYourArmCannonOutOnAVerticalLadder: @ 0x08008478
	push {lr}
	ldr r0, _08008498 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080084A8
	ldr r0, _0800849C @ =gButtonInput
	ldr r1, _080084A0 @ =gSamusData
	ldrh r2, [r0]
	ldrh r0, [r1, #0x12]
	ands r0, r2
	cmp r0, #0
	beq _080084A4
	movs r0, #0x15
	b _080084AA
	.align 2, 0
_08008498: .4byte gChangedInput
_0800849C: .4byte gButtonInput
_080084A0: .4byte gSamusData
_080084A4:
	movs r0, #0xfe
	b _080084AA
_080084A8:
	movs r0, #0xff
_080084AA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusStartingToHoldYourArmCannonOutOnAVerticalLadderGFX
SamusStartingToHoldYourArmCannonOutOnAVerticalLadderGFX: @ 0x080084B0
	push {r4, lr}
	ldr r4, _080084F0 @ =0x082D63AC
	ldr r3, _080084F4 @ =gSamusData
	adds r2, r3, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	ldr r0, _080084F8 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _080084CE
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_080084CE:
	adds r3, #0x21
	ldrb r0, [r3]
	cmp r0, r1
	blo _080084FC
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080084FC
	movs r0, #0x28
	b _080084FE
	.align 2, 0
_080084F0: .4byte 0x082D63AC
_080084F4: .4byte gSamusData
_080084F8: .4byte 0x03001330
_080084FC:
	movs r0, #0xff
_080084FE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusHoldingYourArmCannonOutOnAVerticalLadder
SamusHoldingYourArmCannonOutOnAVerticalLadder: @ 0x08008504
	push {lr}
	bl SamusAimCannonMidAir
	ldr r3, _0800851C @ =gSamusData
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _08008520
	movs r0, #0x29
	b _08008586
	.align 2, 0
_0800851C: .4byte gSamusData
_08008520:
	ldr r0, _0800853C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08008548
	ldr r0, _08008540 @ =gButtonInput
	ldrh r1, [r0]
	ldrh r0, [r3, #0x12]
	ands r0, r1
	cmp r0, #0
	beq _08008544
	movs r0, #0x15
	b _08008586
	.align 2, 0
_0800853C: .4byte gChangedInput
_08008540: .4byte gButtonInput
_08008544:
	movs r0, #0xfe
	b _08008586
_08008548:
	ldr r0, _0800857C @ =gButtonInput
	ldr r1, _08008580 @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _08008584
	ldrh r0, [r3, #0x12]
	movs r1, #0x30
	eors r0, r1
	ands r0, r2
	cmp r0, #0
	bne _08008578
	movs r0, #0xc0
	ands r0, r2
	cmp r0, #0
	beq _08008584
	ldrb r0, [r3, #0xf]
	adds r1, r0, #1
	strb r1, [r3, #0xf]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bls _08008584
_08008578:
	movs r0, #0x2a
	b _08008586
	.align 2, 0
_0800857C: .4byte gButtonInput
_08008580: .4byte gButtonAssignments
_08008584:
	movs r0, #0xff
_08008586:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusShootingOnVerticalLadderGFX
SamusShootingOnVerticalLadderGFX: @ 0x0800858C
	push {r4, lr}
	ldr r4, _080085CC @ =0x082D647C
	ldr r3, _080085D0 @ =gSamusData
	adds r2, r3, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	ldr r0, _080085D4 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _080085AA
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_080085AA:
	adds r3, #0x21
	ldrb r0, [r3]
	cmp r0, r1
	blo _080085D8
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080085D8
	movs r0, #0x28
	b _080085DA
	.align 2, 0
_080085CC: .4byte 0x082D647C
_080085D0: .4byte gSamusData
_080085D4: .4byte 0x03001330
_080085D8:
	movs r0, #0xff
_080085DA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusStartingToPutAwayYourArmCannonOnVerticalLadder
SamusStartingToPutAwayYourArmCannonOnVerticalLadder: @ 0x080085E0
	push {lr}
	ldr r0, _08008600 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08008610
	ldr r0, _08008604 @ =gButtonInput
	ldr r1, _08008608 @ =gSamusData
	ldrh r2, [r0]
	ldrh r0, [r1, #0x12]
	ands r0, r2
	cmp r0, #0
	beq _0800860C
	movs r0, #0x15
	b _08008612
	.align 2, 0
_08008600: .4byte gChangedInput
_08008604: .4byte gButtonInput
_08008608: .4byte gSamusData
_0800860C:
	movs r0, #0xfe
	b _08008612
_08008610:
	movs r0, #0xff
_08008612:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusStartingToPutAwayYourArmCannonOnVerticalLadderGFX
SamusStartingToPutAwayYourArmCannonOnVerticalLadderGFX: @ 0x08008618
	push {r4, r5, lr}
	ldr r4, _08008668 @ =0x082D63DC
	ldr r2, _0800866C @ =gSamusData
	adds r3, r2, #0
	adds r3, #0x22
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	ldr r0, _08008670 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _08008636
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_08008636:
	movs r0, #0x21
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, r1
	blo _08008674
	movs r0, #0
	mov r1, ip
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008674
	ldrh r0, [r2, #0x12]
	movs r1, #0x30
	eors r0, r1
	strh r0, [r2, #0x12]
	movs r0, #0x26
	b _08008676
	.align 2, 0
_08008668: .4byte 0x082D63DC
_0800866C: .4byte gSamusData
_08008670: .4byte 0x03001330
_08008674:
	movs r0, #0xff
_08008676:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SamusHangingOnHorizontalLadder
SamusHangingOnHorizontalLadder: @ 0x0800867C
	push {lr}
	ldr r0, _08008690 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08008694
	movs r0, #0xfe
	b _08008712
	.align 2, 0
_08008690: .4byte gChangedInput
_08008694:
	bl SamusAimCannonHorizontalLadder
	ldr r2, _080086A8 @ =gSamusData
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _080086AC
	movs r0, #0x2f
	b _08008712
	.align 2, 0
_080086A8: .4byte gSamusData
_080086AC:
	ldrb r0, [r2, #0xd]
	cmp r0, #0
	bne _080086B8
	ldrb r0, [r2, #7]
	cmp r0, #5
	bne _080086BC
_080086B8:
	movs r0, #0x2e
	b _08008712
_080086BC:
	ldr r0, _080086FC @ =gButtonInput
	ldrh r3, [r0]
	ldrh r1, [r2, #0x12]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08008700
	movs r0, #1
	strb r0, [r2, #7]
	movs r0, #0x10
	ands r0, r1
	movs r3, #1
	rsbs r3, r3, #0
	cmp r0, #0
	beq _080086DC
	movs r3, #1
_080086DC:
	ldrh r0, [r2, #0x18]
	subs r0, #0x90
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r2, #0x16]
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ClipdataUpdateCurrentAffecting
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _08008710
	movs r0, #0x2c
	b _08008712
	.align 2, 0
_080086FC: .4byte gButtonInput
_08008700:
	movs r0, #0x30
	eors r0, r1
	ands r0, r3
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08008710
	movs r0, #0x2d
	b _08008712
_08008710:
	movs r0, #0xff
_08008712:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusMovingOnHorizontalLadder
SamusMovingOnHorizontalLadder: @ 0x08008718
	push {r4, r5, lr}
	ldr r0, _0800872C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08008730
	movs r0, #0xfe
	b _080087AA
	.align 2, 0
_0800872C: .4byte gChangedInput
_08008730:
	ldr r0, _08008748 @ =gButtonInput
	ldr r2, _0800874C @ =gSamusData
	ldrh r3, [r2, #0x12]
	movs r1, #0x30
	eors r1, r3
	ldrh r4, [r0]
	ands r1, r4
	cmp r1, #0
	beq _08008750
	movs r0, #0x2d
	b _080087AA
	.align 2, 0
_08008748: .4byte gButtonInput
_0800874C: .4byte gSamusData
_08008750:
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _08008762
	bl SamusAimCannonHorizontalLadder
	movs r0, #0x2f
	b _080087AA
_08008762:
	movs r5, #0
	adds r0, r3, #0
	ands r0, r4
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0800878C
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0800877A
	movs r5, #0x20
	b _08008796
_0800877A:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _08008796
	ldr r5, _08008788 @ =0x0000FFE0
	b _08008796
	.align 2, 0
_08008788: .4byte 0x0000FFE0
_0800878C:
	adds r1, r2, #0
	adds r1, #0x21
	ldrb r0, [r1]
	lsls r0, r0, #1
	strb r0, [r1]
_08008796:
	ldr r0, _080087B0 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _080087A6
	lsls r0, r5, #0x10
	asrs r0, r0, #0x11
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080087A6:
	strh r5, [r2, #0x1a]
	movs r0, #0xff
_080087AA:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080087B0: .4byte 0x03001330

	thumb_func_start SamusMovingOnHorizontalLadderGFX
SamusMovingOnHorizontalLadderGFX: @ 0x080087B4
	push {r4, r5, lr}
	ldr r5, _080087F4 @ =0x082D696C
	ldr r4, _080087F8 @ =gSamusData
	adds r3, r4, #0
	adds r3, #0x22
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r5
	ldrb r1, [r0, #0xc]
	ldr r0, _080087FC @ =0x03001330
	ldrb r2, [r0]
	cmp r2, #0
	beq _080087D2
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_080087D2:
	adds r4, #0x21
	ldrb r0, [r4]
	cmp r0, r1
	blo _08008828
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r1, [r3]
	lsls r0, r1, #4
	adds r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008800
	movs r0, #0x2b
	b _0800882A
	.align 2, 0
_080087F4: .4byte 0x082D696C
_080087F8: .4byte gSamusData
_080087FC: .4byte 0x03001330
_08008800:
	adds r0, r1, #0
	cmp r0, #1
	bne _08008812
	cmp r2, #0
	bne _0800881A
	movs r0, #0x87
	bl PlaySound
	b _08008828
_08008812:
	cmp r0, #6
	bne _08008828
	cmp r2, #1
	bne _08008822
_0800881A:
	movs r0, #0x95
	bl PlaySound
	b _08008828
_08008822:
	movs r0, #0x87
	bl PlaySound
_08008828:
	movs r0, #0xff
_0800882A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SamusTurningAroundOnHorizontalLadder
SamusTurningAroundOnHorizontalLadder: @ 0x08008830
	push {lr}
	ldr r0, _08008844 @ =gSamusData
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _08008848
	bl SamusAimCannonHorizontalLadder
	movs r0, #0x2f
	b _0800885E
	.align 2, 0
_08008844: .4byte gSamusData
_08008848:
	ldr r0, _08008858 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0800885C
	movs r0, #0xff
	b _0800885E
	.align 2, 0
_08008858: .4byte gChangedInput
_0800885C:
	movs r0, #0xfe
_0800885E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusTurningAroundOnHorizontalLadderGFX
SamusTurningAroundOnHorizontalLadderGFX: @ 0x08008864
	push {r4, lr}
	ldr r4, _080088B4 @ =0x082D68EC
	ldr r3, _080088B8 @ =gSamusData
	adds r2, r3, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	ldr r0, _080088BC @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _08008882
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_08008882:
	adds r3, #0x21
	ldrb r0, [r3]
	cmp r0, r1
	blo _080088CC
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080088CC
	ldr r0, _080088C0 @ =gButtonInput
	ldr r1, _080088C4 @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _080088C8
	movs r0, #0x2e
	b _080088CE
	.align 2, 0
_080088B4: .4byte 0x082D68EC
_080088B8: .4byte gSamusData
_080088BC: .4byte 0x03001330
_080088C0: .4byte gButtonInput
_080088C4: .4byte gButtonAssignments
_080088C8:
	movs r0, #0x2b
	b _080088CE
_080088CC:
	movs r0, #0xff
_080088CE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusDelayAfterShootingOnHorizontalLadder
SamusDelayAfterShootingOnHorizontalLadder: @ 0x080088D4
	push {lr}
	bl SamusAimCannonHorizontalLadder
	ldr r3, _080088EC @ =gSamusData
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r0, #0
	beq _080088F0
	movs r0, #0x2f
	b _08008946
	.align 2, 0
_080088EC: .4byte gSamusData
_080088F0:
	ldr r0, _08008900 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08008904
	movs r0, #0xfe
	b _08008946
	.align 2, 0
_08008900: .4byte gChangedInput
_08008904:
	ldr r0, _08008918 @ =gButtonInput
	ldrh r1, [r3, #0x12]
	movs r2, #0x30
	eors r1, r2
	ldrh r2, [r0]
	ands r1, r2
	cmp r1, #0
	beq _0800891C
	movs r0, #0x2d
	b _08008946
	.align 2, 0
_08008918: .4byte gButtonInput
_0800891C:
	ldr r0, _08008940 @ =gButtonAssignments
	ldrh r0, [r0, #2]
	ands r0, r2
	cmp r0, #0
	bne _08008944
	movs r0, #0x30
	ands r0, r2
	cmp r0, #0
	beq _08008944
	ldrb r0, [r3, #0xf]
	adds r1, r0, #1
	strb r1, [r3, #0xf]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bls _08008944
	movs r0, #0x2b
	b _08008946
	.align 2, 0
_08008940: .4byte gButtonAssignments
_08008944:
	movs r0, #0xff
_08008946:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusShootingOnHorizontalLadderGFX
SamusShootingOnHorizontalLadderGFX: @ 0x0800894C
	push {r4, lr}
	ldr r4, _0800898C @ =0x082D6B2C
	ldr r3, _08008990 @ =gSamusData
	adds r2, r3, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r0, #0xc]
	ldr r0, _08008994 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800896A
	lsls r0, r1, #0x19
	lsrs r1, r0, #0x18
_0800896A:
	adds r3, #0x21
	ldrb r0, [r3]
	cmp r0, r1
	blo _08008998
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008998
	movs r0, #0x2e
	b _0800899A
	.align 2, 0
_0800898C: .4byte 0x082D6B2C
_08008990: .4byte gSamusData
_08008994: .4byte 0x03001330
_08008998:
	movs r0, #0xff
_0800899A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusFrozenGFX
SamusFrozenGFX: @ 0x080089A0
	push {lr}
	ldr r1, _080089B4 @ =gSamusData
	ldrb r0, [r1, #0xf]
	cmp r0, #0x4f
	bhi _080089B8
	adds r0, #1
	strb r0, [r1, #0xf]
	movs r0, #0xff
	b _080089BA
	.align 2, 0
_080089B4: .4byte gSamusData
_080089B8:
	movs r0, #0
_080089BA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusFrozenInMorphBallGFX
SamusFrozenInMorphBallGFX: @ 0x080089C0
	push {lr}
	ldr r1, _080089D4 @ =gSamusData
	ldrb r0, [r1, #0xf]
	cmp r0, #0x4f
	bhi _080089D8
	adds r0, #1
	strb r0, [r1, #0xf]
	movs r0, #0xff
	b _080089DA
	.align 2, 0
_080089D4: .4byte gSamusData
_080089D8:
	movs r0, #0xd
_080089DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusUnlockingSecurityGFX
SamusUnlockingSecurityGFX: @ 0x080089E0
	push {r4, lr}
	ldr r0, _08008A50 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08008A54 @ =0x082CBE88
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008A14
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008A14
	strb r0, [r2]
_08008A14:
	ldr r2, _08008A58 @ =0x030012D8
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	ldr r3, _08008A5C @ =0x082E481C
	ldrb r1, [r2, #2]
	lsls r1, r1, #3
	adds r1, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _08008A46
	movs r0, #0
	strb r0, [r2, #1]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08008A46
	strb r0, [r2, #2]
_08008A46:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008A50: .4byte gSamusData
_08008A54: .4byte 0x082CBE88
_08008A58: .4byte 0x030012D8
_08008A5C: .4byte 0x082E481C

	thumb_func_start SamusSavingGFX
SamusSavingGFX: @ 0x08008A60
	push {r4, lr}
	ldr r0, _08008A98 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08008A9C @ =0x082DE520
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008AA0
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008AA0
	movs r0, #0x39
	b _08008AA2
	.align 2, 0
_08008A98: .4byte gSamusData
_08008A9C: .4byte 0x082DE520
_08008AA0:
	movs r0, #0xff
_08008AA2:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SavingOnNavigationPadGFX
SavingOnNavigationPadGFX: @ 0x08008AA8
	push {r4, lr}
	ldr r0, _08008AE0 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08008AE4 @ =0x082CB908
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008AE8
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008AE8
	movs r0, #0x3a
	b _08008AEA
	.align 2, 0
_08008AE0: .4byte gSamusData
_08008AE4: .4byte 0x082CB908
_08008AE8:
	movs r0, #0xff
_08008AEA:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SamusDownloadingAbilityGFX
SamusDownloadingAbilityGFX: @ 0x08008AF0
	push {r4, lr}
	ldr r0, _08008B2C @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08008B30 @ =0x082CBC38
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008B24
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008B24
	strb r0, [r2]
_08008B24:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008B2C: .4byte gSamusData
_08008B30: .4byte 0x082CBC38

	thumb_func_start SamusBeingRechargedGFX
SamusBeingRechargedGFX: @ 0x08008B34
	push {r4, lr}
	ldr r0, _08008B70 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08008B74 @ =0x082CBDD8
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008B68
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008B68
	strb r0, [r2]
_08008B68:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008B70: .4byte gSamusData
_08008B74: .4byte 0x082CBDD8

	thumb_func_start SamusFacingForeground
SamusFacingForeground: @ 0x08008B78
	push {lr}
	ldr r2, _08008B94 @ =gSamusData
	ldrh r3, [r2, #0x10]
	cmp r3, #0
	beq _08008B98
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0
	strb r0, [r1]
	subs r1, #1
	strb r0, [r1]
	subs r0, r3, #1
	strh r0, [r2, #0x10]
	b _08008BBC
	.align 2, 0
_08008B94: .4byte gSamusData
_08008B98:
	adds r3, r2, #0
	adds r3, #0x22
	ldrb r0, [r3]
	cmp r0, #2
	bhi _08008BBC
	ldr r0, _08008BC4 @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	beq _08008BBC
	movs r0, #0
	strh r1, [r2, #0x12]
	movs r1, #3
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
_08008BBC:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_08008BC4: .4byte gButtonInput

	thumb_func_start SamusFacingForegroundGFX
SamusFacingForegroundGFX: @ 0x08008BC8
	push {r4, lr}
	ldr r0, _08008C08 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08008C0C @ =0x082CB758
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008C12
	movs r1, #0
	strb r1, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _08008C10
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008C12
	movs r0, #0
	b _08008C14
	.align 2, 0
_08008C08: .4byte gSamusData
_08008C0C: .4byte 0x082CB758
_08008C10:
	strb r1, [r2]
_08008C12:
	movs r0, #0xff
_08008C14:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusUnlockingHabitationsDeckGFX
SamusUnlockingHabitationsDeckGFX: @ 0x08008C1C
	push {r4, r5, lr}
	ldr r3, _08008C64 @ =gSamusData
	movs r0, #0x21
	adds r0, r0, r3
	mov ip, r0
	ldr r4, _08008C68 @ =0x082CBEA8
	adds r2, r3, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	mov r5, ip
	ldrb r1, [r5]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008C6E
	movs r0, #0
	strb r0, [r5]
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	beq _08008C6C
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008C6E
	movs r0, #0x10
	strh r0, [r3, #0x12]
	movs r0, #0
	b _08008C70
	.align 2, 0
_08008C64: .4byte gSamusData
_08008C68: .4byte 0x082CBEA8
_08008C6C:
	strb r1, [r2]
_08008C6E:
	movs r0, #0xff
_08008C70:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusLoadingSave
SamusLoadingSave: @ 0x08008C78
	push {lr}
	ldr r1, _08008C8C @ =0x030012D8
	ldrb r0, [r1]
	cmp r0, #0
	bne _08008C86
	adds r0, #1
	strb r0, [r1]
_08008C86:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_08008C8C: .4byte 0x030012D8

	thumb_func_start SamusLoadingSaveGFX
SamusLoadingSaveGFX: @ 0x08008C90
	push {r4, r5, lr}
	ldr r0, _08008CD0 @ =gSamusData
	movs r1, #0x21
	adds r1, r1, r0
	mov ip, r1
	ldr r4, _08008CD4 @ =0x082D9C04
	adds r3, r0, #0
	adds r3, #0x22
	ldrb r1, [r3]
	lsls r1, r1, #4
	adds r1, r1, r4
	mov r5, ip
	ldrb r2, [r5]
	adds r5, r0, #0
	ldrb r1, [r1, #0xc]
	cmp r2, r1
	blo _08008CD8
	movs r0, #0
	mov r1, ip
	strb r0, [r1]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008CD8
	movs r0, #0x39
	b _08008D38
	.align 2, 0
_08008CD0: .4byte gSamusData
_08008CD4: .4byte 0x082D9C04
_08008CD8:
	ldr r2, _08008D1C @ =0x030012D8
	ldrb r3, [r2]
	cmp r3, #1
	bne _08008D36
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	ldr r4, _08008D20 @ =0x0828CE8C
	ldrb r1, [r2, #2]
	lsls r1, r1, #3
	adds r1, r1, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _08008D36
	movs r0, #0
	strb r0, [r2, #1]
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x18
	bne _08008D24
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0x13
	bhi _08008D36
	movs r0, #0x10
	strb r0, [r2, #2]
	b _08008D36
	.align 2, 0
_08008D1C: .4byte 0x030012D8
_08008D20: .4byte 0x0828CE8C
_08008D24:
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08008D36
	adds r0, r3, #1
	strb r0, [r2]
	strb r1, [r2, #2]
_08008D36:
	movs r0, #0xff
_08008D38:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusDying
SamusDying: @ 0x08008D40
	push {r4, r5, lr}
	ldr r2, _08008D58 @ =gSamusData
	ldrh r0, [r2, #0x10]
	adds r1, r0, #0
	cmp r1, #0
	bne _08008D5C
	adds r0, #1
	strh r0, [r2, #0x10]
	bl StopAllMusicsAndSounds
	b _08008D6A
	.align 2, 0
_08008D58: .4byte gSamusData
_08008D5C:
	cmp r1, #1
	bne _08008D6A
	adds r0, #1
	strh r0, [r2, #0x10]
	movs r0, #0x8e
	bl PlaySound
_08008D6A:
	ldr r0, _08008DA0 @ =gSamusData
	movs r1, #0x40
	strb r1, [r0, #5]
	ldr r1, _08008DA4 @ =0x030012D8
	ldrb r2, [r1]
	adds r1, r0, #0
	cmp r2, #0
	bne _08008DE2
	ldr r0, _08008DA8 @ =gBg1XPosition
	ldrh r0, [r0]
	movs r4, #0xf0
	lsls r4, r4, #1
	adds r3, r0, r4
	ldr r0, _08008DAC @ =gBg1YPosition
	ldrh r0, [r0]
	movs r5, #0xc8
	lsls r5, r5, #1
	adds r4, r0, r5
	movs r5, #0x1a
	ldrsh r0, [r1, r5]
	cmp r0, #0
	ble _08008DB0
	ldrh r0, [r1, #0x16]
	cmp r0, r3
	blo _08008DBC
	b _08008DBA
	.align 2, 0
_08008DA0: .4byte gSamusData
_08008DA4: .4byte 0x030012D8
_08008DA8: .4byte gBg1XPosition
_08008DAC: .4byte gBg1YPosition
_08008DB0:
	cmp r0, #0
	bge _08008DBC
	ldrh r0, [r1, #0x16]
	cmp r0, r3
	bhi _08008DBC
_08008DBA:
	strh r2, [r1, #0x1a]
_08008DBC:
	movs r2, #0x1c
	ldrsh r0, [r1, r2]
	cmp r0, #0
	ble _08008DCC
	ldrh r0, [r1, #0x18]
	cmp r0, r4
	blo _08008DDA
	b _08008DD6
_08008DCC:
	cmp r0, #0
	bge _08008DDA
	ldrh r0, [r1, #0x18]
	cmp r0, r4
	bhi _08008DDA
_08008DD6:
	movs r0, #0
	strh r0, [r1, #0x1c]
_08008DDA:
	ldrh r0, [r1, #0x1c]
	ldrh r4, [r1, #0x18]
	adds r0, r0, r4
	strh r0, [r1, #0x18]
_08008DE2:
	movs r0, #0xff
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusDyingGFX
SamusDyingGFX: @ 0x08008DEC
	push {r4, r5, lr}
	ldr r0, _08008E68 @ =0x030012D8
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	bls _08008E2A
	ldrb r0, [r3, #1]
	adds r0, #1
	strb r0, [r3, #1]
	ldr r2, _08008E6C @ =0x0828CDB8
	ldrb r1, [r3, #2]
	lsls r1, r1, #3
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _08008E2A
	movs r0, #0
	strb r0, [r3, #1]
	ldrb r0, [r3, #2]
	adds r0, #1
	strb r0, [r3, #2]
	ldrb r1, [r3, #2]
	lsls r0, r1, #3
	adds r0, r0, r2
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08008E2A
	subs r0, r1, #1
	strb r0, [r3, #2]
_08008E2A:
	ldr r2, _08008E70 @ =gSamusData
	adds r4, r2, #0
	adds r4, #0x21
	ldr r5, _08008E74 @ =0x082D9158
	movs r0, #0x22
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008EA8
	movs r1, #0
	strb r1, [r4]
	mov r4, ip
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _08008E88
	ldrb r0, [r2, #0xf]
	cmp r0, #0x1d
	bhi _08008E78
	strb r1, [r4]
	adds r0, #1
	strb r0, [r2, #0xf]
	b _08008EA8
	.align 2, 0
_08008E68: .4byte 0x030012D8
_08008E6C: .4byte 0x0828CDB8
_08008E70: .4byte gSamusData
_08008E74: .4byte 0x082D9158
_08008E78:
	movs r0, #1
	strb r0, [r3]
	ldr r1, _08008E84 @ =0x03000018
	movs r0, #2
	b _08008EA6
	.align 2, 0
_08008E84: .4byte 0x03000018
_08008E88:
	cmp r0, #4
	bne _08008E94
	strb r1, [r2, #0xf]
	movs r0, #2
	strb r0, [r3]
	b _08008EA8
_08008E94:
	mov r0, ip
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008EA8
	subs r0, r1, #1
	mov r1, ip
_08008EA6:
	strb r0, [r1]
_08008EA8:
	movs r0, #0xff
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start SamusHitByOmagaMetroid
SamusHitByOmagaMetroid: @ 0x08008EB0
	push {lr}
	ldr r2, _08008EE4 @ =gEquipment
	ldrb r1, [r2, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08008EC4
	ldrh r0, [r2]
	cmp r0, #0x62
	bls _08008F12
_08008EC4:
	ldr r2, _08008EE8 @ =gSamusData
	ldrb r0, [r2, #0xf]
	ldrh r1, [r2, #0x10]
	adds r1, r1, r0
	adds r0, r1, #1
	strh r0, [r2, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xb3
	bls _08008EF0
	ldr r1, _08008EEC @ =gPoseLock
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	b _08008F14
	.align 2, 0
_08008EE4: .4byte gEquipment
_08008EE8: .4byte gSamusData
_08008EEC: .4byte gPoseLock
_08008EF0:
	ldr r0, _08008F04 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08008F08
	ldrb r0, [r2, #0xf]
	adds r0, #0xa
	b _08008F10
	.align 2, 0
_08008F04: .4byte gChangedInput
_08008F08:
	ldrb r0, [r2, #0xf]
	cmp r0, #0
	beq _08008F12
	subs r0, #1
_08008F10:
	strb r0, [r2, #0xf]
_08008F12:
	movs r0, #0xff
_08008F14:
	pop {r1}
	bx r1

	thumb_func_start SamusHitByOmegaMetroidGFX
SamusHitByOmegaMetroidGFX: @ 0x08008F18
	push {r4, lr}
	ldr r0, _08008F54 @ =gSamusData
	adds r3, r0, #0
	adds r3, #0x21
	ldr r4, _08008F58 @ =0x082BDF48
	adds r2, r0, #0
	adds r2, #0x22
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r1, [r3]
	ldrb r0, [r0, #0xc]
	cmp r1, r0
	blo _08008F4C
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _08008F4C
	strb r0, [r2]
_08008F4C:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08008F54: .4byte gSamusData
_08008F58: .4byte 0x082BDF48

	thumb_func_start SamusGrabbedByYakuza
SamusGrabbedByYakuza: @ 0x08008F5C
	push {r4, lr}
	ldr r3, _08008F70 @ =gSamusData
	ldrb r2, [r3, #0xf]
	adds r4, r2, #0
	cmp r4, #0x80
	bls _08008F74
	movs r0, #0x30
	strb r0, [r3, #5]
	movs r0, #4
	b _08008F9A
	.align 2, 0
_08008F70: .4byte gSamusData
_08008F74:
	ldr r0, _08008F8C @ =gChangedInput
	ldrh r0, [r0]
	movs r1, #0x30
	ands r1, r0
	cmp r1, #0
	beq _08008F90
	adds r0, r2, #0
	adds r0, #0xb
	strb r0, [r3, #0xf]
	strh r1, [r3, #0x12]
	b _08008F98
	.align 2, 0
_08008F8C: .4byte gChangedInput
_08008F90:
	cmp r4, #0
	beq _08008F98
	subs r0, r2, #1
	strb r0, [r3, #0xf]
_08008F98:
	movs r0, #0xff
_08008F9A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start SetSamusPose
SetSamusPose: @ 0x08008FA0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r1, #0xe0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08008FB8
	ldr r1, _08008FD0 @ =gSamusData
	movs r0, #0
	strb r0, [r1, #2]
_08008FB8:
	bl CopySamusData
	ldr r1, _08008FD4 @ =gSamusDataCopy
	ldrb r0, [r1, #1]
	cmp r0, #0x1c
	beq _08009002
	cmp r0, #0x1c
	bgt _08008FD8
	cmp r0, #3
	beq _08008FE2
	b _08009008
	.align 2, 0
_08008FD0: .4byte gSamusData
_08008FD4: .4byte gSamusDataCopy
_08008FD8:
	cmp r0, #0x23
	beq _08008FF6
	cmp r0, #0x24
	beq _08008FFA
	b _08009008
_08008FE2:
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _08009008
	ldrb r0, [r1, #0xf]
	cmp r0, #0x50
	bls _08009008
	movs r0, #0x6a
	bl StopSound
	b _08009008
_08008FF6:
	cmp r4, #0x24
	beq _08009008
_08008FFA:
	movs r0, #0x99
	bl StopSound
	b _08009008
_08009002:
	ldr r1, _0800901C @ =gDisableScrolling
	movs r0, #0
	strb r0, [r1]
_08009008:
	adds r0, r4, #0
	subs r0, #0xf7
	cmp r0, #7
	bhi _0800906E
	lsls r0, r0, #2
	ldr r1, _08009020 @ =_08009024
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800901C: .4byte gDisableScrolling
_08009020: .4byte _08009024
_08009024: @ jump table
	.4byte _08009068 @ case 0
	.4byte _08009062 @ case 1
	.4byte _0800905C @ case 2
	.4byte _08009056 @ case 3
	.4byte _08009050 @ case 4
	.4byte _0800906E @ case 5
	.4byte _0800904A @ case 6
	.4byte _08009044 @ case 7
_08009044:
	bl SamusUpdateJumpVelocity
	b _08009076
_0800904A:
	bl SamusSetLandingPose
	b _08009076
_08009050:
	bl SamusSetFreezedPose
	b _08009076
_08009056:
	bl SamusSetHurtPose
	b _08009076
_0800905C:
	bl SamusSetKnockBackPose
	b _08009076
_08009062:
	bl unk_99a0
	b _08009076
_08009068:
	bl unk_99d8
	b _08009076
_0800906E:
	ldr r0, _0800907C @ =gSamusData
	strb r4, [r0, #1]
	bl SamusCheckCarryFromCopy
_08009076:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800907C: .4byte gSamusData

	thumb_func_start SamusUpdateJumpVelocity
SamusUpdateJumpVelocity: @ 0x08009080
	push {r4, r5, lr}
	ldr r2, _080090B0 @ =gSamusData
	ldr r1, _080090B4 @ =gSamusDataCopy
	ldrh r0, [r1, #0x1a]
	strh r0, [r2, #0x1a]
	ldrb r0, [r1, #6]
	strb r0, [r2, #6]
	ldrb r0, [r1, #7]
	adds r3, r1, #0
	cmp r0, #0
	bne _08009098
	movs r0, #1
_08009098:
	strb r0, [r2, #7]
	ldrb r0, [r3, #1]
	subs r0, #3
	cmp r0, #0x39
	bls _080090A4
	b _08009338
_080090A4:
	lsls r0, r0, #2
	ldr r1, _080090B8 @ =_080090BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080090B0: .4byte gSamusData
_080090B4: .4byte gSamusDataCopy
_080090B8: .4byte _080090BC
_080090BC: @ jump table
	.4byte _080091A4 @ case 0
	.4byte _08009338 @ case 1
	.4byte _08009338 @ case 2
	.4byte _08009338 @ case 3
	.4byte _08009338 @ case 4
	.4byte _08009338 @ case 5
	.4byte _08009338 @ case 6
	.4byte _08009208 @ case 7
	.4byte _08009208 @ case 8
	.4byte _08009268 @ case 9
	.4byte _08009268 @ case 10
	.4byte _08009268 @ case 11
	.4byte _08009338 @ case 12
	.4byte _08009220 @ case 13
	.4byte _08009338 @ case 14
	.4byte _08009338 @ case 15
	.4byte _08009338 @ case 16
	.4byte _08009338 @ case 17
	.4byte _080092BC @ case 18
	.4byte _08009208 @ case 19
	.4byte _08009338 @ case 20
	.4byte _08009338 @ case 21
	.4byte _08009338 @ case 22
	.4byte _08009338 @ case 23
	.4byte _08009338 @ case 24
	.4byte _08009338 @ case 25
	.4byte _08009208 @ case 26
	.4byte _08009208 @ case 27
	.4byte _08009338 @ case 28
	.4byte _08009338 @ case 29
	.4byte _08009338 @ case 30
	.4byte _08009338 @ case 31
	.4byte _08009338 @ case 32
	.4byte _08009338 @ case 33
	.4byte _08009338 @ case 34
	.4byte _08009338 @ case 35
	.4byte _08009338 @ case 36
	.4byte _08009338 @ case 37
	.4byte _08009338 @ case 38
	.4byte _08009338 @ case 39
	.4byte _08009338 @ case 40
	.4byte _08009338 @ case 41
	.4byte _08009338 @ case 42
	.4byte _08009338 @ case 43
	.4byte _08009338 @ case 44
	.4byte _0800931C @ case 45
	.4byte _08009338 @ case 46
	.4byte _08009328 @ case 47
	.4byte _08009338 @ case 48
	.4byte _08009338 @ case 49
	.4byte _08009338 @ case 50
	.4byte _08009338 @ case 51
	.4byte _08009338 @ case 52
	.4byte _08009338 @ case 53
	.4byte _08009338 @ case 54
	.4byte _08009338 @ case 55
	.4byte _08009338 @ case 56
	.4byte _08009268 @ case 57
_080091A4:
	ldrb r1, [r3, #3]
	cmp r1, #1
	bne _080091FC
	movs r0, #0xa
	strb r0, [r2, #1]
	ldr r0, _080091BC @ =gEquipment
	ldrb r0, [r0, #0xc]
	ands r1, r0
	cmp r1, #0
	beq _080091C0
	movs r0, #0xdc
	b _080091C2
	.align 2, 0
_080091BC: .4byte gEquipment
_080091C0:
	movs r0, #0xaa
_080091C2:
	strh r0, [r2, #0x1c]
	ldr r2, _080091F4 @ =gSamusData
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _080091CE
	b _080093A8
_080091CE:
	ldrh r1, [r3, #0x1e]
	ldrh r0, [r3, #0x12]
	ands r0, r1
	cmp r0, #0
	bne _080091DA
	b _080093A8
_080091DA:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080091E4
	b _080093A8
_080091E4:
	ldrh r0, [r2, #0x18]
	subs r0, #0x10
	strh r0, [r2, #0x18]
	ldr r1, _080091F8 @ =0x03004810
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080093A8
	.align 2, 0
_080091F4: .4byte gSamusData
_080091F8: .4byte 0x03004810
_080091FC:
	ldr r1, _08009204 @ =gSamusData
	movs r0, #4
	strb r0, [r1, #1]
	b _080093A8
	.align 2, 0
_08009204: .4byte gSamusData
_08009208:
	ldr r1, _0800921C @ =gSamusData
	movs r2, #0
	movs r0, #4
	strb r0, [r1, #1]
	strh r2, [r1, #0x1a]
	ldrh r0, [r1, #0x18]
	adds r0, #0x14
	strh r0, [r1, #0x18]
	b _080093A8
	.align 2, 0
_0800921C: .4byte gSamusData
_08009220:
	ldrb r1, [r3, #3]
	cmp r1, #0xa
	bne _08009234
	ldr r1, _08009230 @ =gSamusData
	movs r0, #0x10
	strh r0, [r1, #0x12]
	movs r0, #0x28
	b _08009256
	.align 2, 0
_08009230: .4byte gSamusData
_08009234:
	cmp r1, #0xb
	bne _08009248
	ldr r0, _08009244 @ =gSamusData
	movs r1, #0
	strh r1, [r0, #0x1a]
	movs r1, #0x40
	strh r1, [r0, #0x1c]
	b _080093A8
	.align 2, 0
_08009244: .4byte gSamusData
_08009248:
	cmp r1, #0xc
	beq _0800924E
	b _080093A8
_0800924E:
	ldr r1, _08009260 @ =gSamusData
	movs r0, #0x20
	strh r0, [r1, #0x12]
	ldr r0, _08009264 @ =0x0000FFD8
_08009256:
	strh r0, [r1, #0x1a]
	movs r0, #0x40
	strh r0, [r1, #0x1c]
	b _080093A8
	.align 2, 0
_08009260: .4byte gSamusData
_08009264: .4byte 0x0000FFD8
_08009268:
	ldr r2, _0800927C @ =gSamusData
	movs r0, #0x10
	strb r0, [r2, #1]
	ldrb r1, [r3, #3]
	cmp r1, #0xa
	bne _08009280
	strh r0, [r2, #0x12]
	movs r0, #0x28
	b _08009292
	.align 2, 0
_0800927C: .4byte gSamusData
_08009280:
	cmp r1, #0xb
	bne _08009288
	movs r0, #0
	b _08009292
_08009288:
	cmp r1, #0xc
	bne _080092A4
	movs r0, #0x20
	strh r0, [r2, #0x12]
	ldr r0, _080092A0 @ =0x0000FFD8
_08009292:
	strh r0, [r2, #0x1a]
	movs r0, #0x80
	strh r0, [r2, #0x1c]
	movs r0, #1
	strb r0, [r2, #3]
	b _080093A8
	.align 2, 0
_080092A0: .4byte 0x0000FFD8
_080092A4:
	ldrh r0, [r2, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r2, #0x1a]
	cmp r1, #1
	bne _080092B4
	movs r0, #0xaa
	b _080093A6
_080092B4:
	cmp r1, #3
	beq _080092BA
	b _080093A8
_080092BA:
	b _08009396
_080092BC:
	movs r0, #0x16
	strb r0, [r2, #1]
	ldr r0, _080092D4 @ =0x03001330
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	beq _080092D0
	ldrb r0, [r3, #3]
	cmp r0, #0
	bne _080092D8
_080092D0:
	movs r0, #0xaa
	b _080092DA
	.align 2, 0
_080092D4: .4byte 0x03001330
_080092D8:
	movs r0, #0x30
_080092DA:
	strh r0, [r2, #0x1c]
	ldr r2, _080092F4 @ =gSamusData
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080092F8
	movs r0, #0x40
	strh r0, [r2, #0x1a]
	ldrh r0, [r2, #0x16]
	adds r0, #8
	b _08009300
	.align 2, 0
_080092F4: .4byte gSamusData
_080092F8:
	ldr r0, _08009310 @ =0x0000FFC0
	strh r0, [r2, #0x1a]
	ldrh r0, [r2, #0x16]
	subs r0, #8
_08009300:
	strh r0, [r2, #0x16]
	ldrb r0, [r4]
	cmp r0, #1
	bne _08009314
	movs r0, #0x96
	bl PlaySound
	b _080093A8
	.align 2, 0
_08009310: .4byte 0x0000FFC0
_08009314:
	movs r0, #0x7e
	bl PlaySound
	b _080093A8
_0800931C:
	ldr r0, _08009324 @ =gSamusData
	movs r1, #0x31
	b _0800932C
	.align 2, 0
_08009324: .4byte gSamusData
_08009328:
	ldr r0, _08009334 @ =gSamusData
	movs r1, #0x33
_0800932C:
	strb r1, [r0, #1]
	ldrb r1, [r3, #0xf]
	strb r1, [r0, #0xf]
	b _080093A8
	.align 2, 0
_08009334: .4byte gSamusData
_08009338:
	adds r4, r2, #0
	movs r5, #4
	strb r5, [r4, #1]
	ldrb r0, [r3, #3]
	cmp r0, #1
	bne _08009388
	ldr r0, _08009358 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _0800935C
	movs r0, #0xa
	strb r0, [r4, #1]
	b _0800935E
	.align 2, 0
_08009358: .4byte gButtonInput
_0800935C:
	strb r5, [r4, #1]
_0800935E:
	ldr r0, _08009374 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800937C
	ldr r1, _08009378 @ =gSamusData
	movs r0, #0xdc
	strh r0, [r1, #0x1c]
	b _080093A8
	.align 2, 0
_08009374: .4byte gEquipment
_08009378: .4byte gSamusData
_0800937C:
	ldr r1, _08009384 @ =gSamusData
	movs r0, #0xaa
	strh r0, [r1, #0x1c]
	b _080093A8
	.align 2, 0
_08009384: .4byte gSamusData
_08009388:
	cmp r0, #2
	bne _08009392
	ldrh r0, [r3, #0x1c]
	strh r0, [r4, #0x1c]
	b _080093A8
_08009392:
	cmp r0, #3
	bne _080093A8
_08009396:
	ldr r1, _080093C8 @ =gPreviousYPosition
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r0, [r2, #0x18]
	adds r0, #1
	strh r0, [r2, #0x18]
	ldr r0, _080093CC @ =0x0000FFFC
_080093A6:
	strh r0, [r2, #0x1c]
_080093A8:
	ldr r1, _080093D0 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #4
	bne _080093F0
	movs r2, #0x1c
	ldrsh r0, [r1, r2]
	cmp r0, #0xaa
	bne _080093D8
	ldr r0, _080093D4 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	beq _08009404
	movs r0, #0x71
	bl PlaySound
	b _0800941A
	.align 2, 0
_080093C8: .4byte gPreviousYPosition
_080093CC: .4byte 0x0000FFFC
_080093D0: .4byte gSamusData
_080093D4: .4byte 0x03001330
_080093D8:
	cmp r0, #0xdc
	bne _0800941A
	ldr r0, _080093EC @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	beq _08009404
	movs r0, #0x72
	bl PlaySound
	b _0800941A
	.align 2, 0
_080093EC: .4byte 0x03001330
_080093F0:
	cmp r0, #0x10
	bne _0800941A
	ldr r0, _0800940C @ =gSamusDataCopy
	ldrb r0, [r0, #3]
	cmp r0, #1
	bne _0800941A
	ldr r0, _08009410 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _08009414
_08009404:
	movs r0, #0x96
	bl PlaySound
	b _0800941A
	.align 2, 0
_0800940C: .4byte gSamusDataCopy
_08009410: .4byte 0x03001330
_08009414:
	movs r0, #0x73
	bl PlaySound
_0800941A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SamusSetLandingPose
SamusSetLandingPose: @ 0x08009420
	push {r4, lr}
	ldr r2, _08009448 @ =gSamusDataCopy
	movs r0, #0
	strh r0, [r2, #0x10]
	ldr r0, _0800944C @ =gPoseLock
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _08009454
	ldr r1, _08009450 @ =gSamusData
	movs r0, #0x3f
	strb r0, [r1, #1]
	movs r0, #1
	strb r0, [r1, #7]
	movs r0, #0
	strb r0, [r1, #0xd]
	b _0800970C
	.align 2, 0
_08009448: .4byte gSamusDataCopy
_0800944C: .4byte gPoseLock
_08009450: .4byte gSamusData
_08009454:
	ldrb r0, [r4, #1]
	subs r0, #4
	cmp r0, #0x2f
	bls _0800945E
	b _08009680
_0800945E:
	lsls r0, r0, #2
	ldr r1, _08009468 @ =_0800946C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009468: .4byte _0800946C
_0800946C: @ jump table
	.4byte _0800952C @ case 0
	.4byte _08009680 @ case 1
	.4byte _08009680 @ case 2
	.4byte _08009680 @ case 3
	.4byte _08009680 @ case 4
	.4byte _08009680 @ case 5
	.4byte _08009680 @ case 6
	.4byte _08009680 @ case 7
	.4byte _08009680 @ case 8
	.4byte _08009680 @ case 9
	.4byte _08009680 @ case 10
	.4byte _08009680 @ case 11
	.4byte _080095CC @ case 12
	.4byte _08009680 @ case 13
	.4byte _08009640 @ case 14
	.4byte _08009680 @ case 15
	.4byte _08009640 @ case 16
	.4byte _08009680 @ case 17
	.4byte _08009680 @ case 18
	.4byte _08009680 @ case 19
	.4byte _08009680 @ case 20
	.4byte _08009680 @ case 21
	.4byte _08009680 @ case 22
	.4byte _08009680 @ case 23
	.4byte _08009680 @ case 24
	.4byte _08009680 @ case 25
	.4byte _08009680 @ case 26
	.4byte _08009680 @ case 27
	.4byte _08009680 @ case 28
	.4byte _08009680 @ case 29
	.4byte _08009680 @ case 30
	.4byte _08009680 @ case 31
	.4byte _0800956C @ case 32
	.4byte _08009680 @ case 33
	.4byte _08009680 @ case 34
	.4byte _08009680 @ case 35
	.4byte _08009680 @ case 36
	.4byte _08009680 @ case 37
	.4byte _08009680 @ case 38
	.4byte _08009680 @ case 39
	.4byte _08009680 @ case 40
	.4byte _08009680 @ case 41
	.4byte _08009680 @ case 42
	.4byte _08009680 @ case 43
	.4byte _08009680 @ case 44
	.4byte _0800964C @ case 45
	.4byte _08009680 @ case 46
	.4byte _08009664 @ case 47
_0800952C:
	ldr r0, _08009560 @ =0x0828FCCC
	ldrh r1, [r0, #4]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	adds r1, r0, #0
	cmp r1, #0
	beq _08009540
	b _08009692
_08009540:
	ldr r2, _08009564 @ =gSamusDataCopy
	movs r3, #0x1a
	ldrsh r0, [r2, r3]
	cmp r0, #0
	bne _0800954C
	b _080096AE
_0800954C:
	ldrb r0, [r2, #6]
	cmp r0, #0
	bne _08009554
	b _080096C0
_08009554:
	ldr r0, _08009568 @ =gSamusData
	movs r1, #3
	strb r1, [r0, #1]
	movs r1, #1
	strb r1, [r0, #6]
	b _080096C4
	.align 2, 0
_08009560: .4byte 0x0828FCCC
_08009564: .4byte gSamusDataCopy
_08009568: .4byte gSamusData
_0800956C:
	ldr r0, _08009588 @ =gButtonInput
	ldr r4, _0800958C @ =gSamusData
	ldrh r0, [r0]
	ldrh r1, [r4, #0x12]
	ands r0, r1
	cmp r0, #0
	beq _080095AC
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08009590
	movs r0, #0xa0
	b _08009592
	.align 2, 0
_08009588: .4byte gButtonInput
_0800958C: .4byte gSamusData
_08009590:
	ldr r0, _080095A4 @ =0x0000FF60
_08009592:
	strh r0, [r4, #0x1a]
	ldr r1, _080095A8 @ =gSamusData
	movs r0, #3
	strb r0, [r1, #1]
	movs r0, #1
	strb r0, [r1, #6]
	movs r0, #0xa0
	strb r0, [r1, #0xf]
	b _080096C4
	.align 2, 0
_080095A4: .4byte 0x0000FF60
_080095A8: .4byte gSamusData
_080095AC:
	movs r0, #0x1e
	movs r1, #1
	bl ScreenShakeStartHorizontal
	movs r0, #0x25
	strb r0, [r4, #1]
	ldr r0, _080095C8 @ =gSamusDataCopy
	ldrb r0, [r0, #3]
	strb r0, [r4, #3]
	movs r0, #0x9a
	bl PlaySound
	b _080096C4
	.align 2, 0
_080095C8: .4byte gSamusDataCopy
_080095CC:
	ldrh r0, [r4, #0x10]
	adds r0, #1
	strh r0, [r4, #0x10]
	ldr r0, _080095F4 @ =gButtonInput
	ldrh r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08009600
	ldr r0, _080095F8 @ =gEquipment
	ldrb r1, [r0, #0xc]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08009600
	ldr r1, _080095FC @ =gSamusData
	movs r0, #0x14
	strb r0, [r1, #3]
	b _08009640
	.align 2, 0
_080095F4: .4byte gButtonInput
_080095F8: .4byte gEquipment
_080095FC: .4byte gSamusData
_08009600:
	ldr r0, _08009634 @ =gSamusDataCopy
	movs r2, #0x1c
	ldrsh r1, [r0, r2]
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08009640
	ldr r0, _08009638 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #0
	bne _08009640
	ldr r4, _0800963C @ =gSamusData
	ldrh r0, [r4, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	bl GetGroundEffectAtPosition
	cmp r0, #3
	beq _08009640
	movs r0, #1
	strb r0, [r4, #3]
	movs r0, #0x32
	strh r0, [r4, #0x1c]
	b _080096C4
	.align 2, 0
_08009634: .4byte gSamusDataCopy
_08009638: .4byte 0x03001330
_0800963C: .4byte gSamusData
_08009640:
	ldr r1, _08009648 @ =gSamusData
	movs r0, #0xd
	strb r0, [r1, #1]
	b _080096C4
	.align 2, 0
_08009648: .4byte gSamusData
_0800964C:
	ldr r1, _0800965C @ =gSamusData
	movs r0, #0x30
	strb r0, [r1, #1]
	ldr r0, _08009660 @ =gSamusDataCopy
	ldrb r0, [r0, #0xf]
	strb r0, [r1, #0xf]
	b _080096C4
	.align 2, 0
_0800965C: .4byte gSamusData
_08009660: .4byte gSamusDataCopy
_08009664:
	ldr r2, _08009678 @ =gSamusData
	movs r0, #0x32
	strb r0, [r2, #1]
	ldr r1, _0800967C @ =gSamusDataCopy
	ldrb r0, [r1, #0xf]
	strb r0, [r2, #0xf]
	ldrh r0, [r1, #0x10]
	adds r0, #1
	strh r0, [r1, #0x10]
	b _080096C4
	.align 2, 0
_08009678: .4byte gSamusData
_0800967C: .4byte gSamusDataCopy
_08009680:
	ldr r0, _0800969C @ =0x0828FCCC
	ldrh r1, [r0, #4]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	adds r1, r0, #0
	cmp r1, #0
	beq _080096A4
_08009692:
	ldr r1, _080096A0 @ =gSamusData
	movs r0, #7
	strb r0, [r1, #1]
	b _080096C4
	.align 2, 0
_0800969C: .4byte 0x0828FCCC
_080096A0: .4byte gSamusData
_080096A4:
	ldr r0, _080096B8 @ =gSamusDataCopy
	movs r3, #0x1a
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bne _080096C0
_080096AE:
	ldr r1, _080096BC @ =gSamusData
	movs r0, #6
	strb r0, [r1, #1]
	b _080096C4
	.align 2, 0
_080096B8: .4byte gSamusDataCopy
_080096BC: .4byte gSamusData
_080096C0:
	ldr r0, _080096E0 @ =gSamusData
	strb r1, [r0, #1]
_080096C4:
	ldr r0, _080096E0 @ =gSamusData
	ldr r1, _080096E4 @ =gSamusDataCopy
	ldrb r2, [r1, #7]
	strb r2, [r0, #7]
	ldrb r3, [r0, #1]
	adds r4, r1, #0
	adds r1, r0, #0
	cmp r3, #3
	beq _080096EE
	cmp r3, #3
	bgt _080096E8
	cmp r3, #0
	beq _080096FA
	b _08009704
	.align 2, 0
_080096E0: .4byte gSamusData
_080096E4: .4byte gSamusDataCopy
_080096E8:
	cmp r3, #6
	beq _080096FA
	b _08009704
_080096EE:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080096FA
	movs r0, #2
	strb r0, [r1, #7]
_080096FA:
	ldrb r0, [r4, #7]
	cmp r0, #5
	bne _08009704
	movs r0, #3
	strb r0, [r1, #7]
_08009704:
	movs r0, #1
	movs r1, #2
	bl SamusCheckSetNewEnvironmentEffect
_0800970C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SamusSetFreezedPose
SamusSetFreezedPose: @ 0x08009714
	push {lr}
	ldr r0, _0800972C @ =gSamusDataCopy
	ldrb r0, [r0, #1]
	subs r0, #0xc
	cmp r0, #0xf
	bhi _08009780
	lsls r0, r0, #2
	ldr r1, _08009730 @ =_08009734
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800972C: .4byte gSamusDataCopy
_08009730: .4byte _08009734
_08009734: @ jump table
	.4byte _08009774 @ case 0
	.4byte _08009774 @ case 1
	.4byte _08009774 @ case 2
	.4byte _08009780 @ case 3
	.4byte _08009774 @ case 4
	.4byte _08009780 @ case 5
	.4byte _08009774 @ case 6
	.4byte _08009780 @ case 7
	.4byte _08009774 @ case 8
	.4byte _08009780 @ case 9
	.4byte _08009780 @ case 10
	.4byte _08009780 @ case 11
	.4byte _08009780 @ case 12
	.4byte _08009780 @ case 13
	.4byte _08009780 @ case 14
	.4byte _08009774 @ case 15
_08009774:
	ldr r1, _0800977C @ =gSamusData
	movs r0, #0x32
	b _08009784
	.align 2, 0
_0800977C: .4byte gSamusData
_08009780:
	ldr r1, _0800978C @ =gSamusData
	movs r0, #0x30
_08009784:
	strb r0, [r1, #1]
	pop {r0}
	bx r0
	.align 2, 0
_0800978C: .4byte gSamusData

	thumb_func_start SamusSetHurtPose
SamusSetHurtPose: @ 0x08009790
	push {lr}
	ldr r0, _080097B0 @ =gEquipment
	ldrh r2, [r0]
	cmp r2, #0
	beq _08009868
	movs r2, #0
	ldr r0, _080097B4 @ =gSamusDataCopy
	ldrb r0, [r0, #1]
	subs r0, #0xc
	cmp r0, #0xf
	bhi _08009808
	lsls r0, r0, #2
	ldr r1, _080097B8 @ =_080097BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080097B0: .4byte gEquipment
_080097B4: .4byte gSamusDataCopy
_080097B8: .4byte _080097BC
_080097BC: @ jump table
	.4byte _080097FC @ case 0
	.4byte _080097FC @ case 1
	.4byte _080097FC @ case 2
	.4byte _08009808 @ case 3
	.4byte _080097FC @ case 4
	.4byte _08009808 @ case 5
	.4byte _080097FC @ case 6
	.4byte _08009808 @ case 7
	.4byte _080097FC @ case 8
	.4byte _08009808 @ case 9
	.4byte _08009808 @ case 10
	.4byte _08009808 @ case 11
	.4byte _08009808 @ case 12
	.4byte _08009808 @ case 13
	.4byte _08009808 @ case 14
	.4byte _080097FC @ case 15
_080097FC:
	ldr r1, _08009804 @ =gSamusData
	movs r0, #0x12
	b _0800981A
	.align 2, 0
_08009804: .4byte gSamusData
_08009808:
	ldr r0, _0800984C @ =0x0828FCCC
	ldrh r1, [r0, #0xa]
	movs r0, #0
	movs r2, #1
	bl unk_a7b8
	adds r2, r0, #0
	ldr r1, _08009850 @ =gSamusData
	movs r0, #0x11
_0800981A:
	strb r0, [r1, #1]
	ldr r1, _08009854 @ =gSamusDataCopy
	cmp r2, #0
	bne _08009836
	ldr r2, _08009850 @ =gSamusData
	movs r0, #0x60
	strh r0, [r2, #0x1c]
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #2
	bne _08009836
	movs r0, #0x30
	strh r0, [r2, #0x1c]
_08009836:
	ldr r2, _08009850 @ =gSamusData
	ldrb r0, [r1, #7]
	strb r0, [r2, #7]
	ldrh r1, [r1, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800985C
	ldr r0, _08009858 @ =0x0000FFD0
	b _0800985E
	.align 2, 0
_0800984C: .4byte 0x0828FCCC
_08009850: .4byte gSamusData
_08009854: .4byte gSamusDataCopy
_08009858: .4byte 0x0000FFD0
_0800985C:
	movs r0, #0x30
_0800985E:
	strh r0, [r2, #0x1a]
	movs r0, #0x88
	bl unk_3b78
	b _080098AC
_08009868:
	ldr r0, _080098C0 @ =gDisableScrolling
	movs r1, #1
	strb r1, [r0]
	ldr r0, _080098C4 @ =0x03000018
	strb r1, [r0]
	ldr r0, _080098C8 @ =gPoseLock
	strb r2, [r0]
	ldr r2, _080098CC @ =gSamusData
	movs r0, #0x3e
	strb r0, [r2, #1]
	ldr r1, _080098D0 @ =gBg1XPosition
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	strh r0, [r2, #0x1a]
	ldr r1, _080098D4 @ =gBg1YPosition
	subs r3, #0x50
	adds r0, r3, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	ldrh r1, [r2, #0x18]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r2, #0x1c]
	ldr r1, _080098D8 @ =gSubGameMode1
	movs r0, #5
	strh r0, [r1]
_080098AC:
	ldr r1, _080098CC @ =gSamusData
	movs r2, #0
	strb r2, [r1, #9]
	movs r0, #0x30
	strb r0, [r1, #5]
	ldr r0, _080098DC @ =0x030012D8
	strb r2, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_080098C0: .4byte gDisableScrolling
_080098C4: .4byte 0x03000018
_080098C8: .4byte gPoseLock
_080098CC: .4byte gSamusData
_080098D0: .4byte gBg1XPosition
_080098D4: .4byte gBg1YPosition
_080098D8: .4byte gSubGameMode1
_080098DC: .4byte 0x030012D8

	thumb_func_start SamusSetKnockBackPose
SamusSetKnockBackPose: @ 0x080098E0
	push {lr}
	ldr r1, _080098FC @ =gSamusDataCopy
	ldrb r0, [r1, #1]
	subs r0, #0xc
	adds r3, r1, #0
	cmp r0, #0xf
	bhi _08009958
	lsls r0, r0, #2
	ldr r1, _08009900 @ =_08009908
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, _08009904 @ =gSamusData
	mov pc, r0
	.align 2, 0
_080098FC: .4byte gSamusDataCopy
_08009900: .4byte _08009908
_08009904: .4byte gSamusData
_08009908: @ jump table
	.4byte _08009948 @ case 0
	.4byte _08009948 @ case 1
	.4byte _08009948 @ case 2
	.4byte _08009958 @ case 3
	.4byte _08009948 @ case 4
	.4byte _08009958 @ case 5
	.4byte _08009948 @ case 6
	.4byte _08009958 @ case 7
	.4byte _08009968 @ case 8
	.4byte _08009958 @ case 9
	.4byte _08009958 @ case 10
	.4byte _08009958 @ case 11
	.4byte _08009958 @ case 12
	.4byte _08009958 @ case 13
	.4byte _08009958 @ case 14
	.4byte _08009948 @ case 15
_08009948:
	ldr r1, _08009954 @ =gSamusData
	movs r0, #0x14
	strb r0, [r1, #1]
	adds r2, r1, #0
	b _08009968
	.align 2, 0
_08009954: .4byte gSamusData
_08009958:
	ldr r0, _0800998C @ =gSamusData
	movs r1, #0x13
	strb r1, [r0, #1]
	adds r2, r0, #0
	adds r2, #0x22
	movs r1, #5
	strb r1, [r2]
	adds r2, r0, #0
_08009968:
	movs r0, #0x40
	strh r0, [r2, #0x1c]
	adds r0, r3, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #2
	bne _0800997A
	movs r0, #0x20
	strh r0, [r2, #0x1c]
_0800997A:
	ldrb r0, [r3, #7]
	strb r0, [r2, #7]
	ldrh r1, [r3, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08009994
	ldr r0, _08009990 @ =0x0000FFD0
	b _08009996
	.align 2, 0
_0800998C: .4byte gSamusData
_08009990: .4byte 0x0000FFD0
_08009994:
	movs r0, #0x30
_08009996:
	strh r0, [r2, #0x1a]
	movs r0, #0
	strb r0, [r2, #9]
	pop {r0}
	bx r0

	thumb_func_start unk_99a0
unk_99a0: @ 0x080099A0
	push {r4, lr}
	ldr r1, _080099CC @ =gSamusData
	movs r0, #4
	strb r0, [r1, #1]
	movs r3, #1
	strb r3, [r1, #7]
	ldr r0, _080099D0 @ =gSamusDataCopy
	ldrh r2, [r0, #0x1c]
	movs r4, #0x1c
	ldrsh r0, [r0, r4]
	cmp r0, #0
	bge _080099BA
	strh r2, [r1, #0x1c]
_080099BA:
	adds r0, r1, #0
	adds r0, #0x22
	movs r1, #2
	strb r1, [r0]
	ldr r0, _080099D4 @ =gPoseLock
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080099CC: .4byte gSamusData
_080099D0: .4byte gSamusDataCopy
_080099D4: .4byte gPoseLock

	thumb_func_start unk_99d8
unk_99d8: @ 0x080099D8
	push {r4, lr}
	ldr r1, _080099FC @ =gSamusData
	adds r0, r1, #0
	adds r0, #0x20
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0
	bne _08009A20
	ldr r0, _08009A00 @ =gSamusDataCopy
	ldrb r0, [r0, #1]
	cmp r0, #0xe
	bgt _08009A04
	cmp r0, #0xc
	blt _08009A04
	movs r0, #0xd
	strb r0, [r1, #1]
	b _08009A0E
	.align 2, 0
_080099FC: .4byte gSamusData
_08009A00: .4byte gSamusDataCopy
_08009A04:
	movs r1, #0
	strb r1, [r2, #1]
	movs r0, #1
	strb r0, [r2, #7]
	strb r1, [r2, #0xd]
_08009A0E:
	ldr r1, _08009A1C @ =gPreventMovementTimer
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	b _08009A32
	.align 2, 0
_08009A1C: .4byte gPreventMovementTimer
_08009A20:
	ldr r0, _08009A38 @ =gSamusDataCopy
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
_08009A32:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08009A38: .4byte gSamusDataCopy

	thumb_func_start SamusCheckCarryFromCopy
SamusCheckCarryFromCopy: @ 0x08009A3C
	push {lr}
	ldr r0, _08009A54 @ =gSamusData
	ldrb r1, [r0, #1]
	adds r3, r0, #0
	cmp r1, #0x34
	bls _08009A4A
	b _08009D52
_08009A4A:
	lsls r0, r1, #2
	ldr r1, _08009A58 @ =_08009A5C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009A54: .4byte gSamusData
_08009A58: .4byte _08009A5C
_08009A5C: @ jump table
	.4byte _08009B30 @ case 0
	.4byte _08009D4E @ case 1
	.4byte _08009D52 @ case 2
	.4byte _08009B64 @ case 3
	.4byte _08009D52 @ case 4
	.4byte _08009D48 @ case 5
	.4byte _08009D52 @ case 6
	.4byte _08009BA8 @ case 7
	.4byte _08009D4E @ case 8
	.4byte _08009D52 @ case 9
	.4byte _08009D52 @ case 10
	.4byte _08009D52 @ case 11
	.4byte _08009D52 @ case 12
	.4byte _08009BDC @ case 13
	.4byte _08009D52 @ case 14
	.4byte _08009D52 @ case 15
	.4byte _08009BDC @ case 16
	.4byte _08009D52 @ case 17
	.4byte _08009D52 @ case 18
	.4byte _08009D52 @ case 19
	.4byte _08009D52 @ case 20
	.4byte _08009C10 @ case 21
	.4byte _08009D52 @ case 22
	.4byte _08009BEE @ case 23
	.4byte _08009C30 @ case 24
	.4byte _08009D1C @ case 25
	.4byte _08009D52 @ case 26
	.4byte _08009BDC @ case 27
	.4byte _08009D1C @ case 28
	.4byte _08009D52 @ case 29
	.4byte _08009D52 @ case 30
	.4byte _08009C58 @ case 31
	.4byte _08009D36 @ case 32
	.4byte _08009D36 @ case 33
	.4byte _08009D4E @ case 34
	.4byte _08009C74 @ case 35
	.4byte _08009C7C @ case 36
	.4byte _08009D08 @ case 37
	.4byte _08009D36 @ case 38
	.4byte _08009D52 @ case 39
	.4byte _08009D52 @ case 40
	.4byte _08009D52 @ case 41
	.4byte _08009D52 @ case 42
	.4byte _08009D36 @ case 43
	.4byte _08009D52 @ case 44
	.4byte _08009D4E @ case 45
	.4byte _08009D52 @ case 46
	.4byte _08009D52 @ case 47
	.4byte _08009D52 @ case 48
	.4byte _08009D52 @ case 49
	.4byte _08009D52 @ case 50
	.4byte _08009D52 @ case 51
	.4byte _08009D36 @ case 52
_08009B30:
	ldr r1, _08009B60 @ =gSamusDataCopy
	ldrb r2, [r1, #7]
	strb r2, [r3, #7]
	ldrb r0, [r3, #0xc]
	cmp r0, #0
	bne _08009B42
	ldrb r0, [r3, #9]
	cmp r0, #0
	beq _08009B4C
_08009B42:
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _08009B4C
	movs r0, #1
	strb r0, [r3, #7]
_08009B4C:
	ldrb r0, [r1, #1]
	cmp r0, #7
	beq _08009B58
	cmp r0, #9
	beq _08009B58
	b _08009D70
_08009B58:
	ldrb r0, [r1, #0xf]
	strb r0, [r3, #0xf]
	b _08009D70
	.align 2, 0
_08009B60: .4byte gSamusDataCopy
_08009B64:
	ldrb r0, [r3, #0xe]
	adds r0, #1
	strb r0, [r3, #0xe]
	ldrb r0, [r3, #0xc]
	cmp r0, #0
	bne _08009B86
	ldrb r0, [r3, #9]
	cmp r0, #0
	bne _08009B86
	ldr r0, _08009B9C @ =gButtonInput
	ldr r1, _08009BA0 @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _08009B86
	b _08009D70
_08009B86:
	ldr r0, _08009BA4 @ =gSamusDataCopy
	ldrb r0, [r0, #7]
	strb r0, [r3, #7]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08009B98
	b _08009D70
_08009B98:
	b _08009D6C
	.align 2, 0
_08009B9C: .4byte gButtonInput
_08009BA0: .4byte gButtonAssignments
_08009BA4: .4byte gSamusDataCopy
_08009BA8:
	ldr r0, _08009BD8 @ =gSamusDataCopy
	ldrb r1, [r0, #7]
	strb r1, [r3, #7]
	adds r1, r3, #0
	adds r1, #0x22
	movs r2, #1
	strb r2, [r1]
	ldrb r0, [r0, #7]
	cmp r0, #3
	bls _08009BBE
	strb r2, [r3, #7]
_08009BBE:
	ldrb r0, [r3, #0xc]
	cmp r0, #0
	bne _08009BCC
	ldrb r0, [r3, #9]
	cmp r0, #0
	bne _08009BCC
	b _08009D70
_08009BCC:
	ldrb r0, [r3, #7]
	cmp r0, #0
	beq _08009BD4
	b _08009D70
_08009BD4:
	strb r2, [r3, #7]
	b _08009D70
	.align 2, 0
_08009BD8: .4byte gSamusDataCopy
_08009BDC:
	ldrb r0, [r3, #0xc]
	cmp r0, #0x3f
	bls _08009BE6
	movs r0, #5
	strb r0, [r3, #9]
_08009BE6:
	movs r0, #0
	strb r0, [r3, #0xc]
	strb r0, [r3, #0xd]
	b _08009D70
_08009BEE:
	movs r0, #0
	strb r0, [r3, #0xc]
	ldrh r1, [r3, #0x14]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08009C00
	movs r0, #4
	b _08009C02
_08009C00:
	ldr r0, _08009C0C @ =0x0000FFFC
_08009C02:
	strh r0, [r3, #0x1c]
	movs r0, #0xfc
	bl PlaySound
	b _08009D70
	.align 2, 0
_08009C0C: .4byte 0x0000FFFC
_08009C10:
	ldr r1, _08009C2C @ =gSamusDataCopy
	ldrb r0, [r1, #7]
	strb r0, [r3, #7]
	ldrb r0, [r1, #1]
	cmp r0, #0xb
	beq _08009C22
	cmp r0, #0x16
	beq _08009C22
	b _08009D70
_08009C22:
	ldrb r0, [r3, #3]
	adds r0, #1
	strb r0, [r3, #3]
	b _08009D70
	.align 2, 0
_08009C2C: .4byte gSamusDataCopy
_08009C30:
	ldrh r1, [r3, #0x18]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0x1e
	bhi _08009C48
	ldr r0, _08009C44 @ =0x0000FFC0
	ands r0, r1
	adds r0, #0xb
	strh r0, [r3, #0x18]
	b _08009D70
	.align 2, 0
_08009C44: .4byte 0x0000FFC0
_08009C48:
	ldr r0, _08009C54 @ =0x0000FFC0
	ands r0, r1
	adds r0, #0x4b
	strh r0, [r3, #0x18]
	b _08009D70
	.align 2, 0
_08009C54: .4byte 0x0000FFC0
_08009C58:
	ldr r0, _08009C70 @ =gSamusDataCopy
	ldrh r0, [r0, #0x1a]
	strh r0, [r3, #0x1a]
	movs r0, #0
	movs r1, #1
	bl SamusCheckSetNewEnvironmentEffect
	movs r0, #0x6c
	bl PlaySound
	b _08009D70
	.align 2, 0
_08009C70: .4byte gSamusDataCopy
_08009C74:
	movs r0, #0x99
	bl PlaySound
	b _08009D70
_08009C7C:
	ldr r0, _08009C9C @ =gButtonInput
	ldr r1, _08009CA0 @ =gButtonAssignments
	ldrh r2, [r0]
	ldrh r0, [r1, #2]
	ands r0, r2
	cmp r0, #0
	beq _08009CB4
	movs r0, #2
	strb r0, [r3, #3]
	ldrh r1, [r3, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08009CA4
	movs r0, #0xa0
	b _08009CA6
	.align 2, 0
_08009C9C: .4byte gButtonInput
_08009CA0: .4byte gButtonAssignments
_08009CA4:
	ldr r0, _08009CB0 @ =0x0000FF60
_08009CA6:
	strh r0, [r3, #0x1a]
	movs r0, #0x60
	strh r0, [r3, #0x1c]
	b _08009CEC
	.align 2, 0
_08009CB0: .4byte 0x0000FF60
_08009CB4:
	ldrh r1, [r3, #0x12]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08009CF8
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08009CD6
	movs r0, #2
	strb r0, [r3, #3]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08009CA4
	movs r0, #0xa0
	b _08009CA6
_08009CD6:
	ldrb r0, [r3, #3]
	adds r0, #1
	strb r0, [r3, #3]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08009CE8
	movs r0, #0xc0
	b _08009CEA
_08009CE8:
	ldr r0, _08009CF4 @ =0x0000FF40
_08009CEA:
	strh r0, [r3, #0x1a]
_08009CEC:
	ldrb r0, [r3, #6]
	adds r0, #1
	strb r0, [r3, #6]
	b _08009CFC
	.align 2, 0
_08009CF4: .4byte 0x0000FF40
_08009CF8:
	movs r0, #0xc0
	strh r0, [r3, #0x1c]
_08009CFC:
	ldr r1, _08009D04 @ =0x030012D8
	movs r0, #0
	strb r0, [r1, #4]
	b _08009D70
	.align 2, 0
_08009D04: .4byte 0x030012D8
_08009D08:
	ldr r0, _08009D18 @ =gSamusDataCopy
	ldrb r0, [r0, #3]
	strb r0, [r3, #3]
	movs r0, #0x9a
	bl PlaySound
	b _08009D70
	.align 2, 0
_08009D18: .4byte gSamusDataCopy
_08009D1C:
	ldr r0, _08009D2C @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _08009D30
	movs r0, #0x96
	bl PlaySound
	b _08009D36
	.align 2, 0
_08009D2C: .4byte 0x03001330
_08009D30:
	movs r0, #0x85
	bl PlaySound
_08009D36:
	ldr r0, _08009D44 @ =gSamusData
	movs r2, #0
	movs r1, #1
	strb r1, [r0, #7]
	strb r2, [r0, #0xd]
	b _08009D70
	.align 2, 0
_08009D44: .4byte gSamusData
_08009D48:
	ldr r0, _08009D74 @ =gSamusDataCopy
	ldrh r0, [r0, #0x1c]
	strh r0, [r3, #0x1c]
_08009D4E:
	movs r0, #1
	strb r0, [r3, #2]
_08009D52:
	adds r1, r3, #0
	ldr r0, _08009D74 @ =gSamusDataCopy
	ldrb r2, [r0, #7]
	strb r2, [r1, #7]
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _08009D66
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _08009D70
_08009D66:
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _08009D70
_08009D6C:
	movs r0, #1
	strb r0, [r3, #7]
_08009D70:
	pop {r0}
	bx r0
	.align 2, 0
_08009D74: .4byte gSamusDataCopy

	thumb_func_start SamusUpdateVelocityPosition
SamusUpdateVelocityPosition: @ 0x08009D78
	push {r4, r5, lr}
	ldr r4, _08009DC0 @ =0x03001320
	ldr r2, _08009DC4 @ =0x0828D794
	ldr r3, _08009DC8 @ =gSamusData
	ldrb r1, [r3, #1]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r1, r2, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #9]
	ldrb r1, [r3, #1]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r1, r2, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0xa]
	ldrb r1, [r3, #1]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, #3
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r4, #0xb]
	movs r2, #0
	ldrb r0, [r3, #1]
	subs r0, #4
	cmp r0, #0x2f
	bls _08009DB6
	b _08009EF4
_08009DB6:
	lsls r0, r0, #2
	ldr r1, _08009DCC @ =_08009DD0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009DC0: .4byte 0x03001320
_08009DC4: .4byte 0x0828D794
_08009DC8: .4byte gSamusData
_08009DCC: .4byte _08009DD0
_08009DD0: @ jump table
	.4byte _08009E90 @ case 0
	.4byte _08009E90 @ case 1
	.4byte _08009EF4 @ case 2
	.4byte _08009EF4 @ case 3
	.4byte _08009EF4 @ case 4
	.4byte _08009EF4 @ case 5
	.4byte _08009E90 @ case 6
	.4byte _08009E90 @ case 7
	.4byte _08009EF4 @ case 8
	.4byte _08009EF4 @ case 9
	.4byte _08009EF4 @ case 10
	.4byte _08009EF4 @ case 11
	.4byte _08009E90 @ case 12
	.4byte _08009E90 @ case 13
	.4byte _08009E90 @ case 14
	.4byte _08009E90 @ case 15
	.4byte _08009E90 @ case 16
	.4byte _08009EF4 @ case 17
	.4byte _08009E90 @ case 18
	.4byte _08009EEC @ case 19
	.4byte _08009EF4 @ case 20
	.4byte _08009EF4 @ case 21
	.4byte _08009EF4 @ case 22
	.4byte _08009EF4 @ case 23
	.4byte _08009EF4 @ case 24
	.4byte _08009E90 @ case 25
	.4byte _08009E90 @ case 26
	.4byte _08009EF4 @ case 27
	.4byte _08009EF4 @ case 28
	.4byte _08009EF4 @ case 29
	.4byte _08009EF4 @ case 30
	.4byte _08009EF4 @ case 31
	.4byte _08009ED6 @ case 32
	.4byte _08009EF4 @ case 33
	.4byte _08009EEC @ case 34
	.4byte _08009EF4 @ case 35
	.4byte _08009EF4 @ case 36
	.4byte _08009EF4 @ case 37
	.4byte _08009EF4 @ case 38
	.4byte _08009EF4 @ case 39
	.4byte _08009EF4 @ case 40
	.4byte _08009EF4 @ case 41
	.4byte _08009EF4 @ case 42
	.4byte _08009EF4 @ case 43
	.4byte _08009EF4 @ case 44
	.4byte _08009E90 @ case 45
	.4byte _08009EF4 @ case 46
	.4byte _08009E90 @ case 47
_08009E90:
	ldr r0, _08009EA4 @ =0x03001330
	ldrh r1, [r3, #0x1c]
	ldrh r2, [r0, #4]
	lsls r4, r1, #0x10
	lsls r2, r2, #0x10
	adds r5, r0, #0
	cmp r4, r2
	ble _08009EA8
	asrs r0, r2, #0x13
	b _08009EBC
	.align 2, 0
_08009EA4: .4byte 0x03001330
_08009EA8:
	movs r0, #0x1c
	ldrsh r1, [r3, r0]
	movs r2, #4
	ldrsh r0, [r5, r2]
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08009EBA
	lsls r0, r0, #0xd
	b _08009EBE
_08009EBA:
	asrs r0, r4, #0x13
_08009EBC:
	lsls r0, r0, #0x10
_08009EBE:
	lsrs r2, r0, #0x10
	ldrh r4, [r3, #0x1c]
	movs r0, #0x1c
	ldrsh r1, [r3, r0]
	movs r0, #0xdc
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08009EEE
	ldrh r0, [r5, #2]
	subs r0, r4, r0
	strh r0, [r3, #0x1c]
	b _08009EEE
_08009ED6:
	ldrb r1, [r3, #3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08009EF4
	ldrh r0, [r3, #0x1c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08009EEE
_08009EEC:
	ldrh r2, [r3, #0x1c]
_08009EEE:
	ldrh r0, [r3, #0x18]
	subs r0, r0, r2
	strh r0, [r3, #0x18]
_08009EF4:
	ldr r4, _08009F28 @ =gSamusData
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08009F36
	bl SamusChangeVelocityOnSlope
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrb r0, [r4, #1]
	cmp r0, #3
	bne _08009F48
	ldrh r1, [r4, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08009F2C
	lsls r0, r2, #0x10
	cmp r0, #0
	bge _08009F48
	movs r2, #0
	b _08009F48
	.align 2, 0
_08009F28: .4byte gSamusData
_08009F2C:
	lsls r0, r2, #0x10
	cmp r0, #0
	ble _08009F48
	movs r2, #0
	b _08009F48
_08009F36:
	ldr r0, _08009F58 @ =0x03004810
	ldrb r0, [r0]
	cmp r0, #0
	bne _08009F48
	ldrh r0, [r4, #0x1a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08009F48:
	ldr r1, _08009F5C @ =gSamusData
	ldrh r0, [r1, #0x16]
	adds r0, r0, r2
	strh r0, [r1, #0x16]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08009F58: .4byte 0x03004810
_08009F5C: .4byte gSamusData

	thumb_func_start SamusCheckScrewSpeedboosterAffectingEnvironment
SamusCheckScrewSpeedboosterAffectingEnvironment: @ 0x08009F60
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	ldr r6, _08009FF8 @ =gSamusData
	ldrb r0, [r6, #1]
	cmp r0, #0x1e
	bne _08009F74
	movs r7, #2
_08009F74:
	ldrb r0, [r6, #6]
	cmp r0, #0
	beq _08009F80
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
_08009F80:
	cmp r7, #0
	beq _0800A042
	ldr r0, _08009FFC @ =0x03001320
	mov sb, r0
	ldrb r0, [r0, #9]
	ldr r3, _0800A000 @ =0x0828FCCC
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r0, r1, r3
	ldrh r2, [r6, #0x16]
	ldrh r0, [r0]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r3, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	adds r3, #4
	adds r1, r1, r3
	ldrh r0, [r1]
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r6, [r6, #0x18]
	mov r0, r8
	adds r1, r5, #0
	adds r2, r7, #0
	bl SamusApplyScrewSpeedboosterDamageToEnvironment
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl SamusApplyScrewSpeedboosterDamageToEnvironment
	mov r0, sb
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800A004
	adds r1, r5, #0
	adds r1, #0x40
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	adds r2, r7, #0
	bl SamusApplyScrewSpeedboosterDamageToEnvironment
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl SamusApplyScrewSpeedboosterDamageToEnvironment
	b _0800A01E
	.align 2, 0
_08009FF8: .4byte gSamusData
_08009FFC: .4byte 0x03001320
_0800A000: .4byte 0x0828FCCC
_0800A004:
	adds r1, r5, #0
	adds r1, #0x40
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, r8
	adds r2, r7, #0
	bl SamusApplyScrewSpeedboosterDamageToEnvironment
	mov r0, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl SamusApplyScrewSpeedboosterDamageToEnvironment
_0800A01E:
	ldr r0, _0800A050 @ =0x03001320
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800A02E
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r7, #4
_0800A02E:
	mov r0, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl SamusApplyScrewSpeedboosterDamageToEnvironment
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl SamusApplyScrewSpeedboosterDamageToEnvironment
_0800A042:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A050: .4byte 0x03001320

	thumb_func_start SamusCheckCollisions
SamusCheckCollisions: @ 0x0800A054
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	ldr r4, _0800A0A0 @ =0x03001320
	ldr r2, _0800A0A4 @ =0x0828D794
	ldr r5, _0800A0A8 @ =gSamusData
	ldrb r1, [r5, #1]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, #4
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r4, #8]
	cmp r0, #3
	bne _0800A0AC
	ldrb r0, [r5, #1]
	cmp r0, #0x1a
	beq _0800A07E
	b _0800A4CC
_0800A07E:
	ldrh r0, [r5, #0x16]
	ldrh r1, [r5, #0x18]
	mov r4, sp
	adds r4, #6
	add r2, sp, #8
	str r2, [sp]
	add r2, sp, #4
	adds r3, r4, #0
	bl SamusSlopeRelated
	cmp r0, #0
	bne _0800A098
	b _0800A4CC
_0800A098:
	strh r0, [r5, #0x1e]
	ldrh r0, [r4]
	strh r0, [r5, #0x18]
	b _0800A4CC
	.align 2, 0
_0800A0A0: .4byte 0x03001320
_0800A0A4: .4byte 0x0828D794
_0800A0A8: .4byte gSamusData
_0800A0AC:
	bl SamusCheckScrewSpeedboosterAffectingEnvironment
	movs r0, #0xff
	mov sb, r0
	ldrh r1, [r4, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800A0C4
	bl SamusCheckJumpingCollisions
	b _0800A104
_0800A0C4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800A0D2
	bl SamusCheckLandingCollision
	b _0800A104
_0800A0D2:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800A0FA
	ldrb r0, [r4, #8]
	cmp r0, #2
	bne _0800A0E4
	bl SamusCheckLandingCollision
	b _0800A104
_0800A0E4:
	bl SamusCheckWalkingSidesCollision
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0xff
	beq _0800A0F4
	b _0800A386
_0800A0F4:
	bl unk_b3c8
	b _0800A104
_0800A0FA:
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0800A10A
	bl SamusCheckStandingOnGroundCollision
_0800A104:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0800A10A:
	mov r1, sb
	cmp r1, #0xff
	beq _0800A112
	b _0800A386
_0800A112:
	ldr r0, _0800A1AC @ =gButtonInput
	ldr r7, _0800A1B0 @ =gSamusData
	ldrh r0, [r0]
	ldrh r1, [r7, #0x12]
	ands r0, r1
	cmp r0, #0
	bne _0800A122
	b _0800A29A
_0800A122:
	movs r2, #0x1c
	ldrsh r0, [r7, r2]
	cmp r0, #0
	ble _0800A12C
	b _0800A29A
_0800A12C:
	movs r0, #0x10
	ands r0, r1
	ldr r1, _0800A1B4 @ =0x0000FFE1
	mov r8, r1
	cmp r0, #0
	beq _0800A13C
	movs r2, #0x1f
	mov r8, r2
_0800A13C:
	ldrh r0, [r7, #0x18]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r7, #0x16]
	bl ProcessClipdataForSamus
	adds r5, r0, #0
	cmp r5, #0
	beq _0800A152
	b _0800A29A
_0800A152:
	ldrh r0, [r7, #0x18]
	subs r0, #0xa0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r7, #0x16]
	bl ProcessClipdataForSamus
	adds r5, r0, #0
	movs r4, #0x80
	lsls r4, r4, #0x11
	ands r5, r4
	ldrh r0, [r7, #0x18]
	subs r0, #0x70
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r7, #0x16]
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	adds r6, r0, #0
	ands r6, r4
	ldrh r0, [r7, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r7, #0x16]
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ProcessClipdataForSamus
	adds r2, r0, #0
	ands r2, r4
	ldrb r0, [r7, #1]
	subs r0, #4
	cmp r0, #0x1a
	bls _0800A1A2
	b _0800A29A
_0800A1A2:
	lsls r0, r0, #2
	ldr r1, _0800A1B8 @ =_0800A1BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A1AC: .4byte gButtonInput
_0800A1B0: .4byte gSamusData
_0800A1B4: .4byte 0x0000FFE1
_0800A1B8: .4byte _0800A1BC
_0800A1BC: @ jump table
	.4byte _0800A228 @ case 0
	.4byte _0800A29A @ case 1
	.4byte _0800A29A @ case 2
	.4byte _0800A29A @ case 3
	.4byte _0800A29A @ case 4
	.4byte _0800A29A @ case 5
	.4byte _0800A228 @ case 6
	.4byte _0800A228 @ case 7
	.4byte _0800A29A @ case 8
	.4byte _0800A29A @ case 9
	.4byte _0800A29A @ case 10
	.4byte _0800A29A @ case 11
	.4byte _0800A29A @ case 12
	.4byte _0800A29A @ case 13
	.4byte _0800A29A @ case 14
	.4byte _0800A29A @ case 15
	.4byte _0800A29A @ case 16
	.4byte _0800A228 @ case 17
	.4byte _0800A228 @ case 18
	.4byte _0800A29A @ case 19
	.4byte _0800A29A @ case 20
	.4byte _0800A29A @ case 21
	.4byte _0800A29A @ case 22
	.4byte _0800A29A @ case 23
	.4byte _0800A29A @ case 24
	.4byte _0800A228 @ case 25
	.4byte _0800A228 @ case 26
_0800A228:
	cmp r5, #0
	bne _0800A252
	cmp r6, #0
	beq _0800A252
	cmp r2, #0
	bne _0800A252
	movs r0, #0x18
	mov sb, r0
	ldr r0, _0800A248 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A24C
	movs r0, #0x97
	bl PlaySound
	b _0800A252
	.align 2, 0
_0800A248: .4byte 0x03001330
_0800A24C:
	movs r0, #0x82
	bl PlaySound
_0800A252:
	mov r1, sb
	cmp r1, #0xff
	beq _0800A25A
	b _0800A386
_0800A25A:
	ldr r1, _0800A28C @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x7c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ClipdataUpdateCurrentAffecting
	asrs r1, r0, #0x10
	cmp r1, #3
	bne _0800A29A
	movs r2, #0x26
	mov sb, r2
	ldr r0, _0800A290 @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A294
	movs r0, #0x97
	bl PlaySound
	b _0800A29A
	.align 2, 0
_0800A28C: .4byte gSamusData
_0800A290: .4byte 0x03001330
_0800A294:
	movs r0, #0x83
	bl PlaySound
_0800A29A:
	mov r0, sb
	cmp r0, #0xff
	bne _0800A386
	ldr r0, _0800A2B4 @ =gSamusData
	ldrb r0, [r0, #1]
	subs r0, #4
	cmp r0, #0x1a
	bhi _0800A386
	lsls r0, r0, #2
	ldr r1, _0800A2B8 @ =_0800A2BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A2B4: .4byte gSamusData
_0800A2B8: .4byte _0800A2BC
_0800A2BC: @ jump table
	.4byte _0800A328 @ case 0
	.4byte _0800A386 @ case 1
	.4byte _0800A386 @ case 2
	.4byte _0800A386 @ case 3
	.4byte _0800A386 @ case 4
	.4byte _0800A386 @ case 5
	.4byte _0800A328 @ case 6
	.4byte _0800A328 @ case 7
	.4byte _0800A386 @ case 8
	.4byte _0800A386 @ case 9
	.4byte _0800A386 @ case 10
	.4byte _0800A386 @ case 11
	.4byte _0800A386 @ case 12
	.4byte _0800A386 @ case 13
	.4byte _0800A386 @ case 14
	.4byte _0800A386 @ case 15
	.4byte _0800A386 @ case 16
	.4byte _0800A328 @ case 17
	.4byte _0800A328 @ case 18
	.4byte _0800A386 @ case 19
	.4byte _0800A386 @ case 20
	.4byte _0800A386 @ case 21
	.4byte _0800A386 @ case 22
	.4byte _0800A386 @ case 23
	.4byte _0800A386 @ case 24
	.4byte _0800A328 @ case 25
	.4byte _0800A328 @ case 26
_0800A328:
	ldr r0, _0800A370 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0800A386
	ldr r4, _0800A374 @ =gSamusData
	movs r1, #0x1c
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0800A386
	ldrh r0, [r4, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	bl ClipdataUpdateCurrentAffecting
	asrs r1, r0, #0x10
	cmp r1, #5
	bne _0800A386
	ldrh r1, [r4, #0x18]
	ldr r0, _0800A378 @ =0x0000FFC0
	ands r0, r1
	adds r0, #0x48
	strh r0, [r4, #0x18]
	movs r2, #0x2b
	mov sb, r2
	ldr r0, _0800A37C @ =0x03001330
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800A380
	movs r0, #0x97
	bl PlaySound
	b _0800A386
	.align 2, 0
_0800A370: .4byte gButtonInput
_0800A374: .4byte gSamusData
_0800A378: .4byte 0x0000FFC0
_0800A37C: .4byte 0x03001330
_0800A380:
	movs r0, #0x84
	bl PlaySound
_0800A386:
	ldr r0, _0800A3FC @ =gSamusData
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #0x26
	bne _0800A42E
	ldrh r1, [r5, #0x12]
	movs r0, #0x10
	ands r0, r1
	ldr r1, _0800A400 @ =0x0000FFE0
	mov r8, r1
	cmp r0, #0
	beq _0800A3A2
	movs r2, #0x20
	mov r8, r2
_0800A3A2:
	ldrh r0, [r5, #0x18]
	subs r0, #0x7c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #0x16]
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl ClipdataUpdateCurrentAffecting
	asrs r1, r0, #0x10
	ldr r4, _0800A404 @ =0x03001320
	ldrh r2, [r4, #2]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0800A410
	cmp r1, #3
	beq _0800A42E
	mov r2, sp
	adds r2, #6
	ldr r3, _0800A408 @ =0x0828FCCC
	ldrb r1, [r4, #9]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r3, #4
	adds r0, r0, r3
	ldrh r1, [r0]
	ldrh r0, [r5, #0x18]
	adds r1, r1, r0
	strh r1, [r2]
	ldr r0, _0800A40C @ =0x0000FFC0
	ands r1, r0
	ldrb r2, [r4, #9]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	subs r1, r1, r0
	adds r1, #0x40
	strh r1, [r5, #0x18]
	b _0800A42E
	.align 2, 0
_0800A3FC: .4byte gSamusData
_0800A400: .4byte 0x0000FFE0
_0800A404: .4byte 0x03001320
_0800A408: .4byte 0x0828FCCC
_0800A40C: .4byte 0x0000FFC0
_0800A410:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0800A42E
	ldr r0, _0800A484 @ =gPreviousXPosition
	ldrh r0, [r0]
	strh r0, [r5, #0x16]
	cmp r1, #3
	beq _0800A42E
	movs r1, #0xfe
	mov sb, r1
	ldr r0, _0800A488 @ =gPreviousYPosition
	ldrh r0, [r0]
	adds r0, #1
	strh r0, [r5, #0x18]
_0800A42E:
	ldrb r0, [r5, #1]
	cmp r0, #0x2c
	bne _0800A464
	ldrh r0, [r5, #0x18]
	subs r0, #0x90
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #0x16]
	bl ClipdataUpdateCurrentAffecting
	asrs r1, r0, #0x10
	cmp r1, #5
	beq _0800A464
	ldrh r1, [r5, #0x12]
	movs r0, #0x10
	ands r0, r1
	movs r2, #0x40
	mov r8, r2
	cmp r0, #0
	beq _0800A45A
	ldr r0, _0800A48C @ =0x0000FFFF
	mov r8, r0
_0800A45A:
	ldrh r1, [r5, #0x16]
	ldr r0, _0800A490 @ =0x0000FFC0
	ands r0, r1
	add r0, r8
	strh r0, [r5, #0x16]
_0800A464:
	ldr r0, _0800A494 @ =0x03001320
	ldrb r1, [r0, #0xc]
	adds r2, r0, #0
	cmp r1, #0
	beq _0800A4AC
	ldr r0, _0800A498 @ =gSamusData
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #0x16
	beq _0800A4A0
	cmp r1, #0x16
	bgt _0800A49C
	cmp r1, #0xb
	beq _0800A4A0
	b _0800A4AC
	.align 2, 0
_0800A484: .4byte gPreviousXPosition
_0800A488: .4byte gPreviousYPosition
_0800A48C: .4byte 0x0000FFFF
_0800A490: .4byte 0x0000FFC0
_0800A494: .4byte 0x03001320
_0800A498: .4byte gSamusData
_0800A49C:
	cmp r1, #0x1e
	bne _0800A4AC
_0800A4A0:
	movs r0, #6
	strb r0, [r5, #4]
	ldrh r0, [r5, #0x12]
	movs r1, #0x30
	eors r0, r1
	strh r0, [r5, #0x10]
_0800A4AC:
	ldrb r0, [r2, #8]
	cmp r0, #0xff
	beq _0800A4CC
	mov r1, sb
	cmp r1, #0xff
	beq _0800A4BE
	mov r0, sb
	bl SetSamusPose
_0800A4BE:
	mov r2, sb
	cmp r2, #0xfe
	bne _0800A4CC
	ldr r1, _0800A4DC @ =gSamusData
	ldrh r0, [r1, #0x18]
	adds r0, #1
	strh r0, [r1, #0x18]
_0800A4CC:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800A4DC: .4byte gSamusData

	thumb_func_start SamusSlopeRelated
SamusSlopeRelated: @ 0x0800A4E0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r2
	adds r7, r3, #0
	ldr r4, [sp, #0x18]
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	adds r0, r6, #0
	adds r1, r5, #0
	bl ProcessClipdataForSamus
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0800A50A
	movs r0, #1
_0800A50A:
	strh r0, [r4]
	movs r0, #0xff
	ands r0, r1
	subs r0, #2
	cmp r0, #0xa
	bls _0800A518
	b _0800A650
_0800A518:
	lsls r0, r0, #2
	ldr r1, _0800A524 @ =_0800A528
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800A524: .4byte _0800A528
_0800A528: @ jump table
	.4byte _0800A5D8 @ case 0
	.4byte _0800A554 @ case 1
	.4byte _0800A624 @ case 2
	.4byte _0800A5F8 @ case 3
	.4byte _0800A580 @ case 4
	.4byte _0800A5A8 @ case 5
	.4byte _0800A650 @ case 6
	.4byte _0800A650 @ case 7
	.4byte _0800A650 @ case 8
	.4byte _0800A650 @ case 9
	.4byte _0800A64C @ case 10
_0800A554:
	ldr r3, _0800A57C @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r5, #0
	ands r0, r2
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r5, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	movs r0, #0x11
	b _0800A65C
	.align 2, 0
_0800A57C: .4byte 0x0000FFC0
_0800A580:
	ldr r3, _0800A5A4 @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r5, #0
	ands r0, r2
	lsrs r0, r0, #1
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r5, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	subs r0, #0x7e
	b _0800A5CA
	.align 2, 0
_0800A5A4: .4byte 0x0000FFC0
_0800A5A8:
	ldr r3, _0800A5D4 @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r5, #0
	ands r0, r2
	lsrs r0, r0, #1
	subs r0, #0x1f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r5, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	subs r0, #0x3e
_0800A5CA:
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	movs r0, #0x12
	b _0800A65C
	.align 2, 0
_0800A5D4: .4byte 0x0000FFC0
_0800A5D8:
	ldr r2, _0800A5F4 @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r2
	movs r1, #0x3f
	adds r0, r5, #0
	ands r0, r1
	orrs r4, r0
	adds r3, r5, #0
	ands r3, r2
	adds r0, r6, #0
	ands r0, r1
	orrs r3, r0
	movs r0, #0x21
	b _0800A65C
	.align 2, 0
_0800A5F4: .4byte 0x0000FFC0
_0800A5F8:
	ldr r3, _0800A61C @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r3
	movs r2, #0x3f
	adds r0, r5, #0
	ands r0, r2
	lsrs r0, r0, #1
	adds r0, #0x1f
	orrs r4, r0
	adds r1, r5, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	ldr r2, _0800A620 @ =0x0000FFC1
	adds r0, r0, r2
	b _0800A63E
	.align 2, 0
_0800A61C: .4byte 0x0000FFC0
_0800A620: .4byte 0x0000FFC1
_0800A624:
	ldr r3, _0800A648 @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r3
	movs r2, #0x3f
	adds r0, r5, #0
	ands r0, r2
	lsrs r0, r0, #1
	orrs r4, r0
	adds r1, r5, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
_0800A63E:
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	movs r0, #0x22
	b _0800A65C
	.align 2, 0
_0800A648: .4byte 0x0000FFC0
_0800A64C:
	movs r0, #0x10
	strh r0, [r4]
_0800A650:
	ldr r0, _0800A66C @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r0
	adds r3, r5, #0
	ands r3, r0
	movs r0, #0
_0800A65C:
	strh r4, [r7]
	mov r1, r8
	strh r3, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A66C: .4byte 0x0000FFC0

	thumb_func_start unk_a670
unk_a670: @ 0x0800A670
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp]
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r0, #0
	mov r8, r0
	ldr r3, _0800A7A8 @ =gSamusData
	ldr r2, _0800A7AC @ =0x0828FCCC
	ldr r0, _0800A7B0 @ =0x03001320
	ldrb r0, [r0, #4]
	lsls r0, r0, #1
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r4, [r3, #0x16]
	adds r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r2, #4
	adds r1, r1, r2
	ldrh r0, [r1]
	ldrh r3, [r3, #0x18]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	adds r1, r7, #0
	bl ProcessClipdataForSamus
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0800A6DC
	movs r0, #0xff
	ands r0, r1
	cmp r0, #7
	bgt _0800A6D8
	cmp r0, #2
	bge _0800A6DC
_0800A6D8:
	movs r0, #1
	mov r8, r0
_0800A6DC:
	ldr r1, [sp, #4]
	lsls r3, r1, #0x10
	asrs r4, r3, #0x10
	ldr r1, _0800A7AC @ =0x0828FCCC
	lsls r2, r6, #1
	adds r0, r2, r6
	lsls r0, r0, #1
	adds r1, #4
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r0, #0x40
	mov sl, r2
	mov sb, r3
	cmp r4, r0
	ble _0800A728
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	adds r1, r7, #0
	bl ProcessClipdataForSamus
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0800A728
	movs r0, #0xff
	ands r0, r1
	cmp r0, #7
	bgt _0800A724
	cmp r0, #2
	bge _0800A728
_0800A724:
	movs r2, #2
	add r8, r2
_0800A728:
	ldr r1, _0800A7AC @ =0x0828FCCC
	mov r4, sl
	adds r0, r4, r6
	lsls r0, r0, #1
	adds r1, #4
	adds r0, r0, r1
	mov r2, sb
	asrs r1, r2, #0x10
	movs r4, #0
	ldrsh r0, [r0, r4]
	cmp r1, r0
	ble _0800A770
	ldr r0, _0800A7A8 @ =gSamusData
	ldrh r0, [r0, #0x18]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r5, #0
	adds r1, r7, #0
	bl ProcessClipdataForSamus
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0800A770
	movs r0, #0xff
	ands r0, r1
	cmp r0, #7
	bgt _0800A76C
	cmp r0, #2
	bge _0800A770
_0800A76C:
	movs r2, #4
	add r8, r2
_0800A770:
	mov r4, r8
	cmp r4, #0
	beq _0800A796
	ldr r1, _0800A7B4 @ =0x0000FFC0
	ands r1, r7
	ldr r3, _0800A7AC @ =0x0828FCCC
	ldr r2, _0800A7B0 @ =0x03001320
	mov r4, sl
	adds r0, r4, r6
	ldrb r4, [r2, #4]
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	subs r1, r1, r0
	ldrh r2, [r2, #6]
	adds r1, r1, r2
	ldr r0, [sp]
	strh r1, [r0]
_0800A796:
	mov r0, r8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A7A8: .4byte gSamusData
_0800A7AC: .4byte 0x0828FCCC
_0800A7B0: .4byte 0x03001320
_0800A7B4: .4byte 0x0000FFC0

	thumb_func_start unk_a7b8
unk_a7b8: @ 0x0800A7B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x18
	movs r0, #0
	mov sb, r0
	cmp r2, #0
	bne _0800A82C
	ldr r0, _0800A8F0 @ =gPreviousYPosition
	ldrh r0, [r0]
	add r0, sl
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _0800A8F4 @ =gSamusData
	mov r8, r1
	ldr r4, _0800A8F8 @ =0x0828FCF6
	ldr r2, [sp]
	lsls r5, r2, #3
	adds r0, r5, r4
	ldrh r0, [r0]
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	movs r6, #0x80
	lsls r6, r6, #0x11
	ands r0, r6
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sb, r0
	adds r4, #6
	adds r5, r5, r4
	ldrh r0, [r5]
	mov r2, r8
	ldrh r2, [r2, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	ands r0, r6
	cmp r0, #0
	beq _0800A82C
	movs r0, #8
	add sb, r0
_0800A82C:
	movs r4, #0
	ldr r1, _0800A8F4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	add r0, sl
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #1
	mov r2, sb
	ands r0, r2
	ldr r1, [sp]
	lsls r5, r1, #3
	cmp r0, #0
	bne _0800A866
	ldr r0, _0800A8F8 @ =0x0828FCF6
	adds r0, r5, r0
	ldrh r0, [r0]
	ldr r2, _0800A8F4 @ =gSamusData
	ldrh r2, [r2, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r0
	rsbs r1, r1, #0
	lsrs r4, r1, #0x1f
_0800A866:
	ldr r0, _0800A8F8 @ =0x0828FCF6
	mov sl, r0
	adds r6, r5, #0
	adds r0, #2
	adds r0, r6, r0
	ldrh r0, [r0]
	ldr r1, _0800A8F4 @ =gSamusData
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	movs r2, #0x80
	lsls r2, r2, #0x11
	mov r8, r2
	ands r0, r2
	cmp r0, #0
	beq _0800A890
	adds r4, #2
_0800A890:
	mov r0, sl
	adds r0, #4
	adds r0, r6, r0
	ldrh r0, [r0]
	ldr r1, _0800A8F4 @ =gSamusData
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	mov r2, r8
	ands r0, r2
	cmp r0, #0
	beq _0800A8B2
	adds r4, #4
_0800A8B2:
	movs r0, #8
	mov r1, sb
	ands r1, r0
	cmp r1, #0
	bne _0800A8DE
	mov r0, sl
	adds r0, #6
	adds r0, r5, r0
	ldrh r0, [r0]
	ldr r2, _0800A8F4 @ =gSamusData
	ldrh r2, [r2, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0800A8DE
	adds r4, #8
_0800A8DE:
	adds r0, r4, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800A8F0: .4byte gPreviousYPosition
_0800A8F4: .4byte gSamusData
_0800A8F8: .4byte 0x0828FCF6

	thumb_func_start unk_a8fc
unk_a8fc: @ 0x0800A8FC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r2
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	movs r5, #0
	mov r8, r5
	ldr r2, _0800A940 @ =gSamusData
	ldr r1, _0800A944 @ =0x0828FCCC
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r2, [r2, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0800A948
	movs r5, #1
	b _0800A954
	.align 2, 0
_0800A940: .4byte gSamusData
_0800A944: .4byte 0x0828FCCC
_0800A948:
	movs r0, #0xff
	ands r0, r2
	cmp r0, #0xc
	bne _0800A954
	movs r5, #1
	mov r8, r5
_0800A954:
	ldr r2, _0800A984 @ =gSamusData
	ldr r1, _0800A988 @ =0x0828FCCC
	lsls r4, r6, #1
	adds r0, r4, r6
	lsls r0, r0, #1
	adds r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r2, [r2, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0800A98C
	adds r5, #2
	b _0800A9A0
	.align 2, 0
_0800A984: .4byte gSamusData
_0800A988: .4byte 0x0828FCCC
_0800A98C:
	movs r0, #0xff
	ands r0, r2
	cmp r0, #0xc
	bne _0800A9A0
	adds r5, #2
	mov r0, r8
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_0800A9A0:
	ldr r0, _0800A9CC @ =0x0828FCCC
	adds r1, r4, r6
	lsls r1, r1, #1
	adds r0, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x1f
	ble _0800A9E8
	ldr r0, _0800A9D0 @ =gSamusData
	ldrh r1, [r0, #0x16]
	adds r0, r7, #0
	bl ProcessClipdataForSamus
	adds r2, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r2
	cmp r0, #0
	beq _0800A9D4
	adds r5, #4
	b _0800A9E8
	.align 2, 0
_0800A9CC: .4byte 0x0828FCCC
_0800A9D0: .4byte gSamusData
_0800A9D4:
	movs r0, #0xff
	ands r0, r2
	cmp r0, #0xc
	bne _0800A9E8
	adds r5, #4
	mov r0, r8
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
_0800A9E8:
	mov r1, r8
	mov r0, sb
	strh r1, [r0]
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SamusCheckWalkingSidesCollision
SamusCheckWalkingSidesCollision: @ 0x0800A9FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, _0800AA38 @ =0x03001320
	ldrh r1, [r4]
	ldrb r0, [r4, #9]
	mov sl, r0
	mov r2, sl
	str r2, [sp, #0xc]
	ldrb r5, [r4, #4]
	ldrb r0, [r4, #5]
	str r0, [sp, #0x10]
	ldr r6, _0800AA3C @ =gSamusData
	ldrh r0, [r6, #0x1e]
	cmp r0, #0
	beq _0800AA24
	b _0800AC4C
_0800AA24:
	adds r0, r6, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800AA40
	mov r0, sl
	add r1, sp, #4
	movs r2, #0
	b _0800AA48
	.align 2, 0
_0800AA38: .4byte 0x03001320
_0800AA3C: .4byte gSamusData
_0800AA40:
	movs r2, #0x3e
	rsbs r2, r2, #0
	mov r0, sl
	add r1, sp, #4
_0800AA48:
	bl unk_a670
	adds r1, r0, #0
	cmp r1, #0
	beq _0800AA70
	ldr r2, _0800AA68 @ =gSamusData
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2, #0x16]
	strh r1, [r2, #0x1a]
	ldr r1, _0800AA6C @ =0x03001320
	ldrb r0, [r1, #0xc]
	adds r0, #1
	strb r0, [r1, #0xc]
	b _0800AA76
	.align 2, 0
_0800AA68: .4byte gSamusData
_0800AA6C: .4byte 0x03001320
_0800AA70:
	ldr r0, _0800AAD8 @ =0x03001320
	ldrb r0, [r0, #0xb]
	str r0, [sp, #0xc]
_0800AA76:
	ldr r1, _0800AADC @ =0x0828FCCC
	lsls r6, r5, #1
	mov r2, sl
	lsls r2, r2, #1
	mov r8, r2
	mov r0, r8
	add r0, sl
	lsls r0, r0, #1
	adds r0, r6, r0
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0800AAE0 @ =gSamusData
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, _0800AAE0 @ =gSamusData
	ldrh r2, [r2, #0x18]
	mov sb, r2
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	str r5, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	adds r3, r4, #0
	bl SamusSlopeRelated
	adds r1, r0, #0
	mov r0, r8
	str r0, [sp, #0x14]
	cmp r1, #0
	beq _0800AAE4
	ldrh r0, [r5]
	cmp r0, #0
	beq _0800AAE4
	movs r0, #0
	ldr r2, _0800AAE0 @ =gSamusData
	strh r1, [r2, #0x1e]
	mov r2, sp
	ldrh r1, [r2, #6]
	ldr r2, _0800AAE0 @ =gSamusData
	strh r1, [r2, #0x18]
	adds r1, r2, #0
_0800AAD0:
	adds r1, #0x20
	strb r0, [r1]
	b _0800ADB0
	.align 2, 0
_0800AAD8: .4byte 0x03001320
_0800AADC: .4byte 0x0828FCCC
_0800AAE0: .4byte gSamusData
_0800AAE4:
	ldr r0, _0800AB68 @ =gSamusData
	mov r8, r0
	ldr r1, [sp, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r4, r0, #1
	adds r0, r6, r4
	ldr r2, _0800AB6C @ =0x0828FCCC
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, r8
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r6, r5, #0
	str r6, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	mov r3, sp
	adds r3, #6
	bl SamusSlopeRelated
	ldrh r1, [r6]
	cmp r1, #0
	bne _0800ABC4
	ldr r2, [sp, #0x10]
	lsls r5, r2, #1
	ldr r0, [sp, #0x14]
	add r0, sl
	lsls r0, r0, #1
	adds r0, r5, r0
	ldr r1, _0800AB6C @ =0x0828FCCC
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	str r6, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	mov r3, sp
	adds r3, #6
	bl SamusSlopeRelated
	adds r1, r0, #0
	cmp r1, #0
	beq _0800AB70
	movs r0, #0
	mov r2, r8
	strh r1, [r2, #0x1e]
	mov r2, sp
	ldrh r1, [r2, #6]
	mov r2, r8
	strh r1, [r2, #0x18]
	mov r1, r8
	b _0800AAD0
	.align 2, 0
_0800AB68: .4byte gSamusData
_0800AB6C: .4byte 0x0828FCCC
_0800AB70:
	adds r0, r5, r4
	ldr r1, _0800ABC0 @ =0x0828FCCC
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r2, r8
	ldrh r2, [r2, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	str r6, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	mov r3, sp
	adds r3, #6
	bl SamusSlopeRelated
	ldrh r0, [r6]
	cmp r0, #0
	bne _0800AC38
	mov r0, r8
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800ABA4
	b _0800ADB0
_0800ABA4:
	mov r1, r8
	ldrh r0, [r1, #0x16]
	str r6, [sp]
	mov r1, sb
	add r2, sp, #4
	mov r3, sp
	adds r3, #6
	bl SamusSlopeRelated
	ldrh r0, [r6]
	cmp r0, #0
	bne _0800AC38
_0800ABBC:
	movs r0, #0xfe
	b _0800ADB2
	.align 2, 0
_0800ABC0: .4byte 0x0828FCCC
_0800ABC4:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0800AC38
	mov r0, r8
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800ABDA
	b _0800ADB0
_0800ABDA:
	mov r2, r8
	ldrh r1, [r2, #0x18]
	subs r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r5, [sp]
	adds r0, r7, #0
	add r2, sp, #4
	mov r3, sp
	adds r3, #6
	bl SamusSlopeRelated
	ldrh r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0800AC38
	ldr r1, [sp, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r4
	ldr r2, _0800AC44 @ =0x0828FCCC
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, r8
	ldrh r1, [r1, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r2, r8
	ldrh r1, [r2, #0x18]
	subs r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r5, [sp]
	adds r0, r7, #0
	add r2, sp, #4
	mov r3, sp
	adds r3, #6
	bl SamusSlopeRelated
	ldrh r1, [r5]
	cmp r1, #0
	beq _0800ABBC
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0800ABBC
_0800AC38:
	ldr r0, _0800AC48 @ =gSamusData
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
	b _0800ADB0
	.align 2, 0
_0800AC44: .4byte 0x0828FCCC
_0800AC48: .4byte gSamusData
_0800AC4C:
	ands r1, r0
	cmp r1, #0
	beq _0800ACE8
	movs r2, #0x3e
	rsbs r2, r2, #0
	mov r0, sl
	add r1, sp, #4
	bl unk_a670
	adds r1, r0, #0
	cmp r1, #0
	beq _0800AC74
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r6, #0x16]
	strh r1, [r6, #0x1a]
	ldrb r0, [r4, #0xc]
	adds r0, #1
	strb r0, [r4, #0xc]
_0800AC74:
	ldr r0, _0800ACDC @ =0x0828FCCC
	mov r2, sl
	lsls r1, r2, #1
	add r1, sl
	adds r1, r1, r5
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r1, [r6, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r2, [r6, #0x18]
	mov sb, r2
	mov r5, sp
	adds r5, #6
	add r4, sp, #8
	str r4, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	adds r3, r5, #0
	bl SamusSlopeRelated
	adds r1, r0, #0
	strh r1, [r6, #0x1e]
	cmp r1, #0
	bne _0800ACD4
	ldrh r0, [r4]
	cmp r0, #0
	bne _0800ACB4
	b _0800ADB0
_0800ACB4:
	mov r0, sb
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	str r4, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	adds r3, r5, #0
	bl SamusSlopeRelated
	adds r1, r0, #0
	strh r1, [r6, #0x1e]
	cmp r1, #0
	beq _0800ACE0
_0800ACD4:
	ldrh r0, [r5]
	strh r0, [r6, #0x18]
	b _0800ADB0
	.align 2, 0
_0800ACDC: .4byte 0x0828FCCC
_0800ACE0:
	ldrh r0, [r5]
	adds r0, #0x3f
	strh r0, [r6, #0x18]
	b _0800ADB0
_0800ACE8:
	adds r0, r6, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800ACF6
	strh r1, [r6, #0x1e]
	b _0800ADB0
_0800ACF6:
	ldr r0, [sp, #0x10]
	lsls r1, r0, #1
	mov r2, sl
	lsls r0, r2, #1
	add r0, sl
	lsls r0, r0, #1
	mov r8, r0
	add r1, r8
	ldr r0, _0800AD3C @ =0x0828FCCC
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrh r1, [r6, #0x16]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r2, [r6, #0x18]
	mov sb, r2
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	str r5, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	adds r3, r4, #0
	bl SamusSlopeRelated
	adds r1, r0, #0
	cmp r1, #0
	beq _0800AD40
	mov r1, sp
	ldrh r0, [r1, #6]
	strh r0, [r6, #0x18]
	b _0800ADB0
	.align 2, 0
_0800AD3C: .4byte 0x0828FCCC
_0800AD40:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0800ADB0
	mov r0, sb
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	str r5, [sp]
	adds r0, r7, #0
	mov r1, sb
	add r2, sp, #4
	mov r3, sp
	adds r3, #6
	bl SamusSlopeRelated
	adds r1, r0, #0
	strh r1, [r6, #0x1e]
	cmp r1, #0
	beq _0800AD70
	mov r2, sp
	ldrh r0, [r2, #6]
	strh r0, [r6, #0x18]
	b _0800ADB0
_0800AD70:
	ldrh r0, [r5]
	cmp r0, #0
	beq _0800ADB0
	ldrh r1, [r6, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800AD94
	add r0, sp, #4
	ldr r1, _0800AD90 @ =0x0828FCCC
	add r1, r8
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	b _0800ADA4
	.align 2, 0
_0800AD90: .4byte 0x0828FCCC
_0800AD94:
	add r0, sp, #4
	ldr r1, _0800ADC4 @ =0x0828FCCC
	adds r1, #2
	add r1, r8
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	adds r0, #0x3f
_0800ADA4:
	strh r0, [r6, #0x16]
	ldr r1, _0800ADC8 @ =gSamusData
	mov r2, sp
	ldrh r0, [r2, #6]
	subs r0, #1
	strh r0, [r1, #0x18]
_0800ADB0:
	movs r0, #0xff
_0800ADB2:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800ADC4: .4byte 0x0828FCCC
_0800ADC8: .4byte gSamusData

	thumb_func_start SamusCheckStandingOnGroundCollision
SamusCheckStandingOnGroundCollision: @ 0x0800ADCC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0800AE18 @ =0x03001320
	ldrb r5, [r0, #9]
	ldrb r4, [r0, #0xa]
	ldr r1, _0800AE1C @ =0x0828FCCC
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #1
	adds r1, #4
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	movs r2, #1
	bl unk_a7b8
	cmp r0, #1
	beq _0800ADFC
	cmp r0, #3
	bne _0800AE2C
_0800ADFC:
	ldr r2, _0800AE20 @ =gSamusData
	ldr r1, _0800AE24 @ =0x0828FCF6
	lsls r0, r4, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	ldrh r3, [r2, #0x16]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0800AE28 @ =0x0000FFC0
	ands r4, r0
	subs r1, r4, r1
	adds r1, #0x40
	b _0800AE50
	.align 2, 0
_0800AE18: .4byte 0x03001320
_0800AE1C: .4byte 0x0828FCCC
_0800AE20: .4byte gSamusData
_0800AE24: .4byte 0x0828FCF6
_0800AE28: .4byte 0x0000FFC0
_0800AE2C:
	cmp r0, #8
	beq _0800AE34
	cmp r0, #0xc
	bne _0800AE52
_0800AE34:
	ldr r2, _0800AEA4 @ =gSamusData
	ldr r0, _0800AEA8 @ =0x0828FCF6
	lsls r1, r4, #3
	adds r0, #6
	adds r1, r1, r0
	ldrh r1, [r1]
	ldrh r3, [r2, #0x16]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0800AEAC @ =0x0000FFC0
	ands r4, r0
	subs r1, r4, r1
	subs r1, #1
_0800AE50:
	strh r1, [r2, #0x16]
_0800AE52:
	ldr r0, _0800AEA4 @ =gSamusData
	mov sb, r0
	ldr r1, _0800AEB0 @ =0x0828FCCC
	mov sl, r1
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r7, r0, #1
	adds r0, r7, r1
	ldrh r0, [r0]
	mov r2, sb
	ldrh r2, [r2, #0x16]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r3, sb
	ldrh r0, [r3, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	str r0, [sp, #0xc]
	mov r6, sp
	adds r6, #6
	add r5, sp, #8
	str r5, [sp]
	adds r0, r4, #0
	mov r1, r8
	add r2, sp, #4
	adds r3, r6, #0
	bl SamusSlopeRelated
	ldrh r1, [r5]
	cmp r1, #0
	beq _0800AEE6
	cmp r0, #0
	beq _0800AEB4
	mov r1, sb
	strh r0, [r1, #0x1e]
	ldrh r0, [r6]
	strh r0, [r1, #0x18]
	b _0800AF8A
	.align 2, 0
_0800AEA4: .4byte gSamusData
_0800AEA8: .4byte 0x0828FCF6
_0800AEAC: .4byte 0x0000FFC0
_0800AEB0: .4byte 0x0828FCCC
_0800AEB4:
	cmp r1, #0x10
	beq _0800AF8A
	ldrh r7, [r6]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r5, [sp]
	add r2, sp, #4
	adds r3, r6, #0
	bl SamusSlopeRelated
	mov r2, sb
	strh r0, [r2, #0x1e]
	cmp r0, #0
	beq _0800AEDE
	strh r7, [r2, #0x18]
	b _0800AF8A
_0800AEDE:
	subs r0, r7, #1
	mov r3, sb
	strh r0, [r3, #0x18]
	b _0800AF8A
_0800AEE6:
	mov r0, sl
	adds r0, #2
	adds r0, r7, r0
	ldrh r7, [r0]
	mov r1, sb
	ldrh r1, [r1, #0x16]
	adds r0, r7, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	str r5, [sp]
	adds r0, r4, #0
	mov r1, r8
	add r2, sp, #4
	adds r3, r6, #0
	bl SamusSlopeRelated
	ldrh r1, [r5]
	cmp r1, #0
	beq _0800AF4C
	cmp r0, #0
	beq _0800AF1A
	mov r2, sb
	strh r0, [r2, #0x1e]
	ldrh r0, [r6]
	strh r0, [r2, #0x18]
	b _0800AF8A
_0800AF1A:
	cmp r1, #0x10
	beq _0800AF8A
	ldrh r7, [r6]
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r5, [sp]
	add r2, sp, #4
	adds r3, r6, #0
	bl SamusSlopeRelated
	mov r3, sb
	strh r0, [r3, #0x1e]
	cmp r0, #0
	beq _0800AF44
	strh r7, [r3, #0x18]
	b _0800AF8A
_0800AF44:
	subs r0, r7, #1
	mov r1, sb
	strh r0, [r1, #0x18]
	b _0800AF8A
_0800AF4C:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	ble _0800AF80
	ldr r2, _0800AF7C @ =gSamusData
	ldrh r4, [r2, #0x16]
	str r5, [sp]
	adds r0, r4, #0
	ldr r1, [sp, #0xc]
	add r2, sp, #4
	adds r3, r6, #0
	bl SamusSlopeRelated
	ldrh r1, [r5]
	cmp r1, #0
	beq _0800AF80
	ldr r3, _0800AF7C @ =gSamusData
	strh r0, [r3, #0x1e]
	cmp r1, #0x10
	beq _0800AF8A
	ldrh r0, [r6]
	subs r0, #1
	strh r0, [r3, #0x18]
	b _0800AF8A
	.align 2, 0
_0800AF7C: .4byte gSamusData
_0800AF80:
	ldr r0, _0800AF90 @ =gSamusData
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800AF94
_0800AF8A:
	movs r0, #0xff
	b _0800AF96
	.align 2, 0
_0800AF90: .4byte gSamusData
_0800AF94:
	movs r0, #0xfe
_0800AF96:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusCheckLandingCollision
SamusCheckLandingCollision: @ 0x0800AFA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	ldr r4, _0800B094 @ =0x03001320
	ldrb r0, [r4, #9]
	str r0, [sp, #0x10]
	ldrb r5, [r4, #4]
	ldrb r1, [r4, #5]
	str r1, [sp, #0x14]
	ldrh r2, [r4, #6]
	str r2, [sp, #0xc]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800AFEA
	movs r2, #0x16
	rsbs r2, r2, #0
	ldr r0, [sp, #0x10]
	add r1, sp, #4
	bl unk_a670
	adds r3, r0, #0
	cmp r3, #0
	beq _0800AFEA
	ldr r2, _0800B098 @ =gSamusData
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2, #0x16]
	strh r1, [r2, #0x1a]
	strb r3, [r4, #0xc]
_0800AFEA:
	ldr r3, _0800B098 @ =gSamusData
	mov r8, r3
	mov r0, r8
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800AFFA
	b _0800B210
_0800AFFA:
	lsls r0, r5, #1
	ldr r4, [sp, #0x10]
	lsls r4, r4, #1
	mov sb, r4
	ldr r1, [sp, #0x10]
	add r1, sb
	lsls r1, r1, #1
	str r1, [sp, #0x18]
	adds r0, r0, r1
	ldr r5, _0800B09C @ =0x0828FCCC
	adds r0, r0, r5
	ldrh r0, [r0]
	mov r1, sp
	strh r0, [r1, #0x1c]
	adds r3, r0, #0
	mov r2, r8
	ldrh r2, [r2, #0x16]
	adds r0, r3, r2
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r3, r8
	ldrh r6, [r3, #0x18]
	mov r5, sp
	adds r5, #6
	add r4, sp, #8
	str r4, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #4
	adds r3, r5, #0
	bl SamusSlopeRelated
	adds r3, r0, #0
	ldrh r2, [r4]
	mov r1, sb
	mov sb, r5
	mov sl, r4
	cmp r2, #0
	beq _0800B13C
	cmp r3, #0
	beq _0800B0A0
	mov r4, r8
	strh r3, [r4, #0x1e]
	ldrh r0, [r5]
	strh r0, [r4, #0x18]
	ldr r5, [sp, #0x14]
	lsls r0, r5, #1
	ldr r1, [sp, #0x18]
	adds r0, r0, r1
	ldr r2, _0800B09C @ =0x0828FCCC
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrh r3, [r4, #0x16]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldrh r6, [r4, #0x18]
	mov r4, sl
	str r4, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #4
	mov r3, sb
	bl SamusSlopeRelated
	adds r3, r0, #0
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800B120
	cmp r3, #0
	bne _0800B120
	mov r5, r8
	strh r3, [r5, #0x1e]
	mov r1, sb
	ldrh r0, [r1]
	subs r0, #1
	b _0800B11E
	.align 2, 0
_0800B094: .4byte 0x03001320
_0800B098: .4byte gSamusData
_0800B09C: .4byte 0x0828FCCC
_0800B0A0:
	ldr r3, _0800B0D4 @ =gPreviousYPosition
	ldrh r0, [r3]
	mov r4, sb
	ldrh r4, [r4]
	cmp r0, r4
	bhs _0800B0E4
	adds r6, r0, #0
	mov r5, sl
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #4
	mov r3, sb
	bl SamusSlopeRelated
	adds r3, r0, #0
	mov r0, r8
	strh r3, [r0, #0x1e]
	cmp r3, #0
	beq _0800B0D8
	mov r1, sb
	ldrh r0, [r1]
	mov r2, r8
	strh r0, [r2, #0x18]
	b _0800B120
	.align 2, 0
_0800B0D4: .4byte gPreviousYPosition
_0800B0D8:
	mov r3, sb
	ldrh r0, [r3]
	adds r0, #0x3f
	mov r4, r8
	strh r0, [r4, #0x18]
	b _0800B120
_0800B0E4:
	cmp r2, #0x10
	beq _0800B13C
	add r0, sp, #4
	ldrh r1, [r0]
	mov r5, sp
	ldrh r5, [r5, #0x1c]
	subs r1, r1, r5
	ldr r2, [sp, #0xc]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r0, r0, r1
	mov r3, r8
	strh r0, [r3, #0x16]
	ldrh r7, [r3, #0x16]
	mov r4, sl
	str r4, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #4
	mov r3, sb
	bl SamusSlopeRelated
	adds r3, r0, #0
	mov r5, r8
	strh r3, [r5, #0x1e]
	cmp r3, #0
	beq _0800B124
	mov r1, sb
	ldrh r0, [r1]
_0800B11E:
	strh r0, [r5, #0x18]
_0800B120:
	movs r0, #0xfd
	b _0800B212
_0800B124:
	mov r2, sl
	ldrh r0, [r2]
	cmp r0, #0
	beq _0800B136
	mov r3, sb
	ldrh r0, [r3]
	subs r0, #1
	mov r4, r8
	b _0800B202
_0800B136:
	mov r5, r8
	strh r3, [r5, #0x1a]
	b _0800B210
_0800B13C:
	ldr r0, _0800B188 @ =gSamusData
	mov r8, r0
	ldr r2, [sp, #0x14]
	lsls r0, r2, #1
	ldr r3, [sp, #0x10]
	adds r1, r1, r3
	lsls r1, r1, #1
	str r1, [sp, #0x20]
	adds r0, r0, r1
	ldr r4, _0800B18C @ =0x0828FCCC
	adds r0, r0, r4
	ldrh r0, [r0]
	mov r5, r8
	ldrh r5, [r5, #0x16]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r0, r8
	ldrh r6, [r0, #0x18]
	mov r4, sb
	mov r5, sl
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #4
	adds r3, r4, #0
	bl SamusSlopeRelated
	adds r3, r0, #0
	ldrh r0, [r5]
	cmp r0, #0
	beq _0800B1C6
	cmp r3, #0
	beq _0800B190
	mov r1, r8
	strh r3, [r1, #0x1e]
	ldrh r0, [r4]
	b _0800B1C2
	.align 2, 0
_0800B188: .4byte gSamusData
_0800B18C: .4byte 0x0828FCCC
_0800B190:
	ldr r1, _0800B1B8 @ =gPreviousYPosition
	ldrh r0, [r1]
	ldrh r2, [r4]
	cmp r0, r2
	bhs _0800B210
	adds r6, r0, #0
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #4
	adds r3, r4, #0
	bl SamusSlopeRelated
	adds r3, r0, #0
	mov r5, r8
	strh r3, [r5, #0x1e]
	cmp r3, #0
	beq _0800B1BC
	ldrh r0, [r4]
	b _0800B11E
	.align 2, 0
_0800B1B8: .4byte gPreviousYPosition
_0800B1BC:
	ldrh r0, [r4]
	adds r0, #0x3f
	mov r1, r8
_0800B1C2:
	strh r0, [r1, #0x18]
	b _0800B120
_0800B1C6:
	ldr r0, _0800B208 @ =0x0828FCCC
	adds r0, #2
	ldr r2, [sp, #0x20]
	adds r0, r2, r0
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0x1f
	ble _0800B210
	mov r4, r8
	ldrh r7, [r4, #0x16]
	mov r5, sl
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	add r2, sp, #4
	mov r3, sb
	bl SamusSlopeRelated
	adds r3, r0, #0
	ldrh r0, [r5]
	cmp r0, #0
	beq _0800B210
	ldr r0, _0800B20C @ =gPreviousYPosition
	mov r1, sb
	ldrh r5, [r1]
	ldrh r0, [r0]
	cmp r0, r5
	bhs _0800B210
	strh r3, [r4, #0x1e]
	subs r0, r5, #1
_0800B202:
	strh r0, [r4, #0x18]
	b _0800B120
	.align 2, 0
_0800B208: .4byte 0x0828FCCC
_0800B20C: .4byte gPreviousYPosition
_0800B210:
	movs r0, #0xff
_0800B212:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusCheckJumpingCollisions
SamusCheckJumpingCollisions: @ 0x0800B224
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r7, _0800B288 @ =0x03001320
	ldrb r0, [r7, #9]
	mov sb, r0
	ldrb r1, [r7, #0xa]
	ldrb r2, [r7, #4]
	mov r8, r2
	ldr r0, _0800B28C @ =0x03004D8C
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800B2E6
	ldr r6, _0800B290 @ =0x0828FCCC
	mov r3, sb
	lsls r0, r3, #1
	add r0, sb
	lsls r4, r0, #1
	adds r0, r6, #4
	adds r0, r4, r0
	ldrh r5, [r0]
	adds r0, r1, #0
	adds r1, r5, #0
	movs r2, #0
	bl unk_a7b8
	adds r1, r0, #0
	cmp r1, #0
	beq _0800B2E6
	cmp r1, #1
	bne _0800B29C
	ldr r2, _0800B294 @ =gSamusData
	adds r0, r4, r6
	ldrh r1, [r0]
	ldrh r3, [r2, #0x16]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0800B298 @ =0x0000FFC0
	ands r3, r0
	subs r1, r3, r1
	adds r1, #0x40
	strh r1, [r2, #0x16]
	b _0800B2E6
	.align 2, 0
_0800B288: .4byte 0x03001320
_0800B28C: .4byte 0x03004D8C
_0800B290: .4byte 0x0828FCCC
_0800B294: .4byte gSamusData
_0800B298: .4byte 0x0000FFC0
_0800B29C:
	cmp r1, #8
	bne _0800B2C4
	ldr r2, _0800B2BC @ =gSamusData
	adds r0, r6, #2
	adds r0, r4, r0
	ldrh r1, [r0]
	ldrh r3, [r2, #0x16]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _0800B2C0 @ =0x0000FFC0
	ands r3, r0
	subs r1, r3, r1
	subs r1, #1
	strh r1, [r2, #0x16]
	b _0800B2E6
	.align 2, 0
_0800B2BC: .4byte gSamusData
_0800B2C0: .4byte 0x0000FFC0
_0800B2C4:
	movs r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0800B2E6
	ldr r1, _0800B334 @ =gSamusData
	ldrh r0, [r1, #0x18]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0800B338 @ =0x0000FFC0
	ands r4, r0
	subs r0, r4, r5
	adds r0, #0x40
	strh r0, [r1, #0x18]
	ldrb r0, [r7, #0xd]
	adds r0, #1
	strb r0, [r7, #0xd]
_0800B2E6:
	ldr r0, _0800B33C @ =0x03001320
	mov sl, r0
	ldrh r0, [r0]
	cmp r0, #0
	beq _0800B3A0
	ldr r7, _0800B334 @ =gSamusData
	ldr r1, _0800B340 @ =0x0828FCCC
	mov r2, sb
	lsls r0, r2, #1
	add r0, sb
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	ldrh r0, [r7, #0x16]
	add r0, r8
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r4, [r7, #0x18]
	mov r6, sp
	adds r6, #6
	add r5, sp, #8
	str r5, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	add r2, sp, #4
	adds r3, r6, #0
	bl SamusSlopeRelated
	adds r1, r0, #0
	ldrh r0, [r5]
	cmp r0, #0
	beq _0800B37C
	cmp r1, #0
	beq _0800B344
	strh r1, [r7, #0x1e]
	b _0800B374
	.align 2, 0
_0800B334: .4byte gSamusData
_0800B338: .4byte 0x0000FFC0
_0800B33C: .4byte 0x03001320
_0800B340: .4byte 0x0828FCCC
_0800B344:
	add r0, sp, #4
	ldrh r0, [r0]
	mov r3, r8
	subs r0, r0, r3
	mov r1, sl
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrh r3, [r7, #0x16]
	str r5, [sp]
	adds r0, r3, #0
	adds r1, r4, #0
	add r2, sp, #4
	adds r3, r6, #0
	bl SamusSlopeRelated
	adds r1, r0, #0
	cmp r1, #0
	beq _0800B37C
	strh r1, [r7, #0x1e]
	mov r2, r8
	strh r2, [r7, #0x16]
_0800B374:
	ldrh r0, [r6]
	strh r0, [r7, #0x18]
	movs r0, #0xfd
	b _0800B3B0
_0800B37C:
	mov r0, sb
	add r1, sp, #4
	movs r2, #0
	bl unk_a670
	adds r1, r0, #0
	cmp r1, #0
	beq _0800B3A0
	ldr r2, _0800B3C0 @ =gSamusData
	add r0, sp, #4
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2, #0x16]
	strh r1, [r2, #0x1a]
	ldr r1, _0800B3C4 @ =0x03001320
	ldrb r0, [r1, #0xc]
	adds r0, #1
	strb r0, [r1, #0xc]
_0800B3A0:
	ldr r0, _0800B3C4 @ =0x03001320
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0800B3AE
	ldr r1, _0800B3C0 @ =gSamusData
	movs r0, #0
	strh r0, [r1, #0x1c]
_0800B3AE:
	movs r0, #0xff
_0800B3B0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800B3C0: .4byte gSamusData
_0800B3C4: .4byte 0x03001320

	thumb_func_start unk_b3c8
unk_b3c8: @ 0x0800B3C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0800B440 @ =gSamusData
	ldrh r0, [r5, #0x16]
	ldr r6, _0800B444 @ =0x0000FFC0
	ldr r7, _0800B448 @ =gPreviousXPosition
	ldrh r2, [r7]
	adds r1, r6, #0
	ands r1, r0
	adds r0, r6, #0
	ands r0, r2
	cmp r1, r0
	bne _0800B46C
	ldrh r0, [r5, #0x1e]
	cmp r0, #0
	bne _0800B46C
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800B46C
	ldrh r2, [r5, #0x16]
	ldrh r0, [r5, #0x18]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov r3, sp
	adds r3, #6
	add r4, sp, #8
	str r4, [sp]
	adds r0, r2, #0
	add r2, sp, #4
	bl SamusSlopeRelated
	cmp r0, #0
	bne _0800B46C
	ldrh r0, [r4]
	cmp r0, #0
	bne _0800B46C
	ldrh r4, [r5, #0x16]
	movs r1, #0x3f
	adds r2, r1, #0
	ands r2, r4
	ldrh r0, [r7]
	ands r1, r0
	ldr r0, _0800B44C @ =0x03001320
	ldrh r3, [r0]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0800B450
	cmp r2, #0x1d
	bls _0800B46C
	cmp r1, #0x1e
	bhi _0800B46C
	adds r0, r6, #0
	ands r0, r4
	adds r0, #0x1e
	b _0800B466
	.align 2, 0
_0800B440: .4byte gSamusData
_0800B444: .4byte 0x0000FFC0
_0800B448: .4byte gPreviousXPosition
_0800B44C: .4byte 0x03001320
_0800B450:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0800B46C
	cmp r2, #0x21
	bhi _0800B46C
	cmp r1, #0x20
	bls _0800B46C
	adds r0, r6, #0
	ands r0, r4
	adds r0, #0x21
_0800B466:
	strh r0, [r5, #0x16]
	movs r0, #0xfe
	b _0800B46E
_0800B46C:
	movs r0, #0xff
_0800B46E:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SamusUpdateGraphics
SamusUpdateGraphics: @ 0x0800B478
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _0800B4BC @ =gSamusData
	ldrb r0, [r1, #1]
	mov ip, r1
	cmp r0, #0x11
	beq _0800B498
	ldrb r0, [r1, #5]
	cmp r0, #0
	beq _0800B498
	subs r0, #1
	strb r0, [r1, #5]
_0800B498:
	ldr r0, _0800B4C0 @ =0x030012F0
	ldrb r1, [r0, #3]
	mov sb, r0
	cmp r1, #0
	beq _0800B4A8
	subs r0, r1, #1
	mov r1, sb
	strb r0, [r1, #3]
_0800B4A8:
	mov r2, ip
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _0800B4C8
	ldr r0, _0800B4C4 @ =0x030012E4
	movs r1, #1
	strb r1, [r0]
	movs r1, #0x10
	strb r1, [r0, #1]
	b _0800B4DE
	.align 2, 0
_0800B4BC: .4byte gSamusData
_0800B4C0: .4byte 0x030012F0
_0800B4C4: .4byte 0x030012E4
_0800B4C8:
	ldr r2, _0800B4D8 @ =0x030012E4
	ldrb r0, [r2, #1]
	adds r1, r0, #0
	cmp r1, #0
	beq _0800B4DC
	subs r0, #1
	strb r0, [r2, #1]
	b _0800B4DE
	.align 2, 0
_0800B4D8: .4byte 0x030012E4
_0800B4DC:
	strb r1, [r2]
_0800B4DE:
	ldr r6, _0800B538 @ =0x0300144C
	ldrh r5, [r6]
	movs r0, #0x3f
	ands r0, r5
	ldr r2, _0800B53C @ =0x0300134C
	lsls r0, r0, #1
	adds r3, r0, r2
	ldr r1, _0800B540 @ =gPreviousXPosition
	ldrh r1, [r1]
	strh r1, [r3]
	adds r2, #0x80
	adds r0, r0, r2
	ldr r1, _0800B544 @ =gPreviousYPosition
	ldrh r1, [r1]
	strh r1, [r0]
	adds r0, r5, #1
	strh r0, [r6]
	lsls r1, r5, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0800B510
	adds r0, r5, #0
	subs r0, #0x7f
	strh r0, [r6]
_0800B510:
	movs r3, #0
	ldrsh r0, [r6, r3]
	cmp r0, #0x3f
	ble _0800B51E
	ldr r1, _0800B548 @ =0x0300144E
	movs r0, #1
	strb r0, [r1]
_0800B51E:
	mov r0, ip
	ldrb r0, [r0, #1]
	mov r8, r0
	mov r1, ip
	ldrb r7, [r1, #7]
	cmp r0, #0x3f
	bls _0800B52E
	b _0800B85C
_0800B52E:
	lsls r0, r0, #2
	ldr r1, _0800B54C @ =_0800B550
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B538: .4byte 0x0300144C
_0800B53C: .4byte 0x0300134C
_0800B540: .4byte gPreviousXPosition
_0800B544: .4byte gPreviousYPosition
_0800B548: .4byte 0x0300144E
_0800B54C: .4byte _0800B550
_0800B550: @ jump table
	.4byte _0800B650 @ case 0
	.4byte _0800B668 @ case 1
	.4byte _0800B680 @ case 2
	.4byte _0800B698 @ case 3
	.4byte _0800B6B0 @ case 4
	.4byte _0800B6C8 @ case 5
	.4byte _0800B6E0 @ case 6
	.4byte _0800B6F8 @ case 7
	.4byte _0800B710 @ case 8
	.4byte _0800B728 @ case 9
	.4byte _0800B85C @ case 10
	.4byte _0800B85C @ case 11
	.4byte _0800B85C @ case 12
	.4byte _0800B85C @ case 13
	.4byte _0800B85C @ case 14
	.4byte _0800B85C @ case 15
	.4byte _0800B85C @ case 16
	.4byte _0800B85C @ case 17
	.4byte _0800B85C @ case 18
	.4byte _0800B85C @ case 19
	.4byte _0800B85C @ case 20
	.4byte _0800B85C @ case 21
	.4byte _0800B85C @ case 22
	.4byte _0800B85C @ case 23
	.4byte _0800B740 @ case 24
	.4byte _0800B85C @ case 25
	.4byte _0800B85C @ case 26
	.4byte _0800B85C @ case 27
	.4byte _0800B85C @ case 28
	.4byte _0800B85C @ case 29
	.4byte _0800B85C @ case 30
	.4byte _0800B774 @ case 31
	.4byte _0800B85C @ case 32
	.4byte _0800B85C @ case 33
	.4byte _0800B85C @ case 34
	.4byte _0800B85C @ case 35
	.4byte _0800B78C @ case 36
	.4byte _0800B7A8 @ case 37
	.4byte _0800B85C @ case 38
	.4byte _0800B85C @ case 39
	.4byte _0800B7C4 @ case 40
	.4byte _0800B7DC @ case 41
	.4byte _0800B85C @ case 42
	.4byte _0800B85C @ case 43
	.4byte _0800B85C @ case 44
	.4byte _0800B85C @ case 45
	.4byte _0800B7F4 @ case 46
	.4byte _0800B80C @ case 47
	.4byte _0800B85C @ case 48
	.4byte _0800B85C @ case 49
	.4byte _0800B85C @ case 50
	.4byte _0800B85C @ case 51
	.4byte _0800B85C @ case 52
	.4byte _0800B85C @ case 53
	.4byte _0800B85C @ case 54
	.4byte _0800B85C @ case 55
	.4byte _0800B85C @ case 56
	.4byte _0800B85C @ case 57
	.4byte _0800B85C @ case 58
	.4byte _0800B85C @ case 59
	.4byte _0800B85C @ case 60
	.4byte _0800B85C @ case 61
	.4byte _0800B85C @ case 62
	.4byte _0800B824 @ case 63
_0800B650:
	ldr r1, _0800B660 @ =0x0828D4C4
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B664 @ =0x0828DAE4
	b _0800B86C
	.align 2, 0
_0800B660: .4byte 0x0828D4C4
_0800B664: .4byte 0x0828DAE4
_0800B668:
	ldr r1, _0800B678 @ =0x0828D4EC
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B67C @ =0x0828DB0C
	b _0800B86C
	.align 2, 0
_0800B678: .4byte 0x0828D4EC
_0800B67C: .4byte 0x0828DB0C
_0800B680:
	ldr r1, _0800B690 @ =0x0828D514
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B694 @ =0x0828DB34
	b _0800B86C
	.align 2, 0
_0800B690: .4byte 0x0828D514
_0800B694: .4byte 0x0828DB34
_0800B698:
	ldr r1, _0800B6A8 @ =0x0828D53C
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B6AC @ =0x0828DB5C
	b _0800B86C
	.align 2, 0
_0800B6A8: .4byte 0x0828D53C
_0800B6AC: .4byte 0x0828DB5C
_0800B6B0:
	ldr r1, _0800B6C0 @ =0x0828D55C
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B6C4 @ =0x0828DB7C
	b _0800B86C
	.align 2, 0
_0800B6C0: .4byte 0x0828D55C
_0800B6C4: .4byte 0x0828DB7C
_0800B6C8:
	ldr r1, _0800B6D8 @ =0x0828D58C
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B6DC @ =0x0828DBAC
	b _0800B86C
	.align 2, 0
_0800B6D8: .4byte 0x0828D58C
_0800B6DC: .4byte 0x0828DBAC
_0800B6E0:
	ldr r1, _0800B6F0 @ =0x0828D5BC
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B6F4 @ =0x0828DBDC
	b _0800B86C
	.align 2, 0
_0800B6F0: .4byte 0x0828D5BC
_0800B6F4: .4byte 0x0828DBDC
_0800B6F8:
	ldr r1, _0800B708 @ =0x0828D634
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B70C @ =0x0828DC54
	b _0800B86C
	.align 2, 0
_0800B708: .4byte 0x0828D634
_0800B70C: .4byte 0x0828DC54
_0800B710:
	ldr r1, _0800B720 @ =0x0828D60C
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B724 @ =0x0828DC2C
	b _0800B86C
	.align 2, 0
_0800B720: .4byte 0x0828D60C
_0800B724: .4byte 0x0828DC2C
_0800B728:
	ldr r1, _0800B738 @ =0x0828D634
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B73C @ =0x0828DC54
	b _0800B86C
	.align 2, 0
_0800B738: .4byte 0x0828D634
_0800B73C: .4byte 0x0828DC54
_0800B740:
	ldr r2, _0800B768 @ =gButtonInput
	mov r3, ip
	ldrh r0, [r3, #0x12]
	movs r1, #0x30
	eors r0, r1
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0800B758
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0800B758:
	ldr r1, _0800B76C @ =0x0828D65C
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B770 @ =0x0828DC7C
	b _0800B86C
	.align 2, 0
_0800B768: .4byte gButtonInput
_0800B76C: .4byte 0x0828D65C
_0800B770: .4byte 0x0828DC7C
_0800B774:
	mov r1, ip
	ldrb r0, [r1, #8]
	cmp r0, #1
	bne _0800B782
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0800B782:
	ldr r2, _0800B788 @ =0x0828D674
	b _0800B834
	.align 2, 0
_0800B788: .4byte 0x0828D674
_0800B78C:
	mov r0, ip
	ldrb r7, [r0, #3]
	ldr r1, _0800B7A0 @ =0x0828D684
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B7A4 @ =0x0828DC8C
	b _0800B86C
	.align 2, 0
_0800B7A0: .4byte 0x0828D684
_0800B7A4: .4byte 0x0828DC8C
_0800B7A8:
	mov r1, ip
	ldrb r7, [r1, #3]
	ldr r1, _0800B7BC @ =0x0828D69C
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B7C0 @ =0x0828DCA4
	b _0800B86C
	.align 2, 0
_0800B7BC: .4byte 0x0828D69C
_0800B7C0: .4byte 0x0828DCA4
_0800B7C4:
	ldr r1, _0800B7D4 @ =0x0828D6B4
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B7D8 @ =0x0828DCBC
	b _0800B86C
	.align 2, 0
_0800B7D4: .4byte 0x0828D6B4
_0800B7D8: .4byte 0x0828DCBC
_0800B7DC:
	ldr r1, _0800B7EC @ =0x0828D6E4
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B7F0 @ =0x0828DCEC
	b _0800B86C
	.align 2, 0
_0800B7EC: .4byte 0x0828D6E4
_0800B7F0: .4byte 0x0828DCEC
_0800B7F4:
	ldr r1, _0800B804 @ =0x0828D714
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B808 @ =0x0828DD1C
	b _0800B86C
	.align 2, 0
_0800B804: .4byte 0x0828D714
_0800B808: .4byte 0x0828DD1C
_0800B80C:
	ldr r1, _0800B81C @ =0x0828D744
	lsls r2, r4, #2
	lsls r0, r7, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B820 @ =0x0828DD4C
	b _0800B86C
	.align 2, 0
_0800B81C: .4byte 0x0828D744
_0800B820: .4byte 0x0828DD4C
_0800B824:
	ldr r0, _0800B850 @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #0x70
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r7, r0, #0x1f
	ldr r2, _0800B854 @ =0x0828D784
_0800B834:
	lsls r1, r4, #2
	lsls r0, r7, #3
	adds r0, r1, r0
	adds r0, r0, r2
	ldr r6, [r0]
	ldr r2, _0800B858 @ =0x0828D8DC
	mov r3, r8
	lsls r0, r3, #3
	adds r0, r1, r0
	adds r0, r0, r2
	ldr r4, [r0]
	adds r5, r1, #0
	b _0800B872
	.align 2, 0
_0800B850: .4byte gButtonInput
_0800B854: .4byte 0x0828D784
_0800B858: .4byte 0x0828D8DC
_0800B85C:
	ldr r1, _0800B8D4 @ =0x0828D2BC
	lsls r2, r4, #2
	mov r3, r8
	lsls r0, r3, #3
	adds r0, r2, r0
	adds r1, r0, r1
	ldr r6, [r1]
	ldr r1, _0800B8D8 @ =0x0828D8DC
_0800B86C:
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r2, #0
_0800B872:
	mov r0, ip
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #4
	adds r6, r6, r0
	ldr r1, _0800B8DC @ =gSamusGraphicsInfo
	ldr r0, [r6, #8]
	str r0, [r1]
	ldr r3, [r6]
	ldrb r0, [r3]
	lsls r0, r0, #5
	movs r2, #0
	strh r0, [r1, #8]
	adds r3, #1
	ldrb r0, [r3]
	lsls r0, r0, #5
	strh r0, [r1, #0x10]
	adds r3, #1
	str r3, [r1, #4]
	ldrh r0, [r1, #8]
	adds r0, r3, r0
	str r0, [r1, #0xc]
	ldr r3, [r6, #4]
	ldrb r0, [r3]
	lsls r0, r0, #5
	strh r0, [r1, #0x18]
	adds r3, #1
	ldrb r0, [r3]
	lsls r0, r0, #5
	strh r0, [r1, #0x20]
	adds r3, #1
	str r3, [r1, #0x14]
	ldrh r0, [r1, #0x18]
	adds r0, r3, r0
	str r0, [r1, #0x1c]
	strh r2, [r1, #0x26]
	strh r2, [r1, #0x30]
	strh r2, [r1, #0x38]
	mov r0, r8
	subs r0, #0x17
	adds r3, r1, #0
	cmp r0, #0x29
	bls _0800B8CA
	b _0800BC4E
_0800B8CA:
	lsls r0, r0, #2
	ldr r1, _0800B8E0 @ =_0800B8E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800B8D4: .4byte 0x0828D2BC
_0800B8D8: .4byte 0x0828D8DC
_0800B8DC: .4byte gSamusGraphicsInfo
_0800B8E0: .4byte _0800B8E4
_0800B8E4: @ jump table
	.4byte _0800B98C @ case 0
	.4byte _0800BC4E @ case 1
	.4byte _0800BC4E @ case 2
	.4byte _0800BC4E @ case 3
	.4byte _0800BC4E @ case 4
	.4byte _0800BC4E @ case 5
	.4byte _0800BC4E @ case 6
	.4byte _0800B9B8 @ case 7
	.4byte _0800BC4E @ case 8
	.4byte _0800BC4E @ case 9
	.4byte _0800BC4E @ case 10
	.4byte _0800BC4E @ case 11
	.4byte _0800BC4E @ case 12
	.4byte _0800BC4E @ case 13
	.4byte _0800BC4E @ case 14
	.4byte _0800BC4E @ case 15
	.4byte _0800BC4E @ case 16
	.4byte _0800BB22 @ case 17
	.4byte _0800BB22 @ case 18
	.4byte _0800BC4E @ case 19
	.4byte _0800BBB8 @ case 20
	.4byte _0800BC4E @ case 21
	.4byte _0800BC4E @ case 22
	.4byte _0800BBB8 @ case 23
	.4byte _0800BBB8 @ case 24
	.4byte _0800BC4E @ case 25
	.4byte _0800BC4E @ case 26
	.4byte _0800BC4E @ case 27
	.4byte _0800BC4E @ case 28
	.4byte _0800BA00 @ case 29
	.4byte _0800BC4E @ case 30
	.4byte _0800BC4E @ case 31
	.4byte _0800BC4E @ case 32
	.4byte _0800BC4E @ case 33
	.4byte _0800BC4E @ case 34
	.4byte _0800BC4E @ case 35
	.4byte _0800BC4E @ case 36
	.4byte _0800BC4E @ case 37
	.4byte _0800BA38 @ case 38
	.4byte _0800BA88 @ case 39
	.4byte _0800BC4E @ case 40
	.4byte _0800BC4C @ case 41
_0800B98C:
	ldr r0, _0800B9A8 @ =0x030012D8
	ldrb r0, [r0, #2]
	lsls r0, r0, #3
	ldr r1, _0800B9AC @ =0x0828BF98
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #0x26]
	ldr r0, _0800B9B0 @ =0x082DE9B0
	str r0, [r3, #0x2c]
	ldr r0, _0800B9B4 @ =0x082DEA70
	b _0800BCD8
	.align 2, 0
_0800B9A8: .4byte 0x030012D8
_0800B9AC: .4byte 0x0828BF98
_0800B9B0: .4byte 0x082DE9B0
_0800B9B4: .4byte 0x082DEA70
_0800B9B8:
	ldr r1, _0800B9F0 @ =0x0828D66C
	adds r1, r5, r1
	ldr r2, _0800B9F4 @ =0x030012D8
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	ldr r1, [r1]
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x26]
	ldr r1, _0800B9F8 @ =0x0828FABC
	ldrb r0, [r2, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r1, _0800B9FC @ =0x0828FACC
	ldrb r0, [r2, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x34]
	movs r0, #0x80
	lsls r0, r0, #1
	b _0800BCDC
	.align 2, 0
_0800B9F0: .4byte 0x0828D66C
_0800B9F4: .4byte 0x030012D8
_0800B9F8: .4byte 0x0828FABC
_0800B9FC: .4byte 0x0828FACC
_0800BA00:
	ldr r1, _0800BA28 @ =0x0828D774
	adds r1, r5, r1
	ldr r0, _0800BA2C @ =0x030012D8
	ldrb r0, [r0, #2]
	lsls r0, r0, #3
	ldr r1, [r1]
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #0x26]
	ldr r0, _0800BA30 @ =0x082E4250
	str r0, [r3, #0x2c]
	ldr r0, _0800BA34 @ =0x082E4450
	str r0, [r3, #0x34]
	movs r0, #0x80
	lsls r0, r0, #2
	b _0800BCDC
	.align 2, 0
_0800BA28: .4byte 0x0828D774
_0800BA2C: .4byte 0x030012D8
_0800BA30: .4byte 0x082E4250
_0800BA34: .4byte 0x082E4450
_0800BA38:
	ldr r2, _0800BA78 @ =0x030012D8
	ldrb r0, [r2]
	cmp r0, #1
	beq _0800BA42
	b _0800BCE0
_0800BA42:
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	ldr r1, _0800BA7C @ =0x0828CE8C
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r3, #0x26]
	ldr r1, _0800BA80 @ =0x0828FADC
	ldrb r0, [r2, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r1, _0800BA84 @ =0x0828FB9C
	ldrb r0, [r2, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x34]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r3, #0x30]
	subs r0, #0x80
	b _0800BCDE
	.align 2, 0
_0800BA78: .4byte 0x030012D8
_0800BA7C: .4byte 0x0828CE8C
_0800BA80: .4byte 0x0828FADC
_0800BA84: .4byte 0x0828FB9C
_0800BA88:
	ldr r2, _0800BAB0 @ =0x030012D8
	ldrb r0, [r2]
	cmp r0, #0
	bne _0800BAD0
	ldr r1, _0800BAB4 @ =0x040000D4
	ldr r0, _0800BAB8 @ =0x082DF730
	str r0, [r1]
	ldr r0, _0800BABC @ =0x06010900
	str r0, [r1, #4]
	ldr r0, _0800BAC0 @ =0x80000030
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0800BAC4 @ =0x082DF790
	str r0, [r1]
	ldr r0, _0800BAC8 @ =0x06010D00
	str r0, [r1, #4]
	ldr r0, _0800BACC @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800BCE0
	.align 2, 0
_0800BAB0: .4byte 0x030012D8
_0800BAB4: .4byte 0x040000D4
_0800BAB8: .4byte 0x082DF730
_0800BABC: .4byte 0x06010900
_0800BAC0: .4byte 0x80000030
_0800BAC4: .4byte 0x082DF790
_0800BAC8: .4byte 0x06010D00
_0800BACC: .4byte 0x80000020
_0800BAD0:
	cmp r0, #2
	bne _0800BB14
	ldr r1, _0800BB08 @ =0x0828D77C
	adds r1, r5, r1
	ldrb r0, [r2, #2]
	lsls r0, r0, #3
	ldr r1, [r1]
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x28]
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #0x26]
	ldr r1, _0800BB0C @ =0x0828FC5C
	ldrb r0, [r2, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r1, _0800BB10 @ =0x0828FC74
	ldrb r0, [r2, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3, #0x34]
	movs r0, #0x80
	lsls r0, r0, #1
	b _0800BCDC
	.align 2, 0
_0800BB08: .4byte 0x0828D77C
_0800BB0C: .4byte 0x0828FC5C
_0800BB10: .4byte 0x0828FC74
_0800BB14:
	cmp r0, #3
	beq _0800BB1A
	b _0800BCE0
_0800BB1A:
	movs r0, #0x80
	lsls r0, r0, #6
	strh r0, [r3, #0x26]
	b _0800BCE0
_0800BB22:
	mov r0, ip
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r0, [r4, #4]
	str r0, [r3, #0x28]
	ldrh r0, [r0]
	strh r0, [r3, #0x26]
	mov r0, ip
	ldrb r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800BB7C
	mov r2, ip
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800BB64
	ldr r0, _0800BB5C @ =0x0828F99C
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BB60 @ =0x0828F9B4
	b _0800BCD4
	.align 2, 0
_0800BB5C: .4byte 0x0828F99C
_0800BB60: .4byte 0x0828F9B4
_0800BB64:
	ldr r0, _0800BB74 @ =0x0828F9CC
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BB78 @ =0x0828F9E4
	b _0800BCD4
	.align 2, 0
_0800BB74: .4byte 0x0828F9CC
_0800BB78: .4byte 0x0828F9E4
_0800BB7C:
	mov r0, ip
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800BBA0
	ldr r0, _0800BB98 @ =0x0828FA5C
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BB9C @ =0x0828FA74
	b _0800BCD4
	.align 2, 0
_0800BB98: .4byte 0x0828FA5C
_0800BB9C: .4byte 0x0828FA74
_0800BBA0:
	ldr r0, _0800BBB0 @ =0x0828FA8C
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BBB4 @ =0x0828FAA4
	b _0800BCD4
	.align 2, 0
_0800BBB0: .4byte 0x0828FA8C
_0800BBB4: .4byte 0x0828FAA4
_0800BBB8:
	mov r0, ip
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r0, [r4, #4]
	str r0, [r3, #0x28]
	ldrh r0, [r0]
	strh r0, [r3, #0x26]
	mov r2, ip
	ldrb r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800BC10
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800BBF8
	ldr r0, _0800BBF0 @ =0x0828F99C
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BBF4 @ =0x0828F9B4
	b _0800BCD4
	.align 2, 0
_0800BBF0: .4byte 0x0828F99C
_0800BBF4: .4byte 0x0828F9B4
_0800BBF8:
	ldr r0, _0800BC08 @ =0x0828F9CC
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BC0C @ =0x0828F9E4
	b _0800BCD4
	.align 2, 0
_0800BC08: .4byte 0x0828F9CC
_0800BC0C: .4byte 0x0828F9E4
_0800BC10:
	mov r0, ip
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800BC34
	ldr r0, _0800BC2C @ =0x0828F9FC
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BC30 @ =0x0828FA14
	b _0800BCD4
	.align 2, 0
_0800BC2C: .4byte 0x0828F9FC
_0800BC30: .4byte 0x0828FA14
_0800BC34:
	ldr r0, _0800BC44 @ =0x0828FA2C
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BC48 @ =0x0828FA44
	b _0800BCD4
	.align 2, 0
_0800BC44: .4byte 0x0828FA2C
_0800BC48: .4byte 0x0828FA44
_0800BC4C:
	movs r7, #5
_0800BC4E:
	mov r0, ip
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r0, [r4, #4]
	str r0, [r3, #0x28]
	ldrh r0, [r0]
	strh r0, [r3, #0x26]
	mov r2, ip
	ldrb r1, [r2, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800BCA4
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800BC8C
	ldr r0, _0800BC84 @ =0x0828F99C
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BC88 @ =0x0828F9B4
	b _0800BCD4
	.align 2, 0
_0800BC84: .4byte 0x0828F99C
_0800BC88: .4byte 0x0828F9B4
_0800BC8C:
	ldr r0, _0800BC9C @ =0x0828F9CC
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BCA0 @ =0x0828F9E4
	b _0800BCD4
	.align 2, 0
_0800BC9C: .4byte 0x0828F9CC
_0800BCA0: .4byte 0x0828F9E4
_0800BCA4:
	mov r0, ip
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800BCC8
	ldr r0, _0800BCC0 @ =0x0828F93C
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BCC4 @ =0x0828F954
	b _0800BCD4
	.align 2, 0
_0800BCC0: .4byte 0x0828F93C
_0800BCC4: .4byte 0x0828F954
_0800BCC8:
	ldr r0, _0800BD18 @ =0x0828F96C
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	str r0, [r3, #0x2c]
	ldr r0, _0800BD1C @ =0x0828F984
_0800BCD4:
	adds r1, r1, r0
	ldr r0, [r1]
_0800BCD8:
	str r0, [r3, #0x34]
	movs r0, #0xc0
_0800BCDC:
	strh r0, [r3, #0x30]
_0800BCDE:
	strh r0, [r3, #0x38]
_0800BCE0:
	mov r1, r8
	cmp r1, #0x3e
	bne _0800BD60
	ldr r1, _0800BD20 @ =gSamusPaletteLength
	movs r0, #0x40
	strh r0, [r1]
	ldr r4, _0800BD24 @ =0x0828DEDC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSuitPalette
	ldr r4, _0800BD28 @ =0x0828DEFC
	ldr r0, _0800BD2C @ =0x030012D8
	ldrb r0, [r0, #2]
	cmp r0, #4
	bhi _0800BD06
	b _0800C0BA
_0800BD06:
	ldr r1, _0800BD30 @ =gSamusData
	ldrb r0, [r1, #0xf]
	mov ip, r1
	cmp r0, #0x4f
	bhi _0800BD34
	adds r0, #1
	strb r0, [r1, #0xf]
	b _0800BD40
	.align 2, 0
_0800BD18: .4byte 0x0828F96C
_0800BD1C: .4byte 0x0828F984
_0800BD20: .4byte gSamusPaletteLength
_0800BD24: .4byte 0x0828DEDC
_0800BD28: .4byte 0x0828DEFC
_0800BD2C: .4byte 0x030012D8
_0800BD30: .4byte gSamusData
_0800BD34:
	ldr r1, _0800BD50 @ =gMainGameMode
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0800BD54 @ =gSubGameMode1
	movs r0, #0
	strh r0, [r1]
_0800BD40:
	mov r2, ip
	ldrb r0, [r2, #0xf]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0x3b
	bhi _0800BD58
	lsrs r1, r1, #0x1a
	b _0800BD5A
	.align 2, 0
_0800BD50: .4byte gMainGameMode
_0800BD54: .4byte gSubGameMode1
_0800BD58:
	movs r1, #0xf
_0800BD5A:
	lsls r0, r1, #5
	adds r4, r4, r0
	b _0800C0BA
_0800BD60:
	mov r3, ip
	ldrb r0, [r3, #5]
	cmp r0, #0
	beq _0800BD8C
	ldr r0, _0800BD80 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #1
	bhi _0800BD8C
_0800BD74:
	ldr r1, _0800BD84 @ =gSamusPaletteLength
	movs r0, #0x40
	strh r0, [r1]
	ldr r4, _0800BD88 @ =0x0828DDFC
	b _0800C0AE
	.align 2, 0
_0800BD80: .4byte gFrameCounter8Bit
_0800BD84: .4byte gSamusPaletteLength
_0800BD88: .4byte 0x0828DDFC
_0800BD8C:
	mov r1, sb
	ldrb r0, [r1, #3]
	cmp r0, #0
	beq _0800BDB4
	ldr r1, _0800BDAC @ =gSamusPaletteLength
	movs r0, #0x40
	strh r0, [r1]
	mov r2, sb
	ldrb r1, [r2, #3]
	movs r0, #0x30
	subs r0, r0, r1
	asrs r1, r0, #1
	lsls r1, r1, #5
	ldr r0, _0800BDB0 @ =0x0828E13C
	b _0800C0AC
	.align 2, 0
_0800BDAC: .4byte gSamusPaletteLength
_0800BDB0: .4byte 0x0828E13C
_0800BDB4:
	mov r3, sb
	ldrb r0, [r3, #0x14]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0800BD74
	mov r0, r8
	subs r0, #0x1e
	cmp r0, #0x1f
	bls _0800BDCC
	b _0800BFC0
_0800BDCC:
	lsls r0, r0, #2
	ldr r1, _0800BDD8 @ =_0800BDDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800BDD8: .4byte _0800BDDC
_0800BDDC: @ jump table
	.4byte _0800BE74 @ case 0
	.4byte _0800BFC0 @ case 1
	.4byte _0800BFC0 @ case 2
	.4byte _0800BFC0 @ case 3
	.4byte _0800BFC0 @ case 4
	.4byte _0800BFC0 @ case 5
	.4byte _0800BFC0 @ case 6
	.4byte _0800BFC0 @ case 7
	.4byte _0800BFC0 @ case 8
	.4byte _0800BFC0 @ case 9
	.4byte _0800BFC0 @ case 10
	.4byte _0800BFC0 @ case 11
	.4byte _0800BFC0 @ case 12
	.4byte _0800BFC0 @ case 13
	.4byte _0800BFC0 @ case 14
	.4byte _0800BFC0 @ case 15
	.4byte _0800BFC0 @ case 16
	.4byte _0800BFC0 @ case 17
	.4byte _0800BE5C @ case 18
	.4byte _0800BE5C @ case 19
	.4byte _0800BE5C @ case 20
	.4byte _0800BE5C @ case 21
	.4byte _0800BFC0 @ case 22
	.4byte _0800BEEC @ case 23
	.4byte _0800BFC0 @ case 24
	.4byte _0800BFC0 @ case 25
	.4byte _0800BFC0 @ case 26
	.4byte _0800BFC0 @ case 27
	.4byte _0800BFC0 @ case 28
	.4byte _0800BFC0 @ case 29
	.4byte _0800BFC0 @ case 30
	.4byte _0800BF54 @ case 31
_0800BE5C:
	ldr r1, _0800BE6C @ =gSamusPaletteLength
	movs r0, #0x40
	strh r0, [r1]
	ldr r4, _0800BE70 @ =0x0828E0FC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	b _0800C0C0
	.align 2, 0
_0800BE6C: .4byte gSamusPaletteLength
_0800BE70: .4byte 0x0828E0FC
_0800BE74:
	ldr r0, _0800BE94 @ =gSamusPaletteLength
	movs r1, #0x40
	strh r1, [r0]
	mov r0, ip
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0800BEC0
	ldr r0, _0800BE98 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800BEA0
	ldr r4, _0800BE9C @ =0x0828DDDC
	b _0800BED4
	.align 2, 0
_0800BE94: .4byte gSamusPaletteLength
_0800BE98: .4byte gEquipment
_0800BE9C: .4byte 0x0828DDDC
_0800BEA0:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800BEB0
	ldr r4, _0800BEAC @ =0x0828DDBC
	b _0800BED4
	.align 2, 0
_0800BEAC: .4byte 0x0828DDBC
_0800BEB0:
	movs r0, #0x10
	ands r0, r1
	ldr r4, _0800BEBC @ =0x0828DD7C
	cmp r0, #0
	beq _0800BED4
	b _0800BED2
	.align 2, 0
_0800BEBC: .4byte 0x0828DD7C
_0800BEC0:
	cmp r0, #7
	bhi _0800BECC
	ldr r4, _0800BEC8 @ =0x0828DE3C
	b _0800BED4
	.align 2, 0
_0800BEC8: .4byte 0x0828DE3C
_0800BECC:
	ldr r4, _0800BEE4 @ =0x0828DE3C
	cmp r0, #0xc
	bhi _0800BED4
_0800BED2:
	adds r4, #0x20
_0800BED4:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSuitPalette
	ldr r4, _0800BEE8 @ =0x0828DE7C
	b _0800C0BA
	.align 2, 0
_0800BEE4: .4byte 0x0828DE3C
_0800BEE8: .4byte 0x0828DE7C
_0800BEEC:
	ldr r1, _0800BF10 @ =gSamusPaletteLength
	movs r0, #0x20
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x22
	ldrb r0, [r0]
	lsrs r1, r0, #1
	movs r0, #3
	ands r1, r0
	ldr r0, _0800BF14 @ =gEquipment
	ldrb r2, [r0, #0xc]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0800BF1C
	lsls r1, r1, #5
	ldr r0, _0800BF18 @ =0x0828F87C
	b _0800BF48
	.align 2, 0
_0800BF10: .4byte gSamusPaletteLength
_0800BF14: .4byte gEquipment
_0800BF18: .4byte 0x0828F87C
_0800BF1C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0800BF30
	lsls r1, r1, #5
	ldr r0, _0800BF2C @ =0x0828F7FC
	b _0800BF48
	.align 2, 0
_0800BF2C: .4byte 0x0828F7FC
_0800BF30:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0800BF44
	lsls r1, r1, #5
	ldr r0, _0800BF40 @ =0x0828F77C
	b _0800BF48
	.align 2, 0
_0800BF40: .4byte 0x0828F77C
_0800BF44:
	lsls r1, r1, #5
	ldr r0, _0800BF50 @ =0x0828F6FC
_0800BF48:
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #0
	b _0800C0BE
	.align 2, 0
_0800BF50: .4byte 0x0828F6FC
_0800BF54:
	ldr r1, _0800BF6C @ =gSamusPaletteLength
	movs r0, #0x40
	strh r0, [r1]
	ldr r0, _0800BF70 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800BF78
	ldr r1, _0800BF74 @ =0x0828EA8C
	b _0800BF9A
	.align 2, 0
_0800BF6C: .4byte gSamusPaletteLength
_0800BF70: .4byte gEquipment
_0800BF74: .4byte 0x0828EA8C
_0800BF78:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800BF88
	ldr r1, _0800BF84 @ =0x0828EA1C
	b _0800BF9A
	.align 2, 0
_0800BF84: .4byte 0x0828EA1C
_0800BF88:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800BF98
	ldr r1, _0800BF94 @ =0x0828E9AC
	b _0800BF9A
	.align 2, 0
_0800BF94: .4byte 0x0828E9AC
_0800BF98:
	ldr r1, _0800BFB8 @ =0x0828E93C
_0800BF9A:
	mov r0, ip
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSuitPalette
	ldr r4, _0800BFBC @ =0x0828E61C
	b _0800C0BA
	.align 2, 0
_0800BFB8: .4byte 0x0828E93C
_0800BFBC: .4byte 0x0828E61C
_0800BFC0:
	ldr r0, _0800BFE8 @ =gSamusPaletteLength
	movs r1, #0x40
	strh r1, [r0]
	mov r1, ip
	ldrb r0, [r1, #6]
	cmp r0, #0
	bne _0800BFD6
	ldr r0, _0800BFEC @ =0x030012D8
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0800BFFC
_0800BFD6:
	ldr r0, _0800BFF0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	ldr r4, _0800BFF4 @ =0x0828DEBC
	cmp r0, #0
	beq _0800C0AE
	ldr r4, _0800BFF8 @ =0x0828DE9C
	b _0800C0AE
	.align 2, 0
_0800BFE8: .4byte gSamusPaletteLength
_0800BFEC: .4byte 0x030012D8
_0800BFF0: .4byte gFrameCounter8Bit
_0800BFF4: .4byte 0x0828DEBC
_0800BFF8: .4byte 0x0828DE9C
_0800BFFC:
	mov r2, ip
	ldrb r0, [r2, #0xc]
	cmp r0, #0x3f
	bls _0800C0CC
	ldr r1, _0800C018 @ =gEquipment
	ldrb r2, [r1, #0xc]
	movs r0, #0x80
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _0800C01C
	movs r1, #0xc
	b _0800C038
	.align 2, 0
_0800C018: .4byte gEquipment
_0800C01C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0800C028
	movs r1, #8
	b _0800C038
_0800C028:
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
	movs r0, #4
	ands r1, r0
_0800C038:
	mov r2, ip
	ldrb r0, [r2, #0xc]
	subs r0, #0x40
	asrs r0, r0, #2
	adds r1, r1, r0
	ldrb r2, [r3, #0xa]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0800C058
	lsls r1, r1, #5
	ldr r0, _0800C054 @ =0x0828F4FC
	b _0800C0AC
	.align 2, 0
_0800C054: .4byte 0x0828F4FC
_0800C058:
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0800C06C
	lsls r1, r1, #5
	ldr r0, _0800C068 @ =0x0828F2FC
	b _0800C0AC
	.align 2, 0
_0800C068: .4byte 0x0828F2FC
_0800C06C:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0800C080
	lsls r1, r1, #5
	ldr r0, _0800C07C @ =0x0828F0FC
	b _0800C0AC
	.align 2, 0
_0800C07C: .4byte 0x0828F0FC
_0800C080:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0800C094
	lsls r1, r1, #5
	ldr r0, _0800C090 @ =0x0828EEFC
	b _0800C0AC
	.align 2, 0
_0800C090: .4byte 0x0828EEFC
_0800C094:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800C0A8
	lsls r1, r1, #5
	ldr r0, _0800C0A4 @ =0x0828ECFC
	b _0800C0AC
	.align 2, 0
_0800C0A4: .4byte 0x0828ECFC
_0800C0A8:
	lsls r1, r1, #5
	ldr r0, _0800C0C8 @ =0x0828EAFC
_0800C0AC:
	adds r4, r1, r0
_0800C0AE:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSuitPalette
_0800C0BA:
	adds r0, r4, #0
	movs r1, #0x10
_0800C0BE:
	movs r2, #0x10
_0800C0C0:
	movs r3, #0
	bl SetSuitPalette
	b _0800C120
	.align 2, 0
_0800C0C8: .4byte 0x0828EAFC
_0800C0CC:
	ldr r0, _0800C0DC @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800C0E4
	ldr r4, _0800C0E0 @ =0x0828DDDC
	b _0800C100
	.align 2, 0
_0800C0DC: .4byte gEquipment
_0800C0E0: .4byte 0x0828DDDC
_0800C0E4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800C0F4
	ldr r4, _0800C0F0 @ =0x0828DDBC
	b _0800C100
	.align 2, 0
_0800C0F0: .4byte 0x0828DDBC
_0800C0F4:
	movs r0, #0x10
	ands r0, r1
	ldr r4, _0800C12C @ =0x0828DD7C
	cmp r0, #0
	beq _0800C100
	adds r4, #0x20
_0800C100:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetSuitPalette
	mov r3, r8
	cmp r3, #0x34
	beq _0800C114
	ldr r4, _0800C130 @ =0x0828DE1C
_0800C114:
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetSuitPalette
_0800C120:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C12C: .4byte 0x0828DD7C
_0800C130: .4byte 0x0828DE1C

	thumb_func_start CheckPlayLowHealthSound
CheckPlayLowHealthSound: @ 0x0800C134
	push {lr}
	ldr r0, _0800C164 @ =gEquipment
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq _0800C160
	ldr r0, _0800C168 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3e
	beq _0800C160
	ldr r0, _0800C16C @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _0800C160
	ldr r0, _0800C170 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0800C160
	movs r0, #0x8d
	bl unk_3b78
_0800C160:
	pop {r0}
	bx r0
	.align 2, 0
_0800C164: .4byte gEquipment
_0800C168: .4byte gSamusData
_0800C16C: .4byte gPreventMovementTimer
_0800C170: .4byte gFrameCounter8Bit

	thumb_func_start SamusUpdateDrawDistanceAndStandingStatus
SamusUpdateDrawDistanceAndStandingStatus: @ 0x0800C174
	push {r4, r5, lr}
	ldr r3, _0800C1C8 @ =0x0828D794
	ldr r0, _0800C1CC @ =gSamusData
	mov ip, r0
	ldrb r1, [r0, #1]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r0, r0, r3
	ldrb r1, [r0]
	ldr r2, _0800C1D0 @ =0x0828FC8C
	lsls r1, r1, #3
	adds r0, r1, r2
	ldrh r0, [r0]
	movs r4, #0
	mov r5, ip
	strh r0, [r5, #0x24]
	adds r0, r2, #2
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0x26]
	adds r0, r2, #4
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r5, #0x28]
	adds r2, #6
	adds r1, r1, r2
	ldrh r0, [r1]
	strh r0, [r5, #0x2a]
	ldrb r1, [r5, #1]
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r3, #4
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r2, r1, #0
	cmp r1, #2
	bne _0800C1D4
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	strh r4, [r5, #0x1e]
	b _0800C1E6
	.align 2, 0
_0800C1C8: .4byte 0x0828D794
_0800C1CC: .4byte gSamusData
_0800C1D0: .4byte 0x0828FC8C
_0800C1D4:
	mov r1, ip
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _0800C1E4
	mov r0, ip
	strh r4, [r0, #0x1e]
	b _0800C1E6
_0800C1E4:
	strb r2, [r1]
_0800C1E6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SamusUpdateArmCannonOffset
SamusUpdateArmCannonOffset: @ 0x0800C1EC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _0800C20C @ =gSamusData
	ldrb r2, [r0, #1]
	ldrb r3, [r0, #7]
	adds r5, r0, #0
	cmp r2, #0x2f
	bls _0800C200
	b _0800C3A4
_0800C200:
	lsls r0, r2, #2
	ldr r1, _0800C210 @ =_0800C214
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800C20C: .4byte gSamusData
_0800C210: .4byte _0800C214
_0800C214: @ jump table
	.4byte _0800C2D4 @ case 0
	.4byte _0800C2E0 @ case 1
	.4byte _0800C2EC @ case 2
	.4byte _0800C2F8 @ case 3
	.4byte _0800C304 @ case 4
	.4byte _0800C310 @ case 5
	.4byte _0800C31C @ case 6
	.4byte _0800C328 @ case 7
	.4byte _0800C334 @ case 8
	.4byte _0800C340 @ case 9
	.4byte _0800C3A4 @ case 10
	.4byte _0800C3A4 @ case 11
	.4byte _0800C3A4 @ case 12
	.4byte _0800C3A4 @ case 13
	.4byte _0800C3A4 @ case 14
	.4byte _0800C3A4 @ case 15
	.4byte _0800C3A4 @ case 16
	.4byte _0800C3A4 @ case 17
	.4byte _0800C3A4 @ case 18
	.4byte _0800C3A4 @ case 19
	.4byte _0800C3A4 @ case 20
	.4byte _0800C3A4 @ case 21
	.4byte _0800C3A4 @ case 22
	.4byte _0800C3A4 @ case 23
	.4byte _0800C34C @ case 24
	.4byte _0800C3A4 @ case 25
	.4byte _0800C3A4 @ case 26
	.4byte _0800C3A4 @ case 27
	.4byte _0800C3A4 @ case 28
	.4byte _0800C3A4 @ case 29
	.4byte _0800C3A4 @ case 30
	.4byte _0800C3A4 @ case 31
	.4byte _0800C3A4 @ case 32
	.4byte _0800C3A4 @ case 33
	.4byte _0800C3A4 @ case 34
	.4byte _0800C3A4 @ case 35
	.4byte _0800C3A4 @ case 36
	.4byte _0800C3A4 @ case 37
	.4byte _0800C3A4 @ case 38
	.4byte _0800C3A4 @ case 39
	.4byte _0800C374 @ case 40
	.4byte _0800C380 @ case 41
	.4byte _0800C3A4 @ case 42
	.4byte _0800C3A4 @ case 43
	.4byte _0800C3A4 @ case 44
	.4byte _0800C3A4 @ case 45
	.4byte _0800C38C @ case 46
	.4byte _0800C398 @ case 47
_0800C2D4:
	ldr r0, _0800C2DC @ =0x0828DAE4
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C2DC: .4byte 0x0828DAE4
_0800C2E0:
	ldr r0, _0800C2E8 @ =0x0828DB0C
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C2E8: .4byte 0x0828DB0C
_0800C2EC:
	ldr r0, _0800C2F4 @ =0x0828DB34
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C2F4: .4byte 0x0828DB34
_0800C2F8:
	ldr r0, _0800C300 @ =0x0828DB5C
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C300: .4byte 0x0828DB5C
_0800C304:
	ldr r0, _0800C30C @ =0x0828DB7C
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C30C: .4byte 0x0828DB7C
_0800C310:
	ldr r0, _0800C318 @ =0x0828DBAC
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C318: .4byte 0x0828DBAC
_0800C31C:
	ldr r0, _0800C324 @ =0x0828DBDC
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C324: .4byte 0x0828DBDC
_0800C328:
	ldr r0, _0800C330 @ =0x0828DC54
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C330: .4byte 0x0828DC54
_0800C334:
	ldr r0, _0800C33C @ =0x0828DC2C
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C33C: .4byte 0x0828DC2C
_0800C340:
	ldr r0, _0800C348 @ =0x0828DC54
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C348: .4byte 0x0828DC54
_0800C34C:
	ldr r2, _0800C36C @ =gButtonInput
	ldrh r1, [r5, #0x12]
	movs r0, #0x30
	eors r1, r0
	ldrh r0, [r2]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
	ldr r2, _0800C370 @ =0x0828DC7C
	lsls r0, r4, #2
	lsls r1, r3, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r1, [r0]
	b _0800C3B0
	.align 2, 0
_0800C36C: .4byte gButtonInput
_0800C370: .4byte 0x0828DC7C
_0800C374:
	ldr r0, _0800C37C @ =0x0828DCBC
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C37C: .4byte 0x0828DCBC
_0800C380:
	ldr r0, _0800C388 @ =0x0828DCEC
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C388: .4byte 0x0828DCEC
_0800C38C:
	ldr r0, _0800C394 @ =0x0828DD1C
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C394: .4byte 0x0828DD1C
_0800C398:
	ldr r0, _0800C3A0 @ =0x0828DD4C
	lsls r1, r4, #2
	lsls r2, r3, #3
	b _0800C3AA
	.align 2, 0
_0800C3A0: .4byte 0x0828DD4C
_0800C3A4:
	ldr r0, _0800C3D4 @ =0x0828D8DC
	lsls r1, r4, #2
	lsls r2, r2, #3
_0800C3AA:
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r1, [r1]
_0800C3B0:
	adds r0, r5, #0
	adds r0, #0x22
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r1, r1, r0
	ldr r2, [r1]
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0800C3E0
	ldr r1, _0800C3D8 @ =gSamusGraphicsInfo
	ldr r4, _0800C3DC @ =0xFFFFFF00
	adds r0, r3, r4
	strh r0, [r1, #0x24]
	adds r3, r1, #0
	b _0800C3E6
	.align 2, 0
_0800C3D4: .4byte 0x0828D8DC
_0800C3D8: .4byte gSamusGraphicsInfo
_0800C3DC: .4byte 0xFFFFFF00
_0800C3E0:
	ldr r0, _0800C404 @ =gSamusGraphicsInfo
	strh r3, [r0, #0x24]
	adds r3, r0, #0
_0800C3E6:
	ldrh r0, [r3, #0x24]
	adds r0, #1
	strh r0, [r3, #0x24]
	movs r0, #2
	ldrsh r1, [r2, r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C40C
	ldr r2, _0800C408 @ =0xFFFFFE00
	adds r0, r1, r2
	strh r0, [r3, #0x22]
	b _0800C40E
	.align 2, 0
_0800C404: .4byte gSamusGraphicsInfo
_0800C408: .4byte 0xFFFFFE00
_0800C40C:
	strh r1, [r3, #0x22]
_0800C40E:
	ldrb r0, [r5, #1]
	cmp r0, #0xf
	bgt _0800C424
	cmp r0, #0xc
	blt _0800C424
	ldrh r0, [r5, #0x1e]
	cmp r0, #0
	beq _0800C448
	ldrh r0, [r3, #0x24]
	adds r0, #2
	b _0800C446
_0800C424:
	ldrh r2, [r5, #0x1e]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0800C434
	ldrh r0, [r3, #0x22]
	adds r0, #2
	b _0800C440
_0800C434:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0800C448
	ldrh r0, [r3, #0x22]
	subs r0, #2
_0800C440:
	strh r0, [r3, #0x22]
	ldrh r0, [r3, #0x24]
	adds r0, #1
_0800C446:
	strh r0, [r3, #0x24]
_0800C448:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SamusInit
SamusInit: @ 0x0800C450
	push {r4, r5, r6, r7, lr}
	ldr r0, _0800C550 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800C4D6
	ldr r0, _0800C554 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _0800C558 @ =0x0828D258
	cmp r0, #0
	bne _0800C4AC
	movs r4, #0
	ldr r2, _0800C55C @ =0x030012F0
	ldrb r0, [r2, #0x13]
	cmp r0, #0xf
	bls _0800C478
	movs r4, #1
_0800C478:
	ldr r1, _0800C560 @ =0x030012E4
	adds r0, r3, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	adds r1, r2, #0
	adds r0, r3, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, #4
	adds r0, r3, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldr r0, [r0]
	str r0, [r1]
	cmp r4, #0
	beq _0800C4A0
	movs r0, #0x80
	strb r0, [r2, #0x13]
_0800C4A0:
	ldr r1, _0800C564 @ =gSamusData
	ldrb r0, [r1, #0xc]
	cmp r0, #0xf
	bls _0800C4AC
	movs r0, #0x40
	strb r0, [r1, #0xc]
_0800C4AC:
	ldr r0, _0800C568 @ =0x0300144C
	movs r2, #0
	strh r2, [r0]
	ldr r0, _0800C56C @ =0x0300144E
	strb r2, [r0]
	ldr r1, _0800C570 @ =gSaXData
	adds r0, r3, #0
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldm r0!, {r4, r6, r7}
	stm r1!, {r4, r6, r7}
	ldr r0, _0800C574 @ =gPoseLock
	strb r2, [r0]
	ldr r1, _0800C578 @ =0x03001330
	adds r0, r3, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldr r0, [r0]
	str r0, [r1]
_0800C4D6:
	ldr r0, _0800C57C @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800C54A
	ldr r0, _0800C554 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800C54A
	ldr r1, _0800C580 @ =gEquipment
	ldr r0, _0800C584 @ =0x0828D2AC
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _0800C564 @ =gSamusData
	ldr r0, _0800C588 @ =0x0828D280
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0800C58C @ =gSamusGraphicsInfo
	ldr r4, _0800C558 @ =0x0828D258
	adds r1, r4, #0
	movs r2, #0x3c
	bl memcpy
	ldr r1, _0800C590 @ =0x030012D8
	adds r0, r4, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldr r2, _0800C55C @ =0x030012F0
	adds r1, r2, #0
	adds r0, r4, #0
	ldm r0!, {r3, r5, r6}
	stm r1!, {r3, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r2, #0x10
	adds r0, r4, #0
	ldm r0!, {r1, r3, r7}
	stm r2!, {r1, r3, r7}
	ldr r0, [r0]
	str r0, [r2]
	ldr r0, _0800C570 @ =gSaXData
	ldm r4!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
	ldm r4!, {r1, r2, r3}
	stm r0!, {r1, r2, r3}
	ldm r4!, {r5, r6, r7}
	stm r0!, {r5, r6, r7}
_0800C54A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C550: .4byte gPauseScreenFlag
_0800C554: .4byte gIsLoadingFile
_0800C558: .4byte 0x0828D258
_0800C55C: .4byte 0x030012F0
_0800C560: .4byte 0x030012E4
_0800C564: .4byte gSamusData
_0800C568: .4byte 0x0300144C
_0800C56C: .4byte 0x0300144E
_0800C570: .4byte gSaXData
_0800C574: .4byte gPoseLock
_0800C578: .4byte 0x03001330
_0800C57C: .4byte gUnk_03000be3
_0800C580: .4byte gEquipment
_0800C584: .4byte 0x0828D2AC
_0800C588: .4byte 0x0828D280
_0800C58C: .4byte gSamusGraphicsInfo
_0800C590: .4byte 0x030012D8

	thumb_func_start SamusDraw
SamusDraw: @ 0x0800C594
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #2
	str r0, [sp]
	ldr r0, _0800C5B8 @ =gSamusData
	ldrb r1, [r0, #1]
	cmp r1, #0x3e
	bne _0800C5C0
	movs r1, #0
	str r1, [sp]
	ldr r0, _0800C5BC @ =gNextOamSlot
	strb r1, [r0]
	b _0800C5CC
	.align 2, 0
_0800C5B8: .4byte gSamusData
_0800C5BC: .4byte gNextOamSlot
_0800C5C0:
	ldr r0, _0800C6F4 @ =gSamusOnTopOfBackgrounds
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800C5CC
	movs r0, #1
	str r0, [sp]
_0800C5CC:
	ldr r1, _0800C6F8 @ =gNextOamSlot
	ldrb r0, [r1]
	cmp r0, #0x6a
	bls _0800C5D8
	movs r0, #0x6a
	strb r0, [r1]
_0800C5D8:
	ldr r5, _0800C6FC @ =gOamData
	ldr r2, _0800C6F8 @ =gNextOamSlot
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r5, r0, r5
	adds r7, r1, #0
	adds r6, r7, #0
	movs r1, #0
	ldr r0, _0800C700 @ =0x030012F0
	str r0, [sp, #0xc]
	str r0, [sp, #4]
	ldr r2, [sp]
	str r2, [sp, #8]
_0800C5F2:
	lsls r1, r1, #0x10
	asrs r2, r1, #0xc
	ldr r0, [sp, #4]
	adds r3, r2, r0
	ldrb r0, [r3]
	str r1, [sp, #0x10]
	cmp r0, #0
	beq _0800C69C
	ldr r0, [sp, #0xc]
	adds r0, #0xc
	adds r0, r2, r0
	ldr r4, [r0]
	ldrh r0, [r4]
	adds r4, #2
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r1, [r3, #8]
	lsrs r1, r1, #2
	ldr r2, _0800C704 @ =gBg1XPosition
	ldrh r0, [r2]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r1, [r3, #0xa]
	lsrs r1, r1, #2
	ldr r2, _0800C708 @ =gBg1YPosition
	ldrh r0, [r2]
	lsrs r0, r0, #2
	subs r1, r1, r0
	adds r1, #2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	cmp r6, r7
	bhs _0800C69C
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldr r2, [sp, #8]
	lsls r2, r2, #2
	mov r8, r2
	ldr r0, _0800C70C @ =0x000001FF
	mov sl, r0
_0800C650:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	lsls r3, r6, #3
	ldr r1, _0800C6FC @ =gOamData
	adds r3, r3, r1
	add r0, ip
	strb r0, [r3]
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	mov r2, sb
	adds r1, r0, r2
	mov r0, sl
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _0800C710 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r1, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #5]
	adds r5, #4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _0800C650
_0800C69C:
	ldr r2, [sp, #0x10]
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r2, r1
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	ble _0800C5F2
	ldr r2, _0800C714 @ =gSamusData
	ldrh r0, [r2, #0x16]
	lsrs r0, r0, #2
	ldr r2, _0800C704 @ =gBg1XPosition
	ldrh r1, [r2]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, _0800C714 @ =gSamusData
	ldrh r0, [r1, #0x18]
	lsrs r0, r0, #2
	ldr r2, _0800C708 @ =gBg1YPosition
	ldrh r1, [r2]
	lsrs r1, r1, #2
	subs r0, r0, r1
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r1, _0800C714 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0xf
	bgt _0800C718
	cmp r0, #0xc
	blt _0800C718
	ldrh r0, [r1, #0x1e]
	cmp r0, #0
	beq _0800C756
	mov r2, ip
	lsls r0, r2, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xa
	adds r0, r0, r1
	b _0800C752
	.align 2, 0
_0800C6F4: .4byte gSamusOnTopOfBackgrounds
_0800C6F8: .4byte gNextOamSlot
_0800C6FC: .4byte gOamData
_0800C700: .4byte 0x030012F0
_0800C704: .4byte gBg1XPosition
_0800C708: .4byte gBg1YPosition
_0800C70C: .4byte 0x000001FF
_0800C710: .4byte 0xFFFFFE00
_0800C714: .4byte gSamusData
_0800C718:
	ldr r2, _0800C730 @ =gSamusData
	ldrh r1, [r2, #0x1e]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800C734
	mov r1, r8
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #0xa
	b _0800C742
	.align 2, 0
_0800C730: .4byte gSamusData
_0800C734:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800C756
	mov r1, r8
	lsls r0, r1, #0x10
	ldr r2, _0800C9B0 @ =0xFFFE0000
_0800C742:
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	mov r8, r0
	mov r1, ip
	lsls r0, r1, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
_0800C752:
	lsrs r0, r0, #0x10
	mov ip, r0
_0800C756:
	ldr r0, _0800C9B4 @ =gSamusGraphicsInfo
	ldrh r1, [r0, #0x26]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0800C7D0
	ldr r1, _0800C9B4 @ =gSamusGraphicsInfo
	ldr r4, [r1, #0x28]
	ldrh r0, [r4]
	adds r4, #2
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r6, r7
	bhs _0800C7D0
	mov r2, r8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [sp]
	lsls r0, r0, #2
	mov sb, r0
_0800C784:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	lsls r3, r6, #3
	ldr r1, _0800C9B8 @ =gOamData
	adds r3, r3, r1
	add r0, ip
	strb r0, [r3]
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	mov r2, sl
	adds r1, r0, r2
	ldr r0, _0800C9BC @ =0x000001FF
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _0800C9C0 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r1, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r3, #5]
	adds r5, #4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _0800C784
_0800C7D0:
	ldr r2, _0800C9B4 @ =gSamusGraphicsInfo
	ldr r4, [r2]
	ldrb r0, [r4]
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r4, #2
	cmp r6, r7
	bhs _0800C83C
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldr r2, [sp]
	lsls r2, r2, #2
	mov sb, r2
_0800C7F0:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	lsls r3, r6, #3
	ldr r1, _0800C9B8 @ =gOamData
	adds r3, r3, r1
	add r0, ip
	strb r0, [r3]
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	mov r2, sl
	adds r1, r0, r2
	ldr r0, _0800C9BC @ =0x000001FF
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _0800C9C0 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r1, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r3, #5]
	adds r5, #4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _0800C7F0
_0800C83C:
	ldr r2, _0800C9B4 @ =gSamusGraphicsInfo
	ldrh r1, [r2, #0x26]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _0800C8B8
	ldr r4, [r2, #0x28]
	ldrh r0, [r4]
	adds r4, #2
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r6, r7
	bhs _0800C8B8
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldr r2, [sp]
	lsls r2, r2, #2
	mov r8, r2
	ldr r0, _0800C9BC @ =0x000001FF
	mov sl, r0
_0800C86C:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	lsls r3, r6, #3
	ldr r1, _0800C9B8 @ =gOamData
	adds r3, r3, r1
	add r0, ip
	strb r0, [r3]
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	mov r2, sb
	adds r1, r0, r2
	mov r0, sl
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _0800C9C0 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r1, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #5]
	adds r5, #4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _0800C86C
_0800C8B8:
	ldr r2, _0800C9C4 @ =0x030012E4
	ldrb r0, [r2]
	cmp r0, #0
	beq _0800C99A
	ldr r0, _0800C9C8 @ =0x0300144C
	ldrb r1, [r2, #2]
	lsls r1, r1, #2
	ldrh r0, [r0]
	subs r0, r0, r1
	subs r0, #3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0800C9CC @ =0x0300144E
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800C8E2
	lsls r0, r1, #0x10
	cmp r0, #0
	blt _0800C99A
_0800C8E2:
	ldr r2, _0800C9B4 @ =gSamusGraphicsInfo
	ldr r4, [r2]
	ldrb r0, [r4]
	adds r0, r7, r0
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r4, #2
	movs r2, #0x3f
	ldr r3, _0800C9D0 @ =0x0300134C
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r2, r3
	ldrh r0, [r0]
	lsrs r0, r0, #2
	mov sb, r0
	ldr r0, _0800C9D4 @ =gBg1XPosition
	ldrh r0, [r0]
	mov r8, r0
	mov r1, r8
	lsrs r1, r1, #2
	mov r0, sb
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r3, #0x80
	adds r2, r2, r3
	ldrh r0, [r2]
	lsrs r0, r0, #2
	ldr r2, _0800C9D8 @ =gBg1YPosition
	ldrh r1, [r2]
	lsrs r1, r1, #2
	subs r0, r0, r1
	adds r0, #2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	cmp r6, r7
	bhs _0800C98E
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldr r2, [sp]
	lsls r2, r2, #2
	mov r8, r2
	ldr r0, _0800C9BC @ =0x000001FF
	mov sl, r0
_0800C942:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	lsls r3, r6, #3
	ldr r1, _0800C9B8 @ =gOamData
	adds r3, r3, r1
	add r0, ip
	strb r0, [r3]
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	mov r2, sb
	adds r1, r0, r2
	mov r0, sl
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _0800C9C0 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r1, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #5]
	adds r5, #4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, r7
	blo _0800C942
_0800C98E:
	ldr r2, _0800C9C4 @ =0x030012E4
	ldrb r0, [r2, #2]
	adds r0, #1
	movs r1, #3
	ands r0, r1
	strb r0, [r2, #2]
_0800C99A:
	ldr r0, _0800C9DC @ =gNextOamSlot
	strb r7, [r0]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800C9B0: .4byte 0xFFFE0000
_0800C9B4: .4byte gSamusGraphicsInfo
_0800C9B8: .4byte gOamData
_0800C9BC: .4byte 0x000001FF
_0800C9C0: .4byte 0xFFFFFE00
_0800C9C4: .4byte 0x030012E4
_0800C9C8: .4byte 0x0300144C
_0800C9CC: .4byte 0x0300144E
_0800C9D0: .4byte 0x0300134C
_0800C9D4: .4byte gBg1XPosition
_0800C9D8: .4byte gBg1YPosition
_0800C9DC: .4byte gNextOamSlot

	thumb_func_start DemoMainLoop
DemoMainLoop: @ 0x0800C9E0
	push {lr}
	ldr r0, _0800C9F0 @ =gDemoState
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800C9F4
	bl RecordDemo
	b _0800C9FC
	.align 2, 0
_0800C9F0: .4byte gDemoState
_0800C9F4:
	cmp r0, #2
	bne _0800C9FC
	bl UpdateDemoInput
_0800C9FC:
	pop {r0}
	bx r0

	thumb_func_start RecordDemo
RecordDemo: @ 0x0800CA00
	push {r4, r5, r6, r7, lr}
	ldr r3, _0800CA14 @ =0x03004C12
	ldrh r0, [r3]
	cmp r0, #0xfd
	bls _0800CA1C
	ldr r1, _0800CA18 @ =gChangedInput
	movs r0, #8
	strh r0, [r1]
	b _0800CA7C
	.align 2, 0
_0800CA14: .4byte 0x03004C12
_0800CA18: .4byte gChangedInput
_0800CA1C:
	ldr r1, _0800CA54 @ =gButtonInput
	ldr r6, _0800CA58 @ =0x03004812
	ldrh r2, [r3]
	lsls r5, r2, #1
	adds r0, r5, r6
	ldrh r4, [r1]
	ldrh r0, [r0]
	cmp r4, r0
	bne _0800CA64
	ldr r7, _0800CA5C @ =0x03004A12
	adds r0, r5, r7
	ldrh r1, [r0]
	ldr r0, _0800CA60 @ =0x0000FFFF
	cmp r1, r0
	bne _0800CA46
	adds r0, r2, #1
	strh r0, [r3]
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
_0800CA46:
	ldrh r1, [r3]
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0800CA7C
	.align 2, 0
_0800CA54: .4byte gButtonInput
_0800CA58: .4byte 0x03004812
_0800CA5C: .4byte 0x03004A12
_0800CA60: .4byte 0x0000FFFF
_0800CA64:
	adds r0, r2, #1
	strh r0, [r3]
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r6
	strh r4, [r0]
	ldr r1, _0800CA84 @ =0x03004A12
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #1
	strh r1, [r0]
_0800CA7C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800CA84: .4byte 0x03004A12

	thumb_func_start UpdateDemoInput
UpdateDemoInput: @ 0x0800CA88
	push {r4, r5, r6, lr}
	ldr r3, _0800CAB8 @ =0x03004C12
	ldrh r5, [r3]
	ldr r6, _0800CABC @ =gButtonInput
	cmp r5, #0xfd
	bhi _0800CAA6
	ldr r4, _0800CAC0 @ =0x03004C14
	ldrh r1, [r4]
	ldr r0, _0800CAC4 @ =0x0000FFFF
	cmp r1, r0
	beq _0800CAA6
	adds r2, r6, #0
	ldrh r0, [r2]
	cmp r0, #0
	beq _0800CACC
_0800CAA6:
	ldr r0, _0800CAC8 @ =gChangedInput
	movs r1, #8
	strh r1, [r0]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0800CB00
	movs r0, #0
	strh r0, [r6]
	b _0800CB00
	.align 2, 0
_0800CAB8: .4byte 0x03004C12
_0800CABC: .4byte gButtonInput
_0800CAC0: .4byte 0x03004C14
_0800CAC4: .4byte 0x0000FFFF
_0800CAC8: .4byte gChangedInput
_0800CACC:
	cmp r1, #0
	bne _0800CAE0
	adds r0, r5, #1
	strh r0, [r3]
	ldr r1, _0800CB08 @ =0x03004A12
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4]
_0800CAE0:
	ldr r1, _0800CB0C @ =0x03004812
	ldrh r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r3, _0800CB10 @ =gChangedInput
	ldr r2, _0800CB14 @ =0x03004C16
	ldrh r0, [r2]
	eors r0, r1
	ands r0, r1
	strh r0, [r3]
	strh r1, [r2]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
_0800CB00:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CB08: .4byte 0x03004A12
_0800CB0C: .4byte 0x03004812
_0800CB10: .4byte gChangedInput
_0800CB14: .4byte 0x03004C16

	thumb_func_start CopyDemoInput
CopyDemoInput: @ 0x0800CB18
	ldr r2, _0800CB38 @ =gButtonInput
	ldr r1, _0800CB3C @ =0x03004812
	ldr r0, _0800CB40 @ =0x03004C12
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r2]
	ldr r3, _0800CB44 @ =gChangedInput
	ldr r2, _0800CB48 @ =0x03004C16
	ldrh r0, [r2]
	eors r0, r1
	ands r0, r1
	strh r0, [r3]
	strh r1, [r2]
	bx lr
	.align 2, 0
_0800CB38: .4byte gButtonInput
_0800CB3C: .4byte 0x03004812
_0800CB40: .4byte 0x03004C12
_0800CB44: .4byte gChangedInput
_0800CB48: .4byte 0x03004C16

	thumb_func_start ResetDemoInputAndDuration
ResetDemoInputAndDuration: @ 0x0800CB4C
	push {r4, r5, r6, lr}
	ldr r0, _0800CB78 @ =gDemoState
	ldrb r0, [r0]
	cmp r0, #1
	bne _0800CB90
	ldr r4, _0800CB7C @ =0x03004C14
	ldr r6, _0800CB80 @ =0x03004C12
	ldr r5, _0800CB84 @ =0x03004C16
	movs r3, #0
	ldr r2, _0800CB88 @ =0x03004A12
	ldr r1, _0800CB8C @ =0x03004812
	movs r0, #0xff
_0800CB64:
	strh r3, [r1]
	strh r3, [r2]
	adds r2, #2
	adds r1, #2
	subs r0, #1
	cmp r0, #0
	bge _0800CB64
	movs r0, #0
	strh r0, [r4]
	b _0800CB9C
	.align 2, 0
_0800CB78: .4byte gDemoState
_0800CB7C: .4byte 0x03004C14
_0800CB80: .4byte 0x03004C12
_0800CB84: .4byte 0x03004C16
_0800CB88: .4byte 0x03004A12
_0800CB8C: .4byte 0x03004812
_0800CB90:
	ldr r0, _0800CBA8 @ =0x03004C14
	ldr r1, _0800CBAC @ =0x03004A12
	ldrh r1, [r1]
	strh r1, [r0]
	ldr r6, _0800CBB0 @ =0x03004C12
	ldr r5, _0800CBB4 @ =0x03004C16
_0800CB9C:
	movs r0, #0
	strh r0, [r6]
	strh r0, [r5]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800CBA8: .4byte 0x03004C14
_0800CBAC: .4byte 0x03004A12
_0800CBB0: .4byte 0x03004C12
_0800CBB4: .4byte 0x03004C16

	thumb_func_start SA_XRunningGFX
SA_XRunningGFX: @ 0x0800CBB8
	push {lr}
	ldr r3, _0800CC10 @ =gSaXData
	ldr r2, _0800CC14 @ =0x0829AC60
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r3, #0x12]
	ldrb r0, [r0, #8]
	cmp r1, r0
	blo _0800CC08
	movs r0, #0
	strb r0, [r3, #0x12]
	ldrb r0, [r3, #0x13]
	adds r1, r0, #1
	strb r1, [r3, #0x13]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800CBF2
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _0800CBEC
	cmp r0, #9
	bne _0800CBF2
_0800CBEC:
	ldr r0, _0800CC18 @ =0x00000259
	bl PlaySound
_0800CBF2:
	ldr r2, _0800CC14 @ =0x0829AC60
	ldr r3, _0800CC10 @ =gSaXData
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CC08
	strb r0, [r3, #0x13]
_0800CC08:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CC10: .4byte gSaXData
_0800CC14: .4byte 0x0829AC60
_0800CC18: .4byte 0x00000259

	thumb_func_start SA_XWalkingGFX
SA_XWalkingGFX: @ 0x0800CC1C
	push {lr}
	ldr r3, _0800CC74 @ =gSaXData
	ldr r2, _0800CC78 @ =0x082B3F10
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r3, #0x12]
	ldrb r0, [r0, #8]
	cmp r1, r0
	blo _0800CC6E
	movs r0, #0
	strb r0, [r3, #0x12]
	ldrb r0, [r3, #0x13]
	adds r1, r0, #1
	strb r1, [r3, #0x13]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800CC58
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0800CC50
	cmp r0, #6
	bne _0800CC58
_0800CC50:
	movs r0, #0x96
	lsls r0, r0, #2
	bl PlaySound
_0800CC58:
	ldr r2, _0800CC78 @ =0x082B3F10
	ldr r3, _0800CC74 @ =gSaXData
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CC6E
	strb r0, [r3, #0x13]
_0800CC6E:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CC74: .4byte gSaXData
_0800CC78: .4byte 0x082B3F10

	thumb_func_start SA_XStandingGFX
SA_XStandingGFX: @ 0x0800CC7C
	push {lr}
	ldr r2, _0800CCB8 @ =gSaXData
	ldr r3, _0800CCBC @ =0x0829AF78
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CCB0
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CCB0
	strb r0, [r2, #0x13]
_0800CCB0:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CCB8: .4byte gSaXData
_0800CCBC: .4byte 0x0829AF78

	thumb_func_start SA_XShootingGFX
SA_XShootingGFX: @ 0x0800CCC0
	push {lr}
	ldr r2, _0800CCF8 @ =gSaXData
	ldr r3, _0800CCFC @ =0x0829AFA8
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CD00
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CD00
	movs r0, #2
	b _0800CD02
	.align 2, 0
_0800CCF8: .4byte gSaXData
_0800CCFC: .4byte 0x0829AFA8
_0800CD00:
	movs r0, #0xff
_0800CD02:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SA_XTurningGFX
SA_XTurningGFX: @ 0x0800CD08
	push {lr}
	ldr r2, _0800CD40 @ =gSaXData
	ldr r3, _0800CD44 @ =0x0829B08C
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CD48
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CD48
	movs r0, #2
	b _0800CD4A
	.align 2, 0
_0800CD40: .4byte gSaXData
_0800CD44: .4byte 0x0829B08C
_0800CD48:
	movs r0, #0xff
_0800CD4A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SA_XMidAirGFX
SA_XMidAirGFX: @ 0x0800CD50
	push {lr}
	ldr r2, _0800CD90 @ =gSaXData
	ldr r3, _0800CD94 @ =0x082ABD88
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CD8A
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CD8A
	strb r0, [r2, #0x13]
	ldr r0, _0800CD98 @ =0x0000025B
	bl PlaySound
_0800CD8A:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CD90: .4byte gSaXData
_0800CD94: .4byte 0x082ABD88
_0800CD98: .4byte 0x0000025B

	thumb_func_start SA_XLandingGFX
SA_XLandingGFX: @ 0x0800CD9C
	push {lr}
	ldr r2, _0800CDD4 @ =gSaXData
	ldr r3, _0800CDD8 @ =0x082A97AC
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CDDC
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CDDC
	movs r0, #2
	b _0800CDDE
	.align 2, 0
_0800CDD4: .4byte gSaXData
_0800CDD8: .4byte 0x082A97AC
_0800CDDC:
	movs r0, #0xff
_0800CDDE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SA_XShootingRestrictedLaboratoryGFX
SA_XShootingRestrictedLaboratoryGFX: @ 0x0800CDE4
	push {lr}
	ldr r2, _0800CE20 @ =gSaXData
	ldr r3, _0800CE24 @ =0x082B0D60
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CE18
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CE18
	strb r0, [r2, #0x13]
_0800CE18:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CE20: .4byte gSaXData
_0800CE24: .4byte 0x082B0D60

	thumb_func_start SA_XCoveredByMetroidsGFX
SA_XCoveredByMetroidsGFX: @ 0x0800CE28
	push {lr}
	ldr r2, _0800CE64 @ =gSaXData
	ldr r3, _0800CE68 @ =0x082B0FC4
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CE5C
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CE5C
	strb r0, [r2, #0x13]
_0800CE5C:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CE64: .4byte gSaXData
_0800CE68: .4byte 0x082B0FC4

	thumb_func_start SA_XKneelingGFX
SA_XKneelingGFX: @ 0x0800CE6C
	push {r4, lr}
	ldr r4, _0800CEB4 @ =gSaXData
	ldrh r0, [r4, #0x12]
	cmp r0, #1
	bne _0800CE7C
	movs r0, #0x9d
	bl PlaySound
_0800CE7C:
	ldr r2, _0800CEB8 @ =0x082A99C8
	ldrb r0, [r4, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r4, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CEAC
	movs r0, #0
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	ldrb r1, [r4, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CEAC
	strb r0, [r4, #0x13]
_0800CEAC:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CEB4: .4byte gSaXData
_0800CEB8: .4byte 0x082A99C8

	thumb_func_start SA_XTransformingIntoMonsterGFX
SA_XTransformingIntoMonsterGFX: @ 0x0800CEBC
	push {lr}
	ldr r2, _0800CEF8 @ =gSaXData
	ldr r3, _0800CEFC @ =0x082A9BA8
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CEF2
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CEF2
	subs r0, r1, #1
	strb r0, [r2, #0x13]
_0800CEF2:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CEF8: .4byte gSaXData
_0800CEFC: .4byte 0x082A9BA8

	thumb_func_start SA_XMorphingGFX
SA_XMorphingGFX: @ 0x0800CF00
	push {lr}
	ldr r2, _0800CF3C @ =gSaXData
	ldr r3, _0800CF40 @ =0x0829B188
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CF48
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CF48
	ldr r0, _0800CF44 @ =0x0000025F
	bl PlaySound
	movs r0, #0xf
	b _0800CF4A
	.align 2, 0
_0800CF3C: .4byte gSaXData
_0800CF40: .4byte 0x0829B188
_0800CF44: .4byte 0x0000025F
_0800CF48:
	movs r0, #0xff
_0800CF4A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SA_XUnmorphingGFX
SA_XUnmorphingGFX: @ 0x0800CF50
	push {lr}
	ldr r2, _0800CF88 @ =gSaXData
	ldr r3, _0800CF8C @ =0x0829B1AC
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CF90
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CF90
	movs r0, #2
	b _0800CF92
	.align 2, 0
_0800CF88: .4byte gSaXData
_0800CF8C: .4byte 0x0829B1AC
_0800CF90:
	movs r0, #0xff
_0800CF92:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SA_XMorphBallGFX
SA_XMorphBallGFX: @ 0x0800CF98
	push {lr}
	ldr r2, _0800CFD4 @ =gSaXData
	ldr r3, _0800CFD8 @ =0x0829B1D0
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CFCC
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CFCC
	strb r0, [r2, #0x13]
_0800CFCC:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CFD4: .4byte gSaXData
_0800CFD8: .4byte 0x0829B1D0

	thumb_func_start SA_XSwagWalkGFX
SA_XSwagWalkGFX: @ 0x0800CFDC
	push {lr}
	ldr r2, _0800D018 @ =gSaXData
	ldr r3, _0800D01C @ =0x0829AD68
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800D010
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800D010
	strb r0, [r2, #0x13]
_0800D010:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800D018: .4byte gSaXData
_0800D01C: .4byte 0x0829AD68

	thumb_func_start SA_XTurningTowardsCameraGFX
SA_XTurningTowardsCameraGFX: @ 0x0800D020
	push {lr}
	ldr r2, _0800D064 @ =gSaXData
	ldr r3, _0800D068 @ =0x0829B0F8
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800D074
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800D074
	ldr r1, _0800D06C @ =gPauseScreenFlag
	movs r0, #6
	strb r0, [r1]
	ldr r1, _0800D070 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	movs r0, #0x13
	b _0800D076
	.align 2, 0
_0800D064: .4byte gSaXData
_0800D068: .4byte 0x0829B0F8
_0800D06C: .4byte gPauseScreenFlag
_0800D070: .4byte gSubGameMode1
_0800D074:
	movs r0, #0xff
_0800D076:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SA_XTurningAwayFromCameraGFX
SA_XTurningAwayFromCameraGFX: @ 0x0800D07C
	push {lr}
	ldr r2, _0800D0B4 @ =gSaXData
	ldr r3, _0800D0B8 @ =0x0829B2F0
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800D0BC
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800D0BC
	movs r0, #2
	b _0800D0BE
	.align 2, 0
_0800D0B4: .4byte gSaXData
_0800D0B8: .4byte 0x0829B2F0
_0800D0BC:
	movs r0, #0xff
_0800D0BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetSA_XPose
SetSA_XPose: @ 0x0800D0C4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _0800D0FC @ =gSaXData
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0800D0DE
	ldrh r0, [r2, #8]
	movs r1, #0x30
	eors r0, r1
	movs r1, #0
	strh r0, [r2, #8]
	strb r1, [r2, #2]
_0800D0DE:
	movs r1, #0
	movs r0, #0
	strh r0, [r2, #0xe]
	strh r0, [r2, #0x10]
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x13]
	subs r0, r4, #2
	cmp r0, #0xa
	bhi _0800D15A
	lsls r0, r0, #2
	ldr r1, _0800D100 @ =_0800D104
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D0FC: .4byte gSaXData
_0800D100: .4byte _0800D104
_0800D104: @ jump table
	.4byte _0800D160 @ case 0
	.4byte _0800D160 @ case 1
	.4byte _0800D130 @ case 2
	.4byte _0800D13C @ case 3
	.4byte _0800D148 @ case 4
	.4byte _0800D15A @ case 5
	.4byte _0800D15A @ case 6
	.4byte _0800D15A @ case 7
	.4byte _0800D15A @ case 8
	.4byte _0800D15A @ case 9
	.4byte _0800D154 @ case 10
_0800D130:
	ldr r1, _0800D138 @ =gSaXData
	movs r0, #1
	strb r0, [r1, #2]
	b _0800D160
	.align 2, 0
_0800D138: .4byte gSaXData
_0800D13C:
	ldr r0, _0800D144 @ =0x0000025B
	bl PlaySound
	b _0800D15A
	.align 2, 0
_0800D144: .4byte 0x0000025B
_0800D148:
	ldr r0, _0800D150 @ =0x0000025A
	bl PlaySound
	b _0800D15A
	.align 2, 0
_0800D150: .4byte 0x0000025A
_0800D154:
	movs r0, #0x9e
	bl unk_3b1c
_0800D15A:
	ldr r1, _0800D16C @ =gSaXData
	movs r0, #0
	strb r0, [r1, #3]
_0800D160:
	ldr r0, _0800D16C @ =gSaXData
	strb r4, [r0, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D16C: .4byte gSaXData

	thumb_func_start SA_XUpdatePosition
SA_XUpdatePosition: @ 0x0800D170
	push {lr}
	ldr r0, _0800D190 @ =gSaXData
	ldrb r1, [r0, #1]
	adds r2, r0, #0
	cmp r1, #5
	bne _0800D1AA
	ldrh r0, [r2, #0x10]
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0800D198
	ldr r1, _0800D194 @ =0x0000FFF0
	b _0800D19E
	.align 2, 0
_0800D190: .4byte gSaXData
_0800D194: .4byte 0x0000FFF0
_0800D198:
	asrs r0, r3, #0x13
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0800D19E:
	ldrh r0, [r2, #0x10]
	subs r0, #6
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0xc]
	subs r0, r0, r1
	strh r0, [r2, #0xc]
_0800D1AA:
	ldrh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r2, #0xa]
	adds r0, r0, r1
	strh r0, [r2, #0xa]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XUpdateGFXAndDraw
SA_XUpdateGFXAndDraw: @ 0x0800D1C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0800D1FC @ =gSaXData
	ldrb r1, [r0, #0x12]
	adds r1, #1
	strb r1, [r0, #0x12]
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	bhi _0800D1DE
	b _0800D3BA
_0800D1DE:
	ldrh r1, [r3, #8]
	movs r0, #0x10
	ands r0, r1
	movs r1, #1
	cmp r0, #0
	beq _0800D1EC
	movs r1, #0
_0800D1EC:
	ldrb r0, [r3, #1]
	cmp r0, #3
	beq _0800D224
	cmp r0, #3
	bgt _0800D200
	cmp r0, #2
	beq _0800D206
	b _0800D250
	.align 2, 0
_0800D1FC: .4byte gSaXData
_0800D200:
	cmp r0, #4
	beq _0800D244
	b _0800D250
_0800D206:
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0800D218
	ldr r2, _0800D214 @ =0x082B40F4
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D214: .4byte 0x082B40F4
_0800D218:
	ldr r2, _0800D220 @ =0x082B40DC
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D220: .4byte 0x082B40DC
_0800D224:
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0800D238
	ldr r2, _0800D234 @ =0x082B4124
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D234: .4byte 0x082B4124
_0800D238:
	ldr r2, _0800D240 @ =0x082B410C
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D240: .4byte 0x082B410C
_0800D244:
	ldr r2, _0800D24C @ =0x082B413C
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D24C: .4byte 0x082B413C
_0800D250:
	ldr r2, _0800D29C @ =0x082B403C
	lsls r1, r1, #2
	ldrb r0, [r3, #1]
_0800D256:
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r3, _0800D2A0 @ =gSaXData
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2, #4]
	str r0, [r3, #0x20]
	ldr r1, [r2]
	ldrb r0, [r1]
	lsls r0, r0, #5
	strh r0, [r3, #0x1c]
	adds r1, #1
	ldrb r0, [r1]
	lsls r0, r0, #5
	strh r0, [r3, #0x1e]
	adds r1, #1
	str r1, [r3, #0x14]
	ldrh r0, [r3, #0x1c]
	adds r1, r1, r0
	str r1, [r3, #0x18]
	ldrb r0, [r3, #1]
	cmp r0, #5
	bne _0800D2A8
	ldrb r0, [r3, #0x13]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _0800D2A4 @ =0x082B4368
	adds r0, r1, r0
	b _0800D2CE
	.align 2, 0
_0800D29C: .4byte 0x082B403C
_0800D2A0: .4byte gSaXData
_0800D2A4: .4byte 0x082B4368
_0800D2A8:
	cmp r0, #0xc
	bne _0800D2CC
	ldrb r0, [r3, #0x13]
	cmp r0, #0x1a
	beq _0800D2C4
	cmp r0, #0x1a
	bgt _0800D2BC
	cmp r0, #0x18
	beq _0800D2C4
	b _0800D2CC
_0800D2BC:
	cmp r0, #0x21
	bgt _0800D2CC
	cmp r0, #0x1c
	blt _0800D2CC
_0800D2C4:
	ldr r0, _0800D2C8 @ =0x082B43E8
	b _0800D2CE
	.align 2, 0
_0800D2C8: .4byte 0x082B43E8
_0800D2CC:
	ldr r0, _0800D3CC @ =0x082E7D60
_0800D2CE:
	movs r1, #0
	movs r2, #0x10
	movs r3, #1
	bl SetSuitPalette
	movs r0, #2
	mov r8, r0
	ldr r0, _0800D3D0 @ =gSamusOnTopOfBackgrounds
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D2E8
	movs r1, #1
	mov r8, r1
_0800D2E8:
	ldr r7, _0800D3D4 @ =gSaXData
	mov ip, r7
	mov r1, ip
	ldrb r0, [r1, #1]
	cmp r0, #0xc
	bne _0800D302
	ldr r0, _0800D3D8 @ =gIoRegisters
	ldrh r0, [r0, #0xa]
	movs r7, #3
	mov r8, r7
	mov r1, r8
	ands r1, r0
	mov r8, r1
_0800D302:
	ldr r5, _0800D3DC @ =gOamData
	ldr r3, _0800D3E0 @ =gNextOamSlot
	ldrb r2, [r3]
	lsls r0, r2, #3
	adds r5, r0, r5
	str r2, [sp]
	adds r6, r2, #0
	mov r7, ip
	ldrh r1, [r7, #0xa]
	lsrs r1, r1, #2
	ldr r0, _0800D3E4 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	mov sl, r1
	ldrh r1, [r7, #0xc]
	lsrs r1, r1, #2
	ldr r0, _0800D3E8 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	adds r1, #2
	mov sb, r1
	ldr r4, [r7, #0x20]
	ldrh r0, [r4]
	adds r1, r6, #0
	adds r1, r1, r0
	str r1, [sp]
	adds r4, #2
	cmp r2, r1
	bge _0800D3B2
	mov r7, r8
	lsls r7, r7, #2
	mov r8, r7
_0800D346:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	lsls r3, r6, #3
	ldr r1, _0800D3DC @ =gOamData
	adds r3, r3, r1
	add r0, sb
	strb r0, [r3]
	mov r7, ip
	ldrb r1, [r7, #6]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r3, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	ldrh r1, [r4]
	adds r4, #2
	strh r1, [r5]
	adds r5, #2
	add r1, sl
	ldr r0, _0800D3EC @ =0x000001FF
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _0800D3F0 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r2, [r3, #5]
	lsrs r1, r2, #4
	ldrb r0, [r7, #5]
	adds r1, r1, r0
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	mov r7, r8
	orrs r0, r7
	strb r0, [r3, #5]
	adds r5, #4
	adds r6, #1
	ldr r0, [sp]
	cmp r6, r0
	blt _0800D346
_0800D3B2:
	mov r1, sp
	ldrb r7, [r1]
	ldr r1, _0800D3E0 @ =gNextOamSlot
	strb r7, [r1]
_0800D3BA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D3CC: .4byte 0x082E7D60
_0800D3D0: .4byte gSamusOnTopOfBackgrounds
_0800D3D4: .4byte gSaXData
_0800D3D8: .4byte gIoRegisters
_0800D3DC: .4byte gOamData
_0800D3E0: .4byte gNextOamSlot
_0800D3E4: .4byte gBg1XPosition
_0800D3E8: .4byte gBg1YPosition
_0800D3EC: .4byte 0x000001FF
_0800D3F0: .4byte 0xFFFFFE00

	thumb_func_start SA_XUpdateElevatorSprite
SA_XUpdateElevatorSprite: @ 0x0800D3F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0800D444 @ =gSaXElevatorSprites
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r3, [r2]
	adds r6, r1, #0
	cmp r3, #0
	beq _0800D41E
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0800D41E
	subs r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D41E
	adds r0, r3, #1
	strb r0, [r2]
_0800D41E:
	lsls r0, r4, #2
	adds r1, r0, r4
	lsls r1, r1, #2
	adds r2, r1, r6
	ldrb r1, [r2]
	adds r5, r0, #0
	cmp r1, #1
	bhi _0800D430
	b _0800D554
_0800D430:
	ldrb r0, [r2, #1]
	cmp r0, #9
	bls _0800D438
	b _0800D534
_0800D438:
	lsls r0, r0, #2
	ldr r1, _0800D448 @ =_0800D44C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D444: .4byte gSaXElevatorSprites
_0800D448: .4byte _0800D44C
_0800D44C: @ jump table
	.4byte _0800D474 @ case 0
	.4byte _0800D474 @ case 1
	.4byte _0800D488 @ case 2
	.4byte _0800D4C4 @ case 3
	.4byte _0800D4C4 @ case 4
	.4byte _0800D4C4 @ case 5
	.4byte _0800D4C4 @ case 6
	.4byte _0800D522 @ case 7
	.4byte _0800D522 @ case 8
	.4byte _0800D4EC @ case 9
_0800D474:
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r2, r0, r6
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	ldr r3, _0800D484 @ =0x083EDF14
	b _0800D496
	.align 2, 0
_0800D484: .4byte 0x083EDF14
_0800D488:
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r2, r0, r6
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	ldr r3, _0800D4C0 @ =0x083EDD9C
_0800D496:
	ldrb r1, [r2, #0xd]
	lsls r1, r1, #3
	adds r1, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0800D534
	movs r0, #0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	adds r0, #1
	strb r0, [r2, #0xd]
	ldrb r0, [r2, #0xd]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0800D534
	strb r0, [r2]
	b _0800D534
	.align 2, 0
_0800D4C0: .4byte 0x083EDD9C
_0800D4C4:
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r3, r0, r6
	ldrh r2, [r3, #0xa]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x13
	ldrh r1, [r3, #6]
	subs r1, r1, r0
	strh r1, [r3, #6]
	subs r2, #6
	strh r2, [r3, #0xa]
	lsls r1, r1, #0x10
	ldr r0, _0800D4E8 @ =0x01C10000
	cmp r1, r0
	bls _0800D522
	movs r0, #0
	strb r0, [r3]
	b _0800D522
	.align 2, 0
_0800D4E8: .4byte 0x01C10000
_0800D4EC:
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r2, r0, r6
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	ldr r3, _0800D55C @ =0x082E8038
	ldrb r1, [r2, #0xd]
	lsls r1, r1, #3
	adds r1, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0800D522
	movs r0, #0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	adds r0, #1
	strb r0, [r2, #0xd]
	ldrb r0, [r2, #0xd]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0800D522
	strb r0, [r2, #0xd]
_0800D522:
	adds r1, r5, r4
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	strh r0, [r1, #4]
_0800D534:
	ldr r1, _0800D560 @ =0x082B4E84
	adds r2, r5, r4
	lsls r2, r2, #2
	adds r3, r2, r6
	ldrb r0, [r3, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r3, #0xd]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x10
	adds r2, r2, r0
	ldr r0, [r1]
	str r0, [r2]
_0800D554:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D55C: .4byte 0x082E8038
_0800D560: .4byte 0x082B4E84

	thumb_func_start SA_XDrawElevatorSprites
SA_XDrawElevatorSprites: @ 0x0800D564
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r6, _0800D624 @ =gOamData
	ldr r2, _0800D628 @ =gNextOamSlot
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r6, r0, r6
	adds r7, r1, #0
	adds r5, r7, #0
	movs r3, #0
	ldr r0, _0800D62C @ =gSaXElevatorSprites
	str r0, [sp, #4]
	str r0, [sp]
_0800D586:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r2, r0, #2
	ldr r0, [sp]
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r3, #1
	str r3, [sp, #8]
	cmp r0, #1
	bls _0800D608
	ldr r0, [sp, #4]
	adds r0, #0x10
	adds r0, r2, r0
	ldr r3, [r0]
	ldrh r0, [r3]
	adds r7, r7, r0
	adds r3, #2
	ldrh r0, [r1, #4]
	lsrs r0, r0, #2
	mov r8, r0
	ldrh r0, [r1, #6]
	lsrs r0, r0, #2
	mov ip, r0
	cmp r5, r7
	bge _0800D608
	ldr r1, _0800D630 @ =0x000001FF
	mov sl, r1
	movs r0, #0xd
	rsbs r0, r0, #0
	mov sb, r0
	lsls r0, r5, #3
	ldr r1, _0800D624 @ =gOamData
	adds r4, r0, r1
	subs r5, r7, r5
_0800D5CA:
	ldrh r0, [r3]
	adds r3, #2
	strh r0, [r6]
	adds r6, #2
	add r0, ip
	strb r0, [r4]
	ldrh r1, [r3]
	adds r3, #2
	strh r1, [r6]
	adds r6, #2
	add r1, r8
	mov r0, sl
	ands r1, r0
	ldrh r2, [r4, #2]
	ldr r0, _0800D634 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	ldrh r0, [r3]
	strh r0, [r6]
	adds r3, #2
	ldrb r1, [r4, #5]
	mov r0, sb
	ands r0, r1
	strb r0, [r4, #5]
	adds r6, #4
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0800D5CA
	adds r5, r7, #0
_0800D608:
	ldr r3, [sp, #8]
	cmp r3, #0xa
	ble _0800D586
	ldr r1, _0800D628 @ =gNextOamSlot
	strb r7, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D624: .4byte gOamData
_0800D628: .4byte gNextOamSlot
_0800D62C: .4byte gSaXElevatorSprites
_0800D630: .4byte 0x000001FF
_0800D634: .4byte 0xFFFFFE00

	thumb_func_start unk_d638
unk_d638: @ 0x0800D638
	push {r4, r5, lr}
	ldr r4, _0800D67C @ =gSaXElevatorData
	movs r5, #0
	movs r0, #1
	strb r0, [r4]
	ldr r0, _0800D680 @ =gNextOamSlot
	strb r5, [r0]
	ldr r1, _0800D684 @ =0x082B4EAC
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D674
	strb r5, [r4, #2]
	strb r5, [r4, #3]
	strb r5, [r4, #4]
	strb r5, [r4, #5]
	movs r1, #0
	strh r5, [r4, #6]
	ldr r0, _0800D688 @ =gDisableDrawingSamusAndScrollingFlag
	strb r1, [r0]
	ldr r0, _0800D68C @ =gSaXData
	strb r1, [r0]
	ldr r1, _0800D690 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
_0800D674:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D67C: .4byte gSaXElevatorData
_0800D680: .4byte gNextOamSlot
_0800D684: .4byte 0x082B4EAC
_0800D688: .4byte gDisableDrawingSamusAndScrollingFlag
_0800D68C: .4byte gSaXData
_0800D690: .4byte gSubGameMode1

	thumb_func_start SA_XUpdate
SA_XUpdate: @ 0x0800D694
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r1, _0800D6D8 @ =0x082B4EB0
	ldr r4, _0800D6DC @ =gSaXElevatorData
	ldrb r0, [r4, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D6B6
	ldrb r0, [r4, #2]
	adds r0, #1
	strb r0, [r4, #2]
	strh r6, [r4, #6]
_0800D6B6:
	movs r4, #0
_0800D6B8:
	adds r0, r4, #0
	bl SA_XUpdateElevatorSprite
	adds r4, #1
	cmp r4, #9
	ble _0800D6B8
	ldr r0, _0800D6DC @ =gSaXElevatorData
	ldrb r4, [r0, #4]
	adds r5, r0, #0
	cmp r4, #2
	beq _0800D700
	cmp r4, #2
	bgt _0800D6E0
	cmp r4, #1
	beq _0800D6E6
	b _0800D79A
	.align 2, 0
_0800D6D8: .4byte 0x082B4EB0
_0800D6DC: .4byte gSaXElevatorData
_0800D6E0:
	cmp r4, #3
	beq _0800D734
	b _0800D79A
_0800D6E6:
	ldr r0, _0800D6F8 @ =gWrittenToBldy
	ldrh r1, [r0]
	cmp r1, #0xf
	bhi _0800D79A
	adds r1, #1
	strh r1, [r0]
	ldr r0, _0800D6FC @ =0x04000054
	strh r1, [r0]
	b _0800D79A
	.align 2, 0
_0800D6F8: .4byte gWrittenToBldy
_0800D6FC: .4byte 0x04000054
_0800D700:
	ldr r0, _0800D728 @ =gWrittenToBldy
	ldrh r1, [r0]
	cmp r1, #0
	beq _0800D710
	subs r1, #1
	strh r1, [r0]
	ldr r0, _0800D72C @ =0x04000054
	strh r1, [r0]
_0800D710:
	ldrb r0, [r5, #5]
	adds r0, #1
	strb r0, [r5, #5]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0800D79A
	ldr r1, _0800D730 @ =gBackgroundPositions
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
	b _0800D79A
	.align 2, 0
_0800D728: .4byte gWrittenToBldy
_0800D72C: .4byte 0x04000054
_0800D730: .4byte gBackgroundPositions
_0800D734:
	ldrb r0, [r5, #5]
	adds r2, r0, #1
	strb r2, [r5, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	movs r1, #0x10
	subs r3, r1, r0
	ldr r1, _0800D778 @ =0x04000052
	movs r0, #0x10
	subs r0, r0, r3
	lsls r0, r0, #8
	orrs r0, r3
	strh r0, [r1]
	ands r2, r4
	cmp r2, #0
	bne _0800D75C
	ldr r1, _0800D77C @ =gBackgroundPositions
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
_0800D75C:
	cmp r3, #0
	bne _0800D788
	strb r3, [r5, #4]
	strb r3, [r5, #5]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0800D780 @ =0x0000F6FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0800D784 @ =0x04000050
	strh r3, [r0]
	b _0800D79A
	.align 2, 0
_0800D778: .4byte 0x04000052
_0800D77C: .4byte gBackgroundPositions
_0800D780: .4byte 0x0000F6FF
_0800D784: .4byte 0x04000050
_0800D788:
	cmp r3, #1
	bne _0800D79A
	ldr r0, _0800D7E0 @ =gSaXElevatorSprites
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	strb r2, [r1]
	adds r0, #0x64
	strb r2, [r0]
_0800D79A:
	ldrb r0, [r5, #2]
	cmp r0, #5
	bls _0800D7A2
	adds r6, #1
_0800D7A2:
	ldr r1, _0800D7E4 @ =0x082B4408
	ldr r0, _0800D7E8 @ =gSaXData
	ldrb r0, [r0, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0800D7BE
	bl SetSA_XPose
_0800D7BE:
	bl SA_XUpdatePosition
	ldr r0, _0800D7EC @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _0800D7D4
	bl SA_XDrawElevatorSprites
	bl SA_XUpdateGFXAndDraw
_0800D7D4:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D7E0: .4byte gSaXElevatorSprites
_0800D7E4: .4byte 0x082B4408
_0800D7E8: .4byte gSaXData
_0800D7EC: .4byte gSubGameMode1

	thumb_func_start SA_XElevatorBeforeBlowingUpWall
SA_XElevatorBeforeBlowingUpWall: @ 0x0800D7F0
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r0, _0800D810 @ =gSaXElevatorData
	ldrh r1, [r0, #6]
	adds r2, r1, #1
	strh r2, [r0, #6]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r0
	cmp r1, #1
	beq _0800D84C
	cmp r1, #1
	bgt _0800D814
	cmp r1, #0
	beq _0800D81E
	b _0800D8AC
	.align 2, 0
_0800D810: .4byte gSaXElevatorData
_0800D814:
	cmp r1, #2
	beq _0800D864
	cmp r1, #3
	beq _0800D888
	b _0800D8AC
_0800D81E:
	ldr r1, _0800D838 @ =0x040000D4
	ldr r0, _0800D83C @ =0x082B4E64
	str r0, [r1]
	ldr r0, _0800D840 @ =0x05000320
	str r0, [r1, #4]
	ldr r0, _0800D844 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0800D848 @ =gDisableDrawingSamusAndScrollingFlag
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0800D8AC
	.align 2, 0
_0800D838: .4byte 0x040000D4
_0800D83C: .4byte 0x082B4E64
_0800D840: .4byte 0x05000320
_0800D844: .4byte 0x80000010
_0800D848: .4byte gDisableDrawingSamusAndScrollingFlag
_0800D84C:
	ldr r1, _0800D858 @ =0x040000D4
	ldr r0, _0800D85C @ =0x082B4458
	str r0, [r1]
	ldr r0, _0800D860 @ =0x06014A60
	b _0800D86C
	.align 2, 0
_0800D858: .4byte 0x040000D4
_0800D85C: .4byte 0x082B4458
_0800D860: .4byte 0x06014A60
_0800D864:
	ldr r1, _0800D878 @ =0x040000D4
	ldr r0, _0800D87C @ =0x082B45F8
	str r0, [r1]
	ldr r0, _0800D880 @ =0x06014E60
_0800D86C:
	str r0, [r1, #4]
	ldr r0, _0800D884 @ =0x800000D0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800D8AC
	.align 2, 0
_0800D878: .4byte 0x040000D4
_0800D87C: .4byte 0x082B45F8
_0800D880: .4byte 0x06014E60
_0800D884: .4byte 0x800000D0
_0800D888:
	ldr r4, _0800D8B4 @ =0x082B4EC8
	ldr r3, _0800D8B8 @ =gSaXElevatorSprites
	movs r2, #9
_0800D88E:
	adds r1, r3, #0
	adds r0, r4, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6}
	stm r1!, {r5, r6}
	adds r4, #0x14
	adds r3, #0x14
	subs r2, #1
	cmp r2, #0
	bge _0800D88E
	movs r0, #0
	mov r7, ip
	strh r0, [r7, #6]
	movs r3, #1
_0800D8AC:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800D8B4: .4byte 0x082B4EC8
_0800D8B8: .4byte gSaXElevatorSprites

	thumb_func_start SA_XElevatorBlowingUpWall
SA_XElevatorBlowingUpWall: @ 0x0800D8BC
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _0800D8E8 @ =gSaXElevatorData
	ldrh r0, [r4, #6]
	adds r1, r0, #1
	strh r1, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0800D8D2
	b _0800D9C4
_0800D8D2:
	cmp r0, #0x28
	bgt _0800D8F6
	cmp r0, #3
	beq _0800D978
	cmp r0, #3
	bgt _0800D8EC
	cmp r0, #1
	beq _0800D918
	cmp r0, #2
	beq _0800D954
	b _0800DAE0
	.align 2, 0
_0800D8E8: .4byte gSaXElevatorData
_0800D8EC:
	cmp r0, #9
	beq _0800D998
	cmp r0, #0x19
	beq _0800D9B0
	b _0800DAE0
_0800D8F6:
	cmp r0, #0x78
	bne _0800D8FC
	b _0800DA60
_0800D8FC:
	cmp r0, #0x78
	bgt _0800D90A
	cmp r0, #0x34
	beq _0800D9CC
	cmp r0, #0x64
	beq _0800D9E8
	b _0800DAE0
_0800D90A:
	cmp r0, #0x8c
	bne _0800D910
	b _0800DA88
_0800D910:
	cmp r0, #0xa0
	bne _0800D916
	b _0800DAA8
_0800D916:
	b _0800DAE0
_0800D918:
	ldr r1, _0800D938 @ =gSaXElevatorBgCnt
	ldr r0, _0800D93C @ =0x04000008
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _0800D940 @ =0x0400000A
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r0, _0800D944 @ =0x0400000E
	ldrh r0, [r0]
	strh r0, [r1, #6]
	ldr r1, _0800D948 @ =0x040000D4
	ldr r0, _0800D94C @ =0x082B4830
	str r0, [r1]
	ldr r0, _0800D950 @ =0x06015000
	b _0800D95C
	.align 2, 0
_0800D938: .4byte gSaXElevatorBgCnt
_0800D93C: .4byte 0x04000008
_0800D940: .4byte 0x0400000A
_0800D944: .4byte 0x0400000E
_0800D948: .4byte 0x040000D4
_0800D94C: .4byte 0x082B4830
_0800D950: .4byte 0x06015000
_0800D954:
	ldr r1, _0800D968 @ =0x040000D4
	ldr r0, _0800D96C @ =0x082B4AF0
	str r0, [r1]
	ldr r0, _0800D970 @ =0x06015400
_0800D95C:
	str r0, [r1, #4]
	ldr r0, _0800D974 @ =0x80000160
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800DAE0
	.align 2, 0
_0800D968: .4byte 0x040000D4
_0800D96C: .4byte 0x082B4AF0
_0800D970: .4byte 0x06015400
_0800D974: .4byte 0x80000160
_0800D978:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0800D990 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r2]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _0800D994 @ =0x00007FFF
	adds r0, r2, #0
	strh r0, [r1]
	b _0800DAE0
	.align 2, 0
_0800D990: .4byte 0x0000F0FF
_0800D994: .4byte 0x00007FFF
_0800D998:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0xe0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r6, [r0]
	b _0800DAE0
_0800D9B0:
	movs r0, #0x3c
	movs r1, #1
	bl ScreenShakeStartHorizontal
	ldr r0, _0800D9C0 @ =0x00000226
	bl unk_3b1c
	b _0800DAE0
	.align 2, 0
_0800D9C0: .4byte 0x00000226
_0800D9C4:
	movs r0, #0
	bl UpdateBg1AndSubEventDuringSA_XElevatorCutscene
	b _0800DAE0
_0800D9CC:
	ldr r0, _0800D9DC @ =gWrittenToBldy
	strh r6, [r0]
	ldr r0, _0800D9E0 @ =0x04000054
	strh r6, [r0]
	ldr r1, _0800D9E4 @ =0x04000050
	movs r0, #0xaf
	strh r0, [r1]
	b _0800DA98
	.align 2, 0
_0800D9DC: .4byte gWrittenToBldy
_0800D9E0: .4byte 0x04000054
_0800D9E4: .4byte 0x04000050
_0800D9E8:
	ldr r4, _0800DA40 @ =0x04000008
	ldr r3, _0800DA44 @ =gSaXElevatorBgCnt
	ldrh r1, [r3]
	ldr r2, _0800DA48 @ =0x0000FFFC
	adds r0, r2, #0
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r4]
	adds r4, #2
	ldrh r1, [r3, #2]
	adds r0, r2, #0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	strh r0, [r4]
	ldr r1, _0800DA4C @ =0x0400000E
	ldrh r0, [r3, #6]
	ands r2, r0
	strh r2, [r1]
	ldr r0, _0800DA50 @ =gDisableScrolling
	strb r5, [r0]
	ldr r1, _0800DA54 @ =gBackgroundPositions
	movs r0, #0x10
	strh r0, [r1, #0xc]
	movs r0, #0x20
	strh r0, [r1, #0xe]
	ldr r3, _0800DA58 @ =gSaXElevatorSprites
	ldr r2, _0800DA5C @ =0x082B4EC8
	adds r1, r3, #0
	adds r1, #0x50
	adds r0, r2, #0
	adds r0, #0xc8
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldm r0!, {r4, r5}
	stm r1!, {r4, r5}
	adds r3, #0x64
	adds r2, #0xdc
	ldm r2!, {r0, r1, r7}
	stm r3!, {r0, r1, r7}
	ldm r2!, {r4, r5}
	stm r3!, {r4, r5}
	b _0800DAE0
	.align 2, 0
_0800DA40: .4byte 0x04000008
_0800DA44: .4byte gSaXElevatorBgCnt
_0800DA48: .4byte 0x0000FFFC
_0800DA4C: .4byte 0x0400000E
_0800DA50: .4byte gDisableScrolling
_0800DA54: .4byte gBackgroundPositions
_0800DA58: .4byte gSaXElevatorSprites
_0800DA5C: .4byte 0x082B4EC8
_0800DA60:
	ldr r1, _0800DA7C @ =0x04000050
	movs r0, #0xa7
	strh r0, [r1]
	ldr r1, _0800DA80 @ =gSaXElevatorSprites
	adds r2, r1, #0
	adds r2, #0x58
	movs r3, #0
	ldr r0, _0800DA84 @ =0x0000FFF0
	strh r0, [r2]
	adds r1, #0x6c
	movs r0, #0x10
	strh r0, [r1]
	strb r3, [r4, #5]
	b _0800DA98
	.align 2, 0
_0800DA7C: .4byte 0x04000050
_0800DA80: .4byte gSaXElevatorSprites
_0800DA84: .4byte 0x0000FFF0
_0800DA88:
	ldr r1, _0800DAA0 @ =0x04000050
	ldr r7, _0800DAA4 @ =0x00003F48
	adds r0, r7, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	strb r6, [r4, #5]
_0800DA98:
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	b _0800DAE0
	.align 2, 0
_0800DAA0: .4byte 0x04000050
_0800DAA4: .4byte 0x00003F48
_0800DAA8:
	ldr r2, _0800DAE8 @ =gSaXData
	adds r1, r2, #0
	ldr r0, _0800DAEC @ =0x082B4018
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	movs r0, #2
	strb r0, [r2]
	movs r0, #1
	strb r0, [r2, #1]
	ldr r0, _0800DAF0 @ =gBg1XPosition
	ldrh r0, [r0]
	adds r0, #0xb4
	strh r0, [r2, #0xa]
	ldr r1, _0800DAF4 @ =gBg1YPosition
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r2, #0xc]
	movs r0, #0xc
	strh r0, [r2, #0xe]
	strh r6, [r4, #6]
	movs r6, #1
_0800DAE0:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DAE8: .4byte gSaXData
_0800DAEC: .4byte 0x082B4018
_0800DAF0: .4byte gBg1XPosition
_0800DAF4: .4byte gBg1YPosition

	thumb_func_start SA_XElevatorWalkingBeforeTurningToCamera
SA_XElevatorWalkingBeforeTurningToCamera: @ 0x0800DAF8
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _0800DB0C @ =gSaXData
	ldrb r0, [r1, #1]
	cmp r0, #1
	beq _0800DB10
	cmp r0, #2
	beq _0800DB2C
	b _0800DB46
	.align 2, 0
_0800DB0C: .4byte gSaXData
_0800DB10:
	ldrh r1, [r1, #0xa]
	ldr r0, _0800DB28 @ =gBg1XPosition
	ldrh r0, [r0]
	movs r2, #0xaf
	lsls r2, r2, #1
	adds r0, r0, r2
	cmp r1, r0
	blt _0800DB46
	movs r0, #2
	bl SetSA_XPose
	b _0800DB46
	.align 2, 0
_0800DB28: .4byte gBg1XPosition
_0800DB2C:
	ldr r4, _0800DB50 @ =gSaXElevatorData
	ldrh r0, [r4, #6]
	adds r1, r0, #1
	strh r1, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bls _0800DB46
	movs r0, #0x12
	bl SetSA_XPose
	strh r5, [r4, #6]
	movs r5, #1
_0800DB46:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DB50: .4byte gSaXElevatorData

	thumb_func_start SA_XElevatorBeforeJumping
SA_XElevatorBeforeJumping: @ 0x0800DB54
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _0800DB8C @ =gSaXData
	ldrb r0, [r5, #1]
	cmp r0, #2
	bne _0800DB82
	ldr r4, _0800DB90 @ =gSaXElevatorData
	ldrh r0, [r4, #6]
	adds r1, r0, #1
	strh r1, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3b
	bls _0800DB82
	movs r0, #5
	bl SetSA_XPose
	movs r0, #0x30
	strh r0, [r5, #0xe]
	movs r0, #0x80
	strh r0, [r5, #0x10]
	strh r6, [r4, #6]
	movs r6, #1
_0800DB82:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DB8C: .4byte gSaXData
_0800DB90: .4byte gSaXElevatorData

	thumb_func_start SA_XElevatorBeforeShootingDoor
SA_XElevatorBeforeShootingDoor: @ 0x0800DB94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r4, _0800DBC8 @ =gSaXData
	ldrb r0, [r4, #1]
	cmp r0, #5
	bne _0800DBD0
	ldrh r1, [r4, #0xc]
	ldr r5, _0800DBCC @ =gBg1YPosition
	ldrh r0, [r5]
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r0, r0, r2
	cmp r1, r0
	ble _0800DBD8
	movs r0, #6
	bl SetSA_XPose
	ldrh r0, [r5]
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r0, r3
	strh r0, [r4, #0xc]
	b _0800DBD8
	.align 2, 0
_0800DBC8: .4byte gSaXData
_0800DBCC: .4byte gBg1YPosition
_0800DBD0:
	ldr r1, _0800DBEC @ =gSaXElevatorData
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
_0800DBD8:
	ldr r0, _0800DBEC @ =gSaXElevatorData
	ldrh r1, [r0, #6]
	mov ip, r0
	cmp r1, #0x44
	beq _0800DC0C
	cmp r1, #0x44
	bgt _0800DBF0
	cmp r1, #0x1e
	beq _0800DBF6
	b _0800DC7C
	.align 2, 0
_0800DBEC: .4byte gSaXElevatorData
_0800DBF0:
	cmp r1, #0x50
	beq _0800DC54
	b _0800DC7C
_0800DBF6:
	ldr r0, _0800DC08 @ =gSaXData
	movs r1, #1
	strb r1, [r0, #4]
	movs r0, #0x8a
	lsls r0, r0, #2
	bl PlaySound
	b _0800DC7C
	.align 2, 0
_0800DC08: .4byte gSaXData
_0800DC0C:
	movs r0, #3
	bl SetSA_XPose
	ldr r2, _0800DC40 @ =gSaXElevatorSprites
	ldr r1, _0800DC44 @ =0x082B4EC8
	adds r0, r2, #0
	adds r1, #0xf0
	ldm r1!, {r4, r5, r7}
	stm r0!, {r4, r5, r7}
	ldm r1!, {r3, r4}
	stm r0!, {r3, r4}
	ldr r3, _0800DC48 @ =gSaXData
	ldr r0, _0800DC4C @ =gBg1XPosition
	ldrh r1, [r0]
	subs r1, #0x40
	ldrh r0, [r3, #0xa]
	subs r0, r0, r1
	strh r0, [r2, #4]
	ldr r0, _0800DC50 @ =gBg1YPosition
	ldrh r1, [r0]
	adds r1, #0x48
	ldrh r0, [r3, #0xc]
	subs r0, r0, r1
	strh r0, [r2, #6]
	b _0800DC7C
	.align 2, 0
_0800DC40: .4byte gSaXElevatorSprites
_0800DC44: .4byte 0x082B4EC8
_0800DC48: .4byte gSaXData
_0800DC4C: .4byte gBg1XPosition
_0800DC50: .4byte gBg1YPosition
_0800DC54:
	adds r6, #1
	mov r8, r6
	ldr r4, _0800DC8C @ =0x082B4FCC
	ldr r3, _0800DC90 @ =gSaXElevatorSprites
	movs r2, #6
_0800DC5E:
	adds r1, r3, #0
	adds r0, r4, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6}
	stm r1!, {r5, r6}
	adds r4, #0x14
	adds r3, #0x14
	subs r2, #1
	cmp r2, #0
	bge _0800DC5E
	movs r0, #0
	mov r7, ip
	strh r0, [r7, #6]
	mov r6, r8
_0800DC7C:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DC8C: .4byte 0x082B4FCC
_0800DC90: .4byte gSaXElevatorSprites

	thumb_func_start SA_XElevatorWalkingOut
SA_XElevatorWalkingOut: @ 0x0800DC94
	push {r4, lr}
	movs r4, #0
	ldr r0, _0800DCB4 @ =gSaXElevatorData
	ldrh r1, [r0, #6]
	adds r2, r1, #1
	strh r2, [r0, #6]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x23
	beq _0800DCD8
	cmp r1, #0x23
	bgt _0800DCB8
	cmp r1, #5
	beq _0800DCC2
	b _0800DCF8
	.align 2, 0
_0800DCB4: .4byte gSaXElevatorData
_0800DCB8:
	cmp r1, #0x32
	beq _0800DCE0
	cmp r1, #0x64
	beq _0800DCEC
	b _0800DCF8
_0800DCC2:
	movs r0, #0x3c
	movs r1, #1
	bl ScreenShakeStartHorizontal
	ldr r0, _0800DCD4 @ =0x00000227
	bl unk_3b1c
	b _0800DCF8
	.align 2, 0
_0800DCD4: .4byte 0x00000227
_0800DCD8:
	movs r0, #1
	bl UpdateBg1AndSubEventDuringSA_XElevatorCutscene
	b _0800DCF8
_0800DCE0:
	ldr r0, _0800DCE8 @ =gSaXData
	strb r4, [r0, #4]
	b _0800DCF8
	.align 2, 0
_0800DCE8: .4byte gSaXData
_0800DCEC:
	movs r0, #1
	bl SetSA_XPose
	ldr r1, _0800DD1C @ =gSaXData
	movs r0, #0x14
	strh r0, [r1, #0xe]
_0800DCF8:
	ldr r1, _0800DD1C @ =gSaXData
	ldrb r0, [r1, #1]
	cmp r0, #1
	bne _0800DD12
	ldrh r1, [r1, #0xa]
	ldr r0, _0800DD20 @ =gBg1XPosition
	ldrh r0, [r0]
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r0, r0, r2
	cmp r1, r0
	ble _0800DD12
	adds r4, #1
_0800DD12:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800DD1C: .4byte gSaXData
_0800DD20: .4byte gBg1XPosition
