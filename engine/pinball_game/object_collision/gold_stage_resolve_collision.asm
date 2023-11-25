ResolveGoldFieldTopGameObjectCollisions: ; 0x1460e
	call ResolveVoltorbCollision_GoldField
	call ResolveGoldStageSpinnerCollision
	call ResolveBallUpgradeTriggersCollision_GoldField
	call UpdateBallTypeUpgradeCounter_GoldField
	call UpdateCAVELightsBlinking_GoldField
	call ResolveGoldStageBoardTriggerCollision
	call ResolveGoldStagePikachuCollision
	call ResolveStaryuCollision_Top_GoldField
	call ResolveBellsproutCollision_GoldField
	call ResolveDittoSlotCollision_GoldField
	call ApplySlotForceField_GoldFieldTop
	call OpenSlotCave_GoldField
	callba UpdateBallSaverState
	call UpdateBlinkingPokeballs_GoldField
	call UpdateMapMoveCounters_GoldFieldTop
	callba ShowExtraBallMessage
	ld a, $0
	callba CheckSpecialModeColision
	ret

ResolveGoldFieldBottomGameObjectCollisions: ; 0x14652
	call ResolveWildMonCollision_GoldField
	call ResolveBumpersCollision_GoldField
	call ResolveDiglettCollision_GoldField
	call UpdateMapMoveCounters_GoldFieldBottom
	call UpdateGoldStageSpinner
	call UpdatePinballUpgradeBlinkingAnimation_GoldField
	call UpdateBallTypeUpgradeCounter_GoldField
	call ResolveCAVELightCollision_GoldField
	call ResolveGoldStagePinballLaunchCollision
	call ResolveGoldStagePikachuCollision
	call ResolveStaryuCollision_Bottom_GoldField
	call UpdateArrowIndicators_GoldField
	call ResolveGoldStageBonusMultiplierCollision
	call ResolveSlotCollision_GoldField
	call ApplySlotForceField_GoldFieldBottom
	call OpenSlotCave_GoldField
	callba UpdateAgainText
	callba UpdateBallSaver
	call UpdatePokeballs_GoldField
	callba ShowExtraBallMessage
	ld a, $0
	callba CheckSpecialModeColision
	ret

ResolveWildMonCollision_GoldField: ; 0x14795
	ld a, [wWildMonCollision]
	and a
	ret z
	xor a
	ld [wWildMonCollision], a
	ld a, $1
	ld [wBallHitWildMon], a
	lb de, $00, $06
	call PlaySoundEffect
	ret

