HandleEvoModeCollision:
	ld a, [wCurrentStage]
	call CallInFollowingTable

HandleEvoModeCollisionPointerTable:
	padded_dab HandleRedEvoModeCollision      ; STAGE_RED_FIELD_TOP
	padded_dab HandleRedEvoModeCollision      ; STAGE_RED_FIELD_BOTTOM
	padded_dab HandleBlueEvoModeCollision     ; STAGE_BLUE_FIELD_TOP
	padded_dab HandleBlueEvoModeCollision     ; STAGE_BLUE_FIELD_BOTTOM
	padded_dab HandleGoldEvoModeCollision     ; STAGE_GOLD_FIELD_TOP
	padded_dab HandleGoldEvoModeCollision     ; STAGE_GOLD_FIELD_BOTTOM
	padded_dab HandleSilverEvoModeCollision   ; STAGE_SILVER_FIELD_TOP
	padded_dab HandleSilverEvoModeCollision   ; STAGE_SILVER_FIELD_BOTTOM
	padded_dab HandleRubyEvoModeCollision     ; STAGE_RUBY_FIELD_TOP
	padded_dab HandleRubyEvoModeCollision     ; STAGE_RUBY_FIELD_BOTTOM
	padded_dab HandleSapphireEvoModeCollision ; STAGE_SAPPHIRE_FIELD_TOP
	padded_dab HandleSapphireEvoModeCollision ; STAGE_SAPPHIRE_FIELD_BOTTOM

StartEvolutionMode:
	ld a, [wInSpecialMode]
	and a
	ret nz
	ld a, [wCurrentStage]
	rst JumpTable  ; calls JumpToFuncInTable
StartEvolutionMode_CallTable:
	dw StartEvolutionMode_RedField      ; STAGE_RED_FIELD_TOP
	dw StartEvolutionMode_RedField      ; STAGE_RED_FIELD_BOTTOM
	dw StartEvolutionMode_BlueField     ; STAGE_BLUE_FIELD_TOP
	dw StartEvolutionMode_BlueField     ; STAGE_BLUE_FIELD_BOTTOM
	dw StartEvolutionMode_GoldField     ; STAGE_GOLD_FIELD_TOP
	dw StartEvolutionMode_GoldField     ; STAGE_GOLD_FIELD_BOTTOM
	dw StartEvolutionMode_SilverField   ; STAGE_SILVER_FIELD_TOP
	dw StartEvolutionMode_SilverField   ; STAGE_SILVER_FIELD_BOTTOM
	dw StartEvolutionMode_RubyField     ; STAGE_RUBY_FIELD_TOP
	dw StartEvolutionMode_RubyField     ; STAGE_RUBY_FIELD_BOTTOM
	dw StartEvolutionMode_SapphireField ; STAGE_SAPPHIRE_FIELD_TOP
	dw StartEvolutionMode_SapphireField ; STAGE_SAPPHIRE_FIELD_BOTTOM

ConcludeEvolutionMode:
	xor a
	ld [wBottomTextEnabled], a
	call FillBottomMessageBufferWithBlackTile
	xor a
	ld [wInSpecialMode], a
	ld [wWildMonIsHittable], a
	ld [wNumberOfCatchModeTilesFlipped], a
	ld [wNumMonHits], a
	ld [wEvolutionObjectsDisabled], a
	ld [wNumEvolutionTrinkets], a
	call ClearWildMonCollisionMask
	callba StopTimer
	ld a, [wCurrentStage]
	rst JumpTable  ; calls JumpToFuncInTable
ConcludeEvolutionMode_CallTable:
	dw ConcludeEvolutionMode_RedField      ; STAGE_RED_FIELD_TOP
	dw ConcludeEvolutionMode_RedField      ; STAGE_RED_FIELD_BOTTOM
	dw ConcludeEvolutionMode_BlueField     ; STAGE_BLUE_FIELD_TOP
	dw ConcludeEvolutionMode_BlueField     ; STAGE_BLUE_FIELD_TOP
	dw ConcludeEvolutionMode_GoldField     ; STAGE_GOLD_FIELD_TOP
	dw ConcludeEvolutionMode_GoldField     ; STAGE_GOLD_FIELD_BOTTOM
	dw ConcludeEvolutionMode_SilverField   ; STAGE_SILVER_FIELD_TOP
	dw ConcludeEvolutionMode_SilverField   ; STAGE_SILVER_FIELD_TOP
	dw ConcludeEvolutionMode_RubyField     ; STAGE_RUBY_FIELD_TOP
	dw ConcludeEvolutionMode_RubyField     ; STAGE_RUBY_FIELD_BOTTOM
	dw ConcludeEvolutionMode_SapphireField ; STAGE_SAPPHIRE_FIELD_TOP
	dw ConcludeEvolutionMode_SapphireField ; STAGE_SAPPHIRE_FIELD_TOP

LoadRedFieldTopGraphics:
	ld hl, VideoData_10b2a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push af
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	pop af
	call LoadVRAMData
	ret

VideoData_10b2a:
	dab StageRedFieldTopGfx3
	dw $8900
	dw $E0

ShowStartEvolutionModeText:
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText1
	ld a, [wCurrentEvolutionType]
	cp EVO_BREEDING
	jr nz, .checkExp
	call IsBreedingAllowed
	ld a, [wCurrentEvolutionType]
	jr c, .checkExp
	ld de, StartBreedingText
	jr .showText
