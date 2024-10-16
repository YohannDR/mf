    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start BeamCoreXTransformation
BeamCoreXTransformation: @ 0x0802D994
	push {lr}
	ldr r3, _0802D9BC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0802D9C8
	ldr r2, _0802D9C0 @ =gWrittenToMosaic_H
	ldr r1, _0802D9C4 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0802D9DC
	.align 2, 0
_0802D9BC: .4byte gCurrentSprite
_0802D9C0: .4byte gWrittenToMosaic_H
_0802D9C4: .4byte sXParasiteMosaicValues
_0802D9C8:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0802D9E0 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r3]
	bl ProjectileLoadEyeCoreXGraphics
_0802D9DC:
	pop {r0}
	bx r0
	.align 2, 0
_0802D9E0: .4byte 0x0000FFDF

	thumb_func_start BeamCoreXTransformationInit
BeamCoreXTransformationInit: @ 0x0802D9E4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	movs r5, #0
	ldr r0, _0802DA9C @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x5c
	strh r0, [r1, #2]
	adds r1, #0x24
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	mov r2, ip
	strh r0, [r2, #6]
	ldrh r2, [r2]
	movs r0, #0x20
	orrs r2, r0
	movs r4, #0
	ldr r0, _0802DAA0 @ =0x0000F3FB
	ands r2, r0
	mov r0, ip
	strh r2, [r0]
	ldr r3, _0802DAA4 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x14]
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	mov r3, ip
	adds r3, #0x21
	movs r0, #2
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x25
	strb r4, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r1, #0
	orrs r2, r0
	mov r0, ip
	strh r2, [r0]
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802DAA8 @ =0x0000FFE0
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #0x20
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _0802DAAC @ =0x0832AF80
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r5, [r2, #0x16]
	mov r0, ip
	adds r0, #0x30
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	subs r0, #4
	strb r4, [r0]
	ldrb r0, [r2, #0x1d]
	mov r6, ip
	cmp r0, #0x58
	beq _0802DACA
	cmp r0, #0x58
	bgt _0802DAB0
	cmp r0, #0x56
	beq _0802DABA
	cmp r0, #0x57
	beq _0802DAC2
	b _0802DAF0
	.align 2, 0
_0802DA9C: .4byte gCurrentSprite
_0802DAA0: .4byte 0x0000F3FB
_0802DAA4: .4byte sPrimarySpriteStats
_0802DAA8: .4byte 0x0000FFE0
_0802DAAC: .4byte 0x0832AF80
_0802DAB0:
	cmp r0, #0x59
	beq _0802DAD2
	cmp r0, #0xc2
	beq _0802DADA
	b _0802DAF0
_0802DABA:
	movs r5, #0x28
	movs r0, #0x29
	mov r8, r0
	b _0802DAF6
_0802DAC2:
	movs r5, #0x54
	movs r1, #0x55
	mov r8, r1
	b _0802DAF6
_0802DACA:
	movs r5, #0x56
	movs r2, #0x57
	mov r8, r2
	b _0802DAF6
_0802DAD2:
	movs r5, #0x58
	movs r0, #0x59
	mov r8, r0
	b _0802DAF6
_0802DADA:
	movs r5, #0x75
	movs r1, #0x76
	mov r8, r1
	ldr r0, _0802DAEC @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	strb r0, [r3]
	b _0802DAF6
	.align 2, 0
_0802DAEC: .4byte gIoRegisters
_0802DAF0:
	movs r0, #0
	strh r0, [r6]
	b _0802DB52
_0802DAF6:
	adds r4, r6, #0
	ldrb r2, [r4, #0x1f]
	movs r0, #0x23
	adds r0, r0, r4
	mov sb, r0
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r7, #0
	str r7, [sp, #8]
	adds r0, r5, #0
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xff
	bne _0802DB22
	strh r7, [r4]
	b _0802DB52
_0802DB22:
	ldrb r2, [r6, #0x1f]
	mov r1, sb
	ldrb r3, [r1]
	ldrh r0, [r6, #2]
	str r0, [sp]
	ldrh r0, [r6, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	mov r0, r8
	adds r1, r5, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _0802DB46
	strh r7, [r6]
	b _0802DB52
_0802DB46:
	ldr r1, _0802DB60 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strb r2, [r0, #0x1e]
_0802DB52:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DB60: .4byte gSpriteData

	thumb_func_start BeamCoreXMovingInit
BeamCoreXMovingInit: @ 0x0802DB64
	ldr r3, _0802DB88 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x1c
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
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
_0802DB88: .4byte gCurrentSprite

	thumb_func_start BeamCoreXMoving
BeamCoreXMoving: @ 0x0802DB8C
	push {lr}
	sub sp, #8
	ldr r0, _0802DBBC @ =gCurrentSprite
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802DBB6
	ldr r1, _0802DBC0 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0xc0
	str r2, [sp, #4]
	movs r2, #0xa
	movs r3, #0x10
	bl MoveBeamCoreX
_0802DBB6:
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_0802DBBC: .4byte gCurrentSprite
_0802DBC0: .4byte gSamusData

	thumb_func_start BeamCoreXMovingToTargetInit
BeamCoreXMovingToTargetInit: @ 0x0802DBC4
	push {lr}
	ldr r0, _0802DC18 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x5d
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	movs r2, #0
	mov r0, ip
	strh r3, [r0, #0x14]
	subs r1, #3
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0802DC1C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
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
	subs r0, #0xb
	strb r1, [r0]
	bl MakeXParasitesFlee
	pop {r0}
	bx r0
	.align 2, 0
_0802DC18: .4byte gCurrentSprite
_0802DC1C: .4byte gIoRegisters

	thumb_func_start BeamCoreXMovingToTarget
BeamCoreXMovingToTarget: @ 0x0802DC20
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _0802DC8C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	ldr r6, _0802DC90 @ =gCurrentSprite
	cmp r0, #0
	bne _0802DC3A
	ldrh r0, [r6]
	movs r1, #4
	eors r0, r1
	strh r0, [r6]
_0802DC3A:
	adds r5, r6, #0
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r4, _0802DC94 @ =gAbilityRestingYPosition
	ldrh r0, [r4]
	ldr r7, _0802DC98 @ =gAbilityRestingXPosition
	ldrh r1, [r7]
	movs r2, #2
	str r2, [sp]
	ldr r2, _0802DC9C @ =0x00000141
	str r2, [sp, #4]
	movs r2, #0x10
	movs r3, #0x18
	bl XParasiteMoveWithSound
	ldrh r2, [r5, #2]
	ldrh r1, [r4]
	adds r0, r1, #6
	cmp r2, r0
	bge _0802DCBE
	subs r0, r1, #6
	cmp r2, r0
	ble _0802DCBE
	ldrh r2, [r5, #4]
	ldrh r1, [r7]
	adds r0, r1, #6
	cmp r2, r0
	bge _0802DCBE
	subs r0, r1, #6
	cmp r2, r0
	ble _0802DCBE
	ldrb r0, [r5, #0x1d]
	cmp r0, #0xc2
	bne _0802DCA0
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x37
	b _0802DCA6
	.align 2, 0
_0802DC8C: .4byte gFrameCounter8Bit
_0802DC90: .4byte gCurrentSprite
_0802DC94: .4byte gAbilityRestingYPosition
_0802DC98: .4byte gAbilityRestingXPosition
_0802DC9C: .4byte 0x00000141
_0802DCA0:
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0x5e
_0802DCA6:
	strb r0, [r1]
	ldr r1, _0802DCC8 @ =gCurrentSprite
	ldrh r2, [r1]
	ldr r0, _0802DCCC @ =0x0000FFFB
	ands r0, r2
	movs r2, #0
	strh r0, [r1]
	adds r0, r1, #0
	adds r0, #0x30
	strb r2, [r0]
	adds r1, #0x31
	strb r2, [r1]
_0802DCBE:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DCC8: .4byte gCurrentSprite
_0802DCCC: .4byte 0x0000FFFB

	thumb_func_start BeamCoreXRestingAtTarget
BeamCoreXRestingAtTarget: @ 0x0802DCD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _0802DDB0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r1, [r0]
	ldr r3, _0802DDB4 @ =sCoreXIdleYSpeed
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r7, _0802DDB8 @ =0x00007FFF
	mov r8, r7
	cmp r0, r8
	bne _0802DCF8
	ldrh r2, [r3]
	movs r1, #0
_0802DCF8:
	adds r0, r1, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	movs r6, #0
	strh r0, [r4, #2]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r3, _0802DDBC @ =sCoreXIdleXSpeed
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r8
	bne _0802DD20
	ldrh r2, [r3]
	movs r1, #0
_0802DD20:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	ldrh r3, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r3
	cmp r0, #0
	beq _0802DE14
	ldr r1, _0802DDC0 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
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
	mov r5, ip
	strb r0, [r5]
	movs r0, #0x80
	orrs r0, r3
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r6, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	movs r0, #0x14
	strh r0, [r4, #6]
	strb r6, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x16]
	ldr r0, _0802DDC4 @ =0x0832AFC8
	str r0, [r4, #0x18]
	ldr r2, _0802DDC8 @ =gSamusData
	movs r7, #0x26
	ldrsh r0, [r2, r7]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	movs r2, #0x1d
	bl ParticleSet
	ldrb r1, [r4, #0x1d]
	cmp r1, #0x57
	beq _0802DDDE
	cmp r1, #0x57
	bgt _0802DDCC
	cmp r1, #0x56
	beq _0802DDD6
	b _0802DDF4
	.align 2, 0
_0802DDB0: .4byte gCurrentSprite
_0802DDB4: .4byte sCoreXIdleYSpeed
_0802DDB8: .4byte 0x00007FFF
_0802DDBC: .4byte sCoreXIdleXSpeed
_0802DDC0: .4byte gPreventMovementTimer
_0802DDC4: .4byte 0x0832AFC8
_0802DDC8: .4byte gSamusData
_0802DDCC:
	cmp r1, #0x58
	beq _0802DDE6
	cmp r1, #0x59
	beq _0802DDEE
	b _0802DDF4
_0802DDD6:
	movs r0, #0xf
	bl EventCheckAdvance
	b _0802DDF4
_0802DDDE:
	movs r0, #0x3c
	bl EventCheckAdvance
	b _0802DDF4
_0802DDE6:
	movs r0, #0x4e
	bl EventCheckAdvance
	b _0802DDF4
_0802DDEE:
	movs r0, #0x5b
	bl EventCheckAdvance
_0802DDF4:
	movs r0, #0xc8
	lsls r0, r0, #1
	movs r1, #0x32
	movs r2, #0xa
	bl SpriteUtilRefillSamus
	ldr r1, _0802DE10 @ =0x030012F0
	movs r0, #0x30
	strb r0, [r1, #3]
	movs r0, #0x92
	bl SoundPlay
	b _0802DE26
	.align 2, 0
_0802DE10: .4byte 0x030012F0
_0802DE14:
	ldr r0, _0802DE30 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _0802DE26
	movs r0, #0xc3
	bl SoundPlay
_0802DE26:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802DE30: .4byte gFrameCounter8Bit

	thumb_func_start BeamCoreXAbsorbed
BeamCoreXAbsorbed: @ 0x0802DE34
	push {r4, lr}
	ldr r4, _0802DE50 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl XParasiteStickToSamus
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _0802DE54
	subs r0, #1
	b _0802DE72
	.align 2, 0
_0802DE50: .4byte gCurrentSprite
_0802DE54:
	ldrh r0, [r4, #0x12]
	cmp r0, #0x50
	bls _0802DE60
	subs r0, #8
	strh r0, [r4, #0x12]
	b _0802DE74
_0802DE60:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x60
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #4
	orrs r0, r1
	strh r0, [r4]
	movs r0, #9
_0802DE72:
	strh r0, [r4, #6]
_0802DE74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BeamCoreXDisplayingMessage
BeamCoreXDisplayingMessage: @ 0x0802DE7C
	push {lr}
	sub sp, #0xc
	ldr r2, _0802DEAC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2, #6]
	adds r1, r0, #0
	cmp r1, #0
	beq _0802DEC0
	subs r0, #1
	strh r0, [r2, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #7
	bhi _0802DEB0
	ldrh r2, [r2, #6]
	movs r0, #0x21
	movs r1, #0
	bl SpriteLoadGfx
	b _0802DEDC
	.align 2, 0
_0802DEAC: .4byte gCurrentSprite
_0802DEB0:
	cmp r0, #8
	bne _0802DEDC
	movs r0, #0x21
	movs r1, #0
	movs r2, #2
	bl SpriteLoadPal
	b _0802DEDC
_0802DEC0:
	strh r1, [r2]
	ldr r0, _0802DEE4 @ =gAbilityRestingYPosition
	ldrh r0, [r0]
	str r0, [sp]
	ldr r0, _0802DEE8 @ =gAbilityRestingXPosition
	ldrh r0, [r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x21
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SpriteSpawnPrimary
_0802DEDC:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0802DEE4: .4byte gAbilityRestingYPosition
_0802DEE8: .4byte gAbilityRestingXPosition

	thumb_func_start BeamCoreXWaitToFlee
BeamCoreXWaitToFlee: @ 0x0802DEEC
	push {r4, lr}
	ldr r0, _0802DF2C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	ldr r4, _0802DF30 @ =gCurrentSprite
	cmp r0, #0
	bne _0802DF04
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
_0802DF04:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xc0
	movs r1, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _0802DF26
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0xb4
	strb r0, [r1]
_0802DF26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802DF2C: .4byte gFrameCounter8Bit
_0802DF30: .4byte gCurrentSprite

	thumb_func_start BeamCoreXFlee
BeamCoreXFlee: @ 0x0802DF34
	push {r4, r5, r6, lr}
	ldr r0, _0802DFA8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	ldr r5, _0802DFAC @ =gCurrentSprite
	cmp r0, #0
	bne _0802DF4C
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
_0802DF4C:
	movs r0, #0x31
	adds r0, r0, r5
	mov ip, r0
	ldrb r2, [r0]
	ldr r4, _0802DFB0 @ =0x08328480
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0802DFB4 @ =0x00007FFF
	cmp r1, r0
	bne _0802DF6A
	ldrh r3, [r4]
	movs r2, #0
_0802DF6A:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r1, [r5, #2]
	adds r1, r1, r3
	ldrh r0, [r5, #4]
	adds r0, #8
	strh r0, [r5, #4]
	adds r1, #1
	strh r1, [r5, #2]
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0802DFA2
	movs r0, #0x66
	bl EventCheckAdvance
	strh r4, [r5]
	movs r0, #0x3c
	movs r1, #0x2e
	movs r2, #0xa
	bl unk_372c
_0802DFA2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802DFA8: .4byte gFrameCounter8Bit
_0802DFAC: .4byte gCurrentSprite
_0802DFB0: .4byte 0x08328480
_0802DFB4: .4byte 0x00007FFF

	thumb_func_start BeamCoreXShellInit
BeamCoreXShellInit: @ 0x0802DFB8
	push {r4, r5, r6, lr}
	ldr r0, _0802E044 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r2, r1, #0
	movs r5, #0
	movs r4, #0
	orrs r2, r0
	mov r0, ip
	adds r0, #0x35
	movs r3, #1
	strb r3, [r0]
	ldr r0, _0802E048 @ =0x0000FFFB
	ands r2, r0
	mov r6, ip
	strh r2, [r6]
	mov r1, ip
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0802E04C @ =sSecondarySpriteStats
	ldrb r0, [r6, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r6, #0x14]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802E050 @ =0x0000FFC0
	strh r1, [r6, #0xa]
	movs r0, #0x40
	strh r0, [r6, #0xc]
	strh r1, [r6, #0xe]
	strh r0, [r6, #0x10]
	ldr r0, _0802E054 @ =0x0832B0A8
	str r0, [r6, #0x18]
	strb r5, [r6, #0x1c]
	strh r4, [r6, #0x16]
	mov r1, ip
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x24
	strb r3, [r0]
	movs r0, #0x80
	orrs r2, r0
	strh r2, [r6]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x12]
	ldr r1, _0802E058 @ =gSamusData
	ldrh r0, [r6, #4]
	mov r2, ip
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0802E05C
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0x80
	strb r0, [r1]
	b _0802E062
	.align 2, 0
_0802E044: .4byte gCurrentSprite
_0802E048: .4byte 0x0000FFFB
_0802E04C: .4byte sSecondarySpriteStats
_0802E050: .4byte 0x0000FFC0
_0802E054: .4byte 0x0832B0A8
_0802E058: .4byte gSamusData
_0802E05C:
	adds r0, r2, #0
	adds r0, #0x2b
	strb r5, [r0]
_0802E062:
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x75
	bne _0802E076
	ldr r0, _0802E07C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
_0802E076:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802E07C: .4byte gIoRegisters

	thumb_func_start BeamCoreXShellTransformation
BeamCoreXShellTransformation: @ 0x0802E080
	push {lr}
	ldr r2, _0802E0B0 @ =gSpriteData
	ldr r3, _0802E0B4 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0802E0AC
	ldrh r1, [r3]
	ldr r0, _0802E0B8 @ =0x00007FFF
	ands r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
_0802E0AC:
	pop {r0}
	bx r0
	.align 2, 0
_0802E0B0: .4byte gSpriteData
_0802E0B4: .4byte gCurrentSprite
_0802E0B8: .4byte 0x00007FFF

	thumb_func_start BeamCoreXShellIdle
BeamCoreXShellIdle: @ 0x0802E0BC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0802E120 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #1
	bne _0802E0FE
	movs r0, #0x32
	bl SpriteUtilCountPrimarySprites
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #5
	bhi _0802E0FE
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	movs r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #2]
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
_0802E0FE:
	ldr r3, _0802E120 @ =gCurrentSprite
	ldrb r2, [r3, #0x1e]
	ldr r1, _0802E124 @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r0, [r0]
	adds r2, r0, #0
	cmp r2, #0
	beq _0802E128
	adds r1, r0, #2
	adds r0, r3, #0
	adds r0, #0x20
	strb r1, [r0]
	b _0802E12E
	.align 2, 0
_0802E120: .4byte gCurrentSprite
_0802E124: .4byte gSpriteData
_0802E128:
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
_0802E12E:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BeamCoreXEyeInit
BeamCoreXEyeInit: @ 0x0802E138
	push {r4, lr}
	ldr r0, _0802E1C8 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	movs r4, #0
	movs r3, #0
	orrs r1, r0
	mov r0, ip
	adds r0, #0x35
	movs r2, #3
	strb r2, [r0]
	movs r0, #0x80
	orrs r1, r0
	mov r0, ip
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	mov r1, ip
	strh r0, [r1, #0x12]
	mov r0, ip
	adds r0, #0x22
	strb r2, [r0]
	ldr r1, _0802E1CC @ =sSecondarySpriteStats
	mov r2, ip
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0x14]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802E1D0 @ =0x0000FFD8
	strh r1, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _0802E1D4 @ =0x0832B0B8
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r3, [r2, #0x16]
	mov r0, ip
	adds r0, #0x25
	strb r4, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	adds r1, #0xb
	movs r0, #0x78
	strb r0, [r1]
	ldr r1, _0802E1D8 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0802E1DC
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #3
	strb r0, [r1]
	b _0802E1E6
	.align 2, 0
_0802E1C8: .4byte gCurrentSprite
_0802E1CC: .4byte sSecondarySpriteStats
_0802E1D0: .4byte 0x0000FFD8
_0802E1D4: .4byte 0x0832B0B8
_0802E1D8: .4byte gSamusData
_0802E1DC:
	adds r0, r2, #0
	adds r0, #0x2b
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
_0802E1E6:
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x76
	bne _0802E1FA
	ldr r0, _0802E200 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
_0802E1FA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E200: .4byte gIoRegisters

	thumb_func_start BeamCoreXEyeTransformation
BeamCoreXEyeTransformation: @ 0x0802E204
	push {lr}
	ldr r3, _0802E22C @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0802E230 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802E234
	ldrh r1, [r3]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r3]
	b _0802E244
	.align 2, 0
_0802E22C: .4byte gCurrentSprite
_0802E230: .4byte gSpriteData
_0802E234:
	ldrh r1, [r3]
	ldr r0, _0802E248 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
_0802E244:
	pop {r0}
	bx r0
	.align 2, 0
_0802E248: .4byte 0x0000FFDF

	thumb_func_start BeamCoreXEyeHandleRotation
BeamCoreXEyeHandleRotation: @ 0x0802E24C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #2
	mov ip, r0
	ldr r4, _0802E2C8 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	str r0, [sp]
	ldrb r1, [r4, #0x1e]
	str r1, [sp, #4]
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r3, [r0]
	ldr r0, _0802E2CC @ =gSamusData
	ldrh r1, [r0, #0x18]
	subs r1, #0x48
	lsls r1, r1, #0x10
	ldrh r0, [r0, #0x16]
	mov sb, r0
	ldr r2, _0802E2D0 @ =gSpriteData
	ldr r5, [sp]
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r6, [r0, #2]
	ldrh r0, [r0, #4]
	lsrs r7, r1, #0x10
	lsls r5, r6, #0x10
	mov r8, r5
	mov sl, r4
	cmp r1, r8
	bge _0802E2EA
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r2, r5, #0
	subs r2, #0x40
	mov r4, sb
	lsls r1, r4, #0x10
	asrs r4, r1, #0x10
	mov sb, r0
	cmp r2, r4
	bge _0802E2B0
	adds r0, r5, #0
	adds r0, #0x40
_0802E2B0:
	cmp r1, sb
	ble _0802E2D4
	lsls r2, r6, #0x10
	asrs r1, r2, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	movs r4, #0xe0
	adds r5, r2, #0
	cmp r1, #0x3f
	bgt _0802E338
	b _0802E33C
	.align 2, 0
_0802E2C8: .4byte gCurrentSprite
_0802E2CC: .4byte gSamusData
_0802E2D0: .4byte gSpriteData
_0802E2D4:
	lsls r2, r6, #0x10
	asrs r1, r2, #0x10
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	subs r1, r1, r0
	movs r4, #0xa0
	adds r5, r2, #0
	cmp r1, #0x3f
	bgt _0802E338
	movs r4, #0x80
	b _0802E360
_0802E2EA:
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r2, r5, #0
	subs r2, #0x40
	mov r4, sb
	lsls r1, r4, #0x10
	asrs r4, r1, #0x10
	mov sb, r0
	cmp r2, r4
	bge _0802E30C
	adds r0, r5, #0
	adds r0, #0x40
	cmp r0, r4
	ble _0802E30C
	movs r4, #0x40
	mov r5, r8
	b _0802E360
_0802E30C:
	cmp r1, sb
	ble _0802E324
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	lsls r2, r6, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	movs r4, #0x20
	adds r5, r2, #0
	cmp r0, #0x3f
	bgt _0802E338
	b _0802E33C
_0802E324:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	lsls r2, r6, #0x10
	asrs r1, r2, #0x10
	subs r0, r0, r1
	movs r4, #0x60
	adds r5, r2, #0
	cmp r0, #0x3f
	bgt _0802E338
	movs r4, #0x80
_0802E338:
	cmp r4, #0
	bne _0802E360
_0802E33C:
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0802E350 @ =0xFFFF0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _0802E354
	mov r4, ip
	subs r0, r3, r4
	b _0802E46C
	.align 2, 0
_0802E350: .4byte 0xFFFF0000
_0802E354:
	cmp r1, #0x7f
	bgt _0802E35A
	b _0802E470
_0802E35A:
	mov r1, ip
	adds r0, r3, r1
	b _0802E46C
_0802E360:
	cmp r4, #0x20
	bne _0802E38E
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0802E378 @ =0xFFDF0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _0802E37C
	mov r4, ip
	subs r0, r3, r4
	b _0802E46C
	.align 2, 0
_0802E378: .4byte 0xFFDF0000
_0802E37C:
	adds r0, r1, #0
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bls _0802E470
	mov r1, ip
	adds r0, r3, r1
	b _0802E46C
_0802E38E:
	cmp r4, #0x40
	bne _0802E3BE
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0802E3A8 @ =0xFFBF0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _0802E3AC
	mov r4, ip
	subs r0, r3, r4
	b _0802E46C
	.align 2, 0
_0802E3A8: .4byte 0xFFBF0000
_0802E3AC:
	adds r0, r1, #0
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bls _0802E470
	mov r1, ip
	adds r0, r3, r1
	b _0802E46C
_0802E3BE:
	cmp r4, #0x60
	bne _0802E3EE
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0802E3D8 @ =0xFF9F0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _0802E3DC
	mov r4, ip
	subs r0, r3, r4
	b _0802E46C
	.align 2, 0
_0802E3D8: .4byte 0xFF9F0000
_0802E3DC:
	adds r0, r1, #0
	subs r0, #0x60
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7f
	bls _0802E470
	mov r1, ip
	adds r0, r3, r1
	b _0802E46C
_0802E3EE:
	cmp r4, #0x80
	bne _0802E412
	lsls r0, r3, #0x10
	asrs r1, r0, #0x10
	ldr r2, _0802E408 @ =0xFFFF0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _0802E40C
	mov r4, ip
	adds r0, r3, r4
	b _0802E46C
	.align 2, 0
_0802E408: .4byte 0xFFFF0000
_0802E40C:
	cmp r1, #0x80
	ble _0802E470
	b _0802E468
_0802E412:
	cmp r4, #0xa0
	bne _0802E42C
	lsls r0, r3, #0x10
	ldr r2, _0802E428 @ =0xFFDF0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _0802E464
	mov r4, ip
	adds r0, r3, r4
	b _0802E46C
	.align 2, 0
_0802E428: .4byte 0xFFDF0000
_0802E42C:
	cmp r4, #0xc0
	bne _0802E448
	lsls r0, r3, #0x10
	ldr r2, _0802E444 @ =0xFFBF0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _0802E464
	mov r4, ip
	adds r0, r3, r4
	b _0802E46C
	.align 2, 0
_0802E444: .4byte 0xFFBF0000
_0802E448:
	cmp r4, #0xe0
	bne _0802E470
	lsls r0, r3, #0x10
	ldr r2, _0802E460 @ =0xFF9F0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #0x7e
	bhi _0802E464
	mov r4, ip
	adds r0, r3, r4
	b _0802E46C
	.align 2, 0
_0802E460: .4byte 0xFF9F0000
_0802E464:
	cmp r0, #0x7f
	bls _0802E470
_0802E468:
	mov r1, ip
	subs r0, r3, r1
_0802E46C:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0802E470:
	mov r0, sl
	adds r0, #0x2e
	strb r3, [r0]
	ldr r4, [sp, #4]
	lsls r2, r4, #3
	subs r0, r2, r4
	lsls r0, r0, #3
	ldr r1, _0802E4B8 @ =gSpriteData
	adds r0, r0, r1
	adds r0, #0x2b
	strb r3, [r0]
	mov r0, sl
	adds r0, #0x2b
	strb r3, [r0]
	movs r0, #0xff
	ands r3, r0
	movs r6, #0x20
	ldr r1, _0802E4BC @ =0x080A4FA4
	lsls r0, r3, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r1, #0
	cmp r0, #0
	bge _0802E4C0
	rsbs r0, r0, #0
	lsls r1, r0, #5
	cmp r1, #0
	bge _0802E4AC
	adds r1, #0xff
_0802E4AC:
	asrs r0, r5, #0x10
	asrs r1, r1, #8
	subs r0, r0, r1
	mov r5, sl
	strh r0, [r5, #2]
	b _0802E4D2
	.align 2, 0
_0802E4B8: .4byte gSpriteData
_0802E4BC: .4byte 0x080A4FA4
_0802E4C0:
	lsls r1, r0, #5
	cmp r1, #0
	bge _0802E4C8
	adds r1, #0xff
_0802E4C8:
	asrs r0, r5, #0x10
	asrs r1, r1, #8
	adds r0, r0, r1
	mov r1, sl
	strh r0, [r1, #2]
_0802E4D2:
	lsls r0, r3, #0x10
	asrs r0, r0, #0xf
	adds r0, #0x80
	adds r0, r0, r4
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r0, #0
	bge _0802E4FC
	rsbs r0, r0, #0
	adds r1, r0, #0
	muls r1, r6, r1
	cmp r1, #0
	bge _0802E4EE
	adds r1, #0xff
_0802E4EE:
	mov r4, sb
	asrs r0, r4, #0x10
	asrs r1, r1, #8
	subs r0, r0, r1
	mov r5, sl
	strh r0, [r5, #4]
	b _0802E512
_0802E4FC:
	adds r1, r0, #0
	muls r1, r6, r1
	cmp r1, #0
	bge _0802E506
	adds r1, #0xff
_0802E506:
	mov r3, sb
	asrs r0, r3, #0x10
	asrs r1, r1, #8
	adds r0, r0, r1
	mov r4, sl
	strh r0, [r4, #4]
_0802E512:
	mov r5, sl
	ldrh r1, [r5, #0x14]
	cmp r1, #0
	bne _0802E574
	strh r1, [r5]
	ldr r3, [sp, #4]
	subs r0, r2, r3
	lsls r0, r0, #3
	ldr r4, _0802E558 @ =gSpriteData
	adds r0, r0, r4
	strh r1, [r0]
	ldr r5, [sp]
	lsls r4, r5, #3
	subs r4, r4, r5
	lsls r4, r4, #3
	ldr r0, _0802E558 @ =gSpriteData
	adds r4, r4, r0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x2f
	bl ParticleSet
	ldrb r0, [r4, #0x1d]
	cmp r0, #0x58
	beq _0802E562
	cmp r0, #0x58
	bgt _0802E55C
	cmp r0, #0x56
	beq _0802E562
	b _0802E574
	.align 2, 0
_0802E558: .4byte gSpriteData
_0802E55C:
	cmp r0, #0x59
	beq _0802E56C
	b _0802E574
_0802E562:
	movs r0, #0x18
	movs r1, #6
	bl PlayMusic
	b _0802E574
_0802E56C:
	movs r0, #0xa
	movs r1, #0
	bl PlayMusic
_0802E574:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start BeamCoreXEyeClosed
BeamCoreXEyeClosed: @ 0x0802E584
	push {lr}
	bl BeamCoreXEyeHandleRotation
	ldr r2, _0802E5BC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0802E5B8
	ldrh r1, [r2]
	ldr r0, _0802E5C0 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	ldr r0, _0802E5C4 @ =0x0832B0C8
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r3, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_0802E5B8:
	pop {r0}
	bx r0
	.align 2, 0
_0802E5BC: .4byte gCurrentSprite
_0802E5C0: .4byte 0x0000FFFB
_0802E5C4: .4byte 0x0832B0C8

	thumb_func_start BeamCoreXEyeOpening
BeamCoreXEyeOpening: @ 0x0802E5C8
	push {lr}
	bl BeamCoreXEyeHandleRotation
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802E5FA
	ldr r1, _0802E600 @ =gCurrentSprite
	ldrh r2, [r1]
	ldr r0, _0802E604 @ =0x00007FFF
	ands r0, r2
	movs r2, #0
	movs r3, #0
	strh r0, [r1]
	ldr r0, _0802E608 @ =0x0832B100
	str r0, [r1, #0x18]
	strb r2, [r1, #0x1c]
	strh r3, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1a
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #0xa0
	strb r0, [r1]
_0802E5FA:
	pop {r0}
	bx r0
	.align 2, 0
_0802E600: .4byte gCurrentSprite
_0802E604: .4byte 0x00007FFF
_0802E608: .4byte 0x0832B100

	thumb_func_start BeamCoreXEyeOpened
BeamCoreXEyeOpened: @ 0x0802E60C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r5, _0802E660 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov r8, r0
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bls _0802E644
	ldrh r0, [r5, #2]
	adds r0, #0x20
	ldrh r1, [r5, #4]
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
_0802E644:
	bl BeamCoreXEyeHandleRotation
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	adds r0, r1, #0
	cmp r0, #0x6e
	bne _0802E668
	ldr r0, _0802E664 @ =0x0832B110
	str r0, [r5, #0x18]
	movs r0, #0
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	b _0802E6E0
	.align 2, 0
_0802E660: .4byte gCurrentSprite
_0802E664: .4byte 0x0832B110
_0802E668:
	cmp r0, #0x3c
	bne _0802E6A0
	ldr r0, _0802E698 @ =0x0832B160
	str r0, [r5, #0x18]
	movs r4, #0
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	ldr r3, _0802E69C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r3, [r0, #0x1e]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x4d
	bl SpriteSpawnSecondary
	b _0802E6E0
	.align 2, 0
_0802E698: .4byte 0x0832B160
_0802E69C: .4byte gSpriteData
_0802E6A0:
	cmp r0, #0x3b
	bhi _0802E6E0
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0802E6E0
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _0802E6D0
	ldr r0, _0802E6CC @ =gSpriteData
	mov r2, r8
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x20
	movs r0, #2
	strb r0, [r1]
	b _0802E6E0
	.align 2, 0
_0802E6CC: .4byte gSpriteData
_0802E6D0:
	ldr r1, _0802E724 @ =gSpriteData
	mov r3, r8
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x20
	strb r2, [r0]
_0802E6E0:
	ldr r2, _0802E728 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	mov ip, r2
	cmp r1, #0
	beq _0802E6F8
	b _0802E8DE
_0802E6F8:
	ldr r0, _0802E72C @ =0x0832B100
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r1, [r2, #0x16]
	mov r0, ip
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #5
	bne _0802E730
	movs r0, #1
	strb r0, [r3]
	mov r5, ip
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
	b _0802E734
	.align 2, 0
_0802E724: .4byte gSpriteData
_0802E728: .4byte gCurrentSprite
_0802E72C: .4byte 0x0832B100
_0802E730:
	movs r0, #0x1e
	strb r0, [r3]
_0802E734:
	mov r1, ip
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x1c
	strb r0, [r1]
	ldr r3, _0802E79C @ =gSpriteData
	mov r5, r8
	lsls r4, r5, #3
	subs r1, r4, r5
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r5, r1, #0
	adds r5, #0x2d
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, #0x20
	strb r2, [r1]
	mov r0, ip
	ldrh r0, [r0, #2]
	str r0, [sp, #0x10]
	mov r1, ip
	ldrh r1, [r1, #4]
	str r1, [sp, #0x14]
	mov r0, ip
	adds r0, #0x2e
	ldrb r1, [r0]
	adds r2, r1, #0
	adds r0, r1, #0
	subs r0, #0x40
	lsls r0, r0, #0x18
	asrs r0, r0, #0x1f
	mov sb, r0
	movs r0, #0x40
	mov r5, sb
	ands r5, r0
	mov sb, r5
	adds r0, r1, #0
	subs r0, #0x11
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _0802E7AC
	adds r0, r1, #0
	subs r0, #0x31
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bhi _0802E7A0
	movs r7, #5
	b _0802E7EC
	.align 2, 0
_0802E79C: .4byte gSpriteData
_0802E7A0:
	adds r0, r1, #0
	subs r0, #0x51
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bhi _0802E7B0
_0802E7AC:
	movs r7, #3
	b _0802E7EC
_0802E7B0:
	adds r0, r1, #0
	subs r0, #0x71
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bhi _0802E7C0
	movs r7, #1
	b _0802E7EC
_0802E7C0:
	adds r0, r1, #0
	adds r0, #0x6f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bls _0802E7EA
	adds r0, r1, #0
	adds r0, #0x4f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1f
	bhi _0802E7DC
	movs r7, #4
	b _0802E7EC
_0802E7DC:
	adds r0, r2, #0
	adds r0, #0x2f
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r7, #1
	cmp r0, #0x1f
	bhi _0802E7EC
_0802E7EA:
	movs r7, #2
_0802E7EC:
	mov r1, r8
	subs r0, r4, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x58
	beq _0802E81A
	cmp r0, #0x58
	bgt _0802E808
	cmp r0, #0x56
	beq _0802E812
	cmp r0, #0x57
	beq _0802E816
	b _0802E8DE
_0802E808:
	cmp r0, #0x59
	beq _0802E81E
	cmp r0, #0xc2
	beq _0802E822
	b _0802E8DE
_0802E812:
	movs r6, #0x4e
	b _0802E824
_0802E816:
	movs r6, #0x4f
	b _0802E824
_0802E81A:
	movs r6, #0x50
	b _0802E824
_0802E81E:
	movs r6, #0x51
	b _0802E824
_0802E822:
	movs r6, #0x74
_0802E824:
	ldr r2, [sp, #0x10]
	str r2, [sp]
	ldr r3, [sp, #0x14]
	str r3, [sp, #4]
	mov r5, sb
	str r5, [sp, #8]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	mov r3, r8
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	str r3, [sp, #0xc]
	cmp r3, #0xff
	beq _0802E8DE
	ldr r0, _0802E888 @ =gSpriteData
	mov sl, r0
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	mov r1, sl
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x2d
	movs r2, #0
	mov r8, r2
	strb r7, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	ldr r2, [sp, #0x10]
	str r2, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	mov r1, sb
	str r1, [sp, #8]
	adds r0, r6, #0
	movs r1, #1
	movs r2, #0xa
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	bne _0802E88C
	mov r2, r8
	strh r2, [r5]
	b _0802E8DE
	.align 2, 0
_0802E888: .4byte gSpriteData
_0802E88C:
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	mov r3, sl
	adds r4, r0, r3
	adds r0, r4, #0
	adds r0, #0x2d
	strb r7, [r0]
	adds r0, #1
	mov r1, r8
	strb r1, [r0]
	ldr r2, [sp, #0x10]
	str r2, [sp]
	ldr r3, [sp, #0x14]
	str r3, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	adds r0, r6, #0
	movs r1, #2
	movs r2, #0xa
	ldr r3, [sp, #0xc]
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	bne _0802E8CA
	mov r1, r8
	strh r1, [r5]
	strh r1, [r4]
	b _0802E8DE
_0802E8CA:
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	add r0, sl
	adds r1, r0, #0
	adds r1, #0x2d
	strb r7, [r1]
	adds r0, #0x2e
	mov r2, r8
	strb r2, [r0]
_0802E8DE:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BeamCoreXEyeShooting
BeamCoreXEyeShooting: @ 0x0802E8F0
	push {r4, lr}
	ldr r4, _0802E974 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0802E922
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bls _0802E922
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
_0802E922:
	ldr r0, _0802E974 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802E96C
	mov r3, ip
	ldrh r1, [r3]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	movs r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	ldr r0, _0802E978 @ =0x0832B1B0
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r2, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldr r2, _0802E97C @ =gSpriteData
	mov r0, ip
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x2d
	strb r3, [r0]
_0802E96C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E974: .4byte gCurrentSprite
_0802E978: .4byte 0x0832B1B0
_0802E97C: .4byte gSpriteData

	thumb_func_start BeamCoreXEyeClosing
BeamCoreXEyeClosing: @ 0x0802E980
	push {lr}
	bl BeamCoreXEyeHandleRotation
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802E9B0
	ldr r3, _0802E9B4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	adds r1, #0xb
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _0802E9B8 @ =0x0832B0B8
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldrh r1, [r3]
	movs r0, #4
	orrs r0, r1
	strh r0, [r3]
_0802E9B0:
	pop {r0}
	bx r0
	.align 2, 0
_0802E9B4: .4byte gCurrentSprite
_0802E9B8: .4byte 0x0832B0B8

	thumb_func_start BeamCoreXGlowingInit
BeamCoreXGlowingInit: @ 0x0802E9BC
	push {r4, r5, r6, lr}
	ldr r0, _0802EA3C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0802EA40 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	adds r0, #0x13
	movs r5, #3
	strb r5, [r0]
	subs r0, #0xe
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802EA44 @ =0x0000FFFC
	mov r6, ip
	strh r1, [r6, #0xa]
	movs r0, #4
	strh r0, [r6, #0xc]
	strh r1, [r6, #0xe]
	strh r0, [r6, #0x10]
	ldr r0, _0802EA48 @ =0x0832AFE0
	str r0, [r6, #0x18]
	strb r3, [r6, #0x1c]
	strh r4, [r6, #0x16]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	subs r0, #1
	strb r2, [r0]
	ldr r2, _0802EA4C @ =gSpriteData
	subs r0, #1
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x76
	bne _0802EA36
	ldr r0, _0802EA50 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	adds r0, r5, #0
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
_0802EA36:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA3C: .4byte gCurrentSprite
_0802EA40: .4byte 0x0000FFFB
_0802EA44: .4byte 0x0000FFFC
_0802EA48: .4byte 0x0832AFE0
_0802EA4C: .4byte gSpriteData
_0802EA50: .4byte gIoRegisters

	thumb_func_start BeamCoreXGlowingIdle
BeamCoreXGlowingIdle: @ 0x0802EA54
	push {lr}
	ldr r3, _0802EA78 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0802EA7C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _0802EA80
	strh r1, [r3]
	b _0802EA9C
	.align 2, 0
_0802EA78: .4byte gCurrentSprite
_0802EA7C: .4byte gSpriteData
_0802EA80:
	ldrh r0, [r2, #2]
	strh r0, [r3, #2]
	ldrh r0, [r2, #4]
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0802EA9C
	strh r0, [r3]
_0802EA9C:
	pop {r0}
	bx r0

	thumb_func_start BeamCoreX
BeamCoreX: @ 0x0802EAA0
	push {lr}
	ldr r0, _0802EABC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x1b
	cmp r0, #0x45
	bls _0802EAB0
	b _0802EC18
_0802EAB0:
	lsls r0, r0, #2
	ldr r1, _0802EAC0 @ =_0802EAC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802EABC: .4byte gCurrentSprite
_0802EAC0: .4byte _0802EAC4
_0802EAC4: @ jump table
	.4byte _0802EBE6 @ case 0
	.4byte _0802EBEA @ case 1
	.4byte _0802EC18 @ case 2
	.4byte _0802EC18 @ case 3
	.4byte _0802EC18 @ case 4
	.4byte _0802EC18 @ case 5
	.4byte _0802EC18 @ case 6
	.4byte _0802EC18 @ case 7
	.4byte _0802EC18 @ case 8
	.4byte _0802EC18 @ case 9
	.4byte _0802EC18 @ case 10
	.4byte _0802EC18 @ case 11
	.4byte _0802EC18 @ case 12
	.4byte _0802EC18 @ case 13
	.4byte _0802EC18 @ case 14
	.4byte _0802EC18 @ case 15
	.4byte _0802EC18 @ case 16
	.4byte _0802EC18 @ case 17
	.4byte _0802EC18 @ case 18
	.4byte _0802EC18 @ case 19
	.4byte _0802EC18 @ case 20
	.4byte _0802EC18 @ case 21
	.4byte _0802EC18 @ case 22
	.4byte _0802EC18 @ case 23
	.4byte _0802EC18 @ case 24
	.4byte _0802EC18 @ case 25
	.4byte _0802EC18 @ case 26
	.4byte _0802EC18 @ case 27
	.4byte _0802EC0E @ case 28
	.4byte _0802EC14 @ case 29
	.4byte _0802EC18 @ case 30
	.4byte _0802EC18 @ case 31
	.4byte _0802EC18 @ case 32
	.4byte _0802EC18 @ case 33
	.4byte _0802EC18 @ case 34
	.4byte _0802EC18 @ case 35
	.4byte _0802EC18 @ case 36
	.4byte _0802EC18 @ case 37
	.4byte _0802EC18 @ case 38
	.4byte _0802EC18 @ case 39
	.4byte _0802EC18 @ case 40
	.4byte _0802EC18 @ case 41
	.4byte _0802EC18 @ case 42
	.4byte _0802EC18 @ case 43
	.4byte _0802EC18 @ case 44
	.4byte _0802EC18 @ case 45
	.4byte _0802EC18 @ case 46
	.4byte _0802EC18 @ case 47
	.4byte _0802EC18 @ case 48
	.4byte _0802EC18 @ case 49
	.4byte _0802EC18 @ case 50
	.4byte _0802EC18 @ case 51
	.4byte _0802EC18 @ case 52
	.4byte _0802EC18 @ case 53
	.4byte _0802EC18 @ case 54
	.4byte _0802EC18 @ case 55
	.4byte _0802EC18 @ case 56
	.4byte _0802EC18 @ case 57
	.4byte _0802EC18 @ case 58
	.4byte _0802EC18 @ case 59
	.4byte _0802EC18 @ case 60
	.4byte _0802EC18 @ case 61
	.4byte _0802EBDC @ case 62
	.4byte _0802EBE0 @ case 63
	.4byte _0802EC18 @ case 64
	.4byte _0802EBF0 @ case 65
	.4byte _0802EBF6 @ case 66
	.4byte _0802EBFC @ case 67
	.4byte _0802EC02 @ case 68
	.4byte _0802EC08 @ case 69
_0802EBDC:
	bl BeamCoreXTransformationInit
_0802EBE0:
	bl BeamCoreXTransformation
	b _0802EC18
_0802EBE6:
	bl BeamCoreXMovingInit
_0802EBEA:
	bl BeamCoreXMoving
	b _0802EC18
_0802EBF0:
	bl BeamCoreXMovingToTargetInit
	b _0802EC18
_0802EBF6:
	bl BeamCoreXMovingToTarget
	b _0802EC18
_0802EBFC:
	bl BeamCoreXRestingAtTarget
	b _0802EC18
_0802EC02:
	bl BeamCoreXAbsorbed
	b _0802EC18
_0802EC08:
	bl BeamCoreXDisplayingMessage
	b _0802EC18
_0802EC0E:
	bl BeamCoreXWaitToFlee
	b _0802EC18
_0802EC14:
	bl BeamCoreXFlee
_0802EC18:
	pop {r0}
	bx r0

	thumb_func_start BeamCoreXShell
BeamCoreXShell: @ 0x0802EC1C
	push {lr}
	ldr r2, _0802EC4C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r3, _0802EC50 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r0, #2]
	strh r1, [r2, #2]
	ldrh r1, [r0, #4]
	strh r1, [r2, #4]
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802EC54
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	b _0802EC5A
	.align 2, 0
_0802EC4C: .4byte gCurrentSprite
_0802EC50: .4byte gSpriteData
_0802EC54:
	ldrh r1, [r2]
	ldr r0, _0802EC70 @ =0x0000FFDF
	ands r0, r1
_0802EC5A:
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	beq _0802EC80
	cmp r0, #1
	bgt _0802EC74
	cmp r0, #0
	beq _0802EC7A
	b _0802EC8A
	.align 2, 0
_0802EC70: .4byte 0x0000FFDF
_0802EC74:
	cmp r0, #2
	beq _0802EC86
	b _0802EC8A
_0802EC7A:
	bl BeamCoreXShellInit
	b _0802EC8A
_0802EC80:
	bl BeamCoreXShellTransformation
	b _0802EC8A
_0802EC86:
	bl BeamCoreXShellIdle
_0802EC8A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BeamCoreXEye
BeamCoreXEye: @ 0x0802EC90
	push {lr}
	ldr r0, _0802ECB0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhi _0802ED5A
	lsls r0, r0, #2
	ldr r1, _0802ECB4 @ =_0802ECB8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802ECB0: .4byte gCurrentSprite
_0802ECB4: .4byte _0802ECB8
_0802ECB8: @ jump table
	.4byte _0802ED34 @ case 0
	.4byte _0802ED38 @ case 1
	.4byte _0802ED3E @ case 2
	.4byte _0802ED5A @ case 3
	.4byte _0802ED5A @ case 4
	.4byte _0802ED5A @ case 5
	.4byte _0802ED5A @ case 6
	.4byte _0802ED5A @ case 7
	.4byte _0802ED5A @ case 8
	.4byte _0802ED5A @ case 9
	.4byte _0802ED5A @ case 10
	.4byte _0802ED5A @ case 11
	.4byte _0802ED5A @ case 12
	.4byte _0802ED5A @ case 13
	.4byte _0802ED5A @ case 14
	.4byte _0802ED5A @ case 15
	.4byte _0802ED5A @ case 16
	.4byte _0802ED5A @ case 17
	.4byte _0802ED5A @ case 18
	.4byte _0802ED5A @ case 19
	.4byte _0802ED5A @ case 20
	.4byte _0802ED5A @ case 21
	.4byte _0802ED5A @ case 22
	.4byte _0802ED5A @ case 23
	.4byte _0802ED44 @ case 24
	.4byte _0802ED5A @ case 25
	.4byte _0802ED4A @ case 26
	.4byte _0802ED5A @ case 27
	.4byte _0802ED50 @ case 28
	.4byte _0802ED5A @ case 29
	.4byte _0802ED56 @ case 30
_0802ED34:
	bl BeamCoreXEyeInit
_0802ED38:
	bl BeamCoreXEyeTransformation
	b _0802ED5A
_0802ED3E:
	bl BeamCoreXEyeClosed
	b _0802ED5A
_0802ED44:
	bl BeamCoreXEyeOpening
	b _0802ED5A
_0802ED4A:
	bl BeamCoreXEyeOpened
	b _0802ED5A
_0802ED50:
	bl BeamCoreXEyeShooting
	b _0802ED5A
_0802ED56:
	bl BeamCoreXEyeClosing
_0802ED5A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BeamCoreXGlowing
BeamCoreXGlowing: @ 0x0802ED60
	push {lr}
	ldr r0, _0802ED7C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802ED80
	cmp r0, #2
	beq _0802ED84
	b _0802ED88
	.align 2, 0
_0802ED7C: .4byte gCurrentSprite
_0802ED80:
	bl BeamCoreXGlowingInit
_0802ED84:
	bl BeamCoreXGlowingIdle
_0802ED88:
	pop {r0}
	bx r0

	thumb_func_start CoreXChargeBeamInit
CoreXChargeBeamInit: @ 0x0802ED8C
	push {r4, lr}
	ldr r2, _0802EDD8 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x25
	movs r1, #0
	movs r0, #4
	strb r0, [r3]
	strb r1, [r2, #0x1c]
	strh r1, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802EDDC @ =0x0000FFF4
	strh r1, [r2, #0xa]
	movs r0, #0xc
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldrb r0, [r2, #0x1e]
	adds r4, r2, #0
	cmp r0, #0
	beq _0802EE34
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0802EE28
	lsls r0, r0, #2
	ldr r1, _0802EDE0 @ =_0802EDE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802EDD8: .4byte gCurrentSprite
_0802EDDC: .4byte 0x0000FFF4
_0802EDE0: .4byte _0802EDE4
_0802EDE4: @ jump table
	.4byte _0802EE28 @ case 0
	.4byte _0802EE04 @ case 1
	.4byte _0802EDF8 @ case 2
	.4byte _0802EE1C @ case 3
	.4byte _0802EE10 @ case 4
_0802EDF8:
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0802EE04:
	ldr r0, _0802EE0C @ =0x0858D9E8
	str r0, [r4, #0x18]
	b _0802EEBA
	.align 2, 0
_0802EE0C: .4byte 0x0858D9E8
_0802EE10:
	ldrh r1, [r4]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r4]
_0802EE1C:
	ldr r0, _0802EE24 @ =0x0858D9F8
	str r0, [r4, #0x18]
	b _0802EEBA
	.align 2, 0
_0802EE24: .4byte 0x0858D9F8
_0802EE28:
	ldr r0, _0802EE30 @ =0x0858D9D8
	str r0, [r4, #0x18]
	b _0802EEBA
	.align 2, 0
_0802EE30: .4byte 0x0858D9D8
_0802EE34:
	movs r0, #0xca
	bl SoundPlay
	ldrh r0, [r4]
	ldr r1, _0802EE58 @ =0x0000FFFB
	ands r1, r0
	strh r1, [r4]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0802EEB4
	lsls r0, r0, #2
	ldr r1, _0802EE5C @ =_0802EE60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802EE58: .4byte 0x0000FFFB
_0802EE5C: .4byte _0802EE60
_0802EE60: @ jump table
	.4byte _0802EEB4 @ case 0
	.4byte _0802EE84 @ case 1
	.4byte _0802EE74 @ case 2
	.4byte _0802EEA4 @ case 3
	.4byte _0802EE94 @ case 4
_0802EE74:
	ldr r0, _0802EE8C @ =gCurrentSprite
	ldrh r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r1, r2
	strh r1, [r0]
	adds r4, r0, #0
_0802EE84:
	ldr r0, _0802EE90 @ =0x0858D9A8
	str r0, [r4, #0x18]
	b _0802EEBA
	.align 2, 0
_0802EE8C: .4byte gCurrentSprite
_0802EE90: .4byte 0x0858D9A8
_0802EE94:
	ldr r0, _0802EEAC @ =gCurrentSprite
	ldrh r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r1, r2
	strh r1, [r0]
	adds r4, r0, #0
_0802EEA4:
	ldr r0, _0802EEB0 @ =0x0858D9C0
	str r0, [r4, #0x18]
	b _0802EEBA
	.align 2, 0
_0802EEAC: .4byte gCurrentSprite
_0802EEB0: .4byte 0x0858D9C0
_0802EEB4:
	ldr r1, _0802EEC0 @ =gCurrentSprite
	ldr r0, _0802EEC4 @ =0x0858D990
	str r0, [r1, #0x18]
_0802EEBA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802EEC0: .4byte gCurrentSprite
_0802EEC4: .4byte 0x0858D990

	thumb_func_start CoreXChargeBeam
CoreXChargeBeam: @ 0x0802EEC8
	push {r4, lr}
	ldr r3, _0802EF4C @ =gCurrentSprite
	ldrb r0, [r3, #0x1e]
	cmp r0, #0
	beq _0802EF6E
	ldrh r4, [r3]
	movs r0, #4
	ands r0, r4
	cmp r0, #0
	beq _0802EEFA
	ldr r2, _0802EF50 @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x36
	bls _0802EEFA
	ldr r0, _0802EF54 @ =0x0000FFFB
	ands r0, r4
	strh r0, [r3]
_0802EEFA:
	ldr r1, _0802EF58 @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	ldr r4, _0802EF4C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0802EF5C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802EF60
	ldrh r1, [r4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0802EF3A
	ldr r2, _0802EF50 @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x36
	bhi _0802EF3A
	movs r0, #0x37
	strb r0, [r1]
_0802EF3A:
	ldr r4, _0802EF4C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #4
	bl ParticleSet
	movs r0, #0
	strh r0, [r4]
	b _0802EFC4
	.align 2, 0
_0802EF4C: .4byte gCurrentSprite
_0802EF50: .4byte gSpriteData
_0802EF54: .4byte 0x0000FFFB
_0802EF58: .4byte gCurrentClipdataAffectingAction
_0802EF5C: .4byte gPreviousCollisionCheck
_0802EF60:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0802EF6E
	bl unk_12a88
_0802EF6E:
	ldr r0, _0802EF8C @ =gCurrentSprite
	adds r4, r0, #0
	adds r4, #0x24
	ldrb r1, [r4]
	adds r2, r0, #0
	cmp r1, #2
	beq _0802EFAE
	cmp r1, #2
	bgt _0802EF90
	cmp r1, #0
	beq _0802EF9A
	cmp r1, #1
	beq _0802EFA0
	b _0802EFC0
	.align 2, 0
_0802EF8C: .4byte gCurrentSprite
_0802EF90:
	cmp r1, #3
	beq _0802EFB2
	cmp r1, #0x37
	beq _0802EFBA
	b _0802EFC0
_0802EF9A:
	bl CoreXChargeBeamInit
	b _0802EFA6
_0802EFA0:
	movs r0, #0x10
	bl MoveEyeCoreXBeam
_0802EFA6:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _0802EFC4
_0802EFAE:
	movs r0, #3
	strb r0, [r4]
_0802EFB2:
	movs r0, #0x18
	bl MoveEyeCoreXBeam
	b _0802EFC4
_0802EFBA:
	movs r0, #0x38
	strb r0, [r4]
	b _0802EFC4
_0802EFC0:
	movs r0, #0
	strh r0, [r2]
_0802EFC4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CoreXWideBeamInit
CoreXWideBeamInit: @ 0x0802EFCC
	push {lr}
	movs r0, #0xc9
	bl SoundPlay
	ldr r2, _0802F020 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x25
	movs r1, #0
	movs r0, #4
	strb r0, [r3]
	strb r1, [r2, #0x1c]
	strh r1, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0802F024 @ =0x0000FFF0
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldrh r1, [r2]
	adds r0, #0xb
	ands r0, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0802F088
	lsls r0, r0, #2
	ldr r1, _0802F028 @ =_0802F02C
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	mov pc, r0
	.align 2, 0
_0802F020: .4byte gCurrentSprite
_0802F024: .4byte 0x0000FFF0
_0802F028: .4byte _0802F02C
_0802F02C: @ jump table
	.4byte _0802F088 @ case 0
	.4byte _0802F05C @ case 1
	.4byte _0802F040 @ case 2
	.4byte _0802F07C @ case 3
	.4byte _0802F06C @ case 4
_0802F040:
	ldr r1, _0802F054 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _0802F058 @ =0x0858DBFC
	b _0802F08C
	.align 2, 0
_0802F054: .4byte gCurrentSprite
_0802F058: .4byte 0x0858DBFC
_0802F05C:
	ldr r1, _0802F064 @ =gCurrentSprite
	ldr r0, _0802F068 @ =0x0858DBFC
	b _0802F08C
	.align 2, 0
_0802F064: .4byte gCurrentSprite
_0802F068: .4byte 0x0858DBFC
_0802F06C:
	ldr r0, _0802F080 @ =gCurrentSprite
	ldrh r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r1, r2
	strh r1, [r0]
	adds r1, r0, #0
_0802F07C:
	ldr r0, _0802F084 @ =0x0858DC1C
	b _0802F08C
	.align 2, 0
_0802F080: .4byte gCurrentSprite
_0802F084: .4byte 0x0858DC1C
_0802F088:
	ldr r1, _0802F094 @ =gCurrentSprite
	ldr r0, _0802F098 @ =0x0858DBDC
_0802F08C:
	str r0, [r1, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0802F094: .4byte gCurrentSprite
_0802F098: .4byte 0x0858DBDC

	thumb_func_start CoreXWideBeam
CoreXWideBeam: @ 0x0802F09C
	push {r4, lr}
	ldr r1, _0802F0DC @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	beq _0802F0B4
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #8
	bhi _0802F0B4
	bl unk_12a88
_0802F0B4:
	ldr r1, _0802F0E0 @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	ldr r4, _0802F0DC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0802F0E4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F0E8
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #5
	bl ParticleSet
	movs r0, #0
	strh r0, [r4]
	b _0802F118
	.align 2, 0
_0802F0DC: .4byte gCurrentSprite
_0802F0E0: .4byte gCurrentClipdataAffectingAction
_0802F0E4: .4byte gPreviousCollisionCheck
_0802F0E8:
	adds r4, #0x24
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802F0FE
	cmp r0, #1
	beq _0802F104
	cmp r0, #8
	bhi _0802F112
	adds r0, #1
	strb r0, [r4]
	b _0802F112
_0802F0FE:
	bl CoreXWideBeamInit
	b _0802F10A
_0802F104:
	movs r0, #0x10
	bl MoveEyeCoreXBeam
_0802F10A:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _0802F118
_0802F112:
	movs r0, #0x18
	bl MoveEyeCoreXBeam
_0802F118:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CoreXPlasmaBeaminit
CoreXPlasmaBeaminit: @ 0x0802F120
	push {lr}
	movs r0, #0xcb
	bl SoundPlay
	ldr r2, _0802F174 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x25
	movs r1, #0
	movs r0, #2
	strb r0, [r3]
	strb r1, [r2, #0x1c]
	strh r1, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802F178 @ =0x0000FFF4
	strh r1, [r2, #0xa]
	movs r0, #0xc
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldrh r1, [r2]
	ldr r0, _0802F17C @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0802F1E0
	lsls r0, r0, #2
	ldr r1, _0802F180 @ =_0802F184
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r2, #0
	mov pc, r0
	.align 2, 0
_0802F174: .4byte gCurrentSprite
_0802F178: .4byte 0x0000FFF4
_0802F17C: .4byte 0x0000FFFB
_0802F180: .4byte _0802F184
_0802F184: @ jump table
	.4byte _0802F1E0 @ case 0
	.4byte _0802F1B4 @ case 1
	.4byte _0802F198 @ case 2
	.4byte _0802F1D4 @ case 3
	.4byte _0802F1C4 @ case 4
_0802F198:
	ldr r1, _0802F1AC @ =gCurrentSprite
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	ldr r0, _0802F1B0 @ =0x0858DE0C
	b _0802F1E4
	.align 2, 0
_0802F1AC: .4byte gCurrentSprite
_0802F1B0: .4byte 0x0858DE0C
_0802F1B4:
	ldr r1, _0802F1BC @ =gCurrentSprite
	ldr r0, _0802F1C0 @ =0x0858DE0C
	b _0802F1E4
	.align 2, 0
_0802F1BC: .4byte gCurrentSprite
_0802F1C0: .4byte 0x0858DE0C
_0802F1C4:
	ldr r0, _0802F1D8 @ =gCurrentSprite
	ldrh r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r1, r2
	strh r1, [r0]
	adds r1, r0, #0
_0802F1D4:
	ldr r0, _0802F1DC @ =0x0858DE24
	b _0802F1E4
	.align 2, 0
_0802F1D8: .4byte gCurrentSprite
_0802F1DC: .4byte 0x0858DE24
_0802F1E0:
	ldr r1, _0802F1EC @ =gCurrentSprite
	ldr r0, _0802F1F0 @ =0x0858DDF4
_0802F1E4:
	str r0, [r1, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0802F1EC: .4byte gCurrentSprite
_0802F1F0: .4byte 0x0858DDF4

	thumb_func_start CoreXPlasmaBeam
CoreXPlasmaBeam: @ 0x0802F1F4
	push {r4, lr}
	ldr r1, _0802F234 @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	beq _0802F20C
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #8
	bhi _0802F20C
	bl unk_12a88
_0802F20C:
	ldr r1, _0802F238 @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	ldr r4, _0802F234 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0802F23C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802F240
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #6
	bl ParticleSet
	movs r0, #0
	strh r0, [r4]
	b _0802F270
	.align 2, 0
_0802F234: .4byte gCurrentSprite
_0802F238: .4byte gCurrentClipdataAffectingAction
_0802F23C: .4byte gPreviousCollisionCheck
_0802F240:
	adds r4, #0x24
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802F256
	cmp r0, #1
	beq _0802F25C
	cmp r0, #8
	bhi _0802F26A
	adds r0, #1
	strb r0, [r4]
	b _0802F26A
_0802F256:
	bl CoreXPlasmaBeaminit
	b _0802F262
_0802F25C:
	movs r0, #0x10
	bl MoveEyeCoreXBeam
_0802F262:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _0802F270
_0802F26A:
	movs r0, #0x18
	bl MoveEyeCoreXBeam
_0802F270:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CoreXWaveIceBeamInit
CoreXWaveIceBeamInit: @ 0x0802F278
	push {lr}
	ldr r0, _0802F28C @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x74
	bne _0802F290
	movs r0, #0xcd
	bl SoundPlay
	b _0802F296
	.align 2, 0
_0802F28C: .4byte gCurrentSprite
_0802F290:
	movs r0, #0xcc
	bl SoundPlay
_0802F296:
	ldr r0, _0802F304 @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	movs r3, #0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0802F308 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	adds r1, #1
	movs r0, #1
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	mov r1, ip
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0802F30C @ =0x0000FFF0
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldrh r1, [r2]
	adds r0, #0xb
	ands r0, r1
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x2d
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #4
	bhi _0802F388
	lsls r0, r0, #2
	ldr r1, _0802F310 @ =_0802F314
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802F304: .4byte gCurrentSprite
_0802F308: .4byte gIoRegisters
_0802F30C: .4byte 0x0000FFF0
_0802F310: .4byte _0802F314
_0802F314: @ jump table
	.4byte _0802F388 @ case 0
	.4byte _0802F34C @ case 1
	.4byte _0802F328 @ case 2
	.4byte _0802F370 @ case 3
	.4byte _0802F364 @ case 4
_0802F328:
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r1, r0
	strh r1, [r2]
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x74
	bne _0802F344
	ldr r0, _0802F340 @ =0x0858E1E8
	b _0802F39A
	.align 2, 0
_0802F340: .4byte 0x0858E1E8
_0802F344:
	ldr r0, _0802F348 @ =0x0858DF74
	b _0802F39A
	.align 2, 0
_0802F348: .4byte 0x0858DF74
_0802F34C:
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x74
	bne _0802F35C
	ldr r0, _0802F358 @ =0x0858E1E8
	b _0802F39A
	.align 2, 0
_0802F358: .4byte 0x0858E1E8
_0802F35C:
	ldr r0, _0802F360 @ =0x0858DF74
	b _0802F39A
	.align 2, 0
_0802F360: .4byte 0x0858DF74
_0802F364:
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
_0802F370:
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x74
	bne _0802F380
	ldr r0, _0802F37C @ =0x0858E1F8
	b _0802F39A
	.align 2, 0
_0802F37C: .4byte 0x0858E1F8
_0802F380:
	ldr r0, _0802F384 @ =0x0858DF84
	b _0802F39A
	.align 2, 0
_0802F384: .4byte 0x0858DF84
_0802F388:
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x74
	bne _0802F398
	ldr r0, _0802F394 @ =0x0858E1D8
	b _0802F39A
	.align 2, 0
_0802F394: .4byte 0x0858E1D8
_0802F398:
	ldr r0, _0802F3A0 @ =0x0858DF64
_0802F39A:
	str r0, [r2, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0802F3A0: .4byte 0x0858DF64

	thumb_func_start CoreXWaveIceBeam
CoreXWaveIceBeam: @ 0x0802F3A4
	push {r4, lr}
	ldr r4, _0802F3D4 @ =gCurrentSprite
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _0802F3B2
	bl unk_12b54
_0802F3B2:
	ldr r1, _0802F3D8 @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	adds r4, #0x24
	ldrb r0, [r4]
	cmp r0, #0
	beq _0802F3DC
	cmp r0, #1
	beq _0802F3E2
	movs r0, #0x18
	bl MoveEyeCoreXBeam
	b _0802F3EE
	.align 2, 0
_0802F3D4: .4byte gCurrentSprite
_0802F3D8: .4byte gCurrentClipdataAffectingAction
_0802F3DC:
	bl CoreXWaveIceBeamInit
	b _0802F3E8
_0802F3E2:
	movs r0, #0x10
	bl MoveEyeCoreXBeam
_0802F3E8:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0802F3EE:
	ldr r1, _0802F400 @ =gCurrentSprite
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F400: .4byte gCurrentSprite
