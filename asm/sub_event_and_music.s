    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SubEventUpdateForSaXEncounter
SubEventUpdateForSaXEncounter: @ 0x080700BC
	push {lr}
	movs r1, #0
	ldr r0, _080700CC @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x19
	bne _080700D0
	movs r1, #0x28
	b _080700E2
	.align 2, 0
_080700CC: .4byte gEventCounter
_080700D0:
	cmp r0, #0x30
	bne _080700D8
	movs r1, #0x44
	b _080700E2
_080700D8:
	cmp r0, #0x43
	bne _080700DE
	movs r1, #0x5c
_080700DE:
	cmp r1, #0
	beq _080700EC
_080700E2:
	ldr r0, _080700F0 @ =gSubEventCounter
	strh r1, [r0]
	movs r0, #8
	bl SubEventUpdateMusic
_080700EC:
	pop {r0}
	bx r0
	.align 2, 0
_080700F0: .4byte gSubEventCounter

	thumb_func_start SubEventUpdateForAbility
SubEventUpdateForAbility: @ 0x080700F4
	push {lr}
	ldr r1, _08070114 @ =sAbilityRamValues
	ldr r0, _08070118 @ =gAbilityCount
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r1, [r0, #6]
	cmp r1, #0
	beq _08070110
	ldr r0, _0807011C @ =gSubEventCounter
	strh r1, [r0]
	movs r0, #9
	bl SubEventUpdateMusic
_08070110:
	pop {r0}
	bx r0
	.align 2, 0
_08070114: .4byte sAbilityRamValues
_08070118: .4byte gAbilityCount
_0807011C: .4byte gSubEventCounter

	thumb_func_start SubEventUpdateForNavCounversation
SubEventUpdateForNavCounversation: @ 0x08070120
	push {r4, r5, lr}
	movs r3, #0
	ldr r5, _08070128 @ =gSubEventCounter
	b _08070132
	.align 2, 0
_08070128: .4byte gSubEventCounter
_0807012C:
	cmp r1, r0
	blo _08070154
	adds r3, #1
_08070132:
	cmp r3, #0x15
	bhi _08070154
	ldr r1, _0807015C @ =gPreviousNavigationConversation
	ldr r4, _08070160 @ =0x0879BBCC
	lsls r2, r3, #2
	adds r0, r2, r4
	ldrb r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0807012C
	adds r0, r4, #2
	adds r0, r2, r0
	ldrh r0, [r0]
	strh r0, [r5]
	movs r0, #7
	bl SubEventUpdateMusic
_08070154:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807015C: .4byte gPreviousNavigationConversation
_08070160: .4byte 0x0879BBCC

	thumb_func_start SubEventUpdate
SubEventUpdate: @ 0x08070164
	push {lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldr r2, _0807017C @ =gSubEventCounter
	strh r0, [r2]
	adds r0, r1, #0
	bl SubEventUpdateMusic
	pop {r0}
	bx r0
	.align 2, 0
_0807017C: .4byte gSubEventCounter

	thumb_func_start SubEventUpdateMusic
SubEventUpdateMusic: @ 0x08070180
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r0, _080701BC @ =gCurrentArea
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #6
	bls _08070194
	bl _0807159A
_08070194:
	ldr r6, _080701C0 @ =gSubEventCounter
	cmp r4, #0x80
	beq _080701D2
	ldr r1, _080701C4 @ =0x0879BC24
	ldrh r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080701D2
	cmp r4, r0
	beq _080701D2
	cmp r0, #0x20
	beq _080701B2
	bl _0807159A
_080701B2:
	cmp r4, #0x21
	bne _080701C8
	movs r3, #1
	b _080701D2
	.align 2, 0
_080701BC: .4byte gCurrentArea
_080701C0: .4byte gSubEventCounter
_080701C4: .4byte 0x0879BC24
_080701C8:
	cmp r4, #0x22
	beq _080701D0
	bl _0807159A
_080701D0:
	movs r3, #2
_080701D2:
	movs r5, #0
	ldrh r0, [r6]
	cmp r0, #0x9b
	bls _080701DE
	bl _0807158A
_080701DE:
	lsls r0, r0, #2
	ldr r1, _080701E8 @ =_080701EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080701E8: .4byte _080701EC
_080701EC: @ jump table
	.4byte _08071588 @ case 0
	.4byte _0807045C @ case 1
	.4byte _08070464 @ case 2
	.4byte _08071588 @ case 3
	.4byte _080704A4 @ case 4
	.4byte _08071588 @ case 5
	.4byte _080704CC @ case 6
	.4byte _080704D6 @ case 7
	.4byte _080704F0 @ case 8
	.4byte _08070530 @ case 9
	.4byte _08071588 @ case 10
	.4byte _08070588 @ case 11
	.4byte _080705AC @ case 12
	.4byte _080705D4 @ case 13
	.4byte _08071588 @ case 14
	.4byte _08070614 @ case 15
	.4byte _08071588 @ case 16
	.4byte _0807063C @ case 17
	.4byte _0807064A @ case 18
	.4byte _08070652 @ case 19
	.4byte _0807065E @ case 20
	.4byte _0807066C @ case 21
	.4byte _08070674 @ case 22
	.4byte _08071588 @ case 23
	.4byte _0807069C @ case 24
	.4byte _08071588 @ case 25
	.4byte _080706DC @ case 26
	.4byte _0807071C @ case 27
	.4byte _08070744 @ case 28
	.4byte _08070776 @ case 29
	.4byte _080707A4 @ case 30
	.4byte _080707C0 @ case 31
	.4byte _080707EC @ case 32
	.4byte _08071588 @ case 33
	.4byte _08070814 @ case 34
	.4byte _08071588 @ case 35
	.4byte _08071588 @ case 36
	.4byte _08070854 @ case 37
	.4byte _08071588 @ case 38
	.4byte _08070894 @ case 39
	.4byte _080708D4 @ case 40
	.4byte _080708E2 @ case 41
	.4byte _08071588 @ case 42
	.4byte _08071588 @ case 43
	.4byte _08070920 @ case 44
	.4byte _0807092A @ case 45
	.4byte _08070944 @ case 46
	.4byte _08071588 @ case 47
	.4byte _0807096C @ case 48
	.4byte _080709AC @ case 49
	.4byte _080709EC @ case 50
	.4byte _08071588 @ case 51
	.4byte _08070A2C @ case 52
	.4byte _08071588 @ case 53
	.4byte _08070A6C @ case 54
	.4byte _08071588 @ case 55
	.4byte _08070AA8 @ case 56
	.4byte _08070AE4 @ case 57
	.4byte _08071588 @ case 58
	.4byte _08070B28 @ case 59
	.4byte _08070B68 @ case 60
	.4byte _08070B88 @ case 61
	.4byte _08071588 @ case 62
	.4byte _08070BB0 @ case 63
	.4byte _08070BBA @ case 64
	.4byte _08070BCE @ case 65
	.4byte _08071588 @ case 66
	.4byte _08070C06 @ case 67
	.4byte _08070BF8 @ case 68
	.4byte _08070C44 @ case 69
	.4byte _08070C80 @ case 70
	.4byte _08071588 @ case 71
	.4byte _08070CC0 @ case 72
	.4byte _08071588 @ case 73
	.4byte _08070D00 @ case 74
	.4byte _08071588 @ case 75
	.4byte _08071588 @ case 76
	.4byte _08070D40 @ case 77
	.4byte _08070D94 @ case 78
	.4byte _08071588 @ case 79
	.4byte _08071588 @ case 80
	.4byte _08071588 @ case 81
	.4byte _08070DAC @ case 82
	.4byte _08071588 @ case 83
	.4byte _08070DE8 @ case 84
	.4byte _08070E24 @ case 85
	.4byte _08071588 @ case 86
	.4byte _08070E68 @ case 87
	.4byte _08071588 @ case 88
	.4byte _08070E80 @ case 89
	.4byte _08071588 @ case 90
	.4byte _08070EB4 @ case 91
	.4byte _08070EE8 @ case 92
	.4byte _08070EF4 @ case 93
	.4byte _08071588 @ case 94
	.4byte _08070F30 @ case 95
	.4byte _08070F3C @ case 96
	.4byte _08070F60 @ case 97
	.4byte _08071588 @ case 98
	.4byte _08070F70 @ case 99
	.4byte _08070F78 @ case 100
	.4byte _08070F7E @ case 101
	.4byte _08070FB4 @ case 102
	.4byte _08071588 @ case 103
	.4byte _08070FE8 @ case 104
	.4byte _08071030 @ case 105
	.4byte _0807104C @ case 106
	.4byte _08071052 @ case 107
	.4byte _08071058 @ case 108
	.4byte _08071588 @ case 109
	.4byte _08071078 @ case 110
	.4byte _080710AC @ case 111
	.4byte _080710E8 @ case 112
	.4byte _08071588 @ case 113
	.4byte _08071114 @ case 114
	.4byte _08071148 @ case 115
	.4byte _08071164 @ case 116
	.4byte _08071588 @ case 117
	.4byte _08071198 @ case 118
	.4byte _08071588 @ case 119
	.4byte _080711CC @ case 120
	.4byte _08071200 @ case 121
	.4byte _08071588 @ case 122
	.4byte _08071234 @ case 123
	.4byte _08071268 @ case 124
	.4byte _08071588 @ case 125
	.4byte _08071588 @ case 126
	.4byte _08071588 @ case 127
	.4byte _0807129C @ case 128
	.4byte _080712BC @ case 129
	.4byte _080712D0 @ case 130
	.4byte _08071588 @ case 131
	.4byte _080712F0 @ case 132
	.4byte _0807132C @ case 133
	.4byte _08071588 @ case 134
	.4byte _08071336 @ case 135
	.4byte _08071588 @ case 136
	.4byte _08071380 @ case 137
	.4byte _080713A0 @ case 138
	.4byte _080713E0 @ case 139
	.4byte _080713E8 @ case 140
	.4byte _08071434 @ case 141
	.4byte _08071442 @ case 142
	.4byte _08071588 @ case 143
	.4byte _08071588 @ case 144
	.4byte _08071448 @ case 145
	.4byte _08071452 @ case 146
	.4byte _08071468 @ case 147
	.4byte _0807149C @ case 148
	.4byte _08071588 @ case 149
	.4byte _080714C8 @ case 150
	.4byte _08071500 @ case 151
	.4byte _08071588 @ case 152
	.4byte _0807151C @ case 153
	.4byte _08071588 @ case 154
	.4byte _08071554 @ case 155
_0807045C:
	movs r0, #0x1e
	movs r1, #2
	bl _08071584
_08070464:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807046E
	bl _0807158A
_0807046E:
	cmp r3, #1
	bne _0807047E
	ldr r0, _0807049C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _0807047E
	bl _0807152E
_0807047E:
	cmp r3, #2
	beq _08070486
	bl _0807158A
_08070486:
	ldr r0, _080704A0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08070492
	bl _0807158A
_08070492:
	movs r0, #0x2b
	movs r1, #2
	bl _08071584
	.align 2, 0
_0807049C: .4byte gDestinationDoor
_080704A0: .4byte gCurrentRoom
_080704A4:
	ldr r0, _080704C8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _080704B0
	bl _0807158A
_080704B0:
	cmp r3, #1
	bne _080704B8
	bl _0807152E
_080704B8:
	cmp r3, #2
	beq _080704C0
	bl _0807158A
_080704C0:
	movs r0, #0x2c
	movs r1, #2
	bl _08071584
	.align 2, 0
_080704C8: .4byte gCurrentNavigationRoom
_080704CC:
	movs r0, #0xb4
	bl MusicFade
	bl _08071588
_080704D6:
	ldr r0, _080704EC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #0
	beq _080704E2
	bl _0807158A
_080704E2:
	movs r0, #3
	movs r1, #2
	bl _08071584
	.align 2, 0
_080704EC: .4byte gLastElevatorUsed
_080704F0:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080704FA
	bl _0807158A
_080704FA:
	cmp r3, #1
	bne _0807050A
	ldr r0, _08070528 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _0807050A
	bl _0807152E
_0807050A:
	cmp r3, #2
	beq _08070512
	bl _0807158A
_08070512:
	ldr r0, _0807052C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xd
	beq _0807051E
	bl _0807158A
_0807051E:
	movs r0, #0x2e
	movs r1, #2
	bl _08071584
	.align 2, 0
_08070528: .4byte gDestinationDoor
_0807052C: .4byte gCurrentRoom
_08070530:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807053A
	bl _0807158A
_0807053A:
	cmp r3, #1
	bne _08070554
	ldr r0, _08070550 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _08070554
	movs r0, #0x3c
	bl MusicFade
	b _0807056A
	.align 2, 0
_08070550: .4byte gDestinationDoor
_08070554:
	cmp r3, #2
	bne _0807056A
	ldr r0, _08070580 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3c
	bne _0807056A
	movs r0, #0x1e
	movs r1, #2
	bl MusicPlay
	movs r5, #1
_0807056A:
	cmp r5, #0
	bne _08070572
	bl _0807158A
_08070572:
	movs r5, #2
	ldr r1, _08070584 @ =gSubEventCounter
	movs r0, #8
	strh r0, [r1]
	bl _0807158A
	.align 2, 0
_08070580: .4byte gCurrentRoom
_08070584: .4byte gSubEventCounter
_08070588:
	ldr r0, _080705A8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #3
	beq _08070594
	bl _0807158A
_08070594:
	movs r0, #0x34
	movs r1, #2
	bl MusicPlay
	movs r0, #0x33
	movs r1, #0
	bl MusicPlay_38a8
	bl _08071588
	.align 2, 0
_080705A8: .4byte gCurrentNavigationRoom
_080705AC:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080705B6
	bl _0807158A
_080705B6:
	ldr r0, _080705D0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x23
	beq _080705C2
	bl _0807158A
_080705C2:
	movs r0, #0x1e
	movs r1, #0x2c
	movs r2, #2
	bl unk_372c
	bl _08071588
	.align 2, 0
_080705D0: .4byte gCurrentRoom
_080705D4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080705DE
	bl _0807158A
_080705DE:
	cmp r3, #1
	bne _080705EE
	ldr r0, _0807060C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x26
	bne _080705EE
	bl _0807152E
_080705EE:
	cmp r3, #2
	beq _080705F6
	bl _0807158A
_080705F6:
	ldr r0, _08070610 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x26
	beq _08070602
	bl _0807158A
_08070602:
	movs r0, #0x18
	movs r1, #2
	bl _08071584
	.align 2, 0
_0807060C: .4byte gDestinationDoor
_08070610: .4byte gCurrentRoom
_08070614:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0807061E
	bl _0807158A
_0807061E:
	ldr r0, _08070638 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _0807062A
	bl _0807158A
_0807062A:
	movs r0, #0x1e
	movs r1, #0x2c
	movs r2, #2
	bl unk_372c
	bl _08071588
	.align 2, 0
_08070638: .4byte gCurrentRoom
_0807063C:
	bl MusicStop
	movs r0, #0xfc
	bl SoundStop
	bl _08071588
_0807064A:
	movs r0, #0x31
	movs r1, #2
	bl _08071584
_08070652:
	movs r0, #0x96
	lsls r0, r0, #1
	bl MusicFade
	bl _08071588
_0807065E:
	ldr r0, _08070668 @ =0x00000229
	bl SoundPlay_3b1c
	bl _08071588
	.align 2, 0
_08070668: .4byte 0x00000229
_0807066C:
	movs r0, #0x1e
	movs r1, #2
	bl _08071584
_08070674:
	ldr r0, _08070698 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070680
	bl _0807158A
_08070680:
	cmp r3, #1
	bne _08070688
	bl _0807152E
_08070688:
	cmp r3, #2
	beq _08070690
	bl _0807158A
_08070690:
	movs r0, #0xb
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070698: .4byte gCurrentNavigationRoom
_0807069C:
	ldrb r0, [r2]
	cmp r0, #1
	beq _080706A6
	bl _0807158A
_080706A6:
	cmp r3, #1
	bne _080706B6
	ldr r0, _080706D4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x28
	bne _080706B6
	bl _0807152E
_080706B6:
	cmp r3, #2
	beq _080706BE
	bl _0807158A
_080706BE:
	ldr r0, _080706D8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x28
	beq _080706CA
	bl _0807158A
_080706CA:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_080706D4: .4byte gDestinationDoor
_080706D8: .4byte gCurrentRoom
_080706DC:
	ldrb r0, [r2]
	cmp r0, #1
	beq _080706E6
	bl _0807158A
_080706E6:
	cmp r3, #1
	bne _080706F6
	ldr r0, _08070714 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x28
	beq _080706F6
	bl _0807152E
_080706F6:
	cmp r3, #2
	beq _080706FE
	bl _0807158A
_080706FE:
	ldr r0, _08070718 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x28
	bne _0807070A
	bl _0807158A
_0807070A:
	movs r0, #4
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070714: .4byte gDestinationDoor
_08070718: .4byte gCurrentRoom
_0807071C:
	ldr r0, _08070740 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070728
	bl _0807158A
_08070728:
	cmp r3, #1
	bne _08070730
	bl _0807152E
_08070730:
	cmp r3, #2
	beq _08070738
	bl _0807158A
_08070738:
	movs r0, #0xb
	movs r1, #3
	bl _08071584
	.align 2, 0
_08070740: .4byte gCurrentNavigationRoom
_08070744:
	ldrb r0, [r2]
	cmp r0, #1
	beq _0807074E
	bl _0807158A
_0807074E:
	cmp r4, #0x21
	bne _08070768
	ldr r0, _08070764 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #1
	bne _08070768
	movs r0, #0x3c
	bl MusicFade
	bl _08071588
	.align 2, 0
_08070764: .4byte gDestinationDoor
_08070768:
	cmp r4, #7
	beq _08070770
	bl _0807158A
_08070770:
	movs r0, #0x1e
	bl _08071130
_08070776:
	ldrb r0, [r2]
	cmp r0, #1
	beq _08070780
	bl _0807158A
_08070780:
	ldr r0, _0807079C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #1
	beq _0807078C
	bl _0807158A
_0807078C:
	movs r0, #4
	movs r1, #0
	bl MusicPlay
	ldr r1, _080707A0 @ =gSubEventCounter
	movs r0, #0x1e
	bl _08071106
	.align 2, 0
_0807079C: .4byte gCurrentRoom
_080707A0: .4byte gSubEventCounter
_080707A4:
	ldr r0, _080707BC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #3
	beq _080707B0
	bl _0807158A
_080707B0:
	movs r0, #0x96
	lsls r0, r0, #1
	bl MusicFade
	bl _08071588
	.align 2, 0
_080707BC: .4byte gLastElevatorUsed
_080707C0:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080707CA
	bl _0807158A
_080707CA:
	ldr r0, _080707E8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1d
	beq _080707D6
	bl _0807158A
_080707D6:
	movs r1, #0x96
	lsls r1, r1, #1
	movs r0, #0x1e
	movs r2, #4
	bl unk_3778
	bl _08071588
	.align 2, 0
_080707E8: .4byte gCurrentRoom
_080707EC:
	ldr r0, _08070810 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #6
	beq _080707F8
	bl _0807158A
_080707F8:
	cmp r3, #1
	bne _08070800
	bl _0807152E
_08070800:
	cmp r3, #2
	beq _08070808
	bl _0807158A
_08070808:
	movs r0, #0xb
	movs r1, #4
	bl _08071584
	.align 2, 0
_08070810: .4byte gCurrentNavigationRoom
_08070814:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807081E
	bl _0807158A
_0807081E:
	cmp r3, #1
	bne _0807082E
	ldr r0, _0807084C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807082E
	bl _0807152E
_0807082E:
	cmp r3, #2
	beq _08070836
	bl _0807158A
_08070836:
	ldr r0, _08070850 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070842
	bl _0807158A
_08070842:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_0807084C: .4byte gDestinationDoor
_08070850: .4byte gCurrentRoom
_08070854:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807085E
	bl _0807158A
_0807085E:
	cmp r3, #1
	bne _0807086E
	ldr r0, _0807088C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _0807086E
	bl _0807152E
_0807086E:
	cmp r3, #2
	beq _08070876
	bl _0807158A
_08070876:
	ldr r0, _08070890 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _08070882
	bl _0807158A
_08070882:
	movs r0, #0x18
	movs r1, #4
	bl _08071584
	.align 2, 0
_0807088C: .4byte gDestinationDoor
_08070890: .4byte gCurrentRoom
_08070894:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807089E
	bl _0807158A
_0807089E:
	cmp r3, #1
	bne _080708AE
	ldr r0, _080708CC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x12
	beq _080708AE
	bl _0807152E
_080708AE:
	cmp r3, #2
	beq _080708B6
	bl _0807158A
_080708B6:
	ldr r0, _080708D0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x12
	bne _080708C2
	bl _0807158A
_080708C2:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_080708CC: .4byte gDestinationDoor
_080708D0: .4byte gCurrentRoom
_080708D4:
	movs r0, #0x1e
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	bl _08071588
_080708E2:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080708EC
	bl _0807158A
_080708EC:
	cmp r3, #1
	bne _080708FC
	ldr r0, _08070918 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2d
	beq _080708FC
	bl _0807152E
_080708FC:
	cmp r3, #2
	beq _08070904
	bl _0807158A
_08070904:
	ldr r0, _0807091C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2d
	bne _08070910
	bl _0807158A
_08070910:
	movs r0, #6
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070918: .4byte gDestinationDoor
_0807091C: .4byte gCurrentRoom
_08070920:
	movs r0, #0xc8
	bl MusicFade
	bl _08071588
_0807092A:
	ldr r0, _08070940 @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #3
	beq _08070936
	bl _0807158A
_08070936:
	movs r0, #0x1e
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070940: .4byte gLastElevatorUsed
_08070944:
	ldr r0, _08070968 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070950
	bl _0807158A
_08070950:
	cmp r3, #1
	bne _08070958
	bl _0807152E
_08070958:
	cmp r3, #2
	beq _08070960
	bl _0807158A
_08070960:
	movs r0, #0xb
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070968: .4byte gCurrentNavigationRoom
_0807096C:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08070976
	bl _0807158A
_08070976:
	cmp r3, #1
	bne _08070986
	ldr r0, _080709A4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070986
	bl _0807152E
_08070986:
	cmp r3, #2
	beq _0807098E
	bl _0807158A
_0807098E:
	ldr r0, _080709A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807099A
	bl _0807158A
_0807099A:
	movs r0, #9
	movs r1, #0
	bl _08071584
	.align 2, 0
_080709A4: .4byte gDestinationDoor
_080709A8: .4byte gCurrentRoom
_080709AC:
	ldrb r0, [r2]
	cmp r0, #4
	beq _080709B6
	bl _0807158A
_080709B6:
	cmp r3, #1
	bne _080709C6
	ldr r0, _080709E4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1f
	bne _080709C6
	bl _0807152E
_080709C6:
	cmp r3, #2
	beq _080709CE
	bl _0807158A
_080709CE:
	ldr r0, _080709E8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1f
	beq _080709DA
	bl _0807158A
_080709DA:
	movs r0, #0x5f
	movs r1, #5
	bl _08071584
	.align 2, 0
_080709E4: .4byte gDestinationDoor
_080709E8: .4byte gCurrentRoom
_080709EC:
	ldrb r0, [r2]
	cmp r0, #4
	beq _080709F6
	bl _0807158A
_080709F6:
	cmp r3, #1
	bne _08070A06
	ldr r0, _08070A24 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2a
	bne _08070A06
	bl _080714DA
_08070A06:
	cmp r3, #2
	beq _08070A0E
	bl _0807158A
_08070A0E:
	ldr r0, _08070A28 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2a
	beq _08070A1A
	bl _0807158A
_08070A1A:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070A24: .4byte gDestinationDoor
_08070A28: .4byte gCurrentRoom
_08070A2C:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08070A36
	bl _0807158A
_08070A36:
	cmp r3, #1
	bne _08070A46
	ldr r0, _08070A64 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2a
	beq _08070A46
	bl _0807152E
_08070A46:
	cmp r3, #2
	beq _08070A4E
	bl _0807158A
_08070A4E:
	ldr r0, _08070A68 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2a
	bne _08070A5A
	bl _0807158A
_08070A5A:
	movs r0, #9
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070A64: .4byte gDestinationDoor
_08070A68: .4byte gCurrentRoom
_08070A6C:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070A76
	bl _0807158A
_08070A76:
	cmp r3, #1
	bne _08070A82
	ldr r0, _08070AA0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070AFA
_08070A82:
	cmp r3, #2
	beq _08070A8A
	bl _0807158A
_08070A8A:
	ldr r0, _08070AA4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #4
	beq _08070A96
	bl _0807158A
_08070A96:
	movs r0, #0xf
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070AA0: .4byte gDestinationDoor
_08070AA4: .4byte gCurrentRoom
_08070AA8:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070AB2
	bl _0807158A
_08070AB2:
	cmp r3, #1
	bne _08070ABE
	ldr r0, _08070ADC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #4
	bne _08070AFA
_08070ABE:
	cmp r3, #2
	beq _08070AC6
	bl _0807158A
_08070AC6:
	ldr r0, _08070AE0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #4
	bne _08070AD2
	bl _0807158A
_08070AD2:
	movs r0, #7
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070ADC: .4byte gDestinationDoor
_08070AE0: .4byte gCurrentRoom
_08070AE4:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070AEE
	bl _0807158A
_08070AEE:
	cmp r3, #1
	bne _08070B08
	ldr r0, _08070B04 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x15
	bne _08070B08
_08070AFA:
	movs r0, #0x1e
	bl MusicFade
	bl _0807158A
	.align 2, 0
_08070B04: .4byte gDestinationDoor
_08070B08:
	cmp r3, #2
	beq _08070B10
	bl _0807158A
_08070B10:
	ldr r0, _08070B24 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _08070B1C
	bl _0807158A
_08070B1C:
	movs r0, #0xf
	movs r1, #0xa
	bl _08071584
	.align 2, 0
_08070B24: .4byte gCurrentRoom
_08070B28:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B32
	bl _0807158A
_08070B32:
	cmp r3, #1
	bne _08070B42
	ldr r0, _08070B60 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x15
	beq _08070B42
	bl _0807152E
_08070B42:
	cmp r3, #2
	beq _08070B4A
	bl _0807158A
_08070B4A:
	ldr r0, _08070B64 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x15
	bne _08070B56
	bl _0807158A
_08070B56:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070B60: .4byte gDestinationDoor
_08070B64: .4byte gCurrentRoom
_08070B68:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B72
	bl _0807158A
_08070B72:
	ldr r0, _08070B84 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x17
	beq _08070B7E
	bl _0807158A
_08070B7E:
	bl _08071588
	.align 2, 0
_08070B84: .4byte gCurrentRoom
_08070B88:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070B92
	bl _0807158A
_08070B92:
	ldr r0, _08070BAC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _08070B9E
	bl _0807158A
_08070B9E:
	movs r0, #0x14
	movs r1, #7
	movs r2, #0
	bl unk_372c
	bl _08071588
	.align 2, 0
_08070BAC: .4byte gCurrentRoom
_08070BB0:
	movs r0, #0x1e
	bl MusicFade
	bl _08071588
_08070BBA:
	movs r0, #0x78
	movs r1, #0x1e
	movs r2, #0xb
	bl unk_372c
	movs r0, #0xfc
	bl SoundPlay
	bl _08071588
_08070BCE:
	ldr r0, _08070BF4 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #9
	beq _08070BDA
	bl _0807158A
_08070BDA:
	cmp r3, #1
	bne _08070BE2
	bl _0807152E
_08070BE2:
	cmp r3, #2
	beq _08070BEA
	bl _0807158A
_08070BEA:
	movs r0, #0xb
	movs r1, #0xb
	bl _08071584
	.align 2, 0
_08070BF4: .4byte gCurrentNavigationRoom
_08070BF8:
	movs r0, #0xa
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	bl _08071588
_08070C06:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C10
	bl _0807158A
_08070C10:
	cmp r3, #1
	bne _08070C20
	ldr r0, _08070C3C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070C20
	bl _0807152E
_08070C20:
	cmp r3, #2
	beq _08070C28
	bl _0807158A
_08070C28:
	ldr r0, _08070C40 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070C34
	bl _0807158A
_08070C34:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070C3C: .4byte gDestinationDoor
_08070C40: .4byte gCurrentRoom
_08070C44:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C4E
	bl _0807158A
_08070C4E:
	cmp r3, #1
	bne _08070C5C
	ldr r0, _08070C78 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _08070C5C
	b _08070F08
_08070C5C:
	cmp r3, #2
	beq _08070C64
	bl _0807158A
_08070C64:
	ldr r0, _08070C7C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _08070C70
	bl _0807158A
_08070C70:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070C78: .4byte gDestinationDoor
_08070C7C: .4byte gCurrentRoom
_08070C80:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070C8A
	bl _0807158A
_08070C8A:
	cmp r3, #1
	bne _08070C9A
	ldr r0, _08070CB8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _08070C9A
	bl _0807152E
_08070C9A:
	cmp r3, #2
	beq _08070CA2
	bl _0807158A
_08070CA2:
	ldr r0, _08070CBC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xc
	beq _08070CAE
	bl _0807158A
_08070CAE:
	movs r0, #0x18
	movs r1, #6
	bl _08071584
	.align 2, 0
_08070CB8: .4byte gDestinationDoor
_08070CBC: .4byte gCurrentRoom
_08070CC0:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08070CCA
	bl _0807158A
_08070CCA:
	cmp r3, #1
	bne _08070CDA
	ldr r0, _08070CF8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xd
	beq _08070CDA
	bl _0807152E
_08070CDA:
	cmp r3, #2
	beq _08070CE2
	bl _0807158A
_08070CE2:
	ldr r0, _08070CFC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xd
	bne _08070CEE
	bl _0807158A
_08070CEE:
	movs r0, #0xa
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070CF8: .4byte gDestinationDoor
_08070CFC: .4byte gCurrentRoom
_08070D00:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070D0A
	bl _0807158A
_08070D0A:
	cmp r3, #1
	bne _08070D1A
	ldr r0, _08070D38 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #7
	bne _08070D1A
	bl _0807152E
_08070D1A:
	cmp r3, #2
	beq _08070D22
	bl _0807158A
_08070D22:
	ldr r0, _08070D3C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070D2E
	bl _0807158A
_08070D2E:
	movs r0, #8
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070D38: .4byte gDestinationDoor
_08070D3C: .4byte gCurrentRoom
_08070D40:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070D4A
	bl _0807158A
_08070D4A:
	cmp r3, #1
	bne _08070D64
	ldr r0, _08070D60 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070D64
	movs r0, #0x46
	bl MusicFade
	b _08070D7A
	.align 2, 0
_08070D60: .4byte gDestinationDoor
_08070D64:
	cmp r3, #2
	bne _08070D7A
	ldr r0, _08070D8C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070D7A
	movs r0, #0x5a
	movs r1, #0xb
	bl MusicPlay
	movs r5, #1
_08070D7A:
	cmp r5, #0
	bne _08070D82
	bl _0807158A
_08070D82:
	ldr r0, _08070D90 @ =0x000002CF
	bl unk_3cd4
	bl _0807158A
	.align 2, 0
_08070D8C: .4byte gCurrentRoom
_08070D90: .4byte 0x000002CF
_08070D94:
	ldr r0, _08070DA8 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #5
	beq _08070DA0
	bl _0807158A
_08070DA0:
	bl unk_3cfc
	bl _08071588
	.align 2, 0
_08070DA8: .4byte gCurrentNavigationRoom
_08070DAC:
	ldrb r0, [r2]
	cmp r0, #3
	beq _08070DB6
	bl _0807158A
_08070DB6:
	cmp r3, #1
	bne _08070DC4
	ldr r0, _08070DE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1d
	bne _08070DC4
	b _0807152E
_08070DC4:
	cmp r3, #2
	beq _08070DCC
	bl _0807158A
_08070DCC:
	ldr r0, _08070DE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1d
	beq _08070DD8
	bl _0807158A
_08070DD8:
	movs r0, #7
	movs r1, #0
	bl _08071584
	.align 2, 0
_08070DE0: .4byte gDestinationDoor
_08070DE4: .4byte gCurrentRoom
_08070DE8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070DF2
	bl _0807158A
_08070DF2:
	cmp r3, #1
	bne _08070E00
	ldr r0, _08070E1C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2e
	bne _08070E00
	b _0807152E
_08070E00:
	cmp r3, #2
	beq _08070E08
	bl _0807158A
_08070E08:
	ldr r0, _08070E20 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2e
	beq _08070E14
	bl _0807158A
_08070E14:
	movs r0, #0x5c
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070E1C: .4byte gDestinationDoor
_08070E20: .4byte gCurrentRoom
_08070E24:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070E2C
	b _0807158A
_08070E2C:
	cmp r3, #1
	bne _08070E44
	ldr r0, _08070E40 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _08070E44
	movs r0, #0x3c
	bl MusicFade
	b _08070E5A
	.align 2, 0
_08070E40: .4byte gDestinationDoor
_08070E44:
	cmp r3, #2
	bne _08070E5A
	ldr r0, _08070E64 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	bne _08070E5A
	movs r0, #0x2c
	movs r1, #0xa
	bl MusicPlay
	movs r5, #1
_08070E5A:
	cmp r5, #0
	bne _08070E60
	b _0807158A
_08070E60:
	b _08070E72
	.align 2, 0
_08070E64: .4byte gCurrentRoom
_08070E68:
	movs r0, #0x1e
	movs r1, #0x1e
	movs r2, #0
	bl unk_372c
_08070E72:
	movs r5, #2
	ldr r1, _08070E7C @ =gSubEventCounter
	movs r0, #0x54
	strh r0, [r1]
	b _0807158A
	.align 2, 0
_08070E7C: .4byte gSubEventCounter
_08070E80:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070E88
	b _0807158A
_08070E88:
	cmp r3, #1
	bne _08070E96
	ldr r0, _08070EAC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #7
	bne _08070E96
	b _0807152E
_08070E96:
	cmp r3, #2
	beq _08070E9C
	b _0807158A
_08070E9C:
	ldr r0, _08070EB0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #7
	beq _08070EA6
	b _0807158A
_08070EA6:
	movs r0, #8
	movs r1, #0
	b _08071584
	.align 2, 0
_08070EAC: .4byte gDestinationDoor
_08070EB0: .4byte gCurrentRoom
_08070EB4:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070EBC
	b _0807158A
_08070EBC:
	cmp r3, #1
	bne _08070ECA
	ldr r0, _08070EE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x2b
	bne _08070ECA
	b _0807152E
_08070ECA:
	cmp r3, #2
	beq _08070ED0
	b _0807158A
_08070ED0:
	ldr r0, _08070EE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x2b
	beq _08070EDA
	b _0807158A
_08070EDA:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070EE0: .4byte gDestinationDoor
_08070EE4: .4byte gCurrentRoom
_08070EE8:
	movs r0, #0xa
	movs r1, #0x15
	movs r2, #8
	bl unk_372c
	b _08071588
_08070EF4:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08070EFC
	b _0807158A
_08070EFC:
	cmp r3, #1
	bne _08070F14
	ldr r0, _08070F10 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _08070F14
_08070F08:
	movs r0, #0x46
	bl MusicFade
	b _0807158A
	.align 2, 0
_08070F10: .4byte gDestinationDoor
_08070F14:
	cmp r3, #2
	beq _08070F1A
	b _0807158A
_08070F1A:
	ldr r0, _08070F2C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _08070F24
	b _0807158A
_08070F24:
	movs r0, #8
	movs r1, #0
	b _08071584
	.align 2, 0
_08070F2C: .4byte gCurrentRoom
_08070F30:
	movs r0, #0x60
	movs r1, #3
	movs r2, #0xb
	bl unk_372c
	b _08071588
_08070F3C:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070F44
	b _0807158A
_08070F44:
	ldr r0, _08070F5C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1f
	beq _08070F4E
	b _0807158A
_08070F4E:
	movs r0, #0x1e
	movs r1, #0x5c
	movs r2, #0xb
	bl unk_372c
	b _08071588
	.align 2, 0
_08070F5C: .4byte gCurrentRoom
_08070F60:
	ldr r0, _08070F6C @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08070F6A
	b _0807158A
_08070F6A:
	b _08071588
	.align 2, 0
_08070F6C: .4byte gCurrentNavigationRoom
_08070F70:
	movs r0, #0
	bl MusicFade
	b _08071588
_08070F78:
	movs r0, #0x59
	movs r1, #0xa
	b _08071584
_08070F7E:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070F86
	b _0807158A
_08070F86:
	cmp r3, #1
	bne _08070F94
	ldr r0, _08070FAC @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x31
	bne _08070F94
	b _08071304
_08070F94:
	cmp r3, #2
	beq _08070F9A
	b _0807158A
_08070F9A:
	ldr r0, _08070FB0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x31
	beq _08070FA4
	b _0807158A
_08070FA4:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08070FAC: .4byte gDestinationDoor
_08070FB0: .4byte gCurrentRoom
_08070FB4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070FBC
	b _0807158A
_08070FBC:
	cmp r3, #1
	bne _08070FCA
	ldr r0, _08070FE0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x56
	bne _08070FCA
	b _08071304
_08070FCA:
	cmp r3, #2
	beq _08070FD0
	b _0807158A
_08070FD0:
	ldr r0, _08070FE4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x56
	beq _08070FDA
	b _0807158A
_08070FDA:
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_08070FE0: .4byte gDestinationDoor
_08070FE4: .4byte gCurrentRoom
_08070FE8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08070FF0
	b _0807158A
_08070FF0:
	cmp r4, #0x21
	beq _08070FF6
	b _0807158A
_08070FF6:
	ldr r0, _0807100C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _08071014
	movs r0, #0x3c
	bl MusicFade
	ldr r1, _08071010 @ =gSubEventCounter
	movs r0, #0x69
	b _08071106
	.align 2, 0
_0807100C: .4byte gDestinationDoor
_08071010: .4byte gSubEventCounter
_08071014:
	cmp r0, #0x36
	beq _0807101A
	b _0807158A
_0807101A:
	movs r0, #0x1e
	movs r1, #3
	movs r2, #0xa
	bl unk_372c
	ldr r1, _0807102C @ =gSubEventCounter
	movs r0, #0x6a
	b _08071106
	.align 2, 0
_0807102C: .4byte gSubEventCounter
_08071030:
	ldrb r0, [r2]
	cmp r0, #0
	beq _08071038
	b _0807158A
_08071038:
	ldr r0, _08071048 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x33
	beq _08071042
	b _0807158A
_08071042:
	movs r0, #3
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071048: .4byte gCurrentRoom
_0807104C:
	bl MusicStop
	b _08071588
_08071052:
	movs r0, #0x2e
	movs r1, #0xa
	b _08071584
_08071058:
	ldr r0, _08071074 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _08071062
	b _0807158A
_08071062:
	cmp r3, #1
	bne _08071068
	b _0807152E
_08071068:
	cmp r3, #2
	beq _0807106E
	b _0807158A
_0807106E:
	movs r0, #0xb
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071074: .4byte gCurrentNavigationRoom
_08071078:
	ldrb r0, [r2]
	cmp r0, #2
	beq _08071080
	b _0807158A
_08071080:
	cmp r3, #1
	bne _0807108C
	ldr r0, _080710A4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _080710C0
_0807108C:
	cmp r3, #2
	beq _08071092
	b _0807158A
_08071092:
	ldr r0, _080710A8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _0807109C
	b _0807158A
_0807109C:
	movs r0, #0x15
	movs r1, #8
	b _08071584
	.align 2, 0
_080710A4: .4byte gDestinationDoor
_080710A8: .4byte gCurrentRoom
_080710AC:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080710B4
	b _0807158A
_080710B4:
	cmp r3, #1
	bne _080710CC
	ldr r0, _080710C8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x37
	bne _080710CC
_080710C0:
	movs r0, #2
	bl MusicFade
	b _0807158A
	.align 2, 0
_080710C8: .4byte gDestinationDoor
_080710CC:
	cmp r3, #2
	beq _080710D2
	b _0807158A
_080710D2:
	ldr r0, _080710E4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x37
	beq _080710DC
	b _0807158A
_080710DC:
	movs r0, #0x1e
	movs r1, #0
	b _08071584
	.align 2, 0
_080710E4: .4byte gCurrentRoom
_080710E8:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080710F0
	b _0807158A
_080710F0:
	ldr r0, _0807110C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x18
	beq _080710FA
	b _0807158A
_080710FA:
	movs r0, #0x15
	movs r1, #8
	bl MusicPlay
	ldr r1, _08071110 @ =gSubEventCounter
	movs r0, #0x6f
_08071106:
	strh r0, [r1]
	movs r5, #2
	b _0807158A
	.align 2, 0
_0807110C: .4byte gCurrentRoom
_08071110: .4byte gSubEventCounter
_08071114:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807111C
	b _0807158A
_0807111C:
	ldr r0, _08071138 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _08071126
	b _0807158A
_08071126:
	ldr r0, _0807113C @ =gEventCounter
	ldrb r0, [r0]
	cmp r0, #0x4d
	bne _08071140
	movs r0, #0x74
_08071130:
	strh r0, [r6]
	movs r5, #2
	b _0807158A
	.align 2, 0
_08071138: .4byte gDestinationDoor
_0807113C: .4byte gEventCounter
_08071140:
	movs r0, #0x1e
	bl MusicFade
	b _08071588
_08071148:
	ldrb r0, [r2]
	cmp r0, #2
	beq _08071150
	b _0807158A
_08071150:
	ldr r0, _08071160 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _0807115A
	b _0807158A
_0807115A:
	movs r0, #6
	movs r1, #0
	b _08071584
	.align 2, 0
_08071160: .4byte gCurrentRoom
_08071164:
	ldrb r0, [r2]
	cmp r0, #2
	beq _0807116C
	b _0807158A
_0807116C:
	cmp r3, #1
	bne _0807117A
	ldr r0, _08071190 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _0807117A
	b _08071304
_0807117A:
	cmp r3, #2
	beq _08071180
	b _0807158A
_08071180:
	ldr r0, _08071194 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x16
	beq _0807118A
	b _0807158A
_0807118A:
	movs r0, #0x44
	b _08071582
	.align 2, 0
_08071190: .4byte gDestinationDoor
_08071194: .4byte gCurrentRoom
_08071198:
	ldrb r0, [r2]
	cmp r0, #2
	beq _080711A0
	b _0807158A
_080711A0:
	cmp r3, #1
	bne _080711AE
	ldr r0, _080711C4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _080711AE
	b _08071304
_080711AE:
	cmp r3, #2
	beq _080711B4
	b _0807158A
_080711B4:
	ldr r0, _080711C8 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xc
	beq _080711BE
	b _0807158A
_080711BE:
	movs r0, #6
	movs r1, #0
	b _08071584
	.align 2, 0
_080711C4: .4byte gDestinationDoor
_080711C8: .4byte gCurrentRoom
_080711CC:
	ldrb r0, [r2]
	cmp r0, #5
	beq _080711D4
	b _0807158A
_080711D4:
	cmp r3, #1
	bne _080711E2
	ldr r0, _080711F8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _080711E2
	b _08071304
_080711E2:
	cmp r3, #2
	beq _080711E8
	b _0807158A
_080711E8:
	ldr r0, _080711FC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _080711F2
	b _0807158A
_080711F2:
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080711F8: .4byte gDestinationDoor
_080711FC: .4byte gCurrentRoom
_08071200:
	ldrb r0, [r2]
	cmp r0, #5
	beq _08071208
	b _0807158A
_08071208:
	cmp r3, #1
	bne _08071214
	ldr r0, _0807122C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08071304
_08071214:
	cmp r3, #2
	beq _0807121A
	b _0807158A
_0807121A:
	ldr r0, _08071230 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x14
	beq _08071224
	b _0807158A
_08071224:
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_0807122C: .4byte gDestinationDoor
_08071230: .4byte gCurrentRoom
_08071234:
	ldrb r0, [r2]
	cmp r0, #5
	beq _0807123C
	b _0807158A
_0807123C:
	cmp r3, #1
	bne _08071248
	ldr r0, _08071260 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _08071304
_08071248:
	cmp r3, #2
	beq _0807124E
	b _0807158A
_0807124E:
	ldr r0, _08071264 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _08071258
	b _0807158A
_08071258:
	movs r0, #0x2c
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071260: .4byte gDestinationDoor
_08071264: .4byte gCurrentRoom
_08071268:
	ldrb r0, [r2]
	cmp r0, #4
	beq _08071270
	b _0807158A
_08071270:
	cmp r3, #1
	bne _0807127C
	ldr r0, _08071294 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _08071304
_0807127C:
	cmp r3, #2
	beq _08071282
	b _0807158A
_08071282:
	ldr r0, _08071298 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0xe
	beq _0807128C
	b _0807158A
_0807128C:
	movs r0, #0x3c
	movs r1, #0
	b _08071584
	.align 2, 0
_08071294: .4byte gDestinationDoor
_08071298: .4byte gCurrentRoom
_0807129C:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080712A4
	b _0807158A
_080712A4:
	ldr r0, _080712B8 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1a
	beq _080712AE
	b _0807158A
_080712AE:
	movs r0, #0xc8
	bl MusicFade
	b _08071588
	.align 2, 0
_080712B8: .4byte gDestinationDoor
_080712BC:
	ldr r0, _080712CC @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #4
	beq _080712C6
	b _0807158A
_080712C6:
	movs r0, #0x1e
	movs r1, #0xb
	b _08071584
	.align 2, 0
_080712CC: .4byte gLastElevatorUsed
_080712D0:
	ldr r0, _080712EC @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #9
	beq _080712DA
	b _0807158A
_080712DA:
	cmp r3, #1
	beq _08071304
	cmp r3, #2
	beq _080712E4
	b _0807158A
_080712E4:
	movs r0, #0xb
	movs r1, #0xb
	b _08071584
	.align 2, 0
_080712EC: .4byte gCurrentNavigationRoom
_080712F0:
	ldrb r0, [r2]
	cmp r0, #6
	beq _080712F8
	b _0807158A
_080712F8:
	cmp r3, #1
	bne _08071310
	ldr r0, _0807130C @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0
	bne _08071310
_08071304:
	movs r0, #0x32
	bl MusicFade
	b _0807158A
	.align 2, 0
_0807130C: .4byte gDestinationDoor
_08071310:
	cmp r3, #2
	beq _08071316
	b _0807158A
_08071316:
	ldr r0, _08071328 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0
	beq _08071320
	b _0807158A
_08071320:
	movs r0, #0xa
	movs r1, #0
	b _08071584
	.align 2, 0
_08071328: .4byte gCurrentRoom
_0807132C:
	movs r0, #0xb2
	lsls r0, r0, #2
	bl unk_3cd4
	b _08071588
_08071336:
	ldrb r0, [r2]
	cmp r0, #6
	beq _0807133E
	b _0807158A
_0807133E:
	cmp r3, #1
	bne _08071358
	ldr r0, _08071354 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08071358
	movs r0, #0x14
	bl MusicFade
	b _0807136E
	.align 2, 0
_08071354: .4byte gDestinationDoor
_08071358:
	cmp r3, #2
	bne _0807136E
	ldr r0, _0807137C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _0807136E
	movs r0, #0x1b
	movs r1, #7
	bl MusicPlay
	movs r5, #1
_0807136E:
	cmp r5, #0
	bne _08071374
	b _0807158A
_08071374:
	bl unk_3cfc
	b _0807158A
	.align 2, 0
_0807137C: .4byte gCurrentRoom
_08071380:
	ldrb r0, [r2]
	cmp r0, #6
	beq _08071388
	b _0807158A
_08071388:
	ldr r0, _0807139C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x10
	bne _08071392
	b _0807158A
_08071392:
	movs r0, #0xb2
	lsls r0, r0, #2
	bl unk_3cd4
	b _08071588
	.align 2, 0
_0807139C: .4byte gCurrentRoom
_080713A0:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080713A8
	b _0807158A
_080713A8:
	cmp r3, #1
	bne _080713C4
	ldr r0, _080713C0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x4e
	bne _080713C4
	movs r0, #0x28
	bl MusicFade
	bl unk_3cfc
	b _0807158A
	.align 2, 0
_080713C0: .4byte gDestinationDoor
_080713C4:
	cmp r3, #2
	beq _080713CA
	b _0807158A
_080713CA:
	ldr r0, _080713DC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x4e
	beq _080713D4
	b _0807158A
_080713D4:
	movs r0, #0x5f
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080713DC: .4byte gCurrentRoom
_080713E0:
	movs r0, #0x14
	bl MusicFade
	b _08071588
_080713E8:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080713F0
	b _0807158A
_080713F0:
	cmp r3, #1
	bne _08071408
	ldr r0, _08071404 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x4f
	bne _08071408
	movs r0, #0x3c
	bl MusicFade
	b _0807141E
	.align 2, 0
_08071404: .4byte gDestinationDoor
_08071408:
	cmp r3, #2
	bne _0807141E
	ldr r0, _0807142C @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x4f
	bne _0807141E
	movs r0, #0x17
	movs r1, #0xa
	bl MusicPlay
	movs r5, #1
_0807141E:
	cmp r5, #0
	bne _08071424
	b _0807158A
_08071424:
	ldr r0, _08071430 @ =0x000002C9
	bl unk_3cd4
	b _0807158A
	.align 2, 0
_0807142C: .4byte gCurrentRoom
_08071430: .4byte 0x000002C9
_08071434:
	movs r0, #0x96
	lsls r0, r0, #2
	bl MusicFade
	bl unk_3cfc
	b _08071588
_08071442:
	movs r0, #3
	movs r1, #0xa
	b _08071584
_08071448:
	movs r0, #0x96
	lsls r0, r0, #1
	bl MusicFade
	b _08071588
_08071452:
	ldr r0, _08071464 @ =gLastElevatorUsed
	ldrb r0, [r0]
	cmp r0, #0xa
	beq _0807145C
	b _0807158A
_0807145C:
	movs r0, #0x1e
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071464: .4byte gLastElevatorUsed
_08071468:
	ldrb r0, [r2]
	cmp r0, #1
	beq _08071470
	b _0807158A
_08071470:
	cmp r3, #1
	bne _0807147C
	ldr r0, _08071494 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _080714DA
_0807147C:
	cmp r3, #2
	beq _08071482
	b _0807158A
_08071482:
	ldr r0, _08071498 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _0807148C
	b _0807158A
_0807148C:
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071494: .4byte gDestinationDoor
_08071498: .4byte gCurrentRoom
_0807149C:
	ldrb r0, [r2]
	cmp r0, #1
	bne _0807158A
	cmp r3, #1
	bne _080714AE
	ldr r0, _080714C0 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _080714DA
_080714AE:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080714C4 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1b
	bne _0807158A
	movs r0, #0x18
	movs r1, #6
	b _08071584
	.align 2, 0
_080714C0: .4byte gDestinationDoor
_080714C4: .4byte gCurrentRoom
_080714C8:
	ldrb r0, [r2]
	cmp r0, #1
	bne _0807158A
	cmp r3, #1
	bne _080714E8
	ldr r0, _080714E4 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _080714E8
_080714DA:
	movs r0, #0x28
	bl MusicFade
	b _0807158A
	.align 2, 0
_080714E4: .4byte gDestinationDoor
_080714E8:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080714FC @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x1a
	bne _0807158A
	movs r0, #0x32
	movs r1, #0xa
	b _08071584
	.align 2, 0
_080714FC: .4byte gCurrentRoom
_08071500:
	ldr r0, _08071518 @ =gCurrentNavigationRoom
	ldrb r0, [r0]
	cmp r0, #4
	bne _0807158A
	cmp r3, #1
	beq _0807152E
	cmp r3, #2
	bne _0807158A
	movs r0, #0xb
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071518: .4byte gCurrentNavigationRoom
_0807151C:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807158A
	cmp r3, #1
	bne _0807153C
	ldr r0, _08071538 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x55
	bne _0807153C
_0807152E:
	movs r0, #0x3c
	bl MusicFade
	b _0807158A
	.align 2, 0
_08071538: .4byte gDestinationDoor
_0807153C:
	cmp r3, #2
	bne _0807158A
	ldr r0, _08071550 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x55
	bne _0807158A
	movs r0, #0x2e
	movs r1, #0xa
	b _08071584
	.align 2, 0
_08071550: .4byte gCurrentRoom
_08071554:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0807158A
	cmp r3, #1
	bne _08071574
	ldr r0, _08071570 @ =gDestinationDoor
	ldrb r0, [r0]
	cmp r0, #0x3f
	bne _08071574
	movs r0, #0
	bl MusicFade
	b _0807158A
	.align 2, 0
_08071570: .4byte gDestinationDoor
_08071574:
	cmp r3, #2
	bne _0807158A
	ldr r0, _080715A0 @ =gCurrentRoom
	ldrb r0, [r0]
	cmp r0, #0x3f
	bne _0807158A
	movs r0, #0x58
_08071582:
	movs r1, #7
_08071584:
	bl MusicPlay
_08071588:
	movs r5, #1
_0807158A:
	cmp r5, #1
	bne _0807159A
	ldr r2, _080715A4 @ =gPreviousSubEvent
	ldr r1, _080715A8 @ =gSubEventCounter
	ldrh r0, [r1]
	strh r0, [r2]
	adds r0, #1
	strh r0, [r1]
_0807159A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080715A0: .4byte gCurrentRoom
_080715A4: .4byte gPreviousSubEvent
_080715A8: .4byte gSubEventCounter