.checkExp
	cp EVO_EXPERIENCE
	ld de, StartTrainingText
	jr z, .showText
	ld de, FindItemsText
.showText
	call LoadScrollingText
	ret

IsBreedingAllowed:
; Sets carry flag if not allowed.
IF DEF(_TPP)	
; Allow breeding on every stage.	
	and a	
	ret	
ELSE
; Don't breed on Red/Blue stages
	ld a, [wCurrentStage]
	cp STAGE_BLUE_FIELD_BOTTOM + 1
	ret
ENDC

InitEvolutionSelectionMenu:
; Initializes the list menu, which the player uses to select which pokemon to evolve.
	xor a
	ld [wDrawBottomMessageBox], a
	ld hl, wBottomMessageText
	ld a, $81
	ld b, $30
.clearLoop
	ld [hli], a ; load spaces into bottom text. repeat 192 times
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .clearLoop
	ld hl, wPartyMons
	call LoadMonNamesIntoEvolutionSelectionList
	ld a, BANK(InGameMenuSymbolsGfx)
	ld hl, InGameMenuSymbolsGfx + $50
	ld de, vTilesSH tile $08
	ld bc, $0030
	call LoadVRAMData
	ld a, $0
	ld hl, wBottomMessageText
	deCoord 0, 0, vBGWin
	ld bc, $00c0
	call LoadVRAMData
	ret

LoadMonNamesIntoEvolutionSelectionList:
; Loads 6 pokemon names into the list that allows the player to select which pokemon to evolve.
; Input: hl = pointer to a list of pokemon ids. (an offset of wPartyMons)
	ld a, [wNumPartyMons]
	ld c, $0
	ld b, a
.loop
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	call LoadMonNameIntoEvolutionSelectionList
	inc c
	ld a, c
	cp $6
	jr z, .done
	dec b
	jr nz, .loop
.done
	ret

LoadMonNameIntoEvolutionSelectionList:
; Loads a single pokemon name into the list of pokemon to evolve.
; Input: c = index of the list
;        de = pokemon id (big endian)
	push bc
	push hl
	swap c ;c* 32, does wird things if c starts >15
	sla c
	ld b, $0
	ld hl, wBottomMessageText
	add hl, bc ;goes down text as many times as new c
	ld c, e
	ld b, d
	ld d, h
	ld e, l
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b ;multiplies party mon by 16, then jumps to correct name in the table
	ld hl, PokemonNames ;names are 16 chars long
	add hl, bc
	ld a, $81
	ld [de], a
	inc de
	ld a, $81
	ld [de], a
	inc de
	ld a, $81
	ld [de], a
	inc de
	ld a, $81
	ld [de], a ; loaded 4 spaces into de
	inc de
	call LoadMonNameIntoBottomMessageBufferList
.loadBlankCharacterLoop
	ld a, e
	and $1f
	cp $14
	jr nc, .done
	ld a, $81
	ld [de], a
	inc de
	jr .loadBlankCharacterLoop

.done
	pop hl
	pop bc
	ret

SelectPokemonToEvolveMenu:
; Drivers the menu that allows the player to select a pokemon to evolve.
	xor a
	ld [wCurSelectedPartyMon], a
	ld [wCurSelectedPartyMonScrollOffset], a
	ld [wPartySelectionCursorCounter], a
.loop
	call MoveEvolutionSelectionCursor
	call ClearPersistentJoypadStates
	call UpdateEvolutionSelectionList
	rst AdvanceFrame
	ld a, [wNewlyPressedButtonsPersistent]
	bit BIT_A_BUTTON, a
	jr z, .loop
	lb de, $00, $01
	call PlaySoundEffect
	ret

MoveEvolutionSelectionCursor:
	ld a, [wPressedButtonsPersistent]
	ld b, a
	ld a, [wNumPartyMons]
	ld c, a
	ld a, [wCurSelectedPartyMon]
	bit BIT_D_UP, b
	jr z, .didntPressUp
	and a
	ret z
	; move the cursor up
	dec a
	ld [wCurSelectedPartyMon], a
	lb de, $00, $03
	call PlaySoundEffect
	ret

.didntPressUp
	bit BIT_D_DOWN, b
	ret z
	inc a
	cp c
	ret z
	; move the cursor down
	ld [wCurSelectedPartyMon], a
	lb de, $00, $03
	call PlaySoundEffect
	ret

UpdateEvolutionSelectionList:
	ld a, [wCurSelectedPartyMon]
	ld hl, wCurSelectedPartyMonScrollOffset
	sub [hl]
	jr nc, .asm_10c45
	dec [hl]
	xor a
	jr .asm_10c4c

.asm_10c45
	cp $6
	jr c, .asm_10c4c
	inc [hl]
	ld a, $5
.asm_10c4c
	ld c, a
	push bc
	ld a, [hl]
	ld c, a
	ld b, $0
	ld hl, wPartyMons
	add hl, bc
	add hl, bc
	call LoadMonNamesIntoEvolutionSelectionList
	ld a, [hJoypadState]
	and a
	ld a, [wPartySelectionCursorCounter]
	jr z, .asm_10c62
	xor a
.asm_10c62
	inc a
	ld [wPartySelectionCursorCounter], a
	bit 3, a
	pop bc
	jr nz, .asm_10c78
	swap c
	sla c
	ld b, $0
	ld hl, wBottomMessageText + $03
	add hl, bc
	ld a, $88
	ld [hl], a
