    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start TrySpawnMessageBanner
TrySpawnMessageBanner: @ 0x0802A828
	push {r4, r5, lr}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r2, #0x80
	movs r3, #0
	ldr r0, _0802A844 @ =gSpritesetSpriteIds
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0x21
	bne _0802A84C
	ldr r0, _0802A848 @ =gSpritesetSpriteGfxSlots
	b _0802A862
	.align 2, 0
_0802A844: .4byte gSpritesetSpriteIds
_0802A848: .4byte gSpritesetSpriteGfxSlots
_0802A84C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xe
	bhi _0802A864
	adds r0, r3, r4
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _0802A84C
	ldr r0, _0802A888 @ =gSpritesetSpriteGfxSlots
	adds r0, r3, r0
_0802A862:
	ldrb r2, [r0]
_0802A864:
	cmp r2, #7
	bhi _0802A890
	ldr r1, _0802A88C @ =gSamusData
	ldrh r0, [r1, #0x18]
	str r0, [sp]
	ldrh r0, [r1, #0x16]
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x21
	adds r1, r5, #0
	movs r3, #0x10
	bl SpriteSpawnPrimary
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _0802A892
	.align 2, 0
_0802A888: .4byte gSpritesetSpriteGfxSlots
_0802A88C: .4byte gSamusData
_0802A890:
	movs r3, #0x18
_0802A892:
	adds r0, r3, #0
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start MessageBannerInit
MessageBannerInit: @ 0x0802A89C
	push {r4, r5, r6, lr}
	ldr r1, _0802A920 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #2
	ands r0, r2
	mov ip, r1
	cmp r0, #0
	bne _0802A8B6
	movs r0, #2
	orrs r0, r2
	strh r0, [r1]
	movs r0, #0xff
	strb r0, [r1, #0x1e]
_0802A8B6:
	mov r0, ip
	ldrb r6, [r0, #0x1e]
	ldrh r0, [r0]
	movs r3, #0x10
	movs r5, #0
	movs r4, #0
	orrs r0, r3
	mov r1, ip
	strh r0, [r1]
	mov r0, ip
	adds r0, #0x21
	strb r5, [r0]
	adds r0, #4
	strb r5, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x21
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x27
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x29
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, _0802A924 @ =0x0000FFFC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #4
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	ldr r0, _0802A928 @ =sMessageBoxOam_31f758
	str r0, [r2, #0x18]
	strb r5, [r2, #0x1c]
	strh r4, [r2, #0x16]
	movs r0, #9
	strh r0, [r2, #6]
	mov r1, ip
	adds r1, #0x2e
	movs r0, #8
	strb r0, [r1]
	cmp r6, #0xc
	bne _0802A92C
	adds r1, #1
	movs r0, #1
	strb r0, [r1]
	b _0802A932
	.align 2, 0
_0802A920: .4byte gCurrentSprite
_0802A924: .4byte 0x0000FFFC
_0802A928: .4byte sMessageBoxOam_31f758
_0802A92C:
	mov r0, ip
	adds r0, #0x2f
	strb r5, [r0]
_0802A932:
	adds r0, r6, #0
	subs r0, #0x12
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0802A9A2
	movs r3, #0x80
	movs r2, #0
	ldr r0, _0802A954 @ =gSpritesetSpriteIds
	ldrb r1, [r0]
	adds r4, r0, #0
	ldr r5, _0802A958 @ =gPreventMovementTimer
	cmp r1, #0x21
	bne _0802A960
	ldr r0, _0802A95C @ =gSpritesetSpriteGfxSlots
	b _0802A976
	.align 2, 0
_0802A954: .4byte gSpritesetSpriteIds
_0802A958: .4byte gPreventMovementTimer
_0802A95C: .4byte gSpritesetSpriteGfxSlots
_0802A960:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xe
	bhi _0802A978
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0x21
	bne _0802A960
	ldr r0, _0802A98C @ =gSpritesetSpriteGfxSlots
	adds r0, r2, r0
_0802A976:
	ldrb r3, [r0]
_0802A978:
	cmp r3, #7
	bhi _0802A990
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	mov r0, ip
	strb r3, [r0, #0x1f]
	b _0802A998
	.align 2, 0
_0802A98C: .4byte gSpritesetSpriteGfxSlots
_0802A990:
	mov r1, ip
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_0802A998:
	movs r1, #0xfa
	lsls r1, r1, #2
	adds r0, r1, #0
	strh r0, [r5]
	b _0802A9AA
_0802A9A2:
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
_0802A9AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start MessageBannerGfxInit
MessageBannerGfxInit: @ 0x0802A9B0
	push {lr}
	ldr r2, _0802A9D0 @ =gCurrentSprite
	ldrh r0, [r2, #6]
	subs r0, #1
	strh r0, [r2, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #7
	bhi _0802A9D4
	ldrb r1, [r2, #0x1f]
	ldrh r2, [r2, #6]
	movs r0, #0x21
	bl SpriteLoadGfx
	b _0802A9E2
	.align 2, 0
_0802A9D0: .4byte gCurrentSprite
_0802A9D4:
	cmp r0, #8
	bne _0802A9E2
	ldrb r1, [r2, #0x1f]
	movs r0, #0x21
	movs r2, #2
	bl SpriteLoadPal
_0802A9E2:
	ldr r3, _0802A9FC @ =gCurrentSprite
	ldrh r2, [r3, #6]
	cmp r2, #0
	bne _0802A9F6
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
_0802A9F6:
	pop {r0}
	bx r0
	.align 2, 0
_0802A9FC: .4byte gCurrentSprite

	thumb_func_start MessageBannerPopUp
MessageBannerPopUp: @ 0x0802AA00
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r4, _0802AA34 @ =gCurrentSprite
	ldrb r6, [r4, #0x1e]
	adds r2, r4, #0
	adds r2, #0x2e
	ldrb r1, [r2]
	adds r5, r1, #0
	cmp r5, #0
	beq _0802AA92
	ldrb r0, [r4, #0x1c]
	subs r0, #1
	strb r0, [r4, #0x1c]
	subs r0, r1, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802AA66
	ldrh r1, [r4]
	ldr r0, _0802AA38 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r4]
	cmp r6, #0
	bne _0802AA3C
	movs r0, #0x10
	b _0802AA54
	.align 2, 0
_0802AA34: .4byte gCurrentSprite
_0802AA38: .4byte 0x0000FFFB
_0802AA3C:
	subs r0, r6, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _0802AA5C
	cmp r6, #7
	bne _0802AA52
	movs r0, #3
	movs r1, #0xa
	bl PlayMusic
_0802AA52:
	movs r0, #0x3b
_0802AA54:
	movs r1, #0
	bl unk_38a8
	b _0802AA66
_0802AA5C:
	cmp r0, #7
	bls _0802AA66
	movs r0, #0x14
	bl unk_3b1c
_0802AA66:
	ldr r1, _0802AA84 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	cmp r0, #7
	bhi _0802AB0A
	cmp r6, #0
	beq _0802AA88
	ldrb r1, [r1, #0x1f]
	adds r2, r0, #0
	adds r0, r6, #0
	bl TextDrawMessageBanner
	b _0802AB0A
	.align 2, 0
_0802AA84: .4byte gCurrentSprite
_0802AA88:
	ldrb r0, [r1, #0x1f]
	ldrb r1, [r2]
	bl DisplayMessage
	b _0802AB0A
_0802AA92:
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802AB0A
	ldr r0, _0802AAB8 @ =sMessageBoxOam_31f808
	str r0, [r4, #0x18]
	strb r5, [r4, #0x1c]
	strh r5, [r4, #0x16]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x18
	strb r0, [r1]
	cmp r6, #0
	bne _0802AABC
	movs r0, #0xb9
	lsls r0, r0, #1
	strh r0, [r4, #6]
	b _0802AB0A
	.align 2, 0
_0802AAB8: .4byte sMessageBoxOam_31f808
_0802AABC:
	cmp r6, #0xc
	beq _0802AAC4
	cmp r6, #0xe
	bne _0802AAE0
_0802AAC4:
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	movs r0, #0x3f
	str r0, [sp]
	movs r0, #0x96
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #0x26
	movs r1, #0
	bl SpriteSpawnSecondary
	b _0802AAF0
_0802AAE0:
	adds r0, r6, #0
	subs r0, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0802AAF0
	bl EscapeStart
_0802AAF0:
	subs r0, r6, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bhi _0802AB04
	ldr r1, _0802AB00 @ =gCurrentSprite
	movs r0, #0xb4
	b _0802AB08
	.align 2, 0
_0802AB00: .4byte gCurrentSprite
_0802AB04:
	ldr r1, _0802AB14 @ =gCurrentSprite
	movs r0, #0x5a
_0802AB08:
	strh r0, [r1, #6]
_0802AB0A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802AB14: .4byte gCurrentSprite

	thumb_func_start MessageBannerStatic
MessageBannerStatic: @ 0x0802AB18
	push {r4, r5, lr}
	ldr r1, _0802AB38 @ =gCurrentSprite
	ldrb r2, [r1, #0x1e]
	adds r4, r2, #0
	ldr r5, _0802AB3C @ =gPreventMovementTimer
	movs r3, #0xfa
	lsls r3, r3, #2
	adds r0, r3, #0
	strh r0, [r5]
	ldrh r0, [r1, #6]
	cmp r0, #0
	beq _0802AB40
	subs r0, #1
	strh r0, [r1, #6]
	b _0802AB96
	.align 2, 0
_0802AB38: .4byte gCurrentSprite
_0802AB3C: .4byte gPreventMovementTimer
_0802AB40:
	cmp r2, #0xc
	beq _0802AB96
	cmp r2, #0xe
	beq _0802AB96
	ldr r0, _0802AB68 @ =gButtonInput
	ldrh r0, [r0]
	movs r3, #0xf3
	ands r3, r0
	cmp r3, #0
	beq _0802AB82
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
	cmp r2, #0
	bne _0802AB6C
	bl ProjectileLoadBeamGraphics
	bl ProjectileLoadMissileGraphics
	b _0802AB96
	.align 2, 0
_0802AB68: .4byte gButtonInput
_0802AB6C:
	cmp r2, #0xa
	bne _0802AB74
	movs r0, #0x17
	b _0802AB7A
_0802AB74:
	cmp r2, #0xb
	bne _0802AB96
	movs r0, #0x38
_0802AB7A:
	movs r1, #0xa
	bl PlayMusic
	b _0802AB96
_0802AB82:
	cmp r4, #8
	bne _0802AB96
	ldr r0, _0802AB9C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x3b
	bne _0802AB96
	strh r3, [r5]
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
_0802AB96:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802AB9C: .4byte gSamusData

	thumb_func_start MessageBannerRemovalInit
MessageBannerRemovalInit: @ 0x0802ABA0
	push {lr}
	ldr r0, _0802ABD8 @ =gCurrentSprite
	ldrb r2, [r0, #0x1e]
	cmp r2, #8
	beq _0802ABC0
	ldr r1, _0802ABDC @ =gPreventMovementTimer
	movs r0, #0
	strh r0, [r1]
	adds r0, r2, #0
	subs r0, #0x12
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _0802ABC0
	bl FinishCollectingTank
_0802ABC0:
	ldr r1, _0802ABD8 @ =gCurrentSprite
	ldr r0, _0802ABE0 @ =sMessageBoxOam_31f7b0
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x1a
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0802ABD8: .4byte gCurrentSprite
_0802ABDC: .4byte gPreventMovementTimer
_0802ABE0: .4byte sMessageBoxOam_31f7b0

	thumb_func_start MesageBannerRemoval
MesageBannerRemoval: @ 0x0802ABE4
	push {lr}
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _0802AC12
	ldr r1, _0802AC18 @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	ldrb r0, [r1, #0x1e]
	cmp r0, #0xe
	bne _0802AC12
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802AC12
	ldr r1, _0802AC1C @ =gPauseScreenFlag
	movs r0, #3
	strb r0, [r1]
	ldr r1, _0802AC20 @ =gSubGameMode1
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0802AC12:
	pop {r0}
	bx r0
	.align 2, 0
_0802AC18: .4byte gCurrentSprite
_0802AC1C: .4byte gPauseScreenFlag
_0802AC20: .4byte gSubGameMode1

	thumb_func_start MessageBanner
MessageBanner: @ 0x0802AC24
	push {lr}
	ldr r0, _0802AC44 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x1a
	bhi _0802ACDA
	lsls r0, r0, #2
	ldr r1, _0802AC48 @ =_0802AC4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802AC44: .4byte gCurrentSprite
_0802AC48: .4byte _0802AC4C
_0802AC4C: @ jump table
	.4byte _0802ACB8 @ case 0
	.4byte _0802ACBE @ case 1
	.4byte _0802ACC4 @ case 2
	.4byte _0802ACDA @ case 3
	.4byte _0802ACDA @ case 4
	.4byte _0802ACDA @ case 5
	.4byte _0802ACDA @ case 6
	.4byte _0802ACDA @ case 7
	.4byte _0802ACDA @ case 8
	.4byte _0802ACDA @ case 9
	.4byte _0802ACDA @ case 10
	.4byte _0802ACDA @ case 11
	.4byte _0802ACDA @ case 12
	.4byte _0802ACDA @ case 13
	.4byte _0802ACDA @ case 14
	.4byte _0802ACDA @ case 15
	.4byte _0802ACDA @ case 16
	.4byte _0802ACDA @ case 17
	.4byte _0802ACDA @ case 18
	.4byte _0802ACDA @ case 19
	.4byte _0802ACDA @ case 20
	.4byte _0802ACDA @ case 21
	.4byte _0802ACDA @ case 22
	.4byte _0802ACDA @ case 23
	.4byte _0802ACCA @ case 24
	.4byte _0802ACD0 @ case 25
	.4byte _0802ACD6 @ case 26
_0802ACB8:
	bl MessageBannerInit
	b _0802ACDA
_0802ACBE:
	bl MessageBannerGfxInit
	b _0802ACDA
_0802ACC4:
	bl MessageBannerPopUp
	b _0802ACDA
_0802ACCA:
	bl MessageBannerStatic
	b _0802ACDA
_0802ACD0:
	bl MessageBannerRemovalInit
	b _0802ACDA
_0802ACD6:
	bl MesageBannerRemoval
_0802ACDA:
	ldr r0, _0802ACE8 @ =gCurrentSprite
	movs r1, #0x36
	strh r1, [r0, #2]
	movs r1, #0x78
	strh r1, [r0, #4]
	pop {r0}
	bx r0
	.align 2, 0
_0802ACE8: .4byte gCurrentSprite

	thumb_func_start SaveYesNoCursor
SaveYesNoCursor: @ 0x0802ACEC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r5, _0802AD20 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x26
	movs r1, #0
	mov r8, r1
	movs r2, #1
	strb r2, [r0]
	subs r0, #3
	ldrb r6, [r0]
	adds r7, r5, #0
	adds r7, #0x24
	ldrb r0, [r7]
	cmp r0, #0x38
	bne _0802AD10
	b _0802AE50
_0802AD10:
	cmp r0, #0x38
	bgt _0802AD24
	cmp r0, #0
	beq _0802AD32
	cmp r0, #2
	beq _0802ADB0
	b _0802AE72
	.align 2, 0
_0802AD20: .4byte gCurrentSprite
_0802AD24:
	cmp r0, #0x3a
	bne _0802AD2A
	b _0802AE5C
_0802AD2A:
	cmp r0, #0x3c
	bne _0802AD30
	b _0802AE68
_0802AD30:
	b _0802AE72
_0802AD32:
	ldrh r0, [r5]
	movs r3, #0x10
	movs r4, #0
	orrs r0, r3
	ldr r1, _0802ADA0 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x21
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x22
	movs r0, #3
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x25
	strb r4, [r0]
	adds r2, r5, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #0x21
	orrs r0, r1
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x27
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r1, _0802ADA4 @ =0x0000FFFC
	strh r1, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #0xc]
	strh r1, [r5, #0xe]
	strh r0, [r5, #0x10]
	ldr r0, _0802ADA8 @ =sMessageBoxOam_31f730
	str r0, [r5, #0x18]
	strb r4, [r5, #0x1c]
	mov r0, r8
	strh r0, [r5, #0x16]
	movs r0, #2
	strb r0, [r7]
	movs r0, #0x3f
	strh r0, [r5, #2]
	ldr r1, _0802ADAC @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrb r0, [r0, #0x1e]
	cmp r0, #0xc
	beq _0802ADCA
	b _0802ADEA
	.align 2, 0
_0802ADA0: .4byte 0x0000FFFB
_0802ADA4: .4byte 0x0000FFFC
_0802ADA8: .4byte sMessageBoxOam_31f730
_0802ADAC: .4byte gSpriteData
_0802ADB0:
	ldr r0, _0802ADD0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802ADD4
	ldrh r0, [r5, #4]
	cmp r0, #0x36
	beq _0802AE72
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
_0802ADCA:
	movs r0, #0x36
	strh r0, [r5, #4]
	b _0802AE72
	.align 2, 0
_0802ADD0: .4byte gChangedInput
_0802ADD4:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0802ADF0
	ldrh r0, [r5, #4]
	cmp r0, #0x96
	beq _0802AE72
	movs r0, #0xfd
	lsls r0, r0, #1
	bl SoundPlay
_0802ADEA:
	movs r0, #0x96
	strh r0, [r5, #4]
	b _0802AE72
_0802ADF0:
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0802AE72
	ldr r0, _0802AE28 @ =0x000001FB
	bl SoundPlay
	ldr r1, _0802AE2C @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x19
	strb r0, [r1]
	ldrh r0, [r5, #4]
	cmp r0, #0x36
	bne _0802AE3A
	ldrb r0, [r2, #0x1e]
	cmp r0, #0xc
	bne _0802AE30
	movs r0, #0
	bl Sram_QuickSave
	movs r0, #0x38
	strb r0, [r7]
	b _0802AE72
	.align 2, 0
_0802AE28: .4byte 0x000001FB
_0802AE2C: .4byte gSpriteData
_0802AE30:
	adds r1, r2, #0
	adds r1, #0x2f
	movs r0, #1
	strb r0, [r1]
	b _0802AE42
_0802AE3A:
	adds r0, r2, #0
	adds r0, #0x2f
	mov r1, r8
	strb r1, [r0]
_0802AE42:
	ldr r1, _0802AE4C @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	b _0802AE72
	.align 2, 0
_0802AE4C: .4byte gCurrentSprite
_0802AE50:
	movs r0, #1
	bl Sram_QuickSave
	movs r0, #0x3a
	strb r0, [r7]
	b _0802AE72
_0802AE5C:
	movs r0, #2
	bl Sram_QuickSave
	movs r0, #0x3c
	strb r0, [r7]
	b _0802AE72
_0802AE68:
	movs r0, #3
	bl Sram_QuickSave
	mov r0, r8
	strh r0, [r5]
_0802AE72:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
