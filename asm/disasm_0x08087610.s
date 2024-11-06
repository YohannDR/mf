    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start IntroSubroutine
IntroSubroutine: @ 0x08087610
	push {r4, r5, lr}
	movs r5, #0
	ldr r0, _0808763C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _0808767C
	ldr r3, _08087640 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r0, #3
	bne _0808764C
	ldr r0, _08087644 @ =gNonGameplayRam
	ldr r2, _08087648 @ =0x0000020E
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808767C
	strh r5, [r1]
	b _0808767C
	.align 2, 0
_0808763C: .4byte gChangedInput
_08087640: .4byte gSubGameMode1
_08087644: .4byte gNonGameplayRam
_08087648: .4byte 0x0000020E
_0808764C:
	cmp r0, #0
	beq _0808767C
	cmp r0, #3
	beq _0808767C
	ldr r2, _08087690 @ =0x04000050
	ldrh r1, [r2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08087664
	movs r0, #0xff
	strh r0, [r2]
_08087664:
	ldr r0, _08087694 @ =gNonGameplayRam
	ldr r1, _08087698 @ =0x0000020E
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #3
	strh r0, [r3]
	movs r0, #0x14
	bl unk_27e8
	movs r0, #0x14
	bl FadeMusic
_0808767C:
	ldr r4, _0808769C @ =gSubGameMode1
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #1
	beq _080876B4
	cmp r0, #1
	bgt _080876A0
	cmp r0, #0
	beq _080876AA
	b _08087700
	.align 2, 0
_08087690: .4byte 0x04000050
_08087694: .4byte gNonGameplayRam
_08087698: .4byte 0x0000020E
_0808769C: .4byte gSubGameMode1
_080876A0:
	cmp r0, #2
	beq _080876C2
	cmp r0, #3
	beq _080876D0
	b _08087700
_080876AA:
	bl NewFileIntroInit
	movs r0, #1
	strh r0, [r4]
	b _08087700
_080876B4:
	bl IntroSpaceView
	cmp r0, #0
	beq _08087700
	movs r0, #2
	strh r0, [r4]
	b _08087700
_080876C2:
	bl IntroSamusShipCrashing
	cmp r0, #0
	beq _08087700
	movs r0, #3
	strh r0, [r4]
	b _08087700
_080876D0:
	ldr r0, _080876E8 @ =gNonGameplayRam
	ldr r2, _080876EC @ =0x0000020E
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	bne _080876F8
	ldr r1, _080876F0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080876F4
	adds r0, #1
	b _080876FA
	.align 2, 0
_080876E8: .4byte gNonGameplayRam
_080876EC: .4byte 0x0000020E
_080876F0: .4byte gWrittenToBldy
_080876F4:
	movs r5, #1
	b _080876FC
_080876F8:
	subs r0, #1
_080876FA:
	strh r0, [r1]
_080876FC:
	bl SpecialCutsceneDrawAllOam
_08087700:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NewFileIntroSubroutine
NewFileIntroSubroutine: @ 0x08087708
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r0, _08087724 @ =gSubGameMode1
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r2, r0, #0
	cmp r1, #0xc
	bls _0808771A
	b _08087916
_0808771A:
	lsls r0, r1, #2
	ldr r1, _08087728 @ =_0808772C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08087724: .4byte gSubGameMode1
_08087728: .4byte _0808772C
_0808772C: @ jump table
	.4byte _08087760 @ case 0
	.4byte _08087788 @ case 1
	.4byte _080877B0 @ case 2
	.4byte _080877C8 @ case 3
	.4byte _080877E0 @ case 4
	.4byte _080877F8 @ case 5
	.4byte _08087810 @ case 6
	.4byte _08087828 @ case 7
	.4byte _0808783C @ case 8
	.4byte _08087850 @ case 9
	.4byte _08087864 @ case 10
	.4byte _08087878 @ case 11
	.4byte _080878A0 @ case 12
_08087760:
	bl StopAllMusicsAndSounds
	bl NewFileIntroInit
	ldr r0, _08087778 @ =0x03000014
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0808777C
	movs r0, #1
	b _08087918
	.align 2, 0
_08087778: .4byte 0x03000014
_0808777C:
	ldr r1, _08087784 @ =gSubGameMode1
	movs r0, #1
	strh r0, [r1]
	b _08087916
	.align 2, 0
_08087784: .4byte gSubGameMode1
_08087788:
	ldr r0, _080877AC @ =gNonGameplayRam
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r0, r3
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x63
	bhi _080877A0
	b _08087916
_080877A0:
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	strh r0, [r2]
	b _08087916
	.align 2, 0
_080877AC: .4byte gNonGameplayRam
_080877B0:
	bl NewFileIntroSr388Preview
	cmp r0, #0
	bne _080877BA
	b _08087916
_080877BA:
	ldr r1, _080877C4 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	b _08087916
	.align 2, 0
_080877C4: .4byte gSubGameMode1
_080877C8:
	bl NewFileIntroInSr388
	cmp r0, #0
	bne _080877D2
	b _08087916
_080877D2:
	ldr r1, _080877DC @ =gSubGameMode1
	movs r0, #4
	strh r0, [r1]
	b _08087916
	.align 2, 0
_080877DC: .4byte gSubGameMode1
_080877E0:
	bl NewFileIntroSamusShipFlying
	cmp r0, #0
	bne _080877EA
	b _08087916
_080877EA:
	ldr r1, _080877F4 @ =gSubGameMode1
	movs r0, #5
	strh r0, [r1]
	b _08087916
	.align 2, 0
_080877F4: .4byte gSubGameMode1
_080877F8:
	bl NewFileIntroSamusFainting
	cmp r0, #0
	bne _08087802
	b _08087916
_08087802:
	ldr r1, _0808780C @ =gSubGameMode1
	movs r0, #6
	strh r0, [r1]
	b _08087916
	.align 2, 0
_0808780C: .4byte gSubGameMode1
_08087810:
	bl NewFileIntroSamusDrifting
	cmp r0, #0
	bne _0808781A
	b _08087916
_0808781A:
	ldr r1, _08087824 @ =gSubGameMode1
	movs r0, #7
	strh r0, [r1]
	b _08087916
	.align 2, 0
_08087824: .4byte gSubGameMode1
_08087828:
	bl NewFileIntroSamusFound
	cmp r0, #0
	beq _08087916
	ldr r1, _08087838 @ =gSubGameMode1
	movs r0, #8
	strh r0, [r1]
	b _08087916
	.align 2, 0
_08087838: .4byte gSubGameMode1
_0808783C:
	bl NewFileIntroSamusGettingCured
	cmp r0, #0
	beq _08087916
	ldr r1, _0808784C @ =gSubGameMode1
	movs r0, #9
	strh r0, [r1]
	b _08087916
	.align 2, 0
_0808784C: .4byte gSubGameMode1
_08087850:
	bl NewFileIntroSamusCured
	cmp r0, #0
	beq _08087916
	ldr r1, _08087860 @ =gSubGameMode1
	movs r0, #0xa
	strh r0, [r1]
	b _08087916
	.align 2, 0
_08087860: .4byte gSubGameMode1
_08087864:
	bl NewFileIntroArrivingAtBsl
	cmp r0, #0
	beq _08087916
	ldr r1, _08087874 @ =gSubGameMode1
	movs r0, #0xb
	strh r0, [r1]
	b _08087916
	.align 2, 0
_08087874: .4byte gSubGameMode1
_08087878:
	bl NewFileIntroLandingOnBsl
	cmp r0, #0
	beq _08087916
	ldr r0, _08087894 @ =gNonGameplayRam
	ldr r1, _08087898 @ =0x0000020E
	adds r0, r0, r1
	movs r1, #0
	strh r1, [r0]
	ldr r1, _0808789C @ =gSubGameMode1
	movs r0, #0xc
	strh r0, [r1]
	b _08087916
	.align 2, 0
_08087894: .4byte gNonGameplayRam
_08087898: .4byte 0x0000020E
_0808789C: .4byte gSubGameMode1
_080878A0:
	ldr r6, _080878C8 @ =gNonGameplayRam
	ldr r2, _080878CC @ =0x0000020E
	adds r4, r6, r2
	ldrh r0, [r4]
	adds r0, #1
	movs r5, #0
	strh r0, [r4]
	ldr r2, _080878D0 @ =gWrittenToBldy
	ldrh r1, [r2]
	cmp r1, #0xf
	bhi _080878D4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08087912
	strh r5, [r4]
	adds r0, r1, #1
	strh r0, [r2]
	b _08087912
	.align 2, 0
_080878C8: .4byte gNonGameplayRam
_080878CC: .4byte 0x0000020E
_080878D0: .4byte gWrittenToBldy
_080878D4:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _080878E4
	movs r0, #0
	bl Sram_ProcessIntroSave
	b _08087912
_080878E4:
	cmp r0, #2
	bne _080878F0
	movs r0, #1
	bl Sram_ProcessIntroSave
	b _08087912
_080878F0:
	cmp r0, #3
	bne _080878FC
	movs r0, #2
	bl Sram_ProcessIntroSave
	b _08087912
_080878FC:
	cmp r0, #4
	bne _08087912
	movs r0, #3
	bl Sram_ProcessIntroSave
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r6, r3
	strh r5, [r0]
	strh r5, [r4]
	movs r7, #1
_08087912:
	bl SpecialCutsceneDrawAllOam
_08087916:
	adds r0, r7, #0
_08087918:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_87920
unk_87920: @ 0x08087920
	push {r4, lr}
	movs r4, #0
	ldr r0, _08087938 @ =gCurrentCutscene
	ldrb r0, [r0]
	cmp r0, #2
	beq _0808794C
	cmp r0, #2
	bgt _0808793C
	cmp r0, #1
	beq _08087946
	b _08087964
	.align 2, 0
_08087938: .4byte gCurrentCutscene
_0808793C:
	cmp r0, #3
	beq _08087952
	cmp r0, #4
	beq _08087958
	b _08087964
_08087946:
	bl IntroSubroutine
	b _0808795C
_0808794C:
	bl NewFileIntroSubroutine
	b _0808795C
_08087952:
	bl EndingSubroutine
	b _0808795C
_08087958:
	bl DiedFromSr388CollisionSubroutine
_0808795C:
	cmp r0, #0
	beq _08087966
	bl StopAllMusicsAndSounds
_08087964:
	movs r4, #1
_08087966:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroSamusShipFlyingVblank
NewFileIntroSamusShipFlyingVblank: @ 0x08087970
	ldr r1, _080879CC @ =0x040000D4
	ldr r0, _080879D0 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080879D4 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _080879D8 @ =0x04000052
	ldr r0, _080879DC @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _080879E0 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080879E4 @ =0x04000054
	ldr r0, _080879E8 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _080879EC @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080879F0 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080879F4 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080879F8 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080879FC @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08087A00 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080879CC: .4byte 0x040000D4
_080879D0: .4byte gOamData
_080879D4: .4byte 0x84000100
_080879D8: .4byte 0x04000052
_080879DC: .4byte gWrittenToBldalpha_L
_080879E0: .4byte gWrittenToBldalpha_R
_080879E4: .4byte 0x04000054
_080879E8: .4byte gWrittenToBldy
_080879EC: .4byte gBg1XPosition
_080879F0: .4byte gBg1YPosition
_080879F4: .4byte 0x0300122C
_080879F8: .4byte 0x0300122E
_080879FC: .4byte 0x03001230
_08087A00: .4byte 0x03001232

	thumb_func_start NewFileIntroSamusShipFlyingInit
NewFileIntroSamusShipFlyingInit: @ 0x08087A04
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _08087BB4 @ =unk_99940
	bl CallbackSetVBlank
	movs r0, #0
	str r0, [sp]
	ldr r1, _08087BB8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08087BBC @ =gNonGameplayRam
	str r0, [r1, #4]
	ldr r0, _08087BC0 @ =0x85000150
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	ldr r4, _08087BC4 @ =0x0879C3FC
_08087A26:
	lsls r0, r5, #2
	adds r0, r0, r4
	ldr r0, [r0]
	lsls r1, r5, #0xc
	ldr r2, _08087BC8 @ =0x06010000
	adds r1, r1, r2
	bl LZ77UncompVram
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #7
	bls _08087A26
	ldr r4, _08087BB8 @ =0x040000D4
	ldr r0, _08087BCC @ =0x085980B0
	str r0, [r4]
	ldr r0, _08087BD0 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _08087BD4 @ =0x84000028
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08087BD8 @ =0x08598150
	str r0, [r4]
	ldr r0, _08087BDC @ =0x05000300
	str r0, [r4, #4]
	ldr r0, _08087BE0 @ =0x84000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08087BE4 @ =0x08613148
	str r0, [r4]
	ldr r0, _08087BE8 @ =0x06017FE0
	str r0, [r4, #4]
	ldr r1, _08087BEC @ =0x84000008
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08087BF0 @ =0x086131A8
	str r0, [r4]
	ldr r0, _08087BF4 @ =0x050003E0
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08087BF8 @ =0x0860BCA4
	ldr r5, _08087BFC @ =0x02010000
	adds r1, r5, #0
	bl LZ77UncompWram
	str r5, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _08087C00 @ =0x84002000
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08087C04 @ =0x0860B670
	ldr r1, _08087C08 @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _08087C0C @ =0x0860B148
	ldr r1, _08087C10 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08087C14 @ =0x08612E48
	str r0, [r4]
	ldr r0, _08087C18 @ =0x05000100
	str r0, [r4, #4]
	ldr r0, _08087C1C @ =0x84000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	movs r4, #0
	strh r4, [r0]
	ldr r0, _08087C20 @ =0x08598898
	ldr r1, _08087C24 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _08087C28 @ =0x04000010
	ldr r2, _08087C2C @ =0x0000FFF8
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _08087C30 @ =gBg1XPosition
	strh r4, [r0]
	ldr r0, _08087C34 @ =gBg1YPosition
	strh r4, [r0]
	ldr r6, _08087C38 @ =0x0300122C
	movs r0, #0x30
	strh r0, [r6]
	ldr r5, _08087C3C @ =0x0300122E
	strh r1, [r5]
	ldr r0, _08087C40 @ =0x03001230
	strh r4, [r0]
	ldr r0, _08087C44 @ =0x03001232
	strh r4, [r0]
	ldr r1, _08087C48 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	subs r1, #0x48
	ldr r2, _08087C4C @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _08087C50 @ =0x00005D02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08087C54 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0xc8
	movs r1, #0xfa
	movs r2, #0
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r0, #0
	ldrsh r2, [r5, r0]
	movs r0, #1
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r0, #2
	movs r1, #0xa0
	movs r2, #0x5a
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r0, #4
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl NewFileIntroSetupOam
	movs r5, #0
_08087B50:
	bl SpecialCutsceneGetRandomNumber
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	adds r1, r4, #0
	movs r3, #1
	bl NewFileIntroSetupOam
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #9
	bls _08087B50
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	movs r0, #0
	str r0, [sp]
	ldr r1, _08087BB8 @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	ldr r0, _08087C58 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08087C5C @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _08087BBC @ =gNonGameplayRam
	ldr r0, _08087C60 @ =0x0863A19C
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08087C64 @ =NewFileIntroSamusShipFlyingVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087BB4: .4byte unk_99940
_08087BB8: .4byte 0x040000D4
_08087BBC: .4byte gNonGameplayRam
_08087BC0: .4byte 0x85000150
_08087BC4: .4byte 0x0879C3FC
_08087BC8: .4byte 0x06010000
_08087BCC: .4byte 0x085980B0
_08087BD0: .4byte 0x05000200
_08087BD4: .4byte 0x84000028
_08087BD8: .4byte 0x08598150
_08087BDC: .4byte 0x05000300
_08087BE0: .4byte 0x84000010
_08087BE4: .4byte 0x08613148
_08087BE8: .4byte 0x06017FE0
_08087BEC: .4byte 0x84000008
_08087BF0: .4byte 0x086131A8
_08087BF4: .4byte 0x050003E0
_08087BF8: .4byte 0x0860BCA4
_08087BFC: .4byte 0x02010000
_08087C00: .4byte 0x84002000
_08087C04: .4byte 0x0860B670
_08087C08: .4byte 0x0600E800
_08087C0C: .4byte 0x0860B148
_08087C10: .4byte 0x0600F800
_08087C14: .4byte 0x08612E48
_08087C18: .4byte 0x05000100
_08087C1C: .4byte 0x84000040
_08087C20: .4byte 0x08598898
_08087C24: .4byte 0x0600E000
_08087C28: .4byte 0x04000010
_08087C2C: .4byte 0x0000FFF8
_08087C30: .4byte gBg1XPosition
_08087C34: .4byte gBg1YPosition
_08087C38: .4byte 0x0300122C
_08087C3C: .4byte 0x0300122E
_08087C40: .4byte 0x03001230
_08087C44: .4byte 0x03001232
_08087C48: .4byte 0x04000050
_08087C4C: .4byte 0x00001C08
_08087C50: .4byte 0x00005D02
_08087C54: .4byte 0x00001F03
_08087C58: .4byte 0x0600D000
_08087C5C: .4byte 0x85000400
_08087C60: .4byte 0x0863A19C
_08087C64: .4byte NewFileIntroSamusShipFlyingVblank

	thumb_func_start NewFileIntroSamusShipFlyingProcess
NewFileIntroSamusShipFlyingProcess: @ 0x08087C68
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r1, _08087CBC @ =gNonGameplayRam
	ldr r0, [r1]
	ldrh r2, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	adds r5, r1, #0
	cmp r2, r0
	bne _08087C98
	ldr r0, _08087CC0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08087C98
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08087C98
	movs r0, #1
	strb r0, [r1]
_08087C98:
	adds r4, r5, #0
	movs r1, #0x84
	lsls r1, r1, #2
	adds r2, r4, r1
	ldrh r0, [r2]
	adds r1, r0, #1
	strh r1, [r2]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r4, r3
	ldrb r0, [r0]
	cmp r0, #1
	beq _08087D5C
	cmp r0, #1
	bgt _08087CC4
	cmp r0, #0
	beq _08087CCC
	b _08087DD6
	.align 2, 0
_08087CBC: .4byte gNonGameplayRam
_08087CC0: .4byte gChangedInput
_08087CC4:
	cmp r0, #2
	bne _08087CCA
	b _08087DC2
_08087CCA:
	b _08087DD6
_08087CCC:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08087CF4
	ldr r1, _08087D14 @ =0x00000215
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _08087CF4
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	movs r1, #0
	movs r3, #1
	bl NewFileIntroSetupOam
_08087CF4:
	ldr r3, _08087D18 @ =gNonGameplayRam
	movs r0, #0x84
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrh r0, [r4]
	cmp r0, #0x63
	bne _08087D1C
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	b _08087DD6
	.align 2, 0
_08087D14: .4byte 0x00000215
_08087D18: .4byte gNonGameplayRam
_08087D1C:
	cmp r0, #0x64
	bne _08087DD6
	movs r2, #0
	movs r1, #0
	strh r1, [r4]
	ldr r4, _08087D50 @ =0x00000212
	adds r0, r3, r4
	strb r2, [r0]
	strh r1, [r3, #0xe]
	strh r1, [r3, #0xc]
	ldr r1, _08087D54 @ =0x0879C5A4
	ldr r0, _08087D58 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	str r0, [r3]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #1
	strb r0, [r1]
	b _08087DD6
	.align 2, 0
_08087D50: .4byte 0x00000212
_08087D54: .4byte 0x0879C5A4
_08087D58: .4byte 0x03000011
_08087D5C:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08087D84
	ldr r1, _08087DA8 @ =0x00000215
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _08087D84
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	movs r1, #0
	movs r3, #1
	bl NewFileIntroSetupOam
_08087D84:
	ldr r2, _08087DAC @ =gNonGameplayRam
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r3, #0
	movs r0, #0
	strh r0, [r1]
	movs r4, #0x86
	lsls r4, r4, #2
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #2
	beq _08087DA2
	cmp r0, #4
	bne _08087DB0
_08087DA2:
	strb r3, [r1]
	b _08087DD6
	.align 2, 0
_08087DA8: .4byte 0x00000215
_08087DAC: .4byte gNonGameplayRam
_08087DB0:
	cmp r0, #3
	bne _08087DD6
	strb r3, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #2
	strb r0, [r1]
	b _08087DD6
_08087DC2:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _08087DD6
	movs r0, #0
	strh r0, [r2]
	ldr r1, _08087DEC @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r6, #1
_08087DD6:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	bl IntroProcessText
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08087DEC: .4byte gWrittenToBldy

	thumb_func_start NewFileIntroSamusShipFlying
NewFileIntroSamusShipFlying: @ 0x08087DF0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08087E08 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _08087E20
	cmp r0, #1
	bgt _08087E0C
	cmp r0, #0
	beq _08087E16
	b _08087E82
	.align 2, 0
_08087E08: .4byte gNonGameplayRam
_08087E0C:
	cmp r0, #2
	beq _08087E38
	cmp r0, #3
	beq _08087E56
	b _08087E82
_08087E16:
	bl NewFileIntroSamusShipFlyingInit
	movs r0, #1
	strh r0, [r4, #8]
	b _08087E82
_08087E20:
	bl SpecialCutsceneFadeIn
	ldr r0, _08087E34 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _08087E82
	movs r0, #2
	strh r0, [r4, #8]
	b _08087E82
	.align 2, 0
_08087E34: .4byte gWrittenToBldy
_08087E38:
	bl NewFileIntroSamusShipFlyingProcess
	cmp r0, #0
	beq _08087E82
	movs r1, #0
	movs r0, #3
	strh r0, [r4, #8]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r4, r2
	strh r5, [r0]
	adds r2, #4
	adds r0, r4, r2
	strb r1, [r0]
	b _08087E82
_08087E56:
	ldr r1, _08087E64 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08087E68
	adds r0, #1
	strh r0, [r1]
	b _08087E7A
	.align 2, 0
_08087E64: .4byte gWrittenToBldy
_08087E68:
	ldr r1, _08087E8C @ =0x00000213
	adds r0, r4, r1
	strb r5, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r5, [r0]
	strh r5, [r4, #8]
	movs r5, #1
_08087E7A:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08087E82:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08087E8C: .4byte 0x00000213

	thumb_func_start NewFileIntroSamusFaintingInit
NewFileIntroSamusFaintingInit: @ 0x08087E90
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r0, _08087FC8 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _08087FCC @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r1, _08087FD0 @ =gNonGameplayRam
	mov r8, r1
	str r1, [r4, #4]
	ldr r0, _08087FD4 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08087FD8 @ =0x08613148
	str r0, [r4]
	ldr r0, _08087FDC @ =0x06017FE0
	str r0, [r4, #4]
	ldr r1, _08087FE0 @ =0x84000008
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08087FE4 @ =0x086131A8
	str r0, [r4]
	ldr r0, _08087FE8 @ =0x050003E0
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r6, _08087FEC @ =0x08605684
	ldr r1, _08087FF0 @ =0x0600F000
	adds r0, r6, #0
	bl LZ77UncompVram
	ldr r1, _08087FF4 @ =0x0600F800
	adds r0, r6, #0
	bl LZ77UncompVram
	ldr r0, _08087FF8 @ =0x0860093C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _08087FFC @ =0x08605484
	str r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r4, #4]
	ldr r0, _08088000 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	strh r5, [r1]
	ldr r0, _08088004 @ =0x08598898
	ldr r1, _08088008 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0808800C @ =0x08612E48
	str r0, [r4]
	ldr r0, _08088010 @ =0x05000100
	str r0, [r4, #4]
	ldr r0, _08088014 @ =0x84000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _08088018 @ =0x04000010
	ldr r2, _0808801C @ =0x0000FFF8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08088020 @ =0x04000012
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
	ldr r0, _08088024 @ =gBg1XPosition
	strh r5, [r0]
	ldr r0, _08088028 @ =gBg1YPosition
	strh r5, [r0]
	ldr r1, _0808802C @ =0x0300122C
	movs r0, #0xa
	strh r0, [r1]
	ldr r1, _08088030 @ =0x0300122E
	movs r0, #2
	strh r0, [r1]
	ldr r0, _08088034 @ =0x03001230
	strh r5, [r0]
	ldr r0, _08088038 @ =0x03001232
	strh r5, [r0]
	ldr r1, _0808803C @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	subs r1, #0x48
	ldr r2, _08088040 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _08088044 @ =0x00001E02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08088048 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0xc8
	movs r1, #0xfa
	movs r2, #0
	movs r3, #0
	bl NewFileIntroSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	str r5, [sp]
	mov r0, sp
	str r0, [r4]
	ldr r0, _0808804C @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _08088050 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088054 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08088058 @ =NewFileIntroSamusShipFlyingVblank
	bl CallbackSetVBlank
	ldr r0, _0808805C @ =gWrittenToBldy
	strh r5, [r0]
	ldr r1, _08088060 @ =gWrittenToBldalpha_R
	movs r0, #0xc
	strh r0, [r1]
	ldr r1, _08088064 @ =gWrittenToBldalpha_L
	movs r0, #8
	strh r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087FC8: .4byte unk_99940
_08087FCC: .4byte 0x040000D4
_08087FD0: .4byte gNonGameplayRam
_08087FD4: .4byte 0x85000150
_08087FD8: .4byte 0x08613148
_08087FDC: .4byte 0x06017FE0
_08087FE0: .4byte 0x84000008
_08087FE4: .4byte 0x086131A8
_08087FE8: .4byte 0x050003E0
_08087FEC: .4byte 0x08605684
_08087FF0: .4byte 0x0600F000
_08087FF4: .4byte 0x0600F800
_08087FF8: .4byte 0x0860093C
_08087FFC: .4byte 0x08605484
_08088000: .4byte 0x84000080
_08088004: .4byte 0x08598898
_08088008: .4byte 0x0600E000
_0808800C: .4byte 0x08612E48
_08088010: .4byte 0x05000100
_08088014: .4byte 0x84000040
_08088018: .4byte 0x04000010
_0808801C: .4byte 0x0000FFF8
_08088020: .4byte 0x04000012
_08088024: .4byte gBg1XPosition
_08088028: .4byte gBg1YPosition
_0808802C: .4byte 0x0300122C
_08088030: .4byte 0x0300122E
_08088034: .4byte 0x03001230
_08088038: .4byte 0x03001232
_0808803C: .4byte 0x04000050
_08088040: .4byte 0x00001C08
_08088044: .4byte 0x00001E02
_08088048: .4byte 0x00001F03
_0808804C: .4byte 0x0600D000
_08088050: .4byte 0x85000400
_08088054: .4byte 0x0863A19C
_08088058: .4byte NewFileIntroSamusShipFlyingVblank
_0808805C: .4byte gWrittenToBldy
_08088060: .4byte gWrittenToBldalpha_R
_08088064: .4byte gWrittenToBldalpha_L

	thumb_func_start NewFileIntroSamusFaintingProcess
NewFileIntroSamusFaintingProcess: @ 0x08088068
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r2, _080880BC @ =gNonGameplayRam
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08088096
	ldr r0, _080880C0 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08088096
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08088096
	movs r0, #1
	strb r0, [r1]
_08088096:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r3, r2, r1
	ldrh r0, [r3]
	adds r0, #1
	movs r5, #0
	movs r4, #0
	strh r0, [r3]
	adds r1, #4
	adds r6, r2, r1
	ldrb r1, [r6]
	cmp r1, #1
	beq _0808814C
	cmp r1, #1
	bgt _080880C4
	cmp r1, #0
	beq _080880CA
	b _0808818A
	.align 2, 0
_080880BC: .4byte gNonGameplayRam
_080880C0: .4byte gChangedInput
_080880C4:
	cmp r1, #2
	beq _08088178
	b _0808818A
_080880CA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08088100
	ldr r1, _080880F0 @ =0x04000050
	ldr r2, _080880F4 @ =0x00001844
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080880F8 @ =0x0300122C
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _080880FC @ =0x0300122E
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0xa
	movs r3, #1
	bl NewFileIntroSetupOam
	b _0808818A
	.align 2, 0
_080880F0: .4byte 0x04000050
_080880F4: .4byte 0x00001844
_080880F8: .4byte 0x0300122C
_080880FC: .4byte 0x0300122E
_08088100:
	cmp r0, #0x3b
	bne _08088116
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	b _0808818A
_08088116:
	cmp r0, #0x3c
	bne _0808818A
	strh r4, [r3]
	ldr r1, _08088140 @ =0x00000212
	adds r0, r2, r1
	strb r5, [r0]
	strh r4, [r2, #0xe]
	strh r4, [r2, #0xc]
	ldr r1, _08088144 @ =0x0879C5A4
	ldr r0, _08088148 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	str r0, [r2]
	movs r0, #1
	strb r0, [r6]
	b _0808818A
	.align 2, 0
_08088140: .4byte 0x00000212
_08088144: .4byte 0x0879C5A4
_08088148: .4byte 0x03000011
_0808814C:
	strh r4, [r3]
	movs r3, #0x86
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r1, [r0]
	cmp r1, #2
	beq _0808815E
	cmp r1, #4
	bne _08088162
_0808815E:
	strb r5, [r0]
	b _0808818A
_08088162:
	cmp r1, #3
	bne _0808818A
	strb r5, [r0]
	movs r0, #2
	strb r0, [r6]
	ldr r1, _08088174 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	b _0808818A
	.align 2, 0
_08088174: .4byte gWrittenToBldy
_08088178:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _0808818A
	ldr r1, _080881A0 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	strh r4, [r3]
	movs r7, #1
_0808818A:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	bl IntroProcessText
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080881A0: .4byte 0x04000050

	thumb_func_start NewFileIntroSamusFainting
NewFileIntroSamusFainting: @ 0x080881A4
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _080881BC @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _080881D0
	cmp r0, #1
	bgt _080881C0
	cmp r0, #0
	beq _080881CA
	b _08088232
	.align 2, 0
_080881BC: .4byte gNonGameplayRam
_080881C0:
	cmp r0, #2
	beq _080881E8
	cmp r0, #3
	beq _08088206
	b _08088232
_080881CA:
	bl NewFileIntroSamusFaintingInit
	b _080881DC
_080881D0:
	bl SpecialCutsceneFadeIn
	ldr r0, _080881E4 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _08088232
_080881DC:
	movs r0, #2
	strh r0, [r4, #8]
	b _08088232
	.align 2, 0
_080881E4: .4byte gWrittenToBldy
_080881E8:
	bl NewFileIntroSamusFaintingProcess
	cmp r0, #0
	beq _08088232
	movs r1, #0
	movs r0, #3
	strh r0, [r4, #8]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r4, r2
	strh r5, [r0]
	adds r2, #4
	adds r0, r4, r2
	strb r1, [r0]
	b _08088232
_08088206:
	ldr r1, _08088214 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08088218
	adds r0, #1
	strh r0, [r1]
	b _0808822A
	.align 2, 0
_08088214: .4byte gWrittenToBldy
_08088218:
	ldr r1, _0808823C @ =0x00000213
	adds r0, r4, r1
	strb r5, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r5, [r0]
	strh r5, [r4, #8]
	movs r5, #1
_0808822A:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08088232:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808823C: .4byte 0x00000213

	thumb_func_start NewFileIntroSamusDriftingInit
NewFileIntroSamusDriftingInit: @ 0x08088240
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r0, _080883F4 @ =unk_99940
	bl CallbackSetVBlank
	movs r0, #0
	str r0, [sp]
	ldr r1, _080883F8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080883FC @ =gNonGameplayRam
	str r0, [r1, #4]
	ldr r0, _08088400 @ =0x85000150
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	ldr r4, _08088404 @ =0x0879C3FC
_08088262:
	lsls r0, r5, #2
	adds r0, r0, r4
	ldr r0, [r0]
	lsls r1, r5, #0xc
	ldr r2, _08088408 @ =0x06010000
	adds r1, r1, r2
	bl LZ77UncompVram
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #7
	bls _08088262
	ldr r4, _080883F8 @ =0x040000D4
	ldr r0, _0808840C @ =0x085980B0
	str r0, [r4]
	ldr r0, _08088410 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _08088414 @ =0x84000028
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088418 @ =0x08598150
	str r0, [r4]
	ldr r0, _0808841C @ =0x05000300
	str r0, [r4, #4]
	ldr r0, _08088420 @ =0x84000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088424 @ =0x08613148
	str r0, [r4]
	ldr r0, _08088428 @ =0x06017FE0
	str r0, [r4, #4]
	ldr r1, _0808842C @ =0x84000008
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088430 @ =0x086131A8
	str r0, [r4]
	ldr r0, _08088434 @ =0x050003E0
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088438 @ =0x0860BCA4
	ldr r5, _0808843C @ =0x02010000
	adds r1, r5, #0
	bl LZ77UncompWram
	str r5, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _08088440 @ =0x84002000
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088444 @ =0x0860B670
	ldr r1, _08088448 @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _0808844C @ =0x0860B148
	ldr r1, _08088450 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08088454 @ =0x08612E48
	str r0, [r4]
	ldr r0, _08088458 @ =0x05000100
	str r0, [r4, #4]
	ldr r0, _0808845C @ =0x84000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	movs r4, #0
	strh r4, [r0]
	ldr r0, _08088460 @ =0x08598898
	ldr r1, _08088464 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _08088468 @ =0x04000010
	ldr r2, _0808846C @ =0x0000FFF8
	adds r1, r2, #0
	strh r1, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _08088470 @ =gBg1XPosition
	strh r4, [r0]
	ldr r0, _08088474 @ =gBg1YPosition
	strh r4, [r0]
	ldr r6, _08088478 @ =0x0300122C
	movs r0, #0x30
	strh r0, [r6]
	ldr r5, _0808847C @ =0x0300122E
	strh r1, [r5]
	ldr r0, _08088480 @ =0x03001230
	strh r4, [r0]
	ldr r0, _08088484 @ =0x03001232
	strh r4, [r0]
	ldr r1, _08088488 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	subs r1, #0x48
	ldr r2, _0808848C @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _08088490 @ =0x00005D02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08088494 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0xc8
	movs r1, #0xfa
	movs r2, #0
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r0, #0
	ldrsh r2, [r5, r0]
	movs r0, #1
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r0, #0x14
	movs r1, #0xa0
	movs r2, #0x5a
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r0, #4
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl NewFileIntroSetupOam
	movs r5, #0
_0808838C:
	bl SpecialCutsceneGetRandomNumber
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	adds r1, r4, #0
	movs r3, #1
	bl NewFileIntroSetupOam
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #9
	bls _0808838C
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	movs r4, #0
	str r4, [sp]
	ldr r1, _080883F8 @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	ldr r0, _08088498 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _0808849C @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _080883FC @ =gNonGameplayRam
	ldr r0, _080884A0 @ =0x0863A19C
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080884A4 @ =NewFileIntroSamusShipFlyingVblank
	bl CallbackSetVBlank
	ldr r0, _080884A8 @ =gWrittenToBldy
	strh r4, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080883F4: .4byte unk_99940
_080883F8: .4byte 0x040000D4
_080883FC: .4byte gNonGameplayRam
_08088400: .4byte 0x85000150
_08088404: .4byte 0x0879C3FC
_08088408: .4byte 0x06010000
_0808840C: .4byte 0x085980B0
_08088410: .4byte 0x05000200
_08088414: .4byte 0x84000028
_08088418: .4byte 0x08598150
_0808841C: .4byte 0x05000300
_08088420: .4byte 0x84000010
_08088424: .4byte 0x08613148
_08088428: .4byte 0x06017FE0
_0808842C: .4byte 0x84000008
_08088430: .4byte 0x086131A8
_08088434: .4byte 0x050003E0
_08088438: .4byte 0x0860BCA4
_0808843C: .4byte 0x02010000
_08088440: .4byte 0x84002000
_08088444: .4byte 0x0860B670
_08088448: .4byte 0x0600E800
_0808844C: .4byte 0x0860B148
_08088450: .4byte 0x0600F800
_08088454: .4byte 0x08612E48
_08088458: .4byte 0x05000100
_0808845C: .4byte 0x84000040
_08088460: .4byte 0x08598898
_08088464: .4byte 0x0600E000
_08088468: .4byte 0x04000010
_0808846C: .4byte 0x0000FFF8
_08088470: .4byte gBg1XPosition
_08088474: .4byte gBg1YPosition
_08088478: .4byte 0x0300122C
_0808847C: .4byte 0x0300122E
_08088480: .4byte 0x03001230
_08088484: .4byte 0x03001232
_08088488: .4byte 0x04000050
_0808848C: .4byte 0x00001C08
_08088490: .4byte 0x00005D02
_08088494: .4byte 0x00001F03
_08088498: .4byte 0x0600D000
_0808849C: .4byte 0x85000400
_080884A0: .4byte 0x0863A19C
_080884A4: .4byte NewFileIntroSamusShipFlyingVblank
_080884A8: .4byte gWrittenToBldy

	thumb_func_start NewFileIntroSamusLosingConsciousnessVblank
NewFileIntroSamusLosingConsciousnessVblank: @ 0x080884AC
	push {lr}
	ldr r3, _08088530 @ =0x040000D4
	ldr r0, _08088534 @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _08088538 @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _0808853C @ =0x04000052
	ldr r0, _08088540 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08088544 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08088548 @ =0x04000054
	ldr r0, _0808854C @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _08088550 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08088554 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08088558 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808855C @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08088560 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08088564 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _08088568 @ =gNonGameplayRam
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808852A
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808856C @ =0x08598AAC
	str r0, [r3]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _08088570 @ =0x84000020
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_0808852A:
	pop {r0}
	bx r0
	.align 2, 0
_08088530: .4byte 0x040000D4
_08088534: .4byte gOamData
_08088538: .4byte 0x84000100
_0808853C: .4byte 0x04000052
_08088540: .4byte gWrittenToBldalpha_L
_08088544: .4byte gWrittenToBldalpha_R
_08088548: .4byte 0x04000054
_0808854C: .4byte gWrittenToBldy
_08088550: .4byte gBg1XPosition
_08088554: .4byte gBg1YPosition
_08088558: .4byte 0x0300122C
_0808855C: .4byte 0x0300122E
_08088560: .4byte 0x03001230
_08088564: .4byte 0x03001232
_08088568: .4byte gNonGameplayRam
_0808856C: .4byte 0x08598AAC
_08088570: .4byte 0x84000020

	thumb_func_start NewFileIntroSamusLosingConsciousnessInit
NewFileIntroSamusLosingConsciousnessInit: @ 0x08088574
	push {r4, r5, lr}
	sub sp, #4
	ldr r0, _080886B8 @ =unk_99940
	bl CallbackSetVBlank
	movs r0, #0
	str r0, [sp]
	ldr r0, _080886BC @ =0x040000D4
	mov r1, sp
	str r1, [r0]
	ldr r1, _080886C0 @ =0x030016A0
	str r1, [r0, #4]
	ldr r1, _080886C4 @ =0x850000B4
	str r1, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080886C8 @ =0x08613148
	str r1, [r0]
	ldr r1, _080886CC @ =0x06017FE0
	str r1, [r0, #4]
	ldr r2, _080886D0 @ =0x84000008
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	ldr r1, _080886D4 @ =0x086131A8
	str r1, [r0]
	ldr r1, _080886D8 @ =0x050003E0
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	movs r4, #0
	ldr r5, _080886DC @ =0x0879C430
_080885B0:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r1, r4, #0xc
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl LZ77UncompVram
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _080885B0
	ldr r4, _080886E0 @ =0x08598190
	ldr r1, _080886E4 @ =0x0600F000
	adds r0, r4, #0
	bl LZ77UncompVram
	ldr r1, _080886E8 @ =0x0600F800
	adds r0, r4, #0
	bl LZ77UncompVram
	ldr r5, _080886BC @ =0x040000D4
	ldr r0, _080886EC @ =0x08598818
	str r0, [r5]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r5, #4]
	ldr r0, _080886F0 @ =0x84000020
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	movs r4, #0
	strh r4, [r1]
	ldr r0, _080886F4 @ =0x08598898
	ldr r1, _080886F8 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _080886FC @ =0x08612E48
	str r0, [r5]
	ldr r0, _08088700 @ =0x05000100
	str r0, [r5, #4]
	ldr r0, _08088704 @ =0x84000040
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _08088708 @ =0x04000010
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _0808870C @ =gBg1XPosition
	strh r4, [r0]
	ldr r0, _08088710 @ =gBg1YPosition
	strh r4, [r0]
	ldr r1, _08088714 @ =0x0300122C
	movs r0, #0xa
	strh r0, [r1]
	ldr r0, _08088718 @ =0x0300122E
	strh r4, [r0]
	ldr r0, _0808871C @ =0x03001230
	strh r4, [r0]
	ldr r0, _08088720 @ =0x03001232
	strh r4, [r0]
	ldr r1, _08088724 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	subs r1, #0x48
	ldr r2, _08088728 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _0808872C @ =0x00001E02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08088730 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0xc8
	movs r1, #0xfa
	movs r2, #0
	movs r3, #0
	bl NewFileIntroSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	movs r4, #0
	str r4, [sp]
	mov r0, sp
	str r0, [r5]
	ldr r0, _08088734 @ =0x0600D000
	str r0, [r5, #4]
	ldr r0, _08088738 @ =0x85000400
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	ldr r1, _0808873C @ =gNonGameplayRam
	ldr r0, _08088740 @ =0x0863A19C
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08088744 @ =NewFileIntroSamusLosingConsciousnessVblank
	bl CallbackSetVBlank
	ldr r0, _08088748 @ =gWrittenToBldy
	strh r4, [r0]
	ldr r1, _0808874C @ =gWrittenToBldalpha_R
	movs r0, #0xc
	strh r0, [r1]
	ldr r1, _08088750 @ =gWrittenToBldalpha_L
	movs r0, #8
	strh r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080886B8: .4byte unk_99940
_080886BC: .4byte 0x040000D4
_080886C0: .4byte 0x030016A0
_080886C4: .4byte 0x850000B4
_080886C8: .4byte 0x08613148
_080886CC: .4byte 0x06017FE0
_080886D0: .4byte 0x84000008
_080886D4: .4byte 0x086131A8
_080886D8: .4byte 0x050003E0
_080886DC: .4byte 0x0879C430
_080886E0: .4byte 0x08598190
_080886E4: .4byte 0x0600F000
_080886E8: .4byte 0x0600F800
_080886EC: .4byte 0x08598818
_080886F0: .4byte 0x84000020
_080886F4: .4byte 0x08598898
_080886F8: .4byte 0x0600E000
_080886FC: .4byte 0x08612E48
_08088700: .4byte 0x05000100
_08088704: .4byte 0x84000040
_08088708: .4byte 0x04000010
_0808870C: .4byte gBg1XPosition
_08088710: .4byte gBg1YPosition
_08088714: .4byte 0x0300122C
_08088718: .4byte 0x0300122E
_0808871C: .4byte 0x03001230
_08088720: .4byte 0x03001232
_08088724: .4byte 0x04000050
_08088728: .4byte 0x00001C08
_0808872C: .4byte 0x00001E02
_08088730: .4byte 0x00001F03
_08088734: .4byte 0x0600D000
_08088738: .4byte 0x85000400
_0808873C: .4byte gNonGameplayRam
_08088740: .4byte 0x0863A19C
_08088744: .4byte NewFileIntroSamusLosingConsciousnessVblank
_08088748: .4byte gWrittenToBldy
_0808874C: .4byte gWrittenToBldalpha_R
_08088750: .4byte gWrittenToBldalpha_L

	thumb_func_start NewFileIntroSamusDriftingIntoAsteroidsInit
NewFileIntroSamusDriftingIntoAsteroidsInit: @ 0x08088754
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _080888F4 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080888F8 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _080888FC @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08088900 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08088904 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08088908 @ =unk_99940
	bl CallbackSetVBlank
	movs r0, #0
	str r0, [sp]
	ldr r1, _0808890C @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08088910 @ =0x030016A0
	str r0, [r1, #4]
	ldr r0, _08088914 @ =0x850000B4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0
	ldr r4, _08088918 @ =0x0879C3FC
_08088794:
	lsls r0, r5, #2
	adds r0, r0, r4
	ldr r0, [r0]
	lsls r1, r5, #0xc
	ldr r2, _0808891C @ =0x06010000
	adds r1, r1, r2
	bl LZ77UncompVram
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #7
	bls _08088794
	ldr r4, _0808890C @ =0x040000D4
	ldr r0, _08088920 @ =0x08612F48
	str r0, [r4]
	ldr r0, _08088924 @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _08088928 @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808892C @ =0x08598150
	str r0, [r4]
	ldr r0, _08088930 @ =0x05000300
	str r0, [r4, #4]
	ldr r0, _08088934 @ =0x84000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088938 @ =0x08613148
	str r0, [r4]
	ldr r0, _0808893C @ =0x06017FE0
	str r0, [r4, #4]
	ldr r5, _08088940 @ =0x84000008
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088944 @ =0x086131A8
	str r0, [r4]
	ldr r0, _08088948 @ =0x050003E0
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808894C @ =0x08605D08
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _08088950 @ =0x08609220
	ldr r1, _08088954 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08088958 @ =0x08598898
	ldr r1, _0808895C @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _08088960 @ =0x08609020
	str r0, [r4]
	movs r2, #0xa0
	lsls r2, r2, #0x13
	str r2, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08088964 @ =0x08598A8C
	str r0, [r4]
	ldr r0, _08088968 @ =0x050001E0
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0
	strh r1, [r2]
	ldr r0, _0808896C @ =0x04000010
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, _08088970 @ =0x0300122C
	strh r1, [r0]
	ldr r0, _08088974 @ =0x0300122E
	strh r1, [r0]
	ldr r0, _08088978 @ =0x03001230
	strh r1, [r0]
	ldr r0, _0808897C @ =0x03001232
	strh r1, [r0]
	ldr r2, _08088980 @ =0x04000008
	ldr r3, _08088984 @ =0x00001C08
	adds r0, r3, #0
	strh r0, [r2]
	adds r2, #6
	ldr r3, _08088988 @ =0x00001F03
	adds r0, r3, #0
	strh r0, [r2]
	adds r2, #0x42
	movs r0, #0xff
	strh r0, [r2]
	ldr r2, _0808898C @ =gWrittenToBldalpha_R
	ldr r0, _08088990 @ =gWrittenToBldalpha_L
	strh r1, [r0]
	strh r1, [r2]
	ldr r1, _08088994 @ =0x04000052
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x1e
	movs r1, #0x8c
	movs r2, #0x8c
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r0, #0x1f
	movs r1, #0x8c
	movs r2, #0x50
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r5, #0
_0808888C:
	bl SpecialCutsceneGetRandomNumber
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x24
	adds r1, r4, #0
	movs r3, #1
	bl NewFileIntroSetupOam
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _0808888C
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _08088998 @ =gNonGameplayRam
	ldr r0, _0808899C @ =0x0863A19C
	str r0, [r1]
	movs r4, #0
	str r4, [sp]
	ldr r1, _0808890C @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080889A0 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _080889A4 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xd4
	movs r2, #0xc8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080889A8 @ =NewFileIntroSamusShipFlyingVblank
	bl CallbackSetVBlank
	ldr r0, _080889AC @ =gWrittenToBldy
	strh r4, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080888F4: .4byte 0x04000208
_080888F8: .4byte 0x04000004
_080888FC: .4byte 0x0000FFEF
_08088900: .4byte 0x04000200
_08088904: .4byte 0x0000FFFD
_08088908: .4byte unk_99940
_0808890C: .4byte 0x040000D4
_08088910: .4byte 0x030016A0
_08088914: .4byte 0x850000B4
_08088918: .4byte 0x0879C3FC
_0808891C: .4byte 0x06010000
_08088920: .4byte 0x08612F48
_08088924: .4byte 0x05000200
_08088928: .4byte 0x84000080
_0808892C: .4byte 0x08598150
_08088930: .4byte 0x05000300
_08088934: .4byte 0x84000010
_08088938: .4byte 0x08613148
_0808893C: .4byte 0x06017FE0
_08088940: .4byte 0x84000008
_08088944: .4byte 0x086131A8
_08088948: .4byte 0x050003E0
_0808894C: .4byte 0x08605D08
_08088950: .4byte 0x08609220
_08088954: .4byte 0x0600F800
_08088958: .4byte 0x08598898
_0808895C: .4byte 0x0600E000
_08088960: .4byte 0x08609020
_08088964: .4byte 0x08598A8C
_08088968: .4byte 0x050001E0
_0808896C: .4byte 0x04000010
_08088970: .4byte 0x0300122C
_08088974: .4byte 0x0300122E
_08088978: .4byte 0x03001230
_0808897C: .4byte 0x03001232
_08088980: .4byte 0x04000008
_08088984: .4byte 0x00001C08
_08088988: .4byte 0x00001F03
_0808898C: .4byte gWrittenToBldalpha_R
_08088990: .4byte gWrittenToBldalpha_L
_08088994: .4byte 0x04000052
_08088998: .4byte gNonGameplayRam
_0808899C: .4byte 0x0863A19C
_080889A0: .4byte 0x0600D000
_080889A4: .4byte 0x85000400
_080889A8: .4byte NewFileIntroSamusShipFlyingVblank
_080889AC: .4byte gWrittenToBldy

	thumb_func_start NewFileIntroSamusDriftingProcess
NewFileIntroSamusDriftingProcess: @ 0x080889B0
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _08088A04 @ =gNonGameplayRam
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	adds r4, r2, #0
	cmp r1, r0
	bne _080889E0
	ldr r0, _08088A08 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080889E0
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _080889E0
	movs r0, #1
	strb r0, [r1]
_080889E0:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #9
	bls _080889FA
	b _08088CB2
_080889FA:
	lsls r0, r0, #2
	ldr r1, _08088A0C @ =_08088A10
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08088A04: .4byte gNonGameplayRam
_08088A08: .4byte gChangedInput
_08088A0C: .4byte _08088A10
_08088A10: @ jump table
	.4byte _08088A38 @ case 0
	.4byte _08088A90 @ case 1
	.4byte _08088AB0 @ case 2
	.4byte _08088B34 @ case 3
	.4byte _08088B5C @ case 4
	.4byte _08088B7C @ case 5
	.4byte _08088B9C @ case 6
	.4byte _08088C00 @ case 7
	.4byte _08088C50 @ case 8
	.4byte _08088CB0 @ case 9
_08088A38:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08088A62
	ldr r0, _08088A88 @ =gNonGameplayRam
	ldr r3, _08088A8C @ =0x00000215
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _08088A62
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #3
	movs r1, #0
	movs r3, #1
	bl NewFileIntroSetupOam
_08088A62:
	ldr r1, _08088A88 @ =gNonGameplayRam
	movs r0, #0x84
	lsls r0, r0, #2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0x95
	bne _08088A72
	b _08088CB2
_08088A72:
	cmp r0, #0x96
	beq _08088A78
	b _08088CB2
_08088A78:
	movs r0, #0
	strh r0, [r2]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r1, r2
	movs r0, #1
	b _08088B4E
	.align 2, 0
_08088A88: .4byte gNonGameplayRam
_08088A8C: .4byte 0x00000215
_08088A90:
	bl NewFileIntroSamusLosingConsciousnessInit
	ldr r2, _08088AAC @ =gNonGameplayRam
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #2
	strb r0, [r1]
	b _08088CB2
	.align 2, 0
_08088AAC: .4byte gNonGameplayRam
_08088AB0:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r3, r4, r1
	ldrh r0, [r3]
	cmp r0, #1
	bne _08088AF4
	ldr r1, _08088AE0 @ =0x04000050
	ldr r2, _08088AE4 @ =0x00001844
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08088AE8 @ =0x0300122C
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, _08088AEC @ =0x0300122E
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0xa
	movs r3, #1
	bl NewFileIntroSetupOam
	ldr r1, _08088AF0 @ =gWrittenToBldy
	movs r0, #0
	strh r0, [r1]
	b _08088CB2
	.align 2, 0
_08088AE0: .4byte 0x04000050
_08088AE4: .4byte 0x00001844
_08088AE8: .4byte 0x0300122C
_08088AEC: .4byte 0x0300122E
_08088AF0: .4byte gWrittenToBldy
_08088AF4:
	cmp r0, #0x76
	bne _08088AFA
	b _08088CB2
_08088AFA:
	cmp r0, #0x78
	beq _08088B00
	b _08088CB2
_08088B00:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _08088B2C @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08088B30 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r4, r0
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	strh r2, [r3]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #3
	strb r0, [r1]
	b _08088CB2
	.align 2, 0
_08088B2C: .4byte 0x0000FBFF
_08088B30: .4byte 0x04000050
_08088B34:
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrh r0, [r1]
	cmp r0, #0x3c
	beq _08088B42
	b _08088CB2
_08088B42:
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #4
_08088B4E:
	strb r0, [r1]
	ldr r1, _08088B58 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	b _08088CB2
	.align 2, 0
_08088B58: .4byte gWrittenToBldy
_08088B5C:
	bl NewFileIntroSamusDriftingIntoAsteroidsInit
	ldr r2, _08088B78 @ =gNonGameplayRam
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #5
	strb r0, [r1]
	b _08088CB2
	.align 2, 0
_08088B78: .4byte gNonGameplayRam
_08088B7C:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #0
	strh r0, [r1]
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08088B92
	b _08088CB2
_08088B92:
	ldr r3, _08088B98 @ =0x00000215
	adds r0, r4, r3
	b _08088C86
	.align 2, 0
_08088B98: .4byte 0x00000215
_08088B9C:
	ldr r1, _08088BC0 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
	ldr r3, _08088BC4 @ =gWrittenToBldy
	ldrh r2, [r3]
	cmp r2, #0xf
	bhi _08088BC8
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #3
	bne _08088BE4
	movs r0, #0
	strh r0, [r1]
	adds r0, r2, #1
	strh r0, [r3]
	b _08088BE4
	.align 2, 0
_08088BC0: .4byte 0x04000050
_08088BC4: .4byte gWrittenToBldy
_08088BC8:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #0xa
	bne _08088BE4
	movs r0, #0
	strh r0, [r1]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #7
	strb r0, [r1]
	movs r6, #1
_08088BE4:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08088CB2
	ldr r0, _08088BF8 @ =gNonGameplayRam
	ldr r1, _08088BFC @ =0x00000215
	adds r0, r0, r1
	b _08088C86
	.align 2, 0
_08088BF8: .4byte gNonGameplayRam
_08088BFC: .4byte 0x00000215
_08088C00:
	ldr r3, _08088C20 @ =gWrittenToBldy
	ldrh r2, [r3]
	adds r1, r2, #0
	cmp r1, #0
	beq _08088C24
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #6
	bne _08088C36
	movs r0, #0
	strh r0, [r1]
	subs r0, r2, #1
	strh r0, [r3]
	b _08088C36
	.align 2, 0
_08088C20: .4byte gWrittenToBldy
_08088C24:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r4, r2
	strh r1, [r0]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #8
	strb r0, [r1]
_08088C36:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08088CB2
	ldr r0, _08088C48 @ =gNonGameplayRam
	ldr r1, _08088C4C @ =0x00000215
	adds r0, r0, r1
	b _08088C86
	.align 2, 0
_08088C48: .4byte gNonGameplayRam
_08088C4C: .4byte 0x00000215
_08088C50:
	adds r5, r4, #0
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0
	strh r0, [r1]
	movs r3, #0x86
	lsls r3, r3, #2
	adds r0, r5, r3
	ldrb r0, [r0]
	cmp r0, #1
	bne _08088C78
	movs r0, #0xc9
	bl SpecialCutsceneDestroyOamOfType
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #9
	strb r0, [r1]
_08088C78:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08088CB2
	ldr r1, _08088CAC @ =0x00000215
	adds r0, r4, r1
_08088C86:
	ldrb r0, [r0]
	cmp r0, #0xb
	bhi _08088CB2
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	movs r0, #0x24
	movs r3, #1
	bl NewFileIntroSetupOam
	b _08088CB2
	.align 2, 0
_08088CAC: .4byte 0x00000215
_08088CB0:
	movs r6, #1
_08088CB2:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	bl IntroProcessText
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroSamusDrifting
NewFileIntroSamusDrifting: @ 0x08088CC8
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08088CE0 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _08088CF4
	cmp r0, #1
	bgt _08088CE4
	cmp r0, #0
	beq _08088CEE
	b _08088D56
	.align 2, 0
_08088CE0: .4byte gNonGameplayRam
_08088CE4:
	cmp r0, #2
	beq _08088D0C
	cmp r0, #3
	beq _08088D2A
	b _08088D56
_08088CEE:
	bl NewFileIntroSamusDriftingInit
	b _08088D00
_08088CF4:
	bl SpecialCutsceneFadeIn
	ldr r0, _08088D08 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _08088D56
_08088D00:
	movs r0, #2
	strh r0, [r4, #8]
	b _08088D56
	.align 2, 0
_08088D08: .4byte gWrittenToBldy
_08088D0C:
	bl NewFileIntroSamusDriftingProcess
	cmp r0, #0
	beq _08088D56
	movs r1, #0
	movs r0, #3
	strh r0, [r4, #8]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r4, r2
	strh r5, [r0]
	adds r2, #4
	adds r0, r4, r2
	strb r1, [r0]
	b _08088D56
_08088D2A:
	ldr r1, _08088D38 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08088D3C
	adds r0, #1
	strh r0, [r1]
	b _08088D4E
	.align 2, 0
_08088D38: .4byte gWrittenToBldy
_08088D3C:
	ldr r1, _08088D60 @ =0x00000213
	adds r0, r4, r1
	strb r5, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r5, [r0]
	strh r5, [r4, #8]
	movs r5, #1
_08088D4E:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08088D56:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08088D60: .4byte 0x00000213

	thumb_func_start NewFileIntroProcessBslShip
NewFileIntroProcessBslShip: @ 0x08088D64
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0xc]
	movs r6, #0
	strh r1, [r5, #4]
	ldrb r0, [r5, #0x14]
	cmp r0, #0
	bne _08088D78
	movs r0, #2
	b _08088E46
_08088D78:
	cmp r0, #1
	bne _08088DBC
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	movs r0, #0
	ldrsh r1, [r5, r0]
	movs r0, #0x3c
	subs r0, r0, r1
	ldrh r1, [r5, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	ldrh r1, [r5]
	adds r2, r0, r1
	strh r2, [r5, #0xc]
	movs r3, #2
	ldrsh r1, [r5, r3]
	movs r0, #0xa
	subs r0, r0, r1
	ldrh r1, [r5, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	ldrh r4, [r5, #2]
	adds r1, r0, r4
	strh r1, [r5, #0xe]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x27
	ble _08088E96
	strh r6, [r5, #0xa]
	strh r2, [r5]
	strh r1, [r5, #2]
	movs r0, #2
	b _08088E94
_08088DBC:
	cmp r0, #2
	bne _08088DE2
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08088E96
	strh r6, [r5, #0xa]
	strh r6, [r5]
	movs r0, #4
	strh r0, [r5, #2]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #8]
	movs r0, #0x80
	strb r0, [r5, #0x13]
	movs r0, #3
	b _08088E94
_08088DE2:
	cmp r0, #3
	bne _08088E40
	movs r7, #0
	ldrsh r3, [r5, r7]
	ldr r2, _08088E3C @ =sSineTable
	ldrb r1, [r5, #0x13]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r3, #0
	muls r4, r0, r4
	movs r7, #2
	ldrsh r3, [r5, r7]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r7, #0
	ldrsh r0, [r1, r7]
	muls r3, r0, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	muls r0, r4, r0
	adds r2, #0x80
	movs r4, #0
	ldrsh r1, [r2, r4]
	muls r1, r3, r1
	adds r0, r0, r1
	asrs r0, r0, #0x10
	ldrh r7, [r5, #8]
	adds r0, r0, r7
	strh r0, [r5, #0xe]
	ldrb r0, [r5, #0x13]
	adds r0, #1
	strb r0, [r5, #0x13]
	ldrh r0, [r5, #0xa]
	cmp r0, #0x3c
	beq _08088E96
	cmp r0, #0xc8
	bne _08088E96
	strh r6, [r5, #0xa]
	movs r0, #4
	b _08088E94
	.align 2, 0
_08088E3C: .4byte sSineTable
_08088E40:
	cmp r0, #4
	bne _08088E50
	movs r0, #5
_08088E46:
	strb r0, [r5, #0x14]
	strh r1, [r5]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	b _08088E96
_08088E50:
	cmp r0, #5
	bne _08088E96
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	movs r0, #0
	ldrsh r1, [r5, r0]
	movs r0, #0x82
	lsls r0, r0, #2
	subs r0, r0, r1
	ldrh r1, [r5, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	ldrh r1, [r5]
	adds r2, r0, r1
	strh r2, [r5, #0xc]
	movs r3, #2
	ldrsh r1, [r5, r3]
	movs r0, #0x64
	subs r0, r0, r1
	ldrh r1, [r5, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	ldrh r4, [r5, #2]
	adds r3, r0, r4
	strh r3, [r5, #0xe]
	lsls r1, r2, #0x10
	ldr r0, _08088EA8 @ =0x02070000
	cmp r1, r0
	ble _08088E96
	strh r6, [r5, #0xa]
	strh r2, [r5]
	strh r3, [r5, #2]
	movs r0, #6
_08088E94:
	strb r0, [r5, #0x14]
_08088E96:
	ldr r1, _08088EAC @ =0x0300122C
	ldrh r0, [r5, #0xc]
	strh r0, [r1]
	ldr r1, _08088EB0 @ =0x0300122E
	ldrh r0, [r5, #0xe]
	strh r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08088EA8: .4byte 0x02070000
_08088EAC: .4byte 0x0300122C
_08088EB0: .4byte 0x0300122E

	thumb_func_start NewFileIntroProcessFlyingSamusShip
NewFileIntroProcessFlyingSamusShip: @ 0x08088EB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r3, #0
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	bne _08088ED2
	ldrh r0, [r6, #0xc]
	strh r0, [r6, #4]
	ldrh r0, [r6, #0xe]
	strh r0, [r6, #8]
	movs r0, #0x40
	strb r0, [r6, #0x13]
	movs r0, #2
	strb r0, [r6, #0x14]
	b _08088F7A
_08088ED2:
	cmp r0, #1
	bne _08088EF4
	ldrb r1, [r6, #0x13]
	adds r1, #1
	strb r1, [r6, #0x13]
	ldrh r0, [r6, #6]
	subs r0, #2
	strh r0, [r6, #6]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x80
	bne _08088F7A
	movs r0, #2
	strb r0, [r6, #0x14]
	adds r0, #0xfe
	strh r0, [r6, #6]
	b _08088F7A
_08088EF4:
	cmp r0, #2
	bne _08088F0C
	strh r3, [r6]
	movs r0, #8
	strh r0, [r6, #2]
	ldrh r0, [r6, #0xc]
	strh r0, [r6, #4]
	ldrh r0, [r6, #0xe]
	strh r0, [r6, #8]
	movs r0, #3
	strb r0, [r6, #0x14]
	b _08088F7A
_08088F0C:
	cmp r0, #3
	bne _08088F18
	ldrb r0, [r6, #0x13]
	adds r0, #2
	strb r0, [r6, #0x13]
	b _08088F7A
_08088F18:
	cmp r0, #4
	bne _08088F38
	ldrb r0, [r6, #0x13]
	adds r0, #1
	strb r0, [r6, #0x13]
	ldrh r0, [r6, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xb4
	bne _08088F7A
	strh r3, [r6, #0xa]
	movs r0, #5
	strb r0, [r6, #0x14]
	b _08088F7A
_08088F38:
	cmp r0, #5
	bne _08088F5E
	ldrh r2, [r6, #0xc]
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r1, #0
	subs r0, r0, r2
	strh r0, [r6]
	movs r1, #0x3c
	strh r1, [r6, #2]
	adds r2, r2, r0
	strh r2, [r6, #4]
	ldrh r0, [r6, #0xe]
	strh r0, [r6, #8]
	movs r0, #0x80
	strb r0, [r6, #0x13]
	movs r0, #6
	strb r0, [r6, #0x14]
	b _08088F7A
_08088F5E:
	cmp r0, #6
	bne _08088F7A
	ldrb r0, [r6, #0x13]
	adds r0, #1
	strb r0, [r6, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08088F7A
	strb r3, [r6, #0x10]
	ldrb r1, [r6, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #0x18]
_08088F7A:
	movs r2, #0
	ldrsh r3, [r6, r2]
	ldr r2, _08088FD8 @ =sSineTable
	ldrb r1, [r6, #0x13]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r5, r3, #0
	muls r5, r0, r5
	movs r0, #2
	ldrsh r3, [r6, r0]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r4, r3, #0
	muls r4, r0, r4
	adds r0, r2, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r1, r5, #0
	muls r1, r3, r1
	movs r0, #0
	ldrsh r2, [r2, r0]
	adds r0, r4, #0
	muls r0, r2, r0
	subs r1, r1, r0
	adds r0, r5, #0
	muls r0, r2, r0
	adds r2, r4, #0
	muls r2, r3, r2
	adds r0, r0, r2
	asrs r1, r1, #0x10
	ldrh r2, [r6, #4]
	adds r1, r1, r2
	strh r1, [r6, #0xc]
	asrs r0, r0, #0x10
	ldrh r4, [r6, #8]
	adds r0, r0, r4
	strh r0, [r6, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08088FD8: .4byte sSineTable

	thumb_func_start NewFileIntroProcessHorizontalParticle
NewFileIntroProcessHorizontalParticle: @ 0x08088FDC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _08089018
	bl SpecialCutsceneGetRandomNumber
	movs r1, #7
	ands r1, r0
	adds r1, #1
	strh r1, [r4, #8]
	bl SpecialCutsceneGetRandomNumber
	movs r1, #3
	ands r1, r0
	strh r1, [r4, #4]
	ldr r1, _08089014 @ =0x0879C2CC
	movs r2, #4
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _0808906A
	.align 2, 0
_08089014: .4byte 0x0879C2CC
_08089018:
	cmp r0, #1
	bne _0808906A
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldrh r0, [r4, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #4
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _0808906A
	movs r0, #0
	strb r0, [r4, #0x13]
	ldrh r1, [r4, #4]
	movs r2, #4
	ldrsh r0, [r4, r2]
	cmp r0, #4
	bgt _08089052
	adds r0, r1, #1
	b _08089054
_08089052:
	movs r0, #0
_08089054:
	strh r0, [r4, #4]
	ldr r1, _0808908C @ =0x0879C2CC
	movs r2, #4
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	movs r0, #0
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
_0808906A:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xef
	bgt _0808907A
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0x9f
	ble _08089086
_0808907A:
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	subs r0, #2
	ands r0, r1
	strb r0, [r4, #0x18]
_08089086:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808908C: .4byte 0x0879C2CC

	thumb_func_start unk_89090
unk_89090: @ 0x08089090
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bne _080890AE
	movs r0, #0
	strb r0, [r1, #0x12]
	ldr r1, _080890B4 @ =0x03001230
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_080890AE:
	pop {r0}
	bx r0
	.align 2, 0
_080890B4: .4byte 0x03001230

	thumb_func_start NewFileIntroProcessSamusFainting
NewFileIntroProcessSamusFainting: @ 0x080890B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08089114 @ =sRandomNumberTable
	ldr r2, _08089118 @ =gFrameCounter16Bit
	ldrh r1, [r2]
	movs r3, #0x1f
	adds r0, r3, #0
	ands r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsrs r6, r0, #1
	ldrh r0, [r2]
	adds r0, #7
	ands r0, r3
	adds r0, r0, r4
	ldrb r0, [r0]
	lsrs r2, r0, #1
	adds r3, r2, #0
	movs r0, #8
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bne _0808911C
	ldrb r0, [r5, #0x13]
	adds r0, #1
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089144
	strb r1, [r5, #0x13]
	ldrh r1, [r5, #0xe]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	cmp r0, #0xf
	bgt _08089144
	adds r0, r1, r2
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08089144
	movs r0, #0x10
	strh r0, [r5, #0xe]
	movs r0, #1
	strh r0, [r5, #8]
	b _08089144
	.align 2, 0
_08089114: .4byte sRandomNumberTable
_08089118: .4byte gFrameCounter16Bit
_0808911C:
	ldrb r0, [r5, #0x13]
	adds r0, #1
	movs r2, #0
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08089144
	strb r2, [r5, #0x13]
	ldrh r1, [r5, #0xe]
	movs r4, #0xe
	ldrsh r0, [r5, r4]
	cmp r0, #0
	ble _08089144
	subs r0, r1, r3
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08089144
	strh r2, [r5, #0xe]
	strh r2, [r5, #8]
_08089144:
	movs r0, #4
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bne _0808917A
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080891A2
	strh r1, [r5, #0xa]
	ldrh r1, [r5, #0xc]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	cmp r0, #0xf
	bgt _080891A2
	adds r0, r1, r6
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _080891A2
	movs r0, #0x10
	strh r0, [r5, #0xc]
	movs r0, #1
	strh r0, [r5, #4]
	b _080891A2
_0808917A:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	movs r2, #0
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _080891A2
	strh r2, [r5, #0xa]
	ldrh r1, [r5, #0xc]
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _080891A2
	subs r0, r1, r6
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080891A2
	strh r2, [r5, #0xc]
	strh r2, [r5, #4]
_080891A2:
	ldr r1, _080891B4 @ =0x0300122C
	ldrh r0, [r5, #0xc]
	strh r0, [r1]
	ldr r1, _080891B8 @ =0x0300122E
	ldrh r0, [r5, #0xe]
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080891B4: .4byte 0x0300122C
_080891B8: .4byte 0x0300122E

	thumb_func_start NewFileIntroProcessSamusDrifting
NewFileIntroProcessSamusDrifting: @ 0x080891BC
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	ldrb r3, [r2, #0x14]
	cmp r3, #0
	bne _080891DC
	strh r3, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	strh r0, [r2]
	ldrh r0, [r2, #0xe]
	strh r0, [r2, #2]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0808920A
_080891DC:
	cmp r3, #1
	bne _0808920A
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x11
	ldrh r3, [r2]
	adds r0, r0, r3
	strh r0, [r2, #0xc]
	lsrs r1, r1, #0x12
	ldrh r0, [r2, #2]
	adds r1, r1, r0
	strh r1, [r2, #0xe]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808920A
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r0, [r2, #6]
	adds r0, #1
	strh r0, [r2, #6]
_0808920A:
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	movs r0, #0x8c
	lsls r0, r0, #1
	cmp r1, r0
	bgt _0808921E
	movs r1, #0xe
	ldrsh r0, [r2, r1]
	cmp r0, #0xb4
	ble _0808922A
_0808921E:
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	subs r0, #2
	ands r0, r1
	strb r0, [r2, #0x18]
_0808922A:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessSamusDriftingIntoAsteroids
NewFileIntroProcessSamusDriftingIntoAsteroids: @ 0x08089230
	push {r4, r5, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0xa]
	adds r1, r0, #1
	movs r5, #0
	movs r4, #0
	strh r1, [r3, #0xa]
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	bne _0808925C
	strh r0, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	ldrb r0, [r3, #0x15]
	subs r0, #4
	strb r0, [r3, #0x15]
	ldrh r0, [r3, #6]
	subs r0, #8
	strh r0, [r3, #6]
	b _080892D2
_0808925C:
	cmp r0, #1
	bne _080892DC
	ldrb r1, [r3, #0x13]
	adds r1, #1
	strb r1, [r3, #0x13]
	ldr r2, _080892D8 @ =sSineTable
	ldrb r0, [r3, #0x13]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	ldrh r2, [r3, #2]
	adds r0, r0, r2
	strh r0, [r3, #0xe]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x34
	bls _080892B4
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0808929E
	ldrb r0, [r3, #0x15]
	subs r0, #1
	strb r0, [r3, #0x15]
	ldrh r0, [r3, #0xc]
	subs r0, #1
	strh r0, [r3, #0xc]
	strh r4, [r3, #4]
_0808929E:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _080892B4
	strh r4, [r3, #8]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
_080892B4:
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	blt _080892BE
	b _08089482
_080892BE:
	movs r1, #0
	movs r0, #0
	strh r0, [r3, #8]
	strh r0, [r3, #0xa]
	strh r0, [r3, #4]
	strb r1, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
_080892D2:
	movs r0, #2
	strb r0, [r3, #0x14]
	b _08089482
	.align 2, 0
_080892D8: .4byte sSineTable
_080892DC:
	cmp r0, #2
	bne _08089358
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x12
	ldrh r0, [r3]
	subs r0, r0, r2
	strh r0, [r3, #0xc]
	lsrs r1, r1, #0x13
	ldrh r2, [r3, #2]
	subs r2, r2, r1
	ldr r1, _08089354 @ =sSineTable
	ldrb r0, [r3, #0x13]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r2, r2, r0
	strh r2, [r3, #0xe]
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0808931E
	ldrb r0, [r3, #0x15]
	subs r0, #1
	strb r0, [r3, #0x15]
	strh r4, [r3, #4]
_0808931E:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08089334
	strh r4, [r3, #8]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
_08089334:
	ldrb r0, [r3, #0x13]
	cmp r0, #0
	beq _0808933C
	b _08089482
_0808933C:
	strh r4, [r3, #8]
	strh r4, [r3, #0xa]
	strh r4, [r3, #4]
	strb r5, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	movs r0, #3
	strb r0, [r3, #0x14]
	b _08089482
	.align 2, 0
_08089354: .4byte sSineTable
_08089358:
	cmp r0, #3
	bne _080893C0
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x12
	ldrh r0, [r3]
	subs r0, r0, r2
	strh r0, [r3, #0xc]
	lsrs r1, r1, #0x13
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0808938A
	ldrb r0, [r3, #0x15]
	subs r0, #1
	strb r0, [r3, #0x15]
	strh r4, [r3, #4]
_0808938A:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080893A0
	strh r4, [r3, #8]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
_080893A0:
	ldrb r0, [r3, #0x13]
	cmp r0, #0
	bne _080893BA
	strh r4, [r3, #8]
	strh r4, [r3, #0xa]
	strh r4, [r3, #4]
	strb r5, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	movs r0, #4
	strb r0, [r3, #0x14]
_080893BA:
	movs r1, #6
	ldrsh r0, [r3, r1]
	b _0808940C
_080893C0:
	cmp r0, #4
	bne _08089426
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x11
	ldrh r0, [r3]
	subs r0, r0, r2
	strh r0, [r3, #0xc]
	lsrs r1, r1, #0x12
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _080893F2
	ldrb r0, [r3, #0x15]
	subs r0, #1
	strb r0, [r3, #0x15]
	strh r4, [r3, #4]
_080893F2:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08089408
	strh r4, [r3, #8]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
_08089408:
	movs r2, #6
	ldrsh r0, [r3, r2]
_0808940C:
	cmp r0, #2
	bgt _08089482
	strh r4, [r3, #8]
	strh r4, [r3, #0xa]
	strh r4, [r3, #4]
	strb r5, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	movs r0, #5
	strb r0, [r3, #0x14]
	b _08089482
_08089426:
	cmp r0, #5
	bne _0808945C
	strh r4, [r3, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #6]
	strb r5, [r3, #0x12]
	strb r5, [r3, #0x11]
	ldrb r1, [r3, #0x18]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x18]
	ldr r0, _08089454 @ =0x08598000
	str r0, [r3, #0x1c]
	movs r1, #6
	strb r1, [r3, #0x14]
	ldr r0, _08089458 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r0, r2
	strb r1, [r0]
	b _08089482
	.align 2, 0
_08089454: .4byte 0x08598000
_08089458: .4byte gNonGameplayRam
_0808945C:
	cmp r0, #6
	bne _08089482
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #3
	ldr r1, [r3, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r3, #0x12]
	cmp r0, r2
	bne _08089482
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _08089482
	strb r5, [r3, #0x10]
	ldrb r1, [r3, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x18]
_08089482:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start unk_89488
unk_89488: @ 0x08089488
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r5, [r4, #0x14]
	cmp r5, #0
	bne _080894E4
	ldrh r1, [r4, #0xc]
	adds r1, #0x7a
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0x20
	movs r3, #0
	bl NewFileIntroSetupOam
	ldrh r1, [r4, #0xc]
	adds r1, #0x32
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0x21
	movs r3, #0
	bl NewFileIntroSetupOam
	ldrh r1, [r4, #0xc]
	adds r1, #0x24
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0x22
	movs r3, #0
	bl NewFileIntroSetupOam
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0x23
	movs r3, #0
	bl NewFileIntroSetupOam
	strb r5, [r4, #0x10]
_080894E4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessSidewaysBslShip
NewFileIntroProcessSidewaysBslShip: @ 0x080894EC
	push {r4, lr}
	adds r2, r0, #0
	ldrb r3, [r2, #0x14]
	cmp r3, #0
	bne _08089536
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bne _080895A8
	ldrh r0, [r2]
	adds r0, #1
	movs r1, #0
	strh r0, [r2]
	strb r1, [r2, #0x13]
	ldrh r0, [r2, #0xa]
	cmp r0, #4
	bne _08089516
	strh r3, [r2, #0xa]
_08089516:
	ldrh r0, [r2, #0xa]
	adds r1, r0, #0
	adds r3, r0, #0
	cmp r1, #1
	bhi _08089526
	ldrh r0, [r2, #0xe]
	adds r0, #1
	b _0808952E
_08089526:
	cmp r1, #3
	bhi _08089530
	ldrh r0, [r2, #0xe]
	subs r0, #1
_0808952E:
	strh r0, [r2, #0xe]
_08089530:
	adds r0, r3, #1
	strh r0, [r2, #0xa]
	b _080895A8
_08089536:
	cmp r3, #1
	bne _0808954A
	ldrh r0, [r2, #0xc]
	movs r1, #0
	strh r0, [r2]
	ldrh r0, [r2, #0xe]
	strh r0, [r2, #2]
	strh r1, [r2, #0xa]
	movs r0, #2
	b _080895A6
_0808954A:
	cmp r3, #2
	bne _080895A8
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08089566
	ldrh r0, [r2, #0xa]
	adds r0, #1
	movs r1, #0
	strh r0, [r2, #0xa]
	strb r1, [r2, #0x13]
_08089566:
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0xe1
	lsls r0, r0, #2
	subs r0, r0, r1
	ldrh r1, [r2, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	ldrh r1, [r2]
	adds r3, r0, r1
	strh r3, [r2, #0xc]
	movs r4, #4
	ldrsh r0, [r2, r4]
	movs r4, #2
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	ldrh r1, [r2, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xb
	ldrh r1, [r2, #2]
	adds r4, r0, r1
	strh r4, [r2, #0xe]
	lsls r1, r3, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080895A8
	movs r0, #0
	strh r0, [r2, #0xa]
	strh r3, [r2]
	strh r4, [r2, #2]
	movs r0, #3
_080895A6:
	strb r0, [r2, #0x14]
_080895A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessDepthParticle
NewFileIntroProcessDepthParticle: @ 0x080895B0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0xa]
	strh r1, [r6, #4]
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	bne _080895DA
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	subs r0, #0x78
	movs r1, #0x64
	muls r0, r1, r0
	strh r0, [r6]
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	subs r0, #0x50
	muls r0, r1, r0
	strh r0, [r6, #2]
	movs r0, #1
	strb r0, [r6, #0x14]
	b _08089666
_080895DA:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x63
	bgt _08089658
	cmp r0, #0x19
	bne _080895F0
	ldr r0, _080895EC @ =0x08597ED0
	b _08089602
	.align 2, 0
_080895EC: .4byte 0x08597ED0
_080895F0:
	cmp r0, #0x32
	bne _080895FC
	ldr r0, _080895F8 @ =0x08597EE0
	b _08089602
	.align 2, 0
_080895F8: .4byte 0x08597EE0
_080895FC:
	cmp r0, #0x46
	bne _08089604
	ldr r0, _08089654 @ =0x08597EF0
_08089602:
	str r0, [r6, #0x1c]
_08089604:
	movs r0, #4
	ldrsh r4, [r6, r0]
	rsbs r4, r4, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	adds r0, #0x78
	strh r0, [r6, #0xc]
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r4, #0
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x50
	strh r1, [r6, #0xe]
	adds r5, #0x80
	lsls r5, r5, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	cmp r5, r0
	bhi _08089648
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xa8
	bgt _08089648
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08089666
_08089648:
	movs r0, #0
	strb r0, [r6, #0x10]
	ldrb r1, [r6, #0x18]
	subs r0, #2
	b _08089662
	.align 2, 0
_08089654: .4byte 0x08597EF0
_08089658:
	movs r0, #0
	strb r0, [r6, #0x10]
	ldrb r1, [r6, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
_08089662:
	ands r0, r1
	strb r0, [r6, #0x18]
_08089666:
	ldrh r0, [r6, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroSetupOam
NewFileIntroSetupOam: @ 0x08089674
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _080896DC
	movs r2, #0
	ldr r0, _080896D8 @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r1, r0, r3
	ldrb r1, [r1]
	mov ip, r0
	cmp r1, #0
	beq _080896CA
	mov r4, ip
_080896AA:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x13
	bgt _0808971C
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080896AA
_080896CA:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	adds r7, r0, #0
	cmp r1, #0x13
	ble _08089724
	b _0808971C
	.align 2, 0
_080896D8: .4byte gNonGameplayRam
_080896DC:
	movs r2, #0x13
	ldr r0, _08089720 @ =gNonGameplayRam
	movs r3, #0x9b
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrb r1, [r1]
	mov ip, r0
	cmp r1, #0
	beq _08089714
	mov r3, ip
	movs r4, #0x8b
	lsls r4, r4, #2
_080896F4:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _0808971C
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080896F4
_08089714:
	lsls r0, r2, #0x18
	adds r7, r0, #0
	cmp r7, #0
	bge _08089724
_0808971C:
	movs r0, #0x14
	b _08089A5A
	.align 2, 0
_08089720: .4byte gNonGameplayRam
_08089724:
	movs r0, #0
	str r0, [sp]
	ldr r2, _0808978C @ =0x040000D4
	mov r3, sp
	str r3, [r2]
	asrs r1, r7, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r5, r0, #2
	ldr r3, _08089790 @ =0x030016A0
	adds r0, r5, r3
	str r0, [r2, #4]
	ldr r0, _08089794 @ =0x85000009
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08089798 @ =0xFFFFFDE4
	adds r0, r3, r1
	adds r2, r5, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r1, #0
	mov r8, r1
	mov r1, sb
	strh r1, [r0]
	ldr r1, _0808979C @ =0x0000022A
	adds r0, r2, r1
	mov r1, sl
	strh r1, [r0]
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r6, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r4, r2, r0
	ldrb r1, [r4]
	movs r0, #1
	orrs r1, r0
	strb r1, [r4]
	cmp r6, #1
	bne _080897A4
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _080897A0 @ =NewFileIntroProcessBslShip
	b _08089A56
	.align 2, 0
_0808978C: .4byte 0x040000D4
_08089790: .4byte 0x030016A0
_08089794: .4byte 0x85000009
_08089798: .4byte 0xFFFFFDE4
_0808979C: .4byte 0x0000022A
_080897A0: .4byte NewFileIntroProcessBslShip
_080897A4:
	cmp r6, #2
	bne _080897D4
	ldr r0, _080897C8 @ =0x00000222
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _080897CC @ =0x08597F50
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _080897D0 @ =NewFileIntroProcessFlyingSamusShip
	b _08089A56
	.align 2, 0
_080897C8: .4byte 0x00000222
_080897CC: .4byte 0x08597F50
_080897D0: .4byte NewFileIntroProcessFlyingSamusShip
_080897D4:
	cmp r6, #3
	bne _08089804
	ldr r1, _080897F8 @ =0x00000236
	adds r2, r2, r1
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _080897FC @ =0x08597EC0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08089800 @ =NewFileIntroProcessHorizontalParticle
	b _08089A56
	.align 2, 0
_080897F8: .4byte 0x00000236
_080897FC: .4byte 0x08597EC0
_08089800: .4byte NewFileIntroProcessHorizontalParticle
_08089804:
	cmp r6, #4
	bne _08089820
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808981C @ =unk_89090
	b _08089A56
	.align 2, 0
_0808981C: .4byte unk_89090
_08089820:
	cmp r6, #0xa
	bne _0808983C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08089838 @ =NewFileIntroProcessSamusFainting
	b _08089A56
	.align 2, 0
_08089838: .4byte NewFileIntroProcessSamusFainting
_0808983C:
	cmp r6, #0x14
	bne _08089874
	ldr r0, _08089868 @ =0x00000222
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldrb r0, [r4]
	movs r1, #6
	orrs r0, r1
	strb r0, [r4]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808986C @ =0x08597F50
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08089870 @ =NewFileIntroProcessSamusDrifting
	b _08089A56
	.align 2, 0
_08089868: .4byte 0x00000222
_0808986C: .4byte 0x08597F50
_08089870: .4byte NewFileIntroProcessSamusDrifting
_08089874:
	cmp r6, #0x1e
	bne _080898C8
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, sb
	strh r1, [r0]
	ldr r1, _080898B8 @ =0x0000021E
	adds r0, r2, r1
	mov r1, sl
	strh r1, [r0]
	ldr r0, _080898BC @ =0x00000222
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldrb r1, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _080898C0 @ =0x08597F88
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _080898C4 @ =NewFileIntroProcessSamusDriftingIntoAsteroids
	b _08089A56
	.align 2, 0
_080898B8: .4byte 0x0000021E
_080898BC: .4byte 0x00000222
_080898C0: .4byte 0x08597F88
_080898C4: .4byte NewFileIntroProcessSamusDriftingIntoAsteroids
_080898C8:
	cmp r6, #0x1f
	bne _080898F0
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _080898E8 @ =0x08597F88
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _080898EC @ =unk_89488
	b _08089A56
	.align 2, 0
_080898E8: .4byte 0x08597F88
_080898EC: .4byte unk_89488
_080898F0:
	cmp r6, #0x20
	bne _08089920
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _08089914 @ =0x0000FFD8
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08089918 @ =0x08597FE0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808991C @ =NewFileIntroProcessSidewaysBslShip
	b _08089A56
	.align 2, 0
_08089914: .4byte 0x0000FFD8
_08089918: .4byte 0x08597FE0
_0808991C: .4byte NewFileIntroProcessSidewaysBslShip
_08089920:
	cmp r6, #0x21
	bne _08089950
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _08089944 @ =0x0000FFE2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08089948 @ =0x08597FD0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808994C @ =NewFileIntroProcessSidewaysBslShip
	b _08089A56
	.align 2, 0
_08089944: .4byte 0x0000FFE2
_08089948: .4byte 0x08597FD0
_0808994C: .4byte NewFileIntroProcessSidewaysBslShip
_08089950:
	cmp r6, #0x22
	bne _08089980
	asrs r0, r7, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r2, ip
	adds r0, r1, r2
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r2, _08089978 @ =0x0000FFEC
	strh r2, [r0]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, ip
	adds r0, r1, r0
	ldr r2, _0808997C @ =0x08597FC0
	b _080899A4
	.align 2, 0
_08089978: .4byte 0x0000FFEC
_0808997C: .4byte 0x08597FC0
_08089980:
	cmp r6, #0x23
	bne _080899C0
	asrs r0, r7, #0x18
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r2, ip
	adds r0, r1, r2
	movs r3, #0x88
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r2, _080899B4 @ =0x0000FFF6
	strh r2, [r0]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, ip
	adds r0, r1, r0
	ldr r2, _080899B8 @ =0x08597FB0
_080899A4:
	str r2, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	adds r1, r1, r0
	ldr r0, _080899BC @ =NewFileIntroProcessSidewaysBslShip
	str r0, [r1]
	b _08089A58
	.align 2, 0
_080899B4: .4byte 0x0000FFF6
_080899B8: .4byte 0x08597FB0
_080899BC: .4byte NewFileIntroProcessSidewaysBslShip
_080899C0:
	cmp r6, #0x24
	bne _08089A08
	asrs r0, r7, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r0, ip
	adds r3, r2, r0
	ldr r1, _080899FC @ =0x00000236
	adds r3, r3, r1
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, ip
	adds r0, r2, r0
	ldr r1, _08089A00 @ =0x08597EC0
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	adds r2, r2, r0
	ldr r0, _08089A04 @ =NewFileIntroProcessDepthParticle
	str r0, [r2]
	b _08089A58
	.align 2, 0
_080899FC: .4byte 0x00000236
_08089A00: .4byte 0x08597EC0
_08089A04: .4byte NewFileIntroProcessDepthParticle
_08089A08:
	cmp r6, #0xc8
	bne _08089A34
	asrs r1, r7, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x8e
	lsls r1, r1, #2
	add r1, ip
	adds r1, r0, r1
	ldr r2, _08089A2C @ =0x08613180
	str r2, [r1]
	movs r1, #0x8f
	lsls r1, r1, #2
	add r1, ip
	adds r0, r0, r1
	ldr r1, _08089A30 @ =NewFileIntroProcessTextCursor
	b _08089A56
	.align 2, 0
_08089A2C: .4byte 0x08613180
_08089A30: .4byte NewFileIntroProcessTextCursor
_08089A34:
	cmp r6, #0xc9
	bne _08089A58
	asrs r1, r7, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x8e
	lsls r1, r1, #2
	add r1, ip
	adds r1, r0, r1
	ldr r2, _08089A6C @ =0x08613180
	str r2, [r1]
	movs r1, #0x8f
	lsls r1, r1, #2
	add r1, ip
	adds r0, r0, r1
	ldr r1, _08089A70 @ =unk_89ab0
_08089A56:
	str r1, [r0]
_08089A58:
	lsrs r0, r7, #0x18
_08089A5A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08089A6C: .4byte 0x08613180
_08089A70: .4byte unk_89ab0

	thumb_func_start unk_89a74
unk_89a74: @ 0x08089A74
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #1
	bl NewFileIntroSetupOam
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08089AAC @ =gNonGameplayRam
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r1, r0
	strh r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08089AAC: .4byte gNonGameplayRam

	thumb_func_start unk_89ab0
unk_89ab0: @ 0x08089AB0
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroSr388PreviewInit
NewFileIntroSr388PreviewInit: @ 0x08089AB4
	push {r4, r5, lr}
	sub sp, #4
	ldr r5, _08089C5C @ =unk_99940
	adds r0, r5, #0
	bl CallbackSetVBlank
	movs r0, #0
	str r0, [sp]
	ldr r4, _08089C60 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r0, _08089C64 @ =gNonGameplayRam
	str r0, [r4, #4]
	ldr r0, _08089C68 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08089C6C @ =0x0859A1B8
	ldr r1, _08089C70 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _08089C74 @ =0x0859D900
	str r0, [r4]
	ldr r0, _08089C78 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _08089C7C @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08089C80 @ =0x08613148
	str r0, [r4]
	ldr r0, _08089C84 @ =0x06017FE0
	str r0, [r4, #4]
	ldr r1, _08089C88 @ =0x84000008
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08089C8C @ =0x086131A8
	str r0, [r4]
	ldr r0, _08089C90 @ =0x050003E0
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	adds r0, r5, #0
	bl CallbackSetVBlank
	movs r4, #0
	ldr r5, _08089C94 @ =0x0879C3C8
_08089B0E:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r1, r4, #0xc
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl LZ77UncompVram
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #7
	bls _08089B0E
	ldr r0, _08089C98 @ =0x08598D2C
	ldr r1, _08089C9C @ =0x0600E800
	bl LZ77UncompVram
	movs r4, #0
	ldr r5, _08089CA0 @ =0x0879C3E8
_08089B36:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r1, r4, #0xc
	ldr r3, _08089CA4 @ =0x06008000
	adds r1, r1, r3
	bl LZ77UncompVram
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _08089B36
	ldr r0, _08089CA8 @ =0x085995C8
	ldr r1, _08089CAC @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08089CB0 @ =0x085999EC
	ldr r1, _08089CB4 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _08089CB8 @ =0x08598898
	ldr r1, _08089CBC @ =0x0600E000
	bl LZ77UncompVram
	ldr r1, _08089C60 @ =0x040000D4
	ldr r0, _08089CC0 @ =0x08598B2C
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08089C7C @ =0x84000080
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xcc
	ldr r2, _08089CC4 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _08089CC8 @ =0x00001D01
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08089CCC @ =0x00001E0A
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _08089CD0 @ =0x00001F0B
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08089CD4 @ =gBg1XPosition
	movs r2, #0
	strh r2, [r0]
	ldr r0, _08089CD8 @ =gBg1YPosition
	strh r2, [r0]
	ldr r4, _08089CDC @ =0x0300122C
	movs r0, #0x10
	strh r0, [r4]
	ldr r0, _08089CE0 @ =0x0300122E
	strh r2, [r0]
	ldr r0, _08089CE4 @ =0x03001230
	strh r2, [r0]
	ldr r0, _08089CE8 @ =0x03001232
	strh r2, [r0]
	adds r1, #2
	ldr r3, _08089CEC @ =0x0000FFF8
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08089CF0 @ =0x04000012
	strh r2, [r0]
	movs r0, #0x32
	movs r1, #0xfa
	movs r2, #0xc8
	bl NewFileIntroSr388SetupOam
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSr388SetupOam
	movs r0, #0
	ldrsh r1, [r4, r0]
	movs r0, #2
	movs r2, #0
	bl NewFileIntroSr388SetupOam
	movs r3, #0xc
	rsbs r3, r3, #0
	movs r0, #3
	movs r1, #0xfa
	movs r2, #0x64
	bl NewFileIntroSetupSr388PreviewAsteroid
	movs r3, #8
	rsbs r3, r3, #0
	movs r0, #4
	movs r1, #0x96
	movs r2, #0xa
	bl NewFileIntroSetupSr388PreviewAsteroid
	movs r3, #6
	rsbs r3, r3, #0
	movs r0, #5
	movs r1, #0x32
	movs r2, #0x3c
	bl NewFileIntroSetupSr388PreviewAsteroid
	movs r3, #0x14
	rsbs r3, r3, #0
	movs r0, #6
	movs r1, #0xbe
	movs r2, #0x82
	bl NewFileIntroSetupSr388PreviewAsteroid
	movs r1, #0x8c
	lsls r1, r1, #1
	movs r3, #0xa
	rsbs r3, r3, #0
	movs r0, #5
	movs r2, #0x1e
	bl NewFileIntroSetupSr388PreviewAsteroid
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _08089C64 @ =gNonGameplayRam
	ldr r0, _08089CF4 @ =0x0863A19C
	str r0, [r1]
	movs r0, #4
	movs r1, #0xd
	bl PlayMusic
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08089CF8 @ =NewFileIntroSr388PreviewVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08089C5C: .4byte unk_99940
_08089C60: .4byte 0x040000D4
_08089C64: .4byte gNonGameplayRam
_08089C68: .4byte 0x85000150
_08089C6C: .4byte 0x0859A1B8
_08089C70: .4byte 0x06010000
_08089C74: .4byte 0x0859D900
_08089C78: .4byte 0x05000200
_08089C7C: .4byte 0x84000080
_08089C80: .4byte 0x08613148
_08089C84: .4byte 0x06017FE0
_08089C88: .4byte 0x84000008
_08089C8C: .4byte 0x086131A8
_08089C90: .4byte 0x050003E0
_08089C94: .4byte 0x0879C3C8
_08089C98: .4byte 0x08598D2C
_08089C9C: .4byte 0x0600E800
_08089CA0: .4byte 0x0879C3E8
_08089CA4: .4byte 0x06008000
_08089CA8: .4byte 0x085995C8
_08089CAC: .4byte 0x0600F800
_08089CB0: .4byte 0x085999EC
_08089CB4: .4byte 0x0600F000
_08089CB8: .4byte 0x08598898
_08089CBC: .4byte 0x0600E000
_08089CC0: .4byte 0x08598B2C
_08089CC4: .4byte 0x00001C08
_08089CC8: .4byte 0x00001D01
_08089CCC: .4byte 0x00001E0A
_08089CD0: .4byte 0x00001F0B
_08089CD4: .4byte gBg1XPosition
_08089CD8: .4byte gBg1YPosition
_08089CDC: .4byte 0x0300122C
_08089CE0: .4byte 0x0300122E
_08089CE4: .4byte 0x03001230
_08089CE8: .4byte 0x03001232
_08089CEC: .4byte 0x0000FFF8
_08089CF0: .4byte 0x04000012
_08089CF4: .4byte 0x0863A19C
_08089CF8: .4byte NewFileIntroSr388PreviewVblank

	thumb_func_start NewFileIntroSr388PreviewProcess
NewFileIntroSr388PreviewProcess: @ 0x08089CFC
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r5, #0
	ldr r2, _08089D2C @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #6
	bls _08089D20
	b _0808A034
_08089D20:
	lsls r0, r0, #2
	ldr r1, _08089D30 @ =_08089D34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08089D2C: .4byte gNonGameplayRam
_08089D30: .4byte _08089D34
_08089D34: @ jump table
	.4byte _08089D50 @ case 0
	.4byte _08089E20 @ case 1
	.4byte _08089EA0 @ case 2
	.4byte _08089ED0 @ case 3
	.4byte _08089F10 @ case 4
	.4byte _08089FAC @ case 5
	.4byte _08089FD0 @ case 6
_08089D50:
	movs r6, #0x84
	lsls r6, r6, #2
	adds r1, r4, r6
	ldrh r0, [r1]
	cmp r0, #1
	bne _08089D90
	movs r0, #0
	str r0, [sp]
	ldr r1, _08089D84 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08089D88 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08089D8C @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _08089FC6
	.align 2, 0
_08089D84: .4byte 0x040000D4
_08089D88: .4byte 0x0600D000
_08089D8C: .4byte 0x85000400
_08089D90:
	cmp r0, #0x32
	bne _08089DC4
	ldr r6, _08089DB8 @ =0x00000212
	adds r1, r4, r6
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0xe]
	strh r0, [r4, #0xc]
	ldr r1, _08089DBC @ =0x0879C5A4
	ldr r0, _08089DC0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	str r0, [r4]
	b _08089FC6
	.align 2, 0
_08089DB8: .4byte 0x00000212
_08089DBC: .4byte 0x0879C5A4
_08089DC0: .4byte 0x03000011
_08089DC4:
	cmp r0, #0x3a
	bne _08089DE0
_08089DC8:
	ldr r1, _08089DD8 @ =gWrittenToBldalpha_R
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08089DDC @ =gWrittenToBldalpha_L
	movs r0, #0x10
	strh r0, [r1]
	b _08089FC6
	.align 2, 0
_08089DD8: .4byte gWrittenToBldalpha_R
_08089DDC: .4byte gWrittenToBldalpha_L
_08089DE0:
	cmp r0, #0x3b
	bne _08089DF4
	ldr r1, _08089DF0 @ =0x04000050
	movs r2, #0xc4
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	b _08089FC6
	.align 2, 0
_08089DF0: .4byte 0x04000050
_08089DF4:
	cmp r0, #0x3c
	beq _08089DFA
	b _08089FC6
_08089DFA:
	movs r0, #0
	strh r0, [r1]
	ldr r0, _08089E1C @ =0x0300122C
	ldrh r1, [r0]
	adds r1, #0x5c
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #9
	movs r2, #0x40
	bl NewFileIntroSr388SetupOam
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #1
	b _08089FC4
	.align 2, 0
_08089E1C: .4byte 0x0300122C
_08089E20:
	movs r6, #0x84
	lsls r6, r6, #2
	adds r1, r4, r6
	ldrh r0, [r1]
	cmp r0, #2
	bne _08089E3C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08089E7C @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08089E3C
	adds r0, #1
	strh r0, [r1]
_08089E3C:
	ldr r0, [r4]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08089E64
	ldr r0, _08089E80 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08089E64
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _08089E64
	movs r0, #1
	strb r0, [r1]
_08089E64:
	movs r1, #0x86
	lsls r1, r1, #2
	adds r2, r4, r1
	ldrb r0, [r2]
	cmp r0, #2
	beq _08089E74
	cmp r0, #4
	bne _08089E84
_08089E74:
	movs r0, #0
	strb r0, [r2]
	b _08089FC6
	.align 2, 0
_08089E7C: .4byte gWrittenToBldalpha_R
_08089E80: .4byte gChangedInput
_08089E84:
	cmp r0, #3
	beq _08089E8A
	b _08089FC6
_08089E8A:
	movs r1, #0
	strb r1, [r2]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r4, r2
	strh r1, [r0]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #2
	b _08089FC4
_08089EA0:
	movs r6, #0x84
	lsls r6, r6, #2
	adds r1, r4, r6
	ldrh r0, [r1]
	cmp r0, #2
	beq _08089EAE
	b _08089FC6
_08089EAE:
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08089ECC @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	bne _08089F98
	movs r0, #9
	bl SpecialCutsceneDestroyOamOfType
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #3
	b _08089FC4
	.align 2, 0
_08089ECC: .4byte gWrittenToBldalpha_R
_08089ED0:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r3, r4, r1
	ldrh r0, [r3]
	cmp r0, #1
	bne _08089EDE
	b _08089DC8
_08089EDE:
	cmp r0, #2
	bne _08089FC6
	ldr r1, _08089F08 @ =0x04000050
	ldr r2, _08089F0C @ =0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r6, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r3]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #4
	b _08089FC4
	.align 2, 0
_08089F08: .4byte 0x04000050
_08089F0C: .4byte 0x00003C42
_08089F10:
	ldr r0, _08089F54 @ =gWrittenToBldalpha_R
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _08089F68
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _08089F58 @ =0x0000F3FF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _08089F5C @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, _08089F60 @ =gNonGameplayRam
	movs r3, #0x84
	lsls r3, r3, #2
	adds r2, r1, r3
	movs r3, #0
	movs r0, #0
	strh r0, [r2]
	ldr r6, _08089F64 @ =0x00000213
	adds r0, r1, r6
	strb r3, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #5
	strb r0, [r1]
	movs r0, #0xa
	movs r1, #0x80
	movs r2, #0xd2
	bl NewFileIntroSr388SetupOam
	b _08089F76
	.align 2, 0
_08089F54: .4byte gWrittenToBldalpha_R
_08089F58: .4byte 0x0000F3FF
_08089F5C: .4byte 0x04000050
_08089F60: .4byte gNonGameplayRam
_08089F64: .4byte 0x00000213
_08089F68:
	cmp r0, #2
	bne _08089F76
	movs r0, #7
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSr388SetupOam
_08089F76:
	ldr r0, _08089FA0 @ =gNonGameplayRam
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #7
	bne _08089FC6
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08089FA4 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08089FC6
	adds r0, #1
	strh r0, [r1]
	ldr r1, _08089FA8 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
_08089F98:
	subs r0, #1
	strh r0, [r1]
	b _08089FC6
	.align 2, 0
_08089FA0: .4byte gNonGameplayRam
_08089FA4: .4byte gWrittenToBldalpha_R
_08089FA8: .4byte gWrittenToBldalpha_L
_08089FAC:
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrh r0, [r1]
	cmp r0, #0x46
	bne _08089FC6
	movs r0, #0
	strh r0, [r1]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r4, r6
	movs r0, #6
_08089FC4:
	strb r0, [r1]
_08089FC6:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _0808A034
_08089FD0:
	ldr r0, _08089FF4 @ =0x00000213
	adds r1, r4, r0
	ldrb r0, [r1]
	adds r0, #1
	movs r3, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08089FF8 @ =gWrittenToBldy
	cmp r0, #4
	bne _0808A010
	strb r3, [r1]
	ldrh r0, [r2]
	cmp r0, #0xf
	bhi _08089FFC
	adds r0, #1
	strh r0, [r2]
	b _0808A010
	.align 2, 0
_08089FF4: .4byte 0x00000213
_08089FF8: .4byte gWrittenToBldy
_08089FFC:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r1, #0
	strh r3, [r0]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r4, r3
	strb r1, [r0]
	movs r5, #1
_0808A010:
	ldrh r0, [r2]
	cmp r0, #0xf
	bls _0808A02C
	movs r6, #0x84
	lsls r6, r6, #2
	adds r1, r4, r6
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r2, [r0]
	movs r5, #1
_0808A02C:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808A034:
	bl IntroProcessText
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroSr388Preview
NewFileIntroSr388Preview: @ 0x0808A044
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0808A05C @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _0808A074
	cmp r0, #1
	bgt _0808A060
	cmp r0, #0
	beq _0808A06A
	b _0808A0E8
	.align 2, 0
_0808A05C: .4byte gNonGameplayRam
_0808A060:
	cmp r0, #2
	beq _0808A0AC
	cmp r0, #3
	beq _0808A0C8
	b _0808A0E8
_0808A06A:
	bl NewFileIntroSr388PreviewInit
	movs r0, #1
	strh r0, [r4, #8]
	b _0808A0E8
_0808A074:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _0808A0A0 @ =gWrittenToBldy
	ldrh r2, [r3]
	cmp r2, #0
	beq _0808A0A4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _0808A0E8
	strh r5, [r1]
	subs r0, r2, #1
	strh r0, [r3]
	b _0808A0E8
	.align 2, 0
_0808A0A0: .4byte gWrittenToBldy
_0808A0A4:
	strh r5, [r1]
	movs r0, #2
	strh r0, [r4, #8]
	b _0808A0E8
_0808A0AC:
	bl NewFileIntroSr388PreviewProcess
	cmp r0, #0
	beq _0808A0E8
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #3
	strh r0, [r4, #8]
	b _0808A0E8
_0808A0C8:
	ldr r1, _0808A0D8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808A0DC
	adds r0, #1
	strh r0, [r1]
	b _0808A0E0
	.align 2, 0
_0808A0D8: .4byte gWrittenToBldy
_0808A0DC:
	strh r5, [r4, #8]
	movs r5, #1
_0808A0E0:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808A0E8:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start unk_8a0f0
unk_8a0f0: @ 0x0808A0F0
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x12]
	adds r0, #1
	movs r3, #0
	strb r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x24
	bne _0808A106
	strb r3, [r1, #0x12]
_0808A106:
	ldr r2, _0808A128 @ =0x03001230
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldr r0, _0808A12C @ =gNonGameplayRam
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808A120
	movs r0, #0
	strh r3, [r2]
	strb r0, [r1, #0x10]
_0808A120:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A128: .4byte 0x03001230
_0808A12C: .4byte gNonGameplayRam

	thumb_func_start unk_8a130
unk_8a130: @ 0x0808A130
	push {r4, lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x12]
	adds r0, #1
	movs r3, #0
	strb r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0808A146
	strb r3, [r1, #0x12]
_0808A146:
	ldr r2, _0808A168 @ =0x0300122C
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldr r0, _0808A16C @ =gNonGameplayRam
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808A160
	movs r0, #0
	strh r3, [r2]
	strb r0, [r1, #0x10]
_0808A160:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A168: .4byte 0x0300122C
_0808A16C: .4byte gNonGameplayRam

	thumb_func_start NewFileIntroProcessSr388PreviewAsteroid
NewFileIntroProcessSr388PreviewAsteroid: @ 0x0808A170
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0808A188
	ldrh r0, [r2, #0xc]
	strh r0, [r2]
	ldrh r0, [r2, #0xe]
	strh r0, [r2, #2]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0808A1B8
_0808A188:
	cmp r0, #1
	bne _0808A1B8
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	movs r0, #8
	ldrsh r1, [r2, r0]
	ldrh r0, [r2, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2]
	adds r0, r0, r1
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x28
	rsbs r1, r1, #0
	cmp r0, r1
	bge _0808A1B8
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r2, #0xa]
_0808A1B8:
	ldr r0, _0808A1D8 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808A1D2
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	subs r0, #2
	ands r0, r1
	strb r0, [r2, #0x18]
_0808A1D2:
	pop {r0}
	bx r0
	.align 2, 0
_0808A1D8: .4byte gNonGameplayRam

	thumb_func_start unk_8a1dc
unk_8a1dc: @ 0x0808A1DC
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808A1FC
	movs r0, #0
	strb r0, [r1, #0x12]
	ldrh r0, [r1, #4]
	adds r0, #1
	strh r0, [r1, #4]
	ldr r1, _0808A200 @ =gBg1YPosition
	strh r0, [r1]
_0808A1FC:
	pop {r0}
	bx r0
	.align 2, 0
_0808A200: .4byte gBg1YPosition

	thumb_func_start unk_8a204
unk_8a204: @ 0x0808A204
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x15
	bne _0808A220
	movs r0, #0
	strb r0, [r4, #0x13]
_0808A220:
	ldrh r0, [r4, #0xa]
	cmp r0, #0x6e
	bne _0808A23A
	ldrh r1, [r4, #0xc]
	adds r1, #0x18
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #9
	bl NewFileIntroSr388SetupOam
	b _0808A244
_0808A23A:
	movs r1, #0xfa
	lsls r1, r1, #2
	cmp r0, r1
	bls _0808A244
	strh r1, [r4, #0xa]
_0808A244:
	ldr r0, _0808A264 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808A25E
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	subs r0, #2
	ands r0, r1
	strb r0, [r4, #0x18]
_0808A25E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A264: .4byte gNonGameplayRam

	thumb_func_start NewFileIntroProcessSunReflection
NewFileIntroProcessSunReflection: @ 0x0808A268
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	movs r1, #0
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1d
	bne _0808A27E
	strb r1, [r2, #0x13]
_0808A27E:
	ldr r0, _0808A29C @ =gNonGameplayRam
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808A298
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_0808A298:
	pop {r0}
	bx r0
	.align 2, 0
_0808A29C: .4byte gNonGameplayRam

	thumb_func_start NewFileIntroProcessSr388Rocks
NewFileIntroProcessSr388Rocks: @ 0x0808A2A0
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x13]
	adds r0, #1
	strb r0, [r1, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808A2BC
	movs r0, #0
	strb r0, [r1, #0x13]
	ldrh r0, [r1, #0xe]
	subs r0, #1
	strh r0, [r1, #0xe]
_0808A2BC:
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	cmp r0, #0xa0
	bgt _0808A2C8
	ldr r0, _0808A2CC @ =0x0859A0F0
	str r0, [r1, #0x1c]
_0808A2C8:
	pop {r0}
	bx r0
	.align 2, 0
_0808A2CC: .4byte 0x0859A0F0

	thumb_func_start NewFileIntroSr388SetupOam
NewFileIntroSr388SetupOam: @ 0x0808A2D0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	movs r7, #0
	ldr r1, _0808A320 @ =gNonGameplayRam
	movs r2, #0x8b
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, #0
	beq _0808A318
	mov r4, r8
	adds r1, r2, #0
_0808A2FE:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0x13
	bhi _0808A31C
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808A2FE
_0808A318:
	cmp r7, #0x13
	bls _0808A324
_0808A31C:
	movs r0, #0x14
	b _0808A556
	.align 2, 0
_0808A320: .4byte gNonGameplayRam
_0808A324:
	movs r0, #0
	str r0, [sp]
	ldr r1, _0808A388 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	lsls r2, r7, #3
	adds r0, r2, r7
	lsls r5, r0, #2
	ldr r4, _0808A38C @ =0x030016A0
	mov ip, r4
	adds r0, r5, r4
	str r0, [r1, #4]
	ldr r0, _0808A390 @ =0x85000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0808A394 @ =0xFFFFFDE4
	add r0, ip
	adds r4, r5, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r4, r1
	strh r6, [r0]
	adds r1, #2
	adds r0, r4, r1
	mov r1, sb
	strh r1, [r0]
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r3, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r6, r4, r0
	ldrb r1, [r6]
	movs r0, #1
	orrs r1, r0
	strb r1, [r6]
	cmp r3, #1
	bne _0808A39C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r6]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808A398 @ =unk_8a0f0
	str r1, [r0]
	b _0808A554
	.align 2, 0
_0808A388: .4byte 0x040000D4
_0808A38C: .4byte 0x030016A0
_0808A390: .4byte 0x85000009
_0808A394: .4byte 0xFFFFFDE4
_0808A398: .4byte unk_8a0f0
_0808A39C:
	cmp r3, #2
	bne _0808A3B8
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r6]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808A3B4 @ =unk_8a130
	str r1, [r0]
	b _0808A554
	.align 2, 0
_0808A3B4: .4byte unk_8a130
_0808A3B8:
	cmp r3, #3
	bne _0808A3E0
	ldr r1, _0808A3D8 @ =0x00000236
	adds r2, r4, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808A3DC @ =0x0859A0A0
	b _0808A44E
	.align 2, 0
_0808A3D8: .4byte 0x00000236
_0808A3DC: .4byte 0x0859A0A0
_0808A3E0:
	cmp r3, #4
	bne _0808A408
	ldr r0, _0808A400 @ =0x00000236
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808A404 @ =0x0859A0B0
	b _0808A44E
	.align 2, 0
_0808A400: .4byte 0x00000236
_0808A404: .4byte 0x0859A0B0
_0808A408:
	cmp r3, #5
	bne _0808A430
	ldr r1, _0808A428 @ =0x00000236
	adds r2, r4, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808A42C @ =0x0859A0C0
	b _0808A44E
	.align 2, 0
_0808A428: .4byte 0x00000236
_0808A42C: .4byte 0x0859A0C0
_0808A430:
	cmp r3, #6
	bne _0808A468
	ldr r0, _0808A45C @ =0x00000236
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808A460 @ =0x0859A0D0
_0808A44E:
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808A464 @ =NewFileIntroProcessSr388PreviewAsteroid
	str r1, [r0]
	b _0808A554
	.align 2, 0
_0808A45C: .4byte 0x00000236
_0808A460: .4byte 0x0859A0D0
_0808A464: .4byte NewFileIntroProcessSr388PreviewAsteroid
_0808A468:
	cmp r3, #7
	bne _0808A484
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r6]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808A480 @ =unk_8a1dc
	str r1, [r0]
	b _0808A554
	.align 2, 0
_0808A480: .4byte unk_8a1dc
_0808A484:
	cmp r3, #8
	bne _0808A4B8
	ldr r1, _0808A4AC @ =0x00000236
	adds r2, r4, r1
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808A4B0 @ =0x0859A100
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808A4B4 @ =unk_8a204
	str r1, [r0]
	b _0808A554
	.align 2, 0
_0808A4AC: .4byte 0x00000236
_0808A4B0: .4byte 0x0859A100
_0808A4B4: .4byte unk_8a204
_0808A4B8:
	cmp r3, #9
	bne _0808A4FC
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r1, r0
	movs r3, #8
	orrs r1, r3
	strb r1, [r6]
	ldr r0, _0808A4F0 @ =0x00000236
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808A4F4 @ =0x0859A0E0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808A4F8 @ =NewFileIntroProcessSunReflection
	str r1, [r0]
	b _0808A554
	.align 2, 0
_0808A4F0: .4byte 0x00000236
_0808A4F4: .4byte 0x0859A0E0
_0808A4F8: .4byte NewFileIntroProcessSunReflection
_0808A4FC:
	cmp r3, #0xa
	bne _0808A534
	ldr r1, _0808A528 @ =0x00000236
	adds r2, r4, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808A52C @ =0x0859A168
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808A530 @ =NewFileIntroProcessSr388Rocks
	str r1, [r0]
	b _0808A554
	.align 2, 0
_0808A528: .4byte 0x00000236
_0808A52C: .4byte 0x0859A168
_0808A530: .4byte NewFileIntroProcessSr388Rocks
_0808A534:
	cmp r3, #0x32
	bne _0808A554
	adds r2, r2, r7
	lsls r2, r2, #2
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _0808A564 @ =0x08613180
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r2, r2, r0
	ldr r0, _0808A568 @ =NewFileIntroProcessTextCursor
	str r0, [r2]
_0808A554:
	adds r0, r7, #0
_0808A556:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808A564: .4byte 0x08613180
_0808A568: .4byte NewFileIntroProcessTextCursor

	thumb_func_start NewFileIntroSetupSr388PreviewAsteroid
NewFileIntroSetupSr388PreviewAsteroid: @ 0x0808A56C
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl NewFileIntroSr388SetupOam
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808A5A0 @ =gNonGameplayRam
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r1, r0
	strh r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808A5A0: .4byte gNonGameplayRam

	thumb_func_start NewFileIntroSr388PreviewVblank
NewFileIntroSr388PreviewVblank: @ 0x0808A5A4
	ldr r1, _0808A600 @ =0x040000D4
	ldr r0, _0808A604 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0808A608 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0808A60C @ =0x04000052
	ldr r0, _0808A610 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0808A614 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808A618 @ =0x04000054
	ldr r0, _0808A61C @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _0808A620 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808A624 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808A628 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808A62C @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808A630 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808A634 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0808A600: .4byte 0x040000D4
_0808A604: .4byte gOamData
_0808A608: .4byte 0x84000100
_0808A60C: .4byte 0x04000052
_0808A610: .4byte gWrittenToBldalpha_L
_0808A614: .4byte gWrittenToBldalpha_R
_0808A618: .4byte 0x04000054
_0808A61C: .4byte gWrittenToBldy
_0808A620: .4byte gBg1XPosition
_0808A624: .4byte gBg1YPosition
_0808A628: .4byte 0x0300122C
_0808A62C: .4byte 0x0300122E
_0808A630: .4byte 0x03001230
_0808A634: .4byte 0x03001232

	thumb_func_start NewFileIntroInSr388Init
NewFileIntroInSr388Init: @ 0x0808A638
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r0, _0808A7D8 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _0808A7DC @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r1, _0808A7E0 @ =gNonGameplayRam
	mov r8, r1
	str r1, [r4, #4]
	ldr r0, _0808A7E4 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808A7E8 @ =0x0859DB08
	ldr r1, _0808A7EC @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _0808A7F0 @ =0x085A1D78
	str r0, [r4]
	ldr r0, _0808A7F4 @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _0808A7F8 @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808A7FC @ =0x08613148
	str r0, [r4]
	ldr r0, _0808A800 @ =0x06017FE0
	str r0, [r4, #4]
	ldr r1, _0808A804 @ =0x84000008
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808A808 @ =0x086131A8
	str r0, [r4]
	ldr r0, _0808A80C @ =0x050003E0
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808A810 @ =0x085A44CC
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0808A814 @ =0x085A86C8
	ldr r1, _0808A818 @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _0808A81C @ =0x085A83B8
	ldr r1, _0808A820 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0808A824 @ =0x08598898
	ldr r1, _0808A828 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0808A82C @ =0x085A9044
	ldr r1, _0808A830 @ =0x0600C000
	bl LZ77UncompVram
	ldr r0, _0808A834 @ =0x085A8E44
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r3, _0808A838 @ =0x04000010
	strh r5, [r3]
	ldr r2, _0808A83C @ =0x04000012
	strh r5, [r2]
	ldr r0, _0808A840 @ =0x04000014
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
	ldr r1, _0808A844 @ =0x04000008
	ldr r6, _0808A848 @ =0x00001C08
	adds r0, r6, #0
	strh r0, [r1]
	adds r1, #2
	ldr r7, _0808A84C @ =0x00005801
	adds r0, r7, #0
	strh r0, [r1]
	adds r1, #2
	ldr r6, _0808A850 @ =0x00005D01
	adds r0, r6, #0
	strh r0, [r1]
	adds r1, #2
	ldr r7, _0808A854 @ =0x00001F03
	adds r0, r7, #0
	strh r0, [r1]
	ldr r6, _0808A858 @ =0x0300122C
	movs r0, #0x88
	strh r0, [r6]
	ldr r0, _0808A85C @ =0x0300122E
	strh r5, [r0]
	ldr r0, _0808A860 @ =0x03001230
	strh r5, [r0]
	ldr r1, _0808A864 @ =gBg1XPosition
	movs r0, #0xc4
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r1, _0808A868 @ =gBg1YPosition
	adds r0, r5, #0
	subs r0, #0x60
	strh r0, [r1]
	ldr r1, _0808A86C @ =0x03001234
	movs r7, #0x8c
	lsls r7, r7, #2
	adds r0, r7, #0
	strh r0, [r1]
	ldr r1, _0808A870 @ =0x03001236
	ldr r7, _0808A874 @ =0x0000FFD8
	adds r0, r7, #0
	strh r0, [r1]
	ldr r1, _0808A878 @ =0x0000FFF8
	adds r0, r1, #0
	strh r0, [r3]
	strh r5, [r2]
	movs r0, #0x32
	movs r1, #0xfa
	movs r2, #0xc8
	bl NewFileIntroInSr388SetupOam
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl NewFileIntroInSr388SetupOam
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl NewFileIntroInSr388SetupOam
	movs r0, #1
	movs r1, #0xea
	movs r2, #0xc8
	bl NewFileIntroInSr388SetupOam
	movs r1, #0x90
	lsls r1, r1, #1
	movs r0, #2
	movs r2, #0xc8
	bl NewFileIntroInSr388SetupOam
	movs r1, #0x9c
	lsls r1, r1, #1
	movs r0, #3
	movs r2, #0x64
	bl NewFileIntroInSr388SetupOam
	movs r0, #0xb
	movs r1, #0
	movs r2, #0
	bl NewFileIntroInSr388SetupOam
	ldrh r0, [r6]
	movs r2, #0x98
	lsls r2, r2, #1
	adds r1, r2, #0
	subs r1, r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xc
	movs r2, #0xc8
	bl NewFileIntroInSr388SetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	str r5, [sp]
	mov r6, sp
	str r6, [r4]
	ldr r0, _0808A87C @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _0808A880 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808A884 @ =0x0863A19C
	mov r7, r8
	str r0, [r7]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0808A888 @ =NewFileIntroInSr388Vblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A7D8: .4byte unk_99940
_0808A7DC: .4byte 0x040000D4
_0808A7E0: .4byte gNonGameplayRam
_0808A7E4: .4byte 0x85000150
_0808A7E8: .4byte 0x0859DB08
_0808A7EC: .4byte 0x06010000
_0808A7F0: .4byte 0x085A1D78
_0808A7F4: .4byte 0x05000200
_0808A7F8: .4byte 0x84000080
_0808A7FC: .4byte 0x08613148
_0808A800: .4byte 0x06017FE0
_0808A804: .4byte 0x84000008
_0808A808: .4byte 0x086131A8
_0808A80C: .4byte 0x050003E0
_0808A810: .4byte 0x085A44CC
_0808A814: .4byte 0x085A86C8
_0808A818: .4byte 0x0600E800
_0808A81C: .4byte 0x085A83B8
_0808A820: .4byte 0x0600F800
_0808A824: .4byte 0x08598898
_0808A828: .4byte 0x0600E000
_0808A82C: .4byte 0x085A9044
_0808A830: .4byte 0x0600C000
_0808A834: .4byte 0x085A8E44
_0808A838: .4byte 0x04000010
_0808A83C: .4byte 0x04000012
_0808A840: .4byte 0x04000014
_0808A844: .4byte 0x04000008
_0808A848: .4byte 0x00001C08
_0808A84C: .4byte 0x00005801
_0808A850: .4byte 0x00005D01
_0808A854: .4byte 0x00001F03
_0808A858: .4byte 0x0300122C
_0808A85C: .4byte 0x0300122E
_0808A860: .4byte 0x03001230
_0808A864: .4byte gBg1XPosition
_0808A868: .4byte gBg1YPosition
_0808A86C: .4byte 0x03001234
_0808A870: .4byte 0x03001236
_0808A874: .4byte 0x0000FFD8
_0808A878: .4byte 0x0000FFF8
_0808A87C: .4byte 0x0600D000
_0808A880: .4byte 0x85000400
_0808A884: .4byte 0x0863A19C
_0808A888: .4byte NewFileIntroInSr388Vblank

	thumb_func_start NewFileIntroInSr388Process
NewFileIntroInSr388Process: @ 0x0808A88C
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	ldr r2, _0808A8E4 @ =gNonGameplayRam
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	adds r4, r2, #0
	cmp r1, r0
	bne _0808A8BE
	ldr r0, _0808A8E8 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808A8BE
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808A8BE
	movs r0, #1
	strb r0, [r1]
_0808A8BE:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #9
	bls _0808A8D8
	b _0808ABB0
_0808A8D8:
	lsls r0, r0, #2
	ldr r1, _0808A8EC @ =_0808A8F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808A8E4: .4byte gNonGameplayRam
_0808A8E8: .4byte gChangedInput
_0808A8EC: .4byte _0808A8F0
_0808A8F0: @ jump table
	.4byte _0808A918 @ case 0
	.4byte _0808A998 @ case 1
	.4byte _0808A998 @ case 2
	.4byte _0808A9C8 @ case 3
	.4byte _0808AA18 @ case 4
	.4byte _0808AA4C @ case 5
	.4byte _0808AAA4 @ case 6
	.4byte _0808AAD2 @ case 7
	.4byte _0808AB44 @ case 8
	.4byte _0808AB80 @ case 9
_0808A918:
	ldr r3, _0808A980 @ =0x00000213
	adds r1, r4, r3
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808A93A
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0808A984 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808A93A
	subs r0, #1
	strh r0, [r1]
_0808A93A:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r2, [r1]
	cmp r2, #2
	bne _0808A962
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808A988 @ =0x0300122E
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x60
	bne _0808A962
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r2, [r0]
_0808A962:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _0808A98C @ =0x0300122C
	ldr r1, _0808A990 @ =gNonGameplayRam
	ldr r2, _0808A994 @ =0x00000216
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrh r3, [r0]
	adds r1, r1, r3
	strh r1, [r0]
	b _0808ABB0
	.align 2, 0
_0808A980: .4byte 0x00000213
_0808A984: .4byte gWrittenToBldy
_0808A988: .4byte 0x0300122E
_0808A98C: .4byte 0x0300122C
_0808A990: .4byte gNonGameplayRam
_0808A994: .4byte 0x00000216
_0808A998:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0
	strh r0, [r1]
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _0808A9C0 @ =0x0300122C
	ldr r2, _0808A9C4 @ =0x00000216
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r1]
	adds r0, r0, r3
	strh r0, [r1]
	b _0808ABB0
	.align 2, 0
_0808A9C0: .4byte 0x0300122C
_0808A9C4: .4byte 0x00000216
_0808A9C8:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, #1
	bne _0808A9E8
	movs r0, #0
	str r0, [sp]
	ldr r1, _0808AA04 @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	ldr r0, _0808AA08 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _0808AA0C @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
_0808A9E8:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _0808AA10 @ =0x0300122C
	ldr r3, _0808AA14 @ =0x00000216
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r2, [r1]
	adds r0, r0, r2
	strh r0, [r1]
	b _0808ABB0
	.align 2, 0
_0808AA04: .4byte 0x040000D4
_0808AA08: .4byte 0x0600D000
_0808AA0C: .4byte 0x85000400
_0808AA10: .4byte 0x0300122C
_0808AA14: .4byte 0x00000216
_0808AA18:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r2, _0808AA40 @ =0x0300122C
	ldr r1, _0808AA44 @ =gNonGameplayRam
	ldr r3, _0808AA48 @ =0x00000216
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r2]
	adds r0, r0, r3
	strh r0, [r2]
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	b _0808ABB0
	.align 2, 0
_0808AA40: .4byte 0x0300122C
_0808AA44: .4byte gNonGameplayRam
_0808AA48: .4byte 0x00000216
_0808AA4C:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrh r2, [r0]
	cmp r2, #1
	bne _0808AA62
	movs r3, #0x88
	lsls r3, r3, #1
	adds r0, r4, r3
	strb r2, [r0]
	b _0808AB76
_0808AA62:
	cmp r2, #0x1e
	beq _0808AA68
	b _0808AB76
_0808AA68:
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	ldr r3, _0808AA98 @ =0x00000212
	adds r0, r4, r3
	strb r2, [r0]
	strh r1, [r4, #0xe]
	strh r1, [r4, #0xc]
	ldr r1, _0808AA9C @ =0x0879C5A4
	ldr r0, _0808AAA0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	str r0, [r4]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #6
	b _0808AB74
	.align 2, 0
_0808AA98: .4byte 0x00000212
_0808AA9C: .4byte 0x0879C5A4
_0808AAA0: .4byte 0x03000011
_0808AAA4:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	movs r3, #0x86
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808AAC0
	cmp r0, #4
	bne _0808AAC4
_0808AAC0:
	strb r2, [r1]
	b _0808AB76
_0808AAC4:
	cmp r0, #3
	bne _0808AB76
	strb r2, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	b _0808AB72
_0808AAD2:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r3, r4, r1
	ldrh r0, [r3]
	cmp r0, #0xa
	bne _0808AB00
	movs r0, #0
	str r0, [sp]
	ldr r1, _0808AAF4 @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	ldr r0, _0808AAF8 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _0808AAFC @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0808AB76
	.align 2, 0
_0808AAF4: .4byte 0x040000D4
_0808AAF8: .4byte 0x0600D000
_0808AAFC: .4byte 0x85000400
_0808AB00:
	cmp r0, #0xb
	bne _0808AB76
	movs r2, #0
	movs r1, #0
	strh r1, [r3]
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r4, r3
	strh r1, [r0]
	adds r3, #6
	adds r0, r4, r3
	strb r2, [r0]
	strh r1, [r4, #0xe]
	strh r1, [r4, #0xc]
	ldr r1, _0808AB3C @ =0x0879C5A4
	ldr r0, _0808AB40 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x28]
	str r0, [r4]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #8
	b _0808AB74
	.align 2, 0
_0808AB3C: .4byte 0x0879C5A4
_0808AB40: .4byte 0x03000011
_0808AB44:
	adds r2, r4, #0
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r3, #0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808AB62
	cmp r0, #4
	bne _0808AB66
_0808AB62:
	strb r3, [r1]
	b _0808AB76
_0808AB66:
	cmp r0, #3
	bne _0808AB76
	strb r3, [r1]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r4, r2
_0808AB72:
	movs r0, #9
_0808AB74:
	strb r0, [r1]
_0808AB76:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _0808ABB0
_0808AB80:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r2, _0808ABC0 @ =0x0300122C
	ldr r1, _0808ABC4 @ =gNonGameplayRam
	ldr r3, _0808ABC8 @ =0x00000216
	adds r0, r1, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrh r3, [r2]
	adds r0, r0, r3
	strh r0, [r2]
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrh r0, [r1]
	cmp r0, #0x32
	bls _0808ABB0
	ldr r1, _0808ABCC @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r5, #1
_0808ABB0:
	bl IntroProcessText
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0808ABC0: .4byte 0x0300122C
_0808ABC4: .4byte gNonGameplayRam
_0808ABC8: .4byte 0x00000216
_0808ABCC: .4byte 0x04000050

	thumb_func_start NewFileIntroInSr388
NewFileIntroInSr388: @ 0x0808ABD0
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0808ABE8 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _0808ABFC
	cmp r0, #1
	bgt _0808ABEC
	cmp r0, #0
	beq _0808ABF6
	b _0808AC5E
	.align 2, 0
_0808ABE8: .4byte gNonGameplayRam
_0808ABEC:
	cmp r0, #2
	beq _0808AC14
	cmp r0, #3
	beq _0808AC34
	b _0808AC5E
_0808ABF6:
	bl NewFileIntroInSr388Init
	b _0808AC08
_0808ABFC:
	bl SpecialCutsceneFadeIn
	ldr r0, _0808AC10 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _0808AC5E
_0808AC08:
	movs r0, #2
	strh r0, [r4, #8]
	b _0808AC5E
	.align 2, 0
_0808AC10: .4byte gWrittenToBldy
_0808AC14:
	bl NewFileIntroInSr388Process
	cmp r0, #0
	beq _0808AC5E
	ldr r1, _0808AC2C @ =0x00000213
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #3
	strh r0, [r4, #8]
	ldr r0, _0808AC30 @ =gWrittenToBldy
	strh r5, [r0]
	b _0808AC5E
	.align 2, 0
_0808AC2C: .4byte 0x00000213
_0808AC30: .4byte gWrittenToBldy
_0808AC34:
	ldr r1, _0808AC44 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808AC48
	adds r0, #1
	strh r0, [r1]
	b _0808AC56
	.align 2, 0
_0808AC44: .4byte gWrittenToBldy
_0808AC48:
	movs r1, #0
	strh r5, [r4, #8]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r4, r2
	strb r1, [r0]
	movs r5, #1
_0808AC56:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808AC5E:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroProcessSamusInSr388
NewFileIntroProcessSamusInSr388: @ 0x0808AC68
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4, #0x13]
	adds r3, r0, #1
	movs r6, #0
	strb r3, [r4, #0x13]
	ldr r1, _0808ACA0 @ =gNonGameplayRam
	movs r0, #0x85
	lsls r0, r0, #2
	adds r0, r0, r1
	mov ip, r0
	ldrb r5, [r0]
	adds r7, r1, #0
	cmp r5, #0
	bne _0808ACA8
	ldr r0, _0808ACA4 @ =0x0300122E
	ldrh r1, [r0]
	cmp r1, #0x2f
	bls _0808AC9C
	movs r0, #0xf0
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
_0808AC9C:
	strb r6, [r4, #0x13]
	b _0808B236
	.align 2, 0
_0808ACA0: .4byte gNonGameplayRam
_0808ACA4: .4byte 0x0300122E
_0808ACA8:
	cmp r5, #1
	beq _0808ACAE
	b _0808ADCC
_0808ACAE:
	ldr r0, _0808ACD0 @ =0x0300122E
	ldrh r1, [r0]
	movs r0, #0xf0
	subs r0, r0, r1
	movs r2, #0
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808AD04
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x13
	bhi _0808ACD4
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	b _0808B236
	.align 2, 0
_0808ACD0: .4byte 0x0300122E
_0808ACD4:
	cmp r0, #0x45
	bhi _0808ACE4
	ldr r2, _0808ACE0 @ =0x00000216
	adds r1, r7, r2
	b _0808AFD8
	.align 2, 0
_0808ACE0: .4byte 0x00000216
_0808ACE4:
	cmp r0, #0x46
	beq _0808ACEA
	b _0808B236
_0808ACEA:
	ldr r3, _0808ACFC @ =0x00000216
	adds r0, r7, r3
	strb r2, [r0]
	strb r2, [r4, #0x13]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _0808AD00 @ =0x085A40DC
	b _0808AE4A
	.align 2, 0
_0808ACFC: .4byte 0x00000216
_0808AD00: .4byte 0x085A40DC
_0808AD04:
	cmp r0, #1
	bne _0808AD24
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	beq _0808AD12
	b _0808B236
_0808AD12:
	strb r2, [r4, #0x13]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _0808AD20 @ =0x085A429C
	str r0, [r4, #0x1c]
	b _0808B07E
	.align 2, 0
_0808AD20: .4byte 0x085A429C
_0808AD24:
	cmp r0, #2
	bne _0808AD60
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	beq _0808AD3A
	b _0808B236
_0808AD3A:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0808AD42
	b _0808B236
_0808AD42:
	strb r2, [r4, #0x13]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _0808AD5C @ =0x085A4114
	str r0, [r4, #0x1c]
	movs r0, #3
	strb r0, [r4, #0x14]
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r7, r1
	strh r6, [r0]
	b _0808B236
	.align 2, 0
_0808AD5C: .4byte 0x085A4114
_0808AD60:
	cmp r0, #3
	bne _0808AD7C
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	beq _0808AD6E
	b _0808B236
_0808AD6E:
	strb r2, [r4, #0x13]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _0808AD78 @ =0x085A42BC
	b _0808AE82
	.align 2, 0
_0808AD78: .4byte 0x085A42BC
_0808AD7C:
	cmp r0, #4
	bne _0808ADAC
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	beq _0808AD92
	b _0808B236
_0808AD92:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0808AD9A
	b _0808B236
_0808AD9A:
	strb r2, [r4, #0x13]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _0808ADA8 @ =0x085A40DC
	str r0, [r4, #0x1c]
	b _0808B126
	.align 2, 0
_0808ADA8: .4byte 0x085A40DC
_0808ADAC:
	cmp r0, #5
	beq _0808ADB2
	b _0808B236
_0808ADB2:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	beq _0808ADBC
	b _0808B236
_0808ADBC:
	strb r2, [r4, #0x13]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	strb r2, [r4, #0x14]
	movs r0, #2
	mov r1, ip
	strb r0, [r1]
	b _0808B236
_0808ADCC:
	cmp r5, #2
	bne _0808ADDA
	movs r0, #3
	strb r0, [r4, #0x14]
	mov r2, ip
	strb r0, [r2]
	b _0808B236
_0808ADDA:
	cmp r5, #3
	beq _0808ADE0
	b _0808B024
_0808ADE0:
	ldrb r0, [r4, #0x14]
	adds r2, r0, #0
	cmp r2, #0
	bne _0808AE0C
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	beq _0808ADF2
	b _0808B236
_0808ADF2:
	strb r6, [r4, #0x13]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x11]
	ldr r0, _0808AE08 @ =0x085A4474
	str r0, [r4, #0x1c]
	movs r0, #1
	strb r0, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _0808B236
	.align 2, 0
_0808AE08: .4byte 0x085A4474
_0808AE0C:
	cmp r2, #1
	bne _0808AE34
	ldrh r2, [r4, #0xc]
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	ldr r0, _0808AE24 @ =0x00000103
	cmp r1, r0
	bgt _0808AE28
	adds r0, r2, #1
	strh r0, [r4, #0xc]
	b _0808B236
	.align 2, 0
_0808AE24: .4byte 0x00000103
_0808AE28:
	movs r0, #0
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r4, #0xc]
	strb r0, [r4, #0x13]
	b _0808B07E
_0808AE34:
	cmp r2, #2
	bne _0808AE54
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0808AE42
	b _0808B236
_0808AE42:
	strb r6, [r4, #0x13]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x11]
	ldr r0, _0808AE50 @ =0x085A441C
_0808AE4A:
	str r0, [r4, #0x1c]
	strb r5, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808AE50: .4byte 0x085A441C
_0808AE54:
	cmp r2, #3
	bne _0808AE98
	ldrh r2, [r4, #0xc]
	movs r3, #0xc
	ldrsh r0, [r4, r3]
	cmp r0, #0x8c
	ble _0808AE68
	subs r0, r2, #1
	strh r0, [r4, #0xc]
	b _0808B236
_0808AE68:
	ldr r0, _0808AE8C @ =0x0300122C
	ldrh r0, [r0]
	cmp r0, #0x6c
	bls _0808AE72
	b _0808AFD4
_0808AE72:
	ldr r2, _0808AE90 @ =0x00000216
	adds r1, r1, r2
	movs r0, #0
	strb r0, [r1]
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808AE94 @ =0x085A40DC
_0808AE82:
	str r0, [r4, #0x1c]
	movs r0, #4
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808AE8C: .4byte 0x0300122C
_0808AE90: .4byte 0x00000216
_0808AE94: .4byte 0x085A40DC
_0808AE98:
	cmp r2, #4
	bne _0808AEAE
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	beq _0808AEA6
	b _0808B236
_0808AEA6:
	strb r6, [r4, #0x13]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x11]
	b _0808B126
_0808AEAE:
	cmp r2, #5
	bne _0808AF00
	ldr r0, _0808AED8 @ =0x085A441C
	str r0, [r4, #0x1c]
	ldr r0, _0808AEDC @ =0x0300122C
	ldrh r2, [r0]
	cmp r2, #0x28
	bls _0808AEE4
	ldr r3, _0808AEE0 @ =0x00000216
	adds r1, r7, r3
	movs r0, #0xff
	strb r0, [r1]
	cmp r2, #0x38
	beq _0808AECC
	b _0808B236
_0808AECC:
	movs r0, #9
	movs r1, #0
	movs r2, #0x80
	bl NewFileIntroInSr388SetupOam
	b _0808B236
	.align 2, 0
_0808AED8: .4byte 0x085A441C
_0808AEDC: .4byte 0x0300122C
_0808AEE0: .4byte 0x00000216
_0808AEE4:
	ldr r0, _0808AEF8 @ =0x00000216
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808AEFC @ =0x085A40DC
	b _0808B152
	.align 2, 0
_0808AEF8: .4byte 0x00000216
_0808AEFC: .4byte 0x085A40DC
_0808AF00:
	cmp r2, #6
	bne _0808AF20
	ldrb r0, [r4, #0x13]
	cmp r0, #0x1e
	beq _0808AF0C
	b _0808B236
_0808AF0C:
	movs r0, #0
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808AF1C @ =0x085A429C
	str r0, [r4, #0x1c]
	b _0808B18C
	.align 2, 0
_0808AF1C: .4byte 0x085A429C
_0808AF20:
	cmp r2, #7
	bne _0808AF4C
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #0x12]
	cmp r0, r2
	beq _0808AF36
	b _0808B236
_0808AF36:
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	beq _0808AF3E
	b _0808B236
_0808AF3E:
	strb r1, [r4, #0x13]
	strb r1, [r4, #0x12]
	strb r1, [r4, #0x11]
	ldr r0, _0808AF48 @ =0x085A4114
	b _0808B1BA
	.align 2, 0
_0808AF48: .4byte 0x085A4114
_0808AF4C:
	cmp r2, #8
	bne _0808AF6C
	ldrb r0, [r4, #0x13]
	cmp r0, #0x1e
	beq _0808AF58
	b _0808B236
_0808AF58:
	movs r0, #0
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808AF68 @ =0x085A42BC
	str r0, [r4, #0x1c]
	b _0808B1F4
	.align 2, 0
_0808AF68: .4byte 0x085A42BC
_0808AF6C:
	cmp r0, #9
	bne _0808AF98
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	beq _0808AF82
	b _0808B236
_0808AF82:
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	beq _0808AF8A
	b _0808B236
_0808AF8A:
	strb r1, [r4, #0x13]
	strb r1, [r4, #0x12]
	strb r1, [r4, #0x11]
	ldr r0, _0808AF94 @ =0x085A40DC
	b _0808B222
	.align 2, 0
_0808AF94: .4byte 0x085A40DC
_0808AF98:
	cmp r0, #0xa
	bne _0808AFBC
	ldrb r0, [r4, #0x13]
	cmp r0, #0x1e
	beq _0808AFA4
	b _0808B236
_0808AFA4:
	movs r0, #0
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808AFB8 @ =0x085A441C
	str r0, [r4, #0x1c]
	movs r0, #0xb
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808AFB8: .4byte 0x085A441C
_0808AFBC:
	cmp r0, #0xb
	beq _0808AFC2
	b _0808B236
_0808AFC2:
	ldr r0, _0808AFE0 @ =0x085A441C
	str r0, [r4, #0x1c]
	ldrb r0, [r4, #0x13]
	cmp r0, #1
	bne _0808B014
	ldr r0, _0808AFE4 @ =0x0300122C
	ldrh r2, [r0]
	cmp r2, #0
	beq _0808AFEC
_0808AFD4:
	ldr r0, _0808AFE8 @ =0x00000216
	adds r1, r7, r0
_0808AFD8:
	movs r0, #0xff
	strb r0, [r1]
	b _0808B236
	.align 2, 0
_0808AFE0: .4byte 0x085A441C
_0808AFE4: .4byte 0x0300122C
_0808AFE8: .4byte 0x00000216
_0808AFEC:
	ldr r1, _0808B00C @ =0x00000216
	adds r0, r7, r1
	strb r2, [r0]
	strb r2, [r4, #0x13]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _0808B010 @ =0x085A40DC
	str r0, [r4, #0x1c]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r7, r3
	movs r0, #4
	strb r0, [r1]
	strb r2, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B00C: .4byte 0x00000216
_0808B010: .4byte 0x085A40DC
_0808B014:
	movs r1, #0
	strb r1, [r4, #0x13]
	ldr r2, _0808B020 @ =0x00000216
	adds r0, r7, r2
	strb r1, [r0]
	b _0808B236
	.align 2, 0
_0808B020: .4byte 0x00000216
_0808B024:
	cmp r5, #4
	beq _0808B02A
	b _0808B230
_0808B02A:
	ldrb r0, [r4, #0x14]
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B050
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	beq _0808B03C
	b _0808B236
_0808B03C:
	strb r6, [r4, #0x13]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x11]
	ldr r0, _0808B04C @ =0x085A414C
	str r0, [r4, #0x1c]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B04C: .4byte 0x085A414C
_0808B050:
	cmp r1, #1
	bne _0808B088
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3c
	beq _0808B05E
	b _0808B236
_0808B05E:
	strb r6, [r4, #0x13]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x11]
	ldr r0, _0808B084 @ =0x085A416C
	str r0, [r4, #0x1c]
	ldrh r1, [r4, #0xc]
	subs r1, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	subs r2, #0x16
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #6
	bl NewFileIntroInSr388SetupOam
_0808B07E:
	movs r0, #2
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B084: .4byte 0x085A416C
_0808B088:
	cmp r1, #2
	bne _0808B0BC
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	beq _0808B09E
	b _0808B236
_0808B09E:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0808B0A6
	b _0808B236
_0808B0A6:
	strb r6, [r4, #0x13]
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x11]
	ldr r0, _0808B0B8 @ =0x085A414C
	str r0, [r4, #0x1c]
	movs r0, #3
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B0B8: .4byte 0x085A414C
_0808B0BC:
	cmp r1, #3
	bne _0808B0E2
	mov r2, sp
	adds r2, #2
	movs r0, #6
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	beq _0808B0DC
	b _0808B236
_0808B0DC:
	strb r6, [r4, #0x13]
	strb r5, [r4, #0x14]
	b _0808B236
_0808B0E2:
	cmp r1, #4
	bne _0808B130
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _0808B0FC
	strb r6, [r4, #0x12]
	strb r6, [r4, #0x11]
	ldr r0, _0808B0F8 @ =0x085A422C
	str r0, [r4, #0x1c]
	b _0808B236
	.align 2, 0
_0808B0F8: .4byte 0x085A422C
_0808B0FC:
	ldrb r0, [r4, #0x13]
	cmp r0, #0xa
	beq _0808B104
	b _0808B236
_0808B104:
	movs r0, #0
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808B12C @ =0x085A424C
	str r0, [r4, #0x1c]
	ldrh r1, [r4, #0xc]
	subs r1, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	subs r2, #0x28
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #7
	bl NewFileIntroInSr388SetupOam
_0808B126:
	movs r0, #5
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B12C: .4byte 0x085A424C
_0808B130:
	cmp r1, #5
	bne _0808B160
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _0808B236
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0808B236
	strb r1, [r4, #0x13]
	strb r1, [r4, #0x12]
	strb r1, [r4, #0x11]
	ldr r0, _0808B15C @ =0x085A422C
_0808B152:
	str r0, [r4, #0x1c]
	movs r0, #6
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B15C: .4byte 0x085A422C
_0808B160:
	cmp r1, #6
	bne _0808B198
	ldrb r0, [r4, #0x13]
	cmp r0, #0x82
	bne _0808B236
	movs r0, #0
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808B194 @ =0x085A424C
	str r0, [r4, #0x1c]
	ldrh r1, [r4, #0xc]
	subs r1, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	subs r2, #0x28
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xe
	bl NewFileIntroInSr388SetupOam
_0808B18C:
	movs r0, #7
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B194: .4byte 0x085A424C
_0808B198:
	cmp r1, #7
	bne _0808B1C8
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #0x12]
	cmp r0, r2
	bne _0808B236
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0808B236
	strb r1, [r4, #0x13]
	strb r1, [r4, #0x12]
	strb r1, [r4, #0x11]
	ldr r0, _0808B1C4 @ =0x085A422C
_0808B1BA:
	str r0, [r4, #0x1c]
	movs r0, #8
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B1C4: .4byte 0x085A422C
_0808B1C8:
	cmp r1, #8
	bne _0808B200
	ldrb r0, [r4, #0x13]
	cmp r0, #0x4e
	bne _0808B236
	movs r0, #0
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808B1FC @ =0x085A424C
	str r0, [r4, #0x1c]
	ldrh r1, [r4, #0xc]
	subs r1, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	subs r2, #0x28
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xe
	bl NewFileIntroInSr388SetupOam
_0808B1F4:
	movs r0, #9
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B1FC: .4byte 0x085A424C
_0808B200:
	cmp r0, #9
	bne _0808B236
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _0808B236
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0808B236
	strb r1, [r4, #0x13]
	strb r1, [r4, #0x12]
	strb r1, [r4, #0x11]
	ldr r0, _0808B22C @ =0x085A422C
_0808B222:
	str r0, [r4, #0x1c]
	movs r0, #0xa
	strb r0, [r4, #0x14]
	b _0808B236
	.align 2, 0
_0808B22C: .4byte 0x085A422C
_0808B230:
	cmp r5, #4
	bls _0808B236
	strb r6, [r4, #0x12]
_0808B236:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewfileIntroProcessLeftBiologicalResearcher
NewfileIntroProcessLeftBiologicalResearcher: @ 0x0808B240
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r0, [r5, #0x13]
	adds r0, #1
	movs r6, #0
	strb r0, [r5, #0x13]
	ldr r0, _0808B288 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B290
	ldr r0, _0808B28C @ =0x0300122E
	ldrh r0, [r0]
	cmp r0, #0x2f
	bls _0808B282
	mov r4, sp
	adds r4, #2
	movs r0, #1
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionOfOamByType
	mov r1, sp
	ldrh r0, [r5, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0xc]
	ldrh r0, [r4]
	strh r0, [r5, #0xe]
_0808B282:
	strb r6, [r5, #0x13]
	b _0808B382
	.align 2, 0
_0808B288: .4byte gNonGameplayRam
_0808B28C: .4byte 0x0300122E
_0808B290:
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0808B2B8
	mov r4, sp
	adds r4, #2
	movs r0, #1
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionOfOamByType
	mov r1, sp
	ldrh r0, [r5, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0xc]
	ldrh r0, [r4]
	strh r0, [r5, #0xe]
	b _0808B382
_0808B2B8:
	cmp r1, #3
	beq _0808B2BE
	b _0808B41C
_0808B2BE:
	ldrb r0, [r5, #0x14]
	cmp r0, #0x10
	bne _0808B2EC
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	mov r0, sp
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	blt _0808B2E0
	b _0808B42A
_0808B2E0:
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	movs r0, #0x11
	strb r0, [r5, #0x14]
	b _0808B42A
_0808B2EC:
	cmp r0, #0x11
	bne _0808B324
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0xa
	cmp r1, r0
	bgt _0808B30E
	b _0808B42A
_0808B30E:
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B320 @ =0x085A2D50
	str r0, [r5, #0x1c]
	movs r0, #0x12
	strb r0, [r5, #0x14]
	b _0808B42A
	.align 2, 0
_0808B320: .4byte 0x085A2D50
_0808B324:
	cmp r0, #0x12
	bne _0808B354
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r5, #0x12]
	cmp r0, r3
	beq _0808B33A
	b _0808B42A
_0808B33A:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _0808B42A
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B350 @ =0x085A2D68
	str r0, [r5, #0x1c]
	movs r0, #0x13
	strb r0, [r5, #0x14]
	b _0808B42A
	.align 2, 0
_0808B350: .4byte 0x085A2D68
_0808B354:
	cmp r0, #0x13
	bne _0808B38C
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	movs r0, #0xc
	ldrsh r2, [r5, r0]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #8
	ldrsh r1, [r5, r3]
	adds r0, r0, r1
	cmp r2, r0
	ble _0808B42A
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B388 @ =0x085A2CF0
	str r0, [r5, #0x1c]
_0808B382:
	movs r0, #0x14
	strb r0, [r5, #0x14]
	b _0808B42A
	.align 2, 0
_0808B388: .4byte 0x085A2CF0
_0808B38C:
	cmp r0, #0x14
	bne _0808B3C8
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	movs r0, #0xc
	ldrsh r2, [r5, r0]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #8
	ldrsh r1, [r5, r3]
	adds r0, r0, r1
	subs r0, #7
	cmp r2, r0
	bgt _0808B3F8
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B3C4 @ =0x085A2D68
	str r0, [r5, #0x1c]
	movs r0, #0x15
	strb r0, [r5, #0x14]
	b _0808B42A
	.align 2, 0
_0808B3C4: .4byte 0x085A2D68
_0808B3C8:
	cmp r0, #0x15
	bne _0808B3EC
	ldr r0, _0808B3E4 @ =0x0300122C
	ldrh r0, [r0]
	cmp r0, #0x61
	bhi _0808B42A
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B3E8 @ =0x085A2CF0
	str r0, [r5, #0x1c]
	movs r0, #0x16
	strb r0, [r5, #0x14]
	b _0808B42A
	.align 2, 0
_0808B3E4: .4byte 0x0300122C
_0808B3E8: .4byte 0x085A2CF0
_0808B3EC:
	cmp r0, #0x16
	bne _0808B42A
	ldr r0, _0808B400 @ =0x0300122C
	ldrh r0, [r0]
	cmp r0, #0x2d
	bls _0808B404
_0808B3F8:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	b _0808B42A
	.align 2, 0
_0808B400: .4byte 0x0300122C
_0808B404:
	movs r0, #0
	strb r0, [r5, #0x13]
	strb r0, [r5, #0x12]
	strb r0, [r5, #0x11]
	ldr r0, _0808B418 @ =0x085A2D68
	str r0, [r5, #0x1c]
	movs r0, #0x17
	strb r0, [r5, #0x14]
	b _0808B42A
	.align 2, 0
_0808B418: .4byte 0x085A2D68
_0808B41C:
	cmp r1, #4
	bne _0808B424
	strb r6, [r5, #0x13]
	b _0808B42A
_0808B424:
	cmp r1, #4
	bls _0808B42A
	strb r6, [r5, #0x12]
_0808B42A:
	ldr r0, _0808B444 @ =gNonGameplayRam
	ldr r1, _0808B448 @ =0x00000216
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0xc]
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B444: .4byte gNonGameplayRam
_0808B448: .4byte 0x00000216

	thumb_func_start NewfileIntroProcessRightBiologicalResearcher
NewfileIntroProcessRightBiologicalResearcher: @ 0x0808B44C
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r0, [r5, #0x13]
	adds r0, #1
	movs r6, #0
	strb r0, [r5, #0x13]
	ldr r0, _0808B494 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r0, #0
	cmp r1, #0
	bne _0808B49C
	ldr r0, _0808B498 @ =0x0300122E
	ldrh r0, [r0]
	cmp r0, #0x2f
	bls _0808B48E
	mov r4, sp
	adds r4, #2
	movs r0, #1
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionOfOamByType
	mov r1, sp
	ldrh r0, [r5, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0xc]
	ldrh r0, [r4]
	strh r0, [r5, #0xe]
_0808B48E:
	strb r6, [r5, #0x13]
	b _0808B594
	.align 2, 0
_0808B494: .4byte gNonGameplayRam
_0808B498: .4byte 0x0300122E
_0808B49C:
	subs r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0808B4C4
	mov r4, sp
	adds r4, #2
	movs r0, #1
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionOfOamByType
	mov r1, sp
	ldrh r0, [r5, #8]
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r5, #0xc]
	ldrh r0, [r4]
	strh r0, [r5, #0xe]
	b _0808B594
_0808B4C4:
	cmp r1, #3
	beq _0808B4CA
	b _0808B630
_0808B4CA:
	ldrb r0, [r5, #0x14]
	cmp r0, #0x10
	bne _0808B4F8
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	mov r0, sp
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	blt _0808B4EC
	b _0808B63E
_0808B4EC:
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	movs r0, #0x11
	strb r0, [r5, #0x14]
	b _0808B63E
_0808B4F8:
	cmp r0, #0x11
	bne _0808B530
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #0xa
	cmp r1, r0
	bgt _0808B51A
	b _0808B63E
_0808B51A:
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B52C @ =0x085A2D50
	str r0, [r5, #0x1c]
	movs r0, #0x12
	strb r0, [r5, #0x14]
	b _0808B63E
	.align 2, 0
_0808B52C: .4byte 0x085A2D50
_0808B530:
	cmp r0, #0x12
	bne _0808B564
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r5, #0x12]
	cmp r0, r3
	beq _0808B546
	b _0808B63E
_0808B546:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0808B54E
	b _0808B63E
_0808B54E:
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B560 @ =0x085A2D68
	str r0, [r5, #0x1c]
	movs r0, #0x13
	strb r0, [r5, #0x14]
	b _0808B63E
	.align 2, 0
_0808B560: .4byte 0x085A2D68
_0808B564:
	cmp r0, #0x13
	bne _0808B5A0
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	movs r0, #0xc
	ldrsh r2, [r5, r0]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #8
	ldrsh r1, [r5, r3]
	adds r0, r0, r1
	adds r0, #0xa
	cmp r2, r0
	ble _0808B63E
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B59C @ =0x085A2CF0
	str r0, [r5, #0x1c]
_0808B594:
	movs r0, #0x14
	strb r0, [r5, #0x14]
	b _0808B63E
	.align 2, 0
_0808B59C: .4byte 0x085A2CF0
_0808B5A0:
	cmp r0, #0x14
	bne _0808B5DC
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	movs r0, #0xc
	ldrsh r2, [r5, r0]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #8
	ldrsh r1, [r5, r3]
	adds r0, r0, r1
	subs r0, #0xa
	cmp r2, r0
	bgt _0808B60C
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B5D8 @ =0x085A2D68
	str r0, [r5, #0x1c]
	movs r0, #0x15
	strb r0, [r5, #0x14]
	b _0808B63E
	.align 2, 0
_0808B5D8: .4byte 0x085A2D68
_0808B5DC:
	cmp r0, #0x15
	bne _0808B600
	ldr r0, _0808B5F8 @ =0x0300122C
	ldrh r0, [r0]
	cmp r0, #0x66
	bhi _0808B63E
	strb r6, [r5, #0x13]
	strb r6, [r5, #0x12]
	strb r6, [r5, #0x11]
	ldr r0, _0808B5FC @ =0x085A2CF0
	str r0, [r5, #0x1c]
	movs r0, #0x16
	strb r0, [r5, #0x14]
	b _0808B63E
	.align 2, 0
_0808B5F8: .4byte 0x0300122C
_0808B5FC: .4byte 0x085A2CF0
_0808B600:
	cmp r0, #0x16
	bne _0808B63E
	ldr r0, _0808B614 @ =0x0300122C
	ldrh r0, [r0]
	cmp r0, #0x34
	bls _0808B618
_0808B60C:
	ldrh r0, [r5, #0xc]
	subs r0, #1
	strh r0, [r5, #0xc]
	b _0808B63E
	.align 2, 0
_0808B614: .4byte 0x0300122C
_0808B618:
	movs r0, #0
	strb r0, [r5, #0x13]
	strb r0, [r5, #0x12]
	strb r0, [r5, #0x11]
	ldr r0, _0808B62C @ =0x085A2D68
	str r0, [r5, #0x1c]
	movs r0, #0x17
	strb r0, [r5, #0x14]
	b _0808B63E
	.align 2, 0
_0808B62C: .4byte 0x085A2D68
_0808B630:
	cmp r1, #4
	bne _0808B638
	strb r6, [r5, #0x13]
	b _0808B63E
_0808B638:
	cmp r1, #4
	bls _0808B63E
	strb r6, [r5, #0x12]
_0808B63E:
	ldr r0, _0808B658 @ =gNonGameplayRam
	ldr r1, _0808B65C @ =0x00000216
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0xc]
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B658: .4byte gNonGameplayRam
_0808B65C: .4byte 0x00000216

	thumb_func_start unk_8b660
unk_8b660: @ 0x0808B660
	push {r4, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x13]
	adds r4, r0, #1
	strb r4, [r3, #0x13]
	ldrb r1, [r3, #0x14]
	cmp r1, #0
	bne _0808B694
	ldrh r0, [r3, #0xe]
	movs r2, #0
	strh r0, [r3, #2]
	strh r1, [r3, #4]
	ldr r0, _0808B690 @ =0x085A2B58
	str r0, [r3, #0x1c]
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _0808B686
	b _0808B79C
_0808B686:
	strb r2, [r3, #0x13]
	strb r2, [r3, #0x12]
	strb r2, [r3, #0x11]
	movs r0, #1
	b _0808B79A
	.align 2, 0
_0808B690: .4byte 0x085A2B58
_0808B694:
	cmp r1, #1
	bne _0808B744
	ldr r0, _0808B6AC @ =0x085A2B68
	str r0, [r3, #0x1c]
	movs r1, #8
	ldrsh r0, [r3, r1]
	cmp r0, #0
	bne _0808B6B4
	ldrb r2, [r3, #0x13]
	ldr r1, _0808B6B0 @ =sHornoadJumpVelocityHigh
	b _0808B6B8
	.align 2, 0
_0808B6AC: .4byte 0x085A2B68
_0808B6B0: .4byte sHornoadJumpVelocityHigh
_0808B6B4:
	ldrb r2, [r3, #0x13]
	ldr r1, _0808B6FC @ =sHornoadJumpVelocityLow
_0808B6B8:
	movs r4, #4
	ldrsh r0, [r3, r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	lsls r0, r0, #0xe
	lsrs r1, r0, #0x10
	ldrh r0, [r3, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r1, r0
	movs r2, #0
	strh r0, [r3, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x90
	ble _0808B6F0
	movs r0, #0x90
	strh r0, [r3, #0xe]
	strb r2, [r3, #0x13]
	strb r2, [r3, #0x12]
	strb r2, [r3, #0x11]
	ldr r0, _0808B700 @ =0x085A2B90
	str r0, [r3, #0x1c]
	movs r0, #2
	strb r0, [r3, #0x14]
_0808B6F0:
	cmp r1, #0
	bge _0808B704
	ldrh r0, [r3, #0xc]
	adds r0, #2
	b _0808B708
	.align 2, 0
_0808B6FC: .4byte sHornoadJumpVelocityLow
_0808B700: .4byte 0x085A2B90
_0808B704:
	ldrh r0, [r3, #0xc]
	adds r0, #1
_0808B708:
	strh r0, [r3, #0xc]
	ldr r0, [r3, #0x10]
	ldr r1, _0808B73C @ =0x00FFFF00
	ands r0, r1
	ldr r1, _0808B740 @ =0x00040200
	cmp r0, r1
	bne _0808B71C
	ldrh r0, [r3, #0xc]
	adds r0, #8
	strh r0, [r3, #0xc]
_0808B71C:
	ldrb r0, [r3, #0x13]
	cmp r0, #4
	bne _0808B79C
	movs r0, #0
	strb r0, [r3, #0x13]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _0808B79C
	movs r0, #2
	b _0808B79A
	.align 2, 0
_0808B73C: .4byte 0x00FFFF00
_0808B740: .4byte 0x00040200
_0808B744:
	cmp r1, #2
	bne _0808B79C
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #3
	ldr r1, [r3, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r3, #0x12]
	cmp r0, r2
	bne _0808B760
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0808B760
	strb r1, [r3, #0x12]
_0808B760:
	ldr r0, _0808B78C @ =0x0859DB00
	ldrh r2, [r3, #0xa]
	adds r0, r2, r0
	ldrb r1, [r3, #0x13]
	ldrb r0, [r0]
	cmp r1, r0
	bne _0808B79C
	adds r0, r2, #1
	movs r1, #0
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _0808B77E
	strh r1, [r3, #0xa]
_0808B77E:
	movs r4, #8
	ldrsh r0, [r3, r4]
	cmp r0, #0
	bne _0808B790
	movs r0, #1
	strh r0, [r3, #8]
	b _0808B792
	.align 2, 0
_0808B78C: .4byte 0x0859DB00
_0808B790:
	strh r1, [r3, #8]
_0808B792:
	movs r0, #0
	strb r0, [r3, #0x13]
	strb r0, [r3, #0x12]
	strb r0, [r3, #0x11]
_0808B79A:
	strb r0, [r3, #0x14]
_0808B79C:
	ldr r0, _0808B7CC @ =gNonGameplayRam
	ldr r1, _0808B7D0 @ =0x00000216
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r3, #0xc]
	subs r0, r0, r1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	movs r1, #0x82
	lsls r1, r1, #0x11
	cmp r0, r1
	ble _0808B7C4
	movs r0, #0
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x18]
_0808B7C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B7CC: .4byte gNonGameplayRam
_0808B7D0: .4byte 0x00000216

	thumb_func_start NewFileIntroProcessHornoad
NewFileIntroProcessHornoad: @ 0x0808B7D4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r0, [r5, #0x13]
	adds r3, r0, #1
	movs r4, #0
	strb r3, [r5, #0x13]
	ldrb r0, [r5, #0x14]
	cmp r0, #0
	bne _0808B80C
	ldrh r0, [r5, #0xe]
	movs r1, #0
	strh r0, [r5, #2]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x96
	beq _0808B7F8
	b _0808BC7C
_0808B7F8:
	strb r1, [r5, #0x13]
	strb r1, [r5, #0x12]
	strb r1, [r5, #0x11]
	ldr r0, _0808B808 @ =0x085A2BF8
	str r0, [r5, #0x1c]
	movs r0, #1
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808B808: .4byte 0x085A2BF8
_0808B80C:
	cmp r0, #1
	bne _0808B844
	ldrh r0, [r5, #0xe]
	movs r2, #0
	strh r0, [r5, #2]
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r5, #0x12]
	cmp r0, r3
	beq _0808B828
	b _0808BC7C
_0808B828:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0808B830
	b _0808BC7C
_0808B830:
	strb r2, [r5, #0x13]
	strb r2, [r5, #0x12]
	strb r2, [r5, #0x11]
	ldr r0, _0808B840 @ =0x085A2BF8
	str r0, [r5, #0x1c]
	movs r0, #2
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808B840: .4byte 0x085A2BF8
_0808B844:
	cmp r0, #2
	bne _0808B880
	mov r2, sp
	adds r2, #2
	movs r0, #6
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	ldrh r0, [r5, #0xe]
	movs r2, #0
	strh r0, [r5, #2]
	mov r0, sp
	movs r4, #0
	ldrsh r0, [r0, r4]
	movs r6, #0xc
	ldrsh r1, [r5, r6]
	subs r0, r0, r1
	cmp r0, #0x18
	ble _0808B86C
	b _0808BC7C
_0808B86C:
	strb r2, [r5, #0x13]
	strb r2, [r5, #0x12]
	strb r2, [r5, #0x11]
	ldr r0, _0808B87C @ =0x085A2C70
	str r0, [r5, #0x1c]
	movs r0, #3
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808B87C: .4byte 0x085A2C70
_0808B880:
	cmp r0, #3
	bne _0808B90C
	ldr r0, _0808B8CC @ =0x085A2C98
	str r0, [r5, #0x1c]
	ldrb r2, [r5, #0x13]
	ldr r1, _0808B8D0 @ =sHornoadJumpVelocityHigh
	movs r4, #4
	ldrsh r0, [r5, r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r6, #0
	ldrsh r0, [r0, r6]
	muls r0, r2, r0
	lsls r0, r0, #0xe
	asrs r0, r0, #0x10
	ldrh r2, [r5, #2]
	adds r1, r0, r2
	movs r2, #0
	strh r1, [r5, #0xe]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808B8E0
	strb r2, [r5, #0x13]
	strh r1, [r5, #2]
	ldrh r0, [r5, #4]
	adds r0, #1
	strh r0, [r5, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0808B8D8
	strb r2, [r5, #0x12]
	strb r2, [r5, #0x11]
	ldr r0, _0808B8D4 @ =0x085A2CD8
	str r0, [r5, #0x1c]
	b _0808B8E0
	.align 2, 0
_0808B8CC: .4byte 0x085A2C98
_0808B8D0: .4byte sHornoadJumpVelocityHigh
_0808B8D4: .4byte 0x085A2CD8
_0808B8D8:
	cmp r0, #0xa
	ble _0808B8E0
	movs r0, #0xa
	strh r0, [r5, #4]
_0808B8E0:
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	cmp r0, #0x80
	bgt _0808B8EA
	b _0808BC7C
_0808B8EA:
	movs r1, #0
	movs r2, #0
	movs r0, #0x80
	strh r0, [r5, #2]
	strh r0, [r5, #0xe]
	strb r1, [r5, #0x13]
	strb r1, [r5, #0x12]
	strb r1, [r5, #0x11]
	ldr r0, _0808B908 @ =0x085A2CC0
	str r0, [r5, #0x1c]
	strh r2, [r5, #4]
	movs r0, #4
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808B908: .4byte 0x085A2CC0
_0808B90C:
	cmp r0, #4
	bne _0808B940
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r6, [r5, #0x12]
	cmp r0, r6
	beq _0808B922
	b _0808BC7C
_0808B922:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _0808B92A
	b _0808BC7C
_0808B92A:
	strb r4, [r5, #0x13]
	strb r4, [r5, #0x12]
	strb r4, [r5, #0x11]
	ldr r0, _0808B93C @ =0x085A2BD0
	str r0, [r5, #0x1c]
	movs r0, #5
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808B93C: .4byte 0x085A2BD0
_0808B940:
	cmp r0, #5
	bne _0808B974
	mov r2, sp
	adds r2, #2
	movs r0, #6
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	mov r0, sp
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	beq _0808B960
	b _0808BC7C
_0808B960:
	strb r4, [r5, #0x13]
	strb r4, [r5, #0x12]
	strb r4, [r5, #0x11]
	ldr r0, _0808B970 @ =0x085A2C70
	str r0, [r5, #0x1c]
	movs r0, #6
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808B970: .4byte 0x085A2C70
_0808B974:
	cmp r0, #6
	beq _0808B97A
	b _0808BA74
_0808B97A:
	ldr r0, _0808B9E0 @ =0x085A2C98
	str r0, [r5, #0x1c]
	ldrb r2, [r5, #0x13]
	ldr r1, _0808B9E4 @ =sHornoadJumpVelocityHigh
	movs r3, #4
	ldrsh r0, [r5, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r1, r2, #0
	muls r1, r0, r1
	lsls r1, r1, #0xf
	ldrh r0, [r5, #2]
	asrs r1, r1, #0x10
	adds r0, r1, r0
	strh r0, [r5, #0xe]
	ldrh r0, [r5, #0xc]
	adds r0, #1
	strh r0, [r5, #0xc]
	ldr r0, [r5, #0x10]
	ldr r1, _0808B9E8 @ =0x00FFFF00
	ands r0, r1
	ldr r1, _0808B9EC @ =0x00040200
	cmp r0, r1
	bne _0808B9B4
	ldrh r0, [r5, #0xc]
	adds r0, #8
	strh r0, [r5, #0xc]
_0808B9B4:
	ldrb r0, [r5, #0x13]
	cmp r0, #4
	bne _0808B9FC
	movs r0, #0
	strb r0, [r5, #0x13]
	ldrh r0, [r5, #0xe]
	movs r1, #0
	strh r0, [r5, #2]
	ldrh r0, [r5, #4]
	adds r0, #1
	strh r0, [r5, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #5
	bne _0808B9F4
	strb r1, [r5, #0x13]
	strb r1, [r5, #0x12]
	strb r1, [r5, #0x11]
	ldr r0, _0808B9F0 @ =0x085A2CD8
	str r0, [r5, #0x1c]
	b _0808B9FC
	.align 2, 0
_0808B9E0: .4byte 0x085A2C98
_0808B9E4: .4byte sHornoadJumpVelocityHigh
_0808B9E8: .4byte 0x00FFFF00
_0808B9EC: .4byte 0x00040200
_0808B9F0: .4byte 0x085A2CD8
_0808B9F4:
	cmp r0, #0xa
	ble _0808B9FC
	movs r0, #0xa
	strh r0, [r5, #4]
_0808B9FC:
	movs r6, #4
	ldrsh r0, [r5, r6]
	cmp r0, #1
	bgt _0808BA06
	b _0808BC7C
_0808BA06:
	mov r4, sp
	adds r4, #2
	movs r0, #7
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionOfOamByType
	mov r0, sp
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	movs r3, #0
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _0808BA24
	b _0808BC7C
_0808BA24:
	movs r6, #0xe
	ldrsh r1, [r5, r6]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bge _0808BA32
	b _0808BC7C
_0808BA32:
	movs r3, #0xc
	ldrsh r1, [r5, r3]
	movs r4, #0xe
	ldrsh r2, [r5, r4]
	movs r0, #0xa
	bl NewFileIntroInSr388SetupOam
	movs r0, #0
	strb r0, [r5, #0x13]
	strb r0, [r5, #0x12]
	strb r0, [r5, #0x11]
	ldr r0, _0808BA68 @ =0x085A2BA8
	str r0, [r5, #0x1c]
	movs r0, #1
	strh r0, [r5, #4]
	ldr r1, _0808BA6C @ =0x0400004C
	ldr r0, _0808BA70 @ =sXParasiteMosaicValues
	ldrh r0, [r0, #2]
	lsls r0, r0, #4
	strh r0, [r1]
	ldrb r0, [r5, #0x18]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #7
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808BA68: .4byte 0x085A2BA8
_0808BA6C: .4byte 0x0400004C
_0808BA70: .4byte sXParasiteMosaicValues
_0808BA74:
	cmp r0, #7
	bne _0808BADA
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808BA9A
	strb r4, [r5, #0x13]
	ldrh r0, [r5, #4]
	adds r0, #1
	strh r0, [r5, #4]
	ldr r2, _0808BAC8 @ =0x0400004C
	ldr r1, _0808BACC @ =sXParasiteMosaicValues
	movs r6, #4
	ldrsh r0, [r5, r6]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r2]
_0808BA9A:
	ldrh r1, [r5, #0xa]
	cmp r1, #1
	bne _0808BAD4
	movs r1, #4
	ldrsh r0, [r5, r1]
	cmp r0, #0xf
	beq _0808BAAA
	b _0808BC7C
_0808BAAA:
	strb r4, [r5, #0x13]
	strb r4, [r5, #0x12]
	strb r4, [r5, #0x11]
	ldr r0, _0808BAD0 @ =0x085A2E90
	str r0, [r5, #0x1c]
	ldrh r0, [r5, #0xc]
	subs r0, #4
	strh r0, [r5, #0xc]
	ldrh r0, [r5, #0xe]
	subs r0, #0xa
	strh r0, [r5, #0xe]
	strh r4, [r5, #0xa]
	movs r0, #8
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808BAC8: .4byte 0x0400004C
_0808BACC: .4byte sXParasiteMosaicValues
_0808BAD0: .4byte 0x085A2E90
_0808BAD4:
	movs r2, #4
	ldrsh r0, [r5, r2]
	b _0808BB50
_0808BADA:
	cmp r0, #8
	bne _0808BB60
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0808BB00
	strb r4, [r5, #0x13]
	ldrh r0, [r5, #4]
	adds r0, #1
	strh r0, [r5, #4]
	ldr r2, _0808BB44 @ =0x0400004C
	ldr r1, _0808BB48 @ =sXParasiteMosaicValues
	movs r3, #4
	ldrsh r0, [r5, r3]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #4
	strh r0, [r2]
_0808BB00:
	ldrh r1, [r5, #0xa]
	cmp r1, #1
	bne _0808BB4C
	movs r4, #4
	ldrsh r0, [r5, r4]
	cmp r0, #0x1d
	beq _0808BB10
	b _0808BC7C
_0808BB10:
	movs r0, #0
	strb r0, [r5, #0x13]
	ldrb r1, [r5, #0x18]
	subs r0, #0x21
	ands r0, r1
	strb r0, [r5, #0x18]
	mov r2, sp
	adds r2, #2
	movs r0, #1
	mov r1, sp
	bl NewFileIntroGetPositionOfOamByType
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r5]
	ldrh r1, [r5, #0xc]
	subs r0, r0, r1
	strh r0, [r5, #4]
	movs r0, #0x3f
	strh r0, [r5, #0xa]
	movs r0, #9
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808BB44: .4byte 0x0400004C
_0808BB48: .4byte sXParasiteMosaicValues
_0808BB4C:
	movs r6, #4
	ldrsh r0, [r5, r6]
_0808BB50:
	cmp r0, #0x1d
	beq _0808BB56
	b _0808BC7C
_0808BB56:
	adds r0, r1, #1
	strh r0, [r5, #0xa]
	movs r0, #1
	strh r0, [r5, #4]
	b _0808BC7C
_0808BB60:
	cmp r0, #9
	bne _0808BB7C
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bne _0808BB6E
	b _0808BC7C
_0808BB6E:
	cmp r0, #0x1e
	bhi _0808BB74
	b _0808BC7C
_0808BB74:
	strb r4, [r5, #0x13]
	movs r0, #0xa
	strb r0, [r5, #0x14]
	b _0808BC7C
_0808BB7C:
	ldrb r0, [r5, #0x14]
	cmp r0, #0xa
	bne _0808BC28
	ldrh r1, [r5, #0xa]
	adds r0, r1, #1
	movs r7, #0
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xff
	bls _0808BB98
	adds r0, r1, #0
	subs r0, #0xff
	strh r0, [r5, #0xa]
_0808BB98:
	ldrh r6, [r5, #0xa]
	lsls r0, r6, #0x11
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _0808BBAC
	ldr r1, _0808BC0C @ =0xFFFFFF00
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_0808BBAC:
	movs r3, #4
	ldrsh r1, [r5, r3]
	ldr r3, _0808BC10 @ =sSineTable
	lsls r0, r2, #0x10
	asrs r0, r0, #0xf
	adds r0, #0x80
	adds r0, r0, r3
	movs r2, #0
	ldrsh r4, [r0, r2]
	adds r2, r1, #0
	muls r2, r4, r2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r3
	movs r6, #0
	ldrsh r0, [r0, r6]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	ldrh r6, [r5]
	adds r0, r6, r0
	strh r0, [r5, #0xc]
	movs r2, #4
	ldrsh r0, [r5, r2]
	adds r2, r0, #0
	muls r2, r4, r2
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r3
	movs r3, #0
	ldrsh r0, [r1, r3]
	muls r0, r2, r0
	asrs r0, r0, #0x10
	ldrh r1, [r5, #2]
	adds r0, r1, r0
	strh r0, [r5, #0xe]
	ldrh r0, [r5, #0xa]
	cmp r0, #0x9f
	bls _0808BC14
	strh r7, [r5, #0xa]
	movs r0, #0
	strb r0, [r5, #0x13]
	strh r7, [r5, #4]
	strh r7, [r5, #2]
	strh r7, [r5]
	movs r0, #0xb
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808BC0C: .4byte 0xFFFFFF00
_0808BC10: .4byte sSineTable
_0808BC14:
	cmp r0, #0x9b
	bls _0808BC1E
	subs r0, r6, #1
	strh r0, [r5]
	b _0808BC22
_0808BC1E:
	cmp r0, #0x77
	bls _0808BC7C
_0808BC22:
	adds r0, r1, #1
	strh r0, [r5, #2]
	b _0808BC7C
_0808BC28:
	cmp r0, #0xb
	bne _0808BC4C
	ldrb r0, [r5, #0x18]
	movs r1, #6
	orrs r0, r1
	strb r0, [r5, #0x18]
	ldrh r0, [r5, #6]
	adds r0, #0x80
	strh r0, [r5, #6]
	lsls r0, r0, #0x10
	ldr r1, _0808BC48 @ =0x01FF0000
	cmp r0, r1
	ble _0808BC7C
	movs r0, #0xc
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808BC48: .4byte 0x01FF0000
_0808BC4C:
	cmp r0, #0xc
	bne _0808BC74
	ldrh r0, [r5, #6]
	subs r0, #0x10
	strh r0, [r5, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x8f
	bgt _0808BC7C
	ldr r0, _0808BC70 @ =gNonGameplayRam
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r0, r4
	movs r1, #5
	strb r1, [r0]
	movs r0, #0xd
	strb r0, [r5, #0x14]
	b _0808BC7C
	.align 2, 0
_0808BC70: .4byte gNonGameplayRam
_0808BC74:
	cmp r0, #0xd
	bne _0808BC7C
	movs r0, #0
	strb r0, [r5, #0x12]
_0808BC7C:
	ldr r0, _0808BC94 @ =gNonGameplayRam
	ldr r6, _0808BC98 @ =0x00000216
	adds r0, r0, r6
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0xc]
	subs r0, r0, r1
	strh r0, [r5, #0xc]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808BC94: .4byte gNonGameplayRam
_0808BC98: .4byte 0x00000216

	thumb_func_start NewFileIntroProcessHorizontalMissile
NewFileIntroProcessHorizontalMissile: @ 0x0808BC9C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x13]
	adds r3, r0, #1
	strb r3, [r4, #0x13]
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808BD24
	ldrb r2, [r4, #0x13]
	ldr r1, _0808BCE8 @ =0x0858B40C
	movs r5, #4
	ldrsh r0, [r4, r5]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	muls r0, r2, r0
	asrs r0, r0, #2
	ldrh r1, [r4]
	subs r1, r1, r0
	strh r1, [r4, #0xc]
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808BCEC
	movs r0, #0
	strb r0, [r4, #0x13]
	ldrh r1, [r4, #4]
	movs r2, #4
	ldrsh r0, [r4, r2]
	cmp r0, #5
	bgt _0808BCE0
	adds r0, r1, #1
	strh r0, [r4, #4]
_0808BCE0:
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	b _0808BD04
	.align 2, 0
_0808BCE8: .4byte 0x0858B40C
_0808BCEC:
	cmp r0, #1
	bne _0808BD04
	adds r1, #0xc
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	adds r2, #2
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #8
	bl NewFileIntroInSr388SetupOam
_0808BD04:
	movs r5, #0xc
	ldrsh r0, [r4, r5]
	cmp r0, #0x1f
	bgt _0808BD4A
	movs r0, #0
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808BD20 @ =0x085A2E08
	str r0, [r4, #0x1c]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _0808BD4A
	.align 2, 0
_0808BD20: .4byte 0x085A2E08
_0808BD24:
	cmp r0, #1
	bne _0808BD4A
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #0x12]
	cmp r0, r2
	bne _0808BD4A
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0808BD4A
	strb r1, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_0808BD4A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start NewFileIntroProcessFirstDiagonalMissile
NewFileIntroProcessFirstDiagonalMissile: @ 0x0808BD50
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4, #0x13]
	adds r5, r0, #1
	strb r5, [r4, #0x13]
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808BE10
	ldrb r1, [r4, #0x13]
	ldr r2, _0808BDBC @ =0x0858B40C
	movs r3, #4
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r6, #0
	ldrsh r0, [r0, r6]
	adds r0, #1
	muls r0, r1, r0
	asrs r0, r0, #2
	ldrh r1, [r4]
	subs r3, r1, r0
	strh r3, [r4, #0xc]
	ldrb r1, [r4, #0x13]
	movs r6, #4
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #1
	muls r0, r1, r0
	asrs r0, r0, #2
	ldrh r1, [r4, #2]
	subs r2, r1, r0
	strh r2, [r4, #0xe]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808BDC0
	movs r0, #0
	strb r0, [r4, #0x13]
	ldrh r1, [r4, #4]
	movs r3, #4
	ldrsh r0, [r4, r3]
	cmp r0, #5
	bgt _0808BDB2
	adds r0, r1, #1
	strh r0, [r4, #4]
_0808BDB2:
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	b _0808BDD8
	.align 2, 0
_0808BDBC: .4byte 0x0858B40C
_0808BDC0:
	cmp r0, #1
	bne _0808BDD8
	adds r1, r3, #0
	adds r1, #0xa
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, #0xc
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #8
	bl NewFileIntroInSr388SetupOam
_0808BDD8:
	mov r5, sp
	adds r5, #2
	movs r0, #9
	mov r1, sp
	adds r2, r5, #0
	bl NewFileIntroGetPositionOfOamByType
	movs r6, #0xc
	ldrsh r1, [r4, r6]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #2
	cmp r1, r0
	bgt _0808BE10
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	movs r6, #0
	ldrsh r0, [r5, r6]
	subs r0, #2
	cmp r1, r0
	bgt _0808BE10
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	subs r0, #2
	ands r0, r1
	strb r0, [r4, #0x18]
_0808BE10:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_8be18
unk_8be18: @ 0x0808BE18
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _0808BE3E
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0808BE3E
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_0808BE3E:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_8be44
unk_8be44: @ 0x0808BE44
	push {r4, r5, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	bne _0808BE6C
	ldr r0, _0808BE64 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r3, #0xe]
	ldr r1, _0808BE68 @ =0x0300122C
	ldrh r0, [r1]
	strh r0, [r3, #0xc]
	movs r0, #1
	strb r0, [r3, #0x14]
	adds r5, r1, #0
	b _0808BEA0
	.align 2, 0
_0808BE64: .4byte 0x0300122E
_0808BE68: .4byte 0x0300122C
_0808BE6C:
	ldr r5, _0808BEF4 @ =0x0300122C
	cmp r0, #1
	bne _0808BEA0
	movs r1, #0xe
	ldrsh r0, [r3, r1]
	adds r0, #1
	ldr r1, _0808BEF8 @ =0x0300122E
	ldrh r1, [r1]
	cmp r0, r1
	bge _0808BE8A
	strh r1, [r3, #0xe]
	ldr r1, _0808BEFC @ =0x03001232
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0808BE8A:
	movs r2, #0xc
	ldrsh r0, [r3, r2]
	subs r0, #1
	ldrh r1, [r5]
	cmp r0, r1
	ble _0808BEA0
	strh r1, [r3, #0xc]
	ldr r1, _0808BF00 @ =0x03001230
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0808BEA0:
	movs r0, #4
	ldrsh r4, [r3, r0]
	cmp r4, #0
	bne _0808BEE6
	ldr r0, _0808BF04 @ =gBg1XPosition
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	ldrh r2, [r5]
	adds r1, r1, r2
	strh r1, [r0]
	ldr r2, _0808BF08 @ =gBg1YPosition
	ldr r0, _0808BEF8 @ =0x0300122E
	ldrh r0, [r0]
	subs r0, #0x60
	strh r0, [r2]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x77
	bhi _0808BEE6
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808BF0C @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0808BF10 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, _0808BF14 @ =gWrittenToBldalpha_R
	ldr r0, _0808BF18 @ =gWrittenToBldalpha_L
	strh r4, [r0]
	strh r4, [r1]
	movs r0, #1
	strh r0, [r3, #4]
_0808BEE6:
	ldrh r1, [r5]
	cmp r1, #0
	bne _0808BEEE
	strb r1, [r3, #0x10]
_0808BEEE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808BEF4: .4byte 0x0300122C
_0808BEF8: .4byte 0x0300122E
_0808BEFC: .4byte 0x03001232
_0808BF00: .4byte 0x03001230
_0808BF04: .4byte gBg1XPosition
_0808BF08: .4byte gBg1YPosition
_0808BF0C: .4byte 0x0000FDFF
_0808BF10: .4byte 0x04000050
_0808BF14: .4byte gWrittenToBldalpha_R
_0808BF18: .4byte gWrittenToBldalpha_L

	thumb_func_start unk_8bf1c
unk_8bf1c: @ 0x0808BF1C
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808BF5C @ =0x0300122E
	ldrh r1, [r0]
	cmp r1, #0x17
	bls _0808BF2E
	movs r0, #0xd8
	subs r0, r0, r1
	strh r0, [r2, #0xe]
_0808BF2E:
	ldr r0, _0808BF60 @ =gNonGameplayRam
	ldr r1, _0808BF64 @ =0x00000216
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r2, #0xc]
	subs r0, r0, r1
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	movs r1, #0x97
	lsls r1, r1, #0x11
	cmp r0, r1
	ble _0808BF56
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_0808BF56:
	pop {r0}
	bx r0
	.align 2, 0
_0808BF5C: .4byte 0x0300122E
_0808BF60: .4byte gNonGameplayRam
_0808BF64: .4byte 0x00000216

	thumb_func_start unk_8bf68
unk_8bf68: @ 0x0808BF68
	push {lr}
	adds r2, r0, #0
	ldr r0, _0808BFA4 @ =0x0300122E
	ldrh r1, [r0]
	cmp r1, #0x17
	bls _0808BF7A
	movs r0, #0xd8
	subs r0, r0, r1
	strh r0, [r2, #0xe]
_0808BF7A:
	ldr r0, _0808BFA8 @ =gNonGameplayRam
	ldr r1, _0808BFAC @ =0x00000216
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r2, #0xc]
	subs r0, r0, r1
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xfa
	ble _0808BFA0
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_0808BFA0:
	pop {r0}
	bx r0
	.align 2, 0
_0808BFA4: .4byte 0x0300122E
_0808BFA8: .4byte gNonGameplayRam
_0808BFAC: .4byte 0x00000216

	thumb_func_start NewFileIntroProcessSecondDiagonalMissile
NewFileIntroProcessSecondDiagonalMissile: @ 0x0808BFB0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x13]
	adds r5, r0, #1
	strb r5, [r4, #0x13]
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808C058
	ldrb r1, [r4, #0x13]
	ldr r2, _0808C01C @ =0x0858B40C
	movs r3, #4
	ldrsh r0, [r4, r3]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r6, #0
	ldrsh r0, [r0, r6]
	adds r0, #1
	muls r0, r1, r0
	asrs r0, r0, #2
	ldrh r1, [r4]
	subs r3, r1, r0
	strh r3, [r4, #0xc]
	ldrb r1, [r4, #0x13]
	movs r6, #4
	ldrsh r0, [r4, r6]
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r0, #1
	muls r0, r1, r0
	asrs r0, r0, #2
	ldrh r1, [r4, #2]
	subs r2, r1, r0
	strh r2, [r4, #0xe]
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808C020
	movs r0, #0
	strb r0, [r4, #0x13]
	ldrh r1, [r4, #4]
	movs r3, #4
	ldrsh r0, [r4, r3]
	cmp r0, #5
	bgt _0808C010
	adds r0, r1, #1
	strh r0, [r4, #4]
_0808C010:
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	b _0808C038
	.align 2, 0
_0808C01C: .4byte 0x0858B40C
_0808C020:
	cmp r0, #1
	bne _0808C038
	adds r1, r3, #0
	adds r1, #0xa
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r2, #0xc
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #8
	bl NewFileIntroInSr388SetupOam
_0808C038:
	movs r6, #0xe
	ldrsh r0, [r4, r6]
	cmp r0, #0x31
	bgt _0808C07E
	movs r0, #0
	strb r0, [r4, #0x13]
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldr r0, _0808C054 @ =0x085A2E08
	str r0, [r4, #0x1c]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _0808C07E
	.align 2, 0
_0808C054: .4byte 0x085A2E08
_0808C058:
	cmp r0, #1
	bne _0808C07E
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #0x12]
	cmp r0, r2
	bne _0808C07E
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0808C07E
	strb r1, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_0808C07E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_8c084
unk_8c084: @ 0x0808C084
	movs r1, #0
	strb r1, [r0, #0x10]
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroInSr388SetupOam
NewFileIntroInSr388SetupOam: @ 0x0808C08C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	movs r0, #0
	mov r8, r0
	ldr r1, _0808C0E4 @ =gNonGameplayRam
	movs r2, #0x8b
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	beq _0808C0DA
_0808C0BC:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x13
	bhi _0808C0E0
	lsls r0, r0, #3
	add r0, r8
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808C0BC
_0808C0DA:
	mov r1, r8
	cmp r1, #0x13
	bls _0808C0E8
_0808C0E0:
	movs r0, #0x14
	b _0808C4EE
	.align 2, 0
_0808C0E4: .4byte gNonGameplayRam
_0808C0E8:
	movs r0, #0
	str r0, [sp]
	ldr r1, _0808C160 @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	mov r0, r8
	lsls r3, r0, #3
	adds r0, r3, r0
	lsls r6, r0, #2
	ldr r2, _0808C164 @ =0x030016A0
	mov ip, r2
	adds r0, r6, r2
	str r0, [r1, #4]
	ldr r0, _0808C168 @ =0x85000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0808C16C @ =0xFFFFFDE4
	add r0, ip
	adds r4, r6, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r4, r1
	mov r2, sb
	strh r2, [r0]
	adds r1, #2
	adds r0, r4, r1
	mov r2, sl
	strh r2, [r0]
	adds r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	cmp r5, #1
	bne _0808C17C
	ldr r1, _0808C170 @ =0x00000236
	adds r2, r4, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C174 @ =0x085A441C
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808C178 @ =NewFileIntroProcessSamusInSr388
	str r1, [r0]
	b _0808C4EC
	.align 2, 0
_0808C160: .4byte 0x040000D4
_0808C164: .4byte 0x030016A0
_0808C168: .4byte 0x85000009
_0808C16C: .4byte 0xFFFFFDE4
_0808C170: .4byte 0x00000236
_0808C174: .4byte 0x085A441C
_0808C178: .4byte NewFileIntroProcessSamusInSr388
_0808C17C:
	cmp r5, #2
	bne _0808C1BC
	movs r2, #0x89
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #0x26
	strh r0, [r1]
	ldr r3, _0808C1B0 @ =0x00000236
	adds r2, r4, r3
	ldrb r1, [r2]
	subs r0, #0x33
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C1B4 @ =0x085A2CF0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808C1B8 @ =NewfileIntroProcessLeftBiologicalResearcher
	str r1, [r0]
	b _0808C4EC
	.align 2, 0
_0808C1B0: .4byte 0x00000236
_0808C1B4: .4byte 0x085A2CF0
_0808C1B8: .4byte NewfileIntroProcessLeftBiologicalResearcher
_0808C1BC:
	cmp r5, #3
	bne _0808C208
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0x48
	strh r0, [r1]
	ldr r2, _0808C1F8 @ =0x0000022D
	adds r1, r4, r2
	movs r0, #1
	strb r0, [r1]
	ldr r3, _0808C1FC @ =0x00000236
	adds r2, r4, r3
	ldrb r1, [r2]
	subs r0, #0xe
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C200 @ =0x085A2CF0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808C204 @ =NewfileIntroProcessRightBiologicalResearcher
	str r1, [r0]
	b _0808C4EC
	.align 2, 0
_0808C1F8: .4byte 0x0000022D
_0808C1FC: .4byte 0x00000236
_0808C200: .4byte 0x085A2CF0
_0808C204: .4byte NewfileIntroProcessRightBiologicalResearcher
_0808C208:
	cmp r5, #4
	beq _0808C222
	cmp r5, #5
	bne _0808C25C
	movs r2, #0x89
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #1
	strh r0, [r1]
	ldr r3, _0808C24C @ =0x00000226
	adds r1, r4, r3
	movs r0, #2
	strh r0, [r1]
_0808C222:
	ldr r0, _0808C250 @ =0x00000236
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C254 @ =0x085A2B58
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808C258 @ =unk_8b660
	str r1, [r0]
	b _0808C4EC
	.align 2, 0
_0808C24C: .4byte 0x00000226
_0808C250: .4byte 0x00000236
_0808C254: .4byte 0x085A2B58
_0808C258: .4byte unk_8b660
_0808C25C:
	cmp r5, #6
	bne _0808C2A8
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r4, r1
	mov r2, sb
	strh r2, [r0]
	ldr r3, _0808C29C @ =0x0000021E
	adds r0, r4, r3
	mov r1, sl
	strh r1, [r0]
	adds r3, #0x18
	adds r2, r4, r3
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C2A0 @ =0x085A2DA8
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808C2A4 @ =NewFileIntroProcessHorizontalMissile
	str r1, [r0]
	b _0808C4EC
	.align 2, 0
_0808C29C: .4byte 0x0000021E
_0808C2A0: .4byte 0x085A2DA8
_0808C2A4: .4byte NewFileIntroProcessHorizontalMissile
_0808C2A8:
	cmp r5, #7
	bne _0808C2F4
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r4, r1
	mov r2, sb
	strh r2, [r0]
	ldr r3, _0808C2E8 @ =0x0000021E
	adds r0, r4, r3
	mov r1, sl
	strh r1, [r0]
	adds r3, #0x18
	adds r2, r4, r3
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C2EC @ =0x085A2DC0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808C2F0 @ =NewFileIntroProcessFirstDiagonalMissile
	str r1, [r0]
	b _0808C4EC
	.align 2, 0
_0808C2E8: .4byte 0x0000021E
_0808C2EC: .4byte 0x085A2DC0
_0808C2F0: .4byte NewFileIntroProcessFirstDiagonalMissile
_0808C2F4:
	cmp r5, #8
	bne _0808C31C
	ldr r0, _0808C314 @ =0x00000236
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C318 @ =0x085A2DD8
	b _0808C382
	.align 2, 0
_0808C314: .4byte 0x00000236
_0808C318: .4byte 0x085A2DD8
_0808C31C:
	cmp r5, #9
	bne _0808C364
	ldr r2, _0808C354 @ =0x00000222
	adds r1, r4, r2
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r3, _0808C358 @ =0x00000236
	adds r2, r4, r3
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C35C @ =0x085A2BD0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808C360 @ =NewFileIntroProcessHornoad
	str r1, [r0]
	b _0808C4EC
	.align 2, 0
_0808C354: .4byte 0x00000222
_0808C358: .4byte 0x00000236
_0808C35C: .4byte 0x085A2BD0
_0808C360: .4byte NewFileIntroProcessHornoad
_0808C364:
	cmp r5, #0xa
	bne _0808C39C
	ldr r0, _0808C390 @ =0x00000236
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808C394 @ =0x085A2E38
_0808C382:
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808C398 @ =unk_8be18
	str r1, [r0]
	b _0808C4EC
	.align 2, 0
_0808C390: .4byte 0x00000236
_0808C394: .4byte 0x085A2E38
_0808C398: .4byte unk_8be18
_0808C39C:
	cmp r5, #0xb
	bne _0808C3C8
	mov r1, r8
	adds r2, r3, r1
	lsls r2, r2, #2
	adds r1, r2, r7
	movs r3, #0x8d
	lsls r3, r3, #2
	adds r1, r1, r3
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r2, r2, r0
	ldr r0, _0808C3C4 @ =unk_8be44
	b _0808C4EA
	.align 2, 0
_0808C3C4: .4byte unk_8be44
_0808C3C8:
	cmp r5, #0xc
	bne _0808C404
	add r3, r8
	lsls r3, r3, #2
	adds r1, r3, r7
	ldr r2, _0808C3F8 @ =0x00000236
	adds r1, r1, r2
	ldrb r0, [r1]
	movs r2, #0xc
	orrs r0, r2
	strb r0, [r1]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _0808C3FC @ =0x085A2EC8
	str r1, [r0]
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r0, r7, r2
	adds r3, r3, r0
	ldr r0, _0808C400 @ =unk_8bf1c
	str r0, [r3]
	b _0808C4EC
	.align 2, 0
_0808C3F8: .4byte 0x00000236
_0808C3FC: .4byte 0x085A2EC8
_0808C400: .4byte unk_8bf1c
_0808C404:
	cmp r5, #0xd
	bne _0808C440
	add r3, r8
	lsls r3, r3, #2
	adds r1, r3, r7
	ldr r0, _0808C434 @ =0x00000236
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #0xc
	orrs r0, r2
	strb r0, [r1]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _0808C438 @ =0x085A2ED8
	str r1, [r0]
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r0, r7, r2
	adds r3, r3, r0
	ldr r0, _0808C43C @ =unk_8bf68
	str r0, [r3]
	b _0808C4EC
	.align 2, 0
_0808C434: .4byte 0x00000236
_0808C438: .4byte 0x085A2ED8
_0808C43C: .4byte unk_8bf68
_0808C440:
	cmp r5, #0xe
	bne _0808C498
	add r3, r8
	lsls r3, r3, #2
	adds r2, r3, r7
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, sb
	strh r1, [r0]
	ldr r1, _0808C488 @ =0x0000021E
	adds r0, r2, r1
	mov r1, sl
	strh r1, [r0]
	ldr r0, _0808C48C @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _0808C490 @ =0x085A2DC0
	str r1, [r0]
	movs r2, #0x8f
	lsls r2, r2, #2
	adds r0, r7, r2
	adds r3, r3, r0
	ldr r0, _0808C494 @ =NewFileIntroProcessSecondDiagonalMissile
	str r0, [r3]
	b _0808C4EC
	.align 2, 0
_0808C488: .4byte 0x0000021E
_0808C48C: .4byte 0x00000236
_0808C490: .4byte 0x085A2DC0
_0808C494: .4byte NewFileIntroProcessSecondDiagonalMissile
_0808C498:
	cmp r5, #0x32
	bne _0808C4C4
	mov r0, r8
	adds r2, r3, r0
	lsls r2, r2, #2
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r2, r0
	ldr r1, _0808C4BC @ =0x08613180
	str r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r0, r7, r3
	adds r2, r2, r0
	ldr r0, _0808C4C0 @ =NewFileIntroProcessTextCursor
	b _0808C4EA
	.align 2, 0
_0808C4BC: .4byte 0x08613180
_0808C4C0: .4byte NewFileIntroProcessTextCursor
_0808C4C4:
	cmp r5, #0xff
	bne _0808C4EC
	mov r0, r8
	adds r2, r3, r0
	lsls r2, r2, #2
	adds r1, r2, r7
	movs r3, #0x8d
	lsls r3, r3, #2
	adds r1, r1, r3
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r2, r2, r0
	ldr r0, _0808C500 @ =unk_8c084
_0808C4EA:
	str r0, [r2]
_0808C4EC:
	mov r0, r8
_0808C4EE:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808C500: .4byte unk_8c084

	thumb_func_start unk_8c504
unk_8c504: @ 0x0808C504
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl NewFileIntroInSr388SetupOam
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808C538 @ =gNonGameplayRam
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r1, r0
	strh r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808C538: .4byte gNonGameplayRam

	thumb_func_start NewFileIntro_Empty
NewFileIntro_Empty: @ 0x0808C53C
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroGetPositionOfOamByType
NewFileIntroGetPositionOfOamByType: @ 0x0808C540
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0
	ldr r7, _0808C574 @ =gNonGameplayRam
	movs r6, #0x8b
	lsls r6, r6, #2
_0808C550:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _0808C578
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrh r0, [r0]
	strh r0, [r4]
	adds r1, #2
	adds r0, r3, r1
	ldrh r0, [r0]
	b _0808C58C
	.align 2, 0
_0808C574: .4byte gNonGameplayRam
_0808C578:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bls _0808C550
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r4]
	movs r0, #0xc8
_0808C58C:
	strh r0, [r2]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewFileIntroInSr388Vblank
NewFileIntroInSr388Vblank: @ 0x0808C594
	push {lr}
	ldr r3, _0808C624 @ =0x040000D4
	ldr r0, _0808C628 @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _0808C62C @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _0808C630 @ =0x04000052
	ldr r0, _0808C634 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0808C638 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808C63C @ =0x04000054
	ldr r0, _0808C640 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _0808C644 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808C648 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808C64C @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808C650 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808C654 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808C658 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _0808C65C @ =gNonGameplayRam
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808C61E
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0808C660 @ =0x085A9440
	str r0, [r3]
	ldr r0, _0808C664 @ =0x05000200
	str r0, [r3, #4]
	ldr r1, _0808C668 @ =0x84000078
	str r1, [r3, #8]
	ldr r0, [r3, #8]
	ldr r0, _0808C66C @ =0x085A9260
	str r0, [r3]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	str r1, [r3, #8]
	ldr r0, [r3, #8]
_0808C61E:
	pop {r0}
	bx r0
	.align 2, 0
_0808C624: .4byte 0x040000D4
_0808C628: .4byte gOamData
_0808C62C: .4byte 0x84000100
_0808C630: .4byte 0x04000052
_0808C634: .4byte gWrittenToBldalpha_L
_0808C638: .4byte gWrittenToBldalpha_R
_0808C63C: .4byte 0x04000054
_0808C640: .4byte gWrittenToBldy
_0808C644: .4byte gBg1XPosition
_0808C648: .4byte gBg1YPosition
_0808C64C: .4byte 0x0300122C
_0808C650: .4byte 0x0300122E
_0808C654: .4byte 0x03001230
_0808C658: .4byte 0x03001232
_0808C65C: .4byte gNonGameplayRam
_0808C660: .4byte 0x085A9440
_0808C664: .4byte 0x05000200
_0808C668: .4byte 0x84000078
_0808C66C: .4byte 0x085A9260

	thumb_func_start NewFileIntroSamusGettingCuredInit
NewFileIntroSamusGettingCuredInit: @ 0x0808C670
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r3, _0808C7D0 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0808C7D4 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0808C7D8 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0808C7DC @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0808C7E0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0808C7E4 @ =unk_99940
	bl CallbackSetVBlank
	ldr r6, _0808C7E8 @ =gNonGameplayRam
	ldr r1, [r6, #4]
	movs r5, #0
	str r5, [sp]
	ldr r4, _0808C7EC @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	str r6, [r4, #4]
	ldr r0, _0808C7F0 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	str r1, [r6, #4]
	ldr r0, _0808C7F4 @ =0x085A965C
	ldr r1, _0808C7F8 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _0808C7FC @ =0x085B0F3C
	str r0, [r4]
	ldr r0, _0808C800 @ =0x05000200
	str r0, [r4, #4]
	ldr r2, _0808C804 @ =0x84000080
	mov r8, r2
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808C808 @ =0x08613148
	str r0, [r4]
	ldr r0, _0808C80C @ =0x06017FE0
	str r0, [r4, #4]
	ldr r1, _0808C810 @ =0x84000008
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808C814 @ =0x086131A8
	str r0, [r4]
	ldr r0, _0808C818 @ =0x050003E0
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808C81C @ =0x085B113C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0808C820 @ =0x085B3EE4
	ldr r1, _0808C824 @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _0808C828 @ =0x085B408C
	ldr r1, _0808C82C @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0808C830 @ =0x085B4240
	ldr r1, _0808C834 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0808C838 @ =0x08598898
	ldr r1, _0808C83C @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0808C840 @ =0x085B3CE4
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	mov r0, r8
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _0808C844 @ =0x04000010
	ldr r2, _0808C848 @ =0x0000FFF8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0808C84C @ =0x04000012
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
	subs r1, #8
	ldr r2, _0808C850 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #0xfa
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0808C854 @ =0x00001E03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0808C858 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _0808C85C @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0808C860 @ =0x04000054
	strh r1, [r0]
	movs r1, #0x82
	lsls r1, r1, #1
	movs r0, #0xc8
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #1
	movs r1, #0xc0
	movs r2, #0x60
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #4
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _0808C864 @ =0x0863A19C
	str r0, [r6]
	str r5, [sp]
	mov r0, sp
	str r0, [r4]
	ldr r0, _0808C868 @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _0808C86C @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0808C870 @ =NewFileIntroSamusGettingCuredVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808C7D0: .4byte 0x04000208
_0808C7D4: .4byte 0x04000004
_0808C7D8: .4byte 0x0000FFEF
_0808C7DC: .4byte 0x04000200
_0808C7E0: .4byte 0x0000FFFD
_0808C7E4: .4byte unk_99940
_0808C7E8: .4byte gNonGameplayRam
_0808C7EC: .4byte 0x040000D4
_0808C7F0: .4byte 0x85000150
_0808C7F4: .4byte 0x085A965C
_0808C7F8: .4byte 0x06010000
_0808C7FC: .4byte 0x085B0F3C
_0808C800: .4byte 0x05000200
_0808C804: .4byte 0x84000080
_0808C808: .4byte 0x08613148
_0808C80C: .4byte 0x06017FE0
_0808C810: .4byte 0x84000008
_0808C814: .4byte 0x086131A8
_0808C818: .4byte 0x050003E0
_0808C81C: .4byte 0x085B113C
_0808C820: .4byte 0x085B3EE4
_0808C824: .4byte 0x0600E800
_0808C828: .4byte 0x085B408C
_0808C82C: .4byte 0x0600F000
_0808C830: .4byte 0x085B4240
_0808C834: .4byte 0x0600F800
_0808C838: .4byte 0x08598898
_0808C83C: .4byte 0x0600E000
_0808C840: .4byte 0x085B3CE4
_0808C844: .4byte 0x04000010
_0808C848: .4byte 0x0000FFF8
_0808C84C: .4byte 0x04000012
_0808C850: .4byte 0x00001C08
_0808C854: .4byte 0x00001E03
_0808C858: .4byte 0x00001F03
_0808C85C: .4byte gWrittenToBldy
_0808C860: .4byte 0x04000054
_0808C864: .4byte 0x0863A19C
_0808C868: .4byte 0x0600D000
_0808C86C: .4byte 0x85000400
_0808C870: .4byte NewFileIntroSamusGettingCuredVblank

	thumb_func_start NewFileIntroSamusGettingCuredOperationProcess
NewFileIntroSamusGettingCuredOperationProcess: @ 0x0808C874
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r2, _0808C8C8 @ =gNonGameplayRam
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _0808C8A2
	ldr r0, _0808C8CC @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808C8A2
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808C8A2
	movs r0, #1
	strb r0, [r1]
_0808C8A2:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r3, r2, r1
	ldrh r0, [r3]
	adds r0, #1
	movs r5, #0
	movs r4, #0
	strh r0, [r3]
	adds r1, #4
	adds r6, r2, r1
	ldrb r1, [r6]
	cmp r1, #1
	beq _0808C954
	cmp r1, #1
	bgt _0808C8D0
	cmp r1, #0
	beq _0808C8DA
	b _0808C9BE
	.align 2, 0
_0808C8C8: .4byte gNonGameplayRam
_0808C8CC: .4byte gChangedInput
_0808C8D0:
	cmp r1, #2
	beq _0808C974
	cmp r1, #3
	beq _0808C998
	b _0808C9BE
_0808C8DA:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x3c
	bne _0808C8F8
	ldr r3, _0808C8F4 @ =0x00000212
	adds r0, r2, r3
	strb r5, [r0]
	strh r4, [r2, #0xe]
	strh r4, [r2, #0xc]
	ldr r0, [r2, #4]
	str r0, [r2]
	b _0808C936
	.align 2, 0
_0808C8F4: .4byte 0x00000212
_0808C8F8:
	cmp r1, #0xa0
	bne _0808C90E
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r1, [r0]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0]
	b _0808C936
_0808C90E:
	cmp r1, #0xb4
	bne _0808C928
	movs r0, #2
	movs r1, #0x6c
	movs r2, #0x40
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #3
	movs r1, #0x80
	movs r2, #0x44
	bl NewFileIntroSamusGettingCuredSetupOam
	b _0808C936
_0808C928:
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r1, r0
	bls _0808C936
	strh r4, [r3]
	movs r0, #1
	strb r0, [r6]
_0808C936:
	ldr r0, _0808C950 @ =gNonGameplayRam
	movs r2, #0x86
	lsls r2, r2, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808C948
	cmp r0, #4
	bne _0808C988
_0808C948:
	movs r0, #0
	strb r0, [r1]
	b _0808C988
	.align 2, 0
_0808C950: .4byte gNonGameplayRam
_0808C954:
	strh r4, [r3]
	movs r3, #0x86
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r1, [r0]
	cmp r1, #2
	beq _0808C966
	cmp r1, #4
	bne _0808C96A
_0808C966:
	strb r5, [r0]
	b _0808C988
_0808C96A:
	cmp r1, #3
	bne _0808C988
	strb r5, [r0]
	movs r0, #2
	b _0808C986
_0808C974:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1e
	bne _0808C988
	strh r4, [r3]
	ldr r0, _0808C994 @ =0x04000050
	movs r1, #0xff
	strh r1, [r0]
	movs r0, #3
_0808C986:
	strb r0, [r6]
_0808C988:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _0808C9BE
	.align 2, 0
_0808C994: .4byte 0x04000050
_0808C998:
	ldr r1, _0808C9A8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808C9AC
	adds r0, #2
	strh r0, [r1]
	b _0808C9B6
	.align 2, 0
_0808C9A8: .4byte gWrittenToBldy
_0808C9AC:
	movs r0, #0x10
	strh r0, [r1]
	strh r4, [r3]
	strb r5, [r6]
	movs r7, #1
_0808C9B6:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808C9BE:
	bl IntroProcessText
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroSamusGettingCuredNervousSystemHblank
NewFileIntroSamusGettingCuredNervousSystemHblank: @ 0x0808C9CC
	ldr r0, _0808C9E0 @ =0x04000006
	ldrh r0, [r0]
	ldr r1, _0808C9E4 @ =0x04000040
	lsls r0, r0, #0x11
	asrs r0, r0, #0x10
	ldr r2, _0808C9E8 @ =0x02002000
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0808C9E0: .4byte 0x04000006
_0808C9E4: .4byte 0x04000040
_0808C9E8: .4byte 0x02002000

	thumb_func_start NewFileIntroSamusGettingCuredNervousSystemInit
NewFileIntroSamusGettingCuredNervousSystemInit: @ 0x0808C9EC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _0808CC48 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _0808CC4C @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r7, _0808CC50 @ =0x030016A0
	str r7, [r4, #4]
	ldr r0, _0808CC54 @ =0x850000B4
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _0808CC58 @ =0xFFFFFDE4
	adds r1, r1, r7
	mov sb, r1
	subs r0, r7, #4
	strb r5, [r0]
	ldr r0, _0808CC5C @ =0x085B4580
	ldr r1, _0808CC60 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _0808CC64 @ =0x085BA054
	str r0, [r4]
	ldr r0, _0808CC68 @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _0808CC6C @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808CC70 @ =0x08613148
	str r0, [r4]
	ldr r0, _0808CC74 @ =0x06017FE0
	str r0, [r4, #4]
	ldr r1, _0808CC78 @ =0x84000008
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808CC7C @ =0x086131A8
	str r0, [r4]
	ldr r0, _0808CC80 @ =0x050003E0
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808CC84 @ =0x085BA254
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0808CC88 @ =0x085BF728
	ldr r1, _0808CC8C @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _0808CC90 @ =0x085BF62C
	ldr r1, _0808CC94 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0808CC98 @ =0x085BF068
	ldr r1, _0808CC9C @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0808CCA0 @ =0x08598898
	ldr r1, _0808CCA4 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0808CCA8 @ =0x085BEE68
	str r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	movs r2, #0xf8
	lsls r2, r2, #2
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808CCAC @ =0x04000010
	ldr r3, _0808CCB0 @ =0x0000FFF8
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0808CCB4 @ =0x04000012
	movs r1, #0
	mov r8, r1
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
	ldr r1, _0808CCB8 @ =0x04000008
	ldr r2, _0808CCBC @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0808CCC0 @ =0x00001D01
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0808CCC4 @ =0x00001E02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0808CCC8 @ =0x00001F03
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _0808CCCC @ =gWrittenToBldy
	movs r6, #0x10
	strh r6, [r0]
	ldr r0, _0808CCD0 @ =0x04000054
	strh r6, [r0]
	ldr r1, _0808CCD4 @ =gWrittenToBldalpha_L
	ldr r0, _0808CCD8 @ =gWrittenToBldalpha_R
	strh r5, [r0]
	strh r5, [r1]
	movs r1, #0x82
	lsls r1, r1, #1
	movs r0, #0xc8
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xe
	movs r1, #0xac
	movs r2, #0x9e
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0xf
	movs r1, #0x78
	movs r2, #0x50
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0x10
	movs r1, #0xc3
	movs r2, #0x61
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0x11
	movs r1, #0x80
	movs r2, #0x80
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0x12
	movs r1, #0x91
	movs r2, #0x1c
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0x13
	movs r1, #0x64
	movs r2, #0x48
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0x14
	movs r1, #0x2c
	movs r2, #0x1e
	bl NewFileIntroSamusGettingCuredSetupOam
	movs r0, #0x15
	movs r1, #0x3e
	movs r2, #0x79
	bl NewFileIntroSamusGettingCuredSetupOam
	ldr r1, _0808CCDC @ =0xFFFFFEF4
	adds r0, r7, r1
	mov r2, r8
	strb r2, [r0]
	ldr r3, _0808CCE0 @ =0xFFFFFEF5
	adds r0, r7, r3
	strb r2, [r0]
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _0808CCE4 @ =0x0863A19C
	mov r1, sb
	str r0, [r1]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r0, _0808CCE8 @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _0808CCEC @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _0808CCF0 @ =0x04000044
	movs r0, #0xa0
	strh r0, [r1]
	adds r1, r7, #0
	subs r1, #0x29
	movs r0, #0x46
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x78
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x4e
	strb r0, [r1]
	bl NewFileIntroSamusGettingCuredSetupWindow
	bl NewFileIntroSamusGettingCuredSetupWindow
	ldr r0, _0808CCF4 @ =NewFileIntroSamusGettingCuredNervousSystemHblank
	str r0, [r4]
	movs r3, #0xb4
	lsls r3, r3, #2
	adds r0, r7, r3
	str r0, [r4, #4]
	ldr r0, _0808CCF8 @ =0x84000014
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0xc8
	lsls r0, r0, #2
	adds r1, r7, r0
	ldr r2, _0808CCFC @ =0x000002D1
	adds r0, r7, r2
	str r0, [r1]
	bl CallbackSetHBlank
	ldr r2, _0808CD00 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808CD04 @ =0x04000004
	ldrh r0, [r1]
	orrs r0, r6
	strh r0, [r1]
	adds r1, #0x44
	movs r0, #0x3b
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x3f
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r2]
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0808CD08 @ =NewFileIntroSamusGettingCuredNervousSystemVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808CC48: .4byte unk_99940
_0808CC4C: .4byte 0x040000D4
_0808CC50: .4byte 0x030016A0
_0808CC54: .4byte 0x850000B4
_0808CC58: .4byte 0xFFFFFDE4
_0808CC5C: .4byte 0x085B4580
_0808CC60: .4byte 0x06010000
_0808CC64: .4byte 0x085BA054
_0808CC68: .4byte 0x05000200
_0808CC6C: .4byte 0x84000080
_0808CC70: .4byte 0x08613148
_0808CC74: .4byte 0x06017FE0
_0808CC78: .4byte 0x84000008
_0808CC7C: .4byte 0x086131A8
_0808CC80: .4byte 0x050003E0
_0808CC84: .4byte 0x085BA254
_0808CC88: .4byte 0x085BF728
_0808CC8C: .4byte 0x0600E800
_0808CC90: .4byte 0x085BF62C
_0808CC94: .4byte 0x0600F000
_0808CC98: .4byte 0x085BF068
_0808CC9C: .4byte 0x0600F800
_0808CCA0: .4byte 0x08598898
_0808CCA4: .4byte 0x0600E000
_0808CCA8: .4byte 0x085BEE68
_0808CCAC: .4byte 0x04000010
_0808CCB0: .4byte 0x0000FFF8
_0808CCB4: .4byte 0x04000012
_0808CCB8: .4byte 0x04000008
_0808CCBC: .4byte 0x00001C08
_0808CCC0: .4byte 0x00001D01
_0808CCC4: .4byte 0x00001E02
_0808CCC8: .4byte 0x00001F03
_0808CCCC: .4byte gWrittenToBldy
_0808CCD0: .4byte 0x04000054
_0808CCD4: .4byte gWrittenToBldalpha_L
_0808CCD8: .4byte gWrittenToBldalpha_R
_0808CCDC: .4byte 0xFFFFFEF4
_0808CCE0: .4byte 0xFFFFFEF5
_0808CCE4: .4byte 0x0863A19C
_0808CCE8: .4byte 0x0600D000
_0808CCEC: .4byte 0x85000400
_0808CCF0: .4byte 0x04000044
_0808CCF4: .4byte NewFileIntroSamusGettingCuredNervousSystemHblank
_0808CCF8: .4byte 0x84000014
_0808CCFC: .4byte 0x000002D1
_0808CD00: .4byte 0x04000200
_0808CD04: .4byte 0x04000004
_0808CD08: .4byte NewFileIntroSamusGettingCuredNervousSystemVblank

	thumb_func_start NewFileIntroSamusGettingCuredNervousSystemProcess
NewFileIntroSamusGettingCuredNervousSystemProcess: @ 0x0808CD0C
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _0808CD60 @ =gNonGameplayRam
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	adds r3, r2, #0
	cmp r1, r0
	bne _0808CD3C
	ldr r0, _0808CD64 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808CD3C
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808CD3C
	movs r0, #1
	strb r0, [r1]
_0808CD3C:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #7
	bls _0808CD56
	b _0808CF72
_0808CD56:
	lsls r0, r0, #2
	ldr r1, _0808CD68 @ =_0808CD6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808CD60: .4byte gNonGameplayRam
_0808CD64: .4byte gChangedInput
_0808CD68: .4byte _0808CD6C
_0808CD6C: @ jump table
	.4byte _0808CD8C @ case 0
	.4byte _0808CDA4 @ case 1
	.4byte _0808CDDC @ case 2
	.4byte _0808CE10 @ case 3
	.4byte _0808CE58 @ case 4
	.4byte _0808CEB8 @ case 5
	.4byte _0808CEF0 @ case 6
	.4byte _0808CF38 @ case 7
_0808CD8C:
	bl NewFileIntroSamusGettingCuredNervousSystemInit
	ldr r0, _0808CDA0 @ =gNonGameplayRam
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r0, r4
	movs r1, #1
	strb r1, [r0]
	b _0808CF72
	.align 2, 0
_0808CDA0: .4byte gNonGameplayRam
_0808CDA4:
	ldr r2, _0808CDB4 @ =gWrittenToBldy
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0808CDB8
	subs r0, #2
	strh r0, [r2]
	b _0808CF28
	.align 2, 0
_0808CDB4: .4byte gWrittenToBldy
_0808CDB8:
	strh r1, [r2]
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r3, r2
	strh r1, [r0]
	ldr r1, _0808CDD4 @ =0x04000050
	ldr r4, _0808CDD8 @ =0x00003844
	adds r0, r4, #0
	strh r0, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #2
	b _0808CF26
	.align 2, 0
_0808CDD4: .4byte 0x04000050
_0808CDD8: .4byte 0x00003844
_0808CDDC:
	ldr r1, _0808CDF4 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0xb
	bhi _0808CDFC
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0808CDF8 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0808CF28
	.align 2, 0
_0808CDF4: .4byte gWrittenToBldalpha_R
_0808CDF8: .4byte gWrittenToBldalpha_L
_0808CDFC:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #0
	strh r0, [r1]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #3
	b _0808CF26
_0808CE10:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrh r0, [r4]
	cmp r0, #0x1e
	beq _0808CE1E
	b _0808CF28
_0808CE1E:
	movs r2, #0
	movs r1, #0
	strh r1, [r4]
	ldr r4, _0808CE4C @ =0x00000212
	adds r0, r3, r4
	strb r2, [r0]
	strh r1, [r3, #0xe]
	strh r1, [r3, #0xc]
	ldr r1, _0808CE50 @ =0x0879C5A4
	ldr r0, _0808CE54 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x40]
	str r0, [r3]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #4
	b _0808CF26
	.align 2, 0
_0808CE4C: .4byte 0x00000212
_0808CE50: .4byte 0x0879C5A4
_0808CE54: .4byte 0x03000011
_0808CE58:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r5, #0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrb r0, [r4]
	cmp r0, #2
	bne _0808CE78
	strb r5, [r4]
	ldr r0, [r3]
	str r0, [r3, #4]
	b _0808CF28
_0808CE78:
	cmp r0, #3
	bne _0808CE88
	strb r5, [r4]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #5
	b _0808CF26
_0808CE88:
	cmp r0, #4
	bne _0808CF28
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808CEB0 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	strb r5, [r4]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #5
	strb r0, [r1]
	ldr r0, [r3]
	str r0, [r3, #4]
	ldr r0, _0808CEB4 @ =0x0863A19C
	str r0, [r3]
	b _0808CF28
	.align 2, 0
_0808CEB0: .4byte 0x0000FEFF
_0808CEB4: .4byte 0x0863A19C
_0808CEB8:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrh r1, [r2]
	cmp r1, #1
	bne _0808CED0
	movs r0, #0x1c
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusGettingCuredSetupOam
	b _0808CF28
_0808CED0:
	movs r0, #0xe1
	lsls r0, r0, #1
	cmp r1, r0
	bls _0808CF28
	movs r0, #0
	strh r0, [r2]
	ldr r1, _0808CEEC @ =gWrittenToBldy
	movs r0, #4
	strh r0, [r1]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	b _0808CF24
	.align 2, 0
_0808CEEC: .4byte gWrittenToBldy
_0808CEF0:
	ldr r2, _0808CF08 @ =gWrittenToBldalpha_R
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0808CF10
	subs r0, #2
	strh r0, [r2]
	ldr r1, _0808CF0C @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	subs r0, #2
	strh r0, [r1]
	b _0808CF28
	.align 2, 0
_0808CF08: .4byte gWrittenToBldalpha_R
_0808CF0C: .4byte gWrittenToBldalpha_L
_0808CF10:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _0808CF34 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
_0808CF24:
	movs r0, #7
_0808CF26:
	strb r0, [r1]
_0808CF28:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _0808CF72
	.align 2, 0
_0808CF34: .4byte 0x04000050
_0808CF38:
	ldr r1, _0808CF4C @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r1, _0808CF50 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808CF54
	adds r0, #2
	strh r0, [r1]
	b _0808CF6A
	.align 2, 0
_0808CF4C: .4byte 0x04000050
_0808CF50: .4byte gWrittenToBldy
_0808CF54:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r3, r4
	strb r2, [r0]
	movs r6, #1
_0808CF6A:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808CF72:
	bl IntroProcessText
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroSamusGettingCured
NewFileIntroSamusGettingCured: @ 0x0808CF80
	push {r4, lr}
	movs r4, #0
	ldr r0, _0808CF98 @ =gNonGameplayRam
	ldrh r1, [r0, #8]
	adds r2, r0, #0
	cmp r1, #4
	bhi _0808D052
	lsls r0, r1, #2
	ldr r1, _0808CF9C @ =_0808CFA0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808CF98: .4byte gNonGameplayRam
_0808CF9C: .4byte _0808CFA0
_0808CFA0: @ jump table
	.4byte _0808CFB4 @ case 0
	.4byte _0808CFC4 @ case 1
	.4byte _0808CFE0 @ case 2
	.4byte _0808D008 @ case 3
	.4byte _0808D030 @ case 4
_0808CFB4:
	bl NewFileIntroSamusGettingCuredInit
	ldr r1, _0808CFC0 @ =gNonGameplayRam
	movs r0, #1
	strh r0, [r1, #8]
	b _0808D052
	.align 2, 0
_0808CFC0: .4byte gNonGameplayRam
_0808CFC4:
	bl SpecialCutsceneFadeIn
	ldr r0, _0808CFD8 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _0808D052
	ldr r1, _0808CFDC @ =gNonGameplayRam
	movs r0, #2
	strh r0, [r1, #8]
	b _0808D052
	.align 2, 0
_0808CFD8: .4byte gWrittenToBldy
_0808CFDC: .4byte gNonGameplayRam
_0808CFE0:
	bl NewFileIntroSamusGettingCuredOperationProcess
	cmp r0, #0
	beq _0808D052
	ldr r1, _0808D000 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0808D004 @ =0x00000213
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, #3
	strh r0, [r1, #8]
	b _0808D052
	.align 2, 0
_0808D000: .4byte gNonGameplayRam
_0808D004: .4byte 0x00000213
_0808D008:
	bl NewFileIntroSamusGettingCuredNervousSystemProcess
	cmp r0, #0
	beq _0808D052
	ldr r1, _0808D028 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0808D02C @ =0x00000213
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, #4
	strh r0, [r1, #8]
	b _0808D052
	.align 2, 0
_0808D028: .4byte gNonGameplayRam
_0808D02C: .4byte 0x00000213
_0808D030:
	ldr r1, _0808D040 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808D044
	adds r0, #1
	strh r0, [r1]
	b _0808D04A
	.align 2, 0
_0808D040: .4byte gWrittenToBldy
_0808D044:
	movs r0, #0
	strh r0, [r2, #8]
	movs r4, #1
_0808D04A:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808D052:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroProcessVaccineBackgroundText
NewFileIntroProcessVaccineBackgroundText: @ 0x0808D05C
	ldr r3, _0808D068 @ =0x0400001A
	ldrh r2, [r0, #0xe]
	subs r1, r2, #1
	strh r1, [r0, #0xe]
	strh r2, [r3]
	bx lr
	.align 2, 0
_0808D068: .4byte 0x0400001A

	thumb_func_start unk_8d06c
unk_8d06c: @ 0x0808D06C
	movs r1, #0
	strb r1, [r0, #0x10]
	ldrb r2, [r0, #0x18]
	subs r1, #2
	ands r1, r2
	strb r1, [r0, #0x18]
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroProcessXInNervousSystem
NewFileIntroProcessXInNervousSystem: @ 0x0808D07C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808D092
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	movs r0, #1
	strb r0, [r4, #0x14]
_0808D092:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x4f
	bhi _0808D0D0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D0BA
	ldrh r2, [r4, #0xc]
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r1, r0
	bge _0808D102
	adds r0, r2, #1
	strh r0, [r4, #0xc]
	b _0808D102
_0808D0BA:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	subs r0, #4
	cmp r1, r0
	ble _0808D102
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	b _0808D102
_0808D0D0:
	cmp r1, #0x9f
	bhi _0808D102
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D0F0
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, #5
	cmp r1, r0
	bge _0808D102
	ldrh r0, [r4, #0xe]
	adds r0, #1
	b _0808D100
_0808D0F0:
	ldrh r2, [r4, #0xe]
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _0808D102
	subs r0, r2, #1
_0808D100:
	strh r0, [r4, #0xe]
_0808D102:
	ldr r0, _0808D130 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808D154
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0808D134
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r3, #0xe
	ldrsh r2, [r4, r3]
	movs r0, #0x16
	bl NewFileIntroSamusGettingCuredSetupOam
	b _0808D154
	.align 2, 0
_0808D130: .4byte gNonGameplayRam
_0808D134:
	cmp r0, #0xdc
	bls _0808D154
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _0808D154
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_0808D154:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessXLockOn
NewFileIntroProcessXLockOn: @ 0x0808D15C
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, _0808D1C0 @ =gNonGameplayRam
	movs r0, #8
	ldrsh r1, [r2, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r3
	movs r4, #0x8b
	lsls r4, r4, #2
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808D196
	subs r4, #4
	adds r0, r1, r4
	ldrh r0, [r0]
	strh r0, [r2, #0xc]
	movs r0, #8
	ldrsh r1, [r2, r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r1, _0808D1C4 @ =0x0000022A
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #0xe]
_0808D196:
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _0808D1B8
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0808D1B8
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_0808D1B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808D1C0: .4byte gNonGameplayRam
_0808D1C4: .4byte 0x0000022A

	thumb_func_start unk_8d1c8
unk_8d1c8: @ 0x0808D1C8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808D1DE
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	movs r0, #1
	strb r0, [r4, #0x14]
_0808D1DE:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x4f
	bhi _0808D21E
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D208
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, #4
	cmp r1, r0
	bge _0808D252
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _0808D252
_0808D208:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	subs r0, #4
	cmp r1, r0
	ble _0808D252
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	b _0808D252
_0808D21E:
	cmp r1, #0x9f
	bhi _0808D252
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D23E
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, #4
	cmp r1, r0
	bge _0808D252
	ldrh r0, [r4, #0xe]
	adds r0, #1
	b _0808D250
_0808D23E:
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	subs r0, #4
	cmp r1, r0
	ble _0808D252
	ldrh r0, [r4, #0xe]
	subs r0, #1
_0808D250:
	strh r0, [r4, #0xe]
_0808D252:
	ldr r0, _0808D280 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808D2A4
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0808D284
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0x17
	bl NewFileIntroSamusGettingCuredSetupOam
	b _0808D2A4
	.align 2, 0
_0808D280: .4byte gNonGameplayRam
_0808D284:
	cmp r0, #0xdc
	bls _0808D2A4
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _0808D2A4
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_0808D2A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_8d2ac
unk_8d2ac: @ 0x0808D2AC
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808D2C2
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	movs r0, #1
	strb r0, [r4, #0x14]
_0808D2C2:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x4f
	bhi _0808D302
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D2EC
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, #6
	cmp r1, r0
	bge _0808D336
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _0808D336
_0808D2EC:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	subs r0, #1
	cmp r1, r0
	ble _0808D336
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	b _0808D336
_0808D302:
	cmp r1, #0x9f
	bhi _0808D336
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D322
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, #4
	cmp r1, r0
	bge _0808D336
	ldrh r0, [r4, #0xe]
	adds r0, #1
	b _0808D334
_0808D322:
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	subs r0, #3
	cmp r1, r0
	ble _0808D336
	ldrh r0, [r4, #0xe]
	subs r0, #1
_0808D334:
	strh r0, [r4, #0xe]
_0808D336:
	ldr r0, _0808D364 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808D394
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0808D368
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0x18
	bl NewFileIntroSamusGettingCuredSetupOam
	b _0808D394
	.align 2, 0
_0808D364: .4byte gNonGameplayRam
_0808D368:
	cmp r0, #0xf0
	bls _0808D394
	ldrb r0, [r4, #0x18]
	movs r1, #7
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x18]
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _0808D394
	movs r0, #0
	strb r0, [r4, #0x10]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4, #0x18]
_0808D394:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_8d39c
unk_8d39c: @ 0x0808D39C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808D3B2
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	movs r0, #1
	strb r0, [r4, #0x14]
_0808D3B2:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x4f
	bhi _0808D3F2
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D3DC
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, #5
	cmp r1, r0
	bge _0808D426
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _0808D426
_0808D3DC:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	subs r0, #5
	cmp r1, r0
	ble _0808D426
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	b _0808D426
_0808D3F2:
	cmp r1, #0x9f
	bhi _0808D426
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D412
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, #5
	cmp r1, r0
	bge _0808D426
	ldrh r0, [r4, #0xe]
	adds r0, #1
	b _0808D424
_0808D412:
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	subs r0, #5
	cmp r1, r0
	ble _0808D426
	ldrh r0, [r4, #0xe]
	subs r0, #1
_0808D424:
	strh r0, [r4, #0xe]
_0808D426:
	ldr r0, _0808D454 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808D478
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0808D458
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0x19
	bl NewFileIntroSamusGettingCuredSetupOam
	b _0808D478
	.align 2, 0
_0808D454: .4byte gNonGameplayRam
_0808D458:
	cmp r0, #0xf0
	bls _0808D478
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _0808D478
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_0808D478:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_8d480
unk_8d480: @ 0x0808D480
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808D496
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	movs r0, #1
	strb r0, [r4, #0x14]
_0808D496:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x4f
	bhi _0808D4D6
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D4C0
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, #5
	cmp r1, r0
	bge _0808D508
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _0808D508
_0808D4C0:
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	movs r2, #0
	ldrsh r0, [r4, r2]
	subs r0, #1
	cmp r1, r0
	ble _0808D508
	ldrh r0, [r4, #0xc]
	subs r0, #1
	strh r0, [r4, #0xc]
	b _0808D508
_0808D4D6:
	cmp r1, #0x9f
	bhi _0808D508
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D4F6
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, #4
	cmp r1, r0
	bge _0808D508
	ldrh r0, [r4, #0xe]
	adds r0, #1
	b _0808D506
_0808D4F6:
	ldrh r2, [r4, #0xe]
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	movs r3, #2
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _0808D508
	subs r0, r2, #1
_0808D506:
	strh r0, [r4, #0xe]
_0808D508:
	ldr r0, _0808D534 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808D568
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x3c
	bne _0808D538
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r3, #0xe
	ldrsh r2, [r4, r3]
	movs r0, #0x1a
	bl NewFileIntroSamusGettingCuredSetupOam
	b _0808D568
	.align 2, 0
_0808D534: .4byte gNonGameplayRam
_0808D538:
	movs r0, #0x82
	lsls r0, r0, #1
	cmp r1, r0
	bls _0808D568
	ldrb r0, [r4, #0x18]
	movs r1, #7
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x18]
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _0808D568
	movs r0, #0
	strb r0, [r4, #0x10]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4, #0x18]
_0808D568:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_8d570
unk_8d570: @ 0x0808D570
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _0808D586
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	movs r0, #1
	strb r0, [r4, #0x14]
_0808D586:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x4f
	bhi _0808D5C4
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D5B0
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, #5
	cmp r1, r0
	bge _0808D5F8
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _0808D5F8
_0808D5B0:
	ldrh r2, [r4, #0xc]
	movs r3, #0xc
	ldrsh r1, [r4, r3]
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r1, r0
	ble _0808D5F8
	subs r0, r2, #1
	strh r0, [r4, #0xc]
	b _0808D5F8
_0808D5C4:
	cmp r1, #0x9f
	bhi _0808D5F8
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808D5E4
	movs r0, #0xe
	ldrsh r1, [r4, r0]
	movs r2, #2
	ldrsh r0, [r4, r2]
	adds r0, #3
	cmp r1, r0
	bge _0808D5F8
	ldrh r0, [r4, #0xe]
	adds r0, #1
	b _0808D5F6
_0808D5E4:
	movs r3, #0xe
	ldrsh r1, [r4, r3]
	movs r2, #2
	ldrsh r0, [r4, r2]
	subs r0, #3
	cmp r1, r0
	ble _0808D5F8
	ldrh r0, [r4, #0xe]
	subs r0, #1
_0808D5F6:
	strh r0, [r4, #0xe]
_0808D5F8:
	ldr r0, _0808D624 @ =gNonGameplayRam
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #5
	bne _0808D658
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x3c
	bne _0808D628
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0xe
	ldrsh r2, [r4, r3]
	movs r0, #0x1b
	bl NewFileIntroSamusGettingCuredSetupOam
	b _0808D658
	.align 2, 0
_0808D624: .4byte gNonGameplayRam
_0808D628:
	movs r0, #0x82
	lsls r0, r0, #1
	cmp r1, r0
	bls _0808D658
	ldrb r0, [r4, #0x18]
	movs r1, #7
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x18]
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _0808D658
	movs r0, #0
	strb r0, [r4, #0x10]
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4, #0x18]
_0808D658:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_8d660
unk_8d660: @ 0x0808D660
	push {r4, r5, lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0xa]
	adds r3, r0, #1
	strh r3, [r2, #0xa]
	ldrb r4, [r2, #0x14]
	cmp r4, #0
	bne _0808D69C
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bls _0808D6E2
	strh r4, [r2, #0xa]
	ldr r3, _0808D694 @ =gNonGameplayRam
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r1, #1
	strb r1, [r0]
	ldr r0, _0808D698 @ =0x00000111
	adds r3, r3, r0
	movs r0, #0
	strb r0, [r3]
	strb r1, [r2, #0x14]
	b _0808D6E2
	.align 2, 0
_0808D694: .4byte gNonGameplayRam
_0808D698: .4byte 0x00000111
_0808D69C:
	cmp r4, #1
	bne _0808D6E2
	ldr r5, _0808D6E8 @ =0x085A9620
	movs r1, #8
	ldrsh r0, [r2, r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrb r1, [r0]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bne _0808D6E2
	movs r0, #0
	strh r0, [r2, #0xa]
	ldrh r1, [r2, #8]
	movs r3, #8
	ldrsh r0, [r2, r3]
	cmp r0, #0x1c
	bgt _0808D6C6
	adds r0, r1, #1
	strh r0, [r2, #8]
_0808D6C6:
	movs r1, #8
	ldrsh r0, [r2, r1]
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsrs r0, r0, #8
	ldr r1, _0808D6EC @ =gNonGameplayRam
	ldr r3, _0808D6F0 @ =0x00000111
	adds r2, r1, r3
	strb r0, [r2]
	movs r2, #0x88
	lsls r2, r2, #1
	adds r0, r1, r2
	strb r4, [r0]
_0808D6E2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808D6E8: .4byte 0x085A9620
_0808D6EC: .4byte gNonGameplayRam
_0808D6F0: .4byte 0x00000111

	thumb_func_start NewFileIntroSamusGettingCuredSetupOam
NewFileIntroSamusGettingCuredSetupOam: @ 0x0808D6F4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	movs r0, #0
	mov sb, r0
	ldr r1, _0808D748 @ =gNonGameplayRam
	movs r2, #0x8b
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	mov r8, r1
	cmp r0, #0
	beq _0808D73C
_0808D71E:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	cmp r0, #0x13
	bhi _0808D742
	lsls r0, r0, #3
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808D71E
_0808D73C:
	mov r1, sb
	cmp r1, #0x13
	bls _0808D74C
_0808D742:
	movs r0, #0x14
	b _0808DDAC
	.align 2, 0
_0808D748: .4byte gNonGameplayRam
_0808D74C:
	movs r0, #0
	str r0, [sp]
	ldr r1, _0808D7B4 @ =0x040000D4
	mov r3, sp
	str r3, [r1]
	mov r0, sb
	lsls r2, r0, #3
	adds r0, r2, r0
	lsls r6, r0, #2
	ldr r3, _0808D7B8 @ =0x030016A0
	mov ip, r3
	adds r0, r6, r3
	str r0, [r1, #4]
	ldr r0, _0808D7BC @ =0x85000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0808D7C0 @ =0xFFFFFDE4
	add r0, ip
	adds r3, r6, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	strh r5, [r0]
	ldr r5, _0808D7C4 @ =0x0000022A
	adds r0, r3, r5
	strh r7, [r0]
	adds r1, #4
	adds r0, r3, r1
	strb r4, [r0]
	adds r5, #0xa
	adds r7, r3, r5
	ldrb r1, [r7]
	movs r0, #1
	orrs r1, r0
	strb r1, [r7]
	adds r5, r2, #0
	cmp r4, #1
	bne _0808D7D0
	ldr r0, _0808D7C8 @ =0x00000236
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808D7CC @ =0x085B0824
	b _0808D910
	.align 2, 0
_0808D7B4: .4byte 0x040000D4
_0808D7B8: .4byte 0x030016A0
_0808D7BC: .4byte 0x85000009
_0808D7C0: .4byte 0xFFFFFDE4
_0808D7C4: .4byte 0x0000022A
_0808D7C8: .4byte 0x00000236
_0808D7CC: .4byte 0x085B0824
_0808D7D0:
	cmp r4, #2
	bne _0808D7F8
	ldr r1, _0808D7F0 @ =0x00000236
	adds r2, r3, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808D7F4 @ =0x085B0A04
	b _0808D910
	.align 2, 0
_0808D7F0: .4byte 0x00000236
_0808D7F4: .4byte 0x085B0A04
_0808D7F8:
	cmp r4, #3
	bne _0808D820
	ldr r5, _0808D818 @ =0x00000236
	adds r2, r3, r5
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808D81C @ =0x085B0AAC
	b _0808D910
	.align 2, 0
_0808D818: .4byte 0x00000236
_0808D81C: .4byte 0x085B0AAC
_0808D820:
	cmp r4, #4
	bne _0808D83C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r7]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808D838 @ =NewFileIntroProcessVaccineBackgroundText
	str r1, [r0]
	b _0808DDAA
	.align 2, 0
_0808D838: .4byte NewFileIntroProcessVaccineBackgroundText
_0808D83C:
	cmp r4, #0xa
	bne _0808D858
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r7]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808D854 @ =unk_8d06c
	str r1, [r0]
	b _0808DDAA
	.align 2, 0
_0808D854: .4byte unk_8d06c
_0808D858:
	cmp r4, #0xb
	bne _0808D880
	ldr r0, _0808D878 @ =0x00000236
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808D87C @ =0x085B9C3C
	b _0808D910
	.align 2, 0
_0808D878: .4byte 0x00000236
_0808D87C: .4byte 0x085B9C3C
_0808D880:
	cmp r4, #0xc
	bne _0808D8A8
	ldr r1, _0808D8A0 @ =0x00000236
	adds r2, r3, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808D8A4 @ =0x085B9C94
	b _0808D910
	.align 2, 0
_0808D8A0: .4byte 0x00000236
_0808D8A4: .4byte 0x085B9C94
_0808D8A8:
	cmp r4, #0xd
	bne _0808D8D0
	ldr r5, _0808D8C8 @ =0x00000236
	adds r2, r3, r5
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808D8CC @ =0x085B9CEC
	b _0808D910
	.align 2, 0
_0808D8C8: .4byte 0x00000236
_0808D8CC: .4byte 0x085B9CEC
_0808D8D0:
	cmp r4, #0xe
	bne _0808D8F8
	ldr r0, _0808D8F0 @ =0x00000236
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808D8F4 @ =0x085B9CFC
	b _0808D910
	.align 2, 0
_0808D8F0: .4byte 0x00000236
_0808D8F4: .4byte 0x085B9CFC
_0808D8F8:
	cmp r4, #0xf
	bne _0808D92C
	ldr r1, _0808D920 @ =0x00000236
	adds r2, r3, r1
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _0808D924 @ =0x085B9D14
_0808D910:
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0808D928 @ =NewFileIntroProcessDna
	str r1, [r0]
	b _0808DDAA
	.align 2, 0
_0808D920: .4byte 0x00000236
_0808D924: .4byte 0x085B9D14
_0808D928: .4byte NewFileIntroProcessDna
_0808D92C:
	cmp r4, #0x10
	bne _0808D988
	mov r0, sb
	adds r3, r5, r0
	lsls r3, r3, #2
	mov r1, r8
	adds r2, r3, r1
	ldr r5, _0808D978 @ =0x00000222
	adds r1, r2, r5
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, #0xf4
	adds r4, r2, r0
	ldrb r0, [r4]
	movs r1, #6
	orrs r0, r1
	strb r0, [r4]
	ldr r1, _0808D97C @ =0x00000236
	adds r2, r2, r1
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r3, r0
	ldr r1, _0808D980 @ =0x085B9D24
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r3, r3, r0
	ldr r0, _0808D984 @ =NewFileIntroProcessXInNervousSystem
	str r0, [r3]
	b _0808DDAA
	.align 2, 0
_0808D978: .4byte 0x00000222
_0808D97C: .4byte 0x00000236
_0808D980: .4byte 0x085B9D24
_0808D984: .4byte NewFileIntroProcessXInNervousSystem
_0808D988:
	cmp r4, #0x11
	bne _0808D9E4
	mov r0, sb
	adds r3, r5, r0
	lsls r3, r3, #2
	mov r1, r8
	adds r2, r3, r1
	ldr r5, _0808D9D4 @ =0x00000222
	adds r1, r2, r5
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r1]
	adds r0, #0xb4
	adds r4, r2, r0
	ldrb r0, [r4]
	movs r1, #6
	orrs r0, r1
	strb r0, [r4]
	ldr r1, _0808D9D8 @ =0x00000236
	adds r2, r2, r1
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r3, r0
	ldr r1, _0808D9DC @ =0x085B9DAC
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r3, r3, r0
	ldr r0, _0808D9E0 @ =unk_8d1c8
	str r0, [r3]
	b _0808DDAA
	.align 2, 0
_0808D9D4: .4byte 0x00000222
_0808D9D8: .4byte 0x00000236
_0808D9DC: .4byte 0x085B9DAC
_0808D9E0: .4byte unk_8d1c8
_0808D9E4:
	cmp r4, #0x12
	bne _0808DA34
	mov r0, sb
	adds r3, r5, r0
	lsls r3, r3, #2
	mov r1, r8
	adds r2, r3, r1
	ldr r5, _0808DA24 @ =0x00000222
	adds r1, r2, r5
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _0808DA28 @ =0x00000236
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r3, r0
	ldr r1, _0808DA2C @ =0x085B9E34
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r3, r3, r0
	ldr r0, _0808DA30 @ =unk_8d2ac
	str r0, [r3]
	b _0808DDAA
	.align 2, 0
_0808DA24: .4byte 0x00000222
_0808DA28: .4byte 0x00000236
_0808DA2C: .4byte 0x085B9E34
_0808DA30: .4byte unk_8d2ac
_0808DA34:
	cmp r4, #0x13
	bne _0808DA90
	mov r1, sb
	adds r3, r5, r1
	lsls r3, r3, #2
	mov r5, r8
	adds r2, r3, r5
	ldr r0, _0808DA80 @ =0x00000222
	adds r1, r2, r0
	subs r0, #0xe2
	strh r0, [r1]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r4, r2, r1
	ldrb r0, [r4]
	movs r1, #6
	orrs r0, r1
	strb r0, [r4]
	ldr r5, _0808DA84 @ =0x00000236
	adds r2, r2, r5
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r3, r0
	ldr r1, _0808DA88 @ =0x085B9EBC
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r3, r3, r0
	ldr r0, _0808DA8C @ =unk_8d39c
	str r0, [r3]
	b _0808DDAA
	.align 2, 0
_0808DA80: .4byte 0x00000222
_0808DA84: .4byte 0x00000236
_0808DA88: .4byte 0x085B9EBC
_0808DA8C: .4byte unk_8d39c
_0808DA90:
	cmp r4, #0x14
	bne _0808DAE0
	mov r0, sb
	adds r3, r5, r0
	lsls r3, r3, #2
	mov r1, r8
	adds r2, r3, r1
	ldr r5, _0808DAD0 @ =0x00000222
	adds r1, r2, r5
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _0808DAD4 @ =0x00000236
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r3, r0
	ldr r1, _0808DAD8 @ =0x085B9F44
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r3, r3, r0
	ldr r0, _0808DADC @ =unk_8d480
	str r0, [r3]
	b _0808DDAA
	.align 2, 0
_0808DAD0: .4byte 0x00000222
_0808DAD4: .4byte 0x00000236
_0808DAD8: .4byte 0x085B9F44
_0808DADC: .4byte unk_8d480
_0808DAE0:
	cmp r4, #0x15
	bne _0808DB30
	mov r1, sb
	adds r3, r5, r1
	lsls r3, r3, #2
	mov r5, r8
	adds r2, r3, r5
	ldr r0, _0808DB20 @ =0x00000222
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r1, _0808DB24 @ =0x00000236
	adds r2, r2, r1
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r3, r0
	ldr r1, _0808DB28 @ =0x085B9FCC
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r3, r3, r0
	ldr r0, _0808DB2C @ =unk_8d570
	str r0, [r3]
	b _0808DDAA
	.align 2, 0
_0808DB20: .4byte 0x00000222
_0808DB24: .4byte 0x00000236
_0808DB28: .4byte 0x085B9FCC
_0808DB2C: .4byte unk_8d570
_0808DB30:
	cmp r4, #0x16
	bne _0808DB8C
	movs r0, #0x10
	bl NewFileIntroFindOamByType
	ldr r4, _0808DB7C @ =gNonGameplayRam
	mov r3, sb
	adds r2, r5, r3
	lsls r2, r2, #2
	adds r3, r2, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x89
	lsls r5, r5, #2
	adds r1, r3, r5
	strh r0, [r1]
	ldr r0, _0808DB80 @ =0x00000236
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r2, r0
	ldr r1, _0808DB84 @ =0x085B7C2C
	str r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r4, r4, r3
	adds r2, r2, r4
	ldr r0, _0808DB88 @ =NewFileIntroProcessXLockOn
	b _0808DDA8
	.align 2, 0
_0808DB7C: .4byte gNonGameplayRam
_0808DB80: .4byte 0x00000236
_0808DB84: .4byte 0x085B7C2C
_0808DB88: .4byte NewFileIntroProcessXLockOn
_0808DB8C:
	cmp r4, #0x17
	bne _0808DBE8
	movs r0, #0x11
	bl NewFileIntroFindOamByType
	ldr r4, _0808DBD8 @ =gNonGameplayRam
	mov r1, sb
	adds r2, r5, r1
	lsls r2, r2, #2
	adds r3, r2, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x89
	lsls r5, r5, #2
	adds r1, r3, r5
	strh r0, [r1]
	ldr r0, _0808DBDC @ =0x00000236
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r2, r0
	ldr r1, _0808DBE0 @ =0x085B8184
	str r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r4, r4, r3
	adds r2, r2, r4
	ldr r0, _0808DBE4 @ =NewFileIntroProcessXLockOn
	b _0808DDA8
	.align 2, 0
_0808DBD8: .4byte gNonGameplayRam
_0808DBDC: .4byte 0x00000236
_0808DBE0: .4byte 0x085B8184
_0808DBE4: .4byte NewFileIntroProcessXLockOn
_0808DBE8:
	cmp r4, #0x18
	bne _0808DC44
	movs r0, #0x12
	bl NewFileIntroFindOamByType
	ldr r4, _0808DC34 @ =gNonGameplayRam
	mov r1, sb
	adds r2, r5, r1
	lsls r2, r2, #2
	adds r3, r2, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x89
	lsls r5, r5, #2
	adds r1, r3, r5
	strh r0, [r1]
	ldr r0, _0808DC38 @ =0x00000236
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r2, r0
	ldr r1, _0808DC3C @ =0x085B86DC
	str r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r4, r4, r3
	adds r2, r2, r4
	ldr r0, _0808DC40 @ =NewFileIntroProcessXLockOn
	b _0808DDA8
	.align 2, 0
_0808DC34: .4byte gNonGameplayRam
_0808DC38: .4byte 0x00000236
_0808DC3C: .4byte 0x085B86DC
_0808DC40: .4byte NewFileIntroProcessXLockOn
_0808DC44:
	cmp r4, #0x19
	bne _0808DCA0
	movs r0, #0x13
	bl NewFileIntroFindOamByType
	ldr r4, _0808DC90 @ =gNonGameplayRam
	mov r1, sb
	adds r2, r5, r1
	lsls r2, r2, #2
	adds r3, r2, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x89
	lsls r5, r5, #2
	adds r1, r3, r5
	strh r0, [r1]
	ldr r0, _0808DC94 @ =0x00000236
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r2, r0
	ldr r1, _0808DC98 @ =0x085B8C34
	str r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r4, r4, r3
	adds r2, r2, r4
	ldr r0, _0808DC9C @ =NewFileIntroProcessXLockOn
	b _0808DDA8
	.align 2, 0
_0808DC90: .4byte gNonGameplayRam
_0808DC94: .4byte 0x00000236
_0808DC98: .4byte 0x085B8C34
_0808DC9C: .4byte NewFileIntroProcessXLockOn
_0808DCA0:
	cmp r4, #0x1a
	bne _0808DCFC
	movs r0, #0x14
	bl NewFileIntroFindOamByType
	ldr r4, _0808DCEC @ =gNonGameplayRam
	mov r1, sb
	adds r2, r5, r1
	lsls r2, r2, #2
	adds r3, r2, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x89
	lsls r5, r5, #2
	adds r1, r3, r5
	strh r0, [r1]
	ldr r0, _0808DCF0 @ =0x00000236
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r2, r0
	ldr r1, _0808DCF4 @ =0x085B918C
	str r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r4, r4, r3
	adds r2, r2, r4
	ldr r0, _0808DCF8 @ =NewFileIntroProcessXLockOn
	b _0808DDA8
	.align 2, 0
_0808DCEC: .4byte gNonGameplayRam
_0808DCF0: .4byte 0x00000236
_0808DCF4: .4byte 0x085B918C
_0808DCF8: .4byte NewFileIntroProcessXLockOn
_0808DCFC:
	cmp r4, #0x1b
	bne _0808DD58
	movs r0, #0x15
	bl NewFileIntroFindOamByType
	ldr r4, _0808DD48 @ =gNonGameplayRam
	mov r1, sb
	adds r2, r5, r1
	lsls r2, r2, #2
	adds r3, r2, r4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x89
	lsls r5, r5, #2
	adds r1, r3, r5
	strh r0, [r1]
	ldr r0, _0808DD4C @ =0x00000236
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r2, r0
	ldr r1, _0808DD50 @ =0x085B96E4
	str r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r4, r4, r3
	adds r2, r2, r4
	ldr r0, _0808DD54 @ =NewFileIntroProcessXLockOn
	b _0808DDA8
	.align 2, 0
_0808DD48: .4byte gNonGameplayRam
_0808DD4C: .4byte 0x00000236
_0808DD50: .4byte 0x085B96E4
_0808DD54: .4byte NewFileIntroProcessXLockOn
_0808DD58:
	cmp r4, #0x1c
	bne _0808DD88
	mov r0, sb
	adds r2, r5, r0
	lsls r2, r2, #2
	mov r3, r8
	adds r1, r2, r3
	movs r5, #0x8d
	lsls r5, r5, #2
	adds r1, r1, r5
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r2, r2, r0
	ldr r0, _0808DD84 @ =unk_8d660
	b _0808DDA8
	.align 2, 0
_0808DD84: .4byte unk_8d660
_0808DD88:
	cmp r4, #0xc8
	bne _0808DDAA
	mov r0, sb
	adds r2, r5, r0
	lsls r2, r2, #2
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _0808DDBC @ =0x08613180
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r2, r2, r0
	ldr r0, _0808DDC0 @ =NewFileIntroProcessTextCursor
_0808DDA8:
	str r0, [r2]
_0808DDAA:
	mov r0, sb
_0808DDAC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808DDBC: .4byte 0x08613180
_0808DDC0: .4byte NewFileIntroProcessTextCursor

	thumb_func_start unk_8ddc4
unk_8ddc4: @ 0x0808DDC4
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl NewFileIntroSamusGettingCuredSetupOam
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0808DDF8 @ =gNonGameplayRam
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r1, r0
	strh r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DDF8: .4byte gNonGameplayRam

	thumb_func_start NewFileIntroFindOamByType
NewFileIntroFindOamByType: @ 0x0808DDFC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	movs r1, #0
	ldr r4, _0808DE20 @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
_0808DE0A:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, r2
	bne _0808DE24
	adds r0, r1, #0
	b _0808DE30
	.align 2, 0
_0808DE20: .4byte gNonGameplayRam
_0808DE24:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bls _0808DE0A
	movs r0, #0x14
_0808DE30:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroSamusGettingCuredVblank
NewFileIntroSamusGettingCuredVblank: @ 0x0808DE38
	ldr r1, _0808DE64 @ =0x040000D4
	ldr r0, _0808DE68 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0808DE6C @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0808DE70 @ =0x04000052
	ldr r0, _0808DE74 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0808DE78 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808DE7C @ =0x04000054
	ldr r0, _0808DE80 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0808DE64: .4byte 0x040000D4
_0808DE68: .4byte gOamData
_0808DE6C: .4byte 0x84000100
_0808DE70: .4byte 0x04000052
_0808DE74: .4byte gWrittenToBldalpha_L
_0808DE78: .4byte gWrittenToBldalpha_R
_0808DE7C: .4byte 0x04000054
_0808DE80: .4byte gWrittenToBldy

	thumb_func_start NewFileIntroSamusGettingCuredNervousSystemVblank
NewFileIntroSamusGettingCuredNervousSystemVblank: @ 0x0808DE84
	push {r4, lr}
	ldr r3, _0808DEF8 @ =0x040000D4
	ldr r0, _0808DEFC @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _0808DF00 @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _0808DF04 @ =0x04000052
	ldr r0, _0808DF08 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0808DF0C @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808DF10 @ =0x04000054
	ldr r0, _0808DF14 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0808DF18 @ =gNonGameplayRam
	movs r0, #0x88
	lsls r0, r0, #1
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #1
	bne _0808DEF0
	movs r0, #0
	strb r0, [r2]
	ldr r2, _0808DF1C @ =0x0879C2E4
	ldr r4, _0808DF20 @ =0x00000111
	adds r4, r4, r1
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0808DF24 @ =0x05000200
	str r0, [r3, #4]
	ldr r1, _0808DF28 @ =0x84000020
	str r1, [r3, #8]
	ldr r0, [r3, #8]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r3]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	str r1, [r3, #8]
	ldr r0, [r3, #8]
_0808DEF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DEF8: .4byte 0x040000D4
_0808DEFC: .4byte gOamData
_0808DF00: .4byte 0x84000100
_0808DF04: .4byte 0x04000052
_0808DF08: .4byte gWrittenToBldalpha_L
_0808DF0C: .4byte gWrittenToBldalpha_R
_0808DF10: .4byte 0x04000054
_0808DF14: .4byte gWrittenToBldy
_0808DF18: .4byte gNonGameplayRam
_0808DF1C: .4byte 0x0879C2E4
_0808DF20: .4byte 0x00000111
_0808DF24: .4byte 0x05000200
_0808DF28: .4byte 0x84000020

	thumb_func_start NewFileIntroProcessDna
NewFileIntroProcessDna: @ 0x0808DF2C
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroSamusFoundInit
NewFileIntroSamusFoundInit: @ 0x0808DF30
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r3, _0808E080 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0808E084 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0808E088 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0808E08C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0808E090 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0808E094 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _0808E098 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r6, _0808E09C @ =gNonGameplayRam
	str r6, [r4, #4]
	ldr r0, _0808E0A0 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808E0A4 @ =0x08613148
	str r0, [r4]
	ldr r0, _0808E0A8 @ =0x06017FE0
	str r0, [r4, #4]
	ldr r1, _0808E0AC @ =0x84000008
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808E0B0 @ =0x086131A8
	str r0, [r4]
	ldr r0, _0808E0B4 @ =0x050003E0
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808E0B8 @ =0x085C4050
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0808E0BC @ =0x085BFE38
	ldr r1, _0808E0C0 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _0808E0C4 @ =0x085C9520
	ldr r1, _0808E0C8 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0808E0CC @ =0x085C8F1C
	ldr r1, _0808E0D0 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0808E0D4 @ =0x08598898
	ldr r1, _0808E0D8 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0808E0DC @ =0x085C8D1C
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _0808E0E0 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808E0E4 @ =0x085C9B4C
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompWram
	ldr r0, _0808E0E8 @ =0x085D1154
	ldr r1, _0808E0EC @ =0x02008000
	bl LZ77UncompWram
	ldr r0, _0808E0F0 @ =0x085D08B8
	ldr r1, _0808E0F4 @ =0x0200D000
	bl LZ77UncompWram
	ldr r0, _0808E0F8 @ =0x085D4868
	ldr r1, _0808E0FC @ =0x0200D800
	bl LZ77UncompWram
	ldr r1, _0808E100 @ =0x04000010
	ldr r2, _0808E104 @ =0x0000FFF8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0808E108 @ =0x04000012
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
	ldr r0, _0808E10C @ =0x0300122C
	strh r5, [r0]
	ldr r0, _0808E110 @ =0x0300122E
	strh r5, [r0]
	ldr r0, _0808E114 @ =0x03001230
	strh r5, [r0]
	ldr r0, _0808E118 @ =0x03001232
	strh r5, [r0]
	subs r1, #8
	ldr r2, _0808E11C @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _0808E120 @ =0x00001E02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0808E124 @ =0x00001F0B
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xbf
	strh r0, [r1]
	ldr r0, _0808E128 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0808E12C @ =0x04000054
	strh r1, [r0]
	movs r1, #0x82
	lsls r1, r1, #1
	movs r0, #0xc8
	movs r2, #0
	bl NewFileIntroSamusFoundSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _0808E130 @ =0x0863A19C
	str r0, [r6]
	str r5, [sp]
	mov r0, sp
	str r0, [r4]
	ldr r0, _0808E134 @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _0808E138 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xa8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0808E13C @ =NewFileIntroSamusFoundVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E080: .4byte 0x04000208
_0808E084: .4byte 0x04000004
_0808E088: .4byte 0x0000FFEF
_0808E08C: .4byte 0x04000200
_0808E090: .4byte 0x0000FFFD
_0808E094: .4byte unk_99940
_0808E098: .4byte 0x040000D4
_0808E09C: .4byte gNonGameplayRam
_0808E0A0: .4byte 0x85000150
_0808E0A4: .4byte 0x08613148
_0808E0A8: .4byte 0x06017FE0
_0808E0AC: .4byte 0x84000008
_0808E0B0: .4byte 0x086131A8
_0808E0B4: .4byte 0x050003E0
_0808E0B8: .4byte 0x085C4050
_0808E0BC: .4byte 0x085BFE38
_0808E0C0: .4byte 0x06008000
_0808E0C4: .4byte 0x085C9520
_0808E0C8: .4byte 0x0600F000
_0808E0CC: .4byte 0x085C8F1C
_0808E0D0: .4byte 0x0600F800
_0808E0D4: .4byte 0x08598898
_0808E0D8: .4byte 0x0600E000
_0808E0DC: .4byte 0x085C8D1C
_0808E0E0: .4byte 0x84000080
_0808E0E4: .4byte 0x085C9B4C
_0808E0E8: .4byte 0x085D1154
_0808E0EC: .4byte 0x02008000
_0808E0F0: .4byte 0x085D08B8
_0808E0F4: .4byte 0x0200D000
_0808E0F8: .4byte 0x085D4868
_0808E0FC: .4byte 0x0200D800
_0808E100: .4byte 0x04000010
_0808E104: .4byte 0x0000FFF8
_0808E108: .4byte 0x04000012
_0808E10C: .4byte 0x0300122C
_0808E110: .4byte 0x0300122E
_0808E114: .4byte 0x03001230
_0808E118: .4byte 0x03001232
_0808E11C: .4byte 0x00001C08
_0808E120: .4byte 0x00001E02
_0808E124: .4byte 0x00001F0B
_0808E128: .4byte gWrittenToBldy
_0808E12C: .4byte 0x04000054
_0808E130: .4byte 0x0863A19C
_0808E134: .4byte 0x0600D000
_0808E138: .4byte 0x85000400
_0808E13C: .4byte NewFileIntroSamusFoundVblank

	thumb_func_start NewFileIntroSamusFoundProcess
NewFileIntroSamusFoundProcess: @ 0x0808E140
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	ldr r2, _0808E198 @ =gNonGameplayRam
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	adds r5, r2, #0
	cmp r1, r0
	bne _0808E172
	ldr r0, _0808E19C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808E172
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808E172
	movs r0, #1
	strb r0, [r1]
_0808E172:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r5, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r5, r2
	ldrb r0, [r0]
	cmp r0, #0xe
	bls _0808E18C
	b _0808E6BA
_0808E18C:
	lsls r0, r0, #2
	ldr r1, _0808E1A0 @ =_0808E1A4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808E198: .4byte gNonGameplayRam
_0808E19C: .4byte gChangedInput
_0808E1A0: .4byte _0808E1A4
_0808E1A4: @ jump table
	.4byte _0808E1E0 @ case 0
	.4byte _0808E228 @ case 1
	.4byte _0808E278 @ case 2
	.4byte _0808E2C4 @ case 3
	.4byte _0808E348 @ case 4
	.4byte _0808E3A8 @ case 5
	.4byte _0808E3DC @ case 6
	.4byte _0808E424 @ case 7
	.4byte _0808E456 @ case 8
	.4byte _0808E4BC @ case 9
	.4byte _0808E4FC @ case 10
	.4byte _0808E57C @ case 11
	.4byte _0808E5B8 @ case 12
	.4byte _0808E61C @ case 13
	.4byte _0808E680 @ case 14
_0808E1E0:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r3, r5, r4
	ldrh r0, [r3]
	cmp r0, #0x28
	beq _0808E1EE
	b _0808E670
_0808E1EE:
	movs r2, #0
	movs r1, #0
	strh r1, [r3]
	ldr r3, _0808E21C @ =0x00000212
	adds r0, r5, r3
	strb r2, [r0]
	strh r1, [r5, #0xe]
	strh r1, [r5, #0xc]
	ldr r1, _0808E220 @ =0x0879C5A4
	ldr r0, _0808E224 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	str r0, [r5]
	adds r4, #4
	adds r1, r5, r4
	movs r0, #1
	b _0808E66E
	.align 2, 0
_0808E21C: .4byte 0x00000212
_0808E220: .4byte 0x0879C5A4
_0808E224: .4byte 0x03000011
_0808E228:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r3, #0
	movs r2, #0
	strh r2, [r0]
	ldr r1, _0808E250 @ =gWrittenToBldalpha_R
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0808E254 @ =gWrittenToBldalpha_L
	strh r2, [r0]
	movs r2, #0x86
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808E258
	strb r3, [r1]
	b _0808E670
	.align 2, 0
_0808E250: .4byte gWrittenToBldalpha_R
_0808E254: .4byte gWrittenToBldalpha_L
_0808E258:
	cmp r0, #3
	bne _0808E266
	strb r3, [r1]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r5, r3
	b _0808E274
_0808E266:
	cmp r0, #4
	beq _0808E26C
	b _0808E670
_0808E26C:
	strb r3, [r1]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r5, r4
_0808E274:
	movs r0, #2
	b _0808E66E
_0808E278:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r3, r5, r0
	ldrh r0, [r3]
	cmp r0, #0x1d
	bne _0808E2A0
	ldr r1, _0808E298 @ =0x04000050
	ldr r2, _0808E29C @ =0x00001844
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #1
	movs r1, #0x10
_0808E290:
	movs r2, #0
	bl NewFileIntroSamusFoundSetupOam
	b _0808E670
	.align 2, 0
_0808E298: .4byte 0x04000050
_0808E29C: .4byte 0x00001844
_0808E2A0:
	cmp r0, #0x1e
	beq _0808E2A6
	b _0808E670
_0808E2A6:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r3]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #3
	b _0808E66E
_0808E2C4:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrh r0, [r1]
	cmp r0, #0x59
	bne _0808E2FC
	movs r0, #1
	bl SpecialCutsceneDestroyOamOfType
	ldr r1, _0808E2F0 @ =gWrittenToBldalpha_R
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808E2F4 @ =gWrittenToBldalpha_L
	movs r0, #0x10
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808E2F8 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	b _0808E670
	.align 2, 0
_0808E2F0: .4byte gWrittenToBldalpha_R
_0808E2F4: .4byte gWrittenToBldalpha_L
_0808E2F8: .4byte 0x0000FBFF
_0808E2FC:
	cmp r0, #0x5a
	bne _0808E324
	ldr r1, _0808E314 @ =0x040000D4
	ldr r0, _0808E318 @ =0x0200D000
	str r0, [r1]
	ldr r0, _0808E31C @ =0x0600F000
_0808E308:
	str r0, [r1, #4]
	ldr r0, _0808E320 @ =0x84000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0808E670
	.align 2, 0
_0808E314: .4byte 0x040000D4
_0808E318: .4byte 0x0200D000
_0808E31C: .4byte 0x0600F000
_0808E320: .4byte 0x84000200
_0808E324:
	cmp r0, #0x5b
	bne _0808E32E
	movs r0, #2
	movs r1, #0
	b _0808E290
_0808E32E:
	cmp r0, #0x63
	bne _0808E334
	b _0808E670
_0808E334:
	cmp r0, #0x64
	beq _0808E33A
	b _0808E670
_0808E33A:
	movs r0, #0
	strh r0, [r1]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r5, r3
	movs r0, #4
	b _0808E66E
_0808E348:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r0, r5, r4
	movs r6, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0808E374 @ =gWrittenToBldalpha_R
	strh r1, [r0]
	ldr r1, _0808E378 @ =gWrittenToBldalpha_L
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r4, r5, r0
	ldrb r0, [r4]
	cmp r0, #2
	beq _0808E36E
	cmp r0, #4
	bne _0808E37C
_0808E36E:
	strb r6, [r4]
	b _0808E670
	.align 2, 0
_0808E374: .4byte gWrittenToBldalpha_R
_0808E378: .4byte gWrittenToBldalpha_L
_0808E37C:
	cmp r0, #3
	beq _0808E382
	b _0808E670
_0808E382:
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusFoundSetupOam
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	strb r6, [r4]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r5, r4
	movs r0, #5
	b _0808E66E
_0808E3A8:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0x5a
	beq _0808E3B6
	b _0808E670
_0808E3B6:
	movs r4, #0
	strh r4, [r1]
	movs r0, #3
	bl SpecialCutsceneDestroyOamOfType
	ldr r1, _0808E3D4 @ =gWrittenToBldalpha_R
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0808E3D8 @ =gWrittenToBldalpha_L
	strh r4, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #6
	b _0808E66E
	.align 2, 0
_0808E3D4: .4byte gWrittenToBldalpha_R
_0808E3D8: .4byte gWrittenToBldalpha_L
_0808E3DC:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r3, r5, r4
	ldrh r0, [r3]
	cmp r0, #0x14
	beq _0808E3EA
	b _0808E670
_0808E3EA:
	movs r2, #0
	movs r1, #0
	strh r1, [r3]
	ldr r3, _0808E418 @ =0x00000212
	adds r0, r5, r3
	strb r2, [r0]
	strh r1, [r5, #0xe]
	strh r1, [r5, #0xc]
	ldr r1, _0808E41C @ =0x0879C5A4
	ldr r0, _0808E420 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x34]
	str r0, [r5]
	adds r4, #4
	adds r1, r5, r4
	movs r0, #7
	b _0808E66E
	.align 2, 0
_0808E418: .4byte 0x00000212
_0808E41C: .4byte 0x0879C5A4
_0808E420: .4byte 0x03000011
_0808E424:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	movs r3, #0x86
	lsls r3, r3, #2
	adds r1, r5, r3
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808E440
	cmp r0, #4
	bne _0808E444
_0808E440:
	strb r2, [r1]
	b _0808E670
_0808E444:
	cmp r0, #3
	beq _0808E44A
	b _0808E670
_0808E44A:
	strb r2, [r1]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r5, r4
	movs r0, #8
	b _0808E66E
_0808E456:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0xa
	beq _0808E464
	b _0808E670
_0808E464:
	movs r3, #0
	movs r2, #0
	strh r2, [r1]
	str r2, [sp]
	ldr r1, _0808E4A4 @ =0x040000D4
	mov r4, sp
	str r4, [r1]
	ldr r0, _0808E4A8 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _0808E4AC @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808E4B0 @ =0x00000212
	adds r0, r5, r1
	strb r3, [r0]
	strh r2, [r5, #0xe]
	strh r2, [r5, #0xc]
	ldr r1, _0808E4B4 @ =0x0879C5A4
	ldr r0, _0808E4B8 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	str r0, [r5]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #9
	b _0808E66E
	.align 2, 0
_0808E4A4: .4byte 0x040000D4
_0808E4A8: .4byte 0x0600D000
_0808E4AC: .4byte 0x85000400
_0808E4B0: .4byte 0x00000212
_0808E4B4: .4byte 0x0879C5A4
_0808E4B8: .4byte 0x03000011
_0808E4BC:
	movs r3, #0x84
	lsls r3, r3, #2
	adds r0, r5, r3
	movs r2, #0
	movs r3, #0
	strh r3, [r0]
	movs r4, #0x86
	lsls r4, r4, #2
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808E440
	cmp r0, #4
	beq _0808E440
	cmp r0, #3
	beq _0808E4DE
	b _0808E670
_0808E4DE:
	strb r2, [r1]
	ldr r1, _0808E4F4 @ =gWrittenToBldalpha_R
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0808E4F8 @ =gWrittenToBldalpha_L
	strh r3, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0xa
	b _0808E66E
	.align 2, 0
_0808E4F4: .4byte gWrittenToBldalpha_R
_0808E4F8: .4byte gWrittenToBldalpha_L
_0808E4FC:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r3, r5, r1
	ldrh r0, [r3]
	cmp r0, #1
	bne _0808E530
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808E520 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0808E524 @ =0x040000D4
	ldr r0, _0808E528 @ =0x0200D800
	str r0, [r1]
	ldr r0, _0808E52C @ =0x0600F800
	b _0808E308
	.align 2, 0
_0808E520: .4byte 0x0000F7FF
_0808E524: .4byte 0x040000D4
_0808E528: .4byte 0x0200D800
_0808E52C: .4byte 0x0600F800
_0808E530:
	cmp r0, #2
	bne _0808E53A
	movs r0, #4
	movs r1, #0
	b _0808E290
_0808E53A:
	cmp r0, #0xf
	beq _0808E540
	b _0808E670
_0808E540:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r3]
	movs r0, #5
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusFoundSetupOam
	ldr r0, _0808E578 @ =0x0300122E
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r0, #6
	movs r1, #0
	bl NewFileIntroSamusFoundSetupOam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0xb
	b _0808E66E
	.align 2, 0
_0808E578: .4byte 0x0300122E
_0808E57C:
	movs r3, #0x84
	lsls r3, r3, #2
	adds r2, r5, r3
	ldrh r0, [r2]
	cmp r0, #0x5a
	bne _0808E670
	ldr r1, _0808E5B0 @ =gWrittenToBldalpha_R
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808E5B4 @ =gWrittenToBldalpha_L
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0
	strh r0, [r2]
	movs r0, #5
	bl SpecialCutsceneDestroyOamOfType
	movs r0, #6
	bl SpecialCutsceneDestroyOamOfType
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r5, r4
	movs r0, #0xc
	b _0808E66E
	.align 2, 0
_0808E5B0: .4byte gWrittenToBldalpha_R
_0808E5B4: .4byte gWrittenToBldalpha_L
_0808E5B8:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #0xa
	bne _0808E670
	movs r3, #0
	movs r2, #0
	strh r2, [r1]
	str r2, [sp]
	ldr r1, _0808E604 @ =0x040000D4
	mov r4, sp
	str r4, [r1]
	ldr r0, _0808E608 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _0808E60C @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808E610 @ =0x00000212
	adds r0, r5, r1
	strb r3, [r0]
	strh r2, [r5, #0xe]
	strh r2, [r5, #0xc]
	ldr r1, _0808E614 @ =0x0879C5A4
	ldr r0, _0808E618 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x3c]
	str r0, [r5]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0xd
	b _0808E66E
	.align 2, 0
_0808E604: .4byte 0x040000D4
_0808E608: .4byte 0x0600D000
_0808E60C: .4byte 0x85000400
_0808E610: .4byte 0x00000212
_0808E614: .4byte 0x0879C5A4
_0808E618: .4byte 0x03000011
_0808E61C:
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r5, r3
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	movs r4, #0x86
	lsls r4, r4, #2
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808E63C
	strb r2, [r1]
	ldr r0, [r5]
	str r0, [r5, #4]
	b _0808E670
_0808E63C:
	cmp r0, #3
	bne _0808E658
	strb r2, [r1]
	ldr r0, [r5]
	str r0, [r5, #4]
	ldr r0, _0808E654 @ =0x0863A19C
	str r0, [r5]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r5, r0
	b _0808E66C
	.align 2, 0
_0808E654: .4byte 0x0863A19C
_0808E658:
	cmp r0, #4
	bne _0808E670
	strb r2, [r1]
	ldr r0, [r5]
	str r0, [r5, #4]
	ldr r0, _0808E67C @ =0x0863A19C
	str r0, [r5]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
_0808E66C:
	movs r0, #0xe
_0808E66E:
	strb r0, [r1]
_0808E670:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _0808E6BA
	.align 2, 0
_0808E67C: .4byte 0x0863A19C
_0808E680:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r3, r5, r4
	ldrh r0, [r3]
	cmp r0, #0x1e
	bne _0808E6B2
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808E6C8 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0808E6CC @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _0808E6D0 @ =gWrittenToBldy
	movs r1, #0
	strh r1, [r0]
	movs r0, #0
	strh r0, [r3]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r5, r2
	strb r1, [r0]
	movs r7, #1
_0808E6B2:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808E6BA:
	bl IntroProcessText
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808E6C8: .4byte 0x0000FBFF
_0808E6CC: .4byte 0x04000050
_0808E6D0: .4byte gWrittenToBldy

	thumb_func_start NewFileIntroSamusFound
NewFileIntroSamusFound: @ 0x0808E6D4
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0808E6EC @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _0808E704
	cmp r0, #1
	bgt _0808E6F0
	cmp r0, #0
	beq _0808E6FA
	b _0808E774
	.align 2, 0
_0808E6EC: .4byte gNonGameplayRam
_0808E6F0:
	cmp r0, #2
	beq _0808E73A
	cmp r0, #3
	beq _0808E756
	b _0808E774
_0808E6FA:
	bl NewFileIntroSamusFoundInit
	movs r0, #1
	strh r0, [r4, #8]
	b _0808E774
_0808E704:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _0808E730
	strh r5, [r1]
	ldr r1, _0808E728 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808E72C
	subs r0, #1
	strh r0, [r1]
	b _0808E730
	.align 2, 0
_0808E728: .4byte gWrittenToBldy
_0808E72C:
	movs r0, #2
	strh r0, [r4, #8]
_0808E730:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _0808E774
_0808E73A:
	bl NewFileIntroSamusFoundProcess
	cmp r0, #0
	beq _0808E774
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #3
	strh r0, [r4, #8]
	b _0808E774
_0808E756:
	ldr r1, _0808E764 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808E768
	adds r0, #1
	strh r0, [r1]
	b _0808E76C
	.align 2, 0
_0808E764: .4byte gWrittenToBldy
_0808E768:
	strh r5, [r4, #8]
	movs r5, #1
_0808E76C:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808E774:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NewFileIntroProcessSamusFoundFadeIn
NewFileIntroProcessSamusFoundFadeIn: @ 0x0808E77C
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808E7A0
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r1, [r2, #0xc]
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0808E7A0
	subs r0, r1, #1
	strh r0, [r2, #0xc]
_0808E7A0:
	ldr r1, _0808E7D8 @ =0x03001230
	ldrh r0, [r2, #0xc]
	strh r0, [r1]
	ldr r1, _0808E7DC @ =0x03001232
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bne _0808E7D2
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r1, _0808E7E0 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808E7D2
	subs r0, #1
	strh r0, [r1]
	ldr r1, _0808E7E4 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0808E7D2:
	pop {r0}
	bx r0
	.align 2, 0
_0808E7D8: .4byte 0x03001230
_0808E7DC: .4byte 0x03001232
_0808E7E0: .4byte gWrittenToBldalpha_R
_0808E7E4: .4byte gWrittenToBldalpha_L

	thumb_func_start NewFileIntroProcessSamusLayingLoading
NewFileIntroProcessSamusLayingLoading: @ 0x0808E7E8
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0xa]
	lsls r0, r0, #0xc
	ldr r2, _0808E828 @ =0x040000D4
	movs r4, #0x80
	lsls r4, r4, #0x12
	adds r1, r0, r4
	str r1, [r2]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _0808E82C @ =0x84000400
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	ldrh r2, [r3, #0xa]
	movs r4, #8
	ldrsh r0, [r3, r4]
	movs r4, #4
	ldrsh r1, [r3, r4]
	adds r0, r0, r1
	cmp r2, r0
	bne _0808E822
	movs r0, #0
	strb r0, [r3, #0x10]
_0808E822:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808E828: .4byte 0x040000D4
_0808E82C: .4byte 0x84000400

	thumb_func_start NewFileIntroProcessSamusFoundFadeInSamusLaying
NewFileIntroProcessSamusFoundFadeInSamusLaying: @ 0x0808E830
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808E854
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r1, [r2, #0xe]
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	cmp r0, #0x5f
	bgt _0808E854
	adds r0, r1, #1
	strh r0, [r2, #0xe]
_0808E854:
	ldr r1, _0808E88C @ =0x0300122C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808E890 @ =0x0300122E
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bne _0808E886
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r1, _0808E894 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808E886
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0808E898 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0808E886:
	pop {r0}
	bx r0
	.align 2, 0
_0808E88C: .4byte 0x0300122C
_0808E890: .4byte 0x0300122E
_0808E894: .4byte gWrittenToBldalpha_R
_0808E898: .4byte gWrittenToBldalpha_L

	thumb_func_start NewFileIntroProcessSamusFoundFadeInVaccineCloseUp
NewFileIntroProcessSamusFoundFadeInVaccineCloseUp: @ 0x0808E89C
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _0808E8C0
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r1, [r2, #0xc]
	movs r3, #0xc
	ldrsh r0, [r2, r3]
	cmp r0, #0xf
	bgt _0808E8C0
	adds r0, r1, #1
	strh r0, [r2, #0xc]
_0808E8C0:
	ldr r1, _0808E8F8 @ =0x03001230
	ldrh r0, [r2, #0xc]
	strh r0, [r1]
	ldr r1, _0808E8FC @ =0x03001232
	movs r0, #0
	strh r0, [r1]
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bne _0808E8F2
	movs r0, #0
	strh r0, [r2, #0xa]
	ldr r1, _0808E900 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808E8F2
	subs r0, #1
	strh r0, [r1]
	ldr r1, _0808E904 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0808E8F2:
	pop {r0}
	bx r0
	.align 2, 0
_0808E8F8: .4byte 0x03001230
_0808E8FC: .4byte 0x03001232
_0808E900: .4byte gWrittenToBldalpha_R
_0808E904: .4byte gWrittenToBldalpha_L

	thumb_func_start unk_8e908
unk_8e908: @ 0x0808E908
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0808E92C
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r1, [r2, #0xe]
	movs r3, #0xe
	ldrsh r0, [r2, r3]
	cmp r0, #0x5f
	bgt _0808E92C
	adds r0, r1, #1
	strh r0, [r2, #0xe]
_0808E92C:
	ldr r1, _0808E93C @ =0x0300122C
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808E940 @ =0x0300122E
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0808E93C: .4byte 0x0300122C
_0808E940: .4byte 0x0300122E

	thumb_func_start NewFileIntroSamusFoundSetupOam
NewFileIntroSamusFoundSetupOam: @ 0x0808E944
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r7, #0
	ldr r1, _0808E990 @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808E988
	adds r5, r1, #0
	adds r1, r3, #0
_0808E96E:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	cmp r7, #0x13
	bhi _0808E98C
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, r0, r5
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808E96E
_0808E988:
	cmp r7, #0x13
	bls _0808E994
_0808E98C:
	movs r0, #0x14
	b _0808EAEA
	.align 2, 0
_0808E990: .4byte gNonGameplayRam
_0808E994:
	movs r0, #0
	mov ip, r0
	str r0, [sp]
	ldr r1, _0808E9F4 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	lsls r0, r7, #3
	adds r0, r0, r7
	lsls r5, r0, #2
	ldr r6, _0808E9F8 @ =0x030016A0
	adds r0, r5, r6
	str r0, [r1, #4]
	ldr r0, _0808E9FC @ =0x85000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808EA00 @ =0xFFFFFDE4
	adds r0, r6, r1
	adds r3, r5, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	mov r1, r8
	strh r1, [r0]
	ldr r1, _0808EA04 @ =0x0000022A
	adds r0, r3, r1
	strh r2, [r0]
	adds r1, #2
	adds r0, r3, r1
	strb r4, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #1
	orrs r1, r0
	strb r1, [r2]
	cmp r4, #1
	bne _0808EA0C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808EA08 @ =NewFileIntroProcessSamusFoundFadeIn
	b _0808EAE6
	.align 2, 0
_0808E9F4: .4byte 0x040000D4
_0808E9F8: .4byte 0x030016A0
_0808E9FC: .4byte 0x85000009
_0808EA00: .4byte 0xFFFFFDE4
_0808EA04: .4byte 0x0000022A
_0808EA08: .4byte NewFileIntroProcessSamusFoundFadeIn
_0808EA0C:
	cmp r4, #2
	bne _0808EA44
	ldr r1, _0808EA3C @ =0x00000226
	adds r0, r3, r1
	mov r4, ip
	strh r4, [r0]
	subs r1, #2
	adds r0, r3, r1
	strh r4, [r0]
	movs r4, #0x88
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #8
	strh r0, [r1]
	ldrb r1, [r2]
	subs r0, #0xa
	ands r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808EA40 @ =NewFileIntroProcessSamusLayingLoading
	b _0808EAE6
	.align 2, 0
_0808EA3C: .4byte 0x00000226
_0808EA40: .4byte NewFileIntroProcessSamusLayingLoading
_0808EA44:
	cmp r4, #3
	bne _0808EA60
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808EA5C @ =NewFileIntroProcessSamusFoundFadeInSamusLaying
	b _0808EAE6
	.align 2, 0
_0808EA5C: .4byte NewFileIntroProcessSamusFoundFadeInSamusLaying
_0808EA60:
	cmp r4, #4
	bne _0808EA98
	ldr r1, _0808EA90 @ =0x00000226
	adds r0, r3, r1
	movs r1, #8
	strh r1, [r0]
	movs r4, #0x89
	lsls r4, r4, #2
	adds r0, r3, r4
	strh r1, [r0]
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #5
	strh r0, [r1]
	ldrb r1, [r2]
	subs r0, #7
	ands r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808EA94 @ =NewFileIntroProcessSamusLayingLoading
	b _0808EAE6
	.align 2, 0
_0808EA90: .4byte 0x00000226
_0808EA94: .4byte NewFileIntroProcessSamusLayingLoading
_0808EA98:
	cmp r4, #5
	bne _0808EAB4
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808EAB0 @ =NewFileIntroProcessSamusFoundFadeInVaccineCloseUp
	b _0808EAE6
	.align 2, 0
_0808EAB0: .4byte NewFileIntroProcessSamusFoundFadeInVaccineCloseUp
_0808EAB4:
	cmp r4, #6
	bne _0808EAD0
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808EACC @ =unk_8e908
	b _0808EAE6
	.align 2, 0
_0808EACC: .4byte unk_8e908
_0808EAD0:
	cmp r4, #0xc8
	bne _0808EAE8
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808EAF8 @ =0x08613180
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808EAFC @ =NewFileIntroProcessTextCursor
_0808EAE6:
	str r1, [r0]
_0808EAE8:
	adds r0, r7, #0
_0808EAEA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808EAF8: .4byte 0x08613180
_0808EAFC: .4byte NewFileIntroProcessTextCursor

	thumb_func_start NewFileIntroSamusFoundVblank
NewFileIntroSamusFoundVblank: @ 0x0808EB00
	ldr r1, _0808EB4C @ =0x040000D4
	ldr r0, _0808EB50 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0808EB54 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0808EB58 @ =0x04000052
	ldr r0, _0808EB5C @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0808EB60 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808EB64 @ =0x04000054
	ldr r0, _0808EB68 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x3c
	ldr r0, _0808EB6C @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808EB70 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808EB74 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808EB78 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0808EB4C: .4byte 0x040000D4
_0808EB50: .4byte gOamData
_0808EB54: .4byte 0x84000100
_0808EB58: .4byte 0x04000052
_0808EB5C: .4byte gWrittenToBldalpha_L
_0808EB60: .4byte gWrittenToBldalpha_R
_0808EB64: .4byte 0x04000054
_0808EB68: .4byte gWrittenToBldy
_0808EB6C: .4byte 0x0300122C
_0808EB70: .4byte 0x0300122E
_0808EB74: .4byte 0x03001230
_0808EB78: .4byte 0x03001232

	thumb_func_start unk_8eb7c
unk_8eb7c: @ 0x0808EB7C
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroSamusCuredInit
NewFileIntroSamusCuredInit: @ 0x0808EB80
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	ldr r3, _0808ED0C @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0808ED10 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0808ED14 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0808ED18 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0808ED1C @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0808ED20 @ =unk_99940
	bl CallbackSetVBlank
	ldr r0, _0808ED24 @ =gNonGameplayRam
	mov r8, r0
	ldr r1, [r0, #4]
	movs r5, #0
	str r5, [sp]
	ldr r4, _0808ED28 @ =0x040000D4
	mov r2, sp
	str r2, [r4]
	str r0, [r4, #4]
	ldr r0, _0808ED2C @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, r8
	str r1, [r0, #4]
	ldr r0, _0808ED30 @ =0x085E116C
	ldr r1, _0808ED34 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _0808ED38 @ =0x085F5254
	str r0, [r4]
	ldr r0, _0808ED3C @ =0x05000200
	str r0, [r4, #4]
	ldr r1, _0808ED40 @ =0x84000080
	mov sb, r1
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808ED44 @ =0x08613148
	str r0, [r4]
	ldr r0, _0808ED48 @ =0x06017FE0
	str r0, [r4, #4]
	ldr r6, _0808ED4C @ =0x84000008
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808ED50 @ =0x086131A8
	str r0, [r4]
	ldr r0, _0808ED54 @ =0x050003E0
	str r0, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808ED58 @ =0x085D4E6C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0808ED5C @ =0x085DB5CC
	ldr r1, _0808ED60 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _0808ED64 @ =0x085DEF10
	ldr r1, _0808ED68 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0808ED6C @ =0x085DF7AC
	ldr r1, _0808ED70 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0808ED74 @ =0x08598898
	ldr r1, _0808ED78 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0808ED7C @ =0x085DED10
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	mov r2, sb
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808ED80 @ =0x085C8EFC
	str r0, [r4]
	ldr r0, _0808ED84 @ =0x050001E0
	str r0, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0808ED88 @ =0x085F6018
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompWram
	ldr r0, _0808ED8C @ =0x085EDF70
	ldr r1, _0808ED90 @ =0x02001000
	bl LZ77UncompWram
	ldr r1, _0808ED94 @ =0x04000010
	ldr r2, _0808ED98 @ =0x0000FFF8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0808ED9C @ =0x04000012
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
	subs r1, #8
	ldr r2, _0808EDA0 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _0808EDA4 @ =0x00001E0A
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #0xf9
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _0808EDA8 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0808EDAC @ =0x04000054
	strh r1, [r0]
	ldr r0, _0808EDB0 @ =0x0300122C
	strh r5, [r0]
	ldr r0, _0808EDB4 @ =0x0300122E
	strh r5, [r0]
	ldr r0, _0808EDB8 @ =0x03001230
	strh r5, [r0]
	ldr r1, _0808EDBC @ =0x03001232
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0x82
	lsls r1, r1, #1
	movs r0, #0xc8
	movs r2, #0
	bl NewFileIntroSamusCuredSetupOam
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl NewFileIntroSamusCuredSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _0808EDC0 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r0, _0808EDC4 @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _0808EDC8 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0808EDCC @ =NewFileIntroSamusCuredVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808ED0C: .4byte 0x04000208
_0808ED10: .4byte 0x04000004
_0808ED14: .4byte 0x0000FFEF
_0808ED18: .4byte 0x04000200
_0808ED1C: .4byte 0x0000FFFD
_0808ED20: .4byte unk_99940
_0808ED24: .4byte gNonGameplayRam
_0808ED28: .4byte 0x040000D4
_0808ED2C: .4byte 0x85000150
_0808ED30: .4byte 0x085E116C
_0808ED34: .4byte 0x06010000
_0808ED38: .4byte 0x085F5254
_0808ED3C: .4byte 0x05000200
_0808ED40: .4byte 0x84000080
_0808ED44: .4byte 0x08613148
_0808ED48: .4byte 0x06017FE0
_0808ED4C: .4byte 0x84000008
_0808ED50: .4byte 0x086131A8
_0808ED54: .4byte 0x050003E0
_0808ED58: .4byte 0x085D4E6C
_0808ED5C: .4byte 0x085DB5CC
_0808ED60: .4byte 0x06008000
_0808ED64: .4byte 0x085DEF10
_0808ED68: .4byte 0x0600F800
_0808ED6C: .4byte 0x085DF7AC
_0808ED70: .4byte 0x0600F000
_0808ED74: .4byte 0x08598898
_0808ED78: .4byte 0x0600E000
_0808ED7C: .4byte 0x085DED10
_0808ED80: .4byte 0x085C8EFC
_0808ED84: .4byte 0x050001E0
_0808ED88: .4byte 0x085F6018
_0808ED8C: .4byte 0x085EDF70
_0808ED90: .4byte 0x02001000
_0808ED94: .4byte 0x04000010
_0808ED98: .4byte 0x0000FFF8
_0808ED9C: .4byte 0x04000012
_0808EDA0: .4byte 0x00001C08
_0808EDA4: .4byte 0x00001E0A
_0808EDA8: .4byte gWrittenToBldy
_0808EDAC: .4byte 0x04000054
_0808EDB0: .4byte 0x0300122C
_0808EDB4: .4byte 0x0300122E
_0808EDB8: .4byte 0x03001230
_0808EDBC: .4byte 0x03001232
_0808EDC0: .4byte 0x0863A19C
_0808EDC4: .4byte 0x0600D000
_0808EDC8: .4byte 0x85000400
_0808EDCC: .4byte NewFileIntroSamusCuredVblank

	thumb_func_start NewFileIntroSamusCuredProcess
NewFileIntroSamusCuredProcess: @ 0x0808EDD0
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r5, #0
	ldr r2, _0808EE28 @ =gNonGameplayRam
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	adds r3, r2, #0
	cmp r1, r0
	bne _0808EE02
	ldr r0, _0808EE2C @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808EE02
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808EE02
	movs r0, #1
	strb r0, [r1]
_0808EE02:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #0xc
	bls _0808EE1C
	b _0808F1EA
_0808EE1C:
	lsls r0, r0, #2
	ldr r1, _0808EE30 @ =_0808EE34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808EE28: .4byte gNonGameplayRam
_0808EE2C: .4byte gChangedInput
_0808EE30: .4byte _0808EE34
_0808EE34: @ jump table
	.4byte _0808EE68 @ case 0
	.4byte _0808EE8E @ case 1
	.4byte _0808EEBC @ case 2
	.4byte _0808EEEC @ case 3
	.4byte _0808EF1E @ case 4
	.4byte _0808EF58 @ case 5
	.4byte _0808F050 @ case 6
	.4byte _0808F07C @ case 7
	.4byte _0808F0CA @ case 8
	.4byte _0808F10C @ case 9
	.4byte _0808F15C @ case 10
	.4byte _0808F18C @ case 11
	.4byte _0808F1CC @ case 12
_0808EE68:
	ldr r2, _0808EE78 @ =gWrittenToBldy
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0808EE7C
	subs r0, #1
	strh r0, [r2]
	b _0808F1BC
	.align 2, 0
_0808EE78: .4byte gWrittenToBldy
_0808EE7C:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r0, r3, r4
	strh r1, [r0]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r3, r6
	movs r0, #1
	b _0808F1BA
_0808EE8E:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrh r1, [r2]
	subs r0, #0xf8
	cmp r1, r0
	beq _0808EE9E
	b _0808F1BC
_0808EE9E:
	movs r0, #0
	strh r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808EEB8 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #2
	b _0808F1BA
	.align 2, 0
_0808EEB8: .4byte 0x0000FBFF
_0808EEBC:
	movs r6, #0x84
	lsls r6, r6, #2
	adds r4, r3, r6
	ldrh r0, [r4]
	cmp r0, #0xa
	beq _0808EECA
	b _0808F1BC
_0808EECA:
	movs r2, #0
	movs r1, #0
	strh r1, [r4]
	ldr r4, _0808EEE8 @ =0x00000212
	adds r0, r3, r4
	strb r2, [r0]
	strh r1, [r3, #0xe]
	strh r1, [r3, #0xc]
	ldr r0, [r3, #4]
	str r0, [r3]
	adds r6, #4
	adds r1, r3, r6
	movs r0, #3
	b _0808F1BA
	.align 2, 0
_0808EEE8: .4byte 0x00000212
_0808EEEC:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	movs r4, #0x86
	lsls r4, r4, #2
	adds r1, r3, r4
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808EF08
	cmp r0, #4
	bne _0808EF0C
_0808EF08:
	strb r2, [r1]
	b _0808F1BC
_0808EF0C:
	cmp r0, #3
	beq _0808EF12
	b _0808F1BC
_0808EF12:
	strb r2, [r1]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r3, r6
	movs r0, #4
	b _0808F1BA
_0808EF1E:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrh r0, [r1]
	cmp r0, #0x14
	beq _0808EF2C
	b _0808F1BC
_0808EF2C:
	movs r0, #0
	strh r0, [r1]
	str r0, [sp]
	ldr r1, _0808EF4C @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	ldr r0, _0808EF50 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _0808EF54 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #5
	b _0808F1BA
	.align 2, 0
_0808EF4C: .4byte 0x040000D4
_0808EF50: .4byte 0x0600D000
_0808EF54: .4byte 0x85000400
_0808EF58:
	ldr r6, _0808EF8C @ =0x00000213
	adds r4, r3, r6
	ldrb r0, [r4]
	adds r0, #1
	movs r2, #0
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bhi _0808EF9C
	ldr r2, _0808EF90 @ =0x040000D4
	ldrb r0, [r4]
	lsls r0, r0, #0xc
	movs r1, #0x80
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r0, [r2]
	ldrb r0, [r4]
	lsls r0, r0, #0xc
	ldr r1, _0808EF94 @ =0x06007000
	adds r0, r0, r1
	str r0, [r2, #4]
	ldr r0, _0808EF98 @ =0x84000400
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0808EFF8
	.align 2, 0
_0808EF8C: .4byte 0x00000213
_0808EF90: .4byte 0x040000D4
_0808EF94: .4byte 0x06007000
_0808EF98: .4byte 0x84000400
_0808EF9C:
	cmp r0, #6
	bne _0808EFF4
	ldr r1, _0808EFD4 @ =0x040000D4
	ldr r0, _0808EFD8 @ =0x0879C354
	ldr r0, [r0]
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0808EFDC @ =0x84000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	ldr r0, _0808EFE0 @ =0x0600F000
	str r0, [r1, #4]
	ldr r0, _0808EFE4 @ =0x84000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0808EFE8 @ =gWrittenToBldalpha_R
	strh r2, [r0]
	ldr r1, _0808EFEC @ =gWrittenToBldalpha_L
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0808EFF0 @ =0x0300122E
	strh r2, [r0]
	b _0808EFF8
	.align 2, 0
_0808EFD4: .4byte 0x040000D4
_0808EFD8: .4byte 0x0879C354
_0808EFDC: .4byte 0x84000020
_0808EFE0: .4byte 0x0600F000
_0808EFE4: .4byte 0x84000200
_0808EFE8: .4byte gWrittenToBldalpha_R
_0808EFEC: .4byte gWrittenToBldalpha_L
_0808EFF0: .4byte 0x0300122E
_0808EFF4:
	movs r0, #0xa
	strb r0, [r4]
_0808EFF8:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	ldrh r2, [r1]
	cmp r2, #1
	beq _0808F006
	b _0808F1BC
_0808F006:
	movs r0, #0
	strh r0, [r1]
	ldr r4, _0808F024 @ =0x00000111
	adds r1, r3, r4
	ldrb r0, [r1]
	cmp r0, #0xe
	bhi _0808F028
	adds r0, #1
	strb r0, [r1]
	movs r6, #0x88
	lsls r6, r6, #1
	adds r0, r3, r6
	strb r2, [r0]
	b _0808F1BC
	.align 2, 0
_0808F024: .4byte 0x00000111
_0808F028:
	ldr r1, _0808F044 @ =0x04000050
	ldr r2, _0808F048 @ =0x00001844
	adds r0, r2, #0
	strh r0, [r1]
	ldr r4, _0808F04C @ =0x00000213
	adds r1, r3, r4
	movs r0, #0
	strb r0, [r1]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r3, r6
	movs r0, #6
	b _0808F1BA
	.align 2, 0
_0808F044: .4byte 0x04000050
_0808F048: .4byte 0x00001844
_0808F04C: .4byte 0x00000213
_0808F050:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrh r0, [r4]
	cmp r0, #0x46
	beq _0808F05E
	b _0808F1BC
_0808F05E:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r1, r6, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r4]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #7
	b _0808F1BA
_0808F07C:
	ldr r2, _0808F0AC @ =0x00000213
	adds r1, r3, r2
	ldrb r0, [r1]
	adds r0, #1
	movs r4, #0
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #8
	beq _0808F092
	b _0808F1BC
_0808F092:
	strb r4, [r1]
	ldr r1, _0808F0B0 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808F0B8
	adds r0, #1
	strh r0, [r1]
	ldr r1, _0808F0B4 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	b _0808F1BC
	.align 2, 0
_0808F0AC: .4byte 0x00000213
_0808F0B0: .4byte gWrittenToBldalpha_R
_0808F0B4: .4byte gWrittenToBldalpha_L
_0808F0B8:
	movs r6, #0x84
	lsls r6, r6, #2
	adds r0, r3, r6
	strh r4, [r0]
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r3, r1
	strb r2, [r0]
	b _0808F1BC
_0808F0CA:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	ldrh r0, [r1]
	cmp r0, #8
	bne _0808F1BC
	movs r2, #0
	strh r2, [r1]
	ldr r4, _0808F0F4 @ =0x0000012D
	adds r1, r3, r4
	ldrb r0, [r1]
	cmp r0, #0xe
	bhi _0808F0F8
	adds r0, #1
	strb r0, [r1]
	movs r6, #0x96
	lsls r6, r6, #1
	adds r1, r3, r6
	movs r0, #1
	b _0808F1BA
	.align 2, 0
_0808F0F4: .4byte 0x0000012D
_0808F0F8:
	ldr r0, _0808F108 @ =gWrittenToBldy
	strh r2, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #9
	b _0808F1BA
	.align 2, 0
_0808F108: .4byte gWrittenToBldy
_0808F10C:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r4, r3, r1
	ldrh r0, [r4]
	cmp r0, #0x1e
	bne _0808F1BC
	ldr r1, _0808F14C @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r2, #0
	movs r1, #0
	strh r1, [r4]
	ldr r4, _0808F150 @ =0x00000212
	adds r0, r3, r4
	strb r2, [r0]
	strh r1, [r3, #0xe]
	strh r1, [r3, #0xc]
	ldr r1, _0808F154 @ =0x0879C5A4
	ldr r0, _0808F158 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x44]
	str r0, [r3]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r3, r6
	movs r0, #0xa
	b _0808F1BA
	.align 2, 0
_0808F14C: .4byte 0x04000050
_0808F150: .4byte 0x00000212
_0808F154: .4byte 0x0879C5A4
_0808F158: .4byte 0x03000011
_0808F15C:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	movs r4, #0x86
	lsls r4, r4, #2
	adds r1, r3, r4
	ldrb r0, [r1]
	cmp r0, #2
	bne _0808F176
	b _0808EF08
_0808F176:
	cmp r0, #4
	bne _0808F17C
	b _0808EF08
_0808F17C:
	cmp r0, #3
	bne _0808F1BC
	strb r2, [r1]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r3, r6
	movs r0, #0xb
	b _0808F1BA
_0808F18C:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrh r0, [r1]
	cmp r0, #0xa
	bne _0808F1A4
	movs r0, #0x1e
	movs r1, #0x78
	movs r2, #0x40
	bl NewFileIntroSamusCuredSetupOam
	b _0808F1BC
_0808F1A4:
	cmp r0, #0x28
	bne _0808F1BC
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808F1C8 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #0xc
_0808F1BA:
	strb r0, [r1]
_0808F1BC:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _0808F1EA
	.align 2, 0
_0808F1C8: .4byte gWrittenToBldy
_0808F1CC:
	ldr r1, _0808F1DC @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808F1E0
	adds r0, #1
	strh r0, [r1]
	b _0808F1E2
	.align 2, 0
_0808F1DC: .4byte gWrittenToBldy
_0808F1E0:
	movs r5, #1
_0808F1E2:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808F1EA:
	bl IntroProcessText
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start NewFileIntroSamusCured
NewFileIntroSamusCured: @ 0x0808F1F8
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0808F210 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _0808F224
	cmp r0, #1
	bgt _0808F214
	cmp r0, #0
	beq _0808F21E
	b _0808F278
	.align 2, 0
_0808F210: .4byte gNonGameplayRam
_0808F214:
	cmp r0, #2
	beq _0808F23C
	cmp r0, #3
	beq _0808F258
	b _0808F278
_0808F21E:
	bl NewFileIntroSamusCuredInit
	b _0808F230
_0808F224:
	bl SpecialCutsceneFadeIn
	ldr r0, _0808F238 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _0808F278
_0808F230:
	movs r0, #2
	strh r0, [r4, #8]
	b _0808F278
	.align 2, 0
_0808F238: .4byte gWrittenToBldy
_0808F23C:
	bl NewFileIntroSamusCuredProcess
	cmp r0, #0
	beq _0808F278
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #3
	strh r0, [r4, #8]
	b _0808F278
_0808F258:
	ldr r1, _0808F268 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808F26C
	adds r0, #1
	strh r0, [r1]
	b _0808F270
	.align 2, 0
_0808F268: .4byte gWrittenToBldy
_0808F26C:
	strh r5, [r4, #8]
	movs r5, #1
_0808F270:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808F278:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NewFileIntroProcessSamusCuredScrolling
NewFileIntroProcessSamusCuredScrolling: @ 0x0808F280
	push {r4, lr}
	sub sp, #4
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r1, r0, #1
	movs r3, #0
	strb r1, [r2, #0x13]
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0808F2CC
	ldr r0, _0808F2BC @ =0x0300122C
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2, #0xc]
	ldr r0, _0808F2C0 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r2, #0xe]
	ldr r0, _0808F2C4 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, _0808F2C8 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r2, #2]
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r2, #0xa]
	strb r1, [r2, #0x13]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0808F37A
	.align 2, 0
_0808F2BC: .4byte 0x0300122C
_0808F2C0: .4byte 0x0300122E
_0808F2C4: .4byte 0x03001230
_0808F2C8: .4byte 0x03001232
_0808F2CC:
	cmp r0, #1
	bne _0808F2E0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bne _0808F37A
	strb r3, [r2, #0x13]
	movs r0, #2
	strb r0, [r2, #0x14]
	b _0808F37A
_0808F2E0:
	ldr r0, _0808F35C @ =gNonGameplayRam
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808F378
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0808F32A
	strb r3, [r2, #0x13]
	ldrh r3, [r2, #0xe]
	movs r0, #0xe
	ldrsh r1, [r2, r0]
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	ble _0808F310
	subs r0, r3, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_0808F310:
	ldrh r1, [r2, #2]
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0808F31E
	subs r0, r1, #1
	strh r0, [r2, #2]
_0808F31E:
	ldr r1, _0808F360 @ =0x0300122E
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	ldr r1, _0808F364 @ =0x03001232
	ldrh r0, [r2, #2]
	strh r0, [r1]
_0808F32A:
	movs r4, #8
	ldrsh r0, [r2, r4]
	cmp r0, #9
	bne _0808F37A
	movs r1, #0
	strh r1, [r2, #8]
	ldrh r0, [r2, #0xa]
	cmp r0, #0
	beq _0808F37A
	ldr r3, _0808F368 @ =0xFFFFFC00
	adds r0, r0, r3
	strh r0, [r2, #0xa]
	str r1, [sp]
	ldr r1, _0808F36C @ =0x040000D4
	mov r4, sp
	str r4, [r1]
	ldrh r0, [r2, #0xa]
	ldr r2, _0808F370 @ =0x06008000
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _0808F374 @ =0x85000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0808F37A
	.align 2, 0
_0808F35C: .4byte gNonGameplayRam
_0808F360: .4byte 0x0300122E
_0808F364: .4byte 0x03001232
_0808F368: .4byte 0xFFFFFC00
_0808F36C: .4byte 0x040000D4
_0808F370: .4byte 0x06008000
_0808F374: .4byte 0x85000100
_0808F378:
	strb r3, [r2, #0x13]
_0808F37A:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroSamusCuredSetupOam
NewFileIntroSamusCuredSetupOam: @ 0x0808F384
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r6, #0
	ldr r1, _0808F3D4 @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808F3CA
	adds r4, r1, #0
	adds r1, r3, #0
_0808F3B0:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #0x13
	bhi _0808F3CE
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0808F3B0
_0808F3CA:
	cmp r6, #0x13
	bls _0808F3D8
_0808F3CE:
	movs r0, #0x14
	b _0808F4B0
	.align 2, 0
_0808F3D4: .4byte gNonGameplayRam
_0808F3D8:
	movs r0, #0
	str r0, [sp]
	ldr r1, _0808F438 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	lsls r0, r6, #3
	adds r0, r0, r6
	lsls r5, r0, #2
	ldr r7, _0808F43C @ =0x030016A0
	adds r0, r5, r7
	str r0, [r1, #4]
	ldr r0, _0808F440 @ =0x85000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808F444 @ =0xFFFFFDE4
	adds r0, r7, r1
	adds r4, r5, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r4, r1
	mov r1, r8
	strh r1, [r0]
	ldr r1, _0808F448 @ =0x0000022A
	adds r0, r4, r1
	strh r2, [r0]
	adds r1, #2
	adds r0, r4, r1
	mov r1, ip
	strb r1, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #1
	orrs r1, r0
	strb r1, [r2]
	mov r0, ip
	cmp r0, #1
	bne _0808F450
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r2]
	adds r0, r7, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808F44C @ =NewFileIntroProcessSamusCuredScrolling
	b _0808F4AC
	.align 2, 0
_0808F438: .4byte 0x040000D4
_0808F43C: .4byte 0x030016A0
_0808F440: .4byte 0x85000009
_0808F444: .4byte 0xFFFFFDE4
_0808F448: .4byte 0x0000022A
_0808F44C: .4byte NewFileIntroProcessSamusCuredScrolling
_0808F450:
	mov r1, ip
	cmp r1, #0x1e
	bne _0808F494
	ldr r0, _0808F484 @ =0x0000012D
	bl SoundPlay
	ldr r0, _0808F488 @ =0x00000236
	adds r2, r4, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808F48C @ =0x085F49E8
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808F490 @ =unk_8f5c0
	b _0808F4AC
	.align 2, 0
_0808F484: .4byte 0x0000012D
_0808F488: .4byte 0x00000236
_0808F48C: .4byte 0x085F49E8
_0808F490: .4byte unk_8f5c0
_0808F494:
	mov r1, ip
	cmp r1, #0xc8
	bne _0808F4AE
	adds r0, r7, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0808F4BC @ =0x08613180
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0808F4C0 @ =NewFileIntroProcessTextCursor
_0808F4AC:
	str r1, [r0]
_0808F4AE:
	adds r0, r6, #0
_0808F4B0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0808F4BC: .4byte 0x08613180
_0808F4C0: .4byte NewFileIntroProcessTextCursor

	thumb_func_start NewFileIntroSamusCuredVblank
NewFileIntroSamusCuredVblank: @ 0x0808F4C4
	push {r4, lr}
	ldr r3, _0808F570 @ =0x040000D4
	ldr r0, _0808F574 @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _0808F578 @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _0808F57C @ =0x04000052
	ldr r0, _0808F580 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0808F584 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0808F588 @ =0x04000054
	ldr r0, _0808F58C @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x3c
	ldr r0, _0808F590 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808F594 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808F598 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0808F59C @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _0808F5A0 @ =gNonGameplayRam
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808F53C
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0808F5A4 @ =0x0879C314
	ldr r4, _0808F5A8 @ =0x00000111
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3]
	ldr r0, _0808F5AC @ =0x050000A0
	str r0, [r3, #4]
	ldr r0, _0808F5B0 @ =0x84000050
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_0808F53C:
	movs r0, #0x96
	lsls r0, r0, #1
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _0808F568
	movs r0, #0
	strb r0, [r1]
	ldr r1, _0808F5B4 @ =0x0879C354
	ldr r4, _0808F5B8 @ =0x0000012D
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r3]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _0808F5BC @ =0x84000020
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_0808F568:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808F570: .4byte 0x040000D4
_0808F574: .4byte gOamData
_0808F578: .4byte 0x84000100
_0808F57C: .4byte 0x04000052
_0808F580: .4byte gWrittenToBldalpha_L
_0808F584: .4byte gWrittenToBldalpha_R
_0808F588: .4byte 0x04000054
_0808F58C: .4byte gWrittenToBldy
_0808F590: .4byte 0x0300122C
_0808F594: .4byte 0x0300122E
_0808F598: .4byte 0x03001230
_0808F59C: .4byte 0x03001232
_0808F5A0: .4byte gNonGameplayRam
_0808F5A4: .4byte 0x0879C314
_0808F5A8: .4byte 0x00000111
_0808F5AC: .4byte 0x050000A0
_0808F5B0: .4byte 0x84000050
_0808F5B4: .4byte 0x0879C354
_0808F5B8: .4byte 0x0000012D
_0808F5BC: .4byte 0x84000020

	thumb_func_start unk_8f5c0
unk_8f5c0: @ 0x0808F5C0
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroArrivingAtBslInit
NewFileIntroArrivingAtBslInit: @ 0x0808F5C4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r3, _0808F730 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0808F734 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0808F738 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0808F73C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0808F740 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0808F744 @ =unk_99940
	bl CallbackSetVBlank
	movs r4, #0
	str r4, [sp]
	ldr r5, _0808F748 @ =0x040000D4
	mov r0, sp
	str r0, [r5]
	ldr r1, _0808F74C @ =gNonGameplayRam
	mov r8, r1
	str r1, [r5, #4]
	ldr r0, _0808F750 @ =0x85000150
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _0808F754 @ =0x085E116C
	ldr r1, _0808F758 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _0808F75C @ =0x085F5254
	str r0, [r5]
	ldr r0, _0808F760 @ =0x05000200
	str r0, [r5, #4]
	ldr r6, _0808F764 @ =0x84000080
	str r6, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _0808F768 @ =0x085E8A10
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0808F76C @ =0x085EDF70
	ldr r1, _0808F770 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _0808F774 @ =0x085F5A58
	ldr r1, _0808F778 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0808F77C @ =0x085F6018
	ldr r1, _0808F780 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0808F784 @ =0x08598898
	ldr r1, _0808F788 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0808F78C @ =0x085F5054
	str r0, [r5]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r5, #4]
	str r6, [r5, #8]
	ldr r1, [r5, #8]
	strh r4, [r0]
	ldr r0, _0808F790 @ =0x08662804
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UncompWram
	ldr r0, _0808F794 @ =0x085EAC18
	ldr r1, _0808F798 @ =0x02001000
	bl LZ77UncompWram
	ldr r0, _0808F79C @ =0x085E49E4
	ldr r1, _0808F7A0 @ =0x02009000
	bl LZ77UncompWram
	ldr r0, _0808F7A4 @ =0x04000010
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r1, _0808F7A8 @ =0x03001224
	ldr r2, _0808F7AC @ =0x0000FFF8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r1, _0808F7B0 @ =0x03001226
	movs r0, #8
	strh r0, [r1]
	ldr r0, _0808F7B4 @ =0x0300122C
	strh r4, [r0]
	ldr r0, _0808F7B8 @ =0x0300122E
	strh r4, [r0]
	ldr r0, _0808F7BC @ =0x03001230
	strh r4, [r0]
	ldr r0, _0808F7C0 @ =0x03001232
	strh r4, [r0]
	ldr r1, _0808F7C4 @ =0x04000008
	ldr r2, _0808F7C8 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _0808F7CC @ =0x00001E02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0808F7D0 @ =0x00001F0B
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _0808F7D4 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0808F7D8 @ =0x04000054
	strh r1, [r0]
	ldr r0, _0808F7DC @ =gWrittenToBldalpha_R
	strh r4, [r0]
	ldr r0, _0808F7E0 @ =gWrittenToBldalpha_L
	strh r1, [r0]
	movs r0, #0x18
	movs r1, #0x70
	movs r2, #0x50
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #0x19
	movs r1, #0x70
	movs r2, #0x50
	bl NewFileIntroArrivingAtBslSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _0808F7E4 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	str r4, [sp]
	mov r2, sp
	str r2, [r5]
	ldr r0, _0808F7E8 @ =0x0600D000
	str r0, [r5, #4]
	ldr r0, _0808F7EC @ =0x85000400
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xa8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0808F7F0 @ =NewFileIntroArrivingAtBslVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808F730: .4byte 0x04000208
_0808F734: .4byte 0x04000004
_0808F738: .4byte 0x0000FFEF
_0808F73C: .4byte 0x04000200
_0808F740: .4byte 0x0000FFFD
_0808F744: .4byte unk_99940
_0808F748: .4byte 0x040000D4
_0808F74C: .4byte gNonGameplayRam
_0808F750: .4byte 0x85000150
_0808F754: .4byte 0x085E116C
_0808F758: .4byte 0x06010000
_0808F75C: .4byte 0x085F5254
_0808F760: .4byte 0x05000200
_0808F764: .4byte 0x84000080
_0808F768: .4byte 0x085E8A10
_0808F76C: .4byte 0x085EDF70
_0808F770: .4byte 0x06008000
_0808F774: .4byte 0x085F5A58
_0808F778: .4byte 0x0600F000
_0808F77C: .4byte 0x085F6018
_0808F780: .4byte 0x0600F800
_0808F784: .4byte 0x08598898
_0808F788: .4byte 0x0600E000
_0808F78C: .4byte 0x085F5054
_0808F790: .4byte 0x08662804
_0808F794: .4byte 0x085EAC18
_0808F798: .4byte 0x02001000
_0808F79C: .4byte 0x085E49E4
_0808F7A0: .4byte 0x02009000
_0808F7A4: .4byte 0x04000010
_0808F7A8: .4byte 0x03001224
_0808F7AC: .4byte 0x0000FFF8
_0808F7B0: .4byte 0x03001226
_0808F7B4: .4byte 0x0300122C
_0808F7B8: .4byte 0x0300122E
_0808F7BC: .4byte 0x03001230
_0808F7C0: .4byte 0x03001232
_0808F7C4: .4byte 0x04000008
_0808F7C8: .4byte 0x00001C08
_0808F7CC: .4byte 0x00001E02
_0808F7D0: .4byte 0x00001F0B
_0808F7D4: .4byte gWrittenToBldy
_0808F7D8: .4byte 0x04000054
_0808F7DC: .4byte gWrittenToBldalpha_R
_0808F7E0: .4byte gWrittenToBldalpha_L
_0808F7E4: .4byte 0x0863A19C
_0808F7E8: .4byte 0x0600D000
_0808F7EC: .4byte 0x85000400
_0808F7F0: .4byte NewFileIntroArrivingAtBslVblank

	thumb_func_start NewFileIntroArrivingAtBslProcess
NewFileIntroArrivingAtBslProcess: @ 0x0808F7F4
	push {r4, r5, r6, lr}
	sub sp, #4
	movs r6, #0
	ldr r2, _0808F84C @ =gNonGameplayRam
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	adds r4, r2, #0
	cmp r1, r0
	bne _0808F826
	ldr r0, _0808F850 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808F826
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808F826
	movs r0, #1
	strb r0, [r1]
_0808F826:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrb r0, [r0]
	cmp r0, #0xe
	bls _0808F840
	b _0808FF30
_0808F840:
	lsls r0, r0, #2
	ldr r1, _0808F854 @ =_0808F858
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808F84C: .4byte gNonGameplayRam
_0808F850: .4byte gChangedInput
_0808F854: .4byte _0808F858
_0808F858: @ jump table
	.4byte _0808F894 @ case 0
	.4byte _0808F8B2 @ case 1
	.4byte _0808F910 @ case 2
	.4byte _0808F964 @ case 3
	.4byte _0808F9C8 @ case 4
	.4byte _0808F9D0 @ case 5
	.4byte _0808FA68 @ case 6
	.4byte _0808FA90 @ case 7
	.4byte _0808FB8C @ case 8
	.4byte _0808FC0C @ case 9
	.4byte _0808FC5C @ case 10
	.4byte _0808FCBC @ case 11
	.4byte _0808FEA0 @ case 12
	.4byte _0808FEF8 @ case 13
	.4byte _0808FF0C @ case 14
_0808F894:
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrh r0, [r1]
	cmp r0, #1
	beq _0808F8A2
	b _0808FF02
_0808F8A2:
	movs r0, #0
	strh r0, [r1]
	movs r5, #0x85
	lsls r5, r5, #2
	adds r1, r4, r5
	movs r0, #2
	strb r0, [r1]
	b _0808FF02
_0808F8B2:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #3
	beq _0808F8C0
	b _0808FF02
_0808F8C0:
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808F8E0 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	cmp r0, #8
	bls _0808F8D0
	subs r0, #1
	strh r0, [r1]
_0808F8D0:
	ldr r0, _0808F8E4 @ =gWrittenToBldalpha_R
	ldrh r1, [r0]
	adds r2, r0, #0
	cmp r1, #0xf
	bhi _0808F8E8
	adds r0, r1, #2
	strh r0, [r2]
	b _0808F8F2
	.align 2, 0
_0808F8E0: .4byte gWrittenToBldalpha_L
_0808F8E4: .4byte gWrittenToBldalpha_R
_0808F8E8:
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #2
	strb r0, [r1]
_0808F8F2:
	ldrh r0, [r2]
	cmp r0, #8
	beq _0808F8FA
	b _0808FF02
_0808F8FA:
	movs r0, #0x18
	movs r1, #0x70
	movs r2, #0x50
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #0x19
	movs r1, #0x70
	movs r2, #0x50
	bl NewFileIntroArrivingAtBslSetupOam
	b _0808FF02
_0808F910:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r5, r4, r0
	ldrh r0, [r5]
	cmp r0, #0xa
	bne _0808F928
	movs r0, #0x1a
	movs r1, #0xc6
	movs r2, #0x24
	bl NewFileIntroArrivingAtBslSetupOam
	b _0808F9B2
_0808F928:
	cmp r0, #0x28
	bne _0808F9B2
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #0x17
	movs r1, #0x14
	movs r2, #0xc0
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #0x14
	movs r1, #0x80
	movs r2, #0xc0
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #0x15
	movs r1, #0x80
	movs r2, #0xc0
	bl NewFileIntroArrivingAtBslSetupOam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r2, #0
	movs r1, #3
	strb r1, [r0]
	strh r2, [r5]
	b _0808F9B2
_0808F964:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r5, #0
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r3, r4, r0
	ldrb r0, [r3]
	cmp r0, #2
	beq _0808F980
	cmp r0, #4
	bne _0808F990
_0808F980:
	strb r5, [r3]
	ldr r0, _0808F98C @ =0x00000203
	bl SoundPlay
	b _0808F9B2
	.align 2, 0
_0808F98C: .4byte 0x00000203
_0808F990:
	cmp r0, #3
	bne _0808F9B2
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808F9C0 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	strb r5, [r3]
	ldr r0, _0808F9C4 @ =0x00000203
	bl SoundPlay
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #4
	strb r0, [r1]
_0808F9B2:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	bl NewFileIntroProcessAdamText
	b _0808FF30
	.align 2, 0
_0808F9C0: .4byte 0x0000FEFF
_0808F9C4: .4byte 0x00000203
_0808F9C8:
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r4, r3
	b _0808FEFE
_0808F9D0:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r3, r4, r5
	ldrh r0, [r3]
	cmp r0, #1
	bne _0808FA04
	ldr r2, _0808F9F8 @ =sMusicTrackDataRom
	ldr r0, _0808F9FC @ =sSoundDataEntries
	ldr r1, _0808FA00 @ =0x00001224
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	bl ApplyMusicSoundFading
	b _0808FF02
	.align 2, 0
_0808F9F8: .4byte sMusicTrackDataRom
_0808F9FC: .4byte sSoundDataEntries
_0808FA00: .4byte 0x00001224
_0808FA04:
	cmp r0, #0x1e
	bhi _0808FA0A
	b _0808FF02
_0808FA0A:
	ldr r1, _0808FA18 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808FA1C
	adds r0, #1
	b _0808FF00
	.align 2, 0
_0808FA18: .4byte gWrittenToBldy
_0808FA1C:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808FA5C @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r2, #0
	str r2, [sp]
	ldr r1, _0808FA60 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r5, #0x87
	lsls r5, r5, #2
	adds r0, r4, r5
	str r0, [r1, #4]
	ldr r0, _0808FA64 @ =0x850000B4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strh r2, [r3]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #6
	strb r0, [r1]
	b _0808FF02
	.align 2, 0
_0808FA5C: .4byte 0x0000FBFF
_0808FA60: .4byte 0x040000D4
_0808FA64: .4byte 0x850000B4
_0808FA68:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808FA80 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808FA84
	subs r0, #1
	strh r0, [r1]
	b _0808FF30
	.align 2, 0
_0808FA80: .4byte gWrittenToBldy
_0808FA84:
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #7
	strb r0, [r1]
	b _0808FF30
_0808FA90:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r2, r4, r5
	ldrh r0, [r2]
	cmp r0, #1
	bne _0808FAC4
	ldr r1, _0808FABC @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r0, #0
	str r0, [sp]
	adds r1, #0x84
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0808FAC0 @ =0x85001200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0808FF02
	.align 2, 0
_0808FABC: .4byte 0x04000050
_0808FAC0: .4byte 0x85001200
_0808FAC4:
	cmp r0, #2
	bne _0808FB14
	ldr r1, _0808FAF4 @ =0x040000D4
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	ldr r0, _0808FAF8 @ =0x06004800
	str r0, [r1, #4]
	ldr r0, _0808FAFC @ =0x84000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0808FB00 @ =0x08663820
	str r0, [r1]
	ldr r0, _0808FB04 @ =0x05000180
	str r0, [r1, #4]
	ldr r0, _0808FB08 @ =0x84000020
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808FB0C @ =0x03001224
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808FB10 @ =0x03001226
	movs r0, #4
	b _0808FF00
	.align 2, 0
_0808FAF4: .4byte 0x040000D4
_0808FAF8: .4byte 0x06004800
_0808FAFC: .4byte 0x84000200
_0808FB00: .4byte 0x08663820
_0808FB04: .4byte 0x05000180
_0808FB08: .4byte 0x84000020
_0808FB0C: .4byte 0x03001224
_0808FB10: .4byte 0x03001226
_0808FB14:
	cmp r0, #3
	bne _0808FB38
	ldr r1, _0808FB34 @ =0x04000008
	movs r2, #0x90
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _0808FF02
	.align 2, 0
_0808FB34: .4byte 0x04000008
_0808FB38:
	cmp r0, #0x3c
	beq _0808FB3E
	b _0808FF02
_0808FB3E:
	movs r1, #0
	movs r0, #0
	strh r0, [r2]
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x10]
	strh r0, [r4, #0xe]
	strh r0, [r4, #0xc]
	ldr r5, _0808FB80 @ =0x00000212
	adds r0, r4, r5
	strb r1, [r0]
	ldr r1, _0808FB84 @ =0x0879C5A4
	ldr r0, _0808FB88 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	str r0, [r4]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	movs r1, #0x82
	lsls r1, r1, #1
	movs r0, #0x64
	movs r2, #0
	bl NewFileIntroArrivingAtBslSetupOam
	b _0808FF02
	.align 2, 0
_0808FB80: .4byte 0x00000212
_0808FB84: .4byte 0x0879C5A4
_0808FB88: .4byte 0x03000011
_0808FB8C:
	ldr r2, _0808FBB0 @ =gNonGameplayRam
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r3, #0
	movs r0, #0
	strh r0, [r1]
	movs r5, #0x86
	lsls r5, r5, #2
	adds r1, r2, r5
	ldrb r0, [r1]
	cmp r0, #2
	beq _0808FBAA
	cmp r0, #4
	bne _0808FBB4
_0808FBAA:
	strb r3, [r1]
	b _0808FBC4
	.align 2, 0
_0808FBB0: .4byte gNonGameplayRam
_0808FBB4:
	cmp r0, #3
	bne _0808FBC4
	strb r3, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #9
	strb r0, [r1]
_0808FBC4:
	bl NewFileIntroCheckMonologueEnded
	cmp r0, #0
	beq _0808FBE2
	ldr r3, _0808FBF4 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r2, #0
	movs r0, #9
	strb r0, [r1]
	movs r5, #0x86
	lsls r5, r5, #2
	adds r0, r3, r5
	strb r2, [r0]
_0808FBE2:
	ldr r0, _0808FBF4 @ =gNonGameplayRam
	ldr r2, _0808FBF8 @ =0x00000213
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _0808FBFC
	movs r0, #0x64
	strb r0, [r1]
	b _0808FF02
	.align 2, 0
_0808FBF4: .4byte gNonGameplayRam
_0808FBF8: .4byte 0x00000213
_0808FBFC:
	cmp r0, #1
	beq _0808FC02
	b _0808FF02
_0808FC02:
	movs r0, #0x64
	strb r0, [r1]
	bl SpecialCutsceneProcessMonologue
	b _0808FF02
_0808FC0C:
	movs r3, #0x84
	lsls r3, r3, #2
	adds r1, r4, r3
	ldrh r2, [r1]
	cmp r2, #1
	bne _0808FC38
	ldr r1, _0808FC30 @ =gWrittenToBldalpha_L
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808FC34 @ =gWrittenToBldalpha_R
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	bl FadeMusic
	b _0808FF02
	.align 2, 0
_0808FC30: .4byte gWrittenToBldalpha_L
_0808FC34: .4byte gWrittenToBldalpha_R
_0808FC38:
	cmp r2, #0xa
	beq _0808FC3E
	b _0808FF02
_0808FC3E:
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0808FC54 @ =0x04000050
	ldr r5, _0808FC58 @ =0x00000841
	adds r0, r5, #0
	strh r0, [r1]
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r2, [r0]
	b _0808FF02
	.align 2, 0
_0808FC54: .4byte 0x04000050
_0808FC58: .4byte 0x00000841
_0808FC5C:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #4
	beq _0808FC6A
	b _0808FF02
_0808FC6A:
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0808FCB0 @ =gWrittenToBldalpha_L
	ldrh r0, [r2]
	cmp r0, #0xf
	bhi _0808FC7A
	adds r0, #1
	strh r0, [r2]
_0808FC7A:
	ldr r1, _0808FCB4 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808FC86
	subs r0, #1
	strh r0, [r1]
_0808FC86:
	ldrh r0, [r2]
	cmp r0, #0x10
	beq _0808FC8E
	b _0808FF02
_0808FC8E:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808FC96
	b _0808FF02
_0808FC96:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808FCB8 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #0xb
	strb r0, [r1]
	b _0808FF02
	.align 2, 0
_0808FCB0: .4byte gWrittenToBldalpha_L
_0808FCB4: .4byte gWrittenToBldalpha_R
_0808FCB8: .4byte 0x0000FEFF
_0808FCBC:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r3, r4, r5
	ldrh r0, [r3]
	cmp r0, #1
	bne _0808FCFC
	movs r2, #0
	str r2, [sp]
	ldr r1, _0808FCEC @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	movs r3, #0x87
	lsls r3, r3, #2
	adds r0, r4, r3
	str r0, [r1, #4]
	ldr r0, _0808FCF0 @ =0x850000B4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0808FCF4 @ =gWrittenToBldalpha_R
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _0808FCF8 @ =gWrittenToBldalpha_L
	strh r2, [r0]
	b _0808FF02
	.align 2, 0
_0808FCEC: .4byte 0x040000D4
_0808FCF0: .4byte 0x850000B4
_0808FCF4: .4byte gWrittenToBldalpha_R
_0808FCF8: .4byte gWrittenToBldalpha_L
_0808FCFC:
	cmp r0, #5
	bhi _0808FD20
	ldr r1, _0808FD14 @ =0x040000D4
	ldrh r0, [r3]
	lsls r0, r0, #0xd
	ldr r5, _0808FD18 @ =0x01FFD000
	adds r0, r0, r5
	str r0, [r1]
	ldrh r0, [r3]
	lsls r0, r0, #0xd
	ldr r2, _0808FD1C @ =0x0600C000
	b _0808FD36
	.align 2, 0
_0808FD14: .4byte 0x040000D4
_0808FD18: .4byte 0x01FFD000
_0808FD1C: .4byte 0x0600C000
_0808FD20:
	cmp r0, #9
	bhi _0808FD54
	ldr r1, _0808FD44 @ =0x040000D4
	ldrh r0, [r3]
	lsls r0, r0, #0xd
	ldr r5, _0808FD48 @ =0x01FFD000
	adds r0, r0, r5
	str r0, [r1]
	ldrh r0, [r3]
	lsls r0, r0, #0xd
	ldr r2, _0808FD4C @ =0x05FF4000
_0808FD36:
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _0808FD50 @ =0x84000800
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0808FF02
	.align 2, 0
_0808FD44: .4byte 0x040000D4
_0808FD48: .4byte 0x01FFD000
_0808FD4C: .4byte 0x05FF4000
_0808FD50: .4byte 0x84000800
_0808FD54:
	cmp r0, #0xa
	bne _0808FD6C
	ldr r0, _0808FD64 @ =0x085F65D8
	ldr r1, _0808FD68 @ =0x0600E800
	bl LZ77UncompVram
	b _0808FF02
	.align 2, 0
_0808FD64: .4byte 0x085F65D8
_0808FD68: .4byte 0x0600E800
_0808FD6C:
	cmp r0, #0xb
	bne _0808FDA4
	ldr r0, _0808FD94 @ =0x085F5454
	ldr r1, _0808FD98 @ =0x0600F000
	bl LZ77UncompVram
	ldr r1, _0808FD9C @ =0x0400000A
	ldr r3, _0808FDA0 @ =0x00001F08
	adds r0, r3, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	b _0808FF02
	.align 2, 0
_0808FD94: .4byte 0x085F5454
_0808FD98: .4byte 0x0600F000
_0808FD9C: .4byte 0x0400000A
_0808FDA0: .4byte 0x00001F08
_0808FDA4:
	cmp r0, #0xc
	bne _0808FE20
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808FDF0 @ =0x0000F7FF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _0808FDF4 @ =0x0400000C
	ldr r2, _0808FDF8 @ =0x00001D02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0808FDFC @ =0x00001E03
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #0x42
	ldr r5, _0808FE00 @ =0x00001C42
	adds r0, r5, #0
	strh r0, [r1]
	adds r1, #0x84
	ldr r0, _0808FE04 @ =0x085F4ED4
	str r0, [r1]
	ldr r0, _0808FE08 @ =0x05000080
	str r0, [r1, #4]
	ldr r0, _0808FE0C @ =0x84000060
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0808FE10 @ =0x0300122C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0808FE14 @ =0x0300122E
	strh r1, [r0]
	ldr r0, _0808FE18 @ =0x03001230
	strh r1, [r0]
	ldr r0, _0808FE1C @ =0x03001232
	strh r1, [r0]
	b _0808FF02
	.align 2, 0
_0808FDF0: .4byte 0x0000F7FF
_0808FDF4: .4byte 0x0400000C
_0808FDF8: .4byte 0x00001D02
_0808FDFC: .4byte 0x00001E03
_0808FE00: .4byte 0x00001C42
_0808FE04: .4byte 0x085F4ED4
_0808FE08: .4byte 0x05000080
_0808FE0C: .4byte 0x84000060
_0808FE10: .4byte 0x0300122C
_0808FE14: .4byte 0x0300122E
_0808FE18: .4byte 0x03001230
_0808FE1C: .4byte 0x03001232
_0808FE20:
	cmp r0, #0x1e
	bne _0808FF02
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #4
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r3]
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #3
	movs r1, #0xd0
	movs r2, #0x64
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #4
	movs r1, #0xd0
	movs r2, #0x64
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #5
	movs r1, #0xd0
	movs r2, #0x64
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #1
	movs r1, #0xc4
	movs r2, #0x64
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #2
	movs r1, #6
	movs r2, #0x4e
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #7
	movs r1, #0
	movs r2, #0
	bl NewFileIntroArrivingAtBslSetupOam
	movs r0, #8
	movs r1, #0
	movs r2, #0
	bl NewFileIntroArrivingAtBslSetupOam
	ldr r0, _0808FE9C @ =0x00000245
	bl unk_3b1c
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #0xc
	strb r0, [r1]
	b _0808FF02
	.align 2, 0
_0808FE9C: .4byte 0x00000245
_0808FEA0:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #4
	bne _0808FF02
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0808FEEC @ =gWrittenToBldalpha_L
	ldrh r0, [r2]
	cmp r0, #0xf
	bhi _0808FEBC
	adds r0, #1
	strh r0, [r2]
_0808FEBC:
	ldr r1, _0808FEF0 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	beq _0808FEC8
	subs r0, #1
	strh r0, [r1]
_0808FEC8:
	ldrh r0, [r2]
	cmp r0, #0x10
	bne _0808FF02
	ldrh r0, [r1]
	cmp r0, #0
	bne _0808FF02
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0808FEF4 @ =0x0000FDFF
	ands r0, r1
	strh r0, [r2]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #0xd
	strb r0, [r1]
	b _0808FF02
	.align 2, 0
_0808FEEC: .4byte gWrittenToBldalpha_L
_0808FEF0: .4byte gWrittenToBldalpha_R
_0808FEF4: .4byte 0x0000FDFF
_0808FEF8:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r1, r4, r5
_0808FEFE:
	movs r0, #0
_0808FF00:
	strh r0, [r1]
_0808FF02:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _0808FF30
_0808FF0C:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrh r0, [r2]
	cmp r0, #0x50
	bne _0808FF28
	movs r1, #0
	strh r1, [r2]
	ldr r0, _0808FF3C @ =gWrittenToBldy
	strh r1, [r0]
	ldr r1, _0808FF40 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r6, #1
_0808FF28:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808FF30:
	adds r0, r6, #0
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0808FF3C: .4byte gWrittenToBldy
_0808FF40: .4byte 0x04000050

	thumb_func_start NewFileIntroArrivingAtBsl
NewFileIntroArrivingAtBsl: @ 0x0808FF44
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _0808FF5C @ =gNonGameplayRam
	ldrh r0, [r5, #8]
	cmp r0, #1
	beq _0808FF74
	cmp r0, #1
	bgt _0808FF60
	cmp r0, #0
	beq _0808FF6A
	b _0808FFCC
	.align 2, 0
_0808FF5C: .4byte gNonGameplayRam
_0808FF60:
	cmp r0, #2
	beq _0808FF90
	cmp r0, #3
	beq _0808FFAC
	b _0808FFCC
_0808FF6A:
	bl NewFileIntroArrivingAtBslInit
	movs r0, #1
	strh r0, [r5, #8]
	b _0808FFCC
_0808FF74:
	ldr r4, _0808FF8C @ =gWrittenToBldy
	strh r6, [r4]
	movs r0, #0x91
	lsls r0, r0, #2
	bl SoundPlay
	ldrh r0, [r4]
	cmp r0, #0
	bne _0808FFCC
	movs r0, #2
	strh r0, [r5, #8]
	b _0808FFCC
	.align 2, 0
_0808FF8C: .4byte gWrittenToBldy
_0808FF90:
	bl NewFileIntroArrivingAtBslProcess
	cmp r0, #0
	beq _0808FFCC
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r5, r1
	strb r6, [r0]
	subs r1, #1
	adds r0, r5, r1
	strb r6, [r0]
	movs r0, #3
	strh r0, [r5, #8]
	b _0808FFCC
_0808FFAC:
	ldr r1, _0808FFBC @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0808FFC0
	adds r0, #1
	strh r0, [r1]
	b _0808FFC4
	.align 2, 0
_0808FFBC: .4byte gWrittenToBldy
_0808FFC0:
	strh r6, [r5, #8]
	movs r6, #1
_0808FFC4:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0808FFCC:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start NewFileIntroProcessSamusShipArrivingAtBsl
NewFileIntroProcessSamusShipArrivingAtBsl: @ 0x0808FFD4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	adds r1, r0, #1
	movs r5, #0
	movs r6, #0
	strh r1, [r4, #0xa]
	ldrb r2, [r4, #0x14]
	cmp r2, #0
	bne _08090006
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	beq _0808FFFC
	b _0809021E
_0808FFFC:
	strh r2, [r4, #0xa]
	strb r5, [r4, #0x12]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _0809021E
_08090006:
	cmp r2, #1
	bne _08090056
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08090020
	strb r5, [r4, #0x13]
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
_08090020:
	ldrh r0, [r4, #0xa]
	lsrs r0, r0, #3
	ldrh r1, [r4]
	subs r2, r1, r0
	strh r2, [r4, #0xc]
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	beq _0809003C
	b _0809021E
_0809003C:
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	beq _08090044
	b _0809021E
_08090044:
	strb r5, [r4, #0x12]
	strh r2, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	strb r5, [r4, #0x13]
	strh r6, [r4, #0xa]
	movs r0, #2
	strb r0, [r4, #0x14]
	b _0809021E
_08090056:
	cmp r2, #2
	bne _0809008E
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _08090072
	movs r7, #0xc
	ldrsh r1, [r4, r7]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #6
	bl NewFileIntroArrivingAtBslSetupOam
	b _0809007C
_08090072:
	cmp r0, #4
	bne _08090082
	strh r6, [r4, #0xa]
	movs r0, #3
	strb r0, [r4, #0x14]
_0809007C:
	ldrb r0, [r4, #0x15]
	subs r0, #1
	strb r0, [r4, #0x15]
_08090082:
	ldrh r0, [r4, #6]
	subs r0, #1
	movs r1, #0
	strh r0, [r4, #6]
	strb r1, [r4, #0x12]
	b _0809021E
_0809008E:
	cmp r2, #3
	bne _080900D2
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	mov r2, sp
	adds r2, #2
	movs r0, #2
	mov r1, sp
	bl NewFileIntroGetPositionAndSlotOfOamByType
	ldrb r0, [r4, #0x15]
	cmp r0, #0xf0
	bls _080900AE
	subs r0, #1
	strb r0, [r4, #0x15]
_080900AE:
	ldrh r2, [r4, #0xa]
	lsls r0, r2, #0x10
	lsrs r3, r0, #0x10
	lsrs r0, r0, #0x11
	ldrh r1, [r4, #2]
	subs r1, r1, r0
	strh r1, [r4, #0xe]
	lsls r2, r2, #1
	ldrh r0, [r4]
	subs r0, r0, r2
	strh r0, [r4, #0xc]
	cmp r3, #0xa
	bne _08090174
	strh r6, [r4, #0xa]
	strh r0, [r4]
	strh r1, [r4, #2]
	movs r0, #4
	b _08090172
_080900D2:
	cmp r2, #4
	bne _08090120
	ldrh r0, [r4, #6]
	subs r0, #4
	strh r0, [r4, #6]
	mov r2, sp
	adds r2, #2
	movs r0, #2
	mov r1, sp
	bl NewFileIntroGetPositionAndSlotOfOamByType
	ldrb r0, [r4, #0x15]
	cmp r0, #0xf0
	bls _080900F2
	subs r0, #1
	strb r0, [r4, #0x15]
_080900F2:
	ldrh r1, [r4, #2]
	ldrh r0, [r4, #0xa]
	subs r3, r1, r0
	strh r3, [r4, #0xe]
	lsls r0, r0, #2
	ldrh r1, [r4]
	subs r2, r1, r0
	strh r2, [r4, #0xc]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r7, #0xc
	ldrsh r1, [r4, r7]
	subs r0, r0, r1
	movs r1, #0x14
	rsbs r1, r1, #0
	cmp r0, r1
	ble _08090174
	strh r6, [r4, #0xa]
	strh r2, [r4]
	strh r3, [r4, #2]
	movs r0, #5
	b _08090172
_08090120:
	cmp r2, #5
	bne _08090178
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	mov r2, sp
	adds r2, #2
	movs r0, #2
	mov r1, sp
	bl NewFileIntroGetPositionAndSlotOfOamByType
	ldrb r1, [r4, #0x15]
	adds r0, r1, #0
	subs r0, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbe
	bls _08090148
	adds r0, r1, #1
	strb r0, [r4, #0x15]
_08090148:
	ldrh r1, [r4, #0xa]
	lsrs r2, r1, #1
	ldrh r0, [r4, #2]
	subs r3, r0, r2
	strh r3, [r4, #0xe]
	lsls r1, r1, #1
	ldrh r0, [r4]
	subs r2, r0, r1
	strh r2, [r4, #0xc]
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r7, #0xc
	ldrsh r1, [r4, r7]
	subs r0, r0, r1
	cmp r0, #0xa
	ble _08090174
	strh r6, [r4, #0xa]
	strh r2, [r4]
	strh r3, [r4, #2]
	movs r0, #6
_08090172:
	strb r0, [r4, #0x14]
_08090174:
	strb r5, [r4, #0x12]
	b _0809021E
_08090178:
	cmp r2, #6
	bne _080901BA
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x12
	ldrh r0, [r4, #2]
	subs r3, r0, r2
	strh r3, [r4, #0xe]
	lsrs r1, r1, #0x11
	ldrh r0, [r4]
	subs r1, r0, r1
	strh r1, [r4, #0xc]
	ldrb r2, [r4, #0x15]
	adds r0, r2, #0
	subs r0, #0xa
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xbe
	bls _080901A8
	adds r0, r2, #1
	strb r0, [r4, #0x15]
	b _080901B4
_080901A8:
	strh r6, [r4, #0xa]
	strb r5, [r4, #0x13]
	strh r1, [r4]
	strh r3, [r4, #2]
	movs r0, #7
	strb r0, [r4, #0x14]
_080901B4:
	movs r0, #0
	strb r0, [r4, #0x12]
	b _0809021E
_080901BA:
	cmp r2, #7
	bne _0809021E
	ldrb r1, [r4, #0x15]
	adds r0, r1, #0
	subs r0, #0x10
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb8
	bls _080901E0
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080901E0
	strb r5, [r4, #0x13]
	adds r0, r1, #1
	strb r0, [r4, #0x15]
_080901E0:
	ldrh r0, [r4, #0xa]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x12
	ldrh r1, [r4, #2]
	subs r1, r1, r2
	movs r2, #0
	strh r1, [r4, #0xe]
	lsrs r0, r0, #0x11
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bgt _0809021C
	strb r2, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
	ldr r0, _08090240 @ =gNonGameplayRam
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r0, r3
	movs r1, #0xe
	strb r1, [r0]
_0809021C:
	strb r2, [r4, #0x12]
_0809021E:
	movs r7, #6
	ldrsh r1, [r4, r7]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bgt _08090238
	ldrb r0, [r4, #0x18]
	movs r1, #7
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x18]
_08090238:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090240: .4byte gNonGameplayRam

	thumb_func_start NewFileIntroProcessBslPreview
NewFileIntroProcessBslPreview: @ 0x08090244
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x13]
	adds r0, #1
	strb r0, [r1, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _08090260
	movs r0, #0
	strb r0, [r1, #0x13]
	ldrh r0, [r1, #0xc]
	adds r0, #1
	strh r0, [r1, #0xc]
_08090260:
	pop {r0}
	bx r0

	thumb_func_start NewFileIntroProcessSamusShipArrivingAtBslThrusters
NewFileIntroProcessSamusShipArrivingAtBslThrusters: @ 0x08090264
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #0x12]
	cmp r0, r2
	bne _08090284
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _08090284
	strb r1, [r4, #0x11]
	strb r1, [r4, #0x12]
_08090284:
	ldrb r0, [r4, #0x13]
	adds r0, #1
	movs r6, #0
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _08090296
	b _08090406
_08090296:
	strb r6, [r4, #0x13]
	ldrb r0, [r4, #0x10]
	cmp r0, #4
	beq _080902B6
	cmp r0, #4
	bgt _080902A8
	cmp r0, #3
	beq _080902AE
	b _08090406
_080902A8:
	cmp r0, #5
	beq _0809030C
	b _08090406
_080902AE:
	mov r5, sp
	adds r5, #2
	movs r0, #4
	b _080902BC
_080902B6:
	mov r5, sp
	adds r5, #2
	movs r0, #5
_080902BC:
	mov r1, sp
	adds r2, r5, #0
	bl NewFileIntroGetPositionAndSlotOfOamByType
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x14
	beq _08090322
	ldr r1, _08090304 @ =gNonGameplayRam
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, _08090308 @ =0x00000222
	adds r1, r0, r2
	ldrh r1, [r1]
	strh r1, [r4, #6]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	movs r1, #6
	ands r1, r0
	ldrb r2, [r4, #0x18]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x18]
	mov r0, sp
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	ldrh r0, [r5]
	strh r0, [r4, #0xe]
	b _08090406
	.align 2, 0
_08090304: .4byte gNonGameplayRam
_08090308: .4byte 0x00000222
_0809030C:
	mov r5, sp
	adds r5, #2
	movs r0, #1
	mov r1, sp
	adds r2, r5, #0
	bl NewFileIntroGetPositionAndSlotOfOamByType
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x14
	bne _08090330
_08090322:
	strb r6, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
	b _08090406
_08090330:
	ldr r1, _08090380 @ =gNonGameplayRam
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r3, r0, r1
	ldr r2, _08090384 @ =0x00000222
	adds r0, r3, r2
	ldrh r0, [r0]
	strh r0, [r4, #6]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r0, [r0]
	movs r1, #6
	ands r1, r0
	ldrb r2, [r4, #0x18]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r2, #0x8c
	lsls r2, r2, #2
	adds r0, r3, r2
	ldrb r0, [r0]
	cmp r0, #1
	bhi _080903FC
	ldrh r0, [r5]
	strh r0, [r4, #0xe]
	ldr r1, _08090388 @ =0x0000022D
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #8
	bhi _08090400
	lsls r0, r0, #2
	ldr r1, _0809038C @ =_08090390
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08090380: .4byte gNonGameplayRam
_08090384: .4byte 0x00000222
_08090388: .4byte 0x0000022D
_0809038C: .4byte _08090390
_08090390: @ jump table
	.4byte _080903B4 @ case 0
	.4byte _080903BC @ case 1
	.4byte _080903C4 @ case 2
	.4byte _080903CC @ case 3
	.4byte _080903D4 @ case 4
	.4byte _080903DC @ case 5
	.4byte _080903E4 @ case 6
	.4byte _080903EC @ case 7
	.4byte _080903F4 @ case 8
_080903B4:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #0xc
	b _08090404
_080903BC:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #0xa
	b _08090404
_080903C4:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #8
	b _08090404
_080903CC:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #6
	b _08090404
_080903D4:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #5
	b _08090404
_080903DC:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #4
	b _08090404
_080903E4:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #3
	b _08090404
_080903EC:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #2
	b _08090404
_080903F4:
	mov r0, sp
	ldrh r0, [r0]
	adds r0, #1
	b _08090404
_080903FC:
	ldrh r0, [r5]
	strh r0, [r4, #0xe]
_08090400:
	mov r0, sp
	ldrh r0, [r0]
_08090404:
	strh r0, [r4, #0xc]
_08090406:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessSamusShipArrivingAtBslThrusterExplosion
NewFileIntroProcessSamusShipArrivingAtBslThrusterExplosion: @ 0x08090410
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _08090436
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _08090436
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_08090436:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_9043c
unk_9043c: @ 0x0809043C
	movs r1, #0
	strb r1, [r0, #0x10]
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroProcessSamusArrivingAtBslScrolling
NewFileIntroProcessSamusArrivingAtBslScrolling: @ 0x08090444
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x13]
	adds r0, #1
	strb r0, [r1, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _08090470
	movs r0, #0
	strb r0, [r1, #0x13]
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0xf
	bgt _08090470
	adds r0, r2, #1
	strh r0, [r1, #0xc]
	ldr r1, _08090474 @ =0x03001230
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08090470:
	pop {r0}
	bx r0
	.align 2, 0
_08090474: .4byte 0x03001230

	thumb_func_start unk_90478
unk_90478: @ 0x08090478
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x13]
	adds r0, #1
	strb r0, [r1, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bne _080904A4
	movs r0, #0
	strb r0, [r1, #0x13]
	ldrh r2, [r1, #0xc]
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0xf
	bgt _080904A4
	adds r0, r2, #1
	strh r0, [r1, #0xc]
	ldr r1, _080904A8 @ =0x0300122C
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_080904A4:
	pop {r0}
	bx r0
	.align 2, 0
_080904A8: .4byte 0x0300122C

	thumb_func_start NewFileIntroProcessAdamPanel
NewFileIntroProcessAdamPanel: @ 0x080904AC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #0x14]
	cmp r1, #0
	bne _080904E8
	strb r1, [r4, #0x12]
	strb r1, [r4, #0x11]
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0x80
	ble _080904CC
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r4, #0xe]
	b _0809063E
_080904CC:
	movs r0, #0x80
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #0x10]
	cmp r0, #0x14
	bne _080904DC
	ldr r0, _080904E4 @ =0x0000020A
	bl SoundPlay
_080904DC:
	movs r0, #1
	strb r0, [r4, #0x14]
	b _0809063E
	.align 2, 0
_080904E4: .4byte 0x0000020A
_080904E8:
	cmp r1, #1
	bne _08090570
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r5, [r4, #0x12]
	cmp r0, r5
	bne _08090524
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _08090508
	strb r1, [r4, #0x12]
	movs r0, #2
	strb r0, [r4, #0x14]
_08090508:
	ldrb r0, [r4, #0x10]
	cmp r0, #0x14
	beq _08090510
	b _0809063E
_08090510:
	ldrb r0, [r4, #0x11]
	cmp r0, #0xa
	bne _08090524
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r5, #0xe
	ldrsh r2, [r4, r5]
	movs r0, #0x16
	bl NewFileIntroArrivingAtBslSetupOam
_08090524:
	ldrb r0, [r4, #0x10]
	cmp r0, #0x14
	beq _0809052C
	b _0809063E
_0809052C:
	ldrb r0, [r4, #0x11]
	cmp r0, #0xb
	beq _08090534
	b _0809063E
_08090534:
	ldrb r0, [r4, #0x12]
	cmp r0, #0xf
	beq _0809053C
	b _0809063E
_0809053C:
	ldr r2, _08090560 @ =gNonGameplayRam
	ldr r0, _08090564 @ =0x00000212
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	strh r0, [r2, #0xe]
	strh r0, [r2, #0xc]
	ldr r1, _08090568 @ =0x0879C5A4
	ldr r0, _0809056C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x48]
	str r0, [r2]
	b _0809063E
	.align 2, 0
_08090560: .4byte gNonGameplayRam
_08090564: .4byte 0x00000212
_08090568: .4byte 0x0879C5A4
_0809056C: .4byte 0x03000011
_08090570:
	cmp r1, #2
	bne _0809058E
	movs r1, #0
	strb r1, [r4, #0x12]
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809063E
	strb r1, [r4, #0x13]
	movs r0, #3
	strb r0, [r4, #0x14]
	b _0809063E
_0809058E:
	cmp r1, #3
	bne _080905D8
	movs r1, #0
	strb r1, [r4, #0x12]
	ldr r0, _080905B8 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #4
	bne _0809063E
	strb r1, [r4, #0x11]
	ldrb r0, [r4, #0x10]
	cmp r0, #0x14
	bne _080905C4
	ldr r0, _080905BC @ =0x085F4310
	str r0, [r4, #0x1c]
	ldr r0, _080905C0 @ =0x0000020B
	bl SoundPlay
	b _080905CC
	.align 2, 0
_080905B8: .4byte gNonGameplayRam
_080905BC: .4byte 0x085F4310
_080905C0: .4byte 0x0000020B
_080905C4:
	cmp r0, #0x15
	bne _080905CC
	ldr r0, _080905D4 @ =0x085F43E0
	str r0, [r4, #0x1c]
_080905CC:
	movs r0, #4
	strb r0, [r4, #0x14]
	b _0809063E
	.align 2, 0
_080905D4: .4byte 0x085F43E0
_080905D8:
	cmp r1, #4
	bne _08090608
	ldr r0, [r4, #0x10]
	ldr r1, _08090600 @ =0x00FFFF00
	ands r0, r1
	ldr r1, _08090604 @ =0x00030B00
	cmp r0, r1
	bne _0809063E
	ldrb r0, [r4, #0x10]
	cmp r0, #0x14
	bne _080905F4
	movs r0, #0x16
	bl SpecialCutsceneDestroyOamOfType
_080905F4:
	movs r0, #0
	strb r0, [r4, #0x12]
	movs r0, #5
	strb r0, [r4, #0x14]
	b _0809063E
	.align 2, 0
_08090600: .4byte 0x00FFFF00
_08090604: .4byte 0x00030B00
_08090608:
	cmp r1, #5
	bne _0809063E
	movs r3, #0
	strb r3, [r4, #0x12]
	ldrh r2, [r4, #0xe]
	movs r5, #0xe
	ldrsh r0, [r4, r5]
	cmp r0, #0xbf
	bgt _08090622
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r4, #0xe]
	b _0809063E
_08090622:
	ldrb r0, [r4, #0x10]
	cmp r0, #0x14
	bne _08090632
	ldr r0, _08090644 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r0, r2
	strb r1, [r0]
_08090632:
	strb r3, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_0809063E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08090644: .4byte gNonGameplayRam

	thumb_func_start unk_90648
unk_90648: @ 0x08090648
	push {r4, lr}
	adds r2, r0, #0
	ldrb r3, [r2, #0x11]
	lsls r1, r3, #3
	ldr r0, [r2, #0x1c]
	adds r4, r0, r1
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	bne _08090688
	cmp r3, #3
	bne _0809066A
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
	ldr r0, _08090680 @ =0x085F48B8
	str r0, [r2, #0x1c]
	movs r0, #1
	strb r0, [r2, #0x14]
_0809066A:
	ldr r0, _08090684 @ =gNonGameplayRam
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #4
	bne _080906C8
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
	b _080906A0
	.align 2, 0
_08090680: .4byte 0x085F48B8
_08090684: .4byte gNonGameplayRam
_08090688:
	cmp r1, #1
	bne _080906B4
	ldr r0, _080906AC @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #4
	bne _080906C8
	movs r0, #0
	strb r0, [r2, #0x12]
	strb r0, [r2, #0x11]
_080906A0:
	ldr r0, _080906B0 @ =0x085F4470
	str r0, [r2, #0x1c]
	movs r0, #2
	strb r0, [r2, #0x14]
	b _080906C8
	.align 2, 0
_080906AC: .4byte gNonGameplayRam
_080906B0: .4byte 0x085F4470
_080906B4:
	cmp r1, #2
	bne _080906C8
	ldrb r0, [r4, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _080906C8
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	bne _080906C8
	strb r0, [r2, #0x12]
_080906C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessAdamTextCursor
NewFileIntroProcessAdamTextCursor: @ 0x080906D0
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, _080906EC @ =gNonGameplayRam
	ldr r0, [r3]
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	bne _080906F0
	movs r0, #0x91
	lsls r0, r0, #1
	strh r0, [r2, #0xc]
	b _08090752
	.align 2, 0
_080906EC: .4byte gNonGameplayRam
_080906F0:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	beq _08090734
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _08090718
	movs r0, #0
	movs r1, #0x91
	lsls r1, r1, #1
	strh r1, [r2, #0xc]
	strb r0, [r2, #0x12]
	strb r0, [r2, #0x11]
	ldr r0, _08090714 @ =0x085F1DA0
	str r0, [r2, #0x1c]
	b _08090752
	.align 2, 0
_08090714: .4byte 0x085F1DA0
_08090718:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08090734
	movs r0, #0x78
	strh r0, [r2, #0xc]
	movs r0, #0x9a
	strh r0, [r2, #0xe]
	ldr r0, _08090730 @ =0x085F1C50
	str r0, [r2, #0x1c]
	b _08090752
	.align 2, 0
_08090730: .4byte 0x085F1C50
_08090734:
	ldrh r0, [r3, #0xc]
	ldr r4, _08090758 @ =0x00000212
	adds r1, r3, r4
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, #0xe
	movs r1, #0
	strh r0, [r2, #0xc]
	ldrh r0, [r3, #0xe]
	lsls r0, r0, #3
	adds r0, #0x84
	strh r0, [r2, #0xe]
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
_08090752:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08090758: .4byte 0x00000212

	thumb_func_start NewFileIntroProcessBslPopUp
NewFileIntroProcessBslPopUp: @ 0x0809075C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r6, r1, r0
	ldrb r5, [r4, #0x14]
	cmp r5, #0
	bne _080907A0
	ldr r0, [r4, #0x10]
	ldr r1, _08090798 @ =0x00FFFF00
	ands r0, r1
	ldr r1, _0809079C @ =0x00010100
	cmp r0, r1
	bne _08090782
	movs r0, #0x8e
	lsls r0, r0, #1
	bl SoundPlay
_08090782:
	ldrb r0, [r6, #4]
	ldrb r1, [r4, #0x12]
	cmp r0, r1
	bne _080907F2
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	bne _080907F2
	strb r5, [r4, #0x12]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _080907F2
	.align 2, 0
_08090798: .4byte 0x00FFFF00
_0809079C: .4byte 0x00010100
_080907A0:
	cmp r5, #1
	bne _080907D4
	movs r1, #0
	strb r1, [r4, #0x12]
	ldr r0, _080907C8 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #4
	bne _080907F2
	strb r1, [r4, #0x11]
	ldr r0, _080907CC @ =0x085F4258
	str r0, [r4, #0x1c]
	ldr r0, _080907D0 @ =0x0000011D
	bl SoundPlay
	movs r0, #2
	strb r0, [r4, #0x14]
	b _080907F2
	.align 2, 0
_080907C8: .4byte gNonGameplayRam
_080907CC: .4byte 0x085F4258
_080907D0: .4byte 0x0000011D
_080907D4:
	cmp r5, #2
	bne _080907F2
	ldrb r0, [r6, #4]
	ldrb r1, [r4, #0x12]
	cmp r0, r1
	bne _080907F2
	ldrb r1, [r6, #0xc]
	cmp r1, #0
	bne _080907F2
	strb r1, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_080907F2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start NewFileIntroProcessMonologueCursor
NewFileIntroProcessMonologueCursor: @ 0x080907F8
	push {lr}
	adds r2, r0, #0
	ldr r3, _08090818 @ =gNonGameplayRam
	ldr r0, [r3]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809081C
	movs r0, #0x76
	strh r0, [r2, #0xc]
	ldrh r0, [r3, #0xe]
	lsls r0, r0, #3
	adds r0, #0x18
	strh r0, [r2, #0xe]
	b _08090822
	.align 2, 0
_08090818: .4byte gNonGameplayRam
_0809081C:
	movs r0, #0x82
	lsls r0, r0, #1
	strh r0, [r2, #0xc]
_08090822:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroArrivingAtBslSetupOam
NewFileIntroArrivingAtBslSetupOam: @ 0x08090828
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	movs r0, #0
	mov r8, r0
	ldr r1, _0809087C @ =gNonGameplayRam
	movs r2, #0x8b
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	beq _08090872
_08090854:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0x13
	bhi _08090878
	lsls r0, r0, #3
	add r0, r8
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _08090854
_08090872:
	mov r1, r8
	cmp r1, #0x13
	bls _08090880
_08090878:
	movs r0, #0x14
	b _08090C4C
	.align 2, 0
_0809087C: .4byte gNonGameplayRam
_08090880:
	movs r0, #0
	str r0, [sp]
	ldr r1, _08090908 @ =0x040000D4
	mov r3, sp
	str r3, [r1]
	mov r0, r8
	lsls r2, r0, #3
	adds r0, r2, r0
	lsls r6, r0, #2
	ldr r3, _0809090C @ =0x030016A0
	mov ip, r3
	adds r0, r6, r3
	str r0, [r1, #4]
	ldr r0, _08090910 @ =0x85000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08090914 @ =0xFFFFFDE4
	add r0, ip
	adds r3, r6, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	strh r5, [r0]
	adds r1, #2
	adds r0, r3, r1
	mov r1, sb
	strh r1, [r0]
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r0, r3, r1
	strb r4, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r5, r3, r0
	ldrb r1, [r5]
	movs r0, #1
	orrs r1, r0
	strb r1, [r5]
	cmp r4, #1
	bne _08090928
	ldr r0, _08090918 @ =0x00000222
	adds r1, r3, r0
	subs r0, #0xa2
	strh r0, [r1]
	ldrb r0, [r5]
	movs r1, #6
	orrs r0, r1
	strb r0, [r5]
	ldr r1, _0809091C @ =0x00000236
	adds r2, r3, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _08090920 @ =0x085F4D3C
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _08090924 @ =NewFileIntroProcessSamusShipArrivingAtBsl
	str r1, [r0]
	b _08090C4A
	.align 2, 0
_08090908: .4byte 0x040000D4
_0809090C: .4byte 0x030016A0
_08090910: .4byte 0x85000009
_08090914: .4byte 0xFFFFFDE4
_08090918: .4byte 0x00000222
_0809091C: .4byte 0x00000236
_08090920: .4byte 0x085F4D3C
_08090924: .4byte NewFileIntroProcessSamusShipArrivingAtBsl
_08090928:
	cmp r4, #2
	bne _08090960
	ldr r0, _08090954 @ =0x00000236
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _08090958 @ =0x085F4D94
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _0809095C @ =NewFileIntroProcessBslPreview
	str r1, [r0]
	b _08090C4A
	.align 2, 0
_08090954: .4byte 0x00000236
_08090958: .4byte 0x085F4D94
_0809095C: .4byte NewFileIntroProcessBslPreview
_08090960:
	cmp r4, #3
	beq _0809096C
	cmp r4, #4
	beq _0809096C
	cmp r4, #5
	bne _080909B4
_0809096C:
	ldr r0, _080909A4 @ =0x00000222
	adds r1, r3, r0
	subs r0, #0xa2
	strh r0, [r1]
	ldr r1, _080909A8 @ =0x00000236
	adds r2, r3, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r5]
	movs r1, #6
	orrs r0, r1
	strb r0, [r5]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _080909AC @ =0x085F4E34
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _080909B0 @ =NewFileIntroProcessSamusShipArrivingAtBslThrusters
	str r1, [r0]
	b _08090C4A
	.align 2, 0
_080909A4: .4byte 0x00000222
_080909A8: .4byte 0x00000236
_080909AC: .4byte 0x085F4E34
_080909B0: .4byte NewFileIntroProcessSamusShipArrivingAtBslThrusters
_080909B4:
	cmp r4, #6
	bne _080909EC
	ldr r0, _080909E0 @ =0x00000236
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _080909E4 @ =0x085F4DA4
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _080909E8 @ =NewFileIntroProcessSamusShipArrivingAtBslThrusterExplosion
	str r1, [r0]
	b _08090C4A
	.align 2, 0
_080909E0: .4byte 0x00000236
_080909E4: .4byte 0x085F4DA4
_080909E8: .4byte NewFileIntroProcessSamusShipArrivingAtBslThrusterExplosion
_080909EC:
	cmp r4, #7
	bne _08090A08
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _08090A04 @ =NewFileIntroProcessSamusArrivingAtBslScrolling
	str r1, [r0]
	b _08090C4A
	.align 2, 0
_08090A04: .4byte NewFileIntroProcessSamusArrivingAtBslScrolling
_08090A08:
	cmp r4, #8
	bne _08090A24
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _08090A20 @ =unk_90478
	str r1, [r0]
	b _08090C4A
	.align 2, 0
_08090A20: .4byte unk_90478
_08090A24:
	cmp r4, #0x14
	bne _08090A4C
	ldr r1, _08090A44 @ =0x00000236
	adds r2, r3, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _08090A48 @ =0x085F42A8
	b _08090A6A
	.align 2, 0
_08090A44: .4byte 0x00000236
_08090A48: .4byte 0x085F42A8
_08090A4C:
	cmp r4, #0x15
	bne _08090A84
	ldr r0, _08090A78 @ =0x00000236
	adds r2, r3, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r6, r0
	ldr r1, _08090A7C @ =0x085F4378
_08090A6A:
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r6, r0
	ldr r1, _08090A80 @ =NewFileIntroProcessAdamPanel
	str r1, [r0]
	b _08090C4A
	.align 2, 0
_08090A78: .4byte 0x00000236
_08090A7C: .4byte 0x085F4378
_08090A80: .4byte NewFileIntroProcessAdamPanel
_08090A84:
	cmp r4, #0x16
	bne _08090AC8
	mov r1, r8
	adds r3, r2, r1
	lsls r3, r3, #2
	adds r2, r3, r7
	ldr r0, _08090ABC @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _08090AC0 @ =0x085F4448
	str r1, [r0]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r3, r3, r0
	ldr r0, _08090AC4 @ =unk_90648
	str r0, [r3]
	b _08090C4A
	.align 2, 0
_08090ABC: .4byte 0x00000236
_08090AC0: .4byte 0x085F4448
_08090AC4: .4byte unk_90648
_08090AC8:
	cmp r4, #0x17
	bne _08090AF0
	add r2, r8
	lsls r2, r2, #2
	movs r3, #0x8e
	lsls r3, r3, #2
	adds r0, r7, r3
	adds r0, r2, r0
	ldr r1, _08090AE8 @ =0x085F1DA0
	str r1, [r0]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r2, r2, r0
	ldr r0, _08090AEC @ =NewFileIntroProcessAdamTextCursor
	b _08090C48
	.align 2, 0
_08090AE8: .4byte 0x085F1DA0
_08090AEC: .4byte NewFileIntroProcessAdamTextCursor
_08090AF0:
	cmp r4, #0x18
	bne _08090B24
	mov r0, r8
	adds r3, r2, r0
	lsls r3, r3, #2
	adds r2, r3, r7
	ldr r1, _08090B1C @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _08090B20 @ =0x085F48E8
	b _08090BC4
	.align 2, 0
_08090B1C: .4byte 0x00000236
_08090B20: .4byte 0x085F48E8
_08090B24:
	cmp r4, #0x19
	bne _08090B58
	mov r0, r8
	adds r3, r2, r0
	lsls r3, r3, #2
	adds r2, r3, r7
	ldr r1, _08090B50 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _08090B54 @ =0x085F49B8
	b _08090BC4
	.align 2, 0
_08090B50: .4byte 0x00000236
_08090B54: .4byte 0x085F49B8
_08090B58:
	cmp r4, #0x1a
	bne _08090B9C
	mov r0, r8
	adds r3, r2, r0
	lsls r3, r3, #2
	adds r2, r3, r7
	ldr r1, _08090B90 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _08090B94 @ =0x085F4200
	str r1, [r0]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r3, r3, r0
	ldr r0, _08090B98 @ =NewFileIntroProcessBslPopUp
	str r0, [r3]
	b _08090C4A
	.align 2, 0
_08090B90: .4byte 0x00000236
_08090B94: .4byte 0x085F4200
_08090B98: .4byte NewFileIntroProcessBslPopUp
_08090B9C:
	cmp r4, #0x1e
	bne _08090BE0
	mov r0, r8
	adds r3, r2, r0
	lsls r3, r3, #2
	adds r2, r3, r7
	ldr r1, _08090BD4 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _08090BD8 @ =0x085F49E8
_08090BC4:
	str r1, [r0]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r3, r3, r0
	ldr r0, _08090BDC @ =unk_90d5c
	str r0, [r3]
	b _08090C4A
	.align 2, 0
_08090BD4: .4byte 0x00000236
_08090BD8: .4byte 0x085F49E8
_08090BDC: .4byte unk_90d5c
_08090BE0:
	cmp r4, #0x64
	bne _08090C24
	mov r0, r8
	adds r3, r2, r0
	lsls r3, r3, #2
	adds r2, r3, r7
	ldr r1, _08090C18 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r0, r3, r0
	ldr r1, _08090C1C @ =0x085F1C50
	str r1, [r0]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r3, r3, r0
	ldr r0, _08090C20 @ =NewFileIntroProcessMonologueCursor
	str r0, [r3]
	b _08090C4A
	.align 2, 0
_08090C18: .4byte 0x00000236
_08090C1C: .4byte 0x085F1C50
_08090C20: .4byte NewFileIntroProcessMonologueCursor
_08090C24:
	cmp r4, #0xff
	bne _08090C4A
	add r2, r8
	lsls r2, r2, #2
	adds r1, r2, r7
	movs r3, #0x8d
	lsls r3, r3, #2
	adds r1, r1, r3
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r7, r1
	adds r2, r2, r0
	ldr r0, _08090C5C @ =unk_9043c
_08090C48:
	str r0, [r2]
_08090C4A:
	mov r0, r8
_08090C4C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08090C5C: .4byte unk_9043c

	thumb_func_start NewFileIntroArrivingAtBslVblank
NewFileIntroArrivingAtBslVblank: @ 0x08090C60
	push {lr}
	ldr r1, _08090CC4 @ =0x040000D4
	ldr r0, _08090CC8 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08090CCC @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08090CD0 @ =0x04000052
	ldr r0, _08090CD4 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08090CD8 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08090CDC @ =0x04000054
	ldr r0, _08090CE0 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x44
	ldr r0, _08090CE4 @ =0x03001224
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08090CE8 @ =0x03001226
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #6
	ldr r0, _08090CEC @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08090CF0 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08090CF4 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08090CF8 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bl unk_98158
	pop {r0}
	bx r0
	.align 2, 0
_08090CC4: .4byte 0x040000D4
_08090CC8: .4byte gOamData
_08090CCC: .4byte 0x84000100
_08090CD0: .4byte 0x04000052
_08090CD4: .4byte gWrittenToBldalpha_L
_08090CD8: .4byte gWrittenToBldalpha_R
_08090CDC: .4byte 0x04000054
_08090CE0: .4byte gWrittenToBldy
_08090CE4: .4byte 0x03001224
_08090CE8: .4byte 0x03001226
_08090CEC: .4byte 0x0300122C
_08090CF0: .4byte 0x0300122E
_08090CF4: .4byte 0x03001230
_08090CF8: .4byte 0x03001232

	thumb_func_start NewFileIntroGetPositionAndSlotOfOamByType
NewFileIntroGetPositionAndSlotOfOamByType: @ 0x08090CFC
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0
	ldr r7, _08090D34 @ =gNonGameplayRam
	movs r6, #0x8b
	lsls r6, r6, #2
_08090D0C:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _08090D3C
	movs r5, #0x8a
	lsls r5, r5, #2
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r4, _08090D38 @ =0x0000022A
	adds r0, r3, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r1, #0
	b _08090D54
	.align 2, 0
_08090D34: .4byte gNonGameplayRam
_08090D38: .4byte 0x0000022A
_08090D3C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bls _08090D0C
	movs r5, #0x96
	lsls r5, r5, #1
	adds r0, r5, #0
	strh r0, [r4]
	movs r0, #0xc8
	strh r0, [r2]
	movs r0, #0x14
_08090D54:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_90d5c
unk_90d5c: @ 0x08090D5C
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroLandingOnBslInit
NewFileIntroLandingOnBslInit: @ 0x08090D60
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r3, _08090EC0 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08090EC4 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08090EC8 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08090ECC @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08090ED0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08090ED4 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _08090ED8 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r1, _08090EDC @ =gNonGameplayRam
	mov r8, r1
	str r1, [r4, #4]
	ldr r0, _08090EE0 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08090EE4 @ =0x085FAB54
	ldr r1, _08090EE8 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _08090EEC @ =0x085FFD08
	str r0, [r4]
	ldr r0, _08090EF0 @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _08090EF4 @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08090EF8 @ =0x085F7190
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _08090EFC @ =0x0860030C
	ldr r1, _08090F00 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _08090F04 @ =0x085FFF08
	ldr r1, _08090F08 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08090F0C @ =0x08598898
	ldr r1, _08090F10 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _08090F14 @ =0x085FF708
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08090F18 @ =0x0300122C
	strh r5, [r0]
	ldr r6, _08090F1C @ =0x0300122E
	movs r1, #0x28
	strh r1, [r6]
	ldr r0, _08090F20 @ =0x03001230
	strh r5, [r0]
	ldr r0, _08090F24 @ =0x03001232
	strh r5, [r0]
	ldr r0, _08090F28 @ =0x04000010
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
	strh r1, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	ldr r1, _08090F2C @ =0x04000008
	ldr r2, _08090F30 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _08090F34 @ =0x00001E01
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08090F38 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _08090F3C @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08090F40 @ =0x04000054
	strh r1, [r0]
	movs r0, #1
	movs r1, #0x78
	movs r2, #0
	movs r3, #0
	bl NewFileIntroLandingOnBslSetupOam
	ldrh r0, [r6]
	movs r2, #0x64
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xb
	movs r1, #0x80
	movs r3, #1
	bl NewFileIntroLandingOnBslSetupOam
	ldrh r0, [r6]
	movs r2, #0x48
	subs r2, r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0x80
	movs r3, #0
	bl NewFileIntroLandingOnBslSetupOam
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl NewFileIntroLandingOnBslSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _08090F44 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r0, _08090F48 @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _08090F4C @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08090F50 @ =NewFileIntroLandingOnBslVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08090EC0: .4byte 0x04000208
_08090EC4: .4byte 0x04000004
_08090EC8: .4byte 0x0000FFEF
_08090ECC: .4byte 0x04000200
_08090ED0: .4byte 0x0000FFFD
_08090ED4: .4byte unk_99940
_08090ED8: .4byte 0x040000D4
_08090EDC: .4byte gNonGameplayRam
_08090EE0: .4byte 0x85000150
_08090EE4: .4byte 0x085FAB54
_08090EE8: .4byte 0x06010000
_08090EEC: .4byte 0x085FFD08
_08090EF0: .4byte 0x05000200
_08090EF4: .4byte 0x84000080
_08090EF8: .4byte 0x085F7190
_08090EFC: .4byte 0x0860030C
_08090F00: .4byte 0x0600F000
_08090F04: .4byte 0x085FFF08
_08090F08: .4byte 0x0600F800
_08090F0C: .4byte 0x08598898
_08090F10: .4byte 0x0600E000
_08090F14: .4byte 0x085FF708
_08090F18: .4byte 0x0300122C
_08090F1C: .4byte 0x0300122E
_08090F20: .4byte 0x03001230
_08090F24: .4byte 0x03001232
_08090F28: .4byte 0x04000010
_08090F2C: .4byte 0x04000008
_08090F30: .4byte 0x00001C08
_08090F34: .4byte 0x00001E01
_08090F38: .4byte 0x00001F03
_08090F3C: .4byte gWrittenToBldy
_08090F40: .4byte 0x04000054
_08090F44: .4byte 0x0863A19C
_08090F48: .4byte 0x0600D000
_08090F4C: .4byte 0x85000400
_08090F50: .4byte NewFileIntroLandingOnBslVblank

	thumb_func_start NewFileIntroLandingOnBslProcess
NewFileIntroLandingOnBslProcess: @ 0x08090F54
	push {r4, r5, lr}
	movs r5, #0
	ldr r2, _08090F80 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #5
	bls _08090F76
	b _08091072
_08090F76:
	lsls r0, r0, #2
	ldr r1, _08090F84 @ =_08090F88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08090F80: .4byte gNonGameplayRam
_08090F84: .4byte _08090F88
_08090F88: @ jump table
	.4byte _08090FA0 @ case 0
	.4byte _08090FD0 @ case 1
	.4byte _08090FF0 @ case 2
	.4byte _08091016 @ case 3
	.4byte _08091022 @ case 4
	.4byte _08091046 @ case 5
_08090FA0:
	ldr r2, _08090FB0 @ =gWrittenToBldy
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _08090FB4
	subs r0, #1
	strh r0, [r2]
	b _0809103C
	.align 2, 0
_08090FB0: .4byte gWrittenToBldy
_08090FB4:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #1
	strb r0, [r1]
	movs r0, #0x1e
	movs r1, #0xd
	bl PlayMusic
	b _0809103C
_08090FD0:
	ldr r0, _08090FEC @ =0x0300122E
	ldrh r1, [r0]
	cmp r1, #0
	bne _0809103C
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r4, r2
	strh r1, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #2
	b _0809103A
	.align 2, 0
_08090FEC: .4byte 0x0300122E
_08090FF0:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #0x46
	bne _0809103C
	movs r0, #0
	strh r0, [r1]
	movs r0, #0xc
	movs r1, #0x80
	movs r2, #0x32
	movs r3, #0
	bl NewFileIntroLandingOnBslSetupOam
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #3
	b _0809103A
_08091016:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #0
	strh r0, [r1]
	b _0809103C
_08091022:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #0x5a
	bne _0809103C
	movs r0, #0
	strh r0, [r1]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #5
_0809103A:
	strb r0, [r1]
_0809103C:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _08091072
_08091046:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #2
	bne _0809106A
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08091064 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08091068
	adds r0, #1
	strh r0, [r1]
	b _0809106A
	.align 2, 0
_08091064: .4byte gWrittenToBldy
_08091068:
	movs r5, #1
_0809106A:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08091072:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NewFileIntroLandingOnBsl
NewFileIntroLandingOnBsl: @ 0x0809107C
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08091094 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _080910A8
	cmp r0, #1
	bgt _08091098
	cmp r0, #0
	beq _080910A2
	b _080910FC
	.align 2, 0
_08091094: .4byte gNonGameplayRam
_08091098:
	cmp r0, #2
	beq _080910C0
	cmp r0, #3
	beq _080910DC
	b _080910FC
_080910A2:
	bl NewFileIntroLandingOnBslInit
	b _080910B4
_080910A8:
	bl SpecialCutsceneFadeIn
	ldr r0, _080910BC @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _080910FC
_080910B4:
	movs r0, #2
	strh r0, [r4, #8]
	b _080910FC
	.align 2, 0
_080910BC: .4byte gWrittenToBldy
_080910C0:
	bl NewFileIntroLandingOnBslProcess
	cmp r0, #0
	beq _080910FC
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #3
	strh r0, [r4, #8]
	b _080910FC
_080910DC:
	ldr r1, _080910EC @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080910F0
	adds r0, #1
	strh r0, [r1]
	b _080910F4
	.align 2, 0
_080910EC: .4byte gWrittenToBldy
_080910F0:
	strh r5, [r4, #8]
	movs r5, #1
_080910F4:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_080910FC:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NewFileIntroProcessLandingOnBslScroll
NewFileIntroProcessLandingOnBslScroll: @ 0x08091104
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, _08091130 @ =gNonGameplayRam
	ldr r1, _08091134 @ =0x00000217
	adds r4, r0, r1
	movs r3, #0
	strb r3, [r4]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	bne _0809113C
	ldr r0, _08091138 @ =0x0300122E
	ldrh r0, [r0]
	movs r1, #0
	strh r0, [r2, #0xe]
	strb r1, [r2, #0x13]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _08091170
	.align 2, 0
_08091130: .4byte gNonGameplayRam
_08091134: .4byte 0x00000217
_08091138: .4byte 0x0300122E
_0809113C:
	cmp r1, #1
	bne _0809116E
	strb r3, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _08091170
	strb r3, [r2, #0x13]
	ldrh r1, [r2, #0xe]
	movs r5, #0xe
	ldrsh r0, [r2, r5]
	cmp r0, #0
	ble _08091168
	movs r0, #0xff
	strb r0, [r4]
	subs r1, #1
	strh r1, [r2, #0xe]
	ldr r0, _08091164 @ =0x0300122E
	strh r1, [r0]
	b _08091170
	.align 2, 0
_08091164: .4byte 0x0300122E
_08091168:
	strb r3, [r4]
	strb r3, [r2, #0x10]
	b _08091170
_0809116E:
	strb r3, [r2, #0x13]
_08091170:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessBslDoor
NewFileIntroProcessBslDoor: @ 0x08091178
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r5, [r4, #0x14]
	cmp r5, #0
	bne _080911AC
	movs r0, #6
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl NewFileIntroLandingOnBslSetupOam
	strb r5, [r4, #0x12]
	strb r5, [r4, #0x11]
	ldr r0, _080911A4 @ =0x085FE370
	str r0, [r4, #0x1c]
	ldr r0, _080911A8 @ =0x00000246
	bl unk_3b1c
	movs r0, #1
	strb r0, [r4, #0x14]
	b _080911FE
	.align 2, 0
_080911A4: .4byte 0x085FE370
_080911A8: .4byte 0x00000246
_080911AC:
	cmp r5, #1
	bne _080911CE
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #0x12]
	cmp r0, r2
	bne _080911FE
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080911FE
	strb r1, [r4, #0x12]
	movs r0, #2
	strb r0, [r4, #0x14]
	b _080911FE
_080911CE:
	cmp r5, #2
	bne _080911FE
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #4
	movs r3, #1
	bl NewFileIntroLandingOnBslSetupOam
	movs r2, #0xc
	ldrsh r1, [r4, r2]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #5
	movs r3, #1
	bl NewFileIntroLandingOnBslSetupOam
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	subs r0, #2
	ands r0, r1
	strb r0, [r4, #0x18]
_080911FE:
	ldr r0, _08091214 @ =gNonGameplayRam
	ldr r1, _08091218 @ =0x00000217
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r4, #0xe]
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091214: .4byte gNonGameplayRam
_08091218: .4byte 0x00000217

	thumb_func_start NewFileIntroProcessBslDoorLight
NewFileIntroProcessBslDoorLight: @ 0x0809121C
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bne _08091258
	movs r0, #0
	strh r0, [r3, #0xa]
	ldr r2, _0809124C @ =gNonGameplayRam
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08091250 @ =0x00000111
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #4
	bhi _08091254
	adds r0, #1
	b _08091256
	.align 2, 0
_0809124C: .4byte gNonGameplayRam
_08091250: .4byte 0x00000111
_08091254:
	movs r0, #0
_08091256:
	strb r0, [r1]
_08091258:
	ldrb r0, [r3, #0x13]
	adds r0, #1
	movs r4, #0
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _08091292
	strb r4, [r3, #0x13]
	ldr r2, _08091288 @ =gNonGameplayRam
	movs r0, #0x96
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _0809128C @ =0x0000012D
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #6
	bhi _08091290
	adds r0, #1
	strb r0, [r1]
	b _08091292
	.align 2, 0
_08091288: .4byte gNonGameplayRam
_0809128C: .4byte 0x0000012D
_08091290:
	strb r4, [r1]
_08091292:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start NewFileIntroProcessBslDoorTop
NewFileIntroProcessBslDoorTop: @ 0x08091298
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0xa]
	ldrb r1, [r5, #0x14]
	cmp r1, #0
	bne _080912B4
	strh r1, [r5, #0xa]
	movs r0, #1
	strb r0, [r5, #0x14]
	b _08091360
_080912B4:
	cmp r1, #1
	bne _080912DE
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bne _08091360
	strh r6, [r5, #0xa]
	ldrh r1, [r5, #2]
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0x35
	bgt _080912D8
	adds r0, r1, #1
	strh r0, [r5, #2]
	ldrh r0, [r5, #0xe]
	subs r0, #1
	strh r0, [r5, #0xe]
	b _08091360
_080912D8:
	movs r0, #2
	strb r0, [r5, #0x14]
	b _08091360
_080912DE:
	cmp r1, #2
	bne _08091300
	mov r4, sp
	adds r4, #2
	movs r0, #7
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionAndSlotOfOamByType_2
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x5a
	ble _08091360
	strh r6, [r5, #0xa]
	movs r0, #3
	strb r0, [r5, #0x14]
	b _08091360
_08091300:
	cmp r1, #3
	bne _0809134E
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bne _08091360
	strh r6, [r5, #0xa]
	ldrh r1, [r5, #2]
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _08091338
	subs r0, r1, #1
	strh r0, [r5, #2]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x25
	bne _08091330
	movs r0, #0xa
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl NewFileIntroLandingOnBslSetupOam
_08091330:
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
	b _08091360
_08091338:
	movs r0, #4
	strb r0, [r5, #0x14]
	movs r0, #0xc
	ldrsh r1, [r5, r0]
	movs r0, #0xe
	ldrsh r2, [r5, r0]
	movs r0, #9
	movs r3, #1
	bl NewFileIntroLandingOnBslSetupOam
	b _08091360
_0809134E:
	cmp r1, #4
	bne _08091360
	movs r0, #0
	strb r0, [r5, #0x10]
	ldrb r1, [r5, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #0x18]
_08091360:
	ldr r0, _08091378 @ =gNonGameplayRam
	ldr r1, _0809137C @ =0x00000217
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0xe]
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08091378: .4byte gNonGameplayRam
_0809137C: .4byte 0x00000217

	thumb_func_start NewFileIntroProcessBslDoorBottom
NewFileIntroProcessBslDoorBottom: @ 0x08091380
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0xa]
	ldrb r1, [r5, #0x14]
	cmp r1, #0
	bne _0809139C
	strh r1, [r5, #0xa]
	movs r0, #1
	strb r0, [r5, #0x14]
	b _08091424
_0809139C:
	cmp r1, #1
	bne _080913C6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bne _08091424
	strh r6, [r5, #0xa]
	ldrh r1, [r5, #2]
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0x35
	bgt _080913C0
	adds r0, r1, #1
	strh r0, [r5, #2]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
	b _08091424
_080913C0:
	movs r0, #2
	strb r0, [r5, #0x14]
	b _08091424
_080913C6:
	cmp r1, #2
	bne _080913E8
	mov r4, sp
	adds r4, #2
	movs r0, #7
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionAndSlotOfOamByType_2
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x5a
	ble _08091424
	strh r6, [r5, #0xa]
	movs r0, #3
	strb r0, [r5, #0x14]
	b _08091424
_080913E8:
	cmp r1, #3
	bne _08091412
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bne _08091424
	strh r6, [r5, #0xa]
	ldrh r1, [r5, #2]
	movs r2, #2
	ldrsh r0, [r5, r2]
	cmp r0, #0
	ble _0809140C
	subs r0, r1, #1
	strh r0, [r5, #2]
	ldrh r0, [r5, #0xe]
	subs r0, #1
	strh r0, [r5, #0xe]
	b _08091424
_0809140C:
	movs r0, #4
	strb r0, [r5, #0x14]
	b _08091424
_08091412:
	cmp r1, #4
	bne _08091424
	movs r0, #0
	strb r0, [r5, #0x10]
	ldrb r1, [r5, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #0x18]
_08091424:
	ldr r0, _0809143C @ =gNonGameplayRam
	ldr r1, _08091440 @ =0x00000217
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r5, #0xe]
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809143C: .4byte gNonGameplayRam
_08091440: .4byte 0x00000217

	thumb_func_start unk_91444
unk_91444: @ 0x08091444
	push {r4, lr}
	adds r3, r0, #0
	ldrb r2, [r3, #0x14]
	cmp r2, #0
	bne _08091464
	ldr r1, _08091494 @ =gNonGameplayRam
	movs r4, #0xa4
	lsls r4, r4, #1
	adds r0, r1, r4
	strb r2, [r0]
	ldr r0, _08091498 @ =0x00000149
	adds r1, r1, r0
	movs r0, #5
	strb r0, [r1]
	movs r0, #1
	strb r0, [r3, #0x14]
_08091464:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4b
	bne _080914A0
	movs r0, #0
	strh r0, [r3, #0xa]
	ldr r2, _08091494 @ =gNonGameplayRam
	movs r4, #0xa4
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08091498 @ =0x00000149
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #8
	bhi _0809149C
	adds r0, #1
	strb r0, [r1]
	b _080914A0
	.align 2, 0
_08091494: .4byte gNonGameplayRam
_08091498: .4byte 0x00000149
_0809149C:
	movs r0, #0
	strb r0, [r3, #0x10]
_080914A0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_914a8
unk_914a8: @ 0x080914A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	adds r1, r0, #1
	movs r7, #0
	movs r0, #0
	mov r8, r0
	strh r1, [r5, #0xa]
	ldrb r6, [r5, #0x14]
	cmp r6, #0
	bne _080914E8
	mov r2, sp
	adds r2, #2
	movs r0, #4
	mov r1, sp
	bl NewFileIntroGetPositionAndSlotOfOamByType_2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bne _080914DA
	b _080917C8
_080914DA:
	strh r6, [r5, #0xa]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	movs r0, #1
	b _080917C6
_080914E8:
	cmp r6, #1
	bne _08091538
	mov r4, sp
	adds r4, #2
	movs r0, #4
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionAndSlotOfOamByType_2
	ldrh r0, [r5, #0xa]
	lsrs r0, r0, #2
	ldrh r1, [r5, #2]
	adds r2, r0, r1
	strh r2, [r5, #0xe]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	movs r3, #0
	ldrsh r1, [r4, r3]
	subs r0, r0, r1
	cmp r0, #8
	bgt _08091514
	b _080917C8
_08091514:
	ldr r1, _08091534 @ =gNonGameplayRam
	movs r3, #0xf8
	lsls r3, r3, #1
	adds r0, r1, r3
	strb r6, [r0]
	adds r3, #1
	adds r0, r1, r3
	strb r6, [r0]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	strh r2, [r5, #2]
	mov r0, r8
	strh r0, [r5, #0xa]
	movs r0, #2
	b _080917C6
	.align 2, 0
_08091534: .4byte gNonGameplayRam
_08091538:
	cmp r6, #2
	beq _0809153E
	b _08091678
_0809153E:
	ldrb r0, [r5, #0x13]
	adds r2, r0, #1
	strb r2, [r5, #0x13]
	ldr r6, _08091588 @ =gNonGameplayRam
	ldr r3, _0809158C @ =0x000001F1
	adds r3, r3, r6
	mov ip, r3
	ldrb r4, [r3]
	adds r0, r4, #0
	cmp r0, #6
	bhi _08091590
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x12
	ldrh r1, [r5, #2]
	adds r3, r0, r1
	strh r3, [r5, #0xe]
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	beq _08091568
	b _08091664
_08091568:
	strb r7, [r5, #0x13]
	movs r2, #0xf8
	lsls r2, r2, #1
	adds r1, r6, r2
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #1
	mov r1, ip
	strb r0, [r1]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	strh r3, [r5, #2]
	mov r2, r8
	strh r2, [r5, #0xa]
	b _08091664
	.align 2, 0
_08091588: .4byte gNonGameplayRam
_0809158C: .4byte 0x000001F1
_08091590:
	cmp r0, #7
	bne _080915C0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _080915A6
	mov r3, r8
	strh r3, [r5, #0xa]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
_080915A6:
	ldrb r0, [r5, #0x13]
	cmp r0, #0xc
	bne _08091664
	strb r7, [r5, #0x13]
	ldr r0, _080915BC @ =0x085FF628
	str r0, [r5, #0x1c]
	movs r0, #0xf8
	lsls r0, r0, #1
	adds r1, r6, r0
	b _08091612
	.align 2, 0
_080915BC: .4byte 0x085FF628
_080915C0:
	cmp r0, #8
	bne _080915EE
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _080915D6
	mov r2, r8
	strh r2, [r5, #0xa]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
_080915D6:
	ldrb r0, [r5, #0x13]
	cmp r0, #0xa
	bne _08091664
	strb r7, [r5, #0x13]
	ldrb r1, [r5, #0x1a]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r5, #0x1a]
	b _0809160C
_080915EE:
	cmp r0, #0xd
	bhi _08091620
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _08091604
	mov r2, r8
	strh r2, [r5, #0xa]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
_08091604:
	ldrb r0, [r5, #0x13]
	cmp r0, #8
	bne _08091664
	strb r7, [r5, #0x13]
_0809160C:
	movs r3, #0xf8
	lsls r3, r3, #1
	adds r1, r6, r3
_08091612:
	movs r0, #1
	strb r0, [r1]
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _08091664
_08091620:
	cmp r0, #0xe
	bne _08091664
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _08091636
	mov r2, r8
	strh r2, [r5, #0xa]
	ldrh r0, [r5, #0xe]
	adds r0, #1
	strh r0, [r5, #0xe]
_08091636:
	ldrb r0, [r5, #0x13]
	cmp r0, #8
	bne _08091664
	strb r7, [r5, #0x13]
	ldr r0, _08091674 @ =0x085FF638
	str r0, [r5, #0x1c]
	movs r3, #0xf8
	lsls r3, r3, #1
	adds r1, r6, r3
	movs r0, #1
	strb r0, [r1]
	mov r1, ip
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	mov r2, r8
	strh r2, [r5, #0xa]
	movs r0, #3
	strb r0, [r5, #0x14]
_08091664:
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	cmp r0, #0x50
	bgt _0809166E
	b _080917C8
_0809166E:
	movs r0, #0x50
	strh r0, [r5, #0xe]
	b _080917C8
	.align 2, 0
_08091674: .4byte 0x085FF638
_08091678:
	cmp r6, #3
	bne _0809169E
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	beq _08091686
	b _080917C8
_08091686:
	mov r0, r8
	strh r0, [r5, #0xa]
	movs r0, #4
	strb r0, [r5, #0x14]
	movs r2, #0xc
	ldrsh r1, [r5, r2]
	movs r0, #8
	movs r2, #0x96
	movs r3, #0
	bl NewFileIntroLandingOnBslSetupOam
	b _080917C8
_0809169E:
	cmp r6, #4
	bne _080916DC
	ldrh r1, [r5, #8]
	adds r0, r1, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080916B6
	adds r0, r1, #0
	subs r0, #0xff
	strh r0, [r5, #8]
_080916B6:
	mov r3, r8
	strh r3, [r5, #0xa]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	strb r7, [r5, #0x12]
	strb r7, [r5, #0x11]
	ldrb r1, [r5, #0x18]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #0x18]
	ldr r0, _080916D8 @ =0x085FF540
	str r0, [r5, #0x1c]
	movs r0, #5
	b _080917C6
	.align 2, 0
_080916D8: .4byte 0x085FF540
_080916DC:
	cmp r6, #5
	bne _0809171C
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x14
	ldrh r1, [r5, #2]
	adds r2, r0, r1
	strh r2, [r5, #0xe]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x5a
	ble _080917C8
	ldr r0, [r5, #0x10]
	ldr r1, _08091714 @ =0x00FFFF00
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	cmp r0, r1
	bne _080917C8
	ldr r0, _08091718 @ =0x085FF4D8
	str r0, [r5, #0x1c]
	mov r3, r8
	strh r3, [r5, #0xa]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	strh r2, [r5, #2]
	movs r0, #6
	b _080917C6
	.align 2, 0
_08091714: .4byte 0x00FFFF00
_08091718: .4byte 0x085FF4D8
_0809171C:
	cmp r6, #6
	bne _0809175C
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x14
	ldrh r1, [r5, #2]
	adds r2, r0, r1
	strh r2, [r5, #0xe]
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r5, #0x12]
	cmp r0, r3
	bne _080917C8
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080917C8
	mov r0, r8
	strh r0, [r5, #0xa]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	strh r2, [r5, #2]
	strb r7, [r5, #0x12]
	strb r7, [r5, #0x11]
	ldr r0, _08091758 @ =0x085FF5A8
	str r0, [r5, #0x1c]
	movs r0, #7
	b _080917C6
	.align 2, 0
_08091758: .4byte 0x085FF5A8
_0809175C:
	cmp r6, #7
	bne _0809178C
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x14
	ldrh r2, [r5, #2]
	adds r1, r0, r2
	strh r1, [r5, #0xe]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x67
	ble _080917C8
	mov r3, r8
	strh r3, [r5, #0xa]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	strh r1, [r5, #2]
	strb r7, [r5, #0x12]
	strb r7, [r5, #0x11]
	ldr r0, _08091788 @ =0x085FF580
	str r0, [r5, #0x1c]
	movs r0, #8
	b _080917C6
	.align 2, 0
_08091788: .4byte 0x085FF580
_0809178C:
	cmp r6, #8
	bne _080917C8
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r5, #0x12]
	cmp r0, r2
	bne _080917C8
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080917C8
	strh r1, [r5, #0xa]
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	strb r7, [r5, #0x12]
	strb r7, [r5, #0x11]
	ldr r0, _080917D4 @ =0x085FF5A8
	str r0, [r5, #0x1c]
	ldr r0, _080917D8 @ =gNonGameplayRam
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r0, r3
	movs r1, #4
	strb r1, [r0]
	movs r0, #9
_080917C6:
	strb r0, [r5, #0x14]
_080917C8:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080917D4: .4byte 0x085FF5A8
_080917D8: .4byte gNonGameplayRam

	thumb_func_start NewFileIntroProcessShipLandingSmoke
NewFileIntroProcessShipLandingSmoke: @ 0x080917DC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r6, [r5, #0x14]
	cmp r6, #0
	bne _08091834
	mov r4, sp
	adds r4, #2
	movs r0, #0xc
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionAndSlotOfOamByType_2
	mov r0, sp
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0xe]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x64
	ble _080918A0
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r5, #0x12]
	cmp r0, r3
	bne _080918A0
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080918A0
	strh r6, [r5, #0xa]
	strb r2, [r5, #0x12]
	strb r2, [r5, #0x11]
	ldr r0, _08091830 @ =0x085FF5E8
	str r0, [r5, #0x1c]
	movs r0, #1
	strb r0, [r5, #0x14]
	b _080918A0
	.align 2, 0
_08091830: .4byte 0x085FF5E8
_08091834:
	cmp r6, #1
	bne _0809187A
	mov r4, sp
	adds r4, #2
	movs r0, #0xc
	mov r1, sp
	adds r2, r4, #0
	bl NewFileIntroGetPositionAndSlotOfOamByType_2
	mov r0, sp
	ldrh r0, [r0]
	movs r2, #0
	strh r0, [r5, #0xc]
	movs r0, #0x96
	strh r0, [r5, #0xe]
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x67
	ble _080918A0
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r5, #0x12]
	cmp r0, r3
	bne _080918A0
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080918A0
	strb r2, [r5, #0x12]
	strb r2, [r5, #0x11]
	movs r0, #2
	strb r0, [r5, #0x14]
	b _080918A0
_0809187A:
	cmp r6, #2
	bne _080918A0
	ldrb r0, [r5, #0x11]
	lsls r0, r0, #3
	ldr r1, [r5, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r5, #0x12]
	cmp r0, r2
	bne _080918A0
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080918A0
	strb r1, [r5, #0x10]
	ldrb r1, [r5, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #0x18]
_080918A0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start unk_918a8
unk_918a8: @ 0x080918A8
	push {r4, lr}
	adds r2, r0, #0
	ldrb r3, [r2, #0x14]
	cmp r3, #0
	bne _080918DC
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r4, [r2, #0x12]
	cmp r0, r4
	bne _080918E4
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080918E4
	strb r3, [r2, #0x12]
	strb r3, [r2, #0x11]
	ldr r0, _080918D8 @ =0x085FE430
	str r0, [r2, #0x1c]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _080918E4
	.align 2, 0
_080918D8: .4byte 0x085FE430
_080918DC:
	cmp r3, #1
	bne _080918E4
	movs r0, #0
	strb r0, [r2, #0x12]
_080918E4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessExtendingShipArms
NewFileIntroProcessExtendingShipArms: @ 0x080918EC
	push {r4, lr}
	adds r3, r0, #0
	ldrb r2, [r3, #0x14]
	cmp r2, #0
	bne _0809190C
	ldr r1, _0809193C @ =gNonGameplayRam
	movs r4, #0xa4
	lsls r4, r4, #1
	adds r0, r1, r4
	strb r2, [r0]
	ldr r0, _08091940 @ =0x00000149
	adds r1, r1, r0
	movs r0, #9
	strb r0, [r1]
	movs r0, #1
	strb r0, [r3, #0x14]
_0809190C:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4b
	bne _08091948
	movs r0, #0
	strh r0, [r3, #0xa]
	ldr r2, _0809193C @ =gNonGameplayRam
	movs r4, #0xa4
	lsls r4, r4, #1
	adds r1, r2, r4
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08091940 @ =0x00000149
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #6
	bls _08091944
	subs r0, #1
	strb r0, [r1]
	b _08091948
	.align 2, 0
_0809193C: .4byte gNonGameplayRam
_08091940: .4byte 0x00000149
_08091944:
	movs r0, #0
	strb r0, [r3, #0x10]
_08091948:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NewFileIntroProcessLandingLights
NewFileIntroProcessLandingLights: @ 0x08091950
	ldr r1, _08091964 @ =gNonGameplayRam
	ldr r2, _08091968 @ =0x00000217
	adds r1, r1, r2
	movs r2, #0
	ldrsb r2, [r1, r2]
	ldrh r1, [r0, #0xe]
	subs r1, r1, r2
	strh r1, [r0, #0xe]
	bx lr
	.align 2, 0
_08091964: .4byte gNonGameplayRam
_08091968: .4byte 0x00000217

	thumb_func_start NewFileIntroProcessShipLanding
NewFileIntroProcessShipLanding: @ 0x0809196C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	adds r0, #1
	movs r2, #0
	movs r3, #0
	strh r0, [r4, #0xa]
	ldrb r1, [r4, #0x14]
	cmp r1, #0
	bne _0809198A
	strh r1, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	b _0809199E
_0809198A:
	cmp r1, #1
	bne _080919A6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x12
	ldrh r1, [r4, #2]
	adds r0, r0, r1
	strh r0, [r4, #0xe]
	strh r3, [r4, #0xa]
	ldrh r1, [r4, #0xc]
	strh r1, [r4]
_0809199E:
	strh r0, [r4, #2]
	movs r0, #2
	strb r0, [r4, #0x14]
	b _08091B50
_080919A6:
	cmp r1, #2
	bne _08091A28
	ldrh r1, [r4, #6]
	movs r2, #6
	ldrsh r0, [r4, r2]
	cmp r0, #0xff
	bgt _080919E4
	adds r0, r1, #1
	strh r0, [r4, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xff
	ble _080919D2
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r4, #6]
	ldrb r1, [r4, #0x18]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
	b _080919E4
_080919D2:
	cmp r0, #0xbf
	ble _080919E4
	ldrb r0, [r4, #0x1a]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #4
	orrs r1, r0
	strb r1, [r4, #0x1a]
_080919E4:
	ldrh r0, [r4, #0xa]
	lsrs r0, r0, #2
	ldrh r3, [r4, #2]
	adds r0, r0, r3
	movs r2, #0
	strh r0, [r4, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	bgt _080919FA
	b _08091B50
_080919FA:
	movs r1, #0x50
	strh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	strh r1, [r4, #2]
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r5, #6
	ldrsh r1, [r4, r5]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _08091A16
	b _08091B50
_08091A16:
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _08091A24 @ =0x085FF530
	str r0, [r4, #0x1c]
	movs r0, #3
	strb r0, [r4, #0x14]
	b _08091B50
	.align 2, 0
_08091A24: .4byte 0x085FF530
_08091A28:
	cmp r1, #3
	bne _08091A58
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bhi _08091A36
	b _08091B50
_08091A36:
	strh r3, [r4, #0xa]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _08091A54 @ =0x085FF540
	str r0, [r4, #0x1c]
	movs r0, #4
	strb r0, [r4, #0x14]
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #8
	movs r2, #0x96
	movs r3, #0
	bl NewFileIntroLandingOnBslSetupOam
	b _08091B50
	.align 2, 0
_08091A54: .4byte 0x085FF540
_08091A58:
	cmp r1, #4
	bne _08091A78
	strh r3, [r4, #0xa]
	ldrb r0, [r4, #0x11]
	cmp r0, #6
	bne _08091B50
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _08091A74 @ =0x085FF530
	str r0, [r4, #0x1c]
	movs r0, #5
	strb r0, [r4, #0x14]
	b _08091B50
	.align 2, 0
_08091A74: .4byte 0x085FF530
_08091A78:
	cmp r1, #5
	bne _08091A98
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xa
	bls _08091B50
	strh r3, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	movs r0, #6
	strb r0, [r4, #0x14]
	b _08091B50
_08091A98:
	cmp r1, #6
	bne _08091AC8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x13
	ldrh r5, [r4, #2]
	adds r1, r0, r5
	strh r1, [r4, #0xe]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x58
	ble _08091B50
	strh r3, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	strh r1, [r4, #2]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _08091AC4 @ =0x085FF4D8
	str r0, [r4, #0x1c]
	movs r0, #7
	strb r0, [r4, #0x14]
	b _08091B50
	.align 2, 0
_08091AC4: .4byte 0x085FF4D8
_08091AC8:
	cmp r1, #7
	bne _08091B14
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _08091AE4
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _08091AE4
	strb r2, [r4, #0x12]
_08091AE4:
	ldrh r0, [r4, #0xa]
	lsrs r0, r0, #3
	ldrh r5, [r4, #2]
	adds r1, r0, r5
	movs r2, #0
	strh r1, [r4, #0xe]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x67
	ble _08091B50
	movs r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	strh r1, [r4, #2]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _08091B10 @ =0x085FF580
	str r0, [r4, #0x1c]
	movs r0, #8
	strb r0, [r4, #0x14]
	b _08091B50
	.align 2, 0
_08091B10: .4byte 0x085FF580
_08091B14:
	cmp r1, #8
	bne _08091B50
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _08091B50
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _08091B50
	strh r1, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _08091B68 @ =0x085FF5A8
	str r0, [r4, #0x1c]
	movs r0, #9
	strb r0, [r4, #0x14]
	ldr r0, _08091B6C @ =gNonGameplayRam
	movs r5, #0x85
	lsls r5, r5, #2
	adds r0, r0, r5
	movs r1, #4
	strb r1, [r0]
_08091B50:
	ldr r0, _08091B6C @ =gNonGameplayRam
	ldr r1, _08091B70 @ =0x00000217
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r4, #0xe]
	subs r0, r0, r1
	strh r0, [r4, #0xe]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08091B68: .4byte 0x085FF5A8
_08091B6C: .4byte gNonGameplayRam
_08091B70: .4byte 0x00000217

	thumb_func_start NewFileIntroLandingOnBslSetupOam
NewFileIntroLandingOnBslSetupOam: @ 0x08091B74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08091BD8
	movs r2, #0
	ldr r0, _08091BD4 @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r1, r0, r3
	ldrb r1, [r1]
	mov ip, r0
	cmp r1, #0
	beq _08091BC8
	mov r4, ip
_08091BA8:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x13
	bgt _08091C18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08091BA8
_08091BC8:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	adds r7, r0, #0
	cmp r1, #0x13
	ble _08091C20
	b _08091C18
	.align 2, 0
_08091BD4: .4byte gNonGameplayRam
_08091BD8:
	movs r2, #0x13
	ldr r0, _08091C1C @ =gNonGameplayRam
	movs r3, #0x9b
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrb r1, [r1]
	mov ip, r0
	cmp r1, #0
	beq _08091C10
	mov r4, ip
	movs r3, #0x8b
	lsls r3, r3, #2
_08091BF0:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _08091C18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08091BF0
_08091C10:
	lsls r0, r2, #0x18
	adds r7, r0, #0
	cmp r7, #0
	bge _08091C20
_08091C18:
	movs r0, #0x14
	b _08091EDC
	.align 2, 0
_08091C1C: .4byte gNonGameplayRam
_08091C20:
	movs r0, #0
	str r0, [sp]
	ldr r2, _08091C84 @ =0x040000D4
	mov r3, sp
	str r3, [r2]
	asrs r1, r7, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r5, r0, #2
	ldr r3, _08091C88 @ =0x030016A0
	adds r0, r5, r3
	str r0, [r2, #4]
	ldr r0, _08091C8C @ =0x85000009
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08091C90 @ =0xFFFFFDE4
	adds r0, r3, r1
	adds r2, r5, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, r8
	strh r1, [r0]
	ldr r1, _08091C94 @ =0x0000022A
	adds r0, r2, r1
	mov r1, sb
	strh r1, [r0]
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r6, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r4, r2, r0
	ldrb r1, [r4]
	movs r0, #1
	orrs r1, r0
	strb r1, [r4]
	cmp r6, #1
	bne _08091C9C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091C98 @ =NewFileIntroProcessLandingOnBslScroll
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091C84: .4byte 0x040000D4
_08091C88: .4byte 0x030016A0
_08091C8C: .4byte 0x85000009
_08091C90: .4byte 0xFFFFFDE4
_08091C94: .4byte 0x0000022A
_08091C98: .4byte NewFileIntroProcessLandingOnBslScroll
_08091C9C:
	cmp r6, #2
	bne _08091CD4
	ldr r1, _08091CC8 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08091CCC @ =0x085FE430
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091CD0 @ =NewFileIntroProcessBslDoor
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091CC8: .4byte 0x00000236
_08091CCC: .4byte 0x085FE430
_08091CD0: .4byte NewFileIntroProcessBslDoor
_08091CD4:
	cmp r6, #3
	bne _08091CF0
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091CEC @ =NewFileIntroProcessBslDoorLight
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091CEC: .4byte NewFileIntroProcessBslDoorLight
_08091CF0:
	cmp r6, #4
	bne _08091D28
	ldr r0, _08091D1C @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08091D20 @ =0x085FE410
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091D24 @ =NewFileIntroProcessBslDoorTop
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091D1C: .4byte 0x00000236
_08091D20: .4byte 0x085FE410
_08091D24: .4byte NewFileIntroProcessBslDoorTop
_08091D28:
	cmp r6, #5
	bne _08091D60
	ldr r1, _08091D54 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08091D58 @ =0x085FE420
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091D5C @ =NewFileIntroProcessBslDoorBottom
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091D54: .4byte 0x00000236
_08091D58: .4byte 0x085FE420
_08091D5C: .4byte NewFileIntroProcessBslDoorBottom
_08091D60:
	cmp r6, #6
	bne _08091D7C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091D78 @ =unk_91444
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091D78: .4byte unk_91444
_08091D7C:
	cmp r6, #7
	bne _08091DCC
	ldr r0, _08091DBC @ =0x00000222
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldrb r1, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	ldr r1, _08091DC0 @ =0x00000236
	adds r2, r2, r1
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08091DC4 @ =0x085FF618
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091DC8 @ =unk_914a8
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091DBC: .4byte 0x00000222
_08091DC0: .4byte 0x00000236
_08091DC4: .4byte 0x085FF618
_08091DC8: .4byte unk_914a8
_08091DCC:
	cmp r6, #8
	bne _08091DF0
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08091DE8 @ =0x085FF5B8
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091DEC @ =NewFileIntroProcessShipLandingSmoke
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091DE8: .4byte 0x085FF5B8
_08091DEC: .4byte NewFileIntroProcessShipLandingSmoke
_08091DF0:
	cmp r6, #9
	bne _08091E28
	ldr r0, _08091E1C @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08091E20 @ =0x085FE3C0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091E24 @ =unk_918a8
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091E1C: .4byte 0x00000236
_08091E20: .4byte 0x085FE3C0
_08091E24: .4byte unk_918a8
_08091E28:
	cmp r6, #0xa
	bne _08091E44
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08091E40 @ =NewFileIntroProcessExtendingShipArms
	str r1, [r0]
	b _08091EDA
	.align 2, 0
_08091E40: .4byte NewFileIntroProcessExtendingShipArms
_08091E44:
	cmp r6, #0xb
	bne _08091E8C
	asrs r0, r7, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r1, ip
	adds r3, r2, r1
	ldr r0, _08091E80 @ =0x00000236
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, ip
	adds r0, r2, r0
	ldr r1, _08091E84 @ =0x085FF6C0
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	adds r2, r2, r0
	ldr r0, _08091E88 @ =NewFileIntroProcessLandingLights
	b _08091ED8
	.align 2, 0
_08091E80: .4byte 0x00000236
_08091E84: .4byte 0x085FF6C0
_08091E88: .4byte NewFileIntroProcessLandingLights
_08091E8C:
	cmp r6, #0xc
	bne _08091EDA
	asrs r0, r7, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r1, ip
	adds r3, r2, r1
	ldr r0, _08091EEC @ =0x00000222
	adds r1, r3, r0
	movs r0, #2
	strh r0, [r1]
	movs r1, #0x8d
	lsls r1, r1, #2
	adds r4, r3, r1
	ldrb r1, [r4]
	subs r0, #9
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	ldr r0, _08091EF0 @ =0x00000236
	adds r3, r3, r0
	ldrb r0, [r3]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, ip
	adds r0, r2, r0
	ldr r1, _08091EF4 @ =0x085FF638
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	adds r2, r2, r0
	ldr r0, _08091EF8 @ =NewFileIntroProcessShipLanding
_08091ED8:
	str r0, [r2]
_08091EDA:
	lsrs r0, r7, #0x18
_08091EDC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08091EEC: .4byte 0x00000222
_08091EF0: .4byte 0x00000236
_08091EF4: .4byte 0x085FF638
_08091EF8: .4byte NewFileIntroProcessShipLanding

	thumb_func_start NewFileIntroLandingOnBslVblank
NewFileIntroLandingOnBslVblank: @ 0x08091EFC
	push {r4, lr}
	ldr r3, _08091FDC @ =0x040000D4
	ldr r0, _08091FE0 @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _08091FE4 @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _08091FE8 @ =0x04000052
	ldr r0, _08091FEC @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08091FF0 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08091FF4 @ =0x04000054
	ldr r0, _08091FF8 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x3c
	ldr r0, _08091FFC @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08092000 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08092004 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08092008 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r2, _0809200C @ =gNonGameplayRam
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r2, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _08091F72
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08092010 @ =0x00000111
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08092014 @ =0x085FFB08
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _08092018 @ =0x05000340
	str r0, [r3, #4]
	ldr r0, _0809201C @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_08091F72:
	movs r4, #0x96
	lsls r4, r4, #1
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #1
	bne _08091F9A
	movs r0, #0
	strb r0, [r1]
	ldr r1, _08092020 @ =0x0000012D
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08092024 @ =0x085FF908
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _08092028 @ =0x05000300
	str r0, [r3, #4]
	ldr r0, _0809201C @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_08091F9A:
	movs r4, #0xa4
	lsls r4, r4, #1
	adds r1, r2, r4
	ldrb r0, [r1]
	cmp r0, #1
	bne _08091FD6
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0809202C @ =0x00000149
	adds r0, r0, r2
	mov ip, r0
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r2, _08092014 @ =0x085FFB08
	adds r0, r0, r2
	str r0, [r3]
	ldr r0, _08092030 @ =0x05000320
	str r0, [r3, #4]
	ldr r1, _0809201C @ =0x84000008
	str r1, [r3, #8]
	ldr r0, [r3, #8]
	mov r4, ip
	ldrb r0, [r4]
	lsls r0, r0, #5
	adds r0, r0, r2
	str r0, [r3]
	ldr r0, _08092034 @ =0x05000160
	str r0, [r3, #4]
	str r1, [r3, #8]
	ldr r0, [r3, #8]
_08091FD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08091FDC: .4byte 0x040000D4
_08091FE0: .4byte gOamData
_08091FE4: .4byte 0x84000100
_08091FE8: .4byte 0x04000052
_08091FEC: .4byte gWrittenToBldalpha_L
_08091FF0: .4byte gWrittenToBldalpha_R
_08091FF4: .4byte 0x04000054
_08091FF8: .4byte gWrittenToBldy
_08091FFC: .4byte 0x0300122C
_08092000: .4byte 0x0300122E
_08092004: .4byte 0x03001230
_08092008: .4byte 0x03001232
_0809200C: .4byte gNonGameplayRam
_08092010: .4byte 0x00000111
_08092014: .4byte 0x085FFB08
_08092018: .4byte 0x05000340
_0809201C: .4byte 0x84000008
_08092020: .4byte 0x0000012D
_08092024: .4byte 0x085FF908
_08092028: .4byte 0x05000300
_0809202C: .4byte 0x00000149
_08092030: .4byte 0x05000320
_08092034: .4byte 0x05000160

	thumb_func_start NewFileIntroGetPositionAndSlotOfOamByType_2
NewFileIntroGetPositionAndSlotOfOamByType_2: @ 0x08092038
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0
	ldr r7, _08092070 @ =gNonGameplayRam
	movs r6, #0x8b
	lsls r6, r6, #2
_08092048:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _08092078
	movs r5, #0x8a
	lsls r5, r5, #2
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r4, _08092074 @ =0x0000022A
	adds r0, r3, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r1, #0
	b _08092090
	.align 2, 0
_08092070: .4byte gNonGameplayRam
_08092074: .4byte 0x0000022A
_08092078:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bls _08092048
	movs r5, #0x96
	lsls r5, r5, #1
	adds r0, r5, #0
	strh r0, [r4]
	movs r0, #0xc8
	strh r0, [r2]
	movs r0, #0x14
_08092090:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_92098
unk_92098: @ 0x08092098
	bx lr
	.align 2, 0

	thumb_func_start unk_9209c
unk_9209c: @ 0x0809209C
	push {r4, r5, lr}
	sub sp, #4
	ldr r3, _080921B4 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080921B8 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _080921BC @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _080921C0 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080921C4 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _080921C8 @ =unk_99940
	bl CallbackSetVBlank
	movs r0, #0
	str r0, [sp]
	ldr r1, _080921CC @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080921D0 @ =gNonGameplayRam
	str r0, [r1, #4]
	ldr r0, _080921D4 @ =0x85000150
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	ldr r5, _080921D8 @ =0x0879C41C
_080920DC:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r1, r4, #0xc
	ldr r2, _080921DC @ =0x06008000
	adds r1, r1, r2
	bl LZ77UncompVram
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080920DC
	ldr r0, _080921E0 @ =0x08658BE0
	ldr r1, _080921E4 @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _080921E8 @ =0x08598898
	ldr r1, _080921EC @ =0x0600E000
	bl LZ77UncompVram
	ldr r4, _080921CC @ =0x040000D4
	ldr r0, _080921F0 @ =0x086591E4
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _080921F4 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080921F8 @ =0x04000010
	movs r3, #0
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, #2
	strh r3, [r0]
	ldr r0, _080921FC @ =0x0300122C
	movs r1, #8
	strh r1, [r0]
	ldr r0, _08092200 @ =0x0300122E
	strh r1, [r0]
	ldr r0, _08092204 @ =0x03001230
	strh r1, [r0]
	ldr r0, _08092208 @ =0x03001232
	strh r1, [r0]
	ldr r1, _0809220C @ =0x04000008
	ldr r2, _08092210 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08092214 @ =0x00001D08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x46
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _08092218 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0809221C @ =0x04000054
	strh r1, [r0]
	ldr r0, _08092220 @ =gWrittenToBldalpha_R
	ldr r2, _08092224 @ =gWrittenToBldalpha_L
	strh r3, [r0]
	strh r1, [r2]
	ldr r0, _08092228 @ =0x04000052
	lsls r1, r1, #8
	strh r1, [r0]
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _080921D0 @ =gNonGameplayRam
	ldr r0, _0809222C @ =0x0863A19C
	str r0, [r1]
	movs r0, #0
	str r0, [sp]
	mov r0, sp
	str r0, [r4]
	ldr r0, _08092230 @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _08092234 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0x98
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08092238 @ =unk_93884
	bl CallbackSetVBlank
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080921B4: .4byte 0x04000208
_080921B8: .4byte 0x04000004
_080921BC: .4byte 0x0000FFEF
_080921C0: .4byte 0x04000200
_080921C4: .4byte 0x0000FFFD
_080921C8: .4byte unk_99940
_080921CC: .4byte 0x040000D4
_080921D0: .4byte gNonGameplayRam
_080921D4: .4byte 0x85000150
_080921D8: .4byte 0x0879C41C
_080921DC: .4byte 0x06008000
_080921E0: .4byte 0x08658BE0
_080921E4: .4byte 0x0600E800
_080921E8: .4byte 0x08598898
_080921EC: .4byte 0x0600E000
_080921F0: .4byte 0x086591E4
_080921F4: .4byte 0x84000080
_080921F8: .4byte 0x04000010
_080921FC: .4byte 0x0300122C
_08092200: .4byte 0x0300122E
_08092204: .4byte 0x03001230
_08092208: .4byte 0x03001232
_0809220C: .4byte 0x04000008
_08092210: .4byte 0x00001C08
_08092214: .4byte 0x00001D08
_08092218: .4byte gWrittenToBldy
_0809221C: .4byte 0x04000054
_08092220: .4byte gWrittenToBldalpha_R
_08092224: .4byte gWrittenToBldalpha_L
_08092228: .4byte 0x04000052
_0809222C: .4byte 0x0863A19C
_08092230: .4byte 0x0600D000
_08092234: .4byte 0x85000400
_08092238: .4byte unk_93884

	thumb_func_start IntroSamusInShipProcess
IntroSamusInShipProcess: @ 0x0809223C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	ldr r2, _0809226C @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r5, #0x85
	lsls r5, r5, #2
	adds r0, r2, r5
	ldrb r0, [r0]
	adds r3, r2, #0
	cmp r0, #6
	bls _08092260
	b _080924C2
_08092260:
	lsls r0, r0, #2
	ldr r1, _08092270 @ =_08092274
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809226C: .4byte gNonGameplayRam
_08092270: .4byte _08092274
_08092274: @ jump table
	.4byte _08092290 @ case 0
	.4byte _08092354 @ case 1
	.4byte _080923E8 @ case 2
	.4byte _08092426 @ case 3
	.4byte _0809244C @ case 4
	.4byte _08092460 @ case 5
	.4byte _08092490 @ case 6
_08092290:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r4, r3, r0
	ldrh r0, [r4]
	cmp r0, #5
	bhi _080922BC
	ldr r2, _080922B4 @ =0x0879C41C
	adds r1, r0, #0
	subs r1, #1
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r1, #0xc
	ldr r2, _080922B8 @ =0x06008000
	adds r1, r1, r2
	bl LZ77UncompVram
	b _08092480
	.align 2, 0
_080922B4: .4byte 0x0879C41C
_080922B8: .4byte 0x06008000
_080922BC:
	cmp r0, #6
	bne _08092320
	ldr r0, _080922F8 @ =0x08658BE0
	ldr r1, _080922FC @ =0x0600E800
	bl LZ77UncompVram
	ldr r1, _08092300 @ =0x040000D4
	ldr r0, _08092304 @ =0x086591E4
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08092308 @ =0x84000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0809230C @ =gWrittenToBldalpha_R
	movs r1, #0
	strh r1, [r0]
	ldr r2, _08092310 @ =gWrittenToBldalpha_L
	movs r0, #0x10
	strh r0, [r2]
	ldr r0, _08092314 @ =0x04000014
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r1, _08092318 @ =0x0400000A
	ldr r5, _0809231C @ =0x00001D08
	adds r0, r5, #0
	strh r0, [r1]
	b _08092480
	.align 2, 0
_080922F8: .4byte 0x08658BE0
_080922FC: .4byte 0x0600E800
_08092300: .4byte 0x040000D4
_08092304: .4byte 0x086591E4
_08092308: .4byte 0x84000040
_0809230C: .4byte gWrittenToBldalpha_R
_08092310: .4byte gWrittenToBldalpha_L
_08092314: .4byte 0x04000014
_08092318: .4byte 0x0400000A
_0809231C: .4byte 0x00001D08
_08092320:
	cmp r0, #7
	beq _08092326
	b _08092480
_08092326:
	ldr r1, _0809234C @ =0x04000050
	ldr r2, _08092350 @ =0x00003842
	adds r0, r2, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r4]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #1
	b _0809247E
	.align 2, 0
_0809234C: .4byte 0x04000050
_08092350: .4byte 0x00003842
_08092354:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	ldrh r0, [r1]
	cmp r0, #1
	beq _08092362
	b _08092480
_08092362:
	movs r0, #0
	strh r0, [r1]
	ldr r6, _080923AC @ =gWrittenToBldalpha_L
	ldrh r0, [r6]
	cmp r0, #0
	beq _080923C0
	cmp r0, #0x10
	bne _080923A2
	ldr r5, _080923B0 @ =sMusicTrackDataRom
	ldr r4, _080923B4 @ =sSoundDataEntries
	ldr r1, _080923B8 @ =0x00000F64
	adds r0, r4, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0xa
	bl ApplyMusicSoundFading
	ldr r2, _080923BC @ =0x00000F6C
	adds r4, r4, r2
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0xa
	bl ApplyMusicSoundFading
_080923A2:
	ldrh r0, [r6]
	subs r0, #2
	strh r0, [r6]
	b _08092480
	.align 2, 0
_080923AC: .4byte gWrittenToBldalpha_L
_080923B0: .4byte sMusicTrackDataRom
_080923B4: .4byte sSoundDataEntries
_080923B8: .4byte 0x00000F64
_080923BC: .4byte 0x00000F6C
_080923C0:
	str r0, [sp]
	ldr r1, _080923E0 @ =0x040000D4
	mov r5, sp
	str r5, [r1]
	movs r2, #0x87
	lsls r2, r2, #2
	adds r0, r3, r2
	str r0, [r1, #4]
	ldr r0, _080923E4 @ =0x850000B4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r5, #0x85
	lsls r5, r5, #2
	adds r1, r3, r5
	movs r0, #2
	b _0809247E
	.align 2, 0
_080923E0: .4byte 0x040000D4
_080923E4: .4byte 0x850000B4
_080923E8:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrh r0, [r1]
	cmp r0, #1
	bne _08092480
	movs r0, #0
	strh r0, [r1]
	ldr r4, _08092414 @ =gWrittenToBldalpha_R
	ldrh r0, [r4]
	cmp r0, #0xf
	bhi _0809241C
	cmp r0, #0
	bne _0809240C
	ldr r0, _08092418 @ =0x000001EB
	movs r1, #0
	bl unk_2ad4
_0809240C:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _08092480
	.align 2, 0
_08092414: .4byte gWrittenToBldalpha_R
_08092418: .4byte 0x000001EB
_0809241C:
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #3
	b _0809247E
_08092426:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r1, r3, r5
	ldrh r0, [r1]
	cmp r0, #0x28
	bne _08092480
	movs r2, #0
	strh r2, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #4
	strb r0, [r1]
	ldr r0, _08092448 @ =gWrittenToBldy
	strh r2, [r0]
	b _08092480
	.align 2, 0
_08092448: .4byte gWrittenToBldy
_0809244C:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #0
	strh r0, [r1]
	movs r5, #0x85
	lsls r5, r5, #2
	adds r1, r3, r5
	movs r0, #5
	b _0809247E
_08092460:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrh r0, [r1]
	cmp r0, #1
	bne _08092480
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0809248C @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #6
_0809247E:
	strb r0, [r1]
_08092480:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _080924C2
	.align 2, 0
_0809248C: .4byte 0x04000050
_08092490:
	ldr r1, _080924A0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080924A4
	adds r0, #2
	strh r0, [r1]
	b _080924BA
	.align 2, 0
_080924A0: .4byte gWrittenToBldy
_080924A4:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r1, r3, r5
	movs r2, #0
	movs r0, #0
	strh r0, [r1]
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r3, r1
	strb r2, [r0]
	movs r7, #1
_080924BA:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_080924C2:
	bl IntroProcessText
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start IntroShipAlertInit
IntroShipAlertInit: @ 0x080924D0
	push {r4, r5, lr}
	sub sp, #4
	ldr r3, _080926A0 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080926A4 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _080926A8 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _080926AC @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080926B0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _080926B4 @ =unk_99940
	bl CallbackSetVBlank
	movs r0, #0
	str r0, [sp]
	ldr r1, _080926B8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _080926BC @ =0x030016A0
	str r0, [r1, #4]
	ldr r0, _080926C0 @ =0x850000B4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	ldr r5, _080926C4 @ =0x0879C45C
_08092510:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r1, r4, #0xc
	ldr r2, _080926C8 @ =0x06010000
	adds r1, r1, r2
	bl LZ77UncompVram
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _08092510
	ldr r1, _080926B8 @ =0x040000D4
	ldr r0, _080926CC @ =0x0865C268
	str r0, [r1]
	ldr r0, _080926D0 @ =0x05000200
	str r0, [r1, #4]
	ldr r0, _080926D4 @ =0x84000080
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r4, #0
	ldr r5, _080926D8 @ =0x0879C448
_0809253E:
	lsls r0, r4, #2
	adds r0, r0, r5
	ldr r0, [r0]
	lsls r1, r4, #0xc
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	bl LZ77UncompVram
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _0809253E
	ldr r0, _080926DC @ =0x086593E4
	ldr r1, _080926E0 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _080926E4 @ =0x08598898
	ldr r1, _080926E8 @ =0x0600E000
	bl LZ77UncompVram
	ldr r4, _080926B8 @ =0x040000D4
	ldr r0, _080926EC @ =0x086599A4
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _080926F0 @ =0x84000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080926F4 @ =0x04000010
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r0, _080926F8 @ =0x0300122C
	strh r1, [r0]
	ldr r0, _080926FC @ =0x0300122E
	strh r1, [r0]
	ldr r0, _08092700 @ =0x03001230
	strh r1, [r0]
	ldr r0, _08092704 @ =0x03001232
	strh r1, [r0]
	ldr r2, _08092708 @ =0x04000008
	ldr r3, _0809270C @ =0x00001C08
	adds r0, r3, #0
	strh r0, [r2]
	adds r2, #2
	ldr r3, _08092710 @ =0x00001E01
	adds r0, r3, #0
	strh r0, [r2]
	adds r2, #2
	ldr r3, _08092714 @ =0x00001F02
	adds r0, r3, #0
	strh r0, [r2]
	adds r2, #0x44
	movs r0, #0xff
	strh r0, [r2]
	ldr r0, _08092718 @ =gWrittenToBldy
	movs r2, #0x10
	strh r2, [r0]
	ldr r0, _0809271C @ =0x04000054
	strh r2, [r0]
	ldr r2, _08092720 @ =gWrittenToBldalpha_R
	ldr r0, _08092724 @ =gWrittenToBldalpha_L
	strh r1, [r0]
	strh r1, [r2]
	ldr r0, _08092728 @ =0x04000052
	movs r5, #0
	strh r5, [r0]
	movs r0, #0x13
	movs r1, #0x60
	movs r2, #0x80
	movs r3, #0
	bl IntroSetupOam
	movs r0, #0x14
	movs r1, #0x80
	movs r2, #0x60
	movs r3, #0
	bl IntroSetupOam
	movs r0, #0x15
	movs r1, #0x80
	movs r2, #0x80
	movs r3, #0
	bl IntroSetupOam
	movs r0, #0x16
	movs r1, #0xc8
	movs r2, #0x26
	movs r3, #0
	bl IntroSetupOam
	movs r0, #0x17
	movs r1, #0xd2
	movs r2, #0x58
	movs r3, #0
	bl IntroSetupOam
	movs r0, #0x18
	movs r1, #0xd2
	movs r2, #0x58
	movs r3, #0xd2
	bl IntroSetupBigNumberOam
	movs r0, #0x19
	movs r1, #0x43
	movs r2, #0x97
	movs r3, #0xc8
	bl IntroSetupBigNumberOam
	movs r0, #0x1a
	movs r1, #0x2c
	movs r2, #0x98
	movs r3, #0xc8
	bl IntroSetupBigNumberOam
	movs r0, #0x1b
	movs r1, #0x25
	movs r2, #0x98
	movs r3, #0xc8
	bl IntroSetupBigNumberOam
	movs r0, #0x1c
	movs r1, #0x45
	movs r2, #0x7d
	movs r3, #0xc8
	bl IntroSetupBigNumberOam
	movs r0, #0x1d
	movs r1, #0x3e
	movs r2, #0x7d
	movs r3, #0xc8
	bl IntroSetupBigNumberOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _0809272C @ =gNonGameplayRam
	ldr r0, _08092730 @ =0x0863A19C
	str r0, [r1]
	str r5, [sp]
	mov r0, sp
	str r0, [r4]
	ldr r0, _08092734 @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _08092738 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0x98
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _0809273C @ =IntroShipAlertAndDraftingVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080926A0: .4byte 0x04000208
_080926A4: .4byte 0x04000004
_080926A8: .4byte 0x0000FFEF
_080926AC: .4byte 0x04000200
_080926B0: .4byte 0x0000FFFD
_080926B4: .4byte unk_99940
_080926B8: .4byte 0x040000D4
_080926BC: .4byte 0x030016A0
_080926C0: .4byte 0x850000B4
_080926C4: .4byte 0x0879C45C
_080926C8: .4byte 0x06010000
_080926CC: .4byte 0x0865C268
_080926D0: .4byte 0x05000200
_080926D4: .4byte 0x84000080
_080926D8: .4byte 0x0879C448
_080926DC: .4byte 0x086593E4
_080926E0: .4byte 0x0600F000
_080926E4: .4byte 0x08598898
_080926E8: .4byte 0x0600E000
_080926EC: .4byte 0x086599A4
_080926F0: .4byte 0x84000040
_080926F4: .4byte 0x04000010
_080926F8: .4byte 0x0300122C
_080926FC: .4byte 0x0300122E
_08092700: .4byte 0x03001230
_08092704: .4byte 0x03001232
_08092708: .4byte 0x04000008
_0809270C: .4byte 0x00001C08
_08092710: .4byte 0x00001E01
_08092714: .4byte 0x00001F02
_08092718: .4byte gWrittenToBldy
_0809271C: .4byte 0x04000054
_08092720: .4byte gWrittenToBldalpha_R
_08092724: .4byte gWrittenToBldalpha_L
_08092728: .4byte 0x04000052
_0809272C: .4byte gNonGameplayRam
_08092730: .4byte 0x0863A19C
_08092734: .4byte 0x0600D000
_08092738: .4byte 0x85000400
_0809273C: .4byte IntroShipAlertAndDraftingVblank

	thumb_func_start IntroShipAlertProcess
IntroShipAlertProcess: @ 0x08092740
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r1, _08092768 @ =gNonGameplayRam
	movs r0, #0x84
	lsls r0, r0, #2
	adds r5, r1, r0
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r6, r1, r2
	ldrb r1, [r6]
	cmp r1, #1
	beq _0809277E
	cmp r1, #1
	bgt _0809276C
	cmp r1, #0
	beq _08092776
	b _08092824
	.align 2, 0
_08092768: .4byte gNonGameplayRam
_0809276C:
	cmp r1, #2
	beq _08092798
	cmp r1, #3
	beq _080927D4
	b _08092824
_08092776:
	bl IntroShipAlertInit
	movs r0, #1
	b _08092792
_0809277E:
	ldr r1, _0809278C @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _08092790
	subs r0, #2
	strh r0, [r1]
	b _080927C4
	.align 2, 0
_0809278C: .4byte gWrittenToBldy
_08092790:
	movs r0, #2
_08092792:
	strb r0, [r6]
	strh r7, [r5]
	b _080927C4
_08092798:
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080927A8 @ =0x0000018F
	cmp r1, r0
	bne _080927B0
	ldr r0, _080927AC @ =gWrittenToBldy
	strh r7, [r0]
	b _080927C4
	.align 2, 0
_080927A8: .4byte 0x0000018F
_080927AC: .4byte gWrittenToBldy
_080927B0:
	movs r0, #0xc8
	lsls r0, r0, #1
	cmp r1, r0
	bne _080927C4
	strh r7, [r5]
	ldr r0, _080927D0 @ =0x04000050
	movs r1, #0xff
	strh r1, [r0]
	movs r0, #3
	strb r0, [r6]
_080927C4:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _08092824
	.align 2, 0
_080927D0: .4byte 0x04000050
_080927D4:
	ldr r4, _08092804 @ =gWrittenToBldy
	ldrh r0, [r4]
	cmp r0, #0xf
	bhi _08092814
	cmp r0, #0
	bne _080927FA
	ldr r2, _08092808 @ =sMusicTrackDataRom
	ldr r0, _0809280C @ =sSoundDataEntries
	ldr r1, _08092810 @ =0x00000F5C
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0xa
	bl ApplyMusicSoundFading
_080927FA:
	ldrh r0, [r4]
	adds r0, #2
	strh r0, [r4]
	b _0809281C
	.align 2, 0
_08092804: .4byte gWrittenToBldy
_08092808: .4byte sMusicTrackDataRom
_0809280C: .4byte sSoundDataEntries
_08092810: .4byte 0x00000F5C
_08092814:
	movs r0, #0
	strb r0, [r6]
	strh r7, [r5]
	movs r7, #1
_0809281C:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08092824:
	bl IntroProcessText
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start IntroSamusDriftingOutInit
IntroSamusDriftingOutInit: @ 0x08092830
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r3, _08092968 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0809296C @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08092970 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08092974 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08092978 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809297C @ =unk_99940
	bl CallbackSetVBlank
	movs r4, #0
	str r4, [sp]
	ldr r5, _08092980 @ =0x040000D4
	mov r0, sp
	str r0, [r5]
	ldr r1, _08092984 @ =0x030016A0
	mov r8, r1
	str r1, [r5, #4]
	ldr r0, _08092988 @ =0x850000B4
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _0809298C @ =0x086101B8
	ldr r1, _08092990 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _08092994 @ =0x08612F48
	str r0, [r5]
	ldr r0, _08092998 @ =0x05000200
	str r0, [r5, #4]
	ldr r6, _0809299C @ =0x84000080
	str r6, [r5, #8]
	ldr r0, [r5, #8]
	ldr r0, _080929A0 @ =0x08605D08
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080929A4 @ =0x08609220
	ldr r1, _080929A8 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _080929AC @ =0x08598898
	ldr r1, _080929B0 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _080929B4 @ =0x08609020
	str r0, [r5]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r5, #4]
	str r6, [r5, #8]
	ldr r1, [r5, #8]
	strh r4, [r0]
	ldr r0, _080929B8 @ =0x04000010
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	adds r0, #2
	strh r4, [r0]
	ldr r0, _080929BC @ =0x0300122C
	strh r4, [r0]
	ldr r0, _080929C0 @ =0x0300122E
	strh r4, [r0]
	ldr r0, _080929C4 @ =0x03001230
	strh r4, [r0]
	ldr r0, _080929C8 @ =0x03001232
	strh r4, [r0]
	ldr r1, _080929CC @ =0x04000008
	ldr r2, _080929D0 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #6
	ldr r2, _080929D4 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _080929D8 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _080929DC @ =0x04000054
	strh r1, [r0]
	ldr r1, _080929E0 @ =gWrittenToBldalpha_R
	ldr r0, _080929E4 @ =gWrittenToBldalpha_L
	strh r4, [r0]
	strh r4, [r1]
	ldr r0, _080929E8 @ =0x04000052
	strh r4, [r0]
	movs r0, #0xa
	movs r1, #0x91
	movs r2, #0x8c
	movs r3, #0
	bl IntroSetupOam
	movs r0, #0xb
	movs r1, #0x8c
	movs r2, #0x50
	movs r3, #0
	bl IntroSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _080929EC @ =0xFFFFFDE4
	add r8, r0
	ldr r0, _080929F0 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	str r4, [sp]
	mov r2, sp
	str r2, [r5]
	ldr r0, _080929F4 @ =0x0600D000
	str r0, [r5, #4]
	ldr r0, _080929F8 @ =0x85000400
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _080929FC @ =IntroShipAlertAndDraftingVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092968: .4byte 0x04000208
_0809296C: .4byte 0x04000004
_08092970: .4byte 0x0000FFEF
_08092974: .4byte 0x04000200
_08092978: .4byte 0x0000FFFD
_0809297C: .4byte unk_99940
_08092980: .4byte 0x040000D4
_08092984: .4byte 0x030016A0
_08092988: .4byte 0x850000B4
_0809298C: .4byte 0x086101B8
_08092990: .4byte 0x06010000
_08092994: .4byte 0x08612F48
_08092998: .4byte 0x05000200
_0809299C: .4byte 0x84000080
_080929A0: .4byte 0x08605D08
_080929A4: .4byte 0x08609220
_080929A8: .4byte 0x0600F800
_080929AC: .4byte 0x08598898
_080929B0: .4byte 0x0600E000
_080929B4: .4byte 0x08609020
_080929B8: .4byte 0x04000010
_080929BC: .4byte 0x0300122C
_080929C0: .4byte 0x0300122E
_080929C4: .4byte 0x03001230
_080929C8: .4byte 0x03001232
_080929CC: .4byte 0x04000008
_080929D0: .4byte 0x00001C08
_080929D4: .4byte 0x00001F03
_080929D8: .4byte gWrittenToBldy
_080929DC: .4byte 0x04000054
_080929E0: .4byte gWrittenToBldalpha_R
_080929E4: .4byte gWrittenToBldalpha_L
_080929E8: .4byte 0x04000052
_080929EC: .4byte 0xFFFFFDE4
_080929F0: .4byte 0x0863A19C
_080929F4: .4byte 0x0600D000
_080929F8: .4byte 0x85000400
_080929FC: .4byte IntroShipAlertAndDraftingVblank

	thumb_func_start IntroSamusDriftingOutProcess
IntroSamusDriftingOutProcess: @ 0x08092A00
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r2, _08092A2C @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #4
	bls _08092A22
	b _08092BE6
_08092A22:
	lsls r0, r0, #2
	ldr r1, _08092A30 @ =_08092A34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092A2C: .4byte gNonGameplayRam
_08092A30: .4byte _08092A34
_08092A34: @ jump table
	.4byte _08092A48 @ case 0
	.4byte _08092A68 @ case 1
	.4byte _08092AC4 @ case 2
	.4byte _08092B10 @ case 3
	.4byte _08092B7C @ case 4
_08092A48:
	bl IntroSamusDriftingOutInit
	ldr r3, _08092A64 @ =gNonGameplayRam
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r3, r1
	strh r2, [r0]
	b _08092B64
	.align 2, 0
_08092A64: .4byte gNonGameplayRam
_08092A68:
	ldr r5, _08092A90 @ =gWrittenToBldy
	ldrh r2, [r5]
	cmp r2, #0
	beq _08092A98
	cmp r2, #0x10
	bne _08092A86
	movs r0, #0xf6
	lsls r0, r0, #1
	movs r1, #0
	bl unk_2ad4
	ldr r0, _08092A94 @ =0x000001ED
	movs r1, #0
	bl unk_2ad4
_08092A86:
	ldrh r0, [r5]
	subs r0, #2
	strh r0, [r5]
	b _08092AAA
	.align 2, 0
_08092A90: .4byte gWrittenToBldy
_08092A94: .4byte 0x000001ED
_08092A98:
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	movs r1, #2
	strb r1, [r0]
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	strh r2, [r0]
_08092AAA:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08092B64
	ldr r0, _08092ABC @ =gNonGameplayRam
	ldr r1, _08092AC0 @ =0x00000215
	adds r0, r0, r1
	b _08092AE6
	.align 2, 0
_08092ABC: .4byte gNonGameplayRam
_08092AC0: .4byte 0x00000215
_08092AC4:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, #0x8c
	bne _08092AD8
	movs r0, #0x49
	movs r1, #0xf
	bl PlayMusic
_08092AD8:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08092B64
	ldr r1, _08092B0C @ =0x00000215
	adds r0, r4, r1
_08092AE6:
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08092B64
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	movs r0, #0x10
	movs r3, #1
	bl IntroSetupOam
	b _08092B64
	.align 2, 0
_08092B0C: .4byte 0x00000215
_08092B10:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08092B42
	ldr r0, _08092B70 @ =gNonGameplayRam
	ldr r1, _08092B74 @ =0x00000215
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #9
	bhi _08092B42
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	movs r0, #0x10
	movs r3, #1
	bl IntroSetupOam
_08092B42:
	ldr r2, _08092B70 @ =gNonGameplayRam
	movs r0, #0x84
	lsls r0, r0, #2
	adds r3, r2, r0
	ldrh r0, [r3]
	cmp r0, #1
	bne _08092B64
	ldr r1, _08092B78 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
	movs r0, #0
	strh r0, [r3]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #4
	strb r0, [r1]
_08092B64:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _08092BE6
	.align 2, 0
_08092B70: .4byte gNonGameplayRam
_08092B74: .4byte 0x00000215
_08092B78: .4byte 0x04000050
_08092B7C:
	ldr r5, _08092BBC @ =gWrittenToBldy
	ldrh r1, [r5]
	cmp r1, #0xf
	bhi _08092BCC
	movs r0, #0x84
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrh r0, [r2]
	cmp r0, #3
	bne _08092BDE
	movs r0, #0
	strh r0, [r2]
	cmp r1, #0
	bne _08092BB2
	ldr r2, _08092BC0 @ =sMusicTrackDataRom
	ldr r0, _08092BC4 @ =sSoundDataEntries
	ldr r1, _08092BC8 @ =0x00000F64
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0x1e
	bl ApplyMusicSoundFading
_08092BB2:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	b _08092BDE
	.align 2, 0
_08092BBC: .4byte gWrittenToBldy
_08092BC0: .4byte sMusicTrackDataRom
_08092BC4: .4byte sSoundDataEntries
_08092BC8: .4byte 0x00000F64
_08092BCC:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #8
	bne _08092BDE
	movs r0, #0
	strh r0, [r1]
	movs r6, #1
_08092BDE:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08092BE6:
	bl IntroProcessText
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start IntroSamusShipCrashing
IntroSamusShipCrashing: @ 0x08092BF4
	push {r4, lr}
	movs r4, #0
	ldr r0, _08092C10 @ =gNonGameplayRam
	ldrh r1, [r0, #8]
	adds r2, r0, #0
	cmp r1, #5
	bls _08092C04
	b _08092D02
_08092C04:
	lsls r0, r1, #2
	ldr r1, _08092C14 @ =_08092C18
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08092C10: .4byte gNonGameplayRam
_08092C14: .4byte _08092C18
_08092C18: @ jump table
	.4byte _08092C30 @ case 0
	.4byte _08092C44 @ case 1
	.4byte _08092C66 @ case 2
	.4byte _08092C90 @ case 3
	.4byte _08092CB8 @ case 4
	.4byte _08092CE0 @ case 5
_08092C30:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _08092C40 @ =gNonGameplayRam
	movs r0, #2
	strh r0, [r1, #8]
	b _08092D02
	.align 2, 0
_08092C40: .4byte gNonGameplayRam
_08092C44:
	ldr r1, _08092C54 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _08092C58
	subs r0, #1
	strh r0, [r1]
	b _08092C5C
	.align 2, 0
_08092C54: .4byte gWrittenToBldy
_08092C58:
	movs r0, #2
	strh r0, [r2, #8]
_08092C5C:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _08092D02
_08092C66:
	bl IntroSamusInShipProcess
	cmp r0, #0
	beq _08092D02
	ldr r1, _08092C88 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _08092C8C @ =0x00000213
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, #3
	strh r0, [r1, #8]
	b _08092D02
	.align 2, 0
_08092C88: .4byte gNonGameplayRam
_08092C8C: .4byte 0x00000213
_08092C90:
	bl IntroShipAlertProcess
	cmp r0, #0
	beq _08092D02
	ldr r1, _08092CB0 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _08092CB4 @ =0x00000213
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, #4
	strh r0, [r1, #8]
	b _08092D02
	.align 2, 0
_08092CB0: .4byte gNonGameplayRam
_08092CB4: .4byte 0x00000213
_08092CB8:
	bl IntroSamusDriftingOutProcess
	cmp r0, #0
	beq _08092D02
	ldr r1, _08092CD8 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _08092CDC @ =0x00000213
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, #5
	strh r0, [r1, #8]
	b _08092D02
	.align 2, 0
_08092CD8: .4byte gNonGameplayRam
_08092CDC: .4byte 0x00000213
_08092CE0:
	ldr r1, _08092CF0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08092CF4
	adds r0, #1
	strh r0, [r1]
	b _08092CFA
	.align 2, 0
_08092CF0: .4byte gWrittenToBldy
_08092CF4:
	movs r0, #0
	strh r0, [r2, #8]
	movs r4, #1
_08092CFA:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08092D02:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_92d0c
unk_92d0c: @ 0x08092D0C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _08092D68 @ =sRandomNumberTable
	ldr r2, _08092D6C @ =gFrameCounter16Bit
	ldrh r1, [r2]
	movs r3, #0x1f
	adds r0, r3, #0
	ands r0, r1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsrs r6, r0, #2
	ldrh r0, [r2]
	adds r0, #7
	ands r0, r3
	adds r0, r0, r4
	ldrb r0, [r0]
	lsrs r2, r0, #2
	adds r3, r2, #0
	movs r0, #8
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bne _08092D70
	ldrb r0, [r5, #0x13]
	adds r0, #1
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092D98
	strb r1, [r5, #0x13]
	ldrh r1, [r5, #0xe]
	movs r3, #0xe
	ldrsh r0, [r5, r3]
	cmp r0, #0xf
	bgt _08092D98
	adds r0, r1, r2
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08092D98
	movs r0, #0x10
	strh r0, [r5, #0xe]
	movs r0, #1
	strh r0, [r5, #8]
	b _08092D98
	.align 2, 0
_08092D68: .4byte sRandomNumberTable
_08092D6C: .4byte gFrameCounter16Bit
_08092D70:
	ldrb r0, [r5, #0x13]
	adds r0, #1
	movs r2, #0
	strb r0, [r5, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08092D98
	strb r2, [r5, #0x13]
	ldrh r1, [r5, #0xe]
	movs r4, #0xe
	ldrsh r0, [r5, r4]
	cmp r0, #0
	ble _08092D98
	subs r0, r1, r3
	strh r0, [r5, #0xe]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08092D98
	strh r2, [r5, #0xe]
	strh r2, [r5, #8]
_08092D98:
	movs r0, #4
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bne _08092DCE
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08092DF6
	strh r1, [r5, #0xa]
	ldrh r1, [r5, #0xc]
	movs r2, #0xc
	ldrsh r0, [r5, r2]
	cmp r0, #0xf
	bgt _08092DF6
	adds r0, r1, r6
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _08092DF6
	movs r0, #0x10
	strh r0, [r5, #0xc]
	movs r0, #1
	strh r0, [r5, #4]
	b _08092DF6
_08092DCE:
	ldrh r0, [r5, #0xa]
	adds r0, #1
	movs r2, #0
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08092DF6
	strh r2, [r5, #0xa]
	ldrh r1, [r5, #0xc]
	movs r3, #0xc
	ldrsh r0, [r5, r3]
	cmp r0, #0
	ble _08092DF6
	subs r0, r1, r6
	strh r0, [r5, #0xc]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _08092DF6
	strh r2, [r5, #0xc]
	strh r2, [r5, #4]
_08092DF6:
	ldr r1, _08092E40 @ =0x0300122C
	ldrh r0, [r5, #0xc]
	strh r0, [r1]
	ldr r1, _08092E44 @ =0x0300122E
	ldrh r0, [r5, #0xe]
	strh r0, [r1]
	ldr r0, _08092E48 @ =gNonGameplayRam
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #4
	bne _08092E3A
	ldrb r0, [r5, #0x15]
	adds r0, #1
	strb r0, [r5, #0x15]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08092E3A
	movs r0, #0
	strb r0, [r5, #0x15]
	ldr r1, _08092E4C @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	beq _08092E2E
	subs r0, #1
	strh r0, [r1]
_08092E2E:
	ldr r1, _08092E50 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08092E3A
	adds r0, #1
	strh r0, [r1]
_08092E3A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092E40: .4byte 0x0300122C
_08092E44: .4byte 0x0300122E
_08092E48: .4byte gNonGameplayRam
_08092E4C: .4byte gWrittenToBldalpha_R
_08092E50: .4byte gWrittenToBldalpha_L

	thumb_func_start IntroProcessDriftingShip
IntroProcessDriftingShip: @ 0x08092E54
	push {r4, r5, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0xa]
	adds r1, r0, #1
	movs r5, #0
	movs r4, #0
	strh r1, [r3, #0xa]
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	bne _08092E78
	strh r0, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	movs r0, #1
	strb r0, [r3, #0x14]
	b _080930BA
_08092E78:
	cmp r0, #1
	bne _08092F00
	ldrb r1, [r3, #0x13]
	adds r1, #1
	strb r1, [r3, #0x13]
	ldr r2, _08092EFC @ =sSineTable
	ldrb r0, [r3, #0x13]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	ldrh r2, [r3, #2]
	adds r0, r0, r2
	strh r0, [r3, #0xe]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x34
	bls _08092ED0
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _08092EBA
	ldrb r0, [r3, #0x15]
	subs r0, #1
	strb r0, [r3, #0x15]
	ldrh r0, [r3, #0xc]
	subs r0, #1
	strh r0, [r3, #0xc]
	strh r4, [r3, #4]
_08092EBA:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa
	bne _08092ED0
	strh r4, [r3, #8]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
_08092ED0:
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	cmp r0, #0
	blt _08092EDA
	b _080930BA
_08092EDA:
	movs r1, #0
	movs r0, #0
	strh r0, [r3, #8]
	strh r0, [r3, #0xa]
	strh r0, [r3, #4]
	strb r1, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	movs r0, #2
	strb r0, [r3, #0x14]
	movs r0, #0xf9
	lsls r0, r0, #1
	bl SoundPlay
	b _080930BA
	.align 2, 0
_08092EFC: .4byte sSineTable
_08092F00:
	cmp r0, #2
	bne _08092F7C
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x12
	ldrh r0, [r3]
	subs r0, r0, r2
	strh r0, [r3, #0xc]
	lsrs r1, r1, #0x13
	ldrh r2, [r3, #2]
	subs r2, r2, r1
	ldr r1, _08092F78 @ =sSineTable
	ldrb r0, [r3, #0x13]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x17
	adds r2, r2, r0
	strh r2, [r3, #0xe]
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _08092F42
	ldrb r0, [r3, #0x15]
	subs r0, #1
	strb r0, [r3, #0x15]
	strh r4, [r3, #4]
_08092F42:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _08092F58
	strh r4, [r3, #8]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
_08092F58:
	ldrb r0, [r3, #0x13]
	cmp r0, #0
	beq _08092F60
	b _080930BA
_08092F60:
	strh r4, [r3, #8]
	strh r4, [r3, #0xa]
	strh r4, [r3, #4]
	strb r5, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	movs r0, #3
	strb r0, [r3, #0x14]
	b _080930BA
	.align 2, 0
_08092F78: .4byte sSineTable
_08092F7C:
	cmp r0, #3
	bne _08092FE4
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x12
	ldrh r0, [r3]
	subs r0, r0, r2
	strh r0, [r3, #0xc]
	lsrs r1, r1, #0x13
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _08092FAE
	ldrb r0, [r3, #0x15]
	subs r0, #1
	strb r0, [r3, #0x15]
	strh r4, [r3, #4]
_08092FAE:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08092FC4
	strh r4, [r3, #8]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
_08092FC4:
	ldrb r0, [r3, #0x13]
	cmp r0, #0
	bne _08092FDE
	strh r4, [r3, #8]
	strh r4, [r3, #0xa]
	strh r4, [r3, #4]
	strb r5, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	movs r0, #4
	strb r0, [r3, #0x14]
_08092FDE:
	movs r1, #6
	ldrsh r0, [r3, r1]
	b _08093030
_08092FE4:
	cmp r0, #4
	bne _0809304A
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x11
	ldrh r0, [r3]
	subs r0, r0, r2
	strh r0, [r3, #0xc]
	lsrs r1, r1, #0x12
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #4]
	adds r0, #1
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _08093016
	ldrb r0, [r3, #0x15]
	subs r0, #1
	strb r0, [r3, #0x15]
	strh r4, [r3, #4]
_08093016:
	ldrh r0, [r3, #8]
	adds r0, #1
	strh r0, [r3, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0809302C
	strh r4, [r3, #8]
	ldrh r0, [r3, #6]
	subs r0, #1
	strh r0, [r3, #6]
_0809302C:
	movs r2, #6
	ldrsh r0, [r3, r2]
_08093030:
	cmp r0, #2
	bgt _080930BA
	strh r4, [r3, #8]
	strh r4, [r3, #0xa]
	strh r4, [r3, #4]
	strb r5, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	movs r0, #5
	strb r0, [r3, #0x14]
	b _080930BA
_0809304A:
	cmp r0, #5
	bne _08093094
	strh r4, [r3, #0xa]
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #6]
	strb r5, [r3, #0x12]
	strb r5, [r3, #0x11]
	ldrb r1, [r3, #0x18]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x18]
	ldr r0, _08093088 @ =0x0860AD48
	str r0, [r3, #0x1c]
	movs r0, #6
	strb r0, [r3, #0x14]
	ldr r0, _0809308C @ =0x000001F3
	bl unk_3b1c
	ldr r1, _08093090 @ =gNonGameplayRam
	movs r2, #0x84
	lsls r2, r2, #2
	adds r0, r1, r2
	strh r4, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #3
	strb r0, [r1]
	b _080930BA
	.align 2, 0
_08093088: .4byte 0x0860AD48
_0809308C: .4byte 0x000001F3
_08093090: .4byte gNonGameplayRam
_08093094:
	cmp r0, #6
	bne _080930BA
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #3
	ldr r1, [r3, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r3, #0x12]
	cmp r0, r2
	bne _080930BA
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080930BA
	strb r5, [r3, #0x10]
	ldrb r1, [r3, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x18]
_080930BA:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start IntroProcessBslShipSpawning
IntroProcessBslShipSpawning: @ 0x080930C0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r5, [r4, #0x14]
	cmp r5, #0
	bne _0809311C
	ldrh r1, [r4, #0xc]
	adds r1, #0x7a
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0xc
	movs r3, #0
	bl IntroSetupOam
	ldrh r1, [r4, #0xc]
	adds r1, #0x32
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xd
	movs r3, #0
	bl IntroSetupOam
	ldrh r1, [r4, #0xc]
	adds r1, #0x24
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0xe
	movs r3, #0
	bl IntroSetupOam
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0xf
	movs r3, #0
	bl IntroSetupOam
	strb r5, [r4, #0x10]
_0809311C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroProcessBslShipBack
IntroProcessBslShipBack: @ 0x08093124
	push {r4, lr}
	adds r2, r0, #0
	ldrb r3, [r2, #0x14]
	cmp r3, #0
	bne _0809317E
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bne _080931F0
	ldrh r0, [r2]
	adds r0, #1
	movs r1, #0
	strh r0, [r2]
	strb r1, [r2, #0x13]
	ldrh r0, [r2, #0xa]
	cmp r0, #4
	bne _0809314E
	strh r3, [r2, #0xa]
_0809314E:
	ldrh r0, [r2, #0xa]
	adds r1, r0, #0
	adds r3, r0, #0
	cmp r1, #1
	bhi _0809315E
	ldrh r0, [r2, #0xe]
	adds r0, #1
	b _08093166
_0809315E:
	cmp r1, #3
	bhi _08093168
	ldrh r0, [r2, #0xe]
	subs r0, #1
_08093166:
	strh r0, [r2, #0xe]
_08093168:
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0x1e
	bne _08093178
	movs r1, #0
	movs r0, #1
	strb r0, [r2, #0x14]
	strb r1, [r2, #0x13]
_08093178:
	adds r0, r3, #1
	strh r0, [r2, #0xa]
	b _080931F0
_0809317E:
	cmp r3, #1
	bne _08093192
	ldrh r0, [r2, #0xc]
	movs r1, #0
	strh r0, [r2]
	ldrh r0, [r2, #0xe]
	strh r0, [r2, #2]
	strh r1, [r2, #0xa]
	movs r0, #2
	b _080931EE
_08093192:
	cmp r3, #2
	bne _080931F0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _080931AE
	ldrh r0, [r2, #0xa]
	adds r0, #1
	movs r1, #0
	strh r0, [r2, #0xa]
	strb r1, [r2, #0x13]
_080931AE:
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #0xe1
	lsls r0, r0, #2
	subs r0, r0, r1
	ldrh r1, [r2, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	ldrh r1, [r2]
	adds r3, r0, r1
	strh r3, [r2, #0xc]
	movs r4, #4
	ldrsh r0, [r2, r4]
	movs r4, #2
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	ldrh r1, [r2, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xb
	ldrh r1, [r2, #2]
	adds r4, r0, r1
	strh r4, [r2, #0xe]
	lsls r1, r3, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080931F0
	movs r0, #0
	strh r0, [r2, #0xa]
	strh r3, [r2]
	strh r4, [r2, #2]
	movs r0, #3
_080931EE:
	strb r0, [r2, #0x14]
_080931F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroProcessDepthParticle
IntroProcessDepthParticle: @ 0x080931F8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0xa]
	strh r1, [r6, #4]
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	bne _08093222
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	subs r0, #0x78
	movs r1, #0x64
	muls r0, r1, r0
	strh r0, [r6]
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	subs r0, #0x50
	muls r0, r1, r0
	strh r0, [r6, #2]
	movs r0, #1
	strb r0, [r6, #0x14]
	b _080932AE
_08093222:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x63
	bgt _080932A0
	cmp r0, #0x19
	bne _08093238
	ldr r0, _08093234 @ =0x0860AC18
	b _0809324A
	.align 2, 0
_08093234: .4byte 0x0860AC18
_08093238:
	cmp r0, #0x32
	bne _08093244
	ldr r0, _08093240 @ =0x0860AC28
	b _0809324A
	.align 2, 0
_08093240: .4byte 0x0860AC28
_08093244:
	cmp r0, #0x46
	bne _0809324C
	ldr r0, _0809329C @ =0x0860AC38
_0809324A:
	str r0, [r6, #0x1c]
_0809324C:
	movs r0, #4
	ldrsh r4, [r6, r0]
	rsbs r4, r4, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	adds r0, #0x78
	strh r0, [r6, #0xc]
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r4, #0
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x50
	strh r1, [r6, #0xe]
	adds r5, #0x80
	lsls r5, r5, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	cmp r5, r0
	bhi _08093290
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xa8
	bgt _08093290
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080932AE
_08093290:
	movs r0, #0
	strb r0, [r6, #0x10]
	ldrb r1, [r6, #0x18]
	subs r0, #2
	b _080932AA
	.align 2, 0
_0809329C: .4byte 0x0860AC38
_080932A0:
	movs r0, #0
	strb r0, [r6, #0x10]
	ldrb r1, [r6, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
_080932AA:
	ands r0, r1
	strb r0, [r6, #0x18]
_080932AE:
	ldrh r0, [r6, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroProcessTimeAndDistanceOam
IntroProcessTimeAndDistanceOam: @ 0x080932BC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _080932D6
	ldrb r5, [r4, #0x11]
	cmp r5, #1
	bne _080932D6
	movs r0, #0xf7
	lsls r0, r0, #1
	bl SoundPlay
	strb r5, [r4, #0x14]
_080932D6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start IntroProcessAsteroidsPopUp
IntroProcessAsteroidsPopUp: @ 0x080932DC
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _080932F4
	ldrb r5, [r4, #0x11]
	cmp r5, #1
	bne _080932F4
	ldr r0, _080932FC @ =0x000001EF
	bl SoundPlay
	strb r5, [r4, #0x14]
_080932F4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080932FC: .4byte 0x000001EF

	thumb_func_start unk_93300
unk_93300: @ 0x08093300
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0809332C
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	ldrh r1, [r2, #0xa]
	movs r3, #8
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _0809332C
	ldrb r0, [r2, #0x18]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x18]
	movs r0, #1
	strb r0, [r2, #0x14]
	ldr r0, _08093330 @ =0x000001F1
	bl SoundPlay
_0809332C:
	pop {r0}
	bx r0
	.align 2, 0
_08093330: .4byte 0x000001F1

	thumb_func_start unk_93334
unk_93334: @ 0x08093334
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r1, _08093374 @ =0x00FFFF00
	ands r0, r1
	ldr r1, _08093378 @ =0x00010100
	cmp r0, r1
	bne _0809334C
	movs r0, #0xf8
	lsls r0, r0, #1
	bl SoundPlay
_0809334C:
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r2, [r4, #0x12]
	cmp r0, r2
	bne _0809336E
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809336E
	strb r1, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_0809336E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093374: .4byte 0x00FFFF00
_08093378: .4byte 0x00010100

	thumb_func_start IntroOamProcessBigChangingNumber
IntroOamProcessBigChangingNumber: @ 0x0809337C
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _080933A2
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	ldrh r1, [r2, #0xa]
	movs r3, #8
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _080933A2
	ldrb r0, [r2, #0x18]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x18]
	movs r0, #1
	strb r0, [r2, #0x14]
_080933A2:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroSetupOam
IntroSetupOam: @ 0x080933A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08093410
	movs r2, #0
	ldr r0, _0809340C @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r1, r0, r3
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, #0
	beq _080933FE
	mov r4, r8
_080933DE:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x13
	bgt _08093450
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080933DE
_080933FE:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	mov ip, r0
	cmp r1, #0x13
	ble _08093458
	b _08093450
	.align 2, 0
_0809340C: .4byte gNonGameplayRam
_08093410:
	movs r2, #0x13
	ldr r0, _08093454 @ =gNonGameplayRam
	movs r3, #0x9b
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, #0
	beq _08093448
	mov r3, r8
	movs r4, #0x8b
	lsls r4, r4, #2
_08093428:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _08093450
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08093428
_08093448:
	lsls r0, r2, #0x18
	mov ip, r0
	cmp r0, #0
	bge _08093458
_08093450:
	movs r0, #0x14
	b _0809382E
	.align 2, 0
_08093454: .4byte gNonGameplayRam
_08093458:
	movs r0, #0
	str r0, [sp]
	ldr r2, _080934C0 @ =0x040000D4
	mov r3, sp
	str r3, [r2]
	mov r0, ip
	asrs r1, r0, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r4, r0, #2
	ldr r3, _080934C4 @ =0x030016A0
	adds r0, r4, r3
	str r0, [r2, #4]
	ldr r0, _080934C8 @ =0x85000009
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _080934CC @ =0xFFFFFDE4
	adds r0, r3, r1
	adds r2, r4, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r7, #0
	mov r1, sb
	strh r1, [r0]
	ldr r1, _080934D0 @ =0x0000022A
	adds r0, r2, r1
	mov r1, sl
	strh r1, [r0]
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r5, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r6, r2, r0
	ldrb r1, [r6]
	movs r0, #1
	orrs r1, r0
	strb r1, [r6]
	cmp r5, #1
	bne _080934D8
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r6]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _080934D4 @ =unk_92d0c
	str r1, [r0]
	b _0809382A
	.align 2, 0
_080934C0: .4byte 0x040000D4
_080934C4: .4byte 0x030016A0
_080934C8: .4byte 0x85000009
_080934CC: .4byte 0xFFFFFDE4
_080934D0: .4byte 0x0000022A
_080934D4: .4byte unk_92d0c
_080934D8:
	cmp r5, #0xa
	bne _0809352C
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, sb
	strh r1, [r0]
	ldr r1, _0809351C @ =0x0000021E
	adds r0, r2, r1
	mov r1, sl
	strh r1, [r0]
	ldr r0, _08093520 @ =0x00000222
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldrb r1, [r6]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r6]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08093524 @ =0x0860ACD0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08093528 @ =IntroProcessDriftingShip
	str r1, [r0]
	b _0809382A
	.align 2, 0
_0809351C: .4byte 0x0000021E
_08093520: .4byte 0x00000222
_08093524: .4byte 0x0860ACD0
_08093528: .4byte IntroProcessDriftingShip
_0809352C:
	cmp r5, #0xb
	bne _08093558
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r6]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08093550 @ =0x0860ACD0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08093554 @ =IntroProcessBslShipSpawning
	str r1, [r0]
	b _0809382A
	.align 2, 0
_08093550: .4byte 0x0860ACD0
_08093554: .4byte IntroProcessBslShipSpawning
_08093558:
	cmp r5, #0xc
	bne _08093578
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _08093570 @ =0x0000FFD8
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08093574 @ =0x0860AD28
	b _080935CE
	.align 2, 0
_08093570: .4byte 0x0000FFD8
_08093574: .4byte 0x0860AD28
_08093578:
	cmp r5, #0xd
	bne _08093598
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _08093590 @ =0x0000FFE2
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08093594 @ =0x0860AD18
	b _080935CE
	.align 2, 0
_08093590: .4byte 0x0000FFE2
_08093594: .4byte 0x0860AD18
_08093598:
	cmp r5, #0xe
	bne _080935B8
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _080935B0 @ =0x0000FFEC
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _080935B4 @ =0x0860AD08
	b _080935CE
	.align 2, 0
_080935B0: .4byte 0x0000FFEC
_080935B4: .4byte 0x0860AD08
_080935B8:
	cmp r5, #0xf
	bne _080935E8
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _080935DC @ =0x0000FFF6
	strh r0, [r1]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _080935E0 @ =0x0860ACF8
_080935CE:
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _080935E4 @ =IntroProcessBslShipBack
	str r1, [r0]
	b _0809382A
	.align 2, 0
_080935DC: .4byte 0x0000FFF6
_080935E0: .4byte 0x0860ACF8
_080935E4: .4byte IntroProcessBslShipBack
_080935E8:
	cmp r5, #0x10
	bne _0809360C
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08093604 @ =0x0860AC08
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08093608 @ =IntroProcessDepthParticle
	str r1, [r0]
	b _0809382A
	.align 2, 0
_08093604: .4byte 0x0860AC08
_08093608: .4byte IntroProcessDepthParticle
_0809360C:
	cmp r5, #0x13
	bne _08093630
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08093628 @ =0x0865BB38
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809362C @ =IntroProcessTimeAndDistanceOam
	str r1, [r0]
	b _0809382A
	.align 2, 0
_08093628: .4byte 0x0865BB38
_0809362C: .4byte IntroProcessTimeAndDistanceOam
_08093630:
	cmp r5, #0x14
	bne _0809364C
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08093648 @ =0x0865BD00
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	b _0809366E
	.align 2, 0
_08093648: .4byte 0x0865BD00
_0809364C:
	cmp r5, #0x15
	bne _0809367C
	mov r3, ip
	asrs r1, r3, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x8e
	lsls r1, r1, #2
	add r1, r8
	adds r1, r0, r1
	ldr r2, _08093674 @ =0x0865BD48
	str r2, [r1]
	movs r1, #0x8f
	lsls r1, r1, #2
	add r1, r8
	adds r0, r0, r1
_0809366E:
	ldr r1, _08093678 @ =unk_9397c
	str r1, [r0]
	b _0809382A
	.align 2, 0
_08093674: .4byte 0x0865BD48
_08093678: .4byte unk_9397c
_0809367C:
	cmp r5, #0x16
	bne _080936AC
	mov r0, ip
	asrs r1, r0, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x8e
	lsls r1, r1, #2
	add r1, r8
	adds r1, r0, r1
	ldr r2, _080936A4 @ =0x0865BD60
	str r2, [r1]
	movs r1, #0x8f
	lsls r1, r1, #2
	add r1, r8
	adds r0, r0, r1
	ldr r1, _080936A8 @ =IntroProcessAsteroidsPopUp
	str r1, [r0]
	b _0809382A
	.align 2, 0
_080936A4: .4byte 0x0865BD60
_080936A8: .4byte IntroProcessAsteroidsPopUp
_080936AC:
	cmp r5, #0x17
	bne _080936DC
	mov r3, ip
	asrs r1, r3, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	movs r1, #0x8e
	lsls r1, r1, #2
	add r1, r8
	adds r1, r0, r1
	ldr r2, _080936D4 @ =0x0865BE00
	str r2, [r1]
	movs r1, #0x8f
	lsls r1, r1, #2
	add r1, r8
	adds r0, r0, r1
	ldr r1, _080936D8 @ =unk_93334
	str r1, [r0]
	b _0809382A
	.align 2, 0
_080936D4: .4byte 0x0865BE00
_080936D8: .4byte unk_93334
_080936DC:
	cmp r5, #0x18
	bne _08093710
	mov r1, ip
	asrs r0, r1, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r3, r8
	adds r1, r2, r3
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _0809370C @ =0x0865BF10
	b _0809381C
	.align 2, 0
_0809370C: .4byte 0x0865BF10
_08093710:
	cmp r5, #0x19
	bne _08093754
	mov r1, ip
	asrs r0, r1, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r3, r8
	adds r1, r2, r3
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _0809374C @ =0x0865C0D0
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r2, r2, r0
	ldr r0, _08093750 @ =unk_93300
	b _08093828
	.align 2, 0
_0809374C: .4byte 0x0865C0D0
_08093750: .4byte unk_93300
_08093754:
	cmp r5, #0x1a
	bne _08093788
	mov r1, ip
	asrs r0, r1, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r3, r8
	adds r1, r2, r3
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _08093784 @ =0x0865C128
	b _0809381C
	.align 2, 0
_08093784: .4byte 0x0865C128
_08093788:
	cmp r5, #0x1b
	bne _080937BC
	mov r1, ip
	asrs r0, r1, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r3, r8
	adds r1, r2, r3
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _080937B8 @ =0x0865C180
	b _0809381C
	.align 2, 0
_080937B8: .4byte 0x0865C180
_080937BC:
	cmp r5, #0x1c
	bne _080937F0
	mov r1, ip
	asrs r0, r1, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r3, r8
	adds r1, r2, r3
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _080937EC @ =0x0865C1D8
	b _0809381C
	.align 2, 0
_080937EC: .4byte 0x0865C1D8
_080937F0:
	cmp r5, #0x1d
	bne _0809382A
	mov r1, ip
	asrs r0, r1, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r3, r8
	adds r1, r2, r3
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _08093840 @ =0x0865C230
_0809381C:
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r2, r2, r0
	ldr r0, _08093844 @ =IntroOamProcessBigChangingNumber
_08093828:
	str r0, [r2]
_0809382A:
	mov r1, ip
	lsrs r0, r1, #0x18
_0809382E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08093840: .4byte 0x0865C230
_08093844: .4byte IntroOamProcessBigChangingNumber

	thumb_func_start IntroSetupBigNumberOam
IntroSetupBigNumberOam: @ 0x08093848
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #0
	bl IntroSetupOam
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _08093880 @ =gNonGameplayRam
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r1, r0
	strh r4, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08093880: .4byte gNonGameplayRam

	thumb_func_start unk_93884
unk_93884: @ 0x08093884
	ldr r1, _080938D0 @ =0x040000D4
	ldr r0, _080938D4 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080938D8 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _080938DC @ =0x04000052
	ldr r0, _080938E0 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _080938E4 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080938E8 @ =0x04000054
	ldr r0, _080938EC @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x3c
	ldr r0, _080938F0 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080938F4 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080938F8 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080938FC @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_080938D0: .4byte 0x040000D4
_080938D4: .4byte gOamData
_080938D8: .4byte 0x84000100
_080938DC: .4byte 0x04000052
_080938E0: .4byte gWrittenToBldalpha_L
_080938E4: .4byte gWrittenToBldalpha_R
_080938E8: .4byte 0x04000054
_080938EC: .4byte gWrittenToBldy
_080938F0: .4byte 0x0300122C
_080938F4: .4byte 0x0300122E
_080938F8: .4byte 0x03001230
_080938FC: .4byte 0x03001232

	thumb_func_start IntroShipAlertAndDraftingVblank
IntroShipAlertAndDraftingVblank: @ 0x08093900
	ldr r1, _0809394C @ =0x040000D4
	ldr r0, _08093950 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08093954 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08093958 @ =0x04000052
	ldr r0, _0809395C @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08093960 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08093964 @ =0x04000054
	ldr r0, _08093968 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x3c
	ldr r0, _0809396C @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08093970 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08093974 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08093978 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0809394C: .4byte 0x040000D4
_08093950: .4byte gOamData
_08093954: .4byte 0x84000100
_08093958: .4byte 0x04000052
_0809395C: .4byte gWrittenToBldalpha_L
_08093960: .4byte gWrittenToBldalpha_R
_08093964: .4byte 0x04000054
_08093968: .4byte gWrittenToBldy
_0809396C: .4byte 0x0300122C
_08093970: .4byte 0x0300122E
_08093974: .4byte 0x03001230
_08093978: .4byte 0x03001232

	thumb_func_start unk_9397c
unk_9397c: @ 0x0809397C
	bx lr
	.align 2, 0

	thumb_func_start IntroSpaceViewInit
IntroSpaceViewInit: @ 0x08093980
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r3, _08093B10 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08093B14 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08093B18 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08093B1C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08093B20 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08093B24 @ =unk_99940
	bl CallbackSetVBlank
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl unk_24ec
	bl StopAllMusicsAndSounds
	movs r6, #0
	str r6, [sp]
	ldr r4, _08093B28 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r0, _08093B2C @ =gNonGameplayRam
	str r0, [r4, #4]
	ldr r0, _08093B30 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08093B34 @ =0x086101B8
	ldr r1, _08093B38 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _08093B3C @ =0x08612F48
	str r0, [r4]
	ldr r0, _08093B40 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _08093B44 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08093B48 @ =0x0860BCA4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _08093B4C @ =0x0860B670
	ldr r5, _08093B50 @ =0x02010000
	adds r1, r5, #0
	bl LZ77UncompWram
	str r5, [r4]
	ldr r0, _08093B54 @ =0x0600E800
	str r0, [r4, #4]
	ldr r0, _08093B58 @ =0x84000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	add r1, sp, #4
	ldr r2, _08093B5C @ =0x000001FF
	adds r0, r2, #0
	strh r0, [r1]
	str r1, [r4]
	ldr r0, _08093B60 @ =0x0600F000
	str r0, [r4, #4]
	ldr r0, _08093B64 @ =0x81000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08093B68 @ =0x0860B148
	ldr r1, _08093B6C @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08093B70 @ =0x08612E48
	str r0, [r4]
	ldr r0, _08093B74 @ =0x05000100
	str r0, [r4, #4]
	ldr r0, _08093B78 @ =0x84000040
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r6, [r0]
	ldr r0, _08093B7C @ =0x08598898
	ldr r1, _08093B80 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _08093B84 @ =0x04000010
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r0, _08093B88 @ =gBg1XPosition
	strh r6, [r0]
	ldr r0, _08093B8C @ =gBg1YPosition
	strh r6, [r0]
	ldr r0, _08093B90 @ =0x0300122C
	strh r6, [r0]
	ldr r0, _08093B94 @ =0x0300122E
	strh r6, [r0]
	ldr r0, _08093B98 @ =0x03001230
	strh r6, [r0]
	ldr r0, _08093B9C @ =0x03001232
	strh r6, [r0]
	ldr r1, _08093BA0 @ =0x04000008
	ldr r2, _08093BA4 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _08093BA8 @ =0x00005D02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08093BAC @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl IntroSpaceViewSetupOam
	movs r1, #0xf0
	rsbs r1, r1, #0
	movs r2, #0x6e
	rsbs r2, r2, #0
	movs r0, #2
	movs r3, #1
	bl IntroSpaceViewSetupOam
	movs r5, #0
_08093AA4:
	bl SpecialCutsceneGetRandomNumber
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #5
	adds r1, r4, #0
	movs r3, #1
	bl IntroSpaceViewSetupOam
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #9
	bls _08093AA4
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _08093B2C @ =gNonGameplayRam
	ldr r0, _08093BB0 @ =0x0863A19C
	str r0, [r1]
	movs r0, #0
	str r0, [sp]
	ldr r1, _08093B28 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08093BB4 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08093BB8 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r1, #0xd4
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08093BBC @ =IntroSpaceViewVblank
	bl CallbackSetVBlank
	movs r0, #0x60
	movs r1, #0xf
	bl PlayMusic
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093B10: .4byte 0x04000208
_08093B14: .4byte 0x04000004
_08093B18: .4byte 0x0000FFEF
_08093B1C: .4byte 0x04000200
_08093B20: .4byte 0x0000FFFD
_08093B24: .4byte unk_99940
_08093B28: .4byte 0x040000D4
_08093B2C: .4byte gNonGameplayRam
_08093B30: .4byte 0x85000150
_08093B34: .4byte 0x086101B8
_08093B38: .4byte 0x06010000
_08093B3C: .4byte 0x08612F48
_08093B40: .4byte 0x05000200
_08093B44: .4byte 0x84000080
_08093B48: .4byte 0x0860BCA4
_08093B4C: .4byte 0x0860B670
_08093B50: .4byte 0x02010000
_08093B54: .4byte 0x0600E800
_08093B58: .4byte 0x84000200
_08093B5C: .4byte 0x000001FF
_08093B60: .4byte 0x0600F000
_08093B64: .4byte 0x81000400
_08093B68: .4byte 0x0860B148
_08093B6C: .4byte 0x0600F800
_08093B70: .4byte 0x08612E48
_08093B74: .4byte 0x05000100
_08093B78: .4byte 0x84000040
_08093B7C: .4byte 0x08598898
_08093B80: .4byte 0x0600E000
_08093B84: .4byte 0x04000010
_08093B88: .4byte gBg1XPosition
_08093B8C: .4byte gBg1YPosition
_08093B90: .4byte 0x0300122C
_08093B94: .4byte 0x0300122E
_08093B98: .4byte 0x03001230
_08093B9C: .4byte 0x03001232
_08093BA0: .4byte 0x04000008
_08093BA4: .4byte 0x00001C08
_08093BA8: .4byte 0x00005D02
_08093BAC: .4byte 0x00001F03
_08093BB0: .4byte 0x0863A19C
_08093BB4: .4byte 0x0600D000
_08093BB8: .4byte 0x85000400
_08093BBC: .4byte IntroSpaceViewVblank

	thumb_func_start IntroSpaceViewPartProcess
IntroSpaceViewPartProcess: @ 0x08093BC0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r7, #0
	ldr r2, _08093BF0 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r2, r3
	ldrb r0, [r0]
	adds r4, r2, #0
	cmp r0, #7
	bls _08093BE4
	b _08093F38
_08093BE4:
	lsls r0, r0, #2
	ldr r1, _08093BF4 @ =_08093BF8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08093BF0: .4byte gNonGameplayRam
_08093BF4: .4byte _08093BF8
_08093BF8: @ jump table
	.4byte _08093C18 @ case 0
	.4byte _08093C7C @ case 1
	.4byte _08093CB8 @ case 2
	.4byte _08093CEC @ case 3
	.4byte _08093D54 @ case 4
	.4byte _08093D98 @ case 5
	.4byte _08093E5C @ case 6
	.4byte _08093F18 @ case 7
_08093C18:
	ldr r2, _08093C28 @ =gWrittenToBldy
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _08093C2C
	subs r0, #1
	strh r0, [r2]
	b _08093C3E
	.align 2, 0
_08093C28: .4byte gWrittenToBldy
_08093C2C:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r0, r4, r5
	strh r1, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #1
	strb r0, [r1]
_08093C3E:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3f
	bls _08093C4C
	b _08093F00
_08093C4C:
	ldr r0, _08093C74 @ =gNonGameplayRam
	ldr r1, _08093C78 @ =0x00000215
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xd
	bls _08093C5A
	b _08093F00
_08093C5A:
	bl SpecialCutsceneGetRandomNumber
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #5
	adds r1, r4, #0
	b _08093D40
	.align 2, 0
_08093C74: .4byte gNonGameplayRam
_08093C78: .4byte 0x00000215
_08093C7C:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #0x1e
	bne _08093CA2
	movs r0, #0
	strh r0, [r1]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0x4a
	movs r3, #0
	bl IntroSpaceViewSetupOam
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #2
	strb r0, [r1]
_08093CA2:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08093CAE
	b _08093F00
_08093CAE:
	ldr r5, _08093CB4 @ =0x00000215
	adds r0, r4, r5
	b _08093D2A
	.align 2, 0
_08093CB4: .4byte 0x00000215
_08093CB8:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrh r1, [r2]
	subs r0, #0x30
	cmp r1, r0
	bne _08093CD4
	movs r0, #0
	strh r0, [r2]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r4, r2
	movs r0, #3
	strb r0, [r1]
_08093CD4:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08093CE0
	b _08093F00
_08093CE0:
	ldr r3, _08093CE8 @ =0x00000215
	adds r0, r4, r3
	b _08093D2A
	.align 2, 0
_08093CE8: .4byte 0x00000215
_08093CEC:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r2, r4, r5
	ldrh r1, [r2]
	cmp r1, #0x1e
	bne _08093D04
	ldr r0, _08093D00 @ =0x000001E9
	bl SoundPlay
	b _08093D18
	.align 2, 0
_08093D00: .4byte 0x000001E9
_08093D04:
	ldr r0, _08093D48 @ =0x0000041A
	cmp r1, r0
	bne _08093D18
	movs r0, #0
	strh r0, [r2]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #5
	strb r0, [r1]
_08093D18:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _08093D24
	b _08093F00
_08093D24:
	ldr r0, _08093D4C @ =gNonGameplayRam
	ldr r1, _08093D50 @ =0x00000215
	adds r0, r0, r1
_08093D2A:
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _08093D32
	b _08093F00
_08093D32:
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #5
	movs r1, #0
_08093D40:
	movs r3, #1
	bl IntroSpaceViewSetupOam
	b _08093F00
	.align 2, 0
_08093D48: .4byte 0x0000041A
_08093D4C: .4byte gNonGameplayRam
_08093D50: .4byte 0x00000215
_08093D54:
	ldr r4, _08093D84 @ =gWrittenToBldy
	ldrh r0, [r4]
	cmp r0, #0xf
	bhi _08093D94
	cmp r0, #0
	bne _08093D7A
	ldr r2, _08093D88 @ =sMusicTrackDataRom
	ldr r0, _08093D8C @ =sSoundDataEntries
	ldr r3, _08093D90 @ =0x00000F5C
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0xa
	bl ApplyMusicSoundFading
_08093D7A:
	ldrh r0, [r4]
	adds r0, #2
	strh r0, [r4]
	b _08093F00
	.align 2, 0
_08093D84: .4byte gWrittenToBldy
_08093D88: .4byte sMusicTrackDataRom
_08093D8C: .4byte sSoundDataEntries
_08093D90: .4byte 0x00000F5C
_08093D94:
	movs r7, #1
	b _08093F00
_08093D98:
	movs r5, #0x84
	lsls r5, r5, #2
	adds r3, r4, r5
	ldrh r0, [r3]
	cmp r0, #5
	bhi _08093DC4
	ldr r2, _08093DBC @ =0x0879C41C
	adds r1, r0, #0
	subs r1, #1
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	lsls r1, r1, #0xc
	ldr r2, _08093DC0 @ =0x06008000
	adds r1, r1, r2
	bl LZ77UncompVram
	b _08093F00
	.align 2, 0
_08093DBC: .4byte 0x0879C41C
_08093DC0: .4byte 0x06008000
_08093DC4:
	cmp r0, #6
	bne _08093E28
	ldr r0, _08093E00 @ =0x08658BE0
	ldr r1, _08093E04 @ =0x0600E000
	bl LZ77UncompVram
	ldr r1, _08093E08 @ =0x040000D4
	ldr r0, _08093E0C @ =0x086591E4
	str r0, [r1]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08093E10 @ =0x84000040
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08093E14 @ =gWrittenToBldalpha_R
	movs r1, #0
	strh r1, [r0]
	ldr r2, _08093E18 @ =gWrittenToBldalpha_L
	movs r0, #0x10
	strh r0, [r2]
	ldr r0, _08093E1C @ =0x04000014
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	ldr r1, _08093E20 @ =0x0400000A
	ldr r3, _08093E24 @ =0x00001C08
	adds r0, r3, #0
	strh r0, [r1]
	b _08093F00
	.align 2, 0
_08093E00: .4byte 0x08658BE0
_08093E04: .4byte 0x0600E000
_08093E08: .4byte 0x040000D4
_08093E0C: .4byte 0x086591E4
_08093E10: .4byte 0x84000040
_08093E14: .4byte gWrittenToBldalpha_R
_08093E18: .4byte gWrittenToBldalpha_L
_08093E1C: .4byte 0x04000014
_08093E20: .4byte 0x0400000A
_08093E24: .4byte 0x00001C08
_08093E28:
	cmp r0, #7
	bne _08093F00
	ldr r1, _08093E54 @ =0x04000050
	ldr r5, _08093E58 @ =0x00003C42
	adds r0, r5, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r3]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #6
	strb r0, [r1]
	b _08093F00
	.align 2, 0
_08093E54: .4byte 0x04000050
_08093E58: .4byte 0x00003C42
_08093E5C:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #4
	bne _08093F00
	movs r2, #0
	strh r2, [r1]
	ldr r6, _08093EC0 @ =gWrittenToBldalpha_R
	ldrh r0, [r6]
	cmp r0, #0xf
	bhi _08093EDC
	cmp r0, #0
	bne _08093EB0
	ldr r5, _08093EC4 @ =sMusicTrackDataRom
	ldr r4, _08093EC8 @ =sSoundDataEntries
	ldr r3, _08093ECC @ =0x00000F4C
	adds r0, r4, r3
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0x3c
	bl ApplyMusicSoundFading
	ldr r0, _08093ED0 @ =0x00000F54
	adds r4, r4, r0
	ldrh r1, [r4]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0x3c
	bl ApplyMusicSoundFading
	ldr r0, _08093ED4 @ =0x000001EB
	movs r1, #0x3c
	bl unk_2ad4
_08093EB0:
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	ldr r1, _08093ED8 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	b _08093F00
	.align 2, 0
_08093EC0: .4byte gWrittenToBldalpha_R
_08093EC4: .4byte sMusicTrackDataRom
_08093EC8: .4byte sSoundDataEntries
_08093ECC: .4byte 0x00000F4C
_08093ED0: .4byte 0x00000F54
_08093ED4: .4byte 0x000001EB
_08093ED8: .4byte gWrittenToBldalpha_L
_08093EDC:
	str r2, [sp]
	ldr r1, _08093F0C @ =0x040000D4
	mov r3, sp
	str r3, [r1]
	movs r5, #0x87
	lsls r5, r5, #2
	adds r0, r4, r5
	str r0, [r1, #4]
	ldr r0, _08093F10 @ =0x850000B4
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _08093F14 @ =gWrittenToBldy
	strh r2, [r0]
_08093F00:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _08093F38
	.align 2, 0
_08093F0C: .4byte 0x040000D4
_08093F10: .4byte 0x850000B4
_08093F14: .4byte gWrittenToBldy
_08093F18:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r4, r2
	ldrh r0, [r1]
	cmp r0, #0x96
	bne _08093F38
	movs r0, #0
	strh r0, [r1]
	movs r3, #0x85
	lsls r3, r3, #2
	adds r1, r4, r3
	movs r0, #4
	strb r0, [r1]
	ldr r1, _08093F48 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
_08093F38:
	bl IntroProcessText
	adds r0, r7, #0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08093F48: .4byte 0x04000050

	thumb_func_start IntroFlyingViewInit
IntroFlyingViewInit: @ 0x08093F4C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r3, _0809407C @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08094080 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08094084 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08094088 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809408C @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08094090 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _08094094 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r1, _08094098 @ =0x030016A0
	mov r8, r1
	str r1, [r4, #4]
	ldr r0, _0809409C @ =0x850000B4
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080940A0 @ =0x086101B8
	ldr r1, _080940A4 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _080940A8 @ =0x08612F48
	str r0, [r4]
	ldr r0, _080940AC @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _080940B0 @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080940B4 @ =0x08605D08
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080940B8 @ =0x08609220
	ldr r1, _080940BC @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _080940C0 @ =0x08598898
	ldr r1, _080940C4 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _080940C8 @ =0x08609020
	str r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080940CC @ =0x08598A8C
	str r0, [r4]
	ldr r0, _080940D0 @ =0x050001E0
	str r0, [r4, #4]
	ldr r0, _080940D4 @ =0x84000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	strh r5, [r1]
	ldr r0, _080940D8 @ =0x04000010
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
	ldr r0, _080940DC @ =gBg1XPosition
	strh r5, [r0]
	ldr r0, _080940E0 @ =gBg1YPosition
	strh r5, [r0]
	ldr r0, _080940E4 @ =0x0300122C
	strh r5, [r0]
	ldr r0, _080940E8 @ =0x0300122E
	strh r5, [r0]
	ldr r0, _080940EC @ =0x03001230
	strh r5, [r0]
	ldr r0, _080940F0 @ =0x03001232
	strh r5, [r0]
	ldr r1, _080940F4 @ =0x04000008
	ldr r2, _080940F8 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #6
	ldr r2, _080940FC @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0xa
	movs r1, #0x91
	movs r2, #0x8c
	movs r3, #0
	bl IntroSpaceViewSetupOam
	movs r0, #0xb
	movs r1, #0x8c
	movs r2, #0x50
	movs r3, #0
	bl IntroSpaceViewSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _08094100 @ =0xFFFFFDE4
	add r8, r0
	ldr r0, _08094104 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r0, _08094108 @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _0809410C @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xc8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08094110 @ =IntroSpaceViewVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809407C: .4byte 0x04000208
_08094080: .4byte 0x04000004
_08094084: .4byte 0x0000FFEF
_08094088: .4byte 0x04000200
_0809408C: .4byte 0x0000FFFD
_08094090: .4byte unk_99940
_08094094: .4byte 0x040000D4
_08094098: .4byte 0x030016A0
_0809409C: .4byte 0x850000B4
_080940A0: .4byte 0x086101B8
_080940A4: .4byte 0x06010000
_080940A8: .4byte 0x08612F48
_080940AC: .4byte 0x05000200
_080940B0: .4byte 0x84000080
_080940B4: .4byte 0x08605D08
_080940B8: .4byte 0x08609220
_080940BC: .4byte 0x0600F800
_080940C0: .4byte 0x08598898
_080940C4: .4byte 0x0600E000
_080940C8: .4byte 0x08609020
_080940CC: .4byte 0x08598A8C
_080940D0: .4byte 0x050001E0
_080940D4: .4byte 0x84000008
_080940D8: .4byte 0x04000010
_080940DC: .4byte gBg1XPosition
_080940E0: .4byte gBg1YPosition
_080940E4: .4byte 0x0300122C
_080940E8: .4byte 0x0300122E
_080940EC: .4byte 0x03001230
_080940F0: .4byte 0x03001232
_080940F4: .4byte 0x04000008
_080940F8: .4byte 0x00001C08
_080940FC: .4byte 0x00001F03
_08094100: .4byte 0xFFFFFDE4
_08094104: .4byte 0x0863A19C
_08094108: .4byte 0x0600D000
_0809410C: .4byte 0x85000400
_08094110: .4byte IntroSpaceViewVblank

	thumb_func_start IntroFlyingViewProcess
IntroFlyingViewProcess: @ 0x08094114
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0809413C @ =gNonGameplayRam
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r4, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r2, r4, r0
	ldrb r0, [r2]
	cmp r0, #1
	beq _0809417C
	cmp r0, #1
	bgt _08094140
	cmp r0, #0
	beq _08094146
	b _080941F6
	.align 2, 0
_0809413C: .4byte gNonGameplayRam
_08094140:
	cmp r0, #2
	beq _080941D8
	b _080941F6
_08094146:
	ldr r4, _0809416C @ =gWrittenToBldy
	ldrh r0, [r4]
	cmp r0, #0
	beq _08094174
	cmp r0, #0x10
	bne _08094164
	movs r0, #0xf6
	lsls r0, r0, #1
	movs r1, #0
	bl unk_2ad4
	ldr r0, _08094170 @ =0x000001ED
	movs r1, #0
	bl unk_2ad4
_08094164:
	ldrh r0, [r4]
	subs r0, #2
	strh r0, [r4]
	b _080941C6
	.align 2, 0
_0809416C: .4byte gWrittenToBldy
_08094170: .4byte 0x000001ED
_08094174:
	strh r5, [r1]
	movs r0, #1
	strb r0, [r2]
	b _080941C6
_0809417C:
	bl SpecialCutsceneGetRandomNumber
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _080941AE
	ldr r1, _080941D0 @ =0x00000215
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #9
	bhi _080941AE
	bl SpecialCutsceneGetRandomNumber
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SpecialCutsceneGetRandomNumber
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0x10
	adds r1, r4, #0
	movs r3, #0
	bl IntroSpaceViewSetupOam
_080941AE:
	ldr r0, _080941D4 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r2, r0, r1
	ldrh r1, [r2]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	bne _080941C6
	movs r0, #0
	strh r0, [r2]
	movs r5, #1
_080941C6:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _080941F6
	.align 2, 0
_080941D0: .4byte 0x00000215
_080941D4: .4byte gNonGameplayRam
_080941D8:
	ldr r1, _080941E8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080941EC
	adds r0, #1
	strh r0, [r1]
	b _080941EE
	.align 2, 0
_080941E8: .4byte gWrittenToBldy
_080941EC:
	movs r5, #1
_080941EE:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_080941F6:
	bl IntroProcessText
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start IntroSpaceView
IntroSpaceView: @ 0x08094204
	push {r4, lr}
	movs r4, #0
	ldr r0, _08094220 @ =gNonGameplayRam
	ldrh r1, [r0, #8]
	adds r2, r0, #0
	cmp r1, #7
	bls _08094214
	b _0809431E
_08094214:
	lsls r0, r1, #2
	ldr r1, _08094224 @ =_08094228
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08094220: .4byte gNonGameplayRam
_08094224: .4byte _08094228
_08094228: @ jump table
	.4byte _08094248 @ case 0
	.4byte _08094258 @ case 1
	.4byte _08094274 @ case 2
	.4byte _0809429C @ case 3
	.4byte _080942BC @ case 4
	.4byte _080942CC @ case 5
	.4byte _080942D2 @ case 6
	.4byte _080942FC @ case 7
_08094248:
	bl IntroSpaceViewInit
	ldr r1, _08094254 @ =gNonGameplayRam
	movs r0, #1
	strh r0, [r1, #8]
	b _0809431E
	.align 2, 0
_08094254: .4byte gNonGameplayRam
_08094258:
	bl SpecialCutsceneFadeIn
	ldr r0, _0809426C @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809431E
	ldr r1, _08094270 @ =gNonGameplayRam
	movs r0, #2
	strh r0, [r1, #8]
	b _0809431E
	.align 2, 0
_0809426C: .4byte gWrittenToBldy
_08094270: .4byte gNonGameplayRam
_08094274:
	bl IntroSpaceViewPartProcess
	cmp r0, #0
	beq _0809431E
	ldr r1, _08094294 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _08094298 @ =0x00000213
	adds r0, r1, r3
	strb r2, [r0]
	movs r0, #3
	strh r0, [r1, #8]
	b _0809431E
	.align 2, 0
_08094294: .4byte gNonGameplayRam
_08094298: .4byte 0x00000213
_0809429C:
	ldr r1, _080942AC @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080942B0
	adds r0, #1
	strh r0, [r1]
	b _080942B4
	.align 2, 0
_080942AC: .4byte gWrittenToBldy
_080942B0:
	movs r0, #4
	strh r0, [r2, #8]
_080942B4:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_080942BC:
	bl IntroFlyingViewInit
	ldr r1, _080942C8 @ =gNonGameplayRam
	movs r0, #6
	strh r0, [r1, #8]
	b _0809431E
	.align 2, 0
_080942C8: .4byte gNonGameplayRam
_080942CC:
	movs r0, #6
	strh r0, [r2, #8]
	b _0809431E
_080942D2:
	bl IntroFlyingViewProcess
	cmp r0, #0
	beq _0809431E
	ldr r2, _080942F4 @ =gNonGameplayRam
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r3, _080942F8 @ =0x00000213
	adds r1, r2, r3
	strb r0, [r1]
	strh r0, [r2, #8]
	movs r4, #1
	b _0809431E
	.align 2, 0
_080942F4: .4byte gNonGameplayRam
_080942F8: .4byte 0x00000213
_080942FC:
	ldr r1, _0809430C @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08094310
	adds r0, #1
	strh r0, [r1]
	b _08094316
	.align 2, 0
_0809430C: .4byte gWrittenToBldy
_08094310:
	movs r0, #0
	strh r0, [r2, #8]
	movs r4, #1
_08094316:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_0809431E:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start IntroProcessSpaceViewScrolling
IntroProcessSpaceViewScrolling: @ 0x08094328
	push {lr}
	adds r1, r0, #0
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bne _08094346
	movs r0, #0
	strb r0, [r1, #0x12]
	ldr r1, _0809434C @ =0x03001230
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08094346:
	pop {r0}
	bx r0
	.align 2, 0
_0809434C: .4byte 0x03001230

	thumb_func_start IntroProcessBslShipSideways
IntroProcessBslShipSideways: @ 0x08094350
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r1, [r5, #0xc]
	movs r6, #0
	strh r1, [r5, #4]
	ldrb r0, [r5, #0x14]
	cmp r0, #0
	bne _08094380
	strh r1, [r5]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	ldr r0, _0809437C @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #3
	beq _08094376
	b _080944D6
_08094376:
	movs r0, #1
	b _080944D4
	.align 2, 0
_0809437C: .4byte gNonGameplayRam
_08094380:
	cmp r0, #1
	bne _080943E2
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	movs r1, #0xc3
	lsls r1, r1, #0x12
	cmp r0, r1
	bne _080943A2
	movs r1, #0x82
	lsls r1, r1, #1
	movs r0, #3
	movs r2, #0x6e
	movs r3, #0
	bl IntroSpaceViewSetupOam
_080943A2:
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r1, #0x3c
	subs r1, r1, r0
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #1
	muls r0, r1, r0
	asrs r0, r0, #0xb
	ldrh r3, [r5]
	adds r2, r0, r3
	strh r2, [r5, #0xc]
	movs r4, #2
	ldrsh r0, [r5, r4]
	movs r1, #0xa
	subs r1, r1, r0
	ldrh r0, [r5, #0xa]
	lsls r0, r0, #1
	muls r0, r1, r0
	asrs r0, r0, #0xb
	ldrh r7, [r5, #2]
	adds r1, r0, r7
	strh r1, [r5, #0xe]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1d
	bgt _080943D8
	b _080944D6
_080943D8:
	strh r6, [r5, #0xa]
	strh r2, [r5]
	strh r1, [r5, #2]
	movs r0, #2
	b _080944D4
_080943E2:
	cmp r0, #2
	bne _08094408
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _080944D6
	strh r6, [r5, #0xa]
	movs r0, #4
	strh r0, [r5, #2]
	strh r1, [r5, #4]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #8]
	movs r0, #0
	strb r0, [r5, #0x13]
	movs r0, #3
	b _080944D4
_08094408:
	cmp r0, #3
	bne _08094480
	movs r0, #0
	ldrsh r3, [r5, r0]
	ldr r2, _08094478 @ =sSineTable
	ldrb r1, [r5, #0x13]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r4, r3, #0
	muls r4, r0, r4
	movs r7, #2
	ldrsh r3, [r5, r7]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r7, #0
	ldrsh r0, [r1, r7]
	muls r3, r0, r3
	movs r1, #0
	ldrsh r0, [r2, r1]
	adds r1, r4, #0
	muls r1, r0, r1
	adds r2, #0x80
	movs r4, #0
	ldrsh r0, [r2, r4]
	muls r0, r3, r0
	adds r1, r1, r0
	ldrh r0, [r5, #0xa]
	lsrs r0, r0, #2
	ldrh r7, [r5]
	adds r0, r0, r7
	strh r0, [r5, #0xc]
	asrs r1, r1, #0x10
	ldrh r0, [r5, #8]
	adds r1, r1, r0
	strh r1, [r5, #0xe]
	ldrb r0, [r5, #0x13]
	adds r0, #1
	strb r0, [r5, #0x13]
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0x3c
	beq _080944D6
	ldr r0, _0809447C @ =0x00007530
	cmp r1, r0
	bne _080944D6
	strh r6, [r5, #0xa]
	movs r0, #4
	b _080944D4
	.align 2, 0
_08094478: .4byte sSineTable
_0809447C: .4byte 0x00007530
_08094480:
	cmp r0, #4
	bne _08094490
	movs r0, #5
	strb r0, [r5, #0x14]
	strh r1, [r5]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	b _080944D6
_08094490:
	cmp r0, #5
	bne _080944D6
	ldrh r0, [r5, #0xa]
	adds r0, #1
	strh r0, [r5, #0xa]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r0, #0x82
	lsls r0, r0, #2
	subs r0, r0, r1
	ldrh r1, [r5, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	ldrh r3, [r5]
	adds r2, r0, r3
	strh r2, [r5, #0xc]
	movs r4, #2
	ldrsh r1, [r5, r4]
	movs r0, #0x64
	subs r0, r0, r1
	ldrh r1, [r5, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xa
	ldrh r7, [r5, #2]
	adds r3, r0, r7
	strh r3, [r5, #0xe]
	lsls r1, r2, #0x10
	ldr r0, _08094544 @ =0x02070000
	cmp r1, r0
	ble _080944D6
	strh r6, [r5, #0xa]
	strh r2, [r5]
	strh r3, [r5, #2]
	movs r0, #6
_080944D4:
	strb r0, [r5, #0x14]
_080944D6:
	ldr r0, _08094548 @ =0x0300122C
	ldrh r2, [r5, #0xc]
	strh r2, [r0]
	ldr r1, _0809454C @ =0x0300122E
	ldrh r0, [r5, #0xe]
	strh r0, [r1]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x78
	rsbs r1, r1, #0
	cmp r0, r1
	blt _08094584
	ldrb r0, [r5, #4]
	subs r0, r2, r0
	ldrb r2, [r5, #0x11]
	adds r1, r0, r2
	movs r4, #0
	strb r1, [r5, #0x11]
	ldrb r2, [r5, #0x1a]
	lsrs r0, r2, #4
	cmp r0, #0
	bne _08094558
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08094584
	adds r0, r1, #0
	subs r0, #8
	strb r0, [r5, #0x11]
	ldrb r1, [r5, #0x12]
	lsls r1, r1, #1
	ldr r0, _08094550 @ =0x02010800
	adds r0, r1, r0
	ldr r2, _08094554 @ =0x0600F000
	adds r1, r1, r2
	movs r2, #1
	movs r3, #0x14
	bl Dma3Transfer_Unused2
	ldrb r0, [r5, #0x12]
	adds r0, #1
	strb r0, [r5, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bne _08094584
	strb r4, [r5, #0x12]
	ldrb r0, [r5, #0x1a]
	movs r1, #0xf
	ands r1, r0
	movs r0, #0x10
	orrs r1, r0
	strb r1, [r5, #0x1a]
	b _08094584
	.align 2, 0
_08094544: .4byte 0x02070000
_08094548: .4byte 0x0300122C
_0809454C: .4byte 0x0300122E
_08094550: .4byte 0x02010800
_08094554: .4byte 0x0600F000
_08094558:
	cmp r0, #1
	bne _08094584
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _08094584
	adds r0, r1, #0
	subs r0, #8
	strb r0, [r5, #0x11]
	ldrb r0, [r5, #0x12]
	adds r0, #1
	strb r0, [r5, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bne _08094584
	strb r4, [r5, #0x12]
	movs r0, #0xf
	ands r0, r2
	movs r1, #0xa0
	orrs r0, r1
	strb r0, [r5, #0x1a]
_08094584:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroProcessSamusSHipEntering
IntroProcessSamusSHipEntering: @ 0x0809458C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	bne _080945BC
	movs r0, #0x64
	strh r0, [r6]
	movs r0, #0x1e
	strh r0, [r6, #2]
	ldrh r0, [r6, #0xc]
	strh r0, [r6, #4]
	ldrh r0, [r6, #0xe]
	subs r0, #0x1e
	strh r0, [r6, #8]
	movs r0, #0x40
	strb r0, [r6, #0x13]
	movs r0, #1
	strb r0, [r6, #0x14]
	movs r0, #0xf5
	lsls r0, r0, #1
	bl SoundPlay
	b _08094676
_080945BC:
	cmp r0, #1
	bne _080945DE
	ldrb r1, [r6, #0x13]
	adds r1, #1
	strb r1, [r6, #0x13]
	ldrh r0, [r6, #6]
	subs r0, #2
	strh r0, [r6, #6]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x80
	bne _08094676
	movs r0, #2
	strb r0, [r6, #0x14]
	adds r0, #0xfe
	strh r0, [r6, #6]
	b _08094676
_080945DE:
	cmp r0, #2
	bne _080945FA
	strh r4, [r6]
	movs r0, #8
	strh r0, [r6, #2]
	ldrh r0, [r6, #0xc]
	strh r0, [r6, #4]
	ldrh r0, [r6, #0xe]
	strh r0, [r6, #8]
	movs r0, #0x80
	strb r0, [r6, #0x13]
	movs r0, #3
	strb r0, [r6, #0x14]
	b _08094676
_080945FA:
	cmp r0, #3
	bne _08094612
	ldrb r0, [r6, #0x13]
	adds r0, #2
	strb r0, [r6, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc0
	bne _08094676
	movs r0, #4
	strb r0, [r6, #0x14]
	b _08094676
_08094612:
	cmp r0, #4
	bne _08094634
	ldrb r0, [r6, #0x13]
	adds r0, #1
	strb r0, [r6, #0x13]
	ldrh r0, [r6, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #8
	bne _08094676
	strh r4, [r6, #0xa]
	ldrh r0, [r6, #4]
	subs r0, #1
	strh r0, [r6, #4]
	b _08094676
_08094634:
	cmp r0, #5
	bne _0809465A
	ldrh r2, [r6, #0xc]
	movs r1, #0x8c
	lsls r1, r1, #1
	adds r0, r1, #0
	subs r0, r0, r2
	strh r0, [r6]
	movs r1, #0x3c
	strh r1, [r6, #2]
	adds r2, r2, r0
	strh r2, [r6, #4]
	ldrh r0, [r6, #0xe]
	strh r0, [r6, #8]
	movs r0, #0x80
	strb r0, [r6, #0x13]
	movs r0, #6
	strb r0, [r6, #0x14]
	b _08094676
_0809465A:
	cmp r0, #6
	bne _08094676
	ldrb r0, [r6, #0x13]
	adds r0, #1
	strb r0, [r6, #0x13]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08094676
	strb r4, [r6, #0x10]
	ldrb r1, [r6, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #0x18]
_08094676:
	movs r2, #0
	ldrsh r3, [r6, r2]
	ldr r2, _080946D4 @ =sSineTable
	ldrb r1, [r6, #0x13]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r4, #0
	ldrsh r0, [r0, r4]
	adds r5, r3, #0
	muls r5, r0, r5
	movs r0, #2
	ldrsh r3, [r6, r0]
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	adds r4, r3, #0
	muls r4, r0, r4
	adds r0, r2, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r1, r5, #0
	muls r1, r3, r1
	movs r0, #0
	ldrsh r2, [r2, r0]
	adds r0, r4, #0
	muls r0, r2, r0
	subs r1, r1, r0
	adds r0, r5, #0
	muls r0, r2, r0
	adds r2, r4, #0
	muls r2, r3, r2
	adds r0, r0, r2
	asrs r1, r1, #0x10
	ldrh r2, [r6, #4]
	adds r1, r1, r2
	strh r1, [r6, #0xc]
	asrs r0, r0, #0x10
	ldrh r4, [r6, #8]
	adds r0, r0, r4
	strh r0, [r6, #0xe]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080946D4: .4byte sSineTable

	thumb_func_start IntroProcessSplashText
IntroProcessSplashText: @ 0x080946D8
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _080946FE
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080946FE
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_080946FE:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroProcessSpaceViewParticle
IntroProcessSpaceViewParticle: @ 0x08094704
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _08094740
	bl SpecialCutsceneGetRandomNumber
	movs r1, #7
	ands r1, r0
	adds r1, #1
	strh r1, [r4, #8]
	bl SpecialCutsceneGetRandomNumber
	movs r1, #3
	ands r1, r0
	strh r1, [r4, #4]
	ldr r1, _0809473C @ =0x0879C394
	movs r2, #4
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _08094792
	.align 2, 0
_0809473C: .4byte 0x0879C394
_08094740:
	cmp r0, #1
	bne _08094792
	ldrh r0, [r4, #0xa]
	adds r0, #1
	strh r0, [r4, #0xa]
	movs r0, #8
	ldrsh r1, [r4, r0]
	ldrh r0, [r4, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #4
	ldrh r1, [r4]
	adds r0, r0, r1
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _08094792
	movs r0, #0
	strb r0, [r4, #0x13]
	ldrh r1, [r4, #4]
	movs r2, #4
	ldrsh r0, [r4, r2]
	cmp r0, #4
	bgt _0809477A
	adds r0, r1, #1
	b _0809477C
_0809477A:
	movs r0, #0
_0809477C:
	strh r0, [r4, #4]
	ldr r1, _080947B4 @ =0x0879C394
	movs r2, #4
	ldrsh r0, [r4, r2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	movs r0, #0
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
_08094792:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	cmp r0, #0xef
	bgt _080947A2
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0x9f
	ble _080947AE
_080947A2:
	movs r0, #0
	strb r0, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	subs r0, #2
	ands r0, r1
	strb r0, [r4, #0x18]
_080947AE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080947B4: .4byte 0x0879C394

	thumb_func_start IntroProcessIdleShipBackview
IntroProcessIdleShipBackview: @ 0x080947B8
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _080947D2
	strh r0, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	strh r0, [r2]
	ldrh r0, [r2, #0xe]
	strh r0, [r2, #2]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _080947F0
_080947D2:
	cmp r0, #1
	bne _080947F0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldr r1, _080947F4 @ =sSineTable
	ldrb r0, [r2, #0x13]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x15
	ldrh r1, [r2, #2]
	adds r0, r0, r1
	strh r0, [r2, #0xe]
_080947F0:
	pop {r0}
	bx r0
	.align 2, 0
_080947F4: .4byte sSineTable

	thumb_func_start IntroProcessBslShipSpawning_2
IntroProcessBslShipSpawning_2: @ 0x080947F8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrb r5, [r4, #0x14]
	cmp r5, #0
	bne _08094854
	ldrh r1, [r4, #0xc]
	adds r1, #0x7a
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0xc
	movs r3, #0
	bl IntroSpaceViewSetupOam
	ldrh r1, [r4, #0xc]
	adds r1, #0x32
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4, #0xe]
	adds r2, #1
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #0xd
	movs r3, #0
	bl IntroSpaceViewSetupOam
	ldrh r1, [r4, #0xc]
	adds r1, #0x24
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0xe
	movs r3, #0
	bl IntroSpaceViewSetupOam
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	movs r0, #0xf
	movs r3, #0
	bl IntroSpaceViewSetupOam
	strb r5, [r4, #0x10]
_08094854:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroProcessBslShipBackview
IntroProcessBslShipBackview: @ 0x0809485C
	push {r4, lr}
	adds r2, r0, #0
	ldrb r3, [r2, #0x14]
	cmp r3, #0
	bne _080948BA
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bne _0809492C
	ldrh r0, [r2]
	adds r0, #1
	movs r1, #0
	strh r0, [r2]
	strb r1, [r2, #0x13]
	ldrh r0, [r2, #0xa]
	cmp r0, #4
	bne _08094886
	strh r3, [r2, #0xa]
_08094886:
	ldrh r0, [r2, #0xa]
	adds r1, r0, #0
	adds r3, r0, #0
	cmp r1, #1
	bhi _08094896
	ldrh r0, [r2, #0xe]
	adds r0, #1
	b _0809489E
_08094896:
	cmp r1, #3
	bhi _080948A0
	ldrh r0, [r2, #0xe]
	subs r0, #1
_0809489E:
	strh r0, [r2, #0xe]
_080948A0:
	movs r0, #0
	ldrsh r1, [r2, r0]
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	bne _080948B4
	movs r1, #0
	movs r0, #1
	strb r0, [r2, #0x14]
	strb r1, [r2, #0x13]
_080948B4:
	adds r0, r3, #1
	strh r0, [r2, #0xa]
	b _0809492C
_080948BA:
	cmp r3, #1
	bne _080948CE
	ldrh r0, [r2, #0xc]
	movs r1, #0
	strh r0, [r2]
	ldrh r0, [r2, #0xe]
	strh r0, [r2, #2]
	strh r1, [r2, #0xa]
	movs r0, #2
	b _0809492A
_080948CE:
	cmp r3, #2
	bne _0809492C
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _080948EA
	ldrh r0, [r2, #0xa]
	adds r0, #1
	movs r1, #0
	strh r0, [r2, #0xa]
	strb r1, [r2, #0x13]
_080948EA:
	movs r4, #0
	ldrsh r1, [r2, r4]
	movs r0, #0xe1
	lsls r0, r0, #2
	subs r0, r0, r1
	ldrh r1, [r2, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xc
	ldrh r1, [r2]
	adds r3, r0, r1
	strh r3, [r2, #0xc]
	movs r4, #4
	ldrsh r0, [r2, r4]
	movs r4, #2
	ldrsh r1, [r2, r4]
	subs r0, r0, r1
	ldrh r1, [r2, #0xa]
	muls r0, r1, r0
	asrs r0, r0, #0xb
	ldrh r1, [r2, #2]
	adds r4, r0, r1
	strh r4, [r2, #0xe]
	lsls r1, r3, #0x10
	movs r0, #0xa0
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _0809492C
	movs r0, #0
	strh r0, [r2, #0xa]
	strh r3, [r2]
	strh r4, [r2, #2]
	movs r0, #3
_0809492A:
	strb r0, [r2, #0x14]
_0809492C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroProcessIdleDepthParticle
IntroProcessIdleDepthParticle: @ 0x08094934
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldrh r1, [r6, #0xa]
	strh r1, [r6, #4]
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	bne _0809495E
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	subs r0, #0x78
	movs r1, #0x64
	muls r0, r1, r0
	strh r0, [r6]
	movs r2, #0xe
	ldrsh r0, [r6, r2]
	subs r0, #0x50
	muls r0, r1, r0
	strh r0, [r6, #2]
	movs r0, #1
	strb r0, [r6, #0x14]
	b _080949EA
_0809495E:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x63
	bgt _080949DC
	cmp r0, #0x19
	bne _08094974
	ldr r0, _08094970 @ =0x0860AC18
	b _08094986
	.align 2, 0
_08094970: .4byte 0x0860AC18
_08094974:
	cmp r0, #0x32
	bne _08094980
	ldr r0, _0809497C @ =0x0860AC28
	b _08094986
	.align 2, 0
_0809497C: .4byte 0x0860AC28
_08094980:
	cmp r0, #0x46
	bne _08094988
	ldr r0, _080949D8 @ =0x0860AC38
_08094986:
	str r0, [r6, #0x1c]
_08094988:
	movs r0, #4
	ldrsh r4, [r6, r0]
	rsbs r4, r4, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r6, r1]
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	adds r0, #0x78
	strh r0, [r6, #0xc]
	movs r2, #2
	ldrsh r0, [r6, r2]
	adds r1, r4, #0
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x50
	strh r1, [r6, #0xe]
	adds r5, #0x80
	lsls r5, r5, #0x10
	movs r0, #0x80
	lsls r0, r0, #0x11
	cmp r5, r0
	bhi _080949CC
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0xa8
	bgt _080949CC
	movs r0, #8
	rsbs r0, r0, #0
	cmp r1, r0
	bge _080949EA
_080949CC:
	movs r0, #0
	strb r0, [r6, #0x10]
	ldrb r1, [r6, #0x18]
	subs r0, #2
	b _080949E6
	.align 2, 0
_080949D8: .4byte 0x0860AC38
_080949DC:
	movs r0, #0
	strb r0, [r6, #0x10]
	ldrb r1, [r6, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
_080949E6:
	ands r0, r1
	strb r0, [r6, #0x18]
_080949EA:
	ldrh r0, [r6, #0xa]
	adds r0, #1
	strh r0, [r6, #0xa]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start IntroSpaceViewSetupOam
IntroSpaceViewSetupOam: @ 0x080949F8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08094A60
	movs r2, #0
	ldr r0, _08094A5C @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r1, r0, r3
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, #0
	beq _08094A4E
	mov r4, r8
_08094A2E:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x13
	bgt _08094AA0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08094A2E
_08094A4E:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	mov ip, r0
	cmp r1, #0x13
	ble _08094AA8
	b _08094AA0
	.align 2, 0
_08094A5C: .4byte gNonGameplayRam
_08094A60:
	movs r2, #0x13
	ldr r0, _08094AA4 @ =gNonGameplayRam
	movs r3, #0x9b
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrb r1, [r1]
	mov r8, r0
	cmp r1, #0
	beq _08094A98
	mov r4, r8
	movs r3, #0x8b
	lsls r3, r3, #2
_08094A78:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _08094AA0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08094A78
_08094A98:
	lsls r0, r2, #0x18
	mov ip, r0
	cmp r0, #0
	bge _08094AA8
_08094AA0:
	movs r0, #0x14
	b _08094DD0
	.align 2, 0
_08094AA4: .4byte gNonGameplayRam
_08094AA8:
	movs r0, #0
	str r0, [sp]
	ldr r2, _08094B10 @ =0x040000D4
	mov r3, sp
	str r3, [r2]
	mov r0, ip
	asrs r1, r0, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r4, r0, #2
	ldr r3, _08094B14 @ =0x030016A0
	adds r0, r4, r3
	str r0, [r2, #4]
	ldr r0, _08094B18 @ =0x85000009
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08094B1C @ =0xFFFFFDE4
	adds r0, r3, r1
	adds r2, r4, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r7, #0
	mov r1, sb
	strh r1, [r0]
	ldr r1, _08094B20 @ =0x0000022A
	adds r0, r2, r1
	mov r1, sl
	strh r1, [r0]
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r6, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r5, r2, r0
	ldrb r1, [r5]
	movs r0, #1
	orrs r1, r0
	strb r1, [r5]
	cmp r6, #1
	bne _08094B28
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08094B24 @ =IntroProcessSpaceViewScrolling
	str r1, [r0]
	b _08094DCC
	.align 2, 0
_08094B10: .4byte 0x040000D4
_08094B14: .4byte 0x030016A0
_08094B18: .4byte 0x85000009
_08094B1C: .4byte 0xFFFFFDE4
_08094B20: .4byte 0x0000022A
_08094B24: .4byte IntroProcessSpaceViewScrolling
_08094B28:
	cmp r6, #2
	bne _08094B44
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08094B40 @ =IntroProcessBslShipSideways
	str r1, [r0]
	b _08094DCC
	.align 2, 0
_08094B40: .4byte IntroProcessBslShipSideways
_08094B44:
	cmp r6, #3
	bne _08094B90
	ldr r0, _08094B80 @ =0x00000222
	adds r1, r2, r0
	subs r0, #0xa2
	strh r0, [r1]
	ldr r1, _08094B84 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrb r0, [r5]
	movs r1, #6
	orrs r0, r1
	strb r0, [r5]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08094B88 @ =0x0860AC98
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08094B8C @ =IntroProcessSamusSHipEntering
	str r1, [r0]
	b _08094DCC
	.align 2, 0
_08094B80: .4byte 0x00000222
_08094B84: .4byte 0x00000236
_08094B88: .4byte 0x0860AC98
_08094B8C: .4byte IntroProcessSamusSHipEntering
_08094B90:
	cmp r6, #4
	bne _08094BB4
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08094BAC @ =0x0860AF10
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08094BB0 @ =IntroProcessSplashText
	str r1, [r0]
	b _08094DCC
	.align 2, 0
_08094BAC: .4byte 0x0860AF10
_08094BB0: .4byte IntroProcessSplashText
_08094BB4:
	cmp r6, #5
	bne _08094BE8
	ldr r0, _08094BDC @ =0x00000236
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08094BE0 @ =0x0860AC38
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08094BE4 @ =IntroProcessSpaceViewParticle
	str r1, [r0]
	b _08094DCC
	.align 2, 0
_08094BDC: .4byte 0x00000236
_08094BE0: .4byte 0x0860AC38
_08094BE4: .4byte IntroProcessSpaceViewParticle
_08094BE8:
	cmp r6, #0xa
	bne _08094C54
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r1, sb
	strh r1, [r0]
	ldr r1, _08094C40 @ =0x0000021E
	adds r0, r2, r1
	mov r1, sl
	strh r1, [r0]
	ldr r0, _08094C44 @ =0x00000222
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r1, _08094C48 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r5]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08094C4C @ =0x0860ACD0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08094C50 @ =IntroProcessIdleShipBackview
	str r1, [r0]
	b _08094DCC
	.align 2, 0
_08094C40: .4byte 0x0000021E
_08094C44: .4byte 0x00000222
_08094C48: .4byte 0x00000236
_08094C4C: .4byte 0x0860ACD0
_08094C50: .4byte IntroProcessIdleShipBackview
_08094C54:
	cmp r6, #0xb
	bne _08094C80
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r5]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08094C78 @ =0x0860ACD0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08094C7C @ =IntroProcessBslShipSpawning_2
	str r1, [r0]
	b _08094DCC
	.align 2, 0
_08094C78: .4byte 0x0860ACD0
_08094C7C: .4byte IntroProcessBslShipSpawning_2
_08094C80:
	cmp r6, #0xc
	bne _08094CB8
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _08094CAC @ =0x0000FFD8
	strh r0, [r1]
	ldr r1, _08094CB0 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08094CB4 @ =0x0860AD28
	b _08094D18
	.align 2, 0
_08094CAC: .4byte 0x0000FFD8
_08094CB0: .4byte 0x00000236
_08094CB4: .4byte 0x0860AD28
_08094CB8:
	cmp r6, #0xd
	bne _08094CF0
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _08094CE4 @ =0x0000FFE2
	strh r0, [r1]
	ldr r1, _08094CE8 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08094CEC @ =0x0860AD18
	b _08094D18
	.align 2, 0
_08094CE4: .4byte 0x0000FFE2
_08094CE8: .4byte 0x00000236
_08094CEC: .4byte 0x0860AD18
_08094CF0:
	cmp r6, #0xe
	bne _08094D38
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r2, r0
	ldr r0, _08094D28 @ =0x0000FFEC
	strh r0, [r1]
	ldr r1, _08094D2C @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08094D30 @ =0x0860AD08
_08094D18:
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08094D34 @ =IntroProcessBslShipBackview
	str r1, [r0]
	b _08094DCC
	.align 2, 0
_08094D28: .4byte 0x0000FFEC
_08094D2C: .4byte 0x00000236
_08094D30: .4byte 0x0860AD08
_08094D34: .4byte IntroProcessBslShipBackview
_08094D38:
	cmp r6, #0xf
	bne _08094D90
	mov r3, ip
	asrs r0, r3, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r0, r8
	adds r3, r2, r0
	movs r0, #0x88
	lsls r0, r0, #2
	adds r1, r3, r0
	ldr r0, _08094D80 @ =0x0000FFF6
	strh r0, [r1]
	ldr r1, _08094D84 @ =0x00000236
	adds r3, r3, r1
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _08094D88 @ =0x0860ACF8
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r2, r2, r0
	ldr r0, _08094D8C @ =IntroProcessBslShipBackview
	b _08094DCA
	.align 2, 0
_08094D80: .4byte 0x0000FFF6
_08094D84: .4byte 0x00000236
_08094D88: .4byte 0x0860ACF8
_08094D8C: .4byte IntroProcessBslShipBackview
_08094D90:
	cmp r6, #0x10
	bne _08094DCC
	mov r3, ip
	asrs r0, r3, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r0, r8
	adds r3, r2, r0
	ldr r1, _08094DE0 @ =0x00000236
	adds r3, r3, r1
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, r8
	adds r0, r2, r0
	ldr r1, _08094DE4 @ =0x0860AC08
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, r8
	adds r2, r2, r0
	ldr r0, _08094DE8 @ =IntroProcessIdleDepthParticle
_08094DCA:
	str r0, [r2]
_08094DCC:
	mov r3, ip
	lsrs r0, r3, #0x18
_08094DD0:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08094DE0: .4byte 0x00000236
_08094DE4: .4byte 0x0860AC08
_08094DE8: .4byte IntroProcessIdleDepthParticle

	thumb_func_start IntroSpaceViewVblank
IntroSpaceViewVblank: @ 0x08094DEC
	ldr r1, _08094E48 @ =0x040000D4
	ldr r0, _08094E4C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08094E50 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08094E54 @ =0x04000052
	ldr r0, _08094E58 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08094E5C @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08094E60 @ =0x04000054
	ldr r0, _08094E64 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _08094E68 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08094E6C @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08094E70 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08094E74 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08094E78 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08094E7C @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08094E48: .4byte 0x040000D4
_08094E4C: .4byte gOamData
_08094E50: .4byte 0x84000100
_08094E54: .4byte 0x04000052
_08094E58: .4byte gWrittenToBldalpha_L
_08094E5C: .4byte gWrittenToBldalpha_R
_08094E60: .4byte 0x04000054
_08094E64: .4byte gWrittenToBldy
_08094E68: .4byte gBg1XPosition
_08094E6C: .4byte gBg1YPosition
_08094E70: .4byte 0x0300122C
_08094E74: .4byte 0x0300122E
_08094E78: .4byte 0x03001230
_08094E7C: .4byte 0x03001232

	thumb_func_start unk_94e80
unk_94e80: @ 0x08094E80
	bx lr
	.align 2, 0

	thumb_func_start EndingSubroutine
EndingSubroutine: @ 0x08094E84
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	ldr r4, _08094EA0 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08094ED4
	cmp r0, #1
	bgt _08094EA4
	cmp r0, #0
	beq _08094EAE
	b _08094F6A
	.align 2, 0
_08094EA0: .4byte gSubGameMode1
_08094EA4:
	cmp r0, #2
	beq _08094EE2
	cmp r0, #3
	beq _08094F00
	b _08094F6A
_08094EAE:
	str r5, [sp]
	ldr r1, _08094EC8 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08094ECC @ =gNonGameplayRam
	str r0, [r1, #4]
	ldr r0, _08094ED0 @ =0x85000150
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	strh r0, [r4]
	b _08094F6A
	.align 2, 0
_08094EC8: .4byte 0x040000D4
_08094ECC: .4byte gNonGameplayRam
_08094ED0: .4byte 0x85000150
_08094ED4:
	bl EndingBslCrashing
	cmp r0, #0
	beq _08094F6A
	movs r0, #2
	strh r0, [r4]
	b _08094F6A
_08094EE2:
	bl EndingInShip
	cmp r0, #0
	beq _08094F6A
	ldr r0, _08094EF8 @ =gNonGameplayRam
	ldr r1, _08094EFC @ =0x0000020E
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #3
	strh r0, [r4]
	b _08094F6A
	.align 2, 0
_08094EF8: .4byte gNonGameplayRam
_08094EFC: .4byte 0x0000020E
_08094F00:
	ldr r0, _08094F24 @ =gNonGameplayRam
	ldr r1, _08094F28 @ =0x0000020E
	adds r4, r0, r1
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r2, _08094F2C @ =gWrittenToBldy
	ldrh r1, [r2]
	cmp r1, #0xf
	bhi _08094F30
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08094F66
	strh r5, [r4]
	adds r0, r1, #1
	strh r0, [r2]
	b _08094F66
	.align 2, 0
_08094F24: .4byte gNonGameplayRam
_08094F28: .4byte 0x0000020E
_08094F2C: .4byte gWrittenToBldy
_08094F30:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _08094F40
	movs r0, #0
	bl Sram_ProcessEndingSave
	b _08094F66
_08094F40:
	cmp r0, #2
	bne _08094F4C
	movs r0, #1
	bl Sram_ProcessEndingSave
	b _08094F66
_08094F4C:
	cmp r0, #3
	bne _08094F58
	movs r0, #2
	bl Sram_ProcessEndingSave
	b _08094F66
_08094F58:
	cmp r0, #4
	bne _08094F66
	movs r0, #3
	bl Sram_ProcessEndingSave
	strh r5, [r4]
	movs r5, #1
_08094F66:
	bl SpecialCutsceneDrawAllOam
_08094F6A:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EndingBslCrashingInit
EndingBslCrashingInit: @ 0x08094F74
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r3, _080950DC @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080950E0 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _080950E4 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _080950E8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080950EC @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _080950F0 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _080950F4 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r1, _080950F8 @ =gNonGameplayRam
	mov r8, r1
	str r1, [r4, #4]
	ldr r0, _080950FC @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095100 @ =0x086238F4
	ldr r1, _08095104 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _08095108 @ =0x08636C38
	str r0, [r4]
	ldr r0, _0809510C @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _08095110 @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095114 @ =0x0862B5F4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _08095118 @ =0x08638C14
	ldr r1, _0809511C @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _08095120 @ =0x08639BC4
	ldr r1, _08095124 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08095128 @ =0x08637038
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809512C @ =gBg1XPosition
	strh r5, [r0]
	ldr r0, _08095130 @ =gBg1YPosition
	movs r2, #8
	strh r2, [r0]
	ldr r0, _08095134 @ =0x0300122C
	strh r5, [r0]
	ldr r0, _08095138 @ =0x0300122E
	strh r5, [r0]
	ldr r0, _0809513C @ =0x03001230
	strh r5, [r0]
	ldr r0, _08095140 @ =0x03001232
	strh r5, [r0]
	ldr r0, _08095144 @ =0x04000010
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	ldr r1, _08095148 @ =0x04000008
	ldr r3, _0809514C @ =0x00001C08
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _08095150 @ =0x00001E01
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #4
	ldr r3, _08095154 @ =0x00001F03
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _08095158 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0809515C @ =0x04000054
	strh r1, [r0]
	ldr r0, _08095160 @ =gWrittenToBldalpha_R
	strh r2, [r0]
	ldr r1, _08095164 @ =gWrittenToBldalpha_L
	movs r0, #0xe
	strh r0, [r1]
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r0, #5
	movs r2, #0xc8
	movs r3, #0
	bl EndingBslCrashingSetupOam
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x48
	movs r3, #1
	bl EndingBslCrashingSetupOam
	movs r0, #2
	movs r1, #0xa4
	movs r2, #0x28
	movs r3, #1
	bl EndingBslCrashingSetupOam
	movs r0, #1
	movs r1, #0xa4
	movs r2, #0x28
	movs r3, #1
	bl EndingBslCrashingSetupOam
	movs r0, #3
	movs r1, #0x86
	movs r2, #0x3c
	movs r3, #1
	bl EndingBslCrashingSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _08095168 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r0, _0809516C @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _08095170 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _08095174 @ =EndingBslCrashingVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080950DC: .4byte 0x04000208
_080950E0: .4byte 0x04000004
_080950E4: .4byte 0x0000FFEF
_080950E8: .4byte 0x04000200
_080950EC: .4byte 0x0000FFFD
_080950F0: .4byte unk_99940
_080950F4: .4byte 0x040000D4
_080950F8: .4byte gNonGameplayRam
_080950FC: .4byte 0x85000150
_08095100: .4byte 0x086238F4
_08095104: .4byte 0x06010000
_08095108: .4byte 0x08636C38
_0809510C: .4byte 0x05000200
_08095110: .4byte 0x84000080
_08095114: .4byte 0x0862B5F4
_08095118: .4byte 0x08638C14
_0809511C: .4byte 0x0600F000
_08095120: .4byte 0x08639BC4
_08095124: .4byte 0x0600F800
_08095128: .4byte 0x08637038
_0809512C: .4byte gBg1XPosition
_08095130: .4byte gBg1YPosition
_08095134: .4byte 0x0300122C
_08095138: .4byte 0x0300122E
_0809513C: .4byte 0x03001230
_08095140: .4byte 0x03001232
_08095144: .4byte 0x04000010
_08095148: .4byte 0x04000008
_0809514C: .4byte 0x00001C08
_08095150: .4byte 0x00001E01
_08095154: .4byte 0x00001F03
_08095158: .4byte gWrittenToBldy
_0809515C: .4byte 0x04000054
_08095160: .4byte gWrittenToBldalpha_R
_08095164: .4byte gWrittenToBldalpha_L
_08095168: .4byte 0x0863A19C
_0809516C: .4byte 0x0600D000
_08095170: .4byte 0x85000400
_08095174: .4byte EndingBslCrashingVblank

	thumb_func_start EndingShipFrontViewInit
EndingShipFrontViewInit: @ 0x08095178
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r3, _080952D4 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080952D8 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _080952DC @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _080952E0 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080952E4 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _080952E8 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _080952EC @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r6, _080952F0 @ =0x030016A0
	str r6, [r4, #4]
	ldr r0, _080952F4 @ =0x850000B4
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	add r1, sp, #4
	strh r5, [r1]
	str r1, [r4]
	ldr r2, _080952F8 @ =0xFFFFFDF8
	adds r0, r6, r2
	str r0, [r4, #4]
	ldr r2, _080952FC @ =0x8100007E
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	strh r5, [r1]
	str r1, [r4]
	ldr r1, _08095300 @ =0xFFFFFEF4
	adds r0, r6, r1
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095304 @ =0x08626738
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _08095308 @ =0x0863929C
	ldr r1, _0809530C @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _08095310 @ =0x086395B8
	ldr r1, _08095314 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08095318 @ =0x08636E38
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _0809531C @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095320 @ =gBg1XPosition
	strh r5, [r0]
	ldr r0, _08095324 @ =gBg1YPosition
	strh r5, [r0]
	ldr r0, _08095328 @ =0x0300122C
	strh r5, [r0]
	ldr r3, _0809532C @ =0x0300122E
	ldr r2, _08095330 @ =0x0000FFE2
	adds r0, r2, #0
	strh r0, [r3]
	ldr r0, _08095334 @ =0x03001230
	strh r5, [r0]
	ldr r0, _08095338 @ =0x03001232
	strh r5, [r0]
	ldr r0, _0809533C @ =0x04000010
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
	ldr r1, _08095340 @ =0x04000008
	ldr r2, _08095344 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _08095348 @ =0x00001E02
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0809534C @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xbf
	strh r0, [r1]
	ldr r0, _08095350 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08095354 @ =0x04000054
	strh r1, [r0]
	ldr r0, _08095358 @ =gWrittenToBldalpha_R
	strh r1, [r0]
	ldr r0, _0809535C @ =gWrittenToBldalpha_L
	strh r1, [r0]
	ldr r2, _08095360 @ =0x04000052
	lsls r0, r1, #8
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	ldrsh r2, [r3, r0]
	movs r0, #0xc
	movs r1, #0
	movs r3, #0
	bl EndingBslCrashingSetupOam
	movs r0, #0xa
	movs r1, #0x78
	movs r2, #0x6a
	movs r3, #1
	bl EndingBslCrashingSetupOam
	movs r0, #0xb
	movs r1, #0x78
	movs r2, #0x40
	movs r3, #0
	bl EndingBslCrashingSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _08095364 @ =0xFFFFFDE4
	adds r6, r6, r1
	ldr r0, _08095368 @ =0x0863A19C
	str r0, [r6]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r0, _0809536C @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _08095370 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08095374 @ =EndingShipFrontViewVblank
	bl CallbackSetVBlank
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080952D4: .4byte 0x04000208
_080952D8: .4byte 0x04000004
_080952DC: .4byte 0x0000FFEF
_080952E0: .4byte 0x04000200
_080952E4: .4byte 0x0000FFFD
_080952E8: .4byte unk_99940
_080952EC: .4byte 0x040000D4
_080952F0: .4byte 0x030016A0
_080952F4: .4byte 0x850000B4
_080952F8: .4byte 0xFFFFFDF8
_080952FC: .4byte 0x8100007E
_08095300: .4byte 0xFFFFFEF4
_08095304: .4byte 0x08626738
_08095308: .4byte 0x0863929C
_0809530C: .4byte 0x0600F000
_08095310: .4byte 0x086395B8
_08095314: .4byte 0x0600F800
_08095318: .4byte 0x08636E38
_0809531C: .4byte 0x84000080
_08095320: .4byte gBg1XPosition
_08095324: .4byte gBg1YPosition
_08095328: .4byte 0x0300122C
_0809532C: .4byte 0x0300122E
_08095330: .4byte 0x0000FFE2
_08095334: .4byte 0x03001230
_08095338: .4byte 0x03001232
_0809533C: .4byte 0x04000010
_08095340: .4byte 0x04000008
_08095344: .4byte 0x00001C08
_08095348: .4byte 0x00001E02
_0809534C: .4byte 0x00001F03
_08095350: .4byte gWrittenToBldy
_08095354: .4byte 0x04000054
_08095358: .4byte gWrittenToBldalpha_R
_0809535C: .4byte gWrittenToBldalpha_L
_08095360: .4byte 0x04000052
_08095364: .4byte 0xFFFFFDE4
_08095368: .4byte 0x0863A19C
_0809536C: .4byte 0x0600D000
_08095370: .4byte 0x85000400
_08095374: .4byte EndingShipFrontViewVblank

	thumb_func_start EndingBslCrashingProcess
EndingBslCrashingProcess: @ 0x08095378
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _080953A4 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r3, r2, #0
	cmp r0, #9
	bls _0809539A
	b _08095634
_0809539A:
	lsls r0, r0, #2
	ldr r1, _080953A8 @ =_080953AC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080953A4: .4byte gNonGameplayRam
_080953A8: .4byte _080953AC
_080953AC: @ jump table
	.4byte _080953D4 @ case 0
	.4byte _08095418 @ case 1
	.4byte _08095424 @ case 2
	.4byte _0809548C @ case 3
	.4byte _080954E4 @ case 4
	.4byte _08095534 @ case 5
	.4byte _08095556 @ case 6
	.4byte _08095578 @ case 7
	.4byte _0809559C @ case 8
	.4byte _080955EC @ case 9
_080953D4:
	ldr r4, _080953F0 @ =gWrittenToBldy
	ldrh r2, [r4]
	cmp r2, #0
	beq _080953F8
	cmp r2, #0x10
	bne _080953E6
	ldr r0, _080953F4 @ =0x0000024B
	bl unk_3b1c
_080953E6:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	b _080955DC
	.align 2, 0
_080953F0: .4byte gWrittenToBldy
_080953F4: .4byte 0x0000024B
_080953F8:
	ldr r1, _08095414 @ =0x04000050
	movs r6, #0xc4
	lsls r6, r6, #4
	adds r0, r6, #0
	strh r0, [r1]
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r3, r1
	strh r2, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #1
	b _080955DA
	.align 2, 0
_08095414: .4byte 0x04000050
_08095418:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #0
	strh r0, [r1]
	b _080955DC
_08095424:
	movs r6, #0x84
	lsls r6, r6, #2
	adds r4, r3, r6
	ldrh r2, [r4]
	cmp r2, #1
	bne _08095458
	ldr r0, _0809544C @ =gWrittenToBldalpha_R
	movs r1, #0xa
	strh r1, [r0]
	ldr r0, _08095450 @ =gWrittenToBldalpha_L
	strh r1, [r0]
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r1, #0
	strb r2, [r0]
	ldr r2, _08095454 @ =0x00000111
	adds r0, r3, r2
	strb r1, [r0]
	b _080955DC
	.align 2, 0
_0809544C: .4byte gWrittenToBldalpha_R
_08095450: .4byte gWrittenToBldalpha_L
_08095454: .4byte 0x00000111
_08095458:
	cmp r2, #2
	beq _0809545E
	b _080955DC
_0809545E:
	ldr r1, _08095484 @ =0x04000050
	ldr r6, _08095488 @ =0x00000842
	adds r0, r6, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r6, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r4]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #3
	b _080955DA
	.align 2, 0
_08095484: .4byte 0x04000050
_08095488: .4byte 0x00000842
_0809548C:
	ldr r1, _080954B8 @ =0x00000111
	adds r4, r3, r1
	ldrb r2, [r4]
	cmp r2, #0xe
	bhi _080954BC
	movs r6, #0x84
	lsls r6, r6, #2
	adds r1, r3, r6
	ldrh r0, [r1]
	cmp r0, #4
	beq _080954A4
	b _080955DC
_080954A4:
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r3, r0
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #1
	strb r0, [r4]
	b _080955DC
	.align 2, 0
_080954B8: .4byte 0x00000111
_080954BC:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	ldrh r0, [r1]
	cmp r0, #0x14
	beq _080954CA
	b _080955DC
_080954CA:
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080954E0 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #4
	b _080955DA
	.align 2, 0
_080954E0: .4byte gWrittenToBldy
_080954E4:
	ldr r4, _0809550C @ =gWrittenToBldalpha_R
	ldrh r2, [r4]
	cmp r2, #0xf
	bhi _08095514
	movs r6, #0x84
	lsls r6, r6, #2
	adds r1, r3, r6
	ldrh r0, [r1]
	cmp r0, #6
	bne _080955DC
	movs r0, #0
	strh r0, [r1]
	adds r0, r2, #1
	strh r0, [r4]
	ldr r1, _08095510 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _080955DC
	.align 2, 0
_0809550C: .4byte gWrittenToBldalpha_R
_08095510: .4byte gWrittenToBldalpha_L
_08095514:
	ldr r1, _08095530 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #0
	strh r0, [r1]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #5
	b _080955DA
	.align 2, 0
_08095530: .4byte 0x04000050
_08095534:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r1, r3, r4
	ldrh r0, [r1]
	cmp r0, #0xa
	beq _08095542
	b _08095634
_08095542:
	movs r0, #0
	strh r0, [r1]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r3, r6
	movs r0, #6
	strb r0, [r1]
	bl EndingShipFrontViewInit
	b _08095634
_08095556:
	ldr r1, _08095574 @ =0x04000050
	movs r2, #0xc4
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	movs r4, #0x84
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #0
	strh r0, [r1]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r3, r6
	movs r0, #7
	b _080955DA
	.align 2, 0
_08095574: .4byte 0x04000050
_08095578:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrh r0, [r1]
	cmp r0, #0xa8
	bne _080955DC
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08095598 @ =gWrittenToBldy
	movs r0, #2
	strh r0, [r1]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #8
	b _080955DA
	.align 2, 0
_08095598: .4byte gWrittenToBldy
_0809559C:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r1, r3, r4
	ldrh r0, [r1]
	cmp r0, #1
	bne _080955DC
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080955C8 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	beq _080955CC
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080955DC
	movs r0, #0xa
	bl SpecialCutsceneDestroyOamOfType
	b _080955DC
	.align 2, 0
_080955C8: .4byte gWrittenToBldalpha_R
_080955CC:
	ldr r1, _080955E8 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r6, #0x85
	lsls r6, r6, #2
	adds r1, r3, r6
	movs r0, #9
_080955DA:
	strb r0, [r1]
_080955DC:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _08095634
	.align 2, 0
_080955E8: .4byte 0x04000050
_080955EC:
	ldr r4, _0809560C @ =gWrittenToBldy
	ldrh r2, [r4]
	cmp r2, #0xf
	bhi _08095610
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	ldrh r0, [r1]
	cmp r0, #4
	bne _0809562C
	adds r0, r2, #1
	strh r0, [r4]
	movs r0, #0
	strh r0, [r1]
	b _0809562C
	.align 2, 0
_0809560C: .4byte gWrittenToBldy
_08095610:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r2, r3, r1
	ldrh r0, [r2]
	cmp r0, #0x5a
	bne _0809562C
	movs r0, #0
	movs r1, #0
	strh r1, [r2]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	strb r0, [r1]
	movs r5, #1
_0809562C:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08095634:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start EndingBslCrashing
EndingBslCrashing: @ 0x0809563C
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08095654 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _08095668
	cmp r0, #1
	bgt _08095658
	cmp r0, #0
	beq _08095662
	b _080956BC
	.align 2, 0
_08095654: .4byte gNonGameplayRam
_08095658:
	cmp r0, #2
	beq _08095680
	cmp r0, #3
	beq _0809569C
	b _080956BC
_08095662:
	bl EndingBslCrashingInit
	b _08095674
_08095668:
	bl SpecialCutsceneFadeIn
	ldr r0, _0809567C @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _080956BC
_08095674:
	movs r0, #2
	strh r0, [r4, #8]
	b _080956BC
	.align 2, 0
_0809567C: .4byte gWrittenToBldy
_08095680:
	bl EndingBslCrashingProcess
	cmp r0, #0
	beq _080956BC
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #3
	strh r0, [r4, #8]
	b _080956BC
_0809569C:
	ldr r1, _080956AC @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080956B0
	adds r0, #1
	strh r0, [r1]
	b _080956B4
	.align 2, 0
_080956AC: .4byte gWrittenToBldy
_080956B0:
	strh r5, [r4, #8]
	movs r5, #1
_080956B4:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_080956BC:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EndingProcessFallingBsl
EndingProcessFallingBsl: @ 0x080956C4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0xa]
	ldrb r1, [r4, #0x14]
	cmp r1, #0
	bne _080956E6
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	strh r1, [r4, #0xa]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _08095796
_080956E6:
	cmp r1, #1
	bne _08095744
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _08095702
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _08095702
	strb r2, [r4, #0x12]
_08095702:
	ldrh r0, [r4, #0xa]
	movs r1, #5
	bl __udivsi3
	ldrh r1, [r4]
	subs r1, r1, r0
	strh r1, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	movs r1, #5
	bl __udivsi3
	ldrh r1, [r4, #2]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x50
	ble _0809572E
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #2
	strb r0, [r4, #0x14]
_0809572E:
	ldrb r0, [r4, #0x10]
	cmp r0, #1
	bne _0809573C
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	b _08095796
_0809573C:
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	b _08095796
_08095744:
	cmp r1, #2
	bne _08095770
	movs r0, #3
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x10]
	cmp r0, #1
	bne _0809578A
	ldr r0, _08095768 @ =0x086362B8
	str r0, [r4, #0x1c]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _0809576C @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r0, r2
	strb r1, [r0]
	b _08095796
	.align 2, 0
_08095768: .4byte 0x086362B8
_0809576C: .4byte gNonGameplayRam
_08095770:
	cmp r1, #3
	bne _08095796
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _08095796
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _08095796
_0809578A:
	strb r2, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_08095796:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_9579c
unk_9579c: @ 0x0809579C
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _080957C8
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _080957C8
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080957C8
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_080957C8:
	pop {r0}
	bx r0

	thumb_func_start EndingProcessLeavingSmallShip
EndingProcessLeavingSmallShip: @ 0x080957CC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0xa]
	adds r2, r0, #1
	strh r2, [r5, #0xa]
	ldrb r1, [r5, #0x14]
	cmp r1, #0
	bne _080957FC
	ldrh r0, [r5, #0xc]
	strh r0, [r5]
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x96
	bne _0809582A
	strh r1, [r5, #0xa]
	ldrb r0, [r5, #0x18]
	movs r1, #1
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #1
	strb r0, [r5, #0x14]
	b _0809582A
_080957FC:
	cmp r1, #1
	bne _0809582A
	lsls r0, r2, #2
	ldrh r4, [r5]
	subs r4, r4, r0
	strh r4, [r5, #0xc]
	ldrh r0, [r5, #0xa]
	movs r1, #3
	bl __udivsi3
	ldrh r1, [r5, #2]
	adds r1, r1, r0
	strh r1, [r5, #0xe]
	lsls r4, r4, #0x10
	cmp r4, #0
	bge _0809582A
	movs r0, #0
	strb r0, [r5, #0x10]
	ldrb r1, [r5, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #0x18]
_0809582A:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start EndingProcessLeavingBigShip
EndingProcessLeavingBigShip: @ 0x08095830
	push {lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0xa]
	adds r2, r0, #1
	strh r2, [r3, #0xa]
	ldrb r1, [r3, #0x14]
	cmp r1, #0
	bne _08095860
	ldrh r0, [r3, #0xc]
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf0
	bne _08095890
	strh r1, [r3, #0xa]
	ldrb r0, [r3, #0x18]
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #1
	strb r0, [r3, #0x14]
	b _08095890
_08095860:
	cmp r1, #1
	bne _08095890
	lsls r2, r2, #2
	ldrh r0, [r3]
	adds r2, r2, r0
	strh r2, [r3, #0xc]
	ldrh r0, [r3, #0xa]
	lsls r1, r0, #1
	adds r1, r1, r0
	ldrh r0, [r3, #2]
	subs r0, r0, r1
	strh r0, [r3, #0xe]
	lsls r2, r2, #0x10
	movs r0, #0x8c
	lsls r0, r0, #0x11
	cmp r2, r0
	ble _08095890
	movs r0, #0
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r3, #0x18]
_08095890:
	pop {r0}
	bx r0

	thumb_func_start EndingProcessFrontFacingShipThrusters
EndingProcessFrontFacingShipThrusters: @ 0x08095894
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r0, [r5, #0x14]
	cmp r0, #0
	bne _080958A8
	ldrh r0, [r5, #0xe]
	strh r0, [r5, #2]
	movs r0, #1
	strb r0, [r5, #0x14]
_080958A8:
	mov r4, sp
	adds r4, #2
	movs r0, #0xc
	mov r1, sp
	adds r2, r4, #0
	bl EndingGetPositionAndSlotOfOamByType
	ldrh r0, [r5, #2]
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r5, #0xe]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndingProcessFrontFacingShip
EndingProcessFrontFacingShip: @ 0x080958C8
	push {r4, lr}
	adds r3, r0, #0
	ldrh r0, [r3, #0xa]
	adds r0, #1
	movs r4, #0
	strh r0, [r3, #0xa]
	ldrb r1, [r3, #0x14]
	cmp r1, #0
	bne _080958EA
	ldrh r0, [r3, #0xe]
	strh r0, [r3, #2]
	strh r4, [r3, #0xa]
	movs r0, #4
	strb r0, [r3, #0x13]
	movs r0, #1
	strb r0, [r3, #0x14]
	b _08095944
_080958EA:
	cmp r1, #1
	bne _0809591C
	ldrb r1, [r3, #0x13]
	adds r1, #1
	strb r1, [r3, #0x13]
	ldr r2, _08095918 @ =sSineTable
	ldrb r0, [r3, #0x13]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	ldrh r2, [r3, #2]
	adds r0, r0, r2
	strh r0, [r3, #0xe]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #0x40
	bne _08095944
	movs r0, #2
	strb r0, [r3, #0x14]
	strh r4, [r3, #0xa]
	b _08095944
	.align 2, 0
_08095918: .4byte sSineTable
_0809591C:
	cmp r1, #2
	bne _08095944
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bne _08095930
	strh r4, [r3, #0xa]
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
_08095930:
	ldr r1, _08095950 @ =sSineTable
	ldrb r0, [r3, #0x13]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	ldrh r1, [r3, #2]
	adds r0, r0, r1
	strh r0, [r3, #0xe]
_08095944:
	ldr r1, _08095954 @ =0x0300122E
	ldrh r0, [r3, #0xe]
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08095950: .4byte sSineTable
_08095954: .4byte 0x0300122E

	thumb_func_start EndingBslCrashingSetupOam
EndingBslCrashingSetupOam: @ 0x08095958
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _080959BC
	movs r2, #0
	ldr r1, _080959B8 @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080959AA
	adds r4, r1, #0
_0809598A:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x13
	bgt _080959FA
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809598A
_080959AA:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	adds r7, r0, #0
	cmp r1, #0x13
	ble _08095A04
	b _080959FA
	.align 2, 0
_080959B8: .4byte gNonGameplayRam
_080959BC:
	movs r2, #0x13
	ldr r1, _08095A00 @ =gNonGameplayRam
	movs r3, #0x9b
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _080959F2
	adds r4, r1, #0
	movs r3, #0x8b
	lsls r3, r3, #2
_080959D2:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _080959FA
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080959D2
_080959F2:
	lsls r0, r2, #0x18
	adds r7, r0, #0
	cmp r7, #0
	bge _08095A04
_080959FA:
	movs r0, #0x14
	b _08095C3E
	.align 2, 0
_08095A00: .4byte gNonGameplayRam
_08095A04:
	movs r0, #0
	str r0, [sp]
	ldr r2, _08095A94 @ =0x040000D4
	mov r3, sp
	str r3, [r2]
	asrs r1, r7, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r5, r0, #2
	ldr r0, _08095A98 @ =0x030016A0
	mov ip, r0
	adds r0, r5, r0
	str r0, [r2, #4]
	ldr r0, _08095A9C @ =0x85000009
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r0, _08095AA0 @ =0xFFFFFDE4
	add r0, ip
	adds r2, r5, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r2, r1
	mov r3, r8
	strh r3, [r0]
	adds r1, #2
	adds r0, r2, r1
	mov r3, sb
	strh r3, [r0]
	adds r1, #2
	adds r0, r2, r1
	strb r6, [r0]
	movs r3, #0x8d
	lsls r3, r3, #2
	adds r4, r2, r3
	ldrb r1, [r4]
	movs r0, #1
	orrs r1, r0
	strb r1, [r4]
	cmp r6, #1
	bne _08095AB4
	ldr r0, _08095AA4 @ =0x00000222
	adds r1, r2, r0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r1, _08095AA8 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08095AAC @ =0x08636020
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08095AB0 @ =EndingProcessFallingBsl
	b _08095C3A
	.align 2, 0
_08095A94: .4byte 0x040000D4
_08095A98: .4byte 0x030016A0
_08095A9C: .4byte 0x85000009
_08095AA0: .4byte 0xFFFFFDE4
_08095AA4: .4byte 0x00000222
_08095AA8: .4byte 0x00000236
_08095AAC: .4byte 0x08636020
_08095AB0: .4byte EndingProcessFallingBsl
_08095AB4:
	cmp r6, #2
	bne _08095B14
	ldr r3, _08095B04 @ =0x00000222
	adds r1, r2, r3
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	ldrb r1, [r4]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r1
	movs r3, #8
	orrs r0, r3
	strb r0, [r4]
	ldr r0, _08095B08 @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r1, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08095B0C @ =0x08636038
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08095B10 @ =EndingProcessFallingBsl
	b _08095C3A
	.align 2, 0
_08095B04: .4byte 0x00000222
_08095B08: .4byte 0x00000236
_08095B0C: .4byte 0x08636038
_08095B10: .4byte EndingProcessFallingBsl
_08095B14:
	cmp r6, #3
	bne _08095B4C
	ldr r1, _08095B40 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08095B44 @ =0x08636050
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08095B48 @ =unk_9579c
	b _08095C3A
	.align 2, 0
_08095B40: .4byte 0x00000236
_08095B44: .4byte 0x08636050
_08095B48: .4byte unk_9579c
_08095B4C:
	cmp r6, #4
	bne _08095B88
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	ldr r3, _08095B7C @ =0x00000236
	adds r2, r2, r3
	ldrb r1, [r2]
	subs r0, #0xb
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08095B80 @ =0x08636288
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08095B84 @ =EndingProcessLeavingSmallShip
	b _08095C3A
	.align 2, 0
_08095B7C: .4byte 0x00000236
_08095B80: .4byte 0x08636288
_08095B84: .4byte EndingProcessLeavingSmallShip
_08095B88:
	cmp r6, #5
	bne _08095BB0
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08095BA8 @ =0x086362A0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08095BAC @ =EndingProcessLeavingBigShip
	b _08095C3A
	.align 2, 0
_08095BA8: .4byte 0x086362A0
_08095BAC: .4byte EndingProcessLeavingBigShip
_08095BB0:
	cmp r6, #0xa
	bne _08095BEC
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r1, r0
	movs r0, #8
	orrs r1, r0
	strb r1, [r4]
	ldr r0, _08095BE0 @ =0x00000236
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08095BE4 @ =0x086363A0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08095BE8 @ =unk_95e20
	b _08095C3A
	.align 2, 0
_08095BE0: .4byte 0x00000236
_08095BE4: .4byte 0x086363A0
_08095BE8: .4byte unk_95e20
_08095BEC:
	cmp r6, #0xb
	bne _08095C1C
	ldr r1, _08095C10 @ =0x00000236
	adds r2, r2, r1
	ldrb r0, [r2]
	movs r1, #0xc
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08095C14 @ =0x086363B8
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08095C18 @ =EndingProcessFrontFacingShipThrusters
	b _08095C3A
	.align 2, 0
_08095C10: .4byte 0x00000236
_08095C14: .4byte 0x086363B8
_08095C18: .4byte EndingProcessFrontFacingShipThrusters
_08095C1C:
	cmp r6, #0xc
	bne _08095C3C
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r4]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08095C4C @ =0x086363A0
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08095C50 @ =EndingProcessFrontFacingShip
_08095C3A:
	str r1, [r0]
_08095C3C:
	lsrs r0, r7, #0x18
_08095C3E:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08095C4C: .4byte 0x086363A0
_08095C50: .4byte EndingProcessFrontFacingShip

	thumb_func_start EndingBslCrashingVblank
EndingBslCrashingVblank: @ 0x08095C54
	push {lr}
	ldr r3, _08095CE0 @ =0x040000D4
	ldr r0, _08095CE4 @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _08095CE8 @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _08095CEC @ =0x04000052
	ldr r0, _08095CF0 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08095CF4 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08095CF8 @ =0x04000054
	ldr r0, _08095CFC @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _08095D00 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095D04 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095D08 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095D0C @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095D10 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095D14 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08095D18 @ =gNonGameplayRam
	movs r0, #0x88
	lsls r0, r0, #1
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #1
	bne _08095CDA
	movs r0, #0
	strb r0, [r2]
	ldr r2, _08095D1C @ =0x00000111
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08095D20 @ =0x08636A38
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _08095D24 @ =0x05000120
	str r0, [r3, #4]
	ldr r0, _08095D28 @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_08095CDA:
	pop {r0}
	bx r0
	.align 2, 0
_08095CE0: .4byte 0x040000D4
_08095CE4: .4byte gOamData
_08095CE8: .4byte 0x84000100
_08095CEC: .4byte 0x04000052
_08095CF0: .4byte gWrittenToBldalpha_L
_08095CF4: .4byte gWrittenToBldalpha_R
_08095CF8: .4byte 0x04000054
_08095CFC: .4byte gWrittenToBldy
_08095D00: .4byte gBg1XPosition
_08095D04: .4byte gBg1YPosition
_08095D08: .4byte 0x0300122C
_08095D0C: .4byte 0x0300122E
_08095D10: .4byte 0x03001230
_08095D14: .4byte 0x03001232
_08095D18: .4byte gNonGameplayRam
_08095D1C: .4byte 0x00000111
_08095D20: .4byte 0x08636A38
_08095D24: .4byte 0x05000120
_08095D28: .4byte 0x84000008

	thumb_func_start EndingShipFrontViewVblank
EndingShipFrontViewVblank: @ 0x08095D2C
	ldr r1, _08095D88 @ =0x040000D4
	ldr r0, _08095D8C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08095D90 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08095D94 @ =0x04000052
	ldr r0, _08095D98 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08095D9C @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08095DA0 @ =0x04000054
	ldr r0, _08095DA4 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _08095DA8 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095DAC @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095DB0 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095DB4 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095DB8 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08095DBC @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08095D88: .4byte 0x040000D4
_08095D8C: .4byte gOamData
_08095D90: .4byte 0x84000100
_08095D94: .4byte 0x04000052
_08095D98: .4byte gWrittenToBldalpha_L
_08095D9C: .4byte gWrittenToBldalpha_R
_08095DA0: .4byte 0x04000054
_08095DA4: .4byte gWrittenToBldy
_08095DA8: .4byte gBg1XPosition
_08095DAC: .4byte gBg1YPosition
_08095DB0: .4byte 0x0300122C
_08095DB4: .4byte 0x0300122E
_08095DB8: .4byte 0x03001230
_08095DBC: .4byte 0x03001232

	thumb_func_start EndingGetPositionAndSlotOfOamByType
EndingGetPositionAndSlotOfOamByType: @ 0x08095DC0
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0
	ldr r7, _08095DF8 @ =gNonGameplayRam
	movs r6, #0x8b
	lsls r6, r6, #2
_08095DD0:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _08095E00
	movs r5, #0x8a
	lsls r5, r5, #2
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r4, _08095DFC @ =0x0000022A
	adds r0, r3, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r1, #0
	b _08095E18
	.align 2, 0
_08095DF8: .4byte gNonGameplayRam
_08095DFC: .4byte 0x0000022A
_08095E00:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bls _08095DD0
	movs r5, #0x96
	lsls r5, r5, #1
	adds r0, r5, #0
	strh r0, [r4]
	movs r0, #0xc8
	strh r0, [r2]
	movs r0, #0x14
_08095E18:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_95e20
unk_95e20: @ 0x08095E20
	bx lr
	.align 2, 0

	thumb_func_start EndingMonologueInit
EndingMonologueInit: @ 0x08095E24
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r3, _08095F78 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08095F7C @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08095F80 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08095F84 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08095F88 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08095F8C @ =unk_99940
	bl CallbackSetVBlank
	movs r6, #0
	str r6, [sp]
	ldr r4, _08095F90 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r1, _08095F94 @ =gNonGameplayRam
	mov r8, r1
	str r1, [r4, #4]
	ldr r0, _08095F98 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095F9C @ =0x086150E8
	ldr r1, _08095FA0 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _08095FA4 @ =0x08636638
	str r0, [r4]
	ldr r0, _08095FA8 @ =0x05000200
	str r0, [r4, #4]
	ldr r5, _08095FAC @ =0x84000080
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095FB0 @ =0x086186A4
	ldr r1, _08095FB4 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _08095FB8 @ =0x086377F8
	ldr r1, _08095FBC @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08095FC0 @ =0x08636438
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095FC4 @ =0x08662804
	movs r5, #0x80
	lsls r5, r5, #0x12
	adds r1, r5, #0
	bl LZ77UncompWram
	str r5, [r4]
	ldr r0, _08095FC8 @ =0x06004800
	str r0, [r4, #4]
	ldr r0, _08095FCC @ =0x84000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	str r6, [sp]
	mov r2, sp
	str r2, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _08095FD0 @ =0x85001200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095FD4 @ =0x08663820
	str r0, [r4]
	ldr r0, _08095FD8 @ =0x05000180
	str r0, [r4, #4]
	ldr r0, _08095FDC @ =0x84000020
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08095FE0 @ =gBg1XPosition
	strh r6, [r0]
	ldr r0, _08095FE4 @ =gBg1YPosition
	strh r6, [r0]
	ldr r0, _08095FE8 @ =0x0300122C
	strh r6, [r0]
	ldr r0, _08095FEC @ =0x0300122E
	strh r6, [r0]
	ldr r0, _08095FF0 @ =0x03001230
	strh r6, [r0]
	ldr r0, _08095FF4 @ =0x03001232
	strh r6, [r0]
	ldr r0, _08095FF8 @ =0x04000010
	strh r6, [r0]
	ldr r1, _08095FFC @ =0x04000012
	movs r0, #4
	strh r0, [r1]
	ldr r0, _08096000 @ =0x04000014
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	subs r1, #0xa
	movs r2, #0x90
	lsls r2, r2, #4
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08096004 @ =0x00001E01
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _08096008 @ =0x00001F0B
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _0809600C @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08096010 @ =0x04000054
	strh r1, [r0]
	ldr r0, _08096014 @ =gWrittenToBldalpha_R
	strh r6, [r0]
	ldr r0, _08096018 @ =gWrittenToBldalpha_L
	strh r1, [r0]
	movs r1, #0x82
	lsls r1, r1, #1
	movs r0, #1
	movs r2, #0xb4
	movs r3, #0
	bl EndingDialogueSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _0809601C @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08096020 @ =EndingMonologueVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08095F78: .4byte 0x04000208
_08095F7C: .4byte 0x04000004
_08095F80: .4byte 0x0000FFEF
_08095F84: .4byte 0x04000200
_08095F88: .4byte 0x0000FFFD
_08095F8C: .4byte unk_99940
_08095F90: .4byte 0x040000D4
_08095F94: .4byte gNonGameplayRam
_08095F98: .4byte 0x85000150
_08095F9C: .4byte 0x086150E8
_08095FA0: .4byte 0x06010000
_08095FA4: .4byte 0x08636638
_08095FA8: .4byte 0x05000200
_08095FAC: .4byte 0x84000080
_08095FB0: .4byte 0x086186A4
_08095FB4: .4byte 0x06008000
_08095FB8: .4byte 0x086377F8
_08095FBC: .4byte 0x0600F800
_08095FC0: .4byte 0x08636438
_08095FC4: .4byte 0x08662804
_08095FC8: .4byte 0x06004800
_08095FCC: .4byte 0x84000200
_08095FD0: .4byte 0x85001200
_08095FD4: .4byte 0x08663820
_08095FD8: .4byte 0x05000180
_08095FDC: .4byte 0x84000020
_08095FE0: .4byte gBg1XPosition
_08095FE4: .4byte gBg1YPosition
_08095FE8: .4byte 0x0300122C
_08095FEC: .4byte 0x0300122E
_08095FF0: .4byte 0x03001230
_08095FF4: .4byte 0x03001232
_08095FF8: .4byte 0x04000010
_08095FFC: .4byte 0x04000012
_08096000: .4byte 0x04000014
_08096004: .4byte 0x00001E01
_08096008: .4byte 0x00001F0B
_0809600C: .4byte gWrittenToBldy
_08096010: .4byte 0x04000054
_08096014: .4byte gWrittenToBldalpha_R
_08096018: .4byte gWrittenToBldalpha_L
_0809601C: .4byte 0x0863A19C
_08096020: .4byte EndingMonologueVblank

	thumb_func_start EndingAdamConversationInit
EndingAdamConversationInit: @ 0x08096024
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r3, _0809617C @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08096180 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08096184 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08096188 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809618C @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08096190 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _08096194 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r6, _08096198 @ =0x030016A0
	str r6, [r4, #4]
	ldr r0, _0809619C @ =0x850000B4
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	add r1, sp, #4
	strh r5, [r1]
	str r1, [r4]
	ldr r2, _080961A0 @ =0xFFFFFDF8
	adds r0, r6, r2
	str r0, [r4, #4]
	ldr r2, _080961A4 @ =0x8100007E
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	strh r5, [r1]
	str r1, [r4]
	ldr r1, _080961A8 @ =0xFFFFFEF4
	adds r0, r6, r1
	str r0, [r4, #4]
	str r2, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080961AC @ =0x086131C8
	ldr r1, _080961B0 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _080961B4 @ =0x08637238
	ldr r1, _080961B8 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _080961BC @ =0x08598898
	ldr r1, _080961C0 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _080961C4 @ =0x08636438
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _080961C8 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080961CC @ =0x03001224
	ldr r1, _080961D0 @ =0x0000FFF8
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, _080961D4 @ =0x03001226
	movs r1, #8
	strh r1, [r0]
	ldr r0, _080961D8 @ =gBg1XPosition
	strh r5, [r0]
	ldr r0, _080961DC @ =gBg1YPosition
	strh r5, [r0]
	ldr r0, _080961E0 @ =0x0300122C
	strh r5, [r0]
	ldr r0, _080961E4 @ =0x0300122E
	strh r5, [r0]
	ldr r0, _080961E8 @ =0x03001230
	strh r5, [r0]
	ldr r0, _080961EC @ =0x03001232
	strh r5, [r0]
	ldr r0, _080961F0 @ =0x04000010
	strh r2, [r0]
	adds r0, #2
	strh r1, [r0]
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
	ldr r1, _080961F4 @ =0x04000008
	ldr r2, _080961F8 @ =0x00001C08
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #6
	ldr r2, _080961FC @ =0x00001F0B
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _08096200 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08096204 @ =0x04000054
	strh r1, [r0]
	ldr r0, _08096208 @ =gWrittenToBldalpha_R
	strh r1, [r0]
	ldr r0, _0809620C @ =gWrittenToBldalpha_L
	strh r1, [r0]
	ldr r2, _08096210 @ =0x04000052
	lsls r0, r1, #8
	orrs r0, r1
	strh r0, [r2]
	movs r0, #2
	movs r1, #0x70
	movs r2, #0x50
	movs r3, #1
	bl EndingDialogueSetupOam
	movs r0, #3
	movs r1, #0x70
	movs r2, #0x50
	movs r3, #1
	bl EndingDialogueSetupOam
	movs r0, #4
	movs r1, #0x70
	movs r2, #0x50
	movs r3, #1
	bl EndingDialogueSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _08096214 @ =0xFFFFFDE4
	adds r6, r6, r0
	ldr r0, _08096218 @ =0x0863A19C
	str r0, [r6]
	str r5, [sp]
	mov r1, sp
	str r1, [r4]
	ldr r0, _0809621C @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _08096220 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xc8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08096224 @ =EndingConversationAndAnimalsVblank
	bl CallbackSetVBlank
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809617C: .4byte 0x04000208
_08096180: .4byte 0x04000004
_08096184: .4byte 0x0000FFEF
_08096188: .4byte 0x04000200
_0809618C: .4byte 0x0000FFFD
_08096190: .4byte unk_99940
_08096194: .4byte 0x040000D4
_08096198: .4byte 0x030016A0
_0809619C: .4byte 0x850000B4
_080961A0: .4byte 0xFFFFFDF8
_080961A4: .4byte 0x8100007E
_080961A8: .4byte 0xFFFFFEF4
_080961AC: .4byte 0x086131C8
_080961B0: .4byte 0x06008000
_080961B4: .4byte 0x08637238
_080961B8: .4byte 0x0600F800
_080961BC: .4byte 0x08598898
_080961C0: .4byte 0x0600E000
_080961C4: .4byte 0x08636438
_080961C8: .4byte 0x84000080
_080961CC: .4byte 0x03001224
_080961D0: .4byte 0x0000FFF8
_080961D4: .4byte 0x03001226
_080961D8: .4byte gBg1XPosition
_080961DC: .4byte gBg1YPosition
_080961E0: .4byte 0x0300122C
_080961E4: .4byte 0x0300122E
_080961E8: .4byte 0x03001230
_080961EC: .4byte 0x03001232
_080961F0: .4byte 0x04000010
_080961F4: .4byte 0x04000008
_080961F8: .4byte 0x00001C08
_080961FC: .4byte 0x00001F0B
_08096200: .4byte gWrittenToBldy
_08096204: .4byte 0x04000054
_08096208: .4byte gWrittenToBldalpha_R
_0809620C: .4byte gWrittenToBldalpha_L
_08096210: .4byte 0x04000052
_08096214: .4byte 0xFFFFFDE4
_08096218: .4byte 0x0863A19C
_0809621C: .4byte 0x0600D000
_08096220: .4byte 0x85000400
_08096224: .4byte EndingConversationAndAnimalsVblank

	thumb_func_start EndingAnimalsInit
EndingAnimalsInit: @ 0x08096228
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	ldr r3, _08096390 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08096394 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08096398 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0809639C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080963A0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _080963A4 @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _080963A8 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r1, _080963AC @ =0x030016A0
	mov r8, r1
	str r1, [r4, #4]
	ldr r0, _080963B0 @ =0x850000B4
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	add r6, sp, #4
	strh r5, [r6]
	str r6, [r4]
	ldr r0, _080963B4 @ =0xFFFFFDF8
	add r0, r8
	str r0, [r4, #4]
	ldr r1, _080963B8 @ =0x8100007E
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	strh r5, [r6]
	str r6, [r4]
	ldr r0, _080963BC @ =0xFFFFFEF4
	add r0, r8
	str r0, [r4, #4]
	str r1, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080963C0 @ =0x0861B89C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _080963C4 @ =0x086217A8
	ldr r1, _080963C8 @ =0x06008000
	bl LZ77UncompVram
	ldr r0, _080963CC @ =0x08638654
	ldr r1, _080963D0 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _080963D4 @ =0x08637DB8
	ldr r1, _080963D8 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _080963DC @ =0x08636838
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _080963E0 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r2, _080963E4 @ =0x000002FF
	adds r0, r2, #0
	strh r0, [r6]
	str r6, [r4]
	ldr r0, _080963E8 @ =0x0600F500
	str r0, [r4, #4]
	ldr r0, _080963EC @ =0x81000180
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _080963F0 @ =0x03001224
	strh r5, [r0]
	ldr r0, _080963F4 @ =0x03001226
	strh r5, [r0]
	ldr r0, _080963F8 @ =gBg1XPosition
	strh r5, [r0]
	ldr r0, _080963FC @ =gBg1YPosition
	strh r5, [r0]
	ldr r0, _08096400 @ =0x0300122C
	strh r5, [r0]
	ldr r0, _08096404 @ =0x03001230
	strh r5, [r0]
	ldr r1, _08096408 @ =0x0300122E
	ldr r2, _0809640C @ =0x0000FFE2
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08096410 @ =0x03001232
	movs r1, #0xe2
	strh r1, [r0]
	ldr r0, _08096414 @ =0x04000010
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
	strh r1, [r0]
	ldr r1, _08096418 @ =0x0400000C
	ldr r2, _0809641C @ =0x00001E0A
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #0xf9
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _08096420 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08096424 @ =0x04000054
	strh r1, [r0]
	ldr r0, _08096428 @ =gWrittenToBldalpha_R
	strh r1, [r0]
	ldr r0, _0809642C @ =gWrittenToBldalpha_L
	strh r1, [r0]
	ldr r2, _08096430 @ =0x04000052
	lsls r0, r1, #8
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x14
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl EndingDialogueSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _08096434 @ =0xFFFFFDE4
	add r8, r0
	ldr r0, _08096438 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r0, _0809643C @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _08096440 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, _08096444 @ =EndingConversationAndAnimalsVblank
	bl CallbackSetVBlank
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08096390: .4byte 0x04000208
_08096394: .4byte 0x04000004
_08096398: .4byte 0x0000FFEF
_0809639C: .4byte 0x04000200
_080963A0: .4byte 0x0000FFFD
_080963A4: .4byte unk_99940
_080963A8: .4byte 0x040000D4
_080963AC: .4byte 0x030016A0
_080963B0: .4byte 0x850000B4
_080963B4: .4byte 0xFFFFFDF8
_080963B8: .4byte 0x8100007E
_080963BC: .4byte 0xFFFFFEF4
_080963C0: .4byte 0x0861B89C
_080963C4: .4byte 0x086217A8
_080963C8: .4byte 0x06008000
_080963CC: .4byte 0x08638654
_080963D0: .4byte 0x0600F000
_080963D4: .4byte 0x08637DB8
_080963D8: .4byte 0x0600F800
_080963DC: .4byte 0x08636838
_080963E0: .4byte 0x84000080
_080963E4: .4byte 0x000002FF
_080963E8: .4byte 0x0600F500
_080963EC: .4byte 0x81000180
_080963F0: .4byte 0x03001224
_080963F4: .4byte 0x03001226
_080963F8: .4byte gBg1XPosition
_080963FC: .4byte gBg1YPosition
_08096400: .4byte 0x0300122C
_08096404: .4byte 0x03001230
_08096408: .4byte 0x0300122E
_0809640C: .4byte 0x0000FFE2
_08096410: .4byte 0x03001232
_08096414: .4byte 0x04000010
_08096418: .4byte 0x0400000C
_0809641C: .4byte 0x00001E0A
_08096420: .4byte gWrittenToBldy
_08096424: .4byte 0x04000054
_08096428: .4byte gWrittenToBldalpha_R
_0809642C: .4byte gWrittenToBldalpha_L
_08096430: .4byte 0x04000052
_08096434: .4byte 0xFFFFFDE4
_08096438: .4byte 0x0863A19C
_0809643C: .4byte 0x0600D000
_08096440: .4byte 0x85000400
_08096444: .4byte EndingConversationAndAnimalsVblank

	thumb_func_start EndingInShipProcess
EndingInShipProcess: @ 0x08096448
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r2, _08096474 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r7, #0x85
	lsls r7, r7, #2
	adds r0, r2, r7
	ldrb r0, [r0]
	adds r5, r2, #0
	cmp r0, #0xf
	bls _0809646A
	b _08096920
_0809646A:
	lsls r0, r0, #2
	ldr r1, _08096478 @ =_0809647C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08096474: .4byte gNonGameplayRam
_08096478: .4byte _0809647C
_0809647C: @ jump table
	.4byte _080964BC @ case 0
	.4byte _080964F2 @ case 1
	.4byte _08096550 @ case 2
	.4byte _080965F4 @ case 3
	.4byte _0809663C @ case 4
	.4byte _08096698 @ case 5
	.4byte _080966E0 @ case 6
	.4byte _080966FC @ case 7
	.4byte _08096716 @ case 8
	.4byte _0809673C @ case 9
	.4byte _0809678A @ case 10
	.4byte _0809681C @ case 11
	.4byte _08096828 @ case 12
	.4byte _08096878 @ case 13
	.4byte _080968A0 @ case 14
	.4byte _080968E8 @ case 15
_080964BC:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #7
	beq _080964CA
	b _080968D8
_080964CA:
	movs r0, #0
	strh r0, [r1]
	ldr r1, _080964DC @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _080964E0
	subs r0, #1
	strh r0, [r1]
	b _080968D8
	.align 2, 0
_080964DC: .4byte gWrittenToBldy
_080964E0:
	movs r0, #0x56
	movs r1, #0xe
	bl PlayMusic
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #1
	b _080968D6
_080964F2:
	movs r7, #0x84
	lsls r7, r7, #2
	adds r1, r5, r7
	ldrh r0, [r1]
	cmp r0, #0x46
	beq _08096500
	b _080968D8
_08096500:
	movs r4, #0
	movs r2, #0
	strh r2, [r1]
	movs r3, #0x80
	lsls r3, r3, #0x13
	ldrh r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r7, #0
	orrs r0, r1
	strh r0, [r3]
	strh r2, [r5, #0x12]
	strh r2, [r5, #0x10]
	strh r2, [r5, #0xe]
	strh r2, [r5, #0xc]
	ldr r1, _08096544 @ =0x00000212
	adds r0, r5, r1
	strb r4, [r0]
	ldr r1, _08096548 @ =0x0879C5A4
	ldr r0, _0809654C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0x1c]
	str r0, [r5]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #2
	b _080968D6
	.align 2, 0
_08096544: .4byte 0x00000212
_08096548: .4byte 0x0879C5A4
_0809654C: .4byte 0x03000011
_08096550:
	ldr r0, [r5]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08096578
	ldr r0, _08096598 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08096578
	movs r7, #0x86
	lsls r7, r7, #2
	adds r1, r5, r7
	ldrb r0, [r1]
	cmp r0, #0
	bne _08096578
	movs r0, #1
	strb r0, [r1]
_08096578:
	ldr r3, _0809659C @ =gNonGameplayRam
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r3, r1
	ldrb r2, [r0]
	cmp r2, #2
	bne _080965A0
	strb r4, [r0]
	b _080965AE
	.align 2, 0
_08096598: .4byte gChangedInput
_0809659C: .4byte gNonGameplayRam
_080965A0:
	cmp r2, #3
	bne _080965AE
	strb r4, [r0]
	movs r7, #0x85
	lsls r7, r7, #2
	adds r0, r3, r7
	strb r2, [r0]
_080965AE:
	bl EndingCheckMonologueEnded
	cmp r0, #0
	beq _080965CC
	ldr r3, _080965DC @ =gNonGameplayRam
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r2, #0
	movs r0, #3
	strb r0, [r1]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r3, r1
	strb r2, [r0]
_080965CC:
	ldr r0, _080965DC @ =gNonGameplayRam
	ldr r2, _080965E0 @ =0x00000213
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	bne _080965E4
	movs r0, #0x64
	b _080968D6
	.align 2, 0
_080965DC: .4byte gNonGameplayRam
_080965E0: .4byte 0x00000213
_080965E4:
	cmp r0, #1
	beq _080965EA
	b _080968D8
_080965EA:
	movs r0, #0x64
	strb r0, [r1]
	bl SpecialCutsceneProcessMonologue
	b _080968D8
_080965F4:
	movs r7, #0x84
	lsls r7, r7, #2
	adds r1, r5, r7
	ldrh r0, [r1]
	cmp r0, #1
	bne _08096618
	ldr r1, _08096610 @ =gWrittenToBldalpha_L
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08096614 @ =gWrittenToBldalpha_R
_08096608:
	movs r0, #0x10
	strh r0, [r1]
	b _080968D8
	.align 2, 0
_08096610: .4byte gWrittenToBldalpha_L
_08096614: .4byte gWrittenToBldalpha_R
_08096618:
	cmp r0, #0x14
	beq _0809661E
	b _080968D8
_0809661E:
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08096634 @ =0x04000050
	ldr r2, _08096638 @ =0x00001841
	adds r0, r2, #0
	strh r0, [r1]
	movs r7, #0x85
	lsls r7, r7, #2
	adds r1, r5, r7
	movs r0, #4
	b _080968D6
	.align 2, 0
_08096634: .4byte 0x04000050
_08096638: .4byte 0x00001841
_0809663C:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #4
	beq _0809664A
	b _080968D8
_0809664A:
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0809668C @ =gWrittenToBldalpha_L
	ldrh r0, [r2]
	cmp r0, #0xf
	bhi _0809665A
	adds r0, #1
	strh r0, [r2]
_0809665A:
	ldr r1, _08096690 @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0
	beq _08096666
	subs r0, #1
	strh r0, [r1]
_08096666:
	ldrh r0, [r2]
	cmp r0, #0x10
	beq _0809666E
	b _080968D8
_0809666E:
	ldrh r0, [r1]
	cmp r0, #0
	beq _08096676
	b _080968D8
_08096676:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _08096694 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #5
	b _080968D6
	.align 2, 0
_0809668C: .4byte gWrittenToBldalpha_L
_08096690: .4byte gWrittenToBldalpha_R
_08096694: .4byte 0x0000FEFF
_08096698:
	movs r7, #0x84
	lsls r7, r7, #2
	adds r2, r5, r7
	ldrh r0, [r2]
	cmp r0, #0xa
	bne _080966B2
	movs r0, #0x1e
	movs r1, #0x78
	movs r2, #0x50
	movs r3, #1
	bl EndingDialogueSetupOam
	b _080968D8
_080966B2:
	cmp r0, #0x27
	bne _080966C0
	ldr r1, _080966BC @ =gWrittenToBldy
	b _08096608
	.align 2, 0
_080966BC: .4byte gWrittenToBldy
_080966C0:
	cmp r0, #0x28
	beq _080966C6
	b _080968D8
_080966C6:
	ldr r1, _080966DC @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	movs r0, #0
	strh r0, [r2]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #6
	b _080968D6
	.align 2, 0
_080966DC: .4byte 0x04000050
_080966E0:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r5, r2
	ldrh r0, [r1]
	cmp r0, #1
	beq _080966EE
	b _080968D8
_080966EE:
	movs r0, #0
	strh r0, [r1]
	movs r7, #0x85
	lsls r7, r7, #2
	adds r1, r5, r7
	movs r0, #7
	b _080968D6
_080966FC:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0
	strh r0, [r1]
	bl EndingAdamConversationInit
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #8
	strb r0, [r1]
	b _08096920
_08096716:
	ldr r1, _08096738 @ =gWrittenToBldy
	movs r0, #0
	strh r0, [r1]
	movs r7, #0x84
	lsls r7, r7, #2
	adds r1, r5, r7
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x93
	lsls r0, r0, #2
	bl SoundPlay
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #9
	b _080968D6
	.align 2, 0
_08096738: .4byte gWrittenToBldy
_0809673C:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r4, r5, r1
	ldrh r0, [r4]
	cmp r0, #0xa
	beq _08096806
	cmp r0, #0x28
	bne _08096806
	movs r0, #0xff
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl EndingDialogueSetupOam
	movs r0, #6
	movs r1, #0x14
	movs r2, #0xc0
	movs r3, #0
	bl EndingDialogueSetupOam
	movs r0, #7
	movs r1, #0x80
	movs r2, #0xc0
	movs r3, #0
	bl EndingDialogueSetupOam
	movs r0, #9
	movs r1, #0x80
	movs r2, #0xc0
	movs r3, #0
	bl EndingDialogueSetupOam
	movs r0, #0
	strh r0, [r4]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0xa
	b _08096804
_0809678A:
	movs r7, #0x84
	lsls r7, r7, #2
	adds r1, r5, r7
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _080967BC
	ldr r0, _080967D4 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080967BC
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _080967BC
	movs r0, #1
	strb r0, [r1]
_080967BC:
	movs r1, #0x86
	lsls r1, r1, #2
	adds r3, r5, r1
	ldrb r0, [r3]
	cmp r0, #2
	bne _080967DC
	movs r0, #0
	strb r0, [r3]
	ldr r0, _080967D8 @ =0x00000203
	bl SoundPlay
	b _08096806
	.align 2, 0
_080967D4: .4byte gChangedInput
_080967D8: .4byte 0x00000203
_080967DC:
	cmp r0, #3
	bne _08096806
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _08096814 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #0
	strb r0, [r3]
	ldr r0, _08096818 @ =0x00000203
	bl SoundPlay
	movs r0, #0xa
	bl FadeMusic
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0xb
_08096804:
	strb r0, [r1]
_08096806:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	bl EndingProcessAdamText
	b _08096920
	.align 2, 0
_08096814: .4byte 0x0000FEFF
_08096818: .4byte 0x00000203
_0809681C:
	movs r7, #0x84
	lsls r7, r7, #2
	adds r1, r5, r7
	movs r0, #0
	strh r0, [r1]
	b _080968D8
_08096828:
	movs r0, #0x84
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrh r0, [r1]
	cmp r0, #1
	bne _0809685C
	ldr r2, _08096850 @ =sMusicTrackDataRom
	ldr r0, _08096854 @ =sSoundDataEntries
	ldr r1, _08096858 @ =0x00001264
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	movs r1, #0
	bl ApplyMusicSoundFading
	b _080968D8
	.align 2, 0
_08096850: .4byte sMusicTrackDataRom
_08096854: .4byte sSoundDataEntries
_08096858: .4byte 0x00001264
_0809685C:
	cmp r0, #0xa
	bne _080968D8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08096874 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0xd
	b _080968D6
	.align 2, 0
_08096874: .4byte gWrittenToBldy
_08096878:
	bl EndingAnimalsInit
	ldr r2, _08096898 @ =gNonGameplayRam
	movs r7, #0x84
	lsls r7, r7, #2
	adds r0, r2, r7
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0809689C @ =gWrittenToBldy
	strh r1, [r0]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r2, r0
	movs r0, #0xe
	strb r0, [r1]
	b _08096920
	.align 2, 0
_08096898: .4byte gNonGameplayRam
_0809689C: .4byte gWrittenToBldy
_080968A0:
	movs r1, #0x84
	lsls r1, r1, #2
	adds r2, r5, r1
	ldrh r1, [r2]
	cmp r1, #1
	bne _080968B6
	movs r0, #0x53
	movs r1, #0xe
	bl PlayMusic
	b _080968D8
_080968B6:
	movs r0, #0xa0
	lsls r0, r0, #2
	cmp r1, r0
	bne _080968D8
	movs r0, #0
	strh r0, [r2]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _080968E4 @ =0x0000FBFF
	ands r0, r1
	strh r0, [r2]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r5, r2
	movs r0, #0xf
_080968D6:
	strb r0, [r1]
_080968D8:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _08096920
	.align 2, 0
_080968E4: .4byte 0x0000FBFF
_080968E8:
	movs r7, #0x84
	lsls r7, r7, #2
	adds r1, r5, r7
	ldrh r0, [r1]
	cmp r0, #2
	bne _08096918
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08096908 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0809690C
	adds r0, #1
	strh r0, [r1]
	b _08096918
	.align 2, 0
_08096908: .4byte gWrittenToBldy
_0809690C:
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0
	strb r0, [r1]
	movs r6, #1
_08096918:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08096920:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EndingInShip
EndingInShip: @ 0x08096928
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08096940 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _08096954
	cmp r0, #1
	bgt _08096944
	cmp r0, #0
	beq _0809694E
	b _080969A8
	.align 2, 0
_08096940: .4byte gNonGameplayRam
_08096944:
	cmp r0, #2
	beq _0809696C
	cmp r0, #3
	beq _08096988
	b _080969A8
_0809694E:
	bl EndingMonologueInit
	b _08096960
_08096954:
	bl SpecialCutsceneFadeIn
	ldr r0, _08096968 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _080969A8
_08096960:
	movs r0, #2
	strh r0, [r4, #8]
	b _080969A8
	.align 2, 0
_08096968: .4byte gWrittenToBldy
_0809696C:
	bl EndingInShipProcess
	cmp r0, #0
	beq _080969A8
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #3
	strh r0, [r4, #8]
	b _080969A8
_08096988:
	ldr r1, _08096998 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0809699C
	adds r0, #1
	strh r0, [r1]
	b _080969A0
	.align 2, 0
_08096998: .4byte gWrittenToBldy
_0809699C:
	strh r5, [r4, #8]
	movs r5, #1
_080969A0:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_080969A8:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start EndingProcessMonologueCursor
EndingProcessMonologueCursor: @ 0x080969B0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080969D0 @ =gNonGameplayRam
	ldr r0, [r3]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _080969D4
	movs r0, #0x76
	strh r0, [r2, #0xc]
	ldrh r0, [r3, #0xe]
	lsls r0, r0, #3
	adds r0, #0x18
	strh r0, [r2, #0xe]
	b _080969DA
	.align 2, 0
_080969D0: .4byte gNonGameplayRam
_080969D4:
	movs r0, #0x82
	lsls r0, r0, #1
	strh r0, [r2, #0xc]
_080969DA:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_969e0
unk_969e0: @ 0x080969E0
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _08096A02
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _08096A02
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _08096A02
	strb r1, [r2, #0x12]
_08096A02:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndingProcessSr388RadarView
EndingProcessSr388RadarView: @ 0x08096A08
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _08096A34
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _08096A34
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _08096A34
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
	ldr r0, _08096A38 @ =0x08633EC4
	str r0, [r2, #0x1c]
	movs r0, #1
	strb r0, [r2, #0x14]
_08096A34:
	pop {r0}
	bx r0
	.align 2, 0
_08096A38: .4byte 0x08633EC4

	thumb_func_start EndingProcessSamusViewRadarView
EndingProcessSamusViewRadarView: @ 0x08096A3C
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _08096A68
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _08096A68
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _08096A68
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
	ldr r0, _08096A6C @ =0x08633F0C
	str r0, [r2, #0x1c]
	movs r0, #1
	strb r0, [r2, #0x14]
_08096A68:
	pop {r0}
	bx r0
	.align 2, 0
_08096A6C: .4byte 0x08633F0C

	thumb_func_start unk_96a70
unk_96a70: @ 0x08096A70
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r6, r1, r0
	ldrb r5, [r4, #0x14]
	cmp r5, #0
	bne _08096AB4
	ldr r0, [r4, #0x10]
	ldr r1, _08096AAC @ =0x00FFFF00
	ands r0, r1
	ldr r1, _08096AB0 @ =0x00010100
	cmp r0, r1
	bne _08096A96
	movs r0, #0x8e
	lsls r0, r0, #1
	bl SoundPlay
_08096A96:
	ldrb r0, [r6, #4]
	ldrb r1, [r4, #0x12]
	cmp r0, r1
	bne _08096B06
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	bne _08096B06
	strb r5, [r4, #0x12]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _08096B06
	.align 2, 0
_08096AAC: .4byte 0x00FFFF00
_08096AB0: .4byte 0x00010100
_08096AB4:
	cmp r5, #1
	bne _08096AE8
	movs r1, #0
	strb r1, [r4, #0x12]
	ldr r0, _08096ADC @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _08096B06
	strb r1, [r4, #0x11]
	ldr r0, _08096AE0 @ =0x08633244
	str r0, [r4, #0x1c]
	ldr r0, _08096AE4 @ =0x0000011D
	bl SoundPlay
	movs r0, #2
	strb r0, [r4, #0x14]
	b _08096B06
	.align 2, 0
_08096ADC: .4byte gNonGameplayRam
_08096AE0: .4byte 0x08633244
_08096AE4: .4byte 0x0000011D
_08096AE8:
	cmp r5, #2
	bne _08096B06
	ldrb r0, [r6, #4]
	ldrb r1, [r4, #0x12]
	cmp r0, r1
	bne _08096B06
	ldrb r1, [r6, #0xc]
	cmp r1, #0
	bne _08096B06
	strb r1, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_08096B06:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start EndingProcessAdamTextCursor
EndingProcessAdamTextCursor: @ 0x08096B0C
	push {r4, lr}
	adds r2, r0, #0
	ldr r3, _08096B28 @ =gNonGameplayRam
	ldr r0, [r3]
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	bne _08096B2C
	movs r0, #0x91
	lsls r0, r0, #1
	strh r0, [r2, #0xc]
	b _08096B8E
	.align 2, 0
_08096B28: .4byte gNonGameplayRam
_08096B2C:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	beq _08096B70
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _08096B54
	movs r0, #0
	movs r1, #0x91
	lsls r1, r1, #1
	strh r1, [r2, #0xc]
	strb r0, [r2, #0x12]
	strb r0, [r2, #0x11]
	ldr r0, _08096B50 @ =0x08633E8C
	str r0, [r2, #0x1c]
	b _08096B8E
	.align 2, 0
_08096B50: .4byte 0x08633E8C
_08096B54:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08096B70
	movs r0, #0x78
	strh r0, [r2, #0xc]
	movs r0, #0x9a
	strh r0, [r2, #0xe]
	ldr r0, _08096B6C @ =0x08633E64
	str r0, [r2, #0x1c]
	b _08096B8E
	.align 2, 0
_08096B6C: .4byte 0x08633E64
_08096B70:
	ldrh r0, [r3, #0xc]
	ldr r4, _08096B94 @ =0x00000212
	adds r1, r3, r4
	lsls r0, r0, #3
	ldrb r1, [r1]
	adds r0, r0, r1
	adds r0, #0xe
	movs r1, #0
	strh r0, [r2, #0xc]
	ldrh r0, [r3, #0xe]
	lsls r0, r0, #3
	adds r0, #0x84
	strh r0, [r2, #0xe]
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
_08096B8E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096B94: .4byte 0x00000212

	thumb_func_start EndingProcessAdamPanel
EndingProcessAdamPanel: @ 0x08096B98
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	bne _08096BD4
	strb r0, [r4, #0x12]
	strb r0, [r4, #0x11]
	ldrh r1, [r4, #0xe]
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0x80
	ble _08096BB8
	adds r0, r1, #0
	subs r0, #8
	strh r0, [r4, #0xe]
	b _08096D34
_08096BB8:
	movs r0, #0x80
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #0x10]
	cmp r0, #7
	bne _08096BC8
	ldr r0, _08096BD0 @ =0x0000020A
	bl SoundPlay
_08096BC8:
	movs r0, #1
	strb r0, [r4, #0x14]
	b _08096D34
	.align 2, 0
_08096BD0: .4byte 0x0000020A
_08096BD4:
	cmp r0, #1
	bne _08096C64
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _08096C12
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _08096BF4
	strb r1, [r4, #0x12]
	movs r0, #2
	strb r0, [r4, #0x14]
_08096BF4:
	ldrb r0, [r4, #0x10]
	cmp r0, #7
	beq _08096BFC
	b _08096D34
_08096BFC:
	ldrb r0, [r4, #0x11]
	cmp r0, #0xa
	bne _08096C12
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r3, #0xe
	ldrsh r2, [r4, r3]
	movs r0, #8
	movs r3, #0
	bl EndingDialogueSetupOam
_08096C12:
	ldrb r0, [r4, #0x10]
	cmp r0, #7
	beq _08096C1A
	b _08096D34
_08096C1A:
	ldrb r0, [r4, #0x11]
	cmp r0, #0xb
	beq _08096C22
	b _08096D34
_08096C22:
	ldrb r0, [r4, #0x12]
	cmp r0, #0xf
	beq _08096C2A
	b _08096D34
_08096C2A:
	ldr r2, _08096C54 @ =gNonGameplayRam
	ldr r0, _08096C58 @ =0x00000212
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	strh r0, [r2, #0xe]
	strh r0, [r2, #0xc]
	ldr r1, _08096C5C @ =0x0879C3AC
	ldr r0, _08096C60 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	b _08096D34
	.align 2, 0
_08096C54: .4byte gNonGameplayRam
_08096C58: .4byte 0x00000212
_08096C5C: .4byte 0x0879C3AC
_08096C60: .4byte 0x03000011
_08096C64:
	cmp r0, #2
	bne _08096C82
	movs r1, #0
	strb r1, [r4, #0x12]
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08096D34
	strb r1, [r4, #0x13]
	movs r0, #3
	strb r0, [r4, #0x14]
	b _08096D34
_08096C82:
	cmp r0, #3
	bne _08096CCC
	movs r1, #0
	strb r1, [r4, #0x12]
	ldr r0, _08096CAC @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _08096D34
	strb r1, [r4, #0x11]
	ldrb r0, [r4, #0x10]
	cmp r0, #7
	bne _08096CB8
	ldr r0, _08096CB0 @ =0x086332FC
	str r0, [r4, #0x1c]
	ldr r0, _08096CB4 @ =0x0000020B
	bl SoundPlay
	b _08096CC0
	.align 2, 0
_08096CAC: .4byte gNonGameplayRam
_08096CB0: .4byte 0x086332FC
_08096CB4: .4byte 0x0000020B
_08096CB8:
	cmp r0, #9
	bne _08096CC0
	ldr r0, _08096CC8 @ =0x086333CC
	str r0, [r4, #0x1c]
_08096CC0:
	movs r0, #4
	strb r0, [r4, #0x14]
	b _08096D34
	.align 2, 0
_08096CC8: .4byte 0x086333CC
_08096CCC:
	cmp r0, #4
	bne _08096CFC
	ldr r0, [r4, #0x10]
	ldr r1, _08096CF4 @ =0x00FFFF00
	ands r0, r1
	ldr r1, _08096CF8 @ =0x00030B00
	cmp r0, r1
	bne _08096D34
	ldrb r0, [r4, #0x10]
	cmp r0, #7
	bne _08096CE8
	movs r0, #8
	bl SpecialCutsceneDestroyOamOfType
_08096CE8:
	movs r0, #0
	strb r0, [r4, #0x12]
	movs r0, #5
	strb r0, [r4, #0x14]
	b _08096D34
	.align 2, 0
_08096CF4: .4byte 0x00FFFF00
_08096CF8: .4byte 0x00030B00
_08096CFC:
	cmp r0, #5
	bne _08096D34
	movs r2, #0
	strb r2, [r4, #0x12]
	ldrh r1, [r4, #0xe]
	movs r3, #0xe
	ldrsh r0, [r4, r3]
	cmp r0, #0xbf
	bgt _08096D16
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r4, #0xe]
	b _08096D34
_08096D16:
	ldrb r0, [r4, #0x10]
	cmp r0, #7
	bne _08096D28
	ldr r0, _08096D3C @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0xc
	strb r1, [r0]
_08096D28:
	strb r2, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_08096D34:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08096D3C: .4byte gNonGameplayRam

	thumb_func_start EndingProcessAdamIcon
EndingProcessAdamIcon: @ 0x08096D40
	push {r4, lr}
	adds r2, r0, #0
	ldrb r3, [r2, #0x11]
	lsls r1, r3, #3
	ldr r0, [r2, #0x1c]
	adds r4, r0, r1
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	bne _08096D80
	cmp r3, #3
	bne _08096D62
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
	ldr r0, _08096D78 @ =0x086338A4
	str r0, [r2, #0x1c]
	movs r0, #1
	strb r0, [r2, #0x14]
_08096D62:
	ldr r0, _08096D7C @ =gNonGameplayRam
	movs r3, #0x85
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _08096DC0
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
	b _08096D98
	.align 2, 0
_08096D78: .4byte 0x086338A4
_08096D7C: .4byte gNonGameplayRam
_08096D80:
	cmp r1, #1
	bne _08096DAC
	ldr r0, _08096DA4 @ =gNonGameplayRam
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xb
	bne _08096DC0
	movs r0, #0
	strb r0, [r2, #0x12]
	strb r0, [r2, #0x11]
_08096D98:
	ldr r0, _08096DA8 @ =0x0863345C
	str r0, [r2, #0x1c]
	movs r0, #2
	strb r0, [r2, #0x14]
	b _08096DC0
	.align 2, 0
_08096DA4: .4byte gNonGameplayRam
_08096DA8: .4byte 0x0863345C
_08096DAC:
	cmp r1, #2
	bne _08096DC0
	ldrb r0, [r4, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _08096DC0
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	bne _08096DC0
	strb r0, [r2, #0x12]
_08096DC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start EndingProcessAnimalsScrolling
EndingProcessAnimalsScrolling: @ 0x08096DC8
	push {r4, lr}
	sub sp, #4
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r1, r0, #1
	movs r3, #0
	strb r1, [r2, #0x13]
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _08096E48
	ldr r0, _08096E20 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r2, #0xc]
	ldr r0, _08096E24 @ =0x0300122E
	ldrh r1, [r0]
	strh r1, [r2, #0xe]
	ldr r0, _08096E28 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r2]
	ldr r0, _08096E2C @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r2, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0x20
	rsbs r0, r0, #0
	cmp r1, r0
	bge _08096E3C
	movs r0, #0x80
	lsls r0, r0, #7
	strh r0, [r2, #0xa]
	str r3, [sp]
	ldr r1, _08096E30 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldrh r0, [r2, #0xa]
	ldr r3, _08096E34 @ =0x06008000
	adds r0, r0, r3
	str r0, [r1, #4]
	ldr r0, _08096E38 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08096E42
	.align 2, 0
_08096E20: .4byte 0x0300122C
_08096E24: .4byte 0x0300122E
_08096E28: .4byte 0x03001230
_08096E2C: .4byte 0x03001232
_08096E30: .4byte 0x040000D4
_08096E34: .4byte 0x06008000
_08096E38: .4byte 0x85000400
_08096E3C:
	movs r0, #0xa0
	lsls r0, r0, #7
	strh r0, [r2, #0xa]
_08096E42:
	movs r0, #0
	strb r0, [r2, #0x13]
	b _08096E56
_08096E48:
	cmp r0, #1
	bne _08096E5C
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bne _08096EF6
	strb r3, [r2, #0x13]
_08096E56:
	movs r0, #2
	strb r0, [r2, #0x14]
	b _08096EF6
_08096E5C:
	ldr r0, _08096ED8 @ =gNonGameplayRam
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0xe
	bne _08096EF4
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _08096EA6
	strb r3, [r2, #0x13]
	ldrh r3, [r2, #0xe]
	movs r0, #0xe
	ldrsh r1, [r2, r0]
	movs r0, #0xa0
	rsbs r0, r0, #0
	cmp r1, r0
	ble _08096E8C
	subs r0, r3, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #8]
	adds r0, #1
	strh r0, [r2, #8]
_08096E8C:
	ldrh r1, [r2, #2]
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _08096E9A
	subs r0, r1, #1
	strh r0, [r2, #2]
_08096E9A:
	ldr r1, _08096EDC @ =0x0300122E
	ldrh r0, [r2, #0xe]
	strh r0, [r1]
	ldr r1, _08096EE0 @ =0x03001232
	ldrh r0, [r2, #2]
	strh r0, [r1]
_08096EA6:
	movs r4, #8
	ldrsh r0, [r2, r4]
	cmp r0, #9
	bne _08096EF6
	movs r1, #0
	strh r1, [r2, #8]
	ldrh r0, [r2, #0xa]
	cmp r0, #0
	beq _08096EF6
	ldr r3, _08096EE4 @ =0xFFFFFC00
	adds r0, r0, r3
	strh r0, [r2, #0xa]
	str r1, [sp]
	ldr r1, _08096EE8 @ =0x040000D4
	mov r4, sp
	str r4, [r1]
	ldrh r0, [r2, #0xa]
	ldr r2, _08096EEC @ =0x06008000
	adds r0, r0, r2
	str r0, [r1, #4]
	ldr r0, _08096EF0 @ =0x85000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08096EF6
	.align 2, 0
_08096ED8: .4byte gNonGameplayRam
_08096EDC: .4byte 0x0300122E
_08096EE0: .4byte 0x03001232
_08096EE4: .4byte 0xFFFFFC00
_08096EE8: .4byte 0x040000D4
_08096EEC: .4byte 0x06008000
_08096EF0: .4byte 0x85000100
_08096EF4:
	strb r3, [r2, #0x13]
_08096EF6:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_96f00
unk_96f00: @ 0x08096F00
	movs r1, #0
	strb r1, [r0, #0x10]
	bx lr
	.align 2, 0

	thumb_func_start EndingDialogueSetupOam
EndingDialogueSetupOam: @ 0x08096F08
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08096F68
	movs r2, #0
	ldr r0, _08096F64 @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r1, r0, r3
	ldrb r1, [r1]
	mov ip, r0
	cmp r1, #0
	beq _08096F58
	mov r4, ip
_08096F38:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x13
	bgt _08096FA8
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08096F38
_08096F58:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	adds r7, r0, #0
	cmp r1, #0x13
	ble _08096FB0
	b _08096FA8
	.align 2, 0
_08096F64: .4byte gNonGameplayRam
_08096F68:
	movs r2, #0x13
	ldr r0, _08096FAC @ =gNonGameplayRam
	movs r3, #0x9b
	lsls r3, r3, #3
	adds r1, r0, r3
	ldrb r1, [r1]
	mov ip, r0
	cmp r1, #0
	beq _08096FA0
	mov r4, ip
	movs r3, #0x8b
	lsls r3, r3, #2
_08096F80:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _08096FA8
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08096F80
_08096FA0:
	lsls r0, r2, #0x18
	adds r7, r0, #0
	cmp r7, #0
	bge _08096FB0
_08096FA8:
	movs r0, #0x14
	b _08097272
	.align 2, 0
_08096FAC: .4byte gNonGameplayRam
_08096FB0:
	movs r0, #0
	str r0, [sp]
	ldr r2, _08097014 @ =0x040000D4
	mov r3, sp
	str r3, [r2]
	asrs r1, r7, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r4, r0, #2
	ldr r3, _08097018 @ =0x030016A0
	adds r0, r4, r3
	str r0, [r2, #4]
	ldr r0, _0809701C @ =0x85000009
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08097020 @ =0xFFFFFDE4
	adds r0, r3, r1
	adds r2, r4, r0
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r2, r1
	strh r6, [r0]
	adds r1, #2
	adds r0, r2, r1
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x8b
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r5, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r6, r2, r0
	ldrb r1, [r6]
	movs r0, #1
	orrs r1, r0
	strb r1, [r6]
	cmp r5, #1
	bne _0809702C
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08097024 @ =0x08633E64
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08097028 @ =EndingProcessMonologueCursor
	str r1, [r0]
	b _08097270
	.align 2, 0
_08097014: .4byte 0x040000D4
_08097018: .4byte 0x030016A0
_0809701C: .4byte 0x85000009
_08097020: .4byte 0xFFFFFDE4
_08097024: .4byte 0x08633E64
_08097028: .4byte EndingProcessMonologueCursor
_0809702C:
	cmp r5, #2
	bne _08097064
	ldr r1, _08097058 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _0809705C @ =0x086338D4
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08097060 @ =unk_969e0
	str r1, [r0]
	b _08097270
	.align 2, 0
_08097058: .4byte 0x00000236
_0809705C: .4byte 0x086338D4
_08097060: .4byte unk_969e0
_08097064:
	cmp r5, #3
	bne _0809709C
	ldr r0, _08097090 @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08097094 @ =0x086339D4
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08097098 @ =EndingProcessSr388RadarView
	str r1, [r0]
	b _08097270
	.align 2, 0
_08097090: .4byte 0x00000236
_08097094: .4byte 0x086339D4
_08097098: .4byte EndingProcessSr388RadarView
_0809709C:
	cmp r5, #4
	bne _080970D4
	ldr r1, _080970C8 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _080970CC @ =0x08633C4C
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _080970D0 @ =EndingProcessSamusViewRadarView
	str r1, [r0]
	b _08097270
	.align 2, 0
_080970C8: .4byte 0x00000236
_080970CC: .4byte 0x08633C4C
_080970D0: .4byte EndingProcessSamusViewRadarView
_080970D4:
	cmp r5, #5
	bne _0809710C
	ldr r0, _08097100 @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08097104 @ =0x086331EC
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _08097108 @ =unk_96a70
	str r1, [r0]
	b _08097270
	.align 2, 0
_08097100: .4byte 0x00000236
_08097104: .4byte 0x086331EC
_08097108: .4byte unk_96a70
_0809710C:
	cmp r5, #6
	bne _08097130
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08097128 @ =0x08633E8C
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809712C @ =EndingProcessAdamTextCursor
	str r1, [r0]
	b _08097270
	.align 2, 0
_08097128: .4byte 0x08633E8C
_0809712C: .4byte EndingProcessAdamTextCursor
_08097130:
	cmp r5, #7
	bne _08097158
	ldr r1, _08097150 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08097154 @ =0x08633294
	b _080971AE
	.align 2, 0
_08097150: .4byte 0x00000236
_08097154: .4byte 0x08633294
_08097158:
	cmp r5, #8
	bne _08097190
	ldr r0, _08097184 @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _08097188 @ =0x08633434
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809718C @ =EndingProcessAdamIcon
	str r1, [r0]
	b _08097270
	.align 2, 0
_08097184: .4byte 0x00000236
_08097188: .4byte 0x08633434
_0809718C: .4byte EndingProcessAdamIcon
_08097190:
	cmp r5, #9
	bne _080971C8
	ldr r1, _080971BC @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _080971C0 @ =0x08633364
_080971AE:
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _080971C4 @ =EndingProcessAdamPanel
	str r1, [r0]
	b _08097270
	.align 2, 0
_080971BC: .4byte 0x00000236
_080971C0: .4byte 0x08633364
_080971C4: .4byte EndingProcessAdamPanel
_080971C8:
	cmp r5, #0x14
	bne _080971E4
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r6]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _080971E0 @ =EndingProcessAnimalsScrolling
	str r1, [r0]
	b _08097270
	.align 2, 0
_080971E0: .4byte EndingProcessAnimalsScrolling
_080971E4:
	cmp r5, #0x1e
	bne _08097238
	ldr r0, _08097224 @ =0x0000012D
	bl SoundPlay
	ldr r4, _08097228 @ =gNonGameplayRam
	asrs r0, r7, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	adds r3, r2, r4
	ldr r0, _0809722C @ =0x00000236
	adds r3, r3, r0
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	movs r1, #0x8e
	lsls r1, r1, #2
	adds r0, r4, r1
	adds r0, r2, r0
	ldr r1, _08097230 @ =0x08633F24
	str r1, [r0]
	movs r3, #0x8f
	lsls r3, r3, #2
	adds r4, r4, r3
	adds r2, r2, r4
	ldr r0, _08097234 @ =unk_97418
	b _0809726E
	.align 2, 0
_08097224: .4byte 0x0000012D
_08097228: .4byte gNonGameplayRam
_0809722C: .4byte 0x00000236
_08097230: .4byte 0x08633F24
_08097234: .4byte unk_97418
_08097238:
	cmp r5, #0xff
	bne _08097270
	asrs r0, r7, #0x18
	lsls r2, r0, #3
	adds r2, r2, r0
	lsls r2, r2, #2
	mov r0, ip
	adds r1, r2, r0
	movs r3, #0x8d
	lsls r3, r3, #2
	adds r1, r1, r3
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x8e
	lsls r0, r0, #2
	add r0, ip
	adds r0, r2, r0
	ldr r1, _08097280 @ =0x086331EC
	str r1, [r0]
	movs r0, #0x8f
	lsls r0, r0, #2
	add r0, ip
	adds r2, r2, r0
	ldr r0, _08097284 @ =unk_96f00
_0809726E:
	str r0, [r2]
_08097270:
	lsrs r0, r7, #0x18
_08097272:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08097280: .4byte 0x086331EC
_08097284: .4byte unk_96f00

	thumb_func_start EndingMonologueVblank
EndingMonologueVblank: @ 0x08097288
	push {lr}
	ldr r1, _080972EC @ =0x040000D4
	ldr r0, _080972F0 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080972F4 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _080972F8 @ =0x04000052
	ldr r0, _080972FC @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08097300 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08097304 @ =0x04000054
	ldr r0, _08097308 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _0809730C @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097310 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097314 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097318 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0809731C @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097320 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bl unk_98158
	pop {r0}
	bx r0
	.align 2, 0
_080972EC: .4byte 0x040000D4
_080972F0: .4byte gOamData
_080972F4: .4byte 0x84000100
_080972F8: .4byte 0x04000052
_080972FC: .4byte gWrittenToBldalpha_L
_08097300: .4byte gWrittenToBldalpha_R
_08097304: .4byte 0x04000054
_08097308: .4byte gWrittenToBldy
_0809730C: .4byte gBg1XPosition
_08097310: .4byte gBg1YPosition
_08097314: .4byte 0x0300122C
_08097318: .4byte 0x0300122E
_0809731C: .4byte 0x03001230
_08097320: .4byte 0x03001232

	thumb_func_start EndingConversationAndAnimalsVblank
EndingConversationAndAnimalsVblank: @ 0x08097324
	ldr r1, _08097380 @ =0x040000D4
	ldr r0, _08097384 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08097388 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0809738C @ =0x04000052
	ldr r0, _08097390 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08097394 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08097398 @ =0x04000054
	ldr r0, _0809739C @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _080973A0 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080973A4 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080973A8 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080973AC @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080973B0 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080973B4 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08097380: .4byte 0x040000D4
_08097384: .4byte gOamData
_08097388: .4byte 0x84000100
_0809738C: .4byte 0x04000052
_08097390: .4byte gWrittenToBldalpha_L
_08097394: .4byte gWrittenToBldalpha_R
_08097398: .4byte 0x04000054
_0809739C: .4byte gWrittenToBldy
_080973A0: .4byte gBg1XPosition
_080973A4: .4byte gBg1YPosition
_080973A8: .4byte 0x0300122C
_080973AC: .4byte 0x0300122E
_080973B0: .4byte 0x03001230
_080973B4: .4byte 0x03001232

	thumb_func_start EndingGetPositionAndSlotOfOamByType_2
EndingGetPositionAndSlotOfOamByType_2: @ 0x080973B8
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0
	ldr r7, _080973F0 @ =gNonGameplayRam
	movs r6, #0x8b
	lsls r6, r6, #2
_080973C8:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _080973F8
	movs r5, #0x8a
	lsls r5, r5, #2
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r4, _080973F4 @ =0x0000022A
	adds r0, r3, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r1, #0
	b _08097410
	.align 2, 0
_080973F0: .4byte gNonGameplayRam
_080973F4: .4byte 0x0000022A
_080973F8:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bls _080973C8
	movs r5, #0x96
	lsls r5, r5, #1
	adds r0, r5, #0
	strh r0, [r4]
	movs r0, #0xc8
	strh r0, [r2]
	movs r0, #0x14
_08097410:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_97418
unk_97418: @ 0x08097418
	bx lr
	.align 2, 0

	thumb_func_start DiedFromSr388CollisionSubroutine
DiedFromSr388CollisionSubroutine: @ 0x0809741C
	push {r4, r5, lr}
	sub sp, #4
	movs r5, #0
	ldr r4, _08097438 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _08097468
	cmp r0, #1
	bgt _0809743C
	cmp r0, #0
	beq _08097442
	b _080974B8
	.align 2, 0
_08097438: .4byte gSubGameMode1
_0809743C:
	cmp r0, #2
	beq _08097488
	b _080974B8
_08097442:
	str r5, [sp]
	ldr r1, _0809745C @ =0x040000D4
	mov r2, sp
	str r2, [r1]
	ldr r0, _08097460 @ =gNonGameplayRam
	str r0, [r1, #4]
	ldr r0, _08097464 @ =0x85000150
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	strh r0, [r4]
	b _080974B8
	.align 2, 0
_0809745C: .4byte 0x040000D4
_08097460: .4byte gNonGameplayRam
_08097464: .4byte 0x85000150
_08097468:
	bl DiedOnSr388Collision
	cmp r0, #0
	beq _080974B8
	ldr r0, _08097480 @ =gNonGameplayRam
	ldr r1, _08097484 @ =0x0000020E
	adds r0, r0, r1
	strh r5, [r0]
	movs r0, #2
	strh r0, [r4]
	b _080974B8
	.align 2, 0
_08097480: .4byte gNonGameplayRam
_08097484: .4byte 0x0000020E
_08097488:
	ldr r0, _080974A0 @ =gNonGameplayRam
	ldr r2, _080974A4 @ =0x0000020E
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	bne _080974B0
	ldr r1, _080974A8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080974AC
	adds r0, #1
	b _080974B2
	.align 2, 0
_080974A0: .4byte gNonGameplayRam
_080974A4: .4byte 0x0000020E
_080974A8: .4byte gWrittenToBldy
_080974AC:
	movs r5, #1
	b _080974B4
_080974B0:
	subs r0, #1
_080974B2:
	strh r0, [r1]
_080974B4:
	bl SpecialCutsceneDrawAllOam
_080974B8:
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start DiedOnSr388CollisionInit
DiedOnSr388CollisionInit: @ 0x080974C4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r3, _08097618 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0809761C @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08097620 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08097624 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08097628 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809762C @ =unk_99940
	bl CallbackSetVBlank
	movs r5, #0
	str r5, [sp]
	ldr r4, _08097630 @ =0x040000D4
	mov r0, sp
	str r0, [r4]
	ldr r1, _08097634 @ =gNonGameplayRam
	mov r8, r1
	str r1, [r4, #4]
	ldr r0, _08097638 @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809763C @ =0x086238F4
	ldr r1, _08097640 @ =0x06010000
	bl LZ77UncompVram
	ldr r0, _08097644 @ =0x08636C38
	str r0, [r4]
	ldr r0, _08097648 @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _0809764C @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08097650 @ =0x0862B5F4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _08097654 @ =0x08638C14
	ldr r1, _08097658 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0809765C @ =0x08639BC4
	ldr r1, _08097660 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _08097664 @ =0x08637038
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08097668 @ =gBg1XPosition
	strh r5, [r0]
	ldr r0, _0809766C @ =gBg1YPosition
	movs r2, #8
	strh r2, [r0]
	ldr r0, _08097670 @ =0x0300122C
	strh r5, [r0]
	ldr r0, _08097674 @ =0x0300122E
	strh r5, [r0]
	ldr r0, _08097678 @ =0x03001230
	strh r5, [r0]
	ldr r0, _0809767C @ =0x03001232
	strh r5, [r0]
	ldr r0, _08097680 @ =0x04000010
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	ldr r1, _08097684 @ =0x04000008
	ldr r3, _08097688 @ =0x00001C08
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _0809768C @ =0x00001E01
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #4
	ldr r3, _08097690 @ =0x00001F03
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #0x42
	movs r0, #0xbf
	strh r0, [r1]
	ldr r0, _08097694 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08097698 @ =0x04000054
	strh r1, [r0]
	ldr r0, _0809769C @ =gWrittenToBldalpha_R
	strh r2, [r0]
	ldr r1, _080976A0 @ =gWrittenToBldalpha_L
	movs r0, #0xe
	strh r0, [r1]
	ldr r0, _080976A4 @ =0x0000024D
	bl unk_3b1c
	movs r0, #2
	movs r1, #0xa4
	movs r2, #0x28
	movs r3, #1
	bl DiedOnSr388CollisionSetupOam
	movs r0, #1
	movs r1, #0xa4
	movs r2, #0x28
	movs r3, #1
	bl DiedOnSr388CollisionSetupOam
	movs r0, #3
	movs r1, #0x86
	movs r2, #0x3c
	movs r3, #1
	bl DiedOnSr388CollisionSetupOam
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r0, _080976A8 @ =0x0863A19C
	mov r1, r8
	str r0, [r1]
	str r5, [sp]
	mov r2, sp
	str r2, [r4]
	ldr r0, _080976AC @ =0x0600D000
	str r0, [r4, #4]
	ldr r0, _080976B0 @ =0x85000400
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _080976B4 @ =DiedOnSr388CollisionVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08097618: .4byte 0x04000208
_0809761C: .4byte 0x04000004
_08097620: .4byte 0x0000FFEF
_08097624: .4byte 0x04000200
_08097628: .4byte 0x0000FFFD
_0809762C: .4byte unk_99940
_08097630: .4byte 0x040000D4
_08097634: .4byte gNonGameplayRam
_08097638: .4byte 0x85000150
_0809763C: .4byte 0x086238F4
_08097640: .4byte 0x06010000
_08097644: .4byte 0x08636C38
_08097648: .4byte 0x05000200
_0809764C: .4byte 0x84000080
_08097650: .4byte 0x0862B5F4
_08097654: .4byte 0x08638C14
_08097658: .4byte 0x0600F000
_0809765C: .4byte 0x08639BC4
_08097660: .4byte 0x0600F800
_08097664: .4byte 0x08637038
_08097668: .4byte gBg1XPosition
_0809766C: .4byte gBg1YPosition
_08097670: .4byte 0x0300122C
_08097674: .4byte 0x0300122E
_08097678: .4byte 0x03001230
_0809767C: .4byte 0x03001232
_08097680: .4byte 0x04000010
_08097684: .4byte 0x04000008
_08097688: .4byte 0x00001C08
_0809768C: .4byte 0x00001E01
_08097690: .4byte 0x00001F03
_08097694: .4byte gWrittenToBldy
_08097698: .4byte 0x04000054
_0809769C: .4byte gWrittenToBldalpha_R
_080976A0: .4byte gWrittenToBldalpha_L
_080976A4: .4byte 0x0000024D
_080976A8: .4byte 0x0863A19C
_080976AC: .4byte 0x0600D000
_080976B0: .4byte 0x85000400
_080976B4: .4byte DiedOnSr388CollisionVblank

	thumb_func_start DiedOnSr388CollisionProcess
DiedOnSr388CollisionProcess: @ 0x080976B8
	push {r4, r5, r6, lr}
	movs r5, #0
	ldr r2, _080976E4 @ =gNonGameplayRam
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r2, r1
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r0, r2, r4
	ldrb r0, [r0]
	adds r3, r2, #0
	cmp r0, #4
	bls _080976DA
	b _08097862
_080976DA:
	lsls r0, r0, #2
	ldr r1, _080976E8 @ =_080976EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080976E4: .4byte gNonGameplayRam
_080976E8: .4byte _080976EC
_080976EC: @ jump table
	.4byte _08097700 @ case 0
	.4byte _08097734 @ case 1
	.4byte _08097740 @ case 2
	.4byte _080977A8 @ case 3
	.4byte _08097808 @ case 4
_08097700:
	ldr r1, _08097710 @ =gWrittenToBldy
	ldrh r0, [r1]
	adds r2, r0, #0
	cmp r2, #0
	beq _08097714
	subs r0, #1
	strh r0, [r1]
	b _080977F8
	.align 2, 0
_08097710: .4byte gWrittenToBldy
_08097714:
	ldr r1, _08097730 @ =0x04000050
	movs r6, #0xc4
	lsls r6, r6, #4
	adds r0, r6, #0
	strh r0, [r1]
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r3, r1
	strh r2, [r0]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	movs r0, #1
	b _080977F6
	.align 2, 0
_08097730: .4byte 0x04000050
_08097734:
	movs r4, #0x84
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #0
	strh r0, [r1]
	b _080977F8
_08097740:
	movs r6, #0x84
	lsls r6, r6, #2
	adds r4, r3, r6
	ldrh r2, [r4]
	cmp r2, #1
	bne _08097774
	ldr r0, _08097768 @ =gWrittenToBldalpha_R
	movs r1, #0xa
	strh r1, [r0]
	ldr r0, _0809776C @ =gWrittenToBldalpha_L
	strh r1, [r0]
	movs r1, #0x88
	lsls r1, r1, #1
	adds r0, r3, r1
	movs r1, #0
	strb r2, [r0]
	ldr r2, _08097770 @ =0x00000111
	adds r0, r3, r2
	strb r1, [r0]
	b _080977F8
	.align 2, 0
_08097768: .4byte gWrittenToBldalpha_R
_0809776C: .4byte gWrittenToBldalpha_L
_08097770: .4byte 0x00000111
_08097774:
	cmp r2, #2
	bne _080977F8
	ldr r1, _080977A0 @ =0x04000050
	ldr r6, _080977A4 @ =0x00000842
	adds r0, r6, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r6, #0x80
	lsls r6, r6, #2
	adds r1, r6, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r4]
	movs r0, #0x85
	lsls r0, r0, #2
	adds r1, r3, r0
	movs r0, #3
	b _080977F6
	.align 2, 0
_080977A0: .4byte 0x04000050
_080977A4: .4byte 0x00000842
_080977A8:
	ldr r1, _080977D4 @ =0x00000111
	adds r4, r3, r1
	ldrb r2, [r4]
	cmp r2, #0xe
	bhi _080977D8
	movs r6, #0x84
	lsls r6, r6, #2
	adds r1, r3, r6
	ldrh r0, [r1]
	cmp r0, #4
	bne _080977F8
	movs r0, #0
	strh r0, [r1]
	movs r0, #0x88
	lsls r0, r0, #1
	adds r1, r3, r0
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #1
	strb r0, [r4]
	b _080977F8
	.align 2, 0
_080977D4: .4byte 0x00000111
_080977D8:
	movs r2, #0x84
	lsls r2, r2, #2
	adds r1, r3, r2
	ldrh r0, [r1]
	cmp r0, #0xf
	bne _080977F8
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08097804 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r4, #0x85
	lsls r4, r4, #2
	adds r1, r3, r4
	movs r0, #4
_080977F6:
	strb r0, [r1]
_080977F8:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	b _08097862
	.align 2, 0
_08097804: .4byte gWrittenToBldy
_08097808:
	ldr r4, _08097830 @ =gWrittenToBldalpha_R
	ldrh r2, [r4]
	cmp r2, #0xf
	bhi _08097838
	movs r6, #0x84
	lsls r6, r6, #2
	adds r1, r3, r6
	ldrh r0, [r1]
	cmp r0, #6
	bne _0809785A
	movs r0, #0
	strh r0, [r1]
	adds r0, r2, #1
	strh r0, [r4]
	ldr r1, _08097834 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0809785A
	.align 2, 0
_08097830: .4byte gWrittenToBldalpha_R
_08097834: .4byte gWrittenToBldalpha_L
_08097838:
	ldr r0, _0809786C @ =0x04000050
	movs r1, #0xbf
	strh r1, [r0]
	movs r0, #0x84
	lsls r0, r0, #2
	adds r2, r3, r0
	ldrh r0, [r2]
	cmp r0, #0xf
	bne _0809785A
	movs r0, #0
	movs r1, #0
	strh r1, [r2]
	movs r2, #0x85
	lsls r2, r2, #2
	adds r1, r3, r2
	strb r0, [r1]
	movs r5, #1
_0809785A:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_08097862:
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809786C: .4byte 0x04000050

	thumb_func_start DiedOnSr388Collision
DiedOnSr388Collision: @ 0x08097870
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08097888 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _0809789C
	cmp r0, #1
	bgt _0809788C
	cmp r0, #0
	beq _08097896
	b _080978F0
	.align 2, 0
_08097888: .4byte gNonGameplayRam
_0809788C:
	cmp r0, #2
	beq _080978B4
	cmp r0, #3
	beq _080978D0
	b _080978F0
_08097896:
	bl DiedOnSr388CollisionInit
	b _080978A8
_0809789C:
	bl SpecialCutsceneFadeIn
	ldr r0, _080978B0 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _080978F0
_080978A8:
	movs r0, #2
	strh r0, [r4, #8]
	b _080978F0
	.align 2, 0
_080978B0: .4byte gWrittenToBldy
_080978B4:
	bl DiedOnSr388CollisionProcess
	cmp r0, #0
	beq _080978F0
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	strb r5, [r0]
	subs r1, #1
	adds r0, r4, r1
	strb r5, [r0]
	movs r0, #3
	strh r0, [r4, #8]
	b _080978F0
_080978D0:
	ldr r1, _080978E0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080978E4
	adds r0, #1
	strh r0, [r1]
	b _080978E8
	.align 2, 0
_080978E0: .4byte gWrittenToBldy
_080978E4:
	strh r5, [r4, #8]
	movs r5, #1
_080978E8:
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
_080978F0:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start DiedOnSr388CollisionProcessFallingBsl
DiedOnSr388CollisionProcessFallingBsl: @ 0x080978F8
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0xa]
	adds r0, #1
	movs r2, #0
	strh r0, [r4, #0xa]
	ldrb r1, [r4, #0x14]
	cmp r1, #0
	bne _0809791A
	ldrh r0, [r4, #0xc]
	strh r0, [r4]
	ldrh r0, [r4, #0xe]
	strh r0, [r4, #2]
	strh r1, [r4, #0xa]
	movs r0, #1
	strb r0, [r4, #0x14]
	b _080979CA
_0809791A:
	cmp r1, #1
	bne _08097978
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _08097936
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _08097936
	strb r2, [r4, #0x12]
_08097936:
	ldrh r0, [r4, #0xa]
	movs r1, #5
	bl __udivsi3
	ldrh r1, [r4]
	subs r1, r1, r0
	strh r1, [r4, #0xc]
	ldrh r0, [r4, #0xa]
	movs r1, #5
	bl __udivsi3
	ldrh r1, [r4, #2]
	adds r1, r1, r0
	strh r1, [r4, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0x50
	ble _08097962
	movs r0, #0
	strh r0, [r4, #0xa]
	movs r0, #2
	strb r0, [r4, #0x14]
_08097962:
	ldrb r0, [r4, #0x10]
	cmp r0, #1
	bne _08097970
	ldrh r0, [r4, #6]
	subs r0, #1
	strh r0, [r4, #6]
	b _080979CA
_08097970:
	ldrh r0, [r4, #6]
	subs r0, #2
	strh r0, [r4, #6]
	b _080979CA
_08097978:
	cmp r1, #2
	bne _080979A4
	movs r0, #3
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x10]
	cmp r0, #1
	bne _080979BE
	ldr r0, _0809799C @ =0x086362B8
	str r0, [r4, #0x1c]
	strb r2, [r4, #0x12]
	strb r2, [r4, #0x11]
	ldr r0, _080979A0 @ =gNonGameplayRam
	movs r2, #0x85
	lsls r2, r2, #2
	adds r0, r0, r2
	strb r1, [r0]
	b _080979CA
	.align 2, 0
_0809799C: .4byte 0x086362B8
_080979A0: .4byte gNonGameplayRam
_080979A4:
	cmp r1, #3
	bne _080979CA
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r4, #0x12]
	cmp r0, r3
	bne _080979CA
	ldrb r0, [r1, #0xc]
	cmp r0, #0
	bne _080979CA
_080979BE:
	strb r2, [r4, #0x10]
	ldrb r1, [r4, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #0x18]
_080979CA:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start unk_979d0
unk_979d0: @ 0x080979D0
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _080979FC
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _080979FC
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _080979FC
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x18]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x18]
_080979FC:
	pop {r0}
	bx r0

	thumb_func_start DiedOnSr388CollisionSetupOam
DiedOnSr388CollisionSetupOam: @ 0x08097A00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _08097A64
	movs r2, #0
	ldr r1, _08097A60 @ =gNonGameplayRam
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08097A52
	adds r4, r1, #0
_08097A32:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0x13
	bgt _08097AA2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08097A32
_08097A52:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	mov ip, r0
	cmp r1, #0x13
	ble _08097AAC
	b _08097AA2
	.align 2, 0
_08097A60: .4byte gNonGameplayRam
_08097A64:
	movs r2, #0x13
	ldr r1, _08097AA8 @ =gNonGameplayRam
	movs r3, #0x9b
	lsls r3, r3, #3
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08097A9A
	adds r4, r1, #0
	movs r3, #0x8b
	lsls r3, r3, #2
_08097A7A:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _08097AA2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08097A7A
_08097A9A:
	lsls r0, r2, #0x18
	mov ip, r0
	cmp r0, #0
	bge _08097AAC
_08097AA2:
	movs r0, #0x14
	b _08097BE6
	.align 2, 0
_08097AA8: .4byte gNonGameplayRam
_08097AAC:
	movs r0, #0
	str r0, [sp]
	ldr r2, _08097B3C @ =0x040000D4
	mov r3, sp
	str r3, [r2]
	mov r0, ip
	asrs r1, r0, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r5, r0, #2
	ldr r6, _08097B40 @ =0x030016A0
	adds r0, r5, r6
	str r0, [r2, #4]
	ldr r0, _08097B44 @ =0x85000009
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _08097B48 @ =0xFFFFFDE4
	adds r0, r6, r1
	adds r2, r5, r0
	movs r3, #0x8a
	lsls r3, r3, #2
	adds r0, r2, r3
	mov r1, r8
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	mov r1, sb
	strh r1, [r0]
	adds r3, #2
	adds r0, r2, r3
	strb r7, [r0]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r4, r2, r0
	ldrb r0, [r4]
	movs r1, #1
	orrs r0, r1
	strb r0, [r4]
	cmp r7, #1
	bne _08097B58
	subs r3, #0xa
	adds r1, r2, r3
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _08097B4C @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08097B50 @ =0x08636020
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08097B54 @ =DiedOnSr388CollisionProcessFallingBsl
	b _08097BE0
	.align 2, 0
_08097B3C: .4byte 0x040000D4
_08097B40: .4byte 0x030016A0
_08097B44: .4byte 0x85000009
_08097B48: .4byte 0xFFFFFDE4
_08097B4C: .4byte 0x00000236
_08097B50: .4byte 0x08636020
_08097B54: .4byte DiedOnSr388CollisionProcessFallingBsl
_08097B58:
	cmp r7, #2
	bne _08097BB8
	ldr r3, _08097BA8 @ =0x00000222
	adds r1, r2, r3
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	ldrb r1, [r4]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r1
	movs r3, #8
	orrs r0, r3
	strb r0, [r4]
	ldr r0, _08097BAC @ =0x00000236
	adds r2, r2, r0
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r2]
	ldrb r1, [r4]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4]
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08097BB0 @ =0x08636038
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08097BB4 @ =DiedOnSr388CollisionProcessFallingBsl
	b _08097BE0
	.align 2, 0
_08097BA8: .4byte 0x00000222
_08097BAC: .4byte 0x00000236
_08097BB0: .4byte 0x08636038
_08097BB4: .4byte DiedOnSr388CollisionProcessFallingBsl
_08097BB8:
	cmp r7, #3
	bne _08097BE2
	ldr r1, _08097BF4 @ =0x00000236
	adds r2, r2, r1
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _08097BF8 @ =0x08636050
	str r1, [r0]
	adds r0, r6, #0
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _08097BFC @ =unk_979d0
_08097BE0:
	str r1, [r0]
_08097BE2:
	mov r3, ip
	lsrs r0, r3, #0x18
_08097BE6:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08097BF4: .4byte 0x00000236
_08097BF8: .4byte 0x08636050
_08097BFC: .4byte unk_979d0

	thumb_func_start DiedOnSr388CollisionVblank
DiedOnSr388CollisionVblank: @ 0x08097C00
	push {lr}
	ldr r3, _08097C8C @ =0x040000D4
	ldr r0, _08097C90 @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _08097C94 @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _08097C98 @ =0x04000052
	ldr r0, _08097C9C @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08097CA0 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08097CA4 @ =0x04000054
	ldr r0, _08097CA8 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _08097CAC @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097CB0 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097CB4 @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097CB8 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097CBC @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097CC0 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _08097CC4 @ =gNonGameplayRam
	movs r0, #0x88
	lsls r0, r0, #1
	adds r2, r1, r0
	ldrb r0, [r2]
	cmp r0, #1
	bne _08097C86
	movs r0, #0
	strb r0, [r2]
	ldr r2, _08097CC8 @ =0x00000111
	adds r0, r1, r2
	ldrb r0, [r0]
	lsls r0, r0, #5
	ldr r1, _08097CCC @ =0x08636A38
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _08097CD0 @ =0x05000120
	str r0, [r3, #4]
	ldr r0, _08097CD4 @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_08097C86:
	pop {r0}
	bx r0
	.align 2, 0
_08097C8C: .4byte 0x040000D4
_08097C90: .4byte gOamData
_08097C94: .4byte 0x84000100
_08097C98: .4byte 0x04000052
_08097C9C: .4byte gWrittenToBldalpha_L
_08097CA0: .4byte gWrittenToBldalpha_R
_08097CA4: .4byte 0x04000054
_08097CA8: .4byte gWrittenToBldy
_08097CAC: .4byte gBg1XPosition
_08097CB0: .4byte gBg1YPosition
_08097CB4: .4byte 0x0300122C
_08097CB8: .4byte 0x0300122E
_08097CBC: .4byte 0x03001230
_08097CC0: .4byte 0x03001232
_08097CC4: .4byte gNonGameplayRam
_08097CC8: .4byte 0x00000111
_08097CCC: .4byte 0x08636A38
_08097CD0: .4byte 0x05000120
_08097CD4: .4byte 0x84000008

	thumb_func_start DiedOnSr388CollisionVblank_Unused
DiedOnSr388CollisionVblank_Unused: @ 0x08097CD8
	ldr r1, _08097D34 @ =0x040000D4
	ldr r0, _08097D38 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08097D3C @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _08097D40 @ =0x04000052
	ldr r0, _08097D44 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08097D48 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08097D4C @ =0x04000054
	ldr r0, _08097D50 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	subs r1, #0x40
	ldr r0, _08097D54 @ =gBg1XPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097D58 @ =gBg1YPosition
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097D5C @ =0x0300122C
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097D60 @ =0x0300122E
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097D64 @ =0x03001230
	ldrh r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldr r0, _08097D68 @ =0x03001232
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08097D34: .4byte 0x040000D4
_08097D38: .4byte gOamData
_08097D3C: .4byte 0x84000100
_08097D40: .4byte 0x04000052
_08097D44: .4byte gWrittenToBldalpha_L
_08097D48: .4byte gWrittenToBldalpha_R
_08097D4C: .4byte 0x04000054
_08097D50: .4byte gWrittenToBldy
_08097D54: .4byte gBg1XPosition
_08097D58: .4byte gBg1YPosition
_08097D5C: .4byte 0x0300122C
_08097D60: .4byte 0x0300122E
_08097D64: .4byte 0x03001230
_08097D68: .4byte 0x03001232

	thumb_func_start DiedOnSr388CollisionGetPositionAndSlotOfOamByType
DiedOnSr388CollisionGetPositionAndSlotOfOamByType: @ 0x08097D6C
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0
	ldr r7, _08097DA4 @ =gNonGameplayRam
	movs r6, #0x8b
	lsls r6, r6, #2
_08097D7C:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r7
	adds r0, r3, r6
	ldrb r0, [r0]
	cmp r0, r5
	bne _08097DAC
	movs r5, #0x8a
	lsls r5, r5, #2
	adds r0, r3, r5
	ldrh r0, [r0]
	strh r0, [r4]
	ldr r4, _08097DA8 @ =0x0000022A
	adds r0, r3, r4
	ldrh r0, [r0]
	strh r0, [r2]
	adds r0, r1, #0
	b _08097DC4
	.align 2, 0
_08097DA4: .4byte gNonGameplayRam
_08097DA8: .4byte 0x0000022A
_08097DAC:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0x13
	bls _08097D7C
	movs r5, #0x96
	lsls r5, r5, #1
	adds r0, r5, #0
	strh r0, [r4]
	movs r0, #0xc8
	strh r0, [r2]
	movs r0, #0x14
_08097DC4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start unk_97dcc
unk_97dcc: @ 0x08097DCC
	bx lr
	.align 2, 0

	thumb_func_start NewFileIntroCheckMonologueEnded
NewFileIntroCheckMonologueEnded: @ 0x08097DD0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	ldr r6, _08097E0C @ =gNonGameplayRam
	movs r0, #0x83
	lsls r0, r0, #2
	adds r7, r6, r0
	ldrh r0, [r7]
	adds r4, r0, #1
	strh r4, [r7]
	ldr r3, [r6]
	ldrh r2, [r3]
	adds r5, r2, #0
	movs r0, #0xff
	lsls r0, r0, #8
	mov ip, r0
	cmp r5, ip
	bne _08097E14
	mov r0, r8
	strh r0, [r7]
	ldr r7, _08097E10 @ =0x00000213
	adds r1, r6, r7
	movs r0, #0x64
	strb r0, [r1]
	movs r0, #1
	mov r8, r0
	b _08097E96
	.align 2, 0
_08097E0C: .4byte gNonGameplayRam
_08097E10: .4byte 0x00000213
_08097E14:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r5, r0
	bne _08097E68
	mov r0, r8
	strh r0, [r7]
	movs r7, #0x86
	lsls r7, r7, #2
	adds r4, r6, r7
	ldrb r1, [r4]
	cmp r1, #1
	bne _08097E96
	adds r2, r3, #2
	str r2, [r6]
	subs r7, #5
	adds r0, r6, r7
	strb r1, [r0]
	ldrh r1, [r3, #2]
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _08097E46
	movs r0, #2
	strb r0, [r4]
	b _08097E96
_08097E46:
	cmp r1, ip
	beq _08097E5C
	cmp r1, r5
	bne _08097E62
	movs r0, #4
	strb r0, [r4]
	adds r0, r2, #2
	str r0, [r6]
	ldrh r0, [r2, #2]
	cmp r0, ip
	bne _08097E96
_08097E5C:
	movs r0, #3
	strb r0, [r4]
	b _08097E96
_08097E62:
	movs r0, #0
	strb r0, [r4]
	b _08097E96
_08097E68:
	mov r0, ip
	ands r0, r2
	movs r1, #0xe1
	lsls r1, r1, #8
	cmp r0, r1
	bne _08097E82
	movs r1, #0xff
	ands r1, r2
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _08097E96
	b _08097E8A
_08097E82:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _08097E96
_08097E8A:
	ldr r0, _08097EA4 @ =0x00000213
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	strh r0, [r7]
_08097E96:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08097EA4: .4byte 0x00000213

	thumb_func_start EndingCheckMonologueEnded
EndingCheckMonologueEnded: @ 0x08097EA8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	ldr r6, _08097EE4 @ =gNonGameplayRam
	movs r0, #0x83
	lsls r0, r0, #2
	adds r7, r6, r0
	ldrh r0, [r7]
	adds r4, r0, #1
	strh r4, [r7]
	ldr r3, [r6]
	ldrh r2, [r3]
	adds r5, r2, #0
	movs r0, #0xff
	lsls r0, r0, #8
	mov ip, r0
	cmp r5, ip
	bne _08097EEC
	mov r0, r8
	strh r0, [r7]
	ldr r7, _08097EE8 @ =0x00000213
	adds r1, r6, r7
	movs r0, #0x64
	strb r0, [r1]
	movs r0, #1
	mov r8, r0
	b _08097F6E
	.align 2, 0
_08097EE4: .4byte gNonGameplayRam
_08097EE8: .4byte 0x00000213
_08097EEC:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r5, r0
	bne _08097F40
	mov r0, r8
	strh r0, [r7]
	movs r7, #0x86
	lsls r7, r7, #2
	adds r4, r6, r7
	ldrb r1, [r4]
	cmp r1, #1
	bne _08097F6E
	adds r2, r3, #2
	str r2, [r6]
	subs r7, #5
	adds r0, r6, r7
	strb r1, [r0]
	ldrh r1, [r3, #2]
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _08097F1E
	movs r0, #2
	strb r0, [r4]
	b _08097F6E
_08097F1E:
	cmp r1, ip
	beq _08097F34
	cmp r1, r5
	bne _08097F3A
	movs r0, #4
	strb r0, [r4]
	adds r0, r2, #2
	str r0, [r6]
	ldrh r0, [r2, #2]
	cmp r0, ip
	bne _08097F6E
_08097F34:
	movs r0, #3
	strb r0, [r4]
	b _08097F6E
_08097F3A:
	movs r0, #0
	strb r0, [r4]
	b _08097F6E
_08097F40:
	mov r0, ip
	ands r0, r2
	movs r1, #0xe1
	lsls r1, r1, #8
	cmp r0, r1
	bne _08097F5A
	movs r1, #0xff
	ands r1, r2
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _08097F6E
	b _08097F62
_08097F5A:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bls _08097F6E
_08097F62:
	ldr r0, _08097F7C @ =0x00000213
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
	mov r0, r8
	strh r0, [r7]
_08097F6E:
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08097F7C: .4byte 0x00000213

	thumb_func_start SpecialCutsceneProcessMonologue
SpecialCutsceneProcessMonologue: @ 0x08097F80
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r5, _08097FF0 @ =gNonGameplayRam
	ldr r2, [r5]
	ldrh r3, [r2]
	adds r1, r3, #0
	movs r6, #0xff
	lsls r6, r6, #8
	adds r4, r5, #0
	cmp r1, r6
	bne _08097F9C
	b _08098142
_08097F9C:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _08097FF8
	ldrh r0, [r4, #0xc]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1b
	bhi _08097FD4
	adds r6, r4, #0
	adds r5, #0x14
	movs r3, #0xff
_08097FB6:
	ldrh r1, [r6, #0xe]
	lsrs r1, r1, #1
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r0, r5
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1b
	bls _08097FB6
_08097FD4:
	movs r1, #0
	movs r0, #0
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xe]
	adds r0, #2
	strh r0, [r4, #0xe]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	ldr r2, _08097FF4 @ =0x00000212
	adds r0, r4, r2
	strb r1, [r0]
	b _08098142
	.align 2, 0
_08097FF0: .4byte gNonGameplayRam
_08097FF4: .4byte 0x00000212
_08097FF8:
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809807C
	movs r2, #0
	str r2, [sp, #4]
	ldr r1, _08098064 @ =0x040000D4
	add r5, sp, #4
	str r5, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08098068 @ =0x85001200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0
	strh r2, [r4, #0x12]
	strh r2, [r4, #0x10]
	strh r2, [r4, #0xe]
	strh r2, [r4, #0xc]
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
	ldr r5, _0809806C @ =0x00000212
	adds r0, r4, r5
	strb r3, [r0]
	str r2, [sp, #4]
	add r0, sp, #4
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x14
	str r0, [r1, #4]
	ldr r3, _08098070 @ =0x8500003F
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	str r2, [sp, #4]
	add r2, sp, #4
	str r2, [r1]
	movs r5, #0x88
	lsls r5, r5, #1
	adds r0, r4, r5
	str r0, [r1, #4]
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	ldr r0, _08098074 @ =0x06004800
	str r0, [r1, #4]
	ldr r0, _08098078 @ =0x84000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08098142
	.align 2, 0
_08098064: .4byte 0x040000D4
_08098068: .4byte 0x85001200
_0809806C: .4byte 0x00000212
_08098070: .4byte 0x8500003F
_08098074: .4byte 0x06004800
_08098078: .4byte 0x84000200
_0809807C:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809808C
	ldrh r0, [r4, #0xc]
	adds r0, #1
	strh r0, [r4, #0xc]
	b _08098142
_0809808C:
	adds r0, r6, #0
	ands r0, r3
	movs r1, #0xe1
	lsls r1, r1, #8
	cmp r0, r1
	bne _0809809E
	adds r0, r2, #2
	str r0, [r4]
	b _08098142
_0809809E:
	ldrh r4, [r5, #0xc]
	lsls r4, r4, #5
	ldrh r0, [r5, #0xe]
	lsls r0, r0, #0xa
	adds r4, r4, r0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	ldrh r0, [r2]
	bl GetCharacterWidth
	mov r8, r0
	ldr r0, [r5]
	ldrh r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _08098150 @ =0x00000212
	adds r6, r5, r1
	ldrb r3, [r6]
	movs r1, #0
	str r1, [sp]
	adds r1, r4, #0
	bl DrawCharacter
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1b
	bhi _0809813A
	ldrh r1, [r5, #0xe]
	lsrs r1, r1, #1
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldrh r2, [r5, #0xc]
	adds r0, r0, r2
	adds r7, r5, #0
	adds r7, #0x14
	adds r0, r0, r7
	movs r1, #4
	strb r1, [r0]
	ldrb r0, [r6]
	add r0, r8
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r5, #0
	cmp r0, #7
	bls _0809813A
	adds r2, r4, #0
	adds r3, r6, #0
	adds r4, r7, #0
_08098104:
	ldrb r0, [r3]
	adds r1, r0, #0
	subs r1, #8
	strb r1, [r3]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1b
	bhi _0809813A
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _08098134
	ldrh r0, [r2, #0xe]
	lsrs r0, r0, #1
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #2
	ldrh r5, [r2, #0xc]
	adds r1, r1, r5
	adds r1, r1, r4
	movs r0, #4
	strb r0, [r1]
_08098134:
	ldrb r0, [r3]
	cmp r0, #7
	bhi _08098104
_0809813A:
	ldr r1, _08098154 @ =gNonGameplayRam
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
_08098142:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098150: .4byte 0x00000212
_08098154: .4byte gNonGameplayRam

	thumb_func_start unk_98158
unk_98158: @ 0x08098158
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r1, _08098198 @ =gNonGameplayRam
	ldrh r6, [r1, #0x10]
	ldrh r0, [r1, #0x12]
	lsrs r7, r0, #1
	ldrh r0, [r1, #0xe]
	lsrs r0, r0, #1
	str r1, [sp, #8]
	cmp r7, r0
	bls _08098178
	b _0809827C
_08098178:
	str r1, [sp]
_0809817A:
	ldr r2, [sp]
	ldr r0, [r2]
	ldrh r0, [r0]
	movs r3, #0xfc
	lsls r3, r3, #8
	cmp r0, r3
	bne _0809819C
	ldrh r0, [r1, #0xc]
	cmp r0, #0x1b
	bhi _080981B6
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	b _080981BA
	.align 2, 0
_08098198: .4byte gNonGameplayRam
_0809819C:
	ldrh r0, [r1, #0xe]
	lsrs r0, r0, #1
	cmp r7, r0
	bne _080981B6
	ldr r1, [sp]
	ldrh r0, [r1, #0xc]
	movs r2, #0x1c
	mov ip, r2
	cmp r0, #0x1b
	bhi _080981BA
	adds r3, r0, #0
	mov ip, r3
	b _080981BA
_080981B6:
	movs r5, #0x1c
	mov ip, r5
_080981BA:
	adds r0, r7, #1
	str r0, [sp, #4]
	cmp r6, ip
	bhs _08098268
	ldr r1, _08098230 @ =gNonGameplayRam
	mov r8, r1
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	mov sl, r0
	ldr r2, _08098234 @ =0x00000FFF
	mov sb, r2
_080981D2:
	mov r3, sl
	adds r2, r6, r3
	ldr r5, _08098238 @ =0x03001594
	adds r1, r2, r5
	ldrb r0, [r1]
	cmp r0, #5
	bne _0809825A
	movs r0, #0
	strb r0, [r1]
	ldr r0, [sp, #8]
	adds r0, #0x14
	adds r2, r2, r0
	ldrb r0, [r2]
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08098244
	lsls r2, r6, #1
	lsls r0, r7, #7
	adds r2, r2, r0
	ldr r0, _0809823C @ =0x06004842
	adds r0, r2, r0
	str r0, [sp, #0xc]
	ldr r1, _08098240 @ =0x06004882
	adds r2, r2, r1
	ldrh r3, [r0]
	ldrh r4, [r2]
	lsrs r0, r3, #0xc
	lsrs r1, r4, #0xc
	subs r0, #1
	lsls r0, r0, #0x10
	subs r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r0, #4
	mov r5, sb
	ands r3, r5
	orrs r0, r3
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	lsrs r1, r1, #4
	ands r4, r5
	orrs r1, r4
	strh r1, [r2]
	b _0809825E
	.align 2, 0
_08098230: .4byte gNonGameplayRam
_08098234: .4byte 0x00000FFF
_08098238: .4byte 0x03001594
_0809823C: .4byte 0x06004842
_08098240: .4byte 0x06004882
_08098244:
	cmp r0, #0
	bne _08098252
	mov r5, r8
	strh r6, [r5, #0x10]
	lsls r0, r7, #1
	strh r0, [r5, #0x12]
	b _0809825E
_08098252:
	movs r0, #0xff
	orrs r1, r0
	strb r1, [r2]
	b _08098268
_0809825A:
	adds r0, #1
	strb r0, [r1]
_0809825E:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, ip
	blo _080981D2
_08098268:
	movs r6, #0
	ldr r1, [sp, #4]
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [sp, #8]
	ldrh r0, [r1, #0xe]
	lsrs r0, r0, #1
	cmp r7, r0
	bhi _0809827C
	b _0809817A
_0809827C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start EndingProcessAdamText
EndingProcessAdamText: @ 0x0809828C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	movs r7, #0
	ldr r5, _080982E8 @ =gNonGameplayRam
	movs r0, #0x83
	lsls r0, r0, #2
	adds r6, r5, r0
	ldrh r0, [r6]
	adds r2, r0, #1
	movs r1, #0
	mov sb, r1
	strh r2, [r6]
	ldr r3, [r5]
	ldrh r4, [r3]
	adds r1, r4, #0
	movs r0, #0xff
	lsls r0, r0, #8
	mov ip, r0
	cmp r1, ip
	bne _080982FC
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _080982C4
	b _08098492
_080982C4:
	strh r7, [r6]
	str r7, [sp, #4]
	ldr r1, _080982EC @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _080982F0 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _080982F4 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strh r7, [r5, #0xe]
	strh r7, [r5, #0xc]
	ldr r1, _080982F8 @ =0x00000212
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	movs r7, #1
	b _08098492
	.align 2, 0
_080982E8: .4byte gNonGameplayRam
_080982EC: .4byte 0x040000D4
_080982F0: .4byte 0x0600D000
_080982F4: .4byte 0x85000400
_080982F8: .4byte 0x00000212
_080982FC:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809836C
	ldrh r0, [r5, #0xe]
	cmp r0, #1
	bhi _0809832C
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bhi _08098314
	b _08098492
_08098314:
	strh r7, [r6]
	movs r0, #2
	strh r0, [r5, #0xe]
	strh r7, [r5, #0xc]
	ldr r1, _08098328 @ =0x00000212
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	b _08098408
	.align 2, 0
_08098328: .4byte 0x00000212
_0809832C:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7d
	bhi _08098336
	b _08098492
_08098336:
	strh r7, [r6]
	strh r7, [r5, #0xe]
	strh r7, [r5, #0xc]
	ldr r1, _0809835C @ =0x00000212
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	adds r0, r3, #2
	str r0, [r5]
	str r7, [sp, #4]
	ldr r1, _08098360 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _08098364 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08098368 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08098492
	.align 2, 0
_0809835C: .4byte 0x00000212
_08098360: .4byte 0x040000D4
_08098364: .4byte 0x0600D000
_08098368: .4byte 0x85000400
_0809836C:
	movs r0, #0xfd
	lsls r0, r0, #8
	mov r8, r0
	cmp r1, r8
	bne _080983B8
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _08098380
	b _08098492
_08098380:
	strh r7, [r6]
	str r7, [sp, #4]
	ldr r1, _080983A8 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _080983AC @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _080983B0 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strh r7, [r5, #0xe]
	strh r7, [r5, #0xc]
	adds r0, r3, #2
	str r0, [r5]
	ldr r1, _080983B4 @ =0x00000212
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	b _08098492
	.align 2, 0
_080983A8: .4byte 0x040000D4
_080983AC: .4byte 0x0600D000
_080983B0: .4byte 0x85000400
_080983B4: .4byte 0x00000212
_080983B8:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _080983EE
	strh r7, [r6]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r1, r5, r0
	ldrb r0, [r1]
	cmp r0, #1
	bne _08098492
	adds r0, r3, #2
	str r0, [r5]
	ldrh r0, [r3, #2]
	cmp r0, r8
	bne _080983DE
	movs r0, #2
	strb r0, [r1]
	b _08098492
_080983DE:
	cmp r0, ip
	bne _080983E8
	movs r0, #3
	strb r0, [r1]
	b _08098492
_080983E8:
	mov r0, sb
	strb r0, [r1]
	b _08098492
_080983EE:
	mov r0, ip
	ands r0, r4
	movs r1, #0xe1
	lsls r1, r1, #8
	cmp r0, r1
	bne _0809840E
	movs r1, #0xff
	ands r1, r4
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _08098492
	strh r7, [r6]
_08098408:
	adds r0, r3, #2
	str r0, [r5]
	b _08098492
_0809840E:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bls _08098492
	strh r7, [r6]
	ldrh r4, [r5, #0xc]
	lsls r4, r4, #5
	ldrh r0, [r5, #0xe]
	lsls r0, r0, #0xa
	adds r4, r4, r0
	ldr r1, _080984A4 @ =0x0600D000
	adds r4, r4, r1
	ldrh r0, [r3]
	bl GetCharacterWidth
	mov r8, r0
	ldr r0, [r5]
	ldrh r0, [r0]
	mov r1, r8
	lsls r2, r1, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _080984A8 @ =0x00000212
	adds r6, r5, r1
	ldrb r3, [r6]
	str r7, [sp]
	adds r1, r4, #0
	bl DrawCharacter
	ldr r1, [r5]
	ldrh r0, [r1]
	cmp r0, #0x40
	beq _08098454
	movs r1, #1
	bl PlayCharacterAppearingSound
_08098454:
	ldrh r0, [r5, #0xc]
	adds r4, r5, #0
	cmp r0, #0x1f
	bhi _0809848C
	ldrb r0, [r6]
	add r0, r8
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0809848C
	adds r3, r4, #0
	adds r2, r6, #0
_0809846E:
	ldrb r0, [r2]
	adds r1, r0, #0
	subs r1, #8
	strb r1, [r2]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bhi _0809848C
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _0809846E
_0809848C:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
_08098492:
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080984A4: .4byte 0x0600D000
_080984A8: .4byte 0x00000212

	thumb_func_start IntroProcessText
IntroProcessText: @ 0x080984AC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	mov r8, r0
	ldr r5, _08098514 @ =gNonGameplayRam
	movs r1, #0x83
	lsls r1, r1, #2
	adds r7, r5, r1
	ldrh r0, [r7]
	adds r2, r0, #1
	movs r0, #0
	mov sl, r0
	strh r2, [r7]
	ldr r6, [r5]
	ldrh r4, [r6]
	adds r3, r4, #0
	movs r1, #0xff
	lsls r1, r1, #8
	mov ip, r1
	cmp r3, ip
	bne _08098528
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc
	bhi _080984E8
	b _080986D2
_080984E8:
	mov r0, r8
	strh r0, [r7]
	mov r1, r8
	str r1, [sp, #4]
	ldr r1, _08098518 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _0809851C @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08098520 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r1, r8
	strh r1, [r5, #0xe]
	strh r1, [r5, #0xc]
	ldr r1, _08098524 @ =0x00000212
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	movs r0, #1
	mov r8, r0
	b _080986D2
	.align 2, 0
_08098514: .4byte gNonGameplayRam
_08098518: .4byte 0x040000D4
_0809851C: .4byte 0x0600D000
_08098520: .4byte 0x85000400
_08098524: .4byte 0x00000212
_08098528:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r3, r0
	bne _0809859C
	ldrh r0, [r5, #0xe]
	cmp r0, #1
	bhi _08098558
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08098540
	b _080986D2
_08098540:
	mov r1, r8
	strh r1, [r7]
	movs r0, #2
	strh r0, [r5, #0xe]
	strh r1, [r5, #0xc]
	ldr r1, _08098554 @ =0x00000212
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	b _08098654
	.align 2, 0
_08098554: .4byte 0x00000212
_08098558:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7a
	bhi _08098562
	b _080986D2
_08098562:
	mov r0, r8
	strh r0, [r7]
	strh r0, [r5, #0xe]
	strh r0, [r5, #0xc]
	ldr r1, _0809858C @ =0x00000212
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	adds r0, r6, #2
	str r0, [r5]
	mov r0, r8
	str r0, [sp, #4]
	ldr r1, _08098590 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _08098594 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08098598 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _080986D2
	.align 2, 0
_0809858C: .4byte 0x00000212
_08098590: .4byte 0x040000D4
_08098594: .4byte 0x0600D000
_08098598: .4byte 0x85000400
_0809859C:
	movs r1, #0xfd
	lsls r1, r1, #8
	mov sb, r1
	cmp r3, sb
	bne _080985EC
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc
	bhi _080985B0
	b _080986D2
_080985B0:
	mov r0, r8
	strh r0, [r7]
	mov r1, r8
	str r1, [sp, #4]
	ldr r1, _080985DC @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _080985E0 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _080985E4 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r1, r8
	strh r1, [r5, #0xe]
	strh r1, [r5, #0xc]
	adds r0, r6, #2
	str r0, [r5]
	ldr r1, _080985E8 @ =0x00000212
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	b _080986D2
	.align 2, 0
_080985DC: .4byte 0x040000D4
_080985E0: .4byte 0x0600D000
_080985E4: .4byte 0x85000400
_080985E8: .4byte 0x00000212
_080985EC:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r3, r0
	bne _08098638
	mov r0, r8
	strh r0, [r7]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r2, r5, r1
	ldrb r0, [r2]
	cmp r0, #1
	bne _080986D2
	adds r1, r6, #2
	str r1, [r5]
	ldrh r0, [r6, #2]
	cmp r0, sb
	bne _08098614
	movs r0, #2
	strb r0, [r2]
	b _080986D2
_08098614:
	cmp r0, ip
	beq _08098626
	cmp r0, r3
	bne _08098632
	adds r0, r1, #2
	str r0, [r5]
	ldrh r0, [r1, #2]
	cmp r0, ip
	bne _0809862C
_08098626:
	movs r0, #3
	strb r0, [r2]
	b _080986D2
_0809862C:
	movs r0, #4
	strb r0, [r2]
	b _080986D2
_08098632:
	mov r0, sl
	strb r0, [r2]
	b _080986D2
_08098638:
	mov r0, ip
	ands r0, r4
	movs r1, #0xe1
	lsls r1, r1, #8
	cmp r0, r1
	bne _0809865A
	movs r1, #0xff
	ands r1, r4
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _080986D2
	mov r1, r8
	strh r1, [r7]
_08098654:
	adds r0, r6, #2
	str r0, [r5]
	b _080986D2
_0809865A:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _080986D2
	mov r0, r8
	strh r0, [r7]
	ldrh r4, [r5, #0xc]
	lsls r4, r4, #5
	ldrh r0, [r5, #0xe]
	lsls r0, r0, #0xa
	adds r4, r4, r0
	ldr r1, _080986E4 @ =0x0600D000
	adds r4, r4, r1
	ldrh r0, [r6]
	bl GetCharacterWidth
	adds r7, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _080986E8 @ =0x00000212
	adds r6, r5, r1
	ldrb r3, [r6]
	mov r1, r8
	str r1, [sp]
	adds r1, r4, #0
	bl DrawCharacter
	ldrh r0, [r5, #0xc]
	cmp r0, #0x1f
	bhi _080986CA
	ldrb r0, [r6]
	adds r0, r0, r7
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _080986CA
	adds r3, r5, #0
	adds r2, r6, #0
_080986AC:
	ldrb r0, [r2]
	adds r1, r0, #0
	subs r1, #8
	strb r1, [r2]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bhi _080986CA
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _080986AC
_080986CA:
	ldr r1, _080986EC @ =gNonGameplayRam
	ldr r0, [r1]
	adds r0, #2
	str r0, [r1]
_080986D2:
	mov r0, r8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080986E4: .4byte 0x0600D000
_080986E8: .4byte 0x00000212
_080986EC: .4byte gNonGameplayRam

	thumb_func_start NewFileIntroProcessAdamText
NewFileIntroProcessAdamText: @ 0x080986F0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	movs r0, #0
	mov r8, r0
	ldr r5, _08098758 @ =gNonGameplayRam
	movs r1, #0x83
	lsls r1, r1, #2
	adds r7, r5, r1
	ldrh r0, [r7]
	adds r2, r0, #1
	movs r0, #0
	mov sl, r0
	strh r2, [r7]
	ldr r6, [r5]
	ldrh r4, [r6]
	adds r3, r4, #0
	movs r1, #0xff
	lsls r1, r1, #8
	mov ip, r1
	cmp r3, ip
	bne _0809876C
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc
	bhi _0809872C
	b _08098924
_0809872C:
	mov r0, r8
	strh r0, [r7]
	mov r1, r8
	str r1, [sp, #4]
	ldr r1, _0809875C @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _08098760 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08098764 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r1, r8
	strh r1, [r5, #0xe]
	strh r1, [r5, #0xc]
	ldr r1, _08098768 @ =0x00000212
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	movs r0, #1
	mov r8, r0
	b _08098924
	.align 2, 0
_08098758: .4byte gNonGameplayRam
_0809875C: .4byte 0x040000D4
_08098760: .4byte 0x0600D000
_08098764: .4byte 0x85000400
_08098768: .4byte 0x00000212
_0809876C:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r3, r0
	bne _080987E0
	ldrh r0, [r5, #0xe]
	cmp r0, #1
	bhi _0809879C
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bhi _08098784
	b _08098924
_08098784:
	mov r1, r8
	strh r1, [r7]
	movs r0, #2
	strh r0, [r5, #0xe]
	strh r1, [r5, #0xc]
	ldr r1, _08098798 @ =0x00000212
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	b _08098898
	.align 2, 0
_08098798: .4byte 0x00000212
_0809879C:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x7a
	bhi _080987A6
	b _08098924
_080987A6:
	mov r0, r8
	strh r0, [r7]
	strh r0, [r5, #0xe]
	strh r0, [r5, #0xc]
	ldr r1, _080987D0 @ =0x00000212
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	adds r0, r6, #2
	str r0, [r5]
	mov r0, r8
	str r0, [sp, #4]
	ldr r1, _080987D4 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _080987D8 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _080987DC @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _08098924
	.align 2, 0
_080987D0: .4byte 0x00000212
_080987D4: .4byte 0x040000D4
_080987D8: .4byte 0x0600D000
_080987DC: .4byte 0x85000400
_080987E0:
	movs r1, #0xfd
	lsls r1, r1, #8
	mov sb, r1
	cmp r3, sb
	bne _08098830
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc
	bhi _080987F4
	b _08098924
_080987F4:
	mov r0, r8
	strh r0, [r7]
	mov r1, r8
	str r1, [sp, #4]
	ldr r1, _08098820 @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _08098824 @ =0x0600D000
	str r0, [r1, #4]
	ldr r0, _08098828 @ =0x85000400
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r1, r8
	strh r1, [r5, #0xe]
	strh r1, [r5, #0xc]
	adds r0, r6, #2
	str r0, [r5]
	ldr r1, _0809882C @ =0x00000212
	adds r0, r5, r1
	mov r1, sl
	strb r1, [r0]
	b _08098924
	.align 2, 0
_08098820: .4byte 0x040000D4
_08098824: .4byte 0x0600D000
_08098828: .4byte 0x85000400
_0809882C: .4byte 0x00000212
_08098830:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r3, r0
	bne _0809887C
	mov r0, r8
	strh r0, [r7]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r2, r5, r1
	ldrb r0, [r2]
	cmp r0, #1
	bne _08098924
	adds r1, r6, #2
	str r1, [r5]
	ldrh r0, [r6, #2]
	cmp r0, sb
	bne _08098858
	movs r0, #2
	strb r0, [r2]
	b _08098924
_08098858:
	cmp r0, ip
	beq _0809886A
	cmp r0, r3
	bne _08098876
	adds r0, r1, #2
	str r0, [r5]
	ldrh r0, [r1, #2]
	cmp r0, ip
	bne _08098870
_0809886A:
	movs r0, #3
	strb r0, [r2]
	b _08098924
_08098870:
	movs r0, #4
	strb r0, [r2]
	b _08098924
_08098876:
	mov r0, sl
	strb r0, [r2]
	b _08098924
_0809887C:
	mov r0, ip
	ands r0, r4
	movs r1, #0xe1
	lsls r1, r1, #8
	cmp r0, r1
	bne _0809889E
	movs r1, #0xff
	ands r1, r4
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r1, r0
	bhi _08098924
	mov r1, r8
	strh r1, [r7]
_08098898:
	adds r0, r6, #2
	str r0, [r5]
	b _08098924
_0809889E:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #2
	bls _08098924
	mov r0, r8
	strh r0, [r7]
	ldrh r4, [r5, #0xc]
	lsls r4, r4, #5
	ldrh r0, [r5, #0xe]
	lsls r0, r0, #0xa
	adds r4, r4, r0
	ldr r1, _08098938 @ =0x0600D000
	adds r4, r4, r1
	ldrh r0, [r6]
	bl GetCharacterWidth
	adds r7, r0, #0
	ldr r0, [r5]
	ldrh r0, [r0]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	ldr r1, _0809893C @ =0x00000212
	adds r6, r5, r1
	ldrb r3, [r6]
	mov r1, r8
	str r1, [sp]
	adds r1, r4, #0
	bl DrawCharacter
	ldr r1, [r5]
	ldrh r0, [r1]
	cmp r0, #0x40
	beq _080988E6
	movs r1, #1
	bl PlayCharacterAppearingSound
_080988E6:
	ldrh r0, [r5, #0xc]
	adds r4, r5, #0
	cmp r0, #0x1f
	bhi _0809891E
	ldrb r0, [r6]
	adds r0, r0, r7
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bls _0809891E
	adds r3, r4, #0
	adds r2, r6, #0
_08098900:
	ldrb r0, [r2]
	adds r1, r0, #0
	subs r1, #8
	strb r1, [r2]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1f
	bhi _0809891E
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bhi _08098900
_0809891E:
	ldr r0, [r4]
	adds r0, #2
	str r0, [r4]
_08098924:
	mov r0, r8
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08098938: .4byte 0x0600D000
_0809893C: .4byte 0x00000212

	thumb_func_start Dma3Transfer_Unused1
Dma3Transfer_Unused1: @ 0x08098940
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	lsls r2, r2, #0x15
	movs r3, #0
	cmp r3, r7
	bhs _08098976
	ldr r1, _0809897C @ =0x040000D4
	lsrs r2, r2, #0x12
	movs r0, #0x84
	lsls r0, r0, #0x18
	orrs r2, r0
	movs r6, #0x80
	lsls r6, r6, #3
_08098960:
	str r5, [r1]
	str r4, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	adds r5, r5, r6
	adds r4, r4, r6
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r7
	blo _08098960
_08098976:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809897C: .4byte 0x040000D4

	thumb_func_start Dma3Transfer_Unused2
Dma3Transfer_Unused2: @ 0x08098980
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	lsls r2, r2, #0x11
	movs r3, #0
	cmp r3, r6
	bhs _080989B2
	ldr r1, _080989B8 @ =0x040000D4
	lsrs r2, r2, #0x11
	movs r0, #0x80
	lsls r0, r0, #0x18
	orrs r2, r0
_0809899C:
	str r5, [r1]
	str r4, [r1, #4]
	str r2, [r1, #8]
	ldr r0, [r1, #8]
	adds r5, #0x40
	adds r4, #0x40
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r6
	blo _0809899C
_080989B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080989B8: .4byte 0x040000D4

	thumb_func_start Dma3Clear_Unused
Dma3Clear_Unused: @ 0x080989BC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r2, r2, #0x10
	lsrs r5, r2, #0x10
	lsls r1, r1, #0x15
	movs r2, #0
	cmp r2, r5
	bhs _080989F6
	movs r7, #0
	ldr r3, _08098A00 @ =0x040000D4
	lsrs r1, r1, #0x12
	movs r0, #0x85
	lsls r0, r0, #0x18
	orrs r1, r0
	movs r6, #0x80
	lsls r6, r6, #3
_080989DE:
	str r7, [sp]
	mov r0, sp
	str r0, [r3]
	str r4, [r3, #4]
	str r1, [r3, #8]
	ldr r0, [r3, #8]
	adds r4, r4, r6
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, r5
	blo _080989DE
_080989F6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098A00: .4byte 0x040000D4

	thumb_func_start unk_98a04
unk_98a04: @ 0x08098A04
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r0, _08098A48 @ =gNonGameplayRam
	mov ip, r0
	movs r7, #0x88
	lsls r7, r7, #1
	add r7, ip
	movs r6, #0x96
	lsls r6, r6, #1
	add r6, ip
	movs r5, #0xb2
	lsls r5, r5, #1
	add r5, ip
	movs r4, #0xa4
	lsls r4, r4, #1
	add r4, ip
_08098A24:
	adds r0, r3, r7
	adds r1, r3, r6
	ldrb r2, [r1]
	ldrb r0, [r0]
	cmp r0, r2
	bhi _08098A50
	movs r2, #0
	strb r2, [r1]
	adds r1, r3, r5
	movs r0, #1
	strb r0, [r1]
	adds r1, r3, r4
	ldrb r0, [r1]
	cmp r0, #0x25
	bhi _08098A4C
	adds r0, #1
	b _08098A52
	.align 2, 0
_08098A48: .4byte gNonGameplayRam
_08098A4C:
	strb r2, [r1]
	b _08098A54
_08098A50:
	adds r0, r2, #1
_08098A52:
	strb r0, [r1]
_08098A54:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #3
	bls _08098A24
	movs r0, #0x8d
	lsls r0, r0, #1
	add r0, ip
	movs r2, #0x9b
	lsls r2, r2, #1
	add r2, ip
	ldrb r1, [r2]
	ldrb r0, [r0]
	cmp r0, r1
	bhi _08098A96
	movs r3, #0
	strb r3, [r2]
	movs r1, #0xb7
	lsls r1, r1, #1
	add r1, ip
	movs r0, #1
	strb r0, [r1]
	movs r1, #0xa9
	lsls r1, r1, #1
	add r1, ip
	ldrb r0, [r1]
	cmp r0, #0xe
	bhi _08098A92
	adds r0, #1
	strb r0, [r1]
	b _08098A9A
_08098A92:
	strb r3, [r1]
	b _08098A9A
_08098A96:
	adds r0, r1, #1
	strb r0, [r2]
_08098A9A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start NewFileIntroSamusGettingCuredSetupWindow
NewFileIntroSamusGettingCuredSetupWindow: @ 0x08098AA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _08098AE4 @ =0x040000D4
	ldr r0, _08098AE8 @ =0x02001000
	str r0, [r1]
	ldr r0, _08098AEC @ =0x02002000
	str r0, [r1, #4]
	ldr r0, _08098AF0 @ =0x84000058
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _08098AF4 @ =gNonGameplayRam
	ldr r2, _08098AF8 @ =0x000001F5
	adds r0, r1, r2
	ldrb r2, [r0]
	ldr r3, _08098AFC @ =0x000001F3
	adds r0, r1, r3
	ldrb r3, [r0]
	subs r0, r2, r3
	lsls r0, r0, #0x10
	adds r7, r2, r3
	lsrs r2, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bge _08098B00
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r3, #1
	movs r2, #0
	cmp r5, r0
	ble _08098B02
	movs r2, #0xa1
	b _08098B02
	.align 2, 0
_08098AE4: .4byte 0x040000D4
_08098AE8: .4byte 0x02001000
_08098AEC: .4byte 0x02002000
_08098AF0: .4byte 0x84000058
_08098AF4: .4byte gNonGameplayRam
_08098AF8: .4byte 0x000001F5
_08098AFC: .4byte 0x000001F3
_08098B00:
	movs r5, #0
_08098B02:
	cmp r7, #0x9f
	ble _08098B08
	movs r7, #0xa0
_08098B08:
	ldr r0, _08098BBC @ =0x083E3294
	ldr r6, _08098BC0 @ =0x000001F3
	adds r1, r1, r6
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	mov ip, r1
	ldr r4, _08098BC4 @ =0x02001000
	movs r6, #0
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r1, r7, #0x10
	cmp r6, r0
	bge _08098B3E
	movs r2, #0
	adds r3, r0, #0
_08098B2A:
	strh r2, [r4]
	adds r4, #2
	lsls r0, r6, #0x10
	movs r6, #0x80
	lsls r6, r6, #9
	adds r0, r0, r6
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r3
	blt _08098B2A
_08098B3E:
	lsls r0, r6, #0x10
	asrs r3, r1, #0x10
	cmp r0, r1
	bgt _08098B98
	ldr r0, _08098BC8 @ =0x03001678
	mov r8, r0
	adds r7, r3, #0
_08098B4C:
	mov r1, r8
	ldrb r2, [r1]
	lsls r0, r5, #2
	add r0, ip
	ldrh r1, [r0, #2]
	adds r1, r2, r1
	lsls r1, r1, #0x10
	ldrh r0, [r0]
	adds r2, r2, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsrs r3, r1, #0x10
	cmp r1, #0
	bge _08098B6A
	movs r3, #0
_08098B6A:
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _08098B74
	movs r2, #0xf0
_08098B74:
	lsls r1, r3, #0x10
	asrs r1, r1, #8
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #0x10
	movs r2, #0x80
	lsls r2, r2, #9
	adds r0, r0, r2
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r7
	ble _08098B4C
_08098B98:
	lsls r1, r6, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	bgt _08098BB2
	movs r2, #0
_08098BA2:
	strh r2, [r4]
	adds r4, #2
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r1, r3
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	ble _08098BA2
_08098BB2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098BBC: .4byte 0x083E3294
_08098BC0: .4byte 0x000001F3
_08098BC4: .4byte 0x02001000
_08098BC8: .4byte 0x03001678

	thumb_func_start SpecialCutsceneFadeIn
SpecialCutsceneFadeIn: @ 0x08098BCC
	push {lr}
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _08098BE8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _08098BE2
	subs r0, #1
	strh r0, [r1]
_08098BE2:
	pop {r0}
	bx r0
	.align 2, 0
_08098BE8: .4byte gWrittenToBldy

	thumb_func_start SpecialCutsceneFadOut
SpecialCutsceneFadOut: @ 0x08098BEC
	push {lr}
	bl SpecialCutsceneProcessOam
	bl SpecialCutsceneDrawAllOam
	ldr r1, _08098C08 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _08098C02
	adds r0, #1
	strh r0, [r1]
_08098C02:
	pop {r0}
	bx r0
	.align 2, 0
_08098C08: .4byte gWrittenToBldy

	thumb_func_start NewFileIntroProcessTextCursor
NewFileIntroProcessTextCursor: @ 0x08098C0C
	push {lr}
	adds r2, r0, #0
	ldr r0, _08098C28 @ =gNonGameplayRam
	ldr r0, [r0]
	ldrh r1, [r0]
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _08098C2C
	movs r0, #0xeb
	strh r0, [r2, #0xc]
	movs r0, #0x98
	strh r0, [r2, #0xe]
	b _08098C32
	.align 2, 0
_08098C28: .4byte gNonGameplayRam
_08098C2C:
	movs r0, #0x82
	lsls r0, r0, #1
	strh r0, [r2, #0xc]
_08098C32:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SpecialCutsceneClearOam
SpecialCutsceneClearOam: @ 0x08098C38
	push {r4, r5, r6, lr}
	movs r3, #0
	ldr r6, _08098C68 @ =gNonGameplayRam
	movs r4, #0x8d
	lsls r4, r4, #2
	movs r5, #2
	rsbs r5, r5, #0
_08098C46:
	lsls r1, r3, #3
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r6
	adds r1, r1, r4
	ldrb r2, [r1]
	adds r0, r5, #0
	ands r0, r2
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x13
	bls _08098C46
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098C68: .4byte gNonGameplayRam

	thumb_func_start SpecialCutsceneEnableOam
SpecialCutsceneEnableOam: @ 0x08098C6C
	push {r4, r5, r6, lr}
	movs r2, #0
	ldr r6, _08098CA4 @ =gNonGameplayRam
	movs r5, #0x8b
	lsls r5, r5, #2
	movs r4, #0x8d
	lsls r4, r4, #2
	movs r3, #1
_08098C7C:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r6
	adds r0, r1, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _08098C94
	adds r1, r1, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
_08098C94:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x13
	bls _08098C7C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098CA4: .4byte gNonGameplayRam

	thumb_func_start SpecialCutsceneDestroyOamOfType
SpecialCutsceneDestroyOamOfType: @ 0x08098CA8
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r6, _08098CE0 @ =gNonGameplayRam
	movs r7, #2
	rsbs r7, r7, #0
	movs r5, #0x8b
	lsls r5, r5, #2
_08098CBA:
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r6
	adds r1, r2, r5
	ldrb r0, [r1]
	cmp r0, r4
	bne _08098CE4
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x8d
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrb r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	strb r0, [r2]
	b _08098CEE
	.align 2, 0
_08098CE0: .4byte gNonGameplayRam
_08098CE4:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x13
	bls _08098CBA
_08098CEE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start SpecialCutsceneProcessOam
SpecialCutsceneProcessOam: @ 0x08098CF4
	push {r4, r5, r6, lr}
	ldr r0, _08098D44 @ =gNonGameplayRam
	ldr r1, _08098D48 @ =0x00000215
	adds r2, r0, r1
	movs r1, #0
	strb r1, [r2]
	movs r4, #0
	adds r5, r0, #0
	adds r6, r2, #0
_08098D06:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r2, r0, #2
	adds r0, r2, r5
	movs r3, #0x8b
	lsls r3, r3, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _08098D34
	movs r0, #0x8f
	lsls r0, r0, #2
	adds r1, r5, r0
	adds r1, r2, r1
	subs r3, #0x10
	adds r0, r5, r3
	adds r0, r2, r0
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
_08098D34:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _08098D06
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098D44: .4byte gNonGameplayRam
_08098D48: .4byte 0x00000215

	thumb_func_start SpecialCutsceneDrawAllOam
SpecialCutsceneDrawAllOam: @ 0x08098D4C
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _08098D94 @ =gNonGameplayRam
	movs r0, #0x87
	lsls r0, r0, #2
	adds r6, r5, r0
_08098D58:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #2
	adds r0, r1, r5
	movs r2, #0x8d
	lsls r2, r2, #2
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _08098D74
	adds r0, r1, r6
	bl SpecialCutsceneDrawOam
_08098D74:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0x13
	bls _08098D58
	bl ResetFreeOam
	ldr r0, _08098D98 @ =gNextOamSlot
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08098D9C @ =0x03001238
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08098D94: .4byte gNonGameplayRam
_08098D98: .4byte gNextOamSlot
_08098D9C: .4byte 0x03001238

	thumb_func_start SpecialCutsceneDrawOam
SpecialCutsceneDrawOam: @ 0x08098DA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x38
	mov sb, r0
	ldr r3, _08098E9C @ =gNextOamSlot
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r2, _08098EA0 @ =gOamData
	adds r0, r0, r2
	mov ip, r0
	mov r0, sb
	ldrb r5, [r0, #0x11]
	lsls r1, r5, #3
	ldr r0, [r0, #0x1c]
	adds r4, r0, r1
	ldrb r0, [r4, #4]
	mov r1, sb
	ldrb r1, [r1, #0x12]
	cmp r0, r1
	bne _08098DDA
	adds r0, r5, #1
	movs r1, #0
	mov r2, sb
	strb r0, [r2, #0x11]
	strb r1, [r2, #0x12]
	adds r4, #8
_08098DDA:
	ldrb r1, [r4, #4]
	cmp r1, #0
	bne _08098DEA
	mov r3, sb
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #3
	subs r4, r4, r0
	strb r1, [r3, #0x11]
_08098DEA:
	ldr r4, [r4]
	mov sl, r4
	ldrh r4, [r4]
	str r4, [sp, #0x20]
	movs r5, #2
	add sl, r5
	mov r0, sb
	ldrb r1, [r0, #0x18]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _08098E04
	b _08098F78
_08098E04:
	movs r1, #0
	str r1, [sp, #0x1c]
	cmp r1, r4
	blt _08098E10
	bl _0809975A
_08098E10:
	ldr r2, _08098EA4 @ =0x000001FF
	adds r7, r2, #0
	movs r3, #3
	mov r8, r3
_08098E18:
	mov r4, sl
	ldrh r6, [r4]
	movs r5, #2
	add sl, r5
	mov r0, sl
	ldrh r5, [r0]
	movs r1, #2
	add sl, r1
	mov r2, ip
	strh r6, [r2]
	add ip, r1
	mov r3, ip
	strh r5, [r3]
	add ip, r1
	mov r4, sl
	ldrh r0, [r4]
	mov r1, ip
	strh r0, [r1]
	movs r2, #2
	add sl, r2
	add ip, r2
	ldr r3, _08098E9C @ =gNextOamSlot
	ldrb r0, [r3]
	ldr r4, [sp, #0x1c]
	adds r3, r0, r4
	mov r1, sb
	ldrb r0, [r1, #0x18]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x1f
	cmp r1, #1
	bne _08098EAC
	lsls r4, r3, #3
	ldr r3, _08098EA0 @ =gOamData
	adds r2, r4, r3
	ldrb r3, [r2, #3]
	lsls r0, r3, #0x1b
	lsrs r0, r0, #0x1f
	eors r0, r1
	lsls r0, r0, #4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #3]
	lsrs r1, r1, #6
	ldrb r0, [r2, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _08098EA8 @ =0x0863A184
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r5, r0
	mov r2, sb
	ldrh r1, [r2, #0xc]
	subs r0, r1, r0
	ands r0, r7
	str r0, [sp]
	ldrh r0, [r2, #0xe]
	adds r6, r6, r0
	movs r0, #0xff
	ands r6, r0
	str r6, [sp, #4]
	b _08098EC2
	.align 2, 0
_08098E9C: .4byte gNextOamSlot
_08098EA0: .4byte gOamData
_08098EA4: .4byte 0x000001FF
_08098EA8: .4byte 0x0863A184
_08098EAC:
	mov r4, sb
	ldrh r0, [r4, #0xe]
	adds r6, r6, r0
	movs r0, #0xff
	ands r6, r0
	str r6, [sp, #4]
	ldrh r0, [r4, #0xc]
	adds r5, r5, r0
	ands r5, r7
	str r5, [sp]
	lsls r4, r3, #3
_08098EC2:
	ldr r5, _08098F68 @ =gOamData
	adds r3, r4, r5
	mov r0, sp
	ldrb r0, [r0, #4]
	strb r0, [r3]
	ldr r1, [sp]
	ands r1, r7
	str r1, [sp]
	ldrh r1, [r3, #2]
	ldr r0, _08098F6C @ =0xFFFFFE00
	ands r0, r1
	ldr r2, [sp]
	orrs r0, r2
	strh r0, [r3, #2]
	mov r4, sb
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	mov r5, r8
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r3, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #5]
	lsrs r2, r1, #4
	ldrb r0, [r4, #0x1a]
	lsrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #4
	movs r0, #0xf
	ands r1, r0
	orrs r1, r2
	strb r1, [r3, #5]
	ldrh r2, [r3, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldr r0, [r4, #0x18]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r4, _08098F70 @ =0x000003FF
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _08098F74 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	mov r5, sb
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r3, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #1]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	lsls r0, r0, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #1]
	movs r3, #2
	add ip, r3
	ldr r4, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	cmp r4, r5
	bge _08098F64
	b _08098E18
_08098F64:
	b _0809975A
	.align 2, 0
_08098F68: .4byte gOamData
_08098F6C: .4byte 0xFFFFFE00
_08098F70: .4byte 0x000003FF
_08098F74: .4byte 0xFFFFFC00
_08098F78:
	cmp r0, #1
	beq _08098F7E
	b _08099400
_08098F7E:
	mov r2, sb
	ldrh r0, [r2, #0xc]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r2, #0xe]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r1, #0x19
	cmp r0, #0
	blt _08098FA0
	ldrh r3, [r2, #6]
	str r3, [sp, #0x14]
	b _08098FAC
_08098FA0:
	mov r4, sb
	ldrh r0, [r4, #6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
_08098FAC:
	lsls r0, r1, #0x18
	cmp r0, #0
	blt _08098FBA
	mov r5, sb
	ldrh r5, [r5, #6]
	str r5, [sp, #0x18]
	b _08098FC6
_08098FBA:
	mov r1, sb
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
_08098FC6:
	movs r2, #0
	str r2, [sp, #0x28]
	movs r3, #0
	str r3, [sp, #0x1c]
	ldr r4, [sp, #0x14]
	lsls r4, r4, #0x10
	str r4, [sp, #0x34]
	ldr r5, [sp, #0x20]
	cmp r3, r5
	blt _08098FDC
	b _0809925C
_08098FDC:
	mov r0, sl
	ldrh r6, [r0]
	movs r1, #2
	add sl, r1
	mov r2, sl
	ldrh r5, [r2]
	add sl, r1
	mov r3, ip
	strh r6, [r3]
	add ip, r1
	mov r4, ip
	strh r5, [r4]
	add ip, r1
	mov r1, sl
	ldrh r0, [r1]
	mov r2, ip
	strh r0, [r2]
	movs r3, #2
	add sl, r3
	add ip, r3
	ldr r4, _08099098 @ =gNextOamSlot
	ldrb r0, [r4]
	ldr r1, [sp, #0x1c]
	adds r3, r0, r1
	lsls r0, r3, #3
	ldr r2, _0809909C @ =gOamData
	adds r0, r0, r2
	mov r8, r0
	ldrb r7, [r0, #3]
	lsrs r1, r7, #6
	ldrb r0, [r0, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r4, _080990A0 @ =0x0863A184
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #2
	str r0, [sp, #8]
	ldr r0, _080990A4 @ =0x0863A190
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #2
	str r0, [sp, #0xc]
	ldr r1, [sp, #4]
	adds r6, r6, r1
	movs r0, #0xff
	ands r6, r0
	ldr r2, [sp]
	adds r4, r5, r2
	ldr r5, _080990A8 @ =0x000001FF
	adds r0, r5, #0
	ands r4, r0
	subs r1, r4, r2
	ldr r0, [sp, #8]
	adds r1, r0, r1
	ldr r5, [sp, #4]
	subs r2, r6, r5
	ldr r0, [sp, #0xc]
	adds r2, r0, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r5, [sp, #0x34]
	asrs r0, r5, #0x10
	muls r0, r1, r0
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, [sp, #0x18]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	muls r0, r2, r0
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r0, r7, #0x1b
	cmp r0, #0
	bge _080990AC
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r7
	mov r5, r8
	strb r0, [r5, #3]
	movs r0, #1
	str r0, [sp, #0x28]
	movs r1, #1
	str r1, [sp, #0x24]
	b _080990B0
	.align 2, 0
_08099098: .4byte gNextOamSlot
_0809909C: .4byte gOamData
_080990A0: .4byte 0x0863A184
_080990A4: .4byte 0x0863A190
_080990A8: .4byte 0x000001FF
_080990AC:
	movs r5, #0
	str r5, [sp, #0x24]
_080990B0:
	lsls r0, r3, #3
	ldr r1, _080993E4 @ =gOamData
	adds r7, r0, r1
	ldrb r1, [r7, #3]
	lsls r0, r1, #0x1a
	cmp r0, #0
	bge _080990D0
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #3]
	ldr r3, [sp, #0x18]
	lsls r0, r3, #0x10
	rsbs r0, r0, #0
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
_080990D0:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r4, [sp, #0x10]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r5, [sp]
	subs r4, r4, r5
	ldr r0, [sp, #8]
	mov r8, r0
	add r4, r8
	ldr r1, [sp, #4]
	subs r3, r6, r1
	ldr r6, [sp, #0xc]
	adds r3, r6, r3
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	ldrb r1, [r2, #0x15]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r5, _080993E8 @ =sSineTable
	adds r0, r0, r5
	movs r2, #0
	ldrsh r5, [r0, r2]
	adds r2, r4, #0
	muls r2, r5, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #1
	ldr r0, _080993E8 @ =sSineTable
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r3, #0
	muls r0, r1, r0
	subs r2, r2, r0
	lsls r2, r2, #8
	adds r0, r4, #0
	muls r0, r1, r0
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	asrs r2, r2, #0x10
	mov r1, r8
	subs r2, r2, r1
	asrs r0, r0, #0x10
	subs r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r3, [sp, #4]
	adds r0, r6, r3
	subs r0, #0x40
	strb r0, [r7]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r4, [sp]
	adds r2, r2, r4
	subs r2, #0x40
	ldr r4, _080993EC @ =0x000001FF
	ands r2, r4
	ldrh r0, [r7, #2]
	ldr r1, _080993F0 @ =0xFFFFFE00
	adds r3, r1, #0
	ands r3, r0
	orrs r3, r2
	strh r3, [r7, #2]
	ldr r5, [sp, #0x24]
	cmp r5, #1
	bne _08099180
	lsls r0, r3, #0x17
	lsrs r0, r0, #0x17
	subs r0, #1
	ands r0, r4
	ands r3, r1
	orrs r3, r0
	strh r3, [r7, #2]
_08099180:
	ldrb r1, [r7, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r3, #1
	orrs r0, r3
	strb r0, [r7, #1]
	ldr r1, _080993F4 @ =0x03001238
	ldrb r0, [r1]
	ldr r2, [sp, #0x24]
	adds r0, r0, r2
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080991A6
	ldrb r0, [r7, #3]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r7, #3]
_080991A6:
	ldr r4, _080993F4 @ =0x03001238
	ldrb r0, [r4]
	ldr r5, [sp, #0x24]
	adds r0, r0, r5
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080991BE
	ldrb r0, [r7, #3]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #3]
_080991BE:
	ldr r0, _080993F4 @ =0x03001238
	ldrb r1, [r0]
	ldr r2, [sp, #0x24]
	adds r1, r1, r2
	movs r0, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r7, #3]
	subs r0, #0x16
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #3]
	mov r4, sb
	ldrb r0, [r4, #0x1a]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	movs r5, #3
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r7, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #5]
	lsrs r2, r1, #4
	ldrb r0, [r4, #0x1a]
	lsrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #4
	movs r0, #0xf
	ands r1, r0
	orrs r1, r2
	strb r1, [r7, #5]
	ldrh r2, [r7, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldr r0, [r4, #0x18]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r4, _080993F8 @ =0x000003FF
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _080993FC @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #4]
	mov r5, sb
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r7, #1]
	subs r1, #0x10
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	ldrb r0, [r5, #0x18]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	ands r0, r3
	lsls r0, r0, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	movs r3, #2
	add ip, r3
	ldr r4, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	cmp r4, r5
	bge _0809925C
	b _08098FDC
_0809925C:
	ldr r1, _080993F4 @ =0x03001238
	ldrb r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x18
	mov r2, sb
	ldrb r0, [r2, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r3, _080993E8 @ =sSineTable
	adds r0, r0, r3
	movs r5, #0
	ldrsh r4, [r0, r5]
	ldr r0, [sp, #0x34]
	asrs r0, r0, #0x10
	mov sl, r0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	ldr r1, _080993E4 @ =gOamData
	mov r8, r1
	lsls r1, r7, #3
	add r1, r8
	strh r0, [r1, #6]
	mov r2, sb
	ldrb r0, [r2, #0x15]
	lsls r0, r0, #1
	ldr r3, _080993E8 @ =sSineTable
	adds r0, r0, r3
	movs r5, #0
	ldrsh r4, [r0, r5]
	mov r0, sl
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #1
	lsls r1, r1, #3
	add r1, r8
	strh r0, [r1, #6]
	mov r1, sb
	ldrb r0, [r1, #0x15]
	lsls r0, r0, #1
	ldr r2, _080993E8 @ =sSineTable
	adds r0, r0, r2
	ldrh r4, [r0]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, [sp, #0x18]
	lsls r0, r3, #0x10
	asrs r6, r0, #0x10
	adds r0, r6, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #2
	lsls r1, r1, #3
	add r1, r8
	strh r0, [r1, #6]
	mov r4, sb
	ldrb r0, [r4, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r5, _080993E8 @ =sSineTable
	adds r0, r0, r5
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r0, r6, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #3
	lsls r1, r1, #3
	add r1, r8
	strh r0, [r1, #6]
	ldr r2, _080993F4 @ =0x03001238
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r3, [sp, #0x28]
	cmp r3, #1
	beq _08099328
	b _0809975A
_08099328:
	ldrb r0, [r2]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x18
	mov r4, sb
	ldrb r0, [r4, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r5, [r0, r1]
	mov r2, sl
	rsbs r4, r2, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl FixedMultiplication
	lsls r1, r7, #3
	add r1, r8
	strh r0, [r1, #6]
	mov r3, sb
	ldrb r0, [r3, #0x15]
	lsls r0, r0, #1
	ldr r5, _080993E8 @ =sSineTable
	adds r0, r0, r5
	movs r1, #0
	ldrsh r5, [r0, r1]
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl FixedMultiplication
	adds r1, r7, #1
	lsls r1, r1, #3
	add r1, r8
	strh r0, [r1, #6]
	mov r2, sb
	ldrb r0, [r2, #0x15]
	lsls r0, r0, #1
	ldr r3, _080993E8 @ =sSineTable
	adds r0, r0, r3
	ldrh r4, [r0]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r6, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #2
	lsls r1, r1, #3
	add r1, r8
	strh r0, [r1, #6]
	mov r4, sb
	ldrb r0, [r4, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r5, _080993E8 @ =sSineTable
	adds r0, r0, r5
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r0, r6, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #3
	lsls r1, r1, #3
	add r1, r8
	strh r0, [r1, #6]
	ldr r2, _080993F4 @ =0x03001238
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	b _0809975A
	.align 2, 0
_080993E4: .4byte gOamData
_080993E8: .4byte sSineTable
_080993EC: .4byte 0x000001FF
_080993F0: .4byte 0xFFFFFE00
_080993F4: .4byte 0x03001238
_080993F8: .4byte 0x000003FF
_080993FC: .4byte 0xFFFFFC00
_08099400:
	cmp r0, #3
	beq _08099406
	b _0809975A
_08099406:
	mov r3, sb
	ldrh r0, [r3, #0xc]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r3, #0xe]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r1, #0x19
	cmp r0, #0
	blt _08099428
	ldrh r4, [r3, #6]
	str r4, [sp, #0x14]
	b _08099434
_08099428:
	mov r5, sb
	ldrh r0, [r5, #6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
_08099434:
	lsls r0, r1, #0x18
	cmp r0, #0
	blt _08099440
	mov r0, sb
	ldrh r0, [r0, #6]
	b _0809944A
_08099440:
	mov r1, sb
	ldrh r0, [r1, #6]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0809944A:
	str r0, [sp, #0x18]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	cmp r2, r3
	blt _08099458
	b _08099696
_08099458:
	mov r4, sl
	ldrh r6, [r4]
	movs r5, #2
	add sl, r5
	mov r0, sl
	ldrh r5, [r0]
	movs r1, #2
	add sl, r1
	mov r2, ip
	strh r6, [r2]
	add ip, r1
	mov r3, ip
	strh r5, [r3]
	add ip, r1
	mov r4, sl
	ldrh r0, [r4]
	mov r1, ip
	strh r0, [r1]
	movs r2, #2
	add sl, r2
	add ip, r2
	ldr r3, _0809977C @ =gNextOamSlot
	ldrb r0, [r3]
	ldr r4, [sp, #0x1c]
	adds r3, r0, r4
	lsls r0, r3, #3
	ldr r1, _08099780 @ =gOamData
	adds r7, r0, r1
	ldrb r2, [r7, #3]
	mov r8, r2
	mov r3, r8
	lsrs r1, r3, #6
	ldrb r0, [r7, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r4, _08099784 @ =0x0863A184
	adds r0, r1, r4
	ldrb r2, [r0]
	ldr r0, _08099788 @ =0x0863A190
	adds r1, r1, r0
	ldrb r3, [r1]
	ldr r1, [sp, #4]
	adds r6, r6, r1
	movs r0, #0xff
	ands r6, r0
	ldr r0, [sp]
	adds r4, r5, r0
	ldr r1, _0809978C @ =0x000001FF
	adds r0, r1, #0
	ands r4, r0
	ldr r5, [sp]
	subs r1, r4, r5
	lsls r2, r2, #2
	str r2, [sp, #0x2c]
	adds r1, r2, r1
	ldr r0, [sp, #4]
	subs r2, r6, r0
	lsls r3, r3, #2
	str r3, [sp, #0x30]
	adds r2, r3, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0x14]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	adds r0, r1, #0
	muls r0, r3, r0
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r5, [sp, #0x18]
	lsls r0, r5, #0x10
	asrs r5, r0, #0x10
	adds r0, r2, #0
	muls r0, r5, r0
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, r8
	lsls r0, r1, #0x1b
	cmp r0, #0
	bge _08099518
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #3]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
_08099518:
	ldrb r1, [r7, #3]
	lsls r0, r1, #0x1a
	cmp r0, #0
	bge _08099530
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #3]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
_08099530:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0x10]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r5, [sp]
	subs r4, r4, r5
	ldr r0, [sp, #0x2c]
	adds r4, r0, r4
	ldr r1, [sp, #4]
	subs r3, r6, r1
	ldr r2, [sp, #0x30]
	adds r3, r2, r3
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r5, sb
	ldrb r1, [r5, #0x15]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r2, _08099790 @ =sSineTable
	adds r0, r0, r2
	movs r2, #0
	ldrsh r5, [r0, r2]
	adds r2, r4, #0
	muls r2, r5, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #1
	ldr r0, _08099790 @ =sSineTable
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r3, #0
	muls r0, r1, r0
	subs r2, r2, r0
	lsls r2, r2, #8
	adds r0, r4, #0
	muls r0, r1, r0
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r3, [sp, #0x2c]
	lsls r1, r3, #1
	asrs r2, r2, #0x10
	subs r2, r2, r1
	ldr r4, [sp, #0x30]
	lsls r1, r4, #1
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r5, [sp, #4]
	adds r0, r6, r5
	subs r0, #0x40
	strb r0, [r7]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, [sp]
	adds r2, r2, r0
	subs r2, #0x40
	ldr r0, _0809978C @ =0x000001FF
	ands r2, r0
	ldrh r1, [r7, #2]
	ldr r0, _08099794 @ =0xFFFFFE00
	ands r0, r1
	orrs r0, r2
	strh r0, [r7, #2]
	ldrb r0, [r7, #1]
	movs r3, #3
	orrs r0, r3
	strb r0, [r7, #1]
	ldr r2, _08099798 @ =0x03001238
	ldrb r1, [r2]
	movs r2, #0x10
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080995EC
	ldrb r0, [r7, #3]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r7, #3]
_080995EC:
	ldr r4, _08099798 @ =0x03001238
	ldrb r1, [r4]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080995FE
	ldrb r0, [r7, #3]
	orrs r0, r2
	strb r0, [r7, #3]
_080995FE:
	ldr r5, _08099798 @ =0x03001238
	ldrb r0, [r5]
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r7, #3]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #3]
	mov r1, sb
	ldrb r0, [r1, #0x1a]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	ands r0, r3
	lsls r0, r0, #2
	ldrb r2, [r7, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #5]
	lsrs r2, r1, #4
	mov r4, sb
	ldrb r0, [r4, #0x1a]
	lsrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #4
	movs r0, #0xf
	ands r1, r0
	orrs r1, r2
	strb r1, [r7, #5]
	ldrh r2, [r7, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldr r0, [r4, #0x18]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x16
	adds r1, r1, r0
	ldr r5, _0809979C @ =0x000003FF
	adds r0, r5, #0
	ands r1, r0
	ldr r0, _080997A0 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #4]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1e
	ands r0, r3
	lsls r0, r0, #2
	ldrb r2, [r7, #1]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	lsls r0, r0, #4
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	movs r3, #2
	add ip, r3
	ldr r4, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	cmp r4, r5
	bge _08099696
	b _08099458
_08099696:
	ldr r1, _08099798 @ =0x03001238
	ldrb r0, [r1]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x18
	mov r2, sb
	ldrb r0, [r2, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r3, _08099790 @ =sSineTable
	adds r0, r0, r3
	movs r4, #0
	ldrsh r5, [r0, r4]
	ldr r0, [sp, #0x14]
	lsls r4, r0, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl FixedMultiplication
	ldr r6, _08099780 @ =gOamData
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	mov r1, sb
	ldrb r0, [r1, #0x15]
	lsls r0, r0, #1
	ldr r2, _08099790 @ =sSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r5, [r0, r3]
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl FixedMultiplication
	adds r1, r7, #1
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	mov r4, sb
	ldrb r0, [r4, #0x15]
	lsls r0, r0, #1
	ldr r5, _08099790 @ =sSineTable
	adds r0, r0, r5
	ldrh r4, [r0]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [sp, #0x18]
	lsls r5, r0, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #2
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	mov r1, sb
	ldrb r0, [r1, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r2, _08099790 @ =sSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r4, [r0, r3]
	adds r0, r5, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #3
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	ldr r4, _08099798 @ =0x03001238
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0809975A:
	ldr r0, _0809977C @ =gNextOamSlot
	ldrb r1, [r0]
	ldr r5, [sp, #0x20]
	adds r1, r1, r5
	strb r1, [r0]
	mov r1, sb
	ldrb r0, [r1, #0x12]
	adds r0, #1
	strb r0, [r1, #0x12]
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809977C: .4byte gNextOamSlot
_08099780: .4byte gOamData
_08099784: .4byte 0x0863A184
_08099788: .4byte 0x0863A190
_0809978C: .4byte 0x000001FF
_08099790: .4byte sSineTable
_08099794: .4byte 0xFFFFFE00
_08099798: .4byte 0x03001238
_0809979C: .4byte 0x000003FF
_080997A0: .4byte 0xFFFFFC00

	thumb_func_start NewFileIntroInit
NewFileIntroInit: @ 0x080997A4
	push {r4, lr}
	sub sp, #4
	ldr r3, _08099864 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _08099868 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0809986C @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08099870 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08099874 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08099878 @ =unk_99940
	bl CallbackSetVBlank
	ldr r1, _0809987C @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _08099880 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08099884 @ =0x04000054
	strh r1, [r0]
	ldr r0, _08099888 @ =gNextOamSlot
	strb r4, [r0]
	bl ResetFreeOam
	movs r2, #0
	str r2, [sp]
	ldr r1, _0809988C @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	ldr r0, _08099890 @ =gNonGameplayRam
	str r0, [r1, #4]
	ldr r0, _08099894 @ =0x85000150
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _08099898 @ =0x00007FFF
	str r0, [sp]
	mov r0, sp
	str r0, [r1]
	movs r3, #0xa0
	lsls r3, r3, #0x13
	str r3, [r1, #4]
	ldr r0, _0809989C @ =0x85000080
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	strh r2, [r3]
	str r2, [sp]
	mov r0, sp
	str r0, [r1]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _080998A0 @ =0x85004000
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _080998A4 @ =0x0400000E
	strh r2, [r0]
	subs r0, #2
	strh r2, [r0]
	subs r0, #2
	strh r2, [r0]
	subs r0, #2
	strh r2, [r0]
	adds r0, #8
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	subs r0, #0x1e
	strh r2, [r0]
	ldr r0, _080998A8 @ =NewFileIntroVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08099864: .4byte 0x04000208
_08099868: .4byte 0x04000004
_0809986C: .4byte 0x0000FFEF
_08099870: .4byte 0x04000200
_08099874: .4byte 0x0000FFFD
_08099878: .4byte unk_99940
_0809987C: .4byte 0x04000050
_08099880: .4byte gWrittenToBldy
_08099884: .4byte 0x04000054
_08099888: .4byte gNextOamSlot
_0809988C: .4byte 0x040000D4
_08099890: .4byte gNonGameplayRam
_08099894: .4byte 0x85000150
_08099898: .4byte 0x00007FFF
_0809989C: .4byte 0x85000080
_080998A0: .4byte 0x85004000
_080998A4: .4byte 0x0400000E
_080998A8: .4byte NewFileIntroVblank

	thumb_func_start SpecialCutsceneGetRandomNumber
SpecialCutsceneGetRandomNumber: @ 0x080998AC
	push {r4, lr}
	ldr r3, _080998E0 @ =0x03005404
	ldrh r1, [r3]
	lsls r0, r1, #2
	adds r1, r1, r0
	ldr r2, _080998E4 @ =gFrameCounter8Bit
	ldr r4, _080998E8 @ =0x00003573
	adds r0, r4, #0
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r1, r1, r0
	strh r1, [r3]
	ldr r2, _080998EC @ =sRandomNumberTable
	ldr r0, _080998F0 @ =gFrameCounter16Bit
	ldrh r1, [r0]
	movs r0, #0x1f
	ands r0, r1
	adds r0, r0, r2
	ldrb r0, [r0]
	ldrb r1, [r3, #1]
	adds r0, r0, r1
	strb r0, [r3, #1]
	ldrb r0, [r3, #1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080998E0: .4byte 0x03005404
_080998E4: .4byte gFrameCounter8Bit
_080998E8: .4byte 0x00003573
_080998EC: .4byte sRandomNumberTable
_080998F0: .4byte gFrameCounter16Bit

	thumb_func_start NewFileIntroVblank
NewFileIntroVblank: @ 0x080998F4
	ldr r1, _08099920 @ =0x040000D4
	ldr r0, _08099924 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _08099928 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0809992C @ =0x04000052
	ldr r0, _08099930 @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _08099934 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _08099938 @ =0x04000054
	ldr r0, _0809993C @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_08099920: .4byte 0x040000D4
_08099924: .4byte gOamData
_08099928: .4byte 0x84000100
_0809992C: .4byte 0x04000052
_08099930: .4byte gWrittenToBldalpha_L
_08099934: .4byte gWrittenToBldalpha_R
_08099938: .4byte 0x04000054
_0809993C: .4byte gWrittenToBldy

	thumb_func_start unk_99940
unk_99940: @ 0x08099940
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneSubroutine
CutsceneSubroutine: @ 0x0809994C
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _08099964 @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #1
	beq _0809997A
	cmp r0, #1
	bgt _08099968
	cmp r0, #0
	beq _08099972
	b _080999BA
	.align 2, 0
_08099964: .4byte gSubGameMode1
_08099968:
	cmp r0, #2
	beq _08099992
	cmp r0, #3
	beq _080999A0
	b _080999BA
_08099972:
	bl CutsceneInit
	movs r0, #2
	b _080999B8
_0809997A:
	ldr r1, _08099988 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0809998C
	subs r0, #1
	strh r0, [r1]
	b _080999BA
	.align 2, 0
_08099988: .4byte gWrittenToBldy
_0809998C:
	ldrh r0, [r4]
	adds r0, #1
	b _080999B8
_08099992:
	bl CutsceneProcess
	cmp r0, #0
	beq _080999BA
	ldrh r0, [r4]
	adds r0, #1
	b _080999B8
_080999A0:
	ldr r1, _080999B0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _080999B4
	adds r0, #1
	strh r0, [r1]
	b _080999BA
	.align 2, 0
_080999B0: .4byte gWrittenToBldy
_080999B4:
	movs r5, #1
	movs r0, #0
_080999B8:
	strh r0, [r4]
_080999BA:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CutsceneInit
CutsceneInit: @ 0x080999C4
	push {r4, r5, lr}
	sub sp, #4
	ldr r3, _08099A90 @ =0x04000208
	movs r5, #0
	strh r5, [r3]
	ldr r2, _08099A94 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08099A98 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08099A9C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08099AA0 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08099AA4 @ =unk_99af8
	bl CallbackSetVBlank
	ldr r1, _08099AA8 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	ldr r0, _08099AAC @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _08099AB0 @ =0x04000054
	strh r1, [r0]
	ldr r4, _08099AB4 @ =0x040000D4
	ldr r0, _08099AB8 @ =0x06010000
	str r0, [r4]
	ldr r0, _08099ABC @ =0x0201C000
	str r0, [r4, #4]
	ldr r0, _08099AC0 @ =0x84002000
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08099AC4 @ =gNextOamSlot
	strb r5, [r0]
	bl ResetFreeOam
	movs r1, #0
	str r1, [sp]
	mov r0, sp
	str r0, [r4]
	ldr r0, _08099AC8 @ =gNonGameplayRam
	str r0, [r4, #4]
	ldr r0, _08099ACC @ =0x85000150
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08099AD0 @ =0x00007FFF
	str r0, [sp]
	mov r0, sp
	str r0, [r4]
	movs r2, #0xa0
	lsls r2, r2, #0x13
	str r2, [r4, #4]
	ldr r0, _08099AD4 @ =0x85000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	strh r1, [r2]
	str r1, [sp]
	mov r0, sp
	str r0, [r4]
	movs r0, #0xc0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _08099AD8 @ =0x85004000
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08099ADC @ =0x0400000E
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	adds r0, #8
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	subs r0, #0x1e
	strh r1, [r0]
	ldr r0, _08099AE0 @ =CutsceneVblank
	bl CallbackSetVBlank
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08099A90: .4byte 0x04000208
_08099A94: .4byte 0x04000004
_08099A98: .4byte 0x0000FFEF
_08099A9C: .4byte 0x04000200
_08099AA0: .4byte 0x0000FFFD
_08099AA4: .4byte unk_99af8
_08099AA8: .4byte 0x04000050
_08099AAC: .4byte gWrittenToBldy
_08099AB0: .4byte 0x04000054
_08099AB4: .4byte 0x040000D4
_08099AB8: .4byte 0x06010000
_08099ABC: .4byte 0x0201C000
_08099AC0: .4byte 0x84002000
_08099AC4: .4byte gNextOamSlot
_08099AC8: .4byte gNonGameplayRam
_08099ACC: .4byte 0x85000150
_08099AD0: .4byte 0x00007FFF
_08099AD4: .4byte 0x85000080
_08099AD8: .4byte 0x85004000
_08099ADC: .4byte 0x0400000E
_08099AE0: .4byte CutsceneVblank

	thumb_func_start CutsceneVblank
CutsceneVblank: @ 0x08099AE4
	ldr r0, _08099AF0 @ =0x04000054
	ldr r1, _08099AF4 @ =gWrittenToBldy
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_08099AF0: .4byte 0x04000054
_08099AF4: .4byte gWrittenToBldy

	thumb_func_start unk_99af8
unk_99af8: @ 0x08099AF8
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneProcess
CutsceneProcess: @ 0x08099B04
	push {r4, lr}
	movs r4, #0
	ldr r0, _08099B1C @ =gCurrentCutscene
	ldrb r0, [r0]
	subs r0, #1
	cmp r0, #0xb
	bhi _08099BA0
	lsls r0, r0, #2
	ldr r1, _08099B20 @ =_08099B24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08099B1C: .4byte gCurrentCutscene
_08099B20: .4byte _08099B24
_08099B24: @ jump table
	.4byte _08099B54 @ case 0
	.4byte _08099B5C @ case 1
	.4byte _08099B64 @ case 2
	.4byte _08099B6C @ case 3
	.4byte _08099B74 @ case 4
	.4byte _08099B7C @ case 5
	.4byte _08099B84 @ case 6
	.4byte _08099B54 @ case 7
	.4byte _08099B8C @ case 8
	.4byte _08099B92 @ case 9
	.4byte _08099B92 @ case 10
	.4byte _08099B98 @ case 11
_08099B54:
	movs r0, #0
	bl CutsceneInternalMonologue
	b _08099B9C
_08099B5C:
	movs r0, #0
	bl CutsceneElevatorMonologue
	b _08099B9C
_08099B64:
	movs r0, #0
	bl CutsceneElevatorMonologue
	b _08099B9C
_08099B6C:
	movs r0, #0
	bl CutsceneElevatorMonologue
	b _08099B9C
_08099B74:
	movs r0, #1
	bl CutsceneElevatorMonologue
	b _08099B9C
_08099B7C:
	movs r0, #0
	bl CutsceneElevatorMonologue
	b _08099B9C
_08099B84:
	movs r0, #0
	bl CutsceneFederationMonologue
	b _08099B9C
_08099B8C:
	bl CutsceneSecretConversation
	b _08099B9C
_08099B92:
	bl CutsceneRestrictedLabDetaching
	b _08099B9C
_08099B98:
	bl CutsceneBslExploding
_08099B9C:
	cmp r0, #0
	beq _08099BA2
_08099BA0:
	movs r4, #1
_08099BA2:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CutsceneElevatorMonologue
CutsceneElevatorMonologue: @ 0x08099BAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r5, #0
	ldr r4, _08099BC8 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _08099BE2
	cmp r0, #1
	bgt _08099BCC
	cmp r0, #0
	beq _08099BD6
	b _08099C2A
	.align 2, 0
_08099BC8: .4byte gNonGameplayRam
_08099BCC:
	cmp r0, #2
	beq _08099BFC
	cmp r0, #3
	beq _08099C1C
	b _08099C2A
_08099BD6:
	movs r0, #1
	strh r0, [r4, #8]
	adds r0, r1, #0
	bl CutsceneElevatorMonologueInit
	b _08099C2A
_08099BE2:
	bl CutsceneMonologueFadeIn
	ldr r0, _08099BF8 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _08099C2A
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _08099C2A
	.align 2, 0
_08099BF8: .4byte gWrittenToBldy
_08099BFC:
	bl CutsceneElevatorMonologueProcess
	cmp r0, #0
	beq _08099C2A
	movs r0, #3
	strh r0, [r4, #8]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xa8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x50
	movs r0, #0xff
	strh r0, [r1]
	b _08099C2A
_08099C1C:
	bl CutsceneMonologueFadeOut
	ldr r0, _08099C34 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _08099C2A
	movs r5, #1
_08099C2A:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08099C34: .4byte gWrittenToBldy

	thumb_func_start CutsceneElevatorMonologueInit
CutsceneElevatorMonologueInit: @ 0x08099C38
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov r8, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r3, _08099D84 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _08099D88 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _08099D8C @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _08099D90 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _08099D94 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _08099D98 @ =unk_9a31c
	bl CallbackSetVBlank
	movs r1, #0x80
	lsls r1, r1, #0x13
	mov sb, r1
	strh r4, [r1]
	ldr r1, _08099D9C @ =0x0879C514
	ldr r6, _08099DA0 @ =gCurrentCutscene
	ldrb r0, [r6]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08099DA4 @ =0x06012000
	bl LZ77UncompVram
	ldr r0, _08099DA8 @ =0x0865FB5C
	ldr r1, _08099DAC @ =0x06017C00
	bl LZ77UncompVram
	ldr r4, _08099DB0 @ =0x040000D4
	ldr r0, _08099DB4 @ =0x086638A0
	str r0, [r4]
	ldr r0, _08099DB8 @ =0x050003E0
	str r0, [r4, #4]
	ldr r0, _08099DBC @ =0x84000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _08099DC0 @ =0x0879C4CC
	ldrb r0, [r6]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, _08099DC4 @ =0x05000200
	str r0, [r4, #4]
	ldr r0, _08099DC8 @ =0x84000030
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _08099DCC @ =0x0879C4F0
	ldrb r0, [r6]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r1, _08099DD0 @ =0x0879C538
	ldrb r0, [r6]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _08099DD4 @ =0x0600D000
	bl LZ77UncompVram
	ldr r0, _08099DD8 @ =0x08662804
	movs r5, #0x80
	lsls r5, r5, #0x12
	adds r1, r5, #0
	bl LZ77UncompWram
	ldr r0, _08099DDC @ =0x08663598
	ldr r1, _08099DE0 @ =0x0600D800
	bl LZ77UncompVram
	str r5, [r4]
	ldr r0, _08099DE4 @ =0x0600C800
	str r0, [r4, #4]
	ldr r0, _08099DE8 @ =0x84000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _08099DEC @ =0x086636A0
	str r0, [r4]
	movs r2, #0xa0
	lsls r2, r2, #0x13
	str r2, [r4, #4]
	ldr r0, _08099DF0 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _08099DF4 @ =0x0879C4A8
	ldrb r0, [r6]
	subs r0, #1
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r4]
	str r2, [r4, #4]
	ldr r0, _08099DF8 @ =0x84000058
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r1, _08099DFC @ =0x04000012
	movs r0, #4
	strh r0, [r1]
	subs r1, #0xa
	ldr r2, _08099E00 @ =0x00001908
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _08099E04 @ =0x00001B01
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	subs r2, #0xfe
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #5
	adds r0, r1, #0
	mov r2, sb
	strh r0, [r2]
	ldr r1, _08099E08 @ =gWrittenToBldy
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	movs r0, #1
	movs r1, #0xc
	movs r2, #0x10
	bl CutsceneElevatorMonologueSetupOam
	movs r0, #2
	movs r1, #0x78
	movs r2, #0x78
	bl CutsceneElevatorMonologueSetupOam
	movs r0, #3
	movs r1, #0x78
	movs r2, #0x78
	bl CutsceneElevatorMonologueSetupOam
	mov r0, r8
	cmp r0, #0
	bne _08099E0C
	movs r0, #4
	movs r1, #0x78
	movs r2, #0x68
	bl CutsceneElevatorMonologueSetupOam
	b _08099E16
	.align 2, 0
_08099D84: .4byte 0x04000208
_08099D88: .4byte 0x04000004
_08099D8C: .4byte 0x0000FFEF
_08099D90: .4byte 0x04000200
_08099D94: .4byte 0x0000FFFD
_08099D98: .4byte unk_9a31c
_08099D9C: .4byte 0x0879C514
_08099DA0: .4byte gCurrentCutscene
_08099DA4: .4byte 0x06012000
_08099DA8: .4byte 0x0865FB5C
_08099DAC: .4byte 0x06017C00
_08099DB0: .4byte 0x040000D4
_08099DB4: .4byte 0x086638A0
_08099DB8: .4byte 0x050003E0
_08099DBC: .4byte 0x84000008
_08099DC0: .4byte 0x0879C4CC
_08099DC4: .4byte 0x05000200
_08099DC8: .4byte 0x84000030
_08099DCC: .4byte 0x0879C4F0
_08099DD0: .4byte 0x0879C538
_08099DD4: .4byte 0x0600D000
_08099DD8: .4byte 0x08662804
_08099DDC: .4byte 0x08663598
_08099DE0: .4byte 0x0600D800
_08099DE4: .4byte 0x0600C800
_08099DE8: .4byte 0x84000200
_08099DEC: .4byte 0x086636A0
_08099DF0: .4byte 0x84000080
_08099DF4: .4byte 0x0879C4A8
_08099DF8: .4byte 0x84000058
_08099DFC: .4byte 0x04000012
_08099E00: .4byte 0x00001908
_08099E04: .4byte 0x00001B01
_08099E08: .4byte gWrittenToBldy
_08099E0C:
	movs r0, #5
	movs r1, #0x78
	movs r2, #0x68
	bl CutsceneElevatorMonologueSetupOam
_08099E16:
	ldr r2, _08099E50 @ =gNonGameplayRam
	ldr r0, _08099E54 @ =gCurrentCutscene
	ldrb r0, [r0]
	subs r0, #1
	strh r0, [r2, #0xa]
	ldr r1, _08099E58 @ =0x0879C5A4
	ldr r0, _08099E5C @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r2, #0xa]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2, #0xc]
	bl CutsceneMonologueDrawAllOam
	ldr r0, _08099E60 @ =CutsceneElevatorMonologueVblank
	bl CallbackSetVBlank
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08099E50: .4byte gNonGameplayRam
_08099E54: .4byte gCurrentCutscene
_08099E58: .4byte 0x0879C5A4
_08099E5C: .4byte 0x03000011
_08099E60: .4byte CutsceneElevatorMonologueVblank

	thumb_func_start CutsceneElevatorMonologueProcess
CutsceneElevatorMonologueProcess: @ 0x08099E64
	push {r4, lr}
	bl CutsceneMonologueProcessSpecialTextCharacters
	adds r4, r0, #0
	ldr r1, _08099E7C @ =gNonGameplayRam
	ldrb r0, [r1, #0x17]
	cmp r0, #0
	beq _08099E80
	cmp r0, #1
	beq _08099E86
	b _08099E8E
	.align 2, 0
_08099E7C: .4byte gNonGameplayRam
_08099E80:
	movs r0, #0x64
	strb r0, [r1, #0x17]
	b _08099E8E
_08099E86:
	movs r0, #0x64
	strb r0, [r1, #0x17]
	bl CutsceneMonologueProcessText
_08099E8E:
	bl CutsceneMonologueProcessOam
	bl CutsceneMonologueDrawAllOam
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CutsceneElevatorMonologueSetupOam
CutsceneElevatorMonologueSetupOam: @ 0x08099EA0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r6, #0
	ldr r1, _08099EEC @ =gNonGameplayRam
	movs r2, #0x86
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _08099EE2
	adds r3, r1, #0
	adds r1, r2, #0
_08099EC8:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #4
	bhi _08099EE6
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08099EC8
_08099EE2:
	cmp r6, #4
	bls _08099EF0
_08099EE6:
	movs r0, #5
	b _0809A06C
	.align 2, 0
_08099EEC: .4byte gNonGameplayRam
_08099EF0:
	adds r0, r6, #0
	bl CutsceneMonologueResetOam
	ldr r3, _08099F50 @ =gNonGameplayRam
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r5, r0, #3
	adds r2, r5, r3
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r2, r1
	strh r7, [r0]
	adds r1, #2
	adds r0, r2, r1
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r4, [r0]
	ldr r0, _08099F54 @ =0x00000219
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	cmp r4, #1
	bne _08099F68
	ldr r0, _08099F58 @ =0x00000221
	adds r1, r2, r0
	movs r0, #0xf
	strb r0, [r1]
	ldr r0, _08099F5C @ =0x00000222
	adds r1, r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	strh r0, [r1]
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r3, r1
	adds r0, r5, r0
	ldr r1, _08099F60 @ =0x08663E5C
	str r1, [r0]
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	adds r0, r5, r0
	ldr r1, _08099F64 @ =CutsceneMonologueProcessCursor
	b _0809A068
	.align 2, 0
_08099F50: .4byte gNonGameplayRam
_08099F54: .4byte 0x00000219
_08099F58: .4byte 0x00000221
_08099F5C: .4byte 0x00000222
_08099F60: .4byte 0x08663E5C
_08099F64: .4byte CutsceneMonologueProcessCursor
_08099F68:
	cmp r4, #2
	bne _08099FA8
	ldr r0, _08099F98 @ =0x0000021F
	adds r1, r2, r0
	movs r0, #3
	strb r0, [r1]
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r3, r0
	adds r1, r5, r1
	ldr r2, _08099F9C @ =0x0879C55C
	ldr r0, _08099FA0 @ =gCurrentCutscene
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	adds r0, r5, r0
	ldr r1, _08099FA4 @ =unk_9d09c
	b _0809A068
	.align 2, 0
_08099F98: .4byte 0x0000021F
_08099F9C: .4byte 0x0879C55C
_08099FA0: .4byte gCurrentCutscene
_08099FA4: .4byte unk_9d09c
_08099FA8:
	cmp r4, #3
	bne _08099FF4
	ldr r0, _08099FE0 @ =0x0000021E
	adds r1, r2, r0
	movs r0, #2
	strb r0, [r1]
	ldr r1, _08099FE4 @ =0x0000021F
	adds r0, r2, r1
	strb r4, [r0]
	movs r0, #0x89
	lsls r0, r0, #2
	adds r1, r3, r0
	adds r1, r5, r1
	ldr r2, _08099FE8 @ =0x0879C55C
	ldr r0, _08099FEC @ =gCurrentCutscene
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1]
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	adds r0, r5, r0
	ldr r1, _08099FF0 @ =unk_9d09c
	b _0809A068
	.align 2, 0
_08099FE0: .4byte 0x0000021E
_08099FE4: .4byte 0x0000021F
_08099FE8: .4byte 0x0879C55C
_08099FEC: .4byte gCurrentCutscene
_08099FF0: .4byte unk_9d09c
_08099FF4:
	cmp r4, #4
	bne _0809A038
	ldr r0, _0809A028 @ =0x0000021F
	adds r1, r2, r0
	movs r0, #3
	strb r0, [r1]
	movs r1, #0x89
	lsls r1, r1, #2
	adds r2, r3, r1
	adds r2, r5, r2
	ldr r1, _0809A02C @ =0x0879C55C
	ldr r0, _0809A030 @ =gCurrentCutscene
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	adds r0, r5, r0
	ldr r1, _0809A034 @ =CutsceneProcessElevatorScrolling
	b _0809A068
	.align 2, 0
_0809A028: .4byte 0x0000021F
_0809A02C: .4byte 0x0879C55C
_0809A030: .4byte gCurrentCutscene
_0809A034: .4byte CutsceneProcessElevatorScrolling
_0809A038:
	cmp r4, #5
	bne _0809A06A
	ldr r0, _0809A078 @ =0x0000021F
	adds r1, r2, r0
	movs r0, #3
	strb r0, [r1]
	movs r1, #0x89
	lsls r1, r1, #2
	adds r2, r3, r1
	adds r2, r5, r2
	ldr r1, _0809A07C @ =0x0879C55C
	ldr r0, _0809A080 @ =gCurrentCutscene
	ldrb r0, [r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, #4
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2]
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r3, r1
	adds r0, r5, r0
	ldr r1, _0809A084 @ =unk_9a1a8
_0809A068:
	str r1, [r0]
_0809A06A:
	adds r0, r6, #0
_0809A06C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809A078: .4byte 0x0000021F
_0809A07C: .4byte 0x0879C55C
_0809A080: .4byte gCurrentCutscene
_0809A084: .4byte unk_9a1a8

	thumb_func_start CutsceneProcessElevatorScrolling
CutsceneProcessElevatorScrolling: @ 0x0809A088
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #2]
	adds r0, #2
	movs r5, #0
	strh r0, [r4, #2]
	ldr r3, _0809A0F8 @ =0x0400001A
	ldr r2, _0809A0FC @ =gNonGameplayRam
	ldrh r0, [r2, #0x12]
	subs r0, #1
	strh r0, [r2, #0x12]
	ldr r6, _0809A100 @ =0x0000FFFF
	adds r1, r6, #0
	ands r0, r1
	strh r0, [r3]
	ldrb r3, [r4, #9]
	adds r6, r2, #0
	cmp r3, #0
	bne _0809A124
	ldr r0, _0809A104 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809A19A
	ldr r0, _0809A108 @ =gWrittenToBldalpha_R
	strh r3, [r0]
	ldr r0, _0809A10C @ =gWrittenToBldalpha_L
	movs r2, #0x10
	strh r2, [r0]
	ldr r0, _0809A110 @ =0x04000048
	strh r3, [r0]
	ldr r1, _0809A114 @ =0x0400004A
	ldr r5, _0809A118 @ =0x0000331D
	adds r0, r5, #0
	strh r0, [r1]
	ldr r0, _0809A11C @ =0x04000016
	strh r3, [r6, #0x14]
	strh r3, [r0]
	adds r0, #0x3c
	lsls r2, r2, #8
	strh r2, [r0]
	adds r1, #6
	ldr r6, _0809A120 @ =0x00001042
	adds r0, r6, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x82
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strb r0, [r4, #9]
	b _0809A19A
	.align 2, 0
_0809A0F8: .4byte 0x0400001A
_0809A0FC: .4byte gNonGameplayRam
_0809A100: .4byte 0x0000FFFF
_0809A104: .4byte gWrittenToBldy
_0809A108: .4byte gWrittenToBldalpha_R
_0809A10C: .4byte gWrittenToBldalpha_L
_0809A110: .4byte 0x04000048
_0809A114: .4byte 0x0400004A
_0809A118: .4byte 0x0000331D
_0809A11C: .4byte 0x04000016
_0809A120: .4byte 0x00001042
_0809A124:
	cmp r3, #1
	bne _0809A164
	ldr r2, _0809A138 @ =gWrittenToBldalpha_R
	ldrh r1, [r2]
	cmp r1, #0xa
	bne _0809A13C
	movs r0, #2
	strb r0, [r4, #9]
	strb r5, [r4, #8]
	b _0809A14E
	.align 2, 0
_0809A138: .4byte gWrittenToBldalpha_R
_0809A13C:
	ldrb r0, [r4, #8]
	cmp r0, #3
	bls _0809A14A
	strb r5, [r4, #8]
	adds r0, r1, #1
	strh r0, [r2]
	b _0809A14E
_0809A14A:
	adds r0, #1
	strb r0, [r4, #8]
_0809A14E:
	ldr r0, _0809A15C @ =0x04000016
	ldrh r1, [r6, #0x14]
	subs r1, #3
	strh r1, [r6, #0x14]
	ldr r5, _0809A160 @ =0x0000FFFF
	adds r2, r5, #0
	b _0809A196
	.align 2, 0
_0809A15C: .4byte 0x04000016
_0809A160: .4byte 0x0000FFFF
_0809A164:
	ldr r2, _0809A174 @ =gWrittenToBldalpha_R
	ldrh r1, [r2]
	cmp r1, #4
	bne _0809A178
	movs r0, #1
	strb r0, [r4, #9]
	strb r5, [r4, #8]
	b _0809A18A
	.align 2, 0
_0809A174: .4byte gWrittenToBldalpha_R
_0809A178:
	ldrb r0, [r4, #8]
	cmp r0, #3
	bls _0809A186
	strb r5, [r4, #8]
	subs r0, r1, #1
	strh r0, [r2]
	b _0809A18A
_0809A186:
	adds r0, #1
	strb r0, [r4, #8]
_0809A18A:
	ldr r0, _0809A1A0 @ =0x04000016
	ldrh r1, [r6, #0x14]
	subs r1, #3
	strh r1, [r6, #0x14]
	ldr r6, _0809A1A4 @ =0x0000FFFF
	adds r2, r6, #0
_0809A196:
	ands r1, r2
	strh r1, [r0]
_0809A19A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A1A0: .4byte 0x04000016
_0809A1A4: .4byte 0x0000FFFF

	thumb_func_start unk_9a1a8
unk_9a1a8: @ 0x0809A1A8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #2]
	subs r0, #2
	movs r5, #0
	strh r0, [r4, #2]
	ldr r3, _0809A218 @ =0x0400001A
	ldr r2, _0809A21C @ =gNonGameplayRam
	ldrh r0, [r2, #0x12]
	adds r0, #1
	strh r0, [r2, #0x12]
	ldr r6, _0809A220 @ =0x0000FFFF
	adds r1, r6, #0
	ands r0, r1
	strh r0, [r3]
	ldrb r3, [r4, #9]
	adds r6, r2, #0
	cmp r3, #0
	bne _0809A244
	ldr r0, _0809A224 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809A2BA
	ldr r0, _0809A228 @ =gWrittenToBldalpha_R
	strh r3, [r0]
	ldr r0, _0809A22C @ =gWrittenToBldalpha_L
	movs r2, #0x10
	strh r2, [r0]
	ldr r0, _0809A230 @ =0x04000048
	strh r3, [r0]
	ldr r1, _0809A234 @ =0x0400004A
	ldr r5, _0809A238 @ =0x0000331D
	adds r0, r5, #0
	strh r0, [r1]
	ldr r0, _0809A23C @ =0x04000016
	strh r3, [r6, #0x14]
	strh r3, [r0]
	adds r0, #0x3c
	lsls r2, r2, #8
	strh r2, [r0]
	adds r1, #6
	ldr r6, _0809A240 @ =0x00001042
	adds r0, r6, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x82
	lsls r3, r3, #8
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strb r0, [r4, #9]
	b _0809A2BA
	.align 2, 0
_0809A218: .4byte 0x0400001A
_0809A21C: .4byte gNonGameplayRam
_0809A220: .4byte 0x0000FFFF
_0809A224: .4byte gWrittenToBldy
_0809A228: .4byte gWrittenToBldalpha_R
_0809A22C: .4byte gWrittenToBldalpha_L
_0809A230: .4byte 0x04000048
_0809A234: .4byte 0x0400004A
_0809A238: .4byte 0x0000331D
_0809A23C: .4byte 0x04000016
_0809A240: .4byte 0x00001042
_0809A244:
	cmp r3, #1
	bne _0809A284
	ldr r2, _0809A258 @ =gWrittenToBldalpha_R
	ldrh r1, [r2]
	cmp r1, #0xa
	bne _0809A25C
	movs r0, #2
	strb r0, [r4, #9]
	strb r5, [r4, #8]
	b _0809A26E
	.align 2, 0
_0809A258: .4byte gWrittenToBldalpha_R
_0809A25C:
	ldrb r0, [r4, #8]
	cmp r0, #3
	bls _0809A26A
	strb r5, [r4, #8]
	adds r0, r1, #1
	strh r0, [r2]
	b _0809A26E
_0809A26A:
	adds r0, #1
	strb r0, [r4, #8]
_0809A26E:
	ldr r0, _0809A27C @ =0x04000016
	ldrh r1, [r6, #0x14]
	adds r1, #3
	strh r1, [r6, #0x14]
	ldr r5, _0809A280 @ =0x0000FFFF
	adds r2, r5, #0
	b _0809A2B6
	.align 2, 0
_0809A27C: .4byte 0x04000016
_0809A280: .4byte 0x0000FFFF
_0809A284:
	ldr r2, _0809A294 @ =gWrittenToBldalpha_R
	ldrh r1, [r2]
	cmp r1, #4
	bne _0809A298
	movs r0, #1
	strb r0, [r4, #9]
	strb r5, [r4, #8]
	b _0809A2AA
	.align 2, 0
_0809A294: .4byte gWrittenToBldalpha_R
_0809A298:
	ldrb r0, [r4, #8]
	cmp r0, #3
	bls _0809A2A6
	strb r5, [r4, #8]
	subs r0, r1, #1
	strh r0, [r2]
	b _0809A2AA
_0809A2A6:
	adds r0, #1
	strb r0, [r4, #8]
_0809A2AA:
	ldr r0, _0809A2C0 @ =0x04000016
	ldrh r1, [r6, #0x14]
	adds r1, #3
	strh r1, [r6, #0x14]
	ldr r6, _0809A2C4 @ =0x0000FFFF
	adds r2, r6, #0
_0809A2B6:
	ands r1, r2
	strh r1, [r0]
_0809A2BA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A2C0: .4byte 0x04000016
_0809A2C4: .4byte 0x0000FFFF

	thumb_func_start CutsceneElevatorMonologueVblank
CutsceneElevatorMonologueVblank: @ 0x0809A2C8
	push {lr}
	ldr r1, _0809A2FC @ =0x040000D4
	ldr r0, _0809A300 @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0809A304 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl unk_9cc4c
	ldr r2, _0809A308 @ =0x04000052
	ldr r0, _0809A30C @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0809A310 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0809A314 @ =0x04000054
	ldr r0, _0809A318 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809A2FC: .4byte 0x040000D4
_0809A300: .4byte gOamData
_0809A304: .4byte 0x84000100
_0809A308: .4byte 0x04000052
_0809A30C: .4byte gWrittenToBldalpha_L
_0809A310: .4byte gWrittenToBldalpha_R
_0809A314: .4byte 0x04000054
_0809A318: .4byte gWrittenToBldy

	thumb_func_start unk_9a31c
unk_9a31c: @ 0x0809A31C
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneInternalMonologue
CutsceneInternalMonologue: @ 0x0809A328
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r5, #0
	ldr r4, _0809A344 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _0809A35E
	cmp r0, #1
	bgt _0809A348
	cmp r0, #0
	beq _0809A352
	b _0809A39E
	.align 2, 0
_0809A344: .4byte gNonGameplayRam
_0809A348:
	cmp r0, #2
	beq _0809A378
	cmp r0, #3
	beq _0809A390
	b _0809A39E
_0809A352:
	movs r0, #1
	strh r0, [r4, #8]
	adds r0, r1, #0
	bl CutsceneInternalMonologueInit
	b _0809A39E
_0809A35E:
	bl CutsceneMonologueFadeIn
	ldr r0, _0809A374 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809A39E
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0809A39E
	.align 2, 0
_0809A374: .4byte gWrittenToBldy
_0809A378:
	bl CutsceneInternalMonologueProcess
	cmp r0, #0
	beq _0809A39E
	movs r0, #3
	strh r0, [r4, #8]
	ldr r1, _0809A38C @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	b _0809A39E
	.align 2, 0
_0809A38C: .4byte 0x04000050
_0809A390:
	bl CutsceneMonologueFadeOut
	ldr r0, _0809A3A8 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _0809A39E
	movs r5, #1
_0809A39E:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809A3A8: .4byte gWrittenToBldy

	thumb_func_start CutsceneInternalMonologueInit
CutsceneInternalMonologueInit: @ 0x0809A3AC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r3, _0809A484 @ =0x04000208
	movs r6, #0
	strh r6, [r3]
	ldr r2, _0809A488 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0809A48C @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0809A490 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809A494 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809A498 @ =unk_9a63c
	bl CallbackSetVBlank
	movs r0, #0x80
	lsls r0, r0, #0x13
	mov r8, r0
	strh r6, [r0]
	ldr r0, _0809A49C @ =0x0865FB5C
	ldr r1, _0809A4A0 @ =0x06017C00
	bl LZ77UncompVram
	ldr r4, _0809A4A4 @ =0x040000D4
	ldr r0, _0809A4A8 @ =0x086638A0
	str r0, [r4]
	ldr r0, _0809A4AC @ =0x050003E0
	str r0, [r4, #4]
	ldr r0, _0809A4B0 @ =0x84000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809A4B4 @ =0x08662804
	movs r5, #0x80
	lsls r5, r5, #0x12
	adds r1, r5, #0
	bl LZ77UncompWram
	str r5, [r4]
	ldr r0, _0809A4B8 @ =0x0600C800
	str r0, [r4, #4]
	ldr r0, _0809A4BC @ =0x84000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809A4C0 @ =0x086636A0
	str r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r4, #4]
	ldr r0, _0809A4C4 @ =0x84000080
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	strh r6, [r1]
	ldr r1, _0809A4C8 @ =0x04000012
	movs r0, #4
	strh r0, [r1]
	subs r1, #0xa
	ldr r2, _0809A4CC @ =0x00001908
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0x88
	lsls r1, r1, #5
	adds r0, r1, #0
	mov r2, r8
	strh r0, [r2]
	ldr r1, _0809A4D0 @ =gWrittenToBldy
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	movs r0, #1
	movs r1, #0xc
	movs r2, #0x10
	bl CutsceneInternalMonologueSetupOam
	ldr r2, _0809A4D4 @ =gNonGameplayRam
	ldr r0, _0809A4D8 @ =gCurrentCutscene
	ldrb r0, [r0]
	subs r0, #1
	strh r0, [r2, #0xa]
	ldr r1, _0809A4DC @ =0x0879C5A4
	ldr r0, _0809A4E0 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r2, #0xa]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2, #0xc]
	bl CutsceneMonologueDrawAllOam
	ldr r0, _0809A4E4 @ =CutsceneInternalMonologueVblank
	bl CallbackSetVBlank
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A484: .4byte 0x04000208
_0809A488: .4byte 0x04000004
_0809A48C: .4byte 0x0000FFEF
_0809A490: .4byte 0x04000200
_0809A494: .4byte 0x0000FFFD
_0809A498: .4byte unk_9a63c
_0809A49C: .4byte 0x0865FB5C
_0809A4A0: .4byte 0x06017C00
_0809A4A4: .4byte 0x040000D4
_0809A4A8: .4byte 0x086638A0
_0809A4AC: .4byte 0x050003E0
_0809A4B0: .4byte 0x84000008
_0809A4B4: .4byte 0x08662804
_0809A4B8: .4byte 0x0600C800
_0809A4BC: .4byte 0x84000200
_0809A4C0: .4byte 0x086636A0
_0809A4C4: .4byte 0x84000080
_0809A4C8: .4byte 0x04000012
_0809A4CC: .4byte 0x00001908
_0809A4D0: .4byte gWrittenToBldy
_0809A4D4: .4byte gNonGameplayRam
_0809A4D8: .4byte gCurrentCutscene
_0809A4DC: .4byte 0x0879C5A4
_0809A4E0: .4byte 0x03000011
_0809A4E4: .4byte CutsceneInternalMonologueVblank

	thumb_func_start CutsceneInternalMonologueProcess
CutsceneInternalMonologueProcess: @ 0x0809A4E8
	push {r4, lr}
	bl CutsceneMonologueProcessSpecialTextCharacters
	adds r4, r0, #0
	ldr r1, _0809A500 @ =gNonGameplayRam
	ldrb r0, [r1, #0x17]
	cmp r0, #0
	beq _0809A504
	cmp r0, #1
	beq _0809A50A
	b _0809A512
	.align 2, 0
_0809A500: .4byte gNonGameplayRam
_0809A504:
	movs r0, #0x64
	strb r0, [r1, #0x17]
	b _0809A512
_0809A50A:
	movs r0, #0x64
	strb r0, [r1, #0x17]
	bl CutsceneMonologueProcessText
_0809A512:
	bl CutsceneMonologueProcessOam
	bl CutsceneMonologueDrawAllOam
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CutsceneInternalMonologueSetupOam
CutsceneInternalMonologueSetupOam: @ 0x0809A524
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r4, #0
	ldr r1, _0809A570 @ =gNonGameplayRam
	movs r2, #0x86
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A566
	adds r3, r1, #0
	adds r1, r2, #0
_0809A54C:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0809A56A
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A54C
_0809A566:
	cmp r4, #4
	bls _0809A574
_0809A56A:
	movs r0, #5
	b _0809A5DC
	.align 2, 0
_0809A570: .4byte gNonGameplayRam
_0809A574:
	adds r0, r4, #0
	bl CutsceneMonologueResetOam
	ldr r5, _0809A5E8 @ =gNonGameplayRam
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r3, r0, #3
	adds r2, r3, r5
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r2, r1
	strh r7, [r0]
	adds r1, #2
	adds r0, r2, r1
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r6, [r0]
	ldr r0, _0809A5EC @ =0x00000219
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	cmp r6, #1
	bne _0809A5DA
	ldr r0, _0809A5F0 @ =0x0000021F
	adds r1, r2, r0
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0809A5F4 @ =0x00000221
	adds r1, r2, r0
	movs r0, #0xf
	strb r0, [r1]
	ldr r0, _0809A5F8 @ =0x00000222
	adds r1, r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	strh r0, [r1]
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r0, r3, r0
	ldr r1, _0809A5FC @ =0x08663E5C
	str r1, [r0]
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r0, r3, r0
	ldr r1, _0809A600 @ =CutsceneMonologueProcessCursor
	str r1, [r0]
_0809A5DA:
	adds r0, r4, #0
_0809A5DC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809A5E8: .4byte gNonGameplayRam
_0809A5EC: .4byte 0x00000219
_0809A5F0: .4byte 0x0000021F
_0809A5F4: .4byte 0x00000221
_0809A5F8: .4byte 0x00000222
_0809A5FC: .4byte 0x08663E5C
_0809A600: .4byte CutsceneMonologueProcessCursor

	thumb_func_start CutsceneInternalMonologueVblank
CutsceneInternalMonologueVblank: @ 0x0809A604
	push {lr}
	ldr r1, _0809A628 @ =0x040000D4
	ldr r0, _0809A62C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0809A630 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl unk_9cc4c
	ldr r1, _0809A634 @ =0x04000054
	ldr r0, _0809A638 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809A628: .4byte 0x040000D4
_0809A62C: .4byte gOamData
_0809A630: .4byte 0x84000100
_0809A634: .4byte 0x04000054
_0809A638: .4byte gWrittenToBldy

	thumb_func_start unk_9a63c
unk_9a63c: @ 0x0809A63C
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneFederationMonologue
CutsceneFederationMonologue: @ 0x0809A648
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r5, #0
	ldr r4, _0809A664 @ =gNonGameplayRam
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _0809A67E
	cmp r0, #1
	bgt _0809A668
	cmp r0, #0
	beq _0809A672
	b _0809A6BE
	.align 2, 0
_0809A664: .4byte gNonGameplayRam
_0809A668:
	cmp r0, #2
	beq _0809A698
	cmp r0, #3
	beq _0809A6B0
	b _0809A6BE
_0809A672:
	movs r0, #1
	strh r0, [r4, #8]
	adds r0, r1, #0
	bl CutsceneFederationMonologueInit
	b _0809A6BE
_0809A67E:
	bl CutsceneMonologueFadeIn
	ldr r0, _0809A694 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0
	bne _0809A6BE
	ldrh r0, [r4, #8]
	adds r0, #1
	strh r0, [r4, #8]
	b _0809A6BE
	.align 2, 0
_0809A694: .4byte gWrittenToBldy
_0809A698:
	bl CutsceneFederationMonologueProcess
	cmp r0, #0
	beq _0809A6BE
	movs r0, #3
	strh r0, [r4, #8]
	ldr r1, _0809A6AC @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	b _0809A6BE
	.align 2, 0
_0809A6AC: .4byte 0x04000050
_0809A6B0:
	bl CutsceneMonologueFadeOut
	ldr r0, _0809A6C8 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _0809A6BE
	movs r5, #1
_0809A6BE:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809A6C8: .4byte gWrittenToBldy

	thumb_func_start CutsceneFederationMonologueInit
CutsceneFederationMonologueInit: @ 0x0809A6CC
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r3, _0809A7CC @ =0x04000208
	movs r6, #0
	strh r6, [r3]
	ldr r2, _0809A7D0 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0809A7D4 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0809A7D8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809A7DC @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809A7E0 @ =unk_9a99c
	bl CallbackSetVBlank
	movs r0, #0x80
	lsls r0, r0, #0x13
	mov r8, r0
	strh r6, [r0]
	ldr r0, _0809A7E4 @ =0x0865FB5C
	ldr r1, _0809A7E8 @ =0x06017C00
	bl LZ77UncompVram
	ldr r4, _0809A7EC @ =0x040000D4
	ldr r0, _0809A7F0 @ =0x086638A0
	str r0, [r4]
	ldr r0, _0809A7F4 @ =0x050003E0
	str r0, [r4, #4]
	ldr r0, _0809A7F8 @ =0x84000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809A7FC @ =0x086724C0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0809A800 @ =0x08674AD8
	ldr r1, _0809A804 @ =0x0600D000
	bl LZ77UncompVram
	ldr r0, _0809A808 @ =0x08662804
	movs r5, #0x80
	lsls r5, r5, #0x12
	adds r1, r5, #0
	bl LZ77UncompWram
	str r5, [r4]
	ldr r0, _0809A80C @ =0x0600C800
	str r0, [r4, #4]
	ldr r0, _0809A810 @ =0x84000200
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809A814 @ =0x08674958
	str r0, [r4]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	str r1, [r4, #4]
	ldr r0, _0809A818 @ =0x84000060
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809A81C @ =0x08663820
	str r0, [r4]
	ldr r0, _0809A820 @ =0x05000180
	str r0, [r4, #4]
	ldr r0, _0809A824 @ =0x84000020
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	strh r6, [r1]
	ldr r1, _0809A828 @ =0x04000012
	movs r0, #4
	strh r0, [r1]
	subs r1, #0xa
	ldr r2, _0809A82C @ =0x00001908
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	adds r2, #0xfb
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0xa8
	lsls r1, r1, #5
	adds r0, r1, #0
	mov r2, r8
	strh r0, [r2]
	ldr r1, _0809A830 @ =gWrittenToBldy
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	movs r0, #1
	movs r1, #0xc
	movs r2, #0x10
	bl CutsceneFederationMonologueSetupOam
	ldr r2, _0809A834 @ =gNonGameplayRam
	ldr r0, _0809A838 @ =gCurrentCutscene
	ldrb r0, [r0]
	subs r0, #1
	strh r0, [r2, #0xa]
	ldr r1, _0809A83C @ =0x0879C5A4
	ldr r0, _0809A840 @ =0x03000011
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r1, [r2, #0xa]
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2, #0xc]
	bl CutsceneMonologueDrawAllOam
	ldr r0, _0809A844 @ =CutsceneFederationMonologueVblank
	bl CallbackSetVBlank
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809A7CC: .4byte 0x04000208
_0809A7D0: .4byte 0x04000004
_0809A7D4: .4byte 0x0000FFEF
_0809A7D8: .4byte 0x04000200
_0809A7DC: .4byte 0x0000FFFD
_0809A7E0: .4byte unk_9a99c
_0809A7E4: .4byte 0x0865FB5C
_0809A7E8: .4byte 0x06017C00
_0809A7EC: .4byte 0x040000D4
_0809A7F0: .4byte 0x086638A0
_0809A7F4: .4byte 0x050003E0
_0809A7F8: .4byte 0x84000008
_0809A7FC: .4byte 0x086724C0
_0809A800: .4byte 0x08674AD8
_0809A804: .4byte 0x0600D000
_0809A808: .4byte 0x08662804
_0809A80C: .4byte 0x0600C800
_0809A810: .4byte 0x84000200
_0809A814: .4byte 0x08674958
_0809A818: .4byte 0x84000060
_0809A81C: .4byte 0x08663820
_0809A820: .4byte 0x05000180
_0809A824: .4byte 0x84000020
_0809A828: .4byte 0x04000012
_0809A82C: .4byte 0x00001908
_0809A830: .4byte gWrittenToBldy
_0809A834: .4byte gNonGameplayRam
_0809A838: .4byte gCurrentCutscene
_0809A83C: .4byte 0x0879C5A4
_0809A840: .4byte 0x03000011
_0809A844: .4byte CutsceneFederationMonologueVblank

	thumb_func_start CutsceneFederationMonologueProcess
CutsceneFederationMonologueProcess: @ 0x0809A848
	push {r4, lr}
	bl CutsceneMonologueProcessSpecialTextCharacters
	adds r4, r0, #0
	ldr r1, _0809A860 @ =gNonGameplayRam
	ldrb r0, [r1, #0x17]
	cmp r0, #0
	beq _0809A864
	cmp r0, #1
	beq _0809A86A
	b _0809A872
	.align 2, 0
_0809A860: .4byte gNonGameplayRam
_0809A864:
	movs r0, #0x64
	strb r0, [r1, #0x17]
	b _0809A872
_0809A86A:
	movs r0, #0x64
	strb r0, [r1, #0x17]
	bl CutsceneMonologueProcessText
_0809A872:
	bl CutsceneMonologueProcessOam
	bl CutsceneMonologueDrawAllOam
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CutsceneFederationMonologueSetupOam
CutsceneFederationMonologueSetupOam: @ 0x0809A884
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r4, #0
	ldr r1, _0809A8D0 @ =gNonGameplayRam
	movs r2, #0x86
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809A8C6
	adds r3, r1, #0
	adds r1, r2, #0
_0809A8AC:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bhi _0809A8CA
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809A8AC
_0809A8C6:
	cmp r4, #4
	bls _0809A8D4
_0809A8CA:
	movs r0, #5
	b _0809A93C
	.align 2, 0
_0809A8D0: .4byte gNonGameplayRam
_0809A8D4:
	adds r0, r4, #0
	bl CutsceneMonologueResetOam
	ldr r5, _0809A948 @ =gNonGameplayRam
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r3, r0, #3
	adds r2, r3, r5
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r2, r1
	strh r7, [r0]
	adds r1, #2
	adds r0, r2, r1
	mov r1, r8
	strh r1, [r0]
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r2, r1
	strb r6, [r0]
	ldr r0, _0809A94C @ =0x00000219
	adds r1, r2, r0
	movs r0, #1
	strb r0, [r1]
	cmp r6, #1
	bne _0809A93A
	ldr r0, _0809A950 @ =0x0000021F
	adds r1, r2, r0
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0809A954 @ =0x00000221
	adds r1, r2, r0
	movs r0, #0xf
	strb r0, [r1]
	ldr r0, _0809A958 @ =0x00000222
	adds r1, r2, r0
	movs r0, #0xf8
	lsls r0, r0, #2
	strh r0, [r1]
	movs r1, #0x89
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r0, r3, r0
	ldr r1, _0809A95C @ =0x08663E5C
	str r1, [r0]
	movs r1, #0x8a
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r0, r3, r0
	ldr r1, _0809A960 @ =CutsceneMonologueProcessCursor
	str r1, [r0]
_0809A93A:
	adds r0, r4, #0
_0809A93C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809A948: .4byte gNonGameplayRam
_0809A94C: .4byte 0x00000219
_0809A950: .4byte 0x0000021F
_0809A954: .4byte 0x00000221
_0809A958: .4byte 0x00000222
_0809A95C: .4byte 0x08663E5C
_0809A960: .4byte CutsceneMonologueProcessCursor

	thumb_func_start CutsceneFederationMonologueVblank
CutsceneFederationMonologueVblank: @ 0x0809A964
	push {lr}
	ldr r1, _0809A988 @ =0x040000D4
	ldr r0, _0809A98C @ =gOamData
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0809A990 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	bl unk_9cc4c
	ldr r1, _0809A994 @ =0x04000054
	ldr r0, _0809A998 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809A988: .4byte 0x040000D4
_0809A98C: .4byte gOamData
_0809A990: .4byte 0x84000100
_0809A994: .4byte 0x04000054
_0809A998: .4byte gWrittenToBldy

	thumb_func_start unk_9a99c
unk_9a99c: @ 0x0809A99C
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneSecretConversation
CutsceneSecretConversation: @ 0x0809A9A8
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _0809A9C0 @ =gNonGameplayRam
	ldrh r0, [r4]
	cmp r0, #1
	beq _0809A9D8
	cmp r0, #1
	bgt _0809A9C4
	cmp r0, #0
	beq _0809A9CE
	b _0809AA20
	.align 2, 0
_0809A9C0: .4byte gNonGameplayRam
_0809A9C4:
	cmp r0, #2
	beq _0809A9F2
	cmp r0, #3
	beq _0809AA12
	b _0809AA20
_0809A9CE:
	movs r0, #1
	strh r0, [r4]
	bl CutsceneSecretConversationInit
	b _0809AA20
_0809A9D8:
	ldr r1, _0809A9E8 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0809A9EC
	subs r0, #1
	strh r0, [r1]
	b _0809AA20
	.align 2, 0
_0809A9E8: .4byte gWrittenToBldy
_0809A9EC:
	movs r0, #2
	strh r0, [r4]
	b _0809AA20
_0809A9F2:
	bl CutsceneSecretConversationProcess
	cmp r0, #0
	beq _0809AA20
	movs r0, #3
	strh r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xb0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x50
	movs r0, #0xff
	strh r0, [r1]
	b _0809AA20
_0809AA12:
	bl CutsceneFadeOut
	ldr r0, _0809AA28 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _0809AA20
	movs r5, #1
_0809AA20:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809AA28: .4byte gWrittenToBldy

	thumb_func_start CutsceneSecretConversationInit
CutsceneSecretConversationInit: @ 0x0809AA2C
	push {r4, r5, lr}
	ldr r3, _0809AAF4 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _0809AAF8 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0809AAFC @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0809AB00 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809AB04 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809AB08 @ =unk_9ae0c
	bl CallbackSetVBlank
	movs r5, #0x80
	lsls r5, r5, #0x13
	strh r4, [r5]
	ldr r0, _0809AB0C @ =0x0867815C
	ldr r1, _0809AB10 @ =0x06014000
	bl LZ77UncompVram
	ldr r4, _0809AB14 @ =0x040000D4
	ldr r0, _0809AB18 @ =0x086788A8
	str r0, [r4]
	ldr r0, _0809AB1C @ =0x05000300
	str r0, [r4, #4]
	ldr r0, _0809AB20 @ =0x84000010
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809AB24 @ =0x08675098
	ldr r1, _0809AB28 @ =0x06000800
	bl LZ77UncompVram
	ldr r0, _0809AB2C @ =0x08677914
	ldr r1, _0809AB30 @ =0x0600C000
	bl LZ77UncompVram
	ldr r0, _0809AB34 @ =0x08677C90
	ldr r1, _0809AB38 @ =0x0600C800
	bl LZ77UncompVram
	ldr r0, _0809AB3C @ =0x08677874
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	ldr r0, _0809AB40 @ =0x84000028
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809AB44 @ =0x08677C10
	str r0, [r4]
	ldr r0, _0809AB48 @ =0x050001E0
	str r0, [r4, #4]
	ldr r0, _0809AB4C @ =0x84000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	movs r0, #1
	movs r1, #0x78
	movs r2, #0x80
	bl CutsceneSecretConversationSetupOam
	movs r0, #2
	movs r1, #0x78
	movs r2, #0x80
	bl CutsceneSecretConversationSetupOam
	movs r0, #3
	movs r1, #0x78
	movs r2, #0x80
	bl CutsceneSecretConversationSetupOam
	ldr r1, _0809AB50 @ =0x0400000A
	ldr r2, _0809AB54 @ =0x00001802
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0809AB58 @ =0x00001903
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0xb0
	lsls r1, r1, #5
	adds r0, r1, #0
	strh r0, [r5]
	ldr r1, _0809AB5C @ =gWrittenToBldy
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	bl CutsceneDrawAllOam
	ldr r0, _0809AB60 @ =CutsceneSecretConversationVblank
	bl CallbackSetVBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809AAF4: .4byte 0x04000208
_0809AAF8: .4byte 0x04000004
_0809AAFC: .4byte 0x0000FFEF
_0809AB00: .4byte 0x04000200
_0809AB04: .4byte 0x0000FFFD
_0809AB08: .4byte unk_9ae0c
_0809AB0C: .4byte 0x0867815C
_0809AB10: .4byte 0x06014000
_0809AB14: .4byte 0x040000D4
_0809AB18: .4byte 0x086788A8
_0809AB1C: .4byte 0x05000300
_0809AB20: .4byte 0x84000010
_0809AB24: .4byte 0x08675098
_0809AB28: .4byte 0x06000800
_0809AB2C: .4byte 0x08677914
_0809AB30: .4byte 0x0600C000
_0809AB34: .4byte 0x08677C90
_0809AB38: .4byte 0x0600C800
_0809AB3C: .4byte 0x08677874
_0809AB40: .4byte 0x84000028
_0809AB44: .4byte 0x08677C10
_0809AB48: .4byte 0x050001E0
_0809AB4C: .4byte 0x84000008
_0809AB50: .4byte 0x0400000A
_0809AB54: .4byte 0x00001802
_0809AB58: .4byte 0x00001903
_0809AB5C: .4byte gWrittenToBldy
_0809AB60: .4byte CutsceneSecretConversationVblank

	thumb_func_start CutsceneSecretConversationProcess
CutsceneSecretConversationProcess: @ 0x0809AB64
	push {r4, lr}
	movs r4, #0
	ldr r1, _0809AB7C @ =gNonGameplayRam
	ldrb r0, [r1, #0x10]
	cmp r0, #1
	beq _0809ABAA
	cmp r0, #1
	bgt _0809AB80
	cmp r0, #0
	beq _0809AB86
	b _0809ABBE
	.align 2, 0
_0809AB7C: .4byte gNonGameplayRam
_0809AB80:
	cmp r0, #2
	beq _0809ABB4
	b _0809ABBE
_0809AB86:
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bls _0809ABAE
	movs r0, #1
	strb r0, [r1, #0x10]
	strh r4, [r1, #8]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0x44
	bl CutsceneSecretConversationSetupOam
	bl CutsceneProcessOam
	b _0809ABAE
_0809ABAA:
	bl CutsceneProcessOam
_0809ABAE:
	bl CutsceneDrawAllOam
	b _0809ABBE
_0809ABB4:
	bl CutsceneProcessOam
	bl CutsceneDrawAllOam
	movs r4, #1
_0809ABBE:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CutsceneSecretConversationSetupOam
CutsceneSecretConversationSetupOam: @ 0x0809ABC8
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r5, #0
	ldr r1, _0809ABE0 @ =gNonGameplayRam
	adds r0, r1, #0
	b _0809ABF6
	.align 2, 0
_0809ABE0: .4byte gNonGameplayRam
_0809ABE4:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bhi _0809AC02
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
_0809ABF6:
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809ABE4
	cmp r5, #0xf
	bls _0809AC06
_0809AC02:
	movs r0, #0x10
	b _0809ACC2
_0809AC06:
	movs r0, #0
	str r0, [sp]
	ldr r1, _0809AC54 @ =0x040000D4
	mov r0, sp
	str r0, [r1]
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r4, r0, #2
	ldr r3, _0809AC58 @ =0x0300149C
	adds r0, r4, r3
	str r0, [r1, #4]
	ldr r0, _0809AC5C @ =0x85000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	adds r0, r3, #0
	subs r0, #0x18
	adds r0, r4, r0
	strh r7, [r0, #0x18]
	strh r2, [r0, #0x1a]
	adds r1, r0, #0
	adds r1, #0x28
	strb r6, [r1]
	adds r0, #0x2e
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	strb r1, [r0]
	cmp r6, #1
	bne _0809AC68
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _0809AC60 @ =0x086793B0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809AC64 @ =unk_9db70
	b _0809ACBE
	.align 2, 0
_0809AC54: .4byte 0x040000D4
_0809AC58: .4byte 0x0300149C
_0809AC5C: .4byte 0x85000009
_0809AC60: .4byte 0x086793B0
_0809AC64: .4byte unk_9db70
_0809AC68:
	cmp r6, #2
	bne _0809AC88
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _0809AC80 @ =0x08679280
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809AC84 @ =CutsceneSecretConversationProcessNavigationPanel
	b _0809ACBE
	.align 2, 0
_0809AC80: .4byte 0x08679280
_0809AC84: .4byte CutsceneSecretConversationProcessNavigationPanel
_0809AC88:
	cmp r6, #3
	bne _0809ACA8
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _0809ACA0 @ =0x086793A0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809ACA4 @ =unk_9db70
	b _0809ACBE
	.align 2, 0
_0809ACA0: .4byte 0x086793A0
_0809ACA4: .4byte unk_9db70
_0809ACA8:
	cmp r6, #4
	bne _0809ACC0
	adds r0, r3, #0
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _0809ACCC @ =0x086792D0
	str r1, [r0]
	adds r0, r3, #0
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809ACD0 @ =CutsceneSecretConversationProcessIncomingDispatch
_0809ACBE:
	str r1, [r0]
_0809ACC0:
	adds r0, r5, #0
_0809ACC2:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809ACCC: .4byte 0x086792D0
_0809ACD0: .4byte CutsceneSecretConversationProcessIncomingDispatch

	thumb_func_start CutsceneSecretConversationProcessNavigationPanel
CutsceneSecretConversationProcessNavigationPanel: @ 0x0809ACD4
	push {lr}
	adds r2, r0, #0
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	bne _0809ACEA
	movs r0, #1
	strb r0, [r2, #0x14]
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
	ldr r0, _0809ACF0 @ =0x086792A8
	str r0, [r2, #0x1c]
_0809ACEA:
	pop {r0}
	bx r0
	.align 2, 0
_0809ACF0: .4byte 0x086792A8

	thumb_func_start CutsceneSecretConversationProcessIncomingDispatch
CutsceneSecretConversationProcessIncomingDispatch: @ 0x0809ACF4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r5, [r4, #0x14]
	cmp r5, #0
	bne _0809AD3C
	ldrb r0, [r4, #0x11]
	lsls r0, r0, #3
	ldr r1, [r4, #0x1c]
	adds r6, r1, r0
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	bne _0809AD16
	ldr r0, _0809AD34 @ =0x0000022F
	bl SoundPlay
	movs r0, #1
	strb r0, [r4, #0x13]
_0809AD16:
	ldrb r0, [r6, #4]
	ldrb r1, [r4, #0x12]
	cmp r0, r1
	bne _0809AD5A
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	bne _0809AD5A
	movs r0, #1
	strb r0, [r4, #0x14]
	strb r5, [r4, #0x13]
	strb r5, [r4, #0x12]
	strb r5, [r4, #0x11]
	ldr r0, _0809AD38 @ =0x08679350
	str r0, [r4, #0x1c]
	b _0809AD5A
	.align 2, 0
_0809AD34: .4byte 0x0000022F
_0809AD38: .4byte 0x08679350
_0809AD3C:
	cmp r5, #1
	bne _0809AD5A
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bne _0809AD5A
	movs r0, #2
	strb r0, [r4, #0x14]
	movs r1, #0
	strb r1, [r4, #0x13]
	ldr r1, _0809AD60 @ =gNonGameplayRam
	strb r0, [r1, #0x10]
_0809AD5A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AD60: .4byte gNonGameplayRam

	thumb_func_start CutsceneSecretConversationVblank
CutsceneSecretConversationVblank: @ 0x0809AD64
	push {lr}
	ldr r2, _0809AD98 @ =0x040000D4
	ldr r0, _0809AD9C @ =gOamData
	str r0, [r2]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r2, #4]
	ldr r0, _0809ADA0 @ =0x84000100
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	ldr r1, _0809ADA4 @ =0x04000054
	ldr r0, _0809ADA8 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0809ADAC @ =gNonGameplayRam
	ldrb r0, [r1, #0x11]
	adds r0, #1
	strb r0, [r1, #0x11]
	ldrb r0, [r1, #0x11]
	cmp r0, #0xe
	beq _0809ADC4
	cmp r0, #0xe
	bgt _0809ADB0
	cmp r0, #7
	beq _0809ADBA
	b _0809ADFA
	.align 2, 0
_0809AD98: .4byte 0x040000D4
_0809AD9C: .4byte gOamData
_0809ADA0: .4byte 0x84000100
_0809ADA4: .4byte 0x04000054
_0809ADA8: .4byte gWrittenToBldy
_0809ADAC: .4byte gNonGameplayRam
_0809ADB0:
	cmp r0, #0x15
	beq _0809ADCC
	cmp r0, #0x1c
	beq _0809ADE8
	b _0809ADFA
_0809ADBA:
	ldr r0, _0809ADC0 @ =0x08677C30
	b _0809ADCE
	.align 2, 0
_0809ADC0: .4byte 0x08677C30
_0809ADC4:
	ldr r0, _0809ADC8 @ =0x08677C50
	b _0809ADCE
	.align 2, 0
_0809ADC8: .4byte 0x08677C50
_0809ADCC:
	ldr r0, _0809ADDC @ =0x08677C70
_0809ADCE:
	str r0, [r2]
	ldr r0, _0809ADE0 @ =0x050001E0
	str r0, [r2, #4]
	ldr r0, _0809ADE4 @ =0x84000008
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0809ADFA
	.align 2, 0
_0809ADDC: .4byte 0x08677C70
_0809ADE0: .4byte 0x050001E0
_0809ADE4: .4byte 0x84000008
_0809ADE8:
	ldr r0, _0809AE00 @ =0x08677C10
	str r0, [r2]
	ldr r0, _0809AE04 @ =0x050001E0
	str r0, [r2, #4]
	ldr r0, _0809AE08 @ =0x84000008
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	movs r0, #0
	strb r0, [r1, #0x11]
_0809ADFA:
	pop {r0}
	bx r0
	.align 2, 0
_0809AE00: .4byte 0x08677C10
_0809AE04: .4byte 0x050001E0
_0809AE08: .4byte 0x84000008

	thumb_func_start unk_9ae0c
unk_9ae0c: @ 0x0809AE0C
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneRestrictedLabDetaching
CutsceneRestrictedLabDetaching: @ 0x0809AE18
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0809AE30 @ =gNonGameplayRam
	ldrh r0, [r4]
	cmp r0, #1
	beq _0809AE48
	cmp r0, #1
	bgt _0809AE34
	cmp r0, #0
	beq _0809AE3E
	b _0809AE96
	.align 2, 0
_0809AE30: .4byte gNonGameplayRam
_0809AE34:
	cmp r0, #2
	beq _0809AE70
	cmp r0, #3
	beq _0809AE88
	b _0809AE96
_0809AE3E:
	movs r0, #1
	strh r0, [r4]
	bl CutsceneRestrictedLabDetachingInit
	b _0809AE96
_0809AE48:
	ldr r5, _0809AE6C @ =gWrittenToBldy
	ldrh r0, [r5]
	cmp r0, #0x10
	bne _0809AE58
	movs r0, #0x92
	lsls r0, r0, #2
	bl unk_3b1c
_0809AE58:
	bl CutsceneFadeIn
	ldrh r0, [r5]
	cmp r0, #0
	bne _0809AE96
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _0809AE96
	.align 2, 0
_0809AE6C: .4byte gWrittenToBldy
_0809AE70:
	bl CutsceneRestrictedLabDetachingProcess
	cmp r0, #0
	beq _0809AE96
	movs r0, #3
	strh r0, [r4]
	ldr r1, _0809AE84 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
	b _0809AE96
	.align 2, 0
_0809AE84: .4byte 0x04000050
_0809AE88:
	bl CutsceneFadeOut
	ldr r0, _0809AEA0 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _0809AE96
	movs r6, #1
_0809AE96:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809AEA0: .4byte gWrittenToBldy

	thumb_func_start CutsceneRestrictedLabDetachingInit
CutsceneRestrictedLabDetachingInit: @ 0x0809AEA4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r3, _0809AF9C @ =0x04000208
	movs r5, #0
	strh r5, [r3]
	ldr r2, _0809AFA0 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0809AFA4 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0809AFA8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809AFAC @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809AFB0 @ =unk_9c1bc
	bl CallbackSetVBlank
	bl unk_36c4
	movs r0, #0x80
	lsls r0, r0, #0x13
	mov r8, r0
	strh r5, [r0]
	ldr r0, _0809AFB4 @ =0x0867D7CC
	ldr r1, _0809AFB8 @ =0x06010000
	bl LZ77UncompVram
	ldr r4, _0809AFBC @ =0x040000D4
	ldr r0, _0809AFC0 @ =0x0868121C
	str r0, [r4]
	ldr r0, _0809AFC4 @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _0809AFC8 @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809AFCC @ =0x08679420
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0809AFD0 @ =0x086820A4
	ldr r1, _0809AFD4 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0809AFD8 @ =0x08681A1C
	ldr r1, _0809AFDC @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _0809AFE0 @ =0x0868259C
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	str r6, [r4, #8]
	ldr r1, [r4, #8]
	strh r5, [r0]
	ldr r1, _0809AFE4 @ =0x0400000A
	movs r2, #0xe8
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	subs r2, #0xfd
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r1, #0
	mov r2, r8
	strh r0, [r2]
	ldr r1, _0809AFE8 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #1
	movs r1, #0x96
	movs r2, #0x5a
	bl CutsceneRestrictedLabDetachingSetupOam
	movs r0, #3
	movs r1, #0x96
	movs r2, #0x5a
	bl CutsceneRestrictedLabDetachingSetupOam
	movs r0, #2
	movs r1, #0x96
	movs r2, #0x5a
	bl CutsceneRestrictedLabDetachingSetupOam
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl CutsceneRestrictedLabDetachingSetupOam
	bl CutsceneProcessOam
	bl CutsceneDrawAllOam
	ldr r0, _0809AFEC @ =gNonGameplayRam
	movs r1, #0
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0809AFF0 @ =0x0868101C
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, _0809AFF4 @ =0x05000120
	str r0, [r4, #4]
	ldr r0, _0809AFF8 @ =0x84000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809AFFC @ =CutsceneRestrictedLabDetachingVblank
	bl CallbackSetVBlank
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AF9C: .4byte 0x04000208
_0809AFA0: .4byte 0x04000004
_0809AFA4: .4byte 0x0000FFEF
_0809AFA8: .4byte 0x04000200
_0809AFAC: .4byte 0x0000FFFD
_0809AFB0: .4byte unk_9c1bc
_0809AFB4: .4byte 0x0867D7CC
_0809AFB8: .4byte 0x06010000
_0809AFBC: .4byte 0x040000D4
_0809AFC0: .4byte 0x0868121C
_0809AFC4: .4byte 0x05000200
_0809AFC8: .4byte 0x84000080
_0809AFCC: .4byte 0x08679420
_0809AFD0: .4byte 0x086820A4
_0809AFD4: .4byte 0x0600E000
_0809AFD8: .4byte 0x08681A1C
_0809AFDC: .4byte 0x0600E800
_0809AFE0: .4byte 0x0868259C
_0809AFE4: .4byte 0x0400000A
_0809AFE8: .4byte gWrittenToBldy
_0809AFEC: .4byte gNonGameplayRam
_0809AFF0: .4byte 0x0868101C
_0809AFF4: .4byte 0x05000120
_0809AFF8: .4byte 0x84000008
_0809AFFC: .4byte CutsceneRestrictedLabDetachingVblank

	thumb_func_start CutsceneRestrictedLabDetachingProcess
CutsceneRestrictedLabDetachingProcess: @ 0x0809B000
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r7, #0
	ldr r0, _0809B01C @ =gNonGameplayRam
	ldrb r1, [r0, #0x10]
	adds r5, r0, #0
	cmp r1, #0xa
	bls _0809B012
	b _0809B356
_0809B012:
	lsls r0, r1, #2
	ldr r1, _0809B020 @ =_0809B024
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809B01C: .4byte gNonGameplayRam
_0809B020: .4byte _0809B024
_0809B024: @ jump table
	.4byte _0809B050 @ case 0
	.4byte _0809B068 @ case 1
	.4byte _0809B178 @ case 2
	.4byte _0809B356 @ case 3
	.4byte _0809B356 @ case 4
	.4byte _0809B1B0 @ case 5
	.4byte _0809B218 @ case 6
	.4byte _0809B236 @ case 7
	.4byte _0809B268 @ case 8
	.4byte _0809B2C8 @ case 9
	.4byte _0809B308 @ case 10
_0809B050:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #1
	beq _0809B060
	b _0809B356
_0809B060:
	movs r0, #0
	strh r0, [r5, #8]
	strb r1, [r5, #0x10]
	b _0809B356
_0809B068:
	ldrh r0, [r5, #8]
	adds r0, #1
	movs r1, #0
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _0809B0C0
	mov r4, sp
	adds r4, #6
	movs r0, #2
	add r1, sp, #4
	adds r2, r4, #0
	bl CutsceneRestrictedLabDetachingGetPositionOfOamByType
	add r0, sp, #4
	ldrh r1, [r0]
	subs r1, #0x14
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4]
	subs r2, #0x14
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #2
	rsbs r3, r3, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #0x11
	bl unk_9c0b4
	add r0, sp, #4
	ldrh r1, [r0]
	subs r1, #0x46
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4]
	subs r2, #0x1a
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #1
	rsbs r3, r3, #0
	movs r0, #4
	b _0809B156
_0809B0C0:
	cmp r0, #0x10
	bne _0809B10C
	mov r4, sp
	adds r4, #6
	movs r0, #2
	add r1, sp, #4
	adds r2, r4, #0
	bl CutsceneRestrictedLabDetachingGetPositionOfOamByType
	add r0, sp, #4
	ldrh r1, [r0]
	subs r1, #0x1e
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4]
	subs r2, #0x1e
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #2
	rsbs r3, r3, #0
	movs r5, #8
	str r5, [sp]
	movs r0, #0x11
	bl unk_9c0b4
	add r0, sp, #4
	ldrh r1, [r0]
	subs r1, #0x32
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4]
	subs r2, #8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #1
	rsbs r3, r3, #0
	str r5, [sp]
	b _0809B158
_0809B10C:
	cmp r0, #0x14
	bne _0809B160
	mov r4, sp
	adds r4, #6
	movs r0, #2
	add r1, sp, #4
	adds r2, r4, #0
	bl CutsceneRestrictedLabDetachingGetPositionOfOamByType
	add r0, sp, #4
	ldrh r1, [r0]
	subs r1, #0x50
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4]
	subs r2, #0xe
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #3
	rsbs r3, r3, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #0x11
	bl unk_9c0b4
	add r0, sp, #4
	ldrh r1, [r0]
	subs r1, #0xa
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldrh r2, [r4]
	subs r2, #0x12
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r3, #2
	rsbs r3, r3, #0
	movs r0, #2
_0809B156:
	str r0, [sp]
_0809B158:
	movs r0, #0x11
	bl unk_9c0b4
	b _0809B356
_0809B160:
	cmp r0, #0xaa
	beq _0809B166
	b _0809B356
_0809B166:
	strh r1, [r5, #8]
	movs r0, #2
	strb r0, [r5, #0x10]
	ldr r0, _0809B174 @ =gWrittenToBldy
	strh r1, [r0]
	b _0809B356
	.align 2, 0
_0809B174: .4byte gWrittenToBldy
_0809B178:
	ldr r1, _0809B1A0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bls _0809B1B8
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _0809B1A4 @ =0x040000D4
	add r0, sp, #8
	str r0, [r1]
	ldr r2, _0809B1A8 @ =0x0300149C
	str r2, [r1, #4]
	ldr r0, _0809B1AC @ =0x85000090
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r2, #0x18
	movs r0, #5
	strb r0, [r2, #0x10]
	b _0809B356
	.align 2, 0
_0809B1A0: .4byte gWrittenToBldy
_0809B1A4: .4byte 0x040000D4
_0809B1A8: .4byte 0x0300149C
_0809B1AC: .4byte 0x85000090
_0809B1B0:
	ldr r1, _0809B1C0 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0809B1C4
_0809B1B8:
	adds r0, #2
	strh r0, [r1]
	b _0809B356
	.align 2, 0
_0809B1C0: .4byte gWrittenToBldy
_0809B1C4:
	movs r5, #0
	str r5, [sp, #8]
	ldr r1, _0809B208 @ =0x040000D4
	add r0, sp, #8
	str r0, [r1]
	ldr r4, _0809B20C @ =0x0300149C
	str r4, [r1, #4]
	ldr r0, _0809B210 @ =0x85000090
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	subs r4, #0x18
	strh r5, [r4, #8]
	movs r0, #4
	movs r1, #0
	movs r2, #0
	bl CutsceneRestrictedLabDetachingSetupOam
	movs r0, #0x1e
	movs r1, #0xcd
	movs r2, #0xa
	bl CutsceneRestrictedLabDetachingSetupOam
	movs r0, #0xc
	movs r1, #0x8c
	movs r2, #0x50
	bl CutsceneRestrictedLabDetachingSetupOam
	ldr r0, _0809B214 @ =0x04000018
	strh r5, [r0]
	adds r0, #2
	strh r5, [r0]
	movs r0, #6
	strb r0, [r4, #0x10]
	b _0809B356
	.align 2, 0
_0809B208: .4byte 0x040000D4
_0809B20C: .4byte 0x0300149C
_0809B210: .4byte 0x85000090
_0809B214: .4byte 0x04000018
_0809B218:
	ldr r2, _0809B228 @ =gWrittenToBldy
	ldrh r0, [r2]
	adds r1, r0, #0
	cmp r1, #0
	beq _0809B22C
	subs r0, #2
	strh r0, [r2]
	b _0809B356
	.align 2, 0
_0809B228: .4byte gWrittenToBldy
_0809B22C:
	strh r1, [r2]
	strh r1, [r5, #8]
	movs r0, #7
	strb r0, [r5, #0x10]
	b _0809B356
_0809B236:
	ldrh r0, [r5, #8]
	adds r0, #1
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x95
	bne _0809B258
	ldr r0, _0809B250 @ =gWrittenToBldalpha_R
	movs r1, #0xa
	strh r1, [r0]
	ldr r0, _0809B254 @ =gWrittenToBldalpha_L
	strh r1, [r0]
	b _0809B356
	.align 2, 0
_0809B250: .4byte gWrittenToBldalpha_R
_0809B254: .4byte gWrittenToBldalpha_L
_0809B258:
	cmp r0, #0x96
	beq _0809B25E
	b _0809B356
_0809B25E:
	movs r0, #0
	strh r0, [r5, #8]
	movs r0, #8
	strb r0, [r5, #0x10]
	b _0809B356
_0809B268:
	ldrh r0, [r5, #8]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #8]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bne _0809B356
	ldr r1, _0809B2C0 @ =0x04000050
	ldr r2, _0809B2C4 @ =0x00001C42
	adds r0, r2, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	mov r4, sp
	adds r4, #6
	movs r0, #0xc
	add r1, sp, #4
	adds r2, r4, #0
	bl CutsceneRestrictedLabDetachingGetPositionOfOamByType
	movs r0, #0xc
	bl CutsceneDestroyOamOfType
	add r0, sp, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r3, #0
	ldrsh r2, [r4, r3]
	str r6, [sp]
	movs r0, #0x10
	movs r3, #0
	bl unk_9c0b4
	strh r6, [r5, #8]
	movs r0, #9
	strb r0, [r5, #0x10]
	b _0809B356
	.align 2, 0
_0809B2C0: .4byte 0x04000050
_0809B2C4: .4byte 0x00001C42
_0809B2C8:
	ldrh r0, [r5, #8]
	adds r1, r0, #1
	movs r3, #0
	strh r1, [r5, #8]
	ldrh r2, [r5, #0xc]
	movs r4, #0xc
	ldrsh r0, [r5, r4]
	cmp r0, #0xe
	bgt _0809B2EE
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bne _0809B356
	strh r3, [r5, #8]
	movs r0, #1
	strh r0, [r5, #0xa]
	adds r0, r2, #1
	strh r0, [r5, #0xc]
	b _0809B356
_0809B2EE:
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0809B356
	strh r3, [r5, #8]
	ldr r0, _0809B304 @ =gWrittenToBldy
	movs r1, #0x10
	strh r1, [r0]
	movs r0, #0xa
	strb r0, [r5, #0x10]
	b _0809B356
	.align 2, 0
_0809B304: .4byte gWrittenToBldy
_0809B308:
	adds r3, r5, #0
	ldrh r0, [r3, #8]
	adds r2, r0, #1
	movs r4, #0
	strh r2, [r3, #8]
	ldr r6, _0809B32C @ =gWrittenToBldalpha_R
	ldrh r1, [r6]
	cmp r1, #0xf
	bhi _0809B330
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _0809B356
	strh r4, [r3, #8]
	adds r0, r1, #1
	strh r0, [r6]
	b _0809B356
	.align 2, 0
_0809B32C: .4byte gWrittenToBldalpha_R
_0809B330:
	ldr r1, _0809B368 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0809B356
	strh r4, [r5, #8]
	str r4, [sp, #8]
	adds r1, #0x84
	add r0, sp, #8
	str r0, [r1]
	adds r0, r5, #0
	adds r0, #0x18
	str r0, [r1, #4]
	ldr r0, _0809B36C @ =0x85000090
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r7, #1
_0809B356:
	bl CutsceneProcessOam
	bl CutsceneDrawAllOam
	adds r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809B368: .4byte 0x04000050
_0809B36C: .4byte 0x85000090

	thumb_func_start CutsceneRestrictedLabDetachingProcessFallingLab
CutsceneRestrictedLabDetachingProcessFallingLab: @ 0x0809B370
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0809B388
	ldrh r0, [r2]
	strh r0, [r2, #6]
	ldrh r0, [r2, #2]
	strh r0, [r2, #8]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0809B3A4
_0809B388:
	cmp r0, #1
	bne _0809B3A4
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x11
	ldrh r3, [r2, #6]
	adds r1, r1, r3
	strh r1, [r2]
	lsrs r0, r0, #0x12
	ldrh r1, [r2, #8]
	subs r1, r1, r0
	strh r1, [r2, #2]
_0809B3A4:
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa
	bne _0809B3E8
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r1, [r2, #0xe]
	cmp r1, #0xdb
	bhi _0809B3C2
	ldrh r0, [r2, #4]
	adds r0, #2
	b _0809B3D8
_0809B3C2:
	ldr r0, _0809B3D0 @ =0x000001B7
	cmp r1, r0
	bhi _0809B3D4
	ldrh r0, [r2, #4]
	adds r0, #4
	b _0809B3D8
	.align 2, 0
_0809B3D0: .4byte 0x000001B7
_0809B3D4:
	ldrh r0, [r2, #4]
	adds r0, #6
_0809B3D8:
	strh r0, [r2, #4]
	movs r0, #4
	ldrsh r1, [r2, r0]
	ldr r0, _0809B438 @ =0x000001FF
	cmp r1, r0
	ble _0809B3E8
	adds r0, #1
	strh r0, [r2, #4]
_0809B3E8:
	ldrh r0, [r2, #0xa]
	adds r0, #1
	movs r1, #0
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0809B40A
	strh r1, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	adds r0, #1
	strh r0, [r2, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	ble _0809B40A
	strh r1, [r2, #0xc]
_0809B40A:
	ldrh r0, [r2]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x99
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809B428
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r0, #0x32
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0809B428
	cmp r1, #0xb0
	ble _0809B434
_0809B428:
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x16]
	subs r0, #2
	ands r0, r1
	strb r0, [r2, #0x16]
_0809B434:
	pop {r0}
	bx r0
	.align 2, 0
_0809B438: .4byte 0x000001FF

	thumb_func_start CutsceneRestrictedLabDetachingSetupOam
CutsceneRestrictedLabDetachingSetupOam: @ 0x0809B43C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	movs r0, #0
	mov r8, r0
	ldr r1, _0809B490 @ =gNonGameplayRam
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	adds r7, r1, #0
	cmp r0, #0
	beq _0809B484
_0809B466:
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	cmp r0, #0xf
	bhi _0809B48A
	lsls r0, r0, #3
	add r0, r8
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809B466
_0809B484:
	mov r2, r8
	cmp r2, #0xf
	bls _0809B494
_0809B48A:
	movs r0, #0x10
	b _0809B896
	.align 2, 0
_0809B490: .4byte gNonGameplayRam
_0809B494:
	movs r0, #0
	str r0, [sp]
	ldr r1, _0809B500 @ =0x040000D4
	mov r3, sp
	str r3, [r1]
	mov r0, r8
	lsls r2, r0, #3
	adds r0, r2, r0
	lsls r5, r0, #2
	ldr r3, _0809B504 @ =0x0300149C
	mov ip, r3
	adds r0, r5, r3
	str r0, [r1, #4]
	ldr r0, _0809B508 @ =0x85000009
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	mov r0, ip
	subs r0, #0x18
	adds r3, r5, r0
	mov r0, sb
	strh r0, [r3, #0x18]
	strh r6, [r3, #0x1a]
	adds r0, r3, #0
	adds r0, #0x28
	strb r4, [r0]
	adds r6, r3, #0
	adds r6, #0x2e
	ldrb r1, [r6]
	movs r0, #1
	orrs r1, r0
	strb r1, [r6]
	cmp r4, #1
	bne _0809B510
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r3, #0x1c]
	ldrb r0, [r6]
	movs r1, #6
	orrs r0, r1
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0809B50C @ =0x08680D54
	b _0809B570
	.align 2, 0
_0809B500: .4byte 0x040000D4
_0809B504: .4byte 0x0300149C
_0809B508: .4byte 0x85000009
_0809B50C: .4byte 0x08680D54
_0809B510:
	cmp r4, #2
	bne _0809B544
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r3, #0x1c]
	ldrb r0, [r6]
	movs r1, #6
	orrs r0, r1
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0809B540 @ =0x08680D64
	b _0809B570
	.align 2, 0
_0809B540: .4byte 0x08680D64
_0809B544:
	cmp r4, #3
	bne _0809B588
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r3, #0x1c]
	ldrb r0, [r6]
	movs r1, #6
	orrs r0, r1
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0809B580 @ =0x08680D74
_0809B570:
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0809B584 @ =CutsceneRestrictedLabDetachingProcessBslPart
	str r1, [r0]
	b _0809B894
	.align 2, 0
_0809B580: .4byte 0x08680D74
_0809B584: .4byte CutsceneRestrictedLabDetachingProcessBslPart
_0809B588:
	cmp r4, #4
	bne _0809B5A4
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r6]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0809B5A0 @ =CutsceneRestrictedLabDetachingProcessScrolling
	str r1, [r0]
	b _0809B894
	.align 2, 0
_0809B5A0: .4byte CutsceneRestrictedLabDetachingProcessScrolling
_0809B5A4:
	cmp r4, #5
	bne _0809B5B8
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0809B5B4 @ =0x08680E2C
	b _0809B5D6
	.align 2, 0
_0809B5B4: .4byte 0x08680E2C
_0809B5B8:
	cmp r4, #6
	bne _0809B5EC
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0809B5E4 @ =0x08680E3C
_0809B5D6:
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0809B5E8 @ =unk_9ba50
	str r1, [r0]
	b _0809B894
	.align 2, 0
_0809B5E4: .4byte 0x08680E3C
_0809B5E8: .4byte unk_9ba50
_0809B5EC:
	cmp r4, #7
	bne _0809B620
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0809B618 @ =0x08680DA4
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0809B61C @ =unk_9bac0
	str r1, [r0]
	b _0809B894
	.align 2, 0
_0809B618: .4byte 0x08680DA4
_0809B61C: .4byte unk_9bac0
_0809B620:
	cmp r4, #8
	bne _0809B654
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0809B64C @ =0x08680D94
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0809B650 @ =unk_9bb30
	str r1, [r0]
	b _0809B894
	.align 2, 0
_0809B64C: .4byte 0x08680D94
_0809B650: .4byte unk_9bb30
_0809B654:
	cmp r4, #9
	bne _0809B69C
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x1c]
	adds r2, r3, #0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r6]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r6]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r5, r0
	ldr r1, _0809B694 @ =0x08680D84
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0809B698 @ =unk_9bc04
	str r1, [r0]
	b _0809B894
	.align 2, 0
_0809B694: .4byte 0x08680D84
_0809B698: .4byte unk_9bc04
_0809B69C:
	cmp r4, #0xa
	bne _0809B6B8
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r6]
	mov r0, ip
	adds r0, #0x20
	adds r0, r5, r0
	ldr r1, _0809B6B4 @ =unk_9bcdc
	str r1, [r0]
	b _0809B894
	.align 2, 0
_0809B6B4: .4byte unk_9bcdc
_0809B6B8:
	cmp r4, #0xb
	bne _0809B6DC
	add r2, r8
	lsls r2, r2, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r2, r0
	ldr r1, _0809B6D4 @ =0x08680DCC
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B6D8 @ =unk_9bac0
	b _0809B892
	.align 2, 0
_0809B6D4: .4byte 0x08680DCC
_0809B6D8: .4byte unk_9bac0
_0809B6DC:
	cmp r4, #0xc
	bne _0809B72C
	add r2, r8
	lsls r2, r2, #2
	adds r3, r2, r7
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x1c]
	adds r4, r3, #0
	adds r4, #0x30
	ldrb r1, [r4]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	adds r3, #0x2e
	ldrb r1, [r3]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r2, r0
	ldr r1, _0809B724 @ =0x08680FEC
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B728 @ =unk_9bd24
	b _0809B892
	.align 2, 0
_0809B724: .4byte 0x08680FEC
_0809B728: .4byte unk_9bd24
_0809B72C:
	cmp r4, #0xd
	bne _0809B77C
	add r2, r8
	lsls r2, r2, #2
	adds r3, r2, r7
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r3, #0x1c]
	adds r4, r3, #0
	adds r4, #0x30
	ldrb r1, [r4]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	adds r3, #0x2e
	ldrb r1, [r3]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r2, r0
	ldr r1, _0809B774 @ =0x08680FC4
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B778 @ =unk_9bdf8
	b _0809B892
	.align 2, 0
_0809B774: .4byte 0x08680FC4
_0809B778: .4byte unk_9bdf8
_0809B77C:
	cmp r4, #0xe
	bne _0809B7A0
	add r2, r8
	lsls r2, r2, #2
	adds r1, r2, r7
	adds r1, #0x2e
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B79C @ =unk_9be8c
	b _0809B892
	.align 2, 0
_0809B79C: .4byte unk_9be8c
_0809B7A0:
	cmp r4, #0xf
	bne _0809B7C4
	add r2, r8
	lsls r2, r2, #2
	adds r1, r2, r7
	adds r1, #0x2e
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B7C0 @ =unk_9bf54
	b _0809B892
	.align 2, 0
_0809B7C0: .4byte unk_9bf54
_0809B7C4:
	cmp r4, #0x10
	bne _0809B80C
	add r2, r8
	lsls r2, r2, #2
	adds r3, r2, r7
	adds r4, r3, #0
	adds r4, #0x2e
	ldrb r1, [r4]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4]
	adds r3, #0x30
	ldrb r1, [r3]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r2, r0
	ldr r1, _0809B804 @ =0x08680F9C
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B808 @ =unk_9bfb8
	b _0809B892
	.align 2, 0
_0809B804: .4byte 0x08680F9C
_0809B808: .4byte unk_9bfb8
_0809B80C:
	cmp r4, #0x11
	bne _0809B830
	add r2, r8
	lsls r2, r2, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r2, r0
	ldr r1, _0809B828 @ =0x08680F74
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B82C @ =unk_9bfb8
	b _0809B892
	.align 2, 0
_0809B828: .4byte 0x08680F74
_0809B82C: .4byte unk_9bfb8
_0809B830:
	cmp r4, #0x12
	bne _0809B854
	add r2, r8
	lsls r2, r2, #2
	adds r1, r2, r7
	adds r1, #0x2e
	ldrb r3, [r1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B850 @ =unk_9c04c
	b _0809B892
	.align 2, 0
_0809B850: .4byte unk_9c04c
_0809B854:
	cmp r4, #0x1e
	bne _0809B894
	add r2, r8
	lsls r2, r2, #2
	adds r3, r2, r7
	movs r0, #0xd0
	lsls r0, r0, #1
	strh r0, [r3, #0x1c]
	adds r4, r3, #0
	adds r4, #0x30
	ldrb r1, [r4]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strb r0, [r4]
	adds r3, #0x2e
	ldrb r0, [r3]
	movs r1, #6
	orrs r0, r1
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r2, r0
	ldr r1, _0809B8A4 @ =0x08680F2C
	str r1, [r0]
	adds r0, r7, #0
	adds r0, #0x38
	adds r2, r2, r0
	ldr r0, _0809B8A8 @ =CutsceneRestrictedLabDetachingProcessFallingLab
_0809B892:
	str r0, [r2]
_0809B894:
	mov r0, r8
_0809B896:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809B8A4: .4byte 0x08680F2C
_0809B8A8: .4byte CutsceneRestrictedLabDetachingProcessFallingLab

	thumb_func_start CutsceneRestrictedLabDetachingProcessBslPart
CutsceneRestrictedLabDetachingProcessBslPart: @ 0x0809B8AC
	push {r4, lr}
	adds r2, r0, #0
	ldrb r3, [r2, #0x14]
	cmp r3, #0
	bne _0809B98C
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bne _0809B8CC
	strb r3, [r2, #0x13]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
_0809B8CC:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	movs r4, #6
	ldrsh r1, [r2, r4]
	cmp r1, #1
	beq _0809B90C
	cmp r1, #1
	bgt _0809B8E4
	cmp r1, #0
	beq _0809B8EA
	b _0809B954
_0809B8E4:
	cmp r1, #2
	beq _0809B930
	b _0809B954
_0809B8EA:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bne _0809B964
	strh r3, [r2, #0xe]
	ldrh r0, [r2, #4]
	adds r0, #2
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	ldr r1, _0809B908 @ =0x017F0000
	cmp r0, r1
	ble _0809B964
	movs r0, #1
	strh r0, [r2, #6]
	b _0809B964
	.align 2, 0
_0809B908: .4byte 0x017F0000
_0809B90C:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #5
	bne _0809B964
	strh r3, [r2, #0xe]
	ldrh r0, [r2, #4]
	adds r0, #2
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	ldr r1, _0809B92C @ =0x019F0000
	cmp r0, r1
	ble _0809B964
	movs r0, #2
	strh r0, [r2, #6]
	b _0809B964
	.align 2, 0
_0809B92C: .4byte 0x019F0000
_0809B930:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #6
	bne _0809B964
	strh r3, [r2, #0xe]
	ldrh r0, [r2, #4]
	adds r0, #2
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	ldr r1, _0809B950 @ =0x01BF0000
	cmp r0, r1
	ble _0809B964
	movs r0, #3
	strh r0, [r2, #6]
	b _0809B964
	.align 2, 0
_0809B950: .4byte 0x01BF0000
_0809B954:
	ldrh r0, [r2, #0xe]
	cmp r0, #7
	bne _0809B964
	movs r0, #0
	strh r0, [r2, #0xe]
	ldrh r0, [r2, #4]
	adds r0, #2
	strh r0, [r2, #4]
_0809B964:
	movs r1, #4
	ldrsh r0, [r2, r1]
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	ble _0809B972
	strh r1, [r2, #4]
_0809B972:
	ldr r0, _0809B988 @ =gNonGameplayRam
	ldrb r1, [r0, #0x10]
	cmp r1, #1
	bne _0809BA1C
	movs r0, #0
	strb r1, [r2, #0x14]
	strb r0, [r2, #0x13]
	strh r0, [r2, #6]
	strh r0, [r2, #0xe]
	b _0809BA1C
	.align 2, 0
_0809B988: .4byte gNonGameplayRam
_0809B98C:
	cmp r3, #1
	bne _0809B9C0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	movs r1, #0
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bne _0809B9A8
	strb r1, [r2, #0x13]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
_0809B9A8:
	ldrb r0, [r2, #0x10]
	cmp r0, #3
	bne _0809B9B6
	ldrh r0, [r2, #2]
	adds r0, #6
	strh r0, [r2, #2]
	strh r0, [r2, #8]
_0809B9B6:
	strh r1, [r2, #0xe]
	strh r1, [r2, #0xa]
	movs r0, #2
	strb r0, [r2, #0x14]
	b _0809BA1C
_0809B9C0:
	cmp r3, #2
	bne _0809BA1C
	ldrb r0, [r2, #0x13]
	adds r0, #1
	movs r1, #0
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #9
	bne _0809B9DC
	strb r1, [r2, #0x13]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
_0809B9DC:
	ldrh r0, [r2, #0xa]
	adds r0, #1
	strh r0, [r2, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #7
	bne _0809BA00
	strh r1, [r2, #0xa]
	ldrh r0, [r2, #4]
	adds r0, #2
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	ble _0809BA00
	strh r1, [r2, #4]
_0809BA00:
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrb r0, [r2, #0x10]
	cmp r0, #3
	bne _0809BA1C
	ldrh r0, [r2, #0xe]
	adds r4, r0, #0
	muls r4, r0, r4
	adds r0, r4, #0
	asrs r0, r0, #0xa
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
_0809BA1C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneRestrictedLabDetachingProcessScrolling
CutsceneRestrictedLabDetachingProcessScrolling: @ 0x0809BA24
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bne _0809BA40
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
_0809BA40:
	ldr r1, _0809BA4C @ =0x0400001C
	ldrh r0, [r2]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809BA4C: .4byte 0x0400001C

	thumb_func_start unk_9ba50
unk_9ba50: @ 0x0809BA50
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0809BA68
	ldrh r0, [r2]
	strh r0, [r2, #6]
	ldrh r0, [r2, #2]
	strh r0, [r2, #8]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0809BA92
_0809BA68:
	cmp r0, #1
	bne _0809BA92
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldrh r0, [r2, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2, #6]
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	ldrh r0, [r2, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
_0809BA92:
	ldrh r0, [r2]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809BAB0
	movs r0, #2
	ldrsh r1, [r2, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0809BAB0
	cmp r1, #0xb0
	ble _0809BABC
_0809BAB0:
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x16]
	subs r0, #2
	ands r0, r1
	strb r0, [r2, #0x16]
_0809BABC:
	pop {r0}
	bx r0

	thumb_func_start unk_9bac0
unk_9bac0: @ 0x0809BAC0
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0809BAD8
	ldrh r0, [r2]
	strh r0, [r2, #6]
	ldrh r0, [r2, #2]
	strh r0, [r2, #8]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0809BB02
_0809BAD8:
	cmp r0, #1
	bne _0809BB02
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldrh r0, [r2, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2, #6]
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	ldrh r0, [r2, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
_0809BB02:
	ldrh r0, [r2]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809BB20
	movs r0, #2
	ldrsh r1, [r2, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0809BB20
	cmp r1, #0xb0
	ble _0809BB2C
_0809BB20:
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x16]
	subs r0, #2
	ands r0, r1
	strb r0, [r2, #0x16]
_0809BB2C:
	pop {r0}
	bx r0

	thumb_func_start unk_9bb30
unk_9bb30: @ 0x0809BB30
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	bne _0809BB48
	ldrh r0, [r3]
	strh r0, [r3, #6]
	ldrh r0, [r3, #2]
	strh r0, [r3, #8]
	movs r0, #1
	strb r0, [r3, #0x14]
	b _0809BB6A
_0809BB48:
	cmp r0, #1
	bne _0809BB6A
	ldrh r0, [r3, #0xe]
	adds r0, #1
	strh r0, [r3, #0xe]
	ldrh r0, [r3, #0xe]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsrs r1, r1, #4
	ldrh r0, [r3, #6]
	subs r0, r0, r1
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	lsrs r0, r0, #3
	ldrh r1, [r3, #8]
	adds r0, r0, r1
	strh r0, [r3, #2]
_0809BB6A:
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	bne _0809BB8C
	movs r0, #0
	strb r0, [r3, #0x13]
	ldrh r0, [r3, #4]
	subs r0, #2
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0809BB8C
	movs r0, #2
	strh r0, [r3, #4]
_0809BB8C:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	movs r1, #0
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x10
	bne _0809BBC6
	strh r1, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0809BBAE
	strh r1, [r3, #0xc]
_0809BBAE:
	ldr r2, _0809BBF4 @ =0x040000D4
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	lsls r0, r0, #5
	ldr r1, _0809BBF8 @ =0x0868161C
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0809BBFC @ =0x05000220
	str r0, [r2, #4]
	ldr r0, _0809BC00 @ =0x84000008
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0809BBC6:
	ldrh r0, [r3]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809BBE4
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0809BBE4
	cmp r1, #0xb0
	ble _0809BBF0
_0809BBE4:
	movs r0, #0
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x16]
	subs r0, #2
	ands r0, r1
	strb r0, [r3, #0x16]
_0809BBF0:
	pop {r0}
	bx r0
	.align 2, 0
_0809BBF4: .4byte 0x040000D4
_0809BBF8: .4byte 0x0868161C
_0809BBFC: .4byte 0x05000220
_0809BC00: .4byte 0x84000008

	thumb_func_start unk_9bc04
unk_9bc04: @ 0x0809BC04
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	bne _0809BC1C
	ldrh r0, [r3]
	strh r0, [r3, #6]
	ldrh r0, [r3, #2]
	strh r0, [r3, #8]
	movs r0, #1
	strb r0, [r3, #0x14]
	b _0809BC42
_0809BC1C:
	cmp r0, #1
	bne _0809BC42
	ldrh r0, [r3, #0xe]
	adds r0, #1
	strh r0, [r3, #0xe]
	ldrh r1, [r3, #0xe]
	movs r0, #0xb
	muls r0, r1, r0
	lsrs r0, r0, #6
	ldrh r1, [r3, #6]
	adds r0, r0, r1
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	lsls r1, r0, #3
	adds r1, r1, r0
	asrs r1, r1, #6
	ldrh r0, [r3, #8]
	subs r0, r0, r1
	strh r0, [r3, #2]
_0809BC42:
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc
	bne _0809BC64
	movs r0, #0
	strb r0, [r3, #0x13]
	ldrh r0, [r3, #4]
	subs r0, #2
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _0809BC64
	movs r0, #2
	strh r0, [r3, #4]
_0809BC64:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	movs r1, #0
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #6
	bne _0809BC9E
	strh r1, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0809BC86
	strh r1, [r3, #0xc]
_0809BC86:
	ldr r2, _0809BCCC @ =0x040000D4
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	lsls r0, r0, #5
	ldr r1, _0809BCD0 @ =0x0868141C
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0809BCD4 @ =0x05000200
	str r0, [r2, #4]
	ldr r0, _0809BCD8 @ =0x84000008
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0809BC9E:
	ldrh r0, [r3]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809BCBC
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0809BCBC
	cmp r1, #0xb0
	ble _0809BCC8
_0809BCBC:
	movs r0, #0
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x16]
	subs r0, #2
	ands r0, r1
	strb r0, [r3, #0x16]
_0809BCC8:
	pop {r0}
	bx r0
	.align 2, 0
_0809BCCC: .4byte 0x040000D4
_0809BCD0: .4byte 0x0868141C
_0809BCD4: .4byte 0x05000200
_0809BCD8: .4byte 0x84000008

	thumb_func_start unk_9bcdc
unk_9bcdc: @ 0x0809BCDC
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	bne _0809BD00
	ldr r1, _0809BCFC @ =0x04000018
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3]
	strh r0, [r3, #6]
	ldrh r0, [r3, #2]
	strh r0, [r3, #8]
	movs r0, #1
	strb r0, [r3, #0x14]
	b _0809BD1C
	.align 2, 0
_0809BCFC: .4byte 0x04000018
_0809BD00:
	cmp r0, #1
	bne _0809BD1C
	ldrh r0, [r3, #0xe]
	adds r0, #1
	strh r0, [r3, #0xe]
	ldr r2, _0809BD20 @ =0x04000018
	movs r0, #0xc
	ldrsh r1, [r3, r0]
	ldrh r0, [r3, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #7
	ldrh r3, [r3]
	adds r0, r0, r3
	strh r0, [r2]
_0809BD1C:
	pop {r0}
	bx r0
	.align 2, 0
_0809BD20: .4byte 0x04000018

	thumb_func_start unk_9bd24
unk_9bd24: @ 0x0809BD24
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	bne _0809BD3C
	ldrh r0, [r3]
	strh r0, [r3, #6]
	ldrh r0, [r3, #2]
	strh r0, [r3, #8]
	movs r0, #1
	strb r0, [r3, #0x14]
	b _0809BD5A
_0809BD3C:
	cmp r0, #1
	bne _0809BD5A
	ldrh r0, [r3, #0xe]
	adds r0, #1
	strh r0, [r3, #0xe]
	ldrh r1, [r3, #0xe]
	lsrs r1, r1, #3
	ldrh r0, [r3, #6]
	subs r0, r0, r1
	strh r0, [r3]
	ldrh r0, [r3, #0xe]
	lsrs r0, r0, #4
	ldrh r1, [r3, #8]
	adds r0, r0, r1
	strh r0, [r3, #2]
_0809BD5A:
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0809BD7E
	movs r0, #0
	strb r0, [r3, #0x13]
	ldrh r0, [r3, #4]
	subs r0, #4
	strh r0, [r3, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bgt _0809BD7E
	movs r0, #2
	strh r0, [r3, #4]
_0809BD7E:
	ldrh r0, [r3, #0xa]
	adds r0, #1
	movs r1, #0
	strh r0, [r3, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _0809BDB8
	strh r1, [r3, #0xa]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0809BDA0
	strh r1, [r3, #0xc]
_0809BDA0:
	ldr r2, _0809BDE8 @ =0x040000D4
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	lsls r0, r0, #5
	ldr r1, _0809BDEC @ =0x0868181C
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0809BDF0 @ =0x05000260
	str r0, [r2, #4]
	ldr r0, _0809BDF4 @ =0x84000008
	str r0, [r2, #8]
	ldr r0, [r2, #8]
_0809BDB8:
	ldrh r0, [r3]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809BDD6
	movs r0, #2
	ldrsh r1, [r3, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0809BDD6
	cmp r1, #0xb0
	ble _0809BDE2
_0809BDD6:
	movs r0, #0
	strb r0, [r3, #0x10]
	ldrb r1, [r3, #0x16]
	subs r0, #2
	ands r0, r1
	strb r0, [r3, #0x16]
_0809BDE2:
	pop {r0}
	bx r0
	.align 2, 0
_0809BDE8: .4byte 0x040000D4
_0809BDEC: .4byte 0x0868181C
_0809BDF0: .4byte 0x05000260
_0809BDF4: .4byte 0x84000008

	thumb_func_start unk_9bdf8
unk_9bdf8: @ 0x0809BDF8
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0809BE10
	ldrh r0, [r2]
	strh r0, [r2, #6]
	ldrh r0, [r2, #2]
	strh r0, [r2, #8]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0809BE3A
_0809BE10:
	cmp r0, #1
	bne _0809BE3A
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldrh r0, [r2, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2, #6]
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #0xa
	ldrsh r1, [r2, r0]
	ldrh r0, [r2, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
_0809BE3A:
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bne _0809BE5E
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r0, [r2, #4]
	subs r0, #4
	strh r0, [r2, #4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bgt _0809BE5E
	movs r0, #2
	strh r0, [r2, #4]
_0809BE5E:
	ldrh r0, [r2]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809BE7C
	movs r0, #2
	ldrsh r1, [r2, r0]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0809BE7C
	cmp r1, #0xb0
	ble _0809BE88
_0809BE7C:
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x16]
	subs r0, #2
	ands r0, r1
	strb r0, [r2, #0x16]
_0809BE88:
	pop {r0}
	bx r0

	thumb_func_start unk_9be8c
unk_9be8c: @ 0x0809BE8C
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x14]
	cmp r0, #0
	bne _0809BEBC
	ldr r1, _0809BEAC @ =0x040000D4
	ldr r0, _0809BEB0 @ =0x0868101C
	str r0, [r1]
	ldr r0, _0809BEB4 @ =0x05000120
	str r0, [r1, #4]
	ldr r0, _0809BEB8 @ =0x84000008
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #1
	strb r0, [r3, #0x14]
	b _0809BF46
	.align 2, 0
_0809BEAC: .4byte 0x040000D4
_0809BEB0: .4byte 0x0868101C
_0809BEB4: .4byte 0x05000120
_0809BEB8: .4byte 0x84000008
_0809BEBC:
	cmp r0, #1
	bne _0809BF14
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _0809BF46
	movs r0, #0
	strb r0, [r3, #0x13]
	ldrh r0, [r3, #0xc]
	adds r0, #1
	strh r0, [r3, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xe
	ble _0809BEE8
	movs r0, #0xf
	strh r0, [r3, #0xc]
	movs r0, #2
	strb r0, [r3, #0x14]
_0809BEE8:
	ldr r2, _0809BF04 @ =0x040000D4
	movs r1, #0xc
	ldrsh r0, [r3, r1]
	lsls r0, r0, #5
	ldr r1, _0809BF08 @ =0x0868101C
	adds r0, r0, r1
	str r0, [r2]
	ldr r0, _0809BF0C @ =0x05000120
	str r0, [r2, #4]
	ldr r0, _0809BF10 @ =0x84000008
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	b _0809BF46
	.align 2, 0
_0809BF04: .4byte 0x040000D4
_0809BF08: .4byte 0x0868101C
_0809BF0C: .4byte 0x05000120
_0809BF10: .4byte 0x84000008
_0809BF14:
	cmp r0, #2
	bne _0809BF46
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bne _0809BF46
	movs r0, #0
	strb r0, [r3, #0x13]
	ldr r1, _0809BF4C @ =gWrittenToBldalpha_R
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0809BF46
	adds r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bhi _0809BF46
	ldr r1, _0809BF50 @ =gWrittenToBldalpha_L
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_0809BF46:
	pop {r0}
	bx r0
	.align 2, 0
_0809BF4C: .4byte gWrittenToBldalpha_R
_0809BF50: .4byte gWrittenToBldalpha_L

	thumb_func_start unk_9bf54
unk_9bf54: @ 0x0809BF54
	push {lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x13]
	adds r0, #1
	strb r0, [r3, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _0809BF7E
	movs r0, #0
	strb r0, [r3, #0x13]
	ldr r1, _0809BFAC @ =gNonGameplayRam
	ldrh r0, [r1, #0xa]
	adds r0, #2
	strh r0, [r1, #0xa]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xa0
	ble _0809BF7E
	movs r0, #0xa0
	strh r0, [r1, #0xa]
_0809BF7E:
	ldrb r0, [r3, #0x12]
	adds r0, #1
	strb r0, [r3, #0x12]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x20
	bne _0809BF90
	movs r0, #0
	strb r0, [r3, #0x12]
_0809BF90:
	ldr r1, _0809BFB0 @ =0x04000014
	ldr r2, _0809BFB4 @ =sRandomNumberTable
	ldrb r0, [r3, #0x12]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	adds r1, #2
	ldrb r0, [r3, #0x12]
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809BFAC: .4byte gNonGameplayRam
_0809BFB0: .4byte 0x04000014
_0809BFB4: .4byte sRandomNumberTable

	thumb_func_start unk_9bfb8
unk_9bfb8: @ 0x0809BFB8
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x14]
	cmp r0, #0
	bne _0809BFD0
	ldrh r0, [r2]
	strh r0, [r2, #6]
	ldrh r0, [r2, #2]
	strh r0, [r2, #8]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0809BFFA
_0809BFD0:
	cmp r0, #1
	bne _0809BFFA
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	movs r0, #0xc
	ldrsh r1, [r2, r0]
	ldrh r0, [r2, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2, #6]
	adds r0, r0, r1
	strh r0, [r2]
	movs r3, #0xa
	ldrsh r1, [r2, r3]
	ldrh r0, [r2, #0xe]
	muls r0, r1, r0
	asrs r0, r0, #6
	ldrh r1, [r2, #8]
	adds r0, r0, r1
	strh r0, [r2, #2]
_0809BFFA:
	ldrh r0, [r2]
	adds r0, #0x10
	lsls r0, r0, #0x10
	movs r1, #0x88
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0809C018
	movs r3, #2
	ldrsh r1, [r2, r3]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r1, r0
	blt _0809C018
	cmp r1, #0xb0
	ble _0809C024
_0809C018:
	movs r0, #0
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x16]
	subs r0, #2
	ands r0, r1
	strb r0, [r2, #0x16]
_0809C024:
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _0809C046
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809C046
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x16]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x16]
_0809C046:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start unk_9c04c
unk_9c04c: @ 0x0809C04C
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x28
	bne _0809C070
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0
	ble _0809C070
	subs r0, r1, #1
	strh r0, [r2]
_0809C070:
	ldr r1, _0809C07C @ =0x04000018
	ldrh r0, [r2]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809C07C: .4byte 0x04000018

	thumb_func_start unk_9c080
unk_9c080: @ 0x0809C080
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl CutsceneRestrictedLabDetachingSetupOam
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0809C0B0 @ =gNonGameplayRam
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	strh r4, [r1, #0x24]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809C0B0: .4byte gNonGameplayRam

	thumb_func_start unk_9c0b4
unk_9c0b4: @ 0x0809C0B4
	push {r4, r5, lr}
	adds r5, r3, #0
	ldr r4, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	bl CutsceneRestrictedLabDetachingSetupOam
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0809C0EC @ =gNonGameplayRam
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	strh r4, [r1, #0x22]
	strh r5, [r1, #0x24]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809C0EC: .4byte gNonGameplayRam

	thumb_func_start CutsceneRestrictedLabDetachingGetPositionOfOamByType
CutsceneRestrictedLabDetachingGetPositionOfOamByType: @ 0x0809C0F0
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0
	ldr r6, _0809C118 @ =gNonGameplayRam
_0809C0FC:
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r3, r0, r6
	adds r0, r3, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, r5
	bne _0809C11C
	ldrh r0, [r3, #0x18]
	strh r0, [r4]
	ldrh r0, [r3, #0x1a]
	b _0809C130
	.align 2, 0
_0809C118: .4byte gNonGameplayRam
_0809C11C:
	adds r0, r1, #1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0xf
	bls _0809C0FC
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r4]
	movs r0, #0xc8
_0809C130:
	strh r0, [r2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start CutsceneRestrictedLabDetachingVblank
CutsceneRestrictedLabDetachingVblank: @ 0x0809C138
	push {lr}
	ldr r3, _0809C18C @ =0x040000D4
	ldr r0, _0809C190 @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _0809C194 @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _0809C198 @ =0x04000052
	ldr r0, _0809C19C @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0809C1A0 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0809C1A4 @ =0x04000054
	ldr r0, _0809C1A8 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0809C1AC @ =gNonGameplayRam
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _0809C188
	movs r0, #0
	strh r0, [r1, #0xa]
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	lsls r0, r0, #5
	ldr r1, _0809C1B0 @ =0x0868101C
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _0809C1B4 @ =0x05000120
	str r0, [r3, #4]
	ldr r0, _0809C1B8 @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_0809C188:
	pop {r0}
	bx r0
	.align 2, 0
_0809C18C: .4byte 0x040000D4
_0809C190: .4byte gOamData
_0809C194: .4byte 0x84000100
_0809C198: .4byte 0x04000052
_0809C19C: .4byte gWrittenToBldalpha_L
_0809C1A0: .4byte gWrittenToBldalpha_R
_0809C1A4: .4byte 0x04000054
_0809C1A8: .4byte gWrittenToBldy
_0809C1AC: .4byte gNonGameplayRam
_0809C1B0: .4byte 0x0868101C
_0809C1B4: .4byte 0x05000120
_0809C1B8: .4byte 0x84000008

	thumb_func_start unk_9c1bc
unk_9c1bc: @ 0x0809C1BC
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneBslExploding
CutsceneBslExploding: @ 0x0809C1C8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r4, _0809C1E0 @ =gNonGameplayRam
	ldrh r0, [r4]
	cmp r0, #1
	beq _0809C1F8
	cmp r0, #1
	bgt _0809C1E4
	cmp r0, #0
	beq _0809C1EE
	b _0809C246
	.align 2, 0
_0809C1E0: .4byte gNonGameplayRam
_0809C1E4:
	cmp r0, #2
	beq _0809C220
	cmp r0, #3
	beq _0809C238
	b _0809C246
_0809C1EE:
	movs r0, #1
	strh r0, [r4]
	bl CutsceneBslExplodingInit
	b _0809C246
_0809C1F8:
	ldr r5, _0809C218 @ =gWrittenToBldy
	ldrh r0, [r5]
	cmp r0, #0x10
	bne _0809C206
	ldr r0, _0809C21C @ =0x00000247
	bl unk_3b1c
_0809C206:
	bl CutsceneFadeIn
	ldrh r0, [r5]
	cmp r0, #0
	bne _0809C246
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _0809C246
	.align 2, 0
_0809C218: .4byte gWrittenToBldy
_0809C21C: .4byte 0x00000247
_0809C220:
	bl CutsceneBslExplodingProcess
	cmp r0, #0
	beq _0809C246
	movs r0, #3
	strh r0, [r4]
	ldr r1, _0809C234 @ =0x04000050
	movs r0, #0xbf
	strh r0, [r1]
	b _0809C246
	.align 2, 0
_0809C234: .4byte 0x04000050
_0809C238:
	bl CutsceneFadeOut
	ldr r0, _0809C250 @ =gWrittenToBldy
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _0809C246
	movs r6, #1
_0809C246:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809C250: .4byte gWrittenToBldy

	thumb_func_start CutsceneBslExplodingInit
CutsceneBslExplodingInit: @ 0x0809C254
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r3, _0809C360 @ =0x04000208
	movs r5, #0
	strh r5, [r3]
	ldr r2, _0809C364 @ =0x04000004
	ldrh r1, [r2]
	ldr r0, _0809C368 @ =0x0000FFEF
	ands r0, r1
	strh r0, [r2]
	ldr r2, _0809C36C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0809C370 @ =0x0000FFFD
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0809C374 @ =unk_9c92c
	bl CallbackSetVBlank
	movs r0, #0x80
	lsls r0, r0, #0x13
	mov r8, r0
	strh r5, [r0]
	ldr r0, _0809C378 @ =0x0867D7CC
	ldr r1, _0809C37C @ =0x06010000
	bl LZ77UncompVram
	ldr r4, _0809C380 @ =0x040000D4
	ldr r0, _0809C384 @ =0x0868121C
	str r0, [r4]
	ldr r0, _0809C388 @ =0x05000200
	str r0, [r4, #4]
	ldr r6, _0809C38C @ =0x84000080
	str r6, [r4, #8]
	ldr r0, [r4, #8]
	ldr r0, _0809C390 @ =0x08679420
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl LZ77UncompVram
	ldr r0, _0809C394 @ =0x08681A1C
	ldr r1, _0809C398 @ =0x0600E000
	bl LZ77UncompVram
	ldr r0, _0809C39C @ =0x086820A4
	ldr r1, _0809C3A0 @ =0x0600E800
	bl LZ77UncompVram
	ldr r0, _0809C3A4 @ =0x086827A8
	ldr r1, _0809C3A8 @ =0x0600F000
	bl LZ77UncompVram
	ldr r0, _0809C3AC @ =0x08682BFC
	ldr r1, _0809C3B0 @ =0x0600F800
	bl LZ77UncompVram
	ldr r0, _0809C3B4 @ =0x0868259C
	str r0, [r4]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	str r0, [r4, #4]
	str r6, [r4, #8]
	ldr r1, [r4, #8]
	strh r5, [r0]
	ldr r1, _0809C3B8 @ =0x04000008
	movs r2, #0xe0
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0809C3BC @ =0x00001D03
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	adds r2, #0xfd
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0809C3C0 @ =0x00001F03
	adds r0, r2, #0
	strh r0, [r1]
	movs r1, #0xc0
	lsls r1, r1, #5
	adds r0, r1, #0
	mov r2, r8
	strh r0, [r2]
	ldr r0, _0809C3C4 @ =gWrittenToBldy
	movs r2, #0x10
	strh r2, [r0]
	ldr r1, _0809C3C8 @ =gWrittenToBldalpha_R
	movs r0, #8
	strh r0, [r1]
	ldr r0, _0809C3CC @ =gWrittenToBldalpha_L
	strh r2, [r0]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl CutsceneBslExplodingSetupOam
	movs r0, #0x14
	movs r1, #0x70
	movs r2, #0x58
	movs r3, #0
	bl CutsceneBslExplodingSetupOam
	ldr r0, _0809C3D0 @ =gNonGameplayRam
	movs r1, #0
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	movs r1, #0xc
	ldrsh r0, [r0, r1]
	lsls r0, r0, #5
	ldr r1, _0809C3D4 @ =0x0868101C
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, _0809C3D8 @ =0x05000120
	str r0, [r4, #4]
	ldr r0, _0809C3DC @ =0x84000008
	str r0, [r4, #8]
	ldr r0, [r4, #8]
	bl CutsceneDrawAllOam
	ldr r0, _0809C3E0 @ =CutsceneBslExplodingVblank
	bl CallbackSetVBlank
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809C360: .4byte 0x04000208
_0809C364: .4byte 0x04000004
_0809C368: .4byte 0x0000FFEF
_0809C36C: .4byte 0x04000200
_0809C370: .4byte 0x0000FFFD
_0809C374: .4byte unk_9c92c
_0809C378: .4byte 0x0867D7CC
_0809C37C: .4byte 0x06010000
_0809C380: .4byte 0x040000D4
_0809C384: .4byte 0x0868121C
_0809C388: .4byte 0x05000200
_0809C38C: .4byte 0x84000080
_0809C390: .4byte 0x08679420
_0809C394: .4byte 0x08681A1C
_0809C398: .4byte 0x0600E000
_0809C39C: .4byte 0x086820A4
_0809C3A0: .4byte 0x0600E800
_0809C3A4: .4byte 0x086827A8
_0809C3A8: .4byte 0x0600F000
_0809C3AC: .4byte 0x08682BFC
_0809C3B0: .4byte 0x0600F800
_0809C3B4: .4byte 0x0868259C
_0809C3B8: .4byte 0x04000008
_0809C3BC: .4byte 0x00001D03
_0809C3C0: .4byte 0x00001F03
_0809C3C4: .4byte gWrittenToBldy
_0809C3C8: .4byte gWrittenToBldalpha_R
_0809C3CC: .4byte gWrittenToBldalpha_L
_0809C3D0: .4byte gNonGameplayRam
_0809C3D4: .4byte 0x0868101C
_0809C3D8: .4byte 0x05000120
_0809C3DC: .4byte 0x84000008
_0809C3E0: .4byte CutsceneBslExplodingVblank

	thumb_func_start CutsceneBslExplodingProcess
CutsceneBslExplodingProcess: @ 0x0809C3E4
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _0809C404 @ =gNonGameplayRam
	ldrh r0, [r1, #8]
	adds r0, #1
	strh r0, [r1, #8]
	ldrb r0, [r1, #0x10]
	adds r4, r1, #0
	cmp r0, #6
	bls _0809C3FA
	b _0809C5E2
_0809C3FA:
	lsls r0, r0, #2
	ldr r1, _0809C408 @ =_0809C40C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809C404: .4byte gNonGameplayRam
_0809C408: .4byte _0809C40C
_0809C40C: @ jump table
	.4byte _0809C428 @ case 0
	.4byte _0809C432 @ case 1
	.4byte _0809C464 @ case 2
	.4byte _0809C4CC @ case 3
	.4byte _0809C4FC @ case 4
	.4byte _0809C52C @ case 5
	.4byte _0809C5B4 @ case 6
_0809C428:
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #1
	strb r0, [r4, #0x10]
	b _0809C5E2
_0809C432:
	ldrh r0, [r4, #8]
	cmp r0, #0xf
	beq _0809C43A
	b _0809C5E2
_0809C43A:
	ldr r1, _0809C45C @ =0x04000050
	ldr r2, _0809C460 @ =0x00001C44
	adds r0, r2, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #3
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #2
	strb r0, [r4, #0x10]
	b _0809C5E2
	.align 2, 0
_0809C45C: .4byte 0x04000050
_0809C460: .4byte 0x00001C44
_0809C464:
	ldr r2, _0809C484 @ =gWrittenToBldalpha_R
	ldrh r1, [r2]
	cmp r1, #0xf
	bhi _0809C48C
	ldrh r0, [r4, #8]
	cmp r0, #1
	bne _0809C47A
	movs r0, #0
	strh r0, [r4, #8]
	adds r0, r1, #2
	strh r0, [r2]
_0809C47A:
	ldr r1, _0809C488 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	b _0809C5E2
	.align 2, 0
_0809C484: .4byte gWrittenToBldalpha_R
_0809C488: .4byte gWrittenToBldy
_0809C48C:
	ldrh r0, [r4, #8]
	cmp r0, #0x28
	beq _0809C494
	b _0809C5E2
_0809C494:
	ldr r1, _0809C4C8 @ =0x04000050
	movs r0, #0xff
	strh r0, [r1]
	subs r1, #0x50
	movs r2, #0x90
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #1
	bl CutsceneDestroyOamOfType
	movs r0, #0x14
	bl CutsceneDestroyOamOfType
	movs r0, #0x15
	movs r1, #0x78
	movs r2, #0x5a
	movs r3, #1
	bl CutsceneBslExplodingSetupOam
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #3
	strb r0, [r4, #0x10]
	b _0809C5E2
	.align 2, 0
_0809C4C8: .4byte 0x04000050
_0809C4CC:
	ldrh r0, [r4, #8]
	cmp r0, #1
	beq _0809C4D4
	b _0809C5E2
_0809C4D4:
	ldr r1, _0809C4F0 @ =gWrittenToBldy
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0809C4F4 @ =gWrittenToBldalpha_R
	movs r1, #0xa
	strh r1, [r0]
	ldr r0, _0809C4F8 @ =gWrittenToBldalpha_L
	strh r1, [r0]
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #4
	strb r0, [r4, #0x10]
	b _0809C5E2
	.align 2, 0
_0809C4F0: .4byte gWrittenToBldy
_0809C4F4: .4byte gWrittenToBldalpha_R
_0809C4F8: .4byte gWrittenToBldalpha_L
_0809C4FC:
	ldrh r0, [r4, #8]
	cmp r0, #0x3c
	bne _0809C5E2
	ldr r1, _0809C524 @ =0x04000050
	ldr r3, _0809C528 @ =0x00001E41
	adds r0, r3, #0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #5
	strb r0, [r4, #0x10]
	b _0809C5E2
	.align 2, 0
_0809C524: .4byte 0x04000050
_0809C528: .4byte 0x00001E41
_0809C52C:
	ldrh r1, [r4, #0xc]
	movs r2, #0xc
	ldrsh r0, [r4, r2]
	cmp r0, #0xe
	bgt _0809C59A
	ldrh r0, [r4, #8]
	cmp r0, #4
	bne _0809C5E2
	movs r0, #0
	strh r0, [r4, #8]
	movs r0, #1
	strh r0, [r4, #0xa]
	adds r0, r1, #1
	strh r0, [r4, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0809C570
	movs r0, #0x16
	movs r1, #0x78
	movs r2, #0x60
	movs r3, #0
	bl CutsceneBslExplodingSetupOam
	movs r0, #0x16
	movs r1, #0x5f
	movs r2, #0x50
	movs r3, #0
	bl CutsceneBslExplodingSetupOam
	movs r0, #0x16
	movs r1, #0x8c
	movs r2, #0x69
	b _0809C592
_0809C570:
	cmp r0, #2
	bne _0809C588
	movs r0, #0x16
	movs r1, #0x78
	movs r2, #0x54
	movs r3, #0
	bl CutsceneBslExplodingSetupOam
	movs r0, #0x16
	movs r1, #0x91
	movs r2, #0x55
	b _0809C592
_0809C588:
	cmp r0, #3
	bne _0809C5E2
	movs r0, #0x16
	movs r1, #0x60
	movs r2, #0x6a
_0809C592:
	movs r3, #0
	bl CutsceneBslExplodingSetupOam
	b _0809C5E2
_0809C59A:
	ldrh r0, [r4, #8]
	cmp r0, #0xf
	bne _0809C5E2
	movs r0, #0
	strh r0, [r4, #8]
	ldr r1, _0809C5B0 @ =gWrittenToBldy
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #6
	strb r0, [r4, #0x10]
	b _0809C5E2
	.align 2, 0
_0809C5B0: .4byte gWrittenToBldy
_0809C5B4:
	ldr r2, _0809C5CC @ =gWrittenToBldalpha_R
	ldrh r1, [r2]
	cmp r1, #0xf
	bhi _0809C5D0
	ldrh r0, [r4, #8]
	cmp r0, #6
	bne _0809C5E2
	movs r0, #0
	strh r0, [r4, #8]
	adds r0, r1, #1
	strh r0, [r2]
	b _0809C5E2
	.align 2, 0
_0809C5CC: .4byte gWrittenToBldalpha_R
_0809C5D0:
	ldr r0, _0809C5F4 @ =0x04000050
	movs r1, #0xbf
	strh r1, [r0]
	ldrh r0, [r4, #8]
	cmp r0, #0x10
	bne _0809C5E2
	movs r0, #0
	strh r0, [r4, #8]
	movs r5, #1
_0809C5E2:
	bl CutsceneProcessOam
	bl CutsceneDrawAllOam
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0809C5F4: .4byte 0x04000050

	thumb_func_start CutsceneBslExplodingProcessScrolling
CutsceneBslExplodingProcessScrolling: @ 0x0809C5F8
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x1e
	bne _0809C614
	movs r0, #0
	strb r0, [r2, #0x13]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
_0809C614:
	ldr r1, _0809C620 @ =0x0400001C
	ldrh r0, [r2]
	strh r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0809C620: .4byte 0x0400001C

	thumb_func_start CutsceneBslExplodingProcessBslFar
CutsceneBslExplodingProcessBslFar: @ 0x0809C624
	push {r4, lr}
	adds r2, r0, #0
	ldrb r1, [r2, #0x14]
	cmp r1, #0
	bne _0809C654
	ldr r3, _0809C64C @ =gNonGameplayRam
	ldrb r0, [r3, #0x10]
	cmp r0, #5
	bne _0809C67A
	movs r4, #0xc
	ldrsh r0, [r3, r4]
	cmp r0, #5
	bne _0809C67A
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x11]
	ldr r0, _0809C650 @ =0x08680ECC
	str r0, [r2, #0x1c]
	movs r0, #1
	strb r0, [r2, #0x14]
	b _0809C67A
	.align 2, 0
_0809C64C: .4byte gNonGameplayRam
_0809C650: .4byte 0x08680ECC
_0809C654:
	cmp r1, #1
	bne _0809C67A
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _0809C67A
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809C67A
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x16]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x16]
_0809C67A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start CutsceneBslExplodingProcessExplosions
CutsceneBslExplodingProcessExplosions: @ 0x0809C680
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x11]
	lsls r0, r0, #3
	ldr r1, [r2, #0x1c]
	adds r1, r1, r0
	ldrb r0, [r1, #4]
	ldrb r3, [r2, #0x12]
	cmp r0, r3
	bne _0809C6A6
	ldrb r1, [r1, #0xc]
	cmp r1, #0
	bne _0809C6A6
	strb r1, [r2, #0x10]
	ldrb r1, [r2, #0x16]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #0x16]
_0809C6A6:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneBslExplodingSetupOam
CutsceneBslExplodingSetupOam: @ 0x0809C6AC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsls r3, r3, #0x18
	cmp r3, #0
	bne _0809C708
	movs r2, #0
	ldr r1, _0809C704 @ =gNonGameplayRam
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809C6F8
	adds r3, r1, #0
_0809C6D8:
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0xf
	bgt _0809C742
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809C6D8
_0809C6F8:
	lsls r0, r2, #0x18
	asrs r1, r0, #0x18
	adds r6, r0, #0
	cmp r1, #0xf
	ble _0809C74C
	b _0809C742
	.align 2, 0
_0809C704: .4byte gNonGameplayRam
_0809C708:
	movs r2, #0xf
	ldr r1, _0809C748 @ =gNonGameplayRam
	movs r3, #0x91
	lsls r3, r3, #2
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809C73A
	adds r3, r1, #0
_0809C71A:
	lsls r0, r2, #0x18
	movs r1, #0xff
	lsls r1, r1, #0x18
	adds r0, r0, r1
	lsrs r2, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	blt _0809C742
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _0809C71A
_0809C73A:
	lsls r0, r2, #0x18
	adds r6, r0, #0
	cmp r6, #0
	bge _0809C74C
_0809C742:
	movs r0, #0x10
	b _0809C83A
	.align 2, 0
_0809C748: .4byte gNonGameplayRam
_0809C74C:
	movs r0, #0
	str r0, [sp]
	ldr r2, _0809C7A0 @ =0x040000D4
	mov r3, sp
	str r3, [r2]
	asrs r1, r6, #0x18
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r4, r0, #2
	ldr r0, _0809C7A4 @ =0x0300149C
	mov ip, r0
	adds r0, r4, r0
	str r0, [r2, #4]
	ldr r0, _0809C7A8 @ =0x85000009
	str r0, [r2, #8]
	ldr r0, [r2, #8]
	mov r0, ip
	subs r0, #0x18
	adds r2, r4, r0
	mov r1, r8
	strh r1, [r2, #0x18]
	strh r7, [r2, #0x1a]
	adds r0, r2, #0
	adds r0, #0x28
	strb r5, [r0]
	adds r3, r2, #0
	adds r3, #0x2e
	ldrb r1, [r3]
	movs r0, #1
	orrs r1, r0
	strb r1, [r3]
	cmp r5, #1
	bne _0809C7B0
	movs r0, #2
	rsbs r0, r0, #0
	ands r1, r0
	strb r1, [r3]
	mov r0, ip
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809C7AC @ =CutsceneBslExplodingProcessScrolling
	b _0809C836
	.align 2, 0
_0809C7A0: .4byte 0x040000D4
_0809C7A4: .4byte 0x0300149C
_0809C7A8: .4byte 0x85000009
_0809C7AC: .4byte CutsceneBslExplodingProcessScrolling
_0809C7B0:
	cmp r5, #0x14
	bne _0809C7E0
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _0809C7D8 @ =0x08680FFC
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809C7DC @ =unk_9db70
	b _0809C836
	.align 2, 0
_0809C7D8: .4byte 0x08680FFC
_0809C7DC: .4byte unk_9db70
_0809C7E0:
	cmp r5, #0x15
	bne _0809C810
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _0809C808 @ =0x0868100C
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809C80C @ =CutsceneBslExplodingProcessBslFar
	b _0809C836
	.align 2, 0
_0809C808: .4byte 0x0868100C
_0809C80C: .4byte CutsceneBslExplodingProcessBslFar
_0809C810:
	cmp r5, #0x16
	bne _0809C838
	adds r2, #0x30
	ldrb r1, [r2]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x1c
	adds r0, r4, r0
	ldr r1, _0809C848 @ =0x08680ECC
	str r1, [r0]
	mov r0, ip
	adds r0, #0x20
	adds r0, r4, r0
	ldr r1, _0809C84C @ =CutsceneBslExplodingProcessExplosions
_0809C836:
	str r1, [r0]
_0809C838:
	lsrs r0, r6, #0x18
_0809C83A:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0809C848: .4byte 0x08680ECC
_0809C84C: .4byte CutsceneBslExplodingProcessExplosions

	thumb_func_start CutsceneBslExplodingGetOamInfoByType
CutsceneBslExplodingGetOamInfoByType: @ 0x0809C850
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	movs r2, #0
	ldr r7, _0809C880 @ =gNonGameplayRam
_0809C85E:
	lsls r0, r2, #3
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r0, r7
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, r6
	bne _0809C884
	ldrh r0, [r1, #0x18]
	strh r0, [r4]
	ldrh r0, [r1, #0x1a]
	strh r0, [r5]
	ldrh r0, [r1, #0x1c]
	strh r0, [r3]
	adds r0, r2, #0
	b _0809C8A2
	.align 2, 0
_0809C880: .4byte gNonGameplayRam
_0809C884:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xf
	bls _0809C85E
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r1, #0
	strh r0, [r4]
	movs r0, #0xc8
	strh r0, [r5]
	subs r1, #0x2c
	adds r0, r1, #0
	strh r0, [r3]
	movs r0, #0
_0809C8A2:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start CutsceneBslExplodingVblank
CutsceneBslExplodingVblank: @ 0x0809C8A8
	push {lr}
	ldr r3, _0809C8FC @ =0x040000D4
	ldr r0, _0809C900 @ =gOamData
	str r0, [r3]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r3, #4]
	ldr r0, _0809C904 @ =0x84000100
	str r0, [r3, #8]
	ldr r0, [r3, #8]
	ldr r2, _0809C908 @ =0x04000052
	ldr r0, _0809C90C @ =gWrittenToBldalpha_L
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldr r1, _0809C910 @ =gWrittenToBldalpha_R
	ldrh r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0809C914 @ =0x04000054
	ldr r0, _0809C918 @ =gWrittenToBldy
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r1, _0809C91C @ =gNonGameplayRam
	movs r2, #0xa
	ldrsh r0, [r1, r2]
	cmp r0, #1
	bne _0809C8F8
	movs r0, #0
	strh r0, [r1, #0xa]
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	lsls r0, r0, #5
	ldr r1, _0809C920 @ =0x0868101C
	adds r0, r0, r1
	str r0, [r3]
	ldr r0, _0809C924 @ =0x05000120
	str r0, [r3, #4]
	ldr r0, _0809C928 @ =0x84000008
	str r0, [r3, #8]
	ldr r0, [r3, #8]
_0809C8F8:
	pop {r0}
	bx r0
	.align 2, 0
_0809C8FC: .4byte 0x040000D4
_0809C900: .4byte gOamData
_0809C904: .4byte 0x84000100
_0809C908: .4byte 0x04000052
_0809C90C: .4byte gWrittenToBldalpha_L
_0809C910: .4byte gWrittenToBldalpha_R
_0809C914: .4byte 0x04000054
_0809C918: .4byte gWrittenToBldy
_0809C91C: .4byte gNonGameplayRam
_0809C920: .4byte 0x0868101C
_0809C924: .4byte 0x05000120
_0809C928: .4byte 0x84000008

	thumb_func_start unk_9c92c
unk_9c92c: @ 0x0809C92C
	push {lr}
	bl UpdateAudio
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start CutsceneMonologueProcessCursor
CutsceneMonologueProcessCursor: @ 0x0809C938
	push {lr}
	adds r2, r0, #0
	ldr r3, _0809C954 @ =gNonGameplayRam
	ldr r0, [r3, #0xc]
	ldrh r1, [r0]
	movs r0, #0xff
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809C958
	movs r0, #0
	strb r0, [r2, #4]
	strb r0, [r2, #5]
	b _0809C9F4
	.align 2, 0
_0809C954: .4byte gNonGameplayRam
_0809C958:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	beq _0809C9E0
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	beq _0809C9C2
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809C9E0
	ldrb r1, [r2, #9]
	cmp r1, #0
	bne _0809C9B4
	ldr r0, _0809C990 @ =gChangedInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C994
	movs r1, #0
	movs r0, #0x91
	lsls r0, r0, #1
	strh r0, [r2]
	strb r1, [r2, #7]
	strb r1, [r2, #6]
	b _0809C9F4
	.align 2, 0
_0809C990: .4byte gChangedInput
_0809C994:
	ldr r0, _0809C9B0 @ =0x08663E74
	str r0, [r2, #0x10]
	movs r1, #0
	movs r0, #0x76
	strh r0, [r2]
	ldrh r0, [r3, #2]
	lsls r0, r0, #3
	adds r0, #0x18
	strh r0, [r2, #2]
	strb r1, [r2, #7]
	strb r1, [r2, #6]
	movs r0, #1
	strb r0, [r2, #9]
	b _0809C9F4
	.align 2, 0
_0809C9B0: .4byte 0x08663E74
_0809C9B4:
	cmp r1, #1
	bne _0809C9F4
	ldr r0, _0809C9D8 @ =gChangedInput
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0809C9F4
_0809C9C2:
	ldr r0, _0809C9DC @ =0x08663E5C
	str r0, [r2, #0x10]
	movs r1, #0
	movs r0, #0x91
	lsls r0, r0, #1
	strh r0, [r2]
	strb r1, [r2, #7]
	strb r1, [r2, #6]
	strb r1, [r2, #9]
	b _0809C9F4
	.align 2, 0
_0809C9D8: .4byte gChangedInput
_0809C9DC: .4byte 0x08663E5C
_0809C9E0:
	ldrh r0, [r3]
	lsls r0, r0, #3
	ldrb r1, [r3, #0x18]
	adds r1, #0xc
	adds r0, r0, r1
	strh r0, [r2]
	ldrh r0, [r3, #2]
	lsls r0, r0, #3
	adds r0, #0xc
	strh r0, [r2, #2]
_0809C9F4:
	pop {r0}
	bx r0

	thumb_func_start CutsceneMonologueProcessSpecialTextCharacters
CutsceneMonologueProcessSpecialTextCharacters: @ 0x0809C9F8
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r0, _0809CA10 @ =gButtonInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809CA18
	ldr r1, _0809CA14 @ =gNonGameplayRam
	ldrh r0, [r1, #0x10]
	adds r0, #2
	b _0809CA1E
	.align 2, 0
_0809CA10: .4byte gButtonInput
_0809CA14: .4byte gNonGameplayRam
_0809CA18:
	ldr r1, _0809CA40 @ =gNonGameplayRam
	ldrh r0, [r1, #0x10]
	adds r0, #1
_0809CA1E:
	strh r0, [r1, #0x10]
	adds r5, r1, #0
	adds r3, r5, #0
	ldr r0, [r3, #0xc]
	ldrh r2, [r0]
	adds r1, r2, #0
	movs r4, #0xff
	lsls r4, r4, #8
	cmp r1, r4
	bne _0809CA44
	movs r0, #0
	strh r0, [r3, #0x10]
	movs r0, #0x64
	strb r0, [r3, #0x17]
	movs r6, #1
	b _0809CA92
	.align 2, 0
_0809CA40: .4byte gNonGameplayRam
_0809CA44:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809CA64
	ldr r0, _0809CA60 @ =gChangedInput
	ldrh r0, [r0]
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0809CA80
	movs r1, #0
	movs r0, #1
	b _0809CA7E
	.align 2, 0
_0809CA60: .4byte gChangedInput
_0809CA64:
	adds r0, r4, #0
	ands r0, r2
	movs r1, #0xe1
	lsls r1, r1, #8
	cmp r0, r1
	bne _0809CA84
	movs r0, #0xff
	ands r0, r2
	ldrh r1, [r3, #0x10]
	cmp r0, r1
	bhi _0809CA92
	movs r1, #0
	movs r0, #1
_0809CA7E:
	strb r0, [r3, #0x17]
_0809CA80:
	strh r1, [r3, #0x10]
	b _0809CA92
_0809CA84:
	ldrh r0, [r5, #0x10]
	cmp r0, #2
	bls _0809CA92
	movs r1, #0
	movs r0, #1
	strb r0, [r5, #0x17]
	strh r1, [r5, #0x10]
_0809CA92:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start CutsceneMonologueProcessText
CutsceneMonologueProcessText: @ 0x0809CA9C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r5, _0809CB04 @ =gNonGameplayRam
	ldr r2, [r5, #0xc]
	ldrh r3, [r2]
	adds r1, r3, #0
	movs r6, #0xff
	lsls r6, r6, #8
	adds r4, r5, #0
	cmp r1, r6
	bne _0809CAB4
	b _0809CC3A
_0809CAB4:
	movs r0, #0xfe
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809CB08
	ldrh r0, [r4]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1b
	bhi _0809CAEC
	adds r6, r4, #0
	adds r5, #0x1c
	movs r3, #0xff
_0809CACE:
	ldrh r1, [r6, #2]
	lsrs r1, r1, #1
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r0, r0, r5
	ldrb r1, [r0]
	orrs r1, r3
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x1b
	bls _0809CACE
_0809CAEC:
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	ldrh r0, [r4, #2]
	adds r0, #2
	strh r0, [r4, #2]
	ldr r0, [r4, #0xc]
	adds r0, #2
	str r0, [r4, #0xc]
	strb r1, [r4, #0x18]
	b _0809CC3A
	.align 2, 0
_0809CB04: .4byte gNonGameplayRam
_0809CB08:
	movs r0, #0xfd
	lsls r0, r0, #8
	cmp r1, r0
	bne _0809CB84
	movs r2, #0
	str r2, [sp, #4]
	ldr r1, _0809CB6C @ =0x040000D4
	add r0, sp, #4
	str r0, [r1]
	ldr r0, _0809CB70 @ =0x06008000
	str r0, [r1, #4]
	ldr r0, _0809CB74 @ =0x85001200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	movs r3, #0
	strh r2, [r4, #6]
	strh r2, [r4, #4]
	strh r2, [r4, #2]
	strh r2, [r4]
	ldr r0, [r4, #0xc]
	adds r0, #2
	str r0, [r4, #0xc]
	strb r3, [r4, #0x18]
	str r2, [sp, #4]
	add r0, sp, #4
	str r0, [r1]
	adds r0, r4, #0
	adds r0, #0x1c
	str r0, [r1, #4]
	ldr r3, _0809CB78 @ =0x8500003F
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	str r2, [sp, #4]
	add r2, sp, #4
	str r2, [r1]
	movs r2, #0x8c
	lsls r2, r2, #1
	adds r0, r4, r2
	str r0, [r1, #4]
	str r3, [r1, #8]
	ldr r0, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #0x12
	str r0, [r1]
	ldr r0, _0809CB7C @ =0x0600C800
	str r0, [r1, #4]
	ldr r0, _0809CB80 @ =0x84000200
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0809CC3A
	.align 2, 0
_0809CB6C: .4byte 0x040000D4
_0809CB70: .4byte 0x06008000
_0809CB74: .4byte 0x85001200
_0809CB78: .4byte 0x8500003F
_0809CB7C: .4byte 0x0600C800
_0809CB80: .4byte 0x84000200
_0809CB84:
	movs r0, #0xfc
	lsls r0, r0, #8
	cmp r1, r0
	beq _0809CB98
	adds r0, r6, #0
	ands r0, r3
	movs r1, #0xe1
	lsls r1, r1, #8
	cmp r0, r1
	bne _0809CB9E
_0809CB98:
	adds r0, r2, #2
	str r0, [r4, #0xc]
	b _0809CC3A
_0809CB9E:
	ldrh r4, [r5]
	lsls r4, r4, #5
	ldrh r0, [r5, #2]
	lsls r0, r0, #0xa
	adds r4, r4, r0
	ldr r0, _0809CC44 @ =0x06008000
	adds r4, r4, r0
	ldrh r0, [r2]
	bl GetCharacterWidth
	adds r6, r0, #0
	ldr r0, [r5, #0xc]
	ldrh r0, [r0]
	lsls r2, r6, #0x18
	lsrs r2, r2, #0x18
	ldrb r3, [r5, #0x18]
	movs r1, #0
	str r1, [sp]
	adds r1, r4, #0
	bl DrawCharacter
	ldrh r0, [r5]
	cmp r0, #0x1b
	bhi _0809CC32
	ldrh r1, [r5, #2]
	lsrs r1, r1, #1
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r5]
	adds r0, r0, r1
	adds r1, r5, #0
	adds r1, #0x1c
	adds r0, r0, r1
	movs r1, #4
	strb r1, [r0]
	ldrb r0, [r5, #0x18]
	adds r0, r0, r6
	strb r0, [r5, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r5, #0
	cmp r0, #7
	bls _0809CC32
	adds r2, r4, #0
_0809CBF8:
	ldrb r0, [r2, #0x18]
	adds r1, r0, #0
	subs r1, #8
	strb r1, [r2, #0x18]
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1b
	bhi _0809CC32
	lsls r0, r1, #0x18
	cmp r0, #0
	beq _0809CC2C
	ldrh r1, [r2, #2]
	lsrs r1, r1, #1
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #2
	ldrh r1, [r2]
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x1c
	adds r0, r0, r1
	movs r1, #4
	strb r1, [r0]
_0809CC2C:
	ldrb r0, [r2, #0x18]
	cmp r0, #7
	bhi _0809CBF8
_0809CC32:
	ldr r1, _0809CC48 @ =gNonGameplayRam
	ldr r0, [r1, #0xc]
	adds r0, #2
	str r0, [r1, #0xc]
_0809CC3A:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CC44: .4byte 0x06008000
_0809CC48: .4byte gNonGameplayRam

	thumb_func_start unk_9cc4c
unk_9cc4c: @ 0x0809CC4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	ldr r1, _0809CC8C @ =gNonGameplayRam
	ldrh r6, [r1, #4]
	ldrh r0, [r1, #6]
	lsrs r7, r0, #1
	ldrh r0, [r1, #2]
	lsrs r0, r0, #1
	str r1, [sp, #4]
	cmp r7, r0
	bls _0809CC6C
	b _0809CD70
_0809CC6C:
	str r1, [sp]
_0809CC6E:
	ldr r2, [sp]
	ldr r0, [r2, #0xc]
	ldrh r0, [r0]
	movs r3, #0xfc
	lsls r3, r3, #8
	cmp r0, r3
	bne _0809CC90
	ldrh r0, [r1]
	cmp r0, #0x1b
	bhi _0809CCAA
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	b _0809CCAE
	.align 2, 0
_0809CC8C: .4byte gNonGameplayRam
_0809CC90:
	ldrh r0, [r1, #2]
	lsrs r0, r0, #1
	cmp r7, r0
	bne _0809CCAA
	ldr r1, [sp]
	ldrh r0, [r1]
	movs r2, #0x1c
	mov ip, r2
	cmp r0, #0x1b
	bhi _0809CCAE
	adds r3, r0, #0
	mov ip, r3
	b _0809CCAE
_0809CCAA:
	movs r5, #0x1c
	mov ip, r5
_0809CCAE:
	adds r0, r7, #1
	str r0, [sp, #8]
	cmp r6, ip
	bhs _0809CD5C
	ldr r1, _0809CD24 @ =gNonGameplayRam
	mov r8, r1
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #2
	mov sl, r0
	ldr r2, _0809CD28 @ =0x00000FFF
	mov sb, r2
_0809CCC6:
	mov r3, sl
	adds r2, r6, r3
	ldr r5, _0809CD2C @ =0x0300159C
	adds r1, r2, r5
	ldrb r0, [r1]
	cmp r0, #5
	bne _0809CD4E
	movs r0, #0
	strb r0, [r1]
	ldr r0, [sp, #4]
	adds r0, #0x1c
	adds r2, r2, r0
	ldrb r0, [r2]
	subs r1, r0, #1
	strb r1, [r2]
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0809CD38
	lsls r2, r6, #1
	lsls r0, r7, #7
	adds r2, r2, r0
	ldr r0, _0809CD30 @ =0x0600C842
	adds r0, r2, r0
	str r0, [sp, #0xc]
	ldr r1, _0809CD34 @ =0x0600C882
	adds r2, r2, r1
	ldrh r3, [r0]
	ldrh r4, [r2]
	lsrs r0, r3, #0xc
	lsrs r1, r4, #0xc
	subs r0, #1
	lsls r0, r0, #0x10
	subs r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r0, #4
	mov r5, sb
	ands r3, r5
	orrs r0, r3
	ldr r3, [sp, #0xc]
	strh r0, [r3]
	lsrs r1, r1, #4
	ands r4, r5
	orrs r1, r4
	strh r1, [r2]
	b _0809CD52
	.align 2, 0
_0809CD24: .4byte gNonGameplayRam
_0809CD28: .4byte 0x00000FFF
_0809CD2C: .4byte 0x0300159C
_0809CD30: .4byte 0x0600C842
_0809CD34: .4byte 0x0600C882
_0809CD38:
	cmp r0, #0
	bne _0809CD46
	lsls r0, r7, #1
	mov r5, r8
	strh r0, [r5, #6]
	strh r6, [r5, #4]
	b _0809CD52
_0809CD46:
	movs r0, #0xff
	orrs r1, r0
	strb r1, [r2]
	b _0809CD5C
_0809CD4E:
	adds r0, #1
	strb r0, [r1]
_0809CD52:
	adds r0, r6, #1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, ip
	blo _0809CCC6
_0809CD5C:
	movs r6, #0
	ldr r1, [sp, #8]
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	ldr r1, [sp, #4]
	ldrh r0, [r1, #2]
	lsrs r0, r0, #1
	cmp r7, r0
	bhi _0809CD70
	b _0809CC6E
_0809CD70:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CutsceneMonologueFadeIn
CutsceneMonologueFadeIn: @ 0x0809CD80
	push {lr}
	bl CutsceneMonologueProcessOam
	bl CutsceneMonologueDrawAllOam
	ldr r3, _0809CDAC @ =gWrittenToBldy
	ldrh r2, [r3]
	adds r0, r2, #0
	cmp r0, #0
	beq _0809CDD0
	cmp r0, #0xb
	bls _0809CDB4
	ldr r1, _0809CDB0 @ =gNonGameplayRam
	ldrb r0, [r1, #0x16]
	adds r0, #1
	strb r0, [r1, #0x16]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0809CDD0
	b _0809CDC8
	.align 2, 0
_0809CDAC: .4byte gWrittenToBldy
_0809CDB0: .4byte gNonGameplayRam
_0809CDB4:
	cmp r0, #6
	bls _0809CDCC
	ldr r1, _0809CDD4 @ =gNonGameplayRam
	ldrb r0, [r1, #0x16]
	adds r0, #1
	strb r0, [r1, #0x16]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0809CDD0
_0809CDC8:
	movs r0, #0
	strb r0, [r1, #0x16]
_0809CDCC:
	subs r0, r2, #1
	strh r0, [r3]
_0809CDD0:
	pop {r0}
	bx r0
	.align 2, 0
_0809CDD4: .4byte gNonGameplayRam

	thumb_func_start CutsceneMonologueFadeOut
CutsceneMonologueFadeOut: @ 0x0809CDD8
	push {lr}
	bl CutsceneMonologueProcessOam
	bl CutsceneMonologueDrawAllOam
	ldr r3, _0809CE04 @ =gWrittenToBldy
	ldrh r2, [r3]
	adds r0, r2, #0
	cmp r0, #0xf
	bhi _0809CE28
	cmp r0, #5
	bhi _0809CE0C
	ldr r1, _0809CE08 @ =gNonGameplayRam
	ldrb r0, [r1, #0x16]
	adds r0, #1
	strb r0, [r1, #0x16]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _0809CE28
	b _0809CE20
	.align 2, 0
_0809CE04: .4byte gWrittenToBldy
_0809CE08: .4byte gNonGameplayRam
_0809CE0C:
	cmp r0, #0xa
	bhi _0809CE24
	ldr r1, _0809CE2C @ =gNonGameplayRam
	ldrb r0, [r1, #0x16]
	adds r0, #1
	strb r0, [r1, #0x16]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0809CE28
_0809CE20:
	movs r0, #0
	strb r0, [r1, #0x16]
_0809CE24:
	adds r0, r2, #1
	strh r0, [r3]
_0809CE28:
	pop {r0}
	bx r0
	.align 2, 0
_0809CE2C: .4byte gNonGameplayRam

	thumb_func_start CutsceneMonologueProcessOam
CutsceneMonologueProcessOam: @ 0x0809CE30
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _0809CE70 @ =gNonGameplayRam
	movs r0, #0x85
	lsls r0, r0, #2
	adds r6, r5, r0
_0809CE3C:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r2, r0, #3
	adds r0, r2, r5
	movs r1, #0x86
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809CE60
	movs r0, #0x8a
	lsls r0, r0, #2
	adds r1, r5, r0
	adds r1, r2, r1
	adds r0, r2, r6
	ldr r1, [r1]
	bl _call_via_r1
_0809CE60:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0809CE3C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CE70: .4byte gNonGameplayRam

	thumb_func_start CutsceneMonologueDrawAllOam
CutsceneMonologueDrawAllOam: @ 0x0809CE74
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _0809CEB4 @ =gNonGameplayRam
	movs r0, #0x85
	lsls r0, r0, #2
	adds r6, r5, r0
_0809CE80:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r1, r0, #3
	adds r0, r1, r5
	ldr r2, _0809CEB8 @ =0x00000219
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809CE98
	adds r0, r1, r6
	bl CutsceneMnologueDrawOam
_0809CE98:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #4
	bls _0809CE80
	bl ResetFreeOam
	ldr r1, _0809CEBC @ =gNextOamSlot
	movs r0, #0
	strb r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809CEB4: .4byte gNonGameplayRam
_0809CEB8: .4byte 0x00000219
_0809CEBC: .4byte gNextOamSlot

	thumb_func_start CutsceneMnologueDrawOam
CutsceneMnologueDrawOam: @ 0x0809CEC0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r2, _0809CF80 @ =gNextOamSlot
	ldrb r0, [r2]
	lsls r0, r0, #3
	ldr r1, _0809CF84 @ =gOamData
	adds r7, r0, r1
	ldrb r4, [r5, #6]
	lsls r1, r4, #3
	ldr r0, [r5, #0x10]
	adds r3, r0, r1
	ldrb r0, [r3, #4]
	ldrb r2, [r5, #7]
	cmp r0, r2
	bne _0809CEF0
	adds r0, r4, #1
	movs r1, #0
	strb r0, [r5, #6]
	strb r1, [r5, #7]
	adds r3, #8
_0809CEF0:
	ldrb r1, [r3, #4]
	cmp r1, #0
	bne _0809CEFE
	ldrb r0, [r5, #6]
	lsls r0, r0, #3
	subs r3, r3, r0
	strb r1, [r5, #6]
_0809CEFE:
	ldr r6, [r3]
	ldrh r3, [r6]
	mov sl, r3
	adds r6, #2
	movs r4, #0
	mov sb, r4
	cmp sb, sl
	blt _0809CF10
	b _0809D014
_0809CF10:
	ldrh r0, [r6]
	mov r8, r0
	adds r6, #2
	ldrh r1, [r6]
	mov ip, r1
	adds r6, #2
	strh r0, [r7]
	adds r7, #2
	strh r1, [r7]
	adds r7, #2
	ldrh r0, [r6]
	strh r0, [r7]
	adds r6, #2
	adds r7, #2
	ldr r2, _0809CF80 @ =gNextOamSlot
	ldrb r0, [r2]
	mov r4, sb
	adds r3, r0, r4
	ldrb r1, [r5, #0xc]
	cmp r1, #1
	bne _0809CF90
	lsls r4, r3, #3
	ldr r0, _0809CF84 @ =gOamData
	adds r2, r4, r0
	ldrb r3, [r2, #3]
	lsls r0, r3, #0x1b
	lsrs r0, r0, #0x1f
	eors r0, r1
	movs r1, #1
	ands r0, r1
	lsls r0, r0, #4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #3]
	lsrs r1, r1, #6
	ldrb r0, [r2, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r2, _0809CF88 @ =0x0868279C
	adds r1, r1, r2
	ldrb r0, [r1]
	lsls r0, r0, #3
	add r0, ip
	ldrh r1, [r5]
	subs r2, r1, r0
	ldr r3, _0809CF8C @ =0x000001FF
	ands r2, r3
	ldrh r0, [r5, #2]
	mov r3, r8
	adds r1, r3, r0
	movs r0, #0xff
	ands r1, r0
	b _0809CFA6
	.align 2, 0
_0809CF80: .4byte gNextOamSlot
_0809CF84: .4byte gOamData
_0809CF88: .4byte 0x0868279C
_0809CF8C: .4byte 0x000001FF
_0809CF90:
	ldrh r0, [r5, #2]
	mov r4, r8
	adds r1, r4, r0
	movs r0, #0xff
	ands r1, r0
	ldrh r0, [r5]
	mov r4, ip
	adds r2, r4, r0
	ldr r0, _0809D030 @ =0x000001FF
	ands r2, r0
	lsls r4, r3, #3
_0809CFA6:
	ldr r0, _0809D034 @ =gOamData
	adds r3, r4, r0
	strb r1, [r3]
	ldr r1, _0809D030 @ =0x000001FF
	ands r2, r1
	ldrh r1, [r3, #2]
	ldr r0, _0809D038 @ =0xFFFFFE00
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #2]
	ldrb r1, [r5, #0xb]
	movs r2, #3
	ands r1, r2
	lsls r1, r1, #2
	ldrb r2, [r3, #5]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #5]
	lsrs r2, r0, #4
	ldrb r4, [r5, #0xd]
	adds r2, r2, r4
	lsls r2, r2, #4
	movs r1, #0xf
	ands r0, r1
	orrs r0, r2
	strb r0, [r3, #5]
	ldrh r2, [r3, #4]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x16
	ldrh r0, [r5, #0xe]
	adds r1, r1, r0
	ldr r4, _0809D03C @ =0x000003FF
	adds r0, r4, #0
	ands r1, r0
	ldr r0, _0809D040 @ =0xFFFFFC00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldrb r1, [r5, #0xa]
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r3, #1]
	subs r0, #0x10
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	adds r7, #2
	movs r1, #1
	add sb, r1
	cmp sb, sl
	bge _0809D014
	b _0809CF10
_0809D014:
	ldr r2, _0809D044 @ =gNextOamSlot
	ldrb r0, [r2]
	add r0, sl
	strb r0, [r2]
	ldrb r0, [r5, #7]
	adds r0, #1
	strb r0, [r5, #7]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D030: .4byte 0x000001FF
_0809D034: .4byte gOamData
_0809D038: .4byte 0xFFFFFE00
_0809D03C: .4byte 0x000003FF
_0809D040: .4byte 0xFFFFFC00
_0809D044: .4byte gNextOamSlot

	thumb_func_start CutsceneMonologueResetOam
CutsceneMonologueResetOam: @ 0x0809D048
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0809D08C @ =gNonGameplayRam
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	ldr r2, _0809D090 @ =0x0000021A
	adds r0, r1, r2
	movs r2, #0
	strb r2, [r0]
	ldr r3, _0809D094 @ =0x0000021B
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, #2
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, #1
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, #1
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, #1
	adds r0, r1, r3
	strb r2, [r0]
	adds r3, #1
	adds r0, r1, r3
	strb r2, [r0]
	ldr r0, _0809D098 @ =0x00000222
	adds r1, r1, r0
	strh r2, [r1]
	bx lr
	.align 2, 0
_0809D08C: .4byte gNonGameplayRam
_0809D090: .4byte 0x0000021A
_0809D094: .4byte 0x0000021B
_0809D098: .4byte 0x00000222

	thumb_func_start unk_9d09c
unk_9d09c: @ 0x0809D09C
	bx lr
	.align 2, 0

	thumb_func_start unk_9d0a0
unk_9d0a0: @ 0x0809D0A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r1, _0809D0E4 @ =0x040000D4
	ldr r0, _0809D0E8 @ =0x02001000
	str r0, [r1]
	ldr r0, _0809D0EC @ =0x02002000
	str r0, [r1, #4]
	ldr r0, _0809D0F0 @ =0x84000054
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r3, _0809D0F4 @ =gNonGameplayRam
	ldrh r0, [r3, #0xe]
	ldrh r2, [r3, #0xa]
	subs r1, r0, r2
	lsls r1, r1, #0x10
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsrs r2, r1, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0
	bge _0809D0F8
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r1, #0xa
	ldrsh r0, [r3, r1]
	lsls r0, r0, #1
	movs r2, #0
	cmp r5, r0
	ble _0809D0FA
	movs r2, #0xa1
	b _0809D0FA
	.align 2, 0
_0809D0E4: .4byte 0x040000D4
_0809D0E8: .4byte 0x02001000
_0809D0EC: .4byte 0x02002000
_0809D0F0: .4byte 0x84000054
_0809D0F4: .4byte gNonGameplayRam
_0809D0F8:
	movs r5, #0
_0809D0FA:
	lsls r0, r7, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x9f
	ble _0809D104
	movs r7, #0xa0
_0809D104:
	ldr r0, _0809D1B8 @ =0x083E3294
	movs r4, #0xa
	ldrsh r1, [r3, r4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	mov ip, r1
	ldr r4, _0809D1BC @ =0x02001000
	movs r6, #0
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	lsls r2, r7, #0x10
	cmp r6, r0
	bge _0809D138
	movs r7, #0
	adds r1, r0, #0
_0809D124:
	strh r7, [r4]
	adds r4, #2
	lsls r0, r6, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r1
	blt _0809D124
_0809D138:
	lsls r0, r6, #0x10
	asrs r1, r2, #0x10
	cmp r0, r2
	bgt _0809D192
	ldr r0, _0809D1C0 @ =gNonGameplayRam
	mov r8, r0
	adds r7, r1, #0
_0809D146:
	lsls r0, r5, #2
	add r0, ip
	mov r2, r8
	ldrh r1, [r2, #0xc]
	ldrh r2, [r0, #2]
	adds r2, r1, r2
	lsls r2, r2, #0x10
	ldrh r0, [r0]
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r3, r1, #0x10
	lsrs r1, r2, #0x10
	cmp r2, #0
	bge _0809D164
	movs r1, #0
_0809D164:
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf0
	ble _0809D16E
	movs r3, #0xf0
_0809D16E:
	lsls r1, r1, #0x10
	asrs r1, r1, #8
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	orrs r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r0, r6, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r0, r0, r3
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r7
	ble _0809D146
_0809D192:
	lsls r1, r6, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	bgt _0809D1AC
	movs r2, #0
_0809D19C:
	strh r2, [r4]
	adds r4, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r1, r1, r0
	asrs r0, r1, #0x10
	cmp r0, #0x9f
	ble _0809D19C
_0809D1AC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D1B8: .4byte 0x083E3294
_0809D1BC: .4byte 0x02001000
_0809D1C0: .4byte gNonGameplayRam

	thumb_func_start unk_9d1c4
unk_9d1c4: @ 0x0809D1C4
	ldr r0, _0809D1D8 @ =0x04000006
	ldrh r0, [r0]
	ldr r1, _0809D1DC @ =0x04000040
	lsls r0, r0, #0x10
	asrs r0, r0, #0xf
	ldr r2, _0809D1E0 @ =0x02002000
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0809D1D8: .4byte 0x04000006
_0809D1DC: .4byte 0x04000040
_0809D1E0: .4byte 0x02002000

	thumb_func_start CutsceneMonologueDestroyOamOfType
CutsceneMonologueDestroyOamOfType: @ 0x0809D1E4
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r6, _0809D214 @ =gNonGameplayRam
	movs r7, #2
	rsbs r7, r7, #0
	movs r5, #0
_0809D1F4:
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r6
	adds r1, r2, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, r4
	bne _0809D218
	strb r5, [r1]
	adds r2, #0x2e
	ldrb r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	strb r0, [r2]
	b _0809D222
	.align 2, 0
_0809D214: .4byte gNonGameplayRam
_0809D218:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0809D1F4
_0809D222:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CutsceneFadeIn
CutsceneFadeIn: @ 0x0809D228
	push {lr}
	bl CutsceneProcessOam
	bl CutsceneDrawAllOam
	ldr r1, _0809D244 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0
	beq _0809D23E
	subs r0, #1
	strh r0, [r1]
_0809D23E:
	pop {r0}
	bx r0
	.align 2, 0
_0809D244: .4byte gWrittenToBldy

	thumb_func_start CutsceneFadeOut
CutsceneFadeOut: @ 0x0809D248
	push {lr}
	bl CutsceneProcessOam
	bl CutsceneDrawAllOam
	ldr r1, _0809D264 @ =gWrittenToBldy
	ldrh r0, [r1]
	cmp r0, #0xf
	bhi _0809D25E
	adds r0, #1
	strh r0, [r1]
_0809D25E:
	pop {r0}
	bx r0
	.align 2, 0
_0809D264: .4byte gWrittenToBldy

	thumb_func_start CutsceneDestroyOamOfType
CutsceneDestroyOamOfType: @ 0x0809D268
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	movs r3, #0
	ldr r6, _0809D298 @ =gNonGameplayRam
	movs r7, #2
	rsbs r7, r7, #0
	movs r5, #0
_0809D278:
	lsls r0, r3, #3
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r2, r0, r6
	adds r1, r2, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, r4
	bne _0809D29C
	strb r5, [r1]
	adds r2, #0x2e
	ldrb r1, [r2]
	adds r0, r7, #0
	ands r0, r1
	strb r0, [r2]
	b _0809D2A6
	.align 2, 0
_0809D298: .4byte gNonGameplayRam
_0809D29C:
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0xf
	bls _0809D278
_0809D2A6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start CutsceneProcessOam
CutsceneProcessOam: @ 0x0809D2AC
	push {r4, r5, lr}
	ldr r1, _0809D2F0 @ =gNonGameplayRam
	movs r0, #0
	strb r0, [r1, #0x12]
	movs r5, #0
	adds r4, r1, #0
_0809D2B8:
	lsls r0, r5, #3
	adds r0, r0, r5
	lsls r2, r0, #2
	adds r0, r2, r4
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809D2E0
	adds r1, r4, #0
	adds r1, #0x38
	adds r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x18
	adds r0, r2, r0
	ldr r1, [r1]
	bl _call_via_r1
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
_0809D2E0:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xf
	bls _0809D2B8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D2F0: .4byte gNonGameplayRam

	thumb_func_start CutsceneDrawAllOam
CutsceneDrawAllOam: @ 0x0809D2F4
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r5, _0809D334 @ =gNonGameplayRam
	adds r6, r5, #0
	adds r6, #0x18
_0809D2FE:
	lsls r0, r4, #3
	adds r0, r0, r4
	lsls r1, r0, #2
	adds r0, r1, r5
	adds r0, #0x2e
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0809D316
	adds r0, r1, r6
	bl CutsceneDrawOam
_0809D316:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #0xf
	bls _0809D2FE
	bl ResetFreeOam
	ldr r0, _0809D338 @ =gNextOamSlot
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0809D33C @ =0x03001238
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809D334: .4byte gNonGameplayRam
_0809D338: .4byte gNextOamSlot
_0809D33C: .4byte 0x03001238

	thumb_func_start CutsceneDrawOam
CutsceneDrawOam: @ 0x0809D340
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	mov r8, r0
	ldr r3, _0809D438 @ =gNextOamSlot
	ldrb r0, [r3]
	lsls r0, r0, #3
	ldr r2, _0809D43C @ =gOamData
	adds r0, r0, r2
	mov ip, r0
	mov r0, r8
	ldrb r5, [r0, #0x11]
	lsls r1, r5, #3
	ldr r0, [r0, #0x1c]
	adds r4, r0, r1
	ldrb r0, [r4, #4]
	mov r1, r8
	ldrb r1, [r1, #0x12]
	cmp r0, r1
	bne _0809D37A
	adds r0, r5, #1
	movs r1, #0
	mov r2, r8
	strb r0, [r2, #0x11]
	strb r1, [r2, #0x12]
	adds r4, #8
_0809D37A:
	ldrb r1, [r4, #4]
	cmp r1, #0
	bne _0809D38A
	mov r3, r8
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #3
	subs r4, r4, r0
	strb r1, [r3, #0x11]
_0809D38A:
	ldr r4, [r4]
	mov sl, r4
	ldrh r4, [r4]
	str r4, [sp, #0x18]
	movs r0, #2
	add sl, r0
	mov r2, r8
	ldrb r1, [r2, #0x16]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _0809D3A4
	b _0809D504
_0809D3A4:
	movs r3, #0
	str r3, [sp, #0x14]
	cmp r3, r4
	blt _0809D3AE
	b _0809DB26
_0809D3AE:
	ldr r4, _0809D440 @ =0x000001FF
	adds r6, r4, #0
	movs r0, #3
	mov sb, r0
_0809D3B6:
	mov r1, sl
	ldrh r5, [r1]
	movs r2, #2
	add sl, r2
	mov r3, sl
	ldrh r7, [r3]
	add sl, r2
	mov r4, ip
	strh r5, [r4]
	add ip, r2
	mov r0, ip
	strh r7, [r0]
	add ip, r2
	mov r1, sl
	ldrh r0, [r1]
	mov r2, ip
	strh r0, [r2]
	movs r3, #2
	add sl, r3
	add ip, r3
	ldr r4, _0809D438 @ =gNextOamSlot
	ldrb r0, [r4]
	ldr r1, [sp, #0x14]
	adds r3, r0, r1
	mov r2, r8
	ldrb r0, [r2, #0x16]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x1f
	cmp r1, #1
	bne _0809D448
	lsls r4, r3, #3
	ldr r3, _0809D43C @ =gOamData
	adds r2, r4, r3
	ldrb r3, [r2, #3]
	lsls r0, r3, #0x1b
	lsrs r0, r0, #0x1f
	eors r0, r1
	lsls r0, r0, #4
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #3]
	lsrs r1, r1, #6
	ldrb r0, [r2, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r0, _0809D444 @ =0x0863A184
	adds r1, r1, r0
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r0, r7, r0
	mov r2, r8
	ldrh r1, [r2]
	subs r0, r1, r0
	ands r0, r6
	str r0, [sp]
	ldrh r0, [r2, #2]
	adds r5, r5, r0
	movs r0, #0xff
	ands r5, r0
	str r5, [sp, #4]
	b _0809D45E
	.align 2, 0
_0809D438: .4byte gNextOamSlot
_0809D43C: .4byte gOamData
_0809D440: .4byte 0x000001FF
_0809D444: .4byte 0x0863A184
_0809D448:
	mov r4, r8
	ldrh r0, [r4, #2]
	adds r5, r5, r0
	movs r0, #0xff
	ands r5, r0
	str r5, [sp, #4]
	ldrh r0, [r4]
	adds r0, r7, r0
	ands r0, r6
	str r0, [sp]
	lsls r4, r3, #3
_0809D45E:
	ldr r0, _0809D4F4 @ =gOamData
	adds r3, r4, r0
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r3]
	ldr r2, [sp]
	ands r2, r6
	ldrh r1, [r3, #2]
	ldr r0, _0809D4F8 @ =0xFFFFFE00
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #2]
	mov r4, r8
	ldrb r0, [r4, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #2
	ldrb r2, [r3, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #5]
	lsrs r2, r1, #4
	ldrb r0, [r4, #0x18]
	lsrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #4
	movs r0, #0xf
	ands r1, r0
	orrs r1, r2
	strb r1, [r3, #5]
	ldrh r5, [r3, #4]
	lsls r2, r5, #0x16
	lsrs r2, r2, #0x16
	ldrb r4, [r4, #0x17]
	mov r1, r8
	ldrb r0, [r1, #0x18]
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r4
	adds r2, r2, r0
	ldr r4, _0809D4FC @ =0x000003FF
	adds r0, r4, #0
	ands r2, r0
	ldr r0, _0809D500 @ =0xFFFFFC00
	ands r0, r5
	orrs r0, r2
	strh r0, [r3, #4]
	mov r0, r8
	ldrb r1, [r0, #0x16]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1e
	mov r2, sb
	ands r1, r2
	lsls r1, r1, #2
	ldrb r2, [r3, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	movs r3, #2
	add ip, r3
	ldr r4, [sp, #0x14]
	adds r4, #1
	str r4, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r4, r0
	bge _0809D4F2
	b _0809D3B6
_0809D4F2:
	b _0809DB26
	.align 2, 0
_0809D4F4: .4byte gOamData
_0809D4F8: .4byte 0xFFFFFE00
_0809D4FC: .4byte 0x000003FF
_0809D500: .4byte 0xFFFFFC00
_0809D504:
	cmp r0, #1
	beq _0809D50A
	b _0809D7D4
_0809D50A:
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r2, #2]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r1, #0x19
	cmp r0, #0
	blt _0809D52C
	ldrh r3, [r2, #4]
	str r3, [sp, #0xc]
	b _0809D538
_0809D52C:
	mov r4, r8
	ldrh r0, [r4, #4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_0809D538:
	lsls r0, r1, #0x18
	cmp r0, #0
	blt _0809D544
	mov r0, r8
	ldrh r0, [r0, #4]
	b _0809D54E
_0809D544:
	mov r1, r8
	ldrh r0, [r1, #4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_0809D54E:
	str r0, [sp, #0x10]
	movs r2, #0
	b _0809D782
_0809D554:
	mov r4, sl
	ldrh r5, [r4]
	movs r0, #2
	add sl, r0
	mov r1, sl
	ldrh r7, [r1]
	add sl, r0
	mov r2, ip
	strh r5, [r2]
	add ip, r0
	mov r3, ip
	strh r7, [r3]
	add ip, r0
	mov r4, sl
	ldrh r0, [r4]
	mov r1, ip
	strh r0, [r1]
	movs r2, #2
	add sl, r2
	add ip, r2
	ldr r3, _0809D7AC @ =gNextOamSlot
	ldrb r0, [r3]
	ldr r4, [sp, #0x14]
	adds r3, r0, r4
	lsls r0, r3, #3
	ldr r1, _0809D7B0 @ =gOamData
	adds r6, r0, r1
	ldrb r2, [r6, #3]
	mov sb, r2
	mov r3, sb
	lsrs r1, r3, #6
	ldrb r0, [r6, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r4, _0809D7B4 @ =0x0863A184
	adds r0, r1, r4
	ldrb r2, [r0]
	ldr r0, _0809D7B8 @ =0x0863A190
	adds r1, r1, r0
	ldrb r3, [r1]
	ldr r1, [sp, #4]
	adds r5, r5, r1
	movs r0, #0xff
	ands r5, r0
	ldr r0, [sp]
	adds r4, r7, r0
	ldr r1, _0809D7BC @ =0x000001FF
	adds r0, r1, #0
	ands r4, r0
	ldr r0, [sp]
	subs r1, r4, r0
	lsls r2, r2, #2
	str r2, [sp, #0x1c]
	adds r1, r2, r1
	ldr r0, [sp, #4]
	subs r2, r5, r0
	lsls r3, r3, #2
	str r3, [sp, #0x20]
	adds r2, r3, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0xc]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	adds r0, r1, #0
	muls r0, r3, r0
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, sb
	lsls r0, r1, #0x1b
	cmp r0, #0
	bge _0809D612
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #3]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_0809D612:
	ldrb r1, [r6, #3]
	lsls r0, r1, #0x1a
	cmp r0, #0
	bge _0809D62A
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #3]
	rsbs r0, r7, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0809D62A:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, [sp]
	subs r4, r4, r0
	ldr r1, [sp, #0x1c]
	adds r4, r1, r4
	ldr r2, [sp, #4]
	subs r3, r5, r2
	ldr r0, [sp, #0x20]
	adds r3, r0, r3
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r8
	ldrb r1, [r2, #0x15]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r2, _0809D7C0 @ =sSineTable
	adds r0, r0, r2
	movs r2, #0
	ldrsh r5, [r0, r2]
	adds r2, r4, #0
	muls r2, r5, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #1
	ldr r0, _0809D7C0 @ =sSineTable
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r3, #0
	muls r0, r1, r0
	subs r2, r2, r0
	lsls r2, r2, #8
	adds r0, r4, #0
	muls r0, r1, r0
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	asrs r2, r2, #0x10
	ldr r1, [sp, #0x1c]
	subs r2, r2, r1
	asrs r0, r0, #0x10
	ldr r3, [sp, #0x20]
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r4, [sp, #4]
	adds r0, r5, r4
	subs r0, #0x40
	strb r0, [r6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r0, [sp]
	adds r2, r2, r0
	subs r2, #0x40
	ldr r0, _0809D7BC @ =0x000001FF
	ands r2, r0
	ldrh r1, [r6, #2]
	ldr r0, _0809D7C4 @ =0xFFFFFE00
	ands r0, r1
	orrs r0, r2
	strh r0, [r6, #2]
	ldrb r1, [r6, #1]
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r6, #1]
	ldr r2, _0809D7C8 @ =0x03001238
	ldrb r1, [r2]
	movs r2, #0x10
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809D6E8
	ldrb r0, [r6, #3]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r6, #3]
_0809D6E8:
	ldr r3, _0809D7C8 @ =0x03001238
	ldrb r1, [r3]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0809D6FA
	ldrb r0, [r6, #3]
	orrs r0, r2
	strb r0, [r6, #3]
_0809D6FA:
	ldr r4, _0809D7C8 @ =0x03001238
	ldrb r0, [r4]
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r6, #3]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #3]
	mov r1, r8
	ldrb r0, [r1, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #2
	ldrb r2, [r6, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #5]
	lsrs r2, r1, #4
	mov r3, r8
	ldrb r0, [r3, #0x18]
	lsrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #4
	movs r0, #0xf
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, #5]
	ldrh r4, [r6, #4]
	lsls r2, r4, #0x16
	lsrs r2, r2, #0x16
	ldrb r3, [r3, #0x17]
	mov r1, r8
	ldrb r0, [r1, #0x18]
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r3
	adds r2, r2, r0
	ldr r3, _0809D7CC @ =0x000003FF
	adds r0, r3, #0
	ands r2, r0
	ldr r0, _0809D7D0 @ =0xFFFFFC00
	ands r0, r4
	orrs r0, r2
	strh r0, [r6, #4]
	mov r4, r8
	ldrb r1, [r4, #0x16]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1e
	movs r0, #3
	ands r1, r0
	lsls r1, r1, #2
	ldrb r2, [r6, #1]
	subs r0, #0x10
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #1]
	movs r1, #2
	add ip, r1
	ldr r2, [sp, #0x14]
	adds r2, #1
_0809D782:
	str r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	cmp r2, r3
	bge _0809D78C
	b _0809D554
_0809D78C:
	ldr r4, _0809D7C8 @ =0x03001238
	ldrb r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x18
	mov r1, r8
	ldrb r0, [r1, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r2, _0809D7C0 @ =sSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r5, [r0, r3]
	ldr r0, [sp, #0xc]
	lsls r4, r0, #0x10
	b _0809DA7E
	.align 2, 0
_0809D7AC: .4byte gNextOamSlot
_0809D7B0: .4byte gOamData
_0809D7B4: .4byte 0x0863A184
_0809D7B8: .4byte 0x0863A190
_0809D7BC: .4byte 0x000001FF
_0809D7C0: .4byte sSineTable
_0809D7C4: .4byte 0xFFFFFE00
_0809D7C8: .4byte 0x03001238
_0809D7CC: .4byte 0x000003FF
_0809D7D0: .4byte 0xFFFFFC00
_0809D7D4:
	cmp r0, #3
	beq _0809D7DA
	b _0809DB26
_0809D7DA:
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r3, #2]
	adds r0, #0x40
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r1, #0x19
	cmp r0, #0
	blt _0809D7FC
	ldrh r4, [r3, #4]
	str r4, [sp, #0xc]
	b _0809D808
_0809D7FC:
	mov r2, r8
	ldrh r0, [r2, #4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_0809D808:
	lsls r0, r1, #0x18
	cmp r0, #0
	blt _0809D816
	mov r3, r8
	ldrh r3, [r3, #4]
	str r3, [sp, #0x10]
	b _0809D822
_0809D816:
	mov r4, r8
	ldrh r0, [r4, #4]
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0809D822:
	movs r0, #0
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	cmp r0, r1
	blt _0809D82E
	b _0809DA62
_0809D82E:
	mov r2, sl
	ldrh r5, [r2]
	movs r3, #2
	add sl, r3
	mov r4, sl
	ldrh r7, [r4]
	add sl, r3
	mov r0, ip
	strh r5, [r0]
	add ip, r3
	mov r1, ip
	strh r7, [r1]
	add ip, r3
	mov r2, sl
	ldrh r0, [r2]
	mov r3, ip
	strh r0, [r3]
	movs r4, #2
	add sl, r4
	add ip, r4
	ldr r1, _0809DB48 @ =gNextOamSlot
	ldrb r0, [r1]
	ldr r2, [sp, #0x14]
	adds r3, r0, r2
	lsls r0, r3, #3
	ldr r3, _0809DB4C @ =gOamData
	adds r6, r0, r3
	ldrb r4, [r6, #3]
	mov sb, r4
	mov r0, sb
	lsrs r1, r0, #6
	ldrb r0, [r6, #1]
	lsrs r0, r0, #6
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r2, _0809DB50 @ =0x0863A184
	adds r0, r1, r2
	ldrb r2, [r0]
	ldr r3, _0809DB54 @ =0x0863A190
	adds r1, r1, r3
	ldrb r3, [r1]
	ldr r4, [sp, #4]
	adds r5, r5, r4
	movs r0, #0xff
	ands r5, r0
	ldr r0, [sp]
	adds r4, r7, r0
	ldr r1, _0809DB58 @ =0x000001FF
	adds r0, r1, #0
	ands r4, r0
	ldr r0, [sp]
	subs r1, r4, r0
	lsls r2, r2, #2
	str r2, [sp, #0x24]
	adds r1, r2, r1
	ldr r0, [sp, #4]
	subs r2, r5, r0
	lsls r3, r3, #2
	str r3, [sp, #0x28]
	adds r2, r3, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #0xc]
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	adds r0, r1, #0
	muls r0, r3, r0
	asrs r0, r0, #8
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #8]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, [sp, #0x10]
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	adds r0, r2, #0
	muls r0, r7, r0
	asrs r0, r0, #8
	subs r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, sb
	lsls r0, r1, #0x1b
	cmp r0, #0
	bge _0809D8EC
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #3]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
_0809D8EC:
	ldrb r1, [r6, #3]
	lsls r0, r1, #0x1a
	cmp r0, #0
	bge _0809D904
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #3]
	rsbs r0, r7, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0809D904:
	lsls r1, r4, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #8]
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r0, r2, #0x10
	asrs r0, r0, #0x10
	adds r1, r1, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	ldr r0, [sp]
	subs r4, r4, r0
	ldr r1, [sp, #0x24]
	adds r4, r1, r4
	ldr r2, [sp, #4]
	subs r3, r5, r2
	ldr r0, [sp, #0x28]
	adds r3, r0, r3
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, r8
	ldrb r1, [r2, #0x15]
	adds r0, r1, #0
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r2, _0809DB5C @ =sSineTable
	adds r0, r0, r2
	movs r2, #0
	ldrsh r5, [r0, r2]
	adds r2, r4, #0
	muls r2, r5, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	lsls r1, r1, #1
	ldr r0, _0809DB5C @ =sSineTable
	adds r1, r1, r0
	movs r0, #0
	ldrsh r1, [r1, r0]
	adds r0, r3, #0
	muls r0, r1, r0
	subs r2, r2, r0
	lsls r2, r2, #8
	adds r0, r4, #0
	muls r0, r1, r0
	adds r1, r3, #0
	muls r1, r5, r1
	adds r0, r0, r1
	lsls r0, r0, #8
	ldr r3, [sp, #0x24]
	lsls r1, r3, #1
	asrs r2, r2, #0x10
	subs r2, r2, r1
	ldr r4, [sp, #0x28]
	lsls r1, r4, #1
	asrs r0, r0, #0x10
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r1, [sp, #4]
	adds r0, r5, r1
	subs r0, #0x40
	strb r0, [r6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, [sp]
	adds r2, r2, r3
	subs r2, #0x40
	ldr r0, _0809DB58 @ =0x000001FF
	ands r2, r0
	ldrh r1, [r6, #2]
	ldr r0, _0809DB60 @ =0xFFFFFE00
	ands r0, r1
	orrs r0, r2
	strh r0, [r6, #2]
	ldrb r0, [r6, #1]
	movs r5, #3
	orrs r0, r5
	strb r0, [r6, #1]
	ldr r4, _0809DB64 @ =0x03001238
	ldrb r1, [r4]
	movs r2, #0x10
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809D9C0
	ldrb r0, [r6, #3]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r6, #3]
_0809D9C0:
	ldr r0, _0809DB64 @ =0x03001238
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0809D9D2
	ldrb r0, [r6, #3]
	orrs r0, r2
	strb r0, [r6, #3]
_0809D9D2:
	ldr r1, _0809DB64 @ =0x03001238
	ldrb r0, [r1]
	movs r1, #7
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r6, #3]
	movs r0, #0xf
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #3]
	mov r2, r8
	ldrb r0, [r2, #0x18]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r6, #5]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r6, #5]
	lsrs r2, r1, #4
	mov r3, r8
	ldrb r0, [r3, #0x18]
	lsrs r0, r0, #4
	adds r2, r2, r0
	lsls r2, r2, #4
	movs r0, #0xf
	ands r1, r0
	orrs r1, r2
	strb r1, [r6, #5]
	ldrh r4, [r6, #4]
	lsls r2, r4, #0x16
	lsrs r2, r2, #0x16
	ldrb r3, [r3, #0x17]
	mov r1, r8
	ldrb r0, [r1, #0x18]
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #8
	orrs r0, r3
	adds r2, r2, r0
	ldr r3, _0809DB68 @ =0x000003FF
	adds r0, r3, #0
	ands r2, r0
	ldr r0, _0809DB6C @ =0xFFFFFC00
	ands r0, r4
	orrs r0, r2
	strh r0, [r6, #4]
	mov r4, r8
	ldrb r1, [r4, #0x16]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1e
	ands r1, r5
	lsls r1, r1, #2
	ldrb r2, [r6, #1]
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #1]
	movs r0, #2
	add ip, r0
	ldr r1, [sp, #0x14]
	adds r1, #1
	str r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	cmp r1, r2
	bge _0809DA62
	b _0809D82E
_0809DA62:
	ldr r3, _0809DB64 @ =0x03001238
	ldrb r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r7, r0, #0x18
	mov r4, r8
	ldrb r0, [r4, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r1, _0809DB5C @ =sSineTable
	adds r0, r0, r1
	movs r2, #0
	ldrsh r5, [r0, r2]
	ldr r3, [sp, #0xc]
	lsls r4, r3, #0x10
_0809DA7E:
	asrs r4, r4, #0x10
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl FixedMultiplication
	ldr r6, _0809DB4C @ =gOamData
	lsls r1, r7, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	mov r1, r8
	ldrb r0, [r1, #0x15]
	lsls r0, r0, #1
	ldr r2, _0809DB5C @ =sSineTable
	adds r0, r0, r2
	movs r3, #0
	ldrsh r5, [r0, r3]
	adds r0, r4, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r5, #0
	bl FixedMultiplication
	adds r1, r7, #1
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	mov r4, r8
	ldrb r0, [r4, #0x15]
	lsls r0, r0, #1
	ldr r1, _0809DB5C @ =sSineTable
	adds r0, r0, r1
	ldrh r4, [r0]
	rsbs r4, r4, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, [sp, #0x10]
	lsls r5, r2, #0x10
	asrs r5, r5, #0x10
	adds r0, r5, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #2
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	mov r3, r8
	ldrb r0, [r3, #0x15]
	adds r0, #0x40
	lsls r0, r0, #1
	ldr r4, _0809DB5C @ =sSineTable
	adds r0, r0, r4
	movs r1, #0
	ldrsh r4, [r0, r1]
	adds r0, r5, #0
	bl FixedInverse
	adds r1, r0, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r4, #0
	bl FixedMultiplication
	adds r1, r7, #3
	lsls r1, r1, #3
	adds r1, r1, r6
	strh r0, [r1, #6]
	ldr r2, _0809DB64 @ =0x03001238
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_0809DB26:
	ldr r0, _0809DB48 @ =gNextOamSlot
	ldrb r1, [r0]
	ldr r3, [sp, #0x18]
	adds r1, r1, r3
	strb r1, [r0]
	mov r4, r8
	ldrb r0, [r4, #0x12]
	adds r0, #1
	strb r0, [r4, #0x12]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809DB48: .4byte gNextOamSlot
_0809DB4C: .4byte gOamData
_0809DB50: .4byte 0x0863A184
_0809DB54: .4byte 0x0863A190
_0809DB58: .4byte 0x000001FF
_0809DB5C: .4byte sSineTable
_0809DB60: .4byte 0xFFFFFE00
_0809DB64: .4byte 0x03001238
_0809DB68: .4byte 0x000003FF
_0809DB6C: .4byte 0xFFFFFC00

	thumb_func_start unk_9db70
unk_9db70: @ 0x0809DB70
	bx lr
	.align 2, 0