.asm_10c78
	ld a, [wCurSelectedPartyMonScrollOffset]
	and a
	jr z, .asm_10c83
	ld a, $8a
	ld [wBottomMessageText + $11], a
.asm_10c83
	ld a, [wCurSelectedPartyMonScrollOffset]
	add $7
	jr z, .asm_10c96
	ld c, a
	ld a, [wNumPartyMons]
	cp c
	jr c, .asm_10c96
	ld a, $89
	ld [wBottomMessageText + $b1], a
.asm_10c96
	ld a, $0
	ld hl, wBottomMessageText
	deCoord 0, 0, vBGWin
	ld bc, $00c0
	call LoadVRAMData
	ret

PlaceEvolutionInParty:
	ld a, [wCurrentEvolutionType]
	cp EVO_BREEDING
	jr z, .breedingMode
	ld a, [wCurSelectedPartyMon]
	ld c, a
	ld b, $0
	ld hl, wPartyMons
	add hl, bc
	add hl, bc
	ld a, [wCurrentEvolutionMon]
	cp $ff
	jr nz, .continue
	ld a, [wCurrentEvolutionMon + 1]
	cp $ff
	ret z
.continue
	ld a, [wCurrentEvolutionMon]
	ld [hli], a
	ld a, [wCurrentEvolutionMon + 1]
	ld [hl], a
	ret
.breedingMode
	ld a, [wNumPartyMons]
	ld c, a
	ld b, $0
	ld hl, wPartyMons
	add hl, bc
	add hl, bc
	ld a, [wCurrentEvolutionMon]
	ld [hli], a
	ld a, [wCurrentEvolutionMon + 1]
	ld [hl], a
	ld a, [wNumPartyMons]
	inc a
	ld [wNumPartyMons], a
	ret

SelectPokemonToEvolve:
	call FillBottomMessageBufferWithBlackTile
	call InitEvolutionSelectionMenu
	ld a, $60
	ld [hWY], a
	dec a
	ld [hLYC], a
	ld a, $fd
	ld [hLCDCMask], a
	call SelectPokemonToEvolveMenu
	ld a, $86
	ld [hWY], a
	ld a, $83
	ld [hLYC], a
	ld [hLastLYC], a
	ld a, $ff
	ld [hLCDCMask], a
	ld a, BANK(StageRedFieldTopStatusBarSymbolsGfx_GameBoyColor)
	ld hl, StageRedFieldTopStatusBarSymbolsGfx_GameBoyColor + $80
	ld de, vTilesSH tile $08
	ld bc, $0030
	call LoadVRAMData
	call FillBottomMessageBufferWithBlackTile
	ld a, SPECIAL_MODE_EVOLUTION
	ld [wDrawBottomMessageBox], a
	ld [wInSpecialMode], a
	ld [wSpecialMode], a
	xor a
	ld [wSpecialModeState], a
	ld a, [wCurSelectedPartyMon]
	ld c, a
	ld b, $0
	ld hl, wPartyMons
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wCurrentCatchEmMon], a
	ld a, [hl]
	ld [wCurrentCatchEmMon + 1], a
	ret

InitEvolutionModeForMon:
	ld hl, wBillboardTilesIlluminationStates
	ld b, $18
.asm_10d22
	ld a, $1
	ld [hli], a
	xor a
	ld [hli], a
	dec b
	jr nz, .asm_10d22
	ld a, [wCurrentCatchEmMon]
	ld b, a
	ld a, [wCurrentCatchEmMon + 1]
	ld c, a
	ld hl, MonEvolutionObjectCounts
	add hl, bc
	ld a, [hl]
	add 2
	ld [wNumPossibleEvolutionObjects], a
	xor a
	ld hl, wActiveEvolutionTrinkets
	ld b, 18 + 1 ; This goes out of bounds by 1--it's supposed to be 18. Doesn't result in any bad behavior, though.
.clearEvoTrinketsLoop
	ld [hli], a
	dec b
	jr nz, .clearEvoTrinketsLoop
	ld b, 2
	ld c, 0
	callba StartTimer
	ld a, [wCurrentCatchEmMon]
	ld b, a
	ld a, [wCurrentCatchEmMon + 1]
	ld c, a
	sla c
	rl b  ; multiply mon id by 2
	ld hl, MonEvolutions
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl points to mon's evolution methods
	inc hl
	push hl
	dec hl
	ld a, [hl]
	and a
	jr nz, .chooseEvolution
	; no evolutions
	pop hl
	ld a, $ff
	ld [wCurrentEvolutionMon], a
	ld a, $ff
	ld [wCurrentEvolutionMon + 1], a
	ld a, EVO_EXPERIENCE
	jr .setEvolutionType
.chooseEvolution
	dec a
	call RandomRange
	ld b, a
	sla a
	add b
	ld c, a
	ld b, 0
	pop hl
	add hl, bc  ; hl points to one of three entries in mon's evolution data
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	dec bc
	ld a, b
	ld [wCurrentEvolutionMon], a
	ld a, c
	ld [wCurrentEvolutionMon + 1], a
	ld a, [hl]  ; a = evolution type id
	cp EVO_BREEDING
	jr nz, .setEvolutionType
	call IsBreedingAllowed
	jr c, .breedingNotAllowed
	ld a, EVO_BREEDING
	jr .setEvolutionType
.breedingNotAllowed
	ld a, $FF
	ld [wCurrentEvolutionMon], a
	ld a, $FF
	ld [wCurrentEvolutionMon + 1], a
	ld a, EVO_EXPERIENCE
