HandleSapphireEvoModeCollision: ; 0x20bae
	ld a, [wSpecialModeCollisionID]
	cp SPECIAL_COLLISION_SHELLDER
	jp z, HandleShellderCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_LEFT_TRIGGER
	jp z, HandleLeftTriggerCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_CLOYSTER
	jp z, HandleCloysterCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_SLOWPOKE
	jp z, HandleSlowpokeCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_POLIWAG
	jp z, HandlePoliwagCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_PSYDUCK
	jp z, HandlePsyduckCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_LEFT_BONUS_MULTIPLIER
	jp z, HandleLeftBonusMultiplierCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_RIGHT_BONUS_MULTIPLIER
	jp z, HandleRightBonusMultiplierCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_BALL_UPGRADE
	jp z, HandleBallUpgradeCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_SPINNER
	jp z, HandleSpinnerCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_SLOT_HOLE
	jp z, HandleSlotCaveCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_RIGHT_TRIGGER
	jp z, HandleRightTriggerCollision_EvolutionMode_SapphireField
	cp SPECIAL_COLLISION_NOTHING
	jr z, .noCollision
	scf
	ret

.noCollision
	call CheckIfEvolutionModeTimerExpired_SapphireField
	ld a, [wSpecialModeState]
	call CallInFollowingTable
EvolutionModeCallTable_SapphireField: ; 0x20bfc
	padded_dab HandleEvolutionMode_SapphireField
	padded_dab CompleteEvolutionMode_SapphireField
	padded_dab FailEvolutionMode_SapphireField

HandleEvolutionMode_SapphireField: ; 0x20c08
	ld a, [wCurrentStage]
	ld b, a
	ld a, [wCollidedPointIndex]
	and a
	ret z
	dec a
	bit 0, b
	jr z, .asm_20c18
	add $c
.asm_20c18
	ld c, a
	ld b, $0
	ld hl, wActiveEvolutionTrinkets
	add hl, bc
	ld a, [hl]
	and a
	ret z
	xor a
	ld [hl], a
	ld [wEvolutionObjectsDisabled], a
	call ProgressEvolution_SapphireField
	ld a, [wd558]
	ld [wIndicatorStates], a
	ld a, [wd559]
	ld [wIndicatorStates + 3], a
	ld a, [wCurrentStage]
	bit 0, a
	callba nz, Func_1c2cb_SapphireField
	ld bc, OneMillionPoints
	callba AddBigBCD6FromQueue
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld de, YeahYouGotItText
	ld hl, wScrollingText1
	call LoadScrollingText
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_20c74
	ld a, BANK(StageSapphireFieldBottomOBJPalette6)
	ld hl, StageSapphireFieldBottomOBJPalette6
	ld de, $0070
	ld bc, $0008
	call Func_7dc
.asm_20c74
	scf
	ret

ProgressEvolution_SapphireField: ; 0x20c76
	ld a, [wCurrentStage]
	bit 0, a
	jr z, .top
	ld a, [wCurrentEvolutionType]
	dec a
	ld c, a
	ld b, $0
	swap c
	ld hl, EvolutionProgressIconsGfx
	add hl, bc
	add hl, bc
	ld a, [wNumEvolutionTrinkets]
	ld c, a
	ld b, $0
	swap c
	sla c
	push hl
	ld hl, vTilesSH tile $2e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, $0020
	ld a, BANK(EvolutionProgressIconsGfx)
	call LoadVRAMData
.top
	ld a, [wNumEvolutionTrinkets]
	inc a
	ld [wNumEvolutionTrinkets], a
	cp $1
	jr nz, .asm_20cb8
	lb de, $07, $28
	call PlaySoundEffect
	ret

.asm_20cb8
	cp $2
	jr nz, .asm_20cc3
	lb de, $07, $44
	call PlaySoundEffect
	ret

.asm_20cc3
	cp $3
	ret nz
	lb de, $07, $45
	call PlaySoundEffect
	ld a, $1
	ld [wSlotIsOpen], a
	ld a, $80
	ld [wIndicatorStates + 4], a
	xor a
	ld [wIndicatorStates + 9], a
	ld [wIndicatorStates + 2], a
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 8], a
	ld [wIndicatorStates + 13], a
	ld [wIndicatorStates + 14], a
	ld [wIndicatorStates + 11], a
	ld [wIndicatorStates + 12], a
	ld [wIndicatorStates + 10], a
	ld [wIndicatorStates + 6], a
	ld [wIndicatorStates + 7], a
	ld [wd558], a
	ld [wd559], a
	ld a, [wCurrentStage]
	bit 0, a
	ret z
	ld a, BANK(StageSharedBonusSlotGlowGfx)
	ld hl, StageSharedBonusSlotGlowGfx + $60
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call LoadVRAMData
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_20d25
	ld a, BANK(StageSapphireFieldBottomOBJPalette7)
	ld hl, StageSapphireFieldBottomOBJPalette7
	ld de, $0078
	ld bc, $0008
	call Func_7dc
