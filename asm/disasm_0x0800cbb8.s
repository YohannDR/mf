    .include "asm/macros.inc"

    .syntax unified

	thumb_func_start SaXRunningGFX
SaXRunningGFX: @ 0x0800CBB8
	push {lr}
	ldr r3, _0800CC10 @ =gSaXData
	ldr r2, _0800CC14 @ =sSaXAnim_Running_Left
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r3, #0x12]
	ldrb r0, [r0, #8]
	cmp r1, r0
	blo _0800CC08
	movs r0, #0
	strb r0, [r3, #0x12]
	ldrb r0, [r3, #0x13]
	adds r1, r0, #1
	strb r1, [r3, #0x13]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800CBF2
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	beq _0800CBEC
	cmp r0, #9
	bne _0800CBF2
_0800CBEC:
	ldr r0, _0800CC18 @ =0x00000259
	bl SoundPlay
_0800CBF2:
	ldr r2, _0800CC14 @ =sSaXAnim_Running_Left
	ldr r3, _0800CC10 @ =gSaXData
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CC08
	strb r0, [r3, #0x13]
_0800CC08:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CC10: .4byte gSaXData
_0800CC14: .4byte sSaXAnim_Running_Left
_0800CC18: .4byte 0x00000259

	thumb_func_start SaXWalkingGFX
SaXWalkingGFX: @ 0x0800CC1C
	push {lr}
	ldr r3, _0800CC74 @ =gSaXData
	ldr r2, _0800CC78 @ =sSaXAnim_Walking_Left
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r1, [r3, #0x12]
	ldrb r0, [r0, #8]
	cmp r1, r0
	blo _0800CC6E
	movs r0, #0
	strb r0, [r3, #0x12]
	ldrb r0, [r3, #0x13]
	adds r1, r0, #1
	strb r1, [r3, #0x13]
	ldrb r0, [r3]
	cmp r0, #0
	beq _0800CC58
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0800CC50
	cmp r0, #6
	bne _0800CC58
_0800CC50:
	movs r0, #0x96
	lsls r0, r0, #2
	bl SoundPlay
_0800CC58:
	ldr r2, _0800CC78 @ =sSaXAnim_Walking_Left
	ldr r3, _0800CC74 @ =gSaXData
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CC6E
	strb r0, [r3, #0x13]
_0800CC6E:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CC74: .4byte gSaXData
_0800CC78: .4byte sSaXAnim_Walking_Left

	thumb_func_start SaXStandingGFX
SaXStandingGFX: @ 0x0800CC7C
	push {lr}
	ldr r2, _0800CCB8 @ =gSaXData
	ldr r3, _0800CCBC @ =sSaXAnim_Standing_Left
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CCB0
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CCB0
	strb r0, [r2, #0x13]
_0800CCB0:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CCB8: .4byte gSaXData
_0800CCBC: .4byte sSaXAnim_Standing_Left

	thumb_func_start SaXShootingGFX
SaXShootingGFX: @ 0x0800CCC0
	push {lr}
	ldr r2, _0800CCF8 @ =gSaXData
	ldr r3, _0800CCFC @ =sSaXAnim_Shooting_Left
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CD00
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CD00
	movs r0, #2
	b _0800CD02
	.align 2, 0
_0800CCF8: .4byte gSaXData
_0800CCFC: .4byte sSaXAnim_Shooting_Left
_0800CD00:
	movs r0, #0xff
_0800CD02:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaXTurningGFX
SaXTurningGFX: @ 0x0800CD08
	push {lr}
	ldr r2, _0800CD40 @ =gSaXData
	ldr r3, _0800CD44 @ =sSaXAnim_Turning_Right
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CD48
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CD48
	movs r0, #2
	b _0800CD4A
	.align 2, 0
_0800CD40: .4byte gSaXData
_0800CD44: .4byte sSaXAnim_Turning_Right
_0800CD48:
	movs r0, #0xff
_0800CD4A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaXMidAirGFX
SaXMidAirGFX: @ 0x0800CD50
	push {lr}
	ldr r2, _0800CD90 @ =gSaXData
	ldr r3, _0800CD94 @ =sSaXAnim_MidAir_Left
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CD8A
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CD8A
	strb r0, [r2, #0x13]
	ldr r0, _0800CD98 @ =0x0000025B
	bl SoundPlay
_0800CD8A:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CD90: .4byte gSaXData
_0800CD94: .4byte sSaXAnim_MidAir_Left
_0800CD98: .4byte 0x0000025B

	thumb_func_start SaXLandingGFX
SaXLandingGFX: @ 0x0800CD9C
	push {lr}
	ldr r2, _0800CDD4 @ =gSaXData
	ldr r3, _0800CDD8 @ =sSaXAnim_Landing_Right
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CDDC
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CDDC
	movs r0, #2
	b _0800CDDE
	.align 2, 0
_0800CDD4: .4byte gSaXData
_0800CDD8: .4byte sSaXAnim_Landing_Right
_0800CDDC:
	movs r0, #0xff
_0800CDDE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaXShootingRestrictedLaboratoryGFX
SaXShootingRestrictedLaboratoryGFX: @ 0x0800CDE4
	push {lr}
	ldr r2, _0800CE20 @ =gSaXData
	ldr r3, _0800CE24 @ =sSaXAnim_ShootingRestrictedLaboratory
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CE18
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CE18
	strb r0, [r2, #0x13]
_0800CE18:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CE20: .4byte gSaXData
_0800CE24: .4byte sSaXAnim_ShootingRestrictedLaboratory

	thumb_func_start SaXCoveredByMetroidsGFX
SaXCoveredByMetroidsGFX: @ 0x0800CE28
	push {lr}
	ldr r2, _0800CE64 @ =gSaXData
	ldr r3, _0800CE68 @ =sSaXAnim_CoveredByMetroids
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CE5C
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CE5C
	strb r0, [r2, #0x13]
_0800CE5C:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CE64: .4byte gSaXData
_0800CE68: .4byte sSaXAnim_CoveredByMetroids

	thumb_func_start SaXKneelingGFX
SaXKneelingGFX: @ 0x0800CE6C
	push {r4, lr}
	ldr r4, _0800CEB4 @ =gSaXData
	ldrh r0, [r4, #0x12]
	cmp r0, #1
	bne _0800CE7C
	movs r0, #0x9d
	bl SoundPlay
_0800CE7C:
	ldr r2, _0800CEB8 @ =sSaXAnim_Kneeling_Right
	ldrb r0, [r4, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r4, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CEAC
	movs r0, #0
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0x13]
	adds r0, #1
	strb r0, [r4, #0x13]
	ldrb r1, [r4, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CEAC
	strb r0, [r4, #0x13]
_0800CEAC:
	movs r0, #0xff
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800CEB4: .4byte gSaXData
_0800CEB8: .4byte sSaXAnim_Kneeling_Right

	thumb_func_start SaXTransformingIntoMonsterGFX
SaXTransformingIntoMonsterGFX: @ 0x0800CEBC
	push {lr}
	ldr r2, _0800CEF8 @ =gSaXData
	ldr r3, _0800CEFC @ =sSaXAnim_TransformingIntoMonster_Right
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CEF2
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CEF2
	subs r0, r1, #1
	strb r0, [r2, #0x13]
_0800CEF2:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CEF8: .4byte gSaXData
_0800CEFC: .4byte sSaXAnim_TransformingIntoMonster_Right

	thumb_func_start SaXMorphingGFX
SaXMorphingGFX: @ 0x0800CF00
	push {lr}
	ldr r2, _0800CF3C @ =gSaXData
	ldr r3, _0800CF40 @ =sSaXAnim_Morphing_Left
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CF48
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CF48
	ldr r0, _0800CF44 @ =0x0000025F
	bl SoundPlay
	movs r0, #0xf
	b _0800CF4A
	.align 2, 0
_0800CF3C: .4byte gSaXData
_0800CF40: .4byte sSaXAnim_Morphing_Left
_0800CF44: .4byte 0x0000025F
_0800CF48:
	movs r0, #0xff
_0800CF4A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaXUnmorphingGFX
SaXUnmorphingGFX: @ 0x0800CF50
	push {lr}
	ldr r2, _0800CF88 @ =gSaXData
	ldr r3, _0800CF8C @ =sSaXAnim_Unmorphing_Left
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CF90
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CF90
	movs r0, #2
	b _0800CF92
	.align 2, 0
_0800CF88: .4byte gSaXData
_0800CF8C: .4byte sSaXAnim_Unmorphing_Left
_0800CF90:
	movs r0, #0xff
_0800CF92:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaXMorphBallGFX
SaXMorphBallGFX: @ 0x0800CF98
	push {lr}
	ldr r2, _0800CFD4 @ =gSaXData
	ldr r3, _0800CFD8 @ =sSaXAnim_MorphBall_Left
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800CFCC
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800CFCC
	strb r0, [r2, #0x13]
_0800CFCC:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800CFD4: .4byte gSaXData
_0800CFD8: .4byte sSaXAnim_MorphBall_Left

	thumb_func_start SaXSwagWalkGFX
SaXSwagWalkGFX: @ 0x0800CFDC
	push {lr}
	ldr r2, _0800D018 @ =gSaXData
	ldr r3, _0800D01C @ =sSaXAnim_SwagWalk_Left
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800D010
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800D010
	strb r0, [r2, #0x13]
_0800D010:
	movs r0, #0xff
	pop {r1}
	bx r1
	.align 2, 0
_0800D018: .4byte gSaXData
_0800D01C: .4byte sSaXAnim_SwagWalk_Left

	thumb_func_start SaXTurningTowardsCameraGFX
SaXTurningTowardsCameraGFX: @ 0x0800D020
	push {lr}
	ldr r2, _0800D064 @ =gSaXData
	ldr r3, _0800D068 @ =sSaXAnim_TurningTowardsCamera
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800D074
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800D074
	ldr r1, _0800D06C @ =gPauseScreenFlag
	movs r0, #6
	strb r0, [r1]
	ldr r1, _0800D070 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
	movs r0, #0x13
	b _0800D076
	.align 2, 0
_0800D064: .4byte gSaXData
_0800D068: .4byte sSaXAnim_TurningTowardsCamera
_0800D06C: .4byte gPauseScreenFlag
_0800D070: .4byte gSubGameMode1
_0800D074:
	movs r0, #0xff
_0800D076:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SaXTurningAwayFromCameraGFX
SaXTurningAwayFromCameraGFX: @ 0x0800D07C
	push {lr}
	ldr r2, _0800D0B4 @ =gSaXData
	ldr r3, _0800D0B8 @ =sSaXAnim_TurningAwayFromCamera
	ldrb r0, [r2, #0x13]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldrb r0, [r2, #0x12]
	ldrb r1, [r1, #8]
	cmp r0, r1
	blo _0800D0BC
	movs r0, #0
	strb r0, [r2, #0x12]
	ldrb r0, [r2, #0x13]
	adds r0, #1
	strb r0, [r2, #0x13]
	ldrb r1, [r2, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0800D0BC
	movs r0, #2
	b _0800D0BE
	.align 2, 0
_0800D0B4: .4byte gSaXData
_0800D0B8: .4byte sSaXAnim_TurningAwayFromCamera
_0800D0BC:
	movs r0, #0xff
_0800D0BE:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetSaXPose
SetSaXPose: @ 0x0800D0C4
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r2, _0800D0FC @ =gSaXData
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0800D0DE
	ldrh r0, [r2, #8]
	movs r1, #0x30
	eors r0, r1
	movs r1, #0
	strh r0, [r2, #8]
	strb r1, [r2, #2]
_0800D0DE:
	movs r1, #0
	movs r0, #0
	strh r0, [r2, #0xe]
	strh r0, [r2, #0x10]
	strb r1, [r2, #0x12]
	strb r1, [r2, #0x13]
	subs r0, r4, #2
	cmp r0, #0xa
	bhi _0800D15A
	lsls r0, r0, #2
	ldr r1, _0800D100 @ =_0800D104
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D0FC: .4byte gSaXData
_0800D100: .4byte _0800D104
_0800D104: @ jump table
	.4byte _0800D160 @ case 0
	.4byte _0800D160 @ case 1
	.4byte _0800D130 @ case 2
	.4byte _0800D13C @ case 3
	.4byte _0800D148 @ case 4
	.4byte _0800D15A @ case 5
	.4byte _0800D15A @ case 6
	.4byte _0800D15A @ case 7
	.4byte _0800D15A @ case 8
	.4byte _0800D15A @ case 9
	.4byte _0800D154 @ case 10
_0800D130:
	ldr r1, _0800D138 @ =gSaXData
	movs r0, #1
	strb r0, [r1, #2]
	b _0800D160
	.align 2, 0
_0800D138: .4byte gSaXData
_0800D13C:
	ldr r0, _0800D144 @ =0x0000025B
	bl SoundPlay
	b _0800D15A
	.align 2, 0
_0800D144: .4byte 0x0000025B
_0800D148:
	ldr r0, _0800D150 @ =0x0000025A
	bl SoundPlay
	b _0800D15A
	.align 2, 0
_0800D150: .4byte 0x0000025A
_0800D154:
	movs r0, #0x9e
	bl unk_3b1c
_0800D15A:
	ldr r1, _0800D16C @ =gSaXData
	movs r0, #0
	strb r0, [r1, #3]
_0800D160:
	ldr r0, _0800D16C @ =gSaXData
	strb r4, [r0, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800D16C: .4byte gSaXData

	thumb_func_start SaXUpdatePosition
SaXUpdatePosition: @ 0x0800D170
	push {lr}
	ldr r0, _0800D190 @ =gSaXData
	ldrb r1, [r0, #1]
	adds r2, r0, #0
	cmp r1, #5
	bne _0800D1AA
	ldrh r0, [r2, #0x10]
	lsls r3, r0, #0x10
	asrs r1, r3, #0x10
	movs r0, #0x80
	rsbs r0, r0, #0
	cmp r1, r0
	bge _0800D198
	ldr r1, _0800D194 @ =0x0000FFF0
	b _0800D19E
	.align 2, 0
_0800D190: .4byte gSaXData
_0800D194: .4byte 0x0000FFF0
_0800D198:
	asrs r0, r3, #0x13
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_0800D19E:
	ldrh r0, [r2, #0x10]
	subs r0, #6
	strh r0, [r2, #0x10]
	ldrh r0, [r2, #0xc]
	subs r0, r0, r1
	strh r0, [r2, #0xc]
_0800D1AA:
	ldrh r0, [r2, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r2, #0xa]
	adds r0, r0, r1
	strh r0, [r2, #0xa]
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SaXUpdateGFXAndDraw
SaXUpdateGFXAndDraw: @ 0x0800D1C0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _0800D1FC @ =gSaXData
	ldrb r1, [r0, #0x12]
	adds r1, #1
	strb r1, [r0, #0x12]
	ldrb r1, [r0]
	adds r3, r0, #0
	cmp r1, #1
	bhi _0800D1DE
	b _0800D3BA
_0800D1DE:
	ldrh r1, [r3, #8]
	movs r0, #0x10
	ands r0, r1
	movs r1, #1
	cmp r0, #0
	beq _0800D1EC
	movs r1, #0
_0800D1EC:
	ldrb r0, [r3, #1]
	cmp r0, #3
	beq _0800D224
	cmp r0, #3
	bgt _0800D200
	cmp r0, #2
	beq _0800D206
	b _0800D250
	.align 2, 0
_0800D1FC: .4byte gSaXData
_0800D200:
	cmp r0, #4
	beq _0800D244
	b _0800D250
_0800D206:
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0800D218
	ldr r2, _0800D214 @ =sSaXOamDataPointers_Standing_Armed
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D214: .4byte sSaXOamDataPointers_Standing_Armed
_0800D218:
	ldr r2, _0800D220 @ =sSaXOamDataPointers_Standing
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D220: .4byte sSaXOamDataPointers_Standing
_0800D224:
	ldrb r0, [r3, #4]
	cmp r0, #0
	beq _0800D238
	ldr r2, _0800D234 @ =sSaXOamDataPointers_Shooting_Armed
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D234: .4byte sSaXOamDataPointers_Shooting_Armed
_0800D238:
	ldr r2, _0800D240 @ =sSaXOamDataPointers_Shooting
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D240: .4byte sSaXOamDataPointers_Shooting
_0800D244:
	ldr r2, _0800D24C @ =sSaXOamDataPointers_Turning
	lsls r1, r1, #2
	ldrb r0, [r3, #3]
	b _0800D256
	.align 2, 0
_0800D24C: .4byte sSaXOamDataPointers_Turning
_0800D250:
	ldr r2, _0800D29C @ =sSaXOamDataPointers
	lsls r1, r1, #2
	ldrb r0, [r3, #1]
_0800D256:
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r2
	ldr r2, [r1]
	ldr r3, _0800D2A0 @ =gSaXData
	ldrb r1, [r3, #0x13]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2, #4]
	str r0, [r3, #0x20]
	ldr r1, [r2]
	ldrb r0, [r1]
	lsls r0, r0, #5
	strh r0, [r3, #0x1c]
	adds r1, #1
	ldrb r0, [r1]
	lsls r0, r0, #5
	strh r0, [r3, #0x1e]
	adds r1, #1
	str r1, [r3, #0x14]
	ldrh r0, [r3, #0x1c]
	adds r1, r1, r0
	str r1, [r3, #0x18]
	ldrb r0, [r3, #1]
	cmp r0, #5
	bne _0800D2A8
	ldrb r0, [r3, #0x13]
	movs r1, #3
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _0800D2A4 @ =sSaXPalette_MidAir
	adds r0, r1, r0
	b _0800D2CE
	.align 2, 0
_0800D29C: .4byte sSaXOamDataPointers
_0800D2A0: .4byte gSaXData
_0800D2A4: .4byte sSaXPalette_MidAir
_0800D2A8:
	cmp r0, #0xc
	bne _0800D2CC
	ldrb r0, [r3, #0x13]
	cmp r0, #0x1a
	beq _0800D2C4
	cmp r0, #0x1a
	bgt _0800D2BC
	cmp r0, #0x18
	beq _0800D2C4
	b _0800D2CC
_0800D2BC:
	cmp r0, #0x21
	bgt _0800D2CC
	cmp r0, #0x1c
	blt _0800D2CC
_0800D2C4:
	ldr r0, _0800D2C8 @ =sSaXPalette_TransformingIntoMonster
	b _0800D2CE
	.align 2, 0
_0800D2C8: .4byte sSaXPalette_TransformingIntoMonster
_0800D2CC:
	ldr r0, _0800D3CC @ =0x082E7D60
_0800D2CE:
	movs r1, #0
	movs r2, #0x10
	movs r3, #1
	bl SetSuitPalette
	movs r0, #2
	mov r8, r0
	ldr r0, _0800D3D0 @ =gSamusOnTopOfBackgrounds
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D2E8
	movs r1, #1
	mov r8, r1
_0800D2E8:
	ldr r7, _0800D3D4 @ =gSaXData
	mov ip, r7
	mov r1, ip
	ldrb r0, [r1, #1]
	cmp r0, #0xc
	bne _0800D302
	ldr r0, _0800D3D8 @ =gIoRegisters
	ldrh r0, [r0, #0xa]
	movs r7, #3
	mov r8, r7
	mov r1, r8
	ands r1, r0
	mov r8, r1
_0800D302:
	ldr r5, _0800D3DC @ =gOamData
	ldr r3, _0800D3E0 @ =gNextOamSlot
	ldrb r2, [r3]
	lsls r0, r2, #3
	adds r5, r0, r5
	str r2, [sp]
	adds r6, r2, #0
	mov r7, ip
	ldrh r1, [r7, #0xa]
	lsrs r1, r1, #2
	ldr r0, _0800D3E4 @ =gBg1XPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	mov sl, r1
	ldrh r1, [r7, #0xc]
	lsrs r1, r1, #2
	ldr r0, _0800D3E8 @ =gBg1YPosition
	ldrh r0, [r0]
	lsrs r0, r0, #2
	subs r1, r1, r0
	adds r1, #2
	mov sb, r1
	ldr r4, [r7, #0x20]
	ldrh r0, [r4]
	adds r1, r6, #0
	adds r1, r1, r0
	str r1, [sp]
	adds r4, #2
	cmp r2, r1
	bge _0800D3B2
	mov r7, r8
	lsls r7, r7, #2
	mov r8, r7
_0800D346:
	ldrh r0, [r4]
	adds r4, #2
	strh r0, [r5]
	adds r5, #2
	lsls r3, r6, #3
	ldr r1, _0800D3DC @ =gOamData
	adds r3, r3, r1
	add r0, sb
	strb r0, [r3]
	mov r7, ip
	ldrb r1, [r7, #6]
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r3, #1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #1]
	ldrh r1, [r4]
	adds r4, #2
	strh r1, [r5]
	adds r5, #2
	add r1, sl
	ldr r0, _0800D3EC @ =0x000001FF
	ands r1, r0
	ldrh r2, [r3, #2]
	ldr r0, _0800D3F0 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldrh r0, [r4]
	strh r0, [r5]
	adds r4, #2
	ldrb r2, [r3, #5]
	lsrs r1, r2, #4
	ldrb r0, [r7, #5]
	adds r1, r1, r0
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r0, r1
	mov r7, r8
	orrs r0, r7
	strb r0, [r3, #5]
	adds r5, #4
	adds r6, #1
	ldr r0, [sp]
	cmp r6, r0
	blt _0800D346
_0800D3B2:
	mov r1, sp
	ldrb r7, [r1]
	ldr r1, _0800D3E0 @ =gNextOamSlot
	strb r7, [r1]
_0800D3BA:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D3CC: .4byte 0x082E7D60
_0800D3D0: .4byte gSamusOnTopOfBackgrounds
_0800D3D4: .4byte gSaXData
_0800D3D8: .4byte gIoRegisters
_0800D3DC: .4byte gOamData
_0800D3E0: .4byte gNextOamSlot
_0800D3E4: .4byte gBg1XPosition
_0800D3E8: .4byte gBg1YPosition
_0800D3EC: .4byte 0x000001FF
_0800D3F0: .4byte 0xFFFFFE00

	thumb_func_start SaXUpdateElevatorSprite
SaXUpdateElevatorSprite: @ 0x0800D3F4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0800D444 @ =gSaXElevatorSprites
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2
	adds r2, r0, r1
	ldrb r3, [r2]
	adds r6, r1, #0
	cmp r3, #0
	beq _0800D41E
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _0800D41E
	subs r0, #1
	strb r0, [r2, #2]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800D41E
	adds r0, r3, #1
	strb r0, [r2]
_0800D41E:
	lsls r0, r4, #2
	adds r1, r0, r4
	lsls r1, r1, #2
	adds r2, r1, r6
	ldrb r1, [r2]
	adds r5, r0, #0
	cmp r1, #1
	bhi _0800D430
	b _0800D554
_0800D430:
	ldrb r0, [r2, #1]
	cmp r0, #9
	bls _0800D438
	b _0800D534
_0800D438:
	lsls r0, r0, #2
	ldr r1, _0800D448 @ =_0800D44C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D444: .4byte gSaXElevatorSprites
_0800D448: .4byte _0800D44C
_0800D44C: @ jump table
	.4byte _0800D474 @ case 0
	.4byte _0800D474 @ case 1
	.4byte _0800D488 @ case 2
	.4byte _0800D4C4 @ case 3
	.4byte _0800D4C4 @ case 4
	.4byte _0800D4C4 @ case 5
	.4byte _0800D4C4 @ case 6
	.4byte _0800D522 @ case 7
	.4byte _0800D522 @ case 8
	.4byte _0800D4EC @ case 9
_0800D474:
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r2, r0, r6
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	ldr r3, _0800D484 @ =0x083EDF14
	b _0800D496
	.align 2, 0
_0800D484: .4byte 0x083EDF14
_0800D488:
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r2, r0, r6
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	ldr r3, _0800D4C0 @ =0x083EDD9C
_0800D496:
	ldrb r1, [r2, #0xd]
	lsls r1, r1, #3
	adds r1, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0800D534
	movs r0, #0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	adds r0, #1
	strb r0, [r2, #0xd]
	ldrb r0, [r2, #0xd]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0800D534
	strb r0, [r2]
	b _0800D534
	.align 2, 0
_0800D4C0: .4byte 0x083EDD9C
_0800D4C4:
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r3, r0, r6
	ldrh r2, [r3, #0xa]
	lsls r0, r2, #0x10
	asrs r0, r0, #0x13
	ldrh r1, [r3, #6]
	subs r1, r1, r0
	strh r1, [r3, #6]
	subs r2, #6
	strh r2, [r3, #0xa]
	lsls r1, r1, #0x10
	ldr r0, _0800D4E8 @ =0x01C10000
	cmp r1, r0
	bls _0800D522
	movs r0, #0
	strb r0, [r3]
	b _0800D522
	.align 2, 0
_0800D4E8: .4byte 0x01C10000
_0800D4EC:
	adds r0, r5, r4
	lsls r0, r0, #2
	adds r2, r0, r6
	ldrb r0, [r2, #0xc]
	adds r0, #1
	strb r0, [r2, #0xc]
	ldr r3, _0800D55C @ =0x082E8038
	ldrb r1, [r2, #0xd]
	lsls r1, r1, #3
	adds r1, r1, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r1, [r1, #4]
	cmp r0, r1
	blo _0800D522
	movs r0, #0
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0xd]
	adds r0, #1
	strb r0, [r2, #0xd]
	ldrb r0, [r2, #0xd]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0800D522
	strb r0, [r2, #0xd]
_0800D522:
	adds r1, r5, r4
	lsls r1, r1, #2
	adds r1, r1, r6
	ldrh r0, [r1, #8]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x13
	ldrh r2, [r1, #4]
	adds r0, r0, r2
	strh r0, [r1, #4]
_0800D534:
	ldr r1, _0800D560 @ =0x082B4E84
	adds r2, r5, r4
	lsls r2, r2, #2
	adds r3, r2, r6
	ldrb r0, [r3, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r3, #0xd]
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x10
	adds r2, r2, r0
	ldr r0, [r1]
	str r0, [r2]
_0800D554:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800D55C: .4byte 0x082E8038
_0800D560: .4byte 0x082B4E84

	thumb_func_start SaXDrawElevatorSprites
SaXDrawElevatorSprites: @ 0x0800D564
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r6, _0800D624 @ =gOamData
	ldr r2, _0800D628 @ =gNextOamSlot
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r6, r0, r6
	adds r7, r1, #0
	adds r5, r7, #0
	movs r3, #0
	ldr r0, _0800D62C @ =gSaXElevatorSprites
	str r0, [sp, #4]
	str r0, [sp]
_0800D586:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r2, r0, #2
	ldr r0, [sp]
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r3, #1
	str r3, [sp, #8]
	cmp r0, #1
	bls _0800D608
	ldr r0, [sp, #4]
	adds r0, #0x10
	adds r0, r2, r0
	ldr r3, [r0]
	ldrh r0, [r3]
	adds r7, r7, r0
	adds r3, #2
	ldrh r0, [r1, #4]
	lsrs r0, r0, #2
	mov r8, r0
	ldrh r0, [r1, #6]
	lsrs r0, r0, #2
	mov ip, r0
	cmp r5, r7
	bge _0800D608
	ldr r1, _0800D630 @ =0x000001FF
	mov sl, r1
	movs r0, #0xd
	rsbs r0, r0, #0
	mov sb, r0
	lsls r0, r5, #3
	ldr r1, _0800D624 @ =gOamData
	adds r4, r0, r1
	subs r5, r7, r5
_0800D5CA:
	ldrh r0, [r3]
	adds r3, #2
	strh r0, [r6]
	adds r6, #2
	add r0, ip
	strb r0, [r4]
	ldrh r1, [r3]
	adds r3, #2
	strh r1, [r6]
	adds r6, #2
	add r1, r8
	mov r0, sl
	ands r1, r0
	ldrh r2, [r4, #2]
	ldr r0, _0800D634 @ =0xFFFFFE00
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	ldrh r0, [r3]
	strh r0, [r6]
	adds r3, #2
	ldrb r1, [r4, #5]
	mov r0, sb
	ands r0, r1
	strb r0, [r4, #5]
	adds r6, #4
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0800D5CA
	adds r5, r7, #0
_0800D608:
	ldr r3, [sp, #8]
	cmp r3, #0xa
	ble _0800D586
	ldr r1, _0800D628 @ =gNextOamSlot
	strb r7, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800D624: .4byte gOamData
_0800D628: .4byte gNextOamSlot
_0800D62C: .4byte gSaXElevatorSprites
_0800D630: .4byte 0x000001FF
_0800D634: .4byte 0xFFFFFE00

	thumb_func_start unk_d638
unk_d638: @ 0x0800D638
	push {r4, r5, lr}
	ldr r4, _0800D67C @ =gSaXElevatorData
	movs r5, #0
	movs r0, #1
	strb r0, [r4]
	ldr r0, _0800D680 @ =gNextOamSlot
	strb r5, [r0]
	ldr r1, _0800D684 @ =0x082B4EAC
	ldrb r0, [r4, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D674
	strb r5, [r4, #2]
	strb r5, [r4, #3]
	strb r5, [r4, #4]
	strb r5, [r4, #5]
	movs r1, #0
	strh r5, [r4, #6]
	ldr r0, _0800D688 @ =gDisableDrawingSamusAndScrollingFlag
	strb r1, [r0]
	ldr r0, _0800D68C @ =gSaXData
	strb r1, [r0]
	ldr r1, _0800D690 @ =gSubGameMode1
	movs r0, #3
	strh r0, [r1]
_0800D674:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800D67C: .4byte gSaXElevatorData
_0800D680: .4byte gNextOamSlot
_0800D684: .4byte 0x082B4EAC
_0800D688: .4byte gDisableDrawingSamusAndScrollingFlag
_0800D68C: .4byte gSaXData
_0800D690: .4byte gSubGameMode1

	thumb_func_start SaXUpdate
SaXUpdate: @ 0x0800D694
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r1, _0800D6D8 @ =0x082B4EB0
	ldr r4, _0800D6DC @ =gSaXElevatorData
	ldrb r0, [r4, #2]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D6B6
	ldrb r0, [r4, #2]
	adds r0, #1
	strb r0, [r4, #2]
	strh r6, [r4, #6]
_0800D6B6:
	movs r4, #0
_0800D6B8:
	adds r0, r4, #0
	bl SaXUpdateElevatorSprite
	adds r4, #1
	cmp r4, #9
	ble _0800D6B8
	ldr r0, _0800D6DC @ =gSaXElevatorData
	ldrb r4, [r0, #4]
	adds r5, r0, #0
	cmp r4, #2
	beq _0800D700
	cmp r4, #2
	bgt _0800D6E0
	cmp r4, #1
	beq _0800D6E6
	b _0800D79A
	.align 2, 0
_0800D6D8: .4byte 0x082B4EB0
_0800D6DC: .4byte gSaXElevatorData
_0800D6E0:
	cmp r4, #3
	beq _0800D734
	b _0800D79A
_0800D6E6:
	ldr r0, _0800D6F8 @ =gWrittenToBldy
	ldrh r1, [r0]
	cmp r1, #0xf
	bhi _0800D79A
	adds r1, #1
	strh r1, [r0]
	ldr r0, _0800D6FC @ =0x04000054
	strh r1, [r0]
	b _0800D79A
	.align 2, 0
_0800D6F8: .4byte gWrittenToBldy
_0800D6FC: .4byte 0x04000054
_0800D700:
	ldr r0, _0800D728 @ =gWrittenToBldy
	ldrh r1, [r0]
	cmp r1, #0
	beq _0800D710
	subs r1, #1
	strh r1, [r0]
	ldr r0, _0800D72C @ =0x04000054
	strh r1, [r0]
_0800D710:
	ldrb r0, [r5, #5]
	adds r0, #1
	strb r0, [r5, #5]
	movs r1, #7
	ands r0, r1
	cmp r0, #0
	bne _0800D79A
	ldr r1, _0800D730 @ =gBackgroundPositions
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
	b _0800D79A
	.align 2, 0
_0800D728: .4byte gWrittenToBldy
_0800D72C: .4byte 0x04000054
_0800D730: .4byte gBackgroundPositions
_0800D734:
	ldrb r0, [r5, #5]
	adds r2, r0, #1
	strb r2, [r5, #5]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1a
	movs r1, #0x10
	subs r3, r1, r0
	ldr r1, _0800D778 @ =0x04000052
	movs r0, #0x10
	subs r0, r0, r3
	lsls r0, r0, #8
	orrs r0, r3
	strh r0, [r1]
	ands r2, r4
	cmp r2, #0
	bne _0800D75C
	ldr r1, _0800D77C @ =gBackgroundPositions
	ldrh r0, [r1, #0xc]
	subs r0, #1
	strh r0, [r1, #0xc]
_0800D75C:
	cmp r3, #0
	bne _0800D788
	strb r3, [r5, #4]
	strb r3, [r5, #5]
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0800D780 @ =0x0000F6FF
	ands r0, r1
	strh r0, [r2]
	ldr r0, _0800D784 @ =0x04000050
	strh r3, [r0]
	b _0800D79A
	.align 2, 0
_0800D778: .4byte 0x04000052
_0800D77C: .4byte gBackgroundPositions
_0800D780: .4byte 0x0000F6FF
_0800D784: .4byte 0x04000050
_0800D788:
	cmp r3, #1
	bne _0800D79A
	ldr r0, _0800D7E0 @ =gSaXElevatorSprites
	adds r1, r0, #0
	adds r1, #0x50
	movs r2, #0
	strb r2, [r1]
	adds r0, #0x64
	strb r2, [r0]
_0800D79A:
	ldrb r0, [r5, #2]
	cmp r0, #5
	bls _0800D7A2
	adds r6, #1
_0800D7A2:
	ldr r1, _0800D7E4 @ =0x082B4408
	ldr r0, _0800D7E8 @ =gSaXData
	ldrb r0, [r0, #1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl _call_via_r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xff
	beq _0800D7BE
	bl SetSaXPose
_0800D7BE:
	bl SaXUpdatePosition
	ldr r0, _0800D7EC @ =gSubGameMode1
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _0800D7D4
	bl SaXDrawElevatorSprites
	bl SaXUpdateGFXAndDraw
_0800D7D4:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800D7E0: .4byte gSaXElevatorSprites
_0800D7E4: .4byte 0x082B4408
_0800D7E8: .4byte gSaXData
_0800D7EC: .4byte gSubGameMode1

	thumb_func_start SaXElevatorBeforeBlowingUpWall
SaXElevatorBeforeBlowingUpWall: @ 0x0800D7F0
	push {r4, r5, r6, r7, lr}
	movs r3, #0
	ldr r0, _0800D810 @ =gSaXElevatorData
	ldrh r1, [r0, #6]
	adds r2, r1, #1
	strh r2, [r0, #6]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov ip, r0
	cmp r1, #1
	beq _0800D84C
	cmp r1, #1
	bgt _0800D814
	cmp r1, #0
	beq _0800D81E
	b _0800D8AC
	.align 2, 0
_0800D810: .4byte gSaXElevatorData
_0800D814:
	cmp r1, #2
	beq _0800D864
	cmp r1, #3
	beq _0800D888
	b _0800D8AC
_0800D81E:
	ldr r1, _0800D838 @ =0x040000D4
	ldr r0, _0800D83C @ =0x082B4E64
	str r0, [r1]
	ldr r0, _0800D840 @ =0x05000320
	str r0, [r1, #4]
	ldr r0, _0800D844 @ =0x80000010
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r1, _0800D848 @ =gDisableDrawingSamusAndScrollingFlag
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _0800D8AC
	.align 2, 0
_0800D838: .4byte 0x040000D4
_0800D83C: .4byte 0x082B4E64
_0800D840: .4byte 0x05000320
_0800D844: .4byte 0x80000010
_0800D848: .4byte gDisableDrawingSamusAndScrollingFlag
_0800D84C:
	ldr r1, _0800D858 @ =0x040000D4
	ldr r0, _0800D85C @ =0x082B4458
	str r0, [r1]
	ldr r0, _0800D860 @ =0x06014A60
	b _0800D86C
	.align 2, 0
_0800D858: .4byte 0x040000D4
_0800D85C: .4byte 0x082B4458
_0800D860: .4byte 0x06014A60
_0800D864:
	ldr r1, _0800D878 @ =0x040000D4
	ldr r0, _0800D87C @ =0x082B45F8
	str r0, [r1]
	ldr r0, _0800D880 @ =0x06014E60
_0800D86C:
	str r0, [r1, #4]
	ldr r0, _0800D884 @ =0x800000D0
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800D8AC
	.align 2, 0
_0800D878: .4byte 0x040000D4
_0800D87C: .4byte 0x082B45F8
_0800D880: .4byte 0x06014E60
_0800D884: .4byte 0x800000D0
_0800D888:
	ldr r4, _0800D8B4 @ =0x082B4EC8
	ldr r3, _0800D8B8 @ =gSaXElevatorSprites
	movs r2, #9
_0800D88E:
	adds r1, r3, #0
	adds r0, r4, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6}
	stm r1!, {r5, r6}
	adds r4, #0x14
	adds r3, #0x14
	subs r2, #1
	cmp r2, #0
	bge _0800D88E
	movs r0, #0
	mov r7, ip
	strh r0, [r7, #6]
	movs r3, #1
_0800D8AC:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800D8B4: .4byte 0x082B4EC8
_0800D8B8: .4byte gSaXElevatorSprites

	thumb_func_start SaXElevatorBlowingUpWall
SaXElevatorBlowingUpWall: @ 0x0800D8BC
	push {r4, r5, r6, r7, lr}
	movs r6, #0
	ldr r4, _0800D8E8 @ =gSaXElevatorData
	ldrh r0, [r4, #6]
	adds r1, r0, #1
	strh r1, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x28
	bne _0800D8D2
	b _0800D9C4
_0800D8D2:
	cmp r0, #0x28
	bgt _0800D8F6
	cmp r0, #3
	beq _0800D978
	cmp r0, #3
	bgt _0800D8EC
	cmp r0, #1
	beq _0800D918
	cmp r0, #2
	beq _0800D954
	b _0800DAE0
	.align 2, 0
_0800D8E8: .4byte gSaXElevatorData
_0800D8EC:
	cmp r0, #9
	beq _0800D998
	cmp r0, #0x19
	beq _0800D9B0
	b _0800DAE0
_0800D8F6:
	cmp r0, #0x78
	bne _0800D8FC
	b _0800DA60
_0800D8FC:
	cmp r0, #0x78
	bgt _0800D90A
	cmp r0, #0x34
	beq _0800D9CC
	cmp r0, #0x64
	beq _0800D9E8
	b _0800DAE0
_0800D90A:
	cmp r0, #0x8c
	bne _0800D910
	b _0800DA88
_0800D910:
	cmp r0, #0xa0
	bne _0800D916
	b _0800DAA8
_0800D916:
	b _0800DAE0
_0800D918:
	ldr r1, _0800D938 @ =gSaXElevatorBgCnt
	ldr r0, _0800D93C @ =0x04000008
	ldrh r0, [r0]
	strh r0, [r1]
	ldr r0, _0800D940 @ =0x0400000A
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r0, _0800D944 @ =0x0400000E
	ldrh r0, [r0]
	strh r0, [r1, #6]
	ldr r1, _0800D948 @ =0x040000D4
	ldr r0, _0800D94C @ =0x082B4830
	str r0, [r1]
	ldr r0, _0800D950 @ =0x06015000
	b _0800D95C
	.align 2, 0
_0800D938: .4byte gSaXElevatorBgCnt
_0800D93C: .4byte 0x04000008
_0800D940: .4byte 0x0400000A
_0800D944: .4byte 0x0400000E
_0800D948: .4byte 0x040000D4
_0800D94C: .4byte 0x082B4830
_0800D950: .4byte 0x06015000
_0800D954:
	ldr r1, _0800D968 @ =0x040000D4
	ldr r0, _0800D96C @ =0x082B4AF0
	str r0, [r1]
	ldr r0, _0800D970 @ =0x06015400
_0800D95C:
	str r0, [r1, #4]
	ldr r0, _0800D974 @ =0x80000160
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	b _0800DAE0
	.align 2, 0
_0800D968: .4byte 0x040000D4
_0800D96C: .4byte 0x082B4AF0
_0800D970: .4byte 0x06015400
_0800D974: .4byte 0x80000160
_0800D978:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0800D990 @ =0x0000F0FF
	ands r0, r1
	strh r0, [r2]
	movs r1, #0xa0
	lsls r1, r1, #0x13
	ldr r2, _0800D994 @ =0x00007FFF
	adds r0, r2, #0
	strh r0, [r1]
	b _0800DAE0
	.align 2, 0
_0800D990: .4byte 0x0000F0FF
_0800D994: .4byte 0x00007FFF
_0800D998:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0xe0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r6, [r0]
	b _0800DAE0
_0800D9B0:
	movs r0, #0x3c
	movs r1, #1
	bl ScreenShakeStartHorizontal
	ldr r0, _0800D9C0 @ =0x00000226
	bl unk_3b1c
	b _0800DAE0
	.align 2, 0
_0800D9C0: .4byte 0x00000226
_0800D9C4:
	movs r0, #0
	bl UpdateBg1AndSubEventDuringSaXElevatorCutscene
	b _0800DAE0
_0800D9CC:
	ldr r0, _0800D9DC @ =gWrittenToBldy
	strh r6, [r0]
	ldr r0, _0800D9E0 @ =0x04000054
	strh r6, [r0]
	ldr r1, _0800D9E4 @ =0x04000050
	movs r0, #0xaf
	strh r0, [r1]
	b _0800DA98
	.align 2, 0
_0800D9DC: .4byte gWrittenToBldy
_0800D9E0: .4byte 0x04000054
_0800D9E4: .4byte 0x04000050
_0800D9E8:
	ldr r4, _0800DA40 @ =0x04000008
	ldr r3, _0800DA44 @ =gSaXElevatorBgCnt
	ldrh r1, [r3]
	ldr r2, _0800DA48 @ =0x0000FFFC
	adds r0, r2, #0
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r4]
	adds r4, #2
	ldrh r1, [r3, #2]
	adds r0, r2, #0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	strh r0, [r4]
	ldr r1, _0800DA4C @ =0x0400000E
	ldrh r0, [r3, #6]
	ands r2, r0
	strh r2, [r1]
	ldr r0, _0800DA50 @ =gDisableScrolling
	strb r5, [r0]
	ldr r1, _0800DA54 @ =gBackgroundPositions
	movs r0, #0x10
	strh r0, [r1, #0xc]
	movs r0, #0x20
	strh r0, [r1, #0xe]
	ldr r3, _0800DA58 @ =gSaXElevatorSprites
	ldr r2, _0800DA5C @ =0x082B4EC8
	adds r1, r3, #0
	adds r1, #0x50
	adds r0, r2, #0
	adds r0, #0xc8
	ldm r0!, {r4, r5, r7}
	stm r1!, {r4, r5, r7}
	ldm r0!, {r4, r5}
	stm r1!, {r4, r5}
	adds r3, #0x64
	adds r2, #0xdc
	ldm r2!, {r0, r1, r7}
	stm r3!, {r0, r1, r7}
	ldm r2!, {r4, r5}
	stm r3!, {r4, r5}
	b _0800DAE0
	.align 2, 0
_0800DA40: .4byte 0x04000008
_0800DA44: .4byte gSaXElevatorBgCnt
_0800DA48: .4byte 0x0000FFFC
_0800DA4C: .4byte 0x0400000E
_0800DA50: .4byte gDisableScrolling
_0800DA54: .4byte gBackgroundPositions
_0800DA58: .4byte gSaXElevatorSprites
_0800DA5C: .4byte 0x082B4EC8
_0800DA60:
	ldr r1, _0800DA7C @ =0x04000050
	movs r0, #0xa7
	strh r0, [r1]
	ldr r1, _0800DA80 @ =gSaXElevatorSprites
	adds r2, r1, #0
	adds r2, #0x58
	movs r3, #0
	ldr r0, _0800DA84 @ =0x0000FFF0
	strh r0, [r2]
	adds r1, #0x6c
	movs r0, #0x10
	strh r0, [r1]
	strb r3, [r4, #5]
	b _0800DA98
	.align 2, 0
_0800DA7C: .4byte 0x04000050
_0800DA80: .4byte gSaXElevatorSprites
_0800DA84: .4byte 0x0000FFF0
_0800DA88:
	ldr r1, _0800DAA0 @ =0x04000050
	ldr r7, _0800DAA4 @ =0x00003F48
	adds r0, r7, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	strb r6, [r4, #5]
_0800DA98:
	ldrb r0, [r4, #4]
	adds r0, #1
	strb r0, [r4, #4]
	b _0800DAE0
	.align 2, 0
_0800DAA0: .4byte 0x04000050
_0800DAA4: .4byte 0x00003F48
_0800DAA8:
	ldr r2, _0800DAE8 @ =gSaXData
	adds r1, r2, #0
	ldr r0, _0800DAEC @ =sSaXData_Empty
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	ldm r0!, {r3, r5, r7}
	stm r1!, {r3, r5, r7}
	movs r0, #2
	strb r0, [r2]
	movs r0, #1
	strb r0, [r2, #1]
	ldr r0, _0800DAF0 @ =gBg1XPosition
	ldrh r0, [r0]
	adds r0, #0xb4
	strh r0, [r2, #0xa]
	ldr r1, _0800DAF4 @ =gBg1YPosition
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r3, #0
	ldrh r1, [r1]
	adds r0, r0, r1
	strh r0, [r2, #0xc]
	movs r0, #0xc
	strh r0, [r2, #0xe]
	strh r6, [r4, #6]
	movs r6, #1
_0800DAE0:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DAE8: .4byte gSaXData
_0800DAEC: .4byte sSaXData_Empty
_0800DAF0: .4byte gBg1XPosition
_0800DAF4: .4byte gBg1YPosition

	thumb_func_start SaXElevatorWalkingBeforeTurningToCamera
SaXElevatorWalkingBeforeTurningToCamera: @ 0x0800DAF8
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _0800DB0C @ =gSaXData
	ldrb r0, [r1, #1]
	cmp r0, #1
	beq _0800DB10
	cmp r0, #2
	beq _0800DB2C
	b _0800DB46
	.align 2, 0
_0800DB0C: .4byte gSaXData
_0800DB10:
	ldrh r1, [r1, #0xa]
	ldr r0, _0800DB28 @ =gBg1XPosition
	ldrh r0, [r0]
	movs r2, #0xaf
	lsls r2, r2, #1
	adds r0, r0, r2
	cmp r1, r0
	blt _0800DB46
	movs r0, #2
	bl SetSaXPose
	b _0800DB46
	.align 2, 0
_0800DB28: .4byte gBg1XPosition
_0800DB2C:
	ldr r4, _0800DB50 @ =gSaXElevatorData
	ldrh r0, [r4, #6]
	adds r1, r0, #1
	strh r1, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x1d
	bls _0800DB46
	movs r0, #0x12
	bl SetSaXPose
	strh r5, [r4, #6]
	movs r5, #1
_0800DB46:
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800DB50: .4byte gSaXElevatorData

	thumb_func_start SaXElevatorBeforeJumping
SaXElevatorBeforeJumping: @ 0x0800DB54
	push {r4, r5, r6, lr}
	movs r6, #0
	ldr r5, _0800DB8C @ =gSaXData
	ldrb r0, [r5, #1]
	cmp r0, #2
	bne _0800DB82
	ldr r4, _0800DB90 @ =gSaXElevatorData
	ldrh r0, [r4, #6]
	adds r1, r0, #1
	strh r1, [r4, #6]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x3b
	bls _0800DB82
	movs r0, #5
	bl SetSaXPose
	movs r0, #0x30
	strh r0, [r5, #0xe]
	movs r0, #0x80
	strh r0, [r5, #0x10]
	strh r6, [r4, #6]
	movs r6, #1
_0800DB82:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800DB8C: .4byte gSaXData
_0800DB90: .4byte gSaXElevatorData

	thumb_func_start SaXElevatorBeforeShootingDoor
SaXElevatorBeforeShootingDoor: @ 0x0800DB94
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r6, #0
	ldr r4, _0800DBC8 @ =gSaXData
	ldrb r0, [r4, #1]
	cmp r0, #5
	bne _0800DBD0
	ldrh r1, [r4, #0xc]
	ldr r5, _0800DBCC @ =gBg1YPosition
	ldrh r0, [r5]
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r0, r0, r2
	cmp r1, r0
	ble _0800DBD8
	movs r0, #6
	bl SetSaXPose
	ldrh r0, [r5]
	movs r3, #0xe0
	lsls r3, r3, #1
	adds r0, r0, r3
	strh r0, [r4, #0xc]
	b _0800DBD8
	.align 2, 0
_0800DBC8: .4byte gSaXData
_0800DBCC: .4byte gBg1YPosition
_0800DBD0:
	ldr r1, _0800DBEC @ =gSaXElevatorData
	ldrh r0, [r1, #6]
	adds r0, #1
	strh r0, [r1, #6]
_0800DBD8:
	ldr r0, _0800DBEC @ =gSaXElevatorData
	ldrh r1, [r0, #6]
	mov ip, r0
	cmp r1, #0x44
	beq _0800DC0C
	cmp r1, #0x44
	bgt _0800DBF0
	cmp r1, #0x1e
	beq _0800DBF6
	b _0800DC7C
	.align 2, 0
_0800DBEC: .4byte gSaXElevatorData
_0800DBF0:
	cmp r1, #0x50
	beq _0800DC54
	b _0800DC7C
_0800DBF6:
	ldr r0, _0800DC08 @ =gSaXData
	movs r1, #1
	strb r1, [r0, #4]
	movs r0, #0x8a
	lsls r0, r0, #2
	bl SoundPlay
	b _0800DC7C
	.align 2, 0
_0800DC08: .4byte gSaXData
_0800DC0C:
	movs r0, #3
	bl SetSaXPose
	ldr r2, _0800DC40 @ =gSaXElevatorSprites
	ldr r1, _0800DC44 @ =0x082B4EC8
	adds r0, r2, #0
	adds r1, #0xf0
	ldm r1!, {r4, r5, r7}
	stm r0!, {r4, r5, r7}
	ldm r1!, {r3, r4}
	stm r0!, {r3, r4}
	ldr r3, _0800DC48 @ =gSaXData
	ldr r0, _0800DC4C @ =gBg1XPosition
	ldrh r1, [r0]
	subs r1, #0x40
	ldrh r0, [r3, #0xa]
	subs r0, r0, r1
	strh r0, [r2, #4]
	ldr r0, _0800DC50 @ =gBg1YPosition
	ldrh r1, [r0]
	adds r1, #0x48
	ldrh r0, [r3, #0xc]
	subs r0, r0, r1
	strh r0, [r2, #6]
	b _0800DC7C
	.align 2, 0
_0800DC40: .4byte gSaXElevatorSprites
_0800DC44: .4byte 0x082B4EC8
_0800DC48: .4byte gSaXData
_0800DC4C: .4byte gBg1XPosition
_0800DC50: .4byte gBg1YPosition
_0800DC54:
	adds r6, #1
	mov r8, r6
	ldr r4, _0800DC8C @ =0x082B4FCC
	ldr r3, _0800DC90 @ =gSaXElevatorSprites
	movs r2, #6
_0800DC5E:
	adds r1, r3, #0
	adds r0, r4, #0
	ldm r0!, {r5, r6, r7}
	stm r1!, {r5, r6, r7}
	ldm r0!, {r5, r6}
	stm r1!, {r5, r6}
	adds r4, #0x14
	adds r3, #0x14
	subs r2, #1
	cmp r2, #0
	bge _0800DC5E
	movs r0, #0
	mov r7, ip
	strh r0, [r7, #6]
	mov r6, r8
_0800DC7C:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800DC8C: .4byte 0x082B4FCC
_0800DC90: .4byte gSaXElevatorSprites

	thumb_func_start SaXElevatorWalkingOut
SaXElevatorWalkingOut: @ 0x0800DC94
	push {r4, lr}
	movs r4, #0
	ldr r0, _0800DCB4 @ =gSaXElevatorData
	ldrh r1, [r0, #6]
	adds r2, r1, #1
	strh r2, [r0, #6]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	cmp r1, #0x23
	beq _0800DCD8
	cmp r1, #0x23
	bgt _0800DCB8
	cmp r1, #5
	beq _0800DCC2
	b _0800DCF8
	.align 2, 0
_0800DCB4: .4byte gSaXElevatorData
_0800DCB8:
	cmp r1, #0x32
	beq _0800DCE0
	cmp r1, #0x64
	beq _0800DCEC
	b _0800DCF8
_0800DCC2:
	movs r0, #0x3c
	movs r1, #1
	bl ScreenShakeStartHorizontal
	ldr r0, _0800DCD4 @ =0x00000227
	bl unk_3b1c
	b _0800DCF8
	.align 2, 0
_0800DCD4: .4byte 0x00000227
_0800DCD8:
	movs r0, #1
	bl UpdateBg1AndSubEventDuringSaXElevatorCutscene
	b _0800DCF8
_0800DCE0:
	ldr r0, _0800DCE8 @ =gSaXData
	strb r4, [r0, #4]
	b _0800DCF8
	.align 2, 0
_0800DCE8: .4byte gSaXData
_0800DCEC:
	movs r0, #1
	bl SetSaXPose
	ldr r1, _0800DD1C @ =gSaXData
	movs r0, #0x14
	strh r0, [r1, #0xe]
_0800DCF8:
	ldr r1, _0800DD1C @ =gSaXData
	ldrb r0, [r1, #1]
	cmp r0, #1
	bne _0800DD12
	ldrh r1, [r1, #0xa]
	ldr r0, _0800DD20 @ =gBg1XPosition
	ldrh r0, [r0]
	movs r2, #0xf0
	lsls r2, r2, #2
	adds r0, r0, r2
	cmp r1, r0
	ble _0800DD12
	adds r4, #1
_0800DD12:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800DD1C: .4byte gSaXData
_0800DD20: .4byte gBg1XPosition
