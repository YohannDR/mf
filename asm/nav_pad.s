    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start NavPadDetectSamus
NavPadDetectSamus: @ 0x0802A0B8
	push {r4, lr}
	movs r4, #0
	ldr r0, _0802A0E8 @ =gSamusData
	ldrh r2, [r0, #0x18]
	ldrh r3, [r0, #0x16]
	ldr r1, _0802A0EC @ =gCurrentSprite
	ldrh r0, [r1, #2]
	ldrh r1, [r1, #4]
	subs r0, #1
	cmp r2, r0
	bne _0802A0DE
	adds r0, r1, #0
	subs r0, #0x40
	cmp r0, r3
	bge _0802A0DE
	adds r0, #0x80
	cmp r0, r3
	ble _0802A0DE
	movs r4, #1
_0802A0DE:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0802A0E8: .4byte gSamusData
_0802A0EC: .4byte gCurrentSprite

	thumb_func_start NavPadDetectSamus_Unused
NavPadDetectSamus_Unused: @ 0x0802A0F0
	push {lr}
	movs r3, #0
	ldr r0, _0802A114 @ =gSamusData
	ldrh r2, [r0, #0x16]
	ldr r0, _0802A118 @ =gCurrentSprite
	ldrh r1, [r0, #4]
	adds r0, r1, #0
	subs r0, #0xa0
	cmp r0, r2
	bge _0802A10E
	adds r0, r1, #0
	adds r0, #0xa0
	cmp r0, r2
	ble _0802A10E
	movs r3, #1
_0802A10E:
	adds r0, r3, #0
	pop {r1}
	bx r1
	.align 2, 0
_0802A114: .4byte gSamusData
_0802A118: .4byte gCurrentSprite

	thumb_func_start NavPadInit
NavPadInit: @ 0x0802A11C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, _0802A18C @ =gCurrentSprite
	adds r2, r5, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r4, #0
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _0802A190 @ =0x0000FFFC
	strh r1, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	adds r0, r5, #0
	adds r0, #0x21
	movs r7, #1
	strb r7, [r0]
	ldrb r2, [r5, #0x1f]
	adds r6, r5, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #7
	movs r1, #0
	bl SpriteSpawnSecondary
	bl EventCheckWith_NavigationDisabled
	adds r4, r0, #0
	cmp r4, #0
	beq _0802A194
	adds r0, r5, #0
	adds r0, #0x2f
	strb r7, [r0]
	b _0802A1B2
	.align 2, 0
_0802A18C: .4byte gCurrentSprite
_0802A190: .4byte 0x0000FFFC
_0802A194:
	adds r1, r5, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	str r0, [sp]
	ldrh r0, [r5, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #8
	movs r1, #0
	bl SpriteSpawnSecondary
_0802A1B2:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavPadIdleInit
NavPadIdleInit: @ 0x0802A1BC
	push {lr}
	ldr r1, _0802A1E4 @ =gCurrentSprite
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
	beq _0802A1EC
	ldr r0, _0802A1E8 @ =0x0831E380
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x46
	b _0802A1F4
	.align 2, 0
_0802A1E4: .4byte gCurrentSprite
_0802A1E8: .4byte 0x0831E380
_0802A1EC:
	ldr r0, _0802A1FC @ =0x0831E318
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #2
_0802A1F4:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802A1FC: .4byte 0x0831E318

	thumb_func_start NavPadIdle
NavPadIdle: @ 0x0802A200
	push {lr}
	bl NavPadDetectSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A244
	ldr r3, _0802A238 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802A24C
	subs r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0802A23C @ =0x0831E278
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0802A240 @ =0x00000101
	bl SoundPlay
	b _0802A24C
	.align 2, 0
_0802A238: .4byte gCurrentSprite
_0802A23C: .4byte 0x0831E278
_0802A240: .4byte 0x00000101
_0802A244:
	ldr r0, _0802A250 @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
_0802A24C:
	pop {r0}
	bx r0
	.align 2, 0
_0802A250: .4byte gCurrentSprite

	thumb_func_start NavPadPressingSwitch
NavPadPressingSwitch: @ 0x0802A254
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802A272
	ldr r1, _0802A278 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _0802A27C @ =0x0831E380
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
_0802A272:
	pop {r0}
	bx r0
	.align 2, 0
_0802A278: .4byte gCurrentSprite
_0802A27C: .4byte 0x0831E380

	thumb_func_start NavPadSwitchPressed
NavPadSwitchPressed: @ 0x0802A280
	push {r4, lr}
	bl NavPadDetectSamus
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _0802A2D4
	bl SpriteUtilCheckMorphed
	cmp r0, #0
	bne _0802A2EE
	ldr r2, _0802A2C8 @ =gSamusData
	ldr r4, _0802A2CC @ =gCurrentSprite
	ldrh r0, [r4, #4]
	strh r0, [r2, #0x16]
	ldrb r0, [r2, #5]
	cmp r0, #0
	beq _0802A2A8
	movs r0, #0
	strb r0, [r2, #5]
_0802A2A8:
	ldr r1, _0802A2D0 @ =sSamusSetPoseFunctionPointer
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
	b _0802A2EE
	.align 2, 0
_0802A2C8: .4byte gSamusData
_0802A2CC: .4byte gCurrentSprite
_0802A2D0: .4byte sSamusSetPoseFunctionPointer
_0802A2D4:
	ldr r1, _0802A2F4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _0802A2F8 @ =0x0831E2F0
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	movs r0, #0x81
	lsls r0, r0, #1
	bl SoundPlay
_0802A2EE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A2F4: .4byte gCurrentSprite
_0802A2F8: .4byte 0x0831E2F0

	thumb_func_start NavPadReleasingSwitch
NavPadReleasingSwitch: @ 0x0802A2FC
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802A30A
	bl NavPadIdleInit
_0802A30A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavPadAfterConversationInit
NavPadAfterConversationInit: @ 0x0802A310
	push {lr}
	bl EventCheckOn_Escape
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0802A332
	ldr r0, _0802A340 @ =gEscapeStatus
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802A332
	bl EscapeStart
	movs r0, #0x35
	movs r1, #0xa
	bl PlayMusic
_0802A332:
	ldr r0, _0802A344 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x1e
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_0802A340: .4byte gEscapeStatus
_0802A344: .4byte gCurrentSprite

	thumb_func_start NavPadAfterConversation
NavPadAfterConversation: @ 0x0802A348
	push {lr}
	bl NavPadDetectSamus
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	bne _0802A370
	ldr r1, _0802A374 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _0802A378 @ =0x0831E2F0
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	movs r0, #0x81
	lsls r0, r0, #1
	bl SoundPlay
_0802A370:
	pop {r0}
	bx r0
	.align 2, 0
_0802A374: .4byte gCurrentSprite
_0802A378: .4byte 0x0831E2F0

	thumb_func_start NavPadUsingConsole
NavPadUsingConsole: @ 0x0802A37C
	push {r4, lr}
	sub sp, #0xc
	ldr r0, _0802A3E4 @ =gCurrentSprite
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802A39C
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A39C
	ldr r0, _0802A3E8 @ =0x00000103
	bl SoundPlay
_0802A39C:
	ldr r1, _0802A3EC @ =gSamusData
	ldrb r0, [r1, #1]
	cmp r0, #0x36
	bne _0802A3DC
	adds r0, r1, #0
	adds r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _0802A3DC
	ldr r4, _0802A3E4 @ =gCurrentSprite
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	subs r0, #0xf0
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #9
	movs r1, #0
	bl SpriteSpawnSecondary
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
_0802A3DC:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A3E4: .4byte gCurrentSprite
_0802A3E8: .4byte 0x00000103
_0802A3EC: .4byte gSamusData

	thumb_func_start NavPadStartConversation
NavPadStartConversation: @ 0x0802A3F0
	push {lr}
	ldr r2, _0802A420 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A41A
	ldr r1, _0802A424 @ =gPauseScreenFlag
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0802A428 @ =gSubGameMode1
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x1d
	strb r0, [r1]
_0802A41A:
	pop {r0}
	bx r0
	.align 2, 0
_0802A420: .4byte gCurrentSprite
_0802A424: .4byte gPauseScreenFlag
_0802A428: .4byte gSubGameMode1

	thumb_func_start NavConsoleInit
NavConsoleInit: @ 0x0802A42C
	push {r4, lr}
	ldr r0, _0802A480 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0802A484 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r3, #0
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802A488 @ =0x0000FFFC
	mov r4, ip
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xd
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0802A48C @ =0x0831E268
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A480: .4byte gCurrentSprite
_0802A484: .4byte 0x0000FFFB
_0802A488: .4byte 0x0000FFFC
_0802A48C: .4byte 0x0831E268

	thumb_func_start NavConsoleIdle
NavConsoleIdle: @ 0x0802A490
	bx lr
	.align 2, 0

	thumb_func_start NavConsoleScreenInit
NavConsoleScreenInit: @ 0x0802A494
	push {r4, lr}
	ldr r0, _0802A4F4 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0802A4F8 @ =0x0000FFFB
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
	ldr r1, _0802A4FC @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0802A500 @ =0x0831E2C8
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A4F4: .4byte gCurrentSprite
_0802A4F8: .4byte 0x0000FFFB
_0802A4FC: .4byte 0x0000FFFC
_0802A500: .4byte 0x0831E2C8

	thumb_func_start NavConsoleScreenIdle
NavConsoleScreenIdle: @ 0x0802A504
	push {lr}
	ldr r3, _0802A528 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r0, [r0]
	ldr r2, _0802A52C @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x1c
	beq _0802A534
	cmp r0, #0x38
	bne _0802A538
	ldr r0, _0802A530 @ =0x0831E2A0
	b _0802A536
	.align 2, 0
_0802A528: .4byte gCurrentSprite
_0802A52C: .4byte gSpriteData
_0802A530: .4byte 0x0831E2A0
_0802A534:
	ldr r0, _0802A53C @ =0x0831E2C8
_0802A536:
	str r0, [r3, #0x18]
_0802A538:
	pop {r0}
	bx r0
	.align 2, 0
_0802A53C: .4byte 0x0831E2C8

	thumb_func_start NavScreenInit
NavScreenInit: @ 0x0802A540
	push {r4, lr}
	ldr r0, _0802A5A4 @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r3, #0
	orrs r0, r1
	strb r0, [r2]
	mov r4, ip
	ldrh r1, [r4]
	ldr r0, _0802A5A8 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	adds r0, #2
	movs r1, #0x28
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _0802A5AC @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	mov r1, ip
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	adds r1, #2
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0802A5B0 @ =0x0831E340
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	movs r0, #0x82
	lsls r0, r0, #1
	bl SoundPlay
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802A5A4: .4byte gCurrentSprite
_0802A5A8: .4byte 0x0000FFFB
_0802A5AC: .4byte 0x0000FFFC
_0802A5B0: .4byte 0x0831E340

	thumb_func_start NavScreenTurningOn
NavScreenTurningOn: @ 0x0802A5B4
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802A5D0
	ldr r1, _0802A5D4 @ =gCurrentSprite
	ldr r0, _0802A5D8 @ =0x0831E328
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
_0802A5D0:
	pop {r0}
	bx r0
	.align 2, 0
_0802A5D4: .4byte gCurrentSprite
_0802A5D8: .4byte 0x0831E328

	thumb_func_start NavScreenIdle
NavScreenIdle: @ 0x0802A5DC
	push {lr}
	ldr r3, _0802A614 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0802A618 @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0802A610
	ldr r0, _0802A61C @ =0x0831E390
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	adds r0, #0xeb
	bl SoundPlay
_0802A610:
	pop {r0}
	bx r0
	.align 2, 0
_0802A614: .4byte gCurrentSprite
_0802A618: .4byte gSpriteData
_0802A61C: .4byte 0x0831E390

	thumb_func_start NavScreenTurningOff
NavScreenTurningOff: @ 0x0802A620
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802A630
	ldr r1, _0802A634 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
_0802A630:
	pop {r0}
	bx r0
	.align 2, 0
_0802A634: .4byte gCurrentSprite

	thumb_func_start NavPad
NavPad: @ 0x0802A638
	push {lr}
	ldr r0, _0802A658 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bls _0802A64E
	b _0802A782
_0802A64E:
	lsls r0, r0, #2
	ldr r1, _0802A65C @ =_0802A660
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A658: .4byte gCurrentSprite
_0802A65C: .4byte _0802A660
_0802A660: @ jump table
	.4byte _0802A74C @ case 0
	.4byte _0802A750 @ case 1
	.4byte _0802A756 @ case 2
	.4byte _0802A782 @ case 3
	.4byte _0802A782 @ case 4
	.4byte _0802A782 @ case 5
	.4byte _0802A782 @ case 6
	.4byte _0802A782 @ case 7
	.4byte _0802A782 @ case 8
	.4byte _0802A782 @ case 9
	.4byte _0802A782 @ case 10
	.4byte _0802A782 @ case 11
	.4byte _0802A782 @ case 12
	.4byte _0802A782 @ case 13
	.4byte _0802A782 @ case 14
	.4byte _0802A782 @ case 15
	.4byte _0802A782 @ case 16
	.4byte _0802A782 @ case 17
	.4byte _0802A782 @ case 18
	.4byte _0802A782 @ case 19
	.4byte _0802A782 @ case 20
	.4byte _0802A782 @ case 21
	.4byte _0802A782 @ case 22
	.4byte _0802A782 @ case 23
	.4byte _0802A75C @ case 24
	.4byte _0802A782 @ case 25
	.4byte _0802A762 @ case 26
	.4byte _0802A782 @ case 27
	.4byte _0802A768 @ case 28
	.4byte _0802A76E @ case 29
	.4byte _0802A772 @ case 30
	.4byte _0802A782 @ case 31
	.4byte _0802A782 @ case 32
	.4byte _0802A782 @ case 33
	.4byte _0802A782 @ case 34
	.4byte _0802A782 @ case 35
	.4byte _0802A782 @ case 36
	.4byte _0802A782 @ case 37
	.4byte _0802A782 @ case 38
	.4byte _0802A782 @ case 39
	.4byte _0802A782 @ case 40
	.4byte _0802A782 @ case 41
	.4byte _0802A782 @ case 42
	.4byte _0802A782 @ case 43
	.4byte _0802A782 @ case 44
	.4byte _0802A782 @ case 45
	.4byte _0802A782 @ case 46
	.4byte _0802A782 @ case 47
	.4byte _0802A782 @ case 48
	.4byte _0802A782 @ case 49
	.4byte _0802A782 @ case 50
	.4byte _0802A782 @ case 51
	.4byte _0802A782 @ case 52
	.4byte _0802A782 @ case 53
	.4byte _0802A782 @ case 54
	.4byte _0802A782 @ case 55
	.4byte _0802A778 @ case 56
	.4byte _0802A782 @ case 57
	.4byte _0802A77E @ case 58
_0802A74C:
	bl NavPadInit
_0802A750:
	bl NavPadIdleInit
	b _0802A782
_0802A756:
	bl NavPadIdle
	b _0802A782
_0802A75C:
	bl NavPadPressingSwitch
	b _0802A782
_0802A762:
	bl NavPadSwitchPressed
	b _0802A782
_0802A768:
	bl NavPadReleasingSwitch
	b _0802A782
_0802A76E:
	bl NavPadAfterConversationInit
_0802A772:
	bl NavPadAfterConversation
	b _0802A782
_0802A778:
	bl NavPadUsingConsole
	b _0802A782
_0802A77E:
	bl NavPadStartConversation
_0802A782:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NavConsole
NavConsole: @ 0x0802A788
	push {lr}
	ldr r0, _0802A7A4 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802A7A8
	cmp r0, #2
	beq _0802A7AC
	b _0802A7B0
	.align 2, 0
_0802A7A4: .4byte gCurrentSprite
_0802A7A8:
	bl NavConsoleInit
_0802A7AC:
	bl NavConsoleIdle
_0802A7B0:
	pop {r0}
	bx r0

	thumb_func_start NavConsoleScreen
NavConsoleScreen: @ 0x0802A7B4
	push {lr}
	ldr r0, _0802A7D0 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802A7D4
	cmp r0, #2
	beq _0802A7D8
	b _0802A7DC
	.align 2, 0
_0802A7D0: .4byte gCurrentSprite
_0802A7D4:
	bl NavConsoleScreenInit
_0802A7D8:
	bl NavConsoleScreenIdle
_0802A7DC:
	pop {r0}
	bx r0

	thumb_func_start NavScreen
NavScreen: @ 0x0802A7E0
	push {lr}
	ldr r0, _0802A800 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0802A812
	cmp r0, #2
	bgt _0802A804
	cmp r0, #0
	beq _0802A80E
	b _0802A822
	.align 2, 0
_0802A800: .4byte gCurrentSprite
_0802A804:
	cmp r0, #0x18
	beq _0802A818
	cmp r0, #0x1a
	beq _0802A81E
	b _0802A822
_0802A80E:
	bl NavScreenInit
_0802A812:
	bl NavScreenTurningOn
	b _0802A822
_0802A818:
	bl NavScreenIdle
	b _0802A822
_0802A81E:
	bl NavScreenTurningOff
_0802A822:
	pop {r0}
	bx r0
	.align 2, 0