.asm_20d25
	callba LoadSlotCaveCoverGraphics_SapphireField
	ret

CompleteEvolutionMode_SapphireField: ; 0x20d30
	callba RestoreBallSaverAfterCatchEmMode
	callba PlaceEvolutionInParty
	callba ConcludeEvolutionMode
	ld de, MUSIC_BLUE_FIELD
	call PlaySong
	ld hl, wNumPokemonEvolvedInBallBonus
	call Increment_Max100
	callba SetPokemonOwnedFlag
	ld a, [wPreviousNumPokeballs]
	cp $3
	ret z
	add $2
	cp $3
	jr c, .DontClampBalls
	ld a, $3
.DontClampBalls
	ld [wNumPokeballs], a
	ld a, $80
	ld [wPokeballBlinkingCounter], a
	scf
	ret

FailEvolutionMode_SapphireField: ; 0x20d7c
	ld a, [wBottomTextEnabled]
	and a
	ret nz
	call FillBottomMessageBufferWithBlackTile
	callba RestoreBallSaverAfterCatchEmMode
	callba ConcludeEvolutionMode
	ld de, MUSIC_BLUE_FIELD
	call PlaySong
	scf
	ret

CheckIfEvolutionModeTimerExpired_SapphireField: ; 0x20da0
	ld hl, wEvolutionTrinketCooldownFrames
	ld a, [hli]
	ld c, a
	ld b, [hl]
	or b
	jr z, .asm_20db3
	dec bc
	ld a, b
	ld [hld], a
	ld [hl], c
	or c
	jr nz, .asm_20db3
	call EndEvolutionTrinketCooldown_SapphireField
.asm_20db3
	callba PlayLowTimeSfx
	ld a, [wTimeRanOut]
	and a
	ret z
	xor a
	ld [wTimeRanOut], a
	ld a, $2
	ld [wSpecialModeState], a
	xor a
	ld [wSlotIsOpen], a
	ld hl, wIndicatorStates
	ld [wIndicatorStates + 4], a
	ld [wIndicatorStates + 9], a
	ld [wIndicatorStates + 2], a
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 8], a
	ld [wIndicatorStates + 13], a
	ld [wIndicatorStates + 14], a
	ld [wIndicatorStates + 11], a
	ld [wIndicatorStates + 12], a
	ld [wIndicatorStates + 10], a
	ld [wIndicatorStates + 6], a
	ld [wIndicatorStates + 7], a
	ld [wd558], a
	ld [wd559], a
	ld [wEvolutionObjectsDisabled], a
	ld a, [wCurrentStage]
	bit 0, a
	jr z, .asm_20e1a
	callba Func_1c2cb_SapphireField
	callba LoadSlotCaveCoverGraphics_SapphireField
.asm_20e1a
	callba StopTimer
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText1
	ld de, EvolutionFailedText
	ld a, [wCurrentEvolutionType]
	cp EVO_BREEDING
	jr nz, .ok
	ld de, BreedingFailedText
.ok
	call LoadScrollingText
	ret

HandleShellderCollision_EvolutionMode_SapphireField: ; 0x20e34
	ld bc, $0001
	ld de, $5000
	call AddBCDEToJackpot
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_20e5c
	ld a, [wIndicatorStates + 9]
	and a
	jr z, .asm_20e5c
	xor a
	ld [wIndicatorStates + 9], a
	ld a, [wEvolutionObjectStates + 0]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 0], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.asm_20e5c
	scf
	ret

HandleCloysterCollision_EvolutionMode_SapphireField: ; 0x20e5e
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_20e80
	ld a, [wIndicatorStates + 3]
	and a
	jr z, .asm_20e80
	xor a
	ld [wIndicatorStates + 3], a
	ld [wIndicatorStates + 10], a
	ld a, [wEvolutionObjectStates + 6]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 6], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.asm_20e80
	scf
	ret

