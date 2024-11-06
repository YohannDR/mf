    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start DataPadInit
DataPadInit: @ 0x0802AE7C
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, _0802AED0 @ =gCurrentSprite
	adds r2, r4, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r3, #0
	orrs r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x25
	strb r3, [r0]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #8
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x28
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _0802AED4 @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x21
	movs r5, #1
	strb r5, [r0]
	movs r0, #0
	bl EventCheckDownloadedDataItem
	cmp r0, #0
	beq _0802AED8
	adds r0, r4, #0
	adds r0, #0x2f
	strb r5, [r0]
	b _0802AEE0
	.align 2, 0
_0802AED0: .4byte gCurrentSprite
_0802AED4: .4byte 0x0000FFFC
_0802AED8:
	adds r1, r4, #0
	adds r1, #0x2f
	movs r0, #0
	strb r0, [r1]
_0802AEE0:
	ldr r4, _0802AF1C @ =gCurrentSprite
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	movs r5, #0
	str r5, [sp, #8]
	movs r0, #0x1e
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x1f
	movs r1, #0
	bl SpriteSpawnSecondary
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AF1C: .4byte gCurrentSprite

	thumb_func_start DataPadIdleInit
DataPadIdleInit: @ 0x0802AF20
	push {lr}
	ldr r1, _0802AF48 @ =gCurrentSprite
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
	beq _0802AF50
	ldr r0, _0802AF4C @ =sDataPadOam_3219c4
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #2
	b _0802AF58
	.align 2, 0
_0802AF48: .4byte gCurrentSprite
_0802AF4C: .4byte sDataPadOam_3219c4
_0802AF50:
	ldr r0, _0802AF60 @ =sDataPadOam_3219d4
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x1e
_0802AF58:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802AF60: .4byte sDataPadOam_3219d4

	thumb_func_start DataPadIdle
DataPadIdle: @ 0x0802AF64
	push {lr}
	bl NavPadDetectSamus
	cmp r0, #0
	beq _0802AFA4
	ldr r3, _0802AF98 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802AFAC
	subs r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0802AF9C @ =sDataPadOam_3219e4
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0802AFA0 @ =0x00000101
	bl SoundPlay
	b _0802AFAC
	.align 2, 0
_0802AF98: .4byte gCurrentSprite
_0802AF9C: .4byte sDataPadOam_3219e4
_0802AFA0: .4byte 0x00000101
_0802AFA4:
	ldr r0, _0802AFB0 @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
_0802AFAC:
	pop {r0}
	bx r0
	.align 2, 0
_0802AFB0: .4byte gCurrentSprite

	thumb_func_start DataPadPressingSwitch
DataPadPressingSwitch: @ 0x0802AFB4
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802AFD2
	ldr r1, _0802AFD8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _0802AFDC @ =sDataPadOam_3219d4
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
_0802AFD2:
	pop {r0}
	bx r0
	.align 2, 0
_0802AFD8: .4byte gCurrentSprite
_0802AFDC: .4byte sDataPadOam_3219d4

	thumb_func_start DataPadSwitchPressed
DataPadSwitchPressed: @ 0x0802AFE0
	push {r4, lr}
	bl NavPadDetectSamus
	adds r3, r0, #0
	cmp r3, #0
	beq _0802B034
	bl SpriteUtilCheckSamusMorphed
	cmp r0, #0
	bne _0802B04E
	ldr r2, _0802B028 @ =gSamusData
	ldr r4, _0802B02C @ =gCurrentSprite
	ldrh r0, [r4, #4]
	strh r0, [r2, #0x16]
	ldrb r0, [r2, #5]
	cmp r0, #0
	beq _0802B006
	movs r0, #0
	strb r0, [r2, #5]
_0802B006:
	ldr r1, _0802B030 @ =sSamusSetPoseFunctionPointer
	ldrb r0, [r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x20
	bl _call_via_r1
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x38
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	b _0802B04E
	.align 2, 0
_0802B028: .4byte gSamusData
_0802B02C: .4byte gCurrentSprite
_0802B030: .4byte sSamusSetPoseFunctionPointer
_0802B034:
	ldr r1, _0802B054 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _0802B058 @ =sDataPadOam_321a0c
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	movs r0, #0x81
	lsls r0, r0, #1
	bl SoundPlay
_0802B04E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B054: .4byte gCurrentSprite
_0802B058: .4byte sDataPadOam_321a0c

	thumb_func_start DataPadReleasingSwitch
DataPadReleasingSwitch: @ 0x0802B05C
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802B06A
	bl DataPadIdleInit
_0802B06A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DataPadLockingSamus
DataPadLockingSamus: @ 0x0802B070
	push {lr}
	ldr r1, _0802B0B0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B0AC
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	movs r0, #0x78
	strb r0, [r2]
	movs r0, #1
	bl EventCheckDownloadedDataItem
	ldr r1, _0802B0B4 @ =gDoorUnlockTimer
	movs r0, #0x3c
	strb r0, [r1]
	ldr r1, _0802B0B8 @ =sSamusSetPoseFunctionPointer
	ldr r0, _0802B0BC @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x37
	bl _call_via_r1
_0802B0AC:
	pop {r0}
	bx r0
	.align 2, 0
_0802B0B0: .4byte gCurrentSprite
_0802B0B4: .4byte gDoorUnlockTimer
_0802B0B8: .4byte sSamusSetPoseFunctionPointer
_0802B0BC: .4byte gSamusData

	thumb_func_start DataPadDownloadingData
DataPadDownloadingData: @ 0x0802B0C0
	push {lr}
	ldr r1, _0802B0E0 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B0DA
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0802B0DA:
	pop {r0}
	bx r0
	.align 2, 0
_0802B0E0: .4byte gCurrentSprite

	thumb_func_start DataPadCenterInit
DataPadCenterInit: @ 0x0802B0E4
	push {r4, lr}
	ldr r0, _0802B160 @ =gCurrentSprite
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
	ldr r0, _0802B164 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x28
	strb r0, [r1]
	ldr r1, _0802B168 @ =0x0000FFFC
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
	adds r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	ldr r2, _0802B16C @ =gSpriteData
	mov r0, ip
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802B174
	ldr r0, _0802B170 @ =sDataPadOam_321a44
	str r0, [r4, #0x18]
	b _0802B17A
	.align 2, 0
_0802B160: .4byte gCurrentSprite
_0802B164: .4byte 0x0000FFFB
_0802B168: .4byte 0x0000FFFC
_0802B16C: .4byte gSpriteData
_0802B170: .4byte sDataPadOam_321a44
_0802B174:
	ldr r0, _0802B180 @ =sDataPadOam_321a34
	mov r1, ip
	str r0, [r1, #0x18]
_0802B17A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B180: .4byte sDataPadOam_321a34

	thumb_func_start DataPadCenterIdle
DataPadCenterIdle: @ 0x0802B184
	push {lr}
	ldr r2, _0802B1CC @ =gSpriteData
	ldr r3, _0802B1D0 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x38
	bne _0802B1C8
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802B1C8
	subs r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0802B1D4 @ =sDataPadOam_321a64
	str r0, [r3, #0x18]
	movs r0, #0x85
	lsls r0, r0, #1
	bl SoundPlay
_0802B1C8:
	pop {r0}
	bx r0
	.align 2, 0
_0802B1CC: .4byte gSpriteData
_0802B1D0: .4byte gCurrentSprite
_0802B1D4: .4byte sDataPadOam_321a64

	thumb_func_start DataPadCenterEngaging
DataPadCenterEngaging: @ 0x0802B1D8
	push {lr}
	ldr r2, _0802B214 @ =gSpriteData
	ldr r3, _0802B218 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0802B20E
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x1a
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	ldr r0, _0802B21C @ =sDataPadOam_321a44
	str r0, [r3, #0x18]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x14
	strb r0, [r1]
_0802B20E:
	pop {r0}
	bx r0
	.align 2, 0
_0802B214: .4byte gSpriteData
_0802B218: .4byte gCurrentSprite
_0802B21C: .4byte sDataPadOam_321a44

	thumb_func_start DataPadCenterDownloadingData
DataPadCenterDownloadingData: @ 0x0802B220
	push {lr}
	ldr r3, _0802B24C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802B246
	adds r0, r3, #0
	adds r0, #0x24
	movs r1, #0x1c
	strb r1, [r0]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0802B250 @ =sDataPadOam_321a34
	str r0, [r3, #0x18]
_0802B246:
	pop {r0}
	bx r0
	.align 2, 0
_0802B24C: .4byte gCurrentSprite
_0802B250: .4byte sDataPadOam_321a34

	thumb_func_start DataPadSidesInit
DataPadSidesInit: @ 0x0802B254
	push {r4, lr}
	ldr r0, _0802B2B8 @ =gCurrentSprite
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
	ldr r0, _0802B2BC @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	strh r0, [r4]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x28
	strb r0, [r1]
	ldr r1, _0802B2C0 @ =0x0000FFFC
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
	ldr r0, _0802B2C4 @ =sDataPadOam_321a8c
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r3, [r4, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B2B8: .4byte gCurrentSprite
_0802B2BC: .4byte 0x0000FFFB
_0802B2C0: .4byte 0x0000FFFC
_0802B2C4: .4byte sDataPadOam_321a8c

	thumb_func_start DataPadSidesIdle
DataPadSidesIdle: @ 0x0802B2C8
	push {lr}
	ldr r2, _0802B304 @ =gSpriteData
	ldr r3, _0802B308 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x38
	bne _0802B2FE
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x18
	strb r0, [r2]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	ldr r0, _0802B30C @ =sDataPadOam_321a9c
	str r0, [r3, #0x18]
	movs r0, #0x84
	lsls r0, r0, #1
	bl SoundPlay
_0802B2FE:
	pop {r0}
	bx r0
	.align 2, 0
_0802B304: .4byte gSpriteData
_0802B308: .4byte gCurrentSprite
_0802B30C: .4byte sDataPadOam_321a9c

	thumb_func_start DataPadSidesEngaging
DataPadSidesEngaging: @ 0x0802B310
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802B32E
	ldr r1, _0802B334 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x1a
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0802B338 @ =sDataPadOam_321adc
	str r0, [r1, #0x18]
_0802B32E:
	pop {r0}
	bx r0
	.align 2, 0
_0802B334: .4byte gCurrentSprite
_0802B338: .4byte sDataPadOam_321adc

	thumb_func_start DataPadSidesDownloadingData
DataPadSidesDownloadingData: @ 0x0802B33C
	push {r4, lr}
	ldr r2, _0802B38C @ =gSpriteData
	ldr r3, _0802B390 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1e
	bne _0802B386
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #0x14
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0x1c
	strb r0, [r1]
	ldr r1, _0802B394 @ =sSamusSetPoseFunctionPointer
	ldr r4, _0802B398 @ =gSamusData
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x39
	bl _call_via_r1
	movs r0, #0xa
	strh r0, [r4, #0x10]
	ldr r1, _0802B39C @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
_0802B386:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802B38C: .4byte gSpriteData
_0802B390: .4byte gCurrentSprite
_0802B394: .4byte sSamusSetPoseFunctionPointer
_0802B398: .4byte gSamusData
_0802B39C: .4byte gPreventMovementTimer

	thumb_func_start DataPadSidesDoneDownloadingData
DataPadSidesDoneDownloadingData: @ 0x0802B3A0
	push {lr}
	ldr r3, _0802B3D0 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802B3CA
	subs r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0802B3D4 @ =sDataPadOam_321abc
	str r0, [r3, #0x18]
	ldr r0, _0802B3D8 @ =0x00000109
	bl SoundPlay
_0802B3CA:
	pop {r0}
	bx r0
	.align 2, 0
_0802B3D0: .4byte gCurrentSprite
_0802B3D4: .4byte sDataPadOam_321abc
_0802B3D8: .4byte 0x00000109

	thumb_func_start DataPadSidesDisengaging
DataPadSidesDisengaging: @ 0x0802B3DC
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802B400
	ldr r1, _0802B404 @ =gCurrentSprite
	adds r3, r1, #0
	adds r3, #0x24
	movs r2, #0
	movs r0, #0x46
	strb r0, [r3]
	strb r2, [r1, #0x1c]
	strh r2, [r1, #0x16]
	ldr r0, _0802B408 @ =sDataPadOam_321a8c
	str r0, [r1, #0x18]
	movs r0, #0
	bl TrySpawnMessageBanner
_0802B400:
	pop {r0}
	bx r0
	.align 2, 0
_0802B404: .4byte gCurrentSprite
_0802B408: .4byte sDataPadOam_321a8c

	thumb_func_start DataPad
DataPad: @ 0x0802B40C
	push {lr}
	ldr r0, _0802B42C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bls _0802B422
	b _0802B54C
_0802B422:
	lsls r0, r0, #2
	ldr r1, _0802B430 @ =_0802B434
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B42C: .4byte gCurrentSprite
_0802B430: .4byte _0802B434
_0802B434: @ jump table
	.4byte _0802B520 @ case 0
	.4byte _0802B524 @ case 1
	.4byte _0802B52A @ case 2
	.4byte _0802B54C @ case 3
	.4byte _0802B54C @ case 4
	.4byte _0802B54C @ case 5
	.4byte _0802B54C @ case 6
	.4byte _0802B54C @ case 7
	.4byte _0802B54C @ case 8
	.4byte _0802B54C @ case 9
	.4byte _0802B54C @ case 10
	.4byte _0802B54C @ case 11
	.4byte _0802B54C @ case 12
	.4byte _0802B54C @ case 13
	.4byte _0802B54C @ case 14
	.4byte _0802B54C @ case 15
	.4byte _0802B54C @ case 16
	.4byte _0802B54C @ case 17
	.4byte _0802B54C @ case 18
	.4byte _0802B54C @ case 19
	.4byte _0802B54C @ case 20
	.4byte _0802B54C @ case 21
	.4byte _0802B54C @ case 22
	.4byte _0802B54C @ case 23
	.4byte _0802B530 @ case 24
	.4byte _0802B54C @ case 25
	.4byte _0802B536 @ case 26
	.4byte _0802B54C @ case 27
	.4byte _0802B53C @ case 28
	.4byte _0802B54C @ case 29
	.4byte _0802B54C @ case 30
	.4byte _0802B54C @ case 31
	.4byte _0802B54C @ case 32
	.4byte _0802B54C @ case 33
	.4byte _0802B54C @ case 34
	.4byte _0802B54C @ case 35
	.4byte _0802B54C @ case 36
	.4byte _0802B54C @ case 37
	.4byte _0802B54C @ case 38
	.4byte _0802B54C @ case 39
	.4byte _0802B54C @ case 40
	.4byte _0802B54C @ case 41
	.4byte _0802B54C @ case 42
	.4byte _0802B54C @ case 43
	.4byte _0802B54C @ case 44
	.4byte _0802B54C @ case 45
	.4byte _0802B54C @ case 46
	.4byte _0802B54C @ case 47
	.4byte _0802B54C @ case 48
	.4byte _0802B54C @ case 49
	.4byte _0802B54C @ case 50
	.4byte _0802B54C @ case 51
	.4byte _0802B54C @ case 52
	.4byte _0802B54C @ case 53
	.4byte _0802B54C @ case 54
	.4byte _0802B54C @ case 55
	.4byte _0802B542 @ case 56
	.4byte _0802B54C @ case 57
	.4byte _0802B548 @ case 58
_0802B520:
	bl DataPadInit
_0802B524:
	bl DataPadIdleInit
	b _0802B54C
_0802B52A:
	bl DataPadIdle
	b _0802B54C
_0802B530:
	bl DataPadPressingSwitch
	b _0802B54C
_0802B536:
	bl DataPadSwitchPressed
	b _0802B54C
_0802B53C:
	bl DataPadReleasingSwitch
	b _0802B54C
_0802B542:
	bl DataPadLockingSamus
	b _0802B54C
_0802B548:
	bl DataPadDownloadingData
_0802B54C:
	pop {r0}
	bx r0

	thumb_func_start DataPadCenter
DataPadCenter: @ 0x0802B550
	push {lr}
	ldr r0, _0802B570 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0802B582
	cmp r0, #2
	bgt _0802B574
	cmp r0, #0
	beq _0802B57E
	b _0802B592
	.align 2, 0
_0802B570: .4byte gCurrentSprite
_0802B574:
	cmp r0, #0x18
	beq _0802B588
	cmp r0, #0x1a
	beq _0802B58E
	b _0802B592
_0802B57E:
	bl DataPadCenterInit
_0802B582:
	bl DataPadCenterIdle
	b _0802B592
_0802B588:
	bl DataPadCenterEngaging
	b _0802B592
_0802B58E:
	bl DataPadCenterDownloadingData
_0802B592:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start DataPadSides
DataPadSides: @ 0x0802B598
	push {lr}
	ldr r0, _0802B5B8 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhi _0802B65C
	lsls r0, r0, #2
	ldr r1, _0802B5BC @ =_0802B5C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802B5B8: .4byte gCurrentSprite
_0802B5BC: .4byte _0802B5C0
_0802B5C0: @ jump table
	.4byte _0802B63C @ case 0
	.4byte _0802B65C @ case 1
	.4byte _0802B640 @ case 2
	.4byte _0802B65C @ case 3
	.4byte _0802B65C @ case 4
	.4byte _0802B65C @ case 5
	.4byte _0802B65C @ case 6
	.4byte _0802B65C @ case 7
	.4byte _0802B65C @ case 8
	.4byte _0802B65C @ case 9
	.4byte _0802B65C @ case 10
	.4byte _0802B65C @ case 11
	.4byte _0802B65C @ case 12
	.4byte _0802B65C @ case 13
	.4byte _0802B65C @ case 14
	.4byte _0802B65C @ case 15
	.4byte _0802B65C @ case 16
	.4byte _0802B65C @ case 17
	.4byte _0802B65C @ case 18
	.4byte _0802B65C @ case 19
	.4byte _0802B65C @ case 20
	.4byte _0802B65C @ case 21
	.4byte _0802B65C @ case 22
	.4byte _0802B65C @ case 23
	.4byte _0802B646 @ case 24
	.4byte _0802B65C @ case 25
	.4byte _0802B64C @ case 26
	.4byte _0802B65C @ case 27
	.4byte _0802B652 @ case 28
	.4byte _0802B65C @ case 29
	.4byte _0802B658 @ case 30
_0802B63C:
	bl DataPadSidesInit
_0802B640:
	bl DataPadSidesIdle
	b _0802B65C
_0802B646:
	bl DataPadSidesEngaging
	b _0802B65C
_0802B64C:
	bl DataPadSidesDownloadingData
	b _0802B65C
_0802B652:
	bl DataPadSidesDoneDownloadingData
	b _0802B65C
_0802B658:
	bl DataPadSidesDisengaging
_0802B65C:
	pop {r0}
	bx r0
