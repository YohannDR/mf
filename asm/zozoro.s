    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ZozoroCheckCollidingWithAir
ZozoroCheckCollidingWithAir: @ 0x0804FD44
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0804FD78 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804FDA4
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804FD80
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804FD7C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0804FDD8
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0804FDCC
	.align 2, 0
_0804FD78: .4byte gCurrentSprite
_0804FD7C: .4byte gPreviousCollisionCheck
_0804FD80:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804FDA0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0804FDD8
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0804FDCC
	.align 2, 0
_0804FDA0: .4byte gPreviousCollisionCheck
_0804FDA4:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804FDD8
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804FDE0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0804FDD8
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0804FDCC:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0804FDD8
	movs r6, #1
_0804FDD8:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0804FDE0: .4byte gPreviousCollisionCheck

	thumb_func_start ZozoroUpdateHitbox
ZozoroUpdateHitbox: @ 0x0804FDE4
	push {lr}
	ldr r1, _0804FE10 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0
	beq _0804FE34
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804FE1C
	ldr r0, _0804FE14 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	ldr r0, _0804FE18 @ =0x0000FFD0
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0804FE56
	.align 2, 0
_0804FE10: .4byte gCurrentSprite
_0804FE14: .4byte 0x0000FFD8
_0804FE18: .4byte 0x0000FFD0
_0804FE1C:
	ldr r0, _0804FE2C @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x28
	strh r0, [r2, #0xc]
	ldr r0, _0804FE30 @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x30
	b _0804FE56
	.align 2, 0
_0804FE2C: .4byte 0x0000FFD8
_0804FE30: .4byte 0x0000FFF0
_0804FE34:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804FE48
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x30
	b _0804FE4E
_0804FE48:
	ldr r0, _0804FE6C @ =0x0000FFD0
	strh r0, [r2, #0xa]
	movs r0, #0x10
_0804FE4E:
	strh r0, [r2, #0xc]
	ldr r0, _0804FE70 @ =0x0000FFD8
	strh r0, [r2, #0xe]
	movs r0, #0x28
_0804FE56:
	strh r0, [r2, #0x10]
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0804FE6C: .4byte 0x0000FFD0
_0804FE70: .4byte 0x0000FFD8

	thumb_func_start ZozoroSetCrawlingOam
ZozoroSetCrawlingOam: @ 0x0804FE74
	push {lr}
	ldr r0, _0804FE88 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0804FE90
	ldr r0, _0804FE8C @ =0x08387F64
	b _0804FE92
	.align 2, 0
_0804FE88: .4byte gCurrentSprite
_0804FE8C: .4byte 0x08387F64
_0804FE90:
	ldr r0, _0804FEA0 @ =0x08387ED4
_0804FE92:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0804FEA0: .4byte 0x08387ED4

	thumb_func_start ZozoroSetTurningAroundOam
ZozoroSetTurningAroundOam: @ 0x0804FEA4
	push {lr}
	ldr r0, _0804FEB8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0804FEC0
	ldr r0, _0804FEBC @ =0x08387FCC
	b _0804FEC2
	.align 2, 0
_0804FEB8: .4byte gCurrentSprite
_0804FEBC: .4byte 0x08387FCC
_0804FEC0:
	ldr r0, _0804FED0 @ =0x08387F3C
_0804FEC2:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0804FED0: .4byte 0x08387F3C

	thumb_func_start ZozoroTurningIntoX
ZozoroTurningIntoX: @ 0x0804FED4
	push {lr}
	ldr r2, _0804FEF4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804FF00
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804FEF8
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _0804FF18
	.align 2, 0
_0804FEF4: .4byte gCurrentSprite
_0804FEF8:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _0804FF18
_0804FF00:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804FF12
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _0804FF16
_0804FF12:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_0804FF16:
	strh r0, [r2, #2]
_0804FF18:
	pop {r0}
	bx r0

	thumb_func_start ZozoroInit
ZozoroInit: @ 0x0804FF1C
	push {r4, r5, r6, r7, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804FF48 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804FF4C
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804FF4C
	strh r0, [r2]
	b _0805008E
	.align 2, 0
_0804FF48: .4byte gCurrentSprite
_0804FF4C:
	ldr r0, _0804FF64 @ =gCurrentSprite
	adds r4, r0, #0
	adds r4, #0x24
	ldrb r1, [r4]
	adds r7, r0, #0
	cmp r1, #0x59
	bne _0804FF68
	movs r0, #0x5a
	strb r0, [r4]
	movs r0, #0x2c
	strh r0, [r7, #6]
	b _0805006E
	.align 2, 0
_0804FF64: .4byte gCurrentSprite
_0804FF68:
	bl SpriteUtilChooseRandomXDirection
	movs r0, #2
	strb r0, [r4]
	ldrh r0, [r7, #2]
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804FFA0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	movs r6, #0xf0
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #0
	beq _0804FFA4
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r7]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805006E
	movs r0, #0x40
	b _0805001C
	.align 2, 0
_0804FFA0: .4byte gPreviousCollisionCheck
_0804FFA4:
	ldrh r0, [r7, #2]
	subs r0, #0x44
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0804FFE0
	adds r0, r7, #0
	adds r0, #0x2d
	strb r4, [r0]
	ldrh r1, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r2, #0
	orrs r1, r0
	strh r1, [r7]
	ldrh r0, [r7, #2]
	subs r0, #0x40
	strh r0, [r7, #2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805006E
	movs r0, #0x40
	b _0805006A
_0804FFE0:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08050022
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r7, #2]
	subs r0, #0x20
	strh r0, [r7, #2]
	ldrh r0, [r7, #4]
	subs r0, #0x20
	strh r0, [r7, #4]
	ldrh r1, [r7]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805006E
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_0805001C:
	orrs r0, r1
	strh r0, [r7]
	b _0805006E
_08050022:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	adds r2, r6, #0
	ands r2, r0
	cmp r2, #0
	bne _0805003C
	strh r2, [r7]
	b _0805008E
_0805003C:
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r7]
	movs r0, #0x40
	movs r2, #0
	orrs r1, r0
	strh r1, [r7]
	ldrh r0, [r7, #2]
	subs r0, #0x20
	strh r0, [r7, #2]
	ldrh r0, [r7, #4]
	adds r0, #0x20
	strh r0, [r7, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805006E
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_0805006A:
	orrs r1, r0
	strh r1, [r7]
_0805006E:
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl ZozoroSetCrawlingOam
	bl ZozoroUpdateHitbox
	ldr r2, _08050094 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
_0805008E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050094: .4byte sPrimarySpriteStats

	thumb_func_start ZozoroIdleInit
ZozoroIdleInit: @ 0x08050098
	push {lr}
	bl ZozoroSetCrawlingOam
	ldr r2, _080500BC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _080500B8
	movs r0, #0xb4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080500B8:
	pop {r0}
	bx r0
	.align 2, 0
_080500BC: .4byte gCurrentSprite

	thumb_func_start ZozoroIdle
ZozoroIdle: @ 0x080500C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r0, #1
	mov sb, r0
	movs r1, #0
	mov r8, r1
	bl ZozoroCheckCollidingWithAir
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _080500E8
	ldr r1, _080500E4 @ =gCurrentSprite
	adds r1, #0x24
	movs r2, #0x15
	b _0805045A
	.align 2, 0
_080500E4: .4byte gCurrentSprite
_080500E8:
	ldr r3, _08050110 @ =gCurrentSprite
	ldr r4, _08050114 @ =sPrimarySpriteStats
	ldrb r2, [r3, #0x1d]
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r2, [r3, #0x14]
	adds r7, r3, #0
	ldrh r1, [r1]
	cmp r2, r1
	bhs _08050132
	adds r1, r7, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	cmp r1, #0
	beq _08050118
	adds r2, r7, #0
	b _0805030A
	.align 2, 0
_08050110: .4byte gCurrentSprite
_08050114: .4byte sPrimarySpriteStats
_08050118:
	ldrh r2, [r7]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r1, r2
	cmp r1, #0
	beq _08050128
	adds r2, r7, #0
	b _0805030A
_08050128:
	movs r2, #2
	mov sb, r2
	ldrb r0, [r7, #0x1c]
	adds r0, #1
	strb r0, [r7, #0x1c]
_08050132:
	adds r4, r7, #0
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08050220
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080501A0
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08050178
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08050174 @ =gPreviousCollisionCheck
	ldrb r2, [r5]
	movs r1, #0xf0
	ands r1, r2
	cmp r1, #0
	bne _0805016A
	b _080502A2
_0805016A:
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	b _080501C8
	.align 2, 0
_08050174: .4byte gPreviousCollisionCheck
_08050178:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0805019C @ =gPreviousCollisionCheck
	ldrb r2, [r5]
	movs r1, #0xf0
	ands r1, r2
	cmp r1, #0
	bne _08050190
	b _080502A2
_08050190:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	b _08050202
	.align 2, 0
_0805019C: .4byte gPreviousCollisionCheck
_080501A0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080501E4
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080501E0 @ =gPreviousCollisionCheck
	ldrb r2, [r5]
	movs r1, #0xf0
	ands r1, r2
	cmp r1, #0
	beq _080502A2
	ldrh r0, [r4, #2]
	adds r0, #0x30
	ldrh r1, [r4, #4]
_080501C8:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r2, [r5]
	movs r1, #0xf
	ands r1, r2
	cmp r1, #0
	bne _080502A2
	ldrh r1, [r4, #2]
	add r1, sb
	strh r1, [r4, #2]
	b _0805044E
	.align 2, 0
_080501E0: .4byte gPreviousCollisionCheck
_080501E4:
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0805021C @ =gPreviousCollisionCheck
	ldrb r2, [r5]
	movs r1, #0xf0
	ands r1, r2
	cmp r1, #0
	beq _080502A2
	ldrh r0, [r4, #2]
	subs r0, #0x30
	ldrh r1, [r4, #4]
_08050202:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r2, [r5]
	movs r1, #0xf
	ands r1, r2
	cmp r1, #0
	bne _080502A2
	ldrh r1, [r4, #2]
	mov r2, sb
	subs r1, r1, r2
	strh r1, [r4, #2]
	b _0805044E
	.align 2, 0
_0805021C: .4byte gPreviousCollisionCheck
_08050220:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080502BE
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08050274
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08050270 @ =gPreviousCollisionCheck
	ldrb r2, [r5]
	movs r6, #0xf
	adds r1, r6, #0
	ands r1, r2
	cmp r1, #0
	beq _080502A2
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r2, [r5]
	adds r1, r6, #0
	ands r1, r2
	cmp r1, #0
	bne _080502A2
	ldrh r1, [r4, #4]
	add r1, sb
	strh r1, [r4, #4]
	b _0805044E
	.align 2, 0
_08050270: .4byte gPreviousCollisionCheck
_08050274:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080502B0 @ =gPreviousCollisionCheck
	ldrb r2, [r5]
	movs r6, #0xf
	adds r1, r6, #0
	ands r1, r2
	cmp r1, #0
	beq _080502A2
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r2, [r5]
	adds r1, r6, #0
	ands r1, r2
	cmp r1, #0
	beq _080502B4
_080502A2:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	b _0805044E
	.align 2, 0
_080502B0: .4byte gPreviousCollisionCheck
_080502B4:
	ldrh r1, [r4, #4]
	mov r2, sb
	subs r1, r1, r2
	strh r1, [r4, #4]
	b _0805044E
_080502BE:
	bl unk_1129c
	ldr r5, _080502F4 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r5]
	adds r3, r1, #0
	cmp r3, #0
	bne _0805032C
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080502F8
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r1, [r5]
	cmp r1, #0
	beq _08050308
	cmp r1, #4
	beq _0805031C
	cmp r1, #2
	beq _080502F0
	b _08050442
_080502F0:
	b _0805031C
	.align 2, 0
_080502F4: .4byte gPreviousVerticalCollisionCheck
_080502F8:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r1, [r5]
	cmp r1, #0
	bne _08050312
_08050308:
	adds r2, r4, #0
_0805030A:
	adds r2, #0x24
	movs r1, #0x15
	strb r1, [r2]
	b _0805045C
_08050312:
	cmp r1, #5
	beq _0805031C
	cmp r1, #3
	beq _0805031C
	b _08050442
_0805031C:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	adds r1, r0, #0
	strh r1, [r4, #2]
	b _08050442
_0805032C:
	movs r5, #0xf0
	ands r5, r1
	cmp r5, #0
	beq _080503A4
	ldr r0, [r4, #0x18]
	ldr r1, _08050368 @ =0x08387ED4
	cmp r0, r1
	beq _08050342
	str r1, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r6, [r4, #0x16]
_08050342:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08050370
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0805036C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	cmp r1, #0
	beq _08050394
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x30
	b _0805038A
	.align 2, 0
_08050368: .4byte 0x08387ED4
_0805036C: .4byte gPreviousCollisionCheck
_08050370:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x30
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080503A0 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	cmp r1, #0
	beq _08050394
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x30
_0805038A:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	cmp r1, #0x11
	bne _08050442
_08050394:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	b _08050442
	.align 2, 0
_080503A0: .4byte gPreviousCollisionCheck
_080503A4:
	ldrh r2, [r4]
	movs r1, #0x40
	ands r1, r2
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r2, #0
	beq _080503F8
	cmp r3, #2
	bne _080503C0
	ldr r1, [r4, #0x18]
	ldr r2, _080503BC @ =0x08388054
	b _080503E8
	.align 2, 0
_080503BC: .4byte 0x08388054
_080503C0:
	cmp r3, #4
	bne _080503D0
	ldr r1, [r4, #0x18]
	ldr r2, _080503CC @ =0x08388114
	b _080503E8
	.align 2, 0
_080503CC: .4byte 0x08388114
_080503D0:
	cmp r3, #3
	bne _080503E0
	ldr r1, [r4, #0x18]
	ldr r2, _080503DC @ =0x08387FF4
	b _080503E8
	.align 2, 0
_080503DC: .4byte 0x08387FF4
_080503E0:
	cmp r3, #5
	bne _08050442
	ldr r1, [r4, #0x18]
	ldr r2, _080503F4 @ =0x083880B4
_080503E8:
	cmp r1, r2
	beq _08050442
	str r2, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r5, [r4, #0x16]
	b _08050442
	.align 2, 0
_080503F4: .4byte 0x083880B4
_080503F8:
	cmp r3, #3
	bne _08050408
	ldr r1, [r4, #0x18]
	ldr r3, _08050404 @ =0x08388054
	b _08050420
	.align 2, 0
_08050404: .4byte 0x08388054
_08050408:
	cmp r3, #5
	bne _08050418
	ldr r1, [r4, #0x18]
	ldr r3, _08050414 @ =0x08388114
	b _08050420
	.align 2, 0
_08050414: .4byte 0x08388114
_08050418:
	cmp r3, #2
	bne _08050430
	ldr r1, [r4, #0x18]
	ldr r3, _0805042C @ =0x08387FF4
_08050420:
	cmp r1, r3
	beq _08050442
	str r3, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	b _08050442
	.align 2, 0
_0805042C: .4byte 0x08387FF4
_08050430:
	cmp r3, #4
	bne _08050442
	ldr r1, [r7, #0x18]
	ldr r3, _08050468 @ =0x083880B4
	cmp r1, r3
	beq _08050442
	str r3, [r7, #0x18]
	strb r2, [r7, #0x1c]
	strh r2, [r7, #0x16]
_08050442:
	mov r1, r8
	cmp r1, #0
	bne _08050454
	mov r0, sb
	bl unk_1169c
_0805044E:
	mov r2, r8
	cmp r2, #0
	beq _0805045C
_08050454:
	ldr r1, _0805046C @ =gCurrentSprite
	adds r1, #0x24
	movs r2, #3
_0805045A:
	strb r2, [r1]
_0805045C:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08050468: .4byte 0x083880B4
_0805046C: .4byte gCurrentSprite

	thumb_func_start ZozoroTurningAroundInit
ZozoroTurningAroundInit: @ 0x08050470
	push {lr}
	ldr r0, _08050484 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #4
	strb r1, [r0]
	bl ZozoroSetTurningAroundOam
	pop {r0}
	bx r0
	.align 2, 0
_08050484: .4byte gCurrentSprite

	thumb_func_start ZozoroTurningAround
ZozoroTurningAround: @ 0x08050488
	push {lr}
	ldr r2, _080504AC @ =gCurrentSprite
	ldrh r0, [r2, #0x16]
	cmp r0, #1
	bne _080504B8
	ldrb r0, [r2, #0x1c]
	cmp r0, #3
	bne _080504B8
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080504B0
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	b _080504B4
	.align 2, 0
_080504AC: .4byte gCurrentSprite
_080504B0:
	ldrh r0, [r2]
	movs r1, #0x40
_080504B4:
	eors r0, r1
	strh r0, [r2]
_080504B8:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _080504C8
	ldr r0, _080504CC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_080504C8:
	pop {r0}
	bx r0
	.align 2, 0
_080504CC: .4byte gCurrentSprite

	thumb_func_start ZozoroFallingInit
ZozoroFallingInit: @ 0x080504D0
	push {lr}
	ldr r1, _080504EC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bl ZozoroSetCrawlingOam
	pop {r0}
	bx r0
	.align 2, 0
_080504EC: .4byte gCurrentSprite

	thumb_func_start ZozorFalling
ZozorFalling: @ 0x080504F0
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _08050518 @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805051C
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08050528
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08050528
	.align 2, 0
_08050518: .4byte gCurrentSprite
_0805051C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08050530
_08050528:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08050530:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0805057C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080505A4
	ldr r4, _08050580 @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _08050556
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08050556:
	ldrh r0, [r4]
	ldr r1, _08050584 @ =0x0000FEFF
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strb r0, [r2]
	bl ZozoroUpdateHitbox
	cmp r5, #0
	beq _08050590
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08050588
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _0805058C
	.align 2, 0
_0805057C: .4byte gPreviousVerticalCollisionCheck
_08050580: .4byte gCurrentSprite
_08050584: .4byte 0x0000FEFF
_08050588:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_0805058C:
	subs r0, r0, r1
	strh r0, [r4, #4]
_08050590:
	ldr r0, _080505A0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	bl ZozoroSetCrawlingOam
	b _080505E8
	.align 2, 0
_080505A0: .4byte gCurrentSprite
_080505A4:
	ldr r3, _080505D0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _080505D4 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080505D8 @ =0x00007FFF
	cmp r1, r0
	bne _080505DC
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080505E6
	.align 2, 0
_080505D0: .4byte gCurrentSprite
_080505D4: .4byte sSpritesFallingSpeed
_080505D8: .4byte 0x00007FFF
_080505DC:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_080505E6:
	strh r0, [r3, #2]
_080505E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Zozoro
Zozoro: @ 0x080505F0
	push {r4, lr}
	ldr r4, _08050618 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08050608
	ldr r0, _0805061C @ =0x000001D1
	bl SoundPlayNotAlreadyPlaying
_08050608:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08050620
	bl SpriteUtilUpdateFreezeTimer
	b _080507EC
	.align 2, 0
_08050618: .4byte gCurrentSprite
_0805061C: .4byte 0x000001D1
_08050620:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0805062C
	b _080507EC
_0805062C:
	lsls r0, r0, #2
	ldr r1, _08050638 @ =_0805063C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08050638: .4byte _0805063C
_0805063C: @ jump table
	.4byte _080507AC @ case 0
	.4byte _080507B2 @ case 1
	.4byte _080507B6 @ case 2
	.4byte _080507BC @ case 3
	.4byte _080507C0 @ case 4
	.4byte _080507EC @ case 5
	.4byte _080507EC @ case 6
	.4byte _080507EC @ case 7
	.4byte _080507EC @ case 8
	.4byte _080507EC @ case 9
	.4byte _080507EC @ case 10
	.4byte _080507EC @ case 11
	.4byte _080507EC @ case 12
	.4byte _080507EC @ case 13
	.4byte _080507EC @ case 14
	.4byte _080507EC @ case 15
	.4byte _080507EC @ case 16
	.4byte _080507EC @ case 17
	.4byte _080507EC @ case 18
	.4byte _080507EC @ case 19
	.4byte _080507EC @ case 20
	.4byte _080507C6 @ case 21
	.4byte _080507CA @ case 22
	.4byte _080507EC @ case 23
	.4byte _080507EC @ case 24
	.4byte _080507EC @ case 25
	.4byte _080507EC @ case 26
	.4byte _080507EC @ case 27
	.4byte _080507EC @ case 28
	.4byte _080507EC @ case 29
	.4byte _080507EC @ case 30
	.4byte _080507EC @ case 31
	.4byte _080507EC @ case 32
	.4byte _080507EC @ case 33
	.4byte _080507EC @ case 34
	.4byte _080507EC @ case 35
	.4byte _080507EC @ case 36
	.4byte _080507EC @ case 37
	.4byte _080507EC @ case 38
	.4byte _080507EC @ case 39
	.4byte _080507EC @ case 40
	.4byte _080507EC @ case 41
	.4byte _080507EC @ case 42
	.4byte _080507EC @ case 43
	.4byte _080507EC @ case 44
	.4byte _080507EC @ case 45
	.4byte _080507EC @ case 46
	.4byte _080507EC @ case 47
	.4byte _080507EC @ case 48
	.4byte _080507EC @ case 49
	.4byte _080507EC @ case 50
	.4byte _080507EC @ case 51
	.4byte _080507EC @ case 52
	.4byte _080507EC @ case 53
	.4byte _080507EC @ case 54
	.4byte _080507EC @ case 55
	.4byte _080507EC @ case 56
	.4byte _080507EC @ case 57
	.4byte _080507EC @ case 58
	.4byte _080507EC @ case 59
	.4byte _080507EC @ case 60
	.4byte _080507EC @ case 61
	.4byte _080507EC @ case 62
	.4byte _080507EC @ case 63
	.4byte _080507EC @ case 64
	.4byte _080507EC @ case 65
	.4byte _080507EC @ case 66
	.4byte _080507EC @ case 67
	.4byte _080507EC @ case 68
	.4byte _080507EC @ case 69
	.4byte _080507EC @ case 70
	.4byte _080507EC @ case 71
	.4byte _080507EC @ case 72
	.4byte _080507EC @ case 73
	.4byte _080507EC @ case 74
	.4byte _080507EC @ case 75
	.4byte _080507EC @ case 76
	.4byte _080507EC @ case 77
	.4byte _080507EC @ case 78
	.4byte _080507EC @ case 79
	.4byte _080507EC @ case 80
	.4byte _080507EC @ case 81
	.4byte _080507EC @ case 82
	.4byte _080507EC @ case 83
	.4byte _080507EC @ case 84
	.4byte _080507EC @ case 85
	.4byte _080507EC @ case 86
	.4byte _080507D0 @ case 87
	.4byte _080507D4 @ case 88
	.4byte _080507DA @ case 89
	.4byte _080507DE @ case 90
	.4byte _080507E4 @ case 91
_080507AC:
	bl ZozoroInit
	b _080507EC
_080507B2:
	bl ZozoroIdleInit
_080507B6:
	bl ZozoroIdle
	b _080507EC
_080507BC:
	bl ZozoroTurningAroundInit
_080507C0:
	bl ZozoroTurningAround
	b _080507EC
_080507C6:
	bl ZozoroFallingInit
_080507CA:
	bl ZozorFalling
	b _080507EC
_080507D0:
	bl SpriteDyingInit
_080507D4:
	bl SpriteDying
	b _080507EC
_080507DA:
	bl ZozoroInit
_080507DE:
	bl SpriteSpawningFromX
	b _080507EC
_080507E4:
	bl ZozoroTurningIntoX
	bl XParasiteInit
_080507EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
