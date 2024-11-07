    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start LoadInitialMinimap
LoadInitialMinimap: @ 0x08074FFC
	push {r4, r5, lr}
	ldr r5, _08075060 @ =gPreviousArea
	ldrb r0, [r5]
	ldr r4, _08075064 @ =0x02034000
	adds r1, r4, #0
	bl GetMinimapData
	ldr r1, _08075068 @ =0x040000D4
	str r4, [r1]
	ldr r0, _0807506C @ =0x02034800
	str r0, [r1, #4]
	ldr r0, _08075070 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r5]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r1, _08075074 @ =gSamusData
	ldrh r0, [r1, #0x16]
	subs r0, #0x80
	asrs r0, r0, #6
	ldrh r4, [r1, #0x18]
	subs r4, #0x80
	asrs r4, r4, #6
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	ldr r3, _08075078 @ =0x03000031
	ldr r1, _0807507C @ =0x0879B8BC
	ldr r2, [r1]
	adds r1, r2, #0
	adds r1, #0x35
	ldrb r1, [r1]
	adds r1, r1, r5
	strb r1, [r3]
	ldr r3, _08075080 @ =0x03000032
	adds r2, #0x36
	ldrb r1, [r2]
	adds r1, r1, r0
	strb r1, [r3]
	bl MinimapSetTileAsExplored
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075060: .4byte gPreviousArea
_08075064: .4byte 0x02034000
_08075068: .4byte 0x040000D4
_0807506C: .4byte 0x02034800
_08075070: .4byte 0x80000400
_08075074: .4byte gSamusData
_08075078: .4byte 0x03000031
_0807507C: .4byte 0x0879B8BC
_08075080: .4byte 0x03000032

	thumb_func_start MinimapUpdate
MinimapUpdate: @ 0x08075084
	push {lr}
	bl MinimapCheckForUnexploredTile
	ldr r0, _080750A4 @ =gMinimapUpdateFlag
	ldrb r0, [r0]
	cmp r0, #3
	bne _0807509A
	bl MinimapSetTileAsExplored
	bl MinimapUpdateForExploredTiles
_0807509A:
	bl MinimapDraw
	pop {r0}
	bx r0
	.align 2, 0
_080750A4: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapSetTileAsExplored
MinimapSetTileAsExplored: @ 0x080750A8
	push {lr}
	ldr r1, _080750D8 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _080750D4
	adds r2, r0, #0
	ldr r0, _080750DC @ =0x03000032
	lsls r2, r2, #5
	ldrb r0, [r0]
	adds r2, r2, r0
	lsls r2, r2, #2
	ldr r0, _080750E0 @ =0x02037C00
	adds r2, r2, r0
	ldr r1, _080750E4 @ =0x0879BDDC
	ldr r0, _080750E8 @ =0x03000031
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r2]
	ldr r0, [r0]
	orrs r1, r0
	str r1, [r2]
_080750D4:
	pop {r0}
	bx r0
	.align 2, 0
_080750D8: .4byte gCurrentArea
_080750DC: .4byte 0x03000032
_080750E0: .4byte 0x02037C00
_080750E4: .4byte 0x0879BDDC
_080750E8: .4byte 0x03000031

	thumb_func_start MinimapCheckForUnexploredTile
MinimapCheckForUnexploredTile: @ 0x080750EC
	push {r4, r5, r6, lr}
	ldr r0, _0807511C @ =gMinimapUpdateFlag
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _080751AC
	ldr r1, _08075120 @ =gSamusData
	ldrh r3, [r1, #0x16]
	adds r0, r3, #0
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r0, [r1, #0x18]
	subs r0, #0x80
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _08075124
	movs r4, #0
	b _0807513C
	.align 2, 0
_0807511C: .4byte gMinimapUpdateFlag
_08075120: .4byte gSamusData
_08075124:
	ldr r0, _0807514C @ =gBackgroundsData
	ldrh r0, [r0, #0x1c]
	lsls r0, r0, #0x16
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	cmp r3, r2
	blo _0807513C
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_0807513C:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08075150
	movs r5, #0
	b _0807516A
	.align 2, 0
_0807514C: .4byte gBackgroundsData
_08075150:
	ldr r0, _080751B4 @ =gBackgroundsData
	ldrh r0, [r0, #0x1e]
	lsls r0, r0, #0x16
	movs r2, #0xff
	lsls r2, r2, #0x18
	adds r0, r0, r2
	lsrs r2, r0, #0x10
	ldrh r0, [r1, #0x18]
	cmp r0, r2
	blo _0807516A
	subs r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_0807516A:
	lsrs r4, r4, #6
	lsrs r5, r5, #6
	adds r0, r4, #0
	movs r1, #0xf
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, _080751B8 @ =0x03000031
	ldrb r1, [r2]
	ldr r3, _080751BC @ =gCurrentRoomEntry
	ldrb r0, [r3, #0xe]
	adds r0, r4, r0
	cmp r1, r0
	beq _0807519A
	strb r0, [r2]
	movs r0, #3
	strb r0, [r6]
_0807519A:
	ldr r2, _080751C0 @ =0x03000032
	ldrb r1, [r2]
	ldrb r0, [r3, #0xf]
	adds r0, r5, r0
	cmp r1, r0
	beq _080751AC
	strb r0, [r2]
	movs r0, #3
	strb r0, [r6]
_080751AC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080751B4: .4byte gBackgroundsData
_080751B8: .4byte 0x03000031
_080751BC: .4byte gCurrentRoomEntry
_080751C0: .4byte 0x03000032

	thumb_func_start MinimapCheckOnTransition
MinimapCheckOnTransition: @ 0x080751C4
	push {r4, r5, lr}
	ldr r0, _0807524C @ =gCurrentArea
	ldrb r1, [r0]
	adds r2, r0, #0
	ldr r5, _08075250 @ =gPreviousArea
	cmp r1, #0
	bne _080751E2
	ldr r0, _08075254 @ =gCurrentCutscene
	ldrb r0, [r0]
	cmp r0, #0
	beq _080751E2
	cmp r0, #0xa
	bne _080751E2
	movs r0, #0x80
	strb r0, [r5]
_080751E2:
	ldrb r1, [r2]
	ldrb r0, [r5]
	cmp r0, r1
	beq _08075214
	strb r1, [r5]
	ldrb r0, [r5]
	ldr r4, _08075258 @ =0x02034000
	adds r1, r4, #0
	bl GetMinimapData
	ldr r1, _0807525C @ =0x040000D4
	str r4, [r1]
	ldr r0, _08075260 @ =0x02034800
	str r0, [r1, #4]
	ldr r0, _08075264 @ =0x80000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldrb r0, [r5]
	bl MinimapSetVisitedTilesAndCollectedItems
	ldr r0, _08075268 @ =0x03000031
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0807526C @ =0x03000032
	strb r1, [r0]
_08075214:
	ldr r4, _08075270 @ =gMinimapUpdateFlag
	movs r0, #0
	strb r0, [r4]
	bl MinimapCheckForUnexploredTile
	ldrb r0, [r4]
	cmp r0, #3
	bne _0807522C
	bl MinimapSetTileAsExplored
	bl MinimapUpdateForExploredTiles
_0807522C:
	movs r0, #1
	strb r0, [r4]
	bl MinimapDraw
	movs r0, #2
	strb r0, [r4]
	bl MinimapDraw
	movs r0, #3
	strb r0, [r4]
	bl MinimapDraw
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807524C: .4byte gCurrentArea
_08075250: .4byte gPreviousArea
_08075254: .4byte gCurrentCutscene
_08075258: .4byte 0x02034000
_0807525C: .4byte 0x040000D4
_08075260: .4byte 0x02034800
_08075264: .4byte 0x80000400
_08075268: .4byte 0x03000031
_0807526C: .4byte 0x03000032
_08075270: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapDraw
MinimapDraw: @ 0x08075274
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r0, _08075298 @ =gMinimapUpdateFlag
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _0807535A
	ldr r0, _0807529C @ =0x02034000
	mov r8, r0
	ldr r0, _080752A0 @ =0x02035C00
	str r0, [sp]
	adds r0, r1, #0
	cmp r0, #3
	bne _080752A4
	movs r6, #1
	b _080752B4
	.align 2, 0
_08075298: .4byte gMinimapUpdateFlag
_0807529C: .4byte 0x02034000
_080752A0: .4byte 0x02035C00
_080752A4:
	cmp r0, #2
	bne _080752AC
	movs r6, #0
	b _080752B4
_080752AC:
	cmp r1, #1
	bne _080752B4
	movs r6, #1
	rsbs r6, r6, #0
_080752B4:
	ldrb r0, [r2]
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	ldr r0, [sp]
	adds r0, r0, r1
	str r0, [sp]
	movs r5, #1
	rsbs r5, r5, #0
	add r4, sp, #4
_080752CA:
	ldr r0, _0807531C @ =0x03000031
	ldrb r0, [r0]
	adds r1, r0, r5
	cmp r1, #0x1f
	bls _080752D6
	movs r1, #0xff
_080752D6:
	ldr r0, _08075320 @ =0x03000032
	ldrb r0, [r0]
	adds r0, r0, r6
	cmp r0, #0x1f
	bls _080752E2
	movs r0, #0xff
_080752E2:
	cmp r0, #0xff
	beq _080752EA
	cmp r1, #0xff
	bne _080752EE
_080752EA:
	movs r1, #0x1f
	movs r0, #0x1f
_080752EE:
	lsls r0, r0, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	add r0, r8
	ldrh r1, [r0]
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r0, r2, #0
	adds r3, r0, #0
	ands r3, r1
	lsrs r2, r1, #0xc
	ldr r7, _08075324 @ =0x000003FF
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #5
	str r0, [sp, #4]
	cmp r3, #0
	bne _08075328
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileGfx
	b _08075354
	.align 2, 0
_0807531C: .4byte 0x03000031
_08075320: .4byte 0x03000032
_08075324: .4byte 0x000003FF
_08075328:
	movs r0, #0x80
	lsls r0, r0, #3
	cmp r3, r0
	bne _0807533A
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileXFlippedGfx
	b _08075354
_0807533A:
	movs r0, #0x80
	lsls r0, r0, #4
	cmp r3, r0
	bne _0807534C
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileYFlippedGfx
	b _08075354
_0807534C:
	mov r0, sp
	adds r1, r4, #0
	bl MinimapCopyTileXYFlippedGfx
_08075354:
	adds r5, #1
	cmp r5, #1
	ble _080752CA
_0807535A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start MinimapCopyTileGfx
MinimapCopyTileGfx: @ 0x08075368
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, _080753C0 @ =0x08561FA8
	mov r8, r0
	ldr r0, _080753C4 @ =0x085761C0
	mov ip, r0
	lsrs r2, r2, #0x14
	ldr r7, _080753C8 @ =0x08576190
	movs r6, #0x1f
_08075382:
	ldr r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	adds r1, r3, #0
	lsrs r0, r1, #4
	adds r0, r0, r2
	add r0, ip
	ldrb r3, [r0]
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r2
	adds r0, r0, r7
	ldrb r0, [r0]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r6, #1
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	cmp r6, #0
	bge _08075382
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080753C0: .4byte 0x08561FA8
_080753C4: .4byte 0x085761C0
_080753C8: .4byte 0x08576190

	thumb_func_start MinimapCopyTileXFlippedGfx
MinimapCopyTileXFlippedGfx: @ 0x080753CC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	movs r1, #0
	lsrs r6, r2, #0x14
	ldr r0, _0807543C @ =0x08561FA8
	mov sb, r0
	ldr r0, _08075440 @ =0x085761C0
	mov r8, r0
	ldr r0, _08075444 @ =0x08576190
	mov ip, r0
_080753EA:
	ldr r0, [r4]
	adds r0, #3
	str r0, [r4]
	adds r7, r1, #1
	movs r2, #3
_080753F4:
	ldr r0, [r4]
	add r0, sb
	ldrb r3, [r0]
	adds r1, r3, #0
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r6
	add r0, r8
	ldrb r3, [r0]
	lsrs r1, r1, #4
	adds r1, r1, r6
	add r1, ip
	ldrb r0, [r1]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r2, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, [r4]
	subs r0, r1, #1
	str r0, [r4]
	cmp r2, #0
	bge _080753F4
	adds r0, r1, #4
	str r0, [r4]
	adds r1, r7, #0
	cmp r1, #7
	ble _080753EA
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807543C: .4byte 0x08561FA8
_08075440: .4byte 0x085761C0
_08075444: .4byte 0x08576190

	thumb_func_start MinimapCopyTileYFlippedGfx
MinimapCopyTileYFlippedGfx: @ 0x08075448
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r0, #0x1c
	str r0, [r4]
	movs r0, #0
	lsrs r6, r2, #0x14
	ldr r1, _080754B8 @ =0x08561FA8
	mov sb, r1
	ldr r1, _080754BC @ =0x085761C0
	mov r8, r1
	ldr r1, _080754C0 @ =0x08576190
	mov ip, r1
_0807546C:
	adds r7, r0, #1
	movs r2, #3
_08075470:
	ldr r0, [r4]
	add r0, sb
	ldrb r3, [r0]
	adds r1, r3, #0
	lsrs r0, r1, #4
	adds r0, r0, r6
	add r0, r8
	ldrb r3, [r0]
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r6
	add r0, ip
	ldrb r0, [r0]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r2, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r1, [r4]
	adds r0, r1, #1
	str r0, [r4]
	cmp r2, #0
	bge _08075470
	subs r0, r1, #7
	str r0, [r4]
	adds r0, r7, #0
	cmp r0, #7
	ble _0807546C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080754B8: .4byte 0x08561FA8
_080754BC: .4byte 0x085761C0
_080754C0: .4byte 0x08576190

	thumb_func_start MinimapCopyTileXYFlippedGfx
MinimapCopyTileXYFlippedGfx: @ 0x080754C4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r2, r2, #0x18
	ldr r0, [r4]
	adds r0, #0x1f
	str r0, [r4]
	ldr r0, _08075520 @ =0x08561FA8
	mov r8, r0
	ldr r0, _08075524 @ =0x085761C0
	mov ip, r0
	lsrs r2, r2, #0x14
	ldr r7, _08075528 @ =0x08576190
	movs r6, #0x1f
_080754E4:
	ldr r0, [r4]
	add r0, r8
	ldrb r3, [r0]
	adds r1, r3, #0
	movs r0, #0xf
	ands r0, r1
	adds r0, r0, r2
	add r0, ip
	ldrb r3, [r0]
	lsrs r1, r1, #4
	adds r1, r1, r2
	adds r1, r1, r7
	ldrb r0, [r1]
	ldr r1, [r5]
	orrs r3, r0
	strb r3, [r1]
	subs r6, #1
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	cmp r6, #0
	bge _080754E4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075520: .4byte 0x08561FA8
_08075524: .4byte 0x085761C0
_08075528: .4byte 0x08576190

	thumb_func_start MapScreenSubroutine
MapScreenSubroutine: @ 0x0807552C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r7, #0
	ldr r0, _080755F8 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08075548
	b _080756CA
_08075548:
	ldr r2, _080755FC @ =gNonGameplayRam
	ldr r0, _08075600 @ =0x00000259
	adds r0, r0, r2
	mov r8, r0
	ldr r1, _08075604 @ =0x00000256
	adds r0, r2, r1
	mov r3, r8
	ldrb r1, [r3]
	mov r3, sp
	strb r1, [r3, #0x10]
	mov r1, r8
	movs r3, #0
	ldrsb r3, [r1, r3]
	movs r1, #0
	ldrsb r1, [r0, r1]
	eors r1, r3
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	mov sl, r0
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, sl
	strb r1, [r0]
	movs r0, #0
	mov ip, r0
	ldr r1, _08075608 @ =0x00000257
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, r3
	ble _08075592
	movs r3, #1
	mov ip, r3
_08075592:
	ldr r1, _0807560C @ =0x00000261
	adds r0, r6, r1
	mov r3, ip
	strb r3, [r0]
	movs r4, #0
	subs r1, #0xd
	adds r0, r6, r1
	movs r3, #0x96
	lsls r3, r3, #2
	adds r5, r6, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r5]
	mov sb, r1
	movs r2, #0
	ldrsb r2, [r5, r2]
	cmp r0, r2
	ble _080755BA
	movs r4, #1
_080755BA:
	ldr r3, _08075610 @ =0x0000025E
	adds r0, r6, r3
	strb r4, [r0]
	ldr r1, _08075614 @ =0x00000255
	adds r0, r6, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	eors r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r3, r0, #0x1f
	ldr r1, _08075618 @ =0x0000025F
	adds r0, r6, r1
	strb r3, [r0]
	ldr r0, _0807561C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	mov r2, sb
	cmp r0, #0
	beq _08075620
	mov r1, sl
	cmp r1, #0
	beq _0807565E
	mov r3, sp
	ldrb r0, [r3, #0x10]
	subs r0, #1
	mov r1, r8
	strb r0, [r1]
	b _0807565C
	.align 2, 0
_080755F8: .4byte gButtonInput
_080755FC: .4byte gNonGameplayRam
_08075600: .4byte 0x00000259
_08075604: .4byte 0x00000256
_08075608: .4byte 0x00000257
_0807560C: .4byte 0x00000261
_08075610: .4byte 0x0000025E
_08075614: .4byte 0x00000255
_08075618: .4byte 0x0000025F
_0807561C: .4byte gChangedInput
_08075620:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0807563A
	mov r3, ip
	cmp r3, #0
	beq _0807565E
	mov r1, sp
	ldrb r0, [r1, #0x10]
	adds r0, #1
	mov r3, r8
	strb r0, [r3]
	b _0807565C
_0807563A:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807564A
	cmp r4, #0
	beq _0807565E
	adds r0, r2, #1
	b _0807565A
_0807564A:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0807565E
	cmp r3, #0
	beq _0807565E
	mov r0, sb
	subs r0, #1
_0807565A:
	strb r0, [r5]
_0807565C:
	movs r7, #1
_0807565E:
	ldr r2, _080756AC @ =gBackgroundPositions
	adds r4, r6, #0
	movs r1, #0x96
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x80
	lsls r1, r1, #2
	adds r3, r1, #0
	subs r0, r3, r0
	movs r5, #0
	strh r0, [r2, #0xc]
	adds r1, #0x59
	adds r0, r4, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xa
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r0, r3, r0
	strh r0, [r2, #0xe]
	ldr r0, _080756B0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080756B4
	adds r1, r4, #0
	adds r1, #0x28
	movs r0, #6
	strb r0, [r1]
	strb r5, [r4, #6]
	strb r5, [r4, #7]
	b _080756C8
	.align 2, 0
_080756AC: .4byte gBackgroundPositions
_080756B0: .4byte gChangedInput
_080756B4:
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080756CA
	adds r1, r6, #0
	adds r1, #0x28
	movs r0, #0xb
	strb r0, [r1]
	strb r5, [r6, #6]
	strb r5, [r6, #7]
_080756C8:
	movs r7, #3
_080756CA:
	ldr r3, _080756E8 @ =gChangedInput
	ldrh r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080756D8
	movs r7, #2
_080756D8:
	cmp r7, #0
	beq _08075710
	cmp r7, #1
	bne _080756EC
	movs r0, #1
	bl unk_77840
	b _0807572C
	.align 2, 0
_080756E8: .4byte gChangedInput
_080756EC:
	cmp r7, #2
	bne _0807572C
	ldr r0, _0807570C @ =gNonGameplayRam
	ldrb r0, [r0, #1]
	cmp r0, #4
	beq _08075700
	cmp r0, #5
	beq _08075702
	cmp r0, #9
	bne _08075702
_08075700:
	movs r7, #1
_08075702:
	adds r0, r7, #0
	bl unk_77840
	b _0807572C
	.align 2, 0
_0807570C: .4byte gNonGameplayRam
_08075710:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0807572C
	ldr r0, _0807573C @ =gNonGameplayRam
	movs r1, #0x9d
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807572C
	movs r0, #1
	bl PauseScreenDrawIgtAndTanks
_0807572C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807573C: .4byte gNonGameplayRam

	thumb_func_start SetMapScreenSamusHeadPosition
SetMapScreenSamusHeadPosition: @ 0x08075740
	ldr r2, _08075760 @ =gNonGameplayRam
	ldr r0, _08075764 @ =0x03000031
	ldrb r0, [r0]
	lsls r0, r0, #3
	movs r3, #0xd7
	lsls r3, r3, #1
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, _08075768 @ =0x03000032
	ldrb r0, [r0]
	lsls r0, r0, #3
	subs r3, #2
	adds r1, r2, r3
	strh r0, [r1]
	bx lr
	.align 2, 0
_08075760: .4byte gNonGameplayRam
_08075764: .4byte 0x03000031
_08075768: .4byte 0x03000032

	thumb_func_start MinimapSetVisitedTilesAndCollectedItems
MinimapSetVisitedTilesAndCollectedItems: @ 0x0807576C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #7
	bls _0807577A
	movs r4, #7
_0807577A:
	adds r0, r4, #0
	bl MinimapSetVisitedTiles
	adds r0, r4, #0
	bl MinimapSetCollectedItems
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start MinimapSetVisitedTiles
MinimapSetVisitedTiles: @ 0x0807578C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #7
	cmp r0, #6
	bhi _080757A2
	adds r1, r0, #0
_080757A2:
	lsls r0, r1, #7
	ldr r3, _080757F0 @ =0x02037C00
	adds r2, r0, r3
	ldr r3, _080757F4 @ =0x02034000
	ldr r0, _080757F8 @ =gEquipment
	ldrb r0, [r0, #0xe]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08075822
	movs r1, #0
	ldr r5, _080757FC @ =0x0879BDDC
	mov r8, r5
	movs r0, #0x80
	lsls r0, r0, #6
	mov ip, r0
_080757C4:
	ldm r2!, {r0}
	adds r6, r1, #1
	adds r7, r2, #0
	mov sb, r0
	mov r2, r8
	movs r4, #0x1f
_080757D0:
	ldr r0, [r2]
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _08075800
	ldrh r1, [r3]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _0807580E
	movs r5, #0x80
	lsls r5, r5, #5
	adds r0, r5, #0
	orrs r0, r1
	b _0807580C
	.align 2, 0
_080757F0: .4byte 0x02037C00
_080757F4: .4byte 0x02034000
_080757F8: .4byte gEquipment
_080757FC: .4byte 0x0879BDDC
_08075800:
	ldrh r1, [r3]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	beq _0807580E
	movs r0, #0xa0
_0807580C:
	strh r0, [r3]
_0807580E:
	adds r2, #4
	subs r4, #1
	adds r3, #2
	cmp r4, #0
	bge _080757D0
	adds r1, r6, #0
	adds r2, r7, #0
	cmp r1, #0x1f
	ble _080757C4
	b _08075876
_08075822:
	movs r1, #0
	ldr r0, _0807585C @ =0x0879BDDC
	mov sl, r0
	movs r5, #0x80
	lsls r5, r5, #6
	mov sb, r5
	movs r0, #0x80
	lsls r0, r0, #5
	mov r8, r0
	movs r5, #0xa0
	mov ip, r5
_08075838:
	ldm r2!, {r0}
	adds r6, r1, #1
	adds r7, r2, #0
	adds r5, r0, #0
	mov r2, sl
	movs r4, #0x1f
_08075844:
	ldr r0, [r2]
	ands r0, r5
	cmp r0, #0
	beq _08075860
	ldrh r1, [r3]
	mov r0, sb
	ands r0, r1
	cmp r0, #0
	bne _08075864
	mov r0, r8
	orrs r0, r1
	b _08075862
	.align 2, 0
_0807585C: .4byte 0x0879BDDC
_08075860:
	mov r0, ip
_08075862:
	strh r0, [r3]
_08075864:
	adds r2, #4
	subs r4, #1
	adds r3, #2
	cmp r4, #0
	bge _08075844
	adds r1, r6, #0
	adds r2, r7, #0
	cmp r1, #0x1f
	ble _08075838
_08075876:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start MinimapSetCollectedItems
MinimapSetCollectedItems: @ 0x08075884
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r6, #7
	cmp r2, #6
	bhi _08075898
	adds r6, r2, #0
_08075898:
	ldr r0, _080758A8 @ =0x02034000
	mov sb, r0
	movs r7, #0x40
	cmp r6, #0
	beq _080758AC
	adds r6, #1
	b _080758AE
	.align 2, 0
_080758A8: .4byte 0x02034000
_080758AC:
	movs r7, #0x80
_080758AE:
	lsls r0, r6, #8
	ldr r1, _08075920 @ =0x02037200
	adds r5, r0, r1
	movs r6, #0
	cmp r6, r7
	bge _08075914
	ldrb r0, [r5]
	cmp r0, #0xff
	beq _08075914
	ldr r1, _08075924 @ =0x0879B8BC
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r8, r0
_080758CA:
	ldrb r0, [r5, #2]
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	ldrb r0, [r5, #3]
	subs r0, #2
	movs r1, #0xa
	bl __divsi3
	ldrb r2, [r5]
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	add r1, r8
	adds r2, r1, #0
	adds r2, #0x35
	ldrb r2, [r2]
	adds r4, r4, r2
	adds r1, #0x36
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r0, r0, r4
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	adds r6, #1
	adds r5, #4
	cmp r6, r7
	bge _08075914
	ldrb r0, [r5]
	cmp r0, #0xff
	bne _080758CA
_08075914:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075920: .4byte 0x02037200
_08075924: .4byte 0x0879B8BC

	thumb_func_start MinimapUpdateForExploredTiles
MinimapUpdateForExploredTiles: @ 0x08075928
	push {lr}
	ldr r0, _0807596C @ =gCurrentArea
	ldrb r0, [r0]
	cmp r0, #6
	bhi _08075982
	ldr r1, _08075970 @ =0x03000031
	ldr r0, _08075974 @ =0x03000032
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldrb r1, [r1]
	adds r0, r0, r1
	lsls r3, r0, #1
	ldr r0, _08075978 @ =0x02034000
	adds r2, r3, r0
	ldrh r1, [r2]
	movs r0, #0xc0
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08075982
	ldr r1, _0807597C @ =0x02034800
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	bne _08075980
	movs r3, #0x80
	lsls r3, r3, #5
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _08075982
	.align 2, 0
_0807596C: .4byte gCurrentArea
_08075970: .4byte 0x03000031
_08075974: .4byte 0x03000032
_08075978: .4byte 0x02034000
_0807597C: .4byte 0x02034800
_08075980:
	strh r1, [r2]
_08075982:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_75988
unk_75988: @ 0x08075988
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r1, _080759EC @ =gNonGameplayRam
	ldr r2, _080759F0 @ =0x0000025E
	adds r0, r1, r2
	movs r3, #0
	strb r3, [r0]
	ldr r4, _080759F4 @ =0x0000025F
	adds r0, r1, r4
	strb r3, [r0]
	adds r2, #2
	adds r0, r1, r2
	strb r3, [r0]
	adds r4, #2
	adds r0, r1, r4
	strb r3, [r0]
	subs r2, #0xb
	adds r0, r1, r2
	movs r2, #0x1f
	strb r2, [r0]
	ldr r0, _080759F8 @ =0x00000256
	adds r4, r1, r0
	strb r2, [r4]
	movs r2, #0x95
	lsls r2, r2, #2
	adds r0, r1, r2
	strb r3, [r0]
	adds r2, #3
	adds r0, r1, r2
	strb r3, [r0]
	ldr r6, _080759FC @ =0x02034000
	movs r5, #0
	mov ip, r1
	ldr r0, _08075A00 @ =gBackgroundPositions
	mov sb, r0
	adds r7, r4, #0
	adds r4, r6, #0
_080759DC:
	movs r2, #0
	ldrh r0, [r4]
	lsls r1, r3, #5
	cmp r0, #0xa0
	beq _08075A04
	strb r3, [r7]
	b _08075A26
	.align 2, 0
_080759EC: .4byte gNonGameplayRam
_080759F0: .4byte 0x0000025E
_080759F4: .4byte 0x0000025F
_080759F8: .4byte 0x00000256
_080759FC: .4byte 0x02034000
_08075A00: .4byte gBackgroundPositions
_08075A04:
	adds r2, #1
	cmp r2, #0x1f
	bgt _08075A1A
	adds r0, r1, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A04
	strb r3, [r7]
	movs r5, #1
_08075A1A:
	cmp r5, #0
	bne _08075A26
	adds r4, #0x40
	adds r3, #1
	cmp r3, #0x1f
	ble _080759DC
_08075A26:
	movs r5, #0
	movs r3, #0x20
	ldr r4, _08075A44 @ =0x030016DB
	movs r0, #0x80
	lsls r0, r0, #4
	adds r1, r6, r0
_08075A32:
	subs r1, #0x40
	subs r3, #1
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075A48
	strb r3, [r4]
	b _08075A68
	.align 2, 0
_08075A44: .4byte 0x030016DB
_08075A48:
	adds r2, #1
	cmp r2, #0x1f
	bgt _08075A60
	lsls r0, r3, #5
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A48
	strb r3, [r4]
	movs r5, #1
_08075A60:
	cmp r5, #0
	bne _08075A68
	cmp r3, #0
	bgt _08075A32
_08075A68:
	movs r5, #0
	movs r3, #0
	ldr r4, _08075A7C @ =0x030016D9
	adds r1, r6, #0
_08075A70:
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075A80
	strb r3, [r4]
	b _08075AA4
	.align 2, 0
_08075A7C: .4byte 0x030016D9
_08075A80:
	adds r2, #1
	cmp r2, #0x13
	bgt _08075A98
	lsls r0, r2, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075A80
	strb r3, [r4]
	movs r5, #1
_08075A98:
	cmp r5, #0
	bne _08075AA4
	adds r1, #2
	adds r3, #1
	cmp r3, #0x1f
	ble _08075A70
_08075AA4:
	movs r5, #0
	movs r3, #0x20
	ldr r4, _08075AC0 @ =0x030016D8
	adds r1, r6, #0
	adds r1, #0x40
_08075AAE:
	subs r1, #2
	subs r3, #1
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0xa0
	beq _08075AC4
	strb r3, [r4]
	b _08075AE4
	.align 2, 0
_08075AC0: .4byte 0x030016D8
_08075AC4:
	adds r2, #1
	cmp r2, #0x13
	bgt _08075ADC
	lsls r0, r2, #5
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	cmp r0, #0xa0
	beq _08075AC4
	strb r3, [r4]
	movs r5, #1
_08075ADC:
	cmp r5, #0
	bne _08075AE4
	cmp r3, #0
	bgt _08075AAE
_08075AE4:
	ldr r6, _08075B50 @ =0x00000255
	add r6, ip
	movs r4, #0x95
	lsls r4, r4, #2
	add r4, ip
	ldrb r2, [r6]
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r1, r0
	ble _08075AFE
	strb r2, [r4]
_08075AFE:
	ldr r5, _08075B54 @ =0x00000256
	add r5, ip
	ldr r3, _08075B58 @ =0x00000257
	add r3, ip
	ldrb r2, [r5]
	movs r1, #0
	ldrsb r1, [r5, r1]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r1, r0
	ble _08075B16
	strb r2, [r3]
_08075B16:
	ldrb r1, [r4]
	ldr r0, _08075B5C @ =0x0000025A
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r6]
	ldr r0, _08075B60 @ =0x0000025B
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r5]
	movs r0, #0x97
	lsls r0, r0, #2
	add r0, ip
	strb r1, [r0]
	ldrb r1, [r3]
	ldr r0, _08075B64 @ =0x0000025D
	add r0, ip
	strb r1, [r0]
	mov r1, r8
	cmp r1, #0
	beq _08075B6C
	movs r0, #0x84
	lsls r0, r0, #2
	add r0, ip
	ldrb r4, [r0]
	ldr r0, _08075B68 @ =0x00000211
	add r0, ip
	ldrb r1, [r0]
	b _08075BC6
	.align 2, 0
_08075B50: .4byte 0x00000255
_08075B54: .4byte 0x00000256
_08075B58: .4byte 0x00000257
_08075B5C: .4byte 0x0000025A
_08075B60: .4byte 0x0000025B
_08075B64: .4byte 0x0000025D
_08075B68: .4byte 0x00000211
_08075B6C:
	movs r0, #0
	ldrsb r0, [r6, r0]
	movs r1, #0
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	asrs r4, r0, #1
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	asrs r1, r0, #1
	adds r3, r1, #4
	subs r2, r1, #7
	ldr r0, _08075B98 @ =0x00000211
	add r0, ip
	ldrb r0, [r0]
	cmp r3, r0
	bge _08075B9C
	subs r0, r0, r3
	adds r1, r1, r0
	b _08075BA4
	.align 2, 0
_08075B98: .4byte 0x00000211
_08075B9C:
	cmp r2, r0
	ble _08075BA4
	subs r0, r2, r0
	subs r1, r1, r0
_08075BA4:
	adds r3, r4, #0
	adds r3, #0xc
	adds r2, r4, #0
	subs r2, #0xc
	movs r0, #0x84
	lsls r0, r0, #2
	add r0, ip
	ldrb r0, [r0]
	cmp r3, r0
	bge _08075BBE
	subs r0, r0, r3
	adds r4, r4, r0
	b _08075BC6
_08075BBE:
	cmp r2, r0
	ble _08075BC6
	subs r0, r2, r0
	subs r4, r4, r0
_08075BC6:
	mov r3, ip
	movs r2, #0x96
	lsls r2, r2, #2
	adds r0, r3, r2
	strb r4, [r0]
	ldr r4, _08075C54 @ =0x00000259
	adds r2, r3, r4
	strb r1, [r2]
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #0xf
	subs r0, r0, r1
	lsls r0, r0, #3
	subs r4, #0x59
	adds r1, r4, #0
	subs r0, r1, r0
	mov r4, sb
	strh r0, [r4, #0xc]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #0xa
	subs r0, r0, r2
	lsls r0, r0, #3
	subs r1, r1, r0
	strh r1, [r4, #0xe]
	ldr r0, _08075C58 @ =0x00000257
	adds r4, r3, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r1, _08075C5C @ =0x00000256
	adds r2, r3, r1
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	asrs r3, r0, #1
	cmp r3, #3
	ble _08075C14
	movs r3, #3
_08075C14:
	ldrb r0, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	ldrb r0, [r4]
	subs r0, r0, r3
	strb r0, [r4]
	movs r4, #0x95
	lsls r4, r4, #2
	add r4, ip
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r2, _08075C60 @ =0x00000255
	add r2, ip
	movs r1, #0
	ldrsb r1, [r2, r1]
	subs r0, r0, r1
	asrs r3, r0, #1
	cmp r3, #3
	ble _08075C3C
	movs r3, #3
_08075C3C:
	ldrb r0, [r2]
	adds r0, r0, r3
	strb r0, [r2]
	ldrb r0, [r4]
	subs r0, r0, r3
	strb r0, [r4]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075C54: .4byte 0x00000259
_08075C58: .4byte 0x00000257
_08075C5C: .4byte 0x00000256
_08075C60: .4byte 0x00000255

	thumb_func_start MinimapUpdateForCollectedItem
MinimapUpdateForCollectedItem: @ 0x08075C64
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	subs r0, #2
	movs r1, #0xf
	bl __divsi3
	adds r5, r0, #0
	ldr r6, _08075CB8 @ =gCurrentRoomEntry
	ldrb r0, [r6, #0xe]
	adds r5, r5, r0
	subs r4, #2
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, #0xf]
	adds r0, r0, r1
	lsls r0, r0, #5
	adds r5, r5, r0
	lsls r5, r5, #1
	ldr r0, _08075CBC @ =0x02034000
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r0, _08075CC0 @ =0x02034800
	adds r5, r5, r0
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldr r1, _08075CC4 @ =gMinimapUpdateFlag
	movs r0, #3
	strb r0, [r1]
	bl MinimapDraw
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075CB8: .4byte gCurrentRoomEntry
_08075CBC: .4byte 0x02034000
_08075CC0: .4byte 0x02034800
_08075CC4: .4byte gMinimapUpdateFlag

	thumb_func_start MinimapCheckIsTileExplored
MinimapCheckIsTileExplored: @ 0x08075CC8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	ldr r1, _08075D10 @ =gCurrentArea
	ldrb r0, [r1]
	cmp r0, #6
	bhi _08075D20
	adds r5, r0, #0
	lsls r5, r5, #5
	subs r0, r2, #2
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	ldr r6, _08075D14 @ =gCurrentRoomEntry
	ldrb r0, [r6, #0xe]
	adds r4, r4, r0
	subs r0, r7, #2
	movs r1, #0xa
	bl __divsi3
	ldrb r1, [r6, #0xf]
	adds r0, r0, r1
	adds r0, r0, r5
	lsls r0, r0, #2
	ldr r1, _08075D18 @ =0x02037C00
	adds r0, r0, r1
	ldr r1, _08075D1C @ =0x0879BDDC
	lsls r4, r4, #2
	adds r4, r4, r1
	ldr r0, [r0]
	ldr r1, [r4]
	ands r0, r1
	b _08075D22
	.align 2, 0
_08075D10: .4byte gCurrentArea
_08075D14: .4byte gCurrentRoomEntry
_08075D18: .4byte 0x02037C00
_08075D1C: .4byte 0x0879BDDC
_08075D20:
	movs r0, #1
_08075D22:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
