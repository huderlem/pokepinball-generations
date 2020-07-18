CheckSapphireStageTopGameObjectCollisions: ; 0x1c520
	call CheckSapphireStageShellderCollision
	call CheckSapphireStageSpinnerCollision
	call CheckSapphireStageBoardTriggersCollision
	call CheckSapphireStageSlowpokeCollision
	call CheckSapphireStageCloysterCollision
	call CheckSapphireStagePinballUpgradeTriggersCollision
	call CheckSapphireStageEvolutionTrinketCollision
	ret

CheckSapphireStageBottomGameObjectCollisions: ; 0x1c536
	ld a, [wBallYPos + 1]
	cp $56
	jr nc, .lowerHalfOfScreen
	call CheckSapphireStageWildPokemonCollision
	call CheckSapphireStagePsyduckPoliwagCollision
	call CheckSapphireStageBonusMultiplierCollision
	call CheckSapphireStageSlotCollision
	call CheckSapphireStageEvolutionTrinketCollision
	ret

.lowerHalfOfScreen
	call CheckSapphireStageBumpersCollision
	call CheckSapphireStagePikachuCollision
	call CheckSapphireStageCAVELightsCollision
	call CheckSapphireStageLaunchAlleyCollision
	ret

CheckSapphireStageShellderCollision: ; 0x1c55a
	ld de, SapphireStageShellderCollisionData
	ld hl, SapphireStageShellderCollisionAttributes
	ld bc, wWhichShellder
	and a
	jp HandleGameObjectCollision

CheckSapphireStageSpinnerCollision: ; 0x1c567
	ld de, SapphireStageSpinnerCollisionData
	ld bc, wSpinnerCollision
	scf
	jp HandleGameObjectCollision

CheckSapphireStageBumpersCollision: ; 0x1c571
	ld de, SapphireStageBumpersCollisionData
	ld hl, SapphireStageBumpersCollisionAttributes
	ld bc, wWhichBumper
	and a
	jp HandleGameObjectCollision

CheckSapphireStageBoardTriggersCollision: ; 0x1c57e
	ld de, SapphireStageBoardTriggersCollisionData
	ld bc, wWhichBoardTrigger
	scf
	jp HandleGameObjectCollision

CheckSapphireStageCloysterCollision: ; 0x1c588
	ld de, SapphireStageCloysterCollisionData
	ld bc, wCloysterCollision
	scf
	jp HandleGameObjectCollision

CheckSapphireStageSlowpokeCollision: ; 0x1c592
	ld de, SapphireStageSlowpokeCollisionData
	ld bc, wSlowpokeCollision
	scf
	jp HandleGameObjectCollision

CheckSapphireStagePikachuCollision: ; 0x1c59c
	ld de, SapphireStagePikachuCollisionData
	ld bc, wWhichPikachu
	scf
	jp HandleGameObjectCollision

CheckSapphireStageBonusMultiplierCollision: ; 0x1c5a6
	ld de, SapphireStageBonusMultiplierCollisionData
	ld hl, SapphireStageBonusMultiplierCollisionAttributes
	ld bc, wWhichBonusMultiplierRailing
	and a
	jp HandleGameObjectCollision

CheckSapphireStagePsyduckPoliwagCollision: ; 0x1c5b3
	ld de, SapphireStagePsyduckPoliwagCollisionData
	ld hl, SapphireStagePsyduckPoliwagCollisionAttributes
	ld bc, wWhichPsyduckPoliwag
	and a
	jp HandleGameObjectCollision

CheckSapphireStagePinballUpgradeTriggersCollision: ; 0x1c5c0
	ld de, SapphireStagePinballUpgradeTriggersCollisionData
	ld bc, wWhichPinballUpgradeTrigger
	scf
	jp HandleGameObjectCollision

CheckSapphireStageCAVELightsCollision: ; 0x1c5ca
	ld de, SapphireStageCAVELightsCollisionData
	ld bc, wWhichCAVELight
	scf
	jp HandleGameObjectCollision

CheckSapphireStageSlotCollision: ; 0x1c5d4
	ld de, SapphireStageSlotCollisionData
	ld bc, wSlotCollision
	scf
	jp HandleGameObjectCollision

CheckSapphireStageWildPokemonCollision: ; 0x1c5de
	ld de, SapphireStageWildPokemonCollisionData
	ld hl, SapphireStageWildPokemonCollisionAttributes
	ld bc, wWildMonCollision
	and a
	jp HandleGameObjectCollision

CheckSapphireStageEvolutionTrinketCollision: ; 0x1c5eb
	xor a
	ld [wCollidedPointIndex], a
	ld a, [wEvolutionObjectsDisabled]
	and a
	ret z
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_1c601
	ld hl, SapphireTopEvolutionTrinketCoords
	jp PinballCollidesWithPoints

.asm_1c601
	ld hl, SapphireBottomEvolutionTrinketCoords
	jp PinballCollidesWithPoints

CheckSapphireStageLaunchAlleyCollision: ; 0x1c607
	ld de, SapphireStageLaunchAlleyCollisionData
	ld bc, wPinballLaunchCollision
	scf
	jp HandleGameObjectCollision

INCLUDE "data/collision/game_objects/sapphire_stage_game_object_collision.asm"
