    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start RechargePadInit
RechargePadInit: @ 0x0802BEC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r4, _0802BF18 @ =gCurrentSprite
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
	ldr r1, _0802BF1C @ =0x0000FFFC
	strh r1, [r4, #0xa]
	movs r0, #4
	strh r0, [r4, #0xc]
	strh r1, [r4, #0xe]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	adds r0, #0x21
	movs r5, #1
	strb r5, [r0]
	bl EventCheckWith_RechargeDisabled
	cmp r0, #0
	beq _0802BF20
	adds r0, r4, #0
	adds r0, #0x31
	strb r5, [r0]
	b _0802BF28
	.align 2, 0
_0802BF18: .4byte gCurrentSprite
_0802BF1C: .4byte 0x0000FFFC
_0802BF20:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #0
	strb r0, [r1]
_0802BF28:
	ldr r4, _0802BF94 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r7, #1
	ands r7, r0
	cmp r7, #0
	beq _0802BF98
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x90
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x21
	movs r1, #0
	bl SpriteSpawnSecondary
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r5, [r0]
	cmp r5, #0
	bne _0802BFF0
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x90
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x22
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	subs r0, #0x90
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x22
	movs r1, #1
	bl SpriteSpawnSecondary
	b _0802BFF0
	.align 2, 0
_0802BF94: .4byte gCurrentSprite
_0802BF98:
	ldrb r2, [r4, #0x1f]
	adds r6, r4, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x90
	str r0, [sp, #4]
	movs r5, #0x40
	str r5, [sp, #8]
	movs r0, #0x21
	movs r1, #0
	bl SpriteSpawnSecondary
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802BFF0
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x90
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x22
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r4, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x90
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x22
	movs r1, #1
	bl SpriteSpawnSecondary
_0802BFF0:
	ldr r0, _0802C000 @ =gCurrentSprite
	adds r0, #0x2f
	strb r7, [r0]
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802C000: .4byte gCurrentSprite

	thumb_func_start RechargePadIdleInit
RechargePadIdleInit: @ 0x0802C004
	push {lr}
	ldr r1, _0802C02C @ =gCurrentSprite
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r2, r1, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	adds r0, r1, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C034
	ldr r0, _0802C030 @ =sRechargePadOam_3257e0
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #0x46
	b _0802C03C
	.align 2, 0
_0802C02C: .4byte gCurrentSprite
_0802C030: .4byte sRechargePadOam_3257e0
_0802C034:
	ldr r0, _0802C044 @ =sRechargePadOam_3257d0
	str r0, [r1, #0x18]
	adds r1, #0x24
	movs r0, #2
_0802C03C:
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802C044: .4byte sRechargePadOam_3257d0

	thumb_func_start RechargePadIdle
RechargePadIdle: @ 0x0802C048
	push {lr}
	bl NavPadDetectSamus
	cmp r0, #0
	beq _0802C088
	ldr r3, _0802C07C @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _0802C090
	subs r1, #0xa
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0802C080 @ =sRechargePadOam_325780
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	ldr r0, _0802C084 @ =0x00000101
	bl SoundPlay
	b _0802C090
	.align 2, 0
_0802C07C: .4byte gCurrentSprite
_0802C080: .4byte sRechargePadOam_325780
_0802C084: .4byte 0x00000101
_0802C088:
	ldr r0, _0802C094 @ =gCurrentSprite
	adds r0, #0x2e
	movs r1, #1
	strb r1, [r0]
_0802C090:
	pop {r0}
	bx r0
	.align 2, 0
_0802C094: .4byte gCurrentSprite

	thumb_func_start RechargePadOpening
RechargePadOpening: @ 0x0802C098
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802C0B6
	ldr r1, _0802C0BC @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x1a
	strb r0, [r2]
	ldr r0, _0802C0C0 @ =sRechargePadOam_3257e0
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
_0802C0B6:
	pop {r0}
	bx r0
	.align 2, 0
_0802C0BC: .4byte gCurrentSprite
_0802C0C0: .4byte sRechargePadOam_3257e0

	thumb_func_start RechargePadOpened
RechargePadOpened: @ 0x0802C0C4
	push {r4, lr}
	movs r4, #0
	bl NavPadDetectSamus
	adds r3, r0, #0
	cmp r3, #0
	beq _0802C168
	bl SpriteUtilCheckSamusMorphed
	cmp r0, #0
	bne _0802C182
	ldr r0, _0802C10C @ =gSamusData
	ldrb r1, [r0, #2]
	adds r2, r0, #0
	cmp r1, #0
	bne _0802C182
	ldr r1, _0802C110 @ =gCurrentSprite
	ldrh r0, [r1, #4]
	strh r0, [r2, #0x16]
	ldrb r0, [r2, #5]
	cmp r0, #0
	beq _0802C0F4
	movs r0, #0
	strb r0, [r2, #5]
_0802C0F4:
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802C114
	ldrh r1, [r2, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802C120
	b _0802C124
	.align 2, 0
_0802C10C: .4byte gSamusData
_0802C110: .4byte gCurrentSprite
_0802C114:
	ldrh r1, [r2, #0x12]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802C120
	movs r4, #1
_0802C120:
	cmp r4, #0
	beq _0802C13C
_0802C124:
	ldr r0, _0802C138 @ =sSamusSetPoseFunctionPointer
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0x22
	bl _call_via_r1
	b _0802C14C
	.align 2, 0
_0802C138: .4byte sSamusSetPoseFunctionPointer
_0802C13C:
	ldr r0, _0802C160 @ =sSamusSetPoseFunctionPointer
	ldrb r1, [r2]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	movs r0, #0x21
	bl _call_via_r1
_0802C14C:
	ldr r1, _0802C164 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x38
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x10
	strb r0, [r1]
	b _0802C182
	.align 2, 0
_0802C160: .4byte sSamusSetPoseFunctionPointer
_0802C164: .4byte gCurrentSprite
_0802C168:
	ldr r1, _0802C188 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x1c
	strb r0, [r2]
	ldr r0, _0802C18C @ =sRechargePadOam_3257a8
	str r0, [r1, #0x18]
	strb r3, [r1, #0x1c]
	strh r3, [r1, #0x16]
	movs r0, #0x81
	lsls r0, r0, #1
	bl SoundPlay
_0802C182:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802C188: .4byte gCurrentSprite
_0802C18C: .4byte sRechargePadOam_3257a8

	thumb_func_start RechargePadClosing
RechargePadClosing: @ 0x0802C190
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802C19E
	bl RechargePadIdleInit
_0802C19E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RechargePadExtending
RechargePadExtending: @ 0x0802C1A4
	push {lr}
	ldr r2, _0802C1D0 @ =gCurrentSprite
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C1CA
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	movs r0, #0x3c
	strb r0, [r3]
	adds r1, #0xc
	movs r0, #0xa
	strb r0, [r1]
_0802C1CA:
	pop {r0}
	bx r0
	.align 2, 0
_0802C1D0: .4byte gCurrentSprite

	thumb_func_start RechargePadRefilling
RechargePadRefilling: @ 0x0802C1D4
	push {lr}
	ldr r1, _0802C1E8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #0
	beq _0802C1EC
	subs r0, #1
	strb r0, [r2]
	b _0802C236
	.align 2, 0
_0802C1E8: .4byte gCurrentSprite
_0802C1EC:
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x28
	bne _0802C1F8
	bl SpriteUtilRefillEnergy
	b _0802C214
_0802C1F8:
	cmp r0, #0x29
	beq _0802C208
	cmp r0, #0x2a
	bne _0802C218
	bl SpriteUtilRefillEnergy
	cmp r0, #0
	bne _0802C236
_0802C208:
	bl SpriteUtilRefillMissiles
	cmp r0, #0
	bne _0802C236
	bl SpriteUtilRefillPowerBombs
_0802C214:
	cmp r0, #0
	bne _0802C236
_0802C218:
	ldr r2, _0802C23C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C236
	subs r1, #0xc
	movs r0, #0x3c
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x14
	strb r0, [r1]
_0802C236:
	pop {r0}
	bx r0
	.align 2, 0
_0802C23C: .4byte gCurrentSprite

	thumb_func_start RechargePadRetracting
RechargePadRetracting: @ 0x0802C240
	push {r4, lr}
	ldr r4, _0802C284 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C2C2
	subs r1, #0xa
	movs r0, #0x1e
	strb r0, [r1]
	ldr r1, _0802C288 @ =sSamusSetPoseFunctionPointer
	ldr r0, _0802C28C @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0
	bl _call_via_r1
	ldr r1, _0802C290 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	ldrb r1, [r4, #0x1d]
	cmp r1, #0x28
	bne _0802C294
	movs r0, #0x10
	bl TrySpawnMessageBanner
	b _0802C2C2
	.align 2, 0
_0802C284: .4byte gCurrentSprite
_0802C288: .4byte sSamusSetPoseFunctionPointer
_0802C28C: .4byte gSamusData
_0802C290: .4byte gPreventMovementTimer
_0802C294:
	cmp r1, #0x29
	bne _0802C2A0
	movs r0, #0xf
	bl TrySpawnMessageBanner
	b _0802C2C2
_0802C2A0:
	cmp r1, #0x2a
	bne _0802C2C2
	ldr r0, _0802C2B8 @ =gEquipment
	ldrb r1, [r0, #0xb]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0802C2BC
	movs r0, #0x11
	bl TrySpawnMessageBanner
	b _0802C2C2
	.align 2, 0
_0802C2B8: .4byte gEquipment
_0802C2BC:
	movs r0, #0x10
	bl TrySpawnMessageBanner
_0802C2C2:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start RechargePadMonitorInit
RechargePadMonitorInit: @ 0x0802C2C8
	push {r4, r5, lr}
	ldr r0, _0802C32C @ =gCurrentSprite
	mov ip, r0
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r4, #0
	orrs r0, r1
	strb r0, [r2]
	mov r5, ip
	ldrh r1, [r5]
	ldr r0, _0802C330 @ =0x0000FFFB
	ands r0, r1
	movs r3, #0
	strh r0, [r5]
	mov r0, ip
	adds r0, #0x25
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x28
	strb r3, [r0]
	adds r1, #2
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _0802C334 @ =0x0000FFFC
	strh r1, [r5, #0xa]
	movs r2, #4
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	mov r0, ip
	adds r0, #0x22
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0802C338 @ =sRechargePadOam_325700
	str r0, [r5, #0x18]
	strb r3, [r5, #0x1c]
	strh r4, [r5, #0x16]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802C32C: .4byte gCurrentSprite
_0802C330: .4byte 0x0000FFFB
_0802C334: .4byte 0x0000FFFC
_0802C338: .4byte sRechargePadOam_325700

	thumb_func_start RechargePadMonitorIdle
RechargePadMonitorIdle: @ 0x0802C33C
	push {lr}
	ldr r2, _0802C374 @ =gSpriteData
	ldr r3, _0802C378 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3a
	bne _0802C370
	ldr r0, _0802C37C @ =sRechargePadOam_325710
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	adds r0, #0xfa
	bl SoundPlay
_0802C370:
	pop {r0}
	bx r0
	.align 2, 0
_0802C374: .4byte gSpriteData
_0802C378: .4byte gCurrentSprite
_0802C37C: .4byte sRechargePadOam_325710

	thumb_func_start RechargePadMonitorExtended
RechargePadMonitorExtended: @ 0x0802C380
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802C3B4
	ldr r1, _0802C3B8 @ =gCurrentSprite
	ldr r0, _0802C3BC @ =sRechargePadOam_325738
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	ldr r1, _0802C3C0 @ =sSamusSetPoseFunctionPointer
	ldr r0, _0802C3C4 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x38
	bl _call_via_r1
	ldr r0, _0802C3C8 @ =0x00000111
	bl SoundPlay
_0802C3B4:
	pop {r0}
	bx r0
	.align 2, 0
_0802C3B8: .4byte gCurrentSprite
_0802C3BC: .4byte sRechargePadOam_325738
_0802C3C0: .4byte sSamusSetPoseFunctionPointer
_0802C3C4: .4byte gSamusData
_0802C3C8: .4byte 0x00000111

	thumb_func_start RechargePadMonitorRetractingInit
RechargePadMonitorRetractingInit: @ 0x0802C3CC
	push {lr}
	ldr r2, _0802C404 @ =gSpriteData
	ldr r3, _0802C408 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _0802C400
	ldr r0, _0802C40C @ =sRechargePadOam_325758
	str r0, [r3, #0x18]
	movs r0, #0
	strb r0, [r3, #0x1c]
	strh r0, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x1c
	strb r0, [r1]
	adds r0, #0xf7
	bl SoundPlay
_0802C400:
	pop {r0}
	bx r0
	.align 2, 0
_0802C404: .4byte gSpriteData
_0802C408: .4byte gCurrentSprite
_0802C40C: .4byte sRechargePadOam_325758

	thumb_func_start RechargePadMonitorRetracting
RechargePadMonitorRetracting: @ 0x0802C410
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802C42C
	ldr r1, _0802C430 @ =gCurrentSprite
	ldr r0, _0802C434 @ =sRechargePadOam_325700
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1e
	strb r0, [r1]
_0802C42C:
	pop {r0}
	bx r0
	.align 2, 0
_0802C430: .4byte gCurrentSprite
_0802C434: .4byte sRechargePadOam_325700

	thumb_func_start RechargePadScreenInit
RechargePadScreenInit: @ 0x0802C438
	push {r4, r5, lr}
	ldr r0, _0802C4A4 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x23
	ldrb r4, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #1
	movs r3, #0
	orrs r0, r1
	strb r0, [r2]
	mov r2, ip
	ldrh r1, [r2]
	ldr r0, _0802C4A8 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	mov r5, ip
	strh r0, [r5]
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
	movs r0, #0x18
	strb r0, [r1]
	ldr r1, _0802C4AC @ =0x0000FFFC
	strh r1, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	mov r0, ip
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	strb r2, [r5, #0x1c]
	strh r3, [r5, #0x16]
	ldrb r2, [r5, #0x1e]
	cmp r2, #0
	beq _0802C4B4
	ldr r0, _0802C4B0 @ =sRechargePadOam_3256b8
	str r0, [r5, #0x18]
	mov r0, ip
	adds r0, #0x22
	strb r1, [r0]
	b _0802C500
	.align 2, 0
_0802C4A4: .4byte gCurrentSprite
_0802C4A8: .4byte 0x0000FFFB
_0802C4AC: .4byte 0x0000FFFC
_0802C4B0: .4byte sRechargePadOam_3256b8
_0802C4B4:
	mov r1, ip
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0802C4D4 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #0x1d]
	cmp r0, #0x28
	bne _0802C4DC
	ldr r0, _0802C4D8 @ =sRechargePadOam_325640
	mov r1, ip
	str r0, [r1, #0x18]
	b _0802C500
	.align 2, 0
_0802C4D4: .4byte gSpriteData
_0802C4D8: .4byte sRechargePadOam_325640
_0802C4DC:
	cmp r0, #0x29
	bne _0802C4EC
	ldr r0, _0802C4E8 @ =sRechargePadOam_325668
	mov r2, ip
	str r0, [r2, #0x18]
	b _0802C500
	.align 2, 0
_0802C4E8: .4byte sRechargePadOam_325668
_0802C4EC:
	cmp r0, #0x2a
	bne _0802C4FC
	ldr r0, _0802C4F8 @ =sRechargePadOam_325690
	mov r5, ip
	str r0, [r5, #0x18]
	b _0802C500
	.align 2, 0
_0802C4F8: .4byte sRechargePadOam_325690
_0802C4FC:
	mov r0, ip
	strh r2, [r0]
_0802C500:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RechargePad
RechargePad: @ 0x0802C508
	push {lr}
	ldr r0, _0802C528 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0802C51E
	b _0802C656
_0802C51E:
	lsls r0, r0, #2
	ldr r1, _0802C52C @ =_0802C530
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802C528: .4byte gCurrentSprite
_0802C52C: .4byte _0802C530
_0802C530: @ jump table
	.4byte _0802C624 @ case 0
	.4byte _0802C628 @ case 1
	.4byte _0802C62E @ case 2
	.4byte _0802C656 @ case 3
	.4byte _0802C656 @ case 4
	.4byte _0802C656 @ case 5
	.4byte _0802C656 @ case 6
	.4byte _0802C656 @ case 7
	.4byte _0802C656 @ case 8
	.4byte _0802C656 @ case 9
	.4byte _0802C656 @ case 10
	.4byte _0802C656 @ case 11
	.4byte _0802C656 @ case 12
	.4byte _0802C656 @ case 13
	.4byte _0802C656 @ case 14
	.4byte _0802C656 @ case 15
	.4byte _0802C656 @ case 16
	.4byte _0802C656 @ case 17
	.4byte _0802C656 @ case 18
	.4byte _0802C656 @ case 19
	.4byte _0802C656 @ case 20
	.4byte _0802C656 @ case 21
	.4byte _0802C656 @ case 22
	.4byte _0802C656 @ case 23
	.4byte _0802C634 @ case 24
	.4byte _0802C656 @ case 25
	.4byte _0802C63A @ case 26
	.4byte _0802C656 @ case 27
	.4byte _0802C640 @ case 28
	.4byte _0802C656 @ case 29
	.4byte _0802C656 @ case 30
	.4byte _0802C656 @ case 31
	.4byte _0802C656 @ case 32
	.4byte _0802C656 @ case 33
	.4byte _0802C656 @ case 34
	.4byte _0802C656 @ case 35
	.4byte _0802C656 @ case 36
	.4byte _0802C656 @ case 37
	.4byte _0802C656 @ case 38
	.4byte _0802C656 @ case 39
	.4byte _0802C656 @ case 40
	.4byte _0802C656 @ case 41
	.4byte _0802C656 @ case 42
	.4byte _0802C656 @ case 43
	.4byte _0802C656 @ case 44
	.4byte _0802C656 @ case 45
	.4byte _0802C656 @ case 46
	.4byte _0802C656 @ case 47
	.4byte _0802C656 @ case 48
	.4byte _0802C656 @ case 49
	.4byte _0802C656 @ case 50
	.4byte _0802C656 @ case 51
	.4byte _0802C656 @ case 52
	.4byte _0802C656 @ case 53
	.4byte _0802C656 @ case 54
	.4byte _0802C656 @ case 55
	.4byte _0802C646 @ case 56
	.4byte _0802C656 @ case 57
	.4byte _0802C64C @ case 58
	.4byte _0802C656 @ case 59
	.4byte _0802C652 @ case 60
_0802C624:
	bl RechargePadInit
_0802C628:
	bl RechargePadIdleInit
	b _0802C656
_0802C62E:
	bl RechargePadIdle
	b _0802C656
_0802C634:
	bl RechargePadOpening
	b _0802C656
_0802C63A:
	bl RechargePadOpened
	b _0802C656
_0802C640:
	bl RechargePadClosing
	b _0802C656
_0802C646:
	bl RechargePadExtending
	b _0802C656
_0802C64C:
	bl RechargePadRefilling
	b _0802C656
_0802C652:
	bl RechargePadRetracting
_0802C656:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RechargePadMonitor
RechargePadMonitor: @ 0x0802C65C
	push {lr}
	ldr r0, _0802C67C @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1c
	bhi _0802C714
	lsls r0, r0, #2
	ldr r1, _0802C680 @ =_0802C684
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802C67C: .4byte gCurrentSprite
_0802C680: .4byte _0802C684
_0802C684: @ jump table
	.4byte _0802C6F8 @ case 0
	.4byte _0802C714 @ case 1
	.4byte _0802C6FE @ case 2
	.4byte _0802C714 @ case 3
	.4byte _0802C714 @ case 4
	.4byte _0802C714 @ case 5
	.4byte _0802C714 @ case 6
	.4byte _0802C714 @ case 7
	.4byte _0802C714 @ case 8
	.4byte _0802C714 @ case 9
	.4byte _0802C714 @ case 10
	.4byte _0802C714 @ case 11
	.4byte _0802C714 @ case 12
	.4byte _0802C714 @ case 13
	.4byte _0802C714 @ case 14
	.4byte _0802C714 @ case 15
	.4byte _0802C714 @ case 16
	.4byte _0802C714 @ case 17
	.4byte _0802C714 @ case 18
	.4byte _0802C714 @ case 19
	.4byte _0802C714 @ case 20
	.4byte _0802C714 @ case 21
	.4byte _0802C714 @ case 22
	.4byte _0802C714 @ case 23
	.4byte _0802C704 @ case 24
	.4byte _0802C714 @ case 25
	.4byte _0802C70A @ case 26
	.4byte _0802C714 @ case 27
	.4byte _0802C710 @ case 28
_0802C6F8:
	bl RechargePadMonitorInit
	b _0802C714
_0802C6FE:
	bl RechargePadMonitorIdle
	b _0802C714
_0802C704:
	bl RechargePadMonitorExtended
	b _0802C714
_0802C70A:
	bl RechargePadMonitorRetractingInit
	b _0802C714
_0802C710:
	bl RechargePadMonitorRetracting
_0802C714:
	pop {r0}
	bx r0

	thumb_func_start RechargePadScreen
RechargePadScreen: @ 0x0802C718
	push {lr}
	ldr r0, _0802C734 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802C730
	bl RechargePadScreenInit
_0802C730:
	pop {r0}
	bx r0
	.align 2, 0
_0802C734: .4byte gCurrentSprite

	thumb_func_start AtmosphericSbabilizerCheckIsInfected
AtmosphericSbabilizerCheckIsInfected: @ 0x0802C738
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _0802C784 @ =gSpriteData
	movs r4, #1
_0802C740:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0802C78C
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0802C78C
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x30
	bgt _0802C78C
	cmp r0, #0x2c
	blt _0802C78C
	adds r1, r0, #0
	subs r1, #0x2c
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r0, _0802C788 @ =gAtmosphericStabilizersOnline
	ldrh r0, [r0]
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	bne _0802C796
	movs r0, #1
	b _0802C798
	.align 2, 0
_0802C784: .4byte gSpriteData
_0802C788: .4byte gAtmosphericStabilizersOnline
_0802C78C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0802C740
_0802C796:
	movs r0, #0
_0802C798:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
