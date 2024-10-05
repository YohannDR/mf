    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ShakeTriggerStartScreenShake
ShakeTriggerStartScreenShake: @ 0x08030144
	push {lr}
	movs r2, #0
	ldr r1, _08030164 @ =gCurrentSprite
	ldrb r0, [r1, #0x1c]
	cmp r0, #2
	bne _08030226
	movs r2, #1
	ldrh r0, [r1, #0x16]
	subs r0, #2
	cmp r0, #0x2d
	bhi _08030224
	lsls r0, r0, #2
	ldr r1, _08030168 @ =_0803016C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030164: .4byte gCurrentSprite
_08030168: .4byte _0803016C
_0803016C: @ jump table
	.4byte _08030226 @ case 0
	.4byte _08030224 @ case 1
	.4byte _08030224 @ case 2
	.4byte _08030226 @ case 3
	.4byte _08030224 @ case 4
	.4byte _08030224 @ case 5
	.4byte _08030226 @ case 6
	.4byte _08030224 @ case 7
	.4byte _08030224 @ case 8
	.4byte _08030226 @ case 9
	.4byte _08030224 @ case 10
	.4byte _08030224 @ case 11
	.4byte _08030226 @ case 12
	.4byte _08030224 @ case 13
	.4byte _08030224 @ case 14
	.4byte _08030226 @ case 15
	.4byte _08030224 @ case 16
	.4byte _08030224 @ case 17
	.4byte _08030226 @ case 18
	.4byte _08030224 @ case 19
	.4byte _08030224 @ case 20
	.4byte _08030226 @ case 21
	.4byte _08030224 @ case 22
	.4byte _08030224 @ case 23
	.4byte _08030226 @ case 24
	.4byte _08030224 @ case 25
	.4byte _08030224 @ case 26
	.4byte _08030226 @ case 27
	.4byte _08030224 @ case 28
	.4byte _08030224 @ case 29
	.4byte _08030226 @ case 30
	.4byte _08030224 @ case 31
	.4byte _08030224 @ case 32
	.4byte _08030226 @ case 33
	.4byte _08030224 @ case 34
	.4byte _08030224 @ case 35
	.4byte _08030226 @ case 36
	.4byte _08030224 @ case 37
	.4byte _08030224 @ case 38
	.4byte _08030226 @ case 39
	.4byte _08030224 @ case 40
	.4byte _08030224 @ case 41
	.4byte _08030226 @ case 42
	.4byte _08030224 @ case 43
	.4byte _08030224 @ case 44
	.4byte _08030226 @ case 45
_08030224:
	movs r2, #0
_08030226:
	cmp r2, #0
	beq _0803023A
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartVertical
_0803023A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PreBoxCeilingDebrisCheckSamusInRange
PreBoxCeilingDebrisCheckSamusInRange: @ 0x08030240
	push {r4, r5, r6, lr}
	ldr r3, _08030274 @ =gSamusData
	ldrh r2, [r3, #0x18]
	subs r2, #4
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldrh r3, [r3, #0x16]
	ldr r2, _08030278 @ =gCurrentSprite
	ldrh r4, [r2, #2]
	ldrh r2, [r2, #4]
	lsls r0, r0, #0x16
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x16
	lsrs r0, r1, #0x10
	cmp r2, r3
	bhs _0803027C
	adds r0, r2, r0
	cmp r3, r0
	bge _0803027C
	cmp r4, r6
	bhs _0803027C
	adds r0, r4, r5
	cmp r6, r0
	bge _0803027C
	movs r0, #1
	b _0803027E
	.align 2, 0
_08030274: .4byte gSamusData
_08030278: .4byte gCurrentSprite
_0803027C:
	movs r0, #0
_0803027E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start ShakeTrigger
ShakeTrigger: @ 0x08030284
	push {r4, r5, lr}
	ldr r1, _080302AC @ =gCurrentSprite
	ldrb r4, [r1, #0x1e]
	adds r2, r1, #0
	adds r2, #0x26
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	adds r2, r1, #0
	cmp r0, #0x1c
	bls _080302A0
	b _08030560
_080302A0:
	lsls r0, r0, #2
	ldr r1, _080302B0 @ =_080302B4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080302AC: .4byte gCurrentSprite
_080302B0: .4byte _080302B4
_080302B4: @ jump table
	.4byte _08030328 @ case 0
	.4byte _08030560 @ case 1
	.4byte _080303CC @ case 2
	.4byte _08030560 @ case 3
	.4byte _08030560 @ case 4
	.4byte _08030560 @ case 5
	.4byte _08030560 @ case 6
	.4byte _08030560 @ case 7
	.4byte _08030560 @ case 8
	.4byte _08030560 @ case 9
	.4byte _08030560 @ case 10
	.4byte _08030560 @ case 11
	.4byte _08030560 @ case 12
	.4byte _08030560 @ case 13
	.4byte _08030560 @ case 14
	.4byte _08030560 @ case 15
	.4byte _08030560 @ case 16
	.4byte _08030560 @ case 17
	.4byte _08030560 @ case 18
	.4byte _08030560 @ case 19
	.4byte _08030560 @ case 20
	.4byte _08030560 @ case 21
	.4byte _08030560 @ case 22
	.4byte _08030560 @ case 23
	.4byte _080304C8 @ case 24
	.4byte _08030560 @ case 25
	.4byte _08030520 @ case 26
	.4byte _08030560 @ case 27
	.4byte _0803055C @ case 28
_08030328:
	bl EventCheckOn_EnteredSuperMissileDataRoom
	cmp r0, #0
	beq _08030334
	movs r4, #0
	b _0803036E
_08030334:
	bl EventCheckOn_BombsDownloaded
	cmp r0, #0
	beq _08030340
	movs r4, #1
	b _0803036E
_08030340:
	bl EventCheckOn_WaveBeamRecovered
	cmp r0, #0
	beq _0803034C
	movs r4, #2
	b _0803036E
_0803034C:
	bl EventCheckOn_RestrictedLabExplosion
	cmp r0, #0
	beq _08030358
	movs r4, #3
	b _0803036E
_08030358:
	bl EventCheckOn_RestrictedZoneWarning
	adds r1, r0, #0
	cmp r1, #0
	bne _0803036C
	ldr r0, _08030368 @ =gCurrentSprite
	strh r1, [r0]
	b _08030560
	.align 2, 0
_08030368: .4byte gCurrentSprite
_0803036C:
	movs r4, #4
_0803036E:
	ldr r3, _080303BC @ =gCurrentSprite
	movs r2, #0
	strb r4, [r3, #0x1e]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x27
	movs r1, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r4, #0
	ldr r1, _080303C0 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	ldr r0, _080303C4 @ =0x08337E0C
	str r0, [r3, #0x18]
	strb r4, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _080303C8 @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	beq _080303B2
	b _08030560
_080303B2:
	ldrh r0, [r3]
	movs r1, #4
	orrs r0, r1
	strh r0, [r3]
	b _08030560
	.align 2, 0
_080303BC: .4byte gCurrentSprite
_080303C0: .4byte 0x0000FFFC
_080303C4: .4byte 0x08337E0C
_080303C8: .4byte gDebugFlag
_080303CC:
	cmp r4, #0
	bne _08030404
	bl EventCheckOn_SuperMissileDownloaded
	cmp r0, #0
	bne _080303DA
	b _08030560
_080303DA:
	ldr r5, _080303FC @ =gCurrentSprite
	adds r1, r5, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x14
	strb r0, [r1]
	movs r0, #0x8b
	lsls r0, r0, #2
	bl unk_3b1c
	ldr r0, _08030400 @ =0x08337DF4
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	strh r4, [r5, #0x16]
	b _08030560
	.align 2, 0
_080303FC: .4byte gCurrentSprite
_08030400: .4byte 0x08337DF4
_08030404:
	cmp r4, #1
	bne _08030430
	bl EventCheckOn_BombsQuake
	cmp r0, #0
	bne _08030412
	b _08030560
_08030412:
	ldr r3, _08030428 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #8
	strb r0, [r1]
	ldr r0, _0803042C @ =0x08337DF4
	b _08030484
	.align 2, 0
_08030428: .4byte gCurrentSprite
_0803042C: .4byte 0x08337DF4
_08030430:
	cmp r4, #4
	bne _0803045C
	bl EventCheckOn_TriggeredBox2Rumble
	cmp r0, #0
	bne _0803043E
	b _08030560
_0803043E:
	ldr r3, _08030454 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x18
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #8
	strb r0, [r1]
	ldr r0, _08030458 @ =0x08337DF4
	b _08030484
	.align 2, 0
_08030454: .4byte gCurrentSprite
_08030458: .4byte 0x08337DF4
_0803045C:
	cmp r4, #2
	bne _08030494
	bl EventCheckOn_RestrictedLabExplosion
	cmp r0, #0
	bne _0803046A
	b _08030560
_0803046A:
	ldr r3, _0803048C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x1a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x14
	strb r0, [r1]
	ldr r0, _08030490 @ =0x08337E1C
_08030484:
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	b _08030560
	.align 2, 0
_0803048C: .4byte gCurrentSprite
_08030490: .4byte 0x08337E1C
_08030494:
	cmp r4, #3
	bne _08030560
	bl EventCheckOn_RestrictedLabExplosion
	cmp r0, #0
	beq _08030560
	ldr r1, _080304BC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _080304C0 @ =0x08337E1C
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _080304C4 @ =0x00000239
	bl SoundPlay
	b _08030560
	.align 2, 0
_080304BC: .4byte gCurrentSprite
_080304C0: .4byte 0x08337E1C
_080304C4: .4byte 0x00000239
_080304C8:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08030560
	subs r1, #0xa
	movs r0, #0x4e
	strb r0, [r1]
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartHorizontal
	movs r0, #0x3c
	movs r1, #0x81
	bl ScreenShakeStartVertical
	cmp r4, #0
	bne _08030500
	ldr r0, _080304FC @ =0x0000022D
	bl SoundPlay
	b _08030560
	.align 2, 0
_080304FC: .4byte 0x0000022D
_08030500:
	cmp r4, #1
	bne _08030510
	ldr r0, _0803050C @ =0x0000022B
	bl unk_3b1c
	b _08030560
	.align 2, 0
_0803050C: .4byte 0x0000022B
_08030510:
	cmp r4, #4
	bne _08030560
	ldr r0, _0803051C @ =0x00000237
	bl unk_3b1c
	b _08030560
	.align 2, 0
_0803051C: .4byte 0x00000237
_08030520:
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _08030530
	subs r0, #1
	strb r0, [r1]
	b _08030560
_08030530:
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803055C
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _08030560
	strb r0, [r2, #0x1c]
	strh r0, [r2, #0x16]
	movs r0, #0x27
	movs r1, #0xa
	bl PlayMusic
	movs r0, #0x8e
	lsls r0, r0, #2
	bl SoundPlay
	b _08030560
_0803055C:
	bl ShakeTriggerStartScreenShake
_08030560:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start PreBoxCeilingDebris
PreBoxCeilingDebris: @ 0x08030568
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _08030590 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #2
	beq _0803060C
	cmp r0, #2
	bgt _08030594
	cmp r0, #0
	beq _0803059E
	b _08030808
	.align 2, 0
_08030590: .4byte gCurrentSprite
_08030594:
	cmp r0, #0x18
	beq _08030644
	cmp r0, #0x1a
	beq _08030668
	b _08030808
_0803059E:
	bl EventCheckOn_SuperMissileDownloaded
	cmp r0, #0
	bne _080305A8
	b _080306B8
_080305A8:
	ldrh r0, [r4, #2]
	subs r0, #0x40
	movs r2, #0
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	adds r0, r4, #0
	adds r0, #0x21
	movs r1, #1
	strb r1, [r0]
	adds r0, #4
	strb r2, [r0]
	movs r0, #2
	strb r0, [r5]
	adds r0, r4, #0
	adds r0, #0x27
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0x70
	strb r0, [r1]
	ldr r1, _08030600 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	ldr r0, _08030604 @ =0x08337E0C
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldr r0, _08030608 @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	beq _080305F6
	b _08030808
_080305F6:
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4]
	b _08030808
	.align 2, 0
_08030600: .4byte 0x0000FFFC
_08030604: .4byte 0x08337E0C
_08030608: .4byte gDebugFlag
_0803060C:
	movs r0, #6
	movs r1, #6
	bl PreBoxCeilingDebrisCheckSamusInRange
	cmp r0, #0
	bne _0803061A
	b _08030808
_0803061A:
	bl EventCheckOn_BoxRumble
	cmp r0, #0
	bne _08030624
	b _08030808
_08030624:
	movs r0, #0x18
	strb r0, [r5]
	ldr r0, _08030640 @ =0x08337DF4
	str r0, [r4, #0x18]
	movs r0, #0
	strb r0, [r4, #0x1c]
	movs r1, #0
	strh r1, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	b _08030808
	.align 2, 0
_08030640: .4byte 0x08337DF4
_08030644:
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r1, r0, #1
	strb r1, [r2]
	movs r3, #0xff
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08030658
	b _08030808
_08030658:
	movs r0, #0x1a
	strb r0, [r5]
	orrs r1, r3
	strb r1, [r2]
	movs r0, #0xd2
	lsls r0, r0, #1
	strh r0, [r4, #6]
	b _08030808
_08030668:
	movs r0, #0x2e
	adds r0, r0, r4
	mov sb, r0
	ldrb r0, [r0]
	adds r0, #1
	mov r1, sb
	strb r0, [r1]
	ldr r0, _080306C0 @ =gXParasiteTargetXPosition
	ldrb r0, [r0]
	movs r1, #0xf
	mov sl, r1
	ands r1, r0
	mov sl, r1
	ldr r0, _080306C4 @ =gXParasiteTargetYPosition
	ldrb r0, [r0]
	movs r1, #0x1f
	mov r8, r1
	ands r1, r0
	mov r8, r1
	ldr r0, _080306C8 @ =gFrameCounter8Bit
	ldrb r5, [r0]
	cmp r5, #7
	bhi _0803069E
	adds r0, r5, #0
	adds r0, #8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0803069E:
	ldrh r7, [r4, #2]
	ldrh r6, [r4, #4]
	adds r0, r6, #4
	strh r0, [r4, #4]
	adds r0, r7, #0
	adds r0, #0x80
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080306CC @ =gPreviousCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080306D0
_080306B8:
	movs r0, #0
	strh r0, [r4]
	b _08030808
	.align 2, 0
_080306C0: .4byte gXParasiteTargetXPosition
_080306C4: .4byte gXParasiteTargetYPosition
_080306C8: .4byte gSpriteRandomNumber
_080306CC: .4byte gPreviousCollisionCheck
_080306D0:
	mov r0, sb
	ldrb r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	cmp r0, #0
	beq _080306DE
	b _08030808
_080306DE:
	movs r0, #0x28
	movs r1, #0x81
	bl ScreenShakeStartVertical
	ldr r0, _08030718 @ =0x0000022E
	bl unk_3b1c
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _080306F8
	b _08030808
_080306F8:
	adds r0, r5, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0803071C
	adds r2, r5, #0
	subs r2, #0x6c
	adds r2, r7, r2
	lsls r3, r5, #5
	adds r3, #0x14
	adds r3, r6, r3
	movs r0, #0
	movs r1, #5
	bl SpriteDebrisInit
	b _08030730
	.align 2, 0
_08030718: .4byte 0x0000022E
_0803071C:
	adds r2, r5, #0
	subs r2, #0x64
	adds r2, r7, r2
	lsls r3, r5, #4
	adds r3, #0x1a
	adds r3, r6, r3
	movs r0, #0
	movs r1, #7
	bl SpriteDebrisInit
_08030730:
	ldr r0, _08030750 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #7
	bls _08030754
	adds r2, r5, #0
	subs r2, #0x50
	adds r2, r7, r2
	lsls r3, r5, #1
	adds r3, #0x12
	subs r3, r6, r3
	movs r0, #0
	movs r1, #8
	bl SpriteDebrisInit
	b _0803077C
	.align 2, 0
_08030750: .4byte gSpriteRandomNumber
_08030754:
	adds r2, r5, #0
	subs r2, #0x5a
	adds r2, r7, r2
	lsls r3, r5, #2
	adds r3, #0x12
	subs r3, r6, r3
	movs r0, #0
	movs r1, #6
	bl SpriteDebrisInit
	mov r2, r8
	subs r2, #0x78
	adds r2, r7, r2
	mov r0, sl
	lsls r3, r0, #3
	subs r3, r6, r3
	movs r0, #0
	movs r1, #5
	bl SpriteDebrisInit
_0803077C:
	ldr r0, _080307A8 @ =gCurrentSprite
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08030808
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	beq _080307AC
	mov r2, r8
	subs r2, #0x78
	adds r2, r7, r2
	mov r1, sl
	lsls r3, r1, #6
	subs r3, r6, r3
	movs r0, #0
	movs r1, #6
	bl SpriteDebrisInit
	b _080307C0
	.align 2, 0
_080307A8: .4byte gCurrentSprite
_080307AC:
	mov r2, r8
	subs r2, #0x50
	adds r2, r7, r2
	mov r0, sl
	lsls r3, r0, #4
	subs r3, r6, r3
	movs r0, #0
	movs r1, #8
	bl SpriteDebrisInit
_080307C0:
	ldr r0, _080307F0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _080307F4
	mov r2, r8
	subs r2, #0x58
	adds r2, r7, r2
	mov r1, sl
	lsls r3, r1, #2
	adds r3, r6, r3
	movs r0, #0
	movs r1, #5
	bl SpriteDebrisInit
	adds r2, r5, #0
	subs r2, #0x64
	adds r2, r7, r2
	lsls r3, r5, #3
	subs r3, r6, r3
	movs r0, #0
	movs r1, #6
	bl SpriteDebrisInit
	b _08030808
	.align 2, 0
_080307F0: .4byte gSpriteRandomNumber
_080307F4:
	mov r2, r8
	subs r2, #0x6e
	adds r2, r7, r2
	mov r0, sl
	lsls r3, r0, #1
	adds r3, r6, r3
	movs r0, #0
	movs r1, #7
	bl SpriteDebrisInit
_08030808:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
