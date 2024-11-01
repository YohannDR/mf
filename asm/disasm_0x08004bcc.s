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
