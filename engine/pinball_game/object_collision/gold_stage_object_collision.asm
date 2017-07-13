CheckGoldStageTopGameObjectCollisions: ; 0x143e1
	call CheckGoldStageVoltorbCollision
	call CheckGoldStageSpinnerCollision
	call CheckGoldStageBoardTriggersCollision
	call CheckGoldStageTopStaryuCollision
	call CheckGoldStageBellsproutCollision
	call CheckGoldStageDittoSlotCollision
	call CheckGoldStagePinballUpgradeTriggersCollision
	jp CheckGoldStageEvolutionTrinketCollision

CheckGoldStageBottomGameObjectCollisions: ; 0x143f9
	ld a, [wBallYPos + 1]
	cp $56
	jr nc, .lowerHalfOfScreen
	call CheckGoldStageWildPokemonCollision
	call CheckGoldStageBottomStaryuCollision
	call CheckGoldStageDiglettCollision
	call CheckGoldStageBonusMultiplierCollision
	call CheckGoldStageSlotCollision
	jp CheckGoldStageEvolutionTrinketCollision

.lowerHalfOfScreen
	call CheckGoldStageBumpersCollision
	call CheckGoldStagePikachuCollision
	call CheckGoldStageCAVELightsCollision
	jp CheckGoldStageLaunchAlleyCollision

CheckGoldStageEvolutionTrinketCollision: ; 0x1441e
	xor a
	ld [wd578], a
	ld a, [wd551]
	and a
	ret z
	ld a, [wCurrentStage]
	ld hl, GoldStageEvolutionTrinketCoordinatePointers
	ld c, a
	ld b, $0
	sla c
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PinballCollidesWithPoints

CheckGoldStageDittoSlotCollision: ; 0x14439
	ld de, GoldStageDittoSlotCollisionData
	ld bc, wDittoSlotCollision
	scf
	jp HandleGameObjectCollision

CheckGoldStageSlotCollision: ; 0x14443
	ld de, GoldStageSlotCollisionData
	ld bc, wSlotCollision
	scf
	jp HandleGameObjectCollision

CheckGoldStageWildPokemonCollision: ; 0x1444d
	ld de, GoldStageWildPokemonCollisionData
	ld hl, GoldStageWildPokemonCollisionAttributes
	ld bc, wWildMonCollision
	and a
	jp HandleGameObjectCollision

CheckGoldStageBonusMultiplierCollision: ; 0x1445a
; There are two small railings above the Digletts. If you hit them, you get a bonus
; multiplier. I can't think of a good name for these two obsjects.
	ld de, GoldStageBonusMultipliersCollisionData
	ld hl, GoldStageBonusMultipliersCollisionAttributes
	ld bc, wWhichBonusMultiplierRailing
	and a
	jp HandleGameObjectCollision

CheckGoldStageDiglettCollision: ; 0x14467
	ld de, GoldStageDiglettCollisionData
	ld hl, GoldStageDiglettCollisionAttributes
	ld bc, wWhichDiglett
	and a
	jp HandleGameObjectCollision

CheckGoldStageVoltorbCollision: ; 0x14474
	ld de, GoldStageVoltorbCollisionData
	ld hl, GoldStageVoltorbCollisionAttributes
	ld bc, wWhichVoltorb
	and a
	jp HandleGameObjectCollision

CheckGoldStageBumpersCollision: ; 0x14481
	ld de, GoldStageBumpersCollisionData
	ld hl, GoldStageBumpersCollisionAttributes
	ld bc, wWhichBumper
	and a
	jp HandleGameObjectCollision

CheckGoldStageLaunchAlleyCollision: ; 0x1448e
	ld de, GoldStageLaunchAlleyCollisionData
	ld bc, wPinballLaunchCollision
	scf
	jp HandleGameObjectCollision

CheckGoldStageSpinnerCollision: ; 0x14498
	ld de, GoldStageSpinnerCollisionData
	ld bc, wSpinnerCollision
	scf
	jp HandleGameObjectCollision

CheckGoldStageCAVELightsCollision: ; 0x144a2
	ld de, GoldStageCAVELightsCollisionData
	ld bc, wWhichCAVELight
	scf
	jp HandleGameObjectCollision

CheckGoldStagePinballUpgradeTriggersCollision: ; 0x144ac
	ld de, GoldStagePinballUpgradeTriggerCollisionData
	ld bc, wWhichPinballUpgradeTrigger
	scf
	jp HandleGameObjectCollision

CheckGoldStageBoardTriggersCollision: ; 0x144b6
	ld de, GoldStageBoardTriggersCollisionData
	ld bc, wWhichBoardTrigger
	scf
	jp HandleGameObjectCollision

CheckGoldStageTopStaryuCollision: ; 0x144c0
	ld de, GoldStageTopStaryuCollisionData
	ld hl, GoldStageTopStaryuCollisionAttributes
	ld bc, wStaryuCollision
	and a
	jp HandleGameObjectCollision

CheckGoldStageBottomStaryuCollision: ; 0x144cd
; Staryu collision can actually be hit via the bottom screen, despite the fact
; that the Staryu is located on the (bottom of the) top screen.
	ld de, GoldStageBottomStaryuCollisionData
	ld hl, GoldStageBottomStaryuCollisionAttributes
	ld bc, wStaryuCollision
	and a
	jp HandleGameObjectCollision

CheckGoldStageBellsproutCollision: ; 0x144da
	ld de, GoldStageBellsproutCollisionData
	ld bc, wBellsproutCollision
	scf
	jp HandleGameObjectCollision

CheckGoldStagePikachuCollision:
	ld de, GoldStagePikachuCollisionData
	ld bc, wWhichPikachu
	scf
	jp HandleGameObjectCollision

INCLUDE "data/collision/game_objects/gold_stage_game_object_collision.asm"
