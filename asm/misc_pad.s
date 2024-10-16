    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start MiscPadInit
MiscPadInit: @ 0x08039248
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r5, #0
	ldr r3, _0803929C @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _080392A0 @ =0x0000FFFC
	strh r1, [r3, #0xa]
	movs r0, #4
	strh r0, [r3, #0xc]
	strh r1, [r3, #0xe]
	strh r0, [r3, #0x10]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #1
	strb r0, [r1]
	ldrb r0, [r3, #0x1d]
	adds r4, r3, #0
	cmp r0, #0x66
	beq _080392B4
	cmp r0, #0x66
	bgt _080392A4
	cmp r0, #0x65
	beq _080392AE
	b _080392FC
	.align 2, 0
_0803929C: .4byte gCurrentSprite
_080392A0: .4byte 0x0000FFFC
_080392A4:
	cmp r0, #0x67
	beq _080392DC
	cmp r0, #0x68
	beq _080392E6
	b _080392FC
_080392AE:
	bl EventCheckOn_EnteredPumpControlUnit
	b _080392E0
_080392B4:
	bl EventCheckOn_Meltdown
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #1
	bne _08039302
	ldrb r1, [r4, #0x1e]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x53
	movs r2, #0
	movs r3, #0x10
	bl SpriteSpawnPrimary
	movs r5, #0
	b _08039302
_080392DC:
	bl EventCheckOn_SpaceJumpRecovered
_080392E0:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	b _08039302
_080392E6:
	bl EventCheckOn_NavigationRoomLeavingPyr2
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r1, _080392F8 @ =gAbilityRestingXPosition
	ldrh r0, [r4, #4]
	strh r0, [r1]
	b _08039302
	.align 2, 0
_080392F8: .4byte gAbilityRestingXPosition
_080392FC:
	movs r0, #0
	strh r0, [r4]
	b _0803937E
_08039302:
	ldr r4, _08039330 @ =gCurrentSprite
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x33
	movs r1, #0
	bl SpriteSpawnSecondary
	cmp r5, #0
	beq _08039334
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	b _0803933A
	.align 2, 0
_08039330: .4byte gCurrentSprite
_08039334:
	adds r0, r4, #0
	adds r0, #0x2f
	strb r5, [r0]
_0803933A:
	ldr r6, _08039388 @ =gCurrentSprite
	ldrb r0, [r6, #0x1d]
	cmp r0, #0x68
	bne _0803937E
	adds r7, r6, #0
	adds r7, #0x23
	ldrb r3, [r7]
	ldrh r0, [r6, #2]
	str r0, [sp]
	ldrh r0, [r6, #4]
	ldr r5, _0803938C @ =0xFFFFFF00
	adds r0, r0, r5
	str r0, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #0x68
	movs r1, #0
	movs r2, #4
	bl SpriteSpawnSecondary
	ldrb r3, [r7]
	ldrh r0, [r6, #2]
	str r0, [sp]
	ldrh r0, [r6, #4]
	adds r0, r0, r5
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x67
	movs r1, #0
	movs r2, #4
	bl SpriteSpawnSecondary
	ldr r1, _08039390 @ =gBossWork2
	strb r0, [r1]
_0803937E:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08039388: .4byte gCurrentSprite
_0803938C: .4byte 0xFFFFFF00
_08039390: .4byte gBossWork2

	thumb_func_start MiscPadIdleInit
MiscPadIdleInit: @ 0x08039394
	push {lr}
	ldr r1, _080393BC @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080393D4
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x68
	bne _080393C4
	ldr r0, _080393C0 @ =0x0834AD8C
	b _080393C6
	.align 2, 0
_080393BC: .4byte gCurrentSprite
_080393C0: .4byte 0x0834AD8C
_080393C4:
	ldr r0, _080393D0 @ =0x0834A0F4
_080393C6:
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x46
	b _080393EC
	.align 2, 0
_080393D0: .4byte 0x0834A0F4
_080393D4:
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x68
	bne _080393E4
	ldr r0, _080393E0 @ =0x0834AD7C
	b _080393E6
	.align 2, 0
_080393E0: .4byte 0x0834AD7C
_080393E4:
	ldr r0, _080393F4 @ =0x0834A0E4
_080393E6:
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #2
_080393EC:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080393F4: .4byte 0x0834A0E4

	thumb_func_start MiscPadIdle
MiscPadIdle: @ 0x080393F8
	push {lr}
	bl NavPadDetectSamus
	cmp r0, #0
	beq _08039448
	ldr r1, _08039420 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	adds r3, r1, #0
	cmp r0, #0
	bne _08039450
	ldrb r0, [r3, #0x1d]
	cmp r0, #0x68
	bne _08039428
	ldr r0, _08039424 @ =0x0834AD2C
	b _0803942A
	.align 2, 0
_08039420: .4byte gCurrentSprite
_08039424: .4byte 0x0834AD2C
_08039428:
	ldr r0, _08039444 @ =0x0834A094
_0803942A:
	str r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, #0xe9
	bl SoundPlay
	b _08039450
	.align 2, 0
_08039444: .4byte 0x0834A094
_08039448:
	ldr r0, _08039454 @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
_08039450:
	pop {r0}
	bx r0
	.align 2, 0
_08039454: .4byte gCurrentSprite

	thumb_func_start MiscPadPressingSwitch
MiscPadPressingSwitch: @ 0x08039458
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803948A
	ldr r0, _08039470 @ =gCurrentSprite
	ldrb r1, [r0, #0x1d]
	adds r3, r0, #0
	cmp r1, #0x68
	bne _08039478
	ldr r0, _08039474 @ =0x0834AD8C
	b _0803947A
	.align 2, 0
_08039470: .4byte gCurrentSprite
_08039474: .4byte 0x0834AD8C
_08039478:
	ldr r0, _08039490 @ =0x0834A0F4
_0803947A:
	str r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x1a
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
_0803948A:
	pop {r0}
	bx r0
	.align 2, 0
_08039490: .4byte 0x0834A0F4

	thumb_func_start MiscPadSwitchPressed
MiscPadSwitchPressed: @ 0x08039494
	push {r4, lr}
	bl NavPadDetectSamus
	cmp r0, #0
	beq _080394E4
	bl SpriteUtilCheckMorphed
	cmp r0, #0
	bne _08039514
	ldr r2, _080394D8 @ =gSamusData
	ldr r4, _080394DC @ =gCurrentSprite
	ldrh r0, [r4, #4]
	strh r0, [r2, #0x16]
	ldrb r0, [r2, #5]
	cmp r0, #0
	beq _080394B8
	movs r0, #0
	strb r0, [r2, #5]
_080394B8:
	ldr r1, _080394E0 @ =sSamusSetPoseFunctionPointer
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x36
	bl _call_via_r1
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x14
	strb r0, [r1]
	b _08039514
	.align 2, 0
_080394D8: .4byte gSamusData
_080394DC: .4byte gCurrentSprite
_080394E0: .4byte sSamusSetPoseFunctionPointer
_080394E4:
	ldr r0, _080394F4 @ =gCurrentSprite
	ldrb r1, [r0, #0x1d]
	adds r3, r0, #0
	cmp r1, #0x68
	bne _080394FC
	ldr r0, _080394F8 @ =0x0834AD54
	b _080394FE
	.align 2, 0
_080394F4: .4byte gCurrentSprite
_080394F8: .4byte 0x0834AD54
_080394FC:
	ldr r0, _0803951C @ =0x0834A0BC
_080394FE:
	str r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x1c
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r0, #0xe6
	bl SoundPlay
_08039514:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803951C: .4byte 0x0834A0BC

	thumb_func_start MiscPadReleasingSwitch
MiscPadReleasingSwitch: @ 0x08039520
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0803952E
	bl MiscPadIdleInit
_0803952E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MiscPadSamusInteracting
MiscPadSamusInteracting: @ 0x08039534
	push {r4, lr}
	ldr r2, _08039564 @ =gCurrentSprite
	adds r4, r2, #0
	adds r4, #0x2e
	ldrb r0, [r4]
	cmp r0, #0
	beq _0803957C
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039552
	ldr r0, _08039568 @ =0x00000103
	bl SoundPlay
_08039552:
	ldrb r0, [r4]
	cmp r0, #7
	bhi _0803956C
	adds r2, r0, #0
	movs r0, #0x21
	movs r1, #2
	bl SpriteLoadGfx
	b _0803959A
	.align 2, 0
_08039564: .4byte gCurrentSprite
_08039568: .4byte 0x00000103
_0803956C:
	cmp r0, #8
	bne _0803959A
	movs r0, #0x21
	movs r1, #2
	movs r2, #2
	bl SpriteLoadPal
	b _0803959A
_0803957C:
	ldr r1, _080395A0 @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x36
	bne _0803959A
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _0803959A
	adds r0, r2, #0
	adds r0, #0x24
	movs r1, #0x3a
	strb r1, [r0]
	movs r0, #0x1e
	strb r0, [r4]
_0803959A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080395A0: .4byte gSamusData

	thumb_func_start MiscPadSpawnMessageBanner
MiscPadSpawnMessageBanner: @ 0x080395A4
	push {lr}
	sub sp, #0xc
	movs r3, #0
	ldr r2, _080395D4 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08039632
	subs r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	ldrb r1, [r2, #0x1d]
	cmp r1, #0x66
	beq _080395EC
	cmp r1, #0x66
	bgt _080395D8
	cmp r1, #0x65
	beq _080395E2
	b _08039608
	.align 2, 0
_080395D4: .4byte gCurrentSprite
_080395D8:
	cmp r1, #0x67
	beq _080395F6
	cmp r1, #0x68
	beq _08039600
	b _08039608
_080395E2:
	movs r0, #0x20
	bl EventCheckAdvance
	movs r3, #6
	b _0803960C
_080395EC:
	movs r0, #0x3d
	bl EventCheckAdvance
	movs r3, #7
	b _0803960C
_080395F6:
	movs r0, #0x4a
	bl EventCheckAdvance
	movs r3, #9
	b _0803960C
_08039600:
	movs r0, #0x3f
	bl EventCheckAdvance
	movs r3, #8
_08039608:
	cmp r3, #0
	beq _08039632
_0803960C:
	ldr r1, _08039638 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0803963C @ =gXParasiteTargetYPosition
	ldrh r0, [r0]
	str r0, [sp]
	ldr r0, _08039640 @ =gXParasiteTargetXPosition
	ldrh r0, [r0]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x21
	adds r1, r3, #0
	movs r2, #2
	movs r3, #0x10
	bl SpriteSpawnPrimary
_08039632:
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08039638: .4byte gPreventMovementTimer
_0803963C: .4byte gXParasiteTargetYPosition
_08039640: .4byte gXParasiteTargetXPosition

	thumb_func_start MiscPadAfterInteraction
MiscPadAfterInteraction: @ 0x08039644
	push {lr}
	ldr r1, _08039660 @ =gCurrentSprite
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x68
	bne _08039672
	ldr r0, _08039664 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3b
	bne _08039668
	adds r1, #0x24
	movs r0, #0x20
	strb r0, [r1]
	b _08039672
	.align 2, 0
_08039660: .4byte gCurrentSprite
_08039664: .4byte gSamusData
_08039668:
	ldr r1, _08039678 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
_08039672:
	pop {r0}
	bx r0
	.align 2, 0
_08039678: .4byte gPreventMovementTimer

	thumb_func_start MiscPadInactive
MiscPadInactive: @ 0x0803967C
	bx lr
	.align 2, 0

	thumb_func_start MiscPadWaitForWideBeamCoreX
MiscPadWaitForWideBeamCoreX: @ 0x08039680
	push {r4, lr}
	ldr r4, _080396C8 @ =gCurrentSprite
	ldrb r0, [r4, #0x1d]
	cmp r0, #0x66
	bne _080396C2
	bl EventCheckOn_Meltdown
	cmp r0, #2
	bne _080396C2
	movs r0, #0x57
	bl SpriteUtilCountPrimarySprites
	cmp r0, #0
	bne _080396C2
	ldr r0, _080396CC @ =gPreventMovementTimer
	ldrh r2, [r0]
	cmp r2, #0
	bne _080396C2
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	subs r1, #0xb
	movs r0, #0x1c
	strb r0, [r1]
	ldr r0, _080396D0 @ =0x0834A0BC
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	movs r0, #0x81
	lsls r0, r0, #1
	bl SoundPlay
_080396C2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080396C8: .4byte gCurrentSprite
_080396CC: .4byte gPreventMovementTimer
_080396D0: .4byte 0x0834A0BC

	thumb_func_start MiscPadConsoleInit
MiscPadConsoleInit: @ 0x080396D4
	push {r4, r5, lr}
	ldr r0, _0803974C @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r4, [r0]
	mov r2, ip
	ldrh r1, [r2]
	ldr r0, _08039750 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	movs r5, #0
	strh r0, [r2]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08039754 @ =0x0000FFFC
	mov r0, ip
	strh r1, [r0, #0xa]
	movs r0, #4
	mov r2, ip
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	strb r3, [r2, #0x1c]
	strh r5, [r2, #0x16]
	ldr r1, _08039758 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r1, [r0, #0x1d]
	mov r4, ip
	cmp r1, #0x66
	bne _08039760
	bl EventCheckOn_Meltdown
	cmp r0, #0
	beq _08039790
	ldr r0, _0803975C @ =0x0834A044
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	b _0803979A
	.align 2, 0
_0803974C: .4byte gCurrentSprite
_08039750: .4byte 0x0000FFFB
_08039754: .4byte 0x0000FFFC
_08039758: .4byte gSpriteData
_0803975C: .4byte 0x0834A044
_08039760:
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _08039784
	cmp r1, #0x68
	bne _08039774
	ldr r0, _08039770 @ =0x0834ACDC
	b _08039776
	.align 2, 0
_08039770: .4byte 0x0834ACDC
_08039774:
	ldr r0, _08039780 @ =0x0834A044
_08039776:
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #2
	b _0803979A
	.align 2, 0
_08039780: .4byte 0x0834A044
_08039784:
	cmp r1, #0x68
	bne _08039790
	ldr r0, _0803978C @ =0x0834AD04
	b _08039792
	.align 2, 0
_0803978C: .4byte 0x0834AD04
_08039790:
	ldr r0, _080397A4 @ =0x0834A06C
_08039792:
	str r0, [r4, #0x18]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
_0803979A:
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080397A4: .4byte 0x0834A06C

	thumb_func_start MiscPadConsoleIdle
MiscPadConsoleIdle: @ 0x080397A8
	push {lr}
	ldr r3, _080397D0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _080397D4 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _080397EE
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x68
	bne _080397DC
	ldr r0, _080397D8 @ =0x0834AD04
	b _080397DE
	.align 2, 0
_080397D0: .4byte gCurrentSprite
_080397D4: .4byte gSpriteData
_080397D8: .4byte 0x0834AD04
_080397DC:
	ldr r0, _080397F4 @ =0x0834A06C
_080397DE:
	str r0, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
_080397EE:
	pop {r0}
	bx r0
	.align 2, 0
_080397F4: .4byte 0x0834A06C

	thumb_func_start MiscPad
MiscPad: @ 0x080397F8
	push {lr}
	ldr r0, _08039818 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x46
	bls _0803980E
	b _0803997A
_0803980E:
	lsls r0, r0, #2
	ldr r1, _0803981C @ =_08039820
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08039818: .4byte gCurrentSprite
_0803981C: .4byte _08039820
_08039820: @ jump table
	.4byte _0803993C @ case 0
	.4byte _08039940 @ case 1
	.4byte _08039946 @ case 2
	.4byte _0803997A @ case 3
	.4byte _0803997A @ case 4
	.4byte _0803997A @ case 5
	.4byte _0803997A @ case 6
	.4byte _0803997A @ case 7
	.4byte _0803997A @ case 8
	.4byte _0803997A @ case 9
	.4byte _0803997A @ case 10
	.4byte _0803997A @ case 11
	.4byte _0803997A @ case 12
	.4byte _0803997A @ case 13
	.4byte _0803997A @ case 14
	.4byte _0803997A @ case 15
	.4byte _0803997A @ case 16
	.4byte _0803997A @ case 17
	.4byte _0803997A @ case 18
	.4byte _0803997A @ case 19
	.4byte _0803997A @ case 20
	.4byte _0803997A @ case 21
	.4byte _0803997A @ case 22
	.4byte _0803997A @ case 23
	.4byte _0803994C @ case 24
	.4byte _0803997A @ case 25
	.4byte _08039952 @ case 26
	.4byte _0803997A @ case 27
	.4byte _08039958 @ case 28
	.4byte _0803997A @ case 29
	.4byte _0803995E @ case 30
	.4byte _0803997A @ case 31
	.4byte _08039964 @ case 32
	.4byte _0803997A @ case 33
	.4byte _0803997A @ case 34
	.4byte _0803997A @ case 35
	.4byte _0803997A @ case 36
	.4byte _0803997A @ case 37
	.4byte _0803997A @ case 38
	.4byte _0803997A @ case 39
	.4byte _0803997A @ case 40
	.4byte _0803997A @ case 41
	.4byte _0803997A @ case 42
	.4byte _0803997A @ case 43
	.4byte _0803997A @ case 44
	.4byte _0803997A @ case 45
	.4byte _0803997A @ case 46
	.4byte _0803997A @ case 47
	.4byte _0803997A @ case 48
	.4byte _0803997A @ case 49
	.4byte _0803997A @ case 50
	.4byte _0803997A @ case 51
	.4byte _0803997A @ case 52
	.4byte _0803997A @ case 53
	.4byte _0803997A @ case 54
	.4byte _0803997A @ case 55
	.4byte _0803996A @ case 56
	.4byte _0803997A @ case 57
	.4byte _08039970 @ case 58
	.4byte _0803997A @ case 59
	.4byte _0803997A @ case 60
	.4byte _0803997A @ case 61
	.4byte _0803997A @ case 62
	.4byte _0803997A @ case 63
	.4byte _0803997A @ case 64
	.4byte _0803997A @ case 65
	.4byte _0803997A @ case 66
	.4byte _0803997A @ case 67
	.4byte _0803997A @ case 68
	.4byte _0803997A @ case 69
	.4byte _08039976 @ case 70
_0803993C:
	bl MiscPadInit
_08039940:
	bl MiscPadIdleInit
	b _0803997A
_08039946:
	bl MiscPadIdle
	b _0803997A
_0803994C:
	bl MiscPadPressingSwitch
	b _0803997A
_08039952:
	bl MiscPadSwitchPressed
	b _0803997A
_08039958:
	bl MiscPadReleasingSwitch
	b _0803997A
_0803995E:
	bl MiscPadAfterInteraction
	b _0803997A
_08039964:
	bl MiscPadInactive
	b _0803997A
_0803996A:
	bl MiscPadSamusInteracting
	b _0803997A
_08039970:
	bl MiscPadSpawnMessageBanner
	b _0803997A
_08039976:
	bl MiscPadWaitForWideBeamCoreX
_0803997A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MiscPadConsole
MiscPadConsole: @ 0x08039980
	push {lr}
	ldr r0, _0803999C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _080399A0
	cmp r0, #2
	beq _080399A6
	b _080399AA
	.align 2, 0
_0803999C: .4byte gCurrentSprite
_080399A0:
	bl MiscPadConsoleInit
	b _080399AA
_080399A6:
	bl MiscPadConsoleIdle
_080399AA:
	pop {r0}
	bx r0
	.align 2, 0
