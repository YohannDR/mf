    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start LoadCommonGraphics
LoadCommonGraphics: @ 0x08072D50
	ldr r1, _08072D64 @ =0x040000D4
	ldr r0, _08072D68 @ =0x083E419C
	str r0, [r1]
	ldr r0, _08072D6C @ =0x06010800
	str r0, [r1, #4]
	ldr r0, _08072D70 @ =0x80001C00
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08072D64: .4byte 0x040000D4
_08072D68: .4byte 0x083E419C
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
	ldr r4, _08072DAC @ =0x030007F8
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
_08072DAC: .4byte 0x030007F8
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
	ldr r1, _08072E4C @ =0x030007F8
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
_08072E4C: .4byte 0x030007F8

	thumb_func_start CheckParticleIsOnScreen
CheckParticleIsOnScreen: @ 0x08072E50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _08072E6C @ =0x030008B8
	ldrb r5, [r1]
	movs r0, #0x40
	ands r0, r5
	adds r4, r1, #0
	cmp r0, #0
	beq _08072E70
_08072E64:
	movs r0, #2
	orrs r0, r5
	b _08072ED6
	.align 2, 0
_08072E6C: .4byte 0x030008B8
_08072E70:
	ldr r0, _08072EE4 @ =gBg1YPosition
	ldr r3, _08072EE8 @ =gBg1XPosition
	movs r1, #0x80
	lsls r1, r1, #2
	adds r2, r1, #0
	ldrh r0, [r0]
	adds r1, r2, r0
	lsls r1, r1, #0x10
	ldrh r6, [r4, #8]
	adds r0, r2, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r7, _08072EEC @ =0xFF800000
	adds r0, r1, r7
	lsrs r0, r0, #0x10
	mov ip, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r1, r1, r0
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r3, [r3]
	adds r0, r2, r3
	lsls r0, r0, #0x10
	ldrh r1, [r4, #0xa]
	adds r2, r2, r1
	lsls r2, r2, #0x10
	adds r3, r7, #0
	adds r1, r0, r3
	lsrs r3, r2, #0x10
	movs r7, #0x88
	lsls r7, r7, #0x13
	adds r0, r0, r7
	lsrs r0, r0, #0x10
	cmp r1, r2
	bhs _08072EC4
	cmp r3, r0
	bhs _08072EC4
	cmp ip, r6
	bhs _08072EC4
	cmp r6, r8
	blo _08072E64
_08072EC4:
	ldrb r1, [r4]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _08072ED6
	movs r0, #0xfd
	ands r0, r1
_08072ED6:
	strb r0, [r4]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072EE4: .4byte gBg1YPosition
_08072EE8: .4byte gBg1XPosition
_08072EEC: .4byte 0xFF800000

	thumb_func_start DrawParticle
DrawParticle: @ 0x08072EF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08072F28 @ =gNextOamSlot
	ldrb r3, [r0]
	ldr r1, _08072F2C @ =0x03000954
	ldr r4, [r1]
	ldrh r6, [r4]
	adds r4, #2
	adds r1, r6, r3
	cmp r1, #0x7f
	bgt _08072FE0
	lsls r1, r3, #3
	ldr r0, _08072F30 @ =gOamData
	adds r5, r1, r0
	ldr r2, _08072F34 @ =0x030008B8
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08072F38
	ldrh r0, [r2, #8]
	mov ip, r0
	ldrh r7, [r2, #0xa]
	b _08072F5A
	.align 2, 0
_08072F28: .4byte gNextOamSlot
_08072F2C: .4byte 0x03000954
_08072F30: .4byte gOamData
_08072F34: .4byte 0x030008B8
_08072F38:
	ldrh r1, [r2, #8]
	lsrs r1, r1, #2
	ldr r0, _08072F74 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r1
	ldrh r1, [r2, #0xa]
	lsrs r1, r1, #2
	ldr r0, _08072F78 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
_08072F5A:
	ldrb r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08072F80
	ldr r0, _08072F7C @ =gSamusOnTopOfBackgrounds
	ldrb r0, [r0]
	movs r2, #2
	cmp r0, #0
	beq _08072F82
	movs r2, #1
	b _08072F82
	.align 2, 0
_08072F74: .4byte gBg1YPosition
_08072F78: .4byte gBg1XPosition
_08072F7C: .4byte gSamusOnTopOfBackgrounds
_08072F80:
	movs r2, #0
_08072F82:
	adds r1, r6, r3
	mov sl, r1
	cmp r6, #0
	beq _08072FDA
	ldr r1, _08072FF0 @ =gOamData
	lsls r2, r2, #2
	mov r8, r2
	lsls r0, r3, #3
	adds r3, r0, r1
	movs r0, #0xd
	rsbs r0, r0, #0
	mov sb, r0
_08072F9A:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	add r0, ip
	strb r0, [r3]
	ldrh r1, [r4]
	adds r4, #2
	strh r1, [r5]
	adds r5, #2
	adds r1, r1, r7
	ldr r0, _08072FF4 @ =0x000001FF
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _08072FF8 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r1, [r3, #5]
	mov r0, sb
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r3, #5]
	adds r5, #4
	adds r3, #8
	subs r6, #1
	cmp r6, #0
	bne _08072F9A
_08072FDA:
	mov r1, sl
	ldr r0, _08072FFC @ =gNextOamSlot
	strb r1, [r0]
_08072FE0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072FF0: .4byte gOamData
_08072FF4: .4byte 0x000001FF
_08072FF8: .4byte 0xFFFFFE00
_08072FFC: .4byte gNextOamSlot

	thumb_func_start ParticleUpdate
ParticleUpdate: @ 0x08073000
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080730D4 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _080730CA
	movs r6, #0
	ldr r2, _080730D8 @ =0x030007F8
	movs r5, #0
_08073016:
	adds r3, r5, r2
	ldrb r1, [r3]
	movs r0, #5
	ands r0, r1
	cmp r0, #5
	bne _08073062
	ldr r4, _080730DC @ =0x030008B8
	adds r1, r4, #0
	adds r0, r3, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r1, _080730E0 @ =0x0879BCC0
	ldrb r0, [r4, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08073058
	bl CheckParticleIsOnScreen
	ldrb r1, [r4]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #2
	bne _08073058
	adds r0, r6, #0
	bl DrawParticle
_08073058:
	ldr r2, _080730D8 @ =0x030007F8
	adds r1, r5, r2
	ldr r0, _080730DC @ =0x030008B8
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
_08073062:
	adds r5, #0xc
	adds r6, #1
	cmp r6, #0xf
	ble _08073016
	movs r6, #0
	mov r8, r6
_0807306E:
	mov r0, r8
	adds r3, r0, r2
	ldrb r0, [r3]
	movs r4, #5
	ands r4, r0
	cmp r4, #1
	bne _080730BC
	ldr r5, _080730DC @ =0x030008B8
	adds r1, r5, #0
	adds r0, r3, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r1, _080730E0 @ =0x0879BCC0
	ldrb r0, [r5, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldrb r0, [r5]
	ands r4, r0
	cmp r4, #0
	beq _080730B0
	bl CheckParticleIsOnScreen
	ldrb r1, [r5]
	movs r0, #0xa
	ands r0, r1
	cmp r0, #2
	bne _080730B0
	adds r0, r6, #0
	bl DrawParticle
_080730B0:
	ldr r2, _080730D8 @ =0x030007F8
	mov r0, r8
	adds r1, r0, r2
	ldr r0, _080730DC @ =0x030008B8
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
_080730BC:
	movs r7, #0xc
	add r8, r7
	adds r6, #1
	cmp r6, #0xf
	ble _0807306E
	bl EscapeUpdate
_080730CA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080730D4: .4byte gSubGameMode1
_080730D8: .4byte 0x030007F8
_080730DC: .4byte 0x030008B8
_080730E0: .4byte 0x0879BCC0

	thumb_func_start ParticleSet
ParticleSet: @ 0x080730E4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r4, #0
	movs r2, #0
	ldr r0, _08073178 @ =0x030007F8
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _0807314C
_08073108:
	adds r2, #1
	cmp r2, #0xf
	bgt _0807311E
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	bne _08073108
	movs r4, #1
_0807311E:
	cmp r4, #0
	bne _0807314C
	movs r5, #0xff
	movs r2, #0
	ldr r0, _08073178 @ =0x030007F8
	adds r3, r0, #2
_0807312A:
	ldrb r0, [r3]
	movs r1, #0
	cmp r0, #0x42
	bhi _08073134
	ldrb r1, [r3, #2]
_08073134:
	cmp r4, r1
	bhs _0807313E
	adds r4, r1, #0
	lsls r0, r2, #0x18
	lsrs r5, r0, #0x18
_0807313E:
	adds r3, #0xc
	adds r2, #1
	cmp r2, #0xf
	ble _0807312A
	cmp r5, #0xff
	beq _0807316E
	adds r2, r5, #0
_0807314C:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	movs r1, #0
	mov r3, ip
	strh r3, [r0, #8]
	strh r7, [r0, #0xa]
	strh r2, [r0, #6]
	strb r1, [r0, #1]
	mov r2, r8
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
_0807316E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073178: .4byte 0x030007F8

	thumb_func_start ParticleUpdateAnimation
ParticleUpdateAnimation: @ 0x0807317C
	push {lr}
	adds r3, r0, #0
	ldr r2, _080731C0 @ =0x030008B8
	ldrb r1, [r2, #1]
	adds r1, #1
	strb r1, [r2, #1]
	ldrh r0, [r2, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r0, r1
	bhi _080731B0
	movs r0, #0
	strb r0, [r2, #1]
	ldrh r0, [r2, #6]
	adds r0, #1
	strh r0, [r2, #6]
	ldrh r0, [r2, #6]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080731B0
	strh r0, [r2, #6]
_080731B0:
	ldr r0, _080731C4 @ =0x03000954
	ldrh r1, [r2, #6]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldr r1, [r1]
	str r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080731C0: .4byte 0x030008B8
_080731C4: .4byte 0x03000954

	thumb_func_start ParticleNone
ParticleNone: @ 0x080731C8
	push {r4, lr}
	ldr r4, _080731E4 @ =0x030008B8
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _080731EC
	ldr r0, _080731E8 @ =0x0858EAE8
	bl ParticleUpdateAnimation
	movs r0, #0x50
	strb r0, [r4, #3]
	ldrb r1, [r4]
	movs r0, #0x14
	orrs r0, r1
	b _0807321C
	.align 2, 0
_080731E4: .4byte 0x030008B8
_080731E8: .4byte 0x0858EAE8
_080731EC:
	subs r0, #1
	strb r0, [r4, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bls _08073204
	ldr r0, _08073200 @ =0x0858EAE8
	bl ParticleUpdateAnimation
	b _0807321E
	.align 2, 0
_08073200: .4byte 0x0858EAE8
_08073204:
	cmp r0, #0x1e
	bne _08073210
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #6]
	strb r1, [r4, #1]
_08073210:
	ldr r0, _08073224 @ =0x0858EB10
	bl ParticleUpdateAnimation
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _0807321E
_0807321C:
	strb r0, [r4]
_0807321E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073224: .4byte 0x0858EB10

	thumb_func_start ParticleBomb
ParticleBomb: @ 0x08073228
	push {r4, lr}
	ldr r4, _08073268 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _0807326C @ =0x083EA57C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073246
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073246
	strb r0, [r4]
_08073246:
	ldr r2, _08073268 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073260
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xde
	bl SoundPlay
_08073260:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073268: .4byte 0x030008B8
_0807326C: .4byte 0x083EA57C

	thumb_func_start ParticleFlareHit
ParticleFlareHit: @ 0x08073270
	push {r4, lr}
	ldr r4, _080732A8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080732AC @ =0x083EE3DC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807328E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807328E
	strb r0, [r4]
_0807328E:
	ldr r1, _080732A8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080732A0
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf6
	bl SoundPlay
_080732A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080732A8: .4byte 0x030008B8
_080732AC: .4byte 0x083EE3DC

	thumb_func_start ParticleNormalBeamHit
ParticleNormalBeamHit: @ 0x080732B0
	push {r4, lr}
	ldr r4, _080732E8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080732EC @ =0x083EE464
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080732CE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080732CE
	strb r0, [r4]
_080732CE:
	ldr r1, _080732E8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080732E0
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf2
	bl SoundPlay
_080732E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080732E8: .4byte 0x030008B8
_080732EC: .4byte 0x083EE464

	thumb_func_start ParticleChargeBeamHit
ParticleChargeBeamHit: @ 0x080732F0
	push {r4, lr}
	ldr r4, _08073328 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _0807332C @ =0x083EE4FC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807330E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807330E
	strb r0, [r4]
_0807330E:
	ldr r1, _08073328 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073320
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf3
	bl SoundPlay
_08073320:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073328: .4byte 0x030008B8
_0807332C: .4byte 0x083EE4FC

	thumb_func_start ParticleWideBeamHit
ParticleWideBeamHit: @ 0x08073330
	push {r4, lr}
	ldr r4, _08073368 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _0807336C @ =0x083EE5D0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807334E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807334E
	strb r0, [r4]
_0807334E:
	ldr r1, _08073368 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073360
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf4
	bl SoundPlay
_08073360:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073368: .4byte 0x030008B8
_0807336C: .4byte 0x083EE5D0

	thumb_func_start ParticlePlasmaBeamHit
ParticlePlasmaBeamHit: @ 0x08073370
	push {r4, lr}
	ldr r4, _080733A8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080733AC @ =0x083EE740
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807338E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807338E
	strb r0, [r4]
_0807338E:
	ldr r1, _080733A8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080733A0
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf5
	bl SoundPlay
_080733A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080733A8: .4byte 0x030008B8
_080733AC: .4byte 0x083EE740

	thumb_func_start ParticleInvincibleHit
ParticleInvincibleHit: @ 0x080733B0
	push {r4, lr}
	ldr r4, _080733E8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080733EC @ =0x083EE7A0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080733CE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080733CE
	strb r0, [r4]
_080733CE:
	ldr r1, _080733E8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080733E0
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xf8
	bl SoundPlayNotAlreadyPlaying
_080733E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080733E8: .4byte 0x030008B8
_080733EC: .4byte 0x083EE7A0

	thumb_func_start ParticleNormalMissileExplosion
ParticleNormalMissileExplosion: @ 0x080733F0
	push {r4, lr}
	ldr r4, _0807342C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073430 @ =0x083EAA3C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807340E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807340E
	strb r0, [r4]
_0807340E:
	ldr r1, _0807342C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073426
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xcf
	bl SoundStop
	movs r0, #0xd0
	bl SoundPlay
_08073426:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807342C: .4byte 0x030008B8
_08073430: .4byte 0x083EAA3C

	thumb_func_start ParticleSuperMissileExplosion
ParticleSuperMissileExplosion: @ 0x08073434
	push {r4, lr}
	ldr r4, _08073480 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073484 @ =0x083EAA0C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073452
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073452
	strb r0, [r4]
_08073452:
	ldr r1, _08073480 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807347A
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xd2
	bl SoundStop
	movs r0, #0xd3
	bl SoundPlay
	movs r0, #0xa
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0xa
	movs r1, #0x81
	bl ScreenShakeStartVertical
_0807347A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073480: .4byte 0x030008B8
_08073484: .4byte 0x083EAA0C

	thumb_func_start ParticleIceMissileExplosion
ParticleIceMissileExplosion: @ 0x08073488
	push {r4, lr}
	ldr r4, _080734D4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080734D8 @ =0x083EAC4C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080734A6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080734A6
	strb r0, [r4]
_080734A6:
	ldr r1, _080734D4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080734CE
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xd5
	bl SoundStop
	movs r0, #0xd6
	bl SoundPlay
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartVertical
_080734CE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080734D4: .4byte 0x030008B8
_080734D8: .4byte 0x083EAC4C

	thumb_func_start ParticleDiffusionMissileExplosion
ParticleDiffusionMissileExplosion: @ 0x080734DC
	push {r4, lr}
	ldr r4, _08073528 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _0807352C @ =0x083EAC7C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080734FA
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080734FA
	strb r0, [r4]
_080734FA:
	ldr r1, _08073528 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073522
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xd8
	bl SoundStop
	movs r0, #0xd9
	bl SoundPlay
	movs r0, #0x1e
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x1e
	movs r1, #0x81
	bl ScreenShakeStartVertical
_08073522:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073528: .4byte 0x030008B8
_0807352C: .4byte 0x083EAC7C

	thumb_func_start ParticleChargedDiffusionMissileExplosion
ParticleChargedDiffusionMissileExplosion: @ 0x08073530
	push {r4, lr}
	ldr r4, _0807357C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073580 @ =0x083EACAC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807354E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807354E
	strb r0, [r4]
_0807354E:
	ldr r1, _0807357C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073576
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xdb
	bl SoundStop
	movs r0, #0xdc
	bl unk_3b1c
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
_08073576:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807357C: .4byte 0x030008B8
_08073580: .4byte 0x083EACAC

	thumb_func_start ParticleSuperMissileExplosionNoScreenShake
ParticleSuperMissileExplosionNoScreenShake: @ 0x08073584
	push {r4, lr}
	ldr r4, _080735B4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080735B8 @ =0x083EAA0C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080735A2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080735A2
	strb r0, [r4]
_080735A2:
	ldr r1, _080735B4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080735AE
	adds r0, #1
	strb r0, [r1, #3]
_080735AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080735B4: .4byte 0x030008B8
_080735B8: .4byte 0x083EAA0C

	thumb_func_start ParticleIceBeamTrail
ParticleIceBeamTrail: @ 0x080735BC
	push {r4, lr}
	ldr r4, _080735EC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080735F0 @ =0x0858E238
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080735DA
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080735DA
	strb r0, [r4]
_080735DA:
	ldr r1, _080735EC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080735E6
	adds r0, #1
	strb r0, [r1, #3]
_080735E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080735EC: .4byte 0x030008B8
_080735F0: .4byte 0x0858E238

	thumb_func_start ParticleChargedNormalBeamTrail
ParticleChargedNormalBeamTrail: @ 0x080735F4
	push {r4, lr}
	ldr r4, _08073624 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073628 @ =0x0858D83C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073612
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073612
	strb r0, [r4]
_08073612:
	ldr r1, _08073624 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807361E
	adds r0, #1
	strb r0, [r1, #3]
_0807361E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073624: .4byte 0x030008B8
_08073628: .4byte 0x0858D83C

	thumb_func_start ParticleChargedChargeBeamTrail
ParticleChargedChargeBeamTrail: @ 0x0807362C
	push {r4, lr}
	ldr r4, _0807365C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073660 @ =0x0858DA80
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807364A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807364A
	strb r0, [r4]
_0807364A:
	ldr r1, _0807365C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073656
	adds r0, #1
	strb r0, [r1, #3]
_08073656:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807365C: .4byte 0x030008B8
_08073660: .4byte 0x0858DA80

	thumb_func_start ParticleChargedWideBeamTrail
ParticleChargedWideBeamTrail: @ 0x08073664
	push {r4, lr}
	ldr r4, _08073694 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073698 @ =0x0858DCE4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073682
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073682
	strb r0, [r4]
_08073682:
	ldr r1, _08073694 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807368E
	adds r0, #1
	strb r0, [r1, #3]
_0807368E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073694: .4byte 0x030008B8
_08073698: .4byte 0x0858DCE4

	thumb_func_start ParticleChargedPlasmaBeamTrail
ParticleChargedPlasmaBeamTrail: @ 0x0807369C
	push {r4, lr}
	ldr r4, _080736CC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080736D0 @ =0x0858DE84
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080736BA
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080736BA
	strb r0, [r4]
_080736BA:
	ldr r1, _080736CC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080736C6
	adds r0, #1
	strb r0, [r1, #3]
_080736C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080736CC: .4byte 0x030008B8
_080736D0: .4byte 0x0858DE84

	thumb_func_start ParticleChargedWaveBeamTrail
ParticleChargedWaveBeamTrail: @ 0x080736D4
	push {r4, lr}
	ldr r4, _08073704 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073708 @ =0x0858DFDC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080736F2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080736F2
	strb r0, [r4]
_080736F2:
	ldr r1, _08073704 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080736FE
	adds r0, #1
	strb r0, [r1, #3]
_080736FE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073704: .4byte 0x030008B8
_08073708: .4byte 0x0858DFDC

	thumb_func_start ParticleChargedIceBeamTrail
ParticleChargedIceBeamTrail: @ 0x0807370C
	push {r4, lr}
	ldr r4, _0807373C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073740 @ =0x0858E278
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807372A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807372A
	strb r0, [r4]
_0807372A:
	ldr r1, _0807373C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073736
	adds r0, #1
	strb r0, [r1, #3]
_08073736:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807373C: .4byte 0x030008B8
_08073740: .4byte 0x0858E278

	thumb_func_start ParticleNormalMissileTrail
ParticleNormalMissileTrail: @ 0x08073744
	push {r4, lr}
	ldr r4, _0807377C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073780 @ =0x0858E888
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073762
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073762
	strb r0, [r4]
_08073762:
	ldr r2, _0807377C @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073776
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073776:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807377C: .4byte 0x030008B8
_08073780: .4byte 0x0858E888

	thumb_func_start ParticleSuperMissileTrail
ParticleSuperMissileTrail: @ 0x08073784
	push {r4, lr}
	ldr r4, _080737BC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080737C0 @ =0x0858E7F0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080737A2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080737A2
	strb r0, [r4]
_080737A2:
	ldr r2, _080737BC @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _080737B6
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_080737B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080737BC: .4byte 0x030008B8
_080737C0: .4byte 0x0858E7F0

	thumb_func_start ParticleIceMissileTrail
ParticleIceMissileTrail: @ 0x080737C4
	push {r4, lr}
	ldr r4, _080737FC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073800 @ =0x0858E8D8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080737E2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080737E2
	strb r0, [r4]
_080737E2:
	ldr r2, _080737FC @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _080737F6
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_080737F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080737FC: .4byte 0x030008B8
_08073800: .4byte 0x0858E8D8

	thumb_func_start ParticleDiffusionMissileTrail
ParticleDiffusionMissileTrail: @ 0x08073804
	push {r4, lr}
	ldr r4, _0807383C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073840 @ =0x0858E928
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073822
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073822
	strb r0, [r4]
_08073822:
	ldr r2, _0807383C @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073836
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073836:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807383C: .4byte 0x030008B8
_08073840: .4byte 0x0858E928

	thumb_func_start ParticleChargedDiffusionMissileTrail
ParticleChargedDiffusionMissileTrail: @ 0x08073844
	push {r4, lr}
	ldr r4, _0807387C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073880 @ =0x0858E9C8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073862
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073862
	strb r0, [r4]
_08073862:
	ldr r2, _0807387C @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073876
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073876:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807387C: .4byte 0x030008B8
_08073880: .4byte 0x0858E9C8

	thumb_func_start ParticleAbsordHealthX
ParticleAbsordHealthX: @ 0x08073884
	push {r4, r5, r6, lr}
	ldr r3, _080738B8 @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r5, r0, #1
	strb r5, [r3, #4]
	ldr r2, _080738BC @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _080738CC
	cmp r0, #1
	bgt _080738C0
	cmp r0, #0
	beq _080738C6
	b _08073914
	.align 2, 0
_080738B8: .4byte 0x030008B8
_080738BC: .4byte gSamusData
_080738C0:
	cmp r0, #2
	beq _080738F8
	b _08073914
_080738C6:
	movs r0, #1
	strb r0, [r4, #3]
	b _080738EC
_080738CC:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bls _080738EC
	movs r0, #2
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #6]
	strb r6, [r4, #1]
	ldr r0, _080738E8 @ =0x083EA76C
	bl ParticleUpdateAnimation
	b _08073918
	.align 2, 0
_080738E8: .4byte 0x083EA76C
_080738EC:
	ldr r0, _080738F4 @ =0x083EA664
	bl ParticleUpdateAnimation
	b _08073918
	.align 2, 0
_080738F4: .4byte 0x083EA664
_080738F8:
	ldr r0, _08073910 @ =0x083EA76C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073918
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073918
	strb r6, [r4]
	b _08073918
	.align 2, 0
_08073910: .4byte 0x083EA76C
_08073914:
	movs r0, #0
	strb r0, [r4]
_08073918:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleAbsorbMissileX
ParticleAbsorbMissileX: @ 0x08073920
	push {r4, r5, r6, lr}
	ldr r3, _08073954 @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r5, r0, #1
	strb r5, [r3, #4]
	ldr r2, _08073958 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _08073968
	cmp r0, #1
	bgt _0807395C
	cmp r0, #0
	beq _08073962
	b _080739B0
	.align 2, 0
_08073954: .4byte 0x030008B8
_08073958: .4byte gSamusData
_0807395C:
	cmp r0, #2
	beq _08073994
	b _080739B0
_08073962:
	movs r0, #1
	strb r0, [r4, #3]
	b _08073988
_08073968:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bls _08073988
	movs r0, #2
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #6]
	strb r6, [r4, #1]
	ldr r0, _08073984 @ =0x083EA8F4
	bl ParticleUpdateAnimation
	b _080739B4
	.align 2, 0
_08073984: .4byte 0x083EA8F4
_08073988:
	ldr r0, _08073990 @ =0x083EA7EC
	bl ParticleUpdateAnimation
	b _080739B4
	.align 2, 0
_08073990: .4byte 0x083EA7EC
_08073994:
	ldr r0, _080739AC @ =0x083EA8F4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080739B4
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080739B4
	strb r6, [r4]
	b _080739B4
	.align 2, 0
_080739AC: .4byte 0x083EA8F4
_080739B0:
	movs r0, #0
	strb r0, [r4]
_080739B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleAbsorbRedX
ParticleAbsorbRedX: @ 0x080739BC
	push {r4, r5, r6, lr}
	ldr r3, _080739F0 @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r5, r0, #1
	strb r5, [r3, #4]
	ldr r2, _080739F4 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _08073A04
	cmp r0, #1
	bgt _080739F8
	cmp r0, #0
	beq _080739FE
	b _08073A4C
	.align 2, 0
_080739F0: .4byte 0x030008B8
_080739F4: .4byte gSamusData
_080739F8:
	cmp r0, #2
	beq _08073A30
	b _08073A4C
_080739FE:
	movs r0, #1
	strb r0, [r4, #3]
	b _08073A24
_08073A04:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bls _08073A24
	movs r0, #2
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #6]
	strb r6, [r4, #1]
	ldr r0, _08073A20 @ =0x083EABCC
	bl ParticleUpdateAnimation
	b _08073A50
	.align 2, 0
_08073A20: .4byte 0x083EABCC
_08073A24:
	ldr r0, _08073A2C @ =0x083EAAC4
	bl ParticleUpdateAnimation
	b _08073A50
	.align 2, 0
_08073A2C: .4byte 0x083EAAC4
_08073A30:
	ldr r0, _08073A48 @ =0x083EABCC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073A50
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073A50
	strb r6, [r4]
	b _08073A50
	.align 2, 0
_08073A48: .4byte 0x083EABCC
_08073A4C:
	movs r0, #0
	strb r0, [r4]
_08073A50:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleAbsorbCoreX
ParticleAbsorbCoreX: @ 0x08073A58
	push {r4, r5, r6, lr}
	ldr r3, _08073A8C @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r5, r0, #1
	strb r5, [r3, #4]
	ldr r2, _08073A90 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	movs r6, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _08073AA0
	cmp r0, #1
	bgt _08073A94
	cmp r0, #0
	beq _08073A9A
	b _08073AE8
	.align 2, 0
_08073A8C: .4byte 0x030008B8
_08073A90: .4byte gSamusData
_08073A94:
	cmp r0, #2
	beq _08073ACC
	b _08073AE8
_08073A9A:
	movs r0, #1
	strb r0, [r4, #3]
	b _08073AC0
_08073AA0:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bls _08073AC0
	movs r0, #2
	strb r0, [r4, #3]
	movs r0, #0
	strh r0, [r4, #6]
	strb r6, [r4, #1]
	ldr r0, _08073ABC @ =0x083EAEDC
	bl ParticleUpdateAnimation
	b _08073AEC
	.align 2, 0
_08073ABC: .4byte 0x083EAEDC
_08073AC0:
	ldr r0, _08073AC8 @ =0x083EADD4
	bl ParticleUpdateAnimation
	b _08073AEC
	.align 2, 0
_08073AC8: .4byte 0x083EADD4
_08073ACC:
	ldr r0, _08073AE4 @ =0x083EAEDC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073AEC
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073AEC
	strb r6, [r4]
	b _08073AEC
	.align 2, 0
_08073AE4: .4byte 0x083EAEDC
_08073AE8:
	movs r0, #0
	strb r0, [r4]
_08073AEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleAbsorbIceXPreVaria
ParticleAbsorbIceXPreVaria: @ 0x08073AF4
	push {r4, lr}
	ldr r4, _08073B3C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r2, _08073B40 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	strh r0, [r4, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r4, #0xa]
	ldr r0, _08073B44 @ =0x083EAD14
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073B2A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073B2A
	movs r0, #0
	strb r0, [r4]
_08073B2A:
	ldr r1, _08073B3C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073B36
	adds r0, #1
	strb r0, [r1, #3]
_08073B36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073B3C: .4byte 0x030008B8
_08073B40: .4byte gSamusData
_08073B44: .4byte 0x083EAD14

	thumb_func_start ParticleIceXTrail
ParticleIceXTrail: @ 0x08073B48
	push {r4, lr}
	ldr r4, _08073B80 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073B84 @ =0x083EAF5C
	bl ParticleUpdateAnimation
	ldrb r0, [r4]
	movs r1, #0x20
	eors r0, r1
	strb r0, [r4]
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073B6E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073B6E
	strb r0, [r4]
_08073B6E:
	ldr r1, _08073B80 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073B7A
	adds r0, #1
	strb r0, [r1, #3]
_08073B7A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073B80: .4byte 0x030008B8
_08073B84: .4byte 0x083EAF5C

	thumb_func_start ParticleDiffusion
ParticleDiffusion: @ 0x08073B88
	push {r4, lr}
	ldr r4, _08073BB8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073BBC @ =0x083EAF94
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073BA6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073BA6
	strb r0, [r4]
_08073BA6:
	ldr r1, _08073BB8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073BB2
	adds r0, #1
	strb r0, [r1, #3]
_08073BB2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073BB8: .4byte 0x030008B8
_08073BBC: .4byte 0x083EAF94

	thumb_func_start ParticleFireBeam
ParticleFireBeam: @ 0x08073BC0
	push {r4, lr}
	ldr r4, _08073BF8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073BFC @ =0x083EA61C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073BDE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073BDE
	strb r0, [r4]
_08073BDE:
	ldr r2, _08073BF8 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073BF2
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073BF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073BF8: .4byte 0x030008B8
_08073BFC: .4byte 0x083EA61C

	thumb_func_start ParticleExplosion1
ParticleExplosion1: @ 0x08073C00
	push {r4, lr}
	ldr r4, _08073C30 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073C34 @ =0x083EA5E4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073C1E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073C1E
	strb r0, [r4]
_08073C1E:
	ldr r1, _08073C30 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073C2A
	adds r0, #1
	strb r0, [r1, #3]
_08073C2A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073C30: .4byte 0x030008B8
_08073C34: .4byte 0x083EA5E4

	thumb_func_start ParticleExplosion2
ParticleExplosion2: @ 0x08073C38
	push {r4, lr}
	ldr r4, _08073C68 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073C6C @ =0x083EA5AC
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073C56
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073C56
	strb r0, [r4]
_08073C56:
	ldr r1, _08073C68 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073C62
	adds r0, #1
	strb r0, [r1, #3]
_08073C62:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073C68: .4byte 0x030008B8
_08073C6C: .4byte 0x083EA5AC

	thumb_func_start ParticleExplosion3
ParticleExplosion3: @ 0x08073C70
	push {r4, lr}
	ldr r4, _08073CA0 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073CA4 @ =0x083EA9D4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073C8E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073C8E
	strb r0, [r4]
_08073C8E:
	ldr r1, _08073CA0 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073C9A
	adds r0, #1
	strb r0, [r1, #3]
_08073C9A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073CA0: .4byte 0x030008B8
_08073CA4: .4byte 0x083EA9D4

	thumb_func_start ParticleExplosion4
ParticleExplosion4: @ 0x08073CA8
	push {r4, lr}
	ldr r4, _08073CD8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073CDC @ =0x083EA99C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073CC6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073CC6
	strb r0, [r4]
_08073CC6:
	ldr r1, _08073CD8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073CD2
	adds r0, #1
	strb r0, [r1, #3]
_08073CD2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073CD8: .4byte 0x030008B8
_08073CDC: .4byte 0x083EA99C

	thumb_func_start ParticleExplosion5
ParticleExplosion5: @ 0x08073CE0
	push {r4, lr}
	ldr r4, _08073D10 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073D14 @ =0x083EAA9C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073CFE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073CFE
	strb r0, [r4]
_08073CFE:
	ldr r1, _08073D10 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073D0A
	adds r0, #1
	strb r0, [r1, #3]
_08073D0A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073D10: .4byte 0x030008B8
_08073D14: .4byte 0x083EAA9C

	thumb_func_start ParticleExplosion6
ParticleExplosion6: @ 0x08073D18
	push {r4, lr}
	ldr r4, _08073D50 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073D54 @ =0x083EAA74
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073D36
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073D36
	strb r0, [r4]
_08073D36:
	ldr r2, _08073D50 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073D4A
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
_08073D4A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073D50: .4byte 0x030008B8
_08073D54: .4byte 0x083EAA74

	thumb_func_start ParticleHeavyDust1
ParticleHeavyDust1: @ 0x08073D58
	push {r4, lr}
	ldr r4, _08073D88 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073D8C @ =0x083EC1A8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073D76
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073D76
	strb r0, [r4]
_08073D76:
	ldr r1, _08073D88 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073D82
	adds r0, #1
	strb r0, [r1, #3]
_08073D82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073D88: .4byte 0x030008B8
_08073D8C: .4byte 0x083EC1A8

	thumb_func_start ParticleHeavyDust2
ParticleHeavyDust2: @ 0x08073D90
	push {r4, lr}
	ldr r4, _08073DC8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073DCC @ =0x083EC1A8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073DAE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073DAE
	strb r0, [r4]
_08073DAE:
	ldr r2, _08073DC8 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073DC2
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073DC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073DC8: .4byte 0x030008B8
_08073DCC: .4byte 0x083EC1A8

	thumb_func_start ParticleEnterOrExitWater
ParticleEnterOrExitWater: @ 0x08073DD0
	push {r4, lr}
	ldr r4, _08073E08 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073E0C @ =0x083EC1F8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073DEE
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073DEE
	strb r0, [r4]
_08073DEE:
	ldr r2, _08073E08 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073E02
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073E02:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073E08: .4byte 0x030008B8
_08073E0C: .4byte 0x083EC1F8

	thumb_func_start ParticleEnterOrExitWaterBig
ParticleEnterOrExitWaterBig: @ 0x08073E10
	push {r4, lr}
	ldr r4, _08073E48 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073E4C @ =0x083EC348
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073E2E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073E2E
	strb r0, [r4]
_08073E2E:
	ldr r2, _08073E48 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073E42
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073E42:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073E48: .4byte 0x030008B8
_08073E4C: .4byte 0x083EC348

	thumb_func_start ParticleSpriteEnterOrExitWater
ParticleSpriteEnterOrExitWater: @ 0x08073E50
	push {r4, lr}
	ldr r4, _08073E88 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073E8C @ =0x083EC390
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073E6E
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073E6E
	strb r0, [r4]
_08073E6E:
	ldr r2, _08073E88 @ =0x030008B8
	ldrb r0, [r2, #3]
	cmp r0, #0
	bne _08073E82
	adds r0, #1
	strb r0, [r2, #3]
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08073E82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073E88: .4byte 0x030008B8
_08073E8C: .4byte 0x083EC390

	thumb_func_start unk_73e90
unk_73e90: @ 0x08073E90
	push {r4, lr}
	ldr r4, _08073EC8 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073ECC @ =0x083EC280
	bl ParticleUpdateAnimation
	ldr r0, _08073ED0 @ =gEffectYPosition
	ldrh r0, [r0]
	strh r0, [r4, #8]
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073EB6
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073EB6
	movs r0, #0
	strb r0, [r4]
_08073EB6:
	ldr r1, _08073EC8 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073EC2
	adds r0, #1
	strb r0, [r1, #3]
_08073EC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073EC8: .4byte 0x030008B8
_08073ECC: .4byte 0x083EC280
_08073ED0: .4byte gEffectYPosition

	thumb_func_start ParticleExplosionSmoke
ParticleExplosionSmoke: @ 0x08073ED4
	push {r4, lr}
	ldr r4, _08073F04 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073F08 @ =0x083EC1D0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073EF2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073EF2
	strb r0, [r4]
_08073EF2:
	ldr r1, _08073F04 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073EFE
	adds r0, #1
	strb r0, [r1, #3]
_08073EFE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073F04: .4byte 0x030008B8
_08073F08: .4byte 0x083EC1D0

	thumb_func_start ParticleTailExplosionSmoke
ParticleTailExplosionSmoke: @ 0x08073F0C
	push {r4, lr}
	ldr r4, _08073F3C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073F40 @ =0x083EDEE4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073F2A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073F2A
	strb r0, [r4]
_08073F2A:
	ldr r1, _08073F3C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073F36
	adds r0, #1
	strb r0, [r1, #3]
_08073F36:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073F3C: .4byte 0x030008B8
_08073F40: .4byte 0x083EDEE4

	thumb_func_start ParticleExplosion7
ParticleExplosion7: @ 0x08073F44
	push {r4, lr}
	ldr r4, _08073F74 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073F78 @ =0x083EDF14
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073F62
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073F62
	strb r0, [r4]
_08073F62:
	ldr r1, _08073F74 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073F6E
	adds r0, #1
	strb r0, [r1, #3]
_08073F6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073F74: .4byte 0x030008B8
_08073F78: .4byte 0x083EDF14

	thumb_func_start ParticleExplosion10
ParticleExplosion10: @ 0x08073F7C
	push {r4, lr}
	ldr r4, _08073FAC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073FB0 @ =0x083EE0B4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073F9A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073F9A
	strb r0, [r4]
_08073F9A:
	ldr r1, _08073FAC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073FA6
	adds r0, #1
	strb r0, [r1, #3]
_08073FA6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073FAC: .4byte 0x030008B8
_08073FB0: .4byte 0x083EE0B4

	thumb_func_start ParticleExplosion8
ParticleExplosion8: @ 0x08073FB4
	push {r4, lr}
	ldr r4, _08073FE4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08073FE8 @ =0x083EDD9C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08073FD2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08073FD2
	strb r0, [r4]
_08073FD2:
	ldr r1, _08073FE4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08073FDE
	adds r0, #1
	strb r0, [r1, #3]
_08073FDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073FE4: .4byte 0x030008B8
_08073FE8: .4byte 0x083EDD9C

	thumb_func_start ParticleSmoke
ParticleSmoke: @ 0x08073FEC
	push {r4, lr}
	ldr r4, _0807401C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074020 @ =0x083EDC9C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807400A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807400A
	strb r0, [r4]
_0807400A:
	ldr r1, _0807401C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074016
	adds r0, #1
	strb r0, [r1, #3]
_08074016:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807401C: .4byte 0x030008B8
_08074020: .4byte 0x083EDC9C

	thumb_func_start ParticleExplosion9
ParticleExplosion9: @ 0x08074024
	push {r4, lr}
	ldr r4, _08074054 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074058 @ =0x083EDCD4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074042
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074042
	strb r0, [r4]
_08074042:
	ldr r1, _08074054 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807404E
	adds r0, #1
	strb r0, [r1, #3]
_0807404E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074054: .4byte 0x030008B8
_08074058: .4byte 0x083EDCD4

	thumb_func_start ParticleTailSmoke1
ParticleTailSmoke1: @ 0x0807405C
	push {r4, lr}
	ldr r4, _0807408C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074090 @ =0x083EDD0C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807407A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807407A
	strb r0, [r4]
_0807407A:
	ldr r1, _0807408C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074086
	adds r0, #1
	strb r0, [r1, #3]
_08074086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807408C: .4byte 0x030008B8
_08074090: .4byte 0x083EDD0C

	thumb_func_start ParticleTailExplosion
ParticleTailExplosion: @ 0x08074094
	push {r4, lr}
	ldr r4, _080740C4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080740C8 @ =0x083EDD3C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080740B2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080740B2
	strb r0, [r4]
_080740B2:
	ldr r1, _080740C4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080740BE
	adds r0, #1
	strb r0, [r1, #3]
_080740BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080740C4: .4byte 0x030008B8
_080740C8: .4byte 0x083EDD3C

	thumb_func_start ParticleTailSmoke2
ParticleTailSmoke2: @ 0x080740CC
	push {r4, lr}
	ldr r4, _080740FC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074100 @ =0x083EDEA4
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080740EA
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080740EA
	strb r0, [r4]
_080740EA:
	ldr r1, _080740FC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080740F6
	adds r0, #1
	strb r0, [r1, #3]
_080740F6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080740FC: .4byte 0x030008B8
_08074100: .4byte 0x083EDEA4

	thumb_func_start ParticleOutwardIceExplosion
ParticleOutwardIceExplosion: @ 0x08074104
	push {r4, lr}
	ldr r4, _08074134 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074138 @ =0x083EC3E8
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074122
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074122
	strb r0, [r4]
_08074122:
	ldr r1, _08074134 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807412E
	adds r0, #1
	strb r0, [r1, #3]
_0807412E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074134: .4byte 0x030008B8
_08074138: .4byte 0x083EC3E8

	thumb_func_start ParticleOutwardSmoke
ParticleOutwardSmoke: @ 0x0807413C
	push {r4, lr}
	ldr r4, _0807416C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074170 @ =0x083EC4C0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807415A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807415A
	strb r0, [r4]
_0807415A:
	ldr r1, _0807416C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074166
	adds r0, #1
	strb r0, [r1, #3]
_08074166:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807416C: .4byte 0x030008B8
_08074170: .4byte 0x083EC4C0

	thumb_func_start ParticleScrewAttackKilled
ParticleScrewAttackKilled: @ 0x08074174
	push {r4, lr}
	ldr r4, _080741AC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080741B0 @ =0x083EC0C0
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074192
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074192
	strb r0, [r4]
_08074192:
	ldr r1, _080741AC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080741A6
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xa4
	lsls r0, r0, #1
	bl SoundPlay
_080741A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080741AC: .4byte 0x030008B8
_080741B0: .4byte 0x083EC0C0

	thumb_func_start ParticleSpeedboosterKilled
ParticleSpeedboosterKilled: @ 0x080741B4
	push {r4, lr}
	ldr r4, _080741EC @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080741F0 @ =0x083EC430
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080741D2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080741D2
	strb r0, [r4]
_080741D2:
	ldr r1, _080741EC @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080741E4
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, _080741F4 @ =0x00000149
	bl SoundPlay
_080741E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080741EC: .4byte 0x030008B8
_080741F0: .4byte 0x083EC430
_080741F4: .4byte 0x00000149

	thumb_func_start ParticleShinesparkKilled
ParticleShinesparkKilled: @ 0x080741F8
	push {r4, lr}
	ldr r4, _08074230 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074234 @ =0x083EC108
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074216
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074216
	strb r0, [r4]
_08074216:
	ldr r1, _08074230 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _0807422A
	adds r0, #1
	strb r0, [r1, #3]
	movs r0, #0xa4
	lsls r0, r0, #1
	bl SoundPlay
_0807422A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074230: .4byte 0x030008B8
_08074234: .4byte 0x083EC108

	thumb_func_start ParticleSudoScrewKilled
ParticleSudoScrewKilled: @ 0x08074238
	push {r4, lr}
	ldr r4, _08074270 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074274 @ =0x083EC478
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074256
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074256
	strb r0, [r4]
_08074256:
	ldr r1, _08074270 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074268
	adds r0, #1
	strb r0, [r1, #3]
	ldr r0, _08074278 @ =0x00000147
	bl SoundPlay
_08074268:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074270: .4byte 0x030008B8
_08074274: .4byte 0x083EC478
_08074278: .4byte 0x00000147

	thumb_func_start PlayBeamChargingSound
PlayBeamChargingSound: @ 0x0807427C
	push {lr}
	ldr r0, _08074294 @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r2, r1, #0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08074298
	movs r0, #0xe9
	bl SoundPlay
	b _080742CE
	.align 2, 0
_08074294: .4byte gEquipment
_08074298:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080742A8
	movs r0, #0xe7
	bl SoundPlay
	b _080742CE
_080742A8:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080742B8
	movs r0, #0xe5
	bl SoundPlay
	b _080742CE
_080742B8:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _080742C8
	movs r0, #0xe3
	bl SoundPlay
	b _080742CE
_080742C8:
	movs r0, #0xe1
	bl SoundPlay
_080742CE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StopBeamChargingSound
StopBeamChargingSound: @ 0x080742D4
	push {lr}
	ldr r0, _080742EC @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r2, r1, #0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080742F0
	movs r0, #0xe9
	bl SoundStop
	b _08074326
	.align 2, 0
_080742EC: .4byte gEquipment
_080742F0:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08074300
	movs r0, #0xe7
	bl SoundStop
	b _08074326
_08074300:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08074310
	movs r0, #0xe5
	bl SoundStop
	b _08074326
_08074310:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _08074320
	movs r0, #0xe3
	bl SoundStop
	b _08074326
_08074320:
	movs r0, #0xe1
	bl SoundStop
_08074326:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PlayBeamChargedSound
PlayBeamChargedSound: @ 0x0807432C
	push {lr}
	ldr r0, _08074344 @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r2, r1, #0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08074348
	movs r0, #0xea
	bl SoundPlay
	b _0807437E
	.align 2, 0
_08074344: .4byte gEquipment
_08074348:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08074358
	movs r0, #0xe8
	bl SoundPlay
	b _0807437E
_08074358:
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08074368
	movs r0, #0xe6
	bl SoundPlay
	b _0807437E
_08074368:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _08074378
	movs r0, #0xe4
	bl SoundPlay
	b _0807437E
_08074378:
	movs r0, #0xe2
	bl SoundPlay
_0807437E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleChargingBeam
ParticleChargingBeam: @ 0x08074384
	push {r4, r5, lr}
	ldr r1, _080743B0 @ =0x030008B8
	ldr r0, _080743B4 @ =gArmCannonY
	ldrh r0, [r0]
	strh r0, [r1, #8]
	ldr r0, _080743B8 @ =gArmCannonX
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldr r0, _080743BC @ =gSamusData
	ldrb r2, [r0, #0xc]
	adds r3, r1, #0
	adds r5, r0, #0
	cmp r2, #0xf
	bhi _080743C0
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r3, #3]
	cmp r0, #1
	bhi _08074464
	bl StopBeamChargingSound
	b _08074464
	.align 2, 0
_080743B0: .4byte 0x030008B8
_080743B4: .4byte gArmCannonY
_080743B8: .4byte gArmCannonX
_080743BC: .4byte gSamusData
_080743C0:
	ldrb r0, [r5, #1]
	cmp r0, #0x16
	beq _080743D8
	cmp r0, #0x16
	bgt _080743D0
	cmp r0, #0xb
	beq _080743D8
	b _080743E0
_080743D0:
	cmp r0, #0x1e
	bgt _080743E0
	cmp r0, #0x1d
	blt _080743E0
_080743D8:
	ldrb r1, [r3]
	movs r0, #8
	orrs r0, r1
	b _080743E6
_080743E0:
	ldrb r1, [r3]
	movs r0, #0xf7
	ands r0, r1
_080743E6:
	strb r0, [r3]
	adds r4, r3, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _08074410
	cmp r0, #1
	beq _08074430
	ldr r0, _0807440C @ =0x083EEBC0
	bl ParticleUpdateAnimation
	ldrb r1, [r4, #4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0807445C
	bl PlayBeamChargedSound
	b _0807445C
	.align 2, 0
_0807440C: .4byte 0x083EEBC0
_08074410:
	ldrb r1, [r4]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, #3]
	adds r0, #1
	strb r0, [r4, #3]
	ldr r0, _0807442C @ =0x083EEB28
	bl ParticleUpdateAnimation
	bl PlayBeamChargingSound
	b _08074464
	.align 2, 0
_0807442C: .4byte 0x083EEB28
_08074430:
	ldrb r0, [r5, #0xc]
	cmp r0, #0x3f
	bls _08074450
	movs r0, #2
	movs r1, #0
	strb r0, [r3, #3]
	movs r0, #0
	strh r1, [r3, #6]
	strb r0, [r3, #1]
	strb r0, [r3, #4]
	ldr r0, _0807444C @ =0x083EEBC0
	bl ParticleUpdateAnimation
	b _08074464
	.align 2, 0
_0807444C: .4byte 0x083EEBC0
_08074450:
	ldr r0, _08074458 @ =0x083EEB28
	bl ParticleUpdateAnimation
	b _08074464
	.align 2, 0
_08074458: .4byte 0x083EEB28
_0807445C:
	ldr r1, _0807446C @ =0x030008B8
	ldrb r0, [r1, #4]
	adds r0, #1
	strb r0, [r1, #4]
_08074464:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807446C: .4byte 0x030008B8

	thumb_func_start ParticleChargingMissiles
ParticleChargingMissiles: @ 0x08074470
	push {r4, lr}
	ldr r1, _08074494 @ =0x030008B8
	ldr r0, _08074498 @ =gArmCannonY
	ldrh r0, [r0]
	strh r0, [r1, #8]
	ldr r0, _0807449C @ =gArmCannonX
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldr r0, _080744A0 @ =gSamusData
	ldrb r2, [r0, #0xc]
	adds r3, r1, #0
	adds r4, r0, #0
	cmp r2, #0xf
	bhi _080744A4
	movs r0, #0
	strb r0, [r3]
	b _0807450A
	.align 2, 0
_08074494: .4byte 0x030008B8
_08074498: .4byte gArmCannonY
_0807449C: .4byte gArmCannonX
_080744A0: .4byte gSamusData
_080744A4:
	ldrb r0, [r4, #1]
	cmp r0, #0x16
	beq _080744BC
	cmp r0, #0x16
	bgt _080744B4
	cmp r0, #0xb
	beq _080744BC
	b _080744C4
_080744B4:
	cmp r0, #0x1e
	bgt _080744C4
	cmp r0, #0x1d
	blt _080744C4
_080744BC:
	ldrb r1, [r3]
	movs r0, #8
	orrs r0, r1
	b _080744CA
_080744C4:
	ldrb r1, [r3]
	movs r0, #0xf7
	ands r0, r1
_080744CA:
	strb r0, [r3]
	adds r2, r3, #0
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _080744DA
	cmp r0, #1
	beq _080744EA
	b _080744FC
_080744DA:
	ldrb r1, [r2]
	movs r0, #0x14
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r2, #3]
	adds r0, #1
	strb r0, [r2, #3]
	b _08074504
_080744EA:
	ldrb r0, [r4, #0xc]
	cmp r0, #0x3f
	bls _08074504
	movs r0, #2
	movs r1, #0
	strb r0, [r3, #3]
	movs r0, #0
	strh r1, [r3, #6]
	strb r0, [r3, #1]
_080744FC:
	ldr r0, _08074500 @ =0x083EEBE8
	b _08074506
	.align 2, 0
_08074500: .4byte 0x083EEBE8
_08074504:
	ldr r0, _08074510 @ =0x083EEC18
_08074506:
	bl ParticleUpdateAnimation
_0807450A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08074510: .4byte 0x083EEC18

	thumb_func_start ParticleAbsorbingSuit
ParticleAbsorbingSuit: @ 0x08074514
	push {r4, lr}
	ldr r4, _0807454C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074550 @ =gArmCannonY
	ldrh r0, [r0]
	strh r0, [r4, #8]
	ldr r0, _08074554 @ =gArmCannonX
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	ldr r0, _08074558 @ =0x083ED26C
	bl ParticleUpdateAnimation
	ldr r0, _0807455C @ =gSamusData
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	bne _0807453C
	movs r0, #0
	strb r0, [r4]
_0807453C:
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _08074546
	adds r0, #1
	strb r0, [r4, #3]
_08074546:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807454C: .4byte 0x030008B8
_08074550: .4byte gArmCannonY
_08074554: .4byte gArmCannonX
_08074558: .4byte 0x083ED26C
_0807455C: .4byte gSamusData

	thumb_func_start unk_74560
unk_74560: @ 0x08074560
	push {r4, r5, lr}
	ldr r1, _08074590 @ =0x030008B8
	ldr r0, _08074594 @ =gArmCannonY
	ldrh r0, [r0]
	strh r0, [r1, #8]
	ldr r0, _08074598 @ =gArmCannonX
	ldrh r0, [r0]
	strh r0, [r1, #0xa]
	ldr r0, _0807459C @ =0x030012F0
	ldrb r2, [r0, #0x13]
	adds r3, r1, #0
	adds r5, r0, #0
	cmp r2, #0xf
	bhi _080745A0
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r3, #3]
	cmp r0, #1
	bhi _08074650
	movs r0, #0xeb
	bl SoundStop
	b _08074650
	.align 2, 0
_08074590: .4byte 0x030008B8
_08074594: .4byte gArmCannonY
_08074598: .4byte gArmCannonX
_0807459C: .4byte 0x030012F0
_080745A0:
	ldr r0, _080745B4 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x16
	beq _080745C0
	cmp r0, #0x16
	bgt _080745B8
	cmp r0, #0xb
	beq _080745C0
	b _080745C8
	.align 2, 0
_080745B4: .4byte gSamusData
_080745B8:
	cmp r0, #0x1e
	bgt _080745C8
	cmp r0, #0x1d
	blt _080745C8
_080745C0:
	ldrb r1, [r3]
	movs r0, #8
	orrs r0, r1
	b _080745CE
_080745C8:
	ldrb r1, [r3]
	movs r0, #0xf7
	ands r0, r1
_080745CE:
	strb r0, [r3]
	adds r4, r3, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _080745F8
	cmp r0, #1
	beq _08074618
	ldr r0, _080745F4 @ =0x083EED58
	bl ParticleUpdateAnimation
	ldrb r1, [r4, #4]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08074648
	movs r0, #0xec
	bl SoundPlay
	b _08074648
	.align 2, 0
_080745F4: .4byte 0x083EED58
_080745F8:
	ldrb r1, [r4]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, #3]
	adds r0, #1
	strb r0, [r4, #3]
	ldr r0, _08074614 @ =0x083EEC40
	bl ParticleUpdateAnimation
	movs r0, #0xeb
	bl SoundPlay
	b _08074650
	.align 2, 0
_08074614: .4byte 0x083EEC40
_08074618:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _0807463C
	movs r0, #2
	movs r1, #0
	strb r0, [r3, #3]
	movs r0, #0
	strh r1, [r3, #6]
	strb r0, [r3, #1]
	strb r0, [r3, #4]
	ldr r0, _08074638 @ =0x083EED58
	bl ParticleUpdateAnimation
	b _08074650
	.align 2, 0
_08074638: .4byte 0x083EED58
_0807463C:
	ldr r0, _08074644 @ =0x083EEC40
	bl ParticleUpdateAnimation
	b _08074650
	.align 2, 0
_08074644: .4byte 0x083EEC40
_08074648:
	ldr r1, _08074658 @ =0x030008B8
	ldrb r0, [r1, #4]
	adds r0, #1
	strb r0, [r1, #4]
_08074650:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074658: .4byte 0x030008B8

	thumb_func_start ParticleDust1
ParticleDust1: @ 0x0807465C
	push {r4, lr}
	ldr r4, _0807468C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _08074690 @ =0x083EE164
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0807467A
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _0807467A
	strb r0, [r4]
_0807467A:
	ldr r1, _0807468C @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _08074686
	adds r0, #1
	strb r0, [r1, #3]
_08074686:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807468C: .4byte 0x030008B8
_08074690: .4byte 0x083EE164

	thumb_func_start ParticleDust2
ParticleDust2: @ 0x08074694
	push {r4, lr}
	ldr r4, _080746C4 @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r0, _080746C8 @ =0x083EE194
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _080746B2
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080746B2
	strb r0, [r4]
_080746B2:
	ldr r1, _080746C4 @ =0x030008B8
	ldrb r0, [r1, #3]
	cmp r0, #0
	bne _080746BE
	adds r0, #1
	strb r0, [r1, #3]
_080746BE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080746C4: .4byte 0x030008B8
_080746C8: .4byte 0x083EE194

	thumb_func_start ParticleEscape
ParticleEscape: @ 0x080746CC
	push {r4, r5, lr}
	ldr r5, _080746E0 @ =0x030008B8
	ldrb r0, [r5, #3]
	cmp r0, #1
	beq _08074704
	cmp r0, #1
	bgt _080746E4
	cmp r0, #0
	beq _080746EA
	b _08074758
	.align 2, 0
_080746E0: .4byte 0x030008B8
_080746E4:
	cmp r0, #2
	beq _08074742
	b _08074758
_080746EA:
	movs r4, #1
	strb r4, [r5, #3]
	ldrb r1, [r5]
	movs r0, #0x50
	orrs r0, r1
	strb r0, [r5]
	bl EscapeSetDigits
	ldr r0, _08074700 @ =gEscapeStatus
	strb r4, [r0]
	b _08074758
	.align 2, 0
_08074700: .4byte gEscapeStatus
_08074704:
	ldr r0, _08074724 @ =gEscapeStatus
	ldrb r0, [r0]
	cmp r0, #2
	bne _0807472C
	ldr r1, _08074728 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #3
	strb r0, [r5, #3]
	movs r0, #0xff
	strb r0, [r5, #4]
	bl unk_6dee8
	b _08074758
	.align 2, 0
_08074724: .4byte gEscapeStatus
_08074728: .4byte gPreventMovementTimer
_0807472C:
	cmp r0, #1
	bne _08074758
	bl EventCheckOn_EndEscape
	cmp r0, #0
	beq _08074758
	movs r0, #2
	strb r0, [r5, #3]
	movs r0, #0x20
	strb r0, [r5, #4]
	b _08074758
_08074742:
	ldrh r0, [r5, #8]
	subs r0, #2
	strh r0, [r5, #8]
	ldrb r0, [r5, #4]
	subs r0, #1
	strb r0, [r5, #4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08074758
	movs r0, #0
	strb r0, [r5]
_08074758:
	bl EscapeUpdateOam
	ldr r1, _08074768 @ =0x03000954
	ldr r0, _0807476C @ =gEscapeDigitsOam
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074768: .4byte 0x03000954
_0807476C: .4byte gEscapeDigitsOam

	thumb_func_start ParticleGettingSuit
ParticleGettingSuit: @ 0x08074770
	push {r4, r5, lr}
	ldr r3, _080747A8 @ =0x030008B8
	ldrb r0, [r3, #4]
	adds r0, #1
	strb r0, [r3, #4]
	ldr r2, _080747AC @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	subs r0, #0x20
	movs r5, #0
	strh r0, [r3, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r3, #0xa]
	ldrb r0, [r3, #3]
	adds r4, r3, #0
	cmp r0, #1
	beq _080747BC
	cmp r0, #1
	bgt _080747B0
	cmp r0, #0
	beq _080747B6
	b _08074804
	.align 2, 0
_080747A8: .4byte 0x030008B8
_080747AC: .4byte gSamusData
_080747B0:
	cmp r0, #2
	beq _080747E8
	b _08074804
_080747B6:
	movs r0, #1
	strb r0, [r4, #3]
	b _080747DC
_080747BC:
	ldr r0, _080747D4 @ =gPoseLock
	ldrb r1, [r0]
	cmp r1, #0
	bne _080747DC
	movs r0, #2
	strb r0, [r4, #3]
	strh r1, [r4, #6]
	strb r5, [r4, #1]
	ldr r0, _080747D8 @ =0x083ED26C
	bl ParticleUpdateAnimation
	b _08074808
	.align 2, 0
_080747D4: .4byte gPoseLock
_080747D8: .4byte 0x083ED26C
_080747DC:
	ldr r0, _080747E4 @ =0x083ED1E4
	bl ParticleUpdateAnimation
	b _08074808
	.align 2, 0
_080747E4: .4byte 0x083ED1E4
_080747E8:
	ldr r0, _08074800 @ =0x083ED26C
	bl ParticleUpdateAnimation
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08074808
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _08074808
	strb r5, [r4]
	b _08074808
	.align 2, 0
_08074800: .4byte 0x083ED26C
_08074804:
	movs r0, #0
	strb r0, [r4]
_08074808:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ParticleGettingSuitBeams
ParticleGettingSuitBeams: @ 0x08074810
	push {r4, lr}
	ldr r4, _0807485C @ =0x030008B8
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	ldr r2, _08074860 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	subs r0, #0x20
	strh r0, [r4, #8]
	ldrh r0, [r2, #0x16]
	strh r0, [r4, #0xa]
	ldr r0, _08074864 @ =0x083ED18C
	bl ParticleUpdateAnimation
	ldr r0, _08074868 @ =gPoseLock
	ldrb r0, [r0]
	cmp r0, #0
	bne _08074844
	movs r0, #0
	strb r0, [r4]
_08074844:
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _08074856
	adds r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4]
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
_08074856:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807485C: .4byte 0x030008B8
_08074860: .4byte gSamusData
_08074864: .4byte 0x083ED18C
_08074868: .4byte gPoseLock

	thumb_func_start UpdateMenuOamDataID
UpdateMenuOamDataID: @ 0x0807486C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _0807488C @ =gNonGameplayRam
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r3
	adds r0, r3, #0
	adds r0, #0x36
	movs r2, #0
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0807488C: .4byte gNonGameplayRam

	thumb_func_start EventSet
EventSet: @ 0x08074890
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _080748AC @ =gEventCounter
	strb r1, [r0]
	movs r4, #0
	cmp r1, #0x6b
	bls _080748A2
	b _08074B3A
_080748A2:
	lsls r0, r1, #2
	ldr r1, _080748B0 @ =_080748B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080748AC: .4byte gEventCounter
_080748B0: .4byte _080748B4
_080748B4: @ jump table
	.4byte _08074A64 @ case 0
	.4byte _08074B3A @ case 1
	.4byte _08074B3A @ case 2
	.4byte _08074A80 @ case 3
	.4byte _08074B3A @ case 4
	.4byte _08074B3A @ case 5
	.4byte _08074B3A @ case 6
	.4byte _08074B38 @ case 7
	.4byte _08074B3A @ case 8
	.4byte _08074B3A @ case 9
	.4byte _08074B38 @ case 10
	.4byte _08074B3A @ case 11
	.4byte _08074B3A @ case 12
	.4byte _08074B3A @ case 13
	.4byte _08074B3A @ case 14
	.4byte _08074B38 @ case 15
	.4byte _08074B3A @ case 16
	.4byte _08074B3A @ case 17
	.4byte _08074B3A @ case 18
	.4byte _08074A8C @ case 19
	.4byte _08074B3A @ case 20
	.4byte _08074B3A @ case 21
	.4byte _08074B38 @ case 22
	.4byte _08074B3A @ case 23
	.4byte _08074B3A @ case 24
	.4byte _08074B38 @ case 25
	.4byte _08074B3A @ case 26
	.4byte _08074B3A @ case 27
	.4byte _08074B3A @ case 28
	.4byte _08074B38 @ case 29
	.4byte _08074B3A @ case 30
	.4byte _08074B3A @ case 31
	.4byte _08074B3A @ case 32
	.4byte _08074B3A @ case 33
	.4byte _08074B3A @ case 34
	.4byte _08074AA0 @ case 35
	.4byte _08074B3A @ case 36
	.4byte _08074B3A @ case 37
	.4byte _08074B38 @ case 38
	.4byte _08074B3A @ case 39
	.4byte _08074B3A @ case 40
	.4byte _08074B3A @ case 41
	.4byte _08074B3A @ case 42
	.4byte _08074B3A @ case 43
	.4byte _08074B3A @ case 44
	.4byte _08074B3A @ case 45
	.4byte _08074B3A @ case 46
	.4byte _08074B3A @ case 47
	.4byte _08074B3A @ case 48
	.4byte _08074B3A @ case 49
	.4byte _08074B3A @ case 50
	.4byte _08074B38 @ case 51
	.4byte _08074B3A @ case 52
	.4byte _08074B3A @ case 53
	.4byte _08074B3A @ case 54
	.4byte _08074AB4 @ case 55
	.4byte _08074B3A @ case 56
	.4byte _08074B3A @ case 57
	.4byte _08074B38 @ case 58
	.4byte _08074B3A @ case 59
	.4byte _08074B38 @ case 60
	.4byte _08074B3A @ case 61
	.4byte _08074B3A @ case 62
	.4byte _08074B3A @ case 63
	.4byte _08074B3A @ case 64
	.4byte _08074B3A @ case 65
	.4byte _08074B38 @ case 66
	.4byte _08074B3A @ case 67
	.4byte _08074B3A @ case 68
	.4byte _08074B3A @ case 69
	.4byte _08074AEE @ case 70
	.4byte _08074B3A @ case 71
	.4byte _08074B3A @ case 72
	.4byte _08074B38 @ case 73
	.4byte _08074B3A @ case 74
	.4byte _08074B3A @ case 75
	.4byte _08074AE4 @ case 76
	.4byte _08074B3A @ case 77
	.4byte _08074B10 @ case 78
	.4byte _08074B3A @ case 79
	.4byte _08074B3A @ case 80
	.4byte _08074B38 @ case 81
	.4byte _08074B3A @ case 82
	.4byte _08074AC8 @ case 83
	.4byte _08074B3A @ case 84
	.4byte _08074B3A @ case 85
	.4byte _08074B38 @ case 86
	.4byte _08074B3A @ case 87
	.4byte _08074B3A @ case 88
	.4byte _08074B3A @ case 89
	.4byte _08074B3A @ case 90
	.4byte _08074B38 @ case 91
	.4byte _08074B3A @ case 92
	.4byte _08074B3A @ case 93
	.4byte _08074B3A @ case 94
	.4byte _08074B3A @ case 95
	.4byte _08074B38 @ case 96
	.4byte _08074B3A @ case 97
	.4byte _08074B3A @ case 98
	.4byte _08074B3A @ case 99
	.4byte _08074B3A @ case 100
	.4byte _08074B3A @ case 101
	.4byte _08074B3A @ case 102
	.4byte _08074B3A @ case 103
	.4byte _08074B3A @ case 104
	.4byte _08074B3A @ case 105
	.4byte _08074B3A @ case 106
	.4byte _08074B38 @ case 107
_08074A64:
	ldr r0, _08074A78 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08074B3A
	ldr r1, _08074A7C @ =gEquipment
	movs r0, #0xff
	strb r0, [r1, #0xd]
	b _08074B3E
	.align 2, 0
_08074A78: .4byte gPauseScreenFlag
_08074A7C: .4byte gEquipment
_08074A80:
	ldr r0, _08074A88 @ =gEquipment
	movs r1, #0
	strb r1, [r0, #0xd]
	b _08074AFC
	.align 2, 0
_08074A88: .4byte gEquipment
_08074A8C:
	ldr r2, _08074A98 @ =gEquipment
	ldr r1, _08074A9C @ =0x085760C8
	ldrb r0, [r1]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #4]
	b _08074AD2
	.align 2, 0
_08074A98: .4byte gEquipment
_08074A9C: .4byte 0x085760C8
_08074AA0:
	ldr r2, _08074AAC @ =gEquipment
	ldr r1, _08074AB0 @ =0x085760C8
	ldrb r0, [r1, #8]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0xc]
	b _08074AD2
	.align 2, 0
_08074AAC: .4byte gEquipment
_08074AB0: .4byte 0x085760C8
_08074AB4:
	ldr r2, _08074AC0 @ =gEquipment
	ldr r1, _08074AC4 @ =0x085760C8
	ldrb r0, [r1, #0x10]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0x14]
	b _08074AD2
	.align 2, 0
_08074AC0: .4byte gEquipment
_08074AC4: .4byte 0x085760C8
_08074AC8:
	ldr r2, _08074ADC @ =gEquipment
	ldr r1, _08074AE0 @ =0x085760C8
	ldrb r0, [r1, #0x18]
	strb r0, [r2, #0xd]
	ldrb r0, [r1, #0x1c]
_08074AD2:
	movs r1, #0xa
	bl SetSubEventAndUpdateMusic
	b _08074B3A
	.align 2, 0
_08074ADC: .4byte gEquipment
_08074AE0: .4byte 0x085760C8
_08074AE4:
	movs r0, #0x71
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	b _08074B3A
_08074AEE:
	ldr r1, _08074B04 @ =gSecurityHatchLevelBackup
	ldr r2, _08074B08 @ =gEquipment
	ldrb r0, [r2, #0xd]
	strb r0, [r1]
	movs r1, #0xff
	orrs r0, r1
	strb r0, [r2, #0xd]
_08074AFC:
	ldr r0, _08074B0C @ =gSecurityHatchLevel
	strb r1, [r0]
	b _08074B3A
	.align 2, 0
_08074B04: .4byte gSecurityHatchLevelBackup
_08074B08: .4byte gEquipment
_08074B0C: .4byte gSecurityHatchLevel
_08074B10:
	ldr r2, _08074B2C @ =gSecurityHatchLevelBackup
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _08074B3E
	ldr r0, _08074B30 @ =gEquipment
	strb r1, [r0, #0xd]
	movs r0, #0xff
	strb r0, [r2]
	ldr r1, _08074B34 @ =gCurrentEventBasedEffect
	movs r0, #2
	strb r0, [r1]
	b _08074B3E
	.align 2, 0
_08074B2C: .4byte gSecurityHatchLevelBackup
_08074B30: .4byte gEquipment
_08074B34: .4byte gCurrentEventBasedEffect
_08074B38:
	movs r4, #1
_08074B3A:
	cmp r4, #0
	beq _08074BA0
_08074B3E:
	movs r4, #0x12
	ldr r3, _08074B78 @ =gEventCounter
	ldr r2, _08074B7C @ =0x08575FA0
_08074B44:
	adds r1, r4, r2
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08074B9A
	ldr r0, _08074B80 @ =gAbilityCount
	strb r4, [r0]
	ldr r3, _08074B84 @ =gEquipment
	ldr r1, _08074B88 @ =0x08575FB4
	lsls r0, r4, #3
	adds r2, r0, r1
	ldrb r0, [r3, #0xa]
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r3, #0xa]
	ldrb r0, [r3, #0xb]
	ldrb r1, [r2, #1]
	orrs r0, r1
	strb r0, [r3, #0xb]
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _08074B8C
	bl RecoveringSuitInit
	b _08074B94
	.align 2, 0
_08074B78: .4byte gEventCounter
_08074B7C: .4byte 0x08575FA0
_08074B80: .4byte gAbilityCount
_08074B84: .4byte gEquipment
_08074B88: .4byte 0x08575FB4
_08074B8C:
	ldrb r0, [r3, #0xc]
	ldrb r1, [r2, #2]
	orrs r0, r1
	strb r0, [r3, #0xc]
_08074B94:
	bl UpdateSubEventCounterAfterAbility
	b _08074BA0
_08074B9A:
	subs r4, #1
	cmp r4, #0
	bne _08074B44
_08074BA0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CheckPlayCutsceneDuringTransition
CheckPlayCutsceneDuringTransition: @ 0x08074BA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	mov r8, r0
	ldr r0, _08074BEC @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _08074BFC
	ldr r0, _08074BF0 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5d
	beq _08074BC8
	b _08074CE0
_08074BC8:
	cmp r6, #0x4d
	beq _08074BCE
	b _08074CE0
_08074BCE:
	ldr r0, _08074BF4 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	beq _08074BD8
	b _08074CE0
_08074BD8:
	ldr r1, _08074BF8 @ =gCurrentCutscene
	movs r0, #0xa
	strb r0, [r1]
	movs r0, #0x8d
	movs r1, #4
	bl SetSubEventAndUpdateMusic
	movs r1, #3
	mov r8, r1
	b _08074CE0
	.align 2, 0
_08074BEC: .4byte gSamusData
_08074BF0: .4byte gEventCounter
_08074BF4: .4byte gCurrentArea
_08074BF8: .4byte gCurrentCutscene
_08074BFC:
	movs r5, #0
	movs r1, #0
	ldr r7, _08074C34 @ =gEventCounter
	mov ip, r7
	ldr r2, _08074C38 @ =0x083C8BFC
	ldr r4, _08074C3C @ =0x08576098
	ldr r3, _08074C40 @ =gCurrentArea
_08074C0A:
	mov r7, ip
	ldrb r0, [r7]
	ldrb r7, [r4]
	cmp r0, r7
	bne _08074CB4
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08074C44
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #2]
	ldrb r3, [r3]
	cmp r0, r3
	bne _08074C5A
	ldrb r0, [r1, #3]
	cmp r0, r6
	bne _08074C5A
	movs r5, #1
	b _08074C5E
	.align 2, 0
_08074C34: .4byte gEventCounter
_08074C38: .4byte 0x083C8BFC
_08074C3C: .4byte 0x08576098
_08074C40: .4byte gCurrentArea
_08074C44:
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	ldrb r3, [r3]
	cmp r0, r3
	bne _08074C5A
	ldrb r0, [r1, #1]
	cmp r0, r6
	bne _08074C5A
	movs r5, #1
_08074C5A:
	cmp r5, #0
	beq _08074CE0
_08074C5E:
	ldr r0, _08074CA4 @ =gPreviousCutscene
	ldrb r2, [r4, #3]
	ldrb r0, [r0]
	adds r1, r2, #0
	cmp r0, r1
	beq _08074CBC
	ldr r0, _08074CA8 @ =gCurrentCutscene
	strb r2, [r0]
	movs r0, #1
	mov r8, r0
	cmp r1, #9
	bne _08074C90
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	ldr r1, _08074CAC @ =gPreviousNavigationConversation
	movs r0, #0xfe
	strb r0, [r1]
	ldr r1, _08074CB0 @ =0x03000B85
	movs r0, #0
	strb r0, [r1]
_08074C90:
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _08074CBC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #4
	bl SetSubEventAndUpdateMusic
	b _08074CBC
	.align 2, 0
_08074CA4: .4byte gPreviousCutscene
_08074CA8: .4byte gCurrentCutscene
_08074CAC: .4byte gPreviousNavigationConversation
_08074CB0: .4byte 0x03000B85
_08074CB4:
	adds r4, #8
	adds r1, #1
	cmp r1, #5
	ble _08074C0A
_08074CBC:
	cmp r5, #0
	bne _08074CE0
	ldr r0, _08074CEC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08074CE0
	cmp r6, #0x22
	bne _08074CE0
	ldr r0, _08074CF0 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	bne _08074CE0
	movs r0, #0x11
	movs r1, #4
	bl SetSubEventAndUpdateMusic
	movs r7, #2
	mov r8, r7
_08074CE0:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08074CEC: .4byte gEventCounter
_08074CF0: .4byte gCurrentArea

	thumb_func_start CheckUpdateEventAfterCutscene
CheckUpdateEventAfterCutscene: @ 0x08074CF4
	push {r4, lr}
	ldr r0, _08074D18 @ =gPreviousCutscene
	ldr r2, _08074D1C @ =gCurrentCutscene
	ldrb r1, [r2]
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r4, r2, #0
	cmp r1, #7
	bne _08074D0E
	movs r0, #0x62
	bl EventSet
_08074D0E:
	ldrb r0, [r4]
	cmp r0, #0xa
	bne _08074D20
	movs r0, #0x8e
	b _08074D36
	.align 2, 0
_08074D18: .4byte gPreviousCutscene
_08074D1C: .4byte gCurrentCutscene
_08074D20:
	movs r2, #0
	ldr r1, _08074D40 @ =0x08576098
_08074D24:
	ldrb r0, [r4]
	ldrb r3, [r1, #3]
	cmp r0, r3
	bne _08074D44
	ldrh r0, [r1, #6]
	cmp r0, #0
	beq _08074D4C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08074D36:
	movs r1, #5
	bl SetSubEventAndUpdateMusic
	b _08074D4C
	.align 2, 0
_08074D40: .4byte 0x08576098
_08074D44:
	adds r1, #8
	adds r2, #1
	cmp r2, #5
	ble _08074D24
_08074D4C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CheckRoomHasEventTrigger
CheckRoomHasEventTrigger: @ 0x08074D54
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _08074D9C @ =gEventCounter
	ldrb r0, [r0]
	adds r3, r0, #1
	ldr r1, _08074DA0 @ =gRoomEventTrigger
	movs r0, #0
	strb r0, [r1]
	movs r5, #0
	ldr r4, _08074DA4 @ =0x08575A60
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r4
_08074D72:
	ldrb r0, [r2, #7]
	cmp r0, #0
	bne _08074DAC
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08074DAC
	ldr r0, _08074DA8 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r4, [r2]
	cmp r0, r4
	bne _08074DAC
	ldrb r0, [r2, #1]
	cmp r6, r0
	bne _08074DAC
	ldrb r0, [r2, #2]
	cmp r0, #0xff
	beq _08074DF4
	strb r3, [r1]
	b _08074DBC
	.align 2, 0
_08074D9C: .4byte gEventCounter
_08074DA0: .4byte gRoomEventTrigger
_08074DA4: .4byte 0x08575A60
_08074DA8: .4byte gCurrentArea
_08074DAC:
	ldrb r0, [r2, #8]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _08074DBC
	adds r2, #0xc
	adds r3, #1
	adds r5, #1
	b _08074D72
_08074DBC:
	cmp r5, #0
	beq _08074E1C
	ldr r0, _08074DE8 @ =gEventCounter
	ldrb r3, [r0]
	cmp r3, #0
	ble _08074E1C
	ldr r0, _08074DEC @ =0x08575A60
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r2, [r1, #6]
	ldrb r1, [r1, #6]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r4, r0, #0
	cmp r1, #0
	beq _08074DFE
	ldr r0, _08074DF0 @ =gPreviousNavigationConversation
	strb r2, [r0]
	b _08074E1C
	.align 2, 0
_08074DE8: .4byte gEventCounter
_08074DEC: .4byte 0x08575A60
_08074DF0: .4byte gPreviousNavigationConversation
_08074DF4:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	b _08074DBC
_08074DFE:
	subs r3, #1
	cmp r3, #0
	ble _08074E1C
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #6]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08074DFE
	ldr r0, _08074E24 @ =gPreviousNavigationConversation
	strb r1, [r0]
_08074E1C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08074E24: .4byte gPreviousNavigationConversation

	thumb_func_start CheckRoomEventTrigger
CheckRoomEventTrigger: @ 0x08074E28
	push {r4, lr}
	ldr r2, _08074E7C @ =0x08575A60
	ldr r4, _08074E80 @ =gRoomEventTrigger
	movs r1, #0
	ldrsb r1, [r4, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1, #2]
	lsls r0, r0, #6
	ldr r3, _08074E84 @ =gSamusData
	ldrh r2, [r3, #0x16]
	cmp r0, r2
	bgt _08074EA6
	ldrb r0, [r1, #4]
	lsls r0, r0, #6
	cmp r0, r2
	blt _08074EA6
	ldrb r0, [r1, #3]
	lsls r0, r0, #6
	ldrh r2, [r3, #0x18]
	cmp r0, r2
	bgt _08074EA6
	ldrb r0, [r1, #5]
	lsls r0, r0, #6
	cmp r0, r2
	blt _08074EA6
	ldrb r0, [r4]
	bl EventSet
	movs r0, #0
	strb r0, [r4]
	ldr r0, _08074E88 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5c
	bne _08074E8C
	movs r0, #0xfa
	bl SoundPlay
	movs r0, #0x8b
	b _08074E92
	.align 2, 0
_08074E7C: .4byte 0x08575A60
_08074E80: .4byte gRoomEventTrigger
_08074E84: .4byte gSamusData
_08074E88: .4byte gEventCounter
_08074E8C:
	cmp r0, #0x59
	bne _08074E9A
	movs r0, #0x85
_08074E92:
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	b _08074EA6
_08074E9A:
	cmp r0, #0x5a
	bne _08074EA6
	movs r0, #0x86
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
_08074EA6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CheckSetNavigationRoomEvent
CheckSetNavigationRoomEvent: @ 0x08074EAC
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _08074F18 @ =0x08575A60
	ldr r0, _08074F1C @ =gEventCounter
	ldrb r0, [r0]
	adds r3, r0, #1
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	ldrb r0, [r1, #7]
	cmp r0, #0
	beq _08074EF6
	ldr r4, _08074F20 @ =0x0857604C
	lsls r2, r0, #1
	adds r0, r2, r4
	ldr r1, _08074F24 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08074EDA
	cmp r0, #0xff
	bne _08074EF6
_08074EDA:
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r2, [r0]
	subs r1, r2, #1
	ldr r0, _08074F28 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r1, r0
	beq _08074EEE
	cmp r2, #0xff
	bne _08074EF6
_08074EEE:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
_08074EF6:
	ldr r0, _08074F24 @ =gCurrentArea
	movs r2, #1
	ldrb r0, [r0]
	lsls r2, r0
	ldr r3, _08074F2C @ =gEquipment
	ldrb r1, [r3, #0xe]
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	bne _08074F10
	orrs r1, r2
	strb r1, [r3, #0xe]
	movs r5, #1
_08074F10:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08074F18: .4byte 0x08575A60
_08074F1C: .4byte gEventCounter
_08074F20: .4byte 0x0857604C
_08074F24: .4byte gCurrentArea
_08074F28: .4byte gCurrentRoom
_08074F2C: .4byte gEquipment

	thumb_func_start CheckDownloadedDataItem
CheckDownloadedDataItem: @ 0x08074F30
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r4, #0
	ldr r1, _08074F68 @ =0x08575A60
	ldr r0, _08074F6C @ =gEventCounter
	ldrb r0, [r0]
	adds r2, r0, #1
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08074F5E
	cmp r3, #0
	beq _08074F5C
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
_08074F5C:
	movs r4, #1
_08074F5E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08074F68: .4byte 0x08575A60
_08074F6C: .4byte gEventCounter

	thumb_func_start CheckOrUnlockSecurityLevel
CheckOrUnlockSecurityLevel: @ 0x08074F70
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	ldr r0, _08074F98 @ =gEquipment
	ldrb r4, [r0, #0xd]
	cmp r4, #0xff
	bne _08074F82
	movs r4, #0
_08074F82:
	movs r5, #0
	movs r3, #0
	ldr r0, _08074F9C @ =gCurrentArea
	ldr r1, _08074FA0 @ =0x085760C8
	ldrb r2, [r0]
	adds r6, r0, #0
	ldrb r0, [r1, #1]
	cmp r2, r0
	bne _08074FA4
	ldrb r5, [r1]
	b _08074FB8
	.align 2, 0
_08074F98: .4byte gEquipment
_08074F9C: .4byte gCurrentArea
_08074FA0: .4byte 0x085760C8
_08074FA4:
	adds r3, #1
	cmp r3, #3
	bgt _08074FB8
	lsls r0, r3, #3
	adds r2, r0, r1
	ldrb r0, [r6]
	ldrb r7, [r2, #1]
	cmp r0, r7
	bne _08074FA4
	ldrb r5, [r2]
_08074FB8:
	cmp r4, r5
	blt _08074FC0
	movs r0, #0
	b _08074FF4
_08074FC0:
	ldr r2, _08074FEC @ =gEventCounter
	lsls r0, r3, #3
	adds r1, r0, r1
	ldrb r0, [r2]
	ldrb r3, [r1, #2]
	cmp r0, r3
	bne _08074FF0
	mov r7, ip
	cmp r7, #0
	beq _08074FF2
	adds r0, #1
	ldrb r1, [r1, #3]
	cmp r0, r1
	bne _08074FF2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	movs r0, #2
	bl SetCurrentEventBasedEffect
	b _08074FF2
	.align 2, 0
_08074FEC: .4byte gEventCounter
_08074FF0:
	movs r5, #0
_08074FF2:
	adds r0, r5, #0
_08074FF4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start LoadInitialMinimap
LoadInitialMinimap: @ 0x08074FFC
	push {r4, r5, lr}
	ldr r5, _08075060 @ =gPreviousArea
	ldrb r0, [r5]
	ldr r4, _08075064 @ =0x02034000
	adds r1, r4, #0
	bl GetMinimapData
	ldr r1, _08075068 @ =0x040000D4
	str r4, [r1]
	ldr r0, _0807506C @ =0x02034800
	str r0, [r1, #4]
	ldr r0, _08075070 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r5]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _08075074 @ =gSamusData
	ldrh r0, [r1, #0x16]
	subs r0, #0x80
	asrs r0, r0, #6
	ldrh r4, [r1, #0x18]
	subs r4, #0x80
	asrs r4, r4, #6
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	ldr r3, _08075078 @ =0x03000031
	ldr r1, _0807507C @ =0x0879B8BC
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r1, r1, r5
	strb r1, [r3]
	ldr r3, _08075080 @ =0x03000032
	adds r2, #0x36
	ldrb r1, [r2]
	adds r1, r1, r0
	strb r1, [r3]
	bl MinimapSetTileAsExplored
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075060: .4byte gPreviousArea
_08075064: .4byte 0x02034000
_08075068: .4byte 0x040000D4
_0807506C: .4byte 0x02034800
_08075070: .4byte 0x80000400
_08075074: .4byte gSamusData
_08075078: .4byte 0x03000031
_0807507C: .4byte 0x0879B8BC
_08075080: .4byte 0x03000032

	thumb_func_start MinimapUpdate
MinimapUpdate: @ 0x08075084
	push {lr}
	bl MinimapCheckForUnexploredTile
	ldr r0, _080750A4 @ =gMinimapUpdateFlag
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807509A
	bl MinimapSetTileAsExplored
	bl MinimapUpdateForExploredTiles
_0807509A:
	bl MinimapDraw
	pop {r0}
	bx r0
	.align 2, 0
_080750A4: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapSetTileAsExplored
MinimapSetTileAsExplored: @ 0x080750A8
	push {lr}
	ldr r1, _080750D8 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _080750D4
	adds r2, r0, #0
	ldr r0, _080750DC @ =0x03000032
	lsls r2, r2, #5
	ldrb r0, [r0]
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080750E0 @ =0x02037C00
	adds r2, r2, r0
	ldr r1, _080750E4 @ =0x0879BDDC
	ldr r0, _080750E8 @ =0x03000031
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_080750D4:
	pop {r0}
	bx r0
	.align 2, 0
_080750D8: .4byte gCurrentArea
_080750DC: .4byte 0x03000032
_080750E0: .4byte 0x02037C00
_080750E4: .4byte 0x0879BDDC
_080750E8: .4byte 0x03000031

	thumb_func_start MinimapCheckForUnexploredTile
MinimapCheckForUnexploredTile: @ 0x080750EC
	push {r4, r5, r6, lr}
	ldr r0, _0807511C @ =gMinimapUpdateFlag
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _080751AC
	ldr r1, _08075120 @ =gSamusData
	ldrh r3, [r1, #0x16]
	adds r0, r3, #0
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r1, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08075124
	movs r4, #0
	b _0807513C
	.align 2, 0
_0807511C: .4byte gMinimapUpdateFlag
_08075120: .4byte gSamusData
_08075124:
	ldr r0, _0807514C @ =gBackgroundsData
	ldrh r0, [r0, #0x1c]
	lsls r0, r0, #0x16
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	cmp r3, r2
	blo _0807513C
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0807513C:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08075150
	movs r5, #0
	b _0807516A
	.align 2, 0
_0807514C: .4byte gBackgroundsData
_08075150:
	ldr r0, _080751B4 @ =gBackgroundsData
	ldrh r0, [r0, #0x1e]
	lsls r0, r0, #0x16
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	ldrh r0, [r1, #0x18]
	cmp r0, r2
	blo _0807516A
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807516A:
	lsrs r4, r4, #6
	lsrs r5, r5, #6
	adds r0, r4, #0
	movs r1, #0xf
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _080751B8 @ =0x03000031
	ldrb r1, [r2]
	ldr r3, _080751BC @ =gCurrentRoomEntry
	ldrb r0, [r3, #0xe]
	adds r0, r4, r0
	cmp r1, r0
	beq _0807519A
	strb r0, [r2]
	movs r0, #3
	strb r0, [r6]
_0807519A:
	ldr r2, _080751C0 @ =0x03000032
	ldrb r1, [r2]
	ldrb r0, [r3, #0xf]
	adds r0, r5, r0
	cmp r1, r0
	beq _080751AC
	strb r0, [r2]
	movs r0, #3
	strb r0, [r6]
_080751AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080751B4: .4byte gBackgroundsData
_080751B8: .4byte 0x03000031
_080751BC: .4byte gCurrentRoomEntry
_080751C0: .4byte 0x03000032

	thumb_func_start MinimapCheckOnTransition
MinimapCheckOnTransition: @ 0x080751C4
	push {r4, r5, lr}
	ldr r0, _0807524C @ =gCurrentArea
	ldrb r1, [r0]
	adds r2, r0, #0
	ldr r5, _08075250 @ =gPreviousArea
	cmp r1, #0
	bne _080751E2
	ldr r0, _08075254 @ =gCurrentCutscene
	ldrb r0, [r0]
	cmp r0, #0
	beq _080751E2
	cmp r0, #0xa
	bne _080751E2
	movs r0, #0x80
	strb r0, [r5]
_080751E2:
	ldrb r1, [r2]
	ldrb r0, [r5]
	cmp r0, r1
	beq _08075214
	strb r1, [r5]
	ldrb r0, [r5]
	ldr r4, _08075258 @ =0x02034000
	adds r1, r4, #0
	bl GetMinimapData
	ldr r1, _0807525C @ =0x040000D4
	str r4, [r1]
	ldr r0, _08075260 @ =0x02034800
	str r0, [r1, #4]
	ldr r0, _08075264 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r5]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r0, _08075268 @ =0x03000031
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0807526C @ =0x03000032
	strb r1, [r0]
_08075214:
	ldr r4, _08075270 @ =gMinimapUpdateFlag
	movs r0, #0
	strb r0, [r4]
	bl MinimapCheckForUnexploredTile
	ldrb r0, [r4]
	cmp r0, #3
	bne _0807522C
	bl MinimapSetTileAsExplored
	bl MinimapUpdateForExploredTiles
_0807522C:
	movs r0, #1
	strb r0, [r4]
	bl MinimapDraw
	movs r0, #2
	strb r0, [r4]
	bl MinimapDraw
	movs r0, #3
	strb r0, [r4]
	bl MinimapDraw
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807524C: .4byte gCurrentArea
_08075250: .4byte gPreviousArea
_08075254: .4byte gCurrentCutscene
_08075258: .4byte 0x02034000
_0807525C: .4byte 0x040000D4
_08075260: .4byte 0x02034800
_08075264: .4byte 0x80000400
_08075268: .4byte 0x03000031
_0807526C: .4byte 0x03000032
_08075270: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapDraw
MinimapDraw: @ 0x08075274
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _08075298 @ =gMinimapUpdateFlag
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0807535A
	ldr r0, _0807529C @ =0x02034000
	mov r8, r0
	ldr r0, _080752A0 @ =0x02035C00
	str r0, [sp]
	adds r0, r1, #0
	cmp r0, #3
	bne _080752A4
	movs r6, #1
	b _080752B4
	.align 2, 0
_08075298: .4byte gMinimapUpdateFlag
_0807529C: .4byte 0x02034000
_080752A0: .4byte 0x02035C00
_080752A4:
	cmp r0, #2
	bne _080752AC
	movs r6, #0
	b _080752B4
_080752AC:
	cmp r1, #1
	bne _080752B4
	movs r6, #1
	rsbs r6, r6, #0
_080752B4:
	ldrb r0, [r2]
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r0, [sp]
	adds r0, r0, r1
	str r0, [sp]
	movs r5, #1
	rsbs r5, r5, #0
	add r4, sp, #4
_080752CA:
	ldr r0, _0807531C @ =0x03000031
	ldrb r0, [r0]
	adds r1, r0, r5
	cmp r1, #0x1f
	bls _080752D6
	movs r1, #0xff
_080752D6:
	ldr r0, _08075320 @ =0x03000032
	ldrb r0, [r0]
	adds r0, r0, r6
	cmp r0, #0x1f
	bls _080752E2
	movs r0, #0xff
_080752E2:
	cmp r0, #0xff
	beq _080752EA
	cmp r1, #0xff
	bne _080752EE
_080752EA:
	movs r1, #0x1f
	movs r0, #0x1f
_080752EE:
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	adds r3, r0, #0
	ands r3, r1
	lsrs r2, r1, #0xc
	ldr r7, _08075324 @ =0x000003FF
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #5
	str r0, [sp, #4]
	cmp r3, #0
	bne _08075328
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileGfx
	b _08075354
	.align 2, 0
_0807531C: .4byte 0x03000031
_08075320: .4byte 0x03000032
_08075324: .4byte 0x000003FF
_08075328:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r3, r0
	bne _0807533A
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileXFlippedGfx
	b _08075354
_0807533A:
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r3, r0
	bne _0807534C
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileYFlippedGfx
	b _08075354
_0807534C:
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileXYFlippedGfx
_08075354:
	adds r5, #1
	cmp r5, #1
	ble _080752CA
_0807535A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MinimapCopyTileGfx
MinimapCopyTileGfx: @ 0x08075368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, _080753C0 @ =0x08561FA8
	mov r8, r0
	ldr r0, _080753C4 @ =0x085761C0
	mov ip, r0
	lsrs r2, r2, #0x14
	ldr r7, _080753C8 @ =0x08576190
	movs r6, #0x1f
_08075382:
	ldr r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	adds r1, r3, #0
	lsrs r0, r1, #4
	adds r0, r0, r2
	add r0, ip
	ldrb r3, [r0]
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r2
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r6, #1
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	cmp r6, #0
	bge _08075382
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753C0: .4byte 0x08561FA8
_080753C4: .4byte 0x085761C0
_080753C8: .4byte 0x08576190

	thumb_func_start MinimapCopyTileXFlippedGfx
MinimapCopyTileXFlippedGfx: @ 0x080753CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	movs r1, #0
	lsrs r6, r2, #0x14
	ldr r0, _0807543C @ =0x08561FA8
	mov sb, r0
	ldr r0, _08075440 @ =0x085761C0
	mov r8, r0
	ldr r0, _08075444 @ =0x08576190
	mov ip, r0
_080753EA:
	ldr r0, [r4]
	adds r0, #3
	str r0, [r4]
	adds r7, r1, #1
	movs r2, #3
_080753F4:
	ldr r0, [r4]
	add r0, sb
	ldrb r3, [r0]
	adds r1, r3, #0
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r6
	add r0, r8
	ldrb r3, [r0]
	lsrs r1, r1, #4
	adds r1, r1, r6
	add r1, ip
	ldrb r0, [r1]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r2, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r4]
	cmp r2, #0
	bge _080753F4
	adds r0, r1, #4
	str r0, [r4]
	adds r1, r7, #0
	cmp r1, #7
	ble _080753EA
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807543C: .4byte 0x08561FA8
_08075440: .4byte 0x085761C0
_08075444: .4byte 0x08576190

	thumb_func_start MinimapCopyTileYFlippedGfx
MinimapCopyTileYFlippedGfx: @ 0x08075448
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r0, #0x1c
	str r0, [r4]
	movs r0, #0
	lsrs r6, r2, #0x14
	ldr r1, _080754B8 @ =0x08561FA8
	mov sb, r1
	ldr r1, _080754BC @ =0x085761C0
	mov r8, r1
	ldr r1, _080754C0 @ =0x08576190
	mov ip, r1
_0807546C:
	adds r7, r0, #1
	movs r2, #3
_08075470:
	ldr r0, [r4]
	add r0, sb
	ldrb r3, [r0]
	adds r1, r3, #0
	lsrs r0, r1, #4
	adds r0, r0, r6
	add r0, r8
	ldrb r3, [r0]
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r6
	add r0, ip
	ldrb r0, [r0]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r2, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, [r4]
	adds r0, r1, #1
	str r0, [r4]
	cmp r2, #0
	bge _08075470
	subs r0, r1, #7
	str r0, [r4]
	adds r0, r7, #0
	cmp r0, #7
	ble _0807546C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080754B8: .4byte 0x08561FA8
_080754BC: .4byte 0x085761C0
_080754C0: .4byte 0x08576190

	thumb_func_start MinimapCopyTileXYFlippedGfx
MinimapCopyTileXYFlippedGfx: @ 0x080754C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r0, #0x1f
	str r0, [r4]
	ldr r0, _08075520 @ =0x08561FA8
	mov r8, r0
	ldr r0, _08075524 @ =0x085761C0
	mov ip, r0
	lsrs r2, r2, #0x14
	ldr r7, _08075528 @ =0x08576190
	movs r6, #0x1f
_080754E4:
	ldr r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	adds r1, r3, #0
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r2
	add r0, ip
	ldrb r3, [r0]
	lsrs r1, r1, #4
	adds r1, r1, r2
	adds r1, r1, r7
	ldrb r0, [r1]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r6, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r6, #0
	bge _080754E4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075520: .4byte 0x08561FA8
_08075524: .4byte 0x085761C0
_08075528: .4byte 0x08576190

	thumb_func_start MapScreenSubroutine
MapScreenSubroutine: @ 0x0807552C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r7, #0
	ldr r0, _080755F8 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08075548
	b _080756CA
_08075548:
	ldr r2, _080755FC @ =gNonGameplayRam
	ldr r0, _08075600 @ =0x00000259
	adds r0, r0, r2
	mov r8, r0
	ldr r1, _08075604 @ =0x00000256
	adds r0, r2, r1
	mov r3, r8
	ldrb r1, [r3]
	mov r3, sp
	strb r1, [r3, #0x10]
	mov r1, r8
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r1, #0
	ldrsb r1, [r0, r1]
	eors r1, r3
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	mov sl, r0
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, sl
	strb r1, [r0]
	movs r0, #0
	mov ip, r0
	ldr r1, _08075608 @ =0x00000257
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, r3
	ble _08075592
	movs r3, #1
	mov ip, r3
_08075592:
	ldr r1, _0807560C @ =0x00000261
	adds r0, r6, r1
	mov r3, ip
	strb r3, [r0]
	movs r4, #0
	subs r1, #0xd
	adds r0, r6, r1
	movs r3, #0x96
	lsls r3, r3, #2
	adds r5, r6, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r5]
	mov sb, r1
	movs r2, #0
	ldrsb r2, [r5, r2]
	cmp r0, r2
	ble _080755BA
	movs r4, #1
_080755BA:
	ldr r3, _08075610 @ =0x0000025E
	adds r0, r6, r3
	strb r4, [r0]
	ldr r1, _08075614 @ =0x00000255
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
	ldr r1, _08075618 @ =0x0000025F
	adds r0, r6, r1
	strb r3, [r0]
	ldr r0, _0807561C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	mov r2, sb
	cmp r0, #0
	beq _08075620
	mov r1, sl
	cmp r1, #0
	beq _0807565E
	mov r3, sp
	ldrb r0, [r3, #0x10]
	subs r0, #1
	mov r1, r8
	strb r0, [r1]
	b _0807565C
	.align 2, 0
_080755F8: .4byte gButtonInput
_080755FC: .4byte gNonGameplayRam
_08075600: .4byte 0x00000259
_08075604: .4byte 0x00000256
_08075608: .4byte 0x00000257
_0807560C: .4byte 0x00000261
_08075610: .4byte 0x0000025E
_08075614: .4byte 0x00000255
_08075618: .4byte 0x0000025F
_0807561C: .4byte gChangedInput
_08075620:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807563A
	mov r3, ip
	cmp r3, #0
	beq _0807565E
	mov r1, sp
	ldrb r0, [r1, #0x10]
	adds r0, #1
	mov r3, r8
	strb r0, [r3]
	b _0807565C
_0807563A:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807564A
	cmp r4, #0
	beq _0807565E
	adds r0, r2, #1
	b _0807565A
_0807564A:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807565E
	cmp r3, #0
	beq _0807565E
	mov r0, sb
	subs r0, #1
_0807565A:
	strb r0, [r5]
_0807565C:
	movs r7, #1
_0807565E:
	ldr r2, _080756AC @ =gBackgroundPositions
	adds r4, r6, #0
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r3, r1, #0
	subs r0, r3, r0
	movs r5, #0
	strh r0, [r2, #0xc]
	adds r1, #0x59
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r3, r0
	strh r0, [r2, #0xe]
	ldr r0, _080756B0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080756B4
	adds r1, r4, #0
	adds r1, #0x28
	movs r0, #6
	strb r0, [r1]
	strb r5, [r4, #6]
	strb r5, [r4, #7]
	b _080756C8
	.align 2, 0
_080756AC: .4byte gBackgroundPositions
_080756B0: .4byte gChangedInput
_080756B4:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080756CA
	adds r1, r6, #0
	adds r1, #0x28
	movs r0, #0xb
	strb r0, [r1]
	strb r5, [r6, #6]
	strb r5, [r6, #7]
_080756C8:
	movs r7, #3
_080756CA:
	ldr r3, _080756E8 @ =gChangedInput
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080756D8
	movs r7, #2
_080756D8:
	cmp r7, #0
	beq _08075710
	cmp r7, #1
	bne _080756EC
	movs r0, #1
	bl unk_77840
	b _0807572C
	.align 2, 0
_080756E8: .4byte gChangedInput
_080756EC:
	cmp r7, #2
	bne _0807572C
	ldr r0, _0807570C @ =gNonGameplayRam
	ldrb r0, [r0, #1]
	cmp r0, #4
	beq _08075700
	cmp r0, #5
	beq _08075702
	cmp r0, #9
	bne _08075702
_08075700:
	movs r7, #1
_08075702:
	adds r0, r7, #0
	bl unk_77840
	b _0807572C
	.align 2, 0
_0807570C: .4byte gNonGameplayRam
_08075710:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0807572C
	ldr r0, _0807573C @ =gNonGameplayRam
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807572C
	movs r0, #1
	bl PauseScreenDrawIgtAndTanks
_0807572C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807573C: .4byte gNonGameplayRam

	thumb_func_start SetMapScreenSamusHeadPosition
SetMapScreenSamusHeadPosition: @ 0x08075740
	ldr r2, _08075760 @ =gNonGameplayRam
	ldr r0, _08075764 @ =0x03000031
	ldrb r0, [r0]
	lsls r0, r0, #3
	movs r3, #0xd7
	lsls r3, r3, #1
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _08075768 @ =0x03000032
	ldrb r0, [r0]
	lsls r0, r0, #3
	subs r3, #2
	adds r1, r2, r3
	strh r0, [r1]
	bx lr
	.align 2, 0
_08075760: .4byte gNonGameplayRam
_08075764: .4byte 0x03000031
_08075768: .4byte 0x03000032

	thumb_func_start MinimapSetVisitedTilesAndCollectedItems
MinimapSetVisitedTilesAndCollectedItems: @ 0x0807576C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #7
	bls _0807577A
	movs r4, #7
_0807577A:
	adds r0, r4, #0
	bl MinimapSetVisitedTiles
	adds r0, r4, #0
	bl MinimapSetCollectedItems
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MinimapSetVisitedTiles
MinimapSetVisitedTiles: @ 0x0807578C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #7
	cmp r0, #6
	bhi _080757A2
	adds r1, r0, #0
_080757A2:
	lsls r0, r1, #7
	ldr r3, _080757F0 @ =0x02037C00
	adds r2, r0, r3
	ldr r3, _080757F4 @ =0x02034000
	ldr r0, _080757F8 @ =gEquipment
	ldrb r0, [r0, #0xe]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08075822
	movs r1, #0
	ldr r5, _080757FC @ =0x0879BDDC
	mov r8, r5
	movs r0, #0x80
	lsls r0, r0, #6
	mov ip, r0
_080757C4:
	ldm r2!, {r0}
	adds r6, r1, #1
	adds r7, r2, #0
	mov sb, r0
	mov r2, r8
	movs r4, #0x1f
_080757D0:
	ldr r0, [r2]
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _08075800
	ldrh r1, [r3]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _0807580E
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	orrs r0, r1
	b _0807580C
	.align 2, 0
_080757F0: .4byte 0x02037C00
_080757F4: .4byte 0x02034000
_080757F8: .4byte gEquipment
_080757FC: .4byte 0x0879BDDC
_08075800:
	ldrh r1, [r3]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	beq _0807580E
	movs r0, #0xa0
_0807580C:
	strh r0, [r3]
_0807580E:
	adds r2, #4
	subs r4, #1
	adds r3, #2
	cmp r4, #0
	bge _080757D0
	adds r1, r6, #0
	adds r2, r7, #0
	cmp r1, #0x1f
	ble _080757C4
	b _08075876
_08075822:
	movs r1, #0
	ldr r0, _0807585C @ =0x0879BDDC
	mov sl, r0
	movs r5, #0x80
	lsls r5, r5, #6
	mov sb, r5
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	movs r5, #0xa0
	mov ip, r5
_08075838:
	ldm r2!, {r0}
	adds r6, r1, #1
	adds r7, r2, #0
	adds r5, r0, #0
	mov r2, sl
	movs r4, #0x1f
_08075844:
	ldr r0, [r2]
	ands r0, r5
	cmp r0, #0
	beq _08075860
	ldrh r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _08075864
	mov r0, r8
	orrs r0, r1
	b _08075862
	.align 2, 0
_0807585C: .4byte 0x0879BDDC
_08075860:
	mov r0, ip
_08075862:
	strh r0, [r3]
_08075864:
	adds r2, #4
	subs r4, #1
	adds r3, #2
	cmp r4, #0
	bge _08075844
	adds r1, r6, #0
	adds r2, r7, #0
	cmp r1, #0x1f
	ble _08075838
_08075876:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MinimapSetCollectedItems
MinimapSetCollectedItems: @ 0x08075884
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r6, #7
	cmp r2, #6
	bhi _08075898
	adds r6, r2, #0
_08075898:
	ldr r0, _080758A8 @ =0x02034000
	mov sb, r0
	movs r7, #0x40
	cmp r6, #0
	beq _080758AC
	adds r6, #1
	b _080758AE
	.align 2, 0
_080758A8: .4byte 0x02034000
_080758AC:
	movs r7, #0x80
_080758AE:
	lsls r0, r6, #8
	ldr r1, _08075920 @ =0x02037200
	adds r5, r0, r1
	movs r6, #0
	cmp r6, r7
	bge _08075914
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _08075914
	ldr r1, _08075924 @ =0x0879B8BC
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
_080758CA:
	ldrb r0, [r5, #2]
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	ldrb r0, [r5, #3]
	subs r0, #2
	movs r1, #0xa
	bl __divsi3
	ldrb r2, [r5]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r2, [r2]
	adds r4, r4, r2
	adds r1, #0x36
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r6, #1
	adds r5, #4
	cmp r6, r7
	bge _08075914
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _080758CA
_08075914:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075920: .4byte 0x02037200
_08075924: .4byte 0x0879B8BC

	thumb_func_start MinimapUpdateForExploredTiles
MinimapUpdateForExploredTiles: @ 0x08075928
	push {lr}
	ldr r0, _0807596C @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bhi _08075982
	ldr r1, _08075970 @ =0x03000031
	ldr r0, _08075974 @ =0x03000032
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r3, r0, #1
	ldr r0, _08075978 @ =0x02034000
	adds r2, r3, r0
	ldrh r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08075982
	ldr r1, _0807597C @ =0x02034800
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08075980
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _08075982
	.align 2, 0
_0807596C: .4byte gCurrentArea
_08075970: .4byte 0x03000031
_08075974: .4byte 0x03000032
_08075978: .4byte 0x02034000
_0807597C: .4byte 0x02034800
_08075980:
	strh r1, [r2]
_08075982:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_75988
unk_75988: @ 0x08075988
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _080759EC @ =gNonGameplayRam
	ldr r2, _080759F0 @ =0x0000025E
	adds r0, r1, r2
	movs r3, #0
	strb r3, [r0]
	ldr r4, _080759F4 @ =0x0000025F
	adds r0, r1, r4
	strb r3, [r0]
	adds r2, #2
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, #2
	adds r0, r1, r4
	strb r3, [r0]
	subs r2, #0xb
	adds r0, r1, r2
	movs r2, #0x1f
	strb r2, [r0]
	ldr r0, _080759F8 @ =0x00000256
	adds r4, r1, r0
	strb r2, [r4]
	movs r2, #0x95
	lsls r2, r2, #2
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, #3
	adds r0, r1, r2
	strb r3, [r0]
	ldr r6, _080759FC @ =0x02034000
	movs r5, #0
	mov ip, r1
	ldr r0, _08075A00 @ =gBackgroundPositions
	mov sb, r0
	adds r7, r4, #0
	adds r4, r6, #0
_080759DC:
	movs r2, #0
	ldrh r0, [r4]
	lsls r1, r3, #5
	cmp r0, #0xa0
	beq _08075A04
	strb r3, [r7]
	b _08075A26
	.align 2, 0
_080759EC: .4byte gNonGameplayRam
_080759F0: .4byte 0x0000025E
_080759F4: .4byte 0x0000025F
_080759F8: .4byte 0x00000256
_080759FC: .4byte 0x02034000
_08075A00: .4byte gBackgroundPositions
_08075A04:
	adds r2, #1
	cmp r2, #0x1f
	bgt _08075A1A
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A04
	strb r3, [r7]
	movs r5, #1
_08075A1A:
	cmp r5, #0
	bne _08075A26
	adds r4, #0x40
	adds r3, #1
	cmp r3, #0x1f
	ble _080759DC
_08075A26:
	movs r5, #0
	movs r3, #0x20
	ldr r4, _08075A44 @ =0x030016DB
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r6, r0
_08075A32:
	subs r1, #0x40
	subs r3, #1
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075A48
	strb r3, [r4]
	b _08075A68
	.align 2, 0
_08075A44: .4byte 0x030016DB
_08075A48:
	adds r2, #1
	cmp r2, #0x1f
	bgt _08075A60
	lsls r0, r3, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A48
	strb r3, [r4]
	movs r5, #1
_08075A60:
	cmp r5, #0
	bne _08075A68
	cmp r3, #0
	bgt _08075A32
_08075A68:
	movs r5, #0
	movs r3, #0
	ldr r4, _08075A7C @ =0x030016D9
	adds r1, r6, #0
_08075A70:
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075A80
	strb r3, [r4]
	b _08075AA4
	.align 2, 0
_08075A7C: .4byte 0x030016D9
_08075A80:
	adds r2, #1
	cmp r2, #0x13
	bgt _08075A98
	lsls r0, r2, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A80
	strb r3, [r4]
	movs r5, #1
_08075A98:
	cmp r5, #0
	bne _08075AA4
	adds r1, #2
	adds r3, #1
	cmp r3, #0x1f
	ble _08075A70
_08075AA4:
	movs r5, #0
	movs r3, #0x20
	ldr r4, _08075AC0 @ =0x030016D8
	adds r1, r6, #0
	adds r1, #0x40
_08075AAE:
	subs r1, #2
	subs r3, #1
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075AC4
	strb r3, [r4]
	b _08075AE4
	.align 2, 0
_08075AC0: .4byte 0x030016D8
_08075AC4:
	adds r2, #1
	cmp r2, #0x13
	bgt _08075ADC
	lsls r0, r2, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075AC4
	strb r3, [r4]
	movs r5, #1
_08075ADC:
	cmp r5, #0
	bne _08075AE4
	cmp r3, #0
	bgt _08075AAE
_08075AE4:
	ldr r6, _08075B50 @ =0x00000255
	add r6, ip
	movs r4, #0x95
	lsls r4, r4, #2
	add r4, ip
	ldrb r2, [r6]
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	ble _08075AFE
	strb r2, [r4]
_08075AFE:
	ldr r5, _08075B54 @ =0x00000256
	add r5, ip
	ldr r3, _08075B58 @ =0x00000257
	add r3, ip
	ldrb r2, [r5]
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	ble _08075B16
	strb r2, [r3]
_08075B16:
	ldrb r1, [r4]
	ldr r0, _08075B5C @ =0x0000025A
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r6]
	ldr r0, _08075B60 @ =0x0000025B
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r5]
	movs r0, #0x97
	lsls r0, r0, #2
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r3]
	ldr r0, _08075B64 @ =0x0000025D
	add r0, ip
	strb r1, [r0]
	mov r1, r8
	cmp r1, #0
	beq _08075B6C
	movs r0, #0x84
	lsls r0, r0, #2
	add r0, ip
	ldrb r4, [r0]
	ldr r0, _08075B68 @ =0x00000211
	add r0, ip
	ldrb r1, [r0]
	b _08075BC6
	.align 2, 0
_08075B50: .4byte 0x00000255
_08075B54: .4byte 0x00000256
_08075B58: .4byte 0x00000257
_08075B5C: .4byte 0x0000025A
_08075B60: .4byte 0x0000025B
_08075B64: .4byte 0x0000025D
_08075B68: .4byte 0x00000211
_08075B6C:
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	asrs r4, r0, #1
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	asrs r1, r0, #1
	adds r3, r1, #4
	subs r2, r1, #7
	ldr r0, _08075B98 @ =0x00000211
	add r0, ip
	ldrb r0, [r0]
	cmp r3, r0
	bge _08075B9C
	subs r0, r0, r3
	adds r1, r1, r0
	b _08075BA4
	.align 2, 0
_08075B98: .4byte 0x00000211
_08075B9C:
	cmp r2, r0
	ble _08075BA4
	subs r0, r2, r0
	subs r1, r1, r0
_08075BA4:
	adds r3, r4, #0
	adds r3, #0xc
	adds r2, r4, #0
	subs r2, #0xc
	movs r0, #0x84
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	cmp r3, r0
	bge _08075BBE
	subs r0, r0, r3
	adds r4, r4, r0
	b _08075BC6
_08075BBE:
	cmp r2, r0
	ble _08075BC6
	subs r0, r2, r0
	subs r4, r4, r0
_08075BC6:
	mov r3, ip
	movs r2, #0x96
	lsls r2, r2, #2
	adds r0, r3, r2
	strb r4, [r0]
	ldr r4, _08075C54 @ =0x00000259
	adds r2, r3, r4
	strb r1, [r2]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r4, #0x59
	adds r1, r4, #0
	subs r0, r1, r0
	mov r4, sb
	strh r0, [r4, #0xc]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #0xa
	subs r0, r0, r2
	lsls r0, r0, #3
	subs r1, r1, r0
	strh r1, [r4, #0xe]
	ldr r0, _08075C58 @ =0x00000257
	adds r4, r3, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r1, _08075C5C @ =0x00000256
	adds r2, r3, r1
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	asrs r3, r0, #1
	cmp r3, #3
	ble _08075C14
	movs r3, #3
_08075C14:
	ldrb r0, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	ldrb r0, [r4]
	subs r0, r0, r3
	strb r0, [r4]
	movs r4, #0x95
	lsls r4, r4, #2
	add r4, ip
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, _08075C60 @ =0x00000255
	add r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	asrs r3, r0, #1
	cmp r3, #3
	ble _08075C3C
	movs r3, #3
_08075C3C:
	ldrb r0, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	ldrb r0, [r4]
	subs r0, r0, r3
	strb r0, [r4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C54: .4byte 0x00000259
_08075C58: .4byte 0x00000257
_08075C5C: .4byte 0x00000256
_08075C60: .4byte 0x00000255

	thumb_func_start MinimapUpdateForCollectedItem
MinimapUpdateForCollectedItem: @ 0x08075C64
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	ldr r6, _08075CB8 @ =gCurrentRoomEntry
	ldrb r0, [r6, #0xe]
	adds r5, r5, r0
	subs r4, #2
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, #0xf]
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r5, r5, r0
	lsls r5, r5, #1
	ldr r0, _08075CBC @ =0x02034000
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _08075CC0 @ =0x02034800
	adds r5, r5, r0
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r1, _08075CC4 @ =gMinimapUpdateFlag
	movs r0, #3
	strb r0, [r1]
	bl MinimapDraw
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075CB8: .4byte gCurrentRoomEntry
_08075CBC: .4byte 0x02034000
_08075CC0: .4byte 0x02034800
_08075CC4: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapCheckIsTileExplored
MinimapCheckIsTileExplored: @ 0x08075CC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r1, _08075D10 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _08075D20
	adds r5, r0, #0
	lsls r5, r5, #5
	subs r0, r2, #2
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	ldr r6, _08075D14 @ =gCurrentRoomEntry
	ldrb r0, [r6, #0xe]
	adds r4, r4, r0
	subs r0, r7, #2
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, #0xf]
	adds r0, r0, r1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08075D18 @ =0x02037C00
	adds r0, r0, r1
	ldr r1, _08075D1C @ =0x0879BDDC
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r0, [r0]
	ldr r1, [r4]
	ands r0, r1
	b _08075D22
	.align 2, 0
_08075D10: .4byte gCurrentArea
_08075D14: .4byte gCurrentRoomEntry
_08075D18: .4byte 0x02037C00
_08075D1C: .4byte 0x0879BDDC
_08075D20:
	movs r0, #1
_08075D22:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start MapScreenCountTanks
MapScreenCountTanks: @ 0x08075D28
	push {r4, r5, r6, r7, lr}
	ldr r4, _08075DE4 @ =gNonGameplayRam
	ldr r7, _08075DE8 @ =0x08575F88
	ldrb r1, [r7, #0x15]
	ldr r2, _08075DEC @ =0x0000027B
	adds r0, r4, r2
	movs r6, #0
	strb r1, [r0]
	ldrb r1, [r7, #0x16]
	adds r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldrb r1, [r7, #0x17]
	adds r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldr r5, _08075DF0 @ =gEquipment
	ldrh r0, [r5, #2]
	subs r0, #0x63
	movs r1, #0x64
	bl __divsi3
	movs r2, #0x9f
	lsls r2, r2, #2
	adds r1, r4, r2
	strb r0, [r1]
	ldrh r0, [r5, #6]
	subs r0, #0xa
	movs r1, #5
	bl __divsi3
	ldr r2, _08075DF4 @ =0x0000027E
	adds r1, r4, r2
	strb r0, [r1]
	ldrb r0, [r5, #9]
	subs r0, #0xa
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r2, #2
	adds r1, r4, r2
	strb r0, [r1]
	ldr r0, _08075DF8 @ =0x00000275
	adds r3, r4, r0
	strb r6, [r3]
	ldr r1, _08075DFC @ =0x00000277
	adds r5, r4, r1
	strb r6, [r5]
	subs r2, #7
	adds r2, r2, r4
	mov ip, r2
	strb r6, [r2]
	subs r1, #1
	adds r0, r4, r1
	strb r6, [r0]
	movs r2, #0x9e
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r6, [r0]
	ldr r0, _08075E00 @ =0x0000027A
	adds r4, r4, r0
	strb r6, [r4]
	ldr r2, _08075E04 @ =gCurrentArea
	ldrb r0, [r2]
	cmp r0, #6
	bhi _08075E5C
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, r0, r7
	ldrb r0, [r0]
	strb r0, [r3]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r7, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r7, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	ldrb r1, [r2]
	movs r6, #0x40
	cmp r1, #0
	beq _08075E08
	adds r1, #1
	b _08075E0A
	.align 2, 0
_08075DE4: .4byte gNonGameplayRam
_08075DE8: .4byte 0x08575F88
_08075DEC: .4byte 0x0000027B
_08075DF0: .4byte gEquipment
_08075DF4: .4byte 0x0000027E
_08075DF8: .4byte 0x00000275
_08075DFC: .4byte 0x00000277
_08075E00: .4byte 0x0000027A
_08075E04: .4byte gCurrentArea
_08075E08:
	movs r6, #0x80
_08075E0A:
	lsls r0, r1, #8
	ldr r1, _08075E30 @ =0x02037200
	adds r2, r0, r1
	movs r1, #0
	cmp r1, r6
	bge _08075E5C
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08075E5C
	ldr r3, _08075E34 @ =0x030016FC
	subs r5, r3, #2
	adds r4, r3, #2
_08075E22:
	ldrb r0, [r2, #1]
	cmp r0, #1
	bne _08075E38
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	b _08075E4E
	.align 2, 0
_08075E30: .4byte 0x02037200
_08075E34: .4byte 0x030016FC
_08075E38:
	cmp r0, #2
	bne _08075E44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08075E4E
_08075E44:
	cmp r0, #3
	bne _08075E4E
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08075E4E:
	adds r1, #1
	adds r2, #4
	cmp r1, r6
	bge _08075E5C
	ldrb r0, [r2]
	cmp r0, #0xff
	bne _08075E22
_08075E5C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PauseScreenDrawIgtAndTanks
PauseScreenDrawIgtAndTanks: @ 0x08075E64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08075EA4
	ldr r0, _08075E90 @ =gNonGameplayRam
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r3, r0, r1
	ldrb r1, [r3]
	cmp r1, #1
	bne _08075E94
	movs r0, #2
	strb r0, [r3]
	movs r2, #1
	str r2, [sp]
	b _08075EB4
	.align 2, 0
_08075E90: .4byte gNonGameplayRam
_08075E94:
	cmp r1, #2
	beq _08075E9A
	b _080761B4
_08075E9A:
	movs r0, #1
	strb r0, [r3]
	movs r0, #0
	str r0, [sp]
	b _08075EB4
_08075EA4:
	ldr r2, _08075F50 @ =gNonGameplayRam
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	str r1, [sp]
_08075EB4:
	ldr r2, _08075F54 @ =gInGameTimer
	mov sb, r2
	ldrb r0, [r2]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	ldr r4, _08075F58 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _08075F5C @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	ldr r2, _08075F60 @ =0x085761F0
	mov sl, r2
	ldr r5, [r2, #0x18]
	str r5, [r4, #4]
	ldr r6, _08075F64 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, sb
	ldrb r0, [r1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r2, sb
	ldrb r0, [r2, #1]
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	mov r0, sl
	ldr r5, [r0, #0x1c]
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov r1, sb
	ldrb r0, [r1, #1]
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x13
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	mov sb, sl
	ldr r2, [sp]
	cmp r2, #0
	bne _08075F68
	ldr r1, _08075F50 @ =gNonGameplayRam
	movs r2, #0x9f
	lsls r2, r2, #2
	b _08075F6C
	.align 2, 0
_08075F50: .4byte gNonGameplayRam
_08075F54: .4byte gInGameTimer
_08075F58: .4byte 0x040000D4
_08075F5C: .4byte 0x06017EC0
_08075F60: .4byte 0x085761F0
_08075F64: .4byte 0x84000008
_08075F68:
	ldr r1, _08075FB8 @ =gNonGameplayRam
	ldr r2, _08075FBC @ =0x00000276
_08075F6C:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08075FC0 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08075FC4 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2]
	str r5, [r4, #4]
	ldr r6, _08075FC8 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08075FD0
	ldr r1, _08075FB8 @ =gNonGameplayRam
	ldr r2, _08075FCC @ =0x0000027B
	b _08075FD4
	.align 2, 0
_08075FB8: .4byte gNonGameplayRam
_08075FBC: .4byte 0x00000276
_08075FC0: .4byte 0x040000D4
_08075FC4: .4byte 0x06017EC0
_08075FC8: .4byte 0x84000008
_08075FCC: .4byte 0x0000027B
_08075FD0:
	ldr r1, _08076020 @ =gNonGameplayRam
	ldr r2, _08076024 @ =0x00000275
_08075FD4:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076028 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _0807602C @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #4]
	str r5, [r4, #4]
	ldr r6, _08076030 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076038
	ldr r1, _08076020 @ =gNonGameplayRam
	ldr r2, _08076034 @ =0x0000027E
	b _0807603E
	.align 2, 0
_08076020: .4byte gNonGameplayRam
_08076024: .4byte 0x00000275
_08076028: .4byte 0x040000D4
_0807602C: .4byte 0x06017EC0
_08076030: .4byte 0x84000008
_08076034: .4byte 0x0000027E
_08076038:
	ldr r1, _0807608C @ =gNonGameplayRam
	movs r2, #0x9e
	lsls r2, r2, #2
_0807603E:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076090 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076094 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #8]
	str r5, [r4, #4]
	ldr r6, _08076098 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _080760A0
	ldr r1, _0807608C @ =gNonGameplayRam
	ldr r2, _0807609C @ =0x0000027D
	b _080760A4
	.align 2, 0
_0807608C: .4byte gNonGameplayRam
_08076090: .4byte 0x040000D4
_08076094: .4byte 0x06017EC0
_08076098: .4byte 0x84000008
_0807609C: .4byte 0x0000027D
_080760A0:
	ldr r1, _080760F4 @ =gNonGameplayRam
	ldr r2, _080760F8 @ =0x00000277
_080760A4:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _080760FC @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076100 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0xc]
	str r5, [r4, #4]
	ldr r6, _08076104 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076108
	ldr r1, _080760F4 @ =gNonGameplayRam
	movs r2, #0xa0
	lsls r2, r2, #2
	b _0807610C
	.align 2, 0
_080760F4: .4byte gNonGameplayRam
_080760F8: .4byte 0x00000277
_080760FC: .4byte 0x040000D4
_08076100: .4byte 0x06017EC0
_08076104: .4byte 0x84000008
_08076108:
	ldr r1, _08076158 @ =gNonGameplayRam
	ldr r2, _0807615C @ =0x0000027A
_0807610C:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _08076160 @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _08076164 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0x10]
	str r5, [r4, #4]
	ldr r6, _08076168 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, [sp]
	cmp r0, #0
	bne _08076170
	ldr r1, _08076158 @ =gNonGameplayRam
	ldr r2, _0807616C @ =0x0000027F
	b _08076174
	.align 2, 0
_08076158: .4byte gNonGameplayRam
_0807615C: .4byte 0x0000027A
_08076160: .4byte 0x040000D4
_08076164: .4byte 0x06017EC0
_08076168: .4byte 0x84000008
_0807616C: .4byte 0x0000027F
_08076170:
	ldr r1, _080761C4 @ =gNonGameplayRam
	ldr r2, _080761C8 @ =0x00000279
_08076174:
	adds r0, r1, r2
	ldrb r7, [r0]
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	ldr r4, _080761CC @ =0x040000D4
	lsls r0, r0, #5
	ldr r1, _080761D0 @ =0x06017EC0
	mov r8, r1
	add r0, r8
	str r0, [r4]
	mov r2, sb
	ldr r5, [r2, #0x14]
	str r5, [r4, #4]
	ldr r6, _080761D4 @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #5
	add r0, r8
	str r0, [r4]
	adds r5, #0x20
	str r5, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
_080761B4:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080761C4: .4byte gNonGameplayRam
_080761C8: .4byte 0x00000279
_080761CC: .4byte 0x040000D4
_080761D0: .4byte 0x06017EC0
_080761D4: .4byte 0x84000008

	thumb_func_start PauseScreenMapDownload
PauseScreenMapDownload: @ 0x080761D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _08076210 @ =gNonGameplayRam
	movs r0, #0x8c
	lsls r0, r0, #2
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r2, _08076214 @ =0x00000231
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #6
	bls _08076204
	b _080765E2
_08076204:
	lsls r0, r0, #2
	ldr r1, _08076218 @ =_0807621C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08076210: .4byte gNonGameplayRam
_08076214: .4byte 0x00000231
_08076218: .4byte _0807621C
_0807621C: @ jump table
	.4byte _08076238 @ case 0
	.4byte _08076350 @ case 1
	.4byte _080763C4 @ case 2
	.4byte _080764D0 @ case 3
	.4byte _0807650C @ case 4
	.4byte _08076540 @ case 5
	.4byte _080765C8 @ case 6
_08076238:
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #8
	bhi _08076246
	b _080765E2
_08076246:
	movs r2, #0xdb
	lsls r2, r2, #1
	adds r0, r6, r2
	movs r1, #0
	strb r1, [r0]
	subs r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x5a
	movs r0, #0x11
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x58
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x52
	movs r0, #0x74
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x50
	ldr r3, _08076344 @ =0x0000FFF8
	strh r3, [r0]
	adds r4, r6, #0
	adds r4, #0x5b
	ldrb r1, [r4]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r4]
	movs r5, #4
	ldr r0, _08076348 @ =0x0879BEBC
	mov ip, r0
	adds r4, r6, #0
	movs r7, #0
	mov sb, r3
	mov sl, r2
	movs r1, #0xd
	rsbs r1, r1, #0
	mov r8, r1
_080762A2:
	subs r5, #1
	mov r2, ip
	adds r3, r5, r2
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r7, [r0]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x74
	strh r1, [r0, #0x2e]
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r1, sb
	strh r1, [r0, #0x2c]
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sl
	ands r0, r2
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, r8
	ands r0, r2
	movs r2, #4
	orrs r0, r2
	strb r0, [r1]
	cmp r5, #0
	bgt _080762A2
	ldr r2, _0807634C @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	adds r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	movs r2, #0x8d
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0x80
	strb r0, [r1]
	b _080765E2
	.align 2, 0
_08076344: .4byte 0x0000FFF8
_08076348: .4byte 0x0879BEBC
_0807634C: .4byte 0x00000231
_08076350:
	ldr r0, _08076374 @ =0x00000233
	adds r3, r6, r0
	movs r0, #0
	strb r0, [r3]
	ldr r2, _08076378 @ =gBackgroundPositions
	ldrh r1, [r2, #0xe]
	ldr r0, _0807637C @ =0x000001FF
	cmp r1, r0
	bhi _08076380
	adds r0, r1, #0
	movs r1, #0x80
	lsls r1, r1, #2
	subs r1, r1, r0
	asrs r1, r1, #3
	movs r0, #0x20
	subs r0, r0, r1
	b _08076390
	.align 2, 0
_08076374: .4byte 0x00000233
_08076378: .4byte gBackgroundPositions
_0807637C: .4byte 0x000001FF
_08076380:
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r1, r0
	bls _08076392
	ldrh r0, [r2, #0xe]
	ldr r1, _080763B4 @ =0xFFFFFE00
	adds r0, r0, r1
	asrs r0, r0, #3
_08076390:
	strb r0, [r3]
_08076392:
	ldr r2, _080763B8 @ =0x00000232
	adds r0, r6, r2
	movs r4, #0
	strb r4, [r0]
	ldr r0, _080763BC @ =0x0000011B
	bl SoundPlay
	ldr r0, _080763C0 @ =0x00000231
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r4, [r0]
	b _080765E2
	.align 2, 0
_080763B4: .4byte 0xFFFFFE00
_080763B8: .4byte 0x00000232
_080763BC: .4byte 0x0000011B
_080763C0: .4byte 0x00000231
_080763C4:
	movs r5, #1
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #7
	bls _08076442
	ldr r0, _08076414 @ =0x00000232
	adds r7, r6, r0
	ldrb r4, [r7]
	cmp r4, #0x13
	bhi _0807642C
	ldr r2, _08076418 @ =0x040000D4
	ldr r1, _0807641C @ =0x00000233
	adds r3, r6, r1
	ldrb r0, [r3]
	lsls r0, r0, #6
	ldr r1, _08076420 @ =0x02034000
	adds r0, r0, r1
	str r0, [r2]
	ldrb r0, [r3]
	lsls r0, r0, #6
	ldr r1, _08076424 @ =0x0600E000
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _08076428 @ =0x80000020
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #1
	strb r0, [r7]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _08076438
	movs r0, #0
	strb r0, [r3]
	b _08076438
	.align 2, 0
_08076414: .4byte 0x00000232
_08076418: .4byte 0x040000D4
_0807641C: .4byte 0x00000233
_08076420: .4byte 0x02034000
_08076424: .4byte 0x0600E000
_08076428: .4byte 0x80000020
_0807642C:
	ldr r2, _080764C4 @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r5, #0
_08076438:
	movs r0, #0x8c
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0
	strb r0, [r1]
_08076442:
	cmp r5, #0
	bne _08076448
	b _080765E2
_08076448:
	ldr r1, _080764C8 @ =0x00000232
	adds r0, r6, r1
	ldrb r0, [r0]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r6, r2
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	subs r0, #5
	adds r7, r6, #0
	adds r7, #0x50
	movs r4, #0
	strh r0, [r7]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0807647A
	strb r4, [r3]
_0807647A:
	ldrb r5, [r3]
	ldr r0, _080764CC @ =0x0879BEBC
	adds r2, r5, r0
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrh r1, [r7]
	subs r1, #1
	strh r1, [r0, #0x2c]
	cmp r5, #2
	ble _08076496
	b _080765E2
_08076496:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x36
	movs r1, #0x10
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	adds r0, #0x35
	strb r4, [r0]
	b _080765E2
	.align 2, 0
_080764C4: .4byte 0x00000231
_080764C8: .4byte 0x00000232
_080764CC: .4byte 0x0879BEBC
_080764D0:
	ldr r1, _080764F8 @ =0x040000D4
	ldr r0, _080764FC @ =0x02034000
	str r0, [r1]
	ldr r0, _08076500 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _08076504 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08076508 @ =0x00000231
	adds r1, r6, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r0, r6, r1
	strb r2, [r0]
	b _080765E2
	.align 2, 0
_080764F8: .4byte 0x040000D4
_080764FC: .4byte 0x02034000
_08076500: .4byte 0x0600E000
_08076504: .4byte 0x80000400
_08076508: .4byte 0x00000231
_0807650C:
	movs r5, #3
	ldr r4, _08076534 @ =gMinimapUpdateFlag
_08076510:
	strb r5, [r4]
	bl MinimapDraw
	subs r5, #1
	cmp r5, #0
	bgt _08076510
	ldr r1, _08076538 @ =gNonGameplayRam
	ldr r0, _0807653C @ =0x00000231
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r1, r2
	strb r3, [r1]
	b _080765E2
	.align 2, 0
_08076534: .4byte gMinimapUpdateFlag
_08076538: .4byte gNonGameplayRam
_0807653C: .4byte 0x00000231
_08076540:
	movs r0, #0xdb
	lsls r0, r0, #1
	adds r2, r6, r0
	movs r1, #0
	movs r0, #1
	strb r0, [r2]
	movs r2, #0xda
	lsls r2, r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r2, #1
	adds r0, r6, r2
	strb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x5a
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r5, #4
	ldr r0, _080765C0 @ =0x0879BEBC
	mov ip, r0
	adds r3, r6, #0
	movs r4, #0
	mov r2, ip
	adds r2, #4
_08076576:
	subs r2, #1
	subs r5, #1
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x36
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x35
	strb r4, [r0]
	cmp r5, #0
	bgt _08076576
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	ldr r0, _080765C4 @ =0x00000231
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080765E2
	.align 2, 0
_080765C0: .4byte 0x0879BEBC
_080765C4: .4byte 0x00000231
_080765C8:
	movs r1, #0x8c
	lsls r1, r1, #2
	adds r2, r6, r1
	ldrb r0, [r2]
	cmp r0, #0x1d
	bls _080765E2
	movs r1, #0
	strb r1, [r2]
	ldr r2, _080765F4 @ =0x00000231
	adds r0, r6, r2
	strb r1, [r0]
	movs r0, #1
	str r0, [sp]
_080765E2:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080765F4: .4byte 0x00000231

	thumb_func_start PauseScreenSubroutine
PauseScreenSubroutine: @ 0x080765F8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r0, _0807661C @ =gNextOamSlot
	movs r1, #0
	strb r1, [r0]
	movs r7, #0
	ldr r0, _08076620 @ =0x03000B85
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #4
	bls _08076610
	b _08076872
_08076610:
	lsls r0, r1, #2
	ldr r1, _08076624 @ =_08076628
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807661C: .4byte gNextOamSlot
_08076620: .4byte 0x03000B85
_08076624: .4byte _08076628
_08076628: @ jump table
	.4byte _0807663C @ case 0
	.4byte _08076644 @ case 1
	.4byte _08076720 @ case 2
	.4byte _080767A0 @ case 3
	.4byte _08076834 @ case 4
_0807663C:
	bl PauseScreenInit
	strb r0, [r5]
	b _08076872
_08076644:
	ldr r0, _08076678 @ =gNonGameplayRam
	ldrb r3, [r0]
	cmp r3, #0
	beq _080766E0
	ldr r0, _0807667C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08076688
	ldr r3, _08076680 @ =gWrittenToBldalpha_L
	ldrh r0, [r3]
	lsls r0, r0, #8
	ldr r2, _08076684 @ =gWrittenToBldalpha_R
	ldrh r4, [r2]
	orrs r0, r4
	movs r1, #0xa1
	lsls r1, r1, #3
	adds r6, r3, #0
	cmp r0, r1
	beq _080766C8
	cmp r4, #8
	beq _080766B2
	adds r0, r4, #1
	b _080766A4
	.align 2, 0
_08076678: .4byte gNonGameplayRam
_0807667C: .4byte gPauseScreenFlag
_08076680: .4byte gWrittenToBldalpha_L
_08076684: .4byte gWrittenToBldalpha_R
_08076688:
	ldr r3, _080766C0 @ =gWrittenToBldalpha_L
	ldrh r0, [r3]
	lsls r0, r0, #8
	ldr r2, _080766C4 @ =gWrittenToBldalpha_R
	ldrh r4, [r2]
	orrs r0, r4
	movs r1, #0xa1
	lsls r1, r1, #3
	adds r6, r3, #0
	cmp r0, r1
	beq _080766C8
	cmp r4, #8
	beq _080766B2
	adds r0, r4, #2
_080766A4:
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bls _080766B2
	movs r0, #8
	strh r0, [r2]
_080766B2:
	ldrh r0, [r6]
	cmp r0, #5
	bne _080766BA
	b _080767FA
_080766BA:
	adds r0, #1
	strh r0, [r6]
	b _080767FA
	.align 2, 0
_080766C0: .4byte gWrittenToBldalpha_L
_080766C4: .4byte gWrittenToBldalpha_R
_080766C8:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _080766D8 @ =0x04000050
	ldr r3, _080766DC @ =0x00003F44
	adds r0, r3, #0
	strh r0, [r1]
	b _080767FA
	.align 2, 0
_080766D8: .4byte 0x04000050
_080766DC: .4byte 0x00003F44
_080766E0:
	ldr r2, _080766F4 @ =gWrittenToBldy
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _080766FC
	cmp r1, #4
	bls _080766F8
	subs r0, #4
	strh r0, [r2]
	b _08076872
	.align 2, 0
_080766F4: .4byte gWrittenToBldy
_080766F8:
	strh r3, [r2]
	b _08076872
_080766FC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r1, _08076718 @ =0x04000050
	movs r2, #0xfc
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0807671C @ =0x0000040C
	adds r0, r3, #0
	strh r0, [r1]
	b _08076872
	.align 2, 0
_08076718: .4byte 0x04000050
_0807671C: .4byte 0x0000040C
_08076720:
	bl PauseScreenCallCurrentSubroutine
	cmp r0, #0
	beq _08076776
	ldr r0, _0807674C @ =gNonGameplayRam
	ldrb r1, [r0]
	cmp r1, #0
	beq _08076764
	ldr r1, _08076750 @ =0x04000050
	ldr r2, _08076754 @ =0x00003F7F
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _08076758 @ =gWrittenToBldalpha_R
	ldr r0, _0807675C @ =0x04000052
	ldrh r2, [r0]
	ldr r1, _08076760 @ =gWrittenToBldalpha_L
	lsrs r0, r2, #8
	strh r0, [r1]
	movs r0, #0xff
	ands r0, r2
	strh r0, [r3]
	b _0807676E
	.align 2, 0
_0807674C: .4byte gNonGameplayRam
_08076750: .4byte 0x04000050
_08076754: .4byte 0x00003F7F
_08076758: .4byte gWrittenToBldalpha_R
_0807675C: .4byte 0x04000052
_08076760: .4byte gWrittenToBldalpha_L
_08076764:
	ldr r0, _08076790 @ =gWrittenToBldy
	strh r1, [r0]
	ldr r1, _08076794 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
_0807676E:
	ldr r1, _08076798 @ =0x03000B85
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08076776:
	ldr r0, _0807679C @ =gNonGameplayRam
	movs r3, #0x99
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076872
	bl unk_7c440
	bl unk_7cfb0
	b _08076872
	.align 2, 0
_08076790: .4byte gWrittenToBldy
_08076794: .4byte 0x04000050
_08076798: .4byte 0x03000B85
_0807679C: .4byte gNonGameplayRam
_080767A0:
	ldr r0, _080767D4 @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807680C
	ldr r0, _080767D8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #4
	bne _080767B8
	movs r4, #1
_080767B8:
	ldr r2, _080767DC @ =gWrittenToBldalpha_L
	ldr r3, _080767E0 @ =gWrittenToBldalpha_R
	ldrh r1, [r2]
	ldrh r0, [r3]
	orrs r0, r1
	adds r6, r2, #0
	adds r2, r3, #0
	cmp r0, #0
	beq _080767F4
	ldrh r0, [r2]
	cmp r0, r4
	blt _080767E4
	subs r0, r0, r4
	b _080767E6
	.align 2, 0
_080767D4: .4byte gNonGameplayRam
_080767D8: .4byte gPauseScreenFlag
_080767DC: .4byte gWrittenToBldalpha_L
_080767E0: .4byte gWrittenToBldalpha_R
_080767E4:
	movs r0, #0
_080767E6:
	strh r0, [r2]
	ldrh r0, [r6]
	cmp r0, #0
	beq _080767FA
	subs r0, #1
	strh r0, [r6]
	b _080767FA
_080767F4:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080767FA:
	ldr r0, _08076808 @ =0x04000052
	ldrh r1, [r6]
	lsls r1, r1, #8
	ldrh r2, [r2]
	orrs r1, r2
	strh r1, [r0]
	b _08076872
	.align 2, 0
_08076808: .4byte 0x04000052
_0807680C:
	ldr r1, _08076828 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0807682C
	adds r0, #4
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _08076872
	movs r0, #0x10
	strh r0, [r1]
	b _08076872
	.align 2, 0
_08076828: .4byte gWrittenToBldy
_0807682C:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08076872
_08076834:
	ldr r1, _08076888 @ =gPauseScreenFlag
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #3
	bne _0807686A
	ldr r0, _0807688C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x61
	bne _0807686A
	ldr r0, _08076890 @ =gPreviousCutscene
	ldrb r0, [r0]
	cmp r0, #7
	beq _0807686A
	movs r0, #5
	strb r0, [r1]
	ldr r1, _08076894 @ =gCurrentCutscene
	movs r0, #7
	strb r0, [r1]
	ldr r1, _08076898 @ =0x0201C000
	ldr r2, _0807689C @ =0x06010000
	movs r3, #0x80
	lsls r3, r3, #8
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_0807686A:
	movs r7, #1
	ldr r1, _080768A0 @ =0x03000B85
	movs r0, #0
	strb r0, [r1]
_08076872:
	bl MapScreenUpdateArrowsAndBlinkingSquare
	bl PauseScreenProcessOam
	bl ResetFreeOam
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08076888: .4byte gPauseScreenFlag
_0807688C: .4byte gEventCounter
_08076890: .4byte gPreviousCutscene
_08076894: .4byte gCurrentCutscene
_08076898: .4byte 0x0201C000
_0807689C: .4byte 0x06010000
_080768A0: .4byte 0x03000B85

	thumb_func_start PauseScreenVBLank
PauseScreenVBLank: @ 0x080768A4
	ldr r1, _08076908 @ =0x040000D4
	ldr r0, _0807690C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08076910 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xd4
	ldr r0, _08076914 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x54
	ldr r0, _08076918 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #8
	ldr r0, _0807691C @ =gWrittenToMosaic_L
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08076920 @ =0x04000010
	ldr r1, _08076924 @ =gBackgroundPositions
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #6]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xe]
	strh r0, [r2]
	bx lr
	.align 2, 0
_08076908: .4byte 0x040000D4
_0807690C: .4byte gOamData
_08076910: .4byte 0x84000100
_08076914: .4byte gNonGameplayRam
_08076918: .4byte gWrittenToBldy
_0807691C: .4byte gWrittenToMosaic_L
_08076920: .4byte 0x04000010
_08076924: .4byte gBackgroundPositions

	thumb_func_start PauseScreenVBLank_Unused
PauseScreenVBLank_Unused: @ 0x08076928
	push {lr}
	ldr r0, _08076968 @ =0x0400001C
	movs r2, #0
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _0807696C @ =gNonGameplayRam
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r3, _08076970 @ =0x0300000A
	ldrh r1, [r3]
	cmp r1, #0
	beq _08076952
	ldr r0, _08076974 @ =0x0400000E
	strh r1, [r0]
	strh r2, [r3]
_08076952:
	ldr r2, _08076978 @ =0x04000052
	ldr r0, _0807697C @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08076980 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08076968: .4byte 0x0400001C
_0807696C: .4byte gNonGameplayRam
_08076970: .4byte 0x0300000A
_08076974: .4byte 0x0400000E
_08076978: .4byte 0x04000052
_0807697C: .4byte gWrittenToBldalpha_L
_08076980: .4byte gWrittenToBldalpha_R

	thumb_func_start PauseScreenInitVBlank
PauseScreenInitVBlank: @ 0x08076984
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PauseScreenInit
PauseScreenInit: @ 0x08076990
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r0, _08076A50 @ =PauseScreenInitVBlank
	bl CallbackSetVBlank
	movs r0, #1
	mov sb, r0
	ldr r1, _08076A54 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r2, _08076A58 @ =0x04000054
	ldr r1, _08076A5C @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	strh r0, [r2]
	movs r0, #0x80
	lsls r0, r0, #0x13
	movs r5, #0
	strh r5, [r0]
	ldr r4, _08076A60 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08076A64 @ =gNextOamSlot
	strb r5, [r0]
	movs r3, #0xa8
	lsls r3, r3, #3
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r4, #0
	bl BitFill
	bl ResetFreeOam
	ldr r1, _08076A68 @ =0x040000D4
	ldr r0, _08076A6C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08076A70 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r6, _08076A74 @ =gPauseScreenFlag
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #4
	beq _08076A10
	ldr r1, _08076A78 @ =0x06010000
	ldr r2, _08076A7C @ =0x0201C000
	movs r3, #0x80
	lsls r3, r3, #8
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_08076A10:
	ldr r0, _08076A80 @ =gCurrentArea
	ldrb r2, [r0]
	ldr r3, _08076A84 @ =0x00000212
	adds r0, r4, r3
	strb r2, [r0]
	ldr r0, _08076A88 @ =0x03000031
	ldrb r1, [r0]
	subs r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _08076A8C @ =0x03000032
	ldrb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	strb r5, [r4, #2]
	mov r0, sb
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #3
	bne _08076A94
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _08076AA8
	ldr r0, _08076A90 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076AA8
	movs r0, #2
	strb r0, [r4]
	b _08076AA8
	.align 2, 0
_08076A50: .4byte PauseScreenInitVBlank
_08076A54: .4byte 0x04000050
_08076A58: .4byte 0x04000054
_08076A5C: .4byte gWrittenToBldy
_08076A60: .4byte gNonGameplayRam
_08076A64: .4byte gNextOamSlot
_08076A68: .4byte 0x040000D4
_08076A6C: .4byte gOamData
_08076A70: .4byte 0x84000100
_08076A74: .4byte gPauseScreenFlag
_08076A78: .4byte 0x06010000
_08076A7C: .4byte 0x0201C000
_08076A80: .4byte gCurrentArea
_08076A84: .4byte 0x00000212
_08076A88: .4byte 0x03000031
_08076A8C: .4byte 0x03000032
_08076A90: .4byte gCurrentRoom
_08076A94:
	cmp r0, #1
	bne _08076AA2
	movs r0, #2
	strb r0, [r4]
	bl unk_36c4
	b _08076AA8
_08076AA2:
	cmp r0, #4
	beq _08076AA8
	strb r5, [r4]
_08076AA8:
	ldr r4, _08076B04 @ =0x040000D4
	ldr r0, _08076B08 @ =0x085657A8
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _08076B0C @ =0x80000030
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08076B10 @ =0x0856F71C
	ldr r1, _08076B14 @ =0x06010000
	bl CallLZ77UncompVram
	ldr r1, _08076B18 @ =0x08561FA8
	ldr r2, _08076B1C @ =0x06008000
	movs r3, #0xe0
	lsls r3, r3, #6
	movs r5, #0x10
	str r5, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r0, _08076B20 @ =0x08565B48
	str r0, [r4]
	ldr r0, _08076B24 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _08076B28 @ =0x80000100
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08076B2C @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076B40
	ldr r0, _08076B30 @ =0x0856A254
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
	ldr r0, _08076B34 @ =0x08565808
	str r0, [r4]
	ldr r0, _08076B38 @ =0x05000060
	str r0, [r4, #4]
	ldr r0, _08076B3C @ =0x800000D0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	b _08076BAA
	.align 2, 0
_08076B04: .4byte 0x040000D4
_08076B08: .4byte 0x085657A8
_08076B0C: .4byte 0x80000030
_08076B10: .4byte 0x0856F71C
_08076B14: .4byte 0x06010000
_08076B18: .4byte 0x08561FA8
_08076B1C: .4byte 0x06008000
_08076B20: .4byte 0x08565B48
_08076B24: .4byte 0x05000200
_08076B28: .4byte 0x80000100
_08076B2C: .4byte gNonGameplayRam
_08076B30: .4byte 0x0856A254
_08076B34: .4byte 0x08565808
_08076B38: .4byte 0x05000060
_08076B3C: .4byte 0x800000D0
_08076B40:
	cmp r0, #1
	bne _08076BA0
	ldr r0, _08076B60 @ =0x0856C868
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
	ldr r0, _08076B64 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08076B68
	movs r3, #2
	b _08076B78
	.align 2, 0
_08076B60: .4byte 0x0856C868
_08076B64: .4byte gEquipment
_08076B68:
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	lsrs r3, r0, #0x1f
	cmp r3, #0
	beq _08076BAA
_08076B78:
	ldr r2, _08076B90 @ =0x040000D4
	lsls r0, r3, #5
	ldr r1, _08076B94 @ =0x08565D48
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08076B98 @ =0x05000200
	str r0, [r2, #4]
	ldr r0, _08076B9C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _08076BAA
	.align 2, 0
_08076B90: .4byte 0x040000D4
_08076B94: .4byte 0x08565D48
_08076B98: .4byte 0x05000200
_08076B9C: .4byte 0x80000010
_08076BA0:
	ldr r0, _08076C44 @ =0x0856DE80
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl CallLZ77UncompVram
_08076BAA:
	ldr r1, _08076C48 @ =gNonGameplayRam
	mov r8, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _08076BD2
	ldr r1, _08076C4C @ =0x040000D4
	ldr r0, _08076C50 @ =0x06009800
	str r0, [r1]
	ldr r0, _08076C54 @ =0x06009400
	str r0, [r1, #4]
	ldr r0, _08076C58 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08076C5C @ =0x085659A8
	str r0, [r1]
	ldr r0, _08076C60 @ =0x05000060
	str r0, [r1, #4]
	ldr r0, _08076C64 @ =0x800000D0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076BD2:
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r6, _08076C68 @ =0x02034800
	movs r0, #0xa
	adds r1, r6, #0
	bl GetMinimapData
	ldr r5, _08076C4C @ =0x040000D4
	str r6, [r5]
	ldr r0, _08076C6C @ =0x0600E800
	str r0, [r5, #4]
	ldr r7, _08076C70 @ =0x80000400
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	str r6, [r5]
	ldr r0, _08076C74 @ =0x0600F000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	str r6, [r5]
	ldr r0, _08076C78 @ =0x0600F800
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _08076C7C @ =gCurrentArea
	ldrb r3, [r0]
	ldr r0, _08076C80 @ =0x02034000
	str r0, [r5]
	ldr r0, _08076C84 @ =0x0600E000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _08076C88 @ =0x085742E8
	ldr r4, _08076C8C @ =0x0200F800
	adds r1, r4, #0
	bl CallLZ77UncompVram
	str r4, [r5]
	ldr r0, _08076C90 @ =0x0600C000
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _08076CC8
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08076C98
	ldr r0, _08076C94 @ =0x08573EA0
	adds r1, r6, #0
	bl CallLZ77UncompVram
	b _08076CA0
	.align 2, 0
_08076C44: .4byte 0x0856DE80
_08076C48: .4byte gNonGameplayRam
_08076C4C: .4byte 0x040000D4
_08076C50: .4byte 0x06009800
_08076C54: .4byte 0x06009400
_08076C58: .4byte 0x80000200
_08076C5C: .4byte 0x085659A8
_08076C60: .4byte 0x05000060
_08076C64: .4byte 0x800000D0
_08076C68: .4byte 0x02034800
_08076C6C: .4byte 0x0600E800
_08076C70: .4byte 0x80000400
_08076C74: .4byte 0x0600F000
_08076C78: .4byte 0x0600F800
_08076C7C: .4byte gCurrentArea
_08076C80: .4byte 0x02034000
_08076C84: .4byte 0x0600E000
_08076C88: .4byte 0x085742E8
_08076C8C: .4byte 0x0200F800
_08076C90: .4byte 0x0600C000
_08076C94: .4byte 0x08573EA0
_08076C98:
	ldr r0, _08076CB4 @ =0x085748AC
	adds r1, r6, #0
	bl CallLZ77UncompVram
_08076CA0:
	ldr r1, _08076CB8 @ =0x040000D4
	ldr r0, _08076CBC @ =0x02034800
	str r0, [r1]
	ldr r0, _08076CC0 @ =0x0600C800
	str r0, [r1, #4]
	ldr r0, _08076CC4 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08076CE6
	.align 2, 0
_08076CB4: .4byte 0x085748AC
_08076CB8: .4byte 0x040000D4
_08076CBC: .4byte 0x02034800
_08076CC0: .4byte 0x0600C800
_08076CC4: .4byte 0x80000400
_08076CC8:
	cmp r0, #1
	bne _08076CD4
	ldr r0, _08076CD0 @ =0x08574D48
	b _08076CD6
	.align 2, 0
_08076CD0: .4byte 0x08574D48
_08076CD4:
	ldr r0, _08076D10 @ =0x085753E8
_08076CD6:
	adds r1, r6, #0
	bl CallLZ77UncompVram
	str r6, [r5]
	ldr r0, _08076D14 @ =0x0600D800
	str r0, [r5, #4]
	str r7, [r5, #8]
	ldr r0, [r5, #8]
_08076CE6:
	ldr r0, _08076D18 @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	bne _08076D38
	ldr r0, _08076D1C @ =0x085740FC
	ldr r4, _08076D20 @ =0x02034800
	adds r1, r4, #0
	bl CallLZ77UncompVram
	ldr r1, _08076D24 @ =0x040000D4
	str r4, [r1]
	ldr r0, _08076D28 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08076D2C @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08076D30 @ =0x085745A8
	ldr r1, _08076D34 @ =0x02010000
	bl CallLZ77UncompVram
	b _08076D74
	.align 2, 0
_08076D10: .4byte 0x085753E8
_08076D14: .4byte 0x0600D800
_08076D18: .4byte gNonGameplayRam
_08076D1C: .4byte 0x085740FC
_08076D20: .4byte 0x02034800
_08076D24: .4byte 0x040000D4
_08076D28: .4byte 0x0600D000
_08076D2C: .4byte 0x80000400
_08076D30: .4byte 0x085745A8
_08076D34: .4byte 0x02010000
_08076D38:
	ldr r0, _08076D50 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _08076D5C
	ldr r0, _08076D54 @ =0x08573DA4
	ldr r1, _08076D58 @ =0x02034800
	bl CallLZ77UncompVram
	b _08076D64
	.align 2, 0
_08076D50: .4byte gPauseScreenFlag
_08076D54: .4byte 0x08573DA4
_08076D58: .4byte 0x02034800
_08076D5C:
	ldr r0, _08076DBC @ =0x08573DA4
	ldr r1, _08076DC0 @ =0x02034800
	bl CallLZ77UncompVram
_08076D64:
	ldr r1, _08076DC4 @ =0x040000D4
	ldr r0, _08076DC0 @ =0x02034800
	str r0, [r1]
	ldr r0, _08076DC8 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08076DCC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076D74:
	ldr r0, _08076DD0 @ =gCurrentArea
	ldrb r0, [r0]
	ldr r1, _08076DC0 @ =0x02034800
	bl GetMinimapData
	movs r1, #0
	ldr r2, _08076DD4 @ =gBackgroundPositions
	adds r0, r2, #0
	movs r3, #3
_08076D86:
	strh r1, [r0]
	strh r1, [r0, #2]
	adds r0, #4
	subs r3, #1
	cmp r3, #0
	bge _08076D86
	ldr r1, _08076DD8 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #7]
	strb r0, [r1, #9]
	strb r0, [r1, #6]
	strb r0, [r1, #8]
	ldr r0, _08076DDC @ =0x0879BE88
	ldr r0, [r0]
	str r0, [r1, #0x28]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #6]
	movs r0, #3
	strb r0, [r1, #1]
	ldrb r0, [r1]
	adds r5, r1, #0
	cmp r0, #0
	beq _08076DE0
	movs r0, #1
	b _08076DF6
	.align 2, 0
_08076DBC: .4byte 0x08573DA4
_08076DC0: .4byte 0x02034800
_08076DC4: .4byte 0x040000D4
_08076DC8: .4byte 0x0600D000
_08076DCC: .4byte 0x80000400
_08076DD0: .4byte gCurrentArea
_08076DD4: .4byte gBackgroundPositions
_08076DD8: .4byte gNonGameplayRam
_08076DDC: .4byte 0x0879BE88
_08076DE0:
	ldr r0, _08076DF0 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	bne _08076DF4
	movs r0, #0
	b _08076DF6
	.align 2, 0
_08076DF0: .4byte gPauseScreenFlag
_08076DF4:
	movs r0, #2
_08076DF6:
	strb r0, [r5, #1]
	ldrb r0, [r5]
	cmp r0, #0
	beq _08076E4C
	bl CheckSetNavigationRoomEvent
	cmp r0, #0
	beq _08076E28
	adds r1, r5, #0
	adds r1, #0x28
	movs r0, #4
	strb r0, [r1]
	ldr r4, _08076E20 @ =gCurrentArea
	ldrb r0, [r4]
	ldr r1, _08076E24 @ =0x02034000
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	b _08076E30
	.align 2, 0
_08076E20: .4byte gCurrentArea
_08076E24: .4byte 0x02034000
_08076E28:
	adds r1, r5, #0
	adds r1, #0x28
	movs r0, #0xa
	strb r0, [r1]
_08076E30:
	ldr r0, _08076E5C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5b
	bhi _08076E4C
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _08076E60 @ =0x040000D4
	add r3, sp, #4
	str r3, [r1]
	ldr r0, _08076E64 @ =0x06017C00
	str r0, [r1, #4]
	ldr r0, _08076E68 @ =0x85000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08076E4C:
	ldr r0, _08076E6C @ =gNonGameplayRam
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _08076E70
	bl DebugMenuDrawEverything
	b _08076E74
	.align 2, 0
_08076E5C: .4byte gEventCounter
_08076E60: .4byte 0x040000D4
_08076E64: .4byte 0x06017C00
_08076E68: .4byte 0x85000010
_08076E6C: .4byte gNonGameplayRam
_08076E70:
	bl StatusScreenDrawEverything
_08076E74:
	movs r0, #0
	bl unk_75988
	bl ProcessPauseScreenText
	bl ProcessEasySleepText
	bl PauseScreenSetupOam
	bl NavigationConversationGetCurrentConversation
	bl NavigationConversationLoadPopUpGraphics
	bl NavigationConversationLoadSpecialGraphics
	movs r0, #0xff
	bl unk_77840
	bl unk_7ce6c
	ldr r2, _08076EF8 @ =0x04000010
	ldr r1, _08076EFC @ =gBackgroundPositions
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #2]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #6]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xa]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0xe]
	strh r0, [r2]
	ldr r5, _08076F00 @ =gWrittenToBldy
	movs r1, #0
	strh r1, [r5]
	ldr r4, _08076F04 @ =gWrittenToBldalpha_L
	strh r1, [r4]
	ldr r3, _08076F08 @ =gWrittenToBldalpha_R
	movs r2, #0x10
	strh r2, [r3]
	ldr r0, _08076F0C @ =gNonGameplayRam
	ldrb r0, [r0]
	cmp r0, #0
	beq _08076F18
	strh r1, [r4]
	strh r1, [r3]
	ldr r1, _08076F10 @ =0x04000050
	ldr r4, _08076F14 @ =0x00003F7F
	adds r0, r4, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0
	b _08076F1E
	.align 2, 0
_08076EF8: .4byte 0x04000010
_08076EFC: .4byte gBackgroundPositions
_08076F00: .4byte gWrittenToBldy
_08076F04: .4byte gWrittenToBldalpha_L
_08076F08: .4byte gWrittenToBldalpha_R
_08076F0C: .4byte gNonGameplayRam
_08076F10: .4byte 0x04000050
_08076F14: .4byte 0x00003F7F
_08076F18:
	strh r2, [r5]
	ldr r1, _08076F3C @ =0x04000050
	movs r0, #0xff
_08076F1E:
	strh r0, [r1]
	ldr r1, _08076F40 @ =0x04000040
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08076F44 @ =gNonGameplayRam
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	beq _08076F4C
	ldr r1, _08076F48 @ =0x0400004A
	movs r0, #0x37
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x3f
	b _08076F56
	.align 2, 0
_08076F3C: .4byte 0x04000050
_08076F40: .4byte 0x04000040
_08076F44: .4byte gNonGameplayRam
_08076F48: .4byte 0x0400004A
_08076F4C:
	ldr r1, _08076FDC @ =0x0400004A
	movs r0, #0x35
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x3d
_08076F56:
	strb r0, [r1]
	ldr r1, _08076FE0 @ =0x04000048
	movs r0, #0x3f
	strb r0, [r1]
	adds r4, r5, #0
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	movs r3, #0
	cmp r0, #1
	beq _08076F6E
	movs r3, #0xa0
_08076F6E:
	ldr r1, _08076FE4 @ =0x04000044
	lsls r0, r3, #8
	movs r2, #0xa0
	orrs r0, r2
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _08076FE8 @ =0x04000046
	strh r2, [r0]
	ldr r0, _08076FEC @ =gWrittenToMosaic_L
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08076FF0 @ =0x0400004C
	strh r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08077018
	ldr r1, _08076FF4 @ =0x0400000A
	ldr r2, _08076FF8 @ =0x00001B03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r3, _08076FFC @ =0x0000DC49
	adds r0, r3, #0
	strh r0, [r1]
	subs r1, #6
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r3, r4, r0
	movs r2, #0xbe
	lsls r2, r2, #7
	strh r2, [r3]
	ldr r0, _08077000 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08077008
	adds r1, #4
	ldr r4, _08077004 @ =0x00001A0A
	adds r0, r4, #0
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r0, #0
	adds r0, r2, #0
	eors r0, r1
	strh r0, [r3]
	b _08077046
	.align 2, 0
_08076FDC: .4byte 0x0400004A
_08076FE0: .4byte 0x04000048
_08076FE4: .4byte 0x04000044
_08076FE8: .4byte 0x04000046
_08076FEC: .4byte gWrittenToMosaic_L
_08076FF0: .4byte 0x0400004C
_08076FF4: .4byte 0x0400000A
_08076FF8: .4byte 0x00001B03
_08076FFC: .4byte 0x0000DC49
_08077000: .4byte gPauseScreenFlag
_08077004: .4byte 0x00001A0A
_08077008:
	ldr r1, _08077010 @ =0x0400000C
	ldr r2, _08077014 @ =0x00001A0A
	adds r0, r2, #0
	b _08077044
	.align 2, 0
_08077010: .4byte 0x0400000C
_08077014: .4byte 0x00001A0A
_08077018:
	ldr r1, _0807706C @ =0x0400000E
	ldr r3, _08077070 @ =0x0000DC4B
	adds r0, r3, #0
	strh r0, [r1]
	subs r1, #2
	ldr r4, _08077074 @ =0x00001A02
	adds r0, r4, #0
	strh r0, [r1]
	subs r1, #4
	ldr r2, _08077078 @ =0x00001801
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r3, #0xc8
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	movs r4, #0x9a
	lsls r4, r4, #2
	adds r1, r5, r4
	movs r0, #0xfc
	lsls r0, r0, #7
_08077044:
	strh r0, [r1]
_08077046:
	ldr r0, _0807707C @ =PauseScreenVBLank
	bl CallbackSetVBlank
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _08077080 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	mov r0, sb
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807706C: .4byte 0x0400000E
_08077070: .4byte 0x0000DC4B
_08077074: .4byte 0x00001A02
_08077078: .4byte 0x00001801
_0807707C: .4byte PauseScreenVBLank
_08077080: .4byte gNonGameplayRam

	thumb_func_start GetMinimapData
GetMinimapData: @ 0x08077084
	push {lr}
	adds r2, r1, #0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0807709A
	ldr r0, _080770AC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5d
	bls _0807709A
	movs r1, #9
_0807709A:
	ldr r0, _080770B0 @ =0x0879BE5C
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	adds r1, r2, #0
	bl CallLZ77UncompVram
	pop {r0}
	bx r0
	.align 2, 0
_080770AC: .4byte gEventCounter
_080770B0: .4byte 0x0879BE5C

	thumb_func_start PauseScreenCallCurrentSubroutine
PauseScreenCallCurrentSubroutine: @ 0x080770B4
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080770E8 @ =gNonGameplayRam
	adds r5, r4, #0
	adds r5, #0x28
	ldrb r0, [r5]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080770CE
	bl CheckForMaintainedInput
_080770CE:
	ldrb r0, [r4, #6]
	adds r0, #1
	strb r0, [r4, #6]
	ldrb r0, [r5]
	cmp r0, #0xc
	bls _080770DC
	b _08077262
_080770DC:
	lsls r0, r0, #2
	ldr r1, _080770EC @ =_080770F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080770E8: .4byte gNonGameplayRam
_080770EC: .4byte _080770F0
_080770F0: @ jump table
	.4byte _08077124 @ case 0
	.4byte _0807714A @ case 1
	.4byte _08077136 @ case 2
	.4byte _08077166 @ case 3
	.4byte _08077196 @ case 4
	.4byte _080771AC @ case 5
	.4byte _080771C4 @ case 6
	.4byte _080771DC @ case 7
	.4byte _080771E2 @ case 8
	.4byte _08077208 @ case 9
	.4byte _080771E2 @ case 10
	.4byte _0807722C @ case 11
	.4byte _0807724C @ case 12
_08077124:
	ldr r2, _0807713C @ =gChangedInput
	ldr r0, _08077140 @ =gButtonAssignments
	ldrh r0, [r0, #6]
	movs r1, #2
	orrs r0, r1
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08077144
_08077136:
	movs r6, #1
	b _08077262
	.align 2, 0
_0807713C: .4byte gChangedInput
_08077140: .4byte gButtonAssignments
_08077144:
	bl MapScreenSubroutine
	b _08077262
_0807714A:
	ldr r0, _0807715C @ =gNonGameplayRam
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _08077160
	bl PauseScreenMoveDebugCursor
	bl DebugMenuSubroutine
	b _08077262
	.align 2, 0
_0807715C: .4byte gNonGameplayRam
_08077160:
	bl StatusScreenSubroutine
	b _08077262
_08077166:
	ldr r4, _0807717C @ =gNonGameplayRam
	movs r1, #0x99
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077180
	bl unk_7c630
	b _08077262
	.align 2, 0
_0807717C: .4byte gNonGameplayRam
_08077180:
	bl NavigationConversationUpdatePopUp
	bl NavigationConversationSubroutine
	cmp r0, #0
	beq _08077262
	adds r1, r4, #0
	adds r1, #0x28
	movs r0, #9
	strb r0, [r1]
	b _08077262
_08077196:
	bl PauseScreenMapDownload
	cmp r0, #0
	beq _08077262
	ldr r0, _080771A8 @ =gNonGameplayRam
	adds r0, #0x28
	movs r1, #8
	strb r1, [r0]
	b _08077262
	.align 2, 0
_080771A8: .4byte gNonGameplayRam
_080771AC:
	bl EasySleepMenuSubroutine
	cmp r0, #0
	beq _08077262
	ldr r0, _080771C0 @ =gNonGameplayRam
	adds r0, #0x28
	movs r1, #0xc
	strb r1, [r0]
	b _08077262
	.align 2, 0
_080771C0: .4byte gNonGameplayRam
_080771C4:
	bl DebugMenuWindowAppearing
	cmp r0, #0
	beq _08077262
	ldr r1, _080771D8 @ =gNonGameplayRam
	adds r3, r1, #0
	adds r3, #0x28
	movs r2, #0
	movs r0, #1
	b _0807723E
	.align 2, 0
_080771D8: .4byte gNonGameplayRam
_080771DC:
	bl DebugMenuWindowDisappearing
	b _08077250
_080771E2:
	ldr r0, _08077204 @ =gNonGameplayRam
	adds r3, r0, #0
	adds r3, #0x28
	movs r2, #0
	movs r1, #3
	strb r1, [r3]
	movs r1, #0
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	b _0807725E
	.align 2, 0
_08077204: .4byte gNonGameplayRam
_08077208:
	ldr r0, _0807721C @ =gNonGameplayRam
	ldrb r2, [r0]
	cmp r2, #0
	beq _08077220
	adds r1, r0, #0
	adds r1, #0x28
	movs r0, #2
	strb r0, [r1]
	b _08077262
	.align 2, 0
_0807721C: .4byte gNonGameplayRam
_08077220:
	adds r0, #0x28
	strb r2, [r0]
	movs r0, #4
	bl unk_77840
	b _08077262
_0807722C:
	bl EasySleepMenuInit
	cmp r0, #0
	beq _08077262
	ldr r1, _08077248 @ =gNonGameplayRam
	adds r3, r1, #0
	adds r3, #0x28
	movs r2, #0
	movs r0, #5
_0807723E:
	strb r0, [r3]
	strb r2, [r1, #7]
	strb r2, [r1, #6]
	b _08077262
	.align 2, 0
_08077248: .4byte gNonGameplayRam
_0807724C:
	bl EasySleepMenuQuit
_08077250:
	cmp r0, #0
	beq _08077262
	ldr r0, _0807726C @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0x28
	movs r1, #0
	strb r1, [r2]
_0807725E:
	strb r1, [r0, #7]
	strb r1, [r0, #6]
_08077262:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807726C: .4byte gNonGameplayRam

	thumb_func_start PauseScreenMoveDebugCursor
PauseScreenMoveDebugCursor: @ 0x08077270
	push {r4, lr}
	movs r2, #0
	ldr r0, _080772AC @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807728A
	ldr r0, _080772B0 @ =gNonGameplayRam
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _0807728A
	movs r2, #1
_0807728A:
	cmp r2, #0
	beq _0807730E
	ldr r1, _080772B4 @ =gChangedInput
	ldrh r2, [r1]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080772B8
	ldr r2, _080772B0 @ =gNonGameplayRam
	ldrh r3, [r2, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	cmp r0, #0
	beq _080772D2
	adds r0, r3, #0
	subs r0, #8
	b _080772D0
	.align 2, 0
_080772AC: .4byte gButtonInput
_080772B0: .4byte gNonGameplayRam
_080772B4: .4byte gChangedInput
_080772B8:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _080772D2
	ldr r2, _080772F0 @ =gNonGameplayRam
	ldrh r3, [r2, #0x2c]
	movs r4, #0x2c
	ldrsh r0, [r2, r4]
	cmp r0, #0x8f
	bgt _080772D2
	adds r0, r3, #0
	adds r0, #8
_080772D0:
	strh r0, [r2, #0x2c]
_080772D2:
	ldrh r1, [r1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080772F4
	ldr r1, _080772F0 @ =gNonGameplayRam
	ldrh r2, [r1, #0x2e]
	movs r3, #0x2e
	ldrsh r0, [r1, r3]
	cmp r0, #0xe7
	bgt _0807730E
	adds r0, r2, #0
	adds r0, #8
	b _0807730C
	.align 2, 0
_080772F0: .4byte gNonGameplayRam
_080772F4:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807730E
	ldr r1, _08077314 @ =gNonGameplayRam
	ldrh r2, [r1, #0x2e]
	movs r4, #0x2e
	ldrsh r0, [r1, r4]
	cmp r0, #0
	beq _0807730E
	adds r0, r2, #0
	subs r0, #8
_0807730C:
	strh r0, [r1, #0x2e]
_0807730E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08077314: .4byte gNonGameplayRam

	thumb_func_start PauseScreenMoveBackgroundToXPosition
PauseScreenMoveBackgroundToXPosition: @ 0x08077318
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r7, #0
	ldr r1, _08077344 @ =gBackgroundPositions
	lsls r0, r5, #2
	adds r3, r0, r1
	ldrh r2, [r3]
	movs r6, #1
	cmp r2, r4
	bls _08077334
	subs r6, #2
_08077334:
	ldr r0, _08077348 @ =gNonGameplayRam
	ldrb r0, [r0, #6]
	adds r0, #4
	cmp r0, #0x1f
	bgt _0807734C
	muls r0, r6, r0
	b _0807734E
	.align 2, 0
_08077344: .4byte gBackgroundPositions
_08077348: .4byte gNonGameplayRam
_0807734C:
	lsls r0, r6, #5
_0807734E:
	adds r0, r2, r0
	strh r0, [r3]
	cmp r6, #0
	ble _08077364
	lsls r0, r5, #2
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, r4
	blo _0807737A
	strh r4, [r1]
	b _08077378
_08077364:
	lsls r0, r5, #2
	adds r1, r0, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, r4
	bgt _0807737A
	subs r0, r4, r0
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
_08077378:
	movs r7, #1
_0807737A:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start PauseScreenMoveBackgroundToYPosition
PauseScreenMoveBackgroundToYPosition: @ 0x08077384
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r0, #0
	mov ip, r0
	ldr r1, _080773B4 @ =gBackgroundPositions
	lsls r0, r5, #2
	adds r3, r0, r1
	ldrh r2, [r3, #2]
	movs r4, #1
	adds r7, r1, #0
	cmp r2, r6
	bls _080773A4
	subs r4, #2
_080773A4:
	ldr r0, _080773B8 @ =gNonGameplayRam
	ldrb r0, [r0, #6]
	adds r0, #4
	cmp r0, #0x1f
	bgt _080773BC
	muls r0, r4, r0
	b _080773BE
	.align 2, 0
_080773B4: .4byte gBackgroundPositions
_080773B8: .4byte gNonGameplayRam
_080773BC:
	lsls r0, r4, #5
_080773BE:
	adds r0, r2, r0
	strh r0, [r3, #2]
	cmp r4, #0
	ble _080773D6
	lsls r0, r5, #2
	adds r1, r0, r7
	ldrh r1, [r1, #2]
	cmp r1, r6
	blo _080773E6
	movs r1, #1
	mov ip, r1
	b _080773EC
_080773D6:
	lsls r0, r5, #2
	adds r1, r0, r7
	movs r2, #2
	ldrsh r1, [r1, r2]
	cmp r1, r6
	bgt _080773E6
	movs r1, #1
	mov ip, r1
_080773E6:
	mov r2, ip
	cmp r2, #0
	beq _080773F0
_080773EC:
	adds r0, r0, r7
	strh r6, [r0, #2]
_080773F0:
	mov r0, ip
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start PauseScreenSetDebugMenuWindow
PauseScreenSetDebugMenuWindow: @ 0x080773F8
	push {lr}
	ldr r0, _08077418 @ =gBackgroundPositions
	ldrh r1, [r0, #6]
	movs r0, #0x80
	lsls r0, r0, #2
	subs r1, r0, r1
	cmp r1, #0xa0
	ble _0807740A
	movs r1, #0xa0
_0807740A:
	ldr r0, _0807741C @ =0x04000044
	lsls r1, r1, #8
	movs r2, #0xa0
	orrs r1, r2
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08077418: .4byte gBackgroundPositions
_0807741C: .4byte 0x04000044

	thumb_func_start DebugMenuWindowAppearing
DebugMenuWindowAppearing: @ 0x08077420
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08077438 @ =gNonGameplayRam
	ldrb r0, [r4, #7]
	cmp r0, #1
	beq _08077454
	cmp r0, #1
	bgt _0807743C
	cmp r0, #0
	beq _08077442
	b _08077496
	.align 2, 0
_08077438: .4byte gNonGameplayRam
_0807743C:
	cmp r0, #2
	beq _08077462
	b _08077496
_08077442:
	movs r0, #0x80
	lsls r0, r0, #2
	bl SoundPlay
	movs r0, #0x10
	movs r1, #0x29
	bl UpdateMenuOamDataID
	b _0807745A
_08077454:
	ldrb r0, [r4, #6]
	cmp r0, #0x10
	bls _08077496
_0807745A:
	movs r0, #2
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	b _08077496
_08077462:
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #1
	bl PauseScreenMoveBackgroundToYPosition
	cmp r0, #0
	beq _08077492
	movs r0, #0x10
	movs r1, #0x28
	bl UpdateMenuOamDataID
	movs r0, #0x11
	movs r1, #0x2a
	bl UpdateMenuOamDataID
	movs r0, #3
	bl unk_77840
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _08077490
	bl DebugMenuSetupCursor
_08077490:
	movs r5, #1
_08077492:
	bl PauseScreenSetDebugMenuWindow
_08077496:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DebugMenuWindowDisappearing
DebugMenuWindowDisappearing: @ 0x080774A0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _080774B8 @ =gNonGameplayRam
	ldrb r0, [r4, #7]
	cmp r0, #1
	beq _080774D4
	cmp r0, #1
	bgt _080774BC
	cmp r0, #0
	beq _080774C2
	b _080774F6
	.align 2, 0
_080774B8: .4byte gNonGameplayRam
_080774BC:
	cmp r0, #2
	beq _080774E2
	b _080774F6
_080774C2:
	ldr r0, _080774D0 @ =0x00000201
	bl SoundPlay
	movs r0, #4
	bl unk_77840
	b _080774DA
	.align 2, 0
_080774D0: .4byte 0x00000201
_080774D4:
	ldrb r0, [r4, #6]
	cmp r0, #4
	bls _080774F6
_080774DA:
	movs r0, #2
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	b _080774F6
_080774E2:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #1
	bl PauseScreenMoveBackgroundToYPosition
	cmp r0, #0
	beq _080774F2
	movs r5, #1
_080774F2:
	bl PauseScreenSetDebugMenuWindow
_080774F6:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EasySleepMenuInit
EasySleepMenuInit: @ 0x08077500
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _0807751C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r4, r0, #0
	cmp r1, #8
	bls _08077512
	b _080776FC
_08077512:
	lsls r0, r1, #2
	ldr r1, _08077520 @ =_08077524
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807751C: .4byte gNonGameplayRam
_08077520: .4byte _08077524
_08077524: @ jump table
	.4byte _08077548 @ case 0
	.4byte _08077564 @ case 1
	.4byte _08077588 @ case 2
	.4byte _080775A0 @ case 3
	.4byte _080775F8 @ case 4
	.4byte _08077658 @ case 5
	.4byte _08077668 @ case 6
	.4byte _08077684 @ case 7
	.4byte _080776EE @ case 8
_08077548:
	ldr r0, _08077560 @ =0x00000202
	bl SoundPlay
	movs r0, #0x11
	movs r1, #0x2b
	bl UpdateMenuOamDataID
	movs r0, #3
	bl unk_77840
	b _08077702
	.align 2, 0
_08077560: .4byte 0x00000202
_08077564:
	ldr r1, _08077578 @ =0x040000D4
	ldr r0, _0807757C @ =0x02010000
	str r0, [r1]
	ldr r0, _08077580 @ =0x0600C000
	str r0, [r1, #4]
	ldr r0, _08077584 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08077702
	.align 2, 0
_08077578: .4byte 0x040000D4
_0807757C: .4byte 0x02010000
_08077580: .4byte 0x0600C000
_08077584: .4byte 0x80000400
_08077588:
	ldr r1, _08077598 @ =0x04000050
	ldr r2, _0807759C @ =0x00003FFE
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	b _08077702
	.align 2, 0
_08077598: .4byte 0x04000050
_0807759C: .4byte 0x00003FFE
_080775A0:
	ldr r0, _080775D0 @ =0x040000D4
	ldr r1, _080775D4 @ =0x0200F000
	str r1, [r0]
	ldr r1, _080775D8 @ =0x0200D380
	str r1, [r0, #4]
	ldr r2, _080775DC @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775E0 @ =0x0200F400
	str r1, [r0]
	ldr r1, _080775E4 @ =0x0200D780
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775E8 @ =0x0200F080
	str r1, [r0]
	ldr r1, _080775EC @ =0x0200DB80
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080775F0 @ =0x0200F480
	str r1, [r0]
	ldr r1, _080775F4 @ =0x0200DF80
	b _08077626
	.align 2, 0
_080775D0: .4byte 0x040000D4
_080775D4: .4byte 0x0200F000
_080775D8: .4byte 0x0200D380
_080775DC: .4byte 0x80000040
_080775E0: .4byte 0x0200F400
_080775E4: .4byte 0x0200D780
_080775E8: .4byte 0x0200F080
_080775EC: .4byte 0x0200DB80
_080775F0: .4byte 0x0200F480
_080775F4: .4byte 0x0200DF80
_080775F8:
	ldr r0, _08077630 @ =0x040000D4
	ldr r1, _08077634 @ =0x0200F1C0
	str r1, [r0]
	ldr r1, _08077638 @ =0x0200E380
	str r1, [r0, #4]
	ldr r2, _0807763C @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077640 @ =0x0200F5C0
	str r1, [r0]
	ldr r1, _08077644 @ =0x0200E780
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077648 @ =0x0200F240
	str r1, [r0]
	ldr r1, _0807764C @ =0x0200EB80
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08077650 @ =0x0200F640
	str r1, [r0]
	ldr r1, _08077654 @ =0x0200EF80
_08077626:
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	b _08077702
	.align 2, 0
_08077630: .4byte 0x040000D4
_08077634: .4byte 0x0200F1C0
_08077638: .4byte 0x0200E380
_0807763C: .4byte 0x80000040
_08077640: .4byte 0x0200F5C0
_08077644: .4byte 0x0200E780
_08077648: .4byte 0x0200F240
_0807764C: .4byte 0x0200EB80
_08077650: .4byte 0x0200F640
_08077654: .4byte 0x0200EF80
_08077658:
	ldr r1, _08077660 @ =0x0200D000
	ldr r2, _08077664 @ =0x06006000
	b _0807766C
	.align 2, 0
_08077660: .4byte 0x0200D000
_08077664: .4byte 0x06006000
_08077668:
	ldr r1, _0807767C @ =0x0200E000
	ldr r2, _08077680 @ =0x06007000
_0807766C:
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _08077702
	.align 2, 0
_0807767C: .4byte 0x0200E000
_08077680: .4byte 0x06007000
_08077684:
	ldrb r0, [r4, #6]
	cmp r0, #1
	bls _080776FC
	movs r0, #0
	strb r0, [r4, #6]
	ldr r1, _080776D8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xb
	bhi _080776DC
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _080776FC
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r4, r3
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	movs r1, #2
	bl UpdateMenuOamDataID
	movs r0, #0x8c
	strh r0, [r4, #0x3a]
	movs r0, #0x44
	strh r0, [r4, #0x38]
	adds r2, r4, #0
	adds r2, #0x43
	ldrb r1, [r2]
	subs r0, #0x51
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	b _080776FC
	.align 2, 0
_080776D8: .4byte gWrittenToBldy
_080776DC:
	movs r0, #0x10
	movs r1, #0x28
	bl UpdateMenuOamDataID
	movs r0, #0x11
	movs r1, #0x2a
	bl UpdateMenuOamDataID
	b _08077702
_080776EE:
	ldr r0, _08077718 @ =gDisableSoftReset
	movs r1, #1
	strb r1, [r0]
	movs r5, #1
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_080776FC:
	movs r0, #0
	cmp r0, #0
	beq _0807770E
_08077702:
	ldr r0, _0807771C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
_0807770E:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08077718: .4byte gDisableSoftReset
_0807771C: .4byte gNonGameplayRam

	thumb_func_start EasySleepMenuQuit
EasySleepMenuQuit: @ 0x08077720
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r5, #0
	ldr r0, _0807773C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r4, r0, #0
	cmp r1, #6
	bls _08077732
	b _08077820
_08077732:
	lsls r0, r1, #2
	ldr r1, _08077740 @ =_08077744
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807773C: .4byte gNonGameplayRam
_08077740: .4byte _08077744
_08077744: @ jump table
	.4byte _08077760 @ case 0
	.4byte _0807776C @ case 1
	.4byte _08077824 @ case 2
	.4byte _080777B8 @ case 3
	.4byte _080777D0 @ case 4
	.4byte _080777F4 @ case 5
	.4byte _08077818 @ case 6
_08077760:
	ldr r1, _08077768 @ =gDisableSoftReset
	movs r0, #0
	strb r0, [r1]
	b _08077824
	.align 2, 0
_08077768: .4byte gDisableSoftReset
_0807776C:
	ldrb r0, [r4, #6]
	cmp r0, #1
	bls _08077820
	movs r0, #0
	strb r0, [r4, #6]
	ldr r1, _080777B0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _08077824
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _08077820
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrh r1, [r2]
	ldr r0, _080777B4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	movs r1, #0
	bl UpdateMenuOamDataID
	adds r2, r4, #0
	adds r2, #0x43
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	b _08077820
	.align 2, 0
_080777B0: .4byte gWrittenToBldy
_080777B4: .4byte 0x0000FEFF
_080777B8:
	ldr r2, _080777CC @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	b _08077824
	.align 2, 0
_080777CC: .4byte 0x06006000
_080777D0:
	ldr r1, _080777E4 @ =0x040000D4
	ldr r0, _080777E8 @ =0x0200F800
	str r0, [r1]
	ldr r0, _080777EC @ =0x0600C000
	str r0, [r1, #4]
	ldr r0, _080777F0 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08077824
	.align 2, 0
_080777E4: .4byte 0x040000D4
_080777E8: .4byte 0x0200F800
_080777EC: .4byte 0x0600C000
_080777F0: .4byte 0x80000400
_080777F4:
	ldr r1, _08077810 @ =0x04000050
	movs r2, #0xfc
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08077814 @ =0x0000040C
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #4
	bl unk_77840
	b _08077824
	.align 2, 0
_08077810: .4byte 0x04000050
_08077814: .4byte 0x0000040C
_08077818:
	movs r5, #1
	movs r0, #0
	strb r0, [r4, #7]
	strb r0, [r4, #6]
_08077820:
	cmp r6, #0
	beq _08077830
_08077824:
	ldr r0, _0807783C @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
_08077830:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807783C: .4byte gNonGameplayRam

	thumb_func_start unk_77840
unk_77840: @ 0x08077840
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r6, #0
	ldr r1, _08077860 @ =gNonGameplayRam
	ldrb r0, [r1, #1]
	adds r5, r1, #0
	cmp r0, #0xb
	bls _08077856
	b _08077ADA
_08077856:
	lsls r0, r0, #2
	ldr r1, _08077864 @ =_08077868
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077860: .4byte gNonGameplayRam
_08077864: .4byte _08077868
_08077868: @ jump table
	.4byte _08077898 @ case 0
	.4byte _08077ADA @ case 1
	.4byte _08077ADA @ case 2
	.4byte _080778C0 @ case 3
	.4byte _080778EC @ case 4
	.4byte _08077944 @ case 5
	.4byte _0807796A @ case 6
	.4byte _080779A4 @ case 7
	.4byte _080779DC @ case 8
	.4byte _08077A24 @ case 9
	.4byte _08077A78 @ case 10
	.4byte _08077AB0 @ case 11
_08077898:
	movs r6, #5
	ldr r1, _080778B4 @ =0x0200C000
	ldr r2, _080778B8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _080778BC @ =gNonGameplayRam
	movs r0, #8
	strb r0, [r1, #1]
	b _08077ADA
	.align 2, 0
_080778B4: .4byte 0x0200C000
_080778B8: .4byte 0x06007000
_080778BC: .4byte gNonGameplayRam
_080778C0:
	movs r6, #1
	adds r1, r5, #0
	adds r1, #0xd1
	movs r0, #9
	strb r0, [r1]
	adds r1, #0xc
	strb r0, [r1]
	ldr r1, _080778E4 @ =0x0200C000
	ldr r2, _080778E8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #4
	b _08077AD8
	.align 2, 0
_080778E4: .4byte 0x0200C000
_080778E8: .4byte 0x06007000
_080778EC:
	cmp r4, #1
	bne _08077908
	movs r6, #2
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	movs r0, #5
	b _08077AD8
_08077908:
	cmp r4, #3
	bne _08077924
	movs r6, #2
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077920 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #6
	b _08077AD8
	.align 2, 0
_08077920: .4byte 0x0000FEFF
_08077924:
	cmp r4, #5
	beq _0807792A
	b _08077ADA
_0807792A:
	movs r6, #3
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077940 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #6
	b _08077AD8
	.align 2, 0
_08077940: .4byte 0x0000FEFF
_08077944:
	cmp r4, #2
	bne _08077960
	movs r6, #1
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #4
	b _080779F6
_08077960:
	cmp r4, #3
	beq _08077966
	b _08077ADA
_08077966:
	movs r0, #7
	b _08077AD8
_0807796A:
	cmp r4, #4
	beq _08077970
	b _08077ADA
_08077970:
	movs r6, #1
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0807799C @ =0x0200C000
	ldr r2, _080779A0 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	strb r4, [r5, #1]
	b _08077ADA
	.align 2, 0
_0807799C: .4byte 0x0200C000
_080779A0: .4byte 0x06007000
_080779A4:
	cmp r4, #4
	beq _080779AA
	b _08077ADA
_080779AA:
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _080779D0 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _080779D4 @ =0x0200C000
	ldr r2, _080779D8 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #5
	b _08077AD8
	.align 2, 0
_080779D0: .4byte 0x0000FEFF
_080779D4: .4byte 0x0200C000
_080779D8: .4byte 0x06007000
_080779DC:
	cmp r4, #2
	bne _08077A04
	movs r6, #4
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #9
_080779F6:
	strb r0, [r5, #1]
	ldr r0, _08077A00 @ =0x00000203
	bl SoundPlay
	b _08077ADA
	.align 2, 0
_08077A00: .4byte 0x00000203
_08077A04:
	cmp r4, #3
	beq _08077A0C
	cmp r4, #5
	bne _08077ADA
_08077A0C:
	movs r6, #6
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077A20 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xb
	b _08077AD8
	.align 2, 0
_08077A20: .4byte 0x0000FEFF
_08077A24:
	cmp r4, #1
	bne _08077A40
	movs r6, #5
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077A3C @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	b _08077AD6
	.align 2, 0
_08077A3C: .4byte 0x0000FEFF
_08077A40:
	cmp r4, #3
	bne _08077A5C
	movs r6, #6
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077A58 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xa
	b _08077AD8
	.align 2, 0
_08077A58: .4byte 0x0000FEFF
_08077A5C:
	cmp r4, #5
	bne _08077ADA
	movs r6, #6
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r1, [r2]
	ldr r0, _08077A74 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xa
	b _08077AD8
	.align 2, 0
_08077A74: .4byte 0x0000FEFF
_08077A78:
	cmp r4, #4
	bne _08077ADA
	movs r6, #4
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08077AA8 @ =0x0200C000
	ldr r2, _08077AAC @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	movs r0, #9
	b _08077AD8
	.align 2, 0
_08077AA8: .4byte 0x0200C000
_08077AAC: .4byte 0x06007000
_08077AB0:
	cmp r4, #4
	bne _08077ADA
	movs r6, #5
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _08077AEC @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08077AF0 @ =0x0200C000
	ldr r2, _08077AF4 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_08077AD6:
	movs r0, #8
_08077AD8:
	strb r0, [r5, #1]
_08077ADA:
	subs r0, r6, #1
	cmp r0, #5
	bls _08077AE2
	b _08077C6E
_08077AE2:
	lsls r0, r0, #2
	ldr r1, _08077AF8 @ =_08077AFC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08077AEC: .4byte 0x0000FEFF
_08077AF0: .4byte 0x0200C000
_08077AF4: .4byte 0x06007000
_08077AF8: .4byte _08077AFC
_08077AFC: @ jump table
	.4byte _08077B14 @ case 0
	.4byte _08077B74 @ case 1
	.4byte _08077B94 @ case 2
	.4byte _08077BA8 @ case 3
	.4byte _08077C18 @ case 4
	.4byte _08077C60 @ case 5
_08077B14:
	ldr r4, _08077B70 @ =gNonGameplayRam
	adds r1, r4, #0
	adds r1, #0xd2
	movs r0, #0x59
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0xd3
	ldrb r2, [r5]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r5]
	adds r5, #0xb
	movs r0, #0x5c
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r3
	ands r1, r2
	movs r0, #4
	orrs r1, r0
	strb r1, [r5]
	adds r0, r4, #0
	adds r0, #0xca
	movs r2, #0x74
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x84
	strh r1, [r0]
	adds r0, #0xe
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xbe
	movs r0, #0x1c
	strh r0, [r1]
	b _08077C6E
	.align 2, 0
_08077B70: .4byte gNonGameplayRam
_08077B74:
	ldr r1, _08077B8C @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0xd2
	movs r0, #0
	strb r0, [r2]
	adds r2, #0xc
	strb r0, [r2]
	adds r1, #0xbe
	ldr r0, _08077B90 @ =0x0000FF9C
	strh r0, [r1]
	b _08077C6E
	.align 2, 0
_08077B8C: .4byte gNonGameplayRam
_08077B90: .4byte 0x0000FF9C
_08077B94:
	ldr r0, _08077BA4 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0xd2
	movs r1, #0
	strb r1, [r2]
	adds r0, #0xde
	b _08077C6C
	.align 2, 0
_08077BA4: .4byte gNonGameplayRam
_08077BA8:
	ldr r4, _08077C14 @ =gNonGameplayRam
	adds r1, r4, #0
	adds r1, #0xd2
	movs r0, #0x59
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0xd3
	ldrb r2, [r5]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	movs r2, #0xd
	rsbs r2, r2, #0
	ands r0, r2
	strb r0, [r5]
	adds r5, #0xb
	movs r0, #0x5c
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	ands r1, r0
	orrs r1, r3
	ands r1, r2
	movs r0, #4
	orrs r1, r0
	strb r1, [r5]
	adds r0, r4, #0
	adds r0, #0xca
	movs r3, #0
	movs r2, #0x74
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x84
	strh r1, [r0]
	adds r0, #0xe
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xd1
	movs r0, #9
	strb r0, [r1]
	adds r1, #0xc
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0xd0
	strb r3, [r0]
	adds r0, #0xc
	strb r3, [r0]
	b _08077C6E
	.align 2, 0
_08077C14: .4byte gNonGameplayRam
_08077C18:
	ldr r3, _08077C5C @ =gNonGameplayRam
	adds r1, r3, #0
	adds r1, #0xde
	movs r0, #0
	strb r0, [r1]
	subs r1, #0xc
	movs r0, #0x34
	strb r0, [r1]
	subs r1, #8
	movs r2, #0
	movs r0, #0xca
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x8e
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xd1
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0xd3
	ldrb r1, [r2]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	b _08077C6E
	.align 2, 0
_08077C5C: .4byte gNonGameplayRam
_08077C60:
	ldr r0, _08077C78 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0xde
	movs r1, #0
	strb r1, [r2]
	adds r0, #0xd2
_08077C6C:
	strb r1, [r0]
_08077C6E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08077C78: .4byte gNonGameplayRam

	thumb_func_start MapScreenUpdateArrowsAndBlinkingSquare
MapScreenUpdateArrowsAndBlinkingSquare: @ 0x08077C7C
	push {r4, r5, lr}
	ldr r3, _08077D4C @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldr r2, _08077D50 @ =gBackgroundPositions
	ldrh r1, [r2, #0xc]
	subs r0, r0, r1
	movs r4, #0xd7
	lsls r4, r4, #1
	adds r1, r3, r4
	strh r0, [r1]
	ldr r5, _08077D54 @ =0x00000211
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xe]
	subs r0, r0, r1
	subs r4, #2
	adds r1, r3, r4
	strh r0, [r1]
	movs r1, #1
	subs r5, #0x67
	adds r0, r3, r5
	ldrb r0, [r0]
	adds r4, r3, #0
	cmp r0, #0x12
	beq _08077CCE
	cmp r0, #0x13
	beq _08077CCE
	cmp r0, #0x14
	beq _08077CCE
	cmp r0, #0x15
	beq _08077CCE
	cmp r0, #0xe
	beq _08077CCE
	cmp r0, #0xf
	beq _08077CCE
	movs r1, #0
_08077CCE:
	cmp r1, #0
	beq _08077CFC
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xc]
	subs r0, r0, r1
	movs r3, #0xd1
	lsls r3, r3, #1
	adds r1, r4, r3
	strh r0, [r1]
	ldr r5, _08077D58 @ =0x0000020D
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #3
	ldrh r1, [r2, #0xe]
	subs r0, r0, r1
	movs r2, #0xd0
	lsls r2, r2, #1
	adds r1, r4, r2
	strh r0, [r1]
_08077CFC:
	ldr r0, _08077D5C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #2
	beq _08077D0A
	b _08077E38
_08077D0A:
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _08077D64
	ldr r3, _08077D60 @ =0x08576158
	ldrb r1, [r3]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0x80
	lsls r2, r2, #1
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	ldrb r1, [r3, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r2, [r0, #0x2e]
	b _08077E38
	.align 2, 0
_08077D4C: .4byte gNonGameplayRam
_08077D50: .4byte gBackgroundPositions
_08077D54: .4byte 0x00000211
_08077D58: .4byte 0x0000020D
_08077D5C: .4byte gPauseScreenFlag
_08077D60: .4byte 0x08576158
_08077D64:
	ldr r2, _08077D8C @ =0x08576158
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077D90 @ =0x0000025A
	adds r0, r4, r5
	movs r1, #0
	ldrsb r1, [r0, r1]
	subs r5, #2
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r1, r0
	cmp r1, #0xd
	ble _08077D94
	ldrb r0, [r2, #2]
	b _08077D9A
	.align 2, 0
_08077D8C: .4byte 0x08576158
_08077D90: .4byte 0x0000025A
_08077D94:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077D9A:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	movs r5, #0x96
	lsls r5, r5, #2
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, #3
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #0xe
	ble _08077DC6
	ldrb r0, [r2, #6]
	b _08077DCC
_08077DC6:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077DCC:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #8]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077DF8 @ =0x00000259
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, #3
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #8
	ble _08077DFC
	ldrb r0, [r2, #0xa]
	b _08077E02
	.align 2, 0
_08077DF8: .4byte 0x00000259
_08077DFC:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077E02:
	strh r0, [r3, #0x2e]
	ldrb r1, [r2, #0xc]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r4
	ldr r5, _08077E2C @ =0x0000025D
	adds r0, r4, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r5, #4
	adds r1, r4, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	cmp r0, #8
	ble _08077E30
	ldrb r0, [r2, #0xe]
	b _08077E36
	.align 2, 0
_08077E2C: .4byte 0x0000025D
_08077E30:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
_08077E36:
	strh r0, [r3, #0x2e]
_08077E38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MapScreenDrawSpecialOam
MapScreenDrawSpecialOam: @ 0x08077E40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _08077E70 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _08077E5E
	b _080780E0
_08077E5E:
	mov r0, r8
	cmp r0, #1
	beq _08077EF0
	cmp r0, #1
	bgt _08077E74
	cmp r0, #0
	beq _08077E7C
	b _08077F5A
	.align 2, 0
_08077E70: .4byte gPauseScreenFlag
_08077E74:
	mov r1, r8
	cmp r1, #2
	beq _08077F3C
	b _08077F5A
_08077E7C:
	ldr r0, _08077EE0 @ =gNonGameplayRam
	ldrb r1, [r0]
	movs r2, #3
	cmp r1, #0
	beq _08077E88
	movs r2, #1
_08077E88:
	movs r4, #0
	ldr r7, _08077EE4 @ =gEquipment
	ldr r5, _08077EE8 @ =0x08576150
	mov sb, r2
	movs r2, #4
	rsbs r2, r2, #0
	mov sl, r2
_08077E96:
	movs r6, #0
	ldrb r0, [r7, #0xd]
	adds r3, r4, #1
	cmp r0, #0xff
	beq _08077EA6
	cmp r0, r3
	blt _08077EA6
	movs r6, #1
_08077EA6:
	lsls r2, r4, #1
	adds r0, r2, r5
	ldrb r0, [r0]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08077EE0 @ =gNonGameplayRam
	adds r1, r1, r0
	ldr r0, _08077EEC @ =0x08576151
	adds r2, r2, r0
	ldrb r0, [r2]
	adds r0, r0, r6
	movs r2, #0x36
	strb r0, [r2, r1]
	movs r0, #0x24
	strh r0, [r1, #0x2c]
	movs r0, #0xd4
	strh r0, [r1, #0x2e]
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sl
	ands r0, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	adds r4, r3, #0
	cmp r4, #3
	bls _08077E96
	b _08077F5A
	.align 2, 0
_08077EE0: .4byte gNonGameplayRam
_08077EE4: .4byte gEquipment
_08077EE8: .4byte 0x08576150
_08077EEC: .4byte 0x08576151
_08077EF0:
	movs r4, #0
	ldr r7, _08077F30 @ =gEquipment
	ldr r3, _08077F34 @ =gNonGameplayRam
	mov ip, r3
	ldr r5, _08077F38 @ =0x08576150
	adds r0, r5, #1
	mov sb, r0
_08077EFE:
	movs r6, #0
	ldrb r0, [r7, #0xd]
	adds r3, r4, #1
	cmp r0, #0xff
	beq _08077F0E
	cmp r0, r3
	blt _08077F0E
	movs r6, #1
_08077F0E:
	lsls r2, r4, #1
	adds r0, r2, r5
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, ip
	add r2, sb
	ldrb r1, [r2]
	adds r1, r1, r6
	adds r0, #0x36
	strb r1, [r0]
	adds r4, r3, #0
	cmp r4, #3
	bls _08077EFE
	b _08077F5A
	.align 2, 0
_08077F30: .4byte gEquipment
_08077F34: .4byte gNonGameplayRam
_08077F38: .4byte 0x08576150
_08077F3C:
	movs r4, #0
	ldr r5, _08077F84 @ =gNonGameplayRam
	movs r3, #0
	ldr r2, _08077F88 @ =0x08576150
_08077F44:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r3, [r0]
	adds r2, #2
	adds r4, #1
	cmp r4, #3
	bls _08077F44
_08077F5A:
	movs r4, #0
	ldr r1, _08077F8C @ =0x03000014
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08077F68
	movs r4, #1
_08077F68:
	ldr r2, _08077F84 @ =gNonGameplayRam
	ldrb r0, [r2]
	cmp r0, #0
	beq _08077F72
	movs r4, #1
_08077F72:
	cmp r4, #0
	beq _08077F90
	ldr r3, _08077F84 @ =gNonGameplayRam
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #0
	b _080780DE
	.align 2, 0
_08077F84: .4byte gNonGameplayRam
_08077F88: .4byte 0x08576150
_08077F8C: .4byte 0x03000014
_08077F90:
	mov r1, r8
	cmp r1, #0
	beq _08077F98
	b _080780E0
_08077F98:
	movs r4, #3
	cmp r0, #0
	beq _08077FA0
	movs r4, #1
_08077FA0:
	bl MapScreenCountTanks
	movs r0, #0
	bl PauseScreenDrawIgtAndTanks
	movs r6, #0
	ldr r7, _080780F0 @ =gNonGameplayRam
	ldr r2, _080780F4 @ =0x0879BE8C
	mov r8, r2
	movs r0, #3
	mov ip, r4
	mov r3, ip
	ands r3, r0
	mov ip, r3
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
	mov r5, r8
_08077FC4:
	lsls r3, r6, #2
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r0, r8
	adds r0, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	adds r1, #0x36
	strb r0, [r1]
	ldrb r0, [r5]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	mov r2, ip
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	mov r1, r8
	adds r1, #2
	adds r3, r3, r1
	ldrb r1, [r3]
	strh r1, [r0, #0x2e]
	ldrb r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrb r1, [r5, #3]
	strh r1, [r0, #0x2c]
	adds r5, #4
	adds r6, #1
	cmp r6, #3
	bls _08077FC4
	movs r6, #0
	ldr r7, _080780F8 @ =0x0879BE9C
	ldr r5, _080780F0 @ =gNonGameplayRam
	mov ip, r7
	movs r0, #3
	ands r4, r0
	mov r8, r4
	movs r3, #4
	rsbs r3, r3, #0
	mov sb, r3
	adds r4, r7, #0
_08078034:
	lsls r3, r6, #2
	ldrb r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	adds r1, #0x37
	ldrb r2, [r1]
	mov r0, sb
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	mov r1, ip
	adds r1, #2
	adds r3, r3, r1
	ldrb r1, [r3]
	strh r1, [r0, #0x2e]
	ldrb r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldrb r1, [r4, #3]
	strh r1, [r0, #0x2c]
	adds r4, #4
	adds r6, #1
	cmp r6, #2
	bls _08078034
	ldr r2, _080780F0 @ =gNonGameplayRam
	ldr r3, _080780FC @ =0x00000275
	adds r0, r2, r3
	adds r3, #1
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807809A
	ldrb r0, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r7, #1]
	adds r1, #0x36
	strb r0, [r1]
_0807809A:
	ldr r1, _08078100 @ =0x00000277
	adds r0, r2, r1
	movs r3, #0x9e
	lsls r3, r3, #2
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080780BC
	ldrb r0, [r7, #4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r7, #5]
	adds r1, #0x36
	strb r0, [r1]
_080780BC:
	ldr r1, _080780F0 @ =gNonGameplayRam
	ldr r2, _08078104 @ =0x00000279
	adds r0, r1, r2
	ldr r3, _08078108 @ =0x0000027A
	adds r1, r1, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080780E0
	ldrb r0, [r7, #8]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080780F0 @ =gNonGameplayRam
	adds r1, r1, r0
	ldrb r0, [r7, #9]
	adds r1, #0x36
_080780DE:
	strb r0, [r1]
_080780E0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080780F0: .4byte gNonGameplayRam
_080780F4: .4byte 0x0879BE8C
_080780F8: .4byte 0x0879BE9C
_080780FC: .4byte 0x00000275
_08078100: .4byte 0x00000277
_08078104: .4byte 0x00000279
_08078108: .4byte 0x0000027A

	thumb_func_start PauseScreenSetupOam
PauseScreenSetupOam: @ 0x0807810C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080781A0 @ =gNonGameplayRam
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	strh r1, [r0, #0x14]
	strb r2, [r0, #0x17]
	strb r2, [r0, #0x18]
	adds r7, r0, #0
	movs r3, #0
	movs r6, #4
	rsbs r6, r6, #0
	movs r5, #0xd
	rsbs r5, r5, #0
	adds r2, r7, #0
	adds r2, #0x2c
	movs r4, #0x27
_0807813A:
	strb r3, [r2, #0xa]
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	strh r3, [r2, #2]
	strh r3, [r2]
	ldrb r1, [r2, #0xb]
	adds r0, r6, #0
	ands r0, r1
	ands r0, r5
	strb r0, [r2, #0xb]
	adds r2, #0xc
	subs r4, #1
	cmp r4, #0
	bge _0807813A
	adds r0, r7, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #4
	beq _08078176
	ldr r0, _080781A4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _08078176
	movs r0, #0xdb
	lsls r0, r0, #1
	adds r1, r7, r0
	movs r0, #1
	strb r0, [r1]
_08078176:
	ldr r3, _080781A0 @ =gNonGameplayRam
	ldrb r0, [r3]
	cmp r0, #0
	beq _080781B0
	ldr r1, _080781A8 @ =0x000001B7
	adds r4, r3, r1
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4]
	ldr r0, _080781AC @ =0x000001AB
	adds r3, r3, r0
	ldrb r0, [r3]
	ands r1, r0
	orrs r1, r2
	strb r1, [r3]
	b _080781C6
	.align 2, 0
_080781A0: .4byte gNonGameplayRam
_080781A4: .4byte gPauseScreenFlag
_080781A8: .4byte 0x000001B7
_080781AC: .4byte 0x000001AB
_080781B0:
	ldr r1, _080781E4 @ =0x000001B7
	adds r2, r3, r1
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080781E8 @ =0x000001AB
	adds r2, r3, r0
	ldrb r0, [r2]
	orrs r0, r1
	strb r0, [r2]
_080781C6:
	bl MapScreenUpdateArrowsAndBlinkingSquare
	ldr r1, _080781EC @ =gNonGameplayRam
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _080781F0
	ldrb r0, [r1, #2]
	cmp r0, #0
	beq _080781FC
	bl DebugMenuSetupCursor
	b _080781FC
	.align 2, 0
_080781E4: .4byte 0x000001B7
_080781E8: .4byte 0x000001AB
_080781EC: .4byte gNonGameplayRam
_080781F0:
	adds r2, r1, #0
	adds r2, #0x36
	movs r0, #0
	strb r0, [r2]
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
_080781FC:
	ldr r1, _08078270 @ =gNonGameplayRam
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080782AE
	adds r1, #0xf6
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0xec
	movs r3, #2
	strh r3, [r0]
	mov r1, ip
	adds r1, #0xee
	movs r0, #0xd6
	strh r0, [r1]
	mov r4, ip
	adds r4, #0xf7
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r4]
	movs r4, #0x81
	lsls r4, r4, #1
	add r4, ip
	movs r0, #0x2a
	strb r0, [r4]
	mov r0, ip
	adds r0, #0xf8
	strh r3, [r0]
	mov r3, ip
	adds r3, #0xfa
	movs r0, #0x12
	strh r0, [r3]
	ldr r3, _08078274 @ =0x00000103
	add r3, ip
	ldrb r0, [r3]
	ands r1, r0
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08078278 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _08078280
	ldr r0, _0807827C @ =0x08576142
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, #1
	adds r1, r1, r0
	ldrb r1, [r1]
	movs r0, #0x12
	bl UpdateMenuOamDataID
	b _08078288
	.align 2, 0
_08078270: .4byte gNonGameplayRam
_08078274: .4byte 0x00000103
_08078278: .4byte gCurrentArea
_0807827C: .4byte 0x08576142
_08078280:
	movs r0, #0x12
	movs r1, #0
	bl UpdateMenuOamDataID
_08078288:
	ldr r2, _080783D4 @ =gNonGameplayRam
	movs r0, #0x82
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x83
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0x74
	strh r0, [r1]
	ldr r1, _080783D8 @ =0x0000010F
	adds r2, r2, r1
	ldrb r1, [r2]
	subs r0, #0x78
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
_080782AE:
	movs r0, #0
	bl MapScreenDrawSpecialOam
	ldr r3, _080783D4 @ =gNonGameplayRam
	adds r1, r3, #0
	adds r1, #0xe0
	movs r2, #0
	movs r0, #0x20
	strh r0, [r1]
	adds r1, #2
	movs r0, #0xc0
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0xea
	strb r2, [r0]
	adds r7, r3, #0
	adds r4, r7, #0
	ldr r5, _080783DC @ =0x08576158
	adds r3, r5, #0
	adds r3, #0x10
	movs r6, #4
	rsbs r6, r6, #0
_080782DA:
	subs r3, #4
	ldrb r0, [r4]
	cmp r0, #0
	bne _080782F2
	ldrb r0, [r3]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldrb r0, [r3, #1]
	adds r1, #0x36
	strb r0, [r1]
_080782F2:
	ldrb r0, [r3]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r2, #0x2e]
	ldrb r0, [r3, #3]
	strh r0, [r2, #0x2c]
	adds r2, #0x37
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2]
	cmp r3, r5
	bgt _080782DA
	adds r5, r7, #0
	ldrb r6, [r5]
	cmp r6, #1
	bne _080783C6
	movs r2, #0xf4
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #0x7c
	strh r0, [r1]
	movs r0, #0xf5
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x74
	strh r0, [r1]
	movs r1, #0xf9
	lsls r1, r1, #1
	adds r1, r1, r5
	mov r8, r1
	movs r0, #0x3e
	strb r0, [r1]
	adds r2, #0xb
	adds r1, r5, r2
	ldrb r0, [r1]
	movs r2, #3
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	bl unk_65618
	adds r4, r0, #0
	ldr r0, _080783E0 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0807836A
	movs r4, #3
	movs r0, #0x3d
	mov r1, r8
	strb r0, [r1]
_0807836A:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _0807839A
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #0x4c
	strh r0, [r1]
	movs r0, #0xfb
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0x18
	strh r0, [r1]
	adds r2, #0xa
	adds r1, r5, r2
	movs r0, #0x3f
	strb r0, [r1]
	ldr r0, _080783E4 @ =0x000001FF
	adds r1, r5, r0
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
_0807839A:
	ands r6, r4
	cmp r6, #0
	beq _080783C6
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0x4c
	strh r0, [r1]
	ldr r2, _080783E8 @ =0x00000202
	adds r1, r7, r2
	movs r0, #0xd0
	strh r0, [r1]
	ldr r0, _080783EC @ =0x0000020A
	adds r1, r7, r0
	movs r0, #0x40
	strb r0, [r1]
	adds r2, #9
	adds r1, r7, r2
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
_080783C6:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080783D4: .4byte gNonGameplayRam
_080783D8: .4byte 0x0000010F
_080783DC: .4byte 0x08576158
_080783E0: .4byte gPauseScreenFlag
_080783E4: .4byte 0x000001FF
_080783E8: .4byte 0x00000202
_080783EC: .4byte 0x0000020A

	thumb_func_start PauseScreenProcessOam
PauseScreenProcessOam: @ 0x080783F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r0, _0807844C @ =gOamData
	str r0, [sp, #8]
	ldr r0, _08078450 @ =gNextOamSlot
	ldrb r1, [r0]
	lsls r0, r1, #3
	ldr r2, [sp, #8]
	adds r2, r0, r2
	str r2, [sp, #8]
	str r1, [sp]
	mov sb, r1
	movs r3, #0
	str r3, [sp, #0xc]
_08078414:
	ldr r1, [sp, #0xc]
	lsls r0, r1, #1
	adds r1, r0, r1
	lsls r1, r1, #2
	ldr r3, _08078454 @ =gNonGameplayRam
	adds r2, r1, r3
	adds r3, r2, #0
	adds r3, #0x36
	ldrb r1, [r3]
	adds r7, r0, #0
	cmp r1, #0
	bne _0807842E
	b _08078A36
_0807842E:
	adds r2, #0x37
	ldrb r1, [r2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r0, [r3]
	cmp r0, #0x8b
	bls _08078442
	b _0807868C
_08078442:
	lsls r0, r0, #2
	ldr r1, _08078458 @ =_0807845C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807844C: .4byte gOamData
_08078450: .4byte gNextOamSlot
_08078454: .4byte gNonGameplayRam
_08078458: .4byte _0807845C
_0807845C: @ jump table
	.4byte _08078962 @ case 0
	.4byte _080786B4 @ case 1
	.4byte _080786B4 @ case 2
	.4byte _080786B4 @ case 3
	.4byte _080786B4 @ case 4
	.4byte _080786B4 @ case 5
	.4byte _080786B4 @ case 6
	.4byte _080786B4 @ case 7
	.4byte _080786B4 @ case 8
	.4byte _080786B4 @ case 9
	.4byte _0807868C @ case 10
	.4byte _080786B4 @ case 11
	.4byte _080786B4 @ case 12
	.4byte _0807868C @ case 13
	.4byte _080786B4 @ case 14
	.4byte _080786B4 @ case 15
	.4byte _080787F0 @ case 16
	.4byte _0807868C @ case 17
	.4byte _08078708 @ case 18
	.4byte _08078708 @ case 19
	.4byte _08078708 @ case 20
	.4byte _08078708 @ case 21
	.4byte _080786B4 @ case 22
	.4byte _080786B4 @ case 23
	.4byte _080786B4 @ case 24
	.4byte _080786B4 @ case 25
	.4byte _0807868C @ case 26
	.4byte _0807890C @ case 27
	.4byte _0807868C @ case 28
	.4byte _0807890C @ case 29
	.4byte _0807868C @ case 30
	.4byte _0807890C @ case 31
	.4byte _0807868C @ case 32
	.4byte _0807890C @ case 33
	.4byte _0807868C @ case 34
	.4byte _0807890C @ case 35
	.4byte _0807868C @ case 36
	.4byte _0807890C @ case 37
	.4byte _0807868C @ case 38
	.4byte _0807890C @ case 39
	.4byte _080786B4 @ case 40
	.4byte _080786B4 @ case 41
	.4byte _080786B4 @ case 42
	.4byte _080786B4 @ case 43
	.4byte _0807868C @ case 44
	.4byte _0807868C @ case 45
	.4byte _0807868C @ case 46
	.4byte _0807868C @ case 47
	.4byte _0807868C @ case 48
	.4byte _0807868C @ case 49
	.4byte _0807868C @ case 50
	.4byte _0807868C @ case 51
	.4byte _0807868C @ case 52
	.4byte _0807890C @ case 53
	.4byte _0807868C @ case 54
	.4byte _0807868C @ case 55
	.4byte _0807868C @ case 56
	.4byte _0807868C @ case 57
	.4byte _0807868C @ case 58
	.4byte _0807868C @ case 59
	.4byte _0807868C @ case 60
	.4byte _080786B4 @ case 61
	.4byte _080786B4 @ case 62
	.4byte _0807868C @ case 63
	.4byte _0807868C @ case 64
	.4byte _08078780 @ case 65
	.4byte _080787F0 @ case 66
	.4byte _08078780 @ case 67
	.4byte _0807868C @ case 68
	.4byte _08078780 @ case 69
	.4byte _08078780 @ case 70
	.4byte _0807868C @ case 71
	.4byte _08078780 @ case 72
	.4byte _08078780 @ case 73
	.4byte _08078780 @ case 74
	.4byte _080786B4 @ case 75
	.4byte _080786B4 @ case 76
	.4byte _08078780 @ case 77
	.4byte _0807868C @ case 78
	.4byte _080787F0 @ case 79
	.4byte _08078780 @ case 80
	.4byte _0807868C @ case 81
	.4byte _080787F0 @ case 82
	.4byte _08078780 @ case 83
	.4byte _0807868C @ case 84
	.4byte _080787F0 @ case 85
	.4byte _08078780 @ case 86
	.4byte _0807868C @ case 87
	.4byte _080787F0 @ case 88
	.4byte _08078780 @ case 89
	.4byte _0807868C @ case 90
	.4byte _080787F0 @ case 91
	.4byte _08078780 @ case 92
	.4byte _0807868C @ case 93
	.4byte _080787F0 @ case 94
	.4byte _08078844 @ case 95
	.4byte _080786B4 @ case 96
	.4byte _0807868C @ case 97
	.4byte _080787F0 @ case 98
	.4byte _08078898 @ case 99
	.4byte _0807868C @ case 100
	.4byte _0807890C @ case 101
	.4byte _080787F0 @ case 102
	.4byte _080786B4 @ case 103
	.4byte _0807868C @ case 104
	.4byte _0807868C @ case 105
	.4byte _0807868C @ case 106
	.4byte _0807868C @ case 107
	.4byte _0807868C @ case 108
	.4byte _0807868C @ case 109
	.4byte _0807868C @ case 110
	.4byte _0807868C @ case 111
	.4byte _0807868C @ case 112
	.4byte _0807868C @ case 113
	.4byte _0807868C @ case 114
	.4byte _0807868C @ case 115
	.4byte _0807868C @ case 116
	.4byte _0807868C @ case 117
	.4byte _0807868C @ case 118
	.4byte _0807868C @ case 119
	.4byte _0807868C @ case 120
	.4byte _0807868C @ case 121
	.4byte _0807868C @ case 122
	.4byte _0807868C @ case 123
	.4byte _0807868C @ case 124
	.4byte _0807868C @ case 125
	.4byte _0807868C @ case 126
	.4byte _0807868C @ case 127
	.4byte _0807868C @ case 128
	.4byte _0807868C @ case 129
	.4byte _0807868C @ case 130
	.4byte _0807868C @ case 131
	.4byte _0807868C @ case 132
	.4byte _0807868C @ case 133
	.4byte _0807868C @ case 134
	.4byte _0807868C @ case 135
	.4byte _0807868C @ case 136
	.4byte _0807868C @ case 137
	.4byte _0807868C @ case 138
	.4byte _0807868C @ case 139
_0807868C:
	ldr r2, _080786AC @ =0x0879BEC0
	ldr r0, _080786B0 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r1, r7, r3
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	b _08078962
	.align 2, 0
_080786AC: .4byte 0x0879BEC0
_080786B0: .4byte gNonGameplayRam
_080786B4:
	ldr r2, _08078700 @ =0x0879BEC0
	ldr r1, _08078704 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r3, r1, #0
	adds r3, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _080786E4
	b _08078962
_080786E4:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080786FC
	b _08078962
_080786FC:
	strb r0, [r2]
	b _08078962
	.align 2, 0
_08078700: .4byte 0x0879BEC0
_08078704: .4byte gNonGameplayRam
_08078708:
	ldr r1, _0807876C @ =0x0879BEC0
	ldr r4, _08078770 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r2, r0, r4
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r3, r2, #0
	adds r3, #0x34
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _08078736
	b _08078962
_08078736:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0807874E
	b _08078962
_0807874E:
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807875C
	b _08078962
_0807875C:
	ldrb r0, [r4]
	cmp r0, #0
	beq _08078774
	movs r0, #0x8d
	lsls r0, r0, #1
	bl SoundPlay
	b _08078962
	.align 2, 0
_0807876C: .4byte 0x0879BEC0
_08078770: .4byte gNonGameplayRam
_08078774:
	ldr r0, _0807877C @ =0x0000012B
	bl SoundPlay
	b _08078962
	.align 2, 0
_0807877C: .4byte 0x0000012B
_08078780:
	ldr r2, _080787E8 @ =0x0879BEC0
	ldr r1, _080787EC @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r5, [r0]
	adds r4, r3, #0
	adds r4, #0x35
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	bne _080787B4
	adds r2, r3, #0
	adds r2, #0x37
	ldrb r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
_080787B4:
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r4]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r2]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _080787C8
	b _08078962
_080787C8:
	movs r0, #0
	strb r0, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	lsls r0, r1, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080787E0
	b _08078962
_080787E0:
	subs r0, r1, #1
	strb r0, [r4]
	b _08078962
	.align 2, 0
_080787E8: .4byte 0x0879BEC0
_080787EC: .4byte gNonGameplayRam
_080787F0:
	ldr r1, _0807883C @ =0x0879BEC0
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	ldr r3, _08078840 @ =gNonGameplayRam
	adds r2, r0, r3
	adds r4, r2, #0
	adds r4, #0x36
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r3, r2, #0
	adds r3, #0x34
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r3]
	ldrb r0, [r0, #4]
	cmp r1, r0
	bhs _0807881E
	b _08078962
_0807881E:
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _08078836
	b _08078962
_08078836:
	strb r0, [r4]
	strb r0, [r2]
	b _08078A36
	.align 2, 0
_0807883C: .4byte 0x0879BEC0
_08078840: .4byte gNonGameplayRam
_08078844:
	ldr r6, _08078890 @ =0x0879BEC0
	ldr r1, _08078894 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	adds r0, #1
	b _08078954
	.align 2, 0
_08078890: .4byte 0x0879BEC0
_08078894: .4byte gNonGameplayRam
_08078898:
	ldr r3, _08078904 @ =0x0879BEC0
	mov r8, r3
	ldr r6, _08078908 @ =gNonGameplayRam
	ldr r1, [sp, #0xc]
	adds r0, r7, r1
	lsls r0, r0, #2
	adds r1, r0, r6
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, r8
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #2
	add r0, r8
	ldr r5, [r0]
	strb r1, [r4]
	strb r1, [r2]
	adds r2, r6, #0
	adds r2, #0x7e
	movs r0, #0x67
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x7c
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _08078962
	.align 2, 0
_08078904: .4byte 0x0879BEC0
_08078908: .4byte gNonGameplayRam
_0807890C:
	ldr r6, _08078A5C @ =0x0879BEC0
	ldr r1, _08078A60 @ =gNonGameplayRam
	ldr r2, [sp, #0xc]
	adds r0, r7, r2
	lsls r0, r0, #2
	adds r1, r0, r1
	adds r3, r1, #0
	adds r3, #0x36
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	adds r4, r1, #0
	adds r4, #0x34
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r4]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08078962
	movs r0, #0
	strb r0, [r4]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldrb r0, [r2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _08078962
	ldrb r0, [r3]
	subs r0, #1
_08078954:
	strb r0, [r3]
	ldrb r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r5, [r0]
	strb r1, [r4]
	strb r1, [r2]
_08078962:
	ldr r2, _08078A60 @ =gNonGameplayRam
	ldr r3, [sp, #0xc]
	adds r0, r7, r3
	lsls r0, r0, #2
	adds r3, r0, r2
	adds r1, r3, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #0x2c]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r0, [r3, #0x2e]
	adds r0, #4
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r5, r5, r0
	ldr r4, [r5]
	adds r0, r3, #0
	adds r0, #0x37
	ldrb r1, [r0]
	lsls r0, r1, #0x1e
	lsrs r6, r0, #0x1e
	lsls r1, r1, #0x1c
	lsrs r3, r1, #0x1e
	ldrh r0, [r4]
	ldr r1, [sp]
	adds r0, r1, r0
	cmp r0, #0x7f
	bgt _08078A42
	str r0, [sp]
	adds r4, #2
	cmp sb, r0
	bge _08078A36
	ldr r0, _08078A64 @ =gOamData
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	lsls r6, r6, #2
	mov ip, r6
	lsls r7, r3, #2
	mov r2, sb
	lsls r1, r2, #3
	adds r3, r1, r0
	ldr r0, _08078A68 @ =0x000001FF
	mov sl, r0
	movs r6, #0xd
	rsbs r6, r6, #0
	ldr r1, [sp]
	subs r1, r1, r2
	mov sb, r1
_080789D6:
	ldrh r0, [r4]
	adds r4, #2
	ldr r2, [sp, #8]
	strh r0, [r2]
	adds r2, #2
	ldr r1, [sp, #4]
	adds r0, r1, r0
	strb r0, [r3]
	ldrh r1, [r4]
	adds r4, #2
	strh r1, [r2]
	adds r2, #2
	str r2, [sp, #8]
	add r1, r8
	mov r2, sl
	ands r1, r2
	ldrh r2, [r3, #2]
	ldr r0, _08078A6C @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	ldr r1, [sp, #8]
	strh r0, [r1]
	adds r4, #2
	ldrb r1, [r3, #5]
	adds r0, r6, #0
	ands r0, r1
	mov r2, ip
	orrs r0, r2
	strb r0, [r3, #5]
	ldrb r1, [r3, #1]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r7
	strb r0, [r3, #1]
	ldr r0, [sp, #8]
	adds r0, #4
	str r0, [sp, #8]
	adds r3, #8
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	cmp r2, #0
	bne _080789D6
	ldr r3, [sp]
	mov sb, r3
_08078A36:
	ldr r0, [sp, #0xc]
	adds r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x27
	bgt _08078A42
	b _08078414
_08078A42:
	ldr r0, _08078A70 @ =gNextOamSlot
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08078A5C: .4byte 0x0879BEC0
_08078A60: .4byte gNonGameplayRam
_08078A64: .4byte gOamData
_08078A68: .4byte 0x000001FF
_08078A6C: .4byte 0xFFFFFE00
_08078A70: .4byte gNextOamSlot

	thumb_func_start CheckForMaintainedInput
CheckForMaintainedInput: @ 0x08078A74
	push {lr}
	sub sp, #8
	ldr r1, _08078A9C @ =0x08576210
	mov r0, sp
	movs r2, #7
	bl memcpy
	ldr r0, _08078AA0 @ =gButtonInput
	ldrh r0, [r0]
	movs r1, #0xf0
	ands r1, r0
	cmp r1, #0
	beq _08078AA8
	ldr r1, _08078AA4 @ =0x03005400
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r3, r1, #0
	b _08078AB0
	.align 2, 0
_08078A9C: .4byte 0x08576210
_08078AA0: .4byte gButtonInput
_08078AA4: .4byte 0x03005400
_08078AA8:
	ldr r0, _08078AE4 @ =0x03005400
	strb r1, [r0]
	strb r1, [r0, #1]
	adds r3, r0, #0
_08078AB0:
	ldrb r0, [r3, #1]
	mov r2, sp
	adds r1, r2, r0
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	blo _08078ADC
	ldr r2, _08078AE8 @ =gChangedInput
	ldr r0, _08078AEC @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strb r0, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #5
	bhi _08078ADC
	adds r0, #1
	strb r0, [r3, #1]
_08078ADC:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08078AE4: .4byte 0x03005400
_08078AE8: .4byte gChangedInput
_08078AEC: .4byte gButtonInput

	thumb_func_start unk_78af0
unk_78af0: @ 0x08078AF0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r6, r3, #0
	ldr r2, _08078B14 @ =gNonGameplayRam
	cmp r3, #0
	beq _08078B7A
	movs r4, #0
	ldrh r1, [r2, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08078B0C
	movs r4, #3
_08078B0C:
	cmp r3, #1
	bne _08078B18
	movs r5, #0
	b _08078B38
	.align 2, 0
_08078B14: .4byte gNonGameplayRam
_08078B18:
	cmp r3, #2
	bne _08078B2C
	ldr r0, _08078B28 @ =0x0000020A
	bl SoundPlay
	movs r5, #1
	b _08078B38
	.align 2, 0
_08078B28: .4byte 0x0000020A
_08078B2C:
	cmp r6, #3
	bne _08078B38
	ldr r0, _08078B98 @ =0x0000020B
	bl SoundPlay
	movs r5, #2
_08078B38:
	adds r4, r4, r5
	ldr r0, _08078B9C @ =gNonGameplayRam
	mov ip, r0
	ldr r2, _08078BA0 @ =0x085767F0
	lsls r1, r4, #1
	adds r1, r1, r4
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r4, ip
	adds r4, #0x96
	movs r3, #0
	strb r0, [r4]
	adds r0, r2, #1
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r4, #0xc
	strb r0, [r4]
	adds r2, #2
	adds r1, r1, r2
	ldrb r0, [r1]
	mov r1, ip
	adds r1, #0x8a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x94
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #0xb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r2, ip
_08078B7A:
	adds r0, r2, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	adds r1, r2, #0
	adds r1, #0x9a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x8c
	ldrh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08078B98: .4byte 0x0000020B
_08078B9C: .4byte gNonGameplayRam
_08078BA0: .4byte 0x085767F0

	thumb_func_start PauseScreenSetNavigationTextPanelOam
PauseScreenSetNavigationTextPanelOam: @ 0x08078BA4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #1
	bne _08078BC4
	ldr r0, _08078BC0 @ =gNonGameplayRam
	adds r2, r0, #0
	adds r2, #0x66
	movs r1, #0x44
	strb r1, [r2]
	adds r0, #0x72
	movs r1, #0x47
	strb r1, [r0]
	b _08078C02
	.align 2, 0
_08078BC0: .4byte gNonGameplayRam
_08078BC4:
	cmp r4, #2
	bne _08078BE8
	ldr r1, _08078BE0 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x66
	movs r0, #0x43
	strb r0, [r2]
	adds r1, #0x72
	movs r0, #0x46
	strb r0, [r1]
	ldr r0, _08078BE4 @ =0x0000020A
	bl SoundPlay
	b _08078C02
	.align 2, 0
_08078BE0: .4byte gNonGameplayRam
_08078BE4: .4byte 0x0000020A
_08078BE8:
	cmp r4, #3
	bne _08078C02
	ldr r1, _08078C3C @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x66
	movs r0, #0x45
	strb r0, [r2]
	adds r1, #0x72
	movs r0, #0x48
	strb r0, [r1]
	ldr r0, _08078C40 @ =0x0000020B
	bl SoundPlay
_08078C02:
	ldr r3, _08078C3C @ =gNonGameplayRam
	cmp r4, #0
	beq _08078C1C
	adds r0, r3, #0
	adds r0, #0x64
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xb
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_08078C1C:
	adds r0, r3, #0
	adds r0, #0x5e
	ldrh r2, [r0]
	adds r0, #0xc
	strh r2, [r0]
	subs r0, #0xe
	ldrh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
	subs r0, #0x16
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078C3C: .4byte gNonGameplayRam
_08078C40: .4byte 0x0000020B

	thumb_func_start unk_78c44
unk_78c44: @ 0x08078C44
	push {r4, r5, lr}
	ldr r2, _08078C60 @ =gNonGameplayRam
	ldrh r0, [r2, #4]
	movs r1, #6
	ands r1, r0
	cmp r1, #0
	bne _08078C64
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, #1
	adds r0, r2, r3
	b _08078E96
	.align 2, 0
_08078C60: .4byte gNonGameplayRam
_08078C64:
	ldr r1, _08078C88 @ =0x0000023D
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #8
	bls _08078C7C
	b _08078E76
_08078C7C:
	lsls r0, r0, #2
	ldr r1, _08078C8C @ =_08078C90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078C88: .4byte 0x0000023D
_08078C8C: .4byte _08078C90
_08078C90: @ jump table
	.4byte _08078CB4 @ case 0
	.4byte _08078CDC @ case 1
	.4byte _08078D18 @ case 2
	.4byte _08078D50 @ case 3
	.4byte _08078DA8 @ case 4
	.4byte _08078DCC @ case 5
	.4byte _08078DFC @ case 6
	.4byte _08078E34 @ case 7
	.4byte _08078E76 @ case 8
_08078CB4:
	ldr r1, _08078CD4 @ =gNonGameplayRam
	ldr r0, _08078CD8 @ =0x0000023D
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, #0x10
	bhi _08078CC2
	b _08078E76
_08078CC2:
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	strb r2, [r3]
	b _08078E76
	.align 2, 0
_08078CD4: .4byte gNonGameplayRam
_08078CD8: .4byte 0x0000023D
_08078CDC:
	ldr r5, _08078D10 @ =gNonGameplayRam
	adds r1, r5, #0
	adds r1, #0x8e
	movs r4, #0
	movs r0, #0x74
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x1c
	strh r0, [r1]
	movs r0, #2
	bl unk_78af0
	movs r0, #2
	bl MapScreenDrawSpecialOam
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r1, r5, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08078D14 @ =0x0000023D
	adds r0, r5, r1
	strb r4, [r0]
	b _08078E76
	.align 2, 0
_08078D10: .4byte gNonGameplayRam
_08078D14: .4byte 0x0000023D
_08078D18:
	ldr r3, _08078D4C @ =gNonGameplayRam
	adds r0, r3, #0
	adds r0, #0x97
	ldrb r1, [r0]
	movs r2, #0x10
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08078D2C
	b _08078E76
_08078D2C:
	adds r0, r3, #0
	adds r0, #0xa3
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08078D3C
	b _08078E76
_08078D3C:
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	b _08078DEA
	.align 2, 0
_08078D4C: .4byte gNonGameplayRam
_08078D50:
	ldr r3, _08078D9C @ =gNonGameplayRam
	ldr r2, _08078DA0 @ =0x0000023D
	adds r4, r3, r2
	ldrb r0, [r4]
	cmp r0, #0x10
	bhi _08078D5E
	b _08078E76
_08078D5E:
	ldrh r1, [r3, #4]
	movs r0, #0x10
	movs r2, #0
	orrs r0, r1
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x46
	movs r0, #8
	strh r0, [r1]
	ldr r0, _08078DA4 @ =0x085766E0
	ldrb r1, [r0, #2]
	adds r0, r3, #0
	adds r0, #0x44
	strh r1, [r0]
	adds r1, r3, #0
	adds r1, #0x4e
	movs r0, #0xb
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	strb r2, [r4]
	b _08078E76
	.align 2, 0
_08078D9C: .4byte gNonGameplayRam
_08078DA0: .4byte 0x0000023D
_08078DA4: .4byte 0x085766E0
_08078DA8:
	ldr r3, _08078DC8 @ =gNonGameplayRam
	ldrh r1, [r3, #4]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08078E76
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	b _08078DEC
	.align 2, 0
_08078DC8: .4byte gNonGameplayRam
_08078DCC:
	movs r0, #3
	bl unk_78af0
	ldr r3, _08078DF4 @ =gNonGameplayRam
	adds r0, r3, #0
	adds r0, #0x4e
	movs r2, #0
	strb r2, [r0]
	adds r0, #0x30
	strb r2, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	adds r0, #1
_08078DEA:
	strb r0, [r1]
_08078DEC:
	ldr r1, _08078DF8 @ =0x0000023D
	adds r0, r3, r1
	strb r2, [r0]
	b _08078E76
	.align 2, 0
_08078DF4: .4byte gNonGameplayRam
_08078DF8: .4byte 0x0000023D
_08078DFC:
	ldr r2, _08078E2C @ =gNonGameplayRam
	adds r0, r2, #0
	adds r0, #0x96
	ldrb r0, [r0]
	cmp r0, #0
	bne _08078E76
	adds r0, r2, #0
	adds r0, #0xa2
	ldrb r3, [r0]
	cmp r3, #0
	bne _08078E76
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _08078E30 @ =0x0000023D
	adds r0, r2, r1
	strb r3, [r0]
	movs r0, #1
	bl MapScreenDrawSpecialOam
	b _08078E76
	.align 2, 0
_08078E2C: .4byte gNonGameplayRam
_08078E30: .4byte 0x0000023D
_08078E34:
	ldr r3, _08078E60 @ =gNonGameplayRam
	ldr r2, _08078E64 @ =0x0000023D
	adds r4, r3, r2
	ldrb r0, [r4]
	cmp r0, #0x10
	bls _08078E76
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0
	strb r0, [r2]
	strb r1, [r4]
	ldrh r1, [r3, #4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08078E68
	movs r0, #2
	b _08078E72
	.align 2, 0
_08078E60: .4byte gNonGameplayRam
_08078E64: .4byte 0x0000023D
_08078E68:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08078E76
	movs r0, #4
_08078E72:
	eors r0, r1
	strh r0, [r3, #4]
_08078E76:
	ldr r2, _08078EA0 @ =gNonGameplayRam
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	bls _08078E98
	adds r3, r2, #0
	adds r3, #0x8a
	ldrb r0, [r3]
	cmp r0, #0x64
	bne _08078E98
	adds r0, #1
	movs r1, #0
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x88
	strb r1, [r0]
	adds r0, #1
_08078E96:
	strb r1, [r0]
_08078E98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078EA0: .4byte gNonGameplayRam

	thumb_func_start NavigationConversationUpdatePanel
NavigationConversationUpdatePanel: @ 0x08078EA4
	push {r4, r5, lr}
	ldr r1, _08078EC0 @ =gNonGameplayRam
	ldrh r0, [r1, #4]
	movs r2, #1
	ands r2, r0
	adds r5, r1, #0
	cmp r2, #0
	bne _08078EC4
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r5, r1
	strb r2, [r0]
	b _080790A8
	.align 2, 0
_08078EC0: .4byte gNonGameplayRam
_08078EC4:
	ldr r1, _08078EE8 @ =0x00000239
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _08078EDC
	b _0807910E
_08078EDC:
	lsls r0, r0, #2
	ldr r1, _08078EEC @ =_08078EF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08078EE8: .4byte 0x00000239
_08078EEC: .4byte _08078EF0
_08078EF0: @ jump table
	.4byte _08078F28 @ case 0
	.4byte _08078F3E @ case 1
	.4byte _08078F60 @ case 2
	.4byte _0807908C @ case 3
	.4byte _08078F68 @ case 4
	.4byte _08078F90 @ case 5
	.4byte _08078FE0 @ case 6
	.4byte _08079038 @ case 7
	.4byte _08079060 @ case 8
	.4byte _08079066 @ case 9
	.4byte _0807908C @ case 10
	.4byte _080790B4 @ case 11
	.4byte _080790EC @ case 12
	.4byte _0807910E @ case 13
_08078F28:
	adds r1, r5, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x7c
	bne _08078F38
	b _080790D0
_08078F38:
	adds r0, r2, #0
	subs r0, #8
	b _080790C6
_08078F3E:
	ldr r2, _08078F5C @ =0x00000239
	adds r3, r5, r2
	ldrb r0, [r3]
	cmp r0, #8
	bhi _08078F4A
	b _0807910E
_08078F4A:
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	adds r1, #1
	movs r2, #0
	strb r1, [r0]
	b _0807910C
	.align 2, 0
_08078F5C: .4byte 0x00000239
_08078F60:
	movs r0, #2
	bl PauseScreenSetNavigationTextPanelOam
	b _08079040
_08078F68:
	movs r0, #3
	movs r1, #0x49
	bl UpdateMenuOamDataID
	ldr r1, _08078F88 @ =gNonGameplayRam
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r2, r1, r0
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	ldr r2, _08078F8C @ =0x00000239
	adds r1, r1, r2
	strb r3, [r1]
	b _0807910E
	.align 2, 0
_08078F88: .4byte gNonGameplayRam
_08078F8C: .4byte 0x00000239
_08078F90:
	adds r0, r5, #0
	adds r0, #0x5b
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08078FA0
	b _0807910E
_08078FA0:
	ldrh r1, [r5, #4]
	movs r0, #8
	movs r2, #0
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #8
	strh r0, [r5, #0x3a]
	ldr r0, _08078FDC @ =0x085766E0
	ldrb r0, [r0]
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	adds r0, #0x40
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldrb r0, [r5, #0x1c]
	cmp r0, #5
	beq _08078FCC
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0xb
	strb r0, [r1]
_08078FCC:
	movs r3, #0x8e
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	b _080790DE
	.align 2, 0
_08078FDC: .4byte 0x085766E0
_08078FE0:
	ldr r2, _08079004 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0807900C
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _08079008 @ =0x00000239
	adds r0, r2, r1
	strb r3, [r0]
	b _0807901E
	.align 2, 0
_08079004: .4byte gNonGameplayRam
_08079008: .4byte 0x00000239
_0807900C:
	ldr r3, _08079030 @ =0x00000239
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0807901E
	movs r0, #3
	movs r1, #0x4c
	bl UpdateMenuOamDataID
_0807901E:
	ldr r0, _08079034 @ =gNonGameplayRam
	ldr r2, _08079030 @ =0x00000239
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0x3c
	bls _0807910E
	movs r0, #0x3c
	strb r0, [r1]
	b _0807910E
	.align 2, 0
_08079030: .4byte 0x00000239
_08079034: .4byte gNonGameplayRam
_08079038:
	movs r0, #3
	movs r1, #0x4a
	bl UpdateMenuOamDataID
_08079040:
	ldr r1, _08079058 @ =gNonGameplayRam
	movs r3, #0x8e
	lsls r3, r3, #2
	adds r2, r1, r3
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	ldr r0, _0807905C @ =0x00000239
	adds r1, r1, r0
	strb r3, [r1]
	b _0807910E
	.align 2, 0
_08079058: .4byte gNonGameplayRam
_0807905C: .4byte 0x00000239
_08079060:
	adds r0, r5, #0
	adds r0, #0x5b
	b _08079090
_08079066:
	adds r0, r5, #0
	adds r0, #0x42
	movs r4, #0
	strb r4, [r0]
	movs r0, #3
	bl PauseScreenSetNavigationTextPanelOam
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _08079088 @ =0x00000239
	adds r0, r5, r1
	strb r4, [r0]
	b _0807910E
	.align 2, 0
_08079088: .4byte 0x00000239
_0807908C:
	adds r0, r5, #0
	adds r0, #0x67
_08079090:
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807910E
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
_080790A8:
	ldr r3, _080790B0 @ =0x00000239
	adds r0, r5, r3
	strb r2, [r0]
	b _0807910E
	.align 2, 0
_080790B0: .4byte 0x00000239
_080790B4:
	adds r1, r5, #0
	adds r1, #0x5c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0xcc
	beq _080790D0
	adds r0, r2, #0
	adds r0, #8
_080790C6:
	strh r0, [r1]
	movs r0, #0
	bl PauseScreenSetNavigationTextPanelOam
	b _0807910E
_080790D0:
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
_080790DE:
	ldr r1, _080790E8 @ =0x00000239
	adds r0, r5, r1
	strb r2, [r0]
	b _0807910E
	.align 2, 0
_080790E8: .4byte 0x00000239
_080790EC:
	ldr r2, _08079114 @ =0x00000239
	adds r3, r5, r2
	ldrb r0, [r3]
	cmp r0, #8
	bls _0807910E
	ldrh r0, [r5, #4]
	movs r1, #1
	eors r0, r1
	movs r2, #0
	strh r0, [r5, #4]
	movs r0, #0x8e
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0807910C:
	strb r2, [r3]
_0807910E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08079114: .4byte 0x00000239

	thumb_func_start GetCharacterWidth
GetCharacterWidth: @ 0x08079118
	push {lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _0807912C @ =0x0000049F
	cmp r1, r0
	bhi _08079134
	ldr r0, _08079130 @ =0x08576234
	adds r0, r1, r0
	ldrb r0, [r0]
	b _08079136
	.align 2, 0
_0807912C: .4byte 0x0000049F
_08079130: .4byte 0x08576234
_08079134:
	movs r0, #0xa
_08079136:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DrawCharacter
DrawCharacter: @ 0x0807913C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r4, [sp, #0x3c]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r0, #0
	mov r8, r0
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #2
	str r0, [sp, #0x14]
_08079170:
	ldr r6, _080791D4 @ =0x02035DA0
	mov r1, r8
	cmp r1, #0
	beq _0807917A
	adds r6, #0x40
_0807917A:
	ldr r2, [sp]
	lsls r1, r2, #5
	mov r3, r8
	lsls r0, r3, #0xa
	adds r3, r1, r0
	movs r1, #0x20
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807918E
	movs r1, #0x40
_0807918E:
	mov r0, r8
	lsls r0, r0, #8
	mov sb, r0
	mov r2, r8
	adds r2, #1
	str r2, [sp, #0x18]
	cmp r1, #0
	beq _080791E8
	ldr r7, _080791D8 @ =0x08682FAC
	adds r5, r1, #0
_080791A2:
	adds r0, r3, r7
	ldrb r4, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _080791DC
	movs r2, #0xf
	ands r2, r4
	movs r1, #0xf0
	ands r1, r4
	subs r0, r2, #2
	cmp r0, #1
	bhi _080791C0
	ldr r4, [sp, #0xc]
	lsls r0, r4, #1
	adds r2, r2, r0
_080791C0:
	cmp r1, #0x20
	beq _080791C8
	cmp r1, #0x30
	bne _080791CE
_080791C8:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #5
	adds r1, r1, r0
_080791CE:
	orrs r1, r2
	strb r1, [r6]
	b _080791DE
	.align 2, 0
_080791D4: .4byte 0x02035DA0
_080791D8: .4byte 0x08682FAC
_080791DC:
	strb r4, [r6]
_080791DE:
	subs r5, #1
	adds r6, #1
	adds r3, #1
	cmp r5, #0
	bne _080791A2
_080791E8:
	ldr r0, _08079290 @ =0x02035DA0
	mov sl, r0
	mov r1, r8
	cmp r1, #0
	beq _080791F6
	ldr r2, _08079294 @ =0x02035DE0
	mov sl, r2
_080791F6:
	ldr r3, [sp, #4]
	cmp r3, #8
	bls _08079216
	ldr r0, _08079298 @ =0x0879C128
	ldr r4, [sp, #0x14]
	adds r5, r4, r0
	mov r2, sl
	adds r2, #0x20
	movs r3, #7
_08079208:
	ldr r0, [r2]
	ldr r1, [r5]
	ands r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _08079208
_08079216:
	mov r4, sb
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _080792C4
	lsls r6, r0, #2
	ldr r1, [sp, #4]
	adds r1, r1, r0
	mov sb, r1
	mov ip, r6
	movs r0, #0x20
	subs r7, r0, r6
	mov r2, r8
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x10]
	adds r2, r0, r3
	mov r5, sl
	movs r3, #7
_08079238:
	ldr r1, [r5]
	mov r0, ip
	lsls r1, r0
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldm r5!, {r1}
	lsrs r1, r7
	ldr r0, [r2, #0x20]
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079238
	mov r1, sb
	cmp r1, #0x10
	ble _0807929C
	adds r5, r6, #0
	movs r0, #0x20
	subs r6, r0, r5
	lsls r0, r4, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	adds r2, r0, #0
	adds r2, #0x20
	mov r4, sl
	adds r4, #0x20
	movs r3, #7
_08079272:
	ldr r1, [r4]
	lsls r1, r5
	ldr r0, [r2]
	orrs r0, r1
	str r0, [r2]
	ldm r4!, {r1}
	lsrs r1, r6
	ldr r0, [r2, #0x20]
	orrs r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079272
	b _080792EC
	.align 2, 0
_08079290: .4byte 0x02035DA0
_08079294: .4byte 0x02035DE0
_08079298: .4byte 0x0879C128
_0807929C:
	ldr r3, [sp, #4]
	cmp r3, #8
	bls _080792EC
	lsls r0, r4, #2
	ldr r4, [sp, #0x10]
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x20
	mov r5, sl
	adds r5, #0x20
	movs r3, #7
_080792B2:
	ldm r5!, {r1}
	lsls r1, r6
	ldr r0, [r2]
	orrs r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _080792B2
	b _080792EC
_080792C4:
	movs r1, #8
	ldr r0, [sp, #4]
	cmp r0, #8
	bls _080792CE
	movs r1, #0x10
_080792CE:
	cmp r1, #0
	beq _080792EC
	mov r2, r8
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x10]
	adds r2, r0, r3
	mov r5, sl
	adds r3, r1, #0
_080792DE:
	ldr r0, [r2]
	ldm r5!, {r1}
	orrs r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bne _080792DE
_080792EC:
	ldr r4, [sp, #0x18]
	mov r8, r4
	cmp r4, #1
	bgt _080792F6
	b _08079170
_080792F6:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawCharacterDebugMenu
DrawCharacterDebugMenu: @ 0x08079308
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	cmp r6, #0
	beq _080793B4
	movs r3, #0
	lsls r0, r0, #5
	mov sb, r0
	ldr r0, _08079354 @ =0x08682FAC
	mov sl, r0
	ldr r1, _08079358 @ =0x040000D4
	mov r8, r1
_08079330:
	lsls r0, r3, #0xa
	mov r1, sb
	adds r2, r1, r0
	ldr r5, _0807935C @ =0x02035DA0
	adds r7, r0, #0
	adds r3, #1
	mov ip, r3
	movs r4, #0x1f
	add r2, sl
_08079342:
	ldrb r0, [r2]
	movs r1, #0xf
	ands r1, r0
	subs r0, r1, #2
	cmp r0, #1
	bhi _08079360
	lsls r0, r6, #1
	adds r1, r1, r0
	b _08079366
	.align 2, 0
_08079354: .4byte 0x08682FAC
_08079358: .4byte 0x040000D4
_0807935C: .4byte 0x02035DA0
_08079360:
	cmp r1, #0
	bne _08079366
	movs r1, #0xf
_08079366:
	ldrb r0, [r2]
	movs r3, #0xf0
	ands r3, r0
	cmp r3, #0x20
	beq _08079374
	cmp r3, #0x30
	bne _0807937A
_08079374:
	lsls r0, r6, #5
	adds r3, r3, r0
	b _08079380
_0807937A:
	cmp r3, #0
	bne _08079380
	movs r3, #0xf0
_08079380:
	orrs r3, r1
	strb r3, [r5]
	subs r4, #1
	adds r5, #1
	adds r2, #1
	cmp r4, #0
	bge _08079342
	ldr r0, _080793AC @ =0x02035DA0
	mov r1, r8
	str r0, [r1]
	ldr r1, [sp]
	adds r0, r1, r7
	mov r1, r8
	str r0, [r1, #4]
	ldr r0, _080793B0 @ =0x84000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r3, ip
	cmp r3, #1
	ble _08079330
	b _08079416
	.align 2, 0
_080793AC: .4byte 0x02035DA0
_080793B0: .4byte 0x84000008
_080793B4:
	movs r3, #0
	lsls r0, r0, #5
	str r0, [sp, #4]
	ldr r0, _08079428 @ =0x08682FAC
	mov sl, r0
	ldr r6, _0807942C @ =0x040000D4
	movs r1, #0xf
	mov sb, r1
	movs r0, #0xf0
	mov r8, r0
_080793C8:
	lsls r0, r3, #0xa
	ldr r1, [sp, #4]
	adds r2, r1, r0
	ldr r5, _08079430 @ =0x02035DA0
	adds r7, r0, #0
	adds r3, #1
	mov ip, r3
	movs r4, #0x1f
_080793D8:
	mov r1, sl
	adds r0, r2, r1
	ldrb r0, [r0]
	mov r1, sb
	ands r1, r0
	cmp r1, #0
	bne _080793E8
	movs r1, #0xf
_080793E8:
	mov r3, r8
	ands r3, r0
	cmp r3, #0
	bne _080793F2
	movs r3, #0xf0
_080793F2:
	orrs r3, r1
	strb r3, [r5]
	subs r4, #1
	adds r5, #1
	adds r2, #1
	cmp r4, #0
	bge _080793D8
	ldr r0, _08079430 @ =0x02035DA0
	str r0, [r6]
	ldr r1, [sp]
	adds r0, r1, r7
	str r0, [r6, #4]
	ldr r0, _08079434 @ =0x84000008
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	mov r3, ip
	cmp r3, #1
	ble _080793C8
_08079416:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079428: .4byte 0x08682FAC
_0807942C: .4byte 0x040000D4
_08079430: .4byte 0x02035DA0
_08079434: .4byte 0x84000008

	thumb_func_start DrawCharacterForMessage
DrawCharacterForMessage: @ 0x08079438
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r4, [sp, #0x48]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #0xc]
	str r1, [sp, #0x14]
	movs r0, #0
	mov ip, r0
	movs r0, #8
	subs r0, r0, r3
	lsls r0, r0, #2
	str r0, [sp, #0x18]
_0807946C:
	ldr r6, _080794C8 @ =0x02035DA0
	mov r1, ip
	cmp r1, #0
	beq _08079476
	adds r6, #0x40
_08079476:
	ldr r2, [sp]
	lsls r1, r2, #5
	mov r3, ip
	lsls r0, r3, #0xa
	adds r3, r1, r0
	movs r1, #0x20
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807948A
	movs r1, #0x40
_0807948A:
	mov r7, ip
	lsls r7, r7, #8
	mov sb, r7
	mov r0, ip
	adds r0, #1
	str r0, [sp, #0x20]
	cmp r1, #0
	beq _08079508
	movs r7, #0xf
	movs r2, #0xf0
	mov r8, r2
	ldr r4, _080794CC @ =0x08682FAC
	mov sl, r4
	adds r5, r1, #0
_080794A6:
	mov r1, sl
	adds r0, r3, r1
	ldrb r4, [r0]
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _080794E6
	adds r2, r4, #0
	ands r2, r7
	mov r1, r8
	ands r1, r4
	subs r0, r2, #2
	cmp r0, #1
	bhi _080794D0
	ldr r4, [sp, #0xc]
	lsls r0, r4, #1
	adds r2, r2, r0
	b _080794D6
	.align 2, 0
_080794C8: .4byte 0x02035DA0
_080794CC: .4byte 0x08682FAC
_080794D0:
	cmp r2, #0
	bne _080794D6
	movs r2, #0xf
_080794D6:
	cmp r1, #0x20
	beq _080794DE
	cmp r1, #0x30
	bne _080794F4
_080794DE:
	ldr r4, [sp, #0xc]
	lsls r0, r4, #5
	adds r1, r1, r0
	b _080794FA
_080794E6:
	adds r2, r4, #0
	ands r2, r7
	mov r1, r8
	ands r1, r4
	cmp r2, #0
	bne _080794F4
	movs r2, #0xf
_080794F4:
	cmp r1, #0
	bne _080794FA
	movs r1, #0xf0
_080794FA:
	orrs r1, r2
	strb r1, [r6]
	subs r5, #1
	adds r6, #1
	adds r3, #1
	cmp r5, #0
	bne _080794A6
_08079508:
	ldr r7, _080795C8 @ =0x02035DA0
	str r7, [sp, #0x10]
	mov r0, ip
	cmp r0, #0
	beq _08079516
	ldr r1, _080795CC @ =0x02035DE0
	str r1, [sp, #0x10]
_08079516:
	mov r4, sb
	ldr r2, [sp, #8]
	cmp r2, #0
	beq _08079610
	lsls r6, r2, #2
	ldr r3, [sp, #4]
	adds r3, r3, r2
	str r3, [sp, #0x1c]
	mov sl, r6
	ldr r7, _080795D0 @ =0x0879C128
	adds r7, r7, r6
	mov sb, r7
	movs r0, #0x20
	subs r0, r0, r6
	mov r8, r0
	ldr r0, [sp, #0x18]
	ldr r1, _080795D4 @ =0x0879C14C
	adds r0, r0, r1
	str r0, [sp, #0x24]
	mov r2, ip
	lsls r0, r2, #0xa
	ldr r3, [sp, #0x14]
	adds r2, r0, r3
	ldr r5, [sp, #0x10]
	movs r3, #7
_08079548:
	ldr r1, [r5]
	mov r7, sl
	lsls r1, r7
	mov r7, sb
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldm r5!, {r1}
	mov r0, r8
	lsrs r1, r0
	ldr r7, [sp, #0x24]
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2, #0x20]
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _08079548
	ldr r0, [sp, #0x1c]
	cmp r0, #0x10
	ble _080795D8
	adds r5, r6, #0
	ldr r1, _080795D0 @ =0x0879C128
	adds r1, r1, r5
	mov r8, r1
	movs r0, #0x20
	subs r0, r0, r5
	mov sb, r0
	ldr r2, [sp, #0x18]
	ldr r3, _080795D4 @ =0x0879C14C
	adds r6, r2, r3
	lsls r0, r4, #2
	ldr r4, [sp, #0x14]
	adds r0, r0, r4
	adds r2, r0, #0
	adds r2, #0x20
	ldr r4, [sp, #0x10]
	adds r4, #0x20
	movs r3, #7
_0807959E:
	ldr r1, [r4]
	lsls r1, r5
	mov r7, r8
	ldr r0, [r7]
	orrs r1, r0
	ldr r0, [r2]
	ands r0, r1
	str r0, [r2]
	ldm r4!, {r1}
	mov r0, sb
	lsrs r1, r0
	ldr r0, [r6]
	orrs r1, r0
	ldr r0, [r2, #0x20]
	ands r0, r1
	str r0, [r2, #0x20]
	adds r2, #4
	subs r3, #1
	cmp r3, #0
	bge _0807959E
	b _08079638
	.align 2, 0
_080795C8: .4byte 0x02035DA0
_080795CC: .4byte 0x02035DE0
_080795D0: .4byte 0x0879C128
_080795D4: .4byte 0x0879C14C
_080795D8:
	ldr r1, [sp, #4]
	cmp r1, #8
	bls _08079638
	adds r5, r6, #0
	ldr r2, _0807960C @ =0x0879C128
	adds r7, r5, r2
	lsls r0, r4, #2
	ldr r3, [sp, #0x14]
	adds r0, r0, r3
	adds r2, r0, #0
	adds r2, #0x20
	ldr r6, [sp, #0x10]
	adds r6, #0x20
	movs r3, #7
_080795F4:
	ldm r6!, {r0}
	lsls r0, r5
	ldr r1, [r7]
	orrs r0, r1
	ldr r1, [r2]
	ands r1, r0
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bge _080795F4
	b _08079638
	.align 2, 0
_0807960C: .4byte 0x0879C128
_08079610:
	movs r1, #8
	ldr r4, [sp, #4]
	cmp r4, #8
	bls _0807961A
	movs r1, #0x10
_0807961A:
	cmp r1, #0
	beq _08079638
	mov r7, ip
	lsls r0, r7, #0xa
	ldr r3, [sp, #0x14]
	adds r2, r0, r3
	ldr r5, [sp, #0x10]
	adds r3, r1, #0
_0807962A:
	ldr r0, [r2]
	ldm r5!, {r1}
	ands r0, r1
	stm r2!, {r0}
	subs r3, #1
	cmp r3, #0
	bne _0807962A
_08079638:
	ldr r4, [sp, #0x20]
	mov ip, r4
	cmp r4, #1
	bgt _08079642
	b _0807946C
_08079642:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DrawLocationTextCharacters
DrawLocationTextCharacters: @ 0x08079654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08079672
	movs r0, #0x80
	lsls r0, r0, #0x12
	mov sb, r0
	b _0807969C
_08079672:
	cmp r0, #2
	bne _08079730
	ldr r1, _080796D4 @ =0x02000800
	mov sb, r1
	ldr r2, [r5]
	ldrh r0, [r2]
	movs r1, #0xfe
	lsls r1, r1, #8
	cmp r0, r1
	beq _08079696
	adds r3, r1, #0
_08079688:
	adds r0, r2, #0
	adds r1, r0, #2
	adds r2, r1, #0
	ldrh r0, [r0, #2]
	cmp r0, r3
	bne _08079688
	str r1, [r5]
_08079696:
	ldr r0, [r5]
	adds r0, #2
	str r0, [r5]
_0807969C:
	movs r6, #0
	ldr r3, [r5]
	movs r2, #0xff
	lsls r2, r2, #8
	adds r7, r2, #0
	ldrh r1, [r3]
	cmp r1, r7
	beq _08079730
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	beq _08079730
	movs r4, #0x80
	lsls r4, r4, #8
	mov sl, r4
_080796BA:
	movs r4, #1
	ldrh r2, [r3]
	adds r1, r7, #0
	ands r1, r2
	cmp r1, sl
	bne _080796D8
	movs r0, #0xff
	mov r8, r0
	mov r1, r8
	ands r1, r2
	mov r8, r1
	b _08079712
	.align 2, 0
_080796D4: .4byte 0x02000800
_080796D8:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _080796E8
	movs r4, #0
	mov r8, r4
	movs r6, #0xff
	ands r6, r2
_080796E8:
	cmp r4, #0
	beq _08079712
	ldrh r0, [r3]
	bl GetCharacterWidth
	mov r8, r0
	asrs r0, r6, #3
	lsls r4, r0, #5
	movs r3, #7
	ldr r0, [r5]
	ldrh r0, [r0]
	mov r2, sb
	adds r1, r2, r4
	mov r4, r8
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ands r3, r6
	movs r4, #0
	str r4, [sp]
	bl DrawCharacterForMessage
_08079712:
	ldr r0, [r5]
	adds r2, r0, #2
	str r2, [r5]
	add r6, r8
	movs r1, #0xff
	lsls r1, r1, #8
	adds r7, r1, #0
	ldrh r1, [r0, #2]
	cmp r1, r7
	beq _08079730
	adds r3, r2, #0
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _080796BA
_08079730:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start DrawLocationText
DrawLocationText: @ 0x08079740
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov r2, sp
	ldr r3, _080797AC @ =0x0000FFFF
	adds r1, r3, #0
	strh r1, [r2]
	ldr r4, _080797B0 @ =0x040000D4
	str r2, [r4]
	movs r6, #0x80
	lsls r6, r6, #0x12
	str r6, [r4, #4]
	ldr r1, _080797B4 @ =0x81000400
	str r1, [r4, #8]
	ldr r1, [r4, #8]
	ldr r2, _080797B8 @ =0x0879CDD8
	ldr r1, _080797BC @ =0x03000011
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	lsrs r0, r0, #0x16
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
	add r1, sp, #4
	movs r0, #1
	bl DrawLocationTextCharacters
	str r6, [r4]
	lsls r5, r5, #0xb
	ldr r1, _080797C0 @ =0x06014000
	adds r0, r5, r1
	str r0, [r4, #4]
	ldr r1, _080797C4 @ =0x840000E0
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080797C8 @ =0x02000400
	str r0, [r4]
	ldr r3, _080797CC @ =0x06014400
	adds r5, r5, r3
	str r5, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080797AC: .4byte 0x0000FFFF
_080797B0: .4byte 0x040000D4
_080797B4: .4byte 0x81000400
_080797B8: .4byte 0x0879CDD8
_080797BC: .4byte 0x03000011
_080797C0: .4byte 0x06014000
_080797C4: .4byte 0x840000E0
_080797C8: .4byte 0x02000400
_080797CC: .4byte 0x06014400

	thumb_func_start TextDrawMessageBanner
TextDrawMessageBanner: @ 0x080797D0
	push {r4, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r3, r2, #0x18
	movs r1, #0xfc
	lsls r1, r1, #0x18
	adds r2, r2, r1
	lsrs r2, r2, #0x18
	cmp r2, #1
	bhi _0807980E
	adds r2, r0, #0
	cmp r2, #0x15
	ble _080797F4
	movs r2, #0x15
_080797F4:
	adds r2, #0x15
	ldr r1, _0807981C @ =0x0879CDF4
	ldr r0, _08079820 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
_0807980E:
	cmp r3, #7
	bne _08079828
	ldr r1, _08079824 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #0x12
	b _08079830
	.align 2, 0
_0807981C: .4byte 0x0879CDF4
_08079820: .4byte 0x03000011
_08079824: .4byte 0x0000FFFF
_08079828:
	cmp r3, #6
	bne _08079848
	ldr r1, _08079840 @ =0x0000FFFF
	ldr r2, _08079844 @ =0x02000800
_08079830:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl BitFill
	b _080798C8
	.align 2, 0
_08079840: .4byte 0x0000FFFF
_08079844: .4byte 0x02000800
_08079848:
	cmp r3, #5
	bne _08079850
	movs r0, #1
	b _08079856
_08079850:
	cmp r3, #4
	bne _0807985E
	movs r0, #2
_08079856:
	add r1, sp, #4
	bl DrawLocationTextCharacters
	b _080798C8
_0807985E:
	cmp r3, #3
	bne _08079878
	ldr r1, _08079870 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _08079874 @ =0x06014000
	b _080798BE
	.align 2, 0
_08079870: .4byte 0x040000D4
_08079874: .4byte 0x06014000
_08079878:
	cmp r3, #2
	bne _08079894
	ldr r1, _08079888 @ =0x040000D4
	ldr r0, _0807988C @ =0x02000400
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _08079890 @ =0x06014400
	b _080798BE
	.align 2, 0
_08079888: .4byte 0x040000D4
_0807988C: .4byte 0x02000400
_08079890: .4byte 0x06014400
_08079894:
	cmp r3, #1
	bne _080798B0
	ldr r1, _080798A4 @ =0x040000D4
	ldr r0, _080798A8 @ =0x02000800
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _080798AC @ =0x06014800
	b _080798BE
	.align 2, 0
_080798A4: .4byte 0x040000D4
_080798A8: .4byte 0x02000800
_080798AC: .4byte 0x06014800
_080798B0:
	cmp r3, #0
	bne _080798C8
	ldr r1, _080798D0 @ =0x040000D4
	ldr r0, _080798D4 @ =0x02000C00
	str r0, [r1]
	lsls r0, r4, #0xb
	ldr r2, _080798D8 @ =0x06014C00
_080798BE:
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _080798DC @ =0x840000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080798C8:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080798D0: .4byte 0x040000D4
_080798D4: .4byte 0x02000C00
_080798D8: .4byte 0x06014C00
_080798DC: .4byte 0x840000E0

	thumb_func_start DisplayMessage
DisplayMessage: @ 0x080798E0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r0, #0xfc
	lsls r0, r0, #0x18
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	cmp r1, #1
	bhi _08079964
	movs r2, #0x12
	ldr r0, _0807992C @ =gEventCounter
	ldr r1, _08079930 @ =0x08575FA0
	ldrb r0, [r0]
	ldr r7, _08079934 @ =0x0879CDF4
	ldr r6, _08079938 @ =0x03000011
	ldrb r4, [r1, #0x12]
	cmp r0, r4
	beq _0807991C
	adds r4, r1, #0
	adds r1, r0, #0
_0807990E:
	subs r2, #1
	cmp r2, #0
	beq _08079940
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r1, r0
	bne _0807990E
_0807991C:
	cmp r2, #0
	beq _08079940
	ldr r1, _0807993C @ =0x08575FB4
	lsls r0, r2, #3
	adds r0, r0, r1
	ldrb r2, [r0, #4]
	b _08079952
	.align 2, 0
_0807992C: .4byte gEventCounter
_08079930: .4byte 0x08575FA0
_08079934: .4byte 0x0879CDF4
_08079938: .4byte 0x03000011
_0807993C: .4byte 0x08575FB4
_08079940:
	ldr r1, _08079970 @ =gEquipment
	ldrb r0, [r1, #0xd]
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08079952
	ldrb r0, [r1, #0xd]
	subs r2, r0, #1
_08079952:
	movs r0, #0
	ldrsb r0, [r6, r0]
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp, #4]
_08079964:
	cmp r3, #7
	bne _08079978
	ldr r1, _08079974 @ =0x0000FFFF
	movs r2, #0x80
	lsls r2, r2, #0x12
	b _08079980
	.align 2, 0
_08079970: .4byte gEquipment
_08079974: .4byte 0x0000FFFF
_08079978:
	cmp r3, #6
	bne _08079998
	ldr r1, _08079990 @ =0x0000FFFF
	ldr r2, _08079994 @ =0x02000800
_08079980:
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl BitFill
	b _08079A20
	.align 2, 0
_08079990: .4byte 0x0000FFFF
_08079994: .4byte 0x02000800
_08079998:
	cmp r3, #5
	bne _080799A0
	movs r0, #1
	b _080799A6
_080799A0:
	cmp r3, #4
	bne _080799AE
	movs r0, #2
_080799A6:
	add r1, sp, #4
	bl DrawLocationTextCharacters
	b _08079A20
_080799AE:
	cmp r3, #3
	bne _080799CC
	ldr r1, _080799C4 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r2, _080799C8 @ =0x06014000
	adds r0, r0, r2
	b _08079A18
	.align 2, 0
_080799C4: .4byte 0x040000D4
_080799C8: .4byte 0x06014000
_080799CC:
	cmp r3, #2
	bne _080799E8
	ldr r1, _080799DC @ =0x040000D4
	ldr r0, _080799E0 @ =0x02000400
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r4, _080799E4 @ =0x06014400
	b _08079A16
	.align 2, 0
_080799DC: .4byte 0x040000D4
_080799E0: .4byte 0x02000400
_080799E4: .4byte 0x06014400
_080799E8:
	cmp r3, #1
	bne _08079A08
	ldr r1, _080799FC @ =0x040000D4
	ldr r0, _08079A00 @ =0x02000800
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r2, _08079A04 @ =0x06014800
	adds r0, r0, r2
	b _08079A18
	.align 2, 0
_080799FC: .4byte 0x040000D4
_08079A00: .4byte 0x02000800
_08079A04: .4byte 0x06014800
_08079A08:
	cmp r3, #0
	bne _08079A20
	ldr r1, _08079A28 @ =0x040000D4
	ldr r0, _08079A2C @ =0x02000C00
	str r0, [r1]
	lsls r0, r5, #0xb
	ldr r4, _08079A30 @ =0x06014C00
_08079A16:
	adds r0, r0, r4
_08079A18:
	str r0, [r1, #4]
	ldr r0, _08079A34 @ =0x840000E0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08079A20:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079A28: .4byte 0x040000D4
_08079A2C: .4byte 0x02000C00
_08079A30: .4byte 0x06014C00
_08079A34: .4byte 0x840000E0

	thumb_func_start ClearTextGraphics
ClearTextGraphics: @ 0x08079A38
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bne _08079A58
	ldr r0, _08079A54 @ =gNonGameplayRam
	ldrb r0, [r0, #0x18]
	movs r1, #3
	cmp r0, #0
	beq _08079A68
	movs r1, #5
	b _08079A68
	.align 2, 0
_08079A54: .4byte gNonGameplayRam
_08079A58:
	cmp r1, #2
	bne _08079A68
	ldr r0, _08079A70 @ =gNonGameplayRam
	ldrb r0, [r0, #0x18]
	movs r1, #4
	cmp r0, #0
	beq _08079A68
	movs r1, #6
_08079A68:
	cmp r1, #3
	bne _08079A78
	ldr r2, _08079A74 @ =0x06007000
	b _08079A92
	.align 2, 0
_08079A70: .4byte gNonGameplayRam
_08079A74: .4byte 0x06007000
_08079A78:
	cmp r1, #4
	bne _08079A8C
	ldr r6, _08079A84 @ =0x06007800
	ldr r2, _08079A88 @ =0x06007000
	b _08079AB0
	.align 2, 0
_08079A84: .4byte 0x06007800
_08079A88: .4byte 0x06007000
_08079A8C:
	cmp r1, #5
	bne _08079AA8
	ldr r2, _08079AA4 @ =0x06006000
_08079A92:
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	b _08079AEE
	.align 2, 0
_08079AA4: .4byte 0x06006000
_08079AA8:
	cmp r1, #6
	bne _08079ADC
	ldr r6, _08079AD4 @ =0x06006800
	ldr r2, _08079AD8 @ =0x06006000
_08079AB0:
	movs r5, #0x80
	lsls r5, r5, #4
	movs r4, #0x20
	str r4, [sp]
	movs r0, #3
	adds r1, r6, #0
	adds r3, r5, #0
	bl DmaTransfer
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r6, #0
	adds r3, r5, #0
	bl BitFill
	b _08079AEE
	.align 2, 0
_08079AD4: .4byte 0x06006800
_08079AD8: .4byte 0x06006000
_08079ADC:
	ldr r2, _08079AF8 @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #6
	movs r0, #0x20
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
_08079AEE:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08079AF8: .4byte 0x06006000

	thumb_func_start NavigationConversationProcessText
NavigationConversationProcessText: @ 0x08079AFC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _08079B14 @ =gNonGameplayRam
	ldrb r1, [r0, #0x17]
	adds r5, r0, #0
	cmp r1, #0
	beq _08079B18
	ldrh r1, [r5, #4]
	movs r0, #0x10
	b _08079B1C
	.align 2, 0
_08079B14: .4byte gNonGameplayRam
_08079B18:
	ldrh r1, [r5, #4]
	movs r0, #8
_08079B1C:
	ands r0, r1
	cmp r0, #0
	bne _08079B24
	b _0807A0EC
_08079B24:
	ldrb r0, [r5, #0x18]
	ldr r1, _08079B70 @ =0x06007000
	mov r8, r1
	cmp r0, #0
	beq _08079B32
	ldr r2, _08079B74 @ =0x06006000
	mov r8, r2
_08079B32:
	movs r7, #0
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, r5, #0
	adds r4, #0xe
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079B80
	ldr r0, _08079B78 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079B56
	b _0807A0EC
_08079B56:
	ldr r0, _08079B7C @ =0x00000203
	bl SoundPlay
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r6, #0
	strh r7, [r0]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, #4
	b _08079B94
	.align 2, 0
_08079B70: .4byte 0x06007000
_08079B74: .4byte 0x06006000
_08079B78: .4byte gChangedInput
_08079B7C: .4byte 0x00000203
_08079B80:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079BDA
	movs r6, #0
	strh r7, [r2]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r4, r5, #0
	adds r4, #0x12
_08079B94:
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0xe0
	bls _08079BA2
	movs r0, #2
	bl ClearTextGraphics
_08079BA2:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0xe0
	strh r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r6, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r6, [r0]
	b _0807A0EC
_08079BDA:
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _08079C48
	ldr r0, _08079C40 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079BF0
	b _0807A0EC
_08079BF0:
	ldr r0, _08079C44 @ =0x00000203
	bl SoundPlay
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r4, #0
	strh r7, [r0]
	movs r0, #1
	bl ClearTextGraphics
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x12
	adds r0, r0, r1
	strh r7, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r4, [r0]
	b _0807A0EC
	.align 2, 0
_08079C40: .4byte gChangedInput
_08079C44: .4byte 0x00000203
_08079C48:
	ldr r0, _08079C60 @ =0x0000E001
	cmp r1, r0
	bne _08079C64
	ldrh r1, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08079C5C
	b _0807A0EC
_08079C5C:
	strh r7, [r2]
	b _0807A0EC
	.align 2, 0
_08079C60: .4byte 0x0000E001
_08079C64:
	ldrb r0, [r5, #0x1f]
	cmp r0, #0
	beq _08079C70
	subs r0, #1
	strb r0, [r5, #0x1f]
	b _0807A0EC
_08079C70:
	ldrb r0, [r5, #0x1a]
	ldr r2, _08079CA8 @ =gButtonInput
	cmp r0, #0
	beq _08079C84
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _08079C84
	strb r7, [r5, #0x1a]
_08079C84:
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0xe
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _08079CAC
	ldrb r0, [r5, #0x1a]
	cmp r0, #0
	bne _08079CAC
	movs r7, #1
	b _08079CC0
	.align 2, 0
_08079CA8: .4byte gButtonInput
_08079CAC:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrb r1, [r5, #0x1d]
	cmp r0, r1
	bhs _08079CC0
	b _0807A0EC
_08079CC0:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r1, [r0]
	subs r0, r1, #1
	lsls r3, r0, #1
	ldr r0, _08079D24 @ =gPreviousNavigationConversation
	ldrb r0, [r0]
	cmp r1, r0
	bne _08079CE4
	adds r3, #1
_08079CE4:
	ldr r1, _08079D28 @ =0x0879C0F0
	ldr r0, _08079D2C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldrh r0, [r5, #0xc]
	lsls r1, r0, #1
	adds r6, r6, r1
	adds r0, #1
	strh r0, [r5, #0xc]
_08079D04:
	movs r3, #0
	ldrh r0, [r6]
	lsrs r1, r0, #0xc
	movs r4, #0xff
	lsls r4, r4, #8
	ands r4, r0
	subs r1, #8
	adds r2, r0, #0
	cmp r1, #7
	bls _08079D1A
	b _08079F9C
_08079D1A:
	lsls r0, r1, #2
	ldr r1, _08079D30 @ =_08079D34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08079D24: .4byte gPreviousNavigationConversation
_08079D28: .4byte 0x0879C0F0
_08079D2C: .4byte 0x03000011
_08079D30: .4byte _08079D34
_08079D34: @ jump table
	.4byte _08079F2C @ case 0
	.4byte _08079F0C @ case 1
	.4byte _08079EEC @ case 2
	.4byte _08079E96 @ case 3
	.4byte _08079E90 @ case 4
	.4byte _08079F9C @ case 5
	.4byte _08079DCE @ case 6
	.4byte _08079D54 @ case 7
_08079D54:
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079D60
	movs r0, #1
	b _08079DB8
_08079D60:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079D78
_08079D68:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	strh r2, [r0]
_08079D74:
	movs r3, #1
	b _08079F9C
_08079D78:
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r2, r0
	beq _08079D88
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r2, r0
	bne _08079DAC
_08079D88:
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0xe
	adds r0, r0, r1
	strh r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #3
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5, #0x1a]
	movs r3, #2
	b _08079F9C
_08079DAC:
	movs r0, #0xfb
	lsls r0, r0, #8
	cmp r2, r0
	beq _08079DB6
	b _08079F9C
_08079DB6:
	movs r0, #2
_08079DB8:
	strb r0, [r5, #0x1c]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #3
	strb r1, [r0]
	movs r3, #2
	b _08079F9C
_08079DCE:
	movs r0, #0xe0
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E00
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r4
	bne _08079DF4
	ldrh r1, [r5, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08079D74
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	b _08079E82
_08079DF4:
	ldr r0, _08079DFC @ =0x0000E001
	cmp r2, r0
	bne _08079D74
	b _08079D68
	.align 2, 0
_08079DFC: .4byte 0x0000E001
_08079E00:
	movs r0, #0xe1
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E0C
	strb r2, [r5, #0x1f]
	b _08079D74
_08079E0C:
	movs r0, #0xe2
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079E5C
	ldrh r1, [r6]
	adds r0, #1
	cmp r1, r0
	bne _08079E2C
	ldrh r0, [r5, #4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #0x18]
	strb r1, [r5, #0x19]
	b _08079E56
_08079E2C:
	ldr r0, _08079E44 @ =0x0000E202
	cmp r1, r0
	bne _08079E48
	ldrh r1, [r5, #4]
	movs r0, #4
	orrs r0, r1
	strh r0, [r5, #4]
	movs r0, #1
	strb r0, [r5, #0x18]
	movs r0, #2
	strb r0, [r5, #0x19]
	b _08079E56
	.align 2, 0
_08079E44: .4byte 0x0000E202
_08079E48:
	ldrh r0, [r5, #4]
	movs r2, #1
	movs r1, #0
	orrs r0, r2
	strh r0, [r5, #4]
	strb r1, [r5, #0x18]
	strb r2, [r5, #0x19]
_08079E56:
	ldrh r0, [r6]
	strb r0, [r5, #0x17]
	b _08079D74
_08079E5C:
	movs r0, #0xe3
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079D74
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	cmp r1, r4
	bne _08079E74
	ldrh r1, [r5, #4]
	movs r0, #0x40
	orrs r0, r1
	b _08079E82
_08079E74:
	ldr r0, _08079E88 @ =0x0000E301
	cmp r1, r0
	beq _08079E7C
	b _08079D74
_08079E7C:
	ldrh r1, [r5, #4]
	ldr r0, _08079E8C @ =0x0000FFBF
	ands r0, r1
_08079E82:
	strh r0, [r5, #4]
	b _08079D74
	.align 2, 0
_08079E88: .4byte 0x0000E301
_08079E8C: .4byte 0x0000FFBF
_08079E90:
	movs r0, #6
	strb r0, [r5, #0x1c]
	b _08079D74
_08079E96:
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08079EA8 @ =0x0000B001
	cmp r1, r0
	bne _08079EAC
	movs r0, #0x99
	lsls r0, r0, #2
	adds r1, r5, r0
	b _08079EB8
	.align 2, 0
_08079EA8: .4byte 0x0000B001
_08079EAC:
	ldr r0, _08079EC0 @ =0x0000B002
	cmp r1, r0
	bne _08079EC4
	movs r2, #0x99
	lsls r2, r2, #2
	adds r1, r5, r2
_08079EB8:
	movs r0, #1
	strb r0, [r1]
	b _08079D74
	.align 2, 0
_08079EC0: .4byte 0x0000B002
_08079EC4:
	ldr r0, _08079EE8 @ =0x0000B003
	cmp r1, r0
	bne _08079F9C
	ldrb r0, [r5, #0x1c]
	cmp r0, #5
	beq _08079F9A
	cmp r0, #3
	beq _08079F9A
	movs r0, #0x2a
	movs r1, #2
	bl PlayMusic
	movs r0, #0
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	b _08079F9A
	.align 2, 0
_08079EE8: .4byte 0x0000B003
_08079EEC:
	ldr r1, _08079F04 @ =0x00000221
	adds r0, r5, r1
	ldrb r0, [r0]
	rsbs r1, r0, #0
	orrs r1, r0
	ldr r0, _08079F08 @ =0x00000FFF
	ands r0, r2
	lsrs r1, r1, #0x1f
	bl unk_3c14
	b _08079F9A
	.align 2, 0
_08079F04: .4byte 0x00000221
_08079F08: .4byte 0x00000FFF
_08079F0C:
	ldr r1, _08079F24 @ =0x00000221
	adds r0, r5, r1
	ldrb r0, [r0]
	rsbs r1, r0, #0
	orrs r1, r0
	ldr r0, _08079F28 @ =0x00000FFF
	ands r0, r2
	lsrs r1, r1, #0x1f
	bl unk_3bd4
	b _08079F9A
	.align 2, 0
_08079F24: .4byte 0x00000221
_08079F28: .4byte 0x00000FFF
_08079F2C:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F46
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0x12
	adds r1, r1, r0
	movs r0, #0xff
	ands r0, r2
	ldrh r2, [r1]
	b _08079F96
_08079F46:
	movs r0, #0x81
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F52
	strb r2, [r5, #0x1e]
	b _08079F9A
_08079F52:
	movs r0, #0x82
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F68
	strb r2, [r5, #0x1d]
	lsls r0, r2, #0x18
	cmp r0, #0
	bne _08079F9A
	movs r0, #8
	strb r0, [r5, #0x1d]
	b _08079F9A
_08079F68:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r4, r0
	bne _08079F9A
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #1
	adds r1, r5, #0
	adds r1, #0x12
	adds r1, r0, r1
	ldrh r0, [r1]
	cmp r0, #0xdf
	bls _08079F84
	movs r0, #0xe0
	b _08079F86
_08079F84:
	movs r0, #0
_08079F86:
	strh r0, [r1]
	ldrb r1, [r5, #0x18]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrb r2, [r6]
_08079F96:
	adds r0, r0, r2
	strh r0, [r1]
_08079F9A:
	movs r3, #3
_08079F9C:
	cmp r3, #3
	bne _08079FB4
	ldr r1, _08079FB0 @ =gNonGameplayRam
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
	adds r6, #2
	adds r5, r1, #0
	b _08079D04
	.align 2, 0
_08079FB0: .4byte gNonGameplayRam
_08079FB4:
	cmp r3, #2
	bne _08079FE0
	ldr r2, _08079FDC @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x34
	movs r3, #0
	strb r3, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x35
	strb r3, [r0]
	b _0807A0EC
	.align 2, 0
_08079FDC: .4byte gNonGameplayRam
_08079FE0:
	cmp r3, #1
	bne _08079FE6
	b _0807A0EC
_08079FE6:
	ldrh r0, [r6]
	bl GetCharacterWidth
	ldr r4, _0807A01C @ =gNonGameplayRam
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r5, r4, #0
	adds r5, #0x12
	adds r2, r0, r5
	ldrh r1, [r2]
	ldrb r0, [r4, #0x16]
	adds r3, r1, r0
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r3, r0
	ble _0807A020
	movs r0, #2
	bl ClearTextGraphics
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0xe0
	strh r1, [r0]
	b _0807A02C
	.align 2, 0
_0807A01C: .4byte gNonGameplayRam
_0807A020:
	cmp r3, #0xe0
	ble _0807A02C
	cmp r1, #0xdf
	bhi _0807A02C
	movs r0, #0xe0
	strh r0, [r2]
_0807A02C:
	ldr r0, _0807A098 @ =gNonGameplayRam
	ldrb r1, [r0, #0x18]
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x12
	adds r1, r1, r2
	ldrh r2, [r1]
	adds r5, r0, #0
	cmp r2, #0
	beq _0807A044
	cmp r2, #0xe0
	bne _0807A046
_0807A044:
	strh r2, [r1]
_0807A046:
	adds r4, r5, #0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r1, r0, r1
	ldrh r3, [r1]
	cmp r3, #0xdf
	bls _0807A060
	movs r0, #0x80
	lsls r0, r0, #4
	add r8, r0
	subs r3, #0xe0
_0807A060:
	asrs r0, r3, #3
	lsls r3, r0, #5
	add r8, r3
	ldrh r1, [r1]
	movs r3, #7
	ldrh r0, [r6]
	ldrb r2, [r4, #0x16]
	ands r3, r1
	ldrb r1, [r4, #0x1e]
	str r1, [sp]
	mov r1, r8
	bl DrawCharacter
	cmp r7, #0
	bne _0807A0BA
	ldrh r0, [r6]
	cmp r0, #0x40
	beq _0807A0BA
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0807A09C
	ldrh r0, [r6]
	movs r1, #0x21
	bl PlayCharacterAppearingSound
	movs r0, #2
	strb r0, [r4, #0x1b]
	b _0807A0BA
	.align 2, 0
_0807A098: .4byte gNonGameplayRam
_0807A09C:
	cmp r0, #2
	bne _0807A0AE
	ldrh r0, [r6]
	movs r1, #0x41
	bl PlayCharacterAppearingSound
	movs r0, #3
	strb r0, [r4, #0x1b]
	b _0807A0BA
_0807A0AE:
	ldrh r0, [r6]
	movs r1, #1
	bl PlayCharacterAppearingSound
	movs r0, #1
	strb r0, [r5, #0x1b]
_0807A0BA:
	movs r3, #1
	ldrh r2, [r6, #2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0807A0D4
	movs r1, #0xf0
	lsls r1, r1, #8
	bics r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
_0807A0D4:
	cmp r3, #0
	beq _0807A0EC
	ldr r2, _0807A0F8 @ =gNonGameplayRam
	ldrb r1, [r2, #0x18]
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #0x12
	adds r1, r1, r0
	ldrh r0, [r1]
	ldrb r2, [r2, #0x16]
	adds r0, r0, r2
	strh r0, [r1]
_0807A0EC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807A0F8: .4byte gNonGameplayRam

	thumb_func_start unk_7a0fc
unk_7a0fc: @ 0x0807A0FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, _0807A120 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #8
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	bne _0807A124
	movs r0, #0
	b _0807A2C2
	.align 2, 0
_0807A120: .4byte gNonGameplayRam
_0807A124:
	movs r0, #0
	mov sl, r0
	mov sb, r0
	lsls r3, r3, #2
	str r3, [sp, #4]
	mov r5, ip
	mov r6, ip
	adds r6, #0x21
	movs r1, #0x20
	add r1, ip
	mov r8, r1
_0807A13A:
	ldr r1, _0807A174 @ =0x0879CDF4
	ldr r0, _0807A178 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r2, [sp, #4]
	adds r0, r2, r0
	adds r0, #0xac
	ldr r4, [r0]
	ldr r7, _0807A17C @ =0x06007000
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r4, r4, r0
	ldrh r1, [r4]
	adds r3, r1, #0
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r3, r0
	bne _0807A180
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	movs r0, #0xe0
	mov r2, ip
	b _0807A1D2
	.align 2, 0
_0807A174: .4byte 0x0879CDF4
_0807A178: .4byte 0x03000011
_0807A17C: .4byte 0x06007000
_0807A180:
	movs r2, #0xff
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807A1A0
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldrh r0, [r5, #0x22]
	ldrb r4, [r4]
	adds r0, r0, r4
	strh r0, [r5, #0x22]
	b _0807A1D4
_0807A1A0:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807A1E0
	movs r1, #0
	mov r2, r8
	strb r1, [r2]
	ldrh r0, [r5, #0x22]
	cmp r0, #0xdf
	bls _0807A1BA
	movs r0, #0xe0
	strh r0, [r5, #0x22]
	b _0807A1BC
_0807A1BA:
	strh r1, [r5, #0x22]
_0807A1BC:
	ldrb r1, [r4]
	mov r2, ip
	ldrh r0, [r2, #0x22]
	adds r3, r0, r1
	strh r3, [r2, #0x22]
	ldrh r1, [r4]
	ldr r0, _0807A1DC @ =0x000083A0
	cmp r1, r0
	bne _0807A1D4
	adds r0, r3, #0
	subs r0, #0x10
_0807A1D2:
	strh r0, [r2, #0x22]
_0807A1D4:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _0807A13A
	.align 2, 0
_0807A1DC: .4byte 0x000083A0
_0807A1E0:
	mov r0, sb
	cmp r0, #0
	bne _0807A22E
	cmp r3, #0x40
	beq _0807A228
	ldrh r0, [r5, #0x22]
	cmp r0, #0xdf
	bhi _0807A228
	ldrb r0, [r5, #0x1a]
	ldr r2, _0807A2D4 @ =gButtonInput
	cmp r0, #0
	beq _0807A206
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _0807A206
	mov r1, sb
	strb r1, [r5, #0x1a]
_0807A206:
	mov r1, r8
	ldrb r0, [r1]
	adds r3, r0, #1
	strb r3, [r1]
	ldrh r1, [r2]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _0807A220
	mov r2, ip
	ldrb r0, [r2, #0x1a]
	cmp r0, #0
	beq _0807A228
_0807A220:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0807A2C0
_0807A228:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_0807A22E:
	ldrh r0, [r4]
	bl GetCharacterWidth
	ldr r2, _0807A2D8 @ =gNonGameplayRam
	strb r0, [r2, #0x16]
	ldrh r1, [r2, #0x22]
	ldrb r0, [r2, #0x16]
	adds r0, r1, r0
	cmp r0, #0xe0
	ble _0807A24A
	cmp r1, #0xdf
	bhi _0807A24A
	movs r0, #0xe0
	strh r0, [r2, #0x22]
_0807A24A:
	ldr r1, _0807A2D8 @ =gNonGameplayRam
	ldrh r0, [r1, #0x22]
	cmp r0, #0
	beq _0807A256
	cmp r0, #0xe0
	bne _0807A258
_0807A256:
	strh r0, [r1, #0x22]
_0807A258:
	ldrh r0, [r4]
	cmp r0, #0x40
	beq _0807A292
	movs r1, #1
	bl PlayCharacterAppearingSound
	ldr r2, _0807A2D8 @ =gNonGameplayRam
	ldrh r0, [r2, #0x22]
	cmp r0, #0xdf
	bls _0807A278
	movs r1, #1
	mov sb, r1
	movs r1, #0x80
	lsls r1, r1, #4
	adds r7, r7, r1
	subs r0, #0xe0
_0807A278:
	asrs r0, r0, #3
	lsls r0, r0, #5
	adds r7, r7, r0
	ldrh r1, [r2, #0x22]
	movs r3, #7
	ldrh r0, [r4]
	ldrb r2, [r2, #0x16]
	ands r3, r1
	movs r1, #0
	str r1, [sp]
	adds r1, r7, #0
	bl DrawCharacter
_0807A292:
	ldrh r0, [r5, #0x22]
	ldrb r2, [r5, #0x16]
	adds r0, r0, r2
	strh r0, [r5, #0x22]
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	ldrh r0, [r4, #2]
	ldr r1, _0807A2D8 @ =gNonGameplayRam
	mov ip, r1
	movs r2, #0xff
	lsls r2, r2, #8
	cmp r0, r2
	bne _0807A2B2
	movs r0, #1
	mov sl, r0
_0807A2B2:
	mov r1, sb
	cmp r1, #0
	beq _0807A2C0
	mov r2, sl
	cmp r2, #0
	bne _0807A2C0
	b _0807A13A
_0807A2C0:
	mov r0, sl
_0807A2C2:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807A2D4: .4byte gButtonInput
_0807A2D8: .4byte gNonGameplayRam

	thumb_func_start NavigationConversationGetCurrentConversation
NavigationConversationGetCurrentConversation: @ 0x0807A2DC
	push {r4, r5, lr}
	ldr r0, _0807A330 @ =gEventCounter
	ldrb r2, [r0]
	ldr r3, _0807A334 @ =0x08575A60
	ldr r4, _0807A338 @ =gNonGameplayRam
	ldr r5, _0807A33C @ =gPreviousNavigationConversation
	cmp r2, #0
	ble _0807A310
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r1, r0, #2
	adds r0, r1, r3
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807A310
	adds r1, r1, r3
_0807A300:
	subs r1, #0xc
	subs r2, #1
	cmp r2, #0
	ble _0807A310
	movs r0, #6
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0807A300
_0807A310:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r1, [r0, #6]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	ldrb r5, [r5]
	cmp r1, r5
	bne _0807A344
	ldr r3, _0807A340 @ =0x00000221
	adds r1, r4, r3
	movs r0, #1
	b _0807A34A
	.align 2, 0
_0807A330: .4byte gEventCounter
_0807A334: .4byte 0x08575A60
_0807A338: .4byte gNonGameplayRam
_0807A33C: .4byte gPreviousNavigationConversation
_0807A340: .4byte 0x00000221
_0807A344:
	ldr r0, _0807A394 @ =0x00000221
	adds r1, r4, r0
	movs r0, #0
_0807A34A:
	strb r0, [r1]
	movs r0, #0
	bl ClearTextGraphics
	movs r0, #1
	bl NavigationConversationUpdateTarget
	bl NavigationConversationSetupOam
	ldr r0, _0807A398 @ =gNonGameplayRam
	movs r2, #0x8e
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #0
	strb r2, [r1]
	ldr r3, _0807A39C @ =0x00000239
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #3
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #1
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #0x13
	adds r1, r0, r3
	strb r2, [r1]
	adds r3, #1
	adds r1, r0, r3
	strb r2, [r1]
	ldr r1, _0807A3A0 @ =0x00000252
	adds r0, r0, r1
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807A394: .4byte 0x00000221
_0807A398: .4byte gNonGameplayRam
_0807A39C: .4byte 0x00000239
_0807A3A0: .4byte 0x00000252

	thumb_func_start NavigationConversationSubroutine
NavigationConversationSubroutine: @ 0x0807A3A4
	push {r4, r5, r6, r7, lr}
	bl unk_7b674
	bl NavigationConversionScrollToTarget
	bl unk_7b56c
	bl NavigationConversationUpdatePanel
	bl unk_78c44
	movs r7, #0
	ldr r0, _0807A3D4 @ =gNonGameplayRam
	ldrb r0, [r0, #7]
	cmp r0, #0x15
	bls _0807A3C8
	bl _0807AE42
_0807A3C8:
	lsls r0, r0, #2
	ldr r1, _0807A3D8 @ =_0807A3DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807A3D4: .4byte gNonGameplayRam
_0807A3D8: .4byte _0807A3DC
_0807A3DC: @ jump table
	.4byte _0807A434 @ case 0
	.4byte _0807A468 @ case 1
	.4byte _0807A51A @ case 2
	.4byte _0807A6C0 @ case 3
	.4byte _0807A700 @ case 4
	.4byte _0807A718 @ case 5
	.4byte _0807A76C @ case 6
	.4byte _0807A79E @ case 7
	.4byte _0807A7B0 @ case 8
	.4byte _0807A890 @ case 9
	.4byte _0807A938 @ case 10
	.4byte _0807AA2A @ case 11
	.4byte _0807AA48 @ case 12
	.4byte _0807AA84 @ case 13
	.4byte _0807AAE0 @ case 14
	.4byte _0807AB14 @ case 15
	.4byte _0807AB40 @ case 16
	.4byte _0807ABB4 @ case 17
	.4byte _0807AC28 @ case 18
	.4byte _0807ACAE @ case 19
	.4byte _0807AD6C @ case 20
	.4byte _0807ADE8 @ case 21
_0807A434:
	ldr r4, _0807A454 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r4, #6]
	bl NavigationConversationSetupOam
	ldr r1, _0807A458 @ =0x00000221
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A45C
	movs r0, #4
	strb r0, [r4, #0x1c]
	movs r0, #0x11
	strb r0, [r4, #7]
	bl _0807AE42
	.align 2, 0
_0807A454: .4byte gNonGameplayRam
_0807A458: .4byte 0x00000221
_0807A45C:
	strb r0, [r4, #0x1c]
	ldrb r0, [r4, #7]
	adds r0, #1
	strb r0, [r4, #7]
	bl _0807AE42
_0807A468:
	ldr r1, _0807A4D4 @ =gNonGameplayRam
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r3, r1, r2
	ldrh r2, [r3]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r5, #0
	orrs r0, r2
	strh r0, [r3]
	movs r2, #1
	strb r2, [r1, #9]
	strb r2, [r1, #0xb]
	movs r0, #8
	strb r0, [r1, #0x1d]
	strb r5, [r1, #0x1e]
	strb r5, [r1, #0x1f]
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	subs r0, #1
	lsls r3, r0, #1
	ldr r4, _0807A4D8 @ =0x00000221
	adds r0, r1, r4
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	beq _0807A4A6
	adds r3, #1
_0807A4A6:
	ldr r1, _0807A4DC @ =0x0879C0F0
	ldr r0, _0807A4E0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r0]
	ldr r0, _0807A4E4 @ =0x0000E201
	cmp r3, r0
	bne _0807A4E8
	ldrh r0, [r4, #4]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #4]
	strb r2, [r4, #0x18]
	strb r1, [r4, #0x19]
	strb r2, [r4, #0x17]
	b _0807A512
	.align 2, 0
_0807A4D4: .4byte gNonGameplayRam
_0807A4D8: .4byte 0x00000221
_0807A4DC: .4byte 0x0879C0F0
_0807A4E0: .4byte 0x03000011
_0807A4E4: .4byte 0x0000E201
_0807A4E8:
	ldr r0, _0807A500 @ =0x0000E202
	cmp r3, r0
	bne _0807A504
	ldrh r0, [r4, #4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4, #4]
	strb r2, [r4, #0x18]
	movs r0, #2
	strb r0, [r4, #0x19]
	strb r0, [r4, #0x17]
	b _0807A512
	.align 2, 0
_0807A500: .4byte 0x0000E202
_0807A504:
	ldrh r0, [r4, #4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r4, #4]
	strb r5, [r4, #0x18]
	strb r1, [r4, #0x19]
	strb r5, [r4, #0x17]
_0807A512:
	ldrb r0, [r4, #7]
	adds r0, #1
	movs r1, #0
	b _0807AC3E
_0807A51A:
	ldr r1, _0807A584 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0x1b]
	ldrb r0, [r1, #0x1c]
	adds r4, r1, #0
	cmp r0, #1
	bne _0807A5B8
	ldr r0, _0807A588 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	beq _0807A590
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807A59C
	ldr r1, _0807A58C @ =0x00000241
	adds r0, r4, r1
	ldrb r5, [r0]
	cmp r5, #0
	bne _0807A590
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r5, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r5, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r5, [r0]
	movs r0, #0
	bl ClearTextGraphics
	movs r0, #3
	strb r0, [r4, #7]
	strb r5, [r4, #6]
	bl _0807AE42
	.align 2, 0
_0807A584: .4byte gNonGameplayRam
_0807A588: .4byte gChangedInput
_0807A58C: .4byte 0x00000241
_0807A590:
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807A5F2
_0807A59C:
	ldrh r1, [r4, #4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807A5AE
	bl _0807AE42
_0807A5AE:
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #4]
	bl _0807AE42
_0807A5B8:
	cmp r0, #2
	bne _0807A5E6
	ldrh r1, [r4, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0807A5F2
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r2, r4, #0
	adds r2, #0x25
	movs r0, #1
	strb r0, [r2]
	strb r0, [r4, #0x1a]
	strb r1, [r4, #0x1b]
	movs r0, #8
	strb r0, [r4, #7]
	strb r1, [r4, #6]
	b _0807A5F2
_0807A5E6:
	cmp r0, #6
	bne _0807A5EE
	movs r7, #1
	b _0807A5F2
_0807A5EE:
	bl NavigationConversationProcessText
_0807A5F2:
	ldr r3, _0807A628 @ =gNonGameplayRam
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807A630
	movs r0, #0x74
	strh r0, [r1, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _0807A62C @ =0x085766E0
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	bl _0807AE42
	.align 2, 0
_0807A628: .4byte gNonGameplayRam
_0807A62C: .4byte 0x085766E0
_0807A630:
	movs r2, #0
	strh r2, [r1, #0x2e]
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	strh r2, [r0, #0x2c]
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r1, r3, #0
	adds r1, #0x12
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0xdf
	bls _0807A68C
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r4, _0807A684 @ =0x0000FF28
	adds r1, r2, r4
	ldrh r2, [r0, #0x2e]
	adds r1, r1, r2
	strh r1, [r0, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r2, _0807A688 @ =0x085766E0
	ldrb r0, [r3, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r0, #0x10
	ldrh r3, [r1, #0x2c]
	adds r0, r0, r3
	strh r0, [r1, #0x2c]
	bl _0807AE42
	.align 2, 0
_0807A684: .4byte 0x0000FF28
_0807A688: .4byte 0x085766E0
_0807A68C:
	ldrb r1, [r3, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r1, r2, #0
	adds r1, #8
	ldrh r4, [r0, #0x2e]
	adds r1, r1, r4
	strh r1, [r0, #0x2e]
	ldrb r0, [r3, #0x19]
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r0, _0807A6BC @ =0x085766E0
	ldrb r1, [r3, #0x18]
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r0, [r2, #0x2c]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r2, #0x2c]
	b _0807AE42
	.align 2, 0
_0807A6BC: .4byte 0x085766E0
_0807A6C0:
	ldr r1, _0807A6F4 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0x1b]
	movs r2, #0x88
	lsls r2, r2, #2
	adds r0, r1, r2
	ldr r2, _0807A6F8 @ =gPreviousNavigationConversation
	ldrb r0, [r0]
	ldrb r3, [r2]
	cmp r0, r3
	beq _0807A6E6
	strb r0, [r2]
	ldr r4, _0807A6FC @ =0x00000221
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807A6E6
	bl UpdateSubEventAfterNavigationConversation
_0807A6E6:
	ldr r0, _0807A6F4 @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r1, #1
	movs r2, #0
	strb r1, [r0, #7]
	strb r2, [r0, #6]
	b _0807AE42
	.align 2, 0
_0807A6F4: .4byte gNonGameplayRam
_0807A6F8: .4byte gPreviousNavigationConversation
_0807A6FC: .4byte 0x00000221
_0807A700:
	ldr r2, _0807A714 @ =gNonGameplayRam
	ldrb r0, [r2, #6]
	cmp r0, #8
	bhi _0807A70A
	b _0807AE42
_0807A70A:
	ldrb r0, [r2, #7]
	adds r0, #1
	movs r1, #0
	b _0807A798
	.align 2, 0
_0807A714: .4byte gNonGameplayRam
_0807A718:
	ldr r3, _0807A768 @ =gNonGameplayRam
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	eors r0, r1
	strh r0, [r2]
	ldrh r1, [r3, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807A73C
	movs r0, #0x40
	eors r0, r1
	strh r0, [r3, #4]
_0807A73C:
	ldrh r1, [r3, #4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807A74C
	movs r0, #8
	eors r0, r1
	strh r0, [r3, #4]
_0807A74C:
	ldrh r1, [r3, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807A75C
	movs r0, #0x10
	eors r0, r1
	strh r0, [r3, #4]
_0807A75C:
	ldrb r0, [r3, #7]
	adds r0, #1
	strb r0, [r3, #7]
	movs r0, #0
	strb r0, [r3, #6]
	b _0807AE42
	.align 2, 0
_0807A768: .4byte gNonGameplayRam
_0807A76C:
	ldr r2, _0807A790 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0807A78C
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0807A78C
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0807A794
_0807A78C:
	movs r0, #0
	b _0807AE44
	.align 2, 0
_0807A790: .4byte gNonGameplayRam
_0807A794:
	ldrb r0, [r2, #7]
	adds r0, #1
_0807A798:
	strb r0, [r2, #7]
	strb r1, [r2, #6]
	b _0807AE42
_0807A79E:
	movs r7, #1
	ldr r1, _0807A7AC @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #7]
	strb r0, [r1, #6]
	b _0807AE42
	.align 2, 0
_0807A7AC: .4byte gNonGameplayRam
_0807A7B0:
	ldr r5, _0807A818 @ =gNonGameplayRam
	adds r6, r5, #0
	adds r6, #0x24
	ldrb r4, [r6]
	cmp r4, #0
	bne _0807A824
	ldr r0, _0807A81C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x83
	ands r0, r1
	cmp r0, #0
	bne _0807A7CA
	b _0807AE42
_0807A7CA:
	ldr r0, _0807A820 @ =0x00000203
	bl SoundPlay
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r4, [r0]
	movs r0, #1
	bl ClearTextGraphics
	movs r0, #1
	strb r0, [r6]
	movs r0, #3
	strb r0, [r5, #0x1c]
	adds r0, r5, #0
	adds r0, #0x20
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	strh r4, [r5, #0x22]
	b _0807AE42
	.align 2, 0
_0807A818: .4byte gNonGameplayRam
_0807A81C: .4byte gChangedInput
_0807A820: .4byte 0x00000203
_0807A824:
	cmp r4, #2
	bne _0807A832
	movs r1, #0
	movs r0, #9
	strb r0, [r5, #7]
	strb r1, [r5, #6]
	b _0807AE42
_0807A832:
	movs r0, #0
	bl unk_7a0fc
	cmp r0, #0
	bne _0807A83E
	b _0807AE42
_0807A83E:
	movs r3, #0
	movs r2, #2
	strb r2, [r6]
	movs r0, #1
	strb r0, [r5, #0x1a]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x36
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r3, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	movs r1, #0x34
	strh r1, [r0, #0x2e]
	b _0807AE42
_0807A890:
	movs r3, #0
	ldr r2, _0807A8C8 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r5, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldr r0, _0807A8CC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0807A8D0
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	movs r2, #1
	eors r0, r2
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r3, r1, #0x1f
	strb r2, [r5]
	b _0807A8F8
	.align 2, 0
_0807A8C8: .4byte gNonGameplayRam
_0807A8CC: .4byte gChangedInput
_0807A8D0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807A8E8
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807A8E4
	movs r3, #1
_0807A8E4:
	strb r5, [r1]
	b _0807A8F8
_0807A8E8:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807A8F8
	movs r3, #2
	movs r0, #0xa
	strb r0, [r4, #7]
	strb r5, [r4, #6]
_0807A8F8:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A910
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x34
	b _0807A91C
_0807A910:
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x84
_0807A91C:
	strh r0, [r1, #0x2e]
	cmp r3, #1
	bne _0807A924
	b _0807AD3E
_0807A924:
	cmp r3, #2
	beq _0807A92A
	b _0807AE42
_0807A92A:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A936
	b _0807AD56
_0807A936:
	b _0807AD60
_0807A938:
	ldr r2, _0807A994 @ =gNonGameplayRam
	ldrh r1, [r2, #4]
	movs r0, #0xc0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0807AA18
	movs r0, #0x10
	strb r0, [r4, #7]
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r2, [r0]
	cmp r2, #0
	bne _0807A9DA
	ldr r0, _0807A998 @ =0x03000031
	ldrb r1, [r0]
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	ldr r0, _0807A99C @ =0x03000032
	ldrb r1, [r0]
	adds r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	ldr r1, _0807A9A0 @ =0x00000212
	adds r0, r4, r1
	ldr r1, _0807A9A4 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0807A9A8
	movs r0, #0xb
	strb r0, [r4, #7]
	subs r3, #0x5b
	adds r0, r4, r3
	strb r2, [r0]
	movs r1, #0xda
	lsls r1, r1, #1
	adds r0, r4, r1
	strb r2, [r0]
	subs r3, #1
	adds r0, r4, r3
	strb r2, [r0]
	b _0807A9B8
	.align 2, 0
_0807A994: .4byte gNonGameplayRam
_0807A998: .4byte 0x03000031
_0807A99C: .4byte 0x03000032
_0807A9A0: .4byte 0x00000212
_0807A9A4: .4byte gCurrentArea
_0807A9A8:
	movs r1, #0xd5
	lsls r1, r1, #1
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807A9B8
	movs r0, #0xf
	strb r0, [r4, #7]
_0807A9B8:
	movs r2, #0xd5
	lsls r2, r2, #1
	adds r0, r4, r2
	movs r1, #0
	strb r1, [r0]
	movs r3, #0xd4
	lsls r3, r3, #1
	adds r0, r4, r3
	strb r1, [r0]
	subs r2, #1
	adds r0, r4, r2
	strb r1, [r0]
	movs r2, #0
	strh r1, [r4, #0xc]
	adds r3, #0x71
	adds r0, r4, r3
	strb r2, [r0]
_0807A9DA:
	movs r0, #1
	bl ClearTextGraphics
	ldr r2, _0807AA14 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x36
	movs r3, #0
	strb r3, [r0]
	movs r0, #1
	strb r0, [r2, #0x1a]
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x12
	adds r0, r0, r1
	movs r4, #0
	strh r3, [r0]
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	subs r1, #4
	adds r0, r0, r1
	strh r3, [r0]
	strb r4, [r2, #0x1c]
	b _0807AE40
	.align 2, 0
_0807AA14: .4byte gNonGameplayRam
_0807AA18:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0807AA22
	b _0807AE42
_0807AA22:
	movs r0, #0x40
	eors r0, r1
	strh r0, [r4, #4]
	b _0807AE42
_0807AA2A:
	ldr r1, _0807AA44 @ =gNonGameplayRam
	movs r0, #0x94
	lsls r0, r0, #2
	adds r4, r1, r0
	ldrb r2, [r4]
	movs r0, #1
	movs r3, #0
	orrs r0, r2
	strb r0, [r4]
	strb r3, [r1, #6]
	movs r0, #0xc
	strb r0, [r1, #7]
	b _0807AE42
	.align 2, 0
_0807AA44: .4byte gNonGameplayRam
_0807AA48:
	ldr r5, _0807AA78 @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807AA5C
	b _0807AE42
_0807AA5C:
	ldr r0, _0807AA7C @ =gCurrentArea
	ldrb r1, [r0]
	ldr r2, _0807AA80 @ =0x00000212
	adds r0, r5, r2
	movs r4, #0
	strb r1, [r0]
	movs r0, #1
	bl unk_75988
	strb r4, [r5, #6]
	movs r0, #0xd
	strb r0, [r5, #7]
	b _0807AE42
	.align 2, 0
_0807AA78: .4byte gNonGameplayRam
_0807AA7C: .4byte gCurrentArea
_0807AA80: .4byte 0x00000212
_0807AA84:
	ldr r6, _0807AAC8 @ =gNonGameplayRam
	ldrb r0, [r6, #6]
	cmp r0, #4
	bhi _0807AA8E
	b _0807AE42
_0807AA8E:
	ldr r3, _0807AACC @ =0x00000212
	adds r4, r6, r3
	ldrb r0, [r4]
	ldr r5, _0807AAD0 @ =0x02034000
	adds r1, r5, #0
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _0807AAD4 @ =0x040000D4
	str r5, [r1]
	ldr r0, _0807AAD8 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _0807AADC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r1, #0
	movs r0, #0xe
	strb r0, [r6, #7]
	strb r1, [r6, #6]
	movs r4, #0x94
	lsls r4, r4, #2
	adds r2, r6, r4
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	b _0807AE42
	.align 2, 0
_0807AAC8: .4byte gNonGameplayRam
_0807AACC: .4byte 0x00000212
_0807AAD0: .4byte 0x02034000
_0807AAD4: .4byte 0x040000D4
_0807AAD8: .4byte 0x0600E000
_0807AADC: .4byte 0x80000400
_0807AAE0:
	ldr r2, _0807AB10 @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	cmp r1, #0
	beq _0807AAF0
	b _0807AE42
_0807AAF0:
	movs r4, #0xdb
	lsls r4, r4, #1
	adds r3, r2, r4
	movs r0, #1
	strb r0, [r3]
	movs r3, #0xda
	lsls r3, r3, #1
	adds r0, r2, r3
	strb r1, [r0]
	subs r4, #1
	adds r0, r2, r4
	strb r1, [r0]
	strb r1, [r2, #6]
	movs r0, #0x10
	strb r0, [r2, #7]
	b _0807AE42
	.align 2, 0
_0807AB10: .4byte gNonGameplayRam
_0807AB14:
	ldr r4, _0807AB38 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	ldr r2, _0807AB3C @ =0x00000211
	adds r1, r4, r2
	ldrb r1, [r1]
	bl NavigationConversationScrollMapToDestination
	cmp r0, #0
	bne _0807AB2E
	b _0807AE42
_0807AB2E:
	movs r0, #0
	strb r0, [r4, #6]
	movs r0, #0x10
	strb r0, [r4, #7]
	b _0807AE42
	.align 2, 0
_0807AB38: .4byte gNonGameplayRam
_0807AB3C: .4byte 0x00000211
_0807AB40:
	ldr r4, _0807ABAC @ =gNonGameplayRam
	ldrb r0, [r4, #6]
	cmp r0, #0x10
	bhi _0807AB4A
	b _0807AE42
_0807AB4A:
	movs r0, #0
	bl NavigationConversationUpdateTarget
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r3, #0
	movs r1, #8
	strh r1, [r0, #0x2e]
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	ldr r2, _0807ABB0 @ =0x085766E0
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r3, [r0]
	movs r0, #1
	strb r0, [r4, #7]
	strb r3, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807ABAC: .4byte gNonGameplayRam
_0807ABB0: .4byte 0x085766E0
_0807ABB4:
	ldr r5, _0807AC24 @ =gNonGameplayRam
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r1, r5, r3
	ldrh r3, [r1]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	movs r2, #0
	movs r4, #0
	orrs r0, r3
	strh r0, [r1]
	movs r0, #8
	strb r0, [r5, #0x1d]
	strb r2, [r5, #0x1e]
	strb r2, [r5, #0x1f]
	ldrh r0, [r5, #4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r5, #4]
	strb r2, [r5, #0x18]
	strb r1, [r5, #0x19]
	strb r2, [r5, #0x17]
	adds r0, r5, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, #0x1e
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x34
	strb r2, [r0]
	ldrb r1, [r5, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, #0x35
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strh r4, [r5, #0x22]
	movs r0, #5
	strb r0, [r5, #0x1c]
	ldrb r0, [r5, #7]
	adds r0, #1
	strb r0, [r5, #7]
	strb r2, [r5, #6]
	b _0807AE42
	.align 2, 0
_0807AC24: .4byte gNonGameplayRam
_0807AC28:
	ldr r4, _0807AC44 @ =gNonGameplayRam
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0
	bne _0807AC36
	b _0807AE42
_0807AC36:
	cmp r0, #2
	bne _0807AC48
	movs r1, #0
	movs r0, #0x13
_0807AC3E:
	strb r0, [r4, #7]
	strb r1, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807AC44: .4byte gNonGameplayRam
_0807AC48:
	movs r0, #1
	bl unk_7a0fc
	cmp r0, #0
	bne _0807AC54
	b _0807AE42
_0807AC54:
	movs r3, #0
	movs r2, #2
	strb r2, [r5]
	movs r0, #1
	strb r0, [r4, #0x1a]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r2, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x34
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x35
	strb r3, [r0]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r2, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	movs r1, #0x84
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	b _0807AE42
_0807ACAE:
	movs r3, #0
	ldr r2, _0807ACE4 @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r5, #0
	movs r1, #0x8c
	strh r1, [r0, #0x2c]
	ldr r0, _0807ACE8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0807ACEC
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	movs r2, #1
	eors r0, r2
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r3, r1, #0x1f
	strb r2, [r5]
	b _0807AD14
	.align 2, 0
_0807ACE4: .4byte gNonGameplayRam
_0807ACE8: .4byte gChangedInput
_0807ACEC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807AD04
	adds r1, r4, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807AD00
	movs r3, #1
_0807AD00:
	strb r5, [r1]
	b _0807AD14
_0807AD04:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807AD14
	movs r3, #2
	movs r0, #0x14
	strb r0, [r4, #7]
	strb r5, [r4, #6]
_0807AD14:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807AD2C
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x34
	b _0807AD38
_0807AD2C:
	ldrb r0, [r4, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #0x84
_0807AD38:
	strh r0, [r1, #0x2e]
	cmp r3, #1
	bne _0807AD48
_0807AD3E:
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
	b _0807AE42
_0807AD48:
	cmp r3, #2
	bne _0807AE42
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807AD60
_0807AD56:
	movs r0, #0x81
	lsls r0, r0, #2
	bl SoundPlay
	b _0807AE42
_0807AD60:
	ldr r0, _0807AD68 @ =0x00000205
	bl SoundPlay
	b _0807AE42
	.align 2, 0
_0807AD68: .4byte 0x00000205
_0807AD6C:
	ldr r4, _0807ADDC @ =gNonGameplayRam
	movs r5, #0
	movs r0, #0x15
	strb r0, [r4, #7]
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807ADA4
	ldr r1, _0807ADE0 @ =gPreviousNavigationConversation
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0xd5
	lsls r1, r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r4, r2
	strb r5, [r0]
	ldr r3, _0807ADE4 @ =0x000001A9
	adds r0, r4, r3
	strb r5, [r0]
	movs r1, #0
	strh r5, [r4, #0xc]
	adds r2, #0x71
	adds r0, r4, r2
	strb r1, [r0]
_0807ADA4:
	movs r0, #1
	bl ClearTextGraphics
	ldrb r1, [r4, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, #0x36
	strb r5, [r0]
	movs r0, #1
	strb r0, [r4, #0x1a]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	adds r1, r4, #0
	adds r1, #0x12
	adds r0, r0, r1
	movs r2, #0
	strh r5, [r0]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #1
	subs r1, #4
	adds r0, r0, r1
	strh r5, [r0]
	strb r2, [r4, #0x1c]
	strb r2, [r4, #6]
	b _0807AE42
	.align 2, 0
_0807ADDC: .4byte gNonGameplayRam
_0807ADE0: .4byte gPreviousNavigationConversation
_0807ADE4: .4byte 0x000001A9
_0807ADE8:
	ldr r2, _0807AE4C @ =gNonGameplayRam
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r4, #0
	movs r1, #8
	strh r1, [r0, #0x2e]
	ldrb r0, [r2, #0x19]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r3, _0807AE50 @ =0x085766E0
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrb r0, [r0]
	strh r0, [r1, #0x2c]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x36
	movs r1, #0xb
	strb r1, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x34
	strb r4, [r0]
	ldrb r1, [r2, #0x19]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x35
	strb r4, [r0]
	movs r0, #1
	strb r0, [r2, #7]
_0807AE40:
	strb r4, [r2, #6]
_0807AE42:
	adds r0, r7, #0
_0807AE44:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807AE4C: .4byte gNonGameplayRam
_0807AE50: .4byte 0x085766E0

	thumb_func_start NavigationConversationSetupOam
NavigationConversationSetupOam: @ 0x0807AE54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r6, _0807AF60 @ =gNonGameplayRam
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #0
	mov sb, r0
	movs r2, #0
	mov sl, r2
	movs r0, #0x7c
	strh r0, [r1]
	subs r1, #2
	movs r0, #0xcc
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x4b
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	mov r3, sb
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	movs r0, #1
	bl PauseScreenSetNavigationTextPanelOam
	movs r4, #0x73
	adds r4, r4, r6
	mov r8, r4
	ldrb r1, [r4]
	movs r2, #0xd
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r5, #4
	orrs r0, r5
	strb r0, [r4]
	movs r0, #0x43
	adds r0, r0, r6
	mov ip, r0
	ldrb r1, [r0]
	movs r7, #4
	rsbs r7, r7, #0
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	mov r1, ip
	strb r0, [r1]
	movs r3, #0x5b
	adds r3, r3, r6
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	movs r4, #0x67
	adds r4, r4, r6
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r4]
	movs r5, #0x85
	lsls r5, r5, #2
	adds r1, r6, r5
	ldr r0, _0807AF64 @ =0x085766D4
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	mov r0, sb
	strb r0, [r6, #0x1a]
	mov r1, sl
	strh r1, [r6, #4]
	adds r5, r6, #0
	adds r5, #0xa3
	ldrb r0, [r5]
	adds r4, r2, #0
	ands r4, r0
	movs r3, #4
	orrs r4, r3
	strb r4, [r5]
	adds r3, r6, #0
	adds r3, #0x4f
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	adds r3, #0x48
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	subs r3, #0xc
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	subs r3, #0xc
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	ands r0, r2
	strb r0, [r3]
	adds r0, r6, #0
	adds r0, #0x82
	movs r2, #0xd4
	strh r2, [r0]
	subs r0, #2
	movs r1, #0x44
	strh r1, [r0]
	subs r0, #0xa
	strh r2, [r0]
	subs r0, #2
	strh r1, [r0]
	ldrb r0, [r6]
	cmp r0, #0
	beq _0807AF68
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r7, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	mov r2, r8
	strb r1, [r2]
	ands r4, r7
	orrs r4, r0
	strb r4, [r5]
	b _0807AF7C
	.align 2, 0
_0807AF60: .4byte gNonGameplayRam
_0807AF64: .4byte 0x085766D4
_0807AF68:
	ands r4, r7
	movs r2, #2
	orrs r4, r2
	strb r4, [r5]
	mov r3, r8
	ldrb r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
_0807AF7C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavigationConversationUpdateTarget
NavigationConversationUpdateTarget: @ 0x0807AF8C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl NavigationConverstionFindTarget
	cmp r0, #0
	beq _0807AFF2
	cmp r4, #0
	beq _0807AFF2
	ldr r1, _0807AFCC @ =gNonGameplayRam
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0807AFD0 @ =0x000001A9
	adds r0, r1, r3
	strb r2, [r0]
	ldr r2, _0807AFD4 @ =0x0000020F
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #1
	bne _0807AFDC
	ldr r1, _0807AFD8 @ =0x085767EC
	adds r3, #0x6a
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	b _0807AFEA
	.align 2, 0
_0807AFCC: .4byte gNonGameplayRam
_0807AFD0: .4byte 0x000001A9
_0807AFD4: .4byte 0x0000020F
_0807AFD8: .4byte 0x085767EC
_0807AFDC:
	ldr r1, _0807AFF8 @ =0x00000212
	adds r0, r2, r1
	ldrb r0, [r0]
	movs r1, #0xe
	cmp r0, #0
	bne _0807AFEA
	movs r1, #0xf
_0807AFEA:
	movs r3, #0xd5
	lsls r3, r3, #1
	adds r0, r2, r3
	strb r1, [r0]
_0807AFF2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807AFF8: .4byte 0x00000212

	thumb_func_start NavigationConverstionFindTarget
NavigationConverstionFindTarget: @ 0x0807AFFC
	push {r4, r5, r6, r7, lr}
	ldr r2, _0807B03C @ =gNonGameplayRam
	ldr r1, _0807B040 @ =0x0000020F
	adds r0, r2, r1
	movs r3, #0
	strb r3, [r0]
	movs r0, #0x83
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807B044 @ =0x0000020D
	adds r1, r2, r0
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	ldr r1, _0807B048 @ =0x0000020E
	adds r0, r2, r1
	strb r3, [r0]
	adds r1, #5
	adds r0, r2, r1
	strb r3, [r0]
	ldr r0, _0807B04C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r5, r2, #0
	cmp r0, #4
	bne _0807B060
_0807B036:
	movs r0, #0
	b _0807B146
	.align 2, 0
_0807B03C: .4byte gNonGameplayRam
_0807B040: .4byte 0x0000020F
_0807B044: .4byte 0x0000020D
_0807B048: .4byte 0x0000020E
_0807B04C: .4byte gPauseScreenFlag
_0807B050:
	movs r4, #1
	ldrb r1, [r1, #4]
	ldr r3, _0807B05C @ =0x00000213
	adds r0, r5, r3
	strb r1, [r0]
	b _0807B086
	.align 2, 0
_0807B05C: .4byte 0x00000213
_0807B060:
	ldr r0, _0807B0B8 @ =0x0300004C
	strb r3, [r0]
	movs r4, #0
	movs r2, #0
	adds r7, r0, #0
	ldr r6, _0807B0BC @ =0x085766E4
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrb r3, [r0]
	adds r1, r6, #0
_0807B076:
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r3, r0
	beq _0807B050
	adds r1, #8
	adds r2, #1
	cmp r2, #0x20
	bls _0807B076
_0807B086:
	cmp r4, #0
	beq _0807B036
	lsls r0, r2, #3
	adds r2, r0, r6
	ldrb r0, [r2, #1]
	strb r0, [r7]
	ldr r1, _0807B0C0 @ =0x08576066
	ldrb r0, [r7]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r3, _0807B0C4 @ =0x0000020E
	adds r6, r5, r3
	strb r0, [r6]
	ldr r1, _0807B0C8 @ =0x00000212
	adds r3, r5, r1
	ldrb r1, [r3]
	adds r4, r0, #0
	cmp r1, r4
	bne _0807B0D0
	ldrb r3, [r2, #2]
	ldrb r2, [r2, #3]
	ldr r0, _0807B0CC @ =0x0000020F
	adds r1, r5, r0
	movs r0, #1
	b _0807B11E
	.align 2, 0
_0807B0B8: .4byte 0x0300004C
_0807B0BC: .4byte 0x085766E4
_0807B0C0: .4byte 0x08576066
_0807B0C4: .4byte 0x0000020E
_0807B0C8: .4byte 0x00000212
_0807B0CC: .4byte 0x0000020F
_0807B0D0:
	cmp r1, #0
	bne _0807B0F4
	ldr r2, _0807B0EC @ =0x08576218
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r3, [r1]
	adds r2, #1
	adds r0, r0, r2
	ldrb r2, [r0]
	ldr r0, _0807B0F0 @ =0x0000020F
	adds r1, r5, r0
	movs r0, #2
	b _0807B11E
	.align 2, 0
_0807B0EC: .4byte 0x08576218
_0807B0F0: .4byte 0x0000020F
_0807B0F4:
	ldr r0, _0807B110 @ =0x08576226
	ldrb r1, [r3]
	lsls r1, r1, #1
	adds r2, r1, r0
	ldrb r3, [r2]
	adds r0, #1
	adds r1, r1, r0
	ldrb r2, [r1]
	cmp r4, #0
	bne _0807B118
	ldr r0, _0807B114 @ =0x0000020F
	adds r1, r5, r0
	movs r0, #2
	b _0807B11E
	.align 2, 0
_0807B110: .4byte 0x08576226
_0807B114: .4byte 0x0000020F
_0807B118:
	ldr r0, _0807B14C @ =0x0000020F
	adds r1, r5, r0
	movs r0, #3
_0807B11E:
	strb r0, [r1]
	subs r1, r3, #1
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r5, r3
	strb r1, [r0]
	subs r1, r2, #1
	ldr r2, _0807B150 @ =0x0000020D
	adds r0, r5, r2
	strb r1, [r0]
	movs r4, #0
	ldr r0, _0807B154 @ =gPreviousNavigationConversation
	adds r3, #0x14
	adds r1, r5, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _0807B144
	movs r4, #1
_0807B144:
	adds r0, r4, #0
_0807B146:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807B14C: .4byte 0x0000020F
_0807B150: .4byte 0x0000020D
_0807B154: .4byte gPreviousNavigationConversation

	thumb_func_start NavigationConversionScrollToTarget
NavigationConversionScrollToTarget: @ 0x0807B158
	push {r4, r5, r6, r7, lr}
	ldr r1, _0807B178 @ =gNonGameplayRam
	ldrb r0, [r1, #8]
	adds r0, #1
	strb r0, [r1, #8]
	ldrb r0, [r1, #9]
	adds r7, r1, #0
	cmp r0, #0xd
	bls _0807B16C
	b _0807B4BC
_0807B16C:
	lsls r0, r0, #2
	ldr r1, _0807B17C @ =_0807B180
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B178: .4byte gNonGameplayRam
_0807B17C: .4byte _0807B180
_0807B180: @ jump table
	.4byte _0807B4BC @ case 0
	.4byte _0807B1B8 @ case 1
	.4byte _0807B226 @ case 2
	.4byte _0807B236 @ case 3
	.4byte _0807B46C @ case 4
	.4byte _0807B23E @ case 5
	.4byte _0807B300 @ case 6
	.4byte _0807B30A @ case 7
	.4byte _0807B32A @ case 8
	.4byte _0807B400 @ case 9
	.4byte _0807B420 @ case 10
	.4byte _0807B46C @ case 11
	.4byte _0807B488 @ case 12
	.4byte _0807B4BC @ case 13
_0807B1B8:
	movs r2, #0
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0807B200
	ldr r3, _0807B204 @ =0x0000020D
	adds r0, r7, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0807B200
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r7, r4
	ldr r1, _0807B208 @ =0x085767EC
	ldrb r0, [r0]
	ldrb r3, [r1]
	cmp r0, r3
	beq _0807B200
	ldrb r4, [r1, #1]
	cmp r0, r4
	beq _0807B200
	ldrb r3, [r1, #2]
	cmp r0, r3
	beq _0807B200
	ldrb r1, [r1, #3]
	cmp r0, r1
	beq _0807B200
	cmp r0, #0xe
	beq _0807B200
	cmp r0, #0xf
	bne _0807B1FC
	movs r2, #1
_0807B1FC:
	cmp r2, #0
	beq _0807B20C
_0807B200:
	movs r0, #0xc
	b _0807B4BA
	.align 2, 0
_0807B204: .4byte 0x0000020D
_0807B208: .4byte 0x085767EC
_0807B20C:
	movs r0, #2
	strb r0, [r7, #9]
	ldrh r1, [r7, #4]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	orrs r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #4]
	b _0807B4BC
_0807B226:
	ldrh r1, [r7, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0807B234
	b _0807B4BC
_0807B234:
	b _0807B4B2
_0807B236:
	movs r0, #0
	strb r0, [r7, #8]
	movs r0, #4
	b _0807B4BA
_0807B23E:
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrb r0, [r0]
	ldr r4, _0807B270 @ =0x0000020D
	adds r1, r7, r4
	ldrb r1, [r1]
	bl NavigationConversationScrollMapToDestination
	cmp r0, #0
	bne _0807B256
	b _0807B4BC
_0807B256:
	ldr r1, _0807B274 @ =0x0000020F
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807B280
	ldr r1, _0807B278 @ =0x085767EC
	ldr r2, _0807B27C @ =0x00000213
	adds r0, r7, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r2, [r0]
	b _0807B28E
	.align 2, 0
_0807B270: .4byte 0x0000020D
_0807B274: .4byte 0x0000020F
_0807B278: .4byte 0x085767EC
_0807B27C: .4byte 0x00000213
_0807B280:
	ldr r3, _0807B2B8 @ =0x00000212
	adds r0, r7, r3
	ldrb r0, [r0]
	movs r2, #0xe
	cmp r0, #0
	bne _0807B28E
	movs r2, #0xf
_0807B28E:
	ldr r5, _0807B2BC @ =gNonGameplayRam
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r5, r4
	movs r1, #0
	strb r2, [r0]
	movs r2, #0xd4
	lsls r2, r2, #1
	adds r0, r5, r2
	strb r1, [r0]
	ldr r3, _0807B2C0 @ =0x000001A9
	adds r0, r5, r3
	strb r1, [r0]
	strb r1, [r5, #8]
	adds r4, #0x65
	adds r0, r5, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807B2C4
	movs r0, #0xc
	b _0807B2C6
	.align 2, 0
_0807B2B8: .4byte 0x00000212
_0807B2BC: .4byte gNonGameplayRam
_0807B2C0: .4byte 0x000001A9
_0807B2C4:
	movs r0, #6
_0807B2C6:
	strb r0, [r5, #9]
	ldr r0, _0807B2F0 @ =0x00000119
	bl SoundStop
	ldr r1, _0807B2F4 @ =gNonGameplayRam
	movs r2, #0x83
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r2, [r0]
	movs r3, #0x96
	lsls r3, r3, #2
	adds r0, r1, r3
	strb r2, [r0]
	ldr r4, _0807B2F8 @ =0x0000020D
	adds r0, r1, r4
	ldrb r0, [r0]
	ldr r2, _0807B2FC @ =0x00000259
	adds r1, r1, r2
	strb r0, [r1]
	b _0807B4BC
	.align 2, 0
_0807B2F0: .4byte 0x00000119
_0807B2F4: .4byte gNonGameplayRam
_0807B2F8: .4byte 0x0000020D
_0807B2FC: .4byte 0x00000259
_0807B300:
	ldrb r0, [r7, #8]
	cmp r0, #0x3c
	bhi _0807B308
	b _0807B4BC
_0807B308:
	b _0807B4B2
_0807B30A:
	movs r3, #0x94
	lsls r3, r3, #2
	adds r2, r7, r3
	movs r1, #0
	movs r0, #1
	strb r0, [r2]
	movs r4, #0xd5
	lsls r4, r4, #1
	adds r0, r7, r4
	strb r1, [r0]
	movs r2, #0xdb
	lsls r2, r2, #1
	adds r0, r7, r2
	strb r1, [r0]
	strb r1, [r7, #8]
	b _0807B4B6
_0807B32A:
	movs r3, #0x94
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0807B33C
	b _0807B4BC
_0807B33C:
	ldr r4, _0807B36C @ =0x0000020F
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807B34E
	ldr r0, _0807B370 @ =0x0000020E
	adds r1, r7, r0
	movs r0, #0
	strb r0, [r1]
_0807B34E:
	ldr r1, _0807B370 @ =0x0000020E
	adds r3, r7, r1
	ldrb r0, [r3]
	cmp r0, #0
	bne _0807B37C
	ldr r2, _0807B374 @ =0x08576218
	ldr r4, _0807B378 @ =0x00000212
	adds r3, r7, r4
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	subs r4, #2
	b _0807B38C
	.align 2, 0
_0807B36C: .4byte 0x0000020F
_0807B370: .4byte 0x0000020E
_0807B374: .4byte 0x08576218
_0807B378: .4byte 0x00000212
_0807B37C:
	ldr r2, _0807B3E0 @ =0x08576226
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	movs r4, #0x84
	lsls r4, r4, #2
_0807B38C:
	adds r1, r7, r4
	strb r0, [r1]
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r2, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	subs r0, #1
	ldr r2, _0807B3E4 @ =0x00000211
	adds r1, r7, r2
	strb r0, [r1]
	ldr r3, _0807B3E8 @ =0x0000020E
	adds r0, r7, r3
	ldrb r0, [r0]
	ldr r1, _0807B3EC @ =0x00000212
	adds r4, r7, r1
	movs r6, #0
	strb r0, [r4]
	ldrb r0, [r4]
	ldr r5, _0807B3F0 @ =0x02034000
	adds r1, r5, #0
	bl GetMinimapData
	ldrb r0, [r4]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _0807B3F4 @ =0x040000D4
	str r5, [r1]
	ldr r0, _0807B3F8 @ =0x0600E000
	str r0, [r1, #4]
	ldr r0, _0807B3FC @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	bl unk_75988
	movs r0, #0
	bl NavigationConversationUpdateTarget
	strb r6, [r7, #8]
	b _0807B4B6
	.align 2, 0
_0807B3E0: .4byte 0x08576226
_0807B3E4: .4byte 0x00000211
_0807B3E8: .4byte 0x0000020E
_0807B3EC: .4byte 0x00000212
_0807B3F0: .4byte 0x02034000
_0807B3F4: .4byte 0x040000D4
_0807B3F8: .4byte 0x0600E000
_0807B3FC: .4byte 0x80000400
_0807B400:
	ldrb r0, [r7, #8]
	cmp r0, #8
	bls _0807B4BC
	movs r0, #0
	strb r0, [r7, #8]
	ldrb r0, [r7, #9]
	adds r0, #1
	strb r0, [r7, #9]
	movs r3, #0x94
	lsls r3, r3, #2
	adds r2, r7, r3
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	b _0807B4BC
_0807B420:
	movs r4, #0x94
	lsls r4, r4, #2
	adds r0, r7, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807B4BC
	ldr r1, _0807B460 @ =0x0000020E
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807B442
	ldr r2, _0807B464 @ =0x00000212
	adds r0, r7, r2
	ldrb r0, [r0]
	movs r2, #0xf
	cmp r0, #0
	bne _0807B444
_0807B442:
	movs r2, #0xe
_0807B444:
	movs r3, #0xdb
	lsls r3, r3, #1
	adds r0, r7, r3
	movs r1, #0
	strb r2, [r0]
	movs r4, #0xda
	lsls r4, r4, #1
	adds r0, r7, r4
	strb r1, [r0]
	ldr r2, _0807B468 @ =0x000001B5
	adds r0, r7, r2
	strb r1, [r0]
	strb r1, [r7, #8]
	b _0807B4B6
	.align 2, 0
_0807B460: .4byte 0x0000020E
_0807B464: .4byte 0x00000212
_0807B468: .4byte 0x000001B5
_0807B46C:
	ldrb r0, [r7, #8]
	cmp r0, #0x1e
	bls _0807B4BC
	movs r0, #0
	strb r0, [r7, #8]
	movs r0, #5
	strb r0, [r7, #9]
	ldr r0, _0807B484 @ =0x00000119
	bl SoundPlay
	b _0807B4BC
	.align 2, 0
_0807B484: .4byte 0x00000119
_0807B488:
	adds r2, r7, #0
	ldrh r1, [r2, #4]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B49E
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r2, #4]
_0807B49E:
	ldrh r1, [r2, #4]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B4B2
	adds r0, r3, #0
	eors r0, r1
	strh r0, [r2, #4]
_0807B4B2:
	movs r0, #0
	strb r0, [r7, #8]
_0807B4B6:
	ldrb r0, [r7, #9]
	adds r0, #1
_0807B4BA:
	strb r0, [r7, #9]
_0807B4BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavigationConversationScrollMapToDestination
NavigationConversationScrollMapToDestination: @ 0x0807B4C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #1
	mov ip, r2
	movs r2, #0xf
	subs r2, r2, r0
	lsls r2, r2, #3
	movs r3, #0x80
	lsls r3, r3, #2
	subs r5, r3, r2
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r6, r3, r0
	ldr r1, _0807B520 @ =gBackgroundPositions
	ldrh r4, [r1, #0xc]
	subs r2, r4, r5
	ldrh r0, [r1, #0xe]
	subs r3, r0, r6
	cmp r2, #0
	bge _0807B4F6
	rsbs r2, r2, #0
_0807B4F6:
	cmp r3, #0
	bge _0807B4FC
	rsbs r3, r3, #0
_0807B4FC:
	asrs r0, r2, #4
	adds r7, r0, #1
	asrs r0, r3, #4
	adds r3, r0, #1
	subs r2, r4, r5
	cmp r2, #0
	beq _0807B534
	movs r0, #0
	mov ip, r0
	cmp r2, #0
	ble _0807B524
	subs r0, r4, r7
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0xc]
	cmp r0, r5
	bge _0807B534
	b _0807B532
	.align 2, 0
_0807B520: .4byte gBackgroundPositions
_0807B524:
	cmp r2, #0
	bge _0807B534
	adds r0, r4, r7
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #0xc]
	cmp r0, r5
	ble _0807B534
_0807B532:
	strh r5, [r1, #0xc]
_0807B534:
	adds r4, r1, #0
	ldrh r0, [r4, #0xe]
	subs r2, r0, r6
	cmp r2, #0
	beq _0807B564
	movs r5, #0
	mov ip, r5
	cmp r2, #0
	ble _0807B554
	subs r0, r0, r3
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xe]
	cmp r0, r6
	bge _0807B564
	strh r6, [r4, #0xe]
	b _0807B564
_0807B554:
	cmp r2, #0
	bge _0807B564
	adds r0, r0, r3
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xe]
	cmp r0, r6
	ble _0807B564
	strh r6, [r1, #0xe]
_0807B564:
	mov r0, ip
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start unk_7b56c
unk_7b56c: @ 0x0807B56C
	push {r4, r5, lr}
	ldr r1, _0807B588 @ =gNonGameplayRam
	ldrb r0, [r1, #0xa]
	adds r0, #1
	strb r0, [r1, #0xa]
	ldrb r0, [r1, #0xb]
	adds r5, r1, #0
	cmp r0, #9
	bhi _0807B668
	lsls r0, r0, #2
	ldr r1, _0807B58C @ =_0807B590
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B588: .4byte gNonGameplayRam
_0807B58C: .4byte _0807B590
_0807B590: @ jump table
	.4byte _0807B668 @ case 0
	.4byte _0807B5B8 @ case 1
	.4byte _0807B5BE @ case 2
	.4byte _0807B5CE @ case 3
	.4byte _0807B5EE @ case 4
	.4byte _0807B612 @ case 5
	.4byte _0807B624 @ case 6
	.4byte _0807B650 @ case 7
	.4byte _0807B668 @ case 8
	.4byte _0807B668 @ case 9
_0807B5B8:
	movs r0, #0
	strb r0, [r5, #0xa]
	b _0807B662
_0807B5BE:
	ldrh r1, [r5, #4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807B668
	movs r0, #0
	strb r0, [r5, #0xa]
	b _0807B662
_0807B5CE:
	adds r1, r5, #0
	adds r1, #0xea
	movs r4, #0
	movs r0, #0x41
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xe8
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r0, #0x8e
	lsls r0, r0, #1
	bl SoundPlay
	strb r4, [r5, #0xa]
	b _0807B662
_0807B5EE:
	ldrb r0, [r5, #0xa]
	cmp r0, #0x1e
	bls _0807B668
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	strb r2, [r5, #0xa]
	ldrb r0, [r5, #0xb]
	adds r0, #1
	strb r0, [r5, #0xb]
	ldrh r1, [r5, #4]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r5, #4]
	b _0807B668
_0807B612:
	ldrh r1, [r5, #4]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0807B668
	strb r0, [r5, #0xa]
	b _0807B662
_0807B624:
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r4, #0
	movs r0, #3
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0xea
	movs r0, #0x42
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xe8
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _0807B64C @ =0x0000011D
	bl SoundPlay
	strb r4, [r5, #0xa]
	b _0807B662
	.align 2, 0
_0807B64C: .4byte 0x0000011D
_0807B650:
	ldrb r0, [r5, #0xa]
	cmp r0, #0x1e
	bls _0807B668
	ldrh r1, [r5, #4]
	ldr r0, _0807B670 @ =0x0000FF7F
	ands r0, r1
	movs r1, #0
	strh r0, [r5, #4]
	strb r1, [r5, #0xa]
_0807B662:
	ldrb r0, [r5, #0xb]
	adds r0, #1
	strb r0, [r5, #0xb]
_0807B668:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B670: .4byte 0x0000FF7F

	thumb_func_start unk_7b674
unk_7b674: @ 0x0807B674
	push {r4, r5, lr}
	ldr r2, _0807B6AC @ =gNonGameplayRam
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0807B68C
	b _0807B8C4
_0807B68C:
	ldr r2, _0807B6B0 @ =0x00000252
	adds r0, r4, r2
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _0807B6B4 @ =0x00000251
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #8
	bls _0807B6A2
	b _0807B8C4
_0807B6A2:
	lsls r0, r0, #2
	ldr r1, _0807B6B8 @ =_0807B6BC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807B6AC: .4byte gNonGameplayRam
_0807B6B0: .4byte 0x00000252
_0807B6B4: .4byte 0x00000251
_0807B6B8: .4byte _0807B6BC
_0807B6BC: @ jump table
	.4byte _0807B6E0 @ case 0
	.4byte _0807B72C @ case 1
	.4byte _0807B82C @ case 2
	.4byte _0807B780 @ case 3
	.4byte _0807B7BC @ case 4
	.4byte _0807B7D4 @ case 5
	.4byte _0807B82C @ case 6
	.4byte _0807B858 @ case 7
	.4byte _0807B8B0 @ case 8
_0807B6E0:
	movs r2, #0x94
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0807B700
	ldr r1, _0807B6FC @ =0x00000251
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B710
	.align 2, 0
_0807B6FC: .4byte 0x00000251
_0807B700:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807B710
	ldr r2, _0807B720 @ =0x00000251
	adds r1, r4, r2
	movs r0, #4
	strb r0, [r1]
_0807B710:
	ldr r1, _0807B724 @ =gPreviousArea
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0807B728 @ =0x00000252
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	b _0807B8C4
	.align 2, 0
_0807B720: .4byte 0x00000251
_0807B724: .4byte gPreviousArea
_0807B728: .4byte 0x00000252
_0807B72C:
	ldr r1, _0807B770 @ =0x00000252
	adds r2, r4, r1
	ldrb r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0807B73C
	b _0807B8C4
_0807B73C:
	ldr r0, _0807B774 @ =gWrittenToMosaic_L
	ldrh r1, [r0]
	adds r1, #0x11
	strh r1, [r0]
	ldr r0, _0807B778 @ =0x08576802
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r0, [r0]
	cmp r1, r0
	beq _0807B752
	b _0807B8C4
_0807B752:
	movs r0, #0
	strb r0, [r2]
	ldr r2, _0807B77C @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	b _0807B8C4
	.align 2, 0
_0807B770: .4byte 0x00000252
_0807B774: .4byte gWrittenToMosaic_L
_0807B778: .4byte 0x08576802
_0807B77C: .4byte 0x00000251
_0807B780:
	ldr r0, _0807B7B0 @ =0x00000252
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0807B790
	b _0807B8C4
_0807B790:
	ldr r1, _0807B7B4 @ =gWrittenToMosaic_L
	ldrh r0, [r1]
	subs r0, #0x11
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0807B7A2
	b _0807B8C4
_0807B7A2:
	ldr r0, _0807B7B8 @ =0x00000251
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	strb r3, [r2]
	b _0807B8C4
	.align 2, 0
_0807B7B0: .4byte 0x00000252
_0807B7B4: .4byte gWrittenToMosaic_L
_0807B7B8: .4byte 0x00000251
_0807B7BC:
	ldr r1, _0807B7CC @ =0x00000253
	adds r0, r4, r1
	movs r2, #0
	strb r2, [r0]
	ldr r0, _0807B7D0 @ =0x00000251
	adds r1, r4, r0
	movs r0, #5
	b _0807B846
	.align 2, 0
_0807B7CC: .4byte 0x00000253
_0807B7D0: .4byte 0x00000251
_0807B7D4:
	ldr r2, _0807B81C @ =0x00000253
	adds r5, r4, r2
	ldrb r1, [r5]
	movs r2, #0x50
	subs r0, r2, r1
	asrs r0, r0, #4
	cmp r0, #3
	bgt _0807B7E6
	movs r0, #4
_0807B7E6:
	adds r0, r1, r0
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x50
	bls _0807B814
	strb r2, [r5]
	ldr r0, _0807B820 @ =0x00000252
	adds r1, r4, r0
	movs r0, #0
	strb r0, [r1]
	ldr r2, _0807B824 @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x94
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
_0807B814:
	ldr r3, _0807B828 @ =0x04000046
	ldrb r2, [r5]
	b _0807B89A
	.align 2, 0
_0807B81C: .4byte 0x00000253
_0807B820: .4byte 0x00000252
_0807B824: .4byte 0x00000251
_0807B828: .4byte 0x04000046
_0807B82C:
	movs r1, #0x94
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807B8C4
	ldr r2, _0807B850 @ =0x00000251
	adds r1, r4, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
_0807B846:
	strb r0, [r1]
	ldr r1, _0807B854 @ =0x00000252
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B8C4
	.align 2, 0
_0807B850: .4byte 0x00000251
_0807B854: .4byte 0x00000252
_0807B858:
	ldr r2, _0807B884 @ =0x00000253
	adds r3, r4, r2
	ldrb r1, [r3]
	movs r0, #0x50
	subs r0, r0, r1
	asrs r0, r0, #4
	cmp r0, #3
	bgt _0807B86A
	movs r0, #4
_0807B86A:
	subs r0, r1, r0
	cmp r0, #0
	bge _0807B890
	movs r2, #0
	strb r2, [r3]
	ldr r0, _0807B888 @ =0x00000251
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	ldr r1, _0807B88C @ =0x00000252
	adds r0, r4, r1
	strb r2, [r0]
	b _0807B892
	.align 2, 0
_0807B884: .4byte 0x00000253
_0807B888: .4byte 0x00000251
_0807B88C: .4byte 0x00000252
_0807B890:
	strb r0, [r3]
_0807B892:
	ldr r3, _0807B8A8 @ =0x04000046
	ldr r2, _0807B8AC @ =0x00000253
	adds r0, r4, r2
	ldrb r2, [r0]
_0807B89A:
	lsls r1, r2, #8
	movs r0, #0xa0
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r3]
	b _0807B8C4
	.align 2, 0
_0807B8A8: .4byte 0x04000046
_0807B8AC: .4byte 0x00000253
_0807B8B0:
	ldr r1, _0807B8CC @ =0x00000252
	adds r0, r4, r1
	movs r1, #0
	strb r1, [r0]
	ldr r2, _0807B8D0 @ =0x00000251
	adds r0, r4, r2
	strb r1, [r0]
	subs r2, #1
	adds r0, r4, r2
	strb r1, [r0]
_0807B8C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807B8CC: .4byte 0x00000252
_0807B8D0: .4byte 0x00000251

	thumb_func_start ProcessPauseScreenText
ProcessPauseScreenText: @ 0x0807B8D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, _0807B93C @ =0x0200C000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	adds r2, r4, #0
	bl BitFill
	movs r6, #0
	ldr r2, _0807B940 @ =0x0879C10C
	ldr r0, _0807B944 @ =0x03000011
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, _0807B948 @ =gEventCounter
	ldrb r0, [r0]
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
	ldrh r2, [r7]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r0
	beq _0807B9D8
	movs r5, #0x80
	lsls r5, r5, #8
	mov sl, r5
	movs r1, #0xfe
	lsls r1, r1, #8
	mov sb, r1
_0807B926:
	movs r5, #1
	adds r1, r0, #0
	ands r1, r2
	cmp r1, sl
	bne _0807B94C
	movs r5, #0xff
	mov r8, r5
	mov r0, r8
	ands r0, r2
	mov r8, r0
	b _0807B9C2
	.align 2, 0
_0807B93C: .4byte 0x0200C000
_0807B940: .4byte 0x0879C10C
_0807B944: .4byte 0x03000011
_0807B948: .4byte gEventCounter
_0807B94C:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807B95E
	movs r1, #0
	mov r8, r1
	movs r6, #0xff
	ands r6, r2
	b _0807B9C2
_0807B95E:
	cmp r2, sb
	bne _0807B96E
	movs r2, #0
	mov r8, r2
	cmp r6, #0xe0
	bgt _0807B9D8
	movs r6, #0xe0
	movs r5, #0
_0807B96E:
	cmp r5, #0
	beq _0807B9C2
	ldrh r0, [r7]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r6, r0
	cmp r5, #0xe0
	ble _0807B988
	cmp r6, #0xdf
	bgt _0807B988
	movs r6, #0xe0
	b _0807B990
_0807B988:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807B9D8
_0807B990:
	cmp r6, #0xdf
	ble _0807B99E
	movs r5, #0x80
	lsls r5, r5, #4
	adds r4, r6, #0
	subs r4, #0xe0
	b _0807B9A2
_0807B99E:
	movs r5, #0
	adds r4, r6, #0
_0807B9A2:
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r5, r5, r0
	movs r3, #7
	ldrh r0, [r7]
	ldr r2, _0807B9E8 @ =0x0200C000
	adds r1, r2, r5
	mov r5, r8
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ands r4, r3
	movs r3, #0
	str r3, [sp]
	adds r3, r4, #0
	bl DrawCharacter
_0807B9C2:
	adds r7, #2
	add r6, r8
	ldr r0, _0807B9EC @ =0x000001BF
	cmp r6, r0
	bgt _0807B9D8
	ldrh r2, [r7]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r0
	bne _0807B926
_0807B9D8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807B9E8: .4byte 0x0200C000
_0807B9EC: .4byte 0x000001BF

	thumb_func_start ProcessEasySleepText
ProcessEasySleepText: @ 0x0807B9F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r2, _0807BA80 @ =0x0200D000
	movs r5, #0x80
	lsls r5, r5, #5
	movs r4, #0x10
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r3, r5, #0
	bl BitFill
	ldr r2, _0807BA84 @ =0x0200E000
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	adds r3, r5, #0
	bl BitFill
	ldr r2, _0807BA88 @ =0x0200F000
	movs r3, #0x80
	lsls r3, r3, #4
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	movs r3, #0
_0807BA30:
	ldr r0, _0807BA84 @ =0x0200E000
	mov sl, r0
	cmp r3, #0
	bne _0807BA3C
	ldr r1, _0807BA80 @ =0x0200D000
	mov sl, r1
_0807BA3C:
	ldr r1, _0807BA8C @ =0x0879CDF4
	ldr r0, _0807BA90 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	lsls r0, r3, #2
	adds r0, r0, r1
	adds r0, #0xb4
	ldr r6, [r0]
	movs r7, #0
	ldrh r2, [r6]
	movs r4, #0xff
	lsls r4, r4, #8
	adds r0, r4, #0
	adds r3, #1
	mov sb, r3
	cmp r2, r4
	beq _0807BB24
_0807BA66:
	movs r5, #1
	adds r1, r0, #0
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BA94
	movs r1, #0xff
	mov r8, r1
	mov r4, r8
	ands r4, r2
	mov r8, r4
	b _0807BB0E
	.align 2, 0
_0807BA80: .4byte 0x0200D000
_0807BA84: .4byte 0x0200E000
_0807BA88: .4byte 0x0200F000
_0807BA8C: .4byte 0x0879CDF4
_0807BA90: .4byte 0x03000011
_0807BA94:
	movs r0, #0x83
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BAA6
	movs r5, #0
	mov r8, r5
	movs r7, #0xff
	ands r7, r2
	b _0807BB0E
_0807BAA6:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r2, r0
	bne _0807BABA
	movs r1, #0
	mov r8, r1
	cmp r7, #0xe0
	bgt _0807BB24
	movs r7, #0xe0
	movs r5, #0
_0807BABA:
	cmp r5, #0
	beq _0807BB0E
	ldrh r0, [r6]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r7, r0
	cmp r5, #0xe0
	ble _0807BAD4
	cmp r7, #0xdf
	bgt _0807BAD4
	movs r7, #0xe0
	b _0807BADC
_0807BAD4:
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807BB24
_0807BADC:
	cmp r7, #0xdf
	ble _0807BAEA
	movs r5, #0x80
	lsls r5, r5, #4
	adds r4, r7, #0
	subs r4, #0xe0
	b _0807BAEE
_0807BAEA:
	movs r5, #0
	adds r4, r7, #0
_0807BAEE:
	asrs r0, r4, #3
	lsls r0, r0, #5
	adds r5, r5, r0
	movs r3, #7
	ldrh r0, [r6]
	mov r2, sl
	adds r1, r2, r5
	mov r5, r8
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	ands r4, r3
	movs r3, #0
	str r3, [sp]
	adds r3, r4, #0
	bl DrawCharacter
_0807BB0E:
	adds r6, #2
	add r7, r8
	ldr r0, _0807BB60 @ =0x000001BF
	cmp r7, r0
	bgt _0807BB24
	ldrh r2, [r6]
	movs r1, #0xff
	lsls r1, r1, #8
	adds r0, r1, #0
	cmp r2, r1
	bne _0807BA66
_0807BB24:
	mov r3, sb
	cmp r3, #1
	ble _0807BA30
	ldr r2, _0807BB64 @ =0x0200F000
	mov sl, r2
	ldr r1, _0807BB68 @ =0x0879CDF4
	ldr r0, _0807BB6C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0xbc
	ldr r6, [r0]
	movs r7, #0
	ldrh r1, [r6]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	beq _0807BBE0
	movs r5, #1
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BB70
	movs r4, #0
	mov r8, r4
	movs r7, #0x70
	b _0807BBB2
	.align 2, 0
_0807BB60: .4byte 0x000001BF
_0807BB64: .4byte 0x0200F000
_0807BB68: .4byte 0x0879CDF4
_0807BB6C: .4byte 0x03000011
_0807BB70:
	ldrh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0807BB80
	movs r5, #0
	mov r8, r5
_0807BB80:
	cmp r5, #0
	beq _0807BBB2
	ldrh r0, [r6]
	bl GetCharacterWidth
	mov r8, r0
	adds r5, r7, r0
	movs r0, #0xe0
	lsls r0, r0, #1
	cmp r5, r0
	bgt _0807BBE0
	asrs r0, r7, #3
	lsls r5, r0, #5
	movs r3, #7
	ldrh r0, [r6]
	mov r2, sl
	adds r1, r2, r5
	mov r4, r8
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	ands r3, r7
	movs r4, #0
	str r4, [sp]
	bl DrawCharacter
_0807BBB2:
	adds r6, #2
	add r7, r8
	ldr r0, _0807BBDC @ =0x000001BF
	cmp r7, r0
	bgt _0807BBE0
	ldrh r1, [r6]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	beq _0807BBE0
	movs r5, #1
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0807BB70
	movs r5, #0
	mov r8, r5
	cmp r7, #0x70
	bgt _0807BBE0
	movs r7, #0x70
	b _0807BBB2
	.align 2, 0
_0807BBDC: .4byte 0x000001BF
_0807BBE0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start GetFlashingSectorNumber
GetFlashingSectorNumber: @ 0x0807BBF0
	push {r4, r5, r6, r7, lr}
	ldr r0, _0807BC80 @ =0x0300004D
	movs r1, #0
	strb r1, [r0]
	ldr r1, _0807BC84 @ =gEventCounter
	ldrb r2, [r1]
	adds r6, r0, #0
	ldr r1, _0807BC88 @ =0x08575A60
	ldr r7, _0807BC8C @ =gPreviousNavigationConversation
	cmp r2, #0
	ble _0807BC2A
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r3, r0, #2
	adds r0, r3, r1
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0807BC2A
	adds r3, r3, r1
_0807BC1A:
	subs r3, #0xc
	subs r2, #1
	cmp r2, #0
	ble _0807BC2A
	movs r0, #6
	ldrsb r0, [r3, r0]
	cmp r0, #0
	beq _0807BC1A
_0807BC2A:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #6
	ldrsb r3, [r0, r3]
	ldrb r4, [r7]
	cmp r4, r3
	bne _0807BC76
	movs r3, #0
	movs r2, #0
	ldr r0, _0807BC90 @ =0x085766E4
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r5, r0, #0
	cmp r4, r1
	beq _0807BC68
_0807BC4C:
	adds r2, #1
	cmp r2, #0x20
	bhi _0807BC64
	ldrb r0, [r7]
	lsls r1, r2, #3
	adds r1, r1, r5
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	cmp r0, r1
	bne _0807BC4C
	movs r3, #1
_0807BC64:
	cmp r3, #0
	beq _0807BC76
_0807BC68:
	lsls r0, r2, #3
	adds r0, r0, r5
	ldrb r2, [r0, #1]
	ldr r0, _0807BC94 @ =0x08576066
	adds r0, r2, r0
	ldrb r0, [r0]
	strb r0, [r6]
_0807BC76:
	ldrb r0, [r6]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807BC80: .4byte 0x0300004D
_0807BC84: .4byte gEventCounter
_0807BC88: .4byte 0x08575A60
_0807BC8C: .4byte gPreviousNavigationConversation
_0807BC90: .4byte 0x085766E4
_0807BC94: .4byte 0x08576066

	thumb_func_start NavigationConversationLoadPopUpGraphics
NavigationConversationLoadPopUpGraphics: @ 0x0807BC98
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r4, #3
	ldr r0, _0807BD68 @ =gNonGameplayRam
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _0807BD6C @ =0x0857BCC8
	movs r1, #8
	ldrsb r1, [r0, r1]
	adds r3, r0, #0
	cmp r2, r1
	beq _0807BCC8
	adds r1, r3, #0
	adds r1, #8
_0807BCB8:
	subs r1, #4
	subs r4, #1
	cmp r4, #0
	ble _0807BCC8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r2, r0
	bne _0807BCB8
_0807BCC8:
	cmp r4, #0
	beq _0807BD5E
	subs r4, #1
	lsls r0, r4, #2
	adds r4, r0, r3
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0807BCF0
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompVram
_0807BCF0:
	ldrb r0, [r4, #2]
	cmp r0, #0
	beq _0807BD0C
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _0807BD74 @ =0x02004000
	bl LZ77UncompVram
_0807BD0C:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0807BD28
	ldr r2, _0807BD70 @ =0x0857BC50
	adds r1, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #0x14
	adds r0, r0, r2
	ldr r0, [r0]
	ldr r1, _0807BD78 @ =0x02008000
	bl LZ77UncompVram
_0807BD28:
	movs r4, #5
	ldr r5, _0807BD7C @ =0x06015700
	movs r6, #0x20
_0807BD2E:
	str r6, [sp]
	movs r0, #3
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, r5, #0
	movs r3, #0x80
	lsls r3, r3, #1
	bl BitFill
	ldr r0, _0807BD80 @ =0xFFFFFC00
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bge _0807BD2E
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _0807BD84 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _0807BD88 @ =0x050003E0
	str r0, [r1, #4]
	ldr r0, _0807BD8C @ =0x85000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0807BD5E:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD68: .4byte gNonGameplayRam
_0807BD6C: .4byte 0x0857BCC8
_0807BD70: .4byte 0x0857BC50
_0807BD74: .4byte 0x02004000
_0807BD78: .4byte 0x02008000
_0807BD7C: .4byte 0x06015700
_0807BD80: .4byte 0xFFFFFC00
_0807BD84: .4byte 0x040000D4
_0807BD88: .4byte 0x050003E0
_0807BD8C: .4byte 0x85000008

	thumb_func_start NavigationConversationUpdatePopUp
NavigationConversationUpdatePopUp: @ 0x0807BD90
	push {r4, lr}
	ldr r4, _0807BDD0 @ =gNonGameplayRam
	movs r0, #0x86
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807BDC8
	ldr r0, _0807BDD4 @ =0x0000021B
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807BDD8 @ =0x0879C170
	ldrb r0, [r2]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	ldr r1, _0807BDDC @ =0x0000021D
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807BDC8
	bl NavigationConversationFadeInPopUpPalette
_0807BDC8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BDD0: .4byte gNonGameplayRam
_0807BDD4: .4byte 0x0000021B
_0807BDD8: .4byte 0x0879C170
_0807BDDC: .4byte 0x0000021D

	thumb_func_start unk_7bde0
unk_7bde0: @ 0x0807BDE0
	push {r4, r5, r6, r7, lr}
	ldr r2, _0807BE2C @ =gNonGameplayRam
	ldr r0, _0807BE30 @ =0x0000021A
	adds r1, r2, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r3, #3
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r4, [r0]
	ldr r0, _0807BE34 @ =0x0857BCC8
	movs r1, #8
	ldrsb r1, [r0, r1]
	adds r6, r2, #0
	adds r2, r0, #0
	cmp r4, r1
	beq _0807BE18
	adds r1, r2, #0
	adds r1, #8
_0807BE08:
	subs r1, #4
	subs r3, #1
	cmp r3, #0
	ble _0807BE18
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r4, r0
	bne _0807BE08
_0807BE18:
	subs r3, #1
	cmp r3, #0xff
	bne _0807BE38
	movs r2, #0x86
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0
	strb r0, [r1]
	b _0807BFAE
	.align 2, 0
_0807BE2C: .4byte gNonGameplayRam
_0807BE30: .4byte 0x0000021A
_0807BE34: .4byte 0x0857BCC8
_0807BE38:
	ldr r1, _0807BE4C @ =0x00000219
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807BE50
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #2]
	b _0807BE62
	.align 2, 0
_0807BE4C: .4byte 0x00000219
_0807BE50:
	cmp r0, #2
	bne _0807BE5C
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #3]
	b _0807BE62
_0807BE5C:
	lsls r0, r3, #2
	adds r0, r0, r2
	ldrb r1, [r0, #1]
_0807BE62:
	ldr r2, _0807BE7C @ =0x0000021A
	adds r0, r6, r2
	strb r1, [r0]
	ldr r1, _0807BE7C @ =0x0000021A
	adds r0, r6, r1
	ldrb r3, [r0]
	cmp r3, #0
	bne _0807BE80
	movs r2, #0x86
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r3, [r0]
	b _0807BFAE
	.align 2, 0
_0807BE7C: .4byte 0x0000021A
_0807BE80:
	ldr r1, _0807BEA4 @ =0x00000229
	adds r0, r6, r1
	movs r1, #0
	strb r1, [r0]
	movs r2, #0x8a
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	ldr r1, _0807BEA8 @ =0x00000219
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807BEB0
	subs r2, #0x14
	adds r1, r6, r2
	ldr r0, _0807BEAC @ =0x02004000
	b _0807BECE
	.align 2, 0
_0807BEA4: .4byte 0x00000229
_0807BEA8: .4byte 0x00000219
_0807BEAC: .4byte 0x02004000
_0807BEB0:
	cmp r0, #2
	bne _0807BEC4
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r6, r0
	ldr r0, _0807BEC0 @ =0x02008000
	b _0807BECE
	.align 2, 0
_0807BEC0: .4byte 0x02008000
_0807BEC4:
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r6, r2
	movs r0, #0x80
	lsls r0, r0, #0x12
_0807BECE:
	str r0, [r1]
	ldr r2, _0807BF28 @ =0x0857BC50
	ldr r1, _0807BF2C @ =0x0000021A
	adds r0, r6, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	lsls r2, r0, #0x1c
	lsrs r0, r2, #0x1c
	cmp r0, #8
	bne _0807BF40
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #0x1c
	lsrs r3, r0, #0x1c
	cmp r3, #0
	ble _0807BF82
	ldr r5, _0807BF30 @ =0x040000D4
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, [r0]
	lsls r0, r3, #0xa
	adds r4, r0, r1
	ldr r0, _0807BF34 @ =0xFFFFFC00
	mov ip, r0
	lsls r7, r2, #0x18
_0807BF08:
	add r4, ip
	subs r3, #1
	lsls r2, r3, #0xa
	str r4, [r5]
	lsrs r0, r7, #0x1c
	lsls r0, r0, #0xa
	ldr r1, _0807BF38 @ =0x06014300
	adds r0, r0, r1
	adds r2, r2, r0
	str r2, [r5, #4]
	ldr r0, _0807BF3C @ =0x80000080
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	cmp r3, #0
	bgt _0807BF08
	b _0807BF82
	.align 2, 0
_0807BF28: .4byte 0x0857BC50
_0807BF2C: .4byte 0x0000021A
_0807BF30: .4byte 0x040000D4
_0807BF34: .4byte 0xFFFFFC00
_0807BF38: .4byte 0x06014300
_0807BF3C: .4byte 0x80000080
_0807BF40:
	lsrs r0, r2, #0x1c
	cmp r0, #4
	bne _0807BF82
	ldrb r2, [r1, #0x11]
	lsls r0, r2, #0x1c
	lsrs r3, r0, #0x1c
	cmp r3, #0
	ble _0807BF82
	ldr r5, _0807BFB4 @ =0x040000D4
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r6, r1
	ldr r1, [r0]
	lsls r0, r3, #0xa
	adds r4, r0, r1
	lsls r7, r2, #0x18
_0807BF60:
	ldr r2, _0807BFB8 @ =0xFFFFFC00
	adds r4, r4, r2
	subs r3, #1
	lsls r2, r3, #0xa
	str r4, [r5]
	lsrs r0, r7, #0x1c
	lsls r0, r0, #0xa
	ldr r1, _0807BFBC @ =0x06014300
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, #0x40
	str r2, [r5, #4]
	ldr r0, _0807BFC0 @ =0x80000040
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	cmp r3, #0
	bgt _0807BF60
_0807BF82:
	ldr r1, _0807BFC4 @ =0x0000021A
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807BF92
	ldr r0, _0807BFC8 @ =0x00000125
	bl SoundPlay
_0807BF92:
	ldr r2, _0807BFCC @ =0x0000021D
	adds r1, r6, r2
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r6, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807BFD0 @ =0x0000021B
	adds r0, r6, r1
	strb r2, [r0]
_0807BFAE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BFB4: .4byte 0x040000D4
_0807BFB8: .4byte 0xFFFFFC00
_0807BFBC: .4byte 0x06014300
_0807BFC0: .4byte 0x80000040
_0807BFC4: .4byte 0x0000021A
_0807BFC8: .4byte 0x00000125
_0807BFCC: .4byte 0x0000021D
_0807BFD0: .4byte 0x0000021B

	thumb_func_start NavigationConversationFadeInPopUpPalette
NavigationConversationFadeInPopUpPalette: @ 0x0807BFD4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, _0807C068 @ =0x0857BC50
	ldr r3, _0807C06C @ =gNonGameplayRam
	ldr r1, _0807C070 @ =0x0000021A
	adds r0, r3, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r2, #8
	adds r0, r0, r2
	ldr r2, [r0]
	ldr r6, _0807C074 @ =0x050003E0
	movs r0, #0
	mov ip, r0
	mov sb, sp
	movs r1, #0xf8
	lsls r1, r1, #7
	mov sl, r1
	add r5, sp, #4
_0807C006:
	ldrb r1, [r2]
	movs r0, #0x1f
	ands r0, r1
	mov r1, sb
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	mov r1, sb
	strb r0, [r1, #1]
	ldrh r1, [r2]
	mov r0, sl
	ands r0, r1
	lsrs r0, r0, #0xa
	mov r1, sb
	strb r0, [r1, #2]
	ldrb r1, [r6]
	movs r0, #0x1f
	ands r0, r1
	strb r0, [r5]
	ldrh r1, [r6]
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	strb r0, [r5, #1]
	ldrh r1, [r6]
	mov r0, sl
	ands r0, r1
	lsrs r0, r0, #0xa
	strb r0, [r5, #2]
	movs r4, #0
	movs r0, #1
	add ip, r0
	adds r7, r2, #2
	adds r1, r6, #2
	mov r8, r1
	adds r3, r5, #0
_0807C056:
	mov r1, sp
	adds r0, r1, r4
	ldrb r2, [r3]
	ldrb r1, [r0]
	adds r0, r2, #0
	cmp r1, r0
	bls _0807C078
	adds r0, r2, #1
	b _0807C07E
	.align 2, 0
_0807C068: .4byte 0x0857BC50
_0807C06C: .4byte gNonGameplayRam
_0807C070: .4byte 0x0000021A
_0807C074: .4byte 0x050003E0
_0807C078:
	cmp r1, r0
	bhs _0807C080
	subs r0, r2, #1
_0807C07E:
	strb r0, [r3]
_0807C080:
	adds r3, #1
	adds r4, #1
	cmp r4, #2
	ble _0807C056
	ldrb r0, [r5]
	ldrb r1, [r5, #1]
	lsls r1, r1, #5
	orrs r0, r1
	ldrb r1, [r5, #2]
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r6]
	adds r2, r7, #0
	mov r6, r8
	mov r0, ip
	cmp r0, #0xf
	ble _0807C006
	ldr r1, _0807C0B4 @ =gNonGameplayRam
	ldr r0, _0807C0B8 @ =0x0000021D
	adds r3, r1, r0
	ldrb r0, [r3]
	cmp r0, #0x20
	bls _0807C0BC
	movs r0, #0
	b _0807C0BE
	.align 2, 0
_0807C0B4: .4byte gNonGameplayRam
_0807C0B8: .4byte 0x0000021D
_0807C0BC:
	adds r0, #1
_0807C0BE:
	strb r0, [r3]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NavigationConversationUpdateXParasitePopUp
NavigationConversationUpdateXParasitePopUp: @ 0x0807C0D0
	push {r4, r5, r6, r7, lr}
	bl unk_7c3b4
	ldr r0, _0807C148 @ =0x0857BC50
	mov ip, r0
	ldr r3, _0807C14C @ =gNonGameplayRam
	ldr r1, _0807C150 @ =0x0000021A
	adds r6, r3, r1
	ldrb r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	mov r2, ip
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	lsls r2, r0, #0x1c
	lsrs r0, r2, #0x1c
	cmp r0, #8
	beq _0807C0F8
	b _0807C20C
_0807C0F8:
	ldr r7, [r1]
	ldr r0, _0807C154 @ =0x0000021B
	adds r2, r3, r0
	movs r1, #0x87
	lsls r1, r1, #2
	adds r4, r3, r1
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r2]
	ldrb r0, [r0, #1]
	cmp r1, r0
	bhs _0807C114
	b _0807C2F4
_0807C114:
	movs r5, #0
	strb r5, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0807C134
	strb r5, [r4]
_0807C134:
	ldr r2, _0807C158 @ =0x00000219
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807C160
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	ldr r0, _0807C15C @ =0x02004000
	b _0807C17E
	.align 2, 0
_0807C148: .4byte 0x0857BC50
_0807C14C: .4byte gNonGameplayRam
_0807C150: .4byte 0x0000021A
_0807C154: .4byte 0x0000021B
_0807C158: .4byte 0x00000219
_0807C15C: .4byte 0x02004000
_0807C160:
	cmp r0, #2
	bne _0807C174
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r0, _0807C170 @ =0x02008000
	b _0807C17E
	.align 2, 0
_0807C170: .4byte 0x02008000
_0807C174:
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
_0807C17E:
	str r0, [r1]
	ldr r3, _0807C1F0 @ =0x0857BC50
	ldr r2, _0807C1F4 @ =gNonGameplayRam
	ldr r1, _0807C1F8 @ =0x0000021A
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #0x11]
	lsls r3, r0, #0x1c
	lsrs r6, r0, #4
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	lsls r4, r0, #8
	lsrs r1, r1, #2
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0xb
	adds r4, r4, r0
	movs r0, #0x85
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	adds r5, r0, r4
	str r5, [r2]
	lsrs r4, r3, #0x1c
	cmp r4, #0
	bgt _0807C1CA
	b _0807C2F4
_0807C1CA:
	ldr r3, _0807C1FC @ =0x040000D4
	lsls r2, r4, #0xa
	ldr r0, _0807C200 @ =0x06014300
	adds r1, r2, r0
	lsls r0, r6, #0xa
	adds r1, r1, r0
	adds r2, r2, r5
	ldr r5, _0807C204 @ =0xFFFFFC00
	ldr r6, _0807C208 @ =0x80000080
_0807C1DC:
	adds r1, r1, r5
	adds r2, r2, r5
	subs r4, #1
	str r2, [r3]
	str r1, [r3, #4]
	str r6, [r3, #8]
	ldr r0, [r3, #8]
	cmp r4, #0
	bgt _0807C1DC
	b _0807C2F4
	.align 2, 0
_0807C1F0: .4byte 0x0857BC50
_0807C1F4: .4byte gNonGameplayRam
_0807C1F8: .4byte 0x0000021A
_0807C1FC: .4byte 0x040000D4
_0807C200: .4byte 0x06014300
_0807C204: .4byte 0xFFFFFC00
_0807C208: .4byte 0x80000080
_0807C20C:
	lsrs r0, r2, #0x1c
	cmp r0, #4
	bne _0807C2F4
	ldr r7, [r1]
	ldr r1, _0807C260 @ =0x0000021B
	adds r2, r3, r1
	movs r0, #0x87
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r2]
	ldrb r0, [r0, #1]
	cmp r1, r0
	blo _0807C2F4
	movs r5, #0
	strb r5, [r2]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r6]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	add r1, ip
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0807C24C
	strb r5, [r4]
_0807C24C:
	ldr r1, _0807C264 @ =0x00000219
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _0807C26C
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	ldr r0, _0807C268 @ =0x02004000
	b _0807C28A
	.align 2, 0
_0807C260: .4byte 0x0000021B
_0807C264: .4byte 0x00000219
_0807C268: .4byte 0x02004000
_0807C26C:
	cmp r0, #2
	bne _0807C280
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	ldr r0, _0807C27C @ =0x02008000
	b _0807C28A
	.align 2, 0
_0807C27C: .4byte 0x02008000
_0807C280:
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #0x80
	lsls r0, r0, #0x12
_0807C28A:
	str r0, [r1]
	ldr r3, _0807C2FC @ =0x0857BC50
	ldr r2, _0807C300 @ =gNonGameplayRam
	ldr r1, _0807C304 @ =0x0000021A
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #0x11]
	lsls r3, r0, #0x1c
	lsrs r6, r0, #4
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	lsls r4, r0, #7
	lsrs r1, r1, #3
	lsls r1, r1, #0xc
	adds r4, r4, r1
	movs r0, #0x85
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	adds r5, r0, r4
	str r5, [r2]
	lsrs r4, r3, #0x1c
	cmp r4, #0
	ble _0807C2F4
	ldr r3, _0807C308 @ =0x040000D4
	lsls r2, r4, #0xa
	ldr r0, _0807C30C @ =0x06014340
	adds r1, r2, r0
	lsls r0, r6, #0xa
	adds r1, r1, r0
	adds r2, r2, r5
	ldr r5, _0807C310 @ =0xFFFFFC00
	ldr r6, _0807C314 @ =0x80000040
_0807C2E2:
	adds r1, r1, r5
	adds r2, r2, r5
	subs r4, #1
	str r2, [r3]
	str r1, [r3, #4]
	str r6, [r3, #8]
	ldr r0, [r3, #8]
	cmp r4, #0
	bgt _0807C2E2
_0807C2F4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C2FC: .4byte 0x0857BC50
_0807C300: .4byte gNonGameplayRam
_0807C304: .4byte 0x0000021A
_0807C308: .4byte 0x040000D4
_0807C30C: .4byte 0x06014340
_0807C310: .4byte 0xFFFFFC00
_0807C314: .4byte 0x80000040

	thumb_func_start NavigationConversationClearPopUpGraphics
NavigationConversationClearPopUpGraphics: @ 0x0807C318
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r5, #5
	ldr r4, _0807C390 @ =0x06015700
	movs r6, #0x20
_0807C322:
	str r6, [sp]
	movs r0, #3
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, r4, #0
	movs r3, #0x80
	lsls r3, r3, #1
	bl BitFill
	ldr r0, _0807C394 @ =0xFFFFFC00
	adds r4, r4, r0
	subs r5, #1
	cmp r5, #0
	bge _0807C322
	movs r5, #0
	str r5, [sp, #4]
	ldr r1, _0807C398 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _0807C39C @ =0x050003E0
	str r0, [r1, #4]
	ldr r0, _0807C3A0 @ =0x85000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r4, _0807C3A4 @ =gNonGameplayRam
	ldr r1, _0807C3A8 @ =0x0000021A
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807C364
	ldr r0, _0807C3AC @ =0x00000125
	bl SoundStop
_0807C364:
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	adds r1, #4
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	adds r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	ldr r0, _0807C3B0 @ =0x00000219
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C390: .4byte 0x06015700
_0807C394: .4byte 0xFFFFFC00
_0807C398: .4byte 0x040000D4
_0807C39C: .4byte 0x050003E0
_0807C3A0: .4byte 0x85000008
_0807C3A4: .4byte gNonGameplayRam
_0807C3A8: .4byte 0x0000021A
_0807C3AC: .4byte 0x00000125
_0807C3B0: .4byte 0x00000219

	thumb_func_start unk_7c3b4
unk_7c3b4: @ 0x0807C3B4
	push {r4, r5, r6, lr}
	ldr r4, _0807C42C @ =0x0857BC50
	ldr r5, _0807C430 @ =gNonGameplayRam
	ldr r0, _0807C434 @ =0x0000021A
	adds r2, r5, r0
	ldrb r0, [r2]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	beq _0807C424
	ldr r1, _0807C438 @ =0x00000229
	adds r3, r5, r1
	ldrb r1, [r3]
	adds r1, #1
	movs r6, #0
	strb r1, [r3]
	ldrb r2, [r2]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r2, r0, #3
	adds r0, r2, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r0, #0x10]
	cmp r1, r0
	blo _0807C424
	strb r6, [r3]
	adds r0, r4, #0
	adds r0, #0xc
	adds r0, r2, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r4, r5, r1
	ldrb r1, [r4]
	lsls r1, r1, #1
	ldr r3, [r0]
	adds r2, r3, r1
	ldrh r0, [r2]
	cmp r0, #0
	bne _0807C40E
	strb r6, [r4]
	adds r2, r3, #0
_0807C40E:
	ldr r1, _0807C43C @ =0x050003FE
	ldrh r0, [r2]
	strh r0, [r1]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _0807C424
	strb r6, [r4]
_0807C424:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807C42C: .4byte 0x0857BC50
_0807C430: .4byte gNonGameplayRam
_0807C434: .4byte 0x0000021A
_0807C438: .4byte 0x00000229
_0807C43C: .4byte 0x050003FE

	thumb_func_start unk_7c440
unk_7c440: @ 0x0807C440
	push {r4, r5, r6, r7, lr}
	ldr r2, _0807C518 @ =gNonGameplayRam
	ldr r0, _0807C51C @ =0x00000225
	adds r5, r2, r0
	ldrb r0, [r5]
	adds r0, #1
	movs r7, #0
	strb r0, [r5]
	ldr r3, _0807C520 @ =0x0857BEB4
	movs r1, #0x89
	lsls r1, r1, #2
	adds r4, r2, r1
	ldrb r1, [r4]
	adds r1, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r6, r2, #0
	ldrb r1, [r1]
	cmp r0, r1
	blo _0807C4B0
	strb r7, [r5]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0807C47A
	strb r7, [r4]
_0807C47A:
	movs r3, #0xa0
	lsls r3, r3, #0x13
	ldr r1, _0807C524 @ =0x0857BCD4
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x24]
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x26]
	adds r1, r3, #0
	adds r1, #0x44
	ldr r2, _0807C528 @ =0x0857BCF4
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
_0807C4B0:
	adds r1, r6, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0807C59C
	cmp r0, #1
	bne _0807C53C
	ldr r6, _0807C52C @ =0x0000022D
	adds r3, r1, r6
	ldrb r0, [r3]
	adds r0, #1
	movs r5, #0
	strb r0, [r3]
	ldr r2, _0807C530 @ =0x0857BEB8
	subs r6, #1
	adds r4, r1, r6
	ldrb r1, [r4]
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0807C59C
	strb r5, [r3]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0807C4EE
	strb r5, [r4]
_0807C4EE:
	ldr r3, _0807C534 @ =0x05000138
	ldrb r0, [r4]
	lsls r0, r0, #4
	adds r0, #0xc
	adds r2, r0, #0
	movs r1, #0
	ldr r4, _0807C538 @ =0x0857BD34
_0807C4FC:
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r3]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, #2
	cmp r1, #3
	bls _0807C4FC
	b _0807C59C
	.align 2, 0
_0807C518: .4byte gNonGameplayRam
_0807C51C: .4byte 0x00000225
_0807C520: .4byte 0x0857BEB4
_0807C524: .4byte 0x0857BCD4
_0807C528: .4byte 0x0857BCF4
_0807C52C: .4byte 0x0000022D
_0807C530: .4byte 0x0857BEB8
_0807C534: .4byte 0x05000138
_0807C538: .4byte 0x0857BD34
_0807C53C:
	cmp r0, #2
	bne _0807C59C
	ldr r0, _0807C5A4 @ =0x0000022D
	adds r3, r6, r0
	ldrb r0, [r3]
	adds r0, #1
	movs r5, #0
	strb r0, [r3]
	ldr r2, _0807C5A8 @ =0x0857BEBC
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r4, r6, r1
	ldrb r1, [r4]
	adds r1, r1, r2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	blo _0807C59C
	strb r5, [r3]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0807C574
	strb r5, [r4]
_0807C574:
	ldr r3, _0807C5AC @ =0x05000194
	ldrb r0, [r4]
	lsls r0, r0, #4
	adds r0, #0xa
	adds r2, r0, #0
	movs r1, #0
	ldr r4, _0807C5B0 @ =0x0857BDB4
_0807C582:
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	strh r0, [r3]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r3, #2
	cmp r1, #5
	bls _0807C582
_0807C59C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C5A4: .4byte 0x0000022D
_0807C5A8: .4byte 0x0857BEBC
_0807C5AC: .4byte 0x05000194
_0807C5B0: .4byte 0x0857BDB4

	thumb_func_start NavigationConversationLoadSpecialGraphics
NavigationConversationLoadSpecialGraphics: @ 0x0807C5B4
	push {lr}
	ldr r0, _0807C5F0 @ =gNonGameplayRam
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x35
	bne _0807C618
	ldr r0, _0807C5F4 @ =0x0857C0C4
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompVram
	ldr r0, _0807C5F8 @ =0x0857FCA0
	ldr r1, _0807C5FC @ =0x02006000
	bl LZ77UncompVram
	ldr r0, _0807C600 @ =0x08580238
	ldr r1, _0807C604 @ =0x02006800
	bl LZ77UncompVram
	ldr r0, _0807C608 @ =0x085807D0
	ldr r1, _0807C60C @ =0x02007000
	bl LZ77UncompVram
	ldr r0, _0807C610 @ =0x08580D68
	ldr r1, _0807C614 @ =0x02007800
	bl LZ77UncompVram
	b _0807C626
	.align 2, 0
_0807C5F0: .4byte gNonGameplayRam
_0807C5F4: .4byte 0x0857C0C4
_0807C5F8: .4byte 0x0857FCA0
_0807C5FC: .4byte 0x02006000
_0807C600: .4byte 0x08580238
_0807C604: .4byte 0x02006800
_0807C608: .4byte 0x085807D0
_0807C60C: .4byte 0x02007000
_0807C610: .4byte 0x08580D68
_0807C614: .4byte 0x02007800
_0807C618:
	cmp r0, #0xe
	bne _0807C626
	ldr r0, _0807C62C @ =0x0872F2E0
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompVram
_0807C626:
	pop {r0}
	bx r0
	.align 2, 0
_0807C62C: .4byte 0x0872F2E0

	thumb_func_start unk_7c630
unk_7c630: @ 0x0807C630
	push {r4, lr}
	sub sp, #4
	ldr r1, _0807C650 @ =gNonGameplayRam
	ldr r2, _0807C654 @ =0x00000265
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0x25
	bls _0807C646
	bl _0807CE56
_0807C646:
	lsls r0, r0, #2
	ldr r1, _0807C658 @ =_0807C65C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807C650: .4byte gNonGameplayRam
_0807C654: .4byte 0x00000265
_0807C658: .4byte _0807C65C
_0807C65C: @ jump table
	.4byte _0807C6F4 @ case 0
	.4byte _0807C770 @ case 1
	.4byte _0807C79C @ case 2
	.4byte _0807C7B8 @ case 3
	.4byte _0807C7E4 @ case 4
	.4byte _0807C810 @ case 5
	.4byte _0807C82C @ case 6
	.4byte _0807C858 @ case 7
	.4byte _0807C884 @ case 8
	.4byte _0807C8A0 @ case 9
	.4byte _0807C8CC @ case 10
	.4byte _0807C924 @ case 11
	.4byte _0807C940 @ case 12
	.4byte _0807C970 @ case 13
	.4byte _0807C99C @ case 14
	.4byte _0807C9C8 @ case 15
	.4byte _0807C9F0 @ case 16
	.4byte _0807CA10 @ case 17
	.4byte _0807CA50 @ case 18
	.4byte _0807CA90 @ case 19
	.4byte _0807CAD0 @ case 20
	.4byte _0807CAFC @ case 21
	.4byte _0807CB20 @ case 22
	.4byte _0807CB58 @ case 23
	.4byte _0807CBB0 @ case 24
	.4byte _0807CBE0 @ case 25
	.4byte _0807CC18 @ case 26
	.4byte _0807CC4C @ case 27
	.4byte _0807CC70 @ case 28
	.4byte _0807CC9C @ case 29
	.4byte _0807CCC8 @ case 30
	.4byte _0807CCE4 @ case 31
	.4byte _0807CD30 @ case 32
	.4byte _0807CD5C @ case 33
	.4byte _0807CD78 @ case 34
	.4byte _0807CDA4 @ case 35
	.4byte _0807CDD0 @ case 36
	.4byte _0807CE10 @ case 37
_0807C6F4:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	ldr r3, _0807C74C @ =0x0000026A
	adds r0, r4, r3
	movs r2, #0
	strh r1, [r0]
	ldr r0, _0807C750 @ =0x0400000E
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	ldr r0, _0807C754 @ =0x0400000C
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	ldr r0, _0807C758 @ =0x04000050
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	ldr r0, _0807C75C @ =0x04000052
	ldrh r1, [r0]
	adds r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	movs r1, #0x9a
	lsls r1, r1, #2
	adds r0, r4, r1
	strh r2, [r0]
	ldr r1, _0807C760 @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r0, _0807C764 @ =0x02035000
	str r0, [r1, #4]
	ldr r0, _0807C768 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0807C76C @ =0x00000265
	adds r1, r4, r2
	b _0807CDEE
	.align 2, 0
_0807C74C: .4byte 0x0000026A
_0807C750: .4byte 0x0400000E
_0807C754: .4byte 0x0400000C
_0807C758: .4byte 0x04000050
_0807C75C: .4byte 0x04000052
_0807C760: .4byte 0x040000D4
_0807C764: .4byte 0x02035000
_0807C768: .4byte 0x80000100
_0807C76C: .4byte 0x00000265
_0807C770:
	ldr r1, _0807C78C @ =0x06004000
	ldr r2, _0807C790 @ =0x02008000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C794 @ =gNonGameplayRam
	ldr r3, _0807C798 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807C78C: .4byte 0x06004000
_0807C790: .4byte 0x02008000
_0807C794: .4byte gNonGameplayRam
_0807C798: .4byte 0x00000265
_0807C79C:
	ldr r1, _0807C7B0 @ =0x06005000
	ldr r2, _0807C7B4 @ =0x02009000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807C7B0: .4byte 0x06005000
_0807C7B4: .4byte 0x02009000
_0807C7B8:
	ldr r1, _0807C7D4 @ =0x06006000
	ldr r2, _0807C7D8 @ =0x0200A000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C7DC @ =gNonGameplayRam
	ldr r2, _0807C7E0 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807C7D4: .4byte 0x06006000
_0807C7D8: .4byte 0x0200A000
_0807C7DC: .4byte gNonGameplayRam
_0807C7E0: .4byte 0x00000265
_0807C7E4:
	ldr r1, _0807C800 @ =0x06007000
	ldr r2, _0807C804 @ =0x0200B000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C808 @ =gNonGameplayRam
	ldr r3, _0807C80C @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807C800: .4byte 0x06007000
_0807C804: .4byte 0x0200B000
_0807C808: .4byte gNonGameplayRam
_0807C80C: .4byte 0x00000265
_0807C810:
	movs r1, #0x80
	lsls r1, r1, #0x12
	ldr r2, _0807C828 @ =0x06004000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807C828: .4byte 0x06004000
_0807C82C:
	ldr r1, _0807C848 @ =0x02001000
	ldr r2, _0807C84C @ =0x06005000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C850 @ =gNonGameplayRam
	ldr r2, _0807C854 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807C848: .4byte 0x02001000
_0807C84C: .4byte 0x06005000
_0807C850: .4byte gNonGameplayRam
_0807C854: .4byte 0x00000265
_0807C858:
	ldr r1, _0807C874 @ =0x02002000
	ldr r2, _0807C878 @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C87C @ =gNonGameplayRam
	ldr r3, _0807C880 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807C874: .4byte 0x02002000
_0807C878: .4byte 0x06006000
_0807C87C: .4byte gNonGameplayRam
_0807C880: .4byte 0x00000265
_0807C884:
	ldr r1, _0807C898 @ =0x02003000
	ldr r2, _0807C89C @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807C898: .4byte 0x02003000
_0807C89C: .4byte 0x06007000
_0807C8A0:
	ldr r1, _0807C8BC @ =0x02004000
	ldr r2, _0807C8C0 @ =0x06008000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C8C4 @ =gNonGameplayRam
	ldr r2, _0807C8C8 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807C8BC: .4byte 0x02004000
_0807C8C0: .4byte 0x06008000
_0807C8C4: .4byte gNonGameplayRam
_0807C8C8: .4byte 0x00000265
_0807C8CC:
	ldr r1, _0807C8F8 @ =0x02005000
	ldr r2, _0807C8FC @ =0x06009000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r4, #0x10
	str r4, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r2, _0807C900 @ =gNonGameplayRam
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	cmp r0, #0x35
	bne _0807C908
	ldr r0, _0807C904 @ =0x00000265
	adds r1, r2, r0
	movs r0, #0xd
	strb r0, [r1]
	b _0807CE56
	.align 2, 0
_0807C8F8: .4byte 0x02005000
_0807C8FC: .4byte 0x06009000
_0807C900: .4byte gNonGameplayRam
_0807C904: .4byte 0x00000265
_0807C908:
	ldr r1, _0807C918 @ =gWrittenToBldalpha_L
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0807C91C @ =gWrittenToBldalpha_R
	strh r4, [r0]
	ldr r3, _0807C920 @ =0x00000265
	adds r1, r2, r3
	b _0807CDEE
	.align 2, 0
_0807C918: .4byte gWrittenToBldalpha_L
_0807C91C: .4byte gWrittenToBldalpha_R
_0807C920: .4byte 0x00000265
_0807C924:
	ldr r1, _0807C938 @ =0x02006000
	ldr r2, _0807C93C @ =0x0600A000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807C938: .4byte 0x02006000
_0807C93C: .4byte 0x0600A000
_0807C940:
	ldr r1, _0807C960 @ =0x02007000
	ldr r2, _0807C964 @ =0x0600B000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r0, _0807C968 @ =gNonGameplayRam
	ldr r1, _0807C96C @ =0x00000265
	adds r0, r0, r1
	movs r1, #0x15
	strb r1, [r0]
	b _0807CE56
	.align 2, 0
_0807C960: .4byte 0x02007000
_0807C964: .4byte 0x0600B000
_0807C968: .4byte gNonGameplayRam
_0807C96C: .4byte 0x00000265
_0807C970:
	ldr r1, _0807C98C @ =0x02006000
	ldr r2, _0807C990 @ =0x0600A000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C994 @ =gNonGameplayRam
	ldr r2, _0807C998 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807C98C: .4byte 0x02006000
_0807C990: .4byte 0x0600A000
_0807C994: .4byte gNonGameplayRam
_0807C998: .4byte 0x00000265
_0807C99C:
	ldr r1, _0807C9B8 @ =0x02007000
	ldr r2, _0807C9BC @ =0x0600B000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807C9C0 @ =gNonGameplayRam
	ldr r3, _0807C9C4 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807C9B8: .4byte 0x02007000
_0807C9BC: .4byte 0x0600B000
_0807C9C0: .4byte gNonGameplayRam
_0807C9C4: .4byte 0x00000265
_0807C9C8:
	ldr r1, _0807C9E0 @ =0x040000D4
	ldr r0, _0807C9E4 @ =0x0857BEC4
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0807C9E8 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0807C9EC @ =PauseScreenVBLank_Unused
	b _0807CDE4
	.align 2, 0
_0807C9E0: .4byte 0x040000D4
_0807C9E4: .4byte 0x0857BEC4
_0807C9E8: .4byte 0x80000100
_0807C9EC: .4byte PauseScreenVBLank_Unused
_0807C9F0:
	ldr r1, _0807CA08 @ =0x0300000A
	ldr r2, _0807CA0C @ =0x00001407
	adds r0, r2, #0
	strh r0, [r1]
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r4, r3
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #4
	b _0807CB7C
	.align 2, 0
_0807CA08: .4byte 0x0300000A
_0807CA0C: .4byte 0x00001407
_0807CA10:
	ldr r3, _0807CA3C @ =0x00000266
	adds r2, r4, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CA40 @ =0x0879C17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bhi _0807CA28
	b _0807CE56
_0807CA28:
	ldr r1, _0807CA44 @ =0x0300000A
	ldr r3, _0807CA48 @ =0x00001507
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0807CA4C @ =0x00000265
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807CC38
	.align 2, 0
_0807CA3C: .4byte 0x00000266
_0807CA40: .4byte 0x0879C17C
_0807CA44: .4byte 0x0300000A
_0807CA48: .4byte 0x00001507
_0807CA4C: .4byte 0x00000265
_0807CA50:
	ldr r1, _0807CA7C @ =0x00000266
	adds r2, r4, r1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CA80 @ =0x0879C17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0807CA68
	b _0807CE56
_0807CA68:
	ldr r1, _0807CA84 @ =0x0300000A
	ldr r3, _0807CA88 @ =0x00001607
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0807CA8C @ =0x00000265
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807CC38
	.align 2, 0
_0807CA7C: .4byte 0x00000266
_0807CA80: .4byte 0x0879C17C
_0807CA84: .4byte 0x0300000A
_0807CA88: .4byte 0x00001607
_0807CA8C: .4byte 0x00000265
_0807CA90:
	ldr r1, _0807CABC @ =0x00000266
	adds r2, r4, r1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CAC0 @ =0x0879C17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #2]
	cmp r0, r1
	bhi _0807CAA8
	b _0807CE56
_0807CAA8:
	ldr r1, _0807CAC4 @ =0x0300000A
	ldr r3, _0807CAC8 @ =0x00001707
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0807CACC @ =0x00000265
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807CC38
	.align 2, 0
_0807CABC: .4byte 0x00000266
_0807CAC0: .4byte 0x0879C17C
_0807CAC4: .4byte 0x0300000A
_0807CAC8: .4byte 0x00001707
_0807CACC: .4byte 0x00000265
_0807CAD0:
	ldr r1, _0807CAF0 @ =0x00000266
	adds r2, r4, r1
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CAF4 @ =0x0879C17C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #3]
	cmp r0, r1
	bhi _0807CAE8
	b _0807CE56
_0807CAE8:
	ldr r3, _0807CAF8 @ =0x00000265
	adds r0, r4, r3
	b _0807CC34
	.align 2, 0
_0807CAF0: .4byte 0x00000266
_0807CAF4: .4byte 0x0879C17C
_0807CAF8: .4byte 0x00000265
_0807CAFC:
	ldr r0, _0807CB10 @ =0x087338C0
	ldr r1, _0807CB14 @ =0x06007800
	bl LZ77UncompVram
	ldr r0, _0807CB18 @ =0x08733D58
	ldr r1, _0807CB1C @ =0x0600B800
	bl LZ77UncompVram
	b _0807CDE8
	.align 2, 0
_0807CB10: .4byte 0x087338C0
_0807CB14: .4byte 0x06007800
_0807CB18: .4byte 0x08733D58
_0807CB1C: .4byte 0x0600B800
_0807CB20:
	ldr r1, _0807CB40 @ =0x040000D4
	ldr r0, _0807CB44 @ =0x0872F0E0
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0807CB48 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0807CB4C @ =PauseScreenVBLank_Unused
	bl CallbackSetVBlank
	ldr r1, _0807CB50 @ =gNonGameplayRam
	ldr r2, _0807CB54 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807CB40: .4byte 0x040000D4
_0807CB44: .4byte 0x0872F0E0
_0807CB48: .4byte 0x80000100
_0807CB4C: .4byte PauseScreenVBLank_Unused
_0807CB50: .4byte gNonGameplayRam
_0807CB54: .4byte 0x00000265
_0807CB58:
	ldr r1, _0807CB98 @ =0x0400000C
	ldr r3, _0807CB9C @ =0x00000F06
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0807CBA0 @ =0x00001707
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	ldr r3, _0807CBA4 @ =0x00000844
	adds r0, r3, #0
	strh r0, [r1]
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrh r1, [r2]
	movs r3, #0xc0
	lsls r3, r3, #4
_0807CB7C:
	adds r0, r3, #0
	movs r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0807CBA8 @ =0x00000265
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807CBAC @ =0x00000266
	adds r0, r4, r1
	strb r3, [r0]
	b _0807CE56
	.align 2, 0
_0807CB98: .4byte 0x0400000C
_0807CB9C: .4byte 0x00000F06
_0807CBA0: .4byte 0x00001707
_0807CBA4: .4byte 0x00000844
_0807CBA8: .4byte 0x00000265
_0807CBAC: .4byte 0x00000266
_0807CBB0:
	ldr r3, _0807CBD4 @ =0x00000266
	adds r2, r4, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CBD8 @ =0x0873421C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	cmp r0, r1
	bhi _0807CBC8
	b _0807CE56
_0807CBC8:
	ldr r1, _0807CBDC @ =0x00000265
	adds r0, r4, r1
	ldrb r1, [r0]
	adds r1, #1
	b _0807CC36
	.align 2, 0
_0807CBD4: .4byte 0x00000266
_0807CBD8: .4byte 0x0873421C
_0807CBDC: .4byte 0x00000265
_0807CBE0:
	ldr r1, _0807CBF8 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	adds r2, r0, #0
	cmp r2, #0
	bne _0807CC04
	ldr r3, _0807CBFC @ =0x00000265
	adds r0, r4, r3
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldr r1, _0807CC00 @ =0x00000266
	b _0807CE52
	.align 2, 0
_0807CBF8: .4byte gWrittenToBldalpha_R
_0807CBFC: .4byte 0x00000265
_0807CC00: .4byte 0x00000266
_0807CC04:
	subs r0, #1
	strh r0, [r1]
	ldr r2, _0807CC14 @ =gWrittenToBldalpha_L
	movs r1, #0x10
	subs r1, r1, r0
	strh r1, [r2]
	b _0807CE56
	.align 2, 0
_0807CC14: .4byte gWrittenToBldalpha_L
_0807CC18:
	ldr r3, _0807CC40 @ =0x00000266
	adds r2, r4, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, _0807CC44 @ =0x0873421C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #1]
	cmp r0, r1
	bhi _0807CC30
	b _0807CE56
_0807CC30:
	ldr r1, _0807CC48 @ =0x00000265
	adds r0, r4, r1
_0807CC34:
	movs r1, #0x1b
_0807CC36:
	strb r1, [r0]
_0807CC38:
	movs r0, #0
	strb r0, [r2]
	b _0807CE56
	.align 2, 0
_0807CC40: .4byte 0x00000266
_0807CC44: .4byte 0x0873421C
_0807CC48: .4byte 0x00000265
_0807CC4C:
	movs r2, #0x9a
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	ldr r3, _0807CC68 @ =0x00000265
	adds r1, r4, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, _0807CC6C @ =0x00000266
	b _0807CE52
	.align 2, 0
_0807CC68: .4byte 0x00000265
_0807CC6C: .4byte 0x00000266
_0807CC70:
	ldr r1, _0807CC8C @ =0x08561FA8
	ldr r2, _0807CC90 @ =0x06008000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CC94 @ =gNonGameplayRam
	ldr r2, _0807CC98 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807CC8C: .4byte 0x08561FA8
_0807CC90: .4byte 0x06008000
_0807CC94: .4byte gNonGameplayRam
_0807CC98: .4byte 0x00000265
_0807CC9C:
	ldr r1, _0807CCB8 @ =0x08562FA8
	ldr r2, _0807CCBC @ =0x06009000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CCC0 @ =gNonGameplayRam
	ldr r3, _0807CCC4 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807CCB8: .4byte 0x08562FA8
_0807CCBC: .4byte 0x06009000
_0807CCC0: .4byte gNonGameplayRam
_0807CCC4: .4byte 0x00000265
_0807CCC8:
	ldr r1, _0807CCDC @ =0x08563FA8
	ldr r2, _0807CCE0 @ =0x0600A000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807CCDC: .4byte 0x08563FA8
_0807CCE0: .4byte 0x0600A000
_0807CCE4:
	ldr r1, _0807CD10 @ =0x08564FA8
	ldr r2, _0807CD14 @ =0x0600B000
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CD18 @ =0x040000D4
	ldr r0, _0807CD1C @ =0x06009800
	str r0, [r1]
	ldr r0, _0807CD20 @ =0x06009400
	str r0, [r1, #4]
	ldr r0, _0807CD24 @ =0x80000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0807CD28 @ =gNonGameplayRam
	ldr r2, _0807CD2C @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807CD10: .4byte 0x08564FA8
_0807CD14: .4byte 0x0600B000
_0807CD18: .4byte 0x040000D4
_0807CD1C: .4byte 0x06009800
_0807CD20: .4byte 0x06009400
_0807CD24: .4byte 0x80000200
_0807CD28: .4byte gNonGameplayRam
_0807CD2C: .4byte 0x00000265
_0807CD30:
	ldr r1, _0807CD4C @ =0x02008000
	ldr r2, _0807CD50 @ =0x06004000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CD54 @ =gNonGameplayRam
	ldr r3, _0807CD58 @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807CD4C: .4byte 0x02008000
_0807CD50: .4byte 0x06004000
_0807CD54: .4byte gNonGameplayRam
_0807CD58: .4byte 0x00000265
_0807CD5C:
	ldr r1, _0807CD70 @ =0x02009000
	ldr r2, _0807CD74 @ =0x06005000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807CDE8
	.align 2, 0
_0807CD70: .4byte 0x02009000
_0807CD74: .4byte 0x06005000
_0807CD78:
	ldr r1, _0807CD94 @ =0x0200A000
	ldr r2, _0807CD98 @ =0x06006000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CD9C @ =gNonGameplayRam
	ldr r2, _0807CDA0 @ =0x00000265
	adds r1, r1, r2
	b _0807CDEE
	.align 2, 0
_0807CD94: .4byte 0x0200A000
_0807CD98: .4byte 0x06006000
_0807CD9C: .4byte gNonGameplayRam
_0807CDA0: .4byte 0x00000265
_0807CDA4:
	ldr r1, _0807CDC0 @ =0x0200B000
	ldr r2, _0807CDC4 @ =0x06007000
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r1, _0807CDC8 @ =gNonGameplayRam
	ldr r3, _0807CDCC @ =0x00000265
	adds r1, r1, r3
	b _0807CDEE
	.align 2, 0
_0807CDC0: .4byte 0x0200B000
_0807CDC4: .4byte 0x06007000
_0807CDC8: .4byte gNonGameplayRam
_0807CDCC: .4byte 0x00000265
_0807CDD0:
	ldr r1, _0807CDF8 @ =0x040000D4
	ldr r0, _0807CDFC @ =0x02035000
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0807CE00 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0807CE04 @ =PauseScreenVBLank
_0807CDE4:
	bl CallbackSetVBlank
_0807CDE8:
	ldr r1, _0807CE08 @ =gNonGameplayRam
	ldr r0, _0807CE0C @ =0x00000265
	adds r1, r1, r0
_0807CDEE:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0807CE56
	.align 2, 0
_0807CDF8: .4byte 0x040000D4
_0807CDFC: .4byte 0x02035000
_0807CE00: .4byte 0x80000100
_0807CE04: .4byte PauseScreenVBLank
_0807CE08: .4byte gNonGameplayRam
_0807CE0C: .4byte 0x00000265
_0807CE10:
	ldr r1, _0807CE60 @ =0x0400000E
	movs r2, #0x9b
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #2
	ldr r3, _0807CE64 @ =0x0000026E
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #0x44
	adds r2, #4
	adds r0, r4, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	adds r3, #4
	adds r0, r4, r3
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807CE68 @ =0x0000026A
	adds r0, r4, r1
	ldrh r1, [r0]
	subs r2, #8
	adds r0, r4, r2
	movs r2, #0
	strh r1, [r0]
	subs r3, #0xd
	adds r0, r4, r3
	strb r2, [r0]
	movs r1, #0x99
	lsls r1, r1, #2
_0807CE52:
	adds r0, r4, r1
	strb r2, [r0]
_0807CE56:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807CE60: .4byte 0x0400000E
_0807CE64: .4byte 0x0000026E
_0807CE68: .4byte 0x0000026A

	thumb_func_start unk_7ce6c
unk_7ce6c: @ 0x0807CE6C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _0807CEBC @ =gCurrentArea
	ldrb r0, [r3]
	cmp r0, #6
	bls _0807CE7A
	b _0807CF8A
_0807CE7A:
	ldr r2, _0807CEC0 @ =gNonGameplayRam
	movs r0, #0x90
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _0807CEC4 @ =0x08581500
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldrb r0, [r2]
	adds r6, r2, #0
	cmp r0, #0
	beq _0807CF8A
	ldr r0, _0807CEC8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _0807CF8A
	ldrb r0, [r3]
	cmp r0, #0
	beq _0807CED4
	ldr r2, _0807CECC @ =0x0857607D
	ldr r1, _0807CED0 @ =0x08576073
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r2, #0x91
	lsls r2, r2, #2
	adds r0, r6, r2
	b _0807CEDE
	.align 2, 0
_0807CEBC: .4byte gCurrentArea
_0807CEC0: .4byte gNonGameplayRam
_0807CEC4: .4byte 0x08581500
_0807CEC8: .4byte gPauseScreenFlag
_0807CECC: .4byte 0x0857607D
_0807CED0: .4byte 0x08576073
_0807CED4:
	ldr r0, _0807CF48 @ =0x0857607D
	ldrb r1, [r0, #7]
	movs r4, #0x91
	lsls r4, r4, #2
	adds r0, r6, r4
_0807CEDE:
	strb r1, [r0]
	ldr r1, _0807CF4C @ =0x0879C180
	movs r5, #0x91
	lsls r5, r5, #2
	adds r0, r6, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r6, #0
	adds r1, #0xc6
	strb r0, [r1]
	subs r1, #8
	movs r0, #0x1c
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x32
	strh r0, [r1]
	adds r2, r6, #0
	adds r2, #0xc7
	ldrb r1, [r2]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	movs r0, #0xa
	movs r1, #0
	bl UpdateMenuOamDataID
	adds r1, r6, #0
	adds r1, #0xaf
	ldrb r0, [r1]
	ands r4, r0
	orrs r4, r5
	strb r4, [r1]
	ldr r2, _0807CF50 @ =gCurrentArea
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807CF5C
	ldr r1, _0807CF54 @ =0x08576073
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r2, _0807CF58 @ =0x00000249
	adds r0, r6, r2
	b _0807CF6C
	.align 2, 0
_0807CF48: .4byte 0x0857607D
_0807CF4C: .4byte 0x0879C180
_0807CF50: .4byte gCurrentArea
_0807CF54: .4byte 0x08576073
_0807CF58: .4byte 0x00000249
_0807CF5C:
	ldr r1, _0807CF94 @ =0x085760E8
	ldr r0, _0807CF98 @ =gCurrentRoom
	ldrb r0, [r0]
	adds r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r4, _0807CF9C @ =0x00000249
	adds r0, r6, r4
_0807CF6C:
	strb r1, [r0]
	bl unk_7d27c
	mov r1, sp
	ldr r5, _0807CFA0 @ =0x00007A73
	adds r0, r5, #0
	strh r0, [r1]
	ldr r1, _0807CFA4 @ =0x040000D4
	mov r6, sp
	str r6, [r1]
	ldr r0, _0807CFA8 @ =0x05000342
	str r0, [r1, #4]
	ldr r0, _0807CFAC @ =0x8100000C
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0807CF8A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CF94: .4byte 0x085760E8
_0807CF98: .4byte gCurrentRoom
_0807CF9C: .4byte 0x00000249
_0807CFA0: .4byte 0x00007A73
_0807CFA4: .4byte 0x040000D4
_0807CFA8: .4byte 0x05000342
_0807CFAC: .4byte 0x8100000C

	thumb_func_start unk_7cfb0
unk_7cfb0: @ 0x0807CFB0
	push {r4, lr}
	ldr r1, _0807D034 @ =gNonGameplayRam
	ldrb r0, [r1]
	mov ip, r1
	cmp r0, #0
	bne _0807CFBE
	b _0807D270
_0807CFBE:
	ldr r0, _0807D038 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _0807CFCC
	b _0807D270
_0807CFCC:
	movs r1, #0x92
	lsls r1, r1, #2
	add r1, ip
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0807D014
	strb r2, [r1]
	ldr r3, _0807D03C @ =0x00000247
	add r3, ip
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _0807CFF8
	strb r2, [r3]
_0807CFF8:
	ldr r0, _0807D040 @ =0x00000249
	add r0, ip
	ldrb r4, [r0]
	lsls r1, r4, #1
	ldr r0, _0807D044 @ =0x05000340
	adds r1, r1, r0
	ldr r2, _0807D048 @ =0x08581300
	ldrb r0, [r3]
	lsls r0, r0, #4
	adds r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
_0807D014:
	ldr r1, _0807D04C @ =0x0000024A
	add r1, ip
	ldrb r0, [r1]
	cmp r0, #2
	bne _0807D050
	movs r0, #3
	strb r0, [r1]
	mov r1, ip
	adds r1, #0xa6
	movs r0, #0x1c
	strh r0, [r1]
	subs r1, #2
	movs r0, #0x32
	strh r0, [r1]
	b _0807D0DA
	.align 2, 0
_0807D034: .4byte gNonGameplayRam
_0807D038: .4byte gPauseScreenFlag
_0807D03C: .4byte 0x00000247
_0807D040: .4byte 0x00000249
_0807D044: .4byte 0x05000340
_0807D048: .4byte 0x08581300
_0807D04C: .4byte 0x0000024A
_0807D050:
	cmp r0, #3
	bne _0807D0DA
	ldr r0, _0807D090 @ =0x0857608A
	ldr r1, _0807D094 @ =0x0300004C
	ldrb r1, [r1]
	adds r0, r1, r0
	movs r4, #0
	ldrsb r4, [r0, r4]
	cmp r4, #0
	blt _0807D09C
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r4, r4, r0
	cmp r4, #0x23
	ble _0807D078
	subs r4, #0x24
_0807D078:
	mov r1, ip
	adds r1, #0xbe
	ldr r3, _0807D098 @ =0x0879C1A4
	lsls r2, r4, #1
	adds r2, r2, r4
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0807D0B2
	.align 2, 0
_0807D090: .4byte 0x0857608A
_0807D094: .4byte 0x0300004C
_0807D098: .4byte 0x0879C1A4
_0807D09C:
	mov r4, ip
	adds r4, #0xbe
	ldr r3, _0807D108 @ =0x0879C210
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r0, r2, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r4, [r4]
	adds r0, r0, r4
_0807D0B2:
	mov r1, ip
	adds r1, #0xa6
	strh r0, [r1]
	adds r1, #0x16
	adds r0, r3, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r1, [r1]
	adds r0, r0, r1
	mov r1, ip
	adds r1, #0xa4
	strh r0, [r1]
	adds r3, #2
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #0x16
	adds r1, #0xa
	strb r0, [r1]
_0807D0DA:
	movs r2, #0x90
	lsls r2, r2, #2
	add r2, ip
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807D0E8
	b _0807D270
_0807D0E8:
	ldr r0, _0807D10C @ =0x00000242
	add r0, ip
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	subs r0, #1
	cmp r0, #5
	bls _0807D0FC
	b _0807D270
_0807D0FC:
	lsls r0, r0, #2
	ldr r1, _0807D110 @ =_0807D114
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807D108: .4byte 0x0879C210
_0807D10C: .4byte 0x00000242
_0807D110: .4byte _0807D114
_0807D114: @ jump table
	.4byte _0807D12C @ case 0
	.4byte _0807D142 @ case 1
	.4byte _0807D164 @ case 2
	.4byte _0807D19C @ case 3
	.4byte _0807D1C4 @ case 4
	.4byte _0807D1EC @ case 5
_0807D12C:
	mov r0, ip
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0807D13C
	b _0807D270
_0807D13C:
	movs r1, #0x90
	lsls r1, r1, #2
	b _0807D1DE
_0807D142:
	mov r0, ip
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0807D152
	b _0807D270
_0807D152:
	ldr r1, _0807D160 @ =0x0000024A
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	movs r1, #0x90
	lsls r1, r1, #2
	b _0807D1B6
	.align 2, 0
_0807D160: .4byte 0x0000024A
_0807D164:
	ldr r1, _0807D194 @ =0x00000242
	add r1, ip
	ldrb r0, [r1]
	cmp r0, #8
	bhi _0807D170
	b _0807D270
_0807D170:
	movs r3, #0
	strb r3, [r1]
	movs r2, #0x91
	lsls r2, r2, #2
	add r2, ip
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x23
	ble _0807D18A
	strb r3, [r2]
_0807D18A:
	ldr r1, _0807D198 @ =0x0879C180
	movs r0, #0
	ldrsb r0, [r2, r0]
	b _0807D266
	.align 2, 0
_0807D194: .4byte 0x00000242
_0807D198: .4byte 0x0879C180
_0807D19C:
	mov r0, ip
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0807D270
	movs r1, #0x90
	lsls r1, r1, #2
	add r1, ip
	movs r0, #5
	strb r0, [r1]
	ldr r1, _0807D1C0 @ =0x00000241
_0807D1B6:
	add r1, ip
	movs r0, #1
	strb r0, [r1]
	b _0807D270
	.align 2, 0
_0807D1C0: .4byte 0x00000241
_0807D1C4:
	mov r0, ip
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0807D270
	movs r1, #0x90
	lsls r1, r1, #2
	add r1, ip
	movs r0, #6
	strb r0, [r1]
	ldr r1, _0807D1E8 @ =0x0000024A
_0807D1DE:
	add r1, ip
	movs r0, #2
	strb r0, [r1]
	b _0807D270
	.align 2, 0
_0807D1E8: .4byte 0x0000024A
_0807D1EC:
	movs r2, #0x91
	lsls r2, r2, #2
	add r2, ip
	ldr r0, _0807D21C @ =0x00000245
	add r0, ip
	ldrb r4, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0807D224
	movs r1, #0x90
	lsls r1, r1, #2
	add r1, ip
	movs r2, #0
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0807D220 @ =0x00000241
	add r0, ip
	strb r2, [r0]
	b _0807D270
	.align 2, 0
_0807D21C: .4byte 0x00000245
_0807D220: .4byte 0x00000241
_0807D224:
	ldr r1, _0807D248 @ =0x00000242
	add r1, ip
	ldrb r0, [r1]
	cmp r0, #8
	bls _0807D270
	movs r3, #0
	strb r3, [r1]
	ldr r0, _0807D24C @ =0x00000246
	add r0, ip
	ldrb r0, [r0]
	adds r0, r4, r0
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x23
	ble _0807D250
	strb r3, [r2]
	b _0807D258
	.align 2, 0
_0807D248: .4byte 0x00000242
_0807D24C: .4byte 0x00000246
_0807D250:
	cmp r0, #0
	bge _0807D258
	movs r0, #0x23
	strb r0, [r2]
_0807D258:
	ldr r1, _0807D278 @ =0x0879C180
	movs r0, #0x91
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0807D266:
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r0, ip
	adds r0, #0xc6
	strb r1, [r0]
_0807D270:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D278: .4byte 0x0879C180

	thumb_func_start unk_7d27c
unk_7d27c: @ 0x0807D27C
	push {r4, r5, lr}
	ldr r0, _0807D294 @ =0x0300004C
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _0807D29C
	ldr r0, _0807D298 @ =gNonGameplayRam
	movs r2, #0x90
	lsls r2, r2, #2
	adds r0, r0, r2
	b _0807D33E
	.align 2, 0
_0807D294: .4byte 0x0300004C
_0807D298: .4byte gNonGameplayRam
_0807D29C:
	ldr r0, _0807D2C4 @ =gNonGameplayRam
	movs r2, #0x90
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r4, #1
	strb r4, [r1]
	subs r2, #0x20
	adds r1, r0, r2
	ldr r2, _0807D2C8 @ =gPreviousNavigationConversation
	ldrb r1, [r1]
	adds r3, r0, #0
	ldrb r2, [r2]
	cmp r1, r2
	bne _0807D2D0
	ldr r0, _0807D2CC @ =0x0000024A
	adds r1, r3, r0
	movs r0, #2
	strb r0, [r1]
	b _0807D2D6
	.align 2, 0
_0807D2C4: .4byte gNonGameplayRam
_0807D2C8: .4byte gPreviousNavigationConversation
_0807D2CC: .4byte 0x0000024A
_0807D2D0:
	ldr r1, _0807D324 @ =0x0000024A
	adds r0, r3, r1
	strb r4, [r0]
_0807D2D6:
	ldr r1, _0807D328 @ =0x0857607D
	ldrb r0, [r5]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	blt _0807D340
	ldr r0, _0807D32C @ =0x00000245
	adds r5, r3, r0
	strb r1, [r5]
	movs r1, #0x91
	lsls r1, r1, #2
	adds r4, r3, r1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r2, r0
	beq _0807D340
	movs r2, #0x90
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #4
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	subs r1, r1, r0
	movs r0, #1
	cmp r1, #0
	bge _0807D316
	subs r0, #2
_0807D316:
	muls r1, r0, r1
	cmp r1, #0x12
	ble _0807D330
	movs r1, #1
	rsbs r1, r1, #0
	b _0807D338
	.align 2, 0
_0807D324: .4byte 0x0000024A
_0807D328: .4byte 0x0857607D
_0807D32C: .4byte 0x00000245
_0807D330:
	cmp r1, #0x12
	bne _0807D336
	movs r0, #1
_0807D336:
	movs r1, #1
_0807D338:
	muls r1, r0, r1
	ldr r2, _0807D348 @ =0x00000246
	adds r0, r3, r2
_0807D33E:
	strb r1, [r0]
_0807D340:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807D348: .4byte 0x00000246

	thumb_func_start DebugMenuSubroutine
DebugMenuSubroutine: @ 0x0807D34C
	push {r4, lr}
	ldr r2, _0807D378 @ =gChangedInput
	ldrh r1, [r2]
	ldr r0, _0807D37C @ =0x00000302
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	beq _0807D384
	ldr r2, _0807D380 @ =gNonGameplayRam
	ldrb r3, [r2, #7]
	cmp r3, #0
	bne _0807D384
	adds r0, r2, #0
	adds r0, #0x28
	movs r1, #7
	strb r1, [r0]
	strb r3, [r2, #6]
	strb r3, [r2, #7]
	adds r0, #0xe
	strb r3, [r0]
	b _0807D3AE
	.align 2, 0
_0807D378: .4byte gChangedInput
_0807D37C: .4byte 0x00000302
_0807D380: .4byte gNonGameplayRam
_0807D384:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0807D38E
	bl DebugMenuModifyValues
_0807D38E:
	ldr r0, _0807D3B4 @ =gNonGameplayRam
	movs r1, #0xa1
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r4, _0807D3B8 @ =gInGameTimer
	ldrb r0, [r0]
	ldrb r1, [r4, #1]
	cmp r0, r1
	beq _0807D3A4
	bl DebugMenuDrawIgt
_0807D3A4:
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _0807D3AE
	bl unk_7e224
_0807D3AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807D3B4: .4byte gNonGameplayRam
_0807D3B8: .4byte gInGameTimer

	thumb_func_start DebugMenuModifyValues
DebugMenuModifyValues: @ 0x0807D3BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _0807D470 @ =gNonGameplayRam
	movs r3, #0x2c
	ldrsh r2, [r1, r3]
	mov ip, r1
	cmp r2, #0
	bge _0807D3D6
	adds r2, #7
_0807D3D6:
	asrs r5, r2, #3
	mov r2, ip
	movs r3, #0x2e
	ldrsh r1, [r2, r3]
	cmp r1, #0
	bge _0807D3E4
	adds r1, #7
_0807D3E4:
	asrs r4, r1, #3
	movs r7, #0
	movs r1, #0
	mov sl, r1
	ldr r6, _0807D474 @ =0x0858211C
	adds r3, r6, #0
	movs r2, #0
	adds r1, r6, #1
	mov sb, r1
	adds r1, r6, #2
	mov r8, r1
_0807D3FA:
	ldrb r1, [r3]
	cmp r1, r5
	bgt _0807D41A
	mov r1, sb
	adds r1, r2, r1
	ldrb r1, [r1]
	cmp r1, r5
	blt _0807D41A
	mov r1, r8
	adds r1, r2, r1
	ldrb r1, [r1]
	cmp r1, r4
	bgt _0807D41A
	ldrb r1, [r3, #3]
	cmp r1, r4
	bge _0807D480
_0807D41A:
	adds r3, #5
	adds r2, #5
	movs r1, #1
	add sl, r1
	mov r1, sl
	cmp r1, #0x12
	ble _0807D3FA
	cmp r7, #0
	bne _0807D42E
	b _0807DB22
_0807D42E:
	mov r2, sl
	lsls r1, r2, #2
	adds r2, r1, r2
	adds r3, r6, #4
	adds r2, r2, r3
	ldrb r2, [r2]
	mov r8, r2
	mov sb, r1
	cmp r2, #0xf
	beq _0807D484
	ldr r1, _0807D478 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #2
	ands r1, r2
	cmp r1, #0
	beq _0807D484
	mov r3, ip
	ldrb r1, [r3, #7]
	cmp r1, #0
	beq _0807D484
	movs r4, #0
	strb r4, [r3, #7]
	movs r0, #0
	movs r1, #1
	bl UpdateMenuOamDataID
	mov r5, r8
	cmp r5, #0x11
	beq _0807D46A
	b _0807DB22
_0807D46A:
	ldr r1, _0807D47C @ =gMaxInGameTimeFlag
	strb r4, [r1]
	b _0807DB22
	.align 2, 0
_0807D470: .4byte gNonGameplayRam
_0807D474: .4byte 0x0858211C
_0807D478: .4byte gChangedInput
_0807D47C: .4byte gMaxInGameTimeFlag
_0807D480:
	movs r7, #1
	b _0807D42E
_0807D484:
	mov r2, sb
	add r2, sl
	adds r1, r2, r6
	ldrb r1, [r1]
	subs r5, r5, r1
	adds r1, r6, #3
	adds r1, r2, r1
	ldrb r1, [r1]
	subs r4, r1, r4
	adds r1, r6, #4
	adds r2, r2, r1
	ldrb r1, [r2]
	cmp r1, #0x12
	bls _0807D4A2
	b _0807DAD8
_0807D4A2:
	lsls r1, r1, #2
	ldr r2, _0807D4AC @ =_0807D4B0
	adds r1, r1, r2
	ldr r1, [r1]
	mov pc, r1
	.align 2, 0
_0807D4AC: .4byte _0807D4B0
_0807D4B0: @ jump table
	.4byte _0807D4FC @ case 0
	.4byte _0807D528 @ case 1
	.4byte _0807D554 @ case 2
	.4byte _0807D580 @ case 3
	.4byte _0807D5A0 @ case 4
	.4byte _0807D5D4 @ case 5
	.4byte _0807D5D4 @ case 6
	.4byte _0807DAD8 @ case 7
	.4byte _0807D5D4 @ case 8
	.4byte _0807D5D4 @ case 9
	.4byte _0807D5D4 @ case 10
	.4byte _0807D5D4 @ case 11
	.4byte _0807D61C @ case 12
	.4byte _0807D65C @ case 13
	.4byte _0807D6A0 @ case 14
	.4byte _0807D6DC @ case 15
	.4byte _0807D88C @ case 16
	.4byte _0807D96C @ case 17
	.4byte _0807DAA0 @ case 18
_0807D4FC:
	ldr r1, _0807D51C @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	bne _0807D50A
	b _0807DADA
_0807D50A:
	ldr r4, _0807D520 @ =gEquipment
	ldr r1, _0807D524 @ =0x08576168
	adds r1, r5, r1
	ldrb r2, [r4, #0xa]
	ldrb r1, [r1]
	eors r2, r1
	movs r3, #0
	strb r2, [r4, #0xa]
	b _0807D5BE
	.align 2, 0
_0807D51C: .4byte gChangedInput
_0807D520: .4byte gEquipment
_0807D524: .4byte 0x08576168
_0807D528:
	ldr r1, _0807D548 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	bne _0807D536
	b _0807DADA
_0807D536:
	ldr r4, _0807D54C @ =gEquipment
	ldr r1, _0807D550 @ =0x0857616D
	adds r1, r5, r1
	ldrb r2, [r4, #0xb]
	ldrb r1, [r1]
	eors r2, r1
	movs r3, #0
	strb r2, [r4, #0xb]
	b _0807D5BE
	.align 2, 0
_0807D548: .4byte gChangedInput
_0807D54C: .4byte gEquipment
_0807D550: .4byte 0x0857616D
_0807D554:
	ldr r1, _0807D574 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	bne _0807D562
	b _0807DADA
_0807D562:
	ldr r4, _0807D578 @ =gEquipment
	ldr r1, _0807D57C @ =0x08576171
	adds r1, r5, r1
	ldrb r2, [r4, #0xb]
	ldrb r1, [r1]
	eors r2, r1
	movs r3, #0
	strb r2, [r4, #0xb]
	b _0807D5BE
	.align 2, 0
_0807D574: .4byte gChangedInput
_0807D578: .4byte gEquipment
_0807D57C: .4byte 0x08576171
_0807D580:
	ldr r1, _0807D594 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	bne _0807D58E
	b _0807DADA
_0807D58E:
	ldr r4, _0807D598 @ =gEquipment
	ldr r1, _0807D59C @ =0x08576173
	b _0807D5B2
	.align 2, 0
_0807D594: .4byte gChangedInput
_0807D598: .4byte gEquipment
_0807D59C: .4byte 0x08576173
_0807D5A0:
	ldr r1, _0807D5C4 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	bne _0807D5AE
	b _0807DADA
_0807D5AE:
	ldr r4, _0807D5C8 @ =gEquipment
	ldr r1, _0807D5CC @ =0x08576175
_0807D5B2:
	adds r1, r5, r1
	ldrb r2, [r4, #0xc]
	ldrb r1, [r1]
	eors r2, r1
	movs r3, #0
	strb r2, [r4, #0xc]
_0807D5BE:
	ldr r1, _0807D5D0 @ =gAbilityCount
	strb r3, [r1]
	b _0807DADA
	.align 2, 0
_0807D5C4: .4byte gChangedInput
_0807D5C8: .4byte gEquipment
_0807D5CC: .4byte 0x08576175
_0807D5D0: .4byte gAbilityCount
_0807D5D4:
	movs r7, #0
	ldr r1, _0807D618 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _0807D5F0
	mov r2, ip
	adds r2, #0x36
	movs r1, #9
	strb r1, [r2]
	movs r1, #1
	mov r2, ip
	strb r1, [r2, #7]
_0807D5F0:
	mov r3, ip
	ldrb r1, [r3, #7]
	cmp r1, #0
	bne _0807D5FA
	b _0807DADA
_0807D5FA:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	mov r1, sb
	add r1, sl
	adds r2, r6, #4
	adds r1, r1, r2
	ldrb r1, [r1]
	bl DebugMenuModifyHealthAndAmmo
	adds r1, r0, #0
	cmp r1, #0
	bne _0807D614
	b _0807DADA
_0807D614:
	movs r7, #2
	b _0807DADA
	.align 2, 0
_0807D618: .4byte gChangedInput
_0807D61C:
	movs r7, #0
	ldr r1, _0807D658 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _0807D638
	mov r2, ip
	adds r2, #0x36
	movs r1, #9
	strb r1, [r2]
	movs r1, #1
	mov r5, ip
	strb r1, [r5, #7]
_0807D638:
	mov r2, ip
	ldrb r1, [r2, #7]
	cmp r1, #0
	bne _0807D642
	b _0807DADA
_0807D642:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl DebugMenuModifyAbilityCount
	adds r1, r0, #0
	cmp r1, #0
	bne _0807D652
	b _0807DADA
_0807D652:
	movs r7, #3
	b _0807DADA
	.align 2, 0
_0807D658: .4byte gChangedInput
_0807D65C:
	ldr r1, _0807D67C @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	bne _0807D66A
	b _0807DADA
_0807D66A:
	ldr r1, _0807D680 @ =gEquipment
	ldrb r3, [r1, #0xd]
	movs r2, #4
	subs r2, r2, r4
	adds r5, r1, #0
	cmp r3, r2
	bne _0807D684
	movs r1, #3
	b _0807D686
	.align 2, 0
_0807D67C: .4byte gChangedInput
_0807D680: .4byte gEquipment
_0807D684:
	movs r1, #4
_0807D686:
	subs r1, r1, r4
	strb r1, [r5, #0xd]
	ldr r1, _0807D698 @ =gSecurityHatchLevel
	ldrb r2, [r5, #0xd]
	strb r2, [r1]
	ldr r1, _0807D69C @ =gDebugMenuOptions
	strb r2, [r1, #9]
	b _0807DADA
	.align 2, 0
_0807D698: .4byte gSecurityHatchLevel
_0807D69C: .4byte gDebugMenuOptions
_0807D6A0:
	ldr r1, _0807D6CC @ =gChangedInput
	ldrh r2, [r1]
	movs r3, #1
	adds r1, r3, #0
	ands r1, r2
	ldr r5, _0807D6D0 @ =gEquipment
	cmp r1, #0
	beq _0807D6C4
	movs r2, #6
	subs r2, r2, r4
	adds r1, r3, #0
	lsls r1, r2
	ldrb r2, [r5, #0xe]
	eors r1, r2
	strb r1, [r5, #0xe]
	ldr r2, _0807D6D4 @ =gPreviousArea
	movs r1, #0xff
	strb r1, [r2]
_0807D6C4:
	ldr r2, _0807D6D8 @ =gDebugMenuOptions
	ldrb r1, [r5, #0xe]
	strb r1, [r2, #8]
	b _0807DADA
	.align 2, 0
_0807D6CC: .4byte gChangedInput
_0807D6D0: .4byte gEquipment
_0807D6D4: .4byte gPreviousArea
_0807D6D8: .4byte gDebugMenuOptions
_0807D6DC:
	movs r7, #0
	movs r6, #0
	ldr r3, _0807D724 @ =gNonGameplayRam
	ldrb r1, [r3, #7]
	cmp r1, #0
	bne _0807D730
	ldr r1, _0807D728 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _0807D754
	movs r1, #1
	strb r1, [r3, #7]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #9
	strb r1, [r2]
	movs r7, #1
	ldr r2, _0807D72C @ =0x04000044
	movs r1, #0x88
	strh r1, [r2]
	adds r2, #6
	movs r1, #4
	strb r1, [r2]
	movs r5, #0x9a
	lsls r5, r5, #2
	adds r3, r3, r5
	ldrh r2, [r3]
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r5, #0
	orrs r1, r2
	strh r1, [r3]
	movs r6, #0x80
	b _0807D754
	.align 2, 0
_0807D724: .4byte gNonGameplayRam
_0807D728: .4byte gChangedInput
_0807D72C: .4byte 0x04000044
_0807D730:
	ldr r1, _0807D788 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #3
	ands r1, r2
	cmp r1, #0
	beq _0807D754
	strb r7, [r3, #7]
	movs r0, #0
	movs r1, #1
	bl UpdateMenuOamDataID
	movs r7, #1
	ldr r2, _0807D78C @ =0x04000044
	movs r1, #0xa0
	strh r1, [r2]
	adds r2, #6
	movs r1, #0x35
	strb r1, [r2]
_0807D754:
	ldr r3, _0807D790 @ =gNonGameplayRam
	ldrb r1, [r3, #7]
	cmp r1, #0
	bne _0807D75E
	b _0807DADA
_0807D75E:
	cmp r6, #0
	bne _0807D800
	ldr r1, _0807D788 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0807D7A2
	ldr r3, _0807D794 @ =gEventCounter
	ldrb r2, [r3]
	ldr r0, _0807D798 @ =0x08576180
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, r1
	cmp r0, #0x6d
	ble _0807D79C
	movs r0, #0x6d
	strb r0, [r3]
	b _0807D800
	.align 2, 0
_0807D788: .4byte gChangedInput
_0807D78C: .4byte 0x04000044
_0807D790: .4byte gNonGameplayRam
_0807D794: .4byte gEventCounter
_0807D798: .4byte 0x08576180
_0807D79C:
	adds r0, r2, r1
	strb r0, [r3]
	b _0807D800
_0807D7A2:
	movs r1, #0x40
	ands r1, r2
	cmp r1, #0
	beq _0807D7CE
	ldr r2, _0807D7C0 @ =gEventCounter
	ldrb r3, [r2]
	ldr r0, _0807D7C4 @ =0x08576180
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r0, r3, r1
	cmp r0, #0
	bge _0807D7C8
	strb r6, [r2]
	b _0807D800
	.align 2, 0
_0807D7C0: .4byte gEventCounter
_0807D7C4: .4byte 0x08576180
_0807D7C8:
	subs r0, r3, r1
	strb r0, [r2]
	b _0807D800
_0807D7CE:
	movs r1, #0x10
	ands r1, r2
	cmp r1, #0
	beq _0807D7E2
	cmp r4, #0
	beq _0807D7FA
	ldrh r1, [r3, #0x2e]
	adds r1, #8
	strh r1, [r3, #0x2e]
	b _0807D7FA
_0807D7E2:
	movs r1, #0x20
	ands r1, r2
	cmp r1, #0
	beq _0807D7F6
	cmp r4, #1
	bgt _0807D7FA
	ldrh r1, [r3, #0x2e]
	subs r1, #8
	strh r1, [r3, #0x2e]
	b _0807D7FA
_0807D7F6:
	bl DebugMenuCheckSetMaxHealthOrAmmo
_0807D7FA:
	cmp r6, #0
	bne _0807D800
	b _0807DADA
_0807D800:
	ldr r1, _0807D870 @ =gEquipment
	movs r0, #0
	strb r0, [r1, #0xa]
	strb r0, [r1, #0xb]
	strb r0, [r1, #0xc]
	ldr r0, _0807D874 @ =gCurrentEventBasedEffect
	ldrb r4, [r0]
	ldr r0, _0807D878 @ =gCurrentEventBasedEffectCopy
	ldrb r5, [r0]
	ldr r0, _0807D87C @ =gEventCounter
	ldrb r6, [r0]
	movs r7, #0
	cmp r7, r6
	bgt _0807D82A
_0807D81C:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl EventSet
	adds r7, #1
	cmp r7, r6
	ble _0807D81C
_0807D82A:
	ldr r6, _0807D874 @ =gCurrentEventBasedEffect
	strb r4, [r6]
	ldr r0, _0807D878 @ =gCurrentEventBasedEffectCopy
	strb r5, [r0]
	movs r0, #0xff
	bl DebugMenuDrawSection
	movs r0, #0xff
	bl DebugMenuDrawHealthAmmoAndEvent
	bl DebugMenuDrawAbilityCount
	ldr r2, _0807D880 @ =gSecurityHatchLevel
	ldr r0, _0807D870 @ =gEquipment
	ldrb r1, [r0, #0xd]
	strb r1, [r2]
	ldr r0, _0807D884 @ =gDebugMenuOptions
	strb r1, [r0, #9]
	ldr r4, _0807D87C @ =gEventCounter
	ldrb r0, [r4]
	bl DebugMenuDrawEventText
	movs r7, #0
	ldrb r1, [r4]
	cmp r1, #0x20
	bhi _0807D868
	cmp r1, #0x20
	bne _0807D86A
	ldrb r1, [r6]
	cmp r1, #0x80
	bne _0807D86A
_0807D868:
	movs r7, #1
_0807D86A:
	ldr r1, _0807D888 @ =gWaterLowered
	strb r7, [r1]
	b _0807DAD8
	.align 2, 0
_0807D870: .4byte gEquipment
_0807D874: .4byte gCurrentEventBasedEffect
_0807D878: .4byte gCurrentEventBasedEffectCopy
_0807D87C: .4byte gEventCounter
_0807D880: .4byte gSecurityHatchLevel
_0807D884: .4byte gDebugMenuOptions
_0807D888: .4byte gWaterLowered
_0807D88C:
	movs r7, #0
	movs r6, #0
	ldr r3, _0807D8B4 @ =gNonGameplayRam
	ldrb r1, [r3, #7]
	cmp r1, #0
	bne _0807D8BC
	ldr r1, _0807D8B8 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _0807D8D2
	movs r1, #1
	strb r1, [r3, #7]
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #9
	strb r1, [r2]
	b _0807D8D2
	.align 2, 0
_0807D8B4: .4byte gNonGameplayRam
_0807D8B8: .4byte gChangedInput
_0807D8BC:
	ldr r1, _0807D908 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #3
	ands r1, r2
	cmp r1, #0
	beq _0807D8D2
	strb r7, [r3, #7]
	movs r0, #0
	movs r1, #1
	bl UpdateMenuOamDataID
_0807D8D2:
	ldr r3, _0807D90C @ =gNonGameplayRam
	ldrb r1, [r3, #7]
	cmp r1, #0
	bne _0807D8DC
	b _0807DADA
_0807D8DC:
	cmp r6, #0
	beq _0807D8E2
	b _0807D614
_0807D8E2:
	ldr r1, _0807D908 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0807D918
	ldr r5, _0807D910 @ =gSubEventCounter
	ldrh r3, [r5]
	ldr r2, _0807D914 @ =0x08576180
	lsls r1, r4, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	adds r1, r3, r1
	cmp r1, #0x9b
	ble _0807D902
	movs r1, #0x9b
_0807D902:
	strh r1, [r5]
	b _0807D614
	.align 2, 0
_0807D908: .4byte gChangedInput
_0807D90C: .4byte gNonGameplayRam
_0807D910: .4byte gSubEventCounter
_0807D914: .4byte 0x08576180
_0807D918:
	movs r1, #0x40
	ands r1, r2
	cmp r1, #0
	beq _0807D940
	ldr r5, _0807D938 @ =gSubEventCounter
	ldrh r3, [r5]
	ldr r2, _0807D93C @ =0x08576180
	lsls r1, r4, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	subs r1, r3, r1
	cmp r1, #0
	bge _0807D902
	strh r6, [r5]
	b _0807D614
	.align 2, 0
_0807D938: .4byte gSubEventCounter
_0807D93C: .4byte 0x08576180
_0807D940:
	movs r1, #0x10
	ands r1, r2
	cmp r1, #0
	beq _0807D952
	cmp r4, #0
	beq _0807D964
	ldrh r1, [r3, #0x2e]
	adds r1, #8
	b _0807D962
_0807D952:
	movs r1, #0x20
	ands r1, r2
	cmp r1, #0
	beq _0807D964
	cmp r4, #1
	bgt _0807D964
	ldrh r1, [r3, #0x2e]
	subs r1, #8
_0807D962:
	strh r1, [r3, #0x2e]
_0807D964:
	cmp r6, #0
	bne _0807D96A
	b _0807DADA
_0807D96A:
	b _0807D614
_0807D96C:
	movs r7, #0
	mov r3, ip
	ldrb r1, [r3, #7]
	cmp r1, #0
	bne _0807D9A8
	ldr r1, _0807D99C @ =gChangedInput
	ldrh r2, [r1]
	movs r4, #1
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	bne _0807D986
	b _0807DADA
_0807D986:
	adds r2, r3, #0
	adds r2, #0x36
	movs r1, #9
	strb r1, [r2]
	strb r4, [r3, #7]
	ldr r1, _0807D9A0 @ =gMaxInGameTimeFlag
	strb r4, [r1]
	ldr r1, _0807D9A4 @ =gInGameTimer
	strb r7, [r1, #2]
	strb r7, [r1, #3]
	b _0807DADA
	.align 2, 0
_0807D99C: .4byte gChangedInput
_0807D9A0: .4byte gMaxInGameTimeFlag
_0807D9A4: .4byte gInGameTimer
_0807D9A8:
	movs r6, #0
	ldr r1, _0807D9D4 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #0x80
	ands r1, r2
	cmp r1, #0
	beq _0807DA12
	cmp r4, #2
	ble _0807D9E6
	subs r4, #3
	ldr r3, _0807D9D8 @ =gInGameTimer
	ldrb r2, [r3]
	ldr r0, _0807D9DC @ =0x08576180
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, r1
	cmp r0, #0xff
	ble _0807D9E0
	movs r0, #0xff
	strb r0, [r3]
	b _0807DA9A
	.align 2, 0
_0807D9D4: .4byte gChangedInput
_0807D9D8: .4byte gInGameTimer
_0807D9DC: .4byte 0x08576180
_0807D9E0:
	adds r0, r2, r1
	strb r0, [r3]
	b _0807DA9A
_0807D9E6:
	cmp r4, #1
	bgt _0807DA96
	ldr r3, _0807DA04 @ =gInGameTimer
	ldrb r2, [r3, #1]
	ldr r0, _0807DA08 @ =0x08576180
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, r1
	cmp r0, #0x3b
	ble _0807DA0C
	movs r0, #0x3b
	strb r0, [r3, #1]
	b _0807DA9A
	.align 2, 0
_0807DA04: .4byte gInGameTimer
_0807DA08: .4byte 0x08576180
_0807DA0C:
	adds r0, r2, r1
	strb r0, [r3, #1]
	b _0807DA9A
_0807DA12:
	movs r1, #0x40
	ands r1, r2
	cmp r1, #0
	beq _0807DA6E
	cmp r4, #2
	ble _0807DA46
	subs r4, #3
	ldr r2, _0807DA38 @ =gInGameTimer
	ldrb r3, [r2]
	ldr r0, _0807DA3C @ =0x08576180
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r0, r3, r1
	cmp r0, #0
	bge _0807DA40
	strb r7, [r2]
	b _0807DA9A
	.align 2, 0
_0807DA38: .4byte gInGameTimer
_0807DA3C: .4byte 0x08576180
_0807DA40:
	subs r0, r3, r1
	strb r0, [r2]
	b _0807DA9A
_0807DA46:
	cmp r4, #1
	bgt _0807DA96
	ldr r2, _0807DA60 @ =gInGameTimer
	ldrb r3, [r2, #1]
	ldr r0, _0807DA64 @ =0x08576180
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	subs r0, r3, r1
	cmp r0, #0
	bge _0807DA68
	strb r7, [r2, #1]
	b _0807DA9A
	.align 2, 0
_0807DA60: .4byte gInGameTimer
_0807DA64: .4byte 0x08576180
_0807DA68:
	subs r0, r3, r1
	strb r0, [r2, #1]
	b _0807DA9A
_0807DA6E:
	movs r1, #0x10
	ands r1, r2
	cmp r1, #0
	beq _0807DA82
	cmp r4, #0
	beq _0807DA96
	ldrh r1, [r3, #0x2e]
	adds r1, #8
	strh r1, [r3, #0x2e]
	b _0807DA96
_0807DA82:
	movs r1, #0x20
	ands r1, r2
	cmp r1, #0
	beq _0807DA96
	cmp r4, #4
	bgt _0807DA96
	mov r2, ip
	ldrh r1, [r2, #0x2e]
	subs r1, #8
	strh r1, [r2, #0x2e]
_0807DA96:
	cmp r6, #0
	beq _0807DADA
_0807DA9A:
	bl DebugMenuDrawIgt
	b _0807DADA
_0807DAA0:
	ldr r1, _0807DACC @ =gCurrentArea
	ldrb r2, [r1]
	ldr r1, _0807DAD0 @ =gCurrentRoom
	ldrb r1, [r1]
	cmn r2, r1
	beq _0807DADA
	ldr r1, _0807DAD4 @ =gChangedInput
	ldrh r2, [r1]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _0807DADA
	movs r6, #0
_0807DABA:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl Sram_QuickSave
	adds r6, #1
	cmp r6, #3
	ble _0807DABA
	b _0807DADA
	.align 2, 0
_0807DACC: .4byte gCurrentArea
_0807DAD0: .4byte gCurrentRoom
_0807DAD4: .4byte gChangedInput
_0807DAD8:
	movs r7, #0
_0807DADA:
	cmp r7, #1
	bne _0807DAF4
	ldr r0, _0807DAF0 @ =0x0858211C
	mov r1, sb
	add r1, sl
	adds r0, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	bl DebugMenuDrawSection
	b _0807DB1A
	.align 2, 0
_0807DAF0: .4byte 0x0858211C
_0807DAF4:
	cmp r7, #2
	bne _0807DB10
	ldr r0, _0807DB0C @ =0x0858211C
	mov r1, sb
	add r1, sl
	adds r0, #4
	adds r1, r1, r0
	ldrb r0, [r1]
	bl DebugMenuDrawHealthAmmoAndEvent
	b _0807DB1A
	.align 2, 0
_0807DB0C: .4byte 0x0858211C
_0807DB10:
	cmp r7, #3
	bne _0807DB1A
	movs r0, #0xff
	bl DebugMenuDrawSection
_0807DB1A:
	cmp r7, #0
	beq _0807DB22
	bl DebugMenuDrawAbilityCount
_0807DB22:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DebugMenuDrawEventText
DebugMenuDrawEventText: @ 0x0807DB34
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0807DB70 @ =0x08581510
	lsls r1, r0, #3
	subs r1, r1, r0
	ldr r6, _0807DB74 @ =0x06007800
	lsls r1, r1, #2
	adds r4, r1, r2
	movs r5, #0x1b
_0807DB48:
	ldrb r2, [r4]
	movs r0, #0xe0
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r1, r2
	orrs r0, r1
	adds r1, r6, #0
	movs r2, #0
	bl DrawCharacterDebugMenu
	adds r6, #0x20
	adds r4, #1
	subs r5, #1
	cmp r5, #0
	bge _0807DB48
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807DB70: .4byte 0x08581510
_0807DB74: .4byte 0x06007800

	thumb_func_start DebugMenuDrawSection
DebugMenuDrawSection: @ 0x0807DB78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r0, #0
	mov sl, r0
	mov r1, sb
	cmp r1, #3
	bls _0807DB96
	movs r2, #1
	mov sl, r2
_0807DB96:
	mov r4, sb
	cmp r4, #0
	beq _0807DBA2
	mov r0, sl
	cmp r0, #0
	beq _0807DC02
_0807DBA2:
	movs r2, #0
	ldr r1, _0807DDF4 @ =0x0858211C
	mov ip, r1
	ldrb r7, [r1, #2]
	mov r8, ip
_0807DBAC:
	mov r4, ip
	ldrb r0, [r4]
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _0807DDF8 @ =0x0600C800
	adds r3, r0, r1
	ldr r4, _0807DDFC @ =0x08576168
	adds r0, r2, r4
	ldr r4, _0807DE00 @ =gEquipment
	ldrb r1, [r4, #0xa]
	ldrb r0, [r0]
	ands r0, r1
	movs r4, #3
	cmp r0, #0
	beq _0807DBD0
	movs r4, #9
_0807DBD0:
	mov r1, ip
	ldrb r0, [r1, #3]
	subs r0, r0, r7
	adds r5, r2, #1
	cmp r0, #0
	blt _0807DBFC
	ldr r6, _0807DE04 @ =0x00000FFF
	lsls r4, r4, #0xc
	mov r2, r8
	ldrb r0, [r2, #3]
	ldrb r1, [r2, #2]
	subs r0, r0, r1
	adds r2, r0, #1
_0807DBEA:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r3]
	subs r2, #1
	adds r3, #2
	cmp r2, #0
	bne _0807DBEA
_0807DBFC:
	adds r2, r5, #0
	cmp r2, #4
	bls _0807DBAC
_0807DC02:
	mov r4, sb
	cmp r4, #1
	beq _0807DC0E
	mov r0, sl
	cmp r0, #0
	beq _0807DC6E
_0807DC0E:
	movs r2, #0
	ldr r1, _0807DDF4 @ =0x0858211C
	mov ip, r1
	ldrb r7, [r1, #7]
	mov r8, ip
_0807DC18:
	mov r4, ip
	ldrb r0, [r4, #5]
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _0807DDF8 @ =0x0600C800
	adds r3, r0, r1
	ldr r4, _0807DE08 @ =0x0857616D
	adds r0, r2, r4
	ldr r4, _0807DE00 @ =gEquipment
	ldrb r1, [r4, #0xb]
	ldrb r0, [r0]
	ands r0, r1
	movs r4, #3
	cmp r0, #0
	beq _0807DC3C
	movs r4, #9
_0807DC3C:
	mov r1, ip
	ldrb r0, [r1, #8]
	subs r0, r0, r7
	adds r5, r2, #1
	cmp r0, #0
	blt _0807DC68
	ldr r6, _0807DE04 @ =0x00000FFF
	lsls r4, r4, #0xc
	mov r2, r8
	ldrb r0, [r2, #8]
	ldrb r1, [r2, #7]
	subs r0, r0, r1
	adds r2, r0, #1
_0807DC56:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r3]
	subs r2, #1
	adds r3, #2
	cmp r2, #0
	bne _0807DC56
_0807DC68:
	adds r2, r5, #0
	cmp r2, #3
	bls _0807DC18
_0807DC6E:
	mov r4, sb
	cmp r4, #2
	beq _0807DC7A
	mov r0, sl
	cmp r0, #0
	beq _0807DCDA
_0807DC7A:
	movs r2, #0
	ldr r1, _0807DDF4 @ =0x0858211C
	mov ip, r1
	ldrb r7, [r1, #0xc]
	mov r8, ip
_0807DC84:
	mov r4, ip
	ldrb r0, [r4, #0xa]
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _0807DDF8 @ =0x0600C800
	adds r3, r0, r1
	ldr r4, _0807DE0C @ =0x08576171
	adds r0, r2, r4
	ldr r4, _0807DE00 @ =gEquipment
	ldrb r1, [r4, #0xb]
	ldrb r0, [r0]
	ands r0, r1
	movs r4, #3
	cmp r0, #0
	beq _0807DCA8
	movs r4, #9
_0807DCA8:
	mov r1, ip
	ldrb r0, [r1, #0xd]
	subs r0, r0, r7
	adds r5, r2, #1
	cmp r0, #0
	blt _0807DCD4
	ldr r6, _0807DE04 @ =0x00000FFF
	lsls r4, r4, #0xc
	mov r2, r8
	ldrb r0, [r2, #0xd]
	ldrb r1, [r2, #0xc]
	subs r0, r0, r1
	adds r2, r0, #1
_0807DCC2:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r3]
	subs r2, #1
	adds r3, #2
	cmp r2, #0
	bne _0807DCC2
_0807DCD4:
	adds r2, r5, #0
	cmp r2, #1
	bls _0807DC84
_0807DCDA:
	mov r4, sb
	cmp r4, #3
	beq _0807DCE6
	mov r0, sl
	cmp r0, #0
	beq _0807DD46
_0807DCE6:
	movs r2, #0
	ldr r1, _0807DDF4 @ =0x0858211C
	mov ip, r1
	ldrb r7, [r1, #0x11]
	mov r8, ip
_0807DCF0:
	mov r4, ip
	ldrb r0, [r4, #0xf]
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _0807DDF8 @ =0x0600C800
	adds r3, r0, r1
	ldr r4, _0807DE10 @ =0x08576173
	adds r0, r2, r4
	ldr r4, _0807DE00 @ =gEquipment
	ldrb r1, [r4, #0xc]
	ldrb r0, [r0]
	ands r0, r1
	movs r4, #3
	cmp r0, #0
	beq _0807DD14
	movs r4, #9
_0807DD14:
	mov r1, ip
	ldrb r0, [r1, #0x12]
	subs r0, r0, r7
	adds r5, r2, #1
	cmp r0, #0
	blt _0807DD40
	ldr r6, _0807DE04 @ =0x00000FFF
	lsls r4, r4, #0xc
	mov r2, r8
	ldrb r0, [r2, #0x12]
	ldrb r1, [r2, #0x11]
	subs r0, r0, r1
	adds r2, r0, #1
_0807DD2E:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r3]
	subs r2, #1
	adds r3, #2
	cmp r2, #0
	bne _0807DD2E
_0807DD40:
	adds r2, r5, #0
	cmp r2, #1
	bls _0807DCF0
_0807DD46:
	mov r4, sb
	cmp r4, #4
	beq _0807DD52
	mov r0, sl
	cmp r0, #0
	beq _0807DDB2
_0807DD52:
	movs r2, #0
	ldr r1, _0807DDF4 @ =0x0858211C
	mov ip, r1
	ldrb r7, [r1, #0x16]
	mov r8, ip
_0807DD5C:
	mov r4, ip
	ldrb r0, [r4, #0x14]
	adds r0, r0, r2
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _0807DDF8 @ =0x0600C800
	adds r3, r0, r1
	ldr r4, _0807DE14 @ =0x08576175
	adds r0, r2, r4
	ldr r4, _0807DE00 @ =gEquipment
	ldrb r1, [r4, #0xc]
	ldrb r0, [r0]
	ands r0, r1
	movs r4, #3
	cmp r0, #0
	beq _0807DD80
	movs r4, #9
_0807DD80:
	mov r1, ip
	ldrb r0, [r1, #0x17]
	subs r0, r0, r7
	adds r5, r2, #1
	cmp r0, #0
	blt _0807DDAC
	ldr r6, _0807DE04 @ =0x00000FFF
	lsls r4, r4, #0xc
	mov r2, r8
	ldrb r0, [r2, #0x17]
	ldrb r1, [r2, #0x16]
	subs r0, r0, r1
	adds r2, r0, #1
_0807DD9A:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r3]
	subs r2, #1
	adds r3, #2
	cmp r2, #0
	bne _0807DD9A
_0807DDAC:
	adds r2, r5, #0
	cmp r2, #4
	bls _0807DD5C
_0807DDB2:
	mov r4, sb
	cmp r4, #0xd
	beq _0807DDBE
	mov r0, sl
	cmp r0, #0
	beq _0807DE36
_0807DDBE:
	ldr r4, _0807DDF4 @ =0x0858211C
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r1, r4, #0
	adds r1, #0x43
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _0807DDF8 @ =0x0600C800
	adds r3, r0, r2
	movs r2, #0
	adds r0, r4, #0
	adds r0, #0x44
	ldrb r0, [r0]
	subs r0, r0, r1
	cmp r2, r0
	bgt _0807DE36
	ldr r5, _0807DE00 @ =gEquipment
	ldr r7, _0807DE04 @ =0x00000FFF
	adds r6, r0, #0
_0807DDEA:
	ldrb r0, [r5, #0xd]
	cmp r0, #4
	bls _0807DE18
	movs r4, #3
	b _0807DE22
	.align 2, 0
_0807DDF4: .4byte 0x0858211C
_0807DDF8: .4byte 0x0600C800
_0807DDFC: .4byte 0x08576168
_0807DE00: .4byte gEquipment
_0807DE04: .4byte 0x00000FFF
_0807DE08: .4byte 0x0857616D
_0807DE0C: .4byte 0x08576171
_0807DE10: .4byte 0x08576173
_0807DE14: .4byte 0x08576175
_0807DE18:
	ldrb r0, [r5, #0xd]
	movs r4, #3
	cmp r0, r2
	blt _0807DE22
	movs r4, #9
_0807DE22:
	ldrh r0, [r3]
	adds r1, r7, #0
	ands r1, r0
	lsls r0, r4, #0xc
	orrs r1, r0
	strh r1, [r3]
	adds r2, #1
	adds r3, #2
	cmp r2, r6
	ble _0807DDEA
_0807DE36:
	mov r4, sb
	cmp r4, #0xe
	beq _0807DE42
	mov r0, sl
	cmp r0, #0
	beq _0807DE94
_0807DE42:
	ldr r4, _0807DEF0 @ =0x0858211C
	adds r0, r4, #0
	adds r0, #0x46
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r1, r4, #0
	adds r1, #0x48
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _0807DEF4 @ =0x0600C800
	adds r3, r0, r2
	movs r2, #0
	adds r0, r4, #0
	adds r0, #0x49
	ldrb r0, [r0]
	subs r0, r0, r1
	cmp r2, r0
	bgt _0807DE94
	ldr r7, _0807DEF8 @ =gEquipment
	ldr r4, _0807DEFC @ =0x00000FFF
	mov r8, r4
	adds r5, r0, #0
	movs r6, #1
_0807DE72:
	ldrb r0, [r7, #0xe]
	asrs r0, r2
	ands r0, r6
	movs r4, #3
	cmp r0, #0
	beq _0807DE80
	movs r4, #9
_0807DE80:
	ldrh r0, [r3]
	mov r1, r8
	ands r1, r0
	lsls r0, r4, #0xc
	orrs r1, r0
	strh r1, [r3]
	adds r2, #1
	adds r3, #2
	cmp r2, r5
	ble _0807DE72
_0807DE94:
	mov r0, sb
	cmp r0, #0xf
	bne _0807DEE2
	ldr r2, _0807DEF0 @ =0x0858211C
	adds r0, r2, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	lsls r0, r0, #5
	adds r1, r2, #0
	adds r1, #0x4d
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r4, _0807DEF4 @ =0x0600C800
	adds r3, r0, r4
	adds r0, r2, #0
	adds r0, #0x4e
	ldrb r0, [r0]
	subs r0, r0, r1
	cmp r0, #0
	blt _0807DEE2
	ldr r5, _0807DF00 @ =gNonGameplayRam
	ldr r6, _0807DEFC @ =0x00000FFF
	adds r2, r0, #1
_0807DEC4:
	ldrb r0, [r5, #7]
	movs r4, #3
	cmp r0, #0
	beq _0807DECE
	movs r4, #9
_0807DECE:
	ldrh r0, [r3]
	adds r1, r6, #0
	ands r1, r0
	lsls r0, r4, #0xc
	orrs r1, r0
	strh r1, [r3]
	subs r2, #1
	adds r3, #2
	cmp r2, #0
	bne _0807DEC4
_0807DEE2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DEF0: .4byte 0x0858211C
_0807DEF4: .4byte 0x0600C800
_0807DEF8: .4byte gEquipment
_0807DEFC: .4byte 0x00000FFF
_0807DF00: .4byte gNonGameplayRam

	thumb_func_start SetAbilityCount
SetAbilityCount: @ 0x0807DF04
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, _0807DF58 @ =gAbilityCount
	strb r0, [r1]
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r2, [r1]
	ldr r6, _0807DF5C @ =gEquipment
	cmp r2, #0
	beq _0807DF42
	ldr r0, _0807DF60 @ =0x08575FB4
	movs r5, #0
	movs r4, #0
	movs r3, #0
	adds r1, r0, #0
	adds r1, #8
_0807DF28:
	ldrb r0, [r1]
	orrs r5, r0
	ldrb r0, [r1, #1]
	orrs r4, r0
	ldrb r0, [r1, #2]
	orrs r3, r0
	adds r1, #8
	subs r2, #1
	cmp r2, #0
	bne _0807DF28
	str r3, [sp, #8]
	str r4, [sp, #4]
	str r5, [sp]
_0807DF42:
	ldr r0, [sp]
	strb r0, [r6, #0xa]
	ldr r0, [sp, #4]
	strb r0, [r6, #0xb]
	ldr r0, [sp, #8]
	strb r0, [r6, #0xc]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807DF58: .4byte gAbilityCount
_0807DF5C: .4byte gEquipment
_0807DF60: .4byte 0x08575FB4

	thumb_func_start DebugMenuModifyAbilityCount
DebugMenuModifyAbilityCount: @ 0x0807DF64
	push {r4, r5, r6, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r4, r2, #0
	movs r6, #0
	ldr r1, _0807DF98 @ =0x08576180
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	ldr r0, _0807DF9C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807DFA4
	ldr r1, _0807DFA0 @ =gAbilityCount
	ldrb r0, [r1]
	adds r0, r0, r3
	cmp r0, #0x11
	ble _0807DF90
	movs r0, #0x12
_0807DF90:
	strb r0, [r1]
_0807DF92:
	movs r6, #1
	b _0807E000
	.align 2, 0
_0807DF98: .4byte 0x08576180
_0807DF9C: .4byte gChangedInput
_0807DFA0: .4byte gAbilityCount
_0807DFA4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0807DFC0
	ldr r1, _0807DFBC @ =gAbilityCount
	ldrb r0, [r1]
	subs r0, r0, r3
	cmp r0, #0
	bgt _0807DF90
	strb r6, [r1]
	b _0807DF92
	.align 2, 0
_0807DFBC: .4byte gAbilityCount
_0807DFC0:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807DFDC
	cmp r2, #0
	beq _0807DFFC
	ldr r1, _0807DFD8 @ =gNonGameplayRam
	ldrh r0, [r1, #0x2e]
	adds r0, #8
	strh r0, [r1, #0x2e]
	b _0807DFFC
	.align 2, 0
_0807DFD8: .4byte gNonGameplayRam
_0807DFDC:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807DFF8
	cmp r4, #0
	bne _0807DFFC
	ldr r1, _0807DFF4 @ =gNonGameplayRam
	ldrh r0, [r1, #0x2e]
	subs r0, #8
	strh r0, [r1, #0x2e]
	b _0807DFFC
	.align 2, 0
_0807DFF4: .4byte gNonGameplayRam
_0807DFF8:
	bl DebugMenuCheckSetMaxHealthOrAmmo
_0807DFFC:
	cmp r6, #0
	beq _0807E044
_0807E000:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r3, #0
	ldr r4, _0807E050 @ =gAbilityCount
	ldr r5, _0807E054 @ =gEquipment
	ldrb r0, [r4]
	cmp r3, r0
	bgt _0807E038
	ldr r2, _0807E058 @ =0x08575FB4
_0807E016:
	ldrb r1, [r2]
	ldr r0, [sp]
	orrs r0, r1
	str r0, [sp]
	ldrb r1, [r2, #1]
	ldr r0, [sp, #4]
	orrs r0, r1
	str r0, [sp, #4]
	ldrb r1, [r2, #2]
	ldr r0, [sp, #8]
	orrs r0, r1
	str r0, [sp, #8]
	adds r2, #8
	adds r3, #1
	ldrb r0, [r4]
	cmp r3, r0
	ble _0807E016
_0807E038:
	ldr r0, [sp]
	strb r0, [r5, #0xa]
	ldr r0, [sp, #4]
	strb r0, [r5, #0xb]
	ldr r0, [sp, #8]
	strb r0, [r5, #0xc]
_0807E044:
	adds r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0807E050: .4byte gAbilityCount
_0807E054: .4byte gEquipment
_0807E058: .4byte 0x08575FB4

	thumb_func_start DebugMenuDrawAbilityCount
DebugMenuDrawAbilityCount: @ 0x0807E05C
	push {r4, r5, r6, lr}
	ldr r0, _0807E0A4 @ =0x0858211C
	adds r1, r0, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	adds r0, #0x3e
	lsls r1, r1, #5
	ldrb r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #1
	movs r4, #0xa
	ldr r6, _0807E0A8 @ =gAbilityCount
	ldr r0, _0807E0AC @ =0x0600C800
	adds r5, r1, r0
_0807E078:
	ldrb r0, [r6]
	adds r1, r4, #0
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	movs r1, #0xc2
	lsls r1, r1, #6
	adds r0, r0, r1
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r5, #2
	cmp r4, #0
	bgt _0807E078
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E0A4: .4byte 0x0858211C
_0807E0A8: .4byte gAbilityCount
_0807E0AC: .4byte 0x0600C800

	thumb_func_start DebugMenuDrawMenuAndDoor
DebugMenuDrawMenuAndDoor: @ 0x0807E0B0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _0807E148 @ =0x0600C800
	mov r8, r0
	ldr r0, _0807E14C @ =0x08582118
	ldrb r1, [r0]
	lsls r1, r1, #5
	ldrb r2, [r0, #1]
	adds r1, r1, r2
	adds r1, #2
	movs r4, #0x64
	adds r7, r0, #0
	ldr r6, _0807E150 @ =gCurrentRoom
	ldr r0, _0807E154 @ =gLastDoorUsed
	mov sb, r0
	lsls r0, r1, #1
	mov r1, r8
	adds r5, r0, r1
_0807E0D8:
	ldrb r0, [r6]
	adds r0, #1
	adds r1, r4, #0
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	movs r2, #0xc2
	lsls r2, r2, #6
	adds r0, r0, r2
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r5, #2
	cmp r4, #0
	bgt _0807E0D8
	ldrb r0, [r7, #2]
	lsls r0, r0, #5
	ldrb r7, [r7, #3]
	adds r1, r0, r7
	adds r1, #2
	movs r4, #0x64
	lsls r0, r1, #1
	mov r1, r8
	adds r5, r0, r1
_0807E112:
	mov r2, sb
	ldrb r0, [r2]
	adds r1, r4, #0
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	movs r1, #0xc2
	lsls r1, r1, #6
	adds r0, r0, r1
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r5, #2
	cmp r4, #0
	bgt _0807E112
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E148: .4byte 0x0600C800
_0807E14C: .4byte 0x08582118
_0807E150: .4byte gCurrentRoom
_0807E154: .4byte gLastDoorUsed

	thumb_func_start DebugMenuDrawIgt
DebugMenuDrawIgt: @ 0x0807E158
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0807E1AC @ =0x0600C800
	mov sb, r0
	ldr r0, _0807E1B0 @ =0x0858211C
	adds r1, r0, #0
	adds r1, #0x55
	ldrb r1, [r1]
	adds r0, #0x57
	lsls r1, r1, #5
	ldrb r0, [r0]
	adds r6, r1, r0
	movs r5, #0x64
	ldr r1, _0807E1B4 @ =gInGameTimer
	mov r8, r1
	ldr r0, _0807E1B8 @ =gNonGameplayRam
	mov sl, r0
	movs r1, #0xc2
	lsls r1, r1, #6
	adds r7, r1, #0
	lsls r0, r6, #1
	mov r1, sb
	adds r4, r0, r1
_0807E18C:
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r5, #0
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	cmp r5, #0x64
	bne _0807E1C0
	cmp r0, #0
	bne _0807E1C0
	ldr r1, _0807E1BC @ =0x0000308C
	adds r0, r1, #0
	b _0807E1C2
	.align 2, 0
_0807E1AC: .4byte 0x0600C800
_0807E1B0: .4byte 0x0858211C
_0807E1B4: .4byte gInGameTimer
_0807E1B8: .4byte gNonGameplayRam
_0807E1BC: .4byte 0x0000308C
_0807E1C0:
	adds r0, r0, r7
_0807E1C2:
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	adds r4, #2
	adds r6, #1
	cmp r5, #0
	bgt _0807E18C
	adds r6, #1
	movs r5, #0xa
	lsls r0, r6, #1
	mov r1, sb
	adds r4, r0, r1
_0807E1E0:
	mov r1, r8
	ldrb r0, [r1, #1]
	adds r1, r5, #0
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	movs r1, #0xc2
	lsls r1, r1, #6
	adds r0, r0, r1
	strh r0, [r4]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r5, r0, #0
	adds r4, #2
	cmp r5, #0
	bgt _0807E1E0
	mov r0, r8
	ldrb r1, [r0, #1]
	movs r0, #0xa1
	lsls r0, r0, #2
	add r0, sl
	strb r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_7e224
unk_7e224: @ 0x0807E224
	push {lr}
	ldr r1, _0807E250 @ =0x0858211C
	adds r0, r1, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x57
	lsls r0, r0, #5
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r2, r0, #3
	ldr r0, _0807E254 @ =gInGameTimer
	ldrb r1, [r0, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807E260
	lsls r0, r2, #1
	ldr r1, _0807E258 @ =0x0600C800
	adds r0, r0, r1
	ldr r2, _0807E25C @ =0x0000308C
	b _0807E268
	.align 2, 0
_0807E250: .4byte 0x0858211C
_0807E254: .4byte gInGameTimer
_0807E258: .4byte 0x0600C800
_0807E25C: .4byte 0x0000308C
_0807E260:
	lsls r0, r2, #1
	ldr r1, _0807E270 @ =0x0600C800
	adds r0, r0, r1
	ldr r2, _0807E274 @ =0x0000307B
_0807E268:
	adds r1, r2, #0
	strh r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0807E270: .4byte 0x0600C800
_0807E274: .4byte 0x0000307B

	thumb_func_start DebugMenuModifyHealthAndAmmo
DebugMenuModifyHealthAndAmmo: @ 0x0807E278
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	movs r0, #0
	str r0, [sp]
	cmp r3, #5
	bne _0807E2A8
	ldr r5, _0807E2A4 @ =gEquipment
	adds r1, r5, #2
	mov r8, r1
	movs r1, #3
	movs r7, #1
	mov sb, r0
	b _0807E314
	.align 2, 0
_0807E2A4: .4byte gEquipment
_0807E2A8:
	cmp r3, #6
	bne _0807E2C0
	ldr r5, _0807E2BC @ =0x03001312
	subs r2, r5, #2
	mov r8, r2
	movs r1, #3
	movs r7, #2
	movs r0, #0
	mov sb, r0
	b _0807E314
	.align 2, 0
_0807E2BC: .4byte 0x03001312
_0807E2C0:
	cmp r3, #8
	bne _0807E2D4
	ldr r5, _0807E2D0 @ =0x03001314
	adds r1, r5, #2
	mov r8, r1
	movs r1, #2
	movs r7, #1
	b _0807E2E2
	.align 2, 0
_0807E2D0: .4byte 0x03001314
_0807E2D4:
	cmp r3, #9
	bne _0807E2EC
	ldr r5, _0807E2E8 @ =0x03001316
	subs r0, r5, #2
	mov r8, r0
	movs r1, #2
	movs r7, #2
_0807E2E2:
	movs r2, #1
	mov sb, r2
	b _0807E314
	.align 2, 0
_0807E2E8: .4byte 0x03001316
_0807E2EC:
	cmp r3, #0xa
	bne _0807E300
	ldr r6, _0807E2FC @ =0x03001318
	adds r0, r6, #1
	str r0, [sp, #4]
	movs r1, #2
	movs r7, #3
	b _0807E312
	.align 2, 0
_0807E2FC: .4byte 0x03001318
_0807E300:
	cmp r3, #0xb
	beq _0807E308
_0807E304:
	movs r0, #0
	b _0807E468
_0807E308:
	ldr r6, _0807E330 @ =0x03001319
	subs r1, r6, #1
	str r1, [sp, #4]
	movs r1, #2
	movs r7, #4
_0807E312:
	mov sb, r1
_0807E314:
	ldr r0, _0807E334 @ =gChangedInput
	ldrh r4, [r0]
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0807E33C
	mov r2, ip
	cmp r2, #0
	beq _0807E304
	ldr r1, _0807E338 @ =gNonGameplayRam
	ldrh r0, [r1, #0x2e]
	adds r0, #8
	strh r0, [r1, #0x2e]
	b _0807E304
	.align 2, 0
_0807E330: .4byte 0x03001319
_0807E334: .4byte gChangedInput
_0807E338: .4byte gNonGameplayRam
_0807E33C:
	movs r0, #0x20
	ands r0, r4
	cmp r0, #0
	beq _0807E358
	cmp ip, r1
	bge _0807E304
	ldr r1, _0807E354 @ =gNonGameplayRam
	ldrh r0, [r1, #0x2e]
	subs r0, #8
	strh r0, [r1, #0x2e]
	b _0807E304
	.align 2, 0
_0807E354: .4byte gNonGameplayRam
_0807E358:
	ldr r0, _0807E3B0 @ =0x08576180
	mov sl, r0
	ldr r2, _0807E3B4 @ =0x0858211C
	lsls r1, r3, #2
	adds r1, r1, r3
	adds r0, r2, #3
	adds r0, r1, r0
	ldrb r0, [r0]
	adds r2, #2
	adds r1, r1, r2
	ldrb r1, [r1]
	subs r0, r0, r1
	adds r0, #1
	lsls r0, r0, #1
	add r0, sl
	ldrh r0, [r0]
	subs r2, r0, #1
	ldr r1, _0807E3B8 @ =0x0857618A
	mov r3, sb
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r2, r0
	ble _0807E38A
	adds r2, r0, #0
_0807E38A:
	mov r1, ip
	lsls r0, r1, #1
	add r0, sl
	ldrh r1, [r0]
	cmp r7, #2
	bgt _0807E406
	movs r0, #0x80
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0807E3C4
	ldrh r0, [r5]
	adds r0, r0, r1
	cmp r0, r2
	ble _0807E3BC
	strh r2, [r5]
	b _0807E3BE
	.align 2, 0
_0807E3B0: .4byte 0x08576180
_0807E3B4: .4byte 0x0858211C
_0807E3B8: .4byte 0x0857618A
_0807E3BC:
	strh r0, [r5]
_0807E3BE:
	movs r2, #1
	str r2, [sp]
	b _0807E3DE
_0807E3C4:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0807E3DE
	ldrh r0, [r5]
	subs r0, r0, r1
	cmp r0, #0
	bge _0807E3D8
	strh r3, [r5]
	b _0807E3DA
_0807E3D8:
	strh r0, [r5]
_0807E3DA:
	movs r3, #1
	str r3, [sp]
_0807E3DE:
	cmp r7, #1
	bne _0807E3F2
	ldrh r0, [r5]
	mov r1, r8
	ldrh r1, [r1]
	cmp r0, r1
	blo _0807E466
	mov r2, r8
	strh r0, [r2]
	b _0807E466
_0807E3F2:
	cmp r7, #2
	bne _0807E466
	ldrh r0, [r5]
	mov r3, r8
	ldrh r3, [r3]
	cmp r0, r3
	bhi _0807E466
	mov r1, r8
	strh r0, [r1]
	b _0807E466
_0807E406:
	movs r0, #0x80
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0807E426
	ldrb r0, [r6]
	adds r0, r0, r1
	cmp r0, r2
	ble _0807E41E
	strb r2, [r6]
	b _0807E420
_0807E41E:
	strb r0, [r6]
_0807E420:
	movs r2, #1
	str r2, [sp]
	b _0807E440
_0807E426:
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _0807E440
	ldrb r0, [r6]
	subs r0, r0, r1
	cmp r0, #0
	bge _0807E43A
	strb r3, [r6]
	b _0807E43C
_0807E43A:
	strb r0, [r6]
_0807E43C:
	movs r3, #1
	str r3, [sp]
_0807E440:
	cmp r7, #3
	bne _0807E454
	ldrb r0, [r6]
	ldr r1, [sp, #4]
	ldrb r1, [r1]
	cmp r0, r1
	blo _0807E466
	ldr r2, [sp, #4]
	strb r0, [r2]
	b _0807E466
_0807E454:
	cmp r7, #4
	bne _0807E466
	ldrb r0, [r6]
	ldr r3, [sp, #4]
	ldrb r3, [r3]
	cmp r0, r3
	bhi _0807E466
	ldr r1, [sp, #4]
	strb r0, [r1]
_0807E466:
	ldr r0, [sp]
_0807E468:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start DebugMenuDrawHealthAmmoAndEvent
DebugMenuDrawHealthAmmoAndEvent: @ 0x0807E478
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r6, #0
	cmp r5, #0xff
	bne _0807E486
	movs r6, #1
_0807E486:
	subs r0, r5, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0807E494
	cmp r6, #0
	beq _0807E4A6
_0807E494:
	ldr r4, _0807E514 @ =gEquipment
	ldrh r0, [r4]
	movs r1, #5
	bl DebugMenuDrawNumber
	ldrh r0, [r4, #2]
	movs r1, #6
	bl DebugMenuDrawNumber
_0807E4A6:
	adds r0, r5, #0
	subs r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0807E4B6
	cmp r6, #0
	beq _0807E4C8
_0807E4B6:
	ldr r4, _0807E514 @ =gEquipment
	ldrh r0, [r4, #4]
	movs r1, #8
	bl DebugMenuDrawNumber
	ldrh r0, [r4, #6]
	movs r1, #9
	bl DebugMenuDrawNumber
_0807E4C8:
	adds r0, r5, #0
	subs r0, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _0807E4D8
	cmp r6, #0
	beq _0807E4EA
_0807E4D8:
	ldr r4, _0807E514 @ =gEquipment
	ldrb r0, [r4, #8]
	movs r1, #0xa
	bl DebugMenuDrawNumber
	ldrb r0, [r4, #9]
	movs r1, #0xb
	bl DebugMenuDrawNumber
_0807E4EA:
	cmp r5, #0xf
	beq _0807E4F2
	cmp r6, #0
	beq _0807E4FC
_0807E4F2:
	ldr r0, _0807E518 @ =gEventCounter
	ldrb r0, [r0]
	movs r1, #0xf
	bl DebugMenuDrawNumber
_0807E4FC:
	cmp r5, #0x10
	beq _0807E504
	cmp r6, #0
	beq _0807E50E
_0807E504:
	ldr r0, _0807E51C @ =gSubEventCounter
	ldrh r0, [r0]
	movs r1, #0x10
	bl DebugMenuDrawNumber
_0807E50E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E514: .4byte gEquipment
_0807E518: .4byte gEventCounter
_0807E51C: .4byte gSubEventCounter

	thumb_func_start DebugMenuDrawNumber
DebugMenuDrawNumber: @ 0x0807E520
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r3, _0807E584 @ =0x0858211C
	lsls r2, r1, #2
	adds r2, r2, r1
	adds r0, r2, r3
	ldrb r1, [r0]
	lsls r1, r1, #5
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r4, [r0]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r0, _0807E588 @ =0x0600C800
	adds r5, r1, r0
	ldr r1, _0807E58C @ =0x08576180
	adds r3, #3
	adds r2, r2, r3
	ldrb r0, [r2]
	subs r0, r0, r4
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	ble _0807E57E
_0807E558:
	adds r0, r6, #0
	adds r1, r4, #0
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	movs r1, #0xc2
	lsls r1, r1, #6
	adds r0, r0, r1
	strh r0, [r5]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r5, #2
	cmp r4, #0
	bgt _0807E558
_0807E57E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E584: .4byte 0x0858211C
_0807E588: .4byte 0x0600C800
_0807E58C: .4byte 0x08576180

	thumb_func_start DebugMenuCheckSetMaxHealthOrAmmo
DebugMenuCheckSetMaxHealthOrAmmo: @ 0x0807E590
	push {r4, r5, r6, lr}
	ldr r0, _0807E5D4 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x84
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807E5E4
	ldr r5, _0807E5D8 @ =gEquipment
	ldr r6, _0807E5DC @ =0x0857618A
	ldrh r0, [r6]
	strh r0, [r5]
	strh r0, [r5, #2]
	ldr r4, _0807E5E0 @ =0x0858211C
	ldrb r0, [r4, #0x1d]
	bl DebugMenuDrawHealthAmmoAndEvent
	ldrh r0, [r6, #2]
	strh r0, [r5, #4]
	strh r0, [r5, #6]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl DebugMenuDrawHealthAmmoAndEvent
	ldrh r0, [r6, #4]
	strb r0, [r5, #8]
	strb r0, [r5, #9]
	adds r4, #0x36
	ldrb r0, [r4]
	bl DebugMenuDrawHealthAmmoAndEvent
	b _0807E61C
	.align 2, 0
_0807E5D4: .4byte gChangedInput
_0807E5D8: .4byte gEquipment
_0807E5DC: .4byte 0x0857618A
_0807E5E0: .4byte 0x0858211C
_0807E5E4:
	movs r0, #0x81
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0807E61C
	ldr r4, _0807E624 @ =gEquipment
	movs r0, #0x63
	strh r0, [r4]
	strh r0, [r4, #2]
	ldr r5, _0807E628 @ =0x0858211C
	ldrb r0, [r5, #0x1d]
	bl DebugMenuDrawHealthAmmoAndEvent
	movs r6, #0xa
	movs r0, #0xa
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl DebugMenuDrawHealthAmmoAndEvent
	strb r6, [r4, #8]
	strb r6, [r4, #9]
	adds r5, #0x36
	ldrb r0, [r5]
	bl DebugMenuDrawHealthAmmoAndEvent
_0807E61C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807E624: .4byte gEquipment
_0807E628: .4byte 0x0858211C

	thumb_func_start DebugMenuDrawEverything
DebugMenuDrawEverything: @ 0x0807E62C
	push {lr}
	movs r0, #0xff
	bl DebugMenuDrawSection
	movs r0, #0xff
	bl DebugMenuDrawHealthAmmoAndEvent
	bl DebugMenuDrawAbilityCount
	bl DebugMenuDrawMenuAndDoor
	bl DebugMenuDrawIgt
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DebugMenuSetupCursor
DebugMenuSetupCursor: @ 0x0807E64C
	push {lr}
	movs r0, #0
	movs r1, #1
	bl UpdateMenuOamDataID
	ldr r2, _0807E670 @ =gNonGameplayRam
	ldr r1, _0807E674 @ =0x0858211C
	adds r0, r1, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #3
	strh r0, [r2, #0x2c]
	adds r1, #0x3f
	ldrb r0, [r1]
	lsls r0, r0, #3
	strh r0, [r2, #0x2e]
	pop {r0}
	bx r0
	.align 2, 0
_0807E670: .4byte gNonGameplayRam
_0807E674: .4byte 0x0858211C

	thumb_func_start StatusScreenSubroutine
StatusScreenSubroutine: @ 0x0807E678
	push {lr}
	ldr r0, _0807E6A0 @ =gChangedInput
	ldrh r1, [r0]
	ldr r0, _0807E6A4 @ =0x00000302
	ands r0, r1
	cmp r0, #0
	beq _0807E69A
	ldr r3, _0807E6A8 @ =gNonGameplayRam
	ldrb r2, [r3, #7]
	cmp r2, #0
	bne _0807E69A
	adds r1, r3, #0
	adds r1, #0x28
	movs r0, #7
	strb r0, [r1]
	strb r2, [r3, #6]
	strb r2, [r3, #7]
_0807E69A:
	pop {r0}
	bx r0
	.align 2, 0
_0807E6A0: .4byte gChangedInput
_0807E6A4: .4byte 0x00000302
_0807E6A8: .4byte gNonGameplayRam

	thumb_func_start StatusScreenDrawEverything
StatusScreenDrawEverything: @ 0x0807E6AC
	push {r4, lr}
	ldr r4, _0807E714 @ =gEquipment
	ldrb r1, [r4, #0xa]
	movs r0, #0
	bl StatusScreenDrawBeamOrSuit
	ldrb r1, [r4, #0xb]
	movs r0, #1
	bl StatusScreenDrawMissileOrBomb
	ldrb r1, [r4, #0xc]
	movs r0, #3
	bl StatusScreenDrawBeamOrSuit
	ldrb r1, [r4, #0xb]
	movs r0, #2
	bl StatusScreenDrawMissileOrBomb
	ldrb r1, [r4, #0xc]
	movs r0, #4
	bl StatusScreenDrawMisc
	ldrh r1, [r4]
	movs r0, #5
	movs r2, #6
	movs r3, #0
	bl StatusScreenDrawNumber
	ldrh r1, [r4, #2]
	movs r0, #6
	movs r2, #3
	movs r3, #1
	bl StatusScreenDrawNumber
	ldrb r1, [r4, #0xb]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807E718
	ldrh r1, [r4, #4]
	movs r0, #7
	movs r2, #6
	movs r3, #0
	bl StatusScreenDrawNumber
	ldrh r1, [r4, #6]
	movs r0, #8
	movs r2, #3
	movs r3, #1
	bl StatusScreenDrawNumber
	b _0807E71E
	.align 2, 0
_0807E714: .4byte gEquipment
_0807E718:
	movs r0, #1
	bl StatusScreenRemoveAmmoHeader
_0807E71E:
	ldr r4, _0807E744 @ =gEquipment
	ldrb r1, [r4, #0xb]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x30
	bne _0807E748
	ldrb r1, [r4, #8]
	movs r0, #9
	movs r2, #6
	movs r3, #0
	bl StatusScreenDrawNumber
	ldrb r1, [r4, #9]
	movs r0, #0xa
	movs r2, #3
	movs r3, #1
	bl StatusScreenDrawNumber
	b _0807E74E
	.align 2, 0
_0807E744: .4byte gEquipment
_0807E748:
	movs r0, #2
	bl StatusScreenRemoveAmmoHeader
_0807E74E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start StatusScreenDrawNumber
StatusScreenDrawNumber: @ 0x0807E754
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	ldr r3, _0807E7D0 @ =0x0858217C
	lsls r2, r0, #2
	adds r2, r2, r0
	adds r0, r2, r3
	ldrb r1, [r0]
	lsls r1, r1, #5
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r4, [r0]
	adds r1, r1, r4
	lsls r1, r1, #1
	ldr r0, _0807E7D4 @ =0x0600C800
	adds r0, r0, r1
	mov sb, r0
	adds r3, #3
	adds r2, r2, r3
	ldrb r0, [r2]
	subs r6, r0, r4
	ldr r1, _0807E7D8 @ =0x08576180
	lsls r0, r6, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r6, #1
	movs r7, #0
	movs r5, #0
	cmp r4, #0
	ble _0807E808
_0807E7AC:
	ldr r0, [sp]
	adds r1, r4, #0
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	cmp r2, #0
	bne _0807E7E0
	cmp r7, #0
	bne _0807E7DC
	movs r2, #0x8c
	mov r3, sl
	cmp r3, #0
	beq _0807E7E4
	b _0807E7F6
	.align 2, 0
_0807E7D0: .4byte 0x0858217C
_0807E7D4: .4byte 0x0600C800
_0807E7D8: .4byte 0x08576180
_0807E7DC:
	movs r2, #0x80
	b _0807E7E8
_0807E7E0:
	movs r7, #1
	adds r2, #0x80
_0807E7E4:
	cmp r2, #0
	beq _0807E7F6
_0807E7E8:
	lsls r1, r5, #1
	add r1, sb
	mov r3, r8
	lsls r0, r3, #0xc
	orrs r0, r2
	strh r0, [r1]
	b _0807E7F8
_0807E7F6:
	subs r5, #1
_0807E7F8:
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	adds r5, #1
	cmp r4, #0
	bgt _0807E7AC
_0807E808:
	cmp r6, r5
	beq _0807E822
	mov r0, r8
	lsls r2, r0, #0xc
	movs r0, #0x8c
	orrs r2, r0
	lsls r0, r5, #1
	add r0, sb
_0807E818:
	strh r2, [r0]
	adds r0, #2
	adds r5, #1
	cmp r6, r5
	bne _0807E818
_0807E822:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start StatusScreenDrawBeamOrSuit
StatusScreenDrawBeamOrSuit: @ 0x0807E834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r0, #0
	mov sb, r0
	movs r2, #0
	ldr r0, _0807E964 @ =0x0857617A
	adds r1, r7, r0
	ldrb r1, [r1]
	cmp sb, r1
	bge _0807E8F8
	ldr r1, _0807E968 @ =0x0858217C
	lsls r3, r7, #2
	mov sl, r3
	adds r5, r3, r7
	ldr r0, _0807E96C @ =0x085821B3
	adds r0, #2
	adds r0, r5, r0
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r1, #3
	adds r6, r5, r0
	str r6, [sp, #0x14]
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r0, #1
	str r0, [sp, #4]
	adds r1, #2
	adds r1, r5, r1
	ldrb r0, [r1]
	mov r8, r0
	str r5, [sp, #0xc]
	str r1, [sp, #0x10]
_0807E886:
	ldr r1, [sp, #4]
	adds r0, r1, r2
	lsls r0, r0, #5
	add r0, r8
	mov ip, r0
	ldr r3, _0807E96C @ =0x085821B3
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, #1
	adds r0, r0, r2
	lsls r0, r0, #5
	ldr r1, [sp, #8]
	adds r6, r0, r1
	ldr r0, _0807E970 @ =0x0879BEA8
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r3, [sp]
	ands r0, r3
	adds r2, #1
	cmp r0, #0
	beq _0807E8EE
	mov sb, r2
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	mov r2, r8
	subs r0, r0, r2
	mov r2, sb
	cmp r0, #0
	blt _0807E8EE
	ldr r3, [sp, #0xc]
	ldr r1, _0807E974 @ =0x0858217F
	adds r0, r3, r1
	ldrb r1, [r0]
	ldr r3, [sp, #0x10]
	ldrb r0, [r3]
	subs r1, r1, r0
	lsls r0, r6, #1
	ldr r6, _0807E978 @ =0x0600C800
	adds r4, r0, r6
	mov r3, ip
	lsls r0, r3, #1
	adds r3, r0, r6
	adds r1, #1
_0807E8E0:
	ldrh r0, [r4]
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _0807E8E0
_0807E8EE:
	ldr r6, _0807E964 @ =0x0857617A
	adds r0, r7, r6
	ldrb r0, [r0]
	cmp r2, r0
	blt _0807E886
_0807E8F8:
	mov r0, sb
	cmp r0, #0
	beq _0807E954
	ldr r3, _0807E968 @ =0x0858217C
	lsls r2, r7, #2
	adds r2, r2, r7
	adds r0, r2, r3
	mov r1, sb
	adds r1, #1
	ldrb r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r4, [r0]
	adds r1, r1, r4
	mov ip, r1
	ldr r1, _0807E96C @ =0x085821B3
	adds r0, r1, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, #2
	adds r1, r2, r1
	lsls r0, r0, #5
	ldrb r1, [r1]
	adds r6, r0, r1
	adds r3, #3
	adds r2, r2, r3
	ldrb r0, [r2]
	subs r1, r0, r4
	cmp r1, #0
	blt _0807E954
	lsls r0, r6, #1
	ldr r2, _0807E978 @ =0x0600C800
	adds r4, r0, r2
	mov r3, ip
	lsls r0, r3, #1
	adds r3, r0, r2
	adds r1, #1
_0807E946:
	ldrh r0, [r4]
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _0807E946
_0807E954:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E964: .4byte 0x0857617A
_0807E968: .4byte 0x0858217C
_0807E96C: .4byte 0x085821B3
_0807E970: .4byte 0x0879BEA8
_0807E974: .4byte 0x0858217F
_0807E978: .4byte 0x0600C800

	thumb_func_start StatusScreenDrawMissileOrBomb
StatusScreenDrawMissileOrBomb: @ 0x0807E97C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #4]
	movs r2, #0
	ldr r0, _0807EA30 @ =0x0857617A
	adds r1, r7, r0
	ldrb r1, [r1]
	cmp r2, r1
	bge _0807EA5C
	ldr r1, _0807EA34 @ =0x0858217C
	lsls r3, r7, #2
	mov sl, r3
	adds r5, r3, r7
	ldr r0, _0807EA38 @ =0x085821B3
	adds r0, #2
	adds r0, r5, r0
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r1, #3
	adds r0, r5, r0
	str r0, [sp, #0x14]
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r1, #2
	adds r1, r5, r1
	ldrb r6, [r1]
	mov sb, r6
	str r5, [sp, #0xc]
	str r1, [sp, #0x10]
	lsls r0, r0, #5
	mov ip, r0
_0807E9D0:
	mov r0, ip
	add r0, sb
	mov r8, r0
	ldr r1, _0807EA38 @ =0x085821B3
	adds r0, r5, r1
	ldrb r0, [r0]
	adds r0, r0, r2
	lsls r0, r0, #5
	ldr r3, [sp, #8]
	adds r6, r0, r3
	ldr r0, _0807EA3C @ =0x0879BEA8
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r2
	ldrb r0, [r0]
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _0807EA48
	str r2, [sp, #4]
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	mov r1, sb
	subs r0, r0, r1
	cmp r0, #0
	blt _0807EA4C
	ldr r0, _0807EA40 @ =0x0858217F
	ldr r3, [sp, #0xc]
	adds r0, r3, r0
	ldrb r1, [r0]
	ldr r3, [sp, #0x10]
	ldrb r0, [r3]
	subs r1, r1, r0
	lsls r0, r6, #1
	ldr r6, _0807EA44 @ =0x0600C800
	adds r4, r0, r6
	mov r3, r8
	lsls r0, r3, #1
	adds r3, r0, r6
	adds r1, #1
_0807EA20:
	ldrh r0, [r4]
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _0807EA20
	b _0807EA4C
	.align 2, 0
_0807EA30: .4byte 0x0857617A
_0807EA34: .4byte 0x0858217C
_0807EA38: .4byte 0x085821B3
_0807EA3C: .4byte 0x0879BEA8
_0807EA40: .4byte 0x0858217F
_0807EA44: .4byte 0x0600C800
_0807EA48:
	cmp r2, #0
	beq _0807EAB8
_0807EA4C:
	movs r6, #0x20
	add ip, r6
	adds r2, #1
	ldr r1, _0807EAC8 @ =0x0857617A
	adds r0, r7, r1
	ldrb r0, [r0]
	cmp r2, r0
	blt _0807E9D0
_0807EA5C:
	ldr r2, [sp, #4]
	cmp r2, #0
	blt _0807EAB8
	ldr r3, _0807EACC @ =0x0858217C
	lsls r2, r7, #2
	adds r2, r2, r7
	adds r0, r2, r3
	ldr r1, [sp, #4]
	adds r1, #1
	ldrb r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #5
	adds r0, r3, #2
	adds r0, r2, r0
	ldrb r4, [r0]
	adds r1, r1, r4
	mov r8, r1
	ldr r1, _0807EAD0 @ =0x085821B3
	adds r0, r1, #1
	adds r0, r2, r0
	ldrb r0, [r0]
	adds r1, #2
	adds r1, r2, r1
	lsls r0, r0, #5
	ldrb r1, [r1]
	adds r6, r0, r1
	adds r3, #3
	adds r2, r2, r3
	ldrb r0, [r2]
	subs r1, r0, r4
	cmp r1, #0
	blt _0807EAB8
	lsls r0, r6, #1
	ldr r3, _0807EAD4 @ =0x0600C800
	adds r4, r0, r3
	mov r6, r8
	lsls r0, r6, #1
	adds r3, r0, r3
	adds r1, #1
_0807EAAA:
	ldrh r0, [r4]
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _0807EAAA
_0807EAB8:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EAC8: .4byte 0x0857617A
_0807EACC: .4byte 0x0858217C
_0807EAD0: .4byte 0x085821B3
_0807EAD4: .4byte 0x0600C800

	thumb_func_start StatusScreenDrawMisc
StatusScreenDrawMisc: @ 0x0807EAD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r4, #0
	ldr r0, _0807EBF8 @ =0x0857617A
	mov r2, r8
	adds r1, r2, r0
	ldrb r1, [r1]
	cmp r4, r1
	bge _0807EB9C
	ldr r1, _0807EBFC @ =0x0858217C
	lsls r2, r2, #2
	mov sb, r2
	add r2, r8
	ldr r3, _0807EC00 @ =0x085821B3
	mov sl, r3
	mov r0, sl
	adds r0, #2
	adds r0, r2, r0
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	adds r0, r1, #3
	adds r6, r2, r0
	str r6, [sp, #0x1c]
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r0, #1
	str r0, [sp, #8]
	adds r1, #2
	adds r1, r2, r1
	ldrb r7, [r1]
	str r2, [sp, #0x10]
	mov ip, r1
_0807EB30:
	ldr r1, [sp, #8]
	adds r0, r1, r4
	lsls r0, r0, #5
	adds r6, r0, r7
	mov r3, sl
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r0, #1
	adds r0, r0, r4
	lsls r0, r0, #5
	ldr r1, [sp, #0xc]
	adds r3, r0, r1
	ldr r0, _0807EC04 @ =0x0879BEA8
	add r0, sb
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [sp]
	ands r0, r1
	adds r5, r4, #1
	cmp r0, #0
	beq _0807EB90
	str r5, [sp, #4]
	ldr r4, [sp, #0x1c]
	ldrb r0, [r4]
	subs r0, r0, r7
	cmp r0, #0
	blt _0807EB90
	ldr r1, [sp, #0x10]
	ldr r4, _0807EC08 @ =0x0858217F
	adds r0, r1, r4
	ldrb r1, [r0]
	mov r4, ip
	ldrb r0, [r4]
	subs r1, r1, r0
	lsls r0, r3, #1
	ldr r3, _0807EC0C @ =0x0600C800
	adds r4, r0, r3
	lsls r0, r6, #1
	adds r3, r0, r3
	adds r1, #1
_0807EB82:
	ldrh r0, [r4]
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _0807EB82
_0807EB90:
	adds r4, r5, #0
	ldr r0, _0807EBF8 @ =0x0857617A
	add r0, r8
	ldrb r0, [r0]
	cmp r4, r0
	blt _0807EB30
_0807EB9C:
	ldr r4, [sp, #4]
	cmp r4, #0
	beq _0807EC6C
	movs r4, #0
	ldr r1, _0807EBFC @ =0x0858217C
	mov r6, r8
	lsls r6, r6, #2
	str r6, [sp, #0x14]
	adds r7, r6, #0
	add r7, r8
	adds r2, r1, #2
	adds r0, r7, r2
	mov ip, r0
	ldr r0, _0807EC00 @ =0x085821B3
	adds r0, #2
	adds r0, r0, r7
	mov sl, r0
	adds r2, r7, r1
	mov sb, r2
	ldr r0, _0807EC00 @ =0x085821B3
	adds r0, #1
	adds r0, r7, r0
	str r0, [sp, #0x18]
	ldr r3, _0807EC08 @ =0x0858217F
	adds r3, r7, r3
	str r3, [sp, #0x20]
_0807EBD0:
	cmp r4, #0
	bne _0807EC10
	ldr r6, [sp, #4]
	adds r6, #1
	str r6, [sp, #4]
	mov r1, sb
	ldrb r0, [r1]
	adds r0, r0, r6
	lsls r0, r0, #5
	mov r2, ip
	ldrb r2, [r2]
	adds r6, r0, r2
	ldr r3, [sp, #0x18]
	ldrb r0, [r3]
	lsls r0, r0, #5
	mov r1, sl
	ldrb r1, [r1]
	adds r3, r0, r1
	b _0807EC2A
	.align 2, 0
_0807EBF8: .4byte 0x0857617A
_0807EBFC: .4byte 0x0858217C
_0807EC00: .4byte 0x085821B3
_0807EC04: .4byte 0x0879BEA8
_0807EC08: .4byte 0x0858217F
_0807EC0C: .4byte 0x0600C800
_0807EC10:
	mov r2, sb
	ldrb r0, [r2]
	lsls r0, r0, #5
	mov r3, ip
	ldrb r3, [r3]
	adds r6, r0, r3
	ldr r1, _0807EC7C @ =0x085821B3
	adds r0, r7, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	mov r2, sl
	ldrb r2, [r2]
	adds r3, r0, r2
_0807EC2A:
	ldr r0, [sp, #0x20]
	ldrb r1, [r0]
	mov r2, ip
	ldrb r0, [r2]
	subs r1, r1, r0
	adds r5, r4, #1
	cmp r1, #0
	blt _0807EC66
	ldr r1, [sp, #0x14]
	add r1, r8
	ldr r4, _0807EC80 @ =0x0858217F
	adds r0, r1, r4
	ldrb r2, [r0]
	ldr r0, _0807EC84 @ =0x0858217E
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r2, r2, r0
	lsls r0, r3, #1
	ldr r1, _0807EC88 @ =0x0600C800
	adds r4, r0, r1
	lsls r0, r6, #1
	adds r3, r0, r1
	adds r1, r2, #1
_0807EC58:
	ldrh r0, [r4]
	strh r0, [r3]
	adds r4, #2
	adds r3, #2
	subs r1, #1
	cmp r1, #0
	bne _0807EC58
_0807EC66:
	adds r4, r5, #0
	cmp r4, #1
	ble _0807EBD0
_0807EC6C:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC7C: .4byte 0x085821B3
_0807EC80: .4byte 0x0858217F
_0807EC84: .4byte 0x0858217E
_0807EC88: .4byte 0x0600C800

	thumb_func_start StatusScreenRemoveAmmoHeader
StatusScreenRemoveAmmoHeader: @ 0x0807EC8C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0807ECA2
	movs r1, #1
	b _0807ECA8
_0807ECA2:
	cmp r0, #2
	bne _0807ED0A
	movs r1, #2
_0807ECA8:
	ldr r0, _0807ED18 @ =0x0600C800
	mov r8, r0
	movs r3, #0
	lsls r1, r1, #2
	ldr r5, _0807ED1C @ =0x085821D6
	adds r0, r1, r5
	ldrb r0, [r0]
	mov sl, r0
	ldrb r7, [r5, #2]
	ldrb r0, [r5, #3]
	subs r0, r0, r7
	mov sb, r0
	adds r0, r5, #2
	adds r1, r1, r0
	ldrb r1, [r1]
	mov ip, r1
_0807ECC8:
	mov r1, sl
	adds r0, r1, r3
	lsls r0, r0, #5
	mov r2, ip
	adds r4, r0, r2
	ldrb r0, [r5]
	adds r0, r0, r3
	lsls r0, r0, #5
	adds r2, r0, r7
	adds r6, r3, #1
	mov r0, sb
	cmp r0, #0
	blt _0807ED04
	ldrb r1, [r5, #3]
	ldrb r0, [r5, #2]
	subs r1, r1, r0
	lsls r0, r2, #1
	ldr r2, _0807ED18 @ =0x0600C800
	adds r3, r0, r2
	lsls r0, r4, #1
	mov r4, r8
	adds r2, r0, r4
	adds r1, #1
_0807ECF6:
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _0807ECF6
_0807ED04:
	adds r3, r6, #0
	cmp r3, #1
	ble _0807ECC8
_0807ED0A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807ED18: .4byte 0x0600C800
_0807ED1C: .4byte 0x085821D6

	thumb_func_start EasySleepMenuSubroutine
EasySleepMenuSubroutine: @ 0x0807ED20
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r7, #0
	ldr r0, _0807ED40 @ =gNonGameplayRam
	ldrb r1, [r0, #7]
	adds r3, r0, #0
	cmp r1, #5
	bls _0807ED36
	b _0807EE82
_0807ED36:
	lsls r0, r1, #2
	ldr r1, _0807ED44 @ =_0807ED48
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807ED40: .4byte gNonGameplayRam
_0807ED44: .4byte _0807ED48
_0807ED48: @ jump table
	.4byte _0807ED60 @ case 0
	.4byte _0807ED90 @ case 1
	.4byte _0807EDE4 @ case 2
	.4byte _0807EDFE @ case 3
	.4byte _0807EE12 @ case 4
	.4byte _0807EE78 @ case 5
_0807ED60:
	ldr r0, _0807ED78 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0807ED80
	ldr r0, _0807ED7C @ =0x000001FB
	bl SoundPlay
	movs r7, #1
	b _0807EE86
	.align 2, 0
_0807ED78: .4byte gChangedInput
_0807ED7C: .4byte 0x000001FB
_0807ED80:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807EDD4
	movs r0, #1
	strb r0, [r3, #7]
	movs r0, #0x3c
	b _0807EDC8
_0807ED90:
	ldr r0, _0807EDB0 @ =gChangedInput
	ldrh r1, [r0]
	movs r2, #1
	ands r2, r1
	cmp r2, #0
	beq _0807EDBC
	ldr r0, _0807EDB4 @ =0x000001FB
	bl SoundPlay
	ldr r1, _0807EDB8 @ =gNonGameplayRam
	movs r2, #0
	movs r0, #2
	strb r0, [r1, #7]
	strb r2, [r1, #6]
	b _0807EE82
	.align 2, 0
_0807EDB0: .4byte gChangedInput
_0807EDB4: .4byte 0x000001FB
_0807EDB8: .4byte gNonGameplayRam
_0807EDBC:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807EDD4
	strb r2, [r3, #7]
	movs r0, #0x8c
_0807EDC8:
	strh r0, [r3, #0x3a]
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
	b _0807EE82
_0807EDD4:
	ldr r0, _0807EDE0 @ =0x00000302
	ands r0, r1
	cmp r0, #0
	beq _0807EE82
	movs r7, #1
	b _0807EE86
	.align 2, 0
_0807EDE0: .4byte 0x00000302
_0807EDE4:
	ldrb r0, [r3, #6]
	adds r0, #1
	strb r0, [r3, #6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bls _0807EE82
	ldrb r0, [r3, #7]
	adds r0, #1
	strb r0, [r3, #7]
	movs r0, #0
	strb r0, [r3, #6]
	b _0807EE82
_0807EDFE:
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrh r0, [r2]
	movs r1, #0x80
	eors r0, r1
	strh r0, [r2]
	ldrb r0, [r3, #7]
	adds r0, #1
	b _0807EE80
_0807EE12:
	ldr r1, _0807EE64 @ =0x04000132
	ldr r2, _0807EE68 @ =0x0000C304
	adds r0, r2, #0
	strh r0, [r1]
	ldr r6, _0807EE6C @ =0x04000208
	movs r0, #0
	mov sb, r0
	strh r0, [r6]
	ldr r5, _0807EE70 @ =0x04000200
	ldrh r4, [r5]
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r1, #0
	strh r0, [r5]
	movs r2, #1
	mov r8, r2
	strh r2, [r6]
	bl SoundBias0
	svc #3
	bl SoundBias1
	mov r0, sb
	strh r0, [r6]
	strh r4, [r5]
	mov r1, r8
	strh r1, [r6]
	ldr r2, _0807EE74 @ =gNonGameplayRam
	movs r0, #0x9a
	lsls r0, r0, #2
	adds r3, r2, r0
	ldrh r0, [r3]
	movs r1, #0x80
	eors r0, r1
	strh r0, [r3]
	movs r0, #0x8c
	strh r0, [r2, #0x3a]
	ldrb r0, [r2, #7]
	adds r0, #1
	strb r0, [r2, #7]
	b _0807EE82
	.align 2, 0
_0807EE64: .4byte 0x04000132
_0807EE68: .4byte 0x0000C304
_0807EE6C: .4byte 0x04000208
_0807EE70: .4byte 0x04000200
_0807EE74: .4byte gNonGameplayRam
_0807EE78:
	ldr r0, _0807EE9C @ =gButtonInput
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807EE82
_0807EE80:
	strb r0, [r3, #7]
_0807EE82:
	cmp r7, #0
	beq _0807EE8E
_0807EE86:
	ldr r1, _0807EEA0 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #7]
	strb r0, [r1, #6]
_0807EE8E:
	adds r0, r7, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807EE9C: .4byte gButtonInput
_0807EEA0: .4byte gNonGameplayRam

	thumb_func_start Sram_ReadAll
Sram_ReadAll: @ 0x0807EEA4
	push {lr}
	bl Sram_ReadHeader
	bl unk_7fb84
	bl SramRead_MostRecentSaveFile
	bl SramRead_Language
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Sram_WriteHeader
Sram_WriteHeader: @ 0x0807EEBC
	push {r4, r5, lr}
	ldr r4, _0807EF1C @ =0x02038000
	movs r0, #0x30
	strb r0, [r4, #8]
	movs r0, #0x31
	strb r0, [r4, #9]
	ldr r0, _0807EF20 @ =0x03000010
	ldrb r0, [r0]
	strb r0, [r4, #0xa]
	movs r0, #2
	strb r0, [r4, #0xb]
	movs r2, #0
	adds r5, r4, #0
	adds r5, #0xc
	ldr r3, _0807EF24 @ =0x08582248
_0807EEDA:
	adds r0, r5, r2
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0x13
	ble _0807EEDA
	movs r0, #0
	str r0, [r4]
	subs r0, #1
	str r0, [r4, #4]
	ldr r3, _0807EF1C @ =0x02038000
	movs r1, #0
	movs r2, #7
_0807EEF6:
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	subs r2, #1
	cmp r2, #0
	bge _0807EEF6
	str r1, [r4]
	mvns r0, r1
	str r0, [r4, #4]
	bl unk_c98
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EF1C: .4byte 0x02038000
_0807EF20: .4byte 0x03000010
_0807EF24: .4byte 0x08582248

	thumb_func_start Sram_ReadHeader
Sram_ReadHeader: @ 0x0807EF28
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	bl SramTestFlash
	ldr r0, _0807EFA0 @ =0x03000B8E
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807EF42
	bl unk_da8
_0807EF42:
	movs r0, #0
	bl Sram_VerifyHeader
	adds r6, r0, #0
	movs r0, #1
	bl Sram_VerifyHeader
	mov sb, r0
	movs r0, #2
	bl Sram_VerifyHeader
	mov r8, r0
	cmp r6, #0
	beq _0807F00C
	mov r0, sp
	ldr r1, _0807EFA4 @ =0x0000FFFF
	adds r2, r1, #0
	strh r2, [r0]
	ldr r4, _0807EFA8 @ =0x040000D4
	str r0, [r4]
	ldr r5, _0807EFAC @ =0x02038000
	str r5, [r4, #4]
	ldr r1, _0807EFB0 @ =0x81000040
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, r8
	cmp r0, #0
	beq _0807EFD8
	mov r0, sp
	strh r2, [r0]
	str r0, [r4]
	ldr r0, _0807EFB4 @ =0x0203F100
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, sb
	cmp r0, #0
	beq _0807EFBC
	mov r0, sp
	strh r2, [r0]
	str r0, [r4]
	ldr r0, _0807EFB8 @ =0x02038080
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	b _0807F034
	.align 2, 0
_0807EFA0: .4byte 0x03000B8E
_0807EFA4: .4byte 0x0000FFFF
_0807EFA8: .4byte 0x040000D4
_0807EFAC: .4byte 0x02038000
_0807EFB0: .4byte 0x81000040
_0807EFB4: .4byte 0x0203F100
_0807EFB8: .4byte 0x02038080
_0807EFBC:
	ldr r0, _0807EFD0 @ =0x02038080
	str r0, [r4]
	str r5, [r4, #4]
	ldr r0, _0807EFD4 @ =0x80000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r6, #0
	bl unk_c98
	b _0807F034
	.align 2, 0
_0807EFD0: .4byte 0x02038080
_0807EFD4: .4byte 0x80000040
_0807EFD8:
	ldr r0, _0807F000 @ =0x0203F100
	str r0, [r4]
	str r5, [r4, #4]
	ldr r7, _0807F004 @ =0x80000040
	str r7, [r4, #8]
	ldr r0, [r4, #8]
	movs r6, #0
	bl unk_c98
	mov r1, sb
	cmp r1, #0
	beq _0807F034
	str r5, [r4]
	ldr r0, _0807F008 @ =0x02038080
	str r0, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [r4, #8]
	bl unk_cd8
	b _0807F034
	.align 2, 0
_0807F000: .4byte 0x0203F100
_0807F004: .4byte 0x80000040
_0807F008: .4byte 0x02038080
_0807F00C:
	ldr r4, _0807F040 @ =0x040000D4
	ldr r7, _0807F044 @ =0x02038000
	str r7, [r4]
	ldr r0, _0807F048 @ =0x02038080
	str r0, [r4, #4]
	ldr r5, _0807F04C @ =0x80000040
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl unk_cd8
	mov r0, r8
	cmp r0, #0
	beq _0807F034
	str r7, [r4]
	ldr r0, _0807F050 @ =0x0203F100
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	bl unk_cf0
_0807F034:
	cmp r6, #0
	bne _0807F058
	ldr r0, _0807F054 @ =0x03000010
	strb r6, [r0]
	b _0807F066
	.align 2, 0
_0807F040: .4byte 0x040000D4
_0807F044: .4byte 0x02038000
_0807F048: .4byte 0x02038080
_0807F04C: .4byte 0x80000040
_0807F050: .4byte 0x0203F100
_0807F054: .4byte 0x03000010
_0807F058:
	bl EraseSram
	ldr r1, _0807F074 @ =0x03000010
	movs r0, #0
	strb r0, [r1]
	bl Sram_WriteHeader
_0807F066:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F074: .4byte 0x03000010

	thumb_func_start Sram_VerifyHeader
Sram_VerifyHeader: @ 0x0807F078
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0
	ldr r1, _0807F0EC @ =0x0203F100
	cmp r0, #2
	beq _0807F08E
	ldr r1, _0807F0F0 @ =0x02038000
	cmp r0, #1
	bne _0807F08E
	adds r1, #0x80
_0807F08E:
	movs r2, #0
	ldr r7, [r1]
	adds r5, r1, #0
	adds r5, #0xc
	ldr r0, [r1, #4]
	mov ip, r0
	movs r3, #7
_0807F09C:
	ldm r1!, {r0}
	adds r2, r2, r0
	ldm r1!, {r0}
	adds r2, r2, r0
	ldm r1!, {r0}
	adds r2, r2, r0
	ldm r1!, {r0}
	adds r2, r2, r0
	subs r3, #1
	cmp r3, #0
	bge _0807F09C
	cmp r7, r2
	beq _0807F0BA
	movs r0, #1
	orrs r4, r0
_0807F0BA:
	movs r3, #0
	adds r2, r5, #0
	ldr r6, _0807F0F4 @ =0x08582248
	movs r5, #2
_0807F0C2:
	adds r0, r2, r3
	adds r1, r3, r6
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0807F0D0
	orrs r4, r5
_0807F0D0:
	adds r3, #1
	cmp r3, #0x13
	ble _0807F0C2
	mov r1, ip
	mvns r0, r1
	cmp r7, r0
	beq _0807F0E2
	movs r0, #4
	orrs r4, r0
_0807F0E2:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807F0EC: .4byte 0x0203F100
_0807F0F0: .4byte 0x02038000
_0807F0F4: .4byte 0x08582248

	thumb_func_start Sram_ProcessIntroSave
Sram_ProcessIntroSave: @ 0x0807F0F8
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r3, r1, #0
	ldr r6, _0807F128 @ =0x03000B94
	ldr r4, _0807F12C @ =0x03000B8D
	ldrb r0, [r4]
	lsls r2, r0, #2
	adds r0, r2, r0
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r5, [r0, #0xf]
	cmp r5, #0
	beq _0807F17C
	cmp r1, #2
	bgt _0807F130
	cmp r1, #1
	blt _0807F120
	b _0807F222
_0807F120:
	cmp r1, #0
	beq _0807F136
	b _0807F21C
	.align 2, 0
_0807F128: .4byte 0x03000B94
_0807F12C: .4byte 0x03000B8D
_0807F130:
	cmp r1, #3
	beq _0807F158
	b _0807F21C
_0807F136:
	ldr r1, _0807F150 @ =gDisableSoftReset
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0807F154 @ =0x03000014
	movs r2, #1
	strb r2, [r0, #1]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strb r2, [r0, #0x11]
	b _0807F222
	.align 2, 0
_0807F150: .4byte gDisableSoftReset
_0807F154: .4byte 0x03000014
_0807F158:
	ldr r0, _0807F174 @ =0x0858225C
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0807F178 @ =0x08582268
	adds r0, r2, r0
	ldr r2, [r0]
	movs r3, #0x90
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _0807F21C
	.align 2, 0
_0807F174: .4byte 0x0858225C
_0807F178: .4byte 0x08582268
_0807F17C:
	cmp r1, #1
	beq _0807F1E4
	cmp r1, #1
	bgt _0807F18A
	cmp r1, #0
	beq _0807F194
	b _0807F21C
_0807F18A:
	cmp r3, #2
	beq _0807F1EA
	cmp r3, #3
	beq _0807F1F0
	b _0807F21C
_0807F194:
	ldr r1, _0807F1D8 @ =gDisableSoftReset
	movs r0, #1
	strb r0, [r1]
	ldr r3, _0807F1DC @ =0x03000014
	movs r2, #1
	strb r2, [r3, #1]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	strb r2, [r0, #0x11]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x10]
	strb r0, [r3]
	ldr r1, _0807F1E0 @ =0x0858225C
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r3, #0xc0
	lsls r3, r3, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	b _0807F222
	.align 2, 0
_0807F1D8: .4byte gDisableSoftReset
_0807F1DC: .4byte 0x03000014
_0807F1E0: .4byte 0x0858225C
_0807F1E4:
	bl Sram_WriteHeaderAndGameInfo
	b _0807F222
_0807F1EA:
	bl WriteMostRecentFileToGamePak
	b _0807F222
_0807F1F0:
	ldr r0, _0807F210 @ =0x0858225C
	adds r0, r2, r0
	ldr r1, [r0]
	ldr r0, _0807F214 @ =0x08582268
	adds r0, r2, r0
	ldr r2, [r0]
	movs r3, #0x90
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	ldr r0, _0807F218 @ =gDisableSoftReset
	strb r5, [r0]
	b _0807F222
	.align 2, 0
_0807F210: .4byte 0x0858225C
_0807F214: .4byte 0x08582268
_0807F218: .4byte gDisableSoftReset
_0807F21C:
	ldr r1, _0807F22C @ =gDisableSoftReset
	movs r0, #0
	strb r0, [r1]
_0807F222:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F22C: .4byte gDisableSoftReset

	thumb_func_start Sram_WriteHeaderAndGameInfo
Sram_WriteHeaderAndGameInfo: @ 0x0807F230
	push {r4, r5, r6, lr}
	ldr r5, _0807F2A0 @ =0x0858225C
	ldr r4, _0807F2A4 @ =0x03000B8D
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r6, [r0]
	ldr r1, _0807F2A8 @ =0x08582200
	adds r0, r6, #0
	bl Sram_StringCopy_MetroidEpisode4A
	movs r0, #0
	str r0, [r6, #0x10]
	subs r0, #1
	str r0, [r6, #0x14]
	ldr r1, _0807F2AC @ =0x03000014
	ldrb r0, [r1, #1]
	strb r0, [r6, #0x19]
	ldrb r0, [r1]
	strb r0, [r6, #0x18]
	adds r0, r6, #0
	adds r0, #0xf0
	ldr r1, _0807F2B0 @ =0x085821F8
	bl Sram_StringCopy_SAVE_END
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	movs r1, #0
	movs r3, #0x8f
_0807F26E:
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	subs r3, #1
	cmp r3, #0
	bge _0807F26E
	str r1, [r6, #0x10]
	mvns r0, r1
	str r0, [r6, #0x14]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F2A0: .4byte 0x0858225C
_0807F2A4: .4byte 0x03000B8D
_0807F2A8: .4byte 0x08582200
_0807F2AC: .4byte 0x03000014
_0807F2B0: .4byte 0x085821F8

	thumb_func_start Sram_ProcessEndingSave
Sram_ProcessEndingSave: @ 0x0807F2B4
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	beq _0807F2DA
	cmp r1, #1
	bgt _0807F2CA
	cmp r1, #0
	beq _0807F2D4
	b _0807F330
_0807F2CA:
	cmp r1, #2
	beq _0807F2E8
	cmp r1, #3
	beq _0807F310
	b _0807F330
_0807F2D4:
	bl ReadMostRecentFileFromGamePak
	b _0807F330
_0807F2DA:
	ldr r0, _0807F2E4 @ =0x03000014
	strb r1, [r0]
	bl Sram_CopyGameCompletion
	b _0807F330
	.align 2, 0
_0807F2E4: .4byte 0x03000014
_0807F2E8:
	bl WriteMostRecentFileToGamePak
	ldr r2, _0807F304 @ =0x03000B94
	ldr r0, _0807F308 @ =0x03000B8D
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, _0807F30C @ =0x03000014
	ldrb r1, [r1]
	strb r1, [r0, #0x10]
	b _0807F330
	.align 2, 0
_0807F304: .4byte 0x03000B94
_0807F308: .4byte 0x03000B8D
_0807F30C: .4byte 0x03000014
_0807F310:
	ldr r1, _0807F338 @ =0x0858225C
	ldr r0, _0807F33C @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r0, r1
	ldr r1, [r1]
	ldr r2, _0807F340 @ =0x08582268
	adds r0, r0, r2
	ldr r2, [r0]
	movs r3, #0x90
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_0807F330:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807F338: .4byte 0x0858225C
_0807F33C: .4byte 0x03000B8D
_0807F340: .4byte 0x08582268

	thumb_func_start Sram_CopyGameCompletion
Sram_CopyGameCompletion: @ 0x0807F344
	push {r4, lr}
	ldr r2, _0807F3A0 @ =0x0858225C
	ldr r1, _0807F3A4 @ =0x03000B8D
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	movs r0, #0
	str r0, [r3, #0x10]
	subs r0, #1
	str r0, [r3, #0x14]
	ldr r0, _0807F3A8 @ =0x03000014
	ldrb r0, [r0]
	strb r0, [r3, #0x18]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r1, #0
	movs r4, #0x8f
_0807F36C:
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	subs r4, #1
	cmp r4, #0
	bge _0807F36C
	str r1, [r3, #0x10]
	mvns r0, r1
	str r0, [r3, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F3A0: .4byte 0x0858225C
_0807F3A4: .4byte 0x03000B8D
_0807F3A8: .4byte 0x03000014

	thumb_func_start Sram_QuickSave
Sram_QuickSave: @ 0x0807F3AC
	push {lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r0, #0
	cmp r0, #1
	beq _0807F3E8
	cmp r0, #1
	bgt _0807F3C4
	cmp r0, #0
	beq _0807F3CE
	b _0807F434
_0807F3C4:
	cmp r1, #2
	beq _0807F3F2
	cmp r1, #3
	beq _0807F414
	b _0807F434
_0807F3CE:
	ldr r0, _0807F3E0 @ =gDisableSoftReset
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0807F3E4 @ =0x03000B90
	strb r1, [r0]
	bl unk_d34
	b _0807F43A
	.align 2, 0
_0807F3E0: .4byte gDisableSoftReset
_0807F3E4: .4byte 0x03000B90
_0807F3E8:
	bl SramWrite_WorldData
	bl SramWrite_ToEwram
	b _0807F43A
_0807F3F2:
	bl WriteMostRecentFileToGamePak
	ldr r2, _0807F40C @ =0x03000B94
	ldr r0, _0807F410 @ =0x03000B8D
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	b _0807F43A
	.align 2, 0
_0807F40C: .4byte 0x03000B94
_0807F410: .4byte 0x03000B8D
_0807F414:
	ldr r1, _0807F440 @ =0x0858225C
	ldr r0, _0807F444 @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r0, r1
	ldr r1, [r1]
	ldr r2, _0807F448 @ =0x08582268
	adds r0, r0, r2
	ldr r2, [r0]
	movs r3, #0x90
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
_0807F434:
	ldr r1, _0807F44C @ =gDisableSoftReset
	movs r0, #0
	strb r0, [r1]
_0807F43A:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807F440: .4byte 0x0858225C
_0807F444: .4byte 0x03000B8D
_0807F448: .4byte 0x08582268
_0807F44C: .4byte gDisableSoftReset

	thumb_func_start SramWrite_ToEwram
SramWrite_ToEwram: @ 0x0807F450
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	ldr r4, _0807F6F8 @ =gMusicInfo
	ldrh r1, [r4, #0x1c]
	ldr r0, _0807F6FC @ =0xFFFF0000
	ands r0, r5
	orrs r0, r1
	ldrh r1, [r4, #0x1e]
	lsls r1, r1, #0x10
	ldr r3, _0807F700 @ =0x0000FFFF
	ands r0, r3
	adds r5, r0, #0
	orrs r5, r1
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	ldr r2, _0807F704 @ =0xFFFFFF00
	ands r2, r6
	orrs r2, r0
	adds r0, r4, #0
	adds r0, #0x21
	ldrb r1, [r0]
	lsls r1, r1, #8
	ldr r0, _0807F708 @ =0xFFFF00FF
	ands r0, r2
	orrs r0, r1
	ldrh r1, [r4, #2]
	lsls r1, r1, #0x10
	ands r0, r3
	adds r6, r0, #0
	orrs r6, r1
	ldr r1, _0807F70C @ =0x0858225C
	ldr r0, _0807F710 @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r1, _0807F714 @ =0x08582200
	adds r0, r4, #0
	bl Sram_StringCopy_MetroidEpisode4A
	movs r0, #0
	str r0, [r4, #0x10]
	subs r0, #1
	str r0, [r4, #0x14]
	ldr r0, _0807F718 @ =0x03000014
	ldr r0, [r0]
	str r0, [r4, #0x18]
	ldr r0, _0807F71C @ =0x03000B90
	ldrb r0, [r0]
	strb r0, [r4, #0x1c]
	ldr r0, _0807F720 @ =gCurrentArea
	ldrb r0, [r0]
	strb r0, [r4, #0x1d]
	ldr r0, _0807F724 @ =gCurrentRoom
	ldrb r0, [r0]
	strb r0, [r4, #0x1e]
	ldr r0, _0807F728 @ =gLastDoorUsed
	ldrb r0, [r0]
	strb r0, [r4, #0x1f]
	ldr r0, _0807F72C @ =gAbilityCount
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, _0807F730 @ =gEventCounter
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, _0807F734 @ =gPreviousNavigationConversation
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _0807F738 @ =gPreviousCutscene
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	ldr r0, _0807F73C @ =0x03000031
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	ldr r0, _0807F740 @ =0x03000032
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x25
	strb r0, [r1]
	ldr r0, _0807F744 @ =gSubEventCounter
	ldrh r0, [r0]
	strh r0, [r4, #0x26]
	ldr r0, _0807F748 @ =gPreviousSubEvent
	ldrh r0, [r0]
	strh r0, [r4, #0x28]
	ldr r0, _0807F74C @ =0x0300004D
	ldrb r0, [r0]
	adds r1, #5
	strb r0, [r1]
	ldr r0, _0807F750 @ =gSecurityHatchLevelBackup
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	ldr r0, _0807F754 @ =0x03000124
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r0, _0807F758 @ =0x03001224
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	ldr r0, _0807F75C @ =0x03001226
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x42
	strh r0, [r1]
	ldr r0, _0807F760 @ =gBg1XPosition
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x44
	strh r1, [r0]
	ldr r0, _0807F764 @ =gBg1YPosition
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x46
	strh r0, [r1]
	ldr r0, _0807F768 @ =0x0300122C
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r1, [r0]
	ldr r0, _0807F76C @ =0x0300122E
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldr r0, _0807F770 @ =0x03001230
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, _0807F774 @ =0x03001232
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4e
	strh r0, [r1]
	movs r3, #0
	adds r2, r4, #0
	adds r2, #0x50
	ldr r7, _0807F778 @ =0x03000033
_0807F588:
	adds r0, r2, r3
	adds r1, r3, r7
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #7
	ble _0807F588
	movs r3, #0
	movs r7, #0x60
	adds r7, r7, r4
	mov ip, r7
	movs r0, #0x8c
	adds r0, r0, r4
	mov r8, r0
	movs r1, #0x98
	adds r1, r1, r4
	mov sb, r1
	movs r2, #0xa4
	adds r2, r2, r4
	mov sl, r2
	adds r7, r4, #0
	adds r7, #0xb4
	str r7, [sp]
	adds r0, r4, #0
	adds r0, #0xc4
	str r0, [sp, #4]
	adds r1, r4, #0
	adds r1, #0xd4
	str r1, [sp, #8]
	adds r2, r4, #0
	adds r2, #0xd6
	str r2, [sp, #0xc]
	adds r7, #0x24
	str r7, [sp, #0x10]
	adds r0, #0x16
	str r0, [sp, #0x14]
	adds r1, #8
	str r1, [sp, #0x18]
	adds r2, #8
	str r2, [sp, #0x1c]
	adds r7, #8
	str r7, [sp, #0x20]
	adds r0, #8
	str r0, [sp, #0x24]
	adds r1, #7
	str r1, [sp, #0x28]
	adds r2, #6
	str r2, [sp, #0x2c]
	adds r7, #8
	str r7, [sp, #0x30]
	adds r0, #0xe
	str r0, [sp, #0x34]
	subs r2, #0x8c
	ldr r7, _0807F77C @ =0x0300003B
_0807F5F4:
	adds r0, r2, r3
	adds r1, r3, r7
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #7
	ble _0807F5F4
	mov r1, ip
	ldr r0, _0807F780 @ =gSamusData
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	mov r1, r8
	ldr r0, _0807F784 @ =gSamusAnimationInfo
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	mov r1, sb
	ldr r0, _0807F788 @ =0x030012E4
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	mov r1, sl
	ldr r0, _0807F78C @ =0x030012F0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, [sp]
	ldr r0, _0807F78C @ =0x030012F0
	adds r0, #0x10
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, [sp, #4]
	ldr r0, _0807F790 @ =gEquipment
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldr r0, [r0]
	str r0, [r1]
	ldr r7, _0807F794 @ =gPreventMovementTimer
	ldrh r0, [r7]
	ldr r1, [sp, #8]
	strh r0, [r1]
	ldr r2, _0807F798 @ =gDisableDrawingSamusAndScrollingFlag
	ldrb r0, [r2]
	ldr r3, [sp, #0xc]
	strb r0, [r3]
	ldr r7, _0807F79C @ =gAtmosphericStabilizersOnline
	ldrh r0, [r7]
	ldr r1, [sp, #0x10]
	strh r0, [r1]
	ldr r2, _0807F7A0 @ =gNormalXBarrierCoresDestroyed
	ldrh r0, [r2]
	ldr r3, [sp, #0x14]
	strh r0, [r3]
	ldr r7, _0807F7A4 @ =gSuperXBarrierCoresDestroyed
	ldrh r0, [r7]
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	ldr r2, _0807F7A8 @ =gPowerBombXBarrierCoresDestroyed
	ldrh r0, [r2]
	ldr r3, [sp, #0x1c]
	strh r0, [r3]
	ldr r7, _0807F7AC @ =gGadorasDestroyed
	ldrh r0, [r7]
	ldr r1, [sp, #0x20]
	strh r0, [r1]
	ldr r2, _0807F7B0 @ =gMissilesHatchDestroyed
	ldrb r0, [r2]
	ldr r3, [sp, #0x24]
	strb r0, [r3]
	ldr r7, _0807F7B4 @ =gWaterLowered
	ldrb r0, [r7]
	ldr r1, [sp, #0x28]
	strb r0, [r1]
	ldr r2, _0807F7B8 @ =gInGameTimer
	ldr r0, [r2]
	ldr r3, [sp, #0x2c]
	str r0, [r3]
	ldr r7, [sp, #0x30]
	str r5, [r7]
	str r6, [r7, #4]
	ldr r0, [sp, #0x34]
	ldr r1, _0807F7BC @ =0x085821F8
	bl Sram_StringCopy_SAVE_END
	ldr r1, _0807F70C @ =0x0858225C
	ldr r0, _0807F710 @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	movs r1, #0
	movs r3, #0x8f
_0807F6BA:
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	ldm r2!, {r0}
	adds r1, r1, r0
	subs r3, #1
	cmp r3, #0
	bge _0807F6BA
	str r1, [r4, #0x10]
	mvns r0, r1
	str r0, [r4, #0x14]
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F6F8: .4byte gMusicInfo
_0807F6FC: .4byte 0xFFFF0000
_0807F700: .4byte 0x0000FFFF
_0807F704: .4byte 0xFFFFFF00
_0807F708: .4byte 0xFFFF00FF
_0807F70C: .4byte 0x0858225C
_0807F710: .4byte 0x03000B8D
_0807F714: .4byte 0x08582200
_0807F718: .4byte 0x03000014
_0807F71C: .4byte 0x03000B90
_0807F720: .4byte gCurrentArea
_0807F724: .4byte gCurrentRoom
_0807F728: .4byte gLastDoorUsed
_0807F72C: .4byte gAbilityCount
_0807F730: .4byte gEventCounter
_0807F734: .4byte gPreviousNavigationConversation
_0807F738: .4byte gPreviousCutscene
_0807F73C: .4byte 0x03000031
_0807F740: .4byte 0x03000032
_0807F744: .4byte gSubEventCounter
_0807F748: .4byte gPreviousSubEvent
_0807F74C: .4byte 0x0300004D
_0807F750: .4byte gSecurityHatchLevelBackup
_0807F754: .4byte 0x03000124
_0807F758: .4byte 0x03001224
_0807F75C: .4byte 0x03001226
_0807F760: .4byte gBg1XPosition
_0807F764: .4byte gBg1YPosition
_0807F768: .4byte 0x0300122C
_0807F76C: .4byte 0x0300122E
_0807F770: .4byte 0x03001230
_0807F774: .4byte 0x03001232
_0807F778: .4byte 0x03000033
_0807F77C: .4byte 0x0300003B
_0807F780: .4byte gSamusData
_0807F784: .4byte gSamusAnimationInfo
_0807F788: .4byte 0x030012E4
_0807F78C: .4byte 0x030012F0
_0807F790: .4byte gEquipment
_0807F794: .4byte gPreventMovementTimer
_0807F798: .4byte gDisableDrawingSamusAndScrollingFlag
_0807F79C: .4byte gAtmosphericStabilizersOnline
_0807F7A0: .4byte gNormalXBarrierCoresDestroyed
_0807F7A4: .4byte gSuperXBarrierCoresDestroyed
_0807F7A8: .4byte gPowerBombXBarrierCoresDestroyed
_0807F7AC: .4byte gGadorasDestroyed
_0807F7B0: .4byte gMissilesHatchDestroyed
_0807F7B4: .4byte gWaterLowered
_0807F7B8: .4byte gInGameTimer
_0807F7BC: .4byte 0x085821F8

	thumb_func_start SramRead_FromEwram
SramRead_FromEwram: @ 0x0807F7C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r1, _0807F9F8 @ =0x0858225C
	ldr r0, _0807F9FC @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r1, _0807FA00 @ =0x03000014
	ldr r0, [r2, #0x18]
	str r0, [r1]
	ldr r1, _0807FA04 @ =0x03000B90
	ldrb r0, [r2, #0x1c]
	strb r0, [r1]
	ldr r1, _0807FA08 @ =gCurrentArea
	ldrb r0, [r2, #0x1d]
	strb r0, [r1]
	ldr r1, _0807FA0C @ =gCurrentRoom
	ldrb r0, [r2, #0x1e]
	strb r0, [r1]
	ldr r1, _0807FA10 @ =gLastDoorUsed
	ldrb r0, [r2, #0x1f]
	strb r0, [r1]
	ldr r1, _0807FA14 @ =gAbilityCount
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0807FA18 @ =gEventCounter
	adds r0, r2, #0
	adds r0, #0x21
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0807FA1C @ =gPreviousNavigationConversation
	adds r0, r2, #0
	adds r0, #0x22
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0807FA20 @ =gPreviousCutscene
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0807FA24 @ =0x03000031
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0807FA28 @ =0x03000032
	adds r0, r2, #0
	adds r0, #0x25
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0807FA2C @ =gSubEventCounter
	ldrh r0, [r2, #0x26]
	strh r0, [r1]
	ldr r1, _0807FA30 @ =gPreviousSubEvent
	ldrh r0, [r2, #0x28]
	strh r0, [r1]
	ldr r1, _0807FA34 @ =0x0300004D
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0807FA38 @ =gSecurityHatchLevelBackup
	adds r0, r2, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r1, _0807FA3C @ =0x03000124
	adds r0, r2, #0
	adds r0, #0x2c
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	ldr r1, _0807FA40 @ =0x03001224
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807FA44 @ =0x03001226
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807FA48 @ =gBg1XPosition
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807FA4C @ =gBg1YPosition
	adds r0, r2, #0
	adds r0, #0x46
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807FA50 @ =0x0300122C
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807FA54 @ =0x0300122E
	adds r0, r2, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807FA58 @ =0x03001230
	adds r0, r2, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0807FA5C @ =0x03001232
	adds r0, r2, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	strh r0, [r1]
	movs r3, #0
	ldr r5, _0807FA60 @ =gMusicInfo
	mov ip, r5
	ldr r5, _0807FA64 @ =0x03000033
	adds r4, r2, #0
	adds r4, #0x50
_0807F8BC:
	adds r0, r3, r5
	adds r1, r4, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #7
	ble _0807F8BC
	movs r3, #0
	adds r5, r2, #0
	adds r5, #0x60
	adds r6, r2, #0
	adds r6, #0x8c
	adds r7, r2, #0
	adds r7, #0x98
	movs r0, #0xa4
	adds r0, r0, r2
	mov r8, r0
	movs r1, #0xb4
	adds r1, r1, r2
	mov sb, r1
	movs r4, #0xc4
	adds r4, r4, r2
	mov sl, r4
	adds r0, r2, #0
	adds r0, #0xd4
	str r0, [sp]
	adds r1, r2, #0
	adds r1, #0xd6
	str r1, [sp, #4]
	adds r4, r2, #0
	adds r4, #0xd8
	str r4, [sp, #8]
	adds r0, #6
	str r0, [sp, #0xc]
	adds r1, #6
	str r1, [sp, #0x10]
	adds r4, #6
	str r4, [sp, #0x14]
	adds r0, #6
	str r0, [sp, #0x18]
	adds r1, #6
	str r1, [sp, #0x1c]
	adds r4, #5
	str r4, [sp, #0x20]
	adds r0, #4
	str r0, [sp, #0x24]
	adds r1, #6
	str r1, [sp, #0x28]
	ldr r4, _0807FA68 @ =0x0300003B
	adds r2, #0x58
_0807F920:
	adds r0, r3, r4
	adds r1, r2, r3
	ldrb r1, [r1]
	strb r1, [r0]
	adds r3, #1
	cmp r3, #7
	ble _0807F920
	ldr r1, _0807FA6C @ =gSamusData
	adds r0, r5, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	ldr r1, _0807FA70 @ =gSamusAnimationInfo
	adds r0, r6, #0
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r1, _0807FA74 @ =0x030012E4
	adds r0, r7, #0
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldr r1, _0807FA78 @ =0x030012F0
	mov r0, r8
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _0807FA78 @ =0x030012F0
	adds r1, #0x10
	mov r0, sb
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _0807FA7C @ =gEquipment
	mov r0, sl
	ldm r0!, {r2, r3, r5}
	stm r1!, {r2, r3, r5}
	ldr r0, [r0]
	str r0, [r1]
	ldr r4, [sp]
	ldrh r0, [r4]
	ldr r5, _0807FA80 @ =gPreventMovementTimer
	strh r0, [r5]
	ldr r1, [sp, #4]
	ldrb r0, [r1]
	ldr r2, _0807FA84 @ =gDisableDrawingSamusAndScrollingFlag
	strb r0, [r2]
	ldr r3, [sp, #8]
	ldrh r0, [r3]
	ldr r4, _0807FA88 @ =gAtmosphericStabilizersOnline
	strh r0, [r4]
	ldr r5, [sp, #0xc]
	ldrh r0, [r5]
	ldr r1, _0807FA8C @ =gNormalXBarrierCoresDestroyed
	strh r0, [r1]
	ldr r2, [sp, #0x10]
	ldrh r0, [r2]
	ldr r3, _0807FA90 @ =gSuperXBarrierCoresDestroyed
	strh r0, [r3]
	ldr r4, [sp, #0x14]
	ldrh r0, [r4]
	ldr r5, _0807FA94 @ =gPowerBombXBarrierCoresDestroyed
	strh r0, [r5]
	ldr r1, [sp, #0x18]
	ldrh r0, [r1]
	ldr r2, _0807FA98 @ =gGadorasDestroyed
	strh r0, [r2]
	ldr r3, [sp, #0x1c]
	ldrb r0, [r3]
	ldr r4, _0807FA9C @ =gMissilesHatchDestroyed
	strb r0, [r4]
	ldr r5, [sp, #0x20]
	ldrb r0, [r5]
	ldr r1, _0807FAA0 @ =gWaterLowered
	strb r0, [r1]
	ldr r2, [sp, #0x24]
	ldr r0, [r2]
	ldr r3, _0807FAA4 @ =gInGameTimer
	str r0, [r3]
	ldr r4, [sp, #0x28]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	mov r5, ip
	strh r0, [r5, #0x1c]
	lsrs r2, r0, #0x10
	strh r2, [r5, #0x1e]
	mov r2, ip
	adds r2, #0x20
	strb r1, [r2]
	lsrs r2, r1, #8
	mov r3, ip
	adds r3, #0x21
	strb r2, [r3]
	lsrs r0, r1, #0x10
	strh r0, [r5, #2]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807F9F8: .4byte 0x0858225C
_0807F9FC: .4byte 0x03000B8D
_0807FA00: .4byte 0x03000014
_0807FA04: .4byte 0x03000B90
_0807FA08: .4byte gCurrentArea
_0807FA0C: .4byte gCurrentRoom
_0807FA10: .4byte gLastDoorUsed
_0807FA14: .4byte gAbilityCount
_0807FA18: .4byte gEventCounter
_0807FA1C: .4byte gPreviousNavigationConversation
_0807FA20: .4byte gPreviousCutscene
_0807FA24: .4byte 0x03000031
_0807FA28: .4byte 0x03000032
_0807FA2C: .4byte gSubEventCounter
_0807FA30: .4byte gPreviousSubEvent
_0807FA34: .4byte 0x0300004D
_0807FA38: .4byte gSecurityHatchLevelBackup
_0807FA3C: .4byte 0x03000124
_0807FA40: .4byte 0x03001224
_0807FA44: .4byte 0x03001226
_0807FA48: .4byte gBg1XPosition
_0807FA4C: .4byte gBg1YPosition
_0807FA50: .4byte 0x0300122C
_0807FA54: .4byte 0x0300122E
_0807FA58: .4byte 0x03001230
_0807FA5C: .4byte 0x03001232
_0807FA60: .4byte gMusicInfo
_0807FA64: .4byte 0x03000033
_0807FA68: .4byte 0x0300003B
_0807FA6C: .4byte gSamusData
_0807FA70: .4byte gSamusAnimationInfo
_0807FA74: .4byte 0x030012E4
_0807FA78: .4byte 0x030012F0
_0807FA7C: .4byte gEquipment
_0807FA80: .4byte gPreventMovementTimer
_0807FA84: .4byte gDisableDrawingSamusAndScrollingFlag
_0807FA88: .4byte gAtmosphericStabilizersOnline
_0807FA8C: .4byte gNormalXBarrierCoresDestroyed
_0807FA90: .4byte gSuperXBarrierCoresDestroyed
_0807FA94: .4byte gPowerBombXBarrierCoresDestroyed
_0807FA98: .4byte gGadorasDestroyed
_0807FA9C: .4byte gMissilesHatchDestroyed
_0807FAA0: .4byte gWaterLowered
_0807FAA4: .4byte gInGameTimer

	thumb_func_start Sram_StringCopy_MetroidEpisode4A
Sram_StringCopy_MetroidEpisode4A: @ 0x0807FAA8
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
_0807FAB0:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #0xf
	ble _0807FAB0
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Sram_StringCopy_SAVE_END
Sram_StringCopy_SAVE_END: @ 0x0807FAC4
	push {r4, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	movs r2, #0
_0807FACC:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _0807FACC
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SramTestFlash
SramTestFlash: @ 0x0807FAE0
	push {r4, r5, lr}
	sub sp, #0x10
	movs r5, #0
	ldr r0, _0807FB3C @ =0x03000B8E
	strb r5, [r0]
	ldr r0, _0807FB40 @ =0x085821E8
	ldr r4, _0807FB44 @ =0x0E007FE0
	adds r1, r4, #0
	movs r2, #0x10
	bl SramWriteChecked
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r5, r1, #0x1f
	adds r0, r4, #0
	mov r1, sp
	movs r2, #0x10
	bl SramWriteUnckecked
	movs r2, #0
_0807FB08:
	mov r0, sp
	adds r1, r0, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r2, #1
	cmp r2, #0xf
	ble _0807FB08
	ldr r1, _0807FB44 @ =0x0E007FE0
	mov r0, sp
	movs r2, #0x10
	bl SramWriteChecked
	cmp r0, #0
	beq _0807FB2A
	movs r0, #2
	orrs r5, r0
_0807FB2A:
	ldr r1, _0807FB3C @ =0x03000B8E
	rsbs r0, r5, #0
	orrs r0, r5
	lsrs r0, r0, #0x1f
	strb r0, [r1]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807FB3C: .4byte 0x03000B8E
_0807FB40: .4byte 0x085821E8
_0807FB44: .4byte 0x0E007FE0

	thumb_func_start Sram_BackupCurrentFile_Unused
Sram_BackupCurrentFile_Unused: @ 0x0807FB48
	push {lr}
	sub sp, #4
	ldr r1, _0807FB78 @ =0x0858225C
	ldr r0, _0807FB7C @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r1, r0, r1
	ldr r1, [r1]
	ldr r2, _0807FB80 @ =0x08582268
	adds r0, r0, r2
	ldr r2, [r0]
	movs r3, #0x90
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	bl unk_d34
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807FB78: .4byte 0x0858225C
_0807FB7C: .4byte 0x03000B8D
_0807FB80: .4byte 0x08582268

	thumb_func_start unk_7fb84
unk_7fb84: @ 0x0807FB84
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	add r0, sp, #4
	movs r1, #0
	movs r2, #0x14
	bl memset
	ldr r2, _0807FC1C @ =0x03000B94
	movs r5, #2
_0807FB9E:
	adds r1, r2, #0
	add r0, sp, #4
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	ldm r0!, {r3, r4}
	stm r1!, {r3, r4}
	adds r2, #0x14
	subs r5, #1
	cmp r5, #0
	bge _0807FB9E
	ldr r4, _0807FC20 @ =0x03000B8D
	movs r1, #0
	strb r1, [r4]
	ldr r0, _0807FC24 @ =gIsLoadingFile
	strb r1, [r0]
	ldr r0, _0807FC28 @ =0x03000B8E
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807FBC8
	bl ReadAllGamePakSRAM
_0807FBC8:
	movs r5, #0
	adds r7, r4, #0
	movs r6, #0x10
	ldr r0, _0807FC1C @ =0x03000B94
	str r0, [sp, #0x18]
	ldr r1, _0807FC2C @ =0x0858225C
	mov sl, r1
	ldr r3, _0807FC30 @ =0x0000FFFF
	mov sb, r3
	movs r4, #0x90
	lsls r4, r4, #5
	mov r8, r4
_0807FBE0:
	strb r5, [r7]
	bl unk_7fd10
	ldrb r0, [r7]
	lsls r2, r0, #2
	adds r0, r2, r0
	lsls r0, r0, #2
	ldr r1, _0807FC1C @ =0x03000B94
	adds r0, r0, r1
	ldrb r4, [r0, #1]
	cmp r4, #0
	bne _0807FC38
	mov r3, sl
	adds r0, r2, r3
	ldr r1, [r0]
	ldr r4, _0807FC34 @ =0x08582268
	adds r0, r2, r4
	ldr r2, [r0]
	str r6, [sp]
	movs r0, #3
	movs r3, #0x90
	lsls r3, r3, #5
	bl DmaTransfer
	bl unk_d34
	movs r0, #1
	ldr r1, [sp, #0x18]
	strb r0, [r1]
	b _0807FCE6
	.align 2, 0
_0807FC1C: .4byte 0x03000B94
_0807FC20: .4byte 0x03000B8D
_0807FC24: .4byte gIsLoadingFile
_0807FC28: .4byte 0x03000B8E
_0807FC2C: .4byte 0x0858225C
_0807FC30: .4byte 0x0000FFFF
_0807FC34: .4byte 0x08582268
_0807FC38:
	cmp r4, #1
	bne _0807FC60
	ldr r3, _0807FC5C @ =0x08582268
	adds r0, r2, r3
	ldr r1, [r0]
	mov r3, sl
	adds r0, r2, r3
	ldr r2, [r0]
	str r6, [sp]
	movs r0, #3
	movs r3, #0x90
	lsls r3, r3, #5
	bl DmaTransfer
	ldr r0, [sp, #0x18]
	strb r4, [r0]
	b _0807FCE6
	.align 2, 0
_0807FC5C: .4byte 0x08582268
_0807FC60:
	cmp r4, #2
	bne _0807FC94
	mov r1, sl
	adds r0, r2, r1
	ldr r2, [r0]
	str r6, [sp]
	movs r0, #3
	mov r1, sb
	mov r3, r8
	bl BitFill
	ldrb r0, [r7]
	lsls r0, r0, #2
	ldr r3, _0807FC90 @ =0x08582268
	adds r0, r0, r3
	ldr r2, [r0]
	str r6, [sp]
	movs r0, #3
	mov r1, sb
	mov r3, r8
	bl BitFill
	b _0807FCE6
	.align 2, 0
_0807FC90: .4byte 0x08582268
_0807FC94:
	cmp r4, #3
	bne _0807FCE4
	mov r4, sl
	adds r0, r2, r4
	ldr r2, [r0]
	str r6, [sp]
	movs r0, #3
	mov r1, sb
	mov r3, r8
	bl BitFill
	bl WriteMostRecentFileToGamePak
	ldrb r0, [r7]
	lsls r0, r0, #2
	ldr r1, _0807FCDC @ =0x08582268
	adds r0, r0, r1
	ldr r2, [r0]
	str r6, [sp]
	movs r0, #3
	mov r1, sb
	mov r3, r8
	bl BitFill
	bl unk_d34
	ldrb r1, [r7]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r3, _0807FCE0 @ =0x03000B94
	adds r0, r0, r3
	movs r1, #0
	strb r1, [r0, #1]
	b _0807FCE6
	.align 2, 0
_0807FCDC: .4byte 0x08582268
_0807FCE0: .4byte 0x03000B94
_0807FCE4:
	b _0807FCE4
_0807FCE6:
	ldr r4, [sp, #0x18]
	adds r4, #0x14
	str r4, [sp, #0x18]
	adds r5, #1
	cmp r5, #2
	bgt _0807FCF4
	b _0807FBE0
_0807FCF4:
	movs r1, #0
	ldr r0, _0807FD0C @ =0x03000B8D
	strb r1, [r0]
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FD0C: .4byte 0x03000B8D

	thumb_func_start unk_7fd10
unk_7fd10: @ 0x0807FD10
	push {r4, r5, lr}
	movs r0, #0
	bl unk_7fdb0
	adds r4, r0, #0
	movs r0, #1
	bl unk_7fdb0
	adds r2, r0, #0
	cmp r4, #0
	bne _0807FD40
	ldr r2, _0807FD38 @ =0x03000B94
	ldr r0, _0807FD3C @ =0x03000B8D
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	strb r4, [r0, #1]
	b _0807FDAA
	.align 2, 0
_0807FD38: .4byte 0x03000B94
_0807FD3C: .4byte 0x03000B8D
_0807FD40:
	cmp r4, #1
	bne _0807FD6C
	ldr r5, _0807FD64 @ =0x03000B94
	ldr r3, _0807FD68 @ =0x03000B8D
	ldrb r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	strb r4, [r0, #1]
	cmp r2, #0
	beq _0807FDAA
	ldrb r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r5
	b _0807FDA6
	.align 2, 0
_0807FD64: .4byte 0x03000B94
_0807FD68: .4byte 0x03000B8D
_0807FD6C:
	ldr r4, _0807FD90 @ =0x03000B94
	ldr r3, _0807FD94 @ =0x03000B8D
	ldrb r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #3
	strb r0, [r1, #1]
	cmp r2, #0
	bne _0807FD98
	ldrb r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r0, #1
	b _0807FDA8
	.align 2, 0
_0807FD90: .4byte 0x03000B94
_0807FD94: .4byte 0x03000B8D
_0807FD98:
	cmp r2, #1
	bne _0807FDAA
	ldrb r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r4
_0807FDA6:
	movs r0, #2
_0807FDA8:
	strb r0, [r1, #1]
_0807FDAA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_7fdb0
unk_7fdb0: @ 0x0807FDB0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	movs r5, #0
	movs r7, #0
	cmp r0, #0
	bne _0807FDC8
	ldr r1, _0807FDC4 @ =0x0858225C
	b _0807FDCA
	.align 2, 0
_0807FDC4: .4byte 0x0858225C
_0807FDC8:
	ldr r1, _0807FE50 @ =0x08582268
_0807FDCA:
	ldr r0, _0807FE54 @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r3, r4, #0
	movs r1, #0
	ldr r6, [r4, #0x10]
	movs r2, #0x8f
_0807FDDC:
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	ldm r3!, {r0}
	adds r1, r1, r0
	subs r2, #1
	cmp r2, #0
	bge _0807FDDC
	cmp r6, r1
	bne _0807FE0E
	ldr r0, [r4, #0x14]
	mvns r0, r0
	cmp r6, r0
	beq _0807FE12
_0807FE0E:
	movs r0, #1
	orrs r5, r0
_0807FE12:
	movs r2, #0
	ldr r6, _0807FE58 @ =0x08582200
	movs r3, #1
_0807FE18:
	adds r0, r2, r6
	adds r1, r4, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0807FE26
	orrs r7, r3
_0807FE26:
	adds r2, #1
	cmp r2, #0xf
	ble _0807FE18
	adds r0, r7, #0
	adds r5, r5, r0
	cmp r5, #1
	ble _0807FE46
	ldr r1, _0807FE5C @ =0x0000FFFF
	movs r3, #0x90
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r2, r4, #0
	bl BitFill
_0807FE46:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0807FE50: .4byte 0x08582268
_0807FE54: .4byte 0x03000B8D
_0807FE58: .4byte 0x08582200
_0807FE5C: .4byte 0x0000FFFF

	thumb_func_start SramLoad_CurrentSave
SramLoad_CurrentSave: @ 0x0807FE60
	push {lr}
	ldr r0, _0807FE8C @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0807FE88
	bl SramRead_FromEwram
	bl SramRead_WorldData
	ldr r0, _0807FE90 @ =gSamusData
	movs r2, #0
	movs r1, #0x3d
	strb r1, [r0, #1]
	adds r1, r0, #0
	adds r1, #0x21
	strb r2, [r1]
	adds r0, #0x22
	strb r2, [r0]
_0807FE88:
	pop {r0}
	bx r0
	.align 2, 0
_0807FE8C: .4byte gIsLoadingFile
_0807FE90: .4byte gSamusData

	thumb_func_start SramLoad_CurrentSave_Unused
SramLoad_CurrentSave_Unused: @ 0x0807FE94
	push {lr}
	bl SramRead_FromEwram
	bl SramRead_WorldData
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SramWrite_WorldData
SramWrite_WorldData: @ 0x0807FEA4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r1, _0807FF5C @ =0x08582274
	ldr r0, _0807FF60 @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r1, _0807FF64 @ =0x02037C00
	movs r4, #0xe0
	lsls r4, r4, #2
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	mov r2, r8
	adds r3, r4, #0
	bl DmaTransfer
	adds r7, r4, #0
	movs r5, #0
_0807FED2:
	ldr r0, _0807FF68 @ =0x03000033
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r4, r0, r1
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0807FEEA
	ldr r0, _0807FF6C @ =0x0000FFFC
	ands r4, r0
	adds r4, #4
_0807FEEA:
	cmp r4, #0
	beq _0807FF0E
	adds r1, r5, #0
	cmp r5, #0
	beq _0807FEF6
	adds r1, r5, #1
_0807FEF6:
	lsls r1, r1, #9
	ldr r0, _0807FF70 @ =0x02036000
	adds r1, r1, r0
	mov r0, r8
	adds r2, r0, r7
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r3, r4, #0
	bl DmaTransfer
	adds r7, r7, r4
_0807FF0E:
	adds r5, #1
	cmp r5, #7
	ble _0807FED2
	movs r7, #0xc8
	lsls r7, r7, #4
	movs r5, #0
_0807FF1A:
	ldr r0, _0807FF74 @ =0x0300003B
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r4, r0, #2
	adds r6, r5, #1
	cmp r4, #0
	beq _0807FF48
	adds r1, r5, #0
	cmp r1, #0
	beq _0807FF30
	adds r1, r6, #0
_0807FF30:
	lsls r1, r1, #8
	ldr r0, _0807FF78 @ =0x02037200
	adds r1, r1, r0
	mov r0, r8
	adds r2, r0, r7
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r3, r4, #0
	bl DmaTransfer
	adds r7, r7, r4
_0807FF48:
	adds r5, r6, #0
	cmp r5, #7
	ble _0807FF1A
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FF5C: .4byte 0x08582274
_0807FF60: .4byte 0x03000B8D
_0807FF64: .4byte 0x02037C00
_0807FF68: .4byte 0x03000033
_0807FF6C: .4byte 0x0000FFFC
_0807FF70: .4byte 0x02036000
_0807FF74: .4byte 0x0300003B
_0807FF78: .4byte 0x02037200

	thumb_func_start SramRead_WorldData
SramRead_WorldData: @ 0x0807FF7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r1, _08080044 @ =0x08582274
	ldr r0, _08080048 @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
	ldr r2, _0808004C @ =0x02037C00
	movs r5, #0xe0
	lsls r5, r5, #2
	movs r4, #0x10
	str r4, [sp]
	movs r0, #3
	mov r1, r8
	adds r3, r5, #0
	bl DmaTransfer
	ldr r1, _08080050 @ =0x0000FFFF
	ldr r2, _08080054 @ =0x02036000
	movs r3, #0xd8
	lsls r3, r3, #5
	str r4, [sp]
	movs r0, #3
	bl BitFill
	adds r7, r5, #0
	movs r5, #0
_0807FFBA:
	ldr r0, _08080058 @ =0x03000033
	adds r0, r5, r0
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r4, r0, r1
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	beq _0807FFD2
	ldr r0, _0808005C @ =0x0000FFFC
	ands r4, r0
	adds r4, #4
_0807FFD2:
	cmp r4, #0
	beq _0807FFF6
	adds r2, r5, #0
	cmp r5, #0
	beq _0807FFDE
	adds r2, r5, #1
_0807FFDE:
	mov r0, r8
	adds r1, r0, r7
	lsls r2, r2, #9
	ldr r0, _08080054 @ =0x02036000
	adds r2, r2, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r3, r4, #0
	bl DmaTransfer
	adds r7, r7, r4
_0807FFF6:
	adds r5, #1
	cmp r5, #7
	ble _0807FFBA
	movs r7, #0xc8
	lsls r7, r7, #4
	movs r5, #0
_08080002:
	ldr r0, _08080060 @ =0x0300003B
	adds r0, r5, r0
	ldrb r0, [r0]
	lsls r4, r0, #2
	adds r6, r5, #1
	cmp r4, #0
	beq _08080030
	adds r2, r5, #0
	cmp r2, #0
	beq _08080018
	adds r2, r6, #0
_08080018:
	mov r0, r8
	adds r1, r0, r7
	lsls r2, r2, #8
	ldr r0, _08080064 @ =0x02037200
	adds r2, r2, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	adds r3, r4, #0
	bl DmaTransfer
	adds r7, r7, r4
_08080030:
	adds r5, r6, #0
	cmp r5, #7
	ble _08080002
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08080044: .4byte 0x08582274
_08080048: .4byte 0x03000B8D
_0808004C: .4byte 0x02037C00
_08080050: .4byte 0x0000FFFF
_08080054: .4byte 0x02036000
_08080058: .4byte 0x03000033
_0808005C: .4byte 0x0000FFFC
_08080060: .4byte 0x0300003B
_08080064: .4byte 0x02037200

	thumb_func_start SramWrite_MostRecentSaveFile
SramWrite_MostRecentSaveFile: @ 0x08080068
	push {r4, r5, lr}
	ldr r5, _080800E4 @ =0x0203F000
	adds r3, r5, #0
	movs r1, #0
	movs r0, #0x1e
	strb r0, [r5]
	ldrb r0, [r5, #1]
	adds r0, #1
	strb r0, [r5, #1]
	strh r1, [r5, #2]
	ldr r0, _080800E8 @ =0x0000FFFF
	strh r0, [r5, #4]
	ldr r0, _080800EC @ =0x03000B8D
	ldrb r0, [r0]
	strb r0, [r5, #0x16]
	ldr r2, _080800F0 @ =0x08582288
	adds r1, r5, #6
	movs r4, #0xf
_0808008C:
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x11]
	adds r2, #1
	adds r1, #1
	subs r4, #1
	cmp r4, #0
	bge _0808008C
	movs r1, #0
	movs r4, #7
_080800A2:
	ldrh r0, [r3]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	adds r3, #2
	lsrs r0, r0, #0x10
	ldrh r1, [r3]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	adds r3, #2
	lsrs r0, r0, #0x10
	ldrh r2, [r3]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	adds r3, #2
	lsrs r0, r0, #0x10
	ldrh r1, [r3]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _080800A2
	strh r1, [r5, #2]
	ldr r2, _080800E8 @ =0x0000FFFF
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r5, #4]
	bl unk_dd4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080800E4: .4byte 0x0203F000
_080800E8: .4byte 0x0000FFFF
_080800EC: .4byte 0x03000B8D
_080800F0: .4byte 0x08582288

	thumb_func_start SramRead_MostRecentSaveFile
SramRead_MostRecentSaveFile: @ 0x080800F4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08080194 @ =0x0203F000
	mov ip, r0
	ldrb r0, [r0]
	movs r1, #0x1e
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	ldr r6, _08080198 @ =0x03000B8D
	cmp r4, #0
	bne _080801A0
	mov r1, ip
	movs r3, #0
	ldrh r5, [r1, #2]
	movs r2, #7
_08080116:
	ldrh r0, [r1]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	adds r1, #2
	lsrs r0, r0, #0x10
	ldrh r3, [r1]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	adds r1, #2
	lsrs r0, r0, #0x10
	ldrh r3, [r1]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	adds r1, #2
	lsrs r0, r0, #0x10
	ldrh r3, [r1]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _08080116
	cmp r5, r3
	beq _0808014A
	movs r4, #2
_0808014A:
	cmp r4, #0
	bne _080801A0
	movs r2, #0
	ldr r0, _0808019C @ =0x08582288
	mov r3, ip
	ldrb r1, [r3, #6]
	adds r3, r0, #0
	ldrb r0, [r3]
	cmp r1, r0
	bne _080801A0
_0808015E:
	mov r0, ip
	adds r0, #0x17
	adds r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x10
	adds r1, r2, r1
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080801A0
	adds r2, #1
	cmp r2, #0xf
	bgt _0808018A
	mov r0, ip
	adds r0, #6
	adds r0, r0, r2
	adds r1, r2, r3
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0808015E
	movs r4, #3
_0808018A:
	cmp r4, #0
	bne _080801A0
	mov r1, ip
	ldrb r0, [r1, #0x16]
	b _080801BA
	.align 2, 0
_08080194: .4byte 0x0203F000
_08080198: .4byte 0x03000B8D
_0808019C: .4byte 0x08582288
_080801A0:
	mov r1, sp
	ldr r2, _080801C4 @ =0x0000FFFF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080801C8 @ =0x040000D4
	mov r3, sp
	str r3, [r1]
	ldr r0, _080801CC @ =0x0203F000
	str r0, [r1, #4]
	ldr r0, _080801D0 @ =0x81000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
_080801BA:
	strb r0, [r6]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080801C4: .4byte 0x0000FFFF
_080801C8: .4byte 0x040000D4
_080801CC: .4byte 0x0203F000
_080801D0: .4byte 0x81000020

	thumb_func_start SramWrite_Language
SramWrite_Language: @ 0x080801D4
	push {r4, r5, lr}
	ldr r5, _08080254 @ =0x0203F040
	adds r3, r5, #0
	movs r1, #0
	movs r0, #0x1f
	strb r0, [r5]
	ldrb r0, [r5, #1]
	adds r0, #1
	strb r0, [r5, #1]
	strh r1, [r5, #2]
	ldr r0, _08080258 @ =0x0000FFFF
	strh r0, [r5, #4]
	ldr r0, _0808025C @ =0x03000011
	ldrb r0, [r0]
	strb r0, [r5, #0x16]
	ldr r2, _08080260 @ =0x085822A8
	adds r1, r5, #6
	movs r4, #0xf
_080801F8:
	ldrb r0, [r2]
	strb r0, [r1]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x11]
	adds r2, #1
	adds r1, #1
	subs r4, #1
	cmp r4, #0
	bge _080801F8
	movs r1, #0
	movs r4, #7
_0808020E:
	ldrh r0, [r3]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	adds r3, #2
	lsrs r0, r0, #0x10
	ldrh r1, [r3]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	adds r3, #2
	lsrs r0, r0, #0x10
	ldrh r2, [r3]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	adds r3, #2
	lsrs r0, r0, #0x10
	ldrh r1, [r3]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bge _0808020E
	strh r1, [r5, #2]
	ldr r2, _08080258 @ =0x0000FFFF
	adds r0, r2, #0
	subs r0, r0, r1
	strh r0, [r5, #4]
	movs r0, #0
	bl unk_dec
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080254: .4byte 0x0203F040
_08080258: .4byte 0x0000FFFF
_0808025C: .4byte 0x03000011
_08080260: .4byte 0x085822A8

	thumb_func_start SramRead_Language
SramRead_Language: @ 0x08080264
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	mov r8, r0
	ldr r1, _080802E8 @ =0x08582280
	mov sb, r1
	ldr r6, _080802EC @ =0x040000D4
	ldr r2, _080802F0 @ =0x81000020
	mov sl, r2
_0808027E:
	mov r1, r8
	lsls r0, r1, #2
	add r0, sb
	ldr r5, [r0]
	adds r2, r5, #0
	ldrb r1, [r5]
	movs r0, #0x1f
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r4, r0, #0x1f
	cmp r4, #0
	bne _08080326
	movs r1, #0
	ldrh r7, [r5, #2]
	movs r3, #7
_0808029E:
	ldrh r0, [r2]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	adds r2, #2
	lsrs r0, r0, #0x10
	ldrh r1, [r2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	adds r2, #2
	lsrs r0, r0, #0x10
	ldrh r1, [r2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	adds r2, #2
	lsrs r0, r0, #0x10
	ldrh r1, [r2]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0808029E
	cmp r7, r1
	beq _080802D2
	movs r4, #2
_080802D2:
	cmp r4, #0
	bne _08080326
	movs r3, #0
	ldr r0, _080802F4 @ =0x085822A8
	ldrb r1, [r5, #6]
	adds r2, r0, #0
	ldrb r0, [r2]
	cmp r1, r0
	beq _080802FC
	b _08080324
	.align 2, 0
_080802E8: .4byte 0x08582280
_080802EC: .4byte 0x040000D4
_080802F0: .4byte 0x81000020
_080802F4: .4byte 0x085822A8
_080802F8:
	movs r4, #4
	b _08080326
_080802FC:
	adds r0, r5, #0
	adds r0, #0x17
	adds r0, r0, r3
	adds r1, r2, #0
	adds r1, #0x10
	adds r1, r3, r1
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _080802F8
	adds r3, #1
	cmp r3, #0xf
	bgt _08080326
	adds r0, r5, #6
	adds r0, r0, r3
	adds r1, r3, r2
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080802FC
_08080324:
	movs r4, #3
_08080326:
	mov r1, r8
	cmp r1, #0
	bne _0808034C
	cmp r4, #0
	bne _08080384
	mov r2, sb
	ldr r0, [r2]
	str r0, [r6]
	ldr r0, [r2, #4]
	str r0, [r6, #4]
	ldr r0, _08080348 @ =0x80000020
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	movs r0, #1
	bl unk_dec
	b _08080390
	.align 2, 0
_08080348: .4byte 0x80000020
_0808034C:
	cmp r4, #0
	beq _080803A0
	mov r0, sp
	movs r1, #0
	strh r1, [r0]
	str r0, [r6]
	mov r2, sb
	ldr r0, [r2]
	str r0, [r6, #4]
	mov r0, sl
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	movs r0, #0
	bl unk_dec
	mov r0, sp
	movs r1, #0
	strh r1, [r0]
	str r0, [r6]
	mov r2, sb
	ldr r0, [r2, #4]
	str r0, [r6, #4]
	mov r0, sl
	str r0, [r6, #8]
	ldr r0, [r6, #8]
	movs r0, #1
	bl unk_dec
_08080384:
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #1
	bgt _08080390
	b _0808027E
_08080390:
	cmp r4, #0
	bne _080803C8
	ldr r1, _0808039C @ =0x03000011
	ldrb r0, [r5, #0x16]
	b _080803CC
	.align 2, 0
_0808039C: .4byte 0x03000011
_080803A0:
	ldr r1, _080803BC @ =0x040000D4
	ldr r2, _080803C0 @ =0x08582280
	ldr r0, [r2, #4]
	str r0, [r1]
	ldr r0, [r2]
	str r0, [r1, #4]
	ldr r0, _080803C4 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0
	bl unk_dec
	b _08080390
	.align 2, 0
_080803BC: .4byte 0x040000D4
_080803C0: .4byte 0x08582280
_080803C4: .4byte 0x80000020
_080803C8:
	ldr r1, _080803E0 @ =0x03000011
	movs r0, #0
_080803CC:
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080803E0: .4byte 0x03000011

	thumb_func_start Sram_InitSaveFile
Sram_InitSaveFile: @ 0x080803E4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r2, _080804C8 @ =0x02037C00
	movs r3, #0xe0
	lsls r3, r3, #2
	movs r4, #0x10
	str r4, [sp]
	movs r0, #3
	movs r1, #0
	bl BitFill
	ldr r5, _080804CC @ =0x0000FFFF
	ldr r2, _080804D0 @ =0x02036000
	movs r3, #0x90
	lsls r3, r3, #5
	str r4, [sp]
	movs r0, #3
	adds r1, r5, #0
	bl BitFill
	ldr r2, _080804D4 @ =0x02037200
	movs r3, #0x90
	lsls r3, r3, #4
	str r4, [sp]
	movs r0, #3
	adds r1, r5, #0
	bl BitFill
	movs r1, #0
	ldr r4, _080804D8 @ =0x03000033
	movs r2, #0
	ldr r3, _080804DC @ =0x0300003B
_08080424:
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #7
	ble _08080424
	ldr r1, _080804E0 @ =gInGameTimer
	ldr r0, _080804E4 @ =0x085822D4
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _080804E8 @ =gDisableDrawingSamusAndScrollingFlag
	movs r0, #1
	strb r0, [r1]
	movs r0, #0
	bl EventSet
	ldr r0, _080804EC @ =gPreviousNavigationConversation
	movs r3, #0xff
	strb r3, [r0]
	ldr r0, _080804F0 @ =gPreviousSubEvent
	movs r1, #0xff
	strh r1, [r0]
	ldr r2, _080804F4 @ =gEquipment
	ldrb r0, [r2, #0xd]
	orrs r0, r3
	strb r0, [r2, #0xd]
	ldr r0, _080804F8 @ =gSecurityHatchLevel
	strb r1, [r0]
	ldr r0, _080804FC @ =gSecurityHatchLevelBackup
	strb r1, [r0]
	movs r1, #0
	strb r1, [r2, #0xe]
	ldr r0, _08080500 @ =gAbilityCount
	strb r1, [r0]
	ldr r0, _08080504 @ =gCurrentArea
	strb r1, [r0]
	ldr r0, _08080508 @ =gPreviousArea
	strb r1, [r0]
	ldr r0, _0808050C @ =gCurrentRoom
	strb r1, [r0]
	ldr r0, _08080510 @ =gLastDoorUsed
	strb r1, [r0]
	ldr r0, _08080514 @ =0x0300004C
	strb r1, [r0]
	ldr r0, _08080518 @ =0x0300004D
	strb r1, [r0]
	ldr r0, _0808051C @ =0x0879B894
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	movs r6, #7
	ldrsb r6, [r2, r6]
	ldr r3, _08080520 @ =gPreviousXPosition
	ldr r4, _08080524 @ =gSamusData
	lsls r1, r0, #6
	adds r0, r6, #0
	adds r0, #8
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r5, #0
	strh r1, [r4, #0x16]
	strh r1, [r3]
	ldrb r0, [r2, #5]
	adds r0, #1
	movs r6, #8
	ldrsb r6, [r2, r6]
	ldr r2, _08080528 @ =gPreviousYPosition
	lsls r0, r0, #6
	lsls r1, r6, #2
	adds r0, r0, r1
	subs r0, #1
	strh r0, [r4, #0x18]
	strh r0, [r2]
	bl LoadInitialMinimap
	ldr r0, _0808052C @ =gIsLoadingFile
	strb r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080804C8: .4byte 0x02037C00
_080804CC: .4byte 0x0000FFFF
_080804D0: .4byte 0x02036000
_080804D4: .4byte 0x02037200
_080804D8: .4byte 0x03000033
_080804DC: .4byte 0x0300003B
_080804E0: .4byte gInGameTimer
_080804E4: .4byte 0x085822D4
_080804E8: .4byte gDisableDrawingSamusAndScrollingFlag
_080804EC: .4byte gPreviousNavigationConversation
_080804F0: .4byte gPreviousSubEvent
_080804F4: .4byte gEquipment
_080804F8: .4byte gSecurityHatchLevel
_080804FC: .4byte gSecurityHatchLevelBackup
_08080500: .4byte gAbilityCount
_08080504: .4byte gCurrentArea
_08080508: .4byte gPreviousArea
_0808050C: .4byte gCurrentRoom
_08080510: .4byte gLastDoorUsed
_08080514: .4byte 0x0300004C
_08080518: .4byte 0x0300004D
_0808051C: .4byte 0x0879B894
_08080520: .4byte gPreviousXPosition
_08080524: .4byte gSamusData
_08080528: .4byte gPreviousYPosition
_0808052C: .4byte gIsLoadingFile

	thumb_func_start Sram_ResetForDemo
Sram_ResetForDemo: @ 0x08080530
	push {r4, r5, lr}
	sub sp, #4
	ldr r1, _080805F0 @ =gDebugMenuOptions
	ldr r0, _080805F4 @ =0x085822E4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r2, _080805F8 @ =gButtonAssignments
	ldr r0, _080805FC @ =0x085822C8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r5, _08080600 @ =0x0000FFFF
	ldr r2, _08080604 @ =0x02037C00
	movs r3, #0xe0
	lsls r3, r3, #2
	movs r4, #0x10
	str r4, [sp]
	movs r0, #3
	adds r1, r5, #0
	bl BitFill
	ldr r2, _08080608 @ =0x02036000
	movs r3, #0x90
	lsls r3, r3, #5
	str r4, [sp]
	movs r0, #3
	adds r1, r5, #0
	bl BitFill
	ldr r2, _0808060C @ =0x02037200
	movs r3, #0x90
	lsls r3, r3, #4
	str r4, [sp]
	movs r0, #3
	adds r1, r5, #0
	bl BitFill
	movs r1, #0
	ldr r4, _08080610 @ =0x03000033
	movs r2, #0
	ldr r3, _08080614 @ =0x0300003B
_08080584:
	adds r0, r1, r4
	strb r2, [r0]
	adds r0, r1, r3
	strb r2, [r0]
	adds r1, #1
	cmp r1, #7
	ble _08080584
	ldr r1, _08080618 @ =gInGameTimer
	ldr r0, _0808061C @ =0x085822D4
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08080620 @ =gDisableDrawingSamusAndScrollingFlag
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08080624 @ =gPreviousNavigationConversation
	movs r0, #0xff
	strb r0, [r2]
	ldr r2, _08080628 @ =gPreviousSubEvent
	movs r0, #0xff
	strh r0, [r2]
	ldr r0, _0808062C @ =0x0300004C
	strb r1, [r0]
	ldr r0, _08080630 @ =0x0300004D
	strb r1, [r0]
	ldr r0, _08080634 @ =gIsLoadingFile
	strb r1, [r0]
	ldr r0, _08080638 @ =gUnk_03000be3
	strb r1, [r0]
	ldr r0, _0808063C @ =0x03000018
	strb r1, [r0]
	ldr r0, _08080640 @ =gDisableSoftReset
	strb r1, [r0]
	ldr r2, _08080644 @ =gMaxInGameTimeFlag
	movs r0, #1
	strb r0, [r2]
	ldr r0, _08080648 @ =0x03000022
	strb r1, [r0]
	ldr r0, _0808064C @ =gSkipDoorTransition
	strb r1, [r0]
	ldr r0, _08080650 @ =gPauseScreenFlag
	strb r1, [r0]
	ldr r0, _08080654 @ =0x03000B85
	strb r1, [r0]
	ldr r0, _08080658 @ =0x0300002B
	strb r1, [r0]
	ldr r0, _0808065C @ =gSamusDoorPositionOffset
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08080660 @ =gDebugFlag
	strb r1, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080805F0: .4byte gDebugMenuOptions
_080805F4: .4byte 0x085822E4
_080805F8: .4byte gButtonAssignments
_080805FC: .4byte 0x085822C8
_08080600: .4byte 0x0000FFFF
_08080604: .4byte 0x02037C00
_08080608: .4byte 0x02036000
_0808060C: .4byte 0x02037200
_08080610: .4byte 0x03000033
_08080614: .4byte 0x0300003B
_08080618: .4byte gInGameTimer
_0808061C: .4byte 0x085822D4
_08080620: .4byte gDisableDrawingSamusAndScrollingFlag
_08080624: .4byte gPreviousNavigationConversation
_08080628: .4byte gPreviousSubEvent
_0808062C: .4byte 0x0300004C
_08080630: .4byte 0x0300004D
_08080634: .4byte gIsLoadingFile
_08080638: .4byte gUnk_03000be3
_0808063C: .4byte 0x03000018
_08080640: .4byte gDisableSoftReset
_08080644: .4byte gMaxInGameTimeFlag
_08080648: .4byte 0x03000022
_0808064C: .4byte gSkipDoorTransition
_08080650: .4byte gPauseScreenFlag
_08080654: .4byte 0x03000B85
_08080658: .4byte 0x0300002B
_0808065C: .4byte gSamusDoorPositionOffset
_08080660: .4byte gDebugFlag

	thumb_func_start Sram_CheckLoadSaveFile
Sram_CheckLoadSaveFile: @ 0x08080664
	push {r4, r5, r6, lr}
	ldr r2, _080806BC @ =gButtonAssignments
	ldr r0, _080806C0 @ =0x085822C8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r1, _080806C4 @ =gDebugMenuOptions
	ldr r0, _080806C8 @ =0x085822E4
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r2, _080806CC @ =gIsLoadingFile
	ldr r6, _080806D0 @ =0x03000B94
	ldr r4, _080806D4 @ =0x03000B8D
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0]
	strb r0, [r2]
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _080806DC
	bl Sram_InitSaveFile
	ldr r2, _080806D8 @ =0x03000014
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x10]
	strb r0, [r2]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldrb r0, [r0, #0x11]
	strb r0, [r2, #1]
	strb r5, [r2, #2]
	b _080806E0
	.align 2, 0
_080806BC: .4byte gButtonAssignments
_080806C0: .4byte 0x085822C8
_080806C4: .4byte gDebugMenuOptions
_080806C8: .4byte 0x085822E4
_080806CC: .4byte gIsLoadingFile
_080806D0: .4byte 0x03000B94
_080806D4: .4byte 0x03000B8D
_080806D8: .4byte 0x03000014
_080806DC:
	bl SramLoad_CurrentSave
_080806E0:
	ldr r0, _08080718 @ =gUnk_03000be3
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0808071C @ =0x03000018
	strb r1, [r0]
	ldr r0, _08080720 @ =gDisableSoftReset
	strb r1, [r0]
	ldr r0, _08080724 @ =gMaxInGameTimeFlag
	strb r1, [r0]
	ldr r0, _08080728 @ =0x03000022
	strb r1, [r0]
	ldr r0, _0808072C @ =gSkipDoorTransition
	strb r1, [r0]
	ldr r0, _08080730 @ =gPauseScreenFlag
	strb r1, [r0]
	ldr r0, _08080734 @ =0x03000B85
	strb r1, [r0]
	ldr r0, _08080738 @ =0x0300002B
	strb r1, [r0]
	ldr r0, _0808073C @ =gSamusDoorPositionOffset
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08080740 @ =gDebugFlag
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080718: .4byte gUnk_03000be3
_0808071C: .4byte 0x03000018
_08080720: .4byte gDisableSoftReset
_08080724: .4byte gMaxInGameTimeFlag
_08080728: .4byte 0x03000022
_0808072C: .4byte gSkipDoorTransition
_08080730: .4byte gPauseScreenFlag
_08080734: .4byte 0x03000B85
_08080738: .4byte 0x0300002B
_0808073C: .4byte gSamusDoorPositionOffset
_08080740: .4byte gDebugFlag

	thumb_func_start Sram_EraseFile
Sram_EraseFile: @ 0x08080744
	push {r4, r5, lr}
	sub sp, #0x18
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	add r0, sp, #4
	movs r1, #0
	movs r2, #0x14
	bl memset
	cmp r4, #0
	bne _08080798
	ldr r1, _08080784 @ =gDisableSoftReset
	movs r0, #1
	strb r0, [r1]
	ldr r2, _08080788 @ =0x03000B94
	ldr r3, _0808078C @ =0x03000B8D
	ldrb r0, [r3]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	add r0, sp, #4
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r2, r4}
	stm r1!, {r2, r4}
	ldr r1, _08080790 @ =0x0000FFFF
	ldr r2, _08080794 @ =0x0858225C
	ldrb r0, [r3]
	b _080807AE
	.align 2, 0
_08080784: .4byte gDisableSoftReset
_08080788: .4byte 0x03000B94
_0808078C: .4byte 0x03000B8D
_08080790: .4byte 0x0000FFFF
_08080794: .4byte 0x0858225C
_08080798:
	cmp r4, #1
	bne _080807A2
	bl WriteMostRecentFileToGamePak
	b _080807DE
_080807A2:
	cmp r4, #2
	bne _080807D0
	ldr r1, _080807C4 @ =0x0000FFFF
	ldr r2, _080807C8 @ =0x08582268
	ldr r0, _080807CC @ =0x03000B8D
	ldrb r0, [r0]
_080807AE:
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r2, [r0]
	movs r3, #0x90
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl BitFill
	b _080807DE
	.align 2, 0
_080807C4: .4byte 0x0000FFFF
_080807C8: .4byte 0x08582268
_080807CC: .4byte 0x03000B8D
_080807D0:
	cmp r5, #3
	bne _080807D8
	bl unk_d34
_080807D8:
	ldr r1, _080807E8 @ =gDisableSoftReset
	movs r0, #0
	strb r0, [r1]
_080807DE:
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080807E8: .4byte gDisableSoftReset

	thumb_func_start Sram_CopyFile
Sram_CopyFile: @ 0x080807EC
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	adds r2, r6, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	cmp r1, #0
	bne _08080844
	ldr r1, _08080834 @ =gDisableSoftReset
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08080838 @ =0x03000B94
	lsls r3, r6, #2
	adds r1, r3, r6
	lsls r1, r1, #2
	ldr r5, _0808083C @ =0x03000B8D
	ldrb r2, [r5]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r4
	adds r0, r0, r4
	ldm r0!, {r2, r4, r6}
	stm r1!, {r2, r4, r6}
	ldm r0!, {r2, r4}
	stm r1!, {r2, r4}
	ldr r2, _08080840 @ =0x0858225C
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r3, r3, r2
	ldr r2, [r3]
	b _08080872
	.align 2, 0
_08080834: .4byte gDisableSoftReset
_08080838: .4byte 0x03000B94
_0808083C: .4byte 0x03000B8D
_08080840: .4byte 0x0858225C
_08080844:
	cmp r1, #1
	bne _0808085C
	ldr r4, _08080858 @ =0x03000B8D
	ldrb r5, [r4]
	strb r6, [r4]
	bl WriteMostRecentFileToGamePak
	strb r5, [r4]
	b _080808A2
	.align 2, 0
_08080858: .4byte 0x03000B8D
_0808085C:
	cmp r1, #2
	bne _0808088C
	ldr r2, _08080884 @ =0x08582268
	ldr r0, _08080888 @ =0x03000B8D
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r1, [r0]
	lsls r0, r6, #2
	adds r0, r0, r2
	ldr r2, [r0]
_08080872:
	movs r3, #0x90
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	b _080808A2
	.align 2, 0
_08080884: .4byte 0x08582268
_08080888: .4byte 0x03000B8D
_0808088C:
	cmp r0, #3
	bne _0808089C
	ldr r4, _080808AC @ =0x03000B8D
	ldrb r5, [r4]
	strb r2, [r4]
	bl unk_d34
	strb r5, [r4]
_0808089C:
	ldr r1, _080808B0 @ =gDisableSoftReset
	movs r0, #0
	strb r0, [r1]
_080808A2:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080808AC: .4byte 0x03000B8D
_080808B0: .4byte gDisableSoftReset

	thumb_func_start Sram_WriteFileInfo
Sram_WriteFileInfo: @ 0x080808B4
	push {r4, lr}
	movs r4, #0
	movs r3, #0
	ldr r2, _08080948 @ =0x03000B94
_080808BC:
	lsls r1, r4, #2
	ldrb r0, [r2]
	cmp r0, #1
	bne _0808091A
	ldr r0, _0808094C @ =0x0858225C
	adds r0, r1, r0
	ldr r1, [r0]
	ldrb r0, [r1, #0x1d]
	strb r0, [r2, #2]
	adds r0, r1, #0
	adds r0, #0x21
	ldrb r0, [r0]
	strb r0, [r2, #3]
	adds r0, r1, #0
	adds r0, #0xc4
	ldrh r0, [r0]
	strh r0, [r2, #4]
	adds r0, r1, #0
	adds r0, #0xc6
	ldrh r0, [r0]
	strh r0, [r2, #6]
	adds r0, r1, #0
	adds r0, #0xc8
	ldrh r0, [r0]
	strh r0, [r2, #8]
	adds r0, r1, #0
	adds r0, #0xca
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	adds r0, r1, #0
	adds r0, #0xcf
	ldrb r0, [r0]
	strb r0, [r2, #0xc]
	adds r0, r1, #0
	adds r0, #0xe4
	ldrb r0, [r0]
	strb r0, [r2, #0xd]
	adds r0, r1, #0
	adds r0, #0xe5
	ldrb r0, [r0]
	strb r0, [r2, #0xe]
	ldrb r0, [r1, #0x1c]
	strb r0, [r2, #0xf]
	ldrb r0, [r1, #0x18]
	strb r0, [r2, #0x10]
	ldrb r0, [r1, #0x19]
	strb r0, [r2, #0x11]
_0808091A:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08080926
	ldrb r0, [r2, #0xf]
	cmp r0, #0
	bne _0808093A
_08080926:
	strb r3, [r2]
	strb r3, [r2, #2]
	strb r3, [r2, #3]
	strh r3, [r2, #4]
	strh r3, [r2, #6]
	strh r3, [r2, #8]
	strh r3, [r2, #0xa]
	strb r3, [r2, #0xc]
	strb r3, [r2, #0xd]
	strb r3, [r2, #0xe]
_0808093A:
	adds r2, #0x14
	adds r4, #1
	cmp r4, #2
	ble _080808BC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080948: .4byte 0x03000B94
_0808094C: .4byte 0x0858225C

	thumb_func_start Sram_LoadingfileVblank
Sram_LoadingfileVblank: @ 0x08080950
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	bx lr

	thumb_func_start Sram_AfterLoadingFileVblank
Sram_AfterLoadingFileVblank: @ 0x0808095C
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Sram_ChecLoadSaveFileWithBlank
Sram_ChecLoadSaveFileWithBlank: @ 0x08080968
	push {lr}
	ldr r0, _08080988 @ =Sram_AfterLoadingFileVblank
	bl CallbackSetVBlank
	bl Sram_CheckLoadSaveFile
	ldr r0, _0808098C @ =Sram_LoadingfileVblank
	bl CallbackSetVBlank
	ldr r0, _08080990 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08080988: .4byte Sram_AfterLoadingFileVblank
_0808098C: .4byte Sram_LoadingfileVblank
_08080990: .4byte gIsLoadingFile

	thumb_func_start Sram_SetCurrentFile
Sram_SetCurrentFile: @ 0x08080994
	push {r4, lr}
	ldr r1, _080809B8 @ =0x03000B8D
	ldrb r4, [r1]
	strb r0, [r1]
	ldr r2, _080809BC @ =0x03000B94
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #1
	beq _080809C0
	cmp r0, #1
	ble _080809CE
	cmp r0, #2
	beq _080809C6
	b _080809CE
	.align 2, 0
_080809B8: .4byte 0x03000B8D
_080809BC: .4byte 0x03000B94
_080809C0:
	bl WriteMostRecentFileToGamePak
	b _080809CE
_080809C6:
	bl WriteMostRecentFileToGamePak
	bl unk_d34
_080809CE:
	ldr r3, _080809E8 @ =0x03000B94
	ldr r2, _080809EC @ =0x03000B8D
	ldrb r1, [r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r1, #0
	strb r1, [r0, #1]
	strb r4, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080809E8: .4byte 0x03000B94
_080809EC: .4byte 0x03000B8D

	thumb_func_start EraseSramMenuSubroutine
EraseSramMenuSubroutine: @ 0x080809F0
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r0, _08080A18 @ =gNonGameplayRam
	ldrh r1, [r0, #4]
	adds r1, #1
	strh r1, [r0, #4]
	ldr r1, _08080A1C @ =gSubGameMode1
	movs r3, #0
	ldrsh r2, [r1, r3]
	adds r3, r0, #0
	adds r5, r1, #0
	cmp r2, #6
	bls _08080A0C
	b _08080AFA
_08080A0C:
	lsls r0, r2, #2
	ldr r1, _08080A20 @ =_08080A24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08080A18: .4byte gNonGameplayRam
_08080A1C: .4byte gSubGameMode1
_08080A20: .4byte _08080A24
_08080A24: @ jump table
	.4byte _08080A40 @ case 0
	.4byte _08080A50 @ case 1
	.4byte _08080A74 @ case 2
	.4byte _08080AB0 @ case 3
	.4byte _08080ABC @ case 4
	.4byte _08080ACC @ case 5
	.4byte _08080AE2 @ case 6
_08080A40:
	bl EraseSramMenuInit
	ldr r1, _08080A4C @ =gSubGameMode1
	ldrh r0, [r1]
	b _08080AEA
	.align 2, 0
_08080A4C: .4byte gSubGameMode1
_08080A50:
	ldr r4, _08080A60 @ =gWrittenToBldy
	ldrh r1, [r4]
	adds r2, r1, #0
	cmp r2, #0
	beq _08080A64
	subs r0, r1, #1
	strh r0, [r4]
	b _08080AFA
	.align 2, 0
_08080A60: .4byte gWrittenToBldy
_08080A64:
	movs r0, #0xef
	strh r0, [r3, #6]
	strb r1, [r3, #8]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	strh r2, [r3, #4]
	b _08080AFA
_08080A74:
	ldr r4, _08080A98 @ =gSubGameMode2
	bl EraseSramProcessInput
	strb r0, [r4]
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #0
	beq _08080AFA
	ldr r1, _08080A9C @ =gNonGameplayRam
	movs r0, #0
	strh r0, [r1, #4]
	cmp r2, #1
	bne _08080AA4
	ldr r1, _08080AA0 @ =gSubGameMode1
	movs r0, #5
	strh r0, [r1]
	b _08080AFA
	.align 2, 0
_08080A98: .4byte gSubGameMode2
_08080A9C: .4byte gNonGameplayRam
_08080AA0: .4byte gSubGameMode1
_08080AA4:
	ldr r1, _08080AAC @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	b _08080AFA
	.align 2, 0
_08080AAC: .4byte gSubGameMode1
_08080AB0:
	ldrh r0, [r3, #4]
	cmp r0, #0x28
	bls _08080AFA
	movs r1, #0
	movs r0, #0xff
	b _08080AD6
_08080ABC:
	ldr r1, _08080AC8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bls _08080AEA
	b _08080AF8
	.align 2, 0
_08080AC8: .4byte gWrittenToBldy
_08080ACC:
	ldrh r0, [r3, #4]
	cmp r0, #0x28
	bls _08080AFA
	movs r1, #0
	movs r0, #0xbf
_08080AD6:
	strh r0, [r3, #6]
	strh r1, [r3, #4]
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _08080AFA
_08080AE2:
	ldr r1, _08080AF0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08080AF4
_08080AEA:
	adds r0, #1
	strh r0, [r1]
	b _08080AFA
	.align 2, 0
_08080AF0: .4byte gWrittenToBldy
_08080AF4:
	bl EraseSram
_08080AF8:
	movs r6, #1
_08080AFA:
	bl EraseSramProcessOam
	bl ResetFreeOam
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EraseSramProcessInput
EraseSramProcessInput: @ 0x08080B0C
	push {r4, lr}
	movs r4, #0
	ldr r0, _08080B24 @ =gNonGameplayRam
	ldrb r1, [r0, #1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08080B28
	bl EraseSramApplyInput
	b _08080B2E
	.align 2, 0
_08080B24: .4byte gNonGameplayRam
_08080B28:
	bl EraseSramCheckForInput
	adds r4, r0, #0
_08080B2E:
	ldr r0, _08080B44 @ =gNonGameplayRam
	ldr r3, _08080B48 @ =gWrittenToBldy
	ldrh r1, [r3]
	ldrb r2, [r0, #8]
	adds r0, r1, #0
	cmp r2, r0
	beq _08080B50
	cmp r2, r0
	bls _08080B4C
	adds r0, r1, #1
	b _08080B4E
	.align 2, 0
_08080B44: .4byte gNonGameplayRam
_08080B48: .4byte gWrittenToBldy
_08080B4C:
	subs r0, r1, #1
_08080B4E:
	strh r0, [r3]
_08080B50:
	bl EraseSramUpdateCursorPosition
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start EraseSramApplyInput
EraseSramApplyInput: @ 0x08080B5C
	push {lr}
	ldr r1, _08080B84 @ =gNonGameplayRam
	ldrb r0, [r1, #0x16]
	adds r2, r1, #0
	cmp r0, #2
	beq _08080BE2
	ldrb r1, [r2, #1]
	movs r0, #0x7f
	ands r0, r1
	movs r3, #0
	strb r0, [r2, #1]
	strb r0, [r2]
	ldrb r0, [r2, #1]
	cmp r0, #1
	beq _08080B9C
	cmp r0, #1
	bgt _08080B88
	cmp r0, #0
	beq _08080B92
	b _08080BC6
	.align 2, 0
_08080B84: .4byte gNonGameplayRam
_08080B88:
	cmp r0, #2
	beq _08080BB4
	cmp r0, #3
	beq _08080BBC
	b _08080BC6
_08080B92:
	ldr r0, _08080B98 @ =0x0858B3B0
	b _08080B9E
	.align 2, 0
_08080B98: .4byte 0x0858B3B0
_08080B9C:
	ldr r0, _08080BB0 @ =0x0858B3B1
_08080B9E:
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x22
	strb r3, [r0]
	b _08080BC6
	.align 2, 0
_08080BB0: .4byte 0x0858B3B1
_08080BB4:
	ldr r0, _08080BB8 @ =0x0858B3B2
	b _08080BBE
	.align 2, 0
_08080BB8: .4byte 0x0858B3B2
_08080BBC:
	ldr r0, _08080BE8 @ =0x0858B3B3
_08080BBE:
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x22
	strb r0, [r1]
_08080BC6:
	adds r0, r2, #0
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0xb
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #1
	strb r0, [r2, #0x16]
	strb r1, [r2, #0x14]
	strb r1, [r2, #0x15]
_08080BE2:
	pop {r0}
	bx r0
	.align 2, 0
_08080BE8: .4byte 0x0858B3B3

	thumb_func_start EraseSramCheckForInput
EraseSramCheckForInput: @ 0x08080BEC
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0
	ldr r0, _08080C08 @ =gNonGameplayRam
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	beq _08080C3A
	cmp r1, #1
	bgt _08080C0C
	cmp r1, #0
	beq _08080C16
	b _08080CCA
	.align 2, 0
_08080C08: .4byte gNonGameplayRam
_08080C0C:
	cmp r1, #2
	beq _08080C62
	cmp r1, #3
	beq _08080C94
	b _08080CCA
_08080C16:
	ldr r0, _08080C28 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08080C2C
	movs r0, #0x81
	b _08080CA2
	.align 2, 0
_08080C28: .4byte gChangedInput
_08080C2C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08080CCA
	movs r5, #2
	movs r4, #1
	b _08080CD0
_08080C3A:
	ldr r0, _08080C4C @ =gChangedInput
	ldrh r2, [r0]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _08080C50
	movs r0, #0x80
	b _08080CA2
	.align 2, 0
_08080C4C: .4byte gChangedInput
_08080C50:
	ands r1, r2
	cmp r1, #0
	beq _08080CCA
	movs r0, #0x82
	strb r0, [r3, #1]
	movs r4, #1
	movs r0, #4
	strb r0, [r3, #8]
	b _08080CCA
_08080C62:
	ldr r0, _08080C74 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08080C78
	movs r0, #0x83
	b _08080CA2
	.align 2, 0
_08080C74: .4byte gChangedInput
_08080C78:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08080CCA
	movs r0, #0x80
	strb r0, [r3, #1]
	strb r5, [r3, #8]
	movs r0, #1
	ands r0, r1
	movs r4, #3
	cmp r0, #0
	beq _08080CCA
	movs r4, #1
	b _08080CCA
_08080C94:
	ldr r0, _08080CA8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08080CAC
	movs r0, #0x82
_08080CA2:
	strb r0, [r3, #1]
	movs r4, #4
	b _08080CCA
	.align 2, 0
_08080CA8: .4byte gChangedInput
_08080CAC:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08080CBA
	movs r5, #1
	movs r4, #2
	b _08080CD0
_08080CBA:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08080CCA
	movs r0, #0x80
	strb r0, [r3, #1]
	movs r4, #3
	strb r5, [r3, #8]
_08080CCA:
	movs r0, #0
	cmp r0, #0
	beq _08080CDA
_08080CD0:
	movs r1, #0
	movs r0, #2
	strb r0, [r3, #0x16]
	strb r1, [r3, #0x14]
	strb r1, [r3, #0x15]
_08080CDA:
	ldr r0, _08080CF4 @ =0x0858B3B4
	lsls r1, r4, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _08080CEA
	bl SoundPlay
_08080CEA:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08080CF4: .4byte 0x0858B3B4

	thumb_func_start EraseSramMenuInit
EraseSramMenuInit: @ 0x08080CF8
	push {r4, r5, lr}
	sub sp, #4
	ldr r3, _08080E4C @ =0x04000208
	movs r5, #0
	strh r5, [r3]
	ldr r2, _08080E50 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08080E54 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08080E58 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08080E5C @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08080E60 @ =EraseSramLoadingVBlank
	bl CallbackSetVBlank
	ldr r1, _08080E64 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
	ldr r0, _08080E68 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08080E6C @ =0x04000054
	strh r1, [r0]
	movs r0, #0
	str r0, [sp]
	ldr r1, _08080E70 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r4, _08080E74 @ =gNonGameplayRam
	str r4, [r1, #4]
	ldr r0, _08080E78 @ =0x85000150
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl ClearGfxRam
	ldr r0, _08080E7C @ =gNextOamSlot
	strb r5, [r0]
	bl ResetFreeOam
	ldr r1, _08080E80 @ =0x03000011
	ldrb r0, [r1]
	strb r0, [r4, #2]
	subs r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bls _08080D66
	movs r0, #2
	strb r0, [r4, #2]
	strb r5, [r1]
_08080D66:
	ldr r1, _08080E84 @ =0x04000006
	ldrh r0, [r1]
	subs r0, #0x15
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08080E88 @ =0x085823D0
	ldr r3, _08080E8C @ =0x085822F0
	ldr r4, _08080E90 @ =0x0858340C
	cmp r0, #0x8b
	bhi _08080D86
_08080D7A:
	ldrh r0, [r1]
	subs r0, #0x15
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x8b
	bls _08080D7A
_08080D86:
	ldr r0, _08080E70 @ =0x040000D4
	str r2, [r0]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r0, #4]
	ldr r1, _08080E94 @ =0x80000100
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	str r3, [r0]
	ldr r1, _08080E98 @ =0x05000200
	str r1, [r0, #4]
	ldr r1, _08080E9C @ =0x80000070
	str r1, [r0, #8]
	ldr r0, [r0, #8]
	ldr r1, _08080EA0 @ =0x06001000
	adds r0, r4, #0
	bl LZ77UncompVram
	ldr r0, _08080EA4 @ =0x08582BBC
	ldr r1, _08080EA8 @ =0x06012000
	bl LZ77UncompVram
	ldr r5, _08080EAC @ =0x0879C228
	ldr r4, _08080E74 @ =gNonGameplayRam
	ldrb r0, [r4, #2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldrb r0, [r4, #2]
	lsls r0, r0, #3
	adds r1, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08080EB0 @ =0x06011000
	bl LZ77UncompVram
	ldrb r0, [r4, #2]
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r0, [r0]
	ldr r1, _08080EB4 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _08080EB8 @ =0x0858ABE4
	ldr r1, _08080EBC @ =0x0600D000
	bl LZ77UncompVram
	ldr r0, _08080EC0 @ =0x0858ADF0
	ldr r1, _08080EC4 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _08080EC8 @ =0x04000008
	movs r1, #0
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	ldr r2, _08080ECC @ =0x0400000A
	ldr r3, _08080ED0 @ =0x00001A01
	adds r0, r3, #0
	strh r0, [r2]
	adds r2, #4
	ldr r3, _08080ED4 @ =0x00001E03
	adds r0, r3, #0
	strh r0, [r2]
	ldr r0, _08080ED8 @ =gWrittenToBldalpha_L
	strh r1, [r0]
	ldr r0, _08080EDC @ =0x04000052
	strh r1, [r0]
	ldr r0, _08080EE0 @ =gUnk_03000be3
	strb r1, [r0]
	ldr r0, _08080EE4 @ =gBg1XPosition
	strh r1, [r0]
	ldr r0, _08080EE8 @ =gBg1YPosition
	strh r1, [r0]
	ldr r0, _08080EEC @ =0x03001230
	strh r1, [r0]
	ldr r0, _08080EF0 @ =0x03001232
	strh r1, [r0]
	bl EraseSramResetOam
	bl EraseSramProcessOam
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xd0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08080EF4 @ =EraseSramVBlank
	bl CallbackSetVBlank
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080E4C: .4byte 0x04000208
_08080E50: .4byte 0x04000004
_08080E54: .4byte 0x0000FFEF
_08080E58: .4byte 0x04000200
_08080E5C: .4byte 0x0000FFFD
_08080E60: .4byte EraseSramLoadingVBlank
_08080E64: .4byte 0x04000050
_08080E68: .4byte gWrittenToBldy
_08080E6C: .4byte 0x04000054
_08080E70: .4byte 0x040000D4
_08080E74: .4byte gNonGameplayRam
_08080E78: .4byte 0x85000150
_08080E7C: .4byte gNextOamSlot
_08080E80: .4byte 0x03000011
_08080E84: .4byte 0x04000006
_08080E88: .4byte 0x085823D0
_08080E8C: .4byte 0x085822F0
_08080E90: .4byte 0x0858340C
_08080E94: .4byte 0x80000100
_08080E98: .4byte 0x05000200
_08080E9C: .4byte 0x80000070
_08080EA0: .4byte 0x06001000
_08080EA4: .4byte 0x08582BBC
_08080EA8: .4byte 0x06012000
_08080EAC: .4byte 0x0879C228
_08080EB0: .4byte 0x06011000
_08080EB4: .4byte 0x06010000
_08080EB8: .4byte 0x0858ABE4
_08080EBC: .4byte 0x0600D000
_08080EC0: .4byte 0x0858ADF0
_08080EC4: .4byte 0x0600F000
_08080EC8: .4byte 0x04000008
_08080ECC: .4byte 0x0400000A
_08080ED0: .4byte 0x00001A01
_08080ED4: .4byte 0x00001E03
_08080ED8: .4byte gWrittenToBldalpha_L
_08080EDC: .4byte 0x04000052
_08080EE0: .4byte gUnk_03000be3
_08080EE4: .4byte gBg1XPosition
_08080EE8: .4byte gBg1YPosition
_08080EEC: .4byte 0x03001230
_08080EF0: .4byte 0x03001232
_08080EF4: .4byte EraseSramVBlank

	thumb_func_start EraseSramResetOam
EraseSramResetOam: @ 0x08080EF8
	push {lr}
	ldr r3, _08080F48 @ =gNonGameplayRam
	movs r1, #0
	strb r1, [r3]
	movs r0, #0x80
	strb r0, [r3, #1]
	ldr r0, _08080F4C @ =0x0858B3B0
	ldrb r0, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2c
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r2, _08080F50 @ =0x0858B3BE
	ldrb r0, [r2, #1]
	strh r0, [r3, #0x24]
	ldrb r0, [r2]
	strh r0, [r3, #0x26]
	movs r0, #1
	strb r0, [r3, #0x16]
	strb r1, [r3, #0x14]
	strb r1, [r3, #0x15]
	adds r0, r3, #0
	adds r0, #0x22
	strb r1, [r0]
	subs r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r0, [r2, #3]
	strh r0, [r3, #0x18]
	ldrb r0, [r2, #2]
	strh r0, [r3, #0x1a]
	bl EraseSramUpdateCursorPosition
	pop {r0}
	bx r0
	.align 2, 0
_08080F48: .4byte gNonGameplayRam
_08080F4C: .4byte 0x0858B3B0
_08080F50: .4byte 0x0858B3BE

	thumb_func_start EraseSramUpdateCursorPosition
EraseSramUpdateCursorPosition: @ 0x08080F54
	push {r4, r5, r6, lr}
	ldr r4, _08080F94 @ =gNonGameplayRam
	ldr r6, _08080F98 @ =0x0858B3BE
	ldrb r2, [r4]
	lsrs r2, r2, #1
	lsls r2, r2, #1
	adds r3, r6, #1
	adds r3, r2, r3
	ldr r5, _08080F9C @ =0x0858B3C2
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r5, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r3, [r3]
	adds r0, r0, r3
	strh r0, [r4, #0xc]
	adds r2, r2, r6
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r2]
	adds r0, r0, r2
	strh r0, [r4, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080F94: .4byte gNonGameplayRam
_08080F98: .4byte 0x0858B3BE
_08080F9C: .4byte 0x0858B3C2

	thumb_func_start EraseSramVBlank
EraseSramVBlank: @ 0x08080FA0
	push {lr}
	ldr r1, _08080FF0 @ =0x040000D4
	ldr r0, _08080FF4 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08080FF8 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0x80
	ldr r0, _08080FFC @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _08081000 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08081004 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #6
	ldr r0, _08081008 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808100C @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _08081010 @ =gNonGameplayRam
	ldrh r1, [r2, #6]
	cmp r1, #0
	beq _08080FEC
	ldr r0, _08081014 @ =0x04000050
	strh r1, [r0]
	movs r0, #0
	strh r0, [r2, #6]
_08080FEC:
	pop {r0}
	bx r0
	.align 2, 0
_08080FF0: .4byte 0x040000D4
_08080FF4: .4byte gOamData
_08080FF8: .4byte 0x84000100
_08080FFC: .4byte gWrittenToBldy
_08081000: .4byte gBg1XPosition
_08081004: .4byte gBg1YPosition
_08081008: .4byte 0x03001230
_0808100C: .4byte 0x03001232
_08081010: .4byte gNonGameplayRam
_08081014: .4byte 0x04000050

	thumb_func_start EraseSramLoadingVBlank
EraseSramLoadingVBlank: @ 0x08081018
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EraseSramProcessOam
EraseSramProcessOam: @ 0x08081024
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _0808114C @ =gNextOamSlot
	movs r0, #0
	strb r0, [r1]
	ldr r5, _08081150 @ =gOamData
	movs r0, #0
	str r0, [sp]
	movs r6, #0
	movs r4, #0
_08081040:
	lsls r0, r4, #1
	adds r1, r0, r4
	lsls r1, r1, #2
	ldr r2, _08081154 @ =gNonGameplayRam
	adds r3, r1, r2
	ldrb r1, [r3, #0x16]
	adds r2, r0, #0
	adds r0, r4, #1
	mov r8, r0
	cmp r1, #0
	beq _0808112C
	adds r0, r1, #0
	cmp r0, #0
	beq _08081092
	cmp r0, #0
	blt _08081092
	cmp r0, #6
	bgt _08081092
	ldr r1, _08081158 @ =0x0879C260
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r7, [r0]
	ldrb r0, [r3, #0x15]
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrb r1, [r3, #0x14]
	ldrb r0, [r0, #4]
	cmp r1, r0
	blo _08081092
	movs r0, #0
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x15]
	adds r0, #1
	strb r0, [r3, #0x15]
	ldrb r0, [r3, #0x15]
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08081092
	strb r0, [r3, #0x15]
_08081092:
	adds r2, r2, r4
	lsls r2, r2, #2
	ldr r1, _08081154 @ =gNonGameplayRam
	adds r2, r2, r1
	ldrb r0, [r2, #0x14]
	adds r0, #1
	strb r0, [r2, #0x14]
	ldr r1, _0808115C @ =gBg1YPosition
	ldrh r0, [r2, #0xc]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r1, _08081160 @ =gBg1XPosition
	ldrh r0, [r2, #0xe]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrb r0, [r2, #0x15]
	lsls r0, r0, #3
	adds r7, r7, r0
	ldr r3, [r7]
	ldrh r0, [r3]
	ldr r2, [sp]
	adds r2, r2, r0
	str r2, [sp]
	adds r3, #2
	adds r4, #1
	mov r8, r4
	cmp r6, r2
	bge _0808112C
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	mov ip, r0
	lsls r0, r6, #3
	ldr r1, _08081150 @ =gOamData
	adds r4, r0, r1
	ldr r2, _08081164 @ =0x000001FF
	mov sl, r2
	ldr r0, [sp]
	subs r6, r0, r6
_080810E8:
	ldrh r0, [r3]
	adds r3, #2
	strh r0, [r5]
	adds r5, #2
	add r0, sb
	strb r0, [r4]
	ldrh r1, [r3]
	adds r3, #2
	strh r1, [r5]
	adds r5, #2
	add r1, ip
	mov r2, sl
	ands r1, r2
	ldrh r2, [r4, #2]
	ldr r0, _08081168 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	ldrh r0, [r3]
	strh r0, [r5]
	adds r3, #2
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4, #5]
	adds r5, #4
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _080810E8
	ldr r6, [sp]
_0808112C:
	mov r4, r8
	cmp r4, #2
	ble _08081040
	mov r0, sp
	ldrb r1, [r0]
	ldr r0, _0808114C @ =gNextOamSlot
	strb r1, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808114C: .4byte gNextOamSlot
_08081150: .4byte gOamData
_08081154: .4byte gNonGameplayRam
_08081158: .4byte 0x0879C260
_0808115C: .4byte gBg1YPosition
_08081160: .4byte gBg1XPosition
_08081164: .4byte 0x000001FF
_08081168: .4byte 0xFFFFFE00

	thumb_func_start ProjectileCount
ProjectileCount: @ 0x0808116C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r4, #0
	movs r3, #0
	ldr r7, _080811A4 @ =gProjectileData
	movs r0, #1
	mov ip, r0
_08081180:
	lsls r0, r3, #5
	adds r2, r0, r7
	ldrb r1, [r2]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	beq _080811A8
	ldrb r0, [r2, #0xf]
	cmp r0, r6
	bne _080811A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _080811A8
	movs r0, #0
	b _080811B4
	.align 2, 0
_080811A4: .4byte gProjectileData
_080811A8:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08081180
	movs r0, #1
_080811B4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProjectileInit
ProjectileInit: @ 0x080811BC
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
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	movs r6, #0xff
	movs r4, #0
	ldr r7, _0808120C @ =gProjectileData
	ldr r0, _08081210 @ =gSamusData
	mov ip, r0
	movs r5, #0
_080811EC:
	lsls r2, r4, #5
	adds r3, r2, r7
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0808123E
	mov r0, ip
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081214
	movs r0, #0x47
	b _08081216
	.align 2, 0
_0808120C: .4byte gProjectileData
_08081210: .4byte gSamusData
_08081214:
	movs r0, #7
_08081216:
	strb r0, [r3]
	adds r0, r2, r7
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0, #0xf]
	mov r2, sb
	strh r2, [r0, #8]
	mov r1, r8
	strh r1, [r0, #0xa]
	strb r5, [r0, #0x12]
	strb r5, [r0, #0x11]
	mov r2, sl
	strb r2, [r0, #0x13]
	strb r5, [r0, #0x1e]
	mov r2, ip
	ldrb r1, [r2, #7]
	strb r1, [r0, #0x10]
	strb r4, [r0, #0x1f]
	adds r6, r4, #0
	b _08081248
_0808123E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080811EC
_08081248:
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProjectileInitSecondary
ProjectileInitSecondary: @ 0x0808125C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x28]
	ldr r6, [sp, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov ip, r5
	lsls r6, r6, #0x18
	lsrs r7, r6, #0x18
	movs r3, #0
	movs r0, #7
	orrs r4, r0
	movs r5, #0
	movs r6, #1
_0808129E:
	lsls r0, r3, #5
	ldr r1, _080812D0 @ =gProjectileData
	adds r2, r0, r1
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080812D4
	strb r4, [r2]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r2, #0xf]
	mov r1, sb
	strh r1, [r2, #8]
	mov r0, r8
	strh r0, [r2, #0xa]
	strb r5, [r2, #0x12]
	strb r5, [r2, #0x11]
	mov r1, sl
	strb r1, [r2, #0x13]
	strb r5, [r2, #0x1e]
	mov r0, ip
	strb r0, [r2, #0x10]
	strb r7, [r2, #0x1f]
	b _080812DE
	.align 2, 0
_080812D0: .4byte gProjectileData
_080812D4:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0808129E
_080812DE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileUpdate
ProjectileUpdate: @ 0x080812F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _080813BC @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	beq _08081304
	b _08081940
_08081304:
	bl CallUpdateArmCannonOffset
	ldr r2, _080813C0 @ =gArmCannonY
	ldr r1, _080813C4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	ldr r3, _080813C8 @ =gSamusGraphicsInfo
	lsrs r0, r0, #2
	ldrh r4, [r3, #0x24]
	adds r0, r0, r4
	lsls r0, r0, #2
	strh r0, [r2]
	ldr r2, _080813CC @ =gArmCannonX
	ldrh r0, [r1, #0x16]
	lsrs r0, r0, #2
	ldrh r3, [r3, #0x22]
	adds r0, r0, r3
	lsls r0, r0, #2
	strh r0, [r2]
	ldrb r0, [r1, #0xc]
	cmp r0, #0x10
	bne _0808136A
	movs r3, #0
	movs r5, #0
	movs r4, #1
	ldr r2, _080813D0 @ =0x030007F8
_08081336:
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08081346
	ldrb r0, [r2, #2]
	cmp r0, #0x43
	beq _080813FC
_08081346:
	adds r2, #0xc
	adds r5, #1
	cmp r5, #0xf
	ble _08081336
_0808134E:
	cmp r3, #0
	bne _0808136A
	ldr r5, _080813C0 @ =gArmCannonY
	ldrh r0, [r5]
	ldr r4, _080813CC @ =gArmCannonX
	ldrh r1, [r4]
	movs r2, #0x43
	bl ParticleSet
	ldrh r0, [r5]
	ldrh r1, [r4]
	movs r2, #0x44
	bl ParticleSet
_0808136A:
	ldr r0, _080813D4 @ =0x030012F0
	ldrb r0, [r0, #0x13]
	cmp r0, #0x10
	bne _080813A4
	movs r3, #0
	movs r5, #0
	movs r4, #1
	ldr r2, _080813D0 @ =0x030007F8
_0808137A:
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0808138A
	ldrb r0, [r2, #2]
	cmp r0, #0x45
	beq _080813F4
_0808138A:
	adds r2, #0xc
	adds r5, #1
	cmp r5, #0xf
	ble _0808137A
_08081392:
	cmp r3, #0
	bne _080813A4
	ldr r0, _080813C0 @ =gArmCannonY
	ldrh r0, [r0]
	ldr r1, _080813CC @ =gArmCannonX
	ldrh r1, [r1]
	movs r2, #0x45
	bl ParticleSet
_080813A4:
	ldr r0, _080813C4 @ =gSamusData
	ldrb r0, [r0, #9]
	subs r0, #1
	cmp r0, #5
	bls _080813B0
	b _080818EA
_080813B0:
	lsls r0, r0, #2
	ldr r1, _080813D8 @ =_080813DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080813BC: .4byte gSubGameMode1
_080813C0: .4byte gArmCannonY
_080813C4: .4byte gSamusData
_080813C8: .4byte gSamusGraphicsInfo
_080813CC: .4byte gArmCannonX
_080813D0: .4byte 0x030007F8
_080813D4: .4byte 0x030012F0
_080813D8: .4byte _080813DC
_080813DC: @ jump table
	.4byte _08081404 @ case 0
	.4byte _080815B8 @ case 1
	.4byte _080818EA @ case 2
	.4byte _080816E0 @ case 3
	.4byte _08081740 @ case 4
	.4byte _08081708 @ case 5
_080813F4:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _08081392
_080813FC:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _0808134E
_08081404:
	ldr r0, _0808144C @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08081458
	movs r0, #4
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081420
	b _080818E4
_08081420:
	ldr r5, _08081450 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _08081454 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #4
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #4
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #4
	movs r3, #2
	bl ProjectileInit
	b _08081556
	.align 2, 0
_0808144C: .4byte gEquipment
_08081450: .4byte gArmCannonY
_08081454: .4byte gArmCannonX
_08081458:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080814A4
	movs r0, #3
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081470
	b _080818E4
_08081470:
	ldr r5, _0808149C @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080814A0 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #3
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #3
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #3
	movs r3, #2
	bl ProjectileInit
	b _08081556
	.align 2, 0
_0808149C: .4byte gArmCannonY
_080814A0: .4byte gArmCannonX
_080814A4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080814F0
	movs r0, #2
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080814BC
	b _080818E4
_080814BC:
	ldr r5, _080814E8 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080814EC @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #2
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #2
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #2
	movs r3, #2
	bl ProjectileInit
	b _08081556
	.align 2, 0
_080814E8: .4byte gArmCannonY
_080814EC: .4byte gArmCannonX
_080814F0:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08081578
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081506
	b _080818E4
_08081506:
	ldr r5, _08081568 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _0808156C @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #1
	movs r3, #0
	bl ProjectileInit
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08081570 @ =gProjectileData
	lsls r0, r6, #5
	adds r0, r0, r1
	ldrb r7, [r0, #0x10]
	mov r8, r7
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r1, [r5]
	ldrh r2, [r4]
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #1
	movs r3, #1
	bl ProjectileInitSecondary
	ldrh r1, [r5]
	ldrh r2, [r4]
	str r7, [sp]
	mov r3, r8
	str r3, [sp, #4]
	str r6, [sp, #8]
	movs r0, #1
	movs r3, #2
	bl ProjectileInitSecondary
_08081556:
	ldr r1, _08081574 @ =gSamusData
	movs r0, #7
	strb r0, [r1, #0xa]
	ldrh r0, [r5]
	ldrh r1, [r4]
	movs r2, #0x2b
	bl ParticleSet
	b _080818E4
	.align 2, 0
_08081568: .4byte gArmCannonY
_0808156C: .4byte gArmCannonX
_08081570: .4byte gProjectileData
_08081574: .4byte gSamusData
_08081578:
	movs r0, #0
	movs r1, #3
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081588
	b _080818E4
_08081588:
	ldr r5, _080815AC @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080815B0 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #0
	movs r3, #0
	bl ProjectileInit
	ldr r1, _080815B4 @ =gSamusData
	movs r0, #7
	strb r0, [r1, #0xa]
	ldrh r0, [r5]
	ldrh r1, [r4]
	movs r2, #0x2b
	bl ParticleSet
	b _080818E4
	.align 2, 0
_080815AC: .4byte gArmCannonY
_080815B0: .4byte gArmCannonX
_080815B4: .4byte gSamusData
_080815B8:
	ldr r0, _080815F4 @ =gEquipment
	ldrb r1, [r0, #0xb]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08081634
	movs r0, #0xd
	movs r1, #2
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080815D4
	b _080818E4
_080815D4:
	ldr r0, _080815F8 @ =0x030012F0
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08081604
	ldr r0, _080815FC @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _08081600 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xe
	movs r3, #0
	bl ProjectileInit
	b _08081614
	.align 2, 0
_080815F4: .4byte gEquipment
_080815F8: .4byte 0x030012F0
_080815FC: .4byte gArmCannonY
_08081600: .4byte gArmCannonX
_08081604:
	ldr r0, _08081624 @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _08081628 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xd
	movs r3, #0
	bl ProjectileInit
_08081614:
	ldr r1, _0808162C @ =gSamusData
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1, #0xa]
	ldr r0, _08081630 @ =0x030012F0
	strb r2, [r0, #0x13]
	b _080818E4
	.align 2, 0
_08081624: .4byte gArmCannonY
_08081628: .4byte gArmCannonX
_0808162C: .4byte gSamusData
_08081630: .4byte 0x030012F0
_08081634:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08081670
	movs r0, #0xc
	movs r1, #2
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808164C
	b _080818E4
_0808164C:
	ldr r0, _08081664 @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _08081668 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #0
	bl ProjectileInit
	ldr r1, _0808166C @ =gSamusData
	movs r0, #0xf
	b _080816D0
	.align 2, 0
_08081664: .4byte gArmCannonY
_08081668: .4byte gArmCannonX
_0808166C: .4byte gSamusData
_08081670:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080816AC
	movs r0, #0xb
	movs r1, #2
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081688
	b _080818E4
_08081688:
	ldr r0, _080816A0 @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _080816A4 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #0
	bl ProjectileInit
	ldr r1, _080816A8 @ =gSamusData
	movs r0, #0xe
	b _080816D0
	.align 2, 0
_080816A0: .4byte gArmCannonY
_080816A4: .4byte gArmCannonX
_080816A8: .4byte gSamusData
_080816AC:
	movs r0, #0xa
	movs r1, #2
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080816BC
	b _080818E4
_080816BC:
	ldr r0, _080816D4 @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _080816D8 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xa
	movs r3, #0
	bl ProjectileInit
	ldr r1, _080816DC @ =gSamusData
	movs r0, #9
_080816D0:
	strb r0, [r1, #0xa]
	b _080818E4
	.align 2, 0
_080816D4: .4byte gArmCannonY
_080816D8: .4byte gArmCannonX
_080816DC: .4byte gSamusData
_080816E0:
	movs r0, #0x10
	movs r1, #4
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080816F0
	b _080818E4
_080816F0:
	ldr r4, _08081704 @ =gSamusData
	ldrh r1, [r4, #0x18]
	ldrh r2, [r4, #0x16]
	movs r0, #0x10
	movs r3, #0
	bl ProjectileInit
	movs r0, #7
	strb r0, [r4, #0xa]
	b _080818E4
	.align 2, 0
_08081704: .4byte gSamusData
_08081708:
	movs r0, #0x11
	movs r1, #1
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081718
	b _080818E4
_08081718:
	ldr r0, _08081738 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081722
	b _080818E4
_08081722:
	ldr r4, _0808173C @ =gSamusData
	ldrh r1, [r4, #0x18]
	ldrh r2, [r4, #0x16]
	movs r0, #0x11
	movs r3, #0
	bl ProjectileInit
	movs r0, #5
	strb r0, [r4, #0xa]
	b _080818E4
	.align 2, 0
_08081738: .4byte gCurrentPowerBomb
_0808173C: .4byte gSamusData
_08081740:
	ldr r0, _08081788 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08081794
	movs r0, #9
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808175C
	b _080818E4
_0808175C:
	ldr r5, _0808178C @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _08081790 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #9
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #9
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #9
	movs r3, #2
	bl ProjectileInit
	b _0808188E
	.align 2, 0
_08081788: .4byte gEquipment
_0808178C: .4byte gArmCannonY
_08081790: .4byte gArmCannonX
_08081794:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080817E0
	movs r0, #8
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080817AC
	b _080818E4
_080817AC:
	ldr r5, _080817D8 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080817DC @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #8
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #8
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #8
	movs r3, #2
	bl ProjectileInit
	b _0808188E
	.align 2, 0
_080817D8: .4byte gArmCannonY
_080817DC: .4byte gArmCannonX
_080817E0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08081828
	movs r0, #7
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080818E4
	ldr r5, _08081820 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _08081824 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #7
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #7
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #7
	movs r3, #2
	bl ProjectileInit
	b _0808188E
	.align 2, 0
_08081820: .4byte gArmCannonY
_08081824: .4byte gArmCannonX
_08081828:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080818B4
	movs r0, #6
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080818E4
	ldr r5, _080818A4 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080818A8 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #6
	movs r3, #0
	bl ProjectileInit
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080818AC @ =gProjectileData
	lsls r0, r6, #5
	adds r0, r0, r1
	ldrb r7, [r0, #0x10]
	mov r8, r7
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r1, [r5]
	ldrh r2, [r4]
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #6
	movs r3, #1
	bl ProjectileInitSecondary
	ldrh r1, [r5]
	ldrh r2, [r4]
	str r7, [sp]
	mov r3, r8
	str r3, [sp, #4]
	str r6, [sp, #8]
	movs r0, #6
	movs r3, #2
	bl ProjectileInitSecondary
_0808188E:
	ldr r1, _080818B0 @ =gSamusData
	movs r0, #3
	strb r0, [r1, #0xa]
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #0xf
	movs r3, #0
	bl ProjectileInit
	b _080818E4
	.align 2, 0
_080818A4: .4byte gArmCannonY
_080818A8: .4byte gArmCannonX
_080818AC: .4byte gProjectileData
_080818B0: .4byte gSamusData
_080818B4:
	movs r0, #5
	movs r1, #3
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080818E4
	ldr r5, _0808194C @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _08081950 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #5
	movs r3, #0
	bl ProjectileInit
	ldr r1, _08081954 @ =gSamusData
	movs r0, #3
	strb r0, [r1, #0xa]
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #0xf
	movs r3, #0
	bl ProjectileInit
_080818E4:
	ldr r1, _08081954 @ =gSamusData
	movs r0, #0
	strb r0, [r1, #9]
_080818EA:
	bl ProjectileCheckHittingSprite
	movs r5, #0
	ldr r6, _08081958 @ =gCurrentProjectile
	ldr r4, _0808195C @ =0x0879C27C
	mov r8, r4
_080818F6:
	ldr r1, _08081960 @ =gProjectileData
	lsls r0, r5, #5
	adds r4, r0, r1
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808193A
	adds r1, r6, #0
	adds r0, r4, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r7}
	stm r1!, {r2, r7}
	ldrb r0, [r6, #0xf]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	bl _call_via_r0
	bl ProjectileUpdateAnimation
	bl ProjectileCheckOnScreen
	adds r1, r4, #0
	adds r0, r6, #0
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r7}
	stm r1!, {r2, r7}
_0808193A:
	adds r5, #1
	cmp r5, #0xf
	ble _080818F6
_08081940:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808194C: .4byte gArmCannonY
_08081950: .4byte gArmCannonX
_08081954: .4byte gSamusData
_08081958: .4byte gCurrentProjectile
_0808195C: .4byte 0x0879C27C
_08081960: .4byte gProjectileData

	thumb_func_start ProjectileUpdateAnimation
ProjectileUpdateAnimation: @ 0x08081964
	push {lr}
	ldr r2, _0808199C @ =gCurrentProjectile
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrh r1, [r2, #0xc]
	ldr r3, [r2, #4]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrb r1, [r1, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhs _08081998
	movs r0, #1
	strb r0, [r2, #0xe]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #0xc]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08081998
	strh r0, [r2, #0xc]
_08081998:
	pop {r0}
	bx r0
	.align 2, 0
_0808199C: .4byte gCurrentProjectile

	thumb_func_start ProjectileDrawAll_False
ProjectileDrawAll_False: @ 0x080819A0
	push {r4, r5, r6, lr}
	ldr r0, _080819E0 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _080819D8
	movs r5, #0
	ldr r4, _080819E4 @ =gProjectileData
_080819B0:
	ldrb r1, [r4]
	movs r0, #0x87
	ands r0, r1
	cmp r0, #3
	bne _080819D0
	ldr r1, _080819E8 @ =gCurrentProjectile
	adds r0, r4, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r0, r5, #0
	bl ProjectileDraw
_080819D0:
	adds r4, #0x20
	adds r5, #1
	cmp r5, #0xf
	ble _080819B0
_080819D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080819E0: .4byte gSubGameMode1
_080819E4: .4byte gProjectileData
_080819E8: .4byte gCurrentProjectile

	thumb_func_start ProjectileDrawAll_True
ProjectileDrawAll_True: @ 0x080819EC
	push {r4, r5, r6, lr}
	ldr r0, _08081A2C @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08081A24
	movs r5, #0
	ldr r4, _08081A30 @ =gProjectileData
_080819FC:
	ldrb r1, [r4]
	movs r0, #0x87
	ands r0, r1
	cmp r0, #0x83
	bne _08081A1C
	ldr r1, _08081A34 @ =gCurrentProjectile
	adds r0, r4, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r0, r5, #0
	bl ProjectileDraw
_08081A1C:
	adds r4, #0x20
	adds r5, #1
	cmp r5, #0xf
	ble _080819FC
_08081A24:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081A2C: .4byte gSubGameMode1
_08081A30: .4byte gProjectileData
_08081A34: .4byte gCurrentProjectile

	thumb_func_start ProjectileDraw
ProjectileDraw: @ 0x08081A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08081BD0 @ =gNextOamSlot
	ldrb r1, [r0]
	str r1, [sp, #4]
	ldr r3, _08081BD4 @ =gCurrentProjectile
	ldrh r1, [r3, #0xc]
	ldr r2, [r3, #4]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r5, [r1]
	ldrh r2, [r5]
	str r2, [sp]
	adds r5, #2
	ldr r1, [sp, #4]
	adds r6, r2, r1
	cmp r6, #0x7f
	ble _08081A66
	b _08081BBE
_08081A66:
	lsls r0, r1, #3
	ldr r2, _08081BD8 @ =gOamData
	adds r4, r0, r2
	ldrh r1, [r3, #8]
	lsrs r1, r1, #2
	ldr r0, _08081BDC @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r1, [r3, #0xa]
	lsrs r1, r1, #2
	ldr r0, _08081BE0 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x11]
	str r3, [sp, #0x14]
	ldr r0, _08081BE4 @ =gIoRegisters
	ldrh r0, [r0, #0xa]
	movs r3, #3
	ands r3, r0
	str r3, [sp, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08081AC0
	adds r3, #1
	str r3, [sp, #0x10]
_08081AC0:
	movs r0, #0
	mov ip, r0
	str r6, [sp, #0x18]
	ldr r1, [sp]
	cmp ip, r1
	bge _08081BB6
	movs r2, #1
	mov r8, r2
_08081AD0:
	ldrh r0, [r5]
	adds r7, r0, #0
	adds r5, #2
	strh r7, [r4]
	adds r4, #2
	ldr r0, [sp, #4]
	add r0, ip
	lsls r0, r0, #3
	ldr r1, _08081BD8 @ =gOamData
	adds r3, r0, r1
	mov r2, sl
	adds r0, r7, r2
	strb r0, [r3]
	ldrh r6, [r5]
	adds r5, #2
	strh r6, [r4]
	adds r4, #2
	mov r0, sb
	adds r1, r6, r0
	ldr r2, _08081BE8 @ =0x000001FF
	ands r1, r2
	ldrh r2, [r3, #2]
	ldr r0, _08081BEC @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r5]
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	movs r0, #3
	ldr r1, [sp, #0x10]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	lsrs r2, r0, #4
	ldr r1, [sp, #0x14]
	adds r2, r2, r1
	lsls r2, r2, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #5]
	ldr r2, [sp, #8]
	cmp r2, #0
	beq _08081B72
	ldrb r2, [r3, #3]
	lsls r0, r2, #0x1b
	lsrs r0, r0, #0x1f
	mov r1, r8
	eors r0, r1
	ands r0, r1
	lsls r0, r0, #4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	ldrb r0, [r3, #1]
	lsrs r0, r0, #6
	lsrs r1, r1, #6
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r2, _08081BF0 @ =sOamXFlipOffsets
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r6, r1
	mov r0, sb
	subs r1, r0, r1
	ldr r2, _08081BE8 @ =0x000001FF
	ands r1, r2
	ldrh r2, [r3, #2]
	ldr r0, _08081BEC @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
_08081B72:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _08081BAA
	ldrb r2, [r3, #3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1f
	mov r1, r8
	eors r0, r1
	ands r0, r1
	lsls r0, r0, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	ldrb r0, [r3, #1]
	lsrs r0, r0, #6
	lsrs r1, r1, #6
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r2, _08081BF4 @ =sOamYFlipOffsets
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r7, r0
	mov r1, sl
	subs r0, r1, r0
	strb r0, [r3]
_08081BAA:
	adds r4, #2
	movs r2, #1
	add ip, r2
	ldr r3, [sp]
	cmp ip, r3
	blt _08081AD0
_08081BB6:
	mov r0, sp
	ldrb r1, [r0, #0x18]
	ldr r0, _08081BD0 @ =gNextOamSlot
	strb r1, [r0]
_08081BBE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081BD0: .4byte gNextOamSlot
_08081BD4: .4byte gCurrentProjectile
_08081BD8: .4byte gOamData
_08081BDC: .4byte gBg1YPosition
_08081BE0: .4byte gBg1XPosition
_08081BE4: .4byte gIoRegisters
_08081BE8: .4byte 0x000001FF
_08081BEC: .4byte 0xFFFFFE00
_08081BF0: .4byte sOamXFlipOffsets
_08081BF4: .4byte sOamYFlipOffsets

	thumb_func_start ProjectileCheckOnScreen
ProjectileCheckOnScreen: @ 0x08081BF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08081C8C @ =gCurrentProjectile
	ldrb r0, [r1]
	mov sl, r0
	movs r0, #1
	mov r2, sl
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	beq _08081CEA
	ldr r0, _08081C90 @ =gBg1YPosition
	ldr r4, _08081C94 @ =gBg1XPosition
	ldrh r6, [r7, #8]
	ldrh r1, [r7, #0xa]
	mov ip, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r3, r2, #0
	ldrh r0, [r0]
	adds r1, r3, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r2, [r7, #0x14]
	lsls r2, r2, #2
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r4, [r4]
	adds r0, r3, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r3, ip
	lsls r3, r3, #0x10
	ldrb r1, [r7, #0x15]
	lsls r1, r1, #2
	subs r2, r0, r1
	lsls r2, r2, #0x10
	str r2, [sp]
	lsrs r4, r3, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp]
	cmp r1, r3
	bhs _08081C98
	cmp r4, r0
	bhs _08081C98
	cmp sb, r5
	bhs _08081C98
	cmp r5, r8
	bhs _08081C98
	movs r0, #2
	mov r2, sl
	orrs r0, r2
	b _08081CE8
	.align 2, 0
_08081C8C: .4byte gCurrentProjectile
_08081C90: .4byte gBg1YPosition
_08081C94: .4byte gBg1XPosition
_08081C98:
	ldrb r0, [r7]
	movs r1, #0xfd
	ands r1, r0
	strb r1, [r7]
	ldrb r0, [r7, #0xf]
	cmp r0, #0xf
	bhi _08081CEA
	ldr r1, _08081CBC @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r4, [r1, #0x16]
	cmp r6, r5
	bls _08081CC0
	subs r0, r6, r5
	b _08081CC2
	.align 2, 0
_08081CBC: .4byte gSamusData
_08081CC0:
	subs r0, r5, r6
_08081CC2:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp ip, r4
	bls _08081CD0
	mov r1, ip
	subs r0, r1, r4
	b _08081CD4
_08081CD0:
	mov r2, ip
	subs r0, r4, r2
_08081CD4:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r5, r0
	bhi _08081CE6
	subs r0, #0x80
	cmp r4, r0
	bls _08081CEA
_08081CE6:
	movs r0, #0
_08081CE8:
	strb r0, [r7]
_08081CEA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileLoadEyeCoreXGraphics
ProjectileLoadEyeCoreXGraphics: @ 0x08081CFC
	push {lr}
	ldr r0, _08081D28 @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	adds r1, r0, #0
	cmp r0, #0x59
	bne _08081D48
	ldr r1, _08081D2C @ =0x040000D4
	ldr r0, _08081D30 @ =0x0858C924
	str r0, [r1]
	ldr r0, _08081D34 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081D38 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081D3C @ =0x0858CBA4
	str r0, [r1]
	ldr r0, _08081D40 @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081D44 @ =0x0858B4E4
	b _08081E26
	.align 2, 0
_08081D28: .4byte gCurrentSprite
_08081D2C: .4byte 0x040000D4
_08081D30: .4byte 0x0858C924
_08081D34: .4byte 0x06016000
_08081D38: .4byte 0x80000140
_08081D3C: .4byte 0x0858CBA4
_08081D40: .4byte 0x06016400
_08081D44: .4byte 0x0858B4E4
_08081D48:
	cmp r0, #0x58
	bne _08081D88
	ldr r1, _08081D6C @ =0x040000D4
	ldr r0, _08081D70 @ =0x0858C424
	str r0, [r1]
	ldr r0, _08081D74 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081D78 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081D7C @ =0x0858C6A4
	str r0, [r1]
	ldr r0, _08081D80 @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081D84 @ =0x0858B4C4
	b _08081E26
	.align 2, 0
_08081D6C: .4byte 0x040000D4
_08081D70: .4byte 0x0858C424
_08081D74: .4byte 0x06016000
_08081D78: .4byte 0x80000140
_08081D7C: .4byte 0x0858C6A4
_08081D80: .4byte 0x06016400
_08081D84: .4byte 0x0858B4C4
_08081D88:
	cmp r0, #0x57
	bne _08081DC8
	ldr r1, _08081DAC @ =0x040000D4
	ldr r0, _08081DB0 @ =0x0858BF24
	str r0, [r1]
	ldr r0, _08081DB4 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081DB8 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081DBC @ =0x0858C1A4
	str r0, [r1]
	ldr r0, _08081DC0 @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081DC4 @ =0x0858B4A4
	b _08081E26
	.align 2, 0
_08081DAC: .4byte 0x040000D4
_08081DB0: .4byte 0x0858BF24
_08081DB4: .4byte 0x06016000
_08081DB8: .4byte 0x80000140
_08081DBC: .4byte 0x0858C1A4
_08081DC0: .4byte 0x06016400
_08081DC4: .4byte 0x0858B4A4
_08081DC8:
	cmp r1, #0x56
	bne _08081E08
	ldr r1, _08081DEC @ =0x040000D4
	ldr r0, _08081DF0 @ =0x0858BA24
	str r0, [r1]
	ldr r0, _08081DF4 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081DF8 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081DFC @ =0x0858BCA4
	str r0, [r1]
	ldr r0, _08081E00 @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081E04 @ =0x0858B484
	b _08081E26
	.align 2, 0
_08081DEC: .4byte 0x040000D4
_08081DF0: .4byte 0x0858BA24
_08081DF4: .4byte 0x06016000
_08081DF8: .4byte 0x80000140
_08081DFC: .4byte 0x0858BCA4
_08081E00: .4byte 0x06016400
_08081E04: .4byte 0x0858B484
_08081E08:
	ldr r1, _08081E38 @ =0x040000D4
	ldr r0, _08081E3C @ =0x0858CE24
	str r0, [r1]
	ldr r0, _08081E40 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081E44 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081E48 @ =0x0858D0A4
	str r0, [r1]
	ldr r0, _08081E4C @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081E50 @ =0x0858B504
_08081E26:
	str r0, [r1]
	ldr r0, _08081E54 @ =0x05000380
	str r0, [r1, #4]
	ldr r0, _08081E58 @ =0x80000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08081E38: .4byte 0x040000D4
_08081E3C: .4byte 0x0858CE24
_08081E40: .4byte 0x06016000
_08081E44: .4byte 0x80000140
_08081E48: .4byte 0x0858D0A4
_08081E4C: .4byte 0x06016400
_08081E50: .4byte 0x0858B504
_08081E54: .4byte 0x05000380
_08081E58: .4byte 0x80000005

	thumb_func_start ProjectileLoadBeamGraphics
ProjectileLoadBeamGraphics: @ 0x08081E5C
	push {lr}
	ldr r0, _08081E8C @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r2, r1, #0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081EAC
	ldr r1, _08081E90 @ =0x040000D4
	ldr r0, _08081E94 @ =0x0858CE24
	str r0, [r1]
	ldr r0, _08081E98 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081E9C @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081EA0 @ =0x0858D0A4
	str r0, [r1]
	ldr r0, _08081EA4 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081EA8 @ =0x0858B504
	b _08081FDA
	.align 2, 0
_08081E8C: .4byte gEquipment
_08081E90: .4byte 0x040000D4
_08081E94: .4byte 0x0858CE24
_08081E98: .4byte 0x06011000
_08081E9C: .4byte 0x80000140
_08081EA0: .4byte 0x0858D0A4
_08081EA4: .4byte 0x06011400
_08081EA8: .4byte 0x0858B504
_08081EAC:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08081EF0
	ldr r1, _08081ED4 @ =0x040000D4
	ldr r0, _08081ED8 @ =0x0858C924
	str r0, [r1]
	ldr r0, _08081EDC @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081EE0 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081EE4 @ =0x0858CBA4
	str r0, [r1]
	ldr r0, _08081EE8 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081EEC @ =0x0858B4E4
	b _08081FDA
	.align 2, 0
_08081ED4: .4byte 0x040000D4
_08081ED8: .4byte 0x0858C924
_08081EDC: .4byte 0x06011000
_08081EE0: .4byte 0x80000140
_08081EE4: .4byte 0x0858CBA4
_08081EE8: .4byte 0x06011400
_08081EEC: .4byte 0x0858B4E4
_08081EF0:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08081F34
	ldr r1, _08081F18 @ =0x040000D4
	ldr r0, _08081F1C @ =0x0858C424
	str r0, [r1]
	ldr r0, _08081F20 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081F24 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081F28 @ =0x0858C6A4
	str r0, [r1]
	ldr r0, _08081F2C @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081F30 @ =0x0858B4C4
	b _08081FDA
	.align 2, 0
_08081F18: .4byte 0x040000D4
_08081F1C: .4byte 0x0858C424
_08081F20: .4byte 0x06011000
_08081F24: .4byte 0x80000140
_08081F28: .4byte 0x0858C6A4
_08081F2C: .4byte 0x06011400
_08081F30: .4byte 0x0858B4C4
_08081F34:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08081F78
	ldr r1, _08081F5C @ =0x040000D4
	ldr r0, _08081F60 @ =0x0858BF24
	str r0, [r1]
	ldr r0, _08081F64 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081F68 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081F6C @ =0x0858C1A4
	str r0, [r1]
	ldr r0, _08081F70 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081F74 @ =0x0858B4A4
	b _08081FDA
	.align 2, 0
_08081F5C: .4byte 0x040000D4
_08081F60: .4byte 0x0858BF24
_08081F64: .4byte 0x06011000
_08081F68: .4byte 0x80000140
_08081F6C: .4byte 0x0858C1A4
_08081F70: .4byte 0x06011400
_08081F74: .4byte 0x0858B4A4
_08081F78:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _08081FBC
	ldr r1, _08081FA0 @ =0x040000D4
	ldr r0, _08081FA4 @ =0x0858BA24
	str r0, [r1]
	ldr r0, _08081FA8 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081FAC @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081FB0 @ =0x0858BCA4
	str r0, [r1]
	ldr r0, _08081FB4 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081FB8 @ =0x0858B484
	b _08081FDA
	.align 2, 0
_08081FA0: .4byte 0x040000D4
_08081FA4: .4byte 0x0858BA24
_08081FA8: .4byte 0x06011000
_08081FAC: .4byte 0x80000140
_08081FB0: .4byte 0x0858BCA4
_08081FB4: .4byte 0x06011400
_08081FB8: .4byte 0x0858B484
_08081FBC:
	ldr r1, _08081FEC @ =0x040000D4
	ldr r0, _08081FF0 @ =0x0858B524
	str r0, [r1]
	ldr r0, _08081FF4 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081FF8 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081FFC @ =0x0858B7A4
	str r0, [r1]
	ldr r0, _08082000 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08082004 @ =0x0858B464
_08081FDA:
	str r0, [r1]
	ldr r0, _08082008 @ =0x05000240
	str r0, [r1, #4]
	ldr r0, _0808200C @ =0x80000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08081FEC: .4byte 0x040000D4
_08081FF0: .4byte 0x0858B524
_08081FF4: .4byte 0x06011000
_08081FF8: .4byte 0x80000140
_08081FFC: .4byte 0x0858B7A4
_08082000: .4byte 0x06011400
_08082004: .4byte 0x0858B464
_08082008: .4byte 0x05000240
_0808200C: .4byte 0x80000005

	thumb_func_start ProjectileLoadMissileGraphics
ProjectileLoadMissileGraphics: @ 0x08082010
	push {lr}
	ldr r0, _08082034 @ =gEquipment
	ldrb r1, [r0, #0xb]
	adds r2, r1, #0
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808204C
	ldr r0, _08082038 @ =0x040000D4
	ldr r1, _0808203C @ =0x0858D624
	str r1, [r0]
	ldr r1, _08082040 @ =0x06011380
	str r1, [r0, #4]
	ldr r2, _08082044 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08082048 @ =0x0858D6A4
	b _080820C6
	.align 2, 0
_08082034: .4byte gEquipment
_08082038: .4byte 0x040000D4
_0808203C: .4byte 0x0858D624
_08082040: .4byte 0x06011380
_08082044: .4byte 0x80000040
_08082048: .4byte 0x0858D6A4
_0808204C:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0808207C
	ldr r0, _08082068 @ =0x040000D4
	ldr r1, _0808206C @ =0x0858D524
	str r1, [r0]
	ldr r1, _08082070 @ =0x06011380
	str r1, [r0, #4]
	ldr r2, _08082074 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08082078 @ =0x0858D5A4
	b _080820C6
	.align 2, 0
_08082068: .4byte 0x040000D4
_0808206C: .4byte 0x0858D524
_08082070: .4byte 0x06011380
_08082074: .4byte 0x80000040
_08082078: .4byte 0x0858D5A4
_0808207C:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080820AC
	ldr r0, _08082098 @ =0x040000D4
	ldr r1, _0808209C @ =0x0858D424
	str r1, [r0]
	ldr r1, _080820A0 @ =0x06011380
	str r1, [r0, #4]
	ldr r2, _080820A4 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080820A8 @ =0x0858D4A4
	b _080820C6
	.align 2, 0
_08082098: .4byte 0x040000D4
_0808209C: .4byte 0x0858D424
_080820A0: .4byte 0x06011380
_080820A4: .4byte 0x80000040
_080820A8: .4byte 0x0858D4A4
_080820AC:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _080820D0
	ldr r0, _080820D4 @ =0x040000D4
	ldr r1, _080820D8 @ =0x0858D324
	str r1, [r0]
	ldr r1, _080820DC @ =0x06011380
	str r1, [r0, #4]
	ldr r2, _080820E0 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080820E4 @ =0x0858D3A4
_080820C6:
	str r1, [r0]
	ldr r1, _080820E8 @ =0x06011780
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_080820D0:
	pop {r0}
	bx r0
	.align 2, 0
_080820D4: .4byte 0x040000D4
_080820D8: .4byte 0x0858D324
_080820DC: .4byte 0x06011380
_080820E0: .4byte 0x80000040
_080820E4: .4byte 0x0858D3A4
_080820E8: .4byte 0x06011780

	thumb_func_start ProjectileCallLoadGraphicsAndClearProjectiles
ProjectileCallLoadGraphicsAndClearProjectiles: @ 0x080820EC
	push {lr}
	bl ProjectileLoadBeamGraphics
	bl ProjectileLoadMissileGraphics
	ldr r0, _08082118 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08082114
	ldr r1, _0808211C @ =gProjectileData
	movs r2, #0
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r0, r1, r3
_0808210C:
	strb r2, [r0]
	subs r0, #0x20
	cmp r0, r1
	bge _0808210C
_08082114:
	pop {r0}
	bx r0
	.align 2, 0
_08082118: .4byte gPauseScreenFlag
_0808211C: .4byte gProjectileData

	thumb_func_start ProjectileMove
ProjectileMove: @ 0x08082120
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0808213C @ =gCurrentProjectile
	ldrb r2, [r0, #0x10]
	adds r4, r0, #0
	cmp r2, #3
	beq _0808217A
	cmp r2, #3
	bgt _08082140
	cmp r2, #2
	beq _0808215A
	b _0808219A
	.align 2, 0
_0808213C: .4byte gCurrentProjectile
_08082140:
	cmp r2, #4
	beq _0808214A
	cmp r2, #5
	beq _08082152
	b _0808219A
_0808214A:
	ldrh r0, [r4, #8]
	subs r0, r0, r3
	strh r0, [r4, #8]
	b _080821E6
_08082152:
	ldrh r0, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
	b _080821E6
_0808215A:
	lsls r0, r3, #1
	adds r0, r0, r3
	asrs r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r0, [r4, #8]
	subs r0, r0, r3
	strh r0, [r4, #8]
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080821AA
	ldrh r0, [r4, #0xa]
	adds r0, r0, r3
	b _080821AE
_0808217A:
	lsls r0, r3, #1
	adds r0, r0, r3
	asrs r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r0, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080821AA
	ldrh r0, [r4, #0xa]
	adds r0, r0, r3
	b _080821AE
_0808219A:
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080821AA
	ldrh r0, [r4, #0xa]
	adds r0, r0, r3
	b _080821AE
_080821AA:
	ldrh r0, [r4, #0xa]
	subs r0, r0, r3
_080821AE:
	strh r0, [r4, #0xa]
	ldr r0, _080821D8 @ =gSamusData
	ldrh r0, [r0, #0x1a]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r6, r3, #0
	adds r2, r4, #0
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080821DC
	cmp r5, #0
	ble _080821E6
	ldrh r0, [r2, #0xa]
	adds r0, r0, r3
	strh r0, [r2, #0xa]
	b _080821E6
	.align 2, 0
_080821D8: .4byte gSamusData
_080821DC:
	cmp r5, #0
	bge _080821E6
	ldrh r0, [r4, #0xa]
	adds r0, r0, r6
	strh r0, [r4, #0xa]
_080821E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ProjectileCheckHittingSolid
ProjectileCheckHittingSolid: @ 0x080821EC
	push {lr}
	ldr r2, _08082208 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08082210
	ldr r0, _0808220C @ =gCurrentClipdataAffectingAction
	strb r1, [r0]
	movs r0, #0
	b _08082228
	.align 2, 0
_08082208: .4byte gCurrentProjectile
_0808220C: .4byte gCurrentClipdataAffectingAction
_08082210:
	ldrh r0, [r2, #8]
	ldrh r1, [r2, #0xa]
	bl ClipdataProcess
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r0
	cmp r1, #0
	bne _08082226
	movs r0, #0
	b _08082228
_08082226:
	movs r0, #1
_08082228:
	pop {r1}
	bx r1

	thumb_func_start ProjectileCheckVerticalCollisionAtPosition
ProjectileCheckVerticalCollisionAtPosition: @ 0x0808222C
	push {r4, r5, r6, r7, lr}
	ldr r2, _08082248 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08082250
	ldr r0, _0808224C @ =gCurrentClipdataAffectingAction
	strb r1, [r0]
	movs r0, #0
	b _0808245E
	.align 2, 0
_08082248: .4byte gCurrentProjectile
_0808224C: .4byte gCurrentClipdataAffectingAction
_08082250:
	ldrh r6, [r2, #8]
	ldrh r7, [r2, #0xa]
	adds r4, r6, #0
	adds r5, r7, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ClipdataProcess
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	movs r3, #0x11
	cmp r0, #0
	bne _08082272
	movs r0, #0
	b _0808245E
_08082272:
	movs r0, #0xff
	ands r0, r1
	subs r0, #2
	cmp r0, #0xa
	bls _0808227E
	b _080823E4
_0808227E:
	lsls r0, r0, #2
	ldr r1, _08082288 @ =_0808228C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082288: .4byte _0808228C
_0808228C: @ jump table
	.4byte _0808234C @ case 0
	.4byte _080822B8 @ case 1
	.4byte _080823A0 @ case 2
	.4byte _08082374 @ case 3
	.4byte _080822EC @ case 4
	.4byte _08082314 @ case 5
	.4byte _080823E4 @ case 6
	.4byte _080823E4 @ case 7
	.4byte _080823E4 @ case 8
	.4byte _080823E4 @ case 9
	.4byte _080823D0 @ case 10
_080822B8:
	ldr r3, _080822E4 @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #5
	ldr r2, _080822E8 @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_080822E4: .4byte 0x0000FFC0
_080822E8: .4byte gCurrentProjectile
_080822EC:
	ldr r3, _08082310 @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	subs r0, #0x7e
	b _08082336
	.align 2, 0
_08082310: .4byte 0x0000FFC0
_08082314:
	ldr r3, _08082344 @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	subs r0, #0x1f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	subs r0, #0x3e
_08082336:
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #3
	ldr r2, _08082348 @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_08082344: .4byte 0x0000FFC0
_08082348: .4byte gCurrentProjectile
_0808234C:
	ldr r2, _0808236C @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r2
	movs r1, #0x3f
	adds r0, r7, #0
	ands r0, r1
	orrs r4, r0
	adds r5, r7, #0
	ands r5, r2
	adds r0, r6, #0
	ands r0, r1
	orrs r5, r0
	movs r3, #4
	ldr r2, _08082370 @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_0808236C: .4byte 0x0000FFC0
_08082370: .4byte gCurrentProjectile
_08082374:
	ldr r3, _08082398 @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	adds r0, #0x1f
	orrs r4, r0
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	ldr r2, _0808239C @ =0x0000FFC1
	adds r0, r0, r2
	b _080823BA
	.align 2, 0
_08082398: .4byte 0x0000FFC0
_0808239C: .4byte 0x0000FFC1
_080823A0:
	ldr r3, _080823C8 @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	orrs r4, r0
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
_080823BA:
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #2
	ldr r2, _080823CC @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_080823C8: .4byte 0x0000FFC0
_080823CC: .4byte gCurrentProjectile
_080823D0:
	ldr r4, _080823DC @ =0x0000FFC0
	ands r4, r6
	movs r3, #0x10
	ldr r2, _080823E0 @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_080823DC: .4byte 0x0000FFC0
_080823E0: .4byte gCurrentProjectile
_080823E4:
	ldr r0, _08082414 @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r0
	adds r5, r7, #0
	ands r5, r0
	ldr r2, _08082418 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08082402
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08082402:
	ldrb r0, [r2, #0x10]
	cmp r0, #4
	beq _08082426
	cmp r0, #4
	ble _0808241C
	cmp r0, #5
	beq _08082432
	b _0808243A
	.align 2, 0
_08082414: .4byte 0x0000FFC0
_08082418: .4byte gCurrentProjectile
_0808241C:
	cmp r0, #2
	blt _0808243A
	cmp r3, #0x10
	bne _0808245C
	b _0808245A
_08082426:
	cmp r3, #0x11
	bne _0808245A
	adds r0, r4, #0
	adds r0, #0x40
	strh r0, [r2, #8]
	b _0808245C
_08082432:
	cmp r6, r4
	blo _0808245A
	strh r4, [r2, #8]
	b _0808245C
_0808243A:
	cmp r3, #0xc
	beq _0808245A
	adds r4, r2, #0
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08082452
	cmp r7, r5
	blo _0808245A
	strh r5, [r4, #0xa]
	b _0808245C
_08082452:
	cmp r7, r5
	bhi _0808245A
	strh r5, [r2, #0xa]
	b _0808245C
_0808245A:
	movs r3, #0
_0808245C:
	adds r0, r3, #0
_0808245E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ProjectileMovePart
ProjectileMovePart: @ 0x08082464
	push {r4, lr}
	movs r3, #4
	movs r4, #5
	ldr r1, _08082480 @ =gCurrentProjectile
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _08082514
	lsls r0, r0, #2
	ldr r1, _08082484 @ =_08082488
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082480: .4byte gCurrentProjectile
_08082484: .4byte _08082488
_08082488: @ jump table
	.4byte _08082514 @ case 0
	.4byte _080824C0 @ case 1
	.4byte _0808249C @ case 2
	.4byte _080824FE @ case 3
	.4byte _080824FE @ case 4
_0808249C:
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080824AE
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	beq _080824E2
	b _080824F0
_080824AE:
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _080824BA
	ldrh r0, [r2, #8]
	subs r0, r0, r3
	b _080824F4
_080824BA:
	ldrh r0, [r2, #8]
	adds r0, r3, r0
	b _080824E6
_080824C0:
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080824DC
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _080824D6
	ldrh r0, [r2, #8]
	subs r0, r0, r3
	b _080824F4
_080824D6:
	ldrh r0, [r2, #8]
	adds r0, r3, r0
	b _080824E6
_080824DC:
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _080824F0
_080824E2:
	ldrh r0, [r2, #8]
	subs r0, r0, r3
_080824E6:
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	adds r0, r3, r0
	strh r0, [r2, #0xa]
	b _08082526
_080824F0:
	ldrh r0, [r2, #8]
	adds r0, r3, r0
_080824F4:
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	subs r0, r0, r3
	strh r0, [r2, #0xa]
	b _08082526
_080824FE:
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _0808250C
	ldrh r0, [r2, #0xa]
	subs r0, r0, r4
	strh r0, [r2, #0xa]
	b _08082526
_0808250C:
	ldrh r0, [r2, #0xa]
	adds r0, r4, r0
	strh r0, [r2, #0xa]
	b _08082526
_08082514:
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _08082520
	ldrh r0, [r2, #8]
	subs r0, r0, r4
	b _08082524
_08082520:
	ldrh r0, [r2, #8]
	adds r0, r4, r0
_08082524:
	strh r0, [r2, #8]
_08082526:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProjectileMoveWaveBeamParts
ProjectileMoveWaveBeamParts: @ 0x0808252C
	push {r4, r5, r6, lr}
	ldr r5, _08082564 @ =gCurrentProjectile
	ldrb r0, [r5, #0x1e]
	movs r4, #7
	ands r4, r0
	ldr r1, _08082568 @ =0x0858B3CC
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r0, r6, #0
	bl __floatsidf
	ldr r2, _0808256C @ =0x3FF66666
	ldr r3, _08082570 @ =0x66666666
	bl __muldf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r2, [r5, #0x13]
	cmp r4, #3
	bls _0808257A
	cmp r2, #1
	bne _08082574
	movs r2, #2
	b _0808257A
	.align 2, 0
_08082564: .4byte gCurrentProjectile
_08082568: .4byte 0x0858B3CC
_0808256C: .4byte 0x3FF66666
_08082570: .4byte 0x66666666
_08082574:
	cmp r2, #2
	bne _0808257A
	movs r2, #1
_0808257A:
	ldrb r0, [r5, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08082612
	lsls r0, r0, #2
	ldr r1, _0808258C @ =_08082590
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808258C: .4byte _08082590
_08082590: @ jump table
	.4byte _08082612 @ case 0
	.4byte _080825C4 @ case 1
	.4byte _080825A4 @ case 2
	.4byte _080825FE @ case 3
	.4byte _080825FE @ case 4
_080825A4:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080825B4
	cmp r2, #1
	beq _080825E2
	b _080825F0
_080825B4:
	cmp r2, #1
	bne _080825BE
	ldrh r0, [r5, #8]
	subs r0, r0, r6
	b _080825F4
_080825BE:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
	b _080825E6
_080825C4:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080825DE
	cmp r2, #1
	bne _080825D8
	ldrh r0, [r5, #8]
	subs r0, r0, r6
	b _080825F4
_080825D8:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
	b _080825E6
_080825DE:
	cmp r2, #1
	bne _080825F0
_080825E2:
	ldrh r0, [r5, #8]
	subs r0, r0, r6
_080825E6:
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	adds r0, r6, r0
	strh r0, [r5, #0xa]
	b _08082622
_080825F0:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
_080825F4:
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	subs r0, r0, r6
	strh r0, [r5, #0xa]
	b _08082622
_080825FE:
	cmp r2, #1
	bne _0808260A
	ldrh r0, [r5, #0xa]
	subs r0, r0, r3
	strh r0, [r5, #0xa]
	b _08082622
_0808260A:
	ldrh r0, [r5, #0xa]
	adds r0, r3, r0
	strh r0, [r5, #0xa]
	b _08082622
_08082612:
	cmp r2, #1
	bne _0808261C
	ldrh r0, [r5, #8]
	subs r0, r0, r3
	b _08082620
_0808261C:
	ldrh r0, [r5, #8]
	adds r0, r3, r0
_08082620:
	strh r0, [r5, #8]
_08082622:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ProjectileMoveWaveBeamParts_Unused
ProjectileMoveWaveBeamParts_Unused: @ 0x08082628
	push {r4, r5, r6, lr}
	ldr r5, _08082660 @ =gCurrentProjectile
	ldrb r0, [r5, #0x1e]
	movs r4, #0xf
	ands r4, r0
	ldr r1, _08082664 @ =0x0858B3EC
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r0, r6, #0
	bl __floatsidf
	ldr r2, _08082668 @ =0x3FF66666
	ldr r3, _0808266C @ =0x66666666
	bl __muldf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r2, [r5, #0x13]
	cmp r4, #7
	bls _08082676
	cmp r2, #1
	bne _08082670
	movs r2, #2
	b _08082676
	.align 2, 0
_08082660: .4byte gCurrentProjectile
_08082664: .4byte 0x0858B3EC
_08082668: .4byte 0x3FF66666
_0808266C: .4byte 0x66666666
_08082670:
	cmp r2, #2
	bne _08082676
	movs r2, #1
_08082676:
	ldrb r0, [r5, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _0808270E
	lsls r0, r0, #2
	ldr r1, _08082688 @ =_0808268C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082688: .4byte _0808268C
_0808268C: @ jump table
	.4byte _0808270E @ case 0
	.4byte _080826C0 @ case 1
	.4byte _080826A0 @ case 2
	.4byte _080826FA @ case 3
	.4byte _080826FA @ case 4
_080826A0:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080826B0
	cmp r2, #1
	beq _080826DE
	b _080826EC
_080826B0:
	cmp r2, #1
	bne _080826BA
	ldrh r0, [r5, #8]
	subs r0, r0, r6
	b _080826F0
_080826BA:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
	b _080826E2
_080826C0:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080826DA
	cmp r2, #1
	bne _080826D4
	ldrh r0, [r5, #8]
	subs r0, r0, r6
	b _080826F0
_080826D4:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
	b _080826E2
_080826DA:
	cmp r2, #1
	bne _080826EC
_080826DE:
	ldrh r0, [r5, #8]
	subs r0, r0, r6
_080826E2:
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	adds r0, r6, r0
	strh r0, [r5, #0xa]
	b _0808271E
_080826EC:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
_080826F0:
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	subs r0, r0, r6
	strh r0, [r5, #0xa]
	b _0808271E
_080826FA:
	cmp r2, #1
	bne _08082706
	ldrh r0, [r5, #0xa]
	subs r0, r0, r3
	strh r0, [r5, #0xa]
	b _0808271E
_08082706:
	ldrh r0, [r5, #0xa]
	adds r0, r3, r0
	strh r0, [r5, #0xa]
	b _0808271E
_0808270E:
	cmp r2, #1
	bne _08082718
	ldrh r0, [r5, #8]
	subs r0, r0, r3
	b _0808271C
_08082718:
	ldrh r0, [r5, #8]
	adds r0, r3, r0
_0808271C:
	strh r0, [r5, #8]
_0808271E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ProjectileSetMissileTrail
ProjectileSetMissileTrail: @ 0x08082724
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _0808274C @ =gCurrentProjectile
	ldrb r0, [r4, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _080827CC
	movs r5, #0x20
	ldrh r2, [r4, #8]
	ldrh r3, [r4, #0xa]
	ldrb r0, [r4, #0x10]
	cmp r0, #3
	beq _08082788
	cmp r0, #3
	bgt _08082750
	cmp r0, #2
	beq _0808276A
	b _080827A6
	.align 2, 0
_0808274C: .4byte gCurrentProjectile
_08082750:
	cmp r0, #4
	beq _0808275A
	cmp r0, #5
	beq _08082760
	b _080827A6
_0808275A:
	adds r0, r2, #0
	adds r0, #0x20
	b _08082764
_08082760:
	adds r0, r2, #0
	subs r0, #0x20
_08082764:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080827C2
_0808276A:
	movs r0, #0x40
	adds r1, r2, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _08082782
	adds r0, r3, #0
	subs r0, #0x18
	b _080827BE
_08082782:
	adds r0, r3, #0
	adds r0, #0x18
	b _080827BE
_08082788:
	movs r0, #0x40
	adds r1, r2, #0
	subs r1, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080827A0
	adds r0, r3, #0
	subs r0, #0x18
	b _080827BE
_080827A0:
	adds r0, r3, #0
	adds r0, #0x18
	b _080827BE
_080827A6:
	ldr r0, _080827B8 @ =gCurrentProjectile
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080827BC
	subs r0, r3, r5
	b _080827BE
	.align 2, 0
_080827B8: .4byte gCurrentProjectile
_080827BC:
	adds r0, r3, r5
_080827BE:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080827C2:
	adds r0, r2, #0
	adds r1, r3, #0
	adds r2, r6, #0
	bl ParticleSet
_080827CC:
	ldr r1, _080827DC @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	adds r0, #1
	strb r0, [r1, #0x13]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080827DC: .4byte gCurrentProjectile

	thumb_func_start ProjectileSetBeamTrail
ProjectileSetBeamTrail: @ 0x080827E0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _08082808 @ =gCurrentProjectile
	ldrb r0, [r2, #0x1e]
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08082880
	movs r5, #0x20
	ldrh r2, [r4, #8]
	ldrh r3, [r4, #0xa]
	ldrb r0, [r4, #0x10]
	cmp r0, #3
	beq _08082844
	cmp r0, #3
	bgt _0808280C
	cmp r0, #2
	beq _08082826
	b _08082862
	.align 2, 0
_08082808: .4byte gCurrentProjectile
_0808280C:
	cmp r0, #4
	beq _08082816
	cmp r0, #5
	beq _0808281C
	b _08082862
_08082816:
	adds r0, r2, #0
	adds r0, #0x20
	b _08082820
_0808281C:
	adds r0, r2, #0
	subs r0, #0x20
_08082820:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08082876
_08082826:
	movs r0, #0x40
	adds r1, r2, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0808283E
	adds r0, r3, #0
	subs r0, #0x18
	b _08082872
_0808283E:
	adds r0, r3, #0
	adds r0, #0x18
	b _08082872
_08082844:
	movs r0, #0x40
	adds r1, r2, #0
	subs r1, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0808285C
	adds r0, r3, #0
	subs r0, #0x18
	b _08082872
_0808285C:
	adds r0, r3, #0
	adds r0, #0x18
	b _08082872
_08082862:
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08082870
	subs r0, r3, r5
	b _08082872
_08082870:
	adds r0, r3, r5
_08082872:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08082876:
	adds r0, r2, #0
	adds r1, r3, #0
	adds r2, r6, #0
	bl ParticleSet
_08082880:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileCheckHittingSprite
ProjectileCheckHittingSprite: @ 0x08082888
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r2, _0808296C @ =gCurrentPowerBomb
	ldrb r0, [r2]
	cmp r0, #0
	bne _0808289E
	b _080829F6
_0808289E:
	ldr r0, _08082970 @ =gEquipment
	ldrb r1, [r0, #0xb]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080828AC
	b _080829F6
_080828AC:
	ldrh r0, [r2, #6]
	str r0, [sp, #0x20]
	ldrh r1, [r2, #4]
	ldrh r0, [r2, #0xc]
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	ldrh r0, [r2, #0xe]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldrh r0, [r2, #8]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	ldrh r0, [r2, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r4, _08082974 @ =0x0000A001
	str r4, [sp, #0x1c]
	ldr r4, _08082978 @ =0x00002001
	movs r0, #0
	mov r8, r0
_080828E6:
	ldr r1, _0808297C @ =gSpriteData
	mov r2, r8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _08082980
	ldrh r0, [r3]
	ldr r1, [sp, #0x1c]
	ands r0, r1
	cmp r0, #1
	bne _080829E6
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _080829E6
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080829E6
	ldrh r5, [r3, #2]
	ldrh r6, [r3, #4]
	ldrh r0, [r3, #0xa]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldrh r0, [r3, #0xc]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r3, #0xe]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r3, #0x10]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, [sp, #0x28]
	str r2, [sp]
	ldr r3, [sp, #0x2c]
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r1, [sp, #0x34]
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x38]
	mov r1, sb
	mov r2, sl
	adds r3, r7, #0
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _080829E6
	mov r0, r8
	bl ProjectilePowerBombHitSprite
	b _080829E6
	.align 2, 0
_0808296C: .4byte gCurrentPowerBomb
_08082970: .4byte gEquipment
_08082974: .4byte 0x0000A001
_08082978: .4byte 0x00002001
_0808297C: .4byte gSpriteData
_08082980:
	ldrh r0, [r3]
	ands r0, r4
	cmp r0, #1
	bne _080829E6
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _080829E6
	ldrh r5, [r3, #2]
	ldrh r6, [r3, #4]
	ldrh r0, [r3, #0xa]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldrh r0, [r3, #0xc]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r3, #0xe]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r3, #0x10]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, [sp, #0x28]
	str r2, [sp]
	ldr r3, [sp, #0x2c]
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r1, [sp, #0x34]
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x38]
	mov r1, sb
	mov r2, sl
	adds r3, r7, #0
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _080829E0
	mov r0, r8
	bl ProjectileSetIsftForPowerBomb
	b _080829E6
_080829E0:
	mov r0, r8
	bl ProjectileBringSpriteToPowerBombCenter
_080829E6:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bhi _080829F6
	b _080828E6
_080829F6:
	movs r2, #0
	str r2, [sp, #0x18]
	bl SamusCheckDamagingPose
	cmp r0, #0
	beq _08082A08
	movs r3, #1
	str r3, [sp, #0x18]
	b _08082A1E
_08082A08:
	movs r0, #0x80
	bl SamusCheckSudoScrew
	cmp r0, #0
	beq _08082A16
	movs r4, #2
	str r4, [sp, #0x18]
_08082A16:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _08082A1E
	b _08082B3C
_08082A1E:
	ldr r1, _08082AF4 @ =gSamusData
	ldrh r2, [r1, #0x18]
	ldrh r3, [r1, #0x16]
	ldrh r0, [r1, #0x26]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	ldrh r0, [r1, #0x2a]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldrh r0, [r1, #0x24]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	ldrh r0, [r1, #0x28]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r4, _08082AF8 @ =0x0000A001
	str r4, [sp, #0x1c]
	movs r0, #0
	mov r8, r0
_08082A54:
	ldr r0, _08082AFC @ =gSpriteData
	mov r2, r8
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r4, r1, r0
	ldrh r0, [r4]
	ldr r3, [sp, #0x1c]
	ands r0, r3
	cmp r0, #1
	bne _08082B2E
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08082B2E
	ldrh r5, [r4, #2]
	ldrh r6, [r4, #4]
	ldrh r0, [r4, #0xa]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldrh r0, [r4, #0xc]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r4, #0xe]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r4, #0x10]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [sp, #0x28]
	str r0, [sp]
	ldr r1, [sp, #0x2c]
	str r1, [sp, #4]
	ldr r2, [sp, #0x30]
	str r2, [sp, #8]
	ldr r3, [sp, #0x34]
	str r3, [sp, #0xc]
	ldr r0, [sp, #0x38]
	mov r1, sb
	mov r2, sl
	adds r3, r7, #0
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _08082B2E
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _08082B2E
	ldr r4, [sp, #0x18]
	cmp r4, #1
	bne _08082B00
	mov r0, sb
	ldr r2, [sp, #0x38]
	subs r1, r0, r2
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sl
	subs r2, r7, r3
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	add r2, sl
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r0, r8
	bl ProjectileContactDamageHitSprite
	b _08082B2E
	.align 2, 0
_08082AF4: .4byte gSamusData
_08082AF8: .4byte 0x0000A001
_08082AFC: .4byte gSpriteData
_08082B00:
	ldr r4, [sp, #0x18]
	cmp r4, #2
	bne _08082B2E
	mov r0, sb
	ldr r2, [sp, #0x38]
	subs r1, r0, r2
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sl
	subs r2, r7, r3
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	add r2, sl
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r0, r8
	bl ProjectileSudoScrewHitSprite
_08082B2E:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bls _08082A54
_08082B3C:
	ldr r4, _08082B70 @ =0x0000A001
	str r4, [sp, #0x1c]
	movs r0, #0
	mov r8, r0
	ldr r3, _08082B74 @ =gSpriteData
	ldr r2, _08082B78 @ =gSpriteDrawOrder
_08082B48:
	mov r1, r8
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r3
	ldrh r0, [r1]
	ldr r4, [sp, #0x1c]
	ands r0, r4
	cmp r0, #1
	bne _08082B7C
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	beq _08082B7C
	mov r4, r8
	adds r0, r4, r2
	adds r1, #0x22
	ldrb r1, [r1]
	strb r1, [r0]
	b _08082B84
	.align 2, 0
_08082B70: .4byte 0x0000A001
_08082B74: .4byte gSpriteData
_08082B78: .4byte gSpriteDrawOrder
_08082B7C:
	mov r0, r8
	adds r1, r0, r2
	movs r0, #0
	strb r0, [r1]
_08082B84:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bls _08082B48
	movs r1, #1
	str r1, [sp, #0x14]
_08082B96:
	movs r2, #0
	mov r8, r2
	ldr r3, [sp, #0x14]
	adds r3, #1
	str r3, [sp, #0x40]
_08082BA0:
	ldr r0, _08082C6C @ =gSpriteDrawOrder
	add r0, r8
	ldrb r0, [r0]
	mov r4, r8
	adds r4, #1
	str r4, [sp, #0x3c]
	ldr r1, [sp, #0x14]
	cmp r0, r1
	beq _08082BB4
	b _08082FC0
_08082BB4:
	ldr r0, _08082C70 @ =gSpriteData
	mov r3, r8
	lsls r2, r3, #3
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r4, [r1, #2]
	str r4, [sp, #0x20]
	ldrh r0, [r1, #4]
	str r0, [sp, #0x24]
	ldrh r0, [r1, #0xa]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	ldrh r0, [r1, #0xc]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldrh r0, [r1, #0xe]
	ldr r3, [sp, #0x24]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	ldrh r0, [r1, #0x10]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x34]
	movs r4, #0x11
	str r4, [sp, #0x1c]
	movs r0, #0
	str r0, [sp, #0x10]
	str r2, [sp, #0x44]
_08082BFC:
	ldr r1, _08082C74 @ =gProjectileData
	ldr r2, [sp, #0x10]
	lsls r0, r2, #5
	adds r4, r0, r1
	ldrb r0, [r4]
	ldr r3, [sp, #0x1c]
	ands r0, r3
	cmp r0, r3
	beq _08082C10
	b _08082FB0
_08082C10:
	ldrh r5, [r4, #8]
	ldrh r6, [r4, #0xa]
	ldrh r0, [r4, #0x16]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldrh r0, [r4, #0x18]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r4, #0x1a]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r4, #0x1c]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [sp, #0x38]
	str r0, [sp]
	mov r1, sb
	str r1, [sp, #4]
	mov r2, sl
	str r2, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	bne _08082C5A
	b _08082FB0
_08082C5A:
	ldrb r0, [r4, #0xf]
	cmp r0, #0x12
	bls _08082C62
	b _08082FB0
_08082C62:
	lsls r0, r0, #2
	ldr r1, _08082C78 @ =_08082C7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082C6C: .4byte gSpriteDrawOrder
_08082C70: .4byte gSpriteData
_08082C74: .4byte gProjectileData
_08082C78: .4byte _08082C7C
_08082C7C: @ jump table
	.4byte _08082CC8 @ case 0
	.4byte _08082CF0 @ case 1
	.4byte _08082D18 @ case 2
	.4byte _08082D40 @ case 3
	.4byte _08082D68 @ case 4
	.4byte _08082D90 @ case 5
	.4byte _08082DB8 @ case 6
	.4byte _08082DEE @ case 7
	.4byte _08082E14 @ case 8
	.4byte _08082E3C @ case 9
	.4byte _08082EA8 @ case 10
	.4byte _08082ED0 @ case 11
	.4byte _08082EF8 @ case 12
	.4byte _08082F20 @ case 13
	.4byte _08082F20 @ case 14
	.4byte _08082E72 @ case 15
	.4byte _08082F7E @ case 16
	.4byte _08082FB0 @ case 17
	.4byte _08082F48 @ case 18
_08082CC8:
	ldr r0, _08082CEC @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bls _08082CDE
	b _08082E64
_08082CDE:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileNormalBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082CEC: .4byte gSpriteData
_08082CF0:
	ldr r0, _08082D14 @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082DE0
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargeBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082D14: .4byte gSpriteData
_08082D18:
	ldr r0, _08082D3C @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bls _08082D2E
	b _08082E64
_08082D2E:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileWideBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082D3C: .4byte gSpriteData
_08082D40:
	ldr r0, _08082D64 @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bls _08082D56
	b _08082E64
_08082D56:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectilePlasmaBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082D64: .4byte gSpriteData
_08082D68:
	ldr r0, _08082D8C @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileWaveBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082D8C: .4byte gSpriteData
_08082D90:
	ldr r0, _08082DB4 @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedNormalBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082DB4: .4byte gSpriteData
_08082DB8:
	ldr r0, _08082DDC @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082DE0
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedChargeBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082DDC: .4byte gSpriteData
_08082DE0:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl unk_84cc8
	b _08082FB0
_08082DEE:
	ldr r0, _08082E10 @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedWideBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082E10: .4byte gSpriteData
_08082E14:
	ldr r0, _08082E38 @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedPlasmaBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082E38: .4byte gSpriteData
_08082E3C:
	ldr r0, _08082E60 @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedWaveBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082E60: .4byte gSpriteData
_08082E64:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl unk_84cac
	b _08082FB0
_08082E72:
	ldr r1, _08082E9C @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r0, r2, r3
	lsls r0, r0, #3
	adds r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _08082EA0
	ldr r4, [sp, #0x24]
	str r4, [sp]
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	ldr r3, [sp, #0x20]
	bl ProjectileFlareHitSprite
	b _08082FB0
	.align 2, 0
_08082E9C: .4byte gSpriteData
_08082EA0:
	adds r1, #0x2c
	movs r0, #0x78
	strb r0, [r1]
	b _08082FB0
_08082EA8:
	ldr r0, _08082ECC @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileNormalMissileHitSprite
	b _08082FB0
	.align 2, 0
_08082ECC: .4byte gSpriteData
_08082ED0:
	ldr r0, _08082EF4 @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileSuperMissileHitSprite
	b _08082FB0
	.align 2, 0
_08082EF4: .4byte gSpriteData
_08082EF8:
	ldr r0, _08082F1C @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileIceMissileHitSprite
	b _08082FB0
	.align 2, 0
_08082F1C: .4byte gSpriteData
_08082F20:
	ldr r0, _08082F44 @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileDiffusionMissileHitSprite
	b _08082FB0
	.align 2, 0
_08082F44: .4byte gSpriteData
_08082F48:
	ldr r0, _08082F6C @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileDiffusionFlakeHitSprite
	b _08082FB0
	.align 2, 0
_08082F6C: .4byte gSpriteData
_08082F70:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl unk_84ce4
	b _08082FB0
_08082F7E:
	ldr r0, _08082FA0 @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082FA4
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	bl ProjectileBombHitSprite
	b _08082FB0
	.align 2, 0
_08082FA0: .4byte gSpriteData
_08082FA4:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl unk_84cac
_08082FB0:
	ldr r0, [sp, #0x10]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #0xf
	bhi _08082FC0
	b _08082BFC
_08082FC0:
	ldr r1, [sp, #0x3c]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bhi _08082FCE
	b _08082BA0
_08082FCE:
	ldr r2, [sp, #0x40]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #0x10
	bhi _08082FDC
	b _08082B96
_08082FDC:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileCheckSpriteCreateDebris
ProjectileCheckSpriteCreateDebris: @ 0x08082FEC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08083018 @ =gSpriteData
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
	beq _08083020
	ldr r1, _0808301C @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	b _0808302E
	.align 2, 0
_08083018: .4byte gSpriteData
_0808301C: .4byte sSecondarySpriteStats
_08083020:
	ldr r2, _08083040 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
_0808302E:
	ldrh r1, [r0]
	movs r0, #0x10
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08083040: .4byte sPrimarySpriteStats

	thumb_func_start ProjectileGetSpriteWeakness
ProjectileGetSpriteWeakness: @ 0x08083044
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08083070 @ =gSpriteData
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
	beq _08083078
	ldr r1, _08083074 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r1, #6
	adds r0, r0, r1
	b _08083086
	.align 2, 0
_08083070: .4byte gSpriteData
_08083074: .4byte sSecondarySpriteStats
_08083078:
	ldr r2, _0808308C @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, #6
	adds r0, r0, r2
_08083086:
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0808308C: .4byte sPrimarySpriteStats

	thumb_func_start ProjectileRandomSpriteDebris
ProjectileRandomSpriteDebris: @ 0x08083090
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	cmp r1, #9
	beq _080830EE
	cmp r1, #9
	bgt _080830B2
	cmp r1, #5
	beq _080830B8
	b _080831B4
_080830B2:
	cmp r0, #0x11
	beq _08083140
	b _080831B4
_080830B8:
	ldr r0, _080830D8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080830DC
	adds r2, r5, #0
	subs r2, #8
	adds r3, r6, #0
	adds r3, #8
	adds r0, r7, #0
	movs r1, #2
	bl SpriteDebrisInit
	b _080831B4
	.align 2, 0
_080830D8: .4byte gFrameCounter8Bit
_080830DC:
	adds r2, r5, #0
	adds r2, #8
	adds r3, r6, #0
	subs r3, #8
	adds r0, r7, #0
	movs r1, #1
	bl SpriteDebrisInit
	b _080831B4
_080830EE:
	ldr r0, _0808311C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083120
	adds r2, r5, #0
	subs r2, #8
	adds r3, r6, #0
	adds r3, #8
	adds r0, r7, #0
	movs r1, #2
	bl SpriteDebrisInit
	adds r2, r5, #0
	adds r2, #8
	adds r3, r6, #0
	subs r3, #8
	adds r0, r7, #0
	movs r1, #4
	bl SpriteDebrisInit
	b _080831B4
	.align 2, 0
_0808311C: .4byte gFrameCounter8Bit
_08083120:
	adds r2, r5, #0
	subs r2, #8
	adds r3, r6, #0
	subs r3, #8
	adds r0, r7, #0
	movs r1, #1
	bl SpriteDebrisInit
	adds r3, r6, #0
	adds r3, #8
	adds r0, r7, #0
	movs r1, #3
	adds r2, r5, #0
	bl SpriteDebrisInit
	b _080831B4
_08083140:
	ldr r0, _08083180 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083184
	adds r2, r5, #0
	subs r2, #8
	adds r4, r6, #0
	subs r4, #8
	adds r0, r7, #0
	movs r1, #1
	adds r3, r4, #0
	bl SpriteDebrisInit
	adds r2, r5, #0
	subs r2, #0x10
	adds r3, r6, #0
	adds r3, #8
	adds r0, r7, #0
	movs r1, #3
	bl SpriteDebrisInit
	adds r2, r5, #0
	adds r2, #8
	adds r0, r7, #0
	movs r1, #4
	adds r3, r4, #0
	bl SpriteDebrisInit
	b _080831B4
	.align 2, 0
_08083180: .4byte gFrameCounter8Bit
_08083184:
	adds r2, r5, #0
	subs r2, #0x10
	adds r4, r6, #0
	adds r4, #8
	adds r0, r7, #0
	movs r1, #2
	adds r3, r4, #0
	bl SpriteDebrisInit
	adds r2, r5, #0
	adds r2, #8
	adds r0, r7, #0
	movs r1, #3
	adds r3, r4, #0
	bl SpriteDebrisInit
	adds r2, r5, #0
	adds r2, #0x10
	adds r3, r6, #0
	subs r3, #8
	adds r0, r7, #0
	movs r1, #4
	bl SpriteDebrisInit
_080831B4:
	ldr r0, _080831C0 @ =0x000001BF
	bl SoundPlay
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080831C0: .4byte 0x000001BF

	thumb_func_start ProjectileRandomSpriteDebrisPiercing
ProjectileRandomSpriteDebrisPiercing: @ 0x080831C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	cmp r1, #9
	beq _08083216
	cmp r1, #9
	bgt _080831E6
	cmp r1, #5
	beq _080831EC
	b _080832AC
_080831E6:
	cmp r0, #0x11
	beq _08083268
	b _080832AC
_080831EC:
	ldr r0, _0808320C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083210
	adds r2, r4, #0
	subs r2, #8
	adds r3, r5, #0
	adds r3, #8
	adds r0, r6, #0
	movs r1, #2
	bl SpriteDebrisInit
	b _080832AC
	.align 2, 0
_0808320C: .4byte gFrameCounter8Bit
_08083210:
	adds r2, r4, #0
	adds r2, #8
	b _08083278
_08083216:
	ldr r0, _08083244 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083248
	adds r2, r4, #0
	subs r2, #8
	adds r3, r5, #0
	adds r3, #8
	adds r0, r6, #0
	movs r1, #2
	bl SpriteDebrisInit
	adds r2, r4, #0
	adds r2, #8
	adds r3, r5, #0
	subs r3, #8
	adds r0, r6, #0
	movs r1, #4
	bl SpriteDebrisInit
	b _080832AC
	.align 2, 0
_08083244: .4byte gFrameCounter8Bit
_08083248:
	adds r2, r4, #0
	subs r2, #8
	adds r3, r5, #0
	subs r3, #8
	adds r0, r6, #0
	movs r1, #1
	bl SpriteDebrisInit
	adds r3, r5, #0
	adds r3, #8
	adds r0, r6, #0
	movs r1, #3
	adds r2, r4, #0
	bl SpriteDebrisInit
	b _080832AC
_08083268:
	ldr r0, _08083288 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808328C
	adds r2, r4, #0
	subs r2, #8
_08083278:
	adds r3, r5, #0
	subs r3, #8
	adds r0, r6, #0
	movs r1, #1
	bl SpriteDebrisInit
	b _080832AC
	.align 2, 0
_08083288: .4byte gFrameCounter8Bit
_0808328C:
	adds r2, r4, #0
	subs r2, #0x10
	adds r3, r5, #0
	adds r3, #8
	adds r0, r6, #0
	movs r1, #2
	bl SpriteDebrisInit
	adds r2, r4, #0
	adds r2, #0x10
	adds r3, r5, #0
	subs r3, #8
	adds r0, r6, #0
	movs r1, #4
	bl SpriteDebrisInit
_080832AC:
	ldr r0, _080832B8 @ =0x000001BF
	bl SoundPlay
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080832B8: .4byte 0x000001BF

	thumb_func_start ProjectileSetIsftForPowerBomb
ProjectileSetIsftForPowerBomb: @ 0x080832BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080832E8 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	bne _080832E2
	adds r2, r1, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
_080832E2:
	pop {r0}
	bx r0
	.align 2, 0
_080832E8: .4byte gSpriteData

	thumb_func_start ProjectileBringSpriteToPowerBombCenter
ProjectileBringSpriteToPowerBombCenter: @ 0x080832EC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _08083334 @ =gCurrentPowerBomb
	ldrb r0, [r5]
	cmp r0, #4
	bne _08083368
	ldr r1, _08083338 @ =gSpriteData
	lsls r2, r4, #3
	subs r0, r2, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r0, [r0]
	mov ip, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _08083368
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08083368
	ldrh r1, [r3, #2]
	ldrh r3, [r3, #4]
	ldrh r0, [r5, #6]
	ldrh r2, [r5, #4]
	movs r5, #0x18
	cmp r1, r0
	bls _0808333C
	adds r0, r1, #0
	subs r0, #0x14
	b _08083344
	.align 2, 0
_08083334: .4byte gCurrentPowerBomb
_08083338: .4byte gSpriteData
_0808333C:
	cmp r1, r0
	bhs _08083348
	ldr r7, _08083350 @ =0x00010014
	adds r0, r1, r7
_08083344:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08083348:
	cmp r3, r2
	bls _08083354
	subs r0, r3, r5
	b _0808335A
	.align 2, 0
_08083350: .4byte 0x00010014
_08083354:
	cmp r3, r2
	bhs _0808335E
	adds r0, r3, r5
_0808335A:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0808335E:
	subs r0, r6, r4
	lsls r0, r0, #3
	add r0, ip
	strh r1, [r0, #2]
	strh r3, [r0, #4]
_08083368:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectilePowerBombHitSprite
ProjectilePowerBombHitSprite: @ 0x08083370
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080833B0 @ =gSpriteData
	mov sb, r0
	lsls r7, r5, #3
	subs r0, r7, r5
	lsls r0, r0, #3
	mov r1, sb
	adds r4, r0, r1
	adds r6, r4, #0
	adds r6, #0x34
	ldrb r1, [r6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08083468
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0
	beq _080833B4
	adds r0, r5, #0
	bl ProjectileSetIsftForSolid
	b _08083468
	.align 2, 0
_080833B0: .4byte gSpriteData
_080833B4:
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083440
	ldrh r0, [r4, #0x14]
	cmp r0, #0x32
	bls _080833D2
	subs r0, #0x32
	strh r0, [r4, #0x14]
	mov r4, sb
	adds r2, r7, #0
	b _0808343C
_080833D2:
	movs r2, #0
	mov r0, r8
	strh r0, [r4, #0x14]
	ldrb r1, [r6]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r6]
	adds r0, r4, #0
	adds r0, #0x32
	strb r2, [r0]
	subs r0, #0x12
	strb r2, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083402
	ldr r0, _0808342C @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08083402
	movs r0, #2
	strb r0, [r1]
_08083402:
	ldr r1, _08083430 @ =gSpriteData
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0x2f
	bhi _08083434
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _0808343A
	.align 2, 0
_0808342C: .4byte gSamusData
_08083430: .4byte gSpriteData
_08083434:
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #0x28
_0808343A:
	strb r0, [r1]
_0808343C:
	movs r3, #0x11
	b _08083446
_08083440:
	movs r3, #2
	mov r4, sb
	adds r2, r7, #0
_08083446:
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r4
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	cmp r0, r3
	bhs _08083462
	movs r0, #0x80
	orrs r3, r0
	strb r3, [r1]
	b _08083468
_08083462:
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r1]
_08083468:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileContactDamageHitSprite
ProjectileContactDamageHitSprite: @ 0x08083474
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r1, _08083534 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080834A6
	b _080835E6
_080834A6:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080834BA
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xc0
	beq _080834BA
	cmp r0, #0xa2
	beq _080834BA
	b _080835E6
_080834BA:
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x20
	mov sb, r1
	ands r1, r0
	cmp r1, #0
	beq _08083584
	ldr r1, _08083534 @ =gSpriteData
	lsls r4, r5, #3
	subs r0, r4, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	mov ip, r0
	movs r3, #0
	movs r0, #0
	mov r2, ip
	strh r0, [r2, #0x14]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	adds r6, r4, #0
	cmp r0, #0
	beq _0808350C
	ldr r0, _08083538 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808350C
	movs r0, #2
	strb r0, [r1]
_0808350C:
	ldr r1, _08083534 @ =gSpriteData
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _0808353C
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _08083542
	.align 2, 0
_08083534: .4byte gSpriteData
_08083538: .4byte gSamusData
_0808353C:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_08083542:
	strb r0, [r1]
	adds r0, r5, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080835C8
	ldr r0, _08083564 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x1e
	bne _08083568
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x3d
	bl ParticleSet
	b _080835C8
	.align 2, 0
_08083564: .4byte gSamusData
_08083568:
	cmp r0, #0x24
	bne _08083578
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x3f
	bl ParticleSet
	b _080835C8
_08083578:
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x3e
	bl ParticleSet
	b _080835C8
_08083584:
	ldr r2, _080835AC @ =gSpriteData
	lsls r1, r5, #3
	subs r0, r1, r5
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrb r0, [r4, #0x1d]
	adds r6, r1, #0
	cmp r0, #0xc0
	bne _080835C4
	adds r0, r5, #0
	movs r1, #0xa
	bl ProjecileDealDamage
	ldr r1, _080835B0 @ =gSamusData
	ldrh r0, [r1, #0x16]
	ldrh r4, [r4, #4]
	cmp r0, r4
	bls _080835B4
	mov r0, sb
	b _080835B6
	.align 2, 0
_080835AC: .4byte gSpriteData
_080835B0: .4byte gSamusData
_080835B4:
	movs r0, #0x10
_080835B6:
	strh r0, [r1, #0x12]
	movs r0, #1
	adds r1, r5, #0
	movs r2, #1
	bl TakeDamageFromSprite
	b _080835E6
_080835C4:
	movs r1, #2
	mov sl, r1
_080835C8:
	ldr r0, _080835F4 @ =gSpriteData
	subs r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	cmp r0, sl
	bhs _080835E6
	movs r0, #0x80
	ands r0, r2
	mov r2, sl
	orrs r0, r2
	strb r0, [r1]
_080835E6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080835F4: .4byte gSpriteData

	thumb_func_start ProjecileDealDamage
ProjecileDealDamage: @ 0x080835F8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r1, _0808362C @ =gSpriteData
	lsls r4, r5, #3
	subs r0, r4, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	mov ip, r0
	ldrh r0, [r0, #0x14]
	adds r6, r1, #0
	cmp r0, r2
	bls _08083630
	subs r0, r0, r2
	mov r1, ip
	strh r0, [r1, #0x14]
	movs r3, #5
	cmp r2, #2
	bls _0808369E
	movs r3, #0x11
	cmp r2, #3
	bhi _0808369E
	movs r3, #9
	b _0808369E
	.align 2, 0
_0808362C: .4byte gSpriteData
_08083630:
	movs r3, #0
	movs r0, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083666
	ldr r0, _08083690 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08083666
	movs r0, #2
	strb r0, [r1]
_08083666:
	lsls r1, r5, #3
	subs r0, r1, r5
	lsls r0, r0, #3
	adds r2, r0, r6
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0x2f
	bhi _08083694
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _0808369A
	.align 2, 0
_08083690: .4byte gSamusData
_08083694:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_0808369A:
	strb r0, [r1]
	movs r3, #0x11
_0808369E:
	subs r0, r4, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	cmp r0, r3
	bhs _080836BA
	movs r0, #0x80
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_080836BA:
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProjectileSudoScrewHitSprite
ProjectileSudoScrewHitSprite: @ 0x080836C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r1, _08083718 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r0, [r0]
	movs r4, #0x48
	ands r4, r0
	cmp r4, #0
	bne _0808377C
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0808377C
	ldr r0, _0808371C @ =gSamusData
	strb r4, [r0, #0xc]
	movs r1, #0
	ldr r0, _08083720 @ =gEquipment
	ldrb r2, [r0, #0xa]
	adds r3, r2, #0
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08083712
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08083724
_08083712:
	movs r1, #0x30
	b _0808374A
	.align 2, 0
_08083718: .4byte gSpriteData
_0808371C: .4byte gSamusData
_08083720: .4byte gEquipment
_08083724:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08083730
	movs r1, #0x1e
	b _0808374A
_08083730:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _0808373C
	movs r1, #0x15
	b _0808374A
_0808373C:
	movs r0, #1
	ands r3, r0
	cmp r3, #0
	beq _08083746
	movs r1, #0xe
_08083746:
	cmp r1, #0
	beq _0808377C
_0808374A:
	adds r0, r5, #0
	bl ProjecileDealDamage
	adds r0, r5, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083766
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x40
	bl ParticleSet
_08083766:
	ldr r0, _08083784 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	beq _0808377C
	adds r1, #0x26
	movs r0, #0
	strb r0, [r1]
_0808377C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083784: .4byte gSpriteData

	thumb_func_start ProjectileIceMissileDealDamage
ProjectileIceMissileDealDamage: @ 0x08083788
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	adds r0, r6, #0
	bl ProjectileGetSpriteWeakness
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, r5, #0
	movs r0, #0xc
	ands r0, r5
	cmp r0, #0
	beq _0808389A
	ldr r0, _080837E0 @ =gSpriteData
	lsls r2, r6, #3
	subs r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r3, [r1, #0x14]
	mov sb, r0
	mov r8, r2
	cmp r3, r7
	bls _080837E4
	subs r0, r3, r7
	strh r0, [r1, #0x14]
	movs r1, #0x11
	str r1, [sp]
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08083878
	movs r3, #0xf0
	mov sl, r3
	b _08083878
	.align 2, 0
_080837E0: .4byte gSpriteData
_080837E4:
	movs r0, #0x11
	str r0, [sp]
	movs r0, #0x40
	ands r4, r0
	cmp r4, #0
	beq _08083804
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083804
	movs r0, #1
	strh r0, [r1, #0x14]
	movs r1, #0xf0
	mov sl, r1
	b _08083878
_08083804:
	mov r3, r8
	subs r0, r3, r6
	lsls r0, r0, #3
	add r0, sb
	mov ip, r0
	movs r3, #0
	movs r0, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083844
	ldr r0, _0808386C @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08083844
	movs r0, #2
	strb r0, [r1]
_08083844:
	mov r3, r8
	subs r0, r3, r6
	lsls r0, r0, #3
	mov r1, sb
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _08083870
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _08083876
	.align 2, 0
_0808386C: .4byte gSamusData
_08083870:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_08083876:
	strb r0, [r1]
_08083878:
	mov r3, r8
	subs r0, r3, r6
	lsls r0, r0, #3
	add r0, sb
	adds r2, r0, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	ldr r3, [sp]
	cmp r0, r3
	bhs _0808389E
	movs r0, #0x80
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _0808389E
_0808389A:
	movs r0, #0xf0
	mov sl, r0
_0808389E:
	mov r1, sl
	cmp r1, #0
	beq _080838D8
	ldr r1, _080838EC @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r1, r2, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x32
	mov r3, sl
	strb r3, [r0]
	adds r0, #3
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080838D8:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080838EC: .4byte gSpriteData

	thumb_func_start ProjectileDiffusionFlakeDealDamage
ProjectileDiffusionFlakeDealDamage: @ 0x080838F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	mov sl, r0
	mov sb, r0
	adds r0, r6, #0
	bl ProjectileGetSpriteWeakness
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, r5, #0
	movs r0, #0xc
	ands r0, r5
	cmp r0, #0
	beq _080839F8
	ldr r0, _08083944 @ =gSpriteData
	lsls r2, r6, #3
	subs r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r3, [r1, #0x14]
	mov r8, r0
	adds r7, r2, #0
	cmp r3, #1
	bls _08083948
	subs r0, r3, #1
	strh r0, [r1, #0x14]
	movs r1, #5
	mov sl, r1
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _080839D8
	movs r0, #0xf0
	mov sb, r0
	b _080839D8
	.align 2, 0
_08083944: .4byte gSpriteData
_08083948:
	movs r0, #0x11
	mov sl, r0
	movs r0, #0x40
	ands r4, r0
	cmp r4, #0
	beq _08083968
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083968
	movs r0, #1
	strh r0, [r1, #0x14]
	movs r1, #0xf0
	mov sb, r1
	b _080839D8
_08083968:
	subs r0, r7, r6
	lsls r0, r0, #3
	add r0, r8
	mov ip, r0
	movs r3, #0
	movs r0, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _080839A6
	ldr r0, _080839CC @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _080839A6
	movs r0, #2
	strb r0, [r1]
_080839A6:
	subs r0, r7, r6
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _080839D0
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _080839D6
	.align 2, 0
_080839CC: .4byte gSamusData
_080839D0:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_080839D6:
	strb r0, [r1]
_080839D8:
	subs r0, r7, r6
	lsls r0, r0, #3
	add r0, r8
	adds r2, r0, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, sl
	bhs _080839FC
	movs r0, #0x80
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r2]
	b _080839FC
_080839F8:
	movs r0, #0xf0
	mov sb, r0
_080839FC:
	mov r1, sb
	cmp r1, #0
	beq _08083A36
	ldr r1, _08083A48 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r1, r2, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x32
	mov r1, sb
	strb r1, [r0]
	adds r0, #3
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08083A36:
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08083A48: .4byte gSpriteData

	thumb_func_start ProjectileIceBeamDealDamage
ProjectileIceBeamDealDamage: @ 0x08083A4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r6, #0
	movs r7, #0
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #3
	ands r0, r3
	cmp r0, #0
	beq _08083B2C
	ldr r0, _08083A9C @ =gSpriteData
	lsls r2, r4, #3
	subs r1, r2, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	mov ip, r1
	ldrh r1, [r1, #0x14]
	mov sb, r0
	mov r8, r2
	cmp r1, r5
	bls _08083AA0
	subs r0, r1, r5
	mov r1, ip
	strh r0, [r1, #0x14]
	movs r6, #0x11
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08083B0C
	movs r7, #0xf0
	b _08083B0C
	.align 2, 0
_08083A9C: .4byte gSpriteData
_08083AA0:
	movs r6, #0x11
	movs r3, #0
	mov r0, ip
	strh r7, [r0, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083AD6
	ldr r0, _08083B00 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08083AD6
	movs r0, #2
	strb r0, [r1]
_08083AD6:
	mov r1, r8
	subs r0, r1, r4
	lsls r0, r0, #3
	mov r1, sb
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _08083B04
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _08083B0A
	.align 2, 0
_08083B00: .4byte gSamusData
_08083B04:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_08083B0A:
	strb r0, [r1]
_08083B0C:
	mov r1, r8
	subs r0, r1, r4
	lsls r0, r0, #3
	add r0, sb
	adds r2, r0, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, r6
	bhs _08083B2E
	movs r0, #0x80
	ands r0, r1
	orrs r0, r6
	strb r0, [r2]
	b _08083B2E
_08083B2C:
	movs r7, #0xf0
_08083B2E:
	cmp r7, #0
	beq _08083B64
	ldr r1, _08083B74 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r1, r2, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x32
	strb r7, [r0]
	adds r0, #3
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08083B64:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08083B74: .4byte gSpriteData

	thumb_func_start ProjectileSetIsftForSolid
ProjectileSetIsftForSolid: @ 0x08083B78
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08083BA8 @ =gSpriteData
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r3, r1, #0
	adds r3, #0x2c
	ldrb r2, [r3]
	movs r1, #0x7f
	ands r1, r2
	cmp r1, #2
	bhs _08083BA2
	movs r1, #0x80
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
_08083BA2:
	pop {r1}
	bx r1
	.align 2, 0
_08083BA8: .4byte gSpriteData

	thumb_func_start ProjectileNormalBeamHitSprite
ProjectileNormalBeamHitSprite: @ 0x08083BAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083BEC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083BF0
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083C36
	.align 2, 0
_08083BEC: .4byte gSpriteData
_08083BF0:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083C04
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083C52
_08083C04:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08083C42
	adds r0, r4, #0
	movs r1, #2
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083C36
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083C36:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl ParticleSet
	b _08083C52
_08083C42:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083C52:
	ldr r0, _08083C6C @ =gProjectileData
	mov r2, sl
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083C6C: .4byte gProjectileData

	thumb_func_start ProjectileChargedNormalBeamHitSprite
ProjectileChargedNormalBeamHitSprite: @ 0x08083C70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083CB0 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083CB4
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083CFA
	.align 2, 0
_08083CB0: .4byte gSpriteData
_08083CB4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083CC8
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083D16
_08083CC8:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08083D06
	adds r0, r4, #0
	movs r1, #0xa
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083CFA
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083CFA:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl ParticleSet
	b _08083D16
_08083D06:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083D16:
	ldr r0, _08083D30 @ =gProjectileData
	mov r2, sl
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083D30: .4byte gProjectileData

	thumb_func_start ProjectileChargeBeamHitSprite
ProjectileChargeBeamHitSprite: @ 0x08083D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083D74 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083D78
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083DBE
	.align 2, 0
_08083D74: .4byte gSpriteData
_08083D78:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083D8C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083DDA
_08083D8C:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08083DCA
	adds r0, r4, #0
	movs r1, #2
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083DBE
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083DBE:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #4
	bl ParticleSet
	b _08083DDA
_08083DCA:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083DDA:
	ldr r2, _08083E10 @ =gProjectileData
	mov r0, sl
	lsls r3, r0, #5
	adds r4, r3, r2
	ldrb r1, [r4]
	movs r5, #4
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08083DFC
	ldrb r0, [r4, #0x1f]
	lsls r0, r0, #5
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bhi _08083DFC
	strb r5, [r1, #0x12]
_08083DFC:
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083E10: .4byte gProjectileData

	thumb_func_start ProjectileChargedChargeBeamHitSprite
ProjectileChargedChargeBeamHitSprite: @ 0x08083E14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083E54 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083E58
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083E9E
	.align 2, 0
_08083E54: .4byte gSpriteData
_08083E58:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083E6C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083EBA
_08083E6C:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08083EAA
	adds r0, r4, #0
	movs r1, #0xa
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083E9E
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083E9E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #4
	bl ParticleSet
	b _08083EBA
_08083EAA:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083EBA:
	ldr r2, _08083EF0 @ =gProjectileData
	mov r0, sl
	lsls r3, r0, #5
	adds r4, r3, r2
	ldrb r1, [r4]
	movs r5, #4
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08083EDC
	ldrb r0, [r4, #0x1f]
	lsls r0, r0, #5
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bhi _08083EDC
	strb r5, [r1, #0x12]
_08083EDC:
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083EF0: .4byte gProjectileData

	thumb_func_start ProjectileWideBeamHitSprite
ProjectileWideBeamHitSprite: @ 0x08083EF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083F34 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083F38
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083F7E
	.align 2, 0
_08083F34: .4byte gSpriteData
_08083F38:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083F4C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083F9A
_08083F4C:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08083F8A
	adds r0, r4, #0
	movs r1, #3
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083F7E
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083F7E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl ParticleSet
	b _08083F9A
_08083F8A:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083F9A:
	ldr r0, _08083FB4 @ =gProjectileData
	mov r2, sl
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083FB4: .4byte gProjectileData

	thumb_func_start ProjectileChargedWideBeamHitSprite
ProjectileChargedWideBeamHitSprite: @ 0x08083FB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083FF8 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083FFC
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08084042
	.align 2, 0
_08083FF8: .4byte gSpriteData
_08083FFC:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084010
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _0808405E
_08084010:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0808404E
	adds r0, r4, #0
	movs r1, #0xf
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084042
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08084042:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl ParticleSet
	b _0808405E
_0808404E:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_0808405E:
	ldr r0, _08084078 @ =gProjectileData
	mov r2, sl
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084078: .4byte gProjectileData

	thumb_func_start ProjectilePlasmaBeamHitSprite
ProjectilePlasmaBeamHitSprite: @ 0x0808407C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov sb, r8
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	str r6, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	mov sl, r7
	ldr r1, _080840DC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080840E4
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #6
	bl ParticleSet
	ldr r0, _080840E0 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	b _0808414C
	.align 2, 0
_080840DC: .4byte gSpriteData
_080840E0: .4byte gProjectileData
_080840E4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084108
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	ldr r1, _08084104 @ =gProjectileData
	mov r2, sb
	lsls r0, r2, #5
	adds r0, r0, r1
	strb r5, [r0]
	b _0808414C
	.align 2, 0
_08084104: .4byte gProjectileData
_08084108:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0808413C
	adds r0, r4, #0
	movs r1, #3
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808414C
	movs r0, #1
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ProjectileRandomSpriteDebrisPiercing
	b _0808414C
_0808413C:
	ldr r0, [sp]
	bl ProjectileSetIsftForSolid
	ldr r0, [sp, #4]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
_0808414C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileChargedPlasmaBeamHitSprite
ProjectileChargedPlasmaBeamHitSprite: @ 0x0808415C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov sb, r8
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	str r6, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	mov sl, r7
	ldr r1, _080841BC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080841C4
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #6
	bl ParticleSet
	ldr r0, _080841C0 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	b _0808422C
	.align 2, 0
_080841BC: .4byte gSpriteData
_080841C0: .4byte gProjectileData
_080841C4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080841E8
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	ldr r1, _080841E4 @ =gProjectileData
	mov r2, sb
	lsls r0, r2, #5
	adds r0, r0, r1
	strb r5, [r0]
	b _0808422C
	.align 2, 0
_080841E4: .4byte gProjectileData
_080841E8:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0808421C
	adds r0, r4, #0
	movs r1, #9
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808422C
	movs r0, #1
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ProjectileRandomSpriteDebrisPiercing
	b _0808422C
_0808421C:
	ldr r0, [sp]
	bl ProjectileSetIsftForSolid
	ldr r0, [sp, #4]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
_0808422C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileWaveBeamHitSprite
ProjectileWaveBeamHitSprite: @ 0x0808423C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	str r0, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	str r7, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	mov sl, r8
	ldr r1, _080842D0 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _080842D8
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	ldr r0, _080842D4 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08084296
	b _0808438E
_08084296:
	adds r7, r5, #0
	adds r7, #0x32
	ldrb r6, [r7]
	cmp r6, #0
	bne _0808438E
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _0808438E
	adds r0, r5, #0
	adds r0, #0x33
	strb r6, [r0]
	movs r0, #0xf0
	strb r0, [r7]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r5, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	b _0808438E
	.align 2, 0
_080842D0: .4byte gSpriteData
_080842D4: .4byte gEquipment
_080842D8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080842FC
	adds r0, r7, #0
	mov r1, r8
	movs r2, #7
	bl ParticleSet
	ldr r1, _080842F8 @ =gProjectileData
	mov r2, sb
	lsls r0, r2, #5
	adds r0, r0, r1
	strb r6, [r0]
	b _0808438E
	.align 2, 0
_080842F8: .4byte gProjectileData
_080842FC:
	ldr r0, _08084334 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808434A
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x42
	ands r1, r0
	cmp r1, #0
	beq _08084338
	adds r0, r4, #0
	ldr r1, [sp, #4]
	movs r2, #6
	bl ProjectileIceBeamDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808438E
	movs r0, #2
	b _08084372
	.align 2, 0
_08084334: .4byte gEquipment
_08084338:
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r7, #0
	mov r1, r8
	movs r2, #7
	bl ParticleSet
	b _0808438E
_0808434A:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0808437E
	adds r0, r4, #0
	movs r1, #3
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808438E
	movs r0, #1
_08084372:
	adds r1, r5, #0
	adds r2, r7, #0
	mov r3, r8
	bl ProjectileRandomSpriteDebrisPiercing
	b _0808438E
_0808437E:
	ldr r0, [sp]
	bl ProjectileSetIsftForSolid
	ldr r0, [sp, #8]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
_0808438E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileChargedWaveBeamHitSprite
ProjectileChargedWaveBeamHitSprite: @ 0x080843A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov sl, sb
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	str r7, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	mov r0, r8
	str r0, [sp, #8]
	ldr r1, _08084438 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _08084440
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	ldr r0, _0808443C @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080843FA
	b _08084522
_080843FA:
	adds r7, r5, #0
	adds r7, #0x32
	ldrb r6, [r7]
	cmp r6, #0
	beq _08084406
	b _08084522
_08084406:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _08084416
	b _08084522
_08084416:
	adds r0, r5, #0
	adds r0, #0x33
	strb r6, [r0]
	movs r0, #0xf0
	strb r0, [r7]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r5, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08084522
	.align 2, 0
_08084438: .4byte gSpriteData
_0808443C: .4byte gEquipment
_08084440:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084464
	adds r0, r7, #0
	mov r1, r8
	movs r2, #7
	bl ParticleSet
	ldr r1, _08084460 @ =gProjectileData
	mov r2, sb
	lsls r0, r2, #5
	adds r0, r0, r1
	strb r6, [r0]
	b _08084522
	.align 2, 0
_08084460: .4byte gProjectileData
_08084464:
	ldr r0, _0808449C @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080844B2
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x43
	ands r1, r0
	cmp r1, #0
	beq _080844A0
	adds r0, r4, #0
	mov r1, sl
	movs r2, #0xc
	bl ProjectileIceBeamDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084522
	movs r0, #2
	b _080844DA
	.align 2, 0
_0808449C: .4byte gEquipment
_080844A0:
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r7, #0
	mov r1, r8
	movs r2, #7
	bl ParticleSet
	b _08084522
_080844B2:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _080844E6
	adds r0, r4, #0
	movs r1, #9
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084522
	movs r0, #1
_080844DA:
	adds r1, r5, #0
	adds r2, r7, #0
	mov r3, r8
	bl ProjectileRandomSpriteDebrisPiercing
	b _08084522
_080844E6:
	ldrb r0, [r5, #0x1d]
	cmp r0, #0xc0
	bne _08084512
	adds r0, r4, #0
	movs r1, #9
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084522
	movs r0, #1
	adds r1, r5, #0
	adds r2, r7, #0
	mov r3, r8
	bl ProjectileRandomSpriteDebris
	b _08084522
_08084512:
	ldr r0, [sp]
	bl ProjectileSetIsftForSolid
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	movs r2, #7
	bl ParticleSet
_08084522:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileFlareHitSprite
ProjectileFlareHitSprite: @ 0x08084534
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov sb, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	ldr r1, _08084584 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0808464E
	movs r4, #8
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08084588
	adds r0, r5, #0
	bl ProjectileSetIsftForSolid
	b _0808464E
	.align 2, 0
_08084584: .4byte gSpriteData
_08084588:
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0808463E
	ldr r0, _080845A8 @ =gEquipment
	ldrb r2, [r0, #0xa]
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	beq _080845AC
	movs r1, #0xf
	b _080845C4
	.align 2, 0
_080845A8: .4byte gEquipment
_080845AC:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080845B8
	movs r1, #0xc
	b _080845C4
_080845B8:
	movs r0, #2
	ands r2, r0
	movs r1, #6
	cmp r2, #0
	beq _080845C4
	movs r1, #9
_080845C4:
	mov r0, sb
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r4, [sp]
	adds r5, r6, #0
	cmp r7, r4
	bls _080845E4
	subs r0, r7, r4
	cmp r0, #0x60
	ble _080845F2
	adds r0, r4, #0
	adds r0, #0x40
	b _080845EE
_080845E4:
	subs r0, r4, r7
	cmp r0, #0x60
	ble _080845F2
	adds r0, r4, #0
	subs r0, #0x40
_080845EE:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080845F2:
	cmp r8, r6
	bls _08084604
	mov r1, r8
	subs r0, r1, r6
	cmp r0, #0x30
	ble _08084614
	adds r0, r6, #0
	adds r0, #0x40
	b _08084610
_08084604:
	mov r1, r8
	subs r0, r6, r1
	cmp r0, #0x30
	ble _08084614
	adds r0, r6, #0
	subs r0, #0x40
_08084610:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08084614:
	mov r0, sb
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808462C
	movs r0, #0
	mov r1, sl
	adds r2, r4, #0
	adds r3, r5, #0
	bl ProjectileRandomSpriteDebris
_0808462C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ParticleSet
	movs r0, #0xf7
	bl SoundPlay
	b _0808464E
_0808463E:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	ldr r0, [sp]
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
_0808464E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileStartMissileTumble
ProjectileStartMissileTumble: @ 0x08084660
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r5, _080846A8 @ =gProjectileData
	lsrs r1, r1, #0x13
	adds r6, r1, r5
	movs r4, #0
	movs r2, #7
	strb r2, [r6, #0x12]
	strb r4, [r6, #0x1e]
	ldrb r3, [r6]
	movs r2, #0xef
	ands r2, r3
	movs r3, #8
	orrs r2, r3
	strb r2, [r6]
	strb r4, [r6, #0xe]
	strh r4, [r6, #0xc]
	adds r5, #4
	adds r1, r1, r5
	ldr r2, _080846AC @ =0x0858EA20
	str r2, [r1]
	ldr r2, _080846B0 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r6, #0xa]
	ldrh r1, [r1, #4]
	cmp r0, r1
	bls _080846B4
	ldrb r0, [r6]
	movs r1, #0x40
	orrs r0, r1
	b _080846BA
	.align 2, 0
_080846A8: .4byte gProjectileData
_080846AC: .4byte 0x0858EA20
_080846B0: .4byte gSpriteData
_080846B4:
	ldrb r1, [r6]
	movs r0, #0xbf
	ands r0, r1
_080846BA:
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileNormalMissileHitSprite
ProjectileNormalMissileHitSprite: @ 0x080846C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	str r5, [sp]
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	mov sl, r6
	ldr r1, _08084708 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r7, #8
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0808470C
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08084754
	.align 2, 0
_08084708: .4byte gSpriteData
_0808470C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084722
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	adds r0, r4, #0
	b _08084772
_08084722:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	adds r1, r7, #0
	ands r1, r0
	cmp r1, #0
	beq _08084760
	adds r0, r4, #0
	movs r1, #0xa
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084754
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08084754:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #8
	bl ParticleSet
	b _0808477A
_08084760:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	ldr r0, [sp]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
	mov r0, sb
_08084772:
	mov r1, r8
	bl ProjectileStartMissileTumble
	b _08084786
_0808477A:
	ldr r0, _08084798 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_08084786:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084798: .4byte gProjectileData

	thumb_func_start ProjectileSuperMissileHitSprite
ProjectileSuperMissileHitSprite: @ 0x0808479C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov sl, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	mov sb, r6
	ldr r1, _080847DC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080847E0
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08084828
	.align 2, 0
_080847DC: .4byte gSpriteData
_080847E0:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080847F6
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	adds r0, r4, #0
	b _08084846
_080847F6:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0xc
	ands r1, r0
	cmp r1, #0
	beq _08084834
	adds r0, r4, #0
	movs r1, #0x1e
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084828
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08084828:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #9
	bl ParticleSet
	b _0808484E
_08084834:
	adds r0, r7, #0
	bl ProjectileSetIsftForSolid
	mov r0, sl
	mov r1, sb
	movs r2, #7
	bl ParticleSet
	adds r0, r7, #0
_08084846:
	mov r1, r8
	bl ProjectileStartMissileTumble
	b _0808485A
_0808484E:
	ldr r0, _08084868 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_0808485A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084868: .4byte gProjectileData

	thumb_func_start ProjectileIceMissileHitSprite
ProjectileIceMissileHitSprite: @ 0x0808486C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	str r6, [sp]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	mov sl, r7
	ldr r1, _080848F0 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080848F4
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xa
	bl ParticleSet
	adds r7, r5, #0
	adds r7, #0x32
	ldrb r6, [r7]
	cmp r6, #0
	bne _08084964
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08084964
	adds r0, r5, #0
	adds r0, #0x33
	strb r6, [r0]
	movs r0, #0xf0
	strb r0, [r7]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r5, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08084964
	.align 2, 0
_080848F0: .4byte gSpriteData
_080848F4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808490A
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	adds r0, r4, #0
	b _0808495C
_0808490A:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x4c
	ands r1, r0
	cmp r1, #0
	beq _0808494A
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x28
	bl ProjectileIceMissileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808493E
	movs r0, #2
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ProjectileRandomSpriteDebris
_0808493E:
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xa
	bl ParticleSet
	b _08084964
_0808494A:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	ldr r0, [sp]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
	mov r0, sb
_0808495C:
	mov r1, r8
	bl ProjectileStartMissileTumble
	b _08084970
_08084964:
	ldr r0, _08084980 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_08084970:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084980: .4byte gProjectileData

	thumb_func_start ProjectileDiffusionMissileHitSprite
ProjectileDiffusionMissileHitSprite: @ 0x08084984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, _080849DC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08084A3C
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	ldr r0, _080849E0 @ =gProjectileData
	mov r2, sb
	lsls r1, r2, #5
	adds r0, r1, r0
	ldrb r0, [r0, #0xf]
	mov sl, r1
	cmp r0, #0xe
	bne _080849E4
	movs r0, #1
	str r0, [sp, #0xc]
	b _080849EE
	.align 2, 0
_080849DC: .4byte gSpriteData
_080849E0: .4byte gProjectileData
_080849E4:
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xb
	bl ParticleSet
_080849EE:
	ldr r1, _08084A38 @ =gSpriteData
	mov r2, r8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #0x32
	adds r0, r0, r4
	mov sb, r0
	ldrb r5, [r0]
	cmp r5, #0
	bne _08084AC2
	mov r0, r8
	bl ProjectileGetSpriteWeakness
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08084AC2
	adds r0, r4, #0
	adds r0, #0x33
	strb r5, [r0]
	movs r0, #0xf0
	mov r1, sb
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r2, [r4, #0x1f]
	adds r0, r0, r2
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08084AC2
	.align 2, 0
_08084A38: .4byte gSpriteData
_08084A3C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084A52
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	adds r0, r4, #0
	b _08084ABA
_08084A52:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x4c
	ands r1, r0
	cmp r1, #0
	beq _08084AA8
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x2d
	bl ProjectileIceMissileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084A86
	movs r0, #2
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ProjectileRandomSpriteDebris
_08084A86:
	ldr r0, _08084AA4 @ =gProjectileData
	mov r2, sb
	lsls r1, r2, #5
	adds r0, r1, r0
	ldrb r0, [r0, #0xf]
	mov sl, r1
	cmp r0, #0xe
	beq _08084AC8
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xb
	bl ParticleSet
	b _08084AC2
	.align 2, 0
_08084AA4: .4byte gProjectileData
_08084AA8:
	mov r0, r8
	bl ProjectileSetIsftForSolid
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	mov r0, r8
_08084ABA:
	mov r1, sb
	bl ProjectileStartMissileTumble
	b _08084B4A
_08084AC2:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _08084B40
_08084AC8:
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xc
	bl ParticleSet
	ldr r4, _08084B3C @ =gProjectileData
	add r4, sl
	movs r5, #0
	movs r0, #3
	strb r0, [r4, #0x12]
	strb r5, [r4, #0x1e]
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r4, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl ProjectileInitSecondary
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r4, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0x40
	bl ProjectileInitSecondary
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r4, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0x80
	bl ProjectileInitSecondary
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r4, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0xc0
	bl ProjectileInitSecondary
	b _08084B4A
	.align 2, 0
_08084B3C: .4byte gProjectileData
_08084B40:
	ldr r0, _08084B5C @ =gProjectileData
	add r0, sl
	mov r1, sp
	ldrb r1, [r1, #0xc]
	strb r1, [r0]
_08084B4A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B5C: .4byte gProjectileData

	thumb_func_start ProjectileDiffusionFlakeHitSprite
ProjectileDiffusionFlakeHitSprite: @ 0x08084B60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r1, _08084BE0 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x40
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	bne _08084C20
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08084BE4
	adds r0, r5, #0
	bl ProjectileSetIsftForSolid
	adds r7, r4, #0
	adds r7, #0x32
	ldrb r6, [r7]
	cmp r6, #0
	bne _08084C20
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	mov r1, r8
	ands r1, r0
	cmp r1, #0
	beq _08084C20
	adds r0, r4, #0
	adds r0, #0x33
	strb r6, [r0]
	movs r0, #0xf0
	strb r0, [r7]
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r4, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08084C20
	.align 2, 0
_08084BE0: .4byte gSpriteData
_08084BE4:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08084C20
	adds r0, r6, #0
	bl ProjectileGetSpriteWeakness
	mov r1, r8
	ands r1, r0
	cmp r1, #0
	beq _08084C20
	adds r0, r6, #0
	adds r1, r7, #0
	bl ProjectileDiffusionFlakeDealDamage
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084C20
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, sb
	bl ProjectileRandomSpriteDebris
_08084C20:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileBombHitSprite
ProjectileBombHitSprite: @ 0x08084C30
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r1, _08084C68 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08084CA6
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08084C6C
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08084CA6
	.align 2, 0
_08084C68: .4byte gSpriteData
_08084C6C:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08084CA0
	adds r0, r4, #0
	movs r1, #8
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084CA6
	movs r0, #1
	adds r1, r5, #0
	adds r2, r7, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
	b _08084CA6
_08084CA0:
	adds r0, r5, #0
	bl ProjectileSetIsftForSolid
_08084CA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_84cac
unk_84cac: @ 0x08084CAC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08084CC4 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2c
	movs r0, #0x78
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084CC4: .4byte gSpriteData

	thumb_func_start unk_84cc8
unk_84cc8: @ 0x08084CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08084CE0 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2c
	movs r0, #0x78
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084CE0: .4byte gSpriteData

	thumb_func_start unk_84ce4
unk_84ce4: @ 0x08084CE4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08084CFC @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2c
	movs r0, #0x78
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084CFC: .4byte gSpriteData

	thumb_func_start ProjectileDealDamageToZazabi
ProjectileDealDamageToZazabi: @ 0x08084D00
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08084D18 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	mov ip, r1
	cmp r0, r2
	bls _08084D1C
	subs r0, r0, r2
	strh r0, [r1, #0x14]
	b _08084D52
	.align 2, 0
_08084D18: .4byte gCurrentSprite
_08084D1C:
	movs r3, #0
	movs r0, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08084D52
	ldr r0, _08084D70 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08084D52
	movs r0, #2
	strb r0, [r1]
_08084D52:
	mov r2, ip
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bhi _08084D6A
	movs r0, #0x80
	ands r0, r1
	movs r1, #0x11
	orrs r0, r1
	strb r0, [r2]
_08084D6A:
	pop {r0}
	bx r0
	.align 2, 0
_08084D70: .4byte gSamusData

	thumb_func_start ProjectileChargedNormalBeamInit
ProjectileChargedNormalBeamInit: @ 0x08084D74
	push {lr}
	movs r0, #0xc8
	bl SoundPlay
	ldr r3, _08084DB4 @ =gCurrentProjectile
	ldrb r1, [r3]
	movs r2, #0x10
	movs r0, #0
	orrs r2, r1
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r1, _08084DB8 @ =0x0000FFF0
	strh r1, [r3, #0x16]
	strh r0, [r3, #0x18]
	strh r1, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r2, r0
	strb r2, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08084E04
	lsls r0, r0, #2
	ldr r1, _08084DBC @ =_08084DC0
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	mov pc, r0
	.align 2, 0
_08084DB4: .4byte gCurrentProjectile
_08084DB8: .4byte 0x0000FFF0
_08084DBC: .4byte _08084DC0
_08084DC0: @ jump table
	.4byte _08084E04 @ case 0
	.4byte _08084DE0 @ case 1
	.4byte _08084DD4 @ case 2
	.4byte _08084DF8 @ case 3
	.4byte _08084DEC @ case 4
_08084DD4:
	ldr r0, _08084DE4 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r1, r0, #0
_08084DE0:
	ldr r0, _08084DE8 @ =0x0858D80C
	b _08084E08
	.align 2, 0
_08084DE4: .4byte gCurrentProjectile
_08084DE8: .4byte 0x0858D80C
_08084DEC:
	ldr r0, _08084DFC @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r1, r0, #0
_08084DF8:
	ldr r0, _08084E00 @ =0x0858D824
	b _08084E08
	.align 2, 0
_08084DFC: .4byte gCurrentProjectile
_08084E00: .4byte 0x0858D824
_08084E04:
	ldr r1, _08084E10 @ =gCurrentProjectile
	ldr r0, _08084E14 @ =0x0858D7F4
_08084E08:
	str r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08084E10: .4byte gCurrentProjectile
_08084E14: .4byte 0x0858D7F4

	thumb_func_start ProjectileChargedNormalBeamSubroutine
ProjectileChargedNormalBeamSubroutine: @ 0x08084E18
	push {r4, lr}
	ldr r0, _08084E3C @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08084E44
	ldr r1, _08084E40 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #3
	bl ParticleSet
	b _08084E7E
	.align 2, 0
_08084E3C: .4byte gCurrentClipdataAffectingAction
_08084E40: .4byte gCurrentProjectile
_08084E44:
	ldr r4, _08084E60 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08084E64
	cmp r0, #1
	beq _08084E6A
	movs r0, #0x18
	bl ProjectileMove
	movs r0, #0xf
	movs r1, #3
	bl ProjectileSetBeamTrail
	b _08084E76
	.align 2, 0
_08084E60: .4byte gCurrentProjectile
_08084E64:
	bl ProjectileChargedNormalBeamInit
	b _08084E70
_08084E6A:
	movs r0, #0x10
	bl ProjectileMove
_08084E70:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
_08084E76:
	ldr r1, _08084E84 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08084E7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084E84: .4byte gCurrentProjectile

	thumb_func_start ProjectileNormalBeamInit
ProjectileNormalBeamInit: @ 0x08084E88
	push {lr}
	movs r0, #0xc8
	bl SoundPlay
	ldr r3, _08084ECC @ =gCurrentProjectile
	ldrb r2, [r3]
	movs r1, #0x10
	movs r0, #0
	orrs r1, r2
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r2, _08084ED0 @ =0x0000FFF8
	strh r2, [r3, #0x16]
	movs r0, #8
	strh r0, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08084F24
	lsls r0, r0, #2
	ldr r1, _08084ED4 @ =_08084ED8
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, r3, #0
	mov pc, r0
	.align 2, 0
_08084ECC: .4byte gCurrentProjectile
_08084ED0: .4byte 0x0000FFF8
_08084ED4: .4byte _08084ED8
_08084ED8: @ jump table
	.4byte _08084F24 @ case 0
	.4byte _08084EF8 @ case 1
	.4byte _08084EEC @ case 2
	.4byte _08084F14 @ case 3
	.4byte _08084F08 @ case 4
_08084EEC:
	ldr r0, _08084F00 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_08084EF8:
	ldr r0, _08084F04 @ =0x0858D7C4
	str r0, [r2, #4]
	b _08084F2A
	.align 2, 0
_08084F00: .4byte gCurrentProjectile
_08084F04: .4byte 0x0858D7C4
_08084F08:
	ldr r0, _08084F1C @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_08084F14:
	ldr r0, _08084F20 @ =0x0858D7DC
	str r0, [r2, #4]
	b _08084F2A
	.align 2, 0
_08084F1C: .4byte gCurrentProjectile
_08084F20: .4byte 0x0858D7DC
_08084F24:
	ldr r1, _08084F30 @ =gCurrentProjectile
	ldr r0, _08084F34 @ =0x0858D7AC
	str r0, [r1, #4]
_08084F2A:
	pop {r0}
	bx r0
	.align 2, 0
_08084F30: .4byte gCurrentProjectile
_08084F34: .4byte 0x0858D7AC

	thumb_func_start ProjectileNormalBeamSubroutine
ProjectileNormalBeamSubroutine: @ 0x08084F38
	push {r4, lr}
	ldr r0, _08084F5C @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08084F64
	ldr r1, _08084F60 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #3
	bl ParticleSet
	b _08084F96
	.align 2, 0
_08084F5C: .4byte gCurrentClipdataAffectingAction
_08084F60: .4byte gCurrentProjectile
_08084F64:
	ldr r4, _08084F78 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08084F7C
	cmp r0, #1
	beq _08084F82
	movs r0, #0x18
	bl ProjectileMove
	b _08084F8E
	.align 2, 0
_08084F78: .4byte gCurrentProjectile
_08084F7C:
	bl ProjectileNormalBeamInit
	b _08084F88
_08084F82:
	movs r0, #0x10
	bl ProjectileMove
_08084F88:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
_08084F8E:
	ldr r1, _08084F9C @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08084F96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084F9C: .4byte gCurrentProjectile

	thumb_func_start ProjectileMissileInit
ProjectileMissileInit: @ 0x08084FA0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08084FF8 @ =gEquipment
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _08084FC2
	subs r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08084FC2
	ldr r0, _08084FFC @ =gSamusData
	ldrb r1, [r0, #8]
	movs r2, #1
	eors r1, r2
	strb r1, [r0, #8]
_08084FC2:
	ldr r1, _08085000 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r3, #0x10
	movs r0, #0x10
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _0808506C
	lsls r0, r0, #2
	ldr r1, _08085004 @ =_08085008
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08084FF8: .4byte gEquipment
_08084FFC: .4byte gSamusData
_08085000: .4byte gCurrentProjectile
_08085004: .4byte _08085008
_08085008: @ jump table
	.4byte _0808506C @ case 0
	.4byte _08085024 @ case 1
	.4byte _0808501C @ case 2
	.4byte _0808504C @ case 3
	.4byte _08085044 @ case 4
_0808501C:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08085024:
	cmp r4, #0
	bne _08085030
	ldr r0, _0808502C @ =0x0858E7C0
	b _08085086
	.align 2, 0
_0808502C: .4byte 0x0858E7C0
_08085030:
	cmp r4, #1
	bne _0808503C
	ldr r0, _08085038 @ =0x0858E858
	b _08085086
	.align 2, 0
_08085038: .4byte 0x0858E858
_0808503C:
	ldr r0, _08085040 @ =0x0858E998
	b _08085086
	.align 2, 0
_08085040: .4byte 0x0858E998
_08085044:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_0808504C:
	cmp r4, #0
	bne _08085058
	ldr r0, _08085054 @ =0x0858E7D8
	b _08085086
	.align 2, 0
_08085054: .4byte 0x0858E7D8
_08085058:
	cmp r4, #1
	bne _08085064
	ldr r0, _08085060 @ =0x0858E870
	b _08085086
	.align 2, 0
_08085060: .4byte 0x0858E870
_08085064:
	ldr r0, _08085068 @ =0x0858E9B0
	b _08085086
	.align 2, 0
_08085068: .4byte 0x0858E9B0
_0808506C:
	cmp r4, #0
	bne _08085078
	ldr r0, _08085074 @ =0x0858E7A8
	b _08085086
	.align 2, 0
_08085074: .4byte 0x0858E7A8
_08085078:
	cmp r4, #1
	bne _08085084
	ldr r0, _08085080 @ =0x0858E840
	b _08085086
	.align 2, 0
_08085080: .4byte 0x0858E840
_08085084:
	ldr r0, _08085090 @ =0x0858E980
_08085086:
	str r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085090: .4byte 0x0858E980

	thumb_func_start ProjectileMoveTumblingMissile
ProjectileMoveTumblingMissile: @ 0x08085094
	push {r4, r5, r6, lr}
	ldr r2, _080850AC @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080850B0
	strb r0, [r2]
	b _080850FC
	.align 2, 0
_080850AC: .4byte gCurrentProjectile
_080850B0:
	ldrb r3, [r2, #0x1e]
	ldr r5, _080850D4 @ =0x0858B444
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080850D8 @ =0x00007FFF
	cmp r1, r0
	bne _080850DC
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080850E4
	.align 2, 0
_080850D4: .4byte 0x0858B444
_080850D8: .4byte 0x00007FFF
_080850DC:
	adds r0, r3, #1
	strb r0, [r2, #0x1e]
	ldrh r0, [r2, #8]
	adds r0, r0, r4
_080850E4:
	strh r0, [r2, #8]
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080850F6
	ldrh r0, [r2, #0xa]
	adds r0, #4
	b _080850FA
_080850F6:
	ldrh r0, [r2, #0xa]
	subs r0, #4
_080850FA:
	strh r0, [r2, #0xa]
_080850FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileNormalMissileSubroutine
ProjectileNormalMissileSubroutine: @ 0x08085104
	push {r4, lr}
	ldr r0, _08085128 @ =gCurrentClipdataAffectingAction
	movs r1, #8
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085130
	ldr r1, _0808512C @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #8
	bl ParticleSet
	b _080851A8
	.align 2, 0
_08085128: .4byte gCurrentClipdataAffectingAction
_0808512C: .4byte gCurrentProjectile
_08085130:
	ldr r0, _08085144 @ =gCurrentProjectile
	ldrb r1, [r0, #0x12]
	adds r4, r0, #0
	cmp r1, #1
	beq _08085174
	cmp r1, #1
	bgt _08085148
	cmp r1, #0
	beq _0808514E
	b _08085186
	.align 2, 0
_08085144: .4byte gCurrentProjectile
_08085148:
	cmp r1, #7
	beq _08085180
	b _08085186
_0808514E:
	ldr r1, _08085170 @ =0x0000FFF8
	strh r1, [r4, #0x16]
	movs r0, #8
	strh r0, [r4, #0x18]
	strh r1, [r4, #0x1a]
	strh r0, [r4, #0x1c]
	movs r0, #0
	bl ProjectileMissileInit
	movs r0, #0xce
	bl SoundPlay
	movs r0, #0xcf
	bl SoundPlay
	b _080851A8
	.align 2, 0
_08085170: .4byte 0x0000FFF8
_08085174:
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #0x30
	bl ProjectileMove
	b _080851A8
_08085180:
	bl ProjectileMoveTumblingMissile
	b _080851A8
_08085186:
	ldr r0, _080851B0 @ =0x0858B40C
	ldrb r1, [r4, #0x1e]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl ProjectileMove
	ldrb r0, [r4, #0x1e]
	cmp r0, #0x1a
	bhi _080851A0
	adds r0, #1
	strb r0, [r4, #0x1e]
_080851A0:
	movs r0, #0x15
	movs r1, #7
	bl ProjectileSetMissileTrail
_080851A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080851B0: .4byte 0x0858B40C

	thumb_func_start ProjectileSuperMissileSubroutine
ProjectileSuperMissileSubroutine: @ 0x080851B4
	push {r4, lr}
	ldr r0, _080851D8 @ =gCurrentClipdataAffectingAction
	movs r1, #8
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _080851E0
	ldr r1, _080851DC @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #9
	bl ParticleSet
	b _08085258
	.align 2, 0
_080851D8: .4byte gCurrentClipdataAffectingAction
_080851DC: .4byte gCurrentProjectile
_080851E0:
	ldr r0, _080851F4 @ =gCurrentProjectile
	ldrb r1, [r0, #0x12]
	adds r4, r0, #0
	cmp r1, #1
	beq _08085224
	cmp r1, #1
	bgt _080851F8
	cmp r1, #0
	beq _080851FE
	b _08085236
	.align 2, 0
_080851F4: .4byte gCurrentProjectile
_080851F8:
	cmp r1, #7
	beq _08085230
	b _08085236
_080851FE:
	ldr r1, _08085220 @ =0x0000FFF4
	strh r1, [r4, #0x16]
	movs r0, #0xc
	strh r0, [r4, #0x18]
	strh r1, [r4, #0x1a]
	strh r0, [r4, #0x1c]
	movs r0, #0
	bl ProjectileMissileInit
	movs r0, #0xd1
	bl SoundPlay
	movs r0, #0xd2
	bl SoundPlay
	b _08085258
	.align 2, 0
_08085220: .4byte 0x0000FFF4
_08085224:
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #0x30
	bl ProjectileMove
	b _08085258
_08085230:
	bl ProjectileMoveTumblingMissile
	b _08085258
_08085236:
	ldr r0, _08085260 @ =0x0858B41A
	ldrb r1, [r4, #0x1e]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl ProjectileMove
	ldrb r0, [r4, #0x1e]
	cmp r0, #0x1a
	bhi _08085250
	adds r0, #1
	strb r0, [r4, #0x1e]
_08085250:
	movs r0, #0x16
	movs r1, #7
	bl ProjectileSetMissileTrail
_08085258:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085260: .4byte 0x0858B41A

	thumb_func_start ProjectileIceMissilesSubroutine
ProjectileIceMissilesSubroutine: @ 0x08085264
	push {r4, lr}
	ldr r0, _08085288 @ =gCurrentClipdataAffectingAction
	movs r1, #8
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085290
	ldr r1, _0808528C @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #0xa
	bl ParticleSet
	b _08085310
	.align 2, 0
_08085288: .4byte gCurrentClipdataAffectingAction
_0808528C: .4byte gCurrentProjectile
_08085290:
	ldr r0, _080852A4 @ =gCurrentProjectile
	ldrb r1, [r0, #0x12]
	adds r4, r0, #0
	cmp r1, #1
	beq _080852DC
	cmp r1, #1
	bgt _080852A8
	cmp r1, #0
	beq _080852AE
	b _080852EE
	.align 2, 0
_080852A4: .4byte gCurrentProjectile
_080852A8:
	cmp r1, #7
	beq _080852E8
	b _080852EE
_080852AE:
	ldr r0, _080852D4 @ =0x0000FFF4
	strh r0, [r4, #0x16]
	movs r0, #0xc
	strh r0, [r4, #0x18]
	ldr r0, _080852D8 @ =0x0000FFF0
	strh r0, [r4, #0x1a]
	movs r0, #0x10
	strh r0, [r4, #0x1c]
	movs r0, #1
	bl ProjectileMissileInit
	movs r0, #0xd4
	bl SoundPlay
	movs r0, #0xd5
	bl SoundPlay
	b _08085310
	.align 2, 0
_080852D4: .4byte 0x0000FFF4
_080852D8: .4byte 0x0000FFF0
_080852DC:
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #0x30
	bl ProjectileMove
	b _08085310
_080852E8:
	bl ProjectileMoveTumblingMissile
	b _08085310
_080852EE:
	ldr r0, _08085318 @ =0x0858B428
	ldrb r1, [r4, #0x1e]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl ProjectileMove
	ldrb r0, [r4, #0x1e]
	cmp r0, #0x1a
	bhi _08085308
	adds r0, #1
	strb r0, [r4, #0x1e]
_08085308:
	movs r0, #0x17
	movs r1, #3
	bl ProjectileSetMissileTrail
_08085310:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085318: .4byte 0x0858B428

	thumb_func_start ProjectileDiffusionMissileSubroutine
ProjectileDiffusionMissileSubroutine: @ 0x0808531C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r5, _08085354 @ =gCurrentProjectile
	ldrh r0, [r5, #8]
	mov r8, r0
	mov r7, r8
	ldrh r4, [r5, #0xa]
	adds r6, r4, #0
	ldr r0, _08085358 @ =gCurrentClipdataAffectingAction
	movs r1, #8
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _080853CA
	ldrb r0, [r5, #0xf]
	cmp r0, #0xe
	beq _0808535C
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0xb
	bl ParticleSet
	movs r0, #0
	strb r0, [r5]
	b _080854A4
	.align 2, 0
_08085354: .4byte gCurrentProjectile
_08085358: .4byte gCurrentClipdataAffectingAction
_0808535C:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0xc
	bl ParticleSet
	movs r4, #0
	movs r0, #3
	strb r0, [r5, #0x12]
	strb r4, [r5, #0x1e]
	ldrb r1, [r5]
	movs r0, #0xef
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r5]
	str r4, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl ProjectileInitSecondary
	str r4, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0x40
	bl ProjectileInitSecondary
	str r4, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0x80
	bl ProjectileInitSecondary
	str r4, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0xc0
	bl ProjectileInitSecondary
_080853CA:
	ldr r0, _080853E0 @ =gCurrentProjectile
	ldrb r1, [r0, #0x12]
	adds r4, r0, #0
	cmp r1, #1
	beq _08085444
	cmp r1, #1
	bgt _080853E4
	cmp r1, #0
	beq _080853EE
	b _0808546A
	.align 2, 0
_080853E0: .4byte gCurrentProjectile
_080853E4:
	cmp r1, #3
	beq _08085450
	cmp r1, #7
	beq _08085464
	b _0808546A
_080853EE:
	ldr r0, _08085420 @ =0x0000FFF4
	strh r0, [r4, #0x16]
	movs r0, #0xc
	strh r0, [r4, #0x18]
	ldr r0, _08085424 @ =0x0000FFF0
	strh r0, [r4, #0x1a]
	movs r0, #0x10
	strh r0, [r4, #0x1c]
	ldrb r0, [r4, #0xf]
	cmp r0, #0xe
	bne _08085428
	movs r0, #2
	bl ProjectileMissileInit
	movs r0, #0x19
	movs r1, #3
	bl ProjectileSetMissileTrail
	movs r0, #0xda
	bl SoundPlay
	movs r0, #0xdb
	bl SoundPlay
	b _080854A4
	.align 2, 0
_08085420: .4byte 0x0000FFF4
_08085424: .4byte 0x0000FFF0
_08085428:
	movs r0, #2
	bl ProjectileMissileInit
	movs r0, #0x18
	movs r1, #3
	bl ProjectileSetMissileTrail
	movs r0, #0xd7
	bl SoundPlay
	movs r0, #0xd8
	bl SoundPlay
	b _080854A4
_08085444:
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #0x30
	bl ProjectileMove
	b _080854A4
_08085450:
	ldrb r0, [r4, #0x1e]
	adds r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _080854A4
	movs r0, #0
	strb r0, [r4]
	b _080854A4
_08085464:
	bl ProjectileMoveTumblingMissile
	b _080854A4
_0808546A:
	ldr r0, _08085498 @ =0x0858B436
	adds r5, r4, #0
	ldrb r1, [r5, #0x1e]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl ProjectileMove
	ldrb r0, [r5, #0x1e]
	cmp r0, #0x1a
	bhi _08085486
	adds r0, #1
	strb r0, [r5, #0x1e]
_08085486:
	ldrb r0, [r4, #0xf]
	cmp r0, #0xe
	bne _0808549C
	movs r0, #0x19
	movs r1, #3
	bl ProjectileSetMissileTrail
	b _080854A4
	.align 2, 0
_08085498: .4byte 0x0858B436
_0808549C:
	movs r0, #0x18
	movs r1, #3
	bl ProjectileSetMissileTrail
_080854A4:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileDiffusionFlakeSubroutine
ProjectileDiffusionFlakeSubroutine: @ 0x080854B0
	push {r4, r5, r6, r7, lr}
	ldr r0, _080854EC @ =gCurrentProjectile
	ldrb r1, [r0, #0x1f]
	ldrb r2, [r0, #0x12]
	adds r4, r2, #0
	adds r3, r0, #0
	cmp r4, #0
	bne _080854F8
	adds r0, r2, #1
	strb r0, [r3, #0x12]
	ldrb r1, [r3]
	movs r0, #0x18
	orrs r0, r1
	movs r1, #0xfb
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	movs r2, #0
	ldr r1, _080854F0 @ =0x0000FFF0
	strh r1, [r3, #0x16]
	strh r0, [r3, #0x18]
	strh r1, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	ldr r0, _080854F4 @ =0x083EACE4
	str r0, [r3, #4]
	strb r2, [r3, #0xe]
	strh r4, [r3, #0xc]
	b _080855C2
	.align 2, 0
_080854EC: .4byte gCurrentProjectile
_080854F0: .4byte 0x0000FFF0
_080854F4: .4byte 0x083EACE4
_080854F8:
	ldr r0, _0808550C @ =gProjectileData
	lsls r1, r1, #5
	adds r5, r1, r0
	ldrb r2, [r5]
	mov ip, r0
	adds r6, r1, #0
	cmp r2, #0
	bne _08085510
	strb r2, [r3]
	b _080855C2
	.align 2, 0
_0808550C: .4byte gProjectileData
_08085510:
	ldrb r0, [r3, #0x10]
	adds r0, #2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x10]
	lsls r2, r0, #1
	ldrb r4, [r3, #0x13]
	adds r0, r4, #0
	adds r0, #8
	strb r0, [r3, #0x13]
	ldr r1, _08085548 @ =0x080A4FA4
	lsls r0, r4, #1
	adds r0, r0, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	adds r7, r1, #0
	cmp r0, #0
	bge _0808554C
	rsbs r0, r0, #0
	muls r0, r2, r0
	lsls r2, r2, #0x10
	cmp r0, #0
	bge _0808553E
	adds r0, #0xff
_0808553E:
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	ldrh r0, [r5, #8]
	subs r0, r0, r1
	b _0808555E
	.align 2, 0
_08085548: .4byte 0x080A4FA4
_0808554C:
	muls r0, r2, r0
	lsls r2, r2, #0x10
	cmp r0, #0
	bge _08085556
	adds r0, #0xff
_08085556:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #8]
	adds r0, r0, r5
_0808555E:
	strh r0, [r3, #8]
	adds r0, r4, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r4, #0
	ldrsh r1, [r0, r4]
	cmp r1, #0
	bge _0808558A
	rsbs r1, r1, #0
	asrs r0, r2, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _0808557C
	adds r0, #0xff
_0808557C:
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	mov r7, ip
	adds r0, r6, r7
	ldrh r0, [r0, #0xa]
	subs r0, r0, r1
	b _080855A0
_0808558A:
	asrs r0, r2, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _08085594
	adds r0, #0xff
_08085594:
	lsls r0, r0, #8
	mov r2, ip
	adds r1, r6, r2
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0xa]
	adds r0, r0, r1
_080855A0:
	strh r0, [r3, #0xa]
	ldr r0, _080855C8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080855B8
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #0xa]
	movs r2, #0x20
	bl ParticleSet
_080855B8:
	ldr r1, _080855CC @ =gCurrentClipdataAffectingAction
	movs r0, #8
	strb r0, [r1]
	bl ProjectileCheckHittingSolid
_080855C2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080855C8: .4byte gFrameCounter8Bit
_080855CC: .4byte gCurrentClipdataAffectingAction

	thumb_func_start ProjectileCheckSamusBombBounce
ProjectileCheckSamusBombBounce: @ 0x080855D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _0808568C @ =gSamusData
	mov sl, r0
	ldrh r4, [r0, #0x18]
	str r4, [sp, #0x10]
	ldrh r5, [r0, #0x16]
	str r5, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	bl ClipdataProcess
	movs r6, #0x80
	lsls r6, r6, #0x11
	ands r0, r6
	cmp r0, #0
	beq _0808560C
	adds r0, r4, #0
	subs r0, #0x60
	adds r1, r5, #0
	bl ClipdataProcess
	ands r0, r6
	cmp r0, #0
	bne _080856FA
_0808560C:
	ldr r0, _08085690 @ =gPreviousXPosition
	ldrh r0, [r0]
	str r0, [sp, #0x18]
	mov r1, sl
	ldrh r0, [r1, #0x26]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x2a]
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sl
	ldrh r2, [r3, #0x24]
	adds r2, r5, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r3, [r3, #0x28]
	adds r3, r5, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r4, _08085694 @ =gCurrentProjectile
	mov r8, r4
	ldrh r6, [r4, #8]
	str r6, [sp, #0x1c]
	ldrh r4, [r4, #0xa]
	mov sb, r4
	mov r4, r8
	ldrh r6, [r4, #0x16]
	ldr r4, [sp, #0x1c]
	adds r6, r4, r6
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov ip, r6
	mov r6, r8
	ldrh r5, [r6, #0x18]
	adds r5, r4, r5
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrh r4, [r6, #0x1a]
	add r4, sb
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	ldrh r4, [r6, #0x1c]
	add r4, sb
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r6, ip
	str r6, [sp]
	str r5, [sp, #4]
	str r7, [sp, #8]
	str r4, [sp, #0xc]
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _080856FA
	mov r1, sl
	ldrb r0, [r1, #1]
	cmp r0, #0x3c
	bne _0808569C
	ldr r1, _08085698 @ =gBossWork0
	movs r0, #1
	strb r0, [r1]
	b _080856FA
	.align 2, 0
_0808568C: .4byte gSamusData
_08085690: .4byte gPreviousXPosition
_08085694: .4byte gCurrentProjectile
_08085698: .4byte gBossWork0
_0808569C:
	subs r0, r4, r7
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r2, sl
	ldrb r0, [r2, #5]
	cmp r0, #0
	bne _080856FA
	bl SamusCheckDamagingPose
	cmp r0, #0
	bne _080856FA
	ldr r0, [sp, #0x10]
	subs r0, #0x20
	movs r1, #0
	ldr r3, [sp, #0x1c]
	cmp r0, r3
	ble _080856C8
	movs r1, #0x80
_080856C8:
	mov r0, sb
	adds r0, #5
	ldr r6, [sp, #0x14]
	cmp r6, r0
	bge _080856E2
	subs r0, #0xa
	cmp r6, r0
	ble _080856E2
	adds r0, r1, #0
	adds r0, #0xb
	bl SamusBombBounce
	b _080856FA
_080856E2:
	ldr r0, [sp, #0x18]
	cmp r4, r0
	blo _080856F2
	adds r0, r1, #0
	adds r0, #0xc
	bl SamusBombBounce
	b _080856FA
_080856F2:
	adds r0, r1, #0
	adds r0, #0xa
	bl SamusBombBounce
_080856FA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileBombInit
ProjectileBombInit: @ 0x0808570C
	push {lr}
	movs r0, #0xdd
	bl SoundPlay
	ldr r1, _08085750 @ =gCurrentProjectile
	ldr r0, _08085754 @ =0x0858EAE8
	str r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r3, #8
	movs r0, #8
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	ldr r2, _08085758 @ =0x0000FFE0
	strh r2, [r1, #0x16]
	movs r0, #0x1c
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0x20
	strh r0, [r1, #0x1c]
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	movs r0, #0x32
	strb r0, [r1, #0x1e]
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	pop {r0}
	bx r0
	.align 2, 0
_08085750: .4byte gCurrentProjectile
_08085754: .4byte 0x0858EAE8
_08085758: .4byte 0x0000FFE0

	thumb_func_start ProjectileBombSubroutine
ProjectileBombSubroutine: @ 0x0808575C
	push {r4, lr}
	ldr r4, _08085770 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #1
	beq _08085784
	cmp r0, #1
	bgt _08085774
	cmp r0, #0
	beq _0808577E
	b _080858DA
	.align 2, 0
_08085770: .4byte gCurrentProjectile
_08085774:
	cmp r0, #2
	beq _080857AC
	cmp r0, #3
	beq _080857D8
	b _080858DA
_0808577E:
	bl ProjectileBombInit
	b _080858DA
_08085784:
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08085794
	b _080858DA
_08085794:
	ldr r0, _080857A8 @ =0x0858EB10
	str r0, [r4, #4]
	strb r1, [r4, #0xe]
	strh r1, [r4, #0xc]
	movs r0, #0x1e
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080858DA
	.align 2, 0
_080857A8: .4byte 0x0858EB10
_080857AC:
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080857BA
	b _080858DA
_080857BA:
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	ldrb r0, [r4]
	movs r1, #0x14
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #1
	bl ParticleSet
	b _080858DA
_080857D8:
	ldrb r0, [r4, #0x1e]
	subs r1, r0, #1
	strb r1, [r4, #0x1e]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080857E8
	b _080858D8
_080857E8:
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bne _08085810
	ldr r1, _0808580C @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #8
	ldrh r1, [r4, #0xa]
	bl ClipdataProcess
	bl ProjectileCheckSamusBombBounce
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	b _080858D8
	.align 2, 0
_0808580C: .4byte gCurrentClipdataAffectingAction
_08085810:
	cmp r1, #0xe
	bne _08085824
	ldr r1, _08085820 @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, #0x38
	b _08085892
	.align 2, 0
_08085820: .4byte gCurrentClipdataAffectingAction
_08085824:
	cmp r1, #0xd
	bne _08085840
	ldr r1, _0808583C @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #8
	ldrh r1, [r4, #0xa]
	adds r1, #0x30
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_0808583C: .4byte gCurrentClipdataAffectingAction
_08085840:
	cmp r1, #0xc
	bne _0808585C
	ldr r1, _08085858 @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #8
	ldrh r1, [r4, #0xa]
	subs r1, #0x30
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_08085858: .4byte gCurrentClipdataAffectingAction
_0808585C:
	cmp r1, #0xb
	bne _08085870
	ldr r1, _0808586C @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, #0x38
	b _080858AE
	.align 2, 0
_0808586C: .4byte gCurrentClipdataAffectingAction
_08085870:
	cmp r1, #0xa
	bne _08085884
	ldr r1, _08085880 @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, #0x38
	b _080858C8
	.align 2, 0
_08085880: .4byte gCurrentClipdataAffectingAction
_08085884:
	cmp r1, #9
	bne _080858A0
	ldr r1, _0808589C @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #0x48
_08085892:
	ldrh r1, [r4, #0xa]
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_0808589C: .4byte gCurrentClipdataAffectingAction
_080858A0:
	cmp r1, #8
	bne _080858BC
	ldr r1, _080858B8 @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #0x48
_080858AE:
	ldrh r1, [r4, #0xa]
	adds r1, #0x24
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_080858B8: .4byte gCurrentClipdataAffectingAction
_080858BC:
	cmp r1, #7
	bne _080858DA
	ldr r0, _080858D4 @ =gCurrentClipdataAffectingAction
	strb r1, [r0]
	ldrh r0, [r4, #8]
	subs r0, #0x48
_080858C8:
	ldrh r1, [r4, #0xa]
	subs r1, #0x24
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_080858D4: .4byte gCurrentClipdataAffectingAction
_080858D8:
	strb r0, [r4]
_080858DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProjectilePowerBombInit
ProjectilePowerBombInit: @ 0x080858E0
	push {r4, r5, r6, lr}
	ldr r1, _08085974 @ =gEquipment
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _080858FE
	subs r0, #1
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080858FE
	ldr r0, _08085978 @ =gSamusData
	ldrb r1, [r0, #8]
	movs r2, #0x10
	eors r1, r2
	strb r1, [r0, #8]
_080858FE:
	ldr r1, _0808597C @ =gCurrentProjectile
	ldr r0, _08085980 @ =0x0858EB38
	str r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r3, #8
	movs r0, #8
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	ldr r2, _08085984 @ =0x0000FFF0
	strh r2, [r1, #0x16]
	movs r0, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	strh r0, [r1, #0x1c]
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	movs r0, #0x46
	strb r0, [r1, #0x1e]
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	movs r3, #0
	ldr r5, _08085988 @ =gSpriteData
	movs r6, #1
	movs r4, #0x7f
_0808593A:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08085956
	adds r2, #0x2c
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
_08085956:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0808593A
	movs r0, #0xdf
	bl SoundPlay
	ldr r1, _0808598C @ =gCurrentPowerBomb
	movs r0, #1
	strb r0, [r1, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085974: .4byte gEquipment
_08085978: .4byte gSamusData
_0808597C: .4byte gCurrentProjectile
_08085980: .4byte 0x0858EB38
_08085984: .4byte 0x0000FFF0
_08085988: .4byte gSpriteData
_0808598C: .4byte gCurrentPowerBomb

	thumb_func_start ProjectilePowerBombSubroutine
ProjectilePowerBombSubroutine: @ 0x08085990
	push {r4, r5, lr}
	ldr r4, _080859A4 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #1
	beq _080859B4
	cmp r0, #1
	bgt _080859A8
	cmp r0, #0
	beq _080859AE
	b _08085A00
	.align 2, 0
_080859A4: .4byte gCurrentProjectile
_080859A8:
	cmp r0, #2
	beq _080859DC
	b _08085A00
_080859AE:
	bl ProjectilePowerBombInit
	b _08085A00
_080859B4:
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08085A00
	ldr r0, _080859D8 @ =0x0858EB58
	str r0, [r4, #4]
	strb r1, [r4, #0xe]
	strh r1, [r4, #0xc]
	movs r0, #0x46
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _08085A00
	.align 2, 0
_080859D8: .4byte 0x0858EB58
_080859DC:
	ldr r0, _08085A08 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08085A00
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08085A00
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r2, #0
	bl PowerBombExplosionStart
	strb r5, [r4]
_08085A00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085A08: .4byte gSubGameMode1

	thumb_func_start ProjectileChargedChargeBeamInit
ProjectileChargedChargeBeamInit: @ 0x08085A0C
	push {r4, lr}
	ldr r0, _08085A4C @ =gCurrentProjectile
	movs r1, #0
	strb r1, [r0, #0xe]
	strh r1, [r0, #0xc]
	movs r1, #0x10
	strb r1, [r0, #0x14]
	strb r1, [r0, #0x15]
	ldr r2, _08085A50 @ =0x0000FFF4
	strh r2, [r0, #0x16]
	movs r1, #0xc
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrb r1, [r0, #0x13]
	adds r4, r0, #0
	cmp r1, #0
	beq _08085AA0
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085A94
	lsls r0, r0, #2
	ldr r1, _08085A54 @ =_08085A58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085A4C: .4byte gCurrentProjectile
_08085A50: .4byte 0x0000FFF4
_08085A54: .4byte _08085A58
_08085A58: @ jump table
	.4byte _08085A94 @ case 0
	.4byte _08085A74 @ case 1
	.4byte _08085A6C @ case 2
	.4byte _08085A88 @ case 3
	.4byte _08085A80 @ case 4
_08085A6C:
	ldrb r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4]
_08085A74:
	ldr r0, _08085A7C @ =0x0858DA60
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085A7C: .4byte 0x0858DA60
_08085A80:
	ldrb r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4]
_08085A88:
	ldr r0, _08085A90 @ =0x0858DA70
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085A90: .4byte 0x0858DA70
_08085A94:
	ldr r0, _08085A9C @ =0x0858DA50
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085A9C: .4byte 0x0858DA50
_08085AA0:
	movs r0, #0xed
	bl SoundPlay
	ldrb r0, [r4]
	movs r1, #0xfb
	ands r1, r0
	strb r1, [r4]
	ldrb r0, [r4, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085B10
	lsls r0, r0, #2
	ldr r1, _08085AC0 @ =_08085AC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085AC0: .4byte _08085AC4
_08085AC4: @ jump table
	.4byte _08085B10 @ case 0
	.4byte _08085AE4 @ case 1
	.4byte _08085AD8 @ case 2
	.4byte _08085B00 @ case 3
	.4byte _08085AF4 @ case 4
_08085AD8:
	ldr r0, _08085AEC @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r4, r0, #0
_08085AE4:
	ldr r0, _08085AF0 @ =0x0858DA20
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085AEC: .4byte gCurrentProjectile
_08085AF0: .4byte 0x0858DA20
_08085AF4:
	ldr r0, _08085B08 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r4, r0, #0
_08085B00:
	ldr r0, _08085B0C @ =0x0858DA38
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085B08: .4byte gCurrentProjectile
_08085B0C: .4byte 0x0858DA38
_08085B10:
	ldr r1, _08085B1C @ =gCurrentProjectile
	ldr r0, _08085B20 @ =0x0858DA08
	str r0, [r1, #4]
_08085B16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085B1C: .4byte gCurrentProjectile
_08085B20: .4byte 0x0858DA08

	thumb_func_start ProjectileChargedChargeBeamSubroutine
ProjectileChargedChargeBeamSubroutine: @ 0x08085B24
	push {r4, lr}
	ldr r2, _08085B8C @ =gCurrentProjectile
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	beq _08085BA4
	ldrb r3, [r2]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08085B4C
	ldr r0, _08085B90 @ =gProjectileData
	ldrb r1, [r2, #0x1f]
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bls _08085B4C
	movs r0, #0xfb
	ands r0, r3
	strb r0, [r2]
_08085B4C:
	ldr r0, _08085B94 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085B98
	ldr r2, _08085B8C @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _08085B7A
	ldr r0, _08085B90 @ =gProjectileData
	ldrb r1, [r4, #0x1f]
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bhi _08085B7A
	strb r3, [r1, #0x12]
_08085B7A:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #4
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
	b _08085C24
	.align 2, 0
_08085B8C: .4byte gCurrentProjectile
_08085B90: .4byte gProjectileData
_08085B94: .4byte gCurrentClipdataAffectingAction
_08085B98:
	ldr r0, _08085BB8 @ =gCurrentProjectile
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bhi _08085BA4
	bl ProjectileMovePart
_08085BA4:
	ldr r1, _08085BB8 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	cmp r0, #4
	bhi _08085C18
	lsls r0, r0, #2
	ldr r1, _08085BBC @ =_08085BC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085BB8: .4byte gCurrentProjectile
_08085BBC: .4byte _08085BC0
_08085BC0: @ jump table
	.4byte _08085BD4 @ case 0
	.4byte _08085BDA @ case 1
	.4byte _08085BE2 @ case 2
	.4byte _08085BEA @ case 3
	.4byte _08085C08 @ case 4
_08085BD4:
	bl ProjectileChargedChargeBeamInit
	b _08085C08
_08085BDA:
	movs r0, #0x10
	bl ProjectileMove
	b _08085C08
_08085BE2:
	ldr r1, _08085C04 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
_08085BEA:
	movs r0, #0x18
	bl ProjectileMove
	ldr r0, _08085C04 @ =gCurrentProjectile
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	bne _08085C1C
	movs r0, #0x10
	movs r1, #3
	bl ProjectileSetBeamTrail
	b _08085C1C
	.align 2, 0
_08085C04: .4byte gCurrentProjectile
_08085C08:
	ldr r1, _08085C14 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	b _08085C1C
	.align 2, 0
_08085C14: .4byte gCurrentProjectile
_08085C18:
	movs r0, #0
	strb r0, [r1]
_08085C1C:
	ldr r1, _08085C2C @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08085C24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085C2C: .4byte gCurrentProjectile

	thumb_func_start ProjectileChargeBeamInit
ProjectileChargeBeamInit: @ 0x08085C30
	push {r4, lr}
	ldr r0, _08085C70 @ =gCurrentProjectile
	movs r1, #0
	strb r1, [r0, #0xe]
	strh r1, [r0, #0xc]
	movs r1, #0x10
	strb r1, [r0, #0x14]
	strb r1, [r0, #0x15]
	ldr r2, _08085C74 @ =0x0000FFF4
	strh r2, [r0, #0x16]
	movs r1, #0xc
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrb r1, [r0, #0x13]
	adds r4, r0, #0
	cmp r1, #0
	beq _08085CC4
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085CB8
	lsls r0, r0, #2
	ldr r1, _08085C78 @ =_08085C7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085C70: .4byte gCurrentProjectile
_08085C74: .4byte 0x0000FFF4
_08085C78: .4byte _08085C7C
_08085C7C: @ jump table
	.4byte _08085CB8 @ case 0
	.4byte _08085C98 @ case 1
	.4byte _08085C90 @ case 2
	.4byte _08085CAC @ case 3
	.4byte _08085CA4 @ case 4
_08085C90:
	ldrb r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4]
_08085C98:
	ldr r0, _08085CA0 @ =0x0858D9E8
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085CA0: .4byte 0x0858D9E8
_08085CA4:
	ldrb r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4]
_08085CAC:
	ldr r0, _08085CB4 @ =0x0858D9F8
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085CB4: .4byte 0x0858D9F8
_08085CB8:
	ldr r0, _08085CC0 @ =0x0858D9D8
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085CC0: .4byte 0x0858D9D8
_08085CC4:
	movs r0, #0xca
	bl SoundPlay
	ldrb r0, [r4]
	movs r1, #0xfb
	ands r1, r0
	strb r1, [r4]
	ldrb r0, [r4, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085D34
	lsls r0, r0, #2
	ldr r1, _08085CE4 @ =_08085CE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085CE4: .4byte _08085CE8
_08085CE8: @ jump table
	.4byte _08085D34 @ case 0
	.4byte _08085D08 @ case 1
	.4byte _08085CFC @ case 2
	.4byte _08085D24 @ case 3
	.4byte _08085D18 @ case 4
_08085CFC:
	ldr r0, _08085D10 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r4, r0, #0
_08085D08:
	ldr r0, _08085D14 @ =0x0858D9A8
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085D10: .4byte gCurrentProjectile
_08085D14: .4byte 0x0858D9A8
_08085D18:
	ldr r0, _08085D2C @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r4, r0, #0
_08085D24:
	ldr r0, _08085D30 @ =0x0858D9C0
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085D2C: .4byte gCurrentProjectile
_08085D30: .4byte 0x0858D9C0
_08085D34:
	ldr r1, _08085D40 @ =gCurrentProjectile
	ldr r0, _08085D44 @ =0x0858D990
	str r0, [r1, #4]
_08085D3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085D40: .4byte gCurrentProjectile
_08085D44: .4byte 0x0858D990

	thumb_func_start ProjectileChargeBeamSubroutine
ProjectileChargeBeamSubroutine: @ 0x08085D48
	push {r4, lr}
	ldr r2, _08085DB0 @ =gCurrentProjectile
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	beq _08085DC8
	ldrb r3, [r2]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08085D70
	ldr r0, _08085DB4 @ =gProjectileData
	ldrb r1, [r2, #0x1f]
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bls _08085D70
	movs r0, #0xfb
	ands r0, r3
	strb r0, [r2]
_08085D70:
	ldr r0, _08085DB8 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085DBC
	ldr r2, _08085DB0 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _08085D9E
	ldr r0, _08085DB4 @ =gProjectileData
	ldrb r1, [r4, #0x1f]
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bhi _08085D9E
	strb r3, [r1, #0x12]
_08085D9E:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #4
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
	b _08085E38
	.align 2, 0
_08085DB0: .4byte gCurrentProjectile
_08085DB4: .4byte gProjectileData
_08085DB8: .4byte gCurrentClipdataAffectingAction
_08085DBC:
	ldr r0, _08085DDC @ =gCurrentProjectile
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bhi _08085DC8
	bl ProjectileMovePart
_08085DC8:
	ldr r1, _08085DDC @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	cmp r0, #4
	bhi _08085E2C
	lsls r0, r0, #2
	ldr r1, _08085DE0 @ =_08085DE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085DDC: .4byte gCurrentProjectile
_08085DE0: .4byte _08085DE4
_08085DE4: @ jump table
	.4byte _08085DF8 @ case 0
	.4byte _08085DFE @ case 1
	.4byte _08085E06 @ case 2
	.4byte _08085E0E @ case 3
	.4byte _08085E1C @ case 4
_08085DF8:
	bl ProjectileChargeBeamInit
	b _08085E1C
_08085DFE:
	movs r0, #0x10
	bl ProjectileMove
	b _08085E1C
_08085E06:
	ldr r1, _08085E18 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
_08085E0E:
	movs r0, #0x18
	bl ProjectileMove
	b _08085E30
	.align 2, 0
_08085E18: .4byte gCurrentProjectile
_08085E1C:
	ldr r1, _08085E28 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	b _08085E30
	.align 2, 0
_08085E28: .4byte gCurrentProjectile
_08085E2C:
	movs r0, #0
	strb r0, [r1]
_08085E30:
	ldr r1, _08085E40 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08085E38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085E40: .4byte gCurrentProjectile

	thumb_func_start ProjectileChargedWideBeaminit
ProjectileChargedWideBeaminit: @ 0x08085E44
	push {lr}
	movs r0, #0xee
	bl SoundPlay
	ldr r3, _08085E88 @ =gCurrentProjectile
	ldrb r2, [r3]
	movs r1, #0x10
	movs r0, #0
	orrs r1, r2
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r2, _08085E8C @ =0x0000FFEC
	strh r2, [r3, #0x16]
	movs r0, #0x14
	strh r0, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085EEC
	lsls r0, r0, #2
	ldr r1, _08085E90 @ =_08085E94
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, r3, #0
	mov pc, r0
	.align 2, 0
_08085E88: .4byte gCurrentProjectile
_08085E8C: .4byte 0x0000FFEC
_08085E90: .4byte _08085E94
_08085E94: @ jump table
	.4byte _08085EEC @ case 0
	.4byte _08085EC0 @ case 1
	.4byte _08085EA8 @ case 2
	.4byte _08085EDC @ case 3
	.4byte _08085ED0 @ case 4
_08085EA8:
	ldr r1, _08085EB8 @ =gCurrentProjectile
	ldrb r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08085EBC @ =0x0858DC54
	b _08085EF0
	.align 2, 0
_08085EB8: .4byte gCurrentProjectile
_08085EBC: .4byte 0x0858DC54
_08085EC0:
	ldr r1, _08085EC8 @ =gCurrentProjectile
	ldr r0, _08085ECC @ =0x0858DC54
	b _08085EF0
	.align 2, 0
_08085EC8: .4byte gCurrentProjectile
_08085ECC: .4byte 0x0858DC54
_08085ED0:
	ldr r0, _08085EE4 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_08085EDC:
	ldr r0, _08085EE8 @ =0x0858DC6C
	str r0, [r2, #4]
	b _08085EF2
	.align 2, 0
_08085EE4: .4byte gCurrentProjectile
_08085EE8: .4byte 0x0858DC6C
_08085EEC:
	ldr r1, _08085EF8 @ =gCurrentProjectile
	ldr r0, _08085EFC @ =0x0858DC3C
_08085EF0:
	str r0, [r1, #4]
_08085EF2:
	pop {r0}
	bx r0
	.align 2, 0
_08085EF8: .4byte gCurrentProjectile
_08085EFC: .4byte 0x0858DC3C

	thumb_func_start ProjectileChargedWideBeamSubroutine
ProjectileChargedWideBeamSubroutine: @ 0x08085F00
	push {r4, lr}
	ldr r1, _08085F34 @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _08085F14
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bhi _08085F14
	bl ProjectileMovePart
_08085F14:
	ldr r0, _08085F38 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085F3C
	ldr r1, _08085F34 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #5
	bl ParticleSet
	b _08085F82
	.align 2, 0
_08085F34: .4byte gCurrentProjectile
_08085F38: .4byte gCurrentClipdataAffectingAction
_08085F3C:
	ldr r4, _08085F54 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08085F58
	cmp r0, #1
	beq _08085F5E
	cmp r0, #8
	bhi _08085F6C
	adds r0, #1
	strb r0, [r4, #0x12]
	b _08085F6C
	.align 2, 0
_08085F54: .4byte gCurrentProjectile
_08085F58:
	bl ProjectileChargedWideBeaminit
	b _08085F64
_08085F5E:
	movs r0, #0x10
	bl ProjectileMove
_08085F64:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _08085F7A
_08085F6C:
	movs r0, #0x18
	bl ProjectileMove
	movs r0, #0x11
	movs r1, #3
	bl ProjectileSetBeamTrail
_08085F7A:
	ldr r1, _08085F88 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08085F82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085F88: .4byte gCurrentProjectile

	thumb_func_start ProjectileWideBeamInit
ProjectileWideBeamInit: @ 0x08085F8C
	push {lr}
	movs r0, #0xc9
	bl SoundPlay
	ldr r3, _08085FCC @ =gCurrentProjectile
	ldrb r1, [r3]
	movs r2, #0x10
	movs r0, #0
	orrs r2, r1
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r1, _08085FD0 @ =0x0000FFF0
	strh r1, [r3, #0x16]
	strh r0, [r3, #0x18]
	strh r1, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r2, r0
	strb r2, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _0808602C
	lsls r0, r0, #2
	ldr r1, _08085FD4 @ =_08085FD8
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	mov pc, r0
	.align 2, 0
_08085FCC: .4byte gCurrentProjectile
_08085FD0: .4byte 0x0000FFF0
_08085FD4: .4byte _08085FD8
_08085FD8: @ jump table
	.4byte _0808602C @ case 0
	.4byte _08086004 @ case 1
	.4byte _08085FEC @ case 2
	.4byte _08086020 @ case 3
	.4byte _08086014 @ case 4
_08085FEC:
	ldr r1, _08085FFC @ =gCurrentProjectile
	ldrb r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08086000 @ =0x0858DBFC
	b _08086030
	.align 2, 0
_08085FFC: .4byte gCurrentProjectile
_08086000: .4byte 0x0858DBFC
_08086004:
	ldr r1, _0808600C @ =gCurrentProjectile
	ldr r0, _08086010 @ =0x0858DBFC
	b _08086030
	.align 2, 0
_0808600C: .4byte gCurrentProjectile
_08086010: .4byte 0x0858DBFC
_08086014:
	ldr r0, _08086024 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r1, r0, #0
_08086020:
	ldr r0, _08086028 @ =0x0858DC1C
	b _08086030
	.align 2, 0
_08086024: .4byte gCurrentProjectile
_08086028: .4byte 0x0858DC1C
_0808602C:
	ldr r1, _08086038 @ =gCurrentProjectile
	ldr r0, _0808603C @ =0x0858DBDC
_08086030:
	str r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08086038: .4byte gCurrentProjectile
_0808603C: .4byte 0x0858DBDC

	thumb_func_start ProjectileWideBeamSubroutine
ProjectileWideBeamSubroutine: @ 0x08086040
	push {r4, lr}
	ldr r1, _08086074 @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _08086054
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bhi _08086054
	bl ProjectileMovePart
_08086054:
	ldr r0, _08086078 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _0808607C
	ldr r1, _08086074 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #5
	bl ParticleSet
	b _080860BA
	.align 2, 0
_08086074: .4byte gCurrentProjectile
_08086078: .4byte gCurrentClipdataAffectingAction
_0808607C:
	ldr r4, _08086094 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08086098
	cmp r0, #1
	beq _0808609E
	cmp r0, #8
	bhi _080860AC
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080860AC
	.align 2, 0
_08086094: .4byte gCurrentProjectile
_08086098:
	bl ProjectileWideBeamInit
	b _080860A4
_0808609E:
	movs r0, #0x10
	bl ProjectileMove
_080860A4:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080860B2
_080860AC:
	movs r0, #0x18
	bl ProjectileMove
_080860B2:
	ldr r1, _080860C0 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_080860BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080860C0: .4byte gCurrentProjectile

	thumb_func_start ProjectileChargedPlasmaBeamInit
ProjectileChargedPlasmaBeamInit: @ 0x080860C4
	push {lr}
	movs r0, #0xef
	bl SoundPlay
	ldr r3, _0808610C @ =gCurrentProjectile
	ldrb r2, [r3]
	movs r1, #0x10
	movs r0, #0
	orrs r1, r2
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r2, _08086110 @ =0x0000FFEC
	strh r2, [r3, #0x16]
	movs r0, #0x14
	strh r0, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3]
	ldrb r0, [r3, #0x12]
	adds r0, #1
	strb r0, [r3, #0x12]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08086170
	lsls r0, r0, #2
	ldr r1, _08086114 @ =_08086118
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, r3, #0
	mov pc, r0
	.align 2, 0
_0808610C: .4byte gCurrentProjectile
_08086110: .4byte 0x0000FFEC
_08086114: .4byte _08086118
_08086118: @ jump table
	.4byte _08086170 @ case 0
	.4byte _08086144 @ case 1
	.4byte _0808612C @ case 2
	.4byte _08086160 @ case 3
	.4byte _08086154 @ case 4
_0808612C:
	ldr r1, _0808613C @ =gCurrentProjectile
	ldrb r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08086140 @ =0x0858DE54
	b _08086174
	.align 2, 0
_0808613C: .4byte gCurrentProjectile
_08086140: .4byte 0x0858DE54
_08086144:
	ldr r1, _0808614C @ =gCurrentProjectile
	ldr r0, _08086150 @ =0x0858DE54
	b _08086174
	.align 2, 0
_0808614C: .4byte gCurrentProjectile
_08086150: .4byte 0x0858DE54
_08086154:
	ldr r0, _08086168 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_08086160:
	ldr r0, _0808616C @ =0x0858DE6C
	str r0, [r2, #4]
	b _08086176
	.align 2, 0
_08086168: .4byte gCurrentProjectile
_0808616C: .4byte 0x0858DE6C
_08086170:
	ldr r1, _0808617C @ =gCurrentProjectile
	ldr r0, _08086180 @ =0x0858DE3C
_08086174:
	str r0, [r1, #4]
_08086176:
	pop {r0}
	bx r0
	.align 2, 0
_0808617C: .4byte gCurrentProjectile
_08086180: .4byte 0x0858DE3C

	thumb_func_start ProjectileChargedPlasmaBeamSubroutine
ProjectileChargedPlasmaBeamSubroutine: @ 0x08086184
	push {r4, lr}
	ldr r1, _080861B8 @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _08086198
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bhi _08086198
	bl ProjectileMovePart
_08086198:
	ldr r0, _080861BC @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _080861C0
	ldr r1, _080861B8 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #6
	bl ParticleSet
	b _08086206
	.align 2, 0
_080861B8: .4byte gCurrentProjectile
_080861BC: .4byte gCurrentClipdataAffectingAction
_080861C0:
	ldr r4, _080861D8 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080861DC
	cmp r0, #1
	beq _080861E2
	cmp r0, #8
	bhi _080861F0
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080861F0
	.align 2, 0
_080861D8: .4byte gCurrentProjectile
_080861DC:
	bl ProjectileChargedPlasmaBeamInit
	b _080861E8
_080861E2:
	movs r0, #0x10
	bl ProjectileMove
_080861E8:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080861FE
_080861F0:
	movs r0, #0x1c
	bl ProjectileMove
	movs r0, #0x12
	movs r1, #3
	bl ProjectileSetBeamTrail
_080861FE:
	ldr r1, _0808620C @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08086206:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808620C: .4byte gCurrentProjectile

	thumb_func_start ProjectilePlasmaBeamInit
ProjectilePlasmaBeamInit: @ 0x08086210
	push {lr}
	movs r0, #0xcb
	bl SoundPlay
	ldr r3, _08086254 @ =gCurrentProjectile
	ldrb r2, [r3]
	movs r1, #0x10
	movs r0, #0
	orrs r1, r2
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r2, _08086258 @ =0x0000FFF4
	strh r2, [r3, #0x16]
	movs r0, #0xc
	strh r0, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _080862B8
	lsls r0, r0, #2
	ldr r1, _0808625C @ =_08086260
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, r3, #0
	mov pc, r0
	.align 2, 0
_08086254: .4byte gCurrentProjectile
_08086258: .4byte 0x0000FFF4
_0808625C: .4byte _08086260
_08086260: @ jump table
	.4byte _080862B8 @ case 0
	.4byte _0808628C @ case 1
	.4byte _08086274 @ case 2
	.4byte _080862A8 @ case 3
	.4byte _0808629C @ case 4
_08086274:
	ldr r1, _08086284 @ =gCurrentProjectile
	ldrb r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08086288 @ =0x0858DE0C
	b _080862BC
	.align 2, 0
_08086284: .4byte gCurrentProjectile
_08086288: .4byte 0x0858DE0C
_0808628C:
	ldr r1, _08086294 @ =gCurrentProjectile
	ldr r0, _08086298 @ =0x0858DE0C
	b _080862BC
	.align 2, 0
_08086294: .4byte gCurrentProjectile
_08086298: .4byte 0x0858DE0C
_0808629C:
	ldr r0, _080862B0 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_080862A8:
	ldr r0, _080862B4 @ =0x0858DE24
	str r0, [r2, #4]
	b _080862BE
	.align 2, 0
_080862B0: .4byte gCurrentProjectile
_080862B4: .4byte 0x0858DE24
_080862B8:
	ldr r1, _080862C4 @ =gCurrentProjectile
	ldr r0, _080862C8 @ =0x0858DDF4
_080862BC:
	str r0, [r1, #4]
_080862BE:
	pop {r0}
	bx r0
	.align 2, 0
_080862C4: .4byte gCurrentProjectile
_080862C8: .4byte 0x0858DDF4

	thumb_func_start ProjectilePlasmaBeamSubroutine
ProjectilePlasmaBeamSubroutine: @ 0x080862CC
	push {r4, lr}
	ldr r1, _08086300 @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _080862E0
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bhi _080862E0
	bl ProjectileMovePart
_080862E0:
	ldr r0, _08086304 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08086308
	ldr r1, _08086300 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #6
	bl ParticleSet
	b _08086346
	.align 2, 0
_08086300: .4byte gCurrentProjectile
_08086304: .4byte gCurrentClipdataAffectingAction
_08086308:
	ldr r4, _08086320 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08086324
	cmp r0, #1
	beq _0808632A
	cmp r0, #8
	bhi _08086338
	adds r0, #1
	strb r0, [r4, #0x12]
	b _08086338
	.align 2, 0
_08086320: .4byte gCurrentProjectile
_08086324:
	bl ProjectilePlasmaBeamInit
	b _08086330
_0808632A:
	movs r0, #0x10
	bl ProjectileMove
_08086330:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _0808633E
_08086338:
	movs r0, #0x1c
	bl ProjectileMove
_0808633E:
	ldr r1, _0808634C @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08086346:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808634C: .4byte gCurrentProjectile

	thumb_func_start ProjectileChargedWaveBeamInit
ProjectileChargedWaveBeamInit: @ 0x08086350
	push {r4, lr}
	ldr r0, _08086370 @ =gEquipment
	ldrb r4, [r0, #0xa]
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0808637C
	movs r0, #0xf1
	bl SoundPlay
	ldr r0, _08086374 @ =gCurrentProjectile
	ldr r2, _08086378 @ =0x0000FFF4
	strh r2, [r0, #0x16]
	movs r1, #0xc
	b _0808638A
	.align 2, 0
_08086370: .4byte gEquipment
_08086374: .4byte gCurrentProjectile
_08086378: .4byte 0x0000FFF4
_0808637C:
	movs r0, #0xf0
	bl SoundPlay
	ldr r0, _080863C0 @ =gCurrentProjectile
	ldr r2, _080863C4 @ =0x0000FFEC
	strh r2, [r0, #0x16]
	movs r1, #0x14
_0808638A:
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldr r1, _080863C0 @ =gCurrentProjectile
	ldrb r3, [r1]
	movs r2, #0x18
	movs r0, #0
	orrs r2, r3
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r0, #0x10
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	movs r0, #0xfb
	ands r2, r0
	strb r2, [r1]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _08086438
	lsls r0, r0, #2
	ldr r1, _080863C8 @ =_080863CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080863C0: .4byte gCurrentProjectile
_080863C4: .4byte 0x0000FFEC
_080863C8: .4byte _080863CC
_080863CC: @ jump table
	.4byte _08086438 @ case 0
	.4byte _08086400 @ case 1
	.4byte _080863E0 @ case 2
	.4byte _08086420 @ case 3
	.4byte _08086418 @ case 4
_080863E0:
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r1, r0
	strb r1, [r2]
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _080863F8
	ldr r0, _080863F4 @ =0x0858E218
	b _0808644A
	.align 2, 0
_080863F4: .4byte 0x0858E218
_080863F8:
	ldr r0, _080863FC @ =0x0858DFAC
	b _0808644A
	.align 2, 0
_080863FC: .4byte 0x0858DFAC
_08086400:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _08086410
	ldr r0, _0808640C @ =0x0858E218
	b _0808644A
	.align 2, 0
_0808640C: .4byte 0x0858E218
_08086410:
	ldr r0, _08086414 @ =0x0858DFAC
	b _0808644A
	.align 2, 0
_08086414: .4byte 0x0858DFAC
_08086418:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08086420:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _08086430
	ldr r0, _0808642C @ =0x0858E228
	b _0808644A
	.align 2, 0
_0808642C: .4byte 0x0858E228
_08086430:
	ldr r0, _08086434 @ =0x0858DFC4
	b _0808644A
	.align 2, 0
_08086434: .4byte 0x0858DFC4
_08086438:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _08086448
	ldr r0, _08086444 @ =0x0858E208
	b _0808644A
	.align 2, 0
_08086444: .4byte 0x0858E208
_08086448:
	ldr r0, _08086454 @ =0x0858DF94
_0808644A:
	str r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086454: .4byte 0x0858DF94

	thumb_func_start ProjectileChargedWaveBeamSubroutine
ProjectileChargedWaveBeamSubroutine: @ 0x08086458
	push {r4, lr}
	ldr r4, _08086498 @ =gCurrentProjectile
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _08086466
	bl ProjectileMoveWaveBeamParts
_08086466:
	ldr r1, _0808649C @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	bl ProjectileCheckHittingSolid
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080864A4
	cmp r0, #1
	beq _080864AA
	movs r0, #0x1c
	bl ProjectileMove
	ldr r0, _080864A0 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080864B8
	movs r0, #0x14
	movs r1, #3
	bl ProjectileSetBeamTrail
	b _080864C0
	.align 2, 0
_08086498: .4byte gCurrentProjectile
_0808649C: .4byte gCurrentClipdataAffectingAction
_080864A0: .4byte gEquipment
_080864A4:
	bl ProjectileChargedWaveBeamInit
	b _080864B0
_080864AA:
	movs r0, #0x10
	bl ProjectileMove
_080864B0:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080864C0
_080864B8:
	movs r0, #0x13
	movs r1, #3
	bl ProjectileSetBeamTrail
_080864C0:
	ldr r1, _080864D0 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080864D0: .4byte gCurrentProjectile

	thumb_func_start ProjectileWaveBeamInit
ProjectileWaveBeamInit: @ 0x080864D4
	push {r4, lr}
	ldr r0, _080864F4 @ =gEquipment
	ldrb r4, [r0, #0xa]
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _08086500
	movs r0, #0xcd
	bl SoundPlay
	ldr r0, _080864F8 @ =gCurrentProjectile
	ldr r2, _080864FC @ =0x0000FFF4
	strh r2, [r0, #0x16]
	movs r1, #0xc
	b _0808650E
	.align 2, 0
_080864F4: .4byte gEquipment
_080864F8: .4byte gCurrentProjectile
_080864FC: .4byte 0x0000FFF4
_08086500:
	movs r0, #0xcc
	bl SoundPlay
	ldr r0, _08086544 @ =gCurrentProjectile
	ldr r2, _08086548 @ =0x0000FFEC
	strh r2, [r0, #0x16]
	movs r1, #0x14
_0808650E:
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldr r1, _08086544 @ =gCurrentProjectile
	ldrb r3, [r1]
	movs r2, #0x18
	movs r0, #0
	orrs r2, r3
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r0, #0x10
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	movs r0, #0xfb
	ands r2, r0
	strb r2, [r1]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _080865BC
	lsls r0, r0, #2
	ldr r1, _0808654C @ =_08086550
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086544: .4byte gCurrentProjectile
_08086548: .4byte 0x0000FFEC
_0808654C: .4byte _08086550
_08086550: @ jump table
	.4byte _080865BC @ case 0
	.4byte _08086584 @ case 1
	.4byte _08086564 @ case 2
	.4byte _080865A4 @ case 3
	.4byte _0808659C @ case 4
_08086564:
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r1, r0
	strb r1, [r2]
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _0808657C
	ldr r0, _08086578 @ =0x0858E1E8
	b _080865CE
	.align 2, 0
_08086578: .4byte 0x0858E1E8
_0808657C:
	ldr r0, _08086580 @ =0x0858DF74
	b _080865CE
	.align 2, 0
_08086580: .4byte 0x0858DF74
_08086584:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _08086594
	ldr r0, _08086590 @ =0x0858E1E8
	b _080865CE
	.align 2, 0
_08086590: .4byte 0x0858E1E8
_08086594:
	ldr r0, _08086598 @ =0x0858DF74
	b _080865CE
	.align 2, 0
_08086598: .4byte 0x0858DF74
_0808659C:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_080865A4:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _080865B4
	ldr r0, _080865B0 @ =0x0858E1F8
	b _080865CE
	.align 2, 0
_080865B0: .4byte 0x0858E1F8
_080865B4:
	ldr r0, _080865B8 @ =0x0858DF84
	b _080865CE
	.align 2, 0
_080865B8: .4byte 0x0858DF84
_080865BC:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _080865CC
	ldr r0, _080865C8 @ =0x0858E1D8
	b _080865CE
	.align 2, 0
_080865C8: .4byte 0x0858E1D8
_080865CC:
	ldr r0, _080865D8 @ =0x0858DF64
_080865CE:
	str r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080865D8: .4byte 0x0858DF64

	thumb_func_start ProjectileWaveBeamSubroutine
ProjectileWaveBeamSubroutine: @ 0x080865DC
	push {r4, lr}
	ldr r4, _0808661C @ =gCurrentProjectile
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _080865EA
	bl ProjectileMoveWaveBeamParts
_080865EA:
	ldr r1, _08086620 @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	bl ProjectileCheckHittingSolid
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08086628
	cmp r0, #1
	beq _0808662E
	movs r0, #0x1c
	bl ProjectileMove
	ldr r0, _08086624 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808663A
	movs r0, #0xe
	movs r1, #3
	bl ProjectileSetBeamTrail
	b _0808663A
	.align 2, 0
_0808661C: .4byte gCurrentProjectile
_08086620: .4byte gCurrentClipdataAffectingAction
_08086624: .4byte gEquipment
_08086628:
	bl ProjectileWaveBeamInit
	b _08086634
_0808662E:
	movs r0, #0x10
	bl ProjectileMove
_08086634:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
_0808663A:
	ldr r1, _08086648 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086648: .4byte gCurrentProjectile

	thumb_func_start ProjectileFlareLoadGraphics
ProjectileFlareLoadGraphics: @ 0x0808664C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08086668 @ =gCurrentProjectile
	ldrb r0, [r0, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _080866DC
	lsls r0, r0, #2
	ldr r1, _0808666C @ =_08086670
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086668: .4byte gCurrentProjectile
_0808666C: .4byte _08086670
_08086670: @ jump table
	.4byte _080866DC @ case 0
	.4byte _08086684 @ case 1
	.4byte _08086684 @ case 2
	.4byte _080866B0 @ case 3
	.4byte _080866B0 @ case 4
_08086684:
	ldr r1, _0808669C @ =0x040000D4
	lsls r2, r2, #8
	ldr r0, _080866A0 @ =0x0858F578
	adds r0, r2, r0
	str r0, [r1]
	ldr r0, _080866A4 @ =0x06011280
	str r0, [r1, #4]
	ldr r3, _080866A8 @ =0x80000080
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080866AC @ =0x0858FA78
	b _080866F2
	.align 2, 0
_0808669C: .4byte 0x040000D4
_080866A0: .4byte 0x0858F578
_080866A4: .4byte 0x06011280
_080866A8: .4byte 0x80000080
_080866AC: .4byte 0x0858FA78
_080866B0:
	ldr r1, _080866C8 @ =0x040000D4
	lsls r2, r2, #8
	ldr r0, _080866CC @ =0x0858FF78
	adds r0, r2, r0
	str r0, [r1]
	ldr r0, _080866D0 @ =0x06011280
	str r0, [r1, #4]
	ldr r3, _080866D4 @ =0x80000080
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080866D8 @ =0x08590478
	b _080866F2
	.align 2, 0
_080866C8: .4byte 0x040000D4
_080866CC: .4byte 0x0858FF78
_080866D0: .4byte 0x06011280
_080866D4: .4byte 0x80000080
_080866D8: .4byte 0x08590478
_080866DC:
	ldr r1, _08086704 @ =0x040000D4
	lsls r2, r2, #8
	ldr r0, _08086708 @ =0x0858EB78
	adds r0, r2, r0
	str r0, [r1]
	ldr r0, _0808670C @ =0x06011280
	str r0, [r1, #4]
	ldr r3, _08086710 @ =0x80000080
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08086714 @ =0x0858F078
_080866F2:
	adds r2, r2, r0
	str r2, [r1]
	ldr r0, _08086718 @ =0x06011680
	str r0, [r1, #4]
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08086704: .4byte 0x040000D4
_08086708: .4byte 0x0858EB78
_0808670C: .4byte 0x06011280
_08086710: .4byte 0x80000080
_08086714: .4byte 0x0858F078
_08086718: .4byte 0x06011680

	thumb_func_start ProjectileFlareInit
ProjectileFlareInit: @ 0x0808671C
	push {lr}
	ldr r1, _08086764 @ =gCurrentProjectile
	ldr r0, _08086768 @ =0x08590988
	str r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r0, #0x10
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	ldr r2, _0808676C @ =0x0000FFC0
	strh r2, [r1, #0x16]
	movs r0, #0x40
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	strh r0, [r1, #0x1c]
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	movs r2, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _08086790
	lsls r0, r0, #2
	ldr r1, _08086770 @ =_08086774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086764: .4byte gCurrentProjectile
_08086768: .4byte 0x08590988
_0808676C: .4byte 0x0000FFC0
_08086770: .4byte _08086774
_08086774: @ jump table
	.4byte _08086790 @ case 0
	.4byte _08086790 @ case 1
	.4byte _08086788 @ case 2
	.4byte _08086790 @ case 3
	.4byte _08086788 @ case 4
_08086788:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08086790:
	movs r0, #0
	bl ProjectileFlareLoadGraphics
	movs r0, #0xf6
	bl SoundPlay
	pop {r0}
	bx r0

	thumb_func_start ProjectileFlareSubroutine
ProjectileFlareSubroutine: @ 0x080867A0
	push {lr}
	ldr r0, _080867C0 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	ldr r0, _080867C4 @ =gCurrentProjectile
	ldrb r0, [r0, #0x1e]
	cmp r0, #0xa
	bhi _08086842
	lsls r0, r0, #2
	ldr r1, _080867C8 @ =_080867CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080867C0: .4byte gCurrentClipdataAffectingAction
_080867C4: .4byte gCurrentProjectile
_080867C8: .4byte _080867CC
_080867CC: @ jump table
	.4byte _080867F8 @ case 0
	.4byte _0808680C @ case 1
	.4byte _0808681C @ case 2
	.4byte _08086842 @ case 3
	.4byte _08086824 @ case 4
	.4byte _08086842 @ case 5
	.4byte _0808682C @ case 6
	.4byte _08086842 @ case 7
	.4byte _08086834 @ case 8
	.4byte _08086842 @ case 9
	.4byte _0808683C @ case 10
_080867F8:
	bl ProjectileFlareInit
	ldr r2, _08086808 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	b _08086842
	.align 2, 0
_08086808: .4byte gCurrentProjectile
_0808680C:
	ldr r2, _08086818 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2]
	b _08086842
	.align 2, 0
_08086818: .4byte gCurrentProjectile
_0808681C:
	movs r0, #1
	bl ProjectileFlareLoadGraphics
	b _08086842
_08086824:
	movs r0, #2
	bl ProjectileFlareLoadGraphics
	b _08086842
_0808682C:
	movs r0, #3
	bl ProjectileFlareLoadGraphics
	b _08086842
_08086834:
	movs r0, #4
	bl ProjectileFlareLoadGraphics
	b _08086842
_0808683C:
	ldr r1, _08086850 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
_08086842:
	ldr r1, _08086850 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
	pop {r0}
	bx r0
	.align 2, 0
_08086850: .4byte gCurrentProjectile
