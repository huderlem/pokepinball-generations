CheckRubyStageTopGameObjectCollisions: ; 0x143e1
	call CheckRubyStageVoltorbCollision
	call CheckRubyStageSpinnerCollision
	call CheckRubyStageBoardTriggersCollision
	call CheckRubyStageTopStaryuCollision
	call CheckRubyStageBellsproutCollision
	call CheckRubyStageDittoSlotCollision
	call CheckRubyStagePinballUpgradeTriggersCollision
	jp CheckRubyStageEvolutionTrinketCollision

CheckRubyStageBottomGameObjectCollisions: ; 0x143f9
	ld a, [wBallYPos + 1]
	cp $56
	jr nc, .lowerHalfOfScreen
	call CheckRubyStageWildPokemonCollision
	call CheckRubyStageBottomStaryuCollision
	call CheckRubyStageDiglettCollision
	call CheckRubyStageBonusMultiplierCollision
	call CheckRubyStageSlotCollision
	jp CheckRubyStageEvolutionTrinketCollision

.lowerHalfOfScreen
	call CheckRubyStageBumpersCollision
	call CheckRubyStagePikachuCollision
	call CheckRubyStageCAVELightsCollision
	jp CheckRubyStageLaunchAlleyCollision

CheckRubyStageEvolutionTrinketCollision: ; 0x1441e
	xor a
	ld [wCollidedPointIndex], a
	ld a, [wEvolutionObjectsDisabled]
	and a
	ret z
	ld a, [wCurrentStage]
	and 1
	ld hl, RubyStageEvolutionTrinketCoordinatePointers
	ld c, a
	ld b, $0
	sla c
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PinballCollidesWithPoints

CheckRubyStageDittoSlotCollision: ; 0x14439
	ld de, RubyStageDittoSlotCollisionData
	ld bc, wDittoSlotCollision
	scf
	jp HandleGameObjectCollision

CheckRubyStageSlotCollision: ; 0x14443
	ld de, RubyStageSlotCollisionData
	ld bc, wSlotCollision
	scf
	jp HandleGameObjectCollision

CheckRubyStageWildPokemonCollision: ; 0x1444d
	ld de, RubyStageWildPokemonCollisionData
	ld hl, RubyStageWildPokemonCollisionAttributes
	ld bc, wWildMonCollision
	and a
	jp HandleGameObjectCollision

CheckRubyStageBonusMultiplierCollision: ; 0x1445a
; There are two small railings above the Digletts. If you hit them, you get a bonus
; multiplier. I can't think of a good name for these two obsjects.
	ld de, RubyStageBonusMultipliersCollisionData
	ld hl, RubyStageBonusMultipliersCollisionAttributes
	ld bc, wWhichBonusMultiplierRailing
	and a
	jp HandleGameObjectCollision

CheckRubyStageDiglettCollision: ; 0x14467
	ld de, RubyStageDiglettCollisionData
	ld hl, RubyStageDiglettCollisionAttributes
	ld bc, wWhichDiglett
	and a
	jp HandleGameObjectCollision

CheckRubyStageVoltorbCollision: ; 0x14474
	ld de, RubyStageVoltorbCollisionData
	ld hl, RubyStageVoltorbCollisionAttributes
	ld bc, wWhichVoltorb
	and a
	jp HandleGameObjectCollision

CheckRubyStageBumpersCollision: ; 0x14481
	ld de, RubyStageBumpersCollisionData
	ld hl, RubyStageBumpersCollisionAttributes
	ld bc, wWhichBumper
	and a
	jp HandleGameObjectCollision

CheckRubyStageLaunchAlleyCollision: ; 0x1448e
	ld de, RubyStageLaunchAlleyCollisionData
	ld bc, wPinballLaunchCollision
	scf
	jp HandleGameObjectCollision

CheckRubyStageSpinnerCollision: ; 0x14498
	ld de, RubyStageSpinnerCollisionData
	ld bc, wSpinnerCollision
	scf
	jp HandleGameObjectCollision

CheckRubyStageCAVELightsCollision: ; 0x144a2
	ld de, RubyStageCAVELightsCollisionData
	ld bc, wWhichCAVELight
	scf
	jp HandleGameObjectCollision

CheckRubyStagePinballUpgradeTriggersCollision: ; 0x144ac
	ld de, RubyStagePinballUpgradeTriggerCollisionData
	ld bc, wWhichPinballUpgradeTrigger
	scf
	jp HandleGameObjectCollision

CheckRubyStageBoardTriggersCollision: ; 0x144b6
	ld de, RubyStageBoardTriggersCollisionData
	ld bc, wWhichBoardTrigger
	scf
	jp HandleGameObjectCollision

CheckRubyStageTopStaryuCollision: ; 0x144c0
	ld de, RubyStageTopStaryuCollisionData
	ld hl, RubyStageTopStaryuCollisionAttributes
	ld bc, wStaryuCollision
	and a
	jp HandleGameObjectCollision

CheckRubyStageBottomStaryuCollision: ; 0x144cd
; Staryu collision can actually be hit via the bottom screen, despite the fact
; that the Staryu is located on the (bottom of the) top screen.
	ld de, RubyStageBottomStaryuCollisionData
	ld hl, RubyStageBottomStaryuCollisionAttributes
	ld bc, wStaryuCollision
	and a
	jp HandleGameObjectCollision

CheckRubyStageBellsproutCollision: ; 0x144da
	ld de, RubyStageBellsproutCollisionData
	ld bc, wBellsproutCollision
	scf
	jp HandleGameObjectCollision

CheckRubyStagePikachuCollision:
	ld de, RubyStagePikachuCollisionData
	ld bc, wWhichPikachu
	scf
	jp HandleGameObjectCollision

INCLUDE "data/collision/game_objects/ruby_stage_game_object_collision.asm"
