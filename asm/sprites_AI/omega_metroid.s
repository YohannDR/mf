    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start OmagaMetroidSyncSubSPrites
OmagaMetroidSyncSubSPrites: @ 0x08053D38
	push {r4, lr}
	ldr r4, _08053D94 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08053D98 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08053D9C @ =0x0879B634
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _08053D6A
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_08053D6A:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053D94: .4byte gSubSpriteData1
_08053D98: .4byte gCurrentSprite
_08053D9C: .4byte 0x0879B634

	thumb_func_start OmegaMetroidPartSetDrawOrder
OmegaMetroidPartSetDrawOrder: @ 0x08053DA0
	push {lr}
	ldr r0, _08053DB8 @ =gCurrentSprite
	ldrb r2, [r0, #0x1e]
	adds r3, r0, #0
	cmp r2, #7
	bhi _08053DF8
	lsls r0, r2, #2
	ldr r1, _08053DBC @ =_08053DC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053DB8: .4byte gCurrentSprite
_08053DBC: .4byte _08053DC0
_08053DC0: @ jump table
	.4byte _08053DE0 @ case 0
	.4byte _08053DE0 @ case 1
	.4byte _08053DE0 @ case 2
	.4byte _08053DF8 @ case 3
	.4byte _08053DF0 @ case 4
	.4byte _08053DE8 @ case 5
	.4byte _08053DF0 @ case 6
	.4byte _08053DF0 @ case 7
_08053DE0:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #3
	b _08053DF6
_08053DE8:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #5
	b _08053DF6
_08053DF0:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xc
_08053DF6:
	strb r0, [r1]
_08053DF8:
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidPartSetDrawOrder_2
OmegaMetroidPartSetDrawOrder_2: @ 0x08053DFC
	push {lr}
	ldr r1, _08053E10 @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	blt _08053E22
	cmp r0, #2
	bgt _08053E14
	adds r1, #0x22
	movs r0, #0xb
	b _08053E20
	.align 2, 0
_08053E10: .4byte gCurrentSprite
_08053E14:
	cmp r0, #7
	bgt _08053E22
	cmp r0, #4
	blt _08053E22
	adds r1, #0x22
	movs r0, #0xd
_08053E20:
	strb r0, [r1]
_08053E22:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidUpdatePalette
OmegaMetroidUpdatePalette: @ 0x08053E28
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r0, _08053E4C @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r2, _08053E50 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r4, _08053E54 @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _08053E58
	cmp r1, #1
	beq _08053E70
	b _08053E86
	.align 2, 0
_08053E4C: .4byte gCurrentSprite
_08053E50: .4byte sPrimarySpriteStats
_08053E54: .4byte gBossWork1
_08053E58:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _08053E86
	ldr r6, _08053E6C @ =0x08399168
	movs r0, #1
	strb r0, [r4]
	b _08053E8A
	.align 2, 0
_08053E6C: .4byte 0x08399168
_08053E70:
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _08053E86
	ldr r6, _08053EB4 @ =0x08399188
	movs r0, #2
	strb r0, [r4]
	movs r7, #1
_08053E86:
	cmp r7, #0
	beq _08053EAC
_08053E8A:
	ldr r0, _08053EB8 @ =0x040000D4
	str r6, [r0]
	ldr r1, _08053EBC @ =0x05000340
	str r1, [r0, #4]
	ldr r2, _08053EC0 @ =0x8000000B
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r6, [r0]
	ldr r1, _08053EC4 @ =0x050003A0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r6, [r0]
	ldr r1, _08053EC8 @ =0x050003C0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08053EAC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053EB4: .4byte 0x08399188
_08053EB8: .4byte 0x040000D4
_08053EBC: .4byte 0x05000340
_08053EC0: .4byte 0x8000000B
_08053EC4: .4byte 0x050003A0
_08053EC8: .4byte 0x050003C0

	thumb_func_start OmegaMetroidSaXIceBeamCollision
OmegaMetroidSaXIceBeamCollision: @ 0x08053ECC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r2, _08053F80 @ =gCurrentSprite
	ldrh r1, [r2, #2]
	ldrh r3, [r2, #4]
	ldrh r0, [r2, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r2, #0xc]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	ldrh r0, [r2, #0xe]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r2, #0x10]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	movs r0, #0
	mov r8, r0
_08053F0A:
	ldr r1, _08053F84 @ =gSpriteData
	mov r2, r8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08053F88
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08053F88
	ldrb r7, [r4, #0x1d]
	cmp r7, #0
	bne _08053F88
	ldrh r5, [r4, #2]
	ldrh r6, [r4, #4]
	ldrh r3, [r4, #0xa]
	adds r3, r5, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r2, [r4, #0xc]
	adds r2, r5, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r1, [r4, #0xe]
	adds r1, r6, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x10]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r3, [sp]
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, sl
	mov r3, sb
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _08053F88
	strh r7, [r4]
	movs r0, #2
	movs r1, #0x11
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
	b _08053F96
	.align 2, 0
_08053F80: .4byte gCurrentSprite
_08053F84: .4byte gSpriteData
_08053F88:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bls _08053F0A
_08053F96:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidUpdateHeartPalette
OmegaMetroidUpdateHeartPalette: @ 0x08053FA8
	push {lr}
	ldr r1, _08053FCC @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	beq _08053FF0
	adds r2, r1, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x38
	bne _08053FD0
	movs r0, #1
	strb r0, [r2]
	b _08053FDE
	.align 2, 0
_08053FCC: .4byte gCurrentSprite
_08053FD0:
	cmp r0, #0xe
	bne _08053FDA
	adds r1, #0x20
	movs r0, #3
	b _08053FEE
_08053FDA:
	cmp r0, #0x1c
	bne _08053FE6
_08053FDE:
	adds r0, r1, #0
	adds r0, #0x20
	strb r3, [r0]
	b _08053FF0
_08053FE6:
	cmp r0, #0x2a
	bne _08053FF0
	adds r1, #0x20
	movs r0, #4
_08053FEE:
	strb r0, [r1]
_08053FF0:
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidUpdateHealthThreshold
OmegaMetroidUpdateHealthThreshold: @ 0x08053FF4
	push {r4, lr}
	bl EventCheckAfter_IceBeamRecovered
	cmp r0, #0
	beq _0805409C
	ldr r0, _08054014 @ =gCurrentSprite
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #0x10
	bne _0805401C
	ldr r0, _08054018 @ =0x00000222
	bl SoundPlayNotAlreadyPlaying
	b _08054026
	.align 2, 0
_08054014: .4byte gCurrentSprite
_08054018: .4byte 0x00000222
_0805401C:
	cmp r1, #0xe
	bne _08054026
	ldr r0, _0805405C @ =0x0000021B
	bl SoundPlayNotAlreadyPlaying
_08054026:
	ldr r4, _08054060 @ =gCurrentSprite
	ldrh r2, [r4, #0x14]
	cmp r2, #0
	bne _0805406C
	ldr r0, _08054064 @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _0805406C
	adds r0, r4, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x25
	strb r0, [r1]
	ldr r0, _08054068 @ =gBossWork5
	strh r2, [r0]
	movs r0, #0x6c
	bl EventCheckAdvance
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x3a
	bl ParticleSet
	b _08054094
	.align 2, 0
_0805405C: .4byte 0x0000021B
_08054060: .4byte gCurrentSprite
_08054064: .4byte gSubSpriteData1
_08054068: .4byte gBossWork5
_0805406C:
	ldr r3, _080540A4 @ =gBossWork5
	ldr r0, _080540A8 @ =gSubSpriteData1
	ldr r2, _080540AC @ =gCurrentSprite
	ldrh r0, [r0, #0xc]
	ldrh r1, [r2, #0x14]
	subs r0, r0, r1
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08054094
	adds r0, r2, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x25
	strb r1, [r0]
	strh r2, [r3]
_08054094:
	ldr r0, _080540A8 @ =gSubSpriteData1
	ldr r1, _080540AC @ =gCurrentSprite
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0xc]
_0805409C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080540A4: .4byte gBossWork5
_080540A8: .4byte gSubSpriteData1
_080540AC: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidCheckSamusOnLowHealth
OmegaMetroidCheckSamusOnLowHealth: @ 0x080540B0
	push {lr}
	ldr r0, _080540C8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3f
	bne _080540D0
	ldr r0, _080540CC @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0x62
	bhi _080540D0
	movs r0, #1
	b _080540D2
	.align 2, 0
_080540C8: .4byte gSamusData
_080540CC: .4byte gEquipment
_080540D0:
	movs r0, #0
_080540D2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMetroidBodyBlinking
OmegaMetroidBodyBlinking: @ 0x080540D8
	push {lr}
	ldr r2, _0805411C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08054110
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805410A
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805410A:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08054110:
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805411C: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidFullBodyBlinking
OmegaMetroidFullBodyBlinking: @ 0x08054120
	push {lr}
	ldr r2, _08054164 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08054158
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08054152
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_08054152:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08054158:
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08054164: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidCheckSamusInFrontRange
OmegaMetroidCheckSamusInFrontRange: @ 0x08054168
	push {lr}
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #0xbe
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _08054194
	ldr r0, _0805418C @ =gSubSpriteData1
	ldr r1, _08054190 @ =gSamusData
	ldrh r0, [r0, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08054194
	movs r0, #1
	b _08054196
	.align 2, 0
_0805418C: .4byte gSubSpriteData1
_08054190: .4byte gSamusData
_08054194:
	movs r0, #0
_08054196:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMEtroidCheckBehindRightTrigger
OmegaMEtroidCheckBehindRightTrigger: @ 0x0805419C
	push {lr}
	ldr r0, _080541B8 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _080541BC @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xcc
	bhi _080541C0
	movs r0, #0
	b _080541C2
	.align 2, 0
_080541B8: .4byte gSubSpriteData1
_080541BC: .4byte gBg1XPosition
_080541C0:
	movs r0, #1
_080541C2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMetroidCheckInFrontOfMiddleTrigger
OmegaMetroidCheckInFrontOfMiddleTrigger: @ 0x080541C8
	push {lr}
	ldr r0, _080541E4 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _080541E8 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x78
	bls _080541EC
	movs r0, #0
	b _080541EE
	.align 2, 0
_080541E4: .4byte gSubSpriteData1
_080541E8: .4byte gBg1XPosition
_080541EC:
	movs r0, #1
_080541EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMetroidCheckInFrontOfLeftTrigger
OmegaMetroidCheckInFrontOfLeftTrigger: @ 0x080541F4
	push {lr}
	ldr r0, _08054210 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _08054214 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x50
	bls _08054218
	movs r0, #0
	b _0805421A
	.align 2, 0
_08054210: .4byte gSubSpriteData1
_08054214: .4byte gBg1XPosition
_08054218:
	movs r0, #1
_0805421A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMetroidXMovement
OmegaMetroidXMovement: @ 0x08054220
	push {r4, r5, lr}
	ldr r1, _0805424C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r4, [r0]
	adds r5, r4, #0
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08054254
	bl OmegaMEtroidCheckBehindRightTrigger
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08054268
	ldr r1, _08054250 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, r4, r0
	b _08054266
	.align 2, 0
_0805424C: .4byte gCurrentSprite
_08054250: .4byte gSubSpriteData1
_08054254:
	bl OmegaMetroidCheckInFrontOfLeftTrigger
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08054268
	ldr r1, _08054270 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, r0, r5
_08054266:
	strh r0, [r1, #0xa]
_08054268:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08054270: .4byte gSubSpriteData1

	thumb_func_start OmegaMetroidBackwardsMovement
OmegaMetroidBackwardsMovement: @ 0x08054274
	push {lr}
	ldr r1, _0805428C @ =gSubSpriteData1
	ldrh r0, [r1, #4]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #7
	bhi _080542EC
	lsls r0, r0, #2
	ldr r1, _08054290 @ =_08054294
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805428C: .4byte gSubSpriteData1
_08054290: .4byte _08054294
_08054294: @ jump table
	.4byte _080542B4 @ case 0
	.4byte _080542B8 @ case 1
	.4byte _080542BC @ case 2
	.4byte _080542EC @ case 3
	.4byte _080542B4 @ case 4
	.4byte _080542B8 @ case 5
	.4byte _080542D0 @ case 6
	.4byte _080542D8 @ case 7
_080542B4:
	movs r1, #2
	b _080542EE
_080542B8:
	movs r1, #3
	b _080542EE
_080542BC:
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _080542D0
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080542D4 @ =0x0000021D
	bl SoundPlay
_080542D0:
	movs r1, #4
	b _080542EE
	.align 2, 0
_080542D4: .4byte 0x0000021D
_080542D8:
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _080542EC
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _08054300 @ =0x0000021D
	bl SoundPlay
_080542EC:
	movs r1, #0
_080542EE:
	ldr r0, _08054304 @ =gCurrentSprite
	adds r0, #0x30
	strb r1, [r0]
	bl OmegaMetroidXMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08054300: .4byte 0x0000021D
_08054304: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidForwardMovement
OmegaMetroidForwardMovement: @ 0x08054308
	push {lr}
	ldr r0, _08054320 @ =gSubSpriteData1
	ldrh r1, [r0, #4]
	adds r2, r0, #0
	cmp r1, #7
	bhi _08054380
	lsls r0, r1, #2
	ldr r1, _08054324 @ =_08054328
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054320: .4byte gSubSpriteData1
_08054324: .4byte _08054328
_08054328: @ jump table
	.4byte _0805435C @ case 0
	.4byte _08054348 @ case 1
	.4byte _08054380 @ case 2
	.4byte _08054380 @ case 3
	.4byte _0805435C @ case 4
	.4byte _08054364 @ case 5
	.4byte _08054368 @ case 6
	.4byte _0805436C @ case 7
_08054348:
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _0805435C
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _08054360 @ =0x0000021D
	bl SoundPlay
_0805435C:
	movs r2, #2
	b _08054382
	.align 2, 0
_08054360: .4byte 0x0000021D
_08054364:
	movs r2, #3
	b _08054382
_08054368:
	movs r2, #4
	b _08054382
_0805436C:
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _08054380
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080543B8 @ =0x0000021D
	bl SoundPlay
_08054380:
	movs r2, #0
_08054382:
	ldr r0, _080543BC @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0x24
	beq _0805439A
	cmp r2, #0
	beq _0805439A
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0805439A:
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	bl OmegaMetroidXMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080543B4
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080543B4:
	pop {r1}
	bx r1
	.align 2, 0
_080543B8: .4byte 0x0000021D
_080543BC: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidSlowMovement
OmegaMetroidSlowMovement: @ 0x080543C0
	push {lr}
	ldr r0, _080543D4 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0x24
	beq _080543D8
	movs r1, #0
	b _080543E2
	.align 2, 0
_080543D4: .4byte gCurrentSprite
_080543D8:
	ldr r0, _08054400 @ =gSubSpriteData1
	ldrh r1, [r0, #4]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
_080543E2:
	adds r0, r2, #0
	adds r0, #0x30
	strb r1, [r0]
	bl OmegaMetroidXMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080543FC
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080543FC:
	pop {r1}
	bx r1
	.align 2, 0
_08054400: .4byte gSubSpriteData1

	thumb_func_start OmegaMetroidStandingMovement
OmegaMetroidStandingMovement: @ 0x08054404
	push {r4, lr}
	ldr r0, _08054420 @ =gCurrentSprite
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	movs r4, #0
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054424
	movs r4, #2
	b _08054430
	.align 2, 0
_08054420: .4byte gCurrentSprite
_08054424:
	bl OmegaMetroidXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054430
	movs r4, #1
_08054430:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start OmegaMetroidInit
OmegaMetroidInit: @ 0x08054438
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	ldr r1, _080545E0 @ =gBossWork1
	movs r0, #0
	strb r0, [r1]
	ldr r7, _080545E4 @ =gCurrentSprite
	ldrh r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r3, r1, #0
	movs r6, #0
	movs r5, #0
	orrs r3, r0
	strh r3, [r7]
	adds r2, r7, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r7, #2]
	mov r8, r0
	ldrh r1, [r7, #4]
	mov sb, r1
	strh r0, [r7, #6]
	strh r1, [r7, #8]
	ldr r1, _080545E8 @ =gAbilityRestingYPosition
	ldr r0, _080545EC @ =0xFFFFFE80
	add r0, r8
	strh r0, [r1]
	ldr r1, _080545F0 @ =gAbilityRestingXPosition
	ldr r0, _080545F4 @ =0xFFFFFDC0
	add r0, sb
	strh r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r1, r0, #0
	ldrh r0, [r7, #4]
	adds r1, r1, r0
	strh r1, [r7, #4]
	ldr r4, _080545F8 @ =gSubSpriteData1
	ldrh r0, [r7, #2]
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x27
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x29
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _080545FC @ =0x0000FF90
	strh r0, [r7, #0xa]
	movs r1, #0x40
	strh r1, [r7, #0xc]
	adds r0, #0x10
	strh r0, [r7, #0xe]
	strh r1, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	movs r0, #3
	strb r0, [r7, #0x1e]
	ldr r2, _08054600 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
	strh r0, [r4, #0xc]
	ldr r0, _08054604 @ =gBossWork5
	strh r5, [r0]
	ldr r0, _08054608 @ =0x083966A0
	str r0, [r4]
	strb r6, [r4, #6]
	strh r5, [r4, #4]
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #0x16
	strb r0, [r1]
	ldr r0, _0805460C @ =0x0000FDFF
	ands r3, r0
	strh r3, [r7]
	subs r1, #1
	movs r0, #0x37
	strb r0, [r1]
	adds r1, #0xd
	movs r0, #1
	strb r0, [r1]
	subs r1, #3
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x2d
	strb r6, [r0]
	subs r0, #2
	strb r6, [r0]
	ldrb r2, [r7, #0x1f]
	adds r6, r7, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #5
	bl SpriteSpawnSecondary
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r3, [r6]
	movs r0, #0x10
	str r0, [sp]
	mov r1, r8
	str r1, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x4c
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	adds r1, r7, #0
	adds r1, #0x2f
	strb r0, [r1]
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080545E0: .4byte gBossWork1
_080545E4: .4byte gCurrentSprite
_080545E8: .4byte gAbilityRestingYPosition
_080545EC: .4byte 0xFFFFFE80
_080545F0: .4byte gAbilityRestingXPosition
_080545F4: .4byte 0xFFFFFDC0
_080545F8: .4byte gSubSpriteData1
_080545FC: .4byte 0x0000FF90
_08054600: .4byte sPrimarySpriteStats
_08054604: .4byte gBossWork5
_08054608: .4byte 0x083966A0
_0805460C: .4byte 0x0000FDFF

	thumb_func_start OmegaMetroidWaitingToAppear
OmegaMetroidWaitingToAppear: @ 0x08054610
	push {lr}
	ldr r2, _08054648 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _08054642
	adds r1, #8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08054642
	subs r1, #0xa
	movs r0, #0x38
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0805464C @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
_08054642:
	pop {r0}
	bx r0
	.align 2, 0
_08054648: .4byte gCurrentSprite
_0805464C: .4byte 0x00007FFF

	thumb_func_start OmegaMetroidFirstJump
OmegaMetroidFirstJump: @ 0x08054650
	push {r4, r5, r6, r7, lr}
	ldr r1, _08054688 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, #0x10
	strh r0, [r1, #0xa]
	ldr r3, _0805468C @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r4, [r0]
	ldr r7, _08054690 @ =0x08395900
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r6, [r0]
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, _08054694 @ =0x00007FFF
	adds r5, r1, #0
	cmp r2, r0
	bne _08054698
	subs r1, r4, #1
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r5, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080546A2
	.align 2, 0
_08054688: .4byte gSubSpriteData1
_0805468C: .4byte gCurrentSprite
_08054690: .4byte 0x08395900
_08054694: .4byte 0x00007FFF
_08054698:
	adds r0, r4, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r5, #8]
	adds r0, r0, r6
_080546A2:
	strh r0, [r5, #8]
	adds r1, r3, #0
	ldrh r4, [r1, #6]
	ldrh r0, [r5, #8]
	cmp r0, r4
	bls _080546DC
	movs r2, #0
	movs r3, #0
	strh r4, [r5, #8]
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	ldr r0, _080546D4 @ =0x083966B8
	str r0, [r5]
	strb r2, [r5, #6]
	strh r3, [r5, #4]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080546D8 @ =0x0000021F
	bl SoundPlay
	b _0805470E
	.align 2, 0
_080546D4: .4byte 0x083966B8
_080546D8: .4byte 0x0000021F
_080546DC:
	ldrh r1, [r5, #8]
	ldrh r0, [r3, #6]
	subs r0, #0x78
	cmp r1, r0
	ble _0805470E
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x10
	bls _0805470E
	ldr r2, _08054714 @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r3, r0, #0
	adds r3, #0x24
	ldrb r0, [r3]
	cmp r0, #8
	bne _0805470E
	movs r0, #0x17
	strb r0, [r3]
_0805470E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054714: .4byte gSpriteData

	thumb_func_start OmegaMetroidLandingFromFirstJump
OmegaMetroidLandingFromFirstJump: @ 0x08054718
	push {lr}
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054736
	ldr r1, _0805473C @ =gSubSpriteData1
	ldr r0, _08054740 @ =0x08396858
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08054744 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3c
	strb r1, [r0]
_08054736:
	pop {r0}
	bx r0
	.align 2, 0
_0805473C: .4byte gSubSpriteData1
_08054740: .4byte 0x08396858
_08054744: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidLandedAfterFirstJump
OmegaMetroidLandedAfterFirstJump: @ 0x08054748
	push {lr}
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054774
	ldr r1, _08054778 @ =gSubSpriteData1
	ldr r0, _0805477C @ =0x08396870
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08054780 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3e
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _08054784 @ =0x00000219
	bl SoundPlay
_08054774:
	pop {r0}
	bx r0
	.align 2, 0
_08054778: .4byte gSubSpriteData1
_0805477C: .4byte 0x08396870
_08054780: .4byte gCurrentSprite
_08054784: .4byte 0x00000219

	thumb_func_start OmegaMetroidScreamingAfterFirstJump
OmegaMetroidScreamingAfterFirstJump: @ 0x08054788
	push {lr}
	ldr r3, _080547B4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080547B0
	ldr r0, _080547B8 @ =gSubSpriteData1
	ldr r1, _080547BC @ =0x08396898
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x40
	strb r0, [r1]
_080547B0:
	pop {r0}
	bx r0
	.align 2, 0
_080547B4: .4byte gCurrentSprite
_080547B8: .4byte gSubSpriteData1
_080547BC: .4byte 0x08396898

	thumb_func_start OmegaMetroidFinishedScreamingAfterFirstJump
OmegaMetroidFinishedScreamingAfterFirstJump: @ 0x080547C0
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _080547FC
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r3, _080547EC @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080547F0
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2b
	strb r0, [r1]
	b _080547FC
	.align 2, 0
_080547EC: .4byte gCurrentSprite
_080547F0:
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x1f
	strb r1, [r0]
	adds r0, #9
	strb r2, [r0]
_080547FC:
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidJumpWarningInit
OmegaMetroidJumpWarningInit: @ 0x08054800
	push {lr}
	ldr r1, _08054820 @ =gSubSpriteData1
	ldr r0, _08054824 @ =0x08396688
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08054828 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	ldr r0, _0805482C @ =0x0000021E
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08054820: .4byte gSubSpriteData1
_08054824: .4byte 0x08396688
_08054828: .4byte gCurrentSprite
_0805482C: .4byte 0x0000021E

	thumb_func_start OmegaMetroidJumpWarning
OmegaMetroidJumpWarning: @ 0x08054830
	push {lr}
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054856
	ldr r1, _0805485C @ =gSubSpriteData1
	ldr r0, _08054860 @ =0x083966A0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r0, _08054864 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x31
	strb r2, [r1]
	adds r0, #0x24
	movs r1, #0x1a
	strb r1, [r0]
_08054856:
	pop {r0}
	bx r0
	.align 2, 0
_0805485C: .4byte gSubSpriteData1
_08054860: .4byte 0x083966A0
_08054864: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidJumping
OmegaMetroidJumping: @ 0x08054868
	push {r4, r5, r6, lr}
	ldr r5, _08054894 @ =gCurrentSprite
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r1, _08054898 @ =0x08395948
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0805489C @ =0x00007FFF
	cmp r1, r0
	bne _080548A0
	adds r0, r5, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x1c
	strb r1, [r0]
	strb r2, [r3]
	b _080548B0
	.align 2, 0
_08054894: .4byte gCurrentSprite
_08054898: .4byte 0x08395948
_0805489C: .4byte 0x00007FFF
_080548A0:
	adds r0, r2, #1
	strb r0, [r3]
	ldr r1, _080548B8 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
	bl OmegaMetroidXMovement
_080548B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080548B8: .4byte gSubSpriteData1

	thumb_func_start OmegaMEtroidFalling
OmegaMEtroidFalling: @ 0x080548BC
	push {r4, r5, r6, lr}
	ldr r0, _080548EC @ =gCurrentSprite
	adds r5, r0, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _080548F0 @ =0x08395978
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080548F4 @ =0x00007FFF
	cmp r1, r0
	bne _080548FC
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _080548F8 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #8]
	adds r4, r2, #0
	b _0805490A
	.align 2, 0
_080548EC: .4byte gCurrentSprite
_080548F0: .4byte 0x08395978
_080548F4: .4byte 0x00007FFF
_080548F8: .4byte gSubSpriteData1
_080548FC:
	adds r0, r2, #1
	strb r0, [r5]
	ldr r1, _08054944 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
	adds r4, r1, #0
_0805490A:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r0, _08054948 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08054938
	strh r2, [r4, #8]
	ldr r0, _0805494C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1d
	strb r1, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _08054950 @ =0x0000021F
	bl SoundPlay
_08054938:
	bl OmegaMetroidXMovement
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054944: .4byte gSubSpriteData1
_08054948: .4byte gPreviousVerticalCollisionCheck
_0805494C: .4byte gCurrentSprite
_08054950: .4byte 0x0000021F

	thumb_func_start OmegaMetroidLandingInit
OmegaMetroidLandingInit: @ 0x08054954
	ldr r1, _0805496C @ =gSubSpriteData1
	ldr r0, _08054970 @ =0x083966B8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08054974 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1e
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805496C: .4byte gSubSpriteData1
_08054970: .4byte 0x083966B8
_08054974: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidLanding
OmegaMetroidLanding: @ 0x08054978
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _080549E0
	bl EventCheckAfter_SaXKilledByOmega
	cmp r0, #0
	bne _080549B0
	bl OmegaMetroidCheckSamusOnLowHealth
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080549B0
	ldr r1, _080549A8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	ldrh r2, [r1]
	ldr r0, _080549AC @ =0x0000FDFF
	ands r0, r2
	strh r0, [r1]
	b _080549E0
	.align 2, 0
_080549A8: .4byte gCurrentSprite
_080549AC: .4byte 0x0000FDFF
_080549B0:
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r3, _080549D0 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080549D4
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2b
	strb r0, [r1]
	b _080549E0
	.align 2, 0
_080549D0: .4byte gCurrentSprite
_080549D4:
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x1f
	strb r1, [r0]
	adds r0, #9
	strb r2, [r0]
_080549E0:
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidIdleInit
OmegaMetroidIdleInit: @ 0x080549E4
	push {lr}
	ldr r0, _080549FC @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x2d
	ldrb r2, [r2]
	adds r3, r0, #0
	cmp r2, #1
	bne _08054A08
	ldr r1, _08054A00 @ =gSubSpriteData1
	ldr r0, _08054A04 @ =0x08396600
	b _08054A20
	.align 2, 0
_080549FC: .4byte gCurrentSprite
_08054A00: .4byte gSubSpriteData1
_08054A04: .4byte 0x08396600
_08054A08:
	cmp r2, #2
	bne _08054A1C
	ldr r1, _08054A14 @ =gSubSpriteData1
	ldr r0, _08054A18 @ =0x08396730
	b _08054A20
	.align 2, 0
_08054A14: .4byte gSubSpriteData1
_08054A18: .4byte 0x08396730
_08054A1C:
	ldr r1, _08054A34 @ =gSubSpriteData1
	ldr r0, _08054A38 @ =0x083965D8
_08054A20:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08054A34: .4byte gSubSpriteData1
_08054A38: .4byte 0x083965D8

	thumb_func_start OmegaMetroidIdle
OmegaMetroidIdle: @ 0x08054A3C
	push {r4, lr}
	ldr r0, _08054A94 @ =gCurrentSprite
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08054A5E
	ldr r0, _08054A98 @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _08054A9C @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _08054A5E
	ldr r0, _08054AA0 @ =0x00000223
	bl SoundPlay
_08054A5E:
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08054AF2
	bl EventCheckAfter_SaXKilledByOmega
	cmp r0, #0
	bne _08054AA4
	bl OmegaMetroidCheckSamusOnLowHealth
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054AA4
	ldr r1, _08054A94 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x17
	strb r0, [r2]
	adds r1, #0x30
	movs r0, #0x14
	b _08054AF0
	.align 2, 0
_08054A94: .4byte gCurrentSprite
_08054A98: .4byte gSubSpriteData1
_08054A9C: .4byte 0x00FFFFFF
_08054AA0: .4byte 0x00000223
_08054AA4:
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r4, _08054AC4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08054AC8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #0x14
	b _08054AF0
	.align 2, 0
_08054AC4: .4byte gCurrentSprite
_08054AC8:
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054ADA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	b _08054AF0
_08054ADA:
	bl EventCheckAfter_SaXKilledByOmega
	cmp r0, #0
	beq _08054AEA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x23
	b _08054AF0
_08054AEA:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
_08054AF0:
	strb r0, [r1]
_08054AF2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidWalkingBeforeSaXInit
OmegaMetroidWalkingBeforeSaXInit: @ 0x08054AF8
	ldr r1, _08054B14 @ =gSubSpriteData1
	ldr r0, _08054B18 @ =0x08396758
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08054B1C @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	movs r2, #2
	strb r2, [r1]
	adds r0, #0x2d
	strb r2, [r0]
	bx lr
	.align 2, 0
_08054B14: .4byte gSubSpriteData1
_08054B18: .4byte 0x08396758
_08054B1C: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidWalkingBeforeSaX
OmegaMetroidWalkingBeforeSaX: @ 0x08054B20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08054B58 @ =gCurrentSprite
	movs r0, #0x30
	adds r0, r0, r4
	mov r8, r0
	movs r6, #0
	strb r6, [r0]
	adds r7, r4, #0
	adds r7, #0x2d
	ldrb r0, [r7]
	cmp r0, #2
	bne _08054B64
	bl OmegaMetroidForwardMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054BAC
	ldr r0, _08054B5C @ =gSubSpriteData1
	ldr r1, _08054B60 @ =0x083967C8
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	movs r0, #3
	strb r0, [r7]
	b _08054BAC
	.align 2, 0
_08054B58: .4byte gCurrentSprite
_08054B5C: .4byte gSubSpriteData1
_08054B60: .4byte 0x083967C8
_08054B64:
	bl OmegaMetroidStandingMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08054BAC
	cmp r5, #2
	bne _08054B82
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08054BAC
_08054B82:
	cmp r5, #1
	bne _08054BA2
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	movs r0, #0x14
	mov r1, r8
	strb r0, [r1]
	b _08054BAC
_08054BA2:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	strb r6, [r7]
_08054BAC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidSlowWalkInit
OmegaMetroidSlowWalkInit: @ 0x08054BB8
	ldr r1, _08054BD8 @ =gSubSpriteData1
	ldr r0, _08054BDC @ =0x08396758
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08054BE0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x22
	strb r0, [r2]
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08054BD8: .4byte gSubSpriteData1
_08054BDC: .4byte 0x08396758
_08054BE0: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidSlowWalk
OmegaMetroidSlowWalk: @ 0x08054BE4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08054C0C @ =gCurrentSprite
	movs r0, #0x30
	adds r0, r0, r4
	mov r8, r0
	movs r6, #0
	strb r6, [r0]
	adds r7, r4, #0
	adds r7, #0x2d
	ldrb r0, [r7]
	cmp r0, #1
	beq _08054C4E
	cmp r0, #1
	bgt _08054C10
	cmp r0, #0
	beq _08054C1A
	b _08054CFC
	.align 2, 0
_08054C0C: .4byte gCurrentSprite
_08054C10:
	cmp r0, #2
	beq _08054C90
	cmp r0, #3
	beq _08054CB4
	b _08054CFC
_08054C1A:
	bl OmegaMetroidSlowMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054CFC
	ldr r0, _08054C40 @ =gSubSpriteData1
	ldr r1, _08054C44 @ =0x08396758
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	cmp r5, #0
	beq _08054C48
	movs r0, #2
	strb r0, [r7]
	b _08054CFC
	.align 2, 0
_08054C40: .4byte gSubSpriteData1
_08054C44: .4byte 0x08396758
_08054C48:
	movs r0, #1
	strb r0, [r7]
	b _08054CFC
_08054C4E:
	bl OmegaMetroidForwardMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054CFC
	cmp r5, #0
	beq _08054C78
	ldr r0, _08054C70 @ =gSubSpriteData1
	ldr r1, _08054C74 @ =0x083967C8
	str r1, [r0]
	movs r1, #3
	strb r1, [r7]
	adds r1, r0, #0
	b _08054C80
	.align 2, 0
_08054C70: .4byte gSubSpriteData1
_08054C74: .4byte 0x083967C8
_08054C78:
	ldr r1, _08054C88 @ =gSubSpriteData1
	ldr r0, _08054C8C @ =0x083967B0
	str r0, [r1]
	strb r6, [r7]
_08054C80:
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	b _08054CFC
	.align 2, 0
_08054C88: .4byte gSubSpriteData1
_08054C8C: .4byte 0x083967B0
_08054C90:
	bl OmegaMetroidForwardMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054CFC
	ldr r0, _08054CAC @ =gSubSpriteData1
	ldr r1, _08054CB0 @ =0x083967C8
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	movs r0, #3
	strb r0, [r7]
	b _08054CFC
	.align 2, 0
_08054CAC: .4byte gSubSpriteData1
_08054CB0: .4byte 0x083967C8
_08054CB4:
	bl OmegaMetroidStandingMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08054CFC
	cmp r5, #2
	bne _08054CD2
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08054CFC
_08054CD2:
	cmp r5, #1
	bne _08054CF2
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	movs r0, #0x14
	mov r1, r8
	strb r0, [r1]
	b _08054CFC
_08054CF2:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	strb r6, [r7]
_08054CFC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidWalkInit
OmegaMetroidWalkInit: @ 0x08054D08
	ldr r1, _08054D28 @ =gSubSpriteData1
	ldr r0, _08054D2C @ =0x083967D8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08054D30 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x24
	strb r0, [r2]
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08054D28: .4byte gSubSpriteData1
_08054D2C: .4byte 0x083967D8
_08054D30: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidWalk
OmegaMetroidWalk: @ 0x08054D34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08054D5C @ =gCurrentSprite
	movs r0, #0x30
	adds r0, r0, r4
	mov r8, r0
	movs r6, #0
	strb r6, [r0]
	adds r7, r4, #0
	adds r7, #0x2d
	ldrb r0, [r7]
	cmp r0, #1
	beq _08054D9E
	cmp r0, #1
	bgt _08054D60
	cmp r0, #0
	beq _08054D6A
	b _08054E4C
	.align 2, 0
_08054D5C: .4byte gCurrentSprite
_08054D60:
	cmp r0, #2
	beq _08054DE0
	cmp r0, #3
	beq _08054E04
	b _08054E4C
_08054D6A:
	bl OmegaMetroidSlowMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054E4C
	ldr r0, _08054D90 @ =gSubSpriteData1
	ldr r1, _08054D94 @ =0x083967D8
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	cmp r5, #0
	beq _08054D98
	movs r0, #2
	strb r0, [r7]
	b _08054E4C
	.align 2, 0
_08054D90: .4byte gSubSpriteData1
_08054D94: .4byte 0x083967D8
_08054D98:
	movs r0, #1
	strb r0, [r7]
	b _08054E4C
_08054D9E:
	bl OmegaMetroidForwardMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054E4C
	cmp r5, #0
	beq _08054DC8
	ldr r0, _08054DC0 @ =gSubSpriteData1
	ldr r1, _08054DC4 @ =0x08396848
	str r1, [r0]
	movs r1, #3
	strb r1, [r7]
	adds r1, r0, #0
	b _08054DD0
	.align 2, 0
_08054DC0: .4byte gSubSpriteData1
_08054DC4: .4byte 0x08396848
_08054DC8:
	ldr r1, _08054DD8 @ =gSubSpriteData1
	ldr r0, _08054DDC @ =0x08396830
	str r0, [r1]
	strb r6, [r7]
_08054DD0:
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	b _08054E4C
	.align 2, 0
_08054DD8: .4byte gSubSpriteData1
_08054DDC: .4byte 0x08396830
_08054DE0:
	bl OmegaMetroidForwardMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08054E4C
	ldr r0, _08054DFC @ =gSubSpriteData1
	ldr r1, _08054E00 @ =0x08396848
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	movs r0, #3
	strb r0, [r7]
	b _08054E4C
	.align 2, 0
_08054DFC: .4byte gSubSpriteData1
_08054E00: .4byte 0x08396848
_08054E04:
	bl OmegaMetroidStandingMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08054E4C
	cmp r5, #2
	bne _08054E22
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08054E4C
_08054E22:
	cmp r5, #1
	bne _08054E42
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	movs r0, #0x14
	mov r1, r8
	strb r0, [r1]
	b _08054E4C
_08054E42:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	strb r6, [r7]
_08054E4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidSwipingInit
OmegaMetroidSwipingInit: @ 0x08054E58
	push {r4, lr}
	ldr r1, _08054E8C @ =gSubSpriteData1
	ldr r0, _08054E90 @ =0x08396918
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r4, _08054E94 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bl EventCheckAfter_SaXKilledByOmega
	cmp r0, #0
	beq _08054E9C
	ldr r0, _08054E98 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r2, r0, #2
	cmp r2, #0
	bne _08054E84
	movs r2, #1
_08054E84:
	adds r0, r4, #0
	adds r0, #0x2e
	strb r2, [r0]
	b _08054EA4
	.align 2, 0
_08054E8C: .4byte gSubSpriteData1
_08054E90: .4byte 0x08396918
_08054E94: .4byte gCurrentSprite
_08054E98: .4byte gSpriteRandomNumber
_08054E9C:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #3
	strb r0, [r1]
_08054EA4:
	ldr r0, _08054ED4 @ =gCurrentSprite
	adds r0, #0x36
	ldrb r1, [r0]
	ldr r2, _08054ED8 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r2, r0, #0
	adds r2, #0x25
	movs r1, #0x15
	strb r1, [r2]
	movs r1, #0x40
	strh r1, [r0, #0xc]
	movs r1, #0x90
	strh r1, [r0, #0x10]
	movs r0, #0x88
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054ED4: .4byte gCurrentSprite
_08054ED8: .4byte gSpriteData

	thumb_func_start OmegaMetroidSwiping
OmegaMetroidSwiping: @ 0x08054EDC
	push {r4, lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08054FA4
	ldr r2, _08054F78 @ =gSubSpriteData1
	ldr r1, [r2]
	ldr r0, _08054F7C @ =0x08396918
	cmp r1, r0
	bne _08054EF4
	ldr r0, _08054F80 @ =0x083966D8
	str r0, [r2]
_08054EF4:
	bl EventCheckAfter_SaXKilledByOmega
	adds r1, r0, #0
	cmp r1, #0
	bne _08054F14
	ldr r0, _08054F84 @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0x62
	bhi _08054F14
	ldr r0, _08054F88 @ =gPoseLock
	ldrb r0, [r0]
	cmp r0, #0x80
	bne _08054F14
	ldr r0, _08054F8C @ =gCurrentSprite
	adds r0, #0x2e
	strb r1, [r0]
_08054F14:
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08054F26
	ldr r0, _08054F8C @ =gCurrentSprite
	adds r0, #0x2e
	strb r1, [r0]
_08054F26:
	ldr r4, _08054F8C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _08054FD8
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldr r2, _08054F90 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r2, r0, #0
	adds r2, #0x25
	movs r1, #0x16
	strb r1, [r2]
	movs r1, #0x30
	strh r1, [r0, #0xc]
	movs r1, #0x40
	strh r1, [r0, #0x10]
	bl OmegaMetroidCheckInFrontOfMiddleTrigger
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054F94
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #0x14
	strb r0, [r1]
	b _08054FD8
	.align 2, 0
_08054F78: .4byte gSubSpriteData1
_08054F7C: .4byte 0x08396918
_08054F80: .4byte 0x083966D8
_08054F84: .4byte gEquipment
_08054F88: .4byte gPoseLock
_08054F8C: .4byte gCurrentSprite
_08054F90: .4byte gSpriteData
_08054F94:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	adds r1, #9
	movs r0, #1
	strb r0, [r1]
	b _08054FD8
_08054FA4:
	ldr r0, _08054FC0 @ =gSubSpriteData1
	ldr r1, [r0, #4]
	ldr r0, _08054FC4 @ =0x00FFFFFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #9
	cmp r1, r0
	bne _08054FCC
	ldr r1, _08054FC8 @ =gCurrentSprite
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b _08054FD8
	.align 2, 0
_08054FC0: .4byte gSubSpriteData1
_08054FC4: .4byte 0x00FFFFFF
_08054FC8: .4byte gCurrentSprite
_08054FCC:
	ldr r0, _08054FE0 @ =0x00010002
	cmp r1, r0
	bne _08054FD8
	ldr r0, _08054FE4 @ =0x00000221
	bl SoundPlay
_08054FD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054FE0: .4byte 0x00010002
_08054FE4: .4byte 0x00000221

	thumb_func_start OmegaMetroidVerticalJumpInit
OmegaMetroidVerticalJumpInit: @ 0x08054FE8
	ldr r1, _08055010 @ =gSubSpriteData1
	ldr r0, _08055014 @ =0x083966B8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08055018 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	adds r1, #1
	movs r0, #0x17
	strb r0, [r1]
	bx lr
	.align 2, 0
_08055010: .4byte gSubSpriteData1
_08055014: .4byte 0x083966B8
_08055018: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidVerticalJump
OmegaMetroidVerticalJump: @ 0x0805501C
	push {r4, r5, r6, lr}
	ldr r0, _0805504C @ =gCurrentSprite
	adds r5, r0, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _08055050 @ =0x08395990
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08055054 @ =0x00007FFF
	cmp r1, r0
	bne _0805505C
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08055058 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #8]
	adds r4, r2, #0
	b _0805506A
	.align 2, 0
_0805504C: .4byte gCurrentSprite
_08055050: .4byte 0x08395990
_08055054: .4byte 0x00007FFF
_08055058: .4byte gSubSpriteData1
_0805505C:
	adds r0, r2, #1
	strb r0, [r5]
	ldr r1, _080550A4 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
	adds r4, r1, #0
_0805506A:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r0, _080550A8 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080550C6
	strh r2, [r4, #8]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080550AC @ =0x0000021F
	bl SoundPlay
	ldr r2, _080550B0 @ =gCurrentSprite
	ldr r1, _080550B4 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _080550B8
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	b _080550C4
	.align 2, 0
_080550A4: .4byte gSubSpriteData1
_080550A8: .4byte gPreviousVerticalCollisionCheck
_080550AC: .4byte 0x0000021F
_080550B0: .4byte gCurrentSprite
_080550B4: .4byte gSamusData
_080550B8:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x16
_080550C4:
	strb r0, [r1]
_080550C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidSpawnSaX
OmegaMetroidSpawnSaX: @ 0x080550CC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _08055114 @ =gCurrentSprite
	ldr r0, _08055118 @ =0xFFFFFE80
	adds r1, r0, #0
	ldrh r2, [r4, #6]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0805511C @ =0xFFFFFC80
	adds r0, r2, #0
	ldrh r2, [r4, #8]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	adds r2, #0x23
	ldrb r3, [r2]
	movs r2, #0x10
	str r2, [sp]
	str r1, [sp, #4]
	subs r0, #0x20
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x4d
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	adds r4, #0x2f
	strb r0, [r4]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055114: .4byte gCurrentSprite
_08055118: .4byte 0xFFFFFE80
_0805511C: .4byte 0xFFFFFC80

	thumb_func_start OmegaMetroidWaitingForSaXInit
OmegaMetroidWaitingForSaXInit: @ 0x08055120
	ldr r1, _08055148 @ =gSubSpriteData1
	ldr r0, _0805514C @ =0x083965D8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08055150 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r2, [r0]
	adds r1, #0xa
	movs r0, #9
	strb r0, [r1]
	bx lr
	.align 2, 0
_08055148: .4byte gSubSpriteData1
_0805514C: .4byte 0x083965D8
_08055150: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidWaitingForSaX
OmegaMetroidWaitingForSaX: @ 0x08055154
	push {r4, r5, lr}
	ldr r4, _08055194 @ =gSamusData
	ldrh r0, [r4, #0x18]
	subs r0, #0x20
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #0x16]
	adds r1, r1, r2
	subs r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08055198 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08055178
	ldrh r0, [r4, #0x16]
	subs r0, #8
	strh r0, [r4, #0x16]
_08055178:
	ldr r1, _0805519C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #6
	bls _08055188
	b _0805534A
_08055188:
	lsls r0, r0, #2
	ldr r1, _080551A0 @ =_080551A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055194: .4byte gSamusData
_08055198: .4byte gPreviousCollisionCheck
_0805519C: .4byte gCurrentSprite
_080551A0: .4byte _080551A4
_080551A4: @ jump table
	.4byte _080551C0 @ case 0
	.4byte _08055214 @ case 1
	.4byte _08055248 @ case 2
	.4byte _08055288 @ case 3
	.4byte _080552C8 @ case 4
	.4byte _080552F4 @ case 5
	.4byte _08055324 @ case 6
_080551C0:
	ldr r0, _080551E0 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080551E4
	ldrb r2, [r1]
	movs r0, #0x4d
	movs r1, #0
	bl SpriteLoadGfx
	b _080551F2
	.align 2, 0
_080551E0: .4byte gCurrentSprite
_080551E4:
	cmp r0, #8
	bne _080551F2
	movs r0, #0x4d
	movs r1, #0
	movs r2, #2
	bl SpriteLoadPal
_080551F2:
	ldr r1, _08055210 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	beq _08055200
	b _0805534A
_08055200:
	adds r0, r1, #0
	adds r0, #0x2d
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x64
	strb r0, [r2]
	b _0805534A
	.align 2, 0
_08055210: .4byte gCurrentSprite
_08055214:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _08055224
	subs r0, #1
	b _08055348
_08055224:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	bne _0805522E
	b _0805534A
_0805522E:
	ldr r0, _08055240 @ =gSubSpriteData1
	ldr r1, _08055244 @ =0x08396858
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #2
	b _08055348
	.align 2, 0
_08055240: .4byte gSubSpriteData1
_08055244: .4byte 0x08396858
_08055248:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	bne _08055252
	b _0805534A
_08055252:
	ldr r1, _08055278 @ =gSubSpriteData1
	ldr r0, _0805527C @ =0x08396870
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08055280 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2d
	movs r0, #3
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _08055284 @ =0x00000219
	bl SoundPlay
	b _0805534A
	.align 2, 0
_08055278: .4byte gSubSpriteData1
_0805527C: .4byte 0x08396870
_08055280: .4byte gCurrentSprite
_08055284: .4byte 0x00000219
_08055288:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _08055298
	subs r0, #1
	b _08055348
_08055298:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805534A
	ldr r0, _080552C0 @ =gSubSpriteData1
	ldr r1, _080552C4 @ =0x08396898
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #4
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0xc
	strb r0, [r1]
	bl OmegaMetroidSpawnSaX
	b _0805534A
	.align 2, 0
_080552C0: .4byte gSubSpriteData1
_080552C4: .4byte 0x08396898
_080552C8:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805534A
	ldr r1, _080552E8 @ =gSubSpriteData1
	ldr r0, _080552EC @ =0x08396758
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _080552F0 @ =gCurrentSprite
	adds r0, #0x2d
	movs r1, #5
	strb r1, [r0]
	b _0805534A
	.align 2, 0
_080552E8: .4byte gSubSpriteData1
_080552EC: .4byte 0x08396758
_080552F0: .4byte gCurrentSprite
_080552F4:
	adds r0, r5, #0
	adds r0, #0x30
	movs r4, #0
	strb r4, [r0]
	bl OmegaMetroidForwardMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805534A
	ldr r0, _0805531C @ =gSubSpriteData1
	ldr r1, _08055320 @ =0x083967C8
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #6
	b _08055348
	.align 2, 0
_0805531C: .4byte gSubSpriteData1
_08055320: .4byte 0x083967C8
_08055324:
	adds r0, r5, #0
	adds r0, #0x30
	movs r4, #0
	strb r4, [r0]
	bl OmegaMetroidStandingMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805534A
	ldr r0, _08055350 @ =gSubSpriteData1
	ldr r1, _08055354 @ =0x08396600
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0xb
_08055348:
	strb r0, [r1]
_0805534A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055350: .4byte gSubSpriteData1
_08055354: .4byte 0x08396600

	thumb_func_start OmegaMetroidWatchingSaX
OmegaMetroidWatchingSaX: @ 0x08055358
	push {lr}
	bl OmegaMetroidSaXIceBeamCollision
	ldr r2, _080553A0 @ =gSpriteData
	ldr r0, _080553A4 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x45
	bne _0805539A
	mov r1, ip
	adds r1, #0x24
	movs r3, #0
	movs r0, #0xc
	strb r0, [r1]
	ldr r1, _080553A8 @ =gSubSpriteData1
	ldr r0, _080553AC @ =0x08396628
	str r0, [r1]
	strb r3, [r1, #6]
	movs r2, #0
	strh r3, [r1, #4]
	mov r0, ip
	adds r0, #0x2e
	strb r2, [r0]
	ldr r0, _080553B0 @ =0x0000021A
	bl SoundPlay
_0805539A:
	pop {r0}
	bx r0
	.align 2, 0
_080553A0: .4byte gSpriteData
_080553A4: .4byte gCurrentSprite
_080553A8: .4byte gSubSpriteData1
_080553AC: .4byte 0x08396628
_080553B0: .4byte 0x0000021A

	thumb_func_start OmegaMetroidDamagedBySaX
OmegaMetroidDamagedBySaX: @ 0x080553B4
	push {r4, lr}
	bl OmegaMetroidSaXIceBeamCollision
	bl OmegaMetroidBodyBlinking
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _080553EE
	ldr r1, _080553F4 @ =gSubSpriteData1
	ldr r0, _080553F8 @ =0x083968B0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r2, _080553FC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #9
	strb r0, [r1]
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	adds r2, #0x2d
	strb r3, [r2]
_080553EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080553F4: .4byte gSubSpriteData1
_080553F8: .4byte 0x083968B0
_080553FC: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidWalkingBackwardsFromSaX
OmegaMetroidWalkingBackwardsFromSaX: @ 0x08055400
	push {r4, r5, r6, lr}
	bl OmegaMetroidSaXIceBeamCollision
	bl OmegaMetroidBodyBlinking
	ldr r5, _0805541C @ =gCurrentSprite
	adds r6, r5, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	cmp r4, #0
	beq _08055420
	cmp r4, #1
	beq _08055470
	b _08055490
	.align 2, 0
_0805541C: .4byte gCurrentSprite
_08055420:
	adds r0, r5, #0
	adds r0, #0x30
	strb r4, [r0]
	bl OmegaMetroidBackwardsMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08055490
	ldr r0, _08055460 @ =gSubSpriteData1
	ldr r1, _08055464 @ =0x08396908
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	ldrh r1, [r5]
	ldr r0, _08055468 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r5]
	movs r0, #1
	strb r0, [r6]
	ldr r2, _0805546C @ =gSpriteData
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x31
	movs r1, #0x1a
	strb r1, [r0]
	b _08055490
	.align 2, 0
_08055460: .4byte gSubSpriteData1
_08055464: .4byte 0x08396908
_08055468: .4byte 0x0000FDFF
_0805546C: .4byte gSpriteData
_08055470:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08055490
	ldr r1, _08055498 @ =gSubSpriteData1
	ldr r0, _0805549C @ =0x08396628
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	movs r0, #0x3c
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0xa
	strb r0, [r1]
_08055490:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055498: .4byte gSubSpriteData1
_0805549C: .4byte 0x08396628

	thumb_func_start OmegaMetroidDamagedBySaX2
OmegaMetroidDamagedBySaX2: @ 0x080554A0
	push {r4, r5, r6, lr}
	bl OmegaMetroidSaXIceBeamCollision
	bl OmegaMetroidBodyBlinking
	ldr r5, _080554D4 @ =gSubSpriteData1
	ldr r0, [r5, #4]
	ldr r1, _080554D8 @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _080554C0
	ldr r0, _080554DC @ =0x0000021A
	bl SoundPlay
_080554C0:
	ldr r6, _080554E0 @ =gCurrentSprite
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _080554E4
	subs r0, #1
	b _080554FA
	.align 2, 0
_080554D4: .4byte gSubSpriteData1
_080554D8: .4byte 0x00FFFFFF
_080554DC: .4byte 0x0000021A
_080554E0: .4byte gCurrentSprite
_080554E4:
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _080554FC
	ldr r0, _08055504 @ =0x083965D8
	str r0, [r5]
	strb r4, [r5, #6]
	strh r4, [r5, #4]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0xd
_080554FA:
	strb r0, [r1]
_080554FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055504: .4byte 0x083965D8

	thumb_func_start OmegaMetroidWaitingToSwipeSaX
OmegaMetroidWaitingToSwipeSaX: @ 0x08055508
	push {lr}
	bl OmegaMetroidSaXIceBeamCollision
	bl OmegaMetroidBodyBlinking
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08055536
	ldr r1, _0805553C @ =gSubSpriteData1
	ldr r0, _08055540 @ =0x08396918
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08055544 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0xe
	strb r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #2
	bl SoundPlay
_08055536:
	pop {r0}
	bx r0
	.align 2, 0
_0805553C: .4byte gSubSpriteData1
_08055540: .4byte 0x08396918
_08055544: .4byte gCurrentSprite

	thumb_func_start OmegaMEtroidSwipingSaX
OmegaMEtroidSwipingSaX: @ 0x08055548
	push {lr}
	bl OmegaMetroidSaXIceBeamCollision
	bl OmegaMetroidBodyBlinking
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805558C
	ldr r1, _08055580 @ =gSubSpriteData1
	ldr r0, _08055584 @ =0x08396660
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08055588 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0xf
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	b _080555DA
	.align 2, 0
_08055580: .4byte gSubSpriteData1
_08055584: .4byte 0x08396660
_08055588: .4byte gCurrentSprite
_0805558C:
	ldr r1, _080555A4 @ =gSubSpriteData1
	ldrh r0, [r1, #4]
	cmp r0, #2
	bne _080555AC
	ldrb r0, [r1, #6]
	cmp r0, #1
	bne _080555DA
	ldr r0, _080555A8 @ =0x00000221
	bl SoundPlay
	b _080555DA
	.align 2, 0
_080555A4: .4byte gSubSpriteData1
_080555A8: .4byte 0x00000221
_080555AC:
	cmp r0, #3
	bne _080555DA
	ldrb r0, [r1, #6]
	cmp r0, #1
	bne _080555DA
	ldr r2, _080555E0 @ =gSpriteData
	ldr r0, _080555E4 @ =gCurrentSprite
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	movs r1, #0x47
	strb r1, [r0]
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080555E8 @ =0x000002AF
	bl SoundPlay
_080555DA:
	pop {r0}
	bx r0
	.align 2, 0
_080555E0: .4byte gSpriteData
_080555E4: .4byte gCurrentSprite
_080555E8: .4byte 0x000002AF

	thumb_func_start OmegaMetroidKilledSaX
OmegaMetroidKilledSaX: @ 0x080555EC
	push {r4, lr}
	ldr r4, _08055648 @ =gSubSpriteData1
	ldr r0, [r4, #4]
	ldr r1, _0805564C @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _08055606
	movs r0, #0x89
	lsls r0, r0, #2
	bl SoundPlay
_08055606:
	bl EventCheckAfter_IceBeamRecovered
	cmp r0, #0
	beq _08055640
	ldr r0, _08055650 @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	movs r3, #0
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08055654 @ =0x08396858
	str r0, [r4]
	strb r3, [r4, #6]
	movs r1, #0
	strh r3, [r4, #4]
	mov r0, ip
	adds r0, #0x2d
	strb r1, [r0]
	movs r0, #0x32
	movs r1, #7
	bl PlayMusic
_08055640:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055648: .4byte gSubSpriteData1
_0805564C: .4byte 0x00FFFFFF
_08055650: .4byte gCurrentSprite
_08055654: .4byte 0x08396858

	thumb_func_start OmegaMetroidScreamingAfterIceBeamObtained
OmegaMetroidScreamingAfterIceBeamObtained: @ 0x08055658
	push {r4, r5, r6, lr}
	ldr r5, _08055674 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _08055678
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _080556F8
	.align 2, 0
_08055674: .4byte gCurrentSprite
_08055678:
	adds r6, r5, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	cmp r4, #0
	bne _080556B4
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _080556F8
	ldr r0, _080556A8 @ =gSubSpriteData1
	ldr r1, _080556AC @ =0x08396870
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	movs r0, #1
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _080556B0 @ =0x00000219
	bl SoundPlay
	b _080556F8
	.align 2, 0
_080556A8: .4byte gSubSpriteData1
_080556AC: .4byte 0x08396870
_080556B0: .4byte 0x00000219
_080556B4:
	cmp r4, #1
	bne _080556E4
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080556F8
	ldr r0, _080556DC @ =gSubSpriteData1
	ldr r1, _080556E0 @ =0x08396898
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	movs r0, #2
	strb r0, [r6]
	b _080556F8
	.align 2, 0
_080556DC: .4byte gSubSpriteData1
_080556E0: .4byte 0x08396898
_080556E4:
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _080556F8
	adds r0, r5, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x1f
	strb r1, [r0]
	strb r2, [r6]
_080556F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidWalkingBackwardsInit
OmegaMetroidWalkingBackwardsInit: @ 0x08055700
	push {r4, lr}
	ldr r3, _08055748 @ =gSubSpriteData1
	ldr r0, _0805574C @ =0x083968B0
	str r0, [r3]
	movs r0, #0
	strb r0, [r3, #6]
	strh r0, [r3, #4]
	ldr r2, _08055750 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x26
	strb r0, [r1]
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r3, #0xa]
	lsrs r1, r1, #2
	ldr r0, _08055754 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x78
	bhi _08055758
	ldrh r0, [r3, #0xc]
	cmp r0, #0
	beq _08055758
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #2
	b _0805575E
	.align 2, 0
_08055748: .4byte gSubSpriteData1
_0805574C: .4byte 0x083968B0
_08055750: .4byte gCurrentSprite
_08055754: .4byte gBg1XPosition
_08055758:
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #1
_0805575E:
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldr r2, _0805578C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	adds r2, r1, #0
	adds r2, #0x25
	ldrb r0, [r2]
	cmp r0, #0x15
	bne _08055786
	movs r0, #0x16
	strb r0, [r2]
	movs r0, #0x30
	strh r0, [r1, #0xc]
	movs r0, #0x40
	strh r0, [r1, #0x10]
_08055786:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805578C: .4byte gSpriteData

	thumb_func_start OmegaMetroidWalkingBackwards
OmegaMetroidWalkingBackwards: @ 0x08055790
	push {r4, r5, lr}
	ldr r4, _080557D4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x2d
	ldrb r0, [r5]
	cmp r0, #0
	beq _080557E4
	bl OmegaMetroidBackwardsMovement
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805583C
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805583C
	ldr r0, _080557D8 @ =gSubSpriteData1
	ldr r1, _080557DC @ =0x08396908
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	ldrh r1, [r4]
	ldr r0, _080557E0 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	b _0805583C
	.align 2, 0
_080557D4: .4byte gCurrentSprite
_080557D8: .4byte gSubSpriteData1
_080557DC: .4byte 0x08396908
_080557E0: .4byte 0x0000FDFF
_080557E4:
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0805583C
	ldr r2, _0805580C @ =gSubSpriteData1
	ldrh r1, [r2, #0xc]
	cmp r1, #0
	bne _08055814
	ldr r0, _08055810 @ =0x08396858
	str r0, [r2]
	strb r1, [r2, #6]
	movs r0, #0
	strh r1, [r2, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0x44
	b _0805583A
	.align 2, 0
_0805580C: .4byte gSubSpriteData1
_08055810: .4byte 0x08396858
_08055814:
	ldr r0, _08055830 @ =gSamusData
	ldrb r0, [r0, #0xc]
	cmp r0, #0x3f
	bhi _08055834
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08055834
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0805583A
	.align 2, 0
_08055830: .4byte gSamusData
_08055834:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x23
_0805583A:
	strb r0, [r1]
_0805583C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidDyingInit
OmegaMetroidDyingInit: @ 0x08055844
	push {r4, r5, lr}
	ldr r4, _08055884 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r5, #0
	movs r0, #1
	strb r0, [r1]
	bl OmegaMetroidFullBodyBlinking
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0805587C
	ldr r0, _08055888 @ =gSubSpriteData1
	ldr r1, _0805588C @ =0x08396870
	str r1, [r0]
	strb r5, [r0, #6]
	strh r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _08055890 @ =0x00000219
	bl SoundPlay
_0805587C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055884: .4byte gCurrentSprite
_08055888: .4byte gSubSpriteData1
_0805588C: .4byte 0x08396870
_08055890: .4byte 0x00000219

	thumb_func_start OmegaMetroidDying1
OmegaMetroidDying1: @ 0x08055894
	push {r4, lr}
	ldr r4, _080558D8 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl OmegaMetroidFullBodyBlinking
	adds r3, r4, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080558D2
	ldr r0, _080558DC @ =gSubSpriteData1
	ldr r1, _080558E0 @ =0x08396628
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x48
	strb r0, [r1]
	movs r0, #0x78
	strb r0, [r3]
	movs r0, #0
	bl FadeMusic
_080558D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080558D8: .4byte gCurrentSprite
_080558DC: .4byte gSubSpriteData1
_080558E0: .4byte 0x08396628

	thumb_func_start OmegaMetroidDying2
OmegaMetroidDying2: @ 0x080558E4
	push {r4, r5, lr}
	ldr r4, _08055914 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x26
	movs r2, #1
	strb r2, [r0]
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	subs r1, r0, #1
	strb r1, [r5]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bhi _08055918
	ands r1, r2
	cmp r1, #0
	beq _0805592A
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
	b _0805592A
	.align 2, 0
_08055914: .4byte gCurrentSprite
_08055918:
	bl OmegaMetroidFullBodyBlinking
	ldrb r0, [r5]
	cmp r0, #0x3c
	bne _0805592A
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
_0805592A:
	ldr r2, _08055968 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0805594A
	ldrh r1, [r2]
	movs r0, #4
	orrs r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4a
	strb r0, [r1]
	movs r0, #0x1d
	strb r0, [r3]
_0805594A:
	ldrh r4, [r2, #2]
	ldrh r5, [r2, #4]
	ldrb r0, [r3]
	cmp r0, #0x40
	beq _080559FE
	cmp r0, #0x40
	bgt _08055976
	cmp r0, #0x10
	beq _08055A4A
	cmp r0, #0x10
	bgt _0805596C
	cmp r0, #0
	bne _08055966
	b _08055A66
_08055966:
	b _08055A80
	.align 2, 0
_08055968: .4byte gCurrentSprite
_0805596C:
	cmp r0, #0x20
	beq _08055A32
	cmp r0, #0x30
	beq _08055A16
	b _08055A80
_08055976:
	cmp r0, #0x60
	beq _080559D0
	cmp r0, #0x60
	bgt _08055984
	cmp r0, #0x50
	beq _080559E8
	b _08055A80
_08055984:
	cmp r0, #0x6b
	beq _080559B2
	cmp r0, #0x76
	bne _08055A80
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x1c
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	adds r1, #0x34
	movs r2, #0x22
	bl ParticleSet
	movs r0, #0x87
	lsls r0, r0, #2
	bl SoundPlay_3b1c
	b _08055A80
_080559B2:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x4c
	movs r2, #0x25
	bl ParticleSet
	b _08055A80
_080559D0:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x58
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	adds r1, #0x20
	b _08055A5E
_080559E8:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	subs r1, #0x48
	movs r2, #0x21
	bl ParticleSet
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r4, #0
	b _08055A5E
_080559FE:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _08055A2A
_08055A16:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x1c
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x46
	adds r1, r5, #0
_08055A2A:
	movs r2, #0x22
	bl ParticleSet
	b _08055A80
_08055A32:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x58
	b _08055A5E
_08055A4A:
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	subs r1, #0x4c
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
_08055A5E:
	movs r2, #0x2f
	bl ParticleSet
	b _08055A80
_08055A66:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	subs r1, #0x2a
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r4, #0
	movs r2, #0x21
	bl ParticleSet
_08055A80:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidDying3
OmegaMetroidDying3: @ 0x08055A88
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _08055AB4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bhi _08055AB8
	ldrb r2, [r1]
	movs r0, #0xc4
	movs r1, #0
	bl SpriteLoadGfx
	b _08055AC6
	.align 2, 0
_08055AB4: .4byte gCurrentSprite
_08055AB8:
	cmp r0, #0x1c
	bne _08055AC6
	movs r0, #0xc4
	movs r1, #0
	movs r2, #7
	bl SpriteLoadPal
_08055AC6:
	ldr r5, _08055AFC @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r4, [r0]
	cmp r4, #0
	bne _08055AF4
	ldrh r1, [r5, #6]
	ldr r2, _08055B00 @ =0xFFFFFEC0
	adds r0, r2, #0
	ldrh r2, [r5, #8]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r1, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0xc4
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SpriteSpawnPrimary
	strh r4, [r5]
_08055AF4:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055AFC: .4byte gCurrentSprite
_08055B00: .4byte 0xFFFFFEC0

	thumb_func_start OmegaMetroidPartInit
OmegaMetroidPartInit: @ 0x08055B04
	push {r4, lr}
	ldr r4, _08055B44 @ =gCurrentSprite
	ldrh r1, [r4]
	ldr r0, _08055B48 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x16
	strb r0, [r1]
	subs r1, #1
	movs r0, #2
	strb r0, [r1]
	bl OmegaMetroidPartSetDrawOrder
	ldrb r0, [r4, #0x1e]
	cmp r0, #7
	bls _08055B3A
	b _08055CE0
_08055B3A:
	lsls r0, r0, #2
	ldr r1, _08055B4C @ =_08055B50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055B44: .4byte gCurrentSprite
_08055B48: .4byte 0x0000FFFB
_08055B4C: .4byte _08055B50
_08055B50: @ jump table
	.4byte _08055B70 @ case 0
	.4byte _08055B9C @ case 1
	.4byte _08055BD0 @ case 2
	.4byte _08055CE0 @ case 3
	.4byte _08055C04 @ case 4
	.4byte _08055C48 @ case 5
	.4byte _08055C7C @ case 6
	.4byte _08055CB0 @ case 7
_08055B70:
	ldr r2, _08055B94 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x28
	movs r1, #0x40
	strb r1, [r0]
	adds r3, r2, #0
	adds r3, #0x29
	movs r0, #0x28
	strb r0, [r3]
	ldr r0, _08055B98 @ =0x0000FFA0
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	adds r0, #0x38
	b _08055CD0
	.align 2, 0
_08055B94: .4byte gCurrentSprite
_08055B98: .4byte 0x0000FFA0
_08055B9C:
	ldr r2, _08055BC4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08055BC8 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r0, #0x40
	strh r0, [r2, #0xc]
	ldr r0, _08055BCC @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x20
	strh r0, [r2, #0x10]
	b _08055CE6
	.align 2, 0
_08055BC4: .4byte gCurrentSprite
_08055BC8: .4byte 0x0000FFC0
_08055BCC: .4byte 0x0000FFE0
_08055BD0:
	ldr r2, _08055BF8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #0x48
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	ldr r0, _08055BFC @ =0x0000FF20
	strh r0, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	ldr r0, _08055C00 @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x60
	strh r0, [r2, #0x10]
	b _08055CE6
	.align 2, 0
_08055BF8: .4byte gCurrentSprite
_08055BFC: .4byte 0x0000FF20
_08055C00: .4byte 0x0000FFE0
_08055C04:
	ldr r3, _08055C40 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #8
	strb r0, [r1]
	movs r2, #0
	ldr r1, _08055C44 @ =0x0000FFE0
	strh r1, [r3, #0xa]
	movs r0, #0x28
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	movs r0, #0x20
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	b _08055CE6
	.align 2, 0
_08055C40: .4byte gCurrentSprite
_08055C44: .4byte 0x0000FFE0
_08055C48:
	ldr r2, _08055C70 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08055C74 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x30
	strh r0, [r2, #0xc]
	ldr r0, _08055C78 @ =0x0000FFA0
	strh r0, [r2, #0xe]
	movs r0, #0x40
	strh r0, [r2, #0x10]
	b _08055CE6
	.align 2, 0
_08055C70: .4byte gCurrentSprite
_08055C74: .4byte 0x0000FFD8
_08055C78: .4byte 0x0000FFA0
_08055C7C:
	ldr r0, _08055CA8 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x27
	movs r3, #0
	movs r2, #0x20
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x28
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	ldr r0, _08055CAC @ =0x0000FFA0
	mov r1, ip
	strh r0, [r1, #0xa]
	strh r2, [r1, #0xc]
	strh r3, [r1, #0xe]
	movs r0, #0x80
	strh r0, [r1, #0x10]
	b _08055CE6
	.align 2, 0
_08055CA8: .4byte gCurrentSprite
_08055CAC: .4byte 0x0000FFA0
_08055CB0:
	ldr r2, _08055CD8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	ldr r0, _08055CDC @ =0x0000FF80
	strh r0, [r2, #0xa]
	movs r1, #4
	strh r1, [r2, #0xc]
	adds r0, #0x28
_08055CD0:
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	b _08055CE6
	.align 2, 0
_08055CD8: .4byte gCurrentSprite
_08055CDC: .4byte 0x0000FF80
_08055CE0:
	ldr r1, _08055CF0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08055CE6:
	bl OmagaMetroidSyncSubSPrites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055CF0: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidPartIdle
OmegaMetroidPartIdle: @ 0x08055CF4
	push {r4, r5, r6, lr}
	ldr r2, _08055D18 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r4, [r0]
	ldr r1, _08055D1C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r3, [r0]
	adds r0, r3, #0
	adds r6, r1, #0
	cmp r0, #0
	bne _08055D20
	strh r0, [r2]
	b _08055ED0
	.align 2, 0
_08055D18: .4byte gCurrentSprite
_08055D1C: .4byte gSpriteData
_08055D20:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08055D3A
	ldrh r0, [r2]
	movs r1, #4
	orrs r1, r0
	strh r1, [r2]
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _08055D42
_08055D3A:
	ldrh r1, [r2]
	ldr r0, _08055D74 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
_08055D42:
	lsls r1, r4, #3
	subs r0, r1, r4
	lsls r0, r0, #3
	adds r3, r0, r6
	ldrh r0, [r3, #0x14]
	adds r5, r1, #0
	cmp r0, #0
	bne _08055D5C
	strh r0, [r2, #0x14]
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
_08055D5C:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #8
	cmp r0, #0x42
	bls _08055D6A
	b _08055ED0
_08055D6A:
	lsls r0, r0, #2
	ldr r1, _08055D78 @ =_08055D7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055D74: .4byte 0x0000FFFB
_08055D78: .4byte _08055D7C
_08055D7C: @ jump table
	.4byte _08055E88 @ case 0
	.4byte _08055ED0 @ case 1
	.4byte _08055ED0 @ case 2
	.4byte _08055ED0 @ case 3
	.4byte _08055ED0 @ case 4
	.4byte _08055ED0 @ case 5
	.4byte _08055ED0 @ case 6
	.4byte _08055E9C @ case 7
	.4byte _08055ED0 @ case 8
	.4byte _08055ED0 @ case 9
	.4byte _08055ED0 @ case 10
	.4byte _08055ED0 @ case 11
	.4byte _08055ED0 @ case 12
	.4byte _08055ED0 @ case 13
	.4byte _08055ED0 @ case 14
	.4byte _08055ED0 @ case 15
	.4byte _08055ED0 @ case 16
	.4byte _08055ED0 @ case 17
	.4byte _08055ED0 @ case 18
	.4byte _08055ED0 @ case 19
	.4byte _08055ED0 @ case 20
	.4byte _08055ED0 @ case 21
	.4byte _08055ED0 @ case 22
	.4byte _08055ED0 @ case 23
	.4byte _08055ED0 @ case 24
	.4byte _08055ED0 @ case 25
	.4byte _08055ED0 @ case 26
	.4byte _08055ED0 @ case 27
	.4byte _08055ED0 @ case 28
	.4byte _08055ED0 @ case 29
	.4byte _08055ED0 @ case 30
	.4byte _08055ED0 @ case 31
	.4byte _08055ED0 @ case 32
	.4byte _08055ED0 @ case 33
	.4byte _08055ED0 @ case 34
	.4byte _08055ED0 @ case 35
	.4byte _08055ED0 @ case 36
	.4byte _08055ED0 @ case 37
	.4byte _08055ED0 @ case 38
	.4byte _08055ED0 @ case 39
	.4byte _08055ED0 @ case 40
	.4byte _08055ED0 @ case 41
	.4byte _08055ED0 @ case 42
	.4byte _08055ED0 @ case 43
	.4byte _08055ED0 @ case 44
	.4byte _08055ED0 @ case 45
	.4byte _08055ED0 @ case 46
	.4byte _08055EA2 @ case 47
	.4byte _08055EB0 @ case 48
	.4byte _08055ED0 @ case 49
	.4byte _08055ED0 @ case 50
	.4byte _08055ED0 @ case 51
	.4byte _08055ED0 @ case 52
	.4byte _08055ED0 @ case 53
	.4byte _08055ED0 @ case 54
	.4byte _08055ED0 @ case 55
	.4byte _08055ED0 @ case 56
	.4byte _08055ED0 @ case 57
	.4byte _08055ED0 @ case 58
	.4byte _08055ED0 @ case 59
	.4byte _08055EC0 @ case 60
	.4byte _08055ED0 @ case 61
	.4byte _08055EC0 @ case 62
	.4byte _08055ED0 @ case 63
	.4byte _08055EC0 @ case 64
	.4byte _08055ED0 @ case 65
	.4byte _08055EC0 @ case 66
_08055E88:
	subs r0, r5, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #4
	bne _08055ED0
	bl OmegaMetroidPartSetDrawOrder_2
	b _08055ED0
_08055E9C:
	bl OmegaMetroidPartSetDrawOrder
	b _08055ED0
_08055EA2:
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _08055ED0
_08055EB0:
	ldrh r1, [r2]
	ldr r0, _08055EBC @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	b _08055ED0
	.align 2, 0
_08055EBC: .4byte 0x0000DFFF
_08055EC0:
	subs r0, r5, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08055ED0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroid
OmegaMetroid: @ 0x08055ED8
	push {lr}
	bl OmegaMetroidUpdateHeartPalette
	bl OmegaMetroidUpdateHealthThreshold
	ldr r0, _08055EF8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4a
	bls _08055EEE
	b _0805610C
_08055EEE:
	lsls r0, r0, #2
	ldr r1, _08055EFC @ =_08055F00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055EF8: .4byte gCurrentSprite
_08055EFC: .4byte _08055F00
_08055F00: @ jump table
	.4byte _0805602C @ case 0
	.4byte _08056056 @ case 1
	.4byte _0805605A @ case 2
	.4byte _0805610C @ case 3
	.4byte _0805610C @ case 4
	.4byte _0805610C @ case 5
	.4byte _0805610C @ case 6
	.4byte _080560BC @ case 7
	.4byte _080560C0 @ case 8
	.4byte _080560D2 @ case 9
	.4byte _080560D8 @ case 10
	.4byte _080560C6 @ case 11
	.4byte _080560CC @ case 12
	.4byte _080560DE @ case 13
	.4byte _080560E4 @ case 14
	.4byte _080560EA @ case 15
	.4byte _080560F0 @ case 16
	.4byte _0805610C @ case 17
	.4byte _0805610C @ case 18
	.4byte _0805610C @ case 19
	.4byte _0805610C @ case 20
	.4byte _0805610C @ case 21
	.4byte _0805610C @ case 22
	.4byte _08056088 @ case 23
	.4byte _0805608C @ case 24
	.4byte _0805610C @ case 25
	.4byte _08056092 @ case 26
	.4byte _0805610C @ case 27
	.4byte _08056098 @ case 28
	.4byte _0805609E @ case 29
	.4byte _080560A2 @ case 30
	.4byte _08056074 @ case 31
	.4byte _08056078 @ case 32
	.4byte _08056060 @ case 33
	.4byte _08056064 @ case 34
	.4byte _0805606A @ case 35
	.4byte _0805606E @ case 36
	.4byte _0805607E @ case 37
	.4byte _08056082 @ case 38
	.4byte _0805610C @ case 39
	.4byte _0805610C @ case 40
	.4byte _080560A8 @ case 41
	.4byte _080560AC @ case 42
	.4byte _080560B2 @ case 43
	.4byte _080560B6 @ case 44
	.4byte _0805610C @ case 45
	.4byte _0805610C @ case 46
	.4byte _0805610C @ case 47
	.4byte _0805610C @ case 48
	.4byte _0805610C @ case 49
	.4byte _0805610C @ case 50
	.4byte _0805610C @ case 51
	.4byte _0805610C @ case 52
	.4byte _0805610C @ case 53
	.4byte _0805610C @ case 54
	.4byte _08056032 @ case 55
	.4byte _08056038 @ case 56
	.4byte _0805610C @ case 57
	.4byte _0805603E @ case 58
	.4byte _0805610C @ case 59
	.4byte _08056044 @ case 60
	.4byte _0805610C @ case 61
	.4byte _0805604A @ case 62
	.4byte _0805610C @ case 63
	.4byte _08056050 @ case 64
	.4byte _0805610C @ case 65
	.4byte _0805610C @ case 66
	.4byte _0805610C @ case 67
	.4byte _080560F6 @ case 68
	.4byte _0805610C @ case 69
	.4byte _080560FC @ case 70
	.4byte _0805610C @ case 71
	.4byte _08056102 @ case 72
	.4byte _0805610C @ case 73
	.4byte _08056108 @ case 74
_0805602C:
	bl OmegaMetroidInit
	b _0805610C
_08056032:
	bl OmegaMetroidWaitingToAppear
	b _0805610C
_08056038:
	bl OmegaMetroidFirstJump
	b _0805610C
_0805603E:
	bl OmegaMetroidLandingFromFirstJump
	b _0805610C
_08056044:
	bl OmegaMetroidLandedAfterFirstJump
	b _0805610C
_0805604A:
	bl OmegaMetroidScreamingAfterFirstJump
	b _0805610C
_08056050:
	bl OmegaMetroidFinishedScreamingAfterFirstJump
	b _0805610C
_08056056:
	bl OmegaMetroidWalkingBeforeSaXInit
_0805605A:
	bl OmegaMetroidWalkingBeforeSaX
	b _0805610C
_08056060:
	bl OmegaMetroidSlowWalkInit
_08056064:
	bl OmegaMetroidSlowWalk
	b _0805610C
_0805606A:
	bl OmegaMetroidWalkInit
_0805606E:
	bl OmegaMetroidWalk
	b _0805610C
_08056074:
	bl OmegaMetroidIdleInit
_08056078:
	bl OmegaMetroidIdle
	b _0805610C
_0805607E:
	bl OmegaMetroidWalkingBackwardsInit
_08056082:
	bl OmegaMetroidWalkingBackwards
	b _0805610C
_08056088:
	bl OmegaMetroidJumpWarningInit
_0805608C:
	bl OmegaMetroidJumpWarning
	b _0805610C
_08056092:
	bl OmegaMetroidJumping
	b _0805610C
_08056098:
	bl OmegaMEtroidFalling
	b _0805610C
_0805609E:
	bl OmegaMetroidLandingInit
_080560A2:
	bl OmegaMetroidLanding
	b _0805610C
_080560A8:
	bl OmegaMetroidSwipingInit
_080560AC:
	bl OmegaMetroidSwiping
	b _0805610C
_080560B2:
	bl OmegaMetroidVerticalJumpInit
_080560B6:
	bl OmegaMetroidVerticalJump
	b _0805610C
_080560BC:
	bl OmegaMetroidWaitingForSaXInit
_080560C0:
	bl OmegaMetroidWaitingForSaX
	b _0805610C
_080560C6:
	bl OmegaMetroidWatchingSaX
	b _0805610C
_080560CC:
	bl OmegaMetroidDamagedBySaX
	b _0805610C
_080560D2:
	bl OmegaMetroidWalkingBackwardsFromSaX
	b _0805610C
_080560D8:
	bl OmegaMetroidDamagedBySaX2
	b _0805610C
_080560DE:
	bl OmegaMetroidWaitingToSwipeSaX
	b _0805610C
_080560E4:
	bl OmegaMEtroidSwipingSaX
	b _0805610C
_080560EA:
	bl OmegaMetroidKilledSaX
	b _0805610C
_080560F0:
	bl OmegaMetroidScreamingAfterIceBeamObtained
	b _0805610C
_080560F6:
	bl OmegaMetroidDyingInit
	b _0805610C
_080560FC:
	bl OmegaMetroidDying1
	b _0805610C
_08056102:
	bl OmegaMetroidDying2
	b _0805610C
_08056108:
	bl OmegaMetroidDying3
_0805610C:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl OmagaMetroidSyncSubSPrites
	bl OmegaMetroidUpdatePalette
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidPart
OmegaMetroidPart: @ 0x0805611C
	push {lr}
	ldr r0, _08056130 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08056134
	bl OmegaMetroidPartInit
	b _0805613C
	.align 2, 0
_08056130: .4byte gCurrentSprite
_08056134:
	bl OmegaMetroidPartIdle
	bl OmagaMetroidSyncSubSPrites
_0805613C:
	pop {r0}
	bx r0
