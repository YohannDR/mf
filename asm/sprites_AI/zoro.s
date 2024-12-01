    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ZoroCheckCollidingWithAir
ZoroCheckCollidingWithAir: @ 0x08031054
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _08031088 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080310B4
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031090
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803108C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08031104
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _080310F8
	.align 2, 0
_08031088: .4byte gCurrentSprite
_0803108C: .4byte gPreviousCollisionCheck
_08031090:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080310B0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08031104
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _080310F8
	.align 2, 0
_080310B0: .4byte gPreviousCollisionCheck
_080310B4:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080310E0
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080310DC @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08031104
	ldrh r0, [r4, #2]
	subs r0, #4
	b _080310F4
	.align 2, 0
_080310DC: .4byte gPreviousCollisionCheck
_080310E0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _0803110C @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08031104
	ldrh r0, [r4, #2]
_080310F4:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_080310F8:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08031104
	movs r6, #1
_08031104:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803110C: .4byte gPreviousCollisionCheck

	thumb_func_start ZoroSetHitboxAndDrawDistance
ZoroSetHitboxAndDrawDistance: @ 0x08031110
	push {lr}
	ldr r1, _08031138 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0
	beq _08031150
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031140
	ldr r0, _0803113C @ =0x0000FFC4
	strh r0, [r2, #0xa]
	movs r1, #0x3c
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _0803117C
	.align 2, 0
_08031138: .4byte gCurrentSprite
_0803113C: .4byte 0x0000FFC4
_08031140:
	ldr r0, _0803114C @ =0x0000FFC4
	strh r0, [r2, #0xa]
	movs r1, #0x3c
	strh r1, [r2, #0xc]
	adds r0, #0x2c
	b _08031166
	.align 2, 0
_0803114C: .4byte 0x0000FFC4
_08031150:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08031170
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r1, #0x3c
	strh r1, [r2, #0xc]
	ldr r0, _0803116C @ =0x0000FFC4
_08031166:
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	b _0803117E
	.align 2, 0
_0803116C: .4byte 0x0000FFC4
_08031170:
	ldr r0, _08031194 @ =0x0000FFC4
	strh r0, [r2, #0xa]
	movs r1, #0x10
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	movs r0, #0x3c
_0803117C:
	strh r0, [r2, #0x10]
_0803117E:
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
_08031194: .4byte 0x0000FFC4

	thumb_func_start ZoroSetCrawlingOam
ZoroSetCrawlingOam: @ 0x08031198
	push {lr}
	ldr r0, _080311AC @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _080311B4
	ldr r0, _080311B0 @ =sZoroOam_33c09c
	b _080311B6
	.align 2, 0
_080311AC: .4byte gCurrentSprite
_080311B0: .4byte sZoroOam_33c09c
_080311B4:
	ldr r0, _080311C4 @ =sZoroOam_33c034
_080311B6:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_080311C4: .4byte sZoroOam_33c034

	thumb_func_start ZoroSetTurningOam
ZoroSetTurningOam: @ 0x080311C8
	push {lr}
	ldr r0, _080311DC @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _080311E4
	ldr r0, _080311E0 @ =sZoroOam_33c0d4
	b _080311E6
	.align 2, 0
_080311DC: .4byte gCurrentSprite
_080311E0: .4byte sZoroOam_33c0d4
_080311E4:
	ldr r0, _080311F4 @ =sZoroOam_33c06c
_080311E6:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_080311F4: .4byte sZoroOam_33c06c

	thumb_func_start ZoroSetTurningAroundSecondPartOam
ZoroSetTurningAroundSecondPartOam: @ 0x080311F8
	push {lr}
	ldr r0, _08031218 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	adds r2, r0, #0
	cmp r1, #0
	beq _08031220
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	ldr r0, _0803121C @ =sZoroOam_33c0ec
	b _0803122A
	.align 2, 0
_08031218: .4byte gCurrentSprite
_0803121C: .4byte sZoroOam_33c0ec
_08031220:
	ldrh r0, [r2]
	movs r1, #0x40
	eors r0, r1
	strh r0, [r2]
	ldr r0, _08031238 @ =sZoroOam_33c084
_0803122A:
	str r0, [r2, #0x18]
	movs r0, #0
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_08031238: .4byte sZoroOam_33c084

	thumb_func_start ZoroSetDeathPosition
ZoroSetDeathPosition: @ 0x0803123C
	push {lr}
	ldr r2, _0803125C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031268
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031260
	ldrh r0, [r2, #4]
	subs r0, #0x20
	strh r0, [r2, #4]
	b _08031280
	.align 2, 0
_0803125C: .4byte gCurrentSprite
_08031260:
	ldrh r0, [r2, #4]
	adds r0, #0x20
	strh r0, [r2, #4]
	b _08031280
_08031268:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803127A
	ldrh r0, [r2, #2]
	adds r0, #0x20
	b _0803127E
_0803127A:
	ldrh r0, [r2, #2]
	subs r0, #0x20
_0803127E:
	strh r0, [r2, #2]
_08031280:
	pop {r0}
	bx r0

	thumb_func_start ZoroInit
ZoroInit: @ 0x08031284
	push {r4, r5, r6, r7, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _080312B0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080312B4
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080312B4
	strh r0, [r2]
	b _080313F6
	.align 2, 0
_080312B0: .4byte gCurrentSprite
_080312B4:
	ldr r0, _080312CC @ =gCurrentSprite
	adds r4, r0, #0
	adds r4, #0x24
	ldrb r1, [r4]
	adds r7, r0, #0
	cmp r1, #0x59
	bne _080312D0
	movs r0, #0x5a
	strb r0, [r4]
	movs r0, #0x2c
	strh r0, [r7, #6]
	b _080313D6
	.align 2, 0
_080312CC: .4byte gCurrentSprite
_080312D0:
	bl SpriteUtilChooseRandomXDirection
	movs r0, #2
	strb r0, [r4]
	ldrh r0, [r7, #2]
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08031308 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	movs r6, #0xf0
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #0
	beq _0803130C
	adds r1, r7, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r7]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080313D6
	movs r0, #0x40
	b _08031384
	.align 2, 0
_08031308: .4byte gPreviousCollisionCheck
_0803130C:
	ldrh r0, [r7, #2]
	subs r0, #0x44
	ldrh r1, [r7, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08031348
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
	beq _080313D6
	movs r0, #0x40
	b _080313D2
_08031348:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0803138A
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
	beq _080313D6
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_08031384:
	orrs r0, r1
	strh r0, [r7]
	b _080313D6
_0803138A:
	ldrh r0, [r7, #2]
	subs r0, #0x20
	ldrh r1, [r7, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	adds r2, r6, #0
	ands r2, r0
	cmp r2, #0
	bne _080313A4
	strh r2, [r7]
	b _080313F6
_080313A4:
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
	beq _080313D6
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
_080313D2:
	orrs r1, r0
	strh r1, [r7]
_080313D6:
	adds r1, r7, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	bl ZoroSetCrawlingOam
	bl ZoroSetHitboxAndDrawDistance
	ldr r2, _080313FC @ =sPrimarySpriteStats
	ldrb r1, [r7, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r7, #0x14]
_080313F6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080313FC: .4byte sPrimarySpriteStats

	thumb_func_start ZoroCrawlingInit
ZoroCrawlingInit: @ 0x08031400
	push {lr}
	bl ZoroSetCrawlingOam
	ldr r2, _08031424 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldrh r1, [r2]
	ands r0, r1
	cmp r0, #0
	beq _08031420
	movs r0, #0xb4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08031420:
	pop {r0}
	bx r0
	.align 2, 0
_08031424: .4byte gCurrentSprite

	thumb_func_start ZoroRedGetSpeed
ZoroRedGetSpeed: @ 0x08031428
	push {lr}
	ldr r2, _0803145C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r3, r0, #0x1f
	ldr r0, _08031460 @ =sPrimarySpriteStats
	ldr r1, _08031464 @ =0x000004EC
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2, #0x14]
	lsrs r0, r0, #1
	cmp r1, r0
	bhs _080314D0
	ldrh r0, [r2, #0x16]
	cmp r0, #5
	bhi _080314C0
	lsls r0, r0, #2
	ldr r1, _08031468 @ =_0803146C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803145C: .4byte gCurrentSprite
_08031460: .4byte sPrimarySpriteStats
_08031464: .4byte 0x000004EC
_08031468: .4byte _0803146C
_0803146C: @ jump table
	.4byte _080314AC @ case 0
	.4byte _08031484 @ case 1
	.4byte _08031484 @ case 2
	.4byte _0803148C @ case 3
	.4byte _08031488 @ case 4
	.4byte _08031488 @ case 5
_08031484:
	movs r1, #1
	b _080314C4
_08031488:
	movs r1, #2
	b _080314C4
_0803148C:
	ldr r0, _080314A4 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _0803149E
	cmp r3, #0
	beq _0803149E
	ldr r0, _080314A8 @ =0x00000169
	bl SoundPlayNotAlreadyPlaying
_0803149E:
	movs r1, #4
	b _080314C2
	.align 2, 0
_080314A4: .4byte gCurrentSprite
_080314A8: .4byte 0x00000169
_080314AC:
	ldr r0, _080314CC @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _080314C0
	cmp r3, #0
	beq _080314C0
	movs r0, #0xb4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080314C0:
	movs r1, #0
_080314C2:
	ldr r2, _080314CC @ =gCurrentSprite
_080314C4:
	ldrb r0, [r2, #0x1c]
	adds r0, #1
	strb r0, [r2, #0x1c]
	b _0803152C
	.align 2, 0
_080314CC: .4byte gCurrentSprite
_080314D0:
	ldrh r0, [r2, #0x16]
	cmp r0, #5
	bhi _0803152A
	lsls r0, r0, #2
	ldr r1, _080314E0 @ =_080314E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080314E0: .4byte _080314E4
_080314E4: @ jump table
	.4byte _08031518 @ case 0
	.4byte _080314FC @ case 1
	.4byte _080314FC @ case 2
	.4byte _08031500 @ case 3
	.4byte _080314FC @ case 4
	.4byte _080314FC @ case 5
_080314FC:
	movs r1, #1
	b _0803152C
_08031500:
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _08031510
	cmp r3, #0
	beq _08031510
	ldr r0, _08031514 @ =0x00000169
	bl SoundPlayNotAlreadyPlaying
_08031510:
	movs r1, #2
	b _0803152C
	.align 2, 0
_08031514: .4byte 0x00000169
_08031518:
	ldrb r0, [r2, #0x1c]
	cmp r0, #1
	bne _0803152A
	cmp r3, #0
	beq _0803152A
	movs r0, #0xb4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_0803152A:
	movs r1, #0
_0803152C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ZoroBlueGetSpeed
ZoroBlueGetSpeed: @ 0x08031534
	push {r4, r5, r6, r7, lr}
	ldr r4, _08031574 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r6, r0, #0x1f
	ldr r0, _08031578 @ =sPrimarySpriteStats
	ldr r1, _0803157C @ =0x0000056A
	adds r0, r0, r1
	ldrh r5, [r0]
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r4, #0x14]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r7, r4, #0
	cmp r1, r0
	bhs _080315E8
	ldrh r0, [r7, #0x16]
	cmp r0, #5
	bhi _080315D8
	lsls r0, r0, #2
	ldr r1, _08031580 @ =_08031584
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031574: .4byte gCurrentSprite
_08031578: .4byte sPrimarySpriteStats
_0803157C: .4byte 0x0000056A
_08031580: .4byte _08031584
_08031584: @ jump table
	.4byte _080315C4 @ case 0
	.4byte _0803159C @ case 1
	.4byte _0803159C @ case 2
	.4byte _080315A4 @ case 3
	.4byte _080315A0 @ case 4
	.4byte _080315A0 @ case 5
_0803159C:
	movs r1, #2
	b _080315DC
_080315A0:
	movs r1, #4
	b _080315DC
_080315A4:
	ldr r0, _080315BC @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _080315B6
	cmp r6, #0
	beq _080315B6
	ldr r0, _080315C0 @ =0x00000169
	bl SoundPlayNotAlreadyPlaying
_080315B6:
	movs r1, #6
	b _080315DA
	.align 2, 0
_080315BC: .4byte gCurrentSprite
_080315C0: .4byte 0x00000169
_080315C4:
	ldr r0, _080315E4 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _080315D8
	cmp r6, #0
	beq _080315D8
	movs r0, #0xb4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080315D8:
	movs r1, #0
_080315DA:
	ldr r7, _080315E4 @ =gCurrentSprite
_080315DC:
	ldrb r0, [r7, #0x1c]
	adds r0, #2
	strb r0, [r7, #0x1c]
	b _080316CC
	.align 2, 0
_080315E4: .4byte gCurrentSprite
_080315E8:
	ldrh r4, [r7, #0x14]
	lsls r0, r5, #1
	movs r1, #3
	bl __divsi3
	cmp r4, r0
	bge _08031670
	ldrh r0, [r7, #0x16]
	cmp r0, #5
	bhi _08031660
	lsls r0, r0, #2
	ldr r1, _08031608 @ =_0803160C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031608: .4byte _0803160C
_0803160C: @ jump table
	.4byte _0803164C @ case 0
	.4byte _08031624 @ case 1
	.4byte _08031624 @ case 2
	.4byte _0803162C @ case 3
	.4byte _08031628 @ case 4
	.4byte _08031628 @ case 5
_08031624:
	movs r1, #1
	b _08031664
_08031628:
	movs r1, #2
	b _08031664
_0803162C:
	ldr r0, _08031644 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _0803163E
	cmp r6, #0
	beq _0803163E
	ldr r0, _08031648 @ =0x00000169
	bl SoundPlayNotAlreadyPlaying
_0803163E:
	movs r1, #4
	b _08031662
	.align 2, 0
_08031644: .4byte gCurrentSprite
_08031648: .4byte 0x00000169
_0803164C:
	ldr r0, _0803166C @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	bne _08031660
	cmp r6, #0
	beq _08031660
	movs r0, #0xb4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08031660:
	movs r1, #0
_08031662:
	ldr r7, _0803166C @ =gCurrentSprite
_08031664:
	ldrb r0, [r7, #0x1c]
	adds r0, #1
	strb r0, [r7, #0x1c]
	b _080316CC
	.align 2, 0
_0803166C: .4byte gCurrentSprite
_08031670:
	ldrh r0, [r7, #0x16]
	cmp r0, #5
	bhi _080316CA
	lsls r0, r0, #2
	ldr r1, _08031680 @ =_08031684
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031680: .4byte _08031684
_08031684: @ jump table
	.4byte _080316B8 @ case 0
	.4byte _0803169C @ case 1
	.4byte _0803169C @ case 2
	.4byte _080316A0 @ case 3
	.4byte _0803169C @ case 4
	.4byte _0803169C @ case 5
_0803169C:
	movs r1, #1
	b _080316CC
_080316A0:
	ldrb r0, [r7, #0x1c]
	cmp r0, #1
	bne _080316B0
	cmp r6, #0
	beq _080316B0
	ldr r0, _080316B4 @ =0x00000169
	bl SoundPlayNotAlreadyPlaying
_080316B0:
	movs r1, #2
	b _080316CC
	.align 2, 0
_080316B4: .4byte 0x00000169
_080316B8:
	ldrb r0, [r7, #0x1c]
	cmp r0, #1
	bne _080316CA
	cmp r6, #0
	beq _080316CA
	movs r0, #0xb4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080316CA:
	movs r1, #0
_080316CC:
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ZoroCrawl
ZoroCrawl: @ 0x080316D4
	push {r4, r5, r6, r7, lr}
	ldr r0, _080316E4 @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x63
	bne _080316E8
	bl ZoroBlueGetSpeed
	b _080316EC
	.align 2, 0
_080316E4: .4byte gCurrentSprite
_080316E8:
	bl ZoroRedGetSpeed
_080316EC:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	bl ZoroCheckCollidingWithAir
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08031708
	ldr r0, _08031704 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _080318FA
	.align 2, 0
_08031704: .4byte gCurrentSprite
_08031708:
	ldr r4, _0803174C @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031800
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803177C
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08031754
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08031750 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08031740
	b _080318F4
_08031740:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #4
	b _080317A6
	.align 2, 0
_0803174C: .4byte gCurrentSprite
_08031750: .4byte gPreviousCollisionCheck
_08031754:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08031778 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _0803176C
	b _080318F4
_0803176C:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #4
	b _080317E4
	.align 2, 0
_08031778: .4byte gPreviousCollisionCheck
_0803177C:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080317C4
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _080317C0 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _080317A0
	b _080318F4
_080317A0:
	ldrh r0, [r4, #2]
	adds r0, #0x40
	ldrh r1, [r4, #4]
_080317A6:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080317B6
	b _080318F4
_080317B6:
	ldrh r0, [r4, #2]
	adds r0, r5, r0
	strh r0, [r4, #2]
	b _080318EE
	.align 2, 0
_080317C0: .4byte gPreviousCollisionCheck
_080317C4:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _080317FC @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _080317DE
	b _080318F4
_080317DE:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	ldrh r1, [r4, #4]
_080317E4:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080317F4
	b _080318F4
_080317F4:
	ldrh r0, [r4, #2]
	subs r0, r0, r5
	strh r0, [r4, #2]
	b _080318EE
	.align 2, 0
_080317FC: .4byte gPreviousCollisionCheck
_08031800:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803187C
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803184C
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08031848 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080318F4
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _080318F4
	ldrh r0, [r4, #4]
	adds r0, r5, r0
	b _080318EC
	.align 2, 0
_08031848: .4byte gPreviousCollisionCheck
_0803184C:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08031878 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r7, #0xf
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080318F4
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	b _080318E2
	.align 2, 0
_08031878: .4byte gPreviousCollisionCheck
_0803187C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080318BC
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _080318B8 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080318F4
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080318F4
	ldrh r0, [r4, #4]
	adds r0, r5, r0
	b _080318EC
	.align 2, 0
_080318B8: .4byte gPreviousCollisionCheck
_080318BC:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08031904 @ =gPreviousCollisionCheck
	ldrb r1, [r6]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080318F4
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	movs r0, #0xf
_080318E2:
	ands r0, r1
	cmp r0, #0
	bne _080318F4
	ldrh r0, [r4, #4]
	subs r0, r0, r5
_080318EC:
	strh r0, [r4, #4]
_080318EE:
	movs r0, #0
	cmp r0, #0
	beq _080318FC
_080318F4:
	ldr r0, _08031908 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #3
_080318FA:
	strb r1, [r0]
_080318FC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08031904: .4byte gPreviousCollisionCheck
_08031908: .4byte gCurrentSprite

	thumb_func_start ZoroTurningInit
ZoroTurningInit: @ 0x0803190C
	push {lr}
	ldr r0, _08031920 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #4
	strb r1, [r0]
	bl ZoroSetTurningOam
	pop {r0}
	bx r0
	.align 2, 0
_08031920: .4byte gCurrentSprite

	thumb_func_start ZoroTurningAround
ZoroTurningAround: @ 0x08031924
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803193A
	ldr r0, _08031940 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #5
	strb r1, [r0]
	bl ZoroSetTurningAroundSecondPartOam
_0803193A:
	pop {r0}
	bx r0
	.align 2, 0
_08031940: .4byte gCurrentSprite

	thumb_func_start ZoroTurningAroundSecondPart
ZoroTurningAroundSecondPart: @ 0x08031944
	push {lr}
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _08031956
	ldr r0, _0803195C @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
	strb r1, [r0]
_08031956:
	pop {r0}
	bx r0
	.align 2, 0
_0803195C: .4byte gCurrentSprite

	thumb_func_start ZoroFallingInit
ZoroFallingInit: @ 0x08031960
	push {lr}
	ldr r1, _0803197C @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bl ZoroSetCrawlingOam
	pop {r0}
	bx r0
	.align 2, 0
_0803197C: .4byte gCurrentSprite

	thumb_func_start ZoroFalling
ZoroFalling: @ 0x08031980
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _080319A8 @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080319AC
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080319B8
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _080319B8
	.align 2, 0
_080319A8: .4byte gCurrentSprite
_080319AC:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080319C0
_080319B8:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080319C0:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08031A0C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031A34
	ldr r4, _08031A10 @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _080319E6
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_080319E6:
	ldrh r0, [r4]
	ldr r1, _08031A14 @ =0x0000FEFF
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strb r0, [r2]
	bl ZoroSetHitboxAndDrawDistance
	cmp r5, #0
	beq _08031A20
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08031A18
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _08031A1C
	.align 2, 0
_08031A0C: .4byte gPreviousVerticalCollisionCheck
_08031A10: .4byte gCurrentSprite
_08031A14: .4byte 0x0000FEFF
_08031A18:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_08031A1C:
	subs r0, r0, r1
	strh r0, [r4, #4]
_08031A20:
	ldr r0, _08031A30 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	bl ZoroSetCrawlingOam
	b _08031A78
	.align 2, 0
_08031A30: .4byte gCurrentSprite
_08031A34:
	ldr r3, _08031A60 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _08031A64 @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08031A68 @ =0x00007FFF
	cmp r1, r0
	bne _08031A6C
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08031A76
	.align 2, 0
_08031A60: .4byte gCurrentSprite
_08031A64: .4byte sSpritesFallingSpeed
_08031A68: .4byte 0x00007FFF
_08031A6C:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_08031A76:
	strh r0, [r3, #2]
_08031A78:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Zoro
Zoro: @ 0x08031A80
	push {lr}
	ldr r1, _08031AA0 @ =gCurrentSprite
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x63
	bne _08031AA8
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08031ABC
	ldr r0, _08031AA4 @ =0x000001A5
	bl SoundPlayNotAlreadyPlaying
	b _08031ABC
	.align 2, 0
_08031AA0: .4byte gCurrentSprite
_08031AA4: .4byte 0x000001A5
_08031AA8:
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08031ABC
	ldr r0, _08031AD0 @ =0x00000167
	bl SoundPlayNotAlreadyPlaying
_08031ABC:
	ldr r1, _08031AD4 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08031AD8
	bl SpriteUtilUpdateFreezeTimer
	b _08031CAA
	.align 2, 0
_08031AD0: .4byte 0x00000167
_08031AD4: .4byte gCurrentSprite
_08031AD8:
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08031AE4
	b _08031CAA
_08031AE4:
	lsls r0, r0, #2
	ldr r1, _08031AF0 @ =_08031AF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08031AF0: .4byte _08031AF4
_08031AF4: @ jump table
	.4byte _08031C64 @ case 0
	.4byte _08031C6A @ case 1
	.4byte _08031C6E @ case 2
	.4byte _08031C74 @ case 3
	.4byte _08031C78 @ case 4
	.4byte _08031C7E @ case 5
	.4byte _08031CAA @ case 6
	.4byte _08031CAA @ case 7
	.4byte _08031CAA @ case 8
	.4byte _08031CAA @ case 9
	.4byte _08031CAA @ case 10
	.4byte _08031CAA @ case 11
	.4byte _08031CAA @ case 12
	.4byte _08031CAA @ case 13
	.4byte _08031CAA @ case 14
	.4byte _08031CAA @ case 15
	.4byte _08031CAA @ case 16
	.4byte _08031CAA @ case 17
	.4byte _08031CAA @ case 18
	.4byte _08031CAA @ case 19
	.4byte _08031CAA @ case 20
	.4byte _08031C84 @ case 21
	.4byte _08031C88 @ case 22
	.4byte _08031CAA @ case 23
	.4byte _08031CAA @ case 24
	.4byte _08031CAA @ case 25
	.4byte _08031CAA @ case 26
	.4byte _08031CAA @ case 27
	.4byte _08031CAA @ case 28
	.4byte _08031CAA @ case 29
	.4byte _08031CAA @ case 30
	.4byte _08031CAA @ case 31
	.4byte _08031CAA @ case 32
	.4byte _08031CAA @ case 33
	.4byte _08031CAA @ case 34
	.4byte _08031CAA @ case 35
	.4byte _08031CAA @ case 36
	.4byte _08031CAA @ case 37
	.4byte _08031CAA @ case 38
	.4byte _08031CAA @ case 39
	.4byte _08031CAA @ case 40
	.4byte _08031CAA @ case 41
	.4byte _08031CAA @ case 42
	.4byte _08031CAA @ case 43
	.4byte _08031CAA @ case 44
	.4byte _08031CAA @ case 45
	.4byte _08031CAA @ case 46
	.4byte _08031CAA @ case 47
	.4byte _08031CAA @ case 48
	.4byte _08031CAA @ case 49
	.4byte _08031CAA @ case 50
	.4byte _08031CAA @ case 51
	.4byte _08031CAA @ case 52
	.4byte _08031CAA @ case 53
	.4byte _08031CAA @ case 54
	.4byte _08031CAA @ case 55
	.4byte _08031CAA @ case 56
	.4byte _08031CAA @ case 57
	.4byte _08031CAA @ case 58
	.4byte _08031CAA @ case 59
	.4byte _08031CAA @ case 60
	.4byte _08031CAA @ case 61
	.4byte _08031CAA @ case 62
	.4byte _08031CAA @ case 63
	.4byte _08031CAA @ case 64
	.4byte _08031CAA @ case 65
	.4byte _08031CAA @ case 66
	.4byte _08031CAA @ case 67
	.4byte _08031CAA @ case 68
	.4byte _08031CAA @ case 69
	.4byte _08031CAA @ case 70
	.4byte _08031CAA @ case 71
	.4byte _08031CAA @ case 72
	.4byte _08031CAA @ case 73
	.4byte _08031CAA @ case 74
	.4byte _08031CAA @ case 75
	.4byte _08031CAA @ case 76
	.4byte _08031CAA @ case 77
	.4byte _08031CAA @ case 78
	.4byte _08031CAA @ case 79
	.4byte _08031CAA @ case 80
	.4byte _08031CAA @ case 81
	.4byte _08031CAA @ case 82
	.4byte _08031CAA @ case 83
	.4byte _08031CAA @ case 84
	.4byte _08031CAA @ case 85
	.4byte _08031CAA @ case 86
	.4byte _08031C8E @ case 87
	.4byte _08031C92 @ case 88
	.4byte _08031C98 @ case 89
	.4byte _08031C9C @ case 90
	.4byte _08031CA2 @ case 91
_08031C64:
	bl ZoroInit
	b _08031CAA
_08031C6A:
	bl ZoroCrawlingInit
_08031C6E:
	bl ZoroCrawl
	b _08031CAA
_08031C74:
	bl ZoroTurningInit
_08031C78:
	bl ZoroTurningAround
	b _08031CAA
_08031C7E:
	bl ZoroTurningAroundSecondPart
	b _08031CAA
_08031C84:
	bl ZoroFallingInit
_08031C88:
	bl ZoroFalling
	b _08031CAA
_08031C8E:
	bl SpriteDyingInit
_08031C92:
	bl SpriteDying
	b _08031CAA
_08031C98:
	bl ZoroInit
_08031C9C:
	bl SpriteSpawningFromX
	b _08031CAA
_08031CA2:
	bl ZoroSetDeathPosition
	bl XParasiteInit
_08031CAA:
	pop {r0}
	bx r0
	.align 2, 0
