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
	ldr r0, _080741B0 @ =sParticleOam_ScrewAttackKilled
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
_080741B0: .4byte sParticleOam_ScrewAttackKilled

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
	ldr r0, _08074234 @ =sParticleOam_ShinesparkKilled
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
_08074234: .4byte sParticleOam_ShinesparkKilled

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
	ldr r0, _0807459C @ =gSamusEnvironmentalEffects
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
_0807459C: .4byte gSamusEnvironmentalEffects
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
