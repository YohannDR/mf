    .include "asm/macros.inc"

    .syntax unified

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