ResolveDiglettCollision_GoldField: ; 0x147aa
	ld a, [wWhichDiglett]
	and a
	jp z, .asm_14834 ;if no diglett hit (runs every frame when above a certain line on bottom boards, jump
	xor a
	ld [wWhichDiglett], a
	ld a, [wWhichDiglettId]
	sub $1
	sla a
	ld c, a ;-1 then * 2
	ld b, $0
	ld hl, wLeftMapMoveCounter ;select approprioate map move counter
	add hl, bc
	ld a, [hl]
	cp $3
	jr z, .asm_14834 ;if counter is set to 3, jump
	inc a
	ld [hld], a ;oherwise, add 1 to the counter
	ld [hl], $50 ;and set the animation of that diglett
	ld hl, wLeftMapMoveCounterFramesUntilDecrease
	add hl, bc
	ld a, MAP_MOVE_FRAMES_COUNTER & $ff ;load in time until digletts decay
	ld [hli], a
	ld a, MAP_MOVE_FRAMES_COUNTER >> 8
	ld [hl], a
	ld a, c
	and a
	jr z, .asm_14807 ;if left diglett, jump
	ld a, $6a
	ld [wStageCollisionMap + $f0], a
	ld a, $6b
	ld [wStageCollisionMap + $110], a
	ld a, $5
	call _LoadDiglettGraphics_GoldField
	ld a, [wRightMapMoveCounter]
	add $4
	call LoadDiglettNumberGraphics_GoldField
	ld a, $8
	callba CheckSpecialModeColision
	ld a, [wRightMapMoveCounter]
	cp $3
	call z, HitRightDiglett3Times_GoldField
	jr .asm_14830

.asm_14807
	ld a, $66
	ld [wStageCollisionMap + $e3], a
	ld a, $67
	ld [wStageCollisionMap + $103], a
	ld a, $2
	call _LoadDiglettGraphics_GoldField
	ld a, [wLeftMapMoveCounter]
	call LoadDiglettNumberGraphics_GoldField
	ld a, $7
	callba CheckSpecialModeColision
	ld a, [wLeftMapMoveCounter]
	cp $3
	call z, HitLeftDiglett3Times_GoldField
.asm_14830
	call AddScoreForHittingDiglett_GoldField
	ret

.asm_14834
	ld a, [wLeftDiglettAnimationController]
	and a
	jr z, .asm_14857
	dec a
	ld [wLeftDiglettAnimationController], a
	jr nz, .asm_14857
	ld a, [wLeftMapMoveCounter]
	sub $3
	jr nz, .asm_1484d
	ld [wLeftMapMoveCounter], a
	call LoadDiglettNumberGraphics_GoldField
.asm_1484d
	ld a, $64
	ld [wStageCollisionMap + $e3], a
	ld a, $65
	ld [wStageCollisionMap + $103], a
.asm_14857
	ld a, [wRightDiglettAnimationController]
	and a
	jr z, .asm_1487c
	dec a
	ld [wRightDiglettAnimationController], a
	jr nz, .asm_1487c
	ld a, [wRightMapMoveCounter]
	sub $3
	jr nz, .asm_14872
	ld [wRightMapMoveCounter], a
	add $4
	call LoadDiglettNumberGraphics_GoldField
.asm_14872
	ld a, $68
	ld [wStageCollisionMap + $f0], a
	ld a, $69
	ld [wStageCollisionMap + $110], a
.asm_1487c
	call UpdateDiglettAnimations_GoldField
	ret

UpdateMapMoveCounters_GoldFieldBottom: ; 0x14880
; Decrements the two counters that cause the map move counters to decrease by one every 8 seconds.
; Also updates the counter graphics if anything changes.
; The map move counters appear next to Digletts.
	ld hl, wLeftMapMoveCounterFramesUntilDecrease
	dec [hl]
	ld a, [hli]
	cp $ff
	jr nz, .checkRightMapMoveCounter
	dec [hl]
	ld a, [hld]
	cp $ff
	jr nz, .checkRightMapMoveCounter
	; Reset the counter back to 8 seconds worth of frames (480 frames)
	ld a, MAP_MOVE_FRAMES_COUNTER & $ff
	ld [hli], a
	ld a, MAP_MOVE_FRAMES_COUNTER >> 8
	ld [hl], a
	ld a, [wLeftMapMoveCounter]
	and a
	jr z, .checkRightMapMoveCounter
	cp $3
	jr z, .checkRightMapMoveCounter
	dec a
	ld [wLeftMapMoveCounter], a
	call LoadDiglettNumberGraphics_GoldField
.checkRightMapMoveCounter
	ld hl, wRightMapMoveCounterFramesUntilDecrease
	dec [hl]
	ld a, [hli]
	cp $ff
	jr nz, .done
	dec [hl]
	ld a, [hld]
	cp $ff
	jr nz, .done
	; Reset the counter back to 8 seconds worth of frames (480 frames)
	ld a, MAP_MOVE_FRAMES_COUNTER & $ff
	ld [hli], a
	ld a, MAP_MOVE_FRAMES_COUNTER >> 8
	ld [hl], a
	ld a, [wRightMapMoveCounter]
	and a
	jr z, .done
	cp $3
	jr z, .done
	dec a
	ld [wRightMapMoveCounter], a
	add $4
	call LoadDiglettNumberGraphics_GoldField
.done
	ret

UpdateMapMoveCounters_GoldFieldTop: ; 0x148cf
; This is identical logic to UpdateMapMoveCounters_GoldFieldBottom, but it doesn't load
; any graphics, since the Diglett aren't in the Top half of the Gold Field.
	ld b, $0
	ld hl, wLeftMapMoveCounterFramesUntilDecrease + 1
	ld a, [hld]
	or [hl]
	jr z, .checkRightMapMoveCounter
	dec [hl]
	ld a, [hli]
	cp $ff
	jr nz, .checkRightMapMoveCounter
	dec [hl]
	ld a, [hld]
	cp $ff
	jr nz, .checkRightMapMoveCounter
	; Reset the counter back to 8 seconds worth of frames (480 frames)
	ld a, MAP_MOVE_FRAMES_COUNTER & $ff
	ld [hli], a
	ld a, MAP_MOVE_FRAMES_COUNTER >> 8
	ld [hl], a
	ld a, [wLeftMapMoveCounter]
	and a
	jr z, .checkRightMapMoveCounter
	cp $3
	jr z, .checkRightMapMoveCounter
	dec a
	ld [wLeftMapMoveCounter], a
.checkRightMapMoveCounter
	ld hl, wRightMapMoveCounterFramesUntilDecrease + 1
	ld a, [hld]
	or [hl]
	jr z, .done
	dec [hl]
	ld a, [hli]
	cp $ff
	jr nz, .done
	dec [hl]
	ld a, [hld]
	cp $ff
	jr nz, .done
	; Reset the counter back to 8 seconds worth of frames (480 frames)
	ld a, MAP_MOVE_FRAMES_COUNTER & $ff
	ld [hli], a
	ld a, MAP_MOVE_FRAMES_COUNTER >> 8
	ld [hl], a
	ld a, [wRightMapMoveCounter]
	and a
	jr z, .done
	cp $3
	jr z, .done
	dec a
	ld [wRightMapMoveCounter], a
.done
	ret

HitRightDiglett3Times_GoldField: ; 0x14920
	ld hl, wNumDugtrioTriples
	call Increment_Max100
	jr nc, .asm_14937
	ld c, $a
	call Modulo_C
	callba z, AddExtraBall
.asm_14937
	ld a, $1
	ld [wMapMoveDirection], a
	callba StartMapMoveMode
	ret

HitLeftDiglett3Times_GoldField: ; 0x14947
	ld hl, wNumDugtrioTriples
	call Increment_Max100
	jr nc, .asm_1495e
	ld c, $a
	call Modulo_C
	callba z, AddExtraBall
.asm_1495e
	xor a
	ld [wMapMoveDirection], a
	callba StartMapMoveMode
	ret

AddScoreForHittingDiglett_GoldField: ; 0x1496d
	ld a, $55
	ld [wRumblePattern], a
	ld a, $4
	ld [wRumbleDuration], a
	ld a, $2
	ld [wCollisionForceAmplification], a
	ld bc, FiveHundredPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	lb de, $00, $0f
	call PlaySoundEffect
	ret

UpdateDiglettAnimations_GoldField: ; 0x14990
	ld a, [wLeftDiglettAnimationController]
	and a
	jr nz, .asm_149b6
	ld a, [wLeftMapMoveDiglettAnimationCounter]
	and a
	jr z, .asm_149a2
	dec a
	ld [wLeftMapMoveDiglettAnimationCounter], a
	jr .asm_149b6

.asm_149a2
	call Func_1130
	ret nz
	ld a, $14
	ld [wLeftMapMoveDiglettAnimationCounter], a
	ld a, [wLeftMapMoveDiglettFrame]
	xor $1
	ld [wLeftMapMoveDiglettFrame], a
	call _LoadDiglettGraphics_GoldField
.asm_149b6
	ld a, [wRightDiglettAnimationController]
	and a
	ret nz
	ld a, [wRightMapMoveDiglettAnimationCounter]
	and a
	jr z, .asm_149c6
	dec a
	ld [wRightMapMoveDiglettAnimationCounter], a
	ret

.asm_149c6
	call Func_1130
	ret nz
	ld a, $14
	ld [wRightMapMoveDiglettAnimationCounter], a
	ld a, [wRightMapMoveDiglettFrame]
	xor $1
	ld [wRightMapMoveDiglettFrame], a
	add $3
	; fall through

_LoadDiglettGraphics_GoldField: ; 0x149d9
	sla a
	ld c, a
	ld b, $0
	ld hl, TileListDataPointers_14a11_GoldField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_149e9
	ld hl, TileListDataPointers_14a83_GoldField
.asm_149e9
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, BANK(TileListDataPointers_14a11_GoldField)
	call QueueGraphicsToLoad
	ret

LoadDiglettNumberGraphics_GoldField: ; 0x149f5
	sla a
	ld c, a
	ld b, $0
	ld hl, Data_14af5_GoldField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_14a05
	ld hl, TileListDataPointers_14c8d_GoldField
.asm_14a05
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, BANK(Data_14af5_GoldField)
	call QueueGraphicsToLoad
	ret

INCLUDE "data/queued_tiledata/gold_field/diglett.asm"

ResolveVoltorbCollision_GoldField: ; 0x14d85
	ld a, [wWhichVoltorb]
	and a
	jr z, .noVoltorbCollision
	xor a
	ld [wWhichVoltorb], a
	call ApplyVoltorbCollision_GoldField
	ld a, $10
	ld [wVoltorbHitAnimationDuration], a
	ld a, [wWhichVoltorbId]
	sub $3
	ld [wWhichAnimatedVoltorb], a
	ld a, $4
	callba CheckSpecialModeColision
	ld bc, FiveHundredPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ret

.noVoltorbCollision
	ld a, [wVoltorbHitAnimationDuration]
	and a
	ret z
	dec a
	ld [wVoltorbHitAnimationDuration], a
	ret nz
	ld a, $ff
	ld [wWhichAnimatedVoltorb], a
	ret

ApplyVoltorbCollision_GoldField: ; 0x14dc9
	ld a, $ff
	ld [wRumblePattern], a
	ld a, $3
	ld [wRumbleDuration], a
	ld hl, $0200
	ld a, l
	ld [wFlipperYForce], a
	ld a, h
	ld [wFlipperYForce + 1], a
	ld a, $80
	ld [wFlipperCollision], a
	lb de, $00, $0e
	call PlaySoundEffect
	ret

ResolveGoldStageSpinnerCollision: ; 0x14dea
	ld a, [wSpinnerCollision]
	and a
	jr z, UpdateGoldStageSpinner
	xor a
	ld [wSpinnerCollision], a
	ld a, [wBallYVelocity]
	ld c, a
	ld a, [wBallYVelocity + 1]
	ld b, a
	ld a, c
	ld [wSpinnerVelocity], a
	ld a, b
	ld [wSpinnerVelocity + 1], a
	ld a, $c
	callba CheckSpecialModeColision
	; fall through

UpdateGoldStageSpinner: ; 0x14e10
	ld hl, wSpinnerVelocity
	ld a, [hli]
	or [hl]
	ret z
	ld a, [wSpinnerVelocity]
	ld c, a
	ld a, [wSpinnerVelocity + 1]
	ld b, a
	bit 7, b
	jr nz, .asm_14e2e
	ld a, c
	sub $7
	ld c, a
	ld a, b
	sbc $0
	ld b, a
	jr nc, .asm_14e3b
	jr .asm_14e38

.asm_14e2e
	ld a, c
	add $7
	ld c, a
	ld a, b
	adc $0
	ld b, a
	jr nc, .asm_14e3b
.asm_14e38
	ld bc, $0000
.asm_14e3b
	ld a, c
	ld [wSpinnerVelocity], a
	ld a, b
	ld [wSpinnerVelocity + 1], a
	ld hl, wSpinnerVelocity
	ld a, [wSpinnerState]
	add [hl]
	ld [wSpinnerState], a
	inc hl
	ld a, [wSpinnerState + 1]
	adc [hl]
	bit 7, a
	ld c, $0
	jr z, .asm_14e5e
	add $18
	ld c, $1
	jr .asm_14e66

.asm_14e5e
	cp $18
	jr c, .asm_14e66
	sub $18
	ld c, $1
.asm_14e66
	ld [wSpinnerState + 1], a
	ld a, c
	and a
	ret z
	ld bc, TenPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ld hl, wNumSpinnerTurns
	call Increment_Max100
	ld a, [wPikachuSaverCharge]
	cp MAX_PIKACHU_SAVER_CHARGE
	jr nz, .asm_14e8a
	call PlaySpinnerChargingSoundEffect_GoldField
	ret

.asm_14e8a
	inc a
	ld [wPikachuSaverCharge], a
	call PlaySpinnerChargingSoundEffect_GoldField
	ld a, [wPikachuSaverCharge]
	cp MAX_PIKACHU_SAVER_CHARGE
	jr nz, .asm_14e9d
	ld a, $64
	ld [wd51e], a
.asm_14e9d
	ld a, [wCurrentStage]
	bit 0, a
	ret nz
	call UpdateSpinnerChargeGraphics_GoldField
	ret

PlaySpinnerChargingSoundEffect_GoldField: ; 0x14ea7
	ld a, [wd51e]
	and a
	ret nz
	ld a, [wPikachuSaverCharge]
	ld c, a
	ld b, $0
	ld hl, SpinnerChargingSoundEffectIds_GoldField
	add hl, bc
	ld a, [hl]
	ld e, a
	ld d, $0
	call PlaySoundEffect
	ret

SpinnerChargingSoundEffectIds_GoldField:
	db $12, $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F, $20, $11

UpdateSpinnerChargeGraphics_GoldField: ; 0x14ece
; Loads the correct graphics that show the lightning bolt icon for the spinner's current charge.
	ld a, [wPikachuSaverCharge]
	ld c, a
	sla c
	ld b, $0
	ld hl, TileDataPointers_14eeb_GoldField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_14ee1
	ld hl, TileDataPointers_1509b_GoldField
.asm_14ee1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(TileDataPointers_14eeb_GoldField)
	call QueueGraphicsToLoad
	ret

INCLUDE "data/queued_tiledata/gold_field/spinner.asm"

ResolveCAVELightCollision_GoldField: ; 0x151cb
	ld a, [wWhichCAVELight]
	and a
	jr z, .asm_15229
	xor a
	ld [wWhichCAVELight], a
	ld a, [wCAVELightsBlinking]
	and a
	jr nz, .asm_15229
	ld a, [wWhichCAVELightId]
	sub $a
	ld c, a
	ld b, $0
	ld hl, wCAVELightStates
	add hl, bc
	ld a, [hl]
	ld [hl], $1
	and a
	ret nz
	ld bc, OneHundredPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ld hl, wCAVELightStates
	ld a, [hli]
	and [hl]
	inc hl
	and [hl]
	inc hl
	and [hl]
	jr z, LoadCAVELightsGraphics_GoldField
	ld a, $1
	ld [wCAVELightsBlinking], a
	ld a, $80
	ld [wCAVELightsBlinkingFramesRemaining], a
	ld bc, FourHundredPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	lb de, $00, $09
	call PlaySoundEffect
	ld hl, wNumCAVECompletions
	call Increment_Max100
	jr LoadCAVELightsGraphics_GoldField

.asm_15229
	call UpdateCAVELightsBlinking_GoldField
	ret z
	; fall through

LoadCAVELightsGraphics_GoldField: ; 0x1522d
; Loads the graphics for each of the 4 CAVE lights, depending on what their current toggled state is.
	ld hl, wCAVELightStates + 3
	ld b, $4
.loop
	ld a, [hld]
	push hl
	call LoadCAVELightGraphics_GoldField
	pop hl
	dec b
	jr nz, .loop
	ret

LoadCAVELightGraphics_GoldField: ; 0x1523c
; Loads a graphics for single CAVE light.
; Input: a = toggle state for CAVE light
	and a
	jr z, .toggledOff
	ld a, [hGameBoyColorFlag]
	and a
	jr nz, .toggledOnGameboy
	ld hl, TileDataPointers_152dd_GoldField
	jr .load

.toggledOnGameboy
	ld hl, TileDataPointers_1531d_GoldField
	jr .load

.toggledOff
	ld a, [hGameBoyColorFlag]
	and a
	jr nz, .toggledOffGameboy
	ld hl, TileDataPointers_152e5_GoldField
	jr .load

.toggledOffGameboy
	ld hl, TileDataPointers_15325_GoldField
.load
	push bc
	dec b
	sla b
	ld e, b
	ld d, $0
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, Bank(TileDataPointers_152dd_GoldField)
	ld de, LoadTileLists
	call QueueGraphicsToLoadWithFunc
	pop bc
	ret

UpdateCAVELightsBlinking_GoldField: ; 0x15270
	ld a, [wCAVELightsBlinking]
	and a
	jr z, .notBlinking
	ld a, [wCAVELightsBlinkingFramesRemaining]
	dec a
	ld [wCAVELightsBlinkingFramesRemaining], a
	jr nz, .asm_1528d
	ld [wCAVELightsBlinking], a
	ld a, $1
	ld [wOpenedSlotByGetting4CAVELights], a
	ld a, $3
	ld [wFramesUntilSlotCaveOpens], a
	xor a
.asm_1528d
	and $7
	ret nz
	ld a, [wCAVELightsBlinkingFramesRemaining]
	srl a
	srl a
	srl a
	and $1
	ld hl, wCAVELightStates
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $1
	and a
	ret

.notBlinking
	ld hl, wKeyConfigLeftFlipper
	call IsKeyPressed
	jr z, .checkRightFlipperKeyPress
	ld hl, wCAVELightStates
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld a, c
	ld [hld], a
	ld a, d
	ld [hld], a
	ld a, e
	ld [hld], a
	ld a, b
	ld [hl], a
	ret

.checkRightFlipperKeyPress
	ld hl, wKeyConfigRightFlipper
	call IsKeyPressed
	ret z
	ld hl, wCAVELightStates
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld a, e
	ld [hld], a
	ld a, b
	ld [hld], a
	ld a, c
	ld [hld], a
	ld a, d
	ld [hl], a
	ret

INCLUDE "data/queued_tiledata/gold_field/cave_lights.asm"

ResolveBallUpgradeTriggersCollision_GoldField: ; 0x1535d
	ld a, [wWhichPinballUpgradeTrigger]
	and a
	jp z, .updatePinballUpgradeTriggersAnimation
	xor a
	ld [wWhichPinballUpgradeTrigger], a
	ld a, [wStageCollisionState]
	bit 0, a
	jp z, .updatePinballUpgradeTriggersAnimation
	ld a, [wBallUpgradeTriggersBlinking]
	and a
	jp nz, .updatePinballUpgradeTriggersAnimation
	xor a
	ld [wRightAlleyTrigger], a
	ld [wLeftAlleyTrigger], a
	ld [wSecondaryLeftAlleyTrigger], a
	call UpdateFieldStructures_GoldField
	ld a, $b
	callba CheckSpecialModeColision
	ld a, [wWhichPinballUpgradeTriggerId]
	sub $e
	ld c, a
	ld b, $0
	ld hl, wBallUpgradeTriggerStates
	add hl, bc
	ld a, [hl]
	ld [hl], $1
	and a
	ret nz
	ld bc, OneHundredPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ld hl, wBallUpgradeTriggerStates
	ld a, [hli]
	and [hl]
	inc hl
	and [hl]
	jr nz, .allTriggersOn
	lb de, $00, $09
	call PlaySoundEffect
	jp LoadPinballUpgradeTriggersGraphics_GoldField

.allTriggersOn
	ld a, $1
	ld [wBallUpgradeTriggersBlinking], a
	ld a, $80
	ld [wBallUpgradeTriggersBlinkingFramesRemaining], a
	; load approximately 1 minute of frames into wBallTypeCounter
	ld a, PINBALL_UPGRADE_FRAMES_COUNTER & $ff
	ld [wBallTypeCounter], a
	ld a, PINBALL_UPGRADE_FRAMES_COUNTER >> 8
	ld [wBallTypeCounter + 1], a
	ld bc, FourHundredPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ld a, [wBallType]
	cp GS_BALL
	jr z, .gsBall
	lb de, $06, $3a
	call PlaySoundEffect
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld de, FieldMultiplierText
	ld hl, wScrollingText1
	call LoadScrollingText
	callba UpgradeBall
	jr .done

.gsBall
	lb de, $0f, $4d
	call PlaySoundEffect
	ld bc, OneMillionPoints
	callba AddBigBCD6FromQueue
	ld bc, $0100
	ld de, $0000
	push bc
	push de
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText2
	ld de, DigitsText1to8
	call Func_32cc
	pop de
	pop bc
	ld hl, wScrollingText1
	ld de, FieldMultiplierSpecialBonusText
	call LoadScrollingText
.done
	callba TransitionPinballUpgrade
	jr LoadPinballUpgradeTriggersGraphics_GoldField

.updatePinballUpgradeTriggersAnimation
	call UpdatePinballUpgradeBlinkingAnimation_GoldField
	ret z

LoadPinballUpgradeTriggersGraphics_GoldField:
; Loads the on or off graphics for each of the 3 pinball upgrade trigger dots, depending on their current toggle state.
	ld a, [wStageCollisionState]
	bit 0, a
	ret z
	ld hl, wBallUpgradeTriggerStates + 2
	ld b, $3
.loop
	ld a, [hld]
	push hl
	call LoadPinballUpgradeTriggerGraphics_GoldField
	pop hl
	dec b
	jr nz, .loop
	ret

LoadPinballUpgradeTriggerGraphics_GoldField: ; 0x15465
; Loads the on or off graphics for one of the 3 pinball upgrade trigger dots, depending on its current toggle state.
; Input: a = toggle state
	and a
	jr z, .toggledOff
	ld a, [hGameBoyColorFlag]
	and a
	jr nz, .toggledOnGameboy
	ld hl, TileDataPointers_15511_GoldField
	jr .load

.toggledOnGameboy
	ld hl, TileDataPointers_15543_GoldField
	jr .load

.toggledOff
	ld a, [hGameBoyColorFlag]
	and a
	jr nz, .toggledOffGameboy
	ld hl, TileDataPointers_15517_GoldField
	jr .load

.toggledOffGameboy
	ld hl, TileDataPointers_15549_GoldField
.load
	push bc
	dec b
	sla b
	ld e, b
	ld d, $0
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, Bank(TileDataPointers_15511_GoldField)
	ld de, LoadTileLists
	call QueueGraphicsToLoadWithFunc
	pop bc
	ret

LoadDisabledPinballUpgradeTriggerGraphics_GoldField: ; 0x15499
	ld a, [hGameBoyColorFlag]
	and a
	ret nz
	ld b, $3
.loop
	push hl
	xor a
	call LoadPinballUpgradeTriggerGraphics_GoldField
	pop hl
	dec b
	jr nz, .loop
	ret

UpdatePinballUpgradeBlinkingAnimation_GoldField: ; 0x154a9
	ld a, [wBallUpgradeTriggersBlinking]
	and a
	jr z, .notBlinking
	ld a, [wBallUpgradeTriggersBlinkingFramesRemaining]
	dec a
	ld [wBallUpgradeTriggersBlinkingFramesRemaining], a
	jr nz, .stillBlinking
	ld [wBallUpgradeTriggersBlinking], a
.stillBlinking
	and $7
	jr nz, .dontFlipState
	; Blink the triggers on or off
	ld a, [wBallUpgradeTriggersBlinkingFramesRemaining]
	srl a
	srl a
	srl a
	and $1
	ld hl, wBallUpgradeTriggerStates
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $1
	and a
	ret

.dontFlipState
	xor a
	ret

.notBlinking
	ld hl, wKeyConfigLeftFlipper
	call IsKeyPressed
	jr z, .checkRightFlipperKeyPress
	ld hl, wBallUpgradeTriggerStates
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld e, a
	ld a, c
	ld [hld], a
	ld a, e
	ld [hld], a
	ld a, b
	ld [hl], a
	ret

.checkRightFlipperKeyPress
	ld hl, wKeyConfigRightFlipper
	call IsKeyPressed
	ret z
	ld hl, wBallUpgradeTriggerStates
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld e, a
	ld a, b
	ld [hld], a
	ld a, c
	ld [hld], a
	ld a, e
	ld [hl], a
	ret

BallTypeDegradationGoldField: ; 0x1550b
; Determines the previous upgrade for the Ball.
	db POKE_BALL   ; POKE_BALL -> POKE_BALL
	db POKE_BALL   ; GREAT_BALL -> POKE_BALL
	db GREAT_BALL  ; ULTRA_BALL -> GREAT_BALL
	db ULTRA_BALL  ; MASTER_BALL -> GREAT_BALL
	db MASTER_BALL ; GS_BALL -> MASTER_BALL

INCLUDE "data/queued_tiledata/gold_field/ball_upgrade_triggers.asm"

UpdateBallTypeUpgradeCounter_GoldField: ; 0x15575
	ld a, [wCapturingMon]
	and a
	ret nz
	ld hl, wBallTypeCounter
	ld a, [hli]
	ld c, a
	ld b, [hl]
	or b
	ret z
	dec bc
	ld a, b
	ld [hld], a
	ld [hl], c
	or c
	ret nz
	; counter is now 0! Degrade the ball upgrade.
	ld a, [wBallType]
	ld c, a
	ld b, $0
	ld hl, BallTypeDegradationGoldField
	add hl, bc
	ld a, [hl]
	ld [wBallType], a
	and a
	jr z, .pokeball
	; load approximately 1 minute of frames into wBallTypeCounter
	ld a, PINBALL_UPGRADE_FRAMES_COUNTER & $ff
	ld [wBallTypeCounter], a
	ld a, PINBALL_UPGRADE_FRAMES_COUNTER >> 8
	ld [wBallTypeCounter + 1], a
.pokeball
	callba TransitionPinballUpgrade
	ret

ResolveGoldStageBoardTriggerCollision: ; 0x1581f
	ld a, [wWhichBoardTrigger]
	and a
	ret z
	xor a
	ld [wWhichBoardTrigger], a
	ld bc, FivePoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ld a, [wWhichBoardTriggerId]
	sub $11
	ld c, a
	ld b, $0
	ld hl, wCollidedAlleyTriggers
	add hl, bc
	ld [hl], $1
	ld a, [wCollidedAlleyTriggers + 0]
	and a
	call nz, HandleSecondaryLeftAlleyTrigger_GoldField
	ld a, [wCollidedAlleyTriggers + 1]
	and a
	call nz, HandleThirdLeftAlleyTrigger_GoldField
	ld a, [wCollidedAlleyTriggers + 2]
	and a
	call nz, HandleSecondaryStaryuAlleyTrigger_GoldField
	ld a, [wCollidedAlleyTriggers + 3]
	and a
	call nz, HandleLeftAlleyTrigger_GoldField
	ld a, [wCollidedAlleyTriggers + 4]
	and a
	call nz, HandleStaryuAlleyTrigger_GoldField
	; Ball passed over the second Staryu alley trigger point in the Gold Field.
	ld a, [wCollidedAlleyTriggers + 5]
	and a
	call nz, HandleSecondaryRightAlleyTrigger_GoldField
	ld a, [wCollidedAlleyTriggers + 6]
	and a
	call nz, HandleRightAlleyTrigger_GoldField
	ld a, [wCollidedAlleyTriggers + 7]
	and a
	call nz, HandleThirdRightAlleyTrigger_GoldField
	ret

HandleSecondaryLeftAlleyTrigger_GoldField: ; 0x1587c
; Ball passed over the secondary left alley trigger point in the Gold Field.
; This is the trigger that is covered up by Ditto when evolution mode isn't available.
	xor a
	ld [wCollidedAlleyTriggers + 0], a
	ld a, [wLeftAlleyTrigger]
	and a
	ret z
	xor a
	ld [wLeftAlleyTrigger], a
	ld a, $1
	callba CheckSpecialModeColision
	ret c
	ld a, [wLeftAlleyCount]
	cp $3
	ret z
	inc a
	ld [wLeftAlleyCount], a
	set 7, a
	ld [wIndicatorStates], a
	cp $83
	ret nz
	ld a, [wStageCollisionState]
	and $1
	or $6
	ld [wStageCollisionState], a
	callba LoadStageCollisionAttributes
	call LoadFieldStructureGraphics_GoldField
	ret

HandleThirdLeftAlleyTrigger_GoldField: ; 0x158c0
; Ball passed over the third left alley trigger point in the Gold Field.
; This is the trigger that is NOT covered up by Ditto when evolution mode isn't available. It's located just to to the left of the top of the Voltorg area.
	xor a
	ld [wCollidedAlleyTriggers + 1], a
	ld a, [wLeftAlleyTrigger]
	and a
	ret z
	xor a
	ld [wLeftAlleyTrigger], a
	ld a, $1
	callba CheckSpecialModeColision
	ret c
	ld a, [wLeftAlleyCount]
	cp $3
	ret z
	inc a
	ld [wLeftAlleyCount], a
	set 7, a
	ld [wIndicatorStates], a
	cp $83
	ret nz
	ld a, [wStageCollisionState]
	and $1
	or $6
	ld [wStageCollisionState], a
	callba LoadStageCollisionAttributes
	call LoadFieldStructureGraphics_GoldField
	ret

HandleSecondaryStaryuAlleyTrigger_GoldField: ; 0x15904
; Ball passed over the second Staryu alley trigger point in the Gold Field.
	xor a
	ld [wCollidedAlleyTriggers + 2], a
	ld a, [wSecondaryLeftAlleyTrigger]
	and a
	ret z
	xor a
	ld [wSecondaryLeftAlleyTrigger], a
	ld a, $3
	callba CheckSpecialModeColision
	ret

HandleLeftAlleyTrigger_GoldField: ; 0x1591e
; Ball passed over the left alley trigger point in the Gold Field.
	xor a
	ld [wCollidedAlleyTriggers + 3], a
	ld [wRightAlleyTrigger], a
	ld [wSecondaryLeftAlleyTrigger], a
	ld a, $1
	ld [wLeftAlleyTrigger], a
	call UpdateFieldStructures_GoldField
	ret

HandleStaryuAlleyTrigger_GoldField: ; 0x15931
; Ball passed over the first Staryu alley trigger point in the Gold Field.
	xor a
	ld [wCollidedAlleyTriggers + 4], a
	ld [wRightAlleyTrigger], a
	ld [wLeftAlleyTrigger], a
	ld a, $1
	ld [wSecondaryLeftAlleyTrigger], a
	call UpdateFieldStructures_GoldField
	ret

HandleSecondaryRightAlleyTrigger_GoldField: ; 0x15944
; Ball passed over the secondary right alley trigger point in the Gold Field.
	xor a
	ld [wCollidedAlleyTriggers + 5], a
	ld a, [wRightAlleyTrigger]
	and a
	ret z
	xor a
	ld [wRightAlleyTrigger], a
	ld a, $2
	callba CheckSpecialModeColision
	ret c
	ld a, [wRightAlleyCount]
	cp $3
	ret z
	inc a
	ld [wRightAlleyCount], a
	cp $3
	jr z, .asm_1596e
	set 7, a
.asm_1596e
	ld [wIndicatorStates + 1], a
	ld a, [wRightAlleyCount]
	cp $2
	ret c
	ld a, $80
	ld [wIndicatorStates + 3], a
	ret

HandleRightAlleyTrigger_GoldField: ; 0x1597d
; Ball passed over the right alley trigger point in the Gold Field.
	xor a
	ld [wCollidedAlleyTriggers + 6], a
	ld [wLeftAlleyTrigger], a
	ld [wSecondaryLeftAlleyTrigger], a
	ld a, $1
	ld [wRightAlleyTrigger], a
	call UpdateFieldStructures_GoldField
	ret

HandleThirdRightAlleyTrigger_GoldField: ; 0x15990
	xor a
	ld [wCollidedAlleyTriggers + 7], a
	ld a, [wRightAlleyTrigger]
	and a
	ret z
	xor a
	ld [wRightAlleyTrigger], a
	ld a, $2
	callba CheckSpecialModeColision
	ret c
	ld a, [wRightAlleyCount]
	cp $3
	ret z
	inc a
	ld [wRightAlleyCount], a
	cp $3
	jr z, .asm_159ba
	set 7, a
.asm_159ba
	ld [wIndicatorStates + 1], a
	ld a, [wRightAlleyCount]
	cp $2
	ret c
	ld a, $80
	ld [wIndicatorStates + 3], a
	ret

UpdateFieldStructures_GoldField: ; 0x159c9
; The Gold field's top half has some dynamic strucutres, such as Ditto, the lightning bolt guard rail, and the roof over the 3 Voltorbs.
	ld a, [wd7ad]
	bit 7, a
	ret nz
	ld c, a
	ld a, [wStageCollisionState]
	and $1
	or c
	ld [wStageCollisionState], a
	ld a, $ff
	ld [wd7ad], a
	callba LoadStageCollisionAttributes
	call LoadFieldStructureGraphics_GoldField
	ld a, $1
	ld [wd580], a
	call LoadTimerGraphics
	ret

LoadFieldStructureGraphics_GoldField: ; 0x159f4
; Based on the current stage collision state, load the proper graphics.
; Things that change on the Gold field are Ditto, the lightning bolt guard rail, and the roof over the 3 Voltorbs.
	ld a, [hLCDC]
	bit 7, a
	jr z, .asm_15a13
	ld a, [wd7f2]
	and $fe
	ld c, a
	ld a, [wStageCollisionState]
	and $fe
	cp c
	jr z, .asm_15a13
	add c
	cp $2
	jr z, .asm_15a13
	lb de, $00, $00
	call PlaySoundEffect
.asm_15a13
	ld a, [wd7f2]
	swap a
	ld c, a
	ld a, [wStageCollisionState]
	sla a
	or c
	ld c, a
	ld b, $0
	ld hl, TileDataPointers_15a3f_GoldField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_15a2d
	ld hl, TileDataPointers_15d05_GoldField
.asm_15a2d
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, Bank(TileDataPointers_15a3f_GoldField)
	call QueueGraphicsToLoad
	ld a, [wStageCollisionState]
	ld [wd7f2], a
	ret

INCLUDE "data/queued_tiledata/gold_field/structures.asm"

ResolveBellsproutCollision_GoldField: ; 0x15e93
	ld a, [wBellsproutCollision]
	and a
	jr z, .asm_15eda
	xor a
	ld [wBellsproutCollision], a
	ld bc, TenThousandPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	lb de, $00, $05
	call PlaySoundEffect
	ld hl, BellsproutAnimationData_GoldField
	ld de, wBellsproutAnimation
	call InitAnimation
	xor a
	ld [wBallXVelocity], a
	ld [wBallXVelocity + 1], a
	ld [wBallYVelocity], a
	ld [wBallYVelocity + 1], a
	ld [wBallXPos], a
	ld [wBallYPos], a
	ld a, $7c
	ld [wBallXPos + 1], a
	ld a, $78
	ld [wBallYPos + 1], a
	xor a
	ld [wEnableBallGravityAndTilt], a
.asm_15eda
	ld hl, BellsproutAnimationData_GoldField
	ld de, wBellsproutAnimation
	call UpdateAnimation
	push af
	ld a, [wBellsproutAnimationFrameCounter]
	and a
	jr nz, .asm_15ef8
	ld a, $19
	ld [wBellsproutAnimationFrameCounter], a
	xor a
	ld [wBellsproutAnimationFrame], a
	ld a, $6
	ld [wBellsproutAnimationIndex], a
.asm_15ef8
	pop af
	ret nc
	ld a, [wBellsproutAnimationIndex]
	cp $1
	jr nz, .asm_15f35
	xor a
	ld [wPinballIsVisible], a
	ld a, [wRightAlleyCount]
	cp $2
	jr c, .noCatchEmMode
	ld a, $10
	jr nz, .startCatchEmMode
	xor a
.startCatchEmMode
	ld [wRareMonsFlag], a
	callba StartCatchEmMode
.noCatchEmMode
	ld hl, wNumBellsproutEntries
	call Increment_Max100
	ret nc
	ld c, $19
	call Modulo_C
	callba z, AddExtraBall
	ret

.asm_15f35
	ld a, [wBellsproutAnimationIndex]
	cp $4
	jr nz, .asm_15f42
	ld a, $1
	ld [wPinballIsVisible], a
	ret

.asm_15f42
	ld a, [wBellsproutAnimationIndex]
	cp $5
	ret nz
	ld a, $1
	ld [wEnableBallGravityAndTilt], a
	xor a
	ld [wBallXVelocity + 1], a
	ld a, $2
	ld [wBallYVelocity + 1], a
	lb de, $00, $06
	call PlaySoundEffect
	ld a, $5
	callba CheckSpecialModeColision
	ret

BellsproutAnimationData_GoldField: ; 0x15f69
; Each entry is [duration][OAM id]
	db $08, $01
	db $06, $02
	db $20, $03
	db $06, $02
	db $08, $01
	db $01, $00
	db $29, $00
	db $28, $01
	db $2A, $00
	db $27, $01
	db $29, $00
	db $28, $01
	db $2B, $00
	db $28, $01
	db $00  ; terminator

ResolveBumpersCollision_GoldField: ; 0x15f86
	ld a, [wWhichBumper]
	and a
	jr z, .noNewCollision
	call LoadBumpersGraphics_GoldField
	call LightUpBumper_GoldField
	xor a
	ld [wWhichBumper], a
	call ApplyBumperCollision_GoldField
.noNewCollision
	ld a, [wBumperLightUpDuration]
	and a
	ret z
	dec a
	ld [wBumperLightUpDuration], a
	call z, LoadBumpersGraphics_GoldField
	ret

LightUpBumper_GoldField: ; 0x15fa6
; Makes the hit bumper light up briefly
	ld a, $10
	ld [wBumperLightUpDuration], a
	ld a, [wWhichBumperId]
	sub $6
	ld [wWhichBumperGfx], a
	sla a
	inc a
	jr LoadBumperGraphics_GoldField

LoadBumpersGraphics_GoldField: ; 0x15fb8
	ld a, [wWhichBumperGfx]
	cp $ff
	ret z
	sla a
	; fall through

LoadBumperGraphics_GoldField: ; 0x15fc0
	sla a
	ld c, a
	ld b, $0
	ld hl, TileDataPointers_16010_GoldField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_15fd0
	ld hl, TileData_16080_GoldField
.asm_15fd0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(TileDataPointers_16010_GoldField)
	call QueueGraphicsToLoad
	ret

ApplyBumperCollision_GoldField: ; 0x15fda
	ld a, $ff
	ld [wRumblePattern], a
	ld a, $3
	ld [wRumbleDuration], a
	ld hl, $0200
	ld a, l
	ld [wFlipperYForce], a
	ld a, h
	ld [wFlipperYForce + 1], a
	ld a, $80
	ld [wFlipperCollision], a
	ld a, [wWhichBumperId]
	sub $6
	ld c, a
	ld b, $0
	ld hl, BumperCollisionAngleDeltas_GoldField
	add hl, bc
	ld a, [wCollisionNormalAngle]
	add [hl]
	ld [wCollisionNormalAngle], a
	lb de, $00, $0b
	call PlaySoundEffect
	ret

BumperCollisionAngleDeltas_GoldField:
	db -8, 8

INCLUDE "data/queued_tiledata/gold_field/bumpers.asm"

ResolveDittoSlotCollision_GoldField: ; 0x160f0
	ld a, [wDittoSlotCollision]
	and a
	jr z, .asm_16137
	xor a
	ld [wDittoSlotCollision], a
	ld bc, TenThousandPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	lb de, $00, $21
	call PlaySoundEffect
	xor a
	ld hl, wBallXVelocity
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wEnableBallGravityAndTilt], a
	ld [wBallXPos], a
	ld [wBallYPos], a
	ld a, $11
	ld [wBallXPos + 1], a
	ld a, $23
	ld [wBallYPos + 1], a
	ld a, $10
	ld [wDittoEnterOrExitCounter], a
	ld a, $5
	ld [wRumblePattern], a
	ld a, $8
	ld [wRumbleDuration], a
