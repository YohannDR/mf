    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start ProjectileCount
ProjectileCount: @ 0x0808116C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	movs r4, #0
	movs r3, #0
	ldr r7, _080811A4 @ =gProjectileData
	movs r0, #1
	mov ip, r0
_08081180:
	lsls r0, r3, #5
	adds r2, r0, r7
	ldrb r1, [r2]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	beq _080811A8
	ldrb r0, [r2, #0xf]
	cmp r0, r6
	bne _080811A8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, r5
	blo _080811A8
	movs r0, #0
	b _080811B4
	.align 2, 0
_080811A4: .4byte gProjectileData
_080811A8:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _08081180
	movs r0, #1
_080811B4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProjectileInit
ProjectileInit: @ 0x080811BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	movs r6, #0xff
	movs r4, #0
	ldr r7, _0808120C @ =gProjectileData
	ldr r0, _08081210 @ =gSamusData
	mov ip, r0
	movs r5, #0
_080811EC:
	lsls r2, r4, #5
	adds r3, r2, r7
	ldrb r1, [r3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0808123E
	mov r0, ip
	ldrh r1, [r0, #0x12]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081214
	movs r0, #0x47
	b _08081216
	.align 2, 0
_0808120C: .4byte gProjectileData
_08081210: .4byte gSamusData
_08081214:
	movs r0, #7
_08081216:
	strb r0, [r3]
	adds r0, r2, r7
	mov r1, sp
	ldrb r1, [r1]
	strb r1, [r0, #0xf]
	mov r2, sb
	strh r2, [r0, #8]
	mov r1, r8
	strh r1, [r0, #0xa]
	strb r5, [r0, #0x12]
	strb r5, [r0, #0x11]
	mov r2, sl
	strb r2, [r0, #0x13]
	strb r5, [r0, #0x1e]
	mov r2, ip
	ldrb r1, [r2, #7]
	strb r1, [r0, #0x10]
	strb r4, [r0, #0x1f]
	adds r6, r4, #0
	b _08081248
_0808123E:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _080811EC
_08081248:
	adds r0, r6, #0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProjectileInitSecondary
ProjectileInitSecondary: @ 0x0808125C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	ldr r5, [sp, #0x28]
	ldr r6, [sp, #0x2c]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sl, r3
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	mov ip, r5
	lsls r6, r6, #0x18
	lsrs r7, r6, #0x18
	movs r3, #0
	movs r0, #7
	orrs r4, r0
	movs r5, #0
	movs r6, #1
_0808129E:
	lsls r0, r3, #5
	ldr r1, _080812D0 @ =gProjectileData
	adds r2, r0, r1
	ldrb r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _080812D4
	strb r4, [r2]
	mov r0, sp
	ldrb r0, [r0]
	strb r0, [r2, #0xf]
	mov r1, sb
	strh r1, [r2, #8]
	mov r0, r8
	strh r0, [r2, #0xa]
	strb r5, [r2, #0x12]
	strb r5, [r2, #0x11]
	mov r1, sl
	strb r1, [r2, #0x13]
	strb r5, [r2, #0x1e]
	mov r0, ip
	strb r0, [r2, #0x10]
	strb r7, [r2, #0x1f]
	b _080812DE
	.align 2, 0
_080812D0: .4byte gProjectileData
_080812D4:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0808129E
_080812DE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileUpdate
ProjectileUpdate: @ 0x080812F0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _080813BC @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	beq _08081304
	b _08081940
_08081304:
	bl CallUpdateArmCannonOffset
	ldr r2, _080813C0 @ =gArmCannonY
	ldr r1, _080813C4 @ =gSamusData
	ldrh r0, [r1, #0x18]
	ldr r3, _080813C8 @ =gSamusGraphicsInfo
	lsrs r0, r0, #2
	ldrh r4, [r3, #0x24]
	adds r0, r0, r4
	lsls r0, r0, #2
	strh r0, [r2]
	ldr r2, _080813CC @ =gArmCannonX
	ldrh r0, [r1, #0x16]
	lsrs r0, r0, #2
	ldrh r3, [r3, #0x22]
	adds r0, r0, r3
	lsls r0, r0, #2
	strh r0, [r2]
	ldrb r0, [r1, #0xc]
	cmp r0, #0x10
	bne _0808136A
	movs r3, #0
	movs r5, #0
	movs r4, #1
	ldr r2, _080813D0 @ =0x030007F8
_08081336:
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08081346
	ldrb r0, [r2, #2]
	cmp r0, #0x43
	beq _080813FC
_08081346:
	adds r2, #0xc
	adds r5, #1
	cmp r5, #0xf
	ble _08081336
_0808134E:
	cmp r3, #0
	bne _0808136A
	ldr r5, _080813C0 @ =gArmCannonY
	ldrh r0, [r5]
	ldr r4, _080813CC @ =gArmCannonX
	ldrh r1, [r4]
	movs r2, #0x43
	bl ParticleSet
	ldrh r0, [r5]
	ldrh r1, [r4]
	movs r2, #0x44
	bl ParticleSet
_0808136A:
	ldr r0, _080813D4 @ =gSamusEnvironmentalEffects
	ldrb r0, [r0, #0x13]
	cmp r0, #0x10
	bne _080813A4
	movs r3, #0
	movs r5, #0
	movs r4, #1
	ldr r2, _080813D0 @ =0x030007F8
_0808137A:
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _0808138A
	ldrb r0, [r2, #2]
	cmp r0, #0x45
	beq _080813F4
_0808138A:
	adds r2, #0xc
	adds r5, #1
	cmp r5, #0xf
	ble _0808137A
_08081392:
	cmp r3, #0
	bne _080813A4
	ldr r0, _080813C0 @ =gArmCannonY
	ldrh r0, [r0]
	ldr r1, _080813CC @ =gArmCannonX
	ldrh r1, [r1]
	movs r2, #0x45
	bl ParticleSet
_080813A4:
	ldr r0, _080813C4 @ =gSamusData
	ldrb r0, [r0, #9]
	subs r0, #1
	cmp r0, #5
	bls _080813B0
	b _080818EA
_080813B0:
	lsls r0, r0, #2
	ldr r1, _080813D8 @ =_080813DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080813BC: .4byte gSubGameMode1
_080813C0: .4byte gArmCannonY
_080813C4: .4byte gSamusData
_080813C8: .4byte gSamusGraphicsInfo
_080813CC: .4byte gArmCannonX
_080813D0: .4byte 0x030007F8
_080813D4: .4byte gSamusEnvironmentalEffects
_080813D8: .4byte _080813DC
_080813DC: @ jump table
	.4byte _08081404 @ case 0
	.4byte _080815B8 @ case 1
	.4byte _080818EA @ case 2
	.4byte _080816E0 @ case 3
	.4byte _08081740 @ case 4
	.4byte _08081708 @ case 5
_080813F4:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _08081392
_080813FC:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	b _0808134E
_08081404:
	ldr r0, _0808144C @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08081458
	movs r0, #4
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081420
	b _080818E4
_08081420:
	ldr r5, _08081450 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _08081454 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #4
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #4
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #4
	movs r3, #2
	bl ProjectileInit
	b _08081556
	.align 2, 0
_0808144C: .4byte gEquipment
_08081450: .4byte gArmCannonY
_08081454: .4byte gArmCannonX
_08081458:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080814A4
	movs r0, #3
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081470
	b _080818E4
_08081470:
	ldr r5, _0808149C @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080814A0 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #3
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #3
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #3
	movs r3, #2
	bl ProjectileInit
	b _08081556
	.align 2, 0
_0808149C: .4byte gArmCannonY
_080814A0: .4byte gArmCannonX
_080814A4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080814F0
	movs r0, #2
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080814BC
	b _080818E4
_080814BC:
	ldr r5, _080814E8 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080814EC @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #2
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #2
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #2
	movs r3, #2
	bl ProjectileInit
	b _08081556
	.align 2, 0
_080814E8: .4byte gArmCannonY
_080814EC: .4byte gArmCannonX
_080814F0:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _08081578
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081506
	b _080818E4
_08081506:
	ldr r5, _08081568 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _0808156C @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #1
	movs r3, #0
	bl ProjectileInit
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08081570 @ =gProjectileData
	lsls r0, r6, #5
	adds r0, r0, r1
	ldrb r7, [r0, #0x10]
	mov r8, r7
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r1, [r5]
	ldrh r2, [r4]
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #1
	movs r3, #1
	bl ProjectileInitSecondary
	ldrh r1, [r5]
	ldrh r2, [r4]
	str r7, [sp]
	mov r3, r8
	str r3, [sp, #4]
	str r6, [sp, #8]
	movs r0, #1
	movs r3, #2
	bl ProjectileInitSecondary
_08081556:
	ldr r1, _08081574 @ =gSamusData
	movs r0, #7
	strb r0, [r1, #0xa]
	ldrh r0, [r5]
	ldrh r1, [r4]
	movs r2, #0x2b
	bl ParticleSet
	b _080818E4
	.align 2, 0
_08081568: .4byte gArmCannonY
_0808156C: .4byte gArmCannonX
_08081570: .4byte gProjectileData
_08081574: .4byte gSamusData
_08081578:
	movs r0, #0
	movs r1, #3
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081588
	b _080818E4
_08081588:
	ldr r5, _080815AC @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080815B0 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #0
	movs r3, #0
	bl ProjectileInit
	ldr r1, _080815B4 @ =gSamusData
	movs r0, #7
	strb r0, [r1, #0xa]
	ldrh r0, [r5]
	ldrh r1, [r4]
	movs r2, #0x2b
	bl ParticleSet
	b _080818E4
	.align 2, 0
_080815AC: .4byte gArmCannonY
_080815B0: .4byte gArmCannonX
_080815B4: .4byte gSamusData
_080815B8:
	ldr r0, _080815F4 @ =gEquipment
	ldrb r1, [r0, #0xb]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08081634
	movs r0, #0xd
	movs r1, #2
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080815D4
	b _080818E4
_080815D4:
	ldr r0, _080815F8 @ =gSamusEnvironmentalEffects
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _08081604
	ldr r0, _080815FC @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _08081600 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xe
	movs r3, #0
	bl ProjectileInit
	b _08081614
	.align 2, 0
_080815F4: .4byte gEquipment
_080815F8: .4byte gSamusEnvironmentalEffects
_080815FC: .4byte gArmCannonY
_08081600: .4byte gArmCannonX
_08081604:
	ldr r0, _08081624 @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _08081628 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xd
	movs r3, #0
	bl ProjectileInit
_08081614:
	ldr r1, _0808162C @ =gSamusData
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1, #0xa]
	ldr r0, _08081630 @ =gSamusEnvironmentalEffects
	strb r2, [r0, #0x13]
	b _080818E4
	.align 2, 0
_08081624: .4byte gArmCannonY
_08081628: .4byte gArmCannonX
_0808162C: .4byte gSamusData
_08081630: .4byte gSamusEnvironmentalEffects
_08081634:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08081670
	movs r0, #0xc
	movs r1, #2
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808164C
	b _080818E4
_0808164C:
	ldr r0, _08081664 @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _08081668 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #0
	bl ProjectileInit
	ldr r1, _0808166C @ =gSamusData
	movs r0, #0xf
	b _080816D0
	.align 2, 0
_08081664: .4byte gArmCannonY
_08081668: .4byte gArmCannonX
_0808166C: .4byte gSamusData
_08081670:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080816AC
	movs r0, #0xb
	movs r1, #2
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081688
	b _080818E4
_08081688:
	ldr r0, _080816A0 @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _080816A4 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xb
	movs r3, #0
	bl ProjectileInit
	ldr r1, _080816A8 @ =gSamusData
	movs r0, #0xe
	b _080816D0
	.align 2, 0
_080816A0: .4byte gArmCannonY
_080816A4: .4byte gArmCannonX
_080816A8: .4byte gSamusData
_080816AC:
	movs r0, #0xa
	movs r1, #2
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080816BC
	b _080818E4
_080816BC:
	ldr r0, _080816D4 @ =gArmCannonY
	ldrh r1, [r0]
	ldr r0, _080816D8 @ =gArmCannonX
	ldrh r2, [r0]
	movs r0, #0xa
	movs r3, #0
	bl ProjectileInit
	ldr r1, _080816DC @ =gSamusData
	movs r0, #9
_080816D0:
	strb r0, [r1, #0xa]
	b _080818E4
	.align 2, 0
_080816D4: .4byte gArmCannonY
_080816D8: .4byte gArmCannonX
_080816DC: .4byte gSamusData
_080816E0:
	movs r0, #0x10
	movs r1, #4
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080816F0
	b _080818E4
_080816F0:
	ldr r4, _08081704 @ =gSamusData
	ldrh r1, [r4, #0x18]
	ldrh r2, [r4, #0x16]
	movs r0, #0x10
	movs r3, #0
	bl ProjectileInit
	movs r0, #7
	strb r0, [r4, #0xa]
	b _080818E4
	.align 2, 0
_08081704: .4byte gSamusData
_08081708:
	movs r0, #0x11
	movs r1, #1
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08081718
	b _080818E4
_08081718:
	ldr r0, _08081738 @ =gCurrentPowerBomb
	ldrb r0, [r0]
	cmp r0, #0
	beq _08081722
	b _080818E4
_08081722:
	ldr r4, _0808173C @ =gSamusData
	ldrh r1, [r4, #0x18]
	ldrh r2, [r4, #0x16]
	movs r0, #0x11
	movs r3, #0
	bl ProjectileInit
	movs r0, #5
	strb r0, [r4, #0xa]
	b _080818E4
	.align 2, 0
_08081738: .4byte gCurrentPowerBomb
_0808173C: .4byte gSamusData
_08081740:
	ldr r0, _08081788 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08081794
	movs r0, #9
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808175C
	b _080818E4
_0808175C:
	ldr r5, _0808178C @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _08081790 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #9
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #9
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #9
	movs r3, #2
	bl ProjectileInit
	b _0808188E
	.align 2, 0
_08081788: .4byte gEquipment
_0808178C: .4byte gArmCannonY
_08081790: .4byte gArmCannonX
_08081794:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080817E0
	movs r0, #8
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080817AC
	b _080818E4
_080817AC:
	ldr r5, _080817D8 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080817DC @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #8
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #8
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #8
	movs r3, #2
	bl ProjectileInit
	b _0808188E
	.align 2, 0
_080817D8: .4byte gArmCannonY
_080817DC: .4byte gArmCannonX
_080817E0:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08081828
	movs r0, #7
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080818E4
	ldr r5, _08081820 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _08081824 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #7
	movs r3, #0
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #7
	movs r3, #1
	bl ProjectileInit
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #7
	movs r3, #2
	bl ProjectileInit
	b _0808188E
	.align 2, 0
_08081820: .4byte gArmCannonY
_08081824: .4byte gArmCannonX
_08081828:
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080818B4
	movs r0, #6
	movs r1, #7
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080818E4
	ldr r5, _080818A4 @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _080818A8 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #6
	movs r3, #0
	bl ProjectileInit
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _080818AC @ =gProjectileData
	lsls r0, r6, #5
	adds r0, r0, r1
	ldrb r7, [r0, #0x10]
	mov r8, r7
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldrh r1, [r5]
	ldrh r2, [r4]
	str r7, [sp]
	mov r0, r8
	str r0, [sp, #4]
	str r6, [sp, #8]
	movs r0, #6
	movs r3, #1
	bl ProjectileInitSecondary
	ldrh r1, [r5]
	ldrh r2, [r4]
	str r7, [sp]
	mov r3, r8
	str r3, [sp, #4]
	str r6, [sp, #8]
	movs r0, #6
	movs r3, #2
	bl ProjectileInitSecondary
_0808188E:
	ldr r1, _080818B0 @ =gSamusData
	movs r0, #3
	strb r0, [r1, #0xa]
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #0xf
	movs r3, #0
	bl ProjectileInit
	b _080818E4
	.align 2, 0
_080818A4: .4byte gArmCannonY
_080818A8: .4byte gArmCannonX
_080818AC: .4byte gProjectileData
_080818B0: .4byte gSamusData
_080818B4:
	movs r0, #5
	movs r1, #3
	bl ProjectileCount
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080818E4
	ldr r5, _0808194C @ =gArmCannonY
	ldrh r1, [r5]
	ldr r4, _08081950 @ =gArmCannonX
	ldrh r2, [r4]
	movs r0, #5
	movs r3, #0
	bl ProjectileInit
	ldr r1, _08081954 @ =gSamusData
	movs r0, #3
	strb r0, [r1, #0xa]
	ldrh r1, [r5]
	ldrh r2, [r4]
	movs r0, #0xf
	movs r3, #0
	bl ProjectileInit
_080818E4:
	ldr r1, _08081954 @ =gSamusData
	movs r0, #0
	strb r0, [r1, #9]
_080818EA:
	bl ProjectileCheckHittingSprite
	movs r5, #0
	ldr r6, _08081958 @ =gCurrentProjectile
	ldr r4, _0808195C @ =0x0879C27C
	mov r8, r4
_080818F6:
	ldr r1, _08081960 @ =gProjectileData
	lsls r0, r5, #5
	adds r4, r0, r1
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808193A
	adds r1, r6, #0
	adds r0, r4, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r7}
	stm r1!, {r2, r7}
	ldrb r0, [r6, #0xf]
	lsls r0, r0, #2
	add r0, r8
	ldr r0, [r0]
	bl _call_via_r0
	bl ProjectileUpdateAnimation
	bl ProjectileCheckOnScreen
	adds r1, r4, #0
	adds r0, r6, #0
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r7}
	stm r1!, {r2, r7}
_0808193A:
	adds r5, #1
	cmp r5, #0xf
	ble _080818F6
_08081940:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808194C: .4byte gArmCannonY
_08081950: .4byte gArmCannonX
_08081954: .4byte gSamusData
_08081958: .4byte gCurrentProjectile
_0808195C: .4byte 0x0879C27C
_08081960: .4byte gProjectileData

	thumb_func_start ProjectileUpdateAnimation
ProjectileUpdateAnimation: @ 0x08081964
	push {lr}
	ldr r2, _0808199C @ =gCurrentProjectile
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrh r1, [r2, #0xc]
	ldr r3, [r2, #4]
	lsls r1, r1, #3
	adds r1, r1, r3
	ldrb r1, [r1, #4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	bhs _08081998
	movs r0, #1
	strb r0, [r2, #0xe]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	ldrh r0, [r2, #0xc]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _08081998
	strh r0, [r2, #0xc]
_08081998:
	pop {r0}
	bx r0
	.align 2, 0
_0808199C: .4byte gCurrentProjectile

	thumb_func_start ProjectileDrawAll_False
ProjectileDrawAll_False: @ 0x080819A0
	push {r4, r5, r6, lr}
	ldr r0, _080819E0 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _080819D8
	movs r5, #0
	ldr r4, _080819E4 @ =gProjectileData
_080819B0:
	ldrb r1, [r4]
	movs r0, #0x87
	ands r0, r1
	cmp r0, #3
	bne _080819D0
	ldr r1, _080819E8 @ =gCurrentProjectile
	adds r0, r4, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r0, r5, #0
	bl ProjectileDraw
_080819D0:
	adds r4, #0x20
	adds r5, #1
	cmp r5, #0xf
	ble _080819B0
_080819D8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080819E0: .4byte gSubGameMode1
_080819E4: .4byte gProjectileData
_080819E8: .4byte gCurrentProjectile

	thumb_func_start ProjectileDrawAll_True
ProjectileDrawAll_True: @ 0x080819EC
	push {r4, r5, r6, lr}
	ldr r0, _08081A2C @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08081A24
	movs r5, #0
	ldr r4, _08081A30 @ =gProjectileData
_080819FC:
	ldrb r1, [r4]
	movs r0, #0x87
	ands r0, r1
	cmp r0, #0x83
	bne _08081A1C
	ldr r1, _08081A34 @ =gCurrentProjectile
	adds r0, r4, #0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	adds r0, r5, #0
	bl ProjectileDraw
_08081A1C:
	adds r4, #0x20
	adds r5, #1
	cmp r5, #0xf
	ble _080819FC
_08081A24:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081A2C: .4byte gSubGameMode1
_08081A30: .4byte gProjectileData
_08081A34: .4byte gCurrentProjectile

	thumb_func_start ProjectileDraw
ProjectileDraw: @ 0x08081A38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	ldr r0, _08081BD0 @ =gNextOamSlot
	ldrb r1, [r0]
	str r1, [sp, #4]
	ldr r3, _08081BD4 @ =gCurrentProjectile
	ldrh r1, [r3, #0xc]
	ldr r2, [r3, #4]
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r5, [r1]
	ldrh r2, [r5]
	str r2, [sp]
	adds r5, #2
	ldr r1, [sp, #4]
	adds r6, r2, r1
	cmp r6, #0x7f
	ble _08081A66
	b _08081BBE
_08081A66:
	lsls r0, r1, #3
	ldr r2, _08081BD8 @ =gOamData
	adds r4, r0, r2
	ldrh r1, [r3, #8]
	lsrs r1, r1, #2
	ldr r0, _08081BDC @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	ldrh r1, [r3, #0xa]
	lsrs r1, r1, #2
	ldr r0, _08081BE0 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	ldrb r1, [r3]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x11]
	str r3, [sp, #0x14]
	ldr r0, _08081BE4 @ =gIoRegisters
	ldrh r0, [r0, #0xa]
	movs r3, #3
	ands r3, r0
	str r3, [sp, #0x10]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _08081AC0
	adds r3, #1
	str r3, [sp, #0x10]
_08081AC0:
	movs r0, #0
	mov ip, r0
	str r6, [sp, #0x18]
	ldr r1, [sp]
	cmp ip, r1
	bge _08081BB6
	movs r2, #1
	mov r8, r2
_08081AD0:
	ldrh r0, [r5]
	adds r7, r0, #0
	adds r5, #2
	strh r7, [r4]
	adds r4, #2
	ldr r0, [sp, #4]
	add r0, ip
	lsls r0, r0, #3
	ldr r1, _08081BD8 @ =gOamData
	adds r3, r0, r1
	mov r2, sl
	adds r0, r7, r2
	strb r0, [r3]
	ldrh r6, [r5]
	adds r5, #2
	strh r6, [r4]
	adds r4, #2
	mov r0, sb
	adds r1, r6, r0
	ldr r2, _08081BE8 @ =0x000001FF
	ands r1, r2
	ldrh r2, [r3, #2]
	ldr r0, _08081BEC @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r5]
	strh r0, [r4]
	adds r5, #2
	adds r4, #2
	movs r0, #3
	ldr r1, [sp, #0x10]
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	lsrs r2, r0, #4
	ldr r1, [sp, #0x14]
	adds r2, r2, r1
	lsls r2, r2, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #5]
	ldr r2, [sp, #8]
	cmp r2, #0
	beq _08081B72
	ldrb r2, [r3, #3]
	lsls r0, r2, #0x1b
	lsrs r0, r0, #0x1f
	mov r1, r8
	eors r0, r1
	ands r0, r1
	lsls r0, r0, #4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	ldrb r0, [r3, #1]
	lsrs r0, r0, #6
	lsrs r1, r1, #6
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r2, _08081BF0 @ =sOamXFlipOffsets
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r1, r0, #3
	adds r1, r6, r1
	mov r0, sb
	subs r1, r0, r1
	ldr r2, _08081BE8 @ =0x000001FF
	ands r1, r2
	ldrh r2, [r3, #2]
	ldr r0, _08081BEC @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
_08081B72:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _08081BAA
	ldrb r2, [r3, #3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1f
	mov r1, r8
	eors r0, r1
	ands r0, r1
	lsls r0, r0, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	ldrb r0, [r3, #1]
	lsrs r0, r0, #6
	lsrs r1, r1, #6
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r2, _08081BF4 @ =sOamYFlipOffsets
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r7, r0
	mov r1, sl
	subs r0, r1, r0
	strb r0, [r3]
_08081BAA:
	adds r4, #2
	movs r2, #1
	add ip, r2
	ldr r3, [sp]
	cmp ip, r3
	blt _08081AD0
_08081BB6:
	mov r0, sp
	ldrb r1, [r0, #0x18]
	ldr r0, _08081BD0 @ =gNextOamSlot
	strb r1, [r0]
_08081BBE:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08081BD0: .4byte gNextOamSlot
_08081BD4: .4byte gCurrentProjectile
_08081BD8: .4byte gOamData
_08081BDC: .4byte gBg1YPosition
_08081BE0: .4byte gBg1XPosition
_08081BE4: .4byte gIoRegisters
_08081BE8: .4byte 0x000001FF
_08081BEC: .4byte 0xFFFFFE00
_08081BF0: .4byte sOamXFlipOffsets
_08081BF4: .4byte sOamYFlipOffsets

	thumb_func_start ProjectileCheckOnScreen
ProjectileCheckOnScreen: @ 0x08081BF8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _08081C8C @ =gCurrentProjectile
	ldrb r0, [r1]
	mov sl, r0
	movs r0, #1
	mov r2, sl
	ands r0, r2
	adds r7, r1, #0
	cmp r0, #0
	beq _08081CEA
	ldr r0, _08081C90 @ =gBg1YPosition
	ldr r4, _08081C94 @ =gBg1XPosition
	ldrh r6, [r7, #8]
	ldrh r1, [r7, #0xa]
	mov ip, r1
	movs r2, #0x80
	lsls r2, r2, #1
	adds r3, r2, #0
	ldrh r0, [r0]
	adds r1, r3, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r6, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrb r2, [r7, #0x14]
	lsls r2, r2, #2
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r1, r1, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	ldrh r4, [r4]
	adds r0, r3, r4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add r3, ip
	lsls r3, r3, #0x10
	ldrb r1, [r7, #0x15]
	lsls r1, r1, #2
	subs r2, r0, r1
	lsls r2, r2, #0x10
	str r2, [sp]
	lsrs r4, r3, #0x10
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r1, r1, r2
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp]
	cmp r1, r3
	bhs _08081C98
	cmp r4, r0
	bhs _08081C98
	cmp sb, r5
	bhs _08081C98
	cmp r5, r8
	bhs _08081C98
	movs r0, #2
	mov r2, sl
	orrs r0, r2
	b _08081CE8
	.align 2, 0
_08081C8C: .4byte gCurrentProjectile
_08081C90: .4byte gBg1YPosition
_08081C94: .4byte gBg1XPosition
_08081C98:
	ldrb r0, [r7]
	movs r1, #0xfd
	ands r1, r0
	strb r1, [r7]
	ldrb r0, [r7, #0xf]
	cmp r0, #0xf
	bhi _08081CEA
	ldr r1, _08081CBC @ =gSamusData
	ldrh r0, [r1, #0x18]
	subs r0, #0x48
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldrh r4, [r1, #0x16]
	cmp r6, r5
	bls _08081CC0
	subs r0, r6, r5
	b _08081CC2
	.align 2, 0
_08081CBC: .4byte gSamusData
_08081CC0:
	subs r0, r5, r6
_08081CC2:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp ip, r4
	bls _08081CD0
	mov r1, ip
	subs r0, r1, r4
	b _08081CD4
_08081CD0:
	mov r2, ip
	subs r0, r4, r2
_08081CD4:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r5, r0
	bhi _08081CE6
	subs r0, #0x80
	cmp r4, r0
	bls _08081CEA
_08081CE6:
	movs r0, #0
_08081CE8:
	strb r0, [r7]
_08081CEA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileLoadEyeCoreXGraphics
ProjectileLoadEyeCoreXGraphics: @ 0x08081CFC
	push {lr}
	ldr r0, _08081D28 @ =gCurrentSprite
	ldrb r0, [r0, #0x1d]
	adds r1, r0, #0
	cmp r0, #0x59
	bne _08081D48
	ldr r1, _08081D2C @ =0x040000D4
	ldr r0, _08081D30 @ =sWaveBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081D34 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081D38 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081D3C @ =sWaveBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081D40 @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081D44 @ =sWaveBeamPal
	b _08081E26
	.align 2, 0
_08081D28: .4byte gCurrentSprite
_08081D2C: .4byte 0x040000D4
_08081D30: .4byte sWaveBeamGfx_Top
_08081D34: .4byte 0x06016000
_08081D38: .4byte 0x80000140
_08081D3C: .4byte sWaveBeamGfx_Bottom
_08081D40: .4byte 0x06016400
_08081D44: .4byte sWaveBeamPal
_08081D48:
	cmp r0, #0x58
	bne _08081D88
	ldr r1, _08081D6C @ =0x040000D4
	ldr r0, _08081D70 @ =sPlasmaBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081D74 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081D78 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081D7C @ =sPlasmaBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081D80 @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081D84 @ =sPlasmaBeamPal
	b _08081E26
	.align 2, 0
_08081D6C: .4byte 0x040000D4
_08081D70: .4byte sPlasmaBeamGfx_Top
_08081D74: .4byte 0x06016000
_08081D78: .4byte 0x80000140
_08081D7C: .4byte sPlasmaBeamGfx_Bottom
_08081D80: .4byte 0x06016400
_08081D84: .4byte sPlasmaBeamPal
_08081D88:
	cmp r0, #0x57
	bne _08081DC8
	ldr r1, _08081DAC @ =0x040000D4
	ldr r0, _08081DB0 @ =sWideBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081DB4 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081DB8 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081DBC @ =sWideBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081DC0 @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081DC4 @ =sWideBeamPal
	b _08081E26
	.align 2, 0
_08081DAC: .4byte 0x040000D4
_08081DB0: .4byte sWideBeamGfx_Top
_08081DB4: .4byte 0x06016000
_08081DB8: .4byte 0x80000140
_08081DBC: .4byte sWideBeamGfx_Bottom
_08081DC0: .4byte 0x06016400
_08081DC4: .4byte sWideBeamPal
_08081DC8:
	cmp r1, #0x56
	bne _08081E08
	ldr r1, _08081DEC @ =0x040000D4
	ldr r0, _08081DF0 @ =sChargeBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081DF4 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081DF8 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081DFC @ =sChargeBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081E00 @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081E04 @ =sChargeBeamPal
	b _08081E26
	.align 2, 0
_08081DEC: .4byte 0x040000D4
_08081DF0: .4byte sChargeBeamGfx_Top
_08081DF4: .4byte 0x06016000
_08081DF8: .4byte 0x80000140
_08081DFC: .4byte sChargeBeamGfx_Bottom
_08081E00: .4byte 0x06016400
_08081E04: .4byte sChargeBeamPal
_08081E08:
	ldr r1, _08081E38 @ =0x040000D4
	ldr r0, _08081E3C @ =sIceBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081E40 @ =0x06016000
	str r0, [r1, #4]
	ldr r2, _08081E44 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081E48 @ =sIceBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081E4C @ =0x06016400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081E50 @ =sIceBeamPal
_08081E26:
	str r0, [r1]
	ldr r0, _08081E54 @ =0x05000380
	str r0, [r1, #4]
	ldr r0, _08081E58 @ =0x80000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08081E38: .4byte 0x040000D4
_08081E3C: .4byte sIceBeamGfx_Top
_08081E40: .4byte 0x06016000
_08081E44: .4byte 0x80000140
_08081E48: .4byte sIceBeamGfx_Bottom
_08081E4C: .4byte 0x06016400
_08081E50: .4byte sIceBeamPal
_08081E54: .4byte 0x05000380
_08081E58: .4byte 0x80000005

	thumb_func_start ProjectileLoadBeamGraphics
ProjectileLoadBeamGraphics: @ 0x08081E5C
	push {lr}
	ldr r0, _08081E8C @ =gEquipment
	ldrb r1, [r0, #0xa]
	adds r2, r1, #0
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08081EAC
	ldr r1, _08081E90 @ =0x040000D4
	ldr r0, _08081E94 @ =sIceBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081E98 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081E9C @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081EA0 @ =sIceBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081EA4 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081EA8 @ =sIceBeamPal
	b _08081FDA
	.align 2, 0
_08081E8C: .4byte gEquipment
_08081E90: .4byte 0x040000D4
_08081E94: .4byte sIceBeamGfx_Top
_08081E98: .4byte 0x06011000
_08081E9C: .4byte 0x80000140
_08081EA0: .4byte sIceBeamGfx_Bottom
_08081EA4: .4byte 0x06011400
_08081EA8: .4byte sIceBeamPal
_08081EAC:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08081EF0
	ldr r1, _08081ED4 @ =0x040000D4
	ldr r0, _08081ED8 @ =sWaveBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081EDC @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081EE0 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081EE4 @ =sWaveBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081EE8 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081EEC @ =sWaveBeamPal
	b _08081FDA
	.align 2, 0
_08081ED4: .4byte 0x040000D4
_08081ED8: .4byte sWaveBeamGfx_Top
_08081EDC: .4byte 0x06011000
_08081EE0: .4byte 0x80000140
_08081EE4: .4byte sWaveBeamGfx_Bottom
_08081EE8: .4byte 0x06011400
_08081EEC: .4byte sWaveBeamPal
_08081EF0:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08081F34
	ldr r1, _08081F18 @ =0x040000D4
	ldr r0, _08081F1C @ =sPlasmaBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081F20 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081F24 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081F28 @ =sPlasmaBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081F2C @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081F30 @ =sPlasmaBeamPal
	b _08081FDA
	.align 2, 0
_08081F18: .4byte 0x040000D4
_08081F1C: .4byte sPlasmaBeamGfx_Top
_08081F20: .4byte 0x06011000
_08081F24: .4byte 0x80000140
_08081F28: .4byte sPlasmaBeamGfx_Bottom
_08081F2C: .4byte 0x06011400
_08081F30: .4byte sPlasmaBeamPal
_08081F34:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08081F78
	ldr r1, _08081F5C @ =0x040000D4
	ldr r0, _08081F60 @ =sWideBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081F64 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081F68 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081F6C @ =sWideBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081F70 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081F74 @ =sWideBeamPal
	b _08081FDA
	.align 2, 0
_08081F5C: .4byte 0x040000D4
_08081F60: .4byte sWideBeamGfx_Top
_08081F64: .4byte 0x06011000
_08081F68: .4byte 0x80000140
_08081F6C: .4byte sWideBeamGfx_Bottom
_08081F70: .4byte 0x06011400
_08081F74: .4byte sWideBeamPal
_08081F78:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _08081FBC
	ldr r1, _08081FA0 @ =0x040000D4
	ldr r0, _08081FA4 @ =sChargeBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081FA8 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081FAC @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081FB0 @ =sChargeBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08081FB4 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081FB8 @ =sChargeBeamPal
	b _08081FDA
	.align 2, 0
_08081FA0: .4byte 0x040000D4
_08081FA4: .4byte sChargeBeamGfx_Top
_08081FA8: .4byte 0x06011000
_08081FAC: .4byte 0x80000140
_08081FB0: .4byte sChargeBeamGfx_Bottom
_08081FB4: .4byte 0x06011400
_08081FB8: .4byte sChargeBeamPal
_08081FBC:
	ldr r1, _08081FEC @ =0x040000D4
	ldr r0, _08081FF0 @ =sNormalBeamGfx_Top
	str r0, [r1]
	ldr r0, _08081FF4 @ =0x06011000
	str r0, [r1, #4]
	ldr r2, _08081FF8 @ =0x80000140
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08081FFC @ =sNormalBeamGfx_Bottom
	str r0, [r1]
	ldr r0, _08082000 @ =0x06011400
	str r0, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08082004 @ =sNormalBeamPal
_08081FDA:
	str r0, [r1]
	ldr r0, _08082008 @ =0x05000240
	str r0, [r1, #4]
	ldr r0, _0808200C @ =0x80000005
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08081FEC: .4byte 0x040000D4
_08081FF0: .4byte sNormalBeamGfx_Top
_08081FF4: .4byte 0x06011000
_08081FF8: .4byte 0x80000140
_08081FFC: .4byte sNormalBeamGfx_Bottom
_08082000: .4byte 0x06011400
_08082004: .4byte sNormalBeamPal
_08082008: .4byte 0x05000240
_0808200C: .4byte 0x80000005

	thumb_func_start ProjectileLoadMissileGraphics
ProjectileLoadMissileGraphics: @ 0x08082010
	push {lr}
	ldr r0, _08082034 @ =gEquipment
	ldrb r1, [r0, #0xb]
	adds r2, r1, #0
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0808204C
	ldr r0, _08082038 @ =0x040000D4
	ldr r1, _0808203C @ =sDiffusionMissileGfx_Top
	str r1, [r0]
	ldr r1, _08082040 @ =0x06011380
	str r1, [r0, #4]
	ldr r2, _08082044 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08082048 @ =sDiffusionMissileGfx_Bottom
	b _080820C6
	.align 2, 0
_08082034: .4byte gEquipment
_08082038: .4byte 0x040000D4
_0808203C: .4byte sDiffusionMissileGfx_Top
_08082040: .4byte 0x06011380
_08082044: .4byte 0x80000040
_08082048: .4byte sDiffusionMissileGfx_Bottom
_0808204C:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0808207C
	ldr r0, _08082068 @ =0x040000D4
	ldr r1, _0808206C @ =sIceMissileGfx_Top
	str r1, [r0]
	ldr r1, _08082070 @ =0x06011380
	str r1, [r0, #4]
	ldr r2, _08082074 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _08082078 @ =sIceMissileGfx_Bottom
	b _080820C6
	.align 2, 0
_08082068: .4byte 0x040000D4
_0808206C: .4byte sIceMissileGfx_Top
_08082070: .4byte 0x06011380
_08082074: .4byte 0x80000040
_08082078: .4byte sIceMissileGfx_Bottom
_0808207C:
	movs r0, #2
	ands r1, r0
	cmp r1, #0
	beq _080820AC
	ldr r0, _08082098 @ =0x040000D4
	ldr r1, _0808209C @ =sSuperMissileGfx_Top
	str r1, [r0]
	ldr r1, _080820A0 @ =0x06011380
	str r1, [r0, #4]
	ldr r2, _080820A4 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080820A8 @ =sSuperMissileGfx_Bottom
	b _080820C6
	.align 2, 0
_08082098: .4byte 0x040000D4
_0808209C: .4byte sSuperMissileGfx_Top
_080820A0: .4byte 0x06011380
_080820A4: .4byte 0x80000040
_080820A8: .4byte sSuperMissileGfx_Bottom
_080820AC:
	movs r0, #1
	ands r2, r0
	cmp r2, #0
	beq _080820D0
	ldr r0, _080820D4 @ =0x040000D4
	ldr r1, _080820D8 @ =sNormalMissileGfx_Top
	str r1, [r0]
	ldr r1, _080820DC @ =0x06011380
	str r1, [r0, #4]
	ldr r2, _080820E0 @ =0x80000040
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080820E4 @ =sNormalMissileGfx_Bottom
_080820C6:
	str r1, [r0]
	ldr r1, _080820E8 @ =0x06011780
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
_080820D0:
	pop {r0}
	bx r0
	.align 2, 0
_080820D4: .4byte 0x040000D4
_080820D8: .4byte sNormalMissileGfx_Top
_080820DC: .4byte 0x06011380
_080820E0: .4byte 0x80000040
_080820E4: .4byte sNormalMissileGfx_Bottom
_080820E8: .4byte 0x06011780

	thumb_func_start ProjectileCallLoadGraphicsAndClearProjectiles
ProjectileCallLoadGraphicsAndClearProjectiles: @ 0x080820EC
	push {lr}
	bl ProjectileLoadBeamGraphics
	bl ProjectileLoadMissileGraphics
	ldr r0, _08082118 @ =gPauseScreenFlag
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08082114
	ldr r1, _0808211C @ =gProjectileData
	movs r2, #0
	movs r3, #0xf0
	lsls r3, r3, #1
	adds r0, r1, r3
_0808210C:
	strb r2, [r0]
	subs r0, #0x20
	cmp r0, r1
	bge _0808210C
_08082114:
	pop {r0}
	bx r0
	.align 2, 0
_08082118: .4byte gPauseScreenFlag
_0808211C: .4byte gProjectileData

	thumb_func_start ProjectileMove
ProjectileMove: @ 0x08082120
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0808213C @ =gCurrentProjectile
	ldrb r2, [r0, #0x10]
	adds r4, r0, #0
	cmp r2, #3
	beq _0808217A
	cmp r2, #3
	bgt _08082140
	cmp r2, #2
	beq _0808215A
	b _0808219A
	.align 2, 0
_0808213C: .4byte gCurrentProjectile
_08082140:
	cmp r2, #4
	beq _0808214A
	cmp r2, #5
	beq _08082152
	b _0808219A
_0808214A:
	ldrh r0, [r4, #8]
	subs r0, r0, r3
	strh r0, [r4, #8]
	b _080821E6
_08082152:
	ldrh r0, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
	b _080821E6
_0808215A:
	lsls r0, r3, #1
	adds r0, r0, r3
	asrs r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r0, [r4, #8]
	subs r0, r0, r3
	strh r0, [r4, #8]
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080821AA
	ldrh r0, [r4, #0xa]
	adds r0, r0, r3
	b _080821AE
_0808217A:
	lsls r0, r3, #1
	adds r0, r0, r3
	asrs r0, r0, #2
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldrh r0, [r4, #8]
	adds r0, r0, r3
	strh r0, [r4, #8]
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080821AA
	ldrh r0, [r4, #0xa]
	adds r0, r0, r3
	b _080821AE
_0808219A:
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080821AA
	ldrh r0, [r4, #0xa]
	adds r0, r0, r3
	b _080821AE
_080821AA:
	ldrh r0, [r4, #0xa]
	subs r0, r0, r3
_080821AE:
	strh r0, [r4, #0xa]
	ldr r0, _080821D8 @ =gSamusData
	ldrh r0, [r0, #0x1a]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	adds r6, r3, #0
	adds r2, r4, #0
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080821DC
	cmp r5, #0
	ble _080821E6
	ldrh r0, [r2, #0xa]
	adds r0, r0, r3
	strh r0, [r2, #0xa]
	b _080821E6
	.align 2, 0
_080821D8: .4byte gSamusData
_080821DC:
	cmp r5, #0
	bge _080821E6
	ldrh r0, [r4, #0xa]
	adds r0, r0, r6
	strh r0, [r4, #0xa]
_080821E6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ProjectileCheckHittingSolid
ProjectileCheckHittingSolid: @ 0x080821EC
	push {lr}
	ldr r2, _08082208 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08082210
	ldr r0, _0808220C @ =gCurrentClipdataAffectingAction
	strb r1, [r0]
	movs r0, #0
	b _08082228
	.align 2, 0
_08082208: .4byte gCurrentProjectile
_0808220C: .4byte gCurrentClipdataAffectingAction
_08082210:
	ldrh r0, [r2, #8]
	ldrh r1, [r2, #0xa]
	bl ClipdataProcess
	movs r1, #0x80
	lsls r1, r1, #0x11
	ands r1, r0
	cmp r1, #0
	bne _08082226
	movs r0, #0
	b _08082228
_08082226:
	movs r0, #1
_08082228:
	pop {r1}
	bx r1

	thumb_func_start ProjectileCheckVerticalCollisionAtPosition
ProjectileCheckVerticalCollisionAtPosition: @ 0x0808222C
	push {r4, r5, r6, r7, lr}
	ldr r2, _08082248 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08082250
	ldr r0, _0808224C @ =gCurrentClipdataAffectingAction
	strb r1, [r0]
	movs r0, #0
	b _0808245E
	.align 2, 0
_08082248: .4byte gCurrentProjectile
_0808224C: .4byte gCurrentClipdataAffectingAction
_08082250:
	ldrh r6, [r2, #8]
	ldrh r7, [r2, #0xa]
	adds r4, r6, #0
	adds r5, r7, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ClipdataProcess
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #0x11
	ands r0, r1
	movs r3, #0x11
	cmp r0, #0
	bne _08082272
	movs r0, #0
	b _0808245E
_08082272:
	movs r0, #0xff
	ands r0, r1
	subs r0, #2
	cmp r0, #0xa
	bls _0808227E
	b _080823E4
_0808227E:
	lsls r0, r0, #2
	ldr r1, _08082288 @ =_0808228C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082288: .4byte _0808228C
_0808228C: @ jump table
	.4byte _0808234C @ case 0
	.4byte _080822B8 @ case 1
	.4byte _080823A0 @ case 2
	.4byte _08082374 @ case 3
	.4byte _080822EC @ case 4
	.4byte _08082314 @ case 5
	.4byte _080823E4 @ case 6
	.4byte _080823E4 @ case 7
	.4byte _080823E4 @ case 8
	.4byte _080823E4 @ case 9
	.4byte _080823D0 @ case 10
_080822B8:
	ldr r3, _080822E4 @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #5
	ldr r2, _080822E8 @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_080822E4: .4byte 0x0000FFC0
_080822E8: .4byte gCurrentProjectile
_080822EC:
	ldr r3, _08082310 @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	subs r0, #0x3f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	subs r0, #0x7e
	b _08082336
	.align 2, 0
_08082310: .4byte 0x0000FFC0
_08082314:
	ldr r3, _08082344 @ =0x0000FFC0
	adds r1, r6, #0
	ands r1, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	subs r0, #0x1f
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	subs r0, #0x3e
_08082336:
	subs r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #3
	ldr r2, _08082348 @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_08082344: .4byte 0x0000FFC0
_08082348: .4byte gCurrentProjectile
_0808234C:
	ldr r2, _0808236C @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r2
	movs r1, #0x3f
	adds r0, r7, #0
	ands r0, r1
	orrs r4, r0
	adds r5, r7, #0
	ands r5, r2
	adds r0, r6, #0
	ands r0, r1
	orrs r5, r0
	movs r3, #4
	ldr r2, _08082370 @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_0808236C: .4byte 0x0000FFC0
_08082370: .4byte gCurrentProjectile
_08082374:
	ldr r3, _08082398 @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	adds r0, #0x1f
	orrs r4, r0
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	ldr r2, _0808239C @ =0x0000FFC1
	adds r0, r0, r2
	b _080823BA
	.align 2, 0
_08082398: .4byte 0x0000FFC0
_0808239C: .4byte 0x0000FFC1
_080823A0:
	ldr r3, _080823C8 @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r3
	movs r2, #0x3f
	adds r0, r7, #0
	ands r0, r2
	lsrs r0, r0, #1
	orrs r4, r0
	adds r1, r7, #0
	ands r1, r3
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
_080823BA:
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r3, #2
	ldr r2, _080823CC @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_080823C8: .4byte 0x0000FFC0
_080823CC: .4byte gCurrentProjectile
_080823D0:
	ldr r4, _080823DC @ =0x0000FFC0
	ands r4, r6
	movs r3, #0x10
	ldr r2, _080823E0 @ =gCurrentProjectile
	b _08082402
	.align 2, 0
_080823DC: .4byte 0x0000FFC0
_080823E0: .4byte gCurrentProjectile
_080823E4:
	ldr r0, _08082414 @ =0x0000FFC0
	adds r4, r6, #0
	ands r4, r0
	adds r5, r7, #0
	ands r5, r0
	ldr r2, _08082418 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08082402
	adds r0, r5, #0
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08082402:
	ldrb r0, [r2, #0x10]
	cmp r0, #4
	beq _08082426
	cmp r0, #4
	ble _0808241C
	cmp r0, #5
	beq _08082432
	b _0808243A
	.align 2, 0
_08082414: .4byte 0x0000FFC0
_08082418: .4byte gCurrentProjectile
_0808241C:
	cmp r0, #2
	blt _0808243A
	cmp r3, #0x10
	bne _0808245C
	b _0808245A
_08082426:
	cmp r3, #0x11
	bne _0808245A
	adds r0, r4, #0
	adds r0, #0x40
	strh r0, [r2, #8]
	b _0808245C
_08082432:
	cmp r6, r4
	blo _0808245A
	strh r4, [r2, #8]
	b _0808245C
_0808243A:
	cmp r3, #0xc
	beq _0808245A
	adds r4, r2, #0
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08082452
	cmp r7, r5
	blo _0808245A
	strh r5, [r4, #0xa]
	b _0808245C
_08082452:
	cmp r7, r5
	bhi _0808245A
	strh r5, [r2, #0xa]
	b _0808245C
_0808245A:
	movs r3, #0
_0808245C:
	adds r0, r3, #0
_0808245E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start ProjectileMovePart
ProjectileMovePart: @ 0x08082464
	push {r4, lr}
	movs r3, #4
	movs r4, #5
	ldr r1, _08082480 @ =gCurrentProjectile
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _08082514
	lsls r0, r0, #2
	ldr r1, _08082484 @ =_08082488
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082480: .4byte gCurrentProjectile
_08082484: .4byte _08082488
_08082488: @ jump table
	.4byte _08082514 @ case 0
	.4byte _080824C0 @ case 1
	.4byte _0808249C @ case 2
	.4byte _080824FE @ case 3
	.4byte _080824FE @ case 4
_0808249C:
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080824AE
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	beq _080824E2
	b _080824F0
_080824AE:
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _080824BA
	ldrh r0, [r2, #8]
	subs r0, r0, r3
	b _080824F4
_080824BA:
	ldrh r0, [r2, #8]
	adds r0, r3, r0
	b _080824E6
_080824C0:
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080824DC
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _080824D6
	ldrh r0, [r2, #8]
	subs r0, r0, r3
	b _080824F4
_080824D6:
	ldrh r0, [r2, #8]
	adds r0, r3, r0
	b _080824E6
_080824DC:
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _080824F0
_080824E2:
	ldrh r0, [r2, #8]
	subs r0, r0, r3
_080824E6:
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	adds r0, r3, r0
	strh r0, [r2, #0xa]
	b _08082526
_080824F0:
	ldrh r0, [r2, #8]
	adds r0, r3, r0
_080824F4:
	strh r0, [r2, #8]
	ldrh r0, [r2, #0xa]
	subs r0, r0, r3
	strh r0, [r2, #0xa]
	b _08082526
_080824FE:
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _0808250C
	ldrh r0, [r2, #0xa]
	subs r0, r0, r4
	strh r0, [r2, #0xa]
	b _08082526
_0808250C:
	ldrh r0, [r2, #0xa]
	adds r0, r4, r0
	strh r0, [r2, #0xa]
	b _08082526
_08082514:
	ldrb r0, [r2, #0x13]
	cmp r0, #1
	bne _08082520
	ldrh r0, [r2, #8]
	subs r0, r0, r4
	b _08082524
_08082520:
	ldrh r0, [r2, #8]
	adds r0, r4, r0
_08082524:
	strh r0, [r2, #8]
_08082526:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProjectileMoveWaveBeamParts
ProjectileMoveWaveBeamParts: @ 0x0808252C
	push {r4, r5, r6, lr}
	ldr r5, _08082564 @ =gCurrentProjectile
	ldrb r0, [r5, #0x1e]
	movs r4, #7
	ands r4, r0
	ldr r1, _08082568 @ =sWaveBeamPartVelocity
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r0, r6, #0
	bl __floatsidf
	ldr r2, _0808256C @ =0x3FF66666
	ldr r3, _08082570 @ =0x66666666
	bl __muldf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r2, [r5, #0x13]
	cmp r4, #3
	bls _0808257A
	cmp r2, #1
	bne _08082574
	movs r2, #2
	b _0808257A
	.align 2, 0
_08082564: .4byte gCurrentProjectile
_08082568: .4byte sWaveBeamPartVelocity
_0808256C: .4byte 0x3FF66666
_08082570: .4byte 0x66666666
_08082574:
	cmp r2, #2
	bne _0808257A
	movs r2, #1
_0808257A:
	ldrb r0, [r5, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08082612
	lsls r0, r0, #2
	ldr r1, _0808258C @ =_08082590
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808258C: .4byte _08082590
_08082590: @ jump table
	.4byte _08082612 @ case 0
	.4byte _080825C4 @ case 1
	.4byte _080825A4 @ case 2
	.4byte _080825FE @ case 3
	.4byte _080825FE @ case 4
_080825A4:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080825B4
	cmp r2, #1
	beq _080825E2
	b _080825F0
_080825B4:
	cmp r2, #1
	bne _080825BE
	ldrh r0, [r5, #8]
	subs r0, r0, r6
	b _080825F4
_080825BE:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
	b _080825E6
_080825C4:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080825DE
	cmp r2, #1
	bne _080825D8
	ldrh r0, [r5, #8]
	subs r0, r0, r6
	b _080825F4
_080825D8:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
	b _080825E6
_080825DE:
	cmp r2, #1
	bne _080825F0
_080825E2:
	ldrh r0, [r5, #8]
	subs r0, r0, r6
_080825E6:
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	adds r0, r6, r0
	strh r0, [r5, #0xa]
	b _08082622
_080825F0:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
_080825F4:
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	subs r0, r0, r6
	strh r0, [r5, #0xa]
	b _08082622
_080825FE:
	cmp r2, #1
	bne _0808260A
	ldrh r0, [r5, #0xa]
	subs r0, r0, r3
	strh r0, [r5, #0xa]
	b _08082622
_0808260A:
	ldrh r0, [r5, #0xa]
	adds r0, r3, r0
	strh r0, [r5, #0xa]
	b _08082622
_08082612:
	cmp r2, #1
	bne _0808261C
	ldrh r0, [r5, #8]
	subs r0, r0, r3
	b _08082620
_0808261C:
	ldrh r0, [r5, #8]
	adds r0, r3, r0
_08082620:
	strh r0, [r5, #8]
_08082622:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ProjectileMoveWaveBeamParts_Unused
ProjectileMoveWaveBeamParts_Unused: @ 0x08082628
	push {r4, r5, r6, lr}
	ldr r5, _08082660 @ =gCurrentProjectile
	ldrb r0, [r5, #0x1e]
	movs r4, #0xf
	ands r4, r0
	ldr r1, _08082664 @ =sWaveBeamPartVelocity_Unused
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	adds r0, r6, #0
	bl __floatsidf
	ldr r2, _08082668 @ =0x3FF66666
	ldr r3, _0808266C @ =0x66666666
	bl __muldf3
	bl __fixunsdfsi
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrb r2, [r5, #0x13]
	cmp r4, #7
	bls _08082676
	cmp r2, #1
	bne _08082670
	movs r2, #2
	b _08082676
	.align 2, 0
_08082660: .4byte gCurrentProjectile
_08082664: .4byte sWaveBeamPartVelocity_Unused
_08082668: .4byte 0x3FF66666
_0808266C: .4byte 0x66666666
_08082670:
	cmp r2, #2
	bne _08082676
	movs r2, #1
_08082676:
	ldrb r0, [r5, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _0808270E
	lsls r0, r0, #2
	ldr r1, _08082688 @ =_0808268C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082688: .4byte _0808268C
_0808268C: @ jump table
	.4byte _0808270E @ case 0
	.4byte _080826C0 @ case 1
	.4byte _080826A0 @ case 2
	.4byte _080826FA @ case 3
	.4byte _080826FA @ case 4
_080826A0:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080826B0
	cmp r2, #1
	beq _080826DE
	b _080826EC
_080826B0:
	cmp r2, #1
	bne _080826BA
	ldrh r0, [r5, #8]
	subs r0, r0, r6
	b _080826F0
_080826BA:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
	b _080826E2
_080826C0:
	ldrb r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080826DA
	cmp r2, #1
	bne _080826D4
	ldrh r0, [r5, #8]
	subs r0, r0, r6
	b _080826F0
_080826D4:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
	b _080826E2
_080826DA:
	cmp r2, #1
	bne _080826EC
_080826DE:
	ldrh r0, [r5, #8]
	subs r0, r0, r6
_080826E2:
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	adds r0, r6, r0
	strh r0, [r5, #0xa]
	b _0808271E
_080826EC:
	ldrh r0, [r5, #8]
	adds r0, r6, r0
_080826F0:
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	subs r0, r0, r6
	strh r0, [r5, #0xa]
	b _0808271E
_080826FA:
	cmp r2, #1
	bne _08082706
	ldrh r0, [r5, #0xa]
	subs r0, r0, r3
	strh r0, [r5, #0xa]
	b _0808271E
_08082706:
	ldrh r0, [r5, #0xa]
	adds r0, r3, r0
	strh r0, [r5, #0xa]
	b _0808271E
_0808270E:
	cmp r2, #1
	bne _08082718
	ldrh r0, [r5, #8]
	subs r0, r0, r3
	b _0808271C
_08082718:
	ldrh r0, [r5, #8]
	adds r0, r3, r0
_0808271C:
	strh r0, [r5, #8]
_0808271E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start ProjectileSetMissileTrail
ProjectileSetMissileTrail: @ 0x08082724
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r4, _0808274C @ =gCurrentProjectile
	ldrb r0, [r4, #0x13]
	ands r0, r1
	cmp r0, #0
	bne _080827CC
	movs r5, #0x20
	ldrh r2, [r4, #8]
	ldrh r3, [r4, #0xa]
	ldrb r0, [r4, #0x10]
	cmp r0, #3
	beq _08082788
	cmp r0, #3
	bgt _08082750
	cmp r0, #2
	beq _0808276A
	b _080827A6
	.align 2, 0
_0808274C: .4byte gCurrentProjectile
_08082750:
	cmp r0, #4
	beq _0808275A
	cmp r0, #5
	beq _08082760
	b _080827A6
_0808275A:
	adds r0, r2, #0
	adds r0, #0x20
	b _08082764
_08082760:
	adds r0, r2, #0
	subs r0, #0x20
_08082764:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _080827C2
_0808276A:
	movs r0, #0x40
	adds r1, r2, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _08082782
	adds r0, r3, #0
	subs r0, #0x18
	b _080827BE
_08082782:
	adds r0, r3, #0
	adds r0, #0x18
	b _080827BE
_08082788:
	movs r0, #0x40
	adds r1, r2, #0
	subs r1, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _080827A0
	adds r0, r3, #0
	subs r0, #0x18
	b _080827BE
_080827A0:
	adds r0, r3, #0
	adds r0, #0x18
	b _080827BE
_080827A6:
	ldr r0, _080827B8 @ =gCurrentProjectile
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080827BC
	subs r0, r3, r5
	b _080827BE
	.align 2, 0
_080827B8: .4byte gCurrentProjectile
_080827BC:
	adds r0, r3, r5
_080827BE:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080827C2:
	adds r0, r2, #0
	adds r1, r3, #0
	adds r2, r6, #0
	bl ParticleSet
_080827CC:
	ldr r1, _080827DC @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	adds r0, #1
	strb r0, [r1, #0x13]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080827DC: .4byte gCurrentProjectile

	thumb_func_start ProjectileSetBeamTrail
ProjectileSetBeamTrail: @ 0x080827E0
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r2, _08082808 @ =gCurrentProjectile
	ldrb r0, [r2, #0x1e]
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _08082880
	movs r5, #0x20
	ldrh r2, [r4, #8]
	ldrh r3, [r4, #0xa]
	ldrb r0, [r4, #0x10]
	cmp r0, #3
	beq _08082844
	cmp r0, #3
	bgt _0808280C
	cmp r0, #2
	beq _08082826
	b _08082862
	.align 2, 0
_08082808: .4byte gCurrentProjectile
_0808280C:
	cmp r0, #4
	beq _08082816
	cmp r0, #5
	beq _0808281C
	b _08082862
_08082816:
	adds r0, r2, #0
	adds r0, #0x20
	b _08082820
_0808281C:
	adds r0, r2, #0
	subs r0, #0x20
_08082820:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	b _08082876
_08082826:
	movs r0, #0x40
	adds r1, r2, #0
	adds r1, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0808283E
	adds r0, r3, #0
	subs r0, #0x18
	b _08082872
_0808283E:
	adds r0, r3, #0
	adds r0, #0x18
	b _08082872
_08082844:
	movs r0, #0x40
	adds r1, r2, #0
	subs r1, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldrb r1, [r4]
	ands r0, r1
	cmp r0, #0
	beq _0808285C
	adds r0, r3, #0
	subs r0, #0x18
	b _08082872
_0808285C:
	adds r0, r3, #0
	adds r0, #0x18
	b _08082872
_08082862:
	ldrb r1, [r4]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08082870
	subs r0, r3, r5
	b _08082872
_08082870:
	adds r0, r3, r5
_08082872:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08082876:
	adds r0, r2, #0
	adds r1, r3, #0
	adds r2, r6, #0
	bl ParticleSet
_08082880:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileCheckHittingSprite
ProjectileCheckHittingSprite: @ 0x08082888
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	ldr r2, _0808296C @ =gCurrentPowerBomb
	ldrb r0, [r2]
	cmp r0, #0
	bne _0808289E
	b _080829F6
_0808289E:
	ldr r0, _08082970 @ =gEquipment
	ldrb r1, [r0, #0xb]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _080828AC
	b _080829F6
_080828AC:
	ldrh r0, [r2, #6]
	str r0, [sp, #0x20]
	ldrh r1, [r2, #4]
	ldrh r0, [r2, #0xc]
	ldr r3, [sp, #0x20]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	ldrh r0, [r2, #0xe]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldrh r0, [r2, #8]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	ldrh r0, [r2, #0xa]
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r4, _08082974 @ =0x0000A001
	str r4, [sp, #0x1c]
	ldr r4, _08082978 @ =0x00002001
	movs r0, #0
	mov r8, r0
_080828E6:
	ldr r1, _0808297C @ =gSpriteData
	mov r2, r8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _08082980
	ldrh r0, [r3]
	ldr r1, [sp, #0x1c]
	ands r0, r1
	cmp r0, #1
	bne _080829E6
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _080829E6
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080829E6
	ldrh r5, [r3, #2]
	ldrh r6, [r3, #4]
	ldrh r0, [r3, #0xa]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldrh r0, [r3, #0xc]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r3, #0xe]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r3, #0x10]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, [sp, #0x28]
	str r2, [sp]
	ldr r3, [sp, #0x2c]
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r1, [sp, #0x34]
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x38]
	mov r1, sb
	mov r2, sl
	adds r3, r7, #0
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _080829E6
	mov r0, r8
	bl ProjectilePowerBombHitSprite
	b _080829E6
	.align 2, 0
_0808296C: .4byte gCurrentPowerBomb
_08082970: .4byte gEquipment
_08082974: .4byte 0x0000A001
_08082978: .4byte 0x00002001
_0808297C: .4byte gSpriteData
_08082980:
	ldrh r0, [r3]
	ands r0, r4
	cmp r0, #1
	bne _080829E6
	ldrh r0, [r3, #0x14]
	cmp r0, #0
	beq _080829E6
	ldrh r5, [r3, #2]
	ldrh r6, [r3, #4]
	ldrh r0, [r3, #0xa]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldrh r0, [r3, #0xc]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r3, #0xe]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r3, #0x10]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r2, [sp, #0x28]
	str r2, [sp]
	ldr r3, [sp, #0x2c]
	str r3, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	ldr r1, [sp, #0x34]
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x38]
	mov r1, sb
	mov r2, sl
	adds r3, r7, #0
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _080829E0
	mov r0, r8
	bl ProjectileSetIsftForPowerBomb
	b _080829E6
_080829E0:
	mov r0, r8
	bl ProjectileBringSpriteToPowerBombCenter
_080829E6:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bhi _080829F6
	b _080828E6
_080829F6:
	movs r2, #0
	str r2, [sp, #0x18]
	bl SpriteUtilCheckSamusDamagingPose
	cmp r0, #0
	beq _08082A08
	movs r3, #1
	str r3, [sp, #0x18]
	b _08082A1E
_08082A08:
	movs r0, #0x80
	bl SpriteUtilCheckSamusSudoScrew
	cmp r0, #0
	beq _08082A16
	movs r4, #2
	str r4, [sp, #0x18]
_08082A16:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _08082A1E
	b _08082B3C
_08082A1E:
	ldr r1, _08082AF4 @ =gSamusData
	ldrh r2, [r1, #0x18]
	ldrh r3, [r1, #0x16]
	ldrh r0, [r1, #0x26]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	ldrh r0, [r1, #0x2a]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldrh r0, [r1, #0x24]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	ldrh r0, [r1, #0x28]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x34]
	ldr r4, _08082AF8 @ =0x0000A001
	str r4, [sp, #0x1c]
	movs r0, #0
	mov r8, r0
_08082A54:
	ldr r0, _08082AFC @ =gSpriteData
	mov r2, r8
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r4, r1, r0
	ldrh r0, [r4]
	ldr r3, [sp, #0x1c]
	ands r0, r3
	cmp r0, #1
	bne _08082B2E
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _08082B2E
	ldrh r5, [r4, #2]
	ldrh r6, [r4, #4]
	ldrh r0, [r4, #0xa]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldrh r0, [r4, #0xc]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r4, #0xe]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r4, #0x10]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [sp, #0x28]
	str r0, [sp]
	ldr r1, [sp, #0x2c]
	str r1, [sp, #4]
	ldr r2, [sp, #0x30]
	str r2, [sp, #8]
	ldr r3, [sp, #0x34]
	str r3, [sp, #0xc]
	ldr r0, [sp, #0x38]
	mov r1, sb
	mov r2, sl
	adds r3, r7, #0
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _08082B2E
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _08082B2E
	ldr r4, [sp, #0x18]
	cmp r4, #1
	bne _08082B00
	mov r0, sb
	ldr r2, [sp, #0x38]
	subs r1, r0, r2
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sl
	subs r2, r7, r3
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	add r2, sl
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r0, r8
	bl ProjectileContactDamageHitSprite
	b _08082B2E
	.align 2, 0
_08082AF4: .4byte gSamusData
_08082AF8: .4byte 0x0000A001
_08082AFC: .4byte gSpriteData
_08082B00:
	ldr r4, [sp, #0x18]
	cmp r4, #2
	bne _08082B2E
	mov r0, sb
	ldr r2, [sp, #0x38]
	subs r1, r0, r2
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r1, r1, #1
	adds r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sl
	subs r2, r7, r3
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	add r2, sl
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r0, r8
	bl ProjectileSudoScrewHitSprite
_08082B2E:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bls _08082A54
_08082B3C:
	ldr r4, _08082B70 @ =0x0000A001
	str r4, [sp, #0x1c]
	movs r0, #0
	mov r8, r0
	ldr r3, _08082B74 @ =gSpriteData
	ldr r2, _08082B78 @ =gSpriteDrawOrder
_08082B48:
	mov r1, r8
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r1, r0, r3
	ldrh r0, [r1]
	ldr r4, [sp, #0x1c]
	ands r0, r4
	cmp r0, #1
	bne _08082B7C
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	beq _08082B7C
	mov r4, r8
	adds r0, r4, r2
	adds r1, #0x22
	ldrb r1, [r1]
	strb r1, [r0]
	b _08082B84
	.align 2, 0
_08082B70: .4byte 0x0000A001
_08082B74: .4byte gSpriteData
_08082B78: .4byte gSpriteDrawOrder
_08082B7C:
	mov r0, r8
	adds r1, r0, r2
	movs r0, #0
	strb r0, [r1]
_08082B84:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bls _08082B48
	movs r1, #1
	str r1, [sp, #0x14]
_08082B96:
	movs r2, #0
	mov r8, r2
	ldr r3, [sp, #0x14]
	adds r3, #1
	str r3, [sp, #0x40]
_08082BA0:
	ldr r0, _08082C6C @ =gSpriteDrawOrder
	add r0, r8
	ldrb r0, [r0]
	mov r4, r8
	adds r4, #1
	str r4, [sp, #0x3c]
	ldr r1, [sp, #0x14]
	cmp r0, r1
	beq _08082BB4
	b _08082FC0
_08082BB4:
	ldr r0, _08082C70 @ =gSpriteData
	mov r3, r8
	lsls r2, r3, #3
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r4, [r1, #2]
	str r4, [sp, #0x20]
	ldrh r0, [r1, #4]
	str r0, [sp, #0x24]
	ldrh r0, [r1, #0xa]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x28]
	ldrh r0, [r1, #0xc]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x2c]
	ldrh r0, [r1, #0xe]
	ldr r3, [sp, #0x24]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x30]
	ldrh r0, [r1, #0x10]
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x34]
	movs r4, #0x11
	str r4, [sp, #0x1c]
	movs r0, #0
	str r0, [sp, #0x10]
	str r2, [sp, #0x44]
_08082BFC:
	ldr r1, _08082C74 @ =gProjectileData
	ldr r2, [sp, #0x10]
	lsls r0, r2, #5
	adds r4, r0, r1
	ldrb r0, [r4]
	ldr r3, [sp, #0x1c]
	ands r0, r3
	cmp r0, r3
	beq _08082C10
	b _08082FB0
_08082C10:
	ldrh r5, [r4, #8]
	ldrh r6, [r4, #0xa]
	ldrh r0, [r4, #0x16]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	ldrh r0, [r4, #0x18]
	adds r0, r5, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldrh r0, [r4, #0x1a]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldrh r0, [r4, #0x1c]
	adds r0, r6, r0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r0, [sp, #0x38]
	str r0, [sp]
	mov r1, sb
	str r1, [sp, #4]
	mov r2, sl
	str r2, [sp, #8]
	str r7, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	bne _08082C5A
	b _08082FB0
_08082C5A:
	ldrb r0, [r4, #0xf]
	cmp r0, #0x12
	bls _08082C62
	b _08082FB0
_08082C62:
	lsls r0, r0, #2
	ldr r1, _08082C78 @ =_08082C7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08082C6C: .4byte gSpriteDrawOrder
_08082C70: .4byte gSpriteData
_08082C74: .4byte gProjectileData
_08082C78: .4byte _08082C7C
_08082C7C: @ jump table
	.4byte _08082CC8 @ case 0
	.4byte _08082CF0 @ case 1
	.4byte _08082D18 @ case 2
	.4byte _08082D40 @ case 3
	.4byte _08082D68 @ case 4
	.4byte _08082D90 @ case 5
	.4byte _08082DB8 @ case 6
	.4byte _08082DEE @ case 7
	.4byte _08082E14 @ case 8
	.4byte _08082E3C @ case 9
	.4byte _08082EA8 @ case 10
	.4byte _08082ED0 @ case 11
	.4byte _08082EF8 @ case 12
	.4byte _08082F20 @ case 13
	.4byte _08082F20 @ case 14
	.4byte _08082E72 @ case 15
	.4byte _08082F7E @ case 16
	.4byte _08082FB0 @ case 17
	.4byte _08082F48 @ case 18
_08082CC8:
	ldr r0, _08082CEC @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bls _08082CDE
	b _08082E64
_08082CDE:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileNormalBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082CEC: .4byte gSpriteData
_08082CF0:
	ldr r0, _08082D14 @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082DE0
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargeBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082D14: .4byte gSpriteData
_08082D18:
	ldr r0, _08082D3C @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bls _08082D2E
	b _08082E64
_08082D2E:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileWideBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082D3C: .4byte gSpriteData
_08082D40:
	ldr r0, _08082D64 @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bls _08082D56
	b _08082E64
_08082D56:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectilePlasmaBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082D64: .4byte gSpriteData
_08082D68:
	ldr r0, _08082D8C @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileWaveBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082D8C: .4byte gSpriteData
_08082D90:
	ldr r0, _08082DB4 @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedNormalBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082DB4: .4byte gSpriteData
_08082DB8:
	ldr r0, _08082DDC @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082DE0
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedChargeBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082DDC: .4byte gSpriteData
_08082DE0:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl unk_84cc8
	b _08082FB0
_08082DEE:
	ldr r0, _08082E10 @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedWideBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082E10: .4byte gSpriteData
_08082E14:
	ldr r0, _08082E38 @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedPlasmaBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082E38: .4byte gSpriteData
_08082E3C:
	ldr r0, _08082E60 @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082E64
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileChargedWaveBeamHitSprite
	b _08082FB0
	.align 2, 0
_08082E60: .4byte gSpriteData
_08082E64:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl unk_84cac
	b _08082FB0
_08082E72:
	ldr r1, _08082E9C @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r0, r2, r3
	lsls r0, r0, #3
	adds r1, r0, r1
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x5a
	bhi _08082EA0
	ldr r4, [sp, #0x24]
	str r4, [sp]
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	ldr r3, [sp, #0x20]
	bl ProjectileFlareHitSprite
	b _08082FB0
	.align 2, 0
_08082E9C: .4byte gSpriteData
_08082EA0:
	adds r1, #0x2c
	movs r0, #0x78
	strb r0, [r1]
	b _08082FB0
_08082EA8:
	ldr r0, _08082ECC @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileNormalMissileHitSprite
	b _08082FB0
	.align 2, 0
_08082ECC: .4byte gSpriteData
_08082ED0:
	ldr r0, _08082EF4 @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileSuperMissileHitSprite
	b _08082FB0
	.align 2, 0
_08082EF4: .4byte gSpriteData
_08082EF8:
	ldr r0, _08082F1C @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileIceMissileHitSprite
	b _08082FB0
	.align 2, 0
_08082F1C: .4byte gSpriteData
_08082F20:
	ldr r0, _08082F44 @ =gSpriteData
	ldr r2, [sp, #0x44]
	mov r3, r8
	subs r1, r2, r3
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileDiffusionMissileHitSprite
	b _08082FB0
	.align 2, 0
_08082F44: .4byte gSpriteData
_08082F48:
	ldr r0, _08082F6C @ =gSpriteData
	ldr r4, [sp, #0x44]
	mov r2, r8
	subs r1, r4, r2
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082F70
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileDiffusionFlakeHitSprite
	b _08082FB0
	.align 2, 0
_08082F6C: .4byte gSpriteData
_08082F70:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl unk_84ce4
	b _08082FB0
_08082F7E:
	ldr r0, _08082FA0 @ =gSpriteData
	ldr r3, [sp, #0x44]
	mov r4, r8
	subs r1, r3, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x24
	ldrb r0, [r1]
	cmp r0, #0x5a
	bhi _08082FA4
	mov r0, r8
	adds r1, r5, #0
	adds r2, r6, #0
	bl ProjectileBombHitSprite
	b _08082FB0
	.align 2, 0
_08082FA0: .4byte gSpriteData
_08082FA4:
	mov r0, r8
	ldr r1, [sp, #0x10]
	adds r2, r5, #0
	adds r3, r6, #0
	bl unk_84cac
_08082FB0:
	ldr r0, [sp, #0x10]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #0xf
	bhi _08082FC0
	b _08082BFC
_08082FC0:
	ldr r1, [sp, #0x3c]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x17
	bhi _08082FCE
	b _08082BA0
_08082FCE:
	ldr r2, [sp, #0x40]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #0x10
	bhi _08082FDC
	b _08082B96
_08082FDC:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileCheckSpriteCreateDebris
ProjectileCheckSpriteCreateDebris: @ 0x08082FEC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08083018 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r3, r1, r2
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08083020
	ldr r1, _0808301C @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	b _0808302E
	.align 2, 0
_08083018: .4byte gSpriteData
_0808301C: .4byte sSecondarySpriteStats
_08083020:
	ldr r2, _08083040 @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, #4
	adds r0, r0, r2
_0808302E:
	ldrh r1, [r0]
	movs r0, #0x10
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08083040: .4byte sPrimarySpriteStats

	thumb_func_start ProjectileGetSpriteWeakness
ProjectileGetSpriteWeakness: @ 0x08083044
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08083070 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r3, r1, r2
	adds r0, r3, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08083078
	ldr r1, _08083074 @ =sSecondarySpriteStats
	ldrb r0, [r3, #0x1d]
	lsls r0, r0, #3
	adds r1, #6
	adds r0, r0, r1
	b _08083086
	.align 2, 0
_08083070: .4byte gSpriteData
_08083074: .4byte sSecondarySpriteStats
_08083078:
	ldr r2, _0808308C @ =sPrimarySpriteStats
	ldrb r1, [r3, #0x1d]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r2, #6
	adds r0, r0, r2
_08083086:
	ldrh r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_0808308C: .4byte sPrimarySpriteStats

	thumb_func_start ProjectileRandomSpriteDebris
ProjectileRandomSpriteDebris: @ 0x08083090
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	cmp r1, #9
	beq _080830EE
	cmp r1, #9
	bgt _080830B2
	cmp r1, #5
	beq _080830B8
	b _080831B4
_080830B2:
	cmp r0, #0x11
	beq _08083140
	b _080831B4
_080830B8:
	ldr r0, _080830D8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080830DC
	adds r2, r5, #0
	subs r2, #8
	adds r3, r6, #0
	adds r3, #8
	adds r0, r7, #0
	movs r1, #2
	bl SpriteDebrisInit
	b _080831B4
	.align 2, 0
_080830D8: .4byte gFrameCounter8Bit
_080830DC:
	adds r2, r5, #0
	adds r2, #8
	adds r3, r6, #0
	subs r3, #8
	adds r0, r7, #0
	movs r1, #1
	bl SpriteDebrisInit
	b _080831B4
_080830EE:
	ldr r0, _0808311C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083120
	adds r2, r5, #0
	subs r2, #8
	adds r3, r6, #0
	adds r3, #8
	adds r0, r7, #0
	movs r1, #2
	bl SpriteDebrisInit
	adds r2, r5, #0
	adds r2, #8
	adds r3, r6, #0
	subs r3, #8
	adds r0, r7, #0
	movs r1, #4
	bl SpriteDebrisInit
	b _080831B4
	.align 2, 0
_0808311C: .4byte gFrameCounter8Bit
_08083120:
	adds r2, r5, #0
	subs r2, #8
	adds r3, r6, #0
	subs r3, #8
	adds r0, r7, #0
	movs r1, #1
	bl SpriteDebrisInit
	adds r3, r6, #0
	adds r3, #8
	adds r0, r7, #0
	movs r1, #3
	adds r2, r5, #0
	bl SpriteDebrisInit
	b _080831B4
_08083140:
	ldr r0, _08083180 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083184
	adds r2, r5, #0
	subs r2, #8
	adds r4, r6, #0
	subs r4, #8
	adds r0, r7, #0
	movs r1, #1
	adds r3, r4, #0
	bl SpriteDebrisInit
	adds r2, r5, #0
	subs r2, #0x10
	adds r3, r6, #0
	adds r3, #8
	adds r0, r7, #0
	movs r1, #3
	bl SpriteDebrisInit
	adds r2, r5, #0
	adds r2, #8
	adds r0, r7, #0
	movs r1, #4
	adds r3, r4, #0
	bl SpriteDebrisInit
	b _080831B4
	.align 2, 0
_08083180: .4byte gFrameCounter8Bit
_08083184:
	adds r2, r5, #0
	subs r2, #0x10
	adds r4, r6, #0
	adds r4, #8
	adds r0, r7, #0
	movs r1, #2
	adds r3, r4, #0
	bl SpriteDebrisInit
	adds r2, r5, #0
	adds r2, #8
	adds r0, r7, #0
	movs r1, #3
	adds r3, r4, #0
	bl SpriteDebrisInit
	adds r2, r5, #0
	adds r2, #0x10
	adds r3, r6, #0
	subs r3, #8
	adds r0, r7, #0
	movs r1, #4
	bl SpriteDebrisInit
_080831B4:
	ldr r0, _080831C0 @ =0x000001BF
	bl SoundPlay
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080831C0: .4byte 0x000001BF

	thumb_func_start ProjectileRandomSpriteDebrisPiercing
ProjectileRandomSpriteDebrisPiercing: @ 0x080831C4
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r1, #0
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	cmp r1, #9
	beq _08083216
	cmp r1, #9
	bgt _080831E6
	cmp r1, #5
	beq _080831EC
	b _080832AC
_080831E6:
	cmp r0, #0x11
	beq _08083268
	b _080832AC
_080831EC:
	ldr r0, _0808320C @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083210
	adds r2, r4, #0
	subs r2, #8
	adds r3, r5, #0
	adds r3, #8
	adds r0, r6, #0
	movs r1, #2
	bl SpriteDebrisInit
	b _080832AC
	.align 2, 0
_0808320C: .4byte gFrameCounter8Bit
_08083210:
	adds r2, r4, #0
	adds r2, #8
	b _08083278
_08083216:
	ldr r0, _08083244 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08083248
	adds r2, r4, #0
	subs r2, #8
	adds r3, r5, #0
	adds r3, #8
	adds r0, r6, #0
	movs r1, #2
	bl SpriteDebrisInit
	adds r2, r4, #0
	adds r2, #8
	adds r3, r5, #0
	subs r3, #8
	adds r0, r6, #0
	movs r1, #4
	bl SpriteDebrisInit
	b _080832AC
	.align 2, 0
_08083244: .4byte gFrameCounter8Bit
_08083248:
	adds r2, r4, #0
	subs r2, #8
	adds r3, r5, #0
	subs r3, #8
	adds r0, r6, #0
	movs r1, #1
	bl SpriteDebrisInit
	adds r3, r5, #0
	adds r3, #8
	adds r0, r6, #0
	movs r1, #3
	adds r2, r4, #0
	bl SpriteDebrisInit
	b _080832AC
_08083268:
	ldr r0, _08083288 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808328C
	adds r2, r4, #0
	subs r2, #8
_08083278:
	adds r3, r5, #0
	subs r3, #8
	adds r0, r6, #0
	movs r1, #1
	bl SpriteDebrisInit
	b _080832AC
	.align 2, 0
_08083288: .4byte gFrameCounter8Bit
_0808328C:
	adds r2, r4, #0
	subs r2, #0x10
	adds r3, r5, #0
	adds r3, #8
	adds r0, r6, #0
	movs r1, #2
	bl SpriteDebrisInit
	adds r2, r4, #0
	adds r2, #0x10
	adds r3, r5, #0
	subs r3, #8
	adds r0, r6, #0
	movs r1, #4
	bl SpriteDebrisInit
_080832AC:
	ldr r0, _080832B8 @ =0x000001BF
	bl SoundPlay
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080832B8: .4byte 0x000001BF

	thumb_func_start ProjectileSetIsftForPowerBomb
ProjectileSetIsftForPowerBomb: @ 0x080832BC
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _080832E8 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r0, r1, #0
	adds r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0
	bne _080832E2
	adds r2, r1, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
_080832E2:
	pop {r0}
	bx r0
	.align 2, 0
_080832E8: .4byte gSpriteData

	thumb_func_start ProjectileBringSpriteToPowerBombCenter
ProjectileBringSpriteToPowerBombCenter: @ 0x080832EC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r5, _08083334 @ =gCurrentPowerBomb
	ldrb r0, [r5]
	cmp r0, #4
	bne _08083368
	ldr r1, _08083338 @ =gSpriteData
	lsls r2, r4, #3
	subs r0, r2, r4
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x26
	ldrb r0, [r0]
	mov ip, r1
	adds r6, r2, #0
	cmp r0, #0
	bne _08083368
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08083368
	ldrh r1, [r3, #2]
	ldrh r3, [r3, #4]
	ldrh r0, [r5, #6]
	ldrh r2, [r5, #4]
	movs r5, #0x18
	cmp r1, r0
	bls _0808333C
	adds r0, r1, #0
	subs r0, #0x14
	b _08083344
	.align 2, 0
_08083334: .4byte gCurrentPowerBomb
_08083338: .4byte gSpriteData
_0808333C:
	cmp r1, r0
	bhs _08083348
	ldr r7, _08083350 @ =0x00010014
	adds r0, r1, r7
_08083344:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_08083348:
	cmp r3, r2
	bls _08083354
	subs r0, r3, r5
	b _0808335A
	.align 2, 0
_08083350: .4byte 0x00010014
_08083354:
	cmp r3, r2
	bhs _0808335E
	adds r0, r3, r5
_0808335A:
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0808335E:
	subs r0, r6, r4
	lsls r0, r0, #3
	add r0, ip
	strh r1, [r0, #2]
	strh r3, [r0, #4]
_08083368:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectilePowerBombHitSprite
ProjectilePowerBombHitSprite: @ 0x08083370
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080833B0 @ =gSpriteData
	mov sb, r0
	lsls r7, r5, #3
	subs r0, r7, r5
	lsls r0, r0, #3
	mov r1, sb
	adds r4, r0, r1
	adds r6, r4, #0
	adds r6, #0x34
	ldrb r1, [r6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08083468
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0
	beq _080833B4
	adds r0, r5, #0
	bl ProjectileSetIsftForSolid
	b _08083468
	.align 2, 0
_080833B0: .4byte gSpriteData
_080833B4:
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083440
	ldrh r0, [r4, #0x14]
	cmp r0, #0x32
	bls _080833D2
	subs r0, #0x32
	strh r0, [r4, #0x14]
	mov r4, sb
	adds r2, r7, #0
	b _0808343C
_080833D2:
	movs r2, #0
	mov r0, r8
	strh r0, [r4, #0x14]
	ldrb r1, [r6]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r6]
	adds r0, r4, #0
	adds r0, #0x32
	strb r2, [r0]
	subs r0, #0x12
	strb r2, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083402
	ldr r0, _0808342C @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08083402
	movs r0, #2
	strb r0, [r1]
_08083402:
	ldr r1, _08083430 @ =gSpriteData
	lsls r2, r5, #3
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0x2f
	bhi _08083434
	adds r1, r3, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _0808343A
	.align 2, 0
_0808342C: .4byte gSamusData
_08083430: .4byte gSpriteData
_08083434:
	adds r1, r3, #0
	adds r1, #0x26
	movs r0, #0x28
_0808343A:
	strb r0, [r1]
_0808343C:
	movs r3, #0x11
	b _08083446
_08083440:
	movs r3, #2
	mov r4, sb
	adds r2, r7, #0
_08083446:
	subs r0, r2, r5
	lsls r0, r0, #3
	adds r0, r0, r4
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	cmp r0, r3
	bhs _08083462
	movs r0, #0x80
	orrs r3, r0
	strb r3, [r1]
	b _08083468
_08083462:
	movs r0, #0x80
	orrs r0, r2
	strb r0, [r1]
_08083468:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileContactDamageHitSprite
ProjectileContactDamageHitSprite: @ 0x08083474
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	ldr r1, _08083534 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080834A6
	b _080835E6
_080834A6:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080834BA
	ldrb r0, [r2, #0x1d]
	cmp r0, #0xc0
	beq _080834BA
	cmp r0, #0xa2
	beq _080834BA
	b _080835E6
_080834BA:
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x20
	mov sb, r1
	ands r1, r0
	cmp r1, #0
	beq _08083584
	ldr r1, _08083534 @ =gSpriteData
	lsls r4, r5, #3
	subs r0, r4, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	mov ip, r0
	movs r3, #0
	movs r0, #0
	mov r2, ip
	strh r0, [r2, #0x14]
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	adds r6, r4, #0
	cmp r0, #0
	beq _0808350C
	ldr r0, _08083538 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808350C
	movs r0, #2
	strb r0, [r1]
_0808350C:
	ldr r1, _08083534 @ =gSpriteData
	subs r0, r6, r5
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _0808353C
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _08083542
	.align 2, 0
_08083534: .4byte gSpriteData
_08083538: .4byte gSamusData
_0808353C:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_08083542:
	strb r0, [r1]
	adds r0, r5, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080835C8
	ldr r0, _08083564 @ =gSamusData
	ldrb r0, [r0, #1]
	cmp r0, #0x1e
	bne _08083568
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x3d
	bl ParticleSet
	b _080835C8
	.align 2, 0
_08083564: .4byte gSamusData
_08083568:
	cmp r0, #0x24
	bne _08083578
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x3f
	bl ParticleSet
	b _080835C8
_08083578:
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x3e
	bl ParticleSet
	b _080835C8
_08083584:
	ldr r2, _080835AC @ =gSpriteData
	lsls r1, r5, #3
	subs r0, r1, r5
	lsls r0, r0, #3
	adds r4, r0, r2
	ldrb r0, [r4, #0x1d]
	adds r6, r1, #0
	cmp r0, #0xc0
	bne _080835C4
	adds r0, r5, #0
	movs r1, #0xa
	bl ProjecileDealDamage
	ldr r1, _080835B0 @ =gSamusData
	ldrh r0, [r1, #0x16]
	ldrh r4, [r4, #4]
	cmp r0, r4
	bls _080835B4
	mov r0, sb
	b _080835B6
	.align 2, 0
_080835AC: .4byte gSpriteData
_080835B0: .4byte gSamusData
_080835B4:
	movs r0, #0x10
_080835B6:
	strh r0, [r1, #0x12]
	movs r0, #1
	adds r1, r5, #0
	movs r2, #1
	bl SpriteUtilTakeDamageFromSprite
	b _080835E6
_080835C4:
	movs r1, #2
	mov sl, r1
_080835C8:
	ldr r0, _080835F4 @ =gSpriteData
	subs r1, r6, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	cmp r0, sl
	bhs _080835E6
	movs r0, #0x80
	ands r0, r2
	mov r2, sl
	orrs r0, r2
	strb r0, [r1]
_080835E6:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080835F4: .4byte gSpriteData

	thumb_func_start ProjecileDealDamage
ProjecileDealDamage: @ 0x080835F8
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	ldr r1, _0808362C @ =gSpriteData
	lsls r4, r5, #3
	subs r0, r4, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	mov ip, r0
	ldrh r0, [r0, #0x14]
	adds r6, r1, #0
	cmp r0, r2
	bls _08083630
	subs r0, r0, r2
	mov r1, ip
	strh r0, [r1, #0x14]
	movs r3, #5
	cmp r2, #2
	bls _0808369E
	movs r3, #0x11
	cmp r2, #3
	bhi _0808369E
	movs r3, #9
	b _0808369E
	.align 2, 0
_0808362C: .4byte gSpriteData
_08083630:
	movs r3, #0
	movs r0, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083666
	ldr r0, _08083690 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08083666
	movs r0, #2
	strb r0, [r1]
_08083666:
	lsls r1, r5, #3
	subs r0, r1, r5
	lsls r0, r0, #3
	adds r2, r0, r6
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r1, #0
	cmp r0, #0x2f
	bhi _08083694
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _0808369A
	.align 2, 0
_08083690: .4byte gSamusData
_08083694:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_0808369A:
	strb r0, [r1]
	movs r3, #0x11
_0808369E:
	subs r0, r4, r5
	lsls r0, r0, #3
	adds r0, r0, r6
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r2, [r1]
	movs r0, #0x7f
	ands r0, r2
	cmp r0, r3
	bhs _080836BA
	movs r0, #0x80
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
_080836BA:
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start ProjectileSudoScrewHitSprite
ProjectileSudoScrewHitSprite: @ 0x080836C4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r1, _08083718 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r0, [r0]
	movs r4, #0x48
	ands r4, r0
	cmp r4, #0
	bne _0808377C
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0808377C
	ldr r0, _0808371C @ =gSamusData
	strb r4, [r0, #0xc]
	movs r1, #0
	ldr r0, _08083720 @ =gEquipment
	ldrb r2, [r0, #0xa]
	adds r3, r2, #0
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	bne _08083712
	movs r0, #8
	ands r0, r2
	cmp r0, #0
	beq _08083724
_08083712:
	movs r1, #0x30
	b _0808374A
	.align 2, 0
_08083718: .4byte gSpriteData
_0808371C: .4byte gSamusData
_08083720: .4byte gEquipment
_08083724:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _08083730
	movs r1, #0x1e
	b _0808374A
_08083730:
	movs r0, #2
	ands r2, r0
	cmp r2, #0
	beq _0808373C
	movs r1, #0x15
	b _0808374A
_0808373C:
	movs r0, #1
	ands r3, r0
	cmp r3, #0
	beq _08083746
	movs r1, #0xe
_08083746:
	cmp r1, #0
	beq _0808377C
_0808374A:
	adds r0, r5, #0
	bl ProjecileDealDamage
	adds r0, r5, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083766
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0x40
	bl ParticleSet
_08083766:
	ldr r0, _08083784 @ =gSpriteData
	lsls r1, r5, #3
	subs r1, r1, r5
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r0, [r1, #0x14]
	cmp r0, #0
	beq _0808377C
	adds r1, #0x26
	movs r0, #0
	strb r0, [r1]
_0808377C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083784: .4byte gSpriteData

	thumb_func_start ProjectileIceMissileDealDamage
ProjectileIceMissileDealDamage: @ 0x08083788
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r0, #0
	str r0, [sp]
	mov sl, r0
	adds r0, r6, #0
	bl ProjectileGetSpriteWeakness
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, r5, #0
	movs r0, #0xc
	ands r0, r5
	cmp r0, #0
	beq _0808389A
	ldr r0, _080837E0 @ =gSpriteData
	lsls r2, r6, #3
	subs r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r3, [r1, #0x14]
	mov sb, r0
	mov r8, r2
	cmp r3, r7
	bls _080837E4
	subs r0, r3, r7
	strh r0, [r1, #0x14]
	movs r1, #0x11
	str r1, [sp]
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _08083878
	movs r3, #0xf0
	mov sl, r3
	b _08083878
	.align 2, 0
_080837E0: .4byte gSpriteData
_080837E4:
	movs r0, #0x11
	str r0, [sp]
	movs r0, #0x40
	ands r4, r0
	cmp r4, #0
	beq _08083804
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083804
	movs r0, #1
	strh r0, [r1, #0x14]
	movs r1, #0xf0
	mov sl, r1
	b _08083878
_08083804:
	mov r3, r8
	subs r0, r3, r6
	lsls r0, r0, #3
	add r0, sb
	mov ip, r0
	movs r3, #0
	movs r0, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083844
	ldr r0, _0808386C @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08083844
	movs r0, #2
	strb r0, [r1]
_08083844:
	mov r3, r8
	subs r0, r3, r6
	lsls r0, r0, #3
	mov r1, sb
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _08083870
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _08083876
	.align 2, 0
_0808386C: .4byte gSamusData
_08083870:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_08083876:
	strb r0, [r1]
_08083878:
	mov r3, r8
	subs r0, r3, r6
	lsls r0, r0, #3
	add r0, sb
	adds r2, r0, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	ldr r3, [sp]
	cmp r0, r3
	bhs _0808389E
	movs r0, #0x80
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	b _0808389E
_0808389A:
	movs r0, #0xf0
	mov sl, r0
_0808389E:
	mov r1, sl
	cmp r1, #0
	beq _080838D8
	ldr r1, _080838EC @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r1, r2, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x32
	mov r3, sl
	strb r3, [r0]
	adds r0, #3
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_080838D8:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080838EC: .4byte gSpriteData

	thumb_func_start ProjectileDiffusionFlakeDealDamage
ProjectileDiffusionFlakeDealDamage: @ 0x080838F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r0, #0
	mov sl, r0
	mov sb, r0
	adds r0, r6, #0
	bl ProjectileGetSpriteWeakness
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, r5, #0
	movs r0, #0xc
	ands r0, r5
	cmp r0, #0
	beq _080839F8
	ldr r0, _08083944 @ =gSpriteData
	lsls r2, r6, #3
	subs r1, r2, r6
	lsls r1, r1, #3
	adds r1, r1, r0
	ldrh r3, [r1, #0x14]
	mov r8, r0
	adds r7, r2, #0
	cmp r3, #1
	bls _08083948
	subs r0, r3, #1
	strh r0, [r1, #0x14]
	movs r1, #5
	mov sl, r1
	movs r0, #0x40
	ands r0, r5
	cmp r0, #0
	beq _080839D8
	movs r0, #0xf0
	mov sb, r0
	b _080839D8
	.align 2, 0
_08083944: .4byte gSpriteData
_08083948:
	movs r0, #0x11
	mov sl, r0
	movs r0, #0x40
	ands r4, r0
	cmp r4, #0
	beq _08083968
	adds r0, r1, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08083968
	movs r0, #1
	strh r0, [r1, #0x14]
	movs r1, #0xf0
	mov sb, r1
	b _080839D8
_08083968:
	subs r0, r7, r6
	lsls r0, r0, #3
	add r0, r8
	mov ip, r0
	movs r3, #0
	movs r0, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _080839A6
	ldr r0, _080839CC @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _080839A6
	movs r0, #2
	strb r0, [r1]
_080839A6:
	subs r0, r7, r6
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _080839D0
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _080839D6
	.align 2, 0
_080839CC: .4byte gSamusData
_080839D0:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_080839D6:
	strb r0, [r1]
_080839D8:
	subs r0, r7, r6
	lsls r0, r0, #3
	add r0, r8
	adds r2, r0, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, sl
	bhs _080839FC
	movs r0, #0x80
	ands r0, r1
	mov r1, sl
	orrs r0, r1
	strb r0, [r2]
	b _080839FC
_080839F8:
	movs r0, #0xf0
	mov sb, r0
_080839FC:
	mov r1, sb
	cmp r1, #0
	beq _08083A36
	ldr r1, _08083A48 @ =gSpriteData
	lsls r0, r6, #3
	subs r0, r0, r6
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r1, r2, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x32
	mov r1, sb
	strb r1, [r0]
	adds r0, #3
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08083A36:
	mov r0, sl
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08083A48: .4byte gSpriteData

	thumb_func_start ProjectileIceBeamDealDamage
ProjectileIceBeamDealDamage: @ 0x08083A4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	movs r6, #0
	movs r7, #0
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r0, #3
	ands r0, r3
	cmp r0, #0
	beq _08083B2C
	ldr r0, _08083A9C @ =gSpriteData
	lsls r2, r4, #3
	subs r1, r2, r4
	lsls r1, r1, #3
	adds r1, r1, r0
	mov ip, r1
	ldrh r1, [r1, #0x14]
	mov sb, r0
	mov r8, r2
	cmp r1, r5
	bls _08083AA0
	subs r0, r1, r5
	mov r1, ip
	strh r0, [r1, #0x14]
	movs r6, #0x11
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _08083B0C
	movs r7, #0xf0
	b _08083B0C
	.align 2, 0
_08083A9C: .4byte gSpriteData
_08083AA0:
	movs r6, #0x11
	movs r3, #0
	mov r0, ip
	strh r7, [r0, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08083AD6
	ldr r0, _08083B00 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08083AD6
	movs r0, #2
	strb r0, [r1]
_08083AD6:
	mov r1, r8
	subs r0, r1, r4
	lsls r0, r0, #3
	mov r1, sb
	adds r2, r0, r1
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #0x20
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x2f
	bhi _08083B04
	adds r1, r2, #0
	adds r1, #0x24
	movs r0, #0x57
	strb r0, [r1]
	adds r1, #2
	movs r0, #1
	b _08083B0A
	.align 2, 0
_08083B00: .4byte gSamusData
_08083B04:
	adds r1, r2, #0
	adds r1, #0x26
	movs r0, #0x28
_08083B0A:
	strb r0, [r1]
_08083B0C:
	mov r1, r8
	subs r0, r1, r4
	lsls r0, r0, #3
	add r0, sb
	adds r2, r0, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, r6
	bhs _08083B2E
	movs r0, #0x80
	ands r0, r1
	orrs r0, r6
	strb r0, [r2]
	b _08083B2E
_08083B2C:
	movs r7, #0xf0
_08083B2E:
	cmp r7, #0
	beq _08083B64
	ldr r1, _08083B74 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r2, r0, r1
	adds r1, r2, #0
	adds r1, #0x33
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x32
	strb r7, [r0]
	adds r0, #3
	ldrb r0, [r0]
	ldrb r1, [r2, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x20
	strb r1, [r0]
	movs r0, #0xa3
	lsls r0, r0, #1
	bl SoundPlayNotAlreadyPlaying
_08083B64:
	adds r0, r6, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08083B74: .4byte gSpriteData

	thumb_func_start ProjectileSetIsftForSolid
ProjectileSetIsftForSolid: @ 0x08083B78
	push {lr}
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	ldr r3, _08083BA8 @ =gSpriteData
	lsls r1, r2, #3
	subs r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r3, r1, #0
	adds r3, #0x2c
	ldrb r2, [r3]
	movs r1, #0x7f
	ands r1, r2
	cmp r1, #2
	bhs _08083BA2
	movs r1, #0x80
	ands r1, r2
	movs r2, #2
	orrs r1, r2
	strb r1, [r3]
_08083BA2:
	pop {r1}
	bx r1
	.align 2, 0
_08083BA8: .4byte gSpriteData

	thumb_func_start ProjectileNormalBeamHitSprite
ProjectileNormalBeamHitSprite: @ 0x08083BAC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083BEC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083BF0
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083C36
	.align 2, 0
_08083BEC: .4byte gSpriteData
_08083BF0:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083C04
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083C52
_08083C04:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08083C42
	adds r0, r4, #0
	movs r1, #2
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083C36
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083C36:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl ParticleSet
	b _08083C52
_08083C42:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083C52:
	ldr r0, _08083C6C @ =gProjectileData
	mov r2, sl
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083C6C: .4byte gProjectileData

	thumb_func_start ProjectileChargedNormalBeamHitSprite
ProjectileChargedNormalBeamHitSprite: @ 0x08083C70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083CB0 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083CB4
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083CFA
	.align 2, 0
_08083CB0: .4byte gSpriteData
_08083CB4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083CC8
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083D16
_08083CC8:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08083D06
	adds r0, r4, #0
	movs r1, #0xa
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083CFA
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083CFA:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #3
	bl ParticleSet
	b _08083D16
_08083D06:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083D16:
	ldr r0, _08083D30 @ =gProjectileData
	mov r2, sl
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083D30: .4byte gProjectileData

	thumb_func_start ProjectileChargeBeamHitSprite
ProjectileChargeBeamHitSprite: @ 0x08083D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083D74 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083D78
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083DBE
	.align 2, 0
_08083D74: .4byte gSpriteData
_08083D78:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083D8C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083DDA
_08083D8C:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08083DCA
	adds r0, r4, #0
	movs r1, #2
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083DBE
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083DBE:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #4
	bl ParticleSet
	b _08083DDA
_08083DCA:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083DDA:
	ldr r2, _08083E10 @ =gProjectileData
	mov r0, sl
	lsls r3, r0, #5
	adds r4, r3, r2
	ldrb r1, [r4]
	movs r5, #4
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08083DFC
	ldrb r0, [r4, #0x1f]
	lsls r0, r0, #5
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bhi _08083DFC
	strb r5, [r1, #0x12]
_08083DFC:
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083E10: .4byte gProjectileData

	thumb_func_start ProjectileChargedChargeBeamHitSprite
ProjectileChargedChargeBeamHitSprite: @ 0x08083E14
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083E54 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083E58
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083E9E
	.align 2, 0
_08083E54: .4byte gSpriteData
_08083E58:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083E6C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083EBA
_08083E6C:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _08083EAA
	adds r0, r4, #0
	movs r1, #0xa
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083E9E
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083E9E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #4
	bl ParticleSet
	b _08083EBA
_08083EAA:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083EBA:
	ldr r2, _08083EF0 @ =gProjectileData
	mov r0, sl
	lsls r3, r0, #5
	adds r4, r3, r2
	ldrb r1, [r4]
	movs r5, #4
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08083EDC
	ldrb r0, [r4, #0x1f]
	lsls r0, r0, #5
	adds r1, r0, r2
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bhi _08083EDC
	strb r5, [r1, #0x12]
_08083EDC:
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083EF0: .4byte gProjectileData

	thumb_func_start ProjectileWideBeamHitSprite
ProjectileWideBeamHitSprite: @ 0x08083EF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083F34 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083F38
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08083F7E
	.align 2, 0
_08083F34: .4byte gSpriteData
_08083F38:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08083F4C
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _08083F9A
_08083F4C:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08083F8A
	adds r0, r4, #0
	movs r1, #3
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08083F7E
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08083F7E:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl ParticleSet
	b _08083F9A
_08083F8A:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_08083F9A:
	ldr r0, _08083FB4 @ =gProjectileData
	mov r2, sl
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083FB4: .4byte gProjectileData

	thumb_func_start ProjectileChargedWideBeamHitSprite
ProjectileChargedWideBeamHitSprite: @ 0x08083FB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov r8, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	adds r7, r6, #0
	ldr r1, _08083FF8 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08083FFC
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08084042
	.align 2, 0
_08083FF8: .4byte gSpriteData
_08083FFC:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084010
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	b _0808405E
_08084010:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0808404E
	adds r0, r4, #0
	movs r1, #0xf
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084042
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08084042:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #5
	bl ParticleSet
	b _0808405E
_0808404E:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	mov r0, r8
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
_0808405E:
	ldr r0, _08084078 @ =gProjectileData
	mov r2, sl
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084078: .4byte gProjectileData

	thumb_func_start ProjectilePlasmaBeamHitSprite
ProjectilePlasmaBeamHitSprite: @ 0x0808407C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov sb, r8
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	str r6, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	mov sl, r7
	ldr r1, _080840DC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080840E4
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #6
	bl ParticleSet
	ldr r0, _080840E0 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	b _0808414C
	.align 2, 0
_080840DC: .4byte gSpriteData
_080840E0: .4byte gProjectileData
_080840E4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084108
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	ldr r1, _08084104 @ =gProjectileData
	mov r2, sb
	lsls r0, r2, #5
	adds r0, r0, r1
	strb r5, [r0]
	b _0808414C
	.align 2, 0
_08084104: .4byte gProjectileData
_08084108:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0808413C
	adds r0, r4, #0
	movs r1, #3
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808414C
	movs r0, #1
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ProjectileRandomSpriteDebrisPiercing
	b _0808414C
_0808413C:
	ldr r0, [sp]
	bl ProjectileSetIsftForSolid
	ldr r0, [sp, #4]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
_0808414C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileChargedPlasmaBeamHitSprite
ProjectileChargedPlasmaBeamHitSprite: @ 0x0808415C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	mov sb, r8
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	str r6, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	mov sl, r7
	ldr r1, _080841BC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	beq _080841C4
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #6
	bl ParticleSet
	ldr r0, _080841C0 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	b _0808422C
	.align 2, 0
_080841BC: .4byte gSpriteData
_080841C0: .4byte gProjectileData
_080841C4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080841E8
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	ldr r1, _080841E4 @ =gProjectileData
	mov r2, sb
	lsls r0, r2, #5
	adds r0, r0, r1
	strb r5, [r0]
	b _0808422C
	.align 2, 0
_080841E4: .4byte gProjectileData
_080841E8:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0808421C
	adds r0, r4, #0
	movs r1, #9
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808422C
	movs r0, #1
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ProjectileRandomSpriteDebrisPiercing
	b _0808422C
_0808421C:
	ldr r0, [sp]
	bl ProjectileSetIsftForSolid
	ldr r0, [sp, #4]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
_0808422C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileWaveBeamHitSprite
ProjectileWaveBeamHitSprite: @ 0x0808423C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov r0, sb
	str r0, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	str r7, [sp, #8]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	mov sl, r8
	ldr r1, _080842D0 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _080842D8
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	ldr r0, _080842D4 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08084296
	b _0808438E
_08084296:
	adds r7, r5, #0
	adds r7, #0x32
	ldrb r6, [r7]
	cmp r6, #0
	bne _0808438E
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _0808438E
	adds r0, r5, #0
	adds r0, #0x33
	strb r6, [r0]
	movs r0, #0xf0
	strb r0, [r7]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r5, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	b _0808438E
	.align 2, 0
_080842D0: .4byte gSpriteData
_080842D4: .4byte gEquipment
_080842D8:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080842FC
	adds r0, r7, #0
	mov r1, r8
	movs r2, #7
	bl ParticleSet
	ldr r1, _080842F8 @ =gProjectileData
	mov r2, sb
	lsls r0, r2, #5
	adds r0, r0, r1
	strb r6, [r0]
	b _0808438E
	.align 2, 0
_080842F8: .4byte gProjectileData
_080842FC:
	ldr r0, _08084334 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808434A
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x42
	ands r1, r0
	cmp r1, #0
	beq _08084338
	adds r0, r4, #0
	ldr r1, [sp, #4]
	movs r2, #6
	bl ProjectileIceBeamDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808438E
	movs r0, #2
	b _08084372
	.align 2, 0
_08084334: .4byte gEquipment
_08084338:
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r7, #0
	mov r1, r8
	movs r2, #7
	bl ParticleSet
	b _0808438E
_0808434A:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _0808437E
	adds r0, r4, #0
	movs r1, #3
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808438E
	movs r0, #1
_08084372:
	adds r1, r5, #0
	adds r2, r7, #0
	mov r3, r8
	bl ProjectileRandomSpriteDebrisPiercing
	b _0808438E
_0808437E:
	ldr r0, [sp]
	bl ProjectileSetIsftForSolid
	ldr r0, [sp, #8]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
_0808438E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileChargedWaveBeamHitSprite
ProjectileChargedWaveBeamHitSprite: @ 0x080843A0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	str r4, [sp]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	mov sl, sb
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	str r7, [sp, #4]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	mov r0, r8
	str r0, [sp, #8]
	ldr r1, _08084438 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0
	beq _08084440
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	ldr r0, _0808443C @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080843FA
	b _08084522
_080843FA:
	adds r7, r5, #0
	adds r7, #0x32
	ldrb r6, [r7]
	cmp r6, #0
	beq _08084406
	b _08084522
_08084406:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _08084416
	b _08084522
_08084416:
	adds r0, r5, #0
	adds r0, #0x33
	strb r6, [r0]
	movs r0, #0xf0
	strb r0, [r7]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r5, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08084522
	.align 2, 0
_08084438: .4byte gSpriteData
_0808443C: .4byte gEquipment
_08084440:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084464
	adds r0, r7, #0
	mov r1, r8
	movs r2, #7
	bl ParticleSet
	ldr r1, _08084460 @ =gProjectileData
	mov r2, sb
	lsls r0, r2, #5
	adds r0, r0, r1
	strb r6, [r0]
	b _08084522
	.align 2, 0
_08084460: .4byte gProjectileData
_08084464:
	ldr r0, _0808449C @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080844B2
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x43
	ands r1, r0
	cmp r1, #0
	beq _080844A0
	adds r0, r4, #0
	mov r1, sl
	movs r2, #0xc
	bl ProjectileIceBeamDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084522
	movs r0, #2
	b _080844DA
	.align 2, 0
_0808449C: .4byte gEquipment
_080844A0:
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r7, #0
	mov r1, r8
	movs r2, #7
	bl ParticleSet
	b _08084522
_080844B2:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _080844E6
	adds r0, r4, #0
	movs r1, #9
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084522
	movs r0, #1
_080844DA:
	adds r1, r5, #0
	adds r2, r7, #0
	mov r3, r8
	bl ProjectileRandomSpriteDebrisPiercing
	b _08084522
_080844E6:
	ldrb r0, [r5, #0x1d]
	cmp r0, #0xc0
	bne _08084512
	adds r0, r4, #0
	movs r1, #9
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084522
	movs r0, #1
	adds r1, r5, #0
	adds r2, r7, #0
	mov r3, r8
	bl ProjectileRandomSpriteDebris
	b _08084522
_08084512:
	ldr r0, [sp]
	bl ProjectileSetIsftForSolid
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	movs r2, #7
	bl ParticleSet
_08084522:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileFlareHitSprite
ProjectileFlareHitSprite: @ 0x08084534
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x24]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov sb, r5
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r8, r4
	ldr r1, _08084584 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0808464E
	movs r4, #8
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08084588
	adds r0, r5, #0
	bl ProjectileSetIsftForSolid
	b _0808464E
	.align 2, 0
_08084584: .4byte gSpriteData
_08084588:
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	beq _0808463E
	ldr r0, _080845A8 @ =gEquipment
	ldrb r2, [r0, #0xa]
	adds r0, r2, #0
	ands r0, r4
	cmp r0, #0
	beq _080845AC
	movs r1, #0xf
	b _080845C4
	.align 2, 0
_080845A8: .4byte gEquipment
_080845AC:
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	beq _080845B8
	movs r1, #0xc
	b _080845C4
_080845B8:
	movs r0, #2
	ands r2, r0
	movs r1, #6
	cmp r2, #0
	beq _080845C4
	movs r1, #9
_080845C4:
	mov r0, sb
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sl, r0
	ldr r4, [sp]
	adds r5, r6, #0
	cmp r7, r4
	bls _080845E4
	subs r0, r7, r4
	cmp r0, #0x60
	ble _080845F2
	adds r0, r4, #0
	adds r0, #0x40
	b _080845EE
_080845E4:
	subs r0, r4, r7
	cmp r0, #0x60
	ble _080845F2
	adds r0, r4, #0
	subs r0, #0x40
_080845EE:
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
_080845F2:
	cmp r8, r6
	bls _08084604
	mov r1, r8
	subs r0, r1, r6
	cmp r0, #0x30
	ble _08084614
	adds r0, r6, #0
	adds r0, #0x40
	b _08084610
_08084604:
	mov r1, r8
	subs r0, r6, r1
	cmp r0, #0x30
	ble _08084614
	adds r0, r6, #0
	subs r0, #0x40
_08084610:
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08084614:
	mov r0, sb
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808462C
	movs r0, #0
	mov r1, sl
	adds r2, r4, #0
	adds r3, r5, #0
	bl ProjectileRandomSpriteDebris
_0808462C:
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #2
	bl ParticleSet
	movs r0, #0xf7
	bl SoundPlay
	b _0808464E
_0808463E:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	ldr r0, [sp]
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
_0808464E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileStartMissileTumble
ProjectileStartMissileTumble: @ 0x08084660
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	ldr r5, _080846A8 @ =gProjectileData
	lsrs r1, r1, #0x13
	adds r6, r1, r5
	movs r4, #0
	movs r2, #7
	strb r2, [r6, #0x12]
	strb r4, [r6, #0x1e]
	ldrb r3, [r6]
	movs r2, #0xef
	ands r2, r3
	movs r3, #8
	orrs r2, r3
	strb r2, [r6]
	strb r4, [r6, #0xe]
	strh r4, [r6, #0xc]
	adds r5, #4
	adds r1, r1, r5
	ldr r2, _080846AC @ =sOam_58ea20
	str r2, [r1]
	ldr r2, _080846B0 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r0, [r6, #0xa]
	ldrh r1, [r1, #4]
	cmp r0, r1
	bls _080846B4
	ldrb r0, [r6]
	movs r1, #0x40
	orrs r0, r1
	b _080846BA
	.align 2, 0
_080846A8: .4byte gProjectileData
_080846AC: .4byte sOam_58ea20
_080846B0: .4byte gSpriteData
_080846B4:
	ldrb r1, [r6]
	movs r0, #0xbf
	ands r0, r1
_080846BA:
	strb r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileNormalMissileHitSprite
ProjectileNormalMissileHitSprite: @ 0x080846C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	str r5, [sp]
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	mov sl, r6
	ldr r1, _08084708 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r7, #8
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0808470C
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08084754
	.align 2, 0
_08084708: .4byte gSpriteData
_0808470C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084722
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	adds r0, r4, #0
	b _08084772
_08084722:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	adds r1, r7, #0
	ands r1, r0
	cmp r1, #0
	beq _08084760
	adds r0, r4, #0
	movs r1, #0xa
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084754
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08084754:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #8
	bl ParticleSet
	b _0808477A
_08084760:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	ldr r0, [sp]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
	mov r0, sb
_08084772:
	mov r1, r8
	bl ProjectileStartMissileTumble
	b _08084786
_0808477A:
	ldr r0, _08084798 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_08084786:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084798: .4byte gProjectileData

	thumb_func_start ProjectileSuperMissileHitSprite
ProjectileSuperMissileHitSprite: @ 0x0808479C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r7, r4, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	mov sl, r5
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	mov sb, r6
	ldr r1, _080847DC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080847E0
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08084828
	.align 2, 0
_080847DC: .4byte gSpriteData
_080847E0:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080847F6
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #7
	bl ParticleSet
	adds r0, r4, #0
	b _08084846
_080847F6:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0xc
	ands r1, r0
	cmp r1, #0
	beq _08084834
	adds r0, r4, #0
	movs r1, #0x1e
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084828
	movs r0, #1
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
_08084828:
	adds r0, r5, #0
	adds r1, r6, #0
	movs r2, #9
	bl ParticleSet
	b _0808484E
_08084834:
	adds r0, r7, #0
	bl ProjectileSetIsftForSolid
	mov r0, sl
	mov r1, sb
	movs r2, #7
	bl ParticleSet
	adds r0, r7, #0
_08084846:
	mov r1, r8
	bl ProjectileStartMissileTumble
	b _0808485A
_0808484E:
	ldr r0, _08084868 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_0808485A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084868: .4byte gProjectileData

	thumb_func_start ProjectileIceMissileHitSprite
ProjectileIceMissileHitSprite: @ 0x0808486C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov sb, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	str r6, [sp]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	mov sl, r7
	ldr r1, _080848F0 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r5, r0, r1
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080848F4
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xa
	bl ParticleSet
	adds r7, r5, #0
	adds r7, #0x32
	ldrb r6, [r7]
	cmp r6, #0
	bne _08084964
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08084964
	adds r0, r5, #0
	adds r0, #0x33
	strb r6, [r0]
	movs r0, #0xf0
	strb r0, [r7]
	adds r0, r5, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r5, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r5, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08084964
	.align 2, 0
_080848F0: .4byte gSpriteData
_080848F4:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0808490A
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	adds r0, r4, #0
	b _0808495C
_0808490A:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x4c
	ands r1, r0
	cmp r1, #0
	beq _0808494A
	adds r0, r4, #0
	mov r1, r8
	movs r2, #0x28
	bl ProjectileIceMissileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _0808493E
	movs r0, #2
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ProjectileRandomSpriteDebris
_0808493E:
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xa
	bl ParticleSet
	b _08084964
_0808494A:
	mov r0, sb
	bl ProjectileSetIsftForSolid
	ldr r0, [sp]
	mov r1, sl
	movs r2, #7
	bl ParticleSet
	mov r0, sb
_0808495C:
	mov r1, r8
	bl ProjectileStartMissileTumble
	b _08084970
_08084964:
	ldr r0, _08084980 @ =gProjectileData
	mov r2, r8
	lsls r1, r2, #5
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
_08084970:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084980: .4byte gProjectileData

	thumb_func_start ProjectileDiffusionMissileHitSprite
ProjectileDiffusionMissileHitSprite: @ 0x08084984
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	mov r8, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r1, _080849DC @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08084A3C
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	ldr r0, _080849E0 @ =gProjectileData
	mov r2, sb
	lsls r1, r2, #5
	adds r0, r1, r0
	ldrb r0, [r0, #0xf]
	mov sl, r1
	cmp r0, #0xe
	bne _080849E4
	movs r0, #1
	str r0, [sp, #0xc]
	b _080849EE
	.align 2, 0
_080849DC: .4byte gSpriteData
_080849E0: .4byte gProjectileData
_080849E4:
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xb
	bl ParticleSet
_080849EE:
	ldr r1, _08084A38 @ =gSpriteData
	mov r2, r8
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r4, r0, r1
	movs r0, #0x32
	adds r0, r0, r4
	mov sb, r0
	ldrb r5, [r0]
	cmp r5, #0
	bne _08084AC2
	mov r0, r8
	bl ProjectileGetSpriteWeakness
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	beq _08084AC2
	adds r0, r4, #0
	adds r0, #0x33
	strb r5, [r0]
	movs r0, #0xf0
	mov r1, sb
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r2, [r4, #0x1f]
	adds r0, r0, r2
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08084AC2
	.align 2, 0
_08084A38: .4byte gSpriteData
_08084A3C:
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08084A52
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	adds r0, r4, #0
	b _08084ABA
_08084A52:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #0x4c
	ands r1, r0
	cmp r1, #0
	beq _08084AA8
	adds r0, r4, #0
	mov r1, sb
	movs r2, #0x2d
	bl ProjectileIceMissileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084A86
	movs r0, #2
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ProjectileRandomSpriteDebris
_08084A86:
	ldr r0, _08084AA4 @ =gProjectileData
	mov r2, sb
	lsls r1, r2, #5
	adds r0, r1, r0
	ldrb r0, [r0, #0xf]
	mov sl, r1
	cmp r0, #0xe
	beq _08084AC8
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xb
	bl ParticleSet
	b _08084AC2
	.align 2, 0
_08084AA4: .4byte gProjectileData
_08084AA8:
	mov r0, r8
	bl ProjectileSetIsftForSolid
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #7
	bl ParticleSet
	mov r0, r8
_08084ABA:
	mov r1, sb
	bl ProjectileStartMissileTumble
	b _08084B4A
_08084AC2:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _08084B40
_08084AC8:
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0xc
	bl ParticleSet
	ldr r4, _08084B3C @ =gProjectileData
	add r4, sl
	movs r5, #0
	movs r0, #3
	strb r0, [r4, #0x12]
	strb r5, [r4, #0x1e]
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r4, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl ProjectileInitSecondary
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r4, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0x40
	bl ProjectileInitSecondary
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r4, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0x80
	bl ProjectileInitSecondary
	str r5, [sp]
	str r5, [sp, #4]
	ldrb r0, [r4, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0xc0
	bl ProjectileInitSecondary
	b _08084B4A
	.align 2, 0
_08084B3C: .4byte gProjectileData
_08084B40:
	ldr r0, _08084B5C @ =gProjectileData
	add r0, sl
	mov r1, sp
	ldrb r1, [r1, #0xc]
	strb r1, [r0]
_08084B4A:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084B5C: .4byte gProjectileData

	thumb_func_start ProjectileDiffusionFlakeHitSprite
ProjectileDiffusionFlakeHitSprite: @ 0x08084B60
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r6, r5, #0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	ldr r1, _08084BE0 @ =gSpriteData
	lsls r0, r5, #3
	subs r0, r0, r5
	lsls r0, r0, #3
	adds r4, r0, r1
	adds r0, r4, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x40
	mov r8, r0
	ands r0, r1
	cmp r0, #0
	bne _08084C20
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08084BE4
	adds r0, r5, #0
	bl ProjectileSetIsftForSolid
	adds r7, r4, #0
	adds r7, #0x32
	ldrb r6, [r7]
	cmp r6, #0
	bne _08084C20
	adds r0, r5, #0
	bl ProjectileGetSpriteWeakness
	mov r1, r8
	ands r1, r0
	cmp r1, #0
	beq _08084C20
	adds r0, r4, #0
	adds r0, #0x33
	strb r6, [r0]
	movs r0, #0xf0
	strb r0, [r7]
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	ldrb r1, [r4, #0x1f]
	adds r0, r0, r1
	movs r1, #0xf
	subs r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	b _08084C20
	.align 2, 0
_08084BE0: .4byte gSpriteData
_08084BE4:
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	cmp r0, #0
	bne _08084C20
	adds r0, r6, #0
	bl ProjectileGetSpriteWeakness
	mov r1, r8
	ands r1, r0
	cmp r1, #0
	beq _08084C20
	adds r0, r6, #0
	adds r1, r7, #0
	bl ProjectileDiffusionFlakeDealDamage
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r6, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084C20
	movs r0, #2
	adds r1, r4, #0
	mov r2, sl
	mov r3, sb
	bl ProjectileRandomSpriteDebris
_08084C20:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileBombHitSprite
ProjectileBombHitSprite: @ 0x08084C30
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	ldr r1, _08084C68 @ =gSpriteData
	lsls r0, r4, #3
	subs r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r1
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08084CA6
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08084C6C
	adds r0, r4, #0
	bl ProjectileSetIsftForSolid
	b _08084CA6
	.align 2, 0
_08084C68: .4byte gSpriteData
_08084C6C:
	adds r0, r4, #0
	bl ProjectileGetSpriteWeakness
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _08084CA0
	adds r0, r4, #0
	movs r1, #8
	bl ProjecileDealDamage
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	adds r0, r4, #0
	bl ProjectileCheckSpriteCreateDebris
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08084CA6
	movs r0, #1
	adds r1, r5, #0
	adds r2, r7, #0
	adds r3, r6, #0
	bl ProjectileRandomSpriteDebris
	b _08084CA6
_08084CA0:
	adds r0, r5, #0
	bl ProjectileSetIsftForSolid
_08084CA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start unk_84cac
unk_84cac: @ 0x08084CAC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08084CC4 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2c
	movs r0, #0x78
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084CC4: .4byte gSpriteData

	thumb_func_start unk_84cc8
unk_84cc8: @ 0x08084CC8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08084CE0 @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2c
	movs r0, #0x78
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084CE0: .4byte gSpriteData

	thumb_func_start unk_84ce4
unk_84ce4: @ 0x08084CE4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08084CFC @ =gSpriteData
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x2c
	movs r0, #0x78
	strb r0, [r1]
	bx lr
	.align 2, 0
_08084CFC: .4byte gSpriteData

	thumb_func_start ProjectileDealDamageToZazabi
ProjectileDealDamageToZazabi: @ 0x08084D00
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r1, _08084D18 @ =gCurrentSprite
	ldrh r0, [r1, #0x14]
	mov ip, r1
	cmp r0, r2
	bls _08084D1C
	subs r0, r0, r2
	strh r0, [r1, #0x14]
	b _08084D52
	.align 2, 0
_08084D18: .4byte gCurrentSprite
_08084D1C:
	movs r3, #0
	movs r0, #0
	mov r1, ip
	strh r0, [r1, #0x14]
	mov r2, ip
	adds r2, #0x34
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x32
	strb r3, [r0]
	subs r0, #0x12
	strb r3, [r0]
	adds r0, #0x13
	ldrb r0, [r0]
	cmp r0, #0
	beq _08084D52
	ldr r0, _08084D70 @ =gSamusData
	adds r1, r0, #0
	adds r1, #0x20
	ldrb r0, [r1]
	cmp r0, #1
	bne _08084D52
	movs r0, #2
	strb r0, [r1]
_08084D52:
	mov r2, ip
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x10
	bhi _08084D6A
	movs r0, #0x80
	ands r0, r1
	movs r1, #0x11
	orrs r0, r1
	strb r0, [r2]
_08084D6A:
	pop {r0}
	bx r0
	.align 2, 0
_08084D70: .4byte gSamusData

	thumb_func_start ProjectileChargedNormalBeamInit
ProjectileChargedNormalBeamInit: @ 0x08084D74
	push {lr}
	movs r0, #0xc8
	bl SoundPlay
	ldr r3, _08084DB4 @ =gCurrentProjectile
	ldrb r1, [r3]
	movs r2, #0x10
	movs r0, #0
	orrs r2, r1
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r1, _08084DB8 @ =0x0000FFF0
	strh r1, [r3, #0x16]
	strh r0, [r3, #0x18]
	strh r1, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r2, r0
	strb r2, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08084E04
	lsls r0, r0, #2
	ldr r1, _08084DBC @ =_08084DC0
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	mov pc, r0
	.align 2, 0
_08084DB4: .4byte gCurrentProjectile
_08084DB8: .4byte 0x0000FFF0
_08084DBC: .4byte _08084DC0
_08084DC0: @ jump table
	.4byte _08084E04 @ case 0
	.4byte _08084DE0 @ case 1
	.4byte _08084DD4 @ case 2
	.4byte _08084DF8 @ case 3
	.4byte _08084DEC @ case 4
_08084DD4:
	ldr r0, _08084DE4 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r1, r0, #0
_08084DE0:
	ldr r0, _08084DE8 @ =sOam_58d80c
	b _08084E08
	.align 2, 0
_08084DE4: .4byte gCurrentProjectile
_08084DE8: .4byte sOam_58d80c
_08084DEC:
	ldr r0, _08084DFC @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r1, r0, #0
_08084DF8:
	ldr r0, _08084E00 @ =sOam_58d824
	b _08084E08
	.align 2, 0
_08084DFC: .4byte gCurrentProjectile
_08084E00: .4byte sOam_58d824
_08084E04:
	ldr r1, _08084E10 @ =gCurrentProjectile
	ldr r0, _08084E14 @ =sOam_58d7f4
_08084E08:
	str r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08084E10: .4byte gCurrentProjectile
_08084E14: .4byte sOam_58d7f4

	thumb_func_start ProjectileChargedNormalBeamSubroutine
ProjectileChargedNormalBeamSubroutine: @ 0x08084E18
	push {r4, lr}
	ldr r0, _08084E3C @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08084E44
	ldr r1, _08084E40 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #3
	bl ParticleSet
	b _08084E7E
	.align 2, 0
_08084E3C: .4byte gCurrentClipdataAffectingAction
_08084E40: .4byte gCurrentProjectile
_08084E44:
	ldr r4, _08084E60 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08084E64
	cmp r0, #1
	beq _08084E6A
	movs r0, #0x18
	bl ProjectileMove
	movs r0, #0xf
	movs r1, #3
	bl ProjectileSetBeamTrail
	b _08084E76
	.align 2, 0
_08084E60: .4byte gCurrentProjectile
_08084E64:
	bl ProjectileChargedNormalBeamInit
	b _08084E70
_08084E6A:
	movs r0, #0x10
	bl ProjectileMove
_08084E70:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
_08084E76:
	ldr r1, _08084E84 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08084E7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084E84: .4byte gCurrentProjectile

	thumb_func_start ProjectileNormalBeamInit
ProjectileNormalBeamInit: @ 0x08084E88
	push {lr}
	movs r0, #0xc8
	bl SoundPlay
	ldr r3, _08084ECC @ =gCurrentProjectile
	ldrb r2, [r3]
	movs r1, #0x10
	movs r0, #0
	orrs r1, r2
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r2, _08084ED0 @ =0x0000FFF8
	strh r2, [r3, #0x16]
	movs r0, #8
	strh r0, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08084F24
	lsls r0, r0, #2
	ldr r1, _08084ED4 @ =_08084ED8
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, r3, #0
	mov pc, r0
	.align 2, 0
_08084ECC: .4byte gCurrentProjectile
_08084ED0: .4byte 0x0000FFF8
_08084ED4: .4byte _08084ED8
_08084ED8: @ jump table
	.4byte _08084F24 @ case 0
	.4byte _08084EF8 @ case 1
	.4byte _08084EEC @ case 2
	.4byte _08084F14 @ case 3
	.4byte _08084F08 @ case 4
_08084EEC:
	ldr r0, _08084F00 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_08084EF8:
	ldr r0, _08084F04 @ =sOam_58d7c4
	str r0, [r2, #4]
	b _08084F2A
	.align 2, 0
_08084F00: .4byte gCurrentProjectile
_08084F04: .4byte sOam_58d7c4
_08084F08:
	ldr r0, _08084F1C @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_08084F14:
	ldr r0, _08084F20 @ =sOam_58d7dc
	str r0, [r2, #4]
	b _08084F2A
	.align 2, 0
_08084F1C: .4byte gCurrentProjectile
_08084F20: .4byte sOam_58d7dc
_08084F24:
	ldr r1, _08084F30 @ =gCurrentProjectile
	ldr r0, _08084F34 @ =sOam_58d7ac
	str r0, [r1, #4]
_08084F2A:
	pop {r0}
	bx r0
	.align 2, 0
_08084F30: .4byte gCurrentProjectile
_08084F34: .4byte sOam_58d7ac

	thumb_func_start ProjectileNormalBeamSubroutine
ProjectileNormalBeamSubroutine: @ 0x08084F38
	push {r4, lr}
	ldr r0, _08084F5C @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08084F64
	ldr r1, _08084F60 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #3
	bl ParticleSet
	b _08084F96
	.align 2, 0
_08084F5C: .4byte gCurrentClipdataAffectingAction
_08084F60: .4byte gCurrentProjectile
_08084F64:
	ldr r4, _08084F78 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08084F7C
	cmp r0, #1
	beq _08084F82
	movs r0, #0x18
	bl ProjectileMove
	b _08084F8E
	.align 2, 0
_08084F78: .4byte gCurrentProjectile
_08084F7C:
	bl ProjectileNormalBeamInit
	b _08084F88
_08084F82:
	movs r0, #0x10
	bl ProjectileMove
_08084F88:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
_08084F8E:
	ldr r1, _08084F9C @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08084F96:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084F9C: .4byte gCurrentProjectile

	thumb_func_start ProjectileMissileInit
ProjectileMissileInit: @ 0x08084FA0
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08084FF8 @ =gEquipment
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _08084FC2
	subs r0, #1
	strh r0, [r1, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08084FC2
	ldr r0, _08084FFC @ =gSamusData
	ldrb r1, [r0, #8]
	movs r2, #1
	eors r1, r2
	strb r1, [r0, #8]
_08084FC2:
	ldr r1, _08085000 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r3, #0x10
	movs r0, #0x10
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _0808506C
	lsls r0, r0, #2
	ldr r1, _08085004 @ =_08085008
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08084FF8: .4byte gEquipment
_08084FFC: .4byte gSamusData
_08085000: .4byte gCurrentProjectile
_08085004: .4byte _08085008
_08085008: @ jump table
	.4byte _0808506C @ case 0
	.4byte _08085024 @ case 1
	.4byte _0808501C @ case 2
	.4byte _0808504C @ case 3
	.4byte _08085044 @ case 4
_0808501C:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08085024:
	cmp r4, #0
	bne _08085030
	ldr r0, _0808502C @ =sOam_58e7c0
	b _08085086
	.align 2, 0
_0808502C: .4byte sOam_58e7c0
_08085030:
	cmp r4, #1
	bne _0808503C
	ldr r0, _08085038 @ =sOam_58e858
	b _08085086
	.align 2, 0
_08085038: .4byte sOam_58e858
_0808503C:
	ldr r0, _08085040 @ =sOam_58e998
	b _08085086
	.align 2, 0
_08085040: .4byte sOam_58e998
_08085044:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_0808504C:
	cmp r4, #0
	bne _08085058
	ldr r0, _08085054 @ =sOam_58e7d8
	b _08085086
	.align 2, 0
_08085054: .4byte sOam_58e7d8
_08085058:
	cmp r4, #1
	bne _08085064
	ldr r0, _08085060 @ =sOam_58e870
	b _08085086
	.align 2, 0
_08085060: .4byte sOam_58e870
_08085064:
	ldr r0, _08085068 @ =sOam_58e9b0
	b _08085086
	.align 2, 0
_08085068: .4byte sOam_58e9b0
_0808506C:
	cmp r4, #0
	bne _08085078
	ldr r0, _08085074 @ =sOam_58e7a8
	b _08085086
	.align 2, 0
_08085074: .4byte sOam_58e7a8
_08085078:
	cmp r4, #1
	bne _08085084
	ldr r0, _08085080 @ =sOam_58e840
	b _08085086
	.align 2, 0
_08085080: .4byte sOam_58e840
_08085084:
	ldr r0, _08085090 @ =sOam_58e980
_08085086:
	str r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085090: .4byte sOam_58e980

	thumb_func_start ProjectileMoveTumblingMissile
ProjectileMoveTumblingMissile: @ 0x08085094
	push {r4, r5, r6, lr}
	ldr r2, _080850AC @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080850B0
	strb r0, [r2]
	b _080850FC
	.align 2, 0
_080850AC: .4byte gCurrentProjectile
_080850B0:
	ldrb r3, [r2, #0x1e]
	ldr r5, _080850D4 @ =sTumblingMissileFallingVelocity
	lsls r0, r3, #1
	adds r0, r0, r5
	ldrh r4, [r0]
	movs r6, #0
	ldrsh r1, [r0, r6]
	ldr r0, _080850D8 @ =0x00007FFF
	cmp r1, r0
	bne _080850DC
	subs r1, r3, #1
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r0, [r2, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	b _080850E4
	.align 2, 0
_080850D4: .4byte sTumblingMissileFallingVelocity
_080850D8: .4byte 0x00007FFF
_080850DC:
	adds r0, r3, #1
	strb r0, [r2, #0x1e]
	ldrh r0, [r2, #8]
	adds r0, r0, r4
_080850E4:
	strh r0, [r2, #8]
	ldrb r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080850F6
	ldrh r0, [r2, #0xa]
	adds r0, #4
	b _080850FA
_080850F6:
	ldrh r0, [r2, #0xa]
	subs r0, #4
_080850FA:
	strh r0, [r2, #0xa]
_080850FC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileNormalMissileSubroutine
ProjectileNormalMissileSubroutine: @ 0x08085104
	push {r4, lr}
	ldr r0, _08085128 @ =gCurrentClipdataAffectingAction
	movs r1, #8
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085130
	ldr r1, _0808512C @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #8
	bl ParticleSet
	b _080851A8
	.align 2, 0
_08085128: .4byte gCurrentClipdataAffectingAction
_0808512C: .4byte gCurrentProjectile
_08085130:
	ldr r0, _08085144 @ =gCurrentProjectile
	ldrb r1, [r0, #0x12]
	adds r4, r0, #0
	cmp r1, #1
	beq _08085174
	cmp r1, #1
	bgt _08085148
	cmp r1, #0
	beq _0808514E
	b _08085186
	.align 2, 0
_08085144: .4byte gCurrentProjectile
_08085148:
	cmp r1, #7
	beq _08085180
	b _08085186
_0808514E:
	ldr r1, _08085170 @ =0x0000FFF8
	strh r1, [r4, #0x16]
	movs r0, #8
	strh r0, [r4, #0x18]
	strh r1, [r4, #0x1a]
	strh r0, [r4, #0x1c]
	movs r0, #0
	bl ProjectileMissileInit
	movs r0, #0xce
	bl SoundPlay
	movs r0, #0xcf
	bl SoundPlay
	b _080851A8
	.align 2, 0
_08085170: .4byte 0x0000FFF8
_08085174:
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #0x30
	bl ProjectileMove
	b _080851A8
_08085180:
	bl ProjectileMoveTumblingMissile
	b _080851A8
_08085186:
	ldr r0, _080851B0 @ =sNormalMissileVelocity
	ldrb r1, [r4, #0x1e]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl ProjectileMove
	ldrb r0, [r4, #0x1e]
	cmp r0, #0x1a
	bhi _080851A0
	adds r0, #1
	strb r0, [r4, #0x1e]
_080851A0:
	movs r0, #0x15
	movs r1, #7
	bl ProjectileSetMissileTrail
_080851A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080851B0: .4byte sNormalMissileVelocity

	thumb_func_start ProjectileSuperMissileSubroutine
ProjectileSuperMissileSubroutine: @ 0x080851B4
	push {r4, lr}
	ldr r0, _080851D8 @ =gCurrentClipdataAffectingAction
	movs r1, #8
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _080851E0
	ldr r1, _080851DC @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #9
	bl ParticleSet
	b _08085258
	.align 2, 0
_080851D8: .4byte gCurrentClipdataAffectingAction
_080851DC: .4byte gCurrentProjectile
_080851E0:
	ldr r0, _080851F4 @ =gCurrentProjectile
	ldrb r1, [r0, #0x12]
	adds r4, r0, #0
	cmp r1, #1
	beq _08085224
	cmp r1, #1
	bgt _080851F8
	cmp r1, #0
	beq _080851FE
	b _08085236
	.align 2, 0
_080851F4: .4byte gCurrentProjectile
_080851F8:
	cmp r1, #7
	beq _08085230
	b _08085236
_080851FE:
	ldr r1, _08085220 @ =0x0000FFF4
	strh r1, [r4, #0x16]
	movs r0, #0xc
	strh r0, [r4, #0x18]
	strh r1, [r4, #0x1a]
	strh r0, [r4, #0x1c]
	movs r0, #0
	bl ProjectileMissileInit
	movs r0, #0xd1
	bl SoundPlay
	movs r0, #0xd2
	bl SoundPlay
	b _08085258
	.align 2, 0
_08085220: .4byte 0x0000FFF4
_08085224:
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #0x30
	bl ProjectileMove
	b _08085258
_08085230:
	bl ProjectileMoveTumblingMissile
	b _08085258
_08085236:
	ldr r0, _08085260 @ =sSuperMissileVelocity
	ldrb r1, [r4, #0x1e]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl ProjectileMove
	ldrb r0, [r4, #0x1e]
	cmp r0, #0x1a
	bhi _08085250
	adds r0, #1
	strb r0, [r4, #0x1e]
_08085250:
	movs r0, #0x16
	movs r1, #7
	bl ProjectileSetMissileTrail
_08085258:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085260: .4byte sSuperMissileVelocity

	thumb_func_start ProjectileIceMissileSubroutine
ProjectileIceMissileSubroutine: @ 0x08085264
	push {r4, lr}
	ldr r0, _08085288 @ =gCurrentClipdataAffectingAction
	movs r1, #8
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085290
	ldr r1, _0808528C @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #0xa
	bl ParticleSet
	b _08085310
	.align 2, 0
_08085288: .4byte gCurrentClipdataAffectingAction
_0808528C: .4byte gCurrentProjectile
_08085290:
	ldr r0, _080852A4 @ =gCurrentProjectile
	ldrb r1, [r0, #0x12]
	adds r4, r0, #0
	cmp r1, #1
	beq _080852DC
	cmp r1, #1
	bgt _080852A8
	cmp r1, #0
	beq _080852AE
	b _080852EE
	.align 2, 0
_080852A4: .4byte gCurrentProjectile
_080852A8:
	cmp r1, #7
	beq _080852E8
	b _080852EE
_080852AE:
	ldr r0, _080852D4 @ =0x0000FFF4
	strh r0, [r4, #0x16]
	movs r0, #0xc
	strh r0, [r4, #0x18]
	ldr r0, _080852D8 @ =0x0000FFF0
	strh r0, [r4, #0x1a]
	movs r0, #0x10
	strh r0, [r4, #0x1c]
	movs r0, #1
	bl ProjectileMissileInit
	movs r0, #0xd4
	bl SoundPlay
	movs r0, #0xd5
	bl SoundPlay
	b _08085310
	.align 2, 0
_080852D4: .4byte 0x0000FFF4
_080852D8: .4byte 0x0000FFF0
_080852DC:
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #0x30
	bl ProjectileMove
	b _08085310
_080852E8:
	bl ProjectileMoveTumblingMissile
	b _08085310
_080852EE:
	ldr r0, _08085318 @ =sIceMissileVelocity
	ldrb r1, [r4, #0x1e]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl ProjectileMove
	ldrb r0, [r4, #0x1e]
	cmp r0, #0x1a
	bhi _08085308
	adds r0, #1
	strb r0, [r4, #0x1e]
_08085308:
	movs r0, #0x17
	movs r1, #3
	bl ProjectileSetMissileTrail
_08085310:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085318: .4byte sIceMissileVelocity

	thumb_func_start ProjectileDiffusionMissileSubroutine
ProjectileDiffusionMissileSubroutine: @ 0x0808531C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r5, _08085354 @ =gCurrentProjectile
	ldrh r0, [r5, #8]
	mov r8, r0
	mov r7, r8
	ldrh r4, [r5, #0xa]
	adds r6, r4, #0
	ldr r0, _08085358 @ =gCurrentClipdataAffectingAction
	movs r1, #8
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _080853CA
	ldrb r0, [r5, #0xf]
	cmp r0, #0xe
	beq _0808535C
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0xb
	bl ParticleSet
	movs r0, #0
	strb r0, [r5]
	b _080854A4
	.align 2, 0
_08085354: .4byte gCurrentProjectile
_08085358: .4byte gCurrentClipdataAffectingAction
_0808535C:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #0xc
	bl ParticleSet
	movs r4, #0
	movs r0, #3
	strb r0, [r5, #0x12]
	strb r4, [r5, #0x1e]
	ldrb r1, [r5]
	movs r0, #0xef
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r5]
	str r4, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0
	bl ProjectileInitSecondary
	str r4, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0x40
	bl ProjectileInitSecondary
	str r4, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0x80
	bl ProjectileInitSecondary
	str r4, [sp]
	str r4, [sp, #4]
	ldrb r0, [r5, #0x1f]
	str r0, [sp, #8]
	movs r0, #0x12
	adds r1, r7, #0
	adds r2, r6, #0
	movs r3, #0xc0
	bl ProjectileInitSecondary
_080853CA:
	ldr r0, _080853E0 @ =gCurrentProjectile
	ldrb r1, [r0, #0x12]
	adds r4, r0, #0
	cmp r1, #1
	beq _08085444
	cmp r1, #1
	bgt _080853E4
	cmp r1, #0
	beq _080853EE
	b _0808546A
	.align 2, 0
_080853E0: .4byte gCurrentProjectile
_080853E4:
	cmp r1, #3
	beq _08085450
	cmp r1, #7
	beq _08085464
	b _0808546A
_080853EE:
	ldr r0, _08085420 @ =0x0000FFF4
	strh r0, [r4, #0x16]
	movs r0, #0xc
	strh r0, [r4, #0x18]
	ldr r0, _08085424 @ =0x0000FFF0
	strh r0, [r4, #0x1a]
	movs r0, #0x10
	strh r0, [r4, #0x1c]
	ldrb r0, [r4, #0xf]
	cmp r0, #0xe
	bne _08085428
	movs r0, #2
	bl ProjectileMissileInit
	movs r0, #0x19
	movs r1, #3
	bl ProjectileSetMissileTrail
	movs r0, #0xda
	bl SoundPlay
	movs r0, #0xdb
	bl SoundPlay
	b _080854A4
	.align 2, 0
_08085420: .4byte 0x0000FFF4
_08085424: .4byte 0x0000FFF0
_08085428:
	movs r0, #2
	bl ProjectileMissileInit
	movs r0, #0x18
	movs r1, #3
	bl ProjectileSetMissileTrail
	movs r0, #0xd7
	bl SoundPlay
	movs r0, #0xd8
	bl SoundPlay
	b _080854A4
_08085444:
	movs r0, #2
	strb r0, [r4, #0x12]
	movs r0, #0x30
	bl ProjectileMove
	b _080854A4
_08085450:
	ldrb r0, [r4, #0x1e]
	adds r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bls _080854A4
	movs r0, #0
	strb r0, [r4]
	b _080854A4
_08085464:
	bl ProjectileMoveTumblingMissile
	b _080854A4
_0808546A:
	ldr r0, _08085498 @ =sDiffusionMissileVelocity
	adds r5, r4, #0
	ldrb r1, [r5, #0x1e]
	lsrs r1, r1, #2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrb r0, [r1]
	bl ProjectileMove
	ldrb r0, [r5, #0x1e]
	cmp r0, #0x1a
	bhi _08085486
	adds r0, #1
	strb r0, [r5, #0x1e]
_08085486:
	ldrb r0, [r4, #0xf]
	cmp r0, #0xe
	bne _0808549C
	movs r0, #0x19
	movs r1, #3
	bl ProjectileSetMissileTrail
	b _080854A4
	.align 2, 0
_08085498: .4byte sDiffusionMissileVelocity
_0808549C:
	movs r0, #0x18
	movs r1, #3
	bl ProjectileSetMissileTrail
_080854A4:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start ProjectileDiffusionFlakeSubroutine
ProjectileDiffusionFlakeSubroutine: @ 0x080854B0
	push {r4, r5, r6, r7, lr}
	ldr r0, _080854EC @ =gCurrentProjectile
	ldrb r1, [r0, #0x1f]
	ldrb r2, [r0, #0x12]
	adds r4, r2, #0
	adds r3, r0, #0
	cmp r4, #0
	bne _080854F8
	adds r0, r2, #1
	strb r0, [r3, #0x12]
	ldrb r1, [r3]
	movs r0, #0x18
	orrs r0, r1
	movs r1, #0xfb
	ands r0, r1
	strb r0, [r3]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	movs r2, #0
	ldr r1, _080854F0 @ =0x0000FFF0
	strh r1, [r3, #0x16]
	strh r0, [r3, #0x18]
	strh r1, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	ldr r0, _080854F4 @ =sDiffusionFlakeOam
	str r0, [r3, #4]
	strb r2, [r3, #0xe]
	strh r4, [r3, #0xc]
	b _080855C2
	.align 2, 0
_080854EC: .4byte gCurrentProjectile
_080854F0: .4byte 0x0000FFF0
_080854F4: .4byte sDiffusionFlakeOam
_080854F8:
	ldr r0, _0808550C @ =gProjectileData
	lsls r1, r1, #5
	adds r5, r1, r0
	ldrb r2, [r5]
	mov ip, r0
	adds r6, r1, #0
	cmp r2, #0
	bne _08085510
	strb r2, [r3]
	b _080855C2
	.align 2, 0
_0808550C: .4byte gProjectileData
_08085510:
	ldrb r0, [r3, #0x10]
	adds r0, #2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x10]
	lsls r2, r0, #1
	ldrb r4, [r3, #0x13]
	adds r0, r4, #0
	adds r0, #8
	strb r0, [r3, #0x13]
	ldr r1, _08085548 @ =sSineTable
	lsls r0, r4, #1
	adds r0, r0, r1
	movs r7, #0
	ldrsh r0, [r0, r7]
	adds r7, r1, #0
	cmp r0, #0
	bge _0808554C
	rsbs r0, r0, #0
	muls r0, r2, r0
	lsls r2, r2, #0x10
	cmp r0, #0
	bge _0808553E
	adds r0, #0xff
_0808553E:
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	ldrh r0, [r5, #8]
	subs r0, r0, r1
	b _0808555E
	.align 2, 0
_08085548: .4byte sSineTable
_0808554C:
	muls r0, r2, r0
	lsls r2, r2, #0x10
	cmp r0, #0
	bge _08085556
	adds r0, #0xff
_08085556:
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	ldrh r5, [r5, #8]
	adds r0, r0, r5
_0808555E:
	strh r0, [r3, #8]
	adds r0, r4, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r7
	movs r4, #0
	ldrsh r1, [r0, r4]
	cmp r1, #0
	bge _0808558A
	rsbs r1, r1, #0
	asrs r0, r2, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _0808557C
	adds r0, #0xff
_0808557C:
	lsls r0, r0, #8
	lsrs r1, r0, #0x10
	mov r7, ip
	adds r0, r6, r7
	ldrh r0, [r0, #0xa]
	subs r0, r0, r1
	b _080855A0
_0808558A:
	asrs r0, r2, #0x10
	muls r0, r1, r0
	cmp r0, #0
	bge _08085594
	adds r0, #0xff
_08085594:
	lsls r0, r0, #8
	mov r2, ip
	adds r1, r6, r2
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0xa]
	adds r0, r0, r1
_080855A0:
	strh r0, [r3, #0xa]
	ldr r0, _080855C8 @ =gFrameCounter8Bit
	ldrb r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _080855B8
	ldrh r0, [r3, #8]
	ldrh r1, [r3, #0xa]
	movs r2, #0x20
	bl ParticleSet
_080855B8:
	ldr r1, _080855CC @ =gCurrentClipdataAffectingAction
	movs r0, #8
	strb r0, [r1]
	bl ProjectileCheckHittingSolid
_080855C2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080855C8: .4byte gFrameCounter8Bit
_080855CC: .4byte gCurrentClipdataAffectingAction

	thumb_func_start ProjectileCheckSamusBombBounce
ProjectileCheckSamusBombBounce: @ 0x080855D0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r0, _0808568C @ =gSamusData
	mov sl, r0
	ldrh r4, [r0, #0x18]
	str r4, [sp, #0x10]
	ldrh r5, [r0, #0x16]
	str r5, [sp, #0x14]
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r5, #0
	bl ClipdataProcess
	movs r6, #0x80
	lsls r6, r6, #0x11
	ands r0, r6
	cmp r0, #0
	beq _0808560C
	adds r0, r4, #0
	subs r0, #0x60
	adds r1, r5, #0
	bl ClipdataProcess
	ands r0, r6
	cmp r0, #0
	bne _080856FA
_0808560C:
	ldr r0, _08085690 @ =gPreviousXPosition
	ldrh r0, [r0]
	str r0, [sp, #0x18]
	mov r1, sl
	ldrh r0, [r1, #0x26]
	adds r0, r4, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r1, #0x2a]
	adds r1, r4, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r3, sl
	ldrh r2, [r3, #0x24]
	adds r2, r5, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldrh r3, [r3, #0x28]
	adds r3, r5, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r4, _08085694 @ =gCurrentProjectile
	mov r8, r4
	ldrh r6, [r4, #8]
	str r6, [sp, #0x1c]
	ldrh r4, [r4, #0xa]
	mov sb, r4
	mov r4, r8
	ldrh r6, [r4, #0x16]
	ldr r4, [sp, #0x1c]
	adds r6, r4, r6
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov ip, r6
	mov r6, r8
	ldrh r5, [r6, #0x18]
	adds r5, r4, r5
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldrh r4, [r6, #0x1a]
	add r4, sb
	lsls r4, r4, #0x10
	lsrs r7, r4, #0x10
	ldrh r4, [r6, #0x1c]
	add r4, sb
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r6, ip
	str r6, [sp]
	str r5, [sp, #4]
	str r7, [sp, #8]
	str r4, [sp, #0xc]
	bl SpriteUtilCheckObjectsTouching
	cmp r0, #0
	beq _080856FA
	mov r1, sl
	ldrb r0, [r1, #1]
	cmp r0, #0x3c
	bne _0808569C
	ldr r1, _08085698 @ =gBossWork0
	movs r0, #1
	strb r0, [r1]
	b _080856FA
	.align 2, 0
_0808568C: .4byte gSamusData
_08085690: .4byte gPreviousXPosition
_08085694: .4byte gCurrentProjectile
_08085698: .4byte gBossWork0
_0808569C:
	subs r0, r4, r7
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r7, r0
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r2, sl
	ldrb r0, [r2, #5]
	cmp r0, #0
	bne _080856FA
	bl SpriteUtilCheckSamusDamagingPose
	cmp r0, #0
	bne _080856FA
	ldr r0, [sp, #0x10]
	subs r0, #0x20
	movs r1, #0
	ldr r3, [sp, #0x1c]
	cmp r0, r3
	ble _080856C8
	movs r1, #0x80
_080856C8:
	mov r0, sb
	adds r0, #5
	ldr r6, [sp, #0x14]
	cmp r6, r0
	bge _080856E2
	subs r0, #0xa
	cmp r6, r0
	ble _080856E2
	adds r0, r1, #0
	adds r0, #0xb
	bl SamusBombBounce
	b _080856FA
_080856E2:
	ldr r0, [sp, #0x18]
	cmp r4, r0
	blo _080856F2
	adds r0, r1, #0
	adds r0, #0xc
	bl SamusBombBounce
	b _080856FA
_080856F2:
	adds r0, r1, #0
	adds r0, #0xa
	bl SamusBombBounce
_080856FA:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start ProjectileBombInit
ProjectileBombInit: @ 0x0808570C
	push {lr}
	movs r0, #0xdd
	bl SoundPlay
	ldr r1, _08085750 @ =gCurrentProjectile
	ldr r0, _08085754 @ =sOam_58eae8
	str r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r3, #8
	movs r0, #8
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	ldr r2, _08085758 @ =0x0000FFE0
	strh r2, [r1, #0x16]
	movs r0, #0x1c
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	movs r0, #0x20
	strh r0, [r1, #0x1c]
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	movs r0, #0x32
	strb r0, [r1, #0x1e]
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	pop {r0}
	bx r0
	.align 2, 0
_08085750: .4byte gCurrentProjectile
_08085754: .4byte sOam_58eae8
_08085758: .4byte 0x0000FFE0

	thumb_func_start ProjectileBombSubroutine
ProjectileBombSubroutine: @ 0x0808575C
	push {r4, lr}
	ldr r4, _08085770 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #1
	beq _08085784
	cmp r0, #1
	bgt _08085774
	cmp r0, #0
	beq _0808577E
	b _080858DA
	.align 2, 0
_08085770: .4byte gCurrentProjectile
_08085774:
	cmp r0, #2
	beq _080857AC
	cmp r0, #3
	beq _080857D8
	b _080858DA
_0808577E:
	bl ProjectileBombInit
	b _080858DA
_08085784:
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _08085794
	b _080858DA
_08085794:
	ldr r0, _080857A8 @ =sOam_58eb10
	str r0, [r4, #4]
	strb r1, [r4, #0xe]
	strh r1, [r4, #0xc]
	movs r0, #0x1e
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080858DA
	.align 2, 0
_080857A8: .4byte sOam_58eb10
_080857AC:
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080857BA
	b _080858DA
_080857BA:
	movs r0, #0x10
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	ldrb r0, [r4]
	movs r1, #0x14
	orrs r0, r1
	strb r0, [r4]
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #1
	bl ParticleSet
	b _080858DA
_080857D8:
	ldrb r0, [r4, #0x1e]
	subs r1, r0, #1
	strb r1, [r4, #0x1e]
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080857E8
	b _080858D8
_080857E8:
	lsls r0, r1, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bne _08085810
	ldr r1, _0808580C @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #8
	ldrh r1, [r4, #0xa]
	bl ClipdataProcess
	bl ProjectileCheckSamusBombBounce
	ldrb r1, [r4]
	movs r0, #0xef
	ands r0, r1
	b _080858D8
	.align 2, 0
_0808580C: .4byte gCurrentClipdataAffectingAction
_08085810:
	cmp r1, #0xe
	bne _08085824
	ldr r1, _08085820 @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, #0x38
	b _08085892
	.align 2, 0
_08085820: .4byte gCurrentClipdataAffectingAction
_08085824:
	cmp r1, #0xd
	bne _08085840
	ldr r1, _0808583C @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #8
	ldrh r1, [r4, #0xa]
	adds r1, #0x30
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_0808583C: .4byte gCurrentClipdataAffectingAction
_08085840:
	cmp r1, #0xc
	bne _0808585C
	ldr r1, _08085858 @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #8
	ldrh r1, [r4, #0xa]
	subs r1, #0x30
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_08085858: .4byte gCurrentClipdataAffectingAction
_0808585C:
	cmp r1, #0xb
	bne _08085870
	ldr r1, _0808586C @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, #0x38
	b _080858AE
	.align 2, 0
_0808586C: .4byte gCurrentClipdataAffectingAction
_08085870:
	cmp r1, #0xa
	bne _08085884
	ldr r1, _08085880 @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	adds r0, #0x38
	b _080858C8
	.align 2, 0
_08085880: .4byte gCurrentClipdataAffectingAction
_08085884:
	cmp r1, #9
	bne _080858A0
	ldr r1, _0808589C @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #0x48
_08085892:
	ldrh r1, [r4, #0xa]
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_0808589C: .4byte gCurrentClipdataAffectingAction
_080858A0:
	cmp r1, #8
	bne _080858BC
	ldr r1, _080858B8 @ =gCurrentClipdataAffectingAction
	movs r0, #7
	strb r0, [r1]
	ldrh r0, [r4, #8]
	subs r0, #0x48
_080858AE:
	ldrh r1, [r4, #0xa]
	adds r1, #0x24
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_080858B8: .4byte gCurrentClipdataAffectingAction
_080858BC:
	cmp r1, #7
	bne _080858DA
	ldr r0, _080858D4 @ =gCurrentClipdataAffectingAction
	strb r1, [r0]
	ldrh r0, [r4, #8]
	subs r0, #0x48
_080858C8:
	ldrh r1, [r4, #0xa]
	subs r1, #0x24
	bl ClipdataProcess
	b _080858DA
	.align 2, 0
_080858D4: .4byte gCurrentClipdataAffectingAction
_080858D8:
	strb r0, [r4]
_080858DA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start ProjectilePowerBombInit
ProjectilePowerBombInit: @ 0x080858E0
	push {r4, r5, r6, lr}
	ldr r1, _08085974 @ =gEquipment
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _080858FE
	subs r0, #1
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080858FE
	ldr r0, _08085978 @ =gSamusData
	ldrb r1, [r0, #8]
	movs r2, #0x10
	eors r1, r2
	strb r1, [r0, #8]
_080858FE:
	ldr r1, _0808597C @ =gCurrentProjectile
	ldr r0, _08085980 @ =sOam_58eb38
	str r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r3, #8
	movs r0, #8
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	ldr r2, _08085984 @ =0x0000FFF0
	strh r2, [r1, #0x16]
	movs r0, #0x10
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	strh r0, [r1, #0x1c]
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	orrs r0, r3
	strb r0, [r1]
	movs r0, #0x46
	strb r0, [r1, #0x1e]
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	movs r3, #0
	ldr r5, _08085988 @ =gSpriteData
	movs r6, #1
	movs r4, #0x7f
_0808593A:
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #3
	adds r2, r0, r5
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08085956
	adds r2, #0x2c
	ldrb r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	strb r0, [r2]
_08085956:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x17
	bls _0808593A
	movs r0, #0xdf
	bl SoundPlay
	ldr r1, _0808598C @ =gCurrentPowerBomb
	movs r0, #1
	strb r0, [r1, #0x10]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08085974: .4byte gEquipment
_08085978: .4byte gSamusData
_0808597C: .4byte gCurrentProjectile
_08085980: .4byte sOam_58eb38
_08085984: .4byte 0x0000FFF0
_08085988: .4byte gSpriteData
_0808598C: .4byte gCurrentPowerBomb

	thumb_func_start ProjectilePowerBombSubroutine
ProjectilePowerBombSubroutine: @ 0x08085990
	push {r4, r5, lr}
	ldr r4, _080859A4 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #1
	beq _080859B4
	cmp r0, #1
	bgt _080859A8
	cmp r0, #0
	beq _080859AE
	b _08085A00
	.align 2, 0
_080859A4: .4byte gCurrentProjectile
_080859A8:
	cmp r0, #2
	beq _080859DC
	b _08085A00
_080859AE:
	bl ProjectilePowerBombInit
	b _08085A00
_080859B4:
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _08085A00
	ldr r0, _080859D8 @ =sOam_58eb58
	str r0, [r4, #4]
	strb r1, [r4, #0xe]
	strh r1, [r4, #0xc]
	movs r0, #0x46
	strb r0, [r4, #0x1e]
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _08085A00
	.align 2, 0
_080859D8: .4byte sOam_58eb58
_080859DC:
	ldr r0, _08085A08 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #2
	bne _08085A00
	ldrb r0, [r4, #0x1e]
	subs r0, #1
	strb r0, [r4, #0x1e]
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0
	bne _08085A00
	ldrh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	movs r2, #0
	bl PowerBombExplosionStart
	strb r5, [r4]
_08085A00:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085A08: .4byte gSubGameMode1

	thumb_func_start ProjectileChargedChargeBeamInit
ProjectileChargedChargeBeamInit: @ 0x08085A0C
	push {r4, lr}
	ldr r0, _08085A4C @ =gCurrentProjectile
	movs r1, #0
	strb r1, [r0, #0xe]
	strh r1, [r0, #0xc]
	movs r1, #0x10
	strb r1, [r0, #0x14]
	strb r1, [r0, #0x15]
	ldr r2, _08085A50 @ =0x0000FFF4
	strh r2, [r0, #0x16]
	movs r1, #0xc
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrb r1, [r0, #0x13]
	adds r4, r0, #0
	cmp r1, #0
	beq _08085AA0
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085A94
	lsls r0, r0, #2
	ldr r1, _08085A54 @ =_08085A58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085A4C: .4byte gCurrentProjectile
_08085A50: .4byte 0x0000FFF4
_08085A54: .4byte _08085A58
_08085A58: @ jump table
	.4byte _08085A94 @ case 0
	.4byte _08085A74 @ case 1
	.4byte _08085A6C @ case 2
	.4byte _08085A88 @ case 3
	.4byte _08085A80 @ case 4
_08085A6C:
	ldrb r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4]
_08085A74:
	ldr r0, _08085A7C @ =sOam_58da60
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085A7C: .4byte sOam_58da60
_08085A80:
	ldrb r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4]
_08085A88:
	ldr r0, _08085A90 @ =sOam_58da70
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085A90: .4byte sOam_58da70
_08085A94:
	ldr r0, _08085A9C @ =sOam_58da50
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085A9C: .4byte sOam_58da50
_08085AA0:
	movs r0, #0xed
	bl SoundPlay
	ldrb r0, [r4]
	movs r1, #0xfb
	ands r1, r0
	strb r1, [r4]
	ldrb r0, [r4, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085B10
	lsls r0, r0, #2
	ldr r1, _08085AC0 @ =_08085AC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085AC0: .4byte _08085AC4
_08085AC4: @ jump table
	.4byte _08085B10 @ case 0
	.4byte _08085AE4 @ case 1
	.4byte _08085AD8 @ case 2
	.4byte _08085B00 @ case 3
	.4byte _08085AF4 @ case 4
_08085AD8:
	ldr r0, _08085AEC @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r4, r0, #0
_08085AE4:
	ldr r0, _08085AF0 @ =sOam_58da20
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085AEC: .4byte gCurrentProjectile
_08085AF0: .4byte sOam_58da20
_08085AF4:
	ldr r0, _08085B08 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r4, r0, #0
_08085B00:
	ldr r0, _08085B0C @ =sOam_58da38
	str r0, [r4, #4]
	b _08085B16
	.align 2, 0
_08085B08: .4byte gCurrentProjectile
_08085B0C: .4byte sOam_58da38
_08085B10:
	ldr r1, _08085B1C @ =gCurrentProjectile
	ldr r0, _08085B20 @ =sOam_58da08
	str r0, [r1, #4]
_08085B16:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085B1C: .4byte gCurrentProjectile
_08085B20: .4byte sOam_58da08

	thumb_func_start ProjectileChargedChargeBeamSubroutine
ProjectileChargedChargeBeamSubroutine: @ 0x08085B24
	push {r4, lr}
	ldr r2, _08085B8C @ =gCurrentProjectile
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	beq _08085BA4
	ldrb r3, [r2]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08085B4C
	ldr r0, _08085B90 @ =gProjectileData
	ldrb r1, [r2, #0x1f]
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bls _08085B4C
	movs r0, #0xfb
	ands r0, r3
	strb r0, [r2]
_08085B4C:
	ldr r0, _08085B94 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085B98
	ldr r2, _08085B8C @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _08085B7A
	ldr r0, _08085B90 @ =gProjectileData
	ldrb r1, [r4, #0x1f]
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bhi _08085B7A
	strb r3, [r1, #0x12]
_08085B7A:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #4
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
	b _08085C24
	.align 2, 0
_08085B8C: .4byte gCurrentProjectile
_08085B90: .4byte gProjectileData
_08085B94: .4byte gCurrentClipdataAffectingAction
_08085B98:
	ldr r0, _08085BB8 @ =gCurrentProjectile
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bhi _08085BA4
	bl ProjectileMovePart
_08085BA4:
	ldr r1, _08085BB8 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	cmp r0, #4
	bhi _08085C18
	lsls r0, r0, #2
	ldr r1, _08085BBC @ =_08085BC0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085BB8: .4byte gCurrentProjectile
_08085BBC: .4byte _08085BC0
_08085BC0: @ jump table
	.4byte _08085BD4 @ case 0
	.4byte _08085BDA @ case 1
	.4byte _08085BE2 @ case 2
	.4byte _08085BEA @ case 3
	.4byte _08085C08 @ case 4
_08085BD4:
	bl ProjectileChargedChargeBeamInit
	b _08085C08
_08085BDA:
	movs r0, #0x10
	bl ProjectileMove
	b _08085C08
_08085BE2:
	ldr r1, _08085C04 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
_08085BEA:
	movs r0, #0x18
	bl ProjectileMove
	ldr r0, _08085C04 @ =gCurrentProjectile
	ldrb r0, [r0, #0x13]
	cmp r0, #0
	bne _08085C1C
	movs r0, #0x10
	movs r1, #3
	bl ProjectileSetBeamTrail
	b _08085C1C
	.align 2, 0
_08085C04: .4byte gCurrentProjectile
_08085C08:
	ldr r1, _08085C14 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	b _08085C1C
	.align 2, 0
_08085C14: .4byte gCurrentProjectile
_08085C18:
	movs r0, #0
	strb r0, [r1]
_08085C1C:
	ldr r1, _08085C2C @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08085C24:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085C2C: .4byte gCurrentProjectile

	thumb_func_start ProjectileChargeBeamInit
ProjectileChargeBeamInit: @ 0x08085C30
	push {r4, lr}
	ldr r0, _08085C70 @ =gCurrentProjectile
	movs r1, #0
	strb r1, [r0, #0xe]
	strh r1, [r0, #0xc]
	movs r1, #0x10
	strb r1, [r0, #0x14]
	strb r1, [r0, #0x15]
	ldr r2, _08085C74 @ =0x0000FFF4
	strh r2, [r0, #0x16]
	movs r1, #0xc
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldrb r1, [r0, #0x13]
	adds r4, r0, #0
	cmp r1, #0
	beq _08085CC4
	ldrb r0, [r4]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	ldrb r0, [r4, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085CB8
	lsls r0, r0, #2
	ldr r1, _08085C78 @ =_08085C7C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085C70: .4byte gCurrentProjectile
_08085C74: .4byte 0x0000FFF4
_08085C78: .4byte _08085C7C
_08085C7C: @ jump table
	.4byte _08085CB8 @ case 0
	.4byte _08085C98 @ case 1
	.4byte _08085C90 @ case 2
	.4byte _08085CAC @ case 3
	.4byte _08085CA4 @ case 4
_08085C90:
	ldrb r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4]
_08085C98:
	ldr r0, _08085CA0 @ =sOam_58d9e8
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085CA0: .4byte sOam_58d9e8
_08085CA4:
	ldrb r1, [r4]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r4]
_08085CAC:
	ldr r0, _08085CB4 @ =sOam_58d9f8
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085CB4: .4byte sOam_58d9f8
_08085CB8:
	ldr r0, _08085CC0 @ =sOam_58d9d8
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085CC0: .4byte sOam_58d9d8
_08085CC4:
	movs r0, #0xca
	bl SoundPlay
	ldrb r0, [r4]
	movs r1, #0xfb
	ands r1, r0
	strb r1, [r4]
	ldrb r0, [r4, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085D34
	lsls r0, r0, #2
	ldr r1, _08085CE4 @ =_08085CE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085CE4: .4byte _08085CE8
_08085CE8: @ jump table
	.4byte _08085D34 @ case 0
	.4byte _08085D08 @ case 1
	.4byte _08085CFC @ case 2
	.4byte _08085D24 @ case 3
	.4byte _08085D18 @ case 4
_08085CFC:
	ldr r0, _08085D10 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r4, r0, #0
_08085D08:
	ldr r0, _08085D14 @ =sOam_58d9a8
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085D10: .4byte gCurrentProjectile
_08085D14: .4byte sOam_58d9a8
_08085D18:
	ldr r0, _08085D2C @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r4, r0, #0
_08085D24:
	ldr r0, _08085D30 @ =sOam_58d9c0
	str r0, [r4, #4]
	b _08085D3A
	.align 2, 0
_08085D2C: .4byte gCurrentProjectile
_08085D30: .4byte sOam_58d9c0
_08085D34:
	ldr r1, _08085D40 @ =gCurrentProjectile
	ldr r0, _08085D44 @ =sOam_58d990
	str r0, [r1, #4]
_08085D3A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085D40: .4byte gCurrentProjectile
_08085D44: .4byte sOam_58d990

	thumb_func_start ProjectileChargeBeamSubroutine
ProjectileChargeBeamSubroutine: @ 0x08085D48
	push {r4, lr}
	ldr r2, _08085DB0 @ =gCurrentProjectile
	ldrb r0, [r2, #0x13]
	cmp r0, #0
	beq _08085DC8
	ldrb r3, [r2]
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _08085D70
	ldr r0, _08085DB4 @ =gProjectileData
	ldrb r1, [r2, #0x1f]
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bls _08085D70
	movs r0, #0xfb
	ands r0, r3
	strb r0, [r2]
_08085D70:
	ldr r0, _08085DB8 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085DBC
	ldr r2, _08085DB0 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r3, #4
	adds r0, r3, #0
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	beq _08085D9E
	ldr r0, _08085DB4 @ =gProjectileData
	ldrb r1, [r4, #0x1f]
	lsls r1, r1, #5
	adds r1, r1, r0
	ldrb r0, [r1, #0x12]
	cmp r0, #3
	bhi _08085D9E
	strb r3, [r1, #0x12]
_08085D9E:
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #0xa]
	movs r2, #4
	bl ParticleSet
	movs r0, #0
	strb r0, [r4]
	b _08085E38
	.align 2, 0
_08085DB0: .4byte gCurrentProjectile
_08085DB4: .4byte gProjectileData
_08085DB8: .4byte gCurrentClipdataAffectingAction
_08085DBC:
	ldr r0, _08085DDC @ =gCurrentProjectile
	ldrb r0, [r0, #0x12]
	cmp r0, #2
	bhi _08085DC8
	bl ProjectileMovePart
_08085DC8:
	ldr r1, _08085DDC @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	cmp r0, #4
	bhi _08085E2C
	lsls r0, r0, #2
	ldr r1, _08085DE0 @ =_08085DE4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08085DDC: .4byte gCurrentProjectile
_08085DE0: .4byte _08085DE4
_08085DE4: @ jump table
	.4byte _08085DF8 @ case 0
	.4byte _08085DFE @ case 1
	.4byte _08085E06 @ case 2
	.4byte _08085E0E @ case 3
	.4byte _08085E1C @ case 4
_08085DF8:
	bl ProjectileChargeBeamInit
	b _08085E1C
_08085DFE:
	movs r0, #0x10
	bl ProjectileMove
	b _08085E1C
_08085E06:
	ldr r1, _08085E18 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
_08085E0E:
	movs r0, #0x18
	bl ProjectileMove
	b _08085E30
	.align 2, 0
_08085E18: .4byte gCurrentProjectile
_08085E1C:
	ldr r1, _08085E28 @ =gCurrentProjectile
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	b _08085E30
	.align 2, 0
_08085E28: .4byte gCurrentProjectile
_08085E2C:
	movs r0, #0
	strb r0, [r1]
_08085E30:
	ldr r1, _08085E40 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08085E38:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085E40: .4byte gCurrentProjectile

	thumb_func_start ProjectileChargedWideBeaminit
ProjectileChargedWideBeaminit: @ 0x08085E44
	push {lr}
	movs r0, #0xee
	bl SoundPlay
	ldr r3, _08085E88 @ =gCurrentProjectile
	ldrb r2, [r3]
	movs r1, #0x10
	movs r0, #0
	orrs r1, r2
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r2, _08085E8C @ =0x0000FFEC
	strh r2, [r3, #0x16]
	movs r0, #0x14
	strh r0, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08085EEC
	lsls r0, r0, #2
	ldr r1, _08085E90 @ =_08085E94
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, r3, #0
	mov pc, r0
	.align 2, 0
_08085E88: .4byte gCurrentProjectile
_08085E8C: .4byte 0x0000FFEC
_08085E90: .4byte _08085E94
_08085E94: @ jump table
	.4byte _08085EEC @ case 0
	.4byte _08085EC0 @ case 1
	.4byte _08085EA8 @ case 2
	.4byte _08085EDC @ case 3
	.4byte _08085ED0 @ case 4
_08085EA8:
	ldr r1, _08085EB8 @ =gCurrentProjectile
	ldrb r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08085EBC @ =sOam_58dc54
	b _08085EF0
	.align 2, 0
_08085EB8: .4byte gCurrentProjectile
_08085EBC: .4byte sOam_58dc54
_08085EC0:
	ldr r1, _08085EC8 @ =gCurrentProjectile
	ldr r0, _08085ECC @ =sOam_58dc54
	b _08085EF0
	.align 2, 0
_08085EC8: .4byte gCurrentProjectile
_08085ECC: .4byte sOam_58dc54
_08085ED0:
	ldr r0, _08085EE4 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_08085EDC:
	ldr r0, _08085EE8 @ =sOam_58dc6c
	str r0, [r2, #4]
	b _08085EF2
	.align 2, 0
_08085EE4: .4byte gCurrentProjectile
_08085EE8: .4byte sOam_58dc6c
_08085EEC:
	ldr r1, _08085EF8 @ =gCurrentProjectile
	ldr r0, _08085EFC @ =sOam_58dc3c
_08085EF0:
	str r0, [r1, #4]
_08085EF2:
	pop {r0}
	bx r0
	.align 2, 0
_08085EF8: .4byte gCurrentProjectile
_08085EFC: .4byte sOam_58dc3c

	thumb_func_start ProjectileChargedWideBeamSubroutine
ProjectileChargedWideBeamSubroutine: @ 0x08085F00
	push {r4, lr}
	ldr r1, _08085F34 @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _08085F14
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bhi _08085F14
	bl ProjectileMovePart
_08085F14:
	ldr r0, _08085F38 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08085F3C
	ldr r1, _08085F34 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #5
	bl ParticleSet
	b _08085F82
	.align 2, 0
_08085F34: .4byte gCurrentProjectile
_08085F38: .4byte gCurrentClipdataAffectingAction
_08085F3C:
	ldr r4, _08085F54 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08085F58
	cmp r0, #1
	beq _08085F5E
	cmp r0, #8
	bhi _08085F6C
	adds r0, #1
	strb r0, [r4, #0x12]
	b _08085F6C
	.align 2, 0
_08085F54: .4byte gCurrentProjectile
_08085F58:
	bl ProjectileChargedWideBeaminit
	b _08085F64
_08085F5E:
	movs r0, #0x10
	bl ProjectileMove
_08085F64:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _08085F7A
_08085F6C:
	movs r0, #0x18
	bl ProjectileMove
	movs r0, #0x11
	movs r1, #3
	bl ProjectileSetBeamTrail
_08085F7A:
	ldr r1, _08085F88 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08085F82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08085F88: .4byte gCurrentProjectile

	thumb_func_start ProjectileWideBeamInit
ProjectileWideBeamInit: @ 0x08085F8C
	push {lr}
	movs r0, #0xc9
	bl SoundPlay
	ldr r3, _08085FCC @ =gCurrentProjectile
	ldrb r1, [r3]
	movs r2, #0x10
	movs r0, #0
	orrs r2, r1
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r1, _08085FD0 @ =0x0000FFF0
	strh r1, [r3, #0x16]
	strh r0, [r3, #0x18]
	strh r1, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r2, r0
	strb r2, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _0808602C
	lsls r0, r0, #2
	ldr r1, _08085FD4 @ =_08085FD8
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r3, #0
	mov pc, r0
	.align 2, 0
_08085FCC: .4byte gCurrentProjectile
_08085FD0: .4byte 0x0000FFF0
_08085FD4: .4byte _08085FD8
_08085FD8: @ jump table
	.4byte _0808602C @ case 0
	.4byte _08086004 @ case 1
	.4byte _08085FEC @ case 2
	.4byte _08086020 @ case 3
	.4byte _08086014 @ case 4
_08085FEC:
	ldr r1, _08085FFC @ =gCurrentProjectile
	ldrb r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08086000 @ =sOam_58dbfc
	b _08086030
	.align 2, 0
_08085FFC: .4byte gCurrentProjectile
_08086000: .4byte sOam_58dbfc
_08086004:
	ldr r1, _0808600C @ =gCurrentProjectile
	ldr r0, _08086010 @ =sOam_58dbfc
	b _08086030
	.align 2, 0
_0808600C: .4byte gCurrentProjectile
_08086010: .4byte sOam_58dbfc
_08086014:
	ldr r0, _08086024 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r1, r0, #0
_08086020:
	ldr r0, _08086028 @ =sOam_58dc1c
	b _08086030
	.align 2, 0
_08086024: .4byte gCurrentProjectile
_08086028: .4byte sOam_58dc1c
_0808602C:
	ldr r1, _08086038 @ =gCurrentProjectile
	ldr r0, _0808603C @ =sOam_58dbdc
_08086030:
	str r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08086038: .4byte gCurrentProjectile
_0808603C: .4byte sOam_58dbdc

	thumb_func_start ProjectileWideBeamSubroutine
ProjectileWideBeamSubroutine: @ 0x08086040
	push {r4, lr}
	ldr r1, _08086074 @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _08086054
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bhi _08086054
	bl ProjectileMovePart
_08086054:
	ldr r0, _08086078 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _0808607C
	ldr r1, _08086074 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #5
	bl ParticleSet
	b _080860BA
	.align 2, 0
_08086074: .4byte gCurrentProjectile
_08086078: .4byte gCurrentClipdataAffectingAction
_0808607C:
	ldr r4, _08086094 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08086098
	cmp r0, #1
	beq _0808609E
	cmp r0, #8
	bhi _080860AC
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080860AC
	.align 2, 0
_08086094: .4byte gCurrentProjectile
_08086098:
	bl ProjectileWideBeamInit
	b _080860A4
_0808609E:
	movs r0, #0x10
	bl ProjectileMove
_080860A4:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080860B2
_080860AC:
	movs r0, #0x18
	bl ProjectileMove
_080860B2:
	ldr r1, _080860C0 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_080860BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080860C0: .4byte gCurrentProjectile

	thumb_func_start ProjectileChargedPlasmaBeamInit
ProjectileChargedPlasmaBeamInit: @ 0x080860C4
	push {lr}
	movs r0, #0xef
	bl SoundPlay
	ldr r3, _0808610C @ =gCurrentProjectile
	ldrb r2, [r3]
	movs r1, #0x10
	movs r0, #0
	orrs r1, r2
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r2, _08086110 @ =0x0000FFEC
	strh r2, [r3, #0x16]
	movs r0, #0x14
	strh r0, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3]
	ldrb r0, [r3, #0x12]
	adds r0, #1
	strb r0, [r3, #0x12]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _08086170
	lsls r0, r0, #2
	ldr r1, _08086114 @ =_08086118
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, r3, #0
	mov pc, r0
	.align 2, 0
_0808610C: .4byte gCurrentProjectile
_08086110: .4byte 0x0000FFEC
_08086114: .4byte _08086118
_08086118: @ jump table
	.4byte _08086170 @ case 0
	.4byte _08086144 @ case 1
	.4byte _0808612C @ case 2
	.4byte _08086160 @ case 3
	.4byte _08086154 @ case 4
_0808612C:
	ldr r1, _0808613C @ =gCurrentProjectile
	ldrb r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08086140 @ =sOam_58de54
	b _08086174
	.align 2, 0
_0808613C: .4byte gCurrentProjectile
_08086140: .4byte sOam_58de54
_08086144:
	ldr r1, _0808614C @ =gCurrentProjectile
	ldr r0, _08086150 @ =sOam_58de54
	b _08086174
	.align 2, 0
_0808614C: .4byte gCurrentProjectile
_08086150: .4byte sOam_58de54
_08086154:
	ldr r0, _08086168 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_08086160:
	ldr r0, _0808616C @ =sOam_58de6c
	str r0, [r2, #4]
	b _08086176
	.align 2, 0
_08086168: .4byte gCurrentProjectile
_0808616C: .4byte sOam_58de6c
_08086170:
	ldr r1, _0808617C @ =gCurrentProjectile
	ldr r0, _08086180 @ =sOam_58de3c
_08086174:
	str r0, [r1, #4]
_08086176:
	pop {r0}
	bx r0
	.align 2, 0
_0808617C: .4byte gCurrentProjectile
_08086180: .4byte sOam_58de3c

	thumb_func_start ProjectileChargedPlasmaBeamSubroutine
ProjectileChargedPlasmaBeamSubroutine: @ 0x08086184
	push {r4, lr}
	ldr r1, _080861B8 @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _08086198
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bhi _08086198
	bl ProjectileMovePart
_08086198:
	ldr r0, _080861BC @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _080861C0
	ldr r1, _080861B8 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #6
	bl ParticleSet
	b _08086206
	.align 2, 0
_080861B8: .4byte gCurrentProjectile
_080861BC: .4byte gCurrentClipdataAffectingAction
_080861C0:
	ldr r4, _080861D8 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080861DC
	cmp r0, #1
	beq _080861E2
	cmp r0, #8
	bhi _080861F0
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080861F0
	.align 2, 0
_080861D8: .4byte gCurrentProjectile
_080861DC:
	bl ProjectileChargedPlasmaBeamInit
	b _080861E8
_080861E2:
	movs r0, #0x10
	bl ProjectileMove
_080861E8:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080861FE
_080861F0:
	movs r0, #0x1c
	bl ProjectileMove
	movs r0, #0x12
	movs r1, #3
	bl ProjectileSetBeamTrail
_080861FE:
	ldr r1, _0808620C @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08086206:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808620C: .4byte gCurrentProjectile

	thumb_func_start ProjectilePlasmaBeamInit
ProjectilePlasmaBeamInit: @ 0x08086210
	push {lr}
	movs r0, #0xcb
	bl SoundPlay
	ldr r3, _08086254 @ =gCurrentProjectile
	ldrb r2, [r3]
	movs r1, #0x10
	movs r0, #0
	orrs r1, r2
	strb r0, [r3, #0xe]
	strh r0, [r3, #0xc]
	movs r0, #0x10
	strb r0, [r3, #0x14]
	strb r0, [r3, #0x15]
	ldr r2, _08086258 @ =0x0000FFF4
	strh r2, [r3, #0x16]
	movs r0, #0xc
	strh r0, [r3, #0x18]
	strh r2, [r3, #0x1a]
	strh r0, [r3, #0x1c]
	movs r0, #0xfb
	ands r1, r0
	strb r1, [r3]
	ldrb r0, [r3, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _080862B8
	lsls r0, r0, #2
	ldr r1, _0808625C @ =_08086260
	adds r0, r0, r1
	ldr r0, [r0]
	adds r2, r3, #0
	mov pc, r0
	.align 2, 0
_08086254: .4byte gCurrentProjectile
_08086258: .4byte 0x0000FFF4
_0808625C: .4byte _08086260
_08086260: @ jump table
	.4byte _080862B8 @ case 0
	.4byte _0808628C @ case 1
	.4byte _08086274 @ case 2
	.4byte _080862A8 @ case 3
	.4byte _0808629C @ case 4
_08086274:
	ldr r1, _08086284 @ =gCurrentProjectile
	ldrb r2, [r1]
	movs r0, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08086288 @ =sOam_58de0c
	b _080862BC
	.align 2, 0
_08086284: .4byte gCurrentProjectile
_08086288: .4byte sOam_58de0c
_0808628C:
	ldr r1, _08086294 @ =gCurrentProjectile
	ldr r0, _08086298 @ =sOam_58de0c
	b _080862BC
	.align 2, 0
_08086294: .4byte gCurrentProjectile
_08086298: .4byte sOam_58de0c
_0808629C:
	ldr r0, _080862B0 @ =gCurrentProjectile
	ldrb r2, [r0]
	movs r1, #0x20
	orrs r1, r2
	strb r1, [r0]
	adds r2, r0, #0
_080862A8:
	ldr r0, _080862B4 @ =sOam_58de24
	str r0, [r2, #4]
	b _080862BE
	.align 2, 0
_080862B0: .4byte gCurrentProjectile
_080862B4: .4byte sOam_58de24
_080862B8:
	ldr r1, _080862C4 @ =gCurrentProjectile
	ldr r0, _080862C8 @ =sOam_58ddf4
_080862BC:
	str r0, [r1, #4]
_080862BE:
	pop {r0}
	bx r0
	.align 2, 0
_080862C4: .4byte gCurrentProjectile
_080862C8: .4byte sOam_58ddf4

	thumb_func_start ProjectilePlasmaBeamSubroutine
ProjectilePlasmaBeamSubroutine: @ 0x080862CC
	push {r4, lr}
	ldr r1, _08086300 @ =gCurrentProjectile
	ldrb r0, [r1, #0x13]
	cmp r0, #0
	beq _080862E0
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bhi _080862E0
	bl ProjectileMovePart
_080862E0:
	ldr r0, _08086304 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	cmp r0, #0
	beq _08086308
	ldr r1, _08086300 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r1, #8]
	ldrh r1, [r1, #0xa]
	movs r2, #6
	bl ParticleSet
	b _08086346
	.align 2, 0
_08086300: .4byte gCurrentProjectile
_08086304: .4byte gCurrentClipdataAffectingAction
_08086308:
	ldr r4, _08086320 @ =gCurrentProjectile
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08086324
	cmp r0, #1
	beq _0808632A
	cmp r0, #8
	bhi _08086338
	adds r0, #1
	strb r0, [r4, #0x12]
	b _08086338
	.align 2, 0
_08086320: .4byte gCurrentProjectile
_08086324:
	bl ProjectilePlasmaBeamInit
	b _08086330
_0808632A:
	movs r0, #0x10
	bl ProjectileMove
_08086330:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _0808633E
_08086338:
	movs r0, #0x1c
	bl ProjectileMove
_0808633E:
	ldr r1, _0808634C @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
_08086346:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808634C: .4byte gCurrentProjectile

	thumb_func_start ProjectileChargedWaveBeamInit
ProjectileChargedWaveBeamInit: @ 0x08086350
	push {r4, lr}
	ldr r0, _08086370 @ =gEquipment
	ldrb r4, [r0, #0xa]
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _0808637C
	movs r0, #0xf1
	bl SoundPlay
	ldr r0, _08086374 @ =gCurrentProjectile
	ldr r2, _08086378 @ =0x0000FFF4
	strh r2, [r0, #0x16]
	movs r1, #0xc
	b _0808638A
	.align 2, 0
_08086370: .4byte gEquipment
_08086374: .4byte gCurrentProjectile
_08086378: .4byte 0x0000FFF4
_0808637C:
	movs r0, #0xf0
	bl SoundPlay
	ldr r0, _080863C0 @ =gCurrentProjectile
	ldr r2, _080863C4 @ =0x0000FFEC
	strh r2, [r0, #0x16]
	movs r1, #0x14
_0808638A:
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldr r1, _080863C0 @ =gCurrentProjectile
	ldrb r3, [r1]
	movs r2, #0x18
	movs r0, #0
	orrs r2, r3
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r0, #0x10
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	movs r0, #0xfb
	ands r2, r0
	strb r2, [r1]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _08086438
	lsls r0, r0, #2
	ldr r1, _080863C8 @ =_080863CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080863C0: .4byte gCurrentProjectile
_080863C4: .4byte 0x0000FFEC
_080863C8: .4byte _080863CC
_080863CC: @ jump table
	.4byte _08086438 @ case 0
	.4byte _08086400 @ case 1
	.4byte _080863E0 @ case 2
	.4byte _08086420 @ case 3
	.4byte _08086418 @ case 4
_080863E0:
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r1, r0
	strb r1, [r2]
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _080863F8
	ldr r0, _080863F4 @ =sOam_58e218
	b _0808644A
	.align 2, 0
_080863F4: .4byte sOam_58e218
_080863F8:
	ldr r0, _080863FC @ =sOam_58dfac
	b _0808644A
	.align 2, 0
_080863FC: .4byte sOam_58dfac
_08086400:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _08086410
	ldr r0, _0808640C @ =sOam_58e218
	b _0808644A
	.align 2, 0
_0808640C: .4byte sOam_58e218
_08086410:
	ldr r0, _08086414 @ =sOam_58dfac
	b _0808644A
	.align 2, 0
_08086414: .4byte sOam_58dfac
_08086418:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08086420:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _08086430
	ldr r0, _0808642C @ =sOam_58e228
	b _0808644A
	.align 2, 0
_0808642C: .4byte sOam_58e228
_08086430:
	ldr r0, _08086434 @ =sOam_58dfc4
	b _0808644A
	.align 2, 0
_08086434: .4byte sOam_58dfc4
_08086438:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _08086448
	ldr r0, _08086444 @ =sOam_58e208
	b _0808644A
	.align 2, 0
_08086444: .4byte sOam_58e208
_08086448:
	ldr r0, _08086454 @ =sOam_58df94
_0808644A:
	str r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086454: .4byte sOam_58df94

	thumb_func_start ProjectileChargedWaveBeamSubroutine
ProjectileChargedWaveBeamSubroutine: @ 0x08086458
	push {r4, lr}
	ldr r4, _08086498 @ =gCurrentProjectile
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _08086466
	bl ProjectileMoveWaveBeamParts
_08086466:
	ldr r1, _0808649C @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	bl ProjectileCheckHittingSolid
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080864A4
	cmp r0, #1
	beq _080864AA
	movs r0, #0x1c
	bl ProjectileMove
	ldr r0, _080864A0 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080864B8
	movs r0, #0x14
	movs r1, #3
	bl ProjectileSetBeamTrail
	b _080864C0
	.align 2, 0
_08086498: .4byte gCurrentProjectile
_0808649C: .4byte gCurrentClipdataAffectingAction
_080864A0: .4byte gEquipment
_080864A4:
	bl ProjectileChargedWaveBeamInit
	b _080864B0
_080864AA:
	movs r0, #0x10
	bl ProjectileMove
_080864B0:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	b _080864C0
_080864B8:
	movs r0, #0x13
	movs r1, #3
	bl ProjectileSetBeamTrail
_080864C0:
	ldr r1, _080864D0 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080864D0: .4byte gCurrentProjectile

	thumb_func_start ProjectileWaveBeamInit
ProjectileWaveBeamInit: @ 0x080864D4
	push {r4, lr}
	ldr r0, _080864F4 @ =gEquipment
	ldrb r4, [r0, #0xa]
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _08086500
	movs r0, #0xcd
	bl SoundPlay
	ldr r0, _080864F8 @ =gCurrentProjectile
	ldr r2, _080864FC @ =0x0000FFF4
	strh r2, [r0, #0x16]
	movs r1, #0xc
	b _0808650E
	.align 2, 0
_080864F4: .4byte gEquipment
_080864F8: .4byte gCurrentProjectile
_080864FC: .4byte 0x0000FFF4
_08086500:
	movs r0, #0xcc
	bl SoundPlay
	ldr r0, _08086544 @ =gCurrentProjectile
	ldr r2, _08086548 @ =0x0000FFEC
	strh r2, [r0, #0x16]
	movs r1, #0x14
_0808650E:
	strh r1, [r0, #0x18]
	strh r2, [r0, #0x1a]
	strh r1, [r0, #0x1c]
	ldr r1, _08086544 @ =gCurrentProjectile
	ldrb r3, [r1]
	movs r2, #0x18
	movs r0, #0
	orrs r2, r3
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r0, #0x10
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	movs r0, #0xfb
	ands r2, r0
	strb r2, [r1]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _080865BC
	lsls r0, r0, #2
	ldr r1, _0808654C @ =_08086550
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086544: .4byte gCurrentProjectile
_08086548: .4byte 0x0000FFEC
_0808654C: .4byte _08086550
_08086550: @ jump table
	.4byte _080865BC @ case 0
	.4byte _08086584 @ case 1
	.4byte _08086564 @ case 2
	.4byte _080865A4 @ case 3
	.4byte _0808659C @ case 4
_08086564:
	ldrb r0, [r2]
	movs r1, #0x20
	orrs r1, r0
	strb r1, [r2]
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _0808657C
	ldr r0, _08086578 @ =sOam_58e1e8
	b _080865CE
	.align 2, 0
_08086578: .4byte sOam_58e1e8
_0808657C:
	ldr r0, _08086580 @ =sOam_58df74
	b _080865CE
	.align 2, 0
_08086580: .4byte sOam_58df74
_08086584:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _08086594
	ldr r0, _08086590 @ =sOam_58e1e8
	b _080865CE
	.align 2, 0
_08086590: .4byte sOam_58e1e8
_08086594:
	ldr r0, _08086598 @ =sOam_58df74
	b _080865CE
	.align 2, 0
_08086598: .4byte sOam_58df74
_0808659C:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_080865A4:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _080865B4
	ldr r0, _080865B0 @ =sOam_58e1f8
	b _080865CE
	.align 2, 0
_080865B0: .4byte sOam_58e1f8
_080865B4:
	ldr r0, _080865B8 @ =sOam_58df84
	b _080865CE
	.align 2, 0
_080865B8: .4byte sOam_58df84
_080865BC:
	movs r0, #0x10
	ands r4, r0
	cmp r4, #0
	beq _080865CC
	ldr r0, _080865C8 @ =sOam_58e1d8
	b _080865CE
	.align 2, 0
_080865C8: .4byte sOam_58e1d8
_080865CC:
	ldr r0, _080865D8 @ =sOam_58df64
_080865CE:
	str r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080865D8: .4byte sOam_58df64

	thumb_func_start ProjectileWaveBeamSubroutine
ProjectileWaveBeamSubroutine: @ 0x080865DC
	push {r4, lr}
	ldr r4, _0808661C @ =gCurrentProjectile
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _080865EA
	bl ProjectileMoveWaveBeamParts
_080865EA:
	ldr r1, _08086620 @ =gCurrentClipdataAffectingAction
	movs r0, #6
	strb r0, [r1]
	bl ProjectileCheckHittingSolid
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _08086628
	cmp r0, #1
	beq _0808662E
	movs r0, #0x1c
	bl ProjectileMove
	ldr r0, _08086624 @ =gEquipment
	ldrb r1, [r0, #0xa]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0808663A
	movs r0, #0xe
	movs r1, #3
	bl ProjectileSetBeamTrail
	b _0808663A
	.align 2, 0
_0808661C: .4byte gCurrentProjectile
_08086620: .4byte gCurrentClipdataAffectingAction
_08086624: .4byte gEquipment
_08086628:
	bl ProjectileWaveBeamInit
	b _08086634
_0808662E:
	movs r0, #0x10
	bl ProjectileMove
_08086634:
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
_0808663A:
	ldr r1, _08086648 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086648: .4byte gCurrentProjectile

	thumb_func_start ProjectileFlareLoadGraphics
ProjectileFlareLoadGraphics: @ 0x0808664C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _08086668 @ =gCurrentProjectile
	ldrb r0, [r0, #0x10]
	subs r0, #1
	cmp r0, #4
	bhi _080866DC
	lsls r0, r0, #2
	ldr r1, _0808666C @ =_08086670
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086668: .4byte gCurrentProjectile
_0808666C: .4byte _08086670
_08086670: @ jump table
	.4byte _080866DC @ case 0
	.4byte _08086684 @ case 1
	.4byte _08086684 @ case 2
	.4byte _080866B0 @ case 3
	.4byte _080866B0 @ case 4
_08086684:
	ldr r1, _0808669C @ =0x040000D4
	lsls r2, r2, #8
	ldr r0, _080866A0 @ =sFlareDiagonalGfx_Top
	adds r0, r2, r0
	str r0, [r1]
	ldr r0, _080866A4 @ =0x06011280
	str r0, [r1, #4]
	ldr r3, _080866A8 @ =0x80000080
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080866AC @ =sFlareDiagonalGfx_Bottom
	b _080866F2
	.align 2, 0
_0808669C: .4byte 0x040000D4
_080866A0: .4byte sFlareDiagonalGfx_Top
_080866A4: .4byte 0x06011280
_080866A8: .4byte 0x80000080
_080866AC: .4byte sFlareDiagonalGfx_Bottom
_080866B0:
	ldr r1, _080866C8 @ =0x040000D4
	lsls r2, r2, #8
	ldr r0, _080866CC @ =sFlareVerticalGfx_Top
	adds r0, r2, r0
	str r0, [r1]
	ldr r0, _080866D0 @ =0x06011280
	str r0, [r1, #4]
	ldr r3, _080866D4 @ =0x80000080
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080866D8 @ =sFlareVerticalGfx_Bottom
	b _080866F2
	.align 2, 0
_080866C8: .4byte 0x040000D4
_080866CC: .4byte sFlareVerticalGfx_Top
_080866D0: .4byte 0x06011280
_080866D4: .4byte 0x80000080
_080866D8: .4byte sFlareVerticalGfx_Bottom
_080866DC:
	ldr r1, _08086704 @ =0x040000D4
	lsls r2, r2, #8
	ldr r0, _08086708 @ =sFlareHorizontalGfx_Top
	adds r0, r2, r0
	str r0, [r1]
	ldr r0, _0808670C @ =0x06011280
	str r0, [r1, #4]
	ldr r3, _08086710 @ =0x80000080
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08086714 @ =sFlareHorizontalGfx_Bottom
_080866F2:
	adds r2, r2, r0
	str r2, [r1]
	ldr r0, _08086718 @ =0x06011680
	str r0, [r1, #4]
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	pop {r0}
	bx r0
	.align 2, 0
_08086704: .4byte 0x040000D4
_08086708: .4byte sFlareHorizontalGfx_Top
_0808670C: .4byte 0x06011280
_08086710: .4byte 0x80000080
_08086714: .4byte sFlareHorizontalGfx_Bottom
_08086718: .4byte 0x06011680

	thumb_func_start ProjectileFlareInit
ProjectileFlareInit: @ 0x0808671C
	push {lr}
	ldr r1, _08086764 @ =gCurrentProjectile
	ldr r0, _08086768 @ =sFlareOam
	str r0, [r1, #4]
	movs r0, #0
	strb r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	movs r0, #0x10
	strb r0, [r1, #0x14]
	strb r0, [r1, #0x15]
	ldr r2, _0808676C @ =0x0000FFC0
	strh r2, [r1, #0x16]
	movs r0, #0x40
	strh r0, [r1, #0x18]
	strh r2, [r1, #0x1a]
	strh r0, [r1, #0x1c]
	ldrb r2, [r1]
	movs r0, #0xfb
	ands r0, r2
	movs r2, #8
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	ldrb r0, [r1, #0x10]
	subs r0, #1
	adds r2, r1, #0
	cmp r0, #4
	bhi _08086790
	lsls r0, r0, #2
	ldr r1, _08086770 @ =_08086774
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08086764: .4byte gCurrentProjectile
_08086768: .4byte sFlareOam
_0808676C: .4byte 0x0000FFC0
_08086770: .4byte _08086774
_08086774: @ jump table
	.4byte _08086790 @ case 0
	.4byte _08086790 @ case 1
	.4byte _08086788 @ case 2
	.4byte _08086790 @ case 3
	.4byte _08086788 @ case 4
_08086788:
	ldrb r1, [r2]
	movs r0, #0x20
	orrs r0, r1
	strb r0, [r2]
_08086790:
	movs r0, #0
	bl ProjectileFlareLoadGraphics
	movs r0, #0xf6
	bl SoundPlay
	pop {r0}
	bx r0

	thumb_func_start ProjectileFlareSubroutine
ProjectileFlareSubroutine: @ 0x080867A0
	push {lr}
	ldr r0, _080867C0 @ =gCurrentClipdataAffectingAction
	movs r1, #6
	strb r1, [r0]
	bl ProjectileCheckVerticalCollisionAtPosition
	ldr r0, _080867C4 @ =gCurrentProjectile
	ldrb r0, [r0, #0x1e]
	cmp r0, #0xa
	bhi _08086842
	lsls r0, r0, #2
	ldr r1, _080867C8 @ =_080867CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080867C0: .4byte gCurrentClipdataAffectingAction
_080867C4: .4byte gCurrentProjectile
_080867C8: .4byte _080867CC
_080867CC: @ jump table
	.4byte _080867F8 @ case 0
	.4byte _0808680C @ case 1
	.4byte _0808681C @ case 2
	.4byte _08086842 @ case 3
	.4byte _08086824 @ case 4
	.4byte _08086842 @ case 5
	.4byte _0808682C @ case 6
	.4byte _08086842 @ case 7
	.4byte _08086834 @ case 8
	.4byte _08086842 @ case 9
	.4byte _0808683C @ case 10
_080867F8:
	bl ProjectileFlareInit
	ldr r2, _08086808 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r2]
	b _08086842
	.align 2, 0
_08086808: .4byte gCurrentProjectile
_0808680C:
	ldr r2, _08086818 @ =gCurrentProjectile
	ldrb r1, [r2]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2]
	b _08086842
	.align 2, 0
_08086818: .4byte gCurrentProjectile
_0808681C:
	movs r0, #1
	bl ProjectileFlareLoadGraphics
	b _08086842
_08086824:
	movs r0, #2
	bl ProjectileFlareLoadGraphics
	b _08086842
_0808682C:
	movs r0, #3
	bl ProjectileFlareLoadGraphics
	b _08086842
_08086834:
	movs r0, #4
	bl ProjectileFlareLoadGraphics
	b _08086842
_0808683C:
	ldr r1, _08086850 @ =gCurrentProjectile
	movs r0, #0
	strb r0, [r1]
_08086842:
	ldr r1, _08086850 @ =gCurrentProjectile
	ldrb r0, [r1, #0x1e]
	adds r0, #1
	strb r0, [r1, #0x1e]
	pop {r0}
	bx r0
	.align 2, 0
_08086850: .4byte gCurrentProjectile