.setEvolutionType
	ld [wCurrentEvolutionType], a
	xor a
	ld [wNumEvolutionTrinkets], a
	ld [wEvolutionTrinketCooldownFrames], a
	ld [wEvolutionTrinketCooldownFrames + 1], a
	; Randomly set three entries in wEvolutionObjectStates to $1.
	; Each mon has a specified range of which entries can be set to $1.
	; The idea is that rarer mons can have harder-to-hit objects.
	ld hl, wEvolutionObjectStates
	ld a, 1
	ld b, 3
.initLoop1
	ld [hli], a
	dec b
	jr nz, .initLoop1
	xor a
	ld b, 7
.initLoop2
	ld [hli], a
	dec b
	jr nz, .initLoop2
	ld de, wEvolutionObjectStates
	ld a, [wNumPossibleEvolutionObjects]
	ld c, a
	inc a
	ld b, a
.shuffleLoop
	push bc
	ld a, c
	call RandomRange
	ld c, a
	ld b, $0
	ld hl, wEvolutionObjectStates
	add hl, bc
	ld c, [hl]
	ld a, [de]
	ld [hl], a
	ld a, c
	ld [de], a
	pop bc
	inc de
	dec b
	jr nz, .shuffleLoop
	callba InitBallSaverForCatchEmMode
	call ShowStartEvolutionModeText
	call Func_3579
	ld a, [wCurrentStage]
	bit 0, a
	jr z, .done
	ld a, [rLYC]
	inc a
	ld b, a
.waitUntilAfterLYC
	ld a, [rLY]
	cp b
	jr c, .waitUntilAfterLYC
	ld a, BANK(StageRedFieldBottomBaseGameBoyColorGfx)
	ld hl, StageRedFieldBottomBaseGameBoyColorGfx + $300
	ld de, vTilesSH tile $2e
	ld bc, $0020
	call LoadOrCopyVRAMData
	ld a, $0
	ld hl, CatchBarTiles
	deCoord 6, 8, vBGMap
	ld bc, (CatchBarTilesEnd - CatchBarTiles)
	call LoadOrCopyVRAMData
.done
	ret

ShowMonEvolvedText:
	ld a, [wCurrentEvolutionMon]
	cp $ff
	jr nz, .evoMon
	ld a, [wCurrentEvolutionMon + 1]
	cp $ff
	jp z, EvolutionSpecialBonus
.evoMon
	ld a, [wCurrentEvolutionMon]
	ld b, a
	ld a, [wCurrentEvolutionMon + 1]
	ld c, a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld hl, PokemonNames + 1
	add hl, bc
	ld de, ItEvolvedIntoAnText
	ld a, [wCurrentEvolutionType]
	cp EVO_BREEDING
	jr nz, .gotText
	ld de, EggHatchedIntoAnText
.gotText
	ld bc, Data_2b34
	ld a, [hl]
	; check if mon's name starts with a vowel, so it can print "an", instead of "a"
	cp "A"
	jr z, .nameStartsWithVowel
	cp "I"
	jr z, .nameStartsWithVowel
	cp "U"
	jr z, .nameStartsWithVowel
	cp "E"
	jr z, .nameStartsWithVowel
	cp "O"
	jr z, .nameStartsWithVowel
	ld de, ItEvolvedIntoAText  ; "It evolved into a"
	ld a, [wCurrentEvolutionType]
	cp EVO_BREEDING
	jr nz, .gotText2
	ld de, EggHatchedIntoAText
.gotText2
	ld bc, Data_2b1c
.nameStartsWithVowel
	push hl
	push bc
	push de
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText1
	pop de
	call LoadScrollingText
	ld hl, wScrollingText2
	pop de
	call LoadScrollingText
	pop hl
	ld de, wBottomMessageText + $20
	ld b, $0
.loadMonNameLoop
	ld a, [hli]
	and a
	jr z, .continue
	ld [de], a
	inc de
	inc b
	jr .loadMonNameLoop
.continue
	ld a, $20
	ld [de], a
	inc de
	xor a
	ld [de], a
	ld a, [wScrollingText2ScrollStepsRemaining]
	add b
	ld [wScrollingText2ScrollStepsRemaining], a
	ld a, $14
	sub b
	srl a
	ld b, a
	ld a, [wScrollingText2StopOffset]
	add b
	ld [wScrollingText2StopOffset], a
	ret

EvolutionSpecialBonus:
	ld bc, OneMillionPoints
	callba AddBigBCD6FromQueue
	ld bc, $0100
	ld de, $0000
	push bc
	push de
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText2
	ld de, Data_2b6b
	call Func_32cc
	pop de
	pop bc
	ld hl, wScrollingText1
	ld de, EvolutionSpecialBonusText
	call LoadScrollingText
	ret

StartEvolutionMode_RedField:
	ld a, [wNumPartyMons]
	and a
	ret z
	call SelectPokemonToEvolve
	call InitEvolutionModeForMon
	ld a, [wNumPossibleEvolutionObjects]
	sub 2
	ld c, a
	sla c
	ld hl, InitialIndicatorStates_RedField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wIndicatorStates
	ld b, $13
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	xor a
	ld [wLeftAlleyCount], a
	call CloseSlotCave_
	ld a, $2
	ld [wd7ad], a
	ld de, MUSIC_CATCH_EM_BLUE ; Either MUSIC_CATCH_EM_BLUE or MUSIC_CATCH_EM_RED. They have the same id in their respective audio Banks.
	call PlaySong
	call SetPokemonSeenFlag
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .bottom
	ld de, vTilesSH tile $10
	jp LoadEvolutionTrinketGfx