.asm_16137
	ld a, [wDittoEnterOrExitCounter]
	and a
	ret z
	dec a
	ld [wDittoEnterOrExitCounter], a
	cp $f
	jr nz, .asm_1614f
	callba LoadMiniBallGfx
	ret

.asm_1614f
	cp $c
	jr nz, .asm_1615e
	callba LoadSuperMiniPinballGfx
	ret

.asm_1615e
	cp $9
	jr nz, .asm_1616d
	xor a
	ld [wPinballIsVisible], a
	ld [wBallSpin], a
	ld [wBallRotation], a
	ret

.asm_1616d
	cp $6
	jr nz, .asm_1618e
	callba StartEvolutionMode
	ld a, $1
	ld [wPinballIsVisible], a
	ld [wEnableBallGravityAndTilt], a
	ld a, $5
	ld [wRumblePattern], a
	ld a, $8
	ld [wRumbleDuration], a
	ret

.asm_1618e
	cp $3
	jr nz, .asm_1619d
	callba LoadMiniBallGfx
	ret

.asm_1619d
	and a
	ret nz
	callba LoadBallGfx
	ld a, $2
	ld [wBallYVelocity + 1], a
	ret

ApplySlotForceField_GoldFieldBottom: ; 0x161af
; Applies the force field to the pinball when near the slot cave opening.
	ld a, [wSlotIsOpen]
	and a
	ret z
	ld a, [wBallYPos + 1]
	sub $fe
	cp $30
	ret nc
	ld c, $0
	ld b, a
	ld h, b
	ld l, c
	srl b
	rr c
	srl b
	rr c
	srl h
	rr l
	add hl, bc
	ld a, [wBallXPos + 1]
	sub $38
	cp $30
	ret nc
	ld c, a
	ld b, $0
	sla c
	sla c
	add hl, bc
	jr _ApplySlotForceField_GoldField

