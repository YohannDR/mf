    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start unk_61004
unk_61004: @ 0x08061004
	push {r4, lr}
	movs r3, #0
	ldr r4, _08061054 @ =gSpriteData
_0806100A:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r4
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08061058
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x5b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _08061050
	cmp r1, #0x5a
	bhi _08061058
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _08061058
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08061058
_08061050:
	movs r0, #1
	b _08061064
	.align 2, 0
_08061054: .4byte gSpriteData
_08061058:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0806100A
	movs r0, #0
_08061064:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CountPrimarySpritesThatCantAbsorbX
CountPrimarySpritesThatCantAbsorbX: @ 0x0806106C
	push {r4, r5, lr}
	movs r4, #0
	movs r3, #0
	ldr r5, _080610D4 @ =gSpriteData
_08061074:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080610C0
	adds r0, r2, #0
	adds r0, #0x24
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0x5b
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bls _080610BA
	cmp r1, #0x5a
	bhi _080610C0
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _080610C0
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x82
	ands r0, r1
	cmp r0, #0
	bne _080610C0
_080610BA:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
_080610C0:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _08061074
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080610D4: .4byte gSpriteData

	thumb_func_start XParasiteMove
XParasiteMove: @ 0x080610D8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r4, [sp, #0x28]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	lsls r4, r4, #0x18
	lsrs r5, r4, #0x18
	movs r0, #0
	mov sl, r0
	ldr r2, _08061138 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0
	beq _0806116E
	movs r1, #0x2f
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08061156
	ldrh r1, [r2, #4]
	subs r0, r6, #4
	cmp r1, r0
	ble _0806113C
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r3, ip
	strb r0, [r3]
	b _080611EE
	.align 2, 0
_08061138: .4byte gCurrentSprite
_0806113C:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r3
	bhs _0806114A
	adds r0, #1
	strb r0, [r1]
_0806114A:
	ldrb r0, [r1]
	asrs r0, r5
	ldrh r6, [r2, #4]
	adds r0, r0, r6
	strh r0, [r2, #4]
	b _080611EE
_08061156:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080611F4
	ldrb r0, [r1]
	asrs r0, r5
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _080611EE
_0806116E:
	movs r6, #0x2f
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r4, r0, #0
	cmp r4, #0
	bne _080611BC
	ldrh r3, [r2, #4]
	mov r0, r8
	adds r0, #4
	cmp r3, r0
	bge _08061190
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r6]
	b _080611EE
_08061190:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sb
	bhs _0806119E
	adds r0, #1
	strb r0, [r1]
_0806119E:
	ldrb r0, [r1]
	asrs r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080611E6
	movs r0, #1
	mov sl, r0
	mov r1, ip
	strb r4, [r1]
	b _080611EE
_080611BC:
	subs r0, #1
	mov r3, ip
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080611EA
	ldrb r0, [r3]
	asrs r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080611E6
	movs r6, #1
	mov sl, r6
	strb r7, [r3]
	b _080611EE
_080611E6:
	strh r1, [r2, #4]
	b _080611EE
_080611EA:
	movs r0, #1
	mov sl, r0
_080611EE:
	mov r1, sl
	cmp r1, #0
	beq _08061240
_080611F4:
	ldr r4, _08061234 @ =gCurrentSprite
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	eors r0, r1
	strh r0, [r4]
	adds r0, r4, #0
	adds r0, #0x30
	movs r6, #1
	strb r6, [r0]
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _0806121C
	movs r0, #0
	strh r0, [r4, #8]
_0806121C:
	ldr r0, _08061238 @ =0x00000141
	bl CheckPlayNotAlreadyPlayingSound
	adds r1, r4, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806123C
	movs r0, #0x10
	strb r0, [r1]
	b _0806123E
	.align 2, 0
_08061234: .4byte gCurrentSprite
_08061238: .4byte 0x00000141
_0806123C:
	strb r6, [r1]
_0806123E:
	adds r2, r4, #0
_08061240:
	movs r3, #0
	mov sl, r3
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080612A4
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _0806128E
	ldrh r1, [r2, #2]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _08061272
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _08061326
_08061272:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp, #4]
	cmp r0, r6
	bhs _08061282
	adds r0, #1
	strb r0, [r1]
_08061282:
	ldrb r0, [r1]
	asrs r0, r5
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _08061326
_0806128E:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806132C
	ldrb r0, [r3]
	asrs r0, r5
	ldrh r3, [r2, #2]
	adds r0, r0, r3
	strh r0, [r2, #2]
	b _08061326
_080612A4:
	movs r6, #0x2e
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r4, r0, #0
	cmp r4, #0
	bne _080612F4
	ldrh r3, [r2, #2]
	ldr r0, [sp]
	adds r0, #4
	cmp r3, r0
	bge _080612C6
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r6]
	b _08061326
_080612C6:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp, #4]
	cmp r0, r6
	bhs _080612D6
	adds r0, #1
	strb r0, [r1]
_080612D6:
	ldrb r0, [r1]
	asrs r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806131E
	movs r0, #1
	mov sl, r0
	mov r1, ip
	strb r4, [r1]
	b _08061326
_080612F4:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061322
	ldrb r0, [r6]
	asrs r0, r5
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0806131E
	movs r0, #1
	mov sl, r0
	strb r3, [r6]
	b _08061326
_0806131E:
	strh r1, [r2, #2]
	b _08061326
_08061322:
	movs r1, #1
	mov sl, r1
_08061326:
	mov r3, sl
	cmp r3, #0
	beq _08061346
_0806132C:
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08061358 @ =0x00000141
	bl CheckPlayNotAlreadyPlayingSound
_08061346:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061358: .4byte 0x00000141

	thumb_func_start XParasiteMoveWithSound
XParasiteMoveWithSound: @ 0x0806135C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	mov r8, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #4]
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	mov sl, r7
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp, #8]
	movs r0, #0
	mov sb, r0
	ldr r2, _080613C4 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _080613FA
	movs r1, #0x2f
	adds r1, r1, r2
	mov ip, r1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080613E2
	ldrh r1, [r2, #4]
	subs r0, r6, #4
	cmp r1, r0
	ble _080613C8
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	mov r3, ip
	strb r0, [r3]
	b _0806147A
	.align 2, 0
_080613C4: .4byte gCurrentSprite
_080613C8:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, r7
	bhs _080613D6
	adds r0, #1
	strb r0, [r1]
_080613D6:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r2, #4]
	adds r0, r0, r6
	strh r0, [r2, #4]
	b _0806147A
_080613E2:
	subs r0, #1
	mov r1, ip
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061480
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r3, [r2, #4]
	adds r0, r0, r3
	strh r0, [r2, #4]
	b _0806147A
_080613FA:
	movs r6, #0x2f
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r5, r0, #0
	cmp r5, #0
	bne _08061448
	ldrh r3, [r2, #4]
	mov r0, r8
	adds r0, #4
	cmp r3, r0
	bge _0806141C
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r6]
	b _0806147A
_0806141C:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, sl
	bhs _0806142A
	adds r0, #1
	strb r0, [r1]
_0806142A:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061472
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _0806147A
_08061448:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061476
	ldrb r0, [r6]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #4]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061472
	movs r0, #1
	mov sb, r0
	strb r3, [r6]
	b _0806147A
_08061472:
	strh r1, [r2, #4]
	b _0806147A
_08061476:
	movs r1, #1
	mov sb, r1
_0806147A:
	mov r3, sb
	cmp r3, #0
	beq _0806149A
_08061480:
	ldr r2, _080614D0 @ =gCurrentSprite
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r2, #0x30
	movs r0, #1
	strb r0, [r2]
	ldr r0, [sp, #8]
	bl CheckPlayNotAlreadyPlayingSound
_0806149A:
	movs r0, #0
	mov sb, r0
	ldr r2, _080614D0 @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #0
	beq _08061506
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _080614F0
	ldrh r1, [r2, #2]
	ldr r0, [sp]
	subs r0, #4
	cmp r1, r0
	ble _080614D4
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _08061588
	.align 2, 0
_080614D0: .4byte gCurrentSprite
_080614D4:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r3, [sp, #4]
	cmp r0, r3
	bhs _080614E4
	adds r0, #1
	strb r0, [r1]
_080614E4:
	ldrb r0, [r1]
	asrs r0, r4
	ldrh r6, [r2, #2]
	adds r0, r0, r6
	strh r0, [r2, #2]
	b _08061588
_080614F0:
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0806158E
	ldrb r0, [r3]
	asrs r0, r4
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _08061588
_08061506:
	movs r6, #0x2e
	adds r6, r6, r2
	mov ip, r6
	ldrb r0, [r6]
	adds r5, r0, #0
	cmp r5, #0
	bne _08061556
	ldrh r3, [r2, #2]
	ldr r0, [sp]
	adds r0, #4
	cmp r3, r0
	bge _08061528
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r6]
	b _08061588
_08061528:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	ldr r6, [sp, #4]
	cmp r0, r6
	bhs _08061538
	adds r0, #1
	strb r0, [r1]
_08061538:
	ldrb r0, [r1]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	subs r1, r3, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061580
	movs r0, #1
	mov sb, r0
	mov r1, ip
	strb r5, [r1]
	b _08061588
_08061556:
	subs r0, #1
	mov r6, ip
	strb r0, [r6]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08061584
	ldrb r0, [r6]
	asrs r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r2, #2]
	subs r1, r0, r1
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08061580
	movs r0, #1
	mov sb, r0
	strb r3, [r6]
	b _08061588
_08061580:
	strh r1, [r2, #2]
	b _08061588
_08061584:
	movs r1, #1
	mov sb, r1
_08061588:
	mov r3, sb
	cmp r3, #0
	beq _080615A8
_0806158E:
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r1, r6, #0
	eors r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x31
	movs r0, #1
	strb r0, [r1]
	ldr r0, [sp, #8]
	bl CheckPlayNotAlreadyPlayingSound
_080615A8:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SamusAbsorbX
SamusAbsorbX: @ 0x080615B8
	push {r4, r5, r6, lr}
	ldr r2, _08061600 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r1, r0
	cmp r1, #0x30
	beq _08061664
	cmp r1, #0x30
	bgt _08061664
	cmp r1, #0x20
	bne _08061664
	adds r0, r2, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08061608
	movs r6, #0xfa
	lsls r6, r6, #1
	movs r5, #0x64
	movs r4, #0xa
	ldr r2, _08061604 @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	movs r2, #0x1c
	bl ParticleSet
	b _0806164E
	.align 2, 0
_08061600: .4byte gCurrentSprite
_08061604: .4byte gSamusData
_08061608:
	cmp r0, #0x10
	bne _08061630
	movs r6, #0
	movs r5, #2
	movs r4, #0
	ldr r2, _0806162C @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	movs r2, #0x1b
	bl ParticleSet
	b _0806164E
	.align 2, 0
_0806162C: .4byte gSamusData
_08061630:
	movs r6, #0xa
	movs r5, #0
	movs r4, #0
	ldr r2, _0806166C @ =gSamusData
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2, #0x18]
	adds r0, r0, r1
	ldrh r1, [r2, #0x16]
	movs r2, #0x1a
	bl ParticleSet
_0806164E:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl RefillSamus
	ldr r1, _08061670 @ =0x030012F0
	movs r0, #0x30
	strb r0, [r1, #3]
	movs r0, #0x92
	bl SoundPlay
_08061664:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806166C: .4byte gSamusData
_08061670: .4byte 0x030012F0

	thumb_func_start XParasiteGettingAbsorbedInit
XParasiteGettingAbsorbedInit: @ 0x08061674
	push {lr}
	ldr r3, _080616BC @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x5e
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x26
	movs r1, #1
	strb r1, [r0]
	adds r0, #9
	strb r2, [r0]
	adds r0, #1
	strb r1, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r1, [r0]
	ldrh r1, [r3]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2b
	strb r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x12]
	movs r0, #0x14
	strh r0, [r3, #6]
	bl SamusAbsorbX
	pop {r0}
	bx r0
	.align 2, 0
_080616BC: .4byte gCurrentSprite

	thumb_func_start SpriteDyingInit
SpriteDyingInit: @ 0x080616C0
	push {lr}
	ldr r1, _080616E8 @ =gCurrentSprite
	ldrh r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strh r0, [r1]
	adds r2, r1, #0
	adds r2, #0x24
	movs r0, #0x58
	strb r0, [r2]
	adds r1, #0x2e
	movs r0, #0x2c
	strb r0, [r1]
	movs r0, #0xa1
	lsls r0, r0, #1
	bl CheckPlayNotAlreadyPlayingSound
	pop {r0}
	bx r0
	.align 2, 0
_080616E8: .4byte gCurrentSprite

	thumb_func_start SpriteDying
SpriteDying: @ 0x080616EC
	push {r4, lr}
	ldr r1, _08061744 @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	adds r2, r1, #0
	adds r2, #0x20
	ldrb r0, [r2]
	adds r3, r1, #0
	cmp r0, #0
	beq _08061708
	movs r0, #0
	strb r0, [r2]
_08061708:
	adds r2, r3, #0
	adds r2, #0x2e
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0806171E
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
_0806171E:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0
	bne _0806175A
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	beq _08061748
	strh r4, [r3]
	b _0806175A
	.align 2, 0
_08061744: .4byte gCurrentSprite
_08061748:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5b
	strb r0, [r1]
	strb r2, [r3, #0x1f]
	ldrh r1, [r3]
	movs r0, #4
	orrs r0, r1
	strh r0, [r3]
_0806175A:
	ldr r2, _08061774 @ =gWrittenToMosaic_H
	ldr r1, _08061778 @ =sXParasiteMosaicValues
	adds r0, r3, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08061774: .4byte gWrittenToMosaic_H
_08061778: .4byte sXParasiteMosaicValues

	thumb_func_start XParasiteSpawningInit
XParasiteSpawningInit: @ 0x0806177C
	ldr r3, _080617B0 @ =gCurrentSprite
	ldrh r0, [r3]
	movs r1, #0x20
	orrs r1, r0
	movs r0, #0x16
	strh r0, [r3, #6]
	ldr r2, _080617B4 @ =gWrittenToMosaic_H
	ldr r0, _080617B8 @ =sXParasiteMosaicValues
	ldrh r0, [r0, #0x2c]
	strh r0, [r2]
	ldr r0, _080617BC @ =0x0000FFFB
	ands r1, r0
	strh r1, [r3]
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	ldr r0, _080617C0 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x18
	adds r1, #0xc
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	bx lr
	.align 2, 0
_080617B0: .4byte gCurrentSprite
_080617B4: .4byte gWrittenToMosaic_H
_080617B8: .4byte sXParasiteMosaicValues
_080617BC: .4byte 0x0000FFFB
_080617C0: .4byte gSpriteRandomNumber

	thumb_func_start XParasiteDetermineType
XParasiteDetermineType: @ 0x080617C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	ldr r1, _080617EC @ =gCurrentSprite
	adds r0, r1, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	movs r3, #0xf0
	ands r3, r0
	adds r5, r1, #0
	cmp r3, #0x30
	bne _080617E2
	b _080618F8
_080617E2:
	cmp r3, #0x30
	bgt _080617F0
	cmp r3, #0x20
	beq _080617F8
	b _0806192C
	.align 2, 0
_080617EC: .4byte gCurrentSprite
_080617F0:
	cmp r3, #0x40
	bne _080617F6
	b _08061918
_080617F6:
	b _0806192C
_080617F8:
	cmp r2, #2
	bne _08061824
	ldr r0, _0806181C @ =gFrameCounter8Bit
	ldrb r0, [r0]
	cmp r0, #4
	bls _0806180E
	bl CheckEnergyFullAndMissilesNotFull
	cmp r0, #0
	bne _0806180E
	b _08061904
_0806180E:
	ldr r0, _08061820 @ =0x083BE288
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x10
	strb r0, [r1]
	b _08061930
	.align 2, 0
_0806181C: .4byte gSpriteRandomNumber
_08061820: .4byte 0x083BE288
_08061824:
	cmp r2, #1
	bne _08061904
	ldr r0, _08061884 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r4, #3
	ands r4, r0
	lsls r4, r4, #8
	ldr r0, _08061888 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	orrs r4, r0
	adds r4, #1
	ldr r2, _0806188C @ =sPrimarySpriteStats
	lsls r1, r6, #3
	subs r1, r1, r6
	lsls r1, r1, #1
	adds r0, r2, #0
	adds r0, #8
	adds r0, r1, r0
	ldrh r6, [r0]
	adds r0, r2, #0
	adds r0, #0xa
	adds r0, r1, r0
	ldrh r3, [r0]
	adds r0, r2, #0
	adds r0, #0xc
	adds r1, r1, r0
	ldrh r2, [r1]
	cmp r2, #0
	beq _08061894
	movs r0, #0x80
	lsls r0, r0, #3
	adds r1, r0, #0
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r4, r1
	bhi _08061898
	cmp r4, r2
	bls _08061898
	ldr r0, _08061890 @ =0x083BE2C0
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x11
	strb r0, [r1]
	b _08061930
	.align 2, 0
_08061884: .4byte gSpriteRandomNumber
_08061888: .4byte gFrameCounter8Bit
_0806188C: .4byte sPrimarySpriteStats
_08061890: .4byte 0x083BE2C0
_08061894:
	movs r2, #0x80
	lsls r2, r2, #3
_08061898:
	cmp r3, #0
	beq _080618B4
	subs r0, r2, r3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r2, r4
	blo _080618B6
	cmp r4, r3
	bls _080618B6
	bl CheckMissilesFullAndEnergyNotFull
	cmp r0, #0
	bne _080618E0
	b _080618CA
_080618B4:
	adds r3, r2, #0
_080618B6:
	cmp r6, #0
	beq _0806192C
	cmp r3, r4
	blo _0806192C
	cmp r4, #0
	beq _0806192C
	bl CheckEnergyFullAndMissilesNotFull
	cmp r0, #0
	beq _080618E0
_080618CA:
	ldr r0, _080618D8 @ =gCurrentSprite
	ldr r1, _080618DC @ =0x083BE288
	str r1, [r0, #0x18]
	adds r0, #0x25
	movs r1, #0x10
	strb r1, [r0]
	b _08061930
	.align 2, 0
_080618D8: .4byte gCurrentSprite
_080618DC: .4byte 0x083BE288
_080618E0:
	ldr r0, _080618F0 @ =gCurrentSprite
	ldr r1, _080618F4 @ =0x083BE250
	str r1, [r0, #0x18]
	adds r0, #0x25
	movs r1, #0xf
	strb r1, [r0]
	b _08061930
	.align 2, 0
_080618F0: .4byte gCurrentSprite
_080618F4: .4byte 0x083BE250
_080618F8:
	adds r2, r5, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2]
_08061904:
	ldr r0, _08061914 @ =0x083BE250
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0xf
	strb r0, [r1]
	b _08061930
	.align 2, 0
_08061914: .4byte 0x083BE250
_08061918:
	ldr r0, _08061928 @ =0x083BE250
	str r0, [r5, #0x18]
	adds r1, r5, #0
	adds r1, #0x25
	movs r0, #0x12
	strb r0, [r1]
	b _08061930
	.align 2, 0
_08061928: .4byte 0x083BE250
_0806192C:
	movs r0, #0
	strh r0, [r5]
_08061930:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteInit
XParasiteInit: @ 0x08061938
	push {r4, r5, r6, lr}
	ldr r4, _08061954 @ =gCurrentSprite
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0
	beq _08061958
	movs r0, #0
	strh r0, [r4]
	b _08061B30
	.align 2, 0
_08061954: .4byte gCurrentSprite
_08061958:
	ldrb r0, [r4, #0x1d]
	cmp r0, #0x36
	beq _080619B0
	cmp r0, #0x36
	bgt _0806196C
	cmp r0, #0x32
	beq _080619E0
	cmp r0, #0x34
	beq _080619B0
	b _08061A68
_0806196C:
	cmp r0, #0x40
	beq _08061980
	cmp r0, #0x40
	bgt _0806197A
	cmp r0, #0x38
	beq _08061A52
	b _08061A68
_0806197A:
	cmp r0, #0xb9
	beq _08061A52
	b _08061A68
_08061980:
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	movs r5, #1
	strb r5, [r0]
	adds r0, #1
	strb r5, [r0]
	movs r0, #0
	movs r1, #0
	bl XParasiteDetermineType
	ldr r0, _080619AC @ =gFrameCounter8Bit
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	bne _08061A2E
	b _08061A48
	.align 2, 0
_080619AC: .4byte gSpriteRandomNumber
_080619B0:
	ldr r2, _080619D8 @ =gCurrentSprite
	ldrh r1, [r2]
	ldr r0, _080619DC @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x30
	movs r1, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	movs r1, #0
	bl XParasiteDetermineType
	b _08061A7A
	.align 2, 0
_080619D8: .4byte gCurrentSprite
_080619DC: .4byte 0x0000FFFB
_080619E0:
	ldrh r1, [r4]
	ldr r0, _08061A38 @ =0x0000FFFB
	ands r0, r1
	movs r2, #0
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0x2c
	strh r0, [r4, #6]
	ldr r1, _08061A3C @ =gWrittenToMosaic_H
	ldr r0, _08061A40 @ =sXParasiteMosaicValues
	adds r0, #0x58
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x5c
	strb r0, [r1]
	strh r3, [r4, #8]
	adds r0, r4, #0
	adds r0, #0x2f
	strb r2, [r0]
	adds r0, #1
	movs r5, #1
	strb r5, [r0]
	subs r0, #2
	strb r2, [r0]
	adds r0, #3
	strb r5, [r0]
	movs r0, #2
	movs r1, #0
	bl XParasiteDetermineType
	ldr r0, _08061A44 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08061A48
_08061A2E:
	adds r0, r4, #0
	adds r0, #0x22
	strb r5, [r0]
	b _08061A7A
	.align 2, 0
_08061A38: .4byte 0x0000FFFB
_08061A3C: .4byte gWrittenToMosaic_H
_08061A40: .4byte sXParasiteMosaicValues
_08061A44: .4byte gSpriteRandomNumber
_08061A48:
	adds r1, r4, #0
	adds r1, #0x22
	movs r0, #0x10
	strb r0, [r1]
	b _08061A7A
_08061A52:
	bl XParasiteSpawningInit
	ldr r0, _08061A64 @ =gCurrentSprite
	ldrb r1, [r0, #0x1e]
	movs r0, #1
	bl XParasiteDetermineType
	b _08061A7A
	.align 2, 0
_08061A64: .4byte gCurrentSprite
_08061A68:
	bl XParasiteSpawningInit
	ldr r4, _08061B08 @ =gCurrentSprite
	ldrb r1, [r4, #0x1d]
	movs r0, #1
	bl XParasiteDetermineType
	movs r0, #0x38
	strb r0, [r4, #0x1d]
_08061A7A:
	ldr r0, _08061B08 @ =gCurrentSprite
	mov ip, r0
	adds r0, #0x2c
	movs r3, #0
	strb r3, [r0]
	mov r0, ip
	adds r0, #0x26
	movs r4, #1
	strb r4, [r0]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	mov r1, ip
	ldrh r0, [r1]
	ldr r5, _08061B0C @ =0x0000F7FF
	ands r5, r0
	movs r6, #0
	strb r6, [r1, #0x1c]
	strh r3, [r1, #0x16]
	mov r0, ip
	adds r0, #0x27
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r1, _08061B10 @ =0x0000FFDC
	mov r2, ip
	strh r1, [r2, #0xa]
	movs r0, #0x24
	strh r0, [r2, #0xc]
	strh r1, [r2, #0xe]
	strh r0, [r2, #0x10]
	strh r4, [r2, #0x14]
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r3, #0
	orrs r5, r0
	orrs r5, r6
	strh r5, [r2]
	ldr r0, _08061B14 @ =gIoRegisters
	ldrb r1, [r0, #0xa]
	movs r0, #3
	ands r0, r1
	mov r1, ip
	adds r1, #0x21
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x35
	strb r6, [r0]
	subs r0, #7
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldrh r2, [r2, #2]
	ldr r1, _08061B18 @ =gSamusData
	movs r3, #0x26
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	cmp r2, r0
	ble _08061B20
	ldr r0, _08061B1C @ =0x0000FBFF
	ands r5, r0
	mov r0, ip
	strh r5, [r0]
	b _08061B2C
	.align 2, 0
_08061B08: .4byte gCurrentSprite
_08061B0C: .4byte 0x0000F7FF
_08061B10: .4byte 0x0000FFDC
_08061B14: .4byte gIoRegisters
_08061B18: .4byte gSamusData
_08061B1C: .4byte 0x0000FBFF
_08061B20:
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r5, r0
	mov r2, ip
	strh r5, [r2]
_08061B2C:
	bl MakeSpriteFaceSamusDirection
_08061B30:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteFlyingInit
XParasiteFlyingInit: @ 0x08061B38
	push {lr}
	ldr r0, _08061B78 @ =gCurrentSprite
	mov ip, r0
	mov r1, ip
	adds r1, #0x24
	movs r2, #0
	movs r0, #0x5d
	strb r0, [r1]
	movs r3, #0
	adds r0, #0xcf
	mov r1, ip
	strh r0, [r1, #6]
	strh r2, [r1, #8]
	mov r0, ip
	adds r0, #0x2f
	strb r3, [r0]
	adds r0, #1
	movs r1, #1
	strb r1, [r0]
	subs r0, #2
	strb r3, [r0]
	adds r0, #3
	strb r1, [r0]
	mov r1, ip
	ldrb r0, [r1, #0x1d]
	cmp r0, #0x38
	beq _08061B72
	movs r0, #0x38
	strb r0, [r1, #0x1d]
_08061B72:
	pop {r0}
	bx r0
	.align 2, 0
_08061B78: .4byte gCurrentSprite

	thumb_func_start XParasiteIdleFloating
XParasiteIdleFloating: @ 0x08061B7C
	push {r4, r5, r6, r7, lr}
	ldr r2, _08061C20 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08061BDA
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r1, [r5]
	ldr r3, _08061C24 @ =0x083BE09A
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r6, #0
	ldrsh r0, [r0, r6]
	ldr r6, _08061C28 @ =0x00007FFF
	cmp r0, r6
	bne _08061BAC
	ldrh r2, [r3]
	movs r1, #0
_08061BAC:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #2]
	adds r0, r0, r2
	strh r0, [r4, #2]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r1, [r5]
	ldr r3, _08061C2C @ =0x083BE11C
	lsls r0, r1, #1
	adds r0, r0, r3
	ldrh r2, [r0]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r0, r6
	bne _08061BD0
	ldrh r2, [r3]
	movs r1, #0
_08061BD0:
	adds r0, r1, #1
	strb r0, [r5]
	ldrh r0, [r4, #4]
	adds r0, r0, r2
	strh r0, [r4, #4]
_08061BDA:
	adds r3, r4, #0
	ldrh r5, [r3]
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08061C7E
	ldrh r0, [r3, #6]
	subs r4, r0, #1
	strh r4, [r3, #6]
	lsls r0, r4, #0x10
	cmp r0, #0
	beq _08061C52
	ldr r2, _08061C30 @ =gWrittenToMosaic_H
	ldr r1, _08061C34 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x30
	beq _08061C16
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x16
	bls _08061C38
_08061C16:
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	b _08061C9E
	.align 2, 0
_08061C20: .4byte gCurrentSprite
_08061C24: .4byte 0x083BE09A
_08061C28: .4byte 0x00007FFF
_08061C2C: .4byte 0x083BE11C
_08061C30: .4byte gWrittenToMosaic_H
_08061C34: .4byte sXParasiteMosaicValues
_08061C38:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r5
	cmp r0, #0
	beq _08061C9E
	ldrb r0, [r3, #0x1d]
	cmp r0, #0x38
	beq _08061C4C
	movs r0, #0x38
	strb r0, [r3, #0x1d]
_08061C4C:
	bl XParasiteGettingAbsorbedInit
	b _08061C9E
_08061C52:
	ldr r0, _08061C74 @ =0x0000FFDF
	ands r0, r5
	strh r0, [r3]
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	cmp r0, #0x30
	bne _08061C78
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl XParasiteFlyingInit
	b _08061C9E
	.align 2, 0
_08061C74: .4byte 0x0000FFDF
_08061C78:
	movs r0, #0x3c
	strh r0, [r3, #6]
	b _08061C9E
_08061C7E:
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08061C8E
	bl XParasiteFlyingInit
_08061C8E:
	ldrh r1, [r4]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08061C9E
	bl XParasiteGettingAbsorbedInit
_08061C9E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start XParasiteFlying
XParasiteFlying: @ 0x08061CA4
	push {r4, r5, lr}
	ldr r2, _08061CE8 @ =gCurrentSprite
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r1, [r0]
	movs r0, #0xf0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0x30
	bne _08061D30
	adds r0, r2, #0
	adds r0, #0x26
	movs r5, #1
	strb r5, [r0]
	ldr r0, _08061CEC @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	bne _08061D00
	adds r3, r2, #0
	adds r3, #0x20
	ldrb r0, [r3]
	cmp r0, #0
	bne _08061CFE
	adds r0, r2, #0
	adds r0, #0x25
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _08061CF0
	movs r0, #3
	strb r0, [r3]
	b _08061D00
	.align 2, 0
_08061CE8: .4byte gCurrentSprite
_08061CEC: .4byte gFrameCounter8Bit
_08061CF0:
	cmp r0, #0x10
	bne _08061CFA
	movs r0, #2
	strb r0, [r3]
	b _08061D00
_08061CFA:
	strb r5, [r3]
	b _08061D00
_08061CFE:
	strb r1, [r3]
_08061D00:
	adds r1, r4, #0
	ldrh r0, [r1, #6]
	adds r2, r0, #0
	cmp r2, #0
	bne _08061D12
	adds r0, r1, #0
	adds r0, #0x20
	strb r2, [r0]
	b _08061D6C
_08061D12:
	subs r0, #1
	strh r0, [r4, #6]
	bl XParasiteFlyingMovement
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08061D7C
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #0x20
	strb r0, [r1]
	subs r1, #0xa
	movs r0, #0
	strb r0, [r1]
	b _08061D7C
_08061D30:
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08061D42
	bl XParasiteGettingAbsorbedInit
	b _08061D7C
_08061D42:
	adds r3, r2, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08061D64
	ldr r0, _08061D60 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	bne _08061D7C
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	b _08061D7C
	.align 2, 0
_08061D60: .4byte gCurrentPowerBomb
_08061D64:
	ldrh r0, [r2, #6]
	cmp r0, #0
	bne _08061D74
	adds r1, r2, #0
_08061D6C:
	adds r1, #0x24
	movs r0, #0x61
	strb r0, [r1]
	b _08061D7C
_08061D74:
	subs r0, #1
	strh r0, [r2, #6]
	bl XParasiteFlyingMovement
_08061D7C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteGettingAbsorbed
XParasiteGettingAbsorbed: @ 0x08061D84
	push {r4, lr}
	ldr r4, _08061DA0 @ =gCurrentSprite
	adds r1, r4, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	bl XParasiteStickToSamus
	ldrh r0, [r4, #0x12]
	cmp r0, #0x50
	bls _08061DA4
	subs r0, #8
	strh r0, [r4, #0x12]
	b _08061DA8
	.align 2, 0
_08061DA0: .4byte gCurrentSprite
_08061DA4:
	movs r0, #0
	strh r0, [r4]
_08061DA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start XParasiteFlyingMovement
XParasiteFlyingMovement: @ 0x08061DB0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	movs r0, #0
	str r0, [sp, #4]
	ldr r0, _08061E1C @ =gCurrentSprite
	ldrh r1, [r0, #2]
	str r1, [sp, #0xc]
	ldrh r6, [r0, #4]
	movs r5, #0
	mov ip, r0
	adds r1, #8
	str r1, [sp, #8]
_08061DD0:
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	ldr r4, _08061E20 @ =gSpriteData
	adds r3, r0, r4
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	mov sb, r2
	cmp r0, #0
	bne _08061DE8
	b _08061F34
_08061DE8:
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08061DF8
	b _08061F34
_08061DF8:
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	bne _08061E00
	b _08061F34
_08061E00:
	adds r0, r3, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	beq _08061E0C
	b _08061F34
_08061E0C:
	ldrh r4, [r3, #2]
	ldrh r2, [r3, #4]
	ldr r7, [sp, #0xc]
	cmp r7, r4
	bls _08061E24
	subs r0, r7, r4
	b _08061E28
	.align 2, 0
_08061E1C: .4byte gCurrentSprite
_08061E20: .4byte gSpriteData
_08061E24:
	ldr r1, [sp, #0xc]
	subs r0, r4, r1
_08061E28:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r6, r2
	bls _08061E34
	subs r0, r6, r2
	b _08061E36
_08061E34:
	subs r0, r2, r6
_08061E36:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	lsls r0, r5, #1
	ldr r7, _08061EF8 @ =gUnk_030007c0
	adds r0, r0, r7
	adds r1, r3, r1
	movs r3, #0
	mov sl, r3
	strh r1, [r0]
	movs r7, #1
	str r7, [sp, #4]
	movs r0, #0x24
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _08061E60
	movs r0, #0x96
	lsls r0, r0, #1
	mov r1, ip
	strh r0, [r1, #6]
_08061E60:
	mov r3, sb
	subs r0, r3, r5
	lsls r0, r0, #3
	ldr r7, _08061EFC @ =gSpriteData
	adds r3, r0, r7
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	adds r0, r4, r0
	ldr r7, [sp, #8]
	cmp r7, r0
	ble _08061F40
	ldr r0, [sp, #0xc]
	subs r0, #8
	mov sb, r0
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	adds r0, r4, r0
	cmp sb, r0
	bge _08061F40
	adds r1, r6, #0
	adds r1, #8
	movs r4, #0xe
	ldrsh r0, [r3, r4]
	adds r0, r2, r0
	cmp r1, r0
	ble _08061F40
	subs r1, #0x10
	movs r7, #0x10
	ldrsh r0, [r3, r7]
	adds r0, r2, r0
	cmp r1, r0
	bge _08061F40
	adds r1, r3, #0
	adds r1, #0x36
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08061F08
	subs r1, #0xc
	ldrb r0, [r1]
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _08061EC2
	movs r0, #0x20
	strb r0, [r1]
_08061EC2:
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x59
	strb r0, [r1]
	ldrh r0, [r3]
	ldr r2, _08061F00 @ =0x00008020
	adds r1, r2, #0
	orrs r0, r1
	mov r4, sl
	orrs r0, r4
	ldr r1, _08061F04 @ =0x0000DFFF
	ands r0, r1
	strh r0, [r3]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r2]
	ldrh r0, [r3, #4]
	mov r7, ip
	strh r0, [r7, #4]
	movs r0, #0x63
	mov r1, r8
	strb r0, [r1]
	b _08061F1E
	.align 2, 0
_08061EF8: .4byte gUnk_030007c0
_08061EFC: .4byte gSpriteData
_08061F00: .4byte 0x00008020
_08061F04: .4byte 0x0000DFFF
_08061F08:
	movs r0, #0x65
	mov r2, r8
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x2f
	strb r5, [r0]
	ldrh r0, [r3, #2]
	mov r4, ip
	strh r0, [r4, #6]
	ldrh r0, [r3, #4]
	strh r0, [r4, #8]
_08061F1E:
	movs r7, #2
	str r7, [sp, #4]
	mov r0, ip
	ldrh r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	orrs r0, r1
	mov r3, ip
	strh r0, [r3]
	b _08061F4C
_08061F34:
	lsls r0, r5, #1
	ldr r4, _08061F58 @ =gUnk_030007c0
	adds r0, r0, r4
	movs r1, #0x80
	lsls r1, r1, #8
	strh r1, [r0]
_08061F40:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bhi _08061F4C
	b _08061DD0
_08061F4C:
	ldr r7, [sp, #4]
	cmp r7, #2
	bne _08061F5C
	movs r0, #2
	b _0806202A
	.align 2, 0
_08061F58: .4byte gUnk_030007c0
_08061F5C:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _08061FCE
	ldr r0, _08061F84 @ =gXParasiteTargetYPosition
	ldrh r4, [r0]
	ldr r0, _08061F88 @ =gXParasiteTargetXPosition
	ldrh r2, [r0]
	mov r1, ip
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5d
	bne _08061FCA
	ldrh r0, [r1, #8]
	cmp r0, #1
	beq _08061F8C
	cmp r0, #3
	beq _08061FA6
	b _08061FCA
	.align 2, 0
_08061F84: .4byte gXParasiteTargetYPosition
_08061F88: .4byte gXParasiteTargetXPosition
_08061F8C:
	adds r0, r4, #0
	subs r0, #0x40
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r1, [r1]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08061FC2
	adds r0, r2, #0
	subs r0, #0x40
	b _08061FC6
_08061FA6:
	adds r0, r4, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r3, ip
	ldrh r1, [r3]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08061FC2
	adds r0, r2, #0
	subs r0, #0x40
	b _08061FC6
_08061FC2:
	adds r0, r2, #0
	adds r0, #0x40
_08061FC6:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08061FCA:
	movs r3, #0x1c
	b _0806201A
_08061FCE:
	movs r2, #1
	movs r5, #0
	ldr r3, _0806203C @ =gUnk_030007c0
_08061FD4:
	lsls r0, r2, #1
	adds r0, r0, r3
	lsls r1, r5, #1
	adds r1, r1, r3
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bls _08061FE6
	adds r2, r5, #0
_08061FE6:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x17
	bls _08061FD4
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	ldr r4, _08062040 @ =gSpriteData
	adds r1, r1, r4
	ldrh r2, [r1, #0xa]
	ldrh r7, [r1, #2]
	adds r2, r2, r7
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	movs r4, #0xa
	ldrsh r3, [r1, r4]
	subs r0, r0, r3
	lsrs r3, r0, #0x1f
	adds r0, r0, r3
	asrs r0, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	ldrh r2, [r1, #4]
	movs r3, #0x14
_0806201A:
	movs r5, #1
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x14
	bl XParasiteMove
	ldr r0, [sp, #4]
_0806202A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806203C: .4byte gUnk_030007c0
_08062040: .4byte gSpriteData

	thumb_func_start XParasiteFlyingAway
XParasiteFlyingAway: @ 0x08062044
	push {lr}
	ldr r2, _0806205C @ =gCurrentSprite
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08062060
	bl XParasiteGettingAbsorbedInit
	b _080620E8
	.align 2, 0
_0806205C: .4byte gCurrentSprite
_08062060:
	adds r3, r2, #0
	adds r3, #0x2c
	ldrb r1, [r3]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08062084
	ldr r0, _08062080 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	bne _080620E8
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r3]
	b _080620E8
	.align 2, 0
_08062080: .4byte gCurrentPowerBomb
_08062084:
	adds r1, r2, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _08062092
	adds r0, #1
	strb r0, [r1]
_08062092:
	ldrb r0, [r1]
	lsrs r3, r0, #3
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080620A8
	ldrh r0, [r2, #4]
	adds r0, r0, r3
	b _080620AC
_080620A8:
	ldrh r0, [r2, #4]
	subs r0, r0, r3
_080620AC:
	strh r0, [r2, #4]
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #0xc7
	bhi _080620BC
	adds r0, #1
	strb r0, [r1]
_080620BC:
	ldrb r0, [r1]
	lsrs r3, r0, #3
	ldrh r1, [r2]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _080620D2
	ldrh r0, [r2, #2]
	adds r0, r0, r3
	b _080620D6
_080620D2:
	ldrh r0, [r2, #2]
	subs r0, r0, r3
_080620D6:
	strh r0, [r2, #2]
	ldrh r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080620E8
	strh r0, [r2]
_080620E8:
	pop {r0}
	bx r0

	thumb_func_start unk_620ec
unk_620ec: @ 0x080620EC
	push {lr}
	ldr r2, _08062124 @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	ldr r1, _08062128 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x66
	strb r0, [r1]
	adds r1, #0xa
	movs r0, #0x2c
	strb r0, [r1]
	movs r0, #0x96
	lsls r0, r0, #1
	strh r0, [r2, #0x12]
	adds r0, #0x17
	bl CheckPlayNotAlreadyPlayingSound
	pop {r0}
	bx r0
	.align 2, 0
_08062124: .4byte gCurrentSprite
_08062128: .4byte 0x0000FFFB

	thumb_func_start unk_6212c
unk_6212c: @ 0x0806212C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r4, _08062164 @ =gCurrentSprite
	ldrh r0, [r4, #0x12]
	subs r0, #1
	strh r0, [r4, #0x12]
	adds r0, r4, #0
	adds r0, #0x26
	movs r1, #1
	mov r8, r1
	mov r1, r8
	strb r1, [r0]
	adds r0, #9
	ldrb r6, [r0]
	ldr r1, _08062168 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r7, r0, r1
	adds r5, r7, #0
	adds r5, #0x36
	ldrb r0, [r5]
	cmp r0, #0
	bne _0806216C
	strh r0, [r4]
	b _08062242
	.align 2, 0
_08062164: .4byte gCurrentSprite
_08062168: .4byte gSpriteData
_0806216C:
	bl unk_61004
	cmp r0, #0
	beq _0806217A
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	bne _080621A0
_0806217A:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r1, r4, #0
	adds r1, #0x24
	movs r0, #0x61
	strb r0, [r1]
	ldrh r1, [r4]
	ldr r0, _08062198 @ =0x0000FFDB
	ands r0, r1
	ldr r1, _0806219C @ =0x00007FFF
	ands r0, r1
	strh r0, [r4]
	b _08062242
	.align 2, 0
_08062198: .4byte 0x0000FFDB
_0806219C: .4byte 0x00007FFF
_080621A0:
	adds r3, r4, #0
	adds r3, #0x2e
	ldrb r1, [r3]
	mov r0, r8
	ands r0, r1
	cmp r0, #0
	bne _080621B6
	ldrh r0, [r4]
	movs r1, #4
	eors r0, r1
	strh r0, [r4]
_080621B6:
	ldrb r0, [r3]
	subs r0, #1
	strb r0, [r3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080621C6
	movs r0, #0x2c
	strb r0, [r3]
_080621C6:
	ldr r2, _080621E8 @ =gWrittenToMosaic_H
	ldr r1, _080621EC @ =sXParasiteMosaicValues
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	ldrh r1, [r7, #2]
	ldrh r0, [r4, #6]
	cmp r1, r0
	bls _080621F0
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	b _080621FA
	.align 2, 0
_080621E8: .4byte gWrittenToMosaic_H
_080621EC: .4byte sXParasiteMosaicValues
_080621F0:
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r4, #2]
	subs r0, r0, r1
_080621FA:
	strh r0, [r4, #2]
	ldr r2, _08062220 @ =gSpriteData
	lsls r3, r6, #3
	subs r0, r3, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, _08062224 @ =gCurrentSprite
	ldrh r4, [r0, #4]
	ldrh r0, [r1, #8]
	adds r5, r1, #0
	cmp r4, r0
	bls _08062228
	subs r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r5, #4]
	adds r0, r0, r1
	b _08062232
	.align 2, 0
_08062220: .4byte gSpriteData
_08062224: .4byte gCurrentSprite
_08062228:
	subs r0, r0, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldrh r0, [r5, #4]
	subs r0, r0, r1
_08062232:
	strh r0, [r5, #4]
	subs r0, r3, r6
	lsls r0, r0, #3
	adds r0, r0, r2
	ldrh r1, [r0, #2]
	strh r1, [r5, #6]
	ldrh r0, [r0, #4]
	strh r0, [r5, #8]
_08062242:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_6224c
unk_6224c: @ 0x0806224C
	push {lr}
	ldr r2, _0806227C @ =gCurrentSprite
	adds r1, r2, #0
	adds r1, #0x20
	movs r0, #0
	strb r0, [r1]
	ldrh r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	ldr r1, _08062280 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r2]
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x64
	strb r0, [r1]
	movs r0, #0x2c
	strh r0, [r2, #6]
	ldr r0, _08062284 @ =0x00000143
	bl CheckPlayNotAlreadyPlayingSound
	pop {r0}
	bx r0
	.align 2, 0
_0806227C: .4byte gCurrentSprite
_08062280: .4byte 0x0000FFFB
_08062284: .4byte 0x00000143

	thumb_func_start unk_62288
unk_62288: @ 0x08062288
	push {lr}
	ldr r3, _080622C8 @ =gCurrentSprite
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #1
	strb r0, [r1]
	ldrh r1, [r3, #6]
	ands r0, r1
	cmp r0, #0
	bne _080622A4
	ldrh r0, [r3]
	movs r1, #4
	eors r0, r1
	strh r0, [r3]
_080622A4:
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0
	bne _080622B4
	strh r0, [r3]
_080622B4:
	ldr r2, _080622CC @ =gWrittenToMosaic_H
	ldr r1, _080622D0 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080622C8: .4byte gCurrentSprite
_080622CC: .4byte gWrittenToMosaic_H
_080622D0: .4byte sXParasiteMosaicValues

	thumb_func_start SpriteSpawningFromX
SpriteSpawningFromX: @ 0x080622D4
	push {lr}
	ldr r3, _080622FC @ =gCurrentSprite
	adds r0, r3, #0
	adds r0, #0x26
	movs r2, #1
	strb r2, [r0]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08062308
	ldr r2, _08062300 @ =gWrittenToMosaic_H
	ldr r1, _08062304 @ =sXParasiteMosaicValues
	ldrh r0, [r3, #6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2]
	b _0806231A
	.align 2, 0
_080622FC: .4byte gCurrentSprite
_08062300: .4byte gWrittenToMosaic_H
_08062304: .4byte sXParasiteMosaicValues
_08062308:
	ldrh r1, [r3]
	ldr r0, _08062320 @ =0x00007FFF
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x24
	strb r2, [r1]
	ldr r1, _08062324 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r3]
_0806231A:
	pop {r0}
	bx r0
	.align 2, 0
_08062320: .4byte 0x00007FFF
_08062324: .4byte 0x0000FFDF

	thumb_func_start unk_62328
unk_62328: @ 0x08062328
	push {r4, r5, lr}
	ldr r1, _08062368 @ =gCurrentSprite
	ldrh r4, [r1]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r4
	adds r3, r1, #0
	cmp r0, #0
	beq _08062390
	adds r2, r3, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _08062370
	ldrh r1, [r3, #4]
	ldr r0, _0806236C @ =gSamusData
	ldrh r0, [r0, #0x16]
	subs r0, #4
	cmp r1, r0
	bgt _080623A6
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #9
	bhi _08062360
	adds r0, #1
	strb r0, [r1]
_08062360:
	ldrh r0, [r3, #4]
	ldrb r1, [r1]
	b _0806237E
	.align 2, 0
_08062368: .4byte gCurrentSprite
_0806236C: .4byte gSamusData
_08062370:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08062384
	lsrs r0, r0, #0x19
	ldrh r1, [r3, #4]
_0806237E:
	adds r0, r0, r1
	strh r0, [r3, #4]
	b _080623EA
_08062384:
	ldr r0, _0806238C @ =0x0000FDFF
	ands r0, r4
	b _080623E0
	.align 2, 0
_0806238C: .4byte 0x0000FDFF
_08062390:
	adds r2, r3, #0
	adds r2, #0x2f
	ldrb r0, [r2]
	cmp r0, #0
	bne _080623C6
	ldrh r1, [r3, #4]
	ldr r0, _080623B0 @ =gSamusData
	ldrh r0, [r0, #0x16]
	adds r0, #4
	cmp r1, r0
	bge _080623B4
_080623A6:
	adds r0, r3, #0
	adds r0, #0x30
	ldrb r0, [r0]
	strb r0, [r2]
	b _080623EA
	.align 2, 0
_080623B0: .4byte gSamusData
_080623B4:
	adds r1, r3, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #9
	bhi _080623C2
	adds r0, #1
	strb r0, [r1]
_080623C2:
	ldrb r1, [r1]
	b _080623D4
_080623C6:
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _080623DC
	adds r1, r0, #0
	lsrs r1, r1, #0x19
_080623D4:
	ldrh r0, [r3, #4]
	subs r0, r0, r1
	strh r0, [r3, #4]
	b _080623EA
_080623DC:
	adds r0, r5, #0
	orrs r0, r4
_080623E0:
	strh r0, [r3]
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #1
	strb r0, [r1]
_080623EA:
	adds r2, r3, #0
	ldrh r4, [r2]
	movs r5, #0x80
	lsls r5, r5, #3
	adds r0, r5, #0
	ands r0, r4
	cmp r0, #0
	beq _08062454
	adds r3, #0x2e
	ldrb r0, [r3]
	cmp r0, #0
	bne _08062430
	ldrh r1, [r2, #2]
	ldr r0, _08062418 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x4c
	cmp r1, r0
	ble _0806241C
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	strb r0, [r3]
	b _080624B6
	.align 2, 0
_08062418: .4byte gSamusData
_0806241C:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0806242A
	adds r0, #1
	strb r0, [r1]
_0806242A:
	ldrh r0, [r2, #2]
	ldrb r1, [r1]
	b _0806243E
_08062430:
	subs r1, r0, #1
	strb r1, [r3]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08062444
	lsrs r0, r0, #0x19
	ldrh r1, [r2, #2]
_0806243E:
	adds r0, r0, r1
	strh r0, [r2, #2]
	b _080624B6
_08062444:
	ldr r0, _08062450 @ =0x0000FBFF
	ands r0, r4
	strh r0, [r2]
	adds r1, r2, #0
	b _080624B0
	.align 2, 0
_08062450: .4byte 0x0000FBFF
_08062454:
	movs r0, #0x2e
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806248E
	ldrh r1, [r2, #2]
	ldr r0, _08062478 @ =gSamusData
	ldrh r0, [r0, #0x18]
	subs r0, #0x44
	cmp r1, r0
	bge _0806247C
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	mov r1, ip
	b _080624B4
	.align 2, 0
_08062478: .4byte gSamusData
_0806247C:
	adds r1, r2, #0
	adds r1, #0x31
	ldrb r0, [r1]
	cmp r0, #9
	bhi _0806248A
	adds r0, #1
	strb r0, [r1]
_0806248A:
	ldrb r1, [r1]
	b _0806249E
_0806248E:
	subs r1, r0, #1
	mov r0, ip
	strb r1, [r0]
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _080624A6
	adds r1, r0, #0
	lsrs r1, r1, #0x19
_0806249E:
	ldrh r0, [r2, #2]
	subs r0, r0, r1
	strh r0, [r2, #2]
	b _080624B6
_080624A6:
	ldrh r1, [r3]
	adds r0, r5, #0
	orrs r0, r1
	strh r0, [r3]
	adds r1, r3, #0
_080624B0:
	adds r1, #0x31
	movs r0, #1
_080624B4:
	strb r0, [r1]
_080624B6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start XParasiteStickToSamus
XParasiteStickToSamus: @ 0x080624BC
	push {r4, lr}
	ldr r2, _080624E0 @ =gCurrentSprite
	movs r0, #0x80
	lsls r0, r0, #2
	adds r1, r0, #0
	ldrh r3, [r2, #4]
	adds r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080624E4 @ =gSamusData
	ldrh r0, [r0, #0x16]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r4, r1
	bls _080624E8
	subs r0, r4, r1
	b _080624EA
	.align 2, 0
_080624E0: .4byte gCurrentSprite
_080624E4: .4byte gSamusData
_080624E8:
	subs r0, r1, r4
_080624EA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _080624F6
	movs r3, #0
	b _080624FC
_080624F6:
	subs r0, #8
	lsls r0, r0, #0xf
	lsrs r3, r0, #0x10
_080624FC:
	cmp r4, r1
	bls _08062506
	ldrh r0, [r2, #4]
	subs r0, r0, r3
	b _0806250E
_08062506:
	cmp r4, r1
	bhs _08062510
	ldrh r0, [r2, #4]
	adds r0, r3, r0
_0806250E:
	strh r0, [r2, #4]
_08062510:
	movs r1, #0x80
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r2, #2]
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	bl SamusCheckMorphed
	cmp r0, #0
	beq _08062534
	ldr r1, _08062530 @ =gSamusData
	movs r2, #0xe8
	lsls r2, r2, #1
	adds r0, r2, #0
	b _0806253C
	.align 2, 0
_08062530: .4byte gSamusData
_08062534:
	ldr r1, _0806254C @ =gSamusData
	movs r3, #0xd9
	lsls r3, r3, #1
	adds r0, r3, #0
_0806253C:
	ldrh r1, [r1, #0x18]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r4, r1
	bls _08062550
	subs r0, r4, r1
	b _08062552
	.align 2, 0
_0806254C: .4byte gSamusData
_08062550:
	subs r0, r1, r4
_08062552:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bhi _0806255E
	movs r3, #0
	b _08062564
_0806255E:
	subs r0, #8
	lsls r0, r0, #0xf
	lsrs r3, r0, #0x10
_08062564:
	cmp r4, r1
	bls _08062574
	ldr r1, _08062570 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	subs r0, r0, r3
	b _0806257E
	.align 2, 0
_08062570: .4byte gCurrentSprite
_08062574:
	cmp r4, r1
	bhs _08062580
	ldr r1, _08062588 @ =gCurrentSprite
	ldrh r0, [r1, #2]
	adds r0, r3, r0
_0806257E:
	strh r0, [r1, #2]
_08062580:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08062588: .4byte gCurrentSprite

	thumb_func_start ScreenShakeStartVertical
ScreenShakeStartVertical: @ 0x0806258C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, _080625B8 @ =0x030000F0
	cmp r2, #0
	beq _080625B0
	ldrb r0, [r3]
	cmp r2, r0
	bls _080625B0
	movs r1, #0
	strb r2, [r3]
	strb r1, [r3, #1]
	strb r4, [r3, #2]
	strb r1, [r3, #3]
	ldr r0, _080625BC @ =0x0300004F
	strb r1, [r0]
_080625B0:
	ldrb r0, [r3]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080625B8: .4byte 0x030000F0
_080625BC: .4byte 0x0300004F

	thumb_func_start ScreenShakeStartHorizontal
ScreenShakeStartHorizontal: @ 0x080625C0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	ldr r3, _080625EC @ =0x030000F4
	cmp r2, #0
	beq _080625E4
	ldrb r0, [r3]
	cmp r2, r0
	bls _080625E4
	movs r1, #0
	strb r2, [r3]
	strb r1, [r3, #1]
	strb r4, [r3, #2]
	strb r1, [r3, #3]
	ldr r0, _080625F0 @ =0x0300004E
	strb r1, [r0]
_080625E4:
	ldrb r0, [r3]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080625EC: .4byte 0x030000F4
_080625F0: .4byte 0x0300004E

	thumb_func_start ScreenShakeStartHorizontal_Unused
ScreenShakeStartHorizontal_Unused: @ 0x080625F4
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r3, _0806261C @ =0x030000F4
	cmp r2, #0
	beq _08062614
	ldrb r0, [r3]
	cmp r2, r0
	bls _08062614
	movs r1, #0
	strb r2, [r3]
	strb r1, [r3, #1]
	strb r1, [r3, #2]
	strb r1, [r3, #3]
	ldr r0, _08062620 @ =0x0300004E
	strb r1, [r0]
_08062614:
	ldrb r0, [r3]
	pop {r1}
	bx r1
	.align 2, 0
_0806261C: .4byte 0x030000F4
_08062620: .4byte 0x0300004E

	thumb_func_start ScreenShakeUpdateVertical
ScreenShakeUpdateVertical: @ 0x08062624
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _0806263C @ =0x0300004F
	strb r2, [r6]
	ldr r4, _08062640 @ =0x030000F0
	ldrb r0, [r4]
	adds r3, r4, #0
	cmp r0, #0
	bne _08062644
	movs r0, #0
	b _08062686
	.align 2, 0
_0806263C: .4byte 0x0300004F
_08062640: .4byte 0x030000F0
_08062644:
	subs r5, r0, #1
	strb r5, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #1
	bhi _08062656
	adds r0, #1
	strb r0, [r3, #1]
	movs r0, #0
	b _08062686
_08062656:
	strb r2, [r3, #1]
	ldrb r0, [r3, #2]
	movs r1, #0x7f
	ands r1, r0
	movs r2, #2
	rsbs r2, r2, #0
	ldrb r3, [r3, #3]
	cmp r3, #0
	beq _08062672
	movs r2, #2
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	ands r2, r0
_08062672:
	movs r0, #1
	eors r0, r3
	strb r0, [r4, #3]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _08062682
	asrs r2, r2, #1
_08062682:
	strb r2, [r6]
	adds r0, r2, #0
_08062686:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start ScreenShakeUpdateHorizontal
ScreenShakeUpdateHorizontal: @ 0x0806268C
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _080626A4 @ =0x0300004E
	strb r2, [r6]
	ldr r4, _080626A8 @ =0x030000F4
	ldrb r0, [r4]
	adds r3, r4, #0
	cmp r0, #0
	bne _080626AC
	movs r0, #0
	b _080626EE
	.align 2, 0
_080626A4: .4byte 0x0300004E
_080626A8: .4byte 0x030000F4
_080626AC:
	subs r5, r0, #1
	strb r5, [r3]
	ldrb r0, [r3, #1]
	cmp r0, #1
	bhi _080626BE
	adds r0, #1
	strb r0, [r3, #1]
	movs r0, #0
	b _080626EE
_080626BE:
	strb r2, [r3, #1]
	ldrb r0, [r3, #2]
	movs r1, #0x7f
	ands r1, r0
	movs r2, #2
	rsbs r2, r2, #0
	ldrb r3, [r3, #3]
	cmp r3, #0
	beq _080626DA
	movs r2, #2
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	ands r2, r0
_080626DA:
	movs r0, #1
	eors r0, r3
	strb r0, [r4, #3]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bhi _080626EA
	asrs r2, r2, #1
_080626EA:
	strb r2, [r6]
	adds r0, r2, #0
_080626EE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start TransparencySetRoomEffectsTransparency
TransparencySetRoomEffectsTransparency: @ 0x080626F4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, _08062768 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08062784
	ldr r0, _0806276C @ =gCurrentEventBasedEffectCopy
	ldrb r0, [r0]
	cmp r0, #0
	bne _08062726
	bl unk_62cb4
	adds r3, r0, #0
	cmp r3, #0
	beq _08062726
	ldr r2, _08062770 @ =gIoRegisters
	ldrh r1, [r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r0, r4, #0
	orrs r0, r1
	ands r0, r3
	strh r0, [r2]
_08062726:
	ldr r1, _08062774 @ =0x0400000A
	ldr r3, _08062770 @ =gIoRegisters
	ldrh r0, [r3, #0xa]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r3, #0xc]
	strh r0, [r1]
	adds r1, #0x3e
	ldrb r0, [r3, #7]
	strb r0, [r1]
	subs r1, #1
	ldrb r0, [r3, #6]
	strb r0, [r1]
	ldr r4, _08062778 @ =0x04000042
	ldr r2, _0806277C @ =gWindow1Border
	ldrb r1, [r2]
	lsls r1, r1, #8
	ldrb r0, [r2, #1]
	orrs r0, r1
	strh r0, [r4]
	adds r4, #4
	ldrb r1, [r2, #2]
	lsls r1, r1, #8
	ldrb r0, [r2, #3]
	orrs r0, r1
	strh r0, [r4]
	ldr r2, _08062780 @ =0x04000052
	ldrb r1, [r3, #5]
	lsls r1, r1, #8
	ldrb r0, [r3, #4]
	orrs r0, r1
	strh r0, [r2]
	b _08062C6A
	.align 2, 0
_08062768: .4byte gPauseScreenFlag
_0806276C: .4byte gCurrentEventBasedEffectCopy
_08062770: .4byte gIoRegisters
_08062774: .4byte 0x0400000A
_08062778: .4byte 0x04000042
_0806277C: .4byte gWindow1Border
_08062780: .4byte 0x04000052
_08062784:
	ldr r2, _080627B4 @ =gSamusOnTopOfBackgrounds
	movs r1, #0
	mov r0, sp
	adds r0, #6
_0806278C:
	strh r1, [r0]
	subs r0, #2
	cmp r0, sp
	bge _0806278C
	movs r0, #0
	strb r0, [r2]
	ldr r2, _080627B8 @ =gCurrentRoomEntry
	ldrb r1, [r2, #1]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080627BC
	ldrb r0, [r2, #0x18]
	bl unk_62c88
	mov r2, sp
	movs r1, #8
	orrs r0, r1
	strh r0, [r2]
	b _080627C2
	.align 2, 0
_080627B4: .4byte gSamusOnTopOfBackgrounds
_080627B8: .4byte gCurrentRoomEntry
_080627BC:
	mov r1, sp
	ldr r0, _08062804 @ =0x00004004
	strh r0, [r1]
_080627C2:
	mov r1, sp
	ldr r0, _08062808 @ =0x00004204
	strh r0, [r1, #2]
	ldr r0, _0806280C @ =0x00004404
	strh r0, [r1, #4]
	mov r0, sp
	ldr r3, _08062810 @ =0x00000603
	strh r3, [r0, #6]
	ldr r0, _08062814 @ =gCurrentRoomEntry
	ldrb r0, [r0, #4]
	mov r2, sp
	movs r1, #8
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2, #6]
	ldr r4, _08062814 @ =gCurrentRoomEntry
	ldrb r0, [r4, #0x19]
	bl unk_62c88
	mov r2, sp
	mov r1, sp
	ldrh r1, [r1, #6]
	orrs r0, r1
	strh r0, [r2, #6]
	ldrb r0, [r4, #7]
	cmp r0, #0x33
	bhi _080628EC
	lsls r0, r0, #2
	ldr r1, _08062818 @ =_0806281C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08062804: .4byte 0x00004004
_08062808: .4byte 0x00004204
_0806280C: .4byte 0x00004404
_08062810: .4byte 0x00000603
_08062814: .4byte gCurrentRoomEntry
_08062818: .4byte _0806281C
_0806281C: @ jump table
	.4byte _080628EC @ case 0
	.4byte _080628EC @ case 1
	.4byte _080628EC @ case 2
	.4byte _080628EC @ case 3
	.4byte _080628EC @ case 4
	.4byte _08062902 @ case 5
	.4byte _08062922 @ case 6
	.4byte _0806294C @ case 7
	.4byte _080628EC @ case 8
	.4byte _08062902 @ case 9
	.4byte _08062922 @ case 10
	.4byte _0806294C @ case 11
	.4byte _080628EC @ case 12
	.4byte _08062902 @ case 13
	.4byte _08062922 @ case 14
	.4byte _0806294C @ case 15
	.4byte _080628EC @ case 16
	.4byte _08062902 @ case 17
	.4byte _08062922 @ case 18
	.4byte _0806294C @ case 19
	.4byte _080628EC @ case 20
	.4byte _08062902 @ case 21
	.4byte _08062922 @ case 22
	.4byte _0806294C @ case 23
	.4byte _080628EC @ case 24
	.4byte _08062902 @ case 25
	.4byte _08062922 @ case 26
	.4byte _0806294C @ case 27
	.4byte _080628EC @ case 28
	.4byte _08062902 @ case 29
	.4byte _08062922 @ case 30
	.4byte _0806294C @ case 31
	.4byte _080628EC @ case 32
	.4byte _08062902 @ case 33
	.4byte _08062922 @ case 34
	.4byte _0806294C @ case 35
	.4byte _080628EC @ case 36
	.4byte _08062902 @ case 37
	.4byte _08062922 @ case 38
	.4byte _0806294C @ case 39
	.4byte _080628EC @ case 40
	.4byte _08062902 @ case 41
	.4byte _08062922 @ case 42
	.4byte _0806294C @ case 43
	.4byte _080628EC @ case 44
	.4byte _08062902 @ case 45
	.4byte _08062922 @ case 46
	.4byte _0806294C @ case 47
	.4byte _080628EC @ case 48
	.4byte _08062902 @ case 49
	.4byte _08062922 @ case 50
	.4byte _0806294C @ case 51
_080628EC:
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r1]
	mov r2, sp
	mov r0, sp
	ldrh r0, [r0, #2]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2, #2]
	b _08062916
_08062902:
	mov r2, sp
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #1
	orrs r0, r1
	strh r0, [r2]
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
_08062916:
	mov r0, sp
	ldrh r1, [r0, #4]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2, #4]
	b _0806296E
_08062922:
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0]
	movs r3, #1
	orrs r0, r3
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	mov r2, sp
	mov r0, sp
	ldrh r1, [r0, #4]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2, #4]
	ldr r0, _08062948 @ =gSamusOnTopOfBackgrounds
	strb r3, [r0]
	b _0806296E
	.align 2, 0
_08062948: .4byte gSamusOnTopOfBackgrounds
_0806294C:
	mov r2, sp
	mov r0, sp
	ldrh r1, [r0]
	movs r0, #2
	orrs r0, r1
	strh r0, [r2]
	mov r1, sp
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r1, #2]
	mov r0, sp
	ldrh r0, [r0, #4]
	movs r1, #1
	orrs r0, r1
	strh r0, [r2, #4]
	ldr r0, _08062988 @ =gSamusOnTopOfBackgrounds
	strb r1, [r0]
_0806296E:
	movs r2, #0
	movs r3, #0
	ldr r1, _0806298C @ =gCurrentRoomEntry
	ldrb r0, [r1, #7]
	subs r0, #8
	mov ip, r1
	cmp r0, #0x2b
	bhi _08062A6E
	lsls r0, r0, #2
	ldr r1, _08062990 @ =_08062994
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08062988: .4byte gSamusOnTopOfBackgrounds
_0806298C: .4byte gCurrentRoomEntry
_08062990: .4byte _08062994
_08062994: @ jump table
	.4byte _08062A60 @ case 0
	.4byte _08062A60 @ case 1
	.4byte _08062A60 @ case 2
	.4byte _08062A60 @ case 3
	.4byte _08062A64 @ case 4
	.4byte _08062A64 @ case 5
	.4byte _08062A64 @ case 6
	.4byte _08062A64 @ case 7
	.4byte _08062A68 @ case 8
	.4byte _08062A68 @ case 9
	.4byte _08062A68 @ case 10
	.4byte _08062A68 @ case 11
	.4byte _08062A6C @ case 12
	.4byte _08062A6C @ case 13
	.4byte _08062A6C @ case 14
	.4byte _08062A6C @ case 15
	.4byte _08062A44 @ case 16
	.4byte _08062A44 @ case 17
	.4byte _08062A44 @ case 18
	.4byte _08062A44 @ case 19
	.4byte _08062A48 @ case 20
	.4byte _08062A48 @ case 21
	.4byte _08062A48 @ case 22
	.4byte _08062A48 @ case 23
	.4byte _08062A4C @ case 24
	.4byte _08062A4C @ case 25
	.4byte _08062A4C @ case 26
	.4byte _08062A4C @ case 27
	.4byte _08062A50 @ case 28
	.4byte _08062A50 @ case 29
	.4byte _08062A50 @ case 30
	.4byte _08062A50 @ case 31
	.4byte _08062A54 @ case 32
	.4byte _08062A54 @ case 33
	.4byte _08062A54 @ case 34
	.4byte _08062A54 @ case 35
	.4byte _08062A58 @ case 36
	.4byte _08062A58 @ case 37
	.4byte _08062A58 @ case 38
	.4byte _08062A58 @ case 39
	.4byte _08062A5C @ case 40
	.4byte _08062A5C @ case 41
	.4byte _08062A5C @ case 42
	.4byte _08062A5C @ case 43
_08062A44:
	movs r3, #0
	b _08062A6E
_08062A48:
	movs r3, #3
	b _08062A6E
_08062A4C:
	movs r3, #6
	b _08062A6E
_08062A50:
	movs r3, #9
	b _08062A6E
_08062A54:
	movs r3, #0xb
	b _08062A6E
_08062A58:
	movs r3, #0xd
	b _08062A6E
_08062A5C:
	movs r3, #0x10
	b _08062A6E
_08062A60:
	movs r2, #7
	b _08062A8C
_08062A64:
	movs r2, #0xa
	b _08062A8C
_08062A68:
	movs r2, #0xd
	b _08062A8C
_08062A6C:
	movs r2, #0x10
_08062A6E:
	cmp r2, #0
	bne _08062A8C
	ldr r0, _08062A84 @ =gIoRegisters
	strb r3, [r0, #5]
	movs r1, #0x10
	subs r1, r1, r3
	strb r1, [r0, #4]
	ldr r1, _08062A88 @ =0x03004FBC
	strb r2, [r1]
	adds r7, r0, #0
	b _08062A9E
	.align 2, 0
_08062A84: .4byte gIoRegisters
_08062A88: .4byte 0x03004FBC
_08062A8C:
	ldr r1, _08062AFC @ =gIoRegisters
	movs r0, #0x10
	strb r0, [r1, #5]
	strb r2, [r1, #4]
	ldr r2, _08062B00 @ =0x03004FBC
	movs r0, #1
	strb r0, [r2]
	adds r7, r1, #0
	adds r1, r2, #0
_08062A9E:
	ldrb r0, [r7, #5]
	movs r3, #0
	strb r0, [r1, #1]
	ldrb r0, [r7, #4]
	strb r0, [r1, #2]
	ldr r2, _08062B04 @ =0x04000052
	ldrb r1, [r7, #5]
	lsls r1, r1, #8
	ldrb r0, [r7, #4]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _08062B08 @ =gWrittenToBldalpha
	movs r5, #0
	strh r3, [r0]
	ldr r1, _08062B0C @ =0x03004E44
	strb r5, [r1]
	strb r5, [r1, #1]
	mov r2, ip
	ldrb r0, [r2, #1]
	cmp r0, #0x12
	bne _08062ACC
	movs r0, #1
	strb r0, [r1]
_08062ACC:
	ldr r0, _08062B10 @ =gColorFading
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _08062B5E
	ldr r2, _08062B14 @ =gWindow1Border
	ldr r3, _08062B18 @ =gSamusData
	ldrh r0, [r3, #0x16]
	ldr r6, _08062B1C @ =gBg1XPosition
	ldrh r1, [r6]
	subs r0, r0, r1
	asrs r0, r0, #2
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r2, #0
	cmp r0, #0xf0
	bls _08062B24
	ldrh r0, [r3, #0x16]
	ldrh r6, [r6]
	cmp r0, r6
	bhs _08062B20
	strb r5, [r4]
	b _08062B24
	.align 2, 0
_08062AFC: .4byte gIoRegisters
_08062B00: .4byte 0x03004FBC
_08062B04: .4byte 0x04000052
_08062B08: .4byte gWrittenToBldalpha
_08062B0C: .4byte 0x03004E44
_08062B10: .4byte gColorFading
_08062B14: .4byte gWindow1Border
_08062B18: .4byte gSamusData
_08062B1C: .4byte gBg1XPosition
_08062B20:
	movs r0, #0xf0
	strb r0, [r4]
_08062B24:
	ldrh r1, [r3, #0x18]
	ldr r2, _08062B48 @ =gBg1YPosition
	ldrh r0, [r2]
	adds r0, #0x3f
	subs r1, r1, r0
	asrs r1, r1, #2
	strb r1, [r4, #2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0xa0
	bls _08062B50
	ldrh r0, [r3, #0x18]
	subs r0, #0x3f
	ldrh r2, [r2]
	cmp r0, r2
	bge _08062B4C
	movs r0, #0
	b _08062B4E
	.align 2, 0
_08062B48: .4byte gBg1YPosition
_08062B4C:
	movs r0, #0xa0
_08062B4E:
	strb r0, [r4, #2]
_08062B50:
	ldrb r0, [r4]
	movs r1, #0
	strb r0, [r4, #1]
	ldrb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r1, [r4, #4]
	b _08062B70
_08062B5E:
	ldr r0, _08062BE0 @ =gWindow1Border
	strb r5, [r0]
	movs r1, #0xf0
	strb r1, [r0, #1]
	strb r5, [r0, #2]
	movs r1, #0xa0
	strb r1, [r0, #3]
	strb r5, [r0, #4]
	adds r4, r0, #0
_08062B70:
	ldr r1, _08062BE4 @ =0x04000048
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08062BE8 @ =0x04000040
	movs r3, #0
	strh r3, [r0]
	adds r0, #4
	strh r3, [r0]
	movs r2, #0x3f
	strb r2, [r7, #6]
	movs r1, #0x20
	strb r1, [r7, #7]
	adds r0, #6
	strb r1, [r0]
	subs r0, #1
	strb r2, [r0]
	ldr r2, _08062BEC @ =0x04000042
	ldrb r1, [r4]
	lsls r1, r1, #8
	ldrb r0, [r4, #1]
	orrs r0, r1
	strh r0, [r2]
	adds r2, #4
	ldrb r1, [r4, #2]
	lsls r1, r1, #8
	ldrb r0, [r4, #3]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08062BF0 @ =0x0400000A
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r1]
	adds r1, #2
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r1]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r7, #8]
	strh r0, [r7, #0x10]
	mov r0, sp
	ldrh r0, [r0, #2]
	strh r0, [r7, #0xa]
	mov r0, sp
	ldrh r0, [r0, #4]
	strh r0, [r7, #0xc]
	mov r0, sp
	ldrh r0, [r0, #6]
	strh r0, [r7, #0xe]
	mov r4, ip
	ldrb r0, [r4, #7]
	cmp r0, #7
	bhi _08062BF4
	movs r0, #0xfd
	lsls r0, r0, #6
	b _08062BF6
	.align 2, 0
_08062BE0: .4byte gWindow1Border
_08062BE4: .4byte 0x04000048
_08062BE8: .4byte 0x04000040
_08062BEC: .4byte 0x04000042
_08062BF0: .4byte 0x0400000A
_08062BF4:
	ldr r0, _08062C08 @ =0x00003E41
_08062BF6:
	strh r0, [r7, #2]
	mov r1, ip
	ldrb r0, [r1, #0x10]
	cmp r0, #9
	bne _08062C0C
	ldrh r1, [r7, #2]
	movs r0, #8
	b _08062C14
	.align 2, 0
_08062C08: .4byte 0x00003E41
_08062C0C:
	cmp r0, #0xa
	bne _08062C18
	ldrh r1, [r7, #2]
	movs r0, #4
_08062C14:
	orrs r0, r1
	strh r0, [r7, #2]
_08062C18:
	mov r2, ip
	ldrb r0, [r2, #1]
	cmp r0, #0x14
	bne _08062C2A
	ldr r2, _08062C74 @ =gIoRegisters
	ldrh r1, [r2, #2]
	ldr r0, _08062C78 @ =0x0000FFFE
	ands r0, r1
	strh r0, [r2, #2]
_08062C2A:
	movs r4, #0xbe
	lsls r4, r4, #7
	bl unk_62cb4
	adds r3, r0, #0
	cmp r3, #0
	beq _08062C3A
	ands r4, r3
_08062C3A:
	ldr r5, _08062C74 @ =gIoRegisters
	strh r4, [r5]
	ldr r0, _08062C7C @ =gDebugFlag
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062C6A
	ldr r3, _08062C80 @ =gDebugMenuOptions
	ldrh r0, [r3, #2]
	cmp r0, #0
	beq _08062C62
	ldrb r0, [r3, #3]
	strb r0, [r5, #4]
	ldrb r0, [r3, #2]
	strb r0, [r5, #5]
	ldr r2, _08062C84 @ =0x04000052
	ldrb r1, [r5, #5]
	lsls r1, r1, #8
	ldrb r0, [r5, #4]
	orrs r0, r1
	strh r0, [r2]
_08062C62:
	ldrh r0, [r3]
	cmp r0, #0
	beq _08062C6A
	strh r0, [r5, #2]
_08062C6A:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08062C74: .4byte gIoRegisters
_08062C78: .4byte 0x0000FFFE
_08062C7C: .4byte gDebugFlag
_08062C80: .4byte gDebugMenuOptions
_08062C84: .4byte 0x04000052

	thumb_func_start unk_62c88
unk_62c88: @ 0x08062C88
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r0, #0
	movs r1, #0
	cmp r0, #1
	beq _08062CA4
	cmp r0, #1
	bgt _08062CA0
	cmp r0, #0
	beq _08062CAE
	b _08062CA4
_08062CA0:
	cmp r2, #2
	beq _08062CAA
_08062CA4:
	movs r1, #0x80
	lsls r1, r1, #7
	b _08062CAE
_08062CAA:
	movs r1, #0x80
	lsls r1, r1, #8
_08062CAE:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start unk_62cb4
unk_62cb4: @ 0x08062CB4
	push {lr}
	movs r1, #0
	ldr r0, _08062CC8 @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	cmp r0, #0x12
	bne _08062CCC
	bl CheckMakeRoomDim
	b _08062CE8
	.align 2, 0
_08062CC8: .4byte gCurrentRoomEntry
_08062CCC:
	cmp r0, #0x13
	bne _08062CD6
	bl CheckMainElevatorIsActive
	b _08062CE8
_08062CD6:
	cmp r0, #0x48
	bne _08062CE0
	bl CheckSetMeltdownEffect
	b _08062CE8
_08062CE0:
	cmp r0, #0x45
	bne _08062CEE
	bl CheckRoomShouldBeDark
_08062CE8:
	lsls r1, r0, #8
	ldr r0, _08062CF4 @ =0x0000FEFF
	orrs r1, r0
_08062CEE:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08062CF4: .4byte 0x0000FEFF

	thumb_func_start CheckMakeRoomDim
CheckMakeRoomDim: @ 0x08062CF8
	push {r4, r5, r6, r7, lr}
	ldr r0, _08062D18 @ =gEventCounter
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #8
	bne _08062D24
	ldr r0, _08062D1C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _08062D24
	ldr r1, _08062D20 @ =gCurrentEventBasedEffectCopy
	movs r0, #0x13
	strb r0, [r1]
	movs r0, #1
	b _08062D60
	.align 2, 0
_08062D18: .4byte gEventCounter
_08062D1C: .4byte gCurrentRoom
_08062D20: .4byte gCurrentEventBasedEffectCopy
_08062D24:
	movs r7, #4
	ldr r1, _08062D3C @ =0x083C88F0
	ldrb r5, [r1, #7]
	movs r3, #0
	ldrb r0, [r6]
	adds r4, r1, #0
	ldrb r1, [r4]
	cmp r0, r1
	bhs _08062D40
	ldrb r1, [r4, #1]
	b _08062D58
	.align 2, 0
_08062D3C: .4byte 0x083C88F0
_08062D40:
	adds r3, #1
	cmp r3, r7
	bge _08062D5E
	lsls r2, r3, #1
	adds r1, r2, r4
	ldrb r0, [r6]
	ldrb r1, [r1]
	cmp r0, r1
	bhs _08062D40
	adds r0, r4, #1
	adds r0, r2, r0
	ldrb r1, [r0]
_08062D58:
	movs r0, #1
	adds r5, r0, #0
	eors r5, r1
_08062D5E:
	adds r0, r5, #0
_08062D60:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckMainElevatorIsActive
CheckMainElevatorIsActive: @ 0x08062D68
	push {lr}
	movs r2, #1
	ldr r0, _08062DA0 @ =gEventCounter
	ldrb r1, [r0]
	adds r0, r1, #0
	subs r0, #0xd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x30
	bhi _08062D9A
	movs r2, #0
	cmp r1, #0xd
	bne _08062D9A
	ldr r0, _08062DA4 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	bne _08062D9A
	ldr r0, _08062DA8 @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #1
	bne _08062D9A
	ldr r1, _08062DAC @ =gCurrentEventBasedEffectCopy
	movs r0, #9
	strb r0, [r1]
	movs r2, #1
_08062D9A:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08062DA0: .4byte gEventCounter
_08062DA4: .4byte gSamusData
_08062DA8: .4byte gLastElevatorUsed
_08062DAC: .4byte gCurrentEventBasedEffectCopy

	thumb_func_start CheckSetMeltdownEffect
CheckSetMeltdownEffect: @ 0x08062DB0
	push {lr}
	movs r2, #0
	ldr r0, _08062DD0 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x3a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _08062DCA
	movs r2, #1
	ldr r1, _08062DD4 @ =gCurrentEventBasedEffectCopy
	movs r0, #6
	strb r0, [r1]
_08062DCA:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08062DD0: .4byte gEventCounter
_08062DD4: .4byte gCurrentEventBasedEffectCopy

	thumb_func_start CheckRoomShouldBeDark
CheckRoomShouldBeDark: @ 0x08062DD8
	push {lr}
	movs r1, #0
	ldr r0, _08062DEC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xd
	bhi _08062DE6
	movs r1, #1
_08062DE6:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08062DEC: .4byte gEventCounter

	thumb_func_start RoomEffectFade
RoomEffectFade: @ 0x08062DF0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r6, #0
	ldr r0, _08062E10 @ =gWrittenToBldalpha
	ldrh r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	bne _08062E0A
	ldr r0, _08062E14 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062E18
_08062E0A:
	movs r0, #0
	b _08062FFE
	.align 2, 0
_08062E10: .4byte gWrittenToBldalpha
_08062E14: .4byte gCurrentPowerBomb
_08062E18:
	subs r0, r2, #1
	cmp r0, #6
	bls _08062E20
	b _08062FFC
_08062E20:
	lsls r0, r0, #2
	ldr r1, _08062E2C @ =_08062E30
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08062E2C: .4byte _08062E30
_08062E30: @ jump table
	.4byte _08062EE2 @ case 0
	.4byte _08062F00 @ case 1
	.4byte _08062F1C @ case 2
	.4byte _08062EA2 @ case 3
	.4byte _08062E4C @ case 4
	.4byte _08062F62 @ case 5
	.4byte _08062FBA @ case 6
_08062E4C:
	movs r6, #1
	ldr r0, _08062E68 @ =0x03004FBC
	ldr r1, _08062E6C @ =gIoRegisters
	ldrb r2, [r1, #5]
	ldrb r4, [r0, #1]
	adds r3, r2, #0
	adds r5, r0, #0
	mov ip, r1
	cmp r4, r3
	beq _08062E78
	cmp r4, r3
	bhs _08062E70
	subs r0, r2, #1
	b _08062E74
	.align 2, 0
_08062E68: .4byte 0x03004FBC
_08062E6C: .4byte gIoRegisters
_08062E70:
	adds r0, r2, #1
	mov r1, ip
_08062E74:
	strb r0, [r1, #5]
	movs r6, #0
_08062E78:
	mov r2, ip
	ldrb r0, [r2, #4]
	ldrb r2, [r5, #2]
	adds r1, r0, #0
	cmp r2, r1
	beq _08062E98
	cmp r2, r1
	bhs _08062E90
	subs r0, #1
	mov r1, ip
	strb r0, [r1, #4]
	b _08062E96
_08062E90:
	adds r0, #1
	mov r2, ip
	strb r0, [r2, #4]
_08062E96:
	movs r6, #0
_08062E98:
	mov r0, ip
	ldrb r1, [r0, #5]
	lsls r1, r1, #8
	ldrb r0, [r0, #4]
	b _08062FF8
_08062EA2:
	ldr r0, _08062EB4 @ =gIoRegisters
	ldrb r2, [r0, #5]
	mov ip, r0
	cmp r2, #0xf
	bhi _08062EB8
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1, #5]
	b _08062EC4
	.align 2, 0
_08062EB4: .4byte gIoRegisters
_08062EB8:
	mov r2, ip
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _08062F5E
	movs r0, #0x10
	strb r0, [r2, #5]
_08062EC4:
	mov r1, ip
	ldrb r0, [r1, #4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08062ED6
	subs r0, #1
	mov r2, ip
	strb r0, [r2, #4]
	b _08062EDA
_08062ED6:
	mov r0, ip
	strb r1, [r0, #4]
_08062EDA:
	mov r2, ip
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	b _08062FF6
_08062EE2:
	ldr r2, _08062EFC @ =gIoRegisters
	ldrb r1, [r2, #5]
	cmp r1, #2
	bhi _08062EEC
	b _08062FFC
_08062EEC:
	subs r1, #2
	strb r1, [r2, #5]
	movs r0, #0x10
	subs r0, r0, r1
	strb r0, [r2, #4]
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	b _08062FF6
	.align 2, 0
_08062EFC: .4byte gIoRegisters
_08062F00:
	ldr r2, _08062F18 @ =gIoRegisters
	ldrb r1, [r2, #5]
	cmp r1, #0xf
	bhi _08062F5E
	adds r1, #1
	strb r1, [r2, #5]
	movs r0, #0x10
	subs r0, r0, r1
	strb r0, [r2, #4]
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	b _08062FF6
	.align 2, 0
_08062F18: .4byte gIoRegisters
_08062F1C:
	ldr r0, _08062F30 @ =gIoRegisters
	ldrb r2, [r0, #5]
	mov ip, r0
	cmp r2, #0xf
	bhi _08062F34
	adds r0, r2, #1
	mov r1, ip
	strb r0, [r1, #5]
	b _08062F40
	.align 2, 0
_08062F30: .4byte gIoRegisters
_08062F34:
	mov r2, ip
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _08062F5E
	movs r0, #0x10
	strb r0, [r2, #5]
_08062F40:
	mov r1, ip
	ldrb r0, [r1, #4]
	adds r1, r0, #0
	cmp r1, #0
	beq _08062F52
	subs r0, #1
	mov r2, ip
	strb r0, [r2, #4]
	b _08062F56
_08062F52:
	mov r0, ip
	strb r1, [r0, #4]
_08062F56:
	mov r2, ip
	ldrb r1, [r2, #5]
	lsls r1, r1, #8
	b _08062FF6
_08062F5E:
	movs r6, #1
	b _08062FFC
_08062F62:
	movs r6, #1
	ldr r0, _08062F80 @ =0x03004FBC
	ldr r1, _08062F84 @ =gIoRegisters
	ldrb r2, [r1, #5]
	ldrb r4, [r0, #1]
	adds r3, r2, #0
	adds r5, r0, #0
	mov ip, r1
	cmp r4, r3
	beq _08062F90
	cmp r4, r3
	bhs _08062F88
	subs r0, r2, #1
	b _08062F8C
	.align 2, 0
_08062F80: .4byte 0x03004FBC
_08062F84: .4byte gIoRegisters
_08062F88:
	adds r0, r2, #1
	mov r1, ip
_08062F8C:
	strb r0, [r1, #5]
	movs r6, #0
_08062F90:
	mov r2, ip
	ldrb r0, [r2, #4]
	ldrb r2, [r5, #2]
	adds r1, r0, #0
	cmp r2, r1
	beq _08062FB0
	cmp r2, r1
	bhs _08062FA8
	subs r0, #1
	mov r1, ip
	strb r0, [r1, #4]
	b _08062FAE
_08062FA8:
	adds r0, #1
	mov r2, ip
	strb r0, [r2, #4]
_08062FAE:
	movs r6, #0
_08062FB0:
	mov r0, ip
	ldrb r1, [r0, #5]
	lsls r1, r1, #8
	ldrb r0, [r0, #4]
	b _08062FF8
_08062FBA:
	ldr r0, _08062FD4 @ =0x03004E42
	ldrb r0, [r0]
	cmp r0, #0
	beq _08062FE0
	ldr r0, _08062FD8 @ =gIoRegisters
	ldr r1, _08062FDC @ =0x03004FBC
	ldrb r2, [r0, #4]
	mov ip, r0
	ldrb r1, [r1, #2]
	cmp r2, r1
	bhs _08062FFC
	adds r0, r2, #1
	b _08062FEC
	.align 2, 0
_08062FD4: .4byte 0x03004E42
_08062FD8: .4byte gIoRegisters
_08062FDC: .4byte 0x03004FBC
_08062FE0:
	ldr r0, _08063004 @ =gIoRegisters
	ldrb r2, [r0, #4]
	mov ip, r0
	cmp r2, #0
	beq _08062FFC
	subs r0, r2, #1
_08062FEC:
	mov r1, ip
	strb r0, [r1, #4]
	ldrb r1, [r1, #5]
	lsls r1, r1, #8
	mov r2, ip
_08062FF6:
	ldrb r0, [r2, #4]
_08062FF8:
	orrs r0, r1
	strh r0, [r7]
_08062FFC:
	adds r0, r6, #0
_08062FFE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08063004: .4byte gIoRegisters

	thumb_func_start HatchStartLockAnimation
HatchStartLockAnimation: @ 0x08063008
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	movs r2, #3
	cmp r1, #2
	bne _08063022
	movs r2, #1
_08063022:
	ldr r0, _0806306C @ =gHatchData
	lsls r5, r3, #2
	adds r5, r5, r0
	movs r0, #3
	mov r8, r0
	ldrb r1, [r5, #1]
	movs r4, #4
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r1
	orrs r2, r0
	strb r2, [r5, #1]
	ldrb r1, [r5]
	movs r6, #0xf
	rsbs r6, r6, #0
	adds r0, r6, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r5]
	adds r0, r3, #0
	bl UpdateHatchAnimaton
	mov r0, r8
	ands r7, r0
	ldrb r0, [r5, #1]
	ands r4, r0
	orrs r4, r7
	strb r4, [r5, #1]
	ldrb r0, [r5]
	ands r6, r0
	strb r6, [r5]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806306C: .4byte gHatchData

	thumb_func_start LockHatches
LockHatches: @ 0x08063070
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080630D4 @ =0x03004E3B
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	movs r5, #0
_08063080:
	ldr r1, _080630D8 @ =gHatchData
	lsls r0, r4, #2
	adds r3, r0, r1
	ldrb r0, [r3]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _080630EE
	adds r0, r6, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080630EE
	ldr r2, _080630D4 @ =0x03004E3B
	adds r0, r1, #0
	lsls r0, r4
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, #1]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	movs r1, #0xa0
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _080630DC @ =0x03004E04
	adds r0, r4, r0
	ldr r1, _080630E0 @ =gLastDoorUsed
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080630E4
	lsrs r0, r5, #0x18
	movs r1, #0
	movs r2, #0
	bl HatchStartLockAnimation
	b _080630EE
	.align 2, 0
_080630D4: .4byte 0x03004E3B
_080630D8: .4byte gHatchData
_080630DC: .4byte 0x03004E04
_080630E0: .4byte gLastDoorUsed
_080630E4:
	lsrs r0, r5, #0x18
	movs r1, #2
	movs r2, #3
	bl HatchStartLockAnimation
_080630EE:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #5
	ble _08063080
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start LockHatchesWithTimer
LockHatchesWithTimer: @ 0x08063100
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08063164 @ =0x03004E3B
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	movs r5, #0
_08063110:
	ldr r1, _08063168 @ =gHatchData
	lsls r0, r4, #2
	adds r3, r0, r1
	ldrb r0, [r3]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0806317E
	adds r0, r6, #0
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806317E
	ldr r2, _08063164 @ =0x03004E3B
	adds r0, r1, #0
	lsls r0, r4
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r3, #1]
	movs r1, #4
	orrs r0, r1
	strb r0, [r3, #1]
	ldrb r1, [r3]
	movs r0, #0x1f
	ands r0, r1
	movs r1, #0xa0
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0806316C @ =0x03004E04
	adds r0, r4, r0
	ldr r1, _08063170 @ =gLastDoorUsed
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08063174
	lsrs r0, r5, #0x18
	movs r1, #0
	movs r2, #0
	bl HatchStartLockAnimation
	b _0806317E
	.align 2, 0
_08063164: .4byte 0x03004E3B
_08063168: .4byte gHatchData
_0806316C: .4byte 0x03004E04
_08063170: .4byte gLastDoorUsed
_08063174:
	lsrs r0, r5, #0x18
	movs r1, #2
	movs r2, #3
	bl HatchStartLockAnimation
_0806317E:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r5, r5, r0
	adds r4, #1
	cmp r4, #5
	ble _08063110
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start RecoveringSuitInit
RecoveringSuitInit: @ 0x08063190
	push {lr}
	movs r2, #0
	ldr r0, _080631C0 @ =gCurrentEventBasedEffect
	ldrb r1, [r0]
	cmp r1, #0x90
	beq _080631A6
	cmp r1, #0
	bne _080631A2
	movs r2, #1
_080631A2:
	cmp r2, #0
	beq _080631BC
_080631A6:
	movs r1, #0x16
	strb r1, [r0]
	ldr r0, _080631C4 @ =gCurrentEventBasedEffectCopy
	strb r1, [r0]
	ldr r1, _080631C8 @ =0x03004FA0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _080631CC @ =0x0300002B
	movs r0, #1
	strb r0, [r1]
_080631BC:
	pop {r0}
	bx r0
	.align 2, 0
_080631C0: .4byte gCurrentEventBasedEffect
_080631C4: .4byte gCurrentEventBasedEffectCopy
_080631C8: .4byte 0x03004FA0
_080631CC: .4byte 0x0300002B

	thumb_func_start SetCurrentNavigationRoom
SetCurrentNavigationRoom: @ 0x080631D0
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _080631EC @ =gCurrentNavigationRoom
	movs r3, #0
	strb r3, [r2]
	ldr r0, _080631F0 @ =0x0857604C
	ldrb r1, [r0]
	adds r5, r2, #0
	adds r6, r0, #0
	cmp r1, #0xff
	bne _080631F4
	strb r3, [r5]
	b _08063226
	.align 2, 0
_080631EC: .4byte gCurrentNavigationRoom
_080631F0: .4byte 0x0857604C
_080631F4:
	ldr r0, _0806322C @ =gCurrentArea
	adds r4, r6, #0
	ldrb r2, [r5]
	lsls r3, r2, #1
	adds r1, r3, r4
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bne _08063212
	adds r0, r4, #1
	adds r0, r3, r0
	ldrb r0, [r0]
	subs r0, #1
	cmp r7, r0
	beq _08063226
_08063212:
	adds r0, r2, #1
	strb r0, [r5]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080631F4
	movs r0, #0
	strb r0, [r5]
_08063226:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806322C: .4byte gCurrentArea

	thumb_func_start DetermineNavigationHatchesToLock
DetermineNavigationHatchesToLock: @ 0x08063230
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08063248 @ =gCurrentNavigationRoom
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #0
	bne _08063298
	movs r0, #1
	b _080633EE
	.align 2, 0
_08063248: .4byte gCurrentNavigationRoom
_0806324C:
	ldrb r0, [r1, #1]
	b _0806327E
_08063250:
	ldrb r0, [r1, #1]
	b _0806328E
_08063254:
	ldrb r0, [r1, #1]
	b _08063266
_08063258:
	ldrb r1, [r1, #1]
	b _08063272
_0806325C:
	ldrb r0, [r1, #2]
	b _0806327E
_08063260:
	ldrb r0, [r1, #2]
	b _0806328E
_08063264:
	ldrb r0, [r1, #2]
_08063266:
	lsls r1, r0, #0x1b
	lsrs r6, r1, #0x1f
	lsls r0, r0, #0x1a
	lsrs r5, r0, #0x1f
	b _08063322
_08063270:
	ldrb r1, [r1, #2]
_08063272:
	lsls r0, r1, #0x19
	lsrs r6, r0, #0x1f
	lsrs r5, r1, #7
	b _08063322
_0806327A:
	mov r1, ip
	ldrb r0, [r1, #3]
_0806327E:
	lsls r1, r0, #0x1f
	lsrs r6, r1, #0x1f
	lsls r0, r0, #0x1e
	lsrs r5, r0, #0x1f
	b _08063322
_08063288:
	mov r2, sb
	adds r0, r7, r2
	ldrb r0, [r0, #3]
_0806328E:
	lsls r1, r0, #0x1d
	lsrs r6, r1, #0x1f
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1f
	b _08063322
_08063298:
	ldr r1, _08063300 @ =0x040000D4
	ldr r0, _08063304 @ =0x084080BC
	str r0, [r1]
	ldr r0, _08063308 @ =0x05000040
	str r0, [r1, #4]
	ldr r0, _0806330C @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r6, #0
	movs r5, #0
	movs r4, #0
	ldr r0, _08063310 @ =0x083C88F8
	mov sb, r0
	ldr r0, _08063314 @ =gEventCounter
	ldrb r3, [r0]
	movs r2, #0
	mov r1, sb
_080632BA:
	mov ip, r1
	adds r7, r2, #0
	ldrb r0, [r1]
	cmp r3, r0
	bne _08063318
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #1
	beq _0806324C
	cmp r0, #2
	beq _08063250
	cmp r0, #3
	beq _08063254
	cmp r0, #4
	beq _08063258
	cmp r0, #5
	beq _0806325C
	cmp r0, #6
	beq _08063260
	cmp r0, #7
	beq _08063264
	cmp r0, #8
	beq _08063270
	cmp r0, #9
	beq _0806327A
	cmp r0, #0xa
	beq _08063288
	cmp r0, #0xb
	bne _08063322
	ldrb r1, [r1, #3]
	lsls r0, r1, #0x1b
	lsrs r6, r0, #0x1f
	lsls r1, r1, #0x1a
	lsrs r5, r1, #0x1f
	b _08063322
	.align 2, 0
_08063300: .4byte 0x040000D4
_08063304: .4byte 0x084080BC
_08063308: .4byte 0x05000040
_0806330C: .4byte 0x80000010
_08063310: .4byte 0x083C88F8
_08063314: .4byte gEventCounter
_08063318:
	adds r2, #4
	adds r1, #4
	adds r4, #1
	cmp r4, #0x58
	bls _080632BA
_08063322:
	cmp r6, #0
	bne _08063336
	cmp r5, #0
	bne _08063336
	ldr r0, _08063388 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080633EC
_08063336:
	ldr r1, _0806338C @ =0x03004E3B
	movs r0, #0
	strb r0, [r1]
	movs r4, #0
	adds r7, r1, #0
	movs r0, #1
	mov r8, r0
_08063344:
	ldr r0, _08063390 @ =gHatchData
	lsls r1, r4, #2
	adds r3, r1, r0
	ldrb r1, [r3]
	lsls r0, r1, #0x1f
	cmp r0, #0
	beq _080633E6
	lsls r0, r1, #0x1b
	adds r1, r5, #0
	cmp r0, #0
	bge _0806335C
	adds r1, r6, #0
_0806335C:
	ldr r0, _08063388 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08063398
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _080633E6
	cmp r1, #0
	bne _080633E6
	mov r0, r8
	lsls r0, r4
	ldrb r1, [r7]
	orrs r0, r1
	strb r0, [r7]
	ldr r0, _08063394 @ =gDoorUnlockTimer
	mov r1, r8
	strb r1, [r0]
	b _080633E6
	.align 2, 0
_08063388: .4byte gPauseScreenFlag
_0806338C: .4byte 0x03004E3B
_08063390: .4byte gHatchData
_08063394: .4byte gDoorUnlockTimer
_08063398:
	cmp r1, #0
	beq _080633E6
	mov r0, r8
	lsls r0, r4
	ldrb r1, [r7]
	orrs r0, r1
	strb r0, [r7]
	ldrb r1, [r3, #1]
	movs r0, #4
	adds r2, r1, #0
	orrs r2, r0
	strb r2, [r3, #1]
	ldr r0, _080633CC @ =0x03004E04
	adds r0, r4, r0
	ldr r1, _080633D0 @ =gLastDoorUsed
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _080633D4
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	movs r1, #0
	movs r2, #0
	bl HatchStartLockAnimation
	b _080633E6
	.align 2, 0
_080633CC: .4byte 0x03004E04
_080633D0: .4byte gLastDoorUsed
_080633D4:
	movs r0, #3
	orrs r2, r0
	strb r2, [r3, #1]
	ldrb r0, [r3]
	movs r2, #0xf
	rsbs r2, r2, #0
	adds r1, r2, #0
	ands r0, r1
	strb r0, [r3]
_080633E6:
	adds r4, #1
	cmp r4, #5
	ble _08063344
_080633EC:
	movs r0, #0
_080633EE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CheckSetCurrentEventBasedEffect
CheckSetCurrentEventBasedEffect: @ 0x080633FC
	push {lr}
	ldr r0, _08063420 @ =gPauseScreenFlag
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _0806341C
	ldr r0, _08063424 @ =0x03004FA0
	strh r1, [r0]
	ldr r1, _08063428 @ =gCurrentEventBasedEffectCopy
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806341C
	cmp r0, #4
	beq _0806341C
	bl SetCurrentEventBasedEffect
_0806341C:
	pop {r0}
	bx r0
	.align 2, 0
_08063420: .4byte gPauseScreenFlag
_08063424: .4byte 0x03004FA0
_08063428: .4byte gCurrentEventBasedEffectCopy

	thumb_func_start SetCurrentEventBasedEffect
SetCurrentEventBasedEffect: @ 0x0806342C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r2, _08063440 @ =gCurrentEventBasedEffect
	ldrb r0, [r2]
	cmp r0, r1
	beq _0806343C
	strb r1, [r2]
_0806343C:
	pop {r0}
	bx r0
	.align 2, 0
_08063440: .4byte gCurrentEventBasedEffect

	thumb_func_start SetupCurrentEventBasedEffect
SetupCurrentEventBasedEffect: @ 0x08063444
	push {lr}
	bl DetermineNavigationHatchesToLock
	cmp r0, #0
	beq _0806345E
	ldr r0, _0806347C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08063468
	bl CheckHatchLockEvents
_0806345E:
	ldr r0, _0806347C @ =gPauseScreenFlag
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080634C0
_08063468:
	ldr r0, _08063480 @ =0x03004FC8
	ldrb r0, [r0]
	cmp r0, #0
	beq _08063490
	ldr r1, _08063484 @ =0x040000D4
	ldr r0, _08063488 @ =0x020355E0
	str r0, [r1]
	ldr r0, _0806348C @ =0x050001E0
	b _080634A2
	.align 2, 0
_0806347C: .4byte gPauseScreenFlag
_08063480: .4byte 0x03004FC8
_08063484: .4byte 0x040000D4
_08063488: .4byte 0x020355E0
_0806348C: .4byte 0x050001E0
_08063490:
	ldr r0, _080634AC @ =gCurrentEventBasedEffectCopy
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _0806349A
	b _08063682
_0806349A:
	ldr r1, _080634B0 @ =0x040000D4
	ldr r0, _080634B4 @ =0x02035480
	str r0, [r1]
	ldr r0, _080634B8 @ =0x05000080
_080634A2:
	str r0, [r1, #4]
	ldr r0, _080634BC @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08063682
	.align 2, 0
_080634AC: .4byte gCurrentEventBasedEffectCopy
_080634B0: .4byte 0x040000D4
_080634B4: .4byte 0x02035480
_080634B8: .4byte 0x05000080
_080634BC: .4byte 0x80000010
_080634C0:
	ldr r0, _080634DC @ =0x03004FA0
	strh r1, [r0]
	strh r1, [r0, #2]
	ldr r0, _080634E0 @ =gCurrentEventBasedEffectCopy
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0x13
	bls _080634D2
	b _0806367E
_080634D2:
	lsls r0, r0, #2
	ldr r1, _080634E4 @ =_080634E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080634DC: .4byte 0x03004FA0
_080634E0: .4byte gCurrentEventBasedEffectCopy
_080634E4: .4byte _080634E8
_080634E8: @ jump table
	.4byte _08063538 @ case 0
	.4byte _0806367E @ case 1
	.4byte _080635DA @ case 2
	.4byte _080635E2 @ case 3
	.4byte _0806367E @ case 4
	.4byte _08063580 @ case 5
	.4byte _080635E2 @ case 6
	.4byte _0806359C @ case 7
	.4byte _0806367E @ case 8
	.4byte _080635D4 @ case 9
	.4byte _080635F4 @ case 10
	.4byte _0806367E @ case 11
	.4byte _08063614 @ case 12
	.4byte _080635FE @ case 13
	.4byte _0806367E @ case 14
	.4byte _08063640 @ case 15
	.4byte _0806367E @ case 16
	.4byte _08063670 @ case 17
	.4byte _080635A2 @ case 18
	.4byte _080635AE @ case 19
_08063538:
	bl AtmosphericSbabilizerCheckIsInfected
	cmp r0, #0
	bne _08063578
	movs r0, #0
	bl HazeSetupCode
	ldr r2, _08063564 @ =gIoRegisters
	ldrh r1, [r2]
	ldr r0, _08063568 @ =0x0000FEFF
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	ldr r0, _0806356C @ =0x03004FC8
	strb r1, [r0]
	ldr r0, _08063570 @ =gCurrentEventBasedEffect
	strb r1, [r0]
	ldr r1, _08063574 @ =gDoorUnlockTimer
	movs r0, #1
	strb r0, [r1]
	b _0806367E
	.align 2, 0
_08063564: .4byte gIoRegisters
_08063568: .4byte 0x0000FEFF
_0806356C: .4byte 0x03004FC8
_08063570: .4byte gCurrentEventBasedEffect
_08063574: .4byte gDoorUnlockTimer
_08063578:
	movs r0, #0xff
	bl LockHatches
	b _0806367E
_08063580:
	ldr r0, _08063594 @ =gCurrentRoomEntry
	ldrb r0, [r0]
	cmp r0, #0x52
	beq _0806358A
	b _0806367E
_0806358A:
	ldr r0, _08063598 @ =0x0000011F
	bl SoundPlay
	b _0806367E
	.align 2, 0
_08063594: .4byte gCurrentRoomEntry
_08063598: .4byte 0x0000011F
_0806359C:
	bl unk_6cf0c
	b _0806367E
_080635A2:
	ldr r2, _080635C4 @ =0x03004E44
	ldrb r1, [r2]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
_080635AE:
	ldr r1, _080635C8 @ =gIoRegisters
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1, #5]
	strb r2, [r1, #4]
	ldr r1, _080635CC @ =0x04000052
	lsls r0, r0, #8
	strh r0, [r1]
	ldr r0, _080635D0 @ =gWrittenToBldalpha
	strh r2, [r0]
	b _0806367E
	.align 2, 0
_080635C4: .4byte 0x03004E44
_080635C8: .4byte gIoRegisters
_080635CC: .4byte 0x04000052
_080635D0: .4byte gWrittenToBldalpha
_080635D4:
	movs r0, #0x90
	lsls r0, r0, #1
	b _08063602
_080635DA:
	ldr r0, _080635EC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5a
	beq _0806367E
_080635E2:
	ldr r1, _080635F0 @ =0x03004FC8
	movs r0, #0
	strb r0, [r1]
	b _0806367E
	.align 2, 0
_080635EC: .4byte gEventCounter
_080635F0: .4byte 0x03004FC8
_080635F4:
	movs r0, #0x93
	lsls r0, r0, #1
	bl SoundPlay
	b _0806367E
_080635FE:
	movs r0, #0x96
	lsls r0, r0, #1
_08063602:
	bl SoundPlay
	ldr r1, _08063610 @ =gCurrentEventBasedEffect
	movs r0, #0
	strb r0, [r1]
	b _0806367E
	.align 2, 0
_08063610: .4byte gCurrentEventBasedEffect
_08063614:
	ldr r0, _08063630 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x48
	bls _0806367E
	ldr r2, _08063634 @ =gIoRegisters
	ldrh r1, [r2]
	ldr r0, _08063638 @ =0x0000FEFF
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	ldr r0, _0806363C @ =gCurrentEventBasedEffect
	strb r1, [r0]
	b _0806367E
	.align 2, 0
_08063630: .4byte gEventCounter
_08063634: .4byte gIoRegisters
_08063638: .4byte 0x0000FEFF
_0806363C: .4byte gCurrentEventBasedEffect
_08063640:
	ldr r1, _08063660 @ =0x03004E42
	movs r0, #0
	strb r0, [r1]
	ldr r0, _08063664 @ =gIoRegisters
	movs r3, #0
	strb r3, [r0, #4]
	ldr r2, _08063668 @ =0x04000052
	ldrb r1, [r0, #5]
	lsls r1, r1, #8
	ldrb r0, [r0, #4]
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0806366C @ =gWrittenToBldalpha
	strh r3, [r0]
	b _0806367E
	.align 2, 0
_08063660: .4byte 0x03004E42
_08063664: .4byte gIoRegisters
_08063668: .4byte 0x04000052
_0806366C: .4byte gWrittenToBldalpha
_08063670:
	bl ProcessOmegaMetroidRoomEffect
	ldr r1, _08063688 @ =0x03000050
	movs r2, #0x90
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
_0806367E:
	bl CheckDisableAnimatedPalette
_08063682:
	pop {r0}
	bx r0
	.align 2, 0
_08063688: .4byte 0x03000050

	thumb_func_start StartStopEventBasedEffect
StartStopEventBasedEffect: @ 0x0806368C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r3, _080636AC @ =gCurrentEventBasedEffect
	ldrb r2, [r3]
	cmp r2, r0
	bne _080636A8
	ldr r1, _080636B0 @ =0x03004FA0
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r3]
_080636A8:
	pop {r0}
	bx r0
	.align 2, 0
_080636AC: .4byte gCurrentEventBasedEffect
_080636B0: .4byte 0x03004FA0

	thumb_func_start UpdateEventBasedEffect
UpdateEventBasedEffect: @ 0x080636B4
	push {lr}
	ldr r0, _080636CC @ =gCurrentEventBasedEffect
	ldrb r1, [r0]
	cmp r1, #0
	beq _080636D4
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080636D0
	bl ProcessEventBasedEffect
	b _080636D4
	.align 2, 0
_080636CC: .4byte gCurrentEventBasedEffect
_080636D0:
	bl CheckStopEventBasedEffect
_080636D4:
	bl CheckUnlockHatches
	pop {r0}
	bx r0

	thumb_func_start CheckStopEventBasedEffect
CheckStopEventBasedEffect: @ 0x080636DC
	push {lr}
	movs r2, #0
	ldr r0, _080636F8 @ =gCurrentEventBasedEffect
	ldrb r0, [r0]
	subs r0, #2
	cmp r0, #0x14
	bls _080636EC
	b _080637FE
_080636EC:
	lsls r0, r0, #2
	ldr r1, _080636FC @ =_08063700
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080636F8: .4byte gCurrentEventBasedEffect
_080636FC: .4byte _08063700
_08063700: @ jump table
	.4byte _08063802 @ case 0
	.4byte _080637FE @ case 1
	.4byte _080637FE @ case 2
	.4byte _08063754 @ case 3
	.4byte _08063764 @ case 4
	.4byte _08063774 @ case 5
	.4byte _08063784 @ case 6
	.4byte _08063798 @ case 7
	.4byte _080637FE @ case 8
	.4byte _08063802 @ case 9
	.4byte _080637BC @ case 10
	.4byte _08063802 @ case 11
	.4byte _080637FE @ case 12
	.4byte _080637FE @ case 13
	.4byte _08063802 @ case 14
	.4byte _080637CC @ case 15
	.4byte _08063802 @ case 16
	.4byte _08063802 @ case 17
	.4byte _080637AC @ case 18
	.4byte _080637FE @ case 19
	.4byte _080637DC @ case 20
_08063754:
	ldr r0, _08063760 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x1f
	bls _080637FE
	b _08063802
	.align 2, 0
_08063760: .4byte gEventCounter
_08063764:
	ldr r0, _08063770 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _080637FE
	b _08063802
	.align 2, 0
_08063770: .4byte gEventCounter
_08063774:
	ldr r0, _08063780 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x49
	bls _080637FE
	b _08063802
	.align 2, 0
_08063780: .4byte gEventCounter
_08063784:
	ldr r0, _08063790 @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _08063794 @ =0x0000017F
	cmp r1, r0
	bls _080637FE
	b _08063802
	.align 2, 0
_08063790: .4byte gSamusData
_08063794: .4byte 0x0000017F
_08063798:
	ldr r0, _080637A8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _080637FE
	movs r0, #0x33
	bl unk_3b1c
	b _08063802
	.align 2, 0
_080637A8: .4byte gSamusData
_080637AC:
	ldr r0, _080637B8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _080637FE
	b _08063802
	.align 2, 0
_080637B8: .4byte gSamusData
_080637BC:
	ldr r0, _080637C8 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x39
	bne _080637FE
	b _08063802
	.align 2, 0
_080637C8: .4byte gSamusData
_080637CC:
	ldr r0, _080637D8 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x66
	bls _080637FE
	b _08063802
	.align 2, 0
_080637D8: .4byte gEventCounter
_080637DC:
	ldr r1, _08063810 @ =gCurrentPowerBomb
	ldrb r0, [r1]
	cmp r0, #0
	bne _080637FE
	ldrb r0, [r1, #0x10]
	cmp r0, #0
	bne _080637FE
	ldr r1, _08063814 @ =0x0828FD04
	ldr r0, _08063818 @ =gSamusData
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xf8
	bl _call_via_r1
	movs r2, #1
_080637FE:
	cmp r2, #0
	beq _0806380A
_08063802:
	ldr r0, _0806381C @ =gCurrentEventBasedEffect
	ldrb r0, [r0]
	bl StartStopEventBasedEffect
_0806380A:
	pop {r0}
	bx r0
	.align 2, 0
_08063810: .4byte gCurrentPowerBomb
_08063814: .4byte 0x0828FD04
_08063818: .4byte gSamusData
_0806381C: .4byte gCurrentEventBasedEffect

	thumb_func_start ProcessEventBasedEffect
ProcessEventBasedEffect: @ 0x08063820
	push {r4, r5, r6, lr}
	ldr r2, _08063848 @ =0x03004FA0
	ldrh r0, [r2, #2]
	adds r0, #1
	strh r0, [r2, #2]
	movs r6, #0
	ldr r0, _0806384C @ =gCurrentEventBasedEffect
	ldrb r1, [r0]
	movs r0, #0x7f
	ands r0, r1
	subs r0, #1
	cmp r0, #0x15
	bls _0806383C
	b _08063C2A
_0806383C:
	lsls r0, r0, #2
	ldr r1, _08063850 @ =_08063854
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063848: .4byte 0x03004FA0
_0806384C: .4byte gCurrentEventBasedEffect
_08063850: .4byte _08063854
_08063854: @ jump table
	.4byte _080638AC @ case 0
	.4byte _080639D6 @ case 1
	.4byte _08063B24 @ case 2
	.4byte _08063C2A @ case 3
	.4byte _08063928 @ case 4
	.4byte _080639A8 @ case 5
	.4byte _08063A14 @ case 6
	.4byte _08063A5C @ case 7
	.4byte _08063A90 @ case 8
	.4byte _08063C2A @ case 9
	.4byte _08063B30 @ case 10
	.4byte _08063B5E @ case 11
	.4byte _08063B74 @ case 12
	.4byte _08063C2A @ case 13
	.4byte _08063C2A @ case 14
	.4byte _08063B9C @ case 15
	.4byte _08063C08 @ case 16
	.4byte _08063C12 @ case 17
	.4byte _08063AAC @ case 18
	.4byte _08063ADC @ case 19
	.4byte _08063C2A @ case 20
	.4byte _08063C18 @ case 21
_080638AC:
	ldrh r0, [r2]
	cmp r0, #0
	bne _080638C8
	movs r0, #1
	bl RoomEffectFade
	ldr r1, _080638C4 @ =0x03004E3A
	movs r0, #1
	strb r0, [r1]
	movs r6, #1
	b _08063C2E
	.align 2, 0
_080638C4: .4byte 0x03004E3A
_080638C8:
	cmp r0, #1
	bne _080638FC
	ldr r0, _080638EC @ =0x03004FC8
	ldrb r0, [r0]
	cmp r0, #0
	beq _080638D6
	b _08063C2A
_080638D6:
	ldr r1, _080638F0 @ =0x040000D4
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1]
	ldr r0, _080638F4 @ =0x02035400
	str r0, [r1, #4]
	ldr r0, _080638F8 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r6, #1
	b _08063C2E
	.align 2, 0
_080638EC: .4byte 0x03004FC8
_080638F0: .4byte 0x040000D4
_080638F4: .4byte 0x02035400
_080638F8: .4byte 0x80000100
_080638FC:
	cmp r0, #2
	beq _08063902
	b _08063C2A
_08063902:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _0806390A
	b _08063C2A
_0806390A:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #2
	bl RoomEffectFade
	cmp r0, #0
	bne _0806391A
	b _08063C2A
_0806391A:
	ldr r1, _08063924 @ =gDoorUnlockTimer
	movs r0, #0x1e
	strb r0, [r1]
	movs r6, #2
	b _08063C2E
	.align 2, 0
_08063924: .4byte gDoorUnlockTimer
_08063928:
	ldrh r4, [r2]
	cmp r4, #0
	bne _08063950
	ldr r0, _0806394C @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08063938
	b _08063C2A
_08063938:
	movs r0, #0x8f
	lsls r0, r0, #1
	bl SoundPlay
	movs r0, #0x8b
	lsls r0, r0, #1
	bl StopSound
	movs r6, #1
	b _08063C2E
	.align 2, 0
_0806394C: .4byte gPreventMovementTimer
_08063950:
	cmp r4, #1
	beq _08063956
	b _08063C2A
_08063956:
	ldr r5, _08063994 @ =0x03004E4C
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	ldr r1, _08063998 @ =0x027F0000
	cmp r0, r1
	ble _0806397E
	movs r0, #0x8f
	lsls r0, r0, #1
	bl StopSound
	ldr r0, _0806399C @ =gWaterLowered
	strb r4, [r0]
	ldr r0, _080639A0 @ =0x03004E3A
	strb r4, [r0]
	movs r0, #0xa0
	lsls r0, r0, #2
	strh r0, [r5, #8]
	movs r6, #2
_0806397E:
	ldr r0, _080639A4 @ =0x030000F0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08063988
	b _08063C2A
_08063988:
	movs r0, #0x14
	movs r1, #0x81
	bl ScreenShakeStartVertical
	b _08063C2A
	.align 2, 0
_08063994: .4byte 0x03004E4C
_08063998: .4byte 0x027F0000
_0806399C: .4byte gWaterLowered
_080639A0: .4byte 0x03004E3A
_080639A4: .4byte 0x030000F0
_080639A8:
	ldrh r0, [r2]
	cmp r0, #0
	bne _080639C0
	ldr r0, _080639BC @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _080639B8
	b _08063C2A
_080639B8:
	movs r0, #0x51
	b _08063AF2
	.align 2, 0
_080639BC: .4byte gPreventMovementTimer
_080639C0:
	cmp r0, #1
	beq _080639C6
	b _08063C2A
_080639C6:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _080639CE
	b _08063C2A
_080639CE:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #3
	b _08063A9E
_080639D6:
	ldrh r1, [r2]
	cmp r1, #0
	bne _080639F0
	ldr r0, _080639EC @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _080639E6
	b _08063C2A
_080639E6:
	movs r6, #1
	b _08063C2E
	.align 2, 0
_080639EC: .4byte gPreventMovementTimer
_080639F0:
	cmp r1, #1
	beq _080639F6
	b _08063C2A
_080639F6:
	ldr r0, _08063A08 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08063A00
	b _08063C2A
_08063A00:
	ldr r0, _08063A0C @ =gSecurityHatchLevel
	ldr r1, _08063A10 @ =gEquipment
	ldrb r1, [r1, #0xd]
	b _08063A4A
	.align 2, 0
_08063A08: .4byte gPreventMovementTimer
_08063A0C: .4byte gSecurityHatchLevel
_08063A10: .4byte gEquipment
_08063A14:
	ldrh r1, [r2]
	cmp r1, #0
	bne _08063A2C
	ldr r0, _08063A28 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _08063A24
	b _08063C2A
_08063A24:
	movs r0, #0x6a
	b _08063AF2
	.align 2, 0
_08063A28: .4byte gPreventMovementTimer
_08063A2C:
	cmp r1, #1
	beq _08063A32
	b _08063C2A
_08063A32:
	ldr r0, _08063A50 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08063A3C
	b _08063C2A
_08063A3C:
	movs r0, #0x6b
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	ldr r0, _08063A54 @ =0x03004FC8
	ldr r1, _08063A58 @ =gCurrentRoomEntry
	ldrb r1, [r1, #0x1b]
_08063A4A:
	strb r1, [r0]
	movs r6, #2
	b _08063C2E
	.align 2, 0
_08063A50: .4byte gPreventMovementTimer
_08063A54: .4byte 0x03004FC8
_08063A58: .4byte gCurrentRoomEntry
_08063A5C:
	ldrh r0, [r2]
	cmp r0, #0
	bne _08063A76
	movs r0, #0x14
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	movs r0, #0x1e
	movs r1, #1
	bl ScreenShakeStartHorizontal
	movs r6, #1
	b _08063C2E
_08063A76:
	cmp r0, #1
	beq _08063A7C
	b _08063C2A
_08063A7C:
	ldrh r0, [r2, #2]
	cmp r0, #0x14
	bhi _08063A84
	b _08063C2A
_08063A84:
	movs r0, #0x15
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	movs r6, #2
	b _08063C2E
_08063A90:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _08063A98
	b _08063C2A
_08063A98:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #4
_08063A9E:
	bl RoomEffectFade
	cmp r0, #0
	bne _08063AA8
	b _08063C2A
_08063AA8:
	movs r6, #2
	b _08063C2E
_08063AAC:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _08063AB4
	b _08063C2A
_08063AB4:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #5
	bl RoomEffectFade
	cmp r0, #0
	bne _08063AC4
	b _08063C2A
_08063AC4:
	ldr r2, _08063AD8 @ =0x03004E44
	ldrb r1, [r2]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
_08063AD4:
	movs r6, #3
	b _08063C2E
	.align 2, 0
_08063AD8: .4byte 0x03004E44
_08063ADC:
	ldrh r0, [r2]
	cmp r0, #0
	bne _08063B00
	movs r0, #0x10
	movs r1, #1
	bl ScreenShakeStartVertical
	ldr r0, _08063AFC @ =0x00000233
	bl SoundPlay
	movs r0, #0x5f
_08063AF2:
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	movs r6, #1
	b _08063C2E
	.align 2, 0
_08063AFC: .4byte 0x00000233
_08063B00:
	cmp r0, #1
	bne _08063B10
	ldrh r0, [r2, #2]
	cmp r0, #0xa
	bhi _08063B0C
	b _08063C2A
_08063B0C:
	movs r6, #1
	b _08063C2E
_08063B10:
	ldrh r0, [r2, #2]
	cmp r0, #8
	bhi _08063B18
	b _08063C2A
_08063B18:
	movs r0, #0
	strh r0, [r2, #2]
	movs r0, #6
	bl RoomEffectFade
	b _08063C0C
_08063B24:
	ldr r1, _08063B2C @ =0x03004E3A
	movs r0, #1
	strb r0, [r1]
	b _08063AD4
	.align 2, 0
_08063B2C: .4byte 0x03004E3A
_08063B30:
	ldr r0, _08063B4C @ =gSamusData
	ldrh r1, [r0, #0x18]
	ldr r0, _08063B50 @ =0x00000B3B
	cmp r1, r0
	bls _08063B58
	ldrh r1, [r2, #2]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08063C2A
	ldr r0, _08063B54 @ =0x00000127
	bl SoundPlay
	b _08063C2A
	.align 2, 0
_08063B4C: .4byte gSamusData
_08063B50: .4byte 0x00000B3B
_08063B54: .4byte 0x00000127
_08063B58:
	movs r0, #0
	strh r0, [r2, #2]
	b _08063C2A
_08063B5E:
	ldr r0, _08063B70 @ =gSubEventCounter
	ldrh r0, [r0]
	cmp r0, #0x64
	bne _08063AD4
	movs r0, #0x64
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	b _08063AD4
	.align 2, 0
_08063B70: .4byte gSubEventCounter
_08063B74:
	ldr r0, _08063B8C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x48
	bls _08063C2A
	ldr r2, _08063B90 @ =gIoRegisters
	ldrh r1, [r2]
	ldr r0, _08063B94 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08063B98 @ =gWrittenToDispcnt
	strh r0, [r1]
	b _08063AD4
	.align 2, 0
_08063B8C: .4byte gEventCounter
_08063B90: .4byte gIoRegisters
_08063B94: .4byte 0x0000FEFF
_08063B98: .4byte gWrittenToDispcnt
_08063B9C:
	ldr r0, _08063BBC @ =gSamusPhysics
	ldrb r0, [r0]
	cmp r0, #0x80
	bne _08063BC4
	ldr r0, _08063BC0 @ =0x03004E42
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	bne _08063BD8
	ldrh r0, [r2, #2]
	cmp r0, #0x3c
	bls _08063BE6
	movs r0, #1
	strb r0, [r3]
	b _08063BE4
	.align 2, 0
_08063BBC: .4byte gSamusPhysics
_08063BC0: .4byte 0x03004E42
_08063BC4:
	ldr r0, _08063BE0 @ =0x03004E42
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #0
	beq _08063BE4
	ldrh r0, [r2, #2]
	cmp r0, #0x3c
	bls _08063BE6
	movs r0, #0
	strb r0, [r3]
_08063BD8:
	movs r0, #0
	strh r0, [r2, #2]
	b _08063BE6
	.align 2, 0
_08063BE0: .4byte 0x03004E42
_08063BE4:
	strh r1, [r2, #2]
_08063BE6:
	ldrb r0, [r3]
	movs r1, #0xf
	cmp r0, #1
	bne _08063BF0
	movs r1, #0x1f
_08063BF0:
	ldr r0, _08063C04 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	ands r0, r1
	cmp r0, #0
	bne _08063C2A
	movs r0, #7
	bl RoomEffectFade
	b _08063C2A
	.align 2, 0
_08063C04: .4byte gFrameCounter8Bit
_08063C08:
	bl ProcessOperationsRoomEffect
_08063C0C:
	cmp r0, #0
	beq _08063C2A
	b _08063AD4
_08063C12:
	bl ProcessOmegaMetroidRoomEffect
	b _08063C2A
_08063C18:
	bl RecoveringSuitCutscene
	cmp r0, #0
	beq _08063C2A
	ldr r0, _08063C4C @ =0x0300002B
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08063C50 @ =gCurrentEventBasedEffect
	strb r1, [r0]
_08063C2A:
	cmp r6, #0
	beq _08063C82
_08063C2E:
	cmp r6, #2
	bne _08063C5C
	ldr r1, _08063C54 @ =gDoorUnlockTimer
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08063C40
	movs r0, #1
	strb r0, [r1]
_08063C40:
	ldr r1, _08063C50 @ =gCurrentEventBasedEffect
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, _08063C58 @ =0x03004FA0
	movs r0, #0
	b _08063C7A
	.align 2, 0
_08063C4C: .4byte 0x0300002B
_08063C50: .4byte gCurrentEventBasedEffect
_08063C54: .4byte gDoorUnlockTimer
_08063C58: .4byte 0x03004FA0
_08063C5C:
	cmp r6, #3
	bne _08063C74
	ldr r1, _08063C6C @ =gCurrentEventBasedEffect
	movs r0, #0x80
	strb r0, [r1]
	ldr r1, _08063C70 @ =0x03004FA0
	movs r0, #0
	b _08063C7A
	.align 2, 0
_08063C6C: .4byte gCurrentEventBasedEffect
_08063C70: .4byte 0x03004FA0
_08063C74:
	ldr r1, _08063C88 @ =0x03004FA0
	ldrh r0, [r1]
	adds r0, #1
_08063C7A:
	strh r0, [r1]
	adds r2, r1, #0
	movs r0, #0
	strh r0, [r2, #2]
_08063C82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08063C88: .4byte 0x03004FA0

	thumb_func_start CheckUnlockHatches
CheckUnlockHatches: @ 0x08063C8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r2, _08063D1C @ =gDoorUnlockTimer
	ldrb r0, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	cmp r1, #0
	ble _08063D2C
	subs r0, #1
	strb r0, [r2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08063D34
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r1, #0
	strb r0, [r2]
	ldr r0, _08063D20 @ =0x03004E3B
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _08063D34
	ldr r0, _08063D24 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08063D34
	movs r6, #0
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0xf
	rsbs r1, r1, #0
	mov r8, r1
	ldr r3, _08063D28 @ =gHatchData
	subs r0, #1
	mov ip, r0
_08063CD8:
	ldrb r4, [r3]
	lsls r0, r4, #0x1f
	cmp r0, #0
	beq _08063D12
	ldrb r2, [r3, #1]
	lsls r0, r2, #0x1d
	cmp r0, #0
	bge _08063D12
	ldrb r0, [r7]
	asrs r0, r6
	movs r5, #1
	ands r0, r5
	cmp r0, #0
	beq _08063D12
	mov r1, sb
	ands r1, r2
	movs r0, #1
	orrs r1, r0
	mov r0, r8
	ands r0, r4
	strb r0, [r3]
	mov r0, ip
	ands r1, r0
	strb r1, [r3, #1]
	adds r0, r5, #0
	lsls r0, r6
	ldrb r1, [r7]
	eors r0, r1
	strb r0, [r7]
_08063D12:
	adds r3, #4
	adds r6, #1
	cmp r6, #5
	ble _08063CD8
	b _08063D34
	.align 2, 0
_08063D1C: .4byte gDoorUnlockTimer
_08063D20: .4byte 0x03004E3B
_08063D24: .4byte gCurrentNavigationRoom
_08063D28: .4byte gHatchData
_08063D2C:
	cmp r1, #0
	bge _08063D34
	bl CheckUnlockProximityHatches
_08063D34:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CheckHatchLockEvents
CheckHatchLockEvents: @ 0x08063D40
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	movs r4, #0
	ldr r6, _08063D70 @ =gEventCounter
	ldr r7, _08063D74 @ =0x083C8A5C
	ldrb r3, [r6]
	adds r2, r7, #0
_08063D4E:
	ldrb r0, [r2]
	cmp r3, r0
	bne _08063D80
	ldr r0, _08063D78 @ =gCurrentArea
	ldrb r0, [r0]
	ldrb r1, [r2, #1]
	cmp r0, r1
	bne _08063D84
	ldr r0, _08063D7C @ =gCurrentRoom
	ldrb r1, [r0]
	ldrb r0, [r2, #2]
	subs r0, #1
	cmp r1, r0
	bne _08063D84
	movs r5, #1
	b _08063D90
	.align 2, 0
_08063D70: .4byte gEventCounter
_08063D74: .4byte 0x083C8A5C
_08063D78: .4byte gCurrentArea
_08063D7C: .4byte gCurrentRoom
_08063D80:
	cmp r3, r0
	blo _08063D8C
_08063D84:
	adds r2, #4
	adds r4, #1
	cmp r4, #0x4a
	bls _08063D4E
_08063D8C:
	cmp r5, #0
	beq _08063DDA
_08063D90:
	movs r1, #1
	ldr r0, _08063DE4 @ =0x03000014
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08063DAA
	ldrb r0, [r6]
	cmp r0, #0x62
	bls _08063DAA
	cmp r0, #0x64
	bhi _08063DAA
	movs r1, #0
_08063DAA:
	cmp r1, #0
	beq _08063DDA
	lsls r0, r4, #2
	adds r0, r0, r7
	ldrb r2, [r0, #3]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #2
	ands r1, r2
	orrs r0, r1
	movs r1, #4
	ands r1, r2
	orrs r0, r1
	movs r1, #8
	ands r1, r2
	orrs r0, r1
	movs r1, #0x10
	ands r1, r2
	orrs r0, r1
	movs r1, #0x20
	ands r1, r2
	orrs r0, r1
	bl LockHatches
_08063DDA:
	adds r0, r5, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08063DE4: .4byte 0x03000014

	thumb_func_start CheckLockHatchesWithTimer
CheckLockHatchesWithTimer: @ 0x08063DE8
	push {lr}
	movs r0, #0x3f
	bl LockHatchesWithTimer
	ldr r1, _08063DFC @ =0x03000047
	movs r0, #2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_08063DFC: .4byte 0x03000047

	thumb_func_start CheckUnlockProximityHatches
CheckUnlockProximityHatches: @ 0x08063E00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _08063E58 @ =gFrameCounter8Bit
	ldrb r0, [r0]
	movs r1, #7
	mov ip, r1
	mov r2, ip
	ands r2, r0
	mov ip, r2
	cmp r2, #5
	bgt _08063ED2
	ldr r0, _08063E5C @ =gHatchData
	lsls r2, r2, #2
	adds r3, r2, r0
	ldrb r4, [r3]
	lsls r1, r4, #0x1f
	mov sl, r0
	mov r8, r2
	cmp r1, #0
	beq _08063ED2
	ldrb r0, [r3, #1]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _08063ED2
	ldr r0, _08063E60 @ =0x03004E3B
	ldrb r1, [r0]
	mov r2, ip
	asrs r1, r2
	movs r2, #1
	ands r1, r2
	cmp r1, #0
	beq _08063ED2
	movs r0, #0
	mov sb, r0
	ldrb r3, [r3, #2]
	adds r5, r3, #0
	lsls r0, r4, #0x1b
	cmp r0, #0
	bge _08063E64
	adds r3, #2
	b _08063E66
	.align 2, 0
_08063E58: .4byte gFrameCounter8Bit
_08063E5C: .4byte gHatchData
_08063E60: .4byte 0x03004E3B
_08063E64:
	subs r5, r3, #2
_08063E66:
	mov r0, r8
	add r0, sl
	ldrb r0, [r0, #3]
	subs r6, r0, #1
	adds r7, r0, #4
	ldr r2, _08063EE0 @ =gSamusData
	ldrh r0, [r2, #0x16]
	lsrs r4, r0, #6
	movs r1, #0x26
	ldrsh r0, [r2, r1]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, #1
	ldrh r2, [r2, #0x18]
	adds r0, r0, r2
	asrs r0, r0, #6
	cmp r4, r5
	blt _08063E9C
	cmp r3, r4
	blt _08063E9C
	cmp r0, r6
	blt _08063E9C
	cmp r7, r0
	blt _08063E9C
	movs r2, #1
	mov sb, r2
_08063E9C:
	mov r0, sb
	cmp r0, #0
	beq _08063ED2
	mov r3, r8
	add r3, sl
	ldrb r0, [r3, #1]
	movs r1, #4
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	ldrb r2, [r3]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	strb r0, [r3]
	movs r0, #5
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r3, #1]
	movs r0, #1
	mov r1, ip
	lsls r0, r1
	ldr r2, _08063EE4 @ =0x03004E3B
	ldrb r1, [r2]
	eors r0, r1
	strb r0, [r2]
_08063ED2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08063EE0: .4byte gSamusData
_08063EE4: .4byte 0x03004E3B

	thumb_func_start RecoveringSuitCutscene
RecoveringSuitCutscene: @ 0x08063EE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r0, #0
	mov sb, r0
	movs r5, #0
	ldr r2, _08063F0C @ =gSamusData
	ldrh r1, [r2, #0x16]
	ldr r0, _08063F10 @ =gBg1XPosition
	ldrh r0, [r0]
	subs r1, r1, r0
	adds r6, r2, #0
	cmp r1, #0
	bge _08063F14
	movs r3, #0
	b _08063F20
	.align 2, 0
_08063F0C: .4byte gSamusData
_08063F10: .4byte gBg1XPosition
_08063F14:
	movs r0, #0xee
	lsls r0, r0, #2
	asrs r3, r1, #2
	cmp r1, r0
	ble _08063F20
	movs r3, #0xee
_08063F20:
	adds r1, r3, #2
	mov r8, r1
	ldrh r0, [r6, #0x18]
	adds r4, r0, #0
	subs r4, #0x60
	ldr r0, _08063F38 @ =gBg1YPosition
	ldrh r0, [r0]
	subs r1, r4, r0
	cmp r1, #0
	bge _08063F3C
	movs r7, #0
	b _08063F48
	.align 2, 0
_08063F38: .4byte gBg1YPosition
_08063F3C:
	movs r0, #0x9e
	lsls r0, r0, #2
	asrs r7, r1, #2
	cmp r1, r0
	ble _08063F48
	movs r7, #0x9e
_08063F48:
	adds r4, r7, #2
	ldr r0, _08063F74 @ =gWindow1Border
	ldrb r2, [r0, #4]
	adds r1, r2, #0
	mov ip, r0
	cmp r1, #0xff
	beq _08063F5C
	adds r0, r2, #1
	mov r2, ip
	strb r0, [r2, #4]
_08063F5C:
	ldr r0, _08063F78 @ =0x03004FA0
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0x13
	bls _08063F68
	b _0806441E
_08063F68:
	lsls r0, r1, #2
	ldr r1, _08063F7C @ =_08063F80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063F74: .4byte gWindow1Border
_08063F78: .4byte 0x03004FA0
_08063F7C: .4byte _08063F80
_08063F80: @ jump table
	.4byte _08063FD0 @ case 0
	.4byte _08063FE0 @ case 1
	.4byte _08063FFC @ case 2
	.4byte _08064048 @ case 3
	.4byte _08064084 @ case 4
	.4byte _080640B4 @ case 5
	.4byte _080640E8 @ case 6
	.4byte _080640F2 @ case 7
	.4byte _0806414C @ case 8
	.4byte _0806418A @ case 9
	.4byte _08064208 @ case 10
	.4byte _080641C8 @ case 11
	.4byte _08064208 @ case 12
	.4byte _08064212 @ case 13
	.4byte _08064274 @ case 14
	.4byte _080642DC @ case 15
	.4byte _0806435C @ case 16
	.4byte _0806438C @ case 17
	.4byte _080643A0 @ case 18
	.4byte _08064414 @ case 19
_08063FD0:
	ldr r0, _08063FDC @ =gPoseLock
	ldrb r0, [r0]
	cmp r0, #2
	beq _08063FDA
	b _0806441E
_08063FDA:
	b _08064422
	.align 2, 0
_08063FDC: .4byte gPoseLock
_08063FE0:
	ldr r1, _08063FF0 @ =gWrittenToBldalpha_L
	ldr r2, _08063FF4 @ =gIoRegisters
	ldrb r0, [r2, #5]
	strh r0, [r1]
	ldr r1, _08063FF8 @ =gWrittenToBldalpha_R
	ldrb r0, [r2, #4]
	strh r0, [r1]
	b _08064422
	.align 2, 0
_08063FF0: .4byte gWrittenToBldalpha_L
_08063FF4: .4byte gIoRegisters
_08063FF8: .4byte gWrittenToBldalpha_R
_08063FFC:
	ldrh r1, [r2, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08064008
	b _0806441E
_08064008:
	ldr r0, _08064024 @ =gWrittenToBldalpha_L
	ldrh r2, [r0]
	adds r6, r0, #0
	cmp r2, #0x10
	beq _08064028
	adds r0, r2, #1
	strh r0, [r6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bls _0806402A
	movs r0, #0x10
	strh r0, [r6]
	b _0806402A
	.align 2, 0
_08064024: .4byte gWrittenToBldalpha_L
_08064028:
	adds r5, #1
_0806402A:
	ldr r0, _08064044 @ =gWrittenToBldalpha_R
	ldrh r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _08064036
	b _080643FC
_08064036:
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0
	blt _08064040
	b _080643EC
_08064040:
	movs r0, #0
	b _080643EC
	.align 2, 0
_08064044: .4byte gWrittenToBldalpha_R
_08064048:
	ldr r2, _08064068 @ =gWrittenToDispcnt
	ldr r0, _0806406C @ =gIoRegisters
	ldrh r1, [r0]
	ldr r0, _08064070 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08064074 @ =0x040000D4
	ldr r0, _08064078 @ =0x06000800
	str r0, [r1]
	ldr r0, _0806407C @ =0x0201C000
	str r0, [r1, #4]
	ldr r0, _08064080 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08064422
	.align 2, 0
_08064068: .4byte gWrittenToDispcnt
_0806406C: .4byte gIoRegisters
_08064070: .4byte 0x0000FEFF
_08064074: .4byte 0x040000D4
_08064078: .4byte 0x06000800
_0806407C: .4byte 0x0201C000
_08064080: .4byte 0x80000400
_08064084:
	mov r1, sp
	ldr r3, _080640A4 @ =0x000090C0
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _080640A8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080640AC @ =0x06000800
	str r0, [r1, #4]
	ldr r0, _080640B0 @ =0x81000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xcc
	movs r2, #0x82
	lsls r2, r2, #1
	b _080641F0
	.align 2, 0
_080640A4: .4byte 0x000090C0
_080640A8: .4byte 0x040000D4
_080640AC: .4byte 0x06000800
_080640B0: .4byte 0x81000400
_080640B4:
	movs r3, #0x26
	ldrsh r0, [r6, r3]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r6, #0x18]
	adds r0, r0, r1
	ldrh r1, [r6, #0x16]
	movs r2, #0x41
	bl ParticleSet
	movs r2, #0x26
	ldrsh r0, [r6, r2]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r3, [r6, #0x18]
	adds r0, r0, r3
	ldrh r1, [r6, #0x16]
	movs r2, #0x42
	bl ParticleSet
	movs r0, #0x4d
	bl unk_3b1c
	b _08064422
_080640E8:
	ldrh r0, [r2, #2]
	cmp r0, #0x1e
	bhi _080640F0
	b _0806441E
_080640F0:
	b _08064422
_080640F2:
	ldr r1, _08064128 @ =gWrittenToDispcnt
	ldr r0, _0806412C @ =gIoRegisters
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08064130 @ =gWrittenToWinin_L
	movs r0, #0x3f
	strb r0, [r1]
	ldr r1, _08064134 @ =gWrittenToWinout_R
	movs r0, #0x1e
	strb r0, [r1]
	ldr r1, _08064138 @ =gWrittenToBldalpha
	ldr r2, _0806413C @ =0x00000808
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _08064140 @ =gWrittenToBldcnt_Special
	ldr r2, _08064144 @ =0x00003F41
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08064148 @ =gWindow1Border
	movs r1, #0
	strb r3, [r0]
	mov r3, r8
	strb r3, [r0, #1]
	strb r7, [r0, #2]
	strb r4, [r0, #3]
	strb r1, [r0, #4]
	b _08064422
	.align 2, 0
_08064128: .4byte gWrittenToDispcnt
_0806412C: .4byte gIoRegisters
_08064130: .4byte gWrittenToWinin_L
_08064134: .4byte gWrittenToWinout_R
_08064138: .4byte gWrittenToBldalpha
_0806413C: .4byte 0x00000808
_08064140: .4byte gWrittenToBldcnt_Special
_08064144: .4byte 0x00003F41
_08064148: .4byte gWindow1Border
_0806414C:
	movs r1, #4
	mov r2, ip
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _08064168
	cmp r0, #4
	ble _08064160
	subs r0, #4
	strb r0, [r2, #2]
	b _0806416A
_08064160:
	movs r0, #0
	mov r3, ip
	strb r0, [r3, #2]
	b _0806416A
_08064168:
	adds r5, #1
_0806416A:
	mov r2, ip
	ldrb r0, [r2, #3]
	cmp r0, #0x9f
	bhi _08064186
	adds r0, r0, r1
	strb r0, [r2, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa0
	bhi _08064180
	b _0806440A
_08064180:
	movs r0, #0xa0
	strb r0, [r2, #3]
	b _0806440A
_08064186:
	adds r5, #1
	b _0806440A
_0806418A:
	movs r1, #7
	mov r3, ip
	ldrb r0, [r3]
	cmp r0, #0
	beq _080641A6
	cmp r0, #7
	ble _0806419E
	subs r0, #7
	strb r0, [r3]
	b _080641A8
_0806419E:
	movs r0, #0
	mov r2, ip
	strb r0, [r2]
	b _080641A8
_080641A6:
	adds r5, #1
_080641A8:
	mov r3, ip
	ldrb r0, [r3, #1]
	cmp r0, #0xef
	bhi _080641C4
	adds r0, r0, r1
	strb r0, [r3, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf0
	bhi _080641BE
	b _0806440A
_080641BE:
	movs r0, #0xf0
	strb r0, [r3, #1]
	b _0806440A
_080641C4:
	adds r5, #1
	b _0806440A
_080641C8:
	ldr r0, _080641F8 @ =gEventCounter
	ldrb r0, [r0]
	movs r5, #8
	cmp r0, #0x33
	beq _080641DA
	movs r5, #0
	cmp r0, #0x51
	bne _080641DA
	movs r5, #0xe
_080641DA:
	ldr r2, _080641FC @ =gEquipment
	ldr r1, _08064200 @ =0x08575FB4
	lsls r0, r5, #3
	adds r0, r0, r1
	ldrb r1, [r2, #0xc]
	ldrb r0, [r0, #2]
	orrs r1, r0
	strb r1, [r2, #0xc]
	ldr r1, _08064204 @ =gPreventMovementTimer
	movs r2, #0xfa
	lsls r2, r2, #2
_080641F0:
	adds r0, r2, #0
	strh r0, [r1]
	b _08064422
	.align 2, 0
_080641F8: .4byte gEventCounter
_080641FC: .4byte gEquipment
_08064200: .4byte 0x08575FB4
_08064204: .4byte gPreventMovementTimer
_08064208:
	ldrh r0, [r2, #2]
	cmp r0, #5
	bhi _08064210
	b _0806441E
_08064210:
	b _08064422
_08064212:
	ldr r6, _08064248 @ =gWindow1Border
	ldrb r1, [r6, #2]
	subs r1, r7, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r6, #3]
	subs r2, r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	bl CalculateSuitFlashOffset
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0xff
	ands r2, r0
	lsrs r0, r0, #8
	ldrb r1, [r6, #2]
	cmp r1, r7
	bge _0806424C
	adds r0, r1, r0
	strb r0, [r6, #2]
	ldrb r0, [r6, #2]
	cmp r0, r7
	ble _0806424E
	strb r7, [r6, #2]
	b _0806424E
	.align 2, 0
_08064248: .4byte gWindow1Border
_0806424C:
	adds r5, #1
_0806424E:
	ldr r0, _0806426C @ =gWindow1Border
	ldrb r1, [r0, #3]
	mov ip, r0
	cmp r1, r4
	ble _08064270
	subs r0, r1, r2
	mov r3, ip
	strb r0, [r3, #3]
	ldrb r0, [r3, #3]
	cmp r0, r4
	blt _08064266
	b _0806440A
_08064266:
	strb r4, [r3, #3]
	b _0806440A
	.align 2, 0
_0806426C: .4byte gWindow1Border
_08064270:
	adds r5, #1
	b _0806440A
_08064274:
	ldr r4, _080642B0 @ =gWindow1Border
	ldrb r1, [r4]
	subs r1, r3, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r2, [r4, #1]
	mov r0, r8
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #9
	str r3, [sp, #4]
	bl CalculateSuitFlashOffset
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0xff
	ands r2, r0
	lsrs r0, r0, #8
	ldrb r1, [r4]
	ldr r3, [sp, #4]
	cmp r1, r3
	bge _080642B4
	adds r0, r1, r0
	strb r0, [r4]
	ldrb r0, [r4]
	cmp r0, r3
	ble _080642B6
	strb r3, [r4]
	b _080642B6
	.align 2, 0
_080642B0: .4byte gWindow1Border
_080642B4:
	adds r5, #1
_080642B6:
	ldr r0, _080642D4 @ =gWindow1Border
	ldrb r1, [r0, #1]
	mov ip, r0
	cmp r1, r8
	ble _080642D8
	subs r0, r1, r2
	mov r1, ip
	strb r0, [r1, #1]
	ldrb r0, [r1, #1]
	cmp r0, r8
	blt _080642CE
	b _0806440A
_080642CE:
	mov r2, r8
	strb r2, [r1, #1]
	b _0806440A
	.align 2, 0
_080642D4: .4byte gWindow1Border
_080642D8:
	adds r5, #1
	b _0806440A
_080642DC:
	ldr r3, _0806432C @ =gWrittenToDispcnt
	ldr r2, _08064330 @ =gIoRegisters
	ldrh r1, [r2]
	ldr r0, _08064334 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r3]
	ldr r1, _08064338 @ =gWrittenToWinout_R
	ldrb r0, [r2, #7]
	strb r0, [r1]
	ldr r1, _0806433C @ =gWrittenToWinin_L
	ldrb r0, [r2, #6]
	strb r0, [r1]
	ldr r3, _08064340 @ =gWrittenToBldalpha
	ldr r0, _08064344 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08064348 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0806434C @ =gWrittenToBldcnt_Special
	ldrh r0, [r2, #2]
	strh r0, [r1]
	ldr r1, _08064350 @ =gWindow1Border
	movs r2, #0
	strb r2, [r1]
	movs r0, #0xf0
	strb r0, [r1, #1]
	strb r2, [r1, #2]
	movs r0, #0xa0
	strb r0, [r1, #3]
	ldr r0, _08064354 @ =gPoseLock
	strb r2, [r0]
	ldr r1, _08064358 @ =gPreventMovementTimer
	movs r3, #0xfa
	lsls r3, r3, #2
	adds r0, r3, #0
	strh r0, [r1]
	b _08064422
	.align 2, 0
_0806432C: .4byte gWrittenToDispcnt
_08064330: .4byte gIoRegisters
_08064334: .4byte 0x0000FEFF
_08064338: .4byte gWrittenToWinout_R
_0806433C: .4byte gWrittenToWinin_L
_08064340: .4byte gWrittenToBldalpha
_08064344: .4byte gWrittenToBldalpha_L
_08064348: .4byte gWrittenToBldalpha_R
_0806434C: .4byte gWrittenToBldcnt_Special
_08064350: .4byte gWindow1Border
_08064354: .4byte gPoseLock
_08064358: .4byte gPreventMovementTimer
_0806435C:
	ldr r1, _08064378 @ =0x040000D4
	ldr r0, _0806437C @ =0x0201C000
	str r0, [r1]
	ldr r0, _08064380 @ =0x06000800
	str r0, [r1, #4]
	ldr r0, _08064384 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xcc
	ldr r0, _08064388 @ =gIoRegisters
	ldrh r0, [r0, #8]
	strh r0, [r1]
	b _08064422
	.align 2, 0
_08064378: .4byte 0x040000D4
_0806437C: .4byte 0x0201C000
_08064380: .4byte 0x06000800
_08064384: .4byte 0x80000400
_08064388: .4byte gIoRegisters
_0806438C:
	ldr r0, _08064398 @ =gWrittenToDispcnt
	ldr r1, _0806439C @ =gIoRegisters
	ldrh r1, [r1]
	strh r1, [r0]
	b _08064422
	.align 2, 0
_08064398: .4byte gWrittenToDispcnt
_0806439C: .4byte gIoRegisters
_080643A0:
	ldrh r1, [r2, #2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0806441E
	ldr r0, _080643C4 @ =gWrittenToBldalpha_L
	ldr r1, _080643C8 @ =gIoRegisters
	ldrh r4, [r0]
	adds r3, r4, #0
	ldrb r2, [r1, #5]
	adds r6, r0, #0
	cmp r3, r2
	beq _080643D6
	cmp r3, r2
	bls _080643CC
	subs r0, r4, #1
	strh r0, [r6]
	b _080643D8
	.align 2, 0
_080643C4: .4byte gWrittenToBldalpha_L
_080643C8: .4byte gIoRegisters
_080643CC:
	cmp r3, r2
	bhs _080643D8
	adds r0, r4, #1
	strh r0, [r6]
	b _080643D8
_080643D6:
	adds r5, #1
_080643D8:
	ldr r0, _080643F0 @ =gWrittenToBldalpha_R
	ldrh r2, [r0]
	adds r3, r2, #0
	ldrb r1, [r1, #4]
	adds r4, r0, #0
	cmp r3, r1
	beq _080643FC
	cmp r3, r1
	bls _080643F4
	subs r0, r2, #1
_080643EC:
	strh r0, [r4]
	b _080643FE
	.align 2, 0
_080643F0: .4byte gWrittenToBldalpha_R
_080643F4:
	cmp r3, r1
	bhs _080643FE
	adds r0, r2, #1
	b _080643EC
_080643FC:
	adds r5, #1
_080643FE:
	ldr r0, _08064410 @ =gWrittenToBldalpha
	ldrh r1, [r6]
	lsls r1, r1, #8
	ldrh r2, [r4]
	orrs r1, r2
	strh r1, [r0]
_0806440A:
	asrs r5, r5, #1
	b _0806441E
	.align 2, 0
_08064410: .4byte gWrittenToBldalpha
_08064414:
	ldr r1, _0806445C @ =gPreventMovementTimer
	movs r0, #0
	strh r0, [r1]
	movs r0, #1
	mov sb, r0
_0806441E:
	cmp r5, #0
	beq _08064432
_08064422:
	ldr r0, _08064460 @ =0x03004FA0
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	strh r1, [r0]
	strh r2, [r0, #2]
	ldr r1, _08064464 @ =gWindow1Border
	mov ip, r1
_08064432:
	ldr r2, _08064468 @ =gWrittenToWin1H
	mov r3, ip
	ldrb r1, [r3]
	lsls r1, r1, #8
	ldrb r0, [r3, #1]
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0806446C @ =gWrittenToWin1V
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	ldrb r0, [r3, #3]
	orrs r0, r1
	strh r0, [r2]
	mov r0, sb
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0806445C: .4byte gPreventMovementTimer
_08064460: .4byte 0x03004FA0
_08064464: .4byte gWindow1Border
_08064468: .4byte gWrittenToWin1H
_0806446C: .4byte gWrittenToWin1V

	thumb_func_start CalculateSuitFlashOffset
CalculateSuitFlashOffset: @ 0x08064470
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r3, r1, #0
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x18
	adds r5, r0, #0
	movs r6, #0
	movs r2, #0
	cmp r1, r0
	bls _0806449C
	subs r1, r1, r4
	cmp r0, r1
	ble _08064498
	subs r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
_08064498:
	adds r6, r4, #0
	b _080644B4
_0806449C:
	cmp r3, r5
	bhs _080644B0
	subs r0, r5, r4
	cmp r3, r0
	ble _080644AC
	subs r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_080644AC:
	adds r2, r4, #0
	b _080644B4
_080644B0:
	adds r2, r7, #0
	adds r6, r2, #0
_080644B4:
	lsls r0, r6, #8
	orrs r0, r2
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProcessOperationsRoomEffect
ProcessOperationsRoomEffect: @ 0x080644C0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _080644D8 @ =0x03004FA0
	ldrh r1, [r4]
	cmp r1, #1
	beq _08064500
	cmp r1, #1
	bgt _080644DC
	cmp r1, #0
	beq _080644E2
	b _08064540
	.align 2, 0
_080644D8: .4byte 0x03004FA0
_080644DC:
	cmp r1, #2
	beq _08064530
	b _08064540
_080644E2:
	ldr r0, _080644FC @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08064540
	movs r0, #0x9a
	movs r1, #0xb
	bl SetSubEventAndUpdateMusic
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _08064540
	.align 2, 0
_080644FC: .4byte gPreventMovementTimer
_08064500:
	ldr r0, _08064524 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	bne _08064540
	ldr r0, _08064528 @ =0x03004E18
	strb r1, [r0, #2]
	movs r0, #0xf0
	movs r1, #1
	bl ScreenShakeStartHorizontal
	ldr r0, _0806452C @ =0x00000242
	bl SoundPlay
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	strh r5, [r4, #2]
	b _08064540
	.align 2, 0
_08064524: .4byte gPreventMovementTimer
_08064528: .4byte 0x03004E18
_0806452C: .4byte 0x00000242
_08064530:
	ldrh r0, [r4, #2]
	cmp r0, #0xef
	bls _08064540
	movs r0, #0xf0
	movs r1, #0
	bl ScreenShakeStartHorizontal
	movs r5, #1
_08064540:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start ProcessOmegaMetroidRoomEffect
ProcessOmegaMetroidRoomEffect: @ 0x08064548
	push {lr}
	ldr r0, _080645A8 @ =0x03004FC0
	ldrb r1, [r0, #2]
	adds r3, r0, #0
	cmp r1, #0
	bne _0806456C
	movs r2, #0
	ldr r0, _080645AC @ =gEscapeTimerDigits
	ldr r1, _080645B0 @ =0x083C8B8A
	ldrb r0, [r0, #4]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bhs _08064564
	movs r2, #1
_08064564:
	cmp r2, #0
	beq _080645A4
	movs r0, #8
	strb r0, [r3, #2]
_0806456C:
	ldrb r0, [r3, #2]
	cmp r0, #7
	bls _0806459E
	movs r1, #0
	strb r1, [r3, #2]
	ldrb r0, [r3, #3]
	adds r0, #1
	strb r0, [r3, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _08064586
	strb r1, [r3, #3]
_08064586:
	ldr r2, _080645B4 @ =0x040000D4
	movs r0, #3
	ldrsb r0, [r3, r0]
	lsls r0, r0, #5
	ldr r1, _080645B8 @ =0x083BF790
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _080645BC @ =0x05000080
	str r0, [r2, #4]
	ldr r0, _080645C0 @ =0x80000010
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0806459E:
	ldrb r0, [r3, #2]
	adds r0, #1
	strb r0, [r3, #2]
_080645A4:
	pop {r0}
	bx r0
	.align 2, 0
_080645A8: .4byte 0x03004FC0
_080645AC: .4byte gEscapeTimerDigits
_080645B0: .4byte 0x083C8B8A
_080645B4: .4byte 0x040000D4
_080645B8: .4byte 0x083BF790
_080645BC: .4byte 0x05000080
_080645C0: .4byte 0x80000010

	thumb_func_start LoadRoom
LoadRoom: @ 0x080645C4
	push {lr}
	bl SetupClipdataCode
	bl RoomResetInfo
	bl LoadRoomEntry
	bl LoadTileset
	bl LoadScrollsAndEventBasedEffects
	bl LoadRoomBackgrounds
	bl RemoveNeverReformBlocksAndCollectedTanks
	ldr r1, _080646A8 @ =gPreviousXPosition
	ldr r2, _080646AC @ =gSamusData
	ldrh r0, [r2, #0x16]
	strh r0, [r1]
	ldr r1, _080646B0 @ =gPreviousYPosition
	ldrh r0, [r2, #0x18]
	strh r0, [r1]
	bl TransparencySetRoomEffectsTransparency
	ldr r0, _080646B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064638
	ldr r0, _080646B8 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064638
	bl ProcessGeneralScrolling
	ldr r1, _080646BC @ =gBg1YPosition
	ldr r2, _080646C0 @ =0x03000124
	ldrh r0, [r2, #4]
	strh r0, [r1]
	ldr r1, _080646C4 @ =gBg1XPosition
	ldrh r0, [r2]
	strh r0, [r1]
	bl unk_6a7b4
	bl ProcessGeneralScrolling
	ldr r0, _080646C8 @ =gCurrentRoomEntry
	ldrb r0, [r0, #1]
	cmp r0, #0x44
	bne _08064638
	ldr r1, _080646CC @ =0x03001224
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
_08064638:
	bl UpdateBackgroundsPosition
	bl LoadDoors
	movs r0, #0
	bl SetupInitialTilemap
	movs r0, #1
	bl SetupInitialTilemap
	movs r0, #2
	bl SetupInitialTilemap
	bl unk_6b890
	bl LoadAnimatedGraphics
	bl ResetTankAnimations
	bl HazeSetBackgroundEffect
	bl HazeProcess
	bl MinimapCheckOnTransition
	bl CheckSetCurrentEventBasedEffect
	ldr r0, _080646B8 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080646E0
	ldr r0, _080646D0 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080646E0
	ldr r0, _080646B4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080646E0
	ldr r0, _080646AC @ =gSamusData
	ldrb r1, [r0, #1]
	adds r2, r0, #0
	cmp r1, #0x17
	bne _080646E0
	ldrh r0, [r2, #0x14]
	cmp r0, #0x40
	bne _080646D4
	ldrh r0, [r2, #0x18]
	adds r0, #0xc0
	b _080646D8
	.align 2, 0
_080646A8: .4byte gPreviousXPosition
_080646AC: .4byte gSamusData
_080646B0: .4byte gPreviousYPosition
_080646B4: .4byte gPauseScreenFlag
_080646B8: .4byte gIsLoadingFile
_080646BC: .4byte gBg1YPosition
_080646C0: .4byte 0x03000124
_080646C4: .4byte gBg1XPosition
_080646C8: .4byte gCurrentRoomEntry
_080646CC: .4byte 0x03001224
_080646D0: .4byte gUnk_03000be3
_080646D4:
	ldrh r0, [r2, #0x18]
	subs r0, #0xc0
_080646D8:
	strh r0, [r2, #0x18]
	ldr r1, _080646E4 @ =gPreviousYPosition
	ldrh r0, [r2, #0x18]
	strh r0, [r1]
_080646E0:
	pop {r0}
	bx r0
	.align 2, 0
_080646E4: .4byte gPreviousYPosition

	thumb_func_start LoadTileset
LoadTileset: @ 0x080646E8
	push {r4, r5, r6, lr}
	sub sp, #0x1c
	ldr r2, _0806471C @ =0x083BF888
	ldr r0, _08064720 @ =gCurrentRoomEntry
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r1, sp, #4
	adds r0, r0, r2
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	ldr r1, _08064724 @ =gTilemapAndClipPointers
	ldr r0, [sp, #0x10]
	adds r0, #2
	str r0, [r1]
	ldr r0, _08064728 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bls _08064734
	ldr r0, _0806472C @ =0x083F08E4
	str r0, [r1, #4]
	ldr r0, _08064730 @ =0x083F1348
	b _0806473A
	.align 2, 0
_0806471C: .4byte 0x083BF888
_08064720: .4byte gCurrentRoomEntry
_08064724: .4byte gTilemapAndClipPointers
_08064728: .4byte gCurrentArea
_0806472C: .4byte 0x083F08E4
_08064730: .4byte 0x083F1348
_08064734:
	ldr r0, _080647DC @ =0x083F0834
	str r0, [r1, #4]
	ldr r0, _080647E0 @ =0x083F11E8
_0806473A:
	str r0, [r1, #8]
	ldr r0, [sp, #4]
	ldr r1, _080647E4 @ =0x06005800
	bl CallLZ77UncompVram
	bl WaitForDma3
	ldr r1, _080647E8 @ =0x083F28C8
	ldr r2, _080647EC @ =0x06004800
	movs r3, #0x80
	lsls r3, r3, #5
	movs r0, #0x10
	str r0, [sp]
	movs r0, #3
	bl DmaTransfer
	bl WaitForDma3
	ldr r4, _080647F0 @ =0x040000D4
	ldr r0, [sp, #8]
	str r0, [r4]
	ldr r0, _080647F4 @ =0x05000040
	str r0, [r4, #4]
	ldr r0, _080647F8 @ =0x800000E0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r0, _080647FC @ =0x0840805C
	str r0, [r4]
	movs r6, #0xa0
	lsls r6, r6, #0x13
	str r6, [r4, #4]
	ldr r0, _08064800 @ =0x80000030
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl WaitForDma3
	ldr r1, _08064804 @ =0x03004E28
	ldr r0, [sp, #8]
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r1]
	strh r5, [r6]
	strh r5, [r1, #2]
	ldr r0, [sp, #0xc]
	ldrb r2, [r0, #2]
	lsls r2, r2, #8
	ldrb r1, [r0, #1]
	orrs r2, r1
	ldr r1, _08064808 @ =0x0600FDE0
	subs r1, r1, r2
	bl CallLZ77UncompVram
	str r5, [sp, #0x18]
	add r0, sp, #0x18
	str r0, [r4]
	ldr r0, _0806480C @ =0x0600FFE0
	str r0, [r4, #4]
	ldr r0, _08064810 @ =0x85000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08064814 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080647D4
	ldr r2, _08064818 @ =gCurrentRoomEntry
	add r0, sp, #4
	ldrb r3, [r0, #0x10]
	strb r3, [r2, #0x1a]
	ldrb r1, [r0, #0x11]
	strb r1, [r2, #0x1b]
	ldr r0, _0806481C @ =0x03004FC8
	strb r3, [r0, #1]
	strb r1, [r0]
_080647D4:
	add sp, #0x1c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080647DC: .4byte 0x083F0834
_080647E0: .4byte 0x083F11E8
_080647E4: .4byte 0x06005800
_080647E8: .4byte 0x083F28C8
_080647EC: .4byte 0x06004800
_080647F0: .4byte 0x040000D4
_080647F4: .4byte 0x05000040
_080647F8: .4byte 0x800000E0
_080647FC: .4byte 0x0840805C
_08064800: .4byte 0x80000030
_08064804: .4byte 0x03004E28
_08064808: .4byte 0x0600FDE0
_0806480C: .4byte 0x0600FFE0
_08064810: .4byte 0x85000008
_08064814: .4byte gPauseScreenFlag
_08064818: .4byte gCurrentRoomEntry
_0806481C: .4byte 0x03004FC8

	thumb_func_start LoadRoomEntry
LoadRoomEntry: @ 0x08064820
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r0, _080648A8 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08064832
	b _08064966
_08064832:
	ldr r1, _080648AC @ =0x0879B8BC
	ldr r0, _080648B0 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, _080648B4 @ =gCurrentRoom
	ldrb r2, [r1]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x3c
	bl memcpy
	ldr r1, _080648B8 @ =gCurrentRoomEntry
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r1]
	mov r0, sp
	ldrb r0, [r0, #1]
	strb r0, [r1, #1]
	mov r0, sp
	ldrb r0, [r0, #2]
	strb r0, [r1, #2]
	mov r0, sp
	ldrb r0, [r0, #3]
	strb r0, [r1, #3]
	mov r0, sp
	ldrb r0, [r0, #4]
	strb r0, [r1, #4]
	mov r0, sp
	ldrb r0, [r0, #0x1c]
	strb r0, [r1, #6]
	mov r0, sp
	ldrb r0, [r0, #0x1d]
	strb r0, [r1, #7]
	mov r0, sp
	adds r0, #0x35
	ldrb r0, [r0]
	strb r0, [r1, #0xe]
	mov r0, sp
	adds r0, #0x36
	ldrb r0, [r0]
	strb r0, [r1, #0xf]
	mov r0, sp
	adds r0, #0x37
	ldrb r0, [r0]
	strb r0, [r1, #0x10]
	mov r0, sp
	ldrh r0, [r0, #0x3a]
	strh r0, [r1, #0x16]
	add r2, sp, #0x38
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080648BC
	lsls r2, r0, #6
	b _080648C0
	.align 2, 0
_080648A8: .4byte gPauseScreenFlag
_080648AC: .4byte 0x0879B8BC
_080648B0: .4byte gCurrentArea
_080648B4: .4byte gCurrentRoom
_080648B8: .4byte gCurrentRoomEntry
_080648BC:
	ldr r0, _08064900 @ =0x0000FFFF
	adds r2, r0, #0
_080648C0:
	movs r0, #0
	strh r2, [r1, #0x12]
	ldr r4, _08064904 @ =0x03000054
	strb r0, [r4]
	ldr r1, _08064908 @ =gCurrentRoomEntry
	mov r0, sp
	adds r0, #0x25
	ldrb r0, [r0]
	strb r0, [r1, #0xc]
	mov r0, sp
	adds r0, #0x2d
	ldrb r0, [r0]
	strb r0, [r1, #0xd]
	ldr r2, _0806490C @ =gEventCounter
	ldrb r3, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r5, r1, #0
	cmp r3, r0
	blo _08064914
	cmp r0, #0
	beq _08064914
	ldr r0, [sp, #0x30]
	str r0, [r5, #8]
	ldr r1, _08064910 @ =gSpritesetNumber
	add r0, sp, #0x34
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #2
	strb r0, [r4]
	b _08064944
	.align 2, 0
_08064900: .4byte 0x0000FFFF
_08064904: .4byte 0x03000054
_08064908: .4byte gCurrentRoomEntry
_0806490C: .4byte gEventCounter
_08064910: .4byte gSpritesetNumber
_08064914:
	ldrb r0, [r2]
	ldrb r1, [r5, #0xc]
	cmp r0, r1
	blo _08064938
	cmp r1, #0
	beq _08064938
	ldr r0, [sp, #0x28]
	str r0, [r5, #8]
	ldr r1, _08064934 @ =gSpritesetNumber
	add r0, sp, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	movs r0, #1
	strb r0, [r4]
	b _08064944
	.align 2, 0
_08064934: .4byte gSpritesetNumber
_08064938:
	ldr r0, [sp, #0x20]
	str r0, [r5, #8]
	ldr r1, _08064970 @ =gSpritesetNumber
	add r0, sp, #0x24
	ldrb r0, [r0]
	strb r0, [r1]
_08064944:
	movs r0, #0
	movs r1, #2
	strb r1, [r5, #5]
	strb r0, [r5, #0x14]
	strb r0, [r5, #0x18]
	strb r0, [r5, #0x19]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08064966
	ldrb r0, [r5, #1]
	cmp r0, #0x44
	bne _08064966
	ldr r1, _08064974 @ =gSaXSpawnPosition
	movs r0, #0x80
	lsls r0, r0, #8
	strh r0, [r1]
	strh r0, [r1, #2]
_08064966:
	add sp, #0x3c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064970: .4byte gSpritesetNumber
_08064974: .4byte gSaXSpawnPosition

	thumb_func_start LoadRoomBackgrounds
LoadRoomBackgrounds: @ 0x08064978
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r1, _08064A18 @ =0x0879B8BC
	ldr r4, _08064A1C @ =gCurrentArea
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r5, _08064A20 @ =gCurrentRoom
	ldrb r2, [r5]
	ldr r0, [r0]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0x3c
	bl memcpy
	ldr r0, _08064A24 @ =gEventCounter
	ldrb r0, [r0]
	subs r0, #0x3a
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _080649CA
	ldrb r0, [r4]
	cmp r0, #0
	bne _080649CA
	ldrb r0, [r5]
	subs r0, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bhi _080649CA
	ldr r1, _08064A28 @ =gCurrentRoomEntry
	movs r0, #0x40
	strb r0, [r1, #1]
	ldr r0, _08064A2C @ =0x08412530
	str r0, [sp, #8]
	movs r0, #0x24
	strb r0, [r1, #7]
_080649CA:
	ldr r4, _08064A28 @ =gCurrentRoomEntry
	ldrb r1, [r4, #1]
	movs r5, #0x40
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080649DE
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	strb r0, [r4, #0x18]
_080649DE:
	ldr r1, [sp, #0x18]
	ldrb r0, [r1]
	strb r0, [r4, #0x19]
	adds r3, r1, #4
	ldr r1, _08064A30 @ =0x02032000
	adds r0, r3, #0
	bl CallLZ77UncompVram
	ldrb r1, [r4, #1]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08064A3C
	ldr r3, [sp, #8]
	ldr r1, _08064A34 @ =gBackgroundsData
	ldr r2, _08064A38 @ =0x02029000
	str r2, [r1]
	ldrb r0, [r3]
	strh r0, [r1, #4]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r1, #6]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	b _08064A52
	.align 2, 0
_08064A18: .4byte 0x0879B8BC
_08064A1C: .4byte gCurrentArea
_08064A20: .4byte gCurrentRoom
_08064A24: .4byte gEventCounter
_08064A28: .4byte gCurrentRoomEntry
_08064A2C: .4byte 0x08412530
_08064A30: .4byte 0x02032000
_08064A34: .4byte gBackgroundsData
_08064A38: .4byte 0x02029000
_08064A3C:
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08064A52
	ldr r0, [sp, #8]
	adds r3, r0, #4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r3, #0
	bl CallLZ77UncompVram
_08064A52:
	ldr r0, _08064AC4 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064ABA
	ldr r3, [sp, #0x14]
	ldr r4, _08064AC8 @ =gBackgroundsData
	ldr r2, _08064ACC @ =0x02026000
	str r2, [r4, #0x18]
	ldrb r0, [r3]
	strh r0, [r4, #0x1c]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0x1e]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	ldr r3, [sp, #0xc]
	ldr r2, _08064AD0 @ =0x0202C000
	str r2, [r4, #8]
	ldrb r0, [r3]
	strh r0, [r4, #0xc]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0xe]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
	ldr r0, _08064AD4 @ =gCurrentRoomEntry
	ldrb r1, [r0, #3]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08064ABA
	ldr r3, [sp, #0x10]
	ldr r2, _08064AD8 @ =0x0202F000
	str r2, [r4, #0x10]
	ldrb r0, [r3]
	strh r0, [r4, #0x14]
	adds r3, #1
	ldrb r0, [r3]
	strh r0, [r4, #0x16]
	adds r3, #1
	movs r0, #1
	adds r1, r3, #0
	bl RleDecompress
_08064ABA:
	add sp, #0x3c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08064AC4: .4byte gPauseScreenFlag
_08064AC8: .4byte gBackgroundsData
_08064ACC: .4byte 0x02026000
_08064AD0: .4byte 0x0202C000
_08064AD4: .4byte gCurrentRoomEntry
_08064AD8: .4byte 0x0202F000

	thumb_func_start RemoveNeverReformBlocksAndCollectedTanks
RemoveNeverReformBlocksAndCollectedTanks: @ 0x08064ADC
	push {lr}
	bl RemoveNeverReformBlocks
	bl RemoveCollectedTanks
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start RoomResetInfo
RoomResetInfo: @ 0x08064AEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r3, _08064BC4 @ =gColorFading
	movs r4, #0
	strb r4, [r3, #3]
	strb r4, [r3, #2]
	ldrb r0, [r3, #5]
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3, #5]
	strb r4, [r3, #4]
	strb r4, [r3, #1]
	ldr r2, _08064BC8 @ =gCurrentPowerBomb
	ldrb r0, [r2]
	cmp r0, #0
	beq _08064B1C
	ldr r0, _08064BCC @ =0x030000F4
	ldr r1, _08064BD0 @ =0x083C88C8
	ldr r1, [r1]
	str r1, [r0]
_08064B1C:
	adds r1, r2, #0
	ldr r0, _08064BD4 @ =0x083C88B4
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, _08064BD8 @ =gWrittenToBldcnt
	movs r2, #0
	strh r4, [r0]
	ldr r0, _08064BDC @ =0x03004FCC
	strb r2, [r0]
	ldr r0, _08064BE0 @ =gUnk_03000be3
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	bne _08064BB2
	movs r0, #2
	strb r0, [r3]
	ldr r0, _08064BE4 @ =0x03004DE8
	strh r1, [r0]
	strb r2, [r0, #2]
	ldr r0, _08064BE8 @ =gCurrentClipdataAffectingAction
	strb r2, [r0]
	ldr r1, _08064BEC @ =gPreviousArea
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08064BF0 @ =gDisableDoorsAndTanks
	strb r2, [r0]
	ldr r0, _08064BF4 @ =gCurrentCutscene
	strb r2, [r0]
	ldr r0, _08064BF8 @ =gCurrentNavigationRoom
	strb r2, [r0]
	ldr r0, _08064BFC @ =gElevatorDirection
	strb r2, [r0]
	ldr r0, _08064C00 @ =gIsLoadingFile
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08064B9E
	ldr r4, _08064C04 @ =gPreviousCutscene
	ldr r5, _08064C08 @ =gLastDoorUsed
	ldr r1, _08064C0C @ =gCurrentDemo
	ldr r2, _08064C10 @ =0x03000058
	movs r3, #0
	adds r0, r2, #4
_08064B78:
	strb r3, [r0]
	subs r0, #1
	cmp r0, r2
	bge _08064B78
	movs r0, #0
	strb r0, [r4]
	strb r0, [r5]
	ldrb r1, [r1]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08064B96
	movs r0, #0
	bl DemoLoadRam
_08064B96:
	ldr r0, _08064C14 @ =gAbilityCount
	ldrb r0, [r0]
	bl SetAbilityCount
_08064B9E:
	ldr r1, _08064C18 @ =gDoorPositionStart
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	ldr r1, _08064C1C @ =gSecurityHatchLevel
	ldr r0, _08064C20 @ =gEquipment
	ldrb r0, [r0, #0xd]
	strb r0, [r1]
	bl SramWrite_MostRecentSaveFile
_08064BB2:
	ldr r0, _08064BC4 @ =gColorFading
	ldrb r0, [r0]
	cmp r0, #4
	beq _08064BBE
	cmp r0, #6
	bne _08064C28
_08064BBE:
	ldr r1, _08064C24 @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #4
	b _08064C2C
	.align 2, 0
_08064BC4: .4byte gColorFading
_08064BC8: .4byte gCurrentPowerBomb
_08064BCC: .4byte 0x030000F4
_08064BD0: .4byte 0x083C88C8
_08064BD4: .4byte 0x083C88B4
_08064BD8: .4byte gWrittenToBldcnt
_08064BDC: .4byte 0x03004FCC
_08064BE0: .4byte gUnk_03000be3
_08064BE4: .4byte 0x03004DE8
_08064BE8: .4byte gCurrentClipdataAffectingAction
_08064BEC: .4byte gPreviousArea
_08064BF0: .4byte gDisableDoorsAndTanks
_08064BF4: .4byte gCurrentCutscene
_08064BF8: .4byte gCurrentNavigationRoom
_08064BFC: .4byte gElevatorDirection
_08064C00: .4byte gIsLoadingFile
_08064C04: .4byte gPreviousCutscene
_08064C08: .4byte gLastDoorUsed
_08064C0C: .4byte gCurrentDemo
_08064C10: .4byte 0x03000058
_08064C14: .4byte gAbilityCount
_08064C18: .4byte gDoorPositionStart
_08064C1C: .4byte gSecurityHatchLevel
_08064C20: .4byte gEquipment
_08064C24: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08064C28:
	ldr r1, _08064D7C @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #3
_08064C2C:
	strb r0, [r1]
	ldr r0, _08064D80 @ =gCurrentCutscene
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064C3A
	bl CheckUpdateEventAfterCutscene
_08064C3A:
	ldr r0, _08064D84 @ =gPauseScreenFlag
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	beq _08064C46
	b _08064F12
_08064C46:
	ldr r0, _08064D88 @ =gDisableScrolling
	strb r2, [r0]
	ldr r0, _08064D8C @ =0x03000026
	strb r2, [r0]
	ldr r0, _08064D90 @ =0x03000050
	movs r1, #0
	strh r2, [r0]
	ldr r0, _08064D94 @ =0x0300002B
	strb r1, [r0]
	ldr r0, _08064D98 @ =gBackdropColor
	strh r2, [r0]
	ldr r0, _08064D9C @ =gCurrentEventBasedEffectCopy
	strb r1, [r0]
	ldr r0, _08064DA0 @ =gCurrentEventBasedEffect
	strb r1, [r0]
	ldr r0, _08064DA4 @ =gEffectYPosition
	strh r2, [r0]
	ldr r0, _08064DA8 @ =0x03004E3B
	strb r1, [r0]
	ldr r0, _08064DAC @ =gDoorUnlockTimer
	strb r1, [r0]
	ldr r0, _08064DB0 @ =0x03000047
	strb r1, [r0]
	ldr r1, _08064DB4 @ =0x0879B894
	ldr r0, _08064DB8 @ =gCurrentArea
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r0, _08064DBC @ =gLastDoorUsed
	ldrb r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	ldr r3, _08064DC0 @ =gCurrentRoom
	ldrb r0, [r4, #1]
	strb r0, [r3]
	ldr r1, _08064DC4 @ =0x0300002F
	ldrb r0, [r4]
	strb r0, [r1]
	ldr r2, _08064DC8 @ =0x03000030
	ldrb r0, [r4]
	lsrs r0, r0, #6
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	ldr r1, _08064DCC @ =gDoorPositionStart
	ldrb r0, [r4, #2]
	strh r0, [r1]
	ldrb r0, [r4, #4]
	strh r0, [r1, #2]
	ldr r1, _08064DD0 @ =gSaXSpawnPosition
	ldr r0, _08064DD4 @ =0x083C88A4
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _08064DD8 @ =0x03004E4C
	ldr r0, _08064DDC @ =0x083C88E4
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldr r2, _08064DE0 @ =0x03004E30
	ldr r0, _08064DE4 @ =0x083C88DC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r3]
	adds r0, #1
	bl CheckRoomHasEventTrigger
	ldr r2, _08064DE8 @ =0x03004E60
	ldr r0, _08064DEC @ =0x083C88A8
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0x7c
_08064CDC:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064CDC
	ldr r6, _08064DF0 @ =0x030000F4
	mov sb, r6
	ldr r0, _08064DF4 @ =0x083C88C8
	mov r8, r0
	ldr r1, _08064DF8 @ =gIsLoadingFile
	mov sl, r1
	ldr r3, _08064DFC @ =0x03004FB8
	ldr r5, _08064E00 @ =0x03000027
	ldr r6, _08064E04 @ =0x030000F0
	ldr r7, _08064E08 @ =0x0300004E
	ldr r2, _08064E0C @ =0x0300004F
	mov ip, r2
	ldr r2, _08064E10 @ =0x03004EE0
	ldr r0, _08064DEC @ =0x083C88A8
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0x7c
_08064D06:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064D06
	ldr r2, _08064E14 @ =0x03004FA8
	ldr r0, _08064E18 @ =0x083C88AC
	ldr r0, [r0]
	adds r1, r2, #0
	adds r1, #0xc
_08064D18:
	str r0, [r1]
	subs r1, #4
	cmp r1, r2
	bge _08064D18
	movs r0, #0
	strb r0, [r3]
	strb r0, [r5]
	ldr r3, _08064E1C @ =0x02035D20
	movs r2, #0x40
	movs r1, #0
_08064D2C:
	lsls r0, r2, #1
	adds r0, r0, r3
	subs r0, #2
	strh r1, [r0]
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	bne _08064D2C
	mov r5, r8
	ldr r0, [r5]
	str r0, [r6]
	mov r6, sb
	str r0, [r6]
	strb r2, [r7]
	mov r0, ip
	strb r2, [r0]
	mov r1, sl
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08064E28
	ldr r0, _08064DB8 @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064D62
	b _08064F12
_08064D62:
	ldr r0, _08064DC0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08064D6C
	b _08064F12
_08064D6C:
	ldr r0, _08064E20 @ =gSamusData
	movs r1, #0xc8
	lsls r1, r1, #3
	strh r1, [r0, #0x16]
	ldr r1, _08064E24 @ =0x000002BF
	strh r1, [r0, #0x18]
	b _08064F12
	.align 2, 0
_08064D7C: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08064D80: .4byte gCurrentCutscene
_08064D84: .4byte gPauseScreenFlag
_08064D88: .4byte gDisableScrolling
_08064D8C: .4byte 0x03000026
_08064D90: .4byte 0x03000050
_08064D94: .4byte 0x0300002B
_08064D98: .4byte gBackdropColor
_08064D9C: .4byte gCurrentEventBasedEffectCopy
_08064DA0: .4byte gCurrentEventBasedEffect
_08064DA4: .4byte gEffectYPosition
_08064DA8: .4byte 0x03004E3B
_08064DAC: .4byte gDoorUnlockTimer
_08064DB0: .4byte 0x03000047
_08064DB4: .4byte 0x0879B894
_08064DB8: .4byte gCurrentArea
_08064DBC: .4byte gLastDoorUsed
_08064DC0: .4byte gCurrentRoom
_08064DC4: .4byte 0x0300002F
_08064DC8: .4byte 0x03000030
_08064DCC: .4byte gDoorPositionStart
_08064DD0: .4byte gSaXSpawnPosition
_08064DD4: .4byte 0x083C88A4
_08064DD8: .4byte 0x03004E4C
_08064DDC: .4byte 0x083C88E4
_08064DE0: .4byte 0x03004E30
_08064DE4: .4byte 0x083C88DC
_08064DE8: .4byte 0x03004E60
_08064DEC: .4byte 0x083C88A8
_08064DF0: .4byte 0x030000F4
_08064DF4: .4byte 0x083C88C8
_08064DF8: .4byte gIsLoadingFile
_08064DFC: .4byte 0x03004FB8
_08064E00: .4byte 0x03000027
_08064E04: .4byte 0x030000F0
_08064E08: .4byte 0x0300004E
_08064E0C: .4byte 0x0300004F
_08064E10: .4byte 0x03004EE0
_08064E14: .4byte 0x03004FA8
_08064E18: .4byte 0x083C88AC
_08064E1C: .4byte 0x02035D20
_08064E20: .4byte gSamusData
_08064E24: .4byte 0x000002BF
_08064E28:
	ldr r0, _08064E88 @ =0x03000124
	movs r1, #0
	strh r2, [r0]
	strh r2, [r0, #4]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	ldrb r2, [r4, #2]
	ldrb r0, [r4, #5]
	adds r3, r0, #1
	ldr r5, _08064E8C @ =gSamusData
	lsls r1, r2, #6
	movs r0, #7
	ldrsb r0, [r4, r0]
	adds r0, #8
	lsls r0, r0, #2
	adds r1, r1, r0
	strh r1, [r5, #0x16]
	lsls r1, r3, #6
	movs r0, #8
	ldrsb r0, [r4, r0]
	lsls r0, r0, #2
	adds r1, r1, r0
	subs r1, #1
	strh r1, [r5, #0x18]
	ldr r0, _08064E90 @ =gCurrentDemo
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08064E6E
	movs r0, #1
	bl DemoLoadRam
_08064E6E:
	ldr r2, _08064E94 @ =gSaXSpawnPosition
	ldrh r1, [r5, #0x16]
	strh r1, [r2]
	ldrh r0, [r5, #0x18]
	strh r0, [r2, #2]
	movs r0, #7
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _08064E98
	adds r0, r1, #0
	subs r0, #0x20
	b _08064EA0
	.align 2, 0
_08064E88: .4byte 0x03000124
_08064E8C: .4byte gSamusData
_08064E90: .4byte gCurrentDemo
_08064E94: .4byte gSaXSpawnPosition
_08064E98:
	cmp r0, #0
	bge _08064EA2
	adds r0, r1, #0
	adds r0, #0x20
_08064EA0:
	strh r0, [r2]
_08064EA2:
	ldr r0, _08064EB8 @ =gSamusDoorPositionOffset
	movs r5, #0
	ldrsh r2, [r0, r5]
	ldr r5, _08064EBC @ =gSamusData
	adds r4, r0, #0
	cmp r2, #0
	beq _08064EE6
	cmp r2, #0
	bge _08064EC0
	movs r0, #0
	b _08064ED8
	.align 2, 0
_08064EB8: .4byte gSamusDoorPositionOffset
_08064EBC: .4byte gSamusData
_08064EC0:
	movs r6, #0x26
	ldrsh r0, [r5, r6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	adds r0, r3, r0
	cmp r0, #0xff
	ble _08064EDA
	movs r0, #0xff
	subs r0, r0, r3
_08064ED8:
	strh r0, [r4]
_08064EDA:
	ldrh r0, [r5, #0x18]
	ldrh r1, [r4]
	subs r0, r0, r1
	movs r1, #0
	strh r0, [r5, #0x18]
	strh r1, [r4]
_08064EE6:
	adds r1, r5, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08064EF4
	movs r0, #2
	strb r0, [r1]
_08064EF4:
	ldr r0, _08064F20 @ =gBg1YPosition
	movs r1, #0
	strh r1, [r0]
	ldr r0, _08064F24 @ =gBg1XPosition
	strh r1, [r0]
	ldr r0, _08064F28 @ =0x03001224
	strh r1, [r0]
	ldr r0, _08064F2C @ =0x03001226
	strh r1, [r0]
	ldrb r0, [r5, #1]
	cmp r0, #0x17
	bne _08064F12
	ldr r1, _08064F30 @ =gDisableDoorsAndTanks
	movs r0, #0x80
	strb r0, [r1]
_08064F12:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08064F20: .4byte gBg1YPosition
_08064F24: .4byte gBg1XPosition
_08064F28: .4byte 0x03001224
_08064F2C: .4byte 0x03001226
_08064F30: .4byte gDisableDoorsAndTanks

	thumb_func_start LoadScrollsAndEventBasedEffects
LoadScrollsAndEventBasedEffects: @ 0x08064F34
	push {r4, r5, r6, lr}
	bl LoadScrolls
	ldr r0, _08064F8C @ =gPauseScreenFlag
	movs r3, #0
	ldrsb r3, [r0, r3]
	cmp r3, #0
	beq _08064F46
	b _080652B8
_08064F46:
	ldr r2, _08064F90 @ =0x03004E10
	movs r4, #0x80
	strh r4, [r2]
	strh r4, [r2, #2]
	strh r4, [r2, #6]
	strh r4, [r2, #4]
	ldr r0, _08064F94 @ =gCurrentArea
	ldrb r1, [r0]
	adds r5, r0, #0
	cmp r1, #6
	bls _08064F60
	strh r3, [r2]
	strh r3, [r2, #2]
_08064F60:
	ldr r2, _08064F98 @ =0x03004E18
	ldr r0, _08064F9C @ =0x083C88D4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _08064FA0 @ =gCurrentRoomEntry
	ldrb r1, [r0, #6]
	adds r6, r2, #0
	adds r2, r0, #0
	cmp r1, #7
	blt _08064FAC
	cmp r1, #8
	ble _08064F80
	cmp r1, #0xa
	bne _08064FAC
_08064F80:
	ldr r0, _08064FA4 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x66
	bls _08064FA8
	movs r0, #2
	b _08064FAA
	.align 2, 0
_08064F8C: .4byte gPauseScreenFlag
_08064F90: .4byte 0x03004E10
_08064F94: .4byte gCurrentArea
_08064F98: .4byte 0x03004E18
_08064F9C: .4byte 0x083C88D4
_08064FA0: .4byte gCurrentRoomEntry
_08064FA4: .4byte gEventCounter
_08064FA8:
	movs r0, #1
_08064FAA:
	strb r0, [r6]
_08064FAC:
	ldr r3, _08064FC4 @ =0x03004E20
	ldr r0, _08064FC8 @ =0x083C88CC
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r3]
	str r1, [r3, #4]
	ldrb r0, [r2, #1]
	cmp r0, #0x47
	bne _08064FCC
	movs r0, #3
	b _08064FDC
	.align 2, 0
_08064FC4: .4byte 0x03004E20
_08064FC8: .4byte 0x083C88CC
_08064FCC:
	ldrb r0, [r2, #0x10]
	cmp r0, #1
	beq _08064FDC
	cmp r0, #5
	beq _08064FDA
	cmp r0, #6
	bne _08064FDE
_08064FDA:
	movs r0, #4
_08064FDC:
	strb r0, [r3]
_08064FDE:
	ldr r1, _08064FF4 @ =gCurrentEventBasedEffectCopy
	movs r0, #0
	strb r0, [r1]
	adds r4, r2, #0
	ldrb r0, [r4, #1]
	adds r3, r1, #0
	cmp r0, #0x47
	bne _08064FF8
	movs r0, #1
	b _080652B6
	.align 2, 0
_08064FF4: .4byte gCurrentEventBasedEffectCopy
_08064FF8:
	cmp r0, #0x46
	bne _08065024
	ldr r0, _08065018 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x1f
	bls _08065020
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r1, [r4, #0x12]
	adds r0, r0, r1
	movs r1, #0
	strh r0, [r4, #0x12]
	ldr r0, _0806501C @ =0x03004FC8
	strb r1, [r0]
	b _080652B8
	.align 2, 0
_08065018: .4byte gEventCounter
_0806501C: .4byte 0x03004FC8
_08065020:
	movs r0, #5
	b _080652B6
_08065024:
	ldrb r0, [r2]
	subs r0, #7
	cmp r0, #0x5a
	bls _0806502E
	b _080652B8
_0806502E:
	lsls r0, r0, #2
	ldr r1, _08065038 @ =_0806503C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08065038: .4byte _0806503C
_0806503C: @ jump table
	.4byte _080652B0 @ case 0
	.4byte _080652B8 @ case 1
	.4byte _080652B8 @ case 2
	.4byte _080652B8 @ case 3
	.4byte _080652B8 @ case 4
	.4byte _080652B8 @ case 5
	.4byte _080652B8 @ case 6
	.4byte _080651A8 @ case 7
	.4byte _080652B8 @ case 8
	.4byte _080652B8 @ case 9
	.4byte _080651E0 @ case 10
	.4byte _080652B8 @ case 11
	.4byte _080652B8 @ case 12
	.4byte _080652B8 @ case 13
	.4byte _080652B8 @ case 14
	.4byte _080652B8 @ case 15
	.4byte _080652B8 @ case 16
	.4byte _080652B8 @ case 17
	.4byte _080652B8 @ case 18
	.4byte _080652B8 @ case 19
	.4byte _080652B8 @ case 20
	.4byte _080652B8 @ case 21
	.4byte _080652B8 @ case 22
	.4byte _080652B8 @ case 23
	.4byte _080652B8 @ case 24
	.4byte _080652B8 @ case 25
	.4byte _080652B8 @ case 26
	.4byte _080652B8 @ case 27
	.4byte _080652B8 @ case 28
	.4byte _080652B8 @ case 29
	.4byte _080652B8 @ case 30
	.4byte _080652B8 @ case 31
	.4byte _080652B8 @ case 32
	.4byte _080652B8 @ case 33
	.4byte _080651A8 @ case 34
	.4byte _080652B8 @ case 35
	.4byte _080652B8 @ case 36
	.4byte _080652B8 @ case 37
	.4byte _080652B8 @ case 38
	.4byte _080652B8 @ case 39
	.4byte _080652B8 @ case 40
	.4byte _08065294 @ case 41
	.4byte _080652B8 @ case 42
	.4byte _080652B8 @ case 43
	.4byte _080652B8 @ case 44
	.4byte _080652B8 @ case 45
	.4byte _080652B8 @ case 46
	.4byte _080652B8 @ case 47
	.4byte _08065248 @ case 48
	.4byte _080651AC @ case 49
	.4byte _080652B4 @ case 50
	.4byte _080652B8 @ case 51
	.4byte _080652B8 @ case 52
	.4byte _080652B8 @ case 53
	.4byte _080652B8 @ case 54
	.4byte _080652B8 @ case 55
	.4byte _080652B8 @ case 56
	.4byte _080652B8 @ case 57
	.4byte _080652B8 @ case 58
	.4byte _080652B8 @ case 59
	.4byte _080652B8 @ case 60
	.4byte _080652B8 @ case 61
	.4byte _080652B8 @ case 62
	.4byte _080652B8 @ case 63
	.4byte _08065240 @ case 64
	.4byte _080652B8 @ case 65
	.4byte _080652B8 @ case 66
	.4byte _080652B8 @ case 67
	.4byte _080652B8 @ case 68
	.4byte _080652B8 @ case 69
	.4byte _080652B8 @ case 70
	.4byte _080652B8 @ case 71
	.4byte _080652B8 @ case 72
	.4byte _08065260 @ case 73
	.4byte _080652B8 @ case 74
	.4byte _080652B8 @ case 75
	.4byte _08065264 @ case 76
	.4byte _080652B8 @ case 77
	.4byte _080652B8 @ case 78
	.4byte _080652B8 @ case 79
	.4byte _080652B8 @ case 80
	.4byte _080652B8 @ case 81
	.4byte _0806527C @ case 82
	.4byte _080652B8 @ case 83
	.4byte _080652B8 @ case 84
	.4byte _080652B8 @ case 85
	.4byte _08065244 @ case 86
	.4byte _080652B8 @ case 87
	.4byte _080652B8 @ case 88
	.4byte _080652B8 @ case 89
	.4byte _080652AC @ case 90
_080651A8:
	movs r0, #4
	b _080652B6
_080651AC:
	ldrb r2, [r5]
	cmp r2, #0
	beq _080651B4
	b _080652B8
_080651B4:
	ldr r0, _080651D4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x36
	beq _080651BE
	b _080652B8
_080651BE:
	ldr r0, _080651D8 @ =gEventCounter
	ldrb r1, [r0]
	cmp r1, #0x49
	bls _080651C8
	b _080652B8
_080651C8:
	ldr r0, _080651DC @ =0x03004FC8
	strb r2, [r0]
	cmp r1, #0x49
	bne _080652B8
	movs r0, #7
	b _080652B6
	.align 2, 0
_080651D4: .4byte gCurrentRoom
_080651D8: .4byte gEventCounter
_080651DC: .4byte 0x03004FC8
_080651E0:
	ldr r0, _0806520C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08065218
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _08065210 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x22
	bne _080652B8
	movs r0, #8
	strb r0, [r3]
	bl unk_6dec0
	movs r0, #0xfc
	bl SoundPlay
	ldr r1, _08065214 @ =gWhichBgPositionIsWrittenToBg3Ofs
	movs r0, #4
	strb r0, [r1]
	b _080652B8
	.align 2, 0
_0806520C: .4byte gEventCounter
_08065210: .4byte gCurrentRoom
_08065214: .4byte gWhichBgPositionIsWrittenToBg3Ofs
_08065218:
	cmp r0, #0x46
	bne _080652B8
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _08065238 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2b
	bne _080652B8
	ldr r0, _0806523C @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	bne _080652B8
	movs r0, #0x14
	b _080652B6
	.align 2, 0
_08065238: .4byte gCurrentRoom
_0806523C: .4byte gSamusData
_08065240:
	movs r0, #0xa
	b _080652B6
_08065244:
	movs r0, #3
	b _080652B6
_08065248:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080652B8
	ldr r0, _0806525C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3b
	bne _080652B8
	movs r0, #0xb
	b _080652B6
	.align 2, 0
_0806525C: .4byte gCurrentRoom
_08065260:
	movs r0, #0xe
	b _080652B6
_08065264:
	ldr r0, _08065274 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x5b
	bhi _080652B8
	ldr r1, _08065278 @ =0x03004FC8
	movs r0, #0
	strb r0, [r1]
	b _080652B8
	.align 2, 0
_08065274: .4byte gEventCounter
_08065278: .4byte 0x03004FC8
_0806527C:
	ldr r0, _08065290 @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x66
	bne _080652B8
	movs r0, #0x11
	strb r0, [r3]
	movs r0, #3
	strb r0, [r6]
	b _080652B8
	.align 2, 0
_08065290: .4byte gEventCounter
_08065294:
	ldrb r0, [r5]
	cmp r0, #5
	bne _080652B8
	ldr r0, _080652A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #3
	bne _080652B8
	movs r0, #0xf
	b _080652B6
	.align 2, 0
_080652A8: .4byte gCurrentRoom
_080652AC:
	movs r0, #0x12
	b _080652B6
_080652B0:
	movs r0, #0xd
	b _080652B6
_080652B4:
	movs r0, #0x10
_080652B6:
	strb r0, [r3]
_080652B8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start LoadDoors
LoadDoors: @ 0x080652C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0806535C @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080652DA
	b _080655FC
_080652DA:
	movs r0, #0
	mov ip, r0
	ldr r6, _08065360 @ =0x0879B894
	ldr r5, _08065364 @ =gCurrentArea
	ldr r0, _08065368 @ =0x083C88B0
	ldr r1, [r0]
	ldr r4, _0806536C @ =0x03004E04
	movs r2, #0
	ldr r3, _08065370 @ =gHatchData
_080652EC:
	stm r3!, {r1}
	mov r7, ip
	adds r0, r7, r4
	strb r2, [r0]
	movs r0, #1
	add ip, r0
	mov r7, ip
	cmp r7, #5
	ble _080652EC
	movs r0, #0xff
	str r0, [sp]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r7, [r0]
	movs r1, #0
	mov ip, r1
	mov sl, r1
	ldrb r1, [r7]
	cmp r1, #0
	bne _08065318
	b _08065558
_08065318:
	ldr r2, _08065374 @ =gBackgroundsData
	mov sb, r2
_0806531C:
	ldr r4, _08065378 @ =gCurrentRoom
	ldrb r0, [r4]
	ldrb r2, [r7, #1]
	cmp r0, r2
	beq _08065328
	b _0806554A
_08065328:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _08065332
	b _08065544
_08065332:
	mov r4, sb
	ldrh r0, [r4, #0x1c]
	ldrb r3, [r7, #4]
	muls r0, r3, r0
	ldrb r2, [r7, #2]
	adds r0, r0, r2
	ldr r1, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0, #2]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08065384
	ldr r0, _0806537C @ =0x00007FFF
	ands r0, r5
	ldr r1, _08065380 @ =0x083BF5C0
	adds r0, r0, r1
	b _0806538A
	.align 2, 0
_0806535C: .4byte gPauseScreenFlag
_08065360: .4byte 0x0879B894
_08065364: .4byte gCurrentArea
_08065368: .4byte 0x083C88B0
_0806536C: .4byte 0x03004E04
_08065370: .4byte gHatchData
_08065374: .4byte gBackgroundsData
_08065378: .4byte gCurrentRoom
_0806537C: .4byte 0x00007FFF
_08065380: .4byte 0x083BF5C0
_08065384:
	ldr r4, _080653C0 @ =gTilemapAndClipPointers
	ldr r0, [r4, #4]
	adds r0, r0, r5
_0806538A:
	ldrb r4, [r0]
	movs r0, #1
	mov r8, r0
	cmp r4, #0xb
	beq _080653AA
	movs r1, #0
	mov r8, r1
	mov r4, sb
	ldrh r0, [r4, #0x1c]
	muls r0, r3, r0
	adds r0, r0, r2
	ldr r1, [r4, #0x18]
	lsls r0, r0, #1
	adds r0, r0, r1
	subs r0, #2
	ldrh r5, [r0]
_080653AA:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _080653CC
	ldr r0, _080653C4 @ =0x00007FFF
	ands r5, r0
	lsls r0, r5, #1
	ldr r1, _080653C8 @ =0x083BE3A0
	b _080653D2
	.align 2, 0
_080653C0: .4byte gTilemapAndClipPointers
_080653C4: .4byte 0x00007FFF
_080653C8: .4byte 0x083BE3A0
_080653CC:
	ldr r2, _0806542C @ =gTilemapAndClipPointers
	ldr r1, [r2, #8]
	lsls r0, r5, #1
_080653D2:
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #6
	cmp r5, #0x7e
	ble _08065402
	movs r4, #5
	cmp r5, #0x7f
	beq _08065402
	movs r4, #0
	cmp r5, #0x85
	ble _08065402
	movs r4, #1
	cmp r5, #0x8b
	ble _08065402
	movs r4, #2
	cmp r5, #0x91
	ble _08065402
	movs r4, #3
	cmp r5, #0x97
	ble _08065402
	movs r4, #6
	cmp r5, #0x9d
	bgt _08065402
	movs r4, #4
_08065402:
	cmp r4, #5
	bgt _080654AC
	cmp r4, #5
	bne _08065434
	movs r6, #0
	movs r2, #1
	rsbs r2, r2, #0
	ldr r1, _08065430 @ =gHatchData
	adds r1, #0x14
_08065414:
	ldrb r0, [r1]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _0806541E
	adds r6, r4, #0
_0806541E:
	subs r1, #4
	subs r4, #1
	cmp r4, r2
	bgt _08065414
	movs r4, #5
	b _08065440
	.align 2, 0
_0806542C: .4byte gTilemapAndClipPointers
_08065430: .4byte gHatchData
_08065434:
	adds r1, r5, #0
	subs r1, #0x80
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	subs r6, r1, r0
_08065440:
	lsls r1, r6, #2
	ldr r0, _08065478 @ =gHatchData
	adds r3, r1, r0
	ldrb r5, [r3]
	lsls r0, r5, #0x1f
	adds r2, r1, #0
	cmp r0, #0
	bne _080654A4
	lsls r1, r4, #5
	movs r0, #0x1f
	ands r0, r5
	orrs r0, r1
	mov r4, r8
	lsls r1, r4, #4
	movs r4, #0x11
	rsbs r4, r4, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r3]
	ldrb r0, [r7, #4]
	strb r0, [r3, #3]
	ldrb r0, [r7, #2]
	strb r0, [r3, #2]
	mov r1, r8
	cmp r1, #0
	beq _0806547C
	adds r0, #1
	b _0806547E
	.align 2, 0
_08065478: .4byte gHatchData
_0806547C:
	subs r0, #1
_0806547E:
	strb r0, [r3, #2]
	ldr r4, _0806549C @ =gHatchData
	adds r2, r2, r4
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _080654A0 @ =0x03004E04
	adds r0, r6, r1
	mov r2, sl
	strb r2, [r0]
	movs r4, #1
	add ip, r4
	b _08065534
	.align 2, 0
_0806549C: .4byte gHatchData
_080654A0: .4byte 0x03004E04
_080654A4:
	movs r0, #0xe0
	orrs r0, r5
	strb r0, [r3]
	b _08065534
_080654AC:
	ldr r0, _080654C0 @ =gHatchData
	ldrb r1, [r0, #0x14]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	bne _080654C4
	movs r6, #5
	b _080654D8
	.align 2, 0
_080654C0: .4byte gHatchData
_080654C4:
	ldr r4, _0806551C @ =gHatchData
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r6, #0
	cmp r0, #0
	bne _080654D4
	movs r6, #4
_080654D4:
	cmp r6, #0
	beq _08065534
_080654D8:
	lsls r0, r6, #2
	ldr r1, _0806551C @ =gHatchData
	adds r2, r0, r1
	ldrb r0, [r2]
	movs r1, #0x1f
	ands r1, r0
	movs r0, #0xc0
	orrs r1, r0
	strb r1, [r2]
	ldrb r0, [r7, #4]
	strb r0, [r2, #3]
	ldrb r0, [r7, #2]
	strb r0, [r2, #2]
	movs r0, #1
	orrs r1, r0
	strb r1, [r2]
	ldr r4, _08065520 @ =0x03004E04
	adds r0, r6, r4
	mov r1, sl
	strb r1, [r0]
	mov r4, sb
	ldrh r1, [r4, #0x1c]
	ldrb r0, [r7, #2]
	lsls r0, r0, #1
	cmp r1, r0
	ble _08065524
	ldrb r0, [r2, #2]
	adds r0, #1
	strb r0, [r2, #2]
	ldrb r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	b _08065532
	.align 2, 0
_0806551C: .4byte gHatchData
_08065520: .4byte 0x03004E04
_08065524:
	ldrb r0, [r2, #2]
	subs r0, #1
	strb r0, [r2, #2]
	ldrb r1, [r2]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
_08065532:
	strb r0, [r2]
_08065534:
	ldr r0, [sp]
	cmp r0, #0xff
	bne _08065544
	ldr r1, _0806560C @ =gLastDoorUsed
	ldrb r1, [r1]
	cmp sl, r1
	bne _08065544
	str r6, [sp]
_08065544:
	mov r2, ip
	cmp r2, #6
	beq _08065558
_0806554A:
	adds r7, #0xc
	movs r4, #1
	add sl, r4
	ldrb r1, [r7]
	cmp r1, #0
	beq _08065558
	b _0806531C
_08065558:
	ldr r7, [sp]
	cmp r7, #0xff
	beq _080655AE
	ldr r0, _08065610 @ =gUnk_03000be3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080655AE
	ldr r0, _08065614 @ =gHatchData
	lsls r1, r7, #2
	adds r5, r1, r0
	ldrb r2, [r5]
	lsls r0, r2, #0x1f
	cmp r0, #0
	beq _080655AE
	lsrs r0, r2, #5
	cmp r0, #4
	bhi _080655AE
	ldrb r1, [r5, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #1]
	movs r4, #0xf
	rsbs r4, r4, #0
	adds r0, r4, #0
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	strb r0, [r5]
	ldr r0, [sp]
	bl UpdateHatchAnimaton
	ldrb r0, [r5, #1]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #1]
	ldrb r0, [r5]
	ands r4, r0
	strb r4, [r5]
_080655AE:
	movs r6, #0
	movs r7, #4
	rsbs r7, r7, #0
	movs r5, #0xf
	rsbs r5, r5, #0
_080655B8:
	ldr r0, _08065614 @ =gHatchData
	lsls r1, r6, #2
	adds r4, r1, r0
	ldrb r2, [r4]
	lsrs r0, r2, #5
	cmp r0, #5
	bne _080655F6
	ldrb r1, [r4, #1]
	adds r0, r7, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #1]
	adds r0, r5, #0
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r0, r6, #0
	bl UpdateHatchAnimaton
	ldrb r1, [r4, #1]
	adds r0, r7, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r4]
_080655F6:
	adds r6, #1
	cmp r6, #5
	ble _080655B8
_080655FC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806560C: .4byte gLastDoorUsed
_08065610: .4byte gUnk_03000be3
_08065614: .4byte gHatchData

	thumb_func_start unk_65618
unk_65618: @ 0x08065618
	push {r4, lr}
	movs r2, #0
	ldr r0, _0806564C @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08065642
	ldr r3, _08065650 @ =gHatchData
	ldrb r1, [r3, #1]
	movs r4, #3
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08065634
	movs r2, #1
_08065634:
	ldrb r1, [r3, #5]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08065642
	movs r0, #2
	orrs r2, r0
_08065642:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0806564C: .4byte gCurrentNavigationRoom
_08065650: .4byte gHatchData

	thumb_func_start SetupInitialTilemap
SetupInitialTilemap: @ 0x08065654
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	cmp r0, #0
	bne _08065684
	ldr r0, _08065678 @ =gCurrentRoomEntry
	ldrb r2, [r0, #1]
	ldr r0, _0806567C @ =0x03001226
	ldrh r6, [r0]
	ldr r0, _08065680 @ =0x03001224
	b _080656AE
	.align 2, 0
_08065678: .4byte gCurrentRoomEntry
_0806567C: .4byte 0x03001226
_08065680: .4byte 0x03001224
_08065684:
	ldr r0, [sp]
	cmp r0, #1
	bne _080656A4
	ldr r0, _08065698 @ =gCurrentRoomEntry
	ldrb r2, [r0, #2]
	ldr r0, _0806569C @ =gBg1YPosition
	ldrh r6, [r0]
	ldr r0, _080656A0 @ =gBg1XPosition
	b _080656AE
	.align 2, 0
_08065698: .4byte gCurrentRoomEntry
_0806569C: .4byte gBg1YPosition
_080656A0: .4byte gBg1XPosition
_080656A4:
	ldr r0, _080657E4 @ =gCurrentRoomEntry
	ldrb r2, [r0, #3]
	ldr r0, _080657E8 @ =0x0300122E
	ldrh r6, [r0]
	ldr r0, _080657EC @ =0x0300122C
_080656AE:
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _080656BA
	b _0806586C
_080656BA:
	lsrs r0, r1, #6
	movs r1, #0x15
	str r1, [sp, #0xc]
	subs r0, #3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bge _080656CC
	movs r3, #0
_080656CC:
	ldr r7, _080657F0 @ =gBackgroundsData
	ldr r2, [sp]
	lsls r1, r2, #3
	adds r5, r1, r7
	ldrh r4, [r5, #4]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	subs r0, r4, r0
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0xc]
	cmp r1, r0
	ble _080656EC
	subs r0, r4, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_080656EC:
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	lsrs r0, r6, #6
	movs r2, #0x10
	str r2, [sp, #0x10]
	subs r0, #3
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r0, #0
	bge _08065702
	movs r3, #0
_08065702:
	ldrh r1, [r5, #6]
	lsls r2, r3, #0x10
	asrs r0, r2, #0x10
	subs r0, r1, r0
	ldr r6, [sp, #0x10]
	cmp r6, r0
	ble _08065718
	subs r0, r1, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_08065718:
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	muls r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, r0
	lsls r0, r0, #1
	ldr r1, [r5]
	adds r1, r1, r0
	str r1, [sp, #4]
	movs r1, #0
	ldr r3, [sp, #0x10]
	cmp r1, r3
	blt _08065738
	b _0806588E
_08065738:
	ldr r4, [sp, #0x1c]
	ldr r6, _080657F0 @ =gBackgroundsData
	adds r0, r4, r6
	ldrh r0, [r0, #4]
	muls r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r7, [sp, #8]
	adds r1, #1
	str r1, [sp, #0x14]
	adds r0, r2, #1
	str r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	cmp r1, #0
	beq _08065854
	ldr r3, [sp]
	lsls r3, r3, #0xc
	mov r8, r3
	movs r4, #0xf
	ands r2, r4
	lsls r2, r2, #6
	mov sl, r2
	ldr r6, _080657F4 @ =0x083BE740
	mov sb, r6
	adds r6, r1, #0
_0806576C:
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r1, r8
	adds r5, r1, r0
	movs r1, #0x1f
	ands r1, r7
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08065784
	ldr r5, _080657F8 @ =0x06000800
	add r5, r8
_08065784:
	movs r0, #0xf
	ands r0, r1
	lsls r1, r0, #1
	mov r2, sl
	adds r0, r2, r1
	lsls r0, r0, #1
	adds r5, r5, r0
	mov r3, ip
	lsls r0, r3, #1
	ldr r4, [sp, #4]
	adds r0, r0, r4
	ldrh r2, [r0]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	beq _080657FC
	lsls r0, r2, #0x12
	lsrs r2, r0, #0x10
	adds r0, r2, #0
	movs r1, #1
	orrs r2, r1
	adds r1, r2, #0
	lsls r0, r0, #1
	add r0, sb
	ldrh r0, [r0]
	strh r0, [r5]
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #1
	add r1, sb
	ldrh r0, [r1]
	strh r0, [r5, #2]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r2, #1
	lsls r1, r1, #0x10
	lsls r2, r2, #1
	add r2, sb
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x42
	lsrs r1, r1, #0xf
	add r1, sb
	b _0806583A
	.align 2, 0
_080657E4: .4byte gCurrentRoomEntry
_080657E8: .4byte 0x0300122E
_080657EC: .4byte 0x0300122C
_080657F0: .4byte gBackgroundsData
_080657F4: .4byte 0x083BE740
_080657F8: .4byte 0x06000800
_080657FC:
	lsls r0, r2, #0x12
	lsrs r2, r0, #0x10
	adds r1, r2, #0
	movs r0, #1
	orrs r2, r0
	adds r3, r2, #0
	ldr r0, _08065868 @ =gTilemapAndClipPointers
	ldr r4, [r0]
	lsls r1, r1, #1
	adds r1, r1, r4
	ldrh r0, [r1]
	strh r0, [r5]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r3, r3, #1
	adds r3, r3, r4
	ldrh r0, [r3]
	strh r0, [r5, #2]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r2, #1
	lsls r1, r1, #0x10
	lsls r2, r2, #1
	adds r2, r2, r4
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, r5, #0
	adds r2, #0x42
	lsrs r1, r1, #0xf
	adds r1, r1, r4
_0806583A:
	ldrh r0, [r1]
	strh r0, [r2]
	mov r0, ip
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	subs r6, #1
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r6, #0
	bne _0806576C
_08065854:
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	ldr r3, [sp, #0x10]
	cmp r1, r3
	bge _08065864
	b _08065738
_08065864:
	b _0806588E
	.align 2, 0
_08065868: .4byte gTilemapAndClipPointers
_0806586C:
	cmp r2, #0
	bne _0806588E
	ldr r4, [sp]
	lsls r1, r4, #0xc
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	movs r2, #0
	movs r3, #0x40
	ldr r1, _080658A0 @ =0x000007FF
_08065880:
	strh r3, [r5]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r5, #2
	cmp r2, r1
	bls _08065880
_0806588E:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080658A0: .4byte 0x000007FF

	thumb_func_start RleDecompress
RleDecompress: @ 0x080658A4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0
	cmp r0, #0
	bne _080658D2
	ldrb r5, [r1]
	adds r1, #1
	cmp r5, #0
	bne _080658BE
	movs r5, #0x80
	lsls r5, r5, #4
	b _080658EE
_080658BE:
	cmp r5, #1
	beq _080658C6
	cmp r5, #2
	bne _080658CC
_080658C6:
	movs r5, #0x80
	lsls r5, r5, #5
	b _080658EE
_080658CC:
	movs r5, #0x80
	lsls r5, r5, #6
	b _080658EE
_080658D2:
	cmp r0, #1
	beq _080658EE
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	strb r5, [r2]
	adds r2, #1
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #1
	strb r5, [r2]
	adds r2, #1
_080658EE:
	adds r6, r2, #0
	movs r4, #0
_080658F2:
	ldrb r0, [r1]
	adds r1, #1
	cmp r0, #1
	bne _0806593C
	ldrb r3, [r1]
	adds r1, #1
	adds r4, #1
	cmp r3, #0
	beq _08065992
_08065904:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0806592E
	movs r0, #0x7f
	ands r3, r0
	cmp r3, #0
	beq _08065920
_08065914:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08065914
_08065920:
	adds r1, #1
	b _08065932
_08065924:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #2
	subs r3, #1
_0806592E:
	cmp r3, #0
	bne _08065924
_08065932:
	ldrb r3, [r1]
	adds r1, #1
	cmp r3, #0
	bne _08065904
	b _08065992
_0806593C:
	ldrb r3, [r1]
	adds r1, #1
	lsls r3, r3, #8
	ldrb r0, [r1]
	orrs r3, r0
	adds r1, #1
	adds r4, #1
	cmp r3, #0
	beq _08065992
_0806594E:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	cmp r0, #0
	beq _0806597E
	ldr r0, _08065970 @ =0x00007FFF
	ands r3, r0
	cmp r3, #0
	beq _0806596C
_08065960:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _08065960
_0806596C:
	adds r1, #1
	b _08065982
	.align 2, 0
_08065970: .4byte 0x00007FFF
_08065974:
	ldrb r0, [r1]
	strb r0, [r2]
	adds r1, #1
	adds r2, #2
	subs r3, #1
_0806597E:
	cmp r3, #0
	bne _08065974
_08065982:
	ldrb r3, [r1]
	adds r1, #1
	lsls r3, r3, #8
	ldrb r0, [r1]
	orrs r3, r0
	adds r1, #1
	cmp r3, #0
	bne _0806594E
_08065992:
	adds r2, r6, #1
	cmp r4, #1
	ble _080658F2
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start unk_659a0
unk_659a0: @ 0x080659A0
	push {lr}
	ldr r0, _080659D4 @ =0x03000018
	ldrb r0, [r0]
	cmp r0, #0
	beq _080659AE
	bl ColorFadingApplyMonochrome
_080659AE:
	bl MinimapUpdate
	ldr r0, _080659D8 @ =0x03004E44
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080659C2
	bl unk_65a1c
_080659C2:
	ldr r0, _080659DC @ =gElevatorDirection
	ldrb r0, [r0]
	cmp r0, #0
	beq _080659CE
	bl unk_659e4
_080659CE:
	pop {r0}
	bx r0
	.align 2, 0
_080659D4: .4byte 0x03000018
_080659D8: .4byte 0x03004E44
_080659DC: .4byte gElevatorDirection

	thumb_func_start unk_659e0
unk_659e0: @ 0x080659E0
	bx lr
	.align 2, 0

	thumb_func_start unk_659e4
unk_659e4: @ 0x080659E4
	push {lr}
	ldr r0, _08065A00 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x17
	beq _08065A14
	ldr r0, _08065A04 @ =gElevatorDirection
	ldrb r0, [r0]
	cmp r0, #1
	bne _08065A08
	movs r0, #0x42
	bl CheckUpdateSubEventAndMusic
	b _08065A0E
	.align 2, 0
_08065A00: .4byte gSamusData
_08065A04: .4byte gElevatorDirection
_08065A08:
	movs r0, #0x43
	bl CheckUpdateSubEventAndMusic
_08065A0E:
	ldr r1, _08065A18 @ =gElevatorDirection
	movs r0, #0
	strb r0, [r1]
_08065A14:
	pop {r0}
	bx r0
	.align 2, 0
_08065A18: .4byte gElevatorDirection

	thumb_func_start unk_65a1c
unk_65a1c: @ 0x08065A1C
	push {r4, r5, lr}
	ldr r0, _08065A58 @ =gWrittenToBldalpha
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, #0
	bne _08065B04
	ldr r0, _08065A5C @ =gCurrentPowerBomb
	ldrb r2, [r0]
	cmp r2, #0
	beq _08065A68
	cmp r2, #1
	bne _08065B04
	ldr r2, _08065A60 @ =0x03004E44
	strb r1, [r2, #1]
	ldrb r1, [r2]
	movs r0, #0xf
	ands r0, r1
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08065A64 @ =gIoRegisters
	ldrb r0, [r0, #5]
	adds r2, r0, #2
	lsls r1, r2, #8
	movs r0, #0x10
	subs r0, r0, r2
	orrs r1, r0
	strh r1, [r5]
	b _08065B04
	.align 2, 0
_08065A58: .4byte gWrittenToBldalpha
_08065A5C: .4byte gCurrentPowerBomb
_08065A60: .4byte 0x03004E44
_08065A64: .4byte gIoRegisters
_08065A68:
	ldr r1, _08065AE0 @ =0x03004E44
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0x13
	bls _08065B04
	strb r2, [r4, #1]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	adds r0, #1
	lsls r0, r0, #4
	ldrb r1, [r4]
	movs r3, #0xf
	adds r2, r3, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r4]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #4
	ands r2, r3
	orrs r2, r1
	strb r2, [r4]
	ldr r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	movs r2, #3
	ands r2, r0
	cmp r2, #0
	beq _08065ABE
	movs r0, #1
	ands r0, r2
	movs r2, #2
	cmp r0, #0
	beq _08065ABE
	movs r2, #1
_08065ABE:
	ldr r1, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08065ACE
	rsbs r2, r2, #0
_08065ACE:
	ldr r0, _08065AE4 @ =gIoRegisters
	ldrb r1, [r0, #4]
	ldrb r0, [r0, #5]
	adds r0, r0, r2
	cmp r0, #0
	bge _08065AE8
	movs r0, #0
	b _08065AEE
	.align 2, 0
_08065AE0: .4byte 0x03004E44
_08065AE4: .4byte gIoRegisters
_08065AE8:
	cmp r0, #0x10
	ble _08065AEE
	movs r0, #0x10
_08065AEE:
	subs r1, r1, r2
	cmp r1, #0
	bge _08065AF8
	movs r1, #0
	b _08065AFE
_08065AF8:
	cmp r1, #0x10
	ble _08065AFE
	movs r1, #0x10
_08065AFE:
	lsls r0, r0, #8
	orrs r0, r1
	strh r0, [r5]
_08065B04:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start UpdateAnimatedGraphicsAndPalette
UpdateAnimatedGraphicsAndPalette: @ 0x08065B0C
	push {lr}
	movs r1, #0
	ldr r0, _08065B50 @ =gSubGameMode1
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #1
	beq _08065B28
	cmp r0, #3
	beq _08065B28
	movs r1, #2
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
_08065B28:
	ldr r0, _08065B54 @ =gPreventMovementTimer
	ldrh r0, [r0]
	cmp r0, #0
	beq _08065B32
	movs r1, #1
_08065B32:
	cmp r1, #0
	bne _08065B60
	ldr r1, _08065B58 @ =0x03000027
	ldrb r0, [r1]
	cmp r0, #0
	bne _08065B5C
	bl UpdateAnimatedGraphics
	bl UpdateTankAnimations
	bl UpdateAnimatedPalette
	bl UpdateHatchFlashingAnimation
	b _08065B60
	.align 2, 0
_08065B50: .4byte gSubGameMode1
_08065B54: .4byte gPreventMovementTimer
_08065B58: .4byte 0x03000027
_08065B5C:
	subs r0, #1
	strb r0, [r1]
_08065B60:
	pop {r0}
	bx r0

	thumb_func_start UpdateHatchFlashingAnimation
UpdateHatchFlashingAnimation: @ 0x08065B64
	push {lr}
	ldr r0, _08065C18 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08065C14
	ldr r3, _08065C1C @ =gSecurityHatchLevel
	ldrb r0, [r3]
	cmp r0, #4
	bhi _08065BBE
	ldr r1, _08065C20 @ =0x03004FC4
	ldrb r0, [r1]
	adds r0, #1
	movs r2, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08065BBE
	strb r2, [r1]
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	ble _08065B9C
	strb r2, [r1, #1]
_08065B9C:
	ldr r2, _08065C24 @ =0x040000D4
	movs r0, #1
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r1, _08065C28 @ =0x08408268
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08065C2C @ =0x0500002C
	str r0, [r2, #4]
	ldrb r0, [r3]
	adds r0, #1
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r0, r1
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08065BBE:
	ldr r0, _08065C30 @ =gCurrentNavigationRoom
	ldrb r2, [r0]
	cmp r2, #0
	bne _08065C14
	ldr r0, _08065C34 @ =0x03004E3B
	ldrb r0, [r0]
	cmp r0, #0
	beq _08065C14
	ldr r0, _08065C38 @ =gDoorUnlockTimer
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08065C14
	ldr r1, _08065C20 @ =0x03004FC4
	ldrb r0, [r1, #2]
	adds r0, #1
	strb r0, [r1, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08065C14
	strb r2, [r1, #2]
	ldrb r0, [r1, #3]
	adds r0, #1
	strb r0, [r1, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #7
	ble _08065BFC
	strb r2, [r1, #3]
_08065BFC:
	ldr r2, _08065C24 @ =0x040000D4
	movs r0, #3
	ldrsb r0, [r1, r0]
	lsls r0, r0, #5
	ldr r1, _08065C3C @ =0x08408336
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _08065C40 @ =0x0500005A
	str r0, [r2, #4]
	ldr r0, _08065C44 @ =0x80000003
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_08065C14:
	pop {r0}
	bx r0
	.align 2, 0
_08065C18: .4byte gSubGameMode1
_08065C1C: .4byte gSecurityHatchLevel
_08065C20: .4byte 0x03004FC4
_08065C24: .4byte 0x040000D4
_08065C28: .4byte 0x08408268
_08065C2C: .4byte 0x0500002C
_08065C30: .4byte gCurrentNavigationRoom
_08065C34: .4byte 0x03004E3B
_08065C38: .4byte gDoorUnlockTimer
_08065C3C: .4byte 0x08408336
_08065C40: .4byte 0x0500005A
_08065C44: .4byte 0x80000003

	thumb_func_start UpdateRoom
UpdateRoom: @ 0x08065C48
	push {lr}
	ldr r0, _08065CD0 @ =gDisableScrolling
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _08065CE0
	ldr r0, _08065CD4 @ =gColorFading
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _08065CE0
	bl UpdateBackgroundsPosition
	ldr r0, _08065CD8 @ =0x03004FCC
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _08065C82
	ldr r0, _08065CDC @ =0x03000124
	movs r1, #6
	ldrsb r1, [r0, r1]
	movs r0, #0x1c
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08065C82
	cmp r1, #0x1c
	ble _08065C98
_08065C82:
	movs r0, #0x10
	bl UpdateHorizontalTilemap
	bl SendHorizontalTilemap
	movs r0, #2
	rsbs r0, r0, #0
	bl UpdateHorizontalTilemap
	bl SendHorizontalTilemap
_08065C98:
	ldr r0, _08065CD8 @ =0x03004FCC
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08065CB6
	ldr r0, _08065CDC @ =0x03000124
	movs r1, #7
	ldrsb r1, [r0, r1]
	movs r0, #0x1c
	rsbs r0, r0, #0
	cmp r1, r0
	blt _08065CB6
	cmp r1, #0x1c
	ble _08065CEA
_08065CB6:
	movs r0, #0xb
	bl UpdateVerticalTilemap
	bl SendVerticalTilemap
	movs r0, #2
	rsbs r0, r0, #0
	bl UpdateVerticalTilemap
	bl SendVerticalTilemap
	b _08065CEA
	.align 2, 0
_08065CD0: .4byte gDisableScrolling
_08065CD4: .4byte gColorFading
_08065CD8: .4byte 0x03004FCC
_08065CDC: .4byte 0x03000124
_08065CE0:
	ldrb r0, [r2]
	cmp r0, #2
	bne _08065CEA
	bl UpdateBackgroundsPosition
_08065CEA:
	ldr r0, _08065D44 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08065D1C
	bl CheckTouchingSpecialClipdata
	bl UpdateBrokenBlocks
	bl UpdateNonReformBlocksAnimation
	bl UpdateBombChains
	bl UpdateEventBasedEffect
	bl UpdateHatches
	ldr r0, _08065D48 @ =gRoomEventTrigger
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08065D1C
	bl CheckRoomEventTrigger
_08065D1C:
	bl HazeProcess
	cmp r0, #0
	beq _08065D3A
	bl HazeProcess
	ldr r2, _08065D4C @ =gHazeInfo
	ldrb r1, [r2, #7]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0
	beq _08065D3A
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2, #7]
_08065D3A:
	bl PowerBombExplosionProcess
	pop {r0}
	bx r0
	.align 2, 0
_08065D44: .4byte gSubGameMode1
_08065D48: .4byte gRoomEventTrigger
_08065D4C: .4byte gHazeInfo

	thumb_func_start UpdateBackgroundsPosition
UpdateBackgroundsPosition: @ 0x08065D50
	push {r4, r5, r6, lr}
	bl ScreenShakeUpdateVertical
	adds r5, r0, #0
	bl ScreenShakeUpdateHorizontal
	adds r4, r0, #0
	ldr r0, _08065DC0 @ =gBg1XPosition
	ldrh r1, [r0]
	lsrs r1, r1, #2
	ldr r0, _08065DC4 @ =0x000001FF
	adds r3, r0, #0
	ands r1, r3
	ldr r0, _08065DC8 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	ldr r2, _08065DCC @ =gBackgroundPositions
	adds r1, r1, r4
	strh r1, [r2, #4]
	adds r0, r0, r5
	strh r0, [r2, #6]
	ldr r0, _08065DD0 @ =0x0300122C
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	adds r0, r0, r4
	strh r0, [r2, #8]
	ldr r0, _08065DD4 @ =0x0300122E
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ands r0, r3
	adds r0, r0, r5
	strh r0, [r2, #0xa]
	ldr r0, _08065DD8 @ =0x03000050
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08065DE8
	ldr r0, _08065DDC @ =0x03001224
	ldrh r0, [r0]
	ldr r1, _08065DE0 @ =0x03004E20
	lsrs r0, r0, #2
	ldrh r6, [r1, #4]
	adds r0, r0, r6
	ands r0, r3
	strh r0, [r2]
	ldr r0, _08065DE4 @ =0x03001226
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ands r0, r3
	b _08065E08
	.align 2, 0
_08065DC0: .4byte gBg1XPosition
_08065DC4: .4byte 0x000001FF
_08065DC8: .4byte gBg1YPosition
_08065DCC: .4byte gBackgroundPositions
_08065DD0: .4byte 0x0300122C
_08065DD4: .4byte 0x0300122E
_08065DD8: .4byte 0x03000050
_08065DDC: .4byte 0x03001224
_08065DE0: .4byte 0x03004E20
_08065DE4: .4byte 0x03001226
_08065DE8:
	ldr r0, _08065E3C @ =0x03001224
	ldrh r0, [r0]
	ldr r1, _08065E40 @ =0x03004E20
	lsrs r0, r0, #2
	ldrh r6, [r1, #4]
	adds r0, r0, r6
	ands r0, r3
	adds r0, r0, r4
	strh r0, [r2]
	ldr r0, _08065E44 @ =0x03001226
	ldrh r0, [r0]
	lsrs r0, r0, #2
	ldrh r1, [r1, #6]
	adds r0, r0, r1
	ands r0, r3
	adds r0, r0, r5
_08065E08:
	strh r0, [r2, #2]
	ldr r0, _08065E48 @ =0x03001230
	ldrh r0, [r0]
	ldr r1, _08065E4C @ =0x03004E18
	lsrs r0, r0, #2
	ldrh r1, [r1, #4]
	adds r3, r0, r1
	ldr r0, _08065E50 @ =0x000001FF
	adds r1, r0, #0
	ands r3, r1
	ldr r0, _08065E54 @ =0x03001232
	ldrh r0, [r0]
	lsrs r2, r0, #2
	ands r2, r1
	ldr r0, _08065E58 @ =0x03000050
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08065E60
	ldr r0, _08065E5C @ =gBackgroundPositions
	strh r3, [r0, #0xc]
	strh r2, [r0, #0xe]
	b _08065E6E
	.align 2, 0
_08065E3C: .4byte 0x03001224
_08065E40: .4byte 0x03004E20
_08065E44: .4byte 0x03001226
_08065E48: .4byte 0x03001230
_08065E4C: .4byte 0x03004E18
_08065E50: .4byte 0x000001FF
_08065E54: .4byte 0x03001232
_08065E58: .4byte 0x03000050
_08065E5C: .4byte gBackgroundPositions
_08065E60:
	ldr r0, _08065E74 @ =gBackgroundPositions
	asrs r1, r4, #1
	adds r1, r3, r1
	strh r1, [r0, #0xc]
	asrs r1, r5, #1
	adds r1, r2, r1
	strh r1, [r0, #0xe]
_08065E6E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08065E74: .4byte gBackgroundPositions

	thumb_func_start UpdateVerticalTilemap
UpdateVerticalTilemap: @ 0x08065E78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #8]
	ldr r2, _08065ED8 @ =gCurrentRoomEntry
	ldrb r0, [r2, #1]
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #2]
	mov r0, sp
	adds r0, #5
	strb r3, [r0]
	ldrb r2, [r2, #3]
	adds r0, #1
	strb r2, [r0]
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _08065EDC @ =0x03005138
	str r0, [sp, #0xc]
	movs r5, #0

	non_word_aligned_thumb_func_start sub_08065EAA
sub_08065EAA: @ 0x08065EAA
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	mov r2, sp
	adds r0, r2, r5
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	adds r1, r5, #1
	str r1, [sp, #0x14]
	ldr r2, [sp, #0xc]
	adds r2, #0xa0
	str r2, [sp, #0x18]
	cmp r0, #0
	bne _08065ECC
	bl _08066C46
_08065ECC:
	cmp r5, #0
	bne _08065EE8
	ldr r0, _08065EE0 @ =0x03001226
	ldrh r1, [r0]
	ldr r0, _08065EE4 @ =0x03001224
	b _08065F02
	.align 2, 0
_08065ED8: .4byte gCurrentRoomEntry
_08065EDC: .4byte 0x03005138
_08065EE0: .4byte 0x03001226
_08065EE4: .4byte 0x03001224
_08065EE8:
	cmp r5, #1
	bne _08065EFC
	ldr r0, _08065EF4 @ =gBg1YPosition
	ldrh r1, [r0]
	ldr r0, _08065EF8 @ =gBg1XPosition
	b _08065F02
	.align 2, 0
_08065EF4: .4byte gBg1YPosition
_08065EF8: .4byte gBg1XPosition
_08065EFC:
	ldr r0, _08065FE4 @ =0x0300122E
	ldrh r1, [r0]
	ldr r0, _08065FE8 @ =0x0300122C
_08065F02:
	ldrh r4, [r0]
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r1, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r3, r0, #0x10
	adds r0, r5, #1
	str r0, [sp, #0x14]
	ldr r1, [sp, #0xc]
	adds r1, #0xa0
	str r1, [sp, #0x18]
	cmp r3, #0
	bge _08065F26
	bl _08066C46
_08065F26:
	ldr r1, _08065FEC @ =gBackgroundsData
	lsls r0, r5, #3
	adds r5, r0, r1
	ldrh r0, [r5, #6]
	cmp r3, r0
	ble _08065F36
	bl _08066C46
_08065F36:
	ldr r1, [sp, #0xc]
	strh r2, [r1, #4]
	lsrs r0, r4, #6
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08065F48
	movs r2, #0
_08065F48:
	ldr r0, [sp, #0xc]
	strh r2, [r0, #2]
	movs r1, #0x13
	mov sb, r1
	ldrh r0, [r5, #4]
	cmp r0, #0x13
	bge _08065F58
	mov sb, r0
_08065F58:
	mov r2, sb
	lsls r2, r2, #2
	mov sb, r2
	ldr r0, [sp, #0xc]
	strb r2, [r0]
	ldrh r0, [r5, #4]
	ldr r2, [sp, #0xc]
	ldrh r1, [r2, #4]
	muls r0, r1, r0
	ldrh r1, [r2, #2]
	adds r6, r0, r1
	movs r4, #0
	cmp r4, sb
	blt _08065F78
	bl _08066C46
_08065F78:
	mov r8, r5
	movs r2, #0x80
	lsls r2, r2, #8
	mov sl, r2
	ldr r0, _08065FF0 @ =0x083BE740
	mov ip, r0
	ldr r7, _08065FF4 @ =gTilemapAndClipPointers
	ldr r1, [sp, #0xc]
	adds r1, #6
	str r1, [sp, #0x10]

	thumb_func_start sub_08065F8C
sub_08065F8C: @ 0x08065F8C
	mov r2, r8
	ldr r0, [r2]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08065FFC
	ldr r0, _08065FF8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066046
	.align 2, 0
_08065FE4: .4byte 0x0300122E
_08065FE8: .4byte 0x0300122C
_08065FEC: .4byte gBackgroundsData
_08065FF0: .4byte 0x083BE740
_08065FF4: .4byte gTilemapAndClipPointers
_08065FF8: .4byte 0x00007FFF
_08065FFC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	ldr r0, [sp, #0x10]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r0, [sp, #0x10]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x10]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066046:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r5, [sp, #0xc]
	adds r5, #6
	adds r6, #1
	cmp r4, sb
	blt _0806605A
	bl _08066C46
_0806605A:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080660B4
	ldr r0, _080660B0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080660F6
	.align 2, 0
_080660B0: .4byte 0x00007FFF
_080660B4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080660F6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066106
	bl _08066C46
_08066106:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066160
	ldr r0, _0806615C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080661A2
	.align 2, 0
_0806615C: .4byte 0x00007FFF
_08066160:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080661A2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080661B2
	bl _08066C46
_080661B2:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806620C
	ldr r0, _08066208 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806624E
	.align 2, 0
_08066208: .4byte 0x00007FFF
_0806620C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806624E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806625E
	bl _08066C46
_0806625E:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080662B8
	ldr r0, _080662B4 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080662FA
	.align 2, 0
_080662B4: .4byte 0x00007FFF
_080662B8:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080662FA:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806630A
	bl _08066C46
_0806630A:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066364
	ldr r0, _08066360 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080663A6
	.align 2, 0
_08066360: .4byte 0x00007FFF
_08066364:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080663A6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080663B6
	bl _08066C46
_080663B6:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066410
	ldr r0, _0806640C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066452
	.align 2, 0
_0806640C: .4byte 0x00007FFF
_08066410:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066452:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066462
	bl _08066C46
_08066462:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080664BC
	ldr r0, _080664B8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080664FE
	.align 2, 0
_080664B8: .4byte 0x00007FFF
_080664BC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080664FE:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806650C
	b _08066C46
_0806650C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066564
	ldr r0, _08066560 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080665A6
	.align 2, 0
_08066560: .4byte 0x00007FFF
_08066564:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080665A6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080665B4
	b _08066C46
_080665B4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806660C
	ldr r0, _08066608 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806664E
	.align 2, 0
_08066608: .4byte 0x00007FFF
_0806660C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806664E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _0806665C
	b _08066C46
_0806665C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080666B4
	ldr r0, _080666B0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080666F6
	.align 2, 0
_080666B0: .4byte 0x00007FFF
_080666B4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080666F6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066704
	b _08066C46
_08066704:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806675C
	ldr r0, _08066758 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806679E
	.align 2, 0
_08066758: .4byte 0x00007FFF
_0806675C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806679E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080667AC
	b _08066C46
_080667AC:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066804
	ldr r0, _08066800 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066846
	.align 2, 0
_08066800: .4byte 0x00007FFF
_08066804:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066846:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066854
	b _08066C46
_08066854:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080668AC
	ldr r0, _080668A8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080668EE
	.align 2, 0
_080668A8: .4byte 0x00007FFF
_080668AC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080668EE:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080668FC
	b _08066C46
_080668FC:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066954
	ldr r0, _08066950 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066996
	.align 2, 0
_08066950: .4byte 0x00007FFF
_08066954:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066996:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _080669A4
	b _08066C46
_080669A4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080669FC
	ldr r0, _080669F8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066A3E
	.align 2, 0
_080669F8: .4byte 0x00007FFF
_080669FC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066A3E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066A4C
	b _08066C46
_08066A4C:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066AA4
	ldr r0, _08066AA0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066AE6
	.align 2, 0
_08066AA0: .4byte 0x00007FFF
_08066AA4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066AE6:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	blt _08066AF4
	b _08066C46
_08066AF4:
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066B4C
	ldr r0, _08066B48 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066B8E
	.align 2, 0
_08066B48: .4byte 0x00007FFF
_08066B4C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066B8E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	bge _08066C46
	mov r1, r8
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08066BF4
	ldr r0, _08066BF0 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08066C36
	.align 2, 0
_08066BF0: .4byte 0x00007FFF
_08066BF4:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08066C36:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r6, #1
	cmp r4, sb
	bge _08066C46
	bl sub_08065F8C
_08066C46:
	ldr r5, [sp, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0xc]
	cmp r5, #2
	bgt _08066C54
	bl sub_08065EAA
_08066C54:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SendVerticalTilemap
SendVerticalTilemap: @ 0x08066C64
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r0, _08067018 @ =0x03005138
	str r0, [sp]
	movs r0, #0
_08066C76:
	ldr r1, [sp]
	ldrb r1, [r1]
	mov ip, r1
	adds r2, r0, #1
	str r2, [sp, #8]
	ldr r1, [sp]
	adds r1, #0xa0
	str r1, [sp, #4]
	mov r2, ip
	cmp r2, #0
	bne _08066C8E
	b _0806728C
_08066C8E:
	lsls r0, r0, #0xc
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r7, r0, r1
	ldr r2, [sp]
	ldrh r1, [r2, #4]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #7
	adds r7, r7, r0
	ldrh r5, [r2, #2]
	movs r4, #0
	cmp r4, ip
	blt _08066CAC
	b _0806728C
_08066CAC:
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_08066CB2:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066CC6
	add r1, r8
_08066CC6:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	ldr r2, [sp]
	adds r2, #6
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r3, r1, #0
	adds r3, #0x40
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r3]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	adds r6, r2, #0
	cmp r4, ip
	blt _08066D06
	b _0806728C
_08066D06:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066D1A
	add r1, r8
_08066D1A:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066D54
	b _0806728C
_08066D54:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066D68
	add r1, r8
_08066D68:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066DA2
	b _0806728C
_08066DA2:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066DB6
	add r1, r8
_08066DB6:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066DF0
	b _0806728C
_08066DF0:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066E04
	add r1, r8
_08066E04:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066E3E
	b _0806728C
_08066E3E:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066E52
	add r1, r8
_08066E52:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066E8C
	b _0806728C
_08066E8C:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066EA0
	add r1, r8
_08066EA0:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066EDA
	b _0806728C
_08066EDA:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066EEE
	add r1, r8
_08066EEE:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066F28
	b _0806728C
_08066F28:
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	movs r2, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08066F3C
	add r1, r8
_08066F3C:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066F76
	b _0806728C
_08066F76:
	movs r0, #0xf
	mov sl, r0
	adds r0, r5, #0
	movs r1, #0xf
	ands r0, r1
	lsls r1, r0, #1
	movs r2, #0x10
	mov sb, r2
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _08066F90
	add r1, r8
_08066F90:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08066FCA
	b _0806728C
_08066FCA:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08066FDE
	add r1, r8
_08066FDE:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r3, r6, #0
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	b _0806701C
	.align 2, 0
_08067018: .4byte 0x03005138
_0806701C:
	cmp r4, ip
	blt _08067022
	b _0806728C
_08067022:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067036
	add r1, r8
_08067036:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _08067070
	b _0806728C
_08067070:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067084
	add r1, r8
_08067084:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _080670BE
	b _0806728C
_080670BE:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _080670D2
	add r1, r8
_080670D2:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _0806710C
	b _0806728C
_0806710C:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067120
	add r1, r8
_08067120:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	blt _0806715A
	b _0806728C
_0806715A:
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _0806716E
	add r1, r8
_0806716E:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _080671BA
	add r1, r8
_080671BA:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067206
	add r1, r8
_08067206:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r3, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	adds r0, r5, #0
	mov r1, sl
	ands r0, r1
	lsls r1, r0, #1
	adds r0, r5, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08067252
	add r1, r8
_08067252:
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1, #2]
	adds r4, #1
	adds r2, r1, #0
	adds r2, #0x40
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	adds r1, #0x42
	lsls r0, r4, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	adds r5, #1
	cmp r4, ip
	bge _0806728C
	b _08066CB2
_0806728C:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	str r1, [sp]
	cmp r0, #2
	bgt _08067298
	b _08066C76
_08067298:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start UpdateHorizontalTilemap
UpdateHorizontalTilemap: @ 0x080672A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp, #8]
	ldr r2, _08067308 @ =gCurrentRoomEntry
	ldrb r0, [r2, #1]
	add r1, sp, #4
	strb r0, [r1]
	ldrb r3, [r2, #2]
	mov r0, sp
	adds r0, #5
	strb r3, [r0]
	ldrb r2, [r2, #3]
	adds r0, #1
	strb r2, [r0]
	mov r0, sp
	movs r2, #3
	bl memcpy
	ldr r0, _0806730C @ =0x03004FD0
	str r0, [sp, #0xc]
	movs r3, #0

	non_word_aligned_thumb_func_start sub_080672DA
sub_080672DA: @ 0x080672DA
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	mov r2, sp
	adds r0, r2, r3
	ldrb r1, [r0]
	movs r0, #0x10
	ands r0, r1
	adds r1, r3, #1
	str r1, [sp, #0x18]
	ldr r2, [sp, #0xc]
	adds r2, #0x78
	str r2, [sp, #0x1c]
	cmp r0, #0
	bne _080672FC
	bl _08067D86
_080672FC:
	cmp r3, #0
	bne _08067318
	ldr r0, _08067310 @ =0x03001226
	ldrh r4, [r0]
	ldr r0, _08067314 @ =0x03001224
	b _08067332
	.align 2, 0
_08067308: .4byte gCurrentRoomEntry
_0806730C: .4byte 0x03004FD0
_08067310: .4byte 0x03001226
_08067314: .4byte 0x03001224
_08067318:
	cmp r3, #1
	bne _0806732C
	ldr r0, _08067324 @ =gBg1YPosition
	ldrh r4, [r0]
	ldr r0, _08067328 @ =gBg1XPosition
	b _08067332
	.align 2, 0
_08067324: .4byte gBg1YPosition
_08067328: .4byte gBg1XPosition
_0806732C:
	ldr r0, _08067414 @ =0x0300122E
	ldrh r4, [r0]
	ldr r0, _08067418 @ =0x0300122C
_08067332:
	ldrh r1, [r0]
	ldr r2, [sp, #8]
	lsls r0, r2, #0x10
	lsrs r2, r0, #0x10
	lsrs r0, r1, #6
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r3, #1
	str r1, [sp, #0x18]
	ldr r1, [sp, #0xc]
	adds r1, #0x78
	str r1, [sp, #0x1c]
	cmp r0, #0
	bge _08067356
	bl _08067D86
_08067356:
	ldr r7, _0806741C @ =gBackgroundsData
	lsls r5, r3, #3
	adds r3, r5, r7
	ldrh r1, [r3, #4]
	cmp r0, r1
	ble _08067366
	bl _08067D86
_08067366:
	ldr r0, [sp, #0xc]
	strh r2, [r0, #2]
	lsrs r0, r4, #6
	subs r0, #2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r0, #0
	bge _08067378
	movs r2, #0
_08067378:
	ldr r1, [sp, #0xc]
	strh r2, [r1, #4]
	movs r2, #0xe
	mov sb, r2
	ldrh r0, [r3, #6]
	cmp r0, #0xe
	bge _08067388
	mov sb, r0
_08067388:
	mov r0, sb
	lsls r0, r0, #2
	mov sb, r0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	ldrh r0, [r3, #4]
	ldrh r1, [r1, #4]
	muls r0, r1, r0
	ldr r2, [sp, #0xc]
	ldrh r2, [r2, #2]
	adds r6, r0, r2
	movs r4, #0
	cmp r4, sb
	blt _080673A8
	bl _08067D86
_080673A8:
	mov r8, r5
	str r3, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #8
	mov sl, r0
	ldr r1, _08067420 @ =0x083BE740
	mov ip, r1
	ldr r7, _08067424 @ =gTilemapAndClipPointers
	ldr r2, [sp, #0xc]
	adds r2, #6
	str r2, [sp, #0x14]

	non_word_aligned_thumb_func_start sub_080673BE
sub_080673BE: @ 0x080673BE
	ldr r1, [sp, #0x10]
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0806742C
	ldr r0, _08067428 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r2, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067476
	.align 2, 0
_08067414: .4byte 0x0300122E
_08067418: .4byte 0x0300122C
_0806741C: .4byte gBackgroundsData
_08067420: .4byte 0x083BE740
_08067424: .4byte gTilemapAndClipPointers
_08067428: .4byte 0x00007FFF
_0806742C:
	lsls r3, r3, #2
	lsls r1, r4, #1
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r0, [sp, #0x14]
	adds r1, r0, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	ldr r2, [sp, #0x14]
	adds r1, r2, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067476:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r5, [sp, #0xc]
	adds r5, #6
	ldr r1, _080674E4 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067490
	bl _08067D86
_08067490:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080674EC
	ldr r0, _080674E8 @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _0806752E
	.align 2, 0
_080674E4: .4byte gBackgroundsData
_080674E8: .4byte 0x00007FFF
_080674EC:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_0806752E:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067598 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067544
	bl _08067D86
_08067544:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080675A0
	ldr r0, _0806759C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080675E2
	.align 2, 0
_08067598: .4byte gBackgroundsData
_0806759C: .4byte 0x00007FFF
_080675A0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080675E2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067648 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080675F6
	b _08067D86
_080675F6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067650
	ldr r0, _0806764C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067692
	.align 2, 0
_08067648: .4byte gBackgroundsData
_0806764C: .4byte 0x00007FFF
_08067650:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067692:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080676F8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080676A6
	b _08067D86
_080676A6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067700
	ldr r0, _080676FC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067742
	.align 2, 0
_080676F8: .4byte gBackgroundsData
_080676FC: .4byte 0x00007FFF
_08067700:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067742:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080677A8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067756
	b _08067D86
_08067756:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _080677B0
	ldr r0, _080677AC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080677F2
	.align 2, 0
_080677A8: .4byte gBackgroundsData
_080677AC: .4byte 0x00007FFF
_080677B0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080677F2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067858 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067806
	b _08067D86
_08067806:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067860
	ldr r0, _0806785C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _080678A2
	.align 2, 0
_08067858: .4byte gBackgroundsData
_0806785C: .4byte 0x00007FFF
_08067860:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_080678A2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067908 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _080678B6
	b _08067D86
_080678B6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067910
	ldr r0, _0806790C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067952
	.align 2, 0
_08067908: .4byte gBackgroundsData
_0806790C: .4byte 0x00007FFF
_08067910:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067952:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _080679B8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067966
	b _08067D86
_08067966:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _080679C0
	ldr r0, _080679BC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067A02
	.align 2, 0
_080679B8: .4byte gBackgroundsData
_080679BC: .4byte 0x00007FFF
_080679C0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067A02:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067A68 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067A16
	b _08067D86
_08067A16:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067A70
	ldr r0, _08067A6C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067AB2
	.align 2, 0
_08067A68: .4byte gBackgroundsData
_08067A6C: .4byte 0x00007FFF
_08067A70:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067AB2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067B18 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067AC6
	b _08067D86
_08067AC6:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067B20
	ldr r0, _08067B1C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067B62
	.align 2, 0
_08067B18: .4byte gBackgroundsData
_08067B1C: .4byte 0x00007FFF
_08067B20:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067B62:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067BC8 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067B76
	b _08067D86
_08067B76:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067BD0
	ldr r0, _08067BCC @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067C12
	.align 2, 0
_08067BC8: .4byte gBackgroundsData
_08067BCC: .4byte 0x00007FFF
_08067BD0:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067C12:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067C78 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	blt _08067C26
	b _08067D86
_08067C26:
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _08067C80
	ldr r0, _08067C7C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067CC2
	.align 2, 0
_08067C78: .4byte gBackgroundsData
_08067C7C: .4byte 0x00007FFF
_08067C80:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067CC2:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r1, _08067D28 @ =gBackgroundsData
	add r1, r8
	ldrh r0, [r1, #4]
	adds r6, r6, r0
	cmp r4, sb
	bge _08067D86
	ldr r0, [r1]
	lsls r1, r6, #1
	adds r1, r1, r0
	ldrh r3, [r1]
	adds r0, r3, #0
	mov r1, sl
	ands r0, r1
	cmp r0, #0
	beq _08067D30
	ldr r0, _08067D2C @ =0x00007FFF
	ands r0, r3
	lsls r3, r0, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r0, #3
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	lsls r0, r3, #1
	add r0, ip
	b _08067D72
	.align 2, 0
_08067D28: .4byte gBackgroundsData
_08067D2C: .4byte 0x00007FFF
_08067D30:
	lsls r3, r3, #2
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	adds r3, #1
	adds r4, #1
	lsls r1, r4, #1
	adds r1, r5, r1
	ldr r2, [r7]
	lsls r0, r3, #1
	adds r0, r0, r2
_08067D72:
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	ldr r2, [sp, #0x10]
	ldrh r0, [r2, #4]
	adds r6, r6, r0
	cmp r4, sb
	bge _08067D86
	bl sub_080673BE
_08067D86:
	ldr r3, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0xc]
	cmp r3, #2
	bgt _08067D94
	bl sub_080672DA
_08067D94:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SendHorizontalTilemap
SendHorizontalTilemap: @ 0x08067DA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r1, _080680B8 @ =0x03004FD0
	movs r0, #0
_08067DB0:
	ldrb r7, [r1]
	adds r2, r0, #1
	mov sb, r2
	movs r2, #0x78
	adds r2, r2, r1
	mov r8, r2
	cmp r7, #0
	bne _08067DC2
	b _080680A2
_08067DC2:
	lsls r3, r0, #0xc
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r6, r3, r0
	ldrh r2, [r1, #2]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _08067DD8
	ldr r0, _080680BC @ =0x06000800
	adds r6, r3, r0
_08067DD8:
	movs r0, #0xf
	ands r2, r0
	lsls r0, r2, #2
	adds r6, r6, r0
	ldrh r4, [r1, #4]
	movs r5, #0
	cmp r5, r7
	blt _08067DEA
	b _080680A2
_08067DEA:
	movs r2, #0xf
	mov ip, r2
	adds r3, r1, #6
_08067DF0:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E22
	b _080680A2
_08067E22:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E54
	b _080680A2
_08067E54:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067E86
	b _080680A2
_08067E86:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067EB8
	b _080680A2
_08067EB8:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067EEA
	b _080680A2
_08067EEA:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F1C
	b _080680A2
_08067F1C:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F4E
	b _080680A2
_08067F4E:
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	blt _08067F80
	b _080680A2
_08067F80:
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r1, ip
	ands r0, r1
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	lsls r0, r0, #7
	adds r0, r0, r6
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	ldrh r1, [r3]
	strh r1, [r0, #2]
	adds r3, #2
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r3]
	strh r1, [r2]
	adds r3, #2
	adds r0, #0x42
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r5, #4
	adds r4, #1
	cmp r5, r7
	bge _080680A2
	b _08067DF0
_080680A2:
	mov r0, sb
	mov r1, r8
	cmp r0, #2
	bgt _080680AC
	b _08067DB0
_080680AC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080680B8: .4byte 0x03004FD0
_080680BC: .4byte 0x06000800

	thumb_func_start WaitForDma3
WaitForDma3: @ 0x080680C0
	push {lr}
	ldr r2, _080680DC @ =0x040000D4
	ldr r0, [r2, #8]
	movs r1, #0x80
	lsls r1, r1, #0x18
	cmp r0, #0
	bge _080680D6
_080680CE:
	ldr r0, [r2, #8]
	ands r0, r1
	cmp r0, #0
	bne _080680CE
_080680D6:
	pop {r0}
	bx r0
	.align 2, 0
_080680DC: .4byte 0x040000D4