.bottom
	ld de, vTilesOB tile $20
	call LoadEvolutionTrinketGfx
	callba ClearAllRedIndicators
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

LoadEvolutionTrinketGfx:
; de = destination for gfx
	ld a, [wCurrentEvolutionType]
	cp EVO_BREEDING
	jr z, .breeding
	dec a
	ld c, a
	ld b, $0
	swap c
	sla c
	ld hl, EvolutionTrinketsGfx
	add hl, bc
	ld bc, $0020
	ld a, BANK(EvolutionTrinketsGfx)
	jr .load
.breeding
	ld hl, BreedingTrinketGfx
	ld bc, $0020
	ld a, BANK(BreedingTrinketGfx)
.load
	call LoadOrCopyVRAMData
	ret

InitialIndicatorStates_RedField: ; 0x10f3b
	dw InitialIndicatorStates0_RedField
	dw InitialIndicatorStates1_RedField
	dw InitialIndicatorStates2_RedField
	dw InitialIndicatorStates3_RedField
	dw InitialIndicatorStates4_RedField
	dw InitialIndicatorStates5_RedField
	dw InitialIndicatorStates6_RedField
	dw InitialIndicatorStates7_RedField

InitialIndicatorStates0_RedField:  ; 0x10f4b
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $01, $00, $00, $00, $00

InitialIndicatorStates1_RedField:  ; 0x10f5e
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $01, $01, $00, $00, $00, $00

InitialIndicatorStates2_RedField:  ; 0x10f71
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates3_RedField:  ; 0x10f84
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates4_RedField:  ; 0x10f97
	db $00, $00, $00, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates5_RedField:  ; 0x10faa
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates6_RedField:  ; 0x10fbd
	db $00, $00, $80, $80, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates7_RedField:  ; 0x10fd0
	db $00, $00, $80, $80, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

ConcludeEvolutionMode_RedField:
	call ResetIndicatorStates
	call OpenSlotCave
	call SetLeftAndRightAlleyArrowIndicatorStates_RedField
	call Func_107e9
	ld a, [wCurrentStage]
	bit 0, a
	jp z, LoadRedFieldTopGraphics
	callba ClearAllRedIndicators
	callba LoadSlotCaveCoverGraphics_RedField
	callba LoadMapBillboardTileData
	ld a, BANK(StageSharedBonusSlotGlowGfx)
	ld hl, StageSharedBonusSlotGlowGfx + $60
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call LoadVRAMData
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_11036
	ld a, BANK(StageRedFieldBottomOBJPalette7)
	ld hl, StageRedFieldBottomOBJPalette7
	ld de, $0078
	ld bc, $0008
	call Func_7dc
.asm_11036
	ld hl, BlankSaverSpaceTileDataRedField
	ld a, BANK(BlankSaverSpaceTileDataRedField)
	call QueueGraphicsToLoad
	ld a, [wPreviousNumPokeballs]
	callba LoadPokeballsGraphics_RedField
	ld hl, CaughtPokeballTileDataPointers
	ld a, BANK(CaughtPokeballTileDataPointers)
	call QueueGraphicsToLoad
	ret

StartEvolutionMode_BlueField:
	ld a, [wNumPartyMons]
	and a
	ret z
	call SelectPokemonToEvolve
	call InitEvolutionModeForMon
	ld a, $1
	ld [wd643], a
	ld a, [wNumPossibleEvolutionObjects]
	sub 2
	ld c, a
	sla c
	ld hl, InitialIndicatorStates_BlueField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wIndicatorStates
	ld b, $13
.asm_11085
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_11085
	xor a
	ld [wLeftAlleyCount], a
	callba CloseSlotCave
	ld a, $2
	ld [wd7ad], a
	ld de, MUSIC_CATCH_EM_BLUE ; Either MUSIC_CATCH_EM_BLUE or MUSIC_CATCH_EM_RED. They have the same id in their respective audio Banks.
	call PlaySong
	call SetPokemonSeenFlag
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .bottom
	ld de, vTilesOB tile $60
	jp LoadEvolutionTrinketGfx

.bottom
	ld de, vTilesOB tile $20
	call LoadEvolutionTrinketGfx
	callba Func_1c2cb
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

InitialIndicatorStates_BlueField:
	dw InitialIndicatorStates0_BlueField
	dw InitialIndicatorStates1_BlueField
	dw InitialIndicatorStates2_BlueField
	dw InitialIndicatorStates3_BlueField
	dw InitialIndicatorStates4_BlueField
	dw InitialIndicatorStates5_BlueField
	dw InitialIndicatorStates6_BlueField
	dw InitialIndicatorStates7_BlueField

InitialIndicatorStates0_BlueField: ; 0x110fd
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $01, $00, $00, $00, $00

InitialIndicatorStates1_BlueField: ; 0x11110
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $01, $01, $00, $00, $00, $00

InitialIndicatorStates2_BlueField: ; 0x11123
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates3_BlueField: ; 0x11136
	db $00, $00, $80, $00, $00, $00, $00, $00, $01, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates4_BlueField: ; 0x11149
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates5_BlueField: ; 0x1115c
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates6_BlueField: ; 0x1116f
	db $80, $00, $80, $80, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

