    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SpriteUtilUpdateSubSpriteData1Animation
SpriteUtilUpdateSubSpriteData1Animation: @ 0x08035ACC
	push {lr}
	ldr r2, _08035B04 @ =gSubSpriteData1
	ldrb r0, [r2, #6]
	adds r0, #1
	strb r0, [r2, #6]
	ldrh r1, [r2, #4]
	ldr r3, [r2]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrb r1, [r1, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhs _08035B00
	movs r0, #1
	strb r0, [r2, #6]
	ldrh r0, [r2, #4]
	adds r0, #1
	strh r0, [r2, #4]
	ldrh r0, [r2, #4]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08035B00
	strh r0, [r2, #4]
_08035B00:
	pop {r0}
	bx r0
	.align 2, 0
_08035B04: .4byte gSubSpriteData1

	thumb_func_start SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position: @ 0x08035B08
	push {r4, lr}
	ldr r3, _08035B44 @ =gSubSpriteData1
	ldrh r0, [r3, #4]
	ldr r1, [r3]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r2, _08035B48 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	ldrh r1, [r3, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0, #4]
	ldrh r3, [r3, #0xa]
	adds r0, r0, r3
	strh r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035B44: .4byte gSubSpriteData1
_08035B48: .4byte gCurrentSprite

	thumb_func_start BoxSyncSubSprites
BoxSyncSubSprites: @ 0x08035B4C
	push {r4, lr}
	ldr r4, _08035BA8 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08035BAC @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08035BB0 @ =0x0879AFE0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _08035B7E
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_08035B7E:
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
_08035BA8: .4byte gSubSpriteData1
_08035BAC: .4byte gCurrentSprite
_08035BB0: .4byte 0x0879AFE0

	thumb_func_start BoxXMovement
BoxXMovement: @ 0x08035BB4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov sl, r7
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	mov sb, r5
	movs r0, #0
	mov r8, r0
	ldr r6, _08035C00 @ =gCurrentSprite
	ldrh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08035C12
	ldr r4, _08035C04 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	adds r1, #0x6e
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08035C08 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035C0C
	adds r0, r6, #0
	adds r0, #0x24
	strb r5, [r0]
	movs r1, #1
	mov r8, r1
	b _08035C48
	.align 2, 0
_08035C00: .4byte gCurrentSprite
_08035C04: .4byte gSubSpriteData1
_08035C08: .4byte gPreviousCollisionCheck
_08035C0C:
	ldrh r0, [r4, #0xa]
	adds r0, r7, r0
	b _08035C46
_08035C12:
	ldr r4, _08035C38 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	subs r1, #0x6e
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08035C3C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08035C40
	adds r0, r6, #0
	adds r0, #0x24
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	mov r8, r0
	b _08035C48
	.align 2, 0
_08035C38: .4byte gSubSpriteData1
_08035C3C: .4byte gPreviousCollisionCheck
_08035C40:
	ldrh r0, [r4, #0xa]
	mov r1, sl
	subs r0, r0, r1
_08035C46:
	strh r0, [r4, #0xa]
_08035C48:
	mov r0, r8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start BoxInit
BoxInit: @ 0x08035C58
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl EventCheckOn_BoxRumble
	adds r1, r0, #0
	cmp r1, #0
	bne _08035C70
	ldr r0, _08035C6C @ =gCurrentSprite
	strh r1, [r0]
	b _08035E02
	.align 2, 0
_08035C6C: .4byte gCurrentSprite
_08035C70:
	ldr r7, _08035E0C @ =gCurrentSprite
	adds r0, r7, #0
	adds r0, #0x25
	movs r5, #0
	strb r5, [r0]
	ldrh r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r3, r1, #0
	movs r6, #0
	orrs r3, r0
	strh r3, [r7]
	adds r0, r7, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _08035E10 @ =0x0000FFD8
	strh r0, [r7, #0xa]
	movs r0, #0x40
	strh r0, [r7, #0xc]
	ldr r0, _08035E14 @ =0x0000FFD0
	strh r0, [r7, #0xe]
	movs r0, #0x30
	strh r0, [r7, #0x10]
	adds r0, r7, #0
	adds r0, #0x2d
	movs r1, #7
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x22
	movs r0, #0xc
	strb r0, [r2]
	adds r2, #0x13
	movs r0, #2
	strb r0, [r2]
	strb r1, [r7, #0x1e]
	ldr r2, _08035E18 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
	adds r2, r7, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08035E1C @ =sFrameData_347bd8
	str r0, [r7, #0x18]
	strb r6, [r7, #0x1c]
	strh r5, [r7, #0x16]
	ldr r4, _08035E20 @ =gSubSpriteData1
	ldrh r0, [r7, #2]
	strh r0, [r4, #8]
	ldrh r0, [r7, #4]
	strh r0, [r4, #0xa]
	ldr r0, _08035E24 @ =sMultiSpriteData_342df0
	str r0, [r4]
	strb r6, [r4, #6]
	strh r5, [r4, #4]
	strb r6, [r4, #0xe]
	adds r0, r7, #0
	adds r0, #0x2f
	strb r6, [r0]
	ldr r0, _08035E28 @ =0x0000FDFF
	ands r3, r0
	strh r3, [r7]
	adds r1, r7, #0
	adds r1, #0x24
	movs r0, #0x3f
	strb r0, [r1]
	ldrb r2, [r7, #0x1f]
	adds r6, r7, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #8
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #9
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #0xa
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x31
	movs r1, #0xb
	bl SpriteSpawnSecondary
_08035E02:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035E0C: .4byte gCurrentSprite
_08035E10: .4byte 0x0000FFD8
_08035E14: .4byte 0x0000FFD0
_08035E18: .4byte sPrimarySpriteStats
_08035E1C: .4byte sFrameData_347bd8
_08035E20: .4byte gSubSpriteData1
_08035E24: .4byte sMultiSpriteData_342df0
_08035E28: .4byte 0x0000FDFF

	thumb_func_start BoxWaitingToEmergeInit
BoxWaitingToEmergeInit: @ 0x08035E2C
	push {r4, r5, lr}
	ldr r1, _08035E74 @ =gSubSpriteData1
	ldr r0, _08035E78 @ =sMultiSpriteData_342f38
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r4, #0
	strh r0, [r1, #4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r2, [r1, #0xa]
	adds r0, r0, r2
	strh r0, [r1, #0xa]
	ldr r5, _08035E7C @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2e
	strb r4, [r0]
	ldr r0, _08035E80 @ =0x0000026D
	bl unk_3b1c
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	adds r0, r5, #0
	adds r0, #0x31
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035E74: .4byte gSubSpriteData1
_08035E78: .4byte sMultiSpriteData_342f38
_08035E7C: .4byte gCurrentSprite
_08035E80: .4byte 0x0000026D

	thumb_func_start BoxWaitingToEmerge
BoxWaitingToEmerge: @ 0x08035E84
	push {r4, r5, r6, lr}
	ldr r6, _08035EC8 @ =gCurrentSprite
	adds r4, r6, #0
	adds r4, #0x31
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	bls _08035EAC
	ldr r0, _08035ECC @ =0x0000026D
	bl unk_3b1c
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0
	strb r0, [r4]
_08035EAC:
	ldrh r5, [r6, #2]
	ldrh r4, [r6, #4]
	adds r0, r6, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0x24
	bls _08035EBC
	b _08035FC2
_08035EBC:
	lsls r0, r0, #2
	ldr r1, _08035ED0 @ =_08035ED4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035EC8: .4byte gCurrentSprite
_08035ECC: .4byte 0x0000026D
_08035ED0: .4byte _08035ED4
_08035ED4: @ jump table
	.4byte _08035F68 @ case 0
	.4byte _08035FC2 @ case 1
	.4byte _08035FC2 @ case 2
	.4byte _08035FC2 @ case 3
	.4byte _08035F6E @ case 4
	.4byte _08035FC2 @ case 5
	.4byte _08035FC2 @ case 6
	.4byte _08035FC2 @ case 7
	.4byte _08035F74 @ case 8
	.4byte _08035FC2 @ case 9
	.4byte _08035FC2 @ case 10
	.4byte _08035FC2 @ case 11
	.4byte _08035FC2 @ case 12
	.4byte _08035FC2 @ case 13
	.4byte _08035FC2 @ case 14
	.4byte _08035FC2 @ case 15
	.4byte _08035F7E @ case 16
	.4byte _08035FC2 @ case 17
	.4byte _08035FC2 @ case 18
	.4byte _08035FC2 @ case 19
	.4byte _08035F88 @ case 20
	.4byte _08035FC2 @ case 21
	.4byte _08035FC2 @ case 22
	.4byte _08035FC2 @ case 23
	.4byte _08035F98 @ case 24
	.4byte _08035FC2 @ case 25
	.4byte _08035FC2 @ case 26
	.4byte _08035FC2 @ case 27
	.4byte _08035FA2 @ case 28
	.4byte _08035FC2 @ case 29
	.4byte _08035FC2 @ case 30
	.4byte _08035FC2 @ case 31
	.4byte _08035FAA @ case 32
	.4byte _08035FC2 @ case 33
	.4byte _08035FC2 @ case 34
	.4byte _08035FC2 @ case 35
	.4byte _08035FBA @ case 36
_08035F68:
	adds r0, r5, #0
	adds r1, r4, #0
	b _08035F90
_08035F6E:
	adds r0, r5, #0
	adds r1, r4, #0
	b _08035FB2
_08035F74:
	adds r0, r5, #0
	subs r0, #0x1c
	adds r1, r4, #0
	adds r1, #0x1c
	b _08035F90
_08035F7E:
	adds r0, r5, #0
	adds r0, #0x20
	adds r1, r4, #0
	subs r1, #0x20
	b _08035FB2
_08035F88:
	adds r0, r5, #0
	subs r0, #0x1c
	adds r1, r4, #0
	subs r1, #0x2e
_08035F90:
	movs r2, #0x2e
	bl ParticleSet
	b _08035FC2
_08035F98:
	adds r0, r5, #0
	adds r0, #0x40
	adds r1, r4, #0
	subs r1, #0x40
	b _08035FB2
_08035FA2:
	adds r0, r5, #0
	adds r0, #0x58
	adds r1, r4, #0
	b _08035FB2
_08035FAA:
	adds r0, r5, #0
	subs r0, #0x5a
	adds r1, r4, #0
	adds r1, #0x10
_08035FB2:
	movs r2, #0x2f
	bl ParticleSet
	b _08035FC2
_08035FBA:
	ldr r0, _08036000 @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #0xff
	strb r1, [r0]
_08035FC2:
	ldr r6, _08036000 @ =gCurrentSprite
	adds r1, r6, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #4
	bne _08035FF8
	adds r0, r6, #0
	adds r0, #0x24
	movs r1, #0x41
	strb r1, [r0]
	adds r1, r4, #0
	subs r1, #0xa0
	adds r0, r5, #0
	movs r2, #0x2f
	bl ParticleSet
	movs r0, #0x1b
	movs r1, #7
	bl PlayMusic
_08035FF8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08036000: .4byte gCurrentSprite

	thumb_func_start BoxFirstJumpInit
BoxFirstJumpInit: @ 0x08036004
	push {lr}
	ldr r1, _08036038 @ =gSubSpriteData1
	ldr r0, _0803603C @ =sMultiSpriteData_342d98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08036040 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x42
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldrh r1, [r3]
	ldr r0, _08036044 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08036048 @ =0x00000265
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036038: .4byte gSubSpriteData1
_0803603C: .4byte sMultiSpriteData_342d98
_08036040: .4byte gCurrentSprite
_08036044: .4byte 0x0000FDFF
_08036048: .4byte 0x00000265

	thumb_func_start BoxFirstJump
BoxFirstJump: @ 0x0803604C
	push {r4, r5, lr}
	ldr r4, _08036090 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _08036094 @ =sBoxFirstJumpSpeed
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08036098 @ =0x00007FFF
	cmp r1, r0
	bne _080360A4
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
	ldr r1, _0803609C @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	adds r1, #0xb4
	movs r2, #0x35
	bl ParticleSet
	ldr r0, _080360A0 @ =0x00000266
	bl SoundPlay
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	b _080360B8
	.align 2, 0
_08036090: .4byte gCurrentSprite
_08036094: .4byte sBoxFirstJumpSpeed
_08036098: .4byte 0x00007FFF
_0803609C: .4byte gSubSpriteData1
_080360A0: .4byte 0x00000266
_080360A4:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldr r1, _080360C0 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r3
	strh r0, [r1, #8]
	ldrh r0, [r1, #0xa]
	subs r0, #0xa
	strh r0, [r1, #0xa]
_080360B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080360C0: .4byte gSubSpriteData1

	thumb_func_start BoxWaitingToRunInit
BoxWaitingToRunInit: @ 0x080360C4
	push {lr}
	ldr r1, _080360EC @ =gSubSpriteData1
	ldr r0, _080360F0 @ =sMultiSpriteData_342f60
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _080360F4 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x18
	strb r1, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, _080360F8 @ =0x0000026A
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_080360EC: .4byte gSubSpriteData1
_080360F0: .4byte sMultiSpriteData_342f60
_080360F4: .4byte gCurrentSprite
_080360F8: .4byte 0x0000026A

	thumb_func_start BoxWaitingToRun
BoxWaitingToRun: @ 0x080360FC
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08036120
	ldr r1, _08036138 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08036120
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
_08036120:
	ldr r1, _08036138 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036132
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_08036132:
	pop {r0}
	bx r0
	.align 2, 0
_08036138: .4byte gCurrentSprite

	thumb_func_start BoxSlowRunningInit
BoxSlowRunningInit: @ 0x0803613C
	push {lr}
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r0, _08036158 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036164
	ldr r1, _0803615C @ =gSubSpriteData1
	ldr r0, _08036160 @ =sMultiSpriteData_342ed8
	b _08036168
	.align 2, 0
_08036158: .4byte gCurrentSprite
_0803615C: .4byte gSubSpriteData1
_08036160: .4byte sMultiSpriteData_342ed8
_08036164:
	ldr r1, _08036184 @ =gSubSpriteData1
	ldr r0, _08036188 @ =sMultiSpriteData_342e48
_08036168:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _0803618C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x1a
	strb r1, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08036184: .4byte gSubSpriteData1
_08036188: .4byte sMultiSpriteData_342e48
_0803618C: .4byte gCurrentSprite

	thumb_func_start BoxSlowRun
BoxSlowRun: @ 0x08036190
	push {r4, r5, lr}
	ldr r0, _080361F0 @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _080361F4 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _080361F8 @ =0x00010003
	cmp r0, r1
	bne _080361A6
	ldr r0, _080361FC @ =0x00000262
	bl SoundPlay
_080361A6:
	ldr r5, _08036200 @ =gCurrentSprite
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	movs r1, #0x37
	bl BoxXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080361EA
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _080361D8
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _080361D8
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
_080361D8:
	ldr r1, _08036200 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080361EA
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_080361EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080361F0: .4byte gSubSpriteData1
_080361F4: .4byte 0x00FFFFFF
_080361F8: .4byte 0x00010003
_080361FC: .4byte 0x00000262
_08036200: .4byte gCurrentSprite

	thumb_func_start BoxFastRunInit
BoxFastRunInit: @ 0x08036204
	push {lr}
	ldr r2, _0803621C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036228
	ldr r1, _08036220 @ =gSubSpriteData1
	ldr r0, _08036224 @ =sMultiSpriteData_342f08
	b _0803622C
	.align 2, 0
_0803621C: .4byte gCurrentSprite
_08036220: .4byte gSubSpriteData1
_08036224: .4byte sMultiSpriteData_342f08
_08036228:
	ldr r1, _08036248 @ =gSubSpriteData1
	ldr r0, _0803624C @ =sMultiSpriteData_342e78
_0803622C:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0xa
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08036248: .4byte gSubSpriteData1
_0803624C: .4byte sMultiSpriteData_342e78

	thumb_func_start BoxFastRun
BoxFastRun: @ 0x08036250
	push {r4, lr}
	ldr r4, _08036284 @ =gSubSpriteData1
	ldr r0, [r4, #4]
	ldr r1, _08036288 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0803628C @ =0x00010003
	cmp r0, r1
	bne _08036266
	ldr r0, _08036290 @ =0x00000262
	bl SoundPlay
_08036266:
	movs r0, #8
	movs r1, #0x37
	bl BoxXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080362CC
	ldr r2, _08036294 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08036298
	subs r0, #1
	b _080362DC
	.align 2, 0
_08036284: .4byte gSubSpriteData1
_08036288: .4byte 0x00FFFFFF
_0803628C: .4byte 0x00010003
_08036290: .4byte 0x00000262
_08036294: .4byte gCurrentSprite
_08036298:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080362B8
	ldrh r0, [r4, #0xa]
	subs r0, #0xc8
	ldr r1, _080362B4 @ =gSamusData
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	ble _080362CC
	b _080362C4
	.align 2, 0
_080362B4: .4byte gSamusData
_080362B8:
	ldrh r0, [r4, #0xa]
	adds r0, #0xc8
	ldr r1, _080362E4 @ =gSamusData
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bge _080362CC
_080362C4:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
_080362CC:
	ldr r1, _080362E8 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080362DE
	adds r1, #0x24
	movs r0, #0x3b
_080362DC:
	strb r0, [r1]
_080362DE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080362E4: .4byte gSamusData
_080362E8: .4byte gCurrentSprite

	thumb_func_start BoxSkiddingInit
BoxSkiddingInit: @ 0x080362EC
	push {lr}
	ldr r2, _08036304 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036310
	ldr r1, _08036308 @ =gSubSpriteData1
	ldr r0, _0803630C @ =sMultiSpriteData_342fc8
	b _08036314
	.align 2, 0
_08036304: .4byte gCurrentSprite
_08036308: .4byte gSubSpriteData1
_0803630C: .4byte sMultiSpriteData_342fc8
_08036310:
	ldr r1, _08036334 @ =gSubSpriteData1
	ldr r0, _08036338 @ =sMultiSpriteData_342fa8
_08036314:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _0803633C @ =0x00000263
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036334: .4byte gSubSpriteData1
_08036338: .4byte sMultiSpriteData_342fa8
_0803633C: .4byte 0x00000263

	thumb_func_start BoxSkidding
BoxSkidding: @ 0x08036340
	push {r4, r5, lr}
	ldr r4, _0803638C @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsrs r0, r0, #2
	movs r1, #0x1f
	cmp r0, #5
	bls _08036354
	movs r1, #0x37
_08036354:
	bl BoxXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036384
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08036372
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
_08036372:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036384
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_08036384:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803638C: .4byte gCurrentSprite

	thumb_func_start BoxStopSkiddingInit
BoxStopSkiddingInit: @ 0x08036390
	push {lr}
	ldr r2, _080363A8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080363B4
	ldr r1, _080363AC @ =gSubSpriteData1
	ldr r0, _080363B0 @ =sMultiSpriteData_342fd8
	b _080363B8
	.align 2, 0
_080363A8: .4byte gCurrentSprite
_080363AC: .4byte gSubSpriteData1
_080363B0: .4byte sMultiSpriteData_342fd8
_080363B4:
	ldr r1, _080363CC @ =gSubSpriteData1
	ldr r0, _080363D0 @ =sMultiSpriteData_342fb8
_080363B8:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080363CC: .4byte gSubSpriteData1
_080363D0: .4byte sMultiSpriteData_342fb8

	thumb_func_start BoxStopSkidding
BoxStopSkidding: @ 0x080363D4
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _080363F4
	ldr r1, _080363F0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3b
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #3
	b _08036404
	.align 2, 0
_080363F0: .4byte gCurrentSprite
_080363F4:
	ldr r1, _0803640C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036406
	adds r1, #0x24
	movs r0, #0x3b
_08036404:
	strb r0, [r1]
_08036406:
	pop {r0}
	bx r0
	.align 2, 0
_0803640C: .4byte gCurrentSprite

	thumb_func_start BoxBonkingInit
BoxBonkingInit: @ 0x08036410
	push {lr}
	ldr r1, _08036454 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	subs r0, #0x10
	movs r3, #0
	movs r2, #0
	strh r0, [r1, #8]
	ldr r0, _08036458 @ =sMultiSpriteData_342d98
	str r0, [r1]
	strb r3, [r1, #6]
	strh r2, [r1, #4]
	ldr r2, _0803645C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r3, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _08036460 @ =0x00000267
	bl SoundPlay
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	pop {r0}
	bx r0
	.align 2, 0
_08036454: .4byte gSubSpriteData1
_08036458: .4byte sMultiSpriteData_342d98
_0803645C: .4byte gCurrentSprite
_08036460: .4byte 0x00000267

	thumb_func_start BoxBonking
BoxBonking: @ 0x08036464
	push {r4, r5, r6, r7, lr}
	ldr r4, _08036488 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0803648C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036494
	strh r1, [r4, #8]
	ldr r0, _08036490 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x4b
	strb r1, [r0]
	b _080364F8
	.align 2, 0
_08036488: .4byte gSubSpriteData1
_0803648C: .4byte gPreviousVerticalCollisionCheck
_08036490: .4byte gCurrentSprite
_08036494:
	ldr r2, _080364C0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r6, _080364C4 @ =sBoxBonkingSpeed
	lsls r0, r3, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _080364C8 @ =0x00007FFF
	cmp r1, r0
	bne _080364CC
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r4, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080364D6
	.align 2, 0
_080364C0: .4byte gCurrentSprite
_080364C4: .4byte sBoxBonkingSpeed
_080364C8: .4byte 0x00007FFF
_080364CC:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, r0, r5
_080364D6:
	strh r0, [r4, #8]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080364F0
	ldr r1, _080364EC @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, #6
	b _080364F6
	.align 2, 0
_080364EC: .4byte gSubSpriteData1
_080364F0:
	ldr r1, _08036500 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, #6
_080364F6:
	strh r0, [r1, #0xa]
_080364F8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036500: .4byte gSubSpriteData1

	thumb_func_start BoxLandingFromBonkInit
BoxLandingFromBonkInit: @ 0x08036504
	push {lr}
	ldr r1, _08036534 @ =gSubSpriteData1
	ldr r0, _08036538 @ =sMultiSpriteData_342da8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0803653C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x4c
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	ldr r0, _08036540 @ =0x00000266
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036534: .4byte gSubSpriteData1
_08036538: .4byte sMultiSpriteData_342da8
_0803653C: .4byte gCurrentSprite
_08036540: .4byte 0x00000266

	thumb_func_start BoxLandingFromBonk
BoxLandingFromBonk: @ 0x08036544
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08036556
	ldr r0, _0803655C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
_08036556:
	pop {r0}
	bx r0
	.align 2, 0
_0803655C: .4byte gCurrentSprite

	thumb_func_start BoxLandingInit
BoxLandingInit: @ 0x08036560
	push {lr}
	ldr r1, _08036588 @ =gSubSpriteData1
	ldr r0, _0803658C @ =sMultiSpriteData_342da8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _08036590 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x3a
	strb r1, [r2]
	adds r0, #0x31
	strb r3, [r0]
	ldr r0, _08036594 @ =0x00000266
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036588: .4byte gSubSpriteData1
_0803658C: .4byte sMultiSpriteData_342da8
_08036590: .4byte gCurrentSprite
_08036594: .4byte 0x00000266

	thumb_func_start BoxLanding
BoxLanding: @ 0x08036598
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _080365CC
	ldr r1, _080365B4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _080365B8
	adds r1, #0x24
	movs r0, #0x27
	b _080365CA
	.align 2, 0
_080365B4: .4byte gCurrentSprite
_080365B8:
	subs r0, #1
	strb r0, [r3]
	movs r2, #0x7f
	ands r2, r0
	cmp r2, #0
	bne _080365C6
	strb r2, [r3]
_080365C6:
	adds r1, #0x24
	movs r0, #0x3b
_080365CA:
	strb r0, [r1]
_080365CC:
	pop {r0}
	bx r0

	thumb_func_start BoxFinishedCrawlingInit
BoxFinishedCrawlingInit: @ 0x080365D0
	push {r4, lr}
	ldr r2, _08036600 @ =gSubSpriteData1
	ldr r0, _08036604 @ =sMultiSpriteData_342f38
	str r0, [r2]
	ldr r1, _08036608 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r1
	mov ip, r0
	movs r3, #0
	movs r0, #2
	mov r4, ip
	strb r0, [r4]
	strb r3, [r2, #6]
	strh r3, [r2, #4]
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	movs r0, #0x99
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036600: .4byte gSubSpriteData1
_08036604: .4byte sMultiSpriteData_342f38
_08036608: .4byte gCurrentSprite

	thumb_func_start BoxFinishedCrawling
BoxFinishedCrawling: @ 0x0803660C
	push {r4, r5, lr}
	ldr r4, _0803662C @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #1
	bls _08036630
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _08036662
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	b _08036662
	.align 2, 0
_0803662C: .4byte gCurrentSprite
_08036630:
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08036662
	bl SamusCheckOnCeilingLadder
	cmp r0, #0
	beq _08036648
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08036660
_08036648:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803665A
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08036660
_0803665A:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x19
_08036660:
	strb r0, [r1]
_08036662:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start BoxJumpWarningInit
BoxJumpWarningInit: @ 0x08036668
	push {r4, lr}
	ldr r0, _0803668C @ =gSamusData
	ldrh r4, [r0, #0x16]
	ldr r0, _08036690 @ =gSubSpriteData1
	ldrh r2, [r0, #0xa]
	adds r1, r2, #0
	subs r1, #0x78
	adds r3, r0, #0
	cmp r1, r4
	bge _08036694
	adds r0, r2, #0
	adds r0, #0x78
	cmp r0, r4
	ble _08036694
	bl BoxStoppingToFireBombInit
	b _080366A6
	.align 2, 0
_0803668C: .4byte gSamusData
_08036690: .4byte gSubSpriteData1
_08036694:
	ldr r0, _080366AC @ =sMultiSpriteData_342dc8
	str r0, [r3]
	movs r0, #0
	strb r0, [r3, #6]
	strh r0, [r3, #4]
	ldr r0, _080366B0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3c
	strb r1, [r0]
_080366A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080366AC: .4byte sMultiSpriteData_342dc8
_080366B0: .4byte gCurrentSprite

	thumb_func_start BoxJumpWarning
BoxJumpWarning: @ 0x080366B4
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _080366C6
	ldr r0, _080366CC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3d
	strb r1, [r0]
_080366C6:
	pop {r0}
	bx r0
	.align 2, 0
_080366CC: .4byte gCurrentSprite

	thumb_func_start BoxJumpingInit
BoxJumpingInit: @ 0x080366D0
	push {r4, r5, lr}
	ldr r1, _0803670C @ =gSubSpriteData1
	ldr r0, _08036710 @ =sMultiSpriteData_342d98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08036714 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x3e
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r0, #2
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0803678C
	bl SamusCheckOnCeilingLadder
	cmp r0, #0
	beq _08036718
	bl SpriteUtilMakeSpriteFaceSamusDirection
	b _0803671C
	.align 2, 0
_0803670C: .4byte gSubSpriteData1
_08036710: .4byte sMultiSpriteData_342d98
_08036714: .4byte gCurrentSprite
_08036718:
	bl MakeSpriteFaceAwayFromSamusDirection
_0803671C:
	ldr r4, _08036750 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08036764
	ldr r1, _08036754 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldr r2, _08036758 @ =0xFFFFFED4
	adds r0, r0, r2
	ldrh r1, [r1, #0xa]
	movs r2, #0x96
	lsls r2, r2, #1
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803675C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803678C
	ldrh r1, [r4]
	ldr r0, _08036760 @ =0x0000FDFF
	ands r0, r1
	b _08036782
	.align 2, 0
_08036750: .4byte gCurrentSprite
_08036754: .4byte gSubSpriteData1
_08036758: .4byte 0xFFFFFED4
_0803675C: .4byte gPreviousCollisionCheck
_08036760: .4byte 0x0000FDFF
_08036764:
	ldr r1, _08036798 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldr r2, _0803679C @ =0xFFFFFED4
	adds r0, r0, r2
	ldrh r1, [r1, #0xa]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080367A0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803678C
	ldrh r1, [r4]
	adds r0, r5, #0
	orrs r0, r1
_08036782:
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0x83
	strb r0, [r1]
_0803678C:
	ldr r0, _080367A4 @ =0x00000265
	bl SoundPlay
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08036798: .4byte gSubSpriteData1
_0803679C: .4byte 0xFFFFFED4
_080367A0: .4byte gPreviousCollisionCheck
_080367A4: .4byte 0x00000265

	thumb_func_start BoxJumping
BoxJumping: @ 0x080367A8
	push {r4, r5, lr}
	ldr r4, _080367D0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _080367D4 @ =sBoxJumpingSpeed
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _080367D8 @ =0x00007FFF
	cmp r1, r0
	bne _080367DC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
	b _080367F2
	.align 2, 0
_080367D0: .4byte gCurrentSprite
_080367D4: .4byte sBoxJumpingSpeed
_080367D8: .4byte 0x00007FFF
_080367DC:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldr r1, _080367F8 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r3
	strh r0, [r1, #8]
	movs r0, #0xc
	movs r1, #0x37
	bl BoxXMovement
_080367F2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080367F8: .4byte gSubSpriteData1

	thumb_func_start BoxStoppingToFireBombInit
BoxStoppingToFireBombInit: @ 0x080367FC
	push {r4, lr}
	ldr r2, _0803682C @ =gSubSpriteData1
	ldr r0, _08036830 @ =sMultiSpriteData_342f38
	str r0, [r2]
	ldr r1, _08036834 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r1
	mov ip, r0
	movs r3, #0
	movs r0, #3
	mov r4, ip
	strb r0, [r4]
	strb r3, [r2, #6]
	strh r3, [r2, #4]
	adds r1, #0x24
	movs r0, #0x28
	strb r0, [r1]
	movs r0, #0x99
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803682C: .4byte gSubSpriteData1
_08036830: .4byte sMultiSpriteData_342f38
_08036834: .4byte gCurrentSprite

	thumb_func_start BoxStoppingToFireBomb
BoxStoppingToFireBomb: @ 0x08036838
	push {r4, r5, lr}
	ldr r5, _08036858 @ =gCurrentSprite
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	cmp r0, #1
	bls _0803685C
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _0803686C
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	b _0803686C
	.align 2, 0
_08036858: .4byte gCurrentSprite
_0803685C:
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _0803686C
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
_0803686C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxLoweringToFireBombInit
BoxLoweringToFireBombInit: @ 0x08036874
	push {lr}
	ldr r1, _08036898 @ =gSubSpriteData1
	ldr r0, _0803689C @ =sMultiSpriteData_342fe8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _080368A0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2a
	strb r1, [r0]
	movs r0, #0x9a
	lsls r0, r0, #2
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036898: .4byte gSubSpriteData1
_0803689C: .4byte sMultiSpriteData_342fe8
_080368A0: .4byte gCurrentSprite

	thumb_func_start BoxLoweringToFireBomb
BoxLoweringToFireBomb: @ 0x080368A4
	push {lr}
	bl SpriteUtilCheckEndSubSprite1Anim
	cmp r0, #0
	beq _080368C2
	ldr r0, _080368C8 @ =gCurrentSprite
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x2c
	strb r1, [r0]
	ldr r0, _080368CC @ =gSubSpriteData1
	ldr r1, _080368D0 @ =sMultiSpriteData_343028
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
_080368C2:
	pop {r0}
	bx r0
	.align 2, 0
_080368C8: .4byte gCurrentSprite
_080368CC: .4byte gSubSpriteData1
_080368D0: .4byte sMultiSpriteData_343028

	thumb_func_start BoxFiringBomb
BoxFiringBomb: @ 0x080368D4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	bl SpriteUtilCheckEndSubSprite1Anim
	adds r6, r0, #0
	cmp r6, #0
	beq _08036910
	ldr r0, _08036900 @ =gCurrentSprite
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x2e
	strb r1, [r0]
	ldr r0, _08036904 @ =gSubSpriteData1
	ldr r1, _08036908 @ =sMultiSpriteData_343048
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	ldr r0, _0803690C @ =0x00000269
	bl SoundPlay
	b _0803697A
	.align 2, 0
_08036900: .4byte gCurrentSprite
_08036904: .4byte gSubSpriteData1
_08036908: .4byte sMultiSpriteData_343048
_0803690C: .4byte 0x00000269
_08036910:
	ldr r3, _08036948 @ =gCurrentSprite
	ldrh r5, [r3, #2]
	ldrh r4, [r3, #4]
	ldr r0, _0803694C @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _08036950 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _08036954 @ =0x00020001
	cmp r0, r1
	bne _0803697A
	ldr r0, _08036958 @ =gSamusData
	ldrh r0, [r0, #0x16]
	cmp r4, r0
	bls _0803695C
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r5, #0
	subs r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x71
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0803697A
	.align 2, 0
_08036948: .4byte gCurrentSprite
_0803694C: .4byte gSubSpriteData1
_08036950: .4byte 0x00FFFFFF
_08036954: .4byte 0x00020001
_08036958: .4byte gSamusData
_0803695C:
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r5, #0
	subs r0, #0x64
	str r0, [sp]
	str r4, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #8]
	movs r0, #0x71
	movs r1, #0
	bl SpriteSpawnSecondary
_0803697A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxDoneFiringBomb
BoxDoneFiringBomb: @ 0x08036984
	push {lr}
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08036996
	ldr r0, _0803699C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
_08036996:
	pop {r0}
	bx r0
	.align 2, 0
_0803699C: .4byte gCurrentSprite

	thumb_func_start BoxDefeatedInit
BoxDefeatedInit: @ 0x080369A0
	ldr r1, _080369CC @ =gCurrentSprite
	ldr r0, _080369D0 @ =sFrameData_347bd8
	str r0, [r1, #0x18]
	movs r3, #0
	strb r3, [r1, #0x1c]
	movs r2, #0
	strh r3, [r1, #0x16]
	adds r0, r1, #0
	adds r0, #0x2e
	strb r2, [r0]
	adds r0, #3
	strb r2, [r0]
	adds r1, #0x24
	movs r0, #0x44
	strb r0, [r1]
	ldr r0, _080369D4 @ =gSubSpriteData1
	ldr r1, _080369D8 @ =sMultiSpriteData_342df0
	str r1, [r0]
	strb r2, [r0, #6]
	strh r3, [r0, #4]
	bx lr
	.align 2, 0
_080369CC: .4byte gCurrentSprite
_080369D0: .4byte sFrameData_347bd8
_080369D4: .4byte gSubSpriteData1
_080369D8: .4byte sMultiSpriteData_342df0

	thumb_func_start BoxDefeated
BoxDefeated: @ 0x080369DC
	push {r4, r5, lr}
	ldr r1, _08036A08 @ =gCurrentSprite
	adds r5, r1, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #0
	bne _08036A1C
	ldr r4, _08036A0C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08036A10 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036A14
	strh r1, [r4, #8]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _08036A2E
	.align 2, 0
_08036A08: .4byte gCurrentSprite
_08036A0C: .4byte gSubSpriteData1
_08036A10: .4byte gPreviousVerticalCollisionCheck
_08036A14:
	ldrh r0, [r4, #8]
	adds r0, #0x10
	strh r0, [r4, #8]
	b _08036A2E
_08036A1C:
	adds r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bls _08036A2E
	adds r1, #0x24
	movs r0, #0x45
	strb r0, [r1]
_08036A2E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start BoxMovingToFinalJumpInit
BoxMovingToFinalJumpInit: @ 0x08036A34
	push {r4, lr}
	ldr r4, _08036A80 @ =gCurrentSprite
	ldr r0, _08036A84 @ =sFrameData_347bd8
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	movs r0, #0x77
	bl FindPrimarySprite
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08036A88 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r1, [r1, #4]
	strh r1, [r4, #8]
	adds r2, r4, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r2, _08036A8C @ =gSubSpriteData1
	ldrh r0, [r2, #0xa]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r0, r1
	bls _08036A98
	ldr r0, _08036A90 @ =sMultiSpriteData_342e18
	str r0, [r2]
	ldrh r1, [r4]
	ldr r0, _08036A94 @ =0x0000FDFF
	ands r0, r1
	b _08036AA6
	.align 2, 0
_08036A80: .4byte gCurrentSprite
_08036A84: .4byte sFrameData_347bd8
_08036A88: .4byte gSpriteData
_08036A8C: .4byte gSubSpriteData1
_08036A90: .4byte sMultiSpriteData_342e18
_08036A94: .4byte 0x0000FDFF
_08036A98:
	ldr r0, _08036AB8 @ =sMultiSpriteData_342ea8
	str r0, [r2]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
_08036AA6:
	strh r0, [r4]
	ldr r1, _08036ABC @ =gSubSpriteData1
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036AB8: .4byte sMultiSpriteData_342ea8
_08036ABC: .4byte gSubSpriteData1

	thumb_func_start BoxMovingToFinalJump
BoxMovingToFinalJump: @ 0x08036AC0
	push {r4, r5, lr}
	ldr r0, _08036AFC @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _08036B00 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _08036B04 @ =0x00010003
	cmp r0, r1
	bne _08036AD6
	ldr r0, _08036B08 @ =0x00000262
	bl SoundPlay
_08036AD6:
	ldr r0, _08036B0C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	ldr r5, _08036B10 @ =gCurrentSprite
	cmp r0, #0
	bne _08036B1A
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08036B14
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #0xb
	strb r0, [r1]
	b _08036B1A
	.align 2, 0
_08036AFC: .4byte gSubSpriteData1
_08036B00: .4byte 0x00FFFFFF
_08036B04: .4byte 0x00010003
_08036B08: .4byte 0x00000262
_08036B0C: .4byte gFrameCounter8Bit
_08036B10: .4byte gCurrentSprite
_08036B14:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
_08036B1A:
	ldr r4, _08036B38 @ =gSubSpriteData1
	ldrh r3, [r4, #0xa]
	ldr r0, _08036B3C @ =0x0000FFF8
	ldrh r2, [r5, #8]
	adds r1, r0, #0
	ands r1, r3
	ands r0, r2
	cmp r1, r0
	bne _08036B40
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x47
	strb r0, [r1]
	b _08036B54
	.align 2, 0
_08036B38: .4byte gSubSpriteData1
_08036B3C: .4byte 0x0000FFF8
_08036B40:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036B50
	adds r0, r3, #2
	b _08036B52
_08036B50:
	subs r0, r3, #2
_08036B52:
	strh r0, [r4, #0xa]
_08036B54:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxWaitingForFinalJumpInit
BoxWaitingForFinalJumpInit: @ 0x08036B5C
	push {lr}
	ldr r1, _08036B7C @ =gSubSpriteData1
	ldr r0, _08036B80 @ =sMultiSpriteData_342df0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08036B84 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x48
	strb r1, [r0]
	ldr r0, _08036B88 @ =0x00000276
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036B7C: .4byte gSubSpriteData1
_08036B80: .4byte sMultiSpriteData_342df0
_08036B84: .4byte gCurrentSprite
_08036B88: .4byte 0x00000276

	thumb_func_start BoxWaitingForFinalJump
BoxWaitingForFinalJump: @ 0x08036B8C
	push {r4, lr}
	ldr r0, _08036BB4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	ldr r4, _08036BB8 @ =gCurrentSprite
	cmp r0, #0
	bne _08036BC2
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08036BBC
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0xb
	strb r0, [r1]
	b _08036BC2
	.align 2, 0
_08036BB4: .4byte gFrameCounter8Bit
_08036BB8: .4byte gCurrentSprite
_08036BBC:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_08036BC2:
	ldrh r0, [r4, #4]
	lsrs r0, r0, #2
	ldr r1, _08036BF0 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08036BF4 @ =0xFFE70000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xbe
	bhi _08036BEA
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08036BEA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
_08036BEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036BF0: .4byte gBg1XPosition
_08036BF4: .4byte 0xFFE70000

	thumb_func_start BoxCrouchingForFinalJumpInit
BoxCrouchingForFinalJumpInit: @ 0x08036BF8
	ldr r1, _08036C10 @ =gSubSpriteData1
	ldr r0, _08036C14 @ =sMultiSpriteData_342dc8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08036C18 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x4a
	strb r1, [r0]
	bx lr
	.align 2, 0
_08036C10: .4byte gSubSpriteData1
_08036C14: .4byte sMultiSpriteData_342dc8
_08036C18: .4byte gCurrentSprite

	thumb_func_start BoxCrouchingForFinalJump
BoxCrouchingForFinalJump: @ 0x08036C1C
	push {lr}
	ldr r0, _08036C40 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08036C4E
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08036C48
	ldr r0, _08036C44 @ =gCurrentSprite
	adds r0, #0x20
	movs r1, #0xb
	b _08036C4C
	.align 2, 0
_08036C40: .4byte gFrameCounter8Bit
_08036C44: .4byte gCurrentSprite
_08036C48:
	ldr r0, _08036C68 @ =gCurrentSprite
	adds r0, #0x20
_08036C4C:
	strb r1, [r0]
_08036C4E:
	bl SpriteUtilCheckNearEndSubSprite1Anim
	cmp r0, #0
	beq _08036C62
	ldr r0, _08036C68 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x4d
	strb r1, [r0]
	bl unk_36c4
_08036C62:
	pop {r0}
	bx r0
	.align 2, 0
_08036C68: .4byte gCurrentSprite

	thumb_func_start BoxFinalJumpInit
BoxFinalJumpInit: @ 0x08036C6C
	push {lr}
	ldr r1, _08036C94 @ =gSubSpriteData1
	ldr r0, _08036C98 @ =sMultiSpriteData_342d98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08036C9C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x4e
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08036CA0 @ =0x00000277
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08036C94: .4byte gSubSpriteData1
_08036C98: .4byte sMultiSpriteData_342d98
_08036C9C: .4byte gCurrentSprite
_08036CA0: .4byte 0x00000277

	thumb_func_start BoxFinalJump
BoxFinalJump: @ 0x08036CA4
	push {r4, lr}
	ldr r0, _08036CCC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	ldr r4, _08036CD0 @ =gCurrentSprite
	cmp r0, #0
	bne _08036CDA
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08036CD4
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0xb
	strb r0, [r1]
	b _08036CDA
	.align 2, 0
_08036CCC: .4byte gFrameCounter8Bit
_08036CD0: .4byte gCurrentSprite
_08036CD4:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_08036CDA:
	ldr r0, _08036D14 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	subs r1, #0x28
	strh r1, [r0, #8]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08036D0C
	ldr r2, _08036D18 @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	strh r3, [r4]
_08036D0C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08036D14: .4byte gSubSpriteData1
_08036D18: .4byte gSpriteData

	thumb_func_start BoxCrawlingInit
BoxCrawlingInit: @ 0x08036D1C
	push {lr}
	ldr r2, _08036D34 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08036D40
	ldr r1, _08036D38 @ =gSubSpriteData1
	ldr r0, _08036D3C @ =sMultiSpriteData_342ea8
	b _08036D44
	.align 2, 0
_08036D34: .4byte gCurrentSprite
_08036D38: .4byte gSubSpriteData1
_08036D3C: .4byte sMultiSpriteData_342ea8
_08036D40:
	ldr r1, _08036D58 @ =gSubSpriteData1
	ldr r0, _08036D5C @ =sMultiSpriteData_342e18
_08036D44:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08036D58: .4byte gSubSpriteData1
_08036D5C: .4byte sMultiSpriteData_342e18

	thumb_func_start BoxCrawling
BoxCrawling: @ 0x08036D60
	push {lr}
	movs r0, #1
	movs r1, #7
	bl BoxXMovement
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxPartSetBoxWorkVar2
BoxPartSetBoxWorkVar2: @ 0x08036D70
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r2, _08036D94 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, r3
	bhs _08036D8E
	strb r3, [r1]
_08036D8E:
	pop {r0}
	bx r0
	.align 2, 0
_08036D94: .4byte gSpriteData

	thumb_func_start BoxPartCenterSetImmunity
BoxPartCenterSetImmunity: @ 0x08036D98
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08036DC0 @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x29
	adds r3, r1, #0
	cmp r0, #0x19
	bhi _08036E64
	lsls r0, r0, #2
	ldr r1, _08036DC4 @ =_08036DC8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036DC0: .4byte gSpriteData
_08036DC4: .4byte _08036DC8
_08036DC8: @ jump table
	.4byte _08036E30 @ case 0
	.4byte _08036E30 @ case 1
	.4byte _08036E64 @ case 2
	.4byte _08036E30 @ case 3
	.4byte _08036E64 @ case 4
	.4byte _08036E64 @ case 5
	.4byte _08036E64 @ case 6
	.4byte _08036E64 @ case 7
	.4byte _08036E64 @ case 8
	.4byte _08036E64 @ case 9
	.4byte _08036E64 @ case 10
	.4byte _08036E64 @ case 11
	.4byte _08036E64 @ case 12
	.4byte _08036E64 @ case 13
	.4byte _08036E64 @ case 14
	.4byte _08036E64 @ case 15
	.4byte _08036E64 @ case 16
	.4byte _08036E64 @ case 17
	.4byte _08036E64 @ case 18
	.4byte _08036E64 @ case 19
	.4byte _08036E64 @ case 20
	.4byte _08036E64 @ case 21
	.4byte _08036E54 @ case 22
	.4byte _08036E54 @ case 23
	.4byte _08036E54 @ case 24
	.4byte _08036E54 @ case 25
_08036E30:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08036E64
	ldr r0, _08036E50 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _08036E6E
	.align 2, 0
_08036E50: .4byte gCurrentSprite
_08036E54:
	ldr r0, _08036E60 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _08036E6E
	.align 2, 0
_08036E60: .4byte gCurrentSprite
_08036E64:
	ldr r0, _08036E74 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0xbf
	ands r1, r2
_08036E6E:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08036E74: .4byte gCurrentSprite

	thumb_func_start BoxPartRemoveIgnoreProjectiles
BoxPartRemoveIgnoreProjectiles: @ 0x08036E78
	ldr r2, _08036E84 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08036E88 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08036E84: .4byte gCurrentSprite
_08036E88: .4byte 0x00007FFF

	thumb_func_start BoxPartInit
BoxPartInit: @ 0x08036E8C
	push {lr}
	ldr r2, _08036EC4 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08036EC8 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
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
	subs r1, #5
	movs r0, #2
	strb r0, [r1]
	ldrb r0, [r2, #0x1e]
	adds r3, r2, #0
	cmp r0, #6
	bhi _08036ECC
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xb
	b _08036ED2
	.align 2, 0
_08036EC4: .4byte gCurrentSprite
_08036EC8: .4byte 0x0000FFFB
_08036ECC:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xd
_08036ED2:
	strb r0, [r1]
	ldrb r0, [r3, #0x1e]
	cmp r0, #0xb
	bls _08036EDC
	b _08036FE0
_08036EDC:
	lsls r0, r0, #2
	ldr r1, _08036EE8 @ =_08036EEC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08036EE8: .4byte _08036EEC
_08036EEC: @ jump table
	.4byte _08036F1C @ case 0
	.4byte _08036FA8 @ case 1
	.4byte _08036F1C @ case 2
	.4byte _08036FA8 @ case 3
	.4byte _08036FA8 @ case 4
	.4byte _08036FA8 @ case 5
	.4byte _08036F40 @ case 6
	.4byte _08036FE0 @ case 7
	.4byte _08036FA8 @ case 8
	.4byte _08036F68 @ case 9
	.4byte _08036FA8 @ case 10
	.4byte _08036FA8 @ case 11
_08036F1C:
	ldr r0, _08036F38 @ =0x0000FFB8
	strh r0, [r3, #0xa]
	movs r0, #0x48
	strh r0, [r3, #0xc]
	ldr r0, _08036F3C @ =0x0000FFE0
	strh r0, [r3, #0xe]
	movs r0, #0x20
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	subs r1, #0x10
	b _08036F7E
	.align 2, 0
_08036F38: .4byte 0x0000FFB8
_08036F3C: .4byte 0x0000FFE0
_08036F40:
	ldr r0, _08036F60 @ =0x0000FFD0
	strh r0, [r3, #0xa]
	movs r0, #0x40
	strh r0, [r3, #0xc]
	ldr r0, _08036F64 @ =0x0000FFE0
	strh r0, [r3, #0xe]
	movs r0, #0x20
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #2
	strb r0, [r1]
	b _08036FC8
	.align 2, 0
_08036F60: .4byte 0x0000FFD0
_08036F64: .4byte 0x0000FFE0
_08036F68:
	ldr r0, _08036F9C @ =0x0000FFE0
	strh r0, [r3, #0xa]
	movs r0, #0x20
	strh r0, [r3, #0xc]
	ldr r0, _08036FA0 @ =0x0000FFC0
	strh r0, [r3, #0xe]
	movs r0, #0x40
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
_08036F7E:
	strb r0, [r1]
	ldr r1, _08036FA4 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	b _08036FE4
	.align 2, 0
_08036F9C: .4byte 0x0000FFE0
_08036FA0: .4byte 0x0000FFC0
_08036FA4: .4byte sSecondarySpriteStats
_08036FA8:
	movs r2, #0
	ldr r1, _08036FD8 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
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
_08036FC8:
	ldr r1, _08036FDC @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	b _08036FE4
	.align 2, 0
_08036FD8: .4byte 0x0000FFFC
_08036FDC: .4byte sSecondarySpriteStats
_08036FE0:
	movs r0, #0
	strh r0, [r3]
_08036FE4:
	bl BoxSyncSubSprites
	pop {r0}
	bx r0

	thumb_func_start BoxPartFrontLeftLeg
BoxPartFrontLeftLeg: @ 0x08036FEC
	push {r4, r5, r6, r7, lr}
	ldr r5, _08037010 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r6, [r0]
	ldr r0, _08037014 @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r2, r1, r0
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08037018
	strh r1, [r5]
	b _0803709A
	.align 2, 0
_08037010: .4byte gCurrentSprite
_08037014: .4byte gSpriteData
_08037018:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0803709A
	ldrh r3, [r5, #2]
	ldrh r1, [r5, #4]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x44
	bne _0803704E
	ldr r0, [r5, #0x18]
	ldr r7, _08037084 @ =sFrameData_3479f0
	cmp r0, r7
	beq _0803704E
	adds r0, r3, #0
	adds r0, #0x3c
	movs r2, #0x30
	bl ParticleSet
	str r7, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
_0803704E:
	ldr r1, _08037088 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803709A
	ldr r0, _0803708C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803709A
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08037094
	ldr r0, _08037090 @ =gCurrentSprite
	adds r0, #0x20
	movs r1, #0xb
	b _08037098
	.align 2, 0
_08037084: .4byte sFrameData_3479f0
_08037088: .4byte gSpriteData
_0803708C: .4byte gFrameCounter8Bit
_08037090: .4byte gCurrentSprite
_08037094:
	ldr r0, _080370A0 @ =gCurrentSprite
	adds r0, #0x20
_08037098:
	strb r1, [r0]
_0803709A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080370A0: .4byte gCurrentSprite

	thumb_func_start BoxPartFrontRightLeg
BoxPartFrontRightLeg: @ 0x080370A4
	push {r4, r5, r6, r7, lr}
	ldr r5, _080370C8 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r6, [r0]
	ldr r0, _080370CC @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r2, r1, r0
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080370D0
	strh r1, [r5]
	b _08037152
	.align 2, 0
_080370C8: .4byte gCurrentSprite
_080370CC: .4byte gSpriteData
_080370D0:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _08037152
	ldrh r3, [r5, #2]
	ldrh r1, [r5, #4]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x44
	bne _08037106
	ldr r0, [r5, #0x18]
	ldr r7, _0803713C @ =sFrameData_347ae8
	cmp r0, r7
	beq _08037106
	adds r0, r3, #0
	adds r0, #0x3c
	movs r2, #0x30
	bl ParticleSet
	str r7, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
_08037106:
	ldr r1, _08037140 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08037152
	ldr r0, _08037144 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _08037152
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0803714C
	ldr r0, _08037148 @ =gCurrentSprite
	adds r0, #0x20
	movs r1, #0xb
	b _08037150
	.align 2, 0
_0803713C: .4byte sFrameData_347ae8
_08037140: .4byte gSpriteData
_08037144: .4byte gFrameCounter8Bit
_08037148: .4byte gCurrentSprite
_0803714C:
	ldr r0, _08037158 @ =gCurrentSprite
	adds r0, #0x20
_08037150:
	strb r1, [r0]
_08037152:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037158: .4byte gCurrentSprite

	thumb_func_start BoxPartCenter
BoxPartCenter: @ 0x0803715C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	ldr r4, _0803718C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, _08037190 @ =gSpriteData
	mov r2, sb
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	mov r8, r1
	ldrh r0, [r1]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08037194
	strh r1, [r4]
	b _080372A0
	.align 2, 0
_0803718C: .4byte gCurrentSprite
_08037190: .4byte gSpriteData
_08037194:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080371A6
	b _080372A0
_080371A6:
	mov r7, r8
	adds r7, #0x2d
	ldrb r1, [r7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080371E0
	ldr r0, _080371D4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080372A0
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080371D8
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0xc
	strb r0, [r1]
	b _080372A0
	.align 2, 0
_080371D4: .4byte gFrameCounter8Bit
_080371D8:
	adds r0, r4, #0
	adds r0, #0x20
	strb r6, [r0]
	b _080372A0
_080371E0:
	ldr r1, _08037220 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r5, [r0]
	ldrh r2, [r4, #2]
	ldrh r3, [r4, #4]
	mov r0, sb
	str r2, [sp]
	str r3, [sp, #4]
	bl BoxPartCenterSetImmunity
	ldrh r1, [r4, #0x14]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	cmp r1, #0
	bne _08037224
	ldrb r1, [r7]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r7]
	adds r0, r2, #0
	adds r0, #0x32
	adds r1, r3, #0
	movs r2, #0x2f
	bl ParticleSet
	mov r1, r8
	adds r1, #0x24
	movs r0, #0x43
	strb r0, [r1]
	b _08037282
	.align 2, 0
_08037220: .4byte sSecondarySpriteStats
_08037224:
	lsrs r0, r5, #2
	cmp r1, r0
	bhs _08037234
	ldr r0, [r4, #0x18]
	ldr r1, _08037230 @ =sFrameData_347bc8
	b _0803723E
	.align 2, 0
_08037230: .4byte sFrameData_347bc8
_08037234:
	lsrs r0, r5, #1
	cmp r1, r0
	bhs _0803725C
	ldr r0, [r4, #0x18]
	ldr r1, _08037258 @ =sFrameData_347bb8
_0803723E:
	cmp r0, r1
	beq _08037282
	str r1, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r2, #0
	adds r0, #0x24
	adds r1, r3, #0
	movs r2, #0x30
	bl ParticleSet
	b _08037282
	.align 2, 0
_08037258: .4byte sFrameData_347bb8
_0803725C:
	ldrh r1, [r4, #0x14]
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r0, r0, #2
	cmp r1, r0
	bge _08037282
	ldr r0, [r4, #0x18]
	ldr r1, _080372B0 @ =sFrameData_347ba8
	cmp r0, r1
	beq _08037282
	str r1, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r2, #0
	adds r0, #0x24
	adds r1, r3, #0
	movs r2, #0x30
	bl ParticleSet
_08037282:
	ldr r0, _080372B4 @ =gCurrentSprite
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _080372A0
	mov r0, sb
	movs r1, #2
	bl BoxPartSetBoxWorkVar2
	movs r0, #0x9e
	lsls r0, r0, #2
	bl SoundPlay
_080372A0:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080372B0: .4byte sFrameData_347ba8
_080372B4: .4byte gCurrentSprite

	thumb_func_start BoxPartCenterBottom
BoxPartCenterBottom: @ 0x080372B8
	push {lr}
	ldr r3, _080372DC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _080372E0 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080372E4
	strh r1, [r3]
	b _0803748C
	.align 2, 0
_080372DC: .4byte gCurrentSprite
_080372E0: .4byte gSpriteData
_080372E4:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080372F2
	b _0803748C
_080372F2:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #8
	cmp r0, #0x46
	bls _08037300
	b _0803747C
_08037300:
	lsls r0, r0, #2
	ldr r1, _0803730C @ =_08037310
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803730C: .4byte _08037310
_08037310: @ jump table
	.4byte _0803742C @ case 0
	.4byte _0803747C @ case 1
	.4byte _0803747C @ case 2
	.4byte _0803747C @ case 3
	.4byte _0803747C @ case 4
	.4byte _0803747C @ case 5
	.4byte _0803747C @ case 6
	.4byte _0803747C @ case 7
	.4byte _0803747C @ case 8
	.4byte _0803747C @ case 9
	.4byte _0803747C @ case 10
	.4byte _0803747C @ case 11
	.4byte _0803747C @ case 12
	.4byte _0803747C @ case 13
	.4byte _0803747C @ case 14
	.4byte _0803747C @ case 15
	.4byte _0803742C @ case 16
	.4byte _0803747C @ case 17
	.4byte _0803747C @ case 18
	.4byte _0803747C @ case 19
	.4byte _0803747C @ case 20
	.4byte _0803747C @ case 21
	.4byte _0803747C @ case 22
	.4byte _0803747C @ case 23
	.4byte _0803747C @ case 24
	.4byte _0803747C @ case 25
	.4byte _0803747C @ case 26
	.4byte _0803747C @ case 27
	.4byte _0803747C @ case 28
	.4byte _0803747C @ case 29
	.4byte _0803747C @ case 30
	.4byte _0803747C @ case 31
	.4byte _0803747C @ case 32
	.4byte _0803747C @ case 33
	.4byte _0803747C @ case 34
	.4byte _0803747C @ case 35
	.4byte _0803747C @ case 36
	.4byte _0803747C @ case 37
	.4byte _0803747C @ case 38
	.4byte _0803747C @ case 39
	.4byte _0803747C @ case 40
	.4byte _0803747C @ case 41
	.4byte _0803747C @ case 42
	.4byte _0803747C @ case 43
	.4byte _0803747C @ case 44
	.4byte _0803747C @ case 45
	.4byte _0803747C @ case 46
	.4byte _0803747C @ case 47
	.4byte _0803747C @ case 48
	.4byte _0803747C @ case 49
	.4byte _0803747C @ case 50
	.4byte _0803747C @ case 51
	.4byte _0803742C @ case 52
	.4byte _0803747C @ case 53
	.4byte _0803747C @ case 54
	.4byte _0803747C @ case 55
	.4byte _0803747C @ case 56
	.4byte _0803747C @ case 57
	.4byte _0803747C @ case 58
	.4byte _0803747C @ case 59
	.4byte _08037438 @ case 60
	.4byte _08037438 @ case 61
	.4byte _08037438 @ case 62
	.4byte _08037438 @ case 63
	.4byte _08037438 @ case 64
	.4byte _08037438 @ case 65
	.4byte _08037438 @ case 66
	.4byte _0803747C @ case 67
	.4byte _0803747C @ case 68
	.4byte _08037438 @ case 69
	.4byte _08037438 @ case 70
_0803742C:
	ldr r0, [r3, #0x18]
	ldr r1, _08037434 @ =sFrameData_347ca8
	b _08037480
	.align 2, 0
_08037434: .4byte sFrameData_347ca8
_08037438:
	ldr r0, [r3, #0x18]
	ldr r1, _0803746C @ =sFrameData_347ca8
	cmp r0, r1
	beq _08037448
	str r1, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
_08037448:
	ldr r0, _08037470 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803748C
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08037474
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #0xc
	strb r0, [r1]
	b _0803748C
	.align 2, 0
_0803746C: .4byte sFrameData_347ca8
_08037470: .4byte gFrameCounter8Bit
_08037474:
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	b _0803748C
_0803747C:
	ldr r0, [r3, #0x18]
	ldr r1, _08037490 @ =sFrameData_347c98
_08037480:
	cmp r0, r1
	beq _0803748C
	str r1, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
_0803748C:
	pop {r0}
	bx r0
	.align 2, 0
_08037490: .4byte sFrameData_347c98

	thumb_func_start BoxPartDefault
BoxPartDefault: @ 0x08037494
	push {lr}
	ldr r3, _080374B8 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _080374BC @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080374C0
	strh r1, [r3]
	b _0803750E
	.align 2, 0
_080374B8: .4byte gCurrentSprite
_080374BC: .4byte gSpriteData
_080374C0:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803750E
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x44
	blt _0803750E
	cmp r0, #0x4a
	ble _080374E2
	cmp r0, #0x4e
	bgt _0803750E
	cmp r0, #0x4d
	blt _0803750E
_080374E2:
	ldr r0, _08037504 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803750E
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08037508
	adds r1, r3, #0
	adds r1, #0x20
	movs r0, #0xd
	strb r0, [r1]
	b _0803750E
	.align 2, 0
_08037504: .4byte gFrameCounter8Bit
_08037508:
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
_0803750E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxMissileInit
BoxMissileInit: @ 0x08037514
	push {r4, lr}
	ldr r0, _0803759C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _080375A0 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	ldr r0, _080375A4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _080375A8 @ =0x0000FFF8
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #8
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _080375AC @ =sFrameData_347d68
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r1, _080375B0 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r1, ip
	adds r1, #0x2b
	movs r0, #0xc0
	strb r0, [r1]
	adds r0, #0x40
	strh r0, [r4, #0x12]
	adds r1, #3
	movs r0, #0x24
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r4, #6]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080375B4 @ =0x0000026B
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803759C: .4byte gCurrentSprite
_080375A0: .4byte 0x0000FFFB
_080375A4: .4byte gIoRegisters
_080375A8: .4byte 0x0000FFF8
_080375AC: .4byte sFrameData_347d68
_080375B0: .4byte sSecondarySpriteStats
_080375B4: .4byte 0x0000026B

	thumb_func_start BoxMissileSpawning
BoxMissileSpawning: @ 0x080375B8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r5, _08037638 @ =gCurrentSprite
	ldrh r0, [r5, #0x14]
	cmp r0, #0
	bne _080375D0
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_080375D0:
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r1, [r6]
	lsrs r1, r1, #1
	ldrh r0, [r5, #2]
	subs r0, r0, r1
	movs r2, #0
	mov r8, r2
	strh r0, [r5, #2]
	cmp r1, #2
	bhi _08037600
	adds r7, r5, #0
	adds r7, #0x2b
	ldrb r0, [r7]
	ldr r2, _0803763C @ =gSamusData
	ldrh r1, [r2, #0x18]
	subs r1, #0x40
	ldrh r2, [r2, #0x16]
	ldrh r3, [r5, #2]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl RotateSpriteTowardsSamus
	strb r0, [r7]
_08037600:
	ldrb r0, [r6]
	subs r0, #2
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0803762C
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	mov r2, r8
	strb r2, [r6]
	adds r0, #1
	strb r1, [r0]
_0803762C:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037638: .4byte gCurrentSprite
_0803763C: .4byte gSamusData

	thumb_func_start BoxMissileMoving
BoxMissileMoving: @ 0x08037640
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r1, _080376C0 @ =gCurrentSprite
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080376B2
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	beq _080376B2
	ldrb r1, [r1, #0x1e]
	movs r2, #8
	cmp r1, #3
	beq _0803766E
	movs r2, #0x28
	cmp r1, #2
	beq _0803766E
	movs r2, #0x68
	cmp r1, #1
	bne _0803766E
	movs r2, #0x48
_0803766E:
	ldr r4, _080376C4 @ =gSamusData
	ldrh r0, [r4, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0x18
	movs r3, #0x28
	bl MoveSpriteTowardsTarget
	ldr r5, _080376C0 @ =gCurrentSprite
	adds r6, r5, #0
	adds r6, #0x2b
	ldrb r0, [r6]
	ldrh r1, [r4, #0x18]
	subs r1, #0x40
	ldrh r2, [r4, #0x16]
	ldrh r3, [r5, #2]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl RotateSpriteTowardsSamus
	strb r0, [r6]
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080376C8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080376B8
	adds r1, r5, #0
_080376B2:
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_080376B8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080376C0: .4byte gCurrentSprite
_080376C4: .4byte gSamusData
_080376C8: .4byte gPreviousCollisionCheck

	thumb_func_start BoxMissileExploding
BoxMissileExploding: @ 0x080376CC
	push {lr}
	ldr r1, _080376EC @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x25
	bl ParticleSet
	movs r0, #0x9b
	lsls r0, r0, #2
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_080376EC: .4byte gCurrentSprite

	thumb_func_start BoxBombInit
BoxBombInit: @ 0x080376F0
	push {r4, lr}
	ldr r0, _08037780 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08037784 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08037788 @ =0x0000FFE4
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #0x1c
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _0803778C @ =sFrameData_347e58
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r1, _08037790 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r0, ip
	adds r0, #0x2b
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #7
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r2, [r0]
	subs r0, #0xd
	movs r3, #2
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #0x9c
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037780: .4byte gCurrentSprite
_08037784: .4byte 0x0000FFFB
_08037788: .4byte 0x0000FFE4
_0803778C: .4byte sFrameData_347e58
_08037790: .4byte sSecondarySpriteStats

	thumb_func_start BoxBombMoving
BoxBombMoving: @ 0x08037794
	push {r4, r5, r6, lr}
	ldr r1, _080377A8 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	adds r5, r1, #0
	cmp r0, #0
	bne _080377AC
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _08037958
	.align 2, 0
_080377A8: .4byte gCurrentSprite
_080377AC:
	movs r0, #0x2f
	adds r0, r0, r5
	mov ip, r0
	ldrb r6, [r0]
	adds r0, r6, #0
	cmp r0, #0
	bne _080377FC
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r0, _080377DC @ =sBoxBombLaunchingSpeed
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r4, [r1]
	ldr r0, _080377E0 @ =0x00007FFF
	cmp r4, r0
	bne _080377E4
	movs r4, #0
	adds r0, r6, #1
	mov r1, ip
	strb r0, [r1]
	strb r4, [r3]
	b _080377E8
	.align 2, 0
_080377DC: .4byte sBoxBombLaunchingSpeed
_080377E0: .4byte 0x00007FFF
_080377E4:
	adds r0, r2, #1
	strb r0, [r3]
_080377E8:
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #3
	bne _080378D4
	adds r1, r5, #0
	adds r1, #0x30
	movs r0, #7
	strb r0, [r1]
	b _080378D4
_080377FC:
	cmp r0, #2
	bne _08037828
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r0, _08037820 @ =sBoxBombFirstBounceSpeed
_08037808:
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r4, [r1]
	ldr r0, _08037824 @ =0x00007FFF
	cmp r4, r0
	bne _0803783C
	movs r4, #0
	adds r0, r6, #1
	mov r1, ip
	strb r0, [r1]
	strb r4, [r3]
	b _080378D4
	.align 2, 0
_08037820: .4byte sBoxBombFirstBounceSpeed
_08037824: .4byte 0x00007FFF
_08037828:
	cmp r0, #4
	bne _08037842
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r0, _08037838 @ =sBoxBombSecondBounceSpeed
	b _08037808
	.align 2, 0
_08037838: .4byte sBoxBombSecondBounceSpeed
_0803783C:
	adds r0, r2, #1
	strb r0, [r3]
	b _080378D4
_08037842:
	cmp r0, #6
	bne _08037858
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	b _080378DA
_08037858:
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r1, _08037878 @ =sBoxBombFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r0, _0803787C @ =0x00007FFF
	cmp r4, r0
	bne _08037880
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	b _08037884
	.align 2, 0
_08037878: .4byte sBoxBombFallingSpeed
_0803787C: .4byte 0x00007FFF
_08037880:
	adds r0, r2, #1
	strb r0, [r3]
_08037884:
	ldr r5, _080378C8 @ =gCurrentSprite
	ldrh r0, [r5, #2]
	adds r0, #0x20
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _080378CC @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080378D4
	adds r0, r1, #0
	subs r0, #0x20
	strh r0, [r5, #2]
	adds r4, r5, #0
	adds r4, #0x2f
	ldrb r0, [r4]
	cmp r0, #1
	bne _080378B0
	ldr r0, _080378D0 @ =0x00000271
	bl SoundPlay
_080378B0:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	subs r0, #2
	strb r0, [r1]
	b _080378DA
	.align 2, 0
_080378C8: .4byte gCurrentSprite
_080378CC: .4byte gPreviousVerticalCollisionCheck
_080378D0: .4byte 0x00000271
_080378D4:
	ldrh r0, [r5, #2]
	adds r0, r4, r0
	strh r0, [r5, #2]
_080378DA:
	adds r4, r5, #0
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08037924
	adds r2, r4, #0
	adds r2, #0x2b
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r0, #6
	subs r0, r0, r1
	lsls r0, r0, #3
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037920 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037958
	adds r1, r4, #0
	adds r1, #0x30
	ldrh r0, [r4, #4]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #4]
	b _08037958
	.align 2, 0
_08037920: .4byte gPreviousCollisionCheck
_08037924:
	adds r2, r5, #0
	adds r2, #0x2b
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	movs r1, #6
	subs r1, r1, r0
	lsls r1, r1, #3
	ldrb r0, [r2]
	subs r0, r0, r1
	strb r0, [r2]
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037960 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037958
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	ldrh r0, [r5, #4]
	subs r0, r0, r1
	strh r0, [r5, #4]
_08037958:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037960: .4byte gPreviousCollisionCheck

	thumb_func_start BoxBombLanded
BoxBombLanded: @ 0x08037964
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, _0803797C @ =gCurrentSprite
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _08037980
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _080379DC
	.align 2, 0
_0803797C: .4byte gCurrentSprite
_08037980:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _080379DC
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x72
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #8]
	movs r0, #0x72
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x22
	bl ParticleSet
	strh r5, [r4]
	ldr r0, _080379E4 @ =0x00000272
	bl SoundPlay
_080379DC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080379E4: .4byte 0x00000272

	thumb_func_start BoxBombExploding
BoxBombExploding: @ 0x080379E8
	push {r4, lr}
	ldr r4, _08037A08 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	movs r2, #0x32
	bl ParticleSet
	movs r0, #0
	strh r0, [r4]
	ldr r0, _08037A0C @ =0x00000273
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037A08: .4byte gCurrentSprite
_08037A0C: .4byte 0x00000273

	thumb_func_start BoxFireInit
BoxFireInit: @ 0x08037A10
	push {r4, lr}
	ldr r0, _08037A6C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08037A70 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r2, #0
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x27
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, _08037A74 @ =0x0000FFE0
	mov r4, ip
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	adds r0, #0x10
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	ldr r0, _08037A78 @ =sFrameData_347e80
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldr r1, _08037A7C @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r0, ip
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037A6C: .4byte gCurrentSprite
_08037A70: .4byte 0x0000FFFB
_08037A74: .4byte 0x0000FFE0
_08037A78: .4byte sFrameData_347e80
_08037A7C: .4byte sSecondarySpriteStats

	thumb_func_start BoxFireMovingHigh
BoxFireMovingHigh: @ 0x08037A80
	push {r4, r5, r6, lr}
	ldr r0, _08037A98 @ =gCurrentSprite
	ldrh r0, [r0, #0x16]
	cmp r0, #0x23
	bls _08037A8C
	b _08037BB4
_08037A8C:
	lsls r0, r0, #2
	ldr r1, _08037A9C @ =_08037AA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08037A98: .4byte gCurrentSprite
_08037A9C: .4byte _08037AA0
_08037AA0: @ jump table
	.4byte _08037B30 @ case 0
	.4byte _08037B30 @ case 1
	.4byte _08037B30 @ case 2
	.4byte _08037B38 @ case 3
	.4byte _08037B40 @ case 4
	.4byte _08037BA4 @ case 5
	.4byte _08037B5C @ case 6
	.4byte _08037B94 @ case 7
	.4byte _08037B84 @ case 8
	.4byte _08037BB4 @ case 9
	.4byte _08037BB4 @ case 10
	.4byte _08037BB4 @ case 11
	.4byte _08037BB4 @ case 12
	.4byte _08037BB4 @ case 13
	.4byte _08037BB4 @ case 14
	.4byte _08037BB4 @ case 15
	.4byte _08037BB4 @ case 16
	.4byte _08037BB4 @ case 17
	.4byte _08037BB4 @ case 18
	.4byte _08037BB4 @ case 19
	.4byte _08037BB4 @ case 20
	.4byte _08037BB4 @ case 21
	.4byte _08037BB4 @ case 22
	.4byte _08037BB4 @ case 23
	.4byte _08037BB4 @ case 24
	.4byte _08037BB4 @ case 25
	.4byte _08037BB4 @ case 26
	.4byte _08037B64 @ case 27
	.4byte _08037B72 @ case 28
	.4byte _08037B84 @ case 29
	.4byte _08037B84 @ case 30
	.4byte _08037B8C @ case 31
	.4byte _08037B94 @ case 32
	.4byte _08037B9A @ case 33
	.4byte _08037BA4 @ case 34
	.4byte _08037BAC @ case 35
_08037B30:
	ldr r5, _08037B34 @ =0x0000FFE0
	b _08037BB6
	.align 2, 0
_08037B34: .4byte 0x0000FFE0
_08037B38:
	ldr r5, _08037B3C @ =0x0000FFC0
	b _08037BB6
	.align 2, 0
_08037B3C: .4byte 0x0000FFC0
_08037B40:
	ldr r5, _08037B54 @ =0x0000FFA0
	ldr r0, _08037B58 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _08037BB6
	movs r0, #0x9d
	lsls r0, r0, #2
	bl SoundPlay
	b _08037BB6
	.align 2, 0
_08037B54: .4byte 0x0000FFA0
_08037B58: .4byte gCurrentSprite
_08037B5C:
	ldr r5, _08037B60 @ =0x0000FF40
	b _08037BB6
	.align 2, 0
_08037B60: .4byte 0x0000FF40
_08037B64:
	ldr r0, _08037B78 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _08037B72
	ldr r0, _08037B7C @ =0x00000275
	bl SoundPlay
_08037B72:
	ldr r5, _08037B80 @ =0x0000FEA0
	b _08037BB6
	.align 2, 0
_08037B78: .4byte gCurrentSprite
_08037B7C: .4byte 0x00000275
_08037B80: .4byte 0x0000FEA0
_08037B84:
	ldr r5, _08037B88 @ =0x0000FEC0
	b _08037BB6
	.align 2, 0
_08037B88: .4byte 0x0000FEC0
_08037B8C:
	ldr r5, _08037B90 @ =0x0000FEE0
	b _08037BB6
	.align 2, 0
_08037B90: .4byte 0x0000FEE0
_08037B94:
	movs r5, #0xff
	lsls r5, r5, #8
	b _08037BB6
_08037B9A:
	ldr r5, _08037BA0 @ =0x0000FF20
	b _08037BB6
	.align 2, 0
_08037BA0: .4byte 0x0000FF20
_08037BA4:
	ldr r5, _08037BA8 @ =0x0000FF80
	b _08037BB6
	.align 2, 0
_08037BA8: .4byte 0x0000FF80
_08037BAC:
	ldr r5, _08037BB0 @ =0x0000FFA0
	b _08037BB6
	.align 2, 0
_08037BB0: .4byte 0x0000FFA0
_08037BB4:
	ldr r5, _08037C08 @ =0x0000FE80
_08037BB6:
	ldr r4, _08037C0C @ =gCurrentSprite
	movs r6, #0
	strh r5, [r4, #0xa]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08037BE0
	ldr r0, _08037C10 @ =0x083480A8
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08037C14 @ =0x0000FFD0
	strh r0, [r4, #0xa]
_08037BE0:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08037C1C
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037C18 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037C30
	ldrh r0, [r4, #4]
	adds r0, #3
	b _08037C3C
	.align 2, 0
_08037C08: .4byte 0x0000FE80
_08037C0C: .4byte gCurrentSprite
_08037C10: .4byte 0x083480A8
_08037C14: .4byte 0x0000FFD0
_08037C18: .4byte gPreviousCollisionCheck
_08037C1C:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037C34 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037C38
_08037C30:
	strh r6, [r4]
	b _08037C3E
	.align 2, 0
_08037C34: .4byte gPreviousCollisionCheck
_08037C38:
	ldrh r0, [r4, #4]
	subs r0, #3
_08037C3C:
	strh r0, [r4, #4]
_08037C3E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start BoxFireMovingLow
BoxFireMovingLow: @ 0x08037C44
	push {r4, r5, lr}
	ldr r4, _08037C94 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	movs r5, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08037C6C
	ldr r0, _08037C98 @ =sFrameData_347e80
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r5, [r4, #0x16]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08037C9C @ =0x0000FFE0
	strh r0, [r4, #0xa]
_08037C6C:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08037CA4
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037CA0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037CB8
	ldrh r0, [r4, #4]
	adds r0, #3
	b _08037CC4
	.align 2, 0
_08037C94: .4byte gCurrentSprite
_08037C98: .4byte sFrameData_347e80
_08037C9C: .4byte 0x0000FFE0
_08037CA0: .4byte gPreviousCollisionCheck
_08037CA4:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08037CBC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037CC0
_08037CB8:
	strh r5, [r4]
	b _08037CC6
	.align 2, 0
_08037CBC: .4byte gPreviousCollisionCheck
_08037CC0:
	ldrh r0, [r4, #4]
	subs r0, #3
_08037CC4:
	strh r0, [r4, #4]
_08037CC6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start BoxSpawnFallingDebris
BoxSpawnFallingDebris: @ 0x08037CCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r4, _08037DC4 @ =gCurrentSprite
	ldrh r6, [r4, #2]
	ldrh r7, [r4, #4]
	ldrb r2, [r4, #0x1f]
	movs r0, #0x23
	adds r0, r0, r4
	mov r8, r0
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0xe8
	str r0, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0xbe
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	ldr r1, _08037DC8 @ =0xFFFFFEAA
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0xa0
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	ldr r1, _08037DCC @ =0xFFFFFEFA
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0xdc
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r1, r8
	ldrb r3, [r1]
	str r6, [sp]
	adds r0, r7, #0
	subs r0, #0x50
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	ldr r1, _08037DD0 @ =0xFFFFFEDC
	adds r0, r7, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	mov r0, r8
	ldrb r3, [r0]
	str r6, [sp]
	adds r0, r7, #0
	adds r0, #0x8c
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4b
	movs r1, #8
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037DC4: .4byte gCurrentSprite
_08037DC8: .4byte 0xFFFFFEAA
_08037DCC: .4byte 0xFFFFFEFA
_08037DD0: .4byte 0xFFFFFEDC

	thumb_func_start BoxSetDebrisClipdata
BoxSetDebrisClipdata: @ 0x08037DD4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08037E10 @ =gCurrentSprite
	ldrh r5, [r0, #2]
	ldrh r6, [r0, #4]
	ldr r0, _08037E14 @ =gCurrentClipdataAffectingAction
	mov r8, r0
	strb r4, [r0]
	subs r5, #0xe0
	adds r1, r6, #0
	adds r1, #0x20
	adds r0, r5, #0
	bl ClipdataProcess
	mov r0, r8
	strb r4, [r0]
	subs r6, #0x20
	adds r0, r5, #0
	adds r1, r6, #0
	bl ClipdataProcess
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037E10: .4byte gCurrentSprite
_08037E14: .4byte gCurrentClipdataAffectingAction

	thumb_func_start BoxDebrisInit
BoxDebrisInit: @ 0x08037E18
	push {r4, r5, lr}
	ldr r4, _08037EAC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	movs r5, #0x29
	movs r0, #0x18
	strb r0, [r5, r4]
	ldr r0, _08037EB0 @ =0x0000FF10
	strh r0, [r4, #0xa]
	strh r1, [r4, #0xc]
	adds r0, #0xc0
	strh r0, [r4, #0xe]
	movs r0, #0x30
	strh r0, [r4, #0x10]
	ldr r0, _08037EB4 @ =sFrameData_347fa8
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	movs r3, #1
	movs r0, #1
	strh r0, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	bl EventCheckAfter_BoxDefeated
	adds r2, r0, #0
	cmp r2, #0
	beq _08037ECC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08037EB8 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r4]
	ldr r0, _08037EBC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037EC0
	strh r0, [r4]
	b _08037EDE
	.align 2, 0
_08037EAC: .4byte gCurrentSprite
_08037EB0: .4byte 0x0000FF10
_08037EB4: .4byte sFrameData_347fa8
_08037EB8: .4byte 0x0000DFFF
_08037EBC: .4byte gPreviousCollisionCheck
_08037EC0:
	movs r0, #2
	bl BoxSetDebrisClipdata
	bl BoxSpawnFallingDebris
	b _08037EDE
_08037ECC:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08037EE4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037EDE
	strh r2, [r4]
_08037EDE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08037EE4: .4byte gPreviousCollisionCheck

	thumb_func_start BoxDebrisIdle
BoxDebrisIdle: @ 0x08037EE8
	ldr r0, _08037EF4 @ =gCurrentSprite
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_08037EF4: .4byte gCurrentSprite

	thumb_func_start BoxDebrisFallingInit
BoxDebrisFallingInit: @ 0x08037EF8
	ldr r1, _08037F14 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r2, [r1]
	ldr r0, _08037F18 @ =0x0000DFFF
	ands r0, r2
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	bx lr
	.align 2, 0
_08037F14: .4byte gCurrentSprite
_08037F18: .4byte 0x0000DFFF

	thumb_func_start BoxDebrisWaitToFall
BoxDebrisWaitToFall: @ 0x08037F1C
	push {lr}
	ldr r2, _08037F74 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r3, #0
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2, #4]
	lsrs r0, r0, #2
	ldr r1, _08037F78 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08037F7C @ =0xFFDF0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xae
	bhi _08037F6E
	adds r0, r2, #0
	adds r0, #0x2e
	strb r3, [r0]
	adds r0, #3
	strb r3, [r0]
	subs r0, #0xd
	movs r1, #0x1c
	strb r1, [r0]
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	bl BoxSpawnFallingDebris
	movs r0, #0x8c
	lsls r0, r0, #2
	bl unk_3b1c
_08037F6E:
	pop {r0}
	bx r0
	.align 2, 0
_08037F74: .4byte gCurrentSprite
_08037F78: .4byte gBg1XPosition
_08037F7C: .4byte 0xFFDF0000

	thumb_func_start BoxDebrisFalling
BoxDebrisFalling: @ 0x08037F80
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r4, _08037FF0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r7, [r1]
	ldrh r5, [r4, #2]
	ldrh r6, [r4, #4]
	adds r0, r5, #0
	adds r1, r6, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08037FF4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08037FF8
	strh r1, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x1e
	strb r1, [r0]
	movs r0, #0x1e
	movs r1, #0x81
	bl ScreenShakeStartVertical
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x31
	bl ParticleSet
	adds r1, r6, #0
	adds r1, #0x20
	adds r0, r5, #0
	movs r2, #0x31
	bl ParticleSet
	movs r0, #0x28
	bl EventCheckAdvance
	movs r0, #2
	bl BoxSetDebrisClipdata
	movs r0, #0x18
	movs r1, #6
	bl PlayMusic
	b _0803807E
	.align 2, 0
_08037FF0: .4byte gCurrentSprite
_08037FF4: .4byte gPreviousVerticalCollisionCheck
_08037FF8:
	movs r0, #0x31
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	ldr r1, _08038024 @ =sSpritesFallingSpeedFast
	mov ip, r1
	lsls r0, r2, #1
	add r0, ip
	ldrh r3, [r0]
	mov sb, r3
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08038028 @ =0x00007FFF
	cmp r1, r0
	bne _0803802C
	subs r1, r2, #1
	lsls r1, r1, #1
	add r1, ip
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038036
	.align 2, 0
_08038024: .4byte sSpritesFallingSpeedFast
_08038028: .4byte 0x00007FFF
_0803802C:
	adds r0, r2, #1
	mov r1, r8
	strb r0, [r1]
	ldrh r0, [r4, #2]
	add r0, sb
_08038036:
	strh r0, [r4, #2]
	movs r1, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0803804E
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #0x34
	bl ParticleSet
	b _0803807E
_0803804E:
	adds r0, r7, #4
	ands r0, r1
	cmp r0, #0
	bne _08038066
	adds r0, r5, #0
	subs r0, #0xa0
	adds r1, r6, #0
	adds r1, #0x28
	movs r2, #0x33
	bl ParticleSet
	b _0803807E
_08038066:
	adds r0, r7, #0
	adds r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0803807E
	adds r0, r5, #0
	subs r0, #0x82
	adds r1, r6, #0
	subs r1, #0x28
	movs r2, #0x33
	bl ParticleSet
_0803807E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxFallingDebrisInit
BoxFallingDebrisInit: @ 0x0803808C
	push {r4, lr}
	ldr r3, _080380D0 @ =gCurrentSprite
	ldrh r1, [r3]
	ldr r0, _080380D4 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r4, #0
	strh r0, [r3]
	ldr r1, _080380D8 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #0xa
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	ldrb r0, [r3, #0x1e]
	cmp r0, #8
	bls _080380C6
	b _080382E8
_080380C6:
	lsls r0, r0, #2
	ldr r1, _080380DC @ =_080380E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080380D0: .4byte gCurrentSprite
_080380D4: .4byte 0x0000FFFB
_080380D8: .4byte 0x0000FFFC
_080380DC: .4byte _080380E0
_080380E0: @ jump table
	.4byte _08038104 @ case 0
	.4byte _08038160 @ case 1
	.4byte _0803818C @ case 2
	.4byte _080381BC @ case 3
	.4byte _080381EC @ case 4
	.4byte _0803821C @ case 5
	.4byte _0803824C @ case 6
	.4byte _08038280 @ case 7
	.4byte _080382A8 @ case 8
_08038104:
	ldr r3, _08038154 @ =gCurrentSprite
	ldr r0, _08038158 @ =sFrameData_347fb8
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x29
	movs r0, #0x18
	strb r0, [r2]
	ldr r0, _0803815C @ =0x0000FF78
	strh r0, [r3, #0xa]
	strh r1, [r3, #0xc]
	adds r0, #0x84
	strh r0, [r3, #0xe]
	movs r0, #0x44
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xb
	strb r0, [r1]
	adds r1, #3
	movs r0, #1
	strb r0, [r1]
	strh r0, [r3, #0x14]
	adds r2, #0xb
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038154: .4byte gCurrentSprite
_08038158: .4byte sFrameData_347fb8
_0803815C: .4byte 0x0000FF78
_08038160:
	ldr r4, _08038184 @ =gCurrentSprite
	ldr r0, _08038188 @ =sFrameData_347fc8
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #5
	b _080382CA
	.align 2, 0
_08038184: .4byte gCurrentSprite
_08038188: .4byte sFrameData_347fc8
_0803818C:
	ldr r2, _080381B4 @ =gCurrentSprite
	ldr r0, _080381B8 @ =sFrameData_347fd8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x28
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080381B4: .4byte gCurrentSprite
_080381B8: .4byte sFrameData_347fd8
_080381BC:
	ldr r2, _080381E4 @ =gCurrentSprite
	ldr r0, _080381E8 @ =sFrameData_347fe8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x50
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080381E4: .4byte gCurrentSprite
_080381E8: .4byte sFrameData_347fe8
_080381EC:
	ldr r2, _08038214 @ =gCurrentSprite
	ldr r0, _08038218 @ =sFrameData_347ff8
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #9
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038214: .4byte gCurrentSprite
_08038218: .4byte sFrameData_347ff8
_0803821C:
	ldr r4, _08038244 @ =gCurrentSprite
	ldr r0, _08038248 @ =0x08348008
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #9
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x78
	b _080382CC
	.align 2, 0
_08038244: .4byte gCurrentSprite
_08038248: .4byte 0x08348008
_0803824C:
	ldr r2, _08038278 @ =gCurrentSprite
	ldr r0, _0803827C @ =0x08348018
	str r0, [r2, #0x18]
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0xa
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_08038278: .4byte gCurrentSprite
_0803827C: .4byte 0x08348018
_08038280:
	ldr r2, _080382A0 @ =gCurrentSprite
	ldr r0, _080382A4 @ =0x08348028
	str r0, [r2, #0x18]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x14
	strb r0, [r1]
	b _080382EA
	.align 2, 0
_080382A0: .4byte gCurrentSprite
_080382A4: .4byte 0x08348028
_080382A8:
	ldr r4, _080382E0 @ =gCurrentSprite
	ldr r0, _080382E4 @ =0x08348038
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
_080382CA:
	movs r0, #0x3c
_080382CC:
	strb r0, [r1]
	bl EventCheckAfter_BoxDefeated
	cmp r0, #0
	bne _080382EA
	ldrh r0, [r4, #2]
	adds r0, #0xc0
	strh r0, [r4, #2]
	b _080382EA
	.align 2, 0
_080382E0: .4byte gCurrentSprite
_080382E4: .4byte 0x08348038
_080382E8:
	strh r4, [r3]
_080382EA:
	bl EventCheckAfter_BoxDefeated
	cmp r0, #0
	beq _08038300
	ldr r0, _080382FC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1e
	b _08038306
	.align 2, 0
_080382FC: .4byte gCurrentSprite
_08038300:
	ldr r0, _08038310 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
_08038306:
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038310: .4byte gCurrentSprite

	thumb_func_start BoxFallingDebrisFalling
BoxFallingDebrisFalling: @ 0x08038314
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08038334 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	cmp r0, #0
	beq _08038338
	subs r0, #1
	strb r0, [r1]
	b _08038542
	.align 2, 0
_08038334: .4byte gCurrentSprite
_08038338:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r6, [r1]
	ldrh r7, [r4, #2]
	ldrh r0, [r4, #4]
	mov r8, r0
	ldrb r5, [r4, #0x1e]
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0xfe
	bhi _08038358
	adds r0, #1
	strb r0, [r1]
_08038358:
	ldrb r0, [r1]
	cmp r0, #0x32
	bls _080383DE
	adds r0, r7, #0
	mov r1, r8
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08038398 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080383DE
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	cmp r5, #0
	bne _0803839C
	movs r1, #0x81
	bl ScreenShakeStartVertical
	mov r1, r8
	subs r1, #0x20
	adds r0, r7, #0
	movs r2, #0x31
	bl ParticleSet
	mov r1, r8
	adds r1, #0x20
	adds r0, r7, #0
	b _080383A8
	.align 2, 0
_08038398: .4byte gPreviousVerticalCollisionCheck
_0803839C:
	cmp r5, #1
	beq _080383A4
	cmp r5, #6
	bne _080383B0
_080383A4:
	adds r0, r7, #0
	mov r1, r8
_080383A8:
	movs r2, #0x31
	bl ParticleSet
	b _08038542
_080383B0:
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080383BE
	cmp r5, #7
	bne _080383D2
_080383BE:
	mov r1, r8
	subs r1, #0x10
	adds r0, r7, #0
	movs r2, #0x27
	bl ParticleSet
	mov r1, r8
	adds r1, #0x10
	adds r0, r7, #0
	b _080383D6
_080383D2:
	adds r0, r7, #0
	mov r1, r8
_080383D6:
	movs r2, #0x27
	bl ParticleSet
	b _08038542
_080383DE:
	cmp r5, #0
	bne _0803845C
	movs r1, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080383F8
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x31
	bl ParticleSet
	b _08038426
_080383F8:
	adds r0, r6, #4
	ands r0, r1
	cmp r0, #0
	bne _08038410
	adds r0, r7, #0
	subs r0, #0xa0
	mov r1, r8
	adds r1, #0x32
	movs r2, #0x2e
	bl ParticleSet
	b _08038426
_08038410:
	adds r0, r6, #0
	adds r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08038426
	mov r1, r8
	subs r1, #0x20
	adds r0, r7, #0
	movs r2, #0x33
	bl ParticleSet
_08038426:
	ldr r3, _08038450 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08038454 @ =sSpritesFallingSpeedFast
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038458 @ =0x00007FFF
	cmp r1, r0
	beq _08038442
	b _08038538
_08038442:
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_08038450: .4byte gCurrentSprite
_08038454: .4byte sSpritesFallingSpeedFast
_08038458: .4byte 0x00007FFF
_0803845C:
	cmp r5, #1
	beq _08038464
	cmp r5, #6
	bne _080384AC
_08038464:
	movs r0, #0x1f
	ands r6, r0
	cmp r6, #0
	bne _08038476
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x27
	bl ParticleSet
_08038476:
	ldr r3, _080384A0 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _080384A4 @ =sSpritesFallingSpeedQuickAcceleration
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _080384A8 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_080384A0: .4byte gCurrentSprite
_080384A4: .4byte sSpritesFallingSpeedQuickAcceleration
_080384A8: .4byte 0x00007FFF
_080384AC:
	subs r0, r5, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080384BA
	cmp r5, #7
	bne _08038504
_080384BA:
	adds r0, r6, #7
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _080384CE
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x33
	bl ParticleSet
_080384CE:
	ldr r3, _080384F8 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _080384FC @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038500 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_080384F8: .4byte gCurrentSprite
_080384FC: .4byte sSpritesFallingSpeed
_08038500: .4byte 0x00007FFF
_08038504:
	ldr r3, _0803852C @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x31
	ldrb r2, [r6]
	ldr r5, _08038530 @ =sSpritesFallingSpeedSlow
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08038534 @ =0x00007FFF
	cmp r1, r0
	bne _08038538
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08038540
	.align 2, 0
_0803852C: .4byte gCurrentSprite
_08038530: .4byte sSpritesFallingSpeedSlow
_08038534: .4byte 0x00007FFF
_08038538:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_08038540:
	strh r0, [r3, #2]
_08038542:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Box
Box: @ 0x0803854C
	push {lr}
	ldr r0, _08038564 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4e
	bls _0803855A
	b _0803878A
_0803855A:
	lsls r0, r0, #2
	ldr r1, _08038568 @ =_0803856C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038564: .4byte gCurrentSprite
_08038568: .4byte _0803856C
_0803856C: @ jump table
	.4byte _080386A8 @ case 0
	.4byte _080386AE @ case 1
	.4byte _080386B2 @ case 2
	.4byte _0803878A @ case 3
	.4byte _0803878A @ case 4
	.4byte _0803878A @ case 5
	.4byte _0803878A @ case 6
	.4byte _080386EA @ case 7
	.4byte _080386EE @ case 8
	.4byte _0803878A @ case 9
	.4byte _0803878A @ case 10
	.4byte _0803878A @ case 11
	.4byte _0803878A @ case 12
	.4byte _0803878A @ case 13
	.4byte _0803878A @ case 14
	.4byte _0803878A @ case 15
	.4byte _0803878A @ case 16
	.4byte _0803878A @ case 17
	.4byte _0803878A @ case 18
	.4byte _0803878A @ case 19
	.4byte _0803878A @ case 20
	.4byte _0803878A @ case 21
	.4byte _0803878A @ case 22
	.4byte _080386B8 @ case 23
	.4byte _080386BC @ case 24
	.4byte _080386C2 @ case 25
	.4byte _080386C6 @ case 26
	.4byte _080386CC @ case 27
	.4byte _080386D0 @ case 28
	.4byte _080386D6 @ case 29
	.4byte _080386DA @ case 30
	.4byte _080386E0 @ case 31
	.4byte _080386E4 @ case 32
	.4byte _0803878A @ case 33
	.4byte _0803878A @ case 34
	.4byte _0803878A @ case 35
	.4byte _0803878A @ case 36
	.4byte _0803878A @ case 37
	.4byte _0803878A @ case 38
	.4byte _08038726 @ case 39
	.4byte _0803872A @ case 40
	.4byte _08038730 @ case 41
	.4byte _08038734 @ case 42
	.4byte _0803878A @ case 43
	.4byte _0803873A @ case 44
	.4byte _0803878A @ case 45
	.4byte _08038740 @ case 46
	.4byte _0803878A @ case 47
	.4byte _0803878A @ case 48
	.4byte _0803878A @ case 49
	.4byte _0803878A @ case 50
	.4byte _0803878A @ case 51
	.4byte _0803878A @ case 52
	.4byte _0803878A @ case 53
	.4byte _0803878A @ case 54
	.4byte _080386F4 @ case 55
	.4byte _080386F8 @ case 56
	.4byte _08038708 @ case 57
	.4byte _0803870C @ case 58
	.4byte _08038712 @ case 59
	.4byte _08038716 @ case 60
	.4byte _0803871C @ case 61
	.4byte _08038720 @ case 62
	.4byte _08038746 @ case 63
	.4byte _0803874A @ case 64
	.4byte _08038750 @ case 65
	.4byte _08038754 @ case 66
	.4byte _0803875A @ case 67
	.4byte _0803875E @ case 68
	.4byte _08038764 @ case 69
	.4byte _08038768 @ case 70
	.4byte _0803876E @ case 71
	.4byte _08038772 @ case 72
	.4byte _08038778 @ case 73
	.4byte _0803877C @ case 74
	.4byte _080386FE @ case 75
	.4byte _08038702 @ case 76
	.4byte _08038782 @ case 77
	.4byte _08038786 @ case 78
_080386A8:
	bl BoxInit
	b _0803878A
_080386AE:
	bl BoxCrawlingInit
_080386B2:
	bl BoxCrawling
	b _0803878A
_080386B8:
	bl BoxWaitingToRunInit
_080386BC:
	bl BoxWaitingToRun
	b _0803878A
_080386C2:
	bl BoxSlowRunningInit
_080386C6:
	bl BoxSlowRun
	b _0803878A
_080386CC:
	bl BoxFastRunInit
_080386D0:
	bl BoxFastRun
	b _0803878A
_080386D6:
	bl BoxSkiddingInit
_080386DA:
	bl BoxSkidding
	b _0803878A
_080386E0:
	bl BoxStopSkiddingInit
_080386E4:
	bl BoxStopSkidding
	b _0803878A
_080386EA:
	bl BoxFinishedCrawlingInit
_080386EE:
	bl BoxFinishedCrawling
	b _0803878A
_080386F4:
	bl BoxBonkingInit
_080386F8:
	bl BoxBonking
	b _0803878A
_080386FE:
	bl BoxLandingFromBonkInit
_08038702:
	bl BoxLandingFromBonk
	b _0803878A
_08038708:
	bl BoxLandingInit
_0803870C:
	bl BoxLanding
	b _0803878A
_08038712:
	bl BoxJumpWarningInit
_08038716:
	bl BoxJumpWarning
	b _0803878A
_0803871C:
	bl BoxJumpingInit
_08038720:
	bl BoxJumping
	b _0803878A
_08038726:
	bl BoxStoppingToFireBombInit
_0803872A:
	bl BoxStoppingToFireBomb
	b _0803878A
_08038730:
	bl BoxLoweringToFireBombInit
_08038734:
	bl BoxLoweringToFireBomb
	b _0803878A
_0803873A:
	bl BoxFiringBomb
	b _0803878A
_08038740:
	bl BoxDoneFiringBomb
	b _0803878A
_08038746:
	bl BoxWaitingToEmergeInit
_0803874A:
	bl BoxWaitingToEmerge
	b _0803878A
_08038750:
	bl BoxFirstJumpInit
_08038754:
	bl BoxFirstJump
	b _0803878A
_0803875A:
	bl BoxDefeatedInit
_0803875E:
	bl BoxDefeated
	b _0803878A
_08038764:
	bl BoxMovingToFinalJumpInit
_08038768:
	bl BoxMovingToFinalJump
	b _0803878A
_0803876E:
	bl BoxWaitingForFinalJumpInit
_08038772:
	bl BoxWaitingForFinalJump
	b _0803878A
_08038778:
	bl BoxCrouchingForFinalJumpInit
_0803877C:
	bl BoxCrouchingForFinalJump
	b _0803878A
_08038782:
	bl BoxFinalJumpInit
_08038786:
	bl BoxFinalJump
_0803878A:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BoxPart
BoxPart: @ 0x08038798
	push {r4, lr}
	ldr r0, _080387B0 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080387B4
	bl BoxPartInit
	b _0803887C
	.align 2, 0
_080387B0: .4byte gCurrentSprite
_080387B4:
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	beq _080387F4
	cmp r0, #2
	bgt _080387C4
	cmp r0, #0
	beq _080387CE
	b _0803885C
_080387C4:
	cmp r0, #6
	beq _0803881C
	cmp r0, #8
	beq _08038834
	b _0803885C
_080387CE:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _080387F0 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _080387E6
	strb r3, [r4]
_080387E6:
	bl BoxPartFrontLeftLeg
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_080387F0: .4byte gSubSpriteData1
_080387F4:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038818 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _0803880C
	strb r3, [r4]
_0803880C:
	bl BoxPartFrontRightLeg
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038818: .4byte gSubSpriteData1
_0803881C:
	ldr r0, _08038830 @ =gSubSpriteData1
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	strb r1, [r0, #0xe]
	bl BoxPartCenter
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038830: .4byte gSubSpriteData1
_08038834:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038858 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _0803884C
	strb r3, [r4]
_0803884C:
	bl BoxPartCenterBottom
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _0803887C
	.align 2, 0
_08038858: .4byte gSubSpriteData1
_0803885C:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08038884 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _08038874
	strb r3, [r4]
_08038874:
	bl BoxPartDefault
	bl BoxSyncSubSprites
_0803887C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08038884: .4byte gSubSpriteData1

	thumb_func_start BoxMissile
BoxMissile: @ 0x08038888
	push {lr}
	ldr r0, _080388A0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080388B4
	cmp r0, #2
	bgt _080388A4
	cmp r0, #0
	beq _080388AE
	b _080388C4
	.align 2, 0
_080388A0: .4byte gCurrentSprite
_080388A4:
	cmp r0, #0x18
	beq _080388BA
	cmp r0, #0x37
	beq _080388C0
	b _080388C4
_080388AE:
	bl BoxMissileInit
	b _080388C4
_080388B4:
	bl BoxMissileSpawning
	b _080388C4
_080388BA:
	bl BoxMissileMoving
	b _080388C4
_080388C0:
	bl BoxMissileExploding
_080388C4:
	pop {r0}
	bx r0

	thumb_func_start BoxBomb
BoxBomb: @ 0x080388C8
	push {lr}
	ldr r0, _080388E0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080388F4
	cmp r0, #2
	bgt _080388E4
	cmp r0, #0
	beq _080388EE
	b _08038904
	.align 2, 0
_080388E0: .4byte gCurrentSprite
_080388E4:
	cmp r0, #0x18
	beq _080388FA
	cmp r0, #0x37
	beq _08038900
	b _08038904
_080388EE:
	bl BoxBombInit
	b _08038904
_080388F4:
	bl BoxBombMoving
	b _08038904
_080388FA:
	bl BoxBombLanded
	b _08038904
_08038900:
	bl BoxBombExploding
_08038904:
	pop {r0}
	bx r0

	thumb_func_start BoxFire
BoxFire: @ 0x08038908
	push {lr}
	ldr r0, _08038920 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803892E
	cmp r0, #2
	bgt _08038924
	cmp r0, #0
	beq _0803892A
	b _08038938
	.align 2, 0
_08038920: .4byte gCurrentSprite
_08038924:
	cmp r0, #0x18
	beq _08038934
	b _08038938
_0803892A:
	bl BoxFireInit
_0803892E:
	bl BoxFireMovingHigh
	b _08038938
_08038934:
	bl BoxFireMovingLow
_08038938:
	pop {r0}
	bx r0

	thumb_func_start BoxDebris
BoxDebris: @ 0x0803893C
	push {lr}
	ldr r0, _08038954 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _080389EC
	lsls r0, r0, #2
	ldr r1, _08038958 @ =_0803895C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08038954: .4byte gCurrentSprite
_08038958: .4byte _0803895C
_0803895C: @ jump table
	.4byte _080389D0 @ case 0
	.4byte _080389EC @ case 1
	.4byte _080389D6 @ case 2
	.4byte _080389EC @ case 3
	.4byte _080389EC @ case 4
	.4byte _080389EC @ case 5
	.4byte _080389EC @ case 6
	.4byte _080389EC @ case 7
	.4byte _080389EC @ case 8
	.4byte _080389EC @ case 9
	.4byte _080389EC @ case 10
	.4byte _080389EC @ case 11
	.4byte _080389EC @ case 12
	.4byte _080389EC @ case 13
	.4byte _080389EC @ case 14
	.4byte _080389EC @ case 15
	.4byte _080389EC @ case 16
	.4byte _080389EC @ case 17
	.4byte _080389EC @ case 18
	.4byte _080389EC @ case 19
	.4byte _080389EC @ case 20
	.4byte _080389EC @ case 21
	.4byte _080389EC @ case 22
	.4byte _080389EC @ case 23
	.4byte _080389DC @ case 24
	.4byte _080389EC @ case 25
	.4byte _080389E2 @ case 26
	.4byte _080389EC @ case 27
	.4byte _080389E8 @ case 28
_080389D0:
	bl BoxDebrisInit
	b _080389EC
_080389D6:
	bl BoxDebrisIdle
	b _080389EC
_080389DC:
	bl BoxDebrisFallingInit
	b _080389EC
_080389E2:
	bl BoxDebrisWaitToFall
	b _080389EC
_080389E8:
	bl BoxDebrisFalling
_080389EC:
	pop {r0}
	bx r0

	thumb_func_start BoxFallingDebris
BoxFallingDebris: @ 0x080389F0
	push {lr}
	ldr r0, _08038A04 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08038A08
	cmp r0, #2
	beq _08038A0E
	b _08038A12
	.align 2, 0
_08038A04: .4byte gCurrentSprite
_08038A08:
	bl BoxFallingDebrisInit
	b _08038A12
_08038A0E:
	bl BoxFallingDebrisFalling
_08038A12:
	pop {r0}
	bx r0
	.align 2, 0