ApplySlotForceField_GoldFieldTop: ; 0x161e0
; Applies the force field to the pinball when near the slot cave opening.
; Even though the Slot cave is on the bottom half of the board, the force field
; still affects the pinball when it's really close to the bottom of the top-half of the board.
	ld a, [wSlotIsOpen]
	and a
	ret z
	ld a, [wBallYPos + 1]
	sub $86
	cp $30
	ret nc
	ld c, $0
	ld b, a
	ld h, b
	ld l, c
	srl b
	rr c
	srl b
	rr c
	srl h
	rr l
	add hl, bc
	ld a, [wBallXPos + 1]
	sub $38
	cp $30
	ret nc
	ld c, a
	ld b, $0
	sla c
	sla c
	add hl, bc
	; fall through

_ApplySlotForceField_GoldField: ; 0x1620f
; Applies the force field to the pinball when near the slot cave opening.
	ld bc, BallPhysicsData_f0000
	add hl, bc
	ld de, wBallXVelocity
	ld a, BANK(BallPhysicsData_f0000)
	call ReadByteFromBank
	ld c, a
	ld a, [de]
	add c
	ld [de], a
	inc de
	inc hl
	ld a, BANK(BallPhysicsData_f0000)
	call ReadByteFromBank
	ld b, a
	ld a, [de]
	adc b
	ld [de], a
	inc de
	inc hl
	push bc
	ld a, BANK(BallPhysicsData_f0000)
	call ReadByteFromBank
	ld c, a
	ld a, [de]
	add c
	ld [de], a
	inc de
	inc hl
	ld a, BANK(BallPhysicsData_f0000)
	call ReadByteFromBank
	ld b, a
	ld a, [de]
	adc b
	ld [de], a
	inc de
	inc hl
	bit 7, b
	jr z, .asm_1624e
	ld a, c
	cpl
	ld c, a
	ld a, b
	cpl
	ld b, a
	inc bc
