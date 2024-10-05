    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SciserCheckCollisions
SciserCheckCollisions: @ 0x080274B8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _080274EC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027518
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080274F4
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _080274F0 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08027568
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	b _0802755C
	.align 2, 0
_080274EC: .4byte gCurrentSprite
_080274F0: .4byte gPreviousCollisionCheck
_080274F4:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027514 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08027568
	ldrh r0, [r4, #2]
	adds r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #4
	b _0802755C
	.align 2, 0
_08027514: .4byte gPreviousCollisionCheck
_08027518:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08027544
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027540 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08027568
	ldrh r0, [r4, #2]
	subs r0, #4
	b _08027558
	.align 2, 0
_08027540: .4byte gPreviousCollisionCheck
_08027544:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027570 @ =gPreviousCollisionCheck
	ldrb r0, [r5]
	cmp r0, #0
	bne _08027568
	ldrh r0, [r4, #2]
_08027558:
	ldrh r1, [r4, #4]
	adds r1, #0x20
_0802755C:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r5]
	cmp r0, #0
	bne _08027568
	movs r6, #1
_08027568:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027570: .4byte gPreviousCollisionCheck

	thumb_func_start SciserUpdateHitbox
SciserUpdateHitbox: @ 0x08027574
	push {lr}
	ldr r2, _0802759C @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _080275C0
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080275A8
	ldr r0, _080275A0 @ =0x0000FFD0
	strh r0, [r2, #0xa]
	movs r0, #0x30
	strh r0, [r2, #0xc]
	ldr r0, _080275A4 @ =0x0000FFB8
	strh r0, [r2, #0xe]
	movs r0, #0x10
	b _080275E2
	.align 2, 0
_0802759C: .4byte gCurrentSprite
_080275A0: .4byte 0x0000FFD0
_080275A4: .4byte 0x0000FFB8
_080275A8:
	ldr r0, _080275B8 @ =0x0000FFD0
	strh r0, [r2, #0xa]
	movs r0, #0x30
	strh r0, [r2, #0xc]
	ldr r0, _080275BC @ =0x0000FFF0
	strh r0, [r2, #0xe]
	movs r0, #0x48
	b _080275E2
	.align 2, 0
_080275B8: .4byte 0x0000FFD0
_080275BC: .4byte 0x0000FFF0
_080275C0:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080275D4
	movs r0, #0x10
	strh r0, [r2, #0xa]
	movs r0, #0x48
	b _080275DA
_080275D4:
	ldr r0, _080275E8 @ =0x0000FFB8
	strh r0, [r2, #0xa]
	movs r0, #0x10
_080275DA:
	strh r0, [r2, #0xc]
	ldr r0, _080275EC @ =0x0000FFD0
	strh r0, [r2, #0xe]
	movs r0, #0x30
_080275E2:
	strh r0, [r2, #0x10]
	pop {r0}
	bx r0
	.align 2, 0
_080275E8: .4byte 0x0000FFB8
_080275EC: .4byte 0x0000FFD0

	thumb_func_start SciserSetCrawlingGFX
SciserSetCrawlingGFX: @ 0x080275F0
	push {lr}
	ldr r2, _08027614 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	beq _08027624
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802761C
	ldr r0, _08027618 @ =0x083190A0
	b _0802763A
	.align 2, 0
_08027614: .4byte gCurrentSprite
_08027618: .4byte 0x083190A0
_0802761C:
	ldr r0, _08027620 @ =0x08319078
	b _0802763A
	.align 2, 0
_08027620: .4byte 0x08319078
_08027624:
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027638
	ldr r0, _08027634 @ =0x08318FC0
	b _0802763A
	.align 2, 0
_08027634: .4byte 0x08318FC0
_08027638:
	ldr r0, _08027648 @ =0x08318F08
_0802763A:
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_08027648: .4byte 0x08318F08

	thumb_func_start SciserSetIdleGFX
SciserSetIdleGFX: @ 0x0802764C
	push {lr}
	ldr r2, _08027670 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	adds r1, r2, #0
	cmp r0, #0
	beq _08027680
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027678
	ldr r0, _08027674 @ =0x083190A0
	b _08027696
	.align 2, 0
_08027670: .4byte gCurrentSprite
_08027674: .4byte 0x083190A0
_08027678:
	ldr r0, _0802767C @ =0x08319078
	b _08027696
	.align 2, 0
_0802767C: .4byte 0x08319078
_08027680:
	adds r0, r1, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027694
	ldr r0, _08027690 @ =0x08318FE8
	b _08027696
	.align 2, 0
_08027690: .4byte 0x08318FE8
_08027694:
	ldr r0, _080276A4 @ =0x08318F30
_08027696:
	str r0, [r1, #0x18]
	movs r0, #0
	strb r0, [r1, #0x1c]
	strh r0, [r1, #0x16]
	pop {r0}
	bx r0
	.align 2, 0
_080276A4: .4byte 0x08318F30

	thumb_func_start SciserCheckSamusInRange
SciserCheckSamusInRange: @ 0x080276A8
	push {r4, lr}
	ldr r4, _080276C8 @ =gCurrentSprite
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802770C
	adds r1, r4, #0
	adds r1, #0x2e
	ldrb r0, [r1]
	cmp r0, #0
	beq _080276CC
	subs r0, #1
	strb r0, [r1]
	b _0802770C
	.align 2, 0
_080276C8: .4byte gCurrentSprite
_080276CC:
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r1, #0
	bl SpriteUtilCheckSamusNearSpriteLeftRight
	cmp r0, #0
	beq _0802770C
	adds r0, r4, #0
	adds r0, #0x24
	movs r1, #0x2a
	strb r1, [r0]
	adds r0, #9
	ldrb r0, [r0]
	cmp r0, #0
	beq _080276F4
	ldr r0, _080276F0 @ =0x08319030
	b _080276F6
	.align 2, 0
_080276F0: .4byte 0x08319030
_080276F4:
	ldr r0, _08027714 @ =0x08318F78
_080276F6:
	str r0, [r4, #0x18]
	ldr r0, _08027718 @ =gCurrentSprite
	movs r1, #0
	strb r1, [r0, #0x1c]
	strh r1, [r0, #0x16]
	adds r0, #0x2e
	movs r1, #0x1e
	strb r1, [r0]
	ldr r0, _0802771C @ =0x00000161
	bl SoundPlayNotAlreadyPlaying
_0802770C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08027714: .4byte 0x08318F78
_08027718: .4byte gCurrentSprite
_0802771C: .4byte 0x00000161

	thumb_func_start SciserShooting
SciserShooting: @ 0x08027720
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r2, _08027750 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802775C
	ldr r1, [r2, #0x18]
	ldr r0, _08027754 @ =0x08319030
	cmp r1, r0
	bne _08027798
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0802774C
	b _080278CA
_0802774C:
	ldr r0, _08027758 @ =0x08319000
	b _0802777A
	.align 2, 0
_08027750: .4byte gCurrentSprite
_08027754: .4byte 0x08319030
_08027758: .4byte 0x08319000
_0802775C:
	ldr r1, [r2, #0x18]
	ldr r0, _08027790 @ =0x08318F78
	cmp r1, r0
	bne _08027798
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08027778
	b _080278CA
_08027778:
	ldr r0, _08027794 @ =0x08318F48
_0802777A:
	str r0, [r2, #0x18]
	strb r1, [r2, #0x1c]
	strh r1, [r2, #0x16]
	movs r0, #0x3c
	strb r0, [r3]
	movs r0, #0xb1
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
	b _080278CA
	.align 2, 0
_08027790: .4byte 0x08318F78
_08027794: .4byte 0x08318F48
_08027798:
	ldr r5, _080277F0 @ =gCurrentSprite
	adds r0, r5, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	cmp r0, #0x32
	beq _080277A6
	b _080278AC
_080277A6:
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r4, [r0]
	cmp r4, #0
	beq _08027826
	ldrh r1, [r5]
	movs r4, #0x40
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080277F4
	ldrb r2, [r5, #0x1f]
	adds r6, r5, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r5, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r0, #4
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	adds r0, #0x30
	str r0, [sp]
	ldrh r0, [r5, #4]
	subs r0, #0x40
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _08027868
	.align 2, 0
_080277F0: .4byte gCurrentSprite
_080277F4:
	ldrb r2, [r5, #0x1f]
	adds r6, r5, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	subs r0, #0x30
	str r0, [sp]
	ldrh r0, [r5, #4]
	adds r0, #0x40
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #4
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	adds r0, #0x30
	str r0, [sp]
	ldrh r0, [r5, #4]
	adds r0, #0x40
	str r0, [sp, #4]
	str r4, [sp, #8]
	b _08027868
_08027826:
	ldrh r1, [r5]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _08027872
	ldrb r2, [r5, #0x1f]
	adds r6, r5, #0
	adds r6, #0x23
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	adds r0, #0x40
	str r0, [sp]
	ldrh r0, [r5, #4]
	subs r0, #0x30
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #4
	movs r1, #1
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r6]
	ldrh r0, [r5, #2]
	adds r0, #0x40
	str r0, [sp]
	ldrh r0, [r5, #4]
	adds r0, #0x30
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
_08027868:
	movs r0, #4
	movs r1, #1
	bl SpriteSpawnSecondary
	b _080278AC
_08027872:
	ldrb r2, [r5, #0x1f]
	adds r4, r5, #0
	adds r4, #0x23
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r5, #4]
	subs r0, #0x30
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #4
	movs r1, #0
	bl SpriteSpawnSecondary
	ldrb r2, [r5, #0x1f]
	ldrb r3, [r4]
	ldrh r0, [r5, #2]
	subs r0, #0x40
	str r0, [sp]
	ldrh r0, [r5, #4]
	adds r0, #0x30
	str r0, [sp, #4]
	movs r0, #0x40
	str r0, [sp, #8]
	movs r0, #4
	movs r1, #0
	bl SpriteSpawnSecondary
_080278AC:
	ldr r1, _080278D4 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080278CA
	adds r0, r1, #0
	adds r0, #0x24
	movs r1, #7
	strb r1, [r0]
	movs r0, #0x78
	strb r0, [r2]
_080278CA:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080278D4: .4byte gCurrentSprite

	thumb_func_start SciserTurningIntoX
SciserTurningIntoX: @ 0x080278D8
	push {lr}
	ldr r2, _080278F8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027904
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080278FC
	ldrh r0, [r2, #4]
	subs r0, #0x28
	strh r0, [r2, #4]
	b _0802791C
	.align 2, 0
_080278F8: .4byte gCurrentSprite
_080278FC:
	ldrh r0, [r2, #4]
	adds r0, #0x28
	strh r0, [r2, #4]
	b _0802791C
_08027904:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08027916
	ldrh r0, [r2, #2]
	adds r0, #0x28
	b _0802791A
_08027916:
	ldrh r0, [r2, #2]
	subs r0, #0x28
_0802791A:
	strh r0, [r2, #2]
_0802791C:
	pop {r0}
	bx r0

	thumb_func_start SciserInit
SciserInit: @ 0x08027920
	push {r4, r5, r6, r7, lr}
	bl SpriteUtilTrySetAbsorbXFlag
	ldr r4, _0802793C @ =gCurrentSprite
	adds r5, r4, #0
	adds r5, #0x24
	ldrb r0, [r5]
	cmp r0, #0x59
	bne _08027940
	movs r0, #0x5a
	strb r0, [r5]
	movs r0, #0x2c
	strh r0, [r4, #6]
	b _080279FE
	.align 2, 0
_0802793C: .4byte gCurrentSprite
_08027940:
	bl SpriteUtilChooseRandomXDirection
	movs r0, #2
	strb r0, [r5]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r6, _08027968 @ =gPreviousCollisionCheck
	ldrb r0, [r6]
	movs r7, #0xf0
	adds r5, r7, #0
	ands r5, r0
	cmp r5, #0
	beq _0802796C
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	b _080279FE
	.align 2, 0
_08027968: .4byte gPreviousCollisionCheck
_0802796C:
	ldrh r0, [r4, #2]
	subs r0, #0x44
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0802799A
	adds r0, r4, #0
	adds r0, #0x2d
	strb r5, [r0]
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r1, r0
	strh r1, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x40
	strh r0, [r4, #2]
	b _080279FE
_0802799A:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	subs r1, #0x24
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _080279C6
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	subs r0, #0x20
	strh r0, [r4, #4]
	b _080279FE
_080279C6:
	ldrh r0, [r4, #2]
	subs r0, #0x20
	ldrh r1, [r4, #4]
	adds r1, #0x20
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r0, [r6]
	adds r2, r7, #0
	ands r2, r0
	cmp r2, #0
	beq _080279FA
	adds r1, r4, #0
	adds r1, #0x2d
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r4]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r4]
	ldrh r0, [r4, #2]
	subs r0, #0x20
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, #0x20
	strh r0, [r4, #4]
	b _080279FE
_080279FA:
	strh r2, [r4]
	b _08027A90
_080279FE:
	ldr r3, _08027A34 @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r2, #2
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08027A38
	ldrh r1, [r3]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	movs r2, #0
	orrs r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #0xc
	strb r0, [r1]
	subs r1, #1
	movs r0, #3
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x25
	strb r2, [r0]
	b _08027A58
	.align 2, 0
_08027A34: .4byte gCurrentSprite
_08027A38:
	ldrh r1, [r3]
	ldr r0, _08027A98 @ =0x00007FFF
	ands r0, r1
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x22
	movs r0, #4
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x21
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	adds r1, #0x13
	movs r0, #1
	strb r0, [r1]
_08027A58:
	bl SciserSetCrawlingGFX
	bl SciserUpdateHitbox
	ldr r3, _08027A9C @ =gCurrentSprite
	ldr r2, _08027AA0 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r3, #0x14]
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #9
	movs r1, #0x18
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
_08027A90:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027A98: .4byte 0x00007FFF
_08027A9C: .4byte gCurrentSprite
_08027AA0: .4byte sPrimarySpriteStats

	thumb_func_start SciserCrawlingInit
SciserCrawlingInit: @ 0x08027AA4
	push {lr}
	bl SciserSetCrawlingGFX
	ldr r0, _08027AB8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #2
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08027AB8: .4byte gCurrentSprite

	thumb_func_start SciserCrawling
SciserCrawling: @ 0x08027ABC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	ldr r4, _08027AEC @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	adds r2, r4, #0
	cmp r0, #0
	beq _08027B38
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08027AF4
	ldr r1, _08027AF0 @ =0x08317648
	b _08027AF6
	.align 2, 0
_08027AEC: .4byte gCurrentSprite
_08027AF0: .4byte 0x08317648
_08027AF4:
	ldr r1, _08027B18 @ =0x08317630
_08027AF6:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsrs r0, r0, #3
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027B1C
	ldrh r0, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _08027B22
	.align 2, 0
_08027B18: .4byte 0x08317630
_08027B1C:
	ldrh r0, [r2, #4]
	adds r0, r0, r1
	strh r0, [r2, #4]
_08027B22:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0x5e
	bhi _08027B32
	adds r0, #1
	strb r0, [r1]
	b _08027E70
_08027B32:
	movs r0, #0
	strb r0, [r1]
	b _08027E70
_08027B38:
	movs r7, #0
	bl SciserCheckCollisions
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027B4E
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x15
	strb r0, [r1]
	b _08027E70
_08027B4E:
	adds r1, r4, #0
	adds r1, #0x2f
	ldrb r0, [r1]
	cmp r0, #0
	bne _08027C30
	ldrh r1, [r4, #2]
	ldrh r2, [r4, #4]
	ldrh r0, [r4, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrh r0, [r4, #0xc]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0x14]
	ldrh r0, [r4, #0xe]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r4, #0x10]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	movs r6, #0
	mov r8, r4
_08027B88:
	mov r0, r8
	adds r0, #0x23
	ldrb r0, [r0]
	cmp r6, r0
	beq _08027BFA
	ldr r1, _08027C08 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r5, r0, r1
	ldrh r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08027BFA
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0
	bne _08027BFA
	ldrb r0, [r5, #0x1d]
	cmp r0, #0x3c
	beq _08027BBE
	cmp r0, #0x8b
	bne _08027BFA
_08027BBE:
	ldrh r3, [r5, #2]
	ldrh r4, [r5, #4]
	ldrh r2, [r5, #0xa]
	adds r2, r3, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r0, [r5, #0xc]
	adds r3, r3, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldrh r1, [r5, #0xe]
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r5, #0x10]
	adds r4, r4, r0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	str r2, [sp]
	str r3, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, sl
	mov r3, sb
	bl CheckObjectsTouching
	cmp r0, #0
	bne _08027C0C
_08027BFA:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x17
	bls _08027B88
	b _08027C34
	.align 2, 0
_08027C08: .4byte gSpriteData
_08027C0C:
	ldrh r0, [r5]
	movs r1, #0x80
	lsls r1, r1, #2
	adds r2, r1, #0
	eors r0, r2
	strh r0, [r5]
	adds r0, r5, #0
	adds r0, #0x2f
	movs r1, #0x78
	strb r1, [r0]
	mov r3, r8
	ldrh r0, [r3]
	eors r0, r2
	strh r0, [r3]
	mov r0, r8
	adds r0, #0x2f
	strb r1, [r0]
	b _08027C34
_08027C30:
	subs r0, #1
	strb r0, [r1]
_08027C34:
	ldr r4, _08027C78 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08027C42
	b _08027D48
_08027C42:
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08027CC0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08027C80
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027C7C @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08027C6E
	b _08027E40
_08027C6E:
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	b _08027CEA
	.align 2, 0
_08027C78: .4byte gCurrentSprite
_08027C7C: .4byte gPreviousCollisionCheck
_08027C80:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027CBC @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08027C98
	b _08027E40
_08027C98:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08027CB0
	b _08027E40
_08027CB0:
	ldrh r0, [r4, #2]
	movs r1, #1
	subs r0, r0, r1
	strh r0, [r4, #2]
	b _08027E54
	.align 2, 0
_08027CBC: .4byte gPreviousCollisionCheck
_08027CC0:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08027D08
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027D04 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08027CE4
	b _08027E40
_08027CE4:
	ldrh r0, [r4, #2]
	adds r0, #0x38
	ldrh r1, [r4, #4]
_08027CEA:
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08027CFA
	b _08027E40
_08027CFA:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
	b _08027E54
	.align 2, 0
_08027D04: .4byte gPreviousCollisionCheck
_08027D08:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	subs r1, #4
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027D44 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	bne _08027D22
	b _08027E40
_08027D22:
	ldrh r0, [r4, #2]
	subs r0, #0x38
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08027D38
	b _08027E40
_08027D38:
	ldrh r0, [r4, #2]
	movs r2, #1
	subs r0, r0, r2
	strh r0, [r4, #2]
	b _08027E54
	.align 2, 0
_08027D44: .4byte gPreviousCollisionCheck
_08027D48:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08027DD4
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08027D98
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027D94 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08027E40
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08027E40
	ldrh r0, [r4, #4]
	adds r0, #1
	b _08027E52
	.align 2, 0
_08027D94: .4byte gPreviousCollisionCheck
_08027D98:
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027DD0 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r6, #0xf
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08027E40
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08027E40
	ldrh r0, [r4, #4]
	movs r3, #1
	subs r0, r0, r3
	b _08027E52
	.align 2, 0
_08027DD0: .4byte gPreviousCollisionCheck
_08027DD4:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08027E14
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027E10 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08027E40
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	adds r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08027E40
	ldrh r0, [r4, #4]
	adds r0, #1
	b _08027E52
	.align 2, 0
_08027E10: .4byte gPreviousCollisionCheck
_08027E14:
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldr r5, _08027E48 @ =gPreviousCollisionCheck
	ldrb r1, [r5]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _08027E40
	ldrh r0, [r4, #2]
	subs r0, #4
	ldrh r1, [r4, #4]
	subs r1, #0x38
	bl SpriteUtilCheckCollisionAtPosition
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08027E4C
_08027E40:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	b _08027E54
	.align 2, 0
_08027E48: .4byte gPreviousCollisionCheck
_08027E4C:
	ldrh r0, [r4, #4]
	movs r1, #1
	subs r0, r0, r1
_08027E52:
	strh r0, [r4, #4]
_08027E54:
	cmp r7, #0
	beq _08027E6C
	ldr r2, _08027E80 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x24
	movs r0, #7
	strb r0, [r2]
_08027E6C:
	bl SciserCheckSamusInRange
_08027E70:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027E80: .4byte gCurrentSprite

	thumb_func_start SciserIdleInit
SciserIdleInit: @ 0x08027E84
	push {lr}
	ldr r0, _08027E98 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #8
	strb r1, [r0]
	bl SciserSetIdleGFX
	pop {r0}
	bx r0
	.align 2, 0
_08027E98: .4byte gCurrentSprite

	thumb_func_start SciserIdle
SciserIdle: @ 0x08027E9C
	push {lr}
	bl SciserCheckCollisions
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027EB4
	ldr r0, _08027EB0 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #0x15
	b _08027EC2
	.align 2, 0
_08027EB0: .4byte gCurrentSprite
_08027EB4:
	bl SpriteUtilCheckNearEndCurrentSpriteAnim
	cmp r0, #0
	beq _08027EC4
	ldr r0, _08027EC8 @ =gCurrentSprite
	adds r0, #0x24
	movs r1, #1
_08027EC2:
	strb r1, [r0]
_08027EC4:
	pop {r0}
	bx r0
	.align 2, 0
_08027EC8: .4byte gCurrentSprite

	thumb_func_start SciserFallingInit
SciserFallingInit: @ 0x08027ECC
	push {lr}
	ldr r1, _08027EE8 @ =gCurrentSprite
	adds r2, r1, #0
	adds r2, #0x24
	movs r3, #0
	movs r0, #0x16
	strb r0, [r2]
	adds r1, #0x31
	strb r3, [r1]
	bl SciserSetIdleGFX
	pop {r0}
	bx r0
	.align 2, 0
_08027EE8: .4byte gCurrentSprite

	thumb_func_start SciserFalling
SciserFalling: @ 0x08027EEC
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _08027F14 @ =gCurrentSprite
	ldrh r3, [r2, #2]
	ldrh r4, [r2, #4]
	adds r0, r2, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027F18
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08027F24
	subs r0, r4, #4
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	b _08027F24
	.align 2, 0
_08027F14: .4byte gCurrentSprite
_08027F18:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08027F2C
_08027F24:
	ldrh r0, [r2, #0xc]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08027F2C:
	adds r0, r3, #0
	adds r1, r4, #0
	bl SpriteUtilCheckVerticalCollisionAtPositionSlopes
	adds r1, r0, #0
	ldr r0, _08027F78 @ =gPreviousVerticalCollisionCheck
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027FBE
	ldr r4, _08027F7C @ =gCurrentSprite
	strh r1, [r4, #2]
	adds r2, r4, #0
	adds r2, #0x2d
	ldrb r0, [r2]
	cmp r0, #0
	beq _08027F52
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_08027F52:
	ldrh r0, [r4]
	ldr r1, _08027F80 @ =0x0000FEFF
	ands r1, r0
	strh r1, [r4]
	movs r0, #0
	strb r0, [r2]
	bl SciserUpdateHitbox
	cmp r5, #0
	beq _08027F8C
	ldrh r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08027F84
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0x10]
	b _08027F88
	.align 2, 0
_08027F78: .4byte gPreviousVerticalCollisionCheck
_08027F7C: .4byte gCurrentSprite
_08027F80: .4byte 0x0000FEFF
_08027F84:
	ldrh r0, [r4, #4]
	ldrh r1, [r4, #0xe]
_08027F88:
	subs r0, r0, r1
	strh r0, [r4, #4]
_08027F8C:
	ldr r2, _08027FAC @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _08027FB0
	adds r0, r2, #0
	adds r0, #0x24
	strb r3, [r0]
	bl SciserSetCrawlingGFX
	b _08028000
	.align 2, 0
_08027FAC: .4byte gCurrentSprite
_08027FB0:
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #8
	strb r0, [r1]
	bl SciserSetIdleGFX
	b _08028000
_08027FBE:
	ldr r3, _08027FE8 @ =gCurrentSprite
	movs r0, #0x31
	adds r0, r0, r3
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _08027FEC @ =sSpritesFallingSpeed
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08027FF0 @ =0x00007FFF
	cmp r1, r0
	bne _08027FF4
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r3, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08027FFE
	.align 2, 0
_08027FE8: .4byte gCurrentSprite
_08027FEC: .4byte sSpritesFallingSpeed
_08027FF0: .4byte 0x00007FFF
_08027FF4:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r3, #2]
	adds r0, r0, r4
_08027FFE:
	strh r0, [r3, #2]
_08028000:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SciserProjectileInit
SciserProjectileInit: @ 0x08028008
	push {r4, lr}
	ldr r0, _0802806C @ =gCurrentSprite
	mov ip, r0
	ldrh r1, [r0]
	ldr r0, _08028070 @ =0x0000FFFB
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
	movs r1, #8
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _08028074 @ =0x0000FFF8
	mov r2, ip
	strh r0, [r2, #0xa]
	strh r1, [r2, #0xc]
	strh r0, [r2, #0xe]
	strh r1, [r2, #0x10]
	ldr r0, _08028078 @ =0x08318EF0
	str r0, [r2, #0x18]
	strb r3, [r2, #0x1c]
	strh r4, [r2, #0x16]
	mov r0, ip
	adds r0, #0x31
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x24
	movs r0, #2
	strb r0, [r1]
	adds r1, #1
	movs r0, #4
	strb r0, [r1]
	subs r1, #3
	movs r0, #3
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802806C: .4byte gCurrentSprite
_08028070: .4byte 0x0000FFFB
_08028074: .4byte 0x0000FFF8
_08028078: .4byte 0x08318EF0

	thumb_func_start SciserProjectileFalling
SciserProjectileFalling: @ 0x0802807C
	push {r4, r5, r6, lr}
	ldr r1, _080280A4 @ =gCurrentClipdataAffectingAction
	movs r0, #5
	strb r0, [r1]
	ldr r4, _080280A8 @ =gCurrentSprite
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	bl SpriteUtilCheckCollisionAtPosition
	ldr r0, _080280AC @ =gPreviousCollisionCheck
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0
	beq _080280B0
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x37
	strb r0, [r1]
	b _08028152
	.align 2, 0
_080280A4: .4byte gCurrentClipdataAffectingAction
_080280A8: .4byte gCurrentSprite
_080280AC: .4byte gPreviousCollisionCheck
_080280B0:
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080280F8
	movs r0, #0x31
	adds r0, r0, r4
	mov ip, r0
	ldrb r2, [r0]
	ldr r5, _080280E0 @ =0x08317692
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080280E4 @ =0x00007FFF
	cmp r1, r0
	bne _080280E8
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080280F2
	.align 2, 0
_080280E0: .4byte 0x08317692
_080280E4: .4byte 0x00007FFF
_080280E8:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_080280F2:
	strh r0, [r4, #2]
	movs r3, #8
	b _08028136
_080280F8:
	movs r6, #0x31
	adds r6, r6, r4
	mov ip, r6
	ldrb r2, [r6]
	ldr r5, _08028120 @ =0x08317660
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r3, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _08028124 @ =0x00007FFF
	cmp r1, r0
	bne _08028128
	subs r1, r2, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r4, #2]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _08028132
	.align 2, 0
_08028120: .4byte 0x08317660
_08028124: .4byte 0x00007FFF
_08028128:
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r4, #2]
	adds r0, r0, r3
_08028132:
	strh r0, [r4, #2]
	movs r3, #4
_08028136:
	ldr r2, _08028148 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802814C
	ldrh r0, [r2, #4]
	adds r0, r3, r0
	b _08028150
	.align 2, 0
_08028148: .4byte gCurrentSprite
_0802814C:
	ldrh r0, [r2, #4]
	subs r0, r0, r3
_08028150:
	strh r0, [r2, #4]
_08028152:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start SciserProjectileExplodingInit
SciserProjectileExplodingInit: @ 0x08028158
	push {lr}
	ldr r3, _08028188 @ =gCurrentSprite
	adds r2, r3, #0
	adds r2, #0x24
	movs r1, #0
	movs r0, #0x38
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x25
	strb r1, [r0]
	strb r1, [r3, #0x1c]
	strh r1, [r3, #0x16]
	adds r1, r3, #0
	adds r1, #0x21
	movs r0, #1
	strb r0, [r1]
	ldr r1, _0802818C @ =gFrameCounter8Bit
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028194
	ldr r0, _08028190 @ =0x083190C8
	b _08028196
	.align 2, 0
_08028188: .4byte gCurrentSprite
_0802818C: .4byte gSpriteRandomNumber
_08028190: .4byte 0x083190C8
_08028194:
	ldr r0, _0802819C @ =0x083190F0
_08028196:
	str r0, [r3, #0x18]
	pop {r0}
	bx r0
	.align 2, 0
_0802819C: .4byte 0x083190F0

	thumb_func_start SciserProjectileExploding
SciserProjectileExploding: @ 0x080281A0
	push {r4, lr}
	ldr r4, _080281C0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl SpriteUtilCheckEndCurrentSpriteAnim
	cmp r0, #0
	beq _080281B8
	movs r0, #0
	strh r0, [r4]
_080281B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080281C0: .4byte gCurrentSprite

	thumb_func_start Sciser
Sciser: @ 0x080281C4
	push {lr}
	ldr r2, _080281E4 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #4
	bne _080281F2
	ldrb r0, [r2, #0x1d]
	cmp r0, #0x8b
	bne _080281EC
	ldr r0, _080281E8 @ =0x000001B1
	bl SoundPlayNotAlreadyPlaying
	b _080281F2
	.align 2, 0
_080281E4: .4byte gCurrentSprite
_080281E8: .4byte 0x000001B1
_080281EC:
	ldr r0, _08028204 @ =0x00000163
	bl SoundPlayNotAlreadyPlaying
_080281F2:
	ldr r1, _08028208 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802820C
	bl SpriteUtilUpdateFreezeTimer
	b _080283DE
	.align 2, 0
_08028204: .4byte 0x00000163
_08028208: .4byte gCurrentSprite
_0802820C:
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5b
	bls _08028218
	b _080283DE
_08028218:
	lsls r0, r0, #2
	ldr r1, _08028224 @ =_08028228
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08028224: .4byte _08028228
_08028228: @ jump table
	.4byte _08028398 @ case 0
	.4byte _0802839E @ case 1
	.4byte _080283A2 @ case 2
	.4byte _080283DE @ case 3
	.4byte _080283DE @ case 4
	.4byte _080283DE @ case 5
	.4byte _080283DE @ case 6
	.4byte _080283A8 @ case 7
	.4byte _080283AC @ case 8
	.4byte _080283DE @ case 9
	.4byte _080283DE @ case 10
	.4byte _080283DE @ case 11
	.4byte _080283DE @ case 12
	.4byte _080283DE @ case 13
	.4byte _080283DE @ case 14
	.4byte _080283DE @ case 15
	.4byte _080283DE @ case 16
	.4byte _080283DE @ case 17
	.4byte _080283DE @ case 18
	.4byte _080283DE @ case 19
	.4byte _080283DE @ case 20
	.4byte _080283B2 @ case 21
	.4byte _080283B6 @ case 22
	.4byte _080283DE @ case 23
	.4byte _080283DE @ case 24
	.4byte _080283DE @ case 25
	.4byte _080283DE @ case 26
	.4byte _080283DE @ case 27
	.4byte _080283DE @ case 28
	.4byte _080283DE @ case 29
	.4byte _080283DE @ case 30
	.4byte _080283DE @ case 31
	.4byte _080283DE @ case 32
	.4byte _080283DE @ case 33
	.4byte _080283DE @ case 34
	.4byte _080283DE @ case 35
	.4byte _080283DE @ case 36
	.4byte _080283DE @ case 37
	.4byte _080283DE @ case 38
	.4byte _080283DE @ case 39
	.4byte _080283DE @ case 40
	.4byte _080283DE @ case 41
	.4byte _080283BC @ case 42
	.4byte _080283DE @ case 43
	.4byte _080283DE @ case 44
	.4byte _080283DE @ case 45
	.4byte _080283DE @ case 46
	.4byte _080283DE @ case 47
	.4byte _080283DE @ case 48
	.4byte _080283DE @ case 49
	.4byte _080283DE @ case 50
	.4byte _080283DE @ case 51
	.4byte _080283DE @ case 52
	.4byte _080283DE @ case 53
	.4byte _080283DE @ case 54
	.4byte _080283DE @ case 55
	.4byte _080283DE @ case 56
	.4byte _080283DE @ case 57
	.4byte _080283DE @ case 58
	.4byte _080283DE @ case 59
	.4byte _080283DE @ case 60
	.4byte _080283DE @ case 61
	.4byte _080283DE @ case 62
	.4byte _080283DE @ case 63
	.4byte _080283DE @ case 64
	.4byte _080283DE @ case 65
	.4byte _080283DE @ case 66
	.4byte _080283DE @ case 67
	.4byte _080283DE @ case 68
	.4byte _080283DE @ case 69
	.4byte _080283DE @ case 70
	.4byte _080283DE @ case 71
	.4byte _080283DE @ case 72
	.4byte _080283DE @ case 73
	.4byte _080283DE @ case 74
	.4byte _080283DE @ case 75
	.4byte _080283DE @ case 76
	.4byte _080283DE @ case 77
	.4byte _080283DE @ case 78
	.4byte _080283DE @ case 79
	.4byte _080283DE @ case 80
	.4byte _080283DE @ case 81
	.4byte _080283DE @ case 82
	.4byte _080283DE @ case 83
	.4byte _080283DE @ case 84
	.4byte _080283DE @ case 85
	.4byte _080283DE @ case 86
	.4byte _080283C2 @ case 87
	.4byte _080283C6 @ case 88
	.4byte _080283CC @ case 89
	.4byte _080283D0 @ case 90
	.4byte _080283D6 @ case 91
_08028398:
	bl SciserInit
	b _080283DE
_0802839E:
	bl SciserCrawlingInit
_080283A2:
	bl SciserCrawling
	b _080283DE
_080283A8:
	bl SciserIdleInit
_080283AC:
	bl SciserIdle
	b _080283DE
_080283B2:
	bl SciserFallingInit
_080283B6:
	bl SciserFalling
	b _080283DE
_080283BC:
	bl SciserShooting
	b _080283DE
_080283C2:
	bl SpriteDyingInit
_080283C6:
	bl SpriteDying
	b _080283DE
_080283CC:
	bl SciserInit
_080283D0:
	bl SpriteSpawningFromX
	b _080283DE
_080283D6:
	bl SciserTurningIntoX
	bl XParasiteInit
_080283DE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SciserProjectile
SciserProjectile: @ 0x080283E4
	push {lr}
	ldr r0, _080283FC @ =gCurrentSprite
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #2
	beq _0802840A
	cmp r0, #2
	bgt _08028400
	cmp r0, #0
	beq _08028406
	b _08028416
	.align 2, 0
_080283FC: .4byte gCurrentSprite
_08028400:
	cmp r0, #0x38
	beq _08028410
	b _08028416
_08028406:
	bl SciserProjectileInit
_0802840A:
	bl SciserProjectileFalling
	b _0802841A
_08028410:
	bl SciserProjectileExploding
	b _0802841A
_08028416:
	bl SciserProjectileExplodingInit
_0802841A:
	pop {r0}
	bx r0
	.align 2, 0
