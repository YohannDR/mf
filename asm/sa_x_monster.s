    .include "asm/macros.inc"

    .syntax unified

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
	bl SpriteUtilCheckNearEndSubSprite1Anim
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
	bl SpriteUtilCheckEndSubSprite1Anim
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
	bl SpriteUtilCheckNearEndSubSprite1Anim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
