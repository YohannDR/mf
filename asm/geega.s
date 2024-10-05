    .include "asm/macros.inc"

    .syntax unified

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
