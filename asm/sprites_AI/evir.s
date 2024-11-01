    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start EvirCheckInShootingRange
EvirCheckInShootingRange: @ 0x0803D808
	push {r4, lr}
	movs r4, #0
	ldr r3, _0803D820 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803D824
	movs r0, #0
	b _0803D854
	.align 2, 0
_0803D820: .4byte gCurrentSprite
_0803D824:
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	beq _0803D836
	subs r0, #1
	strb r0, [r2]
	movs r0, #0
	b _0803D854
_0803D836:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803D852
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _0803D852
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0803D852:
	adds r0, r4, #0
_0803D854:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvirSpawningFromX
EvirSpawningFromX: @ 0x0803D85C
	push {lr}
	ldr r3, _0803D884 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0803D890
	ldr r2, _0803D888 @ =gWrittenToMosaic_H
	ldr r1, _0803D88C @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0803D8A4
	.align 2, 0
_0803D884: .4byte gCurrentSprite
_0803D888: .4byte gWrittenToMosaic_H
_0803D88C: .4byte sXParasiteMosaicValues
_0803D890:
	ldrh r0, [r3]
	ldr r1, _0803D8A8 @ =0x00007FFF
	ands r1, r0
	adds r2, r3, #0
	adds r2, #0x24
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0803D8AC @ =0x0000FFDF
	ands r1, r0
	strh r1, [r3]
_0803D8A4:
	pop {r0}
	bx r0
	.align 2, 0
_0803D8A8: .4byte 0x00007FFF
_0803D8AC: .4byte 0x0000FFDF

	thumb_func_start EvirTurningIntoX