.asm_1624e
	pop hl
	bit 7, h
	jr z, .asm_1625a
	ld a, l
	cpl
	ld l, a
	ld a, h
	cpl
	ld h, a
	inc hl
.asm_1625a
	add hl, bc
	sla l
	rl h
	ld a, h
	cp $2
	ret c
	ld a, [wRumbleDuration]
	and a
	ret nz
	ld a, $5
	ld [wRumblePattern], a
	ld a, $8
	ld [wRumbleDuration], a
	lb de, $00, $04
	call PlaySoundEffect
	ret

ResolveSlotCollision_GoldField: ; 0x16279
	ld a, [wSlotCollision]
	and a
	jr z, .noCollision
	xor a
	ld [wSlotCollision], a
	ld a, [wSlotIsOpen]
	and a
	ret z
	ld a, [wSlotEnterOrExitCounter]
	and a
	jr nz, .noCollision
	xor a
	ld hl, wBallXVelocity
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wEnableBallGravityAndTilt], a
	ld [wBallXPos], a
	ld [wBallYPos], a
	ld a, $50
	ld [wBallXPos + 1], a
	ld a, $16
	ld [wBallYPos + 1], a
	ld a, $13
	ld [wSlotEnterOrExitCounter], a
.noCollision
	ld a, [wSlotEnterOrExitCounter]
	and a
	ret z
	dec a
	ld [wSlotEnterOrExitCounter], a
	ld a, $18
	ld [wSlotGlowingAnimationCounter], a
	ld a, [wSlotEnterOrExitCounter]
	cp $12
	jr nz, .asm_162d4
	lb de, $00, $21
	call PlaySoundEffect
	callba LoadMiniBallGfx
	ret

