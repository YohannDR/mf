    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SaXSetDirection
SaXSetDirection: @ 0x080157CC
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

	thumb_func_start SaXSeeAndLocateSamus
SaXSeeAndLocateSamus: @ 0x080157FC
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
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXInit
SaXInit: @ 0x0801621C
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
	bl SaXSetDirection
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

	thumb_func_start SaXElevatorInit
SaXElevatorInit: @ 0x080162A8
	push {lr}
	bl SaXInit
	ldr r0, _080162BC @ =gCurrentSprite
	adds r0, #0x25
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_080162BC: .4byte gCurrentSprite

	thumb_func_start SaXFallingInit
SaXFallingInit: @ 0x080162C0
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
	bl SetSaXPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080162EC: .4byte gCurrentSprite
_080162F0: .4byte 0x0000FF88

	thumb_func_start SaXFalling
SaXFalling: @ 0x080162F4
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
	bl SetSaXPose
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

	thumb_func_start SaXStandingInit
SaXStandingInit: @ 0x080163C8
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_080163E8: .4byte gCurrentSprite
_080163EC: .4byte 0x0000FF88

	thumb_func_start SaXStanding
SaXStanding: @ 0x080163F0
	push {r4, r5, lr}
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXWalkingInit
SaXWalkingInit: @ 0x08016490
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_080164B4: .4byte gCurrentSprite
_080164B8: .4byte 0x0000FF88

	thumb_func_start SaXWalking
SaXWalking: @ 0x080164BC
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXTurningInit
SaXTurningInit: @ 0x08016508
	push {lr}
	ldr r2, _08016524 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08016528 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08016524: .4byte gCurrentSprite
_08016528: .4byte 0x0000FF88

	thumb_func_start SaXTurning
SaXTurning: @ 0x0801652C
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
	bl SaXSetDirection
_08016550:
	pop {r0}
	bx r0
	.align 2, 0
_08016554: .4byte gSaXData
_08016558: .4byte gCurrentSprite

	thumb_func_start SaXTurningChaseStartInit
SaXTurningChaseStartInit: @ 0x0801655C
	push {lr}
	ldr r2, _08016578 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	ldr r0, _0801657C @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08016578: .4byte gCurrentSprite
_0801657C: .4byte 0x0000FF88

	thumb_func_start SaXTurningChaseStart
SaXTurningChaseStart: @ 0x08016580
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
	bl SaXSetDirection
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

	thumb_func_start SaXRunningStart
SaXRunningStart: @ 0x080165C8
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
	bl SetSaXPose
_080165F0:
	pop {r0}
	bx r0
	.align 2, 0
_080165F4: .4byte gCurrentSprite
_080165F8: .4byte 0x0000FF88

	thumb_func_start SaXRunning
SaXRunning: @ 0x080165FC
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXMidAirInit
SaXMidAirInit: @ 0x08016648
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
	bl SetSaXPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801667C: .4byte gCurrentSprite
_08016680: .4byte 0x0000FFB0

	thumb_func_start SaXMidAir
SaXMidAir: @ 0x08016684
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
	bl SetSaXPose
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

	thumb_func_start SaXDelayBeforeShootingBeamInit
SaXDelayBeforeShootingBeamInit: @ 0x0801685C
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
	bl SetSaXPose
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

	thumb_func_start SaXDelayBeforeShootingBeam
SaXDelayBeforeShootingBeam: @ 0x080168A0
	push {r4, lr}
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXShootingBeamInit
SaXShootingBeamInit: @ 0x08016958
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
	bl SetSaXPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016A78: .4byte gSaXData

	thumb_func_start SaXShootingBeam
SaXShootingBeam: @ 0x08016A7C
	push {r4, lr}
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXDelayBeforeShootingMissileInit
SaXDelayBeforeShootingMissileInit: @ 0x08016B24
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

	thumb_func_start SaXDelayBeforeShootingMissile
SaXDelayBeforeShootingMissile: @ 0x08016B88
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

	thumb_func_start SaXShootingMissileInit
SaXShootingMissileInit: @ 0x08016BAC
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
	bl SetSaXPose
	add sp, #0xc
	pop {r0}
	bx r0
	.align 2, 0
_08016CAC: .4byte gSaXData

	thumb_func_start SaXShootingMissile
SaXShootingMissile: @ 0x08016CB0
	push {lr}
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXIdleAfterShootingMissileInit
SaXIdleAfterShootingMissileInit: @ 0x08016D04
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

	thumb_func_start SaXIdleAfterShootingMissile
SaXIdleAfterShootingMissile: @ 0x08016D1C
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

	thumb_func_start SaXMorphingInit
