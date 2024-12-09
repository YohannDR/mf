    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start EndingDrawIgtAndCompletionPercentage
EndingDrawIgtAndCompletionPercentage: @ 0x080A1480
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r1, #0
	ldr r0, _080A1548 @ =gInGameTimer
	ldrb r4, [r0]
	ldr r7, _080A154C @ =0x0874E650
	ldr r2, _080A1550 @ =0x0874E8D0
	mov ip, r2
	ldr r5, _080A1554 @ =gNonGameplayRam
	mov r8, r5
	cmp r4, #9
	ble _080A14A4
_080A149C:
	subs r4, #0xa
	adds r1, #1
	cmp r4, #9
	bgt _080A149C
_080A14A4:
	movs r6, #0
	ldrb r5, [r0, #1]
	lsls r4, r4, #6
	mov sb, r4
	cmp r5, #9
	ble _080A14B8
_080A14B0:
	subs r5, #0xa
	adds r6, #1
	cmp r5, #9
	bgt _080A14B0
_080A14B8:
	cmp r1, #0
	beq _080A14DC
	lsls r3, r1, #6
	ldr r0, _080A1558 @ =0x040000D4
	adds r1, r3, r7
	str r1, [r0]
	ldr r1, _080A155C @ =0x06010000
	str r1, [r0, #4]
	ldr r2, _080A1560 @ =0x80000020
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r4, ip
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _080A1564 @ =0x06010400
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_080A14DC:
	mov r3, sb
	ldr r0, _080A1558 @ =0x040000D4
	adds r1, r3, r7
	str r1, [r0]
	ldr r1, _080A1568 @ =0x06010040
	str r1, [r0, #4]
	ldr r2, _080A1560 @ =0x80000020
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r4, ip
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _080A156C @ =0x06010440
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	lsls r3, r6, #6
	adds r1, r3, r7
	str r1, [r0]
	ldr r1, _080A1570 @ =0x060100A0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _080A1574 @ =0x060104A0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	lsls r3, r5, #6
	adds r1, r3, r7
	str r1, [r0]
	ldr r1, _080A1578 @ =0x060100E0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _080A157C @ =0x060104E0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	movs r1, #0
	movs r4, #0
	mov r0, r8
	adds r0, #0x9a
	ldrb r6, [r0]
	cmp r6, #0x63
	ble _080A1584
_080A153E:
	subs r6, #0x64
	adds r1, #1
	cmp r6, #0x63
	bgt _080A153E
	b _080A1584
	.align 2, 0
_080A1548: .4byte gInGameTimer
_080A154C: .4byte 0x0874E650
_080A1550: .4byte 0x0874E8D0
_080A1554: .4byte gNonGameplayRam
_080A1558: .4byte 0x040000D4
_080A155C: .4byte 0x06010000
_080A1560: .4byte 0x80000020
_080A1564: .4byte 0x06010400
_080A1568: .4byte 0x06010040
_080A156C: .4byte 0x06010440
_080A1570: .4byte 0x060100A0
_080A1574: .4byte 0x060104A0
_080A1578: .4byte 0x060100E0
_080A157C: .4byte 0x060104E0
_080A1580:
	subs r6, #0xa
	adds r4, #1
_080A1584:
	cmp r6, #9
	bgt _080A1580
	cmp r1, #0
	beq _080A15C0
	lsls r3, r1, #6
	ldr r0, _080A15B0 @ =0x040000D4
	adds r1, r3, r7
	str r1, [r0]
	ldr r1, _080A15B4 @ =0x06010120
	str r1, [r0, #4]
	ldr r2, _080A15B8 @ =0x80000020
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r5, ip
	adds r1, r3, r5
	str r1, [r0]
	ldr r1, _080A15BC @ =0x06010520
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	b _080A15C4
	.align 2, 0
_080A15B0: .4byte 0x040000D4
_080A15B4: .4byte 0x06010120
_080A15B8: .4byte 0x80000020
_080A15BC: .4byte 0x06010520
_080A15C0:
	cmp r4, #0
	beq _080A15E4
_080A15C4:
	lsls r3, r4, #6
	ldr r0, _080A1610 @ =0x040000D4
	adds r1, r3, r7
	str r1, [r0]
	ldr r1, _080A1614 @ =0x06010160
	str r1, [r0, #4]
	ldr r2, _080A1618 @ =0x80000020
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r4, ip
	adds r1, r3, r4
	str r1, [r0]
	ldr r1, _080A161C @ =0x06010560
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_080A15E4:
	lsls r3, r6, #6
	ldr r0, _080A1610 @ =0x040000D4
	adds r1, r3, r7
	str r1, [r0]
	ldr r1, _080A1620 @ =0x060101A0
	str r1, [r0, #4]
	ldr r2, _080A1618 @ =0x80000020
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	mov r5, ip
	adds r1, r3, r5
	str r1, [r0]
	ldr r1, _080A1624 @ =0x060105A0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1610: .4byte 0x040000D4
_080A1614: .4byte 0x06010160
_080A1618: .4byte 0x80000020
_080A161C: .4byte 0x06010560
_080A1620: .4byte 0x060101A0
_080A1624: .4byte 0x060105A0

	thumb_func_start EndingImageUpdateLettersSpawnDelay
EndingImageUpdateLettersSpawnDelay: @ 0x080A1628
	push {r4, lr}
	adds r3, r0, #0
	ldr r1, _080A1660 @ =gNonGameplayRam
	movs r2, #0x92
	lsls r2, r2, #1
	adds r0, r1, r2
	adds r2, r3, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080A165A
	movs r4, #0xa1
	lsls r4, r4, #1
	adds r0, r1, r4
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A165A
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A165A
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_080A165A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A1660: .4byte gNonGameplayRam

	thumb_func_start EndingImageLoadTextOam
EndingImageLoadTextOam: @ 0x080A1664
	push {r4, r5, r6, r7, lr}
	adds r1, r0, #0
	ldr r0, _080A1680 @ =gLanguage
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _080A175C
	cmp r0, #4
	bgt _080A1684
	cmp r0, #3
	beq _080A1692
	b _080A1A28
	.align 2, 0
_080A1680: .4byte gLanguage
_080A1684:
	cmp r0, #5
	bne _080A168A
	b _080A1828
_080A168A:
	cmp r0, #6
	bne _080A1690
	b _080A195C
_080A1690:
	b _080A1A28
_080A1692:
	cmp r1, #0
	bne _080A16F8
	ldr r1, _080A16F0 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x13
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A16F4 @ =0x0874DE94
	movs r0, #0x95
	lsls r0, r0, #1
	adds r4, r5, r0
	movs r1, #0xb3
	lsls r1, r1, #1
	adds r6, r5, r1
	adds r0, #0x60
	adds r0, r0, r5
	mov ip, r0
_080A16BA:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0xc
	ble _080A16BA
	b _080A1B50
	.align 2, 0
_080A16F0: .4byte gNonGameplayRam
_080A16F4: .4byte 0x0874DE94
_080A16F8:
	ldr r1, _080A1754 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x14
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A1758 @ =0x0874DF30
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A171C:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0xd
	ble _080A171C
	b _080A1B50
	.align 2, 0
_080A1754: .4byte gNonGameplayRam
_080A1758: .4byte 0x0874DF30
_080A175C:
	cmp r1, #0
	bne _080A17C4
	ldr r1, _080A17BC @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x16
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A17C0 @ =0x0874E020
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A1784:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0xf
	ble _080A1784
	b _080A1B50
	.align 2, 0
_080A17BC: .4byte gNonGameplayRam
_080A17C0: .4byte 0x0874E020
_080A17C4:
	ldr r1, _080A1820 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x1a
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A1824 @ =0x0874E0E0
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A17E8:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0x13
	ble _080A17E8
	b _080A1B50
	.align 2, 0
_080A1820: .4byte gNonGameplayRam
_080A1824: .4byte 0x0874E0E0
_080A1828:
	cmp r1, #0
	bne _080A1890
	ldr r1, _080A1888 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x18
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A188C @ =0x0874E218
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A1850:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0x11
	ble _080A1850
	b _080A1B50
	.align 2, 0
_080A1888: .4byte gNonGameplayRam
_080A188C: .4byte 0x0874E218
_080A1890:
	cmp r1, #1
	bne _080A18F8
	ldr r1, _080A18F0 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x11
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A18F4 @ =0x0874E2F0
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A18B8:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0xa
	ble _080A18B8
	b _080A1B50
	.align 2, 0
_080A18F0: .4byte gNonGameplayRam
_080A18F4: .4byte 0x0874E2F0
_080A18F8:
	ldr r1, _080A1954 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x17
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A1958 @ =0x0874E374
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A191C:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0x10
	ble _080A191C
	b _080A1B50
	.align 2, 0
_080A1954: .4byte gNonGameplayRam
_080A1958: .4byte 0x0874E374
_080A195C:
	cmp r1, #0
	bne _080A19C4
	ldr r1, _080A19BC @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x15
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A19C0 @ =0x0874E488
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A1984:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0xe
	ble _080A1984
	b _080A1B50
	.align 2, 0
_080A19BC: .4byte gNonGameplayRam
_080A19C0: .4byte 0x0874E488
_080A19C4:
	ldr r1, _080A1A20 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x19
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A1A24 @ =0x0874E53C
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A19E8:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0x12
	ble _080A19E8
	b _080A1B50
	.align 2, 0
_080A1A20: .4byte gNonGameplayRam
_080A1A24: .4byte 0x0874E53C
_080A1A28:
	cmp r1, #0
	bne _080A1A90
	ldr r1, _080A1A88 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0xf
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A1A8C @ =0x0874DC90
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A1A50:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #8
	ble _080A1A50
	b _080A1B50
	.align 2, 0
_080A1A88: .4byte gNonGameplayRam
_080A1A8C: .4byte 0x0874DC90
_080A1A90:
	cmp r1, #1
	bne _080A1AF8
	ldr r1, _080A1AF0 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x11
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A1AF4 @ =0x0874DCFC
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A1AB8:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0xa
	ble _080A1AB8
	b _080A1B50
	.align 2, 0
_080A1AF0: .4byte gNonGameplayRam
_080A1AF4: .4byte 0x0874DCFC
_080A1AF8:
	ldr r1, _080A1B58 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x9b
	movs r0, #0x17
	strb r0, [r2]
	movs r3, #0
	adds r5, r1, #0
	movs r7, #0x18
	ldr r2, _080A1B5C @ =0x0874DD80
	movs r1, #0x95
	lsls r1, r1, #1
	adds r4, r5, r1
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r6, r5, r0
	adds r1, #0x60
	adds r1, r1, r5
	mov ip, r1
_080A1B1C:
	ldrb r0, [r2]
	strb r0, [r4]
	ldrb r0, [r2, #1]
	strb r0, [r4, #0x1e]
	ldrb r0, [r2, #2]
	strb r0, [r6]
	ldrh r0, [r2, #4]
	mov r1, ip
	strh r0, [r1]
	ldrh r0, [r2, #6]
	strh r0, [r1, #0x3c]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r5, r1
	adds r0, r7, r0
	ldr r1, [r2, #8]
	str r1, [r0]
	adds r7, #4
	movs r0, #2
	add ip, r0
	adds r2, #0xc
	adds r4, #1
	adds r6, #1
	adds r3, #1
	cmp r3, #0x10
	ble _080A1B1C
_080A1B50:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1B58: .4byte gNonGameplayRam
_080A1B5C: .4byte 0x0874DD80

	thumb_func_start EndingImageDisplayLinePermanently
EndingImageDisplayLinePermanently: @ 0x080A1B60
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080A1B7C @ =gLanguage
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _080A1BA4
	cmp r0, #4
	bgt _080A1B80
	cmp r0, #3
	beq _080A1B8A
	b _080A1BEC
	.align 2, 0
_080A1B7C: .4byte gLanguage
_080A1B80:
	cmp r0, #5
	beq _080A1BBC
	cmp r0, #6
	beq _080A1BD4
	b _080A1BEC
_080A1B8A:
	ldr r0, _080A1B9C @ =gNonGameplayRam
	mov ip, r0
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r6, r1
	ldr r5, _080A1BA0 @ =0x0874DE4C
	b _080A1BFA
	.align 2, 0
_080A1B9C: .4byte gNonGameplayRam
_080A1BA0: .4byte 0x0874DE4C
_080A1BA4:
	ldr r0, _080A1BB4 @ =gNonGameplayRam
	mov ip, r0
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r6, r1
	ldr r5, _080A1BB8 @ =0x0874DFD8
	b _080A1BFA
	.align 2, 0
_080A1BB4: .4byte gNonGameplayRam
_080A1BB8: .4byte 0x0874DFD8
_080A1BBC:
	ldr r0, _080A1BCC @ =gNonGameplayRam
	mov ip, r0
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r6, r1
	ldr r5, _080A1BD0 @ =0x0874E1D0
	b _080A1BFA
	.align 2, 0
_080A1BCC: .4byte gNonGameplayRam
_080A1BD0: .4byte 0x0874E1D0
_080A1BD4:
	ldr r0, _080A1BE4 @ =gNonGameplayRam
	mov ip, r0
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r6, r1
	ldr r5, _080A1BE8 @ =0x0874E440
	b _080A1BFA
	.align 2, 0
_080A1BE4: .4byte gNonGameplayRam
_080A1BE8: .4byte 0x0874E440
_080A1BEC:
	ldr r0, _080A1C7C @ =gNonGameplayRam
	mov ip, r0
	movs r1, #0x92
	lsls r1, r1, #1
	add r1, ip
	adds r1, r6, r1
	ldr r5, _080A1C80 @ =0x0874DC48
_080A1BFA:
	lsls r3, r6, #1
	adds r4, r3, r6
	lsls r4, r4, #2
	adds r2, r4, r5
	ldrb r0, [r2]
	strb r0, [r1]
	movs r0, #0xa1
	lsls r0, r0, #1
	add r0, ip
	adds r0, r6, r0
	ldrb r1, [r2, #1]
	strb r1, [r0]
	movs r0, #0xb0
	lsls r0, r0, #1
	add r0, ip
	adds r0, r6, r0
	ldrb r1, [r2, #2]
	strb r1, [r0]
	movs r0, #0xbf
	lsls r0, r0, #1
	add r0, ip
	adds r0, r3, r0
	ldrh r1, [r2, #4]
	strh r1, [r0]
	movs r0, #0xdd
	lsls r0, r0, #1
	add r0, ip
	adds r3, r3, r0
	ldrh r0, [r2, #6]
	strh r0, [r3]
	lsls r1, r6, #2
	movs r0, #0xfc
	lsls r0, r0, #1
	add r0, ip
	adds r1, r1, r0
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	str r0, [r1]
	mov r1, ip
	movs r3, #0
	adds r2, r1, #0
	adds r2, #0x9b
	ldrb r0, [r2]
	subs r0, #6
	cmp r3, r0
	bge _080A1C70
	movs r5, #0
	adds r4, r2, #0
	movs r0, #0x95
	lsls r0, r0, #1
	adds r2, r1, r0
_080A1C62:
	strb r5, [r2]
	adds r2, #1
	adds r3, #1
	ldrb r0, [r4]
	subs r0, #6
	cmp r3, r0
	blt _080A1C62
_080A1C70:
	adds r1, #0x9b
	movs r0, #6
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1C7C: .4byte gNonGameplayRam
_080A1C80: .4byte 0x0874DC48

	thumb_func_start CreditsSubroutine
CreditsSubroutine: @ 0x080A1C84
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _080A1CA4 @ =gNonGameplayRam
	strb r5, [r0]
	ldr r0, _080A1CA8 @ =gNextOamSlot
	strb r5, [r0]
	ldr r4, _080A1CAC @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _080A1CC0
	cmp r0, #1
	bgt _080A1CB0
	cmp r0, #0
	beq _080A1CBA
	b _080A1CF2
	.align 2, 0
_080A1CA4: .4byte gNonGameplayRam
_080A1CA8: .4byte gNextOamSlot
_080A1CAC: .4byte gSubGameMode1
_080A1CB0:
	cmp r0, #2
	beq _080A1CE0
	cmp r0, #3
	beq _080A1CF0
	b _080A1CF2
_080A1CBA:
	bl CreditsInit
	b _080A1CE8
_080A1CC0:
	ldr r1, _080A1CD0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _080A1CD4
	subs r0, #1
	strh r0, [r1]
	b _080A1CF2
	.align 2, 0
_080A1CD0: .4byte gWrittenToBldy
_080A1CD4:
	ldr r0, _080A1CDC @ =0x04000050
	strh r5, [r0]
	b _080A1CE8
	.align 2, 0
_080A1CDC: .4byte 0x04000050
_080A1CE0:
	bl CreditsProcess
	cmp r0, #0
	beq _080A1CF2
_080A1CE8:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080A1CF2
_080A1CF0:
	movs r5, #1
_080A1CF2:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_a1cfc
unk_a1cfc: @ 0x080A1CFC
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CreditsVblank
CreditsVblank: @ 0x080A1D08
	push {lr}
	ldr r0, _080A1D58 @ =gNonGameplayRam
	mov ip, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A1D40
	ldr r1, _080A1D5C @ =0x040000D4
	mov r0, ip
	adds r0, #0xa
	str r0, [r1]
	adds r0, #0x82
	ldr r0, [r0]
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r0, r0, r3
	str r0, [r1, #4]
	ldr r2, _080A1D60 @ =0x80000020
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, ip
	adds r0, #0x4a
	str r0, [r1]
	adds r0, #0x46
	ldr r0, [r0]
	adds r0, r0, r3
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
_080A1D40:
	ldr r1, _080A1D64 @ =0x04000054
	ldr r0, _080A1D68 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x42
	ldr r0, _080A1D6C @ =0x03001226
	ldrh r0, [r0]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x17
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A1D58: .4byte gNonGameplayRam
_080A1D5C: .4byte 0x040000D4
_080A1D60: .4byte 0x80000020
_080A1D64: .4byte 0x04000054
_080A1D68: .4byte gWrittenToBldy
_080A1D6C: .4byte 0x03001226

	thumb_func_start SamusPosingVblank
SamusPosingVblank: @ 0x080A1D70
	ldr r1, _080A1DA8 @ =0x040000D4
	ldr r0, _080A1DAC @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080A1DB0 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0x80
	ldr r0, _080A1DB4 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _080A1DB8 @ =0x04000012
	ldr r0, _080A1DBC @ =0x03001226
	ldrh r0, [r0]
	lsrs r0, r0, #4
	ldr r3, _080A1DC0 @ =0x000001FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	adds r2, #8
	ldr r0, _080A1DC4 @ =0x0300122E
	ldrh r0, [r0]
	lsrs r0, r0, #4
	ands r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_080A1DA8: .4byte 0x040000D4
_080A1DAC: .4byte gOamData
_080A1DB0: .4byte 0x84000100
_080A1DB4: .4byte gWrittenToBldy
_080A1DB8: .4byte 0x04000012
_080A1DBC: .4byte 0x03001226
_080A1DC0: .4byte 0x000001FF
_080A1DC4: .4byte 0x0300122E

	thumb_func_start EndingImageVblank
EndingImageVblank: @ 0x080A1DC8
	push {r4, r5, lr}
	ldr r4, _080A1E38 @ =0x040000D4
	ldr r0, _080A1E3C @ =gOamData
	str r0, [r4]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _080A1E40 @ =0x84000100
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r5, _080A1E44 @ =gNonGameplayRam
	ldrb r0, [r5]
	cmp r0, #0
	beq _080A1E0E
	adds r3, r5, #0
	adds r3, #0xa
	str r3, [r4]
	adds r0, r5, #0
	adds r0, #0x8c
	ldr r0, [r0]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	str r0, [r4, #4]
	ldr r1, _080A1E48 @ =0x80000020
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	str r3, [r4]
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, r0, r2
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
_080A1E0E:
	ldr r1, _080A1E4C @ =0x04000054
	ldr r0, _080A1E50 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _080A1E54 @ =0x04000012
	ldr r0, _080A1E58 @ =0x03001226
	ldrh r0, [r0]
	lsrs r0, r0, #4
	ldr r3, _080A1E5C @ =0x000001FF
	adds r1, r3, #0
	ands r0, r1
	strh r0, [r2]
	adds r2, #4
	ldr r0, _080A1E60 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #4
	ands r0, r1
	strh r0, [r2]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A1E38: .4byte 0x040000D4
_080A1E3C: .4byte gOamData
_080A1E40: .4byte 0x84000100
_080A1E44: .4byte gNonGameplayRam
_080A1E48: .4byte 0x80000020
_080A1E4C: .4byte 0x04000054
_080A1E50: .4byte gWrittenToBldy
_080A1E54: .4byte 0x04000012
_080A1E58: .4byte 0x03001226
_080A1E5C: .4byte 0x000001FF
_080A1E60: .4byte gBg1YPosition

	thumb_func_start SamusPosingHblankCode
SamusPosingHblankCode: @ 0x080A1E64
	ldr r0, _080A1E80 @ =0x04000006
	ldr r2, _080A1E84 @ =gNonGameplayRam
	ldrh r0, [r0]
	ldrh r1, [r2, #6]
	adds r0, r0, r1
	movs r1, #0x7f
	ands r0, r1
	ldr r1, _080A1E88 @ =0x04000010
	adds r2, #0xa4
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080A1E80: .4byte 0x04000006
_080A1E84: .4byte gNonGameplayRam
_080A1E88: .4byte 0x04000010

	thumb_func_start CreditsInit
CreditsInit: @ 0x080A1E8C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r3, _080A1FD0 @ =0x04000208
	movs r6, #0
	strh r6, [r3]
	ldr r2, _080A1FD4 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _080A1FD8 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _080A1FDC @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080A1FE0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	mov sb, r0
	strh r0, [r3]
	ldr r0, _080A1FE4 @ =unk_a1cfc
	bl CallbackSetVBlank
	movs r1, #0x80
	lsls r1, r1, #0x13
	mov r8, r1
	strh r6, [r1]
	movs r5, #0
	str r5, [sp]
	ldr r4, _080A1FE8 @ =0x040000D4
	mov r2, sp
	str r2, [r4]
	ldr r7, _080A1FEC @ =gNonGameplayRam
	str r7, [r4, #4]
	ldr r0, _080A1FF0 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl ClearGfxRam
	ldr r1, _080A1FF4 @ =0x08747900
	str r1, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r2, _080A1FF8 @ =0x80000400
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r1, r3
	str r0, [r4]
	ldr r0, _080A1FFC @ =0x06000800
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	str r1, [r4]
	ldr r0, _080A2000 @ =0x06001000
	str r0, [r4, #4]
	ldr r0, _080A2004 @ =0x80000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080A2008 @ =0x08748D00
	str r0, [r4]
	ldr r0, _080A200C @ =0x06001400
	str r0, [r4, #4]
	ldr r0, _080A2010 @ =0x800000E0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080A2014 @ =0x08748EC0
	str r0, [r4]
	ldr r0, _080A2018 @ =0x06001800
	str r0, [r4, #4]
	ldr r1, _080A201C @ =0x80000120
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080A2020 @ =0x08749100
	str r0, [r4]
	ldr r0, _080A2024 @ =0x06001C00
	str r0, [r4, #4]
	ldr r0, _080A2028 @ =0x80000160
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080A202C @ =0x087493C0
	str r0, [r4]
	ldr r0, _080A2030 @ =0x06002000
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080A2034 @ =0x087478A0
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _080A2038 @ =0x80000030
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _080A203C @ =0x04000008
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r3, #0x88
	lsls r3, r3, #5
	adds r0, r3, #0
	mov r1, r8
	strh r0, [r1]
	ldr r0, _080A2040 @ =gNextOamSlot
	strb r6, [r0]
	bl ResetFreeOam
	ldr r0, _080A2044 @ =0x03001224
	strh r5, [r0]
	ldr r0, _080A2048 @ =0x03001226
	strh r5, [r0]
	ldr r0, _080A204C @ =gBg1XPosition
	strh r5, [r0]
	ldr r0, _080A2050 @ =gBg1YPosition
	strh r5, [r0]
	ldr r0, _080A2054 @ =0x0300122C
	strh r5, [r0]
	ldr r0, _080A2058 @ =0x0300122E
	strh r5, [r0]
	ldr r0, _080A205C @ =0x03001230
	strh r5, [r0]
	ldr r0, _080A2060 @ =0x03001232
	strh r5, [r0]
	ldr r0, _080A2064 @ =0x04000010
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	movs r0, #0x80
	strh r0, [r7, #8]
	ldr r2, _080A2068 @ =gInGameTimer
	ldrb r1, [r2]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldrb r2, [r2, #1]
	adds r0, r0, r2
	cmp r0, #0x77
	bgt _080A206C
	adds r1, r7, #0
	adds r1, #0x99
	movs r0, #2
	strb r0, [r1]
	b _080A2078
	.align 2, 0
_080A1FD0: .4byte 0x04000208
_080A1FD4: .4byte 0x04000004
_080A1FD8: .4byte 0x0000FFEF
_080A1FDC: .4byte 0x04000200
_080A1FE0: .4byte 0x0000FFFD
_080A1FE4: .4byte unk_a1cfc
_080A1FE8: .4byte 0x040000D4
_080A1FEC: .4byte gNonGameplayRam
_080A1FF0: .4byte 0x85000150
_080A1FF4: .4byte 0x08747900
_080A1FF8: .4byte 0x80000400
_080A1FFC: .4byte 0x06000800
_080A2000: .4byte 0x06001000
_080A2004: .4byte 0x80000200
_080A2008: .4byte 0x08748D00
_080A200C: .4byte 0x06001400
_080A2010: .4byte 0x800000E0
_080A2014: .4byte 0x08748EC0
_080A2018: .4byte 0x06001800
_080A201C: .4byte 0x80000120
_080A2020: .4byte 0x08749100
_080A2024: .4byte 0x06001C00
_080A2028: .4byte 0x80000160
_080A202C: .4byte 0x087493C0
_080A2030: .4byte 0x06002000
_080A2034: .4byte 0x087478A0
_080A2038: .4byte 0x80000030
_080A203C: .4byte 0x04000008
_080A2040: .4byte gNextOamSlot
_080A2044: .4byte 0x03001224
_080A2048: .4byte 0x03001226
_080A204C: .4byte gBg1XPosition
_080A2050: .4byte gBg1YPosition
_080A2054: .4byte 0x0300122C
_080A2058: .4byte 0x0300122E
_080A205C: .4byte 0x03001230
_080A2060: .4byte 0x03001232
_080A2064: .4byte 0x04000010
_080A2068: .4byte gInGameTimer
_080A206C:
	cmp r0, #0xef
	bgt _080A2078
	adds r0, r7, #0
	adds r0, #0x99
	mov r2, sb
	strb r2, [r0]
_080A2078:
	ldr r5, _080A20E0 @ =gEquipment
	ldrh r0, [r5, #2]
	subs r0, #0x63
	movs r1, #0x64
	bl __divsi3
	adds r4, r0, #0
	cmp r4, #0
	bge _080A208C
	movs r4, #0
_080A208C:
	ldrh r0, [r5, #6]
	subs r0, #0xa
	movs r1, #5
	bl __divsi3
	adds r3, r0, #0
	cmp r3, #0
	bge _080A209E
	movs r3, #0
_080A209E:
	ldrb r0, [r5, #9]
	subs r0, #0xa
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r2, r0, #1
	cmp r2, #0
	bge _080A20AE
	movs r2, #0
_080A20AE:
	ldr r1, _080A20E4 @ =gNonGameplayRam
	adds r0, r4, r3
	adds r0, r0, r2
	adds r1, #0x9a
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bls _080A20C4
	movs r0, #0x64
	strb r0, [r1]
_080A20C4:
	movs r0, #0x55
	movs r1, #0xe
	bl MusicPlay
	ldr r0, _080A20E8 @ =CreditsVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A20E0: .4byte gEquipment
_080A20E4: .4byte gNonGameplayRam
_080A20E8: .4byte CreditsVblank

	thumb_func_start CreditsProcess
CreditsProcess: @ 0x080A20EC
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r1, _080A2108 @ =gNonGameplayRam
	ldrb r0, [r1, #1]
	adds r4, r1, #0
	cmp r0, #9
	bls _080A20FC
	b _080A22D8
_080A20FC:
	lsls r0, r0, #2
	ldr r1, _080A210C @ =_080A2110
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A2108: .4byte gNonGameplayRam
_080A210C: .4byte _080A2110
_080A2110: @ jump table
	.4byte _080A2138 @ case 0
	.4byte _080A21C4 @ case 1
	.4byte _080A2218 @ case 2
	.4byte _080A224E @ case 3
	.4byte _080A227C @ case 4
	.4byte _080A2218 @ case 5
	.4byte _080A22AC @ case 6
	.4byte _080A227C @ case 7
	.4byte _080A2218 @ case 8
	.4byte _080A22D0 @ case 9
_080A2138:
	ldrh r1, [r4, #8]
	cmp r1, #0x7f
	bls _080A21AA
	movs r0, #0x7f
	ands r0, r1
	strh r0, [r4, #8]
	ldrh r0, [r4, #2]
	ldrh r1, [r4, #4]
	cmp r0, r1
	bne _080A21A4
	ldrh r0, [r4, #6]
	bl CreditsDisplayLine
	adds r6, r0, #0
	cmp r6, #9
	bne _080A2160
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _080A21A4
_080A2160:
	ldrh r0, [r4, #4]
	lsls r3, r0, #6
	movs r2, #0xa0
	lsls r2, r2, #3
	adds r0, r3, r2
	ldr r2, _080A21BC @ =0x000007FF
	cmp r0, r2
	ble _080A2172
	ands r0, r2
_080A2172:
	adds r1, r4, #0
	adds r1, #0x8c
	movs r5, #0x80
	lsls r5, r5, #8
	adds r0, r0, r5
	str r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #3
	adds r0, r3, r1
	cmp r0, r2
	ble _080A218A
	ands r0, r2
_080A218A:
	adds r1, r4, #0
	adds r1, #0x90
	adds r0, r0, r5
	str r0, [r1]
	ldrh r0, [r4, #4]
	adds r0, r0, r6
	strh r0, [r4, #4]
	ldrh r0, [r4, #6]
	adds r0, #1
	strh r0, [r4, #6]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_080A21A4:
	ldrh r0, [r4, #2]
	adds r0, #1
	strh r0, [r4, #2]
_080A21AA:
	ldrh r0, [r4, #8]
	adds r0, #9
	strh r0, [r4, #8]
	ldr r1, _080A21C0 @ =0x03001226
	ldrh r0, [r1]
	adds r0, #9
	strh r0, [r1]
	b _080A22D8
	.align 2, 0
_080A21BC: .4byte 0x000007FF
_080A21C0: .4byte 0x03001226
_080A21C4:
	ldr r0, _080A2208 @ =gNonGameplayRam
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x4a
	adds r0, #0xa
	movs r1, #0x1f
_080A21D0:
	strh r3, [r0]
	strh r3, [r2]
	adds r2, #2
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _080A21D0
	adds r2, r4, #0
	adds r2, #0x94
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	lsls r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0x12
	cmp r0, r1
	bls _080A22D8
	ldr r1, _080A220C @ =0x04000050
	ldr r3, _080A2210 @ =0x00001FDF
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _080A2214 @ =gWrittenToBldy
	movs r0, #0
	strh r0, [r1]
	movs r0, #0
	strh r0, [r2]
	b _080A22C2
	.align 2, 0
_080A2208: .4byte gNonGameplayRam
_080A220C: .4byte 0x04000050
_080A2210: .4byte 0x00001FDF
_080A2214: .4byte gWrittenToBldy
_080A2218:
	ldr r5, _080A2238 @ =gWrittenToBldy
	ldrh r3, [r5]
	cmp r3, #0xf
	bhi _080A223C
	adds r1, r4, #0
	adds r1, #0x94
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080A22D8
	adds r0, r3, #1
	strh r0, [r5]
	b _080A22D8
	.align 2, 0
_080A2238: .4byte gWrittenToBldy
_080A223C:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x94
	movs r0, #0
	strh r0, [r1]
	b _080A22C2
_080A224E:
	ldr r1, _080A2274 @ =0x0879ECA0
	adds r0, r4, #0
	adds r0, #0x98
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	beq _080A226A
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
_080A226A:
	ldr r1, _080A2278 @ =0x0300122E
	ldrh r0, [r1]
	adds r0, #4
	strh r0, [r1]
	b _080A22D8
	.align 2, 0
_080A2274: .4byte 0x0879ECA0
_080A2278: .4byte 0x0300122E
_080A227C:
	ldr r1, _080A22A0 @ =0x04000050
	ldr r2, _080A22A4 @ =0x00001FDF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080A22A8 @ =gWrittenToBldy
	movs r1, #0
	strh r1, [r0]
	adds r2, r4, #0
	adds r2, #0x94
	movs r0, #0
	strh r0, [r2]
	adds r0, r4, #0
	adds r0, #0x97
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	b _080A22C2
	.align 2, 0
_080A22A0: .4byte 0x04000050
_080A22A4: .4byte 0x00001FDF
_080A22A8: .4byte gWrittenToBldy
_080A22AC:
	ldr r1, _080A22CC @ =0x0879ECBC
	adds r0, r4, #0
	adds r0, #0x98
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	cmp r0, #0
	beq _080A22D8
_080A22C2:
	ldrb r0, [r4, #1]
	adds r0, #1
	strb r0, [r4, #1]
	b _080A22D8
	.align 2, 0
_080A22CC: .4byte 0x0879ECBC
_080A22D0:
	adds r7, #1
	movs r0, #0x1e
	bl MusicFade
_080A22D8:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CreditsDisplayLine
CreditsDisplayLine: @ 0x080A22E0
	push {r4, r5, r6, lr}
	ldr r4, _080A231C @ =0x0874B0B0
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r1, r4
	ldr r0, _080A2320 @ =gNonGameplayRam
	movs r3, #0
	adds r1, r0, #0
	adds r1, #0x4a
	adds r0, #0xa
	movs r2, #0x1f
_080A22F8:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080A22F8
	movs r2, #0
	ldrb r0, [r4]
	cmp r0, #0xd
	bls _080A2310
	b _080A2544
_080A2310:
	lsls r0, r0, #2
	ldr r1, _080A2324 @ =_080A2328
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A231C: .4byte 0x0874B0B0
_080A2320: .4byte gNonGameplayRam
_080A2324: .4byte _080A2328
_080A2328: @ jump table
	.4byte _080A2360 @ case 0
	.4byte _080A23CA @ case 1
	.4byte _080A24AC @ case 2
	.4byte _080A2544 @ case 3
	.4byte _080A2544 @ case 4
	.4byte _080A2450 @ case 5
	.4byte _080A2436 @ case 6
	.4byte _080A2544 @ case 7
	.4byte _080A2544 @ case 8
	.4byte _080A2544 @ case 9
	.4byte _080A243A @ case 10
	.4byte _080A2458 @ case 11
	.4byte _080A2474 @ case 12
	.4byte _080A2490 @ case 13
_080A2360:
	adds r0, r4, #1
	adds r3, r0, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _080A2450
	ldr r1, _080A2394 @ =gNonGameplayRam
	lsls r0, r2, #1
	adds r0, #0xa
	adds r1, r0, r1
	ldr r6, _080A2398 @ =0x0000101B
	ldr r5, _080A239C @ =0x0000101C
	ldr r4, _080A23A0 @ =0x0000101D
_080A2378:
	ldrb r2, [r3]
	adds r0, r2, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080A23A4
	movs r2, #0xfc
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrb r2, [r3]
	adds r0, r0, r2
	strh r0, [r1]
	b _080A23BE
	.align 2, 0
_080A2394: .4byte gNonGameplayRam
_080A2398: .4byte 0x0000101B
_080A239C: .4byte 0x0000101C
_080A23A0: .4byte 0x0000101D
_080A23A4:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2e
	bne _080A23B0
	strh r6, [r1]
	b _080A23BE
_080A23B0:
	cmp r0, #0x2c
	bne _080A23B8
	strh r5, [r1]
	b _080A23BE
_080A23B8:
	cmp r0, #0x26
	bne _080A23BE
	strh r4, [r1]
_080A23BE:
	adds r3, #1
	adds r1, #2
	ldrb r0, [r3]
	cmp r0, #0
	bne _080A2378
	b _080A2450
_080A23CA:
	adds r0, r4, #1
	adds r3, r0, r2
	ldrb r0, [r3]
	cmp r0, #0
	beq _080A2450
	ldr r1, _080A2400 @ =gNonGameplayRam
	lsls r0, r2, #1
	adds r0, #0xa
	adds r1, r0, r1
	ldr r6, _080A2404 @ =0x0000201B
	ldr r5, _080A2408 @ =0x0000201C
	ldr r4, _080A240C @ =0x0000201D
_080A23E2:
	ldrb r2, [r3]
	adds r0, r2, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080A2410
	movs r2, #0xfe
	lsls r2, r2, #5
	adds r0, r2, #0
	ldrb r2, [r3]
	adds r0, r0, r2
	strh r0, [r1]
	b _080A242A
	.align 2, 0
_080A2400: .4byte gNonGameplayRam
_080A2404: .4byte 0x0000201B
_080A2408: .4byte 0x0000201C
_080A240C: .4byte 0x0000201D
_080A2410:
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2e
	bne _080A241C
	strh r6, [r1]
	b _080A242A
_080A241C:
	cmp r0, #0x2c
	bne _080A2424
	strh r5, [r1]
	b _080A242A
_080A2424:
	cmp r0, #0x26
	bne _080A242A
	strh r4, [r1]
_080A242A:
	adds r3, #1
	adds r1, #2
	ldrb r0, [r3]
	cmp r0, #0
	bne _080A23E2
	b _080A2450
_080A2436:
	movs r5, #9
	b _080A2544
_080A243A:
	movs r2, #8
	ldr r0, _080A2454 @ =gNonGameplayRam
	adds r1, r0, #0
	adds r1, #0x1a
_080A2442:
	adds r0, r2, #0
	adds r0, #0x98
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x15
	ble _080A2442
_080A2450:
	movs r5, #1
	b _080A2544
	.align 2, 0
_080A2454: .4byte gNonGameplayRam
_080A2458:
	movs r2, #6
	ldr r0, _080A2470 @ =gNonGameplayRam
	adds r1, r0, #0
	adds r1, #0x16
_080A2460:
	adds r0, r2, #0
	adds r0, #0xba
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x17
	ble _080A2460
	b _080A2450
	.align 2, 0
_080A2470: .4byte gNonGameplayRam
_080A2474:
	movs r2, #4
	ldr r0, _080A248C @ =gNonGameplayRam
	adds r1, r0, #0
	adds r1, #0x12
_080A247C:
	adds r0, r2, #0
	adds r0, #0xdc
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x19
	ble _080A247C
	b _080A2450
	.align 2, 0
_080A248C: .4byte gNonGameplayRam
_080A2490:
	movs r2, #6
	ldr r0, _080A24A8 @ =gNonGameplayRam
	adds r1, r0, #0
	adds r1, #0x16
_080A2498:
	adds r0, r2, #0
	adds r0, #0xfa
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x17
	ble _080A2498
	b _080A2450
	.align 2, 0
_080A24A8: .4byte gNonGameplayRam
_080A24AC:
	adds r0, r4, #1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080A2542
	ldr r0, _080A24E8 @ =gNonGameplayRam
	adds r4, r1, #0
	lsls r1, r2, #1
	adds r2, r1, #0
	adds r2, #0x4a
	adds r2, r2, r0
	adds r1, #0xa
	adds r1, r1, r0
	ldr r3, _080A24EC @ =0x0000FFFF
	adds r5, r3, #0
_080A24CA:
	ldrb r3, [r4]
	adds r0, r3, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080A24F4
	ldr r3, _080A24F0 @ =0x0000FFDF
	adds r0, r3, #0
	ldrb r3, [r4]
	adds r0, r0, r3
	strh r0, [r1]
	ldrb r3, [r4]
	adds r0, r5, r3
	b _080A2534
	.align 2, 0
_080A24E8: .4byte gNonGameplayRam
_080A24EC: .4byte 0x0000FFFF
_080A24F0: .4byte 0x0000FFDF
_080A24F4:
	adds r0, r3, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080A250C
	ldrb r3, [r4]
	adds r0, r5, r3
	strh r0, [r1]
	ldrb r0, [r4]
	adds r0, #0x1f
	b _080A2534
_080A250C:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2e
	bne _080A2518
	movs r0, #0x5b
	b _080A2534
_080A2518:
	cmp r0, #0x2c
	bne _080A2520
	movs r0, #0x5c
	b _080A2534
_080A2520:
	cmp r0, #0x2d
	bne _080A252A
	movs r0, #0x3a
	strh r0, [r1]
	b _080A2536
_080A252A:
	cmp r0, #0x2b
	bne _080A2536
	movs r0, #0x7a
	strh r0, [r1]
	movs r0, #0x9a
_080A2534:
	strh r0, [r2]
_080A2536:
	adds r4, #1
	adds r2, #2
	adds r1, #2
	ldrb r0, [r4]
	cmp r0, #0
	bne _080A24CA
_080A2542:
	movs r5, #2
_080A2544:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start SamusPosingInit
SamusPosingInit: @ 0x080A254C
	push {r4, r5, r6, lr}
	ldr r0, _080A2634 @ =unk_a1cfc
	bl CallbackSetVBlank
	movs r5, #0x80
	lsls r5, r5, #0x13
	movs r6, #0
	strh r6, [r5]
	ldr r0, _080A2638 @ =0x0874EB50
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080A263C @ =0x087535E0
	ldr r1, _080A2640 @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _080A2644 @ =0x08753FF8
	ldr r1, _080A2648 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _080A264C @ =0x08754D4C
	ldr r1, _080A2650 @ =0x06009000
	bl LZ77UncompVram
	ldr r0, _080A2654 @ =0x0875DB50
	ldr r1, _080A2658 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _080A265C @ =0x0875ED6C
	ldr r1, _080A2660 @ =0x06010000
	bl LZ77UncompVram
	ldr r4, _080A2664 @ =0x040000D4
	ldr r0, _080A2668 @ =0x08749600
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _080A266C @ =0x80000060
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080A2670 @ =0x087496C0
	str r0, [r4]
	ldr r0, _080A2674 @ =0x050000C0
	str r0, [r4, #4]
	ldr r0, _080A2678 @ =0x800000A0
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080A267C @ =0x08749A80
	str r0, [r4]
	ldr r0, _080A2680 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _080A2684 @ =0x80000100
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _080A2688 @ =0x04000008
	ldr r2, _080A268C @ =0x00001F08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	subs r2, #0xff
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080A2690 @ =0x00001D02
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #5
	adds r0, r1, #0
	strh r0, [r5]
	ldr r1, _080A2694 @ =0x04000050
	ldr r2, _080A2698 @ =0x00001FDF
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080A269C @ =0x03001226
	strh r6, [r0]
	ldr r0, _080A26A0 @ =0x083C94D0
	str r0, [r4]
	ldr r5, _080A26A4 @ =0x03001528
	str r5, [r4, #4]
	ldr r0, _080A26A8 @ =0x80000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	adds r1, r5, #0
	subs r1, #0xa4
	movs r0, #0
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	adds r1, #0x98
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r0, _080A26AC @ =SamusPosingVblank
	bl CallbackSetVBlank
	ldr r0, _080A26B0 @ =SamusPosingHblankCode
	str r0, [r4]
	movs r1, #0xe6
	lsls r1, r1, #1
	adds r0, r5, r1
	str r0, [r4, #4]
	ldr r0, _080A26B4 @ =0x80000020
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _080A26B8 @ =0x000001CD
	adds r0, r5, r2
	bl CallbackSetHBlank
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080A2634: .4byte unk_a1cfc
_080A2638: .4byte 0x0874EB50
_080A263C: .4byte 0x087535E0
_080A2640: .4byte 0x0600E800
_080A2644: .4byte 0x08753FF8
_080A2648: .4byte 0x06008000
_080A264C: .4byte 0x08754D4C
_080A2650: .4byte 0x06009000
_080A2654: .4byte 0x0875DB50
_080A2658: .4byte 0x0600F800
_080A265C: .4byte 0x0875ED6C
_080A2660: .4byte 0x06010000
_080A2664: .4byte 0x040000D4
_080A2668: .4byte 0x08749600
_080A266C: .4byte 0x80000060
_080A2670: .4byte 0x087496C0
_080A2674: .4byte 0x050000C0
_080A2678: .4byte 0x800000A0
_080A267C: .4byte 0x08749A80
_080A2680: .4byte 0x05000200
_080A2684: .4byte 0x80000100
_080A2688: .4byte 0x04000008
_080A268C: .4byte 0x00001F08
_080A2690: .4byte 0x00001D02
_080A2694: .4byte 0x04000050
_080A2698: .4byte 0x00001FDF
_080A269C: .4byte 0x03001226
_080A26A0: .4byte 0x083C94D0
_080A26A4: .4byte 0x03001528
_080A26A8: .4byte 0x80000040
_080A26AC: .4byte SamusPosingVblank
_080A26B0: .4byte SamusPosingHblankCode
_080A26B4: .4byte 0x80000020
_080A26B8: .4byte 0x000001CD

	thumb_func_start CreditsFadeIn
CreditsFadeIn: @ 0x080A26BC
	push {r4, lr}
	ldr r4, _080A26E4 @ =gWrittenToBldy
	ldrh r2, [r4]
	adds r1, r2, #0
	cmp r1, #0
	beq _080A26EC
	ldr r0, _080A26E8 @ =gNonGameplayRam
	adds r3, r0, #0
	adds r3, #0x97
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A26DC
	subs r0, r2, #1
	strh r0, [r4]
_080A26DC:
	adds r0, r1, #1
	strb r0, [r3]
	b _080A2702
	.align 2, 0
_080A26E4: .4byte gWrittenToBldy
_080A26E8: .4byte gNonGameplayRam
_080A26EC:
	ldr r0, _080A270C @ =0x04000050
	movs r3, #0
	strh r1, [r0]
	ldr r1, _080A2710 @ =gNonGameplayRam
	adds r2, r1, #0
	adds r2, #0x98
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r1, #0x97
	strb r3, [r1]
_080A2702:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A270C: .4byte 0x04000050
_080A2710: .4byte gNonGameplayRam

	thumb_func_start SamusPosing
SamusPosing: @ 0x080A2714
	push {lr}
	ldr r3, _080A2738 @ =gNonGameplayRam
	adds r0, r3, #0
	adds r0, #0x94
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #2
	beq _080A2788
	cmp r1, #2
	bgt _080A273C
	cmp r1, #0
	beq _080A2746
	cmp r1, #1
	beq _080A2768
	b _080A288C
	.align 2, 0
_080A2738: .4byte gNonGameplayRam
_080A273C:
	cmp r1, #0x32
	beq _080A27B8
	cmp r1, #0x64
	beq _080A281C
	b _080A288C
_080A2746:
	adds r0, r3, #0
	adds r0, #0x98
	ldrb r0, [r0]
	subs r3, r0, #2
	movs r1, #1
	ands r0, r1
	movs r2, #0xa8
	lsls r2, r2, #8
	cmp r0, #0
	beq _080A275E
	movs r2, #0x80
	lsls r2, r2, #8
_080A275E:
	ldr r1, _080A2764 @ =0x0874E620
	b _080A27A2
	.align 2, 0
_080A2764: .4byte 0x0874E620
_080A2768:
	adds r0, r3, #0
	adds r0, #0x98
	ldrb r0, [r0]
	subs r3, r0, #2
	ands r0, r1
	movs r2, #0xb8
	lsls r2, r2, #8
	cmp r0, #0
	beq _080A277E
	movs r2, #0x90
	lsls r2, r2, #8
_080A277E:
	ldr r1, _080A2784 @ =0x0874E630
	b _080A27A2
	.align 2, 0
_080A2784: .4byte 0x0874E630
_080A2788:
	adds r0, r3, #0
	adds r0, #0x98
	ldrb r0, [r0]
	subs r3, r0, #2
	movs r1, #1
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, #0
	beq _080A27A0
	movs r2, #0xf8
	lsls r2, r2, #8
_080A27A0:
	ldr r1, _080A27B4 @ =0x0874E640
_080A27A2:
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r1, r2, r1
	bl LZ77UncompVram
	b _080A288C
	.align 2, 0
_080A27B4: .4byte 0x0874E640
_080A27B8:
	ldr r1, _080A27E0 @ =gWrittenToBldalpha_R
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _080A27E4 @ =gWrittenToBldalpha_L
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080A27E8 @ =0x04000052
	movs r0, #0x10
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x98
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A27F4
	ldr r1, _080A27EC @ =0x04000050
	ldr r2, _080A27F0 @ =0x00000542
	b _080A27F8
	.align 2, 0
_080A27E0: .4byte gWrittenToBldalpha_R
_080A27E4: .4byte gWrittenToBldalpha_L
_080A27E8: .4byte 0x04000052
_080A27EC: .4byte 0x04000050
_080A27F0: .4byte 0x00000542
_080A27F4:
	ldr r1, _080A2810 @ =0x04000050
	ldr r2, _080A2814 @ =0x00000641
_080A27F8:
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xb8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _080A2818 @ =gNonGameplayRam
	movs r0, #1
	strh r0, [r1, #2]
	b _080A288C
	.align 2, 0
_080A2810: .4byte 0x04000050
_080A2814: .4byte 0x00000641
_080A2818: .4byte gNonGameplayRam
_080A281C:
	ldr r1, _080A284C @ =0x04000050
	movs r0, #0
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x98
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A2854
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xa8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #8
	ldr r2, _080A2850 @ =0x00001F08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	subs r2, #0xff
	b _080A286C
	.align 2, 0
_080A284C: .4byte 0x04000050
_080A2850: .4byte 0x00001F08
_080A2854:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xb0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #8
	ldr r2, _080A28D4 @ =0x00001F09
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080A28D8 @ =0x00001E08
_080A286C:
	adds r0, r2, #0
	strh r0, [r1]
	ldr r3, _080A28DC @ =gNonGameplayRam
	movs r2, #0
	movs r1, #0
	strh r1, [r3, #2]
	adds r0, r3, #0
	adds r0, #0x94
	strh r1, [r0]
	adds r0, #3
	strb r2, [r0]
	adds r1, r3, #0
	adds r1, #0x98
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A288C:
	ldr r1, _080A28DC @ =gNonGameplayRam
	ldrh r0, [r1, #2]
	cmp r0, #1
	bne _080A28CE
	adds r2, r1, #0
	adds r2, #0x97
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080A28CE
	movs r0, #0
	strb r0, [r2]
	ldr r2, _080A28E0 @ =gWrittenToBldalpha_R
	ldrh r0, [r2]
	cmp r0, #0
	beq _080A28B6
	subs r0, #1
	strh r0, [r2]
_080A28B6:
	ldr r1, _080A28E4 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080A28C2
	adds r0, #1
	strh r0, [r1]
_080A28C2:
	ldr r0, _080A28E8 @ =0x04000052
	ldrh r1, [r1]
	lsls r1, r1, #8
	ldrh r2, [r2]
	orrs r1, r2
	strh r1, [r0]
_080A28CE:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080A28D4: .4byte 0x00001F09
_080A28D8: .4byte 0x00001E08
_080A28DC: .4byte gNonGameplayRam
_080A28E0: .4byte gWrittenToBldalpha_R
_080A28E4: .4byte gWrittenToBldalpha_L
_080A28E8: .4byte 0x04000052

	thumb_func_start SamusPosingTransforming
SamusPosingTransforming: @ 0x080A28EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	ldr r4, _080A2928 @ =gNonGameplayRam
	adds r0, r4, #0
	adds r0, #0x94
	ldrh r1, [r0]
	adds r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x8e
	bne _080A2910
	b _080A2AC0
_080A2910:
	cmp r1, #0x8e
	bgt _080A293E
	cmp r1, #0x65
	beq _080A29E4
	cmp r1, #0x65
	bgt _080A292C
	cmp r1, #0x32
	beq _080A2978
	cmp r1, #0x64
	beq _080A29C0
	b _080A2C0C
	.align 2, 0
_080A2928: .4byte gNonGameplayRam
_080A292C:
	cmp r1, #0x8c
	bne _080A2932
	b _080A2A50
_080A2932:
	cmp r1, #0x8c
	ble _080A2938
	b _080A2A94
_080A2938:
	cmp r1, #0x6e
	beq _080A2A10
	b _080A2C0C
_080A293E:
	cmp r1, #0xaa
	bne _080A2944
	b _080A2B58
_080A2944:
	cmp r1, #0xaa
	bgt _080A2956
	cmp r1, #0x8f
	bne _080A294E
	b _080A2AEC
_080A294E:
	cmp r1, #0x90
	bne _080A2954
	b _080A2B18
_080A2954:
	b _080A2C0C
_080A2956:
	movs r0, #0x87
	lsls r0, r0, #1
	cmp r1, r0
	bne _080A2960
	b _080A2BD8
_080A2960:
	cmp r1, r0
	bgt _080A296C
	cmp r1, #0xdc
	bne _080A296A
	b _080A2B8C
_080A296A:
	b _080A2C0C
_080A296C:
	movs r0, #0xcd
	lsls r0, r0, #1
	cmp r1, r0
	bne _080A2976
	b _080A2C08
_080A2976:
	b _080A2C0C
_080A2978:
	ldr r1, _080A29AC @ =gWrittenToBldalpha_R
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _080A29B0 @ =gWrittenToBldalpha_L
	mov r1, sl
	strh r1, [r0]
	ldr r1, _080A29B4 @ =0x04000052
	movs r0, #0x10
	strh r0, [r1]
	subs r1, #2
	ldr r2, _080A29B8 @ =0x00001441
	adds r0, r2, #0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x9b
	movs r1, #1
	strb r1, [r0]
	adds r0, #2
	strb r1, [r0]
	adds r2, r4, #0
	adds r2, #0xa0
	ldr r0, _080A29BC @ =0x08749C80
	str r0, [r2]
	strh r1, [r4, #2]
	b _080A2C0C
	.align 2, 0
_080A29AC: .4byte gWrittenToBldalpha_R
_080A29B0: .4byte gWrittenToBldalpha_L
_080A29B4: .4byte 0x04000052
_080A29B8: .4byte 0x00001441
_080A29BC: .4byte 0x08749C80
_080A29C0:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r3, #0xa0
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _080A29E0 @ =0x04000050
	movs r1, #0
	mov r2, sl
	strh r2, [r0]
	adds r0, r4, #0
	adds r0, #0x9d
	strb r1, [r0]
	strh r2, [r4, #2]
	b _080A2C0C
	.align 2, 0
_080A29E0: .4byte 0x04000050
_080A29E4:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A29F0
	b _080A2C0C
_080A29F0:
	ldr r0, _080A2A04 @ =0x08753E80
	ldr r1, _080A2A08 @ =0x0600F800
	bl LZ77UncompVram
	ldr r1, _080A2A0C @ =0x04000008
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	b _080A2C0C
	.align 2, 0
_080A2A04: .4byte 0x08753E80
_080A2A08: .4byte 0x0600F800
_080A2A0C: .4byte 0x04000008
_080A2A10:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A2A1C
	b _080A2C0C
_080A2A1C:
	ldr r3, _080A2A44 @ =0x04000208
	mov r0, sl
	strh r0, [r3]
	ldr r2, _080A2A48 @ =0x04000004
	ldrh r0, [r2]
	movs r1, #0x10
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _080A2A4C @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	movs r1, #1
	strh r1, [r3]
	adds r0, r4, #0
	adds r0, #0x96
	strb r1, [r0]
	b _080A2C0C
	.align 2, 0
_080A2A44: .4byte 0x04000208
_080A2A48: .4byte 0x04000004
_080A2A4C: .4byte 0x04000200
_080A2A50:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A2A5C
	b _080A2C0C
_080A2A5C:
	ldr r0, _080A2A88 @ =0x04000040
	mov r1, sl
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	adds r0, #4
	strh r1, [r0]
	ldr r1, _080A2A8C @ =0x0400004A
	ldr r2, _080A2A90 @ =0x00002326
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x4a
	movs r3, #0xb5
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x9c
	movs r0, #2
	strb r0, [r1]
	b _080A2C0C
	.align 2, 0
_080A2A88: .4byte 0x04000040
_080A2A8C: .4byte 0x0400004A
_080A2A90: .4byte 0x00002326
_080A2A94:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A2AA8
	ldr r0, _080A2AA4 @ =0x0875BE54
	b _080A2AB0
	.align 2, 0
_080A2AA4: .4byte 0x0875BE54
_080A2AA8:
	cmp r0, #0
	bne _080A2AAE
	b _080A2C0C
_080A2AAE:
	ldr r0, _080A2AB8 @ =0x0875CE48
_080A2AB0:
	ldr r1, _080A2ABC @ =0x06008000
	bl LZ77UncompVram
	b _080A2C0C
	.align 2, 0
_080A2AB8: .4byte 0x0875CE48
_080A2ABC: .4byte 0x06008000
_080A2AC0:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A2AD4
	ldr r0, _080A2AD0 @ =0x0875CC58
	b _080A2ADC
	.align 2, 0
_080A2AD0: .4byte 0x0875CC58
_080A2AD4:
	cmp r0, #0
	bne _080A2ADA
	b _080A2C0C
_080A2ADA:
	ldr r0, _080A2AE4 @ =0x0875D960
_080A2ADC:
	ldr r1, _080A2AE8 @ =0x06009000
	bl LZ77UncompVram
	b _080A2C0C
	.align 2, 0
_080A2AE4: .4byte 0x0875D960
_080A2AE8: .4byte 0x06009000
_080A2AEC:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A2B00
	ldr r0, _080A2AFC @ =0x0875E990
	b _080A2B08
	.align 2, 0
_080A2AFC: .4byte 0x0875E990
_080A2B00:
	cmp r0, #0
	bne _080A2B06
	b _080A2C0C
_080A2B06:
	ldr r0, _080A2B10 @ =0x0875EB94
_080A2B08:
	ldr r1, _080A2B14 @ =0x0600F000
	bl LZ77UncompVram
	b _080A2C0C
	.align 2, 0
_080A2B10: .4byte 0x0875EB94
_080A2B14: .4byte 0x0600F000
_080A2B18:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A2B30
	ldr r1, _080A2B28 @ =0x040000D4
	ldr r0, _080A2B2C @ =0x08749800
	b _080A2B38
	.align 2, 0
_080A2B28: .4byte 0x040000D4
_080A2B2C: .4byte 0x08749800
_080A2B30:
	cmp r0, #0
	beq _080A2C0C
	ldr r1, _080A2B48 @ =0x040000D4
	ldr r0, _080A2B4C @ =0x08749940
_080A2B38:
	str r0, [r1]
	ldr r0, _080A2B50 @ =0x050000C0
	str r0, [r1, #4]
	ldr r0, _080A2B54 @ =0x800000A0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _080A2C0C
	.align 2, 0
_080A2B48: .4byte 0x040000D4
_080A2B4C: .4byte 0x08749940
_080A2B50: .4byte 0x050000C0
_080A2B54: .4byte 0x800000A0
_080A2B58:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A2B70
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r0, _080A2B6C @ =0x08749D18
	str r0, [r1]
	b _080A2C0C
	.align 2, 0
_080A2B6C: .4byte 0x08749D18
_080A2B70:
	cmp r0, #0
	beq _080A2C0C
	adds r1, r4, #0
	adds r1, #0xa0
	ldr r0, _080A2B84 @ =0x08749D3E
	str r0, [r1]
	ldr r1, _080A2B88 @ =0x04000014
	movs r0, #4
	strh r0, [r1]
	b _080A2C0C
	.align 2, 0
_080A2B84: .4byte 0x08749D3E
_080A2B88: .4byte 0x04000014
_080A2B8C:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2C0C
	ldr r1, _080A2BC8 @ =gWrittenToBldalpha_R
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _080A2BCC @ =gWrittenToBldalpha_L
	movs r2, #0
	mov r1, sl
	strh r1, [r0]
	ldr r1, _080A2BD0 @ =0x04000052
	movs r0, #0x10
	strh r0, [r1]
	subs r1, #2
	ldr r3, _080A2BD4 @ =0x00000651
	adds r0, r3, #0
	strh r0, [r1]
	subs r1, #0x50
	movs r3, #0xb7
	lsls r3, r3, #8
	adds r0, r3, #0
	strh r0, [r1]
	movs r0, #1
	strh r0, [r4, #2]
	adds r0, r4, #0
	adds r0, #0x97
	strb r2, [r0]
	b _080A2C0C
	.align 2, 0
_080A2BC8: .4byte gWrittenToBldalpha_R
_080A2BCC: .4byte gWrittenToBldalpha_L
_080A2BD0: .4byte 0x04000052
_080A2BD4: .4byte 0x00000651
_080A2BD8:
	adds r0, r4, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2C0C
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xc0
	lsls r2, r2, #3
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080A2C04 @ =0x04000050
	movs r1, #0
	mov r3, sl
	strh r3, [r0]
	adds r0, r4, #0
	adds r0, #0x9b
	strb r1, [r0]
	strh r3, [r4, #2]
	subs r0, #5
	strb r1, [r0]
	b _080A2C0C
	.align 2, 0
_080A2C04: .4byte 0x04000050
_080A2C08:
	movs r0, #1
	mov sl, r0
_080A2C0C:
	ldr r0, _080A2D10 @ =gNonGameplayRam
	ldrh r1, [r0, #2]
	adds r3, r0, #0
	cmp r1, #1
	bne _080A2C50
	adds r2, r3, #0
	adds r2, #0x97
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080A2C50
	movs r0, #0
	strb r0, [r2]
	ldr r2, _080A2D14 @ =gWrittenToBldalpha_R
	ldrh r0, [r2]
	cmp r0, #0
	beq _080A2C38
	subs r0, #1
	strh r0, [r2]
_080A2C38:
	ldr r1, _080A2D18 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080A2C44
	adds r0, #1
	strh r0, [r1]
_080A2C44:
	ldr r0, _080A2D1C @ =0x04000052
	ldrh r1, [r1]
	lsls r1, r1, #8
	ldrh r2, [r2]
	orrs r1, r2
	strh r1, [r0]
_080A2C50:
	adds r1, r3, #0
	adds r0, r1, #0
	adds r0, #0x96
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2C62
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
_080A2C62:
	ldr r5, _080A2D20 @ =gOamData
	movs r1, #0
	mov sb, r1
	adds r0, r3, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A2CF6
	adds r0, r3, #0
	adds r0, #0xa0
	ldr r4, [r0]
	ldrh r0, [r4]
	adds r4, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	movs r6, #0
	cmp r6, sb
	bhs _080A2CF6
	mov ip, r3
	movs r7, #3
	movs r2, #0xd
	rsbs r2, r2, #0
	mov r8, r2
_080A2C92:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	lsls r3, r6, #3
	ldr r1, _080A2D20 @ =gOamData
	adds r3, r3, r1
	adds r0, #0x4c
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x9c
	ldrb r1, [r0]
	ands r1, r7
	lsls r1, r1, #2
	ldrb r2, [r3, #1]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	adds r1, r0, #0
	adds r1, #0x82
	ldr r0, _080A2D24 @ =0x000001FF
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _080A2D28 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldr r2, _080A2D2C @ =0x03001521
	ldrb r1, [r2]
	ands r1, r7
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	mov r0, r8
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	adds r5, #4
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, sb
	blo _080A2C92
_080A2CF6:
	mov r0, sb
	ldr r3, _080A2D30 @ =gNextOamSlot
	strb r0, [r3]
	bl ResetFreeOam
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A2D10: .4byte gNonGameplayRam
_080A2D14: .4byte gWrittenToBldalpha_R
_080A2D18: .4byte gWrittenToBldalpha_L
_080A2D1C: .4byte 0x04000052
_080A2D20: .4byte gOamData
_080A2D24: .4byte 0x000001FF
_080A2D28: .4byte 0xFFFFFE00
_080A2D2C: .4byte 0x03001521
_080A2D30: .4byte gNextOamSlot

	thumb_func_start EndingImageInit
EndingImageInit: @ 0x080A2D34
	push {r4, lr}
	ldr r3, _080A2D7C @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _080A2D80 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _080A2D84 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _080A2D88 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080A2D8C @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _080A2D90 @ =unk_a1cfc
	bl CallbackSetVBlank
	movs r0, #0x80
	lsls r0, r0, #0x13
	strh r4, [r0]
	ldr r2, _080A2D94 @ =gNonGameplayRam
	adds r0, r2, #0
	adds r0, #0x9a
	ldrb r0, [r0]
	cmp r0, #0x63
	bls _080A2D98
	movs r1, #3
	adds r0, r2, #0
	adds r0, #0x99
	ldrb r0, [r0]
	cmp r0, #2
	bne _080A2D9E
	movs r1, #4
	b _080A2D9E
	.align 2, 0
_080A2D7C: .4byte 0x04000208
_080A2D80: .4byte 0x04000004
_080A2D84: .4byte 0x0000FFEF
_080A2D88: .4byte 0x04000200
_080A2D8C: .4byte 0x0000FFFD
_080A2D90: .4byte unk_a1cfc
_080A2D94: .4byte gNonGameplayRam
_080A2D98:
	adds r0, r2, #0
	adds r0, #0x99
	ldrb r1, [r0]
_080A2D9E:
	cmp r1, #1
	beq _080A2E04
	cmp r1, #1
	bgt _080A2DAC
	cmp r1, #0
	beq _080A2DB6
	b _080A2EE8
_080A2DAC:
	cmp r1, #2
	beq _080A2E50
	cmp r1, #3
	beq _080A2E9C
	b _080A2EE8
_080A2DB6:
	ldr r0, _080A2DE0 @ =0x08761A88
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080A2DE4 @ =0x08767278
	ldr r1, _080A2DE8 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _080A2DEC @ =0x0878FD10
	ldr r1, _080A2DF0 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _080A2DF4 @ =0x087905AC
	ldr r1, _080A2DF8 @ =0x0600F800
	bl LZ77UncompVram
	ldr r1, _080A2DFC @ =0x040000D4
	ldr r0, _080A2E00 @ =0x08749D58
	b _080A2F0E
	.align 2, 0
_080A2DE0: .4byte 0x08761A88
_080A2DE4: .4byte 0x08767278
_080A2DE8: .4byte 0x06008000
_080A2DEC: .4byte 0x0878FD10
_080A2DF0: .4byte 0x0600F000
_080A2DF4: .4byte 0x087905AC
_080A2DF8: .4byte 0x0600F800
_080A2DFC: .4byte 0x040000D4
_080A2E00: .4byte 0x08749D58
_080A2E04:
	ldr r0, _080A2E2C @ =0x0876A454
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080A2E30 @ =0x08770084
	ldr r1, _080A2E34 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _080A2E38 @ =0x08790B6C
	ldr r1, _080A2E3C @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _080A2E40 @ =0x08791408
	ldr r1, _080A2E44 @ =0x0600F800
	bl LZ77UncompVram
	ldr r1, _080A2E48 @ =0x040000D4
	ldr r0, _080A2E4C @ =0x08749F58
	b _080A2F0E
	.align 2, 0
_080A2E2C: .4byte 0x0876A454
_080A2E30: .4byte 0x08770084
_080A2E34: .4byte 0x06008000
_080A2E38: .4byte 0x08790B6C
_080A2E3C: .4byte 0x0600F000
_080A2E40: .4byte 0x08791408
_080A2E44: .4byte 0x0600F800
_080A2E48: .4byte 0x040000D4
_080A2E4C: .4byte 0x08749F58
_080A2E50:
	ldr r0, _080A2E78 @ =0x08772F2C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080A2E7C @ =0x087788B8
	ldr r1, _080A2E80 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _080A2E84 @ =0x087919C8
	ldr r1, _080A2E88 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _080A2E8C @ =0x08792264
	ldr r1, _080A2E90 @ =0x0600F800
	bl LZ77UncompVram
	ldr r1, _080A2E94 @ =0x040000D4
	ldr r0, _080A2E98 @ =0x0874A158
	b _080A2F0E
	.align 2, 0
_080A2E78: .4byte 0x08772F2C
_080A2E7C: .4byte 0x087788B8
_080A2E80: .4byte 0x06008000
_080A2E84: .4byte 0x087919C8
_080A2E88: .4byte 0x0600F000
_080A2E8C: .4byte 0x08792264
_080A2E90: .4byte 0x0600F800
_080A2E94: .4byte 0x040000D4
_080A2E98: .4byte 0x0874A158
_080A2E9C:
	ldr r0, _080A2EC4 @ =0x0877BC2C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080A2EC8 @ =0x08781F9C
	ldr r1, _080A2ECC @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _080A2ED0 @ =0x08792824
	ldr r1, _080A2ED4 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _080A2ED8 @ =0x087930C0
	ldr r1, _080A2EDC @ =0x0600F800
	bl LZ77UncompVram
	ldr r1, _080A2EE0 @ =0x040000D4
	ldr r0, _080A2EE4 @ =0x0874A358
	b _080A2F0E
	.align 2, 0
_080A2EC4: .4byte 0x0877BC2C
_080A2EC8: .4byte 0x08781F9C
_080A2ECC: .4byte 0x06008000
_080A2ED0: .4byte 0x08792824
_080A2ED4: .4byte 0x0600F000
_080A2ED8: .4byte 0x087930C0
_080A2EDC: .4byte 0x0600F800
_080A2EE0: .4byte 0x040000D4
_080A2EE4: .4byte 0x0874A358
_080A2EE8:
	ldr r0, _080A2F34 @ =0x08785B44
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080A2F38 @ =0x0878C650
	ldr r1, _080A2F3C @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _080A2F40 @ =0x08793684
	ldr r1, _080A2F44 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _080A2F48 @ =0x08793F20
	ldr r1, _080A2F4C @ =0x0600F800
	bl LZ77UncompVram
	ldr r1, _080A2F50 @ =0x040000D4
	ldr r0, _080A2F54 @ =0x0874A558
_080A2F0E:
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080A2F58 @ =0x80000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080A2F5C @ =gLanguage
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	beq _080A2F74
	cmp r0, #4
	bgt _080A2F60
	cmp r0, #3
	beq _080A2F6A
	b _080A2F98
	.align 2, 0
_080A2F34: .4byte 0x08785B44
_080A2F38: .4byte 0x0878C650
_080A2F3C: .4byte 0x06008000
_080A2F40: .4byte 0x08793684
_080A2F44: .4byte 0x0600F000
_080A2F48: .4byte 0x08793F20
_080A2F4C: .4byte 0x0600F800
_080A2F50: .4byte 0x040000D4
_080A2F54: .4byte 0x0874A558
_080A2F58: .4byte 0x80000100
_080A2F5C: .4byte gLanguage
_080A2F60:
	cmp r0, #5
	beq _080A2F7C
	cmp r0, #6
	beq _080A2F84
	b _080A2F98
_080A2F6A:
	ldr r0, _080A2F70 @ =0x08798FBC
	b _080A2F86
	.align 2, 0
_080A2F70: .4byte 0x08798FBC
_080A2F74:
	ldr r0, _080A2F78 @ =0x087957A8
	b _080A2F86
	.align 2, 0
_080A2F78: .4byte 0x087957A8
_080A2F7C:
	ldr r0, _080A2F80 @ =0x087969F4
	b _080A2F86
	.align 2, 0
_080A2F80: .4byte 0x087969F4
_080A2F84:
	ldr r0, _080A2F90 @ =0x08797D08
_080A2F86:
	ldr r1, _080A2F94 @ =0x06010000
	bl LZ77UncompVram
	b _080A2FA0
	.align 2, 0
_080A2F90: .4byte 0x08797D08
_080A2F94: .4byte 0x06010000
_080A2F98:
	ldr r0, _080A305C @ =0x087944E4
	ldr r1, _080A3060 @ =0x06010000
	bl LZ77UncompVram
_080A2FA0:
	ldr r1, _080A3064 @ =0x040000D4
	ldr r0, _080A3068 @ =0x0874A758
	str r0, [r1]
	ldr r0, _080A306C @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _080A3070 @ =0x80000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xcc
	ldr r2, _080A3074 @ =0x00001E01
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _080A3078 @ =0x00001F08
	adds r0, r3, #0
	strh r0, [r1]
	subs r1, #0xa
	movs r2, #0x98
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x50
	adds r3, #0xd7
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _080A307C @ =gNextOamSlot
	movs r0, #0
	strb r0, [r1]
	bl ResetFreeOam
	ldr r1, _080A3080 @ =0x03001224
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080A3084 @ =0x03001226
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	strh r1, [r2]
	ldr r1, _080A3088 @ =gBg1XPosition
	strh r0, [r1]
	ldr r1, _080A308C @ =gBg1YPosition
	strh r0, [r1]
	ldr r1, _080A3090 @ =0x0300122C
	strh r0, [r1]
	ldr r1, _080A3094 @ =0x0300122E
	strh r0, [r1]
	ldr r1, _080A3098 @ =0x03001230
	strh r0, [r1]
	ldr r1, _080A309C @ =0x03001232
	strh r0, [r1]
	ldr r1, _080A30A0 @ =0x04000010
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	ldr r2, _080A30A4 @ =gNonGameplayRam
	movs r1, #0
	movs r0, #0x80
	strh r0, [r2, #8]
	strh r1, [r2, #2]
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	adds r1, r2, #0
	adds r1, #0x98
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r1, #0x1f
	movs r0, #0x1f
	adds r2, #0x48
_080A3042:
	strh r1, [r2]
	subs r2, #2
	subs r0, #1
	cmp r0, #0
	bge _080A3042
	ldr r0, _080A30A8 @ =EndingImageVblank
	bl CallbackSetVBlank
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080A305C: .4byte 0x087944E4
_080A3060: .4byte 0x06010000
_080A3064: .4byte 0x040000D4
_080A3068: .4byte 0x0874A758
_080A306C: .4byte 0x05000200
_080A3070: .4byte 0x80000040
_080A3074: .4byte 0x00001E01
_080A3078: .4byte 0x00001F08
_080A307C: .4byte gNextOamSlot
_080A3080: .4byte 0x03001224
_080A3084: .4byte 0x03001226
_080A3088: .4byte gBg1XPosition
_080A308C: .4byte gBg1YPosition
_080A3090: .4byte 0x0300122C
_080A3094: .4byte 0x0300122E
_080A3098: .4byte 0x03001230
_080A309C: .4byte 0x03001232
_080A30A0: .4byte 0x04000010
_080A30A4: .4byte gNonGameplayRam
_080A30A8: .4byte EndingImageVblank

	thumb_func_start EndingImage
EndingImage: @ 0x080A30AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	str r0, [sp]
	ldr r0, _080A30D4 @ =gLanguage
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #5
	beq _080A30DC
	cmp r0, #5
	bgt _080A30D8
	cmp r0, #3
	blt _080A30DC
	b _080A3106
	.align 2, 0
_080A30D4: .4byte gLanguage
_080A30D8:
	cmp r0, #6
	beq _080A3106
_080A30DC:
	ldr r0, _080A30F0 @ =gNonGameplayRam
	adds r0, #0x94
	ldrh r1, [r0]
	ldr r0, _080A30F4 @ =0x00000177
	cmp r1, r0
	bne _080A30F8
	movs r0, #2
	bl EndingImageDisplayLinePermanently
	b _080A3106
	.align 2, 0
_080A30F0: .4byte gNonGameplayRam
_080A30F4: .4byte 0x00000177
_080A30F8:
	movs r0, #0xbe
	lsls r0, r0, #1
	cmp r1, r0
	bne _080A3106
	movs r0, #2
	bl EndingImageLoadTextOam
_080A3106:
	ldr r4, _080A3130 @ =gNonGameplayRam
	adds r3, r4, #0
	adds r3, #0x94
	ldrh r2, [r3]
	adds r0, r2, #1
	strh r0, [r3]
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xa5
	lsls r0, r0, #1
	cmp r1, r0
	beq _080A3196
	cmp r1, r0
	bgt _080A313E
	cmp r1, #0x1e
	beq _080A3176
	cmp r1, #0x1e
	bgt _080A3134
	cmp r1, #0
	beq _080A316C
	b _080A31D2
	.align 2, 0
_080A3130: .4byte gNonGameplayRam
_080A3134:
	cmp r1, #0x6e
	beq _080A3186
	cmp r1, #0xb4
	beq _080A318E
	b _080A31D2
_080A313E:
	movs r0, #0xc3
	lsls r0, r0, #2
	cmp r1, r0
	beq _080A31AE
	cmp r1, r0
	bgt _080A315A
	movs r0, #0xe6
	lsls r0, r0, #1
	cmp r1, r0
	beq _080A319E
	adds r0, #0x46
	cmp r1, r0
	beq _080A31A6
	b _080A31D2
_080A315A:
	movs r0, #0xac
	lsls r0, r0, #3
	cmp r1, r0
	beq _080A31B6
	movs r0, #0xd0
	lsls r0, r0, #3
	cmp r1, r0
	beq _080A31CC
	b _080A31D2
_080A316C:
	bl EndingDrawIgtAndCompletionPercentage
	movs r0, #1
	strh r0, [r4, #2]
	b _080A31D2
_080A3176:
	movs r0, #0
	bl EndingImageLoadTextOam
	adds r1, r4, #0
	adds r1, #0x97
	movs r0, #1
	strb r0, [r1]
	b _080A31D2
_080A3186:
	movs r0, #0
	bl EndingImageDisplayLinePermanently
	b _080A31D2
_080A318E:
	movs r0, #1
	bl EndingImageDisplayLinePermanently
	b _080A31D2
_080A3196:
	movs r0, #1
	bl EndingImageLoadTextOam
	b _080A31D2
_080A319E:
	movs r0, #3
	bl EndingImageDisplayLinePermanently
	b _080A31D2
_080A31A6:
	movs r0, #4
	bl EndingImageDisplayLinePermanently
	b _080A31D2
_080A31AE:
	movs r0, #5
	bl EndingImageDisplayLinePermanently
	b _080A31D2
_080A31B6:
	ldr r0, _080A31C8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #0xb
	ands r0, r1
	cmp r0, #0
	bne _080A31D2
	strh r2, [r3]
	b _080A31D2
	.align 2, 0
_080A31C8: .4byte gChangedInput
_080A31CC:
	ldr r1, [sp]
	adds r1, #1
	str r1, [sp]
_080A31D2:
	ldr r1, _080A32A8 @ =gNonGameplayRam
	ldrh r0, [r1, #2]
	mov ip, r1
	cmp r0, #1
	bne _080A3246
	ldrh r1, [r1, #8]
	cmp r1, #0x7f
	bls _080A3214
	movs r0, #0x7f
	ands r0, r1
	mov r4, ip
	strh r0, [r4, #8]
	mov r2, ip
	adds r2, #0x8c
	ldrh r1, [r4, #4]
	lsls r1, r1, #6
	ldr r0, _080A32AC @ =0x0000FFC0
	subs r0, r0, r1
	str r0, [r2]
	adds r2, #4
	ldrh r1, [r4, #4]
	lsls r1, r1, #6
	ldr r0, _080A32B0 @ =0x0000FF80
	subs r0, r0, r1
	str r0, [r2]
	ldrh r0, [r4, #4]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	strh r0, [r4, #4]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_080A3214:
	ldr r3, _080A32B4 @ =0x03001226
	ldrh r0, [r3]
	subs r2, r0, #6
	strh r2, [r3]
	ldr r1, _080A32B8 @ =gBg1YPosition
	ldrh r0, [r1]
	subs r0, #6
	strh r0, [r1]
	mov r1, ip
	ldrh r0, [r1, #8]
	adds r0, #6
	movs r1, #0
	mov r4, ip
	strh r0, [r4, #8]
	lsls r0, r2, #0x10
	cmp r0, #0
	beq _080A3240
	movs r0, #0x80
	lsls r0, r0, #8
	ands r2, r0
	cmp r2, #0
	beq _080A3246
_080A3240:
	strh r1, [r3]
	mov r0, ip
	strh r1, [r0, #2]
_080A3246:
	mov r0, ip
	adds r0, #0x97
	ldrb r0, [r0]
	cmp r0, #1
	bne _080A326C
	movs r6, #6
	mov r0, ip
	adds r0, #0x9b
	ldrb r1, [r0]
	cmp r6, r1
	bge _080A326C
	adds r4, r0, #0
_080A325E:
	adds r0, r6, #0
	bl EndingImageUpdateLettersSpawnDelay
	adds r6, #1
	ldrb r0, [r4]
	cmp r6, r0
	blt _080A325E
_080A326C:
	ldr r1, _080A32A8 @ =gNonGameplayRam
	adds r0, r1, #0
	adds r0, #0x94
	ldrh r2, [r0]
	ldr r0, _080A32BC @ =0x00000564
	mov ip, r1
	cmp r2, r0
	bls _080A327E
	b _080A3404
_080A327E:
	ldr r0, _080A32C0 @ =0x00000329
	cmp r2, r0
	bls _080A3294
	ldr r0, _080A32C4 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A3294
	b _080A3404
_080A3294:
	ldr r5, _080A32C8 @ =gOamData
	ldr r2, _080A32CC @ =gNextOamSlot
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r5, r0, r5
	mov r8, r1
	mov r6, r8
	movs r4, #0
	b _080A33F0
	.align 2, 0
_080A32A8: .4byte gNonGameplayRam
_080A32AC: .4byte 0x0000FFC0
_080A32B0: .4byte 0x0000FF80
_080A32B4: .4byte 0x03001226
_080A32B8: .4byte gBg1YPosition
_080A32BC: .4byte 0x00000564
_080A32C0: .4byte 0x00000329
_080A32C4: .4byte gButtonInput
_080A32C8: .4byte gOamData
_080A32CC: .4byte gNextOamSlot
_080A32D0:
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r0, r4, r0
	ldrb r0, [r0]
	adds r1, r4, #1
	str r1, [sp, #4]
	cmp r0, #1
	bhi _080A32E4
	b _080A33EE
_080A32E4:
	movs r1, #0xb0
	lsls r1, r1, #1
	adds r0, r3, r1
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0x3f
	bhi _080A32F6
	adds r0, #1
	strb r0, [r1]
_080A32F6:
	movs r7, #0
	cmp r4, #5
	ble _080A3314
	ldrb r0, [r1]
	cmp r0, #3
	bhi _080A3306
_080A3302:
	movs r7, #3
	b _080A3362
_080A3306:
	cmp r0, #7
	bhi _080A330E
_080A330A:
	movs r7, #2
	b _080A3362
_080A330E:
	cmp r0, #0xb
	bhi _080A3362
	b _080A3360
_080A3314:
	cmp r4, #5
	bne _080A3362
	ldr r0, _080A3338 @ =0x00000165
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, #0x3f
	bls _080A3324
	strb r7, [r1]
_080A3324:
	ldrb r0, [r1]
	lsrs r0, r0, #3
	cmp r0, #7
	bhi _080A3362
	lsls r0, r0, #2
	ldr r1, _080A333C @ =_080A3340
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080A3338: .4byte 0x00000165
_080A333C: .4byte _080A3340
_080A3340: @ jump table
	.4byte _080A3302 @ case 0
	.4byte _080A330A @ case 1
	.4byte _080A3360 @ case 2
	.4byte _080A3362 @ case 3
	.4byte _080A3362 @ case 4
	.4byte _080A3360 @ case 5
	.4byte _080A330A @ case 6
	.4byte _080A3302 @ case 7
_080A3360:
	movs r7, #1
_080A3362:
	lsls r0, r4, #2
	movs r1, #0xfc
	lsls r1, r1, #1
	add r1, ip
	adds r0, r0, r1
	ldr r3, [r0]
	ldrh r2, [r3]
	adds r3, #2
	movs r0, #0xff
	ands r2, r0
	add r8, r2
	adds r1, r4, #1
	str r1, [sp, #4]
	cmp r6, r8
	bge _080A33EE
	ldr r2, _080A341C @ =gOamData
	lsls r1, r4, #1
	adds r0, #0xbb
	add r0, ip
	adds r0, r0, r1
	mov sl, r0
	lsls r0, r6, #3
	adds r4, r0, r2
	movs r0, #0xbf
	lsls r0, r0, #1
	add r0, ip
	adds r1, r1, r0
	mov sb, r1
	mov r0, r8
	subs r6, r0, r6
_080A339E:
	ldrh r2, [r3]
	adds r3, #2
	strh r2, [r5]
	adds r5, #2
	mov r1, sl
	ldrb r0, [r1]
	adds r0, r0, r2
	strb r0, [r4]
	ldrh r2, [r3]
	adds r3, #2
	strh r2, [r5]
	adds r5, #2
	mov r0, sb
	ldrh r1, [r0]
	adds r1, r2, r1
	ldr r0, _080A3420 @ =0x000001FF
	ands r1, r0
	ldrh r2, [r4, #2]
	ldr r0, _080A3424 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	ldrh r0, [r3]
	strh r0, [r5]
	adds r3, #2
	ldrb r1, [r4, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	lsls r2, r7, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #5]
	adds r5, #4
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _080A339E
	mov r6, r8
_080A33EE:
	ldr r4, [sp, #4]
_080A33F0:
	mov r3, ip
	adds r0, r3, #0
	adds r0, #0x9b
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A33FE
	b _080A32D0
_080A33FE:
	mov r4, r8
	ldr r1, _080A3428 @ =gNextOamSlot
	strb r4, [r1]
_080A3404:
	bl ResetFreeOam
	ldr r0, [sp]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080A341C: .4byte gOamData
_080A3420: .4byte 0x000001FF
_080A3424: .4byte 0xFFFFFE00
_080A3428: .4byte gNextOamSlot
