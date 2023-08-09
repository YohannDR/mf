    .include "asm/macros.inc"

    .syntax unified

    arm_func_start _start
_start: @ 0x080000c0
	mov r0, #0x12
	msr cpsr_fc, r0
	ldr sp, _080000F8 @ =0x03007FA0
	mov r0, #0x1f
	msr cpsr_fc, r0
	ldr sp, _080000F4 @ =0x03007E60
	ldr r1, _080000FC @ =0x03007FFC
	add r0, pc, #0x20 @ =InterruptCode
	str r0, [r1]
	ldr r1, _08000100 @ =AgbMain
	mov lr, pc
	bx r1
	b _start
	.align 2, 0
_080000F4: .4byte 0x03007E60
_080000F8: .4byte 0x03007FA0
_080000FC: .4byte 0x03007FFC
_08000100: .4byte AgbMain
