    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start IceBeamAbilitySpawningFromX
IceBeamAbilitySpawningFromX: @ 0x08058934
	push {r4, lr}
	ldr r0, _08058964 @ =gCurrentSprite
	adds r4, r0, #0
	adds r4, #0x2e
	ldrb r1, [r4]
	subs r1, #1
	strb r1, [r4]
	ldr r3, _08058968 @ =gWrittenToMosaic_H
	ldr r2, _0805896C @ =sXParasiteMosaicValues
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #7
	bhi _08058970
	ldrb r2, [r4]
	movs r0, #0x4d
	movs r1, #0
	bl SpriteLoadGfx
	b _0805897E
	.align 2, 0
_08058964: .4byte gCurrentSprite
_08058968: .4byte gWrittenToMosaic_H
_0805896C: .4byte sXParasiteMosaicValues
_08058970:
	cmp r1, #8
	bne _0805897E
	movs r0, #0x4d
	movs r1, #0
	movs r2, #2
	bl SpriteLoadPal
_0805897E:
	ldr r2, _080589A0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805899A
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _080589A4 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
_0805899A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080589A0: .4byte gCurrentSprite
_080589A4: .4byte 0x0000FFDF

	thumb_func_start IceBeamAbilityInit
IceBeamAbilityInit: @ 0x080589A8
	push {r4, r5, r6, lr}
	ldr r3, _08058A04 @ =gCurrentSprite
	ldrh r0, [r3]
	ldr r5, _08058A08 @ =0x0000FFFB
	ands r5, r0
	movs r6, #0
	movs r2, #0
	strh r5, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r6, [r0]
	adds r0, #2
	movs r4, #0x10
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r1, _08058A0C @ =0x0000FFDC
	strh r1, [r3, #0xa]
	movs r0, #0x24
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldr r0, _08058A10 @ =0x083A86A4
	str r0, [r3, #0x18]
	strb r6, [r3, #0x1c]
	strh r2, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _08058A14
	ldrh r0, [r3, #2]
	subs r0, #0x48
	strh r0, [r3, #2]
	movs r0, #0x5a
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r4, [r0]
	movs r1, #0x20
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r3]
	b _08058A26
	.align 2, 0
_08058A04: .4byte gCurrentSprite
_08058A08: .4byte 0x0000FFFB
_08058A0C: .4byte 0x0000FFDC
_08058A10: .4byte 0x083A86A4
_08058A14:
	movs r0, #1
	strb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r6, [r0]
_08058A26:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start IceBeamAbilitySpawning
IceBeamAbilitySpawning: @ 0x08058A2C
	push {lr}
	ldr r1, _08058A58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r2, #8
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058A54
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	ldr r0, _08058A5C @ =0x000002AE
	bl SoundPlay
_08058A54:
	pop {r0}
	bx r0
	.align 2, 0
_08058A58: .4byte gCurrentSprite
_08058A5C: .4byte 0x000002AE

	thumb_func_start IceBeamAbilityEntering
IceBeamAbilityEntering: @ 0x08058A60
	push {r4, r5, r6, lr}
	ldr r2, _08058ACC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _08058AD0 @ =0x08328480
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08058AD4 @ =0x00007FFF
	cmp r1, r0
	bne _08058A8A
	ldrh r4, [r5]
	movs r3, #0
_08058A8A:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
	movs r4, #0
	strh r0, [r2, #2]
	ldrh r3, [r2, #4]
	lsrs r1, r3, #2
	ldr r0, _08058AD8 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	ldr r6, _08058ADC @ =0xFFC60000
	adds r1, r1, r6
	lsrs r1, r1, #0x10
	cmp r1, #4
	bhi _08058AE0
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	mov r0, ip
	strb r4, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	b _08058AE4
	.align 2, 0
_08058ACC: .4byte gCurrentSprite
_08058AD0: .4byte 0x08328480
_08058AD4: .4byte 0x00007FFF
_08058AD8: .4byte gBg1XPosition
_08058ADC: .4byte 0xFFC60000
_08058AE0:
	adds r0, r3, #6
	strh r0, [r2, #4]
_08058AE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IceBeamAbilityFloatingBeforeSA_X
IceBeamAbilityFloatingBeforeSA_X: @ 0x08058AEC
	push {r4, r5, r6, r7, lr}
	ldr r2, _08058B54 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08058B64
	adds r5, r2, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r4, _08058B58 @ =0x083A74A8
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _08058B5C @ =0x00007FFF
	cmp r0, r6
	bne _08058B22
	ldrh r3, [r4]
	movs r1, #0
_08058B22:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _08058B60 @ =0x083A752A
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _08058B46
	ldrh r3, [r4]
	movs r1, #0
_08058B46:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _08058B78
	.align 2, 0
_08058B54: .4byte gCurrentSprite
_08058B58: .4byte 0x083A74A8
_08058B5C: .4byte 0x00007FFF
_08058B60: .4byte 0x083A752A
_08058B64:
	movs r0, #0x2c
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_08058B78:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IceBeamAbilityTurningIntoSA_X
IceBeamAbilityTurningIntoSA_X: @ 0x08058B80
	push {lr}
	ldr r1, _08058BB8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldr r3, _08058BBC @ =gWrittenToMosaic_H
	ldr r2, _08058BC0 @ =sXParasiteMosaicValues
	adds r1, #0x2e
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _08058BC4
	ldrb r2, [r1]
	movs r0, #0xc9
	movs r1, #0
	bl SpriteLoadGfx
	b _08058BD2
	.align 2, 0
_08058BB8: .4byte gCurrentSprite
_08058BBC: .4byte gWrittenToMosaic_H
_08058BC0: .4byte sXParasiteMosaicValues
_08058BC4:
	cmp r0, #8
	bne _08058BD2
	movs r0, #0xc9
	movs r1, #0
	movs r2, #2
	bl SpriteLoadPal
_08058BD2:
	ldr r2, _08058BF0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _08058BEA
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0xc9
	strb r0, [r2, #0x1d]
_08058BEA:
	pop {r0}
	bx r0
	.align 2, 0
_08058BF0: .4byte gCurrentSprite

	thumb_func_start IceBeamAbilitySpawningFromSA_XInit
IceBeamAbilitySpawningFromSA_XInit: @ 0x08058BF4
	ldr r3, _08058C34 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x5d
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	subs r1, #3
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08058C38 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r0, #0xf
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_08058C34: .4byte gCurrentSprite
_08058C38: .4byte gIoRegisters

	thumb_func_start IceBeamAbilityGoingToTarget
IceBeamAbilityGoingToTarget: @ 0x08058C3C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _08058CD0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	ldr r5, _08058CD4 @ =gCurrentSprite
	cmp r0, #0
	bne _08058C56
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
_08058C56:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08058CD8 @ =gAbilityRestingYPosition
	ldrh r0, [r4]
	ldr r6, _08058CDC @ =gAbilityRestingXPosition
	ldrh r1, [r6]
	movs r2, #2
	str r2, [sp]
	ldr r2, _08058CE0 @ =0x00000141
	str r2, [sp, #4]
	movs r2, #0x10
	movs r3, #0x18
	bl XParasiteMoveWithSound
	ldrh r2, [r5, #2]
	ldrh r1, [r4]
	adds r0, r1, #6
	cmp r2, r0
	bge _08058CC8
	subs r0, r1, #6
	cmp r2, r0
	ble _08058CC8
	ldrh r2, [r5, #4]
	ldrh r1, [r6]
	adds r0, r1, #6
	cmp r2, r0
	bge _08058CC8
	subs r0, r1, #6
	cmp r2, r0
	ble _08058CC8
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x5e
	strb r0, [r1]
	ldrh r1, [r5]
	ldr r0, _08058CE4 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x30
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r1, _08058CE8 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08058CEC @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #7
	bl _call_via_r1
	ldr r0, _08058CF0 @ =gPoseLock
	strb r4, [r0]
_08058CC8:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08058CD0: .4byte gFrameCounter8Bit
_08058CD4: .4byte gCurrentSprite
_08058CD8: .4byte gAbilityRestingYPosition
_08058CDC: .4byte gAbilityRestingXPosition
_08058CE0: .4byte 0x00000141
_08058CE4: .4byte 0x0000FFFB
_08058CE8: .4byte sSamusSetPoseFunctionPointer
_08058CEC: .4byte gSamusData
_08058CF0: .4byte gPoseLock

	thumb_func_start IceBeamAbilityWaiting
IceBeamAbilityWaiting: @ 0x08058CF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08058DEC @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	ldr r4, _08058DF0 @ =sCoreXIdleYSpeed
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r7, _08058DF4 @ =0x00007FFF
	mov r8, r7
	cmp r0, r8
	bne _08058D1C
	ldrh r2, [r4]
	movs r1, #0
_08058D1C:
	adds r0, r1, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r2
	movs r6, #0
	strh r0, [r3, #2]
	adds r5, r3, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _08058DF8 @ =sCoreXIdleXSpeed
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r8
	bne _08058D44
	ldrh r2, [r4]
	movs r1, #0
_08058D44:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r3, #4]
	adds r0, r0, r2
	strh r0, [r3, #4]
	ldrh r4, [r3]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r4
	cmp r0, #0
	beq _08058E10
	ldr r1, _08058DFC @ =gPreventMovementTimer
	movs r0, #0x64
	strh r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5f
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	adds r1, #9
	strb r6, [r1]
	strb r0, [r5]
	subs r1, #1
	strb r6, [r1]
	mov r1, ip
	strb r0, [r1]
	movs r0, #0x80
	orrs r0, r4
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2b
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	movs r0, #0x14
	strh r0, [r3, #6]
	strb r6, [r3, #0x1c]
	movs r0, #0
	strh r0, [r3, #0x16]
	ldr r0, _08058E00 @ =0x083A86EC
	str r0, [r3, #0x18]
	ldr r4, _08058E04 @ =gSamusData
	movs r5, #0x26
	ldrsh r0, [r4, r5]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r7, [r4, #0x18]
	adds r0, r0, r7
	ldrh r1, [r4, #0x16]
	movs r2, #0x1d
	bl ParticleSet
	movs r0, #0x6b
	bl EventCheckAdvance
	ldr r1, _08058E08 @ =sSamusSetPoseFunctionPointer
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #4
	bl _call_via_r1
	ldr r1, _08058E0C @ =0x030012F0
	movs r0, #0x30
	strb r0, [r1, #3]
	movs r0, #0x92
	bl SoundPlay
	movs r0, #0
	bl FadeMusic
	b _08058E22
	.align 2, 0
_08058DEC: .4byte gCurrentSprite
_08058DF0: .4byte sCoreXIdleYSpeed
_08058DF4: .4byte 0x00007FFF
_08058DF8: .4byte sCoreXIdleXSpeed
_08058DFC: .4byte gPreventMovementTimer
_08058E00: .4byte 0x083A86EC
_08058E04: .4byte gSamusData
_08058E08: .4byte sSamusSetPoseFunctionPointer
_08058E0C: .4byte 0x030012F0
_08058E10:
	ldr r0, _08058E2C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08058E22
	movs r0, #0xc3
	bl SoundPlay
_08058E22:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058E2C: .4byte gFrameCounter8Bit

	thumb_func_start IceBeamAbilityGettingAbsorbed
IceBeamAbilityGettingAbsorbed: @ 0x08058E30
	push {r4, r5, lr}
	ldr r4, _08058E54 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl HealSamusOfOneTank
	bl XParasiteStickToSamus
	ldrh r0, [r4, #6]
	adds r5, r0, #0
	cmp r5, #0
	beq _08058E58
	subs r0, #1
	strh r0, [r4, #6]
	b _08058E6A
	.align 2, 0
_08058E54: .4byte gCurrentSprite
_08058E58:
	ldrh r0, [r4, #0x12]
	cmp r0, #0x50
	bls _08058E64
	subs r0, #8
	strh r0, [r4, #0x12]
	b _08058E6A
_08058E64:
	bl ProjectileLoadBeamGraphics
	strh r5, [r4]
_08058E6A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start IceBeamAbility
IceBeamAbility: @ 0x08058E70
	push {lr}
	ldr r0, _08058E88 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5f
	bls _08058E7E
	b _0805904E
_08058E7E:
	lsls r0, r0, #2
	ldr r1, _08058E8C @ =_08058E90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08058E88: .4byte gCurrentSprite
_08058E8C: .4byte _08058E90
_08058E90: @ jump table
	.4byte _08059010 @ case 0
	.4byte _08059016 @ case 1
	.4byte _0805901C @ case 2
	.4byte _0805904E @ case 3
	.4byte _0805904E @ case 4
	.4byte _0805904E @ case 5
	.4byte _0805904E @ case 6
	.4byte _0805904E @ case 7
	.4byte _0805904E @ case 8
	.4byte _0805904E @ case 9
	.4byte _0805904E @ case 10
	.4byte _0805904E @ case 11
	.4byte _0805904E @ case 12
	.4byte _0805904E @ case 13
	.4byte _0805904E @ case 14
	.4byte _0805904E @ case 15
	.4byte _0805904E @ case 16
	.4byte _0805904E @ case 17
	.4byte _0805904E @ case 18
	.4byte _0805904E @ case 19
	.4byte _0805904E @ case 20
	.4byte _0805904E @ case 21
	.4byte _0805904E @ case 22
	.4byte _08059022 @ case 23
	.4byte _08059028 @ case 24
	.4byte _0805904E @ case 25
	.4byte _0805904E @ case 26
	.4byte _0805904E @ case 27
	.4byte _0805904E @ case 28
	.4byte _0805904E @ case 29
	.4byte _0805904E @ case 30
	.4byte _0805904E @ case 31
	.4byte _0805904E @ case 32
	.4byte _0805904E @ case 33
	.4byte _0805904E @ case 34
	.4byte _0805904E @ case 35
	.4byte _0805904E @ case 36
	.4byte _0805904E @ case 37
	.4byte _0805904E @ case 38
	.4byte _0805904E @ case 39
	.4byte _0805904E @ case 40
	.4byte _0805904E @ case 41
	.4byte _0805904E @ case 42
	.4byte _0805904E @ case 43
	.4byte _0805904E @ case 44
	.4byte _0805904E @ case 45
	.4byte _0805904E @ case 46
	.4byte _0805904E @ case 47
	.4byte _0805904E @ case 48
	.4byte _0805904E @ case 49
	.4byte _0805904E @ case 50
	.4byte _0805904E @ case 51
	.4byte _0805904E @ case 52
	.4byte _0805904E @ case 53
	.4byte _0805904E @ case 54
	.4byte _0805904E @ case 55
	.4byte _0805904E @ case 56
	.4byte _0805904E @ case 57
	.4byte _0805904E @ case 58
	.4byte _0805904E @ case 59
	.4byte _0805904E @ case 60
	.4byte _0805904E @ case 61
	.4byte _0805904E @ case 62
	.4byte _0805904E @ case 63
	.4byte _0805904E @ case 64
	.4byte _0805904E @ case 65
	.4byte _0805904E @ case 66
	.4byte _0805904E @ case 67
	.4byte _0805904E @ case 68
	.4byte _0805904E @ case 69
	.4byte _0805904E @ case 70
	.4byte _0805904E @ case 71
	.4byte _0805904E @ case 72
	.4byte _0805904E @ case 73
	.4byte _0805904E @ case 74
	.4byte _0805904E @ case 75
	.4byte _0805904E @ case 76
	.4byte _0805904E @ case 77
	.4byte _0805904E @ case 78
	.4byte _0805904E @ case 79
	.4byte _0805904E @ case 80
	.4byte _0805904E @ case 81
	.4byte _0805904E @ case 82
	.4byte _0805904E @ case 83
	.4byte _0805904E @ case 84
	.4byte _0805904E @ case 85
	.4byte _0805904E @ case 86
	.4byte _0805904E @ case 87
	.4byte _0805904E @ case 88
	.4byte _0805902E @ case 89
	.4byte _08059032 @ case 90
	.4byte _0805904E @ case 91
	.4byte _08059038 @ case 92
	.4byte _0805903E @ case 93
	.4byte _08059044 @ case 94
	.4byte _0805904A @ case 95
_08059010:
	bl IceBeamAbilityInit
	b _0805904E
_08059016:
	bl IceBeamAbilitySpawning
	b _0805904E
_0805901C:
	bl IceBeamAbilityEntering
	b _0805904E
_08059022:
	bl IceBeamAbilityFloatingBeforeSA_X
	b _0805904E
_08059028:
	bl IceBeamAbilityTurningIntoSA_X
	b _0805904E
_0805902E:
	bl IceBeamAbilityInit
_08059032:
	bl IceBeamAbilitySpawningFromX
	b _0805904E
_08059038:
	bl IceBeamAbilitySpawningFromSA_XInit
	b _0805904E
_0805903E:
	bl IceBeamAbilityGoingToTarget
	b _0805904E
_08059044:
	bl IceBeamAbilityWaiting
	b _0805904E
_0805904A:
	bl IceBeamAbilityGettingAbsorbed
_0805904E:
	pop {r0}
	bx r0
	.align 2, 0
