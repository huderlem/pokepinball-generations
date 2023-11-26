HandlePokedexScreen: ; 0x28000
	ld a, [wScreenState]
	rst JumpTable  ; calls JumpToFuncInTable
PointerTable_28004: ; 0x28004
	dw LoadPokedexScreen
	dw MainPokedexScreen
	dw MonInfoPokedexScreen
	dw Func_282e9 ; not sure if this is used ever...
	dw ExitPokedexScreen

LoadPokedexScreen: ; 0x2800e
	ld a, $23
	ld [hLCDC], a
	ld a, $e4
	ld [wBGP], a
	ld a, $93
	ld [wOBP0], a
	ld a, $e4
	ld [wOBP1], a
	xor a
	ld [hSCX], a
	ld a, $8
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $8c
	ld [hWY], a
	ld a, $3b
	ld [hLYC], a
	ld [hLastLYC], a
	ld [hNextLYCSub], a
	ld [hLYCSub], a
	ld hl, hSTAT
	set 6, [hl]
	ld hl, rIE
	set 1, [hl]
	ld a, $2
	ld [hStatIntrRoutine], a
	ld hl, PointerTable_280a2
	ld a, [hGameBoyColorFlag]
	call LoadVideoData
	xor a
	ld [wCurPokedexIndex], a
	ld [wCurPokedexIndex + 1], a
	ld [wPokedexOffset], a
	ld [wPokedexOffset + 1], a
	ld [wd95b], a
	ld [wd95c], a
	ld [wd960], a
	ld [wd961], a
	ld [wd95e], a
	ld a, $1
	ld [wd862], a
	call ClearOAMBuffer
	call Func_285db
	call Func_28931
	call Func_289c8
	callba Func_28a15
	call Func_28972
	callba Func_28a8a
	call Func_28ad1
	call Func_28add
	call CountNumSeenMons
	call CountNumOwnedMons
	call SetAllPalettesWhite
	ld a, Bank(Music_Pokedex)
	call SetSongBank
	ld de, MUSIC_POKEDEX
	call PlaySong
	call EnableLCD
	call FadeIn
	ld hl, wScreenState
	inc [hl]
	ret

PointerTable_280a2: ; 0x280a2
	dw Data_280a6
	dw Data_280c4

Data_280a6: ; 0x280a6
	dab PokedexInitialGfx
	dw vTilesOB
	dw $6000
	dab PokedexTilemap2
	dw $9800
	dw $1000
	dab PokedexTilemap
	dw vBGWin
	dw $800
	dab PokedexTilemap
	dw $9e00
	dw $800
	dw $FFFF ; terminators

Data_280c4: ; 0x280c4
	dab PokedexInitialGfx
	dw vTilesOB
	dw $6000
	dab PokedexTilemap2
	dw $9800
	dw $1000
	dab PokedexBGAttributes2
	dw $9800
	dw $1002
	dab PokedexTilemap
	dw vBGWin
	dw $800
	dab PokedexTilemap
	dw $9e00
	dw $800
	dab PokedexBGAttributes
	dw vBGWin
	dw $802
	dab PokedexBGAttributes
	dw $9e00
	dw $802
	dab PokedexPalettes
	dw $0000
	dw $101
	dw $FFFF ; terminators

MainPokedexScreen: ; 0x280fe
	call Func_28513
	ld a, [hNewlyPressedButtons]
	bit BIT_A_BUTTON, a
	jr z, .asm_28142
	ld a, [wd95f]
	and a
	jp nz, .asm_28174
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, wPokedexFlags
	add hl, bc
	ld a, [hl]
	and a
	jp z, .asm_28174
	push hl
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	inc bc
	ld e, c
	ld d, b
	call PlayCry
	pop hl
	bit 1, [hl]
	jp z, .asm_28174
	call Func_288c6
	call Func_2885c
	call CleanOAMBuffer
	call Func_2887c
	call Func_2885c
	ld hl, wScreenState
	inc [hl]
	ret

.asm_28142
	bit BIT_B_BUTTON, a
	jr z, .asm_2814f
	call Func_285db
	ld a, $4
	ld [wScreenState], a
	ret

.asm_2814f
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_28174
	ld a, [hJoypadState]
	bit BIT_START, a
	jr z, .asm_28168
	ld a, [wd960]
	and a
	ld a, $ff
	ld [wd960], a
	call z, Func_28add
	jr .asm_28174

.asm_28168
	ld a, [wd960]
	and a
	ld a, $0
	ld [wd960], a
	call nz, Func_28add
.asm_28174
	call Func_285db
	ret

MonInfoPokedexScreen: ; 0x28178
	ld a, [wd956]
	bit 0, a
	jr z, .asm_28190
	ld a, [hNewlyPressedButtons]
	bit BIT_A_BUTTON, a
	jr z, .asm_2818a
	call Func_28912
	jr .asm_281a2

.asm_2818a
	bit 1, a
	jr z, .asm_281a2
	jr .asm_28196

.asm_28190
	ld a, [hNewlyPressedButtons]
	and $3
	jr z, .asm_281a2
.asm_28196
	call Func_288a2
	call Func_285db
	ld a, $1
	ld [wScreenState], a
	ret

.asm_281a2
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_281c7
	ld a, [hJoypadState]
	bit BIT_START, a
	jr z, .asm_281bb
	ld a, [wd960]
	and a
	ld a, $ff
	ld [wd960], a
	call z, Func_28add
	jr .asm_281c7

.asm_281bb
	ld a, [wd960]
	and a
	ld a, $0
	ld [wd960], a
	call nz, Func_28add
.asm_281c7
	call Func_2885c
	ret

Func_281cb:
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	sla c
	rl b
	add c
	ld c, a
	jr nc, .asm_281da
	inc b
.asm_281da
	ld a, [wd960]
	and a
	jr nz, .asm_281fb
	ld hl, MonBillboardPalettePointers
	add hl, bc
	ld a, BANK(MonBillboardPalettePointers)
	call ReadByteFromBank
	inc hl
	ld e, a
	ld a, BANK(MonBillboardPalettePointers)
	call ReadByteFromBank
	inc hl
	ld d, a
	ld a, BANK(MonBillboardPalettePointers)
	call ReadByteFromBank
	ld [$ff8c], a
	jr .asm_28214

