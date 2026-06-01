LoadDexVWFCharacter_: ; 0x8d17
; Loads a single variable-width-font character used in various parts of the Pokedex screen.
	ldh a, [$ff92]
	cp $80
	jp c, Func_8e01
	ldh a, [$ff90]
	ld c, a
	ldh a, [$ff91]
	ld b, a
	ldh a, [$ff93]
	ld l, a
	ld h, $0
	add hl, bc
	ldh a, [$ff8e]
	cp h
	jr nz, .asm_8d32
	ldh a, [$ff8d]
	cp l
.asm_8d32
	jr nc, .asm_8d5c
	ldh a, [$ff8d]
	ldh [$ff90], a
	ldh a, [$ff8e]
	ldh [$ff91], a
	ldh a, [$ff8d]
	ld c, a
	ldh a, [$ff8e]
	ld b, a
	ldh a, [$ff8c]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, l
	ldh [$ff8d], a
	ld a, h
	ldh [$ff8e], a
	srl h
	rr l
	srl h
	rr l
	ldh a, [$ff8f]
	cp l
	jp c, Func_8df7
.asm_8d5c
	ldh a, [$ff90]
	and $f8
	ld c, a
	ldh a, [$ff91]
	ld b, a
	sla c
	rl b
	sla c
	rl b
	ld hl, wPokedexFontBuffer
	add hl, bc
	ld d, h
	ld e, l
	ldh a, [$ff92]
	swap a
	ld c, a
	and $f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	sla c
	rl b
	ld hl, PokedexCharactersGfx
	add hl, bc
	push hl
	ldh a, [$ff90]
	and $7
	ld c, a
	ld b, $0
	ld hl, Data_8df9
	add hl, bc
	ld a, [hl]
	ld [wd85e], a
	cpl
	ld [wd85f], a
	ld a, c
	add $58
	ld b, a
	pop hl
	push hl
	ld c, $10
.asm_8da2
	push bc
	ld a, [hli]
	ld c, a
	ld a, [bc]
	ld c, a
	ld a, [wd85e]
	and c
	ld c, a
	ld a, [wd860]
	ld b, a
	ld a, [de]
	xor b
	or c
	xor b
	ld [de], a
	inc de
	ld a, [de]
	xor b
	or c
	xor b
	ld [de], a
	inc de
	inc hl
	pop bc
	dec c
	jr nz, .asm_8da2
	pop hl
	ld c, $10
.asm_8dc4
	push bc
	ld a, [hli]
	ld c, a
	ld a, [bc]
	ld c, a
	ld a, [wd85f]
	and c
	ld c, a
	ld a, [wd860]
	ld b, a
	ld a, [de]
	xor b
	or c
	xor b
	ld [de], a
	inc de
	ld a, [de]
	xor b
	or c
	xor b
	ld [de], a
	inc de
	inc hl
	pop bc
	dec c
	jr nz, .asm_8dc4
	ldh a, [$ff90]
	ld c, a
	ldh a, [$ff91]
	ld b, a
	ldh a, [$ff93]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, l
	ldh [$ff90], a
	ld a, h
	ldh [$ff91], a
	and a
	ret

Func_8df7: ; 0x8df7
	scf
	ret

Data_8df9: ; 0x8df9
	db $FF, $7F, $3F, $1F, $0F, $07, $03, $01

Func_8e01: ; 0x8e01
	ldh a, [$ff90]
	ld c, a
	ldh a, [$ff91]
	ld b, a
	ldh a, [$ff93]
	ld l, a
	ld h, $0
	add hl, bc
	ldh a, [$ff8e]
	cp h
	jr nz, .asm_8e15
	ldh a, [$ff8d]
	cp l
.asm_8e15
	jr nc, .asm_8e3f
	ldh a, [$ff8d]
	ldh [$ff90], a
	ldh a, [$ff8e]
	ldh [$ff91], a
	ldh a, [$ff8d]
	ld c, a
	ldh a, [$ff8e]
	ld b, a
	ldh a, [$ff8c]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, l
	ldh [$ff8d], a
	ld a, h
	ldh [$ff8e], a
	srl h
	rr l
	srl h
	rr l
	ldh a, [$ff8f]
	cp l
	jp c, Func_8ed6
.asm_8e3f
	ldh a, [$ff90]
	and $f8
	ld c, a
	ldh a, [$ff91]
	ld b, a
	sla c
	rl b
	ld hl, wPokedexFontBuffer
	add hl, bc
	ld d, h
	ld e, l
	ldh a, [$ff92]
	swap a
	ld c, a
	and $f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	sla c
	rl b
	ld hl, PokedexCharactersGfx + $8
	add hl, bc
	push hl
	ldh a, [$ff90]
	and $7
	ld c, a
	ld b, $0
	ld hl, Data_8ed8
	add hl, bc
	ld a, [hl]
	ld [wd85e], a
	cpl
	ld [wd85f], a
	ld a, c
	add $58
	ld b, a
	pop hl
	push hl
	ld c, $8
.asm_8e81
	push bc
	ld a, [hli]
	ld c, a
	ld a, [bc]
	ld c, a
	ld a, [wd85e]
	and c
	ld c, a
	ld a, [wd860]
	ld b, a
	ld a, [de]
	xor b
	or c
	xor b
	ld [de], a
	inc de
	ld a, [de]
	xor b
	or c
	xor b
	ld [de], a
	inc de
	inc hl
	pop bc
	dec c
	jr nz, .asm_8e81
	pop hl
	ld c, $8
.asm_8ea3
	push bc
	ld a, [hli]
	ld c, a
	ld a, [bc]
	ld c, a
	ld a, [wd85f]
	and c
	ld c, a
	ld a, [wd860]
	ld b, a
	ld a, [de]
	xor b
	or c
	xor b
	ld [de], a
	inc de
	ld a, [de]
	xor b
	or c
	xor b
	ld [de], a
	inc de
	inc hl
	pop bc
	dec c
	jr nz, .asm_8ea3
	ldh a, [$ff90]
	ld c, a
	ldh a, [$ff91]
	ld b, a
	ldh a, [$ff93]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, l
	ldh [$ff90], a
	ld a, h
	ldh [$ff91], a
	and a
	ret

Func_8ed6: ; 0x8ed6
	scf
	ret

Data_8ed8: ; 0x8ed8
	db $FF, $7F, $3F, $1F, $0F, $07, $03, $01

Func_8ee0: ; 0x8ee0
	ldh a, [$ff8d]
	ldh [$ff90], a
	ldh a, [$ff8e]
	ldh [$ff91], a
	ldh a, [$ff8d]
	ld c, a
	ldh a, [$ff8e]
	ld b, a
	ldh a, [$ff8c]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, l
	ldh [$ff8d], a
	ld a, h
	ldh [$ff8e], a
	srl h
	rr l
	srl h
	rr l
	ldh a, [$ff8f]
	cp l
	ret
