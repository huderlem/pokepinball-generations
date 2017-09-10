HandleGoldCatchEmCollision: ; 0x20000
	ld a, [wSpecialModeCollisionID]
	cp SPECIAL_COLLISION_VOLTORB
	jp z, HandleVoltorbCollision_CatchemMode_GoldField
	cp SPECIAL_COLLISION_SPINNER
	jp z, HandleSpinnerCollision_CatchemMode_GoldField
	cp SPECIAL_COLLISION_BELLSPROUT
	jp z, HandleBellsproutCollision_CatchemMode_GoldField
	cp SPECIAL_COLLISION_NOTHING
	jr z, .noCollision
	scf
	ret

.noCollision
	call CheckIfCatchemModeTimerExpired_GoldField
	ld a, [wSpecialModeState]
	call CallInFollowingTable
CatchemModeCallTable_GoldField: ; 0x20021
	padded_dab Func_20041_GoldField
	padded_dab Func_2005f_GoldField
	padded_dab Func_2006b_GoldField
	padded_dab ShowAnimatedCatchemPokemon_GoldField
	padded_dab UpdateMonState_CatchemMode_GoldField
	padded_dab CatchPokemon_GoldField
	padded_dab CapturePokemonAnimation_GoldField
	padded_dab ConcludeCatchemMode_GoldField

Func_20041_GoldField: ; 0x20041
	ld a, [wNumberOfCatchModeTilesFlipped]
	cp $18
	jr nz, .asm_2005d
	ld a, [wCurrentStage]
	bit 0, a
	jr z, .asm_2005d
	ld hl, wSpecialModeState
	inc [hl]
	ld a, $14
	ld [wd54e], a
	ld a, $5
	ld [wd54f], a
.asm_2005d
	scf
	ret

Func_2005f_GoldField: ; 0x2005f
	callba Func_10648
	scf
	ret

Func_2006b_GoldField: ; 0x2006b
	ld a, [wCurrentStage]
	bit 0, a
	jr z, .asm_20098
	call Func_1130
	jr nz, .asm_200a1
	callba Func_10414
	callba Func_10362
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_10301
.asm_20098
	ld a, $1
	ld [wd5c6], a
	ld hl, wSpecialModeState
	inc [hl]
.asm_200a1
	scf
	ret

ShowAnimatedCatchemPokemon_GoldField: ; 0x200a3
	ld a, [wCurrentStage]
	bit 0, a
	jr z, .asm_200af
	call Func_1130
	jr nz, .asm_200d1
.asm_200af
	callba ShowAnimatedWildMon
	callba PlayCatchemPokemonCry
	callba LoadWildMonCollisionMask
	ld hl, wSpecialModeState
	inc [hl]
.asm_200d1
	scf
	ret

UpdateMonState_CatchemMode_GoldField: ; 0x200d3
	ld a, [wLoopsUntilNextCatchSpriteAnimationChange]
	dec a
	ld [wLoopsUntilNextCatchSpriteAnimationChange], a
	jr z, .asm_200e6
	ld a, [wCatchModeMonUpdateTimer]
	inc a
	ld [wCatchModeMonUpdateTimer], a
	and $3
	ret nz
.asm_200e6
	ld a, [wBallHitWildMon]
	and a
	jp z, .asm_20167
	xor a
	ld [wBallHitWildMon], a
	ld a, [wCurrentCatchMonHitFrameDuration]
	ld [wLoopsUntilNextCatchSpriteAnimationChange], a
	xor a
	ld [wCatchModeMonUpdateTimer], a
	ld a, [wCurrentCatchEmMon]
	cp MEW - 1
	jr nz, .notMew
	ld a, [wNumMewHitsLow]
	inc a
	ld [wNumMewHitsLow], a
	jr nz, .asm_20116
.notMew
	ld a, [wNumMonHits]
	cp $3
	jr z, .hitMonThreeTimes
	inc a
	ld [wNumMonHits], a
.asm_20116
	ld bc, ThreeHundredThousandPoints
	callba AddBigBCD6FromQueue
	ld bc, $0030
	ld de, $0000
	push bc
	push de
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wStationaryText2
	ld de, Data_2a2a
	call LoadScoreTextFromStack
	pop de
	pop bc
	ld hl, wStationaryText1
	ld de, HitText
	call LoadStationaryTextAndHeader
	ld a, [wNumMonHits]
	callba Func_10611
	ld c, $2
	jr .asm_2018a

