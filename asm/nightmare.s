    .include "asm/macros.inc"

    .syntax unified

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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