.asm_281fb
	ld hl, MonAnimatedPalettePointers
	add hl, bc
	ld a, BANK(MonAnimatedPalettePointers)
	call ReadByteFromBank
	inc hl
	ld e, a
	ld a, BANK(MonAnimatedPalettePointers)
	call ReadByteFromBank
	inc hl
	ld d, a
	ld a, BANK(MonAnimatedPalettePointers)
	call ReadByteFromBank
	ld [$ff8c], a
.asm_28214
	ld h, d
	ld l, e
	ld de, wda8a
	ld b, $8
.asm_2821b
	push bc
	ld a, [$ff8c]
	call ReadByteFromBank
	inc hl
	ld c, a
	ld a, [$ff8c]
	call ReadByteFromBank
	inc hl
	ld b, a
	ld a, c
	and $1f
	ld [de], a
	inc de
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	ld a, c
	and $1f
	ld [de], a
	inc de
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	ld a, c
	and $1f
	ld [de], a
	inc de
	pop bc
	dec b
	jr nz, .asm_2821b
	ld hl, VRAMAddresses_28289
	ld de, wda8a
	ld b, $18
.asm_2826d
	push hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [de]
	inc de
	push af
	swap a
	and $f
	call PutTileInVRAM
	inc hl
	pop af
	and $f
	call PutTileInVRAM
	pop hl
	inc hl
	inc hl
	dec b
	jr nz, .asm_2826d
	ret

VRAMAddresses_28289:
	dw vBGWin + $26
	dw vBGWin + $2B
	dw vBGWin + $30
	dw vBGWin + $46
	dw vBGWin + $4B
	dw vBGWin + $50
	dw vBGWin + $66
	dw vBGWin + $6B
	dw vBGWin + $70
	dw vBGWin + $86
	dw vBGWin + $8B
	dw vBGWin + $90
	dw vBGWin + $C6
	dw vBGWin + $CB
	dw vBGWin + $D0
	dw vBGWin + $E6
	dw vBGWin + $EB
	dw vBGWin + $F0
	dw vBGWin + $106
	dw vBGWin + $10B
	dw vBGWin + $110
	dw vBGWin + $126
	dw vBGWin + $12B
	dw vBGWin + $130

OAMOffsetsTable_282b9:
; y, x coordinates
	db $40, $18
	db $40, $40
	db $40, $68
	db $48, $18
	db $48, $40
	db $48, $68
	db $50, $18
	db $50, $40
	db $50, $68
	db $58, $18
	db $58, $40
	db $58, $68
	db $68, $18
	db $68, $40
	db $68, $68
	db $70, $18
	db $70, $40
	db $70, $68
	db $78, $18
	db $78, $40
	db $78, $68
	db $80, $18
	db $80, $40
	db $80, $68

Func_282e9: ; 0x282e9
	ld a, [wd960]
	and a
	jr z, .asm_28318
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, MonAnimatedSpriteTypes
	add hl, bc
	ld a, Bank(MonAnimatedSpriteTypes)
	call ReadByteFromBank
	ld c, a
	ld a, [hFrameCounter]
	swap a
	and $7
	cp $7
	jr z, .asm_2830d
	and $1
	jr .asm_2830f

.asm_2830d
	ld a, $2
.asm_2830f
	add c
	add $a5
	ld bc, $2030
	call LoadOAMData
.asm_28318
	ld a, [wdaa2]
	sla a
	ld c, a
	ld b, $0
	ld hl, OAMOffsetsTable_282b9
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, $63
	call LoadOAMData
	call Func_28368
	ld a, [hNewlyPressedButtons]
	and $6
	jr z, .asm_28367
	ld a, BANK(PokedexTilemap)
	ld hl, PokedexTilemap
	ld de, vBGWin
	ld bc, $0200
	call LoadVRAMData
	ld a, $1
	ld [rVBK], a
	ld a, BANK(PokedexBGAttributes)
	ld hl, PokedexBGAttributes
	ld de, vBGWin
	ld bc, $0200
	call LoadVRAMData
	xor a
	ld [rVBK], a
	call Func_28972
	callba Func_28a8a
	call Func_28ad1
	ld a, $1
	ld [wScreenState], a
.asm_28367
	ret

Func_28368: ; 0x28368
	ld a, [hJoypadState]
	bit BIT_A_BUTTON, a
	jr nz, .asm_28371
	jp Func_284bc

.asm_28371
	ld a, [hPressedButtons]
	ld b, a
	ld a, [wdaa2]
	ld e, a
	ld d, $0
	ld hl, wda8a
	add hl, de
	ld a, [hl]
	bit 5, b
	jr z, .asm_28386
	dec a
	jr .asm_2838a

.asm_28386
	bit 4, b
	ret z
	inc a
.asm_2838a
	and $1f
	ld [hl], a
	push af
	sla e
	rl d
	ld hl, VRAMAddresses_28289
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	push af
	swap a
	and $f
	call PutTileInVRAM
	inc hl
	pop af
	and $f
	call PutTileInVRAM
	ld hl, Data_2842c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hld]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld a, [hld]
	or c
	ld c, a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld a, [hl]
	or c
	ld c, a
	ld a, [wd960]
	and a
	jr nz, .asm_283ff
	ld hl, BGPaletteIndices_2845c
	add hl, de
	ld a, [hl]
	ld hl, rBGPI
	call PutTileInVRAM
	ld hl, rBGPD
	ld a, c
	call PutTileInVRAM
	ld a, b
	call PutTileInVRAM
	ret

.asm_283ff
	ld hl, BGPaletteIndices_2845c
	add hl, de
	ld a, [hl]
	ld hl, rBGPI
	call PutTileInVRAM
	ld hl, rBGPD
	ld a, c
	call PutTileInVRAM
	ld a, b
	call PutTileInVRAM
	ld hl, SpritePaletteIndices_2848c
	add hl, de
	ld a, [hl]
	ld hl, rOBPI
	call PutTileInVRAM
	ld hl, rOBPD
	ld a, c
	call PutTileInVRAM
	ld a, b
	call PutTileInVRAM
	ret

Data_2842c:
	dw wda8c
	dw wda8c
	dw wda8c
	dw wda8f
	dw wda8f
	dw wda8f
	dw wda92
	dw wda92
	dw wda92
	dw wda95
	dw wda95
	dw wda95
	dw wda98
	dw wda98
	dw wda98
	dw wda9b
	dw wda9b
	dw wda9b
	dw wda9e
	dw wda9e
	dw wda9e
	dw wdaa1
	dw wdaa1
	dw wdaa1