HandleSlowpokeCollision_EvolutionMode_SapphireField: ; 0x20e82
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .disabled
	ld a, [wIndicatorStates + 8]
	and a
	jr z, .disabled
	xor a
	ld [wIndicatorStates + 8], a
	ld [wIndicatorStates + 2], a
	ld a, [wEvolutionObjectStates + 5]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 5], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.disabled
	scf
	ret

HandlePoliwagCollision_EvolutionMode_SapphireField: ; 0x20ea6
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .disabled
	ld a, [wIndicatorStates + 13]
	and a
	jr z, .disabled
	xor a
	ld [wIndicatorStates + 13], a
	ld a, [wEvolutionObjectStates + 1]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 1], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.disabled
	scf
	ret

HandlePsyduckCollision_EvolutionMode_SapphireField: ; 0x20ec7
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .disabled
	ld a, [wIndicatorStates + 14]
	and a
	jr z, .disabled
	xor a
	ld [wIndicatorStates + 14], a
	ld a, [wEvolutionObjectStates + 2]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 2], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.disabled
	scf
	ret

HandleLeftBonusMultiplierCollision_EvolutionMode_SapphireField: ; 0x20ee8
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .disabled
	ld a, [wIndicatorStates + 11]
	and a
	jr z, .disabled
	xor a
	ld [wIndicatorStates + 11], a
	ld a, [wEvolutionObjectStates + 3]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 3], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.disabled
	scf
	ret

HandleRightBonusMultiplierCollision_EvolutionMode_SapphireField: ; 0x20f09
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .disabled
	ld a, [wIndicatorStates + 12]
	and a
	jr z, .disabled
	xor a
	ld [wIndicatorStates + 12], a
	ld a, [wEvolutionObjectStates + 4]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 4], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.disabled
	scf
	ret

HandleBallUpgradeCollision_EvolutionMode_SapphireField: ; 0x20f2a
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .disabled
	ld a, [wIndicatorStates + 6]
	and a
	jr z, .disabled
	xor a
	ld [wIndicatorStates + 6], a
	ld a, [wEvolutionObjectStates + 9]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 9], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.disabled
	scf
	ret

HandleSpinnerCollision_EvolutionMode_SapphireField: ; 0x20f4b
	ld bc, $0000
	ld de, $1500
	call AddBCDEToJackpot
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .disabled
	ld a, [wIndicatorStates + 7]
	and a
	jr z, .disabled
	xor a
	ld [wIndicatorStates + 7], a
	ld a, [wEvolutionObjectStates + 8]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 8], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.disabled
	scf
	ret

EvolutionIconIds_SapphireField:
	db $00
	db $01 ; EVO_THUNDER_STONE
	db $01 ; EVO_MOON_STONE
	db $01 ; EVO_FIRE_STONE
	db $02 ; EVO_LEAF_STONE
	db $02 ; EVO_WATER_STONE
	db $01 ; EVO_LINK_CABLE
	db $01 ; EVO_EXPERIENCE
	db $01 ; EVO_SUN_STONE
	db $01 ; EVO_BREEDING

CreateEvolutionTrinket_SapphireField: ; 0x20f75
	lb de, $07, $46
	call PlaySoundEffect
	call ChooseNextEvolutionTrinketLocation_SapphireField
	push hl
	ld a, [wCurrentEvolutionType]
	ld hl, EvolutionIconIds_SapphireField
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	pop hl
	ld [hl], a
	ld [wEvolutionObjectsDisabled], a
	ld a, [wIndicatorStates]
	ld [wd558], a
	ld a, [wIndicatorStates + 3]
	ld [wd559], a
	ld a, [wIndicatorStates + 2]
	ld [wIndicatorState2Backup], a
	xor a
	ld [wIndicatorStates], a
	ld [wIndicatorStates + 2], a
	ld [wIndicatorStates + 3], a
	ld a, [wCurrentStage]
	bit 0, a
	callba nz, Func_1c2cb_SapphireField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_20fc3
	ld a, BANK(EvolutionTrinketPalette1)
	ld hl, EvolutionTrinketPalette1
	ld de, $0070
	ld bc, $0010
	call Func_7dc
.asm_20fc3
	ld bc, ThreeHundredThousandPoints
	callba AddBigBCD6FromQueue
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld a, [wCurrentEvolutionType]
	dec a
	ld c, a
	ld b, $0
	sla c
	ld hl, EvolutionTypeGetTextPointers
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld hl, wScrollingText1
	call LoadScrollingText
	scf
	ret

