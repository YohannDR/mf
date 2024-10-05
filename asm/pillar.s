    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start PillarProjectileCollision
PillarProjectileCollision: @ 0x0804A914
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r2, _0804A9A8 @ =gCurrentSprite
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
	mov sl, r1
	ldrh r0, [r2, #0xe]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r2, #0x10]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	ldr r4, _0804A9AC @ =gCurrentPowerBomb
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804A9B4
	ldr r0, _0804A9B0 @ =gEquipment
	ldrb r1, [r0, #0xb]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804A9B4
	ldrh r2, [r4, #6]
	ldrh r3, [r4, #4]
	ldrh r0, [r4, #0xc]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r4, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r4, #8]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r4, #0xa]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [sp, #0x10]
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r5, #0
	bl CheckObjectsTouching
	cmp r0, #0
	beq _0804A9B4
_0804A9A2:
	movs r0, #1
	b _0804AA32
	.align 2, 0
_0804A9A8: .4byte gCurrentSprite
_0804A9AC: .4byte gCurrentPowerBomb
_0804A9B0: .4byte gEquipment
_0804A9B4:
	movs r7, #0
_0804A9B6:
	ldr r0, _0804AA44 @ =gProjectileData
	lsls r1, r7, #5
	adds r3, r1, r0
	ldrb r2, [r3]
	movs r0, #1
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0804AA26
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0804AA26
	ldrb r1, [r3, #0xf]
	cmp r1, #9
	beq _0804A9E2
	cmp r1, #4
	beq _0804A9E2
	cmp r1, #0x10
	beq _0804A9E2
	cmp r1, #0x12
	bne _0804AA26
_0804A9E2:
	ldr r0, _0804AA44 @ =gProjectileData
	adds r1, r4, r0
	ldrh r2, [r1, #8]
	ldrh r3, [r1, #0xa]
	ldrh r0, [r1, #0x16]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r0, [r1, #0x18]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r1, #0x1a]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r1, #0x1c]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, [sp, #0x10]
	str r0, [sp]
	mov r0, sl
	str r0, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r1, r5, #0
	bl CheckObjectsTouching
	cmp r0, #0
	bne _0804A9A2
_0804AA26:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _0804A9B6
	movs r0, #0
_0804AA32:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804AA44: .4byte gProjectileData

	thumb_func_start PillarInit
PillarInit: @ 0x0804AA48
	push {r4, r5, r6, lr}
	ldr r2, _0804AA8C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #4
	movs r4, #0
	movs r6, #0
	orrs r1, r0
	strb r4, [r2, #0x1c]
	strh r6, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x25
	strb r4, [r0]
	strh r6, [r2, #0x14]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r1, r0
	orrs r1, r4
	strh r1, [r2]
	adds r0, r2, #0
	adds r0, #0x24
	movs r5, #1
	strb r5, [r0]
	adds r0, #6
	ldrb r0, [r0]
	adds r3, r2, #0
	cmp r0, #0x12
	beq _0804AACC
	cmp r0, #0x12
	bgt _0804AA90
	cmp r0, #0x11
	beq _0804AA96
	b _0804AB54
	.align 2, 0
_0804AA8C: .4byte gCurrentSprite
_0804AA90:
	cmp r0, #0x13
	beq _0804AB14
	b _0804AB54
_0804AA96:
	adds r0, r3, #0
	adds r0, #0x2d
	strb r4, [r0]
	ldr r0, _0804AAC4 @ =0x0837A984
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #8
	strb r0, [r1]
	ldr r0, _0804AAC8 @ =0x0000FFC4
	strh r0, [r3, #0xa]
	strh r6, [r3, #0xc]
	adds r0, #0x20
	strh r0, [r3, #0xe]
	movs r0, #0x1c
	strh r0, [r3, #0x10]
	b _0804AB58
	.align 2, 0
_0804AAC4: .4byte 0x0837A984
_0804AAC8: .4byte 0x0000FFC4
_0804AACC:
	adds r0, r3, #0
	adds r0, #0x2d
	strb r5, [r0]
	movs r2, #0x40
	orrs r1, r2
	strh r1, [r3]
	ldr r0, _0804AB08 @ =0x0837AB8C
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _0804AB0C @ =0x0000FFE4
	strh r0, [r3, #0xa]
	movs r0, #0x1c
	strh r0, [r3, #0xc]
	ldr r0, _0804AB10 @ =0x0000FFC0
	strh r0, [r3, #0xe]
	strh r6, [r3, #0x10]
	ldrh r0, [r3, #2]
	subs r0, #0x20
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	adds r0, #0x20
	strh r0, [r3, #4]
	b _0804AB58
	.align 2, 0
_0804AB08: .4byte 0x0837AB8C
_0804AB0C: .4byte 0x0000FFE4
_0804AB10: .4byte 0x0000FFC0
_0804AB14:
	adds r0, r3, #0
	adds r0, #0x2d
	strb r5, [r0]
	ldr r0, _0804AB4C @ =0x0837AB8C
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	movs r1, #0x40
	strb r1, [r0]
	ldr r0, _0804AB50 @ =0x0000FFE4
	strh r0, [r3, #0xa]
	movs r0, #0x1c
	strh r0, [r3, #0xc]
	strh r6, [r3, #0xe]
	strh r1, [r3, #0x10]
	ldrh r0, [r3, #2]
	subs r0, #0x20
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	subs r0, #0x20
	strh r0, [r3, #4]
	b _0804AB58
	.align 2, 0
_0804AB4C: .4byte 0x0837AB8C
_0804AB50: .4byte 0x0000FFE4
_0804AB54:
	movs r0, #0
	strh r0, [r3]
_0804AB58:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PillarIdle
PillarIdle: @ 0x0804AB60
	push {lr}
	bl PillarProjectileCollision
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804ABB0
	ldr r3, _0804ABB4 @ =gCurrentSprite
	movs r1, #0
	movs r2, #1
	movs r0, #1
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x26
	strb r1, [r0]
	adds r0, #6
	strb r1, [r0]
	subs r0, #7
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0804ABB8 @ =0x00007FFB
	ands r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xe1
	lsls r0, r0, #1
	bl SoundPlay
_0804ABB0:
	pop {r0}
	bx r0
	.align 2, 0
_0804ABB4: .4byte gCurrentSprite
_0804ABB8: .4byte 0x00007FFB

	thumb_func_start PillarExtending
PillarExtending: @ 0x0804ABBC
	push {r4, r5, r6, r7, lr}
	ldr r1, _0804ABE8 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0
	beq _0804AC34
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804ABF4
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804ABEC
	ldrh r0, [r2, #4]
	subs r0, #4
	strh r0, [r2, #4]
	b _0804ABFA
	.align 2, 0
_0804ABE8: .4byte gCurrentSprite
_0804ABEC:
	ldrh r0, [r2, #4]
	adds r0, #4
	strh r0, [r2, #4]
	b _0804ABFA
_0804ABF4:
	ldrh r0, [r2, #2]
	subs r0, #4
	strh r0, [r2, #2]
_0804ABFA:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	beq _0804AC0E
	b _0804AD5A
_0804AC0E:
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804AC28
	ldr r0, _0804AC24 @ =0x0837A9BC
	str r0, [r2, #0x18]
	b _0804AD5A
	.align 2, 0
_0804AC24: .4byte 0x0837A9BC
_0804AC28:
	ldr r0, _0804AC30 @ =0x0837A7B4
	str r0, [r2, #0x18]
	b _0804AD5A
	.align 2, 0
_0804AC30: .4byte 0x0837A7B4
_0804AC34:
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _0804AC7C
	ldrh r0, [r2, #0x16]
	cmp r0, #0
	beq _0804AC7C
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804AC64
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804AC5C
	ldrh r0, [r2, #0xe]
	subs r0, #8
	strh r0, [r2, #0xe]
	b _0804AC6A
_0804AC5C:
	ldrh r0, [r2, #0x10]
	adds r0, #8
	strh r0, [r2, #0x10]
	b _0804AC6A
_0804AC64:
	ldrh r0, [r2, #0xa]
	subs r0, #8
	strh r0, [r2, #0xa]
_0804AC6A:
	ldrh r1, [r2, #0x16]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0804AC7C
	movs r0, #0xe1
	lsls r0, r0, #1
	bl SoundPlay
_0804AC7C:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804AD5A
	ldr r3, _0804ACE0 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	movs r7, #2
	ldrh r6, [r3, #2]
	ldrh r5, [r3, #4]
	adds r0, r3, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804AD24
	ldr r0, _0804ACE4 @ =0x0837AB54
	str r0, [r3, #0x18]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804ACEC
	ldr r4, _0804ACE8 @ =gCurrentClipdataAffectingAction
	strb r7, [r4]
	adds r1, r5, #0
	subs r1, #0x20
	adds r0, r6, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r1, r5, #0
	subs r1, #0x60
	adds r0, r6, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r1, r5, #0
	subs r1, #0xa0
	adds r0, r6, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r1, r5, #0
	subs r1, #0xe0
	b _0804AD18
	.align 2, 0
_0804ACE0: .4byte gCurrentSprite
_0804ACE4: .4byte 0x0837AB54
_0804ACE8: .4byte gCurrentClipdataAffectingAction
_0804ACEC:
	ldr r4, _0804AD20 @ =gCurrentClipdataAffectingAction
	strb r7, [r4]
	adds r1, r5, #0
	adds r1, #0x20
	adds r0, r6, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r1, r5, #0
	adds r1, #0x60
	adds r0, r6, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r1, r5, #0
	adds r1, #0xa0
	adds r0, r6, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r1, r5, #0
	adds r1, #0xe0
_0804AD18:
	adds r0, r6, #0
	bl ClipdataProcess
	b _0804AD5A
	.align 2, 0
_0804AD20: .4byte gCurrentClipdataAffectingAction
_0804AD24:
	ldr r0, _0804AD60 @ =0x0837A94C
	str r0, [r3, #0x18]
	ldr r4, _0804AD64 @ =gCurrentClipdataAffectingAction
	strb r7, [r4]
	adds r0, r6, #0
	subs r0, #0x20
	adds r1, r5, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r0, r6, #0
	subs r0, #0x60
	adds r1, r5, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r0, r6, #0
	subs r0, #0xa0
	adds r1, r5, #0
	bl ClipdataProcess
	strb r7, [r4]
	adds r0, r6, #0
	subs r0, #0xe0
	adds r1, r5, #0
	bl ClipdataProcess
_0804AD5A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804AD60: .4byte 0x0837A94C
_0804AD64: .4byte gCurrentClipdataAffectingAction

	thumb_func_start Pillar
Pillar: @ 0x0804AD68
	push {lr}
	ldr r0, _0804AD80 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804AD90
	cmp r0, #1
	bgt _0804AD84
	cmp r0, #0
	beq _0804AD8A
	b _0804AD9A
	.align 2, 0
_0804AD80: .4byte gCurrentSprite
_0804AD84:
	cmp r0, #2
	beq _0804AD96
	b _0804AD9A
_0804AD8A:
	bl PillarInit
	b _0804AD9A
_0804AD90:
	bl PillarIdle
	b _0804AD9A
_0804AD96:
	bl PillarExtending
_0804AD9A:
	pop {r0}
	bx r0
	.align 2, 0