BGPaletteIndices_2845c:
; second byte is unused
	db $30 | $80, $00
	db $30 | $80, $00
	db $30 | $80, $00
	db $32 | $80, $00
	db $32 | $80, $00
	db $32 | $80, $00
	db $34 | $80, $00
	db $34 | $80, $00
	db $34 | $80, $00
	db $36 | $80, $00
	db $36 | $80, $00
	db $36 | $80, $00
	db $38 | $80, $00
	db $38 | $80, $00
	db $38 | $80, $00
	db $3A | $80, $00
	db $3A | $80, $00
	db $3A | $80, $00
	db $3C | $80, $00
	db $3C | $80, $00
	db $3C | $80, $00
	db $3E | $80, $00
	db $3E | $80, $00
	db $3E | $80, $00

SpritePaletteIndices_2848c:
	db $D8, $00
	db $D8, $00
	db $D8, $00
	db $DA, $00
	db $DA, $00
	db $DA, $00
	db $DC, $00
	db $DC, $00
	db $DC, $00
	db $DE, $00
	db $DE, $00
	db $DE, $00
	db $E8, $00
	db $E8, $00
	db $E8, $00
	db $EA, $00
	db $EA, $00
	db $EA, $00
	db $EC, $00
	db $EC, $00
	db $EC, $00
	db $EE, $00
	db $EE, $00
	db $EE, $00

Func_284bc: ; 0x284bc
	ld a, [hPressedButtons]
	ld b, a
	ld a, [wdaa2]
	bit 5, b
	jr z, .asm_284cd
	dec a
	bit 7, a
	jr nz, .asm_284ef
	jr .asm_284f5

.asm_284cd
	bit 4, b
	jr z, .asm_284d8
	inc a
	cp $18
	jr nc, .asm_284f3
	jr .asm_284f5

.asm_284d8
	bit 6, b
	jr z, .asm_284e4
	sub $3
	bit 7, a
	jr nz, .asm_284ef
	jr .asm_284f5

.asm_284e4
	bit 7, b
	ret z
	add $3
	cp $18
	jr nc, .asm_284f3
	jr .asm_284f5

.asm_284ef
	add $18
	jr .asm_284f5

.asm_284f3
	sub $18
.asm_284f5
	ld [wdaa2], a
	ret

ExitPokedexScreen: ; 0x284f9
	call FadeOut
	call DisableLCD
	ld hl, hSTAT
	res 6, [hl]
	ld hl, rIE
	res 1, [hl]
	ld a, SCREEN_TITLESCREEN
	ld [wCurrentScreen], a
	xor a
	ld [wScreenState], a
	ret

Func_28513: ; 0x28513
	ld a, [hPressedButtons]
	ld hl, wd95e
	or [hl]
	ld [hl], a
	ld a, [wd95c]
	and a
	ret nz
	ld de, NUM_POKEMON
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld a, [wd95e]
	bit BIT_D_UP, a
	jr z, .asm_28548
	ld a, b
	or c
	jp z, .asm_285a9
	dec bc
	ld a, b
	ld [wCurPokedexIndex], a
	ld a, c
	ld [wCurPokedexIndex + 1], a
	ld a, $4
	ld [wd95c], a
	ld a, $1
	ld [wd95f], a
	jp .asm_285a9

.asm_28548
	bit BIT_D_DOWN, a
	jr z, .asm_2855f
	inc bc
	ld a, b
	cp d
	jr nz, .continue
	ld a, c
	cp e
	jp z, .asm_285a9
.continue
	ld a, b
	ld [wCurPokedexIndex], a
	ld a, c
	ld [wCurPokedexIndex + 1], a
	ld a, $4
	ld [wd95c], a
	ld a, $1
	ld [wd95f], a
	jp .asm_285a9

.asm_2855f
	ld a, [wPokedexOffset]
	ld b, a
	ld a, [wPokedexOffset + 1]
	ld c, a
	ld de, 5
	ld a, [wd95e]
	; Disable left scrolling in Dex.
	; bit BIT_D_LEFT, a
	; jr z, .asm_28586
	jr .asm_28586

	ld a, b
	and a
	jr nz, .asm_28571
	ld a, c
	cp $5
	jr nc, .asm_28571
	ld d, b
	ld e, c
.asm_28571
	ld a, c
	sub e
	ld c, a
	jr nc, .noCarry
	dec b
.noCarry
	ld a, b
	sub d
	ld [wPokedexOffset], a
	ld a, c
	ld [wPokedexOffset + 1], a
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	sub e
	ld c, a
	jr nc, .noCarry2
	dec b
.noCarry2
	ld a, b
	sub d
	ld [wCurPokedexIndex], a
	ld a, c
	ld [wCurPokedexIndex + 1], a
	ld a, $1
	ld [wd95f], a
	call Func_285ca
	jr .asm_285aa

.asm_28586
	; Disable right scrolling in Dex.
	;bit BIT_D_RIGHT, a
	;jr z, .asm_285ae
	jr .asm_285ae

	ld hl, 5
	ld a, [wPokedexOffset]
	ld d, a
	ld a, [wPokedexOffset + 1]
	ld e, a
	ld a, d
	cp (((NUM_POKEMON - 9) >> 8) & $FF)
	jr c, .asm_28594
	ld a, e
	cp ((NUM_POKEMON - 9) & $FF)
	jr c, .asm_28594
	ld a, h
	cpl
	ld h, a
	ld a, l
	cpl
	ld l, a
	ld bc, 5
	add hl, bc
.asm_28594
	push hl
	add hl, de
	ld a, h
	ld [wPokedexOffset], a
	ld a, l
	ld [wPokedexOffset + 1], a
	pop hl
	ld a, [wCurPokedexIndex]
	ld d, a
	ld a, [wCurPokedexIndex + 1]
	ld e, a
	add hl, de
	ld a, h
	ld [wCurPokedexIndex], a
	ld a, l
	ld [wCurPokedexIndex + 1], a
	ld a, $1
	ld [wd95f], a
	call Func_285ca
	jr .asm_285aa

.asm_285a9
	xor a
.asm_285aa
	ld [wd95e], a
	ret

.asm_285ae
	ld a, [wd95f]
	and a
	ret z
	lb de, $00, $03
	call PlaySoundEffect
	call Func_28931
	call Func_289c8
	callba Func_28a15
	call Func_28add
	xor a
	ld [wd95f], a
	ret

