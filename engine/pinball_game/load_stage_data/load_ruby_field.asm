_LoadStageDataRubyFieldTop: ; 0x14000
	call Func_14091_RubyField
	call LoadFieldStructureGraphics_RubyField
	call LoadPinballUpgradeTriggersGraphics_RubyField
	call LoadStaryuGraphics_Top_RubyField
	call UpdateSpinnerChargeGraphics_RubyField
	call LoadEvolutionTrinketGraphics_RubyField
	call LoadSlotCaveCoverGraphics_RubyField
	callba LoadBallGraphics
	callba LoadTimerGraphics
	ret

_LoadStageDataRubyFieldBottom: ; 0x1401c
	call Func_14091_RubyField
	call LoadBillboardGraphics_RubyField
	call ClearAllRubyIndicators
	call LoadCAVELightsGraphics_RubyField
	call LoadBillboardStatusBarGraphics_RubyField
	call Func_1414b_RubyField
	call LoadEvolutionTrinketGraphics_RubyField
	callba LoadAgainTextGraphics
	callba DrawBallSaverIcon
	call LoadDiglettGraphics_RubyField
	call LoadStaryuGraphics_Bottom_RubyField
	call LoadBonusMultiplierRailingGraphics_RubyField
	call LoadSlotCaveCoverGraphics_RubyField
	callba LoadBallGraphics
	callba LoadTimerGraphics
	ret

Func_14091_RubyField: ; 0x14091
	ld a, $ff
	ld [wWhichAnimatedVoltorb], a
	ld [wWhichBumperGfx], a
	ld a, [wBallXPos + 1]
	ld [wd4c5], a
	ld a, [wBallYPos + 1]
	ld [wd4c6], a
	ld a, [wBallRotation]
	ld [wd4c7], a
	ld a, [wd503]
	and a
	ret z
	xor a
	ld [wd503], a
	ld a, [wd502]
	res 1, a
	ld [wd502], a
	and $1
	ld c, a
	ld a, [wStageCollisionState]
	and $fe
	or c
	ld [wStageCollisionState], a
	lb de, $00, $07
	call PlaySoundEffect
	ld a, [wCurrentStage]
	bit 0, a
	ret nz
	callba LoadStageCollisionAttributes
	call LoadFieldStructureGraphics_RubyField
	ret

LoadBonusMultiplierRailingGraphics_RubyField: ; 0x140e2
	ld a, $ff
	ld [wd60e], a
	ld [wd60f], a
	ld a, [wBonusMultiplierTensDigit]
	call _LoadBonusMultiplierRailingGraphics_RubyField
	ld a, [wBonusMultiplierOnesDigit]
	add $14
	call _LoadBonusMultiplierRailingGraphics_RubyField
	ret

LoadDiglettGraphics_RubyField: ; 0x140f9
	ld a, [wLeftDiglettAnimationController]
	and a
	jr z, .asm_1410c ;skip ??? if wLeftDiglettAnimationController = 0
	xor a ;wut
	ld a, $66
	ld [wStageCollisionMap + $e3], a
	ld a, $67
	ld [wStageCollisionMap + $103], a ;load into the collision map?
	ld a, $2
.asm_1410c
	call _LoadDiglettGraphics_RubyField
	ld a, [wLeftMapMoveCounter]
	call LoadDiglettNumberGraphics_RubyField
	ld a, [wRightDiglettAnimationController]
	and a
	jr z, .asm_14127
	ld a, $6a
	ld [wStageCollisionMap + $f0], a
	ld a, $6b
	ld [wStageCollisionMap+ $110], a
	ld a, $2
.asm_14127
	add $3
	call _LoadDiglettGraphics_RubyField
	ld a, [wRightMapMoveCounter]
	add $4
	call LoadDiglettNumberGraphics_RubyField
	ret

ClearAllRubyIndicators: ; 0x14135
	ld bc, $0000
.Loop5Times
	push bc
	ld hl, wIndicatorStates ;for each of 5 states
	add hl, bc
	ld a, [hl]
	res 7, a ;clear bit 7
	call LoadArrowIndicatorGraphics_RubyField
	pop bc
	inc c
	ld a, c
	cp $5
	jr nz, .Loop5Times
	ret

Func_1414b_RubyField: ; 0x1414b
	ld a, [wInSpecialMode]
	and a
	ret z
	ld a, [wSpecialMode]
	cp SPECIAL_MODE_MAP_MOVE
	ret z
	ld a, [wd5c6]
	and a
	jr nz, .asm_14165
	ld a, [wCapturingMon]
	and a
	jr nz, .asm_14165
	jp Func_14210_RubyField

.asm_14165
	callba Func_141f2_RubyField
	callba Func_10362
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_10301
	ld a, [wCapturingMon]
	and a
	ret z
	ld a, BANK(PikachuSaverGfx)
	ld hl, PikachuSaverGfx + $c0
	ld de, vTilesOB tile $7e
	ld bc, $0020
	call FarCopyData
	ld a, BANK(BallCaptureSmokeGfx)
	ld hl, BallCaptureSmokeGfx
	ld de, vTilesSH tile $10
	ld bc, $0180
	call FarCopyData
	callba LoadShakeBallGfx_DuringLoadStage
	ret