.asm_162d4
	cp $f
	jr nz, .asm_162e3
	callba LoadSuperMiniPinballGfx
	ret

.asm_162e3
	cp $c
	jr nz, .asm_162f2
	xor a
	ld [wPinballIsVisible], a
	ld [wBallSpin], a
	ld [wBallRotation], a
	ret

.asm_162f2
	cp $9
	jr nz, .asm_162fa
	call DoSlotLogic_GoldField
	ret

.asm_162fa
	cp $6
	jr nz, .asm_16317
	xor a
	ld [wSlotIsOpen], a
	ld a, $5
	ld [wRumblePattern], a
	ld a, $8
	ld [wRumbleDuration], a
	callba LoadMiniBallGfx
	ret

.asm_16317
	cp $3
	jr nz, .asm_16330
	callba LoadBallGfx
	ld a, $2
	ld [wBallYVelocity + 1], a
	ld a, $80
	ld [wBallXVelocity], a
	ret

.asm_16330
	and a
	ret nz
	call LoadSlotCaveCoverGraphics_GoldField
	ld a, [wCatchEmOrEvolutionSlotRewardActive]
	cp CATCHEM_MODE_SLOT_REWARD
	ret nz
	call GenRandom
	and $10
	ld [wRareMonsFlag], a
	callba StartCatchEmMode
	xor a
	ld [wCatchEmOrEvolutionSlotRewardActive], a
	ret

DoSlotLogic_GoldField: ; 0x16352
; Performs the slot logic when pinball entered the slot cave.
; This could be the slot roulette, or evolving a pokemon, for example.
	xor a
	ld [wIndicatorStates + 4], a
	ld a, $d
	callba CheckSpecialModeColision
	jr nc, .asm_1636d
	ld a, $1
	ld [wPinballIsVisible], a
	ld [wEnableBallGravityAndTilt], a
	ret

.asm_1636d
	ld a, [wPreviousNumPokeballs]
	cp $3
	jr nz, .asm_163b3
	ld a, [wFramesUntilSlotCaveOpens]
	and a
	jr nz, .asm_163b3
.goToBonusStage
	ld a, [wBonusStageSlotRewardActive]
	and a
	jr nz, .asm_16389
	xor a
	ld [wNumPokeballs], a
	ld a, $40
	ld [wPokeballBlinkingCounter], a
.asm_16389
	xor a
	ld [wBonusStageSlotRewardActive], a
	ld a, $1
	ld [wGoingToBonusStage], a
	ld [wMoveToNextScreenState], a
	ld a, [wNextBonusStage]
	ld c, a
	ld b, $0
	ld hl, BonusStages_GoldField
	add hl, bc
	ld a, [hl]
	ld [wNextStage], a
	call ShowScrollingGoToBonusText_GoldField
	xor a
	ld [wOpenedSlotByGetting3Pokeballs], a
	ld [wCatchEmOrEvolutionSlotRewardActive], a
	ld a, $1e
	ld [wFramesUntilSlotCaveOpens], a
	ret

.asm_163b3
	callba DoSlotRewardRoulette
	xor a
	ld [wOpenedSlotByGetting4CAVELights], a
	ld a, [wSlotRouletteBillboardPicture]
	cp BILLBOARD_GENGAR_BONUS
	jr nc, .goToBonusStage
	ld a, $1
	ld [wPinballIsVisible], a
	ld [wEnableBallGravityAndTilt], a
	ld a, [wCatchEmOrEvolutionSlotRewardActive]
	cp EVOLUTION_MODE_SLOT_REWARD
	ret nz
	callba StartEvolutionMode
	ld a, [wd7ad]
	ld c, a
	ld a, [wStageCollisionState]
	and $1
	or c
	ld [wStageCollisionState], a
	xor a
	ld [wCatchEmOrEvolutionSlotRewardActive], a
	ret

ShowScrollingGoToBonusText_GoldField: ; 0x163f2
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText3
	ld a, [wNextStage]
	ld de, GoToDiglettStageText
	cp STAGE_DIGLETT_BONUS
	jr z, .asm_1640f
	ld de, GoToGengarStageText
	cp STAGE_GENGAR_BONUS
	jr z, .asm_1640f
	ld de, GoToMewtwoStageText
.asm_1640f
	call LoadScrollingText
	ld de, MUSIC_NOTHING
	call PlaySong
	rst AdvanceFrame
	lb de, $3c, $23
	call PlaySoundEffect
	ret

BonusStages_GoldField:
	db STAGE_GENGAR_BONUS
	db STAGE_MEWTWO_BONUS
	db STAGE_MEOWTH_BONUS
	db STAGE_DIGLETT_BONUS
	db STAGE_SEEL_BONUS

LoadSlotCaveCoverGraphics_GoldField: ; 0x16425
; Loads the graphics for the circular slot cave area.
; It looks like a cover that opens and closes.
	ld a, [wCurrentStage]
	and $1
	sla a
	ld c, a
	ld a, [wSlotIsOpen]
	add c
	sla a
	ld c, a
	ld b, $0
	ld hl, TileDataPointers_1644d_GoldField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_16441
	ld hl, TileDataPointers_164a1_GoldField
.asm_16441
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, Bank(TileDataPointers_1644d_GoldField)
	call QueueGraphicsToLoad
	ret

INCLUDE "data/queued_tiledata/gold_field/slot_cave.asm"

OpenSlotCave_GoldField: ; 0x164e3
	ld a, [wFramesUntilSlotCaveOpens]
	and a
	ret z
	dec a
	ld [wFramesUntilSlotCaveOpens], a
	ret nz
	ld a, [wInSpecialMode]
	and a
	ret nz
	ld a, [wOpenedSlotByGetting3Pokeballs]
	and a
	jr z, .asm_164ff
	ld a, [wNextBonusStage]
	add $3
	jr .asm_16506

.asm_164ff
	ld a, [wOpenedSlotByGetting4CAVELights]
	and a
	ret z
	ld a, $8 ; "Slot On" billboard picture id
.asm_16506
	ld hl, wCurrentStage
	bit 0, [hl]
	callba nz, LoadBillboardTileData
	ld a, [wSlotIsOpen]
	and a
	ret nz
	ld a, $1
	ld [wSlotIsOpen], a
	ld a, $80
	ld [wIndicatorStates + 4], a
	ld a, [wCurrentStage]
	bit 0, a
	call nz, LoadSlotCaveCoverGraphics_GoldField
	ret

ResolveGoldStagePinballLaunchCollision: ; 0x1652d
	ld a, [wPinballLaunchCollision]
	and a
	ret z
	xor a
	ld [wPinballLaunchCollision], a ; set to 0, so we only check for a launch once per frame
	ld a, [wPinballLaunched]
	and a
	jr z, .notLaunchedYet
	xor a
	ld [wRightAlleyTrigger], a
	ld [wLeftAlleyTrigger], a
	ld [wSecondaryLeftAlleyTrigger], a
	ld hl, wBallXVelocity
	ld [hli], a
	ld [hl], a
	ld [wBallSpin], a
	ld [wBallRotation], a
	ld a, $80
	ld [wBallYVelocity], a
	ld a, $fa
	ld [wBallYVelocity + 1], a
	ld a, $1
	ld [wEnableBallGravityAndTilt], a
	lb de, $00, $0a
	call PlaySoundEffect
.notLaunchedYet
	ld a, $ff
	ld [wPreviousTriggeredGameObject], a
	ld a, [wPinballLaunched]
	and a
	ret nz
	ld a, [wChoseInitialMap]
	and a
	jr nz, .checkPressedKeysToLaunchBall
	call ChooseInitialMap_GoldField
	ld a, $1
	ld [wChoseInitialMap], a
	ld [wPinballLaunched], a
	ret

.checkPressedKeysToLaunchBall
	ld hl, wKeyConfigBallStart
	call IsKeyPressed
	ret z
	ld a, $1
	ld [wPinballLaunched], a
	ret

ChooseInitialMap_GoldField: ; 0x1658f
; While waiting to launch the pinball, this quickly rotates the billboard with the initial
; maps the player can start on.
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, LoadGreyBillboardPaletteData
.showNextMap
	ld a, [wInitialMapSelectionIndex]
	inc a
	cp $7  ; number of maps to choose from at the start of play
	jr c, .gotMapId
	xor a  ; wrap around to 0
.gotMapId
	ld [wInitialMapSelectionIndex], a
	ld c, a
	ld b, $0
	ld hl, GoldStageInitialMaps
	add hl, bc
	ld a, [hl]
	ld [wCurrentMap], a
	push af
	lb de, $00, $48
	call PlaySoundEffect
	pop af
	callba LoadMapBillboardPicture
	ld b, $A  ; number of frames to delay before the next map is shown
