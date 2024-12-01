    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start FuneInit
FuneInit: @ 0x08034958
	push {r4, r5, r6, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08034984 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08034988
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08034988
	strh r0, [r2]
	b _08034A44
	.align 2, 0
_08034984: .4byte gCurrentSprite
_08034988:
	ldr r1, _080349A0 @ =gCurrentSprite
	adds r5, r1, #0
	adds r5, #0x24
	ldrb r0, [r5]
	adds r4, r1, #0
	cmp r0, #0x59
	bne _080349A4
	movs r0, #0x5a
	strb r0, [r5]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _080349C6
	.align 2, 0
_080349A0: .4byte gCurrentSprite
_080349A4:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08034A2C @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080349C2
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
_080349C2:
	movs r0, #1
	strb r0, [r5]
_080349C6:
	adds r1, r4, #0
	adds r1, #0x25
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0x60
	strb r0, [r1]
	movs r6, #0
	ldr r3, _08034A30 @ =0x0000FFD8
	strh r3, [r4, #0xa]
	movs r5, #0x28
	strh r5, [r4, #0xc]
	ldr r0, _08034A34 @ =sFuneOam_341568
	str r0, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r2, [r4, #0x16]
	subs r1, #7
	movs r0, #3
	strb r0, [r1]
	adds r1, #0x13
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4, #4]
	strh r0, [r4, #8]
	ldr r2, _08034A38 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	ldrh r1, [r4]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08034A40
	ldr r0, _08034A3C @ =0x0000FFC0
	strh r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	b _08034A44
	.align 2, 0
_08034A2C: .4byte gPreviousCollisionCheck
_08034A30: .4byte 0x0000FFD8
_08034A34: .4byte sFuneOam_341568
_08034A38: .4byte sPrimarySpriteStats
_08034A3C: .4byte 0x0000FFC0
_08034A40:
	strh r3, [r4, #0xe]
	strh r2, [r4, #0x10]
_08034A44:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FuneDying
FuneDying: @ 0x08034A4C
	ldr r1, _08034A58 @ =gCurrentSprite
	ldrb r0, [r1, #0x1c]
	subs r0, #1
	strb r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_08034A58: .4byte gCurrentSprite

	thumb_func_start FuneTurningIntoX
FuneTurningIntoX: @ 0x08034A5C
	push {r4, lr}
	sub sp, #0x10
	ldr r1, _08034A78 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x14
	strh r0, [r1, #2]
	ldrh r0, [r1, #8]
	adds r2, r1, #0
	ldrh r1, [r2, #4]
	cmp r0, r1
	bls _08034A7C
	ldrh r0, [r2, #8]
	ldrh r1, [r2, #4]
	b _08034A80
	.align 2, 0
_08034A78: .4byte gCurrentSprite
_08034A7C:
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
_08034A80:
	subs r0, r0, r1
	asrs r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	adds r0, #0x14
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FuneCheckSamusInFront
FuneCheckSamusInFront: @ 0x08034AB4
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0x48
	movs r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	beq _08034ACE
	movs r0, #0
	b _08034AD8
_08034ACE:
	ldr r0, _08034ADC @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2b
	strb r1, [r0]
	movs r0, #1
_08034AD8:
	pop {r1}
	bx r1
	.align 2, 0
_08034ADC: .4byte gCurrentSprite

	thumb_func_start FuneIdleInit
FuneIdleInit: @ 0x08034AE0
	ldr r1, _08034AF4 @ =gCurrentSprite
	ldr r0, _08034AF8 @ =sFuneOam_341568
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08034AF4: .4byte gCurrentSprite
_08034AF8: .4byte sFuneOam_341568

	thumb_func_start FuneIdle
FuneIdle: @ 0x08034AFC
	push {r4, r5, lr}
	ldr r5, _08034B28 @ =gCurrentSprite
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08034BDE
	bl FuneCheckSamusInFront
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08034BDE
	movs r4, #0
	ldrh r0, [r5, #0x16]
	cmp r0, #7
	bhi _08034BAE
	lsls r0, r0, #2
	ldr r1, _08034B2C @ =_08034B30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08034B28: .4byte gCurrentSprite
_08034B2C: .4byte _08034B30
_08034B30: @ jump table
	.4byte _08034B50 @ case 0
	.4byte _08034B7C @ case 1
	.4byte _08034B8C @ case 2
	.4byte _08034BA0 @ case 3
	.4byte _08034BAE @ case 4
	.4byte _08034B7C @ case 5
	.4byte _08034B8C @ case 6
	.4byte _08034BA0 @ case 7
_08034B50:
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _08034BAE
	ldr r0, _08034B78 @ =gCurrentSprite
	ldrb r1, [r0, #0x1c]
	subs r1, #1
	strb r1, [r0, #0x1c]
	adds r0, #0x24
	movs r1, #0x29
	strb r1, [r0]
	b _08034BDE
	.align 2, 0
_08034B78: .4byte gCurrentSprite
_08034B7C:
	ldr r0, _08034B88 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #8
	beq _08034BAC
	b _08034B94
	.align 2, 0
_08034B88: .4byte gCurrentSprite
_08034B8C:
	ldr r0, _08034B9C @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #8
	beq _08034B98
_08034B94:
	cmp r0, #0xf
	bne _08034BAE
_08034B98:
	movs r4, #4
	b _08034BAE
	.align 2, 0
_08034B9C: .4byte gCurrentSprite
_08034BA0:
	ldr r0, _08034BC8 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #8
	beq _08034B98
	cmp r0, #0xf
	bne _08034BAE
_08034BAC:
	movs r4, #2
_08034BAE:
	ldr r2, _08034BC8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08034BCC
	ldrh r0, [r2, #0x16]
	cmp r0, #3
	bhi _08034BD8
	ldrh r0, [r2, #4]
	adds r0, r4, r0
	b _08034BDC
	.align 2, 0
_08034BC8: .4byte gCurrentSprite
_08034BCC:
	ldrh r0, [r2, #0x16]
	cmp r0, #3
	bls _08034BD8
	ldrh r0, [r2, #4]
	adds r0, r4, r0
	b _08034BDC
_08034BD8:
	ldrh r0, [r2, #4]
	subs r0, r0, r4
_08034BDC:
	strh r0, [r2, #4]
_08034BDE:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start FuneSpittingInit
FuneSpittingInit: @ 0x08034BE4
	ldr r1, _08034BF8 @ =gCurrentSprite
	ldr r0, _08034BFC @ =sFuneOam_3415b0
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bx lr
	.align 2, 0
_08034BF8: .4byte gCurrentSprite
_08034BFC: .4byte sFuneOam_3415b0

	thumb_func_start FuneSpitting
FuneSpitting: @ 0x08034C00
	push {r4, r5, r6, lr}
	sub sp, #0xc
	bl FuneCheckSamusInFront
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08034C10
	b _08034D0E
_08034C10:
	movs r5, #0
	ldr r0, _08034C28 @ =gCurrentSprite
	ldrh r2, [r0, #0x16]
	adds r3, r0, #0
	cmp r2, #7
	bhi _08034CDE
	lsls r0, r2, #2
	ldr r1, _08034C2C @ =_08034C30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08034C28: .4byte gCurrentSprite
_08034C2C: .4byte _08034C30
_08034C30: @ jump table
	.4byte _08034C50 @ case 0
	.4byte _08034C50 @ case 1
	.4byte _08034C50 @ case 2
	.4byte _08034C78 @ case 3
	.4byte _08034C50 @ case 4
	.4byte _08034C50 @ case 5
	.4byte _08034C50 @ case 6
	.4byte _08034C5C @ case 7
_08034C50:
	ldr r0, _08034C58 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	b _08034C6C
	.align 2, 0
_08034C58: .4byte gCurrentSprite
_08034C5C:
	ldrb r0, [r3, #0x1c]
	cmp r0, #0x28
	bne _08034C6C
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _08034D0E
_08034C6C:
	cmp r0, #1
	beq _08034C74
	cmp r0, #2
	bne _08034CDE
_08034C74:
	movs r5, #4
	b _08034CDE
_08034C78:
	ldr r0, _08034CBC @ =gCurrentSprite
	mov ip, r0
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	beq _08034C74
	cmp r0, #2
	beq _08034C74
	cmp r0, #4
	bne _08034CDE
	mov r4, ip
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _08034CC0
	mov r0, ip
	ldrb r1, [r0, #0x1e]
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	adds r0, #0x10
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #0x2f
	bl SpriteSpawnSecondary
	b _08034CDE
	.align 2, 0
_08034CBC: .4byte gCurrentSprite
_08034CC0:
	mov r6, ip
	ldrb r1, [r6, #0x1e]
	ldrb r2, [r6, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r6, #2]
	adds r0, #0x10
	str r0, [sp]
	ldrh r0, [r6, #4]
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x2f
	bl SpriteSpawnSecondary
_08034CDE:
	ldr r2, _08034CF8 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08034CFC
	ldrh r0, [r2, #0x16]
	cmp r0, #3
	bhi _08034D08
	ldrh r0, [r2, #4]
	adds r0, r5, r0
	b _08034D0C
	.align 2, 0
_08034CF8: .4byte gCurrentSprite
_08034CFC:
	ldrh r0, [r2, #0x16]
	cmp r0, #3
	bls _08034D08
	ldrh r0, [r2, #4]
	adds r0, r5, r0
	b _08034D0C
_08034D08:
	ldrh r0, [r2, #4]
	subs r0, r0, r5
_08034D0C:
	strh r0, [r2, #4]
_08034D0E:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FuneLungingInit
FuneLungingInit: @ 0x08034D18
	push {lr}
	ldr r1, _08034D38 @ =gCurrentSprite
	ldr r0, _08034D3C @ =sFuneOam_3415f8
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	ldr r0, _08034D40 @ =0x00000187
	bl SoundPlayNotAlreadyPlaying
	pop {r0}
	bx r0
	.align 2, 0
_08034D38: .4byte gCurrentSprite
_08034D3C: .4byte sFuneOam_3415f8
_08034D40: .4byte 0x00000187

	thumb_func_start FuneLunging
FuneLunging: @ 0x08034D44
	push {r4, lr}
	movs r3, #0
	ldr r1, _08034D60 @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	subs r0, #4
	adds r4, r1, #0
	cmp r0, #0x15
	bhi _08034DF6
	lsls r0, r0, #2
	ldr r1, _08034D64 @ =_08034D68
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08034D60: .4byte gCurrentSprite
_08034D64: .4byte _08034D68
_08034D68: @ jump table
	.4byte _08034DC0 @ case 0
	.4byte _08034DC0 @ case 1
	.4byte _08034DC0 @ case 2
	.4byte _08034DC0 @ case 3
	.4byte _08034DC0 @ case 4
	.4byte _08034DC0 @ case 5
	.4byte _08034DCE @ case 6
	.4byte _08034DDC @ case 7
	.4byte _08034DDC @ case 8
	.4byte _08034DDC @ case 9
	.4byte _08034DDC @ case 10
	.4byte _08034DDC @ case 11
	.4byte _08034DDC @ case 12
	.4byte _08034DDC @ case 13
	.4byte _08034DDC @ case 14
	.4byte _08034DDC @ case 15
	.4byte _08034DDC @ case 16
	.4byte _08034DF6 @ case 17
	.4byte _08034DF6 @ case 18
	.4byte _08034DF6 @ case 19
	.4byte _08034DF6 @ case 20
	.4byte _08034DE8 @ case 21
_08034DC0:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	beq _08034DCA
	cmp r0, #3
	bne _08034DF6
_08034DCA:
	movs r3, #0x18
	b _08034DF6
_08034DCE:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	beq _08034DD8
	cmp r0, #3
	bne _08034DF6
_08034DD8:
	movs r3, #0x10
	b _08034DF6
_08034DDC:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	beq _08034DD8
	cmp r0, #2
	bne _08034DF6
	b _08034DD8
_08034DE8:
	ldrb r0, [r4, #0x1c]
	cmp r0, #0x28
	bne _08034DF6
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
_08034DF6:
	adds r2, r4, #0
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08034E24
	ldrh r0, [r2, #0x16]
	cmp r0, #0xa
	bls _08034E16
	ldrh r0, [r2, #4]
	subs r0, r0, r3
	strh r0, [r2, #4]
	ldrh r0, [r2, #0xe]
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	b _08034E44
_08034E16:
	ldrh r0, [r2, #4]
	adds r0, r3, r0
	strh r0, [r2, #4]
	ldrh r0, [r2, #0xe]
	subs r0, r0, r3
	strh r0, [r2, #0xe]
	b _08034E44
_08034E24:
	ldrh r0, [r2, #0x16]
	cmp r0, #0xa
	bls _08034E38
	ldrh r0, [r2, #4]
	adds r0, r3, r0
	strh r0, [r2, #4]
	ldrh r0, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x10]
	b _08034E44
_08034E38:
	ldrh r0, [r4, #4]
	subs r0, r0, r3
	strh r0, [r4, #4]
	ldrh r0, [r4, #0x10]
	adds r0, r3, r0
	strh r0, [r4, #0x10]
_08034E44:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FuneLungingEnd
FuneLungingEnd: @ 0x08034E4C
	push {lr}
	ldr r1, _08034E68 @ =gCurrentSprite
	ldrb r0, [r1, #0x1c]
	subs r0, #1
	strb r0, [r1, #0x1c]
	ldrh r0, [r1, #4]
	adds r3, r0, #0
	ldrh r2, [r1, #8]
	cmp r3, r2
	bhs _08034E6C
	adds r0, #1
	strh r0, [r1, #4]
	b _08034E7C
	.align 2, 0
_08034E68: .4byte gCurrentSprite
_08034E6C:
	cmp r3, r2
	bls _08034E76
	subs r0, #1
	strh r0, [r1, #4]
	b _08034E7C
_08034E76:
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_08034E7C:
	pop {r0}
	bx r0

	thumb_func_start FuneSpitInit
FuneSpitInit: @ 0x08034E80
	push {r4, lr}
	ldr r0, _08034EE8 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08034EEC @ =0x0000FFFB
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
	ldr r0, _08034EF0 @ =0x0000FFF0
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _08034EF4 @ =sFuneOam_3416d0
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r1, #0x10
	movs r0, #1
	strb r0, [r1]
	movs r0, #0xc3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034EE8: .4byte gCurrentSprite
_08034EEC: .4byte 0x0000FFFB
_08034EF0: .4byte 0x0000FFF0
_08034EF4: .4byte sFuneOam_3416d0

	thumb_func_start FuneSpitMoving
FuneSpitMoving: @ 0x08034EF8
	push {r4, lr}
	ldr r4, _08034F18 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	ldr r0, _08034F1C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08034F20
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _08034F36
	.align 2, 0
_08034F18: .4byte gCurrentSprite
_08034F1C: .4byte gPreviousVerticalCollisionCheck
_08034F20:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08034F30
	ldrh r0, [r4, #4]
	adds r0, #0xa
	b _08034F34
_08034F30:
	ldrh r0, [r4, #4]
	subs r0, #0xa
_08034F34:
	strh r0, [r4, #4]
_08034F36:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FuneSpitExplodingInit
FuneSpitExplodingInit: @ 0x08034F3C
	ldr r3, _08034F58 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	ldr r0, _08034F5C @ =sFuneOam_3416f0
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_08034F58: .4byte gCurrentSprite
_08034F5C: .4byte sFuneOam_3416f0

	thumb_func_start FuneSpitExploding
FuneSpitExploding: @ 0x08034F60
	push {r4, lr}
	ldr r4, _08034F80 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08034F78
	movs r0, #0
	strh r0, [r4]
_08034F78:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034F80: .4byte gCurrentSprite

	thumb_func_start NamiheInit
NamiheInit: @ 0x08034F84
	push {r4, r5, r6, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r2, _08034FB0 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08034FB4
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _08034FB4
	strh r0, [r2]
	b _08035068
	.align 2, 0
_08034FB0: .4byte gCurrentSprite
_08034FB4:
	ldr r1, _08034FCC @ =gCurrentSprite
	adds r5, r1, #0
	adds r5, #0x24
	ldrb r0, [r5]
	adds r4, r1, #0
	cmp r0, #0x59
	bne _08034FD0
	movs r0, #0x5a
	strb r0, [r5]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _08034FF2
	.align 2, 0
_08034FCC: .4byte gCurrentSprite
_08034FD0:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x40
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _08035050 @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08034FEE
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
_08034FEE:
	movs r0, #1
	strb r0, [r5]
_08034FF2:
	adds r1, r4, #0
	adds r1, #0x25
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x27
	movs r1, #0x20
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0x60
	strb r0, [r1]
	movs r6, #0
	ldr r3, _08035054 @ =0x0000FFD8
	strh r3, [r4, #0xa]
	movs r5, #0x28
	strh r5, [r4, #0xc]
	ldr r0, _08035058 @ =sNamiheOam_341e6c
	str r0, [r4, #0x18]
	strb r6, [r4, #0x1c]
	strh r2, [r4, #0x16]
	subs r1, #7
	movs r0, #3
	strb r0, [r1]
	ldrh r0, [r4, #4]
	strh r0, [r4, #8]
	ldr r2, _0803505C @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r4, #0x14]
	ldrh r1, [r4]
	movs r2, #0x40
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08035064
	ldr r0, _08035060 @ =0x0000FFC0
	strh r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	b _08035068
	.align 2, 0
_08035050: .4byte gPreviousCollisionCheck
_08035054: .4byte 0x0000FFD8
_08035058: .4byte sNamiheOam_341e6c
_0803505C: .4byte sPrimarySpriteStats
_08035060: .4byte 0x0000FFC0
_08035064:
	strh r3, [r4, #0xe]
	strh r2, [r4, #0x10]
_08035068:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NamiheDying
NamiheDying: @ 0x08035070
	ldr r1, _0803507C @ =gCurrentSprite
	ldrb r0, [r1, #0x1c]
	subs r0, #1
	strb r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_0803507C: .4byte gCurrentSprite

	thumb_func_start NamiheTurningIntoX
NamiheTurningIntoX: @ 0x08035080
	push {r4, lr}
	sub sp, #0x10
	ldr r1, _0803509C @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, #0x14
	strh r0, [r1, #2]
	ldrh r0, [r1, #8]
	adds r2, r1, #0
	ldrh r1, [r2, #4]
	cmp r0, r1
	bls _080350A0
	ldrh r0, [r2, #8]
	ldrh r1, [r2, #4]
	b _080350A4
	.align 2, 0
_0803509C: .4byte gCurrentSprite
_080350A0:
	ldrh r0, [r2, #4]
	ldrh r1, [r2, #8]
_080350A4:
	subs r0, r0, r1
	asrs r0, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldrb r1, [r2, #0x1d]
	adds r0, r2, #0
	adds r0, #0x23
	ldrb r3, [r0]
	adds r0, #7
	ldrb r0, [r0]
	str r0, [sp]
	ldrh r0, [r2, #2]
	adds r0, #0x14
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	movs r0, #0x38
	movs r2, #0
	bl SpriteSpawnNewXParasite
	add sp, #0x10
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NamiheCheckSamusInFront
NamiheCheckSamusInFront: @ 0x080350D8
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #2
	movs r0, #0x48
	movs r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	beq _080350F2
	movs r0, #0
	b _080350FC
_080350F2:
	ldr r0, _08035100 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x2b
	strb r1, [r0]
	movs r0, #1
_080350FC:
	pop {r1}
	bx r1
	.align 2, 0
_08035100: .4byte gCurrentSprite

	thumb_func_start NamiheIdleInit
NamiheIdleInit: @ 0x08035104
	ldr r1, _08035118 @ =gCurrentSprite
	ldr r0, _0803511C @ =sNamiheOam_341e6c
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	bx lr
	.align 2, 0
_08035118: .4byte gCurrentSprite
_0803511C: .4byte sNamiheOam_341e6c

	thumb_func_start NamiheIdle
NamiheIdle: @ 0x08035120
	push {r4, r5, lr}
	ldr r5, _0803514C @ =gCurrentSprite
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08035202
	bl NamiheCheckSamusInFront
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08035202
	movs r4, #0
	ldrh r0, [r5, #0x16]
	cmp r0, #7
	bhi _080351D2
	lsls r0, r0, #2
	ldr r1, _08035150 @ =_08035154
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803514C: .4byte gCurrentSprite
_08035150: .4byte _08035154
_08035154: @ jump table
	.4byte _08035174 @ case 0
	.4byte _080351A0 @ case 1
	.4byte _080351B0 @ case 2
	.4byte _080351C4 @ case 3
	.4byte _080351D2 @ case 4
	.4byte _080351A0 @ case 5
	.4byte _080351B0 @ case 6
	.4byte _080351C4 @ case 7
_08035174:
	movs r0, #0xa0
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0
	bl SpriteUtilCheckSamusNearSpriteFrontBehind
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080351D2
	ldr r0, _0803519C @ =gCurrentSprite
	ldrb r1, [r0, #0x1c]
	subs r1, #1
	strb r1, [r0, #0x1c]
	adds r0, #0x24
	movs r1, #0x29
	strb r1, [r0]
	b _08035202
	.align 2, 0
_0803519C: .4byte gCurrentSprite
_080351A0:
	ldr r0, _080351AC @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #8
	beq _080351D0
	b _080351B8
	.align 2, 0
_080351AC: .4byte gCurrentSprite
_080351B0:
	ldr r0, _080351C0 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #8
	beq _080351BC
_080351B8:
	cmp r0, #0xf
	bne _080351D2
_080351BC:
	movs r4, #4
	b _080351D2
	.align 2, 0
_080351C0: .4byte gCurrentSprite
_080351C4:
	ldr r0, _080351EC @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #8
	beq _080351BC
	cmp r0, #0xf
	bne _080351D2
_080351D0:
	movs r4, #2
_080351D2:
	ldr r2, _080351EC @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080351F0
	ldrh r0, [r2, #0x16]
	cmp r0, #3
	bhi _080351FC
	ldrh r0, [r2, #4]
	adds r0, r4, r0
	b _08035200
	.align 2, 0
_080351EC: .4byte gCurrentSprite
_080351F0:
	ldrh r0, [r2, #0x16]
	cmp r0, #3
	bls _080351FC
	ldrh r0, [r2, #4]
	adds r0, r4, r0
	b _08035200
_080351FC:
	ldrh r0, [r2, #4]
	subs r0, r0, r4
_08035200:
	strh r0, [r2, #4]
_08035202:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NamiheSpittingInit
NamiheSpittingInit: @ 0x08035208
	ldr r1, _0803521C @ =gCurrentSprite
	ldr r0, _08035220 @ =sNamiheOam_341eb4
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x2a
	strb r0, [r1]
	bx lr
	.align 2, 0
_0803521C: .4byte gCurrentSprite
_08035220: .4byte sNamiheOam_341eb4

	thumb_func_start NamiheSpitting
NamiheSpitting: @ 0x08035224
	push {r4, r5, r6, lr}
	sub sp, #0xc
	bl NamiheCheckSamusInFront
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08035234
	b _0803533E
_08035234:
	movs r5, #0
	ldr r1, _0803524C @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	subs r0, #4
	adds r2, r1, #0
	cmp r0, #0xb
	bhi _0803530E
	lsls r0, r0, #2
	ldr r1, _08035250 @ =_08035254
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803524C: .4byte gCurrentSprite
_08035250: .4byte _08035254
_08035254: @ jump table
	.4byte _08035284 @ case 0
	.4byte _08035284 @ case 1
	.4byte _08035284 @ case 2
	.4byte _08035298 @ case 3
	.4byte _08035284 @ case 4
	.4byte _08035284 @ case 5
	.4byte _08035284 @ case 6
	.4byte _08035284 @ case 7
	.4byte _0803530E @ case 8
	.4byte _0803530E @ case 9
	.4byte _0803530E @ case 10
	.4byte _080352FE @ case 11
_08035284:
	ldr r0, _08035294 @ =gCurrentSprite
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	beq _08035290
	cmp r0, #2
	bne _0803530E
_08035290:
	movs r5, #4
	b _0803530E
	.align 2, 0
_08035294: .4byte gCurrentSprite
_08035298:
	ldr r0, _080352D8 @ =gCurrentSprite
	mov ip, r0
	ldrb r0, [r0, #0x1c]
	cmp r0, #1
	beq _08035290
	cmp r0, #2
	beq _08035290
	cmp r0, #4
	bne _0803530E
	mov r4, ip
	ldrh r1, [r4]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080352DC
	mov r0, ip
	ldrb r1, [r0, #0x1e]
	ldrb r2, [r0, #0x1f]
	adds r0, #0x23
	ldrb r3, [r0]
	mov r4, ip
	ldrh r0, [r4, #2]
	adds r0, #0x20
	str r0, [sp]
	ldrh r0, [r4, #4]
	adds r0, #0x10
	str r0, [sp, #4]
	str r6, [sp, #8]
	b _080352F6
	.align 2, 0
_080352D8: .4byte gCurrentSprite
_080352DC:
	mov r6, ip
	ldrb r1, [r6, #0x1e]
	ldrb r2, [r6, #0x1f]
	mov r0, ip
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r6, #2]
	adds r0, #0x20
	str r0, [sp]
	ldrh r0, [r6, #4]
	subs r0, #0x10
	str r0, [sp, #4]
	str r4, [sp, #8]
_080352F6:
	movs r0, #0x2e
	bl SpriteSpawnSecondary
	b _0803530E
_080352FE:
	ldrb r0, [r2, #0x1c]
	cmp r0, #0x28
	bne _0803530E
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
	b _0803533E
_0803530E:
	ldr r2, _08035328 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0803532C
	ldrh r0, [r2, #0x16]
	cmp r0, #7
	bhi _08035338
	ldrh r0, [r2, #4]
	adds r0, r5, r0
	b _0803533C
	.align 2, 0
_08035328: .4byte gCurrentSprite
_0803532C:
	ldrh r0, [r2, #0x16]
	cmp r0, #7
	bls _08035338
	ldrh r0, [r2, #4]
	adds r0, r5, r0
	b _0803533C
_08035338:
	ldrh r0, [r2, #4]
	subs r0, r0, r5
_0803533C:
	strh r0, [r2, #4]
_0803533E:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NamiheLungingInit
NamiheLungingInit: @ 0x08035348
	push {lr}
	ldr r1, _08035368 @ =gCurrentSprite
	ldr r0, _0803536C @ =sNamiheOam_341f3c
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	adds r1, #0x24
	movs r0, #0x2c
	strb r0, [r1]
	movs r0, #0xc5
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	pop {r0}
	bx r0
	.align 2, 0
_08035368: .4byte gCurrentSprite
_0803536C: .4byte sNamiheOam_341f3c

	thumb_func_start NamiheLunging
NamiheLunging: @ 0x08035370
	push {r4, lr}
	movs r3, #0
	ldr r1, _0803538C @ =gCurrentSprite
	ldrh r0, [r1, #0x16]
	subs r0, #0xc
	adds r4, r1, #0
	cmp r0, #0x19
	bhi _08035432
	lsls r0, r0, #2
	ldr r1, _08035390 @ =_08035394
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0803538C: .4byte gCurrentSprite
_08035390: .4byte _08035394
_08035394: @ jump table
	.4byte _080353FC @ case 0
	.4byte _080353FC @ case 1
	.4byte _080353FC @ case 2
	.4byte _080353FC @ case 3
	.4byte _080353FC @ case 4
	.4byte _080353FC @ case 5
	.4byte _0803540A @ case 6
	.4byte _08035418 @ case 7
	.4byte _08035418 @ case 8
	.4byte _08035418 @ case 9
	.4byte _08035418 @ case 10
	.4byte _08035418 @ case 11
	.4byte _08035418 @ case 12
	.4byte _08035418 @ case 13
	.4byte _08035418 @ case 14
	.4byte _08035418 @ case 15
	.4byte _08035418 @ case 16
	.4byte _08035432 @ case 17
	.4byte _08035432 @ case 18
	.4byte _08035432 @ case 19
	.4byte _08035432 @ case 20
	.4byte _08035432 @ case 21
	.4byte _08035432 @ case 22
	.4byte _08035432 @ case 23
	.4byte _08035432 @ case 24
	.4byte _08035424 @ case 25
_080353FC:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	beq _08035406
	cmp r0, #3
	bne _08035432
_08035406:
	movs r3, #0x18
	b _08035432
_0803540A:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	beq _08035414
	cmp r0, #3
	bne _08035432
_08035414:
	movs r3, #0x10
	b _08035432
_08035418:
	ldrb r0, [r4, #0x1c]
	cmp r0, #1
	beq _08035414
	cmp r0, #2
	bne _08035432
	b _08035414
_08035424:
	ldrb r0, [r4, #0x1c]
	cmp r0, #0x28
	bne _08035432
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x2e
	strb r0, [r1]
_08035432:
	adds r2, r4, #0
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08035460
	ldrh r0, [r2, #0x16]
	cmp r0, #0x12
	bls _08035452
	ldrh r0, [r2, #4]
	subs r0, r0, r3
	strh r0, [r2, #4]
	ldrh r0, [r2, #0xe]
	adds r0, r3, r0
	strh r0, [r2, #0xe]
	b _08035480
_08035452:
	ldrh r0, [r2, #4]
	adds r0, r3, r0
	strh r0, [r2, #4]
	ldrh r0, [r2, #0xe]
	subs r0, r0, r3
	strh r0, [r2, #0xe]
	b _08035480
_08035460:
	ldrh r0, [r2, #0x16]
	cmp r0, #0x12
	bls _08035474
	ldrh r0, [r2, #4]
	adds r0, r3, r0
	strh r0, [r2, #4]
	ldrh r0, [r2, #0x10]
	subs r0, r0, r3
	strh r0, [r2, #0x10]
	b _08035480
_08035474:
	ldrh r0, [r4, #4]
	subs r0, r0, r3
	strh r0, [r4, #4]
	ldrh r0, [r4, #0x10]
	adds r0, r3, r0
	strh r0, [r4, #0x10]
_08035480:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NamiheLungingEnd
NamiheLungingEnd: @ 0x08035488
	push {lr}
	ldr r1, _080354A4 @ =gCurrentSprite
	ldrb r0, [r1, #0x1c]
	subs r0, #1
	strb r0, [r1, #0x1c]
	ldrh r0, [r1, #4]
	adds r3, r0, #0
	ldrh r2, [r1, #8]
	cmp r3, r2
	bhs _080354A8
	adds r0, #1
	strh r0, [r1, #4]
	b _080354B8
	.align 2, 0
_080354A4: .4byte gCurrentSprite
_080354A8:
	cmp r3, r2
	bls _080354B2
	subs r0, #1
	strh r0, [r1, #4]
	b _080354B8
_080354B2:
	adds r1, #0x24
	movs r0, #1
	strb r0, [r1]
_080354B8:
	pop {r0}
	bx r0

	thumb_func_start NamiheSpitInit
NamiheSpitInit: @ 0x080354BC
	push {r4, lr}
	ldr r0, _08035538 @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _0803553C @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	movs r3, #0
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
	ldr r0, _08035540 @ =0x0000FFF0
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _08035544 @ =sNamiheOam_342074
	str r0, [r2, #0x18]
	strb r4, [r2, #0x1c]
	strh r3, [r2, #0x16]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	adds r1, #9
	movs r0, #6
	strb r0, [r1]
	ldr r2, _08035548 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r0, ip
	ldrh r1, [r0, #2]
	cmp r1, r2
	bls _0803554C
	adds r0, #0x2f
	strb r4, [r0]
	subs r0, r1, r2
	b _08035556
	.align 2, 0
_08035538: .4byte gCurrentSprite
_0803553C: .4byte 0x0000FFFB
_08035540: .4byte 0x0000FFF0
_08035544: .4byte sNamiheOam_342074
_08035548: .4byte gSamusData
_0803554C:
	mov r3, ip
	adds r3, #0x2f
	movs r0, #1
	strb r0, [r3]
	subs r0, r2, r1
_08035556:
	cmp r0, #0
	bge _0803555C
	adds r0, #0x1f
_0803555C:
	lsls r0, r0, #0xb
	lsrs r3, r0, #0x10
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	ldr r0, _08035574 @ =0x00000189
	bl SoundPlayNotAlreadyPlaying
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035574: .4byte 0x00000189

	thumb_func_start NamiheSpitMoving
NamiheSpitMoving: @ 0x08035578
	push {r4, lr}
	ldr r4, _08035598 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	ldr r0, _0803559C @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _080355A0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _080355EE
	.align 2, 0
_08035598: .4byte gCurrentSprite
_0803559C: .4byte gPreviousVerticalCollisionCheck
_080355A0:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080355B0
	ldrh r0, [r4, #4]
	adds r0, #0xa
	b _080355B4
_080355B0:
	ldrh r0, [r4, #4]
	subs r0, #0xa
_080355B4:
	strh r0, [r4, #4]
	ldr r2, _080355C8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _080355CC
	subs r0, #1
	strb r0, [r1]
	b _080355EE
	.align 2, 0
_080355C8: .4byte gCurrentSprite
_080355CC:
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080355E2
	adds r1, r2, #0
	adds r1, #0x31
	ldrh r0, [r2, #2]
	ldrb r1, [r1]
	adds r0, r0, r1
	b _080355EC
_080355E2:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r1, [r0]
	ldrh r0, [r2, #2]
	subs r0, r0, r1
_080355EC:
	strh r0, [r2, #2]
_080355EE:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NamiheSpitExplodingInit
NamiheSpitExplodingInit: @ 0x080355F4
	ldr r3, _08035610 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	ldr r0, _08035614 @ =sNamiheOam_342094
	str r0, [r3, #0x18]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	bx lr
	.align 2, 0
_08035610: .4byte gCurrentSprite
_08035614: .4byte sNamiheOam_342094

	thumb_func_start NamiheSpitExploding
NamiheSpitExploding: @ 0x08035618
	push {r4, lr}
	ldr r4, _08035638 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _08035630
	movs r0, #0
	strh r0, [r4]
_08035630:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035638: .4byte gCurrentSprite

	thumb_func_start Fune
Fune: @ 0x0803563C
	push {r4, lr}
	ldr r4, _08035668 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _08035656
	movs r0, #0xc4
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08035656:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803566C
	bl SpriteUtilUpdateFreezeTimer
	b _08035842
	.align 2, 0
_08035668: .4byte gCurrentSprite
_0803566C:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08035678
	b _08035842
_08035678:
	lsls r0, r0, #2
	ldr r1, _08035684 @ =_08035688
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08035684: .4byte _08035688
_08035688: @ jump table
	.4byte _080357F8 @ case 0
	.4byte _080357FE @ case 1
	.4byte _08035802 @ case 2
	.4byte _08035842 @ case 3
	.4byte _08035842 @ case 4
	.4byte _08035842 @ case 5
	.4byte _08035842 @ case 6
	.4byte _08035842 @ case 7
	.4byte _08035842 @ case 8
	.4byte _08035842 @ case 9
	.4byte _08035842 @ case 10
	.4byte _08035842 @ case 11
	.4byte _08035842 @ case 12
	.4byte _08035842 @ case 13
	.4byte _08035842 @ case 14
	.4byte _08035842 @ case 15
	.4byte _08035842 @ case 16
	.4byte _08035842 @ case 17
	.4byte _08035842 @ case 18
	.4byte _08035842 @ case 19
	.4byte _08035842 @ case 20
	.4byte _08035842 @ case 21
	.4byte _08035842 @ case 22
	.4byte _08035842 @ case 23
	.4byte _08035842 @ case 24
	.4byte _08035842 @ case 25
	.4byte _08035842 @ case 26
	.4byte _08035842 @ case 27
	.4byte _08035842 @ case 28
	.4byte _08035842 @ case 29
	.4byte _08035842 @ case 30
	.4byte _08035842 @ case 31
	.4byte _08035842 @ case 32
	.4byte _08035842 @ case 33
	.4byte _08035842 @ case 34
	.4byte _08035842 @ case 35
	.4byte _08035842 @ case 36
	.4byte _08035842 @ case 37
	.4byte _08035842 @ case 38
	.4byte _08035842 @ case 39
	.4byte _08035842 @ case 40
	.4byte _08035808 @ case 41
	.4byte _0803580C @ case 42
	.4byte _08035812 @ case 43
	.4byte _08035816 @ case 44
	.4byte _08035842 @ case 45
	.4byte _0803581C @ case 46
	.4byte _08035842 @ case 47
	.4byte _08035842 @ case 48
	.4byte _08035842 @ case 49
	.4byte _08035842 @ case 50
	.4byte _08035842 @ case 51
	.4byte _08035842 @ case 52
	.4byte _08035842 @ case 53
	.4byte _08035842 @ case 54
	.4byte _08035842 @ case 55
	.4byte _08035842 @ case 56
	.4byte _08035842 @ case 57
	.4byte _08035842 @ case 58
	.4byte _08035842 @ case 59
	.4byte _08035842 @ case 60
	.4byte _08035842 @ case 61
	.4byte _08035842 @ case 62
	.4byte _08035842 @ case 63
	.4byte _08035842 @ case 64
	.4byte _08035842 @ case 65
	.4byte _08035842 @ case 66
	.4byte _08035842 @ case 67
	.4byte _08035842 @ case 68
	.4byte _08035842 @ case 69
	.4byte _08035842 @ case 70
	.4byte _08035842 @ case 71
	.4byte _08035842 @ case 72
	.4byte _08035842 @ case 73
	.4byte _08035842 @ case 74
	.4byte _08035842 @ case 75
	.4byte _08035842 @ case 76
	.4byte _08035842 @ case 77
	.4byte _08035842 @ case 78
	.4byte _08035842 @ case 79
	.4byte _08035842 @ case 80
	.4byte _08035842 @ case 81
	.4byte _08035842 @ case 82
	.4byte _08035842 @ case 83
	.4byte _08035842 @ case 84
	.4byte _08035842 @ case 85
	.4byte _08035842 @ case 86
	.4byte _08035822 @ case 87
	.4byte _08035826 @ case 88
	.4byte _08035830 @ case 89
	.4byte _08035834 @ case 90
	.4byte _0803583A @ case 91
_080357F8:
	bl FuneInit
	b _08035842
_080357FE:
	bl FuneIdleInit
_08035802:
	bl FuneIdle
	b _08035842
_08035808:
	bl FuneSpittingInit
_0803580C:
	bl FuneSpitting
	b _08035842
_08035812:
	bl FuneLungingInit
_08035816:
	bl FuneLunging
	b _08035842
_0803581C:
	bl FuneLungingEnd
	b _08035842
_08035822:
	bl SpriteDyingInit
_08035826:
	bl FuneDying
	bl SpriteDying
	b _08035842
_08035830:
	bl FuneInit
_08035834:
	bl SpriteSpawningFromX
	b _08035842
_0803583A:
	bl FuneTurningIntoX
	bl XParasiteInit
_08035842:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FuneSpit
FuneSpit: @ 0x08035848
	push {lr}
	ldr r0, _08035860 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0803586E
	cmp r0, #2
	bgt _08035864
	cmp r0, #0
	beq _0803586A
	b _0803587A
	.align 2, 0
_08035860: .4byte gCurrentSprite
_08035864:
	cmp r0, #0x38
	beq _08035874
	b _0803587A
_0803586A:
	bl FuneSpitInit
_0803586E:
	bl FuneSpitMoving
	b _0803587E
_08035874:
	bl FuneSpitExploding
	b _0803587E
_0803587A:
	bl FuneSpitExplodingInit
_0803587E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start Namihe
Namihe: @ 0x08035884
	push {r4, lr}
	ldr r4, _080358AC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _0803589C
	ldr r0, _080358B0 @ =0x0000018B
	bl SoundPlayNotAlreadyPlaying
_0803589C:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _080358B4
	bl SpriteUtilUpdateFreezeTimer
	b _08035A8A
	.align 2, 0
_080358AC: .4byte gCurrentSprite
_080358B0: .4byte 0x0000018B
_080358B4:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _080358C0
	b _08035A8A
_080358C0:
	lsls r0, r0, #2
	ldr r1, _080358CC @ =_080358D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080358CC: .4byte _080358D0
_080358D0: @ jump table
	.4byte _08035A40 @ case 0
	.4byte _08035A46 @ case 1
	.4byte _08035A4A @ case 2
	.4byte _08035A8A @ case 3
	.4byte _08035A8A @ case 4
	.4byte _08035A8A @ case 5
	.4byte _08035A8A @ case 6
	.4byte _08035A8A @ case 7
	.4byte _08035A8A @ case 8
	.4byte _08035A8A @ case 9
	.4byte _08035A8A @ case 10
	.4byte _08035A8A @ case 11
	.4byte _08035A8A @ case 12
	.4byte _08035A8A @ case 13
	.4byte _08035A8A @ case 14
	.4byte _08035A8A @ case 15
	.4byte _08035A8A @ case 16
	.4byte _08035A8A @ case 17
	.4byte _08035A8A @ case 18
	.4byte _08035A8A @ case 19
	.4byte _08035A8A @ case 20
	.4byte _08035A8A @ case 21
	.4byte _08035A8A @ case 22
	.4byte _08035A8A @ case 23
	.4byte _08035A8A @ case 24
	.4byte _08035A8A @ case 25
	.4byte _08035A8A @ case 26
	.4byte _08035A8A @ case 27
	.4byte _08035A8A @ case 28
	.4byte _08035A8A @ case 29
	.4byte _08035A8A @ case 30
	.4byte _08035A8A @ case 31
	.4byte _08035A8A @ case 32
	.4byte _08035A8A @ case 33
	.4byte _08035A8A @ case 34
	.4byte _08035A8A @ case 35
	.4byte _08035A8A @ case 36
	.4byte _08035A8A @ case 37
	.4byte _08035A8A @ case 38
	.4byte _08035A8A @ case 39
	.4byte _08035A8A @ case 40
	.4byte _08035A50 @ case 41
	.4byte _08035A54 @ case 42
	.4byte _08035A5A @ case 43
	.4byte _08035A5E @ case 44
	.4byte _08035A8A @ case 45
	.4byte _08035A64 @ case 46
	.4byte _08035A8A @ case 47
	.4byte _08035A8A @ case 48
	.4byte _08035A8A @ case 49
	.4byte _08035A8A @ case 50
	.4byte _08035A8A @ case 51
	.4byte _08035A8A @ case 52
	.4byte _08035A8A @ case 53
	.4byte _08035A8A @ case 54
	.4byte _08035A8A @ case 55
	.4byte _08035A8A @ case 56
	.4byte _08035A8A @ case 57
	.4byte _08035A8A @ case 58
	.4byte _08035A8A @ case 59
	.4byte _08035A8A @ case 60
	.4byte _08035A8A @ case 61
	.4byte _08035A8A @ case 62
	.4byte _08035A8A @ case 63
	.4byte _08035A8A @ case 64
	.4byte _08035A8A @ case 65
	.4byte _08035A8A @ case 66
	.4byte _08035A8A @ case 67
	.4byte _08035A8A @ case 68
	.4byte _08035A8A @ case 69
	.4byte _08035A8A @ case 70
	.4byte _08035A8A @ case 71
	.4byte _08035A8A @ case 72
	.4byte _08035A8A @ case 73
	.4byte _08035A8A @ case 74
	.4byte _08035A8A @ case 75
	.4byte _08035A8A @ case 76
	.4byte _08035A8A @ case 77
	.4byte _08035A8A @ case 78
	.4byte _08035A8A @ case 79
	.4byte _08035A8A @ case 80
	.4byte _08035A8A @ case 81
	.4byte _08035A8A @ case 82
	.4byte _08035A8A @ case 83
	.4byte _08035A8A @ case 84
	.4byte _08035A8A @ case 85
	.4byte _08035A8A @ case 86
	.4byte _08035A6A @ case 87
	.4byte _08035A6E @ case 88
	.4byte _08035A78 @ case 89
	.4byte _08035A7C @ case 90
	.4byte _08035A82 @ case 91
_08035A40:
	bl NamiheInit
	b _08035A8A
_08035A46:
	bl NamiheIdleInit
_08035A4A:
	bl NamiheIdle
	b _08035A8A
_08035A50:
	bl NamiheSpittingInit
_08035A54:
	bl NamiheSpitting
	b _08035A8A
_08035A5A:
	bl NamiheLungingInit
_08035A5E:
	bl NamiheLunging
	b _08035A8A
_08035A64:
	bl NamiheLungingEnd
	b _08035A8A
_08035A6A:
	bl SpriteDyingInit
_08035A6E:
	bl NamiheDying
	bl SpriteDying
	b _08035A8A
_08035A78:
	bl NamiheInit
_08035A7C:
	bl SpriteSpawningFromX
	b _08035A8A
_08035A82:
	bl NamiheTurningIntoX
	bl XParasiteInit
_08035A8A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NamiheSpit
NamiheSpit: @ 0x08035A90
	push {lr}
	ldr r0, _08035AA8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _08035AB6
	cmp r0, #2
	bgt _08035AAC
	cmp r0, #0
	beq _08035AB2
	b _08035AC2
	.align 2, 0
_08035AA8: .4byte gCurrentSprite
_08035AAC:
	cmp r0, #0x38
	beq _08035ABC
	b _08035AC2
_08035AB2:
	bl NamiheSpitInit
_08035AB6:
	bl NamiheSpitMoving
	b _08035AC6
_08035ABC:
	bl NamiheSpitExploding
	b _08035AC6
_08035AC2:
	bl NamiheSpitExplodingInit
_08035AC6:
	pop {r0}
	bx r0
	.align 2, 0
