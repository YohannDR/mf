    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start OwtchCheckCollidingWithAir
OwtchCheckCollidingWithAir: @ 0x08049888
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080498BC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080498E8
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080498C4
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080498C0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08049938
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0804992C
	.align 2, 0
_080498BC: .4byte gCurrentSprite
_080498C0: .4byte gPreviousCollisionCheck
_080498C4:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080498E4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08049938
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0804992C
	.align 2, 0
_080498E4: .4byte gPreviousCollisionCheck
_080498E8:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049914
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08049910 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08049938
	ldrh r0, [r4, #2]
	subs r0, #4
	b _08049928
	.align 2, 0
_08049910: .4byte gPreviousCollisionCheck
_08049914:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08049940 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08049938
	ldrh r0, [r4, #2]
_08049928:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0804992C:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08049938
	movs r6, #1
_08049938:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08049940: .4byte gPreviousCollisionCheck

	thumb_func_start OwtchUpdateHitbox
OwtchUpdateHitbox: @ 0x08049944
	push {lr}
	ldr r2, _0804996C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049990
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08049978
	ldr r0, _08049970 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _08049974 @ =0x0000FFD4
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _080499B2
	.align 2, 0
_0804996C: .4byte gCurrentSprite
_08049970: .4byte 0x0000FFE4
_08049974: .4byte 0x0000FFD4
_08049978:
	ldr r0, _08049988 @ =0x0000FFE4
	strh r0, [r2, #0xa]
	movs r0, #0x1c
	strh r0, [r2, #0xc]
	ldr r0, _0804998C @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x2c
	b _080499B2
	.align 2, 0
_08049988: .4byte 0x0000FFE4
_0804998C: .4byte 0x0000FFF0
_08049990:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080499A4
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x2c
	b _080499AA
_080499A4:
	ldr r0, _080499B8 @ =0x0000FFD4
	strh r0, [r2, #0xa]
	movs r0, #0x10
_080499AA:
	strh r0, [r2, #0xc]
	ldr r0, _080499BC @ =0x0000FFE4
	strh r0, [r2, #0xe]
	movs r0, #0x1c
_080499B2:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_080499B8: .4byte 0x0000FFD4
_080499BC: .4byte 0x0000FFE4

	thumb_func_start OwtchSetCrawlingOam
OwtchSetCrawlingOam: @ 0x080499C0
	push {lr}
	ldr r0, _080499D4 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _080499DC
	ldr r0, _080499D8 @ =0x08379154
	b _080499DE
	.align 2, 0
_080499D4: .4byte gCurrentSprite
_080499D8: .4byte 0x08379154
_080499DC:
	ldr r0, _080499EC @ =0x083790D4
_080499DE:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_080499EC: .4byte 0x083790D4

	thumb_func_start OwtchSetFallingOam
OwtchSetFallingOam: @ 0x080499F0
	push {lr}
	ldr r0, _08049A04 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _08049A0C
	ldr r0, _08049A08 @ =0x08379154
	b _08049A0E
	.align 2, 0
_08049A04: .4byte gCurrentSprite
_08049A08: .4byte 0x08379154
_08049A0C:
	ldr r0, _08049A1C @ =0x083790D4
_08049A0E:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_08049A1C: .4byte 0x083790D4

	thumb_func_start OwtchTurningIntoX
OwtchTurningIntoX: @ 0x08049A20
	push {lr}
	ldr r2, _08049A40 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08049A4C
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08049A44
	ldrh r0, [r2, #4]
	subs r0, #0x28
	strh r0, [r2, #4]
	b _08049A64
	.align 2, 0
_08049A40: .4byte gCurrentSprite
_08049A44:
	ldrh r0, [r2, #4]
	adds r0, #0x28
	strh r0, [r2, #4]
	b _08049A64
_08049A4C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049A5E
	ldrh r0, [r2, #2]
	adds r0, #0x28
	b _08049A62
_08049A5E:
	ldrh r0, [r2, #2]
	subs r0, #0x28
_08049A62:
	strh r0, [r2, #2]
_08049A64:
	pop {r0}
	bx r0

	thumb_func_start OwtchInit
OwtchInit: @ 0x08049A68
	push {r4, r5, r6, r7, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08049A94 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08049A98
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08049A98
	strh r0, [r2]
	b _08049BA8
	.align 2, 0
_08049A94: .4byte gCurrentSprite
_08049A98:
	ldr r0, _08049AB0 @ =gCurrentSprite
	adds r4, r0, #0
	adds r4, #0x24
	ldrb r1, [r4]
	adds r7, r0, #0
	cmp r1, #0x59
	bne _08049AB4
	movs r0, #0x5a
	strb r0, [r4]
	movs r0, #0x2c
	strh r0, [r7, #6]
	b _08049B72
	.align 2, 0
_08049AB0: .4byte gCurrentSprite
_08049AB4:
	bl SpriteUtilChooseRandomXDirection
	movs r0, #2
	strb r0, [r4]
	ldrh r0, [r7, #2]
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08049ADC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	movs r6, #0xf0
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #0
	beq _08049AE0
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	b _08049B72
	.align 2, 0
_08049ADC: .4byte gPreviousCollisionCheck
_08049AE0:
	ldrh r0, [r7, #2]
	subs r0, #0x44
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08049B0E
	adds r0, r7, #0
	adds r0, #0x2d
	strb r4, [r0]
	ldrh r0, [r7]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r1, r0
	strh r1, [r7]
	ldrh r0, [r7, #2]
	subs r0, #0x40
	strh r0, [r7, #2]
	b _08049B72
_08049B0E:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08049B3A
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
	b _08049B72
_08049B3A:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	adds r2, r6, #0
	ands r2, r0
	cmp r2, #0
	beq _08049B6E
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r7]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r7]
	ldrh r0, [r7, #2]
	subs r0, #0x20
	strh r0, [r7, #2]
	ldrh r0, [r7, #4]
	adds r0, #0x20
	strh r0, [r7, #4]
	b _08049B72
_08049B6E:
	strh r2, [r7]
	b _08049BA8
_08049B72:
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl OwtchSetCrawlingOam
	bl OwtchUpdateHitbox
	ldr r2, _08049BB0 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r7, #0x14]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r1, [r0]
	subs r0, #7
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_08049BA8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049BB0: .4byte sPrimarySpriteStats

	thumb_func_start OwtchIdleInit
OwtchIdleInit: @ 0x08049BB4
	push {lr}
	bl OwtchSetCrawlingOam
	ldr r0, _08049BC8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08049BC8: .4byte gCurrentSprite

	thumb_func_start OwtchIdle
OwtchIdle: @ 0x08049BCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	bl OwtchCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08049BEC
	ldr r0, _08049BE8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _08049EF8
	.align 2, 0
_08049BE8: .4byte gCurrentSprite
_08049BEC:
	ldr r4, _08049C40 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	beq _08049C00
	b _08049EFA
_08049C00:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08049C0C
	b _08049D78
_08049C0C:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08049CC4
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08049C68
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08049C44 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08049C48
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
	b _08049CB0
	.align 2, 0
_08049C40: .4byte gCurrentSprite
_08049C44: .4byte gPreviousCollisionCheck
_08049C48:
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08049D10
	ldrh r1, [r4]
	ldr r0, _08049C64 @ =0x0000FDFF
	ands r0, r1
	b _08049C84
	.align 2, 0
_08049C64: .4byte 0x0000FDFF
_08049C68:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08049C94 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08049C98
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
_08049C84:
	strh r0, [r4]
	movs r5, #1
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #5
	strb r0, [r1]
	b _08049EEE
	.align 2, 0
_08049C94: .4byte gPreviousCollisionCheck
_08049C98:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08049D70
	ldrh r1, [r4]
	ldr r0, _08049CC0 @ =0x0000FDFF
	ands r0, r1
_08049CB0:
	strh r0, [r4]
	movs r5, #1
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #7
	strb r0, [r1]
	b _08049EEE
	.align 2, 0
_08049CC0: .4byte 0x0000FDFF
_08049CC4:
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08049D18
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08049CF0 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08049CF8
	ldrh r1, [r4]
	ldr r0, _08049CF4 @ =0x0000FDFF
	ands r0, r1
	b _08049D62
	.align 2, 0
_08049CF0: .4byte gPreviousCollisionCheck
_08049CF4: .4byte 0x0000FDFF
_08049CF8:
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _08049D10
	ldrh r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
	b _08049D36
_08049D10:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	b _08049EEE
_08049D18:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08049D44 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08049D4C
	ldrh r1, [r4]
	ldr r0, _08049D48 @ =0x0000FDFF
	ands r0, r1
_08049D36:
	strh r0, [r4]
	movs r5, #1
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #4
	strb r0, [r1]
	b _08049EEE
	.align 2, 0
_08049D44: .4byte gPreviousCollisionCheck
_08049D48: .4byte 0x0000FDFF
_08049D4C:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _08049D70
	ldrh r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
_08049D62:
	strh r0, [r4]
	movs r5, #1
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #6
	strb r0, [r1]
	b _08049EEE
_08049D70:
	ldrh r0, [r4, #2]
	subs r0, #1
	strh r0, [r4, #2]
	b _08049EEE
_08049D78:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08049E30
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08049DD6
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08049DB0 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08049DB8
	ldrh r0, [r4]
	ldr r1, _08049DB4 @ =0x0000FDFF
	ands r1, r0
	b _08049E22
	.align 2, 0
_08049DB0: .4byte gPreviousCollisionCheck
_08049DB4: .4byte 0x0000FDFF
_08049DB8:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _08049DD0
	ldrh r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
	b _08049DF4
_08049DD0:
	ldrh r0, [r4, #4]
	adds r0, #1
	b _08049EEC
_08049DD6:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08049E04 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08049E0C
	ldrh r1, [r4]
	ldr r0, _08049E08 @ =0x0000FDFF
	ands r0, r1
_08049DF4:
	strh r0, [r4]
	movs r5, #1
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #3
	strb r0, [r1]
	b _08049EEE
	.align 2, 0
_08049E04: .4byte gPreviousCollisionCheck
_08049E08: .4byte 0x0000FDFF
_08049E0C:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	bne _08049EE8
	ldrh r0, [r4]
	adds r1, r7, #0
	orrs r1, r0
_08049E22:
	strh r1, [r4]
	movs r5, #1
	adds r0, r4, #0
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	b _08049EEE
_08049E30:
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08049E8E
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08049E64 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08049E68
	ldrh r1, [r4]
	movs r2, #0
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r4]
	movs r5, #1
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	b _08049EEE
	.align 2, 0
_08049E64: .4byte gPreviousCollisionCheck
_08049E68:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08049E88
	ldrh r0, [r4]
	ldr r1, _08049E84 @ =0x0000FDFF
	ands r1, r0
	b _08049EAA
	.align 2, 0
_08049E84: .4byte 0x0000FDFF
_08049E88:
	ldrh r0, [r4, #4]
	adds r0, #1
	b _08049EEC
_08049E8E:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08049EB8 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08049EBC
	ldrh r0, [r4]
	adds r1, r6, #0
	orrs r1, r0
_08049EAA:
	strh r1, [r4]
	movs r5, #1
	adds r0, r4, #0
	adds r0, #0x2f
	strb r5, [r0]
	b _08049EEE
	.align 2, 0
_08049EB8: .4byte gPreviousCollisionCheck
_08049EBC:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _08049EE8
	ldrh r1, [r4]
	ldr r0, _08049EE4 @ =0x0000FDFF
	ands r0, r1
	movs r1, #0
	strh r0, [r4]
	movs r5, #1
	adds r0, r4, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _08049EEE
	.align 2, 0
_08049EE4: .4byte 0x0000FDFF
_08049EE8:
	ldrh r0, [r4, #4]
	subs r0, #1
_08049EEC:
	strh r0, [r4, #4]
_08049EEE:
	cmp r5, #0
	beq _08049EFA
	ldr r0, _08049F04 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
_08049EF8:
	strb r1, [r0]
_08049EFA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049F04: .4byte gCurrentSprite

	thumb_func_start OwtchTurningAroundInit
OwtchTurningAroundInit: @ 0x08049F08
	push {r4, lr}
	ldr r3, _08049F34 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r4, #0
	movs r0, #4
	strb r0, [r1]
	strb r4, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r2, r3, #0
	cmp r0, #7
	bls _08049F28
	b _0804A094
_08049F28:
	lsls r0, r0, #2
	ldr r1, _08049F38 @ =_08049F3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08049F34: .4byte gCurrentSprite
_08049F38: .4byte _08049F3C
_08049F3C: @ jump table
	.4byte _08049F5C @ case 0
	.4byte _08049F84 @ case 1
	.4byte _08049FA0 @ case 2
	.4byte _08049FC8 @ case 3
	.4byte _08049FE4 @ case 4
	.4byte _0804A00C @ case 5
	.4byte _0804A03C @ case 6
	.4byte _0804A064 @ case 7
_08049F5C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08049F70
	ldr r0, _08049F6C @ =0x08379114
	b _08049F72
	.align 2, 0
_08049F6C: .4byte 0x08379114
_08049F70:
	ldr r0, _08049F7C @ =0x08379194
_08049F72:
	str r0, [r2, #0x18]
	ldrh r0, [r2]
	ldr r1, _08049F80 @ =0x0000FFBF
	ands r1, r0
	b _0804A02A
	.align 2, 0
_08049F7C: .4byte 0x08379194
_08049F80: .4byte 0x0000FFBF
_08049F84:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08049F98
	ldr r0, _08049F94 @ =0x08379114
	b _0804A022
	.align 2, 0
_08049F94: .4byte 0x08379114
_08049F98:
	ldr r0, _08049F9C @ =0x08379194
	b _0804A022
	.align 2, 0
_08049F9C: .4byte 0x08379194
_08049FA0:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08049FB4
	ldr r0, _08049FB0 @ =0x08379194
	b _08049FB6
	.align 2, 0
_08049FB0: .4byte 0x08379194
_08049FB4:
	ldr r0, _08049FC0 @ =0x08379114
_08049FB6:
	str r0, [r2, #0x18]
	ldrh r0, [r2]
	ldr r1, _08049FC4 @ =0x0000FFBF
	ands r1, r0
	b _0804A082
	.align 2, 0
_08049FC0: .4byte 0x08379114
_08049FC4: .4byte 0x0000FFBF
_08049FC8:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08049FDC
	ldr r0, _08049FD8 @ =0x08379194
	b _0804A07A
	.align 2, 0
_08049FD8: .4byte 0x08379194
_08049FDC:
	ldr r0, _08049FE0 @ =0x08379114
	b _0804A07A
	.align 2, 0
_08049FE0: .4byte 0x08379114
_08049FE4:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08049FF8
	ldr r0, _08049FF4 @ =0x083791B4
	b _08049FFA
	.align 2, 0
_08049FF4: .4byte 0x083791B4
_08049FF8:
	ldr r0, _0804A004 @ =0x08379134
_08049FFA:
	str r0, [r2, #0x18]
	ldrh r0, [r2]
	ldr r1, _0804A008 @ =0x0000FFBF
	ands r1, r0
	b _0804A02A
	.align 2, 0
_0804A004: .4byte 0x08379134
_0804A008: .4byte 0x0000FFBF
_0804A00C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A020
	ldr r0, _0804A01C @ =0x08379134
	b _0804A022
	.align 2, 0
_0804A01C: .4byte 0x08379134
_0804A020:
	ldr r0, _0804A034 @ =0x083791B4
_0804A022:
	str r0, [r2, #0x18]
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r1, r0
_0804A02A:
	ldr r0, _0804A038 @ =0x0000FEFF
	ands r1, r0
	strh r1, [r2]
	b _0804A096
	.align 2, 0
_0804A034: .4byte 0x083791B4
_0804A038: .4byte 0x0000FEFF
_0804A03C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A050
	ldr r0, _0804A04C @ =0x083791B4
	b _0804A052
	.align 2, 0
_0804A04C: .4byte 0x083791B4
_0804A050:
	ldr r0, _0804A05C @ =0x08379134
_0804A052:
	str r0, [r2, #0x18]
	ldrh r0, [r2]
	ldr r1, _0804A060 @ =0x0000FFBF
	ands r1, r0
	b _0804A082
	.align 2, 0
_0804A05C: .4byte 0x08379134
_0804A060: .4byte 0x0000FFBF
_0804A064:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A078
	ldr r0, _0804A074 @ =0x08379134
	b _0804A07A
	.align 2, 0
_0804A074: .4byte 0x08379134
_0804A078:
	ldr r0, _0804A090 @ =0x083791B4
_0804A07A:
	str r0, [r2, #0x18]
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r1, r0
_0804A082:
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r3, #0
	orrs r1, r0
	strh r1, [r2]
	b _0804A096
	.align 2, 0
_0804A090: .4byte 0x083791B4
_0804A094:
	strh r4, [r3]
_0804A096:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start OwtchTurningAround
OwtchTurningAround: @ 0x0804A09C
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	bne _0804A0A8
	b _0804A216
_0804A0A8:
	ldr r2, _0804A0CC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r3, r2, #0
	cmp r0, #7
	bls _0804A0C0
	b _0804A20A
_0804A0C0:
	lsls r0, r0, #2
	ldr r1, _0804A0D0 @ =_0804A0D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804A0CC: .4byte gCurrentSprite
_0804A0D0: .4byte _0804A0D4
_0804A0D4: @ jump table
	.4byte _0804A0F4 @ case 0
	.4byte _0804A118 @ case 1
	.4byte _0804A12A @ case 2
	.4byte _0804A150 @ case 3
	.4byte _0804A17A @ case 4
	.4byte _0804A192 @ case 5
	.4byte _0804A1C0 @ case 6
	.4byte _0804A1DA @ case 7
_0804A0F4:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804A10C
	ldrh r0, [r3, #2]
	subs r0, #0x1c
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	subs r0, #0x1c
	strh r0, [r3, #4]
_0804A10C:
	ldrh r1, [r3]
	ldr r0, _0804A114 @ =0x0000FFBF
	ands r0, r1
	b _0804A16E
	.align 2, 0
_0804A114: .4byte 0x0000FFBF
_0804A118:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804A168
	ldrh r0, [r3, #2]
	subs r0, #0x20
	b _0804A160
_0804A12A:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A142
	ldrh r0, [r3, #2]
	adds r0, #0x1c
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	subs r0, #0x1c
	strh r0, [r3, #4]
_0804A142:
	ldrh r1, [r3]
	ldr r0, _0804A14C @ =0x0000FFBF
	ands r0, r1
	b _0804A16E
	.align 2, 0
_0804A14C: .4byte 0x0000FFBF
_0804A150:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A168
	ldrh r0, [r3, #2]
	adds r0, #0x20
_0804A160:
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	adds r0, #0x20
	strh r0, [r3, #4]
_0804A168:
	ldrh r1, [r3]
	movs r0, #0x40
	orrs r0, r1
_0804A16E:
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	b _0804A20E
_0804A17A:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A1AA
	ldrh r0, [r3, #2]
	adds r0, #0x20
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	adds r0, #0x20
	b _0804A1A8
_0804A192:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804A1AA
	ldrh r0, [r3, #2]
	adds r0, #0x20
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	subs r0, #0x20
_0804A1A8:
	strh r0, [r3, #4]
_0804A1AA:
	ldrh r1, [r3]
	ldr r0, _0804A1BC @ =0x0000FEFF
	ands r0, r1
	movs r1, #0
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r1, [r0]
	b _0804A20E
	.align 2, 0
_0804A1BC: .4byte 0x0000FEFF
_0804A1C0:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A1F4
	ldrh r0, [r3, #2]
	subs r0, #0x1c
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	adds r0, #0x1c
	strh r0, [r3, #4]
	b _0804A1F4
_0804A1DA:
	adds r2, r3, #0
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804A1F4
	ldrh r0, [r2, #2]
	subs r0, #0x1c
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	subs r0, #0x1c
	strh r0, [r2, #4]
_0804A1F4:
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r2, [r0]
	b _0804A20E
_0804A20A:
	movs r0, #0
	strh r0, [r2]
_0804A20E:
	bl OwtchSetCrawlingOam
	bl OwtchUpdateHitbox
_0804A216:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OwtchLandingInit
OwtchLandingInit: @ 0x0804A21C
	push {lr}
	ldr r0, _0804A230 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	bl OwtchSetFallingOam
	pop {r0}
	bx r0
	.align 2, 0
_0804A230: .4byte gCurrentSprite

	thumb_func_start OwtchLanding
OwtchLanding: @ 0x0804A234
	push {lr}
	bl OwtchCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804A24C
	ldr r0, _0804A248 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _0804A25A
	.align 2, 0
_0804A248: .4byte gCurrentSprite
_0804A24C:
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804A25C
	ldr r0, _0804A260 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
_0804A25A:
	strb r1, [r0]
_0804A25C:
	pop {r0}
	bx r0
	.align 2, 0
_0804A260: .4byte gCurrentSprite

	thumb_func_start OwtchFallingInit
OwtchFallingInit: @ 0x0804A264
	push {lr}
	ldr r3, _0804A290 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x16
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r0, #4
	strb r2, [r0]
	ldrh r1, [r3]
	ldr r0, _0804A294 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r3]
	bl OwtchUpdateHitbox
	bl OwtchSetFallingOam
	pop {r0}
	bx r0
	.align 2, 0
_0804A290: .4byte gCurrentSprite
_0804A294: .4byte 0x0000FEFF

	thumb_func_start OwtchFalling
OwtchFalling: @ 0x0804A298
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _0804A2C0 @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A2C4
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804A2D0
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _0804A2D0
	.align 2, 0
_0804A2C0: .4byte gCurrentSprite
_0804A2C4:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804A2D8
_0804A2D0:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0804A2D8:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0804A324 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A36A
	ldr r4, _0804A328 @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0804A2FE
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0804A2FE:
	ldrh r0, [r4]
	ldr r1, _0804A32C @ =0x0000FEFF
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strb r0, [r2]
	bl OwtchUpdateHitbox
	cmp r5, #0
	beq _0804A338
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804A330
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _0804A334
	.align 2, 0
_0804A324: .4byte gPreviousVerticalCollisionCheck
_0804A328: .4byte gCurrentSprite
_0804A32C: .4byte 0x0000FEFF
_0804A330:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_0804A334:
	subs r0, r0, r1
	strh r0, [r4, #4]
_0804A338:
	ldr r2, _0804A358 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0804A35C
	adds r0, r2, #0
	adds r0, #0x24
	strb r3, [r0]
	bl OwtchSetCrawlingOam
	b _0804A3AC
	.align 2, 0
_0804A358: .4byte gCurrentSprite
_0804A35C:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	bl OwtchSetFallingOam
	b _0804A3AC
_0804A36A:
	ldr r3, _0804A394 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0804A398 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0804A39C @ =0x00007FFF
	cmp r1, r0
	bne _0804A3A0
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804A3AA
	.align 2, 0
_0804A394: .4byte gCurrentSprite
_0804A398: .4byte sSpritesFallingSpeed
_0804A39C: .4byte 0x00007FFF
_0804A3A0:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_0804A3AA:
	strh r0, [r3, #2]
_0804A3AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Owtch
Owtch: @ 0x0804A3B4
	push {r4, lr}
	ldr r4, _0804A3E0 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804A3CE
	movs r0, #0xea
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804A3CE:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A3E4
	bl SpriteUtilUpdateFreezeTimer
	b _0804A5BA
	.align 2, 0
_0804A3E0: .4byte gCurrentSprite
_0804A3E4:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804A3F0
	b _0804A5BA
_0804A3F0:
	lsls r0, r0, #2
	ldr r1, _0804A3FC @ =_0804A400
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804A3FC: .4byte _0804A400
_0804A400: @ jump table
	.4byte _0804A570 @ case 0
	.4byte _0804A576 @ case 1
	.4byte _0804A57A @ case 2
	.4byte _0804A580 @ case 3
	.4byte _0804A584 @ case 4
	.4byte _0804A5BA @ case 5
	.4byte _0804A5BA @ case 6
	.4byte _0804A58A @ case 7
	.4byte _0804A58E @ case 8
	.4byte _0804A5BA @ case 9
	.4byte _0804A5BA @ case 10
	.4byte _0804A5BA @ case 11
	.4byte _0804A5BA @ case 12
	.4byte _0804A5BA @ case 13
	.4byte _0804A5BA @ case 14
	.4byte _0804A5BA @ case 15
	.4byte _0804A5BA @ case 16
	.4byte _0804A5BA @ case 17
	.4byte _0804A5BA @ case 18
	.4byte _0804A5BA @ case 19
	.4byte _0804A5BA @ case 20
	.4byte _0804A594 @ case 21
	.4byte _0804A598 @ case 22
	.4byte _0804A5BA @ case 23
	.4byte _0804A5BA @ case 24
	.4byte _0804A5BA @ case 25
	.4byte _0804A5BA @ case 26
	.4byte _0804A5BA @ case 27
	.4byte _0804A5BA @ case 28
	.4byte _0804A5BA @ case 29
	.4byte _0804A5BA @ case 30
	.4byte _0804A5BA @ case 31
	.4byte _0804A5BA @ case 32
	.4byte _0804A5BA @ case 33
	.4byte _0804A5BA @ case 34
	.4byte _0804A5BA @ case 35
	.4byte _0804A5BA @ case 36
	.4byte _0804A5BA @ case 37
	.4byte _0804A5BA @ case 38
	.4byte _0804A5BA @ case 39
	.4byte _0804A5BA @ case 40
	.4byte _0804A5BA @ case 41
	.4byte _0804A5BA @ case 42
	.4byte _0804A5BA @ case 43
	.4byte _0804A5BA @ case 44
	.4byte _0804A5BA @ case 45
	.4byte _0804A5BA @ case 46
	.4byte _0804A5BA @ case 47
	.4byte _0804A5BA @ case 48
	.4byte _0804A5BA @ case 49
	.4byte _0804A5BA @ case 50
	.4byte _0804A5BA @ case 51
	.4byte _0804A5BA @ case 52
	.4byte _0804A5BA @ case 53
	.4byte _0804A5BA @ case 54
	.4byte _0804A5BA @ case 55
	.4byte _0804A5BA @ case 56
	.4byte _0804A5BA @ case 57
	.4byte _0804A5BA @ case 58
	.4byte _0804A5BA @ case 59
	.4byte _0804A5BA @ case 60
	.4byte _0804A5BA @ case 61
	.4byte _0804A5BA @ case 62
	.4byte _0804A5BA @ case 63
	.4byte _0804A5BA @ case 64
	.4byte _0804A5BA @ case 65
	.4byte _0804A5BA @ case 66
	.4byte _0804A5BA @ case 67
	.4byte _0804A5BA @ case 68
	.4byte _0804A5BA @ case 69
	.4byte _0804A5BA @ case 70
	.4byte _0804A5BA @ case 71
	.4byte _0804A5BA @ case 72
	.4byte _0804A5BA @ case 73
	.4byte _0804A5BA @ case 74
	.4byte _0804A5BA @ case 75
	.4byte _0804A5BA @ case 76
	.4byte _0804A5BA @ case 77
	.4byte _0804A5BA @ case 78
	.4byte _0804A5BA @ case 79
	.4byte _0804A5BA @ case 80
	.4byte _0804A5BA @ case 81
	.4byte _0804A5BA @ case 82
	.4byte _0804A5BA @ case 83
	.4byte _0804A5BA @ case 84
	.4byte _0804A5BA @ case 85
	.4byte _0804A5BA @ case 86
	.4byte _0804A59E @ case 87
	.4byte _0804A5A2 @ case 88
	.4byte _0804A5A8 @ case 89
	.4byte _0804A5AC @ case 90
	.4byte _0804A5B2 @ case 91
_0804A570:
	bl OwtchInit
	b _0804A5BA
_0804A576:
	bl OwtchIdleInit
_0804A57A:
	bl OwtchIdle
	b _0804A5BA
_0804A580:
	bl OwtchTurningAroundInit
_0804A584:
	bl OwtchTurningAround
	b _0804A5BA
_0804A58A:
	bl OwtchLandingInit
_0804A58E:
	bl OwtchLanding
	b _0804A5BA
_0804A594:
	bl OwtchFallingInit
_0804A598:
	bl OwtchFalling
	b _0804A5BA
_0804A59E:
	bl SpriteDyingInit
_0804A5A2:
	bl SpriteDying
	b _0804A5BA
_0804A5A8:
	bl OwtchInit
_0804A5AC:
	bl SpriteSpawningFromX
	b _0804A5BA
_0804A5B2:
	bl OwtchTurningIntoX
	bl XParasiteInit
_0804A5BA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GeegaSpawningFromX
GeegaSpawningFromX: @ 0x0804A5C0
	push {r4, lr}
	ldr r2, _0804A5EC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804A5F8
	ldr r2, _0804A5F0 @ =gWrittenToMosaic_H
	ldr r1, _0804A5F4 @ =sXParasiteMosaicValues
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	b _0804A608
	.align 2, 0
_0804A5EC: .4byte gCurrentSprite
_0804A5F0: .4byte gWrittenToMosaic_H
_0804A5F4: .4byte sXParasiteMosaicValues
_0804A5F8:
	ldrh r1, [r2]
	ldr r0, _0804A610 @ =0x00007FFF
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x24
	strb r4, [r1]
	ldr r1, _0804A614 @ =0x0000FFDF
	ands r0, r1
_0804A608:
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A610: .4byte 0x00007FFF
_0804A614: .4byte 0x0000FFDF

	thumb_func_start GeegaInit
GeegaInit: @ 0x0804A618
	push {r4, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804A644 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A648
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804A648
	strh r0, [r2]
	b _0804A6CE
	.align 2, 0
_0804A644: .4byte gCurrentSprite
_0804A648:
	ldr r3, _0804A6AC @ =gCurrentSprite
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	movs r4, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0804A6B0 @ =0x0000FFD0
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	adds r0, #0x14
	strh r0, [r3, #0xe]
	movs r0, #0x1c
	strh r0, [r3, #0x10]
	ldr r0, _0804A6B4 @ =0x08379AA8
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r2, _0804A6B8 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804A6BC
	movs r0, #0x5a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	strb r0, [r1]
	b _0804A6CE
	.align 2, 0
_0804A6AC: .4byte gCurrentSprite
_0804A6B0: .4byte 0x0000FFD0
_0804A6B4: .4byte 0x08379AA8
_0804A6B8: .4byte sPrimarySpriteStats
_0804A6BC:
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #2]
	strh r0, [r3, #6]
	ldrh r0, [r3, #4]
	strh r0, [r3, #8]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r4, [r0]
_0804A6CE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start GeegaIdle
GeegaIdle: @ 0x0804A6D4
	push {r4, r5, lr}
	ldr r4, _0804A6E8 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804A6EC
	subs r0, #1
	b _0804A71E
	.align 2, 0
_0804A6E8: .4byte gCurrentSprite
_0804A6EC:
	ldr r0, _0804A728 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldrh r0, [r4, #2]
	subs r0, #0x3c
	cmp r1, r0
	bge _0804A720
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #0xc0
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _0804A720
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _0804A72C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r4]
	movs r0, #0x14
_0804A71E:
	strb r0, [r5]
_0804A720:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A728: .4byte gSamusData
_0804A72C: .4byte 0x0000DFFF

	thumb_func_start GeegaGoingUp
GeegaGoingUp: @ 0x0804A730
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r6, _0804A778 @ =gCurrentSprite
	ldrh r3, [r6, #2]
	adds r0, r3, #0
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r8, r4
	ldrh r5, [r6, #4]
	adds r7, r5, #0
	movs r0, #0x2e
	adds r0, r0, r6
	mov ip, r0
	ldrb r0, [r0]
	adds r2, r0, #0
	cmp r2, #0
	beq _0804A7F8
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x12
	bne _0804A77C
	subs r4, #0x60
	movs r0, #0
	movs r1, #0x11
	adds r2, r4, #0
	adds r3, r5, #0
	bl SpriteDebrisInit
	adds r3, r5, #0
	adds r3, #0x10
	b _0804A7B6
	.align 2, 0
_0804A778: .4byte gCurrentSprite
_0804A77C:
	cmp r0, #0xc
	bne _0804A79E
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
	b _0804A81E
_0804A79E:
	cmp r0, #7
	bne _0804A7C2
	subs r4, #0x20
	adds r3, r5, #0
	adds r3, #8
	movs r0, #0
	movs r1, #0x11
	adds r2, r4, #0
	bl SpriteDebrisInit
	adds r3, r5, #0
	subs r3, #0x10
_0804A7B6:
	movs r0, #0
	movs r1, #0x12
	adds r2, r4, #0
	bl SpriteDebrisInit
	b _0804A81E
_0804A7C2:
	cmp r0, #3
	bne _0804A7E4
	adds r3, r7, #0
	subs r3, #8
	movs r0, #0
	movs r1, #0x13
	mov r2, r8
	bl SpriteDebrisInit
	adds r3, r7, #0
	adds r3, #0x10
	movs r0, #0
	movs r1, #4
	mov r2, r8
	bl SpriteDebrisInit
	b _0804A81E
_0804A7E4:
	cmp r0, #0
	bne _0804A81E
	ldr r0, _0804A7F4 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x3c
	strh r0, [r6, #0x12]
	b _0804A81E
	.align 2, 0
_0804A7F4: .4byte gSamusData
_0804A7F8:
	ldrh r1, [r6, #0x12]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhs _0804A808
	subs r0, r3, #4
	strh r0, [r6, #2]
	b _0804A81E
_0804A808:
	movs r0, #0x14
	mov r1, ip
	strb r0, [r1]
	ldr r0, _0804A828 @ =0x08379AD0
	str r0, [r6, #0x18]
	strb r2, [r6, #0x1c]
	strh r2, [r6, #0x16]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_0804A81E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804A828: .4byte 0x08379AD0

	thumb_func_start GeegaGoingForward
GeegaGoingForward: @ 0x0804A82C
	push {r4, lr}
	ldr r2, _0804A844 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _0804A848
	ldrh r0, [r3, #4]
	adds r0, #6
	b _0804A84C
	.align 2, 0
_0804A844: .4byte gCurrentSprite
_0804A848:
	ldrh r0, [r3, #4]
	subs r0, #6
_0804A84C:
	strh r0, [r3, #4]
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0804A886
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #6]
	strh r0, [r3, #2]
	ldrh r0, [r3, #8]
	strh r0, [r3, #4]
	ldr r0, _0804A88C @ =0x08379AA8
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r1, #0xa
	movs r0, #0x78
	strb r0, [r1]
_0804A886:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804A88C: .4byte 0x08379AA8

	thumb_func_start Geega
Geega: @ 0x0804A890
	push {lr}
	ldr r1, _0804A8A4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804A8A8
	bl SpriteUtilUpdateFreezeTimer
	b _0804A910
	.align 2, 0
_0804A8A4: .4byte gCurrentSprite
_0804A8A8:
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x57
	beq _0804A8F8
	cmp r0, #0x57
	bgt _0804A8CE
	cmp r0, #1
	beq _0804A8E6
	cmp r0, #1
	bgt _0804A8C4
	cmp r0, #0
	beq _0804A8E0
	b _0804A910
_0804A8C4:
	cmp r0, #2
	beq _0804A8EC
	cmp r0, #0x18
	beq _0804A8F2
	b _0804A910
_0804A8CE:
	cmp r0, #0x59
	beq _0804A902
	cmp r0, #0x59
	blt _0804A8FC
	cmp r0, #0x5a
	beq _0804A906
	cmp r0, #0x5b
	beq _0804A90C
	b _0804A910
_0804A8E0:
	bl GeegaInit
	b _0804A910
_0804A8E6:
	bl GeegaIdle
	b _0804A910
_0804A8EC:
	bl GeegaGoingUp
	b _0804A910
_0804A8F2:
	bl GeegaGoingForward
	b _0804A910
_0804A8F8:
	bl SpriteDyingInit
_0804A8FC:
	bl SpriteDying
	b _0804A910
_0804A902:
	bl GeegaInit
_0804A906:
	bl GeegaSpawningFromX
	b _0804A910
_0804A90C:
	bl XParasiteInit
_0804A910:
	pop {r0}
	bx r0

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
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
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

	thumb_func_start GenesisInit
GenesisInit: @ 0x0804ADA0
	push {r4, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804ADCC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804ADD0
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804ADD0
	strh r0, [r2]
	b _0804AE58
	.align 2, 0
_0804ADCC: .4byte gCurrentSprite
_0804ADD0:
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	ldr r0, _0804AE40 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x27
	movs r3, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	movs r2, #0
	ldr r1, _0804AE44 @ =0x0000FFC0
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	movs r0, #0x40
	strh r0, [r4, #0x10]
	ldr r0, _0804AE48 @ =0x0837C360
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r0, _0804AE4C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	ldr r2, _0804AE50 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r1, ip
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804AE54
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0804AE58
	.align 2, 0
_0804AE40: .4byte gCurrentSprite
_0804AE44: .4byte 0x0000FFC0
_0804AE48: .4byte 0x0837C360
_0804AE4C: .4byte gIoRegisters
_0804AE50: .4byte sPrimarySpriteStats
_0804AE54:
	movs r0, #1
	strb r0, [r1]
_0804AE58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenesisIdleInit
GenesisIdleInit: @ 0x0804AE60
	push {lr}
	ldr r3, _0804AE84 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	ldr r0, _0804AE88 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804AE90
	ldr r0, _0804AE8C @ =0x0837C360
	b _0804AE92
	.align 2, 0
_0804AE84: .4byte gCurrentSprite
_0804AE88: .4byte gSpriteRandomNumber
_0804AE8C: .4byte 0x0837C360
_0804AE90:
	ldr r0, _0804AE98 @ =0x0837C398
_0804AE92:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0804AE98: .4byte 0x0837C398

	thumb_func_start GenesisIdle
GenesisIdle: @ 0x0804AE9C
	push {r4, r5, lr}
	ldr r1, _0804AEF0 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _0804AEAE
	b _0804B000
_0804AEAE:
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804AEC8
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0804AEC8
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0804AEC8
	ldr r0, _0804AEF4 @ =0x000001C7
	bl SoundPlayNotAlreadyPlaying
_0804AEC8:
	ldr r4, _0804AEF0 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804AEFC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x48
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804AEF8 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804AF24
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x48
	b _0804AF16
	.align 2, 0
_0804AEF0: .4byte gCurrentSprite
_0804AEF4: .4byte 0x000001C7
_0804AEF8: .4byte gPreviousCollisionCheck
_0804AEFC:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x48
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804AF30 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804AF24
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x48
_0804AF16:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0804AF34
_0804AF24:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #9
	strb r0, [r1]
	b _0804B000
	.align 2, 0
_0804AF30: .4byte gPreviousCollisionCheck
_0804AF34:
	ldr r2, _0804AF54 @ =gCurrentSprite
	ldr r1, [r2, #0x18]
	ldr r0, _0804AF58 @ =0x0837C398
	movs r3, #1
	cmp r1, r0
	bne _0804AF42
	movs r3, #2
_0804AF42:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804AF5C
	ldrh r0, [r2, #4]
	adds r0, r3, r0
	b _0804AF60
	.align 2, 0
_0804AF54: .4byte gCurrentSprite
_0804AF58: .4byte 0x0837C398
_0804AF5C:
	ldrh r0, [r2, #4]
	subs r0, r0, r3
_0804AF60:
	strh r0, [r2, #4]
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B000
	ldr r1, _0804AF88 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0804AF8C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0xf
	bhi _0804B000
	lsls r0, r0, #2
	ldr r1, _0804AF90 @ =_0804AF94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804AF88: .4byte gCurrentSprite
_0804AF8C: .4byte gSpriteRandomNumber
_0804AF90: .4byte _0804AF94
_0804AF94: @ jump table
	.4byte _0804AFD4 @ case 0
	.4byte _0804AFD4 @ case 1
	.4byte _0804AFD4 @ case 2
	.4byte _0804AFD4 @ case 3
	.4byte _0804AFD4 @ case 4
	.4byte _0804AFD4 @ case 5
	.4byte _0804AFD4 @ case 6
	.4byte _0804AFD4 @ case 7
	.4byte _0804AFE4 @ case 8
	.4byte _0804AFE4 @ case 9
	.4byte _0804AFF4 @ case 10
	.4byte _0804AFF4 @ case 11
	.4byte _0804AFF4 @ case 12
	.4byte _0804AFFC @ case 13
	.4byte _0804AFFC @ case 14
	.4byte _0804AFFC @ case 15
_0804AFD4:
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x2a
	strb r1, [r0]
	ldr r0, _0804AFE0 @ =0x0837C478
	b _0804AFFE
	.align 2, 0
_0804AFE0: .4byte 0x0837C478
_0804AFE4:
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0xa
	strb r1, [r0]
	ldr r0, _0804AFF0 @ =0x0837C478
	b _0804AFFE
	.align 2, 0
_0804AFF0: .4byte 0x0837C478
_0804AFF4:
	ldr r0, _0804AFF8 @ =0x0837C398
	b _0804AFFE
	.align 2, 0
_0804AFF8: .4byte 0x0837C398
_0804AFFC:
	ldr r0, _0804B008 @ =0x0837C360
_0804AFFE:
	str r0, [r2, #0x18]
_0804B000:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804B008: .4byte 0x0837C360

	thumb_func_start GensisWaitingInit
GensisWaitingInit: @ 0x0804B00C
	ldr r1, _0804B024 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #8
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B028 @ =0x0837C478
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804B024: .4byte gCurrentSprite
_0804B028: .4byte 0x0837C478

	thumb_func_start GenesisWaiting
GenesisWaiting: @ 0x0804B02C
	push {r4, lr}
	ldr r4, _0804B04C @ =gCurrentSprite
	ldr r1, [r4, #0x18]
	ldr r0, _0804B050 @ =0x0837C478
	cmp r1, r0
	bne _0804B058
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B068
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0804B054 @ =0x0837C450
	str r0, [r4, #0x18]
	b _0804B068
	.align 2, 0
_0804B04C: .4byte gCurrentSprite
_0804B050: .4byte 0x0837C478
_0804B054: .4byte 0x0837C450
_0804B058:
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B068
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0804B068:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenesisReachedWallInit
GenesisReachedWallInit: @ 0x0804B070
	ldr r1, _0804B088 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0xa
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B08C @ =0x0837C478
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804B088: .4byte gCurrentSprite
_0804B08C: .4byte 0x0837C478

	thumb_func_start GenesisReachedWall
GenesisReachedWall: @ 0x0804B090
	push {r4, lr}
	ldr r4, _0804B0B0 @ =gCurrentSprite
	ldr r1, [r4, #0x18]
	ldr r0, _0804B0B4 @ =0x0837C478
	cmp r1, r0
	bne _0804B0BC
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B0CC
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0804B0B8 @ =0x0837C450
	str r0, [r4, #0x18]
	b _0804B0CC
	.align 2, 0
_0804B0B0: .4byte gCurrentSprite
_0804B0B4: .4byte 0x0837C478
_0804B0B8: .4byte 0x0837C450
_0804B0BC:
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B0CC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0804B0CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenesisTurningAroundInit
GenesisTurningAroundInit: @ 0x0804B0D4
	ldr r1, _0804B0EC @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B0F0 @ =0x0837C488
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804B0EC: .4byte gCurrentSprite
_0804B0F0: .4byte 0x0837C488

	thumb_func_start GenesisTurningAround
GenesisTurningAround: @ 0x0804B0F4
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B118
	ldr r1, _0804B11C @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0804B120 @ =0x0837C488
	str r0, [r1, #0x18]
	ldrh r0, [r1]
	movs r2, #0x40
	eors r0, r2
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #5
	strb r0, [r1]
_0804B118:
	pop {r0}
	bx r0
	.align 2, 0
_0804B11C: .4byte gCurrentSprite
_0804B120: .4byte 0x0837C488

	thumb_func_start GenesisTurningAroundSecondPart
GenesisTurningAroundSecondPart: @ 0x0804B124
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B136
	ldr r0, _0804B13C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0804B136:
	pop {r0}
	bx r0
	.align 2, 0
_0804B13C: .4byte gCurrentSprite

	thumb_func_start GenesisSpitting
GenesisSpitting: @ 0x0804B140
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0804B174 @ =gCurrentSprite
	ldr r1, [r4, #0x18]
	ldr r0, _0804B178 @ =0x0837C478
	cmp r1, r0
	bne _0804B180
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B202
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0804B17C @ =0x0837C498
	str r0, [r4, #0x18]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B202
	movs r0, #0xe4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _0804B202
	.align 2, 0
_0804B174: .4byte gCurrentSprite
_0804B178: .4byte 0x0837C478
_0804B17C: .4byte 0x0837C498
_0804B180:
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	adds r5, r0, #0
	cmp r5, #0
	beq _0804B1AA
	ldr r0, _0804B19C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _0804B1A0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0804B202
	.align 2, 0
_0804B19C: .4byte gSpriteRandomNumber
_0804B1A0:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0804B202
_0804B1AA:
	ldrh r0, [r4, #0x16]
	cmp r0, #0x11
	bne _0804B202
	ldrb r0, [r4, #0x1c]
	cmp r0, #6
	bne _0804B202
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0804B1E4
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x78
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x65
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0804B202
_0804B1E4:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	adds r0, #0x78
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x18
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x65
	movs r1, #0
	bl SpriteSpawnSecondary
_0804B202:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GenesisSpitInit
GenesisSpitInit: @ 0x0804B20C
	push {r4, lr}
	ldr r0, _0804B284 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0804B288 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r3, [r0]
	adds r0, #1
	movs r1, #8
	strb r1, [r0]
	ldr r0, _0804B28C @ =0x0000FFE0
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r4, [r2, #0xc]
	adds r0, #0x18
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	mov r1, ip
	adds r1, #0x25
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0804B290 @ =gIoRegisters
	ldrb r1, [r1, #0xa]
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0804B294 @ =0x0837C548
	str r0, [r2, #0x18]
	adds r1, #0xd
	movs r0, #6
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B284: .4byte gCurrentSprite
_0804B288: .4byte 0x0000FFFB
_0804B28C: .4byte 0x0000FFE0
_0804B290: .4byte gIoRegisters
_0804B294: .4byte 0x0837C548

	thumb_func_start GenesisSpitHanging
GenesisSpitHanging: @ 0x0804B298
	push {lr}
	ldr r2, _0804B2C4 @ =gCurrentSprite
	ldrh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #2]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804B2BE
	subs r1, #0xa
	movs r0, #0x16
	strb r0, [r1]
	adds r1, #0xd
	movs r0, #0
	strb r0, [r1]
_0804B2BE:
	pop {r0}
	bx r0
	.align 2, 0
_0804B2C4: .4byte gCurrentSprite

	thumb_func_start GenesisSpitSplashingInit
GenesisSpitSplashingInit: @ 0x0804B2C8
	push {lr}
	ldr r1, _0804B2F4 @ =gCurrentSprite
	ldr r0, _0804B2F8 @ =0x0837C558
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B2EE
	ldr r0, _0804B2FC @ =0x000001C9
	bl SoundPlayNotAlreadyPlaying
_0804B2EE:
	pop {r0}
	bx r0
	.align 2, 0
_0804B2F4: .4byte gCurrentSprite
_0804B2F8: .4byte 0x0837C558
_0804B2FC: .4byte 0x000001C9

	thumb_func_start GenesisSpitSplashing
GenesisSpitSplashing: @ 0x0804B300
	push {r4, lr}
	ldr r4, _0804B320 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B318
	movs r0, #0
	strh r0, [r4]
_0804B318:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B320: .4byte gCurrentSprite

	thumb_func_start Genesis
Genesis: @ 0x0804B324
	push {r4, lr}
	ldr r4, _0804B350 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804B33E
	movs r0, #0xe5
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804B33E:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804B354
	bl SpriteUtilUpdateFreezeTimer
	b _0804B53A
	.align 2, 0
_0804B350: .4byte gCurrentSprite
_0804B354:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804B360
	b _0804B53A
_0804B360:
	lsls r0, r0, #2
	ldr r1, _0804B36C @ =_0804B370
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B36C: .4byte _0804B370
_0804B370: @ jump table
	.4byte _0804B4E0 @ case 0
	.4byte _0804B4E6 @ case 1
	.4byte _0804B4EA @ case 2
	.4byte _0804B504 @ case 3
	.4byte _0804B508 @ case 4
	.4byte _0804B50E @ case 5
	.4byte _0804B53A @ case 6
	.4byte _0804B4F0 @ case 7
	.4byte _0804B4F4 @ case 8
	.4byte _0804B4FA @ case 9
	.4byte _0804B4FE @ case 10
	.4byte _0804B53A @ case 11
	.4byte _0804B53A @ case 12
	.4byte _0804B53A @ case 13
	.4byte _0804B53A @ case 14
	.4byte _0804B53A @ case 15
	.4byte _0804B53A @ case 16
	.4byte _0804B53A @ case 17
	.4byte _0804B53A @ case 18
	.4byte _0804B53A @ case 19
	.4byte _0804B53A @ case 20
	.4byte _0804B53A @ case 21
	.4byte _0804B53A @ case 22
	.4byte _0804B53A @ case 23
	.4byte _0804B53A @ case 24
	.4byte _0804B53A @ case 25
	.4byte _0804B53A @ case 26
	.4byte _0804B53A @ case 27
	.4byte _0804B53A @ case 28
	.4byte _0804B53A @ case 29
	.4byte _0804B53A @ case 30
	.4byte _0804B53A @ case 31
	.4byte _0804B53A @ case 32
	.4byte _0804B53A @ case 33
	.4byte _0804B53A @ case 34
	.4byte _0804B53A @ case 35
	.4byte _0804B53A @ case 36
	.4byte _0804B53A @ case 37
	.4byte _0804B53A @ case 38
	.4byte _0804B53A @ case 39
	.4byte _0804B53A @ case 40
	.4byte _0804B53A @ case 41
	.4byte _0804B514 @ case 42
	.4byte _0804B53A @ case 43
	.4byte _0804B53A @ case 44
	.4byte _0804B53A @ case 45
	.4byte _0804B53A @ case 46
	.4byte _0804B53A @ case 47
	.4byte _0804B53A @ case 48
	.4byte _0804B53A @ case 49
	.4byte _0804B53A @ case 50
	.4byte _0804B53A @ case 51
	.4byte _0804B53A @ case 52
	.4byte _0804B53A @ case 53
	.4byte _0804B53A @ case 54
	.4byte _0804B53A @ case 55
	.4byte _0804B53A @ case 56
	.4byte _0804B53A @ case 57
	.4byte _0804B53A @ case 58
	.4byte _0804B53A @ case 59
	.4byte _0804B53A @ case 60
	.4byte _0804B53A @ case 61
	.4byte _0804B53A @ case 62
	.4byte _0804B53A @ case 63
	.4byte _0804B53A @ case 64
	.4byte _0804B53A @ case 65
	.4byte _0804B53A @ case 66
	.4byte _0804B53A @ case 67
	.4byte _0804B53A @ case 68
	.4byte _0804B53A @ case 69
	.4byte _0804B53A @ case 70
	.4byte _0804B53A @ case 71
	.4byte _0804B53A @ case 72
	.4byte _0804B53A @ case 73
	.4byte _0804B53A @ case 74
	.4byte _0804B53A @ case 75
	.4byte _0804B53A @ case 76
	.4byte _0804B53A @ case 77
	.4byte _0804B53A @ case 78
	.4byte _0804B53A @ case 79
	.4byte _0804B53A @ case 80
	.4byte _0804B53A @ case 81
	.4byte _0804B53A @ case 82
	.4byte _0804B53A @ case 83
	.4byte _0804B53A @ case 84
	.4byte _0804B53A @ case 85
	.4byte _0804B53A @ case 86
	.4byte _0804B51A @ case 87
	.4byte _0804B51E @ case 88
	.4byte _0804B524 @ case 89
	.4byte _0804B528 @ case 90
	.4byte _0804B52E @ case 91
_0804B4E0:
	bl GenesisInit
	b _0804B53A
_0804B4E6:
	bl GenesisIdleInit
_0804B4EA:
	bl GenesisIdle
	b _0804B53A
_0804B4F0:
	bl GensisWaitingInit
_0804B4F4:
	bl GenesisWaiting
	b _0804B53A
_0804B4FA:
	bl GenesisReachedWallInit
_0804B4FE:
	bl GenesisReachedWall
	b _0804B53A
_0804B504:
	bl GenesisTurningAroundInit
_0804B508:
	bl GenesisTurningAround
	b _0804B53A
_0804B50E:
	bl GenesisTurningAroundSecondPart
	b _0804B53A
_0804B514:
	bl GenesisSpitting
	b _0804B53A
_0804B51A:
	bl SpriteDyingInit
_0804B51E:
	bl SpriteDying
	b _0804B53A
_0804B524:
	bl GenesisInit
_0804B528:
	bl SpriteSpawningFromX
	b _0804B53A
_0804B52E:
	bl XParasiteInit
	ldr r1, _0804B540 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_0804B53A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B540: .4byte gCurrentSprite

	thumb_func_start GenesisSpit
GenesisSpit: @ 0x0804B544
	push {lr}
	ldr r0, _0804B55C @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	bls _0804B552
	b _0804B65E
_0804B552:
	lsls r0, r0, #2
	ldr r1, _0804B560 @ =_0804B564
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804B55C: .4byte gCurrentSprite
_0804B560: .4byte _0804B564
_0804B564: @ jump table
	.4byte _0804B644 @ case 0
	.4byte _0804B65E @ case 1
	.4byte _0804B64A @ case 2
	.4byte _0804B65E @ case 3
	.4byte _0804B65E @ case 4
	.4byte _0804B65E @ case 5
	.4byte _0804B65E @ case 6
	.4byte _0804B650 @ case 7
	.4byte _0804B654 @ case 8
	.4byte _0804B65E @ case 9
	.4byte _0804B65E @ case 10
	.4byte _0804B65E @ case 11
	.4byte _0804B65E @ case 12
	.4byte _0804B65E @ case 13
	.4byte _0804B65E @ case 14
	.4byte _0804B65E @ case 15
	.4byte _0804B65E @ case 16
	.4byte _0804B65E @ case 17
	.4byte _0804B65E @ case 18
	.4byte _0804B65E @ case 19
	.4byte _0804B65E @ case 20
	.4byte _0804B65E @ case 21
	.4byte _0804B65A @ case 22
	.4byte _0804B65E @ case 23
	.4byte _0804B65E @ case 24
	.4byte _0804B65E @ case 25
	.4byte _0804B65E @ case 26
	.4byte _0804B65E @ case 27
	.4byte _0804B65E @ case 28
	.4byte _0804B65E @ case 29
	.4byte _0804B65E @ case 30
	.4byte _0804B65E @ case 31
	.4byte _0804B65E @ case 32
	.4byte _0804B65E @ case 33
	.4byte _0804B65E @ case 34
	.4byte _0804B65E @ case 35
	.4byte _0804B65E @ case 36
	.4byte _0804B65E @ case 37
	.4byte _0804B65E @ case 38
	.4byte _0804B65E @ case 39
	.4byte _0804B65E @ case 40
	.4byte _0804B65E @ case 41
	.4byte _0804B65E @ case 42
	.4byte _0804B65E @ case 43
	.4byte _0804B65E @ case 44
	.4byte _0804B65E @ case 45
	.4byte _0804B65E @ case 46
	.4byte _0804B65E @ case 47
	.4byte _0804B65E @ case 48
	.4byte _0804B65E @ case 49
	.4byte _0804B65E @ case 50
	.4byte _0804B65E @ case 51
	.4byte _0804B65E @ case 52
	.4byte _0804B65E @ case 53
	.4byte _0804B65E @ case 54
	.4byte _0804B650 @ case 55
_0804B644:
	bl GenesisSpitInit
	b _0804B65E
_0804B64A:
	bl GenesisSpitHanging
	b _0804B65E
_0804B650:
	bl GenesisSpitSplashingInit
_0804B654:
	bl GenesisSpitSplashing
	b _0804B65E
_0804B65A:
	bl CurrentSpriteFalling
_0804B65E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PuyoInit
PuyoInit: @ 0x0804B664
	push {r4, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804B690 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B694
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804B694
	strh r0, [r2]
	b _0804B708
	.align 2, 0
_0804B690: .4byte gCurrentSprite
_0804B694:
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	ldr r0, _0804B6F4 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x27
	movs r3, #0
	movs r1, #0x10
	strb r1, [r0]
	mov r0, ip
	adds r0, #0x28
	strb r3, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r2, #0
	ldr r1, _0804B6F8 @ =0x0000FFE0
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x10]
	ldr r0, _0804B6FC @ =0x0837CE44
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r2, _0804B700 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r1, ip
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804B704
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0804B708
	.align 2, 0
_0804B6F4: .4byte gCurrentSprite
_0804B6F8: .4byte 0x0000FFE0
_0804B6FC: .4byte 0x0837CE44
_0804B700: .4byte sPrimarySpriteStats
_0804B704:
	movs r0, #1
	strb r0, [r1]
_0804B708:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PuyoFallingInit
PuyoFallingInit: @ 0x0804B710
	ldr r3, _0804B72C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	ldr r0, _0804B730 @ =0x0837CE44
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_0804B72C: .4byte gCurrentSprite
_0804B730: .4byte 0x0837CE44

	thumb_func_start PuyoIdleInit
PuyoIdleInit: @ 0x0804B734
	ldr r1, _0804B74C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0804B750 @ =0x0837CE6C
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804B74C: .4byte gCurrentSprite
_0804B750: .4byte 0x0837CE6C

	thumb_func_start PuyoIdle
PuyoIdle: @ 0x0804B754
	push {r4, r5, r6, lr}
	ldr r1, _0804B794 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _0804B766
	b _0804B894
_0804B766:
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804B780
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0804B780
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0804B780
	ldr r0, _0804B798 @ =0x000001C3
	bl SoundPlayNotAlreadyPlaying
_0804B780:
	bl unk_1129c
	ldr r0, _0804B79C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804B7A0
	ldr r0, _0804B794 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _0804B892
	.align 2, 0
_0804B794: .4byte gCurrentSprite
_0804B798: .4byte 0x000001C3
_0804B79C: .4byte gPreviousVerticalCollisionCheck
_0804B7A0:
	ldr r4, _0804B7CC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r6, #0x40
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804B7D4
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804B7D0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804B7FC
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x40
	b _0804B7EE
	.align 2, 0
_0804B7CC: .4byte gCurrentSprite
_0804B7D0: .4byte gPreviousCollisionCheck
_0804B7D4:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0804B80C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804B7FC
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x40
_0804B7EE:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0804B810
_0804B7FC:
	ldrh r0, [r4]
	eors r0, r6
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	b _0804B894
	.align 2, 0
_0804B80C: .4byte gPreviousCollisionCheck
_0804B810:
	ldr r1, _0804B824 @ =gCurrentSprite
	ldrh r2, [r1, #0x16]
	subs r0, r2, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r4, r1, #0
	cmp r0, #1
	bhi _0804B828
	movs r3, #4
	b _0804B830
	.align 2, 0
_0804B824: .4byte gCurrentSprite
_0804B828:
	movs r3, #0
	cmp r2, #3
	bne _0804B830
	movs r3, #8
_0804B830:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804B840
	ldrh r0, [r4, #4]
	adds r0, r3, r0
	b _0804B844
_0804B840:
	ldrh r0, [r4, #4]
	subs r0, r0, r3
_0804B844:
	strh r0, [r4, #4]
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B894
	movs r1, #0xc0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #4
	bne _0804B870
	ldr r1, _0804B868 @ =gCurrentSprite
	ldrh r2, [r1]
	ldr r0, _0804B86C @ =0x0000FFBF
	ands r0, r2
	b _0804B87C
	.align 2, 0
_0804B868: .4byte gCurrentSprite
_0804B86C: .4byte 0x0000FFBF
_0804B870:
	cmp r0, #8
	bne _0804B88C
	ldr r1, _0804B888 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x40
	orrs r0, r2
_0804B87C:
	strh r0, [r1]
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _0804B894
	.align 2, 0
_0804B888: .4byte gCurrentSprite
_0804B88C:
	ldr r0, _0804B89C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
_0804B892:
	strb r1, [r0]
_0804B894:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B89C: .4byte gCurrentSprite

	thumb_func_start PuyoWaitingInit
PuyoWaitingInit: @ 0x0804B8A0
	ldr r1, _0804B8C4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #8
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B8C8 @ =0x0837CE44
	str r0, [r1, #0x18]
	ldr r0, _0804B8CC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #2
	adds r0, #1
	adds r1, #0x2e
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804B8C4: .4byte gCurrentSprite
_0804B8C8: .4byte 0x0837CE44
_0804B8CC: .4byte gSpriteRandomNumber

	thumb_func_start PuyoWaiting
PuyoWaiting: @ 0x0804B8D0
	push {lr}
	bl unk_1129c
	ldr r0, _0804B8E8 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804B8F0
	ldr r0, _0804B8EC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0804B91C
	.align 2, 0
_0804B8E8: .4byte gPreviousVerticalCollisionCheck
_0804B8EC: .4byte gCurrentSprite
_0804B8F0:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B91C
	ldr r3, _0804B920 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0804B91C
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	ldr r0, _0804B924 @ =0x0837CE6C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
_0804B91C:
	pop {r0}
	bx r0
	.align 2, 0
_0804B920: .4byte gCurrentSprite
_0804B924: .4byte 0x0837CE6C

	thumb_func_start PuyoJumpWarningInit
PuyoJumpWarningInit: @ 0x0804B928
	ldr r1, _0804B940 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804B944 @ =0x0837CEA4
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804B940: .4byte gCurrentSprite
_0804B944: .4byte 0x0837CEA4

	thumb_func_start PuyoJumpWarning
PuyoJumpWarning: @ 0x0804B948
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804B980
	ldr r3, _0804B984 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2c
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	ldr r0, _0804B988 @ =0x0837CEC4
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	ldrh r1, [r3]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804B980
	movs r0, #0xe2
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804B980:
	pop {r0}
	bx r0
	.align 2, 0
_0804B984: .4byte gCurrentSprite
_0804B988: .4byte 0x0837CEC4

	thumb_func_start PuyoJumpingUp
PuyoJumpingUp: @ 0x0804B98C
	push {r4, r5, r6, r7, lr}
	ldr r4, _0804B9B4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804B9B8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0804B9BC
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2e
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x31
	strb r2, [r0]
	b _0804BA9A
	.align 2, 0
_0804B9B4: .4byte gCurrentSprite
_0804B9B8: .4byte gPreviousCollisionCheck
_0804B9BC:
	adds r3, r4, #0
	adds r3, #0x31
	ldrb r0, [r3]
	cmp r0, #0x1e
	bls _0804B9D4
	adds r0, r4, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x2e
	strb r1, [r0]
	strb r2, [r3]
	b _0804BA0A
_0804B9D4:
	ldrb r2, [r3]
	ldr r6, _0804B9F8 @ =0x0837C578
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804B9FC @ =0x00007FFF
	cmp r1, r0
	bne _0804BA00
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804BA08
	.align 2, 0
_0804B9F8: .4byte 0x0837C578
_0804B9FC: .4byte 0x00007FFF
_0804BA00:
	adds r0, r2, #1
	strb r0, [r3]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
_0804BA08:
	strh r0, [r4, #2]
_0804BA0A:
	movs r4, #0
	ldr r2, _0804BA34 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804BA3C
	ldrh r0, [r2, #2]
	subs r0, #8
	ldrh r1, [r2, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804BA38 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r4, r0, #0x1f
	b _0804BA56
	.align 2, 0
_0804BA34: .4byte gCurrentSprite
_0804BA38: .4byte gPreviousCollisionCheck
_0804BA3C:
	ldrh r0, [r2, #2]
	subs r0, #8
	ldrh r1, [r2, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804BA74 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0804BA56
	movs r4, #1
_0804BA56:
	cmp r4, #0
	beq _0804BA7C
	ldr r2, _0804BA78 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	movs r3, #0
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
	adds r2, #0x31
	strb r3, [r2]
	b _0804BA9A
	.align 2, 0
_0804BA74: .4byte gPreviousCollisionCheck
_0804BA78: .4byte gCurrentSprite
_0804BA7C:
	ldr r2, _0804BA90 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804BA94
	ldrh r0, [r2, #4]
	adds r0, #2
	b _0804BA98
	.align 2, 0
_0804BA90: .4byte gCurrentSprite
_0804BA94:
	ldrh r0, [r2, #4]
	subs r0, #2
_0804BA98:
	strh r0, [r2, #4]
_0804BA9A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start PuyoJumpingDown
PuyoJumpingDown: @ 0x0804BAA0
	push {r4, r5, r6, lr}
	ldr r4, _0804BAE0 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0804BAE4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804BAF0
	movs r2, #0
	movs r3, #0
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x30
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r0, _0804BAE8 @ =0x0837CED4
	str r0, [r4, #0x18]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804BB2C
	ldr r0, _0804BAEC @ =0x000001C5
	bl SoundPlayNotAlreadyPlaying
	b _0804BB2C
	.align 2, 0
_0804BAE0: .4byte gCurrentSprite
_0804BAE4: .4byte gPreviousVerticalCollisionCheck
_0804BAE8: .4byte 0x0837CED4
_0804BAEC: .4byte 0x000001C5
_0804BAF0:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0804BB18 @ =0x0837C5B8
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0804BB1C @ =0x00007FFF
	cmp r1, r0
	bne _0804BB20
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804BB2A
	.align 2, 0
_0804BB18: .4byte 0x0837C5B8
_0804BB1C: .4byte 0x00007FFF
_0804BB20:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_0804BB2A:
	strh r0, [r4, #2]
_0804BB2C:
	movs r4, #0
	ldr r2, _0804BB58 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804BB60
	ldrh r0, [r2, #2]
	subs r0, #8
	ldrh r1, [r2, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804BB5C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r4, r0, #0x1f
	b _0804BB7A
	.align 2, 0
_0804BB58: .4byte gCurrentSprite
_0804BB5C: .4byte gPreviousCollisionCheck
_0804BB60:
	ldrh r0, [r2, #2]
	subs r0, #8
	ldrh r1, [r2, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804BB98 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0804BB7A
	movs r4, #1
_0804BB7A:
	ldr r2, _0804BB9C @ =gCurrentSprite
	cmp r4, #0
	beq _0804BB88
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_0804BB88:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804BBA0
	ldrh r0, [r2, #4]
	adds r0, #2
	b _0804BBA4
	.align 2, 0
_0804BB98: .4byte gPreviousCollisionCheck
_0804BB9C: .4byte gCurrentSprite
_0804BBA0:
	ldrh r0, [r2, #4]
	subs r0, #2
_0804BBA4:
	strh r0, [r2, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start PuyoLanding
PuyoLanding: @ 0x0804BBAC
	push {lr}
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804BBBE
	ldr r0, _0804BBC4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
	strb r1, [r0]
_0804BBBE:
	pop {r0}
	bx r0
	.align 2, 0
_0804BBC4: .4byte gCurrentSprite

	thumb_func_start Puyo
Puyo: @ 0x0804BBC8
	push {r4, lr}
	ldr r4, _0804BBF4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804BBE2
	movs r0, #0xe3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804BBE2:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804BBF8
	bl SpriteUtilUpdateFreezeTimer
	b _0804BDE4
	.align 2, 0
_0804BBF4: .4byte gCurrentSprite
_0804BBF8:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804BC04
	b _0804BDE4
_0804BC04:
	lsls r0, r0, #2
	ldr r1, _0804BC10 @ =_0804BC14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804BC10: .4byte _0804BC14
_0804BC14: @ jump table
	.4byte _0804BD84 @ case 0
	.4byte _0804BD8A @ case 1
	.4byte _0804BD8E @ case 2
	.4byte _0804BDE4 @ case 3
	.4byte _0804BDE4 @ case 4
	.4byte _0804BDE4 @ case 5
	.4byte _0804BDE4 @ case 6
	.4byte _0804BD94 @ case 7
	.4byte _0804BD98 @ case 8
	.4byte _0804BDE4 @ case 9
	.4byte _0804BDE4 @ case 10
	.4byte _0804BDE4 @ case 11
	.4byte _0804BDE4 @ case 12
	.4byte _0804BDE4 @ case 13
	.4byte _0804BDE4 @ case 14
	.4byte _0804BDE4 @ case 15
	.4byte _0804BDE4 @ case 16
	.4byte _0804BDE4 @ case 17
	.4byte _0804BDE4 @ case 18
	.4byte _0804BDE4 @ case 19
	.4byte _0804BDE4 @ case 20
	.4byte _0804BDBA @ case 21
	.4byte _0804BDBE @ case 22
	.4byte _0804BDE4 @ case 23
	.4byte _0804BDE4 @ case 24
	.4byte _0804BDE4 @ case 25
	.4byte _0804BDE4 @ case 26
	.4byte _0804BDE4 @ case 27
	.4byte _0804BDE4 @ case 28
	.4byte _0804BDE4 @ case 29
	.4byte _0804BDE4 @ case 30
	.4byte _0804BDE4 @ case 31
	.4byte _0804BDE4 @ case 32
	.4byte _0804BDE4 @ case 33
	.4byte _0804BDE4 @ case 34
	.4byte _0804BDE4 @ case 35
	.4byte _0804BDE4 @ case 36
	.4byte _0804BDE4 @ case 37
	.4byte _0804BDE4 @ case 38
	.4byte _0804BDE4 @ case 39
	.4byte _0804BDE4 @ case 40
	.4byte _0804BD9E @ case 41
	.4byte _0804BDA2 @ case 42
	.4byte _0804BDE4 @ case 43
	.4byte _0804BDA8 @ case 44
	.4byte _0804BDE4 @ case 45
	.4byte _0804BDAE @ case 46
	.4byte _0804BDE4 @ case 47
	.4byte _0804BDB4 @ case 48
	.4byte _0804BDE4 @ case 49
	.4byte _0804BDE4 @ case 50
	.4byte _0804BDE4 @ case 51
	.4byte _0804BDE4 @ case 52
	.4byte _0804BDE4 @ case 53
	.4byte _0804BDE4 @ case 54
	.4byte _0804BDE4 @ case 55
	.4byte _0804BDE4 @ case 56
	.4byte _0804BDE4 @ case 57
	.4byte _0804BDE4 @ case 58
	.4byte _0804BDE4 @ case 59
	.4byte _0804BDE4 @ case 60
	.4byte _0804BDE4 @ case 61
	.4byte _0804BDE4 @ case 62
	.4byte _0804BDE4 @ case 63
	.4byte _0804BDE4 @ case 64
	.4byte _0804BDE4 @ case 65
	.4byte _0804BDE4 @ case 66
	.4byte _0804BDE4 @ case 67
	.4byte _0804BDE4 @ case 68
	.4byte _0804BDE4 @ case 69
	.4byte _0804BDE4 @ case 70
	.4byte _0804BDE4 @ case 71
	.4byte _0804BDE4 @ case 72
	.4byte _0804BDE4 @ case 73
	.4byte _0804BDE4 @ case 74
	.4byte _0804BDE4 @ case 75
	.4byte _0804BDE4 @ case 76
	.4byte _0804BDE4 @ case 77
	.4byte _0804BDE4 @ case 78
	.4byte _0804BDE4 @ case 79
	.4byte _0804BDE4 @ case 80
	.4byte _0804BDE4 @ case 81
	.4byte _0804BDE4 @ case 82
	.4byte _0804BDE4 @ case 83
	.4byte _0804BDE4 @ case 84
	.4byte _0804BDE4 @ case 85
	.4byte _0804BDE4 @ case 86
	.4byte _0804BDC4 @ case 87
	.4byte _0804BDC8 @ case 88
	.4byte _0804BDCE @ case 89
	.4byte _0804BDD2 @ case 90
	.4byte _0804BDD8 @ case 91
_0804BD84:
	bl PuyoInit
	b _0804BDE4
_0804BD8A:
	bl PuyoIdleInit
_0804BD8E:
	bl PuyoIdle
	b _0804BDE4
_0804BD94:
	bl PuyoWaitingInit
_0804BD98:
	bl PuyoWaiting
	b _0804BDE4
_0804BD9E:
	bl PuyoJumpWarningInit
_0804BDA2:
	bl PuyoJumpWarning
	b _0804BDE4
_0804BDA8:
	bl PuyoJumpingUp
	b _0804BDE4
_0804BDAE:
	bl PuyoJumpingDown
	b _0804BDE4
_0804BDB4:
	bl PuyoLanding
	b _0804BDE4
_0804BDBA:
	bl PuyoFallingInit
_0804BDBE:
	bl CurrentSpriteFalling
	b _0804BDE4
_0804BDC4:
	bl SpriteDyingInit
_0804BDC8:
	bl SpriteDying
	b _0804BDE4
_0804BDCE:
	bl PuyoInit
_0804BDD2:
	bl SpriteSpawningFromX
	b _0804BDE4
_0804BDD8:
	bl XParasiteInit
	ldr r1, _0804BDEC @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_0804BDE4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BDEC: .4byte gCurrentSprite

	thumb_func_start FakeTankInit
FakeTankInit: @ 0x0804BDF0
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804BE1C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804BE20
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804BE20
	strh r0, [r2]
	b _0804BE98
	.align 2, 0
_0804BE1C: .4byte gCurrentSprite
_0804BE20:
	ldr r0, _0804BE88 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x27
	movs r4, #0
	movs r2, #0x10
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x28
	movs r3, #8
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	movs r5, #0
	ldr r0, _0804BE8C @ =0x0000FFC0
	mov r1, ip
	strh r0, [r1, #0xa]
	strh r4, [r1, #0xc]
	adds r0, #0x20
	strh r0, [r1, #0xe]
	movs r0, #0x20
	strh r0, [r1, #0x10]
	strb r5, [r1, #0x1c]
	strh r4, [r1, #0x16]
	ldr r2, _0804BE90 @ =sPrimarySpriteStats
	ldrb r1, [r1, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x14]
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r3, r0
	strb r3, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r5, [r0]
	subs r1, #0x10
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804BE94
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	mov r1, ip
	strh r0, [r1, #6]
	b _0804BE98
	.align 2, 0
_0804BE88: .4byte gCurrentSprite
_0804BE8C: .4byte 0x0000FFC0
_0804BE90: .4byte sPrimarySpriteStats
_0804BE94:
	movs r0, #1
	strb r0, [r1]
_0804BE98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FakeTankIdleInit
FakeTankIdleInit: @ 0x0804BEA0
	ldr r1, _0804BEB4 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	bx lr
	.align 2, 0
_0804BEB4: .4byte gCurrentSprite

	thumb_func_start FakeTankIdle
FakeTankIdle: @ 0x0804BEB8
	push {r4, lr}
	ldr r4, _0804BEE4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0804BEDE
	movs r0, #0xc0
	movs r1, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804BEDE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_0804BEDE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804BEE4: .4byte gCurrentSprite

	thumb_func_start FakeTankWakingUpInit
FakeTankWakingUpInit: @ 0x0804BEE8
	ldr r3, _0804BF1C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	adds r2, #0x10
	ldrb r1, [r2]
	movs r0, #0xf7
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0804BF20 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804BF1C: .4byte gCurrentSprite
_0804BF20: .4byte gIoRegisters

	thumb_func_start FakeTankWakingUp
FakeTankWakingUp: @ 0x0804BF24
	push {lr}
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804BF36
	ldr r0, _0804BF3C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x19
	strb r1, [r0]
_0804BF36:
	pop {r0}
	bx r0
	.align 2, 0
_0804BF3C: .4byte gCurrentSprite

	thumb_func_start FakeTankFlyingInit
FakeTankFlyingInit: @ 0x0804BF40
	ldr r3, _0804BF64 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x1a
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x31
	strb r1, [r0]
	adds r2, #0xa
	movs r0, #0x3c
	strb r0, [r2]
	adds r2, #1
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_0804BF64: .4byte gCurrentSprite

	thumb_func_start FakeTankFlying
FakeTankFlying: @ 0x0804BF68
	push {r4, r5, r6, lr}
	ldr r2, _0804BF84 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804BF88
	subs r0, #1
	strb r0, [r1]
	ldrh r0, [r2, #2]
	subs r0, #4
	strh r0, [r2, #2]
	b _0804BFC8
	.align 2, 0
_0804BF84: .4byte gCurrentSprite
_0804BF88:
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _0804BFD0 @ =0x0837CEEC
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0804BFD4 @ =0x00007FFF
	cmp r1, r0
	bne _0804BFA6
	ldrh r4, [r5]
	movs r3, #0
_0804BFA6:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
	strh r0, [r2, #2]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804BFC8
	subs r1, #0xb
	movs r0, #0x1b
	strb r0, [r1]
_0804BFC8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804BFD0: .4byte 0x0837CEEC
_0804BFD4: .4byte 0x00007FFF

	thumb_func_start FakeTankFlyingAwayInit
FakeTankFlyingAwayInit: @ 0x0804BFD8
	ldr r0, _0804C008 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x1c
	strb r0, [r1]
	movs r3, #0
	movs r0, #0x96
	lsls r0, r0, #1
	mov r1, ip
	strh r0, [r1, #6]
	strh r2, [r1, #8]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r3, [r0]
	adds r0, #3
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804C008: .4byte gCurrentSprite

	thumb_func_start FakeTankFlyingAway
FakeTankFlyingAway: @ 0x0804C00C
	push {lr}
	sub sp, #4
	ldr r0, _0804C028 @ =gXParasiteTargetYPosition
	ldrh r3, [r0]
	ldr r0, _0804C02C @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	ldr r1, _0804C030 @ =gCurrentSprite
	ldrh r0, [r1, #8]
	cmp r0, #1
	beq _0804C034
	cmp r0, #3
	beq _0804C04E
	b _0804C070
	.align 2, 0
_0804C028: .4byte gXParasiteTargetYPosition
_0804C02C: .4byte gXParasiteTargetXPosition
_0804C030: .4byte gCurrentSprite
_0804C034:
	adds r0, r3, #0
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804C068
	adds r0, r2, #0
	subs r0, #0x48
	b _0804C06C
_0804C04E:
	adds r0, r3, #0
	adds r0, #0x48
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804C068
	adds r0, r2, #0
	subs r0, #0x48
	b _0804C06C
_0804C068:
	adds r0, r2, #0
	adds r0, #0x48
_0804C06C:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0804C070:
	movs r0, #2
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r2, #0
	movs r2, #0x10
	movs r3, #0x18
	bl unk_136ac
	ldr r1, _0804C09C @ =gCurrentSprite
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804C094
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0804C094:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0804C09C: .4byte gCurrentSprite

	thumb_func_start FakeTankLeaving
FakeTankLeaving: @ 0x0804C0A0
	push {r4, lr}
	ldr r0, _0804C0CC @ =gCurrentSprite
	adds r3, r0, #0
	adds r3, #0x30
	ldrb r2, [r3]
	adds r4, r0, #0
	cmp r2, #0xc7
	bhi _0804C0B4
	adds r0, r2, #1
	strb r0, [r3]
_0804C0B4:
	ldrb r0, [r3]
	lsrs r2, r0, #3
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804C0D0
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	b _0804C0D4
	.align 2, 0
_0804C0CC: .4byte gCurrentSprite
_0804C0D0:
	ldrh r0, [r4, #4]
	subs r0, r0, r2
_0804C0D4:
	strh r0, [r4, #4]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _0804C0E4
	adds r0, #1
	strb r0, [r1]
_0804C0E4:
	ldrb r0, [r1]
	lsrs r2, r0, #3
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804C0FA
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	b _0804C0FE
_0804C0FA:
	ldrh r0, [r4, #2]
	subs r0, r0, r2
_0804C0FE:
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804C110
	strh r0, [r4]
_0804C110:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FakeEnergyTank
FakeEnergyTank: @ 0x0804C118
	push {lr}
	ldr r0, _0804C130 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0804C134
	bl SpriteUtilUpdateFreezeTimer
	b _0804C340
	.align 2, 0
_0804C130: .4byte gCurrentSprite
_0804C134:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804C140
	b _0804C340
_0804C140:
	lsls r0, r0, #2
	ldr r1, _0804C14C @ =_0804C150
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804C14C: .4byte _0804C150
_0804C150: @ jump table
	.4byte _0804C2C0 @ case 0
	.4byte _0804C2D4 @ case 1
	.4byte _0804C2DC @ case 2
	.4byte _0804C340 @ case 3
	.4byte _0804C340 @ case 4
	.4byte _0804C340 @ case 5
	.4byte _0804C340 @ case 6
	.4byte _0804C340 @ case 7
	.4byte _0804C340 @ case 8
	.4byte _0804C340 @ case 9
	.4byte _0804C340 @ case 10
	.4byte _0804C340 @ case 11
	.4byte _0804C340 @ case 12
	.4byte _0804C340 @ case 13
	.4byte _0804C340 @ case 14
	.4byte _0804C340 @ case 15
	.4byte _0804C340 @ case 16
	.4byte _0804C340 @ case 17
	.4byte _0804C340 @ case 18
	.4byte _0804C340 @ case 19
	.4byte _0804C340 @ case 20
	.4byte _0804C340 @ case 21
	.4byte _0804C340 @ case 22
	.4byte _0804C2E8 @ case 23
	.4byte _0804C2F0 @ case 24
	.4byte _0804C2FC @ case 25
	.4byte _0804C304 @ case 26
	.4byte _0804C310 @ case 27
	.4byte _0804C314 @ case 28
	.4byte _0804C340 @ case 29
	.4byte _0804C31A @ case 30
	.4byte _0804C340 @ case 31
	.4byte _0804C340 @ case 32
	.4byte _0804C340 @ case 33
	.4byte _0804C340 @ case 34
	.4byte _0804C340 @ case 35
	.4byte _0804C340 @ case 36
	.4byte _0804C340 @ case 37
	.4byte _0804C340 @ case 38
	.4byte _0804C340 @ case 39
	.4byte _0804C340 @ case 40
	.4byte _0804C340 @ case 41
	.4byte _0804C340 @ case 42
	.4byte _0804C340 @ case 43
	.4byte _0804C340 @ case 44
	.4byte _0804C340 @ case 45
	.4byte _0804C340 @ case 46
	.4byte _0804C340 @ case 47
	.4byte _0804C340 @ case 48
	.4byte _0804C340 @ case 49
	.4byte _0804C340 @ case 50
	.4byte _0804C340 @ case 51
	.4byte _0804C340 @ case 52
	.4byte _0804C340 @ case 53
	.4byte _0804C340 @ case 54
	.4byte _0804C340 @ case 55
	.4byte _0804C340 @ case 56
	.4byte _0804C340 @ case 57
	.4byte _0804C340 @ case 58
	.4byte _0804C340 @ case 59
	.4byte _0804C340 @ case 60
	.4byte _0804C340 @ case 61
	.4byte _0804C340 @ case 62
	.4byte _0804C340 @ case 63
	.4byte _0804C340 @ case 64
	.4byte _0804C340 @ case 65
	.4byte _0804C340 @ case 66
	.4byte _0804C340 @ case 67
	.4byte _0804C340 @ case 68
	.4byte _0804C340 @ case 69
	.4byte _0804C340 @ case 70
	.4byte _0804C340 @ case 71
	.4byte _0804C340 @ case 72
	.4byte _0804C340 @ case 73
	.4byte _0804C340 @ case 74
	.4byte _0804C340 @ case 75
	.4byte _0804C340 @ case 76
	.4byte _0804C340 @ case 77
	.4byte _0804C340 @ case 78
	.4byte _0804C340 @ case 79
	.4byte _0804C340 @ case 80
	.4byte _0804C340 @ case 81
	.4byte _0804C340 @ case 82
	.4byte _0804C340 @ case 83
	.4byte _0804C340 @ case 84
	.4byte _0804C340 @ case 85
	.4byte _0804C340 @ case 86
	.4byte _0804C320 @ case 87
	.4byte _0804C324 @ case 88
	.4byte _0804C32A @ case 89
	.4byte _0804C32E @ case 90
	.4byte _0804C334 @ case 91
_0804C2C0:
	bl FakeTankInit
	ldr r1, _0804C2CC @ =gCurrentSprite
	ldr r0, _0804C2D0 @ =0x0837D85C
	str r0, [r1, #0x18]
	b _0804C340
	.align 2, 0
_0804C2CC: .4byte gCurrentSprite
_0804C2D0: .4byte 0x0837D85C
_0804C2D4:
	ldr r0, _0804C2E4 @ =0x0837D85C
	str r0, [r2, #0x18]
	bl FakeTankIdleInit
_0804C2DC:
	bl FakeTankIdle
	b _0804C340
	.align 2, 0
_0804C2E4: .4byte 0x0837D85C
_0804C2E8:
	ldr r0, _0804C2F8 @ =0x0837D884
	str r0, [r2, #0x18]
	bl FakeTankWakingUpInit
_0804C2F0:
	bl FakeTankWakingUp
	b _0804C340
	.align 2, 0
_0804C2F8: .4byte 0x0837D884
_0804C2FC:
	ldr r0, _0804C30C @ =0x0837D8BC
	str r0, [r2, #0x18]
	bl FakeTankFlyingInit
_0804C304:
	bl FakeTankFlying
	b _0804C340
	.align 2, 0
_0804C30C: .4byte 0x0837D8BC
_0804C310:
	bl FakeTankFlyingAwayInit
_0804C314:
	bl FakeTankFlyingAway
	b _0804C340
_0804C31A:
	bl FakeTankLeaving
	b _0804C340
_0804C320:
	bl SpriteDyingInit
_0804C324:
	bl SpriteDying
	b _0804C340
_0804C32A:
	bl FakeTankInit
_0804C32E:
	bl SpriteSpawningFromX
	b _0804C340
_0804C334:
	bl XParasiteInit
	ldr r1, _0804C344 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_0804C340:
	pop {r0}
	bx r0
	.align 2, 0
_0804C344: .4byte gCurrentSprite

	thumb_func_start FakeMissileTank
FakeMissileTank: @ 0x0804C348
	push {lr}
	ldr r0, _0804C360 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x32
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _0804C364
	bl SpriteUtilUpdateFreezeTimer
	b _0804C570
	.align 2, 0
_0804C360: .4byte gCurrentSprite
_0804C364:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804C370
	b _0804C570
_0804C370:
	lsls r0, r0, #2
	ldr r1, _0804C37C @ =_0804C380
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804C37C: .4byte _0804C380
_0804C380: @ jump table
	.4byte _0804C4F0 @ case 0
	.4byte _0804C504 @ case 1
	.4byte _0804C50C @ case 2
	.4byte _0804C570 @ case 3
	.4byte _0804C570 @ case 4
	.4byte _0804C570 @ case 5
	.4byte _0804C570 @ case 6
	.4byte _0804C570 @ case 7
	.4byte _0804C570 @ case 8
	.4byte _0804C570 @ case 9
	.4byte _0804C570 @ case 10
	.4byte _0804C570 @ case 11
	.4byte _0804C570 @ case 12
	.4byte _0804C570 @ case 13
	.4byte _0804C570 @ case 14
	.4byte _0804C570 @ case 15
	.4byte _0804C570 @ case 16
	.4byte _0804C570 @ case 17
	.4byte _0804C570 @ case 18
	.4byte _0804C570 @ case 19
	.4byte _0804C570 @ case 20
	.4byte _0804C570 @ case 21
	.4byte _0804C570 @ case 22
	.4byte _0804C518 @ case 23
	.4byte _0804C520 @ case 24
	.4byte _0804C52C @ case 25
	.4byte _0804C534 @ case 26
	.4byte _0804C540 @ case 27
	.4byte _0804C544 @ case 28
	.4byte _0804C570 @ case 29
	.4byte _0804C54A @ case 30
	.4byte _0804C570 @ case 31
	.4byte _0804C570 @ case 32
	.4byte _0804C570 @ case 33
	.4byte _0804C570 @ case 34
	.4byte _0804C570 @ case 35
	.4byte _0804C570 @ case 36
	.4byte _0804C570 @ case 37
	.4byte _0804C570 @ case 38
	.4byte _0804C570 @ case 39
	.4byte _0804C570 @ case 40
	.4byte _0804C570 @ case 41
	.4byte _0804C570 @ case 42
	.4byte _0804C570 @ case 43
	.4byte _0804C570 @ case 44
	.4byte _0804C570 @ case 45
	.4byte _0804C570 @ case 46
	.4byte _0804C570 @ case 47
	.4byte _0804C570 @ case 48
	.4byte _0804C570 @ case 49
	.4byte _0804C570 @ case 50
	.4byte _0804C570 @ case 51
	.4byte _0804C570 @ case 52
	.4byte _0804C570 @ case 53
	.4byte _0804C570 @ case 54
	.4byte _0804C570 @ case 55
	.4byte _0804C570 @ case 56
	.4byte _0804C570 @ case 57
	.4byte _0804C570 @ case 58
	.4byte _0804C570 @ case 59
	.4byte _0804C570 @ case 60
	.4byte _0804C570 @ case 61
	.4byte _0804C570 @ case 62
	.4byte _0804C570 @ case 63
	.4byte _0804C570 @ case 64
	.4byte _0804C570 @ case 65
	.4byte _0804C570 @ case 66
	.4byte _0804C570 @ case 67
	.4byte _0804C570 @ case 68
	.4byte _0804C570 @ case 69
	.4byte _0804C570 @ case 70
	.4byte _0804C570 @ case 71
	.4byte _0804C570 @ case 72
	.4byte _0804C570 @ case 73
	.4byte _0804C570 @ case 74
	.4byte _0804C570 @ case 75
	.4byte _0804C570 @ case 76
	.4byte _0804C570 @ case 77
	.4byte _0804C570 @ case 78
	.4byte _0804C570 @ case 79
	.4byte _0804C570 @ case 80
	.4byte _0804C570 @ case 81
	.4byte _0804C570 @ case 82
	.4byte _0804C570 @ case 83
	.4byte _0804C570 @ case 84
	.4byte _0804C570 @ case 85
	.4byte _0804C570 @ case 86
	.4byte _0804C550 @ case 87
	.4byte _0804C554 @ case 88
	.4byte _0804C55A @ case 89
	.4byte _0804C55E @ case 90
	.4byte _0804C564 @ case 91
_0804C4F0:
	bl FakeTankInit
	ldr r1, _0804C4FC @ =gCurrentSprite
	ldr r0, _0804C500 @ =0x0837E214
	str r0, [r1, #0x18]
	b _0804C570
	.align 2, 0
_0804C4FC: .4byte gCurrentSprite
_0804C500: .4byte 0x0837E214
_0804C504:
	ldr r0, _0804C514 @ =0x0837E214
	str r0, [r2, #0x18]
	bl FakeTankIdleInit
_0804C50C:
	bl FakeTankIdle
	b _0804C570
	.align 2, 0
_0804C514: .4byte 0x0837E214
_0804C518:
	ldr r0, _0804C528 @ =0x0837E23C
	str r0, [r2, #0x18]
	bl FakeTankWakingUpInit
_0804C520:
	bl FakeTankWakingUp
	b _0804C570
	.align 2, 0
_0804C528: .4byte 0x0837E23C
_0804C52C:
	ldr r0, _0804C53C @ =0x0837E27C
	str r0, [r2, #0x18]
	bl FakeTankFlyingInit
_0804C534:
	bl FakeTankFlying
	b _0804C570
	.align 2, 0
_0804C53C: .4byte 0x0837E27C
_0804C540:
	bl FakeTankFlyingAwayInit
_0804C544:
	bl FakeTankFlyingAway
	b _0804C570
_0804C54A:
	bl FakeTankLeaving
	b _0804C570
_0804C550:
	bl SpriteDyingInit
_0804C554:
	bl SpriteDying
	b _0804C570
_0804C55A:
	bl FakeTankInit
_0804C55E:
	bl SpriteSpawningFromX
	b _0804C570
_0804C564:
	bl XParasiteInit
	ldr r1, _0804C574 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x20
	strh r0, [r1, #2]
_0804C570:
	pop {r0}
	bx r0
	.align 2, 0
_0804C574: .4byte gCurrentSprite

	thumb_func_start BigFlashingNumber
BigFlashingNumber: @ 0x0804C578
	push {r4, r5, r6, r7, lr}
	ldr r4, _0804C5FC @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x24
	ldrb r6, [r3]
	cmp r6, #0
	bne _0804C65A
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	strb r6, [r0]
	adds r1, #2
	movs r0, #8
	strb r0, [r1]
	movs r2, #0
	ldr r1, _0804C600 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r5, #0xf
	ands r5, r0
	adds r7, r5, #0
	bl GetFlashingSectorNumber
	lsls r0, r0, #0x18
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _0804C658
	cmp r5, #7
	bne _0804C608
	ldr r0, _0804C604 @ =0x0837EDFC
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C5FC: .4byte gCurrentSprite
_0804C600: .4byte 0x0000FFFC
_0804C604: .4byte 0x0837EDFC
_0804C608:
	cmp r5, #8
	bne _0804C618
	ldr r0, _0804C614 @ =0x0837EE44
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C614: .4byte 0x0837EE44
_0804C618:
	cmp r5, #9
	bne _0804C628
	ldr r0, _0804C624 @ =0x0837EE8C
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C624: .4byte 0x0837EE8C
_0804C628:
	cmp r5, #0xa
	bne _0804C638
	ldr r0, _0804C634 @ =0x0837EED4
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C634: .4byte 0x0837EED4
_0804C638:
	cmp r5, #0xb
	bne _0804C648
	ldr r0, _0804C644 @ =0x0837EF1C
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C644: .4byte 0x0837EF1C
_0804C648:
	cmp r7, #0xc
	bne _0804C658
	ldr r0, _0804C654 @ =0x0837EF64
	str r0, [r4, #0x18]
	b _0804C65A
	.align 2, 0
_0804C654: .4byte 0x0837EF64
_0804C658:
	strh r6, [r4]
_0804C65A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start FlashingNumber
FlashingNumber: @ 0x0804C660
	push {r4, r5, r6, r7, lr}
	ldr r4, _0804C6E0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r6, [r5]
	cmp r6, #0
	bne _0804C73E
	ldrh r0, [r4, #4]
	adds r0, #0x20
	movs r3, #0
	strh r0, [r4, #4]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x27
	movs r2, #0x10
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #8
	strb r0, [r1]
	ldr r1, _0804C6E4 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	subs r0, #3
	strb r2, [r0]
	strb r3, [r4, #0x1c]
	strh r6, [r4, #0x16]
	adds r0, #8
	ldrb r0, [r0]
	movs r5, #7
	ands r5, r0
	adds r7, r5, #0
	bl GetFlashingSectorNumber
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	bne _0804C73C
	cmp r5, #1
	bne _0804C6EC
	ldr r0, _0804C6E8 @ =0x0837F948
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C6E0: .4byte gCurrentSprite
_0804C6E4: .4byte 0x0000FFFC
_0804C6E8: .4byte 0x0837F948
_0804C6EC:
	cmp r5, #2
	bne _0804C6FC
	ldr r0, _0804C6F8 @ =0x0837F990
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C6F8: .4byte 0x0837F990
_0804C6FC:
	cmp r5, #3
	bne _0804C70C
	ldr r0, _0804C708 @ =0x0837F9D8
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C708: .4byte 0x0837F9D8
_0804C70C:
	cmp r5, #4
	bne _0804C71C
	ldr r0, _0804C718 @ =0x0837FA20
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C718: .4byte 0x0837FA20
_0804C71C:
	cmp r5, #5
	bne _0804C72C
	ldr r0, _0804C728 @ =0x0837FA68
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C728: .4byte 0x0837FA68
_0804C72C:
	cmp r7, #6
	bne _0804C73C
	ldr r0, _0804C738 @ =0x0837FAB0
	str r0, [r4, #0x18]
	b _0804C73E
	.align 2, 0
_0804C738: .4byte 0x0837FAB0
_0804C73C:
	strh r6, [r4]
_0804C73E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ZebesianAquaXMovement
ZebesianAquaXMovement: @ 0x0804C744
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _0804C768 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _0804C790
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804C76C
	ldrh r0, [r4, #4]
	adds r0, #0x38
	b _0804C770
	.align 2, 0
_0804C768: .4byte gCurrentSprite
_0804C76C:
	ldrh r0, [r4, #4]
	adds r0, #0x28
_0804C770:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804C78C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0804C7B8
	ldrh r0, [r4, #4]
	adds r0, r5, r0
	b _0804C7C4
	.align 2, 0
_0804C78C: .4byte gPreviousCollisionCheck
_0804C790:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804C7A0
	ldrh r0, [r4, #4]
	subs r0, #0x38
	b _0804C7A4
_0804C7A0:
	ldrh r0, [r4, #4]
	subs r0, #0x28
_0804C7A4:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804C7BC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0804C7C0
_0804C7B8:
	movs r0, #1
	b _0804C7C8
	.align 2, 0
_0804C7BC: .4byte gPreviousCollisionCheck
_0804C7C0:
	ldrh r0, [r4, #4]
	subs r0, r0, r5
_0804C7C4:
	strh r0, [r4, #4]
	movs r0, #0
_0804C7C8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ZebesianAquaTurningIntoX
ZebesianAquaTurningIntoX: @ 0x0804C7D0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0804C80C @ =gCurrentSprite
	ldrb r1, [r4, #0x1d]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp, #4]
	ldrh r0, [r4, #4]
	subs r0, #0x10
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C80C: .4byte gCurrentSprite

	thumb_func_start ZebesianAquaInit
ZebesianAquaInit: @ 0x0804C810
	push {lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _0804C83C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804C840
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804C840
	strh r0, [r2]
	b _0804C8B0
	.align 2, 0
_0804C83C: .4byte gCurrentSprite
_0804C840:
	ldr r3, _0804C89C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x25
	movs r1, #0
	movs r0, #2
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	ldr r0, _0804C8A0 @ =0x08381764
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _0804C8A4 @ =0x0000FF90
	strh r0, [r3, #0xa]
	adds r0, #0x68
	strh r0, [r3, #0xc]
	subs r0, #0x38
	strh r0, [r3, #0xe]
	movs r0, #0x40
	strh r0, [r3, #0x10]
	ldr r2, _0804C8A8 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804C8AC
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r3, #6]
	b _0804C8B0
	.align 2, 0
_0804C89C: .4byte gCurrentSprite
_0804C8A0: .4byte 0x08381764
_0804C8A4: .4byte 0x0000FF90
_0804C8A8: .4byte sPrimarySpriteStats
_0804C8AC:
	movs r0, #1
	strb r0, [r1]
_0804C8B0:
	pop {r0}
	bx r0

	thumb_func_start ZebesianAquaIdleInit
ZebesianAquaIdleInit: @ 0x0804C8B4
	push {r4, lr}
	ldr r1, _0804C8D8 @ =gCurrentSprite
	ldrh r0, [r1, #4]
	movs r3, #0
	movs r4, #0
	strh r0, [r1, #8]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #2
	strb r0, [r2]
	strb r3, [r1, #0x1c]
	strh r4, [r1, #0x16]
	ldr r0, _0804C8DC @ =0x08381764
	str r0, [r1, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C8D8: .4byte gCurrentSprite
_0804C8DC: .4byte 0x08381764

	thumb_func_start ZebesianAquaIdle
ZebesianAquaIdle: @ 0x0804C8E0
	push {r4, r5, lr}
	movs r0, #6
	bl ZebesianAquaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804C900
	ldr r2, _0804C8FC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	adds r5, r2, #0
	b _0804C938
	.align 2, 0
_0804C8FC: .4byte gCurrentSprite
_0804C900:
	ldr r2, _0804C920 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _0804C924
	ldrh r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r5, #4]
	cmp r0, r1
	bge _0804C938
	b _0804C930
	.align 2, 0
_0804C920: .4byte gCurrentSprite
_0804C924:
	ldrh r0, [r5, #8]
	ldr r1, _0804C98C @ =0xFFFFFE00
	adds r0, r0, r1
	ldrh r1, [r5, #4]
	cmp r0, r1
	ble _0804C938
_0804C930:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0804C938:
	ldr r0, _0804C990 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0804C9BE
	ldr r2, _0804C994 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r4, r5, #0
	ldrh r0, [r4, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r2
	ble _0804C9A0
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804C998 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C9BE
	ldr r0, _0804C99C @ =gCurrentAffectingClipdata
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _0804C9BE
	ldrh r0, [r4, #2]
	subs r0, #2
	strh r0, [r4, #2]
	b _0804C9BE
	.align 2, 0
_0804C98C: .4byte 0xFFFFFE00
_0804C990: .4byte gEquipment
_0804C994: .4byte gSamusData
_0804C998: .4byte gPreviousCollisionCheck
_0804C99C: .4byte gCurrentAffectingClipdata
_0804C9A0:
	adds r0, r1, #0
	adds r0, #0x40
	cmp r0, r2
	bge _0804C9BE
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CA04 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804C9BE
	ldrh r0, [r5, #2]
	adds r0, #2
	strh r0, [r5, #2]
_0804C9BE:
	ldr r0, _0804CA08 @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804CA5C
	movs r0, #0xa0
	movs r1, #0xc8
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	bne _0804CA5C
	movs r1, #0xc8
	lsls r1, r1, #1
	movs r0, #0xa0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r1, r0, #0
	ldr r3, _0804CA0C @ =gCurrentSprite
	ldrh r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0804CA22
	cmp r1, #8
	bne _0804CA1C
	ldr r0, _0804CA10 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804CA14
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0804CA5A
	.align 2, 0
_0804CA04: .4byte gPreviousCollisionCheck
_0804CA08: .4byte 0x03001346
_0804CA0C: .4byte gCurrentSprite
_0804CA10: .4byte gEquipment
_0804CA14:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2b
	b _0804CA5A
_0804CA1C:
	cmp r1, #4
	bne _0804CA5C
	b _0804CA4C
_0804CA22:
	cmp r1, #4
	bne _0804CA48
	ldr r0, _0804CA3C @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0804CA40
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0804CA5A
	.align 2, 0
_0804CA3C: .4byte gEquipment
_0804CA40:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2b
	b _0804CA5A
_0804CA48:
	cmp r1, #8
	bne _0804CA5C
_0804CA4C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _0804CA5C
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #3
_0804CA5A:
	strb r0, [r1]
_0804CA5C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianAquaLungeInit
ZebesianAquaLungeInit: @ 0x0804CA64
	ldr r1, _0804CA78 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x2c
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804CA78: .4byte gCurrentSprite

	thumb_func_start ZebesianAquaLunge
ZebesianAquaLunge: @ 0x0804CA7C
	push {r4, r5, lr}
	ldr r4, _0804CAF8 @ =gCurrentSprite
	ldrb r0, [r4, #0x1c]
	adds r0, #4
	strb r0, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804CAA0
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804CB14
	ldr r0, _0804CAFC @ =0x000001BD
	bl SoundPlayNotAlreadyPlaying
_0804CAA0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CB00 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CAB6
	ldrh r0, [r4, #2]
	adds r0, #2
	strh r0, [r4, #2]
_0804CAB6:
	movs r0, #0x10
	bl ZebesianAquaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804CB0C
	ldr r0, _0804CB04 @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804CB14
	movs r5, #0xa0
	lsls r5, r5, #1
	movs r1, #0xe1
	lsls r1, r1, #1
	adds r0, r5, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	bne _0804CB14
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804CB08
	cmp r2, #4
	bne _0804CB14
	b _0804CB0C
	.align 2, 0
_0804CAF8: .4byte gCurrentSprite
_0804CAFC: .4byte 0x000001BD
_0804CB00: .4byte gPreviousCollisionCheck
_0804CB04: .4byte 0x03001346
_0804CB08:
	cmp r2, #8
	bne _0804CB14
_0804CB0C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0804CB14:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianAquaShootingInit
ZebesianAquaShootingInit: @ 0x0804CB1C
	ldr r1, _0804CB34 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804CB38 @ =0x083817C4
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804CB34: .4byte gCurrentSprite
_0804CB38: .4byte 0x083817C4

	thumb_func_start ZebesianAquaShooting
ZebesianAquaShooting: @ 0x0804CB3C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r2, _0804CB88 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _0804CB8C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r2
	ble _0804CB98
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CB90 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CBB6
	ldr r0, _0804CB94 @ =gCurrentAffectingClipdata
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _0804CBB6
	ldrh r0, [r4, #2]
	subs r0, #1
	b _0804CBB4
	.align 2, 0
_0804CB88: .4byte gSamusData
_0804CB8C: .4byte gCurrentSprite
_0804CB90: .4byte gPreviousCollisionCheck
_0804CB94: .4byte gCurrentAffectingClipdata
_0804CB98:
	adds r0, r1, #0
	adds r0, #0x20
	cmp r0, r2
	bge _0804CBB6
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CBD0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CBB6
	ldrh r0, [r4, #2]
	adds r0, #1
_0804CBB4:
	strh r0, [r4, #2]
_0804CBB6:
	movs r0, #8
	bl ZebesianAquaXMovement
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804CBD8
	ldr r0, _0804CBD4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	b _0804CC6C
	.align 2, 0
_0804CBD0: .4byte gPreviousCollisionCheck
_0804CBD4: .4byte gCurrentSprite
_0804CBD8:
	ldr r4, _0804CC30 @ =gCurrentSprite
	ldrh r0, [r4, #0x16]
	cmp r0, #7
	bne _0804CC6C
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _0804CC6C
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _0804CC34
	ldrb r2, [r4, #0x1f]
	adds r5, r4, #0
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x70
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x66
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #2]
	subs r0, #0x2c
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x66
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0804CC6C
	.align 2, 0
_0804CC30: .4byte gCurrentSprite
_0804CC34:
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x70
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x66
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	subs r0, #0x2c
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x66
	movs r1, #1
	bl SpriteSpawnSecondary
_0804CC6C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ZebesianAquaTurningAroundInit
ZebesianAquaTurningAroundInit: @ 0x0804CC74
	ldr r1, _0804CC8C @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0804CC90 @ =0x0838179C
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0804CC8C: .4byte gCurrentSprite
_0804CC90: .4byte 0x0838179C

	thumb_func_start ZebesianAquaTurningAround
ZebesianAquaTurningAround: @ 0x0804CC94
	push {r4, lr}
	ldr r0, _0804CCE0 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _0804CD18
	ldr r2, _0804CCE4 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _0804CCE8 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r2
	ble _0804CCF0
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CCEC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CD18
	ldrh r0, [r4, #2]
	adds r0, #2
	b _0804CD16
	.align 2, 0
_0804CCE0: .4byte gEquipment
_0804CCE4: .4byte gSamusData
_0804CCE8: .4byte gCurrentSprite
_0804CCEC: .4byte gPreviousCollisionCheck
_0804CCF0:
	adds r0, r1, #0
	adds r0, #0x20
	cmp r0, r2
	bge _0804CD18
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0804CD44 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804CD18
	ldr r0, _0804CD48 @ =gCurrentAffectingClipdata
	ldrh r0, [r0, #2]
	cmp r0, #1
	bne _0804CD18
	ldrh r0, [r4, #2]
	subs r0, #2
_0804CD16:
	strh r0, [r4, #2]
_0804CD18:
	ldr r2, _0804CD4C @ =gCurrentSprite
	ldrh r0, [r2, #0x16]
	cmp r0, #1
	bne _0804CD2E
	ldrb r0, [r2, #0x1c]
	cmp r0, #4
	bne _0804CD2E
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_0804CD2E:
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804CD3E
	ldr r0, _0804CD4C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0804CD3E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804CD44: .4byte gPreviousCollisionCheck
_0804CD48: .4byte gCurrentAffectingClipdata
_0804CD4C: .4byte gCurrentSprite

	thumb_func_start ZebesianAquaProjectileInit
ZebesianAquaProjectileInit: @ 0x0804CD50
	push {r4, r5, lr}
	ldr r0, _0804CDC4 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r3, _0804CDC8 @ =0x0000FFFB
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
	strb r1, [r0]
	ldr r0, _0804CDCC @ =0x0000FFF4
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r0, #0xc
	strh r0, [r1, #0xc]
	ldr r0, _0804CDD0 @ =0x0838182C
	str r0, [r1, #0x18]
	strb r5, [r1, #0x1c]
	strh r4, [r1, #0x16]
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
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, ip
	cmp r2, #0
	beq _0804CDD4
	strh r4, [r1, #0xe]
	movs r0, #0x18
	strh r0, [r1, #0x10]
	b _0804CDDA
	.align 2, 0
_0804CDC4: .4byte gCurrentSprite
_0804CDC8: .4byte 0x0000FFFB
_0804CDCC: .4byte 0x0000FFF4
_0804CDD0: .4byte 0x0838182C
_0804CDD4:
	ldr r0, _0804CDF0 @ =0x0000FFE8
	strh r0, [r1, #0xe]
	strh r2, [r1, #0x10]
_0804CDDA:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	bne _0804CDE8
	movs r0, #0xde
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804CDE8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804CDF0: .4byte 0x0000FFE8

	thumb_func_start ZebesianAqua
ZebesianAqua: @ 0x0804CDF4
	push {r4, lr}
	ldr r4, _0804CE20 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804CE0E
	movs r0, #0xaf
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804CE0E:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804CE24
	bl SpriteUtilUpdateFreezeTimer
	b _0804CFFC
	.align 2, 0
_0804CE20: .4byte gCurrentSprite
_0804CE24:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804CE30
	b _0804CFFC
_0804CE30:
	lsls r0, r0, #2
	ldr r1, _0804CE3C @ =_0804CE40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804CE3C: .4byte _0804CE40
_0804CE40: @ jump table
	.4byte _0804CFB0 @ case 0
	.4byte _0804CFB6 @ case 1
	.4byte _0804CFBC @ case 2
	.4byte _0804CFC2 @ case 3
	.4byte _0804CFC6 @ case 4
	.4byte _0804CFFC @ case 5
	.4byte _0804CFFC @ case 6
	.4byte _0804CFFC @ case 7
	.4byte _0804CFFC @ case 8
	.4byte _0804CFFC @ case 9
	.4byte _0804CFFC @ case 10
	.4byte _0804CFFC @ case 11
	.4byte _0804CFFC @ case 12
	.4byte _0804CFFC @ case 13
	.4byte _0804CFFC @ case 14
	.4byte _0804CFFC @ case 15
	.4byte _0804CFFC @ case 16
	.4byte _0804CFFC @ case 17
	.4byte _0804CFFC @ case 18
	.4byte _0804CFFC @ case 19
	.4byte _0804CFFC @ case 20
	.4byte _0804CFFC @ case 21
	.4byte _0804CFFC @ case 22
	.4byte _0804CFFC @ case 23
	.4byte _0804CFFC @ case 24
	.4byte _0804CFFC @ case 25
	.4byte _0804CFFC @ case 26
	.4byte _0804CFFC @ case 27
	.4byte _0804CFFC @ case 28
	.4byte _0804CFFC @ case 29
	.4byte _0804CFFC @ case 30
	.4byte _0804CFFC @ case 31
	.4byte _0804CFFC @ case 32
	.4byte _0804CFFC @ case 33
	.4byte _0804CFFC @ case 34
	.4byte _0804CFFC @ case 35
	.4byte _0804CFFC @ case 36
	.4byte _0804CFFC @ case 37
	.4byte _0804CFFC @ case 38
	.4byte _0804CFFC @ case 39
	.4byte _0804CFFC @ case 40
	.4byte _0804CFCC @ case 41
	.4byte _0804CFD0 @ case 42
	.4byte _0804CFD6 @ case 43
	.4byte _0804CFDA @ case 44
	.4byte _0804CFFC @ case 45
	.4byte _0804CFFC @ case 46
	.4byte _0804CFFC @ case 47
	.4byte _0804CFFC @ case 48
	.4byte _0804CFFC @ case 49
	.4byte _0804CFFC @ case 50
	.4byte _0804CFFC @ case 51
	.4byte _0804CFFC @ case 52
	.4byte _0804CFFC @ case 53
	.4byte _0804CFFC @ case 54
	.4byte _0804CFFC @ case 55
	.4byte _0804CFFC @ case 56
	.4byte _0804CFFC @ case 57
	.4byte _0804CFFC @ case 58
	.4byte _0804CFFC @ case 59
	.4byte _0804CFFC @ case 60
	.4byte _0804CFFC @ case 61
	.4byte _0804CFFC @ case 62
	.4byte _0804CFFC @ case 63
	.4byte _0804CFFC @ case 64
	.4byte _0804CFFC @ case 65
	.4byte _0804CFFC @ case 66
	.4byte _0804CFFC @ case 67
	.4byte _0804CFFC @ case 68
	.4byte _0804CFFC @ case 69
	.4byte _0804CFFC @ case 70
	.4byte _0804CFFC @ case 71
	.4byte _0804CFFC @ case 72
	.4byte _0804CFFC @ case 73
	.4byte _0804CFFC @ case 74
	.4byte _0804CFFC @ case 75
	.4byte _0804CFFC @ case 76
	.4byte _0804CFFC @ case 77
	.4byte _0804CFFC @ case 78
	.4byte _0804CFFC @ case 79
	.4byte _0804CFFC @ case 80
	.4byte _0804CFFC @ case 81
	.4byte _0804CFFC @ case 82
	.4byte _0804CFFC @ case 83
	.4byte _0804CFFC @ case 84
	.4byte _0804CFFC @ case 85
	.4byte _0804CFFC @ case 86
	.4byte _0804CFE0 @ case 87
	.4byte _0804CFE4 @ case 88
	.4byte _0804CFEA @ case 89
	.4byte _0804CFEE @ case 90
	.4byte _0804CFF4 @ case 91
_0804CFB0:
	bl ZebesianAquaInit
	b _0804CFFC
_0804CFB6:
	bl ZebesianAquaIdleInit
	b _0804CFFC
_0804CFBC:
	bl ZebesianAquaIdle
	b _0804CFFC
_0804CFC2:
	bl ZebesianAquaTurningAroundInit
_0804CFC6:
	bl ZebesianAquaTurningAround
	b _0804CFFC
_0804CFCC:
	bl ZebesianAquaShootingInit
_0804CFD0:
	bl ZebesianAquaShooting
	b _0804CFFC
_0804CFD6:
	bl ZebesianAquaLungeInit
_0804CFDA:
	bl ZebesianAquaLunge
	b _0804CFFC
_0804CFE0:
	bl SpriteDyingInit
_0804CFE4:
	bl SpriteDying
	b _0804CFFC
_0804CFEA:
	bl ZebesianAquaInit
_0804CFEE:
	bl SpriteSpawningFromX
	b _0804CFFC
_0804CFF4:
	bl ZebesianAquaTurningIntoX
	bl XParasiteInit
_0804CFFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ZebesianAquaProjectile
ZebesianAquaProjectile: @ 0x0804D004
	push {r4, lr}
	ldr r4, _0804D028 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804D016
	bl ZebesianAquaProjectileInit
_0804D016:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804D02C
	ldrh r0, [r4, #4]
	adds r0, #0x10
	b _0804D030
	.align 2, 0
_0804D028: .4byte gCurrentSprite
_0804D02C:
	ldrh r0, [r4, #4]
	subs r0, #0x10
_0804D030:
	strh r0, [r4, #4]
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start DachoraCheckDoHeadMovement
DachoraCheckDoHeadMovement: @ 0x0804D038
	push {r4, lr}
	movs r4, #1
	ldr r0, _0804D050 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0804D0EC
	lsls r0, r0, #2
	ldr r1, _0804D054 @ =_0804D058
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804D050: .4byte gSpriteRandomNumber
_0804D054: .4byte _0804D058
_0804D058: @ jump table
	.4byte _0804D08C @ case 0
	.4byte _0804D08C @ case 1
	.4byte _0804D08C @ case 2
	.4byte _0804D08C @ case 3
	.4byte _0804D0A4 @ case 4
	.4byte _0804D0A4 @ case 5
	.4byte _0804D0A4 @ case 6
	.4byte _0804D0A4 @ case 7
	.4byte _0804D0BC @ case 8
	.4byte _0804D0BC @ case 9
	.4byte _0804D0D4 @ case 10
	.4byte _0804D0D4 @ case 11
	.4byte _0804D0D4 @ case 12
_0804D08C:
	ldr r1, _0804D0A0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #7
	strb r0, [r2]
	adds r1, #0x2f
	strb r3, [r1]
	b _0804D0EE
	.align 2, 0
_0804D0A0: .4byte gCurrentSprite
_0804D0A4:
	ldr r1, _0804D0B8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	b _0804D0EE
	.align 2, 0
_0804D0B8: .4byte gCurrentSprite
_0804D0BC:
	ldr r1, _0804D0D0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #2
	strb r0, [r1]
	b _0804D0EE
	.align 2, 0
_0804D0D0: .4byte gCurrentSprite
_0804D0D4:
	ldr r1, _0804D0E8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #3
	strb r0, [r1]
	b _0804D0EE
	.align 2, 0
_0804D0E8: .4byte gCurrentSprite
_0804D0EC:
	movs r4, #0
_0804D0EE:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DachoraInit
DachoraInit: @ 0x0804D0F8
	push {r4, r5, r6, lr}
	bl EventCheckAfter_AnimalsReleased
	adds r6, r0, #0
	cmp r6, #0
	beq _0804D110
	ldr r1, _0804D10C @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0804D17C
	.align 2, 0
_0804D10C: .4byte gCurrentSprite
_0804D110:
	ldr r5, _0804D184 @ =gCurrentSprite
	adds r2, r5, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x25
	strb r6, [r0]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #0xe
	strb r0, [r1]
	subs r1, #1
	movs r0, #3
	strb r0, [r1]
	adds r1, #6
	movs r0, #0x30
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	movs r4, #0
	ldr r1, _0804D188 @ =0x0000FFFC
	strh r1, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldrh r0, [r5, #2]
	subs r0, #0x20
	strh r0, [r5, #2]
	ldrh r0, [r5, #4]
	strh r0, [r5, #8]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0804D18C @ =0x0838451C
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r6, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x30
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #0xb4
	strb r0, [r1]
_0804D17C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804D184: .4byte gCurrentSprite
_0804D188: .4byte 0x0000FFFC
_0804D18C: .4byte 0x0838451C

	thumb_func_start DachoraIdleInit
DachoraIdleInit: @ 0x0804D190
	ldr r3, _0804D1BC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0804D1C0 @ =0x0838451C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	ldr r0, _0804D1C4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x3c
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804D1BC: .4byte gCurrentSprite
_0804D1C0: .4byte 0x0838451C
_0804D1C4: .4byte gSpriteRandomNumber

	thumb_func_start DachoraIdle
DachoraIdle: @ 0x0804D1C8
	push {r4, r5, r6, lr}
	bl EventCheckAfter_AnimalsReleased
	cmp r0, #0
	beq _0804D228
	ldr r2, _0804D214 @ =gSpriteData
	ldr r0, _0804D218 @ =gBossWork2
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _0804D276
	ldr r0, _0804D21C @ =gAbilityRestingXPosition
	ldr r2, _0804D220 @ =0xFFFFFF00
	adds r1, r2, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r3, _0804D224 @ =gCurrentSprite
	ldrh r2, [r3, #4]
	adds r0, r1, #0
	subs r0, #0x20
	cmp r2, r0
	ble _0804D276
	adds r0, #0x40
	cmp r2, r0
	bge _0804D276
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	b _0804D2D4
	.align 2, 0
_0804D214: .4byte gSpriteData
_0804D218: .4byte gBossWork2
_0804D21C: .4byte gAbilityRestingXPosition
_0804D220: .4byte 0xFFFFFF00
_0804D224: .4byte gCurrentSprite
_0804D228:
	ldr r3, _0804D254 @ =gCurrentSprite
	ldrh r2, [r3, #4]
	ldr r0, _0804D258 @ =gAbilityRestingXPosition
	ldrh r1, [r0]
	movs r4, #0xe0
	lsls r4, r4, #1
	adds r0, r1, r4
	cmp r2, r0
	bgt _0804D242
	ldr r4, _0804D25C @ =0xFFFFFE40
	adds r0, r1, r4
	cmp r2, r0
	bge _0804D276
_0804D242:
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804D260
	subs r0, #1
	strb r0, [r1]
	b _0804D276
	.align 2, 0
_0804D254: .4byte gCurrentSprite
_0804D258: .4byte gAbilityRestingXPosition
_0804D25C: .4byte 0xFFFFFE40
_0804D260:
	ldr r0, _0804D2AC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0804D276
	bl DachoraCheckDoHeadMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804D2D4
_0804D276:
	ldr r2, _0804D2B0 @ =gCurrentSprite
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r3, [r5]
	lsls r0, r3, #0x18
	lsrs r1, r0, #0x18
	lsrs r4, r0, #0x1a
	adds r6, r4, #0
	cmp r1, #0xf
	bhi _0804D28E
	adds r0, r3, #1
	strb r0, [r5]
_0804D28E:
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804D2B4
	ldrh r0, [r2, #8]
	movs r1, #0xe0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	cmp r0, r1
	blt _0804D2C0
	adds r0, r1, r4
	b _0804D2D2
	.align 2, 0
_0804D2AC: .4byte gFrameCounter8Bit
_0804D2B0: .4byte gCurrentSprite
_0804D2B4:
	ldrh r0, [r2, #8]
	ldr r4, _0804D2CC @ =0xFFFFFC80
	adds r0, r0, r4
	ldrh r1, [r2, #4]
	cmp r0, r1
	ble _0804D2D0
_0804D2C0:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0804D2D4
	.align 2, 0
_0804D2CC: .4byte 0xFFFFFC80
_0804D2D0:
	subs r0, r1, r6
_0804D2D2:
	strh r0, [r2, #4]
_0804D2D4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DachoraStandingInit
DachoraStandingInit: @ 0x0804D2DC
	ldr r0, _0804D2F8 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #8
	strb r1, [r2]
	ldr r1, _0804D2FC @ =0x0838450C
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0xb
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804D2F8: .4byte gCurrentSprite
_0804D2FC: .4byte 0x0838450C

	thumb_func_start DachoraStanding
DachoraStanding: @ 0x0804D300
	push {lr}
	ldr r1, _0804D320 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804D31A
	adds r1, #0x24
	movs r0, #9
	strb r0, [r1]
_0804D31A:
	pop {r0}
	bx r0
	.align 2, 0
_0804D320: .4byte gCurrentSprite

	thumb_func_start DachoraHeadMovementInit
DachoraHeadMovementInit: @ 0x0804D324
	push {lr}
	ldr r0, _0804D340 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0xa
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #1
	bne _0804D348
	ldr r0, _0804D344 @ =0x083845C4
	b _0804D362
	.align 2, 0
_0804D340: .4byte gCurrentSprite
_0804D344: .4byte 0x083845C4
_0804D348:
	cmp r1, #2
	bne _0804D354
	ldr r0, _0804D350 @ =0x083845E4
	b _0804D362
	.align 2, 0
_0804D350: .4byte 0x083845E4
_0804D354:
	cmp r1, #3
	bne _0804D360
	ldr r0, _0804D35C @ =0x083845FC
	b _0804D362
	.align 2, 0
_0804D35C: .4byte 0x083845FC
_0804D360:
	ldr r0, _0804D370 @ =0x08384584
_0804D362:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0804D370: .4byte 0x08384584

	thumb_func_start DachoraHeadMovement
DachoraHeadMovement: @ 0x0804D374
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804D3AE
	ldr r1, _0804D3A0 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	ldr r2, _0804D3A4 @ =gFrameCounter8Bit
	cmp r0, #1
	bne _0804D392
	ldrb r0, [r2]
	cmp r0, #0xc
	bhi _0804D3AE
_0804D392:
	ldrb r0, [r2]
	cmp r0, #2
	bhi _0804D3A8
	adds r1, #0x24
	movs r0, #3
	b _0804D3AC
	.align 2, 0
_0804D3A0: .4byte gCurrentSprite
_0804D3A4: .4byte gSpriteRandomNumber
_0804D3A8:
	adds r1, #0x24
	movs r0, #1
_0804D3AC:
	strb r0, [r1]
_0804D3AE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DachoraTurningAroundInit
DachoraTurningAroundInit: @ 0x0804D3B4
	ldr r1, _0804D3CC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #4
	strb r0, [r2]
	ldr r0, _0804D3D0 @ =0x08384554
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804D3CC: .4byte gCurrentSprite
_0804D3D0: .4byte 0x08384554

	thumb_func_start DachoraTurningAround
DachoraTurningAround: @ 0x0804D3D4
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804D414
	ldr r2, _0804D408 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0804D40C @ =0x0838456C
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x22
	ldrb r0, [r2]
	cmp r0, #0xe
	bne _0804D410
	movs r0, #0xf
	b _0804D412
	.align 2, 0
_0804D408: .4byte gCurrentSprite
_0804D40C: .4byte 0x0838456C
_0804D410:
	movs r0, #0xe
_0804D412:
	strb r0, [r2]
_0804D414:
	pop {r0}
	bx r0

	thumb_func_start DachoraTurningAroundSecondPart
DachoraTurningAroundSecondPart: @ 0x0804D418
	push {lr}
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804D42A
	ldr r0, _0804D430 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0804D42A:
	pop {r0}
	bx r0
	.align 2, 0
_0804D430: .4byte gCurrentSprite

	thumb_func_start DachoraTurningAroundWhileLeavingInit
DachoraTurningAroundWhileLeavingInit: @ 0x0804D434
	ldr r1, _0804D44C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x38
	strb r0, [r2]
	ldr r0, _0804D450 @ =0x08384554
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804D44C: .4byte gCurrentSprite
_0804D450: .4byte 0x08384554

	thumb_func_start DachoraTurningAroundWhileLeaving
DachoraTurningAroundWhileLeaving: @ 0x0804D454
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804D47A
	ldr r2, _0804D480 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x3a
	strb r0, [r1]
	ldr r0, _0804D484 @ =0x0838456C
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_0804D47A:
	pop {r0}
	bx r0
	.align 2, 0
_0804D480: .4byte gCurrentSprite
_0804D484: .4byte 0x0838456C

	thumb_func_start DachoraTurningAroundWhileLeavingSecondPart
DachoraTurningAroundWhileLeavingSecondPart: @ 0x0804D488
	push {lr}
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804D49A
	ldr r0, _0804D4A0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x19
	strb r1, [r0]
_0804D49A:
	pop {r0}
	bx r0
	.align 2, 0
_0804D4A0: .4byte gCurrentSprite

	thumb_func_start DachoraLeavingEnclosureInit
DachoraLeavingEnclosureInit: @ 0x0804D4A4
	ldr r3, _0804D4C4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #3
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804D4C4: .4byte gCurrentSprite

	thumb_func_start DachoraLeavingEnclosure
DachoraLeavingEnclosure: @ 0x0804D4C8
	push {r4, r5, lr}
	ldr r2, _0804D4FC @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r1, _0804D500 @ =0x0838188C
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _0804D504 @ =0x00007FFF
	cmp r1, r0
	bne _0804D512
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804D508
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0804D534
	.align 2, 0
_0804D4FC: .4byte gCurrentSprite
_0804D500: .4byte 0x0838188C
_0804D504: .4byte 0x00007FFF
_0804D508:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0804D534
_0804D512:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804D52E
	ldrh r0, [r2, #4]
	adds r0, #4
	b _0804D532
_0804D52E:
	ldrh r0, [r2, #4]
	subs r0, #4
_0804D532:
	strh r0, [r2, #4]
_0804D534:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DachoraWalkingToWaitingSpotInit
DachoraWalkingToWaitingSpotInit: @ 0x0804D53C
	ldr r1, _0804D550 @ =gCurrentSprite
	ldr r0, _0804D554 @ =0x0838451C
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804D550: .4byte gCurrentSprite
_0804D554: .4byte 0x0838451C

	thumb_func_start DachoraWalkingToWaitingSpot
DachoraWalkingToWaitingSpot: @ 0x0804D558
	push {lr}
	ldr r1, _0804D570 @ =gCurrentSprite
	ldrh r2, [r1, #4]
	ldr r0, _0804D574 @ =gAbilityRestingXPosition
	ldrh r0, [r0]
	subs r0, #0xc0
	cmp r2, r0
	bge _0804D578
	adds r0, r2, #4
	strh r0, [r1, #4]
	b _0804D588
	.align 2, 0
_0804D570: .4byte gCurrentSprite
_0804D574: .4byte gAbilityRestingXPosition
_0804D578:
	ldr r0, _0804D58C @ =0x083846CC
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
_0804D588:
	pop {r0}
	bx r0
	.align 2, 0
_0804D58C: .4byte 0x083846CC

	thumb_func_start DachorawaitingForOthers
DachorawaitingForOthers: @ 0x0804D590
	push {r4, r5, lr}
	ldr r1, _0804D608 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804D5A8
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0804D5A8
	movs r0, #0x91
	lsls r0, r0, #1
	bl SoundPlay
_0804D5A8:
	movs r4, #0
	movs r3, #0
	ldr r5, _0804D60C @ =gSpriteData
_0804D5AE:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804D5E4
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804D5E4
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xb6
	bne _0804D5E4
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bne _0804D5E4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804D5E4:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0804D5AE
	cmp r4, #3
	bne _0804D602
	ldr r1, _0804D608 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
_0804D602:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804D608: .4byte gCurrentSprite
_0804D60C: .4byte gSpriteData

	thumb_func_start DachoraWaitingToSpawnBaby
DachoraWaitingToSpawnBaby: @ 0x0804D610
	push {r4, lr}
	sub sp, #0xc
	ldr r1, _0804D674 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804D62A
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0804D62A
	movs r0, #0x91
	lsls r0, r0, #1
	bl SoundPlay
_0804D62A:
	ldr r0, _0804D674 @ =gCurrentSprite
	mov ip, r0
	mov r4, ip
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804D66C
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x20
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0xc0
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0x69
	movs r1, #0
	bl SpriteSpawnSecondary
	movs r0, #0x78
	strb r0, [r4]
_0804D66C:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D674: .4byte gCurrentSprite

	thumb_func_start DachoraWaitingForBaby
DachoraWaitingForBaby: @ 0x0804D678
	push {r4, r5, lr}
	ldr r1, _0804D6D4 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804D690
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0804D690
	movs r0, #0x91
	lsls r0, r0, #1
	bl SoundPlay
_0804D690:
	ldr r4, _0804D6D4 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0804D6CE
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _0804D6D8 @ =gPreventMovementTimer
	strh r2, [r0]
	ldr r1, _0804D6DC @ =sSamusSetPoseFunctionPointer
	ldr r0, _0804D6E0 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x3b
	bl _call_via_r1
	movs r0, #0x3c
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
_0804D6CE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804D6D4: .4byte gCurrentSprite
_0804D6D8: .4byte gPreventMovementTimer
_0804D6DC: .4byte sSamusSetPoseFunctionPointer
_0804D6E0: .4byte gSamusData

	thumb_func_start DachoraBowing
DachoraBowing: @ 0x0804D6E4
	push {r4, r5, lr}
	ldr r4, _0804D710 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804D732
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0804D71C
	ldr r0, _0804D714 @ =0x08384584
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r1, [r4, #0x16]
	ldr r0, _0804D718 @ =0x00000123
	bl SoundPlay
	b _0804D75E
	.align 2, 0
_0804D710: .4byte gCurrentSprite
_0804D714: .4byte 0x08384584
_0804D718: .4byte 0x00000123
_0804D71C:
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _0804D75E
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _0804D75E
	movs r0, #0x91
	lsls r0, r0, #1
	bl SoundPlay
	b _0804D75E
_0804D732:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804D75E
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0804D75E
	subs r1, #0xb
	movs r0, #0x1f
	strb r0, [r1]
	movs r0, #0x3c
	strb r0, [r5]
	ldr r0, _0804D764 @ =0x083846CC
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
_0804D75E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804D764: .4byte 0x083846CC

	thumb_func_start DachoraWaitingToRun
DachoraWaitingToRun: @ 0x0804D768
	push {lr}
	ldr r3, _0804D798 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0804D794
	subs r1, #0xa
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _0804D79C @ =0x0838451C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	movs r0, #0x92
	lsls r0, r0, #1
	bl unk_3b1c
_0804D794:
	pop {r0}
	bx r0
	.align 2, 0
_0804D798: .4byte gCurrentSprite
_0804D79C: .4byte 0x0838451C

	thumb_func_start DachoraRunning
DachoraRunning: @ 0x0804D7A0
	push {lr}
	ldr r2, _0804D7C4 @ =gCurrentSprite
	ldrh r0, [r2, #4]
	adds r0, #0xe
	strh r0, [r2, #4]
	ldrb r0, [r2, #0x1c]
	adds r0, #2
	strb r0, [r2, #0x1c]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804D7C0
	strh r0, [r2]
_0804D7C0:
	pop {r0}
	bx r0
	.align 2, 0
_0804D7C4: .4byte gCurrentSprite

	thumb_func_start BabyDachoraInit
BabyDachoraInit: @ 0x0804D7C8
	push {r4, lr}
	ldr r0, _0804D838 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0804D83C @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	subs r1, #1
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	adds r1, #6
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r3, [r0]
	adds r1, #2
	movs r0, #8
	strb r0, [r1]
	ldr r1, _0804D840 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _0804D844 @ =0x0838462C
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x20
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804D838: .4byte gCurrentSprite
_0804D83C: .4byte 0x0000FFFB
_0804D840: .4byte 0x0000FFFC
_0804D844: .4byte 0x0838462C

	thumb_func_start BabyDachoraWalkingToGate
BabyDachoraWalkingToGate: @ 0x0804D848
	push {lr}
	ldr r2, _0804D868 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _0804D86C
	ldrh r0, [r2, #4]
	adds r0, #4
	strh r0, [r2, #4]
	b _0804D878
	.align 2, 0
_0804D868: .4byte gCurrentSprite
_0804D86C:
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r0, #0xd
	strb r3, [r0]
_0804D878:
	pop {r0}
	bx r0

	thumb_func_start BabyDachoraLeavingEnclosure
BabyDachoraLeavingEnclosure: @ 0x0804D87C
	push {r4, r5, lr}
	ldr r2, _0804D8B0 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r1, _0804D8B4 @ =0x0838188C
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _0804D8B8 @ =0x00007FFF
	cmp r1, r0
	bne _0804D8BC
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #0xd
	movs r0, #2
	strb r0, [r1]
	b _0804D8CE
	.align 2, 0
_0804D8B0: .4byte gCurrentSprite
_0804D8B4: .4byte 0x0838188C
_0804D8B8: .4byte 0x00007FFF
_0804D8BC:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
	strh r0, [r2, #2]
	ldrh r0, [r2, #4]
	adds r0, #4
	strh r0, [r2, #4]
_0804D8CE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start BabyDachoraWalkingToWaitingSpot
BabyDachoraWalkingToWaitingSpot: @ 0x0804D8D4
	push {lr}
	ldr r2, _0804D8F4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _0804D8F8
	ldrh r0, [r2, #4]
	adds r0, #2
	strh r0, [r2, #4]
	b _0804D90E
	.align 2, 0
_0804D8F4: .4byte gCurrentSprite
_0804D8F8:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #2
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0804D914 @ =0x083846F4
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
_0804D90E:
	pop {r0}
	bx r0
	.align 2, 0
_0804D914: .4byte 0x083846F4

	thumb_func_start BabyDachoraWaitingToRun
BabyDachoraWaitingToRun: @ 0x0804D918
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _0804D974 @ =gSpriteData
	ldr r4, _0804D978 @ =0x030006EA
	movs r0, #0xa
	rsbs r0, r0, #0
	adds r0, r0, r4
	mov ip, r0
_0804D928:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804D962
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804D962
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xb8
	bne _0804D962
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _0804D962
	movs r0, #0x19
	mov r1, ip
	strb r0, [r1]
	movs r0, #0x5a
	strb r0, [r4]
_0804D962:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0804D928
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804D974: .4byte gSpriteData
_0804D978: .4byte 0x030006EA

	thumb_func_start BabyDachoraRunning
BabyDachoraRunning: @ 0x0804D97C
	push {lr}
	ldr r2, _0804D9A0 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804D9A8
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0804D9CE
	ldr r0, _0804D9A4 @ =0x0838462C
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r1, [r2, #0x16]
	b _0804D9CE
	.align 2, 0
_0804D9A0: .4byte gCurrentSprite
_0804D9A4: .4byte 0x0838462C
_0804D9A8:
	ldrh r0, [r2, #4]
	adds r0, #8
	strh r0, [r2, #4]
	ldrb r0, [r2, #0x1c]
	adds r0, #4
	strb r0, [r2, #0x1c]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _0804D9CE
	ldr r1, _0804D9D4 @ =gSamusData
	adds r1, #0x22
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	strh r3, [r2]
_0804D9CE:
	pop {r0}
	bx r0
	.align 2, 0
_0804D9D4: .4byte gSamusData

	thumb_func_start EtecoonCheckGrabTireSwing
EtecoonCheckGrabTireSwing: @ 0x0804D9D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r2, _0804DA98 @ =gCurrentSprite
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
	movs r6, #0
_0804DA14:
	ldr r0, _0804DA9C @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r5, r1, r0
	ldrh r2, [r5]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0804DAA0
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804DAA0
	ldrb r0, [r5, #0x1d]
	cmp r0, #0xb7
	bne _0804DAA0
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	ands r0, r2
	cmp r0, #0
	bne _0804DAA0
	ldrh r3, [r5, #2]
	ldrh r4, [r5, #4]
	ldrh r2, [r5, #0xa]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r0, [r5, #0xc]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r1, [r5, #0xe]
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r5, #0x10]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov r1, sl
	mov r2, sb
	mov r3, r8
	bl CheckObjectsTouching
	cmp r0, #0
	beq _0804DAA0
	ldrh r0, [r5]
	adds r1, r7, #0
	orrs r1, r0
	strh r1, [r5]
	ldr r0, _0804DA98 @ =gCurrentSprite
	adds r0, #0x2d
	strb r6, [r0]
	movs r0, #1
	b _0804DAAC
	.align 2, 0
_0804DA98: .4byte gCurrentSprite
_0804DA9C: .4byte gSpriteData
_0804DAA0:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x17
	bls _0804DA14
	movs r0, #0
_0804DAAC:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EtecoonCheckFaceForeground
EtecoonCheckFaceForeground: @ 0x0804DABC
	push {r4, lr}
	movs r4, #1
	ldr r0, _0804DAD4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xc
	bhi _0804DB58
	lsls r0, r0, #2
	ldr r1, _0804DAD8 @ =_0804DADC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804DAD4: .4byte gSpriteRandomNumber
_0804DAD8: .4byte _0804DADC
_0804DADC: @ jump table
	.4byte _0804DB10 @ case 0
	.4byte _0804DB10 @ case 1
	.4byte _0804DB10 @ case 2
	.4byte _0804DB10 @ case 3
	.4byte _0804DB28 @ case 4
	.4byte _0804DB28 @ case 5
	.4byte _0804DB28 @ case 6
	.4byte _0804DB28 @ case 7
	.4byte _0804DB28 @ case 8
	.4byte _0804DB40 @ case 9
	.4byte _0804DB40 @ case 10
	.4byte _0804DB40 @ case 11
	.4byte _0804DB40 @ case 12
_0804DB10:
	ldr r1, _0804DB24 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #7
	strb r0, [r2]
	adds r1, #0x2f
	strb r3, [r1]
	b _0804DB5A
	.align 2, 0
_0804DB24: .4byte gCurrentSprite
_0804DB28:
	ldr r1, _0804DB3C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	b _0804DB5A
	.align 2, 0
_0804DB3C: .4byte gCurrentSprite
_0804DB40:
	ldr r1, _0804DB54 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #2
	strb r0, [r1]
	b _0804DB5A
	.align 2, 0
_0804DB54: .4byte gCurrentSprite
_0804DB58:
	movs r4, #0
_0804DB5A:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EtecoonInit
EtecoonInit: @ 0x0804DB64
	push {r4, lr}
	bl EventCheckAfter_AnimalsReleased
	adds r3, r0, #0
	cmp r3, #0
	beq _0804DB7C
	ldr r1, _0804DB78 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0804DC2E
	.align 2, 0
_0804DB78: .4byte gCurrentSprite
_0804DB7C:
	ldr r4, _0804DBF4 @ =gCurrentSprite
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xf
	strb r0, [r1]
	subs r1, #1
	movs r0, #3
	strb r0, [r1]
	adds r1, #6
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0804DBF8 @ =0x0000FFC0
	strh r0, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	ldr r0, _0804DBFC @ =0x0000FFF4
	strh r0, [r4, #0xe]
	movs r0, #0xc
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	strh r0, [r4, #8]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0804DC00 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804DC04
	bl EtecoonCheckFaceForeground
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804DC04
	bl EtecoonFacingForegroundInit
	b _0804DC2E
	.align 2, 0
_0804DBF4: .4byte gCurrentSprite
_0804DBF8: .4byte 0x0000FFC0
_0804DBFC: .4byte 0x0000FFF4
_0804DC00: .4byte gSpriteRandomNumber
_0804DC04:
	ldr r3, _0804DC34 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0804DC38 @ =0x0838429C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	movs r1, #0
	strh r2, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	ldr r0, _0804DC3C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x65
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
_0804DC2E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DC34: .4byte gCurrentSprite
_0804DC38: .4byte 0x0838429C
_0804DC3C: .4byte gSpriteRandomNumber

	thumb_func_start EtecoonIdleInit
EtecoonIdleInit: @ 0x0804DC40
	push {r4, lr}
	ldr r3, _0804DC84 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0804DC88 @ =0x0838429C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	movs r4, #0
	strh r2, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, _0804DC8C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, #0x1d
	adds r2, r3, #0
	adds r2, #0x2e
	strb r0, [r2]
	subs r2, #1
	movs r0, #0xff
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #8
	bls _0804DC90
	adds r0, r3, #0
	adds r0, #0x31
	strb r4, [r0]
	b _0804DC98
	.align 2, 0
_0804DC84: .4byte gCurrentSprite
_0804DC88: .4byte 0x0838429C
_0804DC8C: .4byte gSpriteRandomNumber
_0804DC90:
	adds r1, r3, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0804DC98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EtecoonIdle
EtecoonIdle: @ 0x0804DCA0
	push {r4, r5, lr}
	bl EventCheckAfter_AnimalsReleased
	cmp r0, #0
	beq _0804DD08
	ldr r3, _0804DCF4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r2, _0804DCF8 @ =gSpriteData
	ldr r0, _0804DCFC @ =gBossWork2
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _0804DD6C
	ldr r0, _0804DD00 @ =gAbilityRestingXPosition
	ldr r2, _0804DD04 @ =0xFFFFFF00
	adds r1, r2, #0
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r3, #4]
	adds r0, r1, #0
	subs r0, #0x20
	cmp r2, r0
	ble _0804DD6C
	adds r0, #0x40
	cmp r2, r0
	bge _0804DD6C
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	b _0804DDF4
	.align 2, 0
_0804DCF4: .4byte gCurrentSprite
_0804DCF8: .4byte gSpriteData
_0804DCFC: .4byte gBossWork2
_0804DD00: .4byte gAbilityRestingXPosition
_0804DD04: .4byte 0xFFFFFF00
_0804DD08:
	ldr r4, _0804DD34 @ =gCurrentSprite
	ldrh r2, [r4, #4]
	ldr r0, _0804DD38 @ =gAbilityRestingXPosition
	ldrh r1, [r0]
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _0804DD22
	ldr r3, _0804DD3C @ =0xFFFFFE40
	adds r0, r1, r3
	cmp r2, r0
	bge _0804DD6C
_0804DD22:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804DD40
	subs r0, #1
	strb r0, [r1]
	b _0804DD6C
	.align 2, 0
_0804DD34: .4byte gCurrentSprite
_0804DD38: .4byte gAbilityRestingXPosition
_0804DD3C: .4byte 0xFFFFFE40
_0804DD40:
	bl EtecoonCheckGrabTireSwing
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804DD56
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	adds r1, #0xb
	b _0804DDE4
_0804DD56:
	ldr r0, _0804DD98 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0804DD6C
	bl EtecoonCheckFaceForeground
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804DDF4
_0804DD6C:
	ldr r0, _0804DD9C @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x31
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _0804DDA0
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	lsrs r3, r0, #0x1a
	cmp r1, #0x1f
	bhi _0804DD8E
	adds r0, r2, #2
	strb r0, [r5]
_0804DD8E:
	ldrb r0, [r4, #0x1c]
	adds r0, #1
	strb r0, [r4, #0x1c]
	b _0804DDB4
	.align 2, 0
_0804DD98: .4byte gFrameCounter8Bit
_0804DD9C: .4byte gCurrentSprite
_0804DDA0:
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r2, [r5]
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	lsrs r3, r0, #0x1a
	cmp r1, #0xf
	bhi _0804DDB4
	adds r0, r2, #1
	strb r0, [r5]
_0804DDB4:
	adds r2, r4, #0
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804DDD4
	ldrh r0, [r2, #8]
	movs r1, #0xe0
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	cmp r0, r1
	blt _0804DDE0
	adds r0, r1, r3
	strh r0, [r2, #4]
	b _0804DDF4
_0804DDD4:
	ldrh r0, [r2, #8]
	ldr r1, _0804DDEC @ =0xFFFFFC80
	adds r0, r0, r1
	ldrh r1, [r2, #4]
	cmp r0, r1
	ble _0804DDF0
_0804DDE0:
	adds r1, r2, #0
	adds r1, #0x24
_0804DDE4:
	movs r0, #3
	strb r0, [r1]
	b _0804DDF4
	.align 2, 0
_0804DDEC: .4byte 0xFFFFFC80
_0804DDF0:
	subs r0, r1, r3
	strh r0, [r4, #4]
_0804DDF4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EtecoonStandingInit
EtecoonStandingInit: @ 0x0804DDFC
	ldr r0, _0804DE18 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #8
	strb r1, [r2]
	ldr r1, _0804DE1C @ =0x0838428C
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0xb
	strb r1, [r0]
	bx lr
	.align 2, 0
_0804DE18: .4byte gCurrentSprite
_0804DE1C: .4byte 0x0838428C

	thumb_func_start EtecoonStanding
EtecoonStanding: @ 0x0804DE20
	push {r4, lr}
	ldr r4, _0804DE40 @ =gCurrentSprite
	ldr r1, [r4, #0x18]
	ldr r0, _0804DE44 @ =0x0838428C
	cmp r1, r0
	bne _0804DE4C
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804DE62
	ldr r0, _0804DE48 @ =0x08384254
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	b _0804DE62
	.align 2, 0
_0804DE40: .4byte gCurrentSprite
_0804DE44: .4byte 0x0838428C
_0804DE48: .4byte 0x08384254
_0804DE4C:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804DE62
	subs r1, #0xa
	movs r0, #9
	strb r0, [r1]
_0804DE62:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EtecoonFacingForegroundInit
EtecoonFacingForegroundInit: @ 0x0804DE68
	push {lr}
	ldr r0, _0804DE84 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0xa
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	adds r1, r0, #0
	cmp r2, #1
	bne _0804DE8C
	ldr r0, _0804DE88 @ =0x083842D4
	b _0804DEA6
	.align 2, 0
_0804DE84: .4byte gCurrentSprite
_0804DE88: .4byte 0x083842D4
_0804DE8C:
	cmp r2, #2
	bne _0804DE98
	ldr r0, _0804DE94 @ =0x0838431C
	b _0804DEA6
	.align 2, 0
_0804DE94: .4byte 0x0838431C
_0804DE98:
	cmp r2, #3
	bne _0804DEA4
	ldr r0, _0804DEA0 @ =0x08384374
	b _0804DEA6
	.align 2, 0
_0804DEA0: .4byte 0x08384374
_0804DEA4:
	ldr r0, _0804DEBC @ =0x08384264
_0804DEA6:
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	ldr r0, _0804DEC0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #2
	adds r1, #0x2e
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0804DEBC: .4byte 0x08384264
_0804DEC0: .4byte gSpriteRandomNumber

	thumb_func_start EtecoonFacingForeground
EtecoonFacingForeground: @ 0x0804DEC4
	push {r4, lr}
	ldr r0, _0804DF20 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x2d
	ldrb r2, [r0]
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #3
	bne _0804DF30
	cmp r2, #0xff
	beq _0804DF30
	mov r1, ip
	ldrh r0, [r1, #0x16]
	cmp r0, #3
	bne _0804DF30
	ldrb r0, [r1, #0x1c]
	cmp r0, #6
	bne _0804DF30
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x38
	strb r0, [r1]
	mov r0, ip
	strb r3, [r0, #0x1c]
	movs r4, #0
	strh r3, [r0, #0x16]
	ldr r0, _0804DF24 @ =0x083843CC
	mov r1, ip
	str r0, [r1, #0x18]
	ldr r1, _0804DF28 @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r2, r0, r1
	strb r4, [r2, #0x1c]
	strh r3, [r2, #0x16]
	adds r1, #0x18
	adds r0, r0, r1
	ldr r1, _0804DF2C @ =0x0838447C
	str r1, [r0]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1, #4]
	b _0804DF82
	.align 2, 0
_0804DF20: .4byte gCurrentSprite
_0804DF24: .4byte 0x083843CC
_0804DF28: .4byte gSpriteData
_0804DF2C: .4byte 0x0838447C
_0804DF30:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804DF82
	ldr r1, _0804DF5C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r3, r1, #0
	cmp r0, #2
	beq _0804DF4A
	cmp r0, #0
	bne _0804DF60
_0804DF4A:
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804DF60
	subs r0, #1
	strb r0, [r1]
	b _0804DF82
	.align 2, 0
_0804DF5C: .4byte gCurrentSprite
_0804DF60:
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0804DF88 @ =0x0838428C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0804DF8C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #6
	bhi _0804DF82
	ldrh r0, [r3]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r3]
_0804DF82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804DF88: .4byte 0x0838428C
_0804DF8C: .4byte gSpriteRandomNumber

	thumb_func_start EtecoonTurningAroundInit
EtecoonTurningAroundInit: @ 0x0804DF90
	ldr r1, _0804DFA8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #4
	strb r0, [r2]
	ldr r0, _0804DFAC @ =0x083842C4
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804DFA8: .4byte gCurrentSprite
_0804DFAC: .4byte 0x083842C4

	thumb_func_start EtecoonTurningAround
EtecoonTurningAround: @ 0x0804DFB0
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804DFF0
	ldr r2, _0804DFE4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0804DFE8 @ =0x083842C4
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x22
	ldrb r0, [r2]
	cmp r0, #0xe
	bne _0804DFEC
	movs r0, #0xf
	b _0804DFEE
	.align 2, 0
_0804DFE4: .4byte gCurrentSprite
_0804DFE8: .4byte 0x083842C4
_0804DFEC:
	movs r0, #0xe
_0804DFEE:
	strb r0, [r2]
_0804DFF0:
	pop {r0}
	bx r0

	thumb_func_start EtecoonTurningAroundSecondPart
EtecoonTurningAroundSecondPart: @ 0x0804DFF4
	push {lr}
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804E006
	ldr r0, _0804E00C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0804E006:
	pop {r0}
	bx r0
	.align 2, 0
_0804E00C: .4byte gCurrentSprite

	thumb_func_start EtecoonJumpingToTire
EtecoonJumpingToTire: @ 0x0804E010
	push {r4, r5, r6, lr}
	ldr r5, _0804E05C @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804E056
	adds r1, r5, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x3a
	strb r0, [r1]
	strb r3, [r5, #0x1c]
	movs r4, #0
	strh r3, [r5, #0x16]
	ldr r0, _0804E060 @ =0x083843F4
	str r0, [r5, #0x18]
	ldr r0, _0804E064 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #1
	adds r1, #0xa
	strb r0, [r1]
	ldr r2, _0804E068 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r1, r0, r2
	strb r4, [r1, #0x1c]
	strh r3, [r1, #0x16]
	adds r2, #0x18
	adds r0, r0, r2
	ldr r1, _0804E06C @ =0x0838449C
	str r1, [r0]
_0804E056:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E05C: .4byte gCurrentSprite
_0804E060: .4byte 0x083843F4
_0804E064: .4byte gSpriteRandomNumber
_0804E068: .4byte gSpriteData
_0804E06C: .4byte 0x0838449C

	thumb_func_start EtecoonSwingingFromTire
EtecoonSwingingFromTire: @ 0x0804E070
	push {r4, r5, r6, lr}
	ldr r4, _0804E0A4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r6, [r0]
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804E0F0
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r5, r0, #0
	cmp r5, #0
	beq _0804E0C8
	subs r0, #1
	strb r0, [r1]
	ldr r0, _0804E0A8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E0B0
	ldr r0, _0804E0AC @ =0x083843F4
	b _0804E0B2
	.align 2, 0
_0804E0A4: .4byte gCurrentSprite
_0804E0A8: .4byte gSpriteRandomNumber
_0804E0AC: .4byte 0x083843F4
_0804E0B0:
	ldr r0, _0804E0C0 @ =0x0838441C
_0804E0B2:
	str r0, [r4, #0x18]
	ldr r1, _0804E0C4 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	b _0804E0F0
	.align 2, 0
_0804E0C0: .4byte 0x0838441C
_0804E0C4: .4byte gCurrentSprite
_0804E0C8:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	strb r5, [r4, #0x1c]
	movs r3, #0
	strh r5, [r4, #0x16]
	ldr r0, _0804E0F8 @ =0x08384444
	str r0, [r4, #0x18]
	ldr r2, _0804E0FC @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r1, r0, r2
	strb r3, [r1, #0x1c]
	strh r5, [r1, #0x16]
	adds r2, #0x18
	adds r0, r0, r2
	ldr r1, _0804E100 @ =0x083844BC
	str r1, [r0]
_0804E0F0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804E0F8: .4byte 0x08384444
_0804E0FC: .4byte gSpriteData
_0804E100: .4byte 0x083844BC

	thumb_func_start EtecoonFallingFromTire
EtecoonFallingFromTire: @ 0x0804E104
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804E132
	ldr r3, _0804E138 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #5
	strb r0, [r1]
	ldr r0, _0804E13C @ =0x0838428C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0804E140 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #6
	bhi _0804E132
	ldrh r0, [r3]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r3]
_0804E132:
	pop {r0}
	bx r0
	.align 2, 0
_0804E138: .4byte gCurrentSprite
_0804E13C: .4byte 0x0838428C
_0804E140: .4byte gSpriteRandomNumber

	thumb_func_start EtecoonTurningAroundWhileLeavingInit
EtecoonTurningAroundWhileLeavingInit: @ 0x0804E144
	ldr r1, _0804E15C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x3e
	strb r0, [r2]
	ldr r0, _0804E160 @ =0x083842C4
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804E15C: .4byte gCurrentSprite
_0804E160: .4byte 0x083842C4

	thumb_func_start EtecoonTurningAroundWhileLeaving
EtecoonTurningAroundWhileLeaving: @ 0x0804E164
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804E18A
	ldr r2, _0804E190 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _0804E194 @ =0x083842C4
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
_0804E18A:
	pop {r0}
	bx r0
	.align 2, 0
_0804E190: .4byte gCurrentSprite
_0804E194: .4byte 0x083842C4

	thumb_func_start EtecoonTurningAroundWhileLeavingSecondPart
EtecoonTurningAroundWhileLeavingSecondPart: @ 0x0804E198
	push {lr}
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804E1AA
	ldr r0, _0804E1B0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x19
	strb r1, [r0]
_0804E1AA:
	pop {r0}
	bx r0
	.align 2, 0
_0804E1B0: .4byte gCurrentSprite

	thumb_func_start EtecoonLeavingEnclosureInit
EtecoonLeavingEnclosureInit: @ 0x0804E1B4
	ldr r3, _0804E1D4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #3
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804E1D4: .4byte gCurrentSprite

	thumb_func_start EtecoonLeavingEnclosure
EtecoonLeavingEnclosure: @ 0x0804E1D8
	push {r4, r5, lr}
	ldr r2, _0804E210 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r4, [r0]
	ldr r1, _0804E214 @ =0x0838188C
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _0804E218 @ =0x00007FFF
	adds r3, r2, #0
	cmp r1, r0
	bne _0804E296
	ldrh r0, [r2, #4]
	ldr r4, _0804E21C @ =0x0000FFF8
	ands r4, r0
	ldrh r1, [r2, #8]
	ldr r0, _0804E220 @ =gAbilityRestingXPosition
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r0, #0x40
	cmp r1, r0
	bne _0804E228
	ldr r5, _0804E224 @ =0xFFFFFF00
	b _0804E23E
	.align 2, 0
_0804E210: .4byte gCurrentSprite
_0804E214: .4byte 0x0838188C
_0804E218: .4byte 0x00007FFF
_0804E21C: .4byte 0x0000FFF8
_0804E220: .4byte gAbilityRestingXPosition
_0804E224: .4byte 0xFFFFFF00
_0804E228:
	movs r5, #0xa0
	lsls r5, r5, #1
	adds r0, r2, r5
	cmp r1, r0
	bne _0804E23C
	ldr r1, _0804E238 @ =0xFFFFFEC0
	adds r0, r2, r1
	b _0804E240
	.align 2, 0
_0804E238: .4byte 0xFFFFFEC0
_0804E23C:
	ldr r5, _0804E25C @ =0xFFFFFE80
_0804E23E:
	adds r0, r2, r5
_0804E240:
	movs r2, #8
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bhs _0804E260
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0804E26E
	b _0804E28C
	.align 2, 0
_0804E25C: .4byte 0xFFFFFE80
_0804E260:
	cmp r4, r0
	bls _0804E278
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0804E28C
_0804E26E:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0804E2B8
_0804E278:
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804E28C
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	b _0804E2B8
_0804E28C:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x3d
	strb r0, [r1]
	b _0804E2B8
_0804E296:
	adds r0, r4, #1
	mov r3, ip
	strb r0, [r3]
	ldrh r0, [r2, #2]
	adds r0, r0, r5
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804E2B2
	ldrh r0, [r2, #4]
	adds r0, #4
	b _0804E2B6
_0804E2B2:
	ldrh r0, [r2, #4]
	subs r0, #4
_0804E2B6:
	strh r0, [r2, #4]
_0804E2B8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EtecoonWalkingToWaitingSpotInit
EtecoonWalkingToWaitingSpotInit: @ 0x0804E2C0
	ldr r1, _0804E2D4 @ =gCurrentSprite
	ldr r0, _0804E2D8 @ =0x0838429C
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804E2D4: .4byte gCurrentSprite
_0804E2D8: .4byte 0x0838429C

	thumb_func_start EtecoonWalkingToWaitingSpot
EtecoonWalkingToWaitingSpot: @ 0x0804E2DC
	push {r4, r5, lr}
	ldr r1, _0804E2FC @ =gCurrentSprite
	ldrh r0, [r1, #4]
	ldr r5, _0804E300 @ =0x0000FFF8
	ands r5, r0
	ldrh r3, [r1, #8]
	ldr r0, _0804E304 @ =gAbilityRestingXPosition
	ldrh r2, [r0]
	adds r0, r2, #0
	adds r0, #0x40
	adds r4, r1, #0
	cmp r3, r0
	bne _0804E30C
	ldr r1, _0804E308 @ =0xFFFFFF00
	b _0804E322
	.align 2, 0
_0804E2FC: .4byte gCurrentSprite
_0804E300: .4byte 0x0000FFF8
_0804E304: .4byte gAbilityRestingXPosition
_0804E308: .4byte 0xFFFFFF00
_0804E30C:
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r2, r1
	cmp r3, r0
	bne _0804E320
	ldr r1, _0804E31C @ =0xFFFFFEC0
	b _0804E322
	.align 2, 0
_0804E31C: .4byte 0xFFFFFEC0
_0804E320:
	ldr r1, _0804E348 @ =0xFFFFFE80
_0804E322:
	adds r0, r2, r1
	movs r2, #8
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhs _0804E34C
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804E374
	ldrh r0, [r4, #4]
	adds r0, #4
	strh r0, [r4, #4]
	b _0804E37C
	.align 2, 0
_0804E348: .4byte 0xFFFFFE80
_0804E34C:
	cmp r5, r0
	bls _0804E362
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0804E374
	ldrh r0, [r4, #4]
	subs r0, #4
	strh r0, [r4, #4]
	b _0804E37C
_0804E362:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804E374
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1b
	b _0804E37A
_0804E374:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3d
_0804E37A:
	strb r0, [r1]
_0804E37C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EtecoonWaitingForOthersInit
EtecoonWaitingForOthersInit: @ 0x0804E384
	ldr r1, _0804E398 @ =gCurrentSprite
	ldr r0, _0804E39C @ =0x0838471C
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	bx lr
	.align 2, 0
_0804E398: .4byte gCurrentSprite
_0804E39C: .4byte 0x0838471C

	thumb_func_start EtecoonWaitingForOthers
EtecoonWaitingForOthers: @ 0x0804E3A0
	push {r4, r5, lr}
	ldr r1, _0804E410 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804E3B6
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0804E3B6
	ldr r0, _0804E414 @ =0x00000121
	bl SoundPlayNotAlreadyPlaying
_0804E3B6:
	movs r3, #0
	ldr r5, _0804E418 @ =gSpriteData
	ldr r4, _0804E41C @ =0x030006EA
	movs r0, #0xa
	rsbs r0, r0, #0
	adds r0, r0, r4
	mov ip, r0
_0804E3C4:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E3FE
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804E3FE
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xb8
	bne _0804E3FE
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _0804E3FE
	movs r0, #0x1d
	mov r1, ip
	strb r0, [r1]
	movs r0, #0x14
	strb r0, [r4]
_0804E3FE:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0804E3C4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E410: .4byte gCurrentSprite
_0804E414: .4byte 0x00000121
_0804E418: .4byte gSpriteData
_0804E41C: .4byte 0x030006EA

	thumb_func_start EtecoonRunning
EtecoonRunning: @ 0x0804E420
	push {lr}
	ldr r2, _0804E444 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804E44C
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0804E468
	ldr r0, _0804E448 @ =0x0838429C
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r1, [r2, #0x16]
	b _0804E468
	.align 2, 0
_0804E444: .4byte gCurrentSprite
_0804E448: .4byte 0x0838429C
_0804E44C:
	ldrh r0, [r2, #4]
	adds r0, #0x10
	strh r0, [r2, #4]
	ldrb r0, [r2, #0x1c]
	adds r0, #2
	strb r0, [r2, #0x1c]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _0804E468
	strh r0, [r2]
_0804E468:
	pop {r0}
	bx r0

	thumb_func_start TireSwingInit
TireSwingInit: @ 0x0804E46C
	ldr r0, _0804E4C8 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x22
	movs r3, #0
	movs r0, #0xd
	strb r0, [r1]
	subs r1, #1
	movs r0, #3
	strb r0, [r1]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x20
	movs r2, #0
	strh r0, [r1, #2]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #0x27
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0804E4CC @ =0x0000FFC0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r0, #0x20
	strh r0, [r1, #0xc]
	ldr r0, _0804E4D0 @ =0x0000FFFC
	strh r0, [r1, #0xe]
	movs r0, #4
	strh r0, [r1, #0x10]
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0804E4D4 @ =0x0838446C
	mov r1, ip
	str r0, [r1, #0x18]
	strb r2, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804E4C8: .4byte gCurrentSprite
_0804E4CC: .4byte 0x0000FFC0
_0804E4D0: .4byte 0x0000FFFC
_0804E4D4: .4byte 0x0838446C

	thumb_func_start TireSwingIdle
TireSwingIdle: @ 0x0804E4D8
	push {r4, lr}
	ldr r4, _0804E510 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804E50A
	ldr r1, [r4, #0x18]
	ldr r0, _0804E514 @ =0x083844BC
	cmp r1, r0
	bne _0804E50A
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804E50A
	ldr r0, _0804E518 @ =0x0838446C
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0804E51C @ =0x0000FBFF
	ands r0, r1
	strh r0, [r4]
_0804E50A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804E510: .4byte gCurrentSprite
_0804E514: .4byte 0x083844BC
_0804E518: .4byte 0x0838446C
_0804E51C: .4byte 0x0000FBFF

	thumb_func_start Dachora
Dachora: @ 0x0804E520
	push {lr}
	ldr r0, _0804E540 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bls _0804E536
	b _0804E6AE
_0804E536:
	lsls r0, r0, #2
	ldr r1, _0804E544 @ =_0804E548
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E540: .4byte gCurrentSprite
_0804E544: .4byte _0804E548
_0804E548: @ jump table
	.4byte _0804E634 @ case 0
	.4byte _0804E63A @ case 1
	.4byte _0804E63E @ case 2
	.4byte _0804E644 @ case 3
	.4byte _0804E648 @ case 4
	.4byte _0804E64E @ case 5
	.4byte _0804E6AE @ case 6
	.4byte _0804E654 @ case 7
	.4byte _0804E658 @ case 8
	.4byte _0804E65E @ case 9
	.4byte _0804E662 @ case 10
	.4byte _0804E6AE @ case 11
	.4byte _0804E6AE @ case 12
	.4byte _0804E6AE @ case 13
	.4byte _0804E6AE @ case 14
	.4byte _0804E6AE @ case 15
	.4byte _0804E6AE @ case 16
	.4byte _0804E6AE @ case 17
	.4byte _0804E6AE @ case 18
	.4byte _0804E6AE @ case 19
	.4byte _0804E6AE @ case 20
	.4byte _0804E6AE @ case 21
	.4byte _0804E6AE @ case 22
	.4byte _0804E678 @ case 23
	.4byte _0804E67C @ case 24
	.4byte _0804E682 @ case 25
	.4byte _0804E686 @ case 26
	.4byte _0804E68C @ case 27
	.4byte _0804E692 @ case 28
	.4byte _0804E698 @ case 29
	.4byte _0804E69E @ case 30
	.4byte _0804E6A4 @ case 31
	.4byte _0804E6AA @ case 32
	.4byte _0804E6AE @ case 33
	.4byte _0804E6AE @ case 34
	.4byte _0804E6AE @ case 35
	.4byte _0804E6AE @ case 36
	.4byte _0804E6AE @ case 37
	.4byte _0804E6AE @ case 38
	.4byte _0804E6AE @ case 39
	.4byte _0804E6AE @ case 40
	.4byte _0804E6AE @ case 41
	.4byte _0804E6AE @ case 42
	.4byte _0804E6AE @ case 43
	.4byte _0804E6AE @ case 44
	.4byte _0804E6AE @ case 45
	.4byte _0804E6AE @ case 46
	.4byte _0804E6AE @ case 47
	.4byte _0804E6AE @ case 48
	.4byte _0804E6AE @ case 49
	.4byte _0804E6AE @ case 50
	.4byte _0804E6AE @ case 51
	.4byte _0804E6AE @ case 52
	.4byte _0804E6AE @ case 53
	.4byte _0804E6AE @ case 54
	.4byte _0804E668 @ case 55
	.4byte _0804E66C @ case 56
	.4byte _0804E6AE @ case 57
	.4byte _0804E672 @ case 58
_0804E634:
	bl DachoraInit
	b _0804E6AE
_0804E63A:
	bl DachoraIdleInit
_0804E63E:
	bl DachoraIdle
	b _0804E6AE
_0804E644:
	bl DachoraTurningAroundInit
_0804E648:
	bl DachoraTurningAround
	b _0804E6AE
_0804E64E:
	bl DachoraTurningAroundSecondPart
	b _0804E6AE
_0804E654:
	bl DachoraStandingInit
_0804E658:
	bl DachoraStanding
	b _0804E6AE
_0804E65E:
	bl DachoraHeadMovementInit
_0804E662:
	bl DachoraHeadMovement
	b _0804E6AE
_0804E668:
	bl DachoraTurningAroundWhileLeavingInit
_0804E66C:
	bl DachoraTurningAroundWhileLeaving
	b _0804E6AE
_0804E672:
	bl DachoraTurningAroundWhileLeavingSecondPart
	b _0804E6AE
_0804E678:
	bl DachoraLeavingEnclosureInit
_0804E67C:
	bl DachoraLeavingEnclosure
	b _0804E6AE
_0804E682:
	bl DachoraWalkingToWaitingSpotInit
_0804E686:
	bl DachoraWalkingToWaitingSpot
	b _0804E6AE
_0804E68C:
	bl DachorawaitingForOthers
	b _0804E6AE
_0804E692:
	bl DachoraWaitingToSpawnBaby
	b _0804E6AE
_0804E698:
	bl DachoraWaitingForBaby
	b _0804E6AE
_0804E69E:
	bl DachoraBowing
	b _0804E6AE
_0804E6A4:
	bl DachoraWaitingToRun
	b _0804E6AE
_0804E6AA:
	bl DachoraRunning
_0804E6AE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start BabyDachora
BabyDachora: @ 0x0804E6B4
	push {lr}
	ldr r0, _0804E6D4 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x19
	bhi _0804E766
	lsls r0, r0, #2
	ldr r1, _0804E6D8 @ =_0804E6DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E6D4: .4byte gCurrentSprite
_0804E6D8: .4byte _0804E6DC
_0804E6DC: @ jump table
	.4byte _0804E744 @ case 0
	.4byte _0804E74A @ case 1
	.4byte _0804E750 @ case 2
	.4byte _0804E766 @ case 3
	.4byte _0804E766 @ case 4
	.4byte _0804E766 @ case 5
	.4byte _0804E766 @ case 6
	.4byte _0804E766 @ case 7
	.4byte _0804E766 @ case 8
	.4byte _0804E766 @ case 9
	.4byte _0804E766 @ case 10
	.4byte _0804E766 @ case 11
	.4byte _0804E766 @ case 12
	.4byte _0804E766 @ case 13
	.4byte _0804E766 @ case 14
	.4byte _0804E766 @ case 15
	.4byte _0804E766 @ case 16
	.4byte _0804E766 @ case 17
	.4byte _0804E766 @ case 18
	.4byte _0804E766 @ case 19
	.4byte _0804E766 @ case 20
	.4byte _0804E766 @ case 21
	.4byte _0804E766 @ case 22
	.4byte _0804E756 @ case 23
	.4byte _0804E75C @ case 24
	.4byte _0804E762 @ case 25
_0804E744:
	bl BabyDachoraInit
	b _0804E766
_0804E74A:
	bl BabyDachoraWalkingToGate
	b _0804E766
_0804E750:
	bl BabyDachoraLeavingEnclosure
	b _0804E766
_0804E756:
	bl BabyDachoraWalkingToWaitingSpot
	b _0804E766
_0804E75C:
	bl BabyDachoraWaitingToRun
	b _0804E766
_0804E762:
	bl BabyDachoraRunning
_0804E766:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Etecoon
Etecoon: @ 0x0804E76C
	push {lr}
	ldr r0, _0804E78C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x40
	bls _0804E782
	b _0804E910
_0804E782:
	lsls r0, r0, #2
	ldr r1, _0804E790 @ =_0804E794
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804E78C: .4byte gCurrentSprite
_0804E790: .4byte _0804E794
_0804E794: @ jump table
	.4byte _0804E898 @ case 0
	.4byte _0804E89E @ case 1
	.4byte _0804E8A2 @ case 2
	.4byte _0804E8A8 @ case 3
	.4byte _0804E8AC @ case 4
	.4byte _0804E8B2 @ case 5
	.4byte _0804E910 @ case 6
	.4byte _0804E8B8 @ case 7
	.4byte _0804E8BC @ case 8
	.4byte _0804E8C2 @ case 9
	.4byte _0804E8C6 @ case 10
	.4byte _0804E910 @ case 11
	.4byte _0804E910 @ case 12
	.4byte _0804E910 @ case 13
	.4byte _0804E910 @ case 14
	.4byte _0804E910 @ case 15
	.4byte _0804E910 @ case 16
	.4byte _0804E910 @ case 17
	.4byte _0804E910 @ case 18
	.4byte _0804E910 @ case 19
	.4byte _0804E910 @ case 20
	.4byte _0804E910 @ case 21
	.4byte _0804E910 @ case 22
	.4byte _0804E8EE @ case 23
	.4byte _0804E8F2 @ case 24
	.4byte _0804E8F8 @ case 25
	.4byte _0804E8FC @ case 26
	.4byte _0804E902 @ case 27
	.4byte _0804E906 @ case 28
	.4byte _0804E90C @ case 29
	.4byte _0804E910 @ case 30
	.4byte _0804E910 @ case 31
	.4byte _0804E910 @ case 32
	.4byte _0804E910 @ case 33
	.4byte _0804E910 @ case 34
	.4byte _0804E910 @ case 35
	.4byte _0804E910 @ case 36
	.4byte _0804E910 @ case 37
	.4byte _0804E910 @ case 38
	.4byte _0804E910 @ case 39
	.4byte _0804E910 @ case 40
	.4byte _0804E910 @ case 41
	.4byte _0804E910 @ case 42
	.4byte _0804E910 @ case 43
	.4byte _0804E910 @ case 44
	.4byte _0804E910 @ case 45
	.4byte _0804E910 @ case 46
	.4byte _0804E910 @ case 47
	.4byte _0804E910 @ case 48
	.4byte _0804E910 @ case 49
	.4byte _0804E910 @ case 50
	.4byte _0804E910 @ case 51
	.4byte _0804E910 @ case 52
	.4byte _0804E910 @ case 53
	.4byte _0804E910 @ case 54
	.4byte _0804E910 @ case 55
	.4byte _0804E8CC @ case 56
	.4byte _0804E910 @ case 57
	.4byte _0804E8D2 @ case 58
	.4byte _0804E910 @ case 59
	.4byte _0804E8D8 @ case 60
	.4byte _0804E8DE @ case 61
	.4byte _0804E8E2 @ case 62
	.4byte _0804E910 @ case 63
	.4byte _0804E8E8 @ case 64
_0804E898:
	bl EtecoonInit
	b _0804E910
_0804E89E:
	bl EtecoonIdleInit
_0804E8A2:
	bl EtecoonIdle
	b _0804E910
_0804E8A8:
	bl EtecoonTurningAroundInit
_0804E8AC:
	bl EtecoonTurningAround
	b _0804E910
_0804E8B2:
	bl EtecoonTurningAroundSecondPart
	b _0804E910
_0804E8B8:
	bl EtecoonStandingInit
_0804E8BC:
	bl EtecoonStanding
	b _0804E910
_0804E8C2:
	bl EtecoonFacingForegroundInit
_0804E8C6:
	bl EtecoonFacingForeground
	b _0804E910
_0804E8CC:
	bl EtecoonJumpingToTire
	b _0804E910
_0804E8D2:
	bl EtecoonSwingingFromTire
	b _0804E910
_0804E8D8:
	bl EtecoonFallingFromTire
	b _0804E910
_0804E8DE:
	bl EtecoonTurningAroundWhileLeavingInit
_0804E8E2:
	bl EtecoonTurningAroundWhileLeaving
	b _0804E910
_0804E8E8:
	bl EtecoonTurningAroundWhileLeavingSecondPart
	b _0804E910
_0804E8EE:
	bl EtecoonLeavingEnclosureInit
_0804E8F2:
	bl EtecoonLeavingEnclosure
	b _0804E910
_0804E8F8:
	bl EtecoonWalkingToWaitingSpotInit
_0804E8FC:
	bl EtecoonWalkingToWaitingSpot
	b _0804E910
_0804E902:
	bl EtecoonWaitingForOthersInit
_0804E906:
	bl EtecoonWaitingForOthers
	b _0804E910
_0804E90C:
	bl EtecoonRunning
_0804E910:
	pop {r0}
	bx r0

	thumb_func_start TireSwing
TireSwing: @ 0x0804E914
	push {lr}
	ldr r0, _0804E930 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804E934
	cmp r0, #2
	beq _0804E93A
	b _0804E93E
	.align 2, 0
_0804E930: .4byte gCurrentSprite
_0804E934:
	bl TireSwingInit
	b _0804E93E
_0804E93A:
	bl TireSwingIdle
_0804E93E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HabitationGateLight
HabitationGateLight: @ 0x0804E944
	push {r4, r5, r6, lr}
	ldr r4, _0804E964 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r6, #0
	movs r0, #1
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0
	beq _0804E968
	cmp r0, #2
	beq _0804E9F4
	b _0804EA08
	.align 2, 0
_0804E964: .4byte gCurrentSprite
_0804E968:
	ldrh r0, [r4]
	ldr r1, _0804E980 @ =0x0000FFFB
	ands r1, r0
	strh r1, [r4]
	bl EventCheckAfter_AnimalsReleased
	cmp r0, #0
	beq _0804E988
	ldr r0, _0804E984 @ =0x08384744
	str r0, [r4, #0x18]
	b _0804E998
	.align 2, 0
_0804E980: .4byte 0x0000FFFB
_0804E984: .4byte 0x08384744
_0804E988:
	ldr r0, _0804E9E8 @ =0x08384674
	str r0, [r4, #0x18]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_0804E998:
	ldr r3, _0804E9EC @ =gCurrentSprite
	movs r0, #0
	strb r0, [r3, #0x1c]
	movs r1, #0
	strh r0, [r3, #0x16]
	adds r2, r3, #0
	adds r2, #0x22
	movs r0, #0xc
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x21
	movs r2, #2
	strb r2, [r0]
	ldrh r0, [r3, #2]
	subs r0, #0x20
	strh r0, [r3, #2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r4, r3, #0
	adds r4, #0x27
	movs r0, #0x40
	strb r0, [r4]
	adds r0, r3, #0
	adds r0, #0x28
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _0804E9F0 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x24
	strb r2, [r0]
	b _0804EA08
	.align 2, 0
_0804E9E8: .4byte 0x08384674
_0804E9EC: .4byte gCurrentSprite
_0804E9F0: .4byte 0x0000FFFC
_0804E9F4:
	bl EventCheckAfter_AnimalsReleased
	cmp r0, #0
	beq _0804EA08
	ldr r0, _0804EA10 @ =0x08384744
	str r0, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r6, [r4, #0x16]
	movs r0, #0x18
	strb r0, [r5]
_0804EA08:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804EA10: .4byte 0x08384744

	thumb_func_start HabitationGate
HabitationGate: @ 0x0804EA14
	push {r4, r5, r6, lr}
	ldr r4, _0804EA38 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r5, #0
	movs r0, #1
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x24
	ldrb r0, [r6]
	cmp r0, #2
	beq _0804EAB8
	cmp r0, #2
	bgt _0804EA3C
	cmp r0, #0
	beq _0804EA42
	b _0804EAE4
	.align 2, 0
_0804EA38: .4byte gCurrentSprite
_0804EA3C:
	cmp r0, #0x18
	beq _0804EAD0
	b _0804EAE4
_0804EA42:
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	subs r1, #1
	movs r0, #3
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	movs r2, #0
	strh r0, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #6
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _0804EA90 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _0804EA94 @ =0x08384684
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r5, [r4, #0x16]
	bl EventCheckAfter_AnimalsReleased
	cmp r0, #0
	beq _0804EA98
	strh r5, [r4]
	b _0804EAE4
	.align 2, 0
_0804EA90: .4byte 0x0000FFFC
_0804EA94: .4byte 0x08384684
_0804EA98:
	ldrh r1, [r4]
	ldr r0, _0804EAB4 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	movs r0, #2
	strb r0, [r6]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	b _0804EAE4
	.align 2, 0
_0804EAB4: .4byte 0x0000FFFB
_0804EAB8:
	bl EventCheckAfter_AnimalsReleased
	cmp r0, #0
	beq _0804EAE4
	ldr r0, _0804EACC @ =0x08384694
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r5, [r4, #0x16]
	movs r0, #0x18
	b _0804EAE2
	.align 2, 0
_0804EACC: .4byte 0x08384694
_0804EAD0:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804EAE4
	ldrh r0, [r4]
	movs r1, #4
	orrs r1, r0
	strh r1, [r4]
	movs r0, #0x1a
_0804EAE2:
	strb r0, [r6]
_0804EAE4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MetroidInit
MetroidInit: @ 0x0804EAEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0804EBAC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	mov sb, r0
	ldr r1, _0804EBB0 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, sb
	strb r1, [r4, #0x1c]
	ldr r2, _0804EBB4 @ =gFrameCounter8Bit
	mov r8, r2
	ldrb r1, [r2]
	movs r6, #3
	adds r0, r6, #0
	ands r0, r1
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r5, #0xf0
	ands r5, r0
	bl EventCheckOn_RestrictedLabExplosion
	cmp r0, #0
	bne _0804EB3E
	b _0804EC38
_0804EB3E:
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #5
	strb r0, [r1]
	ldr r2, _0804EBB8 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x22
	strb r6, [r0]
	subs r0, #1
	movs r7, #1
	strb r7, [r0]
	movs r5, #0x24
	adds r5, r5, r4
	mov ip, r5
	movs r0, #0x18
	strb r0, [r5]
	ldr r0, _0804EBBC @ =0x083852BC
	str r0, [r4, #0x18]
	movs r0, #0xb4
	strh r0, [r4, #6]
	ldr r0, _0804EBC0 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov sl, r2
	ldrh r1, [r4, #2]
	adds r3, r1, #0
	ldr r5, _0804EBC4 @ =0xFFFFFEC0
	adds r0, r2, r5
	cmp r0, r1
	bge _0804EBC8
	adds r0, r4, #0
	adds r0, #0x2d
	strb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, sb
	strb r1, [r0]
	ldrh r0, [r4, #4]
	subs r0, #0xc0
	strh r0, [r4, #4]
	b _0804ED06
	.align 2, 0
_0804EBAC: .4byte gCurrentSprite
_0804EBB0: .4byte 0x0000FFFC
_0804EBB4: .4byte gSpriteRandomNumber
_0804EBB8: .4byte sPrimarySpriteStats
_0804EBBC: .4byte 0x083852BC
_0804EBC0: .4byte gSamusData
_0804EBC4: .4byte 0xFFFFFEC0
_0804EBC8:
	ldr r5, _0804EBF0 @ =0xFFFFFE80
	adds r0, r2, r5
	cmp r0, r1
	bge _0804EBF4
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x31
	mov r1, sb
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r0, [r4, #4]
	adds r0, #0xc0
	strh r0, [r4, #4]
	b _0804ED06
	.align 2, 0
_0804EBF0: .4byte 0xFFFFFE80
_0804EBF4:
	ldr r0, _0804EC14 @ =0xFFFFFE40
	add r0, sl
	cmp r0, r3
	bge _0804EC18
	adds r0, r4, #0
	adds r0, #0x2d
	strb r6, [r0]
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0x30
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x28
	strb r0, [r1]
	b _0804ED06
	.align 2, 0
_0804EC14: .4byte 0xFFFFFE40
_0804EC18:
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r1, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #4
	mov r5, sb
	strb r5, [r0]
	movs r0, #0x1c
	mov r1, ip
	strb r0, [r1]
	b _0804ED06
_0804EC38:
	adds r0, r4, #0
	adds r0, #0x25
	mov r2, sb
	strb r2, [r0]
	subs r0, #4
	strb r6, [r0]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x18
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	bl SpriteUtilChooseRandomXDirection
	mov r2, r8
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804EC80
	ldrh r1, [r4]
	ldr r0, _0804EC7C @ =0x0000FBFF
	ands r0, r1
	b _0804EC8A
	.align 2, 0
_0804EC7C: .4byte 0x0000FBFF
_0804EC80:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
_0804EC8A:
	strh r0, [r4]
	cmp r5, #0x10
	bne _0804ECA8
	ldr r0, _0804ECA0 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	subs r1, #0x20
	strh r1, [r0, #2]
	ldr r1, _0804ECA4 @ =0x083852E4
	str r1, [r0, #0x18]
	b _0804ED06
	.align 2, 0
_0804ECA0: .4byte gCurrentSprite
_0804ECA4: .4byte 0x083852E4
_0804ECA8:
	ldr r1, _0804ECCC @ =gCurrentSprite
	ldr r0, _0804ECD0 @ =0x083852BC
	str r0, [r1, #0x18]
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	beq _0804ECD8
	ldr r1, _0804ECD4 @ =gFrameCounter8Bit
	ldrh r0, [r3, #2]
	ldrb r5, [r1]
	adds r0, r0, r5
	strh r0, [r3, #2]
	adds r2, r1, #0
	b _0804ECE2
	.align 2, 0
_0804ECCC: .4byte gCurrentSprite
_0804ECD0: .4byte 0x083852BC
_0804ECD4: .4byte gSpriteRandomNumber
_0804ECD8:
	ldr r2, _0804ECF8 @ =gFrameCounter8Bit
	ldrb r1, [r2]
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #2]
_0804ECE2:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804ECFC
	ldrb r0, [r2]
	lsls r0, r0, #1
	ldrh r1, [r3, #4]
	adds r0, r0, r1
	b _0804ED04
	.align 2, 0
_0804ECF8: .4byte gSpriteRandomNumber
_0804ECFC:
	ldrb r1, [r2]
	lsls r1, r1, #1
	ldrh r0, [r3, #4]
	subs r0, r0, r1
_0804ED04:
	strh r0, [r3, #4]
_0804ED06:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MetroidSwaying
MetroidSwaying: @ 0x0804ED14
	push {r4, r5, r6, r7, lr}
	ldr r2, _0804ED68 @ =gCurrentSprite
	adds r5, r2, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r4, _0804ED6C @ =0x0838487C
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _0804ED70 @ =0x00007FFF
	cmp r0, r6
	bne _0804ED34
	ldrh r3, [r4]
	movs r1, #0
_0804ED34:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _0804ED74 @ =0x083848FC
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _0804ED58
	ldrh r3, [r4]
	movs r1, #0
_0804ED58:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804ED68: .4byte gCurrentSprite
_0804ED6C: .4byte 0x0838487C
_0804ED70: .4byte 0x00007FFF
_0804ED74: .4byte 0x083848FC

	thumb_func_start MetroidFloatingInTube
MetroidFloatingInTube: @ 0x0804ED78
	push {r4, r5, r6, r7, lr}
	ldr r1, _0804ED90 @ =gCurrentSprite
	ldrh r5, [r1]
	movs r0, #2
	ands r0, r5
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0
	bne _0804ED94
	strh r0, [r3]
	b _0804F054
	.align 2, 0
_0804ED90: .4byte gCurrentSprite
_0804ED94:
	movs r4, #0
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x10
	beq _0804EDA6
	b _0804EEF8
_0804EDA6:
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _0804EDD8 @ =0x0838475C
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804EDDC @ =0x00007FFF
	cmp r1, r0
	bne _0804EDE4
	ldr r0, _0804EDE0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0804EDD2
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	eors r0, r5
	strh r0, [r3]
_0804EDD2:
	mov r2, ip
	strb r4, [r2]
	b _0804EE50
	.align 2, 0
_0804EDD8: .4byte 0x0838475C
_0804EDDC: .4byte 0x00007FFF
_0804EDE0: .4byte gSpriteRandomNumber
_0804EDE4:
	adds r0, r2, #1
	mov r7, ip
	strb r0, [r7]
	ldrh r1, [r3, #2]
	lsrs r1, r1, #2
	ldr r0, _0804EE0C @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0804EE10
	cmp r1, #0x58
	bls _0804EE16
	movs r4, #1
	b _0804EE1A
	.align 2, 0
_0804EE0C: .4byte gBg1YPosition
_0804EE10:
	cmp r1, #0x3b
	bhi _0804EE16
	movs r4, #1
_0804EE16:
	cmp r4, #0
	beq _0804EE38
_0804EE1A:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0804EE34
	movs r0, #0xd
	b _0804EE36
_0804EE34:
	movs r0, #0xc
_0804EE36:
	strb r0, [r1]
_0804EE38:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804EE4A
	ldrh r0, [r3, #2]
	adds r0, r0, r6
	b _0804EE4E
_0804EE4A:
	ldrh r0, [r3, #2]
	subs r0, r0, r6
_0804EE4E:
	strh r0, [r3, #2]
_0804EE50:
	adds r5, r3, #0
	adds r5, #0x30
	ldrb r2, [r5]
	ldr r1, _0804EE94 @ =0x0838479C
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804EE98 @ =0x00007FFF
	cmp r1, r0
	bne _0804EE6A
	b _0804EFBC
_0804EE6A:
	adds r0, r2, #1
	strb r0, [r5]
	ldrh r1, [r3, #4]
	lsrs r1, r1, #2
	ldr r0, _0804EE9C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	cmp r2, #0x77
	bhi _0804EEA6
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804EEA0
	cmp r2, #0x40
	bls _0804EEC2
	b _0804EEBC
	.align 2, 0
_0804EE94: .4byte 0x0838479C
_0804EE98: .4byte 0x00007FFF
_0804EE9C: .4byte gBg1XPosition
_0804EEA0:
	cmp r2, #0x27
	bhi _0804EEC2
	b _0804EEBC
_0804EEA6:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804EEB8
	cmp r2, #0xc8
	bls _0804EEC2
	b _0804EEBC
_0804EEB8:
	cmp r2, #0xaf
	bhi _0804EEC2
_0804EEBC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804EEC2:
	cmp r4, #0
	beq _0804EEE4
	ldrh r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0804EEE0
	movs r0, #0xd
	b _0804EEE2
_0804EEE0:
	movs r0, #0xc
_0804EEE2:
	strb r0, [r1]
_0804EEE4:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0804EEF2
	b _0804F04E
_0804EEF2:
	ldrh r0, [r3, #4]
	adds r0, r0, r6
	b _0804F052
_0804EEF8:
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _0804EF2C @ =0x083847EC
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804EF30 @ =0x00007FFF
	cmp r1, r0
	bne _0804EF38
	ldr r0, _0804EF34 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0804EF24
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	eors r0, r5
	strh r0, [r3]
_0804EF24:
	mov r2, ip
	strb r4, [r2]
	b _0804EFA4
	.align 2, 0
_0804EF2C: .4byte 0x083847EC
_0804EF30: .4byte 0x00007FFF
_0804EF34: .4byte gSpriteRandomNumber
_0804EF38:
	adds r0, r2, #1
	mov r7, ip
	strb r0, [r7]
	ldrh r1, [r3, #2]
	lsrs r1, r1, #2
	ldr r0, _0804EF60 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r5
	cmp r0, #0
	beq _0804EF64
	cmp r1, #0x64
	bls _0804EF6A
	movs r4, #1
	b _0804EF6E
	.align 2, 0
_0804EF60: .4byte gBg1YPosition
_0804EF64:
	cmp r1, #0x1d
	bhi _0804EF6A
	movs r4, #1
_0804EF6A:
	cmp r4, #0
	beq _0804EF8C
_0804EF6E:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0804EF88
	movs r0, #0xd
	b _0804EF8A
_0804EF88:
	movs r0, #0xc
_0804EF8A:
	strb r0, [r1]
_0804EF8C:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0804EF9E
	ldrh r0, [r3, #2]
	adds r0, r0, r6
	b _0804EFA2
_0804EF9E:
	ldrh r0, [r3, #2]
	subs r0, r0, r6
_0804EFA2:
	strh r0, [r3, #2]
_0804EFA4:
	adds r5, r3, #0
	adds r5, #0x30
	ldrb r2, [r5]
	ldr r1, _0804EFD8 @ =0x0838482C
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0804EFDC @ =0x00007FFF
	cmp r1, r0
	bne _0804EFE4
_0804EFBC:
	ldr r0, _0804EFE0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #3
	bhi _0804EFD0
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
_0804EFD0:
	movs r0, #0
	strb r0, [r5]
	b _0804F054
	.align 2, 0
_0804EFD8: .4byte 0x0838482C
_0804EFDC: .4byte 0x00007FFF
_0804EFE0: .4byte gSpriteRandomNumber
_0804EFE4:
	adds r0, r2, #1
	strb r0, [r5]
	ldrh r1, [r3, #4]
	lsrs r1, r1, #2
	ldr r0, _0804F00C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804F010
	cmp r2, #0x8c
	bls _0804F01A
	b _0804F014
	.align 2, 0
_0804F00C: .4byte gBg1XPosition
_0804F010:
	cmp r2, #0x63
	bhi _0804F01A
_0804F014:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0804F01A:
	cmp r4, #0
	beq _0804F03C
	ldrh r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0xc
	bne _0804F038
	movs r0, #0xd
	b _0804F03A
_0804F038:
	movs r0, #0xc
_0804F03A:
	strb r0, [r1]
_0804F03C:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804F04E
	ldrh r0, [r3, #4]
	adds r0, r0, r6
	b _0804F052
_0804F04E:
	ldrh r0, [r3, #4]
	subs r0, r0, r6
_0804F052:
	strh r0, [r3, #4]
_0804F054:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MetroidFloatingNearSA_X
MetroidFloatingNearSA_X: @ 0x0804F05C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _0804F104 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r1, [r0]
	ldr r4, _0804F108 @ =0x0838487C
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r5, #0
	ldrsh r0, [r0, r5]
	ldr r6, _0804F10C @ =0x00007FFF
	cmp r0, r6
	bne _0804F082
	ldrh r3, [r4]
	movs r1, #0
_0804F082:
	adds r0, r1, #1
	mov r7, ip
	strb r0, [r7]
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	movs r1, #0
	mov r8, r1
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r4, _0804F110 @ =0x083848FC
	lsls r0, r1, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _0804F0AC
	ldrh r3, [r4]
	movs r1, #0
_0804F0AC:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	ldrh r0, [r2, #6]
	subs r0, #1
	strh r0, [r2, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0804F0FA
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
	movs r0, #1
	strb r0, [r5]
	adds r1, r2, #0
	adds r1, #0x2e
	mov r3, r8
	strb r3, [r1]
	mov r5, ip
	strb r0, [r5]
	ldrh r1, [r2]
	ldr r0, _0804F114 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804F0FA
	ldr r0, _0804F118 @ =0x0000023A
	bl SoundPlay
_0804F0FA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804F104: .4byte gCurrentSprite
_0804F108: .4byte 0x0838487C
_0804F10C: .4byte 0x00007FFF
_0804F110: .4byte 0x083848FC
_0804F114: .4byte 0x0000F7FF
_0804F118: .4byte 0x0000023A

	thumb_func_start MetroidFloatingTowardsSA_X
MetroidFloatingTowardsSA_X: @ 0x0804F11C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r2, _0804F21C @ =gCurrentSprite
	ldrh r0, [r2, #2]
	mov sl, r0
	ldrh r1, [r2, #4]
	mov sb, r1
	movs r3, #0x10
	mov r8, r3
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0804F1E6
	movs r6, #0
	adds r5, r4, #0
_0804F146:
	ldr r1, _0804F220 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804F1DC
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0804F1DC
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xbc
	bne _0804F1DC
	ldrh r7, [r2, #2]
	ldrh r3, [r2, #4]
	mov r1, sl
	add r1, r8
	adds r0, r7, #0
	subs r0, #0x78
	cmp r1, r0
	ble _0804F1DC
	mov r0, sl
	mov r1, r8
	subs r0, r0, r1
	mov ip, r0
	cmp ip, r7
	bge _0804F1DC
	mov r1, sb
	add r1, r8
	adds r0, r3, #0
	subs r0, #0x14
	cmp r1, r0
	ble _0804F1DC
	mov r7, sb
	mov r0, r8
	subs r1, r7, r0
	adds r0, r3, #0
	adds r0, #0x14
	cmp r1, r0
	bge _0804F1DC
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x2f
	movs r7, #0
	strb r7, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	movs r3, #0
	strb r3, [r0]
	ldr r7, _0804F224 @ =0x030006ED
	strb r1, [r7]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #2
	bne _0804F1DC
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0804F228 @ =0x0000023B
	bl SoundPlay
_0804F1DC:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x17
	bls _0804F146
_0804F1E6:
	ldr r0, _0804F22C @ =gFrameCounter8Bit
	ldrb r2, [r0]
	adds r3, r2, #0
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0804F28C
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804F23C
	ldr r0, _0804F230 @ =gXParasiteTargetYPosition
	adds r1, r2, #0
	adds r1, #0x50
	ldrh r0, [r0]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _0804F234 @ =gXParasiteTargetXPosition
	ldr r3, _0804F238 @ =0x0000FFE0
	adds r0, r2, r3
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0804F274
	.align 2, 0
_0804F21C: .4byte gCurrentSprite
_0804F220: .4byte gSpriteData
_0804F224: .4byte 0x030006ED
_0804F228: .4byte 0x0000023B
_0804F22C: .4byte gSpriteRandomNumber
_0804F230: .4byte gXParasiteTargetYPosition
_0804F234: .4byte gXParasiteTargetXPosition
_0804F238: .4byte 0x0000FFE0
_0804F23C:
	cmp r0, #2
	bne _0804F25C
	ldr r0, _0804F254 @ =gXParasiteTargetYPosition
	adds r1, r2, #0
	adds r1, #0x32
	ldrh r0, [r0]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F258 @ =gXParasiteTargetXPosition
	subs r1, #0x3a
	b _0804F270
	.align 2, 0
_0804F254: .4byte gXParasiteTargetYPosition
_0804F258: .4byte gXParasiteTargetXPosition
_0804F25C:
	ldr r1, _0804F280 @ =gXParasiteTargetYPosition
	ldr r7, _0804F284 @ =0x0000FF88
	adds r0, r3, r7
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F288 @ =gXParasiteTargetXPosition
	adds r1, r3, #0
	subs r1, #0x20
_0804F270:
	ldrh r0, [r0]
	subs r0, r0, r1
_0804F274:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #0xa
	mov r8, r0
	movs r5, #0xa
	b _0804F2EA
	.align 2, 0
_0804F280: .4byte gXParasiteTargetYPosition
_0804F284: .4byte 0x0000FF88
_0804F288: .4byte gXParasiteTargetXPosition
_0804F28C:
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804F2B0
	ldr r0, _0804F2A8 @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F2AC @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	subs r0, #0x24
	b _0804F2E0
	.align 2, 0
_0804F2A8: .4byte gXParasiteTargetYPosition
_0804F2AC: .4byte gXParasiteTargetXPosition
_0804F2B0:
	cmp r0, #2
	bne _0804F2D0
	ldr r0, _0804F2C8 @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	subs r0, #0x32
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F2CC @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	adds r0, #8
	b _0804F2E0
	.align 2, 0
_0804F2C8: .4byte gXParasiteTargetYPosition
_0804F2CC: .4byte gXParasiteTargetXPosition
_0804F2D0:
	ldr r0, _0804F324 @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	subs r0, #0x64
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0804F328 @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	adds r0, #0x1e
_0804F2E0:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0x14
	mov r8, r1
	movs r5, #0x1e
_0804F2EA:
	ldrh r1, [r4]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0804F34C
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _0804F32C
	ldrh r1, [r4, #4]
	subs r0, r3, #4
	cmp r1, r0
	bgt _0804F35E
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r5
	bhs _0804F318
	adds r0, #1
	strb r0, [r1]
_0804F318:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
	b _0804F3A2
	.align 2, 0
_0804F324: .4byte gXParasiteTargetYPosition
_0804F328: .4byte gXParasiteTargetXPosition
_0804F32C:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0804F340
	lsrs r0, r0, #0x1a
	ldrh r3, [r4, #4]
	adds r0, r0, r3
	strh r0, [r4, #4]
	b _0804F3A2
_0804F340:
	ldrh r1, [r4]
	ldr r0, _0804F348 @ =0x0000FDFF
	ands r0, r1
	b _0804F398
	.align 2, 0
_0804F348: .4byte 0x0000FDFF
_0804F34C:
	adds r2, r4, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _0804F37C
	ldrh r1, [r4, #4]
	adds r0, r3, #4
	cmp r1, r0
	bge _0804F368
_0804F35E:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r2]
	b _0804F3A2
_0804F368:
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r5
	bhs _0804F376
	adds r0, #1
	strb r0, [r1]
_0804F376:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0804F38A
_0804F37C:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0804F392
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0804F38A:
	ldrh r0, [r4, #4]
	subs r0, r0, r1
	strh r0, [r4, #4]
	b _0804F3A2
_0804F392:
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
_0804F398:
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_0804F3A2:
	adds r2, r4, #0
	ldrh r5, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r6, #0
	ands r0, r5
	cmp r0, #0
	beq _0804F400
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804F3DE
	ldrh r1, [r2, #2]
	subs r0, r7, #4
	cmp r1, r0
	bgt _0804F412
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0804F3D2
	adds r0, #1
	strb r0, [r1]
_0804F3D2:
	ldrb r0, [r1]
	lsrs r0, r0, #2
	ldrh r7, [r2, #2]
	adds r0, r0, r7
	strh r0, [r2, #2]
	b _0804F456
_0804F3DE:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0804F3F2
	lsrs r0, r0, #0x1a
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _0804F456
_0804F3F2:
	ldr r0, _0804F3FC @ =0x0000FBFF
	ands r0, r5
	strh r0, [r2]
	adds r1, r2, #0
	b _0804F450
	.align 2, 0
_0804F3FC: .4byte 0x0000FBFF
_0804F400:
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0804F430
	ldrh r1, [r2, #2]
	adds r0, r7, #4
	cmp r1, r0
	bge _0804F41C
_0804F412:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _0804F456
_0804F41C:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0804F42A
	adds r0, #1
	strb r0, [r1]
_0804F42A:
	ldrb r1, [r1]
	lsrs r1, r1, #2
	b _0804F43E
_0804F430:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0804F446
	adds r1, r0, #0
	lsrs r1, r1, #0x1a
_0804F43E:
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _0804F456
_0804F446:
	ldrh r1, [r4]
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
_0804F450:
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0804F456:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start Metroid
Metroid: @ 0x0804F464
	push {lr}
	ldr r0, _0804F47C @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _0804F514
	lsls r0, r0, #2
	ldr r1, _0804F480 @ =_0804F484
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804F47C: .4byte gCurrentSprite
_0804F480: .4byte _0804F484
_0804F484: @ jump table
	.4byte _0804F4F8 @ case 0
	.4byte _0804F514 @ case 1
	.4byte _0804F4FE @ case 2
	.4byte _0804F514 @ case 3
	.4byte _0804F514 @ case 4
	.4byte _0804F514 @ case 5
	.4byte _0804F514 @ case 6
	.4byte _0804F514 @ case 7
	.4byte _0804F514 @ case 8
	.4byte _0804F514 @ case 9
	.4byte _0804F514 @ case 10
	.4byte _0804F514 @ case 11
	.4byte _0804F514 @ case 12
	.4byte _0804F514 @ case 13
	.4byte _0804F514 @ case 14
	.4byte _0804F514 @ case 15
	.4byte _0804F514 @ case 16
	.4byte _0804F514 @ case 17
	.4byte _0804F514 @ case 18
	.4byte _0804F514 @ case 19
	.4byte _0804F514 @ case 20
	.4byte _0804F514 @ case 21
	.4byte _0804F514 @ case 22
	.4byte _0804F514 @ case 23
	.4byte _0804F504 @ case 24
	.4byte _0804F514 @ case 25
	.4byte _0804F50A @ case 26
	.4byte _0804F514 @ case 27
	.4byte _0804F510 @ case 28
_0804F4F8:
	bl MetroidInit
	b _0804F514
_0804F4FE:
	bl MetroidFloatingInTube
	b _0804F514
_0804F504:
	bl MetroidFloatingNearSA_X
	b _0804F514
_0804F50A:
	bl MetroidFloatingTowardsSA_X
	b _0804F514
_0804F510:
	bl MetroidSwaying
_0804F514:
	pop {r0}
	bx r0

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

	thumb_func_start PowampInit
PowampInit: @ 0x0804F8D8
	push {r4, r5, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r3, _0804F938 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x27
	movs r4, #0
	movs r5, #0x30
	strb r5, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #0x10
	strb r0, [r1]
	ldr r2, _0804F93C @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #0xe
	strb r0, [r1]
	ldr r0, _0804F940 @ =0x08386638
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804F958
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0804F944
	strh r4, [r3]
	b _0804F98C
	.align 2, 0
_0804F938: .4byte gCurrentSprite
_0804F93C: .4byte sPrimarySpriteStats
_0804F940: .4byte 0x08386638
_0804F944:
	ldr r0, _0804F954 @ =0x0000FFB8
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r0, #0x18
	strh r0, [r3, #0xe]
	strh r5, [r3, #0x10]
	b _0804F968
	.align 2, 0
_0804F954: .4byte 0x0000FFB8
_0804F958:
	ldr r0, _0804F980 @ =0x0000FFCC
	strh r0, [r3, #0xa]
	adds r0, #0x20
	strh r0, [r3, #0xc]
	subs r0, #0x14
	strh r0, [r3, #0xe]
	movs r0, #0x28
	strh r0, [r3, #0x10]
_0804F968:
	ldr r2, _0804F984 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0804F988
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r2, #6]
	b _0804F98C
	.align 2, 0
_0804F980: .4byte 0x0000FFCC
_0804F984: .4byte gCurrentSprite
_0804F988:
	movs r0, #2
	strb r0, [r1]
_0804F98C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PowampIdleInit
PowampIdleInit: @ 0x0804F994
	ldr r1, _0804F9AC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0804F9B0 @ =0x08386638
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804F9AC: .4byte gCurrentSprite
_0804F9B0: .4byte 0x08386638

	thumb_func_start PowampIdle
PowampIdle: @ 0x0804F9B4
	push {r4, lr}
	ldr r4, _0804F9E4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0804F9DC
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r1, #0xc0
	bl CheckSamusNearSpriteAboveBelowSeparateRanges
	cmp r0, #0
	beq _0804F9DC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_0804F9DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F9E4: .4byte gCurrentSprite

	thumb_func_start PowampExtendingInit
PowampExtendingInit: @ 0x0804F9E8
	push {lr}
	ldr r1, _0804FA14 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x18
	strb r0, [r2]
	ldr r0, _0804FA18 @ =0x08386678
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804FA10
	movs r0, #0xe7
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804FA10:
	pop {r0}
	bx r0
	.align 2, 0
_0804FA14: .4byte gCurrentSprite
_0804FA18: .4byte 0x08386678

	thumb_func_start PowampExtending
PowampExtending: @ 0x0804FA1C
	push {lr}
	ldr r1, _0804FA44 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0804FA30
	ldrb r0, [r1, #0x1c]
	cmp r0, #4
	bne _0804FA30
	ldr r0, _0804FA48 @ =0x0000FF74
	strh r0, [r1, #0xa]
_0804FA30:
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804FA40
	ldr r0, _0804FA44 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x19
	strb r1, [r0]
_0804FA40:
	pop {r0}
	bx r0
	.align 2, 0
_0804FA44: .4byte gCurrentSprite
_0804FA48: .4byte 0x0000FF74

	thumb_func_start PowampExtendedInit
PowampExtendedInit: @ 0x0804FA4C
	ldr r1, _0804FA64 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _0804FA68 @ =0x08386658
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	bx lr
	.align 2, 0
_0804FA64: .4byte gCurrentSprite
_0804FA68: .4byte 0x08386658

	thumb_func_start PowampExtended
PowampExtended: @ 0x0804FA6C
	push {lr}
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r1, #0xc0
	bl CheckSamusNearSpriteAboveBelowSeparateRanges
	cmp r0, #0
	bne _0804FA86
	ldr r0, _0804FA8C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1b
	strb r1, [r0]
_0804FA86:
	pop {r0}
	bx r0
	.align 2, 0
_0804FA8C: .4byte gCurrentSprite

	thumb_func_start PowampRetractingInit
PowampRetractingInit: @ 0x0804FA90
	push {lr}
	ldr r1, _0804FABC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _0804FAC0 @ =0x083866B0
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804FAB6
	ldr r0, _0804FAC4 @ =0x000001CF
	bl SoundPlayNotAlreadyPlaying
_0804FAB6:
	pop {r0}
	bx r0
	.align 2, 0
_0804FABC: .4byte gCurrentSprite
_0804FAC0: .4byte 0x083866B0
_0804FAC4: .4byte 0x000001CF

	thumb_func_start PowampRetracting
PowampRetracting: @ 0x0804FAC8
	push {lr}
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r2, #0
	movs r1, #0xc0
	bl CheckSamusNearSpriteAboveBelowSeparateRanges
	cmp r0, #0
	beq _0804FB00
	ldr r1, _0804FAF4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _0804FAF8 @ =0x08386658
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _0804FAFC @ =0x0000FF74
	strh r0, [r1, #0xa]
	b _0804FB22
	.align 2, 0
_0804FAF4: .4byte gCurrentSprite
_0804FAF8: .4byte 0x08386658
_0804FAFC: .4byte 0x0000FF74
_0804FB00:
	ldr r1, _0804FB28 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #2
	bne _0804FB12
	ldrb r0, [r1, #0x1c]
	cmp r0, #4
	bne _0804FB12
	ldr r0, _0804FB2C @ =0x0000FFCC
	strh r0, [r1, #0xa]
_0804FB12:
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0804FB22
	ldr r0, _0804FB28 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_0804FB22:
	pop {r0}
	bx r0
	.align 2, 0
_0804FB28: .4byte gCurrentSprite
_0804FB2C: .4byte 0x0000FFCC

	thumb_func_start Powamp
Powamp: @ 0x0804FB30
	push {r4, lr}
	ldr r4, _0804FB5C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0804FB4A
	movs r0, #0xe8
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0804FB4A:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804FB60
	bl SpriteUtilUpdateFreezeTimer
	b _0804FD3A
	.align 2, 0
_0804FB5C: .4byte gCurrentSprite
_0804FB60:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _0804FB6C
	b _0804FD3A
_0804FB6C:
	lsls r0, r0, #2
	ldr r1, _0804FB78 @ =_0804FB7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0804FB78: .4byte _0804FB7C
_0804FB7C: @ jump table
	.4byte _0804FCEC @ case 0
	.4byte _0804FCF2 @ case 1
	.4byte _0804FCF6 @ case 2
	.4byte _0804FD3A @ case 3
	.4byte _0804FD3A @ case 4
	.4byte _0804FD3A @ case 5
	.4byte _0804FD3A @ case 6
	.4byte _0804FD3A @ case 7
	.4byte _0804FD3A @ case 8
	.4byte _0804FD3A @ case 9
	.4byte _0804FD3A @ case 10
	.4byte _0804FD3A @ case 11
	.4byte _0804FD3A @ case 12
	.4byte _0804FD3A @ case 13
	.4byte _0804FD3A @ case 14
	.4byte _0804FD3A @ case 15
	.4byte _0804FD3A @ case 16
	.4byte _0804FD3A @ case 17
	.4byte _0804FD3A @ case 18
	.4byte _0804FD3A @ case 19
	.4byte _0804FD3A @ case 20
	.4byte _0804FD3A @ case 21
	.4byte _0804FD3A @ case 22
	.4byte _0804FCFC @ case 23
	.4byte _0804FD00 @ case 24
	.4byte _0804FD06 @ case 25
	.4byte _0804FD0A @ case 26
	.4byte _0804FD10 @ case 27
	.4byte _0804FD14 @ case 28
	.4byte _0804FD3A @ case 29
	.4byte _0804FD3A @ case 30
	.4byte _0804FD3A @ case 31
	.4byte _0804FD3A @ case 32
	.4byte _0804FD3A @ case 33
	.4byte _0804FD3A @ case 34
	.4byte _0804FD3A @ case 35
	.4byte _0804FD3A @ case 36
	.4byte _0804FD3A @ case 37
	.4byte _0804FD3A @ case 38
	.4byte _0804FD3A @ case 39
	.4byte _0804FD3A @ case 40
	.4byte _0804FD3A @ case 41
	.4byte _0804FD3A @ case 42
	.4byte _0804FD3A @ case 43
	.4byte _0804FD3A @ case 44
	.4byte _0804FD3A @ case 45
	.4byte _0804FD3A @ case 46
	.4byte _0804FD3A @ case 47
	.4byte _0804FD3A @ case 48
	.4byte _0804FD3A @ case 49
	.4byte _0804FD3A @ case 50
	.4byte _0804FD3A @ case 51
	.4byte _0804FD3A @ case 52
	.4byte _0804FD3A @ case 53
	.4byte _0804FD3A @ case 54
	.4byte _0804FD3A @ case 55
	.4byte _0804FD3A @ case 56
	.4byte _0804FD3A @ case 57
	.4byte _0804FD3A @ case 58
	.4byte _0804FD3A @ case 59
	.4byte _0804FD3A @ case 60
	.4byte _0804FD3A @ case 61
	.4byte _0804FD3A @ case 62
	.4byte _0804FD3A @ case 63
	.4byte _0804FD3A @ case 64
	.4byte _0804FD3A @ case 65
	.4byte _0804FD3A @ case 66
	.4byte _0804FD3A @ case 67
	.4byte _0804FD3A @ case 68
	.4byte _0804FD3A @ case 69
	.4byte _0804FD3A @ case 70
	.4byte _0804FD3A @ case 71
	.4byte _0804FD3A @ case 72
	.4byte _0804FD3A @ case 73
	.4byte _0804FD3A @ case 74
	.4byte _0804FD3A @ case 75
	.4byte _0804FD3A @ case 76
	.4byte _0804FD3A @ case 77
	.4byte _0804FD3A @ case 78
	.4byte _0804FD3A @ case 79
	.4byte _0804FD3A @ case 80
	.4byte _0804FD3A @ case 81
	.4byte _0804FD3A @ case 82
	.4byte _0804FD3A @ case 83
	.4byte _0804FD3A @ case 84
	.4byte _0804FD3A @ case 85
	.4byte _0804FD3A @ case 86
	.4byte _0804FD1A @ case 87
	.4byte _0804FD1E @ case 88
	.4byte _0804FD24 @ case 89
	.4byte _0804FD28 @ case 90
	.4byte _0804FD2E @ case 91
_0804FCEC:
	bl PowampInit
	b _0804FD3A
_0804FCF2:
	bl PowampIdleInit
_0804FCF6:
	bl PowampIdle
	b _0804FD3A
_0804FCFC:
	bl PowampExtendingInit
_0804FD00:
	bl PowampExtending
	b _0804FD3A
_0804FD06:
	bl PowampExtendedInit
_0804FD0A:
	bl PowampExtended
	b _0804FD3A
_0804FD10:
	bl PowampRetractingInit
_0804FD14:
	bl PowampRetracting
	b _0804FD3A
_0804FD1A:
	bl SpriteDyingInit
_0804FD1E:
	bl SpriteDying
	b _0804FD3A
_0804FD24:
	bl PowampInit
_0804FD28:
	bl SpriteSpawningFromX
	b _0804FD3A
_0804FD2E:
	bl XParasiteInit
	ldr r1, _0804FD40 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x30
	strh r0, [r1, #2]
_0804FD3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD40: .4byte gCurrentSprite

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
	bl SpriteUtilCheckNearEndOfCurrentSpriteAnimation
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

	thumb_func_start SA_XMonsterSyncSubSprites
SA_XMonsterSyncSubSprites: @ 0x080507F4
	push {r4, lr}
	ldr r4, _08050850 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08050854 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08050858 @ =0x0879B458
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _08050826
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_08050826:
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
_08050850: .4byte gSubSpriteData1
_08050854: .4byte gCurrentSprite
_08050858: .4byte 0x0879B458

	thumb_func_start SA_XMonsterProjectilesCollision
SA_XMonsterProjectilesCollision: @ 0x0805085C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r3, _08050930 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08050920
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _08050920
	ldrh r1, [r3, #2]
	ldrh r2, [r3, #4]
	ldrh r0, [r3, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r3, #0xc]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r0, [r3, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r3, #0x10]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r7, #0
_080508AA:
	ldr r1, _08050934 @ =gProjectileData
	lsls r0, r7, #5
	adds r4, r0, r1
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08050916
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08050916
	ldrb r0, [r4, #0xf]
	cmp r0, #4
	bne _08050916
	ldrh r5, [r4, #8]
	ldrh r6, [r4, #0xa]
	ldrh r0, [r4, #0x16]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x18]
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #0x1a]
	adds r2, r6, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r3, [r4, #0x1c]
	adds r3, r6, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov ip, r3
	ldr r3, [sp, #0x10]
	str r3, [sp]
	mov r3, sl
	str r3, [sp, #4]
	mov r3, sb
	str r3, [sp, #8]
	mov r3, r8
	str r3, [sp, #0xc]
	mov r3, ip
	bl CheckObjectsTouching
	cmp r0, #0
	beq _08050916
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
_08050916:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _080508AA
_08050920:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050930: .4byte gCurrentSprite
_08050934: .4byte gProjectileData

	thumb_func_start SA_XMonsterCheckScreaming
SA_XMonsterCheckScreaming: @ 0x08050938
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08050958 @ =gCurrentSprite
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #8
	bne _08050970
	cmp r2, #0
	beq _0805095C
	bl SA_XMonsterScreamingAirborneInit
	b _08050960
	.align 2, 0
_08050958: .4byte gCurrentSprite
_0805095C:
	bl SA_XMonsterScreamingGroundedInit
_08050960:
	ldr r0, _0805096C @ =0x000001E1
	bl SoundPlayNotAlreadyPlaying
	movs r0, #1
	b _08050972
	.align 2, 0
_0805096C: .4byte 0x000001E1
_08050970:
	movs r0, #0
_08050972:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SA_XMonsterXMovement
SA_XMonsterXMovement: @ 0x08050978
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r7, #0xc
	ldr r0, _080509D4 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080509E8
	ldr r6, _080509D8 @ =gSubSpriteData1
	cmp r2, #0
	beq _080509A6
	ldr r1, _080509DC @ =gSamusData
	ldrh r0, [r6, #8]
	ldrh r2, [r1, #0x18]
	cmp r0, r2
	bhs _080509A6
	ldrh r0, [r6, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhi _08050A30
_080509A6:
	ldrh r0, [r6, #8]
	subs r0, #0x20
	ldrh r1, [r6, #0xa]
	adds r1, #0x8c
	bl SpriteUtilCheckCollisionAtPosition
	ldr r4, _080509E0 @ =gPreviousCollisionCheck
	ldrb r0, [r4]
	cmp r0, #0
	beq _080509CE
	ldrh r0, [r6, #8]
	ldr r1, _080509E4 @ =0xFFFFFEE0
	adds r0, r0, r1
	ldrh r1, [r6, #0xa]
	adds r1, #0x8c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r4]
	cmp r0, #0
	bne _08050A30
_080509CE:
	ldrh r0, [r6, #0xa]
	adds r0, r7, r0
	b _08050A2E
	.align 2, 0
_080509D4: .4byte gCurrentSprite
_080509D8: .4byte gSubSpriteData1
_080509DC: .4byte gSamusData
_080509E0: .4byte gPreviousCollisionCheck
_080509E4: .4byte 0xFFFFFEE0
_080509E8:
	ldr r6, _08050A38 @ =gSubSpriteData1
	cmp r2, #0
	beq _08050A00
	ldr r1, _08050A3C @ =gSamusData
	ldrh r0, [r6, #8]
	ldrh r2, [r1, #0x18]
	cmp r0, r2
	bhs _08050A00
	ldrh r0, [r6, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	blo _08050A30
_08050A00:
	adds r4, r6, #0
	ldrh r0, [r4, #8]
	subs r0, #0x20
	ldrh r1, [r4, #0xa]
	subs r1, #0x8c
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08050A40 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08050A2A
	ldrh r0, [r4, #8]
	ldr r1, _08050A44 @ =0xFFFFFEE0
	adds r0, r0, r1
	ldrh r1, [r4, #0xa]
	subs r1, #0x8c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08050A30
_08050A2A:
	ldrh r0, [r6, #0xa]
	subs r0, r0, r7
_08050A2E:
	strh r0, [r6, #0xa]
_08050A30:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050A38: .4byte gSubSpriteData1
_08050A3C: .4byte gSamusData
_08050A40: .4byte gPreviousCollisionCheck
_08050A44: .4byte 0xFFFFFEE0

	thumb_func_start SA_XMonsterSetSideHitboxes
SA_XMonsterSetSideHitboxes: @ 0x08050A48
	push {lr}
	ldr r2, _08050A60 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08050A68
	ldr r0, _08050A64 @ =0x0000FFC0
	strh r0, [r2, #0xe]
	movs r0, #0x80
	b _08050A6E
	.align 2, 0
_08050A60: .4byte gCurrentSprite
_08050A64: .4byte 0x0000FFC0
_08050A68:
	ldr r0, _08050A74 @ =0x0000FF80
	strh r0, [r2, #0xe]
	movs r0, #0x40
_08050A6E:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08050A74: .4byte 0x0000FF80

	thumb_func_start SA_XMonsterFall
SA_XMonsterFall: @ 0x08050A78
	push {r4, r5, r6, lr}
	ldr r0, _08050AA8 @ =gCurrentSprite
	adds r5, r0, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _08050AAC @ =0x08388274
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08050AB0 @ =0x00007FFF
	cmp r1, r0
	bne _08050AB8
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08050AB4 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #8]
	adds r4, r2, #0
	b _08050AC6
	.align 2, 0
_08050AA8: .4byte gCurrentSprite
_08050AAC: .4byte 0x08388274
_08050AB0: .4byte 0x00007FFF
_08050AB4: .4byte gSubSpriteData1
_08050AB8:
	adds r0, r2, #1
	strb r0, [r5]
	ldr r1, _08050AFC @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
	adds r4, r1, #0
_08050AC6:
	ldrh r1, [r4, #8]
	ldr r0, _08050B00 @ =0x0000073E
	cmp r1, r0
	bls _08050AF6
	adds r0, r1, #0
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r0, _08050B04 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08050AF6
	strh r2, [r4, #8]
	ldr r0, _08050B08 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1d
	strb r1, [r0]
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
_08050AF6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050AFC: .4byte gSubSpriteData1
_08050B00: .4byte 0x0000073E
_08050B04: .4byte gPreviousVerticalCollisionCheck
_08050B08: .4byte gCurrentSprite

	thumb_func_start SA_XMonsterSpawningFromX
SA_XMonsterSpawningFromX: @ 0x08050B0C
	push {lr}
	ldr r2, _08050B30 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x26
	movs r3, #1
	strb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	bne _08050B50
	ldrh r0, [r2, #0x12]
	cmp r0, #0xff
	bhi _08050B34
	adds r0, #1
	strh r0, [r2, #0x12]
	b _08050BAC
	.align 2, 0
_08050B30: .4byte gCurrentSprite
_08050B34:
	ldrh r1, [r2]
	ldr r0, _08050B48 @ =0x0000FFF7
	ands r0, r1
	ldr r1, _08050B4C @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x24
	strb r3, [r0]
	b _08050BAC
	.align 2, 0
_08050B48: .4byte 0x0000FFF7
_08050B4C: .4byte 0x00007FFF
_08050B50:
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bhi _08050B90
	ldrb r1, [r1]
	ldr r2, _08050B80 @ =0x040000D4
	ldr r0, _08050B84 @ =sSpritesGraphicsPointers
	movs r3, #0xb1
	lsls r3, r3, #2
	adds r0, r0, r3
	lsls r1, r1, #9
	ldr r0, [r0]
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08050B88 @ =0x06014000
	adds r1, r1, r0
	str r1, [r2, #4]
	ldr r0, _08050B8C @ =0x80000100
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _08050BAC
	.align 2, 0
_08050B80: .4byte 0x040000D4
_08050B84: .4byte sSpritesGraphicsPointers
_08050B88: .4byte 0x06014000
_08050B8C: .4byte 0x80000100
_08050B90:
	cmp r0, #4
	bne _08050BAC
	ldr r1, _08050BB0 @ =0x040000D4
	ldr r0, _08050BB4 @ =sSpritesPalettePointers
	movs r2, #0xb1
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08050BB8 @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _08050BBC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08050BAC:
	pop {r0}
	bx r0
	.align 2, 0
_08050BB0: .4byte 0x040000D4
_08050BB4: .4byte sSpritesPalettePointers
_08050BB8: .4byte 0x05000300
_08050BBC: .4byte 0x80000010

	thumb_func_start SA_XMonsterInit
SA_XMonsterInit: @ 0x08050BC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _08050C6C @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x5a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #5
	strb r0, [r1]
	mov r1, ip
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r2, r1, #0
	movs r4, #0
	orrs r2, r0
	ldr r0, _08050C70 @ =0x0000FFFB
	ands r2, r0
	movs r0, #8
	orrs r2, r0
	orrs r2, r4
	mov r0, ip
	strh r2, [r0]
	movs r0, #0xa8
	mov r1, ip
	strh r0, [r1, #0x12]
	mov r0, ip
	adds r0, #0x2b
	strb r4, [r0]
	adds r1, #0x27
	movs r0, #0x44
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _08050C74 @ =0x0000FEE0
	mov r1, ip
	strh r0, [r1, #0xa]
	strh r3, [r1, #0xc]
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08050C78 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r3, #3
	adds r0, r3, #0
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	strb r3, [r0, #0x1e]
	adds r0, #0x35
	strb r4, [r0]
	ldr r3, _08050C7C @ =sPrimarySpriteStats
	mov r0, ip
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x14]
	ldr r1, _08050C80 @ =gSubSpriteData1
	mov r3, ip
	ldrh r0, [r3, #2]
	strh r0, [r1, #8]
	ldrh r0, [r3, #4]
	strh r0, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r2, r0
	mov r6, ip
	adds r5, r1, #0
	cmp r2, #0
	beq _08050C88
	ldr r0, _08050C84 @ =0x08388FA4
	b _08050C8A
	.align 2, 0
_08050C6C: .4byte gCurrentSprite
_08050C70: .4byte 0x0000FFFB
_08050C74: .4byte 0x0000FEE0
_08050C78: .4byte gIoRegisters
_08050C7C: .4byte sPrimarySpriteStats
_08050C80: .4byte gSubSpriteData1
_08050C84: .4byte 0x08388FA4
_08050C88:
	ldr r0, _08050D8C @ =0x08388F94
_08050C8A:
	str r0, [r5]
	movs r4, #0
	strb r4, [r5, #6]
	strh r4, [r5, #4]
	adds r1, r6, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl SA_XMonsterSetSideHitboxes
	ldrb r2, [r6, #0x1f]
	adds r7, r6, #0
	adds r7, #0x23
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #8
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #9
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r7]
	ldrh r0, [r5, #8]
	str r0, [sp]
	ldrh r0, [r5, #0xa]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6b
	movs r1, #0xa
	bl SpriteSpawnSecondary
	movs r0, #0x9f
	bl unk_3b1c
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08050D8C: .4byte 0x08388F94

	thumb_func_start SA_XMonsterDroppingInit
SA_XMonsterDroppingInit: @ 0x08050D90
	ldr r1, _08050DA4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bx lr
	.align 2, 0
_08050DA4: .4byte gCurrentSprite

	thumb_func_start SA_XMonsterDropping
SA_XMonsterDropping: @ 0x08050DA8
	push {lr}
	bl SA_XMonsterFall
	ldr r0, _08050DC0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _08050DC4
	movs r0, #0
	bl SA_XMonsterCheckScreaming
	b _08050DCA
	.align 2, 0
_08050DC0: .4byte gCurrentSprite
_08050DC4:
	movs r0, #1
	bl SA_XMonsterCheckScreaming
_08050DCA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XMonsterIdleInit
SA_XMonsterIdleInit: @ 0x08050DD0
	push {lr}
	ldr r2, _08050DE8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _08050DF4
	ldr r1, _08050DEC @ =gSubSpriteData1
	ldr r0, _08050DF0 @ =0x08388E7C
	b _08050DF8
	.align 2, 0
_08050DE8: .4byte gCurrentSprite
_08050DEC: .4byte gSubSpriteData1
_08050DF0: .4byte 0x08388E7C
_08050DF4:
	ldr r1, _08050E14 @ =gSubSpriteData1
	ldr r0, _08050E18 @ =0x08388DE4
_08050DF8:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x35
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08050E14: .4byte gSubSpriteData1
_08050E18: .4byte 0x08388DE4

	thumb_func_start SA_XMonsterIdle
SA_XMonsterIdle: @ 0x08050E1C
	push {r4, lr}
	movs r4, #0
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08050E70
	ldr r2, _08050E44 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08050E4C
	ldr r1, _08050E48 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08050E58
	b _08050E5C
	.align 2, 0
_08050E44: .4byte gCurrentSprite
_08050E48: .4byte gSamusData
_08050E4C:
	ldr r1, _08050E64 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _08050E58
	movs r4, #1
_08050E58:
	cmp r4, #0
	beq _08050E68
_08050E5C:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	b _08050E6E
	.align 2, 0
_08050E64: .4byte gSamusData
_08050E68:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
_08050E6E:
	strb r0, [r1]
_08050E70:
	movs r0, #0
	bl SA_XMonsterCheckScreaming
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SA_XMonsterJumpWarningInit
SA_XMonsterJumpWarningInit: @ 0x08050E7C
	push {lr}
	ldr r2, _08050E94 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _08050EA0
	ldr r1, _08050E98 @ =gSubSpriteData1
	ldr r0, _08050E9C @ =0x08388EA4
	b _08050EA4
	.align 2, 0
_08050E94: .4byte gCurrentSprite
_08050E98: .4byte gSubSpriteData1
_08050E9C: .4byte 0x08388EA4
_08050EA0:
	ldr r1, _08050EC0 @ =gSubSpriteData1
	ldr r0, _08050EC4 @ =0x08388E0C
_08050EA4:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x35
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08050EC0: .4byte gSubSpriteData1
_08050EC4: .4byte 0x08388E0C

	thumb_func_start SA_XMonsterJumpWarning
SA_XMonsterJumpWarning: @ 0x08050EC8
	push {lr}
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08050F18
	ldr r2, _08050EE8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08050EF4
	ldr r1, _08050EEC @ =gSubSpriteData1
	ldr r0, _08050EF0 @ =0x08388ECC
	b _08050EF8
	.align 2, 0
_08050EE8: .4byte gCurrentSprite
_08050EEC: .4byte gSubSpriteData1
_08050EF0: .4byte 0x08388ECC
_08050EF4:
	ldr r1, _08050F24 @ =gSubSpriteData1
	ldr r0, _08050F28 @ =0x08388E34
_08050EF8:
	str r0, [r1]
	adds r3, r1, #0
	movs r0, #0
	strb r0, [r3, #6]
	movs r1, #0
	strh r0, [r3, #4]
	adds r0, r2, #0
	adds r0, #0x31
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	movs r0, #0xa0
	bl SoundPlay
_08050F18:
	movs r0, #0
	bl SA_XMonsterCheckScreaming
	pop {r0}
	bx r0
	.align 2, 0
_08050F24: .4byte gSubSpriteData1
_08050F28: .4byte 0x08388E34

	thumb_func_start SA_XMonsterJumping
SA_XMonsterJumping: @ 0x08050F2C
	push {r4, r5, lr}
	ldr r4, _08050F54 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r1, _08050F58 @ =0x08388224
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _08050F5C @ =0x00007FFF
	cmp r1, r0
	bne _08050F60
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	b _08050F74
	.align 2, 0
_08050F54: .4byte gCurrentSprite
_08050F58: .4byte 0x08388224
_08050F5C: .4byte 0x00007FFF
_08050F60:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldr r1, _08050F80 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r3
	strh r0, [r1, #8]
	movs r0, #0
	bl SA_XMonsterXMovement
_08050F74:
	movs r0, #1
	bl SA_XMonsterCheckScreaming
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08050F80: .4byte gSubSpriteData1

	thumb_func_start SA_XMonsterFallingInit
SA_XMonsterFallingInit: @ 0x08050F84
	ldr r1, _08050F98 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1c
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bx lr
	.align 2, 0
_08050F98: .4byte gCurrentSprite

	thumb_func_start SA_XMonsterFalling
SA_XMonsterFalling: @ 0x08050F9C
	push {lr}
	movs r0, #1
	bl SA_XMonsterXMovement
	bl SA_XMonsterFall
	ldr r0, _08050FBC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _08050FC0
	movs r0, #0
	bl SA_XMonsterCheckScreaming
	b _08050FC6
	.align 2, 0
_08050FBC: .4byte gCurrentSprite
_08050FC0:
	movs r0, #1
	bl SA_XMonsterCheckScreaming
_08050FC6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XMonsterLandingInit
SA_XMonsterLandingInit: @ 0x08050FCC
	push {lr}
	ldr r2, _08050FE4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _08050FF0
	ldr r1, _08050FE8 @ =gSubSpriteData1
	ldr r0, _08050FEC @ =0x08388EF4
	b _08050FF4
	.align 2, 0
_08050FE4: .4byte gCurrentSprite
_08050FE8: .4byte gSubSpriteData1
_08050FEC: .4byte 0x08388EF4
_08050FF0:
	ldr r1, _08051018 @ =gSubSpriteData1
	ldr r0, _0805101C @ =0x08388E5C
_08050FF4:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x35
	strb r2, [r0]
	movs r0, #0xa1
	bl unk_3b1c
	pop {r0}
	bx r0
	.align 2, 0
_08051018: .4byte gSubSpriteData1
_0805101C: .4byte 0x08388E5C

	thumb_func_start SA_XMonsterLanding
SA_XMonsterLanding: @ 0x08051020
	push {r4, lr}
	movs r4, #0
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08051074
	ldr r2, _08051048 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051050
	ldr r1, _0805104C @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0805105C
	b _08051060
	.align 2, 0
_08051048: .4byte gCurrentSprite
_0805104C: .4byte gSamusData
_08051050:
	ldr r1, _08051068 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _0805105C
	movs r4, #1
_0805105C:
	cmp r4, #0
	beq _0805106C
_08051060:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	b _08051072
	.align 2, 0
_08051068: .4byte gSamusData
_0805106C:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
_08051072:
	strb r0, [r1]
_08051074:
	movs r0, #0
	bl SA_XMonsterCheckScreaming
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SA_XMonsterTurningAroundInit
SA_XMonsterTurningAroundInit: @ 0x08051080
	push {lr}
	ldr r2, _08051098 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _080510A4
	ldr r1, _0805109C @ =gSubSpriteData1
	ldr r0, _080510A0 @ =0x08388F24
	b _080510A8
	.align 2, 0
_08051098: .4byte gCurrentSprite
_0805109C: .4byte gSubSpriteData1
_080510A0: .4byte 0x08388F24
_080510A4:
	ldr r1, _080510C4 @ =gSubSpriteData1
	ldr r0, _080510C8 @ =0x08388F14
_080510A8:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x35
	strb r2, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080510C4: .4byte gSubSpriteData1
_080510C8: .4byte 0x08388F14

	thumb_func_start SA_XMonsterTurningAround
SA_XMonsterTurningAround: @ 0x080510CC
	push {lr}
	ldr r2, _08051104 @ =gCurrentSprite
	ldrh r0, [r2, #0x16]
	cmp r0, #2
	bne _080510EC
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _080510EC
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	bl SA_XMonsterSetSideHitboxes
_080510EC:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _080510F8
	bl SA_XMonsterJumpWarningInit
_080510F8:
	movs r0, #0
	bl SA_XMonsterCheckScreaming
	pop {r0}
	bx r0
	.align 2, 0
_08051104: .4byte gCurrentSprite

	thumb_func_start SA_XMonsterScreamingAirborneInit
SA_XMonsterScreamingAirborneInit: @ 0x08051108
	push {lr}
	ldr r2, _08051120 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _0805112C
	ldr r1, _08051124 @ =gSubSpriteData1
	ldr r0, _08051128 @ =0x08388F84
	b _08051130
	.align 2, 0
_08051120: .4byte gCurrentSprite
_08051124: .4byte gSubSpriteData1
_08051128: .4byte 0x08388F84
_0805112C:
	ldr r1, _08051154 @ =gSubSpriteData1
	ldr r0, _08051158 @ =0x08388F74
_08051130:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	adds r1, #0x11
	movs r0, #1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08051154: .4byte gSubSpriteData1
_08051158: .4byte 0x08388F74

	thumb_func_start SA_XMonsterScreamingAirborne
SA_XMonsterScreamingAirborne: @ 0x0805115C
	push {lr}
	movs r0, #0
	bl SA_XMonsterXMovement
	bl SA_XMonsterFall
	ldr r1, _0805118C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _080511C4
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	bne _080511C4
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051198
	ldr r1, _08051190 @ =gSubSpriteData1
	ldr r0, _08051194 @ =0x08388F44
	b _0805119C
	.align 2, 0
_0805118C: .4byte gCurrentSprite
_08051190: .4byte gSubSpriteData1
_08051194: .4byte 0x08388F44
_08051198:
	ldr r1, _080511B8 @ =gSubSpriteData1
	ldr r0, _080511BC @ =0x08388F34
_0805119C:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _080511C0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x3c
	strb r1, [r2]
	adds r0, #0x25
	strb r3, [r0]
	b _080511D8
	.align 2, 0
_080511B8: .4byte gSubSpriteData1
_080511BC: .4byte 0x08388F34
_080511C0: .4byte gCurrentSprite
_080511C4:
	ldr r1, _080511DC @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _080511D8
	ldrb r0, [r1, #0x1c]
	cmp r0, #2
	bne _080511D8
	movs r0, #0xa6
	bl SoundPlay
_080511D8:
	pop {r0}
	bx r0
	.align 2, 0
_080511DC: .4byte gCurrentSprite

	thumb_func_start SA_XMonsterScreamingGroundedInit
SA_XMonsterScreamingGroundedInit: @ 0x080511E0
	push {lr}
	ldr r2, _080511F8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051204
	ldr r1, _080511FC @ =gSubSpriteData1
	ldr r0, _08051200 @ =0x08388F44
	b _08051208
	.align 2, 0
_080511F8: .4byte gCurrentSprite
_080511FC: .4byte gSubSpriteData1
_08051200: .4byte 0x08388F44
_08051204:
	ldr r1, _08051224 @ =gSubSpriteData1
	ldr r0, _08051228 @ =0x08388F34
_08051208:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0x11
	movs r0, #1
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08051224: .4byte gSubSpriteData1
_08051228: .4byte 0x08388F34

	thumb_func_start SA_XMonsterScreamingGrounded
SA_XMonsterScreamingGrounded: @ 0x0805122C
	push {r4, lr}
	movs r4, #0
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _08051292
	ldr r2, _08051250 @ =gCurrentSprite
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	bne _08051254
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x3c
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	b _080512A6
	.align 2, 0
_08051250: .4byte gCurrentSprite
_08051254:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051270
	ldr r1, _0805126C @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0805127C
	b _08051280
	.align 2, 0
_0805126C: .4byte gSamusData
_08051270:
	ldr r1, _08051288 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _0805127C
	movs r4, #1
_0805127C:
	cmp r4, #0
	beq _0805128C
_08051280:
	bl SA_XMonsterTurningAroundInit
	b _080512A6
	.align 2, 0
_08051288: .4byte gSamusData
_0805128C:
	bl SA_XMonsterJumpWarningInit
	b _080512A6
_08051292:
	ldr r1, _080512AC @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _080512A6
	ldrb r0, [r1, #0x1c]
	cmp r0, #2
	bne _080512A6
	movs r0, #0xa6
	bl SoundPlay
_080512A6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080512AC: .4byte gCurrentSprite

	thumb_func_start SA_XMonsterPanting
SA_XMonsterPanting: @ 0x080512B0
	push {r4, lr}
	ldr r1, _08051304 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _080512CE
	ldrb r0, [r1, #0x1c]
	cmp r0, #2
	bne _080512CE
	movs r0, #0xa8
	bl unk_3b1c
_080512CE:
	ldr r4, _08051304 @ =gCurrentSprite
	ldrh r0, [r4, #4]
	lsrs r0, r0, #2
	ldr r1, _08051308 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _0805130C @ =0xFFE70000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xbe
	bhi _0805133A
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805133A
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051318
	ldr r1, _08051310 @ =gSubSpriteData1
	ldr r0, _08051314 @ =0x08388F64
	b _0805131C
	.align 2, 0
_08051304: .4byte gCurrentSprite
_08051308: .4byte gBg1XPosition
_0805130C: .4byte 0xFFE70000
_08051310: .4byte gSubSpriteData1
_08051314: .4byte 0x08388F64
_08051318:
	ldr r1, _08051340 @ =gSubSpriteData1
	ldr r0, _08051344 @ =0x08388F54
_0805131C:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08051348 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3e
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0xa0
	strb r0, [r1]
	movs r0, #0xa7
	bl unk_3b1c
_0805133A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051340: .4byte gSubSpriteData1
_08051344: .4byte 0x08388F54
_08051348: .4byte gCurrentSprite

	thumb_func_start SA_XMonsterDying
SA_XMonsterDying: @ 0x0805134C
	push {lr}
	ldr r3, _08051388 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08051382
	subs r1, #0xa
	movs r0, #0x40
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r2, _0805138C @ =0x00008020
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #0x2c
	strh r0, [r3, #6]
_08051382:
	pop {r0}
	bx r0
	.align 2, 0
_08051388: .4byte gCurrentSprite
_0805138C: .4byte 0x00008020

	thumb_func_start SA_XMonsterTurningIntoCoreX
SA_XMonsterTurningIntoCoreX: @ 0x08051390
	push {r4, lr}
	ldr r4, _080513F0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r2, _080513F4 @ =gWrittenToMosaic_H
	ldr r1, _080513F8 @ =sXParasiteMosaicValues
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _08051410
	ldrh r2, [r4, #6]
	movs r0, #0xc2
	movs r1, #0
	bl SpriteLoadGfx
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0805141E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	movs r0, #0xc2
	strb r0, [r4, #0x1d]
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	movs r1, #0
	orrs r0, r1
	strh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080513FC
	ldrh r0, [r4, #4]
	adds r0, #0x50
	b _08051400
	.align 2, 0
_080513F0: .4byte gCurrentSprite
_080513F4: .4byte gWrittenToMosaic_H
_080513F8: .4byte sXParasiteMosaicValues
_080513FC:
	ldrh r0, [r4, #4]
	subs r0, #0x50
_08051400:
	strh r0, [r4, #4]
	ldr r1, _0805140C @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x50
	strh r0, [r1, #2]
	b _0805141E
	.align 2, 0
_0805140C: .4byte gCurrentSprite
_08051410:
	cmp r0, #0x14
	bne _0805141E
	movs r0, #0xc2
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0805141E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SA_XMonsterPartInit
SA_XMonsterPartInit: @ 0x08051424
	push {lr}
	ldr r3, _08051470 @ =gCurrentSprite
	ldrh r1, [r3]
	ldr r0, _08051474 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x44
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x40
	strb r0, [r1]
	ldr r1, _08051478 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrb r0, [r3, #0x1e]
	adds r2, r3, #0
	cmp r0, #6
	bhi _0805147C
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #4
	b _08051482
	.align 2, 0
_08051470: .4byte gCurrentSprite
_08051474: .4byte 0x0000FFFB
_08051478: .4byte 0x0000FFFC
_0805147C:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #5
_08051482:
	strb r0, [r1]
	adds r3, r2, #0
	ldr r0, _080514B4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	ldrb r0, [r3, #0x1e]
	cmp r0, #2
	beq _0805149E
	cmp r0, #0xa
	bne _080514AC
_0805149E:
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x30
	strb r0, [r1]
_080514AC:
	bl SA_XMonsterSyncSubSprites
	pop {r0}
	bx r0
	.align 2, 0
_080514B4: .4byte gIoRegisters

	thumb_func_start SA_XMonsterPartIdle
SA_XMonsterPartIdle: @ 0x080514B8
	push {lr}
	ldr r3, _080514E4 @ =gSpriteData
	ldr r2, _080514E8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _080514F4
	cmp r0, #0x3a
	bgt _080514EC
	cmp r0, #4
	beq _080514F4
	cmp r0, #0x38
	beq _080514F4
	b _08051504
	.align 2, 0
_080514E4: .4byte gSpriteData
_080514E8: .4byte gCurrentSprite
_080514EC:
	cmp r0, #0x3c
	beq _080514FE
	cmp r0, #0x5a
	bne _08051504
_080514F4:
	ldrh r1, [r2]
	movs r0, #4
	orrs r0, r1
	strh r0, [r2]
	b _080515A8
_080514FE:
	movs r0, #0
	strh r0, [r2]
	b _080515A8
_08051504:
	adds r1, r2, #0
	ldrh r0, [r1]
	ldr r3, _0805154C @ =0x0000FFFB
	ands r3, r0
	strh r3, [r1]
	ldrb r0, [r1, #0x1e]
	cmp r0, #4
	bne _080515A8
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _080515A8
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _080515A8
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	cmp r0, #0
	beq _08051560
	ldr r1, [r1, #0x18]
	ldr r0, _08051550 @ =0x0838FE68
	cmp r1, r0
	beq _08051568
	ldr r0, _08051554 @ =0x0838FED0
	cmp r1, r0
	beq _0805157A
	ldr r0, _08051558 @ =0x0838FF98
	cmp r1, r0
	beq _0805158E
	ldr r0, _0805155C @ =0x083902B8
	cmp r1, r0
	bne _080515A8
	movs r0, #0xa5
	bl SoundPlay
	b _080515A8
	.align 2, 0
_0805154C: .4byte 0x0000FFFB
_08051550: .4byte 0x0838FE68
_08051554: .4byte 0x0838FED0
_08051558: .4byte 0x0838FF98
_0805155C: .4byte 0x083902B8
_08051560:
	ldr r1, [r2, #0x18]
	ldr r0, _08051570 @ =0x0838F9B0
	cmp r1, r0
	bne _08051574
_08051568:
	movs r0, #0xa2
	bl SoundPlay
	b _080515A8
	.align 2, 0
_08051570: .4byte 0x0838F9B0
_08051574:
	ldr r0, _08051584 @ =0x0838FA18
	cmp r1, r0
	bne _08051588
_0805157A:
	movs r0, #0xa3
	bl SoundPlay
	b _080515A8
	.align 2, 0
_08051584: .4byte 0x0838FA18
_08051588:
	ldr r0, _08051598 @ =0x0838FAE0
	cmp r1, r0
	bne _0805159C
_0805158E:
	movs r0, #0xa4
	bl SoundPlay
	b _080515A8
	.align 2, 0
_08051598: .4byte 0x0838FAE0
_0805159C:
	ldr r0, _080515AC @ =0x0838FB08
	cmp r1, r0
	bne _080515A8
	movs r0, #0xa5
	bl SoundPlay
_080515A8:
	pop {r0}
	bx r0
	.align 2, 0
_080515AC: .4byte 0x0838FB08

	thumb_func_start SA_XMonster
SA_XMonster: @ 0x080515B0
	push {lr}
	bl SA_XMonsterProjectilesCollision
	ldr r0, _080515CC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bls _080515C2
	b _080517B8
_080515C2:
	lsls r0, r0, #2
	ldr r1, _080515D0 @ =_080515D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080515CC: .4byte gCurrentSprite
_080515D0: .4byte _080515D4
_080515D4: @ jump table
	.4byte _08051740 @ case 0
	.4byte _08051756 @ case 1
	.4byte _0805175A @ case 2
	.4byte _08051784 @ case 3
	.4byte _0805178A @ case 4
	.4byte _080517B8 @ case 5
	.4byte _080517B8 @ case 6
	.4byte _080517B8 @ case 7
	.4byte _080517B8 @ case 8
	.4byte _080517B8 @ case 9
	.4byte _080517B8 @ case 10
	.4byte _080517B8 @ case 11
	.4byte _080517B8 @ case 12
	.4byte _080517B8 @ case 13
	.4byte _080517B8 @ case 14
	.4byte _080517B8 @ case 15
	.4byte _080517B8 @ case 16
	.4byte _080517B8 @ case 17
	.4byte _080517B8 @ case 18
	.4byte _080517B8 @ case 19
	.4byte _080517B8 @ case 20
	.4byte _0805174C @ case 21
	.4byte _08051750 @ case 22
	.4byte _08051760 @ case 23
	.4byte _08051764 @ case 24
	.4byte _080517B8 @ case 25
	.4byte _0805176A @ case 26
	.4byte _08051770 @ case 27
	.4byte _08051774 @ case 28
	.4byte _0805177A @ case 29
	.4byte _0805177E @ case 30
	.4byte _080517B8 @ case 31
	.4byte _080517B8 @ case 32
	.4byte _080517B8 @ case 33
	.4byte _080517B8 @ case 34
	.4byte _080517B8 @ case 35
	.4byte _080517B8 @ case 36
	.4byte _080517B8 @ case 37
	.4byte _080517B8 @ case 38
	.4byte _080517B8 @ case 39
	.4byte _080517B8 @ case 40
	.4byte _080517B8 @ case 41
	.4byte _080517B8 @ case 42
	.4byte _080517B8 @ case 43
	.4byte _080517B8 @ case 44
	.4byte _080517B8 @ case 45
	.4byte _080517B8 @ case 46
	.4byte _080517B8 @ case 47
	.4byte _080517B8 @ case 48
	.4byte _080517B8 @ case 49
	.4byte _080517B8 @ case 50
	.4byte _080517B8 @ case 51
	.4byte _080517B8 @ case 52
	.4byte _080517B8 @ case 53
	.4byte _080517B8 @ case 54
	.4byte _08051790 @ case 55
	.4byte _08051796 @ case 56
	.4byte _0805179C @ case 57
	.4byte _080517A2 @ case 58
	.4byte _080517B8 @ case 59
	.4byte _080517A8 @ case 60
	.4byte _080517B8 @ case 61
	.4byte _080517AE @ case 62
	.4byte _080517B8 @ case 63
	.4byte _080517B4 @ case 64
	.4byte _080517B8 @ case 65
	.4byte _080517B8 @ case 66
	.4byte _080517B8 @ case 67
	.4byte _080517B8 @ case 68
	.4byte _080517B8 @ case 69
	.4byte _080517B8 @ case 70
	.4byte _080517B8 @ case 71
	.4byte _080517B8 @ case 72
	.4byte _080517B8 @ case 73
	.4byte _080517B8 @ case 74
	.4byte _080517B8 @ case 75
	.4byte _080517B8 @ case 76
	.4byte _080517B8 @ case 77
	.4byte _080517B8 @ case 78
	.4byte _080517B8 @ case 79
	.4byte _080517B8 @ case 80
	.4byte _080517B8 @ case 81
	.4byte _080517B8 @ case 82
	.4byte _080517B8 @ case 83
	.4byte _080517B8 @ case 84
	.4byte _080517B8 @ case 85
	.4byte _080517B8 @ case 86
	.4byte _080517B8 @ case 87
	.4byte _080517B8 @ case 88
	.4byte _080517B8 @ case 89
	.4byte _08051746 @ case 90
_08051740:
	bl SA_XMonsterInit
	b _080517B8
_08051746:
	bl SA_XMonsterSpawningFromX
	b _080517B8
_0805174C:
	bl SA_XMonsterDroppingInit
_08051750:
	bl SA_XMonsterDropping
	b _080517B8
_08051756:
	bl SA_XMonsterIdleInit
_0805175A:
	bl SA_XMonsterIdle
	b _080517B8
_08051760:
	bl SA_XMonsterJumpWarningInit
_08051764:
	bl SA_XMonsterJumpWarning
	b _080517B8
_0805176A:
	bl SA_XMonsterJumping
	b _080517B8
_08051770:
	bl SA_XMonsterFallingInit
_08051774:
	bl SA_XMonsterFalling
	b _080517B8
_0805177A:
	bl SA_XMonsterLandingInit
_0805177E:
	bl SA_XMonsterLanding
	b _080517B8
_08051784:
	bl SA_XMonsterTurningAroundInit
	b _080517B8
_0805178A:
	bl SA_XMonsterTurningAround
	b _080517B8
_08051790:
	bl SA_XMonsterScreamingGroundedInit
	b _080517B8
_08051796:
	bl SA_XMonsterScreamingGrounded
	b _080517B8
_0805179C:
	bl SA_XMonsterScreamingAirborneInit
	b _080517B8
_080517A2:
	bl SA_XMonsterScreamingAirborne
	b _080517B8
_080517A8:
	bl SA_XMonsterPanting
	b _080517B8
_080517AE:
	bl SA_XMonsterDying
	b _080517B8
_080517B4:
	bl SA_XMonsterTurningIntoCoreX
_080517B8:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl SA_XMonsterSyncSubSprites
	pop {r0}
	bx r0

	thumb_func_start SA_XMonsterPart
SA_XMonsterPart: @ 0x080517C4
	push {lr}
	ldr r0, _080517D8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _080517DC
	bl SA_XMonsterPartInit
	b _080517E4
	.align 2, 0
_080517D8: .4byte gCurrentSprite
_080517DC:
	bl SA_XMonsterPartIdle
	bl SA_XMonsterSyncSubSprites
_080517E4:
	pop {r0}
	bx r0

	thumb_func_start ContinualXSpawnerIdle
ContinualXSpawnerIdle: @ 0x080517E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r0, _08051804 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r5, #3
	ands r5, r0
	cmp r5, #0
	bne _0805180C
	movs r6, #1
	ldr r0, _08051808 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r4, r0, #3
	movs r7, #0
	b _08051846
	.align 2, 0
_08051804: .4byte gFrameCounter8Bit
_08051808: .4byte gSpriteRandomNumber
_0805180C:
	cmp r5, #1
	bne _08051820
	movs r6, #0xee
	ldr r0, _0805181C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r4, r0, #3
	movs r7, #1
	b _08051846
	.align 2, 0
_0805181C: .4byte gSpriteRandomNumber
_08051820:
	cmp r5, #2
	bne _0805183C
	movs r4, #1
	ldr r0, _08051830 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r6, r0, #4
	movs r7, #2
	b _08051846
	.align 2, 0
_08051830: .4byte gSpriteRandomNumber
_08051834:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _080518A8
_0805183C:
	movs r4, #0x9e
	ldr r0, _080518C0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r6, r0, #4
	movs r7, #3
_08051846:
	lsls r0, r4, #0x12
	lsls r1, r6, #0x12
	ldr r2, _080518C4 @ =gCurrentSprite
	ldr r3, _080518C8 @ =gBg1YPosition
	lsrs r0, r0, #0x10
	ldrh r3, [r3]
	adds r0, r0, r3
	strh r0, [r2, #2]
	ldr r0, _080518CC @ =gBg1XPosition
	lsrs r1, r1, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #4]
	ldrh r4, [r2, #2]
	ldrh r6, [r2, #4]
	movs r5, #0
	movs r3, #0
	ldr r0, _080518D0 @ =gSpriteData
	mov ip, r0
_0805186C:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	mov r1, ip
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805189E
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805189E
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	beq _0805189E
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051834
_0805189E:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0805186C
_080518A8:
	cmp r5, #0
	beq _08051914
	bl CountPrimarySpritesThatCantAbsorbX
	cmp r0, #3
	bgt _08051914
	cmp r7, #0
	bne _080518D4
	adds r0, r6, #0
	subs r0, #0x40
	b _080518DC
	.align 2, 0
_080518C0: .4byte gSpriteRandomNumber
_080518C4: .4byte gCurrentSprite
_080518C8: .4byte gBg1YPosition
_080518CC: .4byte gBg1XPosition
_080518D0: .4byte gSpriteData
_080518D4:
	cmp r7, #1
	bne _080518E2
	adds r0, r6, #0
	adds r0, #0x40
_080518DC:
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	b _080518F4
_080518E2:
	cmp r7, #2
	bne _080518EC
	adds r0, r4, #0
	subs r0, #0x40
	b _080518F0
_080518EC:
	adds r0, r4, #0
	adds r0, #0x40
_080518F0:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080518F4:
	ldr r0, _0805191C @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r3, [r1]
	adds r0, #0x2a
	ldrb r0, [r0]
	str r0, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
_08051914:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805191C: .4byte gCurrentSprite

	thumb_func_start ContinualXSpawner
ContinualXSpawner: @ 0x08051920
	push {r4, lr}
	ldr r2, _0805193C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	adds r4, r2, #0
	adds r4, #0x24
	ldrb r3, [r4]
	cmp r3, #0
	beq _08051940
	cmp r3, #2
	beq _080519A0
	b _080519A4
	.align 2, 0
_0805193C: .4byte gCurrentSprite
_08051940:
	adds r0, r2, #0
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #2
	strb r0, [r4]
	adds r0, r2, #0
	adds r0, #0x27
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r4, #0
	ldr r1, _08051990 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _08051994 @ =0x08337FA4
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldr r0, _08051998 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, _0805199C @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	bne _080519A4
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
	b _080519A4
	.align 2, 0
_08051990: .4byte 0x0000FFFC
_08051994: .4byte 0x08337FA4
_08051998: .4byte gIoRegisters
_0805199C: .4byte gDebugFlag
_080519A0:
	bl ContinualXSpawnerIdle
_080519A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Box2SyncSubSprites
Box2SyncSubSprites: @ 0x080519AC
	push {r4, lr}
	ldr r4, _08051A08 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08051A0C @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08051A10 @ =0x0879B560
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _080519DE
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_080519DE:
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
_08051A08: .4byte gSubSpriteData1
_08051A0C: .4byte gCurrentSprite
_08051A10: .4byte 0x0879B560

	thumb_func_start Box2XMovement
Box2XMovement: @ 0x08051A14
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
	ldr r6, _08051A60 @ =gCurrentSprite
	ldrh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051A72
	ldr r4, _08051A64 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	adds r1, #0x6e
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08051A68 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051A6C
	adds r0, r6, #0
	adds r0, #0x24
	strb r5, [r0]
	movs r1, #1
	mov r8, r1
	b _08051AA8
	.align 2, 0
_08051A60: .4byte gCurrentSprite
_08051A64: .4byte gSubSpriteData1
_08051A68: .4byte gPreviousCollisionCheck
_08051A6C:
	ldrh r0, [r4, #0xa]
	adds r0, r7, r0
	b _08051AA6
_08051A72:
	ldr r4, _08051A98 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	subs r1, #0x6e
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08051A9C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051AA0
	adds r0, r6, #0
	adds r0, #0x24
	mov r1, sb
	strb r1, [r0]
	movs r0, #1
	mov r8, r0
	b _08051AA8
	.align 2, 0
_08051A98: .4byte gSubSpriteData1
_08051A9C: .4byte gPreviousCollisionCheck
_08051AA0:
	ldrh r0, [r4, #0xa]
	mov r1, sl
	subs r0, r0, r1
_08051AA6:
	strh r0, [r4, #0xa]
_08051AA8:
	mov r0, r8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start Box2Init
Box2Init: @ 0x08051AB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _08051AD4 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _08051ADC
	ldr r1, _08051AD8 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _08051C82
	.align 2, 0
_08051AD4: .4byte gEquipment
_08051AD8: .4byte gCurrentSprite
_08051ADC:
	ldr r6, _08051C8C @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x25
	strb r7, [r0]
	ldrh r0, [r6]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r3, r1, #0
	movs r5, #0
	orrs r3, r0
	strh r3, [r6]
	adds r0, r6, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _08051C90 @ =0x0000FFD8
	strh r0, [r6, #0xa]
	movs r0, #0x40
	strh r0, [r6, #0xc]
	ldr r0, _08051C94 @ =0x0000FFD0
	strh r0, [r6, #0xe]
	movs r0, #0x30
	strh r0, [r6, #0x10]
	adds r0, r6, #0
	adds r0, #0x2d
	movs r1, #7
	strb r1, [r0]
	adds r2, r6, #0
	adds r2, #0x22
	movs r0, #0xc
	strb r0, [r2]
	adds r2, #0x13
	movs r0, #2
	strb r0, [r2]
	strb r1, [r6, #0x1e]
	ldr r2, _08051C98 @ =sPrimarySpriteStats
	ldrb r1, [r6, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r6, #0x14]
	adds r2, r6, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08051C9C @ =0x08395658
	str r0, [r6, #0x18]
	strb r5, [r6, #0x1c]
	strh r7, [r6, #0x16]
	ldr r4, _08051CA0 @ =gSubSpriteData1
	ldrh r0, [r6, #2]
	strh r0, [r4, #8]
	ldrh r0, [r6, #4]
	strh r0, [r4, #0xa]
	ldr r0, _08051CA4 @ =0x0839126C
	str r0, [r4]
	strb r5, [r4, #6]
	strh r7, [r4, #4]
	strb r5, [r4, #0xe]
	adds r0, r6, #0
	adds r0, #0x2f
	strb r5, [r0]
	ldr r0, _08051CA8 @ =0x0000FDFF
	ands r3, r0
	strh r3, [r6]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	ldrb r2, [r6, #0x1f]
	adds r5, r6, #0
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #8
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #9
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #0xa
	bl SpriteSpawnSecondary
	ldrb r2, [r6, #0x1f]
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x6c
	movs r1, #0xb
	bl SpriteSpawnSecondary
	ldrb r1, [r6, #0x1e]
	ldrh r0, [r6, #2]
	str r0, [sp]
	ldrh r0, [r6, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0xc5
	movs r2, #7
	movs r3, #0x10
	bl SpriteSpawnPrimary
_08051C82:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051C8C: .4byte gCurrentSprite
_08051C90: .4byte 0x0000FFD8
_08051C94: .4byte 0x0000FFD0
_08051C98: .4byte sPrimarySpriteStats
_08051C9C: .4byte 0x08395658
_08051CA0: .4byte gSubSpriteData1
_08051CA4: .4byte 0x0839126C
_08051CA8: .4byte 0x0000FDFF

	thumb_func_start Box2WaitingToRunInit
Box2WaitingToRunInit: @ 0x08051CAC
	push {lr}
	ldr r1, _08051CD4 @ =gSubSpriteData1
	ldr r0, _08051CD8 @ =0x083913DC
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _08051CDC @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x18
	strb r1, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	ldr r0, _08051CE0 @ =0x0000026A
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08051CD4: .4byte gSubSpriteData1
_08051CD8: .4byte 0x083913DC
_08051CDC: .4byte gCurrentSprite
_08051CE0: .4byte 0x0000026A

	thumb_func_start Box2WaitingToRun
Box2WaitingToRun: @ 0x08051CE4
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08051D08
	ldr r1, _08051D20 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08051D08
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
_08051D08:
	ldr r1, _08051D20 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051D1A
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_08051D1A:
	pop {r0}
	bx r0
	.align 2, 0
_08051D20: .4byte gCurrentSprite

	thumb_func_start Box2SlowRunningInit
Box2SlowRunningInit: @ 0x08051D24
	push {lr}
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r0, _08051D40 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051D4C
	ldr r1, _08051D44 @ =gSubSpriteData1
	ldr r0, _08051D48 @ =0x08391354
	b _08051D50
	.align 2, 0
_08051D40: .4byte gCurrentSprite
_08051D44: .4byte gSubSpriteData1
_08051D48: .4byte 0x08391354
_08051D4C:
	ldr r1, _08051D6C @ =gSubSpriteData1
	ldr r0, _08051D70 @ =0x083912C4
_08051D50:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _08051D74 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x1a
	strb r1, [r2]
	adds r0, #0x2e
	strb r3, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08051D6C: .4byte gSubSpriteData1
_08051D70: .4byte 0x083912C4
_08051D74: .4byte gCurrentSprite

	thumb_func_start Box2SlowRunning
Box2SlowRunning: @ 0x08051D78
	push {r4, r5, lr}
	ldr r4, _08051DAC @ =gSubSpriteData1
	ldr r0, [r4, #4]
	ldr r1, _08051DB0 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _08051DB4 @ =0x00010003
	cmp r0, r1
	bne _08051DCE
	ldr r0, _08051DB8 @ =0x00000279
	bl SoundPlay
	ldr r0, _08051DBC @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051DC0
	ldrh r0, [r4, #8]
	subs r0, #0x28
	ldrh r1, [r4, #0xa]
	adds r1, #0x78
	movs r2, #0x38
	bl ParticleSet
	b _08051DCE
	.align 2, 0
_08051DAC: .4byte gSubSpriteData1
_08051DB0: .4byte 0x00FFFFFF
_08051DB4: .4byte 0x00010003
_08051DB8: .4byte 0x00000279
_08051DBC: .4byte gCurrentSprite
_08051DC0:
	ldrh r0, [r4, #8]
	subs r0, #0x28
	ldrh r1, [r4, #0xa]
	subs r1, #0x78
	movs r2, #0x38
	bl ParticleSet
_08051DCE:
	ldr r5, _08051E18 @ =gCurrentSprite
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	movs r1, #0x37
	bl Box2XMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08051E12
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08051E00
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _08051E00
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
_08051E00:
	ldr r1, _08051E18 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051E12
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_08051E12:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051E18: .4byte gCurrentSprite

	thumb_func_start Box2FastRunningInit
Box2FastRunningInit: @ 0x08051E1C
	push {lr}
	ldr r2, _08051E34 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051E40
	ldr r1, _08051E38 @ =gSubSpriteData1
	ldr r0, _08051E3C @ =0x08391384
	b _08051E44
	.align 2, 0
_08051E34: .4byte gCurrentSprite
_08051E38: .4byte gSubSpriteData1
_08051E3C: .4byte 0x08391384
_08051E40:
	ldr r1, _08051E60 @ =gSubSpriteData1
	ldr r0, _08051E64 @ =0x083912F4
_08051E44:
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
_08051E60: .4byte gSubSpriteData1
_08051E64: .4byte 0x083912F4

	thumb_func_start Box2FastRunning
Box2FastRunning: @ 0x08051E68
	push {r4, lr}
	ldr r4, _08051E9C @ =gSubSpriteData1
	ldr r0, [r4, #4]
	ldr r1, _08051EA0 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _08051EA4 @ =0x00010003
	cmp r0, r1
	bne _08051EBE
	ldr r0, _08051EA8 @ =0x00000279
	bl SoundPlay
	ldr r0, _08051EAC @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051EB0
	ldrh r0, [r4, #8]
	subs r0, #0x3c
	ldrh r1, [r4, #0xa]
	adds r1, #0xa0
	movs r2, #0x38
	bl ParticleSet
	b _08051EBE
	.align 2, 0
_08051E9C: .4byte gSubSpriteData1
_08051EA0: .4byte 0x00FFFFFF
_08051EA4: .4byte 0x00010003
_08051EA8: .4byte 0x00000279
_08051EAC: .4byte gCurrentSprite
_08051EB0:
	ldrh r0, [r4, #8]
	subs r0, #0x3c
	ldrh r1, [r4, #0xa]
	subs r1, #0xa0
	movs r2, #0x38
	bl ParticleSet
_08051EBE:
	movs r0, #8
	movs r1, #0x37
	bl Box2XMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08051F1A
	ldr r2, _08051EDC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08051EE0
	subs r0, #1
	b _08051F2A
	.align 2, 0
_08051EDC: .4byte gCurrentSprite
_08051EE0:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051F04
	ldr r0, _08051EFC @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	subs r0, #0xc8
	ldr r1, _08051F00 @ =gSamusData
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	ble _08051F1A
	b _08051F12
	.align 2, 0
_08051EFC: .4byte gSubSpriteData1
_08051F00: .4byte gSamusData
_08051F04:
	ldr r0, _08051F34 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	adds r0, #0xc8
	ldr r1, _08051F38 @ =gSamusData
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bge _08051F1A
_08051F12:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
_08051F1A:
	ldr r1, _08051F3C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051F2C
	adds r1, #0x24
	movs r0, #0x3b
_08051F2A:
	strb r0, [r1]
_08051F2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051F34: .4byte gSubSpriteData1
_08051F38: .4byte gSamusData
_08051F3C: .4byte gCurrentSprite

	thumb_func_start Box2SkiddingInit
Box2SkiddingInit: @ 0x08051F40
	push {lr}
	ldr r2, _08051F58 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08051F64
	ldr r1, _08051F5C @ =gSubSpriteData1
	ldr r0, _08051F60 @ =0x08391444
	b _08051F68
	.align 2, 0
_08051F58: .4byte gCurrentSprite
_08051F5C: .4byte gSubSpriteData1
_08051F60: .4byte 0x08391444
_08051F64:
	ldr r1, _08051F88 @ =gSubSpriteData1
	ldr r0, _08051F8C @ =0x08391424
_08051F68:
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
	ldr r0, _08051F90 @ =0x00000263
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08051F88: .4byte gSubSpriteData1
_08051F8C: .4byte 0x08391424
_08051F90: .4byte 0x00000263

	thumb_func_start Box2Skidding
Box2Skidding: @ 0x08051F94
	push {r4, r5, lr}
	ldr r4, _08051FE0 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	lsrs r0, r0, #2
	movs r1, #0x1f
	cmp r0, #5
	bls _08051FA8
	movs r1, #0x37
_08051FA8:
	bl Box2XMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08051FD8
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08051FC6
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
_08051FC6:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08051FD8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
_08051FD8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051FE0: .4byte gCurrentSprite

	thumb_func_start Box2StopSkiddingInit
Box2StopSkiddingInit: @ 0x08051FE4
	push {lr}
	ldr r2, _08051FFC @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08052008
	ldr r1, _08052000 @ =gSubSpriteData1
	ldr r0, _08052004 @ =0x08391454
	b _0805200C
	.align 2, 0
_08051FFC: .4byte gCurrentSprite
_08052000: .4byte gSubSpriteData1
_08052004: .4byte 0x08391454
_08052008:
	ldr r1, _08052020 @ =gSubSpriteData1
	ldr r0, _08052024 @ =0x08391434
_0805200C:
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
_08052020: .4byte gSubSpriteData1
_08052024: .4byte 0x08391434

	thumb_func_start Box2StopSkidding
Box2StopSkidding: @ 0x08052028
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08052048
	ldr r1, _08052044 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3b
	strb r0, [r2]
	adds r1, #0x2f
	movs r0, #3
	b _08052058
	.align 2, 0
_08052044: .4byte gCurrentSprite
_08052048:
	ldr r1, _08052060 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805205A
	adds r1, #0x24
	movs r0, #0x3b
_08052058:
	strb r0, [r1]
_0805205A:
	pop {r0}
	bx r0
	.align 2, 0
_08052060: .4byte gCurrentSprite

	thumb_func_start Box2BonkingInit
Box2BonkingInit: @ 0x08052064
	push {lr}
	ldr r1, _080520A8 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	subs r0, #0x10
	movs r3, #0
	movs r2, #0
	strh r0, [r1, #8]
	ldr r0, _080520AC @ =0x08391214
	str r0, [r1]
	strb r3, [r1, #6]
	strh r2, [r1, #4]
	ldr r2, _080520B0 @ =gCurrentSprite
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
	ldr r0, _080520B4 @ =0x00000267
	bl SoundPlay
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	pop {r0}
	bx r0
	.align 2, 0
_080520A8: .4byte gSubSpriteData1
_080520AC: .4byte 0x08391214
_080520B0: .4byte gCurrentSprite
_080520B4: .4byte 0x00000267

	thumb_func_start Box2Bonking
Box2Bonking: @ 0x080520B8
	push {r4, r5, r6, r7, lr}
	ldr r4, _080520DC @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _080520E0 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080520E8
	strh r1, [r4, #8]
	ldr r0, _080520E4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x4b
	strb r1, [r0]
	b _080521A0
	.align 2, 0
_080520DC: .4byte gSubSpriteData1
_080520E0: .4byte gPreviousVerticalCollisionCheck
_080520E4: .4byte gCurrentSprite
_080520E8:
	ldr r6, _08052114 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r6
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _08052118 @ =0x08390550
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805211C @ =0x00007FFF
	cmp r1, r0
	bne _08052120
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r4, #8]
	b _0805217A
	.align 2, 0
_08052114: .4byte gCurrentSprite
_08052118: .4byte 0x08390550
_0805211C: .4byte 0x00007FFF
_08052120:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	mov r0, ip
	strb r2, [r0]
	ldrh r0, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
	cmp r2, #0x10
	bne _0805217A
	ldrh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805215E
	ldrh r0, [r4, #8]
	subs r0, #0x34
	ldrh r1, [r4, #0xa]
	subs r1, #0x40
	movs r2, #0x38
	bl ParticleSet
	ldrh r0, [r4, #8]
	subs r0, #0x34
	ldrh r1, [r4, #0xa]
	adds r1, #0x80
	movs r2, #0x38
	bl ParticleSet
	b _0805217A
_0805215E:
	ldrh r0, [r4, #8]
	subs r0, #0x34
	ldrh r1, [r4, #0xa]
	subs r1, #0x80
	movs r2, #0x38
	bl ParticleSet
	ldrh r0, [r4, #8]
	subs r0, #0x34
	ldrh r1, [r4, #0xa]
	adds r1, #0x40
	movs r2, #0x38
	bl ParticleSet
_0805217A:
	ldr r0, _08052190 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08052198
	ldr r1, _08052194 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, #6
	b _0805219E
	.align 2, 0
_08052190: .4byte gCurrentSprite
_08052194: .4byte gSubSpriteData1
_08052198:
	ldr r1, _080521A8 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, #6
_0805219E:
	strh r0, [r1, #0xa]
_080521A0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080521A8: .4byte gSubSpriteData1

	thumb_func_start Box2LandingFromBonkInit
Box2LandingFromBonkInit: @ 0x080521AC
	push {lr}
	ldr r1, _080521DC @ =gSubSpriteData1
	ldr r0, _080521E0 @ =0x08391224
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _080521E4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x4c
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	ldr r0, _080521E8 @ =0x0000027A
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_080521DC: .4byte gSubSpriteData1
_080521E0: .4byte 0x08391224
_080521E4: .4byte gCurrentSprite
_080521E8: .4byte 0x0000027A

	thumb_func_start Box2LandingFromBonk
Box2LandingFromBonk: @ 0x080521EC
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08052240
	ldr r2, _08052218 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08052220
	ldr r1, _0805221C @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08052238
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0805223E
	.align 2, 0
_08052218: .4byte gCurrentSprite
_0805221C: .4byte gSamusData
_08052220:
	ldr r1, _08052234 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _08052238
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0805223E
	.align 2, 0
_08052234: .4byte gSamusData
_08052238:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
_0805223E:
	strb r0, [r1]
_08052240:
	pop {r0}
	bx r0

	thumb_func_start Box2LandingInit
Box2LandingInit: @ 0x08052244
	push {lr}
	ldr r1, _0805226C @ =gSubSpriteData1
	ldr r0, _08052270 @ =0x08391224
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r0, _08052274 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r1, #0x3a
	strb r1, [r2]
	adds r0, #0x31
	strb r3, [r0]
	ldr r0, _08052278 @ =0x0000027A
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805226C: .4byte gSubSpriteData1
_08052270: .4byte 0x08391224
_08052274: .4byte gCurrentSprite
_08052278: .4byte 0x0000027A

	thumb_func_start Box2Landing
Box2Landing: @ 0x0805227C
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080522B0
	ldr r1, _08052298 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _0805229C
	adds r1, #0x24
	movs r0, #0x27
	b _080522AE
	.align 2, 0
_08052298: .4byte gCurrentSprite
_0805229C:
	subs r0, #1
	strb r0, [r3]
	movs r2, #0x7f
	ands r2, r0
	cmp r2, #0
	bne _080522AA
	strb r2, [r3]
_080522AA:
	adds r1, #0x24
	movs r0, #0x3b
_080522AE:
	strb r0, [r1]
_080522B0:
	pop {r0}
	bx r0

	thumb_func_start Box2FinishedCrawlingInit
Box2FinishedCrawlingInit: @ 0x080522B4
	push {r4, lr}
	ldr r2, _080522E4 @ =gSubSpriteData1
	ldr r0, _080522E8 @ =0x083913B4
	str r0, [r2]
	ldr r1, _080522EC @ =gCurrentSprite
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
_080522E4: .4byte gSubSpriteData1
_080522E8: .4byte 0x083913B4
_080522EC: .4byte gCurrentSprite

	thumb_func_start Box2FinishCrawling
Box2FinishCrawling: @ 0x080522F0
	push {r4, r5, lr}
	ldr r4, _08052310 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #1
	bls _08052314
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08052346
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	b _08052346
	.align 2, 0
_08052310: .4byte gCurrentSprite
_08052314:
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08052346
	bl SamusCheckOnCeilingLadder
	cmp r0, #0
	beq _0805232C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08052344
_0805232C:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805233E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08052344
_0805233E:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x19
_08052344:
	strb r0, [r1]
_08052346:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start Box2JumpWarningInit
Box2JumpWarningInit: @ 0x0805234C
	push {r4, lr}
	ldr r0, _08052370 @ =gSamusData
	ldrh r4, [r0, #0x16]
	ldr r0, _08052374 @ =gSubSpriteData1
	ldrh r2, [r0, #0xa]
	adds r1, r2, #0
	subs r1, #0x78
	adds r3, r0, #0
	cmp r1, r4
	bge _08052378
	adds r0, r2, #0
	adds r0, #0x78
	cmp r0, r4
	ble _08052378
	bl Box2StoppingToFireMissilesInit
	b _0805238A
	.align 2, 0
_08052370: .4byte gSamusData
_08052374: .4byte gSubSpriteData1
_08052378:
	ldr r0, _08052390 @ =0x08391244
	str r0, [r3]
	movs r0, #0
	strb r0, [r3, #6]
	strh r0, [r3, #4]
	ldr r0, _08052394 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3c
	strb r1, [r0]
_0805238A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052390: .4byte 0x08391244
_08052394: .4byte gCurrentSprite

	thumb_func_start Box2JumpWarning
Box2JumpWarning: @ 0x08052398
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080523AA
	ldr r0, _080523B0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3d
	strb r1, [r0]
_080523AA:
	pop {r0}
	bx r0
	.align 2, 0
_080523B0: .4byte gCurrentSprite

	thumb_func_start Box2JumpingInit
Box2JumpingInit: @ 0x080523B4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r5, #0
	ldr r1, _080523F4 @ =gSubSpriteData1
	ldr r0, _080523F8 @ =0x08391214
	str r0, [r1]
	strb r5, [r1, #6]
	movs r2, #0
	strh r5, [r1, #4]
	ldr r3, _080523FC @ =gCurrentSprite
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
	bne _080524B2
	bl SamusCheckOnCeilingLadder
	cmp r0, #0
	beq _08052400
	bl SpriteUtilMakeSpriteFaceSamusDirection
	b _08052404
	.align 2, 0
_080523F4: .4byte gSubSpriteData1
_080523F8: .4byte 0x08391214
_080523FC: .4byte gCurrentSprite
_08052400:
	bl MakeSpriteFaceAwayFromSamusDirection
_08052404:
	ldr r6, _08052458 @ =gCurrentSprite
	ldrh r1, [r6]
	movs r0, #0x80
	lsls r0, r0, #2
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	beq _08052468
	ldr r4, _0805245C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	subs r0, #0x20
	ldrh r1, [r4, #0xa]
	movs r2, #0xaf
	lsls r2, r2, #1
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08052460 @ =gPreviousCollisionCheck
	ldrb r0, [r7]
	cmp r0, #0
	beq _08052434
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08052434:
	ldrh r0, [r4, #8]
	subs r0, #0x20
	ldrh r1, [r4, #0xa]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0
	beq _0805244C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0805244C:
	cmp r5, #0
	beq _080524B2
	ldrh r1, [r6]
	ldr r0, _08052464 @ =0x0000FDFF
	ands r0, r1
	b _080524A8
	.align 2, 0
_08052458: .4byte gCurrentSprite
_0805245C: .4byte gSubSpriteData1
_08052460: .4byte gPreviousCollisionCheck
_08052464: .4byte 0x0000FDFF
_08052468:
	ldr r4, _080524C4 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	subs r0, #0x20
	ldrh r1, [r4, #0xa]
	ldr r2, _080524C8 @ =0xFFFFFEA2
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _080524CC @ =gPreviousCollisionCheck
	ldrb r0, [r7]
	cmp r0, #0
	beq _08052486
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08052486:
	ldrh r0, [r4, #8]
	subs r0, #0x20
	ldrh r1, [r4, #0xa]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0
	beq _0805249E
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0805249E:
	cmp r5, #0
	beq _080524B2
	ldrh r1, [r6]
	mov r0, r8
	orrs r0, r1
_080524A8:
	strh r0, [r6]
	adds r1, r6, #0
	adds r1, #0x2f
	movs r0, #0x82
	strb r0, [r1]
_080524B2:
	ldr r0, _080524D0 @ =0x00000265
	bl SoundPlay
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080524C4: .4byte gSubSpriteData1
_080524C8: .4byte 0xFFFFFEA2
_080524CC: .4byte gPreviousCollisionCheck
_080524D0: .4byte 0x00000265

	thumb_func_start Box2Jumping
Box2Jumping: @ 0x080524D4
	push {r4, r5, r6, lr}
	ldr r3, _080524FC @ =gCurrentSprite
	adds r4, r3, #0
	adds r4, #0x31
	ldrb r2, [r4]
	ldr r1, _08052500 @ =0x08390518
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08052504 @ =0x00007FFF
	cmp r1, r0
	bne _08052508
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
	b _08052570
	.align 2, 0
_080524FC: .4byte gCurrentSprite
_08052500: .4byte 0x08390518
_08052504: .4byte 0x00007FFF
_08052508:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	strb r2, [r4]
	ldr r4, _08052548 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, r0, r5
	strh r0, [r4, #8]
	cmp r2, #0x17
	bne _08052568
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805254C
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	subs r1, #0x40
	movs r2, #0x38
	bl ParticleSet
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	adds r1, #0x80
	movs r2, #0x38
	bl ParticleSet
	b _08052568
	.align 2, 0
_08052548: .4byte gSubSpriteData1
_0805254C:
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	subs r1, #0x80
	movs r2, #0x38
	bl ParticleSet
	ldrh r0, [r4, #8]
	subs r0, #0x10
	ldrh r1, [r4, #0xa]
	adds r1, #0x40
	movs r2, #0x38
	bl ParticleSet
_08052568:
	movs r0, #0xc
	movs r1, #0x37
	bl Box2XMovement
_08052570:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Box2StoppingToFireMissilesInit
Box2StoppingToFireMissilesInit: @ 0x08052578
	push {r4, lr}
	ldr r2, _080525A8 @ =gSubSpriteData1
	ldr r0, _080525AC @ =0x083913B4
	str r0, [r2]
	ldr r1, _080525B0 @ =gCurrentSprite
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
_080525A8: .4byte gSubSpriteData1
_080525AC: .4byte 0x083913B4
_080525B0: .4byte gCurrentSprite

	thumb_func_start Box2StoppingToFireMissiles
Box2StoppingToFireMissiles: @ 0x080525B4
	push {r4, r5, lr}
	ldr r5, _080525D4 @ =gCurrentSprite
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	cmp r0, #1
	bls _080525D8
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080525E8
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	b _080525E8
	.align 2, 0
_080525D4: .4byte gCurrentSprite
_080525D8:
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080525E8
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
_080525E8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Box2LoweringToFireMissilesInit
Box2LoweringToFireMissilesInit: @ 0x080525F0
	push {lr}
	ldr r1, _08052614 @ =gSubSpriteData1
	ldr r0, _08052618 @ =0x08391464
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805261C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2a
	strb r1, [r0]
	movs r0, #0x9a
	lsls r0, r0, #2
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08052614: .4byte gSubSpriteData1
_08052618: .4byte 0x08391464
_0805261C: .4byte gCurrentSprite

	thumb_func_start Box2LoweringToFireMissiles
Box2LoweringToFireMissiles: @ 0x08052620
	push {lr}
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805263E
	ldr r0, _08052644 @ =gCurrentSprite
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x2c
	strb r1, [r0]
	ldr r0, _08052648 @ =gSubSpriteData1
	ldr r1, _0805264C @ =0x083914A4
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
_0805263E:
	pop {r0}
	bx r0
	.align 2, 0
_08052644: .4byte gCurrentSprite
_08052648: .4byte gSubSpriteData1
_0805264C: .4byte 0x083914A4

	thumb_func_start Box2FiringMissiles
Box2FiringMissiles: @ 0x08052650
	push {r4, r5, r6, lr}
	sub sp, #0xc
	bl CheckEndOfSubSpriteData1Animation
	adds r6, r0, #0
	cmp r6, #0
	beq _0805268C
	ldr r0, _0805267C @ =gCurrentSprite
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x2e
	strb r1, [r0]
	ldr r0, _08052680 @ =gSubSpriteData1
	ldr r1, _08052684 @ =0x0839150C
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	ldr r0, _08052688 @ =0x00000269
	bl SoundPlay
	b _0805274C
	.align 2, 0
_0805267C: .4byte gCurrentSprite
_08052680: .4byte gSubSpriteData1
_08052684: .4byte 0x0839150C
_08052688: .4byte 0x00000269
_0805268C:
	ldr r3, _080526C4 @ =gCurrentSprite
	ldrh r4, [r3, #2]
	ldrh r5, [r3, #4]
	ldr r0, _080526C8 @ =gSubSpriteData1
	ldr r1, [r0, #4]
	ldr r0, _080526CC @ =0x00FFFFFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #0xc
	cmp r1, r0
	bne _080526D0
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0x8c
	str r0, [sp]
	adds r0, r5, #0
	subs r0, #0x30
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x6d
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0805274C
	.align 2, 0
_080526C4: .4byte gCurrentSprite
_080526C8: .4byte gSubSpriteData1
_080526CC: .4byte 0x00FFFFFF
_080526D0:
	ldr r0, _080526F8 @ =0x00080003
	cmp r1, r0
	bne _080526FC
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0x90
	str r0, [sp]
	adds r0, r5, #0
	subs r0, #0x18
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x6d
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0805274C
	.align 2, 0
_080526F8: .4byte 0x00080003
_080526FC:
	ldr r0, _08052724 @ =0x00080006
	cmp r1, r0
	bne _08052728
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0x90
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x18
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x6d
	movs r1, #2
	bl SpriteSpawnSecondary
	b _0805274C
	.align 2, 0
_08052724: .4byte 0x00080006
_08052728:
	ldr r0, _08052754 @ =0x00080009
	cmp r1, r0
	bne _0805274C
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0x8c
	str r0, [sp]
	adds r0, r5, #0
	adds r0, #0x30
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x6d
	movs r1, #3
	bl SpriteSpawnSecondary
_0805274C:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08052754: .4byte 0x00080009

	thumb_func_start Box2DoneFiringMissiles
Box2DoneFiringMissiles: @ 0x08052758
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805276A
	ldr r0, _08052770 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
_0805276A:
	pop {r0}
	bx r0
	.align 2, 0
_08052770: .4byte gCurrentSprite

	thumb_func_start Box2DyingInit
Box2DyingInit: @ 0x08052774
	ldr r0, _0805279C @ =gCurrentSprite
	ldr r1, _080527A0 @ =0x08395658
	str r1, [r0, #0x18]
	movs r2, #0
	strb r2, [r0, #0x1c]
	movs r3, #0
	strh r2, [r0, #0x16]
	adds r1, r0, #0
	adds r1, #0x31
	strb r3, [r1]
	adds r0, #0x24
	movs r1, #0x44
	strb r1, [r0]
	ldr r0, _080527A4 @ =gSubSpriteData1
	ldr r1, _080527A8 @ =0x0839126C
	str r1, [r0]
	strb r3, [r0, #6]
	strh r2, [r0, #4]
	bx lr
	.align 2, 0
_0805279C: .4byte gCurrentSprite
_080527A0: .4byte 0x08395658
_080527A4: .4byte gSubSpriteData1
_080527A8: .4byte 0x0839126C

	thumb_func_start Box2Dying
Box2Dying: @ 0x080527AC
	push {r4, lr}
	ldr r4, _080527D0 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _080527D4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080527DC
	strh r1, [r4, #8]
	ldr r0, _080527D8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x45
	strb r1, [r0]
	b _080527E2
	.align 2, 0
_080527D0: .4byte gSubSpriteData1
_080527D4: .4byte gPreviousVerticalCollisionCheck
_080527D8: .4byte gCurrentSprite
_080527DC:
	ldrh r0, [r4, #8]
	adds r0, #0x10
	strh r0, [r4, #8]
_080527E2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start Box2ExplodingInit
Box2ExplodingInit: @ 0x080527E8
	ldr r1, _08052808 @ =gCurrentSprite
	ldr r0, _0805280C @ =0x083956B8
	str r0, [r1, #0x18]
	movs r2, #0
	strb r2, [r1, #0x1c]
	movs r3, #0
	strh r2, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	ldr r0, _08052810 @ =gSubSpriteData1
	ldr r1, _08052814 @ =0x0839126C
	str r1, [r0]
	strb r3, [r0, #6]
	strh r2, [r0, #4]
	bx lr
	.align 2, 0
_08052808: .4byte gCurrentSprite
_0805280C: .4byte 0x083956B8
_08052810: .4byte gSubSpriteData1
_08052814: .4byte 0x0839126C

	thumb_func_start Box2Exploding
Box2Exploding: @ 0x08052818
	push {r4, lr}
	ldr r0, _08052838 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r2, #7
	ands r2, r0
	ldr r4, _0805283C @ =gCurrentSprite
	cmp r2, #0
	bne _08052842
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #0
	bne _08052840
	movs r0, #0xb
	strb r0, [r1]
	b _08052842
	.align 2, 0
_08052838: .4byte gFrameCounter8Bit
_0805283C: .4byte gCurrentSprite
_08052840:
	strb r2, [r1]
_08052842:
	ldrh r0, [r4, #4]
	lsrs r0, r0, #2
	ldr r1, _08052870 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08052874 @ =0xFFE70000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xbe
	bhi _0805286A
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805286A
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x47
	strb r0, [r1]
_0805286A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08052870: .4byte gBg1XPosition
_08052874: .4byte 0xFFE70000

	thumb_func_start Box2BrainRisingInit
Box2BrainRisingInit: @ 0x08052878
	push {lr}
	ldr r3, _080528A4 @ =gCurrentSprite
	ldr r0, _080528A8 @ =0x083958C8
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	movs r2, #0
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x48
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r0, #0xe
	strb r2, [r0]
	movs r0, #3
	bl StartStopEventBasedEffect
	pop {r0}
	bx r0
	.align 2, 0
_080528A4: .4byte gCurrentSprite
_080528A8: .4byte 0x083958C8

	thumb_func_start Box2BrainRising
Box2BrainRising: @ 0x080528AC
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _080528E0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	ldr r2, _080528E4 @ =gCurrentSprite
	cmp r0, #0
	bne _080528C6
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_080528C6:
	ldrh r4, [r2, #2]
	ldrh r5, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0x42
	bls _080528D6
	b _08052AAC
_080528D6:
	lsls r0, r0, #2
	ldr r1, _080528E8 @ =_080528EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080528E0: .4byte gFrameCounter8Bit
_080528E4: .4byte gCurrentSprite
_080528E8: .4byte _080528EC
_080528EC: @ jump table
	.4byte _080529F8 @ case 0
	.4byte _08052A44 @ case 1
	.4byte _08052AAC @ case 2
	.4byte _08052AAC @ case 3
	.4byte _08052AAC @ case 4
	.4byte _08052AAC @ case 5
	.4byte _08052AAC @ case 6
	.4byte _08052AAC @ case 7
	.4byte _08052A4C @ case 8
	.4byte _08052AAC @ case 9
	.4byte _08052AAC @ case 10
	.4byte _08052AAC @ case 11
	.4byte _08052AAC @ case 12
	.4byte _08052AAC @ case 13
	.4byte _08052AAC @ case 14
	.4byte _08052AAC @ case 15
	.4byte _08052A56 @ case 16
	.4byte _08052AAC @ case 17
	.4byte _08052AAC @ case 18
	.4byte _08052AAC @ case 19
	.4byte _08052AAC @ case 20
	.4byte _08052AAC @ case 21
	.4byte _08052AAC @ case 22
	.4byte _08052AAC @ case 23
	.4byte _08052AAC @ case 24
	.4byte _08052AAC @ case 25
	.4byte _08052AAC @ case 26
	.4byte _08052AAC @ case 27
	.4byte _08052AAC @ case 28
	.4byte _08052AAC @ case 29
	.4byte _08052A66 @ case 30
	.4byte _08052AAC @ case 31
	.4byte _08052AAC @ case 32
	.4byte _08052AAC @ case 33
	.4byte _08052AAC @ case 34
	.4byte _08052AAC @ case 35
	.4byte _08052AAC @ case 36
	.4byte _08052AAC @ case 37
	.4byte _08052A76 @ case 38
	.4byte _08052AAC @ case 39
	.4byte _08052AAC @ case 40
	.4byte _08052AAC @ case 41
	.4byte _08052AAC @ case 42
	.4byte _08052AAC @ case 43
	.4byte _08052AAC @ case 44
	.4byte _08052AAC @ case 45
	.4byte _08052A80 @ case 46
	.4byte _08052AAC @ case 47
	.4byte _08052AAC @ case 48
	.4byte _08052AAC @ case 49
	.4byte _08052AAC @ case 50
	.4byte _08052AAC @ case 51
	.4byte _08052AAC @ case 52
	.4byte _08052AAC @ case 53
	.4byte _08052AAC @ case 54
	.4byte _08052AAC @ case 55
	.4byte _08052AAC @ case 56
	.4byte _08052AAC @ case 57
	.4byte _08052AAC @ case 58
	.4byte _08052AAC @ case 59
	.4byte _08052AAC @ case 60
	.4byte _08052AAC @ case 61
	.4byte _08052AAC @ case 62
	.4byte _08052AAC @ case 63
	.4byte _08052AAC @ case 64
	.4byte _08052AAC @ case 65
	.4byte _08052A90 @ case 66
_080529F8:
	ldr r0, _08052A38 @ =gCurrentSprite
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	str r4, [sp]
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x6e
	movs r1, #0
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08052A3C @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x23
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x48
	adds r1, r5, #0
	movs r2, #0x30
	bl ParticleSet
	ldr r0, _08052A40 @ =0x0000026E
	bl unk_3b1c
	b _08052AAC
	.align 2, 0
_08052A38: .4byte gCurrentSprite
_08052A3C: .4byte gSpriteData
_08052A40: .4byte 0x0000026E
_08052A44:
	adds r1, r5, #0
	adds r1, #0x50
	adds r0, r4, #0
	b _08052A6E
_08052A4C:
	adds r0, r4, #0
	adds r0, #0x86
	adds r1, r5, #0
	adds r1, #0x70
	b _08052A5E
_08052A56:
	adds r0, r4, #0
	adds r0, #0x86
	adds r1, r5, #0
	subs r1, #0x70
_08052A5E:
	movs r2, #0x30
	bl ParticleSet
	b _08052AAC
_08052A66:
	adds r0, r4, #0
	adds r0, #0x14
	adds r1, r5, #0
	subs r1, #0xa
_08052A6E:
	movs r2, #0x35
	bl ParticleSet
	b _08052AAC
_08052A76:
	adds r0, r4, #0
	adds r0, #0x5c
	adds r1, r5, #0
	adds r1, #0x90
	b _08052A88
_08052A80:
	adds r0, r4, #0
	adds r0, #0x5c
	adds r1, r5, #0
	subs r1, #0x90
_08052A88:
	movs r2, #0x2f
	bl ParticleSet
	b _08052AAC
_08052A90:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _08052AB6
_08052AAC:
	ldr r1, _08052AC0 @ =gCurrentSprite
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08052AB6:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08052AC0: .4byte gCurrentSprite

	thumb_func_start Box2BrainFloating
Box2BrainFloating: @ 0x08052AC4
	push {lr}
	ldr r2, _08052AE0 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08052ADC
	strh r0, [r2]
_08052ADC:
	pop {r0}
	bx r0
	.align 2, 0
_08052AE0: .4byte gCurrentSprite

	thumb_func_start Box2IdleInit
Box2IdleInit: @ 0x08052AE4
	push {lr}
	ldr r2, _08052AFC @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08052B08
	ldr r1, _08052B00 @ =gSubSpriteData1
	ldr r0, _08052B04 @ =0x08391324
	b _08052B0C
	.align 2, 0
_08052AFC: .4byte gCurrentSprite
_08052B00: .4byte gSubSpriteData1
_08052B04: .4byte 0x08391324
_08052B08:
	ldr r1, _08052B20 @ =gSubSpriteData1
	ldr r0, _08052B24 @ =0x08391294
_08052B0C:
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
_08052B20: .4byte gSubSpriteData1
_08052B24: .4byte 0x08391294

	thumb_func_start Box2Crawling
Box2Crawling: @ 0x08052B28
	push {lr}
	movs r0, #1
	movs r1, #7
	bl Box2XMovement
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Box2PartSetBoxWorkVar2
Box2PartSetBoxWorkVar2: @ 0x08052B38
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	ldr r2, _08052B5C @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, r3
	bhs _08052B56
	strb r3, [r1]
_08052B56:
	pop {r0}
	bx r0
	.align 2, 0
_08052B5C: .4byte gSpriteData

	thumb_func_start Box2PartCenterSetImmunity
Box2PartCenterSetImmunity: @ 0x08052B60
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r1, _08052B88 @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x29
	adds r3, r1, #0
	cmp r0, #0x19
	bhi _08052C2C
	lsls r0, r0, #2
	ldr r1, _08052B8C @ =_08052B90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052B88: .4byte gSpriteData
_08052B8C: .4byte _08052B90
_08052B90: @ jump table
	.4byte _08052BF8 @ case 0
	.4byte _08052BF8 @ case 1
	.4byte _08052C2C @ case 2
	.4byte _08052BF8 @ case 3
	.4byte _08052C2C @ case 4
	.4byte _08052BF8 @ case 5
	.4byte _08052C2C @ case 6
	.4byte _08052C2C @ case 7
	.4byte _08052C2C @ case 8
	.4byte _08052C2C @ case 9
	.4byte _08052C2C @ case 10
	.4byte _08052C2C @ case 11
	.4byte _08052C2C @ case 12
	.4byte _08052C2C @ case 13
	.4byte _08052C2C @ case 14
	.4byte _08052C2C @ case 15
	.4byte _08052C2C @ case 16
	.4byte _08052C2C @ case 17
	.4byte _08052C2C @ case 18
	.4byte _08052C2C @ case 19
	.4byte _08052C2C @ case 20
	.4byte _08052C2C @ case 21
	.4byte _08052C1C @ case 22
	.4byte _08052C1C @ case 23
	.4byte _08052C1C @ case 24
	.4byte _08052C1C @ case 25
_08052BF8:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08052C2C
	ldr r0, _08052C18 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _08052C36
	.align 2, 0
_08052C18: .4byte gCurrentSprite
_08052C1C:
	ldr r0, _08052C28 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _08052C36
	.align 2, 0
_08052C28: .4byte gCurrentSprite
_08052C2C:
	ldr r0, _08052C3C @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0xbf
	ands r1, r2
_08052C36:
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08052C3C: .4byte gCurrentSprite

	thumb_func_start Box2PartRemoveIgnoreProjectiles
Box2PartRemoveIgnoreProjectiles: @ 0x08052C40
	ldr r2, _08052C4C @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08052C50 @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_08052C4C: .4byte gCurrentSprite
_08052C50: .4byte 0x00007FFF

	thumb_func_start Box2PartInit
Box2PartInit: @ 0x08052C54
	push {r4, lr}
	ldr r2, _08052C8C @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08052C90 @ =0x0000FFFB
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
	adds r4, r2, #0
	cmp r0, #6
	bhi _08052C94
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xb
	b _08052C9A
	.align 2, 0
_08052C8C: .4byte gCurrentSprite
_08052C90: .4byte 0x0000FFFB
_08052C94:
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xd
_08052C9A:
	strb r0, [r1]
	ldrb r0, [r4, #0x1e]
	cmp r0, #0xb
	bls _08052CA4
	b _08052E00
_08052CA4:
	lsls r0, r0, #2
	ldr r1, _08052CB0 @ =_08052CB4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08052CB0: .4byte _08052CB4
_08052CB4: @ jump table
	.4byte _08052CE4 @ case 0
	.4byte _08052DC4 @ case 1
	.4byte _08052CE4 @ case 2
	.4byte _08052DC4 @ case 3
	.4byte _08052DC4 @ case 4
	.4byte _08052DC4 @ case 5
	.4byte _08052D34 @ case 6
	.4byte _08052E00 @ case 7
	.4byte _08052DC4 @ case 8
	.4byte _08052D80 @ case 9
	.4byte _08052DC4 @ case 10
	.4byte _08052DC4 @ case 11
_08052CE4:
	ldr r0, _08052D28 @ =0x0000FFB8
	strh r0, [r4, #0xa]
	movs r0, #0x48
	strh r0, [r4, #0xc]
	ldr r0, _08052D2C @ =0x0000FFE0
	strh r0, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	subs r1, #0x10
	strb r0, [r1]
	ldr r1, _08052D30 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	bl Box2SyncSubSprites
	ldrb r0, [r4, #0x1e]
	cmp r0, #2
	bne _08052E04
	movs r0, #7
	strh r0, [r4, #0x16]
	b _08052E04
	.align 2, 0
_08052D28: .4byte 0x0000FFB8
_08052D2C: .4byte 0x0000FFE0
_08052D30: .4byte sSecondarySpriteStats
_08052D34:
	movs r2, #0
	movs r3, #0
	ldr r0, _08052D70 @ =0x0000FFD0
	strh r0, [r4, #0xa]
	movs r0, #0x40
	strh r0, [r4, #0xc]
	ldr r0, _08052D74 @ =0x0000FFE0
	strh r0, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0x10
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08052D78 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	ldr r0, _08052D7C @ =0x08395868
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _08052E04
	.align 2, 0
_08052D70: .4byte 0x0000FFD0
_08052D74: .4byte 0x0000FFE0
_08052D78: .4byte sSecondarySpriteStats
_08052D7C: .4byte 0x08395868
_08052D80:
	ldr r0, _08052DB8 @ =0x0000FFE0
	strh r0, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
	ldr r0, _08052DBC @ =0x0000FFC0
	strh r0, [r4, #0xe]
	movs r0, #0x40
	strh r0, [r4, #0x10]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08052DC0 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	bl Box2SyncSubSprites
	b _08052E04
	.align 2, 0
_08052DB8: .4byte 0x0000FFE0
_08052DBC: .4byte 0x0000FFC0
_08052DC0: .4byte sSecondarySpriteStats
_08052DC4:
	movs r2, #0
	ldr r1, _08052DF8 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _08052DFC @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	bl Box2SyncSubSprites
	b _08052E04
	.align 2, 0
_08052DF8: .4byte 0x0000FFFC
_08052DFC: .4byte sSecondarySpriteStats
_08052E00:
	movs r0, #0
	strh r0, [r4]
_08052E04:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Box2PartFrontLeftLeg
Box2PartFrontLeftLeg: @ 0x08052E0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _08052E40 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov sb, r0
	mov sl, sb
	ldr r0, _08052E44 @ =gSpriteData
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
	bne _08052E48
	strh r1, [r4]
	b _08052F96
	.align 2, 0
_08052E40: .4byte gCurrentSprite
_08052E44: .4byte gSpriteData
_08052E48:
	ldrh r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	beq _08052E56
	b _08052F96
_08052E56:
	ldr r1, _08052E78 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r5, [r0]
	ldrh r6, [r4, #2]
	ldrh r7, [r4, #4]
	mov r0, r8
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x46
	bne _08052E7C
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r0, r2
	strh r0, [r4]
	b _08052ED2
	.align 2, 0
_08052E78: .4byte sSecondarySpriteStats
_08052E7C:
	mov r0, sb
	bl Box2PartRemoveIgnoreProjectiles
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08052EE0
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08052EE6
	mov r0, r8
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08052EC8
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r0, #0x1f
	ands r1, r0
	cmp r1, #0
	bne _08052F96
	adds r0, r6, #0
	adds r0, #0x30
	adds r1, r7, #0
	movs r2, #0x2e
	bl ParticleSet
	b _08052F96
_08052EC8:
	ldrh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r1, r0
	strh r1, [r4]
_08052ED2:
	adds r0, r6, #0
	adds r0, #0x32
	adds r1, r7, #0
	movs r2, #0x2f
	bl ParticleSet
	b _08052F96
_08052EE0:
	ldrh r1, [r4, #0x14]
	cmp r1, #0
	bne _08052F28
_08052EE6:
	ldr r1, _08052F20 @ =gSpriteData
	mov r2, sl
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r2, [r0]
	movs r1, #0xfe
	ands r1, r2
	strb r1, [r0]
	ldr r1, _08052F24 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #4
	movs r3, #0
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0xff
	strh r0, [r1, #0x14]
	adds r1, #0x2e
	strb r3, [r1]
	adds r0, r6, #0
	adds r0, #0x32
	adds r1, r7, #0
	movs r2, #0x2f
	bl ParticleSet
	mov r0, sl
	b _08052F5A
	.align 2, 0
_08052F20: .4byte gSpriteData
_08052F24: .4byte gCurrentSprite
_08052F28:
	lsrs r0, r5, #2
	cmp r1, r0
	bhs _08052F38
	ldr r0, [r4, #0x18]
	ldr r1, _08052F34 @ =0x08395420
	b _08052F42
	.align 2, 0
_08052F34: .4byte 0x08395420
_08052F38:
	lsrs r0, r5, #1
	cmp r1, r0
	bhs _08052F68
	ldr r0, [r4, #0x18]
	ldr r1, _08052F64 @ =0x08395410
_08052F42:
	cmp r0, r1
	beq _08052F96
	str r1, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x24
	adds r1, r7, #0
	movs r2, #0x2d
	bl ParticleSet
	mov r0, sb
_08052F5A:
	movs r1, #1
	bl Box2PartSetBoxWorkVar2
	b _08052F96
	.align 2, 0
_08052F64: .4byte 0x08395410
_08052F68:
	ldrh r1, [r4, #0x14]
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r0, r0, #2
	cmp r1, r0
	bge _08052F96
	ldr r0, [r4, #0x18]
	ldr r1, _08052FA4 @ =0x08395400
	cmp r0, r1
	beq _08052F96
	str r1, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x24
	adds r1, r7, #0
	movs r2, #0x2d
	bl ParticleSet
	mov r0, sl
	movs r1, #1
	bl Box2PartSetBoxWorkVar2
_08052F96:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08052FA4: .4byte 0x08395400

	thumb_func_start Box2PartFrontRightLeg
Box2PartFrontRightLeg: @ 0x08052FA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, _08052FDC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov sb, r0
	str r0, [sp]
	ldr r0, _08052FE0 @ =gSpriteData
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
	bne _08052FE4
	strh r1, [r4]
	b _08053132
	.align 2, 0
_08052FDC: .4byte gCurrentSprite
_08052FE0: .4byte gSpriteData
_08052FE4:
	ldrh r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	mov sl, r0
	ands r0, r2
	cmp r0, #0
	beq _08052FF4
	b _08053132
_08052FF4:
	ldr r1, _08053014 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r5, [r0]
	ldrh r6, [r4, #2]
	ldrh r7, [r4, #4]
	mov r0, r8
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x46
	bne _08053018
	mov r0, sl
	orrs r0, r2
	strh r0, [r4]
	b _0805306C
	.align 2, 0
_08053014: .4byte sSecondarySpriteStats
_08053018:
	mov r0, sb
	bl Box2PartRemoveIgnoreProjectiles
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _0805307A
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08053080
	mov r0, r8
	adds r0, #0x2d
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08053064
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r0, #0x1f
	ands r1, r0
	cmp r1, #0
	bne _08053132
	adds r0, r6, #0
	adds r0, #0x30
	adds r1, r7, #0
	movs r2, #0x2e
	bl ParticleSet
	b _08053132
_08053064:
	ldrh r0, [r4]
	mov r1, sl
	orrs r1, r0
	strh r1, [r4]
_0805306C:
	adds r0, r6, #0
	adds r0, #0x32
	adds r1, r7, #0
	movs r2, #0x2f
	bl ParticleSet
	b _08053132
_0805307A:
	ldrh r1, [r4, #0x14]
	cmp r1, #0
	bne _080530C4
_08053080:
	ldr r1, _080530BC @ =gSpriteData
	ldr r2, [sp]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r2, [r0]
	movs r1, #0xfd
	ands r1, r2
	strb r1, [r0]
	ldr r1, _080530C0 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #4
	movs r3, #0
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0xff
	strh r0, [r1, #0x14]
	adds r1, #0x2e
	strb r3, [r1]
	adds r0, r6, #0
	adds r0, #0x32
	adds r1, r7, #0
	movs r2, #0x2f
	bl ParticleSet
	ldr r0, [sp]
	b _080530F6
	.align 2, 0
_080530BC: .4byte gSpriteData
_080530C0: .4byte gCurrentSprite
_080530C4:
	lsrs r0, r5, #2
	cmp r1, r0
	bhs _080530D4
	ldr r0, [r4, #0x18]
	ldr r1, _080530D0 @ =0x08395588
	b _080530DE
	.align 2, 0
_080530D0: .4byte 0x08395588
_080530D4:
	lsrs r0, r5, #1
	cmp r1, r0
	bhs _08053104
	ldr r0, [r4, #0x18]
	ldr r1, _08053100 @ =0x08395578
_080530DE:
	cmp r0, r1
	beq _08053132
	str r1, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x24
	adds r1, r7, #0
	movs r2, #0x2d
	bl ParticleSet
	mov r0, sb
_080530F6:
	movs r1, #1
	bl Box2PartSetBoxWorkVar2
	b _08053132
	.align 2, 0
_08053100: .4byte 0x08395578
_08053104:
	ldrh r1, [r4, #0x14]
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r0, r0, #2
	cmp r1, r0
	bge _08053132
	ldr r0, [r4, #0x18]
	ldr r1, _08053144 @ =0x08395568
	cmp r0, r1
	beq _08053132
	str r1, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r0, r6, #0
	adds r0, #0x24
	adds r1, r7, #0
	movs r2, #0x2d
	bl ParticleSet
	ldr r0, [sp]
	movs r1, #1
	bl Box2PartSetBoxWorkVar2
_08053132:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053144: .4byte 0x08395568

	thumb_func_start Box2PartTopShell
Box2PartTopShell: @ 0x08053148
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, _08053178 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov sb, r0
	ldr r0, _0805317C @ =gSpriteData
	mov r2, sb
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r7, r1, r0
	ldrh r0, [r7]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08053180
	strh r1, [r4]
	b _08053270
	.align 2, 0
_08053178: .4byte gCurrentSprite
_0805317C: .4byte gSpriteData
_08053180:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	mov sl, r0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08053270
	ldr r1, _080531DC @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r6, [r0]
	ldrh r3, [r4, #2]
	ldrh r2, [r4, #4]
	mov r8, r2
	mov r0, sb
	str r3, [sp]
	bl Box2PartCenterSetImmunity
	ldrh r1, [r4, #0x14]
	ldr r3, [sp]
	cmp r1, #0
	bne _080531E0
	adds r2, r7, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x32
	mov r1, r8
	movs r2, #0x2f
	bl ParticleSet
	ldrh r1, [r4]
	mov r0, sl
	orrs r0, r1
	strh r0, [r4]
	adds r1, r7, #0
	adds r1, #0x24
	movs r0, #0x43
	strb r0, [r1]
	b _08053252
	.align 2, 0
_080531DC: .4byte sSecondarySpriteStats
_080531E0:
	lsrs r0, r6, #2
	cmp r1, r0
	bhs _080531F0
	ldr r0, [r4, #0x18]
	ldr r1, _080531EC @ =0x08395648
	b _08053210
	.align 2, 0
_080531EC: .4byte 0x08395648
_080531F0:
	lsrs r0, r6, #1
	cmp r1, r0
	bhs _08053200
	ldr r0, [r4, #0x18]
	ldr r1, _080531FC @ =0x08395638
	b _08053210
	.align 2, 0
_080531FC: .4byte 0x08395638
_08053200:
	ldrh r1, [r4, #0x14]
	lsls r0, r6, #1
	adds r0, r0, r6
	asrs r0, r0, #2
	cmp r1, r0
	bge _0805322C
	ldr r0, [r4, #0x18]
	ldr r1, _08053228 @ =0x08395628
_08053210:
	cmp r0, r1
	beq _08053252
	str r1, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r5, [r4, #0x16]
	adds r0, r3, #0
	adds r0, #0x24
	mov r1, r8
	movs r2, #0x30
	bl ParticleSet
	b _08053252
	.align 2, 0
_08053228: .4byte 0x08395628
_0805322C:
	cmp r1, r6
	bhs _08053252
	ldr r0, [r4, #0x18]
	ldr r2, _08053280 @ =0x08395618
	cmp r0, r2
	beq _08053252
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	str r2, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r5, [r4, #0x16]
	adds r0, r3, #0
	adds r0, #0x24
	mov r1, r8
	movs r2, #0x30
	bl ParticleSet
_08053252:
	ldr r0, _08053284 @ =gCurrentSprite
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08053270
	mov r0, sb
	movs r1, #2
	bl Box2PartSetBoxWorkVar2
	movs r0, #0x9e
	lsls r0, r0, #2
	bl SoundPlay
_08053270:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053280: .4byte 0x08395618
_08053284: .4byte gCurrentSprite

	thumb_func_start Box2PartBottomShell
Box2PartBottomShell: @ 0x08053288
	push {r4, r5, lr}
	ldr r3, _080532AC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _080532B0 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r0, [r2]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080532B4
	strh r1, [r3]
	b _08053340
	.align 2, 0
_080532AC: .4byte gCurrentSprite
_080532B0: .4byte gSpriteData
_080532B4:
	ldrh r4, [r3]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _08053340
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3c
	beq _080532E8
	cmp r0, #0x3c
	bgt _080532DE
	cmp r0, #8
	beq _080532E8
	cmp r0, #0x18
	beq _080532E8
	b _08053330
_080532DE:
	cmp r0, #0x46
	beq _080532F4
	cmp r0, #0x48
	beq _08053328
	b _08053330
_080532E8:
	ldr r0, [r3, #0x18]
	ldr r1, _080532F0 @ =0x08395728
	b _08053334
	.align 2, 0
_080532F0: .4byte 0x08395728
_080532F4:
	ldr r0, [r3, #0x18]
	ldr r2, _0805331C @ =0x08395728
	cmp r0, r2
	beq _08053302
	str r2, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
_08053302:
	ldr r0, _08053320 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _08053340
	adds r3, #0x20
	ldrb r0, [r3]
	cmp r0, #0
	bne _08053324
	movs r0, #0xc
	strb r0, [r3]
	b _08053340
	.align 2, 0
_0805331C: .4byte 0x08395728
_08053320: .4byte gFrameCounter8Bit
_08053324:
	strb r1, [r3]
	b _08053340
_08053328:
	adds r0, r5, #0
	orrs r0, r4
	strh r0, [r3]
	b _08053340
_08053330:
	ldr r0, [r3, #0x18]
	ldr r1, _08053348 @ =0x08395718
_08053334:
	cmp r0, r1
	beq _08053340
	str r1, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
_08053340:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053348: .4byte 0x08395718

	thumb_func_start Box2PartDefault
Box2PartDefault: @ 0x0805334C
	push {r4, r5, r6, lr}
	ldr r4, _08053370 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _08053374 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	ldrh r0, [r5]
	movs r6, #1
	adds r1, r6, #0
	ands r1, r0
	cmp r1, #0
	bne _08053378
	strh r1, [r4]
	b _080533F2
	.align 2, 0
_08053370: .4byte gCurrentSprite
_08053374: .4byte gSpriteData
_08053378:
	ldrh r2, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	bne _080533F2
	adds r0, r5, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x47
	beq _080533CC
	cmp r0, #0x47
	bgt _0805339E
	cmp r0, #0x46
	beq _080533A8
	b _080533F2
_0805339E:
	cmp r0, #0x48
	beq _080533D4
	cmp r0, #0x49
	beq _080533EC
	b _080533F2
_080533A8:
	ldr r0, _080533C4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	bne _080533F2
	adds r1, r4, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #0
	bne _080533C8
	movs r0, #0xd
	strb r0, [r1]
	b _080533F2
	.align 2, 0
_080533C4: .4byte gFrameCounter8Bit
_080533C8:
	strb r3, [r1]
	b _080533F2
_080533CC:
	adds r0, r4, #0
	adds r0, #0x20
	strb r3, [r0]
	b _080533F2
_080533D4:
	ldr r0, _080533E8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080533F2
	movs r0, #4
	eors r0, r2
	b _080533F0
	.align 2, 0
_080533E8: .4byte gFrameCounter8Bit
_080533EC:
	adds r0, r1, #0
	orrs r0, r2
_080533F0:
	strh r0, [r4]
_080533F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Box2MissileInit
Box2MissileInit: @ 0x080533F8
	push {r4, lr}
	ldr r0, _08053488 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0805348C @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r2, #0
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	ldr r0, _08053490 @ =gIoRegisters
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
	ldr r1, _08053494 @ =0x0000FFF8
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #8
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08053498 @ =0x083957E8
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldr r1, _0805349C @ =sSecondarySpriteStats
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
	mov r0, ip
	adds r0, #0x2d
	strb r3, [r0]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	ldr r0, _080534A0 @ =0x0000026B
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053488: .4byte gCurrentSprite
_0805348C: .4byte 0x0000FFFB
_08053490: .4byte gIoRegisters
_08053494: .4byte 0x0000FFF8
_08053498: .4byte 0x083957E8
_0805349C: .4byte sSecondarySpriteStats
_080534A0: .4byte 0x0000026B

	thumb_func_start Box2MissileLaunching
Box2MissileLaunching: @ 0x080534A4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r5, _08053524 @ =gCurrentSprite
	ldrh r0, [r5, #0x14]
	cmp r0, #0
	bne _080534BC
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_080534BC:
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
	bhi _080534EC
	adds r7, r5, #0
	adds r7, #0x2b
	ldrb r0, [r7]
	ldr r2, _08053528 @ =gSamusData
	ldrh r1, [r2, #0x18]
	subs r1, #0x40
	ldrh r2, [r2, #0x16]
	ldrh r3, [r5, #2]
	ldrh r4, [r5, #4]
	str r4, [sp]
	bl RotateSpriteTowardsSamus
	strb r0, [r7]
_080534EC:
	ldrb r0, [r6]
	subs r0, #2
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _08053518
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
_08053518:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053524: .4byte gCurrentSprite
_08053528: .4byte gSamusData

	thumb_func_start Box2MissileMoving
Box2MissileMoving: @ 0x0805352C
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r1, _0805354C @ =gCurrentSprite
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08053544
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	bne _08053550
_08053544:
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _080535F8
	.align 2, 0
_0805354C: .4byte gCurrentSprite
_08053550:
	ldrb r1, [r1, #0x1e]
	movs r2, #8
	cmp r1, #3
	beq _08053566
	movs r2, #0x28
	cmp r1, #2
	beq _08053566
	movs r2, #0x68
	cmp r1, #1
	bne _08053566
	movs r2, #0x48
_08053566:
	ldr r4, _080535D0 @ =gSamusData
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
	ldr r5, _080535D4 @ =gCurrentSprite
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
	ldr r0, _080535D8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080535B0
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_080535B0:
	ldr r0, _080535DC @ =gCurrentAffectingClipdata
	ldrh r4, [r0, #2]
	cmp r4, #1
	bne _080535E0
	adds r6, r5, #0
	adds r6, #0x2d
	ldrb r0, [r6]
	cmp r0, #0
	bne _080535F8
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	movs r2, #0x39
	bl ParticleSet
	strb r4, [r6]
	b _080535F8
	.align 2, 0
_080535D0: .4byte gSamusData
_080535D4: .4byte gCurrentSprite
_080535D8: .4byte gPreviousCollisionCheck
_080535DC: .4byte gCurrentAffectingClipdata
_080535E0:
	adds r4, r5, #0
	adds r4, #0x2d
	ldrb r0, [r4]
	cmp r0, #0
	beq _080535F8
	ldrh r0, [r5, #2]
	ldrh r1, [r5, #4]
	movs r2, #0x39
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
_080535F8:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Box2MissileExploding
Box2MissileExploding: @ 0x08053600
	push {lr}
	ldr r1, _08053620 @ =gCurrentSprite
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
_08053620: .4byte gCurrentSprite

	thumb_func_start Box2BrainTopInit
Box2BrainTopInit: @ 0x08053624
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _080536B0 @ =gCurrentSprite
	ldrh r1, [r5]
	ldr r0, _080536B4 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	strh r0, [r5]
	ldr r0, _080536B8 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	movs r2, #0x20
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _080536BC @ =0x0000FFE0
	strh r1, [r5, #0xa]
	movs r0, #0x40
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r2, [r5, #0x10]
	ldr r0, _080536C0 @ =0x08395808
	str r0, [r5, #0x18]
	strb r3, [r5, #0x1c]
	strh r4, [r5, #0x16]
	ldr r1, _080536C4 @ =sSecondarySpriteStats
	ldrb r0, [r5, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x5a
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r2, [r5, #0x1f]
	subs r0, #2
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x6f
	movs r1, #0
	bl SpriteSpawnSecondary
	adds r1, r5, #0
	adds r1, #0x2f
	strb r0, [r1]
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080536B0: .4byte gCurrentSprite
_080536B4: .4byte 0x0000FFFB
_080536B8: .4byte gIoRegisters
_080536BC: .4byte 0x0000FFE0
_080536C0: .4byte 0x08395808
_080536C4: .4byte sSecondarySpriteStats

	thumb_func_start Box2BrainTopRising
Box2BrainTopRising: @ 0x080536C8
	push {lr}
	ldr r0, _080536E8 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r2, #7
	ands r2, r0
	ldr r3, _080536EC @ =gCurrentSprite
	cmp r2, #0
	bne _0805370C
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #0
	bne _080536F0
	movs r0, #0xb
	strb r0, [r1]
	b _080536F2
	.align 2, 0
_080536E8: .4byte gFrameCounter8Bit
_080536EC: .4byte gCurrentSprite
_080536F0:
	strb r2, [r1]
_080536F2:
	ldr r2, _08053738 @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, #0x20
	strb r1, [r0]
_0805370C:
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805373C
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #0x3c
	mov r1, ip
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	b _08053742
	.align 2, 0
_08053738: .4byte gSpriteData
_0805373C:
	ldrh r0, [r3, #2]
	subs r0, #2
	strh r0, [r3, #2]
_08053742:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Box2BrainTopFloating
Box2BrainTopFloating: @ 0x08053748
	push {r4, r5, r6, lr}
	ldr r0, _08053768 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r2, #7
	ands r2, r0
	ldr r3, _0805376C @ =gCurrentSprite
	cmp r2, #0
	bne _0805378C
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #0
	bne _08053770
	movs r0, #0xb
	strb r0, [r1]
	b _08053772
	.align 2, 0
_08053768: .4byte gFrameCounter8Bit
_0805376C: .4byte gCurrentSprite
_08053770:
	strb r2, [r1]
_08053772:
	ldr r2, _080537EC @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, #0x20
	strb r1, [r0]
_0805378C:
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _080537F0 @ =0x08390578
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080537F4 @ =0x00007FFF
	cmp r1, r0
	bne _080537AA
	ldrh r4, [r5]
	movs r2, #0
_080537AA:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
	movs r4, #0
	strh r0, [r3, #2]
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080537E6
	subs r1, #0xa
	movs r0, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x20
	strb r4, [r0]
	ldr r2, _080537EC @ =gSpriteData
	adds r0, #0xf
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x20
	strb r4, [r0]
_080537E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080537EC: .4byte gSpriteData
_080537F0: .4byte 0x08390578
_080537F4: .4byte 0x00007FFF

	thumb_func_start Box2BrainTopTransformingInit
Box2BrainTopTransformingInit: @ 0x080537F8
	push {r4, lr}
	ldr r3, _0805381C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	ldrh r2, [r3]
	movs r0, #0
	ldr r1, _08053820 @ =0x00008020
	movs r4, #0x25
	strb r0, [r4, r3]
	movs r0, #0x2c
	strh r0, [r3, #6]
	orrs r1, r2
	strh r1, [r3]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805381C: .4byte gCurrentSprite
_08053820: .4byte 0x00008020

	thumb_func_start Box2BrainTopTransforming
Box2BrainTopTransforming: @ 0x08053824
	push {r4, r5, lr}
	movs r5, #0x59
	ldr r2, _0805387C @ =gWrittenToMosaic_H
	ldr r1, _08053880 @ =sXParasiteMosaicValues
	ldr r4, _08053884 @ =gCurrentSprite
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _08053888
	ldrh r2, [r4, #6]
	movs r0, #0x59
	movs r1, #0
	bl SpriteLoadGfx
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _08053896
	adds r0, r4, #0
	adds r0, #0x24
	strb r5, [r0]
	strb r5, [r4, #0x1d]
	ldrh r0, [r4, #2]
	adds r0, #0x5c
	strh r0, [r4, #2]
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
	b _08053896
	.align 2, 0
_0805387C: .4byte gWrittenToMosaic_H
_08053880: .4byte sXParasiteMosaicValues
_08053884: .4byte gCurrentSprite
_08053888:
	cmp r0, #0x14
	bne _08053896
	movs r0, #0x59
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_08053896:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start Box2BrainBottomInit
Box2BrainBottomInit: @ 0x0805389C
	push {r4, lr}
	ldr r0, _08053908 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0805390C @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	ldr r0, _08053910 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r2, #3
	adds r0, r2, #0
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x22
	strb r2, [r0]
	adds r0, #5
	strb r3, [r0]
	adds r1, #7
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	ldr r1, _08053914 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _08053918 @ =0x083958D8
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053908: .4byte gCurrentSprite
_0805390C: .4byte 0x0000FFFB
_08053910: .4byte gIoRegisters
_08053914: .4byte 0x0000FFFC
_08053918: .4byte 0x083958D8

	thumb_func_start Box2BrainBottomIdle
Box2BrainBottomIdle: @ 0x0805391C
	push {r4, lr}
	ldr r2, _0805394C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r4, [r0]
	ldr r3, _08053950 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
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
	beq _08053954
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	b _0805395A
	.align 2, 0
_0805394C: .4byte gCurrentSprite
_08053950: .4byte gSpriteData
_08053954:
	ldrh r1, [r2]
	ldr r0, _08053978 @ =0x0000FFDF
	ands r0, r1
_0805395A:
	strh r0, [r2]
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x59
	bne _08053970
	movs r0, #0
	strh r0, [r2]
_08053970:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053978: .4byte 0x0000FFDF

	thumb_func_start Box2
Box2: @ 0x0805397C
	push {lr}
	ldr r0, _08053994 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4c
	bls _0805398A
	b _08053B90
_0805398A:
	lsls r0, r0, #2
	ldr r1, _08053998 @ =_0805399C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053994: .4byte gCurrentSprite
_08053998: .4byte _0805399C
_0805399C: @ jump table
	.4byte _08053AD0 @ case 0
	.4byte _08053AD6 @ case 1
	.4byte _08053ADA @ case 2
	.4byte _08053B90 @ case 3
	.4byte _08053B90 @ case 4
	.4byte _08053B90 @ case 5
	.4byte _08053B90 @ case 6
	.4byte _08053B12 @ case 7
	.4byte _08053B16 @ case 8
	.4byte _08053B90 @ case 9
	.4byte _08053B90 @ case 10
	.4byte _08053B90 @ case 11
	.4byte _08053B90 @ case 12
	.4byte _08053B90 @ case 13
	.4byte _08053B90 @ case 14
	.4byte _08053B90 @ case 15
	.4byte _08053B90 @ case 16
	.4byte _08053B90 @ case 17
	.4byte _08053B90 @ case 18
	.4byte _08053B90 @ case 19
	.4byte _08053B90 @ case 20
	.4byte _08053B90 @ case 21
	.4byte _08053B90 @ case 22
	.4byte _08053AE0 @ case 23
	.4byte _08053AE4 @ case 24
	.4byte _08053AEA @ case 25
	.4byte _08053AEE @ case 26
	.4byte _08053AF4 @ case 27
	.4byte _08053AF8 @ case 28
	.4byte _08053AFE @ case 29
	.4byte _08053B02 @ case 30
	.4byte _08053B08 @ case 31
	.4byte _08053B0C @ case 32
	.4byte _08053B90 @ case 33
	.4byte _08053B90 @ case 34
	.4byte _08053B90 @ case 35
	.4byte _08053B90 @ case 36
	.4byte _08053B90 @ case 37
	.4byte _08053B90 @ case 38
	.4byte _08053B4E @ case 39
	.4byte _08053B52 @ case 40
	.4byte _08053B58 @ case 41
	.4byte _08053B5C @ case 42
	.4byte _08053B90 @ case 43
	.4byte _08053B62 @ case 44
	.4byte _08053B90 @ case 45
	.4byte _08053B68 @ case 46
	.4byte _08053B90 @ case 47
	.4byte _08053B90 @ case 48
	.4byte _08053B90 @ case 49
	.4byte _08053B90 @ case 50
	.4byte _08053B90 @ case 51
	.4byte _08053B90 @ case 52
	.4byte _08053B90 @ case 53
	.4byte _08053B90 @ case 54
	.4byte _08053B1C @ case 55
	.4byte _08053B20 @ case 56
	.4byte _08053B30 @ case 57
	.4byte _08053B34 @ case 58
	.4byte _08053B3A @ case 59
	.4byte _08053B3E @ case 60
	.4byte _08053B44 @ case 61
	.4byte _08053B48 @ case 62
	.4byte _08053B90 @ case 63
	.4byte _08053B90 @ case 64
	.4byte _08053B90 @ case 65
	.4byte _08053B90 @ case 66
	.4byte _08053B6E @ case 67
	.4byte _08053B72 @ case 68
	.4byte _08053B78 @ case 69
	.4byte _08053B7C @ case 70
	.4byte _08053B82 @ case 71
	.4byte _08053B86 @ case 72
	.4byte _08053B8C @ case 73
	.4byte _08053B90 @ case 74
	.4byte _08053B26 @ case 75
	.4byte _08053B2A @ case 76
_08053AD0:
	bl Box2Init
	b _08053B90
_08053AD6:
	bl Box2IdleInit
_08053ADA:
	bl Box2Crawling
	b _08053B90
_08053AE0:
	bl Box2WaitingToRunInit
_08053AE4:
	bl Box2WaitingToRun
	b _08053B90
_08053AEA:
	bl Box2SlowRunningInit
_08053AEE:
	bl Box2SlowRunning
	b _08053B90
_08053AF4:
	bl Box2FastRunningInit
_08053AF8:
	bl Box2FastRunning
	b _08053B90
_08053AFE:
	bl Box2SkiddingInit
_08053B02:
	bl Box2Skidding
	b _08053B90
_08053B08:
	bl Box2StopSkiddingInit
_08053B0C:
	bl Box2StopSkidding
	b _08053B90
_08053B12:
	bl Box2FinishedCrawlingInit
_08053B16:
	bl Box2FinishCrawling
	b _08053B90
_08053B1C:
	bl Box2BonkingInit
_08053B20:
	bl Box2Bonking
	b _08053B90
_08053B26:
	bl Box2LandingFromBonkInit
_08053B2A:
	bl Box2LandingFromBonk
	b _08053B90
_08053B30:
	bl Box2LandingInit
_08053B34:
	bl Box2Landing
	b _08053B90
_08053B3A:
	bl Box2JumpWarningInit
_08053B3E:
	bl Box2JumpWarning
	b _08053B90
_08053B44:
	bl Box2JumpingInit
_08053B48:
	bl Box2Jumping
	b _08053B90
_08053B4E:
	bl Box2StoppingToFireMissilesInit
_08053B52:
	bl Box2StoppingToFireMissiles
	b _08053B90
_08053B58:
	bl Box2LoweringToFireMissilesInit
_08053B5C:
	bl Box2LoweringToFireMissiles
	b _08053B90
_08053B62:
	bl Box2FiringMissiles
	b _08053B90
_08053B68:
	bl Box2DoneFiringMissiles
	b _08053B90
_08053B6E:
	bl Box2DyingInit
_08053B72:
	bl Box2Dying
	b _08053B90
_08053B78:
	bl Box2ExplodingInit
_08053B7C:
	bl Box2Exploding
	b _08053B90
_08053B82:
	bl Box2BrainRisingInit
_08053B86:
	bl Box2BrainRising
	b _08053B90
_08053B8C:
	bl Box2BrainFloating
_08053B90:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	pop {r0}
	bx r0

	thumb_func_start Box2Part
Box2Part: @ 0x08053B9C
	push {r4, lr}
	ldr r0, _08053BB4 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _08053BB8
	bl Box2PartInit
	b _08053C80
	.align 2, 0
_08053BB4: .4byte gCurrentSprite
_08053BB8:
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	beq _08053BF8
	cmp r0, #2
	bgt _08053BC8
	cmp r0, #0
	beq _08053BD2
	b _08053C60
_08053BC8:
	cmp r0, #6
	beq _08053C20
	cmp r0, #8
	beq _08053C38
	b _08053C60
_08053BD2:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08053BF4 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _08053BEA
	strb r3, [r4]
_08053BEA:
	bl Box2PartFrontLeftLeg
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _08053C80
	.align 2, 0
_08053BF4: .4byte gSubSpriteData1
_08053BF8:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08053C1C @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _08053C10
	strb r3, [r4]
_08053C10:
	bl Box2PartFrontRightLeg
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _08053C80
	.align 2, 0
_08053C1C: .4byte gSubSpriteData1
_08053C20:
	ldr r0, _08053C34 @ =gSubSpriteData1
	adds r1, r2, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	strb r1, [r0, #0xe]
	bl Box2PartTopShell
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _08053C80
	.align 2, 0
_08053C34: .4byte gSubSpriteData1
_08053C38:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08053C5C @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _08053C50
	strb r3, [r4]
_08053C50:
	bl Box2PartBottomShell
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _08053C80
	.align 2, 0
_08053C5C: .4byte gSubSpriteData1
_08053C60:
	adds r4, r2, #0
	adds r4, #0x2c
	ldrb r2, [r4]
	movs r0, #0x7f
	ldr r1, _08053C88 @ =gSubSpriteData1
	ldrb r3, [r1, #0xe]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bhs _08053C78
	strb r3, [r4]
_08053C78:
	bl Box2PartDefault
	bl Box2SyncSubSprites
_08053C80:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08053C88: .4byte gSubSpriteData1

	thumb_func_start Box2Missile
Box2Missile: @ 0x08053C8C
	push {lr}
	ldr r0, _08053CA4 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08053CB8
	cmp r0, #2
	bgt _08053CA8
	cmp r0, #0
	beq _08053CB2
	b _08053CC8
	.align 2, 0
_08053CA4: .4byte gCurrentSprite
_08053CA8:
	cmp r0, #0x18
	beq _08053CBE
	cmp r0, #0x37
	beq _08053CC4
	b _08053CC8
_08053CB2:
	bl Box2MissileInit
	b _08053CC8
_08053CB8:
	bl Box2MissileLaunching
	b _08053CC8
_08053CBE:
	bl Box2MissileMoving
	b _08053CC8
_08053CC4:
	bl Box2MissileExploding
_08053CC8:
	pop {r0}
	bx r0

	thumb_func_start Box2BrainTop
Box2BrainTop: @ 0x08053CCC
	push {lr}
	ldr r0, _08053CE8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _08053D02
	cmp r0, #0x18
	bgt _08053CEC
	cmp r0, #0
	beq _08053CF6
	cmp r0, #2
	beq _08053CFC
	b _08053D10
	.align 2, 0
_08053CE8: .4byte gCurrentSprite
_08053CEC:
	cmp r0, #0x45
	beq _08053D08
	cmp r0, #0x46
	beq _08053D0C
	b _08053D10
_08053CF6:
	bl Box2BrainTopInit
	b _08053D10
_08053CFC:
	bl Box2BrainTopRising
	b _08053D10
_08053D02:
	bl Box2BrainTopFloating
	b _08053D10
_08053D08:
	bl Box2BrainTopTransformingInit
_08053D0C:
	bl Box2BrainTopTransforming
_08053D10:
	pop {r0}
	bx r0

	thumb_func_start Box2BrainBottom
Box2BrainBottom: @ 0x08053D14
	push {lr}
	ldr r0, _08053D34 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08053D2C
	bl Box2BrainBottomInit
_08053D2C:
	bl Box2BrainBottomIdle
	pop {r0}
	bx r0
	.align 2, 0
_08053D34: .4byte gCurrentSprite

	thumb_func_start OmagaMetroidSyncSubSPrites
OmagaMetroidSyncSubSPrites: @ 0x08053D38
	push {r4, lr}
	ldr r4, _08053D94 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08053D98 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08053D9C @ =0x0879B634
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _08053D6A
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_08053D6A:
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
_08053D94: .4byte gSubSpriteData1
_08053D98: .4byte gCurrentSprite
_08053D9C: .4byte 0x0879B634

	thumb_func_start OmegaMetroidPartSetDrawOrder
OmegaMetroidPartSetDrawOrder: @ 0x08053DA0
	push {lr}
	ldr r0, _08053DB8 @ =gCurrentSprite
	ldrb r2, [r0, #0x1e]
	adds r3, r0, #0
	cmp r2, #7
	bhi _08053DF8
	lsls r0, r2, #2
	ldr r1, _08053DBC @ =_08053DC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08053DB8: .4byte gCurrentSprite
_08053DBC: .4byte _08053DC0
_08053DC0: @ jump table
	.4byte _08053DE0 @ case 0
	.4byte _08053DE0 @ case 1
	.4byte _08053DE0 @ case 2
	.4byte _08053DF8 @ case 3
	.4byte _08053DF0 @ case 4
	.4byte _08053DE8 @ case 5
	.4byte _08053DF0 @ case 6
	.4byte _08053DF0 @ case 7
_08053DE0:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #3
	b _08053DF6
_08053DE8:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #5
	b _08053DF6
_08053DF0:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xc
_08053DF6:
	strb r0, [r1]
_08053DF8:
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidPartSetDrawOrder_2
OmegaMetroidPartSetDrawOrder_2: @ 0x08053DFC
	push {lr}
	ldr r1, _08053E10 @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	blt _08053E22
	cmp r0, #2
	bgt _08053E14
	adds r1, #0x22
	movs r0, #0xb
	b _08053E20
	.align 2, 0
_08053E10: .4byte gCurrentSprite
_08053E14:
	cmp r0, #7
	bgt _08053E22
	cmp r0, #4
	blt _08053E22
	adds r1, #0x22
	movs r0, #0xd
_08053E20:
	strb r0, [r1]
_08053E22:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidUpdatePalette
OmegaMetroidUpdatePalette: @ 0x08053E28
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r0, _08053E4C @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r2, _08053E50 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r4, _08053E54 @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _08053E58
	cmp r1, #1
	beq _08053E70
	b _08053E86
	.align 2, 0
_08053E4C: .4byte gCurrentSprite
_08053E50: .4byte sPrimarySpriteStats
_08053E54: .4byte gBossWork1
_08053E58:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _08053E86
	ldr r6, _08053E6C @ =0x08399168
	movs r0, #1
	strb r0, [r4]
	b _08053E8A
	.align 2, 0
_08053E6C: .4byte 0x08399168
_08053E70:
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _08053E86
	ldr r6, _08053EB4 @ =0x08399188
	movs r0, #2
	strb r0, [r4]
	movs r7, #1
_08053E86:
	cmp r7, #0
	beq _08053EAC
_08053E8A:
	ldr r0, _08053EB8 @ =0x040000D4
	str r6, [r0]
	ldr r1, _08053EBC @ =0x05000340
	str r1, [r0, #4]
	ldr r2, _08053EC0 @ =0x8000000B
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r6, [r0]
	ldr r1, _08053EC4 @ =0x050003A0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	str r6, [r0]
	ldr r1, _08053EC8 @ =0x050003C0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_08053EAC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08053EB4: .4byte 0x08399188
_08053EB8: .4byte 0x040000D4
_08053EBC: .4byte 0x05000340
_08053EC0: .4byte 0x8000000B
_08053EC4: .4byte 0x050003A0
_08053EC8: .4byte 0x050003C0

	thumb_func_start OmegaMetroidSA_XIceBeamCollision
OmegaMetroidSA_XIceBeamCollision: @ 0x08053ECC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r2, _08053F80 @ =gCurrentSprite
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
	str r1, [sp, #0x14]
	ldrh r0, [r2, #0xe]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r2, #0x10]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	movs r0, #0
	mov r8, r0
_08053F0A:
	ldr r1, _08053F84 @ =gSpriteData
	mov r2, r8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08053F88
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08053F88
	ldrb r7, [r4, #0x1d]
	cmp r7, #0
	bne _08053F88
	ldrh r5, [r4, #2]
	ldrh r6, [r4, #4]
	ldrh r3, [r4, #0xa]
	adds r3, r5, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r2, [r4, #0xc]
	adds r2, r5, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r1, [r4, #0xe]
	adds r1, r6, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x10]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r3, [sp]
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, sl
	mov r3, sb
	bl CheckObjectsTouching
	cmp r0, #0
	beq _08053F88
	strh r7, [r4]
	movs r0, #2
	movs r1, #0x11
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
	b _08053F96
	.align 2, 0
_08053F80: .4byte gCurrentSprite
_08053F84: .4byte gSpriteData
_08053F88:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bls _08053F0A
_08053F96:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidUpdateHeartPalette
OmegaMetroidUpdateHeartPalette: @ 0x08053FA8
	push {lr}
	ldr r1, _08053FCC @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	beq _08053FF0
	adds r2, r1, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r0, #1
	movs r3, #0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x38
	bne _08053FD0
	movs r0, #1
	strb r0, [r2]
	b _08053FDE
	.align 2, 0
_08053FCC: .4byte gCurrentSprite
_08053FD0:
	cmp r0, #0xe
	bne _08053FDA
	adds r1, #0x20
	movs r0, #3
	b _08053FEE
_08053FDA:
	cmp r0, #0x1c
	bne _08053FE6
_08053FDE:
	adds r0, r1, #0
	adds r0, #0x20
	strb r3, [r0]
	b _08053FF0
_08053FE6:
	cmp r0, #0x2a
	bne _08053FF0
	adds r1, #0x20
	movs r0, #4
_08053FEE:
	strb r0, [r1]
_08053FF0:
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidUpdateHealthThreshold
OmegaMetroidUpdateHealthThreshold: @ 0x08053FF4
	push {r4, lr}
	bl EventCheckAfter_IceBeamRecovered
	cmp r0, #0
	beq _0805409C
	ldr r0, _08054014 @ =gCurrentSprite
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #0x10
	bne _0805401C
	ldr r0, _08054018 @ =0x00000222
	bl SoundPlayNotAlreadyPlaying
	b _08054026
	.align 2, 0
_08054014: .4byte gCurrentSprite
_08054018: .4byte 0x00000222
_0805401C:
	cmp r1, #0xe
	bne _08054026
	ldr r0, _0805405C @ =0x0000021B
	bl SoundPlayNotAlreadyPlaying
_08054026:
	ldr r4, _08054060 @ =gCurrentSprite
	ldrh r2, [r4, #0x14]
	cmp r2, #0
	bne _0805406C
	ldr r0, _08054064 @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _0805406C
	adds r0, r4, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x25
	strb r0, [r1]
	ldr r0, _08054068 @ =gBossWork5
	strh r2, [r0]
	movs r0, #0x6c
	bl EventCheckAdvance
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x3a
	bl ParticleSet
	b _08054094
	.align 2, 0
_0805405C: .4byte 0x0000021B
_08054060: .4byte gCurrentSprite
_08054064: .4byte gSubSpriteData1
_08054068: .4byte gBossWork5
_0805406C:
	ldr r3, _080540A4 @ =gBossWork5
	ldr r0, _080540A8 @ =gSubSpriteData1
	ldr r2, _080540AC @ =gCurrentSprite
	ldrh r0, [r0, #0xc]
	ldrh r1, [r2, #0x14]
	subs r0, r0, r1
	ldrh r1, [r3]
	adds r0, r0, r1
	strh r0, [r3]
	lsls r0, r0, #0x10
	movs r1, #0x96
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08054094
	adds r0, r2, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x25
	strb r1, [r0]
	strh r2, [r3]
_08054094:
	ldr r0, _080540A8 @ =gSubSpriteData1
	ldr r1, _080540AC @ =gCurrentSprite
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0xc]
_0805409C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080540A4: .4byte gBossWork5
_080540A8: .4byte gSubSpriteData1
_080540AC: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidCheckSamusOnLowHealth
OmegaMetroidCheckSamusOnLowHealth: @ 0x080540B0
	push {lr}
	ldr r0, _080540C8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3f
	bne _080540D0
	ldr r0, _080540CC @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0x62
	bhi _080540D0
	movs r0, #1
	b _080540D2
	.align 2, 0
_080540C8: .4byte gSamusData
_080540CC: .4byte gEquipment
_080540D0:
	movs r0, #0
_080540D2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMetroidBodyBlinking
OmegaMetroidBodyBlinking: @ 0x080540D8
	push {lr}
	ldr r2, _0805411C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08054110
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805410A
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805410A:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08054110:
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805411C: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidFullBodyBlinking
OmegaMetroidFullBodyBlinking: @ 0x08054120
	push {lr}
	ldr r2, _08054164 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r1, [r1]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08054158
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08054152
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_08054152:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08054158:
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08054164: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidCheckSamusInFrontRange
OmegaMetroidCheckSamusInFrontRange: @ 0x08054168
	push {lr}
	movs r0, #0xe0
	lsls r0, r0, #1
	movs r1, #0xbe
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _08054194
	ldr r0, _0805418C @ =gSubSpriteData1
	ldr r1, _08054190 @ =gSamusData
	ldrh r0, [r0, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08054194
	movs r0, #1
	b _08054196
	.align 2, 0
_0805418C: .4byte gSubSpriteData1
_08054190: .4byte gSamusData
_08054194:
	movs r0, #0
_08054196:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMEtroidCheckBehindRightTrigger
OmegaMEtroidCheckBehindRightTrigger: @ 0x0805419C
	push {lr}
	ldr r0, _080541B8 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _080541BC @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xcc
	bhi _080541C0
	movs r0, #0
	b _080541C2
	.align 2, 0
_080541B8: .4byte gSubSpriteData1
_080541BC: .4byte gBg1XPosition
_080541C0:
	movs r0, #1
_080541C2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMetroidCheckInFrontOfMiddleTrigger
OmegaMetroidCheckInFrontOfMiddleTrigger: @ 0x080541C8
	push {lr}
	ldr r0, _080541E4 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _080541E8 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x78
	bls _080541EC
	movs r0, #0
	b _080541EE
	.align 2, 0
_080541E4: .4byte gSubSpriteData1
_080541E8: .4byte gBg1XPosition
_080541EC:
	movs r0, #1
_080541EE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMetroidCheckInFrontOfLeftTrigger
OmegaMetroidCheckInFrontOfLeftTrigger: @ 0x080541F4
	push {lr}
	ldr r0, _08054210 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _08054214 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x50
	bls _08054218
	movs r0, #0
	b _0805421A
	.align 2, 0
_08054210: .4byte gSubSpriteData1
_08054214: .4byte gBg1XPosition
_08054218:
	movs r0, #1
_0805421A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start OmegaMetroidXMovement
OmegaMetroidXMovement: @ 0x08054220
	push {r4, r5, lr}
	ldr r1, _0805424C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r4, [r0]
	adds r5, r4, #0
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08054254
	bl OmegaMEtroidCheckBehindRightTrigger
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08054268
	ldr r1, _08054250 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, r4, r0
	b _08054266
	.align 2, 0
_0805424C: .4byte gCurrentSprite
_08054250: .4byte gSubSpriteData1
_08054254:
	bl OmegaMetroidCheckInFrontOfLeftTrigger
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _08054268
	ldr r1, _08054270 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, r0, r5
_08054266:
	strh r0, [r1, #0xa]
_08054268:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08054270: .4byte gSubSpriteData1

	thumb_func_start OmegaMetroidBackwardsMovement
OmegaMetroidBackwardsMovement: @ 0x08054274
	push {lr}
	ldr r1, _0805428C @ =gSubSpriteData1
	ldrh r0, [r1, #4]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #7
	bhi _080542EC
	lsls r0, r0, #2
	ldr r1, _08054290 @ =_08054294
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805428C: .4byte gSubSpriteData1
_08054290: .4byte _08054294
_08054294: @ jump table
	.4byte _080542B4 @ case 0
	.4byte _080542B8 @ case 1
	.4byte _080542BC @ case 2
	.4byte _080542EC @ case 3
	.4byte _080542B4 @ case 4
	.4byte _080542B8 @ case 5
	.4byte _080542D0 @ case 6
	.4byte _080542D8 @ case 7
_080542B4:
	movs r1, #2
	b _080542EE
_080542B8:
	movs r1, #3
	b _080542EE
_080542BC:
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _080542D0
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080542D4 @ =0x0000021D
	bl SoundPlay
_080542D0:
	movs r1, #4
	b _080542EE
	.align 2, 0
_080542D4: .4byte 0x0000021D
_080542D8:
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _080542EC
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _08054300 @ =0x0000021D
	bl SoundPlay
_080542EC:
	movs r1, #0
_080542EE:
	ldr r0, _08054304 @ =gCurrentSprite
	adds r0, #0x30
	strb r1, [r0]
	bl OmegaMetroidXMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08054300: .4byte 0x0000021D
_08054304: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidForwardMovement
OmegaMetroidForwardMovement: @ 0x08054308
	push {lr}
	ldr r0, _08054320 @ =gSubSpriteData1
	ldrh r1, [r0, #4]
	adds r2, r0, #0
	cmp r1, #7
	bhi _08054380
	lsls r0, r1, #2
	ldr r1, _08054324 @ =_08054328
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08054320: .4byte gSubSpriteData1
_08054324: .4byte _08054328
_08054328: @ jump table
	.4byte _0805435C @ case 0
	.4byte _08054348 @ case 1
	.4byte _08054380 @ case 2
	.4byte _08054380 @ case 3
	.4byte _0805435C @ case 4
	.4byte _08054364 @ case 5
	.4byte _08054368 @ case 6
	.4byte _0805436C @ case 7
_08054348:
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _0805435C
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _08054360 @ =0x0000021D
	bl SoundPlay
_0805435C:
	movs r2, #2
	b _08054382
	.align 2, 0
_08054360: .4byte 0x0000021D
_08054364:
	movs r2, #3
	b _08054382
_08054368:
	movs r2, #4
	b _08054382
_0805436C:
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _08054380
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080543B8 @ =0x0000021D
	bl SoundPlay
_08054380:
	movs r2, #0
_08054382:
	ldr r0, _080543BC @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r3, r0, #0
	cmp r1, #0x24
	beq _0805439A
	cmp r2, #0
	beq _0805439A
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0805439A:
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	bl OmegaMetroidXMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080543B4
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080543B4:
	pop {r1}
	bx r1
	.align 2, 0
_080543B8: .4byte 0x0000021D
_080543BC: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidSlowMovement
OmegaMetroidSlowMovement: @ 0x080543C0
	push {lr}
	ldr r0, _080543D4 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0x24
	beq _080543D8
	movs r1, #0
	b _080543E2
	.align 2, 0
_080543D4: .4byte gCurrentSprite
_080543D8:
	ldr r0, _08054400 @ =gSubSpriteData1
	ldrh r1, [r0, #4]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
_080543E2:
	adds r0, r2, #0
	adds r0, #0x30
	strb r1, [r0]
	bl OmegaMetroidXMovement
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080543FC
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_080543FC:
	pop {r1}
	bx r1
	.align 2, 0
_08054400: .4byte gSubSpriteData1

	thumb_func_start OmegaMetroidStandingMovement
OmegaMetroidStandingMovement: @ 0x08054404
	push {r4, lr}
	ldr r0, _08054420 @ =gCurrentSprite
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	movs r4, #0
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054424
	movs r4, #2
	b _08054430
	.align 2, 0
_08054420: .4byte gCurrentSprite
_08054424:
	bl OmegaMetroidXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054430
	movs r4, #1
_08054430:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start OmegaMetroidInit
OmegaMetroidInit: @ 0x08054438
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	ldr r1, _080545E0 @ =gBossWork1
	movs r0, #0
	strb r0, [r1]
	ldr r7, _080545E4 @ =gCurrentSprite
	ldrh r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r3, r1, #0
	movs r6, #0
	movs r5, #0
	orrs r3, r0
	strh r3, [r7]
	adds r2, r7, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrh r0, [r7, #2]
	mov r8, r0
	ldrh r1, [r7, #4]
	mov sb, r1
	strh r0, [r7, #6]
	strh r1, [r7, #8]
	ldr r1, _080545E8 @ =gAbilityRestingYPosition
	ldr r0, _080545EC @ =0xFFFFFE80
	add r0, r8
	strh r0, [r1]
	ldr r1, _080545F0 @ =gAbilityRestingXPosition
	ldr r0, _080545F4 @ =0xFFFFFDC0
	add r0, sb
	strh r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r1, r0, #0
	ldrh r0, [r7, #4]
	adds r1, r1, r0
	strh r1, [r7, #4]
	ldr r4, _080545F8 @ =gSubSpriteData1
	ldrh r0, [r7, #2]
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x27
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r7, #0
	adds r1, #0x29
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _080545FC @ =0x0000FF90
	strh r0, [r7, #0xa]
	movs r1, #0x40
	strh r1, [r7, #0xc]
	adds r0, #0x10
	strh r0, [r7, #0xe]
	strh r1, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	movs r0, #3
	strb r0, [r7, #0x1e]
	ldr r2, _08054600 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
	strh r0, [r4, #0xc]
	ldr r0, _08054604 @ =gBossWork5
	strh r5, [r0]
	ldr r0, _08054608 @ =0x083966A0
	str r0, [r4]
	strb r6, [r4, #6]
	strh r5, [r4, #4]
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #0x16
	strb r0, [r1]
	ldr r0, _0805460C @ =0x0000FDFF
	ands r3, r0
	strh r3, [r7]
	subs r1, #1
	movs r0, #0x37
	strb r0, [r1]
	adds r1, #0xd
	movs r0, #1
	strb r0, [r1]
	subs r1, #3
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x2d
	strb r6, [r0]
	subs r0, #2
	strb r6, [r0]
	ldrb r2, [r7, #0x1f]
	adds r6, r7, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #5
	bl SpriteSpawnSecondary
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x70
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r3, [r6]
	movs r0, #0x10
	str r0, [sp]
	mov r1, r8
	str r1, [sp, #4]
	mov r0, sb
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x4c
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	adds r1, r7, #0
	adds r1, #0x2f
	strb r0, [r1]
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080545E0: .4byte gBossWork1
_080545E4: .4byte gCurrentSprite
_080545E8: .4byte gAbilityRestingYPosition
_080545EC: .4byte 0xFFFFFE80
_080545F0: .4byte gAbilityRestingXPosition
_080545F4: .4byte 0xFFFFFDC0
_080545F8: .4byte gSubSpriteData1
_080545FC: .4byte 0x0000FF90
_08054600: .4byte sPrimarySpriteStats
_08054604: .4byte gBossWork5
_08054608: .4byte 0x083966A0
_0805460C: .4byte 0x0000FDFF

	thumb_func_start OmegaMetroidWaitingToAppear
OmegaMetroidWaitingToAppear: @ 0x08054610
	push {lr}
	ldr r2, _08054648 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _08054642
	adds r1, #8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08054642
	subs r1, #0xa
	movs r0, #0x38
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0805464C @ =0x00007FFF
	ands r0, r1
	strh r0, [r2]
_08054642:
	pop {r0}
	bx r0
	.align 2, 0
_08054648: .4byte gCurrentSprite
_0805464C: .4byte 0x00007FFF

	thumb_func_start OmegaMetroidFirstJump
OmegaMetroidFirstJump: @ 0x08054650
	push {r4, r5, r6, r7, lr}
	ldr r1, _08054688 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, #0x10
	strh r0, [r1, #0xa]
	ldr r3, _0805468C @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r4, [r0]
	ldr r7, _08054690 @ =0x08395900
	lsls r0, r4, #1
	adds r0, r0, r7
	ldrh r6, [r0]
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r0, _08054694 @ =0x00007FFF
	adds r5, r1, #0
	cmp r2, r0
	bne _08054698
	subs r1, r4, #1
	lsls r1, r1, #1
	adds r1, r1, r7
	ldrh r0, [r5, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080546A2
	.align 2, 0
_08054688: .4byte gSubSpriteData1
_0805468C: .4byte gCurrentSprite
_08054690: .4byte 0x08395900
_08054694: .4byte 0x00007FFF
_08054698:
	adds r0, r4, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r5, #8]
	adds r0, r0, r6
_080546A2:
	strh r0, [r5, #8]
	adds r1, r3, #0
	ldrh r4, [r1, #6]
	ldrh r0, [r5, #8]
	cmp r0, r4
	bls _080546DC
	movs r2, #0
	movs r3, #0
	strh r4, [r5, #8]
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	ldr r0, _080546D4 @ =0x083966B8
	str r0, [r5]
	strb r2, [r5, #6]
	strh r3, [r5, #4]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080546D8 @ =0x0000021F
	bl SoundPlay
	b _0805470E
	.align 2, 0
_080546D4: .4byte 0x083966B8
_080546D8: .4byte 0x0000021F
_080546DC:
	ldrh r1, [r5, #8]
	ldrh r0, [r3, #6]
	subs r0, #0x78
	cmp r1, r0
	ble _0805470E
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x10
	bls _0805470E
	ldr r2, _08054714 @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r3, r0, #0
	adds r3, #0x24
	ldrb r0, [r3]
	cmp r0, #8
	bne _0805470E
	movs r0, #0x17
	strb r0, [r3]
_0805470E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08054714: .4byte gSpriteData

	thumb_func_start OmegaMetroidLandingFromFirstJump
OmegaMetroidLandingFromFirstJump: @ 0x08054718
	push {lr}
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054736
	ldr r1, _0805473C @ =gSubSpriteData1
	ldr r0, _08054740 @ =0x08396858
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08054744 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3c
	strb r1, [r0]
_08054736:
	pop {r0}
	bx r0
	.align 2, 0
_0805473C: .4byte gSubSpriteData1
_08054740: .4byte 0x08396858
_08054744: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidLandedAfterFirstJump
OmegaMetroidLandedAfterFirstJump: @ 0x08054748
	push {lr}
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054774
	ldr r1, _08054778 @ =gSubSpriteData1
	ldr r0, _0805477C @ =0x08396870
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08054780 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3e
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _08054784 @ =0x00000219
	bl SoundPlay
_08054774:
	pop {r0}
	bx r0
	.align 2, 0
_08054778: .4byte gSubSpriteData1
_0805477C: .4byte 0x08396870
_08054780: .4byte gCurrentSprite
_08054784: .4byte 0x00000219

	thumb_func_start OmegaMetroidScreamingAfterFirstJump
OmegaMetroidScreamingAfterFirstJump: @ 0x08054788
	push {lr}
	ldr r3, _080547B4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080547B0
	ldr r0, _080547B8 @ =gSubSpriteData1
	ldr r1, _080547BC @ =0x08396898
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x40
	strb r0, [r1]
_080547B0:
	pop {r0}
	bx r0
	.align 2, 0
_080547B4: .4byte gCurrentSprite
_080547B8: .4byte gSubSpriteData1
_080547BC: .4byte 0x08396898

	thumb_func_start OmegaMetroidFinishedScreamingAfterFirstJump
OmegaMetroidFinishedScreamingAfterFirstJump: @ 0x080547C0
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080547FC
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r3, _080547EC @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080547F0
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2b
	strb r0, [r1]
	b _080547FC
	.align 2, 0
_080547EC: .4byte gCurrentSprite
_080547F0:
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x1f
	strb r1, [r0]
	adds r0, #9
	strb r2, [r0]
_080547FC:
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidJumpWarningInit
OmegaMetroidJumpWarningInit: @ 0x08054800
	push {lr}
	ldr r1, _08054820 @ =gSubSpriteData1
	ldr r0, _08054824 @ =0x08396688
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08054828 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	ldr r0, _0805482C @ =0x0000021E
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_08054820: .4byte gSubSpriteData1
_08054824: .4byte 0x08396688
_08054828: .4byte gCurrentSprite
_0805482C: .4byte 0x0000021E

	thumb_func_start OmegaMetroidJumpWarning
OmegaMetroidJumpWarning: @ 0x08054830
	push {lr}
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054856
	ldr r1, _0805485C @ =gSubSpriteData1
	ldr r0, _08054860 @ =0x083966A0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r0, _08054864 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x31
	strb r2, [r1]
	adds r0, #0x24
	movs r1, #0x1a
	strb r1, [r0]
_08054856:
	pop {r0}
	bx r0
	.align 2, 0
_0805485C: .4byte gSubSpriteData1
_08054860: .4byte 0x083966A0
_08054864: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidJumping
OmegaMetroidJumping: @ 0x08054868
	push {r4, r5, r6, lr}
	ldr r5, _08054894 @ =gCurrentSprite
	adds r3, r5, #0
	adds r3, #0x31
	ldrb r2, [r3]
	ldr r1, _08054898 @ =0x08395948
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0805489C @ =0x00007FFF
	cmp r1, r0
	bne _080548A0
	adds r0, r5, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x1c
	strb r1, [r0]
	strb r2, [r3]
	b _080548B0
	.align 2, 0
_08054894: .4byte gCurrentSprite
_08054898: .4byte 0x08395948
_0805489C: .4byte 0x00007FFF
_080548A0:
	adds r0, r2, #1
	strb r0, [r3]
	ldr r1, _080548B8 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
	bl OmegaMetroidXMovement
_080548B0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080548B8: .4byte gSubSpriteData1

	thumb_func_start OmegaMEtroidFalling
OmegaMEtroidFalling: @ 0x080548BC
	push {r4, r5, r6, lr}
	ldr r0, _080548EC @ =gCurrentSprite
	adds r5, r0, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _080548F0 @ =0x08395978
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080548F4 @ =0x00007FFF
	cmp r1, r0
	bne _080548FC
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _080548F8 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #8]
	adds r4, r2, #0
	b _0805490A
	.align 2, 0
_080548EC: .4byte gCurrentSprite
_080548F0: .4byte 0x08395978
_080548F4: .4byte 0x00007FFF
_080548F8: .4byte gSubSpriteData1
_080548FC:
	adds r0, r2, #1
	strb r0, [r5]
	ldr r1, _08054944 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
	adds r4, r1, #0
_0805490A:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r0, _08054948 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08054938
	strh r2, [r4, #8]
	ldr r0, _0805494C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1d
	strb r1, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _08054950 @ =0x0000021F
	bl SoundPlay
_08054938:
	bl OmegaMetroidXMovement
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08054944: .4byte gSubSpriteData1
_08054948: .4byte gPreviousVerticalCollisionCheck
_0805494C: .4byte gCurrentSprite
_08054950: .4byte 0x0000021F

	thumb_func_start OmegaMetroidLandingInit
OmegaMetroidLandingInit: @ 0x08054954
	ldr r1, _0805496C @ =gSubSpriteData1
	ldr r0, _08054970 @ =0x083966B8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08054974 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1e
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805496C: .4byte gSubSpriteData1
_08054970: .4byte 0x083966B8
_08054974: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidLanding
OmegaMetroidLanding: @ 0x08054978
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080549E0
	bl EventCheckAfter_SaXKilledByOmega
	cmp r0, #0
	bne _080549B0
	bl OmegaMetroidCheckSamusOnLowHealth
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080549B0
	ldr r1, _080549A8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	ldrh r2, [r1]
	ldr r0, _080549AC @ =0x0000FDFF
	ands r0, r2
	strh r0, [r1]
	b _080549E0
	.align 2, 0
_080549A8: .4byte gCurrentSprite
_080549AC: .4byte 0x0000FDFF
_080549B0:
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r3, _080549D0 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _080549D4
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2b
	strb r0, [r1]
	b _080549E0
	.align 2, 0
_080549D0: .4byte gCurrentSprite
_080549D4:
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x1f
	strb r1, [r0]
	adds r0, #9
	strb r2, [r0]
_080549E0:
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidIdleInit
OmegaMetroidIdleInit: @ 0x080549E4
	push {lr}
	ldr r0, _080549FC @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x2d
	ldrb r2, [r2]
	adds r3, r0, #0
	cmp r2, #1
	bne _08054A08
	ldr r1, _08054A00 @ =gSubSpriteData1
	ldr r0, _08054A04 @ =0x08396600
	b _08054A20
	.align 2, 0
_080549FC: .4byte gCurrentSprite
_08054A00: .4byte gSubSpriteData1
_08054A04: .4byte 0x08396600
_08054A08:
	cmp r2, #2
	bne _08054A1C
	ldr r1, _08054A14 @ =gSubSpriteData1
	ldr r0, _08054A18 @ =0x08396730
	b _08054A20
	.align 2, 0
_08054A14: .4byte gSubSpriteData1
_08054A18: .4byte 0x08396730
_08054A1C:
	ldr r1, _08054A34 @ =gSubSpriteData1
	ldr r0, _08054A38 @ =0x083965D8
_08054A20:
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08054A34: .4byte gSubSpriteData1
_08054A38: .4byte 0x083965D8

	thumb_func_start OmegaMetroidIdle
OmegaMetroidIdle: @ 0x08054A3C
	push {r4, lr}
	ldr r0, _08054A94 @ =gCurrentSprite
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08054A5E
	ldr r0, _08054A98 @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _08054A9C @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _08054A5E
	ldr r0, _08054AA0 @ =0x00000223
	bl SoundPlay
_08054A5E:
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054AF2
	bl EventCheckAfter_SaXKilledByOmega
	cmp r0, #0
	bne _08054AA4
	bl OmegaMetroidCheckSamusOnLowHealth
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054AA4
	ldr r1, _08054A94 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x17
	strb r0, [r2]
	adds r1, #0x30
	movs r0, #0x14
	b _08054AF0
	.align 2, 0
_08054A94: .4byte gCurrentSprite
_08054A98: .4byte gSubSpriteData1
_08054A9C: .4byte 0x00FFFFFF
_08054AA0: .4byte 0x00000223
_08054AA4:
	bl SpriteUtilMakeSpriteFaceSamusDirection
	ldr r4, _08054AC4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08054AC8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #0x14
	b _08054AF0
	.align 2, 0
_08054AC4: .4byte gCurrentSprite
_08054AC8:
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054ADA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	b _08054AF0
_08054ADA:
	bl EventCheckAfter_SaXKilledByOmega
	cmp r0, #0
	beq _08054AEA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x23
	b _08054AF0
_08054AEA:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
_08054AF0:
	strb r0, [r1]
_08054AF2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidWalkingBeforeSA_XInit
OmegaMetroidWalkingBeforeSA_XInit: @ 0x08054AF8
	ldr r1, _08054B14 @ =gSubSpriteData1
	ldr r0, _08054B18 @ =0x08396758
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08054B1C @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	movs r2, #2
	strb r2, [r1]
	adds r0, #0x2d
	strb r2, [r0]
	bx lr
	.align 2, 0
_08054B14: .4byte gSubSpriteData1
_08054B18: .4byte 0x08396758
_08054B1C: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidWalkingBeforeSA_X
OmegaMetroidWalkingBeforeSA_X: @ 0x08054B20
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08054B58 @ =gCurrentSprite
	movs r0, #0x30
	adds r0, r0, r4
	mov r8, r0
	movs r6, #0
	strb r6, [r0]
	adds r7, r4, #0
	adds r7, #0x2d
	ldrb r0, [r7]
	cmp r0, #2
	bne _08054B64
	bl OmegaMetroidForwardMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054BAC
	ldr r0, _08054B5C @ =gSubSpriteData1
	ldr r1, _08054B60 @ =0x083967C8
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	movs r0, #3
	strb r0, [r7]
	b _08054BAC
	.align 2, 0
_08054B58: .4byte gCurrentSprite
_08054B5C: .4byte gSubSpriteData1
_08054B60: .4byte 0x083967C8
_08054B64:
	bl OmegaMetroidStandingMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054BAC
	cmp r5, #2
	bne _08054B82
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08054BAC
_08054B82:
	cmp r5, #1
	bne _08054BA2
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	movs r0, #0x14
	mov r1, r8
	strb r0, [r1]
	b _08054BAC
_08054BA2:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	strb r6, [r7]
_08054BAC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidSlowWalkInit
OmegaMetroidSlowWalkInit: @ 0x08054BB8
	ldr r1, _08054BD8 @ =gSubSpriteData1
	ldr r0, _08054BDC @ =0x08396758
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08054BE0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x22
	strb r0, [r2]
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08054BD8: .4byte gSubSpriteData1
_08054BDC: .4byte 0x08396758
_08054BE0: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidSlowWalk
OmegaMetroidSlowWalk: @ 0x08054BE4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08054C0C @ =gCurrentSprite
	movs r0, #0x30
	adds r0, r0, r4
	mov r8, r0
	movs r6, #0
	strb r6, [r0]
	adds r7, r4, #0
	adds r7, #0x2d
	ldrb r0, [r7]
	cmp r0, #1
	beq _08054C4E
	cmp r0, #1
	bgt _08054C10
	cmp r0, #0
	beq _08054C1A
	b _08054CFC
	.align 2, 0
_08054C0C: .4byte gCurrentSprite
_08054C10:
	cmp r0, #2
	beq _08054C90
	cmp r0, #3
	beq _08054CB4
	b _08054CFC
_08054C1A:
	bl OmegaMetroidSlowMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054CFC
	ldr r0, _08054C40 @ =gSubSpriteData1
	ldr r1, _08054C44 @ =0x08396758
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	cmp r5, #0
	beq _08054C48
	movs r0, #2
	strb r0, [r7]
	b _08054CFC
	.align 2, 0
_08054C40: .4byte gSubSpriteData1
_08054C44: .4byte 0x08396758
_08054C48:
	movs r0, #1
	strb r0, [r7]
	b _08054CFC
_08054C4E:
	bl OmegaMetroidForwardMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054CFC
	cmp r5, #0
	beq _08054C78
	ldr r0, _08054C70 @ =gSubSpriteData1
	ldr r1, _08054C74 @ =0x083967C8
	str r1, [r0]
	movs r1, #3
	strb r1, [r7]
	adds r1, r0, #0
	b _08054C80
	.align 2, 0
_08054C70: .4byte gSubSpriteData1
_08054C74: .4byte 0x083967C8
_08054C78:
	ldr r1, _08054C88 @ =gSubSpriteData1
	ldr r0, _08054C8C @ =0x083967B0
	str r0, [r1]
	strb r6, [r7]
_08054C80:
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	b _08054CFC
	.align 2, 0
_08054C88: .4byte gSubSpriteData1
_08054C8C: .4byte 0x083967B0
_08054C90:
	bl OmegaMetroidForwardMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054CFC
	ldr r0, _08054CAC @ =gSubSpriteData1
	ldr r1, _08054CB0 @ =0x083967C8
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	movs r0, #3
	strb r0, [r7]
	b _08054CFC
	.align 2, 0
_08054CAC: .4byte gSubSpriteData1
_08054CB0: .4byte 0x083967C8
_08054CB4:
	bl OmegaMetroidStandingMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054CFC
	cmp r5, #2
	bne _08054CD2
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08054CFC
_08054CD2:
	cmp r5, #1
	bne _08054CF2
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	movs r0, #0x14
	mov r1, r8
	strb r0, [r1]
	b _08054CFC
_08054CF2:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	strb r6, [r7]
_08054CFC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidWalkInit
OmegaMetroidWalkInit: @ 0x08054D08
	ldr r1, _08054D28 @ =gSubSpriteData1
	ldr r0, _08054D2C @ =0x083967D8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08054D30 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x24
	strb r0, [r2]
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_08054D28: .4byte gSubSpriteData1
_08054D2C: .4byte 0x083967D8
_08054D30: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidWalk
OmegaMetroidWalk: @ 0x08054D34
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08054D5C @ =gCurrentSprite
	movs r0, #0x30
	adds r0, r0, r4
	mov r8, r0
	movs r6, #0
	strb r6, [r0]
	adds r7, r4, #0
	adds r7, #0x2d
	ldrb r0, [r7]
	cmp r0, #1
	beq _08054D9E
	cmp r0, #1
	bgt _08054D60
	cmp r0, #0
	beq _08054D6A
	b _08054E4C
	.align 2, 0
_08054D5C: .4byte gCurrentSprite
_08054D60:
	cmp r0, #2
	beq _08054DE0
	cmp r0, #3
	beq _08054E04
	b _08054E4C
_08054D6A:
	bl OmegaMetroidSlowMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054E4C
	ldr r0, _08054D90 @ =gSubSpriteData1
	ldr r1, _08054D94 @ =0x083967D8
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	cmp r5, #0
	beq _08054D98
	movs r0, #2
	strb r0, [r7]
	b _08054E4C
	.align 2, 0
_08054D90: .4byte gSubSpriteData1
_08054D94: .4byte 0x083967D8
_08054D98:
	movs r0, #1
	strb r0, [r7]
	b _08054E4C
_08054D9E:
	bl OmegaMetroidForwardMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054E4C
	cmp r5, #0
	beq _08054DC8
	ldr r0, _08054DC0 @ =gSubSpriteData1
	ldr r1, _08054DC4 @ =0x08396848
	str r1, [r0]
	movs r1, #3
	strb r1, [r7]
	adds r1, r0, #0
	b _08054DD0
	.align 2, 0
_08054DC0: .4byte gSubSpriteData1
_08054DC4: .4byte 0x08396848
_08054DC8:
	ldr r1, _08054DD8 @ =gSubSpriteData1
	ldr r0, _08054DDC @ =0x08396830
	str r0, [r1]
	strb r6, [r7]
_08054DD0:
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	b _08054E4C
	.align 2, 0
_08054DD8: .4byte gSubSpriteData1
_08054DDC: .4byte 0x08396830
_08054DE0:
	bl OmegaMetroidForwardMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054E4C
	ldr r0, _08054DFC @ =gSubSpriteData1
	ldr r1, _08054E00 @ =0x08396848
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	movs r0, #3
	strb r0, [r7]
	b _08054E4C
	.align 2, 0
_08054DFC: .4byte gSubSpriteData1
_08054E00: .4byte 0x08396848
_08054E04:
	bl OmegaMetroidStandingMovement
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054E4C
	cmp r5, #2
	bne _08054E22
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08054E4C
_08054E22:
	cmp r5, #1
	bne _08054E42
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	movs r0, #0x14
	mov r1, r8
	strb r0, [r1]
	b _08054E4C
_08054E42:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	strb r6, [r7]
_08054E4C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidSwipingInit
OmegaMetroidSwipingInit: @ 0x08054E58
	push {r4, lr}
	ldr r1, _08054E8C @ =gSubSpriteData1
	ldr r0, _08054E90 @ =0x08396918
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r4, _08054E94 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bl EventCheckAfter_SaXKilledByOmega
	cmp r0, #0
	beq _08054E9C
	ldr r0, _08054E98 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r2, r0, #2
	cmp r2, #0
	bne _08054E84
	movs r2, #1
_08054E84:
	adds r0, r4, #0
	adds r0, #0x2e
	strb r2, [r0]
	b _08054EA4
	.align 2, 0
_08054E8C: .4byte gSubSpriteData1
_08054E90: .4byte 0x08396918
_08054E94: .4byte gCurrentSprite
_08054E98: .4byte gSpriteRandomNumber
_08054E9C:
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #3
	strb r0, [r1]
_08054EA4:
	ldr r0, _08054ED4 @ =gCurrentSprite
	adds r0, #0x36
	ldrb r1, [r0]
	ldr r2, _08054ED8 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r2, r0, #0
	adds r2, #0x25
	movs r1, #0x15
	strb r1, [r2]
	movs r1, #0x40
	strh r1, [r0, #0xc]
	movs r1, #0x90
	strh r1, [r0, #0x10]
	movs r0, #0x88
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054ED4: .4byte gCurrentSprite
_08054ED8: .4byte gSpriteData

	thumb_func_start OmegaMetroidSwiping
OmegaMetroidSwiping: @ 0x08054EDC
	push {r4, lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08054FA4
	ldr r2, _08054F78 @ =gSubSpriteData1
	ldr r1, [r2]
	ldr r0, _08054F7C @ =0x08396918
	cmp r1, r0
	bne _08054EF4
	ldr r0, _08054F80 @ =0x083966D8
	str r0, [r2]
_08054EF4:
	bl EventCheckAfter_SaXKilledByOmega
	adds r1, r0, #0
	cmp r1, #0
	bne _08054F14
	ldr r0, _08054F84 @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0x62
	bhi _08054F14
	ldr r0, _08054F88 @ =gPoseLock
	ldrb r0, [r0]
	cmp r0, #0x80
	bne _08054F14
	ldr r0, _08054F8C @ =gCurrentSprite
	adds r0, #0x2e
	strb r1, [r0]
_08054F14:
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08054F26
	ldr r0, _08054F8C @ =gCurrentSprite
	adds r0, #0x2e
	strb r1, [r0]
_08054F26:
	ldr r4, _08054F8C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0
	bne _08054FD8
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldr r2, _08054F90 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r2, r0, #0
	adds r2, #0x25
	movs r1, #0x16
	strb r1, [r2]
	movs r1, #0x30
	strh r1, [r0, #0xc]
	movs r1, #0x40
	strh r1, [r0, #0x10]
	bl OmegaMetroidCheckInFrontOfMiddleTrigger
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08054F94
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #0x14
	strb r0, [r1]
	b _08054FD8
	.align 2, 0
_08054F78: .4byte gSubSpriteData1
_08054F7C: .4byte 0x08396918
_08054F80: .4byte 0x083966D8
_08054F84: .4byte gEquipment
_08054F88: .4byte gPoseLock
_08054F8C: .4byte gCurrentSprite
_08054F90: .4byte gSpriteData
_08054F94:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	adds r1, #9
	movs r0, #1
	strb r0, [r1]
	b _08054FD8
_08054FA4:
	ldr r0, _08054FC0 @ =gSubSpriteData1
	ldr r1, [r0, #4]
	ldr r0, _08054FC4 @ =0x00FFFFFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #9
	cmp r1, r0
	bne _08054FCC
	ldr r1, _08054FC8 @ =gCurrentSprite
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	b _08054FD8
	.align 2, 0
_08054FC0: .4byte gSubSpriteData1
_08054FC4: .4byte 0x00FFFFFF
_08054FC8: .4byte gCurrentSprite
_08054FCC:
	ldr r0, _08054FE0 @ =0x00010002
	cmp r1, r0
	bne _08054FD8
	ldr r0, _08054FE4 @ =0x00000221
	bl SoundPlay
_08054FD8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08054FE0: .4byte 0x00010002
_08054FE4: .4byte 0x00000221

	thumb_func_start OmegaMetroidVerticalJumpInit
OmegaMetroidVerticalJumpInit: @ 0x08054FE8
	ldr r1, _08055010 @ =gSubSpriteData1
	ldr r0, _08055014 @ =0x083966B8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08055018 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	adds r1, #1
	movs r0, #0x17
	strb r0, [r1]
	bx lr
	.align 2, 0
_08055010: .4byte gSubSpriteData1
_08055014: .4byte 0x083966B8
_08055018: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidVerticalJump
OmegaMetroidVerticalJump: @ 0x0805501C
	push {r4, r5, r6, lr}
	ldr r0, _0805504C @ =gCurrentSprite
	adds r5, r0, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _08055050 @ =0x08395990
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08055054 @ =0x00007FFF
	cmp r1, r0
	bne _0805505C
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _08055058 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #8]
	adds r4, r2, #0
	b _0805506A
	.align 2, 0
_0805504C: .4byte gCurrentSprite
_08055050: .4byte 0x08395990
_08055054: .4byte 0x00007FFF
_08055058: .4byte gSubSpriteData1
_0805505C:
	adds r0, r2, #1
	strb r0, [r5]
	ldr r1, _080550A4 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
	adds r4, r1, #0
_0805506A:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r2, r0, #0
	ldr r0, _080550A8 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080550C6
	strh r2, [r4, #8]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080550AC @ =0x0000021F
	bl SoundPlay
	ldr r2, _080550B0 @ =gCurrentSprite
	ldr r1, _080550B4 @ =gSamusData
	ldrh r0, [r2, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bhs _080550B8
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	b _080550C4
	.align 2, 0
_080550A4: .4byte gSubSpriteData1
_080550A8: .4byte gPreviousVerticalCollisionCheck
_080550AC: .4byte 0x0000021F
_080550B0: .4byte gCurrentSprite
_080550B4: .4byte gSamusData
_080550B8:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x16
_080550C4:
	strb r0, [r1]
_080550C6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start omegaMetroidSpawnSA_X
omegaMetroidSpawnSA_X: @ 0x080550CC
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _08055114 @ =gCurrentSprite
	ldr r0, _08055118 @ =0xFFFFFE80
	adds r1, r0, #0
	ldrh r2, [r4, #6]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _0805511C @ =0xFFFFFC80
	adds r0, r2, #0
	ldrh r2, [r4, #8]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r2, r4, #0
	adds r2, #0x23
	ldrb r3, [r2]
	movs r2, #0x10
	str r2, [sp]
	str r1, [sp, #4]
	subs r0, #0x20
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x4d
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	adds r4, #0x2f
	strb r0, [r4]
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055114: .4byte gCurrentSprite
_08055118: .4byte 0xFFFFFE80
_0805511C: .4byte 0xFFFFFC80

	thumb_func_start OmegaMetroidWaitingForSA_XInit
OmegaMetroidWaitingForSA_XInit: @ 0x08055120
	ldr r1, _08055148 @ =gSubSpriteData1
	ldr r0, _0805514C @ =0x083965D8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08055150 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r2, [r0]
	adds r1, #0xa
	movs r0, #9
	strb r0, [r1]
	bx lr
	.align 2, 0
_08055148: .4byte gSubSpriteData1
_0805514C: .4byte 0x083965D8
_08055150: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidWaitingForSA_X
OmegaMetroidWaitingForSA_X: @ 0x08055154
	push {r4, r5, lr}
	ldr r4, _08055194 @ =gSamusData
	ldrh r0, [r4, #0x18]
	subs r0, #0x20
	movs r2, #0x24
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #0x16]
	adds r1, r1, r2
	subs r1, #0x10
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08055198 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08055178
	ldrh r0, [r4, #0x16]
	subs r0, #8
	strh r0, [r4, #0x16]
_08055178:
	ldr r1, _0805519C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #6
	bls _08055188
	b _0805534A
_08055188:
	lsls r0, r0, #2
	ldr r1, _080551A0 @ =_080551A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055194: .4byte gSamusData
_08055198: .4byte gPreviousCollisionCheck
_0805519C: .4byte gCurrentSprite
_080551A0: .4byte _080551A4
_080551A4: @ jump table
	.4byte _080551C0 @ case 0
	.4byte _08055214 @ case 1
	.4byte _08055248 @ case 2
	.4byte _08055288 @ case 3
	.4byte _080552C8 @ case 4
	.4byte _080552F4 @ case 5
	.4byte _08055324 @ case 6
_080551C0:
	ldr r0, _080551E0 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080551E4
	ldrb r2, [r1]
	movs r0, #0x4d
	movs r1, #0
	bl SpriteLoadGfx
	b _080551F2
	.align 2, 0
_080551E0: .4byte gCurrentSprite
_080551E4:
	cmp r0, #8
	bne _080551F2
	movs r0, #0x4d
	movs r1, #0
	movs r2, #2
	bl SpriteLoadPal
_080551F2:
	ldr r1, _08055210 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	beq _08055200
	b _0805534A
_08055200:
	adds r0, r1, #0
	adds r0, #0x2d
	movs r1, #1
	strb r1, [r0]
	movs r0, #0x64
	strb r0, [r2]
	b _0805534A
	.align 2, 0
_08055210: .4byte gCurrentSprite
_08055214:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _08055224
	subs r0, #1
	b _08055348
_08055224:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	bne _0805522E
	b _0805534A
_0805522E:
	ldr r0, _08055240 @ =gSubSpriteData1
	ldr r1, _08055244 @ =0x08396858
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #2
	b _08055348
	.align 2, 0
_08055240: .4byte gSubSpriteData1
_08055244: .4byte 0x08396858
_08055248:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	bne _08055252
	b _0805534A
_08055252:
	ldr r1, _08055278 @ =gSubSpriteData1
	ldr r0, _0805527C @ =0x08396870
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _08055280 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2d
	movs r0, #3
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _08055284 @ =0x00000219
	bl SoundPlay
	b _0805534A
	.align 2, 0
_08055278: .4byte gSubSpriteData1
_0805527C: .4byte 0x08396870
_08055280: .4byte gCurrentSprite
_08055284: .4byte 0x00000219
_08055288:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _08055298
	subs r0, #1
	b _08055348
_08055298:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805534A
	ldr r0, _080552C0 @ =gSubSpriteData1
	ldr r1, _080552C4 @ =0x08396898
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #4
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0xc
	strb r0, [r1]
	bl omegaMetroidSpawnSA_X
	b _0805534A
	.align 2, 0
_080552C0: .4byte gSubSpriteData1
_080552C4: .4byte 0x08396898
_080552C8:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805534A
	ldr r1, _080552E8 @ =gSubSpriteData1
	ldr r0, _080552EC @ =0x08396758
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _080552F0 @ =gCurrentSprite
	adds r0, #0x2d
	movs r1, #5
	strb r1, [r0]
	b _0805534A
	.align 2, 0
_080552E8: .4byte gSubSpriteData1
_080552EC: .4byte 0x08396758
_080552F0: .4byte gCurrentSprite
_080552F4:
	adds r0, r5, #0
	adds r0, #0x30
	movs r4, #0
	strb r4, [r0]
	bl OmegaMetroidForwardMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805534A
	ldr r0, _0805531C @ =gSubSpriteData1
	ldr r1, _08055320 @ =0x083967C8
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #6
	b _08055348
	.align 2, 0
_0805531C: .4byte gSubSpriteData1
_08055320: .4byte 0x083967C8
_08055324:
	adds r0, r5, #0
	adds r0, #0x30
	movs r4, #0
	strb r4, [r0]
	bl OmegaMetroidStandingMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805534A
	ldr r0, _08055350 @ =gSubSpriteData1
	ldr r1, _08055354 @ =0x08396600
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0xb
_08055348:
	strb r0, [r1]
_0805534A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055350: .4byte gSubSpriteData1
_08055354: .4byte 0x08396600

	thumb_func_start OmegaMetroidWatchingSA_X
OmegaMetroidWatchingSA_X: @ 0x08055358
	push {lr}
	bl OmegaMetroidSA_XIceBeamCollision
	ldr r2, _080553A0 @ =gSpriteData
	ldr r0, _080553A4 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x45
	bne _0805539A
	mov r1, ip
	adds r1, #0x24
	movs r3, #0
	movs r0, #0xc
	strb r0, [r1]
	ldr r1, _080553A8 @ =gSubSpriteData1
	ldr r0, _080553AC @ =0x08396628
	str r0, [r1]
	strb r3, [r1, #6]
	movs r2, #0
	strh r3, [r1, #4]
	mov r0, ip
	adds r0, #0x2e
	strb r2, [r0]
	ldr r0, _080553B0 @ =0x0000021A
	bl SoundPlay
_0805539A:
	pop {r0}
	bx r0
	.align 2, 0
_080553A0: .4byte gSpriteData
_080553A4: .4byte gCurrentSprite
_080553A8: .4byte gSubSpriteData1
_080553AC: .4byte 0x08396628
_080553B0: .4byte 0x0000021A

	thumb_func_start OmegaMetroidDamagedBySA_X
OmegaMetroidDamagedBySA_X: @ 0x080553B4
	push {r4, lr}
	bl OmegaMetroidSA_XIceBeamCollision
	bl OmegaMetroidBodyBlinking
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080553EE
	ldr r1, _080553F4 @ =gSubSpriteData1
	ldr r0, _080553F8 @ =0x083968B0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r2, _080553FC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #9
	strb r0, [r1]
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	adds r2, #0x2d
	strb r3, [r2]
_080553EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080553F4: .4byte gSubSpriteData1
_080553F8: .4byte 0x083968B0
_080553FC: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidWalkingBackwardsFromSA_X
OmegaMetroidWalkingBackwardsFromSA_X: @ 0x08055400
	push {r4, r5, r6, lr}
	bl OmegaMetroidSA_XIceBeamCollision
	bl OmegaMetroidBodyBlinking
	ldr r5, _0805541C @ =gCurrentSprite
	adds r6, r5, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	cmp r4, #0
	beq _08055420
	cmp r4, #1
	beq _08055470
	b _08055490
	.align 2, 0
_0805541C: .4byte gCurrentSprite
_08055420:
	adds r0, r5, #0
	adds r0, #0x30
	strb r4, [r0]
	bl OmegaMetroidBackwardsMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08055490
	ldr r0, _08055460 @ =gSubSpriteData1
	ldr r1, _08055464 @ =0x08396908
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	ldrh r1, [r5]
	ldr r0, _08055468 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r5]
	movs r0, #1
	strb r0, [r6]
	ldr r2, _0805546C @ =gSpriteData
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x31
	movs r1, #0x1a
	strb r1, [r0]
	b _08055490
	.align 2, 0
_08055460: .4byte gSubSpriteData1
_08055464: .4byte 0x08396908
_08055468: .4byte 0x0000FDFF
_0805546C: .4byte gSpriteData
_08055470:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08055490
	ldr r1, _08055498 @ =gSubSpriteData1
	ldr r0, _0805549C @ =0x08396628
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	movs r0, #0x3c
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0xa
	strb r0, [r1]
_08055490:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055498: .4byte gSubSpriteData1
_0805549C: .4byte 0x08396628

	thumb_func_start OmegaMetroidDamagedBySA_X2
OmegaMetroidDamagedBySA_X2: @ 0x080554A0
	push {r4, r5, r6, lr}
	bl OmegaMetroidSA_XIceBeamCollision
	bl OmegaMetroidBodyBlinking
	ldr r5, _080554D4 @ =gSubSpriteData1
	ldr r0, [r5, #4]
	ldr r1, _080554D8 @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _080554C0
	ldr r0, _080554DC @ =0x0000021A
	bl SoundPlay
_080554C0:
	ldr r6, _080554E0 @ =gCurrentSprite
	adds r1, r6, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r4, r0, #0
	cmp r4, #0
	beq _080554E4
	subs r0, #1
	b _080554FA
	.align 2, 0
_080554D4: .4byte gSubSpriteData1
_080554D8: .4byte 0x00FFFFFF
_080554DC: .4byte 0x0000021A
_080554E0: .4byte gCurrentSprite
_080554E4:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080554FC
	ldr r0, _08055504 @ =0x083965D8
	str r0, [r5]
	strb r4, [r5, #6]
	strh r4, [r5, #4]
	adds r1, r6, #0
	adds r1, #0x24
	movs r0, #0xd
_080554FA:
	strb r0, [r1]
_080554FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08055504: .4byte 0x083965D8

	thumb_func_start OmegaMetroidWaitingToSwipeSA_X
OmegaMetroidWaitingToSwipeSA_X: @ 0x08055508
	push {lr}
	bl OmegaMetroidSA_XIceBeamCollision
	bl OmegaMetroidBodyBlinking
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08055536
	ldr r1, _0805553C @ =gSubSpriteData1
	ldr r0, _08055540 @ =0x08396918
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _08055544 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0xe
	strb r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #2
	bl SoundPlay
_08055536:
	pop {r0}
	bx r0
	.align 2, 0
_0805553C: .4byte gSubSpriteData1
_08055540: .4byte 0x08396918
_08055544: .4byte gCurrentSprite

	thumb_func_start OmegaMEtroidSwipingSA_X
OmegaMEtroidSwipingSA_X: @ 0x08055548
	push {lr}
	bl OmegaMetroidSA_XIceBeamCollision
	bl OmegaMetroidBodyBlinking
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805558C
	ldr r1, _08055580 @ =gSubSpriteData1
	ldr r0, _08055584 @ =0x08396660
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _08055588 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0xf
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	b _080555DA
	.align 2, 0
_08055580: .4byte gSubSpriteData1
_08055584: .4byte 0x08396660
_08055588: .4byte gCurrentSprite
_0805558C:
	ldr r1, _080555A4 @ =gSubSpriteData1
	ldrh r0, [r1, #4]
	cmp r0, #2
	bne _080555AC
	ldrb r0, [r1, #6]
	cmp r0, #1
	bne _080555DA
	ldr r0, _080555A8 @ =0x00000221
	bl SoundPlay
	b _080555DA
	.align 2, 0
_080555A4: .4byte gSubSpriteData1
_080555A8: .4byte 0x00000221
_080555AC:
	cmp r0, #3
	bne _080555DA
	ldrb r0, [r1, #6]
	cmp r0, #1
	bne _080555DA
	ldr r2, _080555E0 @ =gSpriteData
	ldr r0, _080555E4 @ =gCurrentSprite
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	movs r1, #0x47
	strb r1, [r0]
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _080555E8 @ =0x000002AF
	bl SoundPlay
_080555DA:
	pop {r0}
	bx r0
	.align 2, 0
_080555E0: .4byte gSpriteData
_080555E4: .4byte gCurrentSprite
_080555E8: .4byte 0x000002AF

	thumb_func_start OmegaMetroidKilledSA_X
OmegaMetroidKilledSA_X: @ 0x080555EC
	push {r4, lr}
	ldr r4, _08055648 @ =gSubSpriteData1
	ldr r0, [r4, #4]
	ldr r1, _0805564C @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _08055606
	movs r0, #0x89
	lsls r0, r0, #2
	bl SoundPlay
_08055606:
	bl EventCheckAfter_IceBeamRecovered
	cmp r0, #0
	beq _08055640
	ldr r0, _08055650 @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	movs r3, #0
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08055654 @ =0x08396858
	str r0, [r4]
	strb r3, [r4, #6]
	movs r1, #0
	strh r3, [r4, #4]
	mov r0, ip
	adds r0, #0x2d
	strb r1, [r0]
	movs r0, #0x32
	movs r1, #7
	bl PlayMusic
_08055640:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055648: .4byte gSubSpriteData1
_0805564C: .4byte 0x00FFFFFF
_08055650: .4byte gCurrentSprite
_08055654: .4byte 0x08396858

	thumb_func_start OmegaMetroidScreamingAfterIceBeamObtained
OmegaMetroidScreamingAfterIceBeamObtained: @ 0x08055658
	push {r4, r5, r6, lr}
	ldr r5, _08055674 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _08055678
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _080556F8
	.align 2, 0
_08055674: .4byte gCurrentSprite
_08055678:
	adds r6, r5, #0
	adds r6, #0x2d
	ldrb r4, [r6]
	cmp r4, #0
	bne _080556B4
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080556F8
	ldr r0, _080556A8 @ =gSubSpriteData1
	ldr r1, _080556AC @ =0x08396870
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	movs r0, #1
	strb r0, [r6]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _080556B0 @ =0x00000219
	bl SoundPlay
	b _080556F8
	.align 2, 0
_080556A8: .4byte gSubSpriteData1
_080556AC: .4byte 0x08396870
_080556B0: .4byte 0x00000219
_080556B4:
	cmp r4, #1
	bne _080556E4
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080556F8
	ldr r0, _080556DC @ =gSubSpriteData1
	ldr r1, _080556E0 @ =0x08396898
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	movs r0, #2
	strb r0, [r6]
	b _080556F8
	.align 2, 0
_080556DC: .4byte gSubSpriteData1
_080556E0: .4byte 0x08396898
_080556E4:
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _080556F8
	adds r0, r5, #0
	adds r0, #0x24
	movs r2, #0
	movs r1, #0x1f
	strb r1, [r0]
	strb r2, [r6]
_080556F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidWalkingBackwardsInit
OmegaMetroidWalkingBackwardsInit: @ 0x08055700
	push {r4, lr}
	ldr r3, _08055748 @ =gSubSpriteData1
	ldr r0, _0805574C @ =0x083968B0
	str r0, [r3]
	movs r0, #0
	strb r0, [r3, #6]
	strh r0, [r3, #4]
	ldr r2, _08055750 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x26
	strb r0, [r1]
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r3, #0xa]
	lsrs r1, r1, #2
	ldr r0, _08055754 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x78
	bhi _08055758
	ldrh r0, [r3, #0xc]
	cmp r0, #0
	beq _08055758
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #2
	b _0805575E
	.align 2, 0
_08055748: .4byte gSubSpriteData1
_0805574C: .4byte 0x083968B0
_08055750: .4byte gCurrentSprite
_08055754: .4byte gBg1XPosition
_08055758:
	adds r1, r2, #0
	adds r1, #0x2d
	movs r0, #1
_0805575E:
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x36
	ldrb r1, [r0]
	ldr r2, _0805578C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	adds r2, r1, #0
	adds r2, #0x25
	ldrb r0, [r2]
	cmp r0, #0x15
	bne _08055786
	movs r0, #0x16
	strb r0, [r2]
	movs r0, #0x30
	strh r0, [r1, #0xc]
	movs r0, #0x40
	strh r0, [r1, #0x10]
_08055786:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805578C: .4byte gSpriteData

	thumb_func_start OmegaMetroidWalkingBackwards
OmegaMetroidWalkingBackwards: @ 0x08055790
	push {r4, r5, lr}
	ldr r4, _080557D4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x30
	movs r1, #0
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x2d
	ldrb r0, [r5]
	cmp r0, #0
	beq _080557E4
	bl OmegaMetroidBackwardsMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805583C
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805583C
	ldr r0, _080557D8 @ =gSubSpriteData1
	ldr r1, _080557DC @ =0x08396908
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	ldrh r1, [r4]
	ldr r0, _080557E0 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	b _0805583C
	.align 2, 0
_080557D4: .4byte gCurrentSprite
_080557D8: .4byte gSubSpriteData1
_080557DC: .4byte 0x08396908
_080557E0: .4byte 0x0000FDFF
_080557E4:
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805583C
	ldr r2, _0805580C @ =gSubSpriteData1
	ldrh r1, [r2, #0xc]
	cmp r1, #0
	bne _08055814
	ldr r0, _08055810 @ =0x08396858
	str r0, [r2]
	strb r1, [r2, #6]
	movs r0, #0
	strh r1, [r2, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0x44
	b _0805583A
	.align 2, 0
_0805580C: .4byte gSubSpriteData1
_08055810: .4byte 0x08396858
_08055814:
	ldr r0, _08055830 @ =gSamusData
	ldrb r0, [r0, #0xc]
	cmp r0, #0x3f
	bhi _08055834
	bl OmegaMetroidCheckSamusInFrontRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08055834
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	b _0805583A
	.align 2, 0
_08055830: .4byte gSamusData
_08055834:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x23
_0805583A:
	strb r0, [r1]
_0805583C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidDyingInit
OmegaMetroidDyingInit: @ 0x08055844
	push {r4, r5, lr}
	ldr r4, _08055884 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r5, #0
	movs r0, #1
	strb r0, [r1]
	bl OmegaMetroidFullBodyBlinking
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805587C
	ldr r0, _08055888 @ =gSubSpriteData1
	ldr r1, _0805588C @ =0x08396870
	str r1, [r0]
	strb r5, [r0, #6]
	strh r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x64
	strb r0, [r1]
	ldr r0, _08055890 @ =0x00000219
	bl SoundPlay
_0805587C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055884: .4byte gCurrentSprite
_08055888: .4byte gSubSpriteData1
_0805588C: .4byte 0x08396870
_08055890: .4byte 0x00000219

	thumb_func_start OmegaMetroidDying1
OmegaMetroidDying1: @ 0x08055894
	push {r4, lr}
	ldr r4, _080558D8 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl OmegaMetroidFullBodyBlinking
	adds r3, r4, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080558D2
	ldr r0, _080558DC @ =gSubSpriteData1
	ldr r1, _080558E0 @ =0x08396628
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x48
	strb r0, [r1]
	movs r0, #0x78
	strb r0, [r3]
	movs r0, #0
	bl FadeMusic
_080558D2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080558D8: .4byte gCurrentSprite
_080558DC: .4byte gSubSpriteData1
_080558E0: .4byte 0x08396628

	thumb_func_start OmegaMetroidDying2
OmegaMetroidDying2: @ 0x080558E4
	push {r4, r5, lr}
	ldr r4, _08055914 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x26
	movs r2, #1
	strb r2, [r0]
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	subs r1, r0, #1
	strb r1, [r5]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bhi _08055918
	ands r1, r2
	cmp r1, #0
	beq _0805592A
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
	b _0805592A
	.align 2, 0
_08055914: .4byte gCurrentSprite
_08055918:
	bl OmegaMetroidFullBodyBlinking
	ldrb r0, [r5]
	cmp r0, #0x3c
	bne _0805592A
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
_0805592A:
	ldr r2, _08055968 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0805594A
	ldrh r1, [r2]
	movs r0, #4
	orrs r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4a
	strb r0, [r1]
	movs r0, #0x1d
	strb r0, [r3]
_0805594A:
	ldrh r4, [r2, #2]
	ldrh r5, [r2, #4]
	ldrb r0, [r3]
	cmp r0, #0x40
	beq _080559FE
	cmp r0, #0x40
	bgt _08055976
	cmp r0, #0x10
	beq _08055A4A
	cmp r0, #0x10
	bgt _0805596C
	cmp r0, #0
	bne _08055966
	b _08055A66
_08055966:
	b _08055A80
	.align 2, 0
_08055968: .4byte gCurrentSprite
_0805596C:
	cmp r0, #0x20
	beq _08055A32
	cmp r0, #0x30
	beq _08055A16
	b _08055A80
_08055976:
	cmp r0, #0x60
	beq _080559D0
	cmp r0, #0x60
	bgt _08055984
	cmp r0, #0x50
	beq _080559E8
	b _08055A80
_08055984:
	cmp r0, #0x6b
	beq _080559B2
	cmp r0, #0x76
	bne _08055A80
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x1c
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	adds r1, #0x34
	movs r2, #0x22
	bl ParticleSet
	movs r0, #0x87
	lsls r0, r0, #2
	bl unk_3b1c
	b _08055A80
_080559B2:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x4c
	movs r2, #0x25
	bl ParticleSet
	b _08055A80
_080559D0:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x58
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	adds r1, #0x20
	b _08055A5E
_080559E8:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	subs r1, #0x48
	movs r2, #0x21
	bl ParticleSet
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r4, #0
	b _08055A5E
_080559FE:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _08055A2A
_08055A16:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x1c
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x46
	adds r1, r5, #0
_08055A2A:
	movs r2, #0x22
	bl ParticleSet
	b _08055A80
_08055A32:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x58
	b _08055A5E
_08055A4A:
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	subs r1, #0x4c
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
_08055A5E:
	movs r2, #0x2f
	bl ParticleSet
	b _08055A80
_08055A66:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	subs r1, #0x2a
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r4, #0
	movs r2, #0x21
	bl ParticleSet
_08055A80:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroidDying3
OmegaMetroidDying3: @ 0x08055A88
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r1, _08055AB4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1b
	bhi _08055AB8
	ldrb r2, [r1]
	movs r0, #0xc4
	movs r1, #0
	bl SpriteLoadGfx
	b _08055AC6
	.align 2, 0
_08055AB4: .4byte gCurrentSprite
_08055AB8:
	cmp r0, #0x1c
	bne _08055AC6
	movs r0, #0xc4
	movs r1, #0
	movs r2, #7
	bl SpriteLoadPal
_08055AC6:
	ldr r5, _08055AFC @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r4, [r0]
	cmp r4, #0
	bne _08055AF4
	ldrh r1, [r5, #6]
	ldr r2, _08055B00 @ =0xFFFFFEC0
	adds r0, r2, #0
	ldrh r2, [r5, #8]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r1, [sp]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0xc4
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SpriteSpawnPrimary
	strh r4, [r5]
_08055AF4:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055AFC: .4byte gCurrentSprite
_08055B00: .4byte 0xFFFFFEC0

	thumb_func_start OmegaMetroidPartInit
OmegaMetroidPartInit: @ 0x08055B04
	push {r4, lr}
	ldr r4, _08055B44 @ =gCurrentSprite
	ldrh r1, [r4]
	ldr r0, _08055B48 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r4, #0x14]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x16
	strb r0, [r1]
	subs r1, #1
	movs r0, #2
	strb r0, [r1]
	bl OmegaMetroidPartSetDrawOrder
	ldrb r0, [r4, #0x1e]
	cmp r0, #7
	bls _08055B3A
	b _08055CE0
_08055B3A:
	lsls r0, r0, #2
	ldr r1, _08055B4C @ =_08055B50
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055B44: .4byte gCurrentSprite
_08055B48: .4byte 0x0000FFFB
_08055B4C: .4byte _08055B50
_08055B50: @ jump table
	.4byte _08055B70 @ case 0
	.4byte _08055B9C @ case 1
	.4byte _08055BD0 @ case 2
	.4byte _08055CE0 @ case 3
	.4byte _08055C04 @ case 4
	.4byte _08055C48 @ case 5
	.4byte _08055C7C @ case 6
	.4byte _08055CB0 @ case 7
_08055B70:
	ldr r2, _08055B94 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x28
	movs r1, #0x40
	strb r1, [r0]
	adds r3, r2, #0
	adds r3, #0x29
	movs r0, #0x28
	strb r0, [r3]
	ldr r0, _08055B98 @ =0x0000FFA0
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	adds r0, #0x38
	b _08055CD0
	.align 2, 0
_08055B94: .4byte gCurrentSprite
_08055B98: .4byte 0x0000FFA0
_08055B9C:
	ldr r2, _08055BC4 @ =gCurrentSprite
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
	ldr r0, _08055BC8 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	movs r0, #0x40
	strh r0, [r2, #0xc]
	ldr r0, _08055BCC @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x20
	strh r0, [r2, #0x10]
	b _08055CE6
	.align 2, 0
_08055BC4: .4byte gCurrentSprite
_08055BC8: .4byte 0x0000FFC0
_08055BCC: .4byte 0x0000FFE0
_08055BD0:
	ldr r2, _08055BF8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #0x48
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	ldr r0, _08055BFC @ =0x0000FF20
	strh r0, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	ldr r0, _08055C00 @ =0x0000FFE0
	strh r0, [r2, #0xe]
	movs r0, #0x60
	strh r0, [r2, #0x10]
	b _08055CE6
	.align 2, 0
_08055BF8: .4byte gCurrentSprite
_08055BFC: .4byte 0x0000FF20
_08055C00: .4byte 0x0000FFE0
_08055C04:
	ldr r3, _08055C40 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #8
	strb r0, [r1]
	movs r2, #0
	ldr r1, _08055C44 @ =0x0000FFE0
	strh r1, [r3, #0xa]
	movs r0, #0x28
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	movs r0, #0x20
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
	b _08055CE6
	.align 2, 0
_08055C40: .4byte gCurrentSprite
_08055C44: .4byte 0x0000FFE0
_08055C48:
	ldr r2, _08055C70 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08055C74 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x30
	strh r0, [r2, #0xc]
	ldr r0, _08055C78 @ =0x0000FFA0
	strh r0, [r2, #0xe]
	movs r0, #0x40
	strh r0, [r2, #0x10]
	b _08055CE6
	.align 2, 0
_08055C70: .4byte gCurrentSprite
_08055C74: .4byte 0x0000FFD8
_08055C78: .4byte 0x0000FFA0
_08055C7C:
	ldr r0, _08055CA8 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x27
	movs r3, #0
	movs r2, #0x20
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x28
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	ldr r0, _08055CAC @ =0x0000FFA0
	mov r1, ip
	strh r0, [r1, #0xa]
	strh r2, [r1, #0xc]
	strh r3, [r1, #0xe]
	movs r0, #0x80
	strh r0, [r1, #0x10]
	b _08055CE6
	.align 2, 0
_08055CA8: .4byte gCurrentSprite
_08055CAC: .4byte 0x0000FFA0
_08055CB0:
	ldr r2, _08055CD8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x27
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	ldr r0, _08055CDC @ =0x0000FF80
	strh r0, [r2, #0xa]
	movs r1, #4
	strh r1, [r2, #0xc]
	adds r0, #0x28
_08055CD0:
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	b _08055CE6
	.align 2, 0
_08055CD8: .4byte gCurrentSprite
_08055CDC: .4byte 0x0000FF80
_08055CE0:
	ldr r1, _08055CF0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08055CE6:
	bl OmagaMetroidSyncSubSPrites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055CF0: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidPartIdle
OmegaMetroidPartIdle: @ 0x08055CF4
	push {r4, r5, r6, lr}
	ldr r2, _08055D18 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r4, [r0]
	ldr r1, _08055D1C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r3, [r0]
	adds r0, r3, #0
	adds r6, r1, #0
	cmp r0, #0
	bne _08055D20
	strh r0, [r2]
	b _08055ED0
	.align 2, 0
_08055D18: .4byte gCurrentSprite
_08055D1C: .4byte gSpriteData
_08055D20:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08055D3A
	ldrh r0, [r2]
	movs r1, #4
	orrs r1, r0
	strh r1, [r2]
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _08055D42
_08055D3A:
	ldrh r1, [r2]
	ldr r0, _08055D74 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
_08055D42:
	lsls r1, r4, #3
	subs r0, r1, r4
	lsls r0, r0, #3
	adds r3, r0, r6
	ldrh r0, [r3, #0x14]
	adds r5, r1, #0
	cmp r0, #0
	bne _08055D5C
	strh r0, [r2, #0x14]
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
_08055D5C:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #8
	cmp r0, #0x42
	bls _08055D6A
	b _08055ED0
_08055D6A:
	lsls r0, r0, #2
	ldr r1, _08055D78 @ =_08055D7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055D74: .4byte 0x0000FFFB
_08055D78: .4byte _08055D7C
_08055D7C: @ jump table
	.4byte _08055E88 @ case 0
	.4byte _08055ED0 @ case 1
	.4byte _08055ED0 @ case 2
	.4byte _08055ED0 @ case 3
	.4byte _08055ED0 @ case 4
	.4byte _08055ED0 @ case 5
	.4byte _08055ED0 @ case 6
	.4byte _08055E9C @ case 7
	.4byte _08055ED0 @ case 8
	.4byte _08055ED0 @ case 9
	.4byte _08055ED0 @ case 10
	.4byte _08055ED0 @ case 11
	.4byte _08055ED0 @ case 12
	.4byte _08055ED0 @ case 13
	.4byte _08055ED0 @ case 14
	.4byte _08055ED0 @ case 15
	.4byte _08055ED0 @ case 16
	.4byte _08055ED0 @ case 17
	.4byte _08055ED0 @ case 18
	.4byte _08055ED0 @ case 19
	.4byte _08055ED0 @ case 20
	.4byte _08055ED0 @ case 21
	.4byte _08055ED0 @ case 22
	.4byte _08055ED0 @ case 23
	.4byte _08055ED0 @ case 24
	.4byte _08055ED0 @ case 25
	.4byte _08055ED0 @ case 26
	.4byte _08055ED0 @ case 27
	.4byte _08055ED0 @ case 28
	.4byte _08055ED0 @ case 29
	.4byte _08055ED0 @ case 30
	.4byte _08055ED0 @ case 31
	.4byte _08055ED0 @ case 32
	.4byte _08055ED0 @ case 33
	.4byte _08055ED0 @ case 34
	.4byte _08055ED0 @ case 35
	.4byte _08055ED0 @ case 36
	.4byte _08055ED0 @ case 37
	.4byte _08055ED0 @ case 38
	.4byte _08055ED0 @ case 39
	.4byte _08055ED0 @ case 40
	.4byte _08055ED0 @ case 41
	.4byte _08055ED0 @ case 42
	.4byte _08055ED0 @ case 43
	.4byte _08055ED0 @ case 44
	.4byte _08055ED0 @ case 45
	.4byte _08055ED0 @ case 46
	.4byte _08055EA2 @ case 47
	.4byte _08055EB0 @ case 48
	.4byte _08055ED0 @ case 49
	.4byte _08055ED0 @ case 50
	.4byte _08055ED0 @ case 51
	.4byte _08055ED0 @ case 52
	.4byte _08055ED0 @ case 53
	.4byte _08055ED0 @ case 54
	.4byte _08055ED0 @ case 55
	.4byte _08055ED0 @ case 56
	.4byte _08055ED0 @ case 57
	.4byte _08055ED0 @ case 58
	.4byte _08055ED0 @ case 59
	.4byte _08055EC0 @ case 60
	.4byte _08055ED0 @ case 61
	.4byte _08055EC0 @ case 62
	.4byte _08055ED0 @ case 63
	.4byte _08055EC0 @ case 64
	.4byte _08055ED0 @ case 65
	.4byte _08055EC0 @ case 66
_08055E88:
	subs r0, r5, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #4
	bne _08055ED0
	bl OmegaMetroidPartSetDrawOrder_2
	b _08055ED0
_08055E9C:
	bl OmegaMetroidPartSetDrawOrder
	b _08055ED0
_08055EA2:
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _08055ED0
_08055EB0:
	ldrh r1, [r2]
	ldr r0, _08055EBC @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	b _08055ED0
	.align 2, 0
_08055EBC: .4byte 0x0000DFFF
_08055EC0:
	subs r0, r5, r4
	lsls r0, r0, #3
	adds r0, r0, r6
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_08055ED0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaMetroid
OmegaMetroid: @ 0x08055ED8
	push {lr}
	bl OmegaMetroidUpdateHeartPalette
	bl OmegaMetroidUpdateHealthThreshold
	ldr r0, _08055EF8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4a
	bls _08055EEE
	b _0805610C
_08055EEE:
	lsls r0, r0, #2
	ldr r1, _08055EFC @ =_08055F00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055EF8: .4byte gCurrentSprite
_08055EFC: .4byte _08055F00
_08055F00: @ jump table
	.4byte _0805602C @ case 0
	.4byte _08056056 @ case 1
	.4byte _0805605A @ case 2
	.4byte _0805610C @ case 3
	.4byte _0805610C @ case 4
	.4byte _0805610C @ case 5
	.4byte _0805610C @ case 6
	.4byte _080560BC @ case 7
	.4byte _080560C0 @ case 8
	.4byte _080560D2 @ case 9
	.4byte _080560D8 @ case 10
	.4byte _080560C6 @ case 11
	.4byte _080560CC @ case 12
	.4byte _080560DE @ case 13
	.4byte _080560E4 @ case 14
	.4byte _080560EA @ case 15
	.4byte _080560F0 @ case 16
	.4byte _0805610C @ case 17
	.4byte _0805610C @ case 18
	.4byte _0805610C @ case 19
	.4byte _0805610C @ case 20
	.4byte _0805610C @ case 21
	.4byte _0805610C @ case 22
	.4byte _08056088 @ case 23
	.4byte _0805608C @ case 24
	.4byte _0805610C @ case 25
	.4byte _08056092 @ case 26
	.4byte _0805610C @ case 27
	.4byte _08056098 @ case 28
	.4byte _0805609E @ case 29
	.4byte _080560A2 @ case 30
	.4byte _08056074 @ case 31
	.4byte _08056078 @ case 32
	.4byte _08056060 @ case 33
	.4byte _08056064 @ case 34
	.4byte _0805606A @ case 35
	.4byte _0805606E @ case 36
	.4byte _0805607E @ case 37
	.4byte _08056082 @ case 38
	.4byte _0805610C @ case 39
	.4byte _0805610C @ case 40
	.4byte _080560A8 @ case 41
	.4byte _080560AC @ case 42
	.4byte _080560B2 @ case 43
	.4byte _080560B6 @ case 44
	.4byte _0805610C @ case 45
	.4byte _0805610C @ case 46
	.4byte _0805610C @ case 47
	.4byte _0805610C @ case 48
	.4byte _0805610C @ case 49
	.4byte _0805610C @ case 50
	.4byte _0805610C @ case 51
	.4byte _0805610C @ case 52
	.4byte _0805610C @ case 53
	.4byte _0805610C @ case 54
	.4byte _08056032 @ case 55
	.4byte _08056038 @ case 56
	.4byte _0805610C @ case 57
	.4byte _0805603E @ case 58
	.4byte _0805610C @ case 59
	.4byte _08056044 @ case 60
	.4byte _0805610C @ case 61
	.4byte _0805604A @ case 62
	.4byte _0805610C @ case 63
	.4byte _08056050 @ case 64
	.4byte _0805610C @ case 65
	.4byte _0805610C @ case 66
	.4byte _0805610C @ case 67
	.4byte _080560F6 @ case 68
	.4byte _0805610C @ case 69
	.4byte _080560FC @ case 70
	.4byte _0805610C @ case 71
	.4byte _08056102 @ case 72
	.4byte _0805610C @ case 73
	.4byte _08056108 @ case 74
_0805602C:
	bl OmegaMetroidInit
	b _0805610C
_08056032:
	bl OmegaMetroidWaitingToAppear
	b _0805610C
_08056038:
	bl OmegaMetroidFirstJump
	b _0805610C
_0805603E:
	bl OmegaMetroidLandingFromFirstJump
	b _0805610C
_08056044:
	bl OmegaMetroidLandedAfterFirstJump
	b _0805610C
_0805604A:
	bl OmegaMetroidScreamingAfterFirstJump
	b _0805610C
_08056050:
	bl OmegaMetroidFinishedScreamingAfterFirstJump
	b _0805610C
_08056056:
	bl OmegaMetroidWalkingBeforeSA_XInit
_0805605A:
	bl OmegaMetroidWalkingBeforeSA_X
	b _0805610C
_08056060:
	bl OmegaMetroidSlowWalkInit
_08056064:
	bl OmegaMetroidSlowWalk
	b _0805610C
_0805606A:
	bl OmegaMetroidWalkInit
_0805606E:
	bl OmegaMetroidWalk
	b _0805610C
_08056074:
	bl OmegaMetroidIdleInit
_08056078:
	bl OmegaMetroidIdle
	b _0805610C
_0805607E:
	bl OmegaMetroidWalkingBackwardsInit
_08056082:
	bl OmegaMetroidWalkingBackwards
	b _0805610C
_08056088:
	bl OmegaMetroidJumpWarningInit
_0805608C:
	bl OmegaMetroidJumpWarning
	b _0805610C
_08056092:
	bl OmegaMetroidJumping
	b _0805610C
_08056098:
	bl OmegaMEtroidFalling
	b _0805610C
_0805609E:
	bl OmegaMetroidLandingInit
_080560A2:
	bl OmegaMetroidLanding
	b _0805610C
_080560A8:
	bl OmegaMetroidSwipingInit
_080560AC:
	bl OmegaMetroidSwiping
	b _0805610C
_080560B2:
	bl OmegaMetroidVerticalJumpInit
_080560B6:
	bl OmegaMetroidVerticalJump
	b _0805610C
_080560BC:
	bl OmegaMetroidWaitingForSA_XInit
_080560C0:
	bl OmegaMetroidWaitingForSA_X
	b _0805610C
_080560C6:
	bl OmegaMetroidWatchingSA_X
	b _0805610C
_080560CC:
	bl OmegaMetroidDamagedBySA_X
	b _0805610C
_080560D2:
	bl OmegaMetroidWalkingBackwardsFromSA_X
	b _0805610C
_080560D8:
	bl OmegaMetroidDamagedBySA_X2
	b _0805610C
_080560DE:
	bl OmegaMetroidWaitingToSwipeSA_X
	b _0805610C
_080560E4:
	bl OmegaMEtroidSwipingSA_X
	b _0805610C
_080560EA:
	bl OmegaMetroidKilledSA_X
	b _0805610C
_080560F0:
	bl OmegaMetroidScreamingAfterIceBeamObtained
	b _0805610C
_080560F6:
	bl OmegaMetroidDyingInit
	b _0805610C
_080560FC:
	bl OmegaMetroidDying1
	b _0805610C
_08056102:
	bl OmegaMetroidDying2
	b _0805610C
_08056108:
	bl OmegaMetroidDying3
_0805610C:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl OmagaMetroidSyncSubSPrites
	bl OmegaMetroidUpdatePalette
	pop {r0}
	bx r0

	thumb_func_start OmegaMetroidPart
OmegaMetroidPart: @ 0x0805611C
	push {lr}
	ldr r0, _08056130 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08056134
	bl OmegaMetroidPartInit
	b _0805613C
	.align 2, 0
_08056130: .4byte gCurrentSprite
_08056134:
	bl OmegaMetroidPartIdle
	bl OmagaMetroidSyncSubSPrites
_0805613C:
	pop {r0}
	bx r0

	thumb_func_start GunshipEndSpawnBeams
GunshipEndSpawnBeams: @ 0x08056140
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _08056170 @ =gCurrentSprite
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r2, #0
	ldrh r2, [r0, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldrh r5, [r0, #4]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	subs r1, #6
	adds r3, r0, #0
	cmp r1, #0xf
	bls _08056166
	b _08056270
_08056166:
	lsls r0, r1, #2
	ldr r1, _08056174 @ =_08056178
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08056170: .4byte gCurrentSprite
_08056174: .4byte _08056178
_08056178: @ jump table
	.4byte _080561B8 @ case 0
	.4byte _08056270 @ case 1
	.4byte _08056270 @ case 2
	.4byte _080561DC @ case 3
	.4byte _08056270 @ case 4
	.4byte _08056270 @ case 5
	.4byte _080561FA @ case 6
	.4byte _08056270 @ case 7
	.4byte _08056270 @ case 8
	.4byte _08056218 @ case 9
	.4byte _08056270 @ case 10
	.4byte _08056270 @ case 11
	.4byte _08056236 @ case 12
	.4byte _08056270 @ case 13
	.4byte _08056270 @ case 14
	.4byte _08056254 @ case 15
_080561B8:
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0xcc
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x79
	movs r1, #0
	bl SpriteSpawnSecondary
	movs r0, #0xfd
	bl SoundPlay
	b _08056270
_080561DC:
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0xb0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x79
	movs r1, #1
	bl SpriteSpawnSecondary
	b _08056270
_080561FA:
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0x98
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x79
	movs r1, #3
	bl SpriteSpawnSecondary
	b _08056270
_08056218:
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0x80
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x79
	movs r1, #5
	bl SpriteSpawnSecondary
	b _08056270
_08056236:
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0x68
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x79
	movs r1, #7
	bl SpriteSpawnSecondary
	b _08056270
_08056254:
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, r4, #0
	subs r0, #0x50
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x79
	movs r1, #9
	bl SpriteSpawnSecondary
_08056270:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start GunshipEndInit
GunshipEndInit: @ 0x08056278
	push {r4, lr}
	ldr r0, _080562F4 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r1, _080562F8 @ =0x0000FFFB
	ands r1, r0
	movs r2, #0
	movs r3, #0
	mov r4, ip
	adds r4, #0x22
	movs r0, #0xc
	strb r0, [r4]
	subs r4, #1
	movs r0, #3
	strb r0, [r4]
	movs r0, #8
	orrs r1, r0
	mov r4, ip
	strh r1, [r4]
	movs r0, #0x90
	strh r0, [r4, #0x12]
	mov r0, ip
	adds r0, #0x2b
	strb r2, [r0]
	adds r0, #6
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	subs r1, #7
	movs r0, #0x7f
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x40
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xb0
	strb r0, [r1]
	ldr r1, _080562FC @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08056300 @ =0x0839EC68
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080562F4: .4byte gCurrentSprite
_080562F8: .4byte 0x0000FFFB
_080562FC: .4byte 0x0000FFFC
_08056300: .4byte 0x0839EC68

	thumb_func_start GunshipEndWaiting
GunshipEndWaiting: @ 0x08056304
	push {r4, lr}
	ldr r1, _08056334 @ =gCurrentSprite
	adds r4, r1, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805632C
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	movs r0, #0x5b
	movs r1, #0xe
	bl PlayMusic
	movs r0, #0x1e
	strb r0, [r4]
_0805632C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056334: .4byte gCurrentSprite

	thumb_func_start GunshipEndMovingUp
GunshipEndMovingUp: @ 0x08056338
	push {r4, lr}
	ldr r0, _08056374 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08056356
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056356
	ldr r0, _08056378 @ =0x00000249
	bl unk_3b1c
_08056356:
	movs r4, #0
	ldr r3, _08056374 @ =gCurrentSprite
	ldrh r2, [r3, #4]
	lsrs r0, r2, #2
	ldr r1, _0805637C @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6f
	bhi _08056380
	adds r0, r2, #1
	strh r0, [r3, #4]
	b _0805638C
	.align 2, 0
_08056374: .4byte gCurrentSprite
_08056378: .4byte 0x00000249
_0805637C: .4byte gBg1XPosition
_08056380:
	cmp r0, #0x80
	bls _0805638A
	subs r0, r2, #1
	strh r0, [r3, #4]
	b _0805638C
_0805638A:
	movs r4, #1
_0805638C:
	ldrh r2, [r3, #2]
	lsrs r0, r2, #2
	ldr r1, _080563A8 @ =gBg1YPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x2b
	bhi _080563AC
	adds r0, r2, #1
	strh r0, [r3, #2]
	b _080563BC
	.align 2, 0
_080563A8: .4byte gBg1YPosition
_080563AC:
	cmp r0, #0x3c
	bls _080563B6
	subs r0, r2, #1
	strh r0, [r3, #2]
	b _080563BC
_080563B6:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080563BC:
	cmp r4, #1
	bls _080563E0
	adds r1, r3, #0
	adds r1, #0x21
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	adds r1, #3
	movs r0, #0x17
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r0, #1
	strb r2, [r0]
_080563E0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GunshipEndWaitingToEnter
GunshipEndWaitingToEnter: @ 0x080563E8
	push {r4, r5, r6, lr}
	ldr r3, _08056438 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0805643C @ =0x0839AAE0
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08056440 @ =0x00007FFF
	cmp r1, r0
	bne _0805640A
	ldrh r4, [r5]
	movs r2, #0
_0805640A:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
	strh r0, [r3, #2]
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056432
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	movs r0, #0
	strb r0, [r2]
_08056432:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056438: .4byte gCurrentSprite
_0805643C: .4byte 0x0839AAE0
_08056440: .4byte 0x00007FFF

	thumb_func_start GunshipEndEntering
GunshipEndEntering: @ 0x08056444
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _080564B0 @ =gCurrentSprite
	mov ip, r0
	movs r1, #0x31
	add r1, ip
	mov r8, r1
	ldrb r2, [r1]
	ldr r4, _080564B4 @ =0x0839AAE0
	lsls r0, r2, #1
	adds r0, r0, r4
	ldrh r3, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _080564B8 @ =0x00007FFF
	cmp r1, r0
	bne _0805646E
	ldrh r3, [r4]
	movs r2, #0
_0805646E:
	adds r0, r2, #1
	movs r7, #0
	mov r6, r8
	strb r0, [r6]
	mov r1, ip
	ldrh r0, [r1, #2]
	adds r4, r0, r3
	movs r5, #0
	strh r4, [r1, #2]
	ldr r2, _080564BC @ =0x0839AC90
	mov r6, ip
	adds r6, #0x2e
	ldrb r3, [r6]
	lsls r1, r3, #0x18
	lsrs r0, r1, #0x1a
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r2, ip
	strh r0, [r2, #0x12]
	lsrs r1, r1, #0x18
	cmp r1, #0x6f
	bhi _080564C0
	adds r0, r3, #1
	strb r0, [r6]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08056576
	adds r0, r4, #1
	strh r0, [r2, #2]
	b _08056576
	.align 2, 0
_080564B0: .4byte gCurrentSprite
_080564B4: .4byte 0x0839AAE0
_080564B8: .4byte 0x00007FFF
_080564BC: .4byte 0x0839AC90
_080564C0:
	mov r3, ip
	ldrh r1, [r3]
	ldr r0, _08056584 @ =0x0000FFF7
	ands r0, r1
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _08056588 @ =0x0839EB48
	str r0, [r3, #0x18]
	strb r5, [r3, #0x1c]
	strh r7, [r3, #0x16]
	mov r0, ip
	adds r0, #0x2f
	strb r5, [r0]
	adds r1, #0x10
	ldrb r0, [r1]
	movs r4, #1
	orrs r0, r4
	strb r0, [r1]
	ldrb r1, [r3, #0x1e]
	ldrb r2, [r3, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	mov r6, ip
	ldrh r0, [r6, #2]
	str r0, [sp]
	ldrh r0, [r6, #4]
	str r0, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x7a
	bl SpriteSpawnSecondary
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	strb r0, [r1]
	ldr r2, _0805658C @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r3, r1, r2
	mov ip, r3
	ldrh r3, [r3]
	ldr r0, _08056590 @ =0x0000FFFB
	ands r0, r3
	mov r6, ip
	strh r0, [r6]
	adds r2, #0x18
	adds r1, r1, r2
	ldr r0, _08056594 @ =0x0839EC30
	str r0, [r1]
	strb r5, [r6, #0x1c]
	strh r7, [r6, #0x16]
	mov r1, ip
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r0, r4
	strb r0, [r1]
	subs r1, #0x12
	movs r0, #0xe
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r5, [r0]
	adds r0, #2
	movs r2, #4
	strb r2, [r0]
	adds r1, #6
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x30
	strb r0, [r1]
	ldr r0, _08056598 @ =0x0000FFFC
	strh r0, [r6, #0xa]
	strh r2, [r6, #0xc]
	strh r0, [r6, #0xe]
	strh r2, [r6, #0x10]
	subs r1, #5
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
_08056576:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056584: .4byte 0x0000FFF7
_08056588: .4byte 0x0839EB48
_0805658C: .4byte gSpriteData
_08056590: .4byte 0x0000FFFB
_08056594: .4byte 0x0839EC30
_08056598: .4byte 0x0000FFFC

	thumb_func_start GunshipEndWaitingForSamus
GunshipEndWaitingForSamus: @ 0x0805659C
	push {r4, r5, lr}
	ldr r4, _080565B4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0x23
	bhi _080565B8
	adds r0, #1
	strb r0, [r1]
	bl GunshipEndSpawnBeams
	b _08056638
	.align 2, 0
_080565B4: .4byte gCurrentSprite
_080565B8:
	ldrh r2, [r4, #4]
	adds r0, r2, #0
	subs r0, #0x20
	ldr r5, _08056624 @ =gSamusData
	ldrh r1, [r5, #0x16]
	cmp r0, r1
	bge _08056630
	adds r0, #0x40
	cmp r0, r1
	ble _08056630
	ldrh r1, [r5, #0x18]
	ldr r0, _08056628 @ =0x000002BF
	cmp r1, r0
	bne _08056630
	bl SpriteUtilCheckMorphed
	adds r1, r0, #0
	cmp r1, #0
	bne _08056630
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _080565E6
	strb r1, [r5, #5]
_080565E6:
	ldr r1, _0805662C @ =sSamusSetPoseFunctionPointer
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x20
	bl _call_via_r1
	movs r1, #0x90
	lsls r1, r1, #1
	adds r0, r1, #0
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r5, #0x18]
	ldrh r0, [r4, #4]
	strh r0, [r5, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	subs r1, #0xc
	movs r0, #4
	strb r0, [r1]
	movs r0, #0x6d
	bl EventCheckAdvance
	b _08056638
	.align 2, 0
_08056624: .4byte gSamusData
_08056628: .4byte 0x000002BF
_0805662C: .4byte sSamusSetPoseFunctionPointer
_08056630:
	ldr r0, _08056640 @ =gCurrentSprite
	adds r0, #0x22
	movs r1, #0xc
	strb r1, [r0]
_08056638:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056640: .4byte gCurrentSprite

	thumb_func_start GunshipEndLockingSamus
GunshipEndLockingSamus: @ 0x08056644
	push {lr}
	ldr r1, _08056668 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056664
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #0x38
	strb r1, [r0]
	movs r0, #0x3b
	strb r0, [r2]
_08056664:
	pop {r0}
	bx r0
	.align 2, 0
_08056668: .4byte gCurrentSprite

	thumb_func_start GunshipEndMovingSamusUp
GunshipEndMovingSamusUp: @ 0x0805666C
	push {lr}
	ldr r1, _08056690 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056698
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
	ldr r1, _08056694 @ =gDisableDrawingSamusAndScrollingFlag
	movs r0, #1
	strb r0, [r1]
	b _080566A0
	.align 2, 0
_08056690: .4byte gCurrentSprite
_08056694: .4byte gDisableDrawingSamusAndScrollingFlag
_08056698:
	ldr r1, _080566A4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #4
	strh r0, [r1, #0x18]
_080566A0:
	pop {r0}
	bx r0
	.align 2, 0
_080566A4: .4byte gSamusData

	thumb_func_start GunshipEndStartingEngine1
GunshipEndStartingEngine1: @ 0x080566A8
	push {r4, r5, r6, lr}
	ldr r4, _08056718 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x31
	ldrb r5, [r6]
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _08056712
	adds r1, r4, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x3a
	strb r0, [r1]
	ldr r0, _0805671C @ =0x0839EC68
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	movs r2, #0
	strh r3, [r4, #0x16]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	strb r2, [r6]
	ldrh r0, [r4]
	movs r1, #8
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r2, [r0]
	ldr r1, _08056720 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	strh r3, [r0]
	ldr r0, _08056724 @ =0x082F474E
	ldr r1, _08056728 @ =0x040000D4
	str r0, [r1]
	ldr r0, _0805672C @ =0x05000336
	str r0, [r1, #4]
	ldr r0, _08056730 @ =0x80000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08056734 @ =0x0000024A
	bl unk_3b1c
_08056712:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08056718: .4byte gCurrentSprite
_0805671C: .4byte 0x0839EC68
_08056720: .4byte gSpriteData
_08056724: .4byte 0x082F474E
_08056728: .4byte 0x040000D4
_0805672C: .4byte 0x05000336
_08056730: .4byte 0x80000005
_08056734: .4byte 0x0000024A

	thumb_func_start GunshipEndStartingEngine2
GunshipEndStartingEngine2: @ 0x08056738
	push {r4, r5, r6, lr}
	ldr r2, _08056794 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _08056798 @ =0x0839ABC4
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0805679C @ =0x00007FFF
	cmp r1, r0
	bne _0805675A
	ldrh r4, [r5]
	movs r3, #0
_0805675A:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
	movs r4, #0
	strh r0, [r2, #2]
	adds r5, r2, #0
	adds r5, #0x2f
	ldrb r1, [r5]
	cmp r1, #0
	bne _080567A4
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080567FE
	ldr r0, _080567A0 @ =0x0839EC08
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r1, [r2, #0x16]
	movs r0, #0x3c
	strb r0, [r3]
	movs r0, #1
	strb r0, [r5]
	b _080567FE
	.align 2, 0
_08056794: .4byte gCurrentSprite
_08056798: .4byte 0x0839ABC4
_0805679C: .4byte 0x00007FFF
_080567A0: .4byte 0x0839EC08
_080567A4:
	cmp r1, #1
	bne _080567D0
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _080567FE
	ldr r0, _080567CC @ =0x0839EC78
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r1, [r2, #0x16]
	movs r0, #0x5a
	strb r0, [r3]
	movs r0, #2
	strb r0, [r5]
	b _080567FE
	.align 2, 0
_080567CC: .4byte 0x0839EC78
_080567D0:
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080567FE
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3b
	strb r0, [r1]
	strb r4, [r3]
	strb r4, [r5]
	adds r0, r2, #0
	adds r0, #0x30
	strb r4, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_080567FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start GunshipEndTakingOff
GunshipEndTakingOff: @ 0x08056804
	push {lr}
	ldr r1, _08056828 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r2, [r3]
	adds r0, r2, #0
	cmp r0, #0x3f
	bls _0805682C
	ldrh r0, [r1, #2]
	subs r0, #8
	strh r0, [r1, #2]
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	bl unk_6df04
	b _0805685A
	.align 2, 0
_08056828: .4byte gCurrentSprite
_0805682C:
	cmp r0, #0x37
	bls _0805683A
	ldrh r0, [r1, #2]
	subs r0, #8
	strh r0, [r1, #2]
	adds r0, r2, #4
	b _08056858
_0805683A:
	cmp r0, #0x2f
	bls _08056848
	ldrh r0, [r1, #2]
	subs r0, #2
	strh r0, [r1, #2]
	adds r0, r2, #4
	b _08056858
_08056848:
	cmp r0, #0x1f
	bls _08056856
	ldrh r0, [r1, #2]
	subs r0, #1
	strh r0, [r1, #2]
	adds r0, r2, #2
	b _08056858
_08056856:
	adds r0, r2, #1
_08056858:
	strb r0, [r3]
_0805685A:
	ldr r3, _0805688C @ =gCurrentSprite
	ldr r1, _08056890 @ =0x0839ACD0
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x12]
	ldrb r0, [r2]
	cmp r0, #0x1f
	bls _08056886
	subs r0, #0x20
	asrs r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, _08056894 @ =0x0839AC84
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x2b
	strb r1, [r0]
_08056886:
	pop {r0}
	bx r0
	.align 2, 0
_0805688C: .4byte gCurrentSprite
_08056890: .4byte 0x0839ACD0
_08056894: .4byte 0x0839AC84

	thumb_func_start GunshipEndDone
GunshipEndDone: @ 0x08056898
	bx lr
	.align 2, 0

	thumb_func_start GunshipEndBottomIdle
GunshipEndBottomIdle: @ 0x0805689C
	push {lr}
	ldr r2, _080568E0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	bne _0805690C
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	lsls r0, r0, #5
	ldr r1, _080568E4 @ =0x082F474E
	adds r0, r0, r1
	ldr r1, _080568E8 @ =0x040000D4
	str r0, [r1]
	ldr r0, _080568EC @ =0x05000336
	str r0, [r1, #4]
	ldr r0, _080568F0 @ =0x80000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	beq _080568FA
	ldrb r0, [r3]
	adds r1, r0, #0
	cmp r1, #0
	beq _080568F4
	subs r0, #1
	b _0805690A
	.align 2, 0
_080568E0: .4byte gCurrentSprite
_080568E4: .4byte 0x082F474E
_080568E8: .4byte 0x040000D4
_080568EC: .4byte 0x05000336
_080568F0: .4byte 0x80000005
_080568F4:
	strb r1, [r2]
	movs r0, #1
	b _0805690A
_080568FA:
	ldrb r0, [r3]
	cmp r0, #5
	bls _08056908
	movs r0, #1
	strb r0, [r2]
	movs r0, #5
	b _0805690A
_08056908:
	adds r0, #1
_0805690A:
	strb r0, [r3]
_0805690C:
	pop {r0}
	bx r0

	thumb_func_start GunshiEndpBeamInit
GunshiEndpBeamInit: @ 0x08056910
	push {r4, lr}
	ldr r0, _08056974 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08056978 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	adds r0, #2
	movs r1, #4
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r2, #0xb
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0805697C @ =0x0000FFFC
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _08056980 @ =0x0839EBB8
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	subs r1, #2
	movs r0, #0xd
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #9
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056974: .4byte gCurrentSprite
_08056978: .4byte 0x0000FFFB
_0805697C: .4byte 0x0000FFFC
_08056980: .4byte 0x0839EBB8

	thumb_func_start GunshipEndBeamMovingDown
GunshipEndBeamMovingDown: @ 0x08056984
	push {lr}
	ldr r1, _080569A4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrb r0, [r1, #0x1e]
	adds r2, r1, #0
	cmp r0, #0
	beq _080569A8
	subs r0, #1
	strb r0, [r2, #0x1e]
	ldrh r0, [r2, #2]
	adds r0, #4
	strh r0, [r2, #2]
	b _080569EA
	.align 2, 0
_080569A4: .4byte gCurrentSprite
_080569A8:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080569C0
	ldrh r0, [r2, #2]
	adds r0, #4
	strh r0, [r2, #2]
	b _080569CA
_080569C0:
	ldrh r0, [r2, #2]
	subs r0, #0x20
	strh r0, [r2, #2]
	movs r0, #9
	strb r0, [r1]
_080569CA:
	ldr r0, _080569F0 @ =gSpriteData
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x37
	bne _080569EA
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #2
	movs r0, #5
	strb r0, [r1]
_080569EA:
	pop {r0}
	bx r0
	.align 2, 0
_080569F0: .4byte gSpriteData

	thumb_func_start GunshipEndBeamMovingUp
GunshipEndBeamMovingUp: @ 0x080569F4
	push {r4, lr}
	ldr r1, _08056A1C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r4, [r0]
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #8
	bls _08056A20
	movs r0, #0
	strb r0, [r2]
	ldrh r0, [r3, #2]
	adds r0, #0x20
	b _08056A24
	.align 2, 0
_08056A1C: .4byte gCurrentSprite
_08056A20:
	ldrh r0, [r3, #2]
	subs r0, #4
_08056A24:
	strh r0, [r3, #2]
	ldr r0, _08056A44 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x39
	bne _08056A3C
	movs r0, #0
	strh r0, [r3]
_08056A3C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056A44: .4byte gSpriteData

	thumb_func_start GunshipEnd
GunshipEnd: @ 0x08056A48
	push {lr}
	ldr r0, _08056A68 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _08056A5E
	b _08056BAA
_08056A5E:
	lsls r0, r0, #2
	ldr r1, _08056A6C @ =_08056A70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08056A68: .4byte gCurrentSprite
_08056A6C: .4byte _08056A70
_08056A70: @ jump table
	.4byte _08056B64 @ case 0
	.4byte _08056B6A @ case 1
	.4byte _08056B70 @ case 2
	.4byte _08056BAA @ case 3
	.4byte _08056BAA @ case 4
	.4byte _08056BAA @ case 5
	.4byte _08056BAA @ case 6
	.4byte _08056BAA @ case 7
	.4byte _08056BAA @ case 8
	.4byte _08056BAA @ case 9
	.4byte _08056BAA @ case 10
	.4byte _08056BAA @ case 11
	.4byte _08056BAA @ case 12
	.4byte _08056BAA @ case 13
	.4byte _08056BAA @ case 14
	.4byte _08056BAA @ case 15
	.4byte _08056BAA @ case 16
	.4byte _08056BAA @ case 17
	.4byte _08056BAA @ case 18
	.4byte _08056BAA @ case 19
	.4byte _08056BAA @ case 20
	.4byte _08056BAA @ case 21
	.4byte _08056BAA @ case 22
	.4byte _08056B76 @ case 23
	.4byte _08056B7C @ case 24
	.4byte _08056BAA @ case 25
	.4byte _08056B82 @ case 26
	.4byte _08056BAA @ case 27
	.4byte _08056BAA @ case 28
	.4byte _08056BAA @ case 29
	.4byte _08056BAA @ case 30
	.4byte _08056BAA @ case 31
	.4byte _08056BAA @ case 32
	.4byte _08056BAA @ case 33
	.4byte _08056BAA @ case 34
	.4byte _08056BAA @ case 35
	.4byte _08056BAA @ case 36
	.4byte _08056BAA @ case 37
	.4byte _08056BAA @ case 38
	.4byte _08056BAA @ case 39
	.4byte _08056BAA @ case 40
	.4byte _08056BAA @ case 41
	.4byte _08056BAA @ case 42
	.4byte _08056BAA @ case 43
	.4byte _08056BAA @ case 44
	.4byte _08056BAA @ case 45
	.4byte _08056BAA @ case 46
	.4byte _08056BAA @ case 47
	.4byte _08056BAA @ case 48
	.4byte _08056BAA @ case 49
	.4byte _08056BAA @ case 50
	.4byte _08056BAA @ case 51
	.4byte _08056BAA @ case 52
	.4byte _08056BAA @ case 53
	.4byte _08056BAA @ case 54
	.4byte _08056B88 @ case 55
	.4byte _08056B8E @ case 56
	.4byte _08056B94 @ case 57
	.4byte _08056B9A @ case 58
	.4byte _08056BA0 @ case 59
	.4byte _08056BA6 @ case 60
_08056B64:
	bl GunshipEndInit
	b _08056BAA
_08056B6A:
	bl GunshipEndWaiting
	b _08056BAA
_08056B70:
	bl GunshipEndMovingUp
	b _08056BAA
_08056B76:
	bl GunshipEndWaitingToEnter
	b _08056BAA
_08056B7C:
	bl GunshipEndEntering
	b _08056BAA
_08056B82:
	bl GunshipEndWaitingForSamus
	b _08056BAA
_08056B88:
	bl GunshipEndLockingSamus
	b _08056BAA
_08056B8E:
	bl GunshipEndMovingSamusUp
	b _08056BAA
_08056B94:
	bl GunshipEndStartingEngine1
	b _08056BAA
_08056B9A:
	bl GunshipEndStartingEngine2
	b _08056BAA
_08056BA0:
	bl GunshipEndTakingOff
	b _08056BAA
_08056BA6:
	bl GunshipEndDone
_08056BAA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GunshipEndBottom
GunshipEndBottom: @ 0x08056BB0
	push {lr}
	ldr r0, _08056BCC @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	bne _08056BC8
	bl GunshipEndBottomIdle
_08056BC8:
	pop {r0}
	bx r0
	.align 2, 0
_08056BCC: .4byte gCurrentSprite

	thumb_func_start GunshipEndBeam
GunshipEndBeam: @ 0x08056BD0
	push {lr}
	ldr r0, _08056BF0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08056BFE
	cmp r0, #2
	bgt _08056BF4
	cmp r0, #0
	beq _08056BFA
	b _08056C08
	.align 2, 0
_08056BF0: .4byte gCurrentSprite
_08056BF4:
	cmp r0, #0x18
	beq _08056C04
	b _08056C08
_08056BFA:
	bl GunshiEndpBeamInit
_08056BFE:
	bl GunshipEndBeamMovingDown
	b _08056C08
_08056C04:
	bl GunshipEndBeamMovingUp
_08056C08:
	ldr r1, _08056C20 @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	bne _08056C1C
	ldrh r0, [r1]
	cmp r0, #0
	bne _08056C1C
	movs r0, #0xfd
	bl SoundStop
_08056C1C:
	pop {r0}
	bx r0
	.align 2, 0
_08056C20: .4byte gCurrentSprite

	thumb_func_start ElectricWaterDamageBox2Init
ElectricWaterDamageBox2Init: @ 0x08056C24
	push {r4, lr}
	ldr r0, _08056C78 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	movs r0, #4
	movs r2, #0
	movs r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08056C7C @ =0x0000FF80
	mov r4, ip
	strh r0, [r4, #0xa]
	movs r1, #0x20
	strh r1, [r4, #0xc]
	adds r0, #0x60
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _08056C80 @ =0x0839F658
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056C78: .4byte gCurrentSprite
_08056C7C: .4byte 0x0000FF80
_08056C80: .4byte 0x0839F658

	thumb_func_start ElectricWaterDamageBox2Idle
ElectricWaterDamageBox2Idle: @ 0x08056C84
	push {lr}
	ldr r2, _08056CA8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08056CAC @ =0x03001346
	ldrb r0, [r0]
	cmp r0, #0
	beq _08056CA4
	subs r1, #2
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0
	strb r0, [r1]
_08056CA4:
	pop {r0}
	bx r0
	.align 2, 0
_08056CA8: .4byte gCurrentSprite
_08056CAC: .4byte 0x03001346

	thumb_func_start ElectricWaterDamageBox2DamagingSamus
ElectricWaterDamageBox2DamagingSamus: @ 0x08056CB0
	push {lr}
	ldr r2, _08056CDC @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _08056CE0 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08056CE4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	strh r0, [r2, #2]
	ldrh r0, [r1, #0x16]
	strh r0, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08056CE8
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0xb
	b _08056CEE
	.align 2, 0
_08056CDC: .4byte gCurrentSprite
_08056CE0: .4byte 0x0000FFFB
_08056CE4: .4byte gSamusData
_08056CE8:
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
_08056CEE:
	strb r0, [r1]
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _08056D1C @ =0x03001346
	ldrb r3, [r0]
	cmp r3, #0
	bne _08056D18
	subs r1, #0xa
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _08056D20 @ =0x0839F6C8
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	movs r1, #0
	strh r3, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x25
	strb r1, [r0]
_08056D18:
	pop {r0}
	bx r0
	.align 2, 0
_08056D1C: .4byte 0x03001346
_08056D20: .4byte 0x0839F6C8

	thumb_func_start ElectricWaterDamageBox2Stopping
ElectricWaterDamageBox2Stopping: @ 0x08056D24
	push {r4, r5, lr}
	ldr r4, _08056D6C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r1, _08056D70 @ =gSamusData
	ldrh r0, [r1, #0x18]
	movs r5, #0
	strh r0, [r4, #2]
	ldrh r0, [r1, #0x16]
	strh r0, [r4, #4]
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _08056D64
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4]
	ldr r0, _08056D74 @ =0x0839F658
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x25
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
_08056D64:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056D6C: .4byte gCurrentSprite
_08056D70: .4byte gSamusData
_08056D74: .4byte 0x0839F658

	thumb_func_start ElectricWaterDamageBox2
ElectricWaterDamageBox2: @ 0x08056D78
	push {lr}
	ldr r0, _08056D90 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08056DA4
	cmp r0, #2
	bgt _08056D94
	cmp r0, #0
	beq _08056D9E
	b _08056DB4
	.align 2, 0
_08056D90: .4byte gCurrentSprite
_08056D94:
	cmp r0, #0x18
	beq _08056DAA
	cmp r0, #0x1a
	beq _08056DB0
	b _08056DB4
_08056D9E:
	bl ElectricWaterDamageBox2Init
	b _08056DB4
_08056DA4:
	bl ElectricWaterDamageBox2Idle
	b _08056DB4
_08056DAA:
	bl ElectricWaterDamageBox2DamagingSamus
	b _08056DB4
_08056DB0:
	bl ElectricWaterDamageBox2Stopping
_08056DB4:
	ldr r0, _08056DCC @ =gCurrentEventBasedEffect
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08056DC6
	ldr r1, _08056DD0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_08056DC6:
	pop {r0}
	bx r0
	.align 2, 0
_08056DCC: .4byte gCurrentEventBasedEffect
_08056DD0: .4byte gCurrentSprite

	thumb_func_start FrozenRidleySetCollision
FrozenRidleySetCollision: @ 0x08056DD4
	push {lr}
	adds r3, r0, #0
	ldr r1, _08056DEC @ =gCurrentSprite
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	ldr r2, _08056DF0 @ =gCurrentClipdataAffectingAction
	strb r3, [r2]
	adds r0, #0x20
	bl ClipdataProcess
	pop {r0}
	bx r0
	.align 2, 0
_08056DEC: .4byte gCurrentSprite
_08056DF0: .4byte gCurrentClipdataAffectingAction

	thumb_func_start FrozenRidleyInit
FrozenRidleyInit: @ 0x08056DF4
	push {r4, r5, lr}
	ldr r4, _08056E64 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x21
	movs r3, #0
	movs r0, #3
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #8
	orrs r0, r1
	strb r0, [r2]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x58
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x48
	strb r0, [r1]
	movs r5, #0
	ldr r0, _08056E68 @ =0x0000FE98
	strh r0, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	ldr r0, _08056E6C @ =0x0000FFA0
	strh r0, [r4, #0xe]
	movs r0, #0x60
	strh r0, [r4, #0x10]
	strb r5, [r4, #0x1c]
	strh r3, [r4, #0x16]
	bl EventCheckOn_PowerOutage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08056E74
	movs r1, #1
	strh r0, [r4, #0x14]
	ldr r0, _08056E70 @ =0x083A123C
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x24
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #2
	bl FrozenRidleySetCollision
	b _08056EAE
	.align 2, 0
_08056E64: .4byte gCurrentSprite
_08056E68: .4byte 0x0000FE98
_08056E6C: .4byte 0x0000FFA0
_08056E70: .4byte 0x083A123C
_08056E74:
	cmp r0, #2
	bne _08056E90
	ldr r0, _08056E8C @ =0x083A12F4
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r5, [r0]
	b _08056EAE
	.align 2, 0
_08056E8C: .4byte 0x083A12F4
_08056E90:
	movs r2, #1
	movs r0, #1
	strh r0, [r4, #0x14]
	ldr r0, _08056EB4 @ =0x083A123C
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #2
	bl FrozenRidleySetCollision
_08056EAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08056EB4: .4byte 0x083A123C

	thumb_func_start FrozenRidleyWaitForSamus
FrozenRidleyWaitForSamus: @ 0x08056EB8
	push {lr}
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #4
	bne _08056EEA
	ldr r0, _08056EF0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #2
	strb r1, [r2]
	ldr r1, _08056EF4 @ =0x083A124C
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0xa0
	strb r1, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	bl SoundPlay
_08056EEA:
	pop {r0}
	bx r0
	.align 2, 0
_08056EF0: .4byte gCurrentSprite
_08056EF4: .4byte 0x083A124C

	thumb_func_start FrozenRidleySpawningX
FrozenRidleySpawningX: @ 0x08056EF8
	push {r4, lr}
	sub sp, #0xc
	ldr r2, _08056F44 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _08056F3C
	subs r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08056F48 @ =0x083A1284
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r4, [r2, #0x16]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	subs r0, #0xa0
	str r0, [sp]
	ldrh r0, [r2, #4]
	subs r0, #0x20
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x73
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
_08056F3C:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056F44: .4byte gCurrentSprite
_08056F48: .4byte 0x083A1284

	thumb_func_start FrozenRidleyClosingEye
FrozenRidleyClosingEye: @ 0x08056F4C
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _08056F70
	ldr r0, _08056F74 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x1a
	strb r1, [r2]
	ldr r1, _08056F78 @ =0x083A123C
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x3c
	strb r1, [r0]
_08056F70:
	pop {r0}
	bx r0
	.align 2, 0
_08056F74: .4byte gCurrentSprite
_08056F78: .4byte 0x083A123C

	thumb_func_start FrozenRidleyXSpawning
FrozenRidleyXSpawning: @ 0x08056F7C
	push {lr}
	ldr r2, _08056FB4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _08056FAE
	subs r1, #0xa
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _08056FB8 @ =0x083A12A4
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	movs r0, #0
	strh r3, [r2, #0x16]
	adds r1, #1
	strb r0, [r1]
	strh r3, [r2, #0x14]
	ldr r0, _08056FBC @ =0x00000235
	bl SoundPlay
_08056FAE:
	pop {r0}
	bx r0
	.align 2, 0
_08056FB4: .4byte gCurrentSprite
_08056FB8: .4byte 0x083A12A4
_08056FBC: .4byte 0x00000235

	thumb_func_start FrozenRidleyCrumbling
FrozenRidleyCrumbling: @ 0x08056FC0
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _08056FF0
	ldr r1, _08056FE8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #8
	strb r0, [r2]
	ldr r0, _08056FEC @ =0x083A12F4
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	movs r0, #1
	bl FrozenRidleySetCollision
	b _08057008
	.align 2, 0
_08056FE8: .4byte gCurrentSprite
_08056FEC: .4byte 0x083A12F4
_08056FF0:
	ldr r1, _0805700C @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #4
	bne _08057008
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _08057008
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x3b
	bl ParticleSet
_08057008:
	pop {r0}
	bx r0
	.align 2, 0
_0805700C: .4byte gCurrentSprite

	thumb_func_start FrozenRidleyXInit
FrozenRidleyXInit: @ 0x08057010
	push {r4, r5, lr}
	ldr r0, _08057088 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r3, _0805708C @ =0x0000FFFB
	ands r3, r0
	movs r4, #0
	movs r5, #0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08057090 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	movs r0, #0x20
	orrs r3, r0
	mov r1, ip
	strh r3, [r1]
	adds r1, #0x2e
	movs r0, #0x2c
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08057094 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	strb r4, [r2, #0x1c]
	strh r5, [r2, #0x16]
	ldr r0, _08057098 @ =0x08306008
	str r0, [r2, #0x18]
	mov r0, ip
	adds r0, #0x25
	strb r4, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0805709C @ =0x00000236
	bl SoundPlay
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057088: .4byte gCurrentSprite
_0805708C: .4byte 0x0000FFFB
_08057090: .4byte gIoRegisters
_08057094: .4byte 0x0000FFFC
_08057098: .4byte 0x08306008
_0805709C: .4byte 0x00000236

	thumb_func_start FrozenRidleyXRidleySpawning
FrozenRidleyXRidleySpawning: @ 0x080570A0
	push {lr}
	ldr r2, _08057104 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080570BC
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_080570BC:
	mov r1, ip
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080570EE
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _08057108 @ =0x0000FFDF
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	adds r3, r2, #0
	adds r3, #0x2f
	movs r0, #0x1e
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_080570EE:
	ldr r2, _0805710C @ =gWrittenToMosaic_H
	ldr r1, _08057110 @ =sXParasiteMosaicValues
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_08057104: .4byte gCurrentSprite
_08057108: .4byte 0x0000FFDF
_0805710C: .4byte gWrittenToMosaic_H
_08057110: .4byte sXParasiteMosaicValues

	thumb_func_start FrozenRidleyXFlyingAway
FrozenRidleyXFlyingAway: @ 0x08057114
	push {r4, r5, r6, lr}
	ldr r2, _08057144 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0805712E
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_0805712E:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _08057148
	subs r0, #1
	strb r0, [r1]
	b _08057198
	.align 2, 0
_08057144: .4byte gCurrentSprite
_08057148:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	ldrh r1, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
	movs r6, #0x31
	adds r6, r6, r2
	mov ip, r6
	ldrb r3, [r6]
	ldr r5, _08057184 @ =0x0839F718
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08057188 @ =0x00007FFF
	cmp r1, r0
	bne _0805718C
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08057196
	.align 2, 0
_08057184: .4byte 0x0839F718
_08057188: .4byte 0x00007FFF
_0805718C:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
_08057196:
	strh r0, [r2, #2]
_08057198:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FrozenRidley
FrozenRidley: @ 0x080571A0
	push {lr}
	ldr r0, _080571B8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _08057256
	lsls r0, r0, #2
	ldr r1, _080571BC @ =_080571C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080571B8: .4byte gCurrentSprite
_080571BC: .4byte _080571C0
_080571C0: @ jump table
	.4byte _08057234 @ case 0
	.4byte _0805723A @ case 1
	.4byte _08057240 @ case 2
	.4byte _08057256 @ case 3
	.4byte _08057256 @ case 4
	.4byte _08057256 @ case 5
	.4byte _08057256 @ case 6
	.4byte _08057256 @ case 7
	.4byte _08057256 @ case 8
	.4byte _08057256 @ case 9
	.4byte _08057256 @ case 10
	.4byte _08057256 @ case 11
	.4byte _08057256 @ case 12
	.4byte _08057256 @ case 13
	.4byte _08057256 @ case 14
	.4byte _08057256 @ case 15
	.4byte _08057256 @ case 16
	.4byte _08057256 @ case 17
	.4byte _08057256 @ case 18
	.4byte _08057256 @ case 19
	.4byte _08057256 @ case 20
	.4byte _08057256 @ case 21
	.4byte _08057256 @ case 22
	.4byte _08057256 @ case 23
	.4byte _08057246 @ case 24
	.4byte _08057256 @ case 25
	.4byte _0805724C @ case 26
	.4byte _08057256 @ case 27
	.4byte _08057252 @ case 28
_08057234:
	bl FrozenRidleyInit
	b _08057256
_0805723A:
	bl FrozenRidleyWaitForSamus
	b _08057256
_08057240:
	bl FrozenRidleySpawningX
	b _08057256
_08057246:
	bl FrozenRidleyClosingEye
	b _08057256
_0805724C:
	bl FrozenRidleyXSpawning
	b _08057256
_08057252:
	bl FrozenRidleyCrumbling
_08057256:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FrozenRidleyX
FrozenRidleyX: @ 0x0805725C
	push {lr}
	ldr r0, _08057274 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08057284
	cmp r0, #2
	bgt _08057278
	cmp r0, #0
	beq _0805727E
	b _0805728E
	.align 2, 0
_08057274: .4byte gCurrentSprite
_08057278:
	cmp r0, #0x18
	beq _0805728A
	b _0805728E
_0805727E:
	bl FrozenRidleyXInit
	b _0805728E
_08057284:
	bl FrozenRidleyXRidleySpawning
	b _0805728E
_0805728A:
	bl FrozenRidleyXFlyingAway
_0805728E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GoldSciserDoorLockIdle
GoldSciserDoorLockIdle: @ 0x08057294
	push {lr}
	movs r0, #0x8b
	bl CountPrimarySprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080572AE
	ldr r0, _080572B4 @ =gDoorUnlockTimer
	movs r1, #0x3c
	strb r1, [r0]
	ldr r0, _080572B8 @ =gCurrentSprite
	strh r2, [r0]
_080572AE:
	pop {r0}
	bx r0
	.align 2, 0
_080572B4: .4byte gDoorUnlockTimer
_080572B8: .4byte gCurrentSprite

	thumb_func_start GoldSciserDoorLock
GoldSciserDoorLock: @ 0x080572BC
	push {r4, r5, lr}
	ldr r2, _080572D8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r3, [r1]
	cmp r3, #0
	beq _080572DC
	cmp r3, #2
	beq _08057344
	b _08057348
	.align 2, 0
_080572D8: .4byte gCurrentSprite
_080572DC:
	adds r0, r2, #0
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #2
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r5, #0
	ldr r1, _08057330 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _08057334 @ =0x08337FA4
	str r0, [r2, #0x18]
	strb r5, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldr r0, _08057338 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, _0805733C @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	bne _08057328
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
_08057328:
	ldr r0, _08057340 @ =0x03000047
	strb r4, [r0]
	b _08057348
	.align 2, 0
_08057330: .4byte 0x0000FFFC
_08057334: .4byte 0x08337FA4
_08057338: .4byte gIoRegisters
_0805733C: .4byte gDebugFlag
_08057340: .4byte 0x03000047
_08057344:
	bl GoldSciserDoorLockIdle
_08057348:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start GoldZebesianDoorLockIdle
GoldZebesianDoorLockIdle: @ 0x08057350
	push {lr}
	movs r0, #0xa2
	bl CountPrimarySprite
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805736A
	ldr r0, _08057370 @ =gDoorUnlockTimer
	movs r1, #0x3c
	strb r1, [r0]
	ldr r0, _08057374 @ =gCurrentSprite
	strh r2, [r0]
_0805736A:
	pop {r0}
	bx r0
	.align 2, 0
_08057370: .4byte gDoorUnlockTimer
_08057374: .4byte gCurrentSprite

	thumb_func_start GoldZebesianDoorLock
GoldZebesianDoorLock: @ 0x08057378
	push {r4, r5, lr}
	ldr r2, _08057394 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	ldrb r3, [r1]
	cmp r3, #0
	beq _08057398
	cmp r3, #2
	beq _08057400
	b _08057404
	.align 2, 0
_08057394: .4byte gCurrentSprite
_08057398:
	adds r0, r2, #0
	adds r0, #0x25
	strb r3, [r0]
	movs r0, #2
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	movs r5, #0
	ldr r1, _080573EC @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _080573F0 @ =0x08337FA4
	str r0, [r2, #0x18]
	strb r5, [r2, #0x1c]
	strh r3, [r2, #0x16]
	ldr r0, _080573F4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r0, _080573F8 @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	bne _080573E4
	ldrh r0, [r2]
	movs r1, #4
	orrs r0, r1
	strh r0, [r2]
_080573E4:
	ldr r0, _080573FC @ =0x03000047
	strb r4, [r0]
	b _08057404
	.align 2, 0
_080573EC: .4byte 0x0000FFFC
_080573F0: .4byte 0x08337FA4
_080573F4: .4byte gIoRegisters
_080573F8: .4byte gDebugFlag
_080573FC: .4byte 0x03000047
_08057400:
	bl GoldZebesianDoorLockIdle
_08057404:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MegaXUpdatePalette
MegaXUpdatePalette: @ 0x0805740C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805742C @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r1, _08057430 @ =sSecondarySpriteStats
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r4, _08057434 @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _08057438
	cmp r1, #1
	beq _08057450
	b _08057466
	.align 2, 0
_0805742C: .4byte gCurrentSprite
_08057430: .4byte sSecondarySpriteStats
_08057434: .4byte gBossWork1
_08057438:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _08057466
	ldr r7, _0805744C @ =0x083A5498
	movs r0, #1
	strb r0, [r4]
	b _0805746A
	.align 2, 0
_0805744C: .4byte 0x083A5498
_08057450:
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _08057466
	ldr r7, _08057480 @ =0x083A54B8
	movs r0, #2
	strb r0, [r4]
	movs r6, #1
_08057466:
	cmp r6, #0
	beq _08057478
_0805746A:
	ldr r1, _08057484 @ =0x040000D4
	str r7, [r1]
	ldr r0, _08057488 @ =0x05000380
	str r0, [r1, #4]
	ldr r0, _0805748C @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_08057478:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08057480: .4byte 0x083A54B8
_08057484: .4byte 0x040000D4
_08057488: .4byte 0x05000380
_0805748C: .4byte 0x80000010

	thumb_func_start MegaXDestroyShields
MegaXDestroyShields: @ 0x08057490
	push {r4, lr}
	movs r3, #0
	ldr r4, _080574D8 @ =gSpriteData
_08057496:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080574C6
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080574C6
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x4a
	bne _080574C6
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	beq _080574C6
	movs r0, #0
	strh r0, [r2, #0x14]
_080574C6:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _08057496
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080574D8: .4byte gSpriteData

	thumb_func_start MegaXTurningIntoX_Unused
MegaXTurningIntoX_Unused: @ 0x080574DC
	push {lr}
	ldr r1, _08057508 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r0, [r1, #6]
	subs r0, #1
	strh r0, [r1, #6]
	lsls r0, r0, #0x10
	adds r3, r1, #0
	cmp r0, #0
	beq _08057514
	ldr r2, _0805750C @ =gWrittenToMosaic_H
	ldr r1, _08057510 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08057532
	.align 2, 0
_08057508: .4byte gCurrentSprite
_0805750C: .4byte gWrittenToMosaic_H
_08057510: .4byte sXParasiteMosaicValues
_08057514:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _08057544 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _08057548 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
_08057532:
	ldrh r0, [r3, #6]
	cmp r0, #7
	bhi _0805754C
	adds r2, r0, #0
	movs r0, #0x21
	movs r1, #6
	bl SpriteLoadGfx
	b _0805755A
	.align 2, 0
_08057544: .4byte 0x0000FFDF
_08057548: .4byte gIoRegisters
_0805754C:
	cmp r0, #8
	bne _0805755A
	movs r0, #0x21
	movs r1, #6
	movs r2, #2
	bl SpriteLoadPal
_0805755A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start VariaSuitAbilityInit
VariaSuitAbilityInit: @ 0x08057560
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _08057580 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r7, #0x10
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _08057588
	ldr r1, _08057584 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _08057694
	.align 2, 0
_08057580: .4byte gEquipment
_08057584: .4byte gCurrentSprite
_08057588:
	ldr r0, _0805769C @ =gBossWork1
	strb r6, [r0]
	ldr r5, _080576A0 @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080576A4 @ =0xFFFFFF00
	adds r1, r0, #0
	ldrh r0, [r5, #2]
	adds r1, r1, r0
	movs r4, #0
	strh r1, [r5, #2]
	ldrh r0, [r5, #4]
	subs r0, #0x80
	strh r0, [r5, #4]
	strh r1, [r5, #6]
	strh r0, [r5, #8]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	ldrh r2, [r5]
	movs r0, #4
	orrs r2, r0
	orrs r2, r4
	strh r2, [r5]
	ldr r3, _080576A8 @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	ldr r0, _080576AC @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r1, #0
	orrs r2, r0
	strh r2, [r5]
	adds r0, r5, #0
	adds r0, #0x27
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r0, #1
	strb r7, [r0]
	ldr r1, _080576B0 @ =0x0000FFE0
	strh r1, [r5, #0xa]
	movs r0, #0x20
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _080576B4 @ =0x083A59B0
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r6, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r4, [r0]
	strh r7, [r5, #0x12]
	adds r0, #2
	strb r4, [r0]
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	adds r4, r5, #0
	adds r4, #0x23
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x78
	bl SpriteSpawnSecondary
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x60
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x1c
	movs r1, #2
	bl SpriteSpawnSecondary
_08057694:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805769C: .4byte gBossWork1
_080576A0: .4byte gCurrentSprite
_080576A4: .4byte 0xFFFFFF00
_080576A8: .4byte sPrimarySpriteStats
_080576AC: .4byte gIoRegisters
_080576B0: .4byte 0x0000FFE0
_080576B4: .4byte 0x083A59B0

	thumb_func_start VariaSuitAbilityWaitingToSpawn
VariaSuitAbilityWaitingToSpawn: @ 0x080576B8
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _080576EA
	ldr r2, _080576F0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	movs r1, #0
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	movs r0, #0x40
	movs r1, #7
	bl PlayMusic
_080576EA:
	pop {r0}
	bx r0
	.align 2, 0
_080576F0: .4byte gCurrentSprite

	thumb_func_start VariaSuitAbilitySpawning
VariaSuitAbilitySpawning: @ 0x080576F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r3, _08057724 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08057728 @ =0x083A1304
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, _0805772C @ =0x00007FFF
	adds r4, r3, #0
	cmp r1, r0
	bne _08057730
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0805773A
	.align 2, 0
_08057724: .4byte gCurrentSprite
_08057728: .4byte 0x083A1304
_0805772C: .4byte 0x00007FFF
_08057730:
	adds r0, r2, #1
	mov r7, ip
	strb r0, [r7]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
_0805773A:
	strh r0, [r4, #2]
	adds r6, r4, #0
	adds r6, #0x30
	ldrb r2, [r6]
	ldr r5, _08057764 @ =0x083A1386
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08057768 @ =0x00007FFF
	cmp r1, r0
	bne _0805776C
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #4]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08057774
	.align 2, 0
_08057764: .4byte 0x083A1386
_08057768: .4byte 0x00007FFF
_0805776C:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r4, #4]
	adds r0, r0, r3
_08057774:
	strh r0, [r4, #4]
	adds r1, r4, #0
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _080577A4
	ldrh r2, [r1, #0x12]
	ldr r0, _08057794 @ =0x000001FF
	cmp r2, r0
	bhi _08057798
	adds r0, r2, #0
	adds r0, #0x10
	strh r0, [r1, #0x12]
	b _08057870
	.align 2, 0
_08057794: .4byte 0x000001FF
_08057798:
	movs r0, #1
	strb r0, [r3]
	adds r1, #0x2f
	movs r0, #0x3c
	strb r0, [r1]
	b _08057870
_080577A4:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08057870
	subs r1, #0xb
	movs r0, #0x39
	strb r0, [r1]
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x4a
	movs r1, #7
	bl SpriteSpawnSecondary
_08057870:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start VariaSuitAbilityMovingInit
VariaSuitAbilityMovingInit: @ 0x08057878
	ldr r3, _0805789C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x3a
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
_0805789C: .4byte gCurrentSprite

	thumb_func_start VariaSuitAbilityMoving
VariaSuitAbilityMoving: @ 0x080578A0
	push {lr}
	sub sp, #8
	ldr r0, _080578BC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080578C8
	ldr r1, _080578C0 @ =gSamusData
	ldr r2, _080578C4 @ =0xFFFFFEC0
	adds r0, r2, #0
	ldrh r2, [r1, #0x18]
	adds r0, r0, r2
	b _080578CE
	.align 2, 0
_080578BC: .4byte gFrameCounter8Bit
_080578C0: .4byte gSamusData
_080578C4: .4byte 0xFFFFFEC0
_080578C8:
	ldr r1, _080578EC @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
_080578CE:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r0, #2
	str r0, [sp]
	movs r0, #0xc0
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x38
	movs r3, #0x50
	bl XParasiteMoveWithSound
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080578EC: .4byte gSamusData

	thumb_func_start VariaSuitAbilityShrinking
VariaSuitAbilityShrinking: @ 0x080578F0
	push {lr}
	ldr r2, _08057908 @ =gCurrentSprite
	ldrh r1, [r2, #0x12]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bls _0805790C
	adds r0, r1, #0
	subs r0, #0x10
	strh r0, [r2, #0x12]
	b _08057922
	.align 2, 0
_08057908: .4byte gCurrentSprite
_0805790C:
	ldrh r1, [r2]
	ldr r0, _08057928 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #9
	strb r0, [r1]
_08057922:
	pop {r0}
	bx r0
	.align 2, 0
_08057928: .4byte 0x0000FFFB

	thumb_func_start VariaSuitAbilityShrinked
VariaSuitAbilityShrinked: @ 0x0805792C
	bx lr
	.align 2, 0

	thumb_func_start VariaSuitAbilityTurningIntoCoreX
VariaSuitAbilityTurningIntoCoreX: @ 0x08057930
	push {lr}
	ldr r1, _0805795C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805794A
	adds r1, #0x24
	movs r0, #0x3f
	strb r0, [r1]
_0805794A:
	ldrb r0, [r2]
	cmp r0, #7
	bhi _08057960
	adds r2, r0, #0
	movs r0, #0x21
	movs r1, #6
	bl SpriteLoadGfx
	b _0805796E
	.align 2, 0
_0805795C: .4byte gCurrentSprite
_08057960:
	cmp r0, #8
	bne _0805796E
	movs r0, #0x21
	movs r1, #6
	movs r2, #2
	bl SpriteLoadPal
_0805796E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start VariaSuitAbilityCoreXMovingInit
VariaSuitAbilityCoreXMovingInit: @ 0x08057974
	ldr r3, _08057998 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x40
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
_08057998: .4byte gCurrentSprite

	thumb_func_start VariaSuitAbilityCoreXMoving
VariaSuitAbilityCoreXMoving: @ 0x0805799C
	push {lr}
	sub sp, #8
	ldr r1, _080579C4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0xc0
	str r2, [sp, #4]
	movs r2, #0x1c
	movs r3, #0x28
	bl XParasiteMoveWithSound
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_080579C4: .4byte gSamusData

	thumb_func_start VariaSuitAbilityCoreXMovingInit_Unused
VariaSuitAbilityCoreXMovingInit_Unused: @ 0x080579C8
	ldr r3, _080579EC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x42
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
_080579EC: .4byte gCurrentSprite

	thumb_func_start VariaSuitAbilityCoreXMoving_Unused
VariaSuitAbilityCoreXMoving_Unused: @ 0x080579F0
	push {lr}
	sub sp, #8
	ldr r1, _08057A18 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0xc0
	str r2, [sp, #4]
	movs r2, #0x1c
	movs r3, #0x28
	bl XParasiteMoveWithSound
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_08057A18: .4byte gSamusData

	thumb_func_start MegaXShieldInit
MegaXShieldInit: @ 0x08057A1C
	push {r4, lr}
	ldr r0, _08057AA0 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08057AA4 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r2, #0
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08057AA8 @ =gIoRegisters
	ldrb r1, [r1, #0xa]
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0xc
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08057AAC @ =0x0000FFE0
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #0x20
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08057AB0 @ =0x083A5EF8
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r2, [r4, #0x16]
	mov r0, ip
	adds r0, #0x25
	movs r2, #2
	strb r2, [r0]
	ldr r1, _08057AB4 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #0x12]
	mov r0, ip
	adds r0, #0x30
	strb r3, [r0]
	ldrb r0, [r4, #0x1e]
	lsls r0, r0, #5
	mov r1, ip
	adds r1, #0x2f
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057AA0: .4byte gCurrentSprite
_08057AA4: .4byte 0x0000FFFB
_08057AA8: .4byte gIoRegisters
_08057AAC: .4byte 0x0000FFE0
_08057AB0: .4byte 0x083A5EF8
_08057AB4: .4byte sSecondarySpriteStats

	thumb_func_start MegaXShieldIdle
MegaXShieldIdle: @ 0x08057AB8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08057AD8 @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	adds r4, r0, #0
	cmp r5, #0
	bne _08057ADC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x22
	bl ParticleSet
	strh r5, [r4]
	b _08057BD6
	.align 2, 0
_08057AD8: .4byte gCurrentSprite
_08057ADC:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #3
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0
	beq _08057B08
	ldrh r1, [r4, #0x12]
	ldr r0, _08057B00 @ =0x0000013F
	cmp r1, r0
	bhi _08057B04
	adds r0, r1, #2
	strh r0, [r4, #0x12]
	b _08057B18
	.align 2, 0
_08057B00: .4byte 0x0000013F
_08057B04:
	movs r0, #0
	b _08057B16
_08057B08:
	ldrh r0, [r4, #0x12]
	cmp r0, #0xc0
	bls _08057B14
	subs r0, #2
	strh r0, [r4, #0x12]
	b _08057B18
_08057B14:
	movs r0, #1
_08057B16:
	strb r0, [r2]
_08057B18:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r6, [r0]
	ldrh r3, [r4, #0x12]
	adds r0, #0xc
	ldrb r7, [r0]
	ldr r1, _08057B5C @ =0x080A4FA4
	lsls r0, r7, #1
	adds r0, r0, r1
	movs r5, #0
	ldrsh r2, [r0, r5]
	mov r8, r1
	cmp r2, #0
	bge _08057B64
	rsbs r2, r2, #0
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	muls r0, r2, r0
	adds r5, r1, #0
	cmp r0, #0
	bge _08057B44
	adds r0, #0xff
_08057B44:
	lsls r0, r0, #8
	lsrs r3, r0, #0x10
	ldr r1, _08057B60 @ =gSpriteData
	lsls r2, r6, #3
	subs r0, r2, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	subs r0, r0, r3
	strh r0, [r4, #2]
	mov ip, r1
	b _08057B8A
	.align 2, 0
_08057B5C: .4byte 0x080A4FA4
_08057B60: .4byte gSpriteData
_08057B64:
	lsls r1, r3, #0x10
	asrs r0, r1, #0x10
	muls r2, r0, r2
	adds r5, r1, #0
	cmp r2, #0
	bge _08057B72
	adds r2, #0xff
_08057B72:
	lsls r1, r2, #8
	ldr r2, _08057BB8 @ =gSpriteData
	lsls r3, r6, #3
	subs r0, r3, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	lsrs r1, r1, #0x10
	ldrh r0, [r0, #2]
	adds r1, r1, r0
	strh r1, [r4, #2]
	mov ip, r2
	adds r2, r3, #0
_08057B8A:
	adds r0, r7, #0
	adds r0, #0x40
	lsls r0, r0, #1
	add r0, r8
	movs r3, #0
	ldrsh r1, [r0, r3]
	cmp r1, #0
	bge _08057BBC
	rsbs r1, r1, #0
	asrs r0, r5, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _08057BA6
	adds r0, #0xff
_08057BA6:
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	subs r0, r2, r6
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #4]
	subs r0, r0, r1
	strh r0, [r4, #4]
	b _08057BD6
	.align 2, 0
_08057BB8: .4byte gSpriteData
_08057BBC:
	asrs r0, r5, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _08057BC6
	adds r0, #0xff
_08057BC6:
	lsls r1, r0, #8
	subs r0, r2, r6
	lsls r0, r0, #3
	add r0, ip
	lsrs r1, r1, #0x10
	ldrh r0, [r0, #4]
	adds r1, r1, r0
	strh r1, [r4, #4]
_08057BD6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start VariaSuitAbility
VariaSuitAbility: @ 0x08057BE0
	push {lr}
	ldr r0, _08057BF8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5f
	bls _08057BEE
	b _08057DD2
_08057BEE:
	lsls r0, r0, #2
	ldr r1, _08057BFC @ =_08057C00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057BF8: .4byte gCurrentSprite
_08057BFC: .4byte _08057C00
_08057C00: @ jump table
	.4byte _08057D80 @ case 0
	.4byte _08057DD2 @ case 1
	.4byte _08057DD2 @ case 2
	.4byte _08057DD2 @ case 3
	.4byte _08057DD2 @ case 4
	.4byte _08057DD2 @ case 5
	.4byte _08057DD2 @ case 6
	.4byte _08057DD2 @ case 7
	.4byte _08057DD2 @ case 8
	.4byte _08057DD2 @ case 9
	.4byte _08057DD2 @ case 10
	.4byte _08057DD2 @ case 11
	.4byte _08057DD2 @ case 12
	.4byte _08057DD2 @ case 13
	.4byte _08057DD2 @ case 14
	.4byte _08057DD2 @ case 15
	.4byte _08057DD2 @ case 16
	.4byte _08057DD2 @ case 17
	.4byte _08057DD2 @ case 18
	.4byte _08057DD2 @ case 19
	.4byte _08057DD2 @ case 20
	.4byte _08057DD2 @ case 21
	.4byte _08057DD2 @ case 22
	.4byte _08057DD2 @ case 23
	.4byte _08057DD2 @ case 24
	.4byte _08057DD2 @ case 25
	.4byte _08057DD2 @ case 26
	.4byte _08057DD2 @ case 27
	.4byte _08057DD2 @ case 28
	.4byte _08057DD2 @ case 29
	.4byte _08057DD2 @ case 30
	.4byte _08057DD2 @ case 31
	.4byte _08057DD2 @ case 32
	.4byte _08057DD2 @ case 33
	.4byte _08057DD2 @ case 34
	.4byte _08057DD2 @ case 35
	.4byte _08057DD2 @ case 36
	.4byte _08057DD2 @ case 37
	.4byte _08057DD2 @ case 38
	.4byte _08057DD2 @ case 39
	.4byte _08057DD2 @ case 40
	.4byte _08057DD2 @ case 41
	.4byte _08057DD2 @ case 42
	.4byte _08057DD2 @ case 43
	.4byte _08057DD2 @ case 44
	.4byte _08057DD2 @ case 45
	.4byte _08057DD2 @ case 46
	.4byte _08057DD2 @ case 47
	.4byte _08057DD2 @ case 48
	.4byte _08057DD2 @ case 49
	.4byte _08057DD2 @ case 50
	.4byte _08057DD2 @ case 51
	.4byte _08057DD2 @ case 52
	.4byte _08057DD2 @ case 53
	.4byte _08057DD2 @ case 54
	.4byte _08057D86 @ case 55
	.4byte _08057D8C @ case 56
	.4byte _08057D92 @ case 57
	.4byte _08057D98 @ case 58
	.4byte _08057D9E @ case 59
	.4byte _08057DA4 @ case 60
	.4byte _08057DAA @ case 61
	.4byte _08057DD2 @ case 62
	.4byte _08057DB0 @ case 63
	.4byte _08057DB6 @ case 64
	.4byte _08057DD2 @ case 65
	.4byte _08057DD2 @ case 66
	.4byte _08057DD2 @ case 67
	.4byte _08057DD2 @ case 68
	.4byte _08057DD2 @ case 69
	.4byte _08057DD2 @ case 70
	.4byte _08057DD2 @ case 71
	.4byte _08057DD2 @ case 72
	.4byte _08057DD2 @ case 73
	.4byte _08057DD2 @ case 74
	.4byte _08057DD2 @ case 75
	.4byte _08057DD2 @ case 76
	.4byte _08057DD2 @ case 77
	.4byte _08057DD2 @ case 78
	.4byte _08057DD2 @ case 79
	.4byte _08057DD2 @ case 80
	.4byte _08057DD2 @ case 81
	.4byte _08057DD2 @ case 82
	.4byte _08057DD2 @ case 83
	.4byte _08057DD2 @ case 84
	.4byte _08057DD2 @ case 85
	.4byte _08057DD2 @ case 86
	.4byte _08057DD2 @ case 87
	.4byte _08057DD2 @ case 88
	.4byte _08057DD2 @ case 89
	.4byte _08057DD2 @ case 90
	.4byte _08057DD2 @ case 91
	.4byte _08057DBC @ case 92
	.4byte _08057DC2 @ case 93
	.4byte _08057DC8 @ case 94
	.4byte _08057DCE @ case 95
_08057D80:
	bl VariaSuitAbilityInit
	b _08057DD2
_08057D86:
	bl VariaSuitAbilityWaitingToSpawn
	b _08057DD2
_08057D8C:
	bl VariaSuitAbilitySpawning
	b _08057DD2
_08057D92:
	bl VariaSuitAbilityMovingInit
	b _08057DD2
_08057D98:
	bl VariaSuitAbilityMoving
	b _08057DD2
_08057D9E:
	bl VariaSuitAbilityShrinking
	b _08057DD2
_08057DA4:
	bl VariaSuitAbilityShrinked
	b _08057DD2
_08057DAA:
	bl VariaSuitAbilityTurningIntoCoreX
	b _08057DD2
_08057DB0:
	bl VariaSuitAbilityCoreXMovingInit
	b _08057DD2
_08057DB6:
	bl VariaSuitAbilityCoreXMoving
	b _08057DD2
_08057DBC:
	bl CoreXAbilityMovingToTargetInit
	b _08057DD2
_08057DC2:
	bl CoreXAbilityMovingToTarget
	b _08057DD2
_08057DC8:
	bl CoreXAbilityWaitingAtTarget
	b _08057DD2
_08057DCE:
	bl CoreXAbilityGettingAbsorbed
_08057DD2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MegaX
MegaX: @ 0x08057DD8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08057E30 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r7, [r1]
	adds r5, r0, #0
	adds r5, #0x24
	ldrb r3, [r5]
	adds r4, r0, #0
	cmp r3, #0
	beq _08057E38
	cmp r3, #0x18
	bne _08057EB0
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08057E1A
	b _0805813E
_08057E1A:
	ldr r0, _08057E34 @ =gSpriteData
	lsls r1, r7, #3
	subs r1, r1, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	movs r0, #0x3d
	strb r0, [r1]
	strh r2, [r4]
	b _0805813E
	.align 2, 0
_08057E30: .4byte gCurrentSprite
_08057E34: .4byte gSpriteData
_08057E38:
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #4
	strb r0, [r1]
	subs r1, #0x13
	movs r0, #3
	strb r0, [r1]
	ldr r1, _08057EDC @ =gIoRegisters
	ldrb r1, [r1, #0xa]
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x21
	strb r0, [r1]
	ldr r1, _08057EE0 @ =sSecondarySpriteStats
	ldrb r0, [r4, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08057EE4 @ =0x0000FF70
	strh r1, [r4, #0xa]
	movs r0, #0x90
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08057EE8 @ =0x083A5E70
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	movs r0, #2
	strb r0, [r5]
	ldrh r0, [r4]
	ldr r3, _08057EEC @ =0x00004008
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x10
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r2, [r0]
_08057EB0:
	ldr r2, _08057EF0 @ =gSpriteData
	lsls r3, r7, #3
	subs r0, r3, r7
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r4, #2]
	ldrh r1, [r0, #4]
	strh r1, [r4, #4]
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x37
	mov r8, r2
	adds r6, r3, #0
	cmp r0, #4
	bls _08057ED2
	b _0805813A
_08057ED2:
	lsls r0, r0, #2
	ldr r1, _08057EF4 @ =_08057EF8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08057EDC: .4byte gIoRegisters
_08057EE0: .4byte sSecondarySpriteStats
_08057EE4: .4byte 0x0000FF70
_08057EE8: .4byte 0x083A5E70
_08057EEC: .4byte 0x00004008
_08057EF0: .4byte gSpriteData
_08057EF4: .4byte _08057EF8
_08057EF8: @ jump table
	.4byte _08057F0C @ case 0
	.4byte _08057F16 @ case 1
	.4byte _08057FE4 @ case 2
	.4byte _08057FEC @ case 3
	.4byte _08057F38 @ case 4
_08057F0C:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _0805813A
_08057F16:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08057F34 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #0x12]
	strh r0, [r4, #0x12]
	b _0805813A
	.align 2, 0
_08057F34: .4byte 0x0000FFFB
_08057F38:
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08057FBC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08057F6C
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08057F66
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r4, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_08057F66:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_08057F6C:
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0, #0x12]
	strh r0, [r4, #0x12]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08057FC4
	adds r0, r4, #0
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldrh r1, [r4]
	ldr r0, _08057FC0 @ =0x0000BFF7
	ands r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #0xe
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, #0x18
	ldrh r1, [r4, #4]
	movs r2, #0x3a
	bl ParticleSet
	b _0805813A
	.align 2, 0
_08057FBC: .4byte gFrameCounter8Bit
_08057FC0: .4byte 0x0000BFF7
_08057FC4:
	ldr r0, _08057FE0 @ =0x0000017F
	cmp r1, r0
	bls _08057FCC
	b _0805813A
_08057FCC:
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	b _0805813A
	.align 2, 0
_08057FE0: .4byte 0x0000017F
_08057FE4:
	ldrh r1, [r4]
	ldr r0, _08058040 @ =0x00007FFF
	ands r0, r1
	strh r0, [r4]
_08057FEC:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _080580DC
	movs r0, #0xdf
	lsls r0, r0, #1
	bl SoundPlay
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	movs r3, #0
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08058044 @ =0x083A5ED0
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	movs r2, #0
	mov ip, r2
	strh r3, [r4, #0x16]
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _0805804C
	adds r0, r4, #0
	adds r0, #0x25
	mov r3, ip
	strb r3, [r0]
	ldr r1, _08058048 @ =gSpriteData
	subs r0, r6, r7
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0x3b
	strb r1, [r0]
	bl MegaXDestroyShields
	b _0805813E
	.align 2, 0
_08058040: .4byte 0x00007FFF
_08058044: .4byte 0x083A5ED0
_08058048: .4byte gSpriteData
_0805804C:
	ldr r3, _08058078 @ =gSpriteData
	subs r0, r6, r7
	lsls r0, r0, #3
	adds r5, r0, r3
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r2, [r4, #2]
	ldr r1, _0805807C @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x40
	mov r8, r3
	adds r3, r1, #0
	cmp r2, r0
	ble _08058080
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	b _08058086
	.align 2, 0
_08058078: .4byte gSpriteData
_0805807C: .4byte gSamusData
_08058080:
	ldrh r1, [r5]
	ldr r0, _080580A8 @ =0x0000FBFF
	ands r0, r1
_08058086:
	strh r0, [r5]
	ldr r1, _080580AC @ =gCurrentSprite
	ldrh r0, [r1, #4]
	adds r4, r1, #0
	ldrh r3, [r3, #0x16]
	cmp r0, r3
	bls _080580B0
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	ldrh r2, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r1, r2
	b _080580BC
	.align 2, 0
_080580A8: .4byte 0x0000FBFF
_080580AC: .4byte gCurrentSprite
_080580B0:
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	ldrh r2, [r0]
	ldr r1, _08058148 @ =0x0000FDFF
	ands r1, r2
_080580BC:
	strh r1, [r0]
	subs r0, r6, r7
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2f
	movs r1, #0x50
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	movs r1, #0x38
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
_080580DC:
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	adds r0, #0x2d
	ldrb r1, [r0]
	cmp r1, #0
	beq _0805813A
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08058112
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805810C
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r2, [r4, #0x1f]
	adds r0, r0, r2
	movs r1, #0xd
	subs r1, r1, r0
_0805810C:
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
_08058112:
	subs r0, r6, r7
	lsls r0, r0, #3
	add r0, r8
	adds r0, #0x2d
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r3, #0
	bne _0805813A
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r3, [r0]
_0805813A:
	bl MegaXUpdatePalette
_0805813E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058148: .4byte 0x0000FDFF

	thumb_func_start CoreXShellVaria
CoreXShellVaria: @ 0x0805814C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	ldr r2, _08058190 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov r8, r0
	ldr r1, _08058194 @ =sSecondarySpriteStats
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r4, r2, #0
	adds r4, #0x24
	ldrb r3, [r4]
	adds r5, r2, #0
	cmp r3, #0
	beq _08058198
	cmp r3, #0x18
	bne _08058206
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	bne _0805818A
	b _080584FC
_0805818A:
	movs r0, #0
	strh r0, [r5]
	b _080584FC
	.align 2, 0
_08058190: .4byte gCurrentSprite
_08058194: .4byte sSecondarySpriteStats
_08058198:
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0x13
	movs r0, #5
	strb r0, [r1]
	ldr r0, _08058234 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r5, #0
	adds r1, #0x21
	strb r0, [r1]
	strh r6, [r5, #0x14]
	adds r0, r5, #0
	adds r0, #0x27
	movs r1, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08058238 @ =0x0000FFB0
	strh r1, [r5, #0xa]
	movs r0, #0x50
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _0805823C @ =0x083A5E40
	str r0, [r5, #0x18]
	strb r2, [r5, #0x1c]
	strh r3, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #2
	strb r0, [r4]
	ldrh r0, [r5]
	ldr r3, _08058240 @ =0x00004008
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
	movs r0, #0x10
	strh r0, [r5, #0x12]
	adds r0, r5, #0
	adds r0, #0x2b
	strb r2, [r0]
_08058206:
	ldr r2, _08058244 @ =gSpriteData
	mov r0, r8
	lsls r3, r0, #3
	subs r0, r3, r0
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r5, #2]
	ldrh r1, [r0, #4]
	strh r1, [r5, #4]
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #0x37
	mov ip, r2
	adds r7, r3, #0
	cmp r0, #9
	bls _0805822A
	b _080584FC
_0805822A:
	lsls r0, r0, #2
	ldr r1, _08058248 @ =_0805824C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08058234: .4byte gIoRegisters
_08058238: .4byte 0x0000FFB0
_0805823C: .4byte 0x083A5E40
_08058240: .4byte 0x00004008
_08058244: .4byte gSpriteData
_08058248: .4byte _0805824C
_0805824C: @ jump table
	.4byte _08058274 @ case 0
	.4byte _0805827E @ case 1
	.4byte _080584FC @ case 2
	.4byte _080584FC @ case 3
	.4byte _080582A0 @ case 4
	.4byte _080584FC @ case 5
	.4byte _080584FC @ case 6
	.4byte _080584FC @ case 7
	.4byte _08058300 @ case 8
	.4byte _08058310 @ case 9
_08058274:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _080584FC
_0805827E:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r5]
	ldr r0, _0805829C @ =0x0000FFFB
	ands r0, r1
	strh r0, [r5]
	mov r1, r8
	subs r0, r7, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #0x12]
	strh r0, [r5, #0x12]
	b _080584FC
	.align 2, 0
_0805829C: .4byte 0x0000FFFB
_080582A0:
	adds r1, r5, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0, #0x12]
	strh r0, [r5, #0x12]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _080582E0
	ldrh r1, [r5]
	ldr r0, _080582DC @ =0x0000BFF7
	ands r0, r1
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080584FC
	.align 2, 0
_080582DC: .4byte 0x0000BFF7
_080582E0:
	ldr r0, _080582FC @ =0x0000017F
	cmp r1, r0
	bls _080582E8
	b _080584FC
_080582E8:
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	b _080584FC
	.align 2, 0
_080582FC: .4byte 0x0000017F
_08058300:
	ldrh r0, [r5]
	ldr r1, _08058344 @ =0x00007FFF
	ands r1, r0
	strh r1, [r5]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
_08058310:
	ldrh r4, [r5, #0x14]
	cmp r4, #0
	bne _0805834C
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	ldr r0, _08058348 @ =0x083A5B68
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	mov r3, r8
	subs r0, r7, r3
	lsls r0, r0, #3
	add r0, ip
	adds r0, #0x24
	movs r1, #0x5c
	strb r1, [r0]
	movs r0, #0xc1
	bl SoundPlay
	b _080584FC
	.align 2, 0
_08058344: .4byte 0x00007FFF
_08058348: .4byte 0x083A5B68
_0805834C:
	adds r0, r6, #0
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bhi _0805836C
	ldr r0, _08058368 @ =0x083A5E60
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #3
	b _08058384
	.align 2, 0
_08058368: .4byte 0x083A5E60
_0805836C:
	ldrh r4, [r5, #0x14]
	lsls r0, r6, #1
	movs r1, #3
	bl __divsi3
	cmp r4, r0
	bgt _08058386
	ldr r0, _080583C8 @ =0x083A5E50
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #2
_08058384:
	strb r0, [r1]
_08058386:
	adds r6, r5, #0
	adds r0, r6, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #1
	bne _080583CC
	movs r0, #0x32
	bl CountPrimarySprite
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #5
	bhi _08058482
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r3, [r0]
	movs r0, #0x20
	str r0, [sp]
	ldrh r0, [r6, #2]
	str r0, [sp, #4]
	ldrh r0, [r6, #4]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x32
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnNewXParasite
	b _08058482
	.align 2, 0
_080583C8: .4byte 0x083A5E50
_080583CC:
	cmp r1, #0x10
	bne _08058482
	movs r0, #0xc2
	bl SoundPlay
	adds r2, r5, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0805840C @ =gSpriteData
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0xb4
	strb r0, [r1]
	ldrh r1, [r5, #2]
	ldr r0, _08058410 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x40
	cmp r1, r0
	ble _08058414
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	b _0805841A
	.align 2, 0
_0805840C: .4byte gSpriteData
_08058410: .4byte gSamusData
_08058414:
	ldrh r1, [r3]
	ldr r0, _08058440 @ =0x0000FBFF
	ands r0, r1
_0805841A:
	strh r0, [r3]
	ldr r0, _08058444 @ =gCurrentSprite
	ldr r1, _08058448 @ =gSamusData
	ldrh r0, [r0, #4]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _08058450
	ldr r0, _0805844C @ =gSpriteData
	mov r3, r8
	subs r1, r7, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r2
	b _08058460
	.align 2, 0
_08058440: .4byte 0x0000FBFF
_08058444: .4byte gCurrentSprite
_08058448: .4byte gSamusData
_0805844C: .4byte gSpriteData
_08058450:
	ldr r0, _080584C0 @ =gSpriteData
	mov r2, r8
	subs r1, r7, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r2, [r1]
	ldr r0, _080584C4 @ =0x0000FDFF
	ands r0, r2
_08058460:
	strh r0, [r1]
	ldr r1, _080584C0 @ =gSpriteData
	mov r3, r8
	subs r0, r7, r3
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2f
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	movs r1, #0x1c
	strb r1, [r0]
	adds r0, #3
	strb r1, [r0]
_08058482:
	ldr r1, _080584C0 @ =gSpriteData
	mov r2, r8
	subs r0, r7, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x2d
	ldrb r4, [r0]
	mov ip, r1
	cmp r4, #0
	beq _080584FC
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _080584D2
	movs r0, #4
	ands r4, r0
	lsls r0, r4, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _080584CC
	ldr r0, _080584C8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x35
	ldrb r1, [r1]
	ldrb r3, [r0, #0x1f]
	adds r1, r1, r3
	movs r2, #0xd
	subs r2, r2, r1
	adds r0, #0x20
	strb r2, [r0]
	b _080584D2
	.align 2, 0
_080584C0: .4byte gSpriteData
_080584C4: .4byte 0x0000FDFF
_080584C8: .4byte gCurrentSprite
_080584CC:
	ldr r0, _08058508 @ =gCurrentSprite
	adds r0, #0x20
	strb r1, [r0]
_080584D2:
	mov r1, r8
	subs r0, r7, r1
	lsls r0, r0, #3
	add r0, ip
	adds r0, #0x2d
	ldrb r1, [r0]
	subs r1, #1
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	cmp r4, #0
	bne _080584FC
	ldr r1, _08058508 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x34
	ldrb r2, [r3]
	movs r0, #0xbf
	ands r0, r2
	strb r0, [r3]
	adds r1, #0x20
	strb r4, [r1]
_080584FC:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08058508: .4byte gCurrentSprite

	thumb_func_start MegaXShield
MegaXShield: @ 0x0805850C
	push {lr}
	ldr r0, _08058520 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08058524
	cmp r0, #2
	beq _0805852A
	b _0805852E
	.align 2, 0
_08058520: .4byte gCurrentSprite
_08058524:
	bl MegaXShieldInit
	b _0805852E
_0805852A:
	bl MegaXShieldIdle
_0805852E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start OmegaHuskSetCollision
OmegaHuskSetCollision: @ 0x08058534
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _080585D8 @ =gCurrentSprite
	ldrh r7, [r0, #2]
	ldr r1, _080585DC @ =0xFFFFFC80
	adds r4, r1, #0
	ldrh r0, [r0, #4]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r6, _080585E0 @ =gCurrentClipdataAffectingAction
	strb r5, [r6]
	movs r0, #0x20
	rsbs r0, r0, #0
	adds r0, r0, r7
	mov r8, r0
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	adds r0, r7, #0
	subs r0, #0x60
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	adds r0, r7, #0
	subs r0, #0xa0
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	adds r0, r7, #0
	subs r0, #0xe0
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	ldr r1, _080585E4 @ =0xFFFFFEE0
	adds r0, r7, r1
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	ldr r1, _080585E8 @ =0xFFFFFEA0
	adds r0, r7, r1
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	ldr r1, _080585EC @ =0xFFFFFE60
	adds r0, r7, r1
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	ldr r1, _080585F0 @ =0xFFFFFE20
	adds r0, r7, r1
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	ldr r1, _080585F4 @ =0xFFFFFDE0
	adds r0, r7, r1
	adds r1, r4, #0
	bl ClipdataProcess
	strb r5, [r6]
	subs r4, #0x40
	mov r0, r8
	adds r1, r4, #0
	bl ClipdataProcess
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080585D8: .4byte gCurrentSprite
_080585DC: .4byte 0xFFFFFC80
_080585E0: .4byte gCurrentClipdataAffectingAction
_080585E4: .4byte 0xFFFFFEE0
_080585E8: .4byte 0xFFFFFEA0
_080585EC: .4byte 0xFFFFFE60
_080585F0: .4byte 0xFFFFFE20
_080585F4: .4byte 0xFFFFFDE0

	thumb_func_start OmegaMetroidHuskInit
OmegaMetroidHuskInit: @ 0x080585F8
	push {r4, lr}
	ldr r0, _08058650 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08058654 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #5
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x58
	strb r0, [r1]
	ldr r1, _08058658 @ =0x0000FFFC
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
	ldr r0, _0805865C @ =0x083A7458
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058650: .4byte gCurrentSprite
_08058654: .4byte 0x0000FFFB
_08058658: .4byte 0x0000FFFC
_0805865C: .4byte 0x083A7458

	thumb_func_start OmegaMetroidHuskWaitingForSamus
OmegaMetroidHuskWaitingForSamus: @ 0x08058660
	push {lr}
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #0xbc
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _08058684
	ldr r0, _08058688 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	ldr r0, _0805868C @ =gDisableScrolling
	strb r1, [r0]
	movs r0, #2
	bl OmegaHuskSetCollision
_08058684:
	pop {r0}
	bx r0
	.align 2, 0
_08058688: .4byte gCurrentSprite
_0805868C: .4byte gDisableScrolling

	thumb_func_start OmegaMetroidHuskWaitForOmegaMetroidToSpawn
OmegaMetroidHuskWaitForOmegaMetroidToSpawn: @ 0x08058690
	push {r4, r5, r6, lr}
	ldr r2, _0805878C @ =gSamusData
	ldrh r1, [r2, #0x18]
	ldr r4, _08058790 @ =gCurrentSprite
	ldrh r5, [r4, #2]
	adds r0, r5, #0
	subs r0, #0x80
	cmp r1, r0
	ble _08058784
	ldrh r1, [r2, #0x16]
	ldrh r6, [r4, #4]
	ldr r2, _08058794 @ =0xFFFFFD80
	adds r0, r6, r2
	cmp r1, r0
	bge _08058784
	adds r1, r4, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #8
	strb r0, [r1]
	ldr r2, _08058798 @ =gSpriteData
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x31
	strb r3, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	ldr r1, _0805879C @ =0xFFFFFEC0
	adds r0, r5, r1
	adds r4, r6, #0
	adds r4, #0x40
	adds r1, r4, #0
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r5, #0
	subs r0, #0xc0
	adds r1, r6, #0
	adds r1, #0x32
	movs r2, #0x30
	bl ParticleSet
	adds r0, r5, #0
	subs r0, #0x60
	adds r1, r6, #0
	adds r1, #0x48
	movs r2, #0x30
	bl ParticleSet
	ldr r0, _080587A0 @ =0xFFFFFE3E
	adds r2, r5, r0
	movs r0, #0
	movs r1, #1
	adds r3, r4, #0
	bl SpriteDebrisInit
	ldr r1, _080587A4 @ =0xFFFFFE68
	adds r2, r5, r1
	adds r3, r6, #0
	adds r3, #0x20
	movs r0, #0
	movs r1, #4
	bl SpriteDebrisInit
	ldr r0, _080587A8 @ =0xFFFFFE88
	adds r2, r5, r0
	adds r3, r6, #0
	adds r3, #0x2a
	movs r0, #0
	movs r1, #5
	bl SpriteDebrisInit
	ldr r1, _080587AC @ =0xFFFFFEB6
	adds r2, r5, r1
	adds r3, r6, #0
	adds r3, #0x24
	movs r0, #0
	movs r1, #8
	bl SpriteDebrisInit
	ldr r0, _080587B0 @ =0xFFFFFED4
	adds r2, r5, r0
	subs r4, #0x10
	movs r0, #0
	movs r1, #0x11
	adds r3, r4, #0
	bl SpriteDebrisInit
	adds r2, r5, #0
	subs r2, #0xf0
	adds r3, r6, #0
	adds r3, #0x3a
	movs r0, #0
	movs r1, #4
	bl SpriteDebrisInit
	adds r2, r5, #0
	subs r2, #0xc8
	adds r3, r6, #0
	adds r3, #0x3c
	movs r0, #0
	movs r1, #5
	bl SpriteDebrisInit
	adds r2, r5, #0
	subs r2, #0x8c
	movs r0, #0
	movs r1, #1
	adds r3, r4, #0
	bl SpriteDebrisInit
	movs r0, #0x86
	lsls r0, r0, #2
	bl unk_3b1c
_08058784:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805878C: .4byte gSamusData
_08058790: .4byte gCurrentSprite
_08058794: .4byte 0xFFFFFD80
_08058798: .4byte gSpriteData
_0805879C: .4byte 0xFFFFFEC0
_080587A0: .4byte 0xFFFFFE3E
_080587A4: .4byte 0xFFFFFE68
_080587A8: .4byte 0xFFFFFE88
_080587AC: .4byte 0xFFFFFEB6
_080587B0: .4byte 0xFFFFFED4

	thumb_func_start OmegaMetroidHuskGettingCrushedInit
OmegaMetroidHuskGettingCrushedInit: @ 0x080587B4
	push {lr}
	ldr r1, _080587D4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x18
	strb r0, [r2]
	ldr r0, _080587D8 @ =0x083A7468
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _080587DC @ =0x00000225
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_080587D4: .4byte gCurrentSprite
_080587D8: .4byte 0x083A7468
_080587DC: .4byte 0x00000225

	thumb_func_start OmegaMetroidHuskGettingCrushed
OmegaMetroidHuskGettingCrushed: @ 0x080587E0
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _08058804
	ldr r0, _08058808 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x1a
	strb r1, [r2]
	ldr r1, _0805880C @ =0x083A7498
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x3c
	strb r1, [r0]
_08058804:
	pop {r0}
	bx r0
	.align 2, 0
_08058808: .4byte gCurrentSprite
_0805880C: .4byte 0x083A7498

	thumb_func_start OmegaMetroidHuskWaiting
OmegaMetroidHuskWaiting: @ 0x08058810
	push {lr}
	ldr r1, _08058834 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08058830
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #0x1c
	strb r1, [r0]
	movs r0, #0x1e
	strb r0, [r2]
_08058830:
	pop {r0}
	bx r0
	.align 2, 0
_08058834: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidHuskDisappearing
OmegaMetroidHuskDisappearing: @ 0x08058838
	push {lr}
	ldr r3, _08058868 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08058852
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
_08058852:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08058862
	strh r0, [r3]
_08058862:
	pop {r0}
	bx r0
	.align 2, 0
_08058868: .4byte gCurrentSprite

	thumb_func_start OmegaMetroidHusk
OmegaMetroidHusk: @ 0x0805886C
	push {lr}
	ldr r0, _0805888C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _08058930
	lsls r0, r0, #2
	ldr r1, _08058890 @ =_08058894
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805888C: .4byte gCurrentSprite
_08058890: .4byte _08058894
_08058894: @ jump table
	.4byte _08058908 @ case 0
	.4byte _0805890E @ case 1
	.4byte _08058914 @ case 2
	.4byte _08058930 @ case 3
	.4byte _08058930 @ case 4
	.4byte _08058930 @ case 5
	.4byte _08058930 @ case 6
	.4byte _08058930 @ case 7
	.4byte _08058930 @ case 8
	.4byte _08058930 @ case 9
	.4byte _08058930 @ case 10
	.4byte _08058930 @ case 11
	.4byte _08058930 @ case 12
	.4byte _08058930 @ case 13
	.4byte _08058930 @ case 14
	.4byte _08058930 @ case 15
	.4byte _08058930 @ case 16
	.4byte _08058930 @ case 17
	.4byte _08058930 @ case 18
	.4byte _08058930 @ case 19
	.4byte _08058930 @ case 20
	.4byte _08058930 @ case 21
	.4byte _08058930 @ case 22
	.4byte _0805891A @ case 23
	.4byte _08058920 @ case 24
	.4byte _08058930 @ case 25
	.4byte _08058926 @ case 26
	.4byte _08058930 @ case 27
	.4byte _0805892C @ case 28
_08058908:
	bl OmegaMetroidHuskInit
	b _08058930
_0805890E:
	bl OmegaMetroidHuskWaitingForSamus
	b _08058930
_08058914:
	bl OmegaMetroidHuskWaitForOmegaMetroidToSpawn
	b _08058930
_0805891A:
	bl OmegaMetroidHuskGettingCrushedInit
	b _08058930
_08058920:
	bl OmegaMetroidHuskGettingCrushed
	b _08058930
_08058926:
	bl OmegaMetroidHuskWaiting
	b _08058930
_0805892C:
	bl OmegaMetroidHuskDisappearing
_08058930:
	pop {r0}
	bx r0

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
	ldr r4, _08058DF0 @ =0x083031E0
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
	ldr r4, _08058DF8 @ =0x08303262
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
_08058DF0: .4byte 0x083031E0
_08058DF4: .4byte 0x00007FFF
_08058DF8: .4byte 0x08303262
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

	thumb_func_start MetroidHusk
MetroidHusk: @ 0x08059054
	push {r4, r5, lr}
	ldr r3, _080590A8 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r5, r3, #0
	adds r5, #0x24
	ldrb r4, [r5]
	cmp r4, #0
	bne _080590A0
	adds r0, r3, #0
	adds r0, #0x22
	movs r2, #4
	strb r2, [r0]
	adds r0, #3
	strb r4, [r0]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _080590AC @ =0x0000FFFC
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	strh r0, [r3, #0xe]
	strh r2, [r3, #0x10]
	movs r0, #2
	strb r0, [r5]
	ldr r0, _080590B0 @ =0x083A8F44
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r4, [r3, #0x16]
_080590A0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080590A8: .4byte gCurrentSprite
_080590AC: .4byte 0x0000FFFC
_080590B0: .4byte 0x083A8F44

	thumb_func_start RidleyMove
RidleyMove: @ 0x080590B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r6, r4, #0x18
	movs r0, #0
	mov r8, r0
	movs r7, #0
	ldr r1, _0805911C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r2, #0xc8
	cmp r0, #0x1b
	bne _080590F4
	adds r2, #0x58
_080590F4:
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059128
	ldr r1, _08059120 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059124 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059140
	movs r1, #1
	mov r8, r1
	b _08059140
	.align 2, 0
_0805911C: .4byte gCurrentSprite
_08059120: .4byte gSubSpriteData1
_08059124: .4byte gPreviousCollisionCheck
_08059128:
	ldr r1, _08059170 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	subs r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059174 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059140
	movs r2, #1
	mov r8, r2
_08059140:
	ldr r0, _08059178 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805917C
	ldr r4, _08059170 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0xe0
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08059174 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059192
	ldrh r0, [r4, #8]
	adds r0, #0xa0
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	b _0805918E
	.align 2, 0
_08059170: .4byte gSubSpriteData1
_08059174: .4byte gPreviousCollisionCheck
_08059178: .4byte gCurrentSprite
_0805917C:
	ldr r1, _080591E4 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	ldr r5, _080591E8 @ =0xFFFFFE80
	adds r0, r0, r5
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080591EC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
_0805918E:
	cmp r0, #0
	beq _08059198
_08059192:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_08059198:
	movs r4, #0
	ldr r2, _080591F0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r3, r2, #0
	cmp r0, #0
	beq _08059214
	mov r0, r8
	cmp r0, #0
	bne _0805927E
	movs r1, #0x2f
	adds r1, r1, r3
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080591F4
	ldr r2, _080591E4 @ =gSubSpriteData1
	ldrh r1, [r2, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	add r0, sb
	cmp r1, r0
	bgt _08059232
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _080591D8
	adds r0, #1
	strb r0, [r1]
_080591D8:
	ldrb r0, [r1]
	asrs r0, r6
	ldrh r5, [r2, #0xa]
	adds r0, r0, r5
	strh r0, [r2, #0xa]
	b _0805927A
	.align 2, 0
_080591E4: .4byte gSubSpriteData1
_080591E8: .4byte 0xFFFFFE80
_080591EC: .4byte gPreviousCollisionCheck
_080591F0: .4byte gCurrentSprite
_080591F4:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805927E
	ldr r1, _08059210 @ =gSubSpriteData1
	mov r2, ip
	ldrb r0, [r2]
	asrs r0, r6
	ldrh r5, [r1, #0xa]
	adds r0, r0, r5
	strh r0, [r1, #0xa]
	b _0805927A
	.align 2, 0
_08059210: .4byte gSubSpriteData1
_08059214:
	mov r0, r8
	cmp r0, #0
	bne _08059278
	movs r1, #0x2f
	adds r1, r1, r3
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805925A
	ldr r2, _08059240 @ =gSubSpriteData1
	ldrh r1, [r2, #0xa]
	ldr r0, _08059244 @ =0xFFFFFF00
	add r0, sb
	cmp r1, r0
	bge _08059248
_08059232:
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r2, ip
	strb r0, [r2]
	b _0805927A
	.align 2, 0
_08059240: .4byte gSubSpriteData1
_08059244: .4byte 0xFFFFFF00
_08059248:
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _08059256
	adds r0, #1
	strb r0, [r1]
_08059256:
	ldrb r1, [r1]
	b _0805926A
_0805925A:
	subs r0, #1
	mov r5, ip
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805927E
	ldr r2, _08059274 @ =gSubSpriteData1
	ldrb r1, [r5]
_0805926A:
	asrs r1, r6
	ldrh r0, [r2, #0xa]
	subs r0, r0, r1
	strh r0, [r2, #0xa]
	b _0805927A
	.align 2, 0
_08059274: .4byte gSubSpriteData1
_08059278:
	movs r4, #1
_0805927A:
	cmp r4, #0
	beq _080592A2
_0805927E:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _080592A2
	subs r1, #0xc
	movs r0, #3
	strb r0, [r1]
_080592A2:
	movs r4, #0
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08059318
	cmp r7, #0
	bne _0805937A
	movs r5, #0x2e
	adds r5, r5, r3
	mov ip, r5
	ldrb r0, [r5]
	cmp r0, #0
	bne _080592F8
	ldr r2, _080592D8 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _080592DC
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r5]
	b _08059376
	.align 2, 0
_080592D8: .4byte gSubSpriteData1
_080592DC:
	adds r1, r3, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r5, [sp, #4]
	cmp r0, r5
	bhs _080592EC
	adds r0, #1
	strb r0, [r1]
_080592EC:
	ldrb r0, [r1]
	asrs r0, r6
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #8]
	b _08059376
_080592F8:
	subs r0, #1
	mov r2, ip
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805937A
	ldr r1, _08059314 @ =gSubSpriteData1
	ldrb r0, [r2]
	asrs r0, r6
	ldrh r5, [r1, #8]
	adds r0, r0, r5
	strh r0, [r1, #8]
	b _08059376
	.align 2, 0
_08059314: .4byte gSubSpriteData1
_08059318:
	cmp r7, #0
	bne _08059374
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059356
	ldr r2, _08059340 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, [sp]
	adds r0, #4
	cmp r1, r0
	bge _08059344
	adds r0, r3, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	b _08059376
	.align 2, 0
_08059340: .4byte gSubSpriteData1
_08059344:
	adds r1, r3, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r5, [sp, #4]
	cmp r0, r5
	bhs _08059364
	adds r0, #1
	strb r0, [r1]
	b _08059364
_08059356:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805937A
	ldr r2, _08059370 @ =gSubSpriteData1
_08059364:
	ldrb r1, [r1]
	asrs r1, r6
	ldrh r0, [r2, #8]
	subs r0, r0, r1
	strh r0, [r2, #8]
	b _08059376
	.align 2, 0
_08059370: .4byte gSubSpriteData1
_08059374:
	movs r4, #1
_08059376:
	cmp r4, #0
	beq _0805938E
_0805937A:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_0805938E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UpdateSubSpriteData2Animation
UpdateSubSpriteData2Animation: @ 0x080593A0
	push {lr}
	ldr r2, _080593D8 @ =gSubSpriteData2
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
	bhs _080593D4
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
	bne _080593D4
	strh r0, [r2, #4]
_080593D4:
	pop {r0}
	bx r0
	.align 2, 0
_080593D8: .4byte gSubSpriteData2

	thumb_func_start RidleySyncSubSpritesPosition
RidleySyncSubSpritesPosition: @ 0x080593DC
	push {r4, lr}
	ldr r4, _0805941C @ =gSubSpriteData2
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08059420 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059424
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _08059436
	.align 2, 0
_0805941C: .4byte gSubSpriteData2
_08059420: .4byte gCurrentSprite
_08059424:
	ldrb r0, [r2, #0x1e]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r0, [r1, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_08059436:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleySyncSubSprites
RidleySyncSubSprites: @ 0x0805943C
	push {r4, lr}
	ldr r4, _080594A0 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _080594A4 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _080594A8 @ =0x0879B708
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805946E
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805946E:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	ldrb r1, [r2, #0x1e]
	cmp r0, #0
	beq _080594AC
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _080594BC
	.align 2, 0
_080594A0: .4byte gSubSpriteData1
_080594A4: .4byte gCurrentSprite
_080594A8: .4byte 0x0879B708
_080594AC:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_080594BC:
	ldrb r0, [r2, #0x1e]
	cmp r0, #1
	bne _080594CC
	ldr r0, _080594D4 @ =gSubSpriteData2
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
_080594CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080594D4: .4byte gSubSpriteData2

	thumb_func_start RidleyTailSyncSubSprites
RidleyTailSyncSubSprites: @ 0x080594D8
	push {r4, lr}
	ldr r4, _0805953C @ =gSubSpriteData2
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _08059540 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _08059544 @ =0x0879B708
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805950A
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805950A:
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #2]
	ldrh r1, [r4, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	ldrb r1, [r2, #0x1e]
	cmp r0, #0
	beq _08059548
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r4, #0xa]
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	strh r1, [r2, #4]
	b _08059558
	.align 2, 0
_0805953C: .4byte gSubSpriteData2
_08059540: .4byte gCurrentSprite
_08059544: .4byte 0x0879B708
_08059548:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0, #4]
	ldrh r4, [r4, #0xa]
	adds r0, r0, r4
	strh r0, [r2, #4]
_08059558:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyUpdatePalette
RidleyUpdatePalette: @ 0x08059560
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _08059584 @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r2, _08059588 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r4, _0805958C @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _08059590
	cmp r1, #1
	beq _080595A8
	b _080595BE
	.align 2, 0
_08059584: .4byte gCurrentSprite
_08059588: .4byte sPrimarySpriteStats
_0805958C: .4byte gBossWork1
_08059590:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _080595BE
	ldr r7, _080595A4 @ =0x083AE06C
	movs r0, #1
	strb r0, [r4]
	b _080595C2
	.align 2, 0
_080595A4: .4byte 0x083AE06C
_080595A8:
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r5, r0
	bhi _080595BE
	ldr r7, _080595D8 @ =0x083AE0AC
	movs r0, #2
	strb r0, [r4]
	movs r6, #1
_080595BE:
	cmp r6, #0
	beq _080595D0
_080595C2:
	ldr r1, _080595DC @ =0x040000D4
	str r7, [r1]
	ldr r0, _080595E0 @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _080595E4 @ =0x80000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_080595D0:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080595D8: .4byte 0x083AE0AC
_080595DC: .4byte 0x040000D4
_080595E0: .4byte 0x05000300
_080595E4: .4byte 0x80000020

	thumb_func_start RidleySetBackgroundPriority
RidleySetBackgroundPriority: @ 0x080595E8
	push {lr}
	ldr r2, _0805960C @ =gCurrentSprite
	ldrh r0, [r2, #2]
	lsrs r0, r0, #2
	ldr r1, _08059610 @ =gBg1YPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _08059614 @ =0xFF410000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x1c
	bhi _08059618
	adds r1, r2, #0
	adds r1, #0x21
	movs r0, #2
	b _08059624
	.align 2, 0
_0805960C: .4byte gCurrentSprite
_08059610: .4byte gBg1YPosition
_08059614: .4byte 0xFF410000
_08059618:
	ldr r0, _0805962C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
_08059624:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805962C: .4byte gIoRegisters

	thumb_func_start RidleyUpdateClawOam
RidleyUpdateClawOam: @ 0x08059630
	push {lr}
	ldr r0, _08059654 @ =gCurrentSprite
	adds r3, r0, #0
	adds r3, #0x25
	ldrb r0, [r3]
	cmp r0, #0x1b
	bne _08059660
	ldr r1, _08059658 @ =gSubSpriteData1
	ldr r0, [r1]
	ldr r2, _0805965C @ =0x083A9F74
	cmp r0, r2
	beq _08059676
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	b _08059676
	.align 2, 0
_08059654: .4byte gCurrentSprite
_08059658: .4byte gSubSpriteData1
_0805965C: .4byte 0x083A9F74
_08059660:
	ldr r1, _0805967C @ =gSubSpriteData1
	ldr r0, [r1]
	ldr r2, _08059680 @ =0x083A9944
	cmp r0, r2
	beq _08059676
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	movs r0, #0x1a
	strb r0, [r3]
_08059676:
	pop {r0}
	bx r0
	.align 2, 0
_0805967C: .4byte gSubSpriteData1
_08059680: .4byte 0x083A9944

	thumb_func_start RidleyTailStrikingCheckPlayEffects
RidleyTailStrikingCheckPlayEffects: @ 0x08059684
	push {lr}
	ldr r2, _080596B4 @ =gCurrentSprite
	ldrh r0, [r2, #6]
	adds r0, #0x14
	ldr r1, _080596B8 @ =0x0000053E
	cmp r0, r1
	bgt _080596AA
	ldrh r0, [r2, #2]
	adds r0, #0x14
	cmp r0, r1
	ble _080596AA
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	movs r0, #0xf4
	lsls r0, r0, #1
	bl SoundPlay
_080596AA:
	ldr r1, _080596B4 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	pop {r0}
	bx r0
	.align 2, 0
_080596B4: .4byte gCurrentSprite
_080596B8: .4byte 0x0000053E

	thumb_func_start RidleyTailStrikeYMovement
RidleyTailStrikeYMovement: @ 0x080596BC
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r0, _080596EC @ =gSamusData
	ldr r4, _080596F0 @ =gSubSpriteData1
	ldrh r2, [r4, #8]
	ldrh r0, [r0, #0x18]
	adds r1, r2, #0
	cmp r0, r1
	blo _080596E6
	ldr r0, _080596F4 @ =0x0000043F
	cmp r1, r0
	bhi _080596E6
	ldr r0, _080596F8 @ =gCurrentSprite
	ldrh r0, [r0, #2]
	adds r0, #0x14
	ldr r1, _080596FC @ =0x0000053E
	cmp r0, r1
	bgt _080596E6
	adds r0, r3, r2
	strh r0, [r4, #8]
_080596E6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080596EC: .4byte gSamusData
_080596F0: .4byte gSubSpriteData1
_080596F4: .4byte 0x0000043F
_080596F8: .4byte gCurrentSprite
_080596FC: .4byte 0x0000053E

	thumb_func_start RidleyFloatingMovement
RidleyFloatingMovement: @ 0x08059700
	push {r4, lr}
	sub sp, #4
	ldr r0, _08059718 @ =gCurrentSprite
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _08059724
	ldr r0, _0805971C @ =gXParasiteTargetYPosition
	ldrh r2, [r0]
	ldr r0, _08059720 @ =gXParasiteTargetXPosition
	ldrh r1, [r0]
	b _0805975C
	.align 2, 0
_08059718: .4byte gCurrentSprite
_0805971C: .4byte gXParasiteTargetYPosition
_08059720: .4byte gXParasiteTargetXPosition
_08059724:
	ldr r0, _08059748 @ =gFrameCounter8Bit
	ldrb r2, [r0]
	ldr r0, _0805974C @ =gSamusData
	ldrh r4, [r0, #0x18]
	ldr r1, _08059750 @ =0x000002BF
	adds r3, r0, #0
	cmp r4, r1
	bls _08059758
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	bne _08059758
	ldr r1, _08059754 @ =0xFFFFFE00
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _0805975A
	.align 2, 0
_08059748: .4byte gFrameCounter8Bit
_0805974C: .4byte gSamusData
_08059750: .4byte 0x000002BF
_08059754: .4byte 0xFFFFFE00
_08059758:
	ldrh r2, [r3, #0x18]
_0805975A:
	ldrh r1, [r3, #0x16]
_0805975C:
	movs r0, #2
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0x18
	movs r3, #0x18
	bl RidleyMove
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyUpdateHealthThreshold
RidleyUpdateHealthThreshold: @ 0x08059774
	push {r4, lr}
	ldr r4, _080597B4 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08059820
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _08059798
	ldr r0, _080597B8 @ =0x000001E1
	bl SoundPlayNotAlreadyPlaying
_08059798:
	ldrh r2, [r4, #0x14]
	cmp r2, #0
	bne _080597C4
	ldr r0, _080597BC @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _080597C4
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x1f
	strb r1, [r0]
	ldr r0, _080597C0 @ =gBossWork5
	strh r2, [r0]
	b _08059818
	.align 2, 0
_080597B4: .4byte gCurrentSprite
_080597B8: .4byte 0x000001E1
_080597BC: .4byte gSubSpriteData1
_080597C0: .4byte gBossWork5
_080597C4:
	ldr r2, _080597F8 @ =gBossWork5
	ldr r0, _080597FC @ =gSubSpriteData1
	ldr r3, _08059800 @ =gCurrentSprite
	ldrh r0, [r0, #0xc]
	ldrh r1, [r3, #0x14]
	subs r0, r0, r1
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	lsls r0, r0, #0x10
	movs r1, #0xfa
	lsls r1, r1, #0x11
	cmp r0, r1
	bls _08059804
	adds r1, r3, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x18
	beq _080597F2
	cmp r0, #0x1a
	beq _080597F2
	movs r0, #0x1f
	strb r0, [r1]
_080597F2:
	movs r0, #0
	strh r0, [r2]
	b _08059818
	.align 2, 0
_080597F8: .4byte gBossWork5
_080597FC: .4byte gSubSpriteData1
_08059800: .4byte gCurrentSprite
_08059804:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08059818
	ldr r0, _08059828 @ =0x000001DF
	bl SoundPlayNotAlreadyPlaying
_08059818:
	ldr r0, _0805982C @ =gSubSpriteData1
	ldr r1, _08059830 @ =gCurrentSprite
	ldrh r1, [r1, #0x14]
	strh r1, [r0, #0xc]
_08059820:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059828: .4byte 0x000001DF
_0805982C: .4byte gSubSpriteData1
_08059830: .4byte gCurrentSprite

	thumb_func_start RidleyWaveBeamCollsiion
RidleyWaveBeamCollsiion: @ 0x08059834
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r3, _08059908 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080598F8
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _080598F8
	ldrh r1, [r3, #2]
	ldrh r2, [r3, #4]
	ldrh r0, [r3, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r3, #0xc]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r0, [r3, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r3, #0x10]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r7, #0
_08059882:
	ldr r1, _0805990C @ =gProjectileData
	lsls r0, r7, #5
	adds r4, r0, r1
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080598EE
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080598EE
	ldrb r0, [r4, #0xf]
	cmp r0, #4
	bne _080598EE
	ldrh r5, [r4, #8]
	ldrh r6, [r4, #0xa]
	ldrh r0, [r4, #0x16]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x18]
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r2, [r4, #0x1a]
	adds r2, r6, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r3, [r4, #0x1c]
	adds r3, r6, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov ip, r3
	ldr r3, [sp, #0x10]
	str r3, [sp]
	mov r3, sl
	str r3, [sp, #4]
	mov r3, sb
	str r3, [sp, #8]
	mov r3, r8
	str r3, [sp, #0xc]
	mov r3, ip
	bl CheckObjectsTouching
	cmp r0, #0
	beq _080598EE
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
_080598EE:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0xf
	bls _08059882
_080598F8:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059908: .4byte gCurrentSprite
_0805990C: .4byte gProjectileData

	thumb_func_start RidleyCheckGrabSamusLeft
RidleyCheckGrabSamusLeft: @ 0x08059910
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #0x10
	adds r0, r0, r2
	lsrs r7, r0, #0x10
	ldr r0, _08059938 @ =gSubSpriteData1
	ldr r2, [r0]
	ldr r0, _0805993C @ =0x083A9A2C
	cmp r2, r0
	beq _08059930
	ldr r0, _08059940 @ =0x083A9A44
	cmp r2, r0
	bne _08059944
_08059930:
	adds r0, r1, #0
	subs r0, #0x82
	b _08059948
	.align 2, 0
_08059938: .4byte gSubSpriteData1
_0805993C: .4byte 0x083A9A2C
_08059940: .4byte 0x083A9A44
_08059944:
	adds r0, r1, #0
	subs r0, #0xe6
_08059948:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r6, _08059978 @ =gSamusData
	movs r0, #0x24
	ldrsh r1, [r6, r0]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0805997C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059980
	movs r2, #0x28
	ldrsh r1, [r6, r2]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08059980
	movs r0, #1
	b _08059982
	.align 2, 0
_08059978: .4byte gSamusData
_0805997C: .4byte gPreviousCollisionCheck
_08059980:
	movs r0, #0
_08059982:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start RidleyCheckGrabSamusRight
RidleyCheckGrabSamusRight: @ 0x08059988
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #0xb4
	lsls r2, r2, #0x10
	adds r0, r0, r2
	lsrs r7, r0, #0x10
	ldr r0, _080599B0 @ =gSubSpriteData1
	ldr r2, [r0]
	ldr r0, _080599B4 @ =0x083A9A2C
	cmp r2, r0
	beq _080599A8
	ldr r0, _080599B8 @ =0x083A9A44
	cmp r2, r0
	bne _080599BC
_080599A8:
	adds r0, r1, #0
	adds r0, #0x82
	b _080599C0
	.align 2, 0
_080599B0: .4byte gSubSpriteData1
_080599B4: .4byte 0x083A9A2C
_080599B8: .4byte 0x083A9A44
_080599BC:
	adds r0, r1, #0
	adds r0, #0xe6
_080599C0:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r6, _080599F0 @ =gSamusData
	movs r0, #0x24
	ldrsh r1, [r6, r0]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080599F4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080599F8
	movs r2, #0x28
	ldrsh r1, [r6, r2]
	adds r1, r4, r1
	adds r0, r7, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080599F8
	movs r0, #1
	b _080599FA
	.align 2, 0
_080599F0: .4byte gSamusData
_080599F4: .4byte gPreviousCollisionCheck
_080599F8:
	movs r0, #0
_080599FA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start RidleySamusGrabbed
RidleySamusGrabbed: @ 0x08059A00
	push {r4, lr}
	ldr r2, _08059A40 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08059A78
	ldr r3, _08059A44 @ =0x0000F7FF
	ands r3, r1
	strh r3, [r2]
	ldr r4, _08059A48 @ =gSamusData
	ldrh r0, [r2, #2]
	adds r0, #0xb4
	strh r0, [r4, #0x18]
	ldr r0, _08059A4C @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _08059A50 @ =0x083A9A2C
	cmp r1, r0
	beq _08059A2E
	ldr r0, _08059A54 @ =0x083A9A44
	cmp r1, r0
	bne _08059A60
_08059A2E:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08059A58
	ldrh r0, [r2, #4]
	adds r0, #0x82
	strh r0, [r4, #0x16]
	b _08059A86
	.align 2, 0
_08059A40: .4byte gCurrentSprite
_08059A44: .4byte 0x0000F7FF
_08059A48: .4byte gSamusData
_08059A4C: .4byte gSubSpriteData1
_08059A50: .4byte 0x083A9A2C
_08059A54: .4byte 0x083A9A44
_08059A58:
	ldrh r0, [r2, #4]
	subs r0, #0x82
	strh r0, [r4, #0x16]
	b _08059A86
_08059A60:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08059A70
	ldrh r0, [r2, #4]
	adds r0, #0xe6
	strh r0, [r4, #0x16]
	b _08059A86
_08059A70:
	ldrh r0, [r2, #4]
	subs r0, #0xe6
	strh r0, [r4, #0x16]
	b _08059A86
_08059A78:
	adds r1, r2, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _08059A86
	movs r0, #0x1a
	strb r0, [r1]
_08059A86:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleySetSideHitboxes
RidleySetSideHitboxes: @ 0x08059A8C
	push {lr}
	ldr r2, _08059AA4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059AAC
	ldr r0, _08059AA8 @ =0x0000FF80
	strh r0, [r2, #0xe]
	movs r0, #0xe0
	b _08059AB2
	.align 2, 0
_08059AA4: .4byte gCurrentSprite
_08059AA8: .4byte 0x0000FF80
_08059AAC:
	ldr r0, _08059AB8 @ =0x0000FF20
	strh r0, [r2, #0xe]
	movs r0, #0x80
_08059AB2:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_08059AB8: .4byte 0x0000FF20

	thumb_func_start RidleyXMovement_Unused
RidleyXMovement_Unused: @ 0x08059ABC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r7, r5, #0
	movs r6, #0
	ldr r1, _08059AFC @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x25
	ldrb r0, [r0]
	movs r2, #0xa0
	cmp r0, #0x1b
	bne _08059AD6
	adds r2, #0x80
_08059AD6:
	ldrh r1, [r1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059B08
	ldr r4, _08059B00 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B04 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059B1E
	ldrh r0, [r4, #0xa]
	adds r0, r5, r0
	b _08059B30
	.align 2, 0
_08059AFC: .4byte gCurrentSprite
_08059B00: .4byte gSubSpriteData1
_08059B04: .4byte gPreviousCollisionCheck
_08059B08:
	ldr r4, _08059B24 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	subs r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B28 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059B2C
_08059B1E:
	movs r6, #1
	b _08059B32
	.align 2, 0
_08059B24: .4byte gSubSpriteData1
_08059B28: .4byte gPreviousCollisionCheck
_08059B2C:
	ldrh r0, [r4, #0xa]
	subs r0, r0, r7
_08059B30:
	strh r0, [r4, #0xa]
_08059B32:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start RidleyTailXMovement
RidleyTailXMovement: @ 0x08059B3C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r8, r6
	ldr r0, _08059B84 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r5, [r0]
	movs r7, #0
	ldr r1, _08059B88 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059B94
	ldr r4, _08059B8C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	adds r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059B90 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08059BAA
	ldrh r0, [r4, #0xa]
	adds r0, r6, r0
	b _08059BBE
	.align 2, 0
_08059B84: .4byte gCurrentSprite
_08059B88: .4byte gSpriteData
_08059B8C: .4byte gSubSpriteData1
_08059B90: .4byte gPreviousCollisionCheck
_08059B94:
	ldr r4, _08059BB0 @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x40
	ldrh r1, [r4, #0xa]
	subs r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08059BB4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08059BB8
_08059BAA:
	movs r7, #1
	b _08059BC4
	.align 2, 0
_08059BB0: .4byte gSubSpriteData1
_08059BB4: .4byte gPreviousCollisionCheck
_08059BB8:
	ldrh r0, [r4, #0xa]
	mov r1, r8
	subs r0, r0, r1
_08059BBE:
	strh r0, [r4, #0xa]
	cmp r7, #0
	beq _08059BDA
_08059BC4:
	ldr r1, _08059BE8 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_08059BDA:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08059BE8: .4byte gSpriteData

	thumb_func_start RidleyScreamingInit
RidleyScreamingInit: @ 0x08059BEC
	push {r4, r5, lr}
	ldr r1, _08059C3C @ =gSubSpriteData1
	ldr r0, _08059C40 @ =0x083A9A14
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r4, _08059C44 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	bne _08059C20
	ldr r1, _08059C48 @ =sSamusSetPoseFunctionPointer
	ldr r0, _08059C4C @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xfa
	bl _call_via_r1
_08059C20:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059C50
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0x3c
	strb r0, [r1]
	movs r0, #0xef
	lsls r0, r0, #1
	bl SoundPlay
	b _08059C64
	.align 2, 0
_08059C3C: .4byte gSubSpriteData1
_08059C40: .4byte 0x083A9A14
_08059C44: .4byte gCurrentSprite
_08059C48: .4byte sSamusSetPoseFunctionPointer
_08059C4C: .4byte gSamusData
_08059C50:
	movs r0, #0
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x2b
	movs r0, #0xb4
	strb r0, [r1]
	movs r0, #0xf0
	lsls r0, r0, #1
	bl unk_3b1c
_08059C64:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyScreaming
RidleyScreaming: @ 0x08059C6C
	push {r4, r5, lr}
	ldr r4, _08059C94 @ =gCurrentSprite
	adds r2, r4, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _08059CCC
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059C98
	bl RidleyUpdateClawOam
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	b _08059E32
	.align 2, 0
_08059C94: .4byte gCurrentSprite
_08059C98:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	movs r1, #0x20
	orrs r0, r1
	orrs r0, r2
	adds r1, r4, #0
	adds r1, #0x2c
	strb r2, [r1]
	subs r1, #0xc
	strb r2, [r1]
	movs r1, #0x2c
	strh r1, [r4, #6]
	ldr r1, _08059CC8 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	b _08059E32
	.align 2, 0
_08059CC8: .4byte 0x0000FFFB
_08059CCC:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08059CE2
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bls _08059CDC
	b _08059E32
_08059CDC:
	bl RidleyFloatingMovement
	b _08059E32
_08059CE2:
	ldr r0, _08059D04 @ =gSubSpriteData1
	ldrh r4, [r0, #8]
	ldrh r5, [r0, #0xa]
	ldrb r0, [r2]
	cmp r0, #0x40
	beq _08059DB0
	cmp r0, #0x40
	bgt _08059D12
	cmp r0, #0x10
	bne _08059CF8
	b _08059DFC
_08059CF8:
	cmp r0, #0x10
	bgt _08059D08
	cmp r0, #0
	bne _08059D02
	b _08059E18
_08059D02:
	b _08059E32
	.align 2, 0
_08059D04: .4byte gSubSpriteData1
_08059D08:
	cmp r0, #0x20
	beq _08059DE4
	cmp r0, #0x30
	beq _08059DC8
	b _08059E32
_08059D12:
	cmp r0, #0x70
	beq _08059D5E
	cmp r0, #0x70
	bgt _08059D24
	cmp r0, #0x50
	beq _08059D94
	cmp r0, #0x60
	beq _08059D7C
	b _08059E32
_08059D24:
	cmp r0, #0x80
	beq _08059D46
	cmp r0, #0x90
	beq _08059D2E
	b _08059E32
_08059D2E:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	subs r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	subs r1, #0x1a
	b _08059D74
_08059D46:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x1c
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	adds r1, #0x34
	b _08059DDC
_08059D5E:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x4c
_08059D74:
	movs r2, #0x25
	bl ParticleSet
	b _08059E32
_08059D7C:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x58
	movs r2, #0x25
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	adds r1, #0x20
	b _08059E10
_08059D94:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	adds r1, #0x2a
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	subs r1, #0x1e
	adds r0, r4, #0
	movs r2, #0x21
	bl ParticleSet
	b _08059E32
_08059DB0:
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
	adds r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x34
	b _08059DDC
_08059DC8:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	subs r1, #0x1c
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x46
	adds r1, r5, #0
_08059DDC:
	movs r2, #0x22
	bl ParticleSet
	b _08059E32
_08059DE4:
	adds r0, r4, #0
	subs r0, #0x20
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0x21
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x40
	adds r1, r5, #0
	subs r1, #0x58
	b _08059E10
_08059DFC:
	adds r0, r4, #0
	adds r0, #0x30
	adds r1, r5, #0
	adds r1, #0x4c
	movs r2, #0x2f
	bl ParticleSet
	adds r0, r4, #0
	subs r0, #0x40
	adds r1, r5, #0
_08059E10:
	movs r2, #0x2f
	bl ParticleSet
	b _08059E32
_08059E18:
	adds r0, r4, #0
	subs r0, #0x48
	adds r1, r5, #0
	subs r1, #0x2a
	movs r2, #0x2f
	bl ParticleSet
	adds r1, r5, #0
	adds r1, #0x1e
	adds r0, r4, #0
	movs r2, #0x21
	bl ParticleSet
_08059E32:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start RidleyTurningIntoCoreX
RidleyTurningIntoCoreX: @ 0x08059E38
	push {lr}
	ldr r2, _08059E74 @ =gWrittenToMosaic_H
	ldr r1, _08059E78 @ =sXParasiteMosaicValues
	ldr r3, _08059E7C @ =gCurrentSprite
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08059E62
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x49
	strb r0, [r3, #0x1d]
_08059E62:
	ldrh r0, [r3, #6]
	cmp r0, #0x13
	bhi _08059E80
	adds r2, r0, #0
	movs r0, #0x49
	movs r1, #0
	bl SpriteLoadGfx
	b _08059E8E
	.align 2, 0
_08059E74: .4byte gWrittenToMosaic_H
_08059E78: .4byte sXParasiteMosaicValues
_08059E7C: .4byte gCurrentSprite
_08059E80:
	cmp r0, #0x14
	bne _08059E8E
	movs r0, #0x49
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_08059E8E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyForming
RidleyForming: @ 0x08059E94
	push {r4, r5, lr}
	ldr r3, _08059ED0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08059ED4 @ =gSubSpriteData1
	ldrb r0, [r4, #6]
	subs r0, #1
	strb r0, [r4, #6]
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _08059EE0
	ldr r2, _08059ED8 @ =gWrittenToMosaic_H
	ldr r1, _08059EDC @ =sXParasiteMosaicValues
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08059EFA
	.align 2, 0
_08059ED0: .4byte gCurrentSprite
_08059ED4: .4byte gSubSpriteData1
_08059ED8: .4byte gWrittenToMosaic_H
_08059EDC: .4byte sXParasiteMosaicValues
_08059EE0:
	ldrh r1, [r3]
	ldr r0, _08059F00 @ =0x00007FDF
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08059F04 @ =0x083A9A5C
	str r0, [r4]
	strb r2, [r4, #6]
	strh r5, [r4, #4]
_08059EFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059F00: .4byte 0x00007FDF
_08059F04: .4byte 0x083A9A5C

	thumb_func_start RidleyScreamingAfterSpawn
RidleyScreamingAfterSpawn: @ 0x08059F08
	push {lr}
	ldr r1, _08059F70 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #4
	bne _08059F1E
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _08059F1E
	ldr r0, _08059F74 @ =0x000001DD
	bl SoundPlay
_08059F1E:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _08059F6A
	ldr r2, _08059F78 @ =gSubSpriteData1
	ldr r0, _08059F7C @ =0x083A996C
	str r0, [r2]
	movs r0, #0
	strb r0, [r2, #6]
	movs r3, #0
	strh r0, [r2, #4]
	ldr r0, _08059F70 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	ldrh r0, [r2, #8]
	subs r0, #0xe0
	strh r0, [r2, #8]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0xe0
	strh r0, [r1, #2]
	adds r1, #0x27
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _08059F80 @ =0x0000FFA0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r0, #0xa0
	strh r0, [r1, #0xc]
_08059F6A:
	pop {r0}
	bx r0
	.align 2, 0
_08059F70: .4byte gCurrentSprite
_08059F74: .4byte 0x000001DD
_08059F78: .4byte gSubSpriteData1
_08059F7C: .4byte 0x083A996C
_08059F80: .4byte 0x0000FFA0

	thumb_func_start RidleyRisingAfterSpawn
RidleyRisingAfterSpawn: @ 0x08059F84
	push {r4, r5, r6, r7, lr}
	ldr r5, _08059FB8 @ =gSubSpriteData1
	ldrh r3, [r5, #8]
	ldr r0, _08059FBC @ =0x0000027F
	cmp r3, r0
	bls _08059FD8
	ldr r0, _08059FC0 @ =gCurrentSprite
	adds r0, #0x31
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _08059FC4 @ =0x083A9F9C
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _08059FC8 @ =0x00007FFF
	cmp r1, r0
	bne _08059FCC
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r5, #8]
	b _0805A014
	.align 2, 0
_08059FB8: .4byte gSubSpriteData1
_08059FBC: .4byte 0x0000027F
_08059FC0: .4byte gCurrentSprite
_08059FC4: .4byte 0x083A9F9C
_08059FC8: .4byte 0x00007FFF
_08059FCC:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	adds r0, r3, r4
	strh r0, [r5, #8]
	b _0805A014
_08059FD8:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805A014
	bl RidleyUpdateClawOam
	ldr r3, _0805A01C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
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
	ldr r0, _0805A020 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, r3, #0
	adds r1, #0x2b
	strb r0, [r1]
_0805A014:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A01C: .4byte gCurrentSprite
_0805A020: .4byte gSpriteRandomNumber

	thumb_func_start RidleyInit
RidleyInit: @ 0x0805A024
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0805A1B0 @ =gBossWork1
	movs r0, #0
	strb r0, [r1]
	ldr r7, _0805A1B4 @ =gCurrentSprite
	ldrh r1, [r7]
	ldr r2, _0805A1B8 @ =0x00008240
	adds r0, r2, #0
	movs r6, #0
	movs r5, #0
	orrs r0, r1
	strh r0, [r7]
	adds r1, r7, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x25
	movs r4, #2
	strb r4, [r0]
	adds r1, #5
	movs r0, #0x58
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x29
	movs r0, #0x50
	strb r0, [r2]
	ldr r0, _0805A1BC @ =0x0000FEC0
	strh r0, [r7, #0xa]
	strh r1, [r7, #0xc]
	bl RidleySetSideHitboxes
	strb r4, [r7, #0x1e]
	ldr r2, _0805A1C0 @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
	ldr r4, _0805A1C4 @ =gSubSpriteData1
	strh r0, [r4, #0xc]
	ldr r0, _0805A1C8 @ =gBossWork5
	strh r5, [r0]
	adds r1, r7, #0
	adds r1, #0x24
	movs r0, #0x5a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	strb r0, [r1]
	ldrh r1, [r7]
	ldr r0, _0805A1CC @ =0x0000FFFB
	ands r0, r1
	strh r0, [r7]
	ldrh r0, [r7, #2]
	strh r0, [r4, #8]
	ldrh r0, [r7, #4]
	strh r0, [r4, #0xa]
	ldr r0, _0805A1D0 @ =0x083A9A5C
	str r0, [r4]
	strb r6, [r4, #6]
	strh r5, [r4, #4]
	strb r6, [r4, #0xe]
	ldrb r2, [r7, #0x1f]
	adds r6, r7, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #7
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #6
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #5
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #4
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #3
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #2
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7c
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r7, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7b
	movs r1, #3
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A1B0: .4byte gBossWork1
_0805A1B4: .4byte gCurrentSprite
_0805A1B8: .4byte 0x00008240
_0805A1BC: .4byte 0x0000FEC0
_0805A1C0: .4byte sPrimarySpriteStats
_0805A1C4: .4byte gSubSpriteData1
_0805A1C8: .4byte gBossWork5
_0805A1CC: .4byte 0x0000FFFB
_0805A1D0: .4byte 0x083A9A5C

	thumb_func_start RidleyIdleInit
RidleyIdleInit: @ 0x0805A1D4
	push {lr}
	bl RidleyUpdateClawOam
	ldr r3, _0805A21C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0805A220 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, #7
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
	adds r1, r3, #0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	beq _0805A216
	movs r0, #0x1a
	strb r0, [r1]
_0805A216:
	pop {r0}
	bx r0
	.align 2, 0
_0805A21C: .4byte gCurrentSprite
_0805A220: .4byte gSpriteRandomNumber

	thumb_func_start RidleyIdle
RidleyIdle: @ 0x0805A224
	push {r4, r5, lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	ldr r4, _0805A258 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805A25C
	adds r5, r4, #0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	beq _0805A26E
	movs r0, #0x7d
	bl CountSecondarySprite
	cmp r0, #0
	bne _0805A260
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	b _0805A368
	.align 2, 0
_0805A258: .4byte gCurrentSprite
_0805A25C:
	subs r0, #1
	strb r0, [r1]
_0805A260:
	ldr r0, _0805A278 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x25
	ldrb r1, [r1]
	adds r5, r0, #0
	cmp r1, #0x1b
	bne _0805A280
_0805A26E:
	ldr r0, _0805A27C @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	ldr r5, _0805A278 @ =gCurrentSprite
	b _0805A284
	.align 2, 0
_0805A278: .4byte gCurrentSprite
_0805A27C: .4byte gXParasiteTargetXPosition
_0805A280:
	ldr r0, _0805A2E0 @ =gSamusData
	ldrh r2, [r0, #0x16]
_0805A284:
	adds r4, r5, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A304
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A2F0
	adds r5, #0x25
	ldrb r0, [r5]
	cmp r0, #0x1b
	beq _0805A36E
	ldr r0, _0805A2E0 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805A2E4 @ =gSubSpriteData1
	ldrh r0, [r0, #8]
	adds r0, #0x80
	cmp r1, r0
	ble _0805A36E
	ldrh r0, [r4, #4]
	lsrs r0, r0, #2
	ldr r1, _0805A2E8 @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x63
	bhi _0805A36E
	ldr r0, _0805A2EC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805A36E
	movs r0, #0x7d
	bl CountSecondarySprite
	cmp r0, #0
	bne _0805A36E
	movs r0, #2
	strb r0, [r5]
	adds r1, r4, #0
	b _0805A368
	.align 2, 0
_0805A2E0: .4byte gSamusData
_0805A2E4: .4byte gSubSpriteData1
_0805A2E8: .4byte gBg1XPosition
_0805A2EC: .4byte gSpriteRandomNumber
_0805A2F0:
	ldr r0, _0805A300 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	cmp r2, r0
	bhs _0805A36E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #9
	b _0805A36C
	.align 2, 0
_0805A300: .4byte gSubSpriteData1
_0805A304:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A324
	ldr r0, _0805A320 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	cmp r2, r0
	bls _0805A36E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #9
	b _0805A36C
	.align 2, 0
_0805A320: .4byte gSubSpriteData1
_0805A324:
	adds r4, r5, #0
	adds r4, #0x25
	ldrb r0, [r4]
	cmp r0, #0x1b
	beq _0805A36E
	ldr r0, _0805A374 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805A378 @ =gSubSpriteData1
	ldrh r0, [r0, #8]
	adds r0, #0x80
	cmp r1, r0
	ble _0805A36E
	ldrh r0, [r5, #4]
	lsrs r0, r0, #2
	ldr r1, _0805A37C @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x8c
	bls _0805A36E
	ldr r0, _0805A380 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805A36E
	movs r0, #0x7d
	bl CountSecondarySprite
	cmp r0, #0
	bne _0805A36E
	movs r0, #2
	strb r0, [r4]
	adds r1, r5, #0
_0805A368:
	adds r1, #0x24
	movs r0, #0x2f
_0805A36C:
	strb r0, [r1]
_0805A36E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805A374: .4byte gSamusData
_0805A378: .4byte gSubSpriteData1
_0805A37C: .4byte gBg1XPosition
_0805A380: .4byte gSpriteRandomNumber

	thumb_func_start RidleyTurningAroundInit
RidleyTurningAroundInit: @ 0x0805A384
	ldr r1, _0805A39C @ =gSubSpriteData1
	ldr r0, _0805A3A0 @ =0x083A9A2C
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A3A4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #4
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805A39C: .4byte gSubSpriteData1
_0805A3A0: .4byte 0x083A9A2C
_0805A3A4: .4byte gCurrentSprite

	thumb_func_start RidleyTurningAround
RidleyTurningAround: @ 0x0805A3A8
	push {lr}
	bl RidleyFloatingMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805A3D8
	ldr r1, _0805A3DC @ =gSubSpriteData1
	ldr r0, _0805A3E0 @ =0x083A9A44
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r2, _0805A3E4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #5
	strb r0, [r1]
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
	bl RidleySetSideHitboxes
_0805A3D8:
	pop {r0}
	bx r0
	.align 2, 0
_0805A3DC: .4byte gSubSpriteData1
_0805A3E0: .4byte 0x083A9A44
_0805A3E4: .4byte gCurrentSprite

	thumb_func_start RidleyTurningAroundSecondPart
RidleyTurningAroundSecondPart: @ 0x0805A3E8
	push {lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805A406
	bl RidleyUpdateClawOam
	ldr r0, _0805A40C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
_0805A406:
	pop {r0}
	bx r0
	.align 2, 0
_0805A40C: .4byte gCurrentSprite

	thumb_func_start RidleyFlyingBackwardsInit
RidleyFlyingBackwardsInit: @ 0x0805A410
	ldr r0, _0805A420 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	movs r2, #0xa
	strb r2, [r1]
	adds r0, #0x2b
	strb r2, [r0]
	bx lr
	.align 2, 0
_0805A420: .4byte gCurrentSprite

	thumb_func_start RidleyFlyingBackwards
RidleyFlyingBackwards: @ 0x0805A424
	push {lr}
	bl RidleyUpdateClawOam
	bl RidleyFloatingMovement
	ldr r1, _0805A44C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805A446
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_0805A446:
	pop {r0}
	bx r0
	.align 2, 0
_0805A44C: .4byte gCurrentSprite

	thumb_func_start RidleyPreparingTailAttack
RidleyPreparingTailAttack: @ 0x0805A450
	push {lr}
	bl RidleyUpdateClawOam
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyTailAttack
RidleyTailAttack: @ 0x0805A45C
	push {lr}
	bl RidleyUpdateClawOam
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyShootingFireInit
RidleyShootingFireInit: @ 0x0805A468
	ldr r1, _0805A480 @ =gSubSpriteData1
	ldr r0, _0805A484 @ =0x083A9994
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A488 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805A480: .4byte gSubSpriteData1
_0805A484: .4byte 0x083A9994
_0805A488: .4byte gCurrentSprite

	thumb_func_start RidleyShootingFire
RidleyShootingFire: @ 0x0805A48C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl RidleyFloatingMovement
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805A4EE
	ldr r2, _0805A4B8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A4C4
	ldr r0, _0805A4BC @ =gSamusData
	ldr r1, _0805A4C0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	blo _0805A4D0
	b _0805A4E4
	.align 2, 0
_0805A4B8: .4byte gCurrentSprite
_0805A4BC: .4byte gSamusData
_0805A4C0: .4byte gSubSpriteData1
_0805A4C4:
	ldr r0, _0805A4DC @ =gSamusData
	ldr r1, _0805A4E0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bls _0805A4E4
_0805A4D0:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
	b _0805A58E
	.align 2, 0
_0805A4DC: .4byte gSamusData
_0805A4E0: .4byte gSubSpriteData1
_0805A4E4:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0805A58E
_0805A4EE:
	ldr r2, _0805A508 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _0805A50C
	movs r6, #0x80
	lsls r6, r6, #2
	ldrh r0, [r5, #4]
	adds r0, #0xa0
	b _0805A512
	.align 2, 0
_0805A508: .4byte gCurrentSprite
_0805A50C:
	movs r6, #0
	ldrh r0, [r5, #4]
	subs r0, #0xa0
_0805A512:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r3, r5, #0
	ldrh r0, [r3, #2]
	subs r0, #0x20
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r7, r1, #0
	ldr r2, _0805A550 @ =gSubSpriteData1
	ldrb r0, [r2, #6]
	cmp r0, #1
	bne _0805A58E
	ldrh r0, [r2, #4]
	cmp r0, #3
	bne _0805A558
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #0
	bl SpriteSpawnSecondary
	ldr r0, _0805A554 @ =0x000001E3
	bl SoundPlay
	b _0805A58E
	.align 2, 0
_0805A550: .4byte gSubSpriteData1
_0805A554: .4byte 0x000001E3
_0805A558:
	cmp r0, #7
	bne _0805A574
	ldrb r2, [r3, #0x1f]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #2
	bl SpriteSpawnSecondary
	b _0805A58E
_0805A574:
	cmp r0, #0xb
	bne _0805A58E
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	str r7, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x7d
	movs r1, #4
	bl SpriteSpawnSecondary
_0805A58E:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyPartInit
RidleyPartInit: @ 0x0805A598
	push {r4, lr}
	ldr r2, _0805A5CC @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _0805A5D0 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	strh r0, [r2]
	ldr r0, _0805A5D4 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r3, #3
	adds r0, r3, #0
	ands r0, r1
	adds r1, r2, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	ldrb r1, [r2, #0x1e]
	cmp r1, #1
	beq _0805A5F4
	cmp r1, #1
	bgt _0805A5D8
	cmp r1, #0
	beq _0805A5DE
	b _0805A658
	.align 2, 0
_0805A5CC: .4byte gCurrentSprite
_0805A5D0: .4byte 0x0000FFFB
_0805A5D4: .4byte gIoRegisters
_0805A5D8:
	cmp r1, #3
	beq _0805A624
	b _0805A658
_0805A5DE:
	adds r0, r2, #0
	adds r0, #0x22
	strb r3, [r0]
	adds r0, #5
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _0805A640
_0805A5F4:
	adds r0, r2, #0
	adds r0, #0x27
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805A620 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x25
	strb r4, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	b _0805A65A
	.align 2, 0
_0805A620: .4byte 0x0000FFFC
_0805A624:
	adds r1, r2, #0
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x40
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0x20
	strb r0, [r1]
_0805A640:
	ldr r1, _0805A654 @ =0x0000FFFC
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r0, r2, #0
	adds r0, #0x25
	strb r4, [r0]
	b _0805A65C
	.align 2, 0
_0805A654: .4byte 0x0000FFFC
_0805A658:
	movs r0, #0
_0805A65A:
	strh r0, [r2]
_0805A65C:
	bl RidleySyncSubSprites
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyPartidle
RidleyPartidle: @ 0x0805A668
	push {lr}
	ldr r2, _0805A69C @ =gCurrentSprite
	ldrh r0, [r2, #0x16]
	ldr r1, [r2, #0x18]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xf0
	lsls r1, r1, #8
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	cmp r0, r1
	bne _0805A6A0
	adds r1, r2, #0
	adds r1, #0x35
	movs r0, #0
	strb r0, [r1]
	adds r3, r2, #0
	adds r3, #0x27
	movs r1, #0x40
	strb r1, [r3]
	adds r1, r2, #0
	adds r1, #0x28
	b _0805A6B2
	.align 2, 0
_0805A69C: .4byte gCurrentSprite
_0805A6A0:
	adds r1, r2, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0xe
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x38
_0805A6B2:
	strb r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start RidleyTailPartInit
RidleyTailPartInit: @ 0x0805A6B8
	push {r4, r5, r6, lr}
	ldr r3, _0805A73C @ =gCurrentSprite
	ldrh r0, [r3]
	ldr r4, _0805A740 @ =0x0000FFFB
	ands r4, r0
	movs r5, #0
	movs r6, #0
	strh r4, [r3]
	ldr r0, _0805A744 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x21
	strb r0, [r1]
	adds r1, #3
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r3, #0x14]
	ldrb r1, [r3, #0x1e]
	adds r0, r1, #4
	subs r2, #0x12
	strb r0, [r2]
	adds r2, #3
	movs r0, #0x18
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #7
	bne _0805A754
	ldr r0, _0805A748 @ =gSubSpriteData2
	ldr r1, _0805A74C @ =0x083A9B1C
	str r1, [r0]
	strb r5, [r0, #6]
	strh r6, [r0, #4]
	movs r1, #8
	adds r0, r4, #0
	orrs r0, r1
	strh r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	adds r0, r3, #0
	adds r0, #0x2b
	strb r5, [r0]
	strh r6, [r3, #6]
	ldr r1, _0805A750 @ =0x0000FFE4
	strh r1, [r3, #0xa]
	movs r0, #0x1c
	b _0805A75A
	.align 2, 0
_0805A73C: .4byte gCurrentSprite
_0805A740: .4byte 0x0000FFFB
_0805A744: .4byte gIoRegisters
_0805A748: .4byte gSubSpriteData2
_0805A74C: .4byte 0x083A9B1C
_0805A750: .4byte 0x0000FFE4
_0805A754:
	ldr r1, _0805A768 @ =0x0000FFEC
	strh r1, [r3, #0xa]
	movs r0, #0x14
_0805A75A:
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805A768: .4byte 0x0000FFEC

	thumb_func_start RidleyTailPartHandleRotation
RidleyTailPartHandleRotation: @ 0x0805A76C
	push {r4, lr}
	ldr r1, _0805A790 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r4, #0x80
	lsls r4, r4, #3
	adds r0, r4, #0
	ands r0, r2
	cmp r0, #0
	beq _0805A79C
	adds r3, r1, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0xe0
	bne _0805A798
	ldr r0, _0805A794 @ =0x0000FBFF
	ands r0, r2
	strh r0, [r1]
	b _0805A7B2
	.align 2, 0
_0805A790: .4byte gCurrentSprite
_0805A794: .4byte 0x0000FBFF
_0805A798:
	subs r0, #1
	b _0805A7B0
_0805A79C:
	adds r3, r1, #0
	adds r3, #0x2b
	ldrb r0, [r3]
	cmp r0, #0x20
	bne _0805A7AE
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r1]
	b _0805A7B2
_0805A7AE:
	adds r0, #1
_0805A7B0:
	strb r0, [r3]
_0805A7B2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyTailPartIdle
RidleyTailPartIdle: @ 0x0805A7B8
	push {r4, lr}
	ldr r0, _0805A818 @ =gCurrentSprite
	adds r0, #0x23
	ldrb r4, [r0]
	bl RidleyTailPartHandleRotation
	ldr r0, _0805A81C @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _0805A820 @ =0x083A9A14
	cmp r1, r0
	beq _0805A7E2
	ldr r2, _0805A824 @ =gSubSpriteData2
	ldr r1, [r2]
	ldr r0, _0805A828 @ =0x083A9B9C
	cmp r1, r0
	bne _0805A7E2
	ldr r0, _0805A82C @ =0x083A9B1C
	str r0, [r2]
	movs r0, #0
	strb r0, [r2, #6]
	strh r0, [r2, #4]
_0805A7E2:
	ldr r0, _0805A830 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x29
	bne _0805A810
	ldr r2, _0805A818 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r3, #0
	movs r0, #0x38
	strb r0, [r1]
	ldr r1, _0805A824 @ =gSubSpriteData2
	ldr r0, _0805A834 @ =0x083A9C1C
	str r0, [r1]
	strb r3, [r1, #6]
	movs r0, #0
	strh r3, [r1, #4]
	adds r2, #0x2b
	strb r0, [r2]
_0805A810:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A818: .4byte gCurrentSprite
_0805A81C: .4byte gSubSpriteData1
_0805A820: .4byte 0x083A9A14
_0805A824: .4byte gSubSpriteData2
_0805A828: .4byte 0x083A9B9C
_0805A82C: .4byte 0x083A9B1C
_0805A830: .4byte gSpriteData
_0805A834: .4byte 0x083A9C1C

	thumb_func_start RidleyTailPartWaitingTOWindUp
RidleyTailPartWaitingTOWindUp: @ 0x0805A838
	push {lr}
	bl CheckEndOfSubSpriteData2Animation
	cmp r0, #0
	beq _0805A856
	ldr r1, _0805A85C @ =gSubSpriteData2
	ldr r0, _0805A860 @ =0x083A9C74
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A864 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3a
	strb r1, [r0]
_0805A856:
	pop {r0}
	bx r0
	.align 2, 0
_0805A85C: .4byte gSubSpriteData2
_0805A860: .4byte 0x083A9C74
_0805A864: .4byte gCurrentSprite

	thumb_func_start RidleyTailPartWindingUp1
RidleyTailPartWindingUp1: @ 0x0805A868
	push {r4, lr}
	ldr r4, _0805A8BC @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805A8C0 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805A8C4 @ =0x00010003
	cmp r0, r1
	bne _0805A87E
	ldr r0, _0805A8C8 @ =0x000001E5
	bl SoundPlay
_0805A87E:
	bl CheckEndOfSubSpriteData2Animation
	cmp r0, #0
	beq _0805A8A6
	ldr r0, _0805A8CC @ =0x083A9CDC
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	ldr r1, _0805A8D0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x3c
	strb r0, [r2]
	ldr r0, _0805A8D4 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #1
	adds r0, #2
	adds r1, #0x2e
	strb r0, [r1]
_0805A8A6:
	ldr r2, _0805A8D8 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805A8DC @ =0x0000027F
	cmp r1, r0
	bls _0805A8B4
	subs r0, r1, #2
	strh r0, [r2, #8]
_0805A8B4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805A8BC: .4byte gSubSpriteData2
_0805A8C0: .4byte 0x00FFFFFF
_0805A8C4: .4byte 0x00010003
_0805A8C8: .4byte 0x000001E5
_0805A8CC: .4byte 0x083A9CDC
_0805A8D0: .4byte gCurrentSprite
_0805A8D4: .4byte gSpriteRandomNumber
_0805A8D8: .4byte gSubSpriteData1
_0805A8DC: .4byte 0x0000027F

	thumb_func_start RidleyTailPartWindingUp2
RidleyTailPartWindingUp2: @ 0x0805A8E0
	push {r4, r5, r6, lr}
	ldr r0, _0805A940 @ =gSubSpriteData2
	ldr r0, [r0, #4]
	ldr r1, _0805A944 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805A948 @ =0x00010003
	cmp r0, r1
	bne _0805A8F6
	ldr r0, _0805A94C @ =0x000001E5
	bl SoundPlay
_0805A8F6:
	ldr r5, _0805A950 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r4, [r0]
	movs r6, #0
	bl CheckEndOfSubSpriteData2Animation
	cmp r0, #0
	bne _0805A90A
	b _0805A9FC
_0805A90A:
	ldr r1, _0805A954 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x19
	strb r0, [r1]
	ldrh r2, [r3]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0805A970
	ldr r0, _0805A958 @ =gSubSpriteData1
	ldr r1, _0805A95C @ =gSamusData
	ldrh r0, [r0, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0805A964
	ldr r0, _0805A960 @ =0x0000FDFF
	ands r0, r2
	b _0805A998
	.align 2, 0
_0805A940: .4byte gSubSpriteData2
_0805A944: .4byte 0x00FFFFFF
_0805A948: .4byte 0x00010003
_0805A94C: .4byte 0x000001E5
_0805A950: .4byte gCurrentSprite
_0805A954: .4byte gSpriteData
_0805A958: .4byte gSubSpriteData1
_0805A95C: .4byte gSamusData
_0805A960: .4byte 0x0000FDFF
_0805A964:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r3]
	b _0805A99E
_0805A970:
	ldr r0, _0805A984 @ =gSubSpriteData1
	ldr r1, _0805A988 @ =gSamusData
	ldrh r0, [r0, #0xa]
	ldrh r1, [r1, #0x16]
	cmp r0, r1
	bls _0805A990
	ldr r0, _0805A98C @ =0x0000FDFF
	ands r0, r2
	strh r0, [r3]
	b _0805A99E
	.align 2, 0
_0805A984: .4byte gSubSpriteData1
_0805A988: .4byte gSamusData
_0805A98C: .4byte 0x0000FDFF
_0805A990:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	orrs r0, r2
_0805A998:
	strh r0, [r3]
	cmp r6, #0
	beq _0805A9C0
_0805A99E:
	ldr r1, _0805A9B4 @ =gSubSpriteData2
	ldr r0, _0805A9B8 @ =0x083A9D44
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805A9BC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x44
	strb r1, [r0]
	b _0805A9FC
	.align 2, 0
_0805A9B4: .4byte gSubSpriteData2
_0805A9B8: .4byte 0x083A9D44
_0805A9BC: .4byte gCurrentSprite
_0805A9C0:
	ldr r0, _0805A9E8 @ =gSubSpriteData2
	ldr r1, _0805A9EC @ =0x083A9DF4
	str r1, [r0]
	strb r6, [r0, #6]
	strh r6, [r0, #4]
	ldr r2, _0805A9F0 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3e
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805A9F4
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0xe0
	b _0805A9FA
	.align 2, 0
_0805A9E8: .4byte gSubSpriteData2
_0805A9EC: .4byte 0x083A9DF4
_0805A9F0: .4byte gCurrentSprite
_0805A9F4:
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #0x20
_0805A9FA:
	strb r0, [r1]
_0805A9FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RidleyTailPartStrikingDown1
RidleyTailPartStrikingDown1: @ 0x0805AA04
	push {r4, lr}
	ldr r4, _0805AA38 @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805AA3C @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805AA40 @ =0x00010003
	cmp r0, r1
	bne _0805AA1A
	ldr r0, _0805AA44 @ =0x000001E7
	bl SoundPlay
_0805AA1A:
	bl CheckEndOfSubSpriteData2Animation
	cmp r0, #0
	beq _0805AA50
	ldr r0, _0805AA48 @ =0x083A9E64
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	ldr r0, _0805AA4C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x40
	strb r1, [r0]
	b _0805AA78
	.align 2, 0
_0805AA38: .4byte gSubSpriteData2
_0805AA3C: .4byte 0x00FFFFFF
_0805AA40: .4byte 0x00010003
_0805AA44: .4byte 0x000001E7
_0805AA48: .4byte 0x083A9E64
_0805AA4C: .4byte gCurrentSprite
_0805AA50:
	ldrh r0, [r4, #4]
	cmp r0, #7
	bhi _0805AA5E
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AA6E
_0805AA5E:
	ldr r2, _0805AA80 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AA84 @ =0x0000027F
	cmp r1, r0
	bls _0805AA6E
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AA6E:
	movs r0, #2
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AA78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AA80: .4byte gSubSpriteData1
_0805AA84: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingDown2
RidleyTailPartStrikingDown2: @ 0x0805AA88
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805AB10 @ =gSubSpriteData2
	ldr r0, [r0, #4]
	ldr r1, _0805AB14 @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _0805AAA0
	ldr r0, _0805AB18 @ =0x000001E7
	bl SoundPlay
_0805AAA0:
	movs r5, #0
	ldr r6, _0805AB1C @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl CheckEndOfSubSpriteData2Animation
	cmp r0, #0
	beq _0805AB5C
	ldr r0, _0805AB20 @ =gSamusData
	ldr r1, _0805AB24 @ =gSubSpriteData1
	ldrh r2, [r0, #0x18]
	adds r7, r0, #0
	adds r3, r1, #0
	ldrh r0, [r3, #8]
	cmp r2, r0
	blo _0805AAD4
	ldr r0, _0805AB28 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _0805AADC
_0805AAD4:
	adds r1, r6, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
_0805AADC:
	ldr r1, _0805AB1C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #0
	beq _0805AB34
	ldr r1, _0805AB28 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AB2C
	ldrh r0, [r3, #0xa]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bls _0805AB3A
	b _0805AB34
	.align 2, 0
_0805AB10: .4byte gSubSpriteData2
_0805AB14: .4byte 0x00FFFFFF
_0805AB18: .4byte 0x000001E7
_0805AB1C: .4byte gCurrentSprite
_0805AB20: .4byte gSamusData
_0805AB24: .4byte gSubSpriteData1
_0805AB28: .4byte gSpriteData
_0805AB2C:
	ldrh r0, [r3, #0xa]
	ldrh r7, [r7, #0x16]
	cmp r0, r7
	bhs _0805AB3A
_0805AB34:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0805AB3A:
	cmp r5, #0
	beq _0805AB5C
	ldr r1, _0805AB54 @ =gSubSpriteData2
	ldr r0, _0805AB58 @ =0x083A9EBC
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x42
	strb r0, [r1]
	b _0805AB8A
	.align 2, 0
_0805AB54: .4byte gSubSpriteData2
_0805AB58: .4byte 0x083A9EBC
_0805AB5C:
	ldr r0, _0805AB6C @ =gSubSpriteData2
	ldrh r0, [r0, #4]
	cmp r0, #4
	bhi _0805AB70
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AB80
	.align 2, 0
_0805AB6C: .4byte gSubSpriteData2
_0805AB70:
	ldr r2, _0805AB90 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AB94 @ =0x0000027F
	cmp r1, r0
	bls _0805AB80
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AB80:
	movs r0, #4
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AB8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805AB90: .4byte gSubSpriteData1
_0805AB94: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingDown3
RidleyTailPartStrikingDown3: @ 0x0805AB98
	push {r4, lr}
	ldr r4, _0805ABD8 @ =gSubSpriteData2
	ldr r0, [r4, #4]
	ldr r1, _0805ABDC @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _0805ABB0
	ldr r0, _0805ABE0 @ =0x000001E7
	bl SoundPlay
_0805ABB0:
	bl CheckEndOfSubSpriteData2Animation
	cmp r0, #0
	beq _0805AC08
	ldr r2, _0805ABE4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	cmp r1, #0
	beq _0805ABEC
	ldr r0, _0805ABE8 @ =0x083A9CDC
	str r0, [r4]
	movs r0, #0
	strb r0, [r4, #6]
	strh r0, [r4, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	b _0805AC30
	.align 2, 0
_0805ABD8: .4byte gSubSpriteData2
_0805ABDC: .4byte 0x00FFFFFF
_0805ABE0: .4byte 0x000001E7
_0805ABE4: .4byte gCurrentSprite
_0805ABE8: .4byte 0x083A9CDC
_0805ABEC:
	ldr r0, _0805AC04 @ =0x083A9F44
	str r0, [r4]
	strb r1, [r4, #6]
	strh r1, [r4, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	b _0805AC30
	.align 2, 0
_0805AC04: .4byte 0x083A9F44
_0805AC08:
	ldrh r0, [r4, #4]
	cmp r0, #4
	bhi _0805AC16
	movs r0, #0xc
	bl RidleyTailStrikeYMovement
	b _0805AC26
_0805AC16:
	ldr r2, _0805AC38 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805AC3C @ =0x0000027F
	cmp r1, r0
	bls _0805AC26
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r2, #8]
_0805AC26:
	movs r0, #2
	bl RidleyTailXMovement
	bl RidleyTailStrikingCheckPlayEffects
_0805AC30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AC38: .4byte gSubSpriteData1
_0805AC3C: .4byte 0x0000027F

	thumb_func_start RidleyTailPartStrikingForward
RidleyTailPartStrikingForward: @ 0x0805AC40
	push {r4, r5, r6, lr}
	ldr r6, _0805ACBC @ =gSubSpriteData2
	ldr r0, [r6, #4]
	ldr r1, _0805ACC0 @ =0x00FFFFFF
	ands r0, r1
	ldr r1, _0805ACC4 @ =0x00010003
	cmp r0, r1
	bne _0805AC58
	movs r0, #0xf3
	lsls r0, r0, #1
	bl SoundPlay
_0805AC58:
	ldr r5, _0805ACC8 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl CheckEndOfSubSpriteData2Animation
	cmp r0, #0
	beq _0805ACF8
	ldr r0, _0805ACCC @ =gSamusData
	ldr r1, _0805ACD0 @ =gSubSpriteData1
	ldrh r0, [r0, #0x18]
	ldrh r1, [r1, #8]
	cmp r0, r1
	blo _0805AC86
	ldr r0, _0805ACD4 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x25
	ldrb r0, [r1]
	cmp r0, #0x1b
	bne _0805AC8E
_0805AC86:
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #1
	strb r0, [r1]
_0805AC8E:
	ldr r2, _0805ACC8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	movs r3, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805ACDC
	ldr r0, _0805ACBC @ =gSubSpriteData2
	ldr r1, _0805ACD8 @ =0x083A9F44
	str r1, [r0]
	strb r3, [r0, #6]
	strh r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	b _0805AD34
	.align 2, 0
_0805ACBC: .4byte gSubSpriteData2
_0805ACC0: .4byte 0x00FFFFFF
_0805ACC4: .4byte 0x00010003
_0805ACC8: .4byte gCurrentSprite
_0805ACCC: .4byte gSamusData
_0805ACD0: .4byte gSubSpriteData1
_0805ACD4: .4byte gSpriteData
_0805ACD8: .4byte 0x083A9F44
_0805ACDC:
	ldr r0, _0805ACF0 @ =gSubSpriteData2
	ldr r1, _0805ACF4 @ =0x083A9CDC
	str r1, [r0]
	strb r3, [r0, #6]
	strh r3, [r0, #4]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	b _0805AD34
	.align 2, 0
_0805ACF0: .4byte gSubSpriteData2
_0805ACF4: .4byte 0x083A9CDC
_0805ACF8:
	ldrh r0, [r6, #4]
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _0805AD28
	ldr r1, _0805AD1C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805AD24
	ldr r0, _0805AD20 @ =0x083AF4B8
	b _0805AD26
	.align 2, 0
_0805AD1C: .4byte gSpriteData
_0805AD20: .4byte 0x083AF4B8
_0805AD24:
	ldr r0, _0805AD3C @ =0x083AF800
_0805AD26:
	str r0, [r5, #0x18]
_0805AD28:
	movs r0, #4
	bl RidleyTailStrikeYMovement
	movs r0, #1
	bl RidleyTailXMovement
_0805AD34:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AD3C: .4byte 0x083AF800

	thumb_func_start RidleyTailPartDoneStriking
RidleyTailPartDoneStriking: @ 0x0805AD40
	push {r4, r5, r6, lr}
	ldr r6, _0805ADB0 @ =gCurrentSprite
	adds r0, r6, #0
	adds r0, #0x23
	ldrb r4, [r0]
	bl CheckEndOfSubSpriteData2Animation
	cmp r0, #0
	beq _0805ADCA
	ldr r1, _0805ADB4 @ =gSubSpriteData2
	ldr r0, _0805ADB8 @ =0x083A9B1C
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r5, #0
	strh r0, [r1, #4]
	adds r0, r6, #0
	adds r0, #0x24
	movs r2, #2
	strb r2, [r0]
	ldr r1, _0805ADBC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x24
	strb r2, [r0]
	adds r0, #0xb
	strb r5, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r5, [r0]
	adds r0, #3
	strb r1, [r0]
	ldr r0, _0805ADC0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	lsls r0, r0, #4
	subs r0, #1
	adds r1, r3, #0
	adds r1, #0x2b
	strb r0, [r1]
	ldrh r1, [r3]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805ADC4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
	b _0805ADC8
	.align 2, 0
_0805ADB0: .4byte gCurrentSprite
_0805ADB4: .4byte gSubSpriteData2
_0805ADB8: .4byte 0x083A9B1C
_0805ADBC: .4byte gSpriteData
_0805ADC0: .4byte gSpriteRandomNumber
_0805ADC4:
	ldr r0, _0805ADD0 @ =0x0000FDFF
	ands r0, r1
_0805ADC8:
	strh r0, [r3]
_0805ADCA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805ADD0: .4byte 0x0000FDFF

	thumb_func_start RidleyFireInit
RidleyFireInit: @ 0x0805ADD4
	push {r4, r5, r6, lr}
	ldr r0, _0805AE68 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r4, _0805AE6C @ =0x0000FFFB
	ands r4, r0
	movs r5, #0
	movs r3, #0
	movs r0, #0x80
	orrs r4, r0
	orrs r4, r5
	mov r1, ip
	strh r4, [r1]
	ldr r0, _0805AE70 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	adds r0, #5
	movs r1, #0xc
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805AE74 @ =0x0000FFE0
	mov r6, ip
	strh r1, [r6, #0xa]
	movs r0, #0x20
	strh r0, [r6, #0xc]
	strh r1, [r6, #0xe]
	strh r0, [r6, #0x10]
	ldr r0, _0805AE78 @ =0x083AF7F0
	str r0, [r6, #0x18]
	strb r5, [r6, #0x1c]
	strh r3, [r6, #0x16]
	mov r0, ip
	adds r0, #0x2b
	strb r5, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r6, #0x12]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x30
	strb r5, [r0]
	subs r0, #0xc
	strb r2, [r0]
	subs r1, #9
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0805AE7C @ =gSamusData
	ldrh r0, [r6, #2]
	ldrh r1, [r1, #0x18]
	cmp r0, r1
	bhs _0805AE60
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r4, r0
	strh r4, [r6]
_0805AE60:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805AE68: .4byte gCurrentSprite
_0805AE6C: .4byte 0x0000FFFB
_0805AE70: .4byte gIoRegisters
_0805AE74: .4byte 0x0000FFE0
_0805AE78: .4byte 0x083AF7F0
_0805AE7C: .4byte gSamusData

	thumb_func_start RidleyFireMoving
RidleyFireMoving: @ 0x0805AE80
	push {r4, lr}
	ldr r3, _0805AEA8 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r2, r3, #0
	cmp r0, #0
	beq _0805AEAC
	ldrh r0, [r2, #4]
	adds r0, r4, r0
	b _0805AEB0
	.align 2, 0
_0805AEA8: .4byte gCurrentSprite
_0805AEAC:
	ldrh r0, [r2, #4]
	subs r0, r0, r4
_0805AEB0:
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	ldrb r1, [r2, #0x1e]
	adds r0, r0, r1
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AED0
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #0x20
	b _0805AED8
_0805AED0:
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
_0805AED8:
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805AF06
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	strb r3, [r4]
	adds r0, #1
	strb r1, [r0]
_0805AF06:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyFireMovingTowardsSamus
RidleyFireMovingTowardsSamus: @ 0x0805AF0C
	push {r4, lr}
	sub sp, #4
	ldr r0, _0805AF60 @ =gCurrentSprite
	ldrb r0, [r0, #0x1e]
	movs r2, #8
	cmp r0, #4
	beq _0805AF2E
	movs r2, #0x28
	cmp r0, #3
	beq _0805AF2E
	movs r2, #0x48
	cmp r0, #2
	beq _0805AF2E
	movs r2, #0x82
	cmp r0, #1
	bne _0805AF2E
	movs r2, #0x68
_0805AF2E:
	ldr r1, _0805AF64 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x16]
	movs r2, #2
	str r2, [sp]
	movs r2, #0x20
	movs r3, #0x28
	bl MoveRidleyFireBall
	ldr r2, _0805AF60 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805AF68
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #0x20
	b _0805AF70
	.align 2, 0
_0805AF60: .4byte gCurrentSprite
_0805AF64: .4byte gSamusData
_0805AF68:
	adds r1, r2, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
_0805AF70:
	strb r0, [r1]
	ldr r4, _0805AF94 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805AF98 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805AF8C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_0805AF8C:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805AF94: .4byte gCurrentSprite
_0805AF98: .4byte gPreviousCollisionCheck

	thumb_func_start RidleyFireExploding
RidleyFireExploding: @ 0x0805AF9C
	push {lr}
	ldr r1, _0805AFBC @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0x25
	bl ParticleSet
	movs r0, #0xf2
	lsls r0, r0, #1
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805AFBC: .4byte gCurrentSprite

	thumb_func_start Ridley
Ridley: @ 0x0805AFC0
	push {lr}
	bl RidleyWaveBeamCollsiion
	bl RidleySamusGrabbed
	bl RidleyUpdateHealthThreshold
	ldr r0, _0805AFE8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x59
	bls _0805AFDC
	b _0805B1B8
_0805AFDC:
	lsls r0, r0, #2
	ldr r1, _0805AFEC @ =_0805AFF0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805AFE8: .4byte gCurrentSprite
_0805AFEC: .4byte _0805AFF0
_0805AFF0: @ jump table
	.4byte _0805B180 @ case 0
	.4byte _0805B184 @ case 1
	.4byte _0805B194 @ case 2
	.4byte _0805B198 @ case 3
	.4byte _0805B19E @ case 4
	.4byte _0805B1B8 @ case 5
	.4byte _0805B1B8 @ case 6
	.4byte _0805B1B8 @ case 7
	.4byte _0805B18A @ case 8
	.4byte _0805B18E @ case 9
	.4byte _0805B1B8 @ case 10
	.4byte _0805B1B8 @ case 11
	.4byte _0805B1B8 @ case 12
	.4byte _0805B1B8 @ case 13
	.4byte _0805B1B8 @ case 14
	.4byte _0805B1B8 @ case 15
	.4byte _0805B1B8 @ case 16
	.4byte _0805B1B8 @ case 17
	.4byte _0805B1B8 @ case 18
	.4byte _0805B1B8 @ case 19
	.4byte _0805B1B8 @ case 20
	.4byte _0805B1B8 @ case 21
	.4byte _0805B1B8 @ case 22
	.4byte _0805B164 @ case 23
	.4byte _0805B1B8 @ case 24
	.4byte _0805B16A @ case 25
	.4byte _0805B1B8 @ case 26
	.4byte _0805B1B8 @ case 27
	.4byte _0805B1B8 @ case 28
	.4byte _0805B1B8 @ case 29
	.4byte _0805B170 @ case 30
	.4byte _0805B174 @ case 31
	.4byte _0805B1B8 @ case 32
	.4byte _0805B1B8 @ case 33
	.4byte _0805B1B8 @ case 34
	.4byte _0805B1B8 @ case 35
	.4byte _0805B1B8 @ case 36
	.4byte _0805B1B8 @ case 37
	.4byte _0805B1B8 @ case 38
	.4byte _0805B1B8 @ case 39
	.4byte _0805B1A4 @ case 40
	.4byte _0805B1AA @ case 41
	.4byte _0805B1B8 @ case 42
	.4byte _0805B1B8 @ case 43
	.4byte _0805B1B8 @ case 44
	.4byte _0805B1B8 @ case 45
	.4byte _0805B1B0 @ case 46
	.4byte _0805B1B4 @ case 47
	.4byte _0805B1B8 @ case 48
	.4byte _0805B1B8 @ case 49
	.4byte _0805B1B8 @ case 50
	.4byte _0805B1B8 @ case 51
	.4byte _0805B1B8 @ case 52
	.4byte _0805B1B8 @ case 53
	.4byte _0805B1B8 @ case 54
	.4byte _0805B17A @ case 55
	.4byte _0805B1B8 @ case 56
	.4byte _0805B1B8 @ case 57
	.4byte _0805B1B8 @ case 58
	.4byte _0805B1B8 @ case 59
	.4byte _0805B1B8 @ case 60
	.4byte _0805B1B8 @ case 61
	.4byte _0805B1B8 @ case 62
	.4byte _0805B1B8 @ case 63
	.4byte _0805B1B8 @ case 64
	.4byte _0805B1B8 @ case 65
	.4byte _0805B1B8 @ case 66
	.4byte _0805B1B8 @ case 67
	.4byte _0805B1B8 @ case 68
	.4byte _0805B1B8 @ case 69
	.4byte _0805B1B8 @ case 70
	.4byte _0805B1B8 @ case 71
	.4byte _0805B1B8 @ case 72
	.4byte _0805B1B8 @ case 73
	.4byte _0805B1B8 @ case 74
	.4byte _0805B1B8 @ case 75
	.4byte _0805B1B8 @ case 76
	.4byte _0805B1B8 @ case 77
	.4byte _0805B1B8 @ case 78
	.4byte _0805B1B8 @ case 79
	.4byte _0805B1B8 @ case 80
	.4byte _0805B1B8 @ case 81
	.4byte _0805B1B8 @ case 82
	.4byte _0805B1B8 @ case 83
	.4byte _0805B1B8 @ case 84
	.4byte _0805B1B8 @ case 85
	.4byte _0805B1B8 @ case 86
	.4byte _0805B1B8 @ case 87
	.4byte _0805B158 @ case 88
	.4byte _0805B15E @ case 89
_0805B158:
	bl RidleyInit
	b _0805B1B8
_0805B15E:
	bl RidleyForming
	b _0805B1B8
_0805B164:
	bl RidleyScreamingAfterSpawn
	b _0805B1B8
_0805B16A:
	bl RidleyRisingAfterSpawn
	b _0805B1B8
_0805B170:
	bl RidleyScreamingInit
_0805B174:
	bl RidleyScreaming
	b _0805B1B8
_0805B17A:
	bl RidleyTurningIntoCoreX
	b _0805B1B8
_0805B180:
	bl RidleyIdleInit
_0805B184:
	bl RidleyIdle
	b _0805B1B8
_0805B18A:
	bl RidleyFlyingBackwardsInit
_0805B18E:
	bl RidleyFlyingBackwards
	b _0805B1B8
_0805B194:
	bl RidleyTurningAroundInit
_0805B198:
	bl RidleyTurningAround
	b _0805B1B8
_0805B19E:
	bl RidleyTurningAroundSecondPart
	b _0805B1B8
_0805B1A4:
	bl RidleyPreparingTailAttack
	b _0805B1B8
_0805B1AA:
	bl RidleyTailAttack
	b _0805B1B8
_0805B1B0:
	bl RidleyShootingFireInit
_0805B1B4:
	bl RidleyShootingFire
_0805B1B8:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl RidleySyncSubSprites
	bl RidleySetBackgroundPriority
	bl RidleyUpdatePalette
	pop {r0}
	bx r0

	thumb_func_start RidleyPart
RidleyPart: @ 0x0805B1CC
	push {r4, r5, r6, lr}
	ldr r0, _0805B1E8 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r5, [r1]
	adds r1, #1
	ldrb r1, [r1]
	adds r4, r0, #0
	cmp r1, #0
	bne _0805B1EC
	bl RidleyPartInit
	b _0805B2B6
	.align 2, 0
_0805B1E8: .4byte gCurrentSprite
_0805B1EC:
	ldr r2, _0805B20C @ =gSpriteData
	lsls r3, r5, #3
	subs r0, r3, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	adds r6, r3, #0
	cmp r0, #0
	beq _0805B210
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	b _0805B216
	.align 2, 0
_0805B20C: .4byte gSpriteData
_0805B210:
	ldrh r1, [r4]
	ldr r0, _0805B23C @ =0x0000FFBF
	ands r0, r1
_0805B216:
	strh r0, [r4]
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r1, [r2]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805B240
	ldrh r0, [r4]
	movs r1, #0x20
	orrs r1, r0
	strh r1, [r4]
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x49
	bne _0805B248
	movs r0, #0
	strh r0, [r4]
	b _0805B2B6
	.align 2, 0
_0805B23C: .4byte 0x0000FFBF
_0805B240:
	ldrh r1, [r4]
	ldr r0, _0805B280 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r4]
_0805B248:
	bl RidleySyncSubSprites
	ldr r4, _0805B284 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _0805B2B6
	bl RidleyPartidle
	ldr r1, _0805B288 @ =gSpriteData
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x20
	ldrb r3, [r0]
	cmp r3, #0
	beq _0805B28C
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	movs r1, #0xd
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _0805B292
	.align 2, 0
_0805B280: .4byte 0x0000FFDF
_0805B284: .4byte gCurrentSprite
_0805B288: .4byte gSpriteData
_0805B28C:
	adds r0, r4, #0
	adds r0, #0x20
	strb r3, [r0]
_0805B292:
	ldr r1, _0805B2BC @ =gCurrentSprite
	ldrb r0, [r1, #0x1e]
	cmp r0, #0
	bne _0805B2B6
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0805B2B6
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0805B2B6
	ldr r1, [r1, #0x18]
	ldr r0, _0805B2C0 @ =0x083AF648
	cmp r1, r0
	beq _0805B2B6
	movs r0, #0xf1
	lsls r0, r0, #1
	bl SoundPlay
_0805B2B6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805B2BC: .4byte gCurrentSprite
_0805B2C0: .4byte 0x083AF648

	thumb_func_start RidleyTailPart
RidleyTailPart: @ 0x0805B2C4
	push {r4, r5, r6, lr}
	ldr r3, _0805B2FC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r5, [r0]
	ldr r2, _0805B300 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r6, r0, r2
	ldrh r1, [r6]
	movs r0, #0x20
	ands r0, r1
	adds r4, r3, #0
	cmp r0, #0
	beq _0805B308
	ldrh r0, [r4]
	ldr r3, _0805B304 @ =0x00008020
	adds r1, r3, #0
	orrs r1, r0
	strh r1, [r4]
	ldrb r0, [r6, #0x1d]
	cmp r0, #0x49
	bne _0805B310
	movs r0, #0
	strh r0, [r4]
	b _0805B54A
	.align 2, 0
_0805B2FC: .4byte gCurrentSprite
_0805B300: .4byte gSpriteData
_0805B304: .4byte 0x00008020
_0805B308:
	ldrh r1, [r4]
	ldr r0, _0805B330 @ =0x00007FDF
	ands r0, r1
	strh r0, [r4]
_0805B310:
	ldrb r0, [r4, #0x1e]
	cmp r0, #7
	beq _0805B354
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805B334
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	b _0805B33A
	.align 2, 0
_0805B330: .4byte 0x00007FDF
_0805B334:
	ldrh r1, [r4]
	ldr r0, _0805B350 @ =0x0000FFBF
	ands r0, r1
_0805B33A:
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805B34A
	bl RidleyTailPartInit
_0805B34A:
	bl RidleyTailSyncSubSprites
	b _0805B54A
	.align 2, 0
_0805B350: .4byte 0x0000FFBF
_0805B354:
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0805B384
	ldrh r1, [r4]
	movs r2, #0
	movs r3, #0
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
	ldr r0, _0805B380 @ =0x083AF800
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	b _0805B396
	.align 2, 0
_0805B380: .4byte 0x083AF800
_0805B384:
	ldrh r1, [r4]
	ldr r0, _0805B3D0 @ =0x0000FFBF
	ands r0, r1
	movs r1, #0
	strh r0, [r4]
	ldr r0, _0805B3D4 @ =0x083AF4B8
	str r0, [r4, #0x18]
	strb r1, [r4, #0x1c]
	strh r2, [r4, #0x16]
_0805B396:
	ldr r0, _0805B3D8 @ =gSubSpriteData1
	ldr r1, [r0]
	ldr r0, _0805B3DC @ =0x083A9A14
	cmp r1, r0
	bne _0805B3BA
	ldr r1, _0805B3E0 @ =gSubSpriteData2
	ldr r0, [r1]
	ldr r2, _0805B3E4 @ =0x083A9B9C
	cmp r0, r2
	beq _0805B3BA
	str r2, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
_0805B3BA:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x46
	bls _0805B3C6
	b _0805B542
_0805B3C6:
	lsls r0, r0, #2
	ldr r1, _0805B3E8 @ =_0805B3EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B3D0: .4byte 0x0000FFBF
_0805B3D4: .4byte 0x083AF4B8
_0805B3D8: .4byte gSubSpriteData1
_0805B3DC: .4byte 0x083A9A14
_0805B3E0: .4byte gSubSpriteData2
_0805B3E4: .4byte 0x083A9B9C
_0805B3E8: .4byte _0805B3EC
_0805B3EC: @ jump table
	.4byte _0805B508 @ case 0
	.4byte _0805B542 @ case 1
	.4byte _0805B50E @ case 2
	.4byte _0805B542 @ case 3
	.4byte _0805B542 @ case 4
	.4byte _0805B542 @ case 5
	.4byte _0805B542 @ case 6
	.4byte _0805B542 @ case 7
	.4byte _0805B542 @ case 8
	.4byte _0805B542 @ case 9
	.4byte _0805B542 @ case 10
	.4byte _0805B542 @ case 11
	.4byte _0805B542 @ case 12
	.4byte _0805B542 @ case 13
	.4byte _0805B542 @ case 14
	.4byte _0805B542 @ case 15
	.4byte _0805B542 @ case 16
	.4byte _0805B542 @ case 17
	.4byte _0805B542 @ case 18
	.4byte _0805B542 @ case 19
	.4byte _0805B542 @ case 20
	.4byte _0805B542 @ case 21
	.4byte _0805B542 @ case 22
	.4byte _0805B542 @ case 23
	.4byte _0805B542 @ case 24
	.4byte _0805B542 @ case 25
	.4byte _0805B542 @ case 26
	.4byte _0805B542 @ case 27
	.4byte _0805B542 @ case 28
	.4byte _0805B542 @ case 29
	.4byte _0805B542 @ case 30
	.4byte _0805B542 @ case 31
	.4byte _0805B542 @ case 32
	.4byte _0805B542 @ case 33
	.4byte _0805B542 @ case 34
	.4byte _0805B542 @ case 35
	.4byte _0805B542 @ case 36
	.4byte _0805B542 @ case 37
	.4byte _0805B542 @ case 38
	.4byte _0805B542 @ case 39
	.4byte _0805B542 @ case 40
	.4byte _0805B542 @ case 41
	.4byte _0805B542 @ case 42
	.4byte _0805B542 @ case 43
	.4byte _0805B542 @ case 44
	.4byte _0805B542 @ case 45
	.4byte _0805B542 @ case 46
	.4byte _0805B542 @ case 47
	.4byte _0805B542 @ case 48
	.4byte _0805B542 @ case 49
	.4byte _0805B542 @ case 50
	.4byte _0805B542 @ case 51
	.4byte _0805B542 @ case 52
	.4byte _0805B542 @ case 53
	.4byte _0805B542 @ case 54
	.4byte _0805B542 @ case 55
	.4byte _0805B514 @ case 56
	.4byte _0805B542 @ case 57
	.4byte _0805B51A @ case 58
	.4byte _0805B542 @ case 59
	.4byte _0805B520 @ case 60
	.4byte _0805B542 @ case 61
	.4byte _0805B526 @ case 62
	.4byte _0805B542 @ case 63
	.4byte _0805B52C @ case 64
	.4byte _0805B542 @ case 65
	.4byte _0805B532 @ case 66
	.4byte _0805B542 @ case 67
	.4byte _0805B538 @ case 68
	.4byte _0805B542 @ case 69
	.4byte _0805B53E @ case 70
_0805B508:
	bl RidleyTailPartInit
	b _0805B542
_0805B50E:
	bl RidleyTailPartIdle
	b _0805B542
_0805B514:
	bl RidleyTailPartWaitingTOWindUp
	b _0805B542
_0805B51A:
	bl RidleyTailPartWindingUp1
	b _0805B542
_0805B520:
	bl RidleyTailPartWindingUp2
	b _0805B542
_0805B526:
	bl RidleyTailPartStrikingDown1
	b _0805B542
_0805B52C:
	bl RidleyTailPartStrikingDown2
	b _0805B542
_0805B532:
	bl RidleyTailPartStrikingDown3
	b _0805B542
_0805B538:
	bl RidleyTailPartStrikingForward
	b _0805B542
_0805B53E:
	bl RidleyTailPartDoneStriking
_0805B542:
	bl UpdateSubSpriteData2Animation
	bl RidleySyncSubSpritesPosition
_0805B54A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start RidleyFire
RidleyFire: @ 0x0805B550
	push {lr}
	ldr r0, _0805B568 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0805B57C
	cmp r0, #2
	bgt _0805B56C
	cmp r0, #0
	beq _0805B576
	b _0805B58C
	.align 2, 0
_0805B568: .4byte gCurrentSprite
_0805B56C:
	cmp r0, #0x18
	beq _0805B582
	cmp r0, #0x37
	beq _0805B588
	b _0805B58C
_0805B576:
	bl RidleyFireInit
	b _0805B58C
_0805B57C:
	bl RidleyFireMoving
	b _0805B58C
_0805B582:
	bl RidleyFireMovingTowardsSamus
	b _0805B58C
_0805B588:
	bl RidleyFireExploding
_0805B58C:
	pop {r0}
	bx r0

	thumb_func_start RidleyPreSpawnInit
RidleyPreSpawnInit: @ 0x0805B590
	push {r4, r5, lr}
	ldr r0, _0805B5AC @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r5, #8
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0805B5B4
	ldr r1, _0805B5B0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0805B5FC
	.align 2, 0
_0805B5AC: .4byte gEquipment
_0805B5B0: .4byte gCurrentSprite
_0805B5B4:
	ldr r3, _0805B604 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r0, #0x40
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x58
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r5, [r0]
	adds r1, #2
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _0805B608 @ =0x0000FEE0
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r0, #0xc0
	strh r0, [r3, #0xe]
	movs r0, #0x60
	strh r0, [r3, #0x10]
	ldr r0, _0805B60C @ =0x083B0A9C
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	subs r1, #5
	movs r0, #1
	strb r0, [r1]
_0805B5FC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805B604: .4byte gCurrentSprite
_0805B608: .4byte 0x0000FEE0
_0805B60C: .4byte 0x083B0A9C

	thumb_func_start RidleyPreSpawnWaitingForSamus
RidleyPreSpawnWaitingForSamus: @ 0x0805B610
	push {lr}
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #8
	bne _0805B642
	ldr r0, _0805B648 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #2
	strb r1, [r2]
	ldr r1, _0805B64C @ =0x083B0AAC
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0xa0
	strb r1, [r0]
	movs r0, #0xee
	lsls r0, r0, #1
	bl SoundPlay
_0805B642:
	pop {r0}
	bx r0
	.align 2, 0
_0805B648: .4byte gCurrentSprite
_0805B64C: .4byte 0x083B0AAC

	thumb_func_start RidleyPreSpawnOpeningEye
RidleyPreSpawnOpeningEye: @ 0x0805B650
	push {lr}
	ldr r3, _0805B67C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805B676
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	ldr r0, _0805B680 @ =0x083B0AE4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
_0805B676:
	pop {r0}
	bx r0
	.align 2, 0
_0805B67C: .4byte gCurrentSprite
_0805B680: .4byte 0x083B0AE4

	thumb_func_start RidleyPreSpawnClosingEye
RidleyPreSpawnClosingEye: @ 0x0805B684
	push {lr}
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805B6A8
	ldr r0, _0805B6AC @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x1a
	strb r1, [r2]
	ldr r1, _0805B6B0 @ =0x083B0A9C
	str r1, [r0, #0x18]
	strb r3, [r0, #0x1c]
	strh r3, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x3c
	strb r1, [r0]
_0805B6A8:
	pop {r0}
	bx r0
	.align 2, 0
_0805B6AC: .4byte gCurrentSprite
_0805B6B0: .4byte 0x083B0A9C

	thumb_func_start RidleyPreSpawnEyeClosed
RidleyPreSpawnEyeClosed: @ 0x0805B6B4
	push {lr}
	ldr r2, _0805B6E8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805B6E2
	subs r1, #0xa
	movs r0, #0x1c
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x2c
	strh r0, [r2, #6]
	movs r0, #0x42
	movs r1, #7
	bl PlayMusic
_0805B6E2:
	pop {r0}
	bx r0
	.align 2, 0
_0805B6E8: .4byte gCurrentSprite

	thumb_func_start RidleyPreSpawnTurningIntoRidley
RidleyPreSpawnTurningIntoRidley: @ 0x0805B6EC
	push {r4, lr}
	ldr r2, _0805B734 @ =gWrittenToMosaic_H
	ldr r1, _0805B738 @ =sXParasiteMosaicValues
	ldr r4, _0805B73C @ =gCurrentSprite
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bhi _0805B744
	ldrh r2, [r4, #6]
	movs r0, #0xcb
	movs r1, #0
	bl SpriteLoadGfx
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0805B752
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	movs r0, #0xcb
	strb r0, [r4, #0x1d]
	ldrh r0, [r4]
	ldr r2, _0805B740 @ =0x00008004
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	b _0805B752
	.align 2, 0
_0805B734: .4byte gWrittenToMosaic_H
_0805B738: .4byte sXParasiteMosaicValues
_0805B73C: .4byte gCurrentSprite
_0805B740: .4byte 0x00008004
_0805B744:
	cmp r0, #0x20
	bne _0805B752
	movs r0, #0xcb
	movs r1, #0
	movs r2, #8
	bl SpriteLoadPal
_0805B752:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RidleyPreSpawn
RidleyPreSpawn: @ 0x0805B758
	push {lr}
	ldr r0, _0805B770 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _0805B80E
	lsls r0, r0, #2
	ldr r1, _0805B774 @ =_0805B778
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B770: .4byte gCurrentSprite
_0805B774: .4byte _0805B778
_0805B778: @ jump table
	.4byte _0805B7EC @ case 0
	.4byte _0805B7F2 @ case 1
	.4byte _0805B7F8 @ case 2
	.4byte _0805B80E @ case 3
	.4byte _0805B80E @ case 4
	.4byte _0805B80E @ case 5
	.4byte _0805B80E @ case 6
	.4byte _0805B80E @ case 7
	.4byte _0805B80E @ case 8
	.4byte _0805B80E @ case 9
	.4byte _0805B80E @ case 10
	.4byte _0805B80E @ case 11
	.4byte _0805B80E @ case 12
	.4byte _0805B80E @ case 13
	.4byte _0805B80E @ case 14
	.4byte _0805B80E @ case 15
	.4byte _0805B80E @ case 16
	.4byte _0805B80E @ case 17
	.4byte _0805B80E @ case 18
	.4byte _0805B80E @ case 19
	.4byte _0805B80E @ case 20
	.4byte _0805B80E @ case 21
	.4byte _0805B80E @ case 22
	.4byte _0805B80E @ case 23
	.4byte _0805B7FE @ case 24
	.4byte _0805B80E @ case 25
	.4byte _0805B804 @ case 26
	.4byte _0805B80E @ case 27
	.4byte _0805B80A @ case 28
_0805B7EC:
	bl RidleyPreSpawnInit
	b _0805B80E
_0805B7F2:
	bl RidleyPreSpawnWaitingForSamus
	b _0805B80E
_0805B7F8:
	bl RidleyPreSpawnOpeningEye
	b _0805B80E
_0805B7FE:
	bl RidleyPreSpawnClosingEye
	b _0805B80E
_0805B804:
	bl RidleyPreSpawnEyeClosed
	b _0805B80E
_0805B80A:
	bl RidleyPreSpawnTurningIntoRidley
_0805B80E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaSyncSubSprites
YakuzaSyncSubSprites: @ 0x0805B814
	push {r4, lr}
	ldr r4, _0805B870 @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _0805B874 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _0805B878 @ =0x0879B784
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805B846
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805B846:
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
_0805B870: .4byte gSubSpriteData1
_0805B874: .4byte gCurrentSprite
_0805B878: .4byte 0x0879B784

	thumb_func_start YakuzaUpdatePalette
YakuzaUpdatePalette: @ 0x0805B87C
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805B8A0 @ =gCurrentSprite
	ldrh r5, [r0, #0x14]
	ldr r2, _0805B8A4 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	ldr r4, _0805B8A8 @ =gBossWork1
	ldrb r1, [r4]
	cmp r1, #0
	beq _0805B8AC
	cmp r1, #1
	beq _0805B8C4
	b _0805B8D2
	.align 2, 0
_0805B8A0: .4byte gCurrentSprite
_0805B8A4: .4byte sPrimarySpriteStats
_0805B8A8: .4byte gBossWork1
_0805B8AC:
	lsls r0, r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bgt _0805B8D2
	ldr r7, _0805B8C0 @ =0x083B5210
	movs r0, #1
	strb r0, [r4]
	b _0805B8D6
	.align 2, 0
_0805B8C0: .4byte 0x083B5210
_0805B8C4:
	lsrs r0, r0, #2
	cmp r5, r0
	bhi _0805B8D2
	ldr r7, _0805B8EC @ =0x083B5230
	movs r0, #2
	strb r0, [r4]
	movs r6, #1
_0805B8D2:
	cmp r6, #0
	beq _0805B8E4
_0805B8D6:
	ldr r1, _0805B8F0 @ =0x040000D4
	str r7, [r1]
	ldr r0, _0805B8F4 @ =0x05000300
	str r0, [r1, #4]
	ldr r0, _0805B8F8 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0805B8E4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805B8EC: .4byte 0x083B5230
_0805B8F0: .4byte 0x040000D4
_0805B8F4: .4byte 0x05000300
_0805B8F8: .4byte 0x80000010

	thumb_func_start YakuzaUpdateGrabbedSamus
YakuzaUpdateGrabbedSamus: @ 0x0805B8FC
	push {lr}
	ldr r2, _0805B90C @ =gSamusData
	ldrb r0, [r2, #1]
	cmp r0, #0x40
	beq _0805B910
	movs r0, #0
	b _0805B922
	.align 2, 0
_0805B90C: .4byte gSamusData
_0805B910:
	ldr r0, _0805B928 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	adds r1, #0xc0
	strh r1, [r2, #0x18]
	ldrh r0, [r0, #0xa]
	strh r0, [r2, #0x16]
	bl TakeConstantDamageFromYakuza
	movs r0, #1
_0805B922:
	pop {r1}
	bx r1
	.align 2, 0
_0805B928: .4byte gSubSpriteData1

	thumb_func_start YakuzaCheckCollidingWithRightWall
YakuzaCheckCollidingWithRightWall: @ 0x0805B92C
	push {lr}
	ldr r0, _0805B948 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _0805B94C @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0xd7
	bhi _0805B950
	movs r0, #0
	b _0805B952
	.align 2, 0
_0805B948: .4byte gSubSpriteData1
_0805B94C: .4byte gBg1XPosition
_0805B950:
	movs r0, #1
_0805B952:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithLeftWall
YakuzaCheckCollidingWithLeftWall: @ 0x0805B958
	push {lr}
	ldr r0, _0805B974 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	lsrs r1, r1, #2
	ldr r0, _0805B978 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x18
	bls _0805B97C
	movs r0, #0
	b _0805B97E
	.align 2, 0
_0805B974: .4byte gSubSpriteData1
_0805B978: .4byte gBg1XPosition
_0805B97C:
	movs r0, #1
_0805B97E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithFloor
YakuzaCheckCollidingWithFloor: @ 0x0805B984
	push {lr}
	ldr r0, _0805B994 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B998 @ =0x0000073E
	cmp r1, r0
	bhi _0805B99C
	movs r0, #0
	b _0805B99E
	.align 2, 0
_0805B994: .4byte gSubSpriteData1
_0805B998: .4byte 0x0000073E
_0805B99C:
	movs r0, #1
_0805B99E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaCheckCollidingWithCeiling
YakuzaCheckCollidingWithCeiling: @ 0x0805B9A4
	push {lr}
	ldr r0, _0805B9B8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x40
	bne _0805B9C4
	ldr r0, _0805B9BC @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B9C0 @ =0x000003FF
	b _0805B9CA
	.align 2, 0
_0805B9B8: .4byte gSamusData
_0805B9BC: .4byte gSubSpriteData1
_0805B9C0: .4byte 0x000003FF
_0805B9C4:
	ldr r0, _0805B9D4 @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805B9D8 @ =0x000005FF
_0805B9CA:
	cmp r1, r0
	bhi _0805B9DC
	movs r0, #1
	b _0805B9DE
	.align 2, 0
_0805B9D4: .4byte gSubSpriteData1
_0805B9D8: .4byte 0x000005FF
_0805B9DC:
	movs r0, #0
_0805B9DE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start YakuzaXMovement
YakuzaXMovement: @ 0x0805B9E4
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r4, #0
	ldr r0, _0805BA10 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805BA18
	bl YakuzaCheckCollidingWithRightWall
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA2C
	ldr r1, _0805BA14 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, r4, r0
	b _0805BA2A
	.align 2, 0
_0805BA10: .4byte gCurrentSprite
_0805BA14: .4byte gSubSpriteData1
_0805BA18:
	bl YakuzaCheckCollidingWithLeftWall
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA2C
	ldr r1, _0805BA34 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, r0, r5
_0805BA2A:
	strh r0, [r1, #0xa]
_0805BA2C:
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0805BA34: .4byte gSubSpriteData1

	thumb_func_start YakuzaYMovement
YakuzaYMovement: @ 0x0805BA38
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r6, r5, #0
	ldr r4, _0805BA64 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805BA7C
	bl YakuzaCheckCollidingWithFloor
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA6C
	ldr r1, _0805BA68 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r5, r0
	b _0805BA8E
	.align 2, 0
_0805BA64: .4byte gCurrentSprite
_0805BA68: .4byte gSubSpriteData1
_0805BA6C:
	ldrh r1, [r4]
	ldr r0, _0805BA78 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r4]
	movs r2, #0
	b _0805BA90
	.align 2, 0
_0805BA78: .4byte 0x0000FBFF
_0805BA7C:
	bl YakuzaCheckCollidingWithCeiling
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805BA90
	ldr r1, _0805BA98 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	subs r0, r0, r6
_0805BA8E:
	strh r0, [r1, #8]
_0805BA90:
	adds r0, r2, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0805BA98: .4byte gSubSpriteData1

	thumb_func_start YakuzaGrabbedSamusInit
YakuzaGrabbedSamusInit: @ 0x0805BA9C
	push {lr}
	ldr r1, _0805BAD4 @ =gSubSpriteData1
	ldr r0, _0805BAD8 @ =0x083B0F98
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805BADC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x28
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #0xa
	strb r2, [r0]
	ldrh r1, [r3]
	ldr r0, _0805BAE0 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r3]
	ldr r0, _0805BAE4 @ =0x0000013F
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805BAD4: .4byte gSubSpriteData1
_0805BAD8: .4byte 0x083B0F98
_0805BADC: .4byte gCurrentSprite
_0805BAE0: .4byte 0x0000FBFF
_0805BAE4: .4byte 0x0000013F

	thumb_func_start YakuzaGrabbedSamus
YakuzaGrabbedSamus: @ 0x0805BAE8
	push {r4, r5, r6, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BB04
	ldr r0, _0805BB00 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BB54
	.align 2, 0
_0805BB00: .4byte gCurrentSprite
_0805BB04:
	ldr r6, _0805BB28 @ =gCurrentSprite
	adds r5, r6, #0
	adds r5, #0x2f
	ldrb r4, [r5]
	cmp r4, #0
	bne _0805BB34
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805BB54
	ldr r0, _0805BB2C @ =gSubSpriteData1
	ldr r1, _0805BB30 @ =0x083B1178
	str r1, [r0]
	strb r4, [r0, #6]
	strh r4, [r0, #4]
	ldrb r0, [r5]
	adds r0, #1
	b _0805BB52
	.align 2, 0
_0805BB28: .4byte gCurrentSprite
_0805BB2C: .4byte gSubSpriteData1
_0805BB30: .4byte 0x083B1178
_0805BB34:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805BB54
	adds r1, r6, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r1]
	ldr r1, _0805BB5C @ =gSubSpriteData1
	ldr r0, _0805BB60 @ =0x083B1188
	str r0, [r1]
	strb r2, [r1, #6]
	movs r0, #0
	strh r2, [r1, #4]
_0805BB52:
	strb r0, [r5]
_0805BB54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BB5C: .4byte gSubSpriteData1
_0805BB60: .4byte 0x083B1188

	thumb_func_start YakuzaPullingSamus
YakuzaPullingSamus: @ 0x0805BB64
	push {r4, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BB80
	ldr r0, _0805BB7C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BC00
	.align 2, 0
_0805BB7C: .4byte gCurrentSprite
_0805BB80:
	ldr r4, _0805BBC4 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805BBD0
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	bne _0805BBA0
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	bne _0805BBA0
	movs r0, #0x9b
	lsls r0, r0, #1
	bl SoundPlay
_0805BBA0:
	movs r0, #4
	bl YakuzaYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805BC00
	ldr r1, _0805BBC8 @ =gSubSpriteData1
	ldr r0, _0805BBCC @ =0x083B11B0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805BBC4 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0805BC00
	.align 2, 0
_0805BBC4: .4byte gCurrentSprite
_0805BBC8: .4byte gSubSpriteData1
_0805BBCC: .4byte 0x083B11B0
_0805BBD0:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805BC00
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2c
	strb r0, [r1]
	ldr r0, _0805BC08 @ =gSubSpriteData1
	ldr r1, _0805BC0C @ =0x083B11C0
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0805BC00:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805BC08: .4byte gSubSpriteData1
_0805BC0C: .4byte 0x083B11C0

	thumb_func_start YakuzaHoldingSamusHigh
YakuzaHoldingSamusHigh: @ 0x0805BC10
	push {lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BC2C
	ldr r0, _0805BC28 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	b _0805BC4C
	.align 2, 0
_0805BC28: .4byte gCurrentSprite
_0805BC2C:
	ldr r2, _0805BC50 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805BC4C
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x2e
	strb r1, [r0]
	adds r0, #0xd
	strb r3, [r0]
_0805BC4C:
	pop {r0}
	bx r0
	.align 2, 0
_0805BC50: .4byte gCurrentSprite

	thumb_func_start YakuzaSlammingSamus
YakuzaSlammingSamus: @ 0x0805BC54
	push {r4, r5, r6, r7, lr}
	bl YakuzaUpdateGrabbedSamus
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, _0805BC8C @ =gCurrentSprite
	adds r5, r0, #0
	adds r5, #0x31
	ldrb r2, [r5]
	ldr r3, _0805BC90 @ =0x083B0B3E
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805BC94 @ =0x00007FFF
	cmp r1, r0
	bne _0805BC9C
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldr r2, _0805BC98 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldrh r0, [r0]
	adds r1, r1, r0
	strh r1, [r2, #8]
	b _0805BCA8
	.align 2, 0
_0805BC8C: .4byte gCurrentSprite
_0805BC90: .4byte 0x083B0B3E
_0805BC94: .4byte 0x00007FFF
_0805BC98: .4byte gSubSpriteData1
_0805BC9C:
	adds r0, r2, #1
	strb r0, [r5]
	ldr r1, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, r0, r4
	strh r0, [r1, #8]
_0805BCA8:
	cmp r6, #0
	beq _0805BCC4
	ldr r1, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, #0xc0
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805BD1C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805BCC4
	bl TakeDamageFromYakuzaSlamming
_0805BCC4:
	ldr r5, _0805BD18 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	adds r0, #0x48
	ldrh r1, [r5, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r4, r0, #0
	ldr r0, _0805BD20 @ =gPreviousVerticalCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0805BD12
	adds r0, r4, #0
	subs r0, #0x48
	strh r0, [r5, #8]
	ldr r0, _0805BD24 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2f
	strb r1, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldrh r1, [r5, #0xa]
	adds r0, r4, #0
	movs r2, #0x3c
	bl ParticleSet
	adds r0, r4, #0
	adds r0, #0x3c
	ldrh r1, [r5, #0xa]
	movs r2, #0x3c
	bl ParticleSet
	movs r0, #0x9d
	lsls r0, r0, #1
	bl SoundPlay
_0805BD12:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BD18: .4byte gSubSpriteData1
_0805BD1C: .4byte gPreviousCollisionCheck
_0805BD20: .4byte gPreviousVerticalCollisionCheck
_0805BD24: .4byte gCurrentSprite

	thumb_func_start YakuzaReleasingSamusInit
YakuzaReleasingSamusInit: @ 0x0805BD28
	ldr r1, _0805BD40 @ =gSubSpriteData1
	ldr r0, _0805BD44 @ =0x083B0FC0
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BD48 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x30
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BD40: .4byte gSubSpriteData1
_0805BD44: .4byte 0x083B0FC0
_0805BD48: .4byte gCurrentSprite

	thumb_func_start YakuzaReleasingSamus
YakuzaReleasingSamus: @ 0x0805BD4C
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805BD5E
	ldr r0, _0805BD64 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #9
	strb r1, [r0]
_0805BD5E:
	pop {r0}
	bx r0
	.align 2, 0
_0805BD64: .4byte gCurrentSprite

	thumb_func_start YakuzaAfterReleasingSamusInit
YakuzaAfterReleasingSamusInit: @ 0x0805BD68
	ldr r1, _0805BD80 @ =gSubSpriteData1
	ldr r0, _0805BD84 @ =0x083B0F28
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BD88 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0xa
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BD80: .4byte gSubSpriteData1
_0805BD84: .4byte 0x083B0F28
_0805BD88: .4byte gCurrentSprite

	thumb_func_start YakuzaAfterReleasingSamus
YakuzaAfterReleasingSamus: @ 0x0805BD8C
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805BDAA
	ldr r0, _0805BDB0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x25
	movs r1, #0x1c
	strb r1, [r2]
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
	bl SpriteUtilMakeSpriteFaceSamusDirection
_0805BDAA:
	pop {r0}
	bx r0
	.align 2, 0
_0805BDB0: .4byte gCurrentSprite

	thumb_func_start YakuzaInit
YakuzaInit: @ 0x0805BDB4
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _0805BDD0 @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _0805BDD8
	ldr r1, _0805BDD4 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0805BEA0
	.align 2, 0
_0805BDD0: .4byte gEquipment
_0805BDD4: .4byte gCurrentSprite
_0805BDD8:
	ldr r0, _0805BEA8 @ =gBossWork1
	strb r6, [r0]
	ldr r0, _0805BEAC @ =gCurrentSprite
	mov ip, r0
	ldr r1, _0805BEB0 @ =0xFFFFFE00
	adds r0, r1, #0
	mov r2, ip
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	movs r5, #0
	mov r1, ip
	strh r0, [r1, #2]
	ldr r4, _0805BEB4 @ =gSubSpriteData1
	strh r0, [r4, #8]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0xa]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x24
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _0805BEB8 @ =0x0000FFC0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x60
	strh r0, [r2, #0xc]
	ldr r0, _0805BEBC @ =0x0000FFB8
	strh r0, [r2, #0xe]
	movs r0, #0x48
	strh r0, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	movs r3, #1
	mov r0, ip
	strb r3, [r0, #0x1e]
	ldr r2, _0805BEC0 @ =sPrimarySpriteStats
	ldrb r1, [r0, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov r1, ip
	strh r0, [r1, #0x14]
	strh r3, [r4, #0xc]
	ldr r0, _0805BEC4 @ =0x083B0F28
	str r0, [r4]
	strb r5, [r4, #6]
	strh r6, [r4, #4]
	adds r1, #0x25
	movs r0, #0x1c
	strb r0, [r1]
	mov r2, ip
	ldrh r0, [r2]
	movs r2, #0x90
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x2d
	strb r5, [r0]
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x23
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x64
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r5]
	ldrh r0, [r4, #8]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x64
	movs r1, #2
	movs r2, #0
	bl SpriteSpawnSecondary
_0805BEA0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805BEA8: .4byte gBossWork1
_0805BEAC: .4byte gCurrentSprite
_0805BEB0: .4byte 0xFFFFFE00
_0805BEB4: .4byte gSubSpriteData1
_0805BEB8: .4byte 0x0000FFC0
_0805BEBC: .4byte 0x0000FFB8
_0805BEC0: .4byte sPrimarySpriteStats
_0805BEC4: .4byte 0x083B0F28

	thumb_func_start YakuzaWaitingToAppear
YakuzaWaitingToAppear: @ 0x0805BEC8
	push {lr}
	ldr r0, _0805BEE8 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _0805BEEC @ =0x000006FF
	cmp r1, r0
	bls _0805BEE4
	ldr r1, _0805BEF0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x38
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
_0805BEE4:
	pop {r0}
	bx r0
	.align 2, 0
_0805BEE8: .4byte gSamusData
_0805BEEC: .4byte 0x000006FF
_0805BEF0: .4byte gCurrentSprite

	thumb_func_start YakuzaAboutToAppear
YakuzaAboutToAppear: @ 0x0805BEF4
	push {lr}
	ldr r2, _0805BF38 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805BF32
	subs r1, #0xa
	movs r0, #7
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0805BF3C @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r1, _0805BF40 @ =gBossWork2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805BF44 @ =0x0000012F
	bl unk_3b1c
_0805BF32:
	pop {r0}
	bx r0
	.align 2, 0
_0805BF38: .4byte gCurrentSprite
_0805BF3C: .4byte 0x0000DFFF
_0805BF40: .4byte gBossWork2
_0805BF44: .4byte 0x0000012F

	thumb_func_start YakuzaIdleBeforeNewRoundInit
YakuzaIdleBeforeNewRoundInit: @ 0x0805BF48
	ldr r1, _0805BF68 @ =gSubSpriteData1
	ldr r0, _0805BF6C @ =0x083B0F28
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805BF70 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	adds r1, #0x25
	movs r0, #0x1c
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805BF68: .4byte gSubSpriteData1
_0805BF6C: .4byte 0x083B0F28
_0805BF70: .4byte gCurrentSprite

	thumb_func_start YakuzaIdleBeforeNewRound
YakuzaIdleBeforeNewRound: @ 0x0805BF74
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805BFA6
	ldr r1, _0805BF9C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _0805BFA0
	subs r0, #1
	strb r0, [r2]
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilMakeSpriteFaceSamusDirection
	b _0805BFA6
	.align 2, 0
_0805BF9C: .4byte gCurrentSprite
_0805BFA0:
	adds r1, #0x24
	movs r0, #0x31
	strb r0, [r1]
_0805BFA6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaBeginSweepInit
YakuzaBeginSweepInit: @ 0x0805BFAC
	ldr r1, _0805BFC4 @ =gSubSpriteData1
	ldr r0, _0805BFC8 @ =0x083B0F50
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BFCC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805BFC4: .4byte gSubSpriteData1
_0805BFC8: .4byte 0x083B0F50
_0805BFCC: .4byte gCurrentSprite

	thumb_func_start YakuzaBeginSweep
YakuzaBeginSweep: @ 0x0805BFD0
	push {lr}
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805BFEE
	ldr r1, _0805BFF4 @ =gSubSpriteData1
	ldr r0, _0805BFF8 @ =0x083B0F60
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r0, _0805BFFC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
_0805BFEE:
	pop {r0}
	bx r0
	.align 2, 0
_0805BFF4: .4byte gSubSpriteData1
_0805BFF8: .4byte 0x083B0F60
_0805BFFC: .4byte gCurrentSprite

	thumb_func_start YakuzaSweeping
YakuzaSweeping: @ 0x0805C000
	push {r4, lr}
	ldr r1, _0805C050 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0
	bne _0805C018
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0805C018
	movs r0, #0x9b
	lsls r0, r0, #1
	bl SoundPlay
_0805C018:
	movs r0, #3
	bl YakuzaYMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C05C
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805C076
	ldr r2, _0805C050 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	movs r3, #0
	movs r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0805C054 @ =gSubSpriteData1
	ldr r1, _0805C058 @ =0x083B0F88
	str r1, [r0]
	strb r3, [r0, #6]
	strh r4, [r0, #4]
	adds r2, #0x24
	movs r0, #0x1a
	strb r0, [r2]
	b _0805C076
	.align 2, 0
_0805C050: .4byte gCurrentSprite
_0805C054: .4byte gSubSpriteData1
_0805C058: .4byte 0x083B0F88
_0805C05C:
	movs r0, #8
	bl YakuzaXMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805C076
	ldr r0, _0805C07C @ =gCurrentSprite
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	eors r1, r2
	strh r1, [r0]
_0805C076:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805C07C: .4byte gCurrentSprite

	thumb_func_start YakuzaSweepingEnd
YakuzaSweepingEnd: @ 0x0805C080
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805C092
	ldr r0, _0805C098 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #7
	strb r1, [r0]
_0805C092:
	pop {r0}
	bx r0
	.align 2, 0
_0805C098: .4byte gCurrentSprite

	thumb_func_start YakuzaOpeningMouthInit
YakuzaOpeningMouthInit: @ 0x0805C09C
	push {lr}
	ldr r1, _0805C0E8 @ =gSubSpriteData1
	ldr r0, _0805C0EC @ =0x083B0FE8
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805C0F0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x32
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x40
	strh r0, [r3, #0xc]
	ldr r0, _0805C0F4 @ =0x0000FFDC
	strh r0, [r3, #0xe]
	movs r0, #0x24
	strh r0, [r3, #0x10]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2]
	ldr r0, _0805C0F8 @ =0x00000137
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_0805C0E8: .4byte gSubSpriteData1
_0805C0EC: .4byte 0x083B0FE8
_0805C0F0: .4byte gCurrentSprite
_0805C0F4: .4byte 0x0000FFDC
_0805C0F8: .4byte 0x00000137

	thumb_func_start YakuzaOpeningMouth
YakuzaOpeningMouth: @ 0x0805C0FC
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, _0805C11C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #6
	bls _0805C110
	b _0805C468
_0805C110:
	lsls r0, r0, #2
	ldr r1, _0805C120 @ =_0805C124
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805C11C: .4byte gCurrentSprite
_0805C120: .4byte _0805C124
_0805C124: @ jump table
	.4byte _0805C140 @ case 0
	.4byte _0805C178 @ case 1
	.4byte _0805C1E8 @ case 2
	.4byte _0805C270 @ case 3
	.4byte _0805C338 @ case 4
	.4byte _0805C3A8 @ case 5
	.4byte _0805C420 @ case 6
_0805C140:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	bne _0805C14A
	b _0805C468
_0805C14A:
	ldr r1, _0805C16C @ =gSubSpriteData1
	ldr r0, _0805C170 @ =0x083B1040
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C174 @ =gCurrentSprite
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0x9c
	lsls r0, r0, #1
	bl SoundPlay
	b _0805C468
	.align 2, 0
_0805C16C: .4byte gSubSpriteData1
_0805C170: .4byte 0x083B1040
_0805C174: .4byte gCurrentSprite
_0805C178:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	bne _0805C182
	b _0805C468
_0805C182:
	ldr r1, _0805C1C8 @ =gSubSpriteData1
	ldr r0, _0805C1CC @ =0x083B1050
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r4, _0805C1D0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C1D4 @ =0x083B0B6E
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C1D8 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C1DC @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C1E0 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C1E4 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #0
	adds r0, #0x30
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #3
	b _0805C466
	.align 2, 0
_0805C1C8: .4byte gSubSpriteData1
_0805C1CC: .4byte 0x083B1050
_0805C1D0: .4byte gCurrentSprite
_0805C1D4: .4byte 0x083B0B6E
_0805C1D8: .4byte 0x040000D4
_0805C1DC: .4byte 0x083B52D0
_0805C1E0: .4byte 0x05000320
_0805C1E4: .4byte 0x80000010
_0805C1E8:
	adds r6, r4, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _0805C1FC
	b _0805C468
_0805C1FC:
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	cmp r0, #0x10
	bhi _0805C218
	adds r0, #1
	strb r0, [r5]
	movs r0, #3
	strb r0, [r6]
	ldr r1, _0805C214 @ =0x083B0B6E
	ldrb r0, [r5]
	b _0805C3D2
	.align 2, 0
_0805C214: .4byte 0x083B0B6E
_0805C218:
	ldr r1, _0805C254 @ =gSubSpriteData1
	ldr r0, _0805C258 @ =0x083B1060
	str r0, [r1]
	strb r2, [r1, #6]
	movs r3, #0
	strh r2, [r1, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C25C @ =0x083B0B80
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C260 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C264 @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C268 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C26C @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	strb r3, [r5]
	movs r0, #4
	strb r0, [r6]
	b _0805C468
	.align 2, 0
_0805C254: .4byte gSubSpriteData1
_0805C258: .4byte 0x083B1060
_0805C25C: .4byte 0x083B0B80
_0805C260: .4byte 0x040000D4
_0805C264: .4byte 0x083B52D0
_0805C268: .4byte 0x05000320
_0805C26C: .4byte 0x80000010
_0805C270:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _0805C284
	b _0805C468
_0805C284:
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r0, [r2]
	cmp r0, #0xa
	bhi _0805C2A0
	adds r0, #1
	strb r0, [r2]
	movs r0, #4
	strb r0, [r1]
	ldr r1, _0805C29C @ =0x083B0B80
	ldrb r0, [r2]
	b _0805C3D2
	.align 2, 0
_0805C29C: .4byte 0x083B0B80
_0805C2A0:
	ldr r0, _0805C320 @ =gSubSpriteData1
	ldr r1, _0805C324 @ =0x083B1078
	str r1, [r0]
	strb r5, [r0, #6]
	strh r5, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x94
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7e
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x9c
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7e
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	adds r0, #0x9c
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0x7e
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnSecondary
	ldr r1, _0805C328 @ =gBossWork2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805C32C
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x3f
	movs r1, #7
	bl PlayMusic
	movs r0, #0x98
	lsls r0, r0, #1
	bl unk_3b1c
	b _0805C468
	.align 2, 0
_0805C320: .4byte gSubSpriteData1
_0805C324: .4byte 0x083B1078
_0805C328: .4byte gBossWork2
_0805C32C:
	ldr r0, _0805C334 @ =0x00000139
	bl SoundPlay
	b _0805C468
	.align 2, 0
_0805C334: .4byte 0x00000139
_0805C338:
	bl CheckEndOfSubSpriteData1Animation
	cmp r0, #0
	bne _0805C342
	b _0805C468
_0805C342:
	ldr r1, _0805C388 @ =gSubSpriteData1
	ldr r0, _0805C38C @ =0x083B1050
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r3, #0
	strh r0, [r1, #4]
	ldr r4, _0805C390 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _0805C394 @ =0x083B0B8C
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C398 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C39C @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C3A0 @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C3A4 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	adds r0, r4, #0
	adds r0, #0x30
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #2
	b _0805C466
	.align 2, 0
_0805C388: .4byte gSubSpriteData1
_0805C38C: .4byte 0x083B1050
_0805C390: .4byte gCurrentSprite
_0805C394: .4byte 0x083B0B8C
_0805C398: .4byte 0x040000D4
_0805C39C: .4byte 0x083B52D0
_0805C3A0: .4byte 0x05000320
_0805C3A4: .4byte 0x80000010
_0805C3A8:
	adds r1, r4, #0
	adds r5, r1, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805C468
	adds r3, r1, #0
	adds r3, #0x30
	ldrb r0, [r3]
	cmp r0, #5
	bhi _0805C404
	adds r0, #1
	strb r0, [r3]
	movs r0, #2
	strb r0, [r5]
	ldr r1, _0805C3F0 @ =0x083B0B8C
	ldrb r0, [r3]
_0805C3D2:
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #8
	lsls r0, r0, #0x18
	ldr r2, _0805C3F4 @ =0x040000D4
	lsrs r0, r0, #0x13
	ldr r1, _0805C3F8 @ =0x083B52D0
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0805C3FC @ =0x05000320
	str r0, [r2, #4]
	ldr r0, _0805C400 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0805C468
	.align 2, 0
_0805C3F0: .4byte 0x083B0B8C
_0805C3F4: .4byte 0x040000D4
_0805C3F8: .4byte 0x083B52D0
_0805C3FC: .4byte 0x05000320
_0805C400: .4byte 0x80000010
_0805C404:
	ldr r0, _0805C418 @ =gSubSpriteData1
	ldr r1, _0805C41C @ =0x083B10A0
	str r1, [r0]
	strb r2, [r0, #6]
	strh r2, [r0, #4]
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	adds r0, #1
	b _0805C466
	.align 2, 0
_0805C418: .4byte gSubSpriteData1
_0805C41C: .4byte 0x083B10A0
_0805C420:
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805C468
	ldr r2, _0805C458 @ =sPrimarySpriteStats
	ldr r3, _0805C45C @ =gCurrentSprite
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsrs r1, r0, #1
	ldrh r0, [r3, #0x14]
	cmp r0, r1
	bhs _0805C460
	strh r1, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1f
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	b _0805C468
	.align 2, 0
_0805C458: .4byte sPrimarySpriteStats
_0805C45C: .4byte gCurrentSprite
_0805C460:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1b
_0805C466:
	strb r0, [r1]
_0805C468:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start YakuzaMouthOpenedInit
YakuzaMouthOpenedInit: @ 0x0805C470
	ldr r1, _0805C490 @ =gSubSpriteData1
	ldr r0, _0805C494 @ =0x083B1000
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C498 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x14
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805C490: .4byte gSubSpriteData1
_0805C494: .4byte 0x083B1000
_0805C498: .4byte gCurrentSprite

	thumb_func_start YakuzaMouthOpened
YakuzaMouthOpened: @ 0x0805C49C
	push {lr}
	ldr r1, _0805C4BC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C4B6
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
_0805C4B6:
	pop {r0}
	bx r0
	.align 2, 0
_0805C4BC: .4byte gCurrentSprite

	thumb_func_start YakuzaClosingMouthInit
YakuzaClosingMouthInit: @ 0x0805C4C0
	ldr r1, _0805C4F0 @ =gSubSpriteData1
	ldr r0, _0805C4F4 @ =0x083B1028
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	strh r0, [r1, #4]
	ldr r1, _0805C4F8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1e
	strb r0, [r2]
	movs r0, #0x60
	strh r0, [r1, #0xc]
	ldr r0, _0805C4FC @ =0x0000FFB8
	strh r0, [r1, #0xe]
	movs r0, #0x48
	strh r0, [r1, #0x10]
	adds r1, #0x34
	ldrb r2, [r1]
	movs r0, #0x40
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805C4F0: .4byte gSubSpriteData1
_0805C4F4: .4byte 0x083B1028
_0805C4F8: .4byte gCurrentSprite
_0805C4FC: .4byte 0x0000FFB8

	thumb_func_start YakuzaClosingMouth
YakuzaClosingMouth: @ 0x0805C500
	push {lr}
	bl SpriteUtilCheckNearEndOfSubSpriteData1Animation
	cmp r0, #0
	beq _0805C520
	ldr r1, _0805C524 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
	ldr r0, _0805C528 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsrs r0, r0, #2
	adds r0, #1
	adds r1, #0x2d
	strb r0, [r1]
_0805C520:
	pop {r0}
	bx r0
	.align 2, 0
_0805C524: .4byte gCurrentSprite
_0805C528: .4byte gSpriteRandomNumber

	thumb_func_start YakuzaPhase1DyingInit
YakuzaPhase1DyingInit: @ 0x0805C52C
	push {lr}
	ldr r3, _0805C560 @ =gSubSpriteData1
	ldr r0, _0805C564 @ =0x083B10B0
	str r0, [r3]
	movs r0, #0
	strb r0, [r3, #6]
	strh r0, [r3, #4]
	ldr r1, _0805C568 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x20
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #0xa]
	movs r2, #0x2f
	bl ParticleSet
	movs r0, #0x99
	lsls r0, r0, #1
	bl unk_3b1c
	pop {r0}
	bx r0
	.align 2, 0
_0805C560: .4byte gSubSpriteData1
_0805C564: .4byte 0x083B10B0
_0805C568: .4byte gCurrentSprite

	thumb_func_start YakuzaPhase1Dying
YakuzaPhase1Dying: @ 0x0805C56C
	push {lr}
	ldr r2, _0805C5D0 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	ldr r0, _0805C5D4 @ =0x0000063E
	cmp r1, r0
	bhi _0805C57C
	adds r0, r1, #4
	strh r0, [r2, #8]
_0805C57C:
	ldr r2, _0805C5D8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805C5AC
	movs r0, #4
	ands r1, r0
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805C5A6
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805C5A6:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_0805C5AC:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0805C5CA
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x21
	strb r1, [r0]
	subs r0, #4
	strb r3, [r0]
_0805C5CA:
	pop {r0}
	bx r0
	.align 2, 0
_0805C5D0: .4byte gSubSpriteData1
_0805C5D4: .4byte 0x0000063E
_0805C5D8: .4byte gCurrentSprite

	thumb_func_start YakuzaUpdateHitboxAndImmunity
YakuzaUpdateHitboxAndImmunity: @ 0x0805C5DC
	push {lr}
	ldr r2, _0805C600 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805C608
	ldr r1, _0805C604 @ =0x0000FF80
	strh r1, [r2, #0xa]
	movs r0, #0x80
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	b _0805C61E
	.align 2, 0
_0805C600: .4byte gCurrentSprite
_0805C604: .4byte 0x0000FF80
_0805C608:
	ldr r0, _0805C624 @ =0x0000FF80
	strh r0, [r2, #0xa]
	movs r1, #0x40
	strh r1, [r2, #0xc]
	adds r0, #0x40
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xbf
	ands r0, r1
_0805C61E:
	strb r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0805C624: .4byte 0x0000FF80

	thumb_func_start YakuzaLosingLegsInit
YakuzaLosingLegsInit: @ 0x0805C628
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r2, _0805C684 @ =gSubSpriteData1
	ldr r0, _0805C688 @ =0x083B1128
	str r0, [r2]
	movs r3, #0
	strb r3, [r2, #6]
	movs r5, #0
	strh r3, [r2, #4]
	ldr r4, _0805C68C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	adds r0, #0xe2
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x2b
	strb r5, [r0]
	ldr r0, _0805C690 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	adds r1, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	strh r3, [r2, #0xc]
	ldr r0, _0805C694 @ =gSamusData
	ldrh r0, [r0, #0x16]
	adds r3, r4, #0
	ldrh r2, [r2, #0xa]
	cmp r0, r2
	bhs _0805C69C
	ldrh r1, [r3]
	ldr r0, _0805C698 @ =0x0000FDFF
	ands r0, r1
	b _0805C6A6
	.align 2, 0
_0805C684: .4byte gSubSpriteData1
_0805C688: .4byte 0x083B1128
_0805C68C: .4byte gCurrentSprite
_0805C690: .4byte gSpriteRandomNumber
_0805C694: .4byte gSamusData
_0805C698: .4byte 0x0000FDFF
_0805C69C:
	ldrh r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
_0805C6A6:
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	mov sb, r0
	ldrh r6, [r3, #2]
	ldrh r3, [r3, #4]
	mov r8, r3
	adds r7, r6, #0
	subs r7, #0x10
	str r7, [sp]
	mov r4, r8
	subs r4, #0x40
	str r4, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #0
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	movs r0, #0x20
	rsbs r0, r0, #0
	adds r0, r0, r6
	mov sl, r0
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #1
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	subs r6, #0x40
	str r6, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #2
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	str r7, [sp]
	movs r2, #0x40
	add r8, r2
	mov r0, r8
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #3
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	mov r2, sl
	str r2, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #4
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	str r6, [sp]
	mov r2, r8
	str r2, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x7f
	movs r1, #5
	movs r2, #0
	mov r3, sb
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaLosingLegs
YakuzaLosingLegs: @ 0x0805C754
	push {lr}
	ldr r1, _0805C778 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805C76E
	adds r1, #0x24
	movs r0, #0x24
	strb r0, [r1]
_0805C76E:
	bl YakuzaUpdateHitboxAndImmunity
	pop {r0}
	bx r0
	.align 2, 0
_0805C778: .4byte gCurrentSprite

	thumb_func_start YakuzaPhase2Init
YakuzaPhase2Init: @ 0x0805C77C
	push {lr}
	ldr r3, _0805C7A4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x24
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldr r0, _0805C7A8 @ =gSamusData
	ldr r1, _0805C7AC @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bhs _0805C7B4
	ldrh r1, [r3]
	ldr r0, _0805C7B0 @ =0x0000FDFF
	ands r0, r1
	b _0805C7BE
	.align 2, 0
_0805C7A4: .4byte gCurrentSprite
_0805C7A8: .4byte gSamusData
_0805C7AC: .4byte gSubSpriteData1
_0805C7B0: .4byte 0x0000FDFF
_0805C7B4:
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	orrs r0, r1
_0805C7BE:
	strh r0, [r3]
	pop {r0}
	bx r0

	thumb_func_start YakuzaPhase2
YakuzaPhase2: @ 0x0805C7C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	movs r0, #0
	mov r8, r0
	ldr r4, _0805C81C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r6, [r0]
	subs r0, #4
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bhi _0805C85E
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	beq _0805C85E
	movs r7, #0x80
	lsls r7, r7, #2
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0805C832
	ldr r5, _0805C820 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805C824 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0805C82C
	ldrh r1, [r4]
	ldr r0, _0805C828 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	b _0805C85E
	.align 2, 0
_0805C81C: .4byte gCurrentSprite
_0805C820: .4byte gSubSpriteData1
_0805C824: .4byte gPreviousCollisionCheck
_0805C828: .4byte 0x0000FDFF
_0805C82C:
	ldrh r0, [r5, #0xa]
	adds r0, r0, r6
	b _0805C85C
_0805C832:
	ldr r5, _0805C850 @ =gSubSpriteData1
	ldrh r0, [r5, #8]
	ldrh r1, [r5, #0xa]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805C854 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0805C858
	ldrh r1, [r4]
	adds r0, r7, #0
	orrs r0, r1
	strh r0, [r4]
	b _0805C85E
	.align 2, 0
_0805C850: .4byte gSubSpriteData1
_0805C854: .4byte gPreviousCollisionCheck
_0805C858:
	ldrh r0, [r5, #0xa]
	subs r0, r0, r6
_0805C85C:
	strh r0, [r5, #0xa]
_0805C85E:
	ldr r0, _0805C8A4 @ =0x083B0B94
	ldr r1, _0805C8A8 @ =gCurrentSprite
	mov ip, r1
	mov r4, ip
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r6, [r1]
	cmp r2, #0x3e
	bhi _0805C87E
	adds r0, r3, #1
	strb r0, [r4]
_0805C87E:
	ldr r4, _0805C8AC @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, r0, r6
	movs r3, #0
	strh r0, [r4, #8]
	lsls r0, r6, #0x10
	cmp r0, #0
	bgt _0805C890
	b _0805CA6C
_0805C890:
	mov r2, ip
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0805C8B0
	adds r0, #0x20
	strb r0, [r2]
	b _0805C8F0
	.align 2, 0
_0805C8A4: .4byte 0x083B0B94
_0805C8A8: .4byte gCurrentSprite
_0805C8AC: .4byte gSubSpriteData1
_0805C8B0:
	mov r0, ip
	ldrh r2, [r0]
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _0805C8F0
	ldr r0, _0805C924 @ =0x083B1128
	str r0, [r4]
	strb r3, [r4, #6]
	strh r1, [r4, #4]
	ldr r0, _0805C928 @ =0x0000FFF7
	ands r0, r2
	mov r2, ip
	strh r0, [r2]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	adds r0, #0x94
	str r0, [sp]
	ldrh r0, [r2, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x7e
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	movs r0, #0xa0
	lsls r0, r0, #1
	bl SoundPlay
_0805C8F0:
	ldr r4, _0805C92C @ =gSubSpriteData1
	ldrh r0, [r4, #8]
	adds r0, #0x80
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0805C930 @ =gPreviousVerticalCollisionCheck
	ldrb r5, [r0]
	cmp r5, #0
	beq _0805C938
	adds r0, r1, #0
	subs r0, #0x80
	movs r1, #0
	strh r0, [r4, #8]
	ldr r2, _0805C934 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x31
	strb r1, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	b _0805CA00
	.align 2, 0
_0805C924: .4byte 0x083B1128
_0805C928: .4byte 0x0000FFF7
_0805C92C: .4byte gSubSpriteData1
_0805C930: .4byte gPreviousVerticalCollisionCheck
_0805C934: .4byte gCurrentSprite
_0805C938:
	ldr r0, _0805CA1C @ =gSamusData
	ldrh r0, [r0, #0x18]
	ldrh r3, [r4, #8]
	cmp r0, r3
	bhs _0805C952
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r0, #0x31
	strb r5, [r0]
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C952:
	ldrh r0, [r4, #8]
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CA24 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805C99A
	ldr r0, _0805CA28 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #8
	beq _0805C97E
	ldr r0, _0805CA20 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0805C99A
_0805C97E:
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x31
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C998
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C998:
	strb r5, [r2]
_0805C99A:
	ldr r1, _0805CA2C @ =gSubSpriteData1
	ldrh r0, [r1, #8]
	adds r0, #0xe0
	ldrh r1, [r1, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CA24 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805C9D4
	ldr r0, _0805CA28 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _0805C9D4
	ldr r0, _0805CA20 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x31
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0805C9D0
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0805C9D0:
	movs r0, #0
	strb r0, [r2]
_0805C9D4:
	ldr r2, _0805CA20 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _0805CA00
	ldr r0, _0805CA2C @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	ldr r0, _0805CA30 @ =0x0000057E
	cmp r1, r0
	bls _0805CA00
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
_0805CA00:
	mov r3, r8
	cmp r3, #0
	beq _0805CA50
	ldr r0, _0805CA1C @ =gSamusData
	ldr r1, _0805CA2C @ =gSubSpriteData1
	ldrh r0, [r0, #0x16]
	ldrh r1, [r1, #0xa]
	cmp r0, r1
	bhs _0805CA38
	ldrh r1, [r2]
	ldr r0, _0805CA34 @ =0x0000FDFF
	ands r0, r1
	b _0805CA42
	.align 2, 0
_0805CA1C: .4byte gSamusData
_0805CA20: .4byte gCurrentSprite
_0805CA24: .4byte gPreviousCollisionCheck
_0805CA28: .4byte gSpriteRandomNumber
_0805CA2C: .4byte gSubSpriteData1
_0805CA30: .4byte 0x0000057E
_0805CA34: .4byte 0x0000FDFF
_0805CA38:
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	orrs r0, r1
_0805CA42:
	strh r0, [r2]
	ldr r0, _0805CA64 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r2, #0
	adds r1, #0x30
	strb r0, [r1]
_0805CA50:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CAB8
	ldr r0, _0805CA68 @ =0x0000013B
	bl SoundPlay
	b _0805CAB8
	.align 2, 0
_0805CA64: .4byte gSpriteRandomNumber
_0805CA68: .4byte 0x0000013B
_0805CA6C:
	mov r1, ip
	ldrh r0, [r1]
	ldr r2, _0805CAC8 @ =0x00004008
	adds r1, r2, #0
	orrs r0, r1
	mov r3, ip
	strh r0, [r3]
	mov r1, ip
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x20
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #0x80
	ldrh r1, [r4, #0xa]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805CACC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805CA9E
	ldrh r1, [r4, #8]
	ldr r0, _0805CAD0 @ =0x0000057E
	cmp r1, r0
	bhi _0805CAA4
_0805CA9E:
	ldrh r0, [r4, #8]
	subs r0, r0, r6
	strh r0, [r4, #8]
_0805CAA4:
	ldr r0, _0805CAD4 @ =gCurrentSprite
	adds r0, #0x31
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0805CAB8
	ldr r0, _0805CAD8 @ =0x0000013B
	bl SoundPlay
_0805CAB8:
	bl YakuzaUpdateHitboxAndImmunity
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805CAC8: .4byte 0x00004008
_0805CACC: .4byte gPreviousCollisionCheck
_0805CAD0: .4byte 0x0000057E
_0805CAD4: .4byte gCurrentSprite
_0805CAD8: .4byte 0x0000013B

	thumb_func_start YakuzaPhase2DyingInit
YakuzaPhase2DyingInit: @ 0x0805CADC
	push {r4, lr}
	ldr r1, _0805CB24 @ =gSubSpriteData1
	ldr r0, _0805CB28 @ =0x083B1160
	str r0, [r1]
	movs r0, #0
	strb r0, [r1, #6]
	movs r2, #0
	strh r0, [r1, #4]
	ldr r3, _0805CB2C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x48
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0805CB30 @ =0x0000BFFF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #7
	strb r2, [r0]
	subs r0, #0xc
	strb r2, [r0]
	movs r0, #1
	strh r0, [r3, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805CB24: .4byte gSubSpriteData1
_0805CB28: .4byte 0x083B1160
_0805CB2C: .4byte gCurrentSprite
_0805CB30: .4byte 0x0000BFFF

	thumb_func_start YakuzaPhase2Dying
YakuzaPhase2Dying: @ 0x0805CB34
	push {r4, lr}
	ldr r1, _0805CB6C @ =gSubSpriteData1
	ldrh r2, [r1, #8]
	ldr r0, _0805CB70 @ =0x0000063E
	cmp r2, r0
	bhi _0805CB44
	adds r0, r2, #4
	strh r0, [r1, #8]
_0805CB44:
	ldrh r2, [r1, #8]
	ldrh r3, [r1, #0xa]
	ldr r1, _0805CB74 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r1
	mov ip, r0
	ldrb r0, [r0]
	subs r0, #1
	mov r4, ip
	strb r0, [r4]
	ldrb r0, [r4]
	adds r4, r1, #0
	cmp r0, #0x28
	bls _0805CB62
	b _0805CC9C
_0805CB62:
	lsls r0, r0, #2
	ldr r1, _0805CB78 @ =_0805CB7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805CB6C: .4byte gSubSpriteData1
_0805CB70: .4byte 0x0000063E
_0805CB74: .4byte gCurrentSprite
_0805CB78: .4byte _0805CB7C
_0805CB7C: @ jump table
	.4byte _0805CC94 @ case 0
	.4byte _0805CC9C @ case 1
	.4byte _0805CC9C @ case 2
	.4byte _0805CC9C @ case 3
	.4byte _0805CC9C @ case 4
	.4byte _0805CC86 @ case 5
	.4byte _0805CC9C @ case 6
	.4byte _0805CC9C @ case 7
	.4byte _0805CC9C @ case 8
	.4byte _0805CC9C @ case 9
	.4byte _0805CC76 @ case 10
	.4byte _0805CC9C @ case 11
	.4byte _0805CC9C @ case 12
	.4byte _0805CC9C @ case 13
	.4byte _0805CC9C @ case 14
	.4byte _0805CC66 @ case 15
	.4byte _0805CC9C @ case 16
	.4byte _0805CC9C @ case 17
	.4byte _0805CC9C @ case 18
	.4byte _0805CC9C @ case 19
	.4byte _0805CC56 @ case 20
	.4byte _0805CC9C @ case 21
	.4byte _0805CC9C @ case 22
	.4byte _0805CC9C @ case 23
	.4byte _0805CC9C @ case 24
	.4byte _0805CC4C @ case 25
	.4byte _0805CC9C @ case 26
	.4byte _0805CC9C @ case 27
	.4byte _0805CC9C @ case 28
	.4byte _0805CC9C @ case 29
	.4byte _0805CC42 @ case 30
	.4byte _0805CC9C @ case 31
	.4byte _0805CC9C @ case 32
	.4byte _0805CC9C @ case 33
	.4byte _0805CC9C @ case 34
	.4byte _0805CC38 @ case 35
	.4byte _0805CC9C @ case 36
	.4byte _0805CC9C @ case 37
	.4byte _0805CC9C @ case 38
	.4byte _0805CC9C @ case 39
	.4byte _0805CC20 @ case 40
_0805CC20:
	adds r0, r2, #0
	subs r0, #0x40
	adds r1, r3, #0
	subs r1, #0x10
	movs r2, #0x2f
	bl ParticleSet
	movs r0, #0x9a
	lsls r0, r0, #1
	bl unk_3b1c
	b _0805CC9C
_0805CC38:
	adds r0, r2, #0
	adds r0, #0x20
	adds r1, r3, #0
	subs r1, #0x10
	b _0805CC7E
_0805CC42:
	adds r0, r2, #0
	subs r0, #0x20
	adds r1, r3, #0
	adds r1, #0x1c
	b _0805CC6E
_0805CC4C:
	adds r0, r2, #0
	adds r0, #0x40
	adds r1, r3, #0
	adds r1, #0x20
	b _0805CC7E
_0805CC56:
	adds r0, r2, #0
	subs r0, #0x20
	adds r1, r3, #0
	subs r1, #0x10
	movs r2, #0x26
	bl ParticleSet
	b _0805CC9C
_0805CC66:
	adds r0, r2, #0
	adds r0, #0x40
	adds r1, r3, #0
	subs r1, #0x10
_0805CC6E:
	movs r2, #0x2f
	bl ParticleSet
	b _0805CC9C
_0805CC76:
	adds r0, r2, #0
	subs r0, #0x40
	adds r1, r3, #0
	adds r1, #0x1c
_0805CC7E:
	movs r2, #0x25
	bl ParticleSet
	b _0805CC9C
_0805CC86:
	adds r0, r2, #0
	adds r0, #0x10
	adds r1, r3, #0
	movs r2, #0x3a
	bl ParticleSet
	b _0805CC9C
_0805CC94:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
_0805CC9C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaTurningIntoCoreXInit
YakuzaTurningIntoCoreXInit: @ 0x0805CCA4
	ldr r1, _0805CCBC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x4a
	strb r0, [r2]
	ldrh r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0x2c
	strh r0, [r1, #6]
	bx lr
	.align 2, 0
_0805CCBC: .4byte gCurrentSprite

	thumb_func_start YakuzaTurningIntoCoreX
YakuzaTurningIntoCoreX: @ 0x0805CCC0
	push {lr}
	ldr r2, _0805CCEC @ =gWrittenToMosaic_H
	ldr r1, _0805CCF0 @ =sXParasiteMosaicValues
	ldr r3, _0805CCF4 @ =gCurrentSprite
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _0805CCF8
	ldrh r2, [r3, #6]
	movs r0, #0x47
	movs r1, #0
	bl SpriteLoadGfx
	b _0805CD06
	.align 2, 0
_0805CCEC: .4byte gWrittenToMosaic_H
_0805CCF0: .4byte sXParasiteMosaicValues
_0805CCF4: .4byte gCurrentSprite
_0805CCF8:
	cmp r0, #0x14
	bne _0805CD06
	movs r0, #0x47
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0805CD06:
	ldr r2, _0805CD20 @ =gCurrentSprite
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _0805CD1A
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x47
	strb r0, [r2, #0x1d]
_0805CD1A:
	pop {r0}
	bx r0
	.align 2, 0
_0805CD20: .4byte gCurrentSprite

	thumb_func_start YakuzaPartInit
YakuzaPartInit: @ 0x0805CD24
	push {r4, r5, lr}
	ldr r2, _0805CD4C @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _0805CD50 @ =0x0000FFFB
	ands r0, r1
	movs r5, #0
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrb r4, [r2, #0x1e]
	adds r3, r2, #0
	cmp r4, #0
	beq _0805CD54
	cmp r4, #2
	beq _0805CD9C
	movs r0, #0
	strh r0, [r3]
	b _0805CDD2
	.align 2, 0
_0805CD4C: .4byte gCurrentSprite
_0805CD50: .4byte 0x0000FFFB
_0805CD54:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xb
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805CD98 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r2, #4
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	orrs r0, r2
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	subs r0, #0xa
	strb r5, [r0]
	b _0805CDD2
	.align 2, 0
_0805CD98: .4byte 0x0000FFFC
_0805CD9C:
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #0x38
	strb r0, [r1]
	ldr r0, _0805CDE8 @ =0x0000FF80
	strh r0, [r3, #0xa]
	movs r0, #0x10
	strh r0, [r3, #0xc]
	ldr r0, _0805CDEC @ =0x0000FF60
	strh r0, [r3, #0xe]
	movs r0, #0xa0
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r4, [r0]
	movs r0, #1
	strh r0, [r3, #0x14]
_0805CDD2:
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r3]
	bl YakuzaSyncSubSprites
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CDE8: .4byte 0x0000FF80
_0805CDEC: .4byte 0x0000FF60

	thumb_func_start YakuzaPartLegsIdle
YakuzaPartLegsIdle: @ 0x0805CDF0
	push {r4, r5, r6, lr}
	ldr r1, _0805CE34 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r4, [r1]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r0, r4
	adds r2, r1, #0
	ldr r6, _0805CE38 @ =gSpriteData
	cmp r0, #0
	beq _0805CE24
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0805CE64
	ldr r0, _0805CE3C @ =0x0000DFFF
	ands r0, r4
	strh r0, [r2]
_0805CE24:
	ldr r0, _0805CE40 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x40
	bne _0805CE44
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
	b _0805CE4A
	.align 2, 0
_0805CE34: .4byte gCurrentSprite
_0805CE38: .4byte gSpriteData
_0805CE3C: .4byte 0x0000DFFF
_0805CE40: .4byte gSamusData
_0805CE44:
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #2
_0805CE4A:
	strb r0, [r1]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r6
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	cmp r0, #0x60
	bne _0805CE60
	movs r0, #0x10
	b _0805CE62
_0805CE60:
	movs r0, #0x2c
_0805CE62:
	strh r0, [r2, #0xc]
_0805CE64:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPartLegsDead
YakuzaPartLegsDead: @ 0x0805CE6C
	push {r4, r5, lr}
	ldr r3, _0805CE90 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0805CE94 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrh r1, [r4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805CE98
	movs r0, #0
	strh r0, [r3]
	b _0805CEC6
	.align 2, 0
_0805CE90: .4byte gCurrentSprite
_0805CE94: .4byte gSpriteData
_0805CE98:
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r5, #0
	adds r2, r0, #0
	orrs r2, r1
	strh r2, [r3]
	ldrh r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805CEC0
	movs r0, #4
	orrs r2, r0
	b _0805CEC4
_0805CEC0:
	ldr r0, _0805CECC @ =0x0000FFFB
	ands r2, r0
_0805CEC4:
	strh r2, [r3]
_0805CEC6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805CECC: .4byte 0x0000FFFB

	thumb_func_start YakuzaPartEyeIdle
YakuzaPartEyeIdle: @ 0x0805CED0
	push {r4, r5, r6, r7, lr}
	ldr r4, _0805CF08 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r1, [r0]
	adds r0, #3
	movs r7, #1
	strb r7, [r0]
	ldr r2, _0805CF0C @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r2, r0, r2
	ldrh r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805CF10
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	b _0805CFF4
	.align 2, 0
_0805CF08: .4byte gCurrentSprite
_0805CF0C: .4byte gSpriteData
_0805CF10:
	ldrh r3, [r4]
	movs r5, #0x80
	lsls r5, r5, #6
	adds r0, r5, #0
	ands r0, r3
	cmp r0, #0
	beq _0805CF2C
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0805CFF8
	ldr r0, _0805CF70 @ =0x0000DFFF
	ands r0, r3
	strh r0, [r4]
_0805CF2C:
	adds r0, r2, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r6, r4, #0
	adds r6, #0x2f
	ldrb r5, [r6]
	adds r3, r5, #0
	cmp r3, #0
	bne _0805CFC0
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _0805CF7C
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	adds r0, r5, #1
	strb r0, [r6]
	ldr r0, _0805CF74 @ =0x083B7240
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805CF78 @ =0x0000FFFB
	ands r0, r1
	b _0805CFF6
	.align 2, 0
_0805CF70: .4byte 0x0000DFFF
_0805CF74: .4byte 0x083B7240
_0805CF78: .4byte 0x0000FFFB
_0805CF7C:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #7
	beq _0805CF8A
	cmp r0, #9
	bne _0805CFF8
_0805CF8A:
	ldr r0, _0805CFB4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #2
	bhi _0805CFF8
	adds r0, r7, #0
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x2e
	strb r0, [r1]
	adds r0, r5, #1
	strb r0, [r6]
	ldr r0, _0805CFB8 @ =0x083B7240
	str r0, [r4, #0x18]
	strb r3, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805CFBC @ =0x0000FFFB
	ands r0, r1
	b _0805CFF6
	.align 2, 0
_0805CFB4: .4byte gSpriteRandomNumber
_0805CFB8: .4byte 0x083B7240
_0805CFBC: .4byte 0x0000FFFB
_0805CFC0:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _0805CFD4
	ldrb r0, [r4, #0x1c]
	adds r0, #2
	strb r0, [r4, #0x1c]
_0805CFD4:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805CFF8
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0805CFEE
	subs r0, #1
	strb r0, [r2]
	b _0805CFF8
_0805CFEE:
	strb r1, [r6]
	ldrh r1, [r4]
	movs r0, #4
_0805CFF4:
	orrs r0, r1
_0805CFF6:
	strh r0, [r4]
_0805CFF8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPartEyesPhase2
YakuzaPartEyesPhase2: @ 0x0805D000
	push {lr}
	ldr r3, _0805D030 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldr r2, _0805D034 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805D02A
	movs r0, #0
	strh r0, [r3]
_0805D02A:
	pop {r0}
	bx r0
	.align 2, 0
_0805D030: .4byte gCurrentSprite
_0805D034: .4byte gSpriteData

	thumb_func_start YakuzaProjectileInit
YakuzaProjectileInit: @ 0x0805D038
	push {r4, r5, lr}
	ldr r3, _0805D094 @ =gCurrentSprite
	ldrh r0, [r3]
	ldr r1, _0805D098 @ =0x0000FFFB
	ands r1, r0
	movs r5, #0
	movs r4, #0
	strh r1, [r3]
	adds r0, r3, #0
	adds r0, #0x22
	movs r1, #4
	strb r1, [r0]
	ldr r0, _0805D09C @ =gSubSpriteData1
	ldrh r2, [r0, #0xc]
	cmp r2, #0
	beq _0805D0A8
	adds r0, r3, #0
	adds r0, #0x25
	movs r1, #2
	strb r1, [r0]
	adds r2, r3, #0
	adds r2, #0x27
	movs r0, #0x28
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x28
	strb r5, [r0]
	adds r2, #2
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _0805D0A0 @ =0x0000FFA0
	strh r0, [r3, #0xa]
	strh r4, [r3, #0xc]
	adds r0, #0x48
	strh r0, [r3, #0xe]
	movs r0, #0x18
	strh r0, [r3, #0x10]
	ldr r0, _0805D0A4 @ =0x083B72C0
	str r0, [r3, #0x18]
	strb r5, [r3, #0x1c]
	strh r4, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x24
	strb r1, [r0]
	strh r4, [r3, #0x14]
	b _0805D0EE
	.align 2, 0
_0805D094: .4byte gCurrentSprite
_0805D098: .4byte 0x0000FFFB
_0805D09C: .4byte gSubSpriteData1
_0805D0A0: .4byte 0x0000FFA0
_0805D0A4: .4byte 0x083B72C0
_0805D0A8:
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _0805D0F4 @ =0x0000FFE0
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	adds r0, #4
	strh r0, [r3, #0xe]
	movs r0, #0x1c
	strh r0, [r3, #0x10]
	ldr r0, _0805D0F8 @ =0x083B7288
	str r0, [r3, #0x18]
	strb r5, [r3, #0x1c]
	strh r2, [r3, #0x16]
	subs r1, #5
	movs r0, #0x28
	strb r0, [r1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r3, #0x14]
_0805D0EE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805D0F4: .4byte 0x0000FFE0
_0805D0F8: .4byte 0x083B7288

	thumb_func_start YakuzaProjectileExploding
YakuzaProjectileExploding: @ 0x0805D0FC
	push {r4, lr}
	ldr r4, _0805D11C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x2d
	bl ParticleSet
	ldr r0, _0805D120 @ =0x000001BF
	bl SoundPlay
	movs r0, #0
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D11C: .4byte gCurrentSprite
_0805D120: .4byte 0x000001BF

	thumb_func_start YakuzaProjectileSpitFalling
YakuzaProjectileSpitFalling: @ 0x0805D124
	push {lr}
	ldr r0, _0805D13C @ =gCurrentSprite
	ldrh r1, [r0, #2]
	adds r1, #0xc
	strh r1, [r0, #2]
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	bne _0805D138
	bl YakuzaProjectileExploding
_0805D138:
	pop {r0}
	bx r0
	.align 2, 0
_0805D13C: .4byte gCurrentSprite

	thumb_func_start YakuzaProjectileFireFalling
YakuzaProjectileFireFalling: @ 0x0805D140
	push {r4, lr}
	ldr r0, _0805D170 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	adds r1, #0xc
	strh r1, [r0, #2]
	ldrb r1, [r0, #0x1e]
	adds r4, r0, #0
	cmp r1, #0
	beq _0805D192
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0805D174
	ldrh r0, [r4, #4]
	adds r0, #0xc
	strh r0, [r4, #4]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	b _0805D184
	.align 2, 0
_0805D170: .4byte gCurrentSprite
_0805D174:
	ldrh r0, [r4, #4]
	subs r0, #0xc
	strh r0, [r4, #4]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
_0805D184:
	ldr r0, _0805D1CC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	ldr r4, _0805D1D0 @ =gCurrentSprite
	cmp r0, #0
	beq _0805D192
	movs r0, #0
	strb r0, [r4, #0x1e]
_0805D192:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0805D1D4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D1C4
	movs r2, #0
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x78
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r0, #0x9e
	lsls r0, r0, #1
	bl SoundPlay
_0805D1C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805D1CC: .4byte gPreviousCollisionCheck
_0805D1D0: .4byte gCurrentSprite
_0805D1D4: .4byte gPreviousVerticalCollisionCheck

	thumb_func_start YakuzaProjectileFireBurning1
YakuzaProjectileFireBurning1: @ 0x0805D1D8
	push {r4, r5, r6, r7, lr}
	ldr r2, _0805D240 @ =gCurrentSprite
	adds r6, r2, #0
	adds r6, #0x30
	ldrb r3, [r6]
	ldr r5, _0805D244 @ =0x083B0B04
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D248 @ =0x00007FFF
	cmp r1, r0
	bne _0805D1F8
	ldrh r4, [r5]
	movs r3, #0
_0805D1F8:
	adds r0, r3, #1
	strb r0, [r6]
	ldrh r0, [r2, #4]
	adds r0, r0, r4
	strh r0, [r2, #4]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0805D258
	movs r0, #0x50
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _0805D24C @ =0x083B72E0
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0805D250 @ =0x0000FFC0
	strh r0, [r2, #0xa]
	adds r0, #0x30
	strh r0, [r2, #0xe]
	movs r0, #0x10
	strh r0, [r2, #0x10]
	ldr r0, _0805D254 @ =0x0000013D
	bl SoundPlay
	b _0805D268
	.align 2, 0
_0805D240: .4byte gCurrentSprite
_0805D244: .4byte 0x083B0B04
_0805D248: .4byte 0x00007FFF
_0805D24C: .4byte 0x083B72E0
_0805D250: .4byte 0x0000FFC0
_0805D254: .4byte 0x0000013D
_0805D258:
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0805D268
	movs r0, #0x9e
	lsls r0, r0, #1
	bl SoundPlay
_0805D268:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaProjectileFireBurning2
YakuzaProjectileFireBurning2: @ 0x0805D270
	push {r4, r5, r6, r7, lr}
	ldr r2, _0805D2D8 @ =gCurrentSprite
	adds r6, r2, #0
	adds r6, #0x30
	ldrb r3, [r6]
	ldr r5, _0805D2DC @ =0x083B0B04
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D2E0 @ =0x00007FFF
	cmp r1, r0
	bne _0805D290
	ldrh r4, [r5]
	movs r3, #0
_0805D290:
	adds r0, r3, #1
	strb r0, [r6]
	ldrh r0, [r2, #4]
	adds r0, r0, r4
	strh r0, [r2, #4]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0805D2EC
	movs r0, #0x3c
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _0805D2E4 @ =0x083B7300
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r0, _0805D2E8 @ =0x0000FFE0
	strh r0, [r2, #0xa]
	adds r0, #0x14
	strh r0, [r2, #0xe]
	movs r0, #0xc
	strh r0, [r2, #0x10]
	movs r0, #0x9f
	lsls r0, r0, #1
	bl SoundPlay
	b _0805D2FA
	.align 2, 0
_0805D2D8: .4byte gCurrentSprite
_0805D2DC: .4byte 0x083B0B04
_0805D2E0: .4byte 0x00007FFF
_0805D2E4: .4byte 0x083B7300
_0805D2E8: .4byte 0x0000FFE0
_0805D2EC:
	movs r0, #0xf
	ands r1, r0
	cmp r1, #0
	bne _0805D2FA
	ldr r0, _0805D300 @ =0x0000013D
	bl SoundPlay
_0805D2FA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D300: .4byte 0x0000013D

	thumb_func_start YakuzaProjectileFireBurning3
YakuzaProjectileFireBurning3: @ 0x0805D304
	push {r4, r5, r6, r7, lr}
	ldr r3, _0805D364 @ =gCurrentSprite
	adds r6, r3, #0
	adds r6, #0x30
	ldrb r2, [r6]
	ldr r5, _0805D368 @ =0x083B0B04
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0805D36C @ =0x00007FFF
	cmp r1, r0
	bne _0805D324
	ldrh r4, [r5]
	movs r2, #0
_0805D324:
	adds r0, r2, #1
	strb r0, [r6]
	ldrh r0, [r3, #4]
	adds r0, r0, r4
	strh r0, [r3, #4]
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805D34A
	movs r0, #0x3c
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0805D34A:
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0805D35C
	movs r0, #0x9f
	lsls r0, r0, #1
	bl SoundPlay
_0805D35C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805D364: .4byte gCurrentSprite
_0805D368: .4byte 0x083B0B04
_0805D36C: .4byte 0x00007FFF

	thumb_func_start YakuzaProjectileFireBurning4
YakuzaProjectileFireBurning4: @ 0x0805D370
	push {lr}
	ldr r0, _0805D3B0 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r3, [r1]
	adds r2, r0, #0
	cmp r3, #0x1d
	bhi _0805D396
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ands r0, r3
	cmp r0, #0
	bne _0805D396
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
_0805D396:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805D3AA
	strh r0, [r2]
_0805D3AA:
	pop {r0}
	bx r0
	.align 2, 0
_0805D3B0: .4byte gCurrentSprite

	thumb_func_start YakuzaFallingLegInit
YakuzaFallingLegInit: @ 0x0805D3B4
	push {r4, r5, lr}
	ldr r0, _0805D424 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0805D428 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x22
	movs r2, #2
	strb r2, [r0]
	ldr r0, _0805D42C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	ldr r1, _0805D430 @ =0x0000FFFC
	mov r5, ip
	strh r1, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	strb r3, [r5, #0x1c]
	strh r4, [r5, #0x16]
	mov r0, ip
	adds r0, #0x24
	strb r2, [r0]
	adds r0, #0xd
	strb r3, [r0]
	strh r4, [r5, #0x14]
	ldrb r0, [r5, #0x1e]
	mov r3, ip
	cmp r0, #5
	bls _0805D418
	b _0805D56C
_0805D418:
	lsls r0, r0, #2
	ldr r1, _0805D434 @ =_0805D438
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D424: .4byte gCurrentSprite
_0805D428: .4byte 0x0000FFFB
_0805D42C: .4byte gIoRegisters
_0805D430: .4byte 0x0000FFFC
_0805D434: .4byte _0805D438
_0805D438: @ jump table
	.4byte _0805D450 @ case 0
	.4byte _0805D490 @ case 1
	.4byte _0805D4BC @ case 2
	.4byte _0805D4E8 @ case 3
	.4byte _0805D514 @ case 4
	.4byte _0805D540 @ case 5
_0805D450:
	ldr r0, _0805D488 @ =0x083B7320
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r2, #0
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _0805D48C @ =0x00000133
	bl unk_3b1c
	b _0805D570
	.align 2, 0
_0805D488: .4byte 0x083B7320
_0805D48C: .4byte 0x00000133
_0805D490:
	ldr r0, _0805D4B8 @ =0x083B7330
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r2, #8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #6
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	b _0805D570
	.align 2, 0
_0805D4B8: .4byte 0x083B7330
_0805D4BC:
	ldr r0, _0805D4E4 @ =0x083B7340
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #7
	movs r0, #0xa
	strb r0, [r1]
	subs r1, #2
	movs r0, #6
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D4E4: .4byte 0x083B7340
_0805D4E8:
	ldr r0, _0805D510 @ =0x083B7350
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	movs r0, #4
	strb r0, [r1]
	subs r1, #2
	movs r0, #0xa
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D510: .4byte 0x083B7350
_0805D514:
	ldr r0, _0805D53C @ =0x083B7360
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #6
	strb r0, [r1]
	subs r1, #2
	movs r0, #2
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D53C: .4byte 0x083B7360
_0805D540:
	ldr r0, _0805D568 @ =0x083B7370
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #7
	movs r0, #0xa
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	b _0805D570
	.align 2, 0
_0805D568: .4byte 0x083B7370
_0805D56C:
	mov r0, ip
	strh r4, [r0]
_0805D570:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaFallingLegMoving
YakuzaFallingLegMoving: @ 0x0805D578
	push {r4, r5, r6, lr}
	ldr r1, _0805D5A0 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r2, r1, #0
	cmp r0, #0
	beq _0805D5A4
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805D5FE
	ldrh r0, [r2, #2]
	ldrh r1, [r2, #4]
	movs r2, #0x25
	bl ParticleSet
	b _0805D5FE
	.align 2, 0
_0805D5A0: .4byte gCurrentSprite
_0805D5A4:
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _0805D5CC @ =sSpritesFallingSpeed_2e499c
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0805D5D0 @ =0x00007FFF
	cmp r1, r0
	bne _0805D5D4
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0805D5DE
	.align 2, 0
_0805D5CC: .4byte sSpritesFallingSpeed_2e499c
_0805D5D0: .4byte 0x00007FFF
_0805D5D4:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
_0805D5DE:
	strh r0, [r2, #2]
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	bhi _0805D5F2
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	b _0805D5FC
_0805D5F2:
	adds r1, r2, #0
	adds r1, #0x30
	ldrh r0, [r2, #4]
	ldrb r1, [r1]
	adds r0, r0, r1
_0805D5FC:
	strh r0, [r2, #4]
_0805D5FE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Yakuza
Yakuza: @ 0x0805D604
	push {r4, lr}
	ldr r1, _0805D648 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	adds r4, r1, #0
	cmp r0, #0
	bne _0805D61C
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805D61C
	movs r0, #0x47
	strb r0, [r1]
_0805D61C:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0805D630
	ldr r0, _0805D64C @ =0x00000131
	bl SoundPlayNotAlreadyPlaying
_0805D630:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4a
	bls _0805D63C
	b _0805D830
_0805D63C:
	lsls r0, r0, #2
	ldr r1, _0805D650 @ =_0805D654
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D648: .4byte gCurrentSprite
_0805D64C: .4byte 0x00000131
_0805D650: .4byte _0805D654
_0805D654: @ jump table
	.4byte _0805D780 @ case 0
	.4byte _0805D792 @ case 1
	.4byte _0805D796 @ case 2
	.4byte _0805D830 @ case 3
	.4byte _0805D830 @ case 4
	.4byte _0805D830 @ case 5
	.4byte _0805D830 @ case 6
	.4byte _0805D7A8 @ case 7
	.4byte _0805D7AC @ case 8
	.4byte _0805D7D8 @ case 9
	.4byte _0805D7DC @ case 10
	.4byte _0805D830 @ case 11
	.4byte _0805D830 @ case 12
	.4byte _0805D830 @ case 13
	.4byte _0805D830 @ case 14
	.4byte _0805D830 @ case 15
	.4byte _0805D830 @ case 16
	.4byte _0805D830 @ case 17
	.4byte _0805D830 @ case 18
	.4byte _0805D830 @ case 19
	.4byte _0805D830 @ case 20
	.4byte _0805D830 @ case 21
	.4byte _0805D830 @ case 22
	.4byte _0805D830 @ case 23
	.4byte _0805D79C @ case 24
	.4byte _0805D830 @ case 25
	.4byte _0805D7A2 @ case 26
	.4byte _0805D7EC @ case 27
	.4byte _0805D7F0 @ case 28
	.4byte _0805D7F6 @ case 29
	.4byte _0805D7FA @ case 30
	.4byte _0805D800 @ case 31
	.4byte _0805D804 @ case 32
	.4byte _0805D80A @ case 33
	.4byte _0805D80E @ case 34
	.4byte _0805D814 @ case 35
	.4byte _0805D818 @ case 36
	.4byte _0805D830 @ case 37
	.4byte _0805D830 @ case 38
	.4byte _0805D7B2 @ case 39
	.4byte _0805D7B6 @ case 40
	.4byte _0805D830 @ case 41
	.4byte _0805D7BC @ case 42
	.4byte _0805D830 @ case 43
	.4byte _0805D7C2 @ case 44
	.4byte _0805D830 @ case 45
	.4byte _0805D7C8 @ case 46
	.4byte _0805D7CE @ case 47
	.4byte _0805D7D2 @ case 48
	.4byte _0805D7E2 @ case 49
	.4byte _0805D7E6 @ case 50
	.4byte _0805D830 @ case 51
	.4byte _0805D830 @ case 52
	.4byte _0805D830 @ case 53
	.4byte _0805D830 @ case 54
	.4byte _0805D786 @ case 55
	.4byte _0805D78C @ case 56
	.4byte _0805D830 @ case 57
	.4byte _0805D830 @ case 58
	.4byte _0805D830 @ case 59
	.4byte _0805D830 @ case 60
	.4byte _0805D830 @ case 61
	.4byte _0805D830 @ case 62
	.4byte _0805D830 @ case 63
	.4byte _0805D830 @ case 64
	.4byte _0805D830 @ case 65
	.4byte _0805D830 @ case 66
	.4byte _0805D830 @ case 67
	.4byte _0805D830 @ case 68
	.4byte _0805D830 @ case 69
	.4byte _0805D830 @ case 70
	.4byte _0805D81E @ case 71
	.4byte _0805D822 @ case 72
	.4byte _0805D828 @ case 73
	.4byte _0805D82C @ case 74
_0805D780:
	bl YakuzaInit
	b _0805D830
_0805D786:
	bl YakuzaWaitingToAppear
	b _0805D830
_0805D78C:
	bl YakuzaAboutToAppear
	b _0805D830
_0805D792:
	bl YakuzaBeginSweepInit
_0805D796:
	bl YakuzaBeginSweep
	b _0805D830
_0805D79C:
	bl YakuzaSweeping
	b _0805D830
_0805D7A2:
	bl YakuzaSweepingEnd
	b _0805D830
_0805D7A8:
	bl YakuzaIdleBeforeNewRoundInit
_0805D7AC:
	bl YakuzaIdleBeforeNewRound
	b _0805D830
_0805D7B2:
	bl YakuzaGrabbedSamusInit
_0805D7B6:
	bl YakuzaGrabbedSamus
	b _0805D830
_0805D7BC:
	bl YakuzaPullingSamus
	b _0805D830
_0805D7C2:
	bl YakuzaHoldingSamusHigh
	b _0805D830
_0805D7C8:
	bl YakuzaSlammingSamus
	b _0805D830
_0805D7CE:
	bl YakuzaReleasingSamusInit
_0805D7D2:
	bl YakuzaReleasingSamus
	b _0805D830
_0805D7D8:
	bl YakuzaAfterReleasingSamusInit
_0805D7DC:
	bl YakuzaAfterReleasingSamus
	b _0805D830
_0805D7E2:
	bl YakuzaOpeningMouthInit
_0805D7E6:
	bl YakuzaOpeningMouth
	b _0805D830
_0805D7EC:
	bl YakuzaMouthOpenedInit
_0805D7F0:
	bl YakuzaMouthOpened
	b _0805D830
_0805D7F6:
	bl YakuzaClosingMouthInit
_0805D7FA:
	bl YakuzaClosingMouth
	b _0805D830
_0805D800:
	bl YakuzaPhase1DyingInit
_0805D804:
	bl YakuzaPhase1Dying
	b _0805D830
_0805D80A:
	bl YakuzaLosingLegsInit
_0805D80E:
	bl YakuzaLosingLegs
	b _0805D830
_0805D814:
	bl YakuzaPhase2Init
_0805D818:
	bl YakuzaPhase2
	b _0805D830
_0805D81E:
	bl YakuzaPhase2DyingInit
_0805D822:
	bl YakuzaPhase2Dying
	b _0805D830
_0805D828:
	bl YakuzaTurningIntoCoreXInit
_0805D82C:
	bl YakuzaTurningIntoCoreX
_0805D830:
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl YakuzaSyncSubSprites
	bl YakuzaUpdatePalette
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaPart
YakuzaPart: @ 0x0805D844
	push {lr}
	ldr r2, _0805D858 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	cmp r1, #0
	bne _0805D85C
	bl YakuzaPartInit
	b _0805D894
	.align 2, 0
_0805D858: .4byte gCurrentSprite
_0805D85C:
	ldrb r0, [r2, #0x1e]
	cmp r0, #2
	bne _0805D87E
	ldr r0, _0805D870 @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _0805D874
	bl YakuzaPartLegsIdle
	b _0805D878
	.align 2, 0
_0805D870: .4byte gSubSpriteData1
_0805D874:
	bl YakuzaPartLegsDead
_0805D878:
	bl YakuzaSyncSubSprites
	b _0805D894
_0805D87E:
	cmp r0, #0
	bne _0805D894
	cmp r1, #2
	bne _0805D88C
	bl YakuzaPartEyeIdle
	b _0805D890
_0805D88C:
	bl YakuzaPartEyesPhase2
_0805D890:
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
_0805D894:
	pop {r0}
	bx r0

	thumb_func_start YakuzaProjectile
YakuzaProjectile: @ 0x0805D898
	push {lr}
	ldr r0, _0805D8B0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	bls _0805D8A6
	b _0805D9C6
_0805D8A6:
	lsls r0, r0, #2
	ldr r1, _0805D8B4 @ =_0805D8B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805D8B0: .4byte gCurrentSprite
_0805D8B4: .4byte _0805D8B8
_0805D8B8: @ jump table
	.4byte _0805D998 @ case 0
	.4byte _0805D9C6 @ case 1
	.4byte _0805D9AA @ case 2
	.4byte _0805D9C6 @ case 3
	.4byte _0805D9C6 @ case 4
	.4byte _0805D9C6 @ case 5
	.4byte _0805D9C6 @ case 6
	.4byte _0805D9C6 @ case 7
	.4byte _0805D9C6 @ case 8
	.4byte _0805D9C6 @ case 9
	.4byte _0805D9C6 @ case 10
	.4byte _0805D9C6 @ case 11
	.4byte _0805D9C6 @ case 12
	.4byte _0805D9C6 @ case 13
	.4byte _0805D9C6 @ case 14
	.4byte _0805D9C6 @ case 15
	.4byte _0805D9C6 @ case 16
	.4byte _0805D9C6 @ case 17
	.4byte _0805D9C6 @ case 18
	.4byte _0805D9C6 @ case 19
	.4byte _0805D9C6 @ case 20
	.4byte _0805D9C6 @ case 21
	.4byte _0805D9C6 @ case 22
	.4byte _0805D9C6 @ case 23
	.4byte _0805D9B0 @ case 24
	.4byte _0805D9C6 @ case 25
	.4byte _0805D9B6 @ case 26
	.4byte _0805D9C6 @ case 27
	.4byte _0805D9BC @ case 28
	.4byte _0805D9C6 @ case 29
	.4byte _0805D9C2 @ case 30
	.4byte _0805D9C6 @ case 31
	.4byte _0805D9C6 @ case 32
	.4byte _0805D9C6 @ case 33
	.4byte _0805D9C6 @ case 34
	.4byte _0805D9C6 @ case 35
	.4byte _0805D9C6 @ case 36
	.4byte _0805D9C6 @ case 37
	.4byte _0805D9C6 @ case 38
	.4byte _0805D9C6 @ case 39
	.4byte _0805D99E @ case 40
	.4byte _0805D9C6 @ case 41
	.4byte _0805D9C6 @ case 42
	.4byte _0805D9C6 @ case 43
	.4byte _0805D9C6 @ case 44
	.4byte _0805D9C6 @ case 45
	.4byte _0805D9C6 @ case 46
	.4byte _0805D9C6 @ case 47
	.4byte _0805D9C6 @ case 48
	.4byte _0805D9C6 @ case 49
	.4byte _0805D9C6 @ case 50
	.4byte _0805D9C6 @ case 51
	.4byte _0805D9C6 @ case 52
	.4byte _0805D9C6 @ case 53
	.4byte _0805D9C6 @ case 54
	.4byte _0805D9A4 @ case 55
_0805D998:
	bl YakuzaProjectileInit
	b _0805D9C6
_0805D99E:
	bl YakuzaProjectileSpitFalling
	b _0805D9C6
_0805D9A4:
	bl YakuzaProjectileExploding
	b _0805D9C6
_0805D9AA:
	bl YakuzaProjectileFireFalling
	b _0805D9C6
_0805D9B0:
	bl YakuzaProjectileFireBurning1
	b _0805D9C6
_0805D9B6:
	bl YakuzaProjectileFireBurning2
	b _0805D9C6
_0805D9BC:
	bl YakuzaProjectileFireBurning3
	b _0805D9C6
_0805D9C2:
	bl YakuzaProjectileFireBurning4
_0805D9C6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start YakuzaFallingLeg
YakuzaFallingLeg: @ 0x0805D9CC
	push {lr}
	ldr r0, _0805D9E8 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805D9EC
	cmp r0, #2
	beq _0805D9F2
	b _0805D9F6
	.align 2, 0
_0805D9E8: .4byte gCurrentSprite
_0805D9EC:
	bl YakuzaFallingLegInit
	b _0805D9F6
_0805D9F2:
	bl YakuzaFallingLegMoving
_0805D9F6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmareMoveToPosition
NightmareMoveToPosition: @ 0x0805D9FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r7, r5, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	mov r8, r6
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	movs r0, #0
	mov sb, r0
	ldr r2, _0805DA60 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _0805DAA0
	movs r1, #0x2f
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _0805DA82
	ldr r3, _0805DA64 @ =gSubSpriteData1
	ldrh r1, [r3, #0xa]
	adds r0, r5, #4
	cmp r1, r0
	ble _0805DA68
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r2, ip
	strb r0, [r2]
	b _0805DB34
	.align 2, 0
_0805DA60: .4byte gCurrentSprite
_0805DA64: .4byte gSubSpriteData1
_0805DA68:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r6
	bhs _0805DA76
	adds r0, #1
	strb r0, [r1]
_0805DA76:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r5, [r3, #0xa]
	adds r0, r0, r5
	strh r0, [r3, #0xa]
	b _0805DB34
_0805DA82:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DB3A
	ldr r1, _0805DA9C @ =gSubSpriteData1
	ldrb r0, [r6]
	asrs r0, r4
	ldrh r2, [r1, #0xa]
	adds r0, r0, r2
	strh r0, [r1, #0xa]
	b _0805DB34
	.align 2, 0
_0805DA9C: .4byte gSubSpriteData1
_0805DAA0:
	movs r5, #0x2f
	adds r5, r5, r2
	mov ip, r5
	ldrb r0, [r5]
	adds r5, r0, #0
	cmp r5, #0
	bne _0805DAFA
	ldr r3, _0805DAC4 @ =gSubSpriteData1
	ldrh r1, [r3, #0xa]
	subs r0, r7, #4
	cmp r1, r0
	bge _0805DAC8
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r6, ip
	strb r0, [r6]
	b _0805DB34
	.align 2, 0
_0805DAC4: .4byte gSubSpriteData1
_0805DAC8:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r8
	bhs _0805DAD6
	adds r0, #1
	strb r0, [r1]
_0805DAD6:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #0xa]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805DAF6
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _0805DB34
_0805DAF6:
	strh r1, [r3, #0xa]
	b _0805DB34
_0805DAFA:
	subs r0, #1
	mov r2, ip
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DB30
	ldrb r0, [r2]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _0805DB28 @ =gSubSpriteData1
	ldrh r0, [r2, #0xa]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805DB2C
	movs r5, #1
	mov sb, r5
	mov r6, ip
	strb r3, [r6]
	b _0805DB34
	.align 2, 0
_0805DB28: .4byte gSubSpriteData1
_0805DB2C:
	strh r1, [r2, #0xa]
	b _0805DB34
_0805DB30:
	movs r0, #1
	mov sb, r0
_0805DB34:
	mov r1, sb
	cmp r1, #0
	beq _0805DB54
_0805DB3A:
	ldr r2, _0805DB8C @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x30
	movs r0, #1
	strb r0, [r2]
	ldr r0, _0805DB90 @ =0x000002A6
	bl SoundPlayNotAlreadyPlaying
_0805DB54:
	movs r5, #0
	mov sb, r5
	ldr r2, _0805DB8C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _0805DBD4
	movs r6, #0x2e
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	cmp r0, #0
	bne _0805DBB4
	ldr r3, _0805DB94 @ =gSubSpriteData1
	ldrh r1, [r3, #8]
	mov r0, sl
	subs r0, #4
	cmp r1, r0
	ble _0805DB98
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r6]
	b _0805DC6C
	.align 2, 0
_0805DB8C: .4byte gCurrentSprite
_0805DB90: .4byte 0x000002A6
_0805DB94: .4byte gSubSpriteData1
_0805DB98:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r5, [sp]
	cmp r0, r5
	bhs _0805DBA8
	adds r0, #1
	strb r0, [r1]
_0805DBA8:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r3, #8]
	adds r0, r0, r6
	strh r0, [r3, #8]
	b _0805DC6C
_0805DBB4:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DC72
	ldr r1, _0805DBD0 @ =gSubSpriteData1
	mov r3, ip
	ldrb r0, [r3]
	asrs r0, r4
	ldrh r5, [r1, #8]
	adds r0, r0, r5
	strh r0, [r1, #8]
	b _0805DC6C
	.align 2, 0
_0805DBD0: .4byte gSubSpriteData1
_0805DBD4:
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	adds r5, r0, #0
	cmp r5, #0
	bne _0805DC30
	ldr r3, _0805DBFC @ =gSubSpriteData1
	ldrh r1, [r3, #8]
	mov r0, sl
	adds r0, #4
	cmp r1, r0
	bge _0805DC00
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r1, ip
	strb r0, [r1]
	b _0805DC6C
	.align 2, 0
_0805DBFC: .4byte gSubSpriteData1
_0805DC00:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp]
	cmp r0, r6
	bhs _0805DC10
	adds r0, #1
	strb r0, [r1]
_0805DC10:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #8]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805DC64
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _0805DC6C
_0805DC30:
	subs r0, #1
	mov r3, ip
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805DC68
	ldrb r0, [r3]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _0805DC60 @ =gSubSpriteData1
	ldrh r0, [r3, #8]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805DC64
	movs r5, #1
	mov sb, r5
	mov r0, ip
	strb r6, [r0]
	b _0805DC6C
	.align 2, 0
_0805DC60: .4byte gSubSpriteData1
_0805DC64:
	strh r1, [r3, #8]
	b _0805DC6C
_0805DC68:
	movs r1, #1
	mov sb, r1
_0805DC6C:
	mov r3, sb
	cmp r3, #0
	beq _0805DC8C
_0805DC72:
	ldrh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r1, r5, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0805DC9C @ =0x000002A6
	bl SoundPlayNotAlreadyPlaying
_0805DC8C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DC9C: .4byte 0x000002A6

	thumb_func_start NightmareSyncSubSprites
NightmareSyncSubSprites: @ 0x0805DCA0
	push {r4, lr}
	ldr r4, _0805DCFC @ =gSubSpriteData1
	ldrh r0, [r4, #4]
	ldr r1, [r4]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r3, [r0]
	ldr r2, _0805DD00 @ =gCurrentSprite
	ldrb r1, [r2, #0x1e]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ldr r1, _0805DD04 @ =0x0879B7FC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	beq _0805DCD2
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
_0805DCD2:
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
_0805DCFC: .4byte gSubSpriteData1
_0805DD00: .4byte gCurrentSprite
_0805DD04: .4byte 0x0879B7FC

	thumb_func_start NightmarePlaySound
NightmarePlaySound: @ 0x0805DD08
	push {lr}
	ldr r0, _0805DD30 @ =gCurrentSprite
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805DD2A
	ldr r0, _0805DD34 @ =gSubSpriteData1
	ldr r0, [r0, #4]
	ldr r1, _0805DD38 @ =0x00FFFFFF
	ands r0, r1
	movs r1, #0xc0
	lsls r1, r1, #0xc
	cmp r0, r1
	bne _0805DD2A
	ldr r0, _0805DD3C @ =0x000002A1
	bl SoundPlay
_0805DD2A:
	pop {r0}
	bx r0
	.align 2, 0
_0805DD30: .4byte gCurrentSprite
_0805DD34: .4byte gSubSpriteData1
_0805DD38: .4byte 0x00FFFFFF
_0805DD3C: .4byte 0x000002A1

	thumb_func_start NightmareMakeMissilesFall
NightmareMakeMissilesFall: @ 0x0805DD40
	push {r4, r5, lr}
	movs r5, #0xc
	movs r3, #0
	ldr r4, _0805DD94 @ =gProjectileData
_0805DD48:
	lsls r0, r3, #5
	adds r1, r0, r4
	ldrb r2, [r1]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0805DD82
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0805DD82
	ldrb r0, [r1, #0xf]
	cmp r0, r5
	bne _0805DD82
	ldrb r2, [r1, #0x13]
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _0805DD72
	adds r0, r2, #1
	strb r0, [r1, #0x13]
_0805DD72:
	ldrb r0, [r1, #0x13]
	movs r2, #0x2a
	cmp r0, #0x29
	bhi _0805DD7C
	adds r2, r0, #0
_0805DD7C:
	ldrh r0, [r1, #8]
	adds r0, r2, r0
	strh r0, [r1, #8]
_0805DD82:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0805DD48
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805DD94: .4byte gProjectileData

	thumb_func_start NightmareReduceSamusXVelocity
NightmareReduceSamusXVelocity: @ 0x0805DD98
	push {lr}
	ldr r0, _0805DDB4 @ =gEquipment
	ldrh r0, [r0]
	cmp r0, #0
	beq _0805DDC8
	ldr r2, _0805DDB8 @ =gSamusData
	ldrh r3, [r2, #0x1a]
	movs r0, #0x1a
	ldrsh r1, [r2, r0]
	cmp r1, #4
	ble _0805DDBC
	subs r0, r3, #2
	b _0805DDC6
	.align 2, 0
_0805DDB4: .4byte gEquipment
_0805DDB8: .4byte gSamusData
_0805DDBC:
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0805DDC8
	adds r0, r3, #2
_0805DDC6:
	strh r0, [r2, #0x1a]
_0805DDC8:
	pop {r0}
	bx r0

	thumb_func_start NightmareInit
NightmareInit: @ 0x0805DDCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _0805DDEC @ =gEquipment
	ldrb r1, [r0, #0xc]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0
	beq _0805DDF4
	ldr r1, _0805DDF0 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0805DFA0
	.align 2, 0
_0805DDEC: .4byte gEquipment
_0805DDF0: .4byte gCurrentSprite
_0805DDF4:
	ldr r0, _0805DFAC @ =gCurrentSprite
	mov r8, r0
	movs r2, #0xb0
	lsls r2, r2, #2
	adds r1, r2, #0
	ldrh r5, [r0, #2]
	adds r1, r1, r5
	movs r4, #0
	strh r1, [r0, #2]
	ldrh r0, [r0, #4]
	adds r0, #0x40
	mov r2, r8
	strh r0, [r2, #4]
	ldr r3, _0805DFB0 @ =gSubSpriteData1
	strh r1, [r3, #8]
	strh r0, [r3, #0xa]
	movs r0, #0xa
	strb r0, [r2, #0x1e]
	mov r1, r8
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x50
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r2, #0x40
	movs r0, #0x40
	strb r0, [r1]
	movs r0, #0xff
	lsls r0, r0, #8
	mov r5, r8
	strh r0, [r5, #0xa]
	adds r0, #0xe0
	strh r0, [r5, #0xc]
	subs r0, #0x80
	strh r0, [r5, #0xe]
	movs r0, #0xc0
	strh r0, [r5, #0x10]
	ldrh r0, [r5]
	movs r5, #0x80
	lsls r5, r5, #8
	adds r1, r5, #0
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	adds r1, #0x34
	ldrb r0, [r1]
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _0805DFB4 @ =sPrimarySpriteStats
	mov r5, r8
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	ldr r0, _0805DFB8 @ =0x083B83BC
	str r0, [r3]
	strb r4, [r3, #6]
	strh r7, [r3, #4]
	mov r0, r8
	adds r0, #0x25
	strb r4, [r0]
	adds r0, #8
	strb r4, [r0]
	mov r1, r8
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x2e
	movs r1, #0xb4
	strb r1, [r0]
	ldr r0, _0805DFBC @ =gBossWork3
	strb r1, [r0]
	ldrh r5, [r3, #8]
	ldrh r6, [r3, #0xa]
	mov r0, r8
	adds r0, #0x23
	ldrb r0, [r0]
	mov r8, r0
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #0
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #1
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #2
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #3
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	ldr r2, _0805DFC0 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x36
	strb r0, [r1]
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #4
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #5
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #6
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #7
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #8
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #9
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #0xb
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #0xc
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
	str r5, [sp]
	str r6, [sp, #4]
	str r7, [sp, #8]
	movs r0, #0x80
	movs r1, #0xd
	movs r2, #0
	mov r3, r8
	bl SpriteSpawnSecondary
_0805DFA0:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805DFAC: .4byte gCurrentSprite
_0805DFB0: .4byte gSubSpriteData1
_0805DFB4: .4byte sPrimarySpriteStats
_0805DFB8: .4byte 0x083B83BC
_0805DFBC: .4byte gBossWork3
_0805DFC0: .4byte gSpriteData

	thumb_func_start NightmareWaitingToAppear
NightmareWaitingToAppear: @ 0x0805DFC4
	push {r4, lr}
	ldr r1, _0805E000 @ =gCurrentSprite
	adds r4, r1, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805DFFA
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	movs r0, #0x3c
	strb r0, [r4]
	movs r0, #0xa8
	lsls r0, r0, #2
	bl unk_3b1c
_0805DFFA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E000: .4byte gCurrentSprite

	thumb_func_start NightmareAppearing
NightmareAppearing: @ 0x0805E004
	push {r4, r5, lr}
	ldr r5, _0805E050 @ =gCurrentSprite
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
	adds r4, r5, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E03C
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	movs r0, #0x3c
	strb r0, [r4]
	movs r0, #0xa8
	lsls r0, r0, #2
	bl unk_3b1c
_0805E03C:
	ldr r2, _0805E054 @ =gSubSpriteData1
	ldrh r1, [r2, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r1, r0
	bls _0805E058
	subs r0, r1, #1
	strh r0, [r2, #8]
	b _0805E060
	.align 2, 0
_0805E050: .4byte gCurrentSprite
_0805E054: .4byte gSubSpriteData1
_0805E058:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
_0805E060:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmarePhase1Init
NightmarePhase1Init: @ 0x0805E068
	push {lr}
	ldr r3, _0805E0A4 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2f
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	ldrh r1, [r3]
	ldr r0, _0805E0A8 @ =0x00007FFB
	ands r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x3a
	strb r0, [r1]
	movs r0, #0x41
	movs r1, #7
	bl PlayMusic
	pop {r0}
	bx r0
	.align 2, 0
_0805E0A4: .4byte gCurrentSprite
_0805E0A8: .4byte 0x00007FFB

	thumb_func_start NightmarePhase1
NightmarePhase1: @ 0x0805E0AC
	push {lr}
	sub sp, #4
	ldr r1, _0805E0DC @ =gSamusData
	ldr r2, _0805E0E0 @ =0xFFFFFF00
	adds r0, r2, #0
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _0805E0E4 @ =gAbilityRestingXPosition
	ldrh r1, [r1]
	adds r1, #0xc0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	movs r2, #2
	str r2, [sp]
	movs r2, #0x28
	movs r3, #8
	bl NightmareMoveToPosition
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0805E0DC: .4byte gSamusData
_0805E0E0: .4byte 0xFFFFFF00
_0805E0E4: .4byte gAbilityRestingXPosition

	thumb_func_start NightmarePhase2ResettingPosition
NightmarePhase2ResettingPosition: @ 0x0805E0E8
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805E120 @ =gAbilityRestingYPosition
	ldrh r0, [r0]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _0805E124 @ =gAbilityRestingXPosition
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0805E128 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	adds r3, r0, #0
	cmp r1, r5
	bhs _0805E130
	ldr r0, _0805E12C @ =gCurrentSprite
	ldrh r2, [r0]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r1, r2
	b _0805E138
	.align 2, 0
_0805E120: .4byte gAbilityRestingYPosition
_0805E124: .4byte gAbilityRestingXPosition
_0805E128: .4byte gSubSpriteData1
_0805E12C: .4byte gCurrentSprite
_0805E130:
	ldr r0, _0805E150 @ =gCurrentSprite
	ldrh r2, [r0]
	ldr r1, _0805E154 @ =0x0000FDFF
	ands r1, r2
_0805E138:
	strh r1, [r0]
	adds r2, r0, #0
	ldrh r0, [r3, #8]
	cmp r0, r4
	bhs _0805E158
	ldrh r1, [r2]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	orrs r0, r1
	b _0805E15E
	.align 2, 0
_0805E150: .4byte gCurrentSprite
_0805E154: .4byte 0x0000FDFF
_0805E158:
	ldrh r1, [r2]
	ldr r0, _0805E178 @ =0x0000FBFF
	ands r0, r1
_0805E15E:
	strh r0, [r2]
	ldrh r1, [r3, #8]
	adds r0, r4, #6
	cmp r1, r0
	bge _0805E17C
	subs r0, r4, #6
	cmp r1, r0
	ble _0805E17C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E194
	.align 2, 0
_0805E178: .4byte 0x0000FBFF
_0805E17C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805E18E
	ldrh r0, [r3, #8]
	adds r0, #1
	b _0805E192
_0805E18E:
	ldrh r0, [r3, #8]
	subs r0, #1
_0805E192:
	strh r0, [r3, #8]
_0805E194:
	ldrh r1, [r3, #0xa]
	adds r0, r5, #6
	cmp r1, r0
	bge _0805E1AA
	subs r0, r5, #6
	cmp r1, r0
	ble _0805E1AA
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E1C2
_0805E1AA:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E1BC
	ldrh r0, [r3, #0xa]
	adds r0, #1
	b _0805E1C0
_0805E1BC:
	ldrh r0, [r3, #0xa]
	subs r0, #1
_0805E1C0:
	strh r0, [r3, #0xa]
_0805E1C2:
	cmp r6, #2
	bne _0805E1DA
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0805E1E0 @ =0x0000FDFF
	ands r0, r1
	ldr r1, _0805E1E4 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
_0805E1DA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805E1E0: .4byte 0x0000FDFF
_0805E1E4: .4byte 0x0000FBFF

	thumb_func_start NightmarePhase2MovementInit
NightmarePhase2MovementInit: @ 0x0805E1E8
	ldr r1, _0805E200 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	movs r0, #0
	strh r3, [r1, #6]
	adds r1, #0x31
	strb r0, [r1]
	bx lr
	.align 2, 0
_0805E200: .4byte gCurrentSprite

	thumb_func_start NightmarePhase2Movement
NightmarePhase2Movement: @ 0x0805E204
	push {r4, r5, r6, lr}
	ldr r3, _0805E224 @ =0x083B7380
	ldr r2, _0805E228 @ =gCurrentSprite
	ldrh r4, [r2, #6]
	lsls r1, r4, #0x10
	lsrs r0, r1, #0x15
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r3, [r0]
	movs r0, #0xcf
	lsls r0, r0, #0x11
	cmp r1, r0
	bhi _0805E22C
	adds r0, r4, #1
	strh r0, [r2, #6]
	b _0805E23C
	.align 2, 0
_0805E224: .4byte 0x083B7380
_0805E228: .4byte gCurrentSprite
_0805E22C:
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	eors r0, r1
	movs r1, #0
	strh r0, [r2]
	strh r1, [r2, #6]
_0805E23C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E254
	ldr r1, _0805E250 @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	adds r0, r3, r0
	b _0805E25A
	.align 2, 0
_0805E250: .4byte gSubSpriteData1
_0805E254:
	ldr r1, _0805E27C @ =gSubSpriteData1
	ldrh r0, [r1, #0xa]
	subs r0, r0, r3
_0805E25A:
	strh r0, [r1, #0xa]
	adds r6, r1, #0
	ldr r0, _0805E280 @ =0x083B739A
	adds r4, r2, #0
	adds r4, #0x31
	ldrb r5, [r4]
	lsls r1, r5, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1b
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	cmp r2, #0xfe
	bhi _0805E284
	adds r0, r5, #1
	b _0805E286
	.align 2, 0
_0805E27C: .4byte gSubSpriteData1
_0805E280: .4byte 0x083B739A
_0805E284:
	movs r0, #0
_0805E286:
	strb r0, [r4]
	ldrh r0, [r6, #8]
	adds r0, r3, r0
	strh r0, [r6, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start NightmareMovingToPhase3Init
NightmareMovingToPhase3Init: @ 0x0805E294
	ldr r0, _0805E2A0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x18
	strb r1, [r0]
	bx lr
	.align 2, 0
_0805E2A0: .4byte gCurrentSprite

	thumb_func_start NightmareMovingToPhase3
NightmareMovingToPhase3: @ 0x0805E2A4
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r0, _0805E2D0 @ =gAbilityRestingYPosition
	ldrh r4, [r0]
	ldr r0, _0805E2D4 @ =gAbilityRestingXPosition
	ldrh r0, [r0]
	adds r0, #0xc0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0805E2D8 @ =gSubSpriteData1
	ldrh r1, [r0, #0xa]
	adds r3, r0, #0
	cmp r1, r5
	bhs _0805E2E0
	ldr r0, _0805E2DC @ =gCurrentSprite
	ldrh r2, [r0]
	movs r7, #0x80
	lsls r7, r7, #2
	adds r1, r7, #0
	orrs r1, r2
	b _0805E2E8
	.align 2, 0
_0805E2D0: .4byte gAbilityRestingYPosition
_0805E2D4: .4byte gAbilityRestingXPosition
_0805E2D8: .4byte gSubSpriteData1
_0805E2DC: .4byte gCurrentSprite
_0805E2E0:
	ldr r0, _0805E300 @ =gCurrentSprite
	ldrh r2, [r0]
	ldr r1, _0805E304 @ =0x0000FDFF
	ands r1, r2
_0805E2E8:
	strh r1, [r0]
	adds r2, r0, #0
	ldrh r0, [r3, #8]
	cmp r0, r4
	bhs _0805E308
	ldrh r1, [r2]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	orrs r0, r1
	b _0805E30E
	.align 2, 0
_0805E300: .4byte gCurrentSprite
_0805E304: .4byte 0x0000FDFF
_0805E308:
	ldrh r1, [r2]
	ldr r0, _0805E328 @ =0x0000FBFF
	ands r0, r1
_0805E30E:
	strh r0, [r2]
	ldrh r1, [r3, #8]
	adds r0, r4, #6
	cmp r1, r0
	bge _0805E32C
	subs r0, r4, #6
	cmp r1, r0
	ble _0805E32C
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E344
	.align 2, 0
_0805E328: .4byte 0x0000FBFF
_0805E32C:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805E33E
	ldrh r0, [r3, #8]
	adds r0, #1
	b _0805E342
_0805E33E:
	ldrh r0, [r3, #8]
	subs r0, #1
_0805E342:
	strh r0, [r3, #8]
_0805E344:
	ldrh r1, [r3, #0xa]
	adds r0, r5, #6
	cmp r1, r0
	bge _0805E35A
	subs r0, r5, #6
	cmp r1, r0
	ble _0805E35A
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E372
_0805E35A:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E36C
	ldrh r0, [r3, #0xa]
	adds r0, #1
	b _0805E370
_0805E36C:
	ldrh r0, [r3, #0xa]
	subs r0, #1
_0805E370:
	strh r0, [r3, #0xa]
_0805E372:
	cmp r6, #2
	bne _0805E37E
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
_0805E37E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NightmareReachedPhase3Position
NightmareReachedPhase3Position: @ 0x0805E384
	bx lr
	.align 2, 0

	thumb_func_start NightmarePhase3SlotMovementInit
NightmarePhase3SlotMovementInit: @ 0x0805E388
	bx lr
	.align 2, 0

	thumb_func_start NightmarePhase3SlowMovement
NightmarePhase3SlowMovement: @ 0x0805E38C
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _0805E3A8 @ =gSubSpriteData1
	ldrh r2, [r1, #8]
	ldr r0, _0805E3AC @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x80
	adds r4, r1, #0
	cmp r2, r0
	bge _0805E3B0
	adds r0, r2, #1
	strh r0, [r4, #8]
	b _0805E3B2
	.align 2, 0
_0805E3A8: .4byte gSubSpriteData1
_0805E3AC: .4byte gSamusData
_0805E3B0:
	movs r5, #1
_0805E3B2:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	subs r1, #0xc0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0805E3CC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0805E3D0
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _0805E3D6
	.align 2, 0
_0805E3CC: .4byte gPreviousCollisionCheck
_0805E3D0:
	ldrh r0, [r4, #0xa]
	subs r0, #1
	strh r0, [r4, #0xa]
_0805E3D6:
	cmp r5, #2
	bne _0805E3E2
	ldr r0, _0805E3E8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1b
	strb r1, [r0]
_0805E3E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3E8: .4byte gCurrentSprite

	thumb_func_start NightmarePhase3FastMovementInit
NightmarePhase3FastMovementInit: @ 0x0805E3EC
	ldr r3, _0805E414 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2f
	movs r2, #0
	strb r2, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r3, #6]
	bx lr
	.align 2, 0
_0805E414: .4byte gCurrentSprite

	thumb_func_start NightmarePhase3FastMovement
NightmarePhase3FastMovement: @ 0x0805E418
	push {lr}
	sub sp, #4
	ldr r0, _0805E430 @ =gCurrentSprite
	ldrh r0, [r0, #6]
	cmp r0, #0xf0
	bls _0805E43C
	ldr r0, _0805E434 @ =gXParasiteTargetYPosition
	ldrh r2, [r0]
	ldr r0, _0805E438 @ =gXParasiteTargetXPosition
	ldrh r1, [r0]
	b _0805E448
	.align 2, 0
_0805E430: .4byte gCurrentSprite
_0805E434: .4byte gXParasiteTargetYPosition
_0805E438: .4byte gXParasiteTargetXPosition
_0805E43C:
	ldr r1, _0805E464 @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r1, [r1, #0x16]
_0805E448:
	movs r0, #2
	str r0, [sp]
	adds r0, r2, #0
	movs r2, #0x30
	movs r3, #0x30
	bl NightmareMoveToPosition
	ldr r3, _0805E468 @ =gCurrentSprite
	ldrh r0, [r3, #6]
	cmp r0, #0
	beq _0805E46C
	subs r0, #1
	strh r0, [r3, #6]
	b _0805E4B2
	.align 2, 0
_0805E464: .4byte gSamusData
_0805E468: .4byte gCurrentSprite
_0805E46C:
	ldr r2, _0805E4B8 @ =gSubSpriteData1
	ldrh r0, [r2, #0xa]
	lsrs r0, r0, #2
	ldr r1, _0805E4BC @ =gBg1XPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _0805E4C0 @ =0xFF730000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x4a
	bhi _0805E4B2
	ldrh r0, [r2, #8]
	lsrs r0, r0, #2
	ldr r1, _0805E4C4 @ =gBg1YPosition
	ldrh r1, [r1]
	lsrs r1, r1, #2
	subs r0, r0, r1
	lsls r0, r0, #0x10
	ldr r1, _0805E4C8 @ =0xFFEB0000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0x4e
	bhi _0805E4B2
	ldr r0, _0805E4CC @ =gSamusData
	ldrh r1, [r0, #0x16]
	ldrh r0, [r2, #0xa]
	subs r0, #0x40
	cmp r1, r0
	bge _0805E4B2
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0805E4B2:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0805E4B8: .4byte gSubSpriteData1
_0805E4BC: .4byte gBg1XPosition
_0805E4C0: .4byte 0xFF730000
_0805E4C4: .4byte gBg1YPosition
_0805E4C8: .4byte 0xFFEB0000
_0805E4CC: .4byte gSamusData

	thumb_func_start NightmareDeathFlash
NightmareDeathFlash: @ 0x0805E4D0
	push {lr}
	ldr r2, _0805E510 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2f
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805E50A
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805E504
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805E504:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_0805E50A:
	pop {r0}
	bx r0
	.align 2, 0
_0805E510: .4byte gCurrentSprite

	thumb_func_start NightmareMovingToDeathPosition
NightmareMovingToDeathPosition: @ 0x0805E514
	push {r4, r5, r6, r7, lr}
	bl NightmareDeathFlash
	movs r6, #0
	ldr r0, _0805E540 @ =gAbilityRestingYPosition
	ldrh r3, [r0]
	ldr r0, _0805E544 @ =gAbilityRestingXPosition
	ldrh r0, [r0]
	adds r0, #0xc0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0805E548 @ =gSubSpriteData1
	ldrh r0, [r0, #0xa]
	cmp r0, r4
	bhs _0805E550
	ldr r0, _0805E54C @ =gCurrentSprite
	ldrh r2, [r0]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r5, #0
	orrs r1, r2
	b _0805E558
	.align 2, 0
_0805E540: .4byte gAbilityRestingYPosition
_0805E544: .4byte gAbilityRestingXPosition
_0805E548: .4byte gSubSpriteData1
_0805E54C: .4byte gCurrentSprite
_0805E550:
	ldr r0, _0805E574 @ =gCurrentSprite
	ldrh r2, [r0]
	ldr r1, _0805E578 @ =0x0000FDFF
	ands r1, r2
_0805E558:
	strh r1, [r0]
	adds r5, r0, #0
	ldr r0, _0805E57C @ =gSubSpriteData1
	ldrh r1, [r0, #8]
	adds r2, r0, #0
	cmp r1, r3
	bhs _0805E580
	ldrh r1, [r5]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r7, #0
	orrs r0, r1
	b _0805E586
	.align 2, 0
_0805E574: .4byte gCurrentSprite
_0805E578: .4byte 0x0000FDFF
_0805E57C: .4byte gSubSpriteData1
_0805E580:
	ldrh r1, [r5]
	ldr r0, _0805E5A0 @ =0x0000FBFF
	ands r0, r1
_0805E586:
	strh r0, [r5]
	ldrh r1, [r2, #8]
	adds r0, r3, #6
	cmp r1, r0
	bge _0805E5A4
	subs r0, r3, #6
	cmp r1, r0
	ble _0805E5A4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E5BC
	.align 2, 0
_0805E5A0: .4byte 0x0000FBFF
_0805E5A4:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0805E5B6
	ldrh r0, [r2, #8]
	adds r0, #1
	b _0805E5BA
_0805E5B6:
	ldrh r0, [r2, #8]
	subs r0, #1
_0805E5BA:
	strh r0, [r2, #8]
_0805E5BC:
	ldrh r1, [r2, #0xa]
	adds r0, r4, #6
	cmp r1, r0
	bge _0805E5D2
	subs r0, r4, #6
	cmp r1, r0
	ble _0805E5D2
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	b _0805E5EA
_0805E5D2:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805E5E4
	ldrh r0, [r2, #0xa]
	adds r0, #1
	b _0805E5E8
_0805E5E4:
	ldrh r0, [r2, #0xa]
	subs r0, #1
_0805E5E8:
	strh r0, [r2, #0xa]
_0805E5EA:
	cmp r6, #2
	bne _0805E612
	adds r2, r5, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E612
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	movs r0, #0x3c
	strb r0, [r2]
	movs r0, #0xa9
	lsls r0, r0, #2
	bl unk_3b1c
_0805E612:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NightmareTurningIntoCoreX
NightmareTurningIntoCoreX: @ 0x0805E618
	push {r4, r5, lr}
	ldr r4, _0805E650 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2e
	ldrb r0, [r5]
	cmp r0, #0
	beq _0805E654
	bl NightmareDeathFlash
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805E6A2
	ldrh r1, [r4]
	movs r0, #0x20
	movs r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x2c
	strb r2, [r0]
	subs r0, #0xc
	strb r2, [r0]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0805E6A2
	.align 2, 0
_0805E650: .4byte gCurrentSprite
_0805E654:
	ldr r2, _0805E68C @ =gWrittenToMosaic_H
	ldr r1, _0805E690 @ =sXParasiteMosaicValues
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805E67A
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x48
	strb r0, [r4, #0x1d]
_0805E67A:
	ldrh r0, [r4, #6]
	cmp r0, #0x13
	bhi _0805E694
	adds r2, r0, #0
	movs r0, #0x48
	movs r1, #0
	bl SpriteLoadGfx
	b _0805E6A2
	.align 2, 0
_0805E68C: .4byte gWrittenToMosaic_H
_0805E690: .4byte sXParasiteMosaicValues
_0805E694:
	cmp r0, #0x14
	bne _0805E6A2
	movs r0, #0x48
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0805E6A2:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NightmarePartInit
NightmarePartInit: @ 0x0805E6A8
	push {r4, lr}
	ldr r3, _0805E6D8 @ =gCurrentSprite
	ldrh r1, [r3]
	ldr r0, _0805E6DC @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2d
	strb r2, [r0]
	ldrb r0, [r3, #0x1e]
	mov ip, r3
	cmp r0, #0xd
	bls _0805E6CE
	b _0805EAC8
_0805E6CE:
	lsls r0, r0, #2
	ldr r1, _0805E6E0 @ =_0805E6E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805E6D8: .4byte gCurrentSprite
_0805E6DC: .4byte 0x0000FFFB
_0805E6E0: .4byte _0805E6E4
_0805E6E4: @ jump table
	.4byte _0805E71C @ case 0
	.4byte _0805E764 @ case 1
	.4byte _0805E7A8 @ case 2
	.4byte _0805E7F4 @ case 3
	.4byte _0805E844 @ case 4
	.4byte _0805E880 @ case 5
	.4byte _0805E8B8 @ case 6
	.4byte _0805E8F0 @ case 7
	.4byte _0805E928 @ case 8
	.4byte _0805E960 @ case 9
	.4byte _0805EAC8 @ case 10
	.4byte _0805E9D8 @ case 11
	.4byte _0805EA14 @ case 12
	.4byte _0805EA70 @ case 13
_0805E71C:
	mov r2, ip
	adds r2, #0x22
	movs r1, #0
	movs r0, #9
	strb r0, [r2]
	adds r2, #5
	movs r0, #0x10
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x28
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x28
	strb r0, [r1]
	ldr r1, _0805E760 @ =0x0000FFFC
	mov r0, ip
	strh r1, [r0, #0xa]
	movs r2, #4
	movs r0, #4
	mov r3, ip
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	orrs r0, r2
	movs r2, #0
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	b _0805E838
	.align 2, 0
_0805E760: .4byte 0x0000FFFC
_0805E764:
	mov r1, ip
	adds r1, #0x22
	movs r2, #0
	movs r0, #9
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x30
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0805E7A4 @ =0x0000FFFC
	mov r0, ip
	strh r1, [r0, #0xa]
	movs r2, #4
	movs r0, #4
	mov r3, ip
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	orrs r0, r2
	movs r2, #0
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	b _0805E838
	.align 2, 0
_0805E7A4: .4byte 0x0000FFFC
_0805E7A8:
	mov r1, ip
	adds r1, #0x22
	movs r2, #0
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x38
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x28
	strb r0, [r1]
	movs r3, #0
	ldr r1, _0805E7EC @ =0x0000FF60
	mov r0, ip
	strh r1, [r0, #0xa]
	ldr r0, _0805E7F0 @ =0x0000FFB0
	mov r4, ip
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r2, [r4, #0x10]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	b _0805EACE
	.align 2, 0
_0805E7EC: .4byte 0x0000FF60
_0805E7F0: .4byte 0x0000FFB0
_0805E7F4:
	mov r2, ip
	adds r2, #0x22
	movs r1, #0
	movs r0, #0xb
	strb r0, [r2]
	adds r2, #5
	movs r0, #0x38
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x28
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x30
	strb r0, [r1]
	ldr r1, _0805E840 @ =0x0000FFFC
	mov r3, ip
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	movs r2, #0
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	mov r4, ip
	strh r0, [r4]
_0805E838:
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	b _0805EACE
	.align 2, 0
_0805E840: .4byte 0x0000FFFC
_0805E844:
	mov r1, ip
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r2, #0
	ldr r0, _0805E87C @ =0x0000FFC0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r1, #0x20
	mov r3, ip
	strh r1, [r3, #0xc]
	adds r0, #0x20
	strh r0, [r3, #0xe]
	strh r1, [r3, #0x10]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	b _0805EAA4
	.align 2, 0
_0805E87C: .4byte 0x0000FFC0
_0805E880:
	mov r1, ip
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x1a
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805E8B0 @ =0x0000FFA0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #8
	strh r0, [r2, #0xc]
	ldr r0, _0805E8B4 @ =0x0000FFE8
	strh r0, [r2, #0xe]
	movs r0, #0x30
	b _0805EA42
	.align 2, 0
_0805E8B0: .4byte 0x0000FFA0
_0805E8B4: .4byte 0x0000FFE8
_0805E8B8:
	mov r1, ip
	adds r1, #0x22
	movs r0, #6
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805E8E8 @ =0x0000FFA0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #8
	strh r0, [r2, #0xc]
	ldr r0, _0805E8EC @ =0x0000FFE8
	strh r0, [r2, #0xe]
	movs r0, #0x40
	b _0805EA42
	.align 2, 0
_0805E8E8: .4byte 0x0000FFA0
_0805E8EC: .4byte 0x0000FFE8
_0805E8F0:
	mov r1, ip
	adds r1, #0x22
	movs r0, #7
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x1a
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805E920 @ =0x0000FFA0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x10
	strh r0, [r2, #0xc]
	ldr r0, _0805E924 @ =0x0000FFFC
	strh r0, [r2, #0xe]
	movs r0, #0x40
	b _0805EA42
	.align 2, 0
_0805E920: .4byte 0x0000FFA0
_0805E924: .4byte 0x0000FFFC
_0805E928:
	mov r1, ip
	adds r1, #0x22
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x18
	strb r0, [r1]
	movs r1, #0
	ldr r0, _0805E958 @ =0x0000FFC0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x30
	strh r0, [r2, #0xc]
	ldr r0, _0805E95C @ =0x0000FFD0
	strh r0, [r2, #0xe]
	movs r0, #0x48
	b _0805EA42
	.align 2, 0
_0805E958: .4byte 0x0000FFC0
_0805E95C: .4byte 0x0000FFD0
_0805E960:
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xb
	strb r0, [r1]
	adds r1, #5
	movs r0, #4
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	movs r2, #0
	ldr r1, _0805E9CC @ =0x0000FFFC
	mov r0, ip
	strh r1, [r0, #0xa]
	movs r0, #0x60
	mov r3, ip
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	movs r0, #0x80
	strh r0, [r3, #0x10]
	mov r1, ip
	adds r1, #0x35
	movs r0, #3
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	ldrh r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0805E9D0 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	strh r1, [r3, #0x14]
	ldr r0, _0805E9D4 @ =gSubSpriteData1
	strh r1, [r0, #0xc]
	mov r0, ip
	adds r0, #0x2e
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0805EACE
	.align 2, 0
_0805E9CC: .4byte 0x0000FFFC
_0805E9D0: .4byte sSecondarySpriteStats
_0805E9D4: .4byte gSubSpriteData1
_0805E9D8:
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, #6
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	movs r2, #0
	ldr r0, _0805EA10 @ =0x0000FFA0
	mov r1, ip
	strh r0, [r1, #0xa]
	movs r1, #0x20
	mov r3, ip
	strh r1, [r3, #0xc]
	adds r0, #0x50
	strh r0, [r3, #0xe]
	strh r1, [r3, #0x10]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	b _0805EAA4
	.align 2, 0
_0805EA10: .4byte 0x0000FFA0
_0805EA14:
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xe
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, #6
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	movs r1, #0
	ldr r0, _0805EA68 @ =0x0000FFA0
	mov r2, ip
	strh r0, [r2, #0xa]
	movs r0, #0x10
	strh r0, [r2, #0xc]
	ldr r0, _0805EA6C @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x20
_0805EA42:
	strh r0, [r2, #0x10]
	mov r0, ip
	adds r0, #0x25
	strb r1, [r0]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	mov r4, ip
	strh r0, [r4, #0x14]
	b _0805EACE
	.align 2, 0
_0805EA68: .4byte 0x0000FFA0
_0805EA6C: .4byte 0x0000FFF0
_0805EA70:
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xf
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, #6
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x29
	strb r2, [r0]
	movs r1, #0
	ldr r0, _0805EAC4 @ =0x0000FFC0
	mov r3, ip
	strh r0, [r3, #0xa]
	strh r2, [r3, #0xc]
	adds r0, #0x30
	strh r0, [r3, #0xe]
	movs r0, #0x20
	strh r0, [r3, #0x10]
	mov r0, ip
	adds r0, #0x25
	strb r1, [r0]
_0805EAA4:
	ldrh r0, [r3]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #1
	strh r0, [r3, #0x14]
	b _0805EACE
	.align 2, 0
_0805EAC4: .4byte 0x0000FFC0
_0805EAC8:
	movs r0, #0
	mov r1, ip
	strh r0, [r1]
_0805EACE:
	bl NightmareSyncSubSprites
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NightmarePartDying
NightmarePartDying: @ 0x0805EAD8
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0805EB0C @ =gCurrentSprite
	ldrh r3, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	movs r4, #0
	orrs r1, r3
	strh r1, [r2]
	adds r1, r2, #0
	adds r1, #0x25
	strb r4, [r1]
	ldr r3, _0805EB10 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x20
	ldrb r0, [r1]
	adds r2, #0x20
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805EB0C: .4byte gCurrentSprite
_0805EB10: .4byte gSpriteData

	thumb_func_start NightmarePartSpawnBeam
NightmarePartSpawnBeam: @ 0x0805EB14
	push {lr}
	sub sp, #0xc
	ldr r1, _0805EB4C @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	cmp r0, #0xb
	bne _0805EB44
	ldrb r0, [r1, #0x1c]
	cmp r0, #3
	bne _0805EB44
	ldrb r2, [r1, #0x1f]
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x20
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x81
	movs r1, #0
	bl SpriteSpawnSecondary
_0805EB44:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0805EB4C: .4byte gCurrentSprite

	thumb_func_start NightmarePartRightArmTop
NightmarePartRightArmTop: @ 0x0805EB50
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0805EB84 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #2
	beq _0805EB8C
	cmp r0, #0x18
	beq _0805EBC4
	ldr r1, _0805EB88 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805EC0E
	movs r0, #0
	strh r0, [r4]
	b _0805EC0E
	.align 2, 0
_0805EB84: .4byte gCurrentSprite
_0805EB88: .4byte gSpriteData
_0805EB8C:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805EBBC @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _0805EC0E
	ldr r0, _0805EBC0 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	strb r0, [r5]
	b _0805EC0E
	.align 2, 0
_0805EBBC: .4byte gSpriteData
_0805EBC0: .4byte 0x00007FFB
_0805EBC4:
	ldr r1, _0805EC00 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _0805EC04
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r5]
	b _0805EC0E
	.align 2, 0
_0805EC00: .4byte gSpriteData
_0805EC04:
	cmp r0, #0x20
	bne _0805EC0E
	adds r0, r3, #0
	bl NightmarePartDying
_0805EC0E:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmarePartRightArmBottom
NightmarePartRightArmBottom: @ 0x0805EC18
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _0805EC4C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #2
	beq _0805EC54
	cmp r0, #0x18
	beq _0805EC8C
	ldr r1, _0805EC50 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805ECD6
	movs r0, #0
	strh r0, [r4]
	b _0805ECD6
	.align 2, 0
_0805EC4C: .4byte gCurrentSprite
_0805EC50: .4byte gSpriteData
_0805EC54:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805EC84 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _0805ECD6
	ldr r0, _0805EC88 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	strb r0, [r5]
	b _0805ECD6
	.align 2, 0
_0805EC84: .4byte gSpriteData
_0805EC88: .4byte 0x00007FFB
_0805EC8C:
	ldr r1, _0805ECC8 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _0805ECCC
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #4
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r5]
	b _0805ECD6
	.align 2, 0
_0805ECC8: .4byte gSpriteData
_0805ECCC:
	cmp r0, #0x20
	bne _0805ECD6
	adds r0, r3, #0
	bl NightmarePartDying
_0805ECD6:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmarePartRightTurret1
NightmarePartRightTurret1: @ 0x0805ECE0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805ED04 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805ED54
	cmp r1, #0x18
	bgt _0805ED08
	cmp r1, #2
	beq _0805ED14
	b _0805EE64
	.align 2, 0
_0805ED04: .4byte gCurrentSprite
_0805ED08:
	cmp r1, #0x1a
	beq _0805EDB0
	cmp r1, #0x1c
	bne _0805ED12
	b _0805EE1C
_0805ED12:
	b _0805EE64
_0805ED14:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805ED4C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805ED32
	b _0805EE7C
_0805ED32:
	ldr r0, _0805ED50 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x6c
	strb r0, [r1]
	strb r2, [r7]
	b _0805EE7C
	.align 2, 0
_0805ED4C: .4byte gSpriteData
_0805ED50: .4byte 0x00007FFB
_0805ED54:
	ldr r0, _0805ED84 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805EDC2
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805ED78
	b _0805EE7C
_0805ED78:
	ldrb r1, [r1]
	cmp r1, #2
	bne _0805ED8C
	ldr r0, _0805ED88 @ =0x083BDBEC
	b _0805ED9A
	.align 2, 0
_0805ED84: .4byte gSpriteData
_0805ED88: .4byte 0x083BDBEC
_0805ED8C:
	cmp r1, #0x1c
	bne _0805ED98
	ldr r0, _0805ED94 @ =0x083BDBEC
	b _0805ED9A
	.align 2, 0
_0805ED94: .4byte 0x083BDBEC
_0805ED98:
	ldr r0, _0805EDAC @ =0x083BD8E4
_0805ED9A:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805EE7C
	.align 2, 0
_0805EDAC: .4byte 0x083BD8E4
_0805EDB0:
	ldr r0, _0805EDD8 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805EDE0
_0805EDC2:
	ldr r0, _0805EDDC @ =0x083BD874
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805EE7C
	.align 2, 0
_0805EDD8: .4byte gSpriteData
_0805EDDC: .4byte 0x083BD874
_0805EDE0:
	ldr r1, [r4, #0x18]
	ldr r0, _0805EE10 @ =0x083BD8E4
	cmp r1, r0
	bne _0805EDEC
	bl NightmarePartSpawnBeam
_0805EDEC:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805EE7C
	ldr r0, _0805EE14 @ =0x083BD874
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805EE18 @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805EE7C
	.align 2, 0
_0805EE10: .4byte 0x083BD8E4
_0805EE14: .4byte 0x083BD874
_0805EE18: .4byte gBossWork2
_0805EE1C:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805EE60 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805EE7C
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #1
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805EE7C
	.align 2, 0
_0805EE60: .4byte gSpriteData
_0805EE64:
	ldr r1, _0805EE84 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805EE7C
	movs r0, #0
	strh r0, [r4]
_0805EE7C:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805EE84: .4byte gSpriteData

	thumb_func_start NightmarePartRightTurret2
NightmarePartRightTurret2: @ 0x0805EE88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805EEAC @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805EEFC
	cmp r1, #0x18
	bgt _0805EEB0
	cmp r1, #2
	beq _0805EEBC
	b _0805F00C
	.align 2, 0
_0805EEAC: .4byte gCurrentSprite
_0805EEB0:
	cmp r1, #0x1a
	beq _0805EF58
	cmp r1, #0x1c
	bne _0805EEBA
	b _0805EFC4
_0805EEBA:
	b _0805F00C
_0805EEBC:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805EEF4 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805EEDA
	b _0805F024
_0805EEDA:
	ldr r0, _0805EEF8 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x68
	strb r0, [r1]
	strb r2, [r7]
	b _0805F024
	.align 2, 0
_0805EEF4: .4byte gSpriteData
_0805EEF8: .4byte 0x00007FFB
_0805EEFC:
	ldr r0, _0805EF2C @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805EF6A
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805EF20
	b _0805F024
_0805EF20:
	ldrb r1, [r1]
	cmp r1, #2
	bne _0805EF34
	ldr r0, _0805EF30 @ =0x083BDC64
	b _0805EF42
	.align 2, 0
_0805EF2C: .4byte gSpriteData
_0805EF30: .4byte 0x083BDC64
_0805EF34:
	cmp r1, #0x1c
	bne _0805EF40
	ldr r0, _0805EF3C @ =0x083BDC64
	b _0805EF42
	.align 2, 0
_0805EF3C: .4byte 0x083BDC64
_0805EF40:
	ldr r0, _0805EF54 @ =0x083BD95C
_0805EF42:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F024
	.align 2, 0
_0805EF54: .4byte 0x083BD95C
_0805EF58:
	ldr r0, _0805EF80 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805EF88
_0805EF6A:
	ldr r0, _0805EF84 @ =0x083BD884
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F024
	.align 2, 0
_0805EF80: .4byte gSpriteData
_0805EF84: .4byte 0x083BD884
_0805EF88:
	ldr r1, [r4, #0x18]
	ldr r0, _0805EFB8 @ =0x083BD95C
	cmp r1, r0
	bne _0805EF94
	bl NightmarePartSpawnBeam
_0805EF94:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805F024
	ldr r0, _0805EFBC @ =0x083BD884
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805EFC0 @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F024
	.align 2, 0
_0805EFB8: .4byte 0x083BD95C
_0805EFBC: .4byte 0x083BD884
_0805EFC0: .4byte gBossWork2
_0805EFC4:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F008 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F024
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #2
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F024
	.align 2, 0
_0805F008: .4byte gSpriteData
_0805F00C:
	ldr r1, _0805F02C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F024
	movs r0, #0
	strh r0, [r4]
_0805F024:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F02C: .4byte gSpriteData

	thumb_func_start NightmarePartRightTurret3
NightmarePartRightTurret3: @ 0x0805F030
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805F054 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805F0A4
	cmp r1, #0x18
	bgt _0805F058
	cmp r1, #2
	beq _0805F064
	b _0805F1B0
	.align 2, 0
_0805F054: .4byte gCurrentSprite
_0805F058:
	cmp r1, #0x1a
	beq _0805F0F4
	cmp r1, #0x1c
	bne _0805F062
	b _0805F168
_0805F062:
	b _0805F1B0
_0805F064:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805F09C @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805F082
	b _0805F1C8
_0805F082:
	ldr r0, _0805F0A0 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	strb r2, [r7]
	b _0805F1C8
	.align 2, 0
_0805F09C: .4byte gSpriteData
_0805F0A0: .4byte 0x00007FFB
_0805F0A4:
	ldr r0, _0805F0D4 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805F106
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F0C8
	b _0805F1C8
_0805F0C8:
	ldrb r0, [r1]
	cmp r0, #0x1c
	bne _0805F0DC
	ldr r0, _0805F0D8 @ =0x083BDCDC
	b _0805F0DE
	.align 2, 0
_0805F0D4: .4byte gSpriteData
_0805F0D8: .4byte 0x083BDCDC
_0805F0DC:
	ldr r0, _0805F0F0 @ =0x083BD9D4
_0805F0DE:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F1C8
	.align 2, 0
_0805F0F0: .4byte 0x083BD9D4
_0805F0F4:
	ldr r0, _0805F11C @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805F124
_0805F106:
	ldr r0, _0805F120 @ =0x083BD894
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F1C8
	.align 2, 0
_0805F11C: .4byte gSpriteData
_0805F120: .4byte 0x083BD894
_0805F124:
	ldr r1, [r4, #0x18]
	ldr r0, _0805F158 @ =0x083BD9D4
	cmp r1, r0
	bne _0805F130
	bl NightmarePartSpawnBeam
_0805F130:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805F1C8
	ldr r0, _0805F15C @ =0x083BD894
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r2, _0805F160 @ =gBossWork2
	ldr r0, _0805F164 @ =gBossWork3
	ldrb r1, [r0]
	strb r1, [r2]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F1C8
	.align 2, 0
_0805F158: .4byte 0x083BD9D4
_0805F15C: .4byte 0x083BD894
_0805F160: .4byte gBossWork2
_0805F164: .4byte gBossWork3
_0805F168:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F1AC @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F1C8
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #3
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F1C8
	.align 2, 0
_0805F1AC: .4byte gSpriteData
_0805F1B0:
	ldr r1, _0805F1D0 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F1C8
	movs r0, #0
	strh r0, [r4]
_0805F1C8:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F1D0: .4byte gSpriteData

	thumb_func_start NightmarePartLeftTurret1
NightmarePartLeftTurret1: @ 0x0805F1D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805F1F8 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805F248
	cmp r1, #0x18
	bgt _0805F1FC
	cmp r1, #2
	beq _0805F208
	b _0805F358
	.align 2, 0
_0805F1F8: .4byte gCurrentSprite
_0805F1FC:
	cmp r1, #0x1a
	beq _0805F2A4
	cmp r1, #0x1c
	bne _0805F206
	b _0805F310
_0805F206:
	b _0805F358
_0805F208:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805F240 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805F226
	b _0805F370
_0805F226:
	ldr r0, _0805F244 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	strb r2, [r7]
	b _0805F370
	.align 2, 0
_0805F240: .4byte gSpriteData
_0805F244: .4byte 0x00007FFB
_0805F248:
	ldr r0, _0805F278 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805F2B6
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F26C
	b _0805F370
_0805F26C:
	ldrb r1, [r1]
	cmp r1, #2
	bne _0805F280
	ldr r0, _0805F27C @ =0x083BDD54
	b _0805F28E
	.align 2, 0
_0805F278: .4byte gSpriteData
_0805F27C: .4byte 0x083BDD54
_0805F280:
	cmp r1, #0x1c
	bne _0805F28C
	ldr r0, _0805F288 @ =0x083BDD54
	b _0805F28E
	.align 2, 0
_0805F288: .4byte 0x083BDD54
_0805F28C:
	ldr r0, _0805F2A0 @ =0x083BDA4C
_0805F28E:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F370
	.align 2, 0
_0805F2A0: .4byte 0x083BDA4C
_0805F2A4:
	ldr r0, _0805F2CC @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805F2D4
_0805F2B6:
	ldr r0, _0805F2D0 @ =0x083BD8B4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F370
	.align 2, 0
_0805F2CC: .4byte gSpriteData
_0805F2D0: .4byte 0x083BD8B4
_0805F2D4:
	ldr r1, [r4, #0x18]
	ldr r0, _0805F304 @ =0x083BDA4C
	cmp r1, r0
	bne _0805F2E0
	bl NightmarePartSpawnBeam
_0805F2E0:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805F370
	ldr r0, _0805F308 @ =0x083BD8B4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805F30C @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F370
	.align 2, 0
_0805F304: .4byte 0x083BDA4C
_0805F308: .4byte 0x083BD8B4
_0805F30C: .4byte gBossWork2
_0805F310:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F354 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F370
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #5
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F370
	.align 2, 0
_0805F354: .4byte gSpriteData
_0805F358:
	ldr r1, _0805F378 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F370
	movs r0, #0
	strh r0, [r4]
_0805F370:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F378: .4byte gSpriteData

	thumb_func_start NightmarePartLeftTurret2
NightmarePartLeftTurret2: @ 0x0805F37C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805F3A0 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805F3F0
	cmp r1, #0x18
	bgt _0805F3A4
	cmp r1, #2
	beq _0805F3B0
	b _0805F500
	.align 2, 0
_0805F3A0: .4byte gCurrentSprite
_0805F3A4:
	cmp r1, #0x1a
	beq _0805F44C
	cmp r1, #0x1c
	bne _0805F3AE
	b _0805F4B8
_0805F3AE:
	b _0805F500
_0805F3B0:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805F3E8 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805F3CE
	b _0805F518
_0805F3CE:
	ldr r0, _0805F3EC @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x74
	strb r0, [r1]
	strb r2, [r7]
	b _0805F518
	.align 2, 0
_0805F3E8: .4byte gSpriteData
_0805F3EC: .4byte 0x00007FFB
_0805F3F0:
	ldr r0, _0805F420 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805F45E
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F414
	b _0805F518
_0805F414:
	ldrb r1, [r1]
	cmp r1, #2
	bne _0805F428
	ldr r0, _0805F424 @ =0x083BDDCC
	b _0805F436
	.align 2, 0
_0805F420: .4byte gSpriteData
_0805F424: .4byte 0x083BDDCC
_0805F428:
	cmp r1, #0x1c
	bne _0805F434
	ldr r0, _0805F430 @ =0x083BDDCC
	b _0805F436
	.align 2, 0
_0805F430: .4byte 0x083BDDCC
_0805F434:
	ldr r0, _0805F448 @ =0x083BDAC4
_0805F436:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F518
	.align 2, 0
_0805F448: .4byte 0x083BDAC4
_0805F44C:
	ldr r0, _0805F474 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805F47C
_0805F45E:
	ldr r0, _0805F478 @ =0x083BD8C4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F518
	.align 2, 0
_0805F474: .4byte gSpriteData
_0805F478: .4byte 0x083BD8C4
_0805F47C:
	ldr r1, [r4, #0x18]
	ldr r0, _0805F4AC @ =0x083BDAC4
	cmp r1, r0
	bne _0805F488
	bl NightmarePartSpawnBeam
_0805F488:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805F518
	ldr r0, _0805F4B0 @ =0x083BD8C4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805F4B4 @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F518
	.align 2, 0
_0805F4AC: .4byte 0x083BDAC4
_0805F4B0: .4byte 0x083BD8C4
_0805F4B4: .4byte gBossWork2
_0805F4B8:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F4FC @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F518
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #6
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F518
	.align 2, 0
_0805F4FC: .4byte gSpriteData
_0805F500:
	ldr r1, _0805F520 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F518
	movs r0, #0
	strh r0, [r4]
_0805F518:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F520: .4byte gSpriteData

	thumb_func_start NightmarePartLeftTurret3
NightmarePartLeftTurret3: @ 0x0805F524
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r0, _0805F548 @ =gCurrentSprite
	adds r6, r0, #0
	adds r6, #0x23
	ldrb r5, [r6]
	adds r7, r0, #0
	adds r7, #0x24
	ldrb r1, [r7]
	adds r4, r0, #0
	cmp r1, #0x18
	beq _0805F598
	cmp r1, #0x18
	bgt _0805F54C
	cmp r1, #2
	beq _0805F558
	b _0805F69C
	.align 2, 0
_0805F548: .4byte gCurrentSprite
_0805F54C:
	cmp r1, #0x1a
	beq _0805F5E8
	cmp r1, #0x1c
	bne _0805F556
	b _0805F654
_0805F556:
	b _0805F69C
_0805F558:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _0805F590 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0805F576
	b _0805F6B4
_0805F576:
	ldr r0, _0805F594 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r0, r4, #0
	adds r0, #0x25
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x70
	strb r0, [r1]
	strb r2, [r7]
	b _0805F6B4
	.align 2, 0
_0805F590: .4byte gSpriteData
_0805F594: .4byte 0x00007FFB
_0805F598:
	ldr r0, _0805F5C8 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	beq _0805F5FA
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0805F5BC
	b _0805F6B4
_0805F5BC:
	ldrb r0, [r1]
	cmp r0, #0x1c
	bne _0805F5D0
	ldr r0, _0805F5CC @ =0x083BDE44
	b _0805F5D2
	.align 2, 0
_0805F5C8: .4byte gSpriteData
_0805F5CC: .4byte 0x083BDE44
_0805F5D0:
	ldr r0, _0805F5E4 @ =0x083BDB3C
_0805F5D2:
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	b _0805F6B4
	.align 2, 0
_0805F5E4: .4byte 0x083BDB3C
_0805F5E8:
	ldr r0, _0805F610 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x20
	bne _0805F618
_0805F5FA:
	ldr r0, _0805F614 @ =0x083BD8D4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	movs r0, #0x1c
	strb r0, [r7]
	adds r0, r5, #0
	bl NightmarePartDying
	b _0805F6B4
	.align 2, 0
_0805F610: .4byte gSpriteData
_0805F614: .4byte 0x083BD8D4
_0805F618:
	ldr r1, [r4, #0x18]
	ldr r0, _0805F648 @ =0x083BDB3C
	cmp r1, r0
	bne _0805F624
	bl NightmarePartSpawnBeam
_0805F624:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	beq _0805F6B4
	ldr r0, _0805F64C @ =0x083BD8D4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	strh r0, [r4, #0x16]
	ldr r0, _0805F650 @ =gBossWork2
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r7]
	b _0805F6B4
	.align 2, 0
_0805F648: .4byte 0x083BDB3C
_0805F64C: .4byte 0x083BD8D4
_0805F650: .4byte gBossWork2
_0805F654:
	adds r0, r5, #0
	bl NightmarePartDying
	ldr r0, _0805F698 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x22
	bne _0805F6B4
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x49
	movs r1, #7
	movs r2, #0
	bl SpriteSpawnSecondary
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x1e
	strb r0, [r7]
	b _0805F6B4
	.align 2, 0
_0805F698: .4byte gSpriteData
_0805F69C:
	ldr r1, _0805F6BC @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805F6B4
	movs r0, #0
	strh r0, [r4]
_0805F6B4:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F6BC: .4byte gSpriteData

	thumb_func_start NightmarePartEye
NightmarePartEye: @ 0x0805F6C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _0805F6F8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r6, [r0]
	adds r0, #0x13
	ldrb r4, [r0]
	ldr r1, _0805F6FC @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r7, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #0x10
	bne _0805F704
	ldr r0, _0805F700 @ =0x000002A7
	bl SoundPlayNotAlreadyPlaying
	b _0805F70E
	.align 2, 0
_0805F6F8: .4byte gCurrentSprite
_0805F6FC: .4byte gSpriteData
_0805F700: .4byte 0x000002A7
_0805F704:
	cmp r1, #5
	bne _0805F70E
	ldr r0, _0805F72C @ =0x000002AA
	bl SoundPlayNotAlreadyPlaying
_0805F70E:
	ldr r1, _0805F730 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #2
	adds r5, r1, #0
	cmp r0, #0x20
	bls _0805F720
	b _0805FAB8
_0805F720:
	lsls r0, r0, #2
	ldr r1, _0805F734 @ =_0805F738
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805F72C: .4byte 0x000002AA
_0805F730: .4byte gCurrentSprite
_0805F734: .4byte _0805F738
_0805F738: @ jump table
	.4byte _0805F7BC @ case 0
	.4byte _0805FAB8 @ case 1
	.4byte _0805FAB8 @ case 2
	.4byte _0805FAB8 @ case 3
	.4byte _0805FAB8 @ case 4
	.4byte _0805FAB8 @ case 5
	.4byte _0805FAB8 @ case 6
	.4byte _0805FAB8 @ case 7
	.4byte _0805FAB8 @ case 8
	.4byte _0805FAB8 @ case 9
	.4byte _0805FAB8 @ case 10
	.4byte _0805FAB8 @ case 11
	.4byte _0805FAB8 @ case 12
	.4byte _0805FAB8 @ case 13
	.4byte _0805FAB8 @ case 14
	.4byte _0805FAB8 @ case 15
	.4byte _0805FAB8 @ case 16
	.4byte _0805FAB8 @ case 17
	.4byte _0805FAB8 @ case 18
	.4byte _0805FAB8 @ case 19
	.4byte _0805FAB8 @ case 20
	.4byte _0805FAB8 @ case 21
	.4byte _0805F81C @ case 22
	.4byte _0805FAB8 @ case 23
	.4byte _0805F860 @ case 24
	.4byte _0805FAB8 @ case 25
	.4byte _0805F8E8 @ case 26
	.4byte _0805FAB8 @ case 27
	.4byte _0805F94C @ case 28
	.4byte _0805FAB8 @ case 29
	.4byte _0805F9D0 @ case 30
	.4byte _0805FAB8 @ case 31
	.4byte _0805FA40 @ case 32
_0805F7BC:
	ldr r0, _0805F808 @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x1a
	beq _0805F7D0
	b _0805FACC
_0805F7D0:
	ldrh r1, [r5]
	ldr r0, _0805F80C @ =0x0000DFFF
	ands r0, r1
	movs r1, #0
	movs r2, #0
	strh r0, [r5]
	ldr r0, _0805F810 @ =0x083BD5D4
	str r0, [r5, #0x18]
	strb r1, [r5, #0x1c]
	strh r2, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	strh r7, [r5, #0x14]
	ldr r0, _0805F814 @ =gSubSpriteData1
	strh r7, [r0, #0xc]
	ldrh r0, [r5, #2]
	subs r0, #0x80
	ldrh r1, [r5, #4]
	subs r1, #0x50
	movs r2, #0x3a
	bl ParticleSet
	ldr r0, _0805F818 @ =0x000002A9
	bl unk_3b1c
	b _0805FACC
	.align 2, 0
_0805F808: .4byte gSpriteData
_0805F80C: .4byte 0x0000DFFF
_0805F810: .4byte 0x083BD5D4
_0805F814: .4byte gSubSpriteData1
_0805F818: .4byte 0x000002A9
_0805F81C:
	ldr r1, _0805F854 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r6, r0, r1
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r1, _0805F858 @ =gSubSpriteData1
	ldrh r0, [r5, #0x14]
	strh r0, [r1, #0xc]
	ldrh r4, [r1, #0xc]
	lsls r0, r7, #1
	movs r1, #3
	bl __divsi3
	cmp r4, r0
	blt _0805F848
	b _0805FACC
_0805F848:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _0805F85C @ =0x083BD754
	b _0805F920
	.align 2, 0
_0805F854: .4byte gSpriteData
_0805F858: .4byte gSubSpriteData1
_0805F85C: .4byte 0x083BD754
_0805F860:
	ldr r0, _0805F8D4 @ =gSpriteData
	mov sb, r0
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r6, r0, #3
	mov r1, sb
	adds r4, r6, r1
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	movs r2, #0
	mov r8, r2
	strb r1, [r0]
	ldr r1, _0805F8D8 @ =gSubSpriteData1
	ldrh r0, [r5, #0x14]
	movs r7, #0
	strh r0, [r1, #0xc]
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _0805F894
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
_0805F894:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	bne _0805F89E
	b _0805FACC
_0805F89E:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _0805F8DC @ =0x083BD654
	str r0, [r5, #0x18]
	strb r7, [r5, #0x1c]
	mov r0, r8
	strh r0, [r5, #0x16]
	mov r0, sb
	adds r0, #0x18
	adds r0, r6, r0
	ldr r1, _0805F8E0 @ =0x083BD67C
	str r1, [r0]
	strb r7, [r4, #0x1c]
	mov r1, r8
	strh r1, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805F8E4 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	b _0805FACC
	.align 2, 0
_0805F8D4: .4byte gSpriteData
_0805F8D8: .4byte gSubSpriteData1
_0805F8DC: .4byte 0x083BD654
_0805F8E0: .4byte 0x083BD67C
_0805F8E4: .4byte 0x0000FFFB
_0805F8E8:
	ldr r1, _0805F93C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r6, r0, r1
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	strb r1, [r0]
	ldr r0, _0805F940 @ =gSubSpriteData1
	ldrh r4, [r5, #0x14]
	strh r4, [r0, #0xc]
	adds r0, r7, #0
	movs r1, #3
	bl __udivsi3
	lsls r4, r4, #0x10
	lsls r0, r0, #0x10
	cmp r4, r0
	blo _0805F916
	b _0805FACC
_0805F916:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _0805F944 @ =0x083BD76C
_0805F920:
	str r0, [r5, #0x18]
	movs r0, #0
	strb r0, [r5, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x16]
	ldrh r0, [r6]
	movs r1, #4
	orrs r0, r1
	strh r0, [r6]
	ldr r0, _0805F948 @ =0x000002AD
	bl SoundPlay
	b _0805FACC
	.align 2, 0
_0805F93C: .4byte gSpriteData
_0805F940: .4byte gSubSpriteData1
_0805F944: .4byte 0x083BD76C
_0805F948: .4byte 0x000002AD
_0805F94C:
	ldr r2, _0805F9BC @ =gSpriteData
	mov sb, r2
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r6, r0, #3
	adds r4, r6, r2
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x20
	movs r2, #0
	mov r8, r2
	strb r1, [r0]
	ldr r1, _0805F9C0 @ =gSubSpriteData1
	ldrh r0, [r5, #0x14]
	movs r7, #0
	strh r0, [r1, #0xc]
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _0805F97E
	adds r1, r5, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
_0805F97E:
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	bne _0805F988
	b _0805FACC
_0805F988:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	ldr r0, _0805F9C4 @ =0x083BD6D4
	str r0, [r5, #0x18]
	strb r7, [r5, #0x1c]
	mov r0, r8
	strh r0, [r5, #0x16]
	mov r0, sb
	adds r0, #0x18
	adds r0, r6, r0
	ldr r1, _0805F9C8 @ =0x083BD6FC
	str r1, [r0]
	strb r7, [r4, #0x1c]
	mov r1, r8
	strh r1, [r4, #0x16]
	ldrh r1, [r4]
	ldr r0, _0805F9CC @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #2
	strb r0, [r1]
	b _0805FACC
	.align 2, 0
_0805F9BC: .4byte gSpriteData
_0805F9C0: .4byte gSubSpriteData1
_0805F9C4: .4byte 0x083BD6D4
_0805F9C8: .4byte 0x083BD6FC
_0805F9CC: .4byte 0x0000FFFB
_0805F9D0:
	ldr r2, _0805FA38 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, #0x20
	strb r1, [r0]
	ldr r1, _0805FA3C @ =gSubSpriteData1
	ldrh r0, [r5, #0x14]
	movs r3, #0
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0805FACC
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x2e
	strb r3, [r0]
	subs r0, #2
	strb r3, [r0]
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r2
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	adds r0, r2, #0
	adds r0, #0x25
	strb r3, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x50
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r3, [r0]
	b _0805FACC
	.align 2, 0
_0805FA38: .4byte gSpriteData
_0805FA3C: .4byte gSubSpriteData1
_0805FA40:
	adds r2, r5, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805FA76
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805FA70
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r5, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805FA70:
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
_0805FA76:
	ldr r2, _0805FAB4 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FAA0
	adds r1, r5, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x24
	strb r0, [r1]
	ldrh r1, [r5]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r5]
_0805FAA0:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r1, [r1]
	adds r0, #0x20
	strb r1, [r0]
	b _0805FACC
	.align 2, 0
_0805FAB4: .4byte gSpriteData
_0805FAB8:
	ldr r0, _0805FAD8 @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x48
	bne _0805FACC
	movs r0, #0
	strh r0, [r5]
_0805FACC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805FAD8: .4byte gSpriteData

	thumb_func_start NightmarePartMouth
NightmarePartMouth: @ 0x0805FADC
	push {r4, r5, lr}
	ldr r3, _0805FB0C @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r4, [r0]
	adds r5, r3, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #2
	beq _0805FB14
	cmp r0, #0x18
	beq _0805FB54
	ldr r0, _0805FB10 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x48
	bne _0805FB94
	movs r0, #0
	strh r0, [r3]
	b _0805FB94
	.align 2, 0
_0805FB0C: .4byte gCurrentSprite
_0805FB10: .4byte gSpriteData
_0805FB14:
	ldr r0, _0805FB48 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r4, r1, #0
	adds r4, #0x24
	ldrb r0, [r4]
	cmp r0, #0x1a
	bne _0805FB94
	ldrh r1, [r3]
	ldr r0, _0805FB4C @ =0x0000DFFF
	ands r0, r1
	movs r1, #0
	movs r2, #0
	strh r0, [r3]
	ldr r0, _0805FB50 @ =0x083BD5FC
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r2, [r3, #0x16]
	movs r0, #0x18
	strb r0, [r5]
	movs r0, #0x1e
	strb r0, [r4]
	b _0805FB94
	.align 2, 0
_0805FB48: .4byte gSpriteData
_0805FB4C: .4byte 0x0000DFFF
_0805FB50: .4byte 0x083BD5FC
_0805FB54:
	ldrh r0, [r3, #0x16]
	cmp r0, #0
	bne _0805FB68
	ldrb r0, [r3, #0x1c]
	cmp r0, #1
	bne _0805FB68
	movs r0, #0xab
	lsls r0, r0, #2
	bl SoundPlay
_0805FB68:
	ldr r1, _0805FB9C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FB94
	ldr r2, _0805FBA0 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x24
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r2]
_0805FB94:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FB9C: .4byte gSpriteData
_0805FBA0: .4byte gCurrentSprite

	thumb_func_start NightmarePartEyeSludge
NightmarePartEyeSludge: @ 0x0805FBA4
	push {r4, r5, r6, lr}
	ldr r2, _0805FBD4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r4, [r0]
	ldr r1, _0805FBD8 @ =sSecondarySpriteStats
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r3, [r0]
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #2
	adds r5, r2, #0
	cmp r0, #0x1c
	bls _0805FBC8
	b _0805FD86
_0805FBC8:
	lsls r0, r0, #2
	ldr r1, _0805FBDC @ =_0805FBE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805FBD4: .4byte gCurrentSprite
_0805FBD8: .4byte sSecondarySpriteStats
_0805FBDC: .4byte _0805FBE0
_0805FBE0: @ jump table
	.4byte _0805FC54 @ case 0
	.4byte _0805FD86 @ case 1
	.4byte _0805FD86 @ case 2
	.4byte _0805FD86 @ case 3
	.4byte _0805FD86 @ case 4
	.4byte _0805FD86 @ case 5
	.4byte _0805FD86 @ case 6
	.4byte _0805FD86 @ case 7
	.4byte _0805FD86 @ case 8
	.4byte _0805FD86 @ case 9
	.4byte _0805FD86 @ case 10
	.4byte _0805FD86 @ case 11
	.4byte _0805FD86 @ case 12
	.4byte _0805FD86 @ case 13
	.4byte _0805FD86 @ case 14
	.4byte _0805FD86 @ case 15
	.4byte _0805FD86 @ case 16
	.4byte _0805FD86 @ case 17
	.4byte _0805FD86 @ case 18
	.4byte _0805FD86 @ case 19
	.4byte _0805FD86 @ case 20
	.4byte _0805FD86 @ case 21
	.4byte _0805FC90 @ case 22
	.4byte _0805FD86 @ case 23
	.4byte _0805FCC8 @ case 24
	.4byte _0805FD86 @ case 25
	.4byte _0805FD10 @ case 26
	.4byte _0805FD86 @ case 27
	.4byte _0805FD58 @ case 28
_0805FC54:
	ldr r0, _0805FC84 @ =gSubSpriteData1
	ldrh r4, [r0, #0xc]
	lsls r0, r3, #1
	movs r1, #3
	bl __divsi3
	cmp r4, r0
	blt _0805FC66
	b _0805FD9E
_0805FC66:
	ldrh r1, [r5]
	ldr r0, _0805FC88 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	movs r2, #0
	strh r0, [r5]
	ldr r0, _0805FC8C @ =0x083BD4EC
	str r0, [r5, #0x18]
	strb r1, [r5, #0x1c]
	strh r2, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	b _0805FD00
	.align 2, 0
_0805FC84: .4byte gSubSpriteData1
_0805FC88: .4byte 0x0000FFFB
_0805FC8C: .4byte 0x083BD4EC
_0805FC90:
	ldr r4, _0805FCC0 @ =gSubSpriteData1
	adds r0, r3, #0
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r4, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	blo _0805FCA6
	b _0805FD9E
_0805FCA6:
	ldr r0, _0805FCC4 @ =0x083BD51C
	str r0, [r5, #0x18]
	movs r0, #0
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0x1a
	b _0805FD00
	.align 2, 0
_0805FCC0: .4byte gSubSpriteData1
_0805FCC4: .4byte 0x083BD51C
_0805FCC8:
	ldr r0, _0805FCE4 @ =gSubSpriteData1
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	bne _0805FCE8
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #0x50
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0x1c
	b _0805FD00
	.align 2, 0
_0805FCE4: .4byte gSubSpriteData1
_0805FCE8:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805FD9E
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	movs r0, #0x78
_0805FD00:
	strb r0, [r1]
	ldr r0, _0805FD0C @ =0x000002AB
	bl SoundPlay
	b _0805FD9E
	.align 2, 0
_0805FD0C: .4byte 0x000002AB
_0805FD10:
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805FD30
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	movs r0, #0x50
	strb r0, [r6]
	ldr r0, _0805FD50 @ =0x000002AB
	bl SoundPlay
_0805FD30:
	ldr r0, _0805FD54 @ =gSpriteData
	lsls r1, r4, #3
	subs r1, r1, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x19
	bne _0805FD9E
	adds r0, r5, #0
	adds r0, #0x24
	movs r1, #0x1e
	strb r1, [r0]
	movs r0, #0x50
	strb r0, [r6]
	b _0805FD9E
	.align 2, 0
_0805FD50: .4byte 0x000002AB
_0805FD54: .4byte gSpriteData
_0805FD58:
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805FD9E
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	b _0805FD9E
_0805FD86:
	ldr r1, _0805FDA4 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FD9E
	movs r0, #0
	strh r0, [r5]
_0805FD9E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FDA4: .4byte gSpriteData

	thumb_func_start NightmarePartChinSludge
NightmarePartChinSludge: @ 0x0805FDA8
	push {r4, r5, r6, lr}
	ldr r2, _0805FDD4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldr r1, _0805FDD8 @ =sSecondarySpriteStats
	ldrb r0, [r2, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r6, r2, #0
	adds r6, #0x24
	ldrb r1, [r6]
	adds r5, r2, #0
	cmp r1, #0x18
	beq _0805FE0C
	cmp r1, #0x18
	bgt _0805FDDC
	cmp r1, #2
	beq _0805FDE6
	b _0805FEC0
	.align 2, 0
_0805FDD4: .4byte gCurrentSprite
_0805FDD8: .4byte sSecondarySpriteStats
_0805FDDC:
	cmp r1, #0x1a
	beq _0805FE44
	cmp r1, #0x1c
	beq _0805FE80
	b _0805FEC0
_0805FDE6:
	ldr r4, _0805FE08 @ =gSubSpriteData1
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r4, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhs _0805FED8
	adds r0, r5, #0
	adds r0, #0x2e
	movs r1, #0x78
	strb r1, [r0]
	movs r0, #0x18
	strb r0, [r6]
	b _0805FED8
	.align 2, 0
_0805FE08: .4byte gSubSpriteData1
_0805FE0C:
	adds r3, r5, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0805FED8
	ldrh r1, [r5]
	ldr r0, _0805FE3C @ =0x0000FFFB
	ands r0, r1
	movs r1, #0
	strh r0, [r5]
	ldr r0, _0805FE40 @ =0x083BD574
	str r0, [r5, #0x18]
	strb r1, [r5, #0x1c]
	strh r2, [r5, #0x16]
	movs r0, #0x1a
	strb r0, [r6]
	movs r0, #0x64
	strb r0, [r3]
	b _0805FED8
	.align 2, 0
_0805FE3C: .4byte 0x0000FFFB
_0805FE40: .4byte 0x083BD574
_0805FE44:
	adds r2, r5, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0805FE5E
	strb r0, [r5, #0x1c]
	strh r0, [r5, #0x16]
	movs r0, #0x64
	strb r0, [r2]
_0805FE5E:
	ldr r0, _0805FE7C @ =gSpriteData
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x19
	bne _0805FED8
	movs r0, #0x1c
	strb r0, [r6]
	movs r0, #0x50
	strb r0, [r2]
	b _0805FED8
	.align 2, 0
_0805FE7C: .4byte gSpriteData
_0805FE80:
	ldrh r0, [r5]
	movs r1, #4
	eors r0, r1
	strh r0, [r5]
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0805FED8
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
	movs r0, #0x1e
	strb r0, [r6]
	ldr r1, _0805FEBC @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0x1a
	strb r1, [r0]
	b _0805FED8
	.align 2, 0
_0805FEBC: .4byte gSpriteData
_0805FEC0:
	ldr r1, _0805FEE0 @ =gSpriteData
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0805FED8
	movs r0, #0
	strh r0, [r5]
_0805FED8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805FEE0: .4byte gSpriteData

	thumb_func_start NightmarePartGeneratorUpdateGlowingPalette
NightmarePartGeneratorUpdateGlowingPalette: @ 0x0805FEE4
	push {r4, r5, lr}
	ldr r3, _0805FF24 @ =gCurrentSprite
	movs r0, #0x2e
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	movs r4, #7
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0805FF14
	ldr r2, _0805FF28 @ =0x083B73DA
	adds r5, r3, #0
	adds r5, #0x2f
	ldrb r1, [r5]
	adds r0, r4, #0
	ands r0, r1
	adds r0, r0, r2
	ldrb r2, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	strb r2, [r0]
	adds r1, #1
	strb r1, [r5]
_0805FF14:
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805FF24: .4byte gCurrentSprite
_0805FF28: .4byte 0x083B73DA

	thumb_func_start NightmarePartGeneratorUpdateDyingPalette
NightmarePartGeneratorUpdateDyingPalette: @ 0x0805FF2C
	push {lr}
	ldr r2, _0805FF6C @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r1, r0, #1
	strb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0805FF66
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0805FF60
	adds r0, r2, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xd
	subs r1, r1, r0
_0805FF60:
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
_0805FF66:
	pop {r0}
	bx r0
	.align 2, 0
_0805FF6C: .4byte gCurrentSprite

	thumb_func_start NightmarePartGenerator
NightmarePartGenerator: @ 0x0805FF70
	push {r4, r5, r6, r7, lr}
	ldr r0, _0805FF90 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r6, [r1]
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r1, #0x7f
	ands r1, r0
	cmp r1, #0x10
	bne _0805FF98
	ldr r0, _0805FF94 @ =0x000002A7
	bl SoundPlayNotAlreadyPlaying
	b _0805FFA2
	.align 2, 0
_0805FF90: .4byte gCurrentSprite
_0805FF94: .4byte 0x000002A7
_0805FF98:
	cmp r1, #5
	bne _0805FFA2
	ldr r0, _0805FFC0 @ =0x000002AA
	bl SoundPlayNotAlreadyPlaying
_0805FFA2:
	ldr r1, _0805FFC4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #1
	adds r4, r1, #0
	cmp r0, #0x1f
	bls _0805FFB4
	b _08060330
_0805FFB4:
	lsls r0, r0, #2
	ldr r1, _0805FFC8 @ =_0805FFCC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805FFC0: .4byte 0x000002AA
_0805FFC4: .4byte gCurrentSprite
_0805FFC8: .4byte _0805FFCC
_0805FFCC: @ jump table
	.4byte _0806004C @ case 0
	.4byte _08060088 @ case 1
	.4byte _08060330 @ case 2
	.4byte _08060330 @ case 3
	.4byte _08060330 @ case 4
	.4byte _08060330 @ case 5
	.4byte _08060330 @ case 6
	.4byte _08060330 @ case 7
	.4byte _08060330 @ case 8
	.4byte _08060330 @ case 9
	.4byte _08060330 @ case 10
	.4byte _08060330 @ case 11
	.4byte _08060330 @ case 12
	.4byte _08060330 @ case 13
	.4byte _08060330 @ case 14
	.4byte _08060330 @ case 15
	.4byte _08060330 @ case 16
	.4byte _08060330 @ case 17
	.4byte _08060330 @ case 18
	.4byte _08060330 @ case 19
	.4byte _08060330 @ case 20
	.4byte _08060330 @ case 21
	.4byte _08060330 @ case 22
	.4byte _0806010C @ case 23
	.4byte _08060330 @ case 24
	.4byte _08060188 @ case 25
	.4byte _08060330 @ case 26
	.4byte _080601F4 @ case 27
	.4byte _08060330 @ case 28
	.4byte _0806029C @ case 29
	.4byte _08060330 @ case 30
	.4byte _080602C4 @ case 31
_0806004C:
	ldrh r1, [r4]
	movs r0, #4
	adds r2, r1, #0
	eors r2, r0
	strh r2, [r4]
	ldr r1, _08060080 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	beq _0806006A
	b _08060348
_0806006A:
	ldr r0, _08060084 @ =0x00007FFB
	ands r2, r0
	strh r2, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0x18
	strb r0, [r1]
	subs r1, #1
	movs r0, #2
	strb r0, [r1]
	b _08060348
	.align 2, 0
_08060080: .4byte gSpriteData
_08060084: .4byte 0x00007FFB
_08060088:
	bl NightmarePartGeneratorUpdateGlowingPalette
	ldr r2, _080600EC @ =gSubSpriteData1
	ldr r5, _080600F0 @ =gCurrentSprite
	ldrh r0, [r5, #0x14]
	movs r7, #0
	strh r0, [r2, #0xc]
	ldr r1, _080600F4 @ =sSecondarySpriteStats
	ldrb r0, [r5, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r4, [r2, #0xc]
	lsls r0, r0, #2
	movs r1, #5
	bl __divsi3
	cmp r4, r0
	blt _080600B0
	b _08060348
_080600B0:
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _080600F8 @ =0x083BD844
	str r0, [r5, #0x18]
	strb r7, [r5, #0x1c]
	movs r0, #0
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r7, [r0]
	ldr r1, _080600FC @ =gSamusPhysics
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, _08060100 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0x3b
	strb r1, [r0]
	ldr r1, _08060104 @ =gBossWork3
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08060108 @ =0x000002A5
	bl SoundPlay
	b _08060348
	.align 2, 0
_080600EC: .4byte gSubSpriteData1
_080600F0: .4byte gCurrentSprite
_080600F4: .4byte sSecondarySpriteStats
_080600F8: .4byte 0x083BD844
_080600FC: .4byte gSamusPhysics
_08060100: .4byte gSpriteData
_08060104: .4byte gBossWork3
_08060108: .4byte 0x000002A5
_0806010C:
	bl NightmareMakeMissilesFall
	bl NightmarePartGeneratorUpdateGlowingPalette
	ldr r0, _0806013C @ =gSubSpriteData1
	ldr r4, _08060140 @ =gCurrentSprite
	ldrh r1, [r4, #0x14]
	strh r1, [r0, #0xc]
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	bne _08060126
	b _08060348
_08060126:
	movs r0, #0
	strb r0, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08060148
	ldr r0, _08060144 @ =0x083BD824
	b _0806017A
	.align 2, 0
_0806013C: .4byte gSubSpriteData1
_08060140: .4byte gCurrentSprite
_08060144: .4byte 0x083BD824
_08060148:
	cmp r0, #1
	bne _08060154
	ldr r0, _08060150 @ =0x083BD804
	b _0806017A
	.align 2, 0
_08060150: .4byte 0x083BD804
_08060154:
	cmp r0, #2
	bne _08060160
	ldr r0, _0806015C @ =0x083BD7E4
	b _0806017A
	.align 2, 0
_0806015C: .4byte 0x083BD7E4
_08060160:
	cmp r0, #3
	beq _08060178
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x1a
	strb r1, [r0]
	ldr r0, _08060174 @ =0x083BD7A4
	str r0, [r4, #0x18]
	b _08060348
	.align 2, 0
_08060174: .4byte 0x083BD7A4
_08060178:
	ldr r0, _08060180 @ =0x083BD7C4
_0806017A:
	str r0, [r4, #0x18]
	ldr r1, _08060184 @ =gCurrentSprite
	b _0806028E
	.align 2, 0
_08060180: .4byte 0x083BD7C4
_08060184: .4byte gCurrentSprite
_08060188:
	bl NightmareMakeMissilesFall
	bl NightmarePartGeneratorUpdateGlowingPalette
	ldr r1, _080601DC @ =gSubSpriteData1
	ldr r2, _080601E0 @ =gCurrentSprite
	ldrh r0, [r2, #0x14]
	movs r3, #0
	strh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080601A4
	b _08060348
_080601A4:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2e
	strb r3, [r0]
	subs r0, #1
	strb r3, [r0]
	ldr r0, _080601E4 @ =0x083BD7C4
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	ldr r2, _080601E8 @ =0x080A8CDC
	ldr r0, _080601EC @ =0x080A8D3C
	ldr r1, _080601F0 @ =0x0000152C
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0x78
	bl ApplyMusicSoundFading
	b _08060348
	.align 2, 0
_080601DC: .4byte gSubSpriteData1
_080601E0: .4byte gCurrentSprite
_080601E4: .4byte 0x083BD7C4
_080601E8: .4byte 0x080A8CDC
_080601EC: .4byte 0x080A8D3C
_080601F0: .4byte 0x0000152C
_080601F4:
	bl NightmareMakeMissilesFall
	bl NightmarePartGeneratorUpdateDyingPalette
	bl SpriteUtilCheckEndOfCurrentSpriteAnimation
	cmp r0, #0
	bne _08060206
	b _08060348
_08060206:
	ldr r1, _08060220 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	movs r3, #0
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	adds r4, r1, #0
	cmp r0, #0
	bne _08060228
	ldr r0, _08060224 @ =0x083BD7E4
	b _0806028A
	.align 2, 0
_08060220: .4byte gCurrentSprite
_08060224: .4byte 0x083BD7E4
_08060228:
	cmp r0, #1
	bne _08060234
	ldr r0, _08060230 @ =0x083BD804
	b _0806028A
	.align 2, 0
_08060230: .4byte 0x083BD804
_08060234:
	cmp r0, #2
	bne _08060240
	ldr r0, _0806023C @ =0x083BD824
	b _0806028A
	.align 2, 0
_0806023C: .4byte 0x083BD824
_08060240:
	cmp r0, #3
	beq _08060288
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
	ldr r0, _08060278 @ =0x083BD794
	str r0, [r4, #0x18]
	movs r0, #0x3c
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	ldr r1, _0806027C @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
	ldr r0, _08060280 @ =gSamusPhysics
	strb r3, [r0]
	ldr r1, _08060284 @ =gBossWork3
	movs r0, #0x64
	strb r0, [r1]
	b _08060348
	.align 2, 0
_08060278: .4byte 0x083BD794
_0806027C: .4byte gSpriteData
_08060280: .4byte gSamusPhysics
_08060284: .4byte gBossWork3
_08060288:
	ldr r0, _08060298 @ =0x083BD844
_0806028A:
	str r0, [r4, #0x18]
	adds r1, r4, #0
_0806028E:
	adds r1, #0x2d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08060348
	.align 2, 0
_08060298: .4byte 0x083BD844
_0806029C:
	bl NightmarePartGeneratorUpdateDyingPalette
	ldr r0, _080602BC @ =gSpriteData
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x19
	bne _08060348
	ldr r0, _080602C0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x20
	strb r1, [r0]
	b _08060348
	.align 2, 0
_080602BC: .4byte gSpriteData
_080602C0: .4byte gCurrentSprite
_080602C4:
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bhi _08060306
	ldrh r0, [r4]
	movs r1, #4
	eors r1, r0
	strh r1, [r4]
	ldrb r0, [r2]
	cmp r0, #0
	bne _08060348
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r1, r0
	strh r1, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x22
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x50
	movs r2, #0x30
	bl ParticleSet
	b _08060348
_08060306:
	cmp r0, #0x1e
	bne _0806032A
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	adds r1, #0x40
	movs r2, #0x3a
	bl ParticleSet
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	movs r0, #0xaa
	lsls r0, r0, #2
	bl unk_3b1c
	b _08060348
_0806032A:
	bl NightmarePartGeneratorUpdateDyingPalette
	b _08060348
_08060330:
	ldr r1, _0806035C @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08060348
	movs r0, #0
	strh r0, [r4]
_08060348:
	ldr r0, _08060360 @ =gSamusPhysics
	ldrb r0, [r0]
	cmp r0, #0x80
	bne _08060354
	bl NightmareReduceSamusXVelocity
_08060354:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806035C: .4byte gSpriteData
_08060360: .4byte gSamusPhysics

	thumb_func_start NightmareBeamInit
NightmareBeamInit: @ 0x08060364
	push {r4, r5, lr}
	ldr r0, _080603DC @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0]
	ldr r1, _080603E0 @ =0x0000FFFB
	ands r1, r0
	movs r4, #0
	movs r5, #0
	mov r3, ip
	adds r3, #0x34
	ldrb r2, [r3]
	movs r0, #4
	orrs r0, r2
	strb r0, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r1, r0
	mov r0, ip
	strh r1, [r0]
	adds r0, #0x27
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	mov r2, ip
	adds r2, #0x29
	movs r0, #0x10
	strb r0, [r2]
	ldr r0, _080603E4 @ =0x0000FFF8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	subs r0, #0x18
	strh r0, [r2, #0xe]
	movs r0, #0x20
	strh r0, [r2, #0x10]
	ldr r0, _080603E8 @ =0x083BD59C
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r5, [r2, #0x16]
	mov r0, ip
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	adds r2, #0x22
	movs r0, #3
	strb r0, [r2]
	adds r2, #3
	movs r0, #0x18
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x35
	strb r1, [r0]
	ldr r0, _080603EC @ =0x000002A2
	bl SoundPlay
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080603DC: .4byte gCurrentSprite
_080603E0: .4byte 0x0000FFFB
_080603E4: .4byte 0x0000FFF8
_080603E8: .4byte 0x083BD59C
_080603EC: .4byte 0x000002A2

	thumb_func_start NightmareBeamMoving
NightmareBeamMoving: @ 0x080603F0
	ldr r1, _080603FC @ =gCurrentSprite
	ldrh r0, [r1, #4]
	subs r0, #0x14
	strh r0, [r1, #4]
	bx lr
	.align 2, 0
_080603FC: .4byte gCurrentSprite

	thumb_func_start NightmareFallingArmInit
NightmareFallingArmInit: @ 0x08060400
	push {r4, lr}
	ldr r0, _08060474 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08060478 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r4, #0
	mov r1, ip
	strh r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #4
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x22
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0806047C @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	ldr r1, _08060480 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	strh r4, [r2, #0x14]
	ldrb r0, [r2, #0x1e]
	mov r3, ip
	cmp r0, #7
	bls _08060468
	b _080605CC
_08060468:
	lsls r0, r0, #2
	ldr r1, _08060484 @ =_08060488
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08060474: .4byte gCurrentSprite
_08060478: .4byte 0x0000FFFB
_0806047C: .4byte gIoRegisters
_08060480: .4byte 0x0000FFFC
_08060484: .4byte _08060488
_08060488: @ jump table
	.4byte _080604A8 @ case 0
	.4byte _080604D4 @ case 1
	.4byte _080604DC @ case 2
	.4byte _080604FC @ case 3
	.4byte _0806051C @ case 4
	.4byte _08060548 @ case 5
	.4byte _08060574 @ case 6
	.4byte _080605A0 @ case 7
_080604A8:
	ldr r0, _080604D0 @ =0x083BD864
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #2
	strb r0, [r1]
	subs r1, #2
	movs r0, #0xa
	strb r0, [r1]
	b _080605D0
	.align 2, 0
_080604D0: .4byte 0x083BD864
_080604D4:
	ldr r0, _080604D8 @ =0x083BD874
	b _0806054A
	.align 2, 0
_080604D8: .4byte 0x083BD874
_080604DC:
	ldr r0, _080604F8 @ =0x083BD884
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	b _08060590
	.align 2, 0
_080604F8: .4byte 0x083BD884
_080604FC:
	ldr r0, _08060518 @ =0x083BD894
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #0x1c
	strb r0, [r1]
	adds r1, #1
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x20
	strb r0, [r1]
	adds r1, #7
	b _080605BC
	.align 2, 0
_08060518: .4byte 0x083BD894
_0806051C:
	ldr r0, _08060544 @ =0x083BD8A4
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x29
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #7
	movs r0, #6
	strb r0, [r1]
	subs r1, #2
	movs r0, #2
	strb r0, [r1]
	b _080605D0
	.align 2, 0
_08060544: .4byte 0x083BD8A4
_08060548:
	ldr r0, _08060570 @ =0x083BD8B4
_0806054A:
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	movs r2, #8
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #3
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	b _080605D0
	.align 2, 0
_08060570: .4byte 0x083BD8B4
_08060574:
	ldr r0, _0806059C @ =0x083BD8C4
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x28
	movs r0, #8
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x29
	strb r2, [r0]
	adds r1, #8
_08060590:
	movs r0, #4
	strb r0, [r1]
	subs r1, #2
	movs r0, #6
	strb r0, [r1]
	b _080605D0
	.align 2, 0
_0806059C: .4byte 0x083BD8C4
_080605A0:
	ldr r0, _080605C8 @ =0x083BD8D4
	str r0, [r3, #0x18]
	adds r0, r3, #0
	adds r0, #0x27
	movs r2, #0x18
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x28
	movs r0, #0xa
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x29
	strb r2, [r0]
	adds r1, #8
_080605BC:
	movs r0, #5
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	b _080605D0
	.align 2, 0
_080605C8: .4byte 0x083BD8D4
_080605CC:
	mov r0, ip
	strh r4, [r0]
_080605D0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmareFallingArmMoving
NightmareFallingArmMoving: @ 0x080605D8
	push {r4, r5, r6, lr}
	ldr r1, _0806060C @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	adds r2, r1, #0
	cmp r0, #0
	beq _0806061E
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0806067A
	ldrb r0, [r2, #0x1e]
	cmp r0, #0
	beq _080605FC
	cmp r0, #5
	bne _08060610
_080605FC:
	ldrh r0, [r2, #2]
	subs r0, #0x50
	ldrh r1, [r2, #4]
	movs r2, #0x3a
	bl ParticleSet
	b _0806067A
	.align 2, 0
_0806060C: .4byte gCurrentSprite
_08060610:
	ldrh r0, [r2, #2]
	subs r0, #0x50
	ldrh r1, [r2, #4]
	movs r2, #0x22
	bl ParticleSet
	b _0806067A
_0806061E:
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r5, _08060648 @ =sSpritesFallingSpeedFast
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0806064C @ =0x00007FFF
	cmp r1, r0
	bne _08060650
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0806065A
	.align 2, 0
_08060648: .4byte sSpritesFallingSpeedFast
_0806064C: .4byte 0x00007FFF
_08060650:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
_0806065A:
	strh r0, [r2, #2]
	ldrb r0, [r2, #0x1e]
	cmp r0, #4
	bhi _0806066E
	adds r1, r2, #0
	adds r1, #0x30
	ldrh r0, [r2, #4]
	ldrb r1, [r1]
	adds r0, r0, r1
	b _08060678
_0806066E:
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	ldrh r0, [r2, #4]
	subs r0, r0, r1
_08060678:
	strh r0, [r2, #4]
_0806067A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start Nightmare
Nightmare: @ 0x08060680
	push {lr}
	ldr r0, _08060698 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3b
	bls _0806068E
	b _080607EE
_0806068E:
	lsls r0, r0, #2
	ldr r1, _0806069C @ =_080606A0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08060698: .4byte gCurrentSprite
_0806069C: .4byte _080606A0
_080606A0: @ jump table
	.4byte _08060790 @ case 0
	.4byte _080607B2 @ case 1
	.4byte _080607B8 @ case 2
	.4byte _080607EE @ case 3
	.4byte _080607EE @ case 4
	.4byte _080607EE @ case 5
	.4byte _080607EE @ case 6
	.4byte _080607EE @ case 7
	.4byte _080607EE @ case 8
	.4byte _080607EE @ case 9
	.4byte _080607EE @ case 10
	.4byte _080607EE @ case 11
	.4byte _080607EE @ case 12
	.4byte _080607EE @ case 13
	.4byte _080607EE @ case 14
	.4byte _080607EE @ case 15
	.4byte _080607EE @ case 16
	.4byte _080607EE @ case 17
	.4byte _080607EE @ case 18
	.4byte _080607EE @ case 19
	.4byte _080607EE @ case 20
	.4byte _080607EE @ case 21
	.4byte _080607EE @ case 22
	.4byte _080607BE @ case 23
	.4byte _080607C2 @ case 24
	.4byte _080607C8 @ case 25
	.4byte _080607CE @ case 26
	.4byte _080607D4 @ case 27
	.4byte _080607D8 @ case 28
	.4byte _080607EE @ case 29
	.4byte _080607DE @ case 30
	.4byte _080607EE @ case 31
	.4byte _080607E4 @ case 32
	.4byte _080607EE @ case 33
	.4byte _080607EA @ case 34
	.4byte _080607EE @ case 35
	.4byte _080607EE @ case 36
	.4byte _080607EE @ case 37
	.4byte _080607EE @ case 38
	.4byte _080607EE @ case 39
	.4byte _080607EE @ case 40
	.4byte _080607EE @ case 41
	.4byte _080607EE @ case 42
	.4byte _080607EE @ case 43
	.4byte _080607EE @ case 44
	.4byte _080607EE @ case 45
	.4byte _080607EE @ case 46
	.4byte _080607EE @ case 47
	.4byte _080607EE @ case 48
	.4byte _080607EE @ case 49
	.4byte _080607EE @ case 50
	.4byte _080607EE @ case 51
	.4byte _080607EE @ case 52
	.4byte _080607EE @ case 53
	.4byte _080607EE @ case 54
	.4byte _08060796 @ case 55
	.4byte _0806079C @ case 56
	.4byte _080607A2 @ case 57
	.4byte _080607A6 @ case 58
	.4byte _080607AC @ case 59
_08060790:
	bl NightmareInit
	b _080607EE
_08060796:
	bl NightmareWaitingToAppear
	b _080607EE
_0806079C:
	bl NightmareAppearing
	b _080607EE
_080607A2:
	bl NightmarePhase1Init
_080607A6:
	bl NightmarePhase1
	b _080607EE
_080607AC:
	bl NightmarePhase2ResettingPosition
	b _080607EE
_080607B2:
	bl NightmarePhase2MovementInit
	b _080607EE
_080607B8:
	bl NightmarePhase2Movement
	b _080607EE
_080607BE:
	bl NightmareMovingToPhase3Init
_080607C2:
	bl NightmareMovingToPhase3
	b _080607EE
_080607C8:
	bl NightmareReachedPhase3Position
	b _080607EE
_080607CE:
	bl NightmarePhase3SlotMovementInit
	b _080607EE
_080607D4:
	bl NightmarePhase3FastMovementInit
_080607D8:
	bl NightmarePhase3FastMovement
	b _080607EE
_080607DE:
	bl NightmarePhase3SlowMovement
	b _080607EE
_080607E4:
	bl NightmareMovingToDeathPosition
	b _080607EE
_080607EA:
	bl NightmareTurningIntoCoreX
_080607EE:
	bl NightmarePlaySound
	bl SpriteUtilUpdateSubSpriteData1Animation
	bl NightmareSyncSubSprites
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NigthmarePart
NigthmarePart: @ 0x08060800
	push {lr}
	ldr r1, _08060814 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08060818
	bl NightmarePartInit
	b _080608E4
	.align 2, 0
_08060814: .4byte gCurrentSprite
_08060818:
	ldrb r0, [r1, #0x1e]
	cmp r0, #0xd
	bhi _080608E4
	lsls r0, r0, #2
	ldr r1, _08060828 @ =_0806082C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08060828: .4byte _0806082C
_0806082C: @ jump table
	.4byte _08060878 @ case 0
	.4byte _0806086E @ case 1
	.4byte _08060882 @ case 2
	.4byte _0806088C @ case 3
	.4byte _080608D2 @ case 4
	.4byte _08060896 @ case 5
	.4byte _080608A0 @ case 6
	.4byte _080608AA @ case 7
	.4byte _080608DC @ case 8
	.4byte _08060864 @ case 9
	.4byte _080608E4 @ case 10
	.4byte _080608B4 @ case 11
	.4byte _080608BE @ case 12
	.4byte _080608C8 @ case 13
_08060864:
	bl NightmarePartGenerator
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_0806086E:
	bl NightmarePartEyeSludge
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_08060878:
	bl NightmarePartChinSludge
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_08060882:
	bl NightmarePartEye
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_0806088C:
	bl NightmarePartMouth
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_08060896:
	bl NightmarePartRightTurret1
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608A0:
	bl NightmarePartRightTurret2
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608AA:
	bl NightmarePartRightTurret3
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608B4:
	bl NightmarePartLeftTurret1
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608BE:
	bl NightmarePartLeftTurret2
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608C8:
	bl NightmarePartLeftTurret3
	bl SpriteUtilSyncCurrentSpritePositionWithSubSprite1Position
	b _080608E4
_080608D2:
	bl NightmarePartRightArmTop
	bl NightmareSyncSubSprites
	b _080608E4
_080608DC:
	bl NightmarePartRightArmBottom
	bl NightmareSyncSubSprites
_080608E4:
	pop {r0}
	bx r0

	thumb_func_start NightmareBeam
NightmareBeam: @ 0x080608E8
	push {lr}
	ldr r0, _080608FC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08060900
	cmp r0, #2
	beq _08060906
	b _0806090A
	.align 2, 0
_080608FC: .4byte gCurrentSprite
_08060900:
	bl NightmareBeamInit
	b _0806090A
_08060906:
	bl NightmareBeamMoving
_0806090A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NightmareFallingArm
NightmareFallingArm: @ 0x08060910
	push {lr}
	ldr r0, _0806092C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08060930
	cmp r0, #2
	beq _08060936
	b _0806093A
	.align 2, 0
_0806092C: .4byte gCurrentSprite
_08060930:
	bl NightmareFallingArmInit
	b _0806093A
_08060936:
	bl NightmareFallingArmMoving
_0806093A:
	pop {r0}
	bx r0
	.align 2, 0
