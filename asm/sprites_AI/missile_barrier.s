    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start XBarrierSetCollision
XBarrierSetCollision: @ 0x08029CF0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08029D44 @ =gCurrentSprite
	ldrh r4, [r0, #2]
	subs r4, #0x20
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldrh r0, [r0, #4]
	mov r8, r0
	ldr r6, _08029D48 @ =gCurrentClipdataAffectingAction
	strb r5, [r6]
	adds r0, r4, #0
	subs r0, #0x40
	mov r1, r8
	bl ClipdataProcess
	strb r5, [r6]
	adds r0, r4, #0
	mov r1, r8
	bl ClipdataProcess
	strb r5, [r6]
	adds r0, r4, #0
	adds r0, #0x40
	mov r1, r8
	bl ClipdataProcess
	strb r5, [r6]
	adds r4, #0x80
	adds r0, r4, #0
	mov r1, r8
	bl ClipdataProcess
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08029D44: .4byte gCurrentSprite
_08029D48: .4byte gCurrentClipdataAffectingAction

	thumb_func_start XBarrierCoreInit
XBarrierCoreInit: @ 0x08029D4C
	push {r4, r5, lr}
	sub sp, #0xc
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08029D6C @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x24
	ldrb r0, [r3]
	cmp r0, #0x59
	bne _08029D70
	movs r0, #0x5a
	strb r0, [r3]
	movs r0, #0x2c
	strh r0, [r2, #6]
	b _08029D9C
	.align 2, 0
_08029D6C: .4byte gCurrentSprite
_08029D70:
	ldrb r1, [r2, #0x1d]
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _08029D94 @ =gNormalXBarrierCoresDestroyed
	ldrh r0, [r0]
	asrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08029D98
	movs r0, #0
	strh r0, [r2]
	b _08029E6E
	.align 2, 0
_08029D94: .4byte gNormalXBarrierCoresDestroyed
_08029D98:
	movs r0, #2
	strb r0, [r3]
_08029D9C:
	ldr r4, _08029E00 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x27
	movs r3, #0
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r2, _08029E04 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r1, #3
	movs r0, #0xd
	strb r0, [r1]
	ldr r0, _08029E08 @ =sMissileBarrierOam_31c348
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _08029E28
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08029E0C
	strh r0, [r4]
	b _08029E6E
	.align 2, 0
_08029E00: .4byte gCurrentSprite
_08029E04: .4byte sPrimarySpriteStats
_08029E08: .4byte sMissileBarrierOam_31c348
_08029E0C:
	ldr r0, _08029E20 @ =0x0000FFC0
	strh r0, [r4, #0xa]
	movs r0, #0x40
	strh r0, [r4, #0xc]
	ldr r0, _08029E24 @ =0x0000FFD0
	strh r0, [r4, #0xe]
	movs r0, #0x30
	strh r0, [r4, #0x10]
	b _08029E6E
	.align 2, 0
_08029E20: .4byte 0x0000FFC0
_08029E24: .4byte 0x0000FFD0
_08029E28:
	ldr r0, _08029E60 @ =0x0000FFD0
	strh r0, [r4, #0xa]
	movs r0, #0x30
	strh r0, [r4, #0xc]
	ldr r0, _08029E64 @ =0x0000FFD8
	strh r0, [r4, #0xe]
	movs r0, #0x28
	strh r0, [r4, #0x10]
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x1d
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xff
	bne _08029E68
	strh r5, [r4]
	b _08029E6E
	.align 2, 0
_08029E60: .4byte 0x0000FFD0
_08029E64: .4byte 0x0000FFD8
_08029E68:
	movs r0, #3
	bl XBarrierSetCollision
_08029E6E:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XBarrierCoreIdleInit
XBarrierCoreIdleInit: @ 0x08029E78
	ldr r1, _08029E90 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _08029E94 @ =sMissileBarrierOam_31c348
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_08029E90: .4byte gCurrentSprite
_08029E94: .4byte sMissileBarrierOam_31c348

	thumb_func_start XBarrierCoreIdle
XBarrierCoreIdle: @ 0x08029E98
	bx lr
	.align 2, 0

	thumb_func_start XBarrierCoreDeath
XBarrierCoreDeath: @ 0x08029E9C
	push {lr}
	ldr r0, _08029EC4 @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #9
	lsls r1, r0
	lsrs r1, r1, #0x10
	ldr r2, _08029EC8 @ =gNormalXBarrierCoresDestroyed
	ldrh r0, [r2]
	orrs r1, r0
	strh r1, [r2]
	movs r0, #1
	bl XBarrierSetCollision
	pop {r0}
	bx r0
	.align 2, 0
_08029EC4: .4byte gCurrentSprite
_08029EC8: .4byte gNormalXBarrierCoresDestroyed

	thumb_func_start XBarrierCore
XBarrierCore: @ 0x08029ECC
	push {r4, lr}
	ldr r4, _08029F04 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08029EE6
	movs r0, #0xb0
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08029EE6:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08029F08
	bl SpriteUtilUpdateFreezeTimer
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x1d
	bl SpriteUtilUpdateSecondarySpritesFreezeTimer
	b _08029F74
	.align 2, 0
_08029F04: .4byte gCurrentSprite
_08029F08:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x57
	beq _08029F4C
	cmp r0, #0x57
	bgt _08029F2A
	cmp r0, #1
	beq _08029F42
	cmp r0, #1
	bgt _08029F24
	cmp r0, #0
	beq _08029F3C
	b _08029F74
_08029F24:
	cmp r0, #2
	beq _08029F46
	b _08029F74
_08029F2A:
	cmp r0, #0x59
	beq _08029F66
	cmp r0, #0x59
	blt _08029F60
	cmp r0, #0x5a
	beq _08029F6A
	cmp r0, #0x5b
	beq _08029F70
	b _08029F74
_08029F3C:
	bl XBarrierCoreInit
	b _08029F74
_08029F42:
	bl XBarrierCoreIdleInit
_08029F46:
	bl XBarrierCoreIdle
	b _08029F74
_08029F4C:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x1d
	bl SpriteUtilUnfreezeSecondarySprites
	bl XBarrierCoreDeath
	bl SpriteDyingInit
_08029F60:
	bl SpriteDying
	b _08029F74
_08029F66:
	bl XBarrierCoreInit
_08029F6A:
	bl SpriteSpawningFromX
	b _08029F74
_08029F70:
	bl XParasiteInit
_08029F74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XBarrierStem
XBarrierStem: @ 0x08029F7C
	push {r4, r5, r6, lr}
	ldr r4, _08029F94 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r6, [r0]
	cmp r6, #0
	beq _08029F98
	bl SpriteUtilUpdateFreezeTimer
	bl SpriteUtilUpdatePrimarySpriteFreezeTimer
	b _0802A0AA
	.align 2, 0
_08029F94: .4byte gCurrentSprite
_08029F98:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r5, [r0]
	adds r3, r4, #0
	adds r3, #0x24
	ldrb r0, [r3]
	cmp r0, #2
	beq _0802A028
	cmp r0, #2
	bgt _08029FB4
	cmp r0, #0
	beq _08029FBC
	lsls r2, r5, #3
	b _0802A070
_08029FB4:
	cmp r0, #0x18
	beq _0802A05C
	lsls r2, r5, #3
	b _0802A070
_08029FBC:
	ldrh r1, [r4]
	ldr r0, _0802A014 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r4]
	movs r0, #2
	strb r0, [r3]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #8
	strb r0, [r1]
	ldr r0, _0802A018 @ =0x0000FF80
	strh r0, [r4, #0xa]
	movs r0, #0x80
	strh r0, [r4, #0xc]
	ldr r0, _0802A01C @ =0x0000FFF0
	strh r0, [r4, #0xe]
	movs r0, #0x10
	strh r0, [r4, #0x10]
	ldr r1, _0802A020 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	adds r1, #3
	movs r0, #0xd
	strb r0, [r1]
	ldr r0, _0802A024 @ =sMissileBarrierOam_31c2f8
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r6, [r4, #0x16]
	lsls r2, r5, #3
	b _0802A070
	.align 2, 0
_0802A014: .4byte 0x0000FFFB
_0802A018: .4byte 0x0000FF80
_0802A01C: .4byte 0x0000FFF0
_0802A020: .4byte sSecondarySpriteStats
_0802A024: .4byte sMissileBarrierOam_31c2f8
_0802A028:
	ldr r2, _0802A054 @ =gSpriteData
	lsls r1, r5, #3
	subs r0, r1, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0, #0x14]
	adds r2, r1, #0
	cmp r0, #0
	bne _0802A070
	movs r0, #0x18
	strb r0, [r3]
	ldr r0, _0802A058 @ =sMissileBarrierOam_31c320
	str r0, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r6, [r4, #0x16]
	strh r6, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _0802A070
	.align 2, 0
_0802A054: .4byte gSpriteData
_0802A058: .4byte sMissileBarrierOam_31c320
_0802A05C:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	lsls r2, r5, #3
	cmp r0, #0
	beq _0802A070
	strh r6, [r4]
_0802A070:
	ldr r1, _0802A098 @ =gSpriteData
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802A0A0
	ldr r1, _0802A09C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strh r0, [r1]
	b _0802A0AA
	.align 2, 0
_0802A098: .4byte gSpriteData
_0802A09C: .4byte gCurrentSprite
_0802A0A0:
	ldr r2, _0802A0B0 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _0802A0B4 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
_0802A0AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802A0B0: .4byte gCurrentSprite
_0802A0B4: .4byte 0x0000FFDF