InitialIndicatorStates7_BlueField: ; 0x11182
	db $80, $00, $80, $80, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

ConcludeEvolutionMode_BlueField:
	xor a
	ld [wd643], a
	call ResetIndicatorStates
	call OpenSlotCave
	callba SetLeftAndRightAlleyArrowIndicatorStates_BlueField
	ld a, [wCurrentStage]
	bit 0, a
	jp z, LoadBlueFieldTopGraphics
	callba Func_1c2cb
	callba LoadSlotCaveCoverGraphics_BlueField
	callba LoadMapBillboardTileData
	ld a, Bank(StageSharedBonusSlotGlowGfx)
	ld hl, StageSharedBonusSlotGlowGfx + $60
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call LoadVRAMData
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_111f0
	ld a, BANK(StageBlueFieldBottomOBJPalette7)
	ld hl, StageBlueFieldBottomOBJPalette7
	ld de, $0078
	ld bc, $0008
	call Func_7dc
.asm_111f0
	ld hl, BlankSaverSpaceTileDataBlueField
	ld a, BANK(BlankSaverSpaceTileDataBlueField)
	call QueueGraphicsToLoad
	ld a, [wPreviousNumPokeballs]
	callba LoadPokeballsGraphics_RedField
	ld hl, Data_10a88
	ld a, BANK(Data_10a88)
	call QueueGraphicsToLoad
	ret

StartEvolutionMode_GoldField:
	ld a, [wNumPartyMons]
	and a
	ret z
	call SelectPokemonToEvolve
	call InitEvolutionModeForMon
	ld a, [wNumPossibleEvolutionObjects]
	sub $2
	ld c, a
	sla c
	ld hl, IndicatorStatesPointerTable_10f3b_GoldField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wIndicatorStates
	ld b, $13
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	xor a
	ld [wLeftAlleyCount], a
	call CloseSlotCave_GoldField
	ld a, $2
	ld [wd7ad], a
	ld de, $0002
	call PlaySong
	call SetPokemonSeenFlag
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_10f0b
	ld de, vTilesSH tile $10
	jp LoadEvolutionTrinketGfx

.asm_10f0b
	ld de, vTilesOB tile $20
	call LoadEvolutionTrinketGfx
	callba ClearAllGoldIndicators
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

IndicatorStatesPointerTable_10f3b_GoldField:
	dw IndicatorStates_10f4b_GoldField
	dw IndicatorStates_10f5e_GoldField
	dw IndicatorStates_10f71_GoldField
	dw IndicatorStates_10f84_GoldField
	dw IndicatorStates_10f97_GoldField
	dw IndicatorStates_10faa_GoldField
	dw IndicatorStates_10fbd_GoldField
	dw IndicatorStates_10fd0_GoldField

IndicatorStates_10f4b_GoldField:  ; 0x10f4b
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $01, $00, $00, $00, $00

IndicatorStates_10f5e_GoldField:  ; 0x10f5e
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $01, $01, $00, $00, $00, $00

IndicatorStates_10f71_GoldField:  ; 0x10f71
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10f84_GoldField:  ; 0x10f84
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10f97_GoldField:  ; 0x10f97
	db $00, $00, $00, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10faa_GoldField:  ; 0x10faa
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10fbd_GoldField:  ; 0x10fbd
	db $00, $00, $80, $80, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10fd0_GoldField:  ; 0x10fd0
	db $00, $00, $80, $80, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

ConcludeEvolutionMode_GoldField:
	call ResetIndicatorStates
	call OpenSlotCave
	call SetLeftAndRightAlleyArrowIndicatorStates_GoldField
	call Func_107e9
	ld a, [wCurrentStage]
	bit 0, a
	jp z, LoadGoldFieldTopGraphics
	callba ClearAllGoldIndicators
	callba LoadSlotCaveCoverGraphics_GoldField
	callba LoadMapBillboardTileData
	ld a, BANK(StageSharedBonusSlotGlowGfx)
	ld hl, StageSharedBonusSlotGlowGfx + $60
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call LoadVRAMData
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_11036
	ld a, BANK(StageGoldFieldBottomOBJPalette7)
	ld hl, StageGoldFieldBottomOBJPalette7
	ld de, $0078
	ld bc, $0008
	call Func_7dc
.asm_11036
	ld hl, BlankSaverSpaceTileDataGoldField
	ld a, BANK(BlankSaverSpaceTileDataGoldField)
	call QueueGraphicsToLoad
	ld a, [wPreviousNumPokeballs]
	callba LoadPokeballsGraphics_RedField
	ld hl, CaughtPokeballTileDataPointers
	ld a, BANK(CaughtPokeballTileDataPointers)
	call QueueGraphicsToLoad
	ret

StartEvolutionMode_SilverField:
	ld a, [wNumPartyMons]
	and a
	ret z
	call SelectPokemonToEvolve
	call InitEvolutionModeForMon
	ld a, $1
	ld [wd643], a
	ld a, [wNumPossibleEvolutionObjects]
	sub $2
	ld c, a
	sla c
	ld hl, IndicatorStatesPointerTable_110ed_SilverField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wIndicatorStates
	ld b, $13
.asm_11085
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_11085
	xor a
	ld [wLeftAlleyCount], a
	callba CloseSlotCave
	ld a, $2
	ld [wd7ad], a
	ld de, $0002
	call PlaySong
	call SetPokemonSeenFlag
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_110bd
	ld de, vTilesOB tile $60
	jp LoadEvolutionTrinketGfx