SaXMorphingInit: @ 0x08016DAC
	push {lr}
	ldr r2, _08016DC8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3c
	strb r0, [r1]
	ldr r0, _08016DCC @ =0x0000FFB0
	strh r0, [r2, #0xa]
	movs r0, #0xd
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08016DC8: .4byte gCurrentSprite
_08016DCC: .4byte 0x0000FFB0

	thumb_func_start SaXMorphing
SaXMorphing: @ 0x08016DD0
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

	thumb_func_start SaXRollingInit
SaXRollingInit: @ 0x08016DF0
	push {lr}
	ldr r2, _08016E0C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3e
	strb r0, [r1]
	ldr r0, _08016E10 @ =0x0000FFD8
	strh r0, [r2, #0xa]
	movs r0, #0x10
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08016E0C: .4byte gCurrentSprite
_08016E10: .4byte 0x0000FFD8

	thumb_func_start SaXRolling
SaXRolling: @ 0x08016E14
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
	bl SaXSetDirection
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

	thumb_func_start SaXUnmorphingInit
SaXUnmorphingInit: @ 0x08016ECC
	push {lr}
	ldr r2, _08016EE8 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x40
	strb r0, [r1]
	ldr r0, _08016EEC @ =0x0000FFB0
	strh r0, [r2, #0xa]
	movs r0, #0xe
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08016EE8: .4byte gCurrentSprite
_08016EEC: .4byte 0x0000FFB0

	thumb_func_start SaXUnmorphing
SaXUnmorphing: @ 0x08016EF0
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

	thumb_func_start SaXIdleBeforeShootingDoorInit
SaXIdleBeforeShootingDoorInit: @ 0x08016F24
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08016F48: .4byte gCurrentSprite
_08016F4C: .4byte gSaXData

	thumb_func_start SaXIdleBeforeShootingDoor
SaXIdleBeforeShootingDoor: @ 0x08016F50
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

	thumb_func_start SaXShootingDoorInit
SaXShootingDoorInit: @ 0x08016F74
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
	bl SetSaXPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08016FB8: .4byte gCurrentSprite
_08016FBC: .4byte gSaXData

	thumb_func_start SaXShootingDoor
SaXShootingDoor: @ 0x08016FC0
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

	thumb_func_start SaXIdleAfterShootingDoorInit
SaXIdleAfterShootingDoorInit: @ 0x08016FE0
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08017000: .4byte gCurrentSprite
_08017004: .4byte 0x0000FF88

	thumb_func_start SaXIdleAfterShootingDoor
SaXIdleAfterShootingDoor: @ 0x08017008
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

	thumb_func_start SaXWalkingToDoorInit
SaXWalkingToDoorInit: @ 0x0801702C
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08017050: .4byte gCurrentSprite
_08017054: .4byte 0x0000FF88

	thumb_func_start SaXWalkingToDoor
SaXWalkingToDoor: @ 0x08017058
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXBeamInit
SaXBeamInit: @ 0x08017110
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

	thumb_func_start SaXBeamMove
SaXBeamMove: @ 0x080171E0
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

	thumb_func_start SaXMissileInit
SaXMissileInit: @ 0x08017310
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

	thumb_func_start SaXMissileExploding
SaXMissileExploding: @ 0x080173B8
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

	thumb_func_start SaXMissileMoving
SaXMissileMoving: @ 0x080173EC
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
	bl SaXMissileExploding
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

	thumb_func_start SaXPowerBombInit
SaXPowerBombInit: @ 0x08017498
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

	thumb_func_start SaXPowerBombSpinningSlowly
SaXPowerBombSpinningSlowly: @ 0x0801750C
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

	thumb_func_start SaXPowerBombSpinningQuickly
SaXPowerBombSpinningQuickly: @ 0x0801754C
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

	thumb_func_start SaXPowerBombSyncWithProjectile
SaXPowerBombSyncWithProjectile: @ 0x0801759C
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

	thumb_func_start SaXUpdateGraphics
SaXUpdateGraphics: @ 0x08017AC8
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
	bl SetSaXPose
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

	thumb_func_start SaXUpdateFreezeTimer
SaXUpdateFreezeTimer: @ 0x08017B5C
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
	bl SaXUpdateGraphics
	movs r0, #1
	b _08017BD0
_08017BCE:
	movs r0, #0
_08017BD0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaXElevator
SaXElevator: @ 0x08017BD8
	push {r4, r5, r6, lr}
	bl SaXUpdateFreezeTimer
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08017BE8
	b _08017E8E
_08017BE8:
	bl SaXSeeAndLocateSamus
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
	bl SaXElevatorInit
_08017D60:
	bl SaXFallingInit
_08017D64:
	bl SaXFalling
	b _08017E8A
_08017D6A:
	bl SaXStandingInit
_08017D6E:
	bl SaXStanding
	b _08017E8A
_08017D74:
	bl SaXWalkingInit
	b _08017E8A
_08017D7A:
	bl SaXWalking
	b _08017E8A
_08017D80:
	bl SaXTurningInit
_08017D84:
	bl SaXTurning
	b _08017E8A
_08017D8A:
	bl SaXRunningStart
_08017D8E:
	bl SaXRunning
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
	bl SaXDelayBeforeShootingBeamInit
_08017E26:
	bl SaXDelayBeforeShootingBeam
	b _08017E8A
_08017E2C:
	bl SaXShootingBeamInit
_08017E30:
	bl SaXShootingBeam
	b _08017E8A
_08017E36:
	bl SaXDelayBeforeShootingMissileInit
_08017E3A:
	bl SaXDelayBeforeShootingMissile
	b _08017E8A
_08017E40:
	bl SaXShootingMissileInit
_08017E44:
	bl SaXShootingMissile
	b _08017E8A
_08017E4A:
	bl SaXIdleAfterShootingMissileInit
_08017E4E:
	bl SaXIdleAfterShootingMissile
	b _08017E8A
_08017E54:
	bl SaXMidAirInit
_08017E58:
	bl SaXMidAir
	b _08017E8A
_08017E5E:
	bl SaXTurningChaseStartInit
_08017E62:
	bl SaXTurningChaseStart
	b _08017E8A
_08017E68:
	bl SaXMorphingInit
_08017E6C:
	bl SaXMorphing
	b _08017E8A
_08017E72:
	bl SaXRollingInit
_08017E76:
	bl SaXRolling
	b _08017E8A
_08017E7C:
	bl SaXUnmorphingInit
_08017E80:
	bl SaXUnmorphing
	b _08017E8A
_08017E86:
	bl SaXStandingInit
_08017E8A:
	bl SaXUpdateGraphics
_08017E8E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SaXBeam
SaXBeam: @ 0x08017E94
	push {lr}
	ldr r0, _08017EA8 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017EAC
	bl SaXBeamInit
	b _08017EB0
	.align 2, 0
_08017EA8: .4byte gCurrentSprite
_08017EAC:
	bl SaXBeamMove
_08017EB0:
	pop {r0}
	bx r0

	thumb_func_start SaXMissile
SaXMissile: @ 0x08017EB4
	push {lr}
	ldr r0, _08017ECC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _08017ED0
	cmp r0, #0x37
	beq _08017ED6
	bl SaXMissileMoving
	b _08017EDA
	.align 2, 0
_08017ECC: .4byte gCurrentSprite
_08017ED0:
	bl SaXMissileInit
	b _08017EDA
_08017ED6:
	bl SaXMissileExploding
_08017EDA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SaXPowerBomb
SaXPowerBomb: @ 0x08017EE0
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
	bl SaXPowerBombInit
	b _08017F1C
_08017F0C:
	bl SaXPowerBombSpinningSlowly
	b _08017F1C
_08017F12:
	bl SaXPowerBombSpinningQuickly
	b _08017F1C
_08017F18:
	bl SaXPowerBombSyncWithProjectile
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

	thumb_func_start SaXTro1CheckTurning
SaXTro1CheckTurning: @ 0x08017F50
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

	thumb_func_start SaXTro1CheckStartChase
SaXTro1CheckStartChase: @ 0x08017FB8
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

	thumb_func_start SaXTro1Init
SaXTro1Init: @ 0x08018008
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
	bl SaXInit
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

	thumb_func_start SaXTro1Walking
SaXTro1Walking: @ 0x08018038
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
	bl SaXTro1CheckTurning
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXTro1Running
SaXTro1Running: @ 0x0801812C
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
	bl SaXTro1CheckStartChase
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXTro1TurningDuringChase
SaXTro1TurningDuringChase: @ 0x08018210
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
	bl SaXSetDirection
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

	thumb_func_start SaXTro1
SaXTro1: @ 0x08018264
	push {r4, lr}
	bl SaXUpdateFreezeTimer
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _08018274
	b _080184D4
_08018274:
	bl SaXSeeAndLocateSamus
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
	bl SaXTro1Init
_0801840C:
	bl SaXWalkingInit
	b _080184BA
_08018412:
	bl SaXTro1Walking
	b _080184BA
_08018418:
	bl SaXRunningStart
_0801841C:
	bl SaXTro1Running
	b _080184BA
_08018422:
	bl SaXTurningChaseStartInit
_08018426:
	bl SaXTro1TurningDuringChase
	b _080184BA
_0801842C:
	bl SaXIdleBeforeShootingDoorInit
_08018430:
	bl SaXIdleBeforeShootingDoor
	b _080184BA
_08018436:
	bl SaXShootingDoorInit
_0801843A:
	bl SaXShootingDoor
	b _080184BA
_08018440:
	bl SaXIdleAfterShootingDoorInit
_08018444:
	bl SaXIdleAfterShootingDoor
	b _080184BA
_0801844A:
	bl SaXWalkingToDoorInit
_0801844E:
	bl SaXWalkingToDoor
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
	bl SaXTurningInit
_08018470:
	bl SaXTurning
	b _080184BA
_08018476:
	bl SaXFallingInit
_0801847A:
	bl SaXFalling
	b _080184BA
_08018480:
	bl SaXStandingInit
_08018484:
	bl SaXStanding
	b _080184BA
_0801848A:
	bl SaXDelayBeforeShootingBeamInit
_0801848E:
	bl SaXDelayBeforeShootingBeam
	b _080184BA
_08018494:
	bl SaXShootingBeamInit
_08018498:
	bl SaXShootingBeam
	b _080184BA
_0801849E:
	bl SaXDelayBeforeShootingMissileInit
_080184A2:
	bl SaXDelayBeforeShootingMissile
	b _080184BA
_080184A8:
	bl SaXShootingMissileInit
_080184AC:
	bl SaXShootingMissile
	b _080184BA
_080184B2:
	bl SaXIdleAfterShootingMissileInit
_080184B6:
	bl SaXIdleAfterShootingMissile
_080184BA:
	bl SaXUpdateGraphics
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

	thumb_func_start SaXNocWalkingCheckCollisions
SaXNocWalkingCheckCollisions: @ 0x080184E0
	push {r4, r5, r6, lr}
	ldr r4, _0801851C @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXNocRunningCheckCollisions
SaXNocRunningCheckCollisions: @ 0x08018644
	push {r4, r5, r6, lr}
	ldr r4, _08018688 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXNocWalkingToLayPowerBombCheckCollisions
SaXNocWalkingToLayPowerBombCheckCollisions: @ 0x08018844
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

	thumb_func_start SaXNocInit
SaXNocInit: @ 0x08018890
	push {r4, lr}
	ldr r4, _080188B4 @ =gCurrentSprite
	ldr r1, _080188B8 @ =gSaXSpawnPosition
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	ldrh r0, [r1]
	strh r0, [r4, #4]
	bl SaXInit
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
	bl SetSaXPose
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
	bl SetSaXPose
	b _08018920
_0801891E:
	strh r0, [r4]
_08018920:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SaXNocWaitingInDoorDuringChase
SaXNocWaitingInDoorDuringChase: @ 0x08018928
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

	thumb_func_start SaXNocOpeningDoorDuringChase
SaXNocOpeningDoorDuringChase: @ 0x080189AC
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
	bl SaXRunningStart
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

	thumb_func_start SaXNocWaitingInDoorToLayPowerBomb
SaXNocWaitingInDoorToLayPowerBomb: @ 0x080189EC
	push {r4, lr}
	sub sp, #0xc
	bl EventCheckOn_EngagedSaXNoc
	cmp r0, #0
	beq _08018A76
	bl SaXWalkingInit
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

	thumb_func_start SaXNocWalkingToLayPowerBomb
SaXNocWalkingToLayPowerBomb: @ 0x08018A84
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
	bl SaXNocWalkingToLayPowerBombCheckCollisions
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXNocIdleBeforeLayingPowerBombInit
SaXNocIdleBeforeLayingPowerBombInit: @ 0x08018AE8
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08018B08: .4byte gCurrentSprite
_08018B0C: .4byte 0x0000FF88

	thumb_func_start SaXNocIdleBeforeLayingPowerBomb
SaXNocIdleBeforeLayingPowerBomb: @ 0x08018B10
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

	thumb_func_start SaXNocMorphingToLayPowerBombInit
SaXNocMorphingToLayPowerBombInit: @ 0x08018B34
	push {lr}
	ldr r2, _08018B50 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4c
	strb r0, [r1]
	ldr r0, _08018B54 @ =0x0000FFB0
	strh r0, [r2, #0xa]
	movs r0, #0xd
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08018B50: .4byte gCurrentSprite
_08018B54: .4byte 0x0000FFB0

	thumb_func_start SaXNocMorphingToLayPowerBomb
SaXNocMorphingToLayPowerBomb: @ 0x08018B58
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

	thumb_func_start SaXNocMorphedToLayPowerBombInit
SaXNocMorphedToLayPowerBombInit: @ 0x08018B78
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

	thumb_func_start SaXNocMorphedToLayPowerBomb
SaXNocMorphedToLayPowerBomb: @ 0x08018B98
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

	thumb_func_start SaXNocWalking
SaXNocWalking: @ 0x08018BE4
	push {r4, lr}
	bl unk_15e88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018C20
	bl SaXNocWalkingCheckCollisions
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXNocRunning
SaXNocRunning: @ 0x08018C30
	push {r4, lr}
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018C6C
	bl SaXNocRunningCheckCollisions
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXNocTurningDuringChase
SaXNocTurningDuringChase: @ 0x08018C7C
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
	bl SaXSetDirection
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

	thumb_func_start SaXNoc
SaXNoc: @ 0x08018CAC
	push {lr}
	bl SaXUpdateFreezeTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018CBA
	b _08018F48
_08018CBA:
	bl SaXSeeAndLocateSamus
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
	bl SaXNocInit
	b _08018F2E
_08018E1E:
	bl SaXNocWaitingInDoorToLayPowerBomb
	b _08018F2E
_08018E24:
	bl SaXNocWalkingToLayPowerBomb
	b _08018F2E
_08018E2A:
	bl SaXNocIdleBeforeLayingPowerBombInit
_08018E2E:
	bl SaXNocIdleBeforeLayingPowerBomb
	b _08018F2E
_08018E34:
	bl SaXNocMorphingToLayPowerBombInit
_08018E38:
	bl SaXNocMorphingToLayPowerBomb
	b _08018F2E
_08018E3E:
	bl SaXNocMorphedToLayPowerBombInit
_08018E42:
	bl SaXNocMorphedToLayPowerBomb
	b _08018F2E
_08018E48:
	bl SaXWalkingInit
	b _08018F2E
_08018E4E:
	bl SaXNocWalking
	b _08018F2E
_08018E54:
	bl SaXIdleBeforeShootingDoorInit
_08018E58:
	bl SaXIdleBeforeShootingDoor
	b _08018F2E
_08018E5E:
	bl SaXShootingDoorInit
_08018E62:
	bl SaXShootingDoor
	b _08018F2E
_08018E68:
	bl SaXIdleAfterShootingDoorInit
_08018E6C:
	bl SaXIdleAfterShootingDoor
	b _08018F2E
_08018E72:
	bl SaXWalkingToDoorInit
_08018E76:
	bl SaXWalkingToDoor
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
	bl SaXNocWaitingInDoorDuringChase
	b _08018F2E
_08018E9E:
	bl SaXNocOpeningDoorDuringChase
	b _08018F2E
_08018EA4:
	bl SaXRunningStart
_08018EA8:
	bl SaXNocRunning
	b _08018F2E
_08018EAE:
	bl SaXTurningChaseStartInit
_08018EB2:
	bl SaXNocTurningDuringChase
	b _08018F2E
_08018EB8:
	bl SaXTurningInit
_08018EBC:
	bl SaXTurning
	b _08018F2E
_08018EC2:
	bl SaXFallingInit
_08018EC6:
	bl SaXFalling
	b _08018F2E
_08018ECC:
	bl SaXStandingInit
_08018ED0:
	bl SaXStanding
	b _08018F2E
_08018ED6:
	bl SaXDelayBeforeShootingBeamInit
_08018EDA:
	bl SaXDelayBeforeShootingBeam
	b _08018F2E
_08018EE0:
	bl SaXShootingBeamInit
_08018EE4:
	bl SaXShootingBeam
	b _08018F2E
_08018EEA:
	bl SaXDelayBeforeShootingMissileInit
_08018EEE:
	bl SaXDelayBeforeShootingMissile
	b _08018F2E
_08018EF4:
	bl SaXShootingMissileInit
_08018EF8:
	bl SaXShootingMissile
	b _08018F2E
_08018EFE:
	bl SaXIdleAfterShootingMissileInit
_08018F02:
	bl SaXIdleAfterShootingMissile
	b _08018F2E
_08018F08:
	bl SaXMidAirInit
_08018F0C:
	bl SaXMidAir
	b _08018F2E
_08018F12:
	bl SaXMorphingInit
_08018F16:
	bl SaXMorphing
	b _08018F2E
_08018F1C:
	bl SaXRollingInit
_08018F20:
	bl SaXRolling
	b _08018F2E
_08018F26:
	bl SaXUnmorphingInit
_08018F2A:
	bl SaXUnmorphing
_08018F2E:
	bl SaXUpdateGraphics
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

	thumb_func_start SaXArcWalkingCheckCollisions
SaXArcWalkingCheckCollisions: @ 0x08018F50
	push {r4, r5, r6, lr}
	ldr r4, _08018F94 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXArcRunningCheckCollisions
SaXArcRunningCheckCollisions: @ 0x08019098
	push {r4, r5, r6, lr}
	ldr r4, _080190D4 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXArcInit
SaXArcInit: @ 0x080193C4
	push {r4, lr}
	ldr r4, _080193E8 @ =gCurrentSprite
	ldr r1, _080193EC @ =gSaXSpawnPosition
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	ldrh r0, [r1]
	strh r0, [r4, #4]
	bl SaXInit
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
	bl SetSaXPose
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
	bl SetSaXPose
	b _08019454
_08019452:
	strh r0, [r4]
_08019454:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SaXArcWaitingInDoorDuringChase
SaXArcWaitingInDoorDuringChase: @ 0x0801945C
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

	thumb_func_start SaXArcOpeningDoorDuringChase
SaXArcOpeningDoorDuringChase: @ 0x080194E0
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
	bl SaXRunningStart
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

	thumb_func_start SaXArcWaitingInDoor
SaXArcWaitingInDoor: @ 0x08019520
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

	thumb_func_start SaXArcOpeningDoor
SaXArcOpeningDoor: @ 0x0801959C
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
	bl SaXWalkingInit
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

	thumb_func_start SaXArcWalking
SaXArcWalking: @ 0x080195D8
	push {r4, lr}
	bl unk_15e88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801964E
	bl SaXArcWalkingCheckCollisions
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXArcStoppedAtPillarInit
SaXArcStoppedAtPillarInit: @ 0x08019660
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08019680: .4byte gCurrentSprite
_08019684: .4byte 0x0000FF88

	thumb_func_start SaXArcStoppedAtPillar
SaXArcStoppedAtPillar: @ 0x08019688
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

	thumb_func_start SaXArcIdleAfterHearingWeaponInit
SaXArcIdleAfterHearingWeaponInit: @ 0x080196AC
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_080196CC: .4byte gCurrentSprite
_080196D0: .4byte 0x0000FF88

	thumb_func_start SaXArcIdleAfterHearingWeapon
SaXArcIdleAfterHearingWeapon: @ 0x080196D4
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

	thumb_func_start SaXArcTurningAroundAfterHearingWeaponStart
SaXArcTurningAroundAfterHearingWeaponStart: @ 0x080196F8
	push {lr}
	ldr r2, _08019714 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4e
	strb r0, [r1]
	ldr r0, _08019718 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08019714: .4byte gCurrentSprite
_08019718: .4byte 0x0000FF88

	thumb_func_start SaXArcTurningAround
SaXArcTurningAround: @ 0x0801971C
	push {lr}
	bl SpriteUtilAlignYPosOnSlope
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
	bl SaXSetDirection
_0801975E:
	pop {r0}
	bx r0
	.align 2, 0
_08019764: .4byte gSaXData
_08019768: .4byte gCurrentSprite

	thumb_func_start SaXArcRunning
SaXArcRunning: @ 0x0801976C
	push {r4, lr}
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080197A8
	bl SaXArcRunningCheckCollisions
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXArcTurningAroundDuringChase
SaXArcTurningAroundDuringChase: @ 0x080197B8
	push {r4, lr}
	bl SpriteUtilAlignYPosOnSlope
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
	bl SaXSetDirection
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

	thumb_func_start SaXIdleBeforeShootingMissileInit
SaXIdleBeforeShootingMissileInit: @ 0x08019808
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
	bl SaXSetDirection
	movs r0, #2
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08019848: .4byte gCurrentSprite
_0801984C: .4byte gSaXData
_08019850: .4byte 0x0000FDFF

	thumb_func_start SaXArcIdleBeforeShootingMissile
SaXArcIdleBeforeShootingMissile: @ 0x08019854
	push {lr}
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXArcShootingMissileInit
SaXArcShootingMissileInit: @ 0x08019894
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
	bl SetSaXPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019938: .4byte gSaXData

	thumb_func_start SaXArcShootingMissile
SaXArcShootingMissile: @ 0x0801993C
	push {lr}
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXArc
SaXArc: @ 0x080199A8
	push {lr}
	bl SaXUpdateFreezeTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080199B6
	b _08019C1E
_080199B6:
	bl SaXSeeAndLocateSamus
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
	bl SaXArcInit
	b _08019BDC
_08019B1A:
	bl SaXArcWaitingInDoor
	b _08019BDC
_08019B20:
	bl SaXArcOpeningDoor
	b _08019BDC
_08019B26:
	bl SaXWalkingInit
	b _08019BDC
_08019B2C:
	bl SaXArcWalking
	b _08019BDC
_08019B32:
	bl SaXArcStoppedAtPillarInit
_08019B36:
	bl SaXArcStoppedAtPillar
	b _08019BDC
_08019B3C:
	bl SaXArcIdleAfterHearingWeaponInit
_08019B40:
	bl SaXArcIdleAfterHearingWeapon
	b _08019BDC
_08019B46:
	bl SaXArcTurningAroundAfterHearingWeaponStart
_08019B4A:
	bl SaXArcTurningAround
	b _08019BDC
_08019B50:
	bl SaXArcWaitingInDoorDuringChase
	b _08019BDC
_08019B56:
	bl SaXArcOpeningDoorDuringChase
	b _08019BDC
_08019B5C:
	bl SaXRunningStart
_08019B60:
	bl SaXArcRunning
	b _08019BDC
_08019B66:
	bl SaXTurningChaseStartInit
_08019B6A:
	bl SaXArcTurningAroundDuringChase
	b _08019BDC
_08019B70:
	bl SaXIdleBeforeShootingMissileInit
_08019B74:
	bl SaXArcIdleBeforeShootingMissile
	b _08019BDC
_08019B7A:
	bl SaXArcShootingMissileInit
_08019B7E:
	bl SaXArcShootingMissile
	b _08019BDC
_08019B84:
	bl SaXTurningInit
_08019B88:
	bl SaXTurning
	b _08019BDC
_08019B8E:
	bl SaXFallingInit
_08019B92:
	bl SaXFalling
	b _08019BDC
_08019B98:
	bl SaXStandingInit
_08019B9C:
	bl SaXStanding
	b _08019BDC
_08019BA2:
	bl SaXDelayBeforeShootingBeamInit
_08019BA6:
	bl SaXDelayBeforeShootingBeam
	b _08019BDC
_08019BAC:
	bl SaXShootingBeamInit
_08019BB0:
	bl SaXShootingBeam
	b _08019BDC
_08019BB6:
	bl SaXMidAirInit
_08019BBA:
	bl SaXMidAir
	b _08019BDC
_08019BC0:
	bl SaXMorphingInit
_08019BC4:
	bl SaXMorphing
	b _08019BDC
_08019BCA:
	bl SaXRollingInit
_08019BCE:
	bl SaXRolling
	b _08019BDC
_08019BD4:
	bl SaXUnmorphingInit
_08019BD8:
	bl SaXUnmorphing
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
	bl SaXUpdateGraphics
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

	thumb_func_start SaXLabInit
SaXLabInit: @ 0x08019C28
	push {r4, lr}
	sub sp, #0xc
	bl SaXInit
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

	thumb_func_start SaXLabShootingLabInit
SaXLabShootingLabInit: @ 0x08019C60
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_08019C7C: .4byte gCurrentSprite

	thumb_func_start SaXLabSetTarget
SaXLabSetTarget: @ 0x08019C80
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

	thumb_func_start SaXLabGettingCoveredByMetroids
SaXLabGettingCoveredByMetroids: @ 0x08019C9C
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
	bl SetSaXPose
	movs r0, #0x64
	strb r0, [r4]
_08019CC2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019CC8: .4byte gCurrentSprite

	thumb_func_start SaXLabCoveredByMetroids
SaXLabCoveredByMetroids: @ 0x08019CCC
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

	thumb_func_start SaXLabCoveredByMetroidsAfterDetachment
SaXLabCoveredByMetroidsAfterDetachment: @ 0x08019D28
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

	thumb_func_start SaXLab
SaXLab: @ 0x08019D5C
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
	bl SaXLabInit
_08019DF4:
	bl SaXLabShootingLabInit
	b _08019E10
_08019DFA:
	bl SaXLabSetTarget
	b _08019E10
_08019E00:
	bl SaXLabGettingCoveredByMetroids
	b _08019E10
_08019E06:
	bl SaXLabCoveredByMetroids
	b _08019E10
_08019E0C:
	bl SaXLabCoveredByMetroidsAfterDetachment
_08019E10:
	bl SaXUpdateGraphics
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

	thumb_func_start SaXBossRunniingCheckCollisions
SaXBossRunniingCheckCollisions: @ 0x08019E34
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r6, #0
	ldr r4, _08019E70 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2f
	strb r6, [r0]
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXBossTrackSamus
SaXBossTrackSamus: @ 0x0801A294
	push {r4, r5, r6, r7, lr}
	ldr r0, _0801A2B8 @ =gSaXVision
	ldrb r1, [r0, #2]
	adds r6, r0, #0
	cmp r1, #1
	bne _0801A34E
	ldr r0, _0801A2BC @ =gCurrentSprite
	movs r1, #0
	strh r1, [r0, #6]
	bl SpriteUtilCheckSamusHangingOnLedge
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
	bl SpriteUtilCheckSamusHangingOnLedge
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
	bl SetSaXPose
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

	thumb_func_start SaXBossRunningInit
SaXBossRunningInit: @ 0x0801A564
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
	bl SetSaXPose
_0801A58C:
	pop {r0}
	bx r0
	.align 2, 0
_0801A590: .4byte gCurrentSprite
_0801A594: .4byte 0x0000FF88

	thumb_func_start SaXBossRunning
SaXBossRunning: @ 0x0801A598
	push {r4, lr}
	bl SaXBossTrackSamus
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801A5D4
	bl SaXBossRunniingCheckCollisions
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXBossSpinJumpingInit
SaXBossSpinJumpingInit: @ 0x0801A5E4
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
	bl SetSaXPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A618: .4byte gCurrentSprite
_0801A61C: .4byte 0x0000FFB0

	thumb_func_start SaXBossSpinJumping
SaXBossSpinJumping: @ 0x0801A620
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
	bl SetSaXPose
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

	thumb_func_start SaXBossWaitingToAppearInit
SaXBossWaitingToAppearInit: @ 0x0801A848
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
	bl SetSaXPose
	adds r4, #0x2e
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A874: .4byte gCurrentSprite

	thumb_func_start SaXBossWaitingToAppear
SaXBossWaitingToAppear: @ 0x0801A878
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

	thumb_func_start SaXBossInit
SaXBossInit: @ 0x0801A914
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
	bl SaXInit
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
	bl SaXSetDirection
	adds r4, #0x30
	movs r0, #8
	strb r0, [r4]
	bl SaXBossWaitingToAppearInit
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

	thumb_func_start SaXBossFallingInit
SaXBossFallingInit: @ 0x0801A984
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
	bl SetSaXPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A9B0: .4byte gCurrentSprite
_0801A9B4: .4byte 0x0000FF88

	thumb_func_start SaXBossFalling
SaXBossFalling: @ 0x0801A9B8
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
	bl SetSaXPose
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

	thumb_func_start SaXBossTurningAroundDuringChaseInit
SaXBossTurningAroundDuringChaseInit: @ 0x0801AA74
	push {lr}
	ldr r2, _0801AA90 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x3a
	strb r0, [r1]
	ldr r0, _0801AA94 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_0801AA90: .4byte gCurrentSprite
_0801AA94: .4byte 0x0000FF88

	thumb_func_start SaXBossTurningAroundDuringChase
SaXBossTurningAroundDuringChase: @ 0x0801AA98
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
	bl SaXSetDirection
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

	thumb_func_start SaXBossFallingFromKnockbackInit
SaXBossFallingFromKnockbackInit: @ 0x0801AAE8
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
	bl SetSaXPose
	adds r0, r5, #0
	adds r0, #0x2d
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801AB14: .4byte gCurrentSprite
_0801AB18: .4byte 0x0000FF88

	thumb_func_start SaXBossFallingFromKnockback
SaXBossFallingFromKnockback: @ 0x0801AB1C
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
	bl SetSaXPose
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

	thumb_func_start SaXBossVariableJumpHeightInit
SaXBossVariableJumpHeightInit: @ 0x0801ABFC
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
	bl SetSaXPose
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

	thumb_func_start SaXBossVariableJumpHeight
SaXBossVariableJumpHeight: @ 0x0801AC90
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
	bl SetSaXPose
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

	thumb_func_start SaXBossUpdateMosaic
SaXBossUpdateMosaic: @ 0x0801AEEC
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

	thumb_func_start SaXBossKnockbackInit
SaXBossKnockbackInit: @ 0x0801AF5C
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
	bl SetSaXPose
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

	thumb_func_start SaXBossKnockback
SaXBossKnockback: @ 0x0801B044
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

	thumb_func_start SaXBossKneelingInit
SaXBossKneelingInit: @ 0x0801B0DC
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
	bl SetSaXPose
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

	thumb_func_start SaXBossKneeling
SaXBossKneeling: @ 0x0801B130
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
	bl SetSaXPose
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

	thumb_func_start SaXBossTransformingIntoMonsterInit
SaXBossTransformingIntoMonsterInit: @ 0x0801B170
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

	thumb_func_start SaXBossTransformingIntoMonster
SaXBossTransformingIntoMonster: @ 0x0801B188
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

	thumb_func_start SaXBossAfterTransformation
SaXBossAfterTransformation: @ 0x0801B244
	ldr r1, _0801B24C @ =gCurrentSprite
	movs r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_0801B24C: .4byte gCurrentSprite

	thumb_func_start SaXBoss
SaXBoss: @ 0x0801B250
	push {r4, r5, lr}
	ldr r4, _0801B29C @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0x50
	bhi _0801B286
	bl SaXUpdateFreezeTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B26A
	b _0801B50C
_0801B26A:
	bl SaXSeeAndLocateSamus
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
	bl SaXBossInit
	b _0801B4DA
_0801B402:
	bl SaXBossFallingInit
_0801B406:
	bl SaXBossFalling
	b _0801B4DA
_0801B40C:
	bl SaXBossRunningInit
_0801B410:
	bl SaXBossRunning
	b _0801B4DA
_0801B416:
	bl SaXBossSpinJumpingInit
_0801B41A:
	bl SaXBossSpinJumping
	b _0801B4DA
_0801B420:
	bl SaXBossTurningAroundDuringChaseInit
_0801B424:
	bl SaXBossTurningAroundDuringChase
	b _0801B4DA
_0801B42A:
	bl SaXStandingInit
_0801B42E:
	bl SaXStanding
	b _0801B4DA
_0801B434:
	bl SaXWalkingInit
	b _0801B4DA
_0801B43A:
	bl SaXWalking
	b _0801B4DA
_0801B440:
	bl SaXTurningInit
_0801B444:
	bl SaXTurning
	b _0801B4DA
_0801B44A:
	bl SaXDelayBeforeShootingBeamInit
_0801B44E:
	bl SaXDelayBeforeShootingBeam
	b _0801B4DA
_0801B454:
	bl SaXShootingBeamInit
_0801B458:
	bl SaXShootingBeam
	b _0801B4DA
_0801B45E:
	bl SaXDelayBeforeShootingMissileInit
_0801B462:
	bl SaXDelayBeforeShootingMissile
	b _0801B4DA
_0801B468:
	bl SaXShootingMissileInit
_0801B46C:
	bl SaXShootingMissile
	b _0801B4DA
_0801B472:
	bl SaXIdleAfterShootingMissileInit
_0801B476:
	bl SaXIdleAfterShootingMissile
	b _0801B4DA
_0801B47C:
	bl SaXMorphingInit
_0801B480:
	bl SaXMorphing
	b _0801B4DA
_0801B486:
	bl SaXRollingInit
_0801B48A:
	bl SaXRolling
	b _0801B4DA
_0801B490:
	bl SaXUnmorphingInit
_0801B494:
	bl SaXUnmorphing
	b _0801B4DA
_0801B49A:
	bl SaXBossWaitingToAppearInit
_0801B49E:
	bl SaXBossWaitingToAppear
	b _0801B4DA
_0801B4A4:
	bl SaXBossFallingFromKnockbackInit
_0801B4A8:
	bl SaXBossFallingFromKnockback
	b _0801B4DA
_0801B4AE:
	bl SaXBossVariableJumpHeightInit
_0801B4B2:
	bl SaXBossVariableJumpHeight
	b _0801B4DA
_0801B4B8:
	bl SaXBossKnockbackInit
_0801B4BC:
	bl SaXBossKnockback
	b _0801B4DA
_0801B4C2:
	bl SaXBossKneelingInit
_0801B4C6:
	bl SaXBossKneeling
	b _0801B4DA
_0801B4CC:
	bl SaXBossTransformingIntoMonsterInit
_0801B4D0:
	bl SaXBossTransformingIntoMonster
	b _0801B4DA
_0801B4D6:
	bl SaXBossAfterTransformation
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
	bl SaXBossUpdateMosaic
	bl SaXUpdateGraphics
_0801B50C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801B514: .4byte gCurrentSprite

	thumb_func_start SaXOmegaInit
SaXOmegaInit: @ 0x0801B518
	push {lr}
	bl SaXInit
	bl SpriteUtilMakeSpriteFaceAwayFromSamusDirection
	bl SaXSetDirection
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
	bl SetSaXPose
	ldr r1, _0801B560 @ =gSaXData
	movs r0, #1
	strb r0, [r1, #6]
	pop {r0}
	bx r0
	.align 2, 0
_0801B55C: .4byte gCurrentSprite
_0801B560: .4byte gSaXData

	thumb_func_start SaXOmegaForming
SaXOmegaForming: @ 0x0801B564
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

	thumb_func_start SaXOmegaFalling
SaXOmegaFalling: @ 0x0801B5B8
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
	bl SetSaXPose
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

	thumb_func_start SaXOmegaStandingInit
SaXOmegaStandingInit: @ 0x0801B648
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

	thumb_func_start SaXOmegaStanding
SaXOmegaStanding: @ 0x0801B660
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

	thumb_func_start SaXOmegaRunningInit
SaXOmegaRunningInit: @ 0x0801B684
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
	bl SetSaXPose
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #0x1e
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B6AC: .4byte gCurrentSprite

	thumb_func_start SaXOmegaRunning
SaXOmegaRunning: @ 0x0801B6B0
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXOmegaIdleBeforeShootingOmegaInit
SaXOmegaIdleBeforeShootingOmegaInit: @ 0x0801B6F8
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_0801B71C: .4byte gCurrentSprite
_0801B720: .4byte gSaXData

	thumb_func_start SaXOmegaIdleBeforeShootingOmega
SaXOmegaIdleBeforeShootingOmega: @ 0x0801B724
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

	thumb_func_start SaXOmegaShootingOmegaInit
SaXOmegaShootingOmegaInit: @ 0x0801B748
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
	bl SetSaXPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B790: .4byte gCurrentSprite
_0801B794: .4byte gSaXData

	thumb_func_start SaXOmegaShootingOmega
SaXOmegaShootingOmega: @ 0x0801B798
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

	thumb_func_start SaXOmegaAfterShootingOmegaInit
SaXOmegaAfterShootingOmegaInit: @ 0x0801B7B8
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_0801B7E0: .4byte gCurrentSprite
_0801B7E4: .4byte 0x0000FF88

	thumb_func_start SaXOmegaAfterShootingOmega
SaXOmegaAfterShootingOmega: @ 0x0801B7E8
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
	bl SetSaXPose
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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
	bl SetSaXPose
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
	bl SetSaXPose
_0801B8B0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B8B8: .4byte gSaXData

	thumb_func_start SaXOmegaHitByOmegaInit
SaXOmegaHitByOmegaInit: @ 0x0801B8BC
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_0801B8E0: .4byte gCurrentSprite

	thumb_func_start SaXOmegaHitByOmega
SaXOmegaHitByOmega: @ 0x0801B8E4
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

	thumb_func_start SaXOmegaRevertingToXInit
SaXOmegaRevertingToXInit: @ 0x0801B930
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

	thumb_func_start SaXOmegaRevertingToX
SaXOmegaRevertingToX: @ 0x0801B95C
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

	thumb_func_start SaXOmega
SaXOmega: @ 0x0801B9A0
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
	bl SaXOmegaInit
	b _0801BB76
_0801BB22:
	bl SaXOmegaForming
	b _0801BB76
_0801BB28:
	bl SaXFallingInit
_0801BB2C:
	bl SaXOmegaFalling
	b _0801BB76
_0801BB32:
	bl SaXOmegaStandingInit
_0801BB36:
	bl SaXOmegaStanding
	b _0801BB76
_0801BB3C:
	bl SaXOmegaRunningInit
_0801BB40:
	bl SaXOmegaRunning
	b _0801BB76
_0801BB46:
	bl SaXOmegaIdleBeforeShootingOmegaInit
_0801BB4A:
	bl SaXOmegaIdleBeforeShootingOmega
	b _0801BB76
_0801BB50:
	bl SaXOmegaShootingOmegaInit
_0801BB54:
	bl SaXOmegaShootingOmega
	b _0801BB76
_0801BB5A:
	bl SaXOmegaAfterShootingOmegaInit
_0801BB5E:
	bl SaXOmegaAfterShootingOmega
	b _0801BB76
_0801BB64:
	bl SaXOmegaHitByOmegaInit
_0801BB68:
	bl SaXOmegaHitByOmega
	b _0801BB76
_0801BB6E:
	bl SaXOmegaRevertingToXInit
_0801BB72:
	bl SaXOmegaRevertingToX
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
	bl SaXUpdateGraphics
_0801BB94:
	pop {r0}
	bx r0

	thumb_func_start SaXTro2WalkingCheckCollisions
SaXTro2WalkingCheckCollisions: @ 0x0801BB98
	push {r4, r5, r6, r7, lr}
	ldr r4, _0801BBD4 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r7, #0
	strb r7, [r6]
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXTro2RunningCheckCollisions
SaXTro2RunningCheckCollisions: @ 0x0801BDB4
	push {r4, r5, r6, lr}
	ldr r4, _0801BDF0 @ =gCurrentSprite
	adds r6, r4, #0
	adds r6, #0x2f
	movs r0, #0
	strb r0, [r6]
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXTro2Init
SaXTro2Init: @ 0x0801C0E8
	push {r4, lr}
	bl EventCheckOn_NavAfterYakuza
	cmp r0, #0
	beq _0801C120
	bl SaXInit
	ldr r4, _0801C118 @ =gCurrentSprite
	ldrh r1, [r4]
	ldr r0, _0801C11C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r4]
	bl SaXSetDirection
	adds r1, r4, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	adds r4, #0x24
	movs r0, #1
	strb r0, [r4]
	bl SetSaXPose
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
	bl SaXInit
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
	bl SetSaXPose
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
	bl SetSaXPose
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

	thumb_func_start SaXTro2WaitingInDoorDuringChase
SaXTro2WaitingInDoorDuringChase: @ 0x0801C1BC
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
	bl SaXRunningStart
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

	thumb_func_start SaXTro2WaitingInDoorAtEnd
SaXTro2WaitingInDoorAtEnd: @ 0x0801C1FC
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
	bl SaXWalkingInit
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

	thumb_func_start SaXTro2Walking
SaXTro2Walking: @ 0x0801C23C
	push {r4, lr}
	bl unk_15e88
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C2B2
	bl SaXTro2WalkingCheckCollisions
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXTro2StoppedAtDoorInit
SaXTro2StoppedAtDoorInit: @ 0x0801C2C4
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_0801C2E4: .4byte gCurrentSprite
_0801C2E8: .4byte 0x0000FF88

	thumb_func_start SaXTro2StoppedAtDoor
SaXTro2StoppedAtDoor: @ 0x0801C2EC
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

	thumb_func_start SaXTro2IdleAfterHearingWeaponInit
SaXTro2IdleAfterHearingWeaponInit: @ 0x0801C364
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
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_0801C384: .4byte gCurrentSprite
_0801C388: .4byte 0x0000FF88

	thumb_func_start SaXTro2IdleAfterHearingWeapon
SaXTro2IdleAfterHearingWeapon: @ 0x0801C38C
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

	thumb_func_start SaXTro2TurningAfterHearingWeaponInit
SaXTro2TurningAfterHearingWeaponInit: @ 0x0801C3B0
	push {lr}
	ldr r2, _0801C3CC @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x4e
	strb r0, [r1]
	ldr r0, _0801C3D0 @ =0x0000FF88
	strh r0, [r2, #0xa]
	movs r0, #4
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_0801C3CC: .4byte gCurrentSprite
_0801C3D0: .4byte 0x0000FF88

	thumb_func_start SaXTro2TurningAfterHearingWeapon
SaXTro2TurningAfterHearingWeapon: @ 0x0801C3D4
	push {lr}
	bl SpriteUtilAlignYPosOnSlope
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
	bl SaXSetDirection
_0801C416:
	pop {r0}
	bx r0
	.align 2, 0
_0801C41C: .4byte gSaXData
_0801C420: .4byte gCurrentSprite

	thumb_func_start SaXTro2Running
SaXTro2Running: @ 0x0801C424
	push {r4, lr}
	bl unk_15dd4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801C460
	bl SaXTro2RunningCheckCollisions
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
	bl SpriteUtilMoveXPosForwardOnSlopeDirection
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

	thumb_func_start SaXTro2TurningDuringChase
SaXTro2TurningDuringChase: @ 0x0801C470
	push {r4, lr}
	bl SpriteUtilAlignYPosOnSlope
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
	bl SaXSetDirection
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

	thumb_func_start SaXTro2IdleBeforeShootingBeamInit
SaXTro2IdleBeforeShootingBeamInit: @ 0x0801C4C0
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
	bl SaXSetDirection
	movs r0, #2
	bl SetSaXPose
	pop {r0}
	bx r0
	.align 2, 0
_0801C500: .4byte gCurrentSprite
_0801C504: .4byte gSaXData
_0801C508: .4byte 0x0000FDFF

	thumb_func_start SaXTro2IdleBeforeShootingBeam
SaXTro2IdleBeforeShootingBeam: @ 0x0801C50C
	push {lr}
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXTro2ShootingBeamInit
SaXTro2ShootingBeamInit: @ 0x0801C54C
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
	bl SetSaXPose
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C5F0: .4byte gSaXData

	thumb_func_start SaXTro2ShootingBeam
SaXTro2ShootingBeam: @ 0x0801C5F4
	push {lr}
	bl SpriteUtilAlignYPosOnSlope
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

	thumb_func_start SaXTro2
SaXTro2: @ 0x0801C660
	push {lr}
	bl SaXUpdateFreezeTimer
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801C66E
	b _0801C8CA
_0801C66E:
	bl SaXSeeAndLocateSamus
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
	bl SaXTro2Init
	b _0801C888
_0801C7D2:
	bl SaXWalkingInit
	b _0801C888
_0801C7D8:
	bl SaXTro2Walking
	b _0801C888
_0801C7DE:
	bl SaXTro2StoppedAtDoorInit
_0801C7E2:
	bl SaXTro2StoppedAtDoor
	b _0801C888
_0801C7E8:
	bl SaXTro2IdleAfterHearingWeaponInit
_0801C7EC:
	bl SaXTro2IdleAfterHearingWeapon
	b _0801C888
_0801C7F2:
	bl SaXTro2TurningAfterHearingWeaponInit
_0801C7F6:
	bl SaXTro2TurningAfterHearingWeapon
	b _0801C888
_0801C7FC:
	bl SaXTro2WaitingInDoorDuringChase
	b _0801C888
_0801C802:
	bl SaXTro2WaitingInDoorAtEnd
	b _0801C888
_0801C808:
	bl SaXRunningStart
_0801C80C:
	bl SaXTro2Running
	b _0801C888
_0801C812:
	bl SaXTurningChaseStartInit
_0801C816:
	bl SaXTro2TurningDuringChase
	b _0801C888
_0801C81C:
	bl SaXTro2IdleBeforeShootingBeamInit
_0801C820:
	bl SaXTro2IdleBeforeShootingBeam
	b _0801C888
_0801C826:
	bl SaXTro2ShootingBeamInit
_0801C82A:
	bl SaXTro2ShootingBeam
	b _0801C888
_0801C830:
	bl SaXTurningInit
_0801C834:
	bl SaXTurning
	b _0801C888
_0801C83A:
	bl SaXFallingInit
_0801C83E:
	bl SaXFalling
	b _0801C888
_0801C844:
	bl SaXStandingInit
_0801C848:
	bl SaXStanding
	b _0801C888
_0801C84E:
	bl SaXDelayBeforeShootingBeamInit
_0801C852:
	bl SaXDelayBeforeShootingBeam
	b _0801C888
_0801C858:
	bl SaXShootingBeamInit
_0801C85C:
	bl SaXShootingBeam
	b _0801C888
_0801C862:
	bl SaXMidAirInit
_0801C866:
	bl SaXMidAir
	b _0801C888
_0801C86C:
	bl SaXMorphingInit
_0801C870:
	bl SaXMorphing
	b _0801C888
_0801C876:
	bl SaXRollingInit
_0801C87A:
	bl SaXRolling
	b _0801C888
_0801C880:
	bl SaXUnmorphingInit
_0801C884:
	bl SaXUnmorphing
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
	bl SaXUpdateGraphics
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
