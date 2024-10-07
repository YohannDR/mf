    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ArachnusSetStandingHitbox
ArachnusSetStandingHitbox: @ 0x0802381C
	push {lr}
	ldr r2, _0802383C @ =gCurrentSprite
	movs r0, #0
	ldr r3, _08023840 @ =0x0000FF80
	strh r3, [r2, #0xa]
	strh r0, [r2, #0xc]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023848
	ldr r0, _08023844 @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x80
	b _0802384C
	.align 2, 0
_0802383C: .4byte gCurrentSprite
_08023840: .4byte 0x0000FF80
_08023844: .4byte 0x0000FFE0
_08023848:
	strh r3, [r2, #0xe]
	movs r0, #0x20
_0802384C:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ArachnusShootingFireInit
ArachnusShootingFireInit: @ 0x08023854
	push {lr}
	ldr r2, _08023884 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _08023888 @ =0x08302A44
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r1, [r2]
	ldr r0, _0802388C @ =0x0000FBFF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _08023890 @ =0x08302A74
	bl SetSecondarySpriteOAMPointer
	pop {r0}
	bx r0
	.align 2, 0
_08023884: .4byte gCurrentSprite
_08023888: .4byte 0x08302A44
_0802388C: .4byte 0x0000FBFF
_08023890: .4byte 0x08302A74

	thumb_func_start ArachnusScreamingInit
ArachnusScreamingInit: @ 0x08023894
	push {lr}
	ldr r1, _080238C8 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x3e
	strb r0, [r3]
	ldr r0, _080238CC @ =0x08302D54
	str r0, [r1, #0x18]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _080238D0 @ =0x0000FF20
	strh r0, [r1, #0xa]
	strh r2, [r1, #0xc]
	adds r0, #0x98
	strh r0, [r1, #0xe]
	movs r0, #0x48
	strh r0, [r1, #0x10]
	ldr r0, _080238D4 @ =0x08302D8C
	bl SetSecondarySpriteOAMPointer
	movs r0, #0xbb
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_080238C8: .4byte gCurrentSprite
_080238CC: .4byte 0x08302D54
_080238D0: .4byte 0x0000FF20
_080238D4: .4byte 0x08302D8C

	thumb_func_start ArachnusDyingInit
ArachnusDyingInit: @ 0x080238D8
	push {r4, lr}
	ldr r4, _08023940 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x42
	strb r1, [r0]
	ldr r0, [r4, #0x18]
	ldr r1, _08023944 @ =0x08302D54
	cmp r0, r1
	beq _08023908
	str r1, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldr r0, _08023948 @ =0x0000FF20
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	adds r0, #0x98
	strh r0, [r4, #0xe]
	movs r0, #0x48
	strh r0, [r4, #0x10]
	ldr r0, _0802394C @ =0x08302D8C
	bl SetSecondarySpriteOAMPointer
_08023908:
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r1, #1
	strh r1, [r4, #0x14]
	adds r0, #7
	strb r2, [r0]
	subs r0, #0xc
	strb r2, [r0]
	movs r0, #0x2c
	strh r0, [r4, #6]
	strh r1, [r4, #8]
	movs r0, #0xbe
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08023940: .4byte gCurrentSprite
_08023944: .4byte 0x08302D54
_08023948: .4byte 0x0000FF20
_0802394C: .4byte 0x08302D8C

	thumb_func_start ArachnusRollingInit
ArachnusRollingInit: @ 0x08023950
	push {r4, r5, lr}
	ldr r4, _080239C4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	movs r5, #0
	orrs r1, r0
	strh r1, [r4]
	adds r0, r4, #0
	adds r0, #0x30
	strb r5, [r0]
	ldr r0, _080239C8 @ =0x0000FFE0
	strh r0, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08023990
	ldr r0, _080239CC @ =0x0000FBFF
	ands r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	eors r1, r0
	strh r1, [r4]
_08023990:
	ldr r0, _080239D0 @ =0x08302C94
	bl SetSecondarySpriteOAMPointer
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	ldr r2, _080239D4 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _080239D8 @ =0x0000FFA0
	strh r1, [r0, #0xa]
	movs r1, #0
	strh r1, [r0, #0xc]
	ldr r1, _080239DC @ =0x0000FFC0
	strh r1, [r0, #0xe]
	movs r1, #0x40
	strh r1, [r0, #0x10]
	movs r0, #0xb4
	bl SoundPlay
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080239C4: .4byte gCurrentSprite
_080239C8: .4byte 0x0000FFE0
_080239CC: .4byte 0x0000FBFF
_080239D0: .4byte 0x08302C94
_080239D4: .4byte gSpriteData
_080239D8: .4byte 0x0000FFA0
_080239DC: .4byte 0x0000FFC0

	thumb_func_start ArachnusSlashingInit
ArachnusSlashingInit: @ 0x080239E0
	push {lr}
	ldr r1, _08023A10 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x38
	strb r0, [r2]
	ldr r0, _08023A14 @ =0x08302AA4
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldrh r2, [r1]
	ldr r0, _08023A18 @ =0x0000FBFF
	ands r0, r2
	strh r0, [r1]
	ldr r0, _08023A1C @ =0x08302B74
	bl SetSecondarySpriteOAMPointer
	movs r0, #0xba
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08023A10: .4byte gCurrentSprite
_08023A14: .4byte 0x08302AA4
_08023A18: .4byte 0x0000FBFF
_08023A1C: .4byte 0x08302B74

	thumb_func_start ArachnusSlashing
ArachnusSlashing: @ 0x08023A20
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _08023A48 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08023A8E
	mov r2, ip
	ldrh r1, [r2, #0x16]
	cmp r1, #0xf
	bhi _08023A4C
	movs r0, #0xa0
	strh r0, [r2, #0x10]
	b _08023AF6
	.align 2, 0
_08023A48: .4byte gCurrentSprite
_08023A4C:
	cmp r1, #0x11
	bhi _08023A58
	movs r0, #0x60
	mov r1, ip
	strh r0, [r1, #0x10]
	b _08023AF6
_08023A58:
	cmp r1, #0x17
	bhi _08023A86
	movs r0, #0xc0
	mov r2, ip
	strh r0, [r2, #0x10]
	cmp r1, #0x12
	bne _08023AF6
	ldrb r0, [r2, #0x1c]
	cmp r0, #3
	bne _08023AF6
	ldrb r2, [r2, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	adds r0, #0x10
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x8c
	str r0, [sp, #4]
	str r5, [sp, #8]
	b _08023ADC
_08023A86:
	movs r0, #0x80
	mov r2, ip
	strh r0, [r2, #0x10]
	b _08023AF6
_08023A8E:
	mov r0, ip
	ldrh r1, [r0, #0x16]
	cmp r1, #0xf
	bhi _08023AA4
	ldr r0, _08023AA0 @ =0x0000FF60
	mov r1, ip
	strh r0, [r1, #0xe]
	b _08023AF6
	.align 2, 0
_08023AA0: .4byte 0x0000FF60
_08023AA4:
	cmp r1, #0x11
	bhi _08023AB0
	ldr r0, _08023AAC @ =0x0000FFA0
	b _08023AF2
	.align 2, 0
_08023AAC: .4byte 0x0000FFA0
_08023AB0:
	cmp r1, #0x17
	bhi _08023AF0
	ldr r0, _08023AEC @ =0x0000FF40
	mov r2, ip
	strh r0, [r2, #0xe]
	cmp r1, #0x12
	bne _08023AF6
	ldrb r0, [r2, #0x1c]
	cmp r0, #3
	bne _08023AF6
	ldrb r2, [r2, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	adds r0, #0x10
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x8c
	str r0, [sp, #4]
	str r4, [sp, #8]
_08023ADC:
	movs r0, #0x16
	movs r1, #0
	bl SpriteSpawnSecondary
	movs r0, #0xb9
	bl SoundPlay
	b _08023AF6
	.align 2, 0
_08023AEC: .4byte 0x0000FF40
_08023AF0:
	ldr r0, _08023B18 @ =0x0000FF80
_08023AF2:
	mov r2, ip
	strh r0, [r2, #0xe]
_08023AF6:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _08023B0E
	ldr r1, _08023B1C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
_08023B0E:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023B18: .4byte 0x0000FF80
_08023B1C: .4byte gCurrentSprite

	thumb_func_start ArachnusRolling
ArachnusRolling: @ 0x08023B20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _08023B70 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r2, [r0]
	ldr r7, _08023B74 @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r6, r0, #3
	adds r0, r7, #0
	adds r0, #0x18
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, _08023B78 @ =0x08302C94
	cmp r1, r0
	bne _08023B80
	adds r0, r2, #0
	bl SpriteUtilCheckEndSpriteAnim
	cmp r0, #0
	bne _08023B50
	b _08023D0A
_08023B50:
	ldr r0, _08023B7C @ =0x08302DC4
	bl SetSecondarySpriteOAMPointer
	adds r1, r6, r7
	ldrh r2, [r1]
	movs r0, #0x80
	movs r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r0, r1, #0
	adds r0, #0x2b
	strb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1, #0x12]
	b _08023D0A
	.align 2, 0
_08023B70: .4byte gCurrentSprite
_08023B74: .4byte gSpriteData
_08023B78: .4byte 0x08302C94
_08023B7C: .4byte 0x08302DC4
_08023B80:
	ldr r0, _08023C18 @ =sArachnusRollingSpeed
	movs r1, #0x30
	adds r1, r1, r5
	mov r8, r1
	ldrb r3, [r1]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r4, [r1]
	cmp r2, #0x2e
	bhi _08023BA0
	adds r0, r3, #1
	mov r2, r8
	strb r0, [r2]
_08023BA0:
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023C40
	adds r6, r6, r7
	ldrh r0, [r6, #2]
	subs r0, #0x48
	movs r2, #0x10
	ldrsh r1, [r6, r2]
	ldrh r2, [r6, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08023C1C @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08023BCA
	b _08023CD0
_08023BCA:
	ldrh r0, [r5, #4]
	adds r0, r4, r0
	strh r0, [r5, #4]
	ldrh r7, [r5, #4]
	ldrh r2, [r5, #2]
	ldrh r0, [r6, #4]
	adds r0, r4, r0
	strh r0, [r6, #4]
	mov r1, r8
	ldrb r0, [r1]
	lsrs r4, r0, #1
	cmp r4, #0x10
	bls _08023BE6
	movs r4, #0x10
_08023BE6:
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	adds r1, r1, r4
	strb r1, [r0]
	ldr r0, _08023C20 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	cmp r1, #0xc
	bls _08023CCA
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08023C28
	subs r2, #0x10
	ldr r0, _08023C24 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r3, #0x1f
	ands r3, r0
	adds r3, r7, r3
	movs r0, #0
	movs r1, #4
	bl SpriteDebrisInit
	b _08023CCA
	.align 2, 0
_08023C18: .4byte sArachnusRollingSpeed
_08023C1C: .4byte gPreviousCollisionCheck
_08023C20: .4byte gSpriteRandomNumber
_08023C24: .4byte gFrameCounter8Bit
_08023C28:
	ldr r0, _08023C3C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r3, #0x1f
	ands r3, r0
	adds r3, r7, r3
	movs r0, #0
	movs r1, #0x11
	bl SpriteDebrisInit
	b _08023CCA
	.align 2, 0
_08023C3C: .4byte gFrameCounter8Bit
_08023C40:
	adds r6, r6, r7
	ldrh r0, [r6, #2]
	subs r0, #0x48
	movs r2, #0xe
	ldrsh r1, [r6, r2]
	ldrh r2, [r6, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08023CAC @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08023CD0
	ldrh r0, [r5, #4]
	subs r0, r0, r4
	strh r0, [r5, #4]
	ldrh r7, [r5, #4]
	ldrh r2, [r5, #2]
	ldrh r0, [r6, #4]
	subs r0, r0, r4
	strh r0, [r6, #4]
	mov r1, r8
	ldrb r0, [r1]
	lsrs r4, r0, #1
	cmp r4, #0x10
	bls _08023C7A
	movs r4, #0x10
_08023C7A:
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	subs r1, r1, r4
	strb r1, [r0]
	ldr r0, _08023CB0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	cmp r1, #0xc
	bls _08023CCA
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08023CB8
	subs r2, #0x10
	ldr r0, _08023CB4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r3, #0x1f
	ands r3, r0
	subs r3, r7, r3
	movs r0, #0
	movs r1, #0x13
	bl SpriteDebrisInit
	b _08023CCA
	.align 2, 0
_08023CAC: .4byte gPreviousCollisionCheck
_08023CB0: .4byte gSpriteRandomNumber
_08023CB4: .4byte gFrameCounter8Bit
_08023CB8:
	ldr r0, _08023CF0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r3, #0x1f
	ands r3, r0
	subs r3, r7, r3
	movs r0, #0
	movs r1, #0x12
	bl SpriteDebrisInit
_08023CCA:
	movs r0, #0
	cmp r0, #0
	beq _08023CF8
_08023CD0:
	ldr r1, _08023CF4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x3c
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0xb7
	bl SoundPlay
	b _08023D0A
	.align 2, 0
_08023CF0: .4byte gFrameCounter8Bit
_08023CF4: .4byte gCurrentSprite
_08023CF8:
	ldr r0, _08023D14 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08023D0A
	movs r0, #0xb6
	bl SoundPlay
_08023D0A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023D14: .4byte gFrameCounter8Bit

	thumb_func_start ArachnusBonking
ArachnusBonking: @ 0x08023D18
	push {r4, r5, r6, r7, lr}
	ldr r3, _08023D58 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r5, [r0]
	ldr r2, _08023D5C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r1, r2, #0
	adds r1, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	adds r4, r3, #0
	adds r7, r2, #0
	ldr r1, _08023D60 @ =0x08302CF4
	mov ip, r1
	cmp r0, ip
	bne _08023D64
	adds r0, r5, #0
	bl SpriteUtilCheckNearEndSpriteAnim
	cmp r0, #0
	beq _08023E22
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0xff
	strb r0, [r1]
	b _08023E22
	.align 2, 0
_08023D58: .4byte gCurrentSprite
_08023D5C: .4byte gSpriteData
_08023D60: .4byte 0x08302CF4
_08023D64:
	adds r6, r4, #0
	adds r6, #0x31
	ldrb r1, [r6]
	ldr r2, _08023D84 @ =sArachnusBonkingSpeed
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r3, [r0]
	ldr r0, _08023D88 @ =0x00007FFF
	cmp r3, r0
	bne _08023D8C
	subs r0, r1, #1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r3, [r0]
	b _08023D90
	.align 2, 0
_08023D84: .4byte sArachnusBonkingSpeed
_08023D88: .4byte 0x00007FFF
_08023D8C:
	adds r0, r1, #1
	strb r0, [r6]
_08023D90:
	ldrh r0, [r4, #2]
	adds r0, r3, r0
	strh r0, [r4, #2]
	lsls r2, r5, #3
	subs r1, r2, r5
	lsls r1, r1, #3
	adds r1, r1, r7
	ldrh r0, [r1, #2]
	adds r0, r3, r0
	strh r0, [r1, #2]
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	movs r3, #8
	adds r6, r2, #0
	cmp r0, #0xb
	bls _08023DBA
	movs r3, #0
	cmp r0, #0x14
	bhi _08023DBA
	movs r3, #4
_08023DBA:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08023DE0
	ldrh r0, [r4, #4]
	subs r0, r0, r3
	strh r0, [r4, #4]
	subs r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r7
	ldrh r0, [r1, #4]
	subs r0, r0, r3
	strh r0, [r1, #4]
	adds r1, #0x2b
	lsrs r2, r3, #1
	ldrb r0, [r1]
	subs r0, r0, r2
	b _08023DFA
_08023DE0:
	ldrh r0, [r4, #4]
	adds r0, r3, r0
	strh r0, [r4, #4]
	subs r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r7
	ldrh r0, [r1, #4]
	adds r0, r3, r0
	strh r0, [r1, #4]
	adds r1, #0x2b
	lsrs r0, r3, #1
	ldrb r2, [r1]
	adds r0, r0, r2
_08023DFA:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _08023E22
	mov r0, ip
	bl SetSecondarySpriteOAMPointer
	ldr r0, _08023E28 @ =gSpriteData
	subs r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	ldr r0, _08023E2C @ =0x0000FF7F
	ands r0, r2
	strh r0, [r1]
	movs r0, #0xb5
	bl SoundPlay
_08023E22:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08023E28: .4byte gSpriteData
_08023E2C: .4byte 0x0000FF7F

	thumb_func_start ArachnusScreaming
ArachnusScreaming: @ 0x08023E30
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08023E76
	movs r0, #0x1a
	bl SpriteUtilCountSecondarySprites
	cmp r0, #0
	beq _08023E54
	ldr r0, _08023E50 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #7
	bls _08023E5C
	b _08023E6C
	.align 2, 0
_08023E50: .4byte gSpriteRandomNumber
_08023E54:
	ldr r0, _08023E64 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xa
	bls _08023E68
_08023E5C:
	bl ArachnusSlashingInit
	b _08023E76
	.align 2, 0
_08023E64: .4byte gSpriteRandomNumber
_08023E68:
	cmp r0, #6
	bls _08023E72
_08023E6C:
	bl ArachnusRollingInit
	b _08023E76
_08023E72:
	bl ArachnusShootingFireInit
_08023E76:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ArachnusDying
ArachnusDying: @ 0x08023E7C
	push {r4, r5, lr}
	ldr r2, _08023EBC @ =gWrittenToMosaic_H
	ldr r1, _08023EC0 @ =sXParasiteMosaicValues
	ldr r3, _08023EC4 @ =gCurrentSprite
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	ldrh r0, [r3, #2]
	subs r0, #0xa0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r4, [r3, #4]
	ldrh r0, [r3, #8]
	adds r2, r3, #0
	cmp r0, #0
	bne _08023EA8
	b _08023FB4
_08023EA8:
	ldrh r0, [r3, #6]
	cmp r0, #0x28
	bls _08023EB0
	b _0802410C
_08023EB0:
	lsls r0, r0, #2
	ldr r1, _08023EC8 @ =_08023ECC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023EBC: .4byte gWrittenToMosaic_H
_08023EC0: .4byte sXParasiteMosaicValues
_08023EC4: .4byte gCurrentSprite
_08023EC8: .4byte _08023ECC
_08023ECC: @ jump table
	.4byte _08023FAA @ case 0
	.4byte _0802410C @ case 1
	.4byte _0802410C @ case 2
	.4byte _0802410C @ case 3
	.4byte _0802410C @ case 4
	.4byte _0802410C @ case 5
	.4byte _0802410C @ case 6
	.4byte _0802410C @ case 7
	.4byte _0802410C @ case 8
	.4byte _0802410C @ case 9
	.4byte _08023F9A @ case 10
	.4byte _0802410C @ case 11
	.4byte _0802410C @ case 12
	.4byte _0802410C @ case 13
	.4byte _0802410C @ case 14
	.4byte _0802410C @ case 15
	.4byte _0802410C @ case 16
	.4byte _0802410C @ case 17
	.4byte _0802410C @ case 18
	.4byte _0802410C @ case 19
	.4byte _08023F8A @ case 20
	.4byte _0802410C @ case 21
	.4byte _0802410C @ case 22
	.4byte _0802410C @ case 23
	.4byte _0802410C @ case 24
	.4byte _0802410C @ case 25
	.4byte _0802410C @ case 26
	.4byte _0802410C @ case 27
	.4byte _0802410C @ case 28
	.4byte _0802410C @ case 29
	.4byte _08023F84 @ case 30
	.4byte _0802410C @ case 31
	.4byte _0802410C @ case 32
	.4byte _0802410C @ case 33
	.4byte _0802410C @ case 34
	.4byte _0802410C @ case 35
	.4byte _0802410C @ case 36
	.4byte _0802410C @ case 37
	.4byte _0802410C @ case 38
	.4byte _0802410C @ case 39
	.4byte _08023F70 @ case 40
_08023F70:
	adds r0, r5, #0
	subs r0, #0x10
	adds r1, r4, #0
	movs r2, #0x25
	bl ParticleSet
	adds r0, r5, #0
	adds r0, #0x10
	adds r1, r4, #0
	b _08023F92
_08023F84:
	adds r0, r5, #0
	subs r0, #0x20
	b _08023F9E
_08023F8A:
	adds r0, r5, #0
	adds r0, #0x40
	adds r1, r4, #0
	subs r1, #0x10
_08023F92:
	movs r2, #0x26
	bl ParticleSet
	b _0802410C
_08023F9A:
	adds r0, r5, #0
	subs r0, #0x40
_08023F9E:
	adds r1, r4, #0
	adds r1, #0x1c
	movs r2, #0x25
	bl ParticleSet
	b _0802410C
_08023FAA:
	movs r0, #0
	strh r0, [r2, #8]
	movs r0, #0x2c
	strh r0, [r2, #6]
	b _0802410C
_08023FB4:
	ldrh r0, [r3, #6]
	cmp r0, #0x28
	bls _08023FBC
	b _080240DE
_08023FBC:
	lsls r0, r0, #2
	ldr r1, _08023FC8 @ =_08023FCC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08023FC8: .4byte _08023FCC
_08023FCC: @ jump table
	.4byte _080240CE @ case 0
	.4byte _080240DE @ case 1
	.4byte _080240DE @ case 2
	.4byte _080240DE @ case 3
	.4byte _080240DE @ case 4
	.4byte _080240DE @ case 5
	.4byte _080240DE @ case 6
	.4byte _080240DE @ case 7
	.4byte _080240DE @ case 8
	.4byte _080240DE @ case 9
	.4byte _080240B0 @ case 10
	.4byte _080240DE @ case 11
	.4byte _080240DE @ case 12
	.4byte _080240DE @ case 13
	.4byte _080240DE @ case 14
	.4byte _080240DE @ case 15
	.4byte _080240DE @ case 16
	.4byte _080240DE @ case 17
	.4byte _080240DE @ case 18
	.4byte _080240DE @ case 19
	.4byte _0802409A @ case 20
	.4byte _080240DE @ case 21
	.4byte _080240DE @ case 22
	.4byte _080240DE @ case 23
	.4byte _080240DE @ case 24
	.4byte _080240DE @ case 25
	.4byte _080240DE @ case 26
	.4byte _080240DE @ case 27
	.4byte _080240DE @ case 28
	.4byte _080240DE @ case 29
	.4byte _08024086 @ case 30
	.4byte _080240DE @ case 31
	.4byte _080240DE @ case 32
	.4byte _080240DE @ case 33
	.4byte _080240DE @ case 34
	.4byte _080240DE @ case 35
	.4byte _080240DE @ case 36
	.4byte _080240DE @ case 37
	.4byte _080240DE @ case 38
	.4byte _080240DE @ case 39
	.4byte _08024070 @ case 40
_08024070:
	adds r0, r5, #0
	subs r0, #0x40
	subs r4, #0x10
	adds r1, r4, #0
	movs r2, #0x26
	bl ParticleSet
	adds r0, r5, #0
	adds r0, #0x20
	adds r1, r4, #0
	b _080240C6
_08024086:
	adds r0, r5, #0
	subs r0, #0x20
	adds r1, r4, #0
	adds r1, #0x1c
	movs r2, #0x26
	bl ParticleSet
	adds r0, r5, #0
	adds r0, #0x40
	b _080240C2
_0802409A:
	adds r0, r5, #0
	subs r0, #0x20
	subs r4, #0x10
	adds r1, r4, #0
	movs r2, #0x26
	bl ParticleSet
	adds r0, r5, #0
	adds r0, #0x40
	adds r1, r4, #0
	b _080240C6
_080240B0:
	adds r0, r5, #0
	subs r0, #0x40
	adds r1, r4, #0
	adds r1, #0x1c
	movs r2, #0x26
	bl ParticleSet
	adds r0, r5, #0
	adds r0, #0x20
_080240C2:
	adds r1, r4, #0
	adds r1, #0x20
_080240C6:
	movs r2, #0x25
	bl ParticleSet
	b _080240DE
_080240CE:
	ldr r2, _080240F4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	ldr r0, _080240F8 @ =gCoreXFormationSpriteId
	ldrb r0, [r0]
	strb r0, [r2, #0x1d]
_080240DE:
	ldr r1, _080240F4 @ =gCurrentSprite
	ldrh r0, [r1, #6]
	cmp r0, #0x13
	bhi _080240FC
	ldr r0, _080240F8 @ =gCoreXFormationSpriteId
	ldrb r0, [r0]
	ldrh r2, [r1, #6]
	movs r1, #0
	bl SpriteLoadGfx
	b _0802410C
	.align 2, 0
_080240F4: .4byte gCurrentSprite
_080240F8: .4byte gCoreXFormationSpriteId
_080240FC:
	cmp r0, #0x14
	bne _0802410C
	ldr r0, _08024114 @ =gCoreXFormationSpriteId
	ldrb r0, [r0]
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0802410C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024114: .4byte gCoreXFormationSpriteId

	thumb_func_start ArachnusShootingFire
ArachnusShootingFire: @ 0x08024118
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _08024160 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0, #0x16]
	cmp r0, #3
	bne _0802418A
	mov r1, ip
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0802418A
	ldrh r1, [r1]
	movs r4, #0x40
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08024164
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x80
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x40
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x1a
	movs r1, #0
	bl SpriteSpawnSecondary
	b _08024184
	.align 2, 0
_08024160: .4byte gCurrentSprite
_08024164:
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x80
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x1a
	movs r1, #0
	bl SpriteSpawnSecondary
_08024184:
	movs r0, #0xbc
	bl SoundPlay
_0802418A:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _080241A2
	ldr r1, _080241AC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
_080241A2:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080241AC: .4byte gCurrentSprite

	thumb_func_start ArachnusDetermineAttack
ArachnusDetermineAttack: @ 0x080241B0
	push {r4, r5, lr}
	ldr r5, _080241D0 @ =gCurrentSprite
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	cmp r0, #0
	beq _080241D4
	cmp r0, #0xff
	bne _080241C6
	bl ArachnusSlashingInit
_080241C6:
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	b _08024234
	.align 2, 0
_080241D0: .4byte gCurrentSprite
_080241D4:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080241FC
	movs r0, #0x1a
	bl SpriteUtilCountSecondarySprites
	cmp r0, #0
	bne _08024204
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08024204
	bl ArachnusShootingFireInit
	b _08024234
_080241FC:
	bl SamusCheckHangingOnLedge
	cmp r0, #0
	beq _0802420A
_08024204:
	bl ArachnusRollingInit
	b _08024234
_0802420A:
	movs r2, #0xc0
	lsls r2, r2, #1
	movs r0, #0xc0
	adds r1, r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	cmp r0, #3
	bne _08024220
	bl ArachnusSlashingInit
	b _08024234
_08024220:
	movs r2, #0x80
	lsls r2, r2, #2
	movs r0, #0xc0
	adds r1, r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	cmp r0, #3
	bne _08024234
	bl ArachnusRollingInit
_08024234:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ArachnusCoreXTransformation
ArachnusCoreXTransformation: @ 0x0802423C
	push {lr}
	ldr r3, _08024264 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08024270
	ldr r2, _08024268 @ =gWrittenToMosaic_H
	ldr r1, _0802426C @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08024284
	.align 2, 0
_08024264: .4byte gCurrentSprite
_08024268: .4byte gWrittenToMosaic_H
_0802426C: .4byte sXParasiteMosaicValues
_08024270:
	ldrh r0, [r3]
	ldr r1, _08024288 @ =0x00007FFF
	ands r1, r0
	adds r2, r3, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	ldr r0, _0802428C @ =0x0000FFDF
	ands r1, r0
	strh r1, [r3]
_08024284:
	pop {r0}
	bx r0
	.align 2, 0
_08024288: .4byte 0x00007FFF
_0802428C: .4byte 0x0000FFDF

	thumb_func_start ArachnusInit
ArachnusInit: @ 0x08024290
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _08024308 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	movs r2, #0x40
	movs r4, #0
	orrs r0, r2
	mov r1, ip
	strh r0, [r1]
	ldr r3, _0802430C @ =sPrimarySpriteStats
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r0, ip
	adds r0, #0x25
	movs r3, #2
	strb r3, [r0]
	adds r0, #2
	strb r2, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x24
	ldrb r0, [r2]
	mov r5, ip
	cmp r0, #0x59
	bne _08024314
	ldrh r0, [r5, #2]
	adds r0, #0x64
	strh r0, [r5, #2]
	adds r0, r5, #0
	adds r0, #0x21
	strb r3, [r0]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	ldrh r1, [r5]
	ldr r0, _08024310 @ =0x0000F3FF
	ands r0, r1
	strh r0, [r5]
	movs r0, #0x5a
	strb r0, [r2]
	movs r0, #0x2c
	strh r0, [r5, #6]
	b _08024318
	.align 2, 0
_08024308: .4byte gCurrentSprite
_0802430C: .4byte sPrimarySpriteStats
_08024310: .4byte 0x0000F3FF
_08024314:
	movs r0, #8
	strb r0, [r2]
_08024318:
	adds r4, r5, #0
	ldr r0, _0802437C @ =0x08302C44
	str r0, [r4, #0x18]
	movs r0, #0
	mov r8, r0
	mov r1, r8
	strb r1, [r4, #0x1c]
	mov r0, r8
	strh r0, [r4, #0x16]
	bl ArachnusSetStandingHitbox
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	adds r7, r4, #0
	adds r7, #0x23
	ldrb r3, [r7]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r6, #0x40
	str r6, [sp, #8]
	movs r0, #0x15
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0802439E
	adds r1, r4, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x17
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _08024380
	mov r0, r8
	strh r0, [r4]
	b _080243C6
	.align 2, 0
_0802437C: .4byte 0x08302C44
_08024380:
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x18
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080243A4
_0802439E:
	mov r1, r8
	strh r1, [r4]
	b _080243C6
_080243A4:
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x19
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _080243C6
	mov r0, r8
	strh r0, [r5]
_080243C6:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ArachnusWalkingInit
ArachnusWalkingInit: @ 0x080243D4
	push {lr}
	ldr r1, _080243F8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _080243FC @ =0x083028F4
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bl ArachnusSetStandingHitbox
	ldr r0, _08024400 @ =0x08302924
	bl SetSecondarySpriteOAMPointer
	pop {r0}
	bx r0
	.align 2, 0
_080243F8: .4byte gCurrentSprite
_080243FC: .4byte 0x083028F4
_08024400: .4byte 0x08302924

	thumb_func_start ArachnusWalking
ArachnusWalking: @ 0x08024404
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0802444C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08024454
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08024450 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0802448E
	ldrh r0, [r4, #2]
	subs r0, #0x48
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802448A
	b _0802448E
	.align 2, 0
_0802444C: .4byte gCurrentSprite
_08024450: .4byte gPreviousCollisionCheck
_08024454:
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08024498 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _0802448E
	ldrh r0, [r4, #2]
	subs r0, #0x48
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802448A
	movs r6, #1
_0802448A:
	cmp r6, #0
	beq _080244A0
_0802448E:
	ldr r0, _0802449C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
	strb r1, [r0]
	b _08024528
	.align 2, 0
_08024498: .4byte gPreviousCollisionCheck
_0802449C: .4byte gCurrentSprite
_080244A0:
	ldr r1, _080244B4 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #1
	beq _080244D6
	cmp r0, #1
	bgt _080244B8
	cmp r0, #0
	beq _080244C2
	b _080244DA
	.align 2, 0
_080244B4: .4byte gCurrentSprite
_080244B8:
	cmp r0, #2
	beq _080244D2
	cmp r0, #3
	beq _080244D6
	b _080244DA
_080244C2:
	movs r4, #1
	ldrb r0, [r1, #0x1c]
	cmp r0, #9
	bne _080244DC
	movs r0, #0xb8
	bl SoundPlay
	b _080244DC
_080244D2:
	movs r4, #3
	b _080244DC
_080244D6:
	movs r4, #2
	b _080244DC
_080244DA:
	movs r4, #0
_080244DC:
	ldr r3, _08024504 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802450C
	ldrh r0, [r3, #4]
	adds r0, r4, r0
	strh r0, [r3, #4]
	ldr r2, _08024508 @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	adds r1, r4, r1
	b _08024526
	.align 2, 0
_08024504: .4byte gCurrentSprite
_08024508: .4byte gSpriteData
_0802450C:
	ldrh r0, [r3, #4]
	subs r0, r0, r4
	strh r0, [r3, #4]
	ldr r2, _08024534 @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #4]
	subs r1, r1, r4
_08024526:
	strh r1, [r0, #4]
_08024528:
	bl ArachnusDetermineAttack
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024534: .4byte gSpriteData

	thumb_func_start ArachnusIdleInit
ArachnusIdleInit: @ 0x08024538
	push {r4, lr}
	ldr r0, _08024584 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	subs r1, #1
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0xff
	bne _080245A2
	ldrh r1, [r3]
	ldr r0, _08024588 @ =0x0000DFFF
	ands r0, r1
	movs r4, #0
	strh r0, [r3]
	ldr r1, _0802458C @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r0, [r2]
	ldr r1, _08024590 @ =0x0000FF7F
	ands r1, r0
	strh r1, [r2]
	ldr r0, _08024594 @ =0x0000FF60
	strh r0, [r2, #0xa]
	strh r4, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0802459C
	ldr r0, _08024598 @ =0x0000FFB0
	strh r0, [r2, #0xe]
	strh r4, [r2, #0x10]
	b _080245A2
	.align 2, 0
_08024584: .4byte gCurrentSprite
_08024588: .4byte 0x0000DFFF
_0802458C: .4byte gSpriteData
_08024590: .4byte 0x0000FF7F
_08024594: .4byte 0x0000FF60
_08024598: .4byte 0x0000FFB0
_0802459C:
	strh r0, [r2, #0xe]
	movs r0, #0x50
	strh r0, [r2, #0x10]
_080245A2:
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	ldr r0, _080245C4 @ =0x08302C44
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	bl ArachnusSetStandingHitbox
	ldr r0, _080245C8 @ =0x08302C6C
	bl SetSecondarySpriteOAMPointer
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080245C4: .4byte 0x08302C44
_080245C8: .4byte 0x08302C6C

	thumb_func_start ArachnusIdle
ArachnusIdle: @ 0x080245CC
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802460C
	ldr r2, _080245F0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080245F8
	ldr r1, _080245F4 @ =gSamusData
	ldrh r0, [r2, #4]
	movs r3, #1
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08024606
	b _08024604
	.align 2, 0
_080245F0: .4byte gCurrentSprite
_080245F4: .4byte gSamusData
_080245F8:
	ldr r1, _08024610 @ =gSamusData
	ldrh r0, [r2, #4]
	movs r3, #1
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _08024606
_08024604:
	movs r3, #3
_08024606:
	adds r0, r2, #0
	adds r0, #0x24
	strb r3, [r0]
_0802460C:
	pop {r0}
	bx r0
	.align 2, 0
_08024610: .4byte gSamusData

	thumb_func_start ArachnusTurningInit
ArachnusTurningInit: @ 0x08024614
	push {lr}
	ldr r1, _0802463C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #4
	strb r0, [r2]
	ldr r0, _08024640 @ =0x083029C4
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _08024644 @ =0x0000FFE0
	strh r0, [r1, #0xe]
	movs r0, #0x20
	strh r0, [r1, #0x10]
	ldr r0, _08024648 @ =0x08302A04
	bl SetSecondarySpriteOAMPointer
	pop {r0}
	bx r0
	.align 2, 0
_0802463C: .4byte gCurrentSprite
_08024640: .4byte 0x083029C4
_08024644: .4byte 0x0000FFE0
_08024648: .4byte 0x08302A04

	thumb_func_start ArachnusTurning
ArachnusTurning: @ 0x0802464C
	push {lr}
	ldr r1, _08024690 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	ldrb r0, [r1, #0x1c]
	cmp r0, #4
	bne _080246A2
	ldrh r0, [r1, #0x16]
	cmp r0, #2
	bne _080246A2
	ldrh r0, [r1]
	movs r2, #0x40
	eors r0, r2
	strh r0, [r1]
	ldr r1, _08024694 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r3, r0, r1
	ldrh r0, [r3]
	eors r0, r2
	strh r0, [r3]
	movs r1, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0802469C
	ldr r0, _08024698 @ =0x0000FFB0
	strh r0, [r3, #0xe]
	movs r0, #0
	b _080246A0
	.align 2, 0
_08024690: .4byte gCurrentSprite
_08024694: .4byte gSpriteData
_08024698: .4byte 0x0000FFB0
_0802469C:
	strh r0, [r3, #0xe]
	movs r0, #0x50
_080246A0:
	strh r0, [r3, #0x10]
_080246A2:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _080246B2
	ldr r0, _080246B8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_080246B2:
	pop {r0}
	bx r0
	.align 2, 0
_080246B8: .4byte gCurrentSprite

	thumb_func_start Arachnus
Arachnus: @ 0x080246BC
	push {lr}
	ldr r2, _080246F0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r3, [r0]
	cmp r3, #0
	beq _08024718
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	beq _08024714
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #5
	bls _080246F4
	cmp r3, #2
	beq _080246E6
	cmp r3, #8
	bne _08024718
_080246E6:
	cmp r3, #0x3e
	beq _08024718
	bl ArachnusScreamingInit
	b _08024718
	.align 2, 0
_080246F0: .4byte gCurrentSprite
_080246F4:
	cmp r1, #2
	bls _08024718
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	movs r3, #0
	orrs r1, r0
	strh r1, [r2]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08024718
	strb r3, [r1]
	b _08024718
_08024714:
	bl ArachnusDyingInit
_08024718:
	ldr r0, _08024730 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bls _08024724
	b _080248F4
_08024724:
	lsls r0, r0, #2
	ldr r1, _08024734 @ =_08024738
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024730: .4byte gCurrentSprite
_08024734: .4byte _08024738
_08024738: @ jump table
	.4byte _080248AE @ case 0
	.4byte _080248B4 @ case 1
	.4byte _080248B8 @ case 2
	.4byte _080248C8 @ case 3
	.4byte _080248CC @ case 4
	.4byte _080248F4 @ case 5
	.4byte _080248F4 @ case 6
	.4byte _080248BE @ case 7
	.4byte _080248C2 @ case 8
	.4byte _080248F4 @ case 9
	.4byte _080248F4 @ case 10
	.4byte _080248F4 @ case 11
	.4byte _080248F4 @ case 12
	.4byte _080248F4 @ case 13
	.4byte _080248F4 @ case 14
	.4byte _080248F4 @ case 15
	.4byte _080248F4 @ case 16
	.4byte _080248F4 @ case 17
	.4byte _080248F4 @ case 18
	.4byte _080248F4 @ case 19
	.4byte _080248F4 @ case 20
	.4byte _080248F4 @ case 21
	.4byte _080248F4 @ case 22
	.4byte _080248F4 @ case 23
	.4byte _080248F4 @ case 24
	.4byte _080248F4 @ case 25
	.4byte _080248F4 @ case 26
	.4byte _080248F4 @ case 27
	.4byte _080248F4 @ case 28
	.4byte _080248F4 @ case 29
	.4byte _080248F4 @ case 30
	.4byte _080248F4 @ case 31
	.4byte _080248F4 @ case 32
	.4byte _080248F4 @ case 33
	.4byte _080248F4 @ case 34
	.4byte _080248F4 @ case 35
	.4byte _080248F4 @ case 36
	.4byte _080248F4 @ case 37
	.4byte _080248F4 @ case 38
	.4byte _080248F4 @ case 39
	.4byte _080248F4 @ case 40
	.4byte _080248F4 @ case 41
	.4byte _080248F4 @ case 42
	.4byte _080248F4 @ case 43
	.4byte _080248F4 @ case 44
	.4byte _080248F4 @ case 45
	.4byte _080248F4 @ case 46
	.4byte _080248F4 @ case 47
	.4byte _080248F4 @ case 48
	.4byte _080248F4 @ case 49
	.4byte _080248F4 @ case 50
	.4byte _080248F4 @ case 51
	.4byte _080248F4 @ case 52
	.4byte _080248F4 @ case 53
	.4byte _080248F4 @ case 54
	.4byte _080248F4 @ case 55
	.4byte _080248D2 @ case 56
	.4byte _080248F4 @ case 57
	.4byte _080248D8 @ case 58
	.4byte _080248F4 @ case 59
	.4byte _080248DE @ case 60
	.4byte _080248F4 @ case 61
	.4byte _080248E4 @ case 62
	.4byte _080248F4 @ case 63
	.4byte _080248EA @ case 64
	.4byte _080248F4 @ case 65
	.4byte _080248F0 @ case 66
	.4byte _080248F4 @ case 67
	.4byte _080248F4 @ case 68
	.4byte _080248F4 @ case 69
	.4byte _080248F4 @ case 70
	.4byte _080248F4 @ case 71
	.4byte _080248F4 @ case 72
	.4byte _080248F4 @ case 73
	.4byte _080248F4 @ case 74
	.4byte _080248F4 @ case 75
	.4byte _080248F4 @ case 76
	.4byte _080248F4 @ case 77
	.4byte _080248F4 @ case 78
	.4byte _080248F4 @ case 79
	.4byte _080248F4 @ case 80
	.4byte _080248F4 @ case 81
	.4byte _080248F4 @ case 82
	.4byte _080248F4 @ case 83
	.4byte _080248F4 @ case 84
	.4byte _080248F4 @ case 85
	.4byte _080248F4 @ case 86
	.4byte _080248F4 @ case 87
	.4byte _080248F4 @ case 88
	.4byte _080248A4 @ case 89
	.4byte _080248A8 @ case 90
_080248A4:
	bl ArachnusInit
_080248A8:
	bl ArachnusCoreXTransformation
	b _080248F4
_080248AE:
	bl ArachnusInit
	b _080248F4
_080248B4:
	bl ArachnusWalkingInit
_080248B8:
	bl ArachnusWalking
	b _080248F4
_080248BE:
	bl ArachnusIdleInit
_080248C2:
	bl ArachnusIdle
	b _080248F4
_080248C8:
	bl ArachnusTurningInit
_080248CC:
	bl ArachnusTurning
	b _080248F4
_080248D2:
	bl ArachnusSlashing
	b _080248F4
_080248D8:
	bl ArachnusRolling
	b _080248F4
_080248DE:
	bl ArachnusBonking
	b _080248F4
_080248E4:
	bl ArachnusScreaming
	b _080248F4
_080248EA:
	bl ArachnusShootingFire
	b _080248F4
_080248F0:
	bl ArachnusDying
_080248F4:
	pop {r0}
	bx r0

	thumb_func_start ArachnusShell
ArachnusShell: @ 0x080248F8
	push {r4, r5, r6, lr}
	ldr r0, _0802496C @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r5, [r1]
	adds r6, r0, #0
	adds r6, #0x24
	ldrb r2, [r6]
	adds r3, r0, #0
	cmp r2, #0
	bne _0802498A
	ldrh r1, [r3]
	ldr r0, _08024970 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	ldr r1, _08024974 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08024978 @ =0x0000FF60
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	ldr r0, _0802497C @ =0x08302C6C
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r2, [r3, #0x16]
	subs r1, #4
	movs r0, #2
	strb r0, [r1]
	strb r0, [r6]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _08024984
	ldr r0, _08024980 @ =0x0000FFB0
	strh r0, [r3, #0xe]
	strh r2, [r3, #0x10]
	b _0802498A
	.align 2, 0
_0802496C: .4byte gCurrentSprite
_08024970: .4byte 0x0000FFFB
_08024974: .4byte sSecondarySpriteStats
_08024978: .4byte 0x0000FF60
_0802497C: .4byte 0x08302C6C
_08024980: .4byte 0x0000FFB0
_08024984:
	strh r0, [r3, #0xe]
	movs r0, #0x50
	strh r0, [r3, #0x10]
_0802498A:
	ldr r1, _080249C4 @ =gSpriteData
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #2
	bne _080249EA
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _080249EA
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080249CC
	ldr r1, _080249C8 @ =gSamusData
	ldrh r0, [r3, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _080249EA
	b _080249D6
	.align 2, 0
_080249C4: .4byte gSpriteData
_080249C8: .4byte gSamusData
_080249CC:
	ldr r1, _08024A04 @ =gSamusData
	ldrh r0, [r3, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _080249EA
_080249D6:
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
_080249EA:
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r4
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08024A08
	ldrh r1, [r3]
	movs r0, #0x20
	orrs r0, r1
	b _08024A0E
	.align 2, 0
_08024A04: .4byte gSamusData
_08024A08:
	ldrh r1, [r3]
	ldr r0, _08024A28 @ =0x0000FFDF
	ands r0, r1
_08024A0E:
	strh r0, [r3]
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r4
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x59
	bne _08024A22
	movs r0, #0
	strh r0, [r3]
_08024A22:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024A28: .4byte 0x0000FFDF

	thumb_func_start ArachnusPart
ArachnusPart: @ 0x08024A2C
	push {r4, r5, r6, lr}
	ldr r1, _08024A60 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r5, [r0]
	ldr r2, _08024A64 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #2
	beq _08024A90
	cmp r0, #2
	bgt _08024A68
	cmp r0, #1
	beq _08024A6E
	b _08024A84
	.align 2, 0
_08024A60: .4byte gCurrentSprite
_08024A64: .4byte gSpriteData
_08024A68:
	cmp r0, #7
	beq _08024A90
	b _08024A84
_08024A6E:
	ldrh r1, [r4]
	ldr r0, _08024A80 @ =0x0000DFFF
	ands r0, r1
	movs r1, #0
	strh r0, [r4]
	strb r1, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x16]
	b _08024A90
	.align 2, 0
_08024A80: .4byte 0x0000DFFF
_08024A84:
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_08024A90:
	lsls r3, r5, #3
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r1, [r0, #4]
	strh r1, [r4, #4]
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r2, [r1]
	adds r1, r4, #0
	adds r1, #0x20
	strb r2, [r1]
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08024ABE
	ldrh r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	b _08024AC4
_08024ABE:
	ldrh r1, [r4]
	ldr r0, _08024AE0 @ =0x0000FFBF
	ands r0, r1
_08024AC4:
	strh r0, [r4]
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x59
	bne _08024AD8
	movs r0, #0
	strh r0, [r4]
_08024AD8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024AE0: .4byte 0x0000FFBF

	thumb_func_start ArachnusHead
ArachnusHead: @ 0x08024AE4
	push {r4, r5, lr}
	ldr r3, _08024B40 @ =gCurrentSprite
	adds r5, r3, #0
	adds r5, #0x24
	ldrb r4, [r5]
	cmp r4, #0
	bne _08024B34
	ldrh r1, [r3]
	ldr r0, _08024B44 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x20
	strb r0, [r1]
	ldr r1, _08024B48 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldr r0, _08024B4C @ =0x0830294C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #2
	strb r0, [r5]
_08024B34:
	bl ArachnusPart
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024B40: .4byte gCurrentSprite
_08024B44: .4byte 0x0000FFFB
_08024B48: .4byte 0x0000FFFC
_08024B4C: .4byte 0x0830294C

	thumb_func_start ArachnusArm1
ArachnusArm1: @ 0x08024B50
	push {r4, r5, r6, lr}
	ldr r3, _08024BB4 @ =gCurrentSprite
	adds r5, r3, #0
	adds r5, #0x24
	ldrb r4, [r5]
	cmp r4, #0
	bne _08024BAA
	ldrh r1, [r3]
	ldr r0, _08024BB8 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x22
	movs r1, #4
	strb r1, [r0]
	movs r0, #0x27
	adds r0, r0, r3
	mov ip, r0
	movs r0, #0x20
	mov r6, ip
	strb r0, [r6]
	adds r0, r3, #0
	adds r0, #0x28
	strb r2, [r0]
	movs r0, #0x29
	adds r0, r0, r3
	mov ip, r0
	movs r0, #0x28
	mov r6, ip
	strb r0, [r6]
	ldr r0, _08024BBC @ =0x0000FFFC
	strh r0, [r3, #0xa]
	strh r1, [r3, #0xc]
	strh r0, [r3, #0xe]
	strh r1, [r3, #0x10]
	ldr r0, _08024BC0 @ =0x0830299C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #2
	strb r0, [r5]
_08024BAA:
	bl ArachnusPart
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024BB4: .4byte gCurrentSprite
_08024BB8: .4byte 0x0000FFFB
_08024BBC: .4byte 0x0000FFFC
_08024BC0: .4byte 0x0830299C

	thumb_func_start ArachnusArm2
ArachnusArm2: @ 0x08024BC4
	push {r4, r5, r6, lr}
	ldr r0, _08024C24 @ =gCurrentSprite
	mov ip, r0
	mov r5, ip
	adds r5, #0x24
	ldrb r4, [r5]
	cmp r4, #0
	bne _08024C18
	mov r6, ip
	ldrh r1, [r6]
	ldr r0, _08024C28 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r6]
	mov r0, ip
	adds r0, #0x22
	movs r3, #2
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x28
	strb r0, [r1]
	ldr r1, _08024C2C @ =0x0000FFFC
	strh r1, [r6, #0xa]
	movs r0, #4
	strh r0, [r6, #0xc]
	strh r1, [r6, #0xe]
	strh r0, [r6, #0x10]
	ldr r0, _08024C30 @ =0x08302974
	str r0, [r6, #0x18]
	strb r2, [r6, #0x1c]
	strh r4, [r6, #0x16]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	strb r3, [r5]
_08024C18:
	bl ArachnusPart
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08024C24: .4byte gCurrentSprite
_08024C28: .4byte 0x0000FFFB
_08024C2C: .4byte 0x0000FFFC
_08024C30: .4byte 0x08302974

	thumb_func_start ArachnusFire
ArachnusFire: @ 0x08024C34
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r3, _08024C80 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _08024C84 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	adds r4, r3, #0
	cmp r0, #0x42
	bne _08024C68
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x38
	beq _08024C68
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x28
	strb r0, [r1]
_08024C68:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x38
	bls _08024C74
	b _08024FD2
_08024C74:
	lsls r0, r0, #2
	ldr r1, _08024C88 @ =_08024C8C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08024C80: .4byte gCurrentSprite
_08024C84: .4byte gSpriteData
_08024C88: .4byte _08024C8C
_08024C8C: @ jump table
	.4byte _08024D70 @ case 0
	.4byte _08024FD2 @ case 1
	.4byte _08024E00 @ case 2
	.4byte _08024FD2 @ case 3
	.4byte _08024FD2 @ case 4
	.4byte _08024FD2 @ case 5
	.4byte _08024FD2 @ case 6
	.4byte _08024FD2 @ case 7
	.4byte _08024FD2 @ case 8
	.4byte _08024FD2 @ case 9
	.4byte _08024FD2 @ case 10
	.4byte _08024FD2 @ case 11
	.4byte _08024FD2 @ case 12
	.4byte _08024FD2 @ case 13
	.4byte _08024FD2 @ case 14
	.4byte _08024FD2 @ case 15
	.4byte _08024FD2 @ case 16
	.4byte _08024FD2 @ case 17
	.4byte _08024FD2 @ case 18
	.4byte _08024FD2 @ case 19
	.4byte _08024FD2 @ case 20
	.4byte _08024FD2 @ case 21
	.4byte _08024FD2 @ case 22
	.4byte _08024FD2 @ case 23
	.4byte _08024E60 @ case 24
	.4byte _08024FD2 @ case 25
	.4byte _08024EE0 @ case 26
	.4byte _08024FD2 @ case 27
	.4byte _08024F10 @ case 28
	.4byte _08024FD2 @ case 29
	.4byte _08024FD2 @ case 30
	.4byte _08024FD2 @ case 31
	.4byte _08024FD2 @ case 32
	.4byte _08024FD2 @ case 33
	.4byte _08024FD2 @ case 34
	.4byte _08024FD2 @ case 35
	.4byte _08024FD2 @ case 36
	.4byte _08024FD2 @ case 37
	.4byte _08024FD2 @ case 38
	.4byte _08024FD2 @ case 39
	.4byte _08024FD2 @ case 40
	.4byte _08024FD2 @ case 41
	.4byte _08024F40 @ case 42
	.4byte _08024FD2 @ case 43
	.4byte _08024F70 @ case 44
	.4byte _08024FD2 @ case 45
	.4byte _08024FD2 @ case 46
	.4byte _08024FD2 @ case 47
	.4byte _08024FD2 @ case 48
	.4byte _08024FD2 @ case 49
	.4byte _08024FD2 @ case 50
	.4byte _08024FD2 @ case 51
	.4byte _08024FD2 @ case 52
	.4byte _08024FD2 @ case 53
	.4byte _08024FD2 @ case 54
	.4byte _08024FC4 @ case 55
	.4byte _08024F90 @ case 56
_08024D70:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	movs r5, #0
	orrs r0, r1
	strb r0, [r2]
	ldrh r1, [r4]
	ldr r0, _08024DD4 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x28
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	strb r3, [r0]
	adds r1, #2
	movs r0, #8
	strb r0, [r1]
	strh r5, [r4, #0xc]
	ldr r0, _08024DD8 @ =0x0000FFE8
	strh r0, [r4, #0xe]
	movs r0, #0x18
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r3, [r0]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	bne _08024DE4
	ldr r0, _08024DDC @ =0x08303170
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r5, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	ldr r0, _08024DE0 @ =0x0000FFD0
	strh r0, [r4, #0xa]
	b _08024FD2
	.align 2, 0
_08024DD4: .4byte 0x0000FFFB
_08024DD8: .4byte 0x0000FFE8
_08024DDC: .4byte 0x08303170
_08024DE0: .4byte 0x0000FFD0
_08024DE4:
	ldr r0, _08024DFC @ =0x08303138
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r5, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	b _08024E28
	.align 2, 0
_08024DFC: .4byte 0x08303138
_08024E00:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08024E34 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08024E40
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08024E38 @ =0x08303138
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
_08024E28:
	ldr r0, _08024E3C @ =0x0000FFC0
	strh r0, [r4, #0xa]
	movs r0, #0xbd
	bl SoundPlay
	b _08024FD2
	.align 2, 0
_08024E34: .4byte gPreviousCollisionCheck
_08024E38: .4byte 0x08303138
_08024E3C: .4byte 0x0000FFC0
_08024E40:
	ldrh r0, [r4, #2]
	adds r0, #5
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08024E58
	ldrh r0, [r4, #4]
	adds r0, #6
	strh r0, [r4, #4]
	b _08024FD2
_08024E58:
	ldrh r0, [r4, #4]
	subs r0, #6
	strh r0, [r4, #4]
	b _08024FD2
_08024E60:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _08024EC6
	ldrb r0, [r4, #0x1e]
	cmp r0, #6
	bhi _08024EC6
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08024EA8
	ldrb r1, [r4, #0x1e]
	adds r1, #1
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x38
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1a
	bl SpriteSpawnSecondary
	b _08024EC6
_08024EA8:
	ldrb r1, [r4, #0x1e]
	adds r1, #1
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x38
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x1a
	bl SpriteSpawnSecondary
_08024EC6:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	bne _08024ED0
	b _08024FD2
_08024ED0:
	ldr r1, _08024EDC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	b _08024F22
	.align 2, 0
_08024EDC: .4byte gCurrentSprite
_08024EE0:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08024FD2
	ldr r1, _08024F04 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _08024F08 @ =0x083030C8
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _08024F0C @ =0x0000FF80
	strh r0, [r1, #0xa]
	b _08024FD2
	.align 2, 0
_08024F04: .4byte gCurrentSprite
_08024F08: .4byte 0x083030C8
_08024F0C: .4byte 0x0000FF80
_08024F10:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08024FD2
	ldr r1, _08024F34 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x2a
_08024F22:
	strb r0, [r2]
	ldr r0, _08024F38 @ =0x08303100
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _08024F3C @ =0x0000FFA0
	strh r0, [r1, #0xa]
	b _08024FD2
	.align 2, 0
_08024F34: .4byte gCurrentSprite
_08024F38: .4byte 0x08303100
_08024F3C: .4byte 0x0000FFA0
_08024F40:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08024FD2
	ldr r1, _08024F64 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x2c
	strb r0, [r2]
	ldr r0, _08024F68 @ =0x08303138
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _08024F6C @ =0x0000FFC0
	strh r0, [r1, #0xa]
	b _08024FD2
	.align 2, 0
_08024F64: .4byte gCurrentSprite
_08024F68: .4byte 0x08303138
_08024F6C: .4byte 0x0000FFC0
_08024F70:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08024FD2
	ldr r1, _08024F8C @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x25
	bl ParticleSet
	b _08024FD2
	.align 2, 0
_08024F8C: .4byte gCurrentSprite
_08024F90:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08024FC0 @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08024FAA
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
_08024FAA:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08024FD2
	strh r0, [r4]
	b _08024FD2
	.align 2, 0
_08024FC0: .4byte gFrameCounter8Bit
_08024FC4:
	movs r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x25
	bl ParticleSet
_08024FD2:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ArachnusSlash
ArachnusSlash: @ 0x08024FDC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r2, _08025028 @ =gSpriteData
	ldr r3, _0802502C @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	adds r2, r3, #0
	cmp r0, #0x42
	bne _08025010
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x38
	beq _08025010
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x28
	strb r0, [r1]
_08025010:
	adds r5, r2, #0
	adds r7, r5, #0
	adds r7, #0x24
	ldrb r6, [r7]
	cmp r6, #2
	beq _080250F8
	cmp r6, #2
	bgt _08025030
	cmp r6, #0
	beq _08025038
	b _080251BA
	.align 2, 0
_08025028: .4byte gSpriteData
_0802502C: .4byte gCurrentSprite
_08025030:
	cmp r6, #0x38
	bne _08025036
	b _0802518C
_08025036:
	b _080251BA
_08025038:
	ldrh r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r2, r1, #0
	movs r4, #0
	orrs r2, r0
	adds r3, r5, #0
	adds r3, #0x34
	ldrb r1, [r3]
	movs r0, #4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080250B0 @ =0x0000FFFB
	ands r2, r0
	strh r2, [r5]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _080250B4 @ =0x0000FF40
	strh r0, [r5, #0xa]
	strh r6, [r5, #0xc]
	adds r0, #0xa0
	strh r0, [r5, #0xe]
	movs r0, #0x20
	strh r0, [r5, #0x10]
	ldr r0, _080250B8 @ =0x08303198
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r6, [r5, #0x16]
	subs r1, #4
	movs r0, #2
	strb r0, [r1]
	strb r0, [r7]
	movs r4, #0x40
	ands r2, r4
	lsls r2, r2, #0x10
	lsrs r1, r2, #0x10
	cmp r1, #0
	beq _080250BC
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0xc
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _080250D0
	.align 2, 0
_080250B0: .4byte 0x0000FFFB
_080250B4: .4byte 0x0000FF40
_080250B8: .4byte 0x08303198
_080250BC:
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0xc
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
_080250D0:
	movs r0, #0x20
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	bne _080250EC
	ldr r1, _080250E8 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _080251BA
	.align 2, 0
_080250E8: .4byte gCurrentSprite
_080250EC:
	ldr r0, _080250F4 @ =gCurrentSprite
	adds r0, #0x2f
	strb r1, [r0]
	b _080251BA
	.align 2, 0
_080250F4: .4byte gCurrentSprite
_080250F8:
	ldrh r0, [r5, #2]
	subs r0, #0x60
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0802514C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025154
	movs r2, #0
	strh r2, [r5]
	ldr r3, _08025150 @ =gSpriteData
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	strh r2, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0x60
	ldrh r1, [r5, #4]
	movs r2, #0x25
	bl ParticleSet
	ldrh r0, [r5, #2]
	subs r0, #0x20
	ldrh r1, [r5, #4]
	movs r2, #0x25
	bl ParticleSet
	ldrh r0, [r5, #2]
	subs r0, #0xa0
	ldrh r1, [r5, #4]
	movs r2, #0x25
	bl ParticleSet
	movs r0, #0xbf
	bl SoundPlayNotAlreadyPlaying
	b _080251BA
	.align 2, 0
_0802514C: .4byte gPreviousCollisionCheck
_08025150: .4byte gSpriteData
_08025154:
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08025164
	ldrh r0, [r5, #4]
	adds r0, #0xc
	b _08025168
_08025164:
	ldrh r0, [r5, #4]
	subs r0, #0xc
_08025168:
	strh r0, [r5, #4]
	ldr r3, _08025184 @ =gSpriteData
	ldr r2, _08025188 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r2, #4]
	strh r1, [r0, #4]
	b _080251BA
	.align 2, 0
_08025184: .4byte gSpriteData
_08025188: .4byte gCurrentSprite
_0802518C:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r1, _080251C4 @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080251A6
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
_080251A6:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080251BA
	strh r0, [r2]
_080251BA:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080251C4: .4byte gFrameCounter8Bit

	thumb_func_start ArachnusSlashTrail
ArachnusSlashTrail: @ 0x080251C8
	push {r4, r5, r6, lr}
	ldr r2, _080251EC @ =gSpriteData
	ldr r0, _080251F0 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x42
	bne _080251F4
	movs r0, #0
	mov r1, ip
	strh r0, [r1]
	b _0802525E
	.align 2, 0
_080251EC: .4byte gSpriteData
_080251F0: .4byte gCurrentSprite
_080251F4:
	mov r1, ip
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x24
	ldrb r5, [r6]
	cmp r5, #0
	bne _0802525E
	mov r3, ip
	ldrh r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r2, r1, #0
	movs r4, #0
	orrs r2, r0
	adds r3, #0x34
	ldrb r0, [r3]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _08025264 @ =0x0000FFFB
	ands r2, r0
	mov r3, ip
	strh r2, [r3]
	mov r0, ip
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #0x40
	strb r0, [r1]
	ldr r1, _08025268 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldr r0, _0802526C @ =0x083031B8
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r5, [r3, #0x16]
	mov r0, ip
	adds r0, #0x25
	strb r4, [r0]
	strb r2, [r6]
_0802525E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08025264: .4byte 0x0000FFFB
_08025268: .4byte 0x0000FFFC
_0802526C: .4byte 0x083031B8
