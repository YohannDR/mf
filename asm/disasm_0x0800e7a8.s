    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start UpdateSpriteRandomNumber
UpdateSpriteRandomNumber: @ 0x0800E7A8
	lsls r0, r0, #0x18
	ldr r1, _0800E7D4 @ =gFrameCounter8Bit
	lsrs r0, r0, #0x18
	ldrb r1, [r1]
	adds r0, r0, r1
	ldr r1, _0800E7D8 @ =gFrameCounter16Bit
	ldrh r1, [r1]
	lsrs r1, r1, #4
	adds r0, r0, r1
	ldr r2, _0800E7DC @ =gCurrentSprite
	ldrh r1, [r2, #4]
	ldrh r2, [r2, #2]
	adds r1, r1, r2
	adds r0, r0, r1
	ldr r3, _0800E7E0 @ =gFrameCounter8Bit
	ldr r2, _0800E7E4 @ =0x082E491C
	movs r1, #0x1f
	ands r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	bx lr
	.align 2, 0
_0800E7D4: .4byte gFrameCounter8Bit
_0800E7D8: .4byte gFrameCounter16Bit
_0800E7DC: .4byte gCurrentSprite
_0800E7E0: .4byte gSpriteRandomNumber
_0800E7E4: .4byte 0x082E491C

	thumb_func_start SpriteUpdate
SpriteUpdate: @ 0x0800E7E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800E858 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	beq _0800E7FA
	b _0800E970
_0800E7FA:
	bl CallUpdateSpriteDebris
	bl SpriteUtilCheckStopSpritesPose
	cmp r0, #0
	bne _0800E8B0
	bl SpriteUtilSamusAndSpriteCollision
	movs r5, #0
	ldr r7, _0800E85C @ =gSpriteData
_0800E80E:
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r3, r0, r7
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _0800E89C
	ldr r4, _0800E860 @ =gCurrentSprite
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #0x38
	bl memcpy
	adds r0, r5, #0
	bl UpdateSpriteRandomNumber
	bl SpriteUtilUpdateStunTimer
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800E868
	ldr r0, _0800E864 @ =0x0879ABD0
	ldrb r1, [r4, #0x1d]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0800E876
	.align 2, 0
_0800E858: .4byte gSubGameMode1
_0800E85C: .4byte gSpriteData
_0800E860: .4byte gCurrentSprite
_0800E864: .4byte 0x0879ABD0
_0800E868:
	ldr r0, _0800E8A8 @ =0x0879A29C
	ldrb r1, [r4, #0x1d]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0800E876:
	ldr r4, _0800E8AC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E88E
	bl SpriteUtilSamusStandingOnSprite
	bl UpdateCurrentSpriteAnimation
	bl SpriteCheckOnScreen
_0800E88E:
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	adds r1, r4, #0
	movs r2, #0x38
	bl memcpy
_0800E89C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _0800E80E
	b _0800EAAA
	.align 2, 0
_0800E8A8: .4byte 0x0879A29C
_0800E8AC: .4byte gCurrentSprite
_0800E8B0:
	movs r5, #0
	ldr r0, _0800E91C @ =gSpriteData
	mov r8, r0
	movs r7, #1
_0800E8B8:
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	mov r1, r8
	adds r3, r0, r1
	ldrh r1, [r3]
	adds r0, r7, #0
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _0800E95C
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800E8E6
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0800E95C
_0800E8E6:
	ldr r4, _0800E920 @ =gCurrentSprite
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #0x38
	bl memcpy
	adds r0, r5, #0
	bl UpdateSpriteRandomNumber
	bl SpriteUtilUpdateStunTimer
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800E928
	ldr r0, _0800E924 @ =0x0879ABD0
	ldrb r1, [r4, #0x1d]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0800E936
	.align 2, 0
_0800E91C: .4byte gSpriteData
_0800E920: .4byte gCurrentSprite
_0800E924: .4byte 0x0879ABD0
_0800E928:
	ldr r0, _0800E968 @ =0x0879A29C
	ldrb r1, [r4, #0x1d]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0800E936:
	ldr r4, _0800E96C @ =gCurrentSprite
	ldrh r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0800E94E
	bl SpriteUtilSamusStandingOnSprite
	bl UpdateCurrentSpriteAnimation
	bl SpriteCheckOnScreen
_0800E94E:
	subs r0, r6, r5
	lsls r0, r0, #3
	add r0, r8
	adds r1, r4, #0
	movs r2, #0x38
	bl memcpy
_0800E95C:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _0800E8B8
	b _0800EAAA
	.align 2, 0
_0800E968: .4byte 0x0879A29C
_0800E96C: .4byte gCurrentSprite
_0800E970:
	cmp r0, #6
	bne _0800EA14
	movs r5, #0
	ldr r7, _0800E9C0 @ =gSpriteData
_0800E978:
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r3, r0, r7
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _0800EA00
	ldr r4, _0800E9C4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #0x38
	bl memcpy
	adds r0, r5, #0
	bl UpdateSpriteRandomNumber
	bl SpriteUtilUpdateStunTimer
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800E9CC
	ldr r0, _0800E9C8 @ =0x0879ABD0
	ldrb r1, [r4, #0x1d]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0800E9DA
	.align 2, 0
_0800E9C0: .4byte gSpriteData
_0800E9C4: .4byte gCurrentSprite
_0800E9C8: .4byte 0x0879ABD0
_0800E9CC:
	ldr r0, _0800EA0C @ =0x0879A29C
	ldrb r1, [r4, #0x1d]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0800E9DA:
	ldr r4, _0800EA10 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E9F2
	bl SpriteUtilSamusStandingOnSprite
	bl UpdateCurrentSpriteAnimation
	bl SpriteCheckOnScreen
_0800E9F2:
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	adds r1, r4, #0
	movs r2, #0x38
	bl memcpy
_0800EA00:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _0800E978
	b _0800EAAA
	.align 2, 0
_0800EA0C: .4byte 0x0879A29C
_0800EA10: .4byte gCurrentSprite
_0800EA14:
	movs r5, #0
	ldr r7, _0800EA68 @ =gSpriteData
_0800EA18:
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r3, r0, r7
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	beq _0800EAA0
	ldr r4, _0800EA6C @ =gCurrentSprite
	adds r0, r4, #0
	adds r1, r3, #0
	movs r2, #0x38
	bl memcpy
	adds r0, r5, #0
	bl UpdateSpriteRandomNumber
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800EA82
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800EA74
	ldr r0, _0800EA70 @ =0x0879ABD0
	ldrb r1, [r4, #0x1d]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
	b _0800EA82
	.align 2, 0
_0800EA68: .4byte gSpriteData
_0800EA6C: .4byte gCurrentSprite
_0800EA70: .4byte 0x0879ABD0
_0800EA74:
	ldr r0, _0800EAB4 @ =0x0879A29C
	ldrb r1, [r4, #0x1d]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	bl _call_via_r0
_0800EA82:
	ldr r4, _0800EAB8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800EA92
	bl SpriteCheckOnScreen
_0800EA92:
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	adds r1, r4, #0
	movs r2, #0x38
	bl memcpy
_0800EAA0:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _0800EA18
_0800EAAA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EAB4: .4byte 0x0879A29C
_0800EAB8: .4byte gCurrentSprite

	thumb_func_start UpdateCurrentSpriteAnimation
UpdateCurrentSpriteAnimation: @ 0x0800EABC
	push {lr}
	ldr r2, _0800EB00 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _0800EAFA
	ldrb r0, [r2, #0x1c]
	adds r0, #1
	strb r0, [r2, #0x1c]
	ldrh r1, [r2, #0x16]
	ldr r3, [r2, #0x18]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrb r1, [r1, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhs _0800EAFA
	movs r0, #1
	strb r0, [r2, #0x1c]
	ldrh r0, [r2, #0x16]
	adds r0, #1
	strh r0, [r2, #0x16]
	ldrh r0, [r2, #0x16]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0800EAFA
	strh r0, [r2, #0x16]
_0800EAFA:
	pop {r0}
	bx r0
	.align 2, 0
_0800EB00: .4byte gCurrentSprite

	thumb_func_start unk_eb04
unk_eb04: @ 0x0800EB04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0800EB38 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _0800EB8A
	ldr r7, _0800EB3C @ =0x00002017
	movs r6, #0x13
	ldr r0, _0800EB40 @ =gSpriteData
	movs r4, #0
	ldr r1, _0800EB44 @ =gSpriteDrawOrder
	adds r3, r0, #0
	adds r3, #0x22
	adds r2, r0, #0
	movs r5, #0x17
_0800EB26:
	ldrh r0, [r2]
	ands r0, r7
	cmp r0, r6
	bne _0800EB48
	ldrb r0, [r3]
	cmp r0, #8
	bhi _0800EB48
	strb r0, [r1]
	b _0800EB4A
	.align 2, 0
_0800EB38: .4byte gSubGameMode1
_0800EB3C: .4byte 0x00002017
_0800EB40: .4byte gSpriteData
_0800EB44: .4byte gSpriteDrawOrder
_0800EB48:
	strb r4, [r1]
_0800EB4A:
	adds r1, #1
	adds r3, #0x38
	adds r2, #0x38
	subs r5, #1
	cmp r5, #0
	bge _0800EB26
	movs r6, #1
	ldr r0, _0800EB94 @ =gSpriteData
	mov r8, r0
_0800EB5C:
	movs r5, #0
	adds r7, r6, #1
	mov r4, r8
_0800EB62:
	ldr r0, _0800EB98 @ =gSpriteDrawOrder
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, r6
	bne _0800EB7C
	ldr r0, _0800EB9C @ =gCurrentSprite
	adds r1, r4, #0
	movs r2, #0x38
	bl memcpy
	adds r0, r5, #0
	bl DrawSprite
_0800EB7C:
	adds r4, #0x38
	adds r5, #1
	cmp r5, #0x17
	ble _0800EB62
	adds r6, r7, #0
	cmp r6, #8
	ble _0800EB5C
_0800EB8A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EB94: .4byte gSpriteData
_0800EB98: .4byte gSpriteDrawOrder
_0800EB9C: .4byte gCurrentSprite

	thumb_func_start SpriteDrawAll
SpriteDrawAll: @ 0x0800EBA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0800EBD4 @ =0x00002017
	movs r6, #3
	bl CallDrawSpriteDebris
	bl SA_XUpdateGFXAndDraw
	ldr r0, _0800EBD8 @ =gSpriteData
	movs r4, #0
	ldr r1, _0800EBDC @ =gSpriteDrawOrder
	adds r3, r0, #0
	adds r3, #0x22
	adds r2, r0, #0
	movs r5, #0x17
_0800EBC0:
	ldrh r0, [r2]
	ands r0, r7
	cmp r0, r6
	bne _0800EBE0
	ldrb r0, [r3]
	cmp r0, #8
	bhi _0800EBE0
	strb r0, [r1]
	b _0800EBE2
	.align 2, 0
_0800EBD4: .4byte 0x00002017
_0800EBD8: .4byte gSpriteData
_0800EBDC: .4byte gSpriteDrawOrder
_0800EBE0:
	strb r4, [r1]
_0800EBE2:
	adds r1, #1
	adds r3, #0x38
	adds r2, #0x38
	subs r5, #1
	cmp r5, #0
	bge _0800EBC0
	movs r6, #1
	ldr r0, _0800EC2C @ =gSpriteData
	mov r8, r0
_0800EBF4:
	movs r5, #0
	adds r7, r6, #1
	mov r4, r8
_0800EBFA:
	ldr r0, _0800EC30 @ =gSpriteDrawOrder
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, r6
	bne _0800EC14
	ldr r0, _0800EC34 @ =gCurrentSprite
	adds r1, r4, #0
	movs r2, #0x38
	bl memcpy
	adds r0, r5, #0
	bl DrawSprite
_0800EC14:
	adds r4, #0x38
	adds r5, #1
	cmp r5, #0x17
	ble _0800EBFA
	adds r6, r7, #0
	cmp r6, #8
	ble _0800EBF4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800EC2C: .4byte gSpriteData
_0800EC30: .4byte gSpriteDrawOrder
_0800EC34: .4byte gCurrentSprite

	thumb_func_start unk_ec38
unk_ec38: @ 0x0800EC38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r7, _0800EC64 @ =0x00002017
	movs r6, #3
	ldr r0, _0800EC68 @ =gSpriteData
	movs r4, #0
	ldr r1, _0800EC6C @ =gSpriteDrawOrder
	adds r3, r0, #0
	adds r3, #0x22
	adds r2, r0, #0
	movs r5, #0x17
_0800EC50:
	ldrh r0, [r2]
	ands r0, r7
	cmp r0, r6
	bne _0800EC70
	ldrb r0, [r3]
	cmp r0, #8
	bls _0800EC70
	strb r0, [r1]
	b _0800EC72
	.align 2, 0
_0800EC64: .4byte 0x00002017
_0800EC68: .4byte gSpriteData
_0800EC6C: .4byte gSpriteDrawOrder
_0800EC70:
	strb r4, [r1]
_0800EC72:
	adds r1, #1
	adds r3, #0x38
	adds r2, #0x38
	subs r5, #1
	cmp r5, #0
	bge _0800EC50
	movs r6, #9
	ldr r0, _0800ECBC @ =gSpriteData
	mov r8, r0
_0800EC84:
	movs r5, #0
	adds r7, r6, #1
	mov r4, r8
_0800EC8A:
	ldr r0, _0800ECC0 @ =gSpriteDrawOrder
	adds r0, r5, r0
	ldrb r0, [r0]
	cmp r0, r6
	bne _0800ECA4
	ldr r0, _0800ECC4 @ =gCurrentSprite
	adds r1, r4, #0
	movs r2, #0x38
	bl memcpy
	adds r0, r5, #0
	bl DrawSprite
_0800ECA4:
	adds r4, #0x38
	adds r5, #1
	cmp r5, #0x17
	ble _0800EC8A
	adds r6, r7, #0
	cmp r6, #0x10
	ble _0800EC84
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800ECBC: .4byte gSpriteData
_0800ECC0: .4byte gSpriteDrawOrder
_0800ECC4: .4byte gCurrentSprite

	thumb_func_start DrawSprite
DrawSprite: @ 0x0800ECC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp]
	ldr r2, _0800EED4 @ =gNextOamSlot
	ldrb r4, [r2]
	ldr r3, _0800EED8 @ =gCurrentSprite
	ldrh r0, [r3, #0x16]
	ldr r1, [r3, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	ldrh r0, [r0]
	str r0, [sp, #8]
	movs r1, #2
	add sb, r1
	adds r0, r0, r4
	mov sl, r3
	cmp r0, #0x7f
	ble _0800ECFC
	bl _0800F532
_0800ECFC:
	lsls r1, r4, #3
	ldr r0, _0800EEDC @ =gOamData
	adds r1, r1, r0
	mov r8, r1
	ldrh r1, [r3, #2]
	lsrs r1, r1, #2
	ldr r0, _0800EEE0 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x34]
	ldrh r1, [r3, #4]
	lsrs r1, r1, #2
	ldr r0, _0800EEE4 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x30]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x20]
	ldrb r1, [r3, #0x1f]
	mov r0, sl
	adds r0, #0x20
	ldrb r0, [r0]
	adds r0, r1, r0
	str r0, [sp, #0x28]
	lsls r1, r1, #6
	str r1, [sp, #0x2c]
	mov r0, sl
	adds r0, #0x21
	ldrb r0, [r0]
	str r0, [sp, #0x24]
	ldr r0, _0800EEE8 @ =0x0300001A
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800ED8A
	ldr r2, [sp, #0x24]
	cmp r2, #0
	beq _0800ED8A
	subs r2, #1
	str r2, [sp, #0x24]
_0800ED8A:
	mov r2, sl
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800EDA2
	ldrh r3, [r2, #2]
	str r3, [sp, #0x34]
	ldrh r6, [r2, #4]
	str r6, [sp, #0x30]
_0800EDA2:
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800EDAE
	b _0800F0BC
_0800EDAE:
	ldr r0, [sp, #8]
	adds r0, r0, r4
	str r0, [sp, #0x44]
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _0800EDBC
	b _0800EF64
_0800EDBC:
	ldr r1, _0800EEDC @ =gOamData
	movs r5, #1
	lsls r0, r4, #3
	adds r4, r0, r1
	ldr r2, [sp, #0x24]
	movs r3, #3
	ands r2, r3
	lsls r6, r2, #2
	str r6, [sp, #0x40]
	ldr r0, [sp, #8]
	str r0, [sp, #4]
_0800EDD2:
	mov r1, sb
	ldrh r6, [r1]
	movs r2, #2
	add sb, r2
	mov r3, r8
	strh r6, [r3]
	add r8, r2
	mov r0, sb
	ldrh r7, [r0]
	add sb, r2
	mov r1, r8
	strh r7, [r1]
	add r8, r2
	mov r2, sb
	ldrh r0, [r2]
	mov r3, r8
	strh r0, [r3]
	movs r0, #2
	add sb, r0
	add r8, r0
	ldr r1, [sp, #0x34]
	adds r0, r6, r1
	strb r0, [r4]
	ldr r2, [sp, #0x30]
	adds r1, r7, r2
	ldr r3, _0800EEEC @ =0x000001FF
	ands r1, r3
	ldrh r2, [r4, #2]
	ldr r0, _0800EEF0 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	ldr r1, [sp, #0x40]
	orrs r0, r1
	lsrs r2, r0, #4
	ldr r3, [sp, #0x28]
	adds r2, r2, r3
	lsls r2, r2, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
	ldrh r2, [r4, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldr r0, [sp, #0x2c]
	adds r1, r1, r0
	ldr r3, _0800EEF4 @ =0x000003FF
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0800EEF8 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #4]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0800EE88
	ldrb r2, [r4, #3]
	lsls r0, r2, #0x1b
	lsrs r0, r0, #0x1f
	eors r0, r5
	ands r0, r5
	lsls r0, r0, #4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #3]
	ldrb r0, [r4, #1]
	lsrs r3, r0, #6
	lsrs r2, r1, #6
	lsls r0, r3, #2
	adds r0, r2, r0
	ldr r1, _0800EEFC @ =0x082E4904
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r7, r1
	ldr r2, [sp, #0x30]
	subs r1, r2, r1
	ldr r3, _0800EEEC @ =0x000001FF
	ands r1, r3
	ldrh r2, [r4, #2]
	ldr r0, _0800EEF0 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
_0800EE88:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0800EEBE
	ldrb r2, [r4, #3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1f
	eors r0, r5
	ands r0, r5
	lsls r0, r0, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #3]
	ldrb r0, [r4, #1]
	lsrs r3, r0, #6
	lsrs r2, r1, #6
	lsls r0, r3, #2
	adds r0, r2, r0
	ldr r1, _0800EF00 @ =0x082E4910
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r6, r0
	ldr r2, [sp, #0x34]
	subs r0, r2, r0
	strb r0, [r4]
_0800EEBE:
	mov r3, ip
	cmp r3, #0
	beq _0800EF44
	ldr r6, [sp, #0x18]
	cmp r6, #0
	beq _0800EF04
	ldrb r0, [r4, #1]
	movs r1, #3
	orrs r0, r1
	b _0800EF0E
	.align 2, 0
_0800EED4: .4byte gNextOamSlot
_0800EED8: .4byte gCurrentSprite
_0800EEDC: .4byte gOamData
_0800EEE0: .4byte gBg1YPosition
_0800EEE4: .4byte gBg1XPosition
_0800EEE8: .4byte 0x0300001A
_0800EEEC: .4byte 0x000001FF
_0800EEF0: .4byte 0xFFFFFE00
_0800EEF4: .4byte 0x000003FF
_0800EEF8: .4byte 0xFFFFFC00
_0800EEFC: .4byte 0x082E4904
_0800EF00: .4byte 0x082E4910
_0800EF04:
	ldrb r1, [r4, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r5
_0800EF0E:
	strb r0, [r4, #1]
	ldr r2, [sp]
	asrs r0, r2, #4
	ands r0, r5
	lsls r0, r0, #5
	ldrb r2, [r4, #3]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	ldr r3, [sp]
	asrs r0, r3, #3
	ands r0, r5
	lsls r0, r0, #4
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r1, r6
	orrs r1, r0
	movs r0, #7
	adds r2, r3, #0
	ands r2, r0
	lsls r2, r2, #1
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r1, r0
	orrs r1, r2
	strb r1, [r4, #3]
_0800EF44:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0800EF52
	ldrb r0, [r4, #1]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
_0800EF52:
	movs r1, #2
	add r8, r1
	adds r4, #8
	ldr r2, [sp, #4]
	subs r2, #1
	str r2, [sp, #4]
	cmp r2, #0
	beq _0800EF64
	b _0800EDD2
_0800EF64:
	add r3, sp, #0x44
	ldrb r4, [r3]
	ldr r3, _0800EFF4 @ =gNextOamSlot
	strb r4, [r3]
	mov r4, ip
	cmp r4, #0
	bne _0800EF74
	b _0800F532
_0800EF74:
	mov r0, sl
	adds r0, #0x2b
	ldrb r0, [r0]
	str r0, [sp, #0x38]
	mov r6, sl
	ldrh r6, [r6, #0x12]
	str r6, [sp, #0x3c]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0800F000
	ldr r5, _0800EFF8 @ =0x080A4FA4
	ldr r1, [sp, #0x38]
	adds r1, #0x40
	mov sb, r1
	lsls r0, r1, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r6, [r0, r2]
	ldr r3, [sp, #0x3c]
	rsbs r4, r3, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl FixedMultiplication
	ldr r6, _0800EFFC @ =gOamData
	mov r8, r6
	ldr r2, [sp]
	lsls r1, r2, #5
	add r1, r8
	strh r0, [r1, #6]
	ldr r3, [sp, #0x38]
	lsls r6, r3, #1
	adds r5, r6, r5
	movs r0, #0
	ldrsh r5, [r5, r0]
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl FixedMultiplication
	ldr r1, [sp]
	lsls r2, r1, #2
	adds r1, r2, #1
	lsls r1, r1, #3
	add r1, r8
	strh r0, [r1, #6]
	mov sl, sb
	adds r5, r6, #0
	adds r7, r2, #0
	ldr r2, [sp, #0x3c]
	lsls r1, r2, #0x10
	b _0800F062
	.align 2, 0
_0800EFF4: .4byte gNextOamSlot
_0800EFF8: .4byte 0x080A4FA4
_0800EFFC: .4byte gOamData
_0800F000:
	ldr r4, _0800F0B4 @ =0x080A4FA4
	ldr r3, [sp, #0x38]
	adds r3, #0x40
	mov sl, r3
	lsls r0, r3, #1
	adds r0, r0, r4
	movs r6, #0
	ldrsh r5, [r0, r6]
	ldr r0, [sp, #0x3c]
	lsls r0, r0, #0x10
	mov sb, r0
	asrs r6, r0, #0x10
	adds r0, r6, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl FixedMultiplication
	ldr r1, _0800F0B8 @ =gOamData
	mov r8, r1
	ldr r2, [sp]
	lsls r1, r2, #5
	add r1, r8
	strh r0, [r1, #6]
	ldr r3, [sp, #0x38]
	lsls r5, r3, #1
	adds r4, r5, r4
	movs r0, #0
	ldrsh r4, [r4, r0]
	adds r0, r6, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	ldr r1, [sp]
	lsls r2, r1, #2
	adds r1, r2, #1
	lsls r1, r1, #3
	add r1, r8
	strh r0, [r1, #6]
	adds r7, r2, #0
	mov r1, sb
_0800F062:
	ldr r2, _0800F0B4 @ =0x080A4FA4
	mov r8, r2
	adds r0, r5, r2
	ldrh r4, [r0]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	asrs r5, r1, #0x10
	adds r0, r5, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	ldr r6, _0800F0B8 @ =gOamData
	adds r1, r7, #2
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	mov r3, sl
	lsls r0, r3, #1
	add r0, r8
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r0, r5, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #3
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	b _0800F532
	.align 2, 0
_0800F0B4: .4byte 0x080A4FA4
_0800F0B8: .4byte gOamData
_0800F0BC:
	mov r0, sl
	adds r0, #0x2b
	ldrb r0, [r0]
	str r0, [sp, #0x38]
	mov r2, sl
	ldrh r2, [r2, #0x12]
	str r2, [sp, #0x3c]
	ldr r0, [sp, #0x34]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x30]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	movs r3, #0
	str r3, [sp, #4]
	ldr r6, [sp, #8]
	adds r6, r6, r4
	str r6, [sp, #0x44]
	ldr r0, [sp, #8]
	cmp r3, r0
	blt _0800F0F0
	b _0800F388
_0800F0F0:
	ldr r1, _0800F25C @ =gOamData
	lsls r0, r4, #3
	adds r5, r0, r1
_0800F0F6:
	mov r1, sb
	ldrh r6, [r1]
	movs r2, #2
	add sb, r2
	mov r3, r8
	strh r6, [r3]
	add r8, r2
	mov r4, sb
	ldrh r7, [r4]
	add sb, r2
	mov r0, r8
	strh r7, [r0]
	add r8, r2
	mov r1, sb
	ldrh r0, [r1]
	mov r2, r8
	strh r0, [r2]
	movs r3, #2
	add sb, r3
	add r8, r3
	movs r0, #3
	ldr r1, [sp, #0x24]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r5, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	lsrs r2, r0, #4
	ldr r4, [sp, #0x28]
	adds r2, r2, r4
	lsls r2, r2, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #5]
	ldrh r2, [r5, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldr r0, [sp, #0x2c]
	adds r1, r1, r0
	ldr r3, _0800F260 @ =0x000003FF
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0800F264 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #4]
	ldrb r0, [r5, #1]
	lsrs r3, r0, #6
	ldrb r0, [r5, #3]
	lsrs r2, r0, #6
	lsls r1, r3, #2
	adds r1, r2, r1
	ldr r4, _0800F268 @ =0x082E4910
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	mov ip, r0
	str r0, [sp, #0xc]
	ldr r2, _0800F26C @ =0x082E4904
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #2
	mov sl, r1
	mov r3, sl
	str r3, [sp, #0x10]
	ldr r4, [sp, #0x34]
	adds r3, r6, r4
	movs r0, #0xff
	ands r3, r0
	ldr r6, [sp, #0x30]
	adds r4, r7, r6
	ldr r1, _0800F270 @ =0x000001FF
	adds r0, r1, #0
	ands r4, r0
	ldr r2, [sp, #0x34]
	subs r0, r3, r2
	add r0, ip
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	subs r0, r4, r6
	add r0, sl
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r6, [sp, #0x3c]
	adds r0, r1, #0
	muls r0, r6, r0
	cmp r0, #0
	bge _0800F1AE
	adds r0, #0xff
_0800F1AE:
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	ldr r1, [sp, #0x3c]
	adds r2, r0, #0
	muls r2, r1, r2
	cmp r2, #0
	bge _0800F1C6
	adds r2, #0xff
_0800F1C6:
	asrs r2, r2, #8
	subs r2, r2, r0
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, [sp, #0x30]
	subs r0, r4, r2
	add r0, sl
	ldr r4, [sp, #0x34]
	subs r1, r3, r4
	add r1, ip
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldr r0, [sp, #0x38]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r6, _0800F274 @ =0x080A4FA4
	adds r0, r0, r6
	movs r2, #0
	ldrsh r6, [r0, r2]
	adds r2, r7, #0
	muls r2, r6, r2
	lsls r1, r1, #0x10
	asrs r3, r1, #0x10
	ldr r4, [sp, #0x38]
	lsls r0, r4, #1
	ldr r1, _0800F274 @ =0x080A4FA4
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	adds r0, r3, #0
	muls r0, r1, r0
	subs r0, r2, r0
	cmp r0, #0
	bge _0800F224
	adds r0, #0xff
_0800F224:
	lsls r0, r0, #8
	lsrs r4, r0, #0x10
	muls r1, r7, r1
	adds r0, r3, #0
	muls r0, r6, r0
	adds r0, r1, r0
	cmp r0, #0
	bge _0800F236
	adds r0, #0xff
_0800F236:
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	ldr r6, [sp, #0x18]
	cmp r6, #0
	beq _0800F278
	mov r0, sl
	lsls r1, r0, #1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r2, ip
	lsls r1, r2, #1
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	subs r0, r0, r1
	b _0800F28C
	.align 2, 0
_0800F25C: .4byte gOamData
_0800F260: .4byte 0x000003FF
_0800F264: .4byte 0xFFFFFC00
_0800F268: .4byte 0x082E4910
_0800F26C: .4byte 0x082E4904
_0800F270: .4byte 0x000001FF
_0800F274: .4byte 0x080A4FA4
_0800F278:
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	ldr r4, [sp, #0x10]
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	ldr r6, [sp, #0xc]
	subs r0, r0, r6
_0800F28C:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r1, [sp, #0x34]
	adds r0, r3, r1
	subs r0, #0x40
	strb r0, [r5]
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r2, [sp, #0x30]
	adds r1, r1, r2
	subs r1, #0x40
	ldr r0, _0800F2C0 @ =0x000001FF
	ands r1, r0
	ldrh r2, [r5, #2]
	ldr r0, _0800F2C4 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #2]
	ldr r3, [sp, #0x18]
	cmp r3, #0
	beq _0800F2C8
	ldrb r0, [r5, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #1]
	b _0800F2D6
	.align 2, 0
_0800F2C0: .4byte 0x000001FF
_0800F2C4: .4byte 0xFFFFFE00
_0800F2C8:
	ldrb r0, [r5, #1]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r5, #1]
_0800F2D6:
	ldr r4, [sp, #0x1c]
	cmp r4, #0
	beq _0800F32A
	ldrb r1, [r5, #3]
	lsls r0, r1, #0x1b
	cmp r0, #0
	bge _0800F318
	ldrh r2, [r5, #2]
	lsls r1, r2, #0x17
	lsrs r1, r1, #0x17
	subs r1, #1
	ldr r6, _0800F310 @ =0x000001FF
	adds r0, r6, #0
	ands r1, r0
	ldr r0, _0800F314 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #2]
	ldrb r0, [r5, #3]
	movs r1, #0x20
	orrs r0, r1
	movs r2, #0x10
	orrs r0, r2
	movs r3, #0xf
	rsbs r3, r3, #0
	ands r0, r3
	movs r1, #0xa
	b _0800F370
	.align 2, 0
_0800F310: .4byte 0x000001FF
_0800F314: .4byte 0xFFFFFE00
_0800F318:
	movs r0, #0x20
	orrs r0, r1
	movs r4, #0x10
	orrs r0, r4
	movs r6, #0xf
	rsbs r6, r6, #0
	ands r0, r6
	movs r1, #8
	b _0800F370
_0800F32A:
	ldrb r1, [r5, #3]
	lsls r0, r1, #0x1b
	cmp r0, #0
	bge _0800F360
	ldrh r2, [r5, #2]
	lsls r1, r2, #0x17
	lsrs r1, r1, #0x17
	subs r1, #1
	ldr r3, _0800F358 @ =0x000001FF
	adds r0, r3, #0
	ands r1, r0
	ldr r0, _0800F35C @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r5, #2]
	ldrb r0, [r5, #3]
	movs r4, #0x20
	orrs r0, r4
	movs r6, #0x10
	orrs r0, r6
	movs r1, #0xe
	b _0800F370
	.align 2, 0
_0800F358: .4byte 0x000001FF
_0800F35C: .4byte 0xFFFFFE00
_0800F360:
	movs r0, #0x20
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	movs r2, #0xf
	rsbs r2, r2, #0
	ands r0, r2
	movs r1, #0xc
_0800F370:
	orrs r0, r1
	strb r0, [r5, #3]
	movs r3, #2
	add r8, r3
	adds r5, #8
	ldr r4, [sp, #4]
	adds r4, #1
	str r4, [sp, #4]
	ldr r6, [sp, #8]
	cmp r4, r6
	bge _0800F388
	b _0800F0F6
_0800F388:
	add r0, sp, #0x44
	ldrb r1, [r0]
	ldr r0, _0800F478 @ =gNextOamSlot
	strb r1, [r0]
	ldr r1, [sp, #0x38]
	lsls r0, r1, #1
	ldr r2, _0800F47C @ =0x080A4FA4
	adds r6, r0, r2
	ldrh r4, [r6]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, [sp, #0x3c]
	lsls r0, r3, #0x10
	asrs r7, r0, #0x10
	adds r0, r7, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r0, [sp, #0x38]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r4, _0800F47C @ =0x080A4FA4
	adds r0, r0, r4
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r1
	adds r0, r7, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl FixedMultiplication
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r3, [sp, #0x1c]
	cmp r3, #0
	beq _0800F4A4
	adds r0, r7, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl FixedMultiplication
	ldr r5, _0800F480 @ =gOamData
	ldr r4, _0800F484 @ =0x00000386
	adds r1, r5, r4
	strh r0, [r1]
	movs r0, #0
	ldrsh r6, [r6, r0]
	adds r0, r7, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl FixedMultiplication
	ldr r2, _0800F488 @ =0x0000038E
	adds r1, r5, r2
	strh r0, [r1]
	ldr r3, _0800F48C @ =0x00000396
	adds r0, r5, r3
	mov r4, sl
	strh r4, [r0]
	ldr r1, _0800F490 @ =0x0000039E
	adds r0, r5, r1
	mov r2, sb
	strh r2, [r0]
	ldr r3, [sp, #0x3c]
	rsbs r4, r3, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl FixedMultiplication
	ldr r2, _0800F494 @ =0x000003A6
	adds r1, r5, r2
	strh r0, [r1]
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl FixedMultiplication
	ldr r3, _0800F498 @ =0x000003AE
	adds r1, r5, r3
	strh r0, [r1]
	ldr r4, _0800F49C @ =0x000003B6
	adds r0, r5, r4
	mov r6, sl
	strh r6, [r0]
	ldr r0, _0800F4A0 @ =0x000003BE
	b _0800F52C
	.align 2, 0
_0800F478: .4byte gNextOamSlot
_0800F47C: .4byte 0x080A4FA4
_0800F480: .4byte gOamData
_0800F484: .4byte 0x00000386
_0800F488: .4byte 0x0000038E
_0800F48C: .4byte 0x00000396
_0800F490: .4byte 0x0000039E
_0800F494: .4byte 0x000003A6
_0800F498: .4byte 0x000003AE
_0800F49C: .4byte 0x000003B6
_0800F4A0: .4byte 0x000003BE
_0800F4A4:
	adds r0, r7, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl FixedMultiplication
	ldr r5, _0800F544 @ =gOamData
	ldr r2, _0800F548 @ =0x000003C6
	adds r1, r5, r2
	strh r0, [r1]
	movs r3, #0
	ldrsh r6, [r6, r3]
	adds r0, r7, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl FixedMultiplication
	ldr r4, _0800F54C @ =0x000003CE
	adds r1, r5, r4
	strh r0, [r1]
	ldr r1, _0800F550 @ =0x000003D6
	adds r0, r5, r1
	mov r2, sl
	strh r2, [r0]
	ldr r3, _0800F554 @ =0x000003DE
	adds r0, r5, r3
	mov r4, sb
	strh r4, [r0]
	ldr r0, [sp, #0x3c]
	rsbs r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r0, r8
	bl FixedMultiplication
	ldr r2, _0800F558 @ =0x000003E6
	adds r1, r5, r2
	strh r0, [r1]
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r6, #0
	bl FixedMultiplication
	ldr r3, _0800F55C @ =0x000003EE
	adds r1, r5, r3
	strh r0, [r1]
	ldr r4, _0800F560 @ =0x000003F6
	adds r0, r5, r4
	mov r6, sl
	strh r6, [r0]
	ldr r0, _0800F564 @ =0x000003FE
_0800F52C:
	adds r5, r5, r0
	mov r1, sb
	strh r1, [r5]
_0800F532:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F544: .4byte gOamData
_0800F548: .4byte 0x000003C6
_0800F54C: .4byte 0x000003CE
_0800F550: .4byte 0x000003D6
_0800F554: .4byte 0x000003DE
_0800F558: .4byte 0x000003E6
_0800F55C: .4byte 0x000003EE
_0800F560: .4byte 0x000003F6
_0800F564: .4byte 0x000003FE

	thumb_func_start SpriteCheckOnScreen
SpriteCheckOnScreen: @ 0x0800F568
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r2, _0800F618 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x20
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0800F588
	b _0800F69A
_0800F588:
	ldr r0, _0800F61C @ =gBg1YPosition
	ldrh r0, [r0]
	mov r8, r0
	ldr r0, _0800F620 @ =gBg1XPosition
	ldrh r0, [r0]
	mov sl, r0
	ldrh r0, [r2, #2]
	mov sb, r0
	ldrh r1, [r2, #4]
	str r1, [sp]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r3, r2, #0
	mov r7, r8
	adds r1, r7, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, ip
	adds r0, #0x28
	ldrb r0, [r0]
	lsls r0, r0, #2
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, ip
	adds r0, #0x27
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r2, #0x80
	adds r0, r0, r2
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	mov r7, sl
	adds r0, r7, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp]
	adds r3, r1, r3
	lsls r3, r3, #0x10
	mov r1, ip
	adds r1, #0x29
	ldrb r1, [r1]
	lsls r1, r1, #2
	subs r2, r0, r1
	lsls r2, r2, #0x10
	lsrs r4, r3, #0x10
	movs r7, #0xf0
	lsls r7, r7, #2
	adds r1, r1, r7
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r2, r3
	bhs _0800F624
	cmp r4, r0
	bhs _0800F624
	ldr r0, [sp, #4]
	cmp r0, r6
	bhs _0800F624
	cmp r6, r5
	bhs _0800F624
	mov r2, ip
	ldrh r1, [r2]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2]
	b _0800F69A
	.align 2, 0
_0800F618: .4byte gCurrentSprite
_0800F61C: .4byte gBg1YPosition
_0800F620: .4byte gBg1XPosition
_0800F624:
	mov r3, ip
	ldrh r1, [r3]
	ldr r0, _0800F6AC @ =0x0000FFFD
	ands r0, r1
	strh r0, [r3]
	mov r0, ip
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0800F69A
	movs r7, #0xa0
	lsls r7, r7, #2
	adds r2, r7, #0
	mov r0, r8
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sb
	adds r0, r3, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r7, _0800F6B0 @ =0xFFFFFDC0
	adds r3, r7, #0
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0x98
	lsls r0, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	mov r1, sl
	adds r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r7, [sp]
	adds r2, r7, r2
	lsls r2, r2, #0x10
	adds r3, r0, r3
	lsls r3, r3, #0x10
	lsrs r1, r2, #0x10
	movs r7, #0xc0
	lsls r7, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r3, r2
	bhs _0800F694
	cmp r1, r0
	bhs _0800F694
	cmp r6, r4
	bhs _0800F694
	cmp r4, r5
	blo _0800F69A
_0800F694:
	movs r0, #0
	mov r1, ip
	strh r0, [r1]
_0800F69A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F6AC: .4byte 0x0000FFFD
_0800F6B0: .4byte 0xFFFFFDC0

	thumb_func_start SpriteLoadAllData
SpriteLoadAllData: @ 0x0800F6B4
	push {lr}
	ldr r0, _0800F72C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800F726
	ldr r0, _0800F730 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0800F6F6
	ldr r0, _0800F734 @ =gIsLoadingFile
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	bne _0800F6F6
	ldr r0, _0800F738 @ =gAtmosphericStabilizersOnline
	movs r1, #0
	strh r2, [r0]
	ldr r0, _0800F73C @ =gNormalXBarrierCoresDestroyed
	strh r2, [r0]
	ldr r0, _0800F740 @ =gSuperXBarrierCoresDestroyed
	strh r2, [r0]
	ldr r0, _0800F744 @ =gPowerBombXBarrierCoresDestroyed
	strh r2, [r0]
	ldr r0, _0800F748 @ =gGadorasDestroyed
	strh r2, [r0]
	ldr r0, _0800F74C @ =gMissilesHatchDestroyed
	strb r1, [r0]
	ldr r0, _0800F750 @ =gWaterLowered
	strb r1, [r0]
_0800F6F6:
	bl ClearSpriteData
	bl LoadSpriteset
	bl EscapeCheckReloadGraphics
	bl InitLocationText
	bl LoadRoomSprites
	ldr r0, _0800F754 @ =gBossWork0
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800F758 @ =gBossWork1
	strb r1, [r0]
	ldr r0, _0800F75C @ =gBossWork2
	strb r1, [r0]
	ldr r0, _0800F760 @ =gBossWork3
	strb r1, [r0]
	ldr r0, _0800F764 @ =gBossWork4
	strb r1, [r0]
	ldr r1, _0800F768 @ =gBossWork5
	movs r0, #0
	strh r0, [r1]
_0800F726:
	pop {r0}
	bx r0
	.align 2, 0
_0800F72C: .4byte gPauseScreenFlag
_0800F730: .4byte gUnk_03000be3
_0800F734: .4byte gIsLoadingFile
_0800F738: .4byte gAtmosphericStabilizersOnline
_0800F73C: .4byte gNormalXBarrierCoresDestroyed
_0800F740: .4byte gSuperXBarrierCoresDestroyed
_0800F744: .4byte gPowerBombXBarrierCoresDestroyed
_0800F748: .4byte gGadorasDestroyed
_0800F74C: .4byte gMissilesHatchDestroyed
_0800F750: .4byte gWaterLowered
_0800F754: .4byte gBossWork0
_0800F758: .4byte gBossWork1
_0800F75C: .4byte gBossWork2
_0800F760: .4byte gBossWork3
_0800F764: .4byte gBossWork4
_0800F768: .4byte gBossWork5

	thumb_func_start LoadSpriteset
LoadSpriteset: @ 0x0800F76C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _0800F874 @ =0x040000D4
	ldr r4, _0800F878 @ =0x0879A5D8
	ldr r0, [r4]
	str r0, [r2]
	ldr r0, _0800F87C @ =0x06017800
	str r0, [r2, #4]
	ldr r3, _0800F880 @ =0x082E4A50
	ldr r0, [r3]
	lsrs r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0800F884 @ =0x0879A8D4
	ldr r0, [r1]
	str r0, [r2]
	ldr r0, _0800F888 @ =0x050003E0
	str r0, [r2, #4]
	ldr r0, _0800F88C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r6, #0
	ldr r0, _0800F890 @ =gSpritesetSpriteGfxSlots
	mov sl, r0
	ldr r7, _0800F894 @ =gSpritesetNumber
	ldr r4, _0800F898 @ =0x0879ADD8
	ldr r3, _0800F89C @ =gSpritesetSpriteIds
	movs r5, #0
	movs r2, #0x10
	mov r1, sl
_0800F7B4:
	adds r0, r6, r3
	strb r2, [r0]
	adds r0, r6, r1
	strb r5, [r0]
	adds r6, #1
	cmp r6, #0xe
	ble _0800F7B4
	movs r1, #0xff
	mov r8, r1
	ldrb r1, [r7]
	cmp r1, #0x80
	ble _0800F7D8
	ldr r0, _0800F8A0 @ =gCurrentArea
	ldrb r0, [r0]
	movs r1, #0
	cmp r0, #6
	bls _0800F7D8
	movs r1, #0x81
_0800F7D8:
	movs r6, #0
	lsls r0, r1, #2
	adds r1, r0, r4
	ldr r0, [r1]
	ldrb r3, [r0]
	ldrb r4, [r0, #1]
	movs r7, #1
	cmp r3, #0
	beq _0800F866
	ldr r5, _0800F874 @ =0x040000D4
	movs r2, #0x80
	lsls r2, r2, #0x18
	mov ip, r2
	mov sb, r1
_0800F7F4:
	ldr r1, _0800F89C @ =gSpritesetSpriteIds
	adds r0, r6, r1
	strb r3, [r0]
	mov r0, sl
	adds r2, r6, r0
	movs r1, #7
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
	cmp r4, r8
	beq _0800F84E
	mov r8, r4
	cmp r4, #8
	beq _0800F84E
	subs r3, #0x10
	lsls r2, r3, #2
	ldr r1, _0800F878 @ =0x0879A5D8
	adds r0, r2, r1
	ldr r0, [r0]
	str r0, [r5]
	lsls r0, r4, #0xb
	ldr r3, _0800F8A4 @ =0x06014000
	adds r0, r0, r3
	str r0, [r5, #4]
	ldr r1, _0800F880 @ =0x082E4A50
	adds r0, r2, r1
	ldr r1, [r0]
	lsrs r0, r1, #1
	mov r3, ip
	orrs r0, r3
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _0800F884 @ =0x0879A8D4
	adds r2, r2, r0
	ldr r0, [r2]
	str r0, [r5]
	lsls r0, r4, #5
	ldr r2, _0800F8A8 @ =0x05000300
	adds r0, r0, r2
	str r0, [r5, #4]
	lsrs r1, r1, #0xb
	lsls r1, r1, #4
	orrs r1, r3
	str r1, [r5, #8]
	ldr r0, [r5, #8]
_0800F84E:
	adds r6, #1
	cmp r6, #0xe
	bgt _0800F866
	mov r3, sb
	ldr r1, [r3]
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrb r3, [r0]
	ldrb r4, [r0, #1]
	adds r7, #1
	cmp r3, #0
	bne _0800F7F4
_0800F866:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800F874: .4byte 0x040000D4
_0800F878: .4byte 0x0879A5D8
_0800F87C: .4byte 0x06017800
_0800F880: .4byte 0x082E4A50
_0800F884: .4byte 0x0879A8D4
_0800F888: .4byte 0x050003E0
_0800F88C: .4byte 0x80000010
_0800F890: .4byte gSpritesetSpriteGfxSlots
_0800F894: .4byte gSpritesetNumber
_0800F898: .4byte 0x0879ADD8
_0800F89C: .4byte gSpritesetSpriteIds
_0800F8A0: .4byte gCurrentArea
_0800F8A4: .4byte 0x06014000
_0800F8A8: .4byte 0x05000300

	thumb_func_start SpriteLoadGfx
SpriteLoadGfx: @ 0x0800F8AC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	movs r3, #0xf0
	lsls r3, r3, #0x18
	adds r0, r0, r3
	ldr r4, _0800F8E0 @ =0x040000D4
	ldr r3, _0800F8E4 @ =0x0879A5D8
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	lsrs r2, r2, #0xf
	ldr r0, [r0]
	adds r0, r0, r2
	str r0, [r4]
	lsrs r1, r1, #0xd
	ldr r0, _0800F8E8 @ =0x06014000
	adds r2, r2, r0
	adds r1, r1, r2
	str r1, [r4, #4]
	ldr r0, _0800F8EC @ =0x80000100
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F8E0: .4byte 0x040000D4
_0800F8E4: .4byte 0x0879A5D8
_0800F8E8: .4byte 0x06014000
_0800F8EC: .4byte 0x80000100

	thumb_func_start SpriteLoadPal
SpriteLoadPal: @ 0x0800F8F0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	movs r3, #0xf0
	lsls r3, r3, #0x18
	adds r0, r0, r3
	ldr r4, _0800F924 @ =0x040000D4
	ldr r3, _0800F928 @ =0x0879A8D4
	lsrs r0, r0, #0x16
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r4]
	lsrs r1, r1, #0x13
	ldr r0, _0800F92C @ =0x05000300
	adds r1, r1, r0
	str r1, [r4, #4]
	lsrs r2, r2, #0x14
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r2, r0
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F924: .4byte 0x040000D4
_0800F928: .4byte 0x0879A8D4
_0800F92C: .4byte 0x05000300

	thumb_func_start ClearSpriteData
ClearSpriteData: @ 0x0800F930
	push {r4, lr}
	ldr r0, _0800F964 @ =gSpriteData
	movs r4, #0
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x33
	movs r1, #0x17
_0800F93E:
	strh r3, [r0]
	strb r4, [r2]
	adds r2, #0x38
	adds r0, #0x38
	subs r1, #1
	cmp r1, #0
	bge _0800F93E
	ldr r1, _0800F968 @ =gSpriteDebris
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x70
_0800F954:
	strb r2, [r0, #0xb]
	subs r0, #0x10
	cmp r0, r1
	bge _0800F954
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800F964: .4byte gSpriteData
_0800F968: .4byte gSpriteDebris

	thumb_func_start LoadRoomSprites
LoadRoomSprites: @ 0x0800F96C
	push {r4, r5, lr}
	movs r4, #0
	ldr r1, _0800F9B0 @ =gCurrentRoomEntry
	ldr r0, [r1, #8]
	ldrb r3, [r0]
	cmp r3, #0xff
	beq _0800F9A8
	adds r5, r1, #0
_0800F97C:
	ldr r1, [r5, #8]
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, r0, r1
	ldrb r2, [r0, #1]
	ldrb r0, [r0, #2]
	adds r1, r3, #0
	adds r3, r4, #0
	bl InitializePrimarySprite
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bhi _0800F9A8
	ldr r1, [r5, #8]
	lsls r0, r4, #1
	adds r0, r0, r4
	adds r0, r0, r1
	ldrb r3, [r0]
	cmp r3, #0xff
	bne _0800F97C
_0800F9A8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F9B0: .4byte gCurrentRoomEntry

	thumb_func_start InitializePrimarySprite
InitializePrimarySprite: @ 0x0800F9B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	movs r5, #0
	ldr r0, _0800FA10 @ =gSpriteData
	mov ip, r0
	movs r1, #1
	mov r8, r1
	movs r7, #0
	movs r0, #0
	mov sb, r0
	ldr r1, _0800FA14 @ =0x00002001
	mov sl, r1
_0800F9EA:
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	mov r1, ip
	adds r3, r0, r1
	ldrh r1, [r3]
	mov r0, r8
	ands r0, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _0800FAC4
	movs r0, #0x80
	ands r0, r4
	cmp r0, #0
	beq _0800FA18
	mov r0, sl
	strh r0, [r3]
	b _0800FA1C
	.align 2, 0
_0800FA10: .4byte gSpriteData
_0800FA14: .4byte 0x00002001
_0800FA18:
	mov r1, r8
	strh r1, [r3]
_0800FA1C:
	movs r0, #0x7f
	ands r4, r0
	subs r0, r6, r5
	lsls r0, r0, #3
	mov r1, ip
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	movs r1, #0
	strb r4, [r0]
	cmp r4, #0x10
	bls _0800FA58
	subs r1, r4, #1
	lsls r1, r1, #0x18
	movs r0, #0xf0
	lsls r0, r0, #0x14
	ands r0, r1
	lsrs r4, r0, #0x18
	ldr r1, _0800FA50 @ =gSpritesetSpriteGfxSlots
	adds r0, r4, r1
	ldrb r0, [r0]
	strb r0, [r2, #0x1f]
	ldr r1, _0800FA54 @ =gSpritesetSpriteIds
	adds r0, r4, r1
	ldrb r0, [r0]
	b _0800FA5C
	.align 2, 0
_0800FA50: .4byte gSpritesetSpriteGfxSlots
_0800FA54: .4byte gSpritesetSpriteIds
_0800FA58:
	strb r1, [r2, #0x1f]
	subs r0, r4, #1
_0800FA5C:
	strb r0, [r2, #0x1d]
	subs r0, r6, r5
	lsls r0, r0, #3
	add ip, r0
	mov r0, ip
	adds r0, #0x34
	mov r1, sb
	strb r1, [r0]
	ldr r1, [sp]
	lsls r0, r1, #6
	adds r0, #0x40
	mov r1, ip
	strh r0, [r1, #2]
	ldr r1, [sp, #4]
	lsls r0, r1, #6
	adds r0, #0x20
	mov r1, ip
	strh r0, [r1, #4]
	mov r0, sp
	ldrb r0, [r0, #8]
	strb r0, [r1, #0x1e]
	adds r1, #0x21
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x24
	strb r7, [r0]
	mov r0, sb
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r0, ip
	adds r0, #0x2c
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	subs r0, #0xd
	strb r7, [r0]
	adds r0, #0x15
	strb r7, [r0]
	subs r0, #0xf
	mov r1, r8
	strb r1, [r0]
	subs r0, #3
	strb r5, [r0]
	adds r0, #0xf
	strb r7, [r0]
	adds r0, #4
	strb r1, [r0]
	b _0800FACE
_0800FAC4:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _0800F9EA
_0800FACE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SpriteSpawnSecondary
SpriteSpawnSecondary: @ 0x0800FAE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	movs r1, #0xff
	movs r4, #0
	movs r0, #1
	mov r8, r0
	movs r0, #7
	movs r2, #0
	orrs r6, r0
_0800FB24:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	ldr r3, _0800FBA8 @ =gSpriteData
	adds r0, r0, r3
	mov ip, r0
	ldrh r0, [r0]
	movs r3, #1
	ands r3, r0
	cmp r3, #0
	bne _0800FBAC
	mov r0, ip
	strh r6, [r0]
	mov r1, ip
	adds r1, #0x34
	movs r0, #0x80
	strb r0, [r1]
	mov r0, sb
	mov r1, ip
	strb r0, [r1, #0x1f]
	mov r0, sl
	strb r0, [r1, #0x1d]
	strh r7, [r1, #2]
	strh r5, [r1, #4]
	mov r1, sp
	ldrb r0, [r1]
	mov r1, ip
	strb r0, [r1, #0x1e]
	adds r1, #0x21
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	mov r1, ip
	strh r3, [r1, #0x14]
	adds r0, #8
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	subs r0, #0xd
	strb r2, [r0]
	adds r0, #0x15
	strb r2, [r0]
	subs r0, #0xf
	mov r3, r8
	strb r3, [r0]
	subs r0, #3
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x2a
	movs r0, #0xff
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x32
	strb r2, [r0]
	adds r0, #4
	strb r3, [r0]
	adds r1, r4, #0
	b _0800FBB6
	.align 2, 0
_0800FBA8: .4byte gSpriteData
_0800FBAC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bls _0800FB24
_0800FBB6:
	adds r0, r1, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SpriteSpawnPrimary
SpriteSpawnPrimary: @ 0x0800FBC8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	lsls r5, r5, #0x10
	lsrs r7, r5, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	movs r1, #0xff
	movs r4, #0
	movs r5, #1
	movs r0, #7
	movs r2, #0
	orrs r6, r0
_0800FC0C:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	ldr r3, _0800FC84 @ =gSpriteData
	adds r0, r0, r3
	mov ip, r0
	ldrh r0, [r0]
	movs r3, #1
	ands r3, r0
	cmp r3, #0
	bne _0800FC88
	mov r0, ip
	strh r6, [r0]
	adds r0, #0x34
	strb r2, [r0]
	mov r0, sb
	mov r1, ip
	strb r0, [r1, #0x1f]
	mov r0, sl
	strb r0, [r1, #0x1d]
	mov r0, r8
	strh r0, [r1, #2]
	strh r7, [r1, #4]
	mov r1, sp
	ldrb r0, [r1]
	mov r1, ip
	strb r0, [r1, #0x1e]
	adds r1, #0x21
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	mov r1, ip
	strh r3, [r1, #0x14]
	adds r0, #8
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	subs r0, #0xd
	strb r2, [r0]
	adds r0, #0x15
	strb r2, [r0]
	subs r0, #0xf
	strb r5, [r0]
	subs r0, #3
	strb r4, [r0]
	adds r0, #7
	mov r3, sp
	ldrb r3, [r3, #4]
	strb r3, [r0]
	adds r0, #8
	strb r2, [r0]
	adds r0, #4
	strb r5, [r0]
	adds r1, r4, #0
	b _0800FC92
	.align 2, 0
_0800FC84: .4byte gSpriteData
_0800FC88:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bls _0800FC0C
_0800FC92:
	adds r0, r1, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SpriteSpawnNewXParasite
SpriteSpawnNewXParasite: @ 0x0800FCA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	ldr r6, [sp, #0x34]
	ldr r7, [sp, #0x38]
	mov r8, r7
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r4, [sp, #8]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	mov ip, r5
	lsls r6, r6, #0x10
	lsrs r7, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r5, #0xff
	movs r4, #0
	movs r6, #1
	movs r0, #7
	movs r2, #0
	orrs r1, r0
_0800FCF4:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	ldr r3, _0800FD70 @ =gSpriteData
	adds r0, r0, r3
	mov r8, r0
	ldrh r0, [r0]
	movs r3, #1
	ands r3, r0
	cmp r3, #0
	bne _0800FD74
	mov r0, r8
	strh r1, [r0]
	adds r0, #0x34
	strb r2, [r0]
	mov r0, sb
	mov r1, r8
	strb r0, [r1, #0x1f]
	mov r0, sl
	strb r0, [r1, #0x1d]
	mov r0, ip
	strh r0, [r1, #2]
	strh r7, [r1, #4]
	mov r1, sp
	ldrb r7, [r1]
	mov r1, r8
	strb r7, [r1, #0x1e]
	adds r1, #0x21
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x24
	strb r2, [r0]
	mov r0, r8
	strh r3, [r0, #0x14]
	adds r0, #0x2c
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	subs r0, #0xd
	strb r2, [r0]
	adds r0, #0x15
	strb r2, [r0]
	subs r0, #0xf
	strb r6, [r0]
	subs r0, #3
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r0]
	adds r0, #7
	mov r3, sp
	ldrb r3, [r3, #8]
	strb r3, [r0]
	adds r0, #8
	strb r2, [r0]
	adds r0, #4
	strb r6, [r0]
	adds r5, r4, #0
	b _0800FD7E
	.align 2, 0
_0800FD70: .4byte gSpriteData
_0800FD74:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x17
	bls _0800FCF4
_0800FD7E:
	adds r0, r5, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