.asm_110bd
	ld de, vTilesOB tile $20
	call LoadEvolutionTrinketGfx
	callba Func_1c2cb
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

IndicatorStatesPointerTable_110ed_SilverField:
	dw IndicatorStates_110fd_SilverField
	dw IndicatorStates_11110_SilverField
	dw IndicatorStates_11123_SilverField
	dw IndicatorStates_11136_SilverField
	dw IndicatorStates_11149_SilverField
	dw IndicatorStates_1115c_SilverField
	dw IndicatorStates_1116f_SilverField
	dw IndicatorStates_11182_SilverField

IndicatorStates_110fd_SilverField:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $01, $00, $00, $00, $00

IndicatorStates_11110_SilverField:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $01, $01, $00, $00, $00, $00

IndicatorStates_11123_SilverField:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_11136_SilverField:
	db $00, $00, $80, $00, $00, $00, $00, $00, $01, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_11149_SilverField:
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_1115c_SilverField:
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_1116f_SilverField:
	db $80, $00, $80, $80, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_11182_SilverField:
	db $80, $00, $80, $80, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

ConcludeEvolutionMode_SilverField:
	xor a
	ld [wd643], a
	call ResetIndicatorStates
	call OpenSlotCave
	callba SetLeftAndRightAlleyArrowIndicatorStates_SilverField
	ld a, [wCurrentStage]
	bit 0, a
	jp z, LoadSilverFieldTopGraphics
	callba Func_1c2cb_SilverField
	callba LoadSlotCaveCoverGraphics_SilverField
	callba LoadMapBillboardTileData
	ld a, Bank(StageSharedBonusSlotGlowGfx)
	ld hl, StageSharedBonusSlotGlowGfx + $60
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call LoadVRAMData
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_111f0
	ld a, BANK(StageSilverFieldBottomOBJPalette7)
	ld hl, StageSilverFieldBottomOBJPalette7
	ld de, $0078
	ld bc, $0008
	call Func_7dc
.asm_111f0
	ld hl, BlankSaverSpaceTileDataSilverField
	ld a, BANK(BlankSaverSpaceTileDataSilverField)
	call QueueGraphicsToLoad
	ld a, [wPreviousNumPokeballs]
	callba LoadPokeballsGraphics_RedField
	ld hl, Data_10a88
	ld a, BANK(Data_10a88)
	call QueueGraphicsToLoad
	ret

StartEvolutionMode_RubyField:
	ld a, [wNumPartyMons]
	and a
	ret z
	call SelectPokemonToEvolve
	call InitEvolutionModeForMon
	ld a, [wNumPossibleEvolutionObjects]
	sub $2
	ld c, a
	sla c
	ld hl, IndicatorStatesPointerTable_10f3b_RubyField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wIndicatorStates
	ld b, $13
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	xor a
	ld [wLeftAlleyCount], a
	call CloseSlotCave_RubyField
	ld a, $2
	ld [wd7ad], a
	ld de, $0002
	call PlaySong
	call SetPokemonSeenFlag
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_10f0b
	ld de, vTilesSH tile $10
	jp LoadEvolutionTrinketGfx

.asm_10f0b
	ld de, vTilesOB tile $20
	call LoadEvolutionTrinketGfx
	callba ClearAllRubyIndicators
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

IndicatorStatesPointerTable_10f3b_RubyField:
	dw IndicatorStates_10f4b_RubyField
	dw IndicatorStates_10f5e_RubyField
	dw IndicatorStates_10f71_RubyField
	dw IndicatorStates_10f84_RubyField
	dw IndicatorStates_10f97_RubyField
	dw IndicatorStates_10faa_RubyField
	dw IndicatorStates_10fbd_RubyField
	dw IndicatorStates_10fd0_RubyField

IndicatorStates_10f4b_RubyField:  ; 0x10f4b
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $01, $00, $00, $00, $00

IndicatorStates_10f5e_RubyField:  ; 0x10f5e
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $01, $01, $00, $00, $00, $00

IndicatorStates_10f71_RubyField:  ; 0x10f71
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10f84_RubyField:  ; 0x10f84
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10f97_RubyField:  ; 0x10f97
	db $00, $00, $00, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10faa_RubyField:  ; 0x10faa
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10fbd_RubyField:  ; 0x10fbd
	db $00, $00, $80, $80, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_10fd0_RubyField:  ; 0x10fd0
	db $00, $00, $80, $80, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

ConcludeEvolutionMode_RubyField:
	call ResetIndicatorStates
	call OpenSlotCave
	call SetLeftAndRightAlleyArrowIndicatorStates_RubyField
	call Func_107e9
	ld a, [wCurrentStage]
	bit 0, a
	jp z, LoadRubyFieldTopGraphics
	callba ClearAllRubyIndicators
	callba LoadSlotCaveCoverGraphics_RubyField
	callba LoadMapBillboardTileData
	ld a, BANK(StageSharedBonusSlotGlowGfx)
	ld hl, StageSharedBonusSlotGlowGfx + $60
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call LoadVRAMData
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_11036
	ld a, BANK(StageRubyFieldBottomOBJPalette7)
	ld hl, StageRubyFieldBottomOBJPalette7
	ld de, $0078
	ld bc, $0008
	call Func_7dc
