    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start EraseSram_Unused
EraseSram_Unused: @ 0x08000C28
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _08000C54 @ =0x0000FFFF
	ldr r4, _08000C58 @ =0x02038100
	movs r5, #0xfe
	lsls r5, r5, #7
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	adds r3, r5, #0
	bl BitFill
	ldr r1, _08000C5C @ =0x0E000100
	adds r0, r4, #0
	adds r2, r5, #0
	bl SramWrite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000C54: .4byte 0x0000FFFF
_08000C58: .4byte 0x02038100
_08000C5C: .4byte 0x0E000100

	thumb_func_start EraseSram
EraseSram: @ 0x08000C60
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _08000C90 @ =0x0000FFFF
	ldr r4, _08000C94 @ =0x02038000
	movs r5, #0x80
	lsls r5, r5, #8
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	adds r3, r5, #0
	bl BitFill
	movs r1, #0xe0
	lsls r1, r1, #0x14
	adds r0, r4, #0
	adds r2, r5, #0
	bl SramWrite
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08000C90: .4byte 0x0000FFFF
_08000C94: .4byte 0x02038000

	thumb_func_start unk_c98
unk_c98: @ 0x08000C98
	push {r4, lr}
	ldr r4, _08000CC4 @ =0x02038000
	movs r1, #0xe0
	lsls r1, r1, #0x14
	adds r0, r4, #0
	movs r2, #0x80
	bl SramWriteChecked
	ldr r2, _08000CC8 @ =0x040000D4
	str r4, [r2]
	ldr r0, _08000CCC @ =0x0203F100
	str r0, [r2, #4]
	ldr r1, _08000CD0 @ =0x80000040
	str r1, [r2, #8]
	ldr r1, [r2, #8]
	ldr r1, _08000CD4 @ =0x0E007100
	movs r2, #0x80
	bl SramWriteChecked
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08000CC4: .4byte 0x02038000
_08000CC8: .4byte 0x040000D4
_08000CCC: .4byte 0x0203F100
_08000CD0: .4byte 0x80000040
_08000CD4: .4byte 0x0E007100

	thumb_func_start unk_cd8
unk_cd8: @ 0x08000CD8
	push {lr}
	ldr r0, _08000CE8 @ =0x02038080
	ldr r1, _08000CEC @ =0x0E000080
	movs r2, #0x80
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000CE8: .4byte 0x02038080
_08000CEC: .4byte 0x0E000080

	thumb_func_start unk_cf0
unk_cf0: @ 0x08000CF0
	push {lr}
	ldr r0, _08000D00 @ =0x0203F100
	ldr r1, _08000D04 @ =0x0E007100
	movs r2, #0x80
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000D00: .4byte 0x0203F100
_08000D04: .4byte 0x0E007100

	thumb_func_start WriteMostRecentFileToGamePak
WriteMostRecentFileToGamePak: @ 0x08000D08
	push {lr}
	ldr r2, _08000D28 @ =0x0858225C
	ldr r0, _08000D2C @ =0x03000B8D
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r2, _08000D30 @ =0x080A5258
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #5
	bl SramWrite
	pop {r0}
	bx r0
	.align 2, 0
_08000D28: .4byte 0x0858225C
_08000D2C: .4byte 0x03000B8D
_08000D30: .4byte 0x080A5258

	thumb_func_start unk_d34
unk_d34: @ 0x08000D34
	push {lr}
	ldr r2, _08000D54 @ =0x08582268
	ldr r0, _08000D58 @ =0x03000B8D
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r2, _08000D5C @ =0x080A5264
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #5
	bl SramWrite
	pop {r0}
	bx r0
	.align 2, 0
_08000D54: .4byte 0x08582268
_08000D58: .4byte 0x03000B8D
_08000D5C: .4byte 0x080A5264

	thumb_func_start ReadAllGamePakSRAM
ReadAllGamePakSRAM: @ 0x08000D60
	push {lr}
	ldr r0, _08000D74 @ =0x0E000200
	ldr r1, _08000D78 @ =0x02038200
	movs r2, #0xfc
	lsls r2, r2, #7
	bl SramWriteUnckecked
	pop {r0}
	bx r0
	.align 2, 0
_08000D74: .4byte 0x0E000200
_08000D78: .4byte 0x02038200

	thumb_func_start ReadMostRecentFileFromGamePak
ReadMostRecentFileFromGamePak: @ 0x08000D7C
	push {lr}
	ldr r2, _08000D9C @ =0x080A5258
	ldr r0, _08000DA0 @ =0x03000B8D
	ldrb r1, [r0]
	lsls r1, r1, #2
	adds r2, r1, r2
	ldr r0, [r2]
	ldr r2, _08000DA4 @ =0x0858225C
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x90
	lsls r2, r2, #5
	bl SramWriteUnckecked
	pop {r0}
	bx r0
	.align 2, 0
_08000D9C: .4byte 0x080A5258
_08000DA0: .4byte 0x03000B8D
_08000DA4: .4byte 0x0858225C

	thumb_func_start unk_da8
unk_da8: @ 0x08000DA8
	push {lr}
	movs r0, #0xe0
	lsls r0, r0, #0x14
	ldr r1, _08000DC8 @ =0x02038000
	movs r2, #0x80
	lsls r2, r2, #1
	bl SramWriteUnckecked
	ldr r0, _08000DCC @ =0x0E007100
	ldr r1, _08000DD0 @ =0x0203F100
	movs r2, #0x80
	bl SramWriteUnckecked
	pop {r0}
	bx r0
	.align 2, 0
_08000DC8: .4byte 0x02038000
_08000DCC: .4byte 0x0E007100
_08000DD0: .4byte 0x0203F100

	thumb_func_start unk_dd4
unk_dd4: @ 0x08000DD4
	push {lr}
	ldr r0, _08000DE4 @ =0x0203F000
	ldr r1, _08000DE8 @ =0x0E007000
	movs r2, #0x40
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000DE4: .4byte 0x0203F000
_08000DE8: .4byte 0x0E007000

	thumb_func_start unk_dec
unk_dec: @ 0x08000DEC
	push {lr}
	lsls r0, r0, #0x18
	ldr r1, _08000E0C @ =0x08582280
	lsrs r0, r0, #0x16
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r1, _08000E10 @ =0x080A5270
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r2, #0
	movs r2, #0x40
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000E0C: .4byte 0x08582280
_08000E10: .4byte 0x080A5270

	thumb_func_start unk_e14
unk_e14: @ 0x08000E14
	push {lr}
	ldr r0, _08000E24 @ =0x0203FFF0
	ldr r1, _08000E28 @ =0x0E007FF0
	movs r2, #0x10
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000E24: .4byte 0x0203FFF0
_08000E28: .4byte 0x0E007FF0

	thumb_func_start unk_e2c
unk_e2c: @ 0x08000E2C
	push {lr}
	ldr r0, _08000E40 @ =0x0203F800
	ldr r1, _08000E44 @ =0x0E007800
	movs r2, #0x80
	lsls r2, r2, #3
	bl SramWriteChecked
	pop {r0}
	bx r0
	.align 2, 0
_08000E40: .4byte 0x0203F800
_08000E44: .4byte 0x0E007800

	thumb_func_start unk_e48
unk_e48: @ 0x08000E48
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08000EB8 @ =gMusicInfo
	ldrb r1, [r0, #9]
	str r1, [sp]
	adds r2, r0, #0
	cmp r1, #0
	beq _08000E6E
	ldr r0, _08000EBC @ =0x04000006
	ldrb r0, [r0]
	cmp r0, #0x9f
	bhi _08000E6A
	adds r0, #0xe4
_08000E6A:
	adds r1, r0, r1
	str r1, [sp]
_08000E6E:
	ldrb r1, [r2, #0x10]
	ldrb r3, [r2, #0x11]
	lsls r0, r3, #4
	mov sl, r0
	ldrb r0, [r2, #0xc]
	lsls r0, r0, #1
	adds r0, r1, r0
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrb r0, [r2, #0xe]
	cmp r4, r0
	blo _08000E8E
	subs r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_08000E8E:
	movs r0, #0
	mov sb, r0
	cmp r1, r4
	bhi _08000EC0
	cmp r4, r3
	bhi _08000EC0
	ldrb r1, [r2, #0xc]
	subs r0, r4, r1
	adds r0, #1
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x10
	mov sl, r0
	adds r7, r1, #0
	adds r0, r4, #1
	ldrb r1, [r2, #0xe]
	cmp r0, r1
	bne _08000EB2
	mov r0, sb
_08000EB2:
	strb r0, [r2, #0x11]
	b _08000F38
	.align 2, 0
_08000EB8: .4byte gMusicInfo
_08000EBC: .4byte 0x04000006
_08000EC0:
	ldrb r0, [r2, #0x11]
	cmp r0, r1
	bhi _08000EE4
	cmp r1, r4
	bhi _08000EE4
	ldrb r1, [r2, #0xc]
	subs r0, r4, r1
	adds r0, #1
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x10
	mov sl, r0
	adds r7, r1, #0
	adds r0, r4, #1
	ldrb r1, [r2, #0xe]
	cmp r0, r1
	bne _08000EB2
	movs r0, #0
	b _08000EB2
_08000EE4:
	ldrb r0, [r2, #0x11]
	cmp r4, r0
	bhi _08000EF4
	cmp r0, r1
	bhi _08000EF4
	movs r0, #0
	mov sl, r0
	b _08000F30
_08000EF4:
	adds r3, r2, #0
	ldrb r1, [r3, #0x11]
	adds r0, r1, #0
	cmp r0, r4
	bhs _08000F14
	subs r0, r4, r1
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #1
	ldrb r1, [r3, #0xe]
	cmp r0, r1
	bne _08000F10
	movs r0, #0
_08000F10:
	strb r0, [r3, #0x11]
	b _08000F38
_08000F14:
	cmp r0, r4
	bls _08000F2C
	ldrb r0, [r3, #0xe]
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	mov r0, sb
	b _08000F10
_08000F2C:
	movs r1, #0
	mov sl, r1
_08000F30:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	strb r7, [r2, #0x11]
_08000F38:
	cmp r7, #0
	bne _08000F3E
	b _080011B4
_08000F3E:
	ldr r6, _08000F88 @ =0x030025F4
	mov r0, sl
	adds r1, r0, r6
	ldr r0, _08000F8C @ =0xFFFFF400
	adds r5, r6, r0
	ldr r0, _08000F90 @ =0x03003CB0
	mov r8, r0
	lsls r3, r7, #0x1b
	lsrs r3, r3, #0x18
	ldr r4, [r0]
	adds r0, r1, #0
	adds r2, r5, #0
	bl _call_via_r4
	adds r5, r0, #0
	mov r1, sb
	cmp r1, #0
	beq _08000F76
	adds r1, r6, #0
	mov r0, sb
	lsls r3, r0, #0x1b
	lsrs r3, r3, #0x18
	mov r0, r8
	ldr r4, [r0]
	adds r0, r1, #0
	adds r2, r5, #0
	bl _call_via_r4
_08000F76:
	ldr r0, _08000F94 @ =0xFFFFF3DC
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1, #0xa]
	movs r2, #0
	lsls r1, r7, #0x1a
	str r1, [sp, #4]
	b _0800115E
	.align 2, 0
_08000F88: .4byte 0x030025F4
_08000F8C: .4byte 0xFFFFF400
_08000F90: .4byte 0x03003CB0
_08000F94: .4byte 0xFFFFF3DC
_08000F98:
	movs r0, #0x34
	muls r0, r2, r0
	ldr r1, _08000FD8 @ =0x030031F4
	adds r4, r0, r1
	ldrb r0, [r4]
	adds r2, #1
	mov r8, r2
	cmp r0, #0
	bne _08000FAC
	b _08001158
_08000FAC:
	ldr r0, _08000FDC @ =0xFFFFE7DC
	adds r1, r1, r0
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	ldr r5, [r4, #0x28]
	ldrb r1, [r4, #0x13]
	cmp r1, #0
	beq _08001040
	movs r6, #0
_08000FC0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08000FF2
	ldrb r0, [r4, #1]
	cmp r0, #0x20
	bne _08000FE0
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0xc]
	lsls r0, r0, #0xe
	str r0, [r4, #0x18]
	b _08000FE2
	.align 2, 0
_08000FD8: .4byte 0x030031F4
_08000FDC: .4byte 0xFFFFE7DC
_08000FE0:
	str r6, [r4, #0x18]
_08000FE2:
	strb r6, [r4, #0x10]
	ldrb r0, [r4, #0x13]
	movs r1, #0xfd
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r4, #0x13]
	b _0800103A
_08000FF2:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08000FFE
	movs r0, #0xfb
	b _08001036
_08000FFE:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0800103A
	ldrb r1, [r5]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800101A
	ldrb r0, [r4, #3]
	strb r0, [r5, #6]
	adds r0, r5, #0
	bl unk_491c
_0800101A:
	ldrb r1, [r5, #8]
	ldrb r0, [r4, #0xf]
	adds r0, #1
	muls r0, r1, r0
	asrs r0, r0, #7
	strb r0, [r4, #4]
	ldrb r1, [r5, #9]
	ldrb r0, [r4, #0xf]
	adds r0, #1
	muls r0, r1, r0
	asrs r0, r0, #7
	strb r0, [r4, #5]
	ldrb r1, [r4, #0x13]
	movs r0, #0xef
_08001036:
	ands r0, r1
	strb r0, [r4, #0x13]
_0800103A:
	ldrb r1, [r4, #0x13]
	cmp r1, #0
	bne _08000FC0
_08001040:
	ldrb r5, [r4, #0x10]
	ldrb r0, [r4]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xa
	bne _08001052
	movs r0, #0
	strb r0, [r4]
	b _08001158
_08001052:
	cmp r1, #1
	bne _0800105E
	ldrb r0, [r4, #8]
	cmp r0, #0xff
	bne _08001090
	b _080010A4
_0800105E:
	subs r0, r1, #2
	cmp r0, #6
	bhi _0800111E
	lsls r0, r0, #2
	ldr r1, _08001070 @ =_08001074
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08001070: .4byte _08001074
_08001074: @ jump table
	.4byte _08001096 @ case 0
	.4byte _080010B2 @ case 1
	.4byte _0800111E @ case 2
	.4byte _080010D4 @ case 3
	.4byte _080010D8 @ case 4
	.4byte _0800111E @ case 5
	.4byte _08001108 @ case 6
_08001090:
	movs r5, #0
	movs r0, #2
	strb r0, [r4]
_08001096:
	ldrb r0, [r4, #8]
	adds r0, r0, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xfe
	ble _0800111E
_080010A4:
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xa]
	cmp r0, #0
	beq _080010CC
	movs r5, #0xff
	movs r0, #3
	strb r0, [r4]
_080010B2:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r4, #9]
	muls r0, r1, r0
	asrs r0, r0, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r4, #0xa]
	cmp r0, r1
	bgt _0800111E
	cmp r1, #0
	beq _080010D4
_080010CC:
	adds r5, r1, #0
	movs r0, #4
	strb r0, [r4]
	b _0800111E
_080010D4:
	movs r0, #6
	strb r0, [r4]
_080010D8:
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	ldrb r1, [r4, #0xb]
	muls r0, r1, r0
	asrs r0, r0, #8
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r0, #0
	bgt _0800111E
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _08001100
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _08001100
	movs r0, #8
	strb r0, [r4]
	b _08001158
_08001100:
	adds r0, r4, #0
	bl unk_1e14
	b _08001158
_08001108:
	ldrb r0, [r4, #0xd]
	subs r0, #1
	strb r0, [r4, #0xd]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0800111E
	strb r0, [r4]
	adds r0, r4, #0
	bl unk_1e14
_0800111E:
	strb r5, [r4, #0x10]
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	ldr r2, _080011C4 @ =gMusicInfo
	ldrb r0, [r2, #6]
	adds r0, #1
	muls r1, r0, r1
	lsls r1, r1, #0xc
	asrs r1, r1, #0x10
	ldrb r0, [r4, #4]
	muls r0, r1, r0
	asrs r0, r0, #8
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #5]
	muls r0, r1, r0
	asrs r0, r0, #8
	strb r0, [r4, #0x12]
	adds r5, r2, #0
	adds r5, #0x24
	ldr r0, _080011C8 @ =0x03003654
	mov r1, sb
	adds r2, r7, r1
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x18
	ldr r3, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	bl _call_via_r3
_08001158:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
_0800115E:
	ldr r0, _080011C4 @ =gMusicInfo
	ldrb r0, [r0, #5]
	cmp r2, r0
	bhs _08001180
	ldr r0, [sp]
	cmp r0, #0
	bne _0800116E
	b _08000F98
_0800116E:
	ldr r0, _080011CC @ =0x04000006
	ldrb r0, [r0]
	cmp r0, #0x9f
	bhi _08001178
	adds r0, #0xe4
_08001178:
	ldr r1, [sp]
	cmp r0, r1
	bhs _08001180
	b _08000F98
_08001180:
	ldr r4, _080011D0 @ =0x030025F4
	mov r0, sl
	adds r1, r0, r4
	ldr r0, _080011D4 @ =0xFFFFF400
	adds r5, r4, r0
	ldr r6, _080011D8 @ =0x03003D58
	ldr r0, [sp, #4]
	lsrs r2, r0, #0x18
	ldr r3, [r6]
	adds r0, r1, #0
	adds r1, r5, #0
	bl _call_via_r3
	adds r5, r0, #0
	mov r1, sb
	cmp r1, #0
	beq _080011B4
	adds r1, r4, #0
	mov r0, sb
	lsls r2, r0, #0x1a
	lsrs r2, r2, #0x18
	ldr r3, [r6]
	adds r0, r1, #0
	adds r1, r5, #0
	bl _call_via_r3
_080011B4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080011C4: .4byte gMusicInfo
_080011C8: .4byte 0x03003654
_080011CC: .4byte 0x04000006
_080011D0: .4byte 0x030025F4
_080011D4: .4byte 0xFFFFF400
_080011D8: .4byte 0x03003D58

	thumb_func_start UpdatePSGSounds
UpdatePSGSounds: @ 0x080011DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r6, #0
	mov r8, r6
_080011EA:
	mov r1, r8
	lsls r0, r1, #2
	add r0, r8
	lsls r0, r0, #3
	ldr r1, _08001208 @ =0x03003464
	adds r4, r0, r1
	ldrb r0, [r4]
	movs r2, #1
	add r2, r8
	mov sl, r2
	cmp r0, #0
	bne _08001204
	b _080015B8
_08001204:
	b _0800134E
	.align 2, 0
_08001208: .4byte 0x03003464
_0800120C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08001268
	ldr r1, [r4, #0x24]
	ldrb r0, [r1, #0xf]
	strb r0, [r4, #0xa]
	ldrb r0, [r1, #4]
	strb r0, [r4, #0xb]
	ldrb r0, [r1, #0xc]
	strb r0, [r4, #0xd]
	ldrb r0, [r1, #0xd]
	strb r0, [r4, #0xe]
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	strb r0, [r4, #0x1d]
	adds r0, r1, #0
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r4, #0x1e]
	ldr r0, [r1, #0x38]
	str r0, [r4, #0x20]
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	strb r0, [r4, #4]
	adds r0, r1, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	strb r0, [r4, #5]
	adds r0, r1, #0
	adds r0, #0x3e
	ldrb r0, [r0]
	strb r0, [r4, #6]
	adds r0, r1, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	strb r0, [r4, #7]
	ldrb r0, [r1, #0x12]
	strb r0, [r4, #0x1f]
	movs r0, #0xfd
	ands r0, r2
	movs r1, #0x10
	orrs r0, r1
	b _0800134C
_08001268:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08001280
	ldrh r0, [r4, #8]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	bl unk_4b10
	ldrb r1, [r4, #0xf]
	movs r0, #0xfb
	b _0800134A
_08001280:
	movs r0, #0x10
	mov sb, r0
	ands r0, r2
	cmp r0, #0
	beq _0800132C
	ldr r2, [r4, #0x24]
	ldrb r1, [r4, #0xc]
	ldrb r0, [r2, #6]
	cmp r0, r1
	beq _0800129C
	strb r1, [r2, #6]
	ldr r0, [r4, #0x24]
	bl unk_491c
_0800129C:
	ldr r2, [r4, #0x24]
	ldrb r1, [r2, #8]
	ldrb r0, [r4, #0xa]
	adds r0, #1
	adds r3, r1, #0
	muls r3, r0, r3
	asrs r3, r3, #7
	strb r3, [r4, #2]
	ldrb r1, [r2, #9]
	ldrb r0, [r4, #0xa]
	adds r0, #1
	adds r2, r1, #0
	muls r2, r0, r2
	asrs r2, r2, #7
	strb r2, [r4, #3]
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	adds r0, r0, r1
	asrs r0, r0, #4
	strb r0, [r4, #0x1a]
	ldrb r1, [r4, #0x1a]
	ldrb r0, [r4, #6]
	muls r0, r1, r0
	adds r0, #0xf
	asrs r0, r0, #4
	strb r0, [r4, #0x1b]
	ldr r7, _080012FC @ =0x04000081
	movs r6, #0x11
	mov r1, r8
	lsls r6, r1
	ldrb r0, [r7]
	adds r1, r0, #0
	bics r1, r6
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r0, r2, #0x18
	lsrs r2, r0, #0x18
	cmp r5, r2
	blo _08001300
	lsrs r0, r3, #0x19
	cmp r0, r2
	bls _08001310
	movs r0, #1
	mov r2, r8
	lsls r0, r2
	orrs r1, r0
	b _08001312
	.align 2, 0
_080012FC: .4byte 0x04000081
_08001300:
	lsrs r0, r0, #0x19
	cmp r0, r5
	bls _08001310
	mov r0, sb
	mov r2, r8
	lsls r0, r2
	orrs r1, r0
	b _08001312
_08001310:
	orrs r1, r6
_08001312:
	strb r1, [r7]
	movs r0, #0
	strb r0, [r4, #0x12]
	ldrh r1, [r4, #0x14]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x14]
	movs r6, #1
	ldrb r1, [r4, #0xf]
	movs r0, #0xef
	b _0800134A
_0800132C:
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0800134E
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	bl unk_4b10
	ldrb r1, [r4, #0xf]
	movs r0, #0xdf
_0800134A:
	ands r0, r1
_0800134C:
	strb r0, [r4, #0xf]
_0800134E:
	ldrb r2, [r4, #0xf]
	cmp r2, #0
	beq _08001356
	b _0800120C
_08001356:
	ldrb r0, [r4]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #0xa
	bne _08001362
	b _0800153A
_08001362:
	cmp r1, #1
	bne _080013A8
	mov r0, r8
	cmp r0, #0
	bne _08001370
	ldrb r0, [r4, #0x1e]
	b _08001378
_08001370:
	mov r1, r8
	cmp r1, #2
	bne _0800137A
	movs r0, #0x80
_08001378:
	strb r0, [r4, #0x10]
_0800137A:
	mov r2, r8
	cmp r2, #1
	bhi _08001384
	ldr r0, [r4, #0x20]
	b _08001386
_08001384:
	movs r0, #0
_08001386:
	strb r0, [r4, #0x11]
	ldrh r1, [r4, #8]
	movs r3, #0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r1, r0
	orrs r1, r3
	strh r1, [r4, #0x14]
	ldrb r2, [r4, #0x1d]
	cmp r2, #0
	beq _080013A0
	b _08001558
_080013A0:
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _080013E8
	b _08001414
_080013A8:
	ldrb r0, [r4, #0x18]
	adds r2, r0, #0
	cmp r2, #0
	beq _080013B2
	b _08001588
_080013B2:
	subs r0, r1, #2
	cmp r0, #7
	bls _080013BA
	b _08001588
_080013BA:
	lsls r0, r0, #2
	ldr r1, _080013C4 @ =_080013C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080013C4: .4byte _080013C8
_080013C8: @ jump table
	.4byte _08001402 @ case 0
	.4byte _08001452 @ case 1
	.4byte _08001498 @ case 2
	.4byte _080014AC @ case 3
	.4byte _080014D2 @ case 4
	.4byte _08001588 @ case 5
	.4byte _08001544 @ case 6
	.4byte _08001574 @ case 7
_080013E8:
	strb r3, [r4, #0x19]
	mov r1, r8
	cmp r1, #2
	bne _080013F4
	strb r3, [r4, #0x12]
	b _080013F8
_080013F4:
	adds r0, #8
	strb r0, [r4, #0x12]
_080013F8:
	movs r0, #2
	strb r0, [r4]
	adds r0, r4, #0
	bl unk_4b10
_08001402:
	ldrb r0, [r4, #0x19]
	adds r0, #1
	movs r1, #0
	strb r0, [r4, #0x19]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x1a]
	cmp r0, r2
	blt _0800141E
_08001414:
	ldrb r0, [r4, #5]
	adds r1, r0, #0
	cmp r1, #0
	beq _08001474
	b _0800142E
_0800141E:
	mov r0, r8
	cmp r0, #2
	bne _08001428
	strb r1, [r4, #0x12]
	movs r6, #1
_08001428:
	ldrb r0, [r4, #4]
	strb r0, [r4, #0x18]
	b _08001588
_0800142E:
	ldrb r0, [r4, #0x1a]
	movs r2, #0
	strb r0, [r4, #0x19]
	mov r0, r8
	cmp r0, #2
	bne _0800143E
	strb r2, [r4, #0x12]
	b _0800144C
_0800143E:
	strb r1, [r4, #0x12]
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x14]
_0800144C:
	movs r0, #3
	strb r0, [r4]
	movs r6, #1
_08001452:
	ldrb r0, [r4, #0x19]
	subs r0, #1
	movs r1, #0
	strb r0, [r4, #0x19]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x1b]
	cmp r0, r2
	ble _08001474
	mov r0, r8
	cmp r0, #2
	bne _0800146E
	strb r1, [r4, #0x12]
	movs r6, #1
_0800146E:
	ldrb r0, [r4, #5]
	strb r0, [r4, #0x18]
	b _08001588
_08001474:
	ldrb r0, [r4, #0x1b]
	movs r1, #0
	strb r0, [r4, #0x19]
	mov r2, r8
	cmp r2, #2
	bne _08001484
	strb r1, [r4, #0x12]
	b _08001492
_08001484:
	strb r1, [r4, #0x12]
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x14]
_08001492:
	movs r0, #4
	strb r0, [r4]
	movs r6, #1
_08001498:
	ldrb r0, [r4, #0x1b]
	strb r0, [r4, #0x19]
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	bne _08001588
	movs r0, #1
	strb r0, [r4, #0x18]
	b _08001588
_080014AC:
	ldrb r1, [r4, #7]
	cmp r1, #0
	beq _080014F0
	ldrb r0, [r4, #0x1d]
	cmp r0, #0
	bne _080014F0
	mov r0, r8
	cmp r0, #2
	beq _080014CC
	strb r1, [r4, #0x12]
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x14]
_080014CC:
	movs r0, #6
	strb r0, [r4]
	movs r6, #1
_080014D2:
	ldrb r0, [r4, #0x19]
	subs r0, #1
	movs r1, #0
	strb r0, [r4, #0x19]
	lsls r0, r0, #0x18
	cmp r0, #0
	ble _080014F0
	mov r0, r8
	cmp r0, #2
	bne _080014EA
	strb r1, [r4, #0x12]
	movs r6, #1
_080014EA:
	ldrb r0, [r4, #7]
	strb r0, [r4, #0x18]
	b _08001588
_080014F0:
	movs r3, #0
	strb r3, [r4]
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _0800153A
	ldrb r2, [r4, #0xe]
	cmp r2, #0
	beq _0800153A
	ldrb r1, [r4, #0x1a]
	muls r0, r1, r0
	adds r0, #0xff
	asrs r0, r0, #8
	strb r0, [r4, #0x19]
	strb r2, [r4, #0x18]
	mov r1, r8
	cmp r1, #2
	bne _08001524
	ldr r0, _08001520 @ =0x080A53E5
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	ldrb r0, [r1]
	strb r0, [r4, #0x12]
	b _08001532
	.align 2, 0
_08001520: .4byte 0x080A53E5
_08001524:
	strb r3, [r4, #0x12]
	ldrh r1, [r4, #8]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x14]
_08001532:
	movs r0, #8
	strb r0, [r4]
	movs r6, #1
	b _0800158C
_0800153A:
	adds r0, r4, #0
	mov r1, r8
	bl ClearRegistersForPSG
	b _080015B8
_08001544:
	lsls r0, r2, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _080015B8
	adds r0, r4, #0
	mov r1, r8
	bl ClearRegistersForPSG
	strb r5, [r4]
	b _080015B8
_08001558:
	ldrb r0, [r4, #0x11]
	orrs r0, r2
	strb r0, [r4, #0x11]
	strb r3, [r4, #0x12]
	ldrb r0, [r4, #0x1b]
	strb r0, [r4, #0x19]
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r4, #0x14]
	movs r0, #9
	strb r0, [r4]
	movs r6, #1
_08001574:
	movs r0, #0xff
	strb r0, [r4, #0x18]
	cmp r6, #0
	beq _080015B2
	ldrh r1, [r4, #0x14]
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x14]
_08001588:
	cmp r6, #0
	beq _080015B2
_0800158C:
	movs r6, #0
	ldrb r1, [r4, #0x19]
	mov r0, r8
	cmp r0, #2
	bne _080015A4
	ldr r0, _080015A0 @ =0x080A53E5
	adds r0, r1, r0
	ldrb r0, [r0]
	b _080015AA
	.align 2, 0
_080015A0: .4byte 0x080A53E5
_080015A4:
	lsls r0, r1, #4
	ldrb r1, [r4, #0x12]
	orrs r0, r1
_080015AA:
	strb r0, [r4, #0x12]
	adds r0, r4, #0
	bl unk_4b10
_080015B2:
	ldrb r0, [r4, #0x18]
	subs r0, #1
	strb r0, [r4, #0x18]
_080015B8:
	mov r1, sl
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #3
	bhi _080015C6
	b _080011EA
_080015C6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_15d4
unk_15d4: @ 0x080015D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r2, _080015F0 @ =gMusicInfo
	ldrb r1, [r2, #0xb]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080015F4
	movs r0, #0xfe
	b _080015FE
	.align 2, 0
_080015F0: .4byte gMusicInfo
_080015F4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08001602
	movs r0, #0xfd
_080015FE:
	ands r0, r1
	strb r0, [r2, #0xb]
_08001602:
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	beq _0800160A
	b _08001950
_0800160A:
	movs r0, #1
	strb r0, [r5, #0x1c]
	ldrb r1, [r5, #0x1e]
	ands r0, r1
	movs r1, #0x28
	adds r1, r1, r5
	mov sl, r1
	cmp r0, #0
	beq _0800161E
	b _08001914
_0800161E:
	ldrb r1, [r5]
	movs r0, #0xf8
	ands r0, r1
	cmp r0, #0
	beq _0800163E
	movs r0, #0x98
	ands r0, r1
	cmp r0, #0
	beq _08001638
	adds r0, r5, #0
	bl unk_2a40
	b _0800163E
_08001638:
	adds r0, r5, #0
	bl unk_2ba4
_0800163E:
	ldrb r1, [r5]
	movs r0, #2
	ands r0, r1
	movs r2, #0x28
	adds r2, r2, r5
	mov sl, r2
	cmp r0, #0
	bne _08001650
	b _08001914
_08001650:
	adds r0, r5, #0
	bl unk_475c
	lsls r0, r0, #0x18
	b _0800190C
_0800165A:
	movs r6, #0
	ldr r4, [r5, #0x18]
	subs r0, #1
	mov sb, r0
	b _08001900
_08001664:
	ldrb r0, [r4]
	adds r1, r6, #1
	mov r8, r1
	adds r7, r4, #0
	adds r7, #0x50
	cmp r0, #0
	bne _08001674
	b _080018F8
_08001674:
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _08001680
	adds r0, r4, #0
	bl unk_1960
_08001680:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0800168C
	adds r0, r4, #0
	bl unk_1988
_0800168C:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08001760
	subs r0, #1
	strb r0, [r4, #2]
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _080016A2
	subs r0, #1
	strb r0, [r4, #0x15]
	b _08001750
_080016A2:
	ldrb r1, [r4, #0x10]
	cmp r1, #0
	beq _08001750
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	beq _08001750
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _080016F6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08001750
	ldrb r2, [r4, #0x16]
	adds r0, r1, r2
	strb r0, [r4, #0x16]
	subs r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _080016CE
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	b _080016D4
_080016CE:
	ldrb r1, [r4, #0x16]
	movs r0, #0x80
	subs r0, r0, r1
_080016D4:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _08001750
	ldrb r0, [r4, #0x11]
	adds r0, #1
	muls r0, r1, r0
	asrs r0, r0, #7
	strb r0, [r4, #0x13]
	adds r0, r4, #0
	bl unk_19ac
	b _08001750
_080016F6:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _08001750
	ldrb r0, [r0]
	cmp r0, #0
	beq _08001750
	ldrb r2, [r4, #0x16]
	adds r0, r1, r2
	strb r0, [r4, #0x16]
	subs r0, #0x40
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0800172A
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	b _08001730
_08001716:
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_1eb4
	b _08001898
_08001720:
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_1f04
	b _08001898
_0800172A:
	ldrb r1, [r4, #0x16]
	movs r0, #0x80
	subs r0, r0, r1
_08001730:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r1, r0
	beq _08001750
	ldrb r0, [r4, #0x11]
	adds r0, #1
	muls r0, r1, r0
	asrs r0, r0, #7
	strb r0, [r4, #0x13]
	adds r0, r4, #0
	bl unk_1a3c
_08001750:
	ldrb r0, [r4, #2]
	adds r1, r6, #1
	mov r8, r1
	adds r7, r4, #0
	adds r7, #0x50
	cmp r0, #0
	beq _08001760
	b _08001898
_08001760:
	adds r6, #1
	mov r8, r6
	adds r7, r4, #0
	adds r7, #0x50
_08001768:
	ldr r1, [r4, #0x24]
	ldrb r2, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _08001778
	ldrb r2, [r4, #3]
	b _08001782
_08001778:
	cmp r2, #0xbc
	bls _08001782
	strb r2, [r4, #3]
	adds r0, r1, #1
	str r0, [r4, #0x24]
_08001782:
	cmp r2, #0xce
	bls _08001834
	ldrb r1, [r4]
	movs r0, #2
	orrs r0, r1
	strb r0, [r4]
	ldr r1, _08001804 @ =0x080A5378
	adds r0, r2, #0
	subs r0, #0xcf
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #0xe]
	ldr r1, [r4, #0x24]
	ldrb r2, [r1]
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	beq _080017A6
	strb r0, [r4, #0x15]
_080017A6:
	lsls r0, r2, #0x18
	cmp r0, #0
	blt _080017C2
	strb r2, [r4, #1]
	adds r3, r1, #1
	str r3, [r4, #0x24]
	ldrb r2, [r1, #1]
	movs r0, #1
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080017C2
	strb r2, [r4, #0xf]
	adds r0, r3, #1
	str r0, [r4, #0x24]
_080017C2:
	ldrb r1, [r4]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x3f
	bls _080017D2
	adds r0, r4, #0
	bl unk_481c
_080017D2:
	movs r0, #0
	strb r0, [r4, #0x13]
	adds r0, r4, #0
	bl unk_48c0
	adds r0, r4, #0
	bl unk_491c
	ldrb r1, [r5]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08001812
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _08001808
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_1d50
	b _08001890
	.align 2, 0
_08001804: .4byte 0x080A5378
_08001808:
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_1cac
	b _08001890
_08001812:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0800182A
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_1d00
	b _08001890
_0800182A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_1b9c
	b _08001890
_08001834:
	cmp r2, #0xb0
	bls _08001878
	cmp r2, #0xbb
	bne _08001846
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_477c
	b _08001890
_08001846:
	cmp r2, #0xbd
	bne _08001854
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_2000
	b _08001890
_08001854:
	cmp r2, #0xb1
	bne _0800185A
	b _08001716
_0800185A:
	cmp r2, #0xb6
	bne _08001860
	b _08001720
_08001860:
	ldr r0, _08001874 @ =0x080A5698
	adds r1, r2, #0
	subs r1, #0xb1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl _call_via_r1
	b _08001890
	.align 2, 0
_08001874: .4byte 0x080A5698
_08001878:
	ldr r1, _0800188C @ =0x080A5378
	adds r0, r2, #0
	subs r0, #0x80
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r4, #2]
	ldr r0, [r4, #0x24]
	adds r0, #1
	str r0, [r4, #0x24]
	b _08001898
	.align 2, 0
_0800188C: .4byte 0x080A5378
_08001890:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08001898
	b _08001768
_08001898:
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080018C8
	adds r0, r4, #0
	bl unk_491c
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _080018B4
	adds r0, r4, #0
	bl unk_1acc
_080018B4:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _080018C0
	adds r0, r4, #0
	bl unk_1b4c
_080018C0:
	ldrb r1, [r4]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r4]
_080018C8:
	ldrb r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080018F8
	adds r0, r4, #0
	bl unk_48c0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _080018E4
	adds r0, r4, #0
	bl unk_1ae8
_080018E4:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _080018F0
	adds r0, r4, #0
	bl unk_1b58
_080018F0:
	ldrb r1, [r4]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r4]
_080018F8:
	mov r2, r8
	lsls r0, r2, #0x18
	lsrs r6, r0, #0x18
	adds r4, r7, #0
_08001900:
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _08001908
	b _08001664
_08001908:
	mov r1, sb
	lsls r0, r1, #0x18
_0800190C:
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08001914
	b _0800165A
_08001914:
	movs r7, #0
	strb r7, [r5, #0x1c]
	mov r6, sl
	ldrb r1, [r6]
	adds r4, r1, #0
	cmp r4, #1
	bne _08001938
	ldrh r0, [r5, #0x20]
	ldrb r1, [r5, #0x1f]
	bl PlayMusic
	strb r4, [r5, #0x1c]
	movs r0, #0
	strh r7, [r5, #0x20]
	strb r0, [r5, #0x1f]
	strb r0, [r6]
	strb r0, [r5, #0x1c]
	b _08001950
_08001938:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08001950
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800194C
	bl unk_39cc
_0800194C:
	mov r2, sl
	strb r7, [r2]
_08001950:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_1960
unk_1960: @ 0x08001960
	push {lr}
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _08001984
	movs r3, #0xff
	movs r2, #5
_0800196C:
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	beq _0800197E
	subs r0, #1
	strb r0, [r1, #0xe]
	ands r0, r3
	cmp r0, #0
	bne _0800197E
	strb r2, [r1]
_0800197E:
	ldr r1, [r1, #0x30]
	cmp r1, #0
	bne _0800196C
_08001984:
	pop {r0}
	bx r0

	thumb_func_start unk_1988
unk_1988: @ 0x08001988
	push {lr}
	adds r1, r0, #0
	ldr r2, [r1, #0x4c]
	ldrb r0, [r1, #0xe]
	cmp r0, #0
	beq _080019A6
	subs r0, #1
	strb r0, [r1, #0xe]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080019A6
	movs r0, #5
	strb r0, [r2]
	strb r1, [r2, #0x18]
_080019A6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_19ac
unk_19ac: @ 0x080019AC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x48]
	ldrb r0, [r5, #0x12]
	cmp r0, #0
	beq _080019DA
	cmp r0, #0
	blt _08001A36
	cmp r0, #2
	bgt _08001A36
	adds r0, r5, #0
	bl unk_491c
	cmp r4, #0
	beq _08001A36
	movs r1, #0x10
_080019CC:
	ldrb r0, [r4, #0x13]
	orrs r0, r1
	strb r0, [r4, #0x13]
	ldr r4, [r4, #0x30]
	cmp r4, #0
	bne _080019CC
	b _08001A36
_080019DA:
	adds r0, r5, #0
	bl unk_48c0
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _08001A32
	cmp r0, #0x20
	bne _08001A36
	b _08001A32
_080019EC:
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	ldrb r1, [r4, #7]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _08001A02
	movs r1, #0x7f
	b _08001A08
_08001A02:
	cmp r0, #0
	bge _08001A08
	movs r1, #0
_08001A08:
	ldr r0, [r5, #0x38]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r5, #0x18]
	bl MidiKey2Freq
	str r0, [r4, #0x1c]
	ldr r1, _08001A24 @ =gMusicInfo
	ldrh r2, [r1, #0x12]
	cmp r0, r2
	bne _08001A28
	movs r0, #0x80
	lsls r0, r0, #7
	b _08001A2E
	.align 2, 0
_08001A24: .4byte gMusicInfo
_08001A28:
	ldr r1, [r1, #0x18]
	bl CallGetNoteFrequency
_08001A2E:
	str r0, [r4, #0x1c]
	ldr r4, [r4, #0x30]
_08001A32:
	cmp r4, #0
	bne _080019EC
_08001A36:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_1a3c
unk_1a3c: @ 0x08001A3C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	ldr r6, [r5, #0x4c]
	ldrb r0, [r5, #0x12]
	cmp r0, #1
	bne _08001A78
	adds r0, r5, #0
	bl unk_491c
	ldrb r4, [r6, #0x19]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	ldr r2, _08001A74 @ =0x080A53F5
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	adds r1, r1, r2
	ldrb r1, [r1]
	bl __divsi3
	adds r4, r4, r0
	lsls r4, r4, #4
	strb r4, [r6, #0x12]
	ldrb r1, [r6, #0xf]
	movs r0, #0x20
	b _08001AC2
	.align 2, 0
_08001A74: .4byte 0x080A53F5
_08001A78:
	cmp r0, #0
	bne _08001AB4
	adds r0, r5, #0
	bl unk_48c0
	ldr r1, [r5, #0x4c]
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	ldrb r1, [r1, #0x1c]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _08001A9A
	movs r1, #0x7f
	b _08001AA0
_08001A9A:
	cmp r0, #0
	bge _08001AA0
	movs r1, #0
_08001AA0:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r5, #0x18]
	adds r0, r5, #0
	bl GetNoteDelay
	strh r0, [r6, #8]
	ldrb r1, [r6, #0xf]
	movs r0, #4
	b _08001AC2
_08001AB4:
	cmp r0, #2
	bne _08001AC6
	adds r0, r5, #0
	bl unk_491c
	ldrb r1, [r6, #0xf]
	movs r0, #0x10
_08001AC2:
	orrs r0, r1
	strb r0, [r6, #0xf]
_08001AC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_1acc
unk_1acc: @ 0x08001ACC
	push {lr}
	ldr r1, [r0, #0x48]
	cmp r1, #0
	beq _08001AE2
	movs r2, #0x10
_08001AD6:
	ldrb r0, [r1, #0x13]
	orrs r0, r2
	strb r0, [r1, #0x13]
	ldr r1, [r1, #0x30]
	cmp r1, #0
	bne _08001AD6
_08001AE2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_1ae8
unk_1ae8: @ 0x08001AE8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x48]
	cmp r4, #0
	beq _08001B46
_08001AF2:
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	ldrb r1, [r4, #7]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _08001B08
	movs r1, #0x7f
	b _08001B0E
_08001B08:
	cmp r0, #0
	bge _08001B0E
	movs r1, #0
_08001B0E:
	ldr r0, [r4, #0x20]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r5, #0x18]
	bl MidiKey2Freq
	str r0, [r4, #0x1c]
	ldr r1, _08001B2C @ =gMusicInfo
	ldrh r2, [r1, #0x12]
	cmp r0, r2
	bne _08001B30
	movs r0, #0x80
	lsls r0, r0, #7
	b _08001B36
	.align 2, 0
_08001B2C: .4byte gMusicInfo
_08001B30:
	ldr r1, [r1, #0x18]
	bl CallGetNoteFrequency
_08001B36:
	str r0, [r4, #0x1c]
	ldrb r1, [r4, #0x13]
	movs r0, #4
	orrs r0, r1
	strb r0, [r4, #0x13]
	ldr r4, [r4, #0x30]
	cmp r4, #0
	bne _08001AF2
_08001B46:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_1b4c
unk_1b4c: @ 0x08001B4C
	ldr r2, [r0, #0x4c]
	ldrb r1, [r2, #0xf]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2, #0xf]
	bx lr

	thumb_func_start unk_1b58
unk_1b58: @ 0x08001B58
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x4c]
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	ldrb r1, [r1, #0x1c]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _08001B74
	movs r1, #0x7f
	b _08001B7A
_08001B74:
	cmp r0, #0
	bge _08001B7A
	movs r1, #0
_08001B7A:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r4, #0x18]
	adds r0, r4, #0
	bl GetNoteDelay
	ldr r1, [r4, #0x4c]
	strh r0, [r1, #8]
	ldr r2, [r4, #0x4c]
	ldrb r1, [r2, #0xf]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2, #0xf]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_1b9c
unk_1b9c: @ 0x08001B9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r1
	ldrb r1, [r0, #3]
	mov r2, sb
	ldrb r0, [r2, #0xb]
	adds r0, r1, r0
	cmp r0, #0xff
	ble _08001BD0
	movs r3, #0xff
	str r3, [sp]
	b _08001BD6
_08001BBC:
	ldr r2, _08001BC8 @ =gMusicInfo
	ldr r3, _08001BCC @ =0x00001824
	adds r0, r2, r3
	adds r6, r1, r0
	b _08001C84
	.align 2, 0
_08001BC8: .4byte gMusicInfo
_08001BCC: .4byte 0x00001824
_08001BD0:
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
_08001BD6:
	ldr r7, [sp]
	mov r5, sb
	movs r0, #0
	mov r8, r0
	movs r6, #0
	movs r2, #0
	ldr r1, _08001C28 @ =gMusicInfo
	ldrb r1, [r1, #5]
	cmp r6, r1
	bhs _08001C80
	ldr r4, _08001C28 @ =gMusicInfo
	movs r3, #0x34
	mov ip, r3
	ldr r0, _08001C2C @ =0x0000184C
	adds r0, r0, r4
	mov sl, r0
	ldrb r1, [r4, #5]
	str r1, [sp, #4]
_08001BFA:
	mov r1, ip
	muls r1, r2, r1
	adds r0, r1, r4
	ldr r3, _08001C30 @ =0x00001824
	adds r0, r0, r3
	ldrb r0, [r0]
	adds r3, r0, #0
	cmp r3, #0
	beq _08001BBC
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _08001C1A
	cmp r3, #8
	bne _08001C34
_08001C1A:
	mov r0, r8
	cmp r0, #0
	bne _08001C3A
	movs r1, #1
	mov r8, r1
	b _08001C5E
	.align 2, 0
_08001C28: .4byte gMusicInfo
_08001C2C: .4byte 0x0000184C
_08001C30: .4byte 0x00001824
_08001C34:
	mov r3, r8
	cmp r3, #0
	bne _08001C74
_08001C3A:
	mov r3, ip
	muls r3, r2, r3
	ldr r1, _08001CA0 @ =gMusicInfo
	adds r0, r3, r1
	ldr r1, _08001CA4 @ =0x00001826
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, r7
	blo _08001C5E
	cmp r0, r7
	bhi _08001C74
	mov r1, sl
	adds r0, r3, r1
	ldr r0, [r0]
	cmp r0, r5
	bhi _08001C5E
	cmp r0, r5
	blo _08001C74
_08001C5E:
	mov r0, ip
	muls r0, r2, r0
	adds r1, r0, r4
	ldr r3, _08001CA4 @ =0x00001826
	adds r1, r1, r3
	ldrb r7, [r1]
	mov r3, sl
	adds r1, r0, r3
	ldr r5, [r1]
	ldr r1, _08001CA8 @ =0x030031F4
	adds r6, r0, r1
_08001C74:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, [sp, #4]
	cmp r2, r3
	blo _08001BFA
_08001C80:
	cmp r6, #0
	beq _08001C8E
_08001C84:
	adds r0, r6, #0
	mov r1, sb
	ldr r2, [sp]
	bl unk_4998
_08001C8E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CA0: .4byte gMusicInfo
_08001CA4: .4byte 0x00001826
_08001CA8: .4byte 0x030031F4

	thumb_func_start unk_1cac
unk_1cac: @ 0x08001CAC
	push {lr}
	adds r3, r0, #0
	ldrb r2, [r3]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08001CD8
	adds r2, r3, #0
	adds r2, #0x23
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	subs r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r2]
	cmp r0, r2
	bhi _08001CFC
	adds r0, r3, #0
	bl unk_1b9c
	b _08001CFC
_08001CD8:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _08001CFC
	adds r2, r3, #0
	adds r2, #0x23
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	subs r2, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r2]
	cmp r0, r2
	bhi _08001CFC
	adds r0, r3, #0
	bl unk_1b9c
_08001CFC:
	pop {r0}
	bx r0

	thumb_func_start unk_1d00
unk_1d00: @ 0x08001D00
	push {lr}
	adds r3, r1, #0
	ldrb r1, [r0, #3]
	ldrb r0, [r3, #0xb]
	adds r0, r1, r0
	cmp r0, #0xff
	ble _08001D12
	movs r2, #0xff
	b _08001D16
_08001D12:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08001D16:
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08001D4C @ =0x0300343C
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08001D40
	ldrb r0, [r1, #0x16]
	cmp r2, r0
	blo _08001D48
	cmp r2, r0
	bne _08001D40
	ldr r0, [r1, #0x24]
	cmp r3, r0
	bhi _08001D48
_08001D40:
	adds r0, r1, #0
	adds r1, r3, #0
	bl unk_1da0
_08001D48:
	pop {r0}
	bx r0
	.align 2, 0
_08001D4C: .4byte 0x0300343C

	thumb_func_start unk_1d50
unk_1d50: @ 0x08001D50
	push {lr}
	adds r3, r1, #0
	ldrb r1, [r0, #3]
	ldrb r0, [r3, #0xb]
	adds r0, r1, r0
	cmp r0, #0xff
	ble _08001D62
	movs r2, #0xff
	b _08001D66
_08001D62:
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08001D66:
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, _08001D9C @ =0x0300343C
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08001D90
	ldrb r0, [r1, #0x16]
	cmp r2, r0
	blo _08001D98
	cmp r2, r0
	bne _08001D90
	ldr r0, [r1, #0x24]
	cmp r3, r0
	bhi _08001D98
_08001D90:
	adds r0, r1, #0
	adds r1, r3, #0
	bl unk_1da0
_08001D98:
	pop {r0}
	bx r0
	.align 2, 0
_08001D9C: .4byte 0x0300343C

	thumb_func_start unk_1da0
unk_1da0: @ 0x08001DA0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	strb r2, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r0, [r0]
	strb r0, [r4, #1]
	ldrb r0, [r5, #6]
	strb r0, [r4, #0xc]
	ldrb r2, [r5, #1]
	strb r2, [r4, #0x17]
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x80
	bne _08001DCC
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	strb r0, [r4, #0x1c]
	b _08001DCE
_08001DCC:
	strb r2, [r4, #0x1c]
_08001DCE:
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	ldrb r1, [r4, #0x1c]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x7f
	ble _08001DE4
	movs r1, #0x7f
	b _08001DEA
_08001DE4:
	cmp r0, #0
	bge _08001DEA
	movs r1, #0
_08001DEA:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r5, #0x18]
	adds r0, r5, #0
	bl GetNoteDelay
	movs r1, #0
	strh r0, [r4, #8]
	ldr r0, [r4, #0x24]
	str r1, [r0, #0x4c]
	str r5, [r4, #0x24]
	ldrb r1, [r4, #0xf]
	movs r0, #2
	orrs r0, r1
	strb r0, [r4, #0xf]
	movs r0, #1
	strb r0, [r4]
	str r4, [r5, #0x4c]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_1e14
unk_1e14: @ 0x08001E14
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x28]
	cmp r0, #0
	beq _08001E42
	ldr r0, [r2, #0x30]
	cmp r0, #0
	beq _08001E2A
	ldr r1, [r2, #0x30]
	ldr r0, [r2, #0x2c]
	str r0, [r1, #0x2c]
_08001E2A:
	ldr r0, [r2, #0x2c]
	cmp r0, #0
	beq _08001E38
	ldr r1, [r2, #0x2c]
	ldr r0, [r2, #0x30]
	str r0, [r1, #0x30]
	b _08001E3E
_08001E38:
	ldr r1, [r2, #0x28]
	ldr r0, [r2, #0x30]
	str r0, [r1, #0x48]
_08001E3E:
	movs r0, #0
	str r0, [r2, #0x28]
_08001E42:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GetNoteDelay
GetNoteDelay: @ 0x08001E48
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r5, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #3
	bhi _08001E94
	ldr r1, _08001E90 @ =0x080A5278
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	cmp r2, #0
	beq _08001EA6
	adds r0, r4, #1
	cmp r0, #0x7f
	ble _08001E76
	movs r4, #0x7f
_08001E76:
	adds r0, r4, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, r0, r3
	adds r1, r5, #1
	muls r0, r1, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	b _08001EA6
	.align 2, 0
_08001E90: .4byte 0x080A5278
_08001E94:
	ldr r0, _08001EB0 @ =0x080A53A9
	adds r1, r4, #0
	subs r1, #0x15
	adds r1, r1, r0
	ldr r0, [r3, #0x38]
	ldrb r1, [r1]
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_08001EA6:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08001EB0: .4byte 0x080A53A9

	thumb_func_start unk_1eb4
unk_1eb4: @ 0x08001EB4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [r6, #0x48]
	cmp r0, #0
	beq _08001ED6
	adds r1, r0, #0
	movs r2, #0
	movs r3, #0xa
_08001EC6:
	strb r3, [r1]
	str r2, [r1, #0x28]
	ldr r0, [r1, #0x30]
	str r2, [r1, #0x30]
	str r2, [r1, #0x2c]
	adds r1, r0, #0
	cmp r1, #0
	bne _08001EC6
_08001ED6:
	ldr r1, [r6, #0x4c]
	cmp r1, #0
	beq _08001EE0
	movs r0, #0xa
	strb r0, [r1]
_08001EE0:
	ldrb r0, [r4, #4]
	adds r0, #1
	movs r5, #0
	strb r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08001EFC
	adds r0, r4, #0
	bl ResetTrack
	strb r5, [r4]
	strb r5, [r4, #4]
_08001EFC:
	strb r5, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_1f04
unk_1f04: @ 0x08001F04
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [r6, #0x48]
	cmp r0, #0
	beq _08001F26
	adds r1, r0, #0
	movs r2, #0
	movs r3, #0xa
_08001F16:
	strb r3, [r1]
	str r2, [r1, #0x28]
	ldr r0, [r1, #0x30]
	str r2, [r1, #0x30]
	str r2, [r1, #0x2c]
	adds r1, r0, #0
	cmp r1, #0
	bne _08001F16
_08001F26:
	ldr r1, [r6, #0x4c]
	cmp r1, #0
	beq _08001F30
	movs r0, #0xa
	strb r0, [r1]
_08001F30:
	ldrb r0, [r4, #4]
	adds r0, #1
	movs r5, #0
	strb r0, [r4, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r4, #1]
	cmp r0, r1
	bne _08001F58
	adds r0, r4, #0
	bl ResetTrack
	strb r5, [r4]
	strb r5, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r1, [r0]
	movs r2, #2
	orrs r1, r2
	strb r1, [r0]
_08001F58:
	strb r5, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_1f60
unk_1f60: @ 0x08001F60
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x24]
	adds r0, #1
	str r0, [r3, #0x24]
	movs r1, #2
	adds r4, r3, #0
	adds r4, #0x28
	movs r5, #0
_08001F72:
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	lsls r0, r2, #2
	adds r1, r4, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _08001F86
	str r0, [r3, #0x24]
	str r5, [r1]
	b _08001F90
_08001F86:
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r0, #0
	bge _08001F72
_08001F90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_1f98
unk_1f98: @ 0x08001F98
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0xa]
	cmp r0, #0
	bne _08001FB4
	ldr r0, [r2, #0x24]
	adds r1, r0, #1
	str r1, [r2, #0x24]
	ldrb r0, [r0, #1]
	strb r0, [r2, #0xa]
	adds r0, r2, #0
	bl unk_4a7c
	b _08001FD2
_08001FB4:
	subs r0, #1
	strb r0, [r2, #0xa]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08001FC6
	adds r0, r2, #0
	bl unk_1f60
	b _08001FD2
_08001FC6:
	ldr r0, [r2, #0x24]
	adds r0, #1
	str r0, [r2, #0x24]
	adds r0, r2, #0
	bl unk_4a7c
_08001FD2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_1fd8
unk_1fd8: @ 0x08001FD8
	ldr r2, [r0, #0x24]
	adds r1, r2, #1
	str r1, [r0, #0x24]
	ldrb r2, [r2, #1]
	strb r2, [r0, #0xb]
	adds r1, #1
	str r1, [r0, #0x24]
	bx lr

	thumb_func_start unk_1fe8
unk_1fe8: @ 0x08001FE8
	ldr r1, [r0, #0x24]
	adds r2, r1, #1
	str r2, [r0, #0x24]
	ldrb r1, [r1, #1]
	strb r1, [r0, #0x1c]
	ldrb r3, [r0]
	movs r1, #8
	orrs r1, r3
	strb r1, [r0]
	adds r2, #1
	str r2, [r0, #0x24]
	bx lr

	thumb_func_start unk_2000
unk_2000: @ 0x08002000
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4, #0x24]
	ldrb r2, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	ldr r0, [r0, #0x14]
	adds r5, r0, r1
	ldrb r0, [r5]
	adds r2, r4, #0
	adds r2, #0x34
	movs r1, #0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bls _0800204C
	cmp r0, #0x80
	bne _08002036
	ldrb r0, [r4]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #0x40]
	b _080020B2
_08002036:
	cmp r0, #0x40
	bne _080020B2
	ldrb r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #0x40]
	ldr r0, [r5, #8]
	str r0, [r4, #0x44]
	b _080020B2
_0800204C:
	ldrb r1, [r4]
	movs r0, #0xf
	ands r0, r1
	strb r0, [r4]
	ldrb r0, [r5, #2]
	adds r1, r4, #0
	adds r1, #0x36
	strb r0, [r1]
	ldrb r0, [r2]
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _0800206A
	ldr r0, [r5, #4]
	b _080020AC
_0800206A:
	cmp r1, #2
	bhi _08002096
	ldrb r1, [r5, #3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08002088
	movs r0, #0x70
	ands r0, r1
	cmp r0, #0
	beq _08002088
	adds r0, r4, #0
	adds r0, #0x37
	strb r1, [r0]
	b _08002090
_08002088:
	adds r1, r4, #0
	adds r1, #0x37
	movs r0, #8
	strb r0, [r1]
_08002090:
	ldr r0, [r5, #4]
	lsls r0, r0, #0x1e
	b _080020AA
_08002096:
	cmp r1, #3
	bne _080020A2
	ldr r0, [r5, #4]
	bl UploadSampleToWaveRAM
	b _080020AE
_080020A2:
	cmp r1, #4
	bne _080020AE
	ldr r0, [r5, #4]
	lsls r0, r0, #0x1b
_080020AA:
	lsrs r0, r0, #0x18
_080020AC:
	str r0, [r4, #0x38]
_080020AE:
	ldr r0, [r5, #8]
	str r0, [r4, #0x3c]
_080020B2:
	ldr r0, [r4, #0x24]
	adds r0, #1
	str r0, [r4, #0x24]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_20c0
unk_20c0: @ 0x080020C0
	ldr r2, [r0, #0x24]
	ldrb r1, [r2]
	strb r1, [r0, #4]
	ldrb r3, [r0]
	movs r1, #4
	orrs r1, r3
	strb r1, [r0]
	adds r2, #1
	str r2, [r0, #0x24]
	bx lr

	thumb_func_start unk_20d4
unk_20d4: @ 0x080020D4
	ldr r2, [r0, #0x24]
	ldrb r1, [r2]
	strb r1, [r0, #6]
	ldrb r3, [r0]
	movs r1, #4
	orrs r1, r3
	strb r1, [r0]
	adds r2, #1
	str r2, [r0, #0x24]
	bx lr

	thumb_func_start unk_20e8
unk_20e8: @ 0x080020E8
	ldr r2, [r0, #0x24]
	ldrb r1, [r2]
	subs r1, #0x40
	strb r1, [r0, #0x19]
	ldrb r3, [r0]
	movs r1, #8
	orrs r1, r3
	strb r1, [r0]
	adds r2, #1
	str r2, [r0, #0x24]
	bx lr
	.align 2, 0

	thumb_func_start unk_2100
unk_2100: @ 0x08002100
	ldr r2, [r0, #0x24]
	ldrb r1, [r2]
	strb r1, [r0, #0x1a]
	ldrb r3, [r0]
	movs r1, #8
	orrs r1, r3
	strb r1, [r0]
	adds r2, #1
	str r2, [r0, #0x24]
	bx lr

	thumb_func_start unk_2114
unk_2114: @ 0x08002114
	ldr r2, [r0, #0x24]
	ldrb r1, [r2]
	adds r1, #1
	asrs r1, r1, #1
	strb r1, [r0, #0x10]
	adds r2, #1
	str r2, [r0, #0x24]
	bx lr

	thumb_func_start unk_2124
unk_2124: @ 0x08002124
	ldr r1, [r0, #0x24]
	ldrb r2, [r1]
	strb r2, [r0, #0x14]
	strb r2, [r0, #0x15]
	adds r1, #1
	str r1, [r0, #0x24]
	bx lr
	.align 2, 0

	thumb_func_start unk_2134
unk_2134: @ 0x08002134
	ldr r1, [r0, #0x24]
	ldrb r2, [r1]
	strb r2, [r0, #0x11]
	adds r1, #1
	str r1, [r0, #0x24]
	bx lr

	thumb_func_start unk_2140
unk_2140: @ 0x08002140
	ldr r1, [r0, #0x24]
	ldrb r2, [r1]
	strb r2, [r0, #0x12]
	adds r1, #1
	str r1, [r0, #0x24]
	bx lr

	thumb_func_start unk_214c
unk_214c: @ 0x0800214C
	ldr r2, [r0, #0x24]
	ldrb r1, [r2]
	subs r1, #0x40
	strb r1, [r0, #0x1e]
	ldrb r3, [r0]
	movs r1, #8
	orrs r1, r3
	strb r1, [r0]
	adds r2, #1
	str r2, [r0, #0x24]
	bx lr
	.align 2, 0

	thumb_func_start unk_2164
unk_2164: @ 0x08002164
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x24]
	ldrb r0, [r1]
	cmp r0, #8
	bne _0800217C
	adds r0, r1, #1
	str r0, [r2, #0x24]
	ldrb r1, [r1, #1]
	strb r1, [r2, #0xc]
	adds r0, #1
	str r0, [r2, #0x24]
_0800217C:
	ldr r1, [r2, #0x24]
	ldrb r0, [r1]
	cmp r0, #9
	bne _08002190
	adds r0, r1, #1
	str r0, [r2, #0x24]
	ldrb r1, [r1, #1]
	strb r1, [r2, #0xd]
	adds r0, #1
	str r0, [r2, #0x24]
_08002190:
	pop {r0}
	bx r0

	thumb_func_start unk_2194
unk_2194: @ 0x08002194
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, [r3, #0x24]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _080021AC
	ldrb r4, [r1]
	strb r4, [r3, #1]
	adds r0, r1, #1
	str r0, [r3, #0x24]
	b _080021AE
_080021AC:
	ldrb r4, [r3, #1]
_080021AE:
	ldr r0, [r3, #0x48]
	cmp r0, #0
	beq _080021D4
	adds r1, r0, #0
	b _080021BE
_080021B8:
	ldr r1, [r1, #0x30]
	cmp r1, #0
	beq _080021D4
_080021BE:
	ldrb r0, [r1]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _080021B8
	ldrb r0, [r1, #6]
	cmp r0, r4
	bne _080021B8
	movs r0, #5
	strb r0, [r1]
_080021D4:
	ldr r2, [r3, #0x4c]
	cmp r2, #0
	beq _080021EA
	ldrb r0, [r2, #0x17]
	cmp r0, r4
	bne _080021EA
	movs r0, #0
	movs r1, #5
	strb r1, [r2]
	ldr r1, [r3, #0x4c]
	strb r0, [r1, #0x18]
_080021EA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Music_Empty
Music_Empty: @ 0x080021F0
	bx lr
	.align 2, 0

	thumb_func_start ClearRegistersForPSG
ClearRegistersForPSG: @ 0x080021F4
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	cmp r1, #1
	beq _08002224
	cmp r1, #1
	bgt _0800220A
	cmp r1, #0
	beq _08002214
	b _08002248
_0800220A:
	cmp r0, #2
	beq _0800222C
	cmp r0, #3
	beq _08002238
	b _08002248
_08002214:
	ldr r1, _08002220 @ =0x04000063
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	b _08002240
	.align 2, 0
_08002220: .4byte 0x04000063
_08002224:
	ldr r1, _08002228 @ =0x04000069
	b _0800223A
	.align 2, 0
_08002228: .4byte 0x04000069
_0800222C:
	ldr r1, _08002234 @ =0x04000070
	movs r0, #0
	strb r0, [r1]
	b _08002248
	.align 2, 0
_08002234: .4byte 0x04000070
_08002238:
	ldr r1, _0800224C @ =0x04000079
_0800223A:
	movs r0, #8
	strb r0, [r1]
	adds r1, #3
_08002240:
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
_08002248:
	pop {r0}
	bx r0
	.align 2, 0
_0800224C: .4byte 0x04000079

	thumb_func_start ClearRegistersForPSG_Unused
ClearRegistersForPSG_Unused: @ 0x08002250
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #1
	beq _08002278
	cmp r1, #1
	bgt _08002264
	cmp r1, #0
	beq _0800226E
	b _0800228E
_08002264:
	cmp r1, #2
	beq _08002280
	cmp r1, #3
	beq _08002288
	b _0800228E
_0800226E:
	ldr r0, _08002274 @ =0x04000063
	strb r1, [r0]
	b _0800228E
	.align 2, 0
_08002274: .4byte 0x04000063
_08002278:
	ldr r1, _0800227C @ =0x04000069
	b _0800228A
	.align 2, 0
_0800227C: .4byte 0x04000069
_08002280:
	ldr r1, _08002284 @ =0x04000070
	b _0800228A
	.align 2, 0
_08002284: .4byte 0x04000070
_08002288:
	ldr r1, _08002294 @ =0x04000079
_0800228A:
	movs r0, #0
	strb r0, [r1]
_0800228E:
	pop {r0}
	bx r0
	.align 2, 0
_08002294: .4byte 0x04000079

	thumb_func_start InitializeAudio
InitializeAudio: @ 0x08002298
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r5, _08002468 @ =gMusicInfo
	ldrb r4, [r5, #1]
	cmp r4, #0
	beq _080022AA
	b _0800245A
_080022AA:
	movs r0, #1
	strb r0, [r5, #1]
	ldr r2, _0800246C @ =0x04000200
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08002470 @ =0x04000084
	movs r3, #0x80
	strb r3, [r0]
	ldr r1, _08002474 @ =0x04000082
	ldr r2, _08002478 @ =0x0000A90E
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0800247C @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08002480 @ =0x04000063
	movs r1, #8
	strb r1, [r0]
	adds r0, #2
	strb r3, [r0]
	adds r0, #4
	strb r1, [r0]
	adds r0, #4
	strb r3, [r0]
	adds r0, #0xc
	strb r1, [r0]
	adds r0, #4
	strb r3, [r0]
	subs r0, #0xd
	strb r4, [r0]
	ldr r1, _08002484 @ =0x04000080
	movs r0, #0x77
	strb r0, [r1]
	ldr r0, _08002488 @ =0x03003654
	ldr r1, _0800248C @ =0x03003659
	str r1, [r0]
	adds r2, #0x4b
	ldr r0, _08002490 @ =CallSoundCodeA
	str r0, [r2]
	subs r1, #1
	str r1, [r2, #4]
	ldr r0, _08002494 @ =0x8000032C
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08002498 @ =0x03003CB0
	ldr r0, _0800249C @ =0x03003CB5
	str r0, [r1]
	ldr r1, _080024A0 @ =CallSoundCodeB
	str r1, [r2]
	subs r0, #1
	str r0, [r2, #4]
	ldr r0, _080024A4 @ =0x80000052
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _080024A8 @ =0x03003D58
	ldr r0, _080024AC @ =0x03003D5D
	str r0, [r1]
	ldr r1, _080024B0 @ =CallSoundCodeC
	str r1, [r2]
	subs r0, #1
	str r0, [r2, #4]
	ldr r0, _080024B4 @ =0x80000058
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r0, sp
	strh r4, [r0]
	str r0, [r2]
	str r5, [r2, #4]
	ldr r0, _080024B8 @ =0x8100000E
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _080024BC @ =0x00000064
	strb r0, [r5, #9]
	movs r3, #0
	ldr r5, _080024C0 @ =0x00000008
	mov ip, r5
	ldr r0, _080024C4 @ =0x0193F600
	mov r8, r0
	mov r1, sp
	movs r6, #0
	ldr r5, _080024C8 @ =0x03003464
	ldr r4, _080024CC @ =0x81000014
_0800235E:
	strh r6, [r1]
	mov r0, sp
	str r0, [r2]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r5
	str r0, [r2, #4]
	str r4, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _0800235E
	movs r3, #0
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r3, r0
	bhs _080023B4
	mov r4, sp
	ldr r1, _080024D0 @ =0x040000D4
	ldr r7, _080024D4 @ =0x080A8CDC
	adds r2, r0, #0
	movs r6, #0
	ldr r5, _080024D8 @ =0x81000016
_08002394:
	strh r6, [r4]
	mov r0, sp
	str r0, [r1]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r0, [r0]
	str r0, [r1, #4]
	str r5, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _08002394
_080023B4:
	movs r3, #0
	mov r1, ip
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r3, r0
	bhs _080023EA
	ldr r4, _080024D4 @ =0x080A8CDC
	adds r6, r4, #4
	adds r5, r0, #0
_080023C6:
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r4
	ldr r1, [r2]
	adds r0, r0, r6
	ldr r0, [r0]
	str r0, [r1, #0x18]
	ldrh r0, [r2, #8]
	strb r0, [r1, #5]
	ldr r1, [r2]
	ldrh r0, [r2, #0xa]
	strb r0, [r1, #0x1d]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r5
	blo _080023C6
_080023EA:
	mov r0, r8
	bl unk_24ec
	movs r3, #0
	ldr r2, _08002468 @ =gMusicInfo
	ldrb r0, [r2, #5]
	cmp r3, r0
	bhs _0800242A
	mov r4, sp
	movs r5, #0
	mov ip, r5
	ldr r1, _080024D0 @ =0x040000D4
	ldr r5, _080024DC @ =0x00001824
	adds r7, r2, r5
	adds r2, r0, #0
	movs r6, #0x34
	ldr r5, _080024E0 @ =0x8100001A
_0800240C:
	mov r0, ip
	strh r0, [r4]
	mov r0, sp
	str r0, [r1]
	adds r0, r3, #0
	muls r0, r6, r0
	adds r0, r0, r7
	str r0, [r1, #4]
	str r5, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, r2
	blo _0800240C
_0800242A:
	movs r3, #0
	ldr r7, _08002468 @ =gMusicInfo
	mov r2, sp
	movs r6, #0
	ldr r1, _080024D0 @ =0x040000D4
	ldr r5, _080024E4 @ =0x03003504
	ldr r4, _080024E8 @ =0x8100001C
_08002438:
	strh r6, [r2]
	mov r0, sp
	str r0, [r1]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r5
	str r0, [r1, #4]
	str r4, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #5
	bls _08002438
	movs r0, #0
	strb r0, [r7, #1]
_0800245A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002468: .4byte gMusicInfo
_0800246C: .4byte 0x04000200
_08002470: .4byte 0x04000084
_08002474: .4byte 0x04000082
_08002478: .4byte 0x0000A90E
_0800247C: .4byte 0x04000089
_08002480: .4byte 0x04000063
_08002484: .4byte 0x04000080
_08002488: .4byte 0x03003654
_0800248C: .4byte 0x03003659
_08002490: .4byte CallSoundCodeA
_08002494: .4byte 0x8000032C
_08002498: .4byte 0x03003CB0
_0800249C: .4byte 0x03003CB5
_080024A0: .4byte CallSoundCodeB
_080024A4: .4byte 0x80000052
_080024A8: .4byte 0x03003D58
_080024AC: .4byte 0x03003D5D
_080024B0: .4byte CallSoundCodeC
_080024B4: .4byte 0x80000058
_080024B8: .4byte 0x8100000E
_080024BC: .4byte 0x00000064
_080024C0: .4byte 0x00000008
_080024C4: .4byte 0x0193F600
_080024C8: .4byte 0x03003464
_080024CC: .4byte 0x81000014
_080024D0: .4byte 0x040000D4
_080024D4: .4byte 0x080A8CDC
_080024D8: .4byte 0x81000016
_080024DC: .4byte 0x00001824
_080024E0: .4byte 0x8100001A
_080024E4: .4byte 0x03003504
_080024E8: .4byte 0x8100001C

	thumb_func_start unk_24ec
unk_24ec: @ 0x080024EC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0800259C @ =gMusicInfo
	ldrb r1, [r0, #1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080025D2
	movs r0, #1
	strb r0, [r2, #1]
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0800250C
	adds r0, r4, #0
	adds r0, #0x80
	strb r0, [r2, #4]
_0800250C:
	movs r0, #0xf0
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0800253C
	lsrs r0, r0, #8
	strb r0, [r2, #5]
	movs r0, #0xb
	adds r7, r2, #0
	movs r6, #0x34
	ldr r5, _080025A0 @ =0x00001824
	movs r3, #0
_08002524:
	lsls r1, r0, #0x18
	asrs r1, r1, #0x18
	adds r0, r1, #0
	muls r0, r6, r0
	adds r0, r0, r7
	adds r0, r0, r5
	strb r3, [r0]
	subs r1, #1
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r1, #0
	bge _08002524
_0800253C:
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _0800254A
	lsrs r0, r0, #0xc
	strb r0, [r2, #6]
_0800254A:
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r4
	cmp r0, #0
	beq _08002562
	ldr r1, _0800259C @ =gMusicInfo
	lsrs r0, r0, #0x10
	strb r0, [r1, #7]
	cmp r0, #0
	beq _08002562
	bl SetupSoundTransfer
_08002562:
	movs r3, #0xf0
	lsls r3, r3, #0x10
	ands r3, r4
	cmp r3, #0
	beq _0800257A
	ldr r2, _080025A4 @ =0x04000089
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	lsrs r1, r3, #0xe
	orrs r0, r1
	strb r0, [r2]
_0800257A:
	movs r1, #0xf0
	lsls r1, r1, #0x14
	ands r1, r4
	cmp r1, #0
	beq _080025CC
	movs r0, #0x80
	lsls r0, r0, #0x12
	cmp r1, r0
	bne _080025B0
	ldr r2, _080025A8 @ =0x04000082
	ldrh r1, [r2]
	ldr r0, _080025AC @ =0x0000E10D
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #1
	b _080025C8
	.align 2, 0
_0800259C: .4byte gMusicInfo
_080025A0: .4byte 0x00001824
_080025A4: .4byte 0x04000089
_080025A8: .4byte 0x04000082
_080025AC: .4byte 0x0000E10D
_080025B0:
	movs r0, #0x80
	lsls r0, r0, #0x11
	cmp r1, r0
	bne _080025CC
	ldr r2, _080025D8 @ =0x04000082
	ldrh r1, [r2]
	ldr r0, _080025DC @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	ldr r3, _080025E0 @ =0x00003302
	adds r1, r3, #0
_080025C8:
	orrs r0, r1
	strh r0, [r2]
_080025CC:
	ldr r1, _080025E4 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
_080025D2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080025D8: .4byte 0x04000082
_080025DC: .4byte 0x0000FFFE
_080025E0: .4byte 0x00003302
_080025E4: .4byte gMusicInfo

	thumb_func_start SetupSoundTransfer
SetupSoundTransfer: @ 0x080025E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080026CC @ =0x040000C4
	ldr r1, _080026D0 @ =0x84400004
	str r1, [r0]
	adds r0, #0xc
	str r1, [r0]
	ldr r7, _080026D4 @ =0x040000C6
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	strh r0, [r7]
	ldr r1, _080026D8 @ =0x040000D2
	mov sb, r1
	strh r0, [r1]
	movs r0, #0
	mov sl, r0
	str r0, [sp]
	ldr r6, _080026DC @ =0x030025F4
	ldr r2, _080026E0 @ =0x01000300
	mov r0, sp
	adds r1, r6, #0
	bl CpuFastSet
	ldr r1, _080026E4 @ =0xFFFFF3DC
	adds r4, r6, r1
	ldr r1, _080026E8 @ =0x080A5408
	ldrb r0, [r4, #7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	strh r0, [r4, #0x12]
	ldr r1, _080026EC @ =0x080A543C
	ldrb r0, [r4, #7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x18]
	ldr r1, _080026F0 @ =0x080A5470
	ldrb r0, [r4, #7]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	mov r8, r0
	str r0, [r4, #0x14]
	lsrs r5, r0, #4
	strb r5, [r4, #0xc]
	ldrb r1, [r4, #0xc]
	movs r0, #0x60
	bl __divsi3
	strb r0, [r4, #0xd]
	muls r0, r5, r0
	strb r0, [r4, #0xe]
	subs r0, #1
	strb r0, [r4, #0x10]
	lsls r5, r5, #1
	strb r5, [r4, #0x11]
	ldr r0, _080026F4 @ =0x040000BC
	str r6, [r0]
	adds r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #3
	adds r6, r6, r1
	str r6, [r0]
	ldr r1, _080026F8 @ =0x040000C0
	subs r0, #0x28
	str r0, [r1]
	adds r1, #0xc
	adds r0, #4
	str r0, [r1]
	movs r1, #0xb6
	lsls r1, r1, #8
	adds r0, r1, #0
	strh r0, [r7]
	movs r1, #0xf6
	lsls r1, r1, #8
	adds r0, r1, #0
	mov r1, sb
	strh r0, [r1]
	ldr r0, _080026FC @ =0x04000102
	mov r1, sl
	strh r1, [r0]
	ldr r4, _08002700 @ =0x04000100
	ldr r0, _08002704 @ =0x00044940
	mov r1, r8
	bl __udivsi3
	rsbs r0, r0, #0
	strh r0, [r4]
	ldr r1, _08002708 @ =0x04000006
_080026A6:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _080026A6
	ldr r1, _08002708 @ =0x04000006
_080026AE:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _080026AE
	ldr r1, _080026FC @ =0x04000102
	movs r0, #0x80
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080026CC: .4byte 0x040000C4
_080026D0: .4byte 0x84400004
_080026D4: .4byte 0x040000C6
_080026D8: .4byte 0x040000D2
_080026DC: .4byte 0x030025F4
_080026E0: .4byte 0x01000300
_080026E4: .4byte 0xFFFFF3DC
_080026E8: .4byte 0x080A5408
_080026EC: .4byte 0x080A543C
_080026F0: .4byte 0x080A5470
_080026F4: .4byte 0x040000BC
_080026F8: .4byte 0x040000C0
_080026FC: .4byte 0x04000102
_08002700: .4byte 0x04000100
_08002704: .4byte 0x00044940
_08002708: .4byte 0x04000006

	thumb_func_start SoundPlay
SoundPlay: @ 0x0800270C
	push {lr}
	lsls r0, r0, #0x10
	ldr r3, _08002730 @ =0x080A8CDC
	ldr r1, _08002734 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r2, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	ldr r1, [r0]
	adds r0, r2, #0
	bl unk_45a8
	pop {r0}
	bx r0
	.align 2, 0
_08002730: .4byte 0x080A8CDC
_08002734: .4byte 0x080A8D3C

	thumb_func_start StopSound
StopSound: @ 0x08002738
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _0800276C @ =0x080A8CDC
	ldr r1, _08002770 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r3, r0, r1
	ldrh r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08002768
	ldr r1, [r3]
	ldr r0, [r2, #0x10]
	cmp r1, r0
	bne _08002768
	adds r0, r2, #0
	bl StopMusic
_08002768:
	pop {r0}
	bx r0
	.align 2, 0
_0800276C: .4byte 0x080A8CDC
_08002770: .4byte 0x080A8D3C

	thumb_func_start StopAllMusicsAndSounds
StopAllMusicsAndSounds: @ 0x08002774
	push {r4, r5, lr}
	ldr r0, _080027A0 @ =0x00000008
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r0, #1
	cmp r4, #0
	blt _0800279A
	ldr r1, _080027A4 @ =0x080A8CDC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r5, r0, r1
_0800278C:
	ldr r0, [r5]
	bl StopMusic
	subs r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0800278C
_0800279A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080027A0: .4byte 0x00000008
_080027A4: .4byte 0x080A8CDC

	thumb_func_start unk_27a8
unk_27a8: @ 0x080027A8
	push {r4, r5, lr}
	ldr r0, _080027E0 @ =0x00000008
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r0, #1
	cmp r4, #0
	blt _080027DA
	ldr r1, _080027E4 @ =0x080A8CDC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r5, r0, r1
_080027C0:
	ldr r2, [r5]
	ldrb r1, [r2, #0x1e]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080027D2
	adds r0, r2, #0
	bl StopMusic
_080027D2:
	subs r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _080027C0
_080027DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080027E0: .4byte 0x00000008
_080027E4: .4byte 0x080A8CDC

	thumb_func_start unk_27e8
unk_27e8: @ 0x080027E8
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _08002804 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800280C
	ldr r0, _08002808 @ =0x080A8CDC
	ldr r0, [r0, #0xc]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	b _08002816
	.align 2, 0
_08002804: .4byte gMusicInfo
_08002808: .4byte 0x080A8CDC
_0800280C:
	ldr r0, _08002850 @ =0x080A8CDC
	ldr r0, [r0]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
_08002816:
	ldr r4, _08002850 @ =0x080A8CDC
	ldr r0, [r4, #0x18]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x24]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x30]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x3c]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x48]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	ldr r0, [r4, #0x54]
	adds r1, r5, #0
	bl ApplyMusicSoundFading
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002850: .4byte 0x080A8CDC

	thumb_func_start CheckPlayNotAlreadyPlayingSound
CheckPlayNotAlreadyPlayingSound: @ 0x08002854
	push {lr}
	lsls r0, r0, #0x10
	ldr r3, _0800288C @ =0x080A8CDC
	ldr r1, _08002890 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r2, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, [r1]
	ldr r3, [r0]
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0800287E
	ldr r0, [r2, #0x10]
	cmp r3, r0
	beq _08002886
_0800287E:
	adds r0, r2, #0
	adds r1, r3, #0
	bl unk_45a8
_08002886:
	pop {r0}
	bx r0
	.align 2, 0
_0800288C: .4byte 0x080A8CDC
_08002890: .4byte 0x080A8D3C

	thumb_func_start unk_2894
unk_2894: @ 0x08002894
	push {lr}
	lsls r0, r0, #0x10
	ldr r3, _080028D0 @ =0x080A8CDC
	ldr r1, _080028D4 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r2, [r0, #4]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	ldr r3, [r0]
	ldrb r2, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _080028D8
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080028E8
	ldr r0, [r1, #0x10]
	cmp r3, r0
	bne _080028DE
	adds r0, r1, #0
	bl unk_2938
	b _080028F6
	.align 2, 0
_080028D0: .4byte 0x080A8CDC
_080028D4: .4byte 0x080A8D3C
_080028D8:
	ldr r0, [r1, #0x10]
	cmp r3, r0
	beq _080028F6
_080028DE:
	adds r0, r1, #0
	adds r1, r3, #0
	bl unk_45a8
	b _080028F6
_080028E8:
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _080028F6
	adds r0, r1, #0
	adds r1, r3, #0
	bl unk_45a8
_080028F6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_28fc
unk_28fc: @ 0x080028FC
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _08002930 @ =0x080A8CDC
	ldr r1, _08002934 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r3, r0, r1
	ldrh r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800292C
	ldr r1, [r3]
	ldr r0, [r2, #0x10]
	cmp r1, r0
	bne _0800292C
	adds r0, r2, #0
	bl unk_2938
_0800292C:
	pop {r0}
	bx r0
	.align 2, 0
_08002930: .4byte 0x080A8CDC
_08002934: .4byte 0x080A8D3C

	thumb_func_start unk_2938
unk_2938: @ 0x08002938
	push {r4, lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1c]
	cmp r0, #0
	bne _0800296E
	movs r0, #1
	strb r0, [r2, #0x1c]
	ldrb r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _0800296A
	movs r0, #2
	strb r0, [r2]
	movs r1, #0
	ldr r0, [r2, #0x18]
	ldrb r3, [r2, #1]
	cmp r1, r3
	bge _0800296A
	movs r3, #0x40
_0800295E:
	strb r3, [r0, #5]
	adds r1, #1
	adds r0, #0x50
	ldrb r4, [r2, #1]
	cmp r1, r4
	blt _0800295E
_0800296A:
	movs r0, #0
	strb r0, [r2, #0x1c]
_0800296E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_2974
unk_2974: @ 0x08002974
	push {r4, r5, lr}
	ldr r0, _080029A0 @ =0x00000008
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	subs r4, r0, #1
	cmp r4, #0
	blt _0800299A
	ldr r1, _080029A4 @ =0x080A8CDC
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r5, r0, r1
_0800298C:
	ldr r0, [r5]
	bl unk_2938
	subs r5, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0800298C
_0800299A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080029A0: .4byte 0x00000008
_080029A4: .4byte 0x080A8CDC

	thumb_func_start ApplyMusicSoundFading
ApplyMusicSoundFading: @ 0x080029A8
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0
	bne _080029BA
	bl StopMusic
	b _080029F2
_080029BA:
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _080029F2
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r2, [r4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080029EE
	movs r0, #0xf8
	ands r0, r2
	cmp r0, #0
	beq _080029DE
	adds r0, r4, #0
	bl ResetTrack
	b _080029EE
_080029DE:
	movs r0, #8
	orrs r0, r2
	strb r0, [r4]
	ldr r0, _080029F8 @ =0x0000FFFF
	strh r0, [r4, #6]
	bl __divsi3
	strh r0, [r4, #8]
_080029EE:
	movs r0, #0
	strb r0, [r4, #0x1c]
_080029F2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080029F8: .4byte 0x0000FFFF

	thumb_func_start ApplyRawMusicSoundFading
ApplyRawMusicSoundFading: @ 0x080029FC
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002A34
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r2, [r4]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08002A30
	movs r0, #0xf8
	ands r0, r2
	cmp r0, #0
	bne _08002A30
	movs r0, #0x10
	orrs r0, r2
	strb r0, [r4]
	ldr r0, _08002A3C @ =0x0000FFFF
	strh r0, [r4, #6]
	bl __divsi3
	strh r0, [r4, #8]
_08002A30:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002A34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002A3C: .4byte 0x0000FFFF

	thumb_func_start unk_2a40
unk_2a40: @ 0x08002A40
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x18]
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #8]
	subs r1, r1, r0
	cmp r1, #0
	blt _08002AA8
	strh r1, [r4, #6]
	ldrb r1, [r4]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08002A86
	ldrh r0, [r4, #0x26]
	ldrh r1, [r4, #0x24]
	adds r0, r0, r1
	strh r0, [r4, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1c
	cmp r0, #0
	beq _08002A7E
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrh r1, [r4, #0x24]
	ldr r0, _08002AA4 @ =0x00000FFF
	ands r0, r1
	strh r0, [r4, #0x24]
_08002A7E:
	adds r1, r4, #0
	adds r1, #0x23
	movs r0, #0
	strb r0, [r1]
_08002A86:
	ldrb r1, [r4, #1]
	cmp r1, #0
	ble _08002ACE
	movs r3, #4
_08002A8E:
	ldrh r0, [r4, #6]
	lsrs r0, r0, #0xa
	strb r0, [r2, #5]
	ldrb r0, [r2]
	orrs r0, r3
	strb r0, [r2]
	subs r1, #1
	adds r2, #0x50
	cmp r1, #0
	bgt _08002A8E
	b _08002ACE
	.align 2, 0
_08002AA4: .4byte 0x00000FFF
_08002AA8:
	adds r0, r4, #0
	bl ResetTrack
	ldrb r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08002ABC
	movs r0, #0
	strb r0, [r4]
_08002ABC:
	ldrh r0, [r4, #0x20]
	cmp r0, #0
	beq _08002ACE
	adds r2, r4, #0
	adds r2, #0x28
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
_08002ACE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_2ad4
unk_2ad4: @ 0x08002AD4
	push {r4, lr}
	adds r2, r1, #0
	lsls r0, r0, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _08002B00 @ =0x080A8CDC
	ldr r1, _08002B04 @ =0x080A8D3C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r3, [r1]
	ldr r1, [r0]
	adds r0, r3, #0
	bl unk_2b08
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08002B00: .4byte 0x080A8CDC
_08002B04: .4byte 0x080A8D3C

	thumb_func_start unk_2b08
unk_2b08: @ 0x08002B08
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldrb r0, [r4]
	cmp r0, #0
	bne _08002B20
	adds r0, r5, #0
	bl StopMusic
	b _08002B62
_08002B20:
	ldrb r1, [r5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08002B38
	ldrb r0, [r5, #3]
	ldrb r1, [r4, #2]
	cmp r0, r1
	bhi _08002B62
	adds r0, r5, #0
	bl StopMusic
_08002B38:
	adds r0, r5, #0
	adds r1, r4, #0
	bl unk_45a8
	cmp r6, #0
	beq _08002B62
	ldrb r1, [r5, #0x1c]
	cmp r1, #0
	bne _08002B62
	movs r0, #1
	strb r0, [r5, #0x1c]
	movs r0, #0x22
	strb r0, [r5]
	movs r4, #0
	strh r1, [r5, #6]
	ldr r0, _08002B68 @ =0x0000FFFF
	adds r1, r6, #0
	bl __divsi3
	strh r0, [r5, #8]
	strb r4, [r5, #0x1c]
_08002B62:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08002B68: .4byte 0x0000FFFF

	thumb_func_start unk_2b6c
unk_2b6c: @ 0x08002B6C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r5, [r4, #0x1c]
	cmp r5, #0
	bne _08002B98
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _08002B96
	movs r0, #0x22
	strb r0, [r4]
	strh r5, [r4, #6]
	ldr r0, _08002BA0 @ =0x0000FFFF
	adds r1, r2, #0
	bl __divsi3
	strh r0, [r4, #8]
_08002B96:
	strb r5, [r4, #0x1c]
_08002B98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08002BA0: .4byte 0x0000FFFF

	thumb_func_start unk_2ba4
unk_2ba4: @ 0x08002BA4
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r2, [r3, #0x18]
	ldrh r0, [r3, #6]
	ldrh r1, [r3, #8]
	adds r1, r0, r1
	ldr r0, _08002C0C @ =0x0000FFFF
	cmp r1, r0
	bgt _08002C14
	strh r1, [r3, #6]
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08002BEC
	ldrh r0, [r3, #0x26]
	ldrh r1, [r3, #0x24]
	adds r0, r0, r1
	strh r0, [r3, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1c
	cmp r0, #0
	beq _08002BE4
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r1, [r3, #0x24]
	ldr r0, _08002C10 @ =0x00000FFF
	ands r0, r1
	strh r0, [r3, #0x24]
_08002BE4:
	adds r1, r3, #0
	adds r1, #0x23
	movs r0, #0
	strb r0, [r1]
_08002BEC:
	ldrb r1, [r3, #1]
	cmp r1, #0
	ble _08002C32
	movs r4, #4
_08002BF4:
	ldrh r0, [r3, #6]
	lsrs r0, r0, #0xa
	strb r0, [r2, #5]
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	subs r1, #1
	adds r2, #0x50
	cmp r1, #0
	bgt _08002BF4
	b _08002C32
	.align 2, 0
_08002C0C: .4byte 0x0000FFFF
_08002C10: .4byte 0x00000FFF
_08002C14:
	ldrb r1, [r3, #1]
	cmp r1, #0
	ble _08002C2E
	movs r5, #0x40
	movs r4, #4
_08002C1E:
	strb r5, [r2, #5]
	ldrb r0, [r2]
	orrs r0, r4
	strb r0, [r2]
	subs r1, #1
	adds r2, #0x50
	cmp r1, #0
	bgt _08002C1E
_08002C2E:
	movs r0, #2
	strb r0, [r3]
_08002C32:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_2c38
unk_2c38: @ 0x08002C38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	ldr r0, _08002CC0 @ =gMusicInfo
	ldrb r1, [r0, #1]
	mov sl, r0
	cmp r1, #0
	bne _08002D48
	movs r4, #1
	strb r4, [r0, #1]
	ldr r3, _08002CC4 @ =0x080A8CDC
	ldr r2, _08002CC8 @ =0x080A8D3C
	lsls r0, r5, #3
	adds r0, r0, r2
	mov ip, r0
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r6, [r0]
	lsls r0, r7, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r5, [r0]
	ldrb r0, [r6, #0x1c]
	cmp r0, #0
	bne _08002D42
	ldrb r0, [r5, #0x1c]
	cmp r0, #0
	bne _08002D42
	strb r4, [r6, #0x1c]
	strb r4, [r5, #0x1c]
	ldrb r1, [r5]
	movs r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08002D38
	movs r0, #0xf8
	mov r8, r0
	ands r0, r1
	mov r8, r0
	cmp r0, #0
	bne _08002D38
	mov r1, ip
	ldr r7, [r1]
	ldrb r0, [r7]
	cmp r0, #0
	bne _08002CCC
	adds r0, r6, #0
	bl ResetTrack
	b _08002D38
	.align 2, 0
_08002CC0: .4byte gMusicInfo
_08002CC4: .4byte 0x080A8CDC
_08002CC8: .4byte 0x080A8D3C
_08002CCC:
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08002CE4
	ldrb r0, [r6, #3]
	ldrb r1, [r7, #2]
	cmp r0, r1
	bhi _08002D38
	adds r0, r6, #0
	bl ResetTrack
_08002CE4:
	ldrb r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _08002D58 @ =0x0000FFFF
	strh r0, [r5, #6]
	mov r1, sb
	bl __divsi3
	movs r4, #0
	strh r0, [r5, #8]
	mov r1, sl
	ldrb r0, [r1, #5]
	lsls r0, r0, #0xc
	mov r1, sb
	bl __divsi3
	strh r0, [r5, #0x26]
	mov r0, r8
	strh r0, [r5, #0x24]
	mov r1, sl
	ldrb r0, [r1, #5]
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r6, #0
	adds r1, r7, #0
	bl unk_45a8
	movs r0, #0x42
	strb r0, [r6]
	mov r0, r8
	strh r0, [r6, #6]
	ldrh r0, [r5, #8]
	strh r0, [r6, #8]
	ldrh r0, [r5, #0x26]
	strh r0, [r6, #0x26]
	mov r1, r8
	strh r1, [r6, #0x24]
	adds r0, r6, #0
	adds r0, #0x22
	strb r4, [r0]
_08002D38:
	movs r0, #0
	strb r0, [r6, #0x1c]
	strb r0, [r5, #0x1c]
	ldr r0, _08002D5C @ =gMusicInfo
	mov sl, r0
_08002D42:
	movs r0, #0
	mov r1, sl
	strb r0, [r1, #1]
_08002D48:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002D58: .4byte 0x0000FFFF
_08002D5C: .4byte gMusicInfo

	thumb_func_start unk_2d60
unk_2d60: @ 0x08002D60
	push {r4, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002D8A
	movs r0, #1
	strb r0, [r4, #0x1c]
	lsrs r1, r1, #0x18
	ldrh r0, [r4, #0xa]
	adds r2, r0, #0
	muls r2, r1, r2
	adds r0, r2, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #8
	movs r1, #0x96
	bl __divsi3
	movs r1, #0
	strh r0, [r4, #0xc]
	strb r1, [r4, #0x1c]
_08002D8A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_2d90
unk_2d90: @ 0x08002D90
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002DE4
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldrb r1, [r4]
	movs r0, #0xf8
	ands r0, r1
	cmp r0, #0
	bne _08002DE0
	ldr r3, [r4, #0x18]
	movs r0, #0xff
	lsls r0, r0, #2
	ands r0, r2
	lsrs r2, r0, #2
	ldrb r0, [r4, #1]
	subs r1, r0, #1
	cmp r1, #0
	blt _08002DE0
	movs r6, #1
	movs r5, #4
_08002DC6:
	adds r0, r7, #0
	asrs r0, r1
	ands r0, r6
	cmp r0, #0
	beq _08002DD8
	strb r2, [r3, #5]
	ldrb r0, [r3]
	orrs r0, r5
	strb r0, [r3]
_08002DD8:
	subs r1, #1
	adds r3, #0x50
	cmp r1, #0
	bge _08002DC6
_08002DE0:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002DE4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_2dec
unk_2dec: @ 0x08002DEC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002E3C
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldr r3, [r4, #0x18]
	ldrb r1, [r4, #1]
	cmp r1, #0
	ble _08002E38
	mov ip, r0
	lsls r0, r2, #0x10
	asrs r5, r0, #0x18
	movs r6, #8
_08002E1A:
	mov r0, sb
	asrs r0, r1
	mov r7, ip
	ands r0, r7
	cmp r0, #0
	beq _08002E30
	strb r5, [r3, #0x1d]
	strb r2, [r3, #0x1f]
	ldrb r0, [r3]
	orrs r0, r6
	strb r0, [r3]
_08002E30:
	subs r1, #1
	adds r3, #0x50
	cmp r1, #0
	bgt _08002E1A
_08002E38:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002E3C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_2e48
unk_2e48: @ 0x08002E48
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002E8C
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldr r3, [r4, #0x18]
	ldrb r1, [r4, #1]
	cmp r1, #0
	ble _08002E88
	movs r7, #1
	lsls r0, r2, #0x18
	asrs r2, r0, #0x19
	movs r5, #4
_08002E6E:
	adds r0, r6, #0
	asrs r0, r1
	ands r0, r7
	cmp r0, #0
	beq _08002E80
	strb r2, [r3, #7]
	ldrb r0, [r3]
	orrs r0, r5
	strb r0, [r3]
_08002E80:
	subs r1, #1
	adds r3, #0x50
	cmp r1, #0
	bgt _08002E6E
_08002E88:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002E8C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_2e94
unk_2e94: @ 0x08002E94
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002ED0
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldr r1, [r4, #0x18]
	movs r0, #0x7f
	ands r2, r0
	ldrb r3, [r4, #1]
	cmp r3, #0
	ble _08002ECC
	movs r5, #1
_08002EB8:
	adds r0, r6, #0
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	beq _08002EC4
	strb r2, [r1, #0x11]
_08002EC4:
	subs r3, #1
	adds r1, #0x50
	cmp r3, #0
	bgt _08002EB8
_08002ECC:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002ED0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_2ed8
unk_2ed8: @ 0x08002ED8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldrb r0, [r4, #0x1c]
	cmp r0, #0
	bne _08002F14
	movs r0, #1
	strb r0, [r4, #0x1c]
	ldr r1, [r4, #0x18]
	movs r0, #0x7f
	ands r2, r0
	ldrb r3, [r4, #1]
	cmp r3, #0
	ble _08002F10
	movs r5, #1
_08002EFC:
	adds r0, r6, #0
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	beq _08002F08
	strb r2, [r1, #0x10]
_08002F08:
	subs r3, #1
	adds r1, #0x50
	cmp r3, #0
	bgt _08002EFC
_08002F10:
	movs r0, #0
	strb r0, [r4, #0x1c]
_08002F14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DmaTransfer
DmaTransfer: @ 0x08002F1C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r7, _08002F4C @ =0x040000B0
	adds r2, r0, r7
	cmp r1, #0x20
	bne _08002F50
	movs r0, #0x80
	lsls r0, r0, #0x13
	b _08002F52
	.align 2, 0
_08002F4C: .4byte 0x040000B0
_08002F50:
	movs r0, #0
_08002F52:
	str r0, [sp]
	lsls r0, r4, #1
	movs r7, #0x80
	lsls r7, r7, #4
	mov ip, r7
	lsrs r1, r1, #4
	mov sl, r1
	asrs r7, r1
	movs r1, #0x80
	lsls r1, r1, #0x18
	mov r8, r1
	orrs r7, r1
	adds r0, r0, r4
	lsls r0, r0, #2
	mov sb, r0
_08002F70:
	cmp r3, ip
	bls _08002FAC
	str r5, [r2]
	str r6, [r2, #4]
	ldr r0, [sp]
	orrs r0, r7
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08002FA4 @ =0x040000B0
	add r1, sb
	ldr r0, [r1, #8]
	mov r4, r8
	ands r0, r4
	cmp r0, #0
	beq _08002F9A
	movs r4, #0x80
	lsls r4, r4, #0x18
_08002F92:
	ldr r0, [r1, #8]
	ands r0, r4
	cmp r0, #0
	bne _08002F92
_08002F9A:
	ldr r0, _08002FA8 @ =0xFFFFF800
	adds r3, r3, r0
	add r5, ip
	add r6, ip
	b _08002F70
	.align 2, 0
_08002FA4: .4byte 0x040000B0
_08002FA8: .4byte 0xFFFFF800
_08002FAC:
	str r5, [r2]
	str r6, [r2, #4]
	mov r1, sl
	lsrs r3, r1
	mov r4, r8
	orrs r3, r4
	ldr r0, [sp]
	orrs r0, r3
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08002FE8 @ =0x040000B0
	add r1, sb
	ldr r0, [r1, #8]
	ands r0, r4
	cmp r0, #0
	beq _08002FD8
	movs r2, #0x80
	lsls r2, r2, #0x18
_08002FD0:
	ldr r0, [r1, #8]
	ands r0, r2
	cmp r0, #0
	bne _08002FD0
_08002FD8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002FE8: .4byte 0x040000B0

	thumb_func_start BitFill
BitFill: @ 0x08002FEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp, #4]
	adds r6, r2, #0
	ldr r1, [sp, #0x28]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r5, _0800301C @ =0x040000B0
	adds r2, r0, r5
	cmp r1, #0x20
	bne _08003020
	movs r0, #0x80
	lsls r0, r0, #0x13
	b _08003022
	.align 2, 0
_0800301C: .4byte 0x040000B0
_08003020:
	movs r0, #0
_08003022:
	str r0, [sp]
	lsls r0, r4, #1
	movs r5, #0x80
	lsls r5, r5, #4
	mov sb, r5
	add r7, sp, #4
	lsrs r1, r1, #4
	mov r8, r1
	asrs r5, r1
	movs r1, #0x81
	lsls r1, r1, #0x18
	orrs r5, r1
	adds r0, r0, r4
	lsls r0, r0, #2
	mov ip, r0
	ldr r4, _08003060 @ =0x040000B0
	mov sl, r4
_08003044:
	cmp r3, sb
	bls _08003078
	str r7, [r2]
	str r6, [r2, #4]
	ldr r0, [sp]
	orrs r0, r5
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r1, ip
	add r1, sl
	ldr r0, [r1, #8]
	movs r4, #0x80
	lsls r4, r4, #0x18
	b _08003066
	.align 2, 0
_08003060: .4byte 0x040000B0
_08003064:
	ldr r0, [r1, #8]
_08003066:
	ands r0, r4
	cmp r0, #0
	bne _08003064
	ldr r0, _08003074 @ =0xFFFFF800
	adds r3, r3, r0
	add r6, sb
	b _08003044
	.align 2, 0
_08003074: .4byte 0xFFFFF800
_08003078:
	str r7, [r2]
	str r6, [r2, #4]
	mov r1, r8
	lsrs r3, r1
	movs r4, #0x81
	lsls r4, r4, #0x18
	orrs r3, r4
	ldr r0, [sp]
	orrs r0, r3
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r1, ip
	add r1, sl
	ldr r0, [r1, #8]
	movs r5, #0x80
	lsls r5, r5, #0x18
	ands r0, r5
	cmp r0, #0
	beq _080030A8
	adds r2, r5, #0
_080030A0:
	ldr r0, [r1, #8]
	ands r0, r2
	cmp r0, #0
	bne _080030A0
_080030A8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DMA2InterruptCode
DMA2InterruptCode: @ 0x080030B8
	push {r4, lr}
	ldr r3, _08003100 @ =gMusicInfo
	ldrb r0, [r3, #0x10]
	adds r0, #1
	strb r0, [r3, #0x10]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r3, #0xe]
	cmp r0, r1
	bne _080030F8
	ldr r0, _08003104 @ =0x040000C4
	ldr r1, _08003108 @ =0x84400004
	str r1, [r0]
	adds r0, #0xc
	str r1, [r0]
	ldr r2, _0800310C @ =0x040000C6
	movs r4, #0xa0
	lsls r4, r4, #3
	adds r0, r4, #0
	strh r0, [r2]
	ldr r1, _08003110 @ =0x040000D2
	strh r0, [r1]
	movs r4, #0xb6
	lsls r4, r4, #8
	adds r0, r4, #0
	strh r0, [r2]
	movs r2, #0xf6
	lsls r2, r2, #8
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0
	strb r0, [r3, #0x10]
_080030F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08003100: .4byte gMusicInfo
_08003104: .4byte 0x040000C4
_08003108: .4byte 0x84400004
_0800310C: .4byte 0x040000C6
_08003110: .4byte 0x040000D2

	thumb_func_start unk_3114
unk_3114: @ 0x08003114
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _08003178 @ =gMusicInfo
	ldrb r4, [r5, #1]
	cmp r4, #0
	bne _08003170
	movs r0, #1
	strb r0, [r5, #1]
	ldr r0, _0800317C @ =0x04000064
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #5
	movs r2, #8
	strb r2, [r0]
	adds r0, #3
	strh r1, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r0, #9
	strb r2, [r0]
	adds r0, #3
	strh r1, [r0]
	adds r0, #0x48
	ldr r1, _08003180 @ =0x84400004
	str r1, [r0]
	adds r0, #0xc
	str r1, [r0]
	subs r0, #0xa
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	str r4, [sp]
	ldr r0, _08003184 @ =0x00000C24
	adds r1, r5, r0
	ldr r2, _08003188 @ =0x05000300
	mov r0, sp
	bl CpuSet
	ldr r0, _0800318C @ =0x04000084
	strb r4, [r0]
	strb r4, [r5, #1]
_08003170:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003178: .4byte gMusicInfo
_0800317C: .4byte 0x04000064
_08003180: .4byte 0x84400004
_08003184: .4byte 0x00000C24
_08003188: .4byte 0x05000300
_0800318C: .4byte 0x04000084

	thumb_func_start unk_3190
unk_3190: @ 0x08003190
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r1, sp
	adds r1, #3
	movs r0, #0
	strb r0, [r1]
	cmp r2, #0
	bne _080031B2
	add r0, sp, #4
	strb r2, [r0]
	b _080031BA
_080031B2:
	add r1, sp, #4
	movs r0, #2
	strb r0, [r1]
	adds r0, r1, #0
_080031BA:
	mov r3, sp
	adds r3, #1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r2, [r3]
	ldr r1, _080031F8 @ =0x00000008
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r4, r1, #0
	cmp r2, r0
	bls _080031D2
	b _0800331C
_080031D2:
	ldrb r0, [r3]
	movs r1, #0x4d
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _080031E2
	b _08003304
_080031E2:
	ldrb r0, [r3]
	cmp r0, #0
	bne _08003210
	ldr r0, _080031FC @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003204
	ldr r0, _08003200 @ =0x080A8CDC
	ldr r6, [r0, #0xc]
	b _0800321E
	.align 2, 0
_080031F8: .4byte 0x00000008
_080031FC: .4byte gMusicInfo
_08003200: .4byte 0x080A8CDC
_08003204:
	ldr r1, _0800320C @ =0x080A8CDC
	ldr r6, [r1]
	b _0800321E
	.align 2, 0
_0800320C: .4byte 0x080A8CDC
_08003210:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r2, _0800332C @ =0x080A8CDC
	adds r0, r0, r2
	ldr r6, [r0]
_0800321E:
	ldrb r0, [r6, #0x1c]
	cmp r0, #0
	bne _08003304
	ldrb r0, [r6, #0x1c]
	movs r4, #1
	strb r4, [r6, #0x1c]
	ldrb r0, [r6, #0x1e]
	adds r2, r4, #0
	ands r2, r0
	cmp r2, #0
	bne _080032FC
	ldrb r1, [r6]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080032FC
	mov r1, sp
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _08003252
	ldrb r1, [r6, #0x1e]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080032FC
_08003252:
	ldrb r0, [r6, #0x1e]
	strb r4, [r6, #0x1e]
	mov r0, sp
	strb r2, [r0]
	ldr r4, [r6, #0x18]
	ldrb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r1, r0
	bhs _080032FC
	movs r2, #2
	add r2, sp
	mov sb, r2
	mov r8, sp
_0800326C:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xc0
	ands r0, r1
	movs r1, #0x50
	adds r1, r1, r4
	mov sl, r1
	cmp r0, #0
	bne _080032EA
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _0800329A
	ldrb r1, [r2]
	movs r0, #7
	ands r0, r1
	subs r0, #1
	mov r2, sb
	strb r0, [r2]
	ldr r0, [r4, #0x4c]
	ldrb r1, [r2]
	bl ClearRegistersForPSG
_0800329A:
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _080032EA
	ldr r4, [r4, #0x48]
	cmp r4, #0
	beq _080032EA
	ldr r3, _08003330 @ =0x03003504
	mov r5, sp
	adds r5, #3
	movs r7, #0
_080032AE:
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	str r4, [r0]
	ldrb r1, [r5]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, #4
	adds r1, r4, #0
	movs r2, #0x34
	str r3, [sp, #8]
	bl memcpy
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldrb r0, [r4]
	strb r7, [r4]
	str r7, [r4, #0x28]
	ldr r0, [r4, #0x30]
	str r7, [r4, #0x30]
	str r7, [r4, #0x2c]
	adds r4, r0, #0
	ldr r3, [sp, #8]
	cmp r4, #0
	bne _080032AE
_080032EA:
	mov r1, r8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r4, sl
	ldrb r1, [r1]
	ldrb r0, [r6, #1]
	cmp r1, r0
	blo _0800326C
_080032FC:
	ldrb r0, [r6, #0x1c]
	movs r0, #0
	strb r0, [r6, #0x1c]
	ldr r4, _08003334 @ =0x00000008
_08003304:
	mov r2, sp
	ldrb r0, [r2, #1]
	adds r0, #1
	strb r0, [r2, #1]
	mov r3, sp
	adds r3, #1
	ldrb r1, [r3]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _0800331C
	b _080031D2
_0800331C:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800332C: .4byte 0x080A8CDC
_08003330: .4byte 0x03003504
_08003334: .4byte 0x00000008

	thumb_func_start unk_3338
unk_3338: @ 0x08003338
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r1, sp
	adds r1, #3
	movs r0, #0
	strb r0, [r1]
	cmp r2, #0
	bne _0800335A
	add r0, sp, #4
	strb r2, [r0]
	b _08003362
_0800335A:
	add r1, sp, #4
	movs r0, #2
	strb r0, [r1]
	adds r0, r1, #0
_08003362:
	mov r3, sp
	adds r3, #1
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r2, [r3]
	ldr r1, _080033A4 @ =0x00000008
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	adds r4, r1, #0
	cmp r2, r0
	bls _0800337A
	b _0800347A
_0800337A:
	ldr r0, _080033A8 @ =0x080A8CDC
	mov sl, r0
_0800337E:
	ldrb r0, [r3]
	movs r1, #0x4d
	asrs r1, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08003464
	ldrb r0, [r3]
	cmp r0, #0
	bne _080033B4
	ldr r0, _080033AC @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080033B0
	mov r1, sl
	ldr r6, [r1, #0xc]
	b _080033C0
	.align 2, 0
_080033A4: .4byte 0x00000008
_080033A8: .4byte 0x080A8CDC
_080033AC: .4byte gMusicInfo
_080033B0:
	mov r0, sl
	b _080033BE
_080033B4:
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
_080033BE:
	ldr r6, [r0]
_080033C0:
	ldrb r0, [r6, #0x1c]
	adds r2, r0, #0
	cmp r2, #0
	bne _08003464
	ldrb r0, [r6, #0x1c]
	movs r3, #0
	movs r0, #1
	strb r0, [r6, #0x1c]
	ldrb r1, [r6, #0x1e]
	ands r0, r1
	cmp r0, #0
	beq _0800345C
	ldrb r1, [r6, #0x1e]
	movs r0, #0xfe
	ands r0, r1
	ldrb r1, [r6, #0x1e]
	strb r0, [r6, #0x1e]
	ldrb r1, [r6, #0x1e]
	movs r0, #2
	orrs r1, r0
	ldrb r0, [r6, #0x1e]
	orrs r1, r3
	strb r1, [r6, #0x1e]
	mov r0, sp
	strb r2, [r0]
	ldr r2, [r6, #0x18]
	ldrb r1, [r0]
	ldrb r0, [r6, #1]
	cmp r1, r0
	bhs _0800345C
	mov r7, sp
_080033FE:
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0xc0
	ands r0, r1
	movs r1, #0x50
	adds r1, r1, r2
	mov r8, r1
	cmp r0, #0
	bne _0800344C
	ldr r0, [r2, #0x48]
	cmp r0, #0
	beq _0800344C
	ldr r4, [r2, #0x48]
	cmp r4, #0
	beq _0800344C
	ldr r0, _0800348C @ =0x03003504
	mov sb, r0
	mov r5, sp
	adds r5, #3
_08003426:
	adds r0, r4, #0
	bl unk_1e14
	ldrb r0, [r5]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	add r1, sb
	adds r1, #4
	adds r0, r4, #0
	movs r2, #0x34
	bl memcpy
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r4, [r4, #0x30]
	cmp r4, #0
	bne _08003426
_0800344C:
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
	mov r2, r8
	ldrb r1, [r7]
	ldrb r0, [r6, #1]
	cmp r1, r0
	blo _080033FE
_0800345C:
	ldrb r0, [r6, #0x1c]
	movs r0, #0
	strb r0, [r6, #0x1c]
	ldr r4, _08003490 @ =0x00000008
_08003464:
	mov r1, sp
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	mov r3, sp
	adds r3, #1
	ldrb r1, [r3]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bls _0800337E
_0800347A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800348C: .4byte 0x03003504
_08003490: .4byte 0x00000008

	thumb_func_start Music_Empty2
Music_Empty2: @ 0x08003494
	bx lr
	.align 2, 0

	thumb_func_start CheckSetNewMusicTrack
CheckSetNewMusicTrack: @ 0x08003498
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r5, _080034E4 @ =gMusicInfo
	adds r0, r5, #0
	adds r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	bne _080034DC
	cmp r4, #0xc
	beq _080034DC
	ldrb r6, [r5, #1]
	cmp r6, #0
	bne _080034DC
	movs r0, #1
	strb r0, [r5, #1]
	ldr r0, _080034E8 @ =0x080A8CDC
	ldr r2, [r0]
	cmp r4, #0
	bne _080034C2
	ldr r4, _080034EC @ =0x000001F7
_080034C2:
	ldr r1, _080034F0 @ =0x080A8D3C
	lsls r0, r4, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, [r2, #0x10]
	cmp r1, r0
	beq _080034DA
	adds r0, r2, #0
	movs r1, #0x1e
	bl ApplyMusicSoundFading
	strh r4, [r5, #0x22]
_080034DA:
	strb r6, [r5, #1]
_080034DC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080034E4: .4byte gMusicInfo
_080034E8: .4byte 0x080A8CDC
_080034EC: .4byte 0x000001F7
_080034F0: .4byte 0x080A8D3C

	thumb_func_start CheckPlayNewMusicTrack
CheckPlayNewMusicTrack: @ 0x080034F4
	push {r4, r5, lr}
	ldr r4, _0800352C @ =gMusicInfo
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r5, [r0]
	cmp r5, #0
	bne _08003526
	ldrh r0, [r4, #0x22]
	cmp r0, #0
	beq _08003526
	ldr r0, _08003530 @ =0x080A8CDC
	ldr r0, [r0]
	ldr r2, _08003534 @ =0x080A8D3C
	ldrh r1, [r4, #0x22]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r1, [r1]
	bl unk_45a8
	adds r0, r4, #0
	adds r0, #0x20
	strb r5, [r0]
	ldrh r0, [r4, #0x22]
	strh r0, [r4, #0x1c]
	strh r5, [r4, #0x22]
_08003526:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800352C: .4byte gMusicInfo
_08003530: .4byte 0x080A8CDC
_08003534: .4byte 0x080A8D3C

	thumb_func_start PlayMusic
PlayMusic: @ 0x08003538
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r2, _08003594 @ =gMusicInfo
	ldrb r0, [r2, #1]
	cmp r0, #0
	beq _0800354C
	b _080036B0
_0800354C:
	movs r0, #1
	strb r0, [r2, #1]
	adds r0, r2, #0
	adds r0, #0x21
	strb r3, [r0]
	ldr r0, _08003598 @ =0x080A8D3C
	lsls r1, r5, #3
	adds r0, r1, r0
	ldr r6, [r0]
	adds r7, r1, #0
	cmp r3, #0
	beq _08003630
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080035A0
	ldr r3, _0800359C @ =0x080A8CDC
	ldrh r2, [r2, #0x1c]
	cmp r5, r2
	bne _08003584
	ldr r0, [r3]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08003584
	b _080036AA
_08003584:
	ldr r0, [r3, #0xc]
	ldrb r1, [r0, #0x1e]
	movs r0, #2
	ands r0, r1
	movs r1, #1
	cmp r0, #0
	beq _080035C4
	b _080035C8
	.align 2, 0
_08003594: .4byte gMusicInfo
_08003598: .4byte 0x080A8D3C
_0800359C: .4byte 0x080A8CDC
_080035A0:
	ldr r3, _080035EC @ =0x080A8CDC
	ldrh r2, [r2, #0x1e]
	cmp r5, r2
	bne _080035B4
	ldr r0, [r3, #0xc]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080036AA
_080035B4:
	ldr r0, [r3]
	ldrb r1, [r0, #0x1e]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
_080035C4:
	cmp r1, #0
	bne _080035F4
_080035C8:
	ldr r4, [r3]
	ldr r3, [r3, #0xc]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _080035DC
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _080036AA
_080035DC:
	ldr r2, _080035F0 @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	strh r5, [r2, #0x1c]
	b _08003614
	.align 2, 0
_080035EC: .4byte 0x080A8CDC
_080035F0: .4byte gMusicInfo
_080035F4:
	ldr r4, [r3, #0xc]
	ldr r3, [r3]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003608
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _080036AA
_08003608:
	ldr r2, _0800362C @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	strh r5, [r2, #0x1e]
_08003614:
	ldrb r0, [r3]
	cmp r0, #1
	bls _0800369C
	ldrb r1, [r3, #0x1e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800369C
	adds r0, r3, #0
	bl StopMusic
	b _0800369C
	.align 2, 0
_0800362C: .4byte gMusicInfo
_08003630:
	ldrh r2, [r2, #0x1c]
	cmp r5, r2
	bne _0800365E
	ldr r0, _08003650 @ =0x080A8CDC
	ldr r2, [r0]
	ldrb r1, [r2, #0x1e]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08003654
	adds r0, r2, #0
	bl StopMusic
	b _0800365E
	.align 2, 0
_08003650: .4byte 0x080A8CDC
_08003654:
	ldrb r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080036AA
_0800365E:
	ldr r0, _080036B8 @ =0x080A8CDC
	ldr r4, [r0]
	ldr r3, [r0, #0xc]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003674
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _080036AA
_08003674:
	ldrb r0, [r3]
	cmp r0, #1
	bls _0800368A
	ldrb r1, [r3, #0x1e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800368A
	adds r0, r3, #0
	bl StopMusic
_0800368A:
	ldr r0, _080036BC @ =0x080A8D3C
	adds r0, r7, r0
	ldr r6, [r0]
	ldr r2, _080036C0 @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	strh r5, [r2, #0x1c]
_0800369C:
	ldr r1, _080036C0 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	bl unk_45a8
_080036AA:
	ldr r1, _080036C0 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
_080036B0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080036B8: .4byte 0x080A8CDC
_080036BC: .4byte 0x080A8D3C
_080036C0: .4byte gMusicInfo

	thumb_func_start unk_36c4
unk_36c4: @ 0x080036C4
	push {lr}
	ldr r0, _080036D8 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080036E0
	ldr r0, _080036DC @ =0x080A8CDC
	ldr r0, [r0]
	b _080036E4
	.align 2, 0
_080036D8: .4byte gMusicInfo
_080036DC: .4byte 0x080A8CDC
_080036E0:
	ldr r0, _080036EC @ =0x080A8CDC
	ldr r0, [r0, #0xc]
_080036E4:
	bl StopMusic
	pop {r0}
	bx r0
	.align 2, 0
_080036EC: .4byte 0x080A8CDC

	thumb_func_start FadeMusic
FadeMusic: @ 0x080036F0
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08003708 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003710
	ldr r0, _0800370C @ =0x080A8CDC
	ldr r0, [r0]
	b _08003714
	.align 2, 0
_08003708: .4byte gMusicInfo
_0800370C: .4byte 0x080A8CDC
_08003710:
	ldr r0, _08003720 @ =0x080A8CDC
	ldr r0, [r0, #0xc]
_08003714:
	cmp r1, #0
	beq _08003724
	bl ApplyMusicSoundFading
	b _08003728
	.align 2, 0
_08003720: .4byte 0x080A8CDC
_08003724:
	bl StopMusic
_08003728:
	pop {r0}
	bx r0

	thumb_func_start unk_372c
unk_372c: @ 0x0800372C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	cmp r3, #0
	bne _08003748
	adds r0, r1, #0
	adds r1, r2, #0
	bl PlayMusic
	b _0800376E
_08003748:
	ldr r0, _08003758 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003760
	ldr r0, _0800375C @ =0x080A8CDC
	ldr r0, [r0]
	b _08003764
	.align 2, 0
_08003758: .4byte gMusicInfo
_0800375C: .4byte 0x080A8CDC
_08003760:
	ldr r0, _08003774 @ =0x080A8CDC
	ldr r0, [r0, #0xc]
_08003764:
	strh r1, [r0, #0x20]
	strb r2, [r0, #0x1f]
	adds r1, r3, #0
	bl ApplyMusicSoundFading
_0800376E:
	pop {r0}
	bx r0
	.align 2, 0
_08003774: .4byte 0x080A8CDC

	thumb_func_start unk_3778
unk_3778: @ 0x08003778
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _080037D4 @ =gMusicInfo
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _08003790
	b _0800389C
_08003790:
	movs r0, #1
	strb r0, [r3, #1]
	adds r0, r3, #0
	adds r0, #0x21
	strb r2, [r0]
	ldr r1, _080037D8 @ =0x080A8D3C
	lsls r0, r5, #3
	adds r0, r0, r1
	ldr r6, [r0]
	cmp r2, #0
	beq _0800380C
	adds r0, r3, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _080037E0
	ldr r2, _080037DC @ =0x080A8CDC
	ldrh r3, [r3, #0x1c]
	cmp r5, r3
	bne _080037C4
	ldr r0, [r2]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08003896
_080037C4:
	ldr r0, [r2, #0xc]
	ldrb r1, [r0, #0x1e]
	movs r0, #2
	ands r0, r1
	movs r1, #1
	cmp r0, #0
	beq _08003822
	b _08003826
	.align 2, 0
_080037D4: .4byte gMusicInfo
_080037D8: .4byte 0x080A8D3C
_080037DC: .4byte 0x080A8CDC
_080037E0:
	ldr r2, _08003808 @ =0x080A8CDC
	ldrh r3, [r3, #0x1e]
	cmp r5, r3
	bne _080037F4
	ldr r0, [r2, #0xc]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08003896
_080037F4:
	ldr r0, [r2]
	ldrb r1, [r0, #0x1e]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r1, r0, #0x1f
	b _08003822
	.align 2, 0
_08003808: .4byte 0x080A8CDC
_0800380C:
	ldr r2, _08003848 @ =0x080A8CDC
	ldrh r3, [r3, #0x1c]
	cmp r5, r3
	bne _08003820
	ldr r0, [r2]
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08003896
_08003820:
	movs r1, #0
_08003822:
	cmp r1, #0
	bne _08003850
_08003826:
	ldr r4, [r2]
	ldr r3, [r2, #0xc]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _0800383A
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _08003896
_0800383A:
	ldr r2, _0800384C @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	strh r5, [r2, #0x1c]
	b _08003870
	.align 2, 0
_08003848: .4byte 0x080A8CDC
_0800384C: .4byte gMusicInfo
_08003850:
	ldr r4, [r2, #0xc]
	ldr r3, [r2]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003864
	ldr r0, [r4, #0x10]
	cmp r6, r0
	beq _08003896
_08003864:
	ldr r2, _080038A4 @ =gMusicInfo
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #1
	strb r0, [r1]
	strh r5, [r2, #0x1e]
_08003870:
	ldrb r0, [r3]
	cmp r0, #1
	bls _08003886
	ldrb r1, [r3, #0x1e]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08003886
	adds r0, r3, #0
	bl StopMusic
_08003886:
	ldr r1, _080038A4 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl unk_2b08
_08003896:
	ldr r1, _080038A4 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
_0800389C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080038A4: .4byte gMusicInfo

	thumb_func_start unk_38a8
unk_38a8: @ 0x080038A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	str r6, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	ldr r5, _08003908 @ =gMusicInfo
	ldrb r7, [r5, #1]
	cmp r7, #0
	bne _080039B2
	movs r0, #1
	mov sb, r0
	mov r1, sb
	strb r1, [r5, #1]
	ldr r1, _0800390C @ =0x080A8D3C
	lsls r0, r6, #3
	adds r0, r0, r1
	ldr r0, [r0]
	mov sl, r0
	mov r0, r8
	cmp r0, #0
	bne _080038EA
	movs r0, #1
	bl unk_3190
	bl unk_27a8
_080038EA:
	mov r1, r8
	cmp r1, #2
	bne _08003928
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #0
	bne _08003914
	ldr r0, _08003910 @ =0x080A8CDC
	ldr r4, [r0]
	adds r3, r4, #0
	strb r7, [r1]
	strh r6, [r5, #0x1c]
	b _0800398C
	.align 2, 0
_08003908: .4byte gMusicInfo
_0800390C: .4byte 0x080A8D3C
_08003910: .4byte 0x080A8CDC
_08003914:
	ldr r0, _08003924 @ =0x080A8CDC
	ldr r4, [r0, #0xc]
	adds r3, r4, #0
	mov r0, sb
	strb r0, [r1]
	strh r6, [r5, #0x1e]
	b _0800398C
	.align 2, 0
_08003924: .4byte 0x080A8CDC
_08003928:
	adds r2, r5, #0
	adds r2, #0x20
	ldrb r0, [r2]
	cmp r0, #0
	bne _0800395C
	ldr r0, _08003958 @ =0x080A8CDC
	ldr r4, [r0, #0xc]
	ldr r3, [r0]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003948
	ldr r0, [r4, #0x10]
	cmp sl, r0
	beq _080039AC
_08003948:
	mov r1, sb
	strb r1, [r2]
	mov r0, r8
	cmp r0, #0
	beq _08003980
	strh r6, [r5, #0x1e]
	b _08003980
	.align 2, 0
_08003958: .4byte 0x080A8CDC
_0800395C:
	ldr r0, _080039C4 @ =0x080A8CDC
	ldr r4, [r0]
	ldr r3, [r0, #0xc]
	ldrb r1, [r4]
	movs r0, #0x1a
	ands r0, r1
	cmp r0, #2
	bne _08003972
	ldr r0, [r4, #0x10]
	cmp sl, r0
	beq _080039AC
_08003972:
	strb r7, [r2]
	mov r1, r8
	cmp r1, #0
	beq _08003980
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5, #0x1c]
_08003980:
	adds r2, r4, #0
	adds r2, #0x28
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
_0800398C:
	mov r1, r8
	cmp r1, #0
	beq _0800399E
	ldrb r0, [r3]
	cmp r0, #1
	bls _0800399E
	adds r0, r3, #0
	bl StopMusic
_0800399E:
	ldr r1, _080039C8 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
	adds r0, r4, #0
	mov r1, sl
	bl unk_45a8
_080039AC:
	ldr r1, _080039C8 @ =gMusicInfo
	movs r0, #0
	strb r0, [r1, #1]
_080039B2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080039C4: .4byte 0x080A8CDC
_080039C8: .4byte gMusicInfo

	thumb_func_start unk_39cc
unk_39cc: @ 0x080039CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _080039FC @ =gMusicInfo
	ldrb r5, [r4, #1]
	cmp r5, #0
	bne _08003A6C
	movs r6, #1
	strb r6, [r4, #1]
	movs r0, #1
	bl unk_3338
	adds r2, r4, #0
	adds r2, #0x20
	ldrb r0, [r2]
	cmp r0, #0
	bne _08003A04
	ldr r0, _08003A00 @ =0x080A8CDC
	ldr r7, [r0, #0xc]
	ldr r1, [r0]
	strb r6, [r2]
	ldrh r4, [r4, #0x1e]
	b _08003A0E
	.align 2, 0
_080039FC: .4byte gMusicInfo
_08003A00: .4byte 0x080A8CDC
_08003A04:
	ldr r0, _08003A78 @ =0x080A8CDC
	ldr r7, [r0]
	ldr r1, [r0, #0xc]
	strb r5, [r2]
	ldrh r4, [r4, #0x1c]
_08003A0E:
	ldrb r0, [r1]
	cmp r0, #1
	bls _08003A1A
	adds r0, r1, #0
	bl StopMusic
_08003A1A:
	ldr r1, _08003A7C @ =0x080A8D3C
	lsls r0, r4, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r6, _08003A80 @ =gMusicInfo
	movs r0, #0
	mov r8, r0
	mov r0, r8
	strb r0, [r6, #1]
	adds r0, r7, #0
	bl unk_45a8
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _08003A3C
	bl SoundPlay
_08003A3C:
	ldrb r1, [r6, #0xb]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08003A68
	ldr r4, _08003A78 @ =0x080A8CDC
	ldr r0, [r4]
	ldr r5, _08003A84 @ =0x0000FFFF
	adds r1, r5, #0
	movs r2, #0x48
	bl unk_2d90
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	movs r2, #0x48
	bl unk_2d90
	ldr r0, [r4, #0x54]
	adds r1, r5, #0
	movs r2, #0x48
	bl unk_2d90
_08003A68:
	mov r0, r8
	strb r0, [r6, #1]
_08003A6C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08003A78: .4byte 0x080A8CDC
_08003A7C: .4byte 0x080A8D3C
_08003A80: .4byte gMusicInfo
_08003A84: .4byte 0x0000FFFF

	thumb_func_start unk_3a88
unk_3a88: @ 0x08003A88
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08003AA0 @ =gMusicInfo
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003AA8
	ldr r0, _08003AA4 @ =0x080A8CDC
	ldr r0, [r0]
	b _08003AAC
	.align 2, 0
_08003AA0: .4byte gMusicInfo
_08003AA4: .4byte 0x080A8CDC
_08003AA8:
	ldr r0, _08003AB8 @ =0x080A8CDC
	ldr r0, [r0, #0xc]
_08003AAC:
	cmp r1, #0
	beq _08003ABC
	bl ApplyMusicSoundFading
	b _08003AC0
	.align 2, 0
_08003AB8: .4byte 0x080A8CDC
_08003ABC:
	bl StopMusic
_08003AC0:
	pop {r0}
	bx r0

	thumb_func_start unk_3ac4
unk_3ac4: @ 0x08003AC4
	push {r4, r5, lr}
	ldr r0, _08003AE8 @ =gMusicInfo
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #0
	bne _08003B0C
	movs r4, #1
	strb r4, [r5, #1]
	adds r2, r5, #0
	adds r2, #0x20
	ldrb r1, [r2]
	cmp r1, #0
	bne _08003AF0
	ldr r0, _08003AEC @ =0x080A8CDC
	ldr r3, [r0]
	strb r1, [r2]
	ldrh r0, [r5, #0x1c]
	b _08003AF8
	.align 2, 0
_08003AE8: .4byte gMusicInfo
_08003AEC: .4byte 0x080A8CDC
_08003AF0:
	ldr r0, _08003B14 @ =0x080A8CDC
	ldr r3, [r0, #0xc]
	strb r4, [r2]
	ldrh r0, [r5, #0x1e]
_08003AF8:
	ldr r1, _08003B18 @ =0x080A8D3C
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0]
	movs r4, #0
	strb r4, [r5, #1]
	adds r0, r3, #0
	bl unk_45a8
	strb r4, [r5, #1]
_08003B0C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003B14: .4byte 0x080A8CDC
_08003B18: .4byte 0x080A8D3C

	thumb_func_start unk_3b1c
unk_3b1c: @ 0x08003B1C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, _08003B40 @ =gMusicInfo
	ldrb r1, [r0, #1]
	adds r6, r0, #0
	cmp r1, #0
	bne _08003B68
	movs r0, #1
	strb r0, [r6, #1]
	adds r0, r6, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003B48
	ldr r0, _08003B44 @ =0x080A8CDC
	ldr r5, [r0, #0xc]
	b _08003B4C
	.align 2, 0
_08003B40: .4byte gMusicInfo
_08003B44: .4byte 0x080A8CDC
_08003B48:
	ldr r0, _08003B70 @ =0x080A8CDC
	ldr r5, [r0]
_08003B4C:
	ldr r1, _08003B74 @ =0x080A8D3C
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	movs r4, #0
	strb r4, [r6, #1]
	adds r0, r5, #0
	bl unk_45a8
	ldrb r1, [r5, #0x1e]
	movs r0, #2
	orrs r0, r1
	strb r0, [r5, #0x1e]
	strb r4, [r6, #1]
_08003B68:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003B70: .4byte 0x080A8CDC
_08003B74: .4byte 0x080A8D3C

	thumb_func_start unk_3b78
unk_3b78: @ 0x08003B78
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _08003B9C @ =gMusicInfo
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #0
	bne _08003BC6
	movs r0, #1
	strb r0, [r5, #1]
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003BA4
	ldr r0, _08003BA0 @ =0x080A8CDC
	ldr r2, [r0, #0xc]
	b _08003BA8
	.align 2, 0
_08003B9C: .4byte gMusicInfo
_08003BA0: .4byte 0x080A8CDC
_08003BA4:
	ldr r0, _08003BCC @ =0x080A8CDC
	ldr r2, [r0]
_08003BA8:
	adds r1, r0, #0
	ldrb r0, [r2]
	cmp r0, #2
	bne _08003BB2
	ldr r2, [r1, #0x3c]
_08003BB2:
	ldr r1, _08003BD0 @ =0x080A8D3C
	lsls r0, r3, #3
	adds r0, r0, r1
	ldr r1, [r0]
	movs r4, #0
	strb r4, [r5, #1]
	adds r0, r2, #0
	bl unk_45a8
	strb r4, [r5, #1]
_08003BC6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003BCC: .4byte 0x080A8CDC
_08003BD0: .4byte 0x080A8D3C

	thumb_func_start unk_3bd4
unk_3bd4: @ 0x08003BD4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r2, #0x63
	bhi _08003BF2
	cmp r1, #0
	bne _08003C10
	adds r0, r2, #0
	movs r1, #1
	bl PlayMusic
	b _08003C10
_08003BF2:
	cmp r1, #0
	bne _08003C10
	adds r0, r2, #0
	subs r0, #0xaa
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #9
	bhi _08003C0A
	adds r0, r2, #0
	bl unk_3b1c
	b _08003C10
_08003C0A:
	adds r0, r3, #0
	bl SoundPlay
_08003C10:
	pop {r0}
	bx r0

	thumb_func_start unk_3c14
unk_3c14: @ 0x08003C14
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, #0x63
	bhi _08003C2C
	cmp r1, #0
	bne _08003C30
	bl unk_36c4
	b _08003C30
_08003C2C:
	bl StopSound
_08003C30:
	pop {r0}
	bx r0

	thumb_func_start DecreaseMusicVolume
DecreaseMusicVolume: @ 0x08003C34
	push {r4, r5, r6, lr}
	movs r0, #0
	bl unk_3190
	ldr r2, _08003C74 @ =gMusicInfo
	ldrb r1, [r2, #0xb]
	movs r0, #0x81
	orrs r0, r1
	strb r0, [r2, #0xb]
	ldr r5, _08003C78 @ =0x080A8CDC
	ldr r0, [r5]
	ldr r6, _08003C7C @ =0x0000FFFF
	ldr r4, _08003C80 @ =0x00000050
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r6, #0
	adds r2, r4, #0
	bl unk_2d90
	ldr r0, [r5, #0xc]
	adds r1, r6, #0
	adds r2, r4, #0
	bl unk_2d90
	ldr r0, [r5, #0x54]
	adds r1, r6, #0
	adds r2, r4, #0
	bl unk_2d90
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003C74: .4byte gMusicInfo
_08003C78: .4byte 0x080A8CDC
_08003C7C: .4byte 0x0000FFFF
_08003C80: .4byte 0x00000050

	thumb_func_start unk_3c84
unk_3c84: @ 0x08003C84
	push {r4, r5, r6, lr}
	ldr r4, _08003CC8 @ =0x080A8CDC
	ldr r0, [r4]
	ldr r5, _08003CCC @ =0x0000FFFF
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r5, #0
	adds r2, r6, #0
	bl unk_2d90
	ldr r0, [r4, #0xc]
	adds r1, r5, #0
	adds r2, r6, #0
	bl unk_2d90
	ldr r0, [r4, #0x54]
	adds r1, r5, #0
	adds r2, r6, #0
	bl unk_2d90
	ldr r2, _08003CD0 @ =gMusicInfo
	ldrb r1, [r2, #0xb]
	movs r0, #0x7f
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0xb]
	movs r0, #0
	bl unk_3338
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08003CC8: .4byte 0x080A8CDC
_08003CCC: .4byte 0x0000FFFF
_08003CD0: .4byte gMusicInfo

	thumb_func_start unk_3cd4
unk_3cd4: @ 0x08003CD4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r5, _08003CF8 @ =gMusicInfo
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _08003CF2
	movs r0, #1
	strb r0, [r5, #1]
	movs r4, #0
	strh r1, [r5, #2]
	adds r0, r1, #0
	bl SoundPlay
	strb r4, [r5, #1]
_08003CF2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003CF8: .4byte gMusicInfo

	thumb_func_start unk_3cfc
unk_3cfc: @ 0x08003CFC
	push {r4, r5, lr}
	ldr r5, _08003D20 @ =gMusicInfo
	ldrb r1, [r5, #1]
	cmp r1, #0
	bne _08003D1A
	movs r0, #1
	strb r0, [r5, #1]
	movs r4, #0
	strh r1, [r5, #2]
	ldr r0, _08003D24 @ =0x080A8CDC
	ldr r0, [r0, #0x54]
	movs r1, #0x1e
	bl ApplyMusicSoundFading
	strb r4, [r5, #1]
_08003D1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08003D20: .4byte gMusicInfo
_08003D24: .4byte 0x080A8CDC

	thumb_func_start PlayCharacterAppearingSound
PlayCharacterAppearingSound: @ 0x08003D28
	push {lr}
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	cmp r1, #0x21
	beq _08003D50
	cmp r1, #0x21
	bgt _08003D3E
	cmp r1, #1
	beq _08003D44
	b _08003D60
_08003D3E:
	cmp r0, #0x41
	beq _08003D5A
	b _08003D60
_08003D44:
	ldr r0, _08003D4C @ =0x000001F5
	bl CheckPlayNotAlreadyPlayingSound
	b _08003D60
	.align 2, 0
_08003D4C: .4byte 0x000001F5
_08003D50:
	movs r0, #0xfb
	lsls r0, r0, #1
	bl CheckPlayNotAlreadyPlayingSound
	b _08003D60
_08003D5A:
	ldr r0, _08003D64 @ =0x000001F7
	bl CheckPlayNotAlreadyPlayingSound
_08003D60:
	pop {r0}
	bx r0
	.align 2, 0
_08003D64: .4byte 0x000001F7

	thumb_func_start CallSoundCodeB
CallSoundCodeB: @ 0x08003D68
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7, lr}
	add r4, pc, #0x0 @ =SoundCodeB
	bx r4

	arm_func_start SoundCodeB
SoundCodeB: @ 0x08003D78
	ldr r4, _08003E08 @ =gMusicInfo
	ldrb ip, [r4, #4]
	mov lr, #0x600
	b _08003D90
_08003D88:
	subs r3, r3, #1
	beq _08003DF8
_08003D90:
	ldrsb r6, [r0, lr]
	ldrsb r7, [r1, lr]
	ldrsb r4, [r0], #1
	ldrsb r5, [r1], #1
	ldrsb sl, [r0, lr]
	ldrsb fp, [r1, lr]
	ldrsb r8, [r0], #1
	ldrsb sb, [r1], #1
	add r6, r6, r4
	add r6, r6, r5
	add r6, r6, r7
	add r8, r8, sb
	add r8, r8, sl
	add r8, r8, fp
	mul r6, ip, r6
	mul r8, ip, r8
	asrs r6, r6, #9
	addmi r6, r6, #1
	asrs r8, r8, #9
	addmi r8, r8, #1
	lsl r6, r6, #7
	lsl r8, r8, #7
	mov r7, r6
	mov sb, r8
	stm r2!, {r6, r7, r8, sb}
	b _08003D88
_08003DF8:
	mov r0, r2
	pop {r8, sb, sl, fp, lr}
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_08003E08: .4byte gMusicInfo

	thumb_func_start CallSoundCodeC
CallSoundCodeC: @ 0x08003E0C
	push {r4, r5, r6, r7}
	mov r4, r8
	mov r5, sb
	mov r6, sl
	mov r7, fp
	push {r4, r5, r6, r7, lr}
	add r4, pc, #0x0 @ =SoundCodeC
	bx r4

	arm_func_start SoundCodeC
SoundCodeC: @ 0x08003E1C
	mov r3, #0x600
	add r3, r0, r3
	mov ip, #0
	sub ip, ip, #1
	lsr ip, ip, #0x17
	ldr lr, _08003EB8 @ =0x080A548A
	b _08003E40
_08003E38:
	subs r2, r2, #1
	beq _08003EA8
_08003E40:
	ldm r1!, {r4, r5, r6, r7, r8, sb, sl, fp}
	and r4, ip, r4, lsr #7
	and r5, ip, r5, lsr #7
	and r6, ip, r6, lsr #7
	and r7, ip, r7, lsr #7
	and r8, ip, r8, lsr #7
	and sb, ip, sb, lsr #7
	and sl, ip, sl, lsr #7
	and fp, ip, fp, lsr #7
	ldrb r4, [lr, r4]
	ldrb r5, [lr, r5]
	ldrb r6, [lr, r6]
	ldrb r7, [lr, r7]
	ldrb r8, [lr, r8]
	ldrb sb, [lr, sb]
	ldrb sl, [lr, sl]
	ldrb fp, [lr, fp]
	orr r4, r4, r6, lsl #8
	orr r4, r4, r8, lsl #16
	orr r4, r4, sl, lsl #24
	str r4, [r0], #4
	orr r5, r5, r7, lsl #8
	orr r5, r5, sb, lsl #16
	orr r5, r5, fp, lsl #24
	str r5, [r3], #4
	b _08003E38
_08003EA8:
	mov r0, r1
	pop {r8, sb, sl, fp, lr}
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
_08003EB8: .4byte 0x080A548A

	thumb_func_start CallSoundCodeA
CallSoundCodeA: @ 0x08003EBC
	push {r4, r5, r6, r7}
	mov r3, r8
	mov r4, sb
	mov r5, sl
	mov r6, fp
	push {r3, r4, r5, r6, lr}
	add r4, pc, #0x0 @ =unk_3ecc
	bx r4

	arm_func_start unk_3ecc
unk_3ecc: @ 0x08003ECC
	ldr ip, [r0, #0x18]
	ldrb fp, [r0, #0x11]
	ldrb sl, [r0, #0x12]
	ldr sb, [r0, #0x24]
	ldr r3, [r0, #0x20]
	ldr r8, [r3, #0xc]
	ldrb r4, [r0, #1]
	cmp r4, #0x20
	beq sub_08004318
	cmp r4, #8
	beq sub_080041EC
	mov r7, #0
	sub r7, r7, #1
	lsr r7, r7, #0x12
	ldr r6, [r0, #0x1c]
	stmdb sp!, {r0}
	ldrh r0, [r3, #2]
	ldr lr, [r3, #8]
	sub lr, lr, r8
	b _08003F24
_08003F1C:
	subs r2, r2, #1
	beq _08004500
_08003F24:
	add r4, ip, r6, lsl #2
	subs r4, r8, r4, lsr #14
	bgt sub_08004128
	lsr r5, ip, #0xe
	ands r0, r0, r0
	bne _08004010
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	cmp r5, r8
	bge _080044F0
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	cmp r5, r8
	bge _080044F0
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	cmp r5, r8
	bge _080044F0
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	b _080044F0
_08004010:
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	cmp r5, r8
	blt _08004058
	and r3, ip, r7
	add r5, r5, lr
	add ip, r3, r5, lsl #14
	b _08004158
_08004058:
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4

	thumb_func_start sub_08004078
sub_08004078: @ 0x08004078
	ldrh r3, [r2, r2]
	b _080040C8
_0800407C:
	.byte 0x30, 0x00, 0xA1, 0xE8
	.byte 0x06, 0xC0, 0x8C, 0xE0, 0x2C, 0x57, 0xA0, 0xE1, 0x08, 0x00, 0x55, 0xE1, 0x03, 0x00, 0x00, 0xBA
	.byte 0x07, 0x30, 0x0C, 0xE0, 0x0E, 0x50, 0x85, 0xE0, 0x05, 0xC7, 0x83, 0xE0, 0x39, 0x00, 0x00, 0xEA
	.byte 0xD9, 0x30, 0xB5, 0xE1, 0xD1, 0x40, 0xD5, 0xE1, 0x03, 0x40, 0x44, 0xE0, 0x07, 0x50, 0x0C, 0xE0
	.byte 0x95, 0x04, 0x04, 0xE0, 0x24, 0x37, 0x83, 0xE0, 0x30, 0x00, 0x91, 0xE8, 0x93, 0x4B, 0x24, 0xE0
	.byte 0x93, 0x5A, 0x25, 0xE0, 0x30, 0x00, 0xA1, 0xE8
_080040C8:
	stm r0!, {r1, r2}
	b sub_080041E6
_080040CC:
	.byte 0x2C, 0x57, 0xA0, 0xE1
	.byte 0x08, 0x00, 0x55, 0xE1, 0x03, 0x00, 0x00, 0xBA, 0x07, 0x30, 0x0C, 0xE0, 0x0E, 0x50, 0x85, 0xE0
	.byte 0x05, 0xC7, 0x83, 0xE0, 0x33, 0x00, 0x00, 0xEA, 0xD9, 0x30, 0xB5, 0xE1, 0xD1, 0x40, 0xD5, 0xE1
	.byte 0x03, 0x40, 0x44, 0xE0, 0x07, 0x50, 0x0C, 0xE0, 0x95, 0x04, 0x04, 0xE0, 0x24, 0x37, 0x83, 0xE0
	.byte 0x30, 0x00, 0x91, 0xE8, 0x93, 0x4B, 0x24, 0xE0, 0x93, 0x5A, 0x25, 0xE0, 0x30, 0x00, 0xA1, 0xE8
	.byte 0x06, 0xC0, 0x8C, 0xE0, 0x2C, 0x57, 0xA0, 0xE1, 0x07, 0x30, 0x0C, 0xE0, 0x0E, 0x50, 0x85, 0xE0
	.byte 0x05, 0xC7, 0x83, 0xE0, 0x7C, 0xFF, 0xFF, 0xEA

	arm_func_start sub_08004128
sub_08004128: @ 0x08004128
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
_08004158:
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
_080041E4:
	.byte 0x06, 0xC0

	non_word_aligned_thumb_func_start sub_080041E6
sub_080041E6: @ 0x080041E6
	b sub_08004302
_080041E8:
	.byte 0x4B, 0xFF, 0xFF, 0xEA

	arm_func_start sub_080041EC
sub_080041EC: @ 0x080041EC
	stmdb sp!, {r0}
	ldrh r7, [r3, #2]
	ldr r6, [r3, #8]
	b _08004204
_080041FC:
	subs r2, r2, #1
	beq _08004500
_08004204:
	add r4, ip, #4
	cmp r4, r8
	blt _080042C4
	ldrsb r3, [sb, ip]
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, #1
	cmp ip, r8
	bne _0800423C
	ands r7, r7, r7
	beq _080044F0
	mov ip, r6
_0800423C:
	ldrsb r3, [sb, ip]
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, #1
	cmp ip, r8
	bne _08004268
	ands r7, r7, r7
	beq _080044F0
	mov ip, r6
_08004268:
	ldrsb r3, [sb, ip]
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, #1
	cmp ip, r8
	bne _08004294
	ands r7, r7, r7
	beq _080044F0
	mov ip, r6
_08004294:
	ldrsb r3, [sb, ip]
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, #1
	cmp ip, r8
	bne _080041FC
	ands r7, r7, r7
	beq _080044F0
	mov ip, r6
	b _080041FC
_080042C4:
	ldm r1, {r3, r4, r5, lr}
	ldrsb r0, [sb, ip]
	mla r3, r0, fp, r3
	mla r4, r0, sl, r4
	add ip, ip, #1
	ldrsb r0, [sb, ip]
	mla r5, r0, fp, r5
	mla lr, r0, sl, lr
	add ip, ip, #1
	stm r1!, {r3, r4, r5, lr}
	ldm r1, {r3, r4, r5, lr}
	ldrsb r0, [sb, ip]
	mla r3, r0, fp, r3
	mla r4, r0, sl, r4
	add ip, ip, #1
_08004300:
	.byte 0xDC, 0x00

	non_word_aligned_thumb_func_start sub_08004302
sub_08004302: @ 0x08004302
	b _08004638
_08004304:
	.byte 0x90, 0x5B, 0x25, 0xE0, 0x90, 0xEA, 0x2E, 0xE0, 0x01, 0xC0, 0x8C, 0xE2
	.byte 0x38, 0x40, 0xA1, 0xE8, 0xB8, 0xFF, 0xFF, 0xEA

	arm_func_start sub_08004318
sub_08004318: @ 0x08004318
	mov r7, #0
	sub r7, r7, #1
	mov r4, r7
	lsr r7, r7, #0x12
	ldr r6, [r0, #0x1c]
	eor r6, r6, r4
	add r6, r6, #1
	stmdb sp!, {r0}
	ldrh r0, [r3, #2]
	b _08004348
_08004340:
	subs r2, r2, #1
	beq _08004500
_08004348:
	add r4, ip, r6, lsl #2
	asrs r4, r4, #0xe
	bgt _0800442C
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	cmp r5, #0
	ble _080044F0
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	cmp r5, #0
	ble _080044F0
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	cmp r5, #0
	ble _080044F0
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	b _080044F0
_0800442C:
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	lsr r5, ip, #0xe
	ldrsb r3, [r5, sb]!
	ldrsb r4, [r5, #1]
	sub r4, r4, r3
	and r5, ip, r7
	mul r4, r5, r4
	add r3, r3, r4, lsr #14
	ldm r1, {r4, r5}
	mla r4, r3, fp, r4
	mla r5, r3, sl, r5
	stm r1!, {r4, r5}
	add ip, ip, r6
	b _08004340
_080044F0:
	ldm sp!, {r0}
	mov r4, #0
	strb r4, [r0]
	b _08004508
_08004500:
	ldm sp!, {r0}
	str ip, [r0, #0x18]
_08004508:
	pop {r8, sb, sl, fp, lr}
	pop {r4, r5, r6, r7}
	bx lr

	thumb_func_start CallGetNoteFrequency
CallGetNoteFrequency: @ 0x08004514
	add r2, pc, #0x0
	bx r2

	thumb_func_start GetNoteFrequency
GetNoteFrequency: @ 0x08004518
	movs r1, #0x90
	b _08004624
_0800451C:
	.byte 0x22, 0x29, 0xA0, 0xE1
	.byte 0x03, 0x37, 0xA0, 0xE1, 0x02, 0x30, 0x83, 0xE0, 0x00, 0x00, 0x83, 0xE2, 0x1E, 0xFF, 0x2F, 0xE1

	thumb_func_start unk_4530
unk_4530: @ 0x08004530
	add r0, pc, #0x0
	bx r0

	thumb_func_start unk_4534
unk_4534: @ 0x08004534
	lsls r0, r4, #1
	b sub_08004078
_08004538:
	.byte 0x10, 0x10, 0xD0, 0xE5, 0x01, 0x10, 0x81, 0xE2
	.byte 0x0E, 0x30, 0xD0, 0xE5, 0x03, 0x00, 0x51, 0xE1, 0x11, 0x00, 0x00, 0x1A, 0x4C, 0x30, 0x9F, 0xE5
	.byte 0x00, 0x30, 0x93, 0xE5, 0x48, 0xC0, 0x9F, 0xE5, 0x00, 0xC0, 0x9C, 0xE5, 0x00, 0xC0, 0x83, 0xE5
	.byte 0x0C, 0xC0, 0x83, 0xE5, 0x00, 0x00, 0xA0, 0xE1, 0x50, 0xC0, 0xA0, 0xE3, 0x0C, 0xC2, 0xA0, 0xE1
	.byte 0xB2, 0xC0, 0xC3, 0xE1, 0xBE, 0xC0, 0xC3, 0xE1, 0xB6, 0xC0, 0xA0, 0xE3, 0x0C, 0xC4, 0xA0, 0xE1
	.byte 0xB2, 0xC0, 0xC3, 0xE1, 0xF6, 0xC0, 0xA0, 0xE3, 0x0C, 0xC4, 0xA0, 0xE1, 0xBE, 0xC0, 0xC3, 0xE1
	.byte 0x00, 0x10, 0xA0, 0xE3, 0x10, 0x10, 0xC0, 0xE5, 0x1E, 0xFF, 0x2F, 0xE1, 0xD0, 0x19, 0x00, 0x03
	.byte 0x8C, 0x56, 0x0A, 0x08, 0x90, 0x56, 0x0A, 0x08

	thumb_func_start unk_45a8
unk_45a8: @ 0x080045A8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r6, [r4, #0x1c]
	cmp r6, #0
	bne _0800465C
	movs r6, #1
	strb r6, [r4, #0x1c]
	ldrb r6, [r4, #0x1e]
	movs r7, #1
	ands r6, r7
	bne _08004658
	ldr r6, [r5]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	bne _080045D4
	bl ResetTrack
	movs r2, #0
	strb r2, [r4]
	b _08004658
_080045D4:
	ldr r7, [r4]
	movs r3, #2
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	ands r3, r2
	beq _080045FA
	movs r3, #0x1d
	ldrb r3, [r4, r3]
	cmp r3, #0
	beq _080045F4
	lsls r1, r6, #8
	lsrs r1, r1, #0x18
	lsrs r2, r7, #0x18
	cmp r2, r1
	ble _080045F4
	b _08004658
_080045F4:
	adds r0, r4, #0
	bl ResetTrack
_080045FA:
	movs r3, #2
	lsls r2, r6, #8
	orrs r2, r3
	ldr r0, [r5, #4]
	str r2, [r4]
	str r0, [r4, #0x14]
	str r5, [r4, #0x10]
	lsls r3, r3, #7
	strh r3, [r4, #0xc]
	lsrs r2, r6, #0x1f
	beq _08004616
	lsrs r0, r6, #0x18
	bl unk_24ec
_08004616:
	lsls r6, r6, #0x18
	lsrs r6, r6, #0x18
	ldr r7, [r4, #0x18]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	movs r1, #0
_08004624:
	adds r2, r7, #0
	movs r3, #0x50
	muls r3, r6, r3
	bl BitFill
	movs r0, #1
	movs r2, #0x40
	lsls r1, r2, #0x10
	lsls r2, r2, #8
	orrs r1, r2
_08004638:
	movs r3, #0xc
	lsls r3, r3, #8
	movs r2, #2
	orrs r2, r3
	adds r5, #8
	b _0800464C
_08004644:
	subs r6, #1
	beq _08004658
	adds r7, #0x50
	adds r5, #4
_0800464C:
	ldr r3, [r5]
	strb r0, [r7]
	strh r2, [r7, #0x1a]
	str r1, [r7, #4]
	str r3, [r7, #0x24]
	b _08004644
_08004658:
	movs r6, #0
	strb r6, [r4, #0x1c]
_0800465C:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start StopMusic
StopMusic: @ 0x08004664
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrb r6, [r7, #0x1c]
	cmp r6, #0
	bne _080046E0
	movs r6, #1
	strb r6, [r7, #0x1c]
	ldrb r6, [r7, #0x1e]
	movs r5, #1
	ands r5, r6
	bne _080046DC
	ldrb r4, [r7]
	movs r5, #2
	ands r4, r5
	beq _080046DC
	movs r4, #1
	strb r4, [r7]
	movs r4, #0
	strb r4, [r7, #2]
	movs r4, #2
	ands r4, r6
	beq _08004696
	movs r4, #0xfd
	ands r4, r6
	strb r4, [r7, #0x1e]
_08004696:
	ldrb r6, [r7, #1]
	ldr r5, [r7, #0x18]
	b _080046A2
_0800469C:
	subs r6, #1
	beq _080046DC
	adds r5, #0x50
_080046A2:
	ldr r4, [r5, #0x4c]
	cmp r4, #0
	beq _080046BE
	movs r3, #7
	movs r2, #0x34
	ldrb r1, [r5, r2]
	ands r1, r3
	subs r1, #1
	adds r0, r4, #0
	bl ClearRegistersForPSG
	movs r3, #0
	strb r3, [r4]
	str r3, [r4, #0x24]
_080046BE:
	ldr r0, [r5, #0x48]
	movs r1, #0
_080046C2:
	cmp r0, #0
	beq _080046D4
	ldr r2, [r0, #0x30]
	strb r1, [r0]
	str r1, [r0, #0x28]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	adds r0, r2, #0
	b _080046C2
_080046D4:
	movs r0, #0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x48]
	b _0800469C
_080046DC:
	movs r6, #0
	strb r6, [r7, #0x1c]
_080046E0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ResetTrack
ResetTrack: @ 0x080046E8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldrb r6, [r7, #0x1e]
	movs r5, #1
	ands r5, r6
	bne _08004756
	ldrb r4, [r7]
	movs r5, #2
	ands r4, r5
	beq _08004756
	movs r4, #1
	strb r4, [r7]
	movs r4, #0
	strb r4, [r7, #2]
	movs r4, #2
	ands r4, r6
	beq _08004710
	movs r4, #0xfd
	ands r4, r6
	strb r4, [r7, #0x1e]
_08004710:
	ldrb r6, [r7, #1]
	ldr r5, [r7, #0x18]
	b _0800471C
_08004716:
	subs r6, #1
	beq _08004756
	adds r5, #0x50
_0800471C:
	ldr r4, [r5, #0x4c]
	cmp r4, #0
	beq _08004738
	movs r3, #7
	movs r2, #0x34
	ldrb r1, [r5, r2]
	ands r1, r3
	subs r1, #1
	adds r0, r4, #0
	bl ClearRegistersForPSG
	movs r3, #0
	strb r3, [r4]
	str r3, [r4, #0x24]
_08004738:
	ldr r0, [r5, #0x48]
	movs r1, #0
_0800473C:
	cmp r0, #0
	beq _0800474E
	ldr r2, [r0, #0x30]
	strb r1, [r0]
	str r1, [r0, #0x28]
	str r1, [r0, #0x30]
	str r1, [r0, #0x2c]
	adds r0, r2, #0
	b _0800473C
_0800474E:
	movs r0, #0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x48]
	b _08004716
_08004756:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_475c
unk_475c: @ 0x0800475C
	adds r3, r0, #0
	ldr r0, [r3, #0xc]
	lsls r1, r0, #0x10
	adds r1, r0, r1
	lsrs r1, r1, #0x10
	movs r2, #0xff
	lsls r0, r2, #8
	ands r0, r1
	beq _08004774
	lsrs r0, r1, #8
	ands r1, r2
	b _08004776
_08004774:
	movs r0, #0
_08004776:
	strh r1, [r3, #0xe]
	bx lr
	.align 2, 0

	thumb_func_start unk_477c
unk_477c: @ 0x0800477C
	ldr r2, [r1, #0x24]
	ldrb r3, [r2, #1]
	adds r2, #2
	str r2, [r1, #0x24]
	lsls r2, r3, #1
	strh r2, [r0, #0xa]
	cmp r2, #0x96
	beq _0800479C
	movs r1, #0x1b
	movs r3, #0x4e
	lsls r1, r1, #8
	orrs r1, r3
	lsls r2, r2, #8
	muls r1, r2, r1
	lsrs r1, r1, #0x14
	b _080047A0
_0800479C:
	movs r1, #1
	lsls r1, r1, #8
_080047A0:
	movs r3, #0
	strh r1, [r0, #0xc]
	strh r3, [r0, #0xe]
	bx lr

	thumb_func_start UpdateAudio
UpdateAudio: @ 0x080047A8
	push {r4, r5, r6, lr}
	ldr r4, _08004810 @ =0x080A8CDC
	ldr r6, _08004814 @ =gMusicInfo
	movs r0, #0x21
	ldrb r0, [r6, r0]
	movs r1, #0x11
	cmp r0, r1
	beq _080047D8
	ldr r5, _08004818 @ =0x00000008
	b _080047C4
_080047BC:
	subs r5, #1
	cmp r5, #0
	beq _080047F4
	adds r4, #0xc
_080047C4:
	ldr r0, [r4]
	cmp r0, #0
	beq _080047BC
	ldrb r3, [r0]
	movs r1, #2
	ands r3, r1
	beq _080047BC
	bl unk_15d4
	b _080047BC
_080047D8:
	movs r0, #0x20
	ldrb r0, [r6, r0]
	movs r1, #0
	cmp r0, r1
	beq _080047E4
	movs r1, #0xc
_080047E4:
	adds r4, r4, r1
	ldr r0, [r4]
	ldrb r3, [r0]
	movs r1, #2
	ands r3, r1
	beq _080047F4
	bl unk_15d4
_080047F4:
	ldrb r5, [r6, #1]
	cmp r5, #0
	bne _08004806
	movs r5, #1
	strb r5, [r6, #1]
	bl UpdatePSGSounds
	bl unk_e48
_08004806:
	movs r0, #0
	strb r0, [r6, #1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004810: .4byte 0x080A8CDC
_08004814: .4byte gMusicInfo
_08004818: .4byte 0x00000008

	thumb_func_start unk_481c
unk_481c: @ 0x0800481C
	push {r4, r5, lr}
	ldr r1, [r0, #0x40]
	ldrb r2, [r0, #1]
	ldrb r3, [r0]
	movs r4, #0xf0
	ands r3, r4
	cmp r3, #0x80
	bne _0800484C
	movs r3, #0xc
	muls r2, r3, r2
	adds r1, r1, r2
	ldrb r2, [r1, #1]
	movs r3, #0x35
	strb r2, [r0, r3]
	ldrb r2, [r1, #3]
	cmp r2, #0
	bne _08004844
	movs r2, #0x40
	strb r2, [r0, #6]
	b _08004858
_08004844:
	subs r2, #0x80
	bmi _08004858
	strb r2, [r0, #6]
	b _08004858
_0800484C:
	ldr r3, [r0, #0x44]
	adds r3, r3, r2
	ldrb r3, [r3]
	movs r4, #0xc
	muls r3, r4, r3
	adds r1, r1, r3
_08004858:
	ldr r2, [r1]
	lsls r3, r2, #0x18
	lsrs r3, r3, #0x18
	movs r4, #0x34
	strb r3, [r0, r4]
	lsls r4, r2, #8
	lsrs r4, r4, #0x18
	movs r5, #0x36
	strb r4, [r0, r5]
	movs r4, #7
	ands r3, r4
	bne _08004876
	ldr r3, [r1, #4]
	str r3, [r0, #0x38]
	b _080048B6
_08004876:
	cmp r3, #2
	bgt _08004894
	lsrs r3, r2, #0x18
	movs r4, #0x80
	ands r4, r3
	bne _0800488A
	movs r4, #0x70
	ands r4, r3
	beq _0800488A
	b _0800488C
_0800488A:
	movs r3, #8
_0800488C:
	movs r4, #0x37
	strb r3, [r0, r4]
	movs r4, #6
	b _080048AE
_08004894:
	cmp r3, #3
	bne _080048A8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r5, #4]
	bl UploadSampleToWaveRAM
	adds r0, r4, #0
	adds r1, r5, #0
	b _080048B6
_080048A8:
	cmp r3, #4
	bne _080048B6
	movs r4, #3
_080048AE:
	ldr r3, [r1, #4]
	lsls r3, r4
	movs r4, #0x38
	strb r3, [r0, r4]
_080048B6:
	ldr r2, [r1, #8]
	str r2, [r0, #0x3c]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_48c0
unk_48c0: @ 0x080048C0
	movs r1, #0x19
	ldrsb r1, [r0, r1]
	cmp r1, #0
	ble _080048CA
	adds r1, #1
_080048CA:
	ldr r2, [r0, #0x1c]
	ldrb r3, [r0, #0x1a]
	muls r1, r3, r1
	lsls r1, r1, #2
	lsls r3, r2, #0x18
	asrs r3, r3, #0x18
	lsls r3, r3, #8
	adds r1, r1, r3
	lsls r3, r2, #0x10
	asrs r3, r3, #0x18
	lsls r3, r3, #8
	adds r1, r1, r3
	lsls r3, r2, #8
	asrs r3, r3, #0x16
	lsls r3, r3, #2
	adds r1, r1, r3
	lsrs r2, r2, #0x18
	adds r1, r1, r2
	movs r3, #0x10
	ldr r2, [r0, r3]
	movs r3, #0xff
	ands r3, r2
	beq _08004912
	movs r3, #0xff
	lsls r3, r3, #8
	ands r3, r2
	beq _08004912
	lsls r3, r2, #8
	lsrs r3, r3, #0x18
	cmp r3, #0
	bne _08004912
	asrs r2, r2, #0x18
	lsls r2, r2, #2
	movs r3, #0xc
	muls r2, r3, r2
	adds r1, r1, r2
_08004912:
	asrs r2, r1, #8
	strb r2, [r0, #0x17]
	strb r1, [r0, #0x18]
	bx lr
	.align 2, 0

	thumb_func_start unk_491c
unk_491c: @ 0x0800491C
	push {r4}
	ldr r1, [r0, #4]
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r1, #0x10
	lsrs r3, r3, #0x18
	muls r2, r3, r2
	lsrs r2, r2, #5
	ldrh r3, [r0, #0x12]
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #1
	bne _08004946
	lsls r4, r3, #0x10
	asrs r4, r4, #0x18
	adds r4, #0x41
	muls r2, r4, r2
	asrs r2, r2, #6
	cmp r2, #0xff
	blt _08004946
	movs r2, #0xff
_08004946:
	lsls r4, r1, #8
	lsrs r4, r4, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r4
	subs r1, #0x40
	cmp r1, #0x3f
	blt _08004958
	movs r1, #0x3f
	b _08004962
_08004958:
	movs r4, #0x40
	rsbs r4, r4, #0
	cmp r1, r4
	bpl _08004962
	rsbs r1, r4, #0
_08004962:
	lsls r4, r3, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #2
	bne _08004980
	lsls r4, r3, #0x10
	asrs r4, r4, #0x18
	adds r1, r1, r4
	cmp r1, #0x3f
	blt _08004978
	movs r1, #0x3f
	b _08004980
_08004978:
	movs r4, #0x40
	adds r3, r1, r4
	bpl _08004980
	rsbs r1, r4, #0
_08004980:
	movs r4, #0x40
	adds r3, r1, r4
	muls r3, r2, r3
	lsrs r3, r3, #7
	subs r4, r4, r1
	muls r4, r2, r4
	lsrs r4, r4, #7
	lsls r4, r4, #8
	orrs r3, r4
	strh r3, [r0, #8]
	pop {r4}
	bx lr

	thumb_func_start unk_4998
unk_4998: @ 0x08004998
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldrb r1, [r4, #0x13]
	movs r2, #2
	orrs r1, r2
	strb r1, [r4, #0x13]
	bl unk_1e14
	ldr r0, [r5, #0x48]
	cmp r0, #0
	beq _080049B4
	str r4, [r0, #0x2c]
_080049B4:
	str r0, [r4, #0x30]
	movs r1, #0
	str r1, [r4, #0x2c]
	str r5, [r4, #0x28]
	str r4, [r5, #0x48]
	movs r1, #0x34
	ldrb r0, [r5, r1]
	ldrb r1, [r5, #6]
	lsls r0, r0, #8
	lsls r6, r6, #0x10
	lsls r1, r1, #0x18
	movs r2, #1
	orrs r0, r1
	orrs r0, r2
	orrs r0, r6
	str r0, [r4]
	ldr r0, [r5, #0x3c]
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	movs r1, #0x10
	movs r2, #0xc
	ldr r0, [r5, #0x38]
	adds r1, r1, r0
	adds r2, r2, r0
	str r0, [r4, #0x20]
	str r1, [r4, #0x24]
	str r2, [r4, #0x14]
	ldrh r1, [r5]
	lsrs r2, r1, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	strb r2, [r4, #6]
	movs r3, #0xf0
	ands r1, r3
	cmp r1, #0x80
	bne _08004A02
	movs r3, #0x35
	ldrb r2, [r5, r3]
_08004A02:
	strb r2, [r4, #7]
	movs r3, #0x17
	ldrsb r1, [r5, r3]
	adds r1, r1, r2
	bmi _08004A14
	cmp r1, #0x7f
	ble _08004A16
	movs r1, #0x7f
	b _08004A16
_08004A14:
	movs r1, #0
_08004A16:
	ldrb r2, [r5, #0x18]
	bl MidiKey2Freq
	ldr r1, _08004A38 @ =gMusicInfo
	ldrh r2, [r1, #0x12]
	cmp r0, r2
	bne _08004A2A
	movs r0, #0x40
	lsls r0, r0, #8
	b _08004A30
_08004A2A:
	ldr r1, [r1, #0x18]
	bl CallGetNoteFrequency
_08004A30:
	str r0, [r4, #0x1c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08004A38: .4byte gMusicInfo

	thumb_func_start unk_4a3c
unk_4a3c: @ 0x08004A3C
	ldr r1, [r0, #0x24]
	adds r1, #1
	movs r2, #3
	ands r2, r1
	bne _08004A4A
	ldr r2, [r1]
	b _08004A76
_08004A4A:
	movs r2, #1
	ands r2, r1
	bne _08004A5C
	ldrh r2, [r1]
	adds r1, #2
	ldrh r3, [r1]
	lsls r3, r3, #0x10
	orrs r2, r3
	b _08004A76
_08004A5C:
	ldrb r2, [r1]
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #8
	orrs r2, r3
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #0x10
	orrs r2, r3
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #0x18
	orrs r2, r3
_08004A76:
	str r2, [r0, #0x24]
	bx lr
	.align 2, 0

	thumb_func_start unk_4a7c
unk_4a7c: @ 0x08004A7C
	ldr r1, [r0, #0x24]
	adds r1, #1
	movs r2, #3
	ands r2, r1
	bne _08004A8C
	ldr r2, [r1]
	adds r1, #4
	b _08004ABC
_08004A8C:
	movs r2, #1
	ands r2, r1
	bne _08004AA0
	ldrh r2, [r1]
	adds r1, #2
	ldrh r3, [r1]
	lsls r3, r3, #0x10
	orrs r2, r3
	adds r1, #2
	b _08004ABC
_08004AA0:
	ldrb r2, [r1]
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #8
	orrs r2, r3
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #0x10
	orrs r2, r3
	adds r1, #1
	ldrb r3, [r1]
	lsls r3, r3, #0x18
	orrs r2, r3
	adds r1, #1
_08004ABC:
	str r2, [r0, #0x24]
	adds r0, #0x28
	ldr r2, [r0]
	cmp r2, #0
	beq _08004AD6
	adds r0, #4
	ldr r2, [r0]
	cmp r2, #0
	beq _08004AD6
	adds r0, #4
	ldr r2, [r0]
	cmp r2, #0
	bne _08004AD8
_08004AD6:
	str r1, [r0]
_08004AD8:
	bx lr
	.align 2, 0

	thumb_func_start UploadSampleToWaveRAM
UploadSampleToWaveRAM: @ 0x08004ADC
	ldr r3, _08004B08 @ =0x04000070
	movs r2, #0x40
	strb r2, [r3]
	ldr r1, _08004B0C @ =0x04000090
	ldr r2, [r0]
	str r2, [r1]
	adds r0, #4
	adds r1, #4
	ldr r2, [r0]
	str r2, [r1]
	adds r0, #4
	adds r1, #4
	ldr r2, [r0]
	str r2, [r1]
	adds r0, #4
	adds r1, #4
	ldr r2, [r0]
	str r2, [r1]
	movs r2, #0
	strb r2, [r3]
	bx lr
	.align 2, 0
_08004B08: .4byte 0x04000070
_08004B0C: .4byte 0x04000090

	thumb_func_start unk_4b10
unk_4b10: @ 0x08004B10
	push {r4, r5}
	ldr r4, [r0, #0x10]
	ldrh r5, [r0, #0x14]
	ldr r1, [r0, #0x24]
	movs r2, #0x34
	ldrb r1, [r1, r2]
	cmp r1, #8
	ble _08004B4A
	movs r2, #4
	movs r3, #0x89
	lsls r2, r2, #0x18
	orrs r2, r3
	ldrb r2, [r2]
	lsrs r2, r2, #6
	lsls r2, r2, #6
	movs r3, #0x40
	cmp r2, r3
	bge _08004B38
	adds r5, #2
	b _08004B40
_08004B38:
	movs r3, #0x80
	cmp r2, r3
	bge _08004B4A
	adds r5, #1
_08004B40:
	movs r2, #0xc7
	movs r3, #0xfe
	lsls r2, r2, #8
	orrs r2, r3
	ands r5, r2
_08004B4A:
	movs r2, #4
	movs r3, #0x60
	lsls r2, r2, #0x18
	orrs r2, r3
	movs r3, #7
	ands r1, r3
	lsls r3, r4, #8
	lsrs r3, r3, #0x10
	cmp r1, #1
	beq _08004B6C
	cmp r1, #2
	beq _08004B7E
	cmp r1, #3
	beq _08004B84
	cmp r1, #4
	beq _08004B8C
	b _08004B90
_08004B6C:
	strb r4, [r2]
	strh r3, [r2, #2]
	strh r5, [r2, #4]
	mov r8, r8
	mov r8, r8
	mov r8, r8
	mov r8, r8
	strh r5, [r2, #4]
	b _08004B90
_08004B7E:
	strh r3, [r2, #8]
	strh r5, [r2, #0xc]
	b _08004B90
_08004B84:
	strb r4, [r2, #0x10]
	strh r3, [r2, #0x12]
	strh r5, [r2, #0x14]
	b _08004B90
_08004B8C:
	strh r3, [r2, #0x18]
	strh r5, [r2, #0x1c]
_08004B90:
	lsls r5, r5, #0x11
	lsrs r5, r5, #0x11
	strh r5, [r0, #0x14]
	pop {r4, r5}
	bx lr
	.align 2, 0
