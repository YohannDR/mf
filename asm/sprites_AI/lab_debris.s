    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start LabDebrisSetCollision
LabDebrisSetCollision: @ 0x0804F518
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r0, _0804F570 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	ldrh r6, [r0, #4]
	adds r0, #0x2a
	ldrb r4, [r0]
	ldr r0, _0804F574 @ =gCurrentClipdataAffectingAction
	mov r8, r0
	strb r7, [r0]
	adds r5, r1, #0
	subs r5, #0x20
	adds r0, r5, #0
	adds r1, r6, #0
	bl ClipdataProcess
	mov r0, r8
	strb r7, [r0]
	adds r1, r6, #0
	adds r1, #0x40
	adds r0, r5, #0
	bl ClipdataProcess
	subs r4, #0x14
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	cmp r4, #1
	bhi _0804F564
	mov r0, r8
	strb r7, [r0]
	adds r1, r6, #0
	adds r1, #0x80
	adds r0, r5, #0
	bl ClipdataProcess
_0804F564:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F570: .4byte gCurrentSprite
_0804F574: .4byte gCurrentClipdataAffectingAction

	thumb_func_start LabDebrisInit
LabDebrisInit: @ 0x0804F578
	push {r4, lr}
	bl EventCheckOn_RestrictedLabExplosion
	adds r1, r0, #0
	cmp r1, #0
	bne _0804F590
	ldr r0, _0804F58C @ =gCurrentSprite
	strh r1, [r0]
	b _0804F60E
	.align 2, 0
_0804F58C: .4byte gCurrentSprite
_0804F590:
	ldr r0, _0804F5E4 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x25
	movs r2, #0
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x30
	strb r0, [r1]
	movs r3, #0
	ldr r1, _0804F5E8 @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	ldr r1, _0804F5EC @ =0x08385C1C
	str r1, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r2, [r4, #0x16]
	subs r0, #5
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0804F5F4
	ldr r0, _0804F5F0 @ =0x08385C2C
	str r0, [r4, #0x18]
	b _0804F608
	.align 2, 0
_0804F5E4: .4byte gCurrentSprite
_0804F5E8: .4byte 0x0000FFFC
_0804F5EC: .4byte 0x08385C1C
_0804F5F0: .4byte 0x08385C2C
_0804F5F4:
	cmp r0, #0x15
	bne _0804F604
	ldr r0, _0804F600 @ =0x08385C3C
	mov r1, ip
	str r0, [r1, #0x18]
	b _0804F608
	.align 2, 0
_0804F600: .4byte 0x08385C3C
_0804F604:
	mov r4, ip
	str r1, [r4, #0x18]
_0804F608:
	movs r0, #2
	bl LabDebrisSetCollision
_0804F60E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start LabDebrisIdle
LabDebrisIdle: @ 0x0804F614
	push {lr}
	bl EventCheckOn_Escape
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #2
	bne _0804F66A
	ldr r1, _0804F640 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x31
	movs r0, #0
	strb r0, [r3]
	adds r0, r1, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, #6
	ldrb r0, [r0]
	cmp r0, #0x13
	bne _0804F644
	adds r1, #0x2e
	movs r0, #0x30
	b _0804F668
	.align 2, 0
_0804F640: .4byte gCurrentSprite
_0804F644:
	cmp r0, #0x15
	bne _0804F64E
	adds r1, #0x2e
	movs r0, #0x22
	b _0804F668
_0804F64E:
	ldr r0, _0804F660 @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	ldrh r2, [r1, #4]
	cmp r0, r2
	bls _0804F664
	adds r1, #0x2e
	movs r0, #0xa
	b _0804F668
	.align 2, 0
_0804F660: .4byte gXParasiteTargetXPosition
_0804F664:
	adds r1, #0x2e
	movs r0, #0x18
_0804F668:
	strb r0, [r1]
_0804F66A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LabDebrisFalling
LabDebrisFalling: @ 0x0804F670
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0804F6BC @ =gCurrentSprite
	ldrh r6, [r4, #2]
	mov r8, r6
	ldrh r5, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804F6DC
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804F69A
	b _0804F83A
_0804F69A:
	movs r0, #1
	bl LabDebrisSetCollision
	adds r0, r6, #0
	adds r0, #0x20
	adds r1, r5, #0
	movs r2, #0x2f
	bl ParticleSet
	ldr r0, _0804F6C0 @ =0x0000023D
	bl SoundPlay
	cmp r7, #0x13
	bne _0804F6C4
	adds r4, r6, #0
	b _0804F786
	.align 2, 0
_0804F6BC: .4byte gCurrentSprite
_0804F6C0: .4byte 0x0000023D
_0804F6C4:
	cmp r7, #0x15
	beq _0804F738
	ldr r0, _0804F6D8 @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	ldrh r4, [r4, #4]
	cmp r0, r4
	bhi _0804F762
	adds r4, r6, #0
	b _0804F786
	.align 2, 0
_0804F6D8: .4byte gXParasiteTargetXPosition
_0804F6DC:
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0804F728 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804F7A6
	movs r2, #0
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x31
	strb r2, [r0]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0804F72C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, _0804F730 @ =0x0000023E
	bl SoundPlay
	cmp r7, #0x13
	bne _0804F734
	adds r4, r6, #0
	b _0804F786
	.align 2, 0
_0804F728: .4byte gPreviousVerticalCollisionCheck
_0804F72C: .4byte gIoRegisters
_0804F730: .4byte 0x0000023E
_0804F734:
	cmp r7, #0x15
	bne _0804F758
_0804F738:
	adds r4, r6, #0
	subs r4, #0x40
	adds r3, r5, #0
	subs r3, #0x10
	movs r0, #0
	movs r1, #0x13
	adds r2, r4, #0
	bl SpriteDebrisInit
	movs r0, #0
	movs r1, #4
	adds r2, r4, #0
	adds r3, r5, #0
	bl SpriteDebrisInit
	b _0804F83A
_0804F758:
	ldr r0, _0804F780 @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	ldrh r4, [r4, #4]
	cmp r0, r4
	bls _0804F784
_0804F762:
	adds r3, r5, #0
	subs r3, #8
	movs r0, #0
	movs r1, #0x13
	adds r2, r6, #0
	bl SpriteDebrisInit
	adds r3, r5, #0
	adds r3, #0x10
	movs r0, #0
	movs r1, #4
	adds r2, r6, #0
	bl SpriteDebrisInit
	b _0804F83A
	.align 2, 0
_0804F780: .4byte gXParasiteTargetXPosition
_0804F784:
	mov r4, r8
_0804F786:
	subs r4, #0x20
	adds r3, r5, #0
	adds r3, #8
	movs r0, #0
	movs r1, #0x11
	adds r2, r4, #0
	bl SpriteDebrisInit
	adds r3, r5, #0
	subs r3, #0x10
	movs r0, #0
	movs r1, #0x12
	adds r2, r4, #0
	bl SpriteDebrisInit
	b _0804F83A
_0804F7A6:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _0804F7DC @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r1, [r0]
	mov r8, r1
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _0804F7E0 @ =0x00007FFF
	cmp r1, r0
	bne _0804F7E4
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804F7EE
	.align 2, 0
_0804F7DC: .4byte sSpritesFallingSpeed
_0804F7E0: .4byte 0x00007FFF
_0804F7E4:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	add r0, r8
_0804F7EE:
	strh r0, [r4, #2]
	ldr r1, _0804F818 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _0804F83A
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _0804F81C
	ldrh r0, [r1, #2]
	subs r0, #0x20
	adds r1, r5, #0
	movs r2, #0x27
	bl ParticleSet
	b _0804F83A
	.align 2, 0
_0804F818: .4byte gCurrentSprite
_0804F81C:
	cmp r7, #0x13
	bne _0804F826
	adds r0, r5, #0
	subs r0, #0xc
	b _0804F82A
_0804F826:
	adds r0, r5, #0
	adds r0, #0xc
_0804F82A:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r0, [r1, #2]
	subs r0, #0x20
	adds r1, r5, #0
	movs r2, #0x27
	bl ParticleSet
_0804F83A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start LabDebrisCrumbling
LabDebrisCrumbling: @ 0x0804F844
	push {r4, r5, r6, lr}
	ldr r3, _0804F870 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0804F874 @ =sSpritesFallingSpeedHovering
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0804F878 @ =0x00007FFF
	cmp r1, r0
	bne _0804F87C
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804F886
	.align 2, 0
_0804F870: .4byte gCurrentSprite
_0804F874: .4byte sSpritesFallingSpeedHovering
_0804F878: .4byte 0x00007FFF
_0804F87C:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0804F886:
	strh r0, [r3, #2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LabDebris
LabDebris: @ 0x0804F890
	push {lr}
	ldr r0, _0804F8B0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	beq _0804F8C4
	cmp r0, #1
	bgt _0804F8B4
	cmp r0, #0
	beq _0804F8BE
	b _0804F8D4
	.align 2, 0
_0804F8B0: .4byte gCurrentSprite
_0804F8B4:
	cmp r0, #2
	beq _0804F8CA
	cmp r0, #0x18
	beq _0804F8D0
	b _0804F8D4
_0804F8BE:
	bl LabDebrisInit
	b _0804F8D4
_0804F8C4:
	bl LabDebrisIdle
	b _0804F8D4
_0804F8CA:
	bl LabDebrisFalling
	b _0804F8D4
_0804F8D0:
	bl LabDebrisCrumbling
_0804F8D4:
	pop {r0}
	bx r0