EvirTurningIntoX: @ 0x0803D8B0
	push {r4, lr}
	sub sp, #0x10
	ldr r2, _0803D8F0 @ =gCurrentSprite
	ldrh r0, [r2, #2]
	subs r0, #0x5c
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r4, #0x40
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D8F4
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	subs r0, #0x28
	str r0, [sp, #4]
	ldrh r0, [r2, #4]
	adds r0, #0x20
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _0803D918
	.align 2, 0
_0803D8F0: .4byte gCurrentSprite
_0803D8F4:
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	subs r0, #0x28
	str r0, [sp, #4]
	ldrh r0, [r2, #4]
	subs r0, #0x20
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
_0803D918:
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EvirInit
EvirInit: @ 0x0803D920
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r3, _0803D98C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x27
	movs r5, #0
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r2, _0803D990 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r4, #0
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	ldr r0, _0803D994 @ =sEvirOam_356abc
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r5, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r4, [r0]
	adds r0, #6
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803D9B0
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0803D998
	strh r5, [r3]
	b _0803DA6A
	.align 2, 0
_0803D98C: .4byte gCurrentSprite
_0803D990: .4byte sPrimarySpriteStats
_0803D994: .4byte sEvirOam_356abc
_0803D998:
	adds r0, r3, #0
	adds r0, #0x36
	strb r2, [r0]
	ldr r0, _0803D9AC @ =0x0000FF80
	strh r0, [r3, #0xa]
	strh r5, [r3, #0xc]
	adds r0, #0x40
	strh r0, [r3, #0xe]
	movs r0, #0x40
	b _0803D9BE
	.align 2, 0
_0803D9AC: .4byte 0x0000FF80
_0803D9B0:
	ldr r0, _0803D9D8 @ =0x0000FFC0
	strh r0, [r3, #0xa]
	adds r0, #0x28
	strh r0, [r3, #0xc]
	subs r0, #8
	strh r0, [r3, #0xe]
	movs r0, #0x20
_0803D9BE:
	strh r0, [r3, #0x10]
	ldr r4, _0803D9DC @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803D9E0
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0803DA6A
	.align 2, 0
_0803D9D8: .4byte 0x0000FFC0
_0803D9DC: .4byte gCurrentSprite
_0803D9E0:
	movs r7, #0
	movs r0, #2
	strb r0, [r1]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	bl SpriteUtilChooseRandomXDirection
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x60
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x3b
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0803DA42
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0803DA46
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x18
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x3b
	movs r1, #1
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0803DA6A
_0803DA42:
	strh r7, [r4]
	b _0803DA6A
_0803DA46:
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3b
	movs r1, #1
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	bne _0803DA6A
	strh r5, [r4]
_0803DA6A:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EvirShootingInit
EvirShootingInit: @ 0x0803DA74
	ldr r0, _0803DA90 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x2a
	strb r1, [r2]
	ldr r1, _0803DA94 @ =sEvirOam_356b04
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x5a
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803DA90: .4byte gCurrentSprite
_0803DA94: .4byte sEvirOam_356b04

	thumb_func_start EvirShooting
EvirShooting: @ 0x0803DA98
	push {r4, lr}
	sub sp, #0xc
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803DAB4
	ldr r0, _0803DAB0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	b _0803DB36
	.align 2, 0
_0803DAB0: .4byte gCurrentSprite
_0803DAB4:
	ldr r1, _0803DAF0 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	mov ip, r1
	cmp r0, #4
	bne _0803DB16
	ldrb r0, [r1, #0x1c]
	cmp r0, #8
	bne _0803DB16
	ldrh r1, [r1]
	movs r4, #0x40
	adds r0, r4, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0803DAF4
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x48
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x1c
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _0803DB0C
	.align 2, 0
_0803DAF0: .4byte gCurrentSprite
_0803DAF4:
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x48
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x1c
	str r0, [sp, #4]
	str r1, [sp, #8]
_0803DB0C:
	movs r0, #0x3c
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0803DB36
_0803DB16:
	mov r1, ip
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0803DB36
	ldrb r0, [r1, #0x1c]
	cmp r0, #8
	bne _0803DB36
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803DB36
	movs r0, #0xd5
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803DB36:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EvirIdleInit
EvirIdleInit: @ 0x0803DB40
	ldr r1, _0803DB58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0803DB5C @ =sEvirOam_356abc
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0803DB58: .4byte gCurrentSprite
_0803DB5C: .4byte sEvirOam_356abc

	thumb_func_start EvirIdle
EvirIdle: @ 0x0803DB60
	push {r4, r5, r6, lr}
	bl EvirCheckInShootingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DB72
	bl EvirShootingInit
	b _0803DC90
_0803DB72:
	movs r6, #0
	ldr r4, _0803DBB8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803DBC4
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803DBBC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803DBEA
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803DBEA
	ldr r0, _0803DBC0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803DC06
	ldrh r0, [r4, #4]
	adds r0, #4
	b _0803DC04
	.align 2, 0
_0803DBB8: .4byte gCurrentSprite
_0803DBBC: .4byte gPreviousCollisionCheck
_0803DBC0: .4byte gFrameCounter8Bit
_0803DBC4:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803DBF0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0803DBEA
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0803DBF4
_0803DBEA:
	movs r6, #1
	b _0803DC06
	.align 2, 0
_0803DBF0: .4byte gPreviousCollisionCheck
_0803DBF4:
	ldr r0, _0803DC30 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0803DC06
	ldrh r0, [r4, #4]
	subs r0, #4
_0803DC04:
	strh r0, [r4, #4]
_0803DC06:
	ldr r4, _0803DC34 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0803DC3C
	ldrh r0, [r4, #2]
	adds r0, #8
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803DC38 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0803DC4E
	ldrh r0, [r4, #2]
	adds r0, #2
	b _0803DC60
	.align 2, 0
_0803DC30: .4byte gFrameCounter8Bit
_0803DC34: .4byte gCurrentSprite
_0803DC38: .4byte gPreviousCollisionCheck
_0803DC3C:
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0803DC58 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0803DC5C
_0803DC4E:
	ldrh r1, [r4]
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4]
	b _0803DC62
	.align 2, 0
_0803DC58: .4byte gPreviousCollisionCheck
_0803DC5C:
	ldrh r0, [r4, #2]
	subs r0, #2
_0803DC60:
	strh r0, [r4, #2]
_0803DC62:
	cmp r6, #0
	beq _0803DC74
	ldr r0, _0803DC70 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
	strb r1, [r0]
	b _0803DC90
	.align 2, 0
_0803DC70: .4byte gCurrentSprite
_0803DC74:
	ldr r2, _0803DC98 @ =gCurrentSprite
	ldrh r1, [r2, #0x16]
	cmp r1, #2
	bne _0803DC90
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _0803DC90
	ldrh r0, [r2]
	ands r1, r0
	cmp r1, #0
	beq _0803DC90
	ldr r0, _0803DC9C @ =0x000001A9
	bl SoundPlayNotAlreadyPlaying
_0803DC90:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0803DC98: .4byte gCurrentSprite
_0803DC9C: .4byte 0x000001A9

	thumb_func_start EvirTurningAroundInit
EvirTurningAroundInit: @ 0x0803DCA0
	ldr r1, _0803DCB8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #4
	strb r0, [r2]
	ldr r0, _0803DCBC @ =sEvirOam_356b44
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0803DCB8: .4byte gCurrentSprite
_0803DCBC: .4byte sEvirOam_356b44

	thumb_func_start EvirTurningAround
EvirTurningAround: @ 0x0803DCC0
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803DCE6
	ldr r2, _0803DCEC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0803DCF0 @ =sEvirOam_356b64
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_0803DCE6:
	pop {r0}
	bx r0
	.align 2, 0
_0803DCEC: .4byte gCurrentSprite
_0803DCF0: .4byte sEvirOam_356b64

	thumb_func_start EvirTurningAroundSecondPart
EvirTurningAroundSecondPart: @ 0x0803DCF4
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803DD06
	ldr r0, _0803DD0C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0803DD06:
	pop {r0}
	bx r0
	.align 2, 0
_0803DD0C: .4byte gCurrentSprite

	thumb_func_start EvirCollisionInit
EvirCollisionInit: @ 0x0803DD10
	push {r4, r5, lr}
	ldr r0, _0803DD98 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0803DD9C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803DD3C
	mov r5, ip
	ldrh r1, [r5]
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
_0803DD3C:
	mov r0, ip
	adds r0, #0x25
	movs r3, #0
	movs r2, #2
	strb r2, [r0]
	adds r0, #2
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x10
	strb r0, [r1]
	movs r4, #0
	ldr r0, _0803DDA0 @ =0x0000FFE0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r0, #0x20
	strh r0, [r1, #0xc]
	ldr r1, _0803DDA4 @ =sSecondarySpriteStats
	mov r5, ip
	ldrb r0, [r5, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	ldr r0, _0803DDA8 @ =sEvirOam_356b84
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r3, [r5, #0x16]
	ldrb r0, [r5, #0x1e]
	cmp r0, #0
	beq _0803DDB0
	ldr r0, _0803DDAC @ =0x0000FFE8
	strh r0, [r5, #0xe]
	movs r0, #0x18
	strh r0, [r5, #0x10]
	b _0803DDBA
	.align 2, 0
_0803DD98: .4byte gCurrentSprite
_0803DD9C: .4byte gSpriteData
_0803DDA0: .4byte 0x0000FFE0
_0803DDA4: .4byte sSecondarySpriteStats
_0803DDA8: .4byte sEvirOam_356b84
_0803DDAC: .4byte 0x0000FFE8
_0803DDB0:
	ldr r0, _0803DDC0 @ =0x0000FFC8
	mov r1, ip
	strh r0, [r1, #0xe]
	movs r0, #0x38
	strh r0, [r1, #0x10]
_0803DDBA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DDC0: .4byte 0x0000FFC8

	thumb_func_start EvirCollisionIdle
EvirCollisionIdle: @ 0x0803DDC4
	push {r4, r5, r6, r7, lr}
	ldr r3, _0803DDF4 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r0]
	ldr r2, _0803DDF8 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r6, #0x80
	lsls r6, r6, #6
	adds r0, r6, #0
	ands r0, r1
	adds r4, r3, #0
	adds r7, r2, #0
	cmp r0, #0
	beq _0803DDFC
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
	b _0803DE02
	.align 2, 0
_0803DDF4: .4byte gCurrentSprite
_0803DDF8: .4byte gSpriteData
_0803DDFC:
	ldrh r1, [r4]
	ldr r0, _0803DE48 @ =0x0000DFFF
	ands r0, r1
_0803DE02:
	strh r0, [r4]
	ldrh r6, [r4, #0x14]
	lsls r3, r5, #3
	cmp r6, #0
	bne _0803DE4C
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x56
	bhi _0803DE4C
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	movs r3, #0
	mov r0, ip
	strh r6, [r0, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	strh r6, [r4]
	b _0803DEC6
	.align 2, 0
_0803DE48: .4byte 0x0000DFFF
_0803DE4C:
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _0803DE74
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r2, r0, r7
	ldrh r0, [r2, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803DE6E
	ldrh r0, [r2, #4]
	subs r0, #0x18
	b _0803DE82
_0803DE6E:
	ldrh r0, [r2, #4]
	adds r0, #0x18
	b _0803DE82
_0803DE74:
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0, #2]
	subs r1, #0x60
	strh r1, [r4, #2]
	ldrh r0, [r0, #4]
_0803DE82:
	strh r0, [r4, #4]
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x58
	bgt _0803DE9A
	cmp r0, #0x57
	blt _0803DE9A
	movs r0, #0
	b _0803DEC4
_0803DE9A:
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r7
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0803DEBE
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	b _0803DEC4
_0803DEBE:
	ldrh r1, [r4]
	ldr r0, _0803DECC @ =0x00007FFF
	ands r0, r1
_0803DEC4:
	strh r0, [r4]
_0803DEC6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803DECC: .4byte 0x00007FFF

	thumb_func_start EvirProjectileInit
EvirProjectileInit: @ 0x0803DED0
	push {r4, r5, lr}
	ldr r0, _0803DF44 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x26
	movs r4, #0
	movs r3, #1
	strb r3, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r2, #0
	ldr r1, _0803DF48 @ =0x0000FFF4
	mov r5, ip
	strh r1, [r5, #0xa]
	movs r0, #0xc
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _0803DF4C @ =sEvirOam_356b84
	str r0, [r5, #0x18]
	strb r2, [r5, #0x1c]
	strh r4, [r5, #0x16]
	movs r1, #0x40
	movs r0, #0x40
	strh r0, [r5, #0x12]
	mov r0, ip
	adds r0, #0x2f
	strb r1, [r0]
	subs r0, #0xb
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x25
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x21
	strb r3, [r0]
	ldrh r0, [r5, #2]
	strh r0, [r5, #6]
	ldrh r0, [r5, #4]
	strh r0, [r5, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DF44: .4byte gCurrentSprite
_0803DF48: .4byte 0x0000FFF4
_0803DF4C: .4byte sEvirOam_356b84

	thumb_func_start EvirProjectileMovingInit
EvirProjectileMovingInit: @ 0x0803DF50
	ldr r1, _0803DF70 @ =gCurrentSprite
	ldr r2, _0803DF74 @ =sSecondarySpriteStats
	ldrb r0, [r1, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1, #0x14]
	ldrh r2, [r1]
	ldr r0, _0803DF78 @ =0x0000FFFB
	ands r0, r2
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803DF70: .4byte gCurrentSprite
_0803DF74: .4byte sSecondarySpriteStats
_0803DF78: .4byte 0x0000FFFB

	thumb_func_start EvirProjectileMoving
EvirProjectileMoving: @ 0x0803DF7C
	push {r4, r5, r6, lr}
	ldr r1, _0803DF90 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	adds r3, r1, #0
	cmp r0, #0
	bne _0803DF94
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0803E062
	.align 2, 0
_0803DF90: .4byte gCurrentSprite
_0803DF94:
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803DFA6
	strh r0, [r3]
	b _0803E062
_0803DFA6:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803DFB8
	adds r1, r3, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #4
	b _0803DFC0
_0803DFB8:
	adds r1, r3, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #4
_0803DFC0:
	strb r0, [r1]
	ldr r0, _0803E008 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803DFD4
	ldrh r0, [r3, #0x12]
	adds r0, #1
	strh r0, [r3, #0x12]
_0803DFD4:
	ldrh r4, [r3, #0x12]
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r5, [r0]
	ldr r1, _0803E00C @ =sSineTable
	lsls r0, r5, #1
	adds r0, r0, r1
	movs r6, #0
	ldrsh r2, [r0, r6]
	adds r6, r1, #0
	cmp r2, #0
	bge _0803E010
	rsbs r2, r2, #0
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	muls r0, r2, r0
	adds r4, r1, #0
	cmp r0, #0
	bge _0803DFFC
	adds r0, #0xff
_0803DFFC:
	lsls r0, r0, #8
	lsrs r2, r0, #0x10
	ldrh r0, [r3, #6]
	subs r0, r0, r2
	b _0803E026
	.align 2, 0
_0803E008: .4byte gFrameCounter8Bit
_0803E00C: .4byte sSineTable
_0803E010:
	lsls r1, r4, #0x10
	asrs r0, r1, #0x10
	muls r0, r2, r0
	adds r4, r1, #0
	cmp r0, #0
	bge _0803E01E
	adds r0, #0xff
_0803E01E:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	ldrh r1, [r3, #6]
	adds r0, r0, r1
_0803E026:
	strh r0, [r3, #2]
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _0803E04E
	rsbs r1, r1, #0
	asrs r0, r4, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _0803E044
	adds r0, #0xff
_0803E044:
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #8]
	subs r0, r0, r1
	b _0803E060
_0803E04E:
	asrs r0, r4, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _0803E058
	adds r0, #0xff
_0803E058:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	ldrh r6, [r3, #8]
	adds r0, r0, r6
_0803E060:
	strh r0, [r3, #4]
_0803E062:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EvirProjectileExplodingInit
EvirProjectileExplodingInit: @ 0x0803E068
	ldr r3, _0803E09C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	subs r1, #2
	movs r0, #0x38
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	ldr r0, _0803E0A0 @ =sEvirOam_356bac
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0803E09C: .4byte gCurrentSprite
_0803E0A0: .4byte sEvirOam_356bac

	thumb_func_start EvirProjectileExploding
EvirProjectileExploding: @ 0x0803E0A4
	push {r4, lr}
	ldr r4, _0803E0C4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803E0BC
	movs r0, #0
	strh r0, [r4]
_0803E0BC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803E0C4: .4byte gCurrentSprite

	thumb_func_start Evir
Evir: @ 0x0803E0C8
	push {r4, lr}
	ldr r4, _0803E100 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803E0E2
	movs r0, #0xd6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803E0E2:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E104
	bl SpriteUtilUpdateFreezeTimer
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x3b
	bl SpriteUtilUpdateSecondarySpritesFreezeTimer
	b _0803E2E6
	.align 2, 0
_0803E100: .4byte gCurrentSprite
_0803E104:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0803E110
	b _0803E2E6
_0803E110:
	lsls r0, r0, #2
	ldr r1, _0803E11C @ =_0803E120
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803E11C: .4byte _0803E120
_0803E120: @ jump table
	.4byte _0803E290 @ case 0
	.4byte _0803E296 @ case 1
	.4byte _0803E29A @ case 2
	.4byte _0803E2AA @ case 3
	.4byte _0803E2AE @ case 4
	.4byte _0803E2B4 @ case 5
	.4byte _0803E2E6 @ case 6
	.4byte _0803E2E6 @ case 7
	.4byte _0803E2E6 @ case 8
	.4byte _0803E2E6 @ case 9
	.4byte _0803E2E6 @ case 10
	.4byte _0803E2E6 @ case 11
	.4byte _0803E2E6 @ case 12
	.4byte _0803E2E6 @ case 13
	.4byte _0803E2E6 @ case 14
	.4byte _0803E2E6 @ case 15
	.4byte _0803E2E6 @ case 16
	.4byte _0803E2E6 @ case 17
	.4byte _0803E2E6 @ case 18
	.4byte _0803E2E6 @ case 19
	.4byte _0803E2E6 @ case 20
	.4byte _0803E2E6 @ case 21
	.4byte _0803E2E6 @ case 22
	.4byte _0803E2E6 @ case 23
	.4byte _0803E2E6 @ case 24
	.4byte _0803E2E6 @ case 25
	.4byte _0803E2E6 @ case 26
	.4byte _0803E2E6 @ case 27
	.4byte _0803E2E6 @ case 28
	.4byte _0803E2E6 @ case 29
	.4byte _0803E2E6 @ case 30
	.4byte _0803E2E6 @ case 31
	.4byte _0803E2E6 @ case 32
	.4byte _0803E2E6 @ case 33
	.4byte _0803E2E6 @ case 34
	.4byte _0803E2E6 @ case 35
	.4byte _0803E2E6 @ case 36
	.4byte _0803E2E6 @ case 37
	.4byte _0803E2E6 @ case 38
	.4byte _0803E2E6 @ case 39
	.4byte _0803E2E6 @ case 40
	.4byte _0803E2A0 @ case 41
	.4byte _0803E2A4 @ case 42
	.4byte _0803E2E6 @ case 43
	.4byte _0803E2E6 @ case 44
	.4byte _0803E2E6 @ case 45
	.4byte _0803E2E6 @ case 46
	.4byte _0803E2E6 @ case 47
	.4byte _0803E2E6 @ case 48
	.4byte _0803E2E6 @ case 49
	.4byte _0803E2E6 @ case 50
	.4byte _0803E2E6 @ case 51
	.4byte _0803E2E6 @ case 52
	.4byte _0803E2E6 @ case 53
	.4byte _0803E2E6 @ case 54
	.4byte _0803E2E6 @ case 55
	.4byte _0803E2E6 @ case 56
	.4byte _0803E2E6 @ case 57
	.4byte _0803E2E6 @ case 58
	.4byte _0803E2E6 @ case 59
	.4byte _0803E2E6 @ case 60
	.4byte _0803E2E6 @ case 61
	.4byte _0803E2E6 @ case 62
	.4byte _0803E2E6 @ case 63
	.4byte _0803E2E6 @ case 64
	.4byte _0803E2E6 @ case 65
	.4byte _0803E2E6 @ case 66
	.4byte _0803E2E6 @ case 67
	.4byte _0803E2E6 @ case 68
	.4byte _0803E2E6 @ case 69
	.4byte _0803E2E6 @ case 70
	.4byte _0803E2E6 @ case 71
	.4byte _0803E2E6 @ case 72
	.4byte _0803E2E6 @ case 73
	.4byte _0803E2E6 @ case 74
	.4byte _0803E2E6 @ case 75
	.4byte _0803E2E6 @ case 76
	.4byte _0803E2E6 @ case 77
	.4byte _0803E2E6 @ case 78
	.4byte _0803E2E6 @ case 79
	.4byte _0803E2E6 @ case 80
	.4byte _0803E2E6 @ case 81
	.4byte _0803E2E6 @ case 82
	.4byte _0803E2E6 @ case 83
	.4byte _0803E2E6 @ case 84
	.4byte _0803E2E6 @ case 85
	.4byte _0803E2E6 @ case 86
	.4byte _0803E2BA @ case 87
	.4byte _0803E2CA @ case 88
	.4byte _0803E2D4 @ case 89
	.4byte _0803E2D8 @ case 90
	.4byte _0803E2DE @ case 91
_0803E290:
	bl EvirInit
	b _0803E2E6
_0803E296:
	bl EvirIdleInit
_0803E29A:
	bl EvirIdle
	b _0803E2E6
_0803E2A0:
	bl EvirShootingInit
_0803E2A4:
	bl EvirShooting
	b _0803E2E6
_0803E2AA:
	bl EvirTurningAroundInit
_0803E2AE:
	bl EvirTurningAround
	b _0803E2E6
_0803E2B4:
	bl EvirTurningAroundSecondPart
	b _0803E2E6
_0803E2BA:
	ldr r0, _0803E2D0 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r1, [r0]
	movs r0, #0x3b
	bl SpriteUtilUnfreezeSecondarySprites
	bl SpriteDyingInit
_0803E2CA:
	bl SpriteDying
	b _0803E2E6
	.align 2, 0
_0803E2D0: .4byte gCurrentSprite
_0803E2D4:
	bl EvirInit
_0803E2D8:
	bl EvirSpawningFromX
	b _0803E2E6
_0803E2DE:
	bl EvirTurningIntoX
	bl XParasiteInit
_0803E2E6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EvirCollision
EvirCollision: @ 0x0803E2EC
	push {r4, r5, r6, r7, lr}
	ldr r7, _0803E350 @ =gSpriteData
	ldr r3, _0803E354 @ =gCurrentSprite
	movs r0, #0x23
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r7
	adds r5, r0, #0
	adds r5, #0x2c
	ldrb r4, [r5]
	movs r0, #0x7f
	adds r6, r3, #0
	adds r6, #0x2c
	ldrb r2, [r6]
	adds r1, r0, #0
	ands r1, r4
	ands r0, r2
	cmp r1, r0
	bhs _0803E33C
	movs r0, #0x80
	ands r0, r4
	strb r0, [r5]
	mov r1, ip
	ldrb r0, [r1]
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r7
	adds r1, #0x2c
	ldrb r0, [r6]
	adds r0, #1
	movs r2, #0x7f
	ands r0, r2
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0803E33C:
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E358
	bl SpriteUtilUpdateFreezeTimer
	bl SpriteUtilUpdatePrimarySpriteFreezeTimer
	b _0803E36A
	.align 2, 0
_0803E350: .4byte gSpriteData
_0803E354: .4byte gCurrentSprite
_0803E358:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803E366
	bl EvirCollisionInit
_0803E366:
	bl EvirCollisionIdle
_0803E36A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EvirProjectile
EvirProjectile: @ 0x0803E370
	push {lr}
	ldr r0, _0803E388 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803E39C
	cmp r0, #1
	bgt _0803E38C
	cmp r0, #0
	beq _0803E396
	b _0803E3AC
	.align 2, 0
_0803E388: .4byte gCurrentSprite
_0803E38C:
	cmp r0, #2
	beq _0803E3A0
	cmp r0, #0x38
	beq _0803E3A6
	b _0803E3AC
_0803E396:
	bl EvirProjectileInit
	b _0803E3B0
_0803E39C:
	bl EvirProjectileMovingInit
_0803E3A0:
	bl EvirProjectileMoving
	b _0803E3B0
_0803E3A6:
	bl EvirProjectileExploding
	b _0803E3B0
_0803E3AC:
	bl EvirProjectileExplodingInit
_0803E3B0:
	pop {r0}
	bx r0
