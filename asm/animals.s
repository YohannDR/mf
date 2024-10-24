    .include "asm/macros.inc"

    .syntax unified

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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckObjectsTouching
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
	bl SpriteUtilCheckEndCurrentSpriteAnim
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
