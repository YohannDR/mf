    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start OmegaMetroidHuskSetInvisibleWallCollision
OmegaMetroidHuskSetInvisibleWallCollision: @ 0x08058534
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
	ldr r0, _0805865C @ =sOmegaMetroidHuskOam_Idle
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
_0805865C: .4byte sOmegaMetroidHuskOam_Idle

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
	bl OmegaMetroidHuskSetInvisibleWallCollision
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
	ldr r0, _080587D8 @ =sOmegaMetroidHuskOam_GettingCrushed
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	ldr r0, _080587DC @ =0x00000225
	bl SoundPlay
	pop {r0}
	bx r0
	.align 2, 0
_080587D4: .4byte gCurrentSprite
_080587D8: .4byte sOmegaMetroidHuskOam_GettingCrushed
_080587DC: .4byte 0x00000225

	thumb_func_start OmegaMetroidHuskGettingCrushed
OmegaMetroidHuskGettingCrushed: @ 0x080587E0
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08058804
	ldr r0, _08058808 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x24
	movs r3, #0
	movs r1, #0x1a
	strb r1, [r2]
	ldr r1, _0805880C @ =sOmegaMetroidHuskOam_Crushed
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
_0805880C: .4byte sOmegaMetroidHuskOam_Crushed

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
