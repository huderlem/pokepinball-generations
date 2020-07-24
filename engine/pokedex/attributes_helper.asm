Func_28a15: ; 0x28a15
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld h, b
	ld l, c
	sla l
	rl h
	add hl, bc
	sla l
	rl h
	add hl, bc
	sla l
	rl h
	add hl, bc
	ld bc, PokedexMonAttributesTexts
	add hl, bc
	ld d, h
	ld e, l
	ld a, $0
	ld [wd865], a
	push de
	hlCoord 4, 2, vBGMap
	call Func_28d71
	pop de
	inc de
	inc de
	inc de
	inc de
	ld a, [wCurPokedexIndex]
	ld b, a
	ld a, [wCurPokedexIndex + 1]
	ld c, a
	ld hl, wPokedexFlags
	add hl, bc
	bit 1, [hl]
	jr nz, .asm_28a54
	ld de, BlankPokemonTileData_28a7f
.asm_28a54
	push de
	hlCoord 8, 6, vBGMap
	call Func_28d71
	pop de
	inc de
	inc de
	inc de
	inc de
	inc de
	push de
	hlCoord 14, 6, vBGMap
	call Func_28d71
	pop de
	inc de
	inc de
	inc de
	inc de
	inc de
	hlCoord 16, 7, vBGMap
	ld a, [rLCDC]
	bit 7, a
	jr nz, .asm_28a7a
	ld a, [de]
	ld [hl], a
	ret

.asm_28a7a
	ld a, [de]
	call PutTileInVRAM
	ret

BlankPokemonTileData_28a7f:
	db $FF, $FF, $72, $FF
	db $00 ; terminator

	db $FF, $FF, $FF, $FF
	db $00 ; terminator

	db $83 ; tile id

Func_28a8a: ; 0x28a8a
	ld a, [wPokedexOffset ]
	ld b, a
	ld a, [wPokedexOffset + 1]
	ld c, a
	ld h, $6
.asm_28a90
	push bc
	push hl
	ld a, c
	sla a
	and $1e
	ld e, a
	ld d, $0
	ld hl, BGMapLocations_287c7
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_28aaa
	pop hl
	pop bc
	inc c
	dec h
	jr nz, .asm_28a90
	ret

BGMapLocations_287c7:
	dw vBGWin + $7
	dw vBGWin + $47
	dw vBGWin + $87
	dw vBGWin + $C7
	dw vBGWin + $107
	dw vBGWin + $147
	dw vBGWin + $187
	dw vBGWin + $1C7
	dw vBGWin + $207
	dw vBGWin + $247
	dw vBGWin + $287
	dw vBGWin + $2C7
	dw vBGWin + $307
	dw vBGWin + $347
	dw vBGWin + $387
	dw vBGWin + $3C7

Func_28aaa_pre:
	push bc
	ld a, c
	sla a
	and $1e
	ld c, a
	ld b, $0
	ld hl, BGMapLocations_287c7
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
Func_28aaa: ; 0x28aaa
	push hl
	ld h, b
	ld l, c
	sla l
	rl h
	add hl, bc
	sla l
	rl h
	add hl, bc
	sla l
	rl h
	add hl, bc
	ld bc, PokedexMonAttributesTexts
	add hl, bc
	ld d, h
	ld e, l
	ld a, $23
	ld [wd865], a
	pop hl
	push hl
	call Func_28d71
	pop hl
	ret

Func_28d71: ; 0x28d71
	ld a, [wd865]
	ld c, a
	ld a, [de]
	inc de
	and a
	ret z
	cp $20
	jr nz, .asm_28d81
	ld a, $ff
	jr .asm_28d82

.asm_28d81
	add c
.asm_28d82
	call Func_28d88
	inc hl
	jr Func_28d71

Func_28d88: ; 0x28d88
	push af
	ld a, [rLCDC]
	bit 7, a
	jr nz, .asm_28d92
	pop af
	ld [hl], a
	ret

.asm_28d92
	pop af
	call PutTileInVRAM
	ret

INCLUDE "text/pokedex_mon_attributes.asm"