.waitOnCurrentMap
	push bc
	rst AdvanceFrame
	ld hl, wKeyConfigBallStart
	call IsKeyPressed
	jr nz, .ballStartKeyPressed
	pop bc
	dec b
	jr nz, .waitOnCurrentMap
	jr .showNextMap

.ballStartKeyPressed
	pop bc
	callba LoadMapBillboardTileData
	ld bc, StartFromMapText
	callba LoadScrollingMapNameText
	ld a, [wCurrentMap]
	ld [wVisitedMaps], a
	xor a
	ld [wNumMapMoves], a
	ret

GoldStageInitialMaps: ; 0x16605
	db NEW_BARK_TOWN
	db VIOLET_CITY
	db RUINS_OF_ALPH
	db LAKE_OF_RAGE
	db ECRUTEAK_CITY
	db ILEX_FOREST
	db GOLDENROD_CITY

ResolveGoldStagePikachuCollision: ; 0x1660c
	ld a, [wWhichPikachu]
	and a
	jr z, .asm_1667b
	xor a
	ld [wWhichPikachu], a
	ld a, [wd51c]
	and a
	jr nz, .asm_1667b
	ld a, [wPikachuSaverSlotRewardActive]
	and a
	jr nz, .asm_16634
	ld a, [wWhichPikachuId]
	sub $1c
	ld hl, wWhichPikachuSaverSide
	cp [hl]
	jr nz, .asm_1667b
	ld a, [wPikachuSaverCharge]
	cp MAX_PIKACHU_SAVER_CHARGE
	jr nz, .asm_16667
.asm_16634
	ld hl, PikachuSaverAnimationData_GoldField
	ld de, wPikachuSaverAnimation
	call InitAnimation
	ld a, [wPikachuSaverSlotRewardActive]
	and a
	jr nz, .asm_16647
	xor a
	ld [wPikachuSaverCharge], a
.asm_16647
	ld a, $1
	ld [wd51c], a
	xor a
	ld [wBallXVelocity], a
	ld [wBallXVelocity + 1], a
	ld [wBallYVelocity], a
	ld [wBallYVelocity + 1], a
	ld [wBallSpin], a
	ld [wBallRotation], a
	ld [wEnableBallGravityAndTilt], a
	call FillBottomMessageBufferWithBlackTile
	jr .asm_1667b

.asm_16667
	ld hl, PikachuSaverAnimation2Data_GoldField
	ld de, wPikachuSaverAnimation
	call InitAnimation
	ld a, $2
	ld [wd51c], a
	lb de, $00, $3b
	call PlaySoundEffect
.asm_1667b
	ld a, [wd51c]
	and a
	call z, SetPikachuSaverSide_GoldField
	call UpdatePikachuSaverAnimation_GoldField
	ld a, [wPikachuSaverCharge]
	cp MAX_PIKACHU_SAVER_CHARGE
	ret nz
	ld a, [wd51e]
	and a
	ret z
	dec a
	ld [wd51e], a
	cp $5a
	ret nz
	lb de, $0f, $22
	call PlaySoundEffect
	ret

UpdatePikachuSaverAnimation_GoldField: ; 0x1669e
	ld a, [wd51c]
	cp $1
	jr nz, .asm_16719
	ld hl, PikachuSaverAnimationData_GoldField
	ld de, wPikachuSaverAnimation
	call UpdateAnimation
	ret nc
	ld a, [wPikachuSaverAnimationIndex]
	cp $1
	jr nz, .asm_166f7
	xor a
	ld [wAudioEngineEnabled], a
	call Func_310a
	rst AdvanceFrame
	ld a, $1
	callba PlayPikachuSoundClip
	ld a, $1
	ld [wAudioEngineEnabled], a
	ld a, $ff
	ld [wRumblePattern], a
	ld a, $60
	ld [wRumbleDuration], a
	ld hl, wNumPikachuSaves
	call Increment_Max100
	jr nc, .asm_166f0
	ld c, $a
	call Modulo_C
	callba z, AddExtraBall
.asm_166f0
	lb de, $16, $10
	call PlaySoundEffect
	ret

.asm_166f7
	ld a, [wPikachuSaverAnimationIndex]
	cp $11
	ret nz
	ld a, $fc
	ld [wBallYVelocity + 1], a
	ld a, $1
	ld [wEnableBallGravityAndTilt], a
	ld bc, FiveThousandPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	xor a
	ld [wd51c], a
	ret

.asm_16719
	cp $2
	jr nz, .asm_16732
	ld hl, PikachuSaverAnimation2Data_GoldField
	ld de, wPikachuSaverAnimation
	call UpdateAnimation
	ret nc
	ld a, [wPikachuSaverAnimationIndex]
	cp $1
	ret nz
	xor a
	ld [wd51c], a
	ret

.asm_16732
	ld a, [hFrameCounter]
	swap a
	and $1
	ld [wPikachuSaverAnimationFrame], a
	ret

PikachuSaverAnimationData_GoldField: ; 0x1673c
; Each entry is [duration][OAM id]
	db $0C, $02
	db $05, $03
	db $05, $02
	db $05, $04
	db $05, $05
	db $05, $02
	db $06, $06
	db $06, $07
	db $06, $08
	db $06, $02
	db $06, $05
	db $06, $08
	db $06, $07
	db $06, $02
	db $06, $08
	db $06, $07
	db $06, $02
	db $01, $00
	db $00

PikachuSaverAnimation2Data_GoldField: ; 0x16761
; Each entry is [duration][OAM id]
	db $0C, $02
	db $01, $00
	db $00

SetPikachuSaverSide_GoldField: ; 0x16766
; Sets which side Pikachu is on, depending on which flipper was pressed last.
	ld hl, wKeyConfigLeftFlipper
	call IsKeyPressed2
	jr z, .checkRightFlipperKeyPress
	ld hl, wWhichPikachuSaverSide
	ld [hl], $0
	ret

.checkRightFlipperKeyPress
	ld hl, wKeyConfigRightFlipper
	call IsKeyPressed2
	ret z
	ld hl, wWhichPikachuSaverSide
	ld [hl], $1
	ret

ResolveStaryuCollision_Top_GoldField: ; 0x16781
	ld a, [wStaryuCollision]
	and a
	jr z, .asm_167bd
	xor a
	ld [wStaryuCollision], a
	ld a, [wd503]
	and a
	jr nz, .asm_167c2
	ld bc, FiveThousandPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ld a, [wd502]
	xor $1
	set 1, a ;inverts the current number, then setas bit 1
	ld [wd502], a
	ld a, $14
	ld [wd503], a
	call LoadStaryuGraphics_Top_GoldField
	ld a, $6
	callba CheckSpecialModeColision
	ret

.asm_167bd
	ld a, [wd503]
	and a
	ret z
.asm_167c2
	dec a
	ld [wd503], a
	ret nz
	ld a, [wd502] ;reset 1
	res 1, a
	ld [wd502], a
	call LoadStaryuGraphics_Top_GoldField
	ld a, [wd502]
	and $1
	ld c, a
	ld a, [wStageCollisionState]
	and $fe
	or c
	ld [wStageCollisionState], a
	callba LoadStageCollisionAttributes
	call LoadFieldStructureGraphics_GoldField
	lb de, $00, $07
	call PlaySoundEffect
	ld a, [wStageCollisionState]
	bit 0, a
	jp nz, LoadPinballUpgradeTriggersGraphics_GoldField
	jp LoadDisabledPinballUpgradeTriggerGraphics_GoldField

ResolveStaryuCollision_Bottom_GoldField: ; 0x167ff
	ld a, [wStaryuCollision]
	and a
	jr z, .noCollision
	xor a
	ld [wStaryuCollision], a
	ld a, [wd503]
	and a
	jr nz, .asm_1683e
	ld bc, FiveThousandPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ld a, [wd502]
	xor $1
	ld [wd502], a ;flip bit 0
	ld a, $14
	ld [wd503], a
	call LoadStaryuGraphics_Bottom_GoldField
	ld a, $6
	callba CheckSpecialModeColision
	ret

.noCollision
	ld a, [wd503]
	and a
	ret z
.asm_1683e
	dec a
	ld [wd503], a
	ret nz
	ld a, [wd502] 
	and $1
	ld c, a
	ld a, [wStageCollisionState]
	and $fe
	or c
	ld [wStageCollisionState], a
	lb de, $00, $07
	call PlaySoundEffect
	ret

LoadStaryuGraphics_Top_GoldField: ; 0x16859
	ld a, [wd502]
	sla a
	ld c, a
	ld b, $0
	ld hl, LoadChinchouStateTable
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, Bank(LoadChinchouStateTable)
	call QueueGraphicsToLoad
	ret

LoadStaryuGraphics_Bottom_GoldField: ; 0x16878
	ld a, [wd502]
	and $1
	sla a
	ld c, a
	ld b, $0
	ld hl, TileDataPointers_16980_GoldField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, Bank(TileDataPointers_16980_GoldField)
	call QueueGraphicsToLoad
	ret

INCLUDE "data/queued_tiledata/gold_field/staryu_bumper.asm"

UpdateArrowIndicators_GoldField: ; 0x169a6
; Updates the 5 blinking arrow indicators in the gold field bottom.
	ld a, [hFrameCounter]
	and $1f
	ret nz
	ld bc, $0000
.loop
	push bc
	ld hl, wIndicatorStates
	add hl, bc
	bit 7, [hl]
	jr z, .asm_169c5
	ld a, [hl]
	res 7, a
	ld hl, hFrameCounter
	bit 5, [hl]
	jr z, .asm_169c2
	inc a
.asm_169c2
	call LoadArrowIndicatorGraphics_GoldField
.asm_169c5
	pop bc
	inc c
	ld a, c
	cp $5
	jr nz, .loop
	ret