.hitMonThreeTimes
	xor a
	ld [wTimeRanOut], a
	ld a, $1
	ld [wPauseTimer], a
	ld hl, wSpecialModeState
	inc [hl]
	ld c, $2
	jr .asm_2018a

.asm_20167
	ld a, [wLoopsUntilNextCatchSpriteAnimationChange]
	and a
	ret nz
	ld a, [wCurrentAnimatedMonSpriteType]
	ld c, a
	ld a, [wCurrentAnimatedMonSpriteFrame]
	sub c
	cp $1
	ld c, $0
	jr nc, .asm_2017c
	ld c, $1
.asm_2017c
	ld b, $0
	ld hl, wCurrentCatchMonIdleFrame1Duration
	add hl, bc
	ld a, [hl]
	ld [wLoopsUntilNextCatchSpriteAnimationChange], a
	xor a
	ld [wCatchModeMonUpdateTimer], a
.asm_2018a
	ld a, [wCurrentAnimatedMonSpriteType]
	add c
	ld [wCurrentAnimatedMonSpriteFrame], a
	scf
	ret

CatchPokemon_GoldField: ; 0x20193
	ld a, [wd580]
	and a
	jr z, .asm_2019e
	xor a
	ld [wd580], a
	ret

.asm_2019e
	callba BallCaptureInit
	ld hl, wSpecialModeState
	inc [hl]
	callba ShowCapturedPokemonText
	callba AddCaughtPokemonToParty
	scf
	ret

CapturePokemonAnimation_GoldField: ; 0x201c2
	callba CapturePokemonAnimation
	scf
	ret

ConcludeCatchemMode_GoldField: ; 0x201ce
	ld a, [wBottomTextEnabled]
	and a
	ret nz
	call FillBottomMessageBufferWithBlackTile
	callba RestoreBallSaverAfterCatchEmMode
	callba ConcludeCatchEmMode
	ld de, MUSIC_RED_FIELD
	call PlaySong
	scf
	ret

CheckIfCatchemModeTimerExpired_GoldField: ; 0x201f2
	callba PlayLowTimeSfx
	ld a, [wTimeRanOut]
	and a
	ret z
	xor a
	ld [wTimeRanOut], a
	ld a, $7
	ld [wSpecialModeState], a
	; Automatically set Mew as caught, since you can't possibly catch it
	ld a, [wCurrentCatchEmMon]
	cp MEW - 1
	jr nz, .asm_2021b
	callba SetPokemonOwnedFlag
.asm_2021b
	callba StopTimer
	callba Func_106a6
	ret

HandleVoltorbCollision_CatchemMode_GoldField: ; 0x20230
	ld a, [wNumberOfCatchModeTilesFlipped]
	cp $18
	jr z, .asm_2029d
	sla a
	ld c, a
	ld b, $0
	ld hl, wBillboardTilesIlluminationStates
	add hl, bc
	ld d, $4
.asm_20242
	ld a, $1
	ld [hli], a
	inc hl
	ld a, l
	cp wNumberOfCatchModeTilesFlipped % $100
	jr z, .asm_2024e
	dec d
	jr nz, .asm_20242
.asm_2024e
	ld a, [wNumberOfCatchModeTilesFlipped]
	add $4
	cp $18
	jr c, .master_loop9
	ld a, $18
.master_loop9
	ld [wNumberOfCatchModeTilesFlipped], a
	cp $18
	jr nz, .asm_20264
	xor a
	ld [wIndicatorStates + 9], a
.asm_20264
	callba Func_10184
	ld bc, OneHundredThousandPoints
	callba AddBigBCD6FromQueue
	ld bc, $0010
	ld de, $0000
	push bc
	push de
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wStationaryText2
	ld de, CatchModeTileFlippedScoreStationaryTextHeader
	call LoadScoreTextFromStack
	pop de
	pop bc
	ld hl, wStationaryText1
	ld de, FlippedText
	call LoadStationaryTextAndHeader
.asm_2029d
	ld bc, $0001
	ld de, $0000
	call AddBCDEToJackpot
	scf
	ret

HandleSpinnerCollision_CatchemMode_GoldField: ; 0x202a8
	ld bc, $0000
	ld de, $1000
	call AddBCDEToJackpot
	ret

HandleBellsproutCollision_CatchemMode_GoldField: ; 0x202b2
	ld bc, $0005
	ld de, $0000
	call AddBCDEToJackpot
	ret
