CheckSilverStageTopGameObjectCollisions: ; 0x1c520
	call CheckSilverStageShellderCollision
	call CheckSilverStageSpinnerCollision
	call CheckSilverStageBoardTriggersCollision
	call CheckSilverStageSlowpokeCollision
	call CheckSilverStageCloysterCollision
	call CheckSilverStagePinballUpgradeTriggersCollision
	call CheckSilverStageEvolutionTrinketCollision
	ret

CheckSilverStageBottomGameObjectCollisions: ; 0x1c536
	ld a, [wBallYPos + 1]
	cp $56
	jr nc, .lowerHalfOfScreen
	call CheckSilverStageWildPokemonCollision
	call CheckSilverStagePsyduckPoliwagCollision
	call CheckSilverStageBonusMultiplierCollision
	call CheckSilverStageSlotCollision
	call CheckSilverStageEvolutionTrinketCollision
	ret

.lowerHalfOfScreen
	call CheckSilverStageBumpersCollision
	call CheckSilverStagePikachuCollision
	call CheckSilverStageCAVELightsCollision
	call CheckSilverStageLaunchAlleyCollision
	ret

CheckSilverStageShellderCollision: ; 0x1c55a
	ld de, SilverStageShellderCollisionData
	ld hl, SilverStageShellderCollisionAttributes
	ld bc, wWhichShellder
	and a
	jp HandleGameObjectCollision

CheckSilverStageSpinnerCollision: ; 0x1c567
	ld de, SilverStageSpinnerCollisionData
	ld bc, wSpinnerCollision
	scf
	jp HandleGameObjectCollision

CheckSilverStageBumpersCollision: ; 0x1c571
	ld de, SilverStageBumpersCollisionData
	ld hl, SilverStageBumpersCollisionAttributes
	ld bc, wWhichBumper
	and a
	jp HandleGameObjectCollision

CheckSilverStageBoardTriggersCollision: ; 0x1c57e
	ld de, SilverStageBoardTriggersCollisionData
	ld bc, wWhichBoardTrigger
	scf
	jp HandleGameObjectCollision

CheckSilverStageCloysterCollision: ; 0x1c588
	ld de, SilverStageCloysterCollisionData
	ld bc, wCloysterCollision
	scf
	jp HandleGameObjectCollision

CheckSilverStageSlowpokeCollision: ; 0x1c592
	ld de, SilverStageSlowpokeCollisionData
	ld bc, wSlowpokeCollision
	scf
	jp HandleGameObjectCollision

CheckSilverStagePikachuCollision: ; 0x1c59c
	ld de, SilverStagePikachuCollisionData
	ld bc, wWhichPikachu
	scf
	jp HandleGameObjectCollision

CheckSilverStageBonusMultiplierCollision: ; 0x1c5a6
	ld de, SilverStageBonusMultiplierCollisionData
	ld hl, SilverStageBonusMultiplierCollisionAttributes
	ld bc, wWhichBonusMultiplierRailing
	and a
	jp HandleGameObjectCollision

CheckSilverStagePsyduckPoliwagCollision: ; 0x1c5b3
	ld de, SilverStagePsyduckPoliwagCollisionData
	ld hl, SilverStagePsyduckPoliwagCollisionAttributes
	ld bc, wWhichPsyduckPoliwag
	and a
	jp HandleGameObjectCollision

CheckSilverStagePinballUpgradeTriggersCollision: ; 0x1c5c0
	ld de, SilverStagePinballUpgradeTriggersCollisionData
	ld bc, wWhichPinballUpgradeTrigger
	scf
	jp HandleGameObjectCollision

CheckSilverStageCAVELightsCollision: ; 0x1c5ca
	ld de, SilverStageCAVELightsCollisionData
	ld bc, wWhichCAVELight
	scf
	jp HandleGameObjectCollision

CheckSilverStageSlotCollision: ; 0x1c5d4
	ld de, SilverStageSlotCollisionData
	ld bc, wSlotCollision
	scf
	jp HandleGameObjectCollision

CheckSilverStageWildPokemonCollision: ; 0x1c5de
	ld de, SilverStageWildPokemonCollisionData
	ld hl, SilverStageWildPokemonCollisionAttributes
	ld bc, wWildMonCollision
	and a
	jp HandleGameObjectCollision

CheckSilverStageEvolutionTrinketCollision: ; 0x1c5eb
	xor a
	ld [wCollidedPointIndex], a
	ld a, [wEvolutionObjectsDisabled]
	and a
	ret z
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_1c601
	ld hl, SilverTopEvolutionTrinketCoords
	jp PinballCollidesWithPoints

.asm_1c601
	ld hl, SilverBottomEvolutionTrinketCoords
	jp PinballCollidesWithPoints

CheckSilverStageLaunchAlleyCollision: ; 0x1c607
	ld de, SilverStageLaunchAlleyCollisionData
	ld bc, wPinballLaunchCollision
	scf
	jp HandleGameObjectCollision

INCLUDE "data/collision/game_objects/silver_stage_game_object_collision.asm"