Func_285ca: ; 0x285ca
	xor a
	ld [wPressedButtonsPersistent], a
	call Func_28972
	callba Func_28a8a
	call Func_28ad1
	ld a, [wPressedButtonsPersistent]
	ret

Func_285db: ; 0x285db
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, wPokedexFlags
	add hl, bc
	bit 1, [hl]  ; has pokemon been seen or captured?
	call nz, Func_287e7
	ld bc, $8c38
	ld a, $64
	call LoadOAMData
	ld bc, vTilesSH tile $04
	ld a, $65
	call LoadOAMData
	ld bc, $8888
	ld a, $66
	call LoadOAMData
	call DrawCornerInfoPokedexScreen
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, DexScrollBarOffsets
	add hl, bc
	ld a, Bank(DexScrollBarOffsets)
	call ReadByteFromBank
	add $49
	ld c, a
	ld b, $90
	ld a, [wd95b]
	srl a
	srl a
	and $3
	ld e, a
	ld d, $0
	ld hl, DexScrollBarOAMIds
	add hl, de
	ld a, [hl]
	call LoadOAMData
	ld a, [wCurPokedexIndex]
	ld h, a
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld l, a
	ld c, a
	ld a, [wPokedexOffset]
	cpl
	ld d, a
	ld a, [wPokedexOffset + 1]
	cpl
	ld e, a
	inc de ; negative de
	add hl, de ; hl = [wCurPokedexIndex] - [wPokedexOffset]
	ld a, [wPokedexOffset]
	ld d, a
	ld a, [wPokedexOffset + 1]
	ld e, a
	ld a, b
	cp d
	jr c, .lessThan
	jr nz, .asm_2863b
	ld a, c
	cp e
	jr nc, .asm_2863b
.lessThan
	ld a, [wPokedexOffset]
	ld d, a
	ld a, [wPokedexOffset + 1]
	ld e, a
	dec de
	ld a, d
	ld [wPokedexOffset], a
	ld a, e
	ld [wPokedexOffset + 1], a
	ld a, $1
	ld [wd95d], a
	ld bc, 0
	jr .asm_28647

.asm_2863b
	ld b, h
	ld c, l
	ld a, b
	and a
	jr nz, .greaterThan5
	ld a, c
	cp 5
	jr c, .asm_28647
.greaterThan5
	ld a, $1
	ld [wd95d], a
	ld a, [wPokedexOffset]
	ld d, a
	ld a, [wPokedexOffset + 1]
	ld e, a
	inc de
	ld a, d
	ld [wPokedexOffset], a
	ld a, e
	ld [wPokedexOffset + 1], a
	ld bc, 4
.asm_28647
	push bc
	ld a, [hJoypadState]
	and a
	ld a, [wd95b]
	jr z, .asm_28652
	xor a
.asm_28652
	inc a
	ld [wd95b], a
	bit 3, a
	jr nz, .asm_28667
	swap c
	ld a, c
	add $40
	ld c, a
	ld b, $10
	ld a, $63
	call LoadOAMData
.asm_28667
	pop bc
	ld a, [wd95c]
	and a
	ret z
	dec a
	ld [wd95c], a
	sla a
	ld e, a
	ld d, $0
	ld hl, wPokedexOffset
	push hl
	ld hl, PointerTable_2867f
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

PointerTable_2867f: ; 0x2867f
	dw Func_286dd
	dw Func_28721
	dw Func_286dd
	dw Func_28765

DexScrollBarOAMIds:
	db $67, $68, $69, $68

DrawCornerInfoPokedexScreen: ; 0x2868b
; If player is holding SELECT button, it draws the seen/own count in the top-right corner.
; Otherwise, it draws the word "POKeDEX".
	ld a, [hJoypadState]
	bit BIT_SELECT, a
	jr z, .asm_286c8
	ld bc, $6d03
	ld a, [wNumPokemonOwned + 1]
	call LoadSeenOwnDigitOAM
	ld a, [wNumPokemonOwned]
	swap a
	call LoadSeenOwnDigitOAM
	ld a, [wNumPokemonOwned]
	call LoadSeenOwnDigitOAM
	ld bc, $8202
	ld a, $76
	call LoadOAMData  ; draws the "/" between the seen/owned numbers
	ld bc, $8703
	ld a, [wNumPokemonSeen + 1]
	call LoadSeenOwnDigitOAM
	ld a, [wNumPokemonSeen]
	swap a
	call LoadSeenOwnDigitOAM
	ld a, [wNumPokemonSeen]
	call LoadSeenOwnDigitOAM
	ret

.asm_286c8
	ld bc, $6800
	ld a, $6a
	call LoadOAMData
	ret

LoadSeenOwnDigitOAM: ; 0x286d1
	and $f
	add $6c
	call LoadOAMData
	ld a, b
	add $7 ; adds 7 pixels to the next digit's x position on screen
	ld b, a
	ret

Func_286dd: ; 0x286dd
	pop hl
	ld a, [wd862]
	and a
	jr nz, .asm_286ff
	push bc
	push hl
	ld a, [wd863]
	ld e, a
	ld a, [wd864]
	ld d, a
	ld hl, wPokedexFontBuffer
	xor a
	ld bc, $00a0
	call LoadOrCopyVRAMData
	ld a, $1
	ld [wd862], a
	pop hl
	pop bc
.asm_286ff
	ld a, [wd95d]
	and a
	ret z
	ld a, [wd95c]
	and a
	jr nz, .asm_2870d
	ld [wd95d], a
.asm_2870d
	ld a, c
	and a
	jr nz, .asm_28719
	ld hl, hNextFrameHBlankSCX
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_28719
	ld hl, hNextFrameHBlankSCX
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

Func_28721: ; 0x28721
	pop hl
	ld a, [wd95d]
	and a
	ret z
	ld a, c
	and a
	jr nz, .asm_28747
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	callba Func_28aaa_pre
	ld hl, hNextFrameHBlankSCX
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	ret

.asm_28747
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	callba Func_28aaa_pre
	ld hl, hNextFrameHBlankSCX
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	ret