LoadArrowIndicatorGraphics_GoldField: ; 0x169cd
	push af
	sla c ;double offset
	ld hl, TileDataPointers_169ed_GoldField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_169db
	ld hl, TileDataPointers_16bef_GoldField
.asm_169db
	add hl, bc ;add offset, load pointer into HL
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	sla a
	ld c, a
	add hl, bc ;add offset to second pointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(TileDataPointers_169ed_GoldField)
	call QueueGraphicsToLoad
	ret

INCLUDE "data/queued_tiledata/gold_field/arrow_indicators.asm"

ResolveGoldStageBonusMultiplierCollision: ; 016d9d
	ld a, [wWhichBonusMultiplierRailing]
	and a
	jp z, UpdateBonusMultiplierRailing_GoldField
	xor a
	ld [wWhichBonusMultiplierRailing], a
	lb de, $00, $0d
	call PlaySoundEffect
	ld a, [wWhichBonusMultiplierRailingId]
	sub $21
	jr nz, .hitRightRailing
	ld a, $9
	callba CheckSpecialModeColision
	ld a, [wd610]
	cp $3
	jr nz, .asm_16e35
	ld a, $1
	ld [wd610], a
	ld a, $3
	ld [wd611], a
	ld a, [wBonusMultiplierTensDigit]
	set 7, a
	ld [wBonusMultiplierTensDigit], a
	jr .asm_16e35

.hitRightRailing
	ld a, $a
	callba CheckSpecialModeColision
	ld a, [wd611]
	cp $3
	jr nz, .asm_16e35
	ld a, $1
	ld [wd610], a
	ld a, $1
	ld [wd611], a
	ld a, $80
	ld [wd612], a
	ld a, [wBonusMultiplierOnesDigit]
	set 7, a
	ld [wBonusMultiplierOnesDigit], a
	ld a, [wCurBonusMultiplier]
	inc a
	cp MAX_BONUS_MULTIPLIER + 1
	jr c, .asm_16e10
	ld a, MAX_BONUS_MULTIPLIER
.asm_16e10
	ld [wCurBonusMultiplier], a
	jr nc, .asm_16e24
	ld c, $19
	call Modulo_C
	callba z, AddExtraBall
.asm_16e24
	ld a, [wBonusMultiplierTensDigit]
	ld [wd614], a
	ld a, [wBonusMultiplierOnesDigit]
	ld [wd615], a
	ld a, $1
	ld [wShowBonusMultiplierBottomMessage], a
.asm_16e35
	ld bc, TenPoints
	callba AddBigBCD6FromQueueWithBallMultiplier
	ld a, [wBonusMultiplierTensDigit]
	call _LoadBonusMultiplierRailingGraphics_GoldField
	ld a, [wBonusMultiplierOnesDigit]
	add $14
	call _LoadBonusMultiplierRailingGraphics_GoldField
	ret

UpdateBonusMultiplierRailing_GoldField: ; 0x16e51
	call ShowBonusMultiplierMessage_GoldField ; only shows the scrolling message when appropriate
	ld a, [wd612]
	and a
	jr z, .asm_16e8f
	dec a
	ld [wd612], a
	cp $70
	jr nz, .asm_16e6e
	ld a, $2
	ld [wd610], a
	ld a, $2
	ld [wd611], a
	jr .asm_16e8f

.asm_16e6e
	and a
	jr nz, .asm_16e8f
	ld a, $3
	ld [wd610], a
	xor a
	ld [wd611], a
	ld a, [wCurBonusMultiplier]
	callba GetBCDForNextBonusMultiplier
	ld a, [wBonusMultiplierTensDigit]
	call _LoadBonusMultiplierRailingGraphics_GoldField
	ld a, [wBonusMultiplierOnesDigit]
	add $14
	call _LoadBonusMultiplierRailingGraphics_GoldField
	ret

.asm_16e8f
	ld a, [wd610]
	cp $2
	jr c, .asm_16ec1
	cp $3
	ld a, [hFrameCounter]
	jr c, .asm_16ea0
	srl a
	srl a
.asm_16ea0
	ld b, a
	and $3
	jr nz, .asm_16ec1
	bit 3, b
	jr nz, .asm_16eb6
	ld a, [wBonusMultiplierTensDigit]
	res 7, a
	ld [wBonusMultiplierTensDigit], a
	call _LoadBonusMultiplierRailingGraphics_GoldField
	jr .asm_16ec1

.asm_16eb6
	ld a, [wBonusMultiplierTensDigit]
	set 7, a
	ld [wBonusMultiplierTensDigit], a
	call _LoadBonusMultiplierRailingGraphics_GoldField
.asm_16ec1
	ld a, [wd611]
	cp $2
	ret c
	cp $3
	ld a, [hFrameCounter]
	jr c, .asm_16ed1
	srl a
	srl a
.asm_16ed1
	ld b, a
	and $3
	ret nz
	bit 3, b
	jr nz, .asm_16ee7
	ld a, [wBonusMultiplierOnesDigit]
	res 7, a
	ld [wBonusMultiplierOnesDigit], a
	add $14
	call _LoadBonusMultiplierRailingGraphics_GoldField
	ret

.asm_16ee7
	ld a, [wBonusMultiplierOnesDigit]
	set 7, a
	ld [wBonusMultiplierOnesDigit], a
	add $14
	call _LoadBonusMultiplierRailingGraphics_GoldField
	ret

ShowBonusMultiplierMessage_GoldField: ; 0x16ef5
	ld a, [wBottomTextEnabled]
	and a
	ret nz
	ld a, [wShowBonusMultiplierBottomMessage]
	and a
	ret z
	xor a
	ld [wShowBonusMultiplierBottomMessage], a
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText1
	ld de, BonusMultiplierText
	call LoadScrollingText
	ld hl, wBottomMessageText + $12
	ld a, [wd614]
	and $7f
	jr z, .asm_16f1f
	add $30
	ld [hli], a
.asm_16f1f
	ld a, [wd615]
	res 7, a
	add $30
	ld [hl], a
	ret

_LoadBonusMultiplierRailingGraphics_GoldField: ; 0x16f28
	push af
	ld a, [hGameBoyColorFlag]
	and a
	jr nz, .gameboyColor
	pop af
	call _LoadBonusMultiplierRailingGraphics_GoldField_Gameboy
	ret

.gameboyColor
	pop af
	call _LoadBonusMultiplierRailingGraphics_GoldField_GameboyColor
	ret

_LoadBonusMultiplierRailingGraphics_GoldField_Gameboy: ; 0x16f38
	push af
	res 7, a
	ld hl, wd60e
	cp $14
	jr c, .asm_16f47
	ld hl, wd60f
	sub $a
.asm_16f47
	cp [hl]
	jr z, .asm_16f5c
	ld [hl], a
	ld c, a
	ld b, $0
	sla c
	ld hl, BonusMultiplierRailingTileDataPointers_16fc8_GoldField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(BonusMultiplierRailingTileDataPointers_16fc8_GoldField)
	call QueueGraphicsToLoad
.asm_16f5c
	pop af
	ld bc, $0000
	bit 7, a
	jr z, .asm_16f68
	res 7, a
	set 1, c
.asm_16f68
	cp $14
	jr c, .asm_16f6e
	set 2, c
.asm_16f6e
	ld hl, BonusMultiplierRailingTileData_171e4_GoldField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(BonusMultiplierRailingTileData_171e4_GoldField)
	call QueueGraphicsToLoad
	ret

_LoadBonusMultiplierRailingGraphics_GoldField_GameboyColor: ; 0x16f7b
	bit 7, a
	jr z, .asm_16f83
	res 7, a
	add $a
.asm_16f83
	ld c, a
	ld b, $0
	sla c
	ld hl, BonusMultiplierRailingTileDataPointers_17228_GoldField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(BonusMultiplierRailingTileDataPointers_17228_GoldField)
	call QueueGraphicsToLoad
	ret

INCLUDE "data/queued_tiledata/gold_field/bonus_multiplier_railings.asm"

UpdatePokeballs_GoldField: ; 0x174d0
; Update the pokeballs underneath the billboard, which blink for awhile after catch'em mode and evolution mode.
	call UpdateBlinkingPokeballs_GoldField
	ret nc
	; fall through
LoadPokeballsGraphics_GoldField: ; 0x1f265
; Loads the graphics for the list of pokeballs underneath the billboard picture.
	sla a
	ld c, a
	ld b, $0
	ld hl, TileDataPointers_1f2b9_GoldField
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, Bank(TileDataPointers_1f2b9_GoldField)
	ld de, LoadTileLists
	call QueueGraphicsToLoadWithFunc
	ret

UpdateBlinkingPokeballs_GoldField: ; 0x174ea
	ld a, [wPreviousNumPokeballs]
	ld hl, wNumPokeballs
	cp [hl]
	ret z
	ld a, [wPokeballBlinkingCounter]
	dec a
	ld [wPokeballBlinkingCounter], a
	jr nz, .stillBlinking
	ld a, [wNumPokeballs]
	ld [wPreviousNumPokeballs], a
	cp $3
	jr c, .dontOpenSlot
	ld a, $1
	ld [wOpenedSlotByGetting3Pokeballs], a
	ld a, $3
	ld [wFramesUntilSlotCaveOpens], a
.dontOpenSlot
	ld a, [wPreviousNumPokeballs]
	scf
	ret

.stillBlinking
	and $7
	ret nz
	ld a, [wPokeballBlinkingCounter]
	bit 3, a
	jr nz, .asm_17523
	ld a, [wPreviousNumPokeballs]
	scf
	ret

.asm_17523
	ld a, [wNumPokeballs]
	scf
	ret

INCLUDE "data/queued_tiledata/gold_field/pokeballs.asm"
