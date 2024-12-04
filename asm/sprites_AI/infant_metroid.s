    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start MetroidInit
MetroidInit: @ 0x0804EAEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0804EBAC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	mov sb, r0
	ldr r1, _0804EBB0 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, sb
	strb r1, [r4, #0x1c]
	ldr r2, _0804EBB4 @ =gFrameCounter8Bit
	mov r8, r2
	ldrb r1, [r2]
	movs r6, #3
	adds r0, r6, #0
	ands r0, r1
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r5, #0xf0
	ands r5, r0
	bl EventCheckOn_RestrictedLabExplosion
	cmp r0, #0
	bne _0804EB3E
	b _0804EC38
_0804EB3E:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #5
	strb r0, [r1]
	ldr r2, _0804EBB8 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r6, [r0]
	subs r0, #1
	movs r7, #1
	strb r7, [r0]
	movs r5, #0x24
	adds r5, r5, r4
	mov ip, r5
	movs r0, #0x18
	strb r0, [r5]
	ldr r0, _0804EBBC @ =sMetroidOam_3852bc
	str r0, [r4, #0x18]
	movs r0, #0xb4
	strh r0, [r4, #6]
	ldr r0, _0804EBC0 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov sl, r2
	ldrh r1, [r4, #2]
	adds r3, r1, #0
	ldr r5, _0804EBC4 @ =0xFFFFFEC0
	adds r0, r2, r5
	cmp r0, r1
	bge _0804EBC8
	adds r0, r4, #0
	adds r0, #0x2d
	strb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, sb
	strb r1, [r0]
	ldrh r0, [r4, #4]
	subs r0, #0xc0
	strh r0, [r4, #4]
	b _0804ED06
	.align 2, 0
_0804EBAC: .4byte gCurrentSprite
_0804EBB0: .4byte 0x0000FFFC
_0804EBB4: .4byte gSpriteRandomNumber
_0804EBB8: .4byte sPrimarySpriteStats
_0804EBBC: .4byte sMetroidOam_3852bc
_0804EBC0: .4byte gSamusData
_0804EBC4: .4byte 0xFFFFFEC0
_0804EBC8:
	ldr r5, _0804EBF0 @ =0xFFFFFE80
	adds r0, r2, r5
	cmp r0, r1
	bge _0804EBF4
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x31
	mov r1, sb
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r0, [r4, #4]
	adds r0, #0xc0
	strh r0, [r4, #4]
	b _0804ED06
	.align 2, 0
_0804EBF0: .4byte 0xFFFFFE80
_0804EBF4:
	ldr r0, _0804EC14 @ =0xFFFFFE40
	add r0, sl
	cmp r0, r3
	bge _0804EC18
	adds r0, r4, #0
	adds r0, #0x2d
	strb r6, [r0]
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0x30
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x28
	strb r0, [r1]
	b _0804ED06
	.align 2, 0
_0804EC14: .4byte 0xFFFFFE40
_0804EC18:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r1, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #4
	mov r5, sb
	strb r5, [r0]
	movs r0, #0x1c
	mov r1, ip
	strb r0, [r1]
	b _0804ED06
_0804EC38:
	adds r0, r4, #0
	adds r0, #0x25
	mov r2, sb
	strb r2, [r0]
	subs r0, #4
	strb r6, [r0]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bl SpriteUtilChooseRandomXDirection
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804EC80
	ldrh r1, [r4]
	ldr r0, _0804EC7C @ =0x0000FBFF
	ands r0, r1
	b _0804EC8A
	.align 2, 0
_0804EC7C: .4byte 0x0000FBFF
_0804EC80:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
_0804EC8A:
	strh r0, [r4]
	cmp r5, #0x10
	bne _0804ECA8
	ldr r0, _0804ECA0 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	subs r1, #0x20
	strh r1, [r0, #2]
	ldr r1, _0804ECA4 @ =sMetroidOam_3852e4
	str r1, [r0, #0x18]
	b _0804ED06
	.align 2, 0
_0804ECA0: .4byte gCurrentSprite
_0804ECA4: .4byte sMetroidOam_3852e4
_0804ECA8:
	ldr r1, _0804ECCC @ =gCurrentSprite
	ldr r0, _0804ECD0 @ =sMetroidOam_3852bc
	str r0, [r1, #0x18]
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _0804ECD8
	ldr r1, _0804ECD4 @ =gFrameCounter8Bit
	ldrh r0, [r3, #2]
	ldrb r5, [r1]
	adds r0, r0, r5
	strh r0, [r3, #2]
	adds r2, r1, #0
	b _0804ECE2
	.align 2, 0
_0804ECCC: .4byte gCurrentSprite
_0804ECD0: .4byte sMetroidOam_3852bc
_0804ECD4: .4byte gSpriteRandomNumber
_0804ECD8:
	ldr r2, _0804ECF8 @ =gFrameCounter8Bit
	ldrb r1, [r2]
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #2]
_0804ECE2:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804ECFC
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldrh r1, [r3, #4]
	adds r0, r0, r1
	b _0804ED04
	.align 2, 0
_0804ECF8: .4byte gSpriteRandomNumber
_0804ECFC:
	ldrb r1, [r2]
	lsls r1, r1, #1
	ldrh r0, [r3, #4]
	subs r0, r0, r1
_0804ED04:
	strh r0, [r3, #4]
_0804ED06:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MetroidSwaying
MetroidSwaying: @ 0x0804ED14
	push {r4, r5, r6, r7, lr}
	ldr r2, _0804ED68 @ =gCurrentSprite
	adds r5, r2, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r4, _0804ED6C @ =sMetroidSwayingYMovement
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _0804ED70 @ =0x00007FFF
	cmp r0, r6
	bne _0804ED34
	ldrh r3, [r4]
	movs r1, #0
_0804ED34:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _0804ED74 @ =sMetroidSwayingXMovement
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _0804ED58
	ldrh r3, [r4]
	movs r1, #0
_0804ED58:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ED68: .4byte gCurrentSprite
_0804ED6C: .4byte sMetroidSwayingYMovement
_0804ED70: .4byte 0x00007FFF
_0804ED74: .4byte sMetroidSwayingXMovement

	thumb_func_start MetroidFloatingInTube
MetroidFloatingInTube: @ 0x0804ED78
	push {r4, r5, r6, r7, lr}
	ldr r1, _0804ED90 @ =gCurrentSprite
	ldrh r5, [r1]
	movs r0, #2
	ands r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0
	bne _0804ED94
	strh r0, [r3]
	b _0804F054
	.align 2, 0
_0804ED90: .4byte gCurrentSprite
_0804ED94:
	movs r4, #0
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x10
	beq _0804EDA6
	b _0804EEF8
_0804EDA6:
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _0804EDD8 @ =sMetroidFloatingInTubeYMovement_Background
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804EDDC @ =0x00007FFF
	cmp r1, r0
	bne _0804EDE4
	ldr r0, _0804EDE0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0804EDD2
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	eors r0, r5
	strh r0, [r3]
_0804EDD2:
	mov r2, ip
	strb r4, [r2]
	b _0804EE50
	.align 2, 0
_0804EDD8: .4byte sMetroidFloatingInTubeYMovement_Background
_0804EDDC: .4byte 0x00007FFF
_0804EDE0: .4byte gSpriteRandomNumber
_0804EDE4:
	adds r0, r2, #1
	mov r7, ip
	strb r0, [r7]
	ldrh r1, [r3, #2]
	lsrs r1, r1, #2
	ldr r0, _0804EE0C @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0804EE10
	cmp r1, #0x58
	bls _0804EE16
	movs r4, #1
	b _0804EE1A
	.align 2, 0
_0804EE0C: .4byte gBg1YPosition
_0804EE10:
	cmp r1, #0x3b
	bhi _0804EE16
	movs r4, #1
_0804EE16:
	cmp r4, #0
	beq _0804EE38
_0804EE1A:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0804EE34
	movs r0, #0xd
	b _0804EE36
_0804EE34:
	movs r0, #0xc
_0804EE36:
	strb r0, [r1]
_0804EE38:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804EE4A
	ldrh r0, [r3, #2]
	adds r0, r0, r6
	b _0804EE4E
_0804EE4A:
	ldrh r0, [r3, #2]
	subs r0, r0, r6
_0804EE4E:
	strh r0, [r3, #2]
_0804EE50:
	adds r5, r3, #0
	adds r5, #0x30
	ldrb r2, [r5]
	ldr r1, _0804EE94 @ =sMetroidFloatingInTubeXMovement_Background
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804EE98 @ =0x00007FFF
	cmp r1, r0
	bne _0804EE6A
	b _0804EFBC
_0804EE6A:
	adds r0, r2, #1
	strb r0, [r5]
	ldrh r1, [r3, #4]
	lsrs r1, r1, #2
	ldr r0, _0804EE9C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r2, #0x77
	bhi _0804EEA6
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804EEA0
	cmp r2, #0x40
	bls _0804EEC2
	b _0804EEBC
	.align 2, 0
_0804EE94: .4byte sMetroidFloatingInTubeXMovement_Background
_0804EE98: .4byte 0x00007FFF
_0804EE9C: .4byte gBg1XPosition
_0804EEA0:
	cmp r2, #0x27
	bhi _0804EEC2
	b _0804EEBC
_0804EEA6:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804EEB8
	cmp r2, #0xc8
	bls _0804EEC2
	b _0804EEBC
_0804EEB8:
	cmp r2, #0xaf
	bhi _0804EEC2
_0804EEBC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804EEC2:
	cmp r4, #0
	beq _0804EEE4
	ldrh r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0804EEE0
	movs r0, #0xd
	b _0804EEE2
_0804EEE0:
	movs r0, #0xc
_0804EEE2:
	strb r0, [r1]
_0804EEE4:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804EEF2
	b _0804F04E
_0804EEF2:
	ldrh r0, [r3, #4]
	adds r0, r0, r6
	b _0804F052
_0804EEF8:
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _0804EF2C @ =sMetroidFloatingInTubeYMovement
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804EF30 @ =0x00007FFF
	cmp r1, r0
	bne _0804EF38
	ldr r0, _0804EF34 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0804EF24
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	eors r0, r5
	strh r0, [r3]
_0804EF24:
	mov r2, ip
	strb r4, [r2]
	b _0804EFA4
	.align 2, 0
_0804EF2C: .4byte sMetroidFloatingInTubeYMovement
_0804EF30: .4byte 0x00007FFF
_0804EF34: .4byte gSpriteRandomNumber
_0804EF38:
	adds r0, r2, #1
	mov r7, ip
	strb r0, [r7]
	ldrh r1, [r3, #2]
	lsrs r1, r1, #2
	ldr r0, _0804EF60 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0804EF64
	cmp r1, #0x64
	bls _0804EF6A
	movs r4, #1
	b _0804EF6E
	.align 2, 0
_0804EF60: .4byte gBg1YPosition
_0804EF64:
	cmp r1, #0x1d
	bhi _0804EF6A
	movs r4, #1
_0804EF6A:
	cmp r4, #0
	beq _0804EF8C
_0804EF6E:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0804EF88
	movs r0, #0xd
	b _0804EF8A
_0804EF88:
	movs r0, #0xc
_0804EF8A:
	strb r0, [r1]
_0804EF8C:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804EF9E
	ldrh r0, [r3, #2]
	adds r0, r0, r6
	b _0804EFA2
_0804EF9E:
	ldrh r0, [r3, #2]
	subs r0, r0, r6
_0804EFA2:
	strh r0, [r3, #2]
_0804EFA4:
	adds r5, r3, #0
	adds r5, #0x30
	ldrb r2, [r5]
	ldr r1, _0804EFD8 @ =sMetroidFloatingInTubeXMovement
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804EFDC @ =0x00007FFF
	cmp r1, r0
	bne _0804EFE4
_0804EFBC:
	ldr r0, _0804EFE0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0804EFD0
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
_0804EFD0:
	movs r0, #0
	strb r0, [r5]
	b _0804F054
	.align 2, 0
_0804EFD8: .4byte sMetroidFloatingInTubeXMovement
_0804EFDC: .4byte 0x00007FFF
_0804EFE0: .4byte gSpriteRandomNumber
_0804EFE4:
	adds r0, r2, #1
	strb r0, [r5]
	ldrh r1, [r3, #4]
	lsrs r1, r1, #2
	ldr r0, _0804F00C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804F010
	cmp r2, #0x8c
	bls _0804F01A
	b _0804F014
	.align 2, 0
_0804F00C: .4byte gBg1XPosition
_0804F010:
	cmp r2, #0x63
	bhi _0804F01A
_0804F014:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804F01A:
	cmp r4, #0
	beq _0804F03C
	ldrh r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0804F038
	movs r0, #0xd
	b _0804F03A
_0804F038:
	movs r0, #0xc
_0804F03A:
	strb r0, [r1]
_0804F03C:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804F04E
	ldrh r0, [r3, #4]
	adds r0, r0, r6
	b _0804F052
_0804F04E:
	ldrh r0, [r3, #4]
	subs r0, r0, r6
_0804F052:
	strh r0, [r3, #4]
_0804F054:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MetroidFloatingNearSaX
MetroidFloatingNearSaX: @ 0x0804F05C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _0804F104 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r1, [r0]
	ldr r4, _0804F108 @ =sMetroidSwayingYMovement
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r6, _0804F10C @ =0x00007FFF
	cmp r0, r6
	bne _0804F082
	ldrh r3, [r4]
	movs r1, #0
_0804F082:
	adds r0, r1, #1
	mov r7, ip
	strb r0, [r7]
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	movs r1, #0
	mov r8, r1
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _0804F110 @ =sMetroidSwayingXMovement
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _0804F0AC
	ldrh r3, [r4]
	movs r1, #0
_0804F0AC:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	subs r0, #1
	strh r0, [r2, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804F0FA
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5]
	adds r1, r2, #0
	adds r1, #0x2e
	mov r3, r8
	strb r3, [r1]
	mov r5, ip
	strb r0, [r5]
	ldrh r1, [r2]
	ldr r0, _0804F114 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804F0FA
	ldr r0, _0804F118 @ =0x0000023A
	bl SoundPlay
_0804F0FA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F104: .4byte gCurrentSprite
_0804F108: .4byte sMetroidSwayingYMovement
_0804F10C: .4byte 0x00007FFF
_0804F110: .4byte sMetroidSwayingXMovement
_0804F114: .4byte 0x0000F7FF
_0804F118: .4byte 0x0000023A

	thumb_func_start MetroidFloatingTowardsSaX
MetroidFloatingTowardsSaX: @ 0x0804F11C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _0804F21C @ =gCurrentSprite
	ldrh r0, [r2, #2]
	mov sl, r0
	ldrh r1, [r2, #4]
	mov sb, r1
	movs r3, #0x10
	mov r8, r3
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0804F1E6
	movs r6, #0
	adds r5, r4, #0
_0804F146:
	ldr r1, _0804F220 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F1DC
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804F1DC
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xbc
	bne _0804F1DC
	ldrh r7, [r2, #2]
	ldrh r3, [r2, #4]
	mov r1, sl
	add r1, r8
	adds r0, r7, #0
	subs r0, #0x78
	cmp r1, r0
	ble _0804F1DC
	mov r0, sl
	mov r1, r8
	subs r0, r0, r1
	mov ip, r0
	cmp ip, r7
	bge _0804F1DC
	mov r1, sb
	add r1, r8
	adds r0, r3, #0
	subs r0, #0x14
	cmp r1, r0
	ble _0804F1DC
	mov r7, sb
	mov r0, r8
	subs r1, r7, r0
	adds r0, r3, #0
	adds r0, #0x14
	cmp r1, r0
	bge _0804F1DC
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x2f
	movs r7, #0
	strb r7, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	movs r3, #0
	strb r3, [r0]
	ldr r7, _0804F224 @ =0x030006ED
	strb r1, [r7]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #2
	bne _0804F1DC
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0804F228 @ =0x0000023B
	bl SoundPlay
_0804F1DC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x17
	bls _0804F146
_0804F1E6:
	ldr r0, _0804F22C @ =gFrameCounter8Bit
	ldrb r2, [r0]
	adds r3, r2, #0
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0804F28C
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804F23C
	ldr r0, _0804F230 @ =gXParasiteTargetYPosition
	adds r1, r2, #0
	adds r1, #0x50
	ldrh r0, [r0]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _0804F234 @ =gXParasiteTargetXPosition
	ldr r3, _0804F238 @ =0x0000FFE0
	adds r0, r2, r3
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804F274
	.align 2, 0
_0804F21C: .4byte gCurrentSprite
_0804F220: .4byte gSpriteData
_0804F224: .4byte 0x030006ED
_0804F228: .4byte 0x0000023B
_0804F22C: .4byte gSpriteRandomNumber
_0804F230: .4byte gXParasiteTargetYPosition
_0804F234: .4byte gXParasiteTargetXPosition
_0804F238: .4byte 0x0000FFE0
_0804F23C:
	cmp r0, #2
	bne _0804F25C
	ldr r0, _0804F254 @ =gXParasiteTargetYPosition
	adds r1, r2, #0
	adds r1, #0x32
	ldrh r0, [r0]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F258 @ =gXParasiteTargetXPosition
	subs r1, #0x3a
	b _0804F270
	.align 2, 0
_0804F254: .4byte gXParasiteTargetYPosition
_0804F258: .4byte gXParasiteTargetXPosition
_0804F25C:
	ldr r1, _0804F280 @ =gXParasiteTargetYPosition
	ldr r7, _0804F284 @ =0x0000FF88
	adds r0, r3, r7
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F288 @ =gXParasiteTargetXPosition
	adds r1, r3, #0
	subs r1, #0x20
_0804F270:
	ldrh r0, [r0]
	subs r0, r0, r1
_0804F274:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0xa
	mov r8, r0
	movs r5, #0xa
	b _0804F2EA
	.align 2, 0
_0804F280: .4byte gXParasiteTargetYPosition
_0804F284: .4byte 0x0000FF88
_0804F288: .4byte gXParasiteTargetXPosition
_0804F28C:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804F2B0
	ldr r0, _0804F2A8 @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F2AC @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	subs r0, #0x24
	b _0804F2E0
	.align 2, 0
_0804F2A8: .4byte gXParasiteTargetYPosition
_0804F2AC: .4byte gXParasiteTargetXPosition
_0804F2B0:
	cmp r0, #2
	bne _0804F2D0
	ldr r0, _0804F2C8 @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	subs r0, #0x32
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F2CC @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	adds r0, #8
	b _0804F2E0
	.align 2, 0
_0804F2C8: .4byte gXParasiteTargetYPosition
_0804F2CC: .4byte gXParasiteTargetXPosition
_0804F2D0:
	ldr r0, _0804F324 @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F328 @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	adds r0, #0x1e
_0804F2E0:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0x14
	mov r8, r1
	movs r5, #0x1e
_0804F2EA:
	ldrh r1, [r4]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0804F34C
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _0804F32C
	ldrh r1, [r4, #4]
	subs r0, r3, #4
	cmp r1, r0
	bgt _0804F35E
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r5
	bhs _0804F318
	adds r0, #1
	strb r0, [r1]
_0804F318:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	b _0804F3A2
	.align 2, 0
_0804F324: .4byte gXParasiteTargetYPosition
_0804F328: .4byte gXParasiteTargetXPosition
_0804F32C:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0804F340
	lsrs r0, r0, #0x1a
	ldrh r3, [r4, #4]
	adds r0, r0, r3
	strh r0, [r4, #4]
	b _0804F3A2
_0804F340:
	ldrh r1, [r4]
	ldr r0, _0804F348 @ =0x0000FDFF
	ands r0, r1
	b _0804F398
	.align 2, 0
_0804F348: .4byte 0x0000FDFF
_0804F34C:
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _0804F37C
	ldrh r1, [r4, #4]
	adds r0, r3, #4
	cmp r1, r0
	bge _0804F368
_0804F35E:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r2]
	b _0804F3A2
_0804F368:
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r5
	bhs _0804F376
	adds r0, #1
	strb r0, [r1]
_0804F376:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0804F38A
_0804F37C:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0804F392
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0804F38A:
	ldrh r0, [r4, #4]
	subs r0, r0, r1
	strh r0, [r4, #4]
	b _0804F3A2
_0804F392:
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
_0804F398:
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_0804F3A2:
	adds r2, r4, #0
	ldrh r5, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r6, #0
	ands r0, r5
	cmp r0, #0
	beq _0804F400
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804F3DE
	ldrh r1, [r2, #2]
	subs r0, r7, #4
	cmp r1, r0
	bgt _0804F412
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0804F3D2
	adds r0, #1
	strb r0, [r1]
_0804F3D2:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r7, [r2, #2]
	adds r0, r0, r7
	strh r0, [r2, #2]
	b _0804F456
_0804F3DE:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0804F3F2
	lsrs r0, r0, #0x1a
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _0804F456
_0804F3F2:
	ldr r0, _0804F3FC @ =0x0000FBFF
	ands r0, r5
	strh r0, [r2]
	adds r1, r2, #0
	b _0804F450
	.align 2, 0
_0804F3FC: .4byte 0x0000FBFF
_0804F400:
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804F430
	ldrh r1, [r2, #2]
	adds r0, r7, #4
	cmp r1, r0
	bge _0804F41C
_0804F412:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _0804F456
_0804F41C:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0804F42A
	adds r0, #1
	strb r0, [r1]
_0804F42A:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0804F43E
_0804F430:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0804F446
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0804F43E:
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _0804F456
_0804F446:
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
_0804F450:
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0804F456:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Metroid
Metroid: @ 0x0804F464
	push {lr}
	ldr r0, _0804F47C @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _0804F514
	lsls r0, r0, #2
	ldr r1, _0804F480 @ =_0804F484
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804F47C: .4byte gCurrentSprite
_0804F480: .4byte _0804F484
_0804F484: @ jump table
	.4byte _0804F4F8 @ case 0
	.4byte _0804F514 @ case 1
	.4byte _0804F4FE @ case 2
	.4byte _0804F514 @ case 3
	.4byte _0804F514 @ case 4
	.4byte _0804F514 @ case 5
	.4byte _0804F514 @ case 6
	.4byte _0804F514 @ case 7
	.4byte _0804F514 @ case 8
	.4byte _0804F514 @ case 9
	.4byte _0804F514 @ case 10
	.4byte _0804F514 @ case 11
	.4byte _0804F514 @ case 12
	.4byte _0804F514 @ case 13
	.4byte _0804F514 @ case 14
	.4byte _0804F514 @ case 15
	.4byte _0804F514 @ case 16
	.4byte _0804F514 @ case 17
	.4byte _0804F514 @ case 18
	.4byte _0804F514 @ case 19
	.4byte _0804F514 @ case 20
	.4byte _0804F514 @ case 21
	.4byte _0804F514 @ case 22
	.4byte _0804F514 @ case 23
	.4byte _0804F504 @ case 24
	.4byte _0804F514 @ case 25
	.4byte _0804F50A @ case 26
	.4byte _0804F514 @ case 27
	.4byte _0804F510 @ case 28
_0804F4F8:
	bl MetroidInit
	b _0804F514
_0804F4FE:
	bl MetroidFloatingInTube
	b _0804F514
_0804F504:
	bl MetroidFloatingNearSaX
	b _0804F514
_0804F50A:
	bl MetroidFloatingTowardsSaX
	b _0804F514
_0804F510:
	bl MetroidSwaying
_0804F514:
	pop {r0}
	bx r0