Func_28765: ; 0x28765
	pop hl
	ld a, [wd95d]
	and a
	ret z
	ld a, c
	and a
	jr nz, .asm_28791
	push hl
	inc hl
	ld a, [hl]
	sla a
	and $e
	ld c, a
	ld b, $0
	ld hl, TileLocations_287b7
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, hNextFrameHBlankSCX
	dec [hl]
	dec [hl]
	dec [hl]
	dec [hl]
	pop hl
	xor a
	ld [wd862], a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	call Func_28993
	ret

.asm_28791
	push hl
	inc hl
	ld a, [hl]
	add $5
	sla a
	and $e
	ld c, a
	ld b, $0
	ld hl, TileLocations_287b7
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, hNextFrameHBlankSCX
	inc [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	pop hl
	xor a
	ld [wd862], a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	call Func_28993
	ret

TileLocations_287b7:
	dw vTilesOB tile $0
	dw vTilesOB tile $A
	dw vTilesOB tile $14
	dw vTilesOB tile $1E
	dw vTilesOB tile $28
	dw vTilesOB tile $32
	dw vTilesOB tile $3C
	dw vTilesOB tile $46

Func_287e7: ; 0x287e7
	ld a, [wd960]
	and a
	ret z
	ld a, [wd95f]
	and a
	ret nz
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, MonAnimatedSpriteTypes
	add hl, bc
	ld a, Bank(MonAnimatedSpriteTypes)
	call ReadByteFromBank
	bit 7, a
	ret nz
	ld [wCurrentAnimatedMonSpriteType], a
	call Func_28815
	ld a, [wCurrentAnimatedMonSpriteFrame]
	add $a5
	ld bc, $2030
	call LoadOAMData
	ret

Func_28815: ; 0x28815
	ld a, [wLoopsUntilNextCatchSpriteAnimationChange]
	dec a
	ld [wLoopsUntilNextCatchSpriteAnimationChange], a
	ret nz
	ld a, [wBallHitWildMon]
	inc a
	and $7
	ld [wBallHitWildMon], a
	jr nz, .asm_28836
	ld a, [wCurrentCatchMonHitFrameDuration]
	ld [wLoopsUntilNextCatchSpriteAnimationChange], a
	xor a
	ld [wCatchModeMonUpdateTimer], a
	ld c, $2
	jr .asm_28854

.asm_28836
	ld a, [wCurrentAnimatedMonSpriteType]
	ld c, a
	ld a, [wCurrentAnimatedMonSpriteFrame]
	sub c
	cp $1
	ld c, $0
	jr nc, .asm_28846
	ld c, $1
.asm_28846
	ld b, $0
	ld hl, wCurrentCatchMonIdleFrame1Duration
	add hl, bc
	ld a, [hl]
	ld [wLoopsUntilNextCatchSpriteAnimationChange], a
	xor a
	ld [wCatchModeMonUpdateTimer], a
.asm_28854
	ld a, [wCurrentAnimatedMonSpriteType]
	add c
	ld [wCurrentAnimatedMonSpriteFrame], a
	ret

Func_2885c: ; 0x2885c
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, wPokedexFlags
	add hl, bc
	bit 1, [hl]
	call nz, Func_287e7
	ld bc, $8888
	ld a, $66
	call LoadOAMData
	ld bc, $6800
	ld a, $6a
	call LoadOAMData
	ret

Func_2887c: ; 0x2887c
	ld a, BANK(PokedexTilemap2)
	ld hl, PokedexTilemap2 + $120
	deCoord 0, 8, vBGMap
	ld bc, $0100
	call LoadVRAMData
	ld a, $3f
	ld [hLYC], a
	ld a, $47
	ld [hNextLYCSub], a
	ld b, $33
.asm_28894
	push bc
	ld a, $7a
	sub b
	ld [hNextLYCSub], a
	rst AdvanceFrame
	pop bc
	dec b
	dec b
	dec b
	jr nz, .asm_28894
	ret

Func_288a2: ; 0x288a2
	ld b, $33
.asm_288a4
	push bc
	ld a, $44
	add b
	ld [hNextLYCSub], a
	rst AdvanceFrame
	pop bc
	dec b
	dec b
	dec b
	jr nz, .asm_288a4
	ld a, $3b
	ld [hLYC], a
	ld [hNextLYCSub], a
	ld a, BANK(PokedexTilemap2)
	ld hl, PokedexTilemap2 + $100
	deCoord 0, 8, vBGMap
	ld bc, $0020
	call LoadVRAMData
	ret

Func_288c6: ; 0x288c6
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, wPokedexFlags
	add hl, bc
	bit 1, [hl]
	ld hl, Unknown_2c000
	jr z, .asm_288f4
	ld a, [wCurPokedexIndex]
	ld h, a
	ld a, [wCurPokedexIndex + 1]
	ld l, a
	ld b, h
	ld c, l
	sla c
	rl b
	add hl, bc
	ld b, h
	ld c, l
	ld hl, PokedexDescriptionPointers
	add hl, bc
	ld a, BANK(PokedexDescriptionPointers)
	call ReadByteFromBank
	inc hl
	ld c, a
	ld a, BANK(PokedexDescriptionPointers)
	call ReadByteFromBank
	inc hl
	ld b, a
	ld a, BANK(PokedexDescriptionPointers)
	call ReadByteFromBank
	ld [wScratchBuffer], a
	ld h, b
	ld l, c
.asm_288f4
	xor a
	ld [wd860], a
	ld [wd861], a
	ld bc, $906c
	ld de, vTilesSH tile $10
	call Func_28d97
	rl a
	ld [wd956], a
	ld a, l
	ld [wd957], a
	ld a, h
	ld [wd958], a
	ret

Func_28912: ; 0x28912
	ld bc, $906c
	ld de, vTilesSH tile $10
	ld a, [wd957]
	ld l, a
	ld a, [wd958]
	ld h, a
	call Func_28d97
	rl a
	ld [wd956], a
	ld a, l
	ld [wd957], a
	ld a, h
	ld [wd958], a
	ret

Func_28931: ; 0x28931
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, wPokedexFlags
	add hl, bc
	ld a, [hl]
	and a
	ld hl, BlankDexName
	jr z, .asm_2895d
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld h, b
	ld l, c
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	add hl, bc
	add hl, bc
	add hl, bc
	ld bc, MonDexNames
	add hl, bc
.asm_2895d
	ld a, $ff
	ld [wd860], a
	xor a
	ld [wd861], a
	ld [wScratchBuffer + 1], a ; load VWF text from this same bank.
	ld bc, $500a
	ld de, vTilesBG tile $50
	call Func_28e09
	ret

BlankDexName:
	db " @"

Func_28972: ; 0x28972
	ld a, [wPokedexOffset]
	ld b, a
	ld a, [wPokedexOffset + 1]
	ld c, a
	ld h, $6
.asm_28978
	push bc
	push de
	push hl
	ld a, c
	sla a
	and $e
	ld e, a
	ld d, $0
	ld hl, TileLocations_287b7
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	call Func_28993
	pop hl
	pop de
	pop bc
	inc bc
	dec h
	jr nz, .asm_28978
	ret

Func_28993: ; 0x28993
	push hl
	ld hl, wPokedexFlags
	add hl, bc
	ld a, [hl]
	and a
	ld hl, BlankDexName2
	jr z, .asm_289b7
	ld h, b
	ld l, c
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	add hl, bc
	add hl, bc
	add hl, bc
	ld bc, MonDexNames
	add hl, bc
.asm_289b7
	xor a
	ld [wd860], a
	ld [wd861], a
	ld [wScratchBuffer + 1], a ; load VWF text from this same bank.
	ld bc, $500a ; not a pointer
	call Func_28e09
	pop hl
	ret

BlankDexName2:
	db " @"

Func_289c8: ; 0x289c8
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, wPokedexFlags
	add hl, bc
	bit 1, [hl]
	ld hl, BlankSpeciesName
	ld a, Bank(BlankSpeciesName)
	ld [wScratchBuffer], a
	jr z, .pokemonNotOwned
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, MonSpecies
	add hl, bc
	ld a, Bank(MonSpecies)
	call ReadByteFromBank
	ld c, a
	ld h, b
	ld l, c
	sla l
	rl h
	add hl, bc
	ld bc, MonSpeciesNamesPointers
	add hl, bc
	ld a, Bank(MonSpeciesNamesPointers)
	call ReadByteFromBank
	ld c, a
	inc hl
	ld a, Bank(MonSpeciesNamesPointers)
	call ReadByteFromBank
	ld b, a
	inc hl
	ld a, Bank(MonSpeciesNamesPointers)
	call ReadByteFromBank
	ld [wScratchBuffer], a
	ld h, b
	ld l, c
.pokemonNotOwned
	ld a, $ff
	ld [wd860], a
	ld a, $4
	ld [wd861], a
	ld bc, $5816
	ld de, vTilesBG tile $5a
	ld a, 1
	ld [wScratchBuffer + 1], a ; load VWF text from another bank.
	call Func_28e09
	ret

BlankSpeciesName:
	dw $4081 ; variable-width font character
	db $00

Func_28ad1: ; 0x28ad1
	ld a, [wPokedexOffset + 1]
	swap a
	and $f0
	sub $3c
	ld [hNextFrameHBlankSCX], a
	ret

Func_28add: ; 0x28add
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, wPokedexFlags
	add hl, bc
	ld a, [hl]
	and a
	jp z, LoadUncaughtPokemonBackgroundGfx
	dec a
	jp z, LoadSeenPokemonGfx
	ld a, [wd960]
	and a
	jr z, .asm_28afc
	call Func_28cc2
	jp z, Func_28bf5
.asm_28afc
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld h, b
	ld l, c
	add hl, bc
	add hl, bc
	ld b, h
	ld c, l
.asm_28b0b
	push bc
	ld hl, MonBillboardPicPointers
	add hl, bc
	ld a, Bank(MonBillboardPicPointers)
	call ReadByteFromBank
	inc hl
	ld c, a
	ld a, Bank(MonBillboardPicPointers)
	call ReadByteFromBank
	inc hl
	ld b, a
	ld a, Bank(MonBillboardPicPointers)
	call ReadByteFromBank
	ld h, b
	ld l, c
	ld de, vTilesBG tile $00
	ld bc, $0180
	call LoadOrCopyVRAMData
	call Func_28cd4
	pop bc
	ld a, [hGameBoyColorFlag]
	and a
	ret z
	push bc
	ld hl, MonBillboardPaletteMapPointers
	add hl, bc
	ld a, Bank(MonBillboardPaletteMapPointers)
	call ReadByteFromBank
	inc hl
	ld e, a
	ld a, Bank(MonBillboardPaletteMapPointers)
	call ReadByteFromBank
	inc hl
	ld d, a
	ld a, Bank(MonBillboardPaletteMapPointers)
	call ReadByteFromBank
	hlCoord 1, 3, vBGMap
	call LoadBillboardPaletteMap
	pop bc
	ld hl, MonBillboardPalettePointers
	add hl, bc
	ld a, Bank(MonBillboardPalettePointers)
	call ReadByteFromBank
	inc hl
	ld e, a
	ld a, Bank(MonBillboardPalettePointers)
	call ReadByteFromBank
	inc hl
	ld d, a
	ld a, Bank(MonBillboardPalettePointers)
	call ReadByteFromBank
	ld bc, $10b0
	ld hl, rBGPI
	call Func_8e1
	ret

LoadUncaughtPokemonBackgroundGfx: ; 0x28b76
	ld a, BANK(UncaughtPokemonBackgroundPic)
	ld hl, UncaughtPokemonBackgroundPic
	ld de, vTilesBG tile $00
	ld bc, $0180
	call LoadOrCopyVRAMData
	call Func_28cd4
	ld a, [hGameBoyColorFlag]
	and a
	ret z
	ld a, BANK(UncaughtPokemonPaletteMap)
	ld de, UncaughtPokemonPaletteMap
	hlCoord 1, 3, vBGMap
	call LoadBillboardPaletteMap
	ret

UncaughtPokemonPaletteMap:
	db $05, $05, $05, $05, $05, $05
	db $05, $05, $05, $05, $05, $05
	db $05, $05, $05, $05, $05, $05
	db $05, $05, $05, $05, $05, $05

LoadSeenPokemonGfx: ; 0x28baf
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld h, b
	ld l, c
	add hl, bc
	add hl, bc
	ld b, h
	ld c, l
.asm_28bbe
	ld hl, MonBillboardPicPointers
	add hl, bc
	ld a, Bank(MonBillboardPicPointers)
	call ReadByteFromBank
	inc hl
	ld c, a
	ld a, Bank(MonBillboardPicPointers)
	call ReadByteFromBank
	inc hl
	ld b, a
	ld a, Bank(MonBillboardPicPointers)
	call ReadByteFromBank
	ld hl, $0180
	add hl, bc
	ld de, vTilesBG tile $00
	ld bc, $0180
	call LoadOrCopyVRAMData
	call Func_28cd4
	ld a, [hGameBoyColorFlag]
	and a
	ret z
	ld a, BANK(UncaughtPokemonPaletteMap)
	ld de, UncaughtPokemonPaletteMap
	hlCoord 1, 3, vBGMap
	call LoadBillboardPaletteMap
	ret

Func_28bf5: ; 0x28bf5
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld h, b
	ld l, c
	add hl, bc
	add hl, bc
	ld b, h
	ld c, l
.asm_28c04
	push bc
	ld a, $1
	ld [rVBK], a
	ld hl, MonAnimatedPicPointers
	add hl, bc
	ld a, Bank(MonAnimatedPicPointers)
	call ReadByteFromBank
	inc hl
	ld c, a
	ld a, Bank(MonAnimatedPicPointers)
	call ReadByteFromBank
	inc hl
	ld b, a
	ld a, Bank(MonAnimatedPicPointers)
	call ReadByteFromBank
	ld h, b
	ld l, c
	ld de, vTilesOB
	ld bc, $0300
	call LoadOrCopyVRAMData
	xor a
	ld [rVBK], a
	pop bc
	push bc
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, CatchemMonIds
	add hl, bc
	ld a, BANK(CatchemMonIds)
	call ReadByteFromBank
	ld c, a
	ld b, $0
	sla c
	rl b
	add c
	ld c, a
	jr nc, .asm_28c4b
	inc b
.asm_28c4b
	ld hl, CatchSpriteFrameDurations
	add hl, bc
	ld a, Bank(CatchSpriteFrameDurations)
	call ReadByteFromBank
	ld [wCurrentCatchMonIdleFrame1Duration], a
	ld [wLoopsUntilNextCatchSpriteAnimationChange], a
	inc hl
	ld a, Bank(CatchSpriteFrameDurations)
	call ReadByteFromBank
	ld [wCurrentCatchMonIdleFrame2Duration], a
	inc hl
	ld a, Bank(CatchSpriteFrameDurations)
	call ReadByteFromBank
	ld [wCurrentCatchMonHitFrameDuration], a
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, MonAnimatedSpriteTypes
	add hl, bc
	ld a, Bank(MonAnimatedSpriteTypes)
	call ReadByteFromBank
	ld [wCurrentAnimatedMonSpriteType], a
	ld [wCurrentAnimatedMonSpriteFrame], a
	call Func_28cf8
	pop bc
	ld a, [hGameBoyColorFlag]
	and a
	ret z
	ld hl, MonAnimatedPalettePointers
	add hl, bc
	ld a, Bank(MonAnimatedPalettePointers)
	call ReadByteFromBank
	inc hl
	ld e, a
	ld a, Bank(MonAnimatedPalettePointers)
	call ReadByteFromBank
	inc hl
	ld d, a
	ld a, Bank(MonAnimatedPalettePointers)
	call ReadByteFromBank
	push af
	push de
	ld bc, $10b0
	ld hl, rBGPI
	call Func_8e1
	pop de
	pop af
	push af
	ld bc, $08d8
	ld hl, rOBPI
	call Func_8e1
	pop af
	ld bc, $08e8
	ld hl, rOBPI
	call Func_8e1
	ret

Func_28cc2: ; 0x28cc2
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, MonAnimatedSpriteTypes
	add hl, bc
	ld a, Bank(MonAnimatedSpriteTypes)
	call ReadByteFromBank
	bit 7, a
	ret

Func_28cd4: ; 0x28cd4
	xor a
	ld hl, wd961
	cp [hl]
	ret z
	ld [hl], a
	ld de, .data_28ce0
	jr Func_28d1d

.data_28ce0: ; 0x28ce0
	db $0
	db $1
	db $2
	db $3
	db $4
	db $5
	db $6
	db $7
	db $8
	db $9
	db $a
	db $b
	db $c
	db $d
	db $e
	db $f
	db $10
	db $11
	db $12
	db $13
	db $14
	db $15
	db $16
	db $17

Func_28cf8: ; 0x28cf8
	ld a, $1
	ld hl, wd961
	cp [hl]
	ret z
	ld [hl], a
	ld de, .data_28d05
	jr Func_28d1d

.data_28d05
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe
	db $fe

Func_28d1d:
	hlCoord 1, 3, vBGMap
	ld b, $4
.asm_28d22
	ld c, $6
.asm_28d24
	ld a, [de]
	call PutTileInVRAM
	inc de
	inc hl
	dec c
	jr nz, .asm_28d24
	ld a, l
	add $1a
	ld l, a
	dec b
	jr nz, .asm_28d22
	ret

CountNumSeenMons:
	ld hl, wPokedexFlags
	ld bc, $0000  ; keep a running count
	ld de, NUM_POKEMON
.checkSeen
	bit 0, [hl]  ; is mon seen?
	jr z, .nextMon
	inc bc
.nextMon
	inc hl
	dec de
	ld a, d
	or e
	jr nz, .checkSeen
	call ConvertHexWordToBCD
	ld a, e
	ld [wNumPokemonSeen], a
	ld a, d
	ld [wNumPokemonSeen + 1], a
	ret

CountNumOwnedMons:
	ld hl, wPokedexFlags
	ld bc, $0000  ; keep a running count
	ld de, NUM_POKEMON
.checkOwned
	bit 1, [hl]  ; is mon owned?
	jr z, .nextMon
	inc bc
.nextMon
	inc hl
	dec de
	ld a, d
	or e
	jr nz, .checkOwned
	call ConvertHexWordToBCD
	ld a, e
	ld [wNumPokemonOwned], a
	ld a, d
	ld [wNumPokemonOwned + 1], a
	ret

ConvertHexWordToBCD: ; 0xe21
; Convert the base-16 value in register bc into a Binary Coded Decimal (base-10) word.
; Example:  If bc = $0101, de = $0257.
; The maximum value of bc that is supported is bc = $3FF
	ld hl, PowersOfTwo_Word
	ld de, $0000
.loop
	bit 0, c
	ld a, [hli]
	jr z, .continue
	add e
	daa
	ld e, a
	ld a, [hl]
	adc d
	daa
	ld d, a
.continue
	srl b
	rr c
	inc hl
	ld a, b
	or c
	and a
	jr nz, .loop
	ret

PowersOfTwo_Word:
	dw $0001
	dw $0002
	dw $0004
	dw $0008
	dw $0016
	dw $0032
	dw $0064
	dw $0128
	dw $0256
	dw $0512

ClearPokedexData: ; 0x28d66
	ld hl, wPokedexFlags
	xor a
	ld b, (NUM_POKEMON & $FF) ; TODO
.asm_28d6c
	ld [hli], a
	dec b
	jr nz, .asm_28d6c
	ret

Func_28d97: ; 0x28d97
	push de
	ld a, b
	ld [$ff8c], a
	ld [$ff8d], a
	ld a, c
	ld [$ff8f], a
	xor a
	ld [$ff8e], a
	ld [$ff90], a
	ld [$ff91], a
	call Func_28e73
.asm_28daa
	call Func_2957c
	jr nc, .asm_28dcb
	push hl
	ld [$ff92], a
	cp $ff
	jr nz, .asm_28dbb
	call Func_208c
	jr .asm_28dc8

.asm_28dbb
	ld c, a
	ld b, $0
	ld hl, CharacterWidths
	add hl, bc
	ld a, [hl]
	ld [$ff93], a
	call LoadDexVWFCharacter
.asm_28dc8
	pop hl
	jr nc, .asm_28daa
.asm_28dcb
	pop de
	push af
	ld a, e
	ld [wd863], a
	ld a, d
	ld [wd864], a
	ld a, [wd862]
	and a
	jr nz, .asm_28ddd
	pop af
	ret

.asm_28ddd
	push hl
	ld a, [wd861]
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_28de9
	dec b
.asm_28de9
	ld hl, wPokedexFontBuffer
	add hl, bc
	ld a, [$ff8f]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	xor a
	call LoadOrCopyVRAMData
	pop hl
	pop af
	ret

Func_28e09: ; 0x28e09
	push de
	ld a, b
	ld [$ff8c], a
	ld [$ff8d], a
	ld a, c
	ld [$ff8f], a
	xor a
	ld [$ff8e], a
	ld [$ff90], a
	ld [$ff91], a
	call Func_28e73
.asm_28e1c
	call Func_295e1
	jr nc, .asm_28e35
	push hl
	ld [$ff92], a
	ld c, a
	ld b, $0
	ld hl, CharacterWidths
	add hl, bc
	ld a, [hl]
	ld [$ff93], a
	call LoadDexVWFCharacter
	pop hl
	jr nc, .asm_28e1c
	nop
.asm_28e35
	pop de
	push af
	ld a, e
	ld [wd863], a
	ld a, d
	ld [wd864], a
	ld a, [wd862]
	and a
	jr nz, .asm_28e47
	pop af
	ret

.asm_28e47
	push hl
	ld a, [wd861]
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_28e53
	dec b
.asm_28e53
	ld hl, wPokedexFontBuffer
	add hl, bc
	ld a, [$ff8f]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	xor a
	call LoadOrCopyVRAMData
	pop hl
	pop af
	ret

Func_28e73: ; 0x28e73
	push hl
	ld a, [$ff8f]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld hl, Func_29566
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	push hl
	ld hl, wc000
	ld a, [wd860]
	ret

Func_28e9a:
REPT 20 * 87
	ld [hli], a
ENDR
Func_29566:
REPT 20
	ld [hli], a
ENDR
	pop hl
	ret

Func_2957c: ; 0x2957c
	ld a, [wScratchBuffer]
	call ReadByteFromBank
	inc hl
	and a
	ret z
	cp $d ; carriage return
	jr nz, .asm_2958c
	ld a, $ff
	scf
	ret

.asm_2958c
	cp "0"
	jr c, .asm_29594
	cp "9" + 1
	jr c, .asm_295be
.asm_29594
	cp "A"
	jr c, .asm_2959c
	cp "Z" + 1
	jr c, .asm_295c2
.asm_2959c
	cp "a"
	jr c, .asm_295a4
	cp "z" + 1
	jr c, .asm_295c6
.asm_295a4
	cp " "
	jr z, .asm_295ca
	cp ","
	jr z, .asm_295cd
	cp "."
	jr z, .asm_295d1
	cp "`"
	jr z, .asm_295d5
	cp "-"
	jr z, .asm_295d9
	cp "é"
	jr z, .asm_295dd
	and a
	ret

.asm_295be
	sub $88
	scf
	ret

.asm_295c2
	sub $8e
	scf
	ret

.asm_295c6
	sub $94
	scf
	ret

.asm_295ca
	xor a
	scf
	ret

.asm_295cd
	ld a, $f3
	scf
	ret

.asm_295d1
	ld a, $f4
	scf
	ret

.asm_295d5
	ld a, $fa
	scf
	ret

.asm_295d9
	ld a, $b2
	scf
	ret

.asm_295dd
	ld a, $f9
	scf
	ret

ReadCharForVWF:
	ld a, [wScratchBuffer + 1]
	and a
	jr z, .sameBank
	ld a, [wScratchBuffer]
	call ReadByteFromBank
	inc hl
	ret
.sameBank
	ld a, [hli]
	ret

Func_295e1: ; 0x295e1
	call ReadCharForVWF
	and a
	ret z
	cp $80
	jr nc, .asm_295ed
	ld c, a
	ld b, $0
	jr .asm_295f0

.asm_295ed
	ld b, a
	call ReadCharForVWF
	ld c, a
.asm_295f0
	ld a, b
	and a
	jr nz, .asm_295f9
	ld a, c
	sub $20
	scf
	ret

.asm_295f9
	push hl
	call GetCharacterWidthIndex
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	pop hl
	scf
	ret

GetCharacterWidthIndex: ; 0x29605
	ld a, b
	cp $81
	jr nz, .asm_29611
	ld hl, CharacterWidthIndices1
	ld a, c
	sub $40
	ret

.asm_29611
	cp $83
	jr nz, .asm_2961c
	ld hl, CharacterWidthIndices3
	ld a, c
	sub $40
	ret

.asm_2961c
	ld a, c
	cp $9f
	jr nc, .asm_29628
	ld hl, CharacterWidthIndices2
	ld a, c
	sub $4f
	ret

.asm_29628
	ld hl, CharacterWidthIndices4
	ld a, c
	sub $9f
	ret

INCLUDE "data/vwf_character_widths.asm"
INCLUDE "text/pokedex_mon_names.asm"
