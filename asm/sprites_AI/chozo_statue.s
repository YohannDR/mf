    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ChozoStatueSetCollision
ChozoStatueSetCollision: @ 0x0802D520
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _0802D5A0 @ =gCurrentSprite
	ldrh r5, [r4, #2]
	ldrh r7, [r4, #4]
	ldr r0, _0802D5A4 @ =gCurrentClipdataAffectingAction
	mov r8, r0
	strb r6, [r0]
	movs r0, #0x20
	rsbs r0, r0, #0
	adds r0, r0, r5
	mov sb, r0
	adds r1, r7, #0
	bl ClipdataProcess
	mov r0, r8
	strb r6, [r0]
	movs r0, #0x60
	rsbs r0, r0, #0
	adds r0, r0, r5
	mov sl, r0
	adds r1, r7, #0
	bl ClipdataProcess
	mov r0, r8
	strb r6, [r0]
	subs r5, #0xa0
	adds r0, r5, #0
	adds r1, r7, #0
	bl ClipdataProcess
	adds r4, #0x2a
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802D5A8
	mov r0, r8
	strb r6, [r0]
	adds r4, r7, #0
	adds r4, #0x40
	mov r0, sb
	adds r1, r4, #0
	bl ClipdataProcess
	mov r0, r8
	strb r6, [r0]
	mov r0, sl
	adds r1, r4, #0
	bl ClipdataProcess
	mov r0, r8
	strb r6, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ClipdataProcess
	b _0802D5D0
	.align 2, 0
_0802D5A0: .4byte gCurrentSprite
_0802D5A4: .4byte gCurrentClipdataAffectingAction
_0802D5A8:
	mov r0, r8
	strb r6, [r0]
	adds r4, r7, #0
	subs r4, #0x40
	mov r0, sb
	adds r1, r4, #0
	bl ClipdataProcess
	mov r0, r8
	strb r6, [r0]
	mov r0, sl
	adds r1, r4, #0
	bl ClipdataProcess
	mov r0, r8
	strb r6, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl ClipdataProcess
_0802D5D0:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ChozoStatueInit
ChozoStatueInit: @ 0x0802D5E0
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, _0802D604 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x26
	movs r5, #1
	strb r5, [r0]
	ldr r0, _0802D608 @ =gEquipment
	ldrb r0, [r0, #0xa]
	adds r3, r5, #0
	ands r3, r0
	adds r4, r1, #0
	cmp r3, #0
	beq _0802D60C
	movs r0, #0
	strh r0, [r4]
	b _0802D6BC
	.align 2, 0
_0802D604: .4byte gCurrentSprite
_0802D608: .4byte gEquipment
_0802D60C:
	ldr r2, _0802D664 @ =sPrimarySpriteStats
	ldrb r1, [r4, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x25
	strb r2, [r0]
	ldrh r0, [r4]
	movs r6, #0x80
	lsls r6, r6, #8
	adds r1, r6, #0
	orrs r0, r1
	strh r0, [r4]
	adds r1, r4, #0
	adds r1, #0x27
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x28
	strb r2, [r0]
	adds r1, #2
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0802D668 @ =0x0000FF40
	strh r0, [r4, #0xa]
	strh r3, [r4, #0xc]
	adds r0, r4, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _0802D670
	ldr r0, _0802D66C @ =0x0000FFE0
	strh r0, [r4, #0xe]
	movs r0, #0x60
	strh r0, [r4, #0x10]
	b _0802D680
	.align 2, 0
_0802D664: .4byte sPrimarySpriteStats
_0802D668: .4byte 0x0000FF40
_0802D66C: .4byte 0x0000FFE0
_0802D670:
	ldr r0, _0802D6C4 @ =0x0000FFA0
	strh r0, [r4, #0xe]
	movs r0, #0x20
	strh r0, [r4, #0x10]
	ldrh r0, [r4]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r4]
_0802D680:
	adds r1, r4, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0802D6C8 @ =sChozoStatueOam_328380
	str r0, [r4, #0x18]
	strb r2, [r4, #0x1c]
	strh r2, [r4, #0x16]
	ldrb r1, [r4, #0x1e]
	ldrb r2, [r4, #0x1f]
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r3, [r0]
	ldrh r0, [r4, #2]
	str r0, [sp]
	ldrh r0, [r4, #4]
	str r0, [sp, #4]
	ldrh r4, [r4]
	movs r0, #0x40
	ands r0, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	movs r0, #0x27
	bl SpriteSpawnSecondary
	movs r0, #2
	bl ChozoStatueSetCollision
_0802D6BC:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802D6C4: .4byte 0x0000FFA0
_0802D6C8: .4byte sChozoStatueOam_328380

	thumb_func_start ChozoStatueIdle
ChozoStatueIdle: @ 0x0802D6CC
	bx lr
	.align 2, 0

	thumb_func_start ChozoStatueTransformingInit
ChozoStatueTransformingInit: @ 0x0802D6D0
	push {lr}
	ldr r3, _0802D704 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x46
	strb r0, [r1]
	ldrh r1, [r3]
	ldr r2, _0802D708 @ =0x00008020
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #0x2c
	strh r0, [r3, #6]
	movs r0, #1
	bl ChozoStatueSetCollision
	movs r0, #0x43
	movs r1, #7
	bl MusicPlay
	pop {r0}
	bx r0
	.align 2, 0
_0802D704: .4byte gCurrentSprite
_0802D708: .4byte 0x00008020

	thumb_func_start ChozoStatueTransforming
ChozoStatueTransforming: @ 0x0802D70C
	push {r4, lr}
	ldr r2, _0802D754 @ =gWrittenToMosaic_H
	ldr r1, _0802D758 @ =sXParasiteMosaicValues
	ldr r4, _0802D75C @ =gCurrentSprite
	ldrh r0, [r4, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x13
	bhi _0802D760
	ldrh r2, [r4, #6]
	movs r0, #0x56
	movs r1, #0
	bl SpriteLoadGfx
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _0802D76E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	movs r0, #0x56
	strb r0, [r4, #0x1d]
	ldrh r0, [r4]
	movs r1, #4
	orrs r0, r1
	strh r0, [r4]
	b _0802D76E
	.align 2, 0
_0802D754: .4byte gWrittenToMosaic_H
_0802D758: .4byte sXParasiteMosaicValues
_0802D75C: .4byte gCurrentSprite
_0802D760:
	cmp r0, #0x14
	bne _0802D76E
	movs r0, #0x56
	movs r1, #0
	movs r2, #5
	bl SpriteLoadPal
_0802D76E:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start FakeChozoBallInit
FakeChozoBallInit: @ 0x0802D774
	push {r4, lr}
	ldr r3, _0802D7DC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r2, [r0]
	ldrh r1, [r3]
	ldr r0, _0802D7E0 @ =0x0000FFFB
	ands r0, r1
	movs r4, #0
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #5
	strb r0, [r1]
	ldr r1, _0802D7E4 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r3, #0x14]
	adds r1, r3, #0
	adds r1, #0x25
	movs r0, #2
	strb r0, [r1]
	adds r1, #2
	movs r0, #0x30
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x28
	strb r4, [r0]
	adds r1, #2
	movs r0, #0x18
	strb r0, [r1]
	ldr r0, _0802D7E8 @ =0x0000FF4C
	strh r0, [r3, #0xa]
	adds r0, #0x40
	strh r0, [r3, #0xc]
	ldr r1, _0802D7EC @ =gSpriteData
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802D7F4
	ldr r0, _0802D7F0 @ =0x0000FFA0
	strh r0, [r3, #0xe]
	adds r0, #0x40
	strh r0, [r3, #0x10]
	b _0802D804
	.align 2, 0
_0802D7DC: .4byte gCurrentSprite
_0802D7E0: .4byte 0x0000FFFB
_0802D7E4: .4byte sSecondarySpriteStats
_0802D7E8: .4byte 0x0000FF4C
_0802D7EC: .4byte gSpriteData
_0802D7F0: .4byte 0x0000FFA0
_0802D7F4:
	movs r0, #0x20
	strh r0, [r3, #0xe]
	movs r0, #0x60
	strh r0, [r3, #0x10]
	ldrh r0, [r3]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r3]
_0802D804:
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0802D81C @ =sChozoStatueOam_328390
	str r0, [r3, #0x18]
	strb r2, [r3, #0x1c]
	strh r2, [r3, #0x16]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D81C: .4byte sChozoStatueOam_328390

	thumb_func_start FakeChozoBallIdle
FakeChozoBallIdle: @ 0x0802D820
	push {lr}
	ldr r1, _0802D834 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	bne _0802D830
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
_0802D830:
	pop {r0}
	bx r0
	.align 2, 0
_0802D834: .4byte gCurrentSprite

	thumb_func_start FakeChozoBallExposedInit
FakeChozoBallExposedInit: @ 0x0802D838
	push {r4, r5, lr}
	ldr r2, _0802D870 @ =gCurrentSprite
	ldrh r0, [r2, #0x14]
	adds r0, #1
	movs r3, #0
	movs r4, #0
	strh r0, [r2, #0x14]
	ldrh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #8
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0802D874 @ =sChozoStatueOam_3283a0
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	adds r1, r2, #0
	adds r1, #0x2e
	movs r0, #0x3c
	strb r0, [r1]
	adds r2, #0x24
	movs r0, #0x38
	strb r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802D870: .4byte gCurrentSprite
_0802D874: .4byte sChozoStatueOam_3283a0

	thumb_func_start FakeChozoBallExposed
FakeChozoBallExposed: @ 0x0802D878
	push {lr}
	ldr r3, _0802D8BC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r1, #8
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802D8B6
	subs r1, #0xa
	movs r0, #0x3a
	strb r0, [r1]
	ldrh r1, [r3]
	movs r0, #0x20
	orrs r0, r1
	strh r0, [r3]
	ldr r2, _0802D8C0 @ =gSpriteData
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	adds r0, #0x24
	movs r1, #0x45
	strb r1, [r0]
_0802D8B6:
	pop {r0}
	bx r0
	.align 2, 0
_0802D8BC: .4byte gCurrentSprite
_0802D8C0: .4byte gSpriteData

	thumb_func_start FakeChozoBallTransformation
FakeChozoBallTransformation: @ 0x0802D8C4
	push {lr}
	ldr r3, _0802D8F8 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x23
	ldrb r1, [r0]
	ldr r2, _0802D8FC @ =gSpriteData
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r2
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x46
	bne _0802D8F4
	ldrh r0, [r1, #6]
	cmp r0, #0x14
	bhi _0802D8F4
	movs r0, #0
	strh r0, [r3]
_0802D8F4:
	pop {r0}
	bx r0
	.align 2, 0
_0802D8F8: .4byte gCurrentSprite
_0802D8FC: .4byte gSpriteData

	thumb_func_start ChozoStatue
ChozoStatue: @ 0x0802D900
	push {lr}
	ldr r0, _0802D920 @ =gCurrentSprite
	adds r2, r0, #0
	adds r2, #0x26
	movs r1, #1
	strb r1, [r2]
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0802D934
	cmp r0, #2
	bgt _0802D924
	cmp r0, #0
	beq _0802D92E
	b _0802D942
	.align 2, 0
_0802D920: .4byte gCurrentSprite
_0802D924:
	cmp r0, #0x45
	beq _0802D93A
	cmp r0, #0x46
	beq _0802D93E
	b _0802D942
_0802D92E:
	bl ChozoStatueInit
	b _0802D942
_0802D934:
	bl ChozoStatueIdle
	b _0802D942
_0802D93A:
	bl ChozoStatueTransformingInit
_0802D93E:
	bl ChozoStatueTransforming
_0802D942:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start FakeChozoBall
FakeChozoBall: @ 0x0802D948
	push {lr}
	ldr r0, _0802D964 @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x37
	beq _0802D97E
	cmp r0, #0x37
	bgt _0802D968
	cmp r0, #0
	beq _0802D972
	cmp r0, #2
	beq _0802D978
	b _0802D98E
	.align 2, 0
_0802D964: .4byte gCurrentSprite
_0802D968:
	cmp r0, #0x38
	beq _0802D984
	cmp r0, #0x3a
	beq _0802D98A
	b _0802D98E
_0802D972:
	bl FakeChozoBallInit
	b _0802D98E
_0802D978:
	bl FakeChozoBallIdle
	b _0802D98E
_0802D97E:
	bl FakeChozoBallExposedInit
	b _0802D98E
_0802D984:
	bl FakeChozoBallExposed
	b _0802D98E
_0802D98A:
	bl FakeChozoBallTransformation
_0802D98E:
	pop {r0}
	bx r0
	.align 2, 0