Func_141f2_RubyField: ; 0x141f2
	ld a, $80
	hlCoord 7, 4, vBGMap
	call Func_14209_RubyField
	hlCoord 7, 5, vBGMap
	call Func_14209_RubyField
	hlCoord 7, 6, vBGMap
	call Func_14209_RubyField
	hlCoord 7, 7, vBGMap
	; fall through

Func_14209_RubyField: ; 0x14209
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Func_14210_RubyField: ; 0x14210
	ld hl, wBillboardTilesIlluminationStates
	ld b, $18
.asm_14215
	ld a, [hli]
	xor $1
	ld [hli], a
	dec b
	jr nz, .asm_14215
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

LoadEvolutionTrinketGraphics_RubyField: ; 0x14234
	ld a, [wInSpecialMode]
	and a
	ret z
	ld a, [wSpecialMode]
	cp SPECIAL_MODE_EVOLUTION
	ret nz
	ld a, [wNumEvolutionTrinkets]
	cp $3
	ret z
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_1425c
	ld de, vTilesSH tile $10
	call LoadEvolutionTrinketGfx_RubyField
	jr .asm_1426a

.asm_1425c
	ld de, vTilesOB tile $20
	call LoadEvolutionTrinketGfx_RubyField
.asm_1426a
	ld a, [wEvolutionObjectsDisabled]
	and a
	ret z
	ld a, [hGameBoyColorFlag]
	and a
	ret z
	ld a, BANK(EvolutionTrinketPalette1)
	ld hl, EvolutionTrinketPalette1
	ld de, $0070
	ld bc, $0010
	call FarCopyCGBPals
	ret

LoadEvolutionTrinketGfx_RubyField:
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
	ld a, BANK(BreedingTrinketGfx)
	ld hl, BreedingTrinketGfx
	ld bc, $0020
.load
	call FarCopyData
	ret

LoadBillboardStatusBarGraphics_RubyField: ; 0x14282
	ld a, [wInSpecialMode]
	and a
	jr z, .asm_1429e
	ld a, [wSpecialMode]
	and a
	jr nz, .asm_14296
	ld a, [wNumMonHits]
	and a
	call nz, Func_142b3_RubyField
	ret

.asm_14296
	cp SPECIAL_MODE_EVOLUTION
	jr nz, .asm_1429e
	call Func_142c3_RubyField
	ret

.asm_1429e
	ld a, [wPreviousNumPokeballs]
	call LoadPokeballsGraphics_RubyField
	ld a, BANK(CaughtPokeballGfx)
	ld hl, CaughtPokeballGfx
	ld de, vTilesSH tile $2e
	ld bc, $0020
	call FarCopyData
	ret

Func_142b3_RubyField: ; 0x142b3
	push af
	callba Func_10611
	pop af
	dec a
	jr nz, Func_142b3_RubyField
	ret

Func_142c3_RubyField: ; 0x142c3
	ld de, $0000
	ld a, [wNumEvolutionTrinkets]
	and a
	ret z
	ld b, a
.asm_142cc
	ld a, [wCurrentEvolutionType]
	call Func_142d7_RubyField
	inc de
	dec b
	jr nz, .asm_142cc
	ret

Func_142d7_RubyField: ; 0x142d7
	push bc
	push de
	dec a
	ld c, a
	ld b, $0
	swap c
	ld hl, EvolutionProgressIconsGfx
	add hl, bc
	add hl, bc
	swap e
	sla e
	push hl
	ld hl, vTilesSH tile $2e
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, $0020
	ld a, BANK(EvolutionProgressIconsGfx)
	call FarCopyData
	pop de
	pop bc
	ret

LoadBillboardGraphics_RubyField: ; 0x14377
	ld a, [wInSpecialMode]
	and a
	jr nz, .asm_143b1
	ld a, [wOpenedSlotByGetting3Pokeballs]
	and a
	jr z, .asm_14393
	ld a, [wNextBonusStage]
	add $3
	callba LoadBillboardTileData
	ret

.asm_14393
	ld a, [wOpenedSlotByGetting4CAVELights]
	and a
	jr z, .asm_143a6
	ld a, $8
	callba LoadBillboardTileData
	ret

.asm_143a6
	callba LoadMapBillboardTileData
	ret

.asm_143b1
	ld a, [wSpecialMode]
	cp SPECIAL_MODE_MAP_MOVE
	ret nz
	ld a, [wSpecialModeState]
	cp $3
	jr nz, .asm_143c9
	callba LoadMapBillboardTileData
	ret

.asm_143c9
	ld a, [wSlotIsOpen]
	and a
	ld a, $2
	jr nz, .asm_143d6
	ld a, [wMapMoveDirection]
.asm_143d6
	callba LoadBillboardTileData
	ret