.asm_11036
	ld hl, BlankSaverSpaceTileDataRubyField
	ld a, BANK(BlankSaverSpaceTileDataRubyField)
	call QueueGraphicsToLoad
	ld a, [wPreviousNumPokeballs]
	callba LoadPokeballsGraphics_RedField
	ld hl, CaughtPokeballTileDataPointers
	ld a, BANK(CaughtPokeballTileDataPointers)
	call QueueGraphicsToLoad
	ret

StartEvolutionMode_SapphireField:
	ld a, [wNumPartyMons]
	and a
	ret z
	call SelectPokemonToEvolve
	call InitEvolutionModeForMon
	ld a, $1
	ld [wd643], a
	ld a, [wNumPossibleEvolutionObjects]
	sub $2
	ld c, a
	sla c
	ld hl, IndicatorStatesPointerTable_110ed_SapphireField
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wIndicatorStates
	ld b, $13
.asm_11085
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_11085
	xor a
	ld [wLeftAlleyCount], a
	callba CloseSlotCave
	ld a, $2
	ld [wd7ad], a
	ld de, $0002
	call PlaySong
	call SetPokemonSeenFlag
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_110bd
	ld de, vTilesOB tile $60
	jp LoadEvolutionTrinketGfx

.asm_110bd
	ld de, vTilesOB tile $20
	call LoadEvolutionTrinketGfx
	callba Func_1c2cb
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

IndicatorStatesPointerTable_110ed_SapphireField:
	dw IndicatorStates_110fd_SapphireField
	dw IndicatorStates_11110_SapphireField
	dw IndicatorStates_11123_SapphireField
	dw IndicatorStates_11136_SapphireField
	dw IndicatorStates_11149_SapphireField
	dw IndicatorStates_1115c_SapphireField
	dw IndicatorStates_1116f_SapphireField
	dw IndicatorStates_11182_SapphireField

IndicatorStates_110fd_SapphireField:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $01, $00, $00, $00, $00

IndicatorStates_11110_SapphireField:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $01, $01, $00, $00, $00, $00

IndicatorStates_11123_SapphireField:
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_11136_SapphireField:
	db $00, $00, $80, $00, $00, $00, $00, $00, $01, $01, $00, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_11149_SapphireField:
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_1115c_SapphireField:
	db $00, $00, $80, $80, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_1116f_SapphireField:
	db $80, $00, $80, $80, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

IndicatorStates_11182_SapphireField:
	db $80, $00, $80, $80, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00

ConcludeEvolutionMode_SapphireField:
	xor a
	ld [wd643], a
	call ResetIndicatorStates
	call OpenSlotCave
	callba SetLeftAndRightAlleyArrowIndicatorStates_SapphireField
	ld a, [wCurrentStage]
	bit 0, a
	jp z, LoadSapphireFieldTopGraphics
	callba Func_1c2cb_SapphireField
	callba LoadSlotCaveCoverGraphics_SapphireField
	callba LoadMapBillboardTileData
	ld a, Bank(StageSharedBonusSlotGlowGfx)
	ld hl, StageSharedBonusSlotGlowGfx + $60
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call LoadVRAMData
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_111f0
	ld a, BANK(StageSapphireFieldBottomOBJPalette7)
	ld hl, StageSapphireFieldBottomOBJPalette7
	ld de, $0078
	ld bc, $0008
	call Func_7dc
.asm_111f0
	ld hl, BlankSaverSpaceTileDataSapphireField
	ld a, BANK(BlankSaverSpaceTileDataSapphireField)
	call QueueGraphicsToLoad
	ld a, [wPreviousNumPokeballs]
	callba LoadPokeballsGraphics_RedField
	ld hl, Data_10a88
	ld a, BANK(Data_10a88)
	call QueueGraphicsToLoad
	ret

LoadBlueFieldTopGraphics:
	ld hl, VRAMData_1123b
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push af
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	pop af
	call LoadVRAMData
	ret

VRAMData_1123b:
; This doesn't seem very useful...
	dab StageBlueFieldTopGfx3
	dw $8600, $E0

LoadGoldFieldTopGraphics:
	ld hl, VideoData_10b2a_GoldField
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push af
	push bc ;load 3 byte pointer onto the stack
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	pop af
	call LoadVRAMData
	ret

VideoData_10b2a_GoldField:
	dab StageGoldFieldTopGfx3 ;dab = 3 byte pointer
	dw $8900 ;location
	dw $E0 ;amount of bytes

LoadSilverFieldTopGraphics:
	ld hl, VRAMData_1123b_SilverField
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push af
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	pop af
	call LoadVRAMData
	ret

VRAMData_1123b_SilverField:
; This doesn't seem very useful...
	dab StageSilverFieldTopGfx3
	dw $8600, $E0

LoadRubyFieldTopGraphics:
	ld hl, VideoData_10b2a_RubyField
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push af
	push bc ;load 3 byte pointer onto the stack
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	pop af
	call LoadVRAMData
	ret

VideoData_10b2a_RubyField:
	dab StageRubyFieldTopGfx3 ;dab = 3 byte pointer
	dw $8900 ;location
	dw $E0 ;amount of bytes

LoadSapphireFieldTopGraphics:
	ld hl, VRAMData_1123b_SapphireField
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	push af
	push bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	pop af
	call LoadVRAMData
	ret

VRAMData_1123b_SapphireField:
; This doesn't seem very useful...
	dab StageSapphireFieldTopGfx3
	dw $8600, $E0
