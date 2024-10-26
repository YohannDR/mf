    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ZebesianGroundCheckInShootingRange
ZebesianGroundCheckInShootingRange: @ 0x0803FD28
	push {r4, lr}
	ldr r0, _0803FD70 @ =gSamusData
	movs r2, #0x26
	ldrsh r1, [r0, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	ldrh r0, [r0, #0x18]
	adds r1, r1, r0
	ldr r4, _0803FD74 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	cmp r1, r0
	bgt _0803FD8C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xd0
	lsls r2, r2, #2
	movs r0, #0xc0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	adds r3, r0, #0
	cmp r3, #3
	bne _0803FD78
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x17
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	movs r0, #3
	b _0803FDCC
	.align 2, 0
_0803FD70: .4byte gSamusData
_0803FD74: .4byte gCurrentSprite
_0803FD78:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803FD90
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FD90
_0803FD8C:
	movs r0, #0
	b _0803FDCC
_0803FD90:
	movs r0, #0xc0
	lsls r0, r0, #1
	movs r2, #0xd0
	lsls r2, r2, #2
	adds r1, r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	adds r3, r0, #0
	cmp r3, #3
	bne _0803FDB4
	ldr r0, _0803FDB0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x29
	strb r1, [r0]
	b _0803FDC8
	.align 2, 0
_0803FDB0: .4byte gCurrentSprite
_0803FDB4:
	cmp r3, #0xc
	bne _0803FDC8
	ldr r1, _0803FDD4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #3
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
_0803FDC8:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
_0803FDCC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803FDD4: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundCheckCollidingWithAir
ZebesianGroundCheckCollidingWithAir: @ 0x0803FDD8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0803FE0C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803FE10 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803FE02
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0803FE02
	movs r6, #1
_0803FE02:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803FE0C: .4byte gCurrentSprite
_0803FE10: .4byte gPreviousCollisionCheck

	thumb_func_start ZebesianGroundSetIdleHitbox
ZebesianGroundSetIdleHitbox: @ 0x0803FE14
	push {lr}
	ldr r2, _0803FE34 @ =gCurrentSprite
	movs r3, #0
	movs r1, #0
	ldr r0, _0803FE38 @ =0x0000FF40
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803FE40
	ldr r0, _0803FE3C @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x38
	b _0803FE46
	.align 2, 0
_0803FE34: .4byte gCurrentSprite
_0803FE38: .4byte 0x0000FF40
_0803FE3C: .4byte 0x0000FFE0
_0803FE40:
	ldr r0, _0803FE4C @ =0x0000FFC8
	strh r0, [r2, #0xe]
	movs r0, #0x20
_0803FE46:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0803FE4C: .4byte 0x0000FFC8

	thumb_func_start ZebesianGroundSetShootingHitbox
ZebesianGroundSetShootingHitbox: @ 0x0803FE50
	push {lr}
	ldr r0, _0803FE64 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0803FE6C
	ldr r0, _0803FE68 @ =0x0000FF80
	b _0803FE6E
	.align 2, 0
_0803FE64: .4byte gCurrentSprite
_0803FE68: .4byte 0x0000FF80
_0803FE6C:
	ldr r0, _0803FE88 @ =0x0000FF40
_0803FE6E:
	strh r0, [r2, #0xa]
	movs r3, #0
	movs r0, #0
	strh r0, [r2, #0xc]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803FE90
	ldr r0, _0803FE8C @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x70
	b _0803FE96
	.align 2, 0
_0803FE88: .4byte 0x0000FF40
_0803FE8C: .4byte 0x0000FFE0
_0803FE90:
	ldr r0, _0803FE9C @ =0x0000FF90
	strh r0, [r2, #0xe]
	movs r0, #0x20
_0803FE96:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0803FE9C: .4byte 0x0000FF90

	thumb_func_start ZebesianGroundInit
ZebesianGroundInit: @ 0x0803FEA0
	push {r4, lr}
	ldr r4, _0803FEB8 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0803FEBC
	movs r0, #0x5a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	b _0803FF22
	.align 2, 0
_0803FEB8: .4byte gCurrentSprite
_0803FEBC:
	ldrb r0, [r4, #0x1d]
	cmp r0, #0xb4
	bne _0803FEE2
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0803FED4
	movs r0, #0
	strh r0, [r4]
	b _0803FF6E
_0803FED4:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #2
	orrs r0, r1
	strb r0, [r2]
	b _0803FF10
_0803FEE2:
	bl SpriteUtilTrySetAbsorbXFlag
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0803FF10
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0803FF0A
	strh r0, [r4]
	b _0803FF6E
_0803FF0A:
	adds r0, r4, #0
	adds r0, #0x36
	strb r2, [r0]
_0803FF10:
	bl SpriteUtilChooseRandomXFlip
	ldr r1, _0803FF74 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #2
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
_0803FF22:
	strb r0, [r1]
	ldr r0, _0803FF74 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x25
	movs r3, #0
	movs r0, #2
	strb r0, [r1]
	ldr r2, _0803FF78 @ =sPrimarySpriteStats
	mov r0, ip
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0
	mov r2, ip
	strh r0, [r2, #0x14]
	adds r2, #0x27
	movs r0, #0x38
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x28
	strb r1, [r0]
	adds r2, #2
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, _0803FF7C @ =sZebesianGroundOam_35c190
	mov r2, ip
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r3, [r2, #0x16]
	mov r0, ip
	adds r0, #0x2f
	strb r1, [r0]
	bl ZebesianGroundSetIdleHitbox
_0803FF6E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803FF74: .4byte gCurrentSprite
_0803FF78: .4byte sPrimarySpriteStats
_0803FF7C: .4byte sZebesianGroundOam_35c190

	thumb_func_start ZebesianGroundSpawningFromX
ZebesianGroundSpawningFromX: @ 0x0803FF80
	push {lr}
	ldr r3, _0803FFB4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0803FFC0
	ldr r2, _0803FFB8 @ =gWrittenToMosaic_H
	ldr r1, _0803FFBC @ =sXParasiteMosaicValues
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0803FFFC
	.align 2, 0
_0803FFB4: .4byte gCurrentSprite
_0803FFB8: .4byte gWrittenToMosaic_H
_0803FFBC: .4byte sXParasiteMosaicValues
_0803FFC0:
	ldrb r0, [r3, #0x1d]
	cmp r0, #0xb4
	bne _0803FFE8
	strb r1, [r3, #0x1f]
	movs r0, #0xb3
	strb r0, [r3, #0x1d]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	ldrh r0, [r3, #2]
	subs r0, #0x40
	strh r0, [r3, #2]
	b _0803FFFC
_0803FFE8:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _08040000 @ =0x0000FFDF
	ands r0, r1
	ldr r1, _08040004 @ =0x00007FFF
	ands r0, r1
	strh r0, [r3]
_0803FFFC:
	pop {r0}
	bx r0
	.align 2, 0
_08040000: .4byte 0x0000FFDF
_08040004: .4byte 0x00007FFF

	thumb_func_start ZebesianPreAquaTurningintoX
ZebesianPreAquaTurningintoX: @ 0x08040008
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, _08040068 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0804006C
	ldrb r1, [r4, #0x1d]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r0, [r5]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x60
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0xb9
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r4, #0x1d]
	ldrb r3, [r6]
	ldrb r0, [r5]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x98
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0xb9
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _080400B0
	.align 2, 0
_08040068: .4byte gCurrentSprite
_0804006C:
	ldrb r1, [r4, #0x1d]
	adds r7, r4, #0
	adds r7, #0x23
	ldrb r3, [r7]
	adds r6, r4, #0
	adds r6, #0x2a
	ldrb r0, [r6]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x60
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0xb9
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r4, #0x1d]
	ldrb r3, [r7]
	ldrb r0, [r6]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x98
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	adds r0, #0x10
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0xb9
	movs r2, #0
	bl SpriteSpawnNewXParasite
_080400B0:
	ldr r1, _080400C0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080400C0: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundTurningIntoX
ZebesianGroundTurningIntoX: @ 0x080400C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r6, _08040168 @ =gCurrentSprite
	ldrb r0, [r6, #0x1d]
	cmp r0, #0xa2
	bne _0804016C
	adds r1, r0, #0
	movs r0, #0x23
	adds r0, r0, r6
	mov r8, r0
	ldrb r3, [r0]
	adds r7, r6, #0
	adds r7, #0x2a
	ldrb r0, [r7]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x1c
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	subs r0, #0x18
	str r0, [sp, #8]
	movs r5, #0x40
	str r5, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r6, #0x1d]
	mov r0, r8
	ldrb r3, [r0]
	ldrb r0, [r7]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x38
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	adds r0, #0x18
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r6, #0x1d]
	mov r0, r8
	ldrb r3, [r0]
	ldrb r0, [r7]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x54
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	subs r0, #0xc
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrb r1, [r6, #0x1d]
	mov r0, r8
	ldrb r3, [r0]
	ldrb r0, [r7]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x70
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	adds r0, #0xc
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r6, #2]
	subs r0, #0x8c
	strh r0, [r6, #2]
	b _080401D4
	.align 2, 0
_08040168: .4byte gCurrentSprite
_0804016C:
	ldrh r1, [r6]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080401A2
	ldrb r1, [r6, #0x1d]
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x60
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	adds r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r6, #4]
	subs r0, #0x10
	b _080401CA
_080401A2:
	ldrb r1, [r6, #0x1d]
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r6, #2]
	subs r0, #0x60
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	subs r0, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r6, #4]
	adds r0, #0x10
_080401CA:
	strh r0, [r6, #4]
	ldr r1, _080401E0 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x98
	strh r0, [r1, #2]
_080401D4:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080401E0: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundFallingInit
ZebesianGroundFallingInit: @ 0x080401E4
	push {lr}
	ldr r3, _08040208 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	ldr r0, _0804020C @ =sZebesianGroundOam_35c200
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bl ZebesianGroundSetIdleHitbox
	pop {r0}
	bx r0
	.align 2, 0
_08040208: .4byte gCurrentSprite
_0804020C: .4byte sZebesianGroundOam_35c200

	thumb_func_start ZebesianGroundIdleInit
ZebesianGroundIdleInit: @ 0x08040210
	push {r4, lr}
	ldr r4, _08040234 @ =gCurrentSprite
	ldr r0, _08040238 @ =sZebesianGroundOam_35c190
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bl ZebesianGroundSetIdleHitbox
	ldrh r0, [r4, #4]
	strh r0, [r4, #8]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040234: .4byte gCurrentSprite
_08040238: .4byte sZebesianGroundOam_35c190

	thumb_func_start ZebesianGroundIdle
ZebesianGroundIdle: @ 0x0804023C
	push {r4, r5, r6, r7, lr}
	ldr r4, _08040264 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0804024E
	b _08040410
_0804024E:
	movs r7, #0
	bl ZebesianGroundCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040268
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	b _0804040E
	.align 2, 0
_08040264: .4byte gCurrentSprite
_08040268:
	bl SpriteUtilAlignYPosOnSlope
	ldr r0, _080402A4 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r6, #0xf0
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08040344
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080402E0
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080402A8 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080402AC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x60
	b _080402FC
	.align 2, 0
_080402A4: .4byte gPreviousVerticalCollisionCheck
_080402A8: .4byte gPreviousCollisionCheck
_080402AC:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0804030C
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0804030C
	ldrh r0, [r4, #4]
	adds r0, #4
	b _08040358
_080402E0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08040310 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08040314
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x60
_080402FC:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	movs r7, #2
	cmp r0, #0
	bne _0804035A
_0804030C:
	movs r7, #1
	b _0804035A
	.align 2, 0
_08040310: .4byte gPreviousCollisionCheck
_08040314:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0804030C
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0804030C
	b _08040354
_08040344:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040354
	ldrh r0, [r4, #4]
	adds r0, #4
	b _08040358
_08040354:
	ldrh r0, [r4, #4]
	subs r0, #4
_08040358:
	strh r0, [r4, #4]
_0804035A:
	ldr r2, _0804037C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08040396
	ldrh r0, [r2, #0x16]
	cmp r0, #2
	bne _08040384
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _08040384
	ldr r0, _08040380 @ =0x000001AF
	bl SoundPlay
	b _08040396
	.align 2, 0
_0804037C: .4byte gCurrentSprite
_08040380: .4byte 0x000001AF
_08040384:
	ldrh r0, [r2, #0x16]
	cmp r0, #6
	bne _08040396
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _08040396
	ldr r0, _080403B0 @ =0x000001AF
	bl SoundPlay
_08040396:
	bl ZebesianGroundCheckInShootingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040410
	cmp r7, #1
	bne _080403B8
	ldr r0, _080403B4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #9
	strb r1, [r0]
	b _08040410
	.align 2, 0
_080403B0: .4byte 0x000001AF
_080403B4: .4byte gCurrentSprite
_080403B8:
	cmp r7, #2
	bne _080403D0
	ldr r1, _080403CC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x17
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #1
	b _0804040E
	.align 2, 0
_080403CC: .4byte gCurrentSprite
_080403D0:
	ldr r2, _080403F8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _08040410
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080403FC
	ldrh r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	cmp r0, r1
	bge _08040410
	b _08040408
	.align 2, 0
_080403F8: .4byte gCurrentSprite
_080403FC:
	ldrh r0, [r2, #8]
	ldr r1, _08040418 @ =0xFFFFFF00
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	cmp r0, r1
	ble _08040410
_08040408:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #9
_0804040E:
	strb r0, [r1]
_08040410:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040418: .4byte 0xFFFFFF00

	thumb_func_start ZebesianGroundTurningAroundInit
ZebesianGroundTurningAroundInit: @ 0x0804041C
	ldr r1, _08040434 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #4
	strb r0, [r2]
	ldr r0, _08040438 @ =sZebesianGroundOam_35c328
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_08040434: .4byte gCurrentSprite
_08040438: .4byte sZebesianGroundOam_35c328

	thumb_func_start ZebesianGroundTurningAround
ZebesianGroundTurningAround: @ 0x0804043C
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08040462
	ldr r2, _08040468 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0804046C @ =sZebesianGroundOam_35c348
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_08040462:
	pop {r0}
	bx r0
	.align 2, 0
_08040468: .4byte gCurrentSprite
_0804046C: .4byte sZebesianGroundOam_35c348

	thumb_func_start ZebesianGroundTurningAroundSecondPart
ZebesianGroundTurningAroundSecondPart: @ 0x08040470
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804049A
	ldr r1, _08040490 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	beq _08040494
	movs r0, #0
	strb r0, [r2]
	adds r1, #0x24
	movs r0, #0x29
	b _08040498
	.align 2, 0
_08040490: .4byte gCurrentSprite
_08040494:
	adds r1, #0x24
	movs r0, #1
_08040498:
	strb r0, [r1]
_0804049A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianGroundJumpWarningInit
ZebesianGroundJumpWarningInit: @ 0x080404A0
	ldr r1, _080404B4 @ =gCurrentSprite
	ldr r0, _080404B8 @ =sZebesianGroundOam_35c2d8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	bx lr
	.align 2, 0
_080404B4: .4byte gCurrentSprite
_080404B8: .4byte sZebesianGroundOam_35c2d8

	thumb_func_start ZebesianGroundJumpWarning
ZebesianGroundJumpWarning: @ 0x080404BC
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _080404F6
	ldr r3, _080404FC @ =gCurrentSprite
	ldr r0, _08040500 @ =sZebesianGroundOam_35c300
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	movs r2, #0
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldr r0, _08040504 @ =0x0000FF60
	strh r0, [r3, #0xa]
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080404F6
	ldr r0, _08040508 @ =0x000001AD
	bl SoundPlayNotAlreadyPlaying
_080404F6:
	pop {r0}
	bx r0
	.align 2, 0
_080404FC: .4byte gCurrentSprite
_08040500: .4byte sZebesianGroundOam_35c300
_08040504: .4byte 0x0000FF60
_08040508: .4byte 0x000001AD

	thumb_func_start ZebesianGroundJumping
ZebesianGroundJumping: @ 0x0804050C
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _08040548 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040550
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804054C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08040576
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08040576
	ldrh r0, [r4, #4]
	adds r0, #0xa
	b _08040584
	.align 2, 0
_08040548: .4byte gCurrentSprite
_0804054C: .4byte gPreviousCollisionCheck
_08040550:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804057C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08040576
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08040580
_08040576:
	movs r6, #1
	b _08040586
	.align 2, 0
_0804057C: .4byte gPreviousCollisionCheck
_08040580:
	ldrh r0, [r4, #4]
	subs r0, #0xa
_08040584:
	strh r0, [r4, #4]
_08040586:
	ldr r1, _080405B4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0
	beq _080405BC
	ldr r0, _080405B8 @ =sZebesianGroundJumpingSpeedLow
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	lsrs r1, r1, #1
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldrb r0, [r2]
	cmp r0, #0x12
	bhi _080405DC
	b _080405D8
	.align 2, 0
_080405B4: .4byte gCurrentSprite
_080405B8: .4byte sZebesianGroundJumpingSpeedLow
_080405BC:
	ldr r0, _080405FC @ =sZebesianGroundJumpingSpeedHigh
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r1, [r2]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #2]
	ldrb r0, [r2]
	cmp r0, #0x26
	bhi _080405DC
_080405D8:
	adds r0, #1
	strb r0, [r2]
_080405DC:
	lsls r0, r1, #0x10
	cmp r0, #0
	ble _08040640
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _08040600 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08040604
	strh r1, [r4, #2]
	bl ZebesianGroundLandingInit
	b _0804067A
	.align 2, 0
_080405FC: .4byte sZebesianGroundJumpingSpeedHigh
_08040600: .4byte gPreviousVerticalCollisionCheck
_08040604:
	cmp r6, #0
	bne _0804067A
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08040632
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804062E
	movs r6, #1
_0804062E:
	cmp r6, #0
	beq _0804067A
_08040632:
	ldr r0, _0804063C @ =gCurrentSprite
	strh r1, [r0, #2]
	bl ZebesianGroundLandingInit
	b _0804067A
	.align 2, 0
_0804063C: .4byte gCurrentSprite
_08040640:
	movs r6, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08040680 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08040676
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08040672
	movs r6, #1
_08040672:
	cmp r6, #0
	beq _0804067A
_08040676:
	bl ZebesianGroundFallingInit
_0804067A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040680: .4byte gPreviousCollisionCheck

	thumb_func_start ZebesianGroundLandingInit
ZebesianGroundLandingInit: @ 0x08040684
	push {lr}
	ldr r1, _080406B0 @ =gCurrentSprite
	ldr r0, _080406B4 @ =sZebesianGroundOam_35c310
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080406AC
	movs r0, #0xd7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080406AC:
	pop {r0}
	bx r0
	.align 2, 0
_080406B0: .4byte gCurrentSprite
_080406B4: .4byte sZebesianGroundOam_35c310

	thumb_func_start ZebesianGroundLanding
ZebesianGroundLanding: @ 0x080406B8
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _0804077C
	ldr r4, _080406DC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080406E0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0804077C
	.align 2, 0
_080406DC: .4byte gCurrentSprite
_080406E0:
	bl ZebesianGroundCheckInShootingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804077C
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804072C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08040728 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08040762
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0804075E
	b _08040762
	.align 2, 0
_08040728: .4byte gPreviousCollisionCheck
_0804072C:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804076C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08040762
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0804075E
	movs r7, #1
_0804075E:
	cmp r7, #0
	beq _08040774
_08040762:
	ldr r0, _08040770 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
	b _0804077A
	.align 2, 0
_0804076C: .4byte gPreviousCollisionCheck
_08040770: .4byte gCurrentSprite
_08040774:
	ldr r0, _08040784 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
_0804077A:
	strb r1, [r0]
_0804077C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040784: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundWaitingInit
ZebesianGroundWaitingInit: @ 0x08040788
	push {lr}
	ldr r1, _080407A4 @ =gCurrentSprite
	ldr r0, _080407A8 @ =sZebesianGroundOam_35c1d8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	bl ZebesianGroundSetIdleHitbox
	pop {r0}
	bx r0
	.align 2, 0
_080407A4: .4byte gCurrentSprite
_080407A8: .4byte sZebesianGroundOam_35c1d8

	thumb_func_start ZebesianGroundWaiting
ZebesianGroundWaiting: @ 0x080407AC
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _080407BE
	ldr r0, _080407C4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_080407BE:
	pop {r0}
	bx r0
	.align 2, 0
_080407C4: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundStandingInit
ZebesianGroundStandingInit: @ 0x080407C8
	ldr r1, _080407EC @ =gCurrentSprite
	ldr r0, _080407F0 @ =sZebesianGroundOam_35c1d8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0xa
	strb r0, [r2]
	ldr r0, _080407F4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #2
	adds r0, #2
	adds r1, #0x2f
	strb r0, [r1]
	bx lr
	.align 2, 0
_080407EC: .4byte gCurrentSprite
_080407F0: .4byte sZebesianGroundOam_35c1d8
_080407F4: .4byte gSpriteRandomNumber

	thumb_func_start ZebesianGroundStanding
ZebesianGroundStanding: @ 0x080407F8
	push {lr}
	bl ZebesianGroundCheckInShootingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040824
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _08040824
	ldr r1, _08040828 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040824
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_08040824:
	pop {r0}
	bx r0
	.align 2, 0
_08040828: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundShootingInit
ZebesianGroundShootingInit: @ 0x0804082C
	push {r4, lr}
	ldr r4, _08040858 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x46
	strb r0, [r1]
	bl SpriteUtilSamusCheckCrouchingOrMorphed
	cmp r0, #0
	beq _08040860
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0804085C @ =sZebesianGroundOam_35c278
	b _0804086A
	.align 2, 0
_08040858: .4byte gCurrentSprite
_0804085C: .4byte sZebesianGroundOam_35c278
_08040860:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08040878 @ =sZebesianGroundOam_35c210
_0804086A:
	str r0, [r4, #0x18]
	bl ZebesianGroundSetShootingHitbox
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040878: .4byte sZebesianGroundOam_35c210

	thumb_func_start ZebesianGroundShooting
ZebesianGroundShooting: @ 0x0804087C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, _080408DC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08040912
	ldrh r0, [r4, #0x16]
	cmp r0, #6
	beq _08040894
	b _080409A0
_08040894:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	beq _0804089C
	b _080409A0
_0804089C:
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080408E0
	ldrb r2, [r4, #0x1f]
	adds r5, r4, #0
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x58
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x18
	b _0804095A
	.align 2, 0
_080408DC: .4byte gCurrentSprite
_080408E0:
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x58
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x18
	str r0, [sp, #4]
	str r5, [sp, #8]
	b _0804095E
_08040912:
	ldrh r0, [r4, #0x16]
	cmp r0, #7
	bne _080409A0
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _080409A0
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _08040968
	ldrb r2, [r4, #0x1f]
	adds r5, r4, #0
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x78
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x60
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x68
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x10
_0804095A:
	str r0, [sp, #4]
	str r6, [sp, #8]
_0804095E:
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	b _080409A0
_08040968:
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x78
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x60
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x68
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x10
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x3f
	movs r1, #0
	bl SpriteSpawnSecondary
_080409A0:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _080409B0
	ldr r0, _080409B8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2b
	strb r1, [r0]
_080409B0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080409B8: .4byte gCurrentSprite

	thumb_func_start ZebesianGroundShootingEndInit
ZebesianGroundShootingEndInit: @ 0x080409BC
	push {lr}
	ldr r1, _080409D8 @ =gCurrentSprite
	ldr r0, _080409DC @ =sZebesianGroundOam_35c1d8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	bl ZebesianGroundSetIdleHitbox
	pop {r0}
	bx r0
	.align 2, 0
_080409D8: .4byte gCurrentSprite
_080409DC: .4byte sZebesianGroundOam_35c1d8

	thumb_func_start ZebesianGroundShootingEnd
ZebesianGroundShootingEnd: @ 0x080409E0
	push {r4, r5, r6, lr}
	ldr r0, _08040A24 @ =gSamusData
	movs r2, #0x26
	ldrsh r1, [r0, r2]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	ldrh r0, [r0, #0x18]
	adds r1, r1, r0
	ldr r4, _08040A28 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	cmp r1, r0
	bgt _08040A6E
	movs r1, #0x80
	lsls r1, r1, #1
	movs r6, #0xd0
	lsls r6, r6, #2
	movs r0, #0xc0
	adds r2, r6, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	cmp r0, #3
	bne _08040A2C
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x17
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	b _08040A76
	.align 2, 0
_08040A24: .4byte gSamusData
_08040A28: .4byte gCurrentSprite
_08040A2C:
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #0
	beq _08040A3A
	subs r0, #1
	strb r0, [r5]
_08040A3A:
	movs r0, #0xc0
	lsls r0, r0, #1
	adds r1, r6, #0
	adds r2, r6, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	cmp r0, #3
	bne _08040A58
	ldrb r0, [r5]
	cmp r0, #0
	bne _08040A76
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	b _08040A74
_08040A58:
	cmp r0, #0xc
	bne _08040A6E
	ldrb r0, [r5]
	cmp r0, #0
	bne _08040A76
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	adds r1, #0xb
	b _08040A72
_08040A6E:
	adds r1, r4, #0
	adds r1, #0x24
_08040A72:
	movs r0, #1
_08040A74:
	strb r0, [r1]
_08040A76:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ZebesianGroundBeamInit
ZebesianGroundBeamInit: @ 0x08040A7C
	push {r4, r5, r6, lr}
	ldr r0, _08040AEC @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r3, _08040AF0 @ =0x0000FFFB
	ands r3, r0
	movs r5, #0
	movs r4, #0
	mov r1, ip
	strh r3, [r1]
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
	movs r2, #0x30
	strb r2, [r0]
	ldr r0, _08040AF4 @ =0x0000FFF8
	mov r6, ip
	strh r0, [r6, #0xa]
	strh r1, [r6, #0xc]
	ldr r0, _08040AF8 @ =sZebesianGroundOam_35c398
	str r0, [r6, #0x18]
	strb r5, [r6, #0x1c]
	strh r4, [r6, #0x16]
	mov r0, ip
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	subs r1, #1
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x40
	ands r0, r3
	mov r1, ip
	cmp r0, #0
	beq _08040AFC
	movs r0, #0x10
	strh r0, [r1, #0xe]
	strh r2, [r1, #0x10]
	b _08040B04
	.align 2, 0
_08040AEC: .4byte gCurrentSprite
_08040AF0: .4byte 0x0000FFFB
_08040AF4: .4byte 0x0000FFF8
_08040AF8: .4byte sZebesianGroundOam_35c398
_08040AFC:
	ldr r0, _08040B1C @ =0x0000FFD0
	strh r0, [r1, #0xe]
	adds r0, #0x20
	strh r0, [r1, #0x10]
_08040B04:
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08040B14
	ldr r0, _08040B20 @ =0x0000015D
	bl SoundPlayNotAlreadyPlaying
_08040B14:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08040B1C: .4byte 0x0000FFD0
_08040B20: .4byte 0x0000015D

	thumb_func_start ZebesianGroundBeamSpawning
ZebesianGroundBeamSpawning: @ 0x08040B24
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08040B64
	ldr r2, _08040B54 @ =gCurrentSprite
	ldr r0, _08040B58 @ =sZebesianGroundOam_35c3c0
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040B5C
	movs r0, #0x20
	strh r0, [r2, #0xe]
	movs r0, #0x60
	b _08040B62
	.align 2, 0
_08040B54: .4byte gCurrentSprite
_08040B58: .4byte sZebesianGroundOam_35c3c0
_08040B5C:
	ldr r0, _08040B68 @ =0x0000FFA0
	strh r0, [r2, #0xe]
	adds r0, #0x40
_08040B62:
	strh r0, [r2, #0x10]
_08040B64:
	pop {r0}
	bx r0
	.align 2, 0
_08040B68: .4byte 0x0000FFA0

	thumb_func_start ZebesianGroundBeamFired
ZebesianGroundBeamFired: @ 0x08040B6C
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08040BAC
	ldr r2, _08040B9C @ =gCurrentSprite
	ldr r0, _08040BA0 @ =sZebesianGroundOam_35c368
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040BA4
	movs r0, #0x20
	strh r0, [r2, #0xe]
	movs r0, #0xa0
	b _08040BAA
	.align 2, 0
_08040B9C: .4byte gCurrentSprite
_08040BA0: .4byte sZebesianGroundOam_35c368
_08040BA4:
	ldr r0, _08040BB0 @ =0x0000FF60
	strh r0, [r2, #0xe]
	adds r0, #0x80
_08040BAA:
	strh r0, [r2, #0x10]
_08040BAC:
	pop {r0}
	bx r0
	.align 2, 0
_08040BB0: .4byte 0x0000FF60

	thumb_func_start ZebesianGroundCheckSkipMovement
ZebesianGroundCheckSkipMovement: @ 0x08040BB4
	push {lr}
	ldr r2, _08040BD4 @ =gCurrentSprite
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xb4
	bne _08040BDC
	ldr r0, _08040BD8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08040BDC
	ldrb r0, [r2, #0x1c]
	subs r0, #1
	strb r0, [r2, #0x1c]
	movs r0, #1
	b _08040BDE
	.align 2, 0
_08040BD4: .4byte gCurrentSprite
_08040BD8: .4byte gFrameCounter8Bit
_08040BDC:
	movs r0, #0
_08040BDE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ZebesianGround
ZebesianGround: @ 0x08040BE4
	push {r4, lr}
	ldr r4, _08040C1C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08040BFE
	movs r0, #0xaf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08040BFE:
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08040C20
	bl SpriteUtilUpdateFreezeTimer
	b _08040EF6
	.align 2, 0
_08040C1C: .4byte gCurrentSprite
_08040C20:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08040C2C
	b _08040EB8
_08040C2C:
	lsls r0, r0, #2
	ldr r1, _08040C38 @ =_08040C3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08040C38: .4byte _08040C3C
_08040C3C: @ jump table
	.4byte _08040DAC @ case 0
	.4byte _08040DB2 @ case 1
	.4byte _08040DB6 @ case 2
	.4byte _08040DF4 @ case 3
	.4byte _08040DF8 @ case 4
	.4byte _08040E08 @ case 5
	.4byte _08040EB8 @ case 6
	.4byte _08040DC8 @ case 7
	.4byte _08040DCC @ case 8
	.4byte _08040DDE @ case 9
	.4byte _08040DE2 @ case 10
	.4byte _08040EB8 @ case 11
	.4byte _08040EB8 @ case 12
	.4byte _08040EB8 @ case 13
	.4byte _08040EB8 @ case 14
	.4byte _08040EB8 @ case 15
	.4byte _08040EB8 @ case 16
	.4byte _08040EB8 @ case 17
	.4byte _08040EB8 @ case 18
	.4byte _08040EB8 @ case 19
	.4byte _08040EB8 @ case 20
	.4byte _08040E18 @ case 21
	.4byte _08040E1C @ case 22
	.4byte _08040E2C @ case 23
	.4byte _08040E30 @ case 24
	.4byte _08040EB8 @ case 25
	.4byte _08040E40 @ case 26
	.4byte _08040EB8 @ case 27
	.4byte _08040E50 @ case 28
	.4byte _08040EB8 @ case 29
	.4byte _08040EB8 @ case 30
	.4byte _08040EB8 @ case 31
	.4byte _08040EB8 @ case 32
	.4byte _08040EB8 @ case 33
	.4byte _08040EB8 @ case 34
	.4byte _08040EB8 @ case 35
	.4byte _08040EB8 @ case 36
	.4byte _08040EB8 @ case 37
	.4byte _08040EB8 @ case 38
	.4byte _08040EB8 @ case 39
	.4byte _08040EB8 @ case 40
	.4byte _08040E60 @ case 41
	.4byte _08040E64 @ case 42
	.4byte _08040E74 @ case 43
	.4byte _08040E78 @ case 44
	.4byte _08040EB8 @ case 45
	.4byte _08040EB8 @ case 46
	.4byte _08040EB8 @ case 47
	.4byte _08040EB8 @ case 48
	.4byte _08040EB8 @ case 49
	.4byte _08040EB8 @ case 50
	.4byte _08040EB8 @ case 51
	.4byte _08040EB8 @ case 52
	.4byte _08040EB8 @ case 53
	.4byte _08040EB8 @ case 54
	.4byte _08040EB8 @ case 55
	.4byte _08040EB8 @ case 56
	.4byte _08040EB8 @ case 57
	.4byte _08040EB8 @ case 58
	.4byte _08040EB8 @ case 59
	.4byte _08040EB8 @ case 60
	.4byte _08040EB8 @ case 61
	.4byte _08040EB8 @ case 62
	.4byte _08040EB8 @ case 63
	.4byte _08040EB8 @ case 64
	.4byte _08040EB8 @ case 65
	.4byte _08040EB8 @ case 66
	.4byte _08040EB8 @ case 67
	.4byte _08040EB8 @ case 68
	.4byte _08040EB8 @ case 69
	.4byte _08040EB8 @ case 70
	.4byte _08040EB8 @ case 71
	.4byte _08040EB8 @ case 72
	.4byte _08040EB8 @ case 73
	.4byte _08040EB8 @ case 74
	.4byte _08040EB8 @ case 75
	.4byte _08040EB8 @ case 76
	.4byte _08040EB8 @ case 77
	.4byte _08040EB8 @ case 78
	.4byte _08040EB8 @ case 79
	.4byte _08040EB8 @ case 80
	.4byte _08040EB8 @ case 81
	.4byte _08040EB8 @ case 82
	.4byte _08040EB8 @ case 83
	.4byte _08040EB8 @ case 84
	.4byte _08040EB8 @ case 85
	.4byte _08040EB8 @ case 86
	.4byte _08040E88 @ case 87
	.4byte _08040E8C @ case 88
	.4byte _08040E92 @ case 89
	.4byte _08040E96 @ case 90
	.4byte _08040E9C @ case 91
_08040DAC:
	bl ZebesianGroundInit
	b _08040EB8
_08040DB2:
	bl ZebesianGroundIdleInit
_08040DB6:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040DC2
	b _08040EF6
_08040DC2:
	bl ZebesianGroundIdle
	b _08040EB8
_08040DC8:
	bl ZebesianGroundWaitingInit
_08040DCC:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040DD8
	b _08040EF6
_08040DD8:
	bl ZebesianGroundWaiting
	b _08040EB8
_08040DDE:
	bl ZebesianGroundStandingInit
_08040DE2:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08040DEE
	b _08040EF6
_08040DEE:
	bl ZebesianGroundStanding
	b _08040EB8
_08040DF4:
	bl ZebesianGroundTurningAroundInit
_08040DF8:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundTurningAround
	b _08040EB8
_08040E08:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundTurningAroundSecondPart
	b _08040EB8
_08040E18:
	bl ZebesianGroundFallingInit
_08040E1C:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl SpriteUtilCurrentSpriteFalling
	b _08040EB8
_08040E2C:
	bl ZebesianGroundJumpWarningInit
_08040E30:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundJumpWarning
	b _08040EB8
_08040E40:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundJumping
	b _08040EB8
_08040E50:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundLanding
	b _08040EB8
_08040E60:
	bl ZebesianGroundShootingInit
_08040E64:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundShooting
	b _08040EB8
_08040E74:
	bl ZebesianGroundShootingEndInit
_08040E78:
	bl ZebesianGroundCheckSkipMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08040EF6
	bl ZebesianGroundShootingEnd
	b _08040EB8
_08040E88:
	bl SpriteDyingInit
_08040E8C:
	bl SpriteDying
	b _08040EB8
_08040E92:
	bl ZebesianGroundInit
_08040E96:
	bl ZebesianGroundSpawningFromX
	b _08040EB8
_08040E9C:
	ldr r0, _08040EAC @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	cmp r0, #0xb4
	bne _08040EB0
	bl ZebesianPreAquaTurningintoX
	b _08040EB8
	.align 2, 0
_08040EAC: .4byte gCurrentSprite
_08040EB0:
	bl ZebesianGroundTurningIntoX
	bl XParasiteInit
_08040EB8:
	ldr r2, _08040ED8 @ =gCurrentSprite
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xa2
	bne _08040EF6
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040EE0
	ldr r0, _08040EDC @ =gSamusData
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08040EF6
	b _08040EEC
	.align 2, 0
_08040ED8: .4byte gCurrentSprite
_08040EDC: .4byte gSamusData
_08040EE0:
	ldr r0, _08040EFC @ =gSamusData
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08040EF6
_08040EEC:
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
_08040EF6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08040EFC: .4byte gSamusData

	thumb_func_start ZebesianGroundBeam
ZebesianGroundBeam: @ 0x08040F00
	push {lr}
	ldr r0, _08040F18 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08040F28
	cmp r0, #2
	bgt _08040F1C
	cmp r0, #0
	beq _08040F22
	b _08040F32
	.align 2, 0
_08040F18: .4byte gCurrentSprite
_08040F1C:
	cmp r0, #0x18
	beq _08040F2E
	b _08040F32
_08040F22:
	bl ZebesianGroundBeamInit
	b _08040F32
_08040F28:
	bl ZebesianGroundBeamSpawning
	b _08040F32
_08040F2E:
	bl ZebesianGroundBeamFired
_08040F32:
	ldr r2, _08040F44 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08040F48
	ldrh r0, [r2, #4]
	adds r0, #0xa
	b _08040F4C
	.align 2, 0
_08040F44: .4byte gCurrentSprite
_08040F48:
	ldrh r0, [r2, #4]
	subs r0, #0xa
_08040F4C:
	strh r0, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0
