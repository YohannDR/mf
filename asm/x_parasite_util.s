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
	bl SoundPlayNotAlreadyPlaying
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
	bl SoundPlayNotAlreadyPlaying
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
	bl SoundPlayNotAlreadyPlaying
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
	bl SoundPlayNotAlreadyPlaying
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
	bl SpriteUtilRefillSamus
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
	bl SoundPlayNotAlreadyPlaying
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
	bl SpriteUtilMakeSpriteFaceSamusDirection
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
	ldr r3, _08061C24 @ =sXParasiteIdleFloatingYMovement
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
	ldr r3, _08061C2C @ =sXParasiteIdleFloatingXMovement
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
_08061C24: .4byte sXParasiteIdleFloatingYMovement
_08061C28: .4byte 0x00007FFF
_08061C2C: .4byte sXParasiteIdleFloatingXMovement
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
	bl SoundPlayNotAlreadyPlaying
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
	bl SoundPlayNotAlreadyPlaying
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
	bl SpriteUtilCheckMorphed
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