EvolutionTrinketNotFound_SapphireField: ; 0x20fef
	lb de, $07, $47
	call PlaySoundEffect
	ld a, $1
	ld [wEvolutionObjectsDisabled], a
	ld a, [wIndicatorStates]
	ld [wd558], a
	ld a, $80
	ld [wIndicatorStates], a
	ld [wIndicatorStates + 1], a
	ld a, [wIndicatorStates + 3]
	ld [wd559], a
	ld a, [wIndicatorStates + 2]
	ld [wIndicatorState2Backup], a
	xor a
	ld [wIndicatorStates + 2], a
	ld [wIndicatorStates + 3], a
	ld a, [wCurrentStage]
	bit 0, a
	callba nz, Func_1c2cb_SapphireField
	ld a, $58
	ld [wEvolutionTrinketCooldownFrames], a
	ld a, $2
	ld [wEvolutionTrinketCooldownFrames + 1], a
	ld bc, ThreeHundredThousandPoints
	callba AddBigBCD6FromQueue
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText1
	ld a, [wCurrentEvolutionType]
	cp EVO_EXPERIENCE
	ld de, PokemonIsTiredText
	jr z, .asm_21057
	cp EVO_BREEDING
	ld de, KeepWalkingText
	jr z, .asm_21057
	ld de, ItemNotFoundText
.asm_21057
	call LoadScrollingText
	scf
	ret

HandleRightTriggerCollision_EvolutionMode_SapphireField: ; 0x2105c
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr z, .asm_21077
	ld a, [wIndicatorStates + 1]
	and a
	jr z, .asm_21077
	ld bc, TenThousandPoints
	callba AddBigBCD6FromQueue
	jr RecoverPokemon_SapphireField

.asm_21077
	scf
	ret

EndEvolutionTrinketCooldown_SapphireField: ; 0x21079
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr z, .asm_21087
	ld a, [wIndicatorStates + 1]
	and a
	jr z, .asm_21087
	jr RecoverPokemon_SapphireField

.asm_21087
	scf
	ret

HandleLeftTriggerCollision_EvolutionMode_SapphireField: ; 0x21089
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr nz, .asm_210aa
	ld a, [wIndicatorStates]
	and a
	jr z, .asm_210a8
	xor a
	ld [wIndicatorStates], a
	ld a, [wEvolutionObjectStates + 7]
	and a
	ld a, $0
	ld [wEvolutionObjectStates + 7], a
	jp nz, CreateEvolutionTrinket_SapphireField
	jp EvolutionTrinketNotFound_SapphireField

.asm_210a8
	scf
	ret

.asm_210aa
	ld a, [wEvolutionObjectsDisabled]
	and a
	jr z, .asm_210c5
	ld a, [wIndicatorStates]
	and a
	jr z, .asm_210c5
	ld bc, TenThousandPoints
	callba AddBigBCD6FromQueue
	jr RecoverPokemon_SapphireField

.asm_210c5
	scf
	ret

RecoverPokemon_SapphireField:
	xor a
	ld [wIndicatorStates + 1], a
	ld [wEvolutionObjectsDisabled], a
	ld a, [wd558]
	ld [wIndicatorStates], a
	ld a, [wd559]
	ld [wIndicatorStates + 3], a
	ld a, [wIndicatorState2Backup]
	ld [wIndicatorStates + 2], a
	ld a, [wCurrentStage]
	bit 0, a
	callba nz, Func_1c2cb_SapphireField
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_21102
	ld a, BANK(StageSapphireFieldBottomOBJPalette6)
	ld hl, StageSapphireFieldBottomOBJPalette6
	ld de, $0070
	ld bc, $0008
	call Func_7dc
.asm_21102
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld a, [wCurrentEvolutionType]
	cp EVO_EXPERIENCE
	ld de, PokemonRecoveredText
	jr z, .asm_21115
	ld de, TryNextPlaceText
.asm_21115
	ld hl, wScrollingText1
	call LoadScrollingText
	scf
	ret

ChooseNextEvolutionTrinketLocation_SapphireField: ; 0x2111d
	ld a, $11
	call RandomRange
	ld c, a
	ld b, $0
	ld hl, wActiveEvolutionTrinkets
	add hl, bc
	ret

HandleSlotCaveCollision_EvolutionMode_SapphireField: ; 0x2112a
	callba LoadFinalEvolutionMonBillboardPic
	ret
