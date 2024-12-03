    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start LoadCommonGraphics
LoadCommonGraphics: @ 0x08072D50
	ldr r1, _08072D64 @ =0x040000D4
	ldr r0, _08072D68 @ =sCommonOamGfx
	str r0, [r1]
	ldr r0, _08072D6C @ =0x06010800
	str r0, [r1, #4]
	ldr r0, _08072D70 @ =0x80001C00
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08072D64: .4byte 0x040000D4
_08072D68: .4byte sCommonOamGfx
_08072D6C: .4byte 0x06010800
_08072D70: .4byte 0x80001C00

	thumb_func_start CheckResetHudAndParticles
CheckResetHudAndParticles: @ 0x08072D74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08072DA4 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08072DC8
	ldr r0, _08072DA8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08072E1E
	ldr r4, _08072DAC @ =gParticleEffects
	movs r5, #0xf
_08072D98:
	ldrb r0, [r4, #2]
	cmp r0, #0x42
	bhi _08072DB0
	movs r0, #0
	b _08072DBC
	.align 2, 0
_08072DA4: .4byte gUnk_03000be3
_08072DA8: .4byte gPauseScreenFlag
_08072DAC: .4byte gParticleEffects
_08072DB0:
	cmp r0, #0x46
	bne _08072DBE
	bl EventCheckOn_Escape
	cmp r0, #0
	bne _08072DBE
_08072DBC:
	strb r0, [r4]
_08072DBE:
	adds r4, #0xc
	subs r5, #1
	cmp r5, #0
	bge _08072D98
	b _08072E1E
_08072DC8:
	ldr r3, _08072E2C @ =gEnergyDigits
	ldr r4, _08072E30 @ =gMaxEnergyDigits
	ldr r5, _08072E34 @ =gMissileDigits
	ldr r6, _08072E38 @ =gPowerBombDigits
	ldr r0, _08072E3C @ =gMissileHighlightStatus
	mov ip, r0
	ldr r7, _08072E40 @ =gPowerBombHighlightStatus
	ldr r1, _08072E44 @ =gMinimapUpdateFlag
	mov r8, r1
	ldr r2, _08072E48 @ =gEscapeStatus
	mov sb, r2
	ldr r1, _08072E4C @ =gParticleEffects
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0xb4
_08072DE6:
	strb r2, [r0]
	subs r0, #0xc
	cmp r0, r1
	bge _08072DE6
	movs r0, #0
	movs r1, #9
	strb r1, [r3]
	strb r1, [r3, #1]
	strb r1, [r3, #2]
	strb r1, [r3, #3]
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	strb r1, [r5]
	strb r1, [r5, #1]
	strb r1, [r5, #2]
	strb r1, [r6]
	strb r1, [r6, #1]
	strb r1, [r6, #2]
	mov r1, ip
	strb r0, [r1]
	strb r0, [r7]
	movs r1, #3
	mov r2, r8
	strb r1, [r2]
	mov r1, sb
	strb r0, [r1]
_08072E1E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072E2C: .4byte gEnergyDigits
_08072E30: .4byte gMaxEnergyDigits
_08072E34: .4byte gMissileDigits
_08072E38: .4byte gPowerBombDigits
_08072E3C: .4byte gMissileHighlightStatus
_08072E40: .4byte gPowerBombHighlightStatus
_08072E44: .4byte gMinimapUpdateFlag
_08072E48: .4byte gEscapeStatus
_08072E4C: .4byte gParticleEffects
