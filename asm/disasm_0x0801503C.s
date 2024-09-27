    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start CheckAnySpriteCanAbsorbX
CheckAnySpriteCanAbsorbX: @ 0x0801503C
	push {r4, lr}
	movs r3, #0
	ldr r4, _0801506C @ =gSpriteData
_08015042:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08015070
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08015070
	ldrh r0, [r2, #0x14]
	cmp r0, #0
	beq _08015070
	movs r0, #1
	b _0801507C
	.align 2, 0
_0801506C: .4byte gSpriteData
_08015070:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _08015042
	movs r0, #0
_0801507C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start XParasiteWaitingToMove
XParasiteWaitingToMove: @ 0x08015084
	push {lr}
	ldr r0, _080150A4 @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x36
	bne _080150A8
	movs r0, #0xa0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #2
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	b _080150AA
	.align 2, 0
_080150A4: .4byte gCurrentSprite
_080150A8:
	movs r1, #1
_080150AA:
	cmp r1, #0
	beq _080150B2
	bl XParasiteFlyingInit
_080150B2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteBossFormationGrowingStart
XParasiteBossFormationGrowingStart: @ 0x080150B8
	ldr r2, _080150D4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x5d
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _080150D8 @ =0x0000FFFB
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xf
	strh r0, [r2, #0x12]
	bx lr
	.align 2, 0
_080150D4: .4byte gCurrentSprite
_080150D8: .4byte 0x0000FFFB

	thumb_func_start XParasiteBossFormationGrowing
XParasiteBossFormationGrowing: @ 0x080150DC
	push {lr}
	ldr r2, _08015108 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r1, #4
	eors r0, r1
	strh r0, [r2]
	ldrh r0, [r2, #0x12]
	adds r0, #0x10
	strh r0, [r2, #0x12]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xfa
	bls _08015102
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x5e
	strb r1, [r0]
	movs r0, #0
	strh r0, [r2, #8]
_08015102:
	pop {r0}
	bx r0
	.align 2, 0
_08015108: .4byte gCurrentSprite

	thumb_func_start XParasiteBossFormationFloating
XParasiteBossFormationFloating: @ 0x0801510C
	push {r4, lr}
	sub sp, #8
	ldr r4, _08015150 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	movs r2, #0
	strh r0, [r4]
	ldr r0, _08015154 @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	ldr r1, _08015158 @ =gXParasiteTargetXPosition
	ldrh r1, [r1]
	str r2, [sp]
	ldr r2, _0801515C @ =0x00000141
	str r2, [sp, #4]
	movs r2, #0x28
	movs r3, #0x3c
	bl XParasiteMoveWithSound
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08015146
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x5f
	strb r0, [r1]
_08015146:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015150: .4byte gCurrentSprite
_08015154: .4byte gXParasiteTargetYPosition
_08015158: .4byte gXParasiteTargetXPosition
_0801515C: .4byte 0x00000141

	thumb_func_start XParasiteBossFormationTransforming
XParasiteBossFormationTransforming: @ 0x08015160
	push {r4, r5, r6, lr}
	ldr r0, _08015198 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	movs r0, #4
	adds r3, r1, #0
	eors r3, r0
	mov r1, ip
	strh r3, [r1]
	mov r0, ip
	adds r0, #0x23
	ldrb r4, [r0]
	ldr r2, _0801519C @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080151A0
	movs r0, #0x20
	orrs r3, r0
	mov r0, ip
	strh r3, [r0]
	b _080151A8
	.align 2, 0
_08015198: .4byte gCurrentSprite
_0801519C: .4byte gSpriteData
_080151A0:
	ldr r0, _080151C0 @ =0x0000FFDF
	ands r3, r0
	mov r1, ip
	strh r3, [r1]
_080151A8:
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x59
	bne _080151C4
	movs r0, #0
	mov r2, ip
	strh r0, [r2]
	b _080153CA
	.align 2, 0
_080151C0: .4byte 0x0000FFDF
_080151C4:
	ldr r0, _080151E0 @ =gXParasiteTargetYPosition
	ldrh r4, [r0]
	ldr r0, _080151E4 @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	mov r1, ip
	ldrb r0, [r1, #0x1e]
	cmp r0, #5
	bhi _0801525A
	lsls r0, r0, #2
	ldr r1, _080151E8 @ =_080151EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080151E0: .4byte gXParasiteTargetYPosition
_080151E4: .4byte gXParasiteTargetXPosition
_080151E8: .4byte _080151EC
_080151EC: @ jump table
	.4byte _08015204 @ case 0
	.4byte _08015212 @ case 1
	.4byte _08015220 @ case 2
	.4byte _0801522E @ case 3
	.4byte _0801523C @ case 4
	.4byte _0801524A @ case 5
_08015204:
	adds r0, r4, #0
	subs r0, #0x3c
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r2, #0
	subs r0, #0x1e
	b _08015256
_08015212:
	adds r0, r4, #0
	subs r0, #0x28
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x28
	b _08015256
_08015220:
	adds r0, r4, #0
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r2, #0
	subs r0, #0x32
	b _08015256
_0801522E:
	adds r0, r4, #0
	adds r0, #0x50
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x32
	b _08015256
_0801523C:
	adds r0, r4, #0
	subs r0, #0x14
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r2, #0
	adds r0, #0x46
	b _08015256
_0801524A:
	adds r0, r4, #0
	subs r0, #0xf
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r2, #0
	subs r0, #0x37
_08015256:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0801525A:
	mov r0, ip
	ldrh r1, [r0]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080152C0
	mov r3, ip
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _08015298
	mov r0, ip
	ldrh r1, [r0, #4]
	subs r0, r2, #4
	cmp r1, r0
	bgt _080152D4
	mov r1, ip
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0801528C
	adds r0, #1
	strb r0, [r1]
_0801528C:
	mov r2, ip
	ldrh r0, [r2, #4]
	ldrb r1, [r1]
	adds r0, r0, r1
	strh r0, [r2, #4]
	b _0801531A
_08015298:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _080152B0
	lsrs r0, r0, #0x19
	mov r1, ip
	ldrh r1, [r1, #4]
	adds r0, r0, r1
	mov r2, ip
	strh r0, [r2, #4]
	b _0801531A
_080152B0:
	mov r0, ip
	ldrh r1, [r0]
	ldr r0, _080152BC @ =0x0000FDFF
	ands r0, r1
	b _08015310
	.align 2, 0
_080152BC: .4byte 0x0000FDFF
_080152C0:
	mov r3, ip
	adds r3, #0x2f
	ldrb r0, [r3]
	cmp r0, #0
	bne _080152F0
	mov r0, ip
	ldrh r1, [r0, #4]
	adds r0, r2, #4
	cmp r1, r0
	bge _080152DE
_080152D4:
	mov r0, ip
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r3]
	b _0801531A
_080152DE:
	mov r1, ip
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #9
	bhi _080152EC
	adds r0, #1
	strb r0, [r1]
_080152EC:
	ldrb r1, [r1]
	b _080152FE
_080152F0:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08015308
	adds r1, r0, #0
	lsrs r1, r1, #0x19
_080152FE:
	mov r2, ip
	ldrh r0, [r2, #4]
	subs r0, r0, r1
	strh r0, [r2, #4]
	b _0801531A
_08015308:
	mov r0, ip
	ldrh r1, [r0]
	adds r0, r5, #0
	orrs r0, r1
_08015310:
	mov r1, ip
	strh r0, [r1]
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_0801531A:
	mov r2, ip
	ldrh r5, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r0, r6, #0
	ands r0, r5
	cmp r0, #0
	beq _08015374
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _08015350
	ldrh r1, [r2, #2]
	subs r0, r4, #4
	cmp r1, r0
	bgt _08015386
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0801534A
	adds r0, #1
	strb r0, [r1]
_0801534A:
	ldrh r0, [r2, #2]
	ldrb r1, [r1]
	b _0801535E
_08015350:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08015364
	lsrs r0, r0, #0x19
	ldrh r1, [r2, #2]
_0801535E:
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _080153CA
_08015364:
	ldr r0, _08015370 @ =0x0000FBFF
	ands r0, r5
	strh r0, [r2]
	adds r1, r2, #0
	b _080153C4
	.align 2, 0
_08015370: .4byte 0x0000FBFF
_08015374:
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _080153A2
	ldrh r1, [r2, #2]
	adds r0, r4, #4
	cmp r1, r0
	bge _08015390
_08015386:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _080153CA
_08015390:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0801539E
	adds r0, #1
	strb r0, [r1]
_0801539E:
	ldrb r1, [r1]
	b _080153B0
_080153A2:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _080153B8
	adds r1, r0, #0
	lsrs r1, r1, #0x19
_080153B0:
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _080153CA
_080153B8:
	mov r2, ip
	ldrh r1, [r2]
	adds r0, r6, #0
	orrs r0, r1
	strh r0, [r2]
	mov r1, ip
_080153C4:
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
_080153CA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start XParasiteCoreXOrStabilizerForming
XParasiteCoreXOrStabilizerForming: @ 0x080153D0
	push {lr}
	ldr r3, _080153F8 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08015404
	ldr r2, _080153FC @ =gWrittenToMosaic_H
	ldr r1, _08015400 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _08015418
	.align 2, 0
_080153F8: .4byte gCurrentSprite
_080153FC: .4byte gWrittenToMosaic_H
_08015400: .4byte sXParasiteMosaicValues
_08015404:
	ldrh r1, [r3]
	ldr r0, _08015420 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5d
	strb r0, [r1]
	adds r0, #0xcf
	strh r0, [r3, #6]
_08015418:
	bl XParasiteFlyingMovement
	pop {r0}
	bx r0
	.align 2, 0
_08015420: .4byte 0x0000FFDF

	thumb_func_start XParasiteAquaZebesianMoveToTarget
XParasiteAquaZebesianMoveToTarget: @ 0x08015424
	push {lr}
	sub sp, #4
	ldr r0, _08015448 @ =gXParasiteTargetYPosition
	ldrh r3, [r0]
	ldr r0, _0801544C @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	ldr r1, _08015450 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _08015490
	ldrh r0, [r1, #8]
	cmp r0, #1
	beq _08015454
	cmp r0, #3
	beq _0801546E
	b _08015490
	.align 2, 0
_08015448: .4byte gXParasiteTargetYPosition
_0801544C: .4byte gXParasiteTargetXPosition
_08015450: .4byte gCurrentSprite
_08015454:
	adds r0, r3, #0
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08015488
	adds r0, r2, #0
	subs r0, #0x40
	b _0801548C
_0801546E:
	adds r0, r3, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08015488
	adds r0, r2, #0
	subs r0, #0x40
	b _0801548C
_08015488:
	adds r0, r2, #0
	adds r0, #0x40
_0801548C:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08015490:
	movs r0, #1
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r2, #0
	movs r2, #0x14
	movs r3, #0x1c
	bl XParasiteMove
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteAquaZebesianWaitingToMove
XParasiteAquaZebesianWaitingToMove: @ 0x080154A8
	push {r4, r5, r6, r7, lr}
	ldr r2, _08015540 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08015506
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r3, _08015544 @ =0x083BE09A
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _08015548 @ =0x00007FFF
	cmp r0, r6
	bne _080154D8
	ldrh r2, [r3]
	movs r1, #0
_080154D8:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r3, _0801554C @ =0x083BE11C
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _080154FC
	ldrh r2, [r3]
	movs r1, #0
_080154FC:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
_08015506:
	adds r3, r4, #0
	ldrh r5, [r3]
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08015578
	ldrh r0, [r3, #6]
	subs r4, r0, #1
	strh r4, [r3, #6]
	lsls r0, r4, #0x10
	cmp r0, #0
	beq _08015568
	ldr r2, _08015550 @ =gWrittenToMosaic_H
	ldr r1, _08015554 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x16
	bls _08015558
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _080155BA
	.align 2, 0
_08015540: .4byte gCurrentSprite
_08015544: .4byte 0x083BE09A
_08015548: .4byte 0x00007FFF
_0801554C: .4byte 0x083BE11C
_08015550: .4byte gWrittenToMosaic_H
_08015554: .4byte sXParasiteMosaicValues
_08015558:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _080155BA
	bl XParasiteGettingAbsorbedInit
	b _080155BA
_08015568:
	ldr r0, _08015574 @ =0x0000FFDF
	ands r0, r5
	strh r0, [r3]
	movs r0, #0x3c
	strh r0, [r3, #6]
	b _080155BA
	.align 2, 0
_08015574: .4byte 0x0000FFDF
_08015578:
	ldrh r0, [r3, #6]
	subs r0, #1
	movs r5, #0
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _080155AA
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5d
	strb r0, [r1]
	adds r0, #0xcf
	strh r0, [r3, #6]
	strh r2, [r3, #8]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r5, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r5, [r0]
	adds r0, #3
	strb r1, [r0]
_080155AA:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080155BA
	bl XParasiteGettingAbsorbedInit
_080155BA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start XParasiteAquaZebesianFloating
XParasiteAquaZebesianFloating: @ 0x080155C0
	push {lr}
	ldr r2, _080155D8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080155DC
	bl XParasiteGettingAbsorbedInit
	b _08015618
	.align 2, 0
_080155D8: .4byte gCurrentSprite
_080155DC:
	adds r3, r2, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08015600
	ldr r0, _080155FC @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	bne _08015618
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	b _08015618
	.align 2, 0
_080155FC: .4byte gCurrentPowerBomb
_08015600:
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _08015610
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x61
	strb r0, [r1]
	b _08015618
_08015610:
	subs r0, #1
	strh r0, [r2, #6]
	bl XParasiteAquaZebesianMoveToTarget
_08015618:
	pop {r0}
	bx r0

	thumb_func_start XParasite
XParasite: @ 0x0801561C
	push {lr}
	ldr r0, _08015644 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x63
	beq _0801567A
	cmp r0, #0x63
	bgt _0801564E
	cmp r0, #0x5e
	beq _0801566E
	cmp r0, #0x5e
	bgt _08015648
	cmp r0, #0x5c
	beq _08015662
	cmp r0, #0x5c
	bgt _08015668
	cmp r0, #0
	beq _0801565C
	b _0801568C
	.align 2, 0
_08015644: .4byte gCurrentSprite
_08015648:
	cmp r0, #0x61
	beq _08015674
	b _0801568C
_0801564E:
	cmp r0, #0x65
	beq _08015684
	cmp r0, #0x65
	blt _0801567E
	cmp r0, #0x66
	beq _08015688
	b _0801568C
_0801565C:
	bl XParasiteInit
	b _0801568C
_08015662:
	bl XParasiteIdleFloating
	b _0801568C
_08015668:
	bl XParasiteFlying
	b _0801568C
_0801566E:
	bl XParasiteGettingAbsorbed
	b _0801568C
_08015674:
	bl XParasiteFlyingAway
	b _0801568C
_0801567A:
	bl unk_6224c
_0801567E:
	bl unk_62288
	b _0801568C
_08015684:
	bl unk_620ec
_08015688:
	bl unk_6212c
_0801568C:
	pop {r0}
	bx r0

	thumb_func_start XParasiteInRoom
XParasiteInRoom: @ 0x08015690
	push {lr}
	ldr r0, _080156A4 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _080156A8
	cmp r0, #0x5c
	beq _080156AE
	b _080156B2
	.align 2, 0
_080156A4: .4byte gCurrentSprite
_080156A8:
	bl XParasiteInit
	b _080156B2
_080156AE:
	bl XParasiteWaitingToMove
_080156B2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteBossFormation
XParasiteBossFormation: @ 0x080156B8
	push {lr}
	ldr r0, _080156DC @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5d
	beq _080156F6
	cmp r0, #0x5d
	bgt _080156E0
	cmp r0, #0
	beq _080156EA
	cmp r0, #0x5c
	beq _080156F0
	b _08015706
	.align 2, 0
_080156DC: .4byte gCurrentSprite
_080156E0:
	cmp r0, #0x5e
	beq _080156FC
	cmp r0, #0x5f
	beq _08015702
	b _08015706
_080156EA:
	bl XParasiteInit
	b _08015706
_080156F0:
	bl XParasiteBossFormationGrowingStart
	b _08015706
_080156F6:
	bl XParasiteBossFormationGrowing
	b _08015706
_080156FC:
	bl XParasiteBossFormationFloating
	b _08015706
_08015702:
	bl XParasiteBossFormationTransforming
_08015706:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteCoreOrStabilizer
XParasiteCoreOrStabilizer: @ 0x0801570C
	push {lr}
	ldr r0, _08015734 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x63
	beq _0801576A
	cmp r0, #0x63
	bgt _0801573E
	cmp r0, #0x5e
	beq _0801575E
	cmp r0, #0x5e
	bgt _08015738
	cmp r0, #0x5c
	beq _08015752
	cmp r0, #0x5c
	bgt _08015758
	cmp r0, #0
	beq _0801574C
	b _0801577C
	.align 2, 0
_08015734: .4byte gCurrentSprite
_08015738:
	cmp r0, #0x61
	beq _08015764
	b _0801577C
_0801573E:
	cmp r0, #0x65
	beq _08015774
	cmp r0, #0x65
	blt _0801576E
	cmp r0, #0x66
	beq _08015778
	b _0801577C
_0801574C:
	bl XParasiteInit
	b _0801577C
_08015752:
	bl XParasiteCoreXOrStabilizerForming
	b _0801577C
_08015758:
	bl XParasiteFlying
	b _0801577C
_0801575E:
	bl XParasiteGettingAbsorbed
	b _0801577C
_08015764:
	bl XParasiteFlyingAway
	b _0801577C
_0801576A:
	bl unk_6224c
_0801576E:
	bl unk_62288
	b _0801577C
_08015774:
	bl unk_620ec
_08015778:
	bl unk_6212c
_0801577C:
	pop {r0}
	bx r0

	thumb_func_start XParasiteAquaZebesian
XParasiteAquaZebesian: @ 0x08015780
	push {lr}
	ldr r0, _080157A0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5e
	beq _080157BC
	cmp r0, #0x5e
	bgt _080157A4
	cmp r0, #0x5c
	beq _080157B0
	cmp r0, #0x5c
	bgt _080157B6
	cmp r0, #0
	beq _080157AA
	b _080157C6
	.align 2, 0
_080157A0: .4byte gCurrentSprite
_080157A4:
	cmp r0, #0x61
	beq _080157C2
	b _080157C6
_080157AA:
	bl XParasiteInit
	b _080157C6
_080157B0:
	bl XParasiteAquaZebesianWaitingToMove
	b _080157C6
_080157B6:
	bl XParasiteAquaZebesianFloating
	b _080157C6
_080157BC:
	bl XParasiteGettingAbsorbed
	b _080157C6
_080157C2:
	bl XParasiteFlyingAway
_080157C6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XSetDirection
SA_XSetDirection: @ 0x080157CC
	push {lr}
	ldr r0, _080157E4 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080157EC
	ldr r1, _080157E8 @ =gSaXData
	movs r0, #0x10
	b _080157F0
	.align 2, 0
_080157E4: .4byte gCurrentSprite
_080157E8: .4byte gSaXData
_080157EC:
	ldr r1, _080157F8 @ =gSaXData
	movs r0, #0x20
_080157F0:
	strh r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_080157F8: .4byte gSaXData

	thumb_func_start SA_XSeeAndLocateSamus
SA_XSeeAndLocateSamus: @ 0x080157FC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08015830 @ =gSamusData
	ldrh r1, [r0, #0x18]
	adds r1, #4
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrh r3, [r0, #0x16]
	ldr r0, _08015834 @ =gCurrentSprite
	ldrh r1, [r0, #2]
	str r1, [sp]
	ldrh r0, [r0, #4]
	str r0, [sp, #4]
	cmp r2, r1
	bls _0801583C
	ldr r1, _08015838 @ =gSaXVision
	movs r0, #1
	strb r0, [r1, #3]
	ldr r4, [sp]
	subs r0, r2, r4
	b _08015846
	.align 2, 0
_08015830: .4byte gSamusData
_08015834: .4byte gCurrentSprite
_08015838: .4byte gSaXVision
_0801583C:
	ldr r1, _0801585C @ =gSaXVision
	movs r0, #0
	strb r0, [r1, #3]
	ldr r4, [sp]
	subs r0, r4, r2
_08015846:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r5, r1, #0
	ldr r0, [sp, #4]
	cmp r3, r0
	bls _08015860
	movs r0, #1
	strb r0, [r5, #4]
	ldr r1, [sp, #4]
	subs r0, r3, r1
	b _08015868
	.align 2, 0
_0801585C: .4byte gSaXVision
_08015860:
	movs r0, #0
	strb r0, [r5, #4]
	ldr r1, [sp, #4]
	subs r0, r1, r3
_08015868:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #2
	cmp r0, r1
	bls _0801587E
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #5]
	b _08015DBE
_0801587E:
	cmp r4, r1
	bls _08015888
	movs r0, #0
	strb r0, [r5, #2]
	b _08015DBE
_08015888:
	movs r1, #0
	movs r0, #1
	strb r0, [r5, #2]
	strb r1, [r5, #5]
	ldr r0, _080158E4 @ =0x0000FFC0
	mov sl, r2
	ands r2, r0
	mov sl, r2
	adds r1, r0, #0
	ands r1, r3
	str r1, [sp, #0xc]
	ldr r2, [sp]
	adds r1, r2, #0
	ands r1, r0
	str r1, [sp, #0x10]
	ldr r2, [sp, #4]
	adds r1, r2, #0
	ands r1, r0
	str r1, [sp, #0x14]
	mov r0, sl
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov sl, r2
	ldr r1, _080158E8 @ =0xFFC00000
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r2, #0
	mov sb, r2
	cmp r4, #0x40
	bls _080158CA
	b _08015A40
_080158CA:
	ldr r0, [sp, #0x10]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _08015990
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r8, r2
	b _0801593E
	.align 2, 0
_080158E4: .4byte 0x0000FFC0
_080158E8: .4byte 0xFFC00000
_080158EC:
	ldr r0, [sp, #0xc]
	cmp r5, r0
	bne _0801592C
	cmp r6, sl
	beq _08015918
	cmp r4, sl
	beq _08015918
	ldr r0, _08015924 @ =gSamusData
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08015928 @ =0x0828D794
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0801592C
	ldr r2, [sp, #8]
	cmp r6, r2
	beq _08015918
	cmp r4, r2
	bne _0801592C
_08015918:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _08015974
	.align 2, 0
_08015924: .4byte gSamusData
_08015928: .4byte 0x0828D794
_0801592C:
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_0801593E:
	mov r4, r8
	cmp r4, #7
	bhi _08015974
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08015988 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r2, #0xf0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08015974
	adds r4, r6, #0
	adds r4, #0x40
	adds r0, r4, #0
	adds r1, r5, #0
	str r2, [sp, #0x18]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	ldr r2, [sp, #0x18]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080158EC
_08015974:
	ldr r5, _0801598C @ =gSaXVision
	mov r0, sb
	cmp r0, #0
	beq _08015A40
	movs r0, #0
	strb r0, [r5]
	movs r0, #1
	strb r0, [r5, #1]
	b _08015DBE
	.align 2, 0
_08015988: .4byte gPreviousCollisionCheck
_0801598C: .4byte gSaXVision
_08015990:
	ldr r0, [sp, #0x14]
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0
	mov r8, r1
	b _080159F2
_0801599E:
	ldr r2, [sp, #0xc]
	cmp r5, r2
	bne _080159E0
	cmp r6, sl
	beq _080159CA
	cmp r4, sl
	beq _080159CA
	ldr r0, _080159D8 @ =gSamusData
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _080159DC @ =0x0828D794
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #2
	bhi _080159E0
	ldr r2, [sp, #8]
	cmp r6, r2
	beq _080159CA
	cmp r4, r2
	bne _080159E0
_080159CA:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _08015A28
	.align 2, 0
_080159D8: .4byte gSamusData
_080159DC: .4byte 0x0828D794
_080159E0:
	movs r4, #0x40
	subs r0, r5, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
_080159F2:
	mov r0, r8
	cmp r0, #7
	bhi _08015A28
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08015A38 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r2, #0xf0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08015A28
	adds r4, r6, #0
	adds r4, #0x40
	adds r0, r4, #0
	adds r1, r5, #0
	str r2, [sp, #0x18]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	ldr r2, [sp, #0x18]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801599E
_08015A28:
	ldr r5, _08015A3C @ =gSaXVision
	mov r1, sb
	cmp r1, #0
	beq _08015A40
	movs r0, #0
	strb r0, [r5]
	strb r0, [r5, #1]
	b _08015DBE
	.align 2, 0
_08015A38: .4byte gPreviousCollisionCheck
_08015A3C: .4byte gSaXVision
_08015A40:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _08015A48
	b _08015C00
_08015A48:
	movs r2, #0x40
	lsls r0, r2, #1
	adds r0, #0x40
	ldr r4, [sp, #0x10]
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _08015B30
	ldr r0, [sp]
	subs r0, #0x8c
	ldr r1, [sp, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08015A84 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08015A76
	b _08015DB8
_08015A76:
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0
	b _08015ADC
	.align 2, 0
_08015A84: .4byte gPreviousCollisionCheck
_08015A88:
	ldr r1, [sp, #0xc]
	cmp r5, r1
	bne _08015AC8
	cmp r6, sl
	beq _08015AB4
	cmp r4, sl
	beq _08015AB4
	ldr r0, _08015AC0 @ =gSamusData
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _08015AC4 @ =0x0828D794
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08015AC8
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _08015AB4
	cmp r4, r0
	bne _08015AC8
_08015AB4:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _08015B14
	.align 2, 0
_08015AC0: .4byte gSamusData
_08015AC4: .4byte 0x0828D794
_08015AC8:
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r4, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08015ADC:
	mov r8, r0
	mov r1, r8
	cmp r1, #7
	bhi _08015B14
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08015B28 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r2, #0xf0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08015B14
	movs r0, #0x40
	subs r4, r6, r0
	adds r0, r4, #0
	adds r1, r5, #0
	str r2, [sp, #0x18]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	ldr r2, [sp, #0x18]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08015A88
_08015B14:
	mov r1, sb
	cmp r1, #0
	bne _08015B1C
	b _08015DB8
_08015B1C:
	ldr r1, _08015B2C @ =gSaXVision
	movs r0, #1
	strb r0, [r1]
	strb r0, [r1, #1]
	b _08015DBE
	.align 2, 0
_08015B28: .4byte gPreviousCollisionCheck
_08015B2C: .4byte gSaXVision
_08015B30:
	ldr r0, [sp]
	subs r0, #0x8c
	ldr r1, [sp, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08015B58 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08015B4A
	b _08015DB8
_08015B4A:
	ldr r2, [sp, #0x14]
	movs r4, #0x40
	subs r0, r2, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0
	b _08015BB0
	.align 2, 0
_08015B58: .4byte gPreviousCollisionCheck
_08015B5C:
	ldr r1, [sp, #0xc]
	cmp r5, r1
	bne _08015B9C
	cmp r6, sl
	beq _08015B88
	cmp r4, sl
	beq _08015B88
	ldr r0, _08015B94 @ =gSamusData
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _08015B98 @ =0x0828D794
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08015B9C
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _08015B88
	cmp r4, r0
	bne _08015B9C
_08015B88:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _08015BE8
	.align 2, 0
_08015B94: .4byte gSamusData
_08015B98: .4byte 0x0828D794
_08015B9C:
	movs r1, #0x40
	subs r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r4, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08015BB0:
	mov r8, r0
	mov r2, r8
	cmp r2, #7
	bhi _08015BE8
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08015BF8 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r2, #0xf0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08015BE8
	movs r0, #0x40
	subs r4, r6, r0
	adds r0, r4, #0
	adds r1, r5, #0
	str r2, [sp, #0x18]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	ldr r2, [sp, #0x18]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08015B5C
_08015BE8:
	mov r1, sb
	cmp r1, #0
	bne _08015BF0
	b _08015DB8
_08015BF0:
	ldr r0, _08015BFC @ =gSaXVision
	movs r2, #0
	movs r1, #1
	b _08015DA8
	.align 2, 0
_08015BF8: .4byte gPreviousCollisionCheck
_08015BFC: .4byte gSaXVision
_08015C00:
	ldr r2, [sp, #0x10]
	movs r4, #0x40
	subs r0, r2, r4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _08015CE4
	ldr r1, [sp, #4]
	adds r1, #0x3c
	ldr r0, [sp]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08015C34 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08015C28
	b _08015DB8
_08015C28:
	ldr r0, [sp, #0x14]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0
	b _08015C90
	.align 2, 0
_08015C34: .4byte gPreviousCollisionCheck
_08015C38:
	ldr r1, [sp, #0xc]
	cmp r5, r1
	bne _08015C78
	cmp r6, sl
	beq _08015C64
	cmp r4, sl
	beq _08015C64
	ldr r0, _08015C70 @ =gSamusData
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _08015C74 @ =0x0828D794
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08015C78
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _08015C64
	cmp r4, r0
	bne _08015C78
_08015C64:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _08015CC8
	.align 2, 0
_08015C70: .4byte gSamusData
_08015C74: .4byte 0x0828D794
_08015C78:
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r6, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08015C90:
	mov r8, r0
	mov r1, r8
	cmp r1, #7
	bhi _08015CC8
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08015CDC @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r2, #0xf0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08015CC8
	movs r0, #0x40
	subs r4, r6, r0
	adds r0, r4, #0
	adds r1, r5, #0
	str r2, [sp, #0x18]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	ldr r2, [sp, #0x18]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08015C38
_08015CC8:
	mov r1, sb
	cmp r1, #0
	beq _08015DB8
	ldr r0, _08015CE0 @ =gSaXVision
	movs r1, #2
	strb r1, [r0]
	movs r1, #1
	strb r1, [r0, #1]
	b _08015DBE
	.align 2, 0
_08015CDC: .4byte gPreviousCollisionCheck
_08015CE0: .4byte gSaXVision
_08015CE4:
	ldr r1, [sp, #4]
	subs r1, #0x3c
	ldr r0, [sp]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08015D08 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08015DB8
	ldr r2, [sp, #0x14]
	movs r4, #0x40
	subs r0, r2, r4
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0
	b _08015D64
	.align 2, 0
_08015D08: .4byte gPreviousCollisionCheck
_08015D0C:
	ldr r1, [sp, #0xc]
	cmp r5, r1
	bne _08015D4C
	cmp r6, sl
	beq _08015D38
	cmp r4, sl
	beq _08015D38
	ldr r0, _08015D44 @ =gSamusData
	ldrb r1, [r0, #1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _08015D48 @ =0x0828D794
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08015D4C
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _08015D38
	cmp r4, r0
	bne _08015D4C
_08015D38:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	b _08015D9C
	.align 2, 0
_08015D44: .4byte gSamusData
_08015D48: .4byte 0x0828D794
_08015D4C:
	movs r1, #0x40
	subs r0, r5, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r0, r6, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
_08015D64:
	mov r8, r0
	mov r2, r8
	cmp r2, #7
	bhi _08015D9C
	adds r0, r6, #0
	adds r1, r5, #0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _08015DB0 @ =gPreviousCollisionCheck
	ldrb r1, [r7]
	movs r2, #0xf0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _08015D9C
	movs r0, #0x40
	subs r4, r6, r0
	adds r0, r4, #0
	adds r1, r5, #0
	str r2, [sp, #0x18]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r7]
	ldr r2, [sp, #0x18]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08015D0C
_08015D9C:
	mov r1, sb
	cmp r1, #0
	beq _08015DB8
	ldr r0, _08015DB4 @ =gSaXVision
	movs r2, #0
	movs r1, #2
_08015DA8:
	strb r1, [r0]
	strb r2, [r0, #1]
	b _08015DBE
	.align 2, 0
_08015DB0: .4byte gPreviousCollisionCheck
_08015DB4: .4byte gSaXVision
_08015DB8:
	ldr r1, _08015DD0 @ =gSaXVision
	movs r0, #0
	strb r0, [r1, #2]
_08015DBE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015DD0: .4byte gSaXVision

	thumb_func_start unk_15dd4
unk_15dd4: @ 0x08015DD4
	push {r4, lr}
	ldr r4, _08015E00 @ =gSaXVision
	ldrb r0, [r4, #2]
	cmp r0, #1
	bne _08015E4E
	movs r0, #0xf0
	lsls r0, r0, #1
	movs r1, #0xaa
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r3, r0, #0
	ldr r2, _08015E04 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08015E08
	cmp r3, #8
	bne _08015E20
	b _08015E0C
	.align 2, 0
_08015E00: .4byte gSaXVision
_08015E04: .4byte gCurrentSprite
_08015E08:
	cmp r3, #4
	bne _08015E20
_08015E0C:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	ldrb r1, [r4]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r1, [r0]
	movs r0, #1
	b _08015E82
_08015E20:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #2
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r3, r0, #0
	ldr r2, _08015E44 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08015E48
	cmp r3, #4
	bne _08015E80
	b _08015E74
	.align 2, 0
_08015E44: .4byte gCurrentSprite
_08015E48:
	cmp r3, #8
	bne _08015E80
	b _08015E74
_08015E4E:
	ldr r2, _08015E64 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08015E68
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _08015E80
	b _08015E6E
	.align 2, 0
_08015E64: .4byte gCurrentSprite
_08015E68:
	ldrb r0, [r4, #4]
	cmp r0, #1
	bne _08015E80
_08015E6E:
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _08015E80
_08015E74:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
	movs r0, #1
	b _08015E82
_08015E80:
	movs r0, #0
_08015E82:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start unk_15e88
unk_15e88: @ 0x08015E88
	push {r4, r5, r6, r7, lr}
	ldr r1, _08015EC4 @ =gCurrentSprite
	adds r5, r1, #0
	adds r5, #0x24
	ldrb r7, [r5]
	ldrh r3, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r2, r1, #0
	cmp r4, #0
	beq _08015EF2
	ldr r4, _08015EC8 @ =gSaXVision
	ldrb r0, [r4, #2]
	cmp r0, #1
	bne _08015ECC
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	orrs r0, r3
	strh r0, [r2]
	strh r1, [r2, #6]
	ldrb r0, [r4, #1]
	cmp r0, #1
	beq _08015F38
	movs r0, #0x39
	b _08015F3A
	.align 2, 0
_08015EC4: .4byte gCurrentSprite
_08015EC8: .4byte gSaXVision
_08015ECC:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08015F3C
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	orrs r0, r3
	strh r0, [r2]
	strh r1, [r2, #6]
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _08015F38
	movs r0, #0x39
	b _08015F3A
_08015EF2:
	ldr r6, _08015F10 @ =gSaXVision
	ldrb r0, [r6, #2]
	cmp r0, #1
	bne _08015F14
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r0, r3
	strh r0, [r2]
	strh r4, [r2, #6]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08015F38
	movs r0, #0x39
	b _08015F3A
	.align 2, 0
_08015F10: .4byte gSaXVision
_08015F14:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08015F3C
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r0, r3
	strh r0, [r2]
	strh r4, [r2, #6]
	ldrb r0, [r6, #4]
	cmp r0, #1
	bne _08015F38
	movs r0, #0x39
	b _08015F3A
_08015F38:
	movs r0, #0x17
_08015F3A:
	strb r0, [r5]
_08015F3C:
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r7, r0
	beq _08015F4A
	movs r0, #1
	b _08015F4C
_08015F4A:
	movs r0, #0
_08015F4C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_15f54
unk_15f54: @ 0x08015F54
	push {r4, r5, r6, r7, lr}
	ldr r1, _08015F90 @ =gCurrentSprite
	adds r5, r1, #0
	adds r5, #0x24
	ldrb r7, [r5]
	ldrh r2, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r3, r1, #0
	cmp r4, #0
	beq _08015FD4
	ldr r0, _08015F94 @ =gSaXVision
	ldrb r1, [r0, #2]
	adds r6, r0, #0
	cmp r1, #1
	bne _08015F98
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	orrs r0, r2
	strh r0, [r3]
	strh r1, [r3, #6]
	ldrb r0, [r6, #1]
	cmp r0, #1
	beq _08015FF0
	b _08015FFC
	.align 2, 0
_08015F90: .4byte gCurrentSprite
_08015F94: .4byte gSaXVision
_08015F98:
	ldrb r0, [r6, #4]
	cmp r0, #0
	bne _08015FA8
	ldrb r0, [r6, #5]
	cmp r0, #0
	beq _08015FA8
	movs r0, #3
	strb r0, [r5]
_08015FA8:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08016046
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	strh r2, [r3, #6]
	ldrb r0, [r6, #4]
	cmp r0, #0
	bne _0801603E
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x39
	b _08016044
_08015FD4:
	ldr r0, _08015FF8 @ =gSaXVision
	ldrb r1, [r0, #2]
	adds r6, r0, #0
	cmp r1, #1
	bne _08016002
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r0, r2
	strh r0, [r3]
	strh r4, [r3, #6]
	ldrb r0, [r6, #1]
	cmp r0, #0
	bne _08015FFC
_08015FF0:
	movs r0, #0x17
	strb r0, [r5]
	b _08016046
	.align 2, 0
_08015FF8: .4byte gSaXVision
_08015FFC:
	movs r0, #0x39
	strb r0, [r5]
	b _08016046
_08016002:
	ldrb r0, [r6, #4]
	cmp r0, #1
	bne _08016012
	ldrb r0, [r6, #5]
	cmp r0, #0
	beq _08016012
	movs r0, #3
	strb r0, [r5]
_08016012:
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08016046
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	strh r2, [r3, #6]
	ldrb r0, [r6, #4]
	cmp r0, #1
	bne _0801603E
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x39
	b _08016044
_0801603E:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x17
_08016044:
	strb r0, [r1]
_08016046:
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r7, r0
	beq _08016054
	movs r0, #1
	b _08016056
_08016054:
	movs r0, #0
_08016056:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start unk_1605c
unk_1605c: @ 0x0801605C
	push {r4, r5, r6, lr}
	ldr r4, _080160A0 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl unk_1129c
	ldr r5, _080160A4 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	cmp r2, #0
	bne _080160D2
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080160A8
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08016092
	b _0801620C
_08016092:
	cmp r0, #4
	beq _080160C4
	cmp r0, #2
	beq _0801609C
	b _08016214
_0801609C:
	b _080160C4
	.align 2, 0
_080160A0: .4byte gCurrentSprite
_080160A4: .4byte gPreviousVerticalCollisionCheck
_080160A8:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080160BA
	b _0801620C
_080160BA:
	cmp r0, #5
	beq _080160C4
	cmp r0, #3
	beq _080160C4
	b _08016214
_080160C4:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _08016214
_080160D2:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016170
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _080160E8
	b _08016214
_080160E8:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08016124 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080160FC
	b _0801620C
_080160FC:
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08016166
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08016128
	movs r0, #2
	b _0801620A
	.align 2, 0
_08016124: .4byte gPreviousCollisionCheck
_08016128:
	ldrh r0, [r4, #2]
	ldr r1, _08016144 @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08016148
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08016212
	.align 2, 0
_08016144: .4byte 0xFFFFFEFC
_08016148:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08016162
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08016212
_08016162:
	movs r0, #2
	b _0801620A
_08016166:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	b _080161FE
_08016170:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _08016214
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080161B4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801620C
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080161F6
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080161B8
	movs r0, #2
	b _0801620A
	.align 2, 0
_080161B4: .4byte gPreviousCollisionCheck
_080161B8:
	ldrh r0, [r4, #2]
	ldr r1, _080161D4 @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080161D8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08016212
	.align 2, 0
_080161D4: .4byte 0xFFFFFEFC
_080161D8:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080161F2
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _08016212
_080161F2:
	movs r0, #2
	b _0801620A
_080161F6:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
_080161FE:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08016214
	movs r0, #1
_0801620A:
	strb r0, [r6]
_0801620C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
_08016212:
	strb r0, [r1]
_08016214:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XInit
SA_XInit: @ 0x0801621C
	push {r4, r5, lr}
	ldr r5, _08016290 @ =gCurrentSprite
	ldrh r1, [r5]
	movs r0, #4
	movs r4, #0
	movs r3, #0
	adds r2, r0, #0
	orrs r2, r1
	adds r1, r5, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r1, #5
	movs r0, #0x28
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x28
	strb r4, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	ldr r0, _08016294 @ =0x0000FF88
	strh r0, [r5, #0xa]
	strh r3, [r5, #0xc]
	adds r0, #0x68
	strh r0, [r5, #0xe]
	strh r1, [r5, #0x10]
	ldr r0, _08016298 @ =0x082E7F70
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r3, [r5, #0x16]
	ldr r0, _0801629C @ =0x0000FBFF
	ands r2, r0
	strh r2, [r5]
	strh r3, [r5, #6]
	ldr r2, _080162A0 @ =sPrimarySpriteStats
	ldrb r1, [r5, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0x14]
	bl SpriteUtilMakeSpriteFaceSamusDirection
	bl SA_XSetDirection
	ldr r0, _080162A4 @ =gSaXData
	strb r4, [r0, #0x12]
	strb r4, [r0, #0x13]
	strb r4, [r0, #3]
	strb r4, [r0, #4]
	strb r4, [r0, #6]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016290: .4byte gCurrentSprite
_08016294: .4byte 0x0000FF88
_08016298: .4byte 0x082E7F70
_0801629C: .4byte 0x0000FBFF
_080162A0: .4byte sPrimarySpriteStats
_080162A4: .4byte gSaXData

	thumb_func_start SA_XElevatorInit
SA_XElevatorInit: @ 0x080162A8
	push {lr}
	bl SA_XInit
	ldr r0, _080162BC @ =gCurrentSprite
	adds r0, #0x25
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080162BC: .4byte gCurrentSprite

	thumb_func_start SA_XFallingInit
SA_XFallingInit: @ 0x080162C0
	push {r4, r5, lr}
	ldr r5, _080162EC @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x16
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	strb r2, [r0]
	movs r4, #0
	ldr r0, _080162F0 @ =0x0000FF88
	strh r0, [r5, #0xa]
	movs r0, #7
	bl SetSA_XPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080162EC: .4byte gCurrentSprite
_080162F0: .4byte 0x0000FF88

	thumb_func_start SA_XFalling
SA_XFalling: @ 0x080162F4
	push {r4, r5, r6, lr}
	ldr r4, _08016334 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2d
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801635E
	ldr r0, _08016338 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _080163C0
	ldrh r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	beq _08016354
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08016340
	ldr r0, _0801633C @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _080163C0
	b _08016348
	.align 2, 0
_08016334: .4byte gCurrentSprite
_08016338: .4byte gSaXData
_0801633C: .4byte gSaXVision
_08016340:
	ldr r0, _08016350 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _080163C0
_08016348:
	movs r0, #0x39
	strb r0, [r1]
	b _080163C0
	.align 2, 0
_08016350: .4byte gSaXVision
_08016354:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	b _080163C0
_0801635E:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08016380 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016384
	strh r1, [r4, #2]
	movs r0, #1
	strb r0, [r5]
	movs r0, #6
	bl SetSA_XPose
	b _080163C0
	.align 2, 0
_08016380: .4byte gPreviousVerticalCollisionCheck
_08016384:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _080163AC @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080163B0 @ =0x00007FFF
	cmp r1, r0
	bne _080163B4
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080163BE
	.align 2, 0
_080163AC: .4byte sSpritesFallingSpeed
_080163B0: .4byte 0x00007FFF
_080163B4:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_080163BE:
	strh r0, [r4, #2]
_080163C0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XStandingInit
SA_XStandingInit: @ 0x080163C8
	push {lr}
	ldr r2, _080163E8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _080163EC @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_080163E8: .4byte gCurrentSprite
_080163EC: .4byte 0x0000FF88

	thumb_func_start SA_XStanding
SA_XStanding: @ 0x080163F0
	push {r4, r5, lr}
	bl unk_1129c
	ldr r0, _08016408 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016410
	ldr r0, _0801640C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0801648A
	.align 2, 0
_08016408: .4byte gPreviousVerticalCollisionCheck
_0801640C: .4byte gCurrentSprite
_08016410:
	ldr r4, _0801645C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801648A
	ldr r5, _08016460 @ =gSaXVision
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _08016482
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0xf0
	lsls r0, r0, #1
	movs r1, #0xaa
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016464
	cmp r2, #8
	beq _08016468
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	b _08016488
	.align 2, 0
_0801645C: .4byte gCurrentSprite
_08016460: .4byte gSaXVision
_08016464:
	cmp r2, #4
	bne _0801647A
_08016468:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _0801648A
_0801647A:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	b _08016488
_08016482:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
_08016488:
	strb r0, [r1]
_0801648A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SA_XWalkingInit
SA_XWalkingInit: @ 0x08016490
	push {lr}
	ldr r3, _080164B4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	ldr r0, _080164B8 @ =0x0000FF88
	strh r0, [r3, #0xa]
	movs r0, #1
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_080164B4: .4byte gCurrentSprite
_080164B8: .4byte 0x0000FF88

	thumb_func_start SA_XWalking
SA_XWalking: @ 0x080164BC
	push {r4, lr}
	bl unk_15f54
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080164F8
	bl unk_1605c
	ldr r1, _08016500 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	bne _080164F8
	ldr r0, _08016504 @ =0x082E6BBC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _080164F8
	adds r0, #1
	strb r0, [r4]
_080164F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016500: .4byte gCurrentSprite
_08016504: .4byte 0x082E6BBC

	thumb_func_start SA_XTurningInit
SA_XTurningInit: @ 0x08016508
	push {lr}
	ldr r2, _08016524 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08016528 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08016524: .4byte gCurrentSprite
_08016528: .4byte 0x0000FF88

	thumb_func_start SA_XTurning
SA_XTurning: @ 0x0801652C
	push {lr}
	ldr r0, _08016554 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08016550
	ldr r2, _08016558 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	bl SA_XSetDirection
_08016550:
	pop {r0}
	bx r0
	.align 2, 0
_08016554: .4byte gSaXData
_08016558: .4byte gCurrentSprite

	thumb_func_start SA_XTurningChaseStartInit
SA_XTurningChaseStartInit: @ 0x0801655C
	push {lr}
	ldr r2, _08016578 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	ldr r0, _0801657C @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08016578: .4byte gCurrentSprite
_0801657C: .4byte 0x0000FF88

	thumb_func_start SA_XTurningChaseStart
SA_XTurningChaseStart: @ 0x08016580
	push {r4, lr}
	ldr r0, _080165B0 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _080165C0
	ldr r4, _080165B4 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	bl SA_XSetDirection
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080165B8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	b _080165BE
	.align 2, 0
_080165B0: .4byte gSaXData
_080165B4: .4byte gCurrentSprite
_080165B8:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #1
_080165BE:
	strb r0, [r1]
_080165C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XRunningStart
SA_XRunningStart: @ 0x080165C8
	push {lr}
	ldr r3, _080165F4 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	ldr r0, _080165F8 @ =0x0000FF88
	strh r0, [r3, #0xa]
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080165F0
	movs r0, #0
	bl SetSA_XPose
_080165F0:
	pop {r0}
	bx r0
	.align 2, 0
_080165F4: .4byte gCurrentSprite
_080165F8: .4byte 0x0000FF88

	thumb_func_start SA_XRunning
SA_XRunning: @ 0x080165FC
	push {r4, lr}
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016638
	bl unk_1605c
	ldr r1, _08016640 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _08016638
	ldr r0, _08016644 @ =0x082E6BCC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _08016638
	adds r0, #1
	strb r0, [r4]
_08016638:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016640: .4byte gCurrentSprite
_08016644: .4byte 0x082E6BCC

	thumb_func_start SA_XMidAirInit
SA_XMidAirInit: @ 0x08016648
	push {r4, r5, lr}
	ldr r5, _0801667C @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x38
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	strb r2, [r0]
	movs r4, #0
	ldr r0, _08016680 @ =0x0000FFB0
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #2]
	subs r0, #0x20
	strh r0, [r5, #2]
	movs r0, #5
	bl SetSA_XPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801667C: .4byte gCurrentSprite
_08016680: .4byte 0x0000FFB0

	thumb_func_start SA_XMidAir
SA_XMidAir: @ 0x08016684
	push {r4, r5, r6, lr}
	ldr r3, _080166C8 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080166F2
	ldr r0, _080166CC @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	beq _0801669C
	b _08016850
_0801669C:
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	beq _080166E8
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080166D4
	ldr r0, _080166D0 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _080166C4
	b _08016850
_080166C4:
	b _080166DE
	.align 2, 0
_080166C8: .4byte gCurrentSprite
_080166CC: .4byte gSaXData
_080166D0: .4byte gSaXVision
_080166D4:
	ldr r0, _080166E4 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #1
	beq _080166DE
	b _08016850
_080166DE:
	movs r0, #0x39
	strb r0, [r1]
	b _08016850
	.align 2, 0
_080166E4: .4byte gSaXVision
_080166E8:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _08016850
_080166F2:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08016714
	ldr r1, _08016710 @ =0x082E6BCC
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsrs r0, r0, #3
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	b _08016716
	.align 2, 0
_08016710: .4byte 0x082E6BCC
_08016714:
	movs r5, #4
_08016716:
	ldr r4, _08016750 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016758
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08016754 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0x11
	beq _08016784
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	beq _08016784
	ldrh r0, [r4, #4]
	adds r0, r0, r5
	b _08016782
	.align 2, 0
_08016750: .4byte gCurrentSprite
_08016754: .4byte gPreviousCollisionCheck
_08016758:
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08016798 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0x11
	beq _08016784
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	beq _08016784
	ldrh r0, [r4, #4]
	subs r0, r0, r5
_08016782:
	strh r0, [r4, #4]
_08016784:
	ldr r1, _0801679C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #1
	bne _080167A4
	ldr r0, _080167A0 @ =0x082E6BF0
	b _080167E2
	.align 2, 0
_08016798: .4byte gPreviousCollisionCheck
_0801679C: .4byte gCurrentSprite
_080167A0: .4byte 0x082E6BF0
_080167A4:
	cmp r0, #2
	bne _080167B0
	ldr r0, _080167AC @ =0x082E6C04
	b _080167E2
	.align 2, 0
_080167AC: .4byte 0x082E6C04
_080167B0:
	cmp r0, #3
	bne _080167D4
	ldr r0, _080167D0 @ =0x082E6C18
	adds r4, r6, #0
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r5, [r1]
	cmp r2, #0x46
	bhi _080167FC
	b _080167F8
	.align 2, 0
_080167D0: .4byte 0x082E6C18
_080167D4:
	cmp r0, #4
	bne _080167E0
	ldr r0, _080167DC @ =0x082E6C3C
	b _080167E2
	.align 2, 0
_080167DC: .4byte 0x082E6C3C
_080167E0:
	ldr r0, _08016830 @ =0x082E6BDC
_080167E2:
	adds r4, r6, #0
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r5, [r1]
	cmp r2, #0x26
	bhi _080167FC
_080167F8:
	adds r0, r3, #1
	strb r0, [r4]
_080167FC:
	adds r4, r6, #0
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
	lsls r0, r5, #0x10
	cmp r0, #0
	ble _08016838
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08016834 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016850
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	movs r0, #6
	bl SetSA_XPose
	b _08016850
	.align 2, 0
_08016830: .4byte 0x082E6BDC
_08016834: .4byte gPreviousVerticalCollisionCheck
_08016838:
	ldrh r0, [r6, #2]
	subs r0, #0x58
	ldrh r1, [r6, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08016858 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08016850
	ldrh r0, [r6, #2]
	subs r0, r0, r5
	strh r0, [r6, #2]
_08016850:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08016858: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XDelayBeforeShootingBeamInit
SA_XDelayBeforeShootingBeamInit: @ 0x0801685C
	push {r4, lr}
	ldr r4, _08016898 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x10
	strb r0, [r1]
	movs r0, #2
	bl SetSA_XPose
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	beq _0801688E
	cmp r1, #1
	beq _0801688E
	cmp r1, #2
	bne _08016892
_0801688E:
	ldr r0, _0801689C @ =gSaXData
	strb r1, [r0, #3]
_08016892:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016898: .4byte gCurrentSprite
_0801689C: .4byte gSaXData

	thumb_func_start SA_XDelayBeforeShootingBeam
SA_XDelayBeforeShootingBeam: @ 0x080168A0
	push {r4, lr}
	bl unk_1129c
	ldr r0, _080168B8 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _080168C0
	ldr r0, _080168BC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _08016950
	.align 2, 0
_080168B8: .4byte gPreviousVerticalCollisionCheck
_080168BC: .4byte gCurrentSprite
_080168C0:
	ldr r4, _080168D0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _080168D4
	subs r0, #1
	b _0801694E
	.align 2, 0
_080168D0: .4byte gCurrentSprite
_080168D4:
	ldr r0, _0801690C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x31
	beq _08016950
	cmp r0, #0x30
	bne _08016948
	movs r0, #0xf0
	lsls r0, r0, #1
	movs r1, #0xaa
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016918
	cmp r2, #8
	beq _08016928
	cmp r2, #4
	bne _08016910
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801694E
	.align 2, 0
_0801690C: .4byte gSamusData
_08016910:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	b _0801694E
_08016918:
	cmp r2, #8
	bne _08016924
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801694E
_08016924:
	cmp r2, #4
	bne _08016940
_08016928:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2d
	strb r0, [r1]
	ldr r0, _0801693C @ =gSaXVision
	ldrb r1, [r0]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _08016950
	.align 2, 0
_0801693C: .4byte gSaXVision
_08016940:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	b _0801694E
_08016948:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2b
_0801694E:
	strb r0, [r1]
_08016950:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XShootingBeamInit
SA_XShootingBeamInit: @ 0x08016958
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _080169A0 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	mov r4, ip
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080169EC
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080169A4
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	b _08016A0E
	.align 2, 0
_080169A0: .4byte gCurrentSprite
_080169A4:
	cmp r0, #1
	bne _080169C4
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x88
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	b _08016A34
_080169C4:
	cmp r0, #2
	bne _08016A62
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #2
	bl SpriteSpawnSecondary
	b _08016A62
_080169EC:
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016A18
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r1, [sp, #8]
_08016A0E:
	movs r0, #0
	movs r1, #0
	bl SpriteSpawnSecondary
	b _08016A62
_08016A18:
	cmp r0, #1
	bne _08016A3E
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r0, #0x88
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r1, [sp, #8]
_08016A34:
	movs r0, #0
	movs r1, #1
	bl SpriteSpawnSecondary
	b _08016A62
_08016A3E:
	cmp r0, #2
	bne _08016A62
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #2
	bl SpriteSpawnSecondary
_08016A62:
	ldr r1, _08016A78 @ =gSaXData
	movs r0, #0
	strb r0, [r1, #4]
	movs r0, #3
	bl SetSA_XPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016A78: .4byte gSaXData

	thumb_func_start SA_XShootingBeam
SA_XShootingBeam: @ 0x08016A7C
	push {r4, lr}
	bl unk_1129c
	ldr r0, _08016A94 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016A9C
	ldr r0, _08016A98 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _08016B1E
	.align 2, 0
_08016A94: .4byte gPreviousVerticalCollisionCheck
_08016A98: .4byte gCurrentSprite
_08016A9C:
	ldr r0, _08016AB8 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08016B1E
	ldr r4, _08016ABC @ =gSaXVision
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _08016AC4
	ldr r0, _08016AC0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x17
	strb r1, [r0]
	b _08016B1E
	.align 2, 0
_08016AB8: .4byte gSaXData
_08016ABC: .4byte gSaXVision
_08016AC0: .4byte gCurrentSprite
_08016AC4:
	movs r0, #0xf0
	lsls r0, r0, #1
	movs r1, #0xaa
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r3, r0, #0
	ldr r2, _08016AF0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016AF4
	cmp r3, #8
	beq _08016B04
	cmp r3, #4
	bne _08016B16
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x39
	b _08016B1C
	.align 2, 0
_08016AF0: .4byte gCurrentSprite
_08016AF4:
	cmp r3, #8
	bne _08016B00
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x39
	b _08016B1C
_08016B00:
	cmp r3, #4
	bne _08016B16
_08016B04:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	ldrb r1, [r4]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _08016B1E
_08016B16:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
_08016B1C:
	strb r0, [r1]
_08016B1E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SA_XDelayBeforeShootingMissileInit
SA_XDelayBeforeShootingMissileInit: @ 0x08016B24
	push {lr}
	ldr r2, _08016B54 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x28
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016B58
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08016B62
	cmp r0, #1
	beq _08016B6A
	b _08016B6E
	.align 2, 0
_08016B54: .4byte gCurrentSprite
_08016B58:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016B66
_08016B62:
	movs r3, #0
	b _08016B74
_08016B66:
	cmp r0, #1
	bne _08016B6E
_08016B6A:
	movs r3, #1
	b _08016B74
_08016B6E:
	cmp r0, #2
	bne _08016B74
	movs r3, #2
_08016B74:
	ldr r0, _08016B84 @ =gSaXData
	ldrb r1, [r0, #3]
	cmp r3, r1
	beq _08016B7E
	strb r3, [r0, #3]
_08016B7E:
	pop {r0}
	bx r0
	.align 2, 0
_08016B84: .4byte gSaXData

	thumb_func_start SA_XDelayBeforeShootingMissile
SA_XDelayBeforeShootingMissile: @ 0x08016B88
	push {lr}
	ldr r1, _08016BA8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016BA2
	adds r1, #0x24
	movs r0, #0x2f
	strb r0, [r1]
_08016BA2:
	pop {r0}
	bx r0
	.align 2, 0
_08016BA8: .4byte gCurrentSprite

	thumb_func_start SA_XShootingMissileInit
SA_XShootingMissileInit: @ 0x08016BAC
	push {lr}
	sub sp, #0xc
	ldr r2, _08016BF0 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x30
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08016C30
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016BF4
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r2, #4]
	adds r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #0
	b _08016C70
	.align 2, 0
_08016BF0: .4byte gCurrentSprite
_08016BF4:
	cmp r0, #1
	bne _08016C10
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	subs r0, #0x88
	str r0, [sp]
	ldrh r0, [r2, #4]
	adds r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	b _08016C6C
_08016C10:
	cmp r0, #2
	bne _08016C9A
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r2, #4]
	adds r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #1
	movs r1, #2
	b _08016C70
_08016C30:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016C54
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r2, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #0
	b _08016C70
_08016C54:
	cmp r0, #1
	bne _08016C78
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	subs r0, #0x88
	str r0, [sp]
	ldrh r0, [r2, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r1, [sp, #8]
_08016C6C:
	movs r0, #1
	movs r1, #1
_08016C70:
	movs r2, #0
	bl SpriteSpawnSecondary
	b _08016C9A
_08016C78:
	cmp r0, #2
	bne _08016C9A
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r2, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r2, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #1
	movs r1, #2
	movs r2, #0
	bl SpriteSpawnSecondary
_08016C9A:
	ldr r1, _08016CAC @ =gSaXData
	movs r0, #1
	strb r0, [r1, #4]
	movs r0, #3
	bl SetSA_XPose
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08016CAC: .4byte gSaXData

	thumb_func_start SA_XShootingMissile
SA_XShootingMissile: @ 0x08016CB0
	push {lr}
	bl unk_1129c
	ldr r0, _08016CC8 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08016CD0
	ldr r0, _08016CCC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _08016CFA
	.align 2, 0
_08016CC8: .4byte gPreviousVerticalCollisionCheck
_08016CCC: .4byte gCurrentSprite
_08016CD0:
	ldr r0, _08016CE8 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08016CFC
	ldr r0, _08016CEC @ =gSaXVision
	ldrb r0, [r0, #2]
	cmp r0, #0
	bne _08016CF4
	ldr r0, _08016CF0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x17
	b _08016CFA
	.align 2, 0
_08016CE8: .4byte gSaXData
_08016CEC: .4byte gSaXVision
_08016CF0: .4byte gCurrentSprite
_08016CF4:
	ldr r0, _08016D00 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x31
_08016CFA:
	strb r1, [r0]
_08016CFC:
	pop {r0}
	bx r0
	.align 2, 0
_08016D00: .4byte gCurrentSprite

	thumb_func_start SA_XIdleAfterShootingMissileInit
SA_XIdleAfterShootingMissileInit: @ 0x08016D04
	ldr r1, _08016D18 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x32
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	bx lr
	.align 2, 0
_08016D18: .4byte gCurrentSprite

	thumb_func_start SA_XIdleAfterShootingMissile
SA_XIdleAfterShootingMissile: @ 0x08016D1C
	push {r4, r5, lr}
	ldr r4, _08016D34 @ =gCurrentSprite
	movs r0, #0
	strb r0, [r4, #0x1c]
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08016D38
	subs r0, #1
	b _08016DA4
	.align 2, 0
_08016D34: .4byte gCurrentSprite
_08016D38:
	ldr r0, _08016D74 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x30
	beq _08016D9E
	ldr r5, _08016D78 @ =gSaXVision
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _08016D9E
	movs r0, #0xf0
	lsls r0, r0, #1
	movs r1, #0xaa
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08016D7C
	cmp r2, #8
	beq _08016D8C
	cmp r2, #4
	bne _08016D9E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _08016DA4
	.align 2, 0
_08016D74: .4byte gSamusData
_08016D78: .4byte gSaXVision
_08016D7C:
	cmp r2, #8
	bne _08016D88
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _08016DA4
_08016D88:
	cmp r2, #4
	bne _08016D9E
_08016D8C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _08016DA6
_08016D9E:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
_08016DA4:
	strb r0, [r1]
_08016DA6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SA_XMorphingInit
SA_XMorphingInit: @ 0x08016DAC
	push {lr}
	ldr r2, _08016DC8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08016DCC @ =0x0000FFB0
	strh r0, [r2, #0xa]
	movs r0, #0xd
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08016DC8: .4byte gCurrentSprite
_08016DCC: .4byte 0x0000FFB0

	thumb_func_start SA_XMorphing
SA_XMorphing: @ 0x08016DD0
	push {lr}
	ldr r0, _08016DE8 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #0xf
	bne _08016DE2
	ldr r0, _08016DEC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x3d
	strb r1, [r0]
_08016DE2:
	pop {r0}
	bx r0
	.align 2, 0
_08016DE8: .4byte gSaXData
_08016DEC: .4byte gCurrentSprite

	thumb_func_start SA_XRollingInit
SA_XRollingInit: @ 0x08016DF0
	push {lr}
	ldr r2, _08016E0C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3e
	strb r0, [r1]
	ldr r0, _08016E10 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x10
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08016E0C: .4byte gCurrentSprite
_08016E10: .4byte 0x0000FFD8

	thumb_func_start SA_XRolling
SA_XRolling: @ 0x08016E14
	push {r4, r5, lr}
	ldr r4, _08016E4C @ =gCurrentSprite
	ldrh r1, [r4]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08016E54
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x18
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08016E50 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _08016E68
	ldrh r0, [r4, #4]
	adds r0, #8
	strh r0, [r4, #4]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	adds r0, #0x10
	b _08016E8A
	.align 2, 0
_08016E4C: .4byte gCurrentSprite
_08016E50: .4byte gPreviousCollisionCheck
_08016E54:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x18
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08016E78 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08016E7C
_08016E68:
	ldrh r1, [r4]
	adds r0, r5, #0
	eors r0, r1
	strh r0, [r4]
	bl SA_XSetDirection
	b _08016E8C
	.align 2, 0
_08016E78: .4byte gPreviousCollisionCheck
_08016E7C:
	ldrh r0, [r4, #4]
	subs r0, #8
	strh r0, [r4, #4]
	adds r1, r4, #0
	adds r1, #0x2b
	ldrb r0, [r1]
	subs r0, #0x10
_08016E8A:
	strb r0, [r1]
_08016E8C:
	ldr r4, _08016EC4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08016EC8 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08016EBC
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08016EBC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3f
	strb r0, [r1]
_08016EBC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016EC4: .4byte gCurrentSprite
_08016EC8: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XUnmorphingInit
SA_XUnmorphingInit: @ 0x08016ECC
	push {lr}
	ldr r2, _08016EE8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _08016EEC @ =0x0000FFB0
	strh r0, [r2, #0xa]
	movs r0, #0xe
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08016EE8: .4byte gCurrentSprite
_08016EEC: .4byte 0x0000FFB0

	thumb_func_start SA_XUnmorphing
SA_XUnmorphing: @ 0x08016EF0
	push {lr}
	ldr r0, _08016F10 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08016F20
	ldr r2, _08016F14 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08016F18
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
	b _08016F1E
	.align 2, 0
_08016F10: .4byte gSaXData
_08016F14: .4byte gCurrentSprite
_08016F18:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
_08016F1E:
	strb r0, [r1]
_08016F20:
	pop {r0}
	bx r0

	thumb_func_start SA_XIdleBeforeShootingDoorInit
SA_XIdleBeforeShootingDoorInit: @ 0x08016F24
	push {lr}
	ldr r1, _08016F48 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x42
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	ldr r0, _08016F4C @ =gSaXData
	strb r3, [r0, #3]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08016F48: .4byte gCurrentSprite
_08016F4C: .4byte gSaXData

	thumb_func_start SA_XIdleBeforeShootingDoor
SA_XIdleBeforeShootingDoor: @ 0x08016F50
	push {lr}
	ldr r1, _08016F70 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08016F6A
	adds r1, #0x24
	movs r0, #0x43
	strb r0, [r1]
_08016F6A:
	pop {r0}
	bx r0
	.align 2, 0
_08016F70: .4byte gCurrentSprite

	thumb_func_start SA_XShootingDoorInit
SA_XShootingDoorInit: @ 0x08016F74
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _08016FB8 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r4, #0
	movs r0, #0x44
	strb r0, [r1]
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #0
	bl SpriteSpawnSecondary
	ldr r0, _08016FBC @ =gSaXData
	strb r4, [r0, #4]
	movs r0, #3
	bl SetSA_XPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016FB8: .4byte gCurrentSprite
_08016FBC: .4byte gSaXData

	thumb_func_start SA_XShootingDoor
SA_XShootingDoor: @ 0x08016FC0
	push {lr}
	ldr r0, _08016FD8 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08016FD2
	ldr r0, _08016FDC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x45
	strb r1, [r0]
_08016FD2:
	pop {r0}
	bx r0
	.align 2, 0
_08016FD8: .4byte gSaXData
_08016FDC: .4byte gCurrentSprite

	thumb_func_start SA_XIdleAfterShootingDoorInit
SA_XIdleAfterShootingDoorInit: @ 0x08016FE0
	push {lr}
	ldr r2, _08017000 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08017004 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08017000: .4byte gCurrentSprite
_08017004: .4byte 0x0000FF88

	thumb_func_start SA_XIdleAfterShootingDoor
SA_XIdleAfterShootingDoor: @ 0x08017008
	push {lr}
	ldr r1, _08017028 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017022
	adds r1, #0x24
	movs r0, #0x47
	strb r0, [r1]
_08017022:
	pop {r0}
	bx r0
	.align 2, 0
_08017028: .4byte gCurrentSprite

	thumb_func_start SA_XWalkingToDoorInit
SA_XWalkingToDoorInit: @ 0x0801702C
	push {lr}
	ldr r3, _08017050 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x48
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	ldr r0, _08017054 @ =0x0000FF88
	strh r0, [r3, #0xa]
	movs r0, #1
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08017050: .4byte gCurrentSprite
_08017054: .4byte 0x0000FF88

	thumb_func_start SA_XWalkingToDoor
SA_XWalkingToDoor: @ 0x08017058
	push {r4, r5, r6, lr}
	ldr r5, _08017080 @ =gSaXVision
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _0801708C
	ldr r3, _08017084 @ =gCurrentSprite
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	strh r2, [r3, #6]
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _08017088
	adds r1, r3, #0
	b _080170C2
	.align 2, 0
_08017080: .4byte gSaXVision
_08017084: .4byte gCurrentSprite
_08017088:
	adds r1, r3, #0
	b _080170B4
_0801708C:
	ldr r4, _080170BC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r6, #0x7f
	ands r6, r0
	cmp r6, #0
	beq _080170CA
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r4]
	strh r2, [r4, #6]
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _080170C0
	adds r1, r4, #0
_080170B4:
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
	b _08017100
	.align 2, 0
_080170BC: .4byte gCurrentSprite
_080170C0:
	adds r1, r4, #0
_080170C2:
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	b _08017100
_080170CA:
	ldr r0, _08017108 @ =0x082E6BBC
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r5]
	cmp r0, #0x3e
	bhi _080170EA
	adds r0, #1
	strb r0, [r5]
_080170EA:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801710C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08017100
	strh r6, [r4]
_08017100:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017108: .4byte 0x082E6BBC
_0801710C: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XBeamInit
SA_XBeamInit: @ 0x08017110
	push {r4, r5, lr}
	ldr r2, _08017174 @ =gCurrentSprite
	ldrh r0, [r2]
	ldr r3, _08017178 @ =0x0000FFFB
	ands r3, r0
	movs r4, #0
	movs r5, #0
	strh r3, [r2]
	movs r0, #0x25
	adds r0, r0, r2
	mov ip, r0
	movs r0, #7
	mov r1, ip
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0801717C @ =0x0000FFF4
	strh r1, [r2, #0xa]
	movs r0, #0xc
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	strb r4, [r2, #0x1c]
	strh r5, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x31
	strb r4, [r0]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	subs r1, #2
	movs r0, #3
	strb r0, [r1]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0
	bne _08017184
	ldr r0, _08017180 @ =0x082E7F80
	str r0, [r2, #0x18]
	b _080171D0
	.align 2, 0
_08017174: .4byte gCurrentSprite
_08017178: .4byte 0x0000FFFB
_0801717C: .4byte 0x0000FFF4
_08017180: .4byte 0x082E7F80
_08017184:
	cmp r0, #1
	bne _08017194
	ldr r0, _08017190 @ =0x082E7F90
	str r0, [r2, #0x18]
	b _080171D0
	.align 2, 0
_08017190: .4byte 0x082E7F90
_08017194:
	cmp r0, #2
	bne _080171B0
	ldr r0, _080171AC @ =0x082E7F90
	str r0, [r2, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r0, #0
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _080171D0
	.align 2, 0
_080171AC: .4byte 0x082E7F90
_080171B0:
	cmp r0, #0x80
	bne _080171CC
	movs r0, #4
	adds r1, r3, #0
	orrs r1, r0
	strh r1, [r2]
	ldr r0, _080171C8 @ =0x082E7F80
	str r0, [r2, #0x18]
	mov r1, ip
	strb r4, [r1]
	b _080171D0
	.align 2, 0
_080171C8: .4byte 0x082E7F80
_080171CC:
	strh r5, [r2]
	b _080171D8
_080171D0:
	movs r0, #0x97
	lsls r0, r0, #2
	bl SoundPlay
_080171D8:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XBeamMove
SA_XBeamMove: @ 0x080171E0
	push {r4, r5, r6, r7, lr}
	ldr r0, _08017208 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x31
	ldrb r5, [r1]
	ldrb r1, [r0, #0x1e]
	adds r4, r0, #0
	cmp r1, #1
	beq _0801720C
	cmp r1, #2
	beq _08017254
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080172A8
	ldrh r0, [r4, #4]
	adds r0, #0x14
	b _080172AC
	.align 2, 0
_08017208: .4byte gCurrentSprite
_0801720C:
	ldrh r0, [r4, #2]
	subs r0, #0xf
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08017222
	ldrh r0, [r4, #4]
	adds r0, #0xf
	b _0801726E
_08017222:
	ldrh r0, [r4, #4]
	subs r0, #0xf
_08017226:
	strh r0, [r4, #4]
	ldr r7, _08017248 @ =0x082E6BAC
	lsls r0, r5, #1
	adds r1, r0, r7
	ldr r6, _0801724C @ =0x082E6BB4
	adds r0, r0, r6
	ldrh r3, [r0]
	ldrh r2, [r1]
	movs r0, #0
	ldrsh r1, [r1, r0]
	ldr r0, _08017250 @ =0x00007FFF
	cmp r1, r0
	bne _08017288
	movs r5, #0
	ldrh r2, [r7]
	ldrh r3, [r6]
	b _08017288
	.align 2, 0
_08017248: .4byte 0x082E6BAC
_0801724C: .4byte 0x082E6BB4
_08017250: .4byte 0x00007FFF
_08017254:
	ldrh r0, [r4, #2]
	adds r0, #0xf
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801726A
	ldrh r0, [r4, #4]
	adds r0, #0xf
	b _08017226
_0801726A:
	ldrh r0, [r4, #4]
	subs r0, #0xf
_0801726E:
	strh r0, [r4, #4]
	ldr r6, _080172A0 @ =0x082E6BAC
	lsls r0, r5, #1
	adds r0, r0, r6
	ldrh r2, [r0]
	lsls r1, r2, #0x10
	lsrs r3, r1, #0x10
	ldr r0, _080172A4 @ =0x7FFF0000
	cmp r1, r0
	bne _08017288
	movs r5, #0
	ldrh r2, [r6]
	adds r3, r2, #0
_08017288:
	adds r0, r5, #1
	adds r1, r4, #0
	adds r1, #0x31
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, r0, r3
	strh r0, [r4, #4]
	b _080172D2
	.align 2, 0
_080172A0: .4byte 0x082E6BAC
_080172A4: .4byte 0x7FFF0000
_080172A8:
	ldrh r0, [r4, #4]
	subs r0, #0x14
_080172AC:
	strh r0, [r4, #4]
	ldr r3, _08017304 @ =0x082E6BA4
	lsls r0, r5, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08017308 @ =0x00007FFF
	cmp r1, r0
	bne _080172C4
	movs r5, #0
	ldrh r2, [r3]
_080172C4:
	adds r0, r5, #1
	adds r1, r4, #0
	adds r1, #0x31
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
_080172D2:
	ldr r1, _0801730C @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080172FE
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080172FE
	strh r0, [r4]
_080172FE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017304: .4byte 0x082E6BA4
_08017308: .4byte 0x00007FFF
_0801730C: .4byte gCurrentClipdataAffectingAction

	thumb_func_start SA_XMissileInit
SA_XMissileInit: @ 0x08017310
	push {r4, r5, lr}
	ldr r2, _08017368 @ =gCurrentSprite
	ldrh r0, [r2]
	ldr r3, _0801736C @ =0x0000FFFB
	ands r3, r0
	movs r5, #0
	movs r4, #0
	strh r3, [r2]
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #8
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08017370 @ =0x0000FFF4
	strh r1, [r2, #0xa]
	movs r0, #0xc
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	strb r5, [r2, #0x1c]
	strh r4, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #2
	strb r0, [r1]
	subs r1, #2
	movs r0, #3
	strb r0, [r1]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0
	bne _08017378
	ldr r0, _08017374 @ =0x082E7FC8
	str r0, [r2, #0x18]
	b _080173A8
	.align 2, 0
_08017368: .4byte gCurrentSprite
_0801736C: .4byte 0x0000FFFB
_08017370: .4byte 0x0000FFF4
_08017374: .4byte 0x082E7FC8
_08017378:
	cmp r0, #1
	bne _08017388
	ldr r0, _08017384 @ =0x082E7FB0
	str r0, [r2, #0x18]
	b _080173A8
	.align 2, 0
_08017384: .4byte 0x082E7FB0
_08017388:
	cmp r0, #2
	bne _080173A4
	ldr r0, _080173A0 @ =0x082E7FB0
	str r0, [r2, #0x18]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r0, #0
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _080173A8
	.align 2, 0
_080173A0: .4byte 0x082E7FB0
_080173A4:
	strh r4, [r2]
	b _080173AE
_080173A8:
	ldr r0, _080173B4 @ =0x0000025D
	bl SoundPlay
_080173AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080173B4: .4byte 0x0000025D

	thumb_func_start SA_XMissileExploding
SA_XMissileExploding: @ 0x080173B8
	push {lr}
	ldr r1, _080173E4 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	movs r2, #0xd
	bl ParticleSet
	ldr r0, _080173E8 @ =0x0000025E
	bl SoundPlay
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	pop {r0}
	bx r0
	.align 2, 0
_080173E4: .4byte gCurrentSprite
_080173E8: .4byte 0x0000025E

	thumb_func_start SA_XMissileMoving
SA_XMissileMoving: @ 0x080173EC
	push {r4, lr}
	ldr r0, _0801740C @ =gCurrentSprite
	ldrb r2, [r0, #0x1e]
	adds r4, r0, #0
	cmp r2, #1
	beq _08017410
	cmp r2, #2
	beq _0801742C
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08017448
	ldrh r0, [r4, #4]
	adds r0, #0x1c
	b _0801744C
	.align 2, 0
_0801740C: .4byte gCurrentSprite
_08017410:
	ldrh r0, [r4, #2]
	subs r0, #0x15
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08017426
	ldrh r0, [r4, #4]
	adds r0, #0x15
	b _0801744C
_08017426:
	ldrh r0, [r4, #4]
	subs r0, #0x15
	b _0801744C
_0801742C:
	ldrh r0, [r4, #2]
	adds r0, #0x15
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08017442
	ldrh r0, [r4, #4]
	adds r0, #0x15
	b _0801744C
_08017442:
	ldrh r0, [r4, #4]
	subs r0, #0x15
	b _0801744C
_08017448:
	ldrh r0, [r4, #4]
	subs r0, #0x1c
_0801744C:
	strh r0, [r4, #4]
	ldr r1, _0801746C @ =gCurrentClipdataAffectingAction
	movs r0, #8
	strb r0, [r1]
	adds r1, r4, #0
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08017470 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08017474
	bl SA_XMissileExploding
	b _08017492
	.align 2, 0
_0801746C: .4byte gCurrentClipdataAffectingAction
_08017470: .4byte gPreviousCollisionCheck
_08017474:
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08017492
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08017492
	strh r0, [r4]
_08017492:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start SA_XPowerBombInit
SA_XPowerBombInit: @ 0x08017498
	push {r4, lr}
	ldr r0, _080174FC @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08017500 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08017504 @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08017508 @ =0x082E7FE0
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	subs r1, #0xd
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x98
	lsls r0, r0, #2
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080174FC: .4byte gCurrentSprite
_08017500: .4byte 0x0000FFFB
_08017504: .4byte 0x0000FFFC
_08017508: .4byte 0x082E7FE0

	thumb_func_start SA_XPowerBombSpinningSlowly
SA_XPowerBombSpinningSlowly: @ 0x0801750C
	push {lr}
	ldr r2, _08017544 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0801753E
	ldr r0, _08017548 @ =0x082E8000
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r1, [r2, #0x16]
	movs r0, #0x3c
	strb r0, [r3]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_0801753E:
	pop {r0}
	bx r0
	.align 2, 0
_08017544: .4byte gCurrentSprite
_08017548: .4byte 0x082E8000

	thumb_func_start SA_XPowerBombSpinningQuickly
SA_XPowerBombSpinningQuickly: @ 0x0801754C
	push {r4, lr}
	ldr r4, _08017594 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801758C
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #2]
	movs r2, #1
	bl PowerBombExplosionStart
	ldrh r1, [r4]
	movs r0, #4
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #9
	strb r0, [r1]
	subs r1, #1
	movs r0, #0x1a
	strb r0, [r1]
	ldr r0, _08017598 @ =0x00000261
	bl SoundPlay
_0801758C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017594: .4byte gCurrentSprite
_08017598: .4byte 0x00000261

	thumb_func_start SA_XPowerBombSyncWithProjectile
SA_XPowerBombSyncWithProjectile: @ 0x0801759C
	push {lr}
	ldr r2, _080175C0 @ =gCurrentSprite
	ldr r1, _080175C4 @ =gCurrentPowerBomb
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0xa]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0xc]
	ldrh r0, [r1, #8]
	strh r0, [r2, #0xe]
	ldrh r0, [r1, #0xa]
	strh r0, [r2, #0x10]
	ldrb r0, [r1]
	cmp r0, #0
	bne _080175BA
	strh r0, [r2]
_080175BA:
	pop {r0}
	bx r0
	.align 2, 0
_080175C0: .4byte gCurrentSprite
_080175C4: .4byte gCurrentPowerBomb

	thumb_func_start LabExplosionInit
LabExplosionInit: @ 0x080175C8
	push {r4, lr}
	ldr r0, _08017624 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08017628 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r1, #0x27
	movs r0, #0x38
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _0801762C @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08017630 @ =0x082E8050
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	subs r1, #2
	movs r0, #0xc
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017624: .4byte gCurrentSprite
_08017628: .4byte 0x0000FFFB
_0801762C: .4byte 0x0000FFFC
_08017630: .4byte 0x082E8050

	thumb_func_start LabExplosionExploding
LabExplosionExploding: @ 0x08017634
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	mov sb, r0
	mov sl, r0
	ldr r0, _08017680 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r6, #3
	ands r6, r0
	ldr r0, _08017684 @ =gCurrentSprite
	ldrh r4, [r0, #2]
	ldrh r5, [r0, #4]
	adds r1, r0, #0
	adds r1, #0x23
	ldrb r1, [r1]
	mov r8, r1
	ldrb r1, [r0, #0x1c]
	adds r3, r0, #0
	cmp r1, #2
	beq _08017666
	b _08017890
_08017666:
	movs r1, #1
	mov sb, r1
	ldrh r0, [r3, #0x16]
	subs r0, #2
	cmp r0, #0x2d
	bls _08017674
	b _0801788C
_08017674:
	lsls r0, r0, #2
	ldr r1, _08017688 @ =_0801768C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017680: .4byte gSpriteRandomNumber
_08017684: .4byte gCurrentSprite
_08017688: .4byte _0801768C
_0801768C: @ jump table
	.4byte _08017744 @ case 0
	.4byte _0801788C @ case 1
	.4byte _0801788C @ case 2
	.4byte _08017758 @ case 3
	.4byte _0801788C @ case 4
	.4byte _0801788C @ case 5
	.4byte _0801776C @ case 6
	.4byte _0801788C @ case 7
	.4byte _0801788C @ case 8
	.4byte _08017780 @ case 9
	.4byte _0801788C @ case 10
	.4byte _0801788C @ case 11
	.4byte _08017794 @ case 12
	.4byte _0801788C @ case 13
	.4byte _0801788C @ case 14
	.4byte _080177A8 @ case 15
	.4byte _0801788C @ case 16
	.4byte _0801788C @ case 17
	.4byte _080177BC @ case 18
	.4byte _0801788C @ case 19
	.4byte _0801788C @ case 20
	.4byte _080177D0 @ case 21
	.4byte _0801788C @ case 22
	.4byte _0801788C @ case 23
	.4byte _080177E8 @ case 24
	.4byte _0801788C @ case 25
	.4byte _0801788C @ case 26
	.4byte _080177FC @ case 27
	.4byte _0801788C @ case 28
	.4byte _0801788C @ case 29
	.4byte _08017810 @ case 30
	.4byte _0801788C @ case 31
	.4byte _0801788C @ case 32
	.4byte _0801781C @ case 33
	.4byte _0801788C @ case 34
	.4byte _0801788C @ case 35
	.4byte _08017834 @ case 36
	.4byte _0801788C @ case 37
	.4byte _0801788C @ case 38
	.4byte _08017848 @ case 39
	.4byte _0801788C @ case 40
	.4byte _0801788C @ case 41
	.4byte _08017856 @ case 42
	.4byte _0801788C @ case 43
	.4byte _0801788C @ case 44
	.4byte _0801786A @ case 45
_08017744:
	ldr r2, _08017754 @ =0xFFFFFE40
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x80
	b _08017864
	.align 2, 0
_08017754: .4byte 0xFFFFFE40
_08017758:
	ldr r7, _08017768 @ =0xFFFFFE80
	adds r0, r4, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	subs r0, #0x80
	b _08017864
	.align 2, 0
_08017768: .4byte 0xFFFFFE80
_0801776C:
	ldr r1, _0801777C @ =0xFFFFFE40
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	subs r0, #0xc0
	b _08017864
	.align 2, 0
_0801777C: .4byte 0xFFFFFE40
_08017780:
	ldr r2, _08017790 @ =0xFFFFFE80
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0xc0
	b _08017864
	.align 2, 0
_08017790: .4byte 0xFFFFFE80
_08017794:
	ldr r7, _080177A4 @ =0xFFFFFEC0
	adds r0, r4, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #1
	b _08017862
	.align 2, 0
_080177A4: .4byte 0xFFFFFEC0
_080177A8:
	ldr r2, _080177B8 @ =0xFFFFFE80
	adds r0, r4, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0x40
	b _08017864
	.align 2, 0
_080177B8: .4byte 0xFFFFFE80
_080177BC:
	ldr r7, _080177CC @ =0xFFFFFE00
	adds r0, r4, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	subs r0, #0x40
	b _08017864
	.align 2, 0
_080177CC: .4byte 0xFFFFFE00
_080177D0:
	ldr r1, _080177E0 @ =0xFFFFFEC0
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, _080177E4 @ =0xFFFFFF00
	adds r0, r5, r2
	b _08017864
	.align 2, 0
_080177E0: .4byte 0xFFFFFEC0
_080177E4: .4byte 0xFFFFFF00
_080177E8:
	ldr r7, _080177F4 @ =0xFFFFFF00
	adds r0, r4, r7
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r1, _080177F8 @ =0xFFFFFEC0
	b _08017862
	.align 2, 0
_080177F4: .4byte 0xFFFFFF00
_080177F8: .4byte 0xFFFFFEC0
_080177FC:
	adds r0, r4, #0
	subs r0, #0xc0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r2, _0801780C @ =0xFFFFFE80
	adds r0, r5, r2
	b _08017864
	.align 2, 0
_0801780C: .4byte 0xFFFFFE80
_08017810:
	ldr r7, _08017818 @ =0xFFFFFEC0
	adds r0, r4, r7
	b _0801785A
	.align 2, 0
_08017818: .4byte 0xFFFFFEC0
_0801781C:
	ldr r2, _08017830 @ =0xFFFFFF00
	adds r1, r2, #0
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	b _08017890
	.align 2, 0
_08017830: .4byte 0xFFFFFF00
_08017834:
	adds r0, r4, #0
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r7, _08017844 @ =0xFFFFFF00
	adds r0, r5, r7
	b _08017864
	.align 2, 0
_08017844: .4byte 0xFFFFFF00
_08017848:
	adds r0, r4, #0
	subs r0, #0xc0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	adds r0, #0xc0
	b _08017864
_08017856:
	adds r0, r4, #0
	subs r0, #0x80
_0801785A:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r1, #0xa0
	lsls r1, r1, #1
_08017862:
	adds r0, r5, r1
_08017864:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	b _08017890
_0801786A:
	ldr r2, _08017888 @ =0xFFFFFE80
	adds r1, r2, #0
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r2, r3, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	movs r1, #1
	eors r0, r1
	strb r0, [r2]
	b _08017890
	.align 2, 0
_08017888: .4byte 0xFFFFFE80
_0801788C:
	movs r7, #0
	mov sb, r7
_08017890:
	mov r0, r8
	lsls r0, r0, #3
	str r0, [sp]
	mov r1, sb
	cmp r1, #0
	beq _08017932
	ldr r1, _080178D0 @ =gSpriteData
	mov r2, r8
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _080178B2
	cmp r0, #0x18
	bne _080178D8
_080178B2:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0xd
	bl ParticleSet
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2e
	bl ParticleSet
	ldr r0, _080178D4 @ =0x0000025E
	bl SoundPlay
	b _08017932
	.align 2, 0
_080178D0: .4byte gSpriteData
_080178D4: .4byte 0x0000025E
_080178D8:
	cmp r0, #0x1c
	beq _080178DE
	b _08017A8E
_080178DE:
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08017908
	ldrh r1, [r3, #0x16]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08017922
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2f
	bl ParticleSet
	ldr r0, _08017904 @ =0x0000023F
	bl unk_3b1c
	b _08017922
	.align 2, 0
_08017904: .4byte 0x0000023F
_08017908:
	ldrh r1, [r3, #0x16]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08017922
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x2f
	bl ParticleSet
	ldr r0, _08017970 @ =0x0000023F
	bl unk_3b1c
_08017922:
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartVertical
_08017932:
	ldr r0, _08017974 @ =gSpriteData
	ldr r3, [sp]
	mov r7, r8
	subs r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x1c
	beq _08017948
	b _08017A8E
_08017948:
	ldr r0, _08017978 @ =gSamusData
	ldrh r3, [r0, #0x18]
	ldr r0, _0801797C @ =gXParasiteTargetYPosition
	ldrh r2, [r0]
	adds r0, r2, #0
	subs r0, #0xa0
	cmp r3, r0
	bge _08017984
	ldr r1, _08017980 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x64
	strh r0, [r1, #2]
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	adds r3, r1, #0
	b _0801798A
	.align 2, 0
_08017970: .4byte 0x0000023F
_08017974: .4byte gSpriteData
_08017978: .4byte gSamusData
_0801797C: .4byte gXParasiteTargetYPosition
_08017980: .4byte gCurrentSprite
_08017984:
	ldr r0, _080179CC @ =gCurrentSprite
	strh r2, [r0, #2]
	adds r3, r0, #0
_0801798A:
	mov r0, sb
	cmp r0, #0
	beq _08017992
	b _08017A8E
_08017992:
	ldrh r1, [r3, #0x16]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08017A8E
	ldrb r0, [r3, #0x1c]
	cmp r0, #1
	bne _08017A8E
	ldr r3, _080179D0 @ =gFrameCounter8Bit
	ldrb r2, [r3]
	adds r1, r2, #0
	cmp r1, #7
	bls _08017A8E
	mov r7, sl
	cmp r7, #0
	bne _080179F8
	cmp r1, #0xb
	bls _080179DC
	ands r0, r2
	cmp r0, #0
	beq _080179D4
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, #0xdc
	adds r0, r4, r0
	lsls r1, r6
	adds r1, r5, r1
	b _08017A48
	.align 2, 0
_080179CC: .4byte gCurrentSprite
_080179D0: .4byte gSpriteRandomNumber
_080179D4:
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, #0xe6
	b _08017A20
_080179DC:
	ands r0, r2
	cmp r0, #0
	beq _080179EA
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, #0xdc
	b _08017A42
_080179EA:
	ldrb r1, [r3]
	lsls r0, r1, #3
	subs r0, #0xe6
	adds r0, r4, r0
	lsls r1, r6
	subs r1, r5, r1
	b _08017A26
_080179F8:
	cmp r1, #0xb
	bls _08017A34
	ands r0, r2
	cmp r0, #0
	beq _08017A18
	ldrb r1, [r3]
	lsls r0, r1, #5
	ldr r2, _08017A14 @ =0xFFFFFEC0
	adds r0, r0, r2
	adds r0, r4, r0
	lsls r1, r6
	adds r1, r5, r1
	b _08017A48
	.align 2, 0
_08017A14: .4byte 0xFFFFFEC0
_08017A18:
	ldrb r1, [r3]
	lsls r0, r1, #5
	ldr r3, _08017A30 @ =0xFFFFFEB6
	adds r0, r0, r3
_08017A20:
	adds r0, r4, r0
	lsls r1, r6
	adds r1, r5, r1
_08017A26:
	movs r2, #0x35
	bl ParticleSet
	b _08017A68
	.align 2, 0
_08017A30: .4byte 0xFFFFFEB6
_08017A34:
	ands r0, r2
	cmp r0, #0
	beq _08017A54
	ldrb r1, [r3]
	lsls r0, r1, #5
	ldr r7, _08017A50 @ =0xFFFFFEC0
	adds r0, r0, r7
_08017A42:
	adds r0, r4, r0
	lsls r1, r6
	subs r1, r5, r1
_08017A48:
	movs r2, #0x30
	bl ParticleSet
	b _08017A68
	.align 2, 0
_08017A50: .4byte 0xFFFFFEC0
_08017A54:
	ldrb r1, [r3]
	lsls r0, r1, #5
	ldr r2, _08017A80 @ =0xFFFFFEB6
	adds r0, r0, r2
	adds r0, r4, r0
	lsls r1, r6
	subs r1, r5, r1
	movs r2, #0x35
	bl ParticleSet
_08017A68:
	ldr r0, _08017A84 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08017A88
	movs r0, #0x90
	lsls r0, r0, #2
	bl SoundPlayNotAlreadyPlaying
	b _08017A8E
	.align 2, 0
_08017A80: .4byte 0xFFFFFEB6
_08017A84: .4byte gSpriteRandomNumber
_08017A88:
	ldr r0, _08017ABC @ =0x00000241
	bl SoundPlayNotAlreadyPlaying
_08017A8E:
	ldr r0, _08017AC0 @ =gSpriteData
	ldr r3, [sp]
	mov r7, r8
	subs r1, r3, r7
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x1a
	bne _08017AAC
	ldr r2, _08017AC4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #4
	orrs r0, r1
	strh r0, [r2]
_08017AAC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017ABC: .4byte 0x00000241
_08017AC0: .4byte gSpriteData
_08017AC4: .4byte gCurrentSprite

	thumb_func_start SA_XUpdateGraphics
SA_XUpdateGraphics: @ 0x08017AC8
	push {r4, r5, lr}
	bl SpriteCheckOnScreen
	ldr r5, _08017B1C @ =gSaXData
	ldr r4, _08017B20 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	strh r0, [r5, #0xc]
	ldrh r0, [r4, #4]
	strh r0, [r5, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	ldrb r0, [r0]
	strb r0, [r5, #5]
	ldr r1, _08017B24 @ =0x082B4408
	ldrb r0, [r5, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _08017AFC
	bl SetSA_XPose
_08017AFC:
	ldrh r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08017B38
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08017B38
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08017B28
	movs r0, #2
	b _08017B2A
	.align 2, 0
_08017B1C: .4byte gSaXData
_08017B20: .4byte gCurrentSprite
_08017B24: .4byte 0x082B4408
_08017B28:
	movs r0, #1
_08017B2A:
	strb r0, [r5]
	ldr r0, _08017B34 @ =gCurrentSprite
	ldrh r2, [r0, #2]
	ldrh r1, [r0, #4]
	b _08017B42
	.align 2, 0
_08017B34: .4byte gCurrentSprite
_08017B38:
	ldr r1, _08017B50 @ =gSaXData
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08017B54 @ =0x0000FFFF
	adds r2, r1, #0
_08017B42:
	ldr r0, _08017B58 @ =gSaXSpawnPosition
	strh r2, [r0, #2]
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08017B50: .4byte gSaXData
_08017B54: .4byte 0x0000FFFF
_08017B58: .4byte gSaXSpawnPosition

	thumb_func_start SA_XUpdateFreezeTimer
SA_XUpdateFreezeTimer: @ 0x08017B5C
	push {r4, lr}
	ldr r0, _08017B78 @ =gCurrentSprite
	adds r3, r0, #0
	adds r3, #0x32
	ldrb r2, [r3]
	adds r1, r2, #0
	adds r4, r0, #0
	cmp r1, #0
	beq _08017BCE
	cmp r1, #3
	bls _08017B7C
	subs r0, r2, #3
	b _08017B7E
	.align 2, 0
_08017B78: .4byte gCurrentSprite
_08017B7C:
	movs r0, #0
_08017B7E:
	strb r0, [r3]
	adds r3, r4, #0
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r2, [r0]
	ldr r1, _08017BBC @ =gSaXData
	ldrb r0, [r1, #0x12]
	subs r0, #1
	strb r0, [r1, #0x12]
	cmp r2, #0x5a
	bhi _08017BC6
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	bne _08017BC6
	movs r0, #4
	ands r2, r0
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08017BC0
	adds r0, r3, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r3, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r3, #0
	b _08017BC2
	.align 2, 0
_08017BBC: .4byte gSaXData
_08017BC0:
	adds r0, r4, #0
_08017BC2:
	adds r0, #0x20
	strb r1, [r0]
_08017BC6:
	bl SA_XUpdateGraphics
	movs r0, #1
	b _08017BD0
_08017BCE:
	movs r0, #0
_08017BD0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SA_XElevator
SA_XElevator: @ 0x08017BD8
	push {r4, r5, r6, lr}
	bl SA_XUpdateFreezeTimer
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08017BE8
	b _08017E8E
_08017BE8:
	bl SA_XSeeAndLocateSamus
	ldr r3, _08017C08 @ =gCurrentSprite
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	beq _08017C38
	ldr r0, _08017C0C @ =gSaXVision
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _08017C10
	strh r4, [r3, #6]
	b _08017C38
	.align 2, 0
_08017C08: .4byte gCurrentSprite
_08017C0C: .4byte gSaXVision
_08017C10:
	ldrh r1, [r3, #6]
	ldr r0, _08017C20 @ =0x000004AF
	cmp r1, r0
	bls _08017C28
	ldr r0, _08017C24 @ =0x0000FBFF
	ands r0, r2
	strh r0, [r3]
	b _08017C38
	.align 2, 0
_08017C20: .4byte 0x000004AF
_08017C24: .4byte 0x0000FBFF
_08017C28:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08017C34
	adds r0, r1, #4
	b _08017C36
_08017C34:
	adds r0, r1, #1
_08017C36:
	strh r0, [r3, #6]
_08017C38:
	ldr r0, _08017C50 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x40
	bls _08017C44
	b _08017E86
_08017C44:
	lsls r0, r0, #2
	ldr r1, _08017C54 @ =_08017C58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08017C50: .4byte gCurrentSprite
_08017C54: .4byte _08017C58
_08017C58: @ jump table
	.4byte _08017D5C @ case 0
	.4byte _08017D74 @ case 1
	.4byte _08017D7A @ case 2
	.4byte _08017D80 @ case 3
	.4byte _08017D84 @ case 4
	.4byte _08017E86 @ case 5
	.4byte _08017E86 @ case 6
	.4byte _08017D6A @ case 7
	.4byte _08017D6E @ case 8
	.4byte _08017E86 @ case 9
	.4byte _08017E86 @ case 10
	.4byte _08017E86 @ case 11
	.4byte _08017E86 @ case 12
	.4byte _08017E86 @ case 13
	.4byte _08017E86 @ case 14
	.4byte _08017E86 @ case 15
	.4byte _08017E86 @ case 16
	.4byte _08017E86 @ case 17
	.4byte _08017E86 @ case 18
	.4byte _08017E86 @ case 19
	.4byte _08017E86 @ case 20
	.4byte _08017D60 @ case 21
	.4byte _08017D64 @ case 22
	.4byte _08017D8A @ case 23
	.4byte _08017D8E @ case 24
	.4byte _08017E86 @ case 25
	.4byte _08017E86 @ case 26
	.4byte _08017E86 @ case 27
	.4byte _08017E86 @ case 28
	.4byte _08017E86 @ case 29
	.4byte _08017E86 @ case 30
	.4byte _08017E86 @ case 31
	.4byte _08017E86 @ case 32
	.4byte _08017E86 @ case 33
	.4byte _08017E86 @ case 34
	.4byte _08017E86 @ case 35
	.4byte _08017E86 @ case 36
	.4byte _08017E86 @ case 37
	.4byte _08017E86 @ case 38
	.4byte _08017E86 @ case 39
	.4byte _08017E86 @ case 40
	.4byte _08017E22 @ case 41
	.4byte _08017E26 @ case 42
	.4byte _08017E2C @ case 43
	.4byte _08017E30 @ case 44
	.4byte _08017E36 @ case 45
	.4byte _08017E3A @ case 46
	.4byte _08017E40 @ case 47
	.4byte _08017E44 @ case 48
	.4byte _08017E4A @ case 49
	.4byte _08017E4E @ case 50
	.4byte _08017E86 @ case 51
	.4byte _08017E86 @ case 52
	.4byte _08017E86 @ case 53
	.4byte _08017E86 @ case 54
	.4byte _08017E54 @ case 55
	.4byte _08017E58 @ case 56
	.4byte _08017E5E @ case 57
	.4byte _08017E62 @ case 58
	.4byte _08017E68 @ case 59
	.4byte _08017E6C @ case 60
	.4byte _08017E72 @ case 61
	.4byte _08017E76 @ case 62
	.4byte _08017E7C @ case 63
	.4byte _08017E80 @ case 64
_08017D5C:
	bl SA_XElevatorInit
_08017D60:
	bl SA_XFallingInit
_08017D64:
	bl SA_XFalling
	b _08017E8A
_08017D6A:
	bl SA_XStandingInit
_08017D6E:
	bl SA_XStanding
	b _08017E8A
_08017D74:
	bl SA_XWalkingInit
	b _08017E8A
_08017D7A:
	bl SA_XWalking
	b _08017E8A
_08017D80:
	bl SA_XTurningInit
_08017D84:
	bl SA_XTurning
	b _08017E8A
_08017D8A:
	bl SA_XRunningStart
_08017D8E:
	bl SA_XRunning
	ldr r4, _08017DD4 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x24
	ldrb r0, [r6]
	cmp r0, #0x37
	bne _08017E8A
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08017E1C
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08017DE0
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08017DD8 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08017E08
	ldrh r0, [r4, #2]
	ldr r1, _08017DDC @ =0xFFFFFEE0
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x20
	b _08017DFE
	.align 2, 0
_08017DD4: .4byte gCurrentSprite
_08017DD8: .4byte gPreviousCollisionCheck
_08017DDC: .4byte 0xFFFFFEE0
_08017DE0:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08017E14 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08017E08
	ldrh r0, [r4, #2]
	ldr r1, _08017E18 @ =0xFFFFFEE0
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x20
_08017DFE:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08017E8A
_08017E08:
	movs r0, #3
	strb r0, [r6]
	movs r0, #0x96
	lsls r0, r0, #3
	strh r0, [r4, #6]
	b _08017E8A
	.align 2, 0
_08017E14: .4byte gPreviousCollisionCheck
_08017E18: .4byte 0xFFFFFEE0
_08017E1C:
	movs r0, #3
	strb r0, [r6]
	b _08017E8A
_08017E22:
	bl SA_XDelayBeforeShootingBeamInit
_08017E26:
	bl SA_XDelayBeforeShootingBeam
	b _08017E8A
_08017E2C:
	bl SA_XShootingBeamInit
_08017E30:
	bl SA_XShootingBeam
	b _08017E8A
_08017E36:
	bl SA_XDelayBeforeShootingMissileInit
_08017E3A:
	bl SA_XDelayBeforeShootingMissile
	b _08017E8A
_08017E40:
	bl SA_XShootingMissileInit
_08017E44:
	bl SA_XShootingMissile
	b _08017E8A
_08017E4A:
	bl SA_XIdleAfterShootingMissileInit
_08017E4E:
	bl SA_XIdleAfterShootingMissile
	b _08017E8A
_08017E54:
	bl SA_XMidAirInit
_08017E58:
	bl SA_XMidAir
	b _08017E8A
_08017E5E:
	bl SA_XTurningChaseStartInit
_08017E62:
	bl SA_XTurningChaseStart
	b _08017E8A
_08017E68:
	bl SA_XMorphingInit
_08017E6C:
	bl SA_XMorphing
	b _08017E8A
_08017E72:
	bl SA_XRollingInit
_08017E76:
	bl SA_XRolling
	b _08017E8A
_08017E7C:
	bl SA_XUnmorphingInit
_08017E80:
	bl SA_XUnmorphing
	b _08017E8A
_08017E86:
	bl SA_XStandingInit
_08017E8A:
	bl SA_XUpdateGraphics
_08017E8E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SA_XBeam
SA_XBeam: @ 0x08017E94
	push {lr}
	ldr r0, _08017EA8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017EAC
	bl SA_XBeamInit
	b _08017EB0
	.align 2, 0
_08017EA8: .4byte gCurrentSprite
_08017EAC:
	bl SA_XBeamMove
_08017EB0:
	pop {r0}
	bx r0

	thumb_func_start SA_XMissile
SA_XMissile: @ 0x08017EB4
	push {lr}
	ldr r0, _08017ECC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08017ED0
	cmp r0, #0x37
	beq _08017ED6
	bl SA_XMissileMoving
	b _08017EDA
	.align 2, 0
_08017ECC: .4byte gCurrentSprite
_08017ED0:
	bl SA_XMissileInit
	b _08017EDA
_08017ED6:
	bl SA_XMissileExploding
_08017EDA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XPowerBomb
SA_XPowerBomb: @ 0x08017EE0
	push {lr}
	ldr r0, _08017EF8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08017F0C
	cmp r0, #2
	bgt _08017EFC
	cmp r0, #0
	beq _08017F06
	b _08017F1C
	.align 2, 0
_08017EF8: .4byte gCurrentSprite
_08017EFC:
	cmp r0, #0x18
	beq _08017F12
	cmp r0, #0x1a
	beq _08017F18
	b _08017F1C
_08017F06:
	bl SA_XPowerBombInit
	b _08017F1C
_08017F0C:
	bl SA_XPowerBombSpinningSlowly
	b _08017F1C
_08017F12:
	bl SA_XPowerBombSpinningQuickly
	b _08017F1C
_08017F18:
	bl SA_XPowerBombSyncWithProjectile
_08017F1C:
	pop {r0}
	bx r0

	thumb_func_start LabExplosion
LabExplosion: @ 0x08017F20
	push {lr}
	ldr r0, _08017F3C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08017F40
	cmp r0, #2
	beq _08017F46
	b _08017F4A
	.align 2, 0
_08017F3C: .4byte gCurrentSprite
_08017F40:
	bl LabExplosionInit
	b _08017F4A
_08017F46:
	bl LabExplosionExploding
_08017F4A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XTro1CheckTurning
SA_XTro1CheckTurning: @ 0x08017F50
	push {r4, lr}
	ldr r4, _08017F84 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08017F8C
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08017F88 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08017FAA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	b _08017FA8
	.align 2, 0
_08017F84: .4byte gCurrentSprite
_08017F88: .4byte gPreviousCollisionCheck
_08017F8C:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	ldr r2, _08017FB0 @ =0xFFFFFF00
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08017FB4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08017FAA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x41
_08017FA8:
	strb r0, [r1]
_08017FAA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017FB0: .4byte 0xFFFFFF00
_08017FB4: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XTro1CheckStartChase
SA_XTro1CheckStartChase: @ 0x08017FB8
	push {r4, lr}
	ldr r4, _08017FDC @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08017FE0
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	b _08017FE8
	.align 2, 0
_08017FDC: .4byte gCurrentSprite
_08017FE0:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
_08017FE8:
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08018004 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08017FFC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
_08017FFC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018004: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XTro1Init
SA_XTro1Init: @ 0x08018008
	push {lr}
	bl EventCheckOn_HighJumpRecovered
	adds r1, r0, #0
	cmp r1, #0
	bne _08018020
	ldr r0, _0801801C @ =gCurrentSprite
	strh r1, [r0]
	b _08018030
	.align 2, 0
_0801801C: .4byte gCurrentSprite
_08018020:
	bl SA_XInit
	ldr r0, _08018034 @ =gCurrentSprite
	adds r0, #0x25
	movs r1, #2
	strb r1, [r0]
	bl SubEventUpdateForSaXEncounter
_08018030:
	pop {r0}
	bx r0
	.align 2, 0
_08018034: .4byte gCurrentSprite

	thumb_func_start SA_XTro1Walking
SA_XTro1Walking: @ 0x08018038
	push {r4, r5, lr}
	ldr r2, _0801806C @ =gCurrentSprite
	ldrh r4, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08018098
	ldr r3, _08018070 @ =gSaXVision
	ldrb r0, [r3, #2]
	cmp r0, #1
	bne _08018074
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	orrs r0, r4
	strh r0, [r2]
	strh r1, [r2, #6]
	ldrb r0, [r3, #1]
	cmp r0, #1
	beq _080180E2
	b _080180D8
	.align 2, 0
_0801806C: .4byte gCurrentSprite
_08018070: .4byte gSaXVision
_08018074:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _080180EC
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	movs r1, #0
	orrs r0, r4
	strh r0, [r2]
	strh r1, [r2, #6]
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _080180D8
	b _080180E2
_08018098:
	ldr r5, _080180B4 @ =gSaXVision
	ldrb r0, [r5, #2]
	cmp r0, #1
	bne _080180B8
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r0, r4
	strh r0, [r2]
	strh r3, [r2, #6]
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080180E2
	b _080180D8
	.align 2, 0
_080180B4: .4byte gSaXVision
_080180B8:
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _080180EC
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r0, r4
	strh r0, [r2]
	strh r3, [r2, #6]
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _080180E2
_080180D8:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
	b _0801811C
_080180E2:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
	b _0801811C
_080180EC:
	bl SA_XTro1CheckTurning
	ldr r1, _08018124 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	bne _0801811C
	ldr r0, _08018128 @ =0x082E6BBC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _0801811C
	adds r0, #1
	strb r0, [r4]
_0801811C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018124: .4byte gCurrentSprite
_08018128: .4byte 0x082E6BBC

	thumb_func_start SA_XTro1Running
SA_XTro1Running: @ 0x0801812C
	push {r4, lr}
	ldr r4, _08018158 @ =gSaXVision
	ldrb r0, [r4, #2]
	cmp r0, #1
	bne _080181A2
	movs r0, #0xf0
	lsls r0, r0, #1
	movs r1, #0xaa
	lsls r1, r1, #1
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r3, r0, #0
	ldr r2, _0801815C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018160
	cmp r3, #8
	bne _08018176
	b _08018164
	.align 2, 0
_08018158: .4byte gSaXVision
_0801815C: .4byte gCurrentSprite
_08018160:
	cmp r3, #4
	bne _08018176
_08018164:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	ldrb r1, [r4]
	adds r0, r2, #0
	adds r0, #0x2f
	strb r1, [r0]
	b _08018202
_08018176:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #2
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r3, r0, #0
	ldr r2, _08018198 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801819C
	cmp r3, #4
	bne _080181D2
	b _080181C8
	.align 2, 0
_08018198: .4byte gCurrentSprite
_0801819C:
	cmp r3, #8
	bne _080181D2
	b _080181C8
_080181A2:
	ldr r2, _080181B8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080181BC
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _080181D2
	b _080181C2
	.align 2, 0
_080181B8: .4byte gCurrentSprite
_080181BC:
	ldrb r0, [r4, #4]
	cmp r0, #1
	bne _080181D2
_080181C2:
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _080181D2
_080181C8:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x39
	strb r0, [r1]
	b _08018202
_080181D2:
	bl SA_XTro1CheckStartChase
	ldr r1, _08018208 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _08018202
	ldr r0, _0801820C @ =0x082E6BCC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _08018202
	adds r0, #1
	strb r0, [r4]
_08018202:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018208: .4byte gCurrentSprite
_0801820C: .4byte 0x082E6BCC

	thumb_func_start SA_XTro1TurningDuringChase
SA_XTro1TurningDuringChase: @ 0x08018210
	push {r4, lr}
	ldr r0, _0801823C @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08018258
	ldr r4, _08018240 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	bl SA_XSetDirection
	ldr r0, _08018244 @ =gSaXVision
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _08018248
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	b _08018256
	.align 2, 0
_0801823C: .4byte gSaXData
_08018240: .4byte gCurrentSprite
_08018244: .4byte gSaXVision
_08018248:
	ldrh r1, [r4]
	ldr r0, _08018260 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
_08018256:
	strb r0, [r1]
_08018258:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018260: .4byte 0x0000FBFF

	thumb_func_start SA_XTro1
SA_XTro1: @ 0x08018264
	push {r4, lr}
	bl SA_XUpdateFreezeTimer
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08018274
	b _080184D4
_08018274:
	bl SA_XSeeAndLocateSamus
	ldr r3, _08018294 @ =gCurrentSprite
	ldrh r2, [r3]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	beq _080182C4
	ldr r0, _08018298 @ =gSaXVision
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _0801829C
	strh r4, [r3, #6]
	b _080182C4
	.align 2, 0
_08018294: .4byte gCurrentSprite
_08018298: .4byte gSaXVision
_0801829C:
	ldrh r1, [r3, #6]
	ldr r0, _080182AC @ =0x000004AF
	cmp r1, r0
	bls _080182B4
	ldr r0, _080182B0 @ =0x0000FBFF
	ands r0, r2
	strh r0, [r3]
	b _080182C4
	.align 2, 0
_080182AC: .4byte 0x000004AF
_080182B0: .4byte 0x0000FBFF
_080182B4:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080182C0
	adds r0, r1, #4
	b _080182C2
_080182C0:
	adds r0, r1, #1
_080182C2:
	strh r0, [r3, #6]
_080182C4:
	ldr r0, _080182DC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x48
	bls _080182D0
	b _080184BA
_080182D0:
	lsls r0, r0, #2
	ldr r1, _080182E0 @ =_080182E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080182DC: .4byte gCurrentSprite
_080182E0: .4byte _080182E4
_080182E4: @ jump table
	.4byte _08018408 @ case 0
	.4byte _0801840C @ case 1
	.4byte _08018412 @ case 2
	.4byte _0801846C @ case 3
	.4byte _08018470 @ case 4
	.4byte _080184BA @ case 5
	.4byte _080184BA @ case 6
	.4byte _08018480 @ case 7
	.4byte _08018484 @ case 8
	.4byte _080184BA @ case 9
	.4byte _080184BA @ case 10
	.4byte _080184BA @ case 11
	.4byte _080184BA @ case 12
	.4byte _080184BA @ case 13
	.4byte _080184BA @ case 14
	.4byte _080184BA @ case 15
	.4byte _080184BA @ case 16
	.4byte _080184BA @ case 17
	.4byte _080184BA @ case 18
	.4byte _080184BA @ case 19
	.4byte _080184BA @ case 20
	.4byte _08018476 @ case 21
	.4byte _0801847A @ case 22
	.4byte _08018418 @ case 23
	.4byte _0801841C @ case 24
	.4byte _080184BA @ case 25
	.4byte _080184BA @ case 26
	.4byte _080184BA @ case 27
	.4byte _080184BA @ case 28
	.4byte _080184BA @ case 29
	.4byte _080184BA @ case 30
	.4byte _080184BA @ case 31
	.4byte _080184BA @ case 32
	.4byte _080184BA @ case 33
	.4byte _080184BA @ case 34
	.4byte _080184BA @ case 35
	.4byte _080184BA @ case 36
	.4byte _080184BA @ case 37
	.4byte _080184BA @ case 38
	.4byte _080184BA @ case 39
	.4byte _080184BA @ case 40
	.4byte _0801848A @ case 41
	.4byte _0801848E @ case 42
	.4byte _08018494 @ case 43
	.4byte _08018498 @ case 44
	.4byte _0801849E @ case 45
	.4byte _080184A2 @ case 46
	.4byte _080184A8 @ case 47
	.4byte _080184AC @ case 48
	.4byte _080184B2 @ case 49
	.4byte _080184B6 @ case 50
	.4byte _080184BA @ case 51
	.4byte _080184BA @ case 52
	.4byte _080184BA @ case 53
	.4byte _080184BA @ case 54
	.4byte _080184BA @ case 55
	.4byte _080184BA @ case 56
	.4byte _08018422 @ case 57
	.4byte _08018426 @ case 58
	.4byte _080184BA @ case 59
	.4byte _080184BA @ case 60
	.4byte _080184BA @ case 61
	.4byte _080184BA @ case 62
	.4byte _080184BA @ case 63
	.4byte _080184BA @ case 64
	.4byte _0801842C @ case 65
	.4byte _08018430 @ case 66
	.4byte _08018436 @ case 67
	.4byte _0801843A @ case 68
	.4byte _08018440 @ case 69
	.4byte _08018444 @ case 70
	.4byte _0801844A @ case 71
	.4byte _0801844E @ case 72
_08018408:
	bl SA_XTro1Init
_0801840C:
	bl SA_XWalkingInit
	b _080184BA
_08018412:
	bl SA_XTro1Walking
	b _080184BA
_08018418:
	bl SA_XRunningStart
_0801841C:
	bl SA_XTro1Running
	b _080184BA
_08018422:
	bl SA_XTurningChaseStartInit
_08018426:
	bl SA_XTro1TurningDuringChase
	b _080184BA
_0801842C:
	bl SA_XIdleBeforeShootingDoorInit
_08018430:
	bl SA_XIdleBeforeShootingDoor
	b _080184BA
_08018436:
	bl SA_XShootingDoorInit
_0801843A:
	bl SA_XShootingDoor
	b _080184BA
_08018440:
	bl SA_XIdleAfterShootingDoorInit
_08018444:
	bl SA_XIdleAfterShootingDoor
	b _080184BA
_0801844A:
	bl SA_XWalkingToDoorInit
_0801844E:
	bl SA_XWalkingToDoor
	ldr r0, _08018468 @ =gCurrentSprite
	ldrh r0, [r0]
	cmp r0, #0
	bne _080184BA
	movs r0, #0xc8
	movs r1, #3
	movs r2, #8
	bl unk_372c
	b _080184BA
	.align 2, 0
_08018468: .4byte gCurrentSprite
_0801846C:
	bl SA_XTurningInit
_08018470:
	bl SA_XTurning
	b _080184BA
_08018476:
	bl SA_XFallingInit
_0801847A:
	bl SA_XFalling
	b _080184BA
_08018480:
	bl SA_XStandingInit
_08018484:
	bl SA_XStanding
	b _080184BA
_0801848A:
	bl SA_XDelayBeforeShootingBeamInit
_0801848E:
	bl SA_XDelayBeforeShootingBeam
	b _080184BA
_08018494:
	bl SA_XShootingBeamInit
_08018498:
	bl SA_XShootingBeam
	b _080184BA
_0801849E:
	bl SA_XDelayBeforeShootingMissileInit
_080184A2:
	bl SA_XDelayBeforeShootingMissile
	b _080184BA
_080184A8:
	bl SA_XShootingMissileInit
_080184AC:
	bl SA_XShootingMissile
	b _080184BA
_080184B2:
	bl SA_XIdleAfterShootingMissileInit
_080184B6:
	bl SA_XIdleAfterShootingMissile
_080184BA:
	bl SA_XUpdateGraphics
	ldr r0, _080184DC @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080184D4
	movs r0, #0x17
	movs r1, #9
	bl PlayMusic
_080184D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080184DC: .4byte gCurrentSprite

	thumb_func_start SA_XNocWalkingCheckCollisions
SA_XNocWalkingCheckCollisions: @ 0x080184E0
	push {r4, r5, r6, lr}
	ldr r4, _0801851C @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl unk_1129c
	ldr r5, _08018520 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	cmp r2, #0
	bne _0801855E
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018530
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08018524
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	b _08018634
	.align 2, 0
_0801851C: .4byte gCurrentSprite
_08018520: .4byte gPreviousVerticalCollisionCheck
_08018524:
	cmp r0, #4
	beq _08018550
	cmp r0, #2
	beq _0801852E
	b _08018636
_0801852E:
	b _08018550
_08018530:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08018548
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	b _08018634
_08018548:
	cmp r0, #5
	beq _08018550
	cmp r0, #3
	bne _08018636
_08018550:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _08018636
_0801855E:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018610
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _08018636
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08018590 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08018594
	movs r0, #1
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	b _08018634
	.align 2, 0
_08018590: .4byte gPreviousCollisionCheck
_08018594:
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080185E4
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080185E4
	ldrh r0, [r4, #2]
	ldr r1, _080185D4 @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080185D8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #3
	b _08018634
	.align 2, 0
_080185D4: .4byte 0xFFFFFEFC
_080185D8:
	movs r0, #2
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	b _08018634
_080185E4:
	ldr r4, _08018608 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801860C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08018636
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0x37
	b _08018634
	.align 2, 0
_08018608: .4byte gCurrentSprite
_0801860C: .4byte gPreviousCollisionCheck
_08018610:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _08018636
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	ldr r2, _0801863C @ =0xFFFFFF00
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08018640 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08018636
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x41
_08018634:
	strb r0, [r1]
_08018636:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801863C: .4byte 0xFFFFFF00
_08018640: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XNocRunningCheckCollisions
SA_XNocRunningCheckCollisions: @ 0x08018644
	push {r4, r5, r6, lr}
	ldr r4, _08018688 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl unk_1129c
	ldr r5, _0801868C @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	cmp r2, #0
	bne _080186BA
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018690
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801867A
	b _08018834
_0801867A:
	cmp r0, #4
	beq _080186AC
	cmp r0, #2
	beq _08018684
	b _0801883C
_08018684:
	b _080186AC
	.align 2, 0
_08018688: .4byte gCurrentSprite
_0801868C: .4byte gPreviousVerticalCollisionCheck
_08018690:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080186A2
	b _08018834
_080186A2:
	cmp r0, #5
	beq _080186AC
	cmp r0, #3
	beq _080186AC
	b _0801883C
_080186AC:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _0801883C
_080186BA:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018778
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _080186D0
	b _0801883C
_080186D0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08018724 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080186E4
	b _08018830
_080186E4:
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801876E
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08018730
	ldrh r0, [r4, #2]
	ldr r1, _08018728 @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801872C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801883A
	.align 2, 0
_08018724: .4byte gPreviousCollisionCheck
_08018728: .4byte 0xFFFFFEFC
_0801872C:
	movs r0, #2
	b _08018832
_08018730:
	ldrh r0, [r4, #2]
	ldr r1, _0801874C @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08018750
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0801883A
	.align 2, 0
_0801874C: .4byte 0xFFFFFEFC
_08018750:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801876A
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0801883A
_0801876A:
	movs r0, #2
	b _08018832
_0801876E:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	b _08018826
_08018778:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _0801883C
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080187D4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08018830
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801881E
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080187E0
	ldrh r0, [r4, #2]
	ldr r1, _080187D8 @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080187DC
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801883A
	.align 2, 0
_080187D4: .4byte gPreviousCollisionCheck
_080187D8: .4byte 0xFFFFFEFC
_080187DC:
	movs r0, #2
	b _08018832
_080187E0:
	ldrh r0, [r4, #2]
	ldr r1, _080187FC @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08018800
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0801883A
	.align 2, 0
_080187FC: .4byte 0xFFFFFEFC
_08018800:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801881A
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0801883A
_0801881A:
	movs r0, #2
	b _08018832
_0801881E:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
_08018826:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801883C
_08018830:
	movs r0, #1
_08018832:
	strb r0, [r6]
_08018834:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
_0801883A:
	strb r0, [r1]
_0801883C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XNocWalkingToLayPowerBombCheckCollisions
SA_XNocWalkingToLayPowerBombCheckCollisions: @ 0x08018844
	push {r4, lr}
	ldr r4, _08018860 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018864
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	movs r2, #0xa0
	lsls r2, r2, #1
	b _0801886C
	.align 2, 0
_08018860: .4byte gCurrentSprite
_08018864:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	ldr r2, _08018888 @ =0xFFFFFEC0
_0801886C:
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801888C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08018882
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
_08018882:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018888: .4byte 0xFFFFFEC0
_0801888C: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XNocInit
SA_XNocInit: @ 0x08018890
	push {r4, lr}
	ldr r4, _080188B4 @ =gCurrentSprite
	ldr r1, _080188B8 @ =gSaXSpawnPosition
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	ldrh r0, [r1]
	strh r0, [r4, #4]
	bl SA_XInit
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080188BC
	ldrh r0, [r4, #4]
	subs r0, #0x48
	b _080188C0
	.align 2, 0
_080188B4: .4byte gCurrentSprite
_080188B8: .4byte gSaXSpawnPosition
_080188BC:
	ldrh r0, [r4, #4]
	adds r0, #0x48
_080188C0:
	strh r0, [r4, #4]
	ldr r4, _080188F0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
	strb r0, [r1]
	bl EventCheckOn_NavigationRoomEnteringNoc
	cmp r0, #0
	beq _080188F4
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
	movs r0, #1
	bl SetSA_XPose
	b _08018920
	.align 2, 0
_080188F0: .4byte gCurrentSprite
_080188F4:
	bl EventCheckOn_EngagedSaXNoc
	cmp r0, #0
	beq _0801891E
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	movs r0, #0
	bl SetSA_XPose
	b _08018920
_0801891E:
	strh r0, [r4]
_08018920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XNocWaitingInDoorDuringChase
SA_XNocWaitingInDoorDuringChase: @ 0x08018928
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _08018980 @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080189A2
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	movs r0, #0x1e
	strb r0, [r2]
	mov r4, ip
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08018984
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x80
	bl SpriteSpawnSecondary
	b _080189A2
	.align 2, 0
_08018980: .4byte gCurrentSprite
_08018984:
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0x80
	bl SpriteSpawnSecondary
_080189A2:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XNocOpeningDoorDuringChase
SA_XNocOpeningDoorDuringChase: @ 0x080189AC
	push {r4, lr}
	ldr r4, _080189E4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080189DC
	bl SA_XRunningStart
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _080189E8 @ =0x0000DFFF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_080189DC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080189E4: .4byte gCurrentSprite
_080189E8: .4byte 0x0000DFFF

	thumb_func_start SA_XNocWaitingInDoorToLayPowerBomb
SA_XNocWaitingInDoorToLayPowerBomb: @ 0x080189EC
	push {r4, lr}
	sub sp, #0xc
	bl EventCheckOn_EngagedSaXNoc
	cmp r0, #0
	beq _08018A76
	bl SA_XWalkingInit
	ldr r0, _08018A48 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	strb r0, [r1]
	mov r1, ip
	ldrh r0, [r1]
	ldr r1, _08018A4C @ =0x0000DFFF
	ands r1, r0
	mov r4, ip
	strh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08018A50
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x80
	bl SpriteSpawnSecondary
	b _08018A6E
	.align 2, 0
_08018A48: .4byte gCurrentSprite
_08018A4C: .4byte 0x0000DFFF
_08018A50:
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0x80
	bl SpriteSpawnSecondary
_08018A6E:
	ldr r0, _08018A80 @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #0x1e
	strb r1, [r0]
_08018A76:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018A80: .4byte gCurrentSprite

	thumb_func_start SA_XNocWalkingToLayPowerBomb
SA_XNocWalkingToLayPowerBomb: @ 0x08018A84
	push {r4, lr}
	ldr r4, _08018AA4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08018AA8
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018ADE
	bl SubEventUpdateForSaXEncounter
	b _08018ADE
	.align 2, 0
_08018AA4: .4byte gCurrentSprite
_08018AA8:
	bl unk_15e88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018ADE
	bl SA_XNocWalkingToLayPowerBombCheckCollisions
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _08018ADE
	ldr r0, _08018AE4 @ =0x082E6BBC
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _08018ADE
	adds r0, #1
	strb r0, [r4]
_08018ADE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018AE4: .4byte 0x082E6BBC

	thumb_func_start SA_XNocIdleBeforeLayingPowerBombInit
SA_XNocIdleBeforeLayingPowerBombInit: @ 0x08018AE8
	push {lr}
	ldr r2, _08018B08 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _08018B0C @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08018B08: .4byte gCurrentSprite
_08018B0C: .4byte 0x0000FF88

	thumb_func_start SA_XNocIdleBeforeLayingPowerBomb
SA_XNocIdleBeforeLayingPowerBomb: @ 0x08018B10
	push {lr}
	ldr r1, _08018B30 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018B2A
	adds r1, #0x24
	movs r0, #0x4b
	strb r0, [r1]
_08018B2A:
	pop {r0}
	bx r0
	.align 2, 0
_08018B30: .4byte gCurrentSprite

	thumb_func_start SA_XNocMorphingToLayPowerBombInit
SA_XNocMorphingToLayPowerBombInit: @ 0x08018B34
	push {lr}
	ldr r2, _08018B50 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4c
	strb r0, [r1]
	ldr r0, _08018B54 @ =0x0000FFB0
	strh r0, [r2, #0xa]
	movs r0, #0xd
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08018B50: .4byte gCurrentSprite
_08018B54: .4byte 0x0000FFB0

	thumb_func_start SA_XNocMorphingToLayPowerBomb
SA_XNocMorphingToLayPowerBomb: @ 0x08018B58
	push {lr}
	ldr r0, _08018B70 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #0xf
	bne _08018B6A
	ldr r0, _08018B74 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x4d
	strb r1, [r0]
_08018B6A:
	pop {r0}
	bx r0
	.align 2, 0
_08018B70: .4byte gSaXData
_08018B74: .4byte gCurrentSprite

	thumb_func_start SA_XNocMorphedToLayPowerBombInit
SA_XNocMorphedToLayPowerBombInit: @ 0x08018B78
	ldr r1, _08018B90 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x4e
	strb r0, [r2]
	ldr r0, _08018B94 @ =0x0000FFD8
	strh r0, [r1, #0xa]
	adds r1, #0x2e
	movs r0, #0xf0
	strb r0, [r1]
	bx lr
	.align 2, 0
_08018B90: .4byte gCurrentSprite
_08018B94: .4byte 0x0000FFD8

	thumb_func_start SA_XNocMorphedToLayPowerBomb
SA_XNocMorphedToLayPowerBomb: @ 0x08018B98
	push {lr}
	sub sp, #0xc
	ldr r1, _08018BB8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08018BBC
	adds r1, #0x24
	movs r0, #0x3f
	strb r0, [r1]
	b _08018BDC
	.align 2, 0
_08018BB8: .4byte gCurrentSprite
_08018BBC:
	cmp r0, #0xbe
	bne _08018BDC
	adds r0, r1, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	str r0, [sp]
	ldrh r0, [r1, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x44
	movs r1, #0
	movs r2, #0
	bl SpriteSpawnSecondary
_08018BDC:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XNocWalking
SA_XNocWalking: @ 0x08018BE4
	push {r4, lr}
	bl unk_15e88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018C20
	bl SA_XNocWalkingCheckCollisions
	ldr r1, _08018C28 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	bne _08018C20
	ldr r0, _08018C2C @ =0x082E6BBC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _08018C20
	adds r0, #1
	strb r0, [r4]
_08018C20:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018C28: .4byte gCurrentSprite
_08018C2C: .4byte 0x082E6BBC

	thumb_func_start SA_XNocRunning
SA_XNocRunning: @ 0x08018C30
	push {r4, lr}
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018C6C
	bl SA_XNocRunningCheckCollisions
	ldr r1, _08018C74 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _08018C6C
	ldr r0, _08018C78 @ =0x082E6BCC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _08018C6C
	adds r0, #1
	strb r0, [r4]
_08018C6C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018C74: .4byte gCurrentSprite
_08018C78: .4byte 0x082E6BCC

	thumb_func_start SA_XNocTurningDuringChase
SA_XNocTurningDuringChase: @ 0x08018C7C
	push {r4, lr}
	ldr r0, _08018CA4 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _08018C9E
	ldr r4, _08018CA8 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	bl SA_XSetDirection
	adds r4, #0x24
	movs r0, #0x17
	strb r0, [r4]
_08018C9E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018CA4: .4byte gSaXData
_08018CA8: .4byte gCurrentSprite

	thumb_func_start SA_XNoc
SA_XNoc: @ 0x08018CAC
	push {lr}
	bl SA_XUpdateFreezeTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018CBA
	b _08018F48
_08018CBA:
	bl SA_XSeeAndLocateSamus
	ldr r0, _08018CD4 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4e
	bls _08018CCA
	b _08018F2E
_08018CCA:
	lsls r0, r0, #2
	ldr r1, _08018CD8 @ =_08018CDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018CD4: .4byte gCurrentSprite
_08018CD8: .4byte _08018CDC
_08018CDC: @ jump table
	.4byte _08018E18 @ case 0
	.4byte _08018E48 @ case 1
	.4byte _08018E4E @ case 2
	.4byte _08018EB8 @ case 3
	.4byte _08018EBC @ case 4
	.4byte _08018F2E @ case 5
	.4byte _08018F2E @ case 6
	.4byte _08018ECC @ case 7
	.4byte _08018ED0 @ case 8
	.4byte _08018F2E @ case 9
	.4byte _08018F2E @ case 10
	.4byte _08018F2E @ case 11
	.4byte _08018F2E @ case 12
	.4byte _08018F2E @ case 13
	.4byte _08018F2E @ case 14
	.4byte _08018F2E @ case 15
	.4byte _08018F2E @ case 16
	.4byte _08018F2E @ case 17
	.4byte _08018F2E @ case 18
	.4byte _08018F2E @ case 19
	.4byte _08018F2E @ case 20
	.4byte _08018EC2 @ case 21
	.4byte _08018EC6 @ case 22
	.4byte _08018EA4 @ case 23
	.4byte _08018EA8 @ case 24
	.4byte _08018E1E @ case 25
	.4byte _08018E24 @ case 26
	.4byte _08018E98 @ case 27
	.4byte _08018E9E @ case 28
	.4byte _08018F2E @ case 29
	.4byte _08018F2E @ case 30
	.4byte _08018F2E @ case 31
	.4byte _08018F2E @ case 32
	.4byte _08018F2E @ case 33
	.4byte _08018F2E @ case 34
	.4byte _08018F2E @ case 35
	.4byte _08018F2E @ case 36
	.4byte _08018F2E @ case 37
	.4byte _08018F2E @ case 38
	.4byte _08018F2E @ case 39
	.4byte _08018F2E @ case 40
	.4byte _08018ED6 @ case 41
	.4byte _08018EDA @ case 42
	.4byte _08018EE0 @ case 43
	.4byte _08018EE4 @ case 44
	.4byte _08018EEA @ case 45
	.4byte _08018EEE @ case 46
	.4byte _08018EF4 @ case 47
	.4byte _08018EF8 @ case 48
	.4byte _08018EFE @ case 49
	.4byte _08018F02 @ case 50
	.4byte _08018F2E @ case 51
	.4byte _08018F2E @ case 52
	.4byte _08018F2E @ case 53
	.4byte _08018F2E @ case 54
	.4byte _08018F08 @ case 55
	.4byte _08018F0C @ case 56
	.4byte _08018EAE @ case 57
	.4byte _08018EB2 @ case 58
	.4byte _08018F12 @ case 59
	.4byte _08018F16 @ case 60
	.4byte _08018F1C @ case 61
	.4byte _08018F20 @ case 62
	.4byte _08018F26 @ case 63
	.4byte _08018F2A @ case 64
	.4byte _08018E54 @ case 65
	.4byte _08018E58 @ case 66
	.4byte _08018E5E @ case 67
	.4byte _08018E62 @ case 68
	.4byte _08018E68 @ case 69
	.4byte _08018E6C @ case 70
	.4byte _08018E72 @ case 71
	.4byte _08018E76 @ case 72
	.4byte _08018E2A @ case 73
	.4byte _08018E2E @ case 74
	.4byte _08018E34 @ case 75
	.4byte _08018E38 @ case 76
	.4byte _08018E3E @ case 77
	.4byte _08018E42 @ case 78
_08018E18:
	bl SA_XNocInit
	b _08018F2E
_08018E1E:
	bl SA_XNocWaitingInDoorToLayPowerBomb
	b _08018F2E
_08018E24:
	bl SA_XNocWalkingToLayPowerBomb
	b _08018F2E
_08018E2A:
	bl SA_XNocIdleBeforeLayingPowerBombInit
_08018E2E:
	bl SA_XNocIdleBeforeLayingPowerBomb
	b _08018F2E
_08018E34:
	bl SA_XNocMorphingToLayPowerBombInit
_08018E38:
	bl SA_XNocMorphingToLayPowerBomb
	b _08018F2E
_08018E3E:
	bl SA_XNocMorphedToLayPowerBombInit
_08018E42:
	bl SA_XNocMorphedToLayPowerBomb
	b _08018F2E
_08018E48:
	bl SA_XWalkingInit
	b _08018F2E
_08018E4E:
	bl SA_XNocWalking
	b _08018F2E
_08018E54:
	bl SA_XIdleBeforeShootingDoorInit
_08018E58:
	bl SA_XIdleBeforeShootingDoor
	b _08018F2E
_08018E5E:
	bl SA_XShootingDoorInit
_08018E62:
	bl SA_XShootingDoor
	b _08018F2E
_08018E68:
	bl SA_XIdleAfterShootingDoorInit
_08018E6C:
	bl SA_XIdleAfterShootingDoor
	b _08018F2E
_08018E72:
	bl SA_XWalkingToDoorInit
_08018E76:
	bl SA_XWalkingToDoor
	ldr r0, _08018E94 @ =gCurrentSprite
	ldrh r0, [r0]
	cmp r0, #0
	bne _08018F2E
	movs r0, #0x50
	movs r1, #3
	movs r2, #8
	bl unk_372c
	movs r0, #0x31
	bl EventCheckAdvance
	b _08018F2E
	.align 2, 0
_08018E94: .4byte gCurrentSprite
_08018E98:
	bl SA_XNocWaitingInDoorDuringChase
	b _08018F2E
_08018E9E:
	bl SA_XNocOpeningDoorDuringChase
	b _08018F2E
_08018EA4:
	bl SA_XRunningStart
_08018EA8:
	bl SA_XNocRunning
	b _08018F2E
_08018EAE:
	bl SA_XTurningChaseStartInit
_08018EB2:
	bl SA_XNocTurningDuringChase
	b _08018F2E
_08018EB8:
	bl SA_XTurningInit
_08018EBC:
	bl SA_XTurning
	b _08018F2E
_08018EC2:
	bl SA_XFallingInit
_08018EC6:
	bl SA_XFalling
	b _08018F2E
_08018ECC:
	bl SA_XStandingInit
_08018ED0:
	bl SA_XStanding
	b _08018F2E
_08018ED6:
	bl SA_XDelayBeforeShootingBeamInit
_08018EDA:
	bl SA_XDelayBeforeShootingBeam
	b _08018F2E
_08018EE0:
	bl SA_XShootingBeamInit
_08018EE4:
	bl SA_XShootingBeam
	b _08018F2E
_08018EEA:
	bl SA_XDelayBeforeShootingMissileInit
_08018EEE:
	bl SA_XDelayBeforeShootingMissile
	b _08018F2E
_08018EF4:
	bl SA_XShootingMissileInit
_08018EF8:
	bl SA_XShootingMissile
	b _08018F2E
_08018EFE:
	bl SA_XIdleAfterShootingMissileInit
_08018F02:
	bl SA_XIdleAfterShootingMissile
	b _08018F2E
_08018F08:
	bl SA_XMidAirInit
_08018F0C:
	bl SA_XMidAir
	b _08018F2E
_08018F12:
	bl SA_XMorphingInit
_08018F16:
	bl SA_XMorphing
	b _08018F2E
_08018F1C:
	bl SA_XRollingInit
_08018F20:
	bl SA_XRolling
	b _08018F2E
_08018F26:
	bl SA_XUnmorphingInit
_08018F2A:
	bl SA_XUnmorphing
_08018F2E:
	bl SA_XUpdateGraphics
	ldr r0, _08018F4C @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08018F48
	movs r0, #0x17
	movs r1, #9
	bl PlayMusic
_08018F48:
	pop {r0}
	bx r0
	.align 2, 0
_08018F4C: .4byte gCurrentSprite

	thumb_func_start SA_XArcWalkingCheckCollisions
SA_XArcWalkingCheckCollisions: @ 0x08018F50
	push {r4, r5, r6, lr}
	ldr r4, _08018F94 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl unk_1129c
	ldr r5, _08018F98 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	cmp r2, #0
	bne _08018FC2
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018F9C
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08018F86
	b _0801908A
_08018F86:
	cmp r0, #4
	beq _08018FB4
	cmp r0, #2
	beq _08018F90
	b _08019092
_08018F90:
	b _08018FB4
	.align 2, 0
_08018F94: .4byte gCurrentSprite
_08018F98: .4byte gPreviousVerticalCollisionCheck
_08018F9C:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801908A
	cmp r0, #5
	beq _08018FB4
	cmp r0, #3
	bne _08019092
_08018FB4:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _08019092
_08018FC2:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019026
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _08019092
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08019014 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08019086
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x64
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801901C
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x64
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019018
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	b _08019090
	.align 2, 0
_08019014: .4byte gPreviousCollisionCheck
_08019018:
	movs r0, #2
	b _08019088
_0801901C:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	b _0801907C
_08019026:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	beq _08019092
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801906C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _08019086
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	subs r1, #0x64
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019074
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x64
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019070
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	b _08019090
	.align 2, 0
_0801906C: .4byte gPreviousCollisionCheck
_08019070:
	movs r0, #2
	b _08019088
_08019074:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
_0801907C:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019092
_08019086:
	movs r0, #1
_08019088:
	strb r0, [r6]
_0801908A:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
_08019090:
	strb r0, [r1]
_08019092:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SA_XArcRunningCheckCollisions
SA_XArcRunningCheckCollisions: @ 0x08019098
	push {r4, r5, r6, lr}
	ldr r4, _080190D4 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl unk_1129c
	ldr r5, _080190D8 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	cmp r2, #0
	bne _08019116
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080190E8
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080190DC
	adds r1, r4, #0
	adds r1, #0x24
	b _080193BA
	.align 2, 0
_080190D4: .4byte gCurrentSprite
_080190D8: .4byte gPreviousVerticalCollisionCheck
_080190DC:
	cmp r0, #4
	beq _08019108
	cmp r0, #2
	beq _080190E6
	b _080193BE
_080190E6:
	b _08019108
_080190E8:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080190FE
	adds r1, r4, #0
	adds r1, #0x24
	b _080193BA
_080190FE:
	cmp r0, #5
	beq _08019108
	cmp r0, #3
	beq _08019108
	b _080193BE
_08019108:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _080193BE
_08019116:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08019124
	b _0801923A
_08019124:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _0801912E
	b _080193BE
_0801912E:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08019158 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08019162
	ldrh r0, [r4, #2]
	subs r0, #0x90
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801915C
	movs r0, #1
	b _0801915E
	.align 2, 0
_08019158: .4byte gPreviousCollisionCheck
_0801915C:
	movs r0, #4
_0801915E:
	strb r0, [r6]
	b _080192D4
_08019162:
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801921C
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080191DA
	ldrh r0, [r4, #2]
	ldr r1, _080191C0 @ =0xFFFFFE98
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080191D0
	ldrh r0, [r4, #2]
	ldr r1, _080191C4 @ =0xFFFFFE34
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080191C8
	movs r0, #3
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #8
	b _080193BC
	.align 2, 0
_080191C0: .4byte 0xFFFFFE98
_080191C4: .4byte 0xFFFFFE34
_080191C8:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _080193BC
_080191D0:
	movs r0, #2
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _080193BA
_080191DA:
	ldrh r0, [r4, #2]
	ldr r1, _080191F4 @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080191F8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _080193BC
	.align 2, 0
_080191F4: .4byte 0xFFFFFEFC
_080191F8:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019212
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _080193BC
_08019212:
	movs r0, #2
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _080193BA
_0801921C:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08019230
	b _080193BE
_08019230:
	movs r0, #1
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _080193BA
_0801923A:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _08019244
	b _080193BE
_08019244:
	ldr r0, _08019280 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2b
	bne _08019294
	ldrh r1, [r4, #4]
	ldr r0, _08019284 @ =0x00000AFF
	cmp r1, r0
	bhi _08019294
	ldrh r0, [r4, #2]
	ldr r1, _08019288 @ =0xFFFFFE34
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801928C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019294
	ldr r2, _08019290 @ =gSaXVision
	ldrb r0, [r2, #4]
	cmp r0, #0
	bne _08019294
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x2d
	strb r1, [r0]
	ldrb r0, [r2]
	strb r0, [r6]
	b _080193BE
	.align 2, 0
_08019280: .4byte gCurrentRoom
_08019284: .4byte 0x00000AFF
_08019288: .4byte 0xFFFFFE34
_0801928C: .4byte gPreviousCollisionCheck
_08019290: .4byte gSaXVision
_08019294:
	ldr r4, _080192C4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080192C8 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _080192E4
	ldrh r0, [r4, #2]
	subs r0, #0x90
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _080192CC
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	b _080192D2
	.align 2, 0
_080192C4: .4byte gCurrentSprite
_080192C8: .4byte gPreviousCollisionCheck
_080192CC:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #4
_080192D2:
	strb r0, [r1]
_080192D4:
	ldr r0, _080192E0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x37
	strb r1, [r0]
	b _080193BE
	.align 2, 0
_080192E0: .4byte gCurrentSprite
_080192E4:
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801939E
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801935C
	ldrh r0, [r4, #2]
	ldr r1, _08019344 @ =0xFFFFFE98
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019354
	ldrh r0, [r4, #2]
	ldr r1, _08019348 @ =0xFFFFFE34
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801934C
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #3
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0x37
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #8
	b _080193BC
	.align 2, 0
_08019344: .4byte 0xFFFFFE98
_08019348: .4byte 0xFFFFFE34
_0801934C:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _080193BC
_08019354:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	b _080193B6
_0801935C:
	ldrh r0, [r4, #2]
	ldr r1, _08019378 @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801937C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _080193BC
	.align 2, 0
_08019378: .4byte 0xFFFFFEFC
_0801937C:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019396
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _080193BC
_08019396:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	b _080193B6
_0801939E:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _080193BE
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
_080193B6:
	strb r0, [r1]
	subs r1, #0xb
_080193BA:
	movs r0, #0x37
_080193BC:
	strb r0, [r1]
_080193BE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SA_XArcInit
SA_XArcInit: @ 0x080193C4
	push {r4, lr}
	ldr r4, _080193E8 @ =gCurrentSprite
	ldr r1, _080193EC @ =gSaXSpawnPosition
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	ldrh r0, [r1]
	strh r0, [r4, #4]
	bl SA_XInit
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080193F0
	ldrh r0, [r4, #4]
	subs r0, #0x48
	b _080193F4
	.align 2, 0
_080193E8: .4byte gCurrentSprite
_080193EC: .4byte gSaXSpawnPosition
_080193F0:
	ldrh r0, [r4, #4]
	adds r0, #0x48
_080193F4:
	strh r0, [r4, #4]
	ldr r4, _08019424 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #0
	strb r0, [r1]
	bl EventCheckOn_PowerBombsDownloaded
	cmp r0, #0
	beq _08019428
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
	movs r0, #1
	bl SetSA_XPose
	b _08019454
	.align 2, 0
_08019424: .4byte gCurrentSprite
_08019428:
	bl EventCheckOn_EngagedSaXArc
	cmp r0, #0
	beq _08019452
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x3c
	strb r0, [r1]
	movs r0, #0
	bl SetSA_XPose
	b _08019454
_08019452:
	strh r0, [r4]
_08019454:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XArcWaitingInDoorDuringChase
SA_XArcWaitingInDoorDuringChase: @ 0x0801945C
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _080194B4 @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080194D6
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	movs r0, #0x1e
	strb r0, [r2]
	mov r4, ip
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _080194B8
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x80
	bl SpriteSpawnSecondary
	b _080194D6
	.align 2, 0
_080194B4: .4byte gCurrentSprite
_080194B8:
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0x80
	bl SpriteSpawnSecondary
_080194D6:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XArcOpeningDoorDuringChase
SA_XArcOpeningDoorDuringChase: @ 0x080194E0
	push {r4, lr}
	ldr r4, _08019518 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019510
	bl SA_XRunningStart
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _0801951C @ =0x0000DFFF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_08019510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019518: .4byte gCurrentSprite
_0801951C: .4byte 0x0000DFFF

	thumb_func_start SA_XArcWaitingInDoor
SA_XArcWaitingInDoor: @ 0x08019520
	push {r4, lr}
	sub sp, #0xc
	bl EventCheckOn_EngagedSaXArc
	cmp r0, #0
	beq _08019592
	ldr r0, _08019570 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	mov r4, ip
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08019574
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #0x80
	bl SpriteSpawnSecondary
	b _08019592
	.align 2, 0
_08019570: .4byte gCurrentSprite
_08019574:
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	movs r1, #0x80
	bl SpriteSpawnSecondary
_08019592:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XArcOpeningDoor
SA_XArcOpeningDoor: @ 0x0801959C
	push {r4, lr}
	ldr r4, _080195D0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080195C8
	bl SA_XWalkingInit
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _080195D4 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r4]
	bl SubEventUpdateForSaXEncounter
_080195C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080195D0: .4byte gCurrentSprite
_080195D4: .4byte 0x0000DFFF

	thumb_func_start SA_XArcWalking
SA_XArcWalking: @ 0x080195D8
	push {r4, lr}
	bl unk_15e88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801964E
	bl SA_XArcWalkingCheckCollisions
	ldr r1, _08019614 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	ldrb r0, [r2]
	cmp r0, #2
	bne _0801964E
	ldr r0, _08019618 @ =gSamusData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0801962C
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019620
	ldr r0, _0801961C @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0801962C
	b _08019628
	.align 2, 0
_08019614: .4byte gCurrentSprite
_08019618: .4byte gSamusData
_0801961C: .4byte gSaXVision
_08019620:
	ldr r0, _08019654 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _0801962C
_08019628:
	movs r0, #0x4d
	strb r0, [r2]
_0801962C:
	ldr r1, _08019658 @ =0x082E6BBC
	ldr r0, _0801965C @ =gCurrentSprite
	adds r4, r0, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsrs r0, r0, #3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _0801964E
	adds r0, #1
	strb r0, [r4]
_0801964E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019654: .4byte gSaXVision
_08019658: .4byte 0x082E6BBC
_0801965C: .4byte gCurrentSprite

	thumb_func_start SA_XArcStoppedAtPillarInit
SA_XArcStoppedAtPillarInit: @ 0x08019660
	push {lr}
	ldr r2, _08019680 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _08019684 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08019680: .4byte gCurrentSprite
_08019684: .4byte 0x0000FF88

	thumb_func_start SA_XArcStoppedAtPillar
SA_XArcStoppedAtPillar: @ 0x08019688
	push {lr}
	ldr r1, _080196A8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080196A2
	adds r1, #0x24
	movs r0, #3
	strb r0, [r1]
_080196A2:
	pop {r0}
	bx r0
	.align 2, 0
_080196A8: .4byte gCurrentSprite

	thumb_func_start SA_XArcIdleAfterHearingWeaponInit
SA_XArcIdleAfterHearingWeaponInit: @ 0x080196AC
	push {lr}
	ldr r2, _080196CC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4c
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x78
	strb r0, [r1]
	ldr r0, _080196D0 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_080196CC: .4byte gCurrentSprite
_080196D0: .4byte 0x0000FF88

	thumb_func_start SA_XArcIdleAfterHearingWeapon
SA_XArcIdleAfterHearingWeapon: @ 0x080196D4
	push {lr}
	ldr r1, _080196F4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080196EE
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_080196EE:
	pop {r0}
	bx r0
	.align 2, 0
_080196F4: .4byte gCurrentSprite

	thumb_func_start SA_XArcTurningAroundAfterHearingWeaponStart
SA_XArcTurningAroundAfterHearingWeaponStart: @ 0x080196F8
	push {lr}
	ldr r2, _08019714 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4e
	strb r0, [r1]
	ldr r0, _08019718 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08019714: .4byte gCurrentSprite
_08019718: .4byte 0x0000FF88

	thumb_func_start SA_XArcTurningAround
SA_XArcTurningAround: @ 0x0801971C
	push {lr}
	bl unk_1129c
	ldr r0, _08019734 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801973C
	ldr r0, _08019738 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0801975E
	.align 2, 0
_08019734: .4byte gPreviousVerticalCollisionCheck
_08019738: .4byte gCurrentSprite
_0801973C:
	ldr r0, _08019764 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801975E
	ldr r2, _08019768 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4b
	strb r0, [r1]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	bl SA_XSetDirection
_0801975E:
	pop {r0}
	bx r0
	.align 2, 0
_08019764: .4byte gSaXData
_08019768: .4byte gCurrentSprite

	thumb_func_start SA_XArcRunning
SA_XArcRunning: @ 0x0801976C
	push {r4, lr}
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080197A8
	bl SA_XArcRunningCheckCollisions
	ldr r1, _080197B0 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _080197A8
	ldr r0, _080197B4 @ =0x082E6BCC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _080197A8
	adds r0, #1
	strb r0, [r4]
_080197A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080197B0: .4byte gCurrentSprite
_080197B4: .4byte 0x082E6BCC

	thumb_func_start SA_XArcTurningAroundDuringChase
SA_XArcTurningAroundDuringChase: @ 0x080197B8
	push {r4, lr}
	bl unk_1129c
	ldr r0, _080197D0 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _080197D8
	ldr r0, _080197D4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _080197F8
	.align 2, 0
_080197D0: .4byte gPreviousVerticalCollisionCheck
_080197D4: .4byte gCurrentSprite
_080197D8:
	ldr r0, _08019800 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _080197F8
	ldr r4, _08019804 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	bl SA_XSetDirection
	adds r4, #0x24
	movs r0, #0x17
	strb r0, [r4]
_080197F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019800: .4byte gSaXData
_08019804: .4byte gCurrentSprite

	thumb_func_start SA_XIdleBeforeShootingMissileInit
SA_XIdleBeforeShootingMissileInit: @ 0x08019808
	push {lr}
	ldr r2, _08019848 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x2e
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	beq _0801982E
	cmp r1, #1
	beq _0801982E
	cmp r1, #2
	bne _08019832
_0801982E:
	ldr r0, _0801984C @ =gSaXData
	strb r1, [r0, #3]
_08019832:
	ldrh r1, [r2]
	ldr r0, _08019850 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	bl SA_XSetDirection
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08019848: .4byte gCurrentSprite
_0801984C: .4byte gSaXData
_08019850: .4byte 0x0000FDFF

	thumb_func_start SA_XArcIdleBeforeShootingMissile
SA_XArcIdleBeforeShootingMissile: @ 0x08019854
	push {lr}
	bl unk_1129c
	ldr r0, _0801986C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019874
	ldr r0, _08019870 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0801988C
	.align 2, 0
_0801986C: .4byte gPreviousVerticalCollisionCheck
_08019870: .4byte gCurrentSprite
_08019874:
	ldr r1, _08019890 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801988C
	adds r1, #0x24
	movs r0, #0x2f
	strb r0, [r1]
_0801988C:
	pop {r0}
	bx r0
	.align 2, 0
_08019890: .4byte gCurrentSprite

	thumb_func_start SA_XArcShootingMissileInit
SA_XArcShootingMissileInit: @ 0x08019894
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _080198D4 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r4, #0
	movs r0, #0x30
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080198D8
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #0
	bl SpriteSpawnSecondary
	b _08019922
	.align 2, 0
_080198D4: .4byte gCurrentSprite
_080198D8:
	cmp r0, #1
	bne _080198FE
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x88
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	bl SpriteSpawnSecondary
	b _08019922
_080198FE:
	cmp r0, #2
	bne _08019922
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #2
	bl SpriteSpawnSecondary
_08019922:
	ldr r1, _08019938 @ =gSaXData
	movs r0, #0
	strb r0, [r1, #4]
	movs r0, #3
	bl SetSA_XPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019938: .4byte gSaXData

	thumb_func_start SA_XArcShootingMissile
SA_XArcShootingMissile: @ 0x0801993C
	push {lr}
	bl unk_1129c
	ldr r0, _08019954 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801995C
	ldr r0, _08019958 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _0801999E
	.align 2, 0
_08019954: .4byte gPreviousVerticalCollisionCheck
_08019958: .4byte gCurrentSprite
_0801995C:
	ldr r0, _08019988 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _080199A0
	ldr r0, _0801998C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019998
	ldr r3, _08019990 @ =gSaXVision
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _08019998
	ldr r1, _08019994 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x2d
	strb r0, [r2]
	ldrb r0, [r3]
	adds r1, #0x2f
	strb r0, [r1]
	b _080199A0
	.align 2, 0
_08019988: .4byte gSaXData
_0801998C: .4byte gPreviousCollisionCheck
_08019990: .4byte gSaXVision
_08019994: .4byte gCurrentSprite
_08019998:
	ldr r0, _080199A4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x39
_0801999E:
	strb r1, [r0]
_080199A0:
	pop {r0}
	bx r0
	.align 2, 0
_080199A4: .4byte gCurrentSprite

	thumb_func_start SA_XArc
SA_XArc: @ 0x080199A8
	push {lr}
	bl SA_XUpdateFreezeTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080199B6
	b _08019C1E
_080199B6:
	bl SA_XSeeAndLocateSamus
	ldr r0, _080199D0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4e
	bls _080199C6
	b _08019BDC
_080199C6:
	lsls r0, r0, #2
	ldr r1, _080199D4 @ =_080199D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080199D0: .4byte gCurrentSprite
_080199D4: .4byte _080199D8
_080199D8: @ jump table
	.4byte _08019B14 @ case 0
	.4byte _08019B26 @ case 1
	.4byte _08019B2C @ case 2
	.4byte _08019B84 @ case 3
	.4byte _08019B88 @ case 4
	.4byte _08019BDC @ case 5
	.4byte _08019BDC @ case 6
	.4byte _08019B98 @ case 7
	.4byte _08019B9C @ case 8
	.4byte _08019BDC @ case 9
	.4byte _08019BDC @ case 10
	.4byte _08019BDC @ case 11
	.4byte _08019BDC @ case 12
	.4byte _08019BDC @ case 13
	.4byte _08019BDC @ case 14
	.4byte _08019BDC @ case 15
	.4byte _08019BDC @ case 16
	.4byte _08019BDC @ case 17
	.4byte _08019BDC @ case 18
	.4byte _08019BDC @ case 19
	.4byte _08019BDC @ case 20
	.4byte _08019B8E @ case 21
	.4byte _08019B92 @ case 22
	.4byte _08019B5C @ case 23
	.4byte _08019B60 @ case 24
	.4byte _08019B1A @ case 25
	.4byte _08019B20 @ case 26
	.4byte _08019B50 @ case 27
	.4byte _08019B56 @ case 28
	.4byte _08019BDC @ case 29
	.4byte _08019BDC @ case 30
	.4byte _08019BDC @ case 31
	.4byte _08019BDC @ case 32
	.4byte _08019BDC @ case 33
	.4byte _08019BDC @ case 34
	.4byte _08019BDC @ case 35
	.4byte _08019BDC @ case 36
	.4byte _08019BDC @ case 37
	.4byte _08019BDC @ case 38
	.4byte _08019BDC @ case 39
	.4byte _08019BDC @ case 40
	.4byte _08019BA2 @ case 41
	.4byte _08019BA6 @ case 42
	.4byte _08019BAC @ case 43
	.4byte _08019BB0 @ case 44
	.4byte _08019B70 @ case 45
	.4byte _08019B74 @ case 46
	.4byte _08019B7A @ case 47
	.4byte _08019B7E @ case 48
	.4byte _08019BDC @ case 49
	.4byte _08019BDC @ case 50
	.4byte _08019BDC @ case 51
	.4byte _08019BDC @ case 52
	.4byte _08019BDC @ case 53
	.4byte _08019BDC @ case 54
	.4byte _08019BB6 @ case 55
	.4byte _08019BBA @ case 56
	.4byte _08019B66 @ case 57
	.4byte _08019B6A @ case 58
	.4byte _08019BC0 @ case 59
	.4byte _08019BC4 @ case 60
	.4byte _08019BCA @ case 61
	.4byte _08019BCE @ case 62
	.4byte _08019BD4 @ case 63
	.4byte _08019BD8 @ case 64
	.4byte _08019BDC @ case 65
	.4byte _08019BDC @ case 66
	.4byte _08019BDC @ case 67
	.4byte _08019BDC @ case 68
	.4byte _08019BDC @ case 69
	.4byte _08019BDC @ case 70
	.4byte _08019BDC @ case 71
	.4byte _08019BDC @ case 72
	.4byte _08019B32 @ case 73
	.4byte _08019B36 @ case 74
	.4byte _08019B3C @ case 75
	.4byte _08019B40 @ case 76
	.4byte _08019B46 @ case 77
	.4byte _08019B4A @ case 78
_08019B14:
	bl SA_XArcInit
	b _08019BDC
_08019B1A:
	bl SA_XArcWaitingInDoor
	b _08019BDC
_08019B20:
	bl SA_XArcOpeningDoor
	b _08019BDC
_08019B26:
	bl SA_XWalkingInit
	b _08019BDC
_08019B2C:
	bl SA_XArcWalking
	b _08019BDC
_08019B32:
	bl SA_XArcStoppedAtPillarInit
_08019B36:
	bl SA_XArcStoppedAtPillar
	b _08019BDC
_08019B3C:
	bl SA_XArcIdleAfterHearingWeaponInit
_08019B40:
	bl SA_XArcIdleAfterHearingWeapon
	b _08019BDC
_08019B46:
	bl SA_XArcTurningAroundAfterHearingWeaponStart
_08019B4A:
	bl SA_XArcTurningAround
	b _08019BDC
_08019B50:
	bl SA_XArcWaitingInDoorDuringChase
	b _08019BDC
_08019B56:
	bl SA_XArcOpeningDoorDuringChase
	b _08019BDC
_08019B5C:
	bl SA_XRunningStart
_08019B60:
	bl SA_XArcRunning
	b _08019BDC
_08019B66:
	bl SA_XTurningChaseStartInit
_08019B6A:
	bl SA_XArcTurningAroundDuringChase
	b _08019BDC
_08019B70:
	bl SA_XIdleBeforeShootingMissileInit
_08019B74:
	bl SA_XArcIdleBeforeShootingMissile
	b _08019BDC
_08019B7A:
	bl SA_XArcShootingMissileInit
_08019B7E:
	bl SA_XArcShootingMissile
	b _08019BDC
_08019B84:
	bl SA_XTurningInit
_08019B88:
	bl SA_XTurning
	b _08019BDC
_08019B8E:
	bl SA_XFallingInit
_08019B92:
	bl SA_XFalling
	b _08019BDC
_08019B98:
	bl SA_XStandingInit
_08019B9C:
	bl SA_XStanding
	b _08019BDC
_08019BA2:
	bl SA_XDelayBeforeShootingBeamInit
_08019BA6:
	bl SA_XDelayBeforeShootingBeam
	b _08019BDC
_08019BAC:
	bl SA_XShootingBeamInit
_08019BB0:
	bl SA_XShootingBeam
	b _08019BDC
_08019BB6:
	bl SA_XMidAirInit
_08019BBA:
	bl SA_XMidAir
	b _08019BDC
_08019BC0:
	bl SA_XMorphingInit
_08019BC4:
	bl SA_XMorphing
	b _08019BDC
_08019BCA:
	bl SA_XRollingInit
_08019BCE:
	bl SA_XRolling
	b _08019BDC
_08019BD4:
	bl SA_XUnmorphingInit
_08019BD8:
	bl SA_XUnmorphing
_08019BDC:
	ldr r0, _08019BF0 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #5
	bne _08019BF8
	ldr r0, _08019BF4 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _08019C02
	.align 2, 0
_08019BF0: .4byte gSaXData
_08019BF4: .4byte gCurrentSprite
_08019BF8:
	ldr r0, _08019C24 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0xbf
	ands r1, r2
_08019C02:
	strb r1, [r0]
	bl SA_XUpdateGraphics
	ldr r0, _08019C24 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08019C1E
	movs r0, #0x17
	movs r1, #9
	bl PlayMusic
_08019C1E:
	pop {r0}
	bx r0
	.align 2, 0
_08019C24: .4byte gCurrentSprite

	thumb_func_start SA_XLabInit
SA_XLabInit: @ 0x08019C28
	push {r4, lr}
	sub sp, #0xc
	bl SA_XInit
	ldr r0, _08019C5C @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x25
	movs r1, #0
	strb r1, [r0]
	mov r4, ip
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x6a
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019C5C: .4byte gCurrentSprite

	thumb_func_start SA_XLabShootingLabInit
SA_XLabShootingLabInit: @ 0x08019C60
	push {lr}
	ldr r1, _08019C7C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #2
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x64
	strb r0, [r1]
	movs r0, #9
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_08019C7C: .4byte gCurrentSprite

	thumb_func_start SA_XLabSetTarget
SA_XLabSetTarget: @ 0x08019C80
	ldr r1, _08019C90 @ =gXParasiteTargetYPosition
	ldr r2, _08019C94 @ =gCurrentSprite
	ldrh r0, [r2, #2]
	strh r0, [r1]
	ldr r1, _08019C98 @ =gXParasiteTargetXPosition
	ldrh r0, [r2, #4]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08019C90: .4byte gXParasiteTargetYPosition
_08019C94: .4byte gCurrentSprite
_08019C98: .4byte gXParasiteTargetXPosition

	thumb_func_start SA_XLabGettingCoveredByMetroids
SA_XLabGettingCoveredByMetroids: @ 0x08019C9C
	push {r4, lr}
	ldr r1, _08019CC8 @ =gCurrentSprite
	adds r4, r1, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019CC2
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #0x1a
	strb r1, [r0]
	movs r0, #0xa
	bl SetSA_XPose
	movs r0, #0x64
	strb r0, [r4]
_08019CC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019CC8: .4byte gCurrentSprite

	thumb_func_start SA_XLabCoveredByMetroids
SA_XLabCoveredByMetroids: @ 0x08019CCC
	push {lr}
	ldr r1, _08019CFC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x46
	bne _08019D04
	ldr r1, _08019D00 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x5d
	bl EventCheckAdvance
	movs r0, #0xa
	bl TrySpawnMessageBanner
	b _08019D22
	.align 2, 0
_08019CFC: .4byte gCurrentSprite
_08019D00: .4byte gPreventMovementTimer
_08019D04:
	cmp r0, #0x3c
	bne _08019D12
	movs r0, #0x8f
	lsls r0, r0, #2
	bl SoundPlay
	b _08019D22
_08019D12:
	cmp r0, #0
	bne _08019D22
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #0x1c
	strb r1, [r0]
	movs r0, #0x3c
	strb r0, [r2]
_08019D22:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XLabCoveredByMetroidsAfterDetachment
SA_XLabCoveredByMetroidsAfterDetachment: @ 0x08019D28
	push {lr}
	ldr r1, _08019D58 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08019D52
	movs r0, #0x3c
	strb r0, [r2]
	ldrh r1, [r1]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019D52
	movs r0, #0x8f
	lsls r0, r0, #2
	bl SoundPlay
_08019D52:
	pop {r0}
	bx r0
	.align 2, 0
_08019D58: .4byte gCurrentSprite

	thumb_func_start SA_XLab
SA_XLab: @ 0x08019D5C
	push {lr}
	ldr r0, _08019D74 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _08019E10
	lsls r0, r0, #2
	ldr r1, _08019D78 @ =_08019D7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08019D74: .4byte gCurrentSprite
_08019D78: .4byte _08019D7C
_08019D7C: @ jump table
	.4byte _08019DF0 @ case 0
	.4byte _08019DF4 @ case 1
	.4byte _08019DFA @ case 2
	.4byte _08019E10 @ case 3
	.4byte _08019E10 @ case 4
	.4byte _08019E10 @ case 5
	.4byte _08019E10 @ case 6
	.4byte _08019E10 @ case 7
	.4byte _08019E10 @ case 8
	.4byte _08019E10 @ case 9
	.4byte _08019E10 @ case 10
	.4byte _08019E10 @ case 11
	.4byte _08019E10 @ case 12
	.4byte _08019E10 @ case 13
	.4byte _08019E10 @ case 14
	.4byte _08019E10 @ case 15
	.4byte _08019E10 @ case 16
	.4byte _08019E10 @ case 17
	.4byte _08019E10 @ case 18
	.4byte _08019E10 @ case 19
	.4byte _08019E10 @ case 20
	.4byte _08019E10 @ case 21
	.4byte _08019E10 @ case 22
	.4byte _08019E10 @ case 23
	.4byte _08019E00 @ case 24
	.4byte _08019E10 @ case 25
	.4byte _08019E06 @ case 26
	.4byte _08019E10 @ case 27
	.4byte _08019E0C @ case 28
_08019DF0:
	bl SA_XLabInit
_08019DF4:
	bl SA_XLabShootingLabInit
	b _08019E10
_08019DFA:
	bl SA_XLabSetTarget
	b _08019E10
_08019E00:
	bl SA_XLabGettingCoveredByMetroids
	b _08019E10
_08019E06:
	bl SA_XLabCoveredByMetroids
	b _08019E10
_08019E0C:
	bl SA_XLabCoveredByMetroidsAfterDetachment
_08019E10:
	bl SA_XUpdateGraphics
	ldr r1, _08019E30 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	ldrh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08019E30: .4byte gCurrentSprite

	thumb_func_start SA_XBossRunniingCheckCollisions
SA_XBossRunniingCheckCollisions: @ 0x08019E34
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r6, #0
	ldr r4, _08019E70 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	strb r6, [r0]
	bl unk_1129c
	ldr r5, _08019E74 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	cmp r2, #0
	bne _08019EB2
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019E84
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08019E78
	adds r1, r4, #0
	adds r1, #0x24
	b _0801A26A
	.align 2, 0
_08019E70: .4byte gCurrentSprite
_08019E74: .4byte gPreviousVerticalCollisionCheck
_08019E78:
	cmp r0, #4
	beq _08019EA4
	cmp r0, #2
	beq _08019E82
	b _0801A26E
_08019E82:
	b _08019EA4
_08019E84:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08019E9A
	adds r1, r4, #0
	adds r1, #0x24
	b _0801A26A
_08019E9A:
	cmp r0, #5
	beq _08019EA4
	cmp r0, #3
	beq _08019EA4
	b _0801A26E
_08019EA4:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _0801A26E
_08019EB2:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08019EC0
	b _0801A00C
_08019EC0:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _08019ECA
	b _0801A26E
_08019ECA:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08019F50 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08019F60
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	movs r2, #0x90
	lsls r2, r2, #1
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08019F0E
	ldrh r0, [r4, #2]
	adds r0, #0x48
	ldrh r1, [r4, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019F08
	movs r7, #1
_08019F08:
	cmp r7, #0
	bne _08019F0E
	b _0801A0BE
_08019F0E:
	ldr r4, _08019F54 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldr r1, _08019F58 @ =0xFFFFFF00
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08019F50 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019F28
	b _0801A0BE
_08019F28:
	ldr r0, _08019F5C @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldrh r0, [r4, #2]
	adds r0, #0x48
	cmp r1, r0
	blt _08019F36
	b _0801A0BE
_08019F36:
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0x13
	bhi _08019F44
	movs r0, #0x14
	strb r0, [r1]
_08019F44:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	strb r0, [r1]
	b _0801A0BE
	.align 2, 0
_08019F50: .4byte gPreviousCollisionCheck
_08019F54: .4byte gCurrentSprite
_08019F58: .4byte 0xFFFFFF00
_08019F5C: .4byte gSamusData
_08019F60:
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019F8C
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _08019F8C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801A26C
_08019F8C:
	ldr r4, _08019FFC @ =gCurrentSprite
	ldrh r0, [r4, #6]
	cmp r0, #0xb3
	bls _08019F96
	b _0801A26E
_08019F96:
	ldrh r0, [r4, #2]
	subs r0, #0xbc
	ldrh r1, [r4, #4]
	adds r1, #0xc0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801A000 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _08019FAC
	b _0801A26E
_08019FAC:
	ldrh r0, [r4, #2]
	ldr r2, _0801A004 @ =0xFFFFFEC8
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	adds r1, #0xc0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _08019FC2
	b _0801A26E
_08019FC2:
	ldrh r0, [r4, #2]
	subs r0, #0x8c
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _08019FD6
	b _0801A26E
_08019FD6:
	ldr r0, _0801A008 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldrh r0, [r4, #2]
	subs r0, #0xf0
	cmp r1, r0
	blt _08019FE4
	b _0801A26E
_08019FE4:
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #7
	bhi _08019FF2
	movs r0, #8
	strb r0, [r1]
_08019FF2:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	b _0801A266
	.align 2, 0
_08019FFC: .4byte gCurrentSprite
_0801A000: .4byte gPreviousCollisionCheck
_0801A004: .4byte 0xFFFFFEC8
_0801A008: .4byte gSamusData
_0801A00C:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _0801A016
	b _0801A26E
_0801A016:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801A09C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801A0CC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	ldr r3, _0801A0A0 @ =0xFFFFFEE0
	adds r1, r1, r3
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0801A054
	ldrh r0, [r4, #2]
	adds r0, #0x48
	ldrh r1, [r4, #4]
	ldr r2, _0801A0A0 @ =0xFFFFFEE0
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801A050
	movs r7, #1
_0801A050:
	cmp r7, #0
	beq _0801A0BA
_0801A054:
	ldr r4, _0801A0A4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldr r3, _0801A0A8 @ =0xFFFFFF00
	adds r0, r0, r3
	ldrh r1, [r4, #4]
	subs r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801A09C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801A0BA
	ldr r0, _0801A0AC @ =gSamusData
	ldrh r2, [r0, #0x18]
	ldrh r1, [r4, #2]
	ldr r3, _0801A0B0 @ =0xFFFFFE48
	adds r0, r1, r3
	cmp r2, r0
	ble _0801A0B4
	adds r0, r1, #0
	adds r0, #0x48
	cmp r2, r0
	bge _0801A0BA
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0x13
	bhi _0801A090
	movs r0, #0x14
	strb r0, [r1]
_0801A090:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	strb r0, [r1]
	b _0801A0BA
	.align 2, 0
_0801A09C: .4byte gPreviousCollisionCheck
_0801A0A0: .4byte 0xFFFFFEE0
_0801A0A4: .4byte gCurrentSprite
_0801A0A8: .4byte 0xFFFFFF00
_0801A0AC: .4byte gSamusData
_0801A0B0: .4byte 0xFFFFFE48
_0801A0B4:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0801A0BA:
	cmp r6, #0
	bne _0801A0CC
_0801A0BE:
	ldr r0, _0801A0C8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x37
	strb r1, [r0]
	b _0801A26E
	.align 2, 0
_0801A0C8: .4byte gCurrentSprite
_0801A0CC:
	ldr r4, _0801A0FC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801A100 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801A104
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801A104
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801A26C
	.align 2, 0
_0801A0FC: .4byte gCurrentSprite
_0801A100: .4byte gPreviousCollisionCheck
_0801A104:
	ldr r4, _0801A16C @ =gCurrentSprite
	ldrh r0, [r4, #6]
	cmp r0, #0xb3
	bls _0801A10E
	b _0801A26E
_0801A10E:
	ldrh r0, [r4, #2]
	subs r0, #0xbc
	ldrh r1, [r4, #4]
	subs r1, #0xc0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801A170 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801A17C
	ldrh r0, [r4, #2]
	ldr r1, _0801A174 @ =0xFFFFFEC8
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0xc0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801A17C
	ldrh r0, [r4, #2]
	subs r0, #0x8c
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801A17C
	ldr r0, _0801A178 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldrh r0, [r4, #2]
	subs r0, #0xf0
	cmp r1, r0
	bge _0801A17C
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0801A162
	movs r0, #8
	strb r0, [r1]
_0801A162:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	b _0801A266
	.align 2, 0
_0801A16C: .4byte gCurrentSprite
_0801A170: .4byte gPreviousCollisionCheck
_0801A174: .4byte 0xFFFFFEC8
_0801A178: .4byte gSamusData
_0801A17C:
	ldr r4, _0801A1DC @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldr r6, _0801A1E0 @ =0xFFFFFEFC
	adds r0, r0, r6
	ldrh r1, [r4, #4]
	subs r1, #0xf0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801A1E4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801A1F0
	ldrh r0, [r4, #2]
	ldr r2, _0801A1E8 @ =0xFFFFFE3C
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	subs r1, #0xc0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801A1F0
	ldrh r0, [r4, #2]
	adds r0, r0, r6
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801A1F0
	ldr r0, _0801A1EC @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldrh r0, [r4, #2]
	subs r0, #0xf0
	cmp r1, r0
	bge _0801A1F0
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0801A1D4
	movs r0, #8
	strb r0, [r1]
_0801A1D4:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #3
	b _0801A266
	.align 2, 0
_0801A1DC: .4byte gCurrentSprite
_0801A1E0: .4byte 0xFFFFFEFC
_0801A1E4: .4byte gPreviousCollisionCheck
_0801A1E8: .4byte 0xFFFFFE3C
_0801A1EC: .4byte gSamusData
_0801A1F0:
	ldr r4, _0801A274 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0xc8
	ldrh r1, [r4, #4]
	ldr r6, _0801A278 @ =0xFFFFFEF0
	adds r1, r1, r6
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801A27C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801A26E
	ldrh r0, [r4, #2]
	ldr r3, _0801A280 @ =0xFFFFFE48
	adds r0, r0, r3
	ldrh r1, [r4, #4]
	adds r1, r1, r6
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801A26E
	ldrh r0, [r4, #2]
	ldr r1, _0801A284 @ =0xFFFFFDF8
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, r1, r6
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801A26E
	ldrh r0, [r4, #2]
	ldr r2, _0801A288 @ =0xFFFFFEFC
	adds r0, r0, r2
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801A26E
	ldr r0, _0801A28C @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldrh r0, [r4, #2]
	ldr r3, _0801A290 @ =0xFFFFFE70
	adds r0, r0, r3
	cmp r1, r0
	bge _0801A26E
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0801A260
	movs r0, #8
	strb r0, [r1]
_0801A260:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #5
_0801A266:
	strb r0, [r1]
	subs r1, #0xb
_0801A26A:
	movs r0, #0x37
_0801A26C:
	strb r0, [r1]
_0801A26E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A274: .4byte gCurrentSprite
_0801A278: .4byte 0xFFFFFEF0
_0801A27C: .4byte gPreviousCollisionCheck
_0801A280: .4byte 0xFFFFFE48
_0801A284: .4byte 0xFFFFFDF8
_0801A288: .4byte 0xFFFFFEFC
_0801A28C: .4byte gSamusData
_0801A290: .4byte 0xFFFFFE70

	thumb_func_start SA_XBossTrackSamus
SA_XBossTrackSamus: @ 0x0801A294
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801A2B8 @ =gSaXVision
	ldrb r1, [r0, #2]
	adds r6, r0, #0
	cmp r1, #1
	bne _0801A34E
	ldr r0, _0801A2BC @ =gCurrentSprite
	movs r1, #0
	strh r1, [r0, #6]
	bl SamusCheckHangingOnLedge
	cmp r0, #0
	beq _0801A2C0
	movs r0, #0xb8
	lsls r0, r0, #2
	movs r1, #0x95
	lsls r1, r1, #2
	b _0801A2C8
	.align 2, 0
_0801A2B8: .4byte gSaXVision
_0801A2BC: .4byte gCurrentSprite
_0801A2C0:
	movs r0, #0xf0
	lsls r0, r0, #1
	movs r1, #0xaa
	lsls r1, r1, #1
_0801A2C8:
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r4, r0, #0
	ldr r2, _0801A2F0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A2F8
	cmp r4, #8
	bne _0801A310
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	ldr r0, _0801A2F4 @ =gSaXVision
	ldrb r1, [r0]
	adds r0, r2, #0
	b _0801A486
	.align 2, 0
_0801A2F0: .4byte gCurrentSprite
_0801A2F4: .4byte gSaXVision
_0801A2F8:
	cmp r4, #4
	bne _0801A310
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	ldr r0, _0801A30C @ =gSaXVision
	ldrb r1, [r0]
	adds r0, r2, #0
	b _0801A486
	.align 2, 0
_0801A30C: .4byte gSaXVision
_0801A310:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0xa0
	lsls r1, r1, #2
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r4, r0, #0
	ldr r2, _0801A33C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A340
	cmp r4, #4
	beq _0801A332
	b _0801A55C
_0801A332:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801A4E2
	.align 2, 0
_0801A33C: .4byte gCurrentSprite
_0801A340:
	cmp r4, #8
	beq _0801A346
	b _0801A55C
_0801A346:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801A4E2
_0801A34E:
	movs r4, #0
	ldr r1, _0801A384 @ =gCurrentSprite
	ldrh r0, [r1, #6]
	adds r3, r1, #0
	cmp r0, #0xb3
	bhi _0801A3A0
	adds r0, #1
	strh r0, [r3, #6]
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A388
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _0801A372
	b _0801A55C
_0801A372:
	ldrb r0, [r6, #5]
	cmp r0, #0
	bne _0801A37A
	b _0801A55C
_0801A37A:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801A4E2
	.align 2, 0
_0801A384: .4byte gCurrentSprite
_0801A388:
	ldrb r0, [r6, #4]
	cmp r0, #1
	beq _0801A390
	b _0801A55C
_0801A390:
	ldrb r0, [r6, #5]
	cmp r0, #0
	bne _0801A398
	b _0801A55C
_0801A398:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801A4E2
_0801A3A0:
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A3EC
	ldr r2, _0801A3E4 @ =gSamusData
	ldrh r1, [r2, #0x18]
	ldrh r0, [r3, #2]
	ldr r5, _0801A3E8 @ =0xFFFFFD40
	adds r0, r0, r5
	cmp r1, r0
	bge _0801A3D4
	ldrh r2, [r2, #0x16]
	ldrh r1, [r3, #4]
	movs r7, #0xc8
	lsls r7, r7, #2
	adds r0, r1, r7
	cmp r2, r0
	bge _0801A3D4
	movs r5, #0x98
	lsls r5, r5, #2
	adds r0, r1, r5
	cmp r2, r0
	ble _0801A3D4
	movs r4, #1
_0801A3D4:
	cmp r4, #0
	bne _0801A3DA
	b _0801A4F4
_0801A3DA:
	movs r0, #1
	strb r0, [r6]
	strb r0, [r6, #1]
	b _0801A47A
	.align 2, 0
_0801A3E4: .4byte gSamusData
_0801A3E8: .4byte 0xFFFFFD40
_0801A3EC:
	ldr r0, _0801A490 @ =gSamusData
	ldrh r2, [r0, #0x18]
	ldrh r1, [r3, #2]
	ldr r7, _0801A494 @ =0xFFFFFB80
	adds r1, r1, r7
	adds r5, r0, #0
	cmp r2, r1
	bge _0801A412
	ldrh r2, [r5, #0x16]
	ldrh r1, [r3, #4]
	subs r7, #0x80
	adds r0, r1, r7
	cmp r2, r0
	ble _0801A412
	adds r7, #0xc0
	adds r0, r1, r7
	cmp r2, r0
	bge _0801A412
	movs r4, #1
_0801A412:
	cmp r4, #0
	bne _0801A472
	ldrh r2, [r5, #0x18]
	ldrh r1, [r3, #2]
	ldr r7, _0801A498 @ =0xFFFFFD40
	adds r0, r1, r7
	cmp r2, r0
	bge _0801A440
	subs r7, #0x88
	adds r0, r1, r7
	cmp r2, r0
	ble _0801A440
	ldrh r2, [r5, #0x16]
	ldrh r1, [r3, #4]
	adds r7, #0x28
	adds r0, r1, r7
	cmp r2, r0
	ble _0801A440
	adds r7, #0xc0
	adds r0, r1, r7
	cmp r2, r0
	bge _0801A440
	movs r4, #1
_0801A440:
	cmp r4, #0
	bne _0801A472
	ldrh r2, [r5, #0x18]
	ldrh r1, [r3, #2]
	ldr r7, _0801A49C @ =0xFFFFFD80
	adds r0, r1, r7
	cmp r2, r0
	bge _0801A46E
	subs r7, #0x3c
	adds r0, r1, r7
	cmp r2, r0
	ble _0801A46E
	ldrh r2, [r5, #0x16]
	ldrh r1, [r3, #4]
	subs r7, #0x24
	adds r0, r1, r7
	cmp r2, r0
	ble _0801A46E
	adds r7, #0xc0
	adds r0, r1, r7
	cmp r2, r0
	bge _0801A46E
	movs r4, #1
_0801A46E:
	cmp r4, #0
	beq _0801A4A0
_0801A472:
	movs r1, #0
	movs r0, #1
	strb r0, [r6]
	strb r1, [r6, #1]
_0801A47A:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x29
	strb r0, [r1]
	ldrb r1, [r6]
	adds r0, r3, #0
_0801A486:
	adds r0, #0x2f
	strb r1, [r0]
	movs r0, #1
	b _0801A55E
	.align 2, 0
_0801A490: .4byte gSamusData
_0801A494: .4byte 0xFFFFFB80
_0801A498: .4byte 0xFFFFFD40
_0801A49C: .4byte 0xFFFFFD80
_0801A4A0:
	ldrh r2, [r5, #0x18]
	ldrh r1, [r3, #2]
	adds r0, r1, #0
	subs r0, #0xfc
	cmp r2, r0
	bge _0801A4F4
	ldr r4, _0801A4E8 @ =0xFFFFFE70
	adds r0, r1, r4
	cmp r2, r0
	ble _0801A4F4
	ldrh r2, [r5, #0x16]
	ldrh r1, [r3, #4]
	ldr r5, _0801A4EC @ =0xFFFFFE80
	adds r0, r1, r5
	cmp r2, r0
	ble _0801A4F4
	ldr r7, _0801A4F0 @ =0xFFFFFF00
	adds r0, r1, r7
	cmp r2, r0
	bge _0801A4F4
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #7
	bhi _0801A4D6
	movs r0, #8
	strb r0, [r1]
_0801A4D6:
	adds r1, r3, #0
	adds r1, #0x2f
	movs r0, #3
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0x37
_0801A4E2:
	strb r0, [r1]
	movs r0, #1
	b _0801A55E
	.align 2, 0
_0801A4E8: .4byte 0xFFFFFE70
_0801A4EC: .4byte 0xFFFFFE80
_0801A4F0: .4byte 0xFFFFFF00
_0801A4F4:
	bl SamusCheckHangingOnLedge
	cmp r0, #0
	beq _0801A55C
	ldr r0, _0801A510 @ =gSamusData
	ldr r1, _0801A514 @ =gCurrentSprite
	ldrh r0, [r0, #0x18]
	adds r3, r1, #0
	ldrh r1, [r3, #2]
	cmp r0, r1
	bhs _0801A51C
	ldr r1, _0801A518 @ =gSaXVision
	movs r0, #1
	b _0801A520
	.align 2, 0
_0801A510: .4byte gSamusData
_0801A514: .4byte gCurrentSprite
_0801A518: .4byte gSaXVision
_0801A51C:
	ldr r1, _0801A558 @ =gSaXVision
	movs r0, #2
_0801A520:
	strb r0, [r1]
	adds r6, r1, #0
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	beq _0801A536
	movs r0, #1
_0801A536:
	strb r0, [r6, #1]
	ldrh r0, [r3, #6]
	subs r0, #0x46
	strh r0, [r3, #6]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2d
	strb r0, [r1]
	ldrb r1, [r6]
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	movs r0, #2
	bl SetSA_XPose
	movs r0, #1
	b _0801A55E
	.align 2, 0
_0801A558: .4byte gSaXVision
_0801A55C:
	movs r0, #0
_0801A55E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start SA_XBossRunningInit
SA_XBossRunningInit: @ 0x0801A564
	push {lr}
	ldr r3, _0801A590 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	ldr r0, _0801A594 @ =0x0000FF88
	strh r0, [r3, #0xa]
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801A58C
	movs r0, #0
	bl SetSA_XPose
_0801A58C:
	pop {r0}
	bx r0
	.align 2, 0
_0801A590: .4byte gCurrentSprite
_0801A594: .4byte 0x0000FF88

	thumb_func_start SA_XBossRunning
SA_XBossRunning: @ 0x0801A598
	push {r4, lr}
	bl SA_XBossTrackSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801A5D4
	bl SA_XBossRunniingCheckCollisions
	ldr r1, _0801A5DC @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _0801A5D4
	ldr r0, _0801A5E0 @ =0x082E6BCC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _0801A5D4
	adds r0, #1
	strb r0, [r4]
_0801A5D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A5DC: .4byte gCurrentSprite
_0801A5E0: .4byte 0x082E6BCC

	thumb_func_start SA_XBossSpinJumpingInit
SA_XBossSpinJumpingInit: @ 0x0801A5E4
	push {r4, r5, lr}
	ldr r5, _0801A618 @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x38
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	strb r2, [r0]
	movs r4, #0
	ldr r0, _0801A61C @ =0x0000FFB0
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #2]
	subs r0, #0x20
	strh r0, [r5, #2]
	movs r0, #5
	bl SetSA_XPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A618: .4byte gCurrentSprite
_0801A61C: .4byte 0x0000FFB0

	thumb_func_start SA_XBossSpinJumping
SA_XBossSpinJumping: @ 0x0801A620
	push {r4, r5, r6, lr}
	ldr r4, _0801A674 @ =gSaXVision
	ldr r2, _0801A678 @ =gCurrentSprite
	ldrh r0, [r2, #6]
	cmp r0, #0xb3
	bhi _0801A630
	adds r0, #1
	strh r0, [r2, #6]
_0801A630:
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801A6A0
	ldr r0, _0801A67C @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	beq _0801A644
	b _0801A83C
_0801A644:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0801A696
	adds r3, r2, #0
	adds r3, #0x24
	movs r0, #0x17
	strb r0, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A680
	ldrh r0, [r2, #6]
	cmp r0, #0xb3
	bls _0801A66A
	b _0801A83C
_0801A66A:
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _0801A672
	b _0801A83C
_0801A672:
	b _0801A690
	.align 2, 0
_0801A674: .4byte gSaXVision
_0801A678: .4byte gCurrentSprite
_0801A67C: .4byte gSaXData
_0801A680:
	ldrh r0, [r2, #6]
	cmp r0, #0xb3
	bls _0801A688
	b _0801A83C
_0801A688:
	ldrb r0, [r4, #4]
	cmp r0, #1
	beq _0801A690
	b _0801A83C
_0801A690:
	movs r0, #0x39
	strb r0, [r3]
	b _0801A83C
_0801A696:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0801A83C
_0801A6A0:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0801A6C4
	ldr r1, _0801A6C0 @ =0x082E6BCC
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsrs r0, r0, #3
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	b _0801A6C6
	.align 2, 0
_0801A6C0: .4byte 0x082E6BCC
_0801A6C4:
	movs r5, #4
_0801A6C6:
	ldr r4, _0801A700 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A708
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0801A704 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0x11
	beq _0801A734
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	beq _0801A734
	ldrh r0, [r4, #4]
	adds r0, r0, r5
	b _0801A732
	.align 2, 0
_0801A700: .4byte gCurrentSprite
_0801A704: .4byte gPreviousCollisionCheck
_0801A708:
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _0801A748 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	cmp r0, #0x11
	beq _0801A734
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	cmp r0, #0x11
	beq _0801A734
	ldrh r0, [r4, #4]
	subs r0, r0, r5
_0801A732:
	strh r0, [r4, #4]
_0801A734:
	ldr r1, _0801A74C @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	adds r6, r1, #0
	cmp r0, #1
	bne _0801A754
	ldr r0, _0801A750 @ =0x082E6BF0
	b _0801A7CE
	.align 2, 0
_0801A748: .4byte gPreviousCollisionCheck
_0801A74C: .4byte gCurrentSprite
_0801A750: .4byte 0x082E6BF0
_0801A754:
	cmp r0, #2
	bne _0801A778
	ldr r0, _0801A774 @ =0x082E6C50
	adds r4, r6, #0
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r5, [r1]
	cmp r2, #0x2a
	bhi _0801A7E8
	b _0801A7E4
	.align 2, 0
_0801A774: .4byte 0x082E6C50
_0801A778:
	cmp r0, #3
	bne _0801A79C
	ldr r0, _0801A798 @ =0x082E6C18
	adds r4, r6, #0
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r5, [r1]
	cmp r2, #0x46
	bhi _0801A7E8
	b _0801A7E4
	.align 2, 0
_0801A798: .4byte 0x082E6C18
_0801A79C:
	cmp r0, #4
	bne _0801A7A8
	ldr r0, _0801A7A4 @ =0x082E6C3C
	b _0801A7CE
	.align 2, 0
_0801A7A4: .4byte 0x082E6C3C
_0801A7A8:
	cmp r0, #5
	bne _0801A7CC
	ldr r0, _0801A7C8 @ =0x082E6C66
	adds r4, r6, #0
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r5, [r1]
	cmp r2, #0x46
	bhi _0801A7E8
	b _0801A7E4
	.align 2, 0
_0801A7C8: .4byte 0x082E6C66
_0801A7CC:
	ldr r0, _0801A81C @ =0x082E6BDC
_0801A7CE:
	adds r4, r6, #0
	adds r4, #0x31
	ldrb r3, [r4]
	lsls r1, r3, #0x18
	lsrs r2, r1, #0x18
	lsrs r1, r1, #0x1a
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r5, [r1]
	cmp r2, #0x26
	bhi _0801A7E8
_0801A7E4:
	adds r0, r3, #1
	strb r0, [r4]
_0801A7E8:
	adds r4, r6, #0
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
	lsls r0, r5, #0x10
	cmp r0, #0
	ble _0801A824
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0801A820 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801A83C
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	movs r0, #6
	bl SetSA_XPose
	b _0801A83C
	.align 2, 0
_0801A81C: .4byte 0x082E6BDC
_0801A820: .4byte gPreviousVerticalCollisionCheck
_0801A824:
	ldrh r0, [r6, #2]
	subs r0, #0x58
	ldrh r1, [r6, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801A844 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0801A83C
	ldrh r0, [r6, #2]
	subs r0, r0, r5
	strh r0, [r6, #2]
_0801A83C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801A844: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XBossWaitingToAppearInit
SA_XBossWaitingToAppearInit: @ 0x0801A848
	push {r4, r5, lr}
	ldr r4, _0801A874 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	movs r5, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x42
	strb r0, [r1]
	movs r0, #7
	bl SetSA_XPose
	adds r4, #0x2e
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A874: .4byte gCurrentSprite

	thumb_func_start SA_XBossWaitingToAppear
SA_XBossWaitingToAppear: @ 0x0801A878
	push {r4, r5, lr}
	ldr r2, _0801A8CC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r4, r2, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801A8E0
	ldr r3, _0801A8D0 @ =gSamusData
	ldrh r1, [r3, #0x18]
	ldrh r0, [r2, #2]
	ldr r5, _0801A8D4 @ =0xFFFFFEA0
	adds r0, r0, r5
	cmp r1, r0
	bge _0801A908
	ldrh r3, [r3, #0x16]
	ldrh r1, [r2, #4]
	ldr r2, _0801A8D8 @ =0xFFFFFA40
	adds r0, r1, r2
	cmp r3, r0
	ble _0801A908
	ldr r5, _0801A8DC @ =0xFFFFFB00
	adds r0, r1, r5
	cmp r3, r0
	bge _0801A908
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x50
	strb r0, [r4]
	movs r0, #0
	bl FadeMusic
	movs r0, #0x9b
	bl unk_3b1c
	b _0801A908
	.align 2, 0
_0801A8CC: .4byte gCurrentSprite
_0801A8D0: .4byte gSamusData
_0801A8D4: .4byte 0xFFFFFEA0
_0801A8D8: .4byte 0xFFFFFA40
_0801A8DC: .4byte 0xFFFFFB00
_0801A8E0:
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801A908
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x45
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #8
	strb r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0801A910 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0x51
	movs r1, #7
	bl PlayMusic
_0801A908:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A910: .4byte 0x0000DFFF

	thumb_func_start SA_XBossInit
SA_XBossInit: @ 0x0801A914
	push {r4, r5, lr}
	bl EventCheckOn_EnteredOperationsDeck
	adds r1, r0, #0
	cmp r1, #0
	bne _0801A92C
	ldr r0, _0801A928 @ =gCurrentSprite
	strh r1, [r0]
	b _0801A96A
	.align 2, 0
_0801A928: .4byte gCurrentSprite
_0801A92C:
	bl SA_XInit
	ldr r4, _0801A970 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	movs r5, #0
	movs r2, #0
	orrs r1, r0
	adds r3, r4, #0
	adds r3, #0x25
	movs r0, #2
	strb r0, [r3]
	strh r2, [r4, #6]
	ldr r0, _0801A974 @ =0x0000FDFF
	ands r1, r0
	strh r1, [r4]
	bl SA_XSetDirection
	adds r4, #0x30
	movs r0, #8
	strb r0, [r4]
	bl SA_XBossWaitingToAppearInit
	ldr r0, _0801A978 @ =gBossWork2
	strb r5, [r0]
	ldr r0, _0801A97C @ =gBossWork3
	strb r5, [r0]
	ldr r0, _0801A980 @ =gSaXData
	strb r5, [r0, #6]
_0801A96A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A970: .4byte gCurrentSprite
_0801A974: .4byte 0x0000FDFF
_0801A978: .4byte gBossWork2
_0801A97C: .4byte gBossWork3
_0801A980: .4byte gSaXData

	thumb_func_start SA_XBossFallingInit
SA_XBossFallingInit: @ 0x0801A984
	push {r4, r5, lr}
	ldr r5, _0801A9B0 @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x16
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	strb r2, [r0]
	movs r4, #0
	ldr r0, _0801A9B4 @ =0x0000FF88
	strh r0, [r5, #0xa]
	movs r0, #7
	bl SetSA_XPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A9B0: .4byte gCurrentSprite
_0801A9B4: .4byte 0x0000FF88

	thumb_func_start SA_XBossFalling
SA_XBossFalling: @ 0x0801A9B8
	push {r4, r5, r6, lr}
	ldr r4, _0801A9EC @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2d
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801AA0C
	ldr r0, _0801A9F0 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801AA6C
	adds r2, r4, #0
	adds r2, #0x24
	movs r0, #0x17
	strb r0, [r2]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801A9F8
	ldr r0, _0801A9F4 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0801AA6C
	b _0801AA00
	.align 2, 0
_0801A9EC: .4byte gCurrentSprite
_0801A9F0: .4byte gSaXData
_0801A9F4: .4byte gSaXVision
_0801A9F8:
	ldr r0, _0801AA08 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _0801AA6C
_0801AA00:
	movs r0, #0x39
	strb r0, [r2]
	b _0801AA6C
	.align 2, 0
_0801AA08: .4byte gSaXVision
_0801AA0C:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0801AA2C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801AA30
	strh r1, [r4, #2]
	movs r0, #1
	strb r0, [r5]
	movs r0, #6
	bl SetSA_XPose
	b _0801AA6C
	.align 2, 0
_0801AA2C: .4byte gPreviousVerticalCollisionCheck
_0801AA30:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0801AA58 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0801AA5C @ =0x00007FFF
	cmp r1, r0
	bne _0801AA60
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0801AA6A
	.align 2, 0
_0801AA58: .4byte sSpritesFallingSpeed
_0801AA5C: .4byte 0x00007FFF
_0801AA60:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_0801AA6A:
	strh r0, [r4, #2]
_0801AA6C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XBossTurningAroundDuringChaseInit
SA_XBossTurningAroundDuringChaseInit: @ 0x0801AA74
	push {lr}
	ldr r2, _0801AA90 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	ldr r0, _0801AA94 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_0801AA90: .4byte gCurrentSprite
_0801AA94: .4byte 0x0000FF88

	thumb_func_start SA_XBossTurningAroundDuringChase
SA_XBossTurningAroundDuringChase: @ 0x0801AA98
	push {r4, lr}
	ldr r0, _0801AACC @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801AAE0
	ldr r4, _0801AAD0 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	bl SA_XSetDirection
	ldr r0, _0801AAD4 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x1e
	bne _0801AAD8
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x45
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #8
	b _0801AADE
	.align 2, 0
_0801AACC: .4byte gSaXData
_0801AAD0: .4byte gCurrentSprite
_0801AAD4: .4byte gSamusData
_0801AAD8:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
_0801AADE:
	strb r0, [r1]
_0801AAE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XBossFallingFromKnockbackInit
SA_XBossFallingFromKnockbackInit: @ 0x0801AAE8
	push {r4, r5, lr}
	ldr r5, _0801AB14 @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x44
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x31
	strb r2, [r0]
	movs r4, #0
	ldr r0, _0801AB18 @ =0x0000FF88
	strh r0, [r5, #0xa]
	movs r0, #7
	bl SetSA_XPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801AB14: .4byte gCurrentSprite
_0801AB18: .4byte 0x0000FF88

	thumb_func_start SA_XBossFallingFromKnockback
SA_XBossFallingFromKnockback: @ 0x0801AB1C
	push {r4, r5, r6, lr}
	ldr r4, _0801AB44 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2d
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801AB94
	ldr r0, _0801AB48 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801ABF4
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _0801AB4C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x51
	strb r0, [r1]
	b _0801ABF4
	.align 2, 0
_0801AB44: .4byte gCurrentSprite
_0801AB48: .4byte gSaXData
_0801AB4C:
	ldrh r1, [r4]
	ldr r0, _0801AB7C @ =0x00007FFF
	ands r0, r1
	strh r0, [r4]
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801AB80 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801AB84
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x47
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #0x28
	strb r0, [r1]
	b _0801ABF4
	.align 2, 0
_0801AB7C: .4byte 0x00007FFF
_0801AB80: .4byte gSpriteRandomNumber
_0801AB84:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #0x3e
	strb r0, [r1]
	b _0801ABF4
_0801AB94:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0801ABB4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801ABB8
	strh r1, [r4, #2]
	movs r0, #1
	strb r0, [r5]
	movs r0, #6
	bl SetSA_XPose
	b _0801ABF4
	.align 2, 0
_0801ABB4: .4byte gPreviousVerticalCollisionCheck
_0801ABB8:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0801ABE0 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0801ABE4 @ =0x00007FFF
	cmp r1, r0
	bne _0801ABE8
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0801ABF2
	.align 2, 0
_0801ABE0: .4byte sSpritesFallingSpeed
_0801ABE4: .4byte 0x00007FFF
_0801ABE8:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_0801ABF2:
	strh r0, [r4, #2]
_0801ABF4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XBossVariableJumpHeightInit
SA_XBossVariableJumpHeightInit: @ 0x0801ABFC
	push {r4, lr}
	ldr r0, _0801AC10 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x49
	bne _0801AC14
	movs r0, #0x4a
	b _0801AC1E
	.align 2, 0
_0801AC10: .4byte gCurrentSprite
_0801AC14:
	cmp r0, #0x47
	bne _0801AC1C
	movs r0, #0x48
	b _0801AC1E
_0801AC1C:
	movs r0, #0x46
_0801AC1E:
	strb r0, [r1]
	ldr r4, _0801AC54 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0801AC58 @ =0x0000FFB0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	movs r0, #5
	bl SetSA_XPose
	ldr r0, _0801AC5C @ =gSamusData
	ldrh r0, [r0, #0x16]
	ldrh r1, [r4, #4]
	cmp r0, r1
	bhs _0801AC68
	ldrh r1, [r4]
	ldr r0, _0801AC60 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	ldr r1, _0801AC64 @ =gSaXData
	movs r0, #0x20
	b _0801AC78
	.align 2, 0
_0801AC54: .4byte gCurrentSprite
_0801AC58: .4byte 0x0000FFB0
_0801AC5C: .4byte gSamusData
_0801AC60: .4byte 0x0000FDFF
_0801AC64: .4byte gSaXData
_0801AC68:
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _0801AC88 @ =gSaXData
	movs r0, #0x10
_0801AC78:
	strh r0, [r1, #8]
	ldr r0, _0801AC8C @ =gCurrentSprite
	adds r0, #0x2d
	movs r1, #0
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801AC88: .4byte gSaXData
_0801AC8C: .4byte gCurrentSprite

	thumb_func_start SA_XBossVariableJumpHeight
SA_XBossVariableJumpHeight: @ 0x0801AC90
	push {r4, r5, r6, r7, lr}
	ldr r4, _0801ACD0 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801ACF8
	ldr r0, _0801ACD4 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	beq _0801ACA8
	b _0801AEE6
_0801ACA8:
	adds r2, r4, #0
	adds r2, #0x24
	movs r0, #0x17
	strb r0, [r2]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801ACDC
	ldrh r0, [r4, #6]
	cmp r0, #0xb3
	bls _0801ACC4
	b _0801AEE6
_0801ACC4:
	ldr r0, _0801ACD8 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0801ACCE
	b _0801AEE6
_0801ACCE:
	b _0801ACEE
	.align 2, 0
_0801ACD0: .4byte gCurrentSprite
_0801ACD4: .4byte gSaXData
_0801ACD8: .4byte gSaXVision
_0801ACDC:
	ldrh r0, [r4, #6]
	cmp r0, #0xb3
	bls _0801ACE4
	b _0801AEE6
_0801ACE4:
	ldr r0, _0801ACF4 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #1
	beq _0801ACEE
	b _0801AEE6
_0801ACEE:
	movs r0, #0x39
	strb r0, [r2]
	b _0801AEE6
	.align 2, 0
_0801ACF4: .4byte gSaXVision
_0801ACF8:
	ldr r2, _0801AD50 @ =0x082E6BCC
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r2
	ldr r0, _0801AD54 @ =gFrameCounter8Bit
	ldrb r2, [r0]
	movs r0, #3
	ands r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801AD5C
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801AD58 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0801AD88
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0801AD88
	ldrh r0, [r4, #4]
	adds r0, r0, r6
	b _0801AD86
	.align 2, 0
_0801AD50: .4byte 0x082E6BCC
_0801AD54: .4byte gSpriteRandomNumber
_0801AD58: .4byte gPreviousCollisionCheck
_0801AD5C:
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801AD9C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0801AD88
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0801AD88
	ldrh r0, [r4, #4]
	subs r0, r0, r6
_0801AD86:
	strh r0, [r4, #4]
_0801AD88:
	ldr r1, _0801ADA0 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r5, r1, #0
	cmp r0, #0x4a
	bne _0801ADA8
	ldr r1, _0801ADA4 @ =0x082E6CB2
	b _0801ADB6
	.align 2, 0
_0801AD9C: .4byte gPreviousCollisionCheck
_0801ADA0: .4byte gCurrentSprite
_0801ADA4: .4byte 0x082E6CB2
_0801ADA8:
	cmp r0, #0x48
	bne _0801ADB4
	ldr r1, _0801ADB0 @ =0x082E6C9E
	b _0801ADB6
	.align 2, 0
_0801ADB0: .4byte 0x082E6C9E
_0801ADB4:
	ldr r1, _0801AE04 @ =0x082E6C8A
_0801ADB6:
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r4, r5, #0
	adds r7, r4, #0
	adds r7, #0x31
	ldrb r0, [r7]
	cmp r0, #0x26
	bhi _0801ADD4
	adds r0, #1
	strb r0, [r7]
_0801ADD4:
	ldrh r0, [r4, #2]
	adds r0, r0, r6
	strh r0, [r4, #2]
	lsls r0, r6, #0x10
	cmp r0, #0
	ble _0801AE8C
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0801AE08 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801AE0C
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	movs r0, #6
	bl SetSA_XPose
	b _0801AEE6
	.align 2, 0
_0801AE04: .4byte 0x082E6C8A
_0801AE08: .4byte gPreviousVerticalCollisionCheck
_0801AE0C:
	ldrb r0, [r7]
	cmp r0, #0x20
	bls _0801AEE6
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #8
	strb r0, [r1]
	ldr r0, _0801AE60 @ =gSamusData
	ldrh r1, [r0, #0x18]
	adds r5, r0, #0
	ldrh r0, [r4, #2]
	cmp r1, r0
	bhs _0801AE38
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x48
	bne _0801AE34
	movs r0, #0x46
	strb r0, [r1]
_0801AE34:
	movs r0, #0
	strb r0, [r7]
_0801AE38:
	ldr r2, _0801AE64 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0801AE70
	ldrh r0, [r5, #0x16]
	adds r0, #0x64
	ldrh r3, [r2, #4]
	cmp r0, r3
	bge _0801AEE6
	ldr r0, _0801AE68 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0801AE6C @ =gSaXData
	movs r0, #0x20
	strh r0, [r1, #8]
	b _0801AEE6
	.align 2, 0
_0801AE60: .4byte gSamusData
_0801AE64: .4byte gCurrentSprite
_0801AE68: .4byte 0x0000FDFF
_0801AE6C: .4byte gSaXData
_0801AE70:
	ldrh r0, [r5, #0x16]
	subs r0, #0x64
	ldrh r4, [r2, #4]
	cmp r0, r4
	ble _0801AEE6
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801AE88 @ =gSaXData
	movs r0, #0x10
	strh r0, [r1, #8]
	b _0801AEE6
	.align 2, 0
_0801AE88: .4byte gSaXData
_0801AE8C:
	ldrh r0, [r4, #2]
	subs r0, #0x58
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r7, _0801AEC8 @ =gPreviousCollisionCheck
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _0801AEE6
	ldrh r0, [r4, #2]
	subs r0, r0, r6
	strh r0, [r4, #2]
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801AECC
	ldrh r0, [r4, #2]
	adds r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _0801AEE6
	adds r1, r4, #0
	b _0801AEE0
	.align 2, 0
_0801AEC8: .4byte gPreviousCollisionCheck
_0801AECC:
	ldrh r0, [r5, #2]
	adds r0, #0x10
	ldrh r1, [r5, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r7]
	cmp r0, #0x11
	bne _0801AEE6
	adds r1, r5, #0
_0801AEE0:
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
_0801AEE6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SA_XBossUpdateMosaic
SA_XBossUpdateMosaic: @ 0x0801AEEC
	push {lr}
	ldr r2, _0801AF04 @ =gSaXData
	ldrb r0, [r2, #6]
	cmp r0, #0
	beq _0801AF4E
	ldrb r0, [r2, #1]
	cmp r0, #5
	bne _0801AF0C
	ldr r1, _0801AF08 @ =gWrittenToMosaic_H
	movs r0, #0
	strh r0, [r1]
	b _0801AF4E
	.align 2, 0
_0801AF04: .4byte gSaXData
_0801AF08: .4byte gWrittenToMosaic_H
_0801AF0C:
	ldr r1, _0801AF34 @ =gBossWork2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #0x1d
	bls _0801AF40
	ldr r1, _0801AF38 @ =gBossWork3
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _0801AF3C
	strb r0, [r2, #6]
	b _0801AF4E
	.align 2, 0
_0801AF34: .4byte gBossWork2
_0801AF38: .4byte gBossWork3
_0801AF3C:
	movs r0, #0
	strb r0, [r3]
_0801AF40:
	ldr r2, _0801AF54 @ =gWrittenToMosaic_H
	ldr r1, _0801AF58 @ =0x082E6D22
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
_0801AF4E:
	pop {r0}
	bx r0
	.align 2, 0
_0801AF54: .4byte gWrittenToMosaic_H
_0801AF58: .4byte 0x082E6D22

	thumb_func_start SA_XBossKnockbackInit
SA_XBossKnockbackInit: @ 0x0801AF5C
	push {r4, r5, r6, r7, lr}
	ldr r4, _0801AFA4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x50
	strb r0, [r1]
	movs r5, #0
	ldr r0, _0801AFA8 @ =0x0000FF88
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x31
	strb r5, [r0]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #8
	bl SetSA_XPose
	ldr r0, _0801AFAC @ =gSamusData
	ldrh r0, [r0, #0x16]
	ldrh r1, [r4, #4]
	cmp r0, r1
	bls _0801AFB4
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	ldr r1, _0801AFB0 @ =gSaXData
	movs r0, #0x10
	b _0801AFC0
	.align 2, 0
_0801AFA4: .4byte gCurrentSprite
_0801AFA8: .4byte 0x0000FF88
_0801AFAC: .4byte gSamusData
_0801AFB0: .4byte gSaXData
_0801AFB4:
	ldrh r1, [r4]
	ldr r0, _0801AFF8 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	ldr r1, _0801AFFC @ =gSaXData
	movs r0, #0x20
_0801AFC0:
	strh r0, [r1, #8]
	adds r7, r1, #0
	ldr r3, _0801B000 @ =sPrimarySpriteStats
	ldr r2, _0801B004 @ =gCurrentSprite
	ldrb r1, [r2, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	adds r5, r1, #0
	ldrh r4, [r2, #0x14]
	adds r6, r4, #0
	lsrs r0, r1, #1
	cmp r4, r0
	bhi _0801B034
	adds r0, r1, #0
	movs r1, #6
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r4, r0
	bhs _0801B00C
	ldr r1, _0801B008 @ =gBossWork3
	movs r0, #3
	b _0801B028
	.align 2, 0
_0801AFF8: .4byte 0x0000FDFF
_0801AFFC: .4byte gSaXData
_0801B000: .4byte sPrimarySpriteStats
_0801B004: .4byte gCurrentSprite
_0801B008: .4byte gBossWork3
_0801B00C:
	lsls r0, r5, #1
	movs r1, #3
	bl __divsi3
	cmp r6, r0
	bge _0801B024
	ldr r1, _0801B020 @ =gBossWork3
	movs r0, #2
	b _0801B028
	.align 2, 0
_0801B020: .4byte gBossWork3
_0801B024:
	ldr r1, _0801B03C @ =gBossWork3
	movs r0, #1
_0801B028:
	strb r0, [r1]
	ldr r0, _0801B040 @ =gBossWork2
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	strb r0, [r7, #6]
_0801B034:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B03C: .4byte gBossWork3
_0801B040: .4byte gBossWork2

	thumb_func_start SA_XBossKnockback
SA_XBossKnockback: @ 0x0801B044
	push {r4, r5, lr}
	ldr r2, _0801B070 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r1, _0801B074 @ =0x082E6CD2
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #0
	ldrsh r1, [r0, r4]
	ldr r0, _0801B078 @ =0x00007FFF
	adds r4, r2, #0
	cmp r1, r0
	bne _0801B07C
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x43
	strb r0, [r1]
	b _0801B088
	.align 2, 0
_0801B070: .4byte gCurrentSprite
_0801B074: .4byte 0x082E6CD2
_0801B078: .4byte 0x00007FFF
_0801B07C:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_0801B088:
	adds r5, r4, #0
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801B0B8
	ldrh r0, [r5, #2]
	subs r0, #0x48
	ldrh r1, [r5, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801B0B4 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B0D2
	ldrh r0, [r5, #4]
	subs r0, #8
	strh r0, [r5, #4]
	b _0801B0D2
	.align 2, 0
_0801B0B4: .4byte gPreviousCollisionCheck
_0801B0B8:
	ldrh r0, [r4, #2]
	subs r0, #0x48
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801B0D8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B0D2
	ldrh r0, [r4, #4]
	adds r0, #8
	strh r0, [r4, #4]
_0801B0D2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801B0D8: .4byte gPreviousCollisionCheck

	thumb_func_start SA_XBossKneelingInit
SA_XBossKneelingInit: @ 0x0801B0DC
	push {r4, lr}
	ldr r0, _0801B124 @ =gSaXData
	movs r2, #0
	strb r2, [r0, #6]
	ldr r4, _0801B128 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x52
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	ldr r0, _0801B12C @ =0x0000FF88
	strh r0, [r4, #0xa]
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0xb
	bl SetSA_XPose
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x78
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #4
	strh r0, [r4, #2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B124: .4byte gSaXData
_0801B128: .4byte gCurrentSprite
_0801B12C: .4byte 0x0000FF88

	thumb_func_start SA_XBossKneeling
SA_XBossKneeling: @ 0x0801B130
	push {lr}
	ldr r1, _0801B150 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	beq _0801B154
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B16A
	movs r0, #0xc
	bl SetSA_XPose
	b _0801B16A
	.align 2, 0
_0801B150: .4byte gCurrentSprite
_0801B154:
	adds r2, r1, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B16A
	adds r1, #0x24
	movs r0, #0x53
	strb r0, [r1]
_0801B16A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XBossTransformingIntoMonsterInit
SA_XBossTransformingIntoMonsterInit: @ 0x0801B170
	ldr r1, _0801B184 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x54
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x1d
	strb r0, [r1]
	bx lr
	.align 2, 0
_0801B184: .4byte gCurrentSprite

	thumb_func_start SA_XBossTransformingIntoMonster
SA_XBossTransformingIntoMonster: @ 0x0801B188
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r5, _0801B1F8 @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x1b
	bhi _0801B20C
	ldrb r1, [r1]
	ldr r3, _0801B1FC @ =0x040000D4
	ldr r0, _0801B200 @ =sSpritesGraphicsPointers
	movs r2, #0xb1
	lsls r2, r2, #2
	adds r0, r0, r2
	lsls r1, r1, #9
	movs r6, #0x80
	lsls r6, r6, #4
	adds r2, r1, r6
	ldr r0, [r0]
	adds r0, r0, r2
	str r0, [r3]
	ldr r0, _0801B204 @ =0x06014800
	adds r1, r1, r0
	str r1, [r3, #4]
	ldr r0, _0801B208 @ =0x80000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	cmp r4, #0
	bne _0801B22A
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	ldrh r0, [r5, #2]
	adds r0, #4
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	ldrh r3, [r5]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0xc1
	movs r3, #0x10
	bl SpriteSpawnPrimary
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x55
	strb r0, [r1]
	b _0801B22A
	.align 2, 0
_0801B1F8: .4byte gCurrentSprite
_0801B1FC: .4byte 0x040000D4
_0801B200: .4byte sSpritesGraphicsPointers
_0801B204: .4byte 0x06014800
_0801B208: .4byte 0x80000100
_0801B20C:
	cmp r4, #0x1c
	bne _0801B22A
	ldr r1, _0801B234 @ =0x040000D4
	ldr r0, _0801B238 @ =sSpritesPalettePointers
	movs r2, #0xb1
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0]
	adds r0, #0x20
	str r0, [r1]
	ldr r0, _0801B23C @ =0x05000320
	str r0, [r1, #4]
	ldr r0, _0801B240 @ =0x80000070
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0801B22A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B234: .4byte 0x040000D4
_0801B238: .4byte sSpritesPalettePointers
_0801B23C: .4byte 0x05000320
_0801B240: .4byte 0x80000070

	thumb_func_start SA_XBossAfterTransformation
SA_XBossAfterTransformation: @ 0x0801B244
	ldr r1, _0801B24C @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0801B24C: .4byte gCurrentSprite

	thumb_func_start SA_XBoss
SA_XBoss: @ 0x0801B250
	push {r4, r5, lr}
	ldr r4, _0801B29C @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0x50
	bhi _0801B286
	bl SA_XUpdateFreezeTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B26A
	b _0801B50C
_0801B26A:
	bl SA_XSeeAndLocateSamus
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bne _0801B286
	movs r0, #0x4f
	strb r0, [r5]
	movs r0, #0x9c
	bl SoundPlay
_0801B286:
	ldr r0, _0801B29C @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x55
	bls _0801B292
	b _0801B4DA
_0801B292:
	lsls r0, r0, #2
	ldr r1, _0801B2A0 @ =_0801B2A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B29C: .4byte gCurrentSprite
_0801B2A0: .4byte _0801B2A4
_0801B2A4: @ jump table
	.4byte _0801B3FC @ case 0
	.4byte _0801B434 @ case 1
	.4byte _0801B43A @ case 2
	.4byte _0801B440 @ case 3
	.4byte _0801B444 @ case 4
	.4byte _0801B4DA @ case 5
	.4byte _0801B4DA @ case 6
	.4byte _0801B42A @ case 7
	.4byte _0801B42E @ case 8
	.4byte _0801B4DA @ case 9
	.4byte _0801B4DA @ case 10
	.4byte _0801B4DA @ case 11
	.4byte _0801B4DA @ case 12
	.4byte _0801B4DA @ case 13
	.4byte _0801B4DA @ case 14
	.4byte _0801B4DA @ case 15
	.4byte _0801B4DA @ case 16
	.4byte _0801B4DA @ case 17
	.4byte _0801B4DA @ case 18
	.4byte _0801B4DA @ case 19
	.4byte _0801B4DA @ case 20
	.4byte _0801B402 @ case 21
	.4byte _0801B406 @ case 22
	.4byte _0801B40C @ case 23
	.4byte _0801B410 @ case 24
	.4byte _0801B4DA @ case 25
	.4byte _0801B4DA @ case 26
	.4byte _0801B4DA @ case 27
	.4byte _0801B4DA @ case 28
	.4byte _0801B4DA @ case 29
	.4byte _0801B4DA @ case 30
	.4byte _0801B4DA @ case 31
	.4byte _0801B4DA @ case 32
	.4byte _0801B4DA @ case 33
	.4byte _0801B4DA @ case 34
	.4byte _0801B4DA @ case 35
	.4byte _0801B4DA @ case 36
	.4byte _0801B4DA @ case 37
	.4byte _0801B4DA @ case 38
	.4byte _0801B4DA @ case 39
	.4byte _0801B4DA @ case 40
	.4byte _0801B44A @ case 41
	.4byte _0801B44E @ case 42
	.4byte _0801B454 @ case 43
	.4byte _0801B458 @ case 44
	.4byte _0801B45E @ case 45
	.4byte _0801B462 @ case 46
	.4byte _0801B468 @ case 47
	.4byte _0801B46C @ case 48
	.4byte _0801B472 @ case 49
	.4byte _0801B476 @ case 50
	.4byte _0801B4DA @ case 51
	.4byte _0801B4DA @ case 52
	.4byte _0801B4DA @ case 53
	.4byte _0801B4DA @ case 54
	.4byte _0801B416 @ case 55
	.4byte _0801B41A @ case 56
	.4byte _0801B420 @ case 57
	.4byte _0801B424 @ case 58
	.4byte _0801B47C @ case 59
	.4byte _0801B480 @ case 60
	.4byte _0801B486 @ case 61
	.4byte _0801B48A @ case 62
	.4byte _0801B490 @ case 63
	.4byte _0801B494 @ case 64
	.4byte _0801B49A @ case 65
	.4byte _0801B49E @ case 66
	.4byte _0801B4A4 @ case 67
	.4byte _0801B4A8 @ case 68
	.4byte _0801B4AE @ case 69
	.4byte _0801B4B2 @ case 70
	.4byte _0801B4AE @ case 71
	.4byte _0801B4B2 @ case 72
	.4byte _0801B4AE @ case 73
	.4byte _0801B4B2 @ case 74
	.4byte _0801B4DA @ case 75
	.4byte _0801B4DA @ case 76
	.4byte _0801B4DA @ case 77
	.4byte _0801B4DA @ case 78
	.4byte _0801B4B8 @ case 79
	.4byte _0801B4BC @ case 80
	.4byte _0801B4C2 @ case 81
	.4byte _0801B4C6 @ case 82
	.4byte _0801B4CC @ case 83
	.4byte _0801B4D0 @ case 84
	.4byte _0801B4D6 @ case 85
_0801B3FC:
	bl SA_XBossInit
	b _0801B4DA
_0801B402:
	bl SA_XBossFallingInit
_0801B406:
	bl SA_XBossFalling
	b _0801B4DA
_0801B40C:
	bl SA_XBossRunningInit
_0801B410:
	bl SA_XBossRunning
	b _0801B4DA
_0801B416:
	bl SA_XBossSpinJumpingInit
_0801B41A:
	bl SA_XBossSpinJumping
	b _0801B4DA
_0801B420:
	bl SA_XBossTurningAroundDuringChaseInit
_0801B424:
	bl SA_XBossTurningAroundDuringChase
	b _0801B4DA
_0801B42A:
	bl SA_XStandingInit
_0801B42E:
	bl SA_XStanding
	b _0801B4DA
_0801B434:
	bl SA_XWalkingInit
	b _0801B4DA
_0801B43A:
	bl SA_XWalking
	b _0801B4DA
_0801B440:
	bl SA_XTurningInit
_0801B444:
	bl SA_XTurning
	b _0801B4DA
_0801B44A:
	bl SA_XDelayBeforeShootingBeamInit
_0801B44E:
	bl SA_XDelayBeforeShootingBeam
	b _0801B4DA
_0801B454:
	bl SA_XShootingBeamInit
_0801B458:
	bl SA_XShootingBeam
	b _0801B4DA
_0801B45E:
	bl SA_XDelayBeforeShootingMissileInit
_0801B462:
	bl SA_XDelayBeforeShootingMissile
	b _0801B4DA
_0801B468:
	bl SA_XShootingMissileInit
_0801B46C:
	bl SA_XShootingMissile
	b _0801B4DA
_0801B472:
	bl SA_XIdleAfterShootingMissileInit
_0801B476:
	bl SA_XIdleAfterShootingMissile
	b _0801B4DA
_0801B47C:
	bl SA_XMorphingInit
_0801B480:
	bl SA_XMorphing
	b _0801B4DA
_0801B486:
	bl SA_XRollingInit
_0801B48A:
	bl SA_XRolling
	b _0801B4DA
_0801B490:
	bl SA_XUnmorphingInit
_0801B494:
	bl SA_XUnmorphing
	b _0801B4DA
_0801B49A:
	bl SA_XBossWaitingToAppearInit
_0801B49E:
	bl SA_XBossWaitingToAppear
	b _0801B4DA
_0801B4A4:
	bl SA_XBossFallingFromKnockbackInit
_0801B4A8:
	bl SA_XBossFallingFromKnockback
	b _0801B4DA
_0801B4AE:
	bl SA_XBossVariableJumpHeightInit
_0801B4B2:
	bl SA_XBossVariableJumpHeight
	b _0801B4DA
_0801B4B8:
	bl SA_XBossKnockbackInit
_0801B4BC:
	bl SA_XBossKnockback
	b _0801B4DA
_0801B4C2:
	bl SA_XBossKneelingInit
_0801B4C6:
	bl SA_XBossKneeling
	b _0801B4DA
_0801B4CC:
	bl SA_XBossTransformingIntoMonsterInit
_0801B4D0:
	bl SA_XBossTransformingIntoMonster
	b _0801B4DA
_0801B4D6:
	bl SA_XBossAfterTransformation
_0801B4DA:
	ldr r0, _0801B4F0 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #5
	bne _0801B4F8
	ldr r0, _0801B4F4 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _0801B502
	.align 2, 0
_0801B4F0: .4byte gSaXData
_0801B4F4: .4byte gCurrentSprite
_0801B4F8:
	ldr r0, _0801B514 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0xbf
	ands r1, r2
_0801B502:
	strb r1, [r0]
	bl SA_XBossUpdateMosaic
	bl SA_XUpdateGraphics
_0801B50C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801B514: .4byte gCurrentSprite

	thumb_func_start SA_XOmegaInit
SA_XOmegaInit: @ 0x0801B518
	push {lr}
	bl SA_XInit
	bl MakeSpriteFaceAwayFromSamusDirection
	bl SA_XSetDirection
	ldr r2, _0801B55C @ =gCurrentSprite
	movs r1, #0
	movs r0, #0
	strh r0, [r2, #0x14]
	adds r0, r2, #0
	adds r0, #0x25
	strb r1, [r0]
	adds r0, #8
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x5a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, #0x48
	strh r0, [r2, #2]
	movs r0, #7
	bl SetSA_XPose
	ldr r1, _0801B560 @ =gSaXData
	movs r0, #1
	strb r0, [r1, #6]
	pop {r0}
	bx r0
	.align 2, 0
_0801B55C: .4byte gCurrentSprite
_0801B560: .4byte gSaXData

	thumb_func_start SA_XOmegaForming
SA_XOmegaForming: @ 0x0801B564
	push {lr}
	ldr r3, _0801B590 @ =gCurrentSprite
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
	beq _0801B59C
	ldr r2, _0801B594 @ =gWrittenToMosaic_H
	ldr r1, _0801B598 @ =sXParasiteMosaicValues
	mov r3, ip
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0801B5AE
	.align 2, 0
_0801B590: .4byte gCurrentSprite
_0801B594: .4byte gWrittenToMosaic_H
_0801B598: .4byte sXParasiteMosaicValues
_0801B59C:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x16
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldr r0, _0801B5B4 @ =gSaXData
	strb r2, [r0, #6]
_0801B5AE:
	pop {r0}
	bx r0
	.align 2, 0
_0801B5B4: .4byte gSaXData

	thumb_func_start SA_XOmegaFalling
SA_XOmegaFalling: @ 0x0801B5B8
	push {r4, r5, r6, lr}
	ldr r4, _0801B5D8 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2d
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801B5E0
	ldr r0, _0801B5DC @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801B640
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #7
	strb r0, [r1]
	b _0801B640
	.align 2, 0
_0801B5D8: .4byte gCurrentSprite
_0801B5DC: .4byte gSaXData
_0801B5E0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0801B600 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B604
	strh r1, [r4, #2]
	movs r0, #1
	strb r0, [r5]
	movs r0, #6
	bl SetSA_XPose
	b _0801B640
	.align 2, 0
_0801B600: .4byte gPreviousVerticalCollisionCheck
_0801B604:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0801B62C @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0801B630 @ =0x00007FFF
	cmp r1, r0
	bne _0801B634
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0801B63E
	.align 2, 0
_0801B62C: .4byte sSpritesFallingSpeed
_0801B630: .4byte 0x00007FFF
_0801B634:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_0801B63E:
	strh r0, [r4, #2]
_0801B640:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XOmegaStandingInit
SA_XOmegaStandingInit: @ 0x0801B648
	ldr r1, _0801B65C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #8
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x18
	strb r0, [r1]
	bx lr
	.align 2, 0
_0801B65C: .4byte gCurrentSprite

	thumb_func_start SA_XOmegaStanding
SA_XOmegaStanding: @ 0x0801B660
	push {lr}
	ldr r1, _0801B680 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B67A
	adds r1, #0x24
	movs r0, #0x3f
	strb r0, [r1]
_0801B67A:
	pop {r0}
	bx r0
	.align 2, 0
_0801B680: .4byte gCurrentSprite

	thumb_func_start SA_XOmegaRunningInit
SA_XOmegaRunningInit: @ 0x0801B684
	push {r4, lr}
	ldr r4, _0801B6AC @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x40
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r0, #0
	bl SetSA_XPose
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B6AC: .4byte gCurrentSprite

	thumb_func_start SA_XOmegaRunning
SA_XOmegaRunning: @ 0x0801B6B0
	push {r4, r5, lr}
	ldr r0, _0801B6F0 @ =0x082E6BCC
	ldr r4, _0801B6F4 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r5]
	cmp r0, #0x3e
	bhi _0801B6D4
	adds r0, #1
	strb r0, [r5]
_0801B6D4:
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B6EA
	subs r1, #0xa
	movs r0, #0x41
	strb r0, [r1]
_0801B6EA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801B6F0: .4byte 0x082E6BCC
_0801B6F4: .4byte gCurrentSprite

	thumb_func_start SA_XOmegaIdleBeforeShootingOmegaInit
SA_XOmegaIdleBeforeShootingOmegaInit: @ 0x0801B6F8
	push {lr}
	ldr r1, _0801B71C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x42
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _0801B720 @ =gSaXData
	movs r0, #1
	strb r0, [r1, #3]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_0801B71C: .4byte gCurrentSprite
_0801B720: .4byte gSaXData

	thumb_func_start SA_XOmegaIdleBeforeShootingOmega
SA_XOmegaIdleBeforeShootingOmega: @ 0x0801B724
	push {lr}
	ldr r1, _0801B744 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B73E
	adds r1, #0x24
	movs r0, #0x43
	strb r0, [r1]
_0801B73E:
	pop {r0}
	bx r0
	.align 2, 0
_0801B744: .4byte gCurrentSprite

	thumb_func_start SA_XOmegaShootingOmegaInit
SA_XOmegaShootingOmegaInit: @ 0x0801B748
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0801B790 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r4, #0
	movs r0, #0x44
	strb r0, [r1]
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x88
	str r0, [sp]
	ldrh r0, [r1, #4]
	adds r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	bl SpriteSpawnSecondary
	ldr r0, _0801B794 @ =gSaXData
	strb r4, [r0, #4]
	movs r0, #3
	bl SetSA_XPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B790: .4byte gCurrentSprite
_0801B794: .4byte gSaXData

	thumb_func_start SA_XOmegaShootingOmega
SA_XOmegaShootingOmega: @ 0x0801B798
	push {lr}
	ldr r0, _0801B7B0 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801B7AA
	ldr r0, _0801B7B4 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x45
	strb r1, [r0]
_0801B7AA:
	pop {r0}
	bx r0
	.align 2, 0
_0801B7B0: .4byte gSaXData
_0801B7B4: .4byte gCurrentSprite

	thumb_func_start SA_XOmegaAfterShootingOmegaInit
SA_XOmegaAfterShootingOmegaInit: @ 0x0801B7B8
	push {lr}
	ldr r3, _0801B7E0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x32
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	ldr r0, _0801B7E4 @ =0x0000FF88
	strh r0, [r3, #0xa]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_0801B7E0: .4byte gCurrentSprite
_0801B7E4: .4byte 0x0000FF88

	thumb_func_start SA_XOmegaAfterShootingOmega
SA_XOmegaAfterShootingOmega: @ 0x0801B7E8
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r5, _0801B81C @ =gCurrentSprite
	adds r6, r5, #0
	adds r6, #0x31
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801B870
	cmp r0, #0x1a
	bne _0801B824
	ldr r1, _0801B820 @ =gSaXData
	ldrb r0, [r1, #1]
	cmp r0, #2
	bne _0801B8B0
	movs r4, #0
	strb r4, [r1, #3]
	movs r0, #0
	bl SetSA_XPose
	adds r0, r5, #0
	adds r0, #0x30
	strb r4, [r0]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	b _0801B8B0
	.align 2, 0
_0801B81C: .4byte gCurrentSprite
_0801B820: .4byte gSaXData
_0801B824:
	ldr r0, _0801B868 @ =0x082E6BCC
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _0801B844
	adds r0, #1
	strb r0, [r4]
_0801B844:
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B8B0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #7
	strb r0, [r1]
	ldr r1, _0801B86C @ =gSaXData
	movs r0, #1
	strb r0, [r1, #3]
	movs r0, #2
	bl SetSA_XPose
	b _0801B8B0
	.align 2, 0
_0801B868: .4byte 0x082E6BCC
_0801B86C: .4byte gSaXData
_0801B870:
	adds r1, r5, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0801B8B0
	movs r0, #0x28
	strb r0, [r1]
	ldrb r2, [r5, #0x1f]
	adds r0, r5, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0x88
	str r0, [sp]
	ldrh r0, [r5, #4]
	adds r0, #0x44
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #0
	movs r1, #1
	bl SpriteSpawnSecondary
	ldr r0, _0801B8B8 @ =gSaXData
	strb r4, [r0, #4]
	movs r0, #3
	bl SetSA_XPose
_0801B8B0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B8B8: .4byte gSaXData

	thumb_func_start SA_XOmegaHitByOmegaInit
SA_XOmegaHitByOmegaInit: @ 0x0801B8BC
	push {lr}
	ldr r3, _0801B8E0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x48
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r2, [r0]
	adds r0, #3
	strb r2, [r0]
	movs r0, #8
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_0801B8E0: .4byte gCurrentSprite

	thumb_func_start SA_XOmegaHitByOmega
SA_XOmegaHitByOmega: @ 0x0801B8E4
	push {r4, r5, lr}
	ldr r2, _0801B90C @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r2
	mov ip, r0
	ldrb r3, [r0]
	ldr r1, _0801B910 @ =0x082E6CD2
	lsls r0, r3, #1
	adds r0, r0, r1
	ldrh r4, [r0]
	movs r5, #0
	ldrsh r1, [r0, r5]
	ldr r0, _0801B914 @ =0x00007FFF
	cmp r1, r0
	bne _0801B918
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x49
	strb r0, [r1]
	b _0801B924
	.align 2, 0
_0801B90C: .4byte gCurrentSprite
_0801B910: .4byte 0x082E6CD2
_0801B914: .4byte 0x00007FFF
_0801B918:
	adds r0, r3, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r2, #2]
	adds r0, r0, r4
	strh r0, [r2, #2]
_0801B924:
	ldrh r0, [r2, #4]
	subs r0, #0x10
	strh r0, [r2, #4]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start SA_XOmegaRevertingToXInit
SA_XOmegaRevertingToXInit: @ 0x0801B930
	push {lr}
	ldr r1, _0801B954 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x4a
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x2c
	strb r0, [r1]
	ldr r1, _0801B958 @ =gSaXData
	movs r0, #1
	strb r0, [r1, #6]
	movs r0, #0x6a
	bl EventCheckAdvance
	pop {r0}
	bx r0
	.align 2, 0
_0801B954: .4byte gCurrentSprite
_0801B958: .4byte gSaXData

	thumb_func_start SA_XOmegaRevertingToX
SA_XOmegaRevertingToX: @ 0x0801B95C
	push {lr}
	ldr r2, _0801B994 @ =gWrittenToMosaic_H
	ldr r1, _0801B998 @ =sXParasiteMosaicValues
	ldr r0, _0801B99C @ =gCurrentSprite
	mov ip, r0
	mov r3, ip
	adds r3, #0x2e
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801B98E
	mov r0, ip
	adds r0, #0x24
	movs r1, #0x59
	strb r1, [r0]
	movs r0, #0x4d
	mov r1, ip
	strb r0, [r1, #0x1d]
_0801B98E:
	pop {r0}
	bx r0
	.align 2, 0
_0801B994: .4byte gWrittenToMosaic_H
_0801B998: .4byte sXParasiteMosaicValues
_0801B99C: .4byte gCurrentSprite

	thumb_func_start SA_XOmega
SA_XOmega: @ 0x0801B9A0
	push {lr}
	ldr r0, _0801B9C4 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	subs r0, #7
	cmp r0, #0x53
	bls _0801B9B8
	b _0801BB76
_0801B9B8:
	lsls r0, r0, #2
	ldr r1, _0801B9C8 @ =_0801B9CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801B9C4: .4byte gCurrentSprite
_0801B9C8: .4byte _0801B9CC
_0801B9CC: @ jump table
	.4byte _0801BB32 @ case 0
	.4byte _0801BB36 @ case 1
	.4byte _0801BB76 @ case 2
	.4byte _0801BB76 @ case 3
	.4byte _0801BB76 @ case 4
	.4byte _0801BB76 @ case 5
	.4byte _0801BB76 @ case 6
	.4byte _0801BB76 @ case 7
	.4byte _0801BB76 @ case 8
	.4byte _0801BB76 @ case 9
	.4byte _0801BB76 @ case 10
	.4byte _0801BB76 @ case 11
	.4byte _0801BB76 @ case 12
	.4byte _0801BB76 @ case 13
	.4byte _0801BB28 @ case 14
	.4byte _0801BB2C @ case 15
	.4byte _0801BB76 @ case 16
	.4byte _0801BB76 @ case 17
	.4byte _0801BB76 @ case 18
	.4byte _0801BB76 @ case 19
	.4byte _0801BB76 @ case 20
	.4byte _0801BB76 @ case 21
	.4byte _0801BB76 @ case 22
	.4byte _0801BB76 @ case 23
	.4byte _0801BB76 @ case 24
	.4byte _0801BB76 @ case 25
	.4byte _0801BB76 @ case 26
	.4byte _0801BB76 @ case 27
	.4byte _0801BB76 @ case 28
	.4byte _0801BB76 @ case 29
	.4byte _0801BB76 @ case 30
	.4byte _0801BB76 @ case 31
	.4byte _0801BB76 @ case 32
	.4byte _0801BB76 @ case 33
	.4byte _0801BB76 @ case 34
	.4byte _0801BB76 @ case 35
	.4byte _0801BB76 @ case 36
	.4byte _0801BB76 @ case 37
	.4byte _0801BB76 @ case 38
	.4byte _0801BB76 @ case 39
	.4byte _0801BB76 @ case 40
	.4byte _0801BB76 @ case 41
	.4byte _0801BB76 @ case 42
	.4byte _0801BB76 @ case 43
	.4byte _0801BB76 @ case 44
	.4byte _0801BB76 @ case 45
	.4byte _0801BB76 @ case 46
	.4byte _0801BB76 @ case 47
	.4byte _0801BB76 @ case 48
	.4byte _0801BB76 @ case 49
	.4byte _0801BB76 @ case 50
	.4byte _0801BB76 @ case 51
	.4byte _0801BB76 @ case 52
	.4byte _0801BB76 @ case 53
	.4byte _0801BB76 @ case 54
	.4byte _0801BB76 @ case 55
	.4byte _0801BB3C @ case 56
	.4byte _0801BB40 @ case 57
	.4byte _0801BB46 @ case 58
	.4byte _0801BB4A @ case 59
	.4byte _0801BB50 @ case 60
	.4byte _0801BB54 @ case 61
	.4byte _0801BB5A @ case 62
	.4byte _0801BB5E @ case 63
	.4byte _0801BB64 @ case 64
	.4byte _0801BB68 @ case 65
	.4byte _0801BB6E @ case 66
	.4byte _0801BB72 @ case 67
	.4byte _0801BB76 @ case 68
	.4byte _0801BB76 @ case 69
	.4byte _0801BB76 @ case 70
	.4byte _0801BB76 @ case 71
	.4byte _0801BB76 @ case 72
	.4byte _0801BB76 @ case 73
	.4byte _0801BB76 @ case 74
	.4byte _0801BB76 @ case 75
	.4byte _0801BB76 @ case 76
	.4byte _0801BB76 @ case 77
	.4byte _0801BB76 @ case 78
	.4byte _0801BB76 @ case 79
	.4byte _0801BB76 @ case 80
	.4byte _0801BB76 @ case 81
	.4byte _0801BB1C @ case 82
	.4byte _0801BB22 @ case 83
_0801BB1C:
	bl SA_XOmegaInit
	b _0801BB76
_0801BB22:
	bl SA_XOmegaForming
	b _0801BB76
_0801BB28:
	bl SA_XFallingInit
_0801BB2C:
	bl SA_XOmegaFalling
	b _0801BB76
_0801BB32:
	bl SA_XOmegaStandingInit
_0801BB36:
	bl SA_XOmegaStanding
	b _0801BB76
_0801BB3C:
	bl SA_XOmegaRunningInit
_0801BB40:
	bl SA_XOmegaRunning
	b _0801BB76
_0801BB46:
	bl SA_XOmegaIdleBeforeShootingOmegaInit
_0801BB4A:
	bl SA_XOmegaIdleBeforeShootingOmega
	b _0801BB76
_0801BB50:
	bl SA_XOmegaShootingOmegaInit
_0801BB54:
	bl SA_XOmegaShootingOmega
	b _0801BB76
_0801BB5A:
	bl SA_XOmegaAfterShootingOmegaInit
_0801BB5E:
	bl SA_XOmegaAfterShootingOmega
	b _0801BB76
_0801BB64:
	bl SA_XOmegaHitByOmegaInit
_0801BB68:
	bl SA_XOmegaHitByOmega
	b _0801BB76
_0801BB6E:
	bl SA_XOmegaRevertingToXInit
_0801BB72:
	bl SA_XOmegaRevertingToX
_0801BB76:
	ldr r0, _0801BB88 @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x4d
	bne _0801BB90
	ldr r1, _0801BB8C @ =gSaXData
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #6]
	b _0801BB94
	.align 2, 0
_0801BB88: .4byte gCurrentSprite
_0801BB8C: .4byte gSaXData
_0801BB90:
	bl SA_XUpdateGraphics
_0801BB94:
	pop {r0}
	bx r0

	thumb_func_start SA_XTro2WalkingCheckCollisions
SA_XTro2WalkingCheckCollisions: @ 0x0801BB98
	push {r4, r5, r6, r7, lr}
	ldr r4, _0801BBD4 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r7, #0
	strb r7, [r6]
	bl unk_1129c
	ldr r5, _0801BBD8 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	cmp r2, #0
	bne _0801BC16
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801BBE8
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BBDC
	adds r1, r4, #0
	adds r1, #0x24
	b _0801BDA8
	.align 2, 0
_0801BBD4: .4byte gCurrentSprite
_0801BBD8: .4byte gPreviousVerticalCollisionCheck
_0801BBDC:
	cmp r0, #4
	beq _0801BC08
	cmp r0, #2
	beq _0801BBE6
	b _0801BDAC
_0801BBE6:
	b _0801BC08
_0801BBE8:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BBFE
	adds r1, r4, #0
	adds r1, #0x24
	b _0801BDA8
_0801BBFE:
	cmp r0, #5
	beq _0801BC08
	cmp r0, #3
	beq _0801BC08
	b _0801BDAC
_0801BC08:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _0801BDAC
_0801BC16:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801BCFC
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _0801BC2C
	b _0801BDAC
_0801BC2C:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x2c
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801BC48 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BC4C
	movs r0, #1
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _0801BDA8
	.align 2, 0
_0801BC48: .4byte gPreviousCollisionCheck
_0801BC4C:
	ldr r0, _0801BC88 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _0801BCAA
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	adds r1, #0x80
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BC8C
	ldrh r1, [r4, #4]
	movs r0, #0x84
	lsls r0, r0, #3
	cmp r1, r0
	bhi _0801BC72
	b _0801BDAC
_0801BC72:
	strh r7, [r4]
	movs r0, #0x3c
	movs r1, #6
	movs r2, #0
	bl unk_372c
	movs r0, #0x4d
	bl EventCheckAdvance
	b _0801BDAC
	.align 2, 0
_0801BC88: .4byte gCurrentRoom
_0801BC8C:
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	adds r1, #0x50
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0801BCA0
	b _0801BDAC
_0801BCA0:
	movs r0, #2
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _0801BDA8
_0801BCAA:
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	adds r1, #0x64
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BCE0
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x64
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BCD6
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	b _0801BDAA
_0801BCD6:
	movs r0, #2
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _0801BDA8
_0801BCE0:
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	adds r1, #0x50
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BDAC
	movs r0, #2
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _0801BDA8
_0801BCFC:
	movs r5, #0xf0
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _0801BDAC
	ldr r0, _0801BD2C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _0801BD34
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x2c
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801BD30 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0801BD54
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	b _0801BDAA
	.align 2, 0
_0801BD2C: .4byte gCurrentRoom
_0801BD30: .4byte gPreviousCollisionCheck
_0801BD34:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x2c
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801BD50 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801BD54
	movs r0, #1
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _0801BDA8
	.align 2, 0
_0801BD50: .4byte gPreviousCollisionCheck
_0801BD54:
	ldr r4, _0801BD84 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	subs r0, #0xa0
	ldrh r1, [r4, #4]
	subs r1, #0x64
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801BD88 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BD8C
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x64
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BD9E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x49
	b _0801BDAA
	.align 2, 0
_0801BD84: .4byte gCurrentSprite
_0801BD88: .4byte gPreviousCollisionCheck
_0801BD8C:
	ldrh r0, [r4, #2]
	subs r0, #0x60
	ldrh r1, [r4, #4]
	subs r1, #0x50
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BDAC
_0801BD9E:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	strb r0, [r1]
	subs r1, #0xb
_0801BDA8:
	movs r0, #0x37
_0801BDAA:
	strb r0, [r1]
_0801BDAC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SA_XTro2RunningCheckCollisions
SA_XTro2RunningCheckCollisions: @ 0x0801BDB4
	push {r4, r5, r6, lr}
	ldr r4, _0801BDF0 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl unk_1129c
	ldr r5, _0801BDF4 @ =gPreviousVerticalCollisionCheck
	ldrb r2, [r5]
	cmp r2, #0
	bne _0801BE32
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801BE04
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BDF8
	adds r1, r4, #0
	adds r1, #0x24
	b _0801C0DE
	.align 2, 0
_0801BDF0: .4byte gCurrentSprite
_0801BDF4: .4byte gPreviousVerticalCollisionCheck
_0801BDF8:
	cmp r0, #4
	beq _0801BE24
	cmp r0, #2
	beq _0801BE02
	b _0801C0E2
_0801BE02:
	b _0801BE24
_0801BE04:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x10
	bl SpriteUtilCheckVerticalCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BE1A
	adds r1, r4, #0
	adds r1, #0x24
	b _0801C0DE
_0801BE1A:
	cmp r0, #5
	beq _0801BE24
	cmp r0, #3
	beq _0801BE24
	b _0801C0E2
_0801BE24:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPosition
	strh r0, [r4, #2]
	b _0801C0E2
_0801BE32:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0801BE40
	b _0801BF56
_0801BE40:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _0801BE4A
	b _0801C0E2
_0801BE4A:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801BE74 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BE7E
	ldrh r0, [r4, #2]
	subs r0, #0x90
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BE78
	movs r0, #1
	b _0801BE7A
	.align 2, 0
_0801BE74: .4byte gPreviousCollisionCheck
_0801BE78:
	movs r0, #4
_0801BE7A:
	strb r0, [r6]
	b _0801BFF8
_0801BE7E:
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BF38
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BEF6
	ldrh r0, [r4, #2]
	ldr r1, _0801BEDC @ =0xFFFFFE98
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BEEC
	ldrh r0, [r4, #2]
	ldr r1, _0801BEE0 @ =0xFFFFFE34
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	adds r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BEE4
	movs r0, #3
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #8
	b _0801C0E0
	.align 2, 0
_0801BEDC: .4byte 0xFFFFFE98
_0801BEE0: .4byte 0xFFFFFE34
_0801BEE4:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801C0E0
_0801BEEC:
	movs r0, #2
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _0801C0DE
_0801BEF6:
	ldrh r0, [r4, #2]
	ldr r1, _0801BF10 @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BF14
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0801C0E0
	.align 2, 0
_0801BF10: .4byte 0xFFFFFEFC
_0801BF14:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801BF2E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0801C0E0
_0801BF2E:
	movs r0, #2
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _0801C0DE
_0801BF38:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	adds r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0801BF4C
	b _0801C0E2
_0801BF4C:
	movs r0, #1
	strb r0, [r6]
	adds r1, r4, #0
	adds r1, #0x24
	b _0801C0DE
_0801BF56:
	movs r0, #0xf0
	ands r0, r2
	cmp r0, #0
	bne _0801BF60
	b _0801C0E2
_0801BF60:
	ldr r0, _0801BFA8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _0801BFB8
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801BFAC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801BFB8
	ldrh r0, [r4, #2]
	ldr r1, _0801BFB0 @ =0xFFFFFEE0
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0xa0
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801BFB8
	ldr r2, _0801BFB4 @ =gSaXVision
	ldrb r0, [r2, #4]
	cmp r0, #0
	bne _0801BFB8
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x2d
	strb r1, [r0]
	ldrb r0, [r2]
	strb r0, [r6]
	b _0801C0E2
	.align 2, 0
_0801BFA8: .4byte gCurrentRoom
_0801BFAC: .4byte gPreviousCollisionCheck
_0801BFB0: .4byte 0xFFFFFEE0
_0801BFB4: .4byte gSaXVision
_0801BFB8:
	ldr r4, _0801BFE8 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801BFEC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801C008
	ldrh r0, [r4, #2]
	subs r0, #0x90
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801BFF0
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	b _0801BFF6
	.align 2, 0
_0801BFE8: .4byte gCurrentSprite
_0801BFEC: .4byte gPreviousCollisionCheck
_0801BFF0:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #4
_0801BFF6:
	strb r0, [r1]
_0801BFF8:
	ldr r0, _0801C004 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x37
	strb r1, [r0]
	b _0801C0E2
	.align 2, 0
_0801C004: .4byte gCurrentSprite
_0801C008:
	ldrh r0, [r4, #2]
	subs r0, #0x50
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801C0C2
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801C080
	ldrh r0, [r4, #2]
	ldr r1, _0801C068 @ =0xFFFFFE98
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801C078
	ldrh r0, [r4, #2]
	ldr r1, _0801C06C @ =0xFFFFFE34
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	subs r1, #0x78
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801C070
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #3
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0x37
	strb r0, [r1]
	adds r1, #0xc
	movs r0, #8
	b _0801C0E0
	.align 2, 0
_0801C068: .4byte 0xFFFFFE98
_0801C06C: .4byte 0xFFFFFE34
_0801C070:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x39
	b _0801C0E0
_0801C078:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	b _0801C0DA
_0801C080:
	ldrh r0, [r4, #2]
	ldr r1, _0801C09C @ =0xFFFFFEFC
	adds r0, r0, r1
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801C0A0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0801C0E0
	.align 2, 0
_0801C09C: .4byte 0xFFFFFEFC
_0801C0A0:
	ldrh r0, [r4, #2]
	subs r0, #0xe0
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801C0BA
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3b
	b _0801C0E0
_0801C0BA:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #2
	b _0801C0DA
_0801C0C2:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	ldrh r1, [r4, #4]
	subs r1, #0x3c
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801C0E2
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
_0801C0DA:
	strb r0, [r1]
	subs r1, #0xb
_0801C0DE:
	movs r0, #0x37
_0801C0E0:
	strb r0, [r1]
_0801C0E2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SA_XTro2Init
SA_XTro2Init: @ 0x0801C0E8
	push {r4, lr}
	bl EventCheckOn_NavAfterYakuza
	cmp r0, #0
	beq _0801C120
	bl SA_XInit
	ldr r4, _0801C118 @ =gCurrentSprite
	ldrh r1, [r4]
	ldr r0, _0801C11C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	bl SA_XSetDirection
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	adds r4, #0x24
	movs r0, #1
	strb r0, [r4]
	bl SetSA_XPose
	b _0801C1B2
	.align 2, 0
_0801C118: .4byte gCurrentSprite
_0801C11C: .4byte 0x0000FDFF
_0801C120:
	bl EventCheckOn_EngagedSaXTro2
	adds r1, r0, #0
	cmp r1, #0
	beq _0801C1AE
	ldr r4, _0801C14C @ =gCurrentSprite
	ldr r1, _0801C150 @ =gSaXSpawnPosition
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	ldrh r0, [r1]
	strh r0, [r4, #4]
	bl SA_XInit
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C154
	ldrh r0, [r4, #4]
	subs r0, #0x48
	b _0801C158
	.align 2, 0
_0801C14C: .4byte gCurrentSprite
_0801C150: .4byte gSaXSpawnPosition
_0801C154:
	ldrh r0, [r4, #4]
	adds r0, #0x48
_0801C158:
	strh r0, [r4, #4]
	ldr r2, _0801C190 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x25
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0801C194 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _0801C198
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0xc8
	strb r0, [r1]
	movs r0, #1
	bl SetSA_XPose
	b _0801C1B2
	.align 2, 0
_0801C190: .4byte gCurrentSprite
_0801C194: .4byte gCurrentRoom
_0801C198:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1b
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0
	bl SetSA_XPose
	b _0801C1B2
_0801C1AE:
	ldr r0, _0801C1B8 @ =gCurrentSprite
	strh r1, [r0]
_0801C1B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C1B8: .4byte gCurrentSprite

	thumb_func_start SA_XTro2WaitingInDoorDuringChase
SA_XTro2WaitingInDoorDuringChase: @ 0x0801C1BC
	push {r4, lr}
	ldr r4, _0801C1F4 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C1EC
	bl SA_XRunningStart
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _0801C1F8 @ =0x0000DFFF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0801C1EC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C1F4: .4byte gCurrentSprite
_0801C1F8: .4byte 0x0000DFFF

	thumb_func_start SA_XTro2WaitingInDoorAtEnd
SA_XTro2WaitingInDoorAtEnd: @ 0x0801C1FC
	push {r4, lr}
	ldr r4, _0801C230 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C228
	bl SA_XWalkingInit
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _0801C234 @ =0x0000DFFF
	ands r0, r1
	ldr r1, _0801C238 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r4]
_0801C228:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C230: .4byte gCurrentSprite
_0801C234: .4byte 0x0000DFFF
_0801C238: .4byte 0x0000FBFF

	thumb_func_start SA_XTro2Walking
SA_XTro2Walking: @ 0x0801C23C
	push {r4, lr}
	bl unk_15e88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C2B2
	bl SA_XTro2WalkingCheckCollisions
	ldr r1, _0801C278 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	ldrb r0, [r2]
	cmp r0, #2
	bne _0801C2B2
	ldr r0, _0801C27C @ =gSamusData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0801C290
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C284
	ldr r0, _0801C280 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0801C290
	b _0801C28C
	.align 2, 0
_0801C278: .4byte gCurrentSprite
_0801C27C: .4byte gSamusData
_0801C280: .4byte gSaXVision
_0801C284:
	ldr r0, _0801C2B8 @ =gSaXVision
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _0801C290
_0801C28C:
	movs r0, #0x4d
	strb r0, [r2]
_0801C290:
	ldr r1, _0801C2BC @ =0x082E6BBC
	ldr r0, _0801C2C0 @ =gCurrentSprite
	adds r4, r0, #0
	adds r4, #0x30
	ldrb r0, [r4]
	lsrs r0, r0, #3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _0801C2B2
	adds r0, #1
	strb r0, [r4]
_0801C2B2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C2B8: .4byte gSaXVision
_0801C2BC: .4byte 0x082E6BBC
_0801C2C0: .4byte gCurrentSprite

	thumb_func_start SA_XTro2StoppedAtDoorInit
SA_XTro2StoppedAtDoorInit: @ 0x0801C2C4
	push {lr}
	ldr r2, _0801C2E4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x5a
	strb r0, [r1]
	ldr r0, _0801C2E8 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_0801C2E4: .4byte gCurrentSprite
_0801C2E8: .4byte 0x0000FF88

	thumb_func_start SA_XTro2StoppedAtDoor
SA_XTro2StoppedAtDoor: @ 0x0801C2EC
	push {r4, r5, lr}
	bl unk_15e88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C354
	ldr r0, _0801C35C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _0801C336
	ldr r4, _0801C360 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0801C336
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r0, #0xc0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #4
	bne _0801C336
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	strh r5, [r4, #6]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x17
	strb r0, [r1]
_0801C336:
	ldr r1, _0801C360 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	ldrb r0, [r2]
	cmp r0, #0x4a
	bne _0801C354
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C354
	movs r0, #3
	strb r0, [r2]
_0801C354:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801C35C: .4byte gCurrentRoom
_0801C360: .4byte gCurrentSprite

	thumb_func_start SA_XTro2IdleAfterHearingWeaponInit
SA_XTro2IdleAfterHearingWeaponInit: @ 0x0801C364
	push {lr}
	ldr r2, _0801C384 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4c
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x5a
	strb r0, [r1]
	ldr r0, _0801C388 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_0801C384: .4byte gCurrentSprite
_0801C388: .4byte 0x0000FF88

	thumb_func_start SA_XTro2IdleAfterHearingWeapon
SA_XTro2IdleAfterHearingWeapon: @ 0x0801C38C
	push {lr}
	ldr r1, _0801C3AC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C3A6
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0801C3A6:
	pop {r0}
	bx r0
	.align 2, 0
_0801C3AC: .4byte gCurrentSprite

	thumb_func_start SA_XTro2TurningAfterHearingWeaponInit
SA_XTro2TurningAfterHearingWeaponInit: @ 0x0801C3B0
	push {lr}
	ldr r2, _0801C3CC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4e
	strb r0, [r1]
	ldr r0, _0801C3D0 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_0801C3CC: .4byte gCurrentSprite
_0801C3D0: .4byte 0x0000FF88

	thumb_func_start SA_XTro2TurningAfterHearingWeapon
SA_XTro2TurningAfterHearingWeapon: @ 0x0801C3D4
	push {lr}
	bl unk_1129c
	ldr r0, _0801C3EC @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801C3F4
	ldr r0, _0801C3F0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0801C416
	.align 2, 0
_0801C3EC: .4byte gPreviousVerticalCollisionCheck
_0801C3F0: .4byte gCurrentSprite
_0801C3F4:
	ldr r0, _0801C41C @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801C416
	ldr r2, _0801C420 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4b
	strb r0, [r1]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	bl SA_XSetDirection
_0801C416:
	pop {r0}
	bx r0
	.align 2, 0
_0801C41C: .4byte gSaXData
_0801C420: .4byte gCurrentSprite

	thumb_func_start SA_XTro2Running
SA_XTro2Running: @ 0x0801C424
	push {r4, lr}
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C460
	bl SA_XTro2RunningCheckCollisions
	ldr r1, _0801C468 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x18
	bne _0801C460
	ldr r0, _0801C46C @ =0x082E6BCC
	adds r4, r1, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsrs r1, r1, #3
	lsls r1, r1, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	bl unk_11604
	ldrb r0, [r4]
	cmp r0, #0x3e
	bhi _0801C460
	adds r0, #1
	strb r0, [r4]
_0801C460:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C468: .4byte gCurrentSprite
_0801C46C: .4byte 0x082E6BCC

	thumb_func_start SA_XTro2TurningDuringChase
SA_XTro2TurningDuringChase: @ 0x0801C470
	push {r4, lr}
	bl unk_1129c
	ldr r0, _0801C488 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801C490
	ldr r0, _0801C48C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0801C4B0
	.align 2, 0
_0801C488: .4byte gPreviousVerticalCollisionCheck
_0801C48C: .4byte gCurrentSprite
_0801C490:
	ldr r0, _0801C4B8 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801C4B0
	ldr r4, _0801C4BC @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	bl SA_XSetDirection
	adds r4, #0x24
	movs r0, #0x17
	strb r0, [r4]
_0801C4B0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C4B8: .4byte gSaXData
_0801C4BC: .4byte gCurrentSprite

	thumb_func_start SA_XTro2IdleBeforeShootingBeamInit
SA_XTro2IdleBeforeShootingBeamInit: @ 0x0801C4C0
	push {lr}
	ldr r2, _0801C500 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x2e
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x20
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	cmp r1, #0
	beq _0801C4E6
	cmp r1, #1
	beq _0801C4E6
	cmp r1, #2
	bne _0801C4EA
_0801C4E6:
	ldr r0, _0801C504 @ =gSaXData
	strb r1, [r0, #3]
_0801C4EA:
	ldrh r1, [r2]
	ldr r0, _0801C508 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	bl SA_XSetDirection
	movs r0, #2
	bl SetSA_XPose
	pop {r0}
	bx r0
	.align 2, 0
_0801C500: .4byte gCurrentSprite
_0801C504: .4byte gSaXData
_0801C508: .4byte 0x0000FDFF

	thumb_func_start SA_XTro2IdleBeforeShootingBeam
SA_XTro2IdleBeforeShootingBeam: @ 0x0801C50C
	push {lr}
	bl unk_1129c
	ldr r0, _0801C524 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801C52C
	ldr r0, _0801C528 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	strb r1, [r0]
	b _0801C544
	.align 2, 0
_0801C524: .4byte gPreviousVerticalCollisionCheck
_0801C528: .4byte gCurrentSprite
_0801C52C:
	ldr r1, _0801C548 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C544
	adds r1, #0x24
	movs r0, #0x2f
	strb r0, [r1]
_0801C544:
	pop {r0}
	bx r0
	.align 2, 0
_0801C548: .4byte gCurrentSprite

	thumb_func_start SA_XTro2ShootingBeamInit
SA_XTro2ShootingBeamInit: @ 0x0801C54C
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0801C58C @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r4, #0
	movs r0, #0x30
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801C590
	mov r1, ip
	ldrb r2, [r1, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r1, #2]
	subs r0, #0x50
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0801C5DA
	.align 2, 0
_0801C58C: .4byte gCurrentSprite
_0801C590:
	cmp r0, #1
	bne _0801C5B6
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x88
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0801C5DA
_0801C5B6:
	cmp r0, #2
	bne _0801C5DA
	mov r0, ip
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r1, ip
	ldrh r0, [r1, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r1, #4]
	subs r0, #0x44
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0
	movs r1, #2
	bl SpriteSpawnSecondary
_0801C5DA:
	ldr r1, _0801C5F0 @ =gSaXData
	movs r0, #0
	strb r0, [r1, #4]
	movs r0, #3
	bl SetSA_XPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C5F0: .4byte gSaXData

	thumb_func_start SA_XTro2ShootingBeam
SA_XTro2ShootingBeam: @ 0x0801C5F4
	push {lr}
	bl unk_1129c
	ldr r0, _0801C60C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801C614
	ldr r0, _0801C610 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _0801C656
	.align 2, 0
_0801C60C: .4byte gPreviousVerticalCollisionCheck
_0801C610: .4byte gCurrentSprite
_0801C614:
	ldr r0, _0801C640 @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #2
	bne _0801C658
	ldr r0, _0801C644 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801C650
	ldr r3, _0801C648 @ =gSaXVision
	ldrb r0, [r3, #4]
	cmp r0, #0
	bne _0801C650
	ldr r1, _0801C64C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x2d
	strb r0, [r2]
	ldrb r0, [r3]
	adds r1, #0x2f
	strb r0, [r1]
	b _0801C658
	.align 2, 0
_0801C640: .4byte gSaXData
_0801C644: .4byte gPreviousCollisionCheck
_0801C648: .4byte gSaXVision
_0801C64C: .4byte gCurrentSprite
_0801C650:
	ldr r0, _0801C65C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x39
_0801C656:
	strb r1, [r0]
_0801C658:
	pop {r0}
	bx r0
	.align 2, 0
_0801C65C: .4byte gCurrentSprite

	thumb_func_start SA_XTro2
SA_XTro2: @ 0x0801C660
	push {lr}
	bl SA_XUpdateFreezeTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C66E
	b _0801C8CA
_0801C66E:
	bl SA_XSeeAndLocateSamus
	ldr r0, _0801C688 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x4e
	bls _0801C67E
	b _0801C888
_0801C67E:
	lsls r0, r0, #2
	ldr r1, _0801C68C @ =_0801C690
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C688: .4byte gCurrentSprite
_0801C68C: .4byte _0801C690
_0801C690: @ jump table
	.4byte _0801C7CC @ case 0
	.4byte _0801C7D2 @ case 1
	.4byte _0801C7D8 @ case 2
	.4byte _0801C830 @ case 3
	.4byte _0801C834 @ case 4
	.4byte _0801C888 @ case 5
	.4byte _0801C888 @ case 6
	.4byte _0801C844 @ case 7
	.4byte _0801C848 @ case 8
	.4byte _0801C888 @ case 9
	.4byte _0801C888 @ case 10
	.4byte _0801C888 @ case 11
	.4byte _0801C888 @ case 12
	.4byte _0801C888 @ case 13
	.4byte _0801C888 @ case 14
	.4byte _0801C888 @ case 15
	.4byte _0801C888 @ case 16
	.4byte _0801C888 @ case 17
	.4byte _0801C888 @ case 18
	.4byte _0801C888 @ case 19
	.4byte _0801C888 @ case 20
	.4byte _0801C83A @ case 21
	.4byte _0801C83E @ case 22
	.4byte _0801C808 @ case 23
	.4byte _0801C80C @ case 24
	.4byte _0801C888 @ case 25
	.4byte _0801C888 @ case 26
	.4byte _0801C7FC @ case 27
	.4byte _0801C802 @ case 28
	.4byte _0801C888 @ case 29
	.4byte _0801C888 @ case 30
	.4byte _0801C888 @ case 31
	.4byte _0801C888 @ case 32
	.4byte _0801C888 @ case 33
	.4byte _0801C888 @ case 34
	.4byte _0801C888 @ case 35
	.4byte _0801C888 @ case 36
	.4byte _0801C888 @ case 37
	.4byte _0801C888 @ case 38
	.4byte _0801C888 @ case 39
	.4byte _0801C888 @ case 40
	.4byte _0801C84E @ case 41
	.4byte _0801C852 @ case 42
	.4byte _0801C858 @ case 43
	.4byte _0801C85C @ case 44
	.4byte _0801C81C @ case 45
	.4byte _0801C820 @ case 46
	.4byte _0801C826 @ case 47
	.4byte _0801C82A @ case 48
	.4byte _0801C888 @ case 49
	.4byte _0801C888 @ case 50
	.4byte _0801C888 @ case 51
	.4byte _0801C888 @ case 52
	.4byte _0801C888 @ case 53
	.4byte _0801C888 @ case 54
	.4byte _0801C862 @ case 55
	.4byte _0801C866 @ case 56
	.4byte _0801C812 @ case 57
	.4byte _0801C816 @ case 58
	.4byte _0801C86C @ case 59
	.4byte _0801C870 @ case 60
	.4byte _0801C876 @ case 61
	.4byte _0801C87A @ case 62
	.4byte _0801C880 @ case 63
	.4byte _0801C884 @ case 64
	.4byte _0801C888 @ case 65
	.4byte _0801C888 @ case 66
	.4byte _0801C888 @ case 67
	.4byte _0801C888 @ case 68
	.4byte _0801C888 @ case 69
	.4byte _0801C888 @ case 70
	.4byte _0801C888 @ case 71
	.4byte _0801C888 @ case 72
	.4byte _0801C7DE @ case 73
	.4byte _0801C7E2 @ case 74
	.4byte _0801C7E8 @ case 75
	.4byte _0801C7EC @ case 76
	.4byte _0801C7F2 @ case 77
	.4byte _0801C7F6 @ case 78
_0801C7CC:
	bl SA_XTro2Init
	b _0801C888
_0801C7D2:
	bl SA_XWalkingInit
	b _0801C888
_0801C7D8:
	bl SA_XTro2Walking
	b _0801C888
_0801C7DE:
	bl SA_XTro2StoppedAtDoorInit
_0801C7E2:
	bl SA_XTro2StoppedAtDoor
	b _0801C888
_0801C7E8:
	bl SA_XTro2IdleAfterHearingWeaponInit
_0801C7EC:
	bl SA_XTro2IdleAfterHearingWeapon
	b _0801C888
_0801C7F2:
	bl SA_XTro2TurningAfterHearingWeaponInit
_0801C7F6:
	bl SA_XTro2TurningAfterHearingWeapon
	b _0801C888
_0801C7FC:
	bl SA_XTro2WaitingInDoorDuringChase
	b _0801C888
_0801C802:
	bl SA_XTro2WaitingInDoorAtEnd
	b _0801C888
_0801C808:
	bl SA_XRunningStart
_0801C80C:
	bl SA_XTro2Running
	b _0801C888
_0801C812:
	bl SA_XTurningChaseStartInit
_0801C816:
	bl SA_XTro2TurningDuringChase
	b _0801C888
_0801C81C:
	bl SA_XTro2IdleBeforeShootingBeamInit
_0801C820:
	bl SA_XTro2IdleBeforeShootingBeam
	b _0801C888
_0801C826:
	bl SA_XTro2ShootingBeamInit
_0801C82A:
	bl SA_XTro2ShootingBeam
	b _0801C888
_0801C830:
	bl SA_XTurningInit
_0801C834:
	bl SA_XTurning
	b _0801C888
_0801C83A:
	bl SA_XFallingInit
_0801C83E:
	bl SA_XFalling
	b _0801C888
_0801C844:
	bl SA_XStandingInit
_0801C848:
	bl SA_XStanding
	b _0801C888
_0801C84E:
	bl SA_XDelayBeforeShootingBeamInit
_0801C852:
	bl SA_XDelayBeforeShootingBeam
	b _0801C888
_0801C858:
	bl SA_XShootingBeamInit
_0801C85C:
	bl SA_XShootingBeam
	b _0801C888
_0801C862:
	bl SA_XMidAirInit
_0801C866:
	bl SA_XMidAir
	b _0801C888
_0801C86C:
	bl SA_XMorphingInit
_0801C870:
	bl SA_XMorphing
	b _0801C888
_0801C876:
	bl SA_XRollingInit
_0801C87A:
	bl SA_XRolling
	b _0801C888
_0801C880:
	bl SA_XUnmorphingInit
_0801C884:
	bl SA_XUnmorphing
_0801C888:
	ldr r0, _0801C89C @ =gSaXData
	ldrb r0, [r0, #1]
	cmp r0, #5
	bne _0801C8A4
	ldr r0, _0801C8A0 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0x40
	orrs r1, r2
	b _0801C8AE
	.align 2, 0
_0801C89C: .4byte gSaXData
_0801C8A0: .4byte gCurrentSprite
_0801C8A4:
	ldr r0, _0801C8D0 @ =gCurrentSprite
	adds r0, #0x34
	ldrb r2, [r0]
	movs r1, #0xbf
	ands r1, r2
_0801C8AE:
	strb r1, [r0]
	bl SA_XUpdateGraphics
	ldr r0, _0801C8D0 @ =gCurrentSprite
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0801C8CA
	movs r0, #0x17
	movs r1, #9
	bl PlayMusic
_0801C8CA:
	pop {r0}
	bx r0
	.align 2, 0
_0801C8D0: .4byte gCurrentSprite

	thumb_func_start HornoadCheckSamusInSpittingRange
HornoadCheckSamusInSpittingRange: @ 0x0801C8D4
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0801C8EC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _0801C8F0
	movs r0, #0
	b _0801C922
	.align 2, 0
_0801C8EC: .4byte gCurrentSprite
_0801C8F0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C920
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _0801C920
	movs r1, #0x96
	lsls r1, r1, #1
	movs r0, #0x78
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801C91A
	cmp r2, #8
	bne _0801C920
	b _0801C91E
_0801C91A:
	cmp r2, #4
	bne _0801C920
_0801C91E:
	movs r5, #1
_0801C920:
	adds r0, r5, #0
_0801C922:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start HornoadCheckSamusInJumpingRange
HornoadCheckSamusInJumpingRange: @ 0x0801C928
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0801C94C @ =gCurrentSprite
	ldrh r2, [r4]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r2
	cmp r0, #0
	bne _0801C948
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801C950
_0801C948:
	movs r0, #0
	b _0801C9E0
	.align 2, 0
_0801C94C: .4byte gCurrentSprite
_0801C950:
	movs r3, #0x8c
	movs r1, #0xfa
	lsls r1, r1, #1
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r2
	cmp r0, #0
	beq _0801C96A
	adds r1, #0xc8
	adds r3, #0xc8
	ldr r0, _0801C990 @ =0x0000FBFF
	ands r0, r2
	strh r0, [r4]
_0801C96A:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _0801C9DE
	adds r0, r3, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	adds r2, r0, #0
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801C9A2
	cmp r2, #8
	bne _0801C994
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	adds r1, #0x48
	b _0801C9AE
	.align 2, 0
_0801C990: .4byte 0x0000FBFF
_0801C994:
	cmp r2, #4
	bne _0801C9DE
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	subs r1, #0x48
	b _0801C9D0
_0801C9A2:
	cmp r2, #4
	bne _0801C9C4
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	subs r1, #0x48
_0801C9AE:
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801C9C0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0801C9DE
	movs r5, #1
	b _0801C9DE
	.align 2, 0
_0801C9C0: .4byte gPreviousCollisionCheck
_0801C9C4:
	cmp r2, #8
	bne _0801C9DE
	ldrh r0, [r4, #2]
	subs r0, #0x80
	ldrh r1, [r4, #4]
	adds r1, #0x48
_0801C9D0:
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801C9E8 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	beq _0801C9DE
	movs r5, #2
_0801C9DE:
	adds r0, r5, #0
_0801C9E0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801C9E8: .4byte gPreviousCollisionCheck

	thumb_func_start HornoadSetSidesHitboxes
HornoadSetSidesHitboxes: @ 0x0801C9EC
	push {lr}
	ldr r2, _0801CA04 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801CA0C
	ldr r0, _0801CA08 @ =0x0000FFE8
	strh r0, [r2, #0xe]
	movs r0, #0x30
	b _0801CA12
	.align 2, 0
_0801CA04: .4byte gCurrentSprite
_0801CA08: .4byte 0x0000FFE8
_0801CA0C:
	ldr r0, _0801CA18 @ =0x0000FFD0
	strh r0, [r2, #0xe]
	movs r0, #0x18
_0801CA12:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_0801CA18: .4byte 0x0000FFD0

	thumb_func_start HornoadInit
HornoadInit: @ 0x0801CA1C
	push {r4, r5, r6, r7, lr}
	ldr r4, _0801CA34 @ =gCurrentSprite
	ldrb r0, [r4, #0x1d]
	cmp r0, #0x76
	bne _0801CA38
	bl EventCheckOn_NavigationRoomBeforeQuarantineBay
	cmp r0, #0
	bne _0801CA38
	strh r0, [r4]
	b _0801CB2E
	.align 2, 0
_0801CA34: .4byte gCurrentSprite
_0801CA38:
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r4, _0801CAC8 @ =gCurrentSprite
	ldrh r0, [r4]
	ldr r3, _0801CACC @ =0x0000FFFB
	ands r3, r0
	movs r6, #0
	movs r2, #0
	strh r3, [r4]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r6, [r0]
	subs r0, #8
	movs r7, #0x18
	strb r7, [r0]
	adds r1, r4, #0
	adds r1, #0x28
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x14
	strb r0, [r1]
	ldr r0, _0801CAD0 @ =0x0000FFC0
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	strb r6, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldr r2, _0801CAD4 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _0801CAF0
	movs r0, #0x80
	lsls r0, r0, #8
	adds r1, r0, #0
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	subs r1, #1
	movs r0, #3
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x25
	strb r6, [r0]
	adds r0, #5
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0801CADC
	ldr r0, _0801CAD8 @ =0x082EB53C
	str r0, [r4, #0x18]
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	subs r0, #0xd
	strb r7, [r0]
	b _0801CB2A
	.align 2, 0
_0801CAC8: .4byte gCurrentSprite
_0801CACC: .4byte 0x0000FFFB
_0801CAD0: .4byte 0x0000FFC0
_0801CAD4: .4byte sPrimarySpriteStats
_0801CAD8: .4byte 0x082EB53C
_0801CADC:
	ldr r0, _0801CAEC @ =0x082EB514
	str r0, [r4, #0x18]
	bl SpriteUtilChooseRandomXFlip
	adds r0, r4, #0
	adds r0, #0x24
	strb r5, [r0]
	b _0801CB2A
	.align 2, 0
_0801CAEC: .4byte 0x082EB514
_0801CAF0:
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #1
	strb r0, [r1]
	subs r1, #0x13
	movs r0, #4
	strb r0, [r1]
	subs r1, #1
	strb r5, [r1]
	adds r1, #4
	strb r0, [r1]
	ldr r0, _0801CB24 @ =0x082EB6CC
	str r0, [r4, #0x18]
	bl SpriteUtilMakeSpriteFaceSamusXFlip
	adds r1, r4, #0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x59
	bne _0801CB28
	movs r0, #0x5a
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _0801CB2A
	.align 2, 0
_0801CB24: .4byte 0x082EB6CC
_0801CB28:
	strb r5, [r1]
_0801CB2A:
	bl HornoadSetSidesHitboxes
_0801CB2E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start HornoadIdleBeforeJumpingInit
HornoadIdleBeforeJumpingInit: @ 0x0801CB34
	push {lr}
	ldr r3, _0801CB60 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r0, #0
	movs r1, #2
	strb r1, [r2]
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
	adds r2, #0xb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0801CB68
	ldr r0, _0801CB64 @ =0x082EB514
	b _0801CB6A
	.align 2, 0
_0801CB60: .4byte gCurrentSprite
_0801CB64: .4byte 0x082EB514
_0801CB68:
	ldr r0, _0801CB70 @ =0x082EB6CC
_0801CB6A:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0801CB70: .4byte 0x082EB6CC

	thumb_func_start HornoadJumpingInit
HornoadJumpingInit: @ 0x0801CB74
	push {lr}
	ldr r3, _0801CBA0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r0, #0
	strh r2, [r3, #0x16]
	adds r1, #0xd
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CBA8
	ldr r0, _0801CBA4 @ =0x082EB53C
	str r0, [r3, #0x18]
	b _0801CBB4
	.align 2, 0
_0801CBA0: .4byte gCurrentSprite
_0801CBA4: .4byte 0x082EB53C
_0801CBA8:
	ldr r0, _0801CBCC @ =0x082EB6F4
	str r0, [r3, #0x18]
	movs r0, #0xa6
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0801CBB4:
	ldr r0, _0801CBD0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r2, #1
	adds r1, r2, #0
	ands r1, r0
	cmp r1, #0
	beq _0801CBD8
	ldr r0, _0801CBD4 @ =gCurrentSprite
	adds r0, #0x30
	strb r2, [r0]
	b _0801CBDE
	.align 2, 0
_0801CBCC: .4byte 0x082EB6F4
_0801CBD0: .4byte gSpriteRandomNumber
_0801CBD4: .4byte gCurrentSprite
_0801CBD8:
	ldr r0, _0801CBE4 @ =gCurrentSprite
	adds r0, #0x30
	strb r1, [r0]
_0801CBDE:
	pop {r0}
	bx r0
	.align 2, 0
_0801CBE4: .4byte gCurrentSprite

	thumb_func_start HornoadLandingGFXInit
HornoadLandingGFXInit: @ 0x0801CBE8
	push {lr}
	ldr r3, _0801CC0C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x1a
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CC14
	ldr r0, _0801CC10 @ =0x082EB564
	b _0801CC16
	.align 2, 0
_0801CC0C: .4byte gCurrentSprite
_0801CC10: .4byte 0x082EB564
_0801CC14:
	ldr r0, _0801CC1C @ =0x082EB71C
_0801CC16:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0801CC1C: .4byte 0x082EB71C

	thumb_func_start HornoadSetRandomIdleAnimation
HornoadSetRandomIdleAnimation: @ 0x0801CC20
	push {lr}
	ldr r3, _0801CC4C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #8
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	ldr r0, _0801CC50 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0801CC60
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CC58
	ldr r0, _0801CC54 @ =0x082EB44C
	b _0801CC9E
	.align 2, 0
_0801CC4C: .4byte gCurrentSprite
_0801CC50: .4byte gSpriteRandomNumber
_0801CC54: .4byte 0x082EB44C
_0801CC58:
	ldr r0, _0801CC5C @ =0x082EB604
	b _0801CC9E
	.align 2, 0
_0801CC5C: .4byte 0x082EB604
_0801CC60:
	cmp r0, #0xb
	bhi _0801CC84
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CC7C
	ldr r0, _0801CC78 @ =0x082EB474
	b _0801CC9E
	.align 2, 0
_0801CC78: .4byte 0x082EB474
_0801CC7C:
	ldr r0, _0801CC80 @ =0x082EB62C
	b _0801CC9E
	.align 2, 0
_0801CC80: .4byte 0x082EB62C
_0801CC84:
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CC9C
	ldr r0, _0801CC98 @ =0x082EB4BC
	b _0801CC9E
	.align 2, 0
_0801CC98: .4byte 0x082EB4BC
_0801CC9C:
	ldr r0, _0801CCA4 @ =0x082EB674
_0801CC9E:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0801CCA4: .4byte 0x082EB674

	thumb_func_start HornoadFallingInit
HornoadFallingInit: @ 0x0801CCA8
	push {lr}
	ldr r3, _0801CCD0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x16
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	adds r0, #3
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	adds r1, r3, #0
	cmp r0, #0
	beq _0801CCD8
	ldr r0, _0801CCD4 @ =0x082EB57C
	b _0801CCDA
	.align 2, 0
_0801CCD0: .4byte gCurrentSprite
_0801CCD4: .4byte 0x082EB57C
_0801CCD8:
	ldr r0, _0801CCE8 @ =0x082EB814
_0801CCDA:
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_0801CCE8: .4byte 0x082EB814

	thumb_func_start unk_1ccec
unk_1ccec: @ 0x0801CCEC
	push {r4, r5, lr}
	ldr r4, _0801CD28 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #8
	strb r0, [r1]
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	ldr r5, _0801CD2C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801CD30
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801CD30
	bl HornoadFallingInit
	b _0801CD60
	.align 2, 0
_0801CD28: .4byte gCurrentSprite
_0801CD2C: .4byte gPreviousVerticalCollisionCheck
_0801CD30:
	ldr r3, _0801CD54 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #8
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CD5C
	ldr r0, _0801CD58 @ =0x082EB594
	b _0801CD5E
	.align 2, 0
_0801CD54: .4byte gCurrentSprite
_0801CD58: .4byte 0x082EB594
_0801CD5C:
	ldr r0, _0801CD68 @ =0x082EB82C
_0801CD5E:
	str r0, [r3, #0x18]
_0801CD60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CD68: .4byte 0x082EB82C

	thumb_func_start HornoadTurningAroundInit
HornoadTurningAroundInit: @ 0x0801CD6C
	push {lr}
	ldr r3, _0801CD98 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #4
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	movs r0, #0
	strh r2, [r3, #0x16]
	adds r1, #0xb
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CDA0
	ldr r0, _0801CD9C @ =0x082EB4E4
	b _0801CDA2
	.align 2, 0
_0801CD98: .4byte gCurrentSprite
_0801CD9C: .4byte 0x082EB4E4
_0801CDA0:
	ldr r0, _0801CDA8 @ =0x082EB69C
_0801CDA2:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0801CDA8: .4byte 0x082EB69C

	thumb_func_start HornoadSpittingInit
HornoadSpittingInit: @ 0x0801CDAC
	push {lr}
	ldr r3, _0801CDD8 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r1]
	ldr r0, _0801CDDC @ =0x082EB734
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0801CDE0 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801CDE4
	adds r0, r3, #0
	adds r0, #0x30
	strb r2, [r0]
	b _0801CDEC
	.align 2, 0
_0801CDD8: .4byte gCurrentSprite
_0801CDDC: .4byte 0x082EB734
_0801CDE0: .4byte gSpriteRandomNumber
_0801CDE4:
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #2
	strb r0, [r1]
_0801CDEC:
	pop {r0}
	bx r0

	thumb_func_start HornoadIdle
HornoadIdle: @ 0x0801CDF0
	push {r4, r5, lr}
	ldr r4, _0801CE24 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801CE28 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801CE2C
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801CE2C
	bl HornoadFallingInit
	b _0801CE38
	.align 2, 0
_0801CE24: .4byte gCurrentSprite
_0801CE28: .4byte gPreviousCollisionCheck
_0801CE2C:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801CE38
	bl HornoadJumpingInit
_0801CE38:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HornoadJumping
HornoadJumping: @ 0x0801CE40
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _0801CE58 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CE60
	ldr r1, _0801CE5C @ =0x082E9256
	b _0801CE76
	.align 2, 0
_0801CE58: .4byte gCurrentSprite
_0801CE5C: .4byte 0x082E9256
_0801CE60:
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801CE74
	ldr r1, _0801CE70 @ =0x082E9256
	b _0801CE76
	.align 2, 0
_0801CE70: .4byte 0x082E9256
_0801CE74:
	ldr r1, _0801CEB8 @ =0x082E9242
_0801CE76:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsrs r0, r0, #2
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	ldr r4, _0801CEBC @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801CF12
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801CEC0 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0801CEC4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	subs r0, #4
	b _0801CF36
	.align 2, 0
_0801CEB8: .4byte 0x082E9242
_0801CEBC: .4byte gCurrentSprite
_0801CEC0: .4byte gPreviousCollisionCheck
_0801CEC4:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CEFE
	lsls r0, r5, #0x10
	adds r2, r0, #0
	cmp r2, #0
	ble _0801CEE0
	ldrh r0, [r4, #4]
	adds r0, #1
	b _0801CF8C
_0801CEE0:
	ldr r0, _0801CEF4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CEF8
	ldrh r0, [r4, #4]
	adds r0, #2
	b _0801CF8C
	.align 2, 0
_0801CEF4: .4byte gSpriteRandomNumber
_0801CEF8:
	ldrh r0, [r4, #4]
	adds r0, #1
	b _0801CF8C
_0801CEFE:
	lsls r0, r5, #0x10
	adds r2, r0, #0
	cmp r2, #0
	ble _0801CF0C
	ldrh r0, [r4, #4]
	adds r0, #2
	b _0801CF8C
_0801CF0C:
	ldrh r0, [r4, #4]
	adds r0, #3
	b _0801CF8C
_0801CF12:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801CF3C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0801CF40
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldrh r0, [r4, #4]
	adds r0, #4
_0801CF36:
	strh r0, [r4, #4]
	lsls r2, r5, #0x10
	b _0801CF8E
	.align 2, 0
_0801CF3C: .4byte gPreviousCollisionCheck
_0801CF40:
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801CF7A
	lsls r0, r5, #0x10
	adds r2, r0, #0
	cmp r2, #0
	ble _0801CF5C
	ldrh r0, [r4, #4]
	subs r0, #1
	b _0801CF8C
_0801CF5C:
	ldr r0, _0801CF70 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801CF74
	ldrh r0, [r4, #4]
	subs r0, #2
	b _0801CF8C
	.align 2, 0
_0801CF70: .4byte gSpriteRandomNumber
_0801CF74:
	ldrh r0, [r4, #4]
	subs r0, #1
	b _0801CF8C
_0801CF7A:
	lsls r0, r5, #0x10
	adds r2, r0, #0
	cmp r2, #0
	ble _0801CF88
	ldrh r0, [r4, #4]
	subs r0, #2
	b _0801CF8C
_0801CF88:
	ldrh r0, [r4, #4]
	subs r0, #3
_0801CF8C:
	strh r0, [r4, #4]
_0801CF8E:
	ldr r4, _0801CFC4 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0x26
	bhi _0801CFA4
	adds r0, #1
	strb r0, [r1]
_0801CFA4:
	cmp r2, #0
	ble _0801D010
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _0801CFC8 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801CFCC
	strh r1, [r4, #2]
	bl HornoadLandingGFXInit
	b _0801D072
	.align 2, 0
_0801CFC4: .4byte gCurrentSprite
_0801CFC8: .4byte gPreviousVerticalCollisionCheck
_0801CFCC:
	cmp r6, #0
	bne _0801D072
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801D002
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801CFFE
	movs r6, #1
_0801CFFE:
	cmp r6, #0
	beq _0801D072
_0801D002:
	ldr r0, _0801D00C @ =gCurrentSprite
	strh r1, [r0, #2]
	bl HornoadLandingGFXInit
	b _0801D072
	.align 2, 0
_0801D00C: .4byte gCurrentSprite
_0801D010:
	movs r6, #0
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801D060 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0x11
	beq _0801D04E
	movs r1, #0xa
	ldrsh r0, [r4, r1]
	ldrh r2, [r4, #2]
	adds r0, r0, r2
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0x11
	bne _0801D04A
	movs r6, #1
_0801D04A:
	cmp r6, #0
	beq _0801D072
_0801D04E:
	ldr r2, _0801D064 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801D068
	ldrh r0, [r2, #4]
	subs r0, #4
	b _0801D06C
	.align 2, 0
_0801D060: .4byte gPreviousCollisionCheck
_0801D064: .4byte gCurrentSprite
_0801D068:
	ldrh r0, [r2, #4]
	adds r0, #4
_0801D06C:
	strh r0, [r2, #4]
	bl HornoadFallingInit
_0801D072:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start HornoadLanding
HornoadLanding: @ 0x0801D078
	push {r4, lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801D112
	ldr r4, _0801D0C0 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801D0D2
	ldr r0, _0801D0C4 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r1, [r1]
	cmp r1, r0
	bls _0801D0CC
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _0801D0C8 @ =0x082EB844
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	movs r1, #0
	strh r2, [r4, #0x16]
	adds r0, r4, #0
	adds r0, #0x2e
	strb r1, [r0]
	b _0801D112
	.align 2, 0
_0801D0C0: .4byte gCurrentSprite
_0801D0C4: .4byte gSpriteRandomNumber
_0801D0C8: .4byte 0x082EB844
_0801D0CC:
	bl HornoadIdleBeforeJumpingInit
	b _0801D112
_0801D0D2:
	bl HornoadCheckSamusInSpittingRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801D0E2
	bl HornoadSpittingInit
	b _0801D112
_0801D0E2:
	bl HornoadCheckSamusInJumpingRange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0801D0F4
	bl HornoadJumpingInit
	b _0801D112
_0801D0F4:
	cmp r0, #2
	bne _0801D0FE
	bl HornoadTurningAroundInit
	b _0801D112
_0801D0FE:
	adds r0, r4, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801D10E
	bl HornoadSetRandomIdleAnimation
	b _0801D112
_0801D10E:
	bl HornoadIdleBeforeJumpingInit
_0801D112:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start HornoadFalling
HornoadFalling: @ 0x0801D118
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _0801D16C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r5, _0801D170 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801D162
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801D162
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r7, [r4, #4]
	adds r1, r1, r7
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0801D15E
	movs r6, #1
_0801D15E:
	cmp r6, #0
	beq _0801D174
_0801D162:
	ldr r0, _0801D16C @ =gCurrentSprite
	strh r1, [r0, #2]
	bl HornoadLandingGFXInit
	b _0801D1B4
	.align 2, 0
_0801D16C: .4byte gCurrentSprite
_0801D170: .4byte gPreviousVerticalCollisionCheck
_0801D174:
	adds r3, r4, #0
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r6, _0801D1A0 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r5, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	ldr r0, _0801D1A4 @ =0x00007FFF
	cmp r1, r0
	bne _0801D1A8
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r6
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r3, #2]
	b _0801D1B4
	.align 2, 0
_0801D1A0: .4byte sSpritesFallingSpeed
_0801D1A4: .4byte 0x00007FFF
_0801D1A8:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r5
	strh r0, [r4, #2]
_0801D1B4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HornoadTurningIdle
HornoadTurningIdle: @ 0x0801D1BC
	push {r4, r5, lr}
	ldr r4, _0801D1F0 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801D1F4 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801D1F8
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801D1F8
	bl HornoadFallingInit
	b _0801D230
	.align 2, 0
_0801D1F0: .4byte gCurrentSprite
_0801D1F4: .4byte gPreviousCollisionCheck
_0801D1F8:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801D230
	bl HornoadCheckSamusInJumpingRange
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0801D212
	bl HornoadIdleBeforeJumpingInit
	b _0801D230
_0801D212:
	cmp r0, #2
	beq _0801D220
	ldr r0, _0801D228 @ =gCurrentSprite
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #2
	bls _0801D22C
_0801D220:
	bl HornoadTurningAroundInit
	b _0801D230
	.align 2, 0
_0801D228: .4byte gCurrentSprite
_0801D22C:
	bl HornoadIdleBeforeJumpingInit
_0801D230:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HornoadWaitingForX
HornoadWaitingForX: @ 0x0801D238
	push {r4, r5, lr}
	ldr r4, _0801D26C @ =gCurrentSprite
	ldrh r0, [r4, #2]
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0801D270 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801D274
	ldrh r0, [r4, #2]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r4, [r4, #4]
	adds r1, r1, r4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801D274
	bl HornoadFallingInit
	b _0801D29E
	.align 2, 0
_0801D26C: .4byte gCurrentSprite
_0801D270: .4byte gPreviousCollisionCheck
_0801D274:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801D29E
	ldr r0, _0801D2A4 @ =gCurrentSprite
	adds r0, #0x2e
	ldrb r1, [r0]
	adds r2, r1, #1
	strb r2, [r0]
	ldr r0, _0801D2A8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801D29E
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bls _0801D29E
	bl HornoadSetRandomIdleAnimation
_0801D29E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D2A4: .4byte gCurrentSprite
_0801D2A8: .4byte gSpriteRandomNumber

	thumb_func_start HornoadTurning
HornoadTurning: @ 0x0801D2AC
	push {r4, lr}
	ldr r4, _0801D2F4 @ =gCurrentSprite
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	beq _0801D2BC
	ldrh r0, [r4, #2]
	subs r0, #4
	strh r0, [r4, #2]
_0801D2BC:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801D300
	ldrh r1, [r4]
	movs r0, #0x40
	eors r1, r0
	movs r2, #0
	movs r3, #0
	strh r1, [r4]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #5
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	bl HornoadSetSidesHitboxes
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801D2FC
	ldr r0, _0801D2F8 @ =0x082EB4FC
	b _0801D2FE
	.align 2, 0
_0801D2F4: .4byte gCurrentSprite
_0801D2F8: .4byte 0x082EB4FC
_0801D2FC:
	ldr r0, _0801D308 @ =0x082EB6B4
_0801D2FE:
	str r0, [r4, #0x18]
_0801D300:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D308: .4byte 0x082EB6B4

	thumb_func_start HornoadAfterTurning
HornoadAfterTurning: @ 0x0801D30C
	push {r4, lr}
	ldr r4, _0801D348 @ =gCurrentSprite
	ldrh r0, [r4, #0x16]
	cmp r0, #0
	beq _0801D31C
	ldrh r0, [r4, #2]
	adds r0, #4
	strh r0, [r4, #2]
_0801D31C:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801D350
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0x10
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	adds r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801D34C @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0801D370
	ldrh r0, [r4, #4]
	subs r0, #4
	b _0801D36E
	.align 2, 0
_0801D348: .4byte gCurrentSprite
_0801D34C: .4byte gPreviousCollisionCheck
_0801D350:
	ldrh r0, [r4, #2]
	subs r0, #0x10
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	ldrh r2, [r4, #4]
	adds r1, r1, r2
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _0801D384 @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0801D370
	ldrh r0, [r4, #4]
	adds r0, #4
_0801D36E:
	strh r0, [r4, #4]
_0801D370:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801D37C
	bl HornoadSetRandomIdleAnimation
_0801D37C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D384: .4byte gPreviousCollisionCheck

	thumb_func_start HornoadSpitting
HornoadSpitting: @ 0x0801D388
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r0, _0801D3D0 @ =gCurrentSprite
	mov ip, r0
	ldrh r0, [r0, #0x16]
	cmp r0, #5
	bne _0801D3FA
	mov r1, ip
	ldrb r0, [r1, #0x1c]
	cmp r0, #1
	bne _0801D3FA
	ldrh r1, [r1]
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _0801D3D4
	mov r4, ip
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0x28
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #2
	bl SpriteSpawnSecondary
	b _0801D3F4
	.align 2, 0
_0801D3D0: .4byte gCurrentSprite
_0801D3D4:
	mov r5, ip
	ldrb r1, [r5, #0x1e]
	ldrb r2, [r5, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r5, #2]
	subs r0, #0x28
	str r0, [sp]
	ldrh r0, [r5, #4]
	subs r0, #0x20
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #2
	bl SpriteSpawnSecondary
_0801D3F4:
	ldr r0, _0801D420 @ =0x0000014B
	bl SoundPlayNotAlreadyPlaying
_0801D3FA:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801D416
	ldr r1, _0801D424 @ =gCurrentSprite
	adds r1, #0x30
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801D416
	bl HornoadIdleBeforeJumpingInit
_0801D416:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D420: .4byte 0x0000014B
_0801D424: .4byte gCurrentSprite

	thumb_func_start HornoadSpitInit
HornoadSpitInit: @ 0x0801D428
	push {r4, r5, lr}
	ldr r0, _0801D48C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0801D490 @ =0x0000FFFB
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
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0801D494 @ =0x0000FFFC
	mov r5, ip
	strh r1, [r5, #0xa]
	movs r2, #4
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _0801D498 @ =0x082EB76C
	str r0, [r5, #0x18]
	strb r3, [r5, #0x1c]
	strh r4, [r5, #0x16]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801D48C: .4byte gCurrentSprite
_0801D490: .4byte 0x0000FFFB
_0801D494: .4byte 0x0000FFFC
_0801D498: .4byte 0x082EB76C

	thumb_func_start HornoadSpitMoving
HornoadSpitMoving: @ 0x0801D49C
	push {r4, r5, r6, lr}
	ldr r4, _0801D4C0 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _0801D4C4 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801D4C8
	strh r1, [r4, #2]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _0801D522
	.align 2, 0
_0801D4C0: .4byte gCurrentSprite
_0801D4C4: .4byte gPreviousVerticalCollisionCheck
_0801D4C8:
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _0801D4F0 @ =0x082E9218
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _0801D4F4 @ =0x00007FFF
	cmp r1, r0
	bne _0801D4F8
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _0801D502
	.align 2, 0
_0801D4F0: .4byte 0x082E9218
_0801D4F4: .4byte 0x00007FFF
_0801D4F8:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_0801D502:
	strh r0, [r4, #2]
	ldr r2, _0801D518 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801D51C
	ldrh r0, [r2, #4]
	adds r0, #0xa
	b _0801D520
	.align 2, 0
_0801D518: .4byte gCurrentSprite
_0801D51C:
	ldrh r0, [r2, #4]
	subs r0, #0xa
_0801D520:
	strh r0, [r2, #4]
_0801D522:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start HornoadSpitExplodingInit
HornoadSpitExplodingInit: @ 0x0801D528
	ldr r3, _0801D544 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	ldr r0, _0801D548 @ =0x082EB7C4
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_0801D544: .4byte gCurrentSprite
_0801D548: .4byte 0x082EB7C4

	thumb_func_start HornoadSpitExploding
HornoadSpitExploding: @ 0x0801D54C
	push {r4, lr}
	ldr r4, _0801D56C @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801D564
	movs r0, #0
	strh r0, [r4]
_0801D564:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D56C: .4byte gCurrentSprite

	thumb_func_start HornoadSpawnerInit
HornoadSpawnerInit: @ 0x0801D570
	push {r4, lr}
	ldr r3, _0801D5C4 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x33
	movs r1, #0
	strb r1, [r0]
	subs r0, #0xc
	movs r2, #0x10
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	movs r4, #0
	ldr r0, _0801D5C8 @ =0x0000FFC8
	strh r0, [r3, #0xa]
	strh r1, [r3, #0xc]
	adds r0, #8
	strh r0, [r3, #0xe]
	movs r0, #0x30
	strh r0, [r3, #0x10]
	adds r0, r3, #0
	adds r0, #0x25
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	subs r1, #1
	movs r0, #3
	strb r0, [r1]
	ldr r0, _0801D5CC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0801D5D0
	adds r0, r3, #0
	adds r0, #0x2f
	strb r2, [r0]
	b _0801D5D6
	.align 2, 0
_0801D5C4: .4byte gCurrentSprite
_0801D5C8: .4byte 0x0000FFC8
_0801D5CC: .4byte gSpriteRandomNumber
_0801D5D0:
	adds r0, r3, #0
	adds r0, #0x2f
	strb r4, [r0]
_0801D5D6:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start HornoadSpawnerIdleInit
HornoadSpawnerIdleInit: @ 0x0801D5DC
	ldr r1, _0801D600 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #2
	strb r0, [r2]
	ldr r0, _0801D604 @ =0x082EB5AC
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _0801D608 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x50
	adds r1, #0x2e
	strb r0, [r1]
	bx lr
	.align 2, 0
_0801D600: .4byte gCurrentSprite
_0801D604: .4byte 0x082EB5AC
_0801D608: .4byte gSpriteRandomNumber

	thumb_func_start HornoadSpawnerIdle
HornoadSpawnerIdle: @ 0x0801D60C
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801D620 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r2, [r1]
	adds r4, r0, #0
	cmp r2, #0
	beq _0801D624
	subs r0, r2, #1
	b _0801D68C
	.align 2, 0
_0801D620: .4byte gCurrentSprite
_0801D624:
	movs r5, #0
	movs r3, #0
	ldr r7, _0801D678 @ =gSpriteData
	adds r6, r4, #0
_0801D62C:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r7
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801D652
	ldrb r0, [r2, #0x1e]
	ldrb r1, [r6, #0x1e]
	cmp r0, r1
	bne _0801D652
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x12
	bne _0801D652
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0801D652:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0801D62C
	cmp r5, #1
	bhi _0801D680
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x2a
	strb r0, [r1]
	ldr r0, _0801D67C @ =0x082EB5CC
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	adds r1, #0xa
	movs r0, #0x30
	b _0801D68C
	.align 2, 0
_0801D678: .4byte gSpriteData
_0801D67C: .4byte 0x082EB5CC
_0801D680:
	ldr r0, _0801D694 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, #0x14
	adds r1, r4, #0
	adds r1, #0x2e
_0801D68C:
	strb r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D694: .4byte gSpriteRandomNumber

	thumb_func_start HornoadSpawnerDelayBeforeSpawning
HornoadSpawnerDelayBeforeSpawning: @ 0x0801D698
	push {r4, r5, r6, lr}
	ldr r1, _0801D6B0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	adds r3, r1, #0
	cmp r0, #0
	beq _0801D6B4
	subs r0, #1
	strb r0, [r2]
	b _0801D72C
	.align 2, 0
_0801D6B0: .4byte gCurrentSprite
_0801D6B4:
	movs r4, #0
	movs r2, #0
	ldr r5, _0801D6F4 @ =gSpriteData
	movs r6, #1
_0801D6BC:
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r5
	ldrh r1, [r0]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0801D6D4
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_0801D6D4:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x17
	bls _0801D6BC
	cmp r4, #0
	beq _0801D728
	adds r0, r3, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801D6F8
	ldrh r1, [r3]
	movs r0, #0x40
	orrs r0, r1
	b _0801D6FE
	.align 2, 0
_0801D6F4: .4byte gSpriteData
_0801D6F8:
	ldrh r1, [r3]
	ldr r0, _0801D720 @ =0x0000FFBF
	ands r0, r1
_0801D6FE:
	strh r0, [r3]
	adds r4, r3, #0
	adds r4, #0x2f
	ldrb r0, [r4]
	movs r1, #1
	eors r0, r1
	movs r2, #0
	strb r0, [r4]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	ldr r0, _0801D724 @ =0x082EB7F4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	b _0801D72C
	.align 2, 0
_0801D720: .4byte 0x0000FFBF
_0801D724: .4byte 0x082EB7F4
_0801D728:
	bl HornoadSpawnerIdleInit
_0801D72C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HornoadSpawnerSpawnHornoad
HornoadSpawnerSpawnHornoad: @ 0x0801D734
	push {lr}
	sub sp, #0xc
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0801D768
	ldr r3, _0801D770 @ =gCurrentSprite
	ldrb r1, [r3, #0x1e]
	ldrb r2, [r3, #0x1f]
	ldrh r0, [r3, #2]
	subs r0, #0x3c
	str r0, [sp]
	ldrh r0, [r3, #4]
	str r0, [sp, #4]
	ldrh r3, [r3]
	movs r0, #0x40
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x12
	movs r3, #0x10
	bl SpriteSpawnPrimary
	bl HornoadSpawnerIdleInit
_0801D768:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_0801D770: .4byte gCurrentSprite

	thumb_func_start Hornoad
Hornoad: @ 0x0801D774
	push {r4, r5, r6, lr}
	ldr r4, _0801D7A0 @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x2c
	ldrb r1, [r5]
	movs r6, #0x7f
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #4
	bne _0801D790
	movs r0, #0xa5
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0801D790:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801D7A4
	bl SpriteUtilUpdateFreezeTimer
	b _0801D9D0
	.align 2, 0
_0801D7A0: .4byte gCurrentSprite
_0801D7A4:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _0801D7CC
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0801D7CC
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801D7CC
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_0801D7CC:
	ldr r1, _0801D7E8 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r4, r1, #0
	cmp r0, #0x5b
	bls _0801D7DC
	b _0801D9D0
_0801D7DC:
	lsls r0, r0, #2
	ldr r1, _0801D7EC @ =_0801D7F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D7E8: .4byte gCurrentSprite
_0801D7EC: .4byte _0801D7F0
_0801D7F0: @ jump table
	.4byte _0801D960 @ case 0
	.4byte _0801D966 @ case 1
	.4byte _0801D96A @ case 2
	.4byte _0801D9D0 @ case 3
	.4byte _0801D988 @ case 4
	.4byte _0801D98E @ case 5
	.4byte _0801D9D0 @ case 6
	.4byte _0801D9D0 @ case 7
	.4byte _0801D982 @ case 8
	.4byte _0801D9D0 @ case 9
	.4byte _0801D9D0 @ case 10
	.4byte _0801D9D0 @ case 11
	.4byte _0801D9D0 @ case 12
	.4byte _0801D9D0 @ case 13
	.4byte _0801D9D0 @ case 14
	.4byte _0801D9D0 @ case 15
	.4byte _0801D9D0 @ case 16
	.4byte _0801D9D0 @ case 17
	.4byte _0801D9D0 @ case 18
	.4byte _0801D9D0 @ case 19
	.4byte _0801D9D0 @ case 20
	.4byte _0801D9D0 @ case 21
	.4byte _0801D99A @ case 22
	.4byte _0801D9D0 @ case 23
	.4byte _0801D970 @ case 24
	.4byte _0801D9D0 @ case 25
	.4byte _0801D976 @ case 26
	.4byte _0801D9D0 @ case 27
	.4byte _0801D97C @ case 28
	.4byte _0801D9D0 @ case 29
	.4byte _0801D9D0 @ case 30
	.4byte _0801D9D0 @ case 31
	.4byte _0801D9D0 @ case 32
	.4byte _0801D9D0 @ case 33
	.4byte _0801D9D0 @ case 34
	.4byte _0801D9D0 @ case 35
	.4byte _0801D9D0 @ case 36
	.4byte _0801D9D0 @ case 37
	.4byte _0801D9D0 @ case 38
	.4byte _0801D9D0 @ case 39
	.4byte _0801D9D0 @ case 40
	.4byte _0801D9D0 @ case 41
	.4byte _0801D994 @ case 42
	.4byte _0801D9D0 @ case 43
	.4byte _0801D9D0 @ case 44
	.4byte _0801D9D0 @ case 45
	.4byte _0801D9D0 @ case 46
	.4byte _0801D9D0 @ case 47
	.4byte _0801D9D0 @ case 48
	.4byte _0801D9D0 @ case 49
	.4byte _0801D9D0 @ case 50
	.4byte _0801D9D0 @ case 51
	.4byte _0801D9D0 @ case 52
	.4byte _0801D9D0 @ case 53
	.4byte _0801D9D0 @ case 54
	.4byte _0801D9A0 @ case 55
	.4byte _0801D9D0 @ case 56
	.4byte _0801D9D0 @ case 57
	.4byte _0801D9D0 @ case 58
	.4byte _0801D9D0 @ case 59
	.4byte _0801D9D0 @ case 60
	.4byte _0801D9D0 @ case 61
	.4byte _0801D9D0 @ case 62
	.4byte _0801D9D0 @ case 63
	.4byte _0801D9D0 @ case 64
	.4byte _0801D9D0 @ case 65
	.4byte _0801D9D0 @ case 66
	.4byte _0801D9D0 @ case 67
	.4byte _0801D9D0 @ case 68
	.4byte _0801D9D0 @ case 69
	.4byte _0801D9D0 @ case 70
	.4byte _0801D9D0 @ case 71
	.4byte _0801D9D0 @ case 72
	.4byte _0801D9D0 @ case 73
	.4byte _0801D9D0 @ case 74
	.4byte _0801D9D0 @ case 75
	.4byte _0801D9D0 @ case 76
	.4byte _0801D9D0 @ case 77
	.4byte _0801D9D0 @ case 78
	.4byte _0801D9D0 @ case 79
	.4byte _0801D9D0 @ case 80
	.4byte _0801D9D0 @ case 81
	.4byte _0801D9D0 @ case 82
	.4byte _0801D9D0 @ case 83
	.4byte _0801D9D0 @ case 84
	.4byte _0801D9D0 @ case 85
	.4byte _0801D9D0 @ case 86
	.4byte _0801D9A6 @ case 87
	.4byte _0801D9AA @ case 88
	.4byte _0801D9B0 @ case 89
	.4byte _0801D9B4 @ case 90
	.4byte _0801D9BA @ case 91
_0801D960:
	bl HornoadInit
	b _0801D9D0
_0801D966:
	bl HornoadIdleBeforeJumpingInit
_0801D96A:
	bl HornoadIdle
	b _0801D9D0
_0801D970:
	bl HornoadJumping
	b _0801D9D0
_0801D976:
	bl HornoadLanding
	b _0801D9D0
_0801D97C:
	bl HornoadWaitingForX
	b _0801D9D0
_0801D982:
	bl HornoadTurningIdle
	b _0801D9D0
_0801D988:
	bl HornoadTurning
	b _0801D9D0
_0801D98E:
	bl HornoadAfterTurning
	b _0801D9D0
_0801D994:
	bl HornoadSpitting
	b _0801D9D0
_0801D99A:
	bl HornoadFalling
	b _0801D9D0
_0801D9A0:
	bl unk_1ccec
	b _0801D9D0
_0801D9A6:
	bl SpriteDyingInit
_0801D9AA:
	bl SpriteDying
	b _0801D9D0
_0801D9B0:
	bl HornoadInit
_0801D9B4:
	bl SpriteSpawningFromX
	b _0801D9D0
_0801D9BA:
	ldrb r0, [r4, #0x1d]
	cmp r0, #0x76
	bne _0801D9C6
	movs r0, #2
	bl EventCheckAdvance
_0801D9C6:
	bl XParasiteInit
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
_0801D9D0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HornoadSpit
HornoadSpit: @ 0x0801D9D8
	push {lr}
	ldr r0, _0801D9F0 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0801D9FE
	cmp r0, #2
	bgt _0801D9F4
	cmp r0, #0
	beq _0801D9FA
	b _0801DA0A
	.align 2, 0
_0801D9F0: .4byte gCurrentSprite
_0801D9F4:
	cmp r0, #0x38
	beq _0801DA04
	b _0801DA0A
_0801D9FA:
	bl HornoadSpitInit
_0801D9FE:
	bl HornoadSpitMoving
	b _0801DA0E
_0801DA04:
	bl HornoadSpitExploding
	b _0801DA0E
_0801DA0A:
	bl HornoadSpitExplodingInit
_0801DA0E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start HornoadSpawner
HornoadSpawner: @ 0x0801DA14
	push {lr}
	ldr r0, _0801DA34 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x2c
	bhi _0801DB08
	lsls r0, r0, #2
	ldr r1, _0801DA38 @ =_0801DA3C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801DA34: .4byte gCurrentSprite
_0801DA38: .4byte _0801DA3C
_0801DA3C: @ jump table
	.4byte _0801DAF0 @ case 0
	.4byte _0801DAF4 @ case 1
	.4byte _0801DAF8 @ case 2
	.4byte _0801DB08 @ case 3
	.4byte _0801DB08 @ case 4
	.4byte _0801DB08 @ case 5
	.4byte _0801DB08 @ case 6
	.4byte _0801DB08 @ case 7
	.4byte _0801DB08 @ case 8
	.4byte _0801DB08 @ case 9
	.4byte _0801DB08 @ case 10
	.4byte _0801DB08 @ case 11
	.4byte _0801DB08 @ case 12
	.4byte _0801DB08 @ case 13
	.4byte _0801DB08 @ case 14
	.4byte _0801DB08 @ case 15
	.4byte _0801DB08 @ case 16
	.4byte _0801DB08 @ case 17
	.4byte _0801DB08 @ case 18
	.4byte _0801DB08 @ case 19
	.4byte _0801DB08 @ case 20
	.4byte _0801DB08 @ case 21
	.4byte _0801DB08 @ case 22
	.4byte _0801DB08 @ case 23
	.4byte _0801DB08 @ case 24
	.4byte _0801DB08 @ case 25
	.4byte _0801DB08 @ case 26
	.4byte _0801DB08 @ case 27
	.4byte _0801DB08 @ case 28
	.4byte _0801DB08 @ case 29
	.4byte _0801DB08 @ case 30
	.4byte _0801DB08 @ case 31
	.4byte _0801DB08 @ case 32
	.4byte _0801DB08 @ case 33
	.4byte _0801DB08 @ case 34
	.4byte _0801DB08 @ case 35
	.4byte _0801DB08 @ case 36
	.4byte _0801DB08 @ case 37
	.4byte _0801DB08 @ case 38
	.4byte _0801DB08 @ case 39
	.4byte _0801DB08 @ case 40
	.4byte _0801DB08 @ case 41
	.4byte _0801DAFE @ case 42
	.4byte _0801DB08 @ case 43
	.4byte _0801DB04 @ case 44
_0801DAF0:
	bl HornoadSpawnerInit
_0801DAF4:
	bl HornoadSpawnerIdleInit
_0801DAF8:
	bl HornoadSpawnerIdle
	b _0801DB08
_0801DAFE:
	bl HornoadSpawnerDelayBeforeSpawning
	b _0801DB08
_0801DB04:
	bl HornoadSpawnerSpawnHornoad
_0801DB08:
	pop {r0}
	bx r0
