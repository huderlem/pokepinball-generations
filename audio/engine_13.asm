Func_4c000:
	push hl
	push de
	push bc
	push af
	call Func_4cb1b
	ld hl, wChannel0
	ld de, wdeb0 - wChannel0
.clearLoop
	xor a
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .clearLoop
	ld hl, rNR50
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $80
	ld [hli], a
	ld hl, rNR10
	ld e, $4
.loop
	xor a
	ld [hli], a
	ld [hli], a
	ld a, $8
	ld [hli], a
	xor a
	ld [hli], a
	ld a, $80
	ld [hli], a
	dec e
	jr nz, .loop
	ld a, $8
	ld [wde9a], a
	ld a, $77
	ld [wde98], a
	call Func_4cb15
	pop af
	pop bc
	pop de
	pop hl
	ret

Func_4c042:
	ld a, [de]
	inc de
	and $7
	ld [wdeae], a
	ld c, a
	ld b, $0
	ld hl, ChannelPointers_Bank13
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $0002
	add hl, bc
	res 0, [hl]
	push de
	xor a
	ld hl, $0000
	add hl, bc
	ld e, $32
.loop
	ld [hli], a
	dec e
	jr nz, .loop
	ld hl, $0017
	add hl, bc
	xor a
	ld [hli], a
	inc a
	ld [hl], a
	ld hl, $0028
	add hl, bc
	ld [hl], a
	pop de
	ld hl, $0005
	add hl, bc
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	ld hl, $0000
	add hl, bc
	ld a, [wde9b]
	ld [hli], a
	ld a, [wde9c]
	ld [hl], a
	ret

Unused_4c08b: ; 4008b
	db $35, $39, $C8, $41, $3B

PlaySong_Bank13:
	push de
	call Func_4c000
	pop de
	call Func_4cb1b
	ld hl, wde9b
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SongHeaderPointers_Bank13
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	rlca
	rlca
	and $3
	inc a
.asm_4c0ac
	push af
	call Func_4c042
	call Func_4cadf
	pop af
	dec a
	jr nz, .asm_4c0ac
	call Func_4cb15
	ret

Unused_4c0bb: ; 400bb
	db $39, $A1, $43, $37, $53

PlaySoundEffect_Bank13:
	call Func_4cb1b
	ld hl, wde9b
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SoundEffects_Bank13
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	rlca
	rlca
	and $3
	inc a
.asm_4c0d7
	push af
	call Func_4c042
	ld hl, $0002
	add hl, bc
	set 3, [hl]
	call Func_4cadf
	pop af
	dec a
	jr nz, .asm_4c0d7
	call Func_4cb15
	ret

Unused_4c0ec:
; ???
	db $0E, $07, $00, $37

PlayCry_Bank13:
; Plays a Pokemon cry.
; Input: e = mon id
	call Func_4cb1b
	ld a, e
	or d
	ret z
	ld a, d
	ld [wScratchBuffer], a
	ld a, e
	ld [wScratchBuffer + 1], a
	callba LoadCryData
	ld hl, wScratchBuffer
	ld e, [hl]
	inc hl
	ld d, [hl]  ; de = base cry id
	inc hl
	ld a, [hli]
	ld [wdea8], a
	ld a, [hli]
	ld [wdea9], a  ; dea8 = cry pitch
	ld a, [hli]
	ld [wdeaa], a
	ld a, [hl]
	ld [wdeab], a  ; deaa = cry length
	ld hl, wde9b
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, CryBasePointers_Bank13
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	rlca
	rlca
	and $3
	inc a
.asm_4c12a
	push af
	call Func_4c042
	ld hl, $0002
	add hl, bc
	set 5, [hl]
	ld hl, $0003
	add hl, bc
	set 4, [hl]
	ld hl, $0026
	add hl, bc
	ld a, [wdea8]
	ld [hli], a
	ld a, [wdea9]
	ld [hl], a
	ld a, [wde97]
	and $3
	cp $3
	jr nc, .asm_4c15b
	ld hl, $0017
	add hl, bc
	ld a, [wdeaa]
	ld [hli], a
	ld a, [wdeab]
	ld [hl], a
.asm_4c15b
	call Func_4cadf
	pop af
	dec a
	jr nz, .asm_4c12a
	ld a, [wdeac]
	and a
	jr nz, .asm_4c173
	ld a, [wde98]
	ld [wdeac], a
	ld a, $77
	ld [wde98], a
.asm_4c173
	ld a, $1
	ld [wdead], a
	call Func_4cb15
	ret

Unused_4c17c; ; 0x4017c
; ???
	db $C1, $41, $52, $00

Func_4c180:
	ld a, [wdd00]
	and a
	ret z
	xor a
	ld [wde97], a
	ld [wde99], a
	ld bc, wChannel0
.asm_4c18f
	ld hl, $0002
	add hl, bc
	bit 0, [hl]
	jp z, .asm_4c22d
	ld hl, $0014
	add hl, bc
	ld a, [hl]
	cp $2
	jr c, .asm_4c1a4
	dec [hl]
	jr .asm_4c1c1

.asm_4c1a4
	ld hl, $001c
	add hl, bc
	ld a, [hl]
	ld hl, $001b
	add hl, bc
	ld [hl], a
	ld hl, $0025
	add hl, bc
	ld a, [hl]
	ld hl, $0024
	add hl, bc
	ld [hl], a
	ld hl, $0003
	add hl, bc
	res 1, [hl]
	call Func_4c670
.asm_4c1c1
	ld hl, $000d
	add hl, bc
	ld a, [hli]
	ld [wde91], a
	ld a, [hli]
	ld [wde92], a
	ld a, [hli]
	ld [wde93], a
	ld a, [hl]
	ld [wde94], a
	call Func_4c4f0
	call Func_4c632
	ld a, [wdead]
	and a
	jr z, .asm_4c20a
	ld a, [wde97]
	cp $4
	jr nc, .asm_4c219
	ld hl, wChannel4 + 2
	bit 0, [hl]
	jr nz, .asm_4c204
	ld hl, wChannel5 + 2
	bit 0, [hl]
	jr nz, .asm_4c204
	ld hl, wChannel6 + 2
	bit 0, [hl]
	jr nz, .asm_4c204
	ld hl, wChannel7 + 2
	bit 0, [hl]
	jr z, .asm_4c20a
.asm_4c204
	ld hl, $000b
	add hl, bc
	set 5, [hl]
.asm_4c20a
	ld a, [wde97]
	cp $4
	jr nc, .asm_4c219
	ld hl, $00ca
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_4c227
.asm_4c219
	call Func_4c24d
	ld hl, $0019
	add hl, bc
	ld a, [wde99]
	or [hl]
	ld [wde99], a
.asm_4c227
	ld hl, $000b
	add hl, bc
	xor a
	ld [hl], a
.asm_4c22d
	ld hl, $0032
	add hl, bc
	ld c, l
	ld b, h
	ld a, [wde97]
	inc a
	ld [wde97], a
	cp $8
	jp nz, .asm_4c18f
	call Func_4c40d
	ld a, [wde98]
	ld [rNR50], a
	ld a, [wde99]
	ld [rNR51], a
	ret

Func_4c24d:
	ld hl, PointerTable_4c25e
	ld a, [wde97]
	and $7
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

PointerTable_4c25e:
	dw Func_4c26e
	dw Func_4c2e0
	dw Func_4c349
	dw Func_4c3cf
	dw Func_4c26e
	dw Func_4c2e0
	dw Func_4c349
	dw Func_4c3cf

Func_4c26e:
	ld hl, $000b
	add hl, bc
	bit 3, [hl]
	jr z, .asm_4c27b
	ld a, [wde9a]
	ld [rNR10], a
.asm_4c27b
	bit 5, [hl]
	jr nz, .asm_4c2ba
	bit 4, [hl]
	jr nz, .asm_4c2c6
	bit 6, [hl]
	jr nz, .asm_4c2b4
	bit 1, [hl]
	jr z, .asm_4c295
	ld a, [wde93]
	ld [rNR13], a
	ld a, [wde94]
	ld [rNR14], a
.asm_4c295
	bit 2, [hl]
	jr z, .asm_4c2a5
	ld a, [wde92]
	ld [rNR12], a
	ld a, [wde94]
	or $80
	ld [rNR14], a
.asm_4c2a5
	bit 0, [hl]
	ret z
	ld a, [wde91]
	ld d, a
	ld a, [rNR11]
	and $3f
	or d
	ld [rNR11], a
	ret

.asm_4c2b4
	ld a, [wde93]
	ld [rNR13], a
	ret

.asm_4c2ba
	ld a, $8
	ld [rNR12], a
	ld a, [wde94]
	or $80
	ld [rNR14], a
	ret

.asm_4c2c6
	ld hl, wde91
	ld a, $3f
	or [hl]
	ld [rNR11], a
	ld a, [wde92]
	ld [rNR12], a
	ld a, [wde93]
	ld [rNR13], a
	ld a, [wde94]
	or $80
	ld [rNR14], a
	ret

Func_4c2e0:
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_4c323
	bit 4, [hl]
	jr nz, .asm_4c32f
	bit 6, [hl]
	jr nz, .asm_4c31d
	bit 1, [hl]
	jr z, .asm_4c2fe
	ld a, [wde93]
	ld [rNR23], a
	ld a, [wde94]
	ld [rNR24], a
.asm_4c2fe
	bit 2, [hl]
	jr z, .asm_4c30e
	ld a, [wde92]
	ld [rNR22], a
	ld a, [wde94]
	or $80
	ld [rNR24], a
.asm_4c30e
	bit 0, [hl]
	ret z
	ld a, [wde91]
	ld d, a
	ld a, [rNR21]
	and $3f
	or d
	ld [rNR21], a
	ret

.asm_4c31d
	ld a, [wde93]
	ld [rNR23], a
	ret

.asm_4c323
	ld a, $8
	ld [rNR22], a
	ld a, [wde94]
	or $80
	ld [rNR24], a
	ret

.asm_4c32f
	ld hl, wde91
	ld a, $3f
	or [hl]
	ld [rNR21], a
	ld a, [wde92]
	ld [rNR22], a
	ld a, [wde93]
	ld [rNR23], a
	ld a, [wde94]
	or $80
	ld [rNR24], a
	ret

Func_4c349:
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_4c387
	bit 4, [hl]
	jr nz, .asm_4c38b
	bit 6, [hl]
	jr nz, .asm_4c381
	bit 1, [hl]
	jr z, .asm_4c367
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	ld [rNR34], a
.asm_4c367
	bit 2, [hl]
	ret z
	xor a
	ld [rNR30], a
	call LoadWavePattern_Bank13
	ld a, $80
	ld [rNR30], a
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	or $80
	ld [rNR34], a
	ret

.asm_4c381
	ld a, [wde93]
	ld [rNR33], a
	ret

.asm_4c387
	xor a
	ld [rNR30], a
	ret

.asm_4c38b
	ld a, $3f
	ld [rNR31], a
	xor a
	ld [rNR30], a
	call LoadWavePattern_Bank13
	ld a, $80
	ld [rNR30], a
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	or $80
	ld [rNR34], a
	ret

LoadWavePattern_Bank13:
	push hl
	ld a, [wde92]
	and $f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, WavePatterns_Bank13
	add hl, de
	ld de, rWave_0
	push bc
	ld b, $10
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	pop bc
	pop hl
	ld a, [wde92]
	and $f0
	sla a
	ld [rNR32], a  ; set volume of wave channel
	ret

Func_4c3cf:
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_4c3f1
	bit 4, [hl]
	jr nz, .asm_4c3fa
	bit 1, [hl]
	jr z, .asm_4c3e4
	ld a, [wde93]
	ld [rNR43], a
.asm_4c3e4
	bit 2, [hl]
	ret z
	ld a, [wde92]
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

.asm_4c3f1
	ld a, $8
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

.asm_4c3fa
	ld a, $3f
	ld [rNR41], a
	ld a, [wde92]
	ld [rNR42], a
	ld a, [wde93]
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	ret

Func_4c40d:
	ld a, [wdea2]
	and a
	ret z
	ld a, [wdea3]
	and a
	jr z, .asm_4c41d
	dec a
	ld [wdea3], a
	ret

.asm_4c41d
	ld a, [wdea2]
	ld d, a
	and $7f
	ld [wdea3], a
	ld a, [wde98]
	and $7
	bit 7, d
	jr nz, .asm_4c448
	and a
	jr z, .asm_4c435
	dec a
	jr .asm_4c454

.asm_4c435
	ld a, [wdea4]
	ld e, a
	ld a, [wdea5]
	ld d, a
	push bc
	call PlaySong_Bank13
	pop bc
	ld hl, wdea2
	set 7, [hl]
	ret

.asm_4c448
	cp $7
	jr nc, .asm_4c44f
	inc a
	jr .asm_4c454

.asm_4c44f
	xor a
	ld [wdea2], a
	ret

.asm_4c454
	ld d, a
	swap a
	or d
	ld [wde98], a
	ret

Func_4c45c:
	ld hl, $0003
	add hl, bc
	bit 1, [hl]
	ret z
	ld hl, $0014
	add hl, bc
	ld a, [hl]
	ld hl, wde95
	sub [hl]
	jr nc, .asm_4c470
	ld a, $1
.asm_4c470
	ld [hl], a
	ld hl, $000f
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $001f
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	ld hl, $0020
	add hl, bc
	sub [hl]
	jr nc, .asm_4c4ab
	ld hl, $0004
	add hl, bc
	set 1, [hl]
	ld hl, $000f
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $001f
	add hl, bc
	ld a, [hl]
	sub e
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	ld hl, $0020
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	jr .asm_4c4c9

.asm_4c4ab
	ld hl, $0004
	add hl, bc
	res 1, [hl]
	ld hl, $000f
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $001f
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	ld hl, $0020
	add hl, bc
	sub [hl]
	ld d, a
.asm_4c4c9
	push bc
	ld hl, wde95
	ld b, $0
.asm_4c4cf
	inc b
	ld a, e
	sub [hl]
	ld e, a
	jr nc, .asm_4c4cf
	ld a, d
	and a
	jr z, .asm_4c4dc
	dec d
	jr .asm_4c4cf

.asm_4c4dc
	ld a, e
	add [hl]
	ld d, b
	pop bc
	ld hl, $0021
	add hl, bc
	ld [hl], d
	ld hl, $0022
	add hl, bc
	ld [hl], a
	ld hl, $0023
	add hl, bc
	xor a
	ld [hl], a

	; fall through

Func_4c4f0:
	ld hl, $0003
	add hl, bc
	bit 2, [hl]
	jr z, .asm_4c50b
	ld hl, $001a
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	ld [hl], a
	and $c0
	ld [wde91], a
	ld hl, $000b
	add hl, bc
	set 0, [hl]
.asm_4c50b
	ld hl, $0003
	add hl, bc
	bit 4, [hl]
	jr z, .asm_4c529
	ld hl, $0026
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wde93
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, wde93
	ld [hl], e
	inc hl
	ld [hl], d
.asm_4c529
	ld hl, $0003
	add hl, bc
	bit 1, [hl]
	jp z, .asm_4c5c1
	ld hl, $000f
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0004
	add hl, bc
	bit 1, [hl]
	jr z, .asm_4c574
	ld hl, $0021
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, de
	ld d, h
	ld e, l
	ld hl, $0022
	add hl, bc
	ld a, [hl]
	ld hl, $0023
	add hl, bc
	add [hl]
	ld [hl], a
	ld a, $0
	adc e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld hl, $0020
	add hl, bc
	ld a, [hl]
	cp d
	jp c, .asm_4c5a1
	jr nz, .asm_4c5b4
	ld hl, $001f
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .asm_4c5a1
	jr .asm_4c5b4

.asm_4c574
	ld a, e
	ld hl, $0021
	add hl, bc
	ld e, [hl]
	sub e
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	ld hl, $0022
	add hl, bc
	ld a, [hl]
	add a
	ld [hl], a
	ld a, e
	sbc $0
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	ld hl, $0020
	add hl, bc
	ld a, d
	cp [hl]
	jr c, .asm_4c5a1
	jr nz, .asm_4c5b4
	ld hl, $001f
	add hl, bc
	ld a, e
	cp [hl]
	jr nc, .asm_4c5b4
.asm_4c5a1
	ld hl, $0003
	add hl, bc
	res 1, [hl]
	ld hl, $0004
	add hl, bc
	res 1, [hl]
	ld hl, $0020
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
.asm_4c5b4
	ld hl, $000f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $000b
	add hl, bc
	set 1, [hl]
.asm_4c5c1
	ld hl, $0003
	add hl, bc
	bit 0, [hl]
	jr z, .asm_4c61a
	ld hl, $001b
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_4c5e3
	ld hl, $001d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4c61a
	ld d, a
	ld hl, $001e
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .asm_4c5e6
.asm_4c5e3
	dec [hl]
	jr .asm_4c61a

.asm_4c5e6
	ld a, [hl]
	swap [hl]
	or [hl]
	ld [hl], a
	ld a, [wde93]
	ld e, a
	ld hl, $0004
	add hl, bc
	bit 0, [hl]
	jr z, .asm_4c605
	res 0, [hl]
	ld a, d
	and $f
	ld d, a
	ld a, e
	sub d
	jr nc, .asm_4c611
	ld a, $0
	jr .asm_4c611

.asm_4c605
	set 0, [hl]
	ld a, d
	and $f0
	swap a
	add e
	jr nc, .asm_4c611
	ld a, $ff
.asm_4c611
	ld [wde93], a
	ld hl, $000b
	add hl, bc
	set 6, [hl]
.asm_4c61a
	ld hl, $0003
	add hl, bc
	bit 3, [hl]
	ret z
	ld hl, $0024
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4c62b
	dec [hl]
	ret

.asm_4c62b
	ld hl, $000b
	add hl, bc
	set 5, [hl]
	ret

Func_4c632:
	ld hl, $0002
	add hl, bc
	bit 4, [hl]
	ret z
	ld a, [wde9f]
	and a
	jr z, .asm_4c644
	dec a
	ld [wde9f], a
	ret

.asm_4c644
	ld hl, wde9d
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	inc de
	cp $ff
	ret z
	and $f
	inc a
	ld [wde9f], a
	ld a, [de]
	inc de
	ld [wde92], a
	ld a, [de]
	inc de
	ld [wde93], a
	xor a
	ld [wde94], a
	ld hl, wde9d
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $000b
	add hl, bc
	set 4, [hl]
	ret

Func_4c670:
	call Func_4ca10
	cp $ff
	jr z, .asm_4c6c9
	cp $d0
	jr c, .asm_4c680
.asm_4c67b
	call Func_4c786
	jr Func_4c670

.asm_4c680
	ld hl, $0002
	add hl, bc
	bit 3, [hl]
	jp nz, Func_4c723
	bit 5, [hl]
	jp nz, Func_4c723
	bit 4, [hl]
	jp nz, Func_4c750
	ld a, [wde96]
	and $f
	call Func_4ca5b
	ld a, [wde96]
	swap a
	and $f
	jr z, .asm_4c6c2
	ld hl, $0011
	add hl, bc
	ld [hl], a
	ld e, a
	ld hl, $0012
	add hl, bc
	ld d, [hl]
	call Func_4ca2b
	ld hl, $000f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $000b
	add hl, bc
	set 4, [hl]
	jp Func_4c45c

.asm_4c6c2
	ld hl, $000b
	add hl, bc
	set 5, [hl]
	ret

.asm_4c6c9
	ld hl, $0002
	add hl, bc
	bit 1, [hl]
	jr nz, .asm_4c67b
	ld a, [wde97]
	cp $4
	jr nc, .asm_4c6e0
	ld hl, $00ca
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_4c6f6
.asm_4c6e0
	ld hl, $0002
	add hl, bc
	bit 5, [hl]
	call nz, Func_4c704
	ld a, [wde97]
	cp $4
	jr nz, .asm_4c6f6
	xor a
	ld [rNR10], a
	ld [wde9a], a
.asm_4c6f6
	ld hl, $0002
	add hl, bc
	res 0, [hl]
	ld hl, $0000
	add hl, bc
	xor a
	ld [hli], a
	ld [hli], a
	ret

Func_4c704:
	ld a, [wde97]
	cp $4
	ret nz
	xor a
	ld hl, wChannel5 + $26
	ld [hli], a
	ld [hl], a
	ld hl, wChannel7 + $26
	ld [hli], a
	ld [hl], a
	ld a, [wdeac]
	ld [wde98], a
	xor a
	ld [wdeac], a
	ld [wdead], a
	ret

Func_4c723:
	ld hl, $000b
	add hl, bc
	set 4, [hl]
	ld a, [wde96]
	call Func_4ca5b
	call Func_4ca10
	ld hl, $000e
	add hl, bc
	ld [hl], a
	call Func_4ca10
	ld hl, $000f
	add hl, bc
	ld [hl], a
	ld a, [wde97]
	and $3
	cp $3
	ret z
	call Func_4ca10
	ld hl, $0010
	add hl, bc
	ld [hl], a
	ret

Func_4c750:
	ld a, [wde97]
	cp $3
	ret nz
	ld a, [wde96]
	and $f
	call Func_4ca5b
	ld a, [wdea1]
	ld e, a
	ld d, $0
	ld hl, Data_4cba2
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wde96]
	swap a
	and $f
	ret z
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld [wde9d], a
	ld a, [hl]
	ld [wde9e], a
	xor a
	ld [wde9f], a
	ret

Func_4c786:
	ld a, [wde96]
	sub $d0
	ld e, a
	ld d, $0
	ld hl, PointerTable_4c797
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

PointerTable_4c797:
	dw Func_4c9b6
	dw Func_4c9b6
	dw Func_4c9b6
	dw Func_4c9b6
	dw Func_4c9b6
	dw Func_4c9b6
	dw Func_4c9b6
	dw Func_4c9b6
	dw Func_4c973
	dw Func_4c9c1
	dw Func_4c9aa
	dw Func_4c994
	dw Func_4c9a1
	dw Func_4c987
	dw Func_4c939
	dw Func_4c951
	dw Func_4c8ff
	dw Func_4c8c4
	dw Func_4c8b5
	dw Func_4c95f
	dw Func_4c9ca
	dw Func_4c9da
	dw Func_4c926
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c9e9
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4ca05
	dw Func_4ca0b
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c7f7
	dw Func_4c885
	dw Func_4c88e
	dw Func_4c833
	dw Func_4c843
	dw Func_4c80d
	dw Func_4c7f8

Func_4c7f7:
	ret

Func_4c7f8:
	ld hl, $0002
	add hl, bc
	res 1, [hl]
	ld hl, $0007
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_4c80d:
	call Func_4ca10
	ld e, a
	call Func_4ca10
	ld d, a
	push de
	ld hl, $0005
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0007
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $0002
	add hl, bc
	set 1, [hl]
	ret

Func_4c833:
	call Func_4ca10
	ld e, a
	call Func_4ca10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_4c843:
	call Func_4ca10
	ld hl, $0002
	add hl, bc
	bit 2, [hl]
	jr nz, .asm_4c859
	and a
	jr z, .asm_4c862
	dec a
	set 2, [hl]
	ld hl, $0016
	add hl, bc
	ld [hl], a
.asm_4c859
	ld hl, $0016
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4c872
	dec [hl]
.asm_4c862
	call Func_4ca10
	ld e, a
	call Func_4ca10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.asm_4c872
	ld hl, $0002
	add hl, bc
	res 2, [hl]
	ld hl, $0005
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

Func_4c885:
	call Func_4ca10
	ld hl, $000c
	add hl, bc
	ld [hl], a
	ret

Func_4c88e:
	call Func_4ca10
	ld hl, $000c
	add hl, bc
	cp [hl]
	jr z, .asm_4c8a5
	ld hl, $0005
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret

.asm_4c8a5
	call Func_4ca10
	ld e, a
	call Func_4ca10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_4c8b5:
	call Func_4ca10
	ld hl, $0025
	add hl, bc
	ld [hl], a
	ld hl, $0003
	add hl, bc
	set 3, [hl]
	ret

Func_4c8c4:
	ld hl, $0003
	add hl, bc
	set 0, [hl]
	ld hl, $0004
	add hl, bc
	res 0, [hl]
	call Func_4ca10
	ld hl, $001c
	add hl, bc
	ld [hl], a
	ld hl, $001b
	add hl, bc
	ld [hl], a
	call Func_4ca10
	ld hl, $001d
	add hl, bc
	ld d, a
	and $f0
	swap a
	srl a
	ld e, a
	adc $0
	swap a
	or e
	ld [hl], a
	ld hl, $001e
	add hl, bc
	ld a, d
	and $f
	ld d, a
	swap a
	or d
	ld [hl], a
	ret

Func_4c8ff:
	call Func_4ca10
	ld [wde95], a
	call Func_4ca10
	ld d, a
	and $f
	ld e, a
	ld a, d
	swap a
	and $f
	ld d, a
	call Func_4ca2b
	ld hl, $001f
	add hl, bc
	ld [hl], e
	ld hl, $0020
	add hl, bc
	ld [hl], d
	ld hl, $0003
	add hl, bc
	set 1, [hl]
	ret

Func_4c926:
	ld hl, $0003
	add hl, bc
	set 4, [hl]
	ld hl, $0027
	add hl, bc
	call Func_4ca10
	ld [hld], a
	call Func_4ca10
	ld [hl], a
	ret

Func_4c939:
	ld hl, $0003
	add hl, bc
	set 2, [hl]
	call Func_4ca10
	rrca
	rrca
	ld hl, $001a
	add hl, bc
	ld [hl], a
	and $c0
	ld hl, $000d
	add hl, bc
	ld [hl], a
	ret

Func_4c951:
	ld hl, $0002
	add hl, bc
	bit 3, [hl]
	jr z, .asm_4c95c
	res 3, [hl]
	ret

.asm_4c95c
	set 3, [hl]
	ret

Func_4c95f:
	ld hl, $0002
	add hl, bc
	bit 4, [hl]
	jr z, .asm_4c96a
	res 4, [hl]
	ret

.asm_4c96a
	set 4, [hl]
	call Func_4ca10
	ld [wdea1], a
	ret

Func_4c973:
	call Func_4ca10
	ld hl, $0028
	add hl, bc
	ld [hl], a
	ld a, [wde97]
	and $3
	cp $3
	ret z
	call Func_4c9a1
	ret

Func_4c987:
	call Func_4ca10
	ld [wde9a], a
	ld hl, $000b
	add hl, bc
	set 3, [hl]
	ret

Func_4c994:
	call Func_4ca10
	rrca
	rrca
	and $c0
	ld hl, $000d
	add hl, bc
	ld [hl], a
	ret

Func_4c9a1:
	call Func_4ca10
	ld hl, $000e
	add hl, bc
	ld [hl], a
	ret

Func_4c9aa:
	call Func_4ca10
	ld d, a
	call Func_4ca10
	ld e, a
	call Func_4ca95
	ret

Func_4c9b6:
	ld hl, $0012
	add hl, bc
	ld a, [wde96]
	and $7
	ld [hl], a
	ret

Func_4c9c1:
	call Func_4ca10
	ld hl, $0013
	add hl, bc
	ld [hl], a
	ret

Func_4c9ca:
	ld a, [wde97]
	call Func_4caf4
	call Func_4ca10
	ld hl, $0019
	add hl, bc
	and [hl]
	ld [hl], a
	ret

Func_4c9da:
	call Func_4ca10
	ld a, [wdea2]
	and a
	ret nz
	ld a, [wde96]
	ld [wde98], a
	ret

Func_4c9e9:
	call Func_4ca10
	; cast to s16
	ld e, a
	cp $80
	jr nc, .asm_4c9f5
	ld d, $0
	jr .asm_4c9f7

.asm_4c9f5
	ld d, $ff
.asm_4c9f7
	ld hl, $0017
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call Func_4ca95
	ret

Func_4ca05:
	ld a, $1
	ld [wdead], a
	ret

Func_4ca0b:
	xor a
	ld [wdead], a
	ret

Func_4ca10:
	push hl
	push de
	ld hl, $0005
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld [wde96], a
	inc de
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	pop de
	pop hl
	ld a, [wde96]
	ret

Func_4ca2b:
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	add d
	push af
	ld hl, $0013
	add hl, bc
	ld a, [hl]
	and $f
	ld l, a
	ld d, $0
	ld h, d
	add hl, de
	add hl, hl
	ld de, Data_4cb20 
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop af
.asm_4ca4b
	cp $7
	jr nc, .asm_4ca56
	sra d
	rr e
	inc a
	jr .asm_4ca4b

.asm_4ca56
	ld a, d
	and $7
	ld d, a
	ret

Func_4ca5b:
	inc a
	ld e, a
	ld d, $0
	ld hl, $0028
	add hl, bc
	ld a, [hl]
	ld l, $0
	call Func_4ca86
	ld a, l
	ld hl, $0017
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0015
	add hl, bc
	ld l, [hl]
	call Func_4ca86
	ld e, l
	ld d, h
	ld hl, $0015
	add hl, bc
	ld [hl], e
	ld hl, $0014
	add hl, bc
	ld [hl], d
	ret

Func_4ca86:
	ld h, $0
.asm_4ca88
	srl a
	jr nc, .asm_4ca8d
	add hl, de
.asm_4ca8d
	sla e
	rl d
	and a
	jr nz, .asm_4ca88
	ret

Func_4ca95:
	push bc
	ld a, [wde97]
	cp $4
	jr nc, .asm_4cab7
	ld bc, wChannel0
	call Func_4cad1
	ld bc, wChannel1
	call Func_4cad1
	ld bc, wChannel2
	call Func_4cad1
	ld bc, wChannel3
	call Func_4cad1
	jr .asm_4cacf

.asm_4cab7
	ld bc, wChannel4
	call Func_4cad1
	ld bc, wChannel5
	call Func_4cad1
	ld bc, wChannel6
	call Func_4cad1
	ld bc, wChannel7
	call Func_4cad1
.asm_4cacf
	pop bc
	ret

Func_4cad1:
	ld hl, $0017
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	xor a
	ld hl, $0015
	add hl, bc
	ld [hl], a
	ret

Func_4cadf:
	call Func_4cb06
	ld a, [wdeae]
	jr .asm_4caea

	ld a, [wde97]
.asm_4caea
	call Func_4caf4
	ld hl, $0002
	add hl, bc
	set 0, [hl]
	ret

Func_4caf4:
	push de
	and $3
	ld e, a
	ld d, $0
	ld hl, Data_4cc8e
	add hl, de
	ld a, [hl]
	ld hl, $0019
	add hl, bc
	ld [hl], a
	pop de
	ret

Func_4cb06:
	ld a, [wdeae]
	and $3
	cp $0
	ret nz
	xor a
	ld [rNR10], a
	ld [wde9a], a
	ret

Func_4cb15:
	ld a, $1
	ld [wdd00], a
	ret

Func_4cb1b:
	xor a
	ld [wdd00], a
	ret

Data_4cb20:
	dw $0000
	dw $f82c
	dw $f89d
	dw $f907
	dw $f96b
	dw $f9ca
	dw $fa23
	dw $fa77
	dw $fac7
	dw $fb12
	dw $fb58
	dw $fb9b
	dw $fbda
	dw $fc16
	dw $fc4e
	dw $fc83
	dw $fcb5
	dw $fce5
	dw $fd11
	dw $fd3b
	dw $fd63
	dw $fd89
	dw $fdac
	dw $fdcd
	dw $fded

WavePatterns_Bank13:
WavePattern0_Bank13:
	db $02, $46, $8A, $CE, $FF, $FE, $ED, $DC, $CB, $A9, $87, $65, $44, $33, $22, $11
WavePattern1_Bank13:
	db $02, $46, $8A, $CE, $EF, $FF, $FE, $EE, $DD, $CB, $A9, $87, $65, $43, $22, $11
WavePattern2_Bank13:
	db $01, $23, $43, $21, $FE, $CA, $8A, $CE, $01, $23, $43, $21, $FE, $CA, $8A, $CE
WavePattern3_Bank13:
	db $00, $11, $22, $33, $44, $33, $22, $11, $FF, $EE, $CC, $AA, $88, $AA, $CC, $EE
WavePattern4_Bank13:
	db $00, $11, $22, $33, $44, $33, $22, $11, $FF, $EE, $CC, $AA, $88, $AA, $CC, $EE

Data_4cba2:
; related to percussion instruments
	dw Data_4cbae
	dw Data_4cbce
	dw Data_4cbee
	dw Data_4cbee
	dw Data_4cbee
	dw Data_4cbee

Data_4cbae:
	dw Data_4cc12
	dw Data_4cc13
	dw Data_4cc17
	dw Data_4cc1b
	dw Data_4cc1f
	dw Data_4cc26
	dw Data_4cc0e
	dw Data_4cc31
	dw Data_4cc35
	dw Data_4cc3c
	dw Data_4cc43
	dw Data_4cc47
	dw Data_4cc64
	dw Data_4cc12
	dw Data_4cc12
	dw Data_4cc12

Data_4cbce:
	dw Data_4cc12
	dw Data_4cc0e
	dw Data_4cc17
	dw Data_4cc1b
	dw Data_4cc1f
	dw Data_4cc60
	dw Data_4cc2d
	dw Data_4cc68
	dw Data_4cc52
	dw Data_4cc59
	dw Data_4cc87
	dw Data_4cc47
	dw Data_4cc4b
	dw Data_4cc12
	dw Data_4cc12
	dw Data_4cc12

Data_4cbee:
	dw Data_4cc12
	dw Data_4cc43
	dw Data_4cc47
	dw Data_4cc1b
	dw Data_4cc1f
	dw Data_4cc6f
	dw Data_4cc73
	dw Data_4cc77
	dw Data_4cc35
	dw Data_4cc3c
	dw Data_4cc7b
	dw Data_4cc7f
	dw Data_4cc83
	dw Data_4cc12
	dw Data_4cc12
	dw Data_4cc12

Data_4cc0e:
	db $20, $11, $11
	db $FF ; terminator

Data_4cc12:
	db $FF ; terminator

Data_4cc13:
	db $20, $91, $33
	db $FF ; terminator

Data_4cc17:
	db $20, $51, $32
	db $FF ; terminator

Data_4cc1b:
	db $20, $81, $31
	db $FF ; terminator

Data_4cc1f:
	db $21, $71, $70, $20, $11, $11
	db $FF ; terminator

Data_4cc26:
	db $30, $82, $4C, $22, $61, $20
	db $FF ; terminator

Data_4cc2d:
	db $30, $91, $18
	db $FF ; terminator

Data_4cc31:
	db $27, $92, $10
	db $FF ; terminator

Data_4cc35:
	db $33, $91, $00, $33, $11, $00
	db $FF ; terminator

Data_4cc3c:
	db $33, $91, $11, $33, $11, $00
	db $FF ; terminator

Data_4cc43:
	db $01, $18, $01
	db $FF ; terminator

Data_4cc47:
	db $01, $28, $01
	db $FF ; terminator

Data_4cc4b:
	db $33, $88, $15, $20, $65, $12
	db $FF ; terminator

Data_4cc52:
	db $33, $51, $21, $33, $11, $11
	db $FF ; terminator

Data_4cc59:
	db $33, $51, $50, $33, $11, $11
	db $FF ; terminator

Data_4cc60:
	db $20, $A1, $31
	db $FF ; terminator

Data_4cc64:
	db $20, $84, $12
	db $FF ; terminator

Data_4cc68:
	db $33, $81, $00, $33, $11, $00
	db $FF ; terminator

Data_4cc6f:
	db $01, $38, $01
	db $FF ; terminator

Data_4cc73:
	db $01, $48, $01
	db $FF ; terminator

Data_4cc77:
	db $01, $58, $01
	db $FF ; terminator

Data_4cc7b:
	db $01, $68, $01
	db $FF ; terminator

Data_4cc7f:
	db $01, $78, $01
	db $FF ; terminator

Data_4cc83:
	db $01, $88, $01
	db $FF ; terminator

Data_4cc87:
	db $33, $81, $21, $33, $11, $11
	db $FF ; terminator

Data_4cc8e:
	db $11, $22, $44, $88

ChannelPointers_Bank13:
	dw wChannel0
	dw wChannel1
	dw wChannel2
	dw wChannel3
	dw wChannel4
	dw wChannel5
	dw wChannel6
	dw wChannel7

SongHeaderPointers_Bank13: ; 0x4cca2
	dw Music_Nothing13
	dw Music_EndCredits
	dw Music_NameEntry

INCLUDE "audio/music/nothing13.asm"
INCLUDE "audio/music/endcredits.asm"
INCLUDE "audio/music/nameentry.asm"

SoundEffects_Bank13:
	dw SoundEffect0_Bank13
	dw SoundEffect1_Bank13
	dw SoundEffect2_Bank13
	dw SoundEffect3_Bank13
	dw SoundEffect4_Bank13
	dw SoundEffect5_Bank13
	dw SoundEffect6_Bank13
	dw SoundEffect7_Bank13
	dw SoundEffect8_Bank13
	dw SoundEffect9_Bank13
	dw SoundEffect10_Bank13
	dw SoundEffect11_Bank13
	dw SoundEffect12_Bank13
	dw SoundEffect13_Bank13
	dw SoundEffect14_Bank13
	dw SoundEffect15_Bank13
	dw SoundEffect16_Bank13
	dw SoundEffect17_Bank13
	dw SoundEffect18_Bank13
	dw SoundEffect19_Bank13
	dw SoundEffect20_Bank13
	dw SoundEffect21_Bank13
	dw SoundEffect22_Bank13
	dw SoundEffect23_Bank13
	dw SoundEffect24_Bank13
	dw SoundEffect25_Bank13
	dw SoundEffect26_Bank13
	dw SoundEffect27_Bank13
	dw SoundEffect28_Bank13
	dw SoundEffect29_Bank13
	dw SoundEffect30_Bank13
	dw SoundEffect31_Bank13
	dw SoundEffect32_Bank13
	dw SoundEffect33_Bank13
	dw SoundEffect34_Bank13
	dw SoundEffect35_Bank13
	dw SoundEffect36_Bank13
	dw SoundEffect37_Bank13
	dw SoundEffect38_Bank13
	dw SoundEffect39_Bank13
	dw SoundEffect40_Bank13
	dw SoundEffect41_Bank13
	dw SoundEffect42_Bank13
	dw SoundEffect43_Bank13
	dw SoundEffect44_Bank13
	dw SoundEffect45_Bank13
	dw SoundEffect46_Bank13
	dw SoundEffect47_Bank13
	dw SoundEffect48_Bank13
	dw SoundEffect49_Bank13
	dw SoundEffect50_Bank13
	dw SoundEffect51_Bank13
	dw SoundEffect52_Bank13
	dw SoundEffect53_Bank13
	dw SoundEffect54_Bank13
	dw SoundEffect55_Bank13
	dw SoundEffect56_Bank13
	dw SoundEffect57_Bank13
	dw SoundEffect58_Bank13
	dw SoundEffect59_Bank13
	dw SoundEffect60_Bank13
	dw SoundEffect61_Bank13
	dw SoundEffect62_Bank13
	dw SoundEffect63_Bank13
	dw SoundEffect64_Bank13
	dw SoundEffect65_Bank13
	dw SoundEffect66_Bank13
	dw SoundEffect67_Bank13
	dw SoundEffect68_Bank13
	dw SoundEffect69_Bank13
	dw SoundEffect70_Bank13
	dw SoundEffect71_Bank13
	dw SoundEffect72_Bank13
	dw SoundEffect73_Bank13
	dw SoundEffect74_Bank13
	dw SoundEffect75_Bank13
	dw SoundEffect76_Bank13
	dw SoundEffect77_Bank13

SoundEffect0_Bank13:
	db $04 ; wChannel4
	dw SoundEffect0_Channel4_Bank13

SoundEffect0_Channel4_Bank13:
	dutycycle $02
	soundinput $94
	soundeffect_note $05, $F6, $0B, $1E
	soundinput $95
	soundeffect_note $08, $8B, $0B, $3E
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect1_Bank13:
	db $04 ; wChannel4
	dw SoundEffect1_Channel4_Bank13

SoundEffect1_Channel4_Bank13:
	dutycycle $02
	soundinput $14
	soundeffect_note $04, $F2, $00, $06
	soundeffect_note $04, $F2, $00, $06
	soundinput $17
	soundeffect_note $0F, $F2, $00, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect2_Bank13:
	db $04 ; wChannel4
	dw SoundEffect2_Channel4_Bank13

SoundEffect2_Channel4_Bank13:
	dutycycle $01
	soundinput $17
	soundeffect_note $0F, $D7, $00, $06
	soundeffect_note $0F, $B7, $80, $05
	soundeffect_note $0F, $87, $00, $05
	soundeffect_note $0F, $47, $80, $04
	soundeffect_note $0F, $17, $00, $04
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect3_Bank13:
	db $04 ; wChannel4
	dw SoundEffect3_Channel4_Bank13

SoundEffect3_Channel4_Bank13:
	dutycycle $02
	soundeffect_note $02, $F1, $80, $06
	soundeffect_note $02, $F1, $80, $07
	soundeffect_note $02, $31, $80, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect4_Bank13:
	db $04 ; wChannel4
	dw SoundEffect4_Channel4_Bank13

SoundEffect4_Channel4_Bank13:
	dutycycle $00
	soundinput $35
	soundeffect_note $0c, $C3, $6B, $3B
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect5_Bank13:
	db $04 ; wChannel4
	dw SoundEffect5_Channel4_Bank13

SoundEffect5_Channel4_Bank13:
	dutycycle $02
	soundinput $95
	soundeffect_note $0F, $F2, $00, $04
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect6_Bank13:
	db $04 ; wChannel4
	dw SoundEffect6_Channel4_Bank13

SoundEffect6_Channel4_Bank13:
	dutycycle $00
	soundinput $17
	soundeffect_note $0F, $D2, $00, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect7_Bank13:
	db $04 ; wChannel4
	dw SoundEffect7_Channel4_Bank13

SoundEffect7_Channel4_Bank13:
	dutycycle $02
	soundinput $9A
	soundeffect_note $04, $F3, $0B, $3E
	soundinput $9D
	soundeffect_note $03, $C2, $2C, $3F
	soundeffect_note $06, $E1, $A2, $1D
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect8_Bank13:
	db $04 ; wChannel4
	dw SoundEffect8_Channel4_Bank13

SoundEffect8_Channel4_Bank13:
	dutycycle $02
	soundinput $88
	soundeffect_note $01, $D2, $62, $07
	soundeffect_note $08, $52, $62, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect9_Bank13:
	db $04 ; wChannel4
	dw SoundEffect9_Channel4_Bank13

SoundEffect9_Channel4_Bank13:
	dutycycle $02
	soundeffect_note $02, $F1, $80, $07
	soundeffect_note $04, $F1, $61, $07
	soundeffect_note $02, $41, $61, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect10_Bank13:
	db $04 ; wChannel4
	dw SoundEffect10_Channel4_Bank13

SoundEffect10_Channel4_Bank13:
	dutycycle $02
	soundinput $2F
	soundeffect_note $0F, $E2, $80, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect11_Bank13:
	db $4 | (($2 - 1) << 6) ; wChannel4
	dw SoundEffect11_Channel4_Bank13
	db $07 ; wChannel7
	dw SoundEffect11_Channel7_Bank13

SoundEffect11_Channel4_Bank13:
	dutycycle $02
	soundinput $16
	soundeffect_note $01, $F1, $27, $06
	soundeffect_note $00, $71, $27, $06
	soundeffect_note $0F, $F2, $00, $04
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect11_Channel7_Bank13:
	soundeffect_percussion $01, $7B, $37
	soundeffect_percussion $00, $00, $00
	soundeffect_percussion $0F, $82, $10
	soundeffect_percussion $01, $00, $00
	db $FF

SoundEffect12_Bank13:
	db $07 ; wChannel7
	dw SoundEffect12_Channel7_Bank13

SoundEffect12_Channel7_Bank13:
	soundeffect_percussion $01, $F8, $12
	soundeffect_percussion $05, $A1, $20
	soundeffect_percussion $01, $00, $00
	db $FF

SoundEffect13_Bank13:
	db $04 ; wChannel4
	dw SoundEffect13_Channel4_Bank13

SoundEffect13_Channel4_Bank13:
	dutycycle $02
	soundeffect_note $01, $F2, $A0, $06
	soundeffect_note $01, $F2, $E0, $06
	soundeffect_note $08, $F1, $00, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect14_Bank13:
	db $04 ; wChannel4
	dw SoundEffect14_Channel4_Bank13

SoundEffect14_Channel4_Bank13:
	dutycycle $02
	soundeffect_note $04, $E1, $C1, $06
	soundeffect_note $02, $E1, $41, $07
	soundeffect_note $0F, $F1, $81, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect15_Bank13:
	db $04 ; wChannel4
	dw SoundEffect15_Channel4_Bank13

SoundEffect15_Channel4_Bank13:
	dutycycle $01
	soundinput $AF
	soundeffect_note $0F, $F2, $80, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect16_Bank13:
	db $04 ; wChannel4
	dw SoundEffect16_Channel4_Bank13

SoundEffect16_Channel4_Bank13:
	togglesfx
	forceoctave $04
SoundEffect16_Channel4_Loop_Bank13:
	notetype $01, $F8
	soundinput $24
	dutycycle $00
	octave 2
	note C_, 2
	octave 4
	note E_, 1
	intensity $E8
	octave 4
	note G_, 1
	loopchannel $15, SoundEffect16_Channel4_Loop_Bank13
	octave 5
	note G_, 2
	note C_, 1
	db $FF

SoundEffect17_Bank13:
	db $04 ; wChannel4
	dw SoundEffect17_Channel4_Bank13

SoundEffect17_Channel4_Bank13:
	dutycycle $00
	soundeffect_note $00, $B1, $80, $07
	soundeffect_note $08, $81, $B0, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect18_Bank13:
	db $04 ; wChannel4
	dw SoundEffect18_Channel4_Bank13

SoundEffect18_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $27, $06
	soundeffect_note $02, $41, $27, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect19_Bank13:
	db $04 ; wChannel4
	dw SoundEffect19_Channel19_Bank13

SoundEffect19_Channel19_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $72, $06
	soundeffect_note $02, $41, $72, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect20_Bank13:
	db $04 ; wChannel4
	dw SoundEffect20_Channel4_Bank13

SoundEffect20_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $9D, $06
	soundeffect_note $02, $41, $9D, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect21_Bank13:
	db $04 ; wChannel4
	dw SoundEffect21_Channel4_Bank13
	
SoundEffect21_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $C4, $06
	soundeffect_note $02, $41, $C4, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect22_Bank13:
	db $04 ; wChannel4
	dw SoundEffect22_Channel4_Bank13

SoundEffect22_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $D6, $06
	soundeffect_note $02, $41, $D6, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect23_Bank13:
	db $04 ; wChannel4
	dw SoundEffect23_Channel4_Bank13

SoundEffect23_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $F6, $06
	soundeffect_note $02, $41, $F6, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect24_Bank13:
	db $04 ; wChannel4
	dw SoundEffect24_Channel4_Bank13

SoundEffect24_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $13, $07
	soundeffect_note $02, $41, $13, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect25_Bank13:
	db $04 ; wChannel4
	dw SoundEffect25_Channel4_Bank13

SoundEffect25_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $2D, $07
	soundeffect_note $02, $41, $2D, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect26_Bank13:
	db $04 ; wChannel4
	dw SoundEffect26_Channel4_Bank13

SoundEffect26_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $39, $07
	soundeffect_note $02, $41, $39, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect27_Bank13:
	db $04 ; wChannel4
	dw SoundEffect27_Channel4_Bank13

SoundEffect27_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $4E, $07
	soundeffect_note $02, $41, $4E, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect28_Bank13:
	db $04 ; wChannel4
	dw SoundEffect28_Channel4_Bank13

SoundEffect28_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $62, $07
	soundeffect_note $02, $41, $62, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect29_Bank13:
	db $04 ; wChannel4
	dw SoundEffect29_Channel4_Bank13

SoundEffect29_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $6B, $07
	soundeffect_note $02, $41, $6B, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect30_Bank13:
	db $04 ; wChannel4
	dw SoundEffect30_Channel4_Bank13

SoundEffect30_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $7B, $07
	soundeffect_note $02, $41, $7B, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect31_Bank13:
	db $04 ; wChannel4
	dw SoundEffect31_Channel4_Bank13

SoundEffect31_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $89, $07
	soundeffect_note $02, $41, $89, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect32_Bank13:
	db $04 ; wChannel4
	dw SoundEffect32_Channel4_Bank13

SoundEffect32_Channel4_Bank13:
	dutycycle $01
	soundeffect_note $03, $F1, $96, $07
	soundeffect_note $02, $41, $96, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect33_Bank13:
	db $04 ; wChannel4
	dw SoundEffect33_Channel4_Bank13

SoundEffect33_Channel4_Bank13:
	dutycycle $01
	soundinput $94
	soundeffect_note $02, $F8, $27, $06
	dutycycle $02
	soundinput $95
	soundeffect_note $04, $F4, $6A, $05
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect34_Bank13:
	db $04 | (($2 - 1) << 6) ; wChannel4
	dw SoundEffect34_Channel4_Bank13
	db $05
	dw SoundEffect34_Channel5_Bank13

SoundEffect34_Channel4_Bank13:
	togglesfx
	tempo $88
	volume $77
	notetype $0C, $E1
	dutycycle $02
	octave 3
	note B_, 1
	note E_, 1
	octave 4
	note E_, 1
	note G#, 1
	intensity $52
	note G#, 1
	intensity $E1
	note A_, 1
	intensity $52
	note A_, 1
	intensity $E1
	note G#, 1
	intensity $52
	note G#, 1
	db $FF

SoundEffect34_Channel5_Bank13:
	togglesfx
	notetype $06, $B1
	dutycycle $02
	octave 4
	note E_, 2
	note G#, 2
	note B_, 2
	octave 5
	note E_, 2
	intensity $52
	note E_, 2
	intensity $B1
	note F#, 2
	intensity $52
	note F#, 2
	intensity $B1
	note E_, 2
	intensity $52
	note E_, 2
	db $FF

SoundEffect35_Bank13:
	db $04 | (($3 - 1) << 6) ; wChannel4
	dw SoundEffect35_Channel4_Bank13
	db $05 ; wChannel5
	dw SoundEffect35_Channel5_Bank13
	db $06 ; wChannel6
	dw SoundEffect35_Channel6_Bank13

SoundEffect35_Channel4_Bank13:
	togglesfx
	tempo $73
	volume $77
	tone $01
	dutycycle $02
	notetype $06, $56
	octave 5
	note C_, 8
	octave 4
	note B_, 8
	intensity $66
	note A#, 8
	note A_, 8
	intensity $76
	note G_, 10
	note __, 1
	intensity $68
	note G#, 1
	intensity $88
	note A_, 2
	note G_, 2
	vibrato $12, $34
	notetype $0C, $97
	note F#, 12
	db $FF

SoundEffect35_Channel5_Bank13:
	togglesfx
	vibrato $12, $34
	dutycycle $03
	notetype $0C, $B4
	octave 3
	note E_, 1
	intensity $28
	note E_, 1
	callchannel SoundEffect35_Channel5_ch1_Bank13
	intensity $B4
	note A#, 1
	intensity $28
	note A#, 1
	callchannel SoundEffect35_Channel5_ch1_Bank13
	intensity $B8
	note B_, 5
	intensity $28
	note B_, 1
	intensity $B8
	note C_, 1
	octave 3
	note B_, 1
	intensity $B7
	note A_, 12
	db $FF

SoundEffect35_Channel5_ch1_Bank13:
	intensity $B4
	note G_, 1
	intensity $28
	note G_, 1
	intensity $B4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $B4
	note G_, 1
	intensity $28
	note G_, 1
	db $FF

SoundEffect35_Channel6_Bank13:
	togglesfx
	notetype $06, $22
	octave 2
	note C_, 2
	intensity $32
	octave 3
	note C_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C_, 1
	note __, 1
	note C_, 2
	note __, 2
	intensity $22
	octave 1
	note E_, 2
	note G_, 2
	octave 2
	note C#, 2
	intensity $32
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	note C#, 2
	note __, 2
	intensity $22
	octave 1
	note A_, 2
	note G_, 2
	octave 2
	note D_, 2
	intensity $32
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	intensity $22
	octave 2
	note D_, 2
	note E_, 2
	notetype $0C, $22
	note F#, 12
	db $FF

SoundEffect36_Bank13:
	db $04 | (($3 - 1) << 6) ; wChannel4
	dw SoundEffect36_Channel4_Bank13
	db $05 ; wChannel5
	dw SoundEffect36_Channel5_Bank13
	db $06 ; wChannel6
	dw SoundEffect36_Channel6_Bank13

SoundEffect36_Channel4_Bank13:
	togglesfx
	tempo $70
	volume $77
	dutycycle $02
	notetype $08, $81
	note __, 3
SoundEffect36_Channel4_loop_Bank13:
	octave 4
	note F_, 2
	note D_, 2
	intensity $88
	octave 2
	note A#, 1
	note __, 1
	loopchannel $02, SoundEffect36_Channel4_loop_Bank13
	intensity $81
	octave 4
	note E_, 2
	note C_, 2
	intensity $88
	octave 3
	note C_, 1
	note __, 1
	intensity $81
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	intensity $88
	note C_, 1
	note __, 1
	dutycycle $00
	intensity $A8
	octave 2
	note A_, 2
	note __, 4
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note A_, 2
	note __, 2
	db $FF

SoundEffect36_Channel5_Bank13:
	togglesfx
	dutycycle $03
	notetype $08, $A8
	octave 4
	note C_, 1
	note E_, 1
	note F#, 1
	note G_, 4
	note A_, 1
	intensity $28
	note A_, 1
	intensity $A8
	note G_, 4
	note F_, 1
	intensity $28
	note F_, 1
	intensity $A8
	note G_, 4
	note F_, 1
	intensity $28
	note F_, 1
	intensity $A8
	note E_, 2
	intensity $88
	note D#, 1
	intensity $78
	note D_, 1
	intensity $A8
	note C_, 2
	octave 3
	note F_, 2
	intensity $28
	note F_, 2
	note __, 1
	intensity $88
	note G#, 1
	intensity $A8
	note A_, 2
	intensity $28
	note A_, 2
	intensity $A8
	note F_, 2
	intensity $28
	note F_, 2
	db $FF

SoundEffect36_Channel6_Bank13:
	togglesfx
	notetype $08, $22
	note __, 3
	octave 1
	note A#, 4
	octave 2
	note F_, 1
	note __, 1
	octave 1
	note A#, 4
	octave 2
	note F_, 1
	note __, 1
	note C_, 4
	note G_, 1
	note __, 1
	note C_, 4
	note G_, 1
	note __, 1
	note C_, 2
	note __, 4
	note F_, 2
	note __, 2
	note C_, 2
	note __, 2
	db $FF

SoundEffect37_Bank13:
	db $04 | (($3 - 1) << 6) ; wChannel4
	dw SoundEffect37_Channel4_Bank13
	db $05 ; wChannel5
	dw SoundEffect37_Channel5_Bank13
	db $06 ; wChannel6
	dw SoundEffect37_Channel6_Bank13

SoundEffect37_Channel4_Bank13:
	togglesfx
	tempo $6E
	volume $77
	dutycycle $02
	notetype $06, $91
	note __, 4
	octave 3
	note G_, 2
	intensity $71
	note A#, 2
	octave 4
	note D_, 2
	note F_, 2
	intensity $91
	octave 3
	note G_, 2
	intensity $71
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	intensity $91
	note E_, 2
	intensity $71
	note G_, 2
	note A_, 2
	octave 4
	note C_, 2
	intensity $91
	octave 3
	note E_, 2
	intensity $71
	note G_, 2
	note A_, 2
	note G_, 2
	intensity $91
	note F_, 2
	intensity $71
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note F_, 2
	intensity $91
	note A#, 2
	intensity $71
	octave 4
	note D_, 2
	intensity $91
	octave 3
	note A#, 2
	intensity $71
	octave 4
	note D_, 2
	intensity $A3
	note E_, 4
	note __, 4
	dutycycle $03
	octave 3
	note E_, 2
	note __, 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 4
	db $FF

SoundEffect37_Channel5_Bank13:
	togglesfx
	dutycycle $03
	notetype $06, $B3
	octave 4
	note F_, 3
	note A_, 1
	note A#, 4
	note A_, 4
	note G_, 4
	note F_, 4
	note E_, 4
	note F_, 4
	note G_, 4
	note F_, 3
	note F#, 1
	note G_, 4
	note F_, 4
	note E_, 4
	note F_, 4
	note G_, 4
	intensity $28
	note G_, 2
	note __, 2
	intensity $b3
	octave 3
	note G_, 2
	intensity $28
	note G_, 2
	intensity $b3
	note E_, 1
	intensity $28
	note E_, 1
	intensity $b3
	note E_, 1
	intensity $28
	note E_, 1
	intensity $b3
	note F_, 4
	db $FF

SoundEffect37_Channel6_Bank13:
	togglesfx
	notetype $06, $22
	note __, 4
	octave 1
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	octave 2
	note D_, 5
	note __, 1
	octave 1
	note A#, 2
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 2
	note C_, 5
	note __, 1
	octave 1
	note A_, 2
	note A#, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 5
	note __, 1
	note A#, 2
	octave 2
	note C_, 4
	note __, 4
	note C_, 2
	note __, 2
	octave 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 4
	db $FF

SoundEffect38_Bank13:
	db $04 | (($3 - 1) << 6) ; wChannel4
	dw SoundEffect38_Channel4_Bank13
	db $05 ; wChannel5
	dw SoundEffect38_Channel5_Bank13
	db $06 ; wChannel6
	dw SoundEffect38_Channel6_Bank13

SoundEffect38_Channel4_Bank13:
	togglesfx
	tempo $70
	volume $77
	dutycycle $03
	vibrato $09, $34
	forceoctave $07
	notetype $08, $A3
	octave 3
	note C_, 4
	intensity $78
	octave 2
	note C_, 2
	intensity $A3
	note A#, 4
	intensity $78
	note C_, 2
	intensity $A3
	note A_, 4
	intensity $78
	note C_, 2
	intensity $38
	octave 3
	note C_, 1
	intensity $48
	note D_, 1
	intensity $58
	note E_, 1
	intensity $68
	note F_, 1
	intensity $78
	note G_, 1
	intensity $88
	note A_, 1
	intensity $91
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 2
	note A#, 1
	note __, 1
	intensity $85
	octave 3
	note C_, 12
	note __, 1
	db $FF

SoundEffect38_Channel5_Bank13:
	togglesfx
	dutycycle $03
	vibrato $09, $34
	forceoctave $07
	notetype $08, $B8
	octave 3
	note A_, 4
	intensity $28
	note A_, 2
	intensity $B8
	note F_, 4
	intensity $28
	note F_, 2
	intensity $B8
	note C_, 4
	intensity $28
	note C_, 2
	note __, 6
	intensity $98
	note A#, 1
	intensity $28
	note A#, 1
	intensity $B8
	note A#, 1
	intensity $28
	note A#, 1
	intensity $B8
	note A#, 1
	intensity $28
	note A#, 1
	intensity $B8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $B8
	note G_, 1
	intensity $28
	note G_, 1
	intensity $B8
	note A#, 1
	intensity $28
	note A#, 1
	intensity $B5
	note A_, 12
	note __, 1
	db $FF

SoundEffect38_Channel6_Bank13:
	togglesfx
	forceoctave $07
	notetype $08, $22
	octave 1
	note F_, 2
	note __, 2
	note A_, 2
	note F_, 2
	note __, 2
	note A#, 2
	note F_, 2
	note __, 2
	note A_, 2
	note F_, 2
	note __, 2
	note A_, 2
	note A#, 2
	note __, 2
	octave 2
	note D_, 1
	note __, 1
	note C#, 2
	note __, 2
	note F_, 1
	note __, 1
	note F_, 12
	note __, 1
	db $FF

SoundEffect39_Bank13:
	db $04 | (($2 - 1) << 6) ; wChannel4
	dw SoundEffect39_Channel4_Bank13
	db $05 ; wChannel5
	dw SoundEffect39_Channel5_Bank13

SoundEffect39_Channel4_Bank13:
	togglesfx
	tempo $80
	volume $77
	dutycycle $02
	notetype $0C, $C1
	forceoctave $05
	octave 4
	note G_, 1
	note D_, 1
	note A_, 1
	intensity $72
	octave 5
	note D_, 1
	intensity $52
	octave 4
	note A_, 1
	intensity $32
	octave 5
	note D_, 1
	intensity $22
	octave 4
	note A_, 1
	intensity $12
	octave 5
	note D_, 1
	db $FF

SoundEffect39_Channel5_Bank13:
	togglesfx
	notetype $06, $A1
	dutycycle $02
	forceoctave $05
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note __, 2
	intensity $52
	note D_, 2
	note __, 2
	intensity $22
	note D_, 2
	db $FF

SoundEffect40_Bank13:
	db $04 ; wChannel4
	dw SoundEffect40_Channel4_Bank13

SoundEffect40_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $01, $F1
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	octave 5
	note C_, 9
	intensity $A1
	note C_, 9
	intensity $71
	note C_, 9
	intensity $41
	note C_, 9
	note __, 2
	db $FF

SoundEffect41_Bank13:
	db $04 | (($3 - 1) << 6) ; wChannel4
	dw SoundEffect41_Channel4_Bank13
	db $05 ; wChannel5
	dw SoundEffect41_Channel5_Bank13
	db $06 ; wChannel6
	dw SoundEffect41_Channel6_Bank13

SoundEffect41_Channel4_Bank13:
	togglesfx
	tempo $78
	volume $77
	tone $01
	vibrato $09, $34
	dutycycle $02
	notetype $06, $93
	octave 3
	note A#, 2
	note __, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 2
	note __, 2
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 2
	note __, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	intensity $85
	note F_, 16
	note __, 1
	db $FF

SoundEffect41_Channel5_Bank13:
	togglesfx
	vibrato $09, $34
	dutycycle $02
	callchannel SoundEffect41_Channel5_ch0_Bank13
	forceoctave $18
	callchannel SoundEffect41_Channel5_ch0_Bank13
	forceoctave $03
	callchannel SoundEffect41_Channel5_ch0_Bank13
	forceoctave $01
	callchannel SoundEffect41_Channel5_ch0_Bank13
	forceoctave $00
	intensity $B5
	note D_, 16
	note __, 1
	db $FF
SoundEffect41_Channel5_ch0_Bank13:
	notetype $06, $B3
	octave 4
	note D_, 2
	intensity $28
	note D_, 2
	intensity $B3
	note D_, 1
	intensity $28
	note D_, 1
	intensity $B3
	note D_, 1
	intensity $28
	note D_, 1
	db $FF

SoundEffect41_Channel6_Bank13:
	togglesfx
	notetype $06, $22
	octave 2
	note F_, 2
	note __, 2
	octave 3
	note F_, 1
	note __, 1
	octave 2
	note F_, 1
	note __, 1
	note D#, 2
	note __, 2
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note D#, 1
	note __, 1
	note D_, 2
	note __, 2
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note __, 1
	octave 1
	note A#, 2
	note __, 2
	octave 2
	note A#, 1
	note __, 1
	octave 1
	note A#, 1
	note __, 1
	note A#, 16
	note __, 1
	db $FF

SoundEffect42_Bank13:
	db $04 | (($4 - 1) << 6) ; wChannel4
	dw SoundEffect42_Channel4_Bank13
	db $05 ; wChannel5
	dw SoundEffect42_Channel5_Bank13
	db $06 ; wChannel6
	dw SoundEffect42_Channel6_Bank13
	db $07 ; wChannel7
	dw SoundEffect42_Channel7_Bank13

SoundEffect42_Channel4_Bank13:
	togglesfx
	forceoctave $18
	tempo $70
	volume $77
	vibrato $14, $24
	notetype $06, $84
	note __, 12
	dutycycle $03
	octave 4
	note E_, 4
	octave 3
	note A_, 4
	octave 4
	note C#, 4
	note E_, 4
	dutycycle $02
	intensity $88
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 4
	note __, 4
	dutycycle $03
	intensity $84
	octave 4
	note F#, 4
	note C#, 1
	note D_, 3
	octave 3
	note A_, 4
	octave 4
	note F#, 4
	dutycycle $02
	intensity $88
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 4
	dutycycle $03
	note __, 1
	intensity $67
	octave 4
	note D_, 1
	intensity $77
	note F_, 1
	intensity $87
	note G#, 1
	notetype $0C, $97
	note A_, 12
	note __, 1
	db $FF

SoundEffect42_Channel5_Bank13:
	togglesfx
	forceoctave $18
	vibrato $14, $24
	notetype $06, $B4
	dutycycle $03
	octave 4
	note G#, 4
	note A_, 4
	note B_, 4
	octave 5
	note C#, 4
	note C_, 4
	octave 4
	note B_, 4
	octave 5
	note C#, 4
	intensity $28
	note C#, 2
	note __, 2
	intensity $B4
	note C_, 4
	intensity $28
	note C_, 2
	note __, 2
	intensity $B4
	octave 4
	note B_, 4
	note A_, 4
	octave 5
	note D#, 1
	note E_, 3
	note D_, 4
	note E_, 4
	intensity $28
	note E_, 2
	note __, 2
	intensity $B4
	octave 4
	note B_, 4
	intensity $28
	note B_, 2
	note __, 2
	intensity $B4
	octave 5
	note D_, 4
	notetype $0C, $B7
	note C#, 12
	note __, 1
	db $FF

SoundEffect42_Channel6_Bank13:
	togglesfx
	forceoctave $18
	notetype $06, $22
	octave 2
	note E_, 2
	note __, 2
	note E_, 6
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note A_, 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 2
	note __, 2
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 4
	octave 2
	note C#, 4
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note A_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	octave 3
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 4
	octave 1
	note A_, 4
	notetype $0C, $22
	octave 2
	note E_, 12
	note __, 1
	db $FF

SoundEffect42_Channel7_Bank13:
	note F#, 1
	note C_, 2
	note __, 1
	loopchannel 5, SoundEffect42_Channel7_Bank13
	note D_, 1
	note C_, 2
	note __, 1
	db $FF

SoundEffect43_Bank13:
	db $04 ; wChannel 4
	dw SoundEffect43_Channel4_Bank13

SoundEffect43_Channel4_Bank13:
	dutycycle $01
	soundinput $94
	soundeffect_note $02, $F1, $17, $05
	soundinput $AA
	soundeffect_note $03, $F8, $6C, $1F
	soundeffect_note $03, $F8, $6C, $1F
	soundeffect_note $08, $F1, $6C, $1F
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect44_Bank13:
	db $04 ; wChannel4
	dw SoundEffect44_Channel4_Bank13

SoundEffect44_Channel4_Bank13:
	dutycycle $00
	soundinput $6D
	soundeffect_note $09, $FB, $96, $07
	soundinput $65
	soundeffect_note $04, $FE, $C4, $06
	soundeffect_note $04, $94, $C4, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect45_Bank13:
	db $04 ; wChannel4
	dw SoundEffect45_Channel4_Bank13

SoundEffect45_Channel4_Bank13:
	dutycycle $03
	soundinput $6D
	soundeffect_note $09, $FB, $13, $07
	soundinput $65
	soundeffect_note $04, $FE, $27, $06
	soundeffect_note $04, $94, $27, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect46_Bank13:
	db $04 ; wChannel4
	dw SoundEffect46_Channel4_Bank13

SoundEffect46_Channel4_Bank13:
	dutycycle $03
	soundinput $43
	soundeffect_note $08, $F8, $64, $3B
	soundinput $9F
	soundeffect_note $06, $F8, $64, $3B
	soundinput $95
	soundeffect_note $08, $F8, $64, $3B
	soundinput $5D
	soundeffect_note $06, $F3, $27, $06
	soundeffect_note $04, $E3, $72, $06
	soundeffect_note $04, $D3, $27, $06
	soundeffect_note $08, $C3, $72, $06
	soundeffect_note $10, $A3, $27, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect47_Bank13:
	db $04 ; wChannel4
	dw SoundEffect47_Channel4_Bank13

SoundEffect47_Channel4_Bank13:
	dutycycle $02
	soundeffect_note $01, $E2, $13, $07
	soundeffect_note $08, $62, $13, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect48_Bank13:
	db $04 ; wChannel4
	dw SoundEffect48_Channel4_Bank13

SoundEffect48_Channel4_Bank13:
	dutycycle $00
	soundinput $5E
	soundeffect_note $02, $F8, $D6, $06
	soundeffect_note $02, $A1, $D6, $06
	soundeffect_note $08, $F1, $13, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect49_Bank13:
	db $07 ; wChannel7
	dw SoundEffect49_Channel7_Bank13

SoundEffect49_Channel7_Bank13:
	soundeffect_percussion $03, $8D, $21
	soundeffect_percussion $02, $CC, $22
	soundeffect_percussion $08, $82, $21
	soundeffect_percussion $01, $00, $00
	db $FF

SoundEffect50_Bank13:
	db $04 ; wChannel4
	dw SoundEffect50_Channel4_Bank13

SoundEffect50_Channel4_Bank13:
	dutycycle $00
	soundeffect_note $01, $91, $96, $07
SoundEffect50_Channel4_loop_Bank13:
_Bank13	soundeffect_note $03, $F1, $C6, $07
	loopchannel $02, SoundEffect50_Channel4_loop_Bank13
	soundeffect_note $0A, $C1, $C6, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect51_Bank13:
	db $04 ; wChannel4
	dw SoundEffect51_Channel4_Bank13

SoundEffect51_Channel4_Bank13:
	dutycycle $00
	soundinput $77
	soundeffect_note $01, $C8, $D6, $06
	soundeffect_note $03, $F8, $62, $07
	soundeffect_note $02, $B3, $6B, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect52_Bank13:
	db $04 ; wChannel4
	dw SoundEffect52_Channel4_Bank13

SoundEffect52_Channel4_Bank13:
	dutycycle $00
	soundeffect_note $01, $91, $B6, $07
	soundeffect_note $02, $F1, $CD, $07
	soundeffect_note $02, $41, $CD, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect53_Bank13:
	db $04 ; wChannel4
	dw SoundEffect53_Channel4_Bank13

SoundEffect53_Channel4_Bank13:
	dutycycle $00
	soundinput $9F
	soundeffect_note $02, $F8, $27, $06
	soundinput $8F
	soundeffect_note $02, $E1, $D6, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect54_Bank13:
	db $04 ; wChannel4
	dw SoundEffect54_Channel4_Bank13

SoundEffect54_Channel4_Bank13:
	dutycycle $00
	soundinput $9E
	soundeffect_note $02, $F8, $27, $05
	soundinput $8F
	soundeffect_note $02, $F1, $D6, $05
	soundinput $BC
	soundeffect_note $07, $F4, $D6, $04
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect55_Bank13:
	db $04 ; wChannel4
	dw SoundEffect55_Channel4_Bank13

SoundEffect55_Channel4_Bank13:
	dutycycle $03
	soundinput $43
	soundeffect_note $08, $F8, $64, $3B
	soundinput $9F
	soundeffect_note $06, $F8, $64, $3B
	soundinput $95
	soundeffect_note $08, $F8, $64, $3B
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect56_Bank13:
	db $04 ; wChannel4
	dw SoundEffect56_Channel4_Bank13

SoundEffect56_Channel4_Bank13:
	dutycycle $02
	soundinput $97
	soundeffect_note $04, $F3, $B6, $06
	soundeffect_note $04, $A3, $7D, $06
	soundeffect_note $04, $63, $07, $06
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect57_Bank13:
	db $07 ; wChannel7
	dw SoundEffect57_Channel7_Bank13

SoundEffect57_Channel7_Bank13:
	soundeffect_percussion $06, $F1, $47
	soundeffect_percussion $04, $B8, $35
	soundeffect_percussion $06, $B1, $59
	soundeffect_percussion $04, $51, $59
	soundeffect_percussion $01, $00, $00
	db $FF

SoundEffect58_Bank13:
	db $04 ; wChannel4
	dw SoundEffect58_Channel4_Bank13

SoundEffect58_Channel4_Bank13:
	dutycycle $02
	soundinput $A7
	soundeffect_note $05, $D4, $2D, $07
	soundeffect_note $05, $A4, $4E, $07
	soundeffect_note $02, $94, $7B, $07
	soundeffect_note $05, $74, $4E, $07
	soundeffect_note $02, $54, $7B, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect59_Bank13:
	db $04 ; wChannel4
	dw SoundEffect59_Channel4_Bank13

SoundEffect59_Channel4_Bank13:
	dutycycle $02
	soundinput $A7
	soundeffect_note $04, $91, $27, $07
	dutycycle $01
	soundinput $AF
	soundeffect_note $03, $C1, $96, $07
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect60_Bank13:
	db $04 ; wChannel4
	dw SoundEffect60_Channel4_Bank13

SoundEffect60_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $01, $F1
	octave 5
	note C#, 3
	intensity $31
	note C#, 3
	note __, 2
	db $FF

SoundEffect61_Bank13:
	db $04 ; wChannel4
	dw SoundEffect61_Channel4_Bank13

SoundEffect61_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $01, $F1
	octave 5
	note F#, 3
	intensity $31
	note F#, 3
	note __, 2
	db $FF

SoundEffect62_Bank13:
	db $04 ; wChannel4
	dw SoundEffect62_Channel4_Bank13

SoundEffect62_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $01, $A1
	octave 4
	note D_, 3
	note A_, 3
	octave 5
	note C#, 9
	intensity $28
	note C#, 3
	note __, 2
	db $FF

SoundEffect63_Bank13:
	db $07 ; wChannel7
	dw SoundEffect63_Channel7_Bank13

SoundEffect63_Channel7_Bank13:
	soundeffect_percussion $01, $B1, $44
	soundeffect_percussion $00, $00, $00
	soundeffect_percussion $01, $51, $44
	soundeffect_percussion $01, $00, $00
	db $FF

SoundEffect64_Bank13:
	db $07 ; wChannel7
	dw SoundEffect64_Channel7_Bank13

SoundEffect64_Channel7_Bank13:
	soundeffect_percussion $06, $F1, $47
	soundeffect_percussion $04, $C8, $35
	soundeffect_percussion $04, $B1, $59
SoundEffect64_Channel7_loop_Bank13:
	soundeffect_percussion $04, $98, $33
	soundeffect_percussion $06, $64, $69
	loopchannel $03, SoundEffect64_Channel7_loop_Bank13
	soundeffect_percussion $06, $6C, $11
	soundeffect_percussion $06, $6C, $22
	soundeffect_percussion $06, $6C, $33
	soundeffect_percussion $06, $6C, $44
	soundeffect_percussion $16, $83, $55
	soundeffect_percussion $01, $00, $00
	db $FF

SoundEffect65_Bank13:
	db $04 ; wChannel4
	dw SoundEffect65_Channel4_Bank13

SoundEffect65_Channel4_Bank13:
	dutycycle $02
	soundinput $3A
	soundeffect_note $04, $F2, $00, $02
	soundinput $22
	soundeffect_note $08, $E2, $00, $02
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect66_Bank13:
	db $04 ; wChannel4
	dw SoundEffect66_Channel4_Bank13

SoundEffect66_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $02, $D1
	octave 4
	note A_, 3
	note G#, 3
	note G_, 3
	octave 3
	note B_, 3
	note A_, 3
	note G#, 3
	intensity $D2
	note G_, 16
	note __, 2
	db $FF

SoundEffect67_Bank13:
	db $04 ; wChannel4
	dw SoundEffect67_Channel4_Bank13

SoundEffect67_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $02, $D1
	octave 4
	note G_, 3
	note B_, 3
	octave 5
	note C_, 3
	note D_, 3
	note F_, 3
	note E_, 3
	intensity $D2
	note F_, 16
	note __, 2
	db $FF

SoundEffect68_Bank13:
	db $04 ; wChannel4
	dw SoundEffect68_Channel4_Bank13

SoundEffect68_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $01, $F1
	octave 4
	note G_, 2
	octave 5
	note C_, 2
	note E_, 2
	note G_, 9
	intensity $A1
	note G_, 9
	intensity $71
	note G_, 9
	intensity $41
	note G_, 9
	note __, 2
	db $FF

SoundEffect69_Bank13:
	db $04 ; wChannel4
	dw SoundEffect69_Channel4_Bank13

SoundEffect69_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $01, $F1
	octave 4
	note C_, 2
	note E_, 2
	note G_, 2
	octave 6
	note C_, 9
	intensity $A1
	note C_, 9
	intensity $71
	note C_, 9
	intensity $41
	note C_, 9
	note __, 2
	db $FF

SoundEffect70_Bank13:
	db $04 ; wChannel4
	dw SoundEffect70_Channel4_Bank13

SoundEffect70_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $01, $F1
	octave 4
	note G_, 3
	octave 5
	note D_, 3
	octave 4
	note B_, 3
	octave 5
	note F_, 3
	octave 6
	note C_, 9
	intensity $28
	note C_, 3
	note __, 2
	db $FF

SoundEffect71_Bank13:
	db $04 ; wChannel4
	dw SoundEffect71_Channel4_Bank13

SoundEffect71_Channel4_Bank13:
	dutycycle $00
	soundeffect_note $02, $F8, $64, $3B
	soundeffect_note $02, $28, $64, $3B
	soundeffect_note $14, $F8, $64, $3B
	soundeffect_note $02, $28, $64, $3B
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect72_Bank13:
	db $07 ; wChannel7
	dw SoundEffect72_Channel7_Bank13

SoundEffect72_Channel7_Bank13:
	soundeffect_percussion $00, $E8, $34
	soundeffect_percussion $00, $00, $00
	soundeffect_percussion $01, $E1, $01
	soundeffect_percussion $01, $00, $00
	db $FF

SoundEffect73_Bank13:
	db $04
	dw SoundEffect73_Channel4_Bank13

SoundEffect73_Channel4_Bank13:
	dutycycle $02
SoundEffect73_Channel4_loop_Bank13:
	soundeffect_note $02, $F1, $B6, $07
	soundeffect_note $02, $31, $B6, $07
	loopchannel $04, SoundEffect73_Channel4_loop_Bank13
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect74_Bank13:
	db $04 ; wChannel4
	dw SoundEffect74_Channel4_Bank13

SoundEffect74_Channel4_Bank13:
	dutycycle $02
SoundEffect74_Channel4_loop_Bank13:
	soundeffect_note $02, $F1, $B6, $07
	soundeffect_note $02, $31, $B6, $07
	loopchannel $06, SoundEffect74_Channel4_loop_Bank13
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect75_Bank13:
	db $04 ; wChannel4
	dw SoundEffect75_Channel4_Bank13

SoundEffect75_Channel4_Bank13:
	dutycycle $02
SoundEffect75_Channel4_loop_Bank13:
	soundeffect_note $02, $F1, $B6, $07
	soundeffect_note $02, $31, $B6, $07
	loopchannel $08, SoundEffect75_Channel4_loop_Bank13
	soundeffect_note $01, $00, $00, $00
	db $FF

SoundEffect76_Bank13:
	db $04 ; wChannel4
	dw SoundEffect76_Channel4_Bank13

SoundEffect76_Channel4_Bank13:
	togglesfx
	dutycycle $02
	notetype $01, $F1
	octave 4
	note G_, 3
	note B_, 3
	octave 5
	note D_, 3
	note F#, 14
	note __, 2
	db $FF

SoundEffect77_Bank13:
	db $4 | (($2 - 1) << 6) ; wChannel4
	dw SoundEffect77_Channel4_Bank13
	db $05 ; wChannel5
	dw SoundEffect77_Channel5_Bank13

SoundEffect77_Channel4_Bank13:
	togglesfx
	dutycycle $02
	tempo $90
	volume $77
	notetype $08, $D1
	octave 4
	note G#, 1
	note F_, 1
	note G#, 1
	octave 5
	note C#, 1
	intensity $50
	note C#, 1
	intensity $D1
	octave 4
	note G#, 1
	octave 5
	note C#, 3
	intensity $52
	note C#, 3
	db $FF 

SoundEffect77_Channel5_Bank13:
	togglesfx
	dutycycle $02
	notetype $08, $E1
	octave 5
	note C#, 1
	octave 4
	note G#, 1
	octave 5
	note C#, 1
	note F_, 1
	intensity $50
	note F_, 1
	intensity $E1
	note C#, 1
	note G#, 3
	intensity $52
	note G#, 3
	db $FF

CryBasePointers_Bank13:
	dw Cry_00_Header_Bank13
	dw Cry_01_Header_Bank13
	dw Cry_02_Header_Bank13
	dw Cry_03_Header_Bank13
	dw Cry_04_Header_Bank13
	dw Cry_05_Header_Bank13
	dw Cry_06_Header_Bank13
	dw Cry_07_Header_Bank13
	dw Cry_08_Header_Bank13
	dw Cry_09_Header_Bank13
	dw Cry_0A_Header_Bank13
	dw Cry_0B_Header_Bank13
	dw Cry_0C_Header_Bank13
	dw Cry_0D_Header_Bank13
	dw Cry_0E_Header_Bank13
	dw Cry_0F_Header_Bank13
	dw Cry_10_Header_Bank13
	dw Cry_11_Header_Bank13
	dw Cry_12_Header_Bank13
	dw Cry_13_Header_Bank13
	dw Cry_14_Header_Bank13
	dw Cry_15_Header_Bank13
	dw Cry_16_Header_Bank13
	dw Cry_17_Header_Bank13
	dw Cry_18_Header_Bank13
	dw Cry_19_Header_Bank13
	dw Cry_1A_Header_Bank13
	dw Cry_1B_Header_Bank13
	dw Cry_1C_Header_Bank13
	dw Cry_1D_Header_Bank13
	dw Cry_1E_Header_Bank13
	dw Cry_1F_Header_Bank13
	dw Cry_20_Header_Bank13
	dw Cry_21_Header_Bank13
	dw Cry_22_Header_Bank13
	dw Cry_23_Header_Bank13
	dw Cry_24_Header_Bank13
	dw Cry_25_Header_Bank13

Cry_00_Header_Bank13:
	channelcount 3
	channel 4, Cry_00_Ch4_Bank13
	channel 5, Cry_00_Ch5_Bank13
	channel 7, Cry_00_Ch7_Bank13

Cry_01_Header_Bank13:
	channelcount 3
	channel 4,  Cry_01_Ch4_Bank13
	channel 5,  Cry_01_Ch5_Bank13
	channel 7,  Cry_01_Ch7_Bank13

Cry_02_Header_Bank13:
	channelcount 3
	channel 4, Cry_02_Ch4_Bank13
	channel 5, Cry_02_Ch5_Bank13
	channel 7, Cry_02_Ch7_Bank13

Cry_03_Header_Bank13:
	channelcount 3
	channel 4, Cry_03_Ch4_Bank13
	channel 5, Cry_03_Ch5_Bank13
	channel 7, Cry_03_Ch7_Bank13

Cry_04_Header_Bank13:
	channelcount 3
	channel 4, Cry_04_Ch4_Bank13
	channel 5, Cry_04_Ch5_Bank13
	channel 7, Cry_04_Ch7_Bank13

Cry_05_Header_Bank13:
	channelcount 3
	channel 4, Cry_05_Ch4_Bank13
	channel 5, Cry_05_Ch5_Bank13
	channel 7, Cry_05_Ch7_Bank13

Cry_06_Header_Bank13:
	channelcount 3
	channel 4, Cry_06_Ch4_Bank13
	channel 5, Cry_06_Ch5_Bank13
	channel 7, Cry_06_Ch7_Bank13

Cry_07_Header_Bank13:
	channelcount 3
	channel 4, Cry_07_Ch4_Bank13
	channel 5, Cry_07_Ch5_Bank13
	channel 7, Cry_07_Ch7_Bank13

Cry_08_Header_Bank13:
	channelcount 3
	channel 4, Cry_08_Ch4_Bank13
	channel 5, Cry_08_Ch5_Bank13
	channel 7, Cry_08_Ch7_Bank13

Cry_09_Header_Bank13:
	channelcount 3
	channel 4, Cry_09_Ch4_Bank13
	channel 5, Cry_09_Ch5_Bank13
	channel 7, Cry_09_Ch7_Bank13

Cry_0A_Header_Bank13:
	channelcount 3
	channel 4, Cry_0A_Ch4_Bank13
	channel 5, Cry_0A_Ch5_Bank13
	channel 7, Cry_0A_Ch7_Bank13

Cry_0B_Header_Bank13:
	channelcount 3
	channel 4, Cry_0B_Ch4_Bank13
	channel 5, Cry_0B_Ch5_Bank13
	channel 7, Cry_0B_Ch7_Bank13

Cry_0C_Header_Bank13:
	channelcount 3
	channel 4, Cry_0C_Ch4_Bank13
	channel 5, Cry_0C_Ch5_Bank13
	channel 7, Cry_0C_Ch7_Bank13

Cry_0D_Header_Bank13:
	channelcount 3
	channel 4, Cry_0D_Ch4_Bank13
	channel 5, Cry_0D_Ch5_Bank13
	channel 7, Cry_0D_Ch7_Bank13

Cry_0E_Header_Bank13:
	channelcount 3
	channel 4, Cry_0E_Ch4_Bank13
	channel 5, Cry_0E_Ch5_Bank13
	channel 7, Cry_0E_Ch7_Bank13

Cry_0F_Header_Bank13:
	channelcount 3
	channel 4, Cry_0F_Ch4_Bank13
	channel 5, Cry_0F_Ch5_Bank13
	channel 7, Cry_0F_Ch7_Bank13

Cry_10_Header_Bank13:
	channelcount 3
	channel 4, Cry_10_Ch4_Bank13
	channel 5, Cry_10_Ch5_Bank13
	channel 7, Cry_10_Ch7_Bank13

Cry_11_Header_Bank13:
	channelcount 3
	channel 4, Cry_11_Ch4_Bank13
	channel 5, Cry_11_Ch5_Bank13
	channel 7, Cry_11_Ch7_Bank13

Cry_12_Header_Bank13:
	channelcount 3
	channel 4, Cry_12_Ch4_Bank13
	channel 5, Cry_12_Ch5_Bank13
	channel 7, Cry_12_Ch7_Bank13

Cry_13_Header_Bank13:
	channelcount 3
	channel 4, Cry_13_Ch4_Bank13
	channel 5, Cry_13_Ch5_Bank13
	channel 7, Cry_13_Ch7_Bank13

Cry_14_Header_Bank13:
	channelcount 3
	channel 4, Cry_14_Ch4_Bank13
	channel 5, Cry_14_Ch5_Bank13
	channel 7, Cry_14_Ch7_Bank13

Cry_15_Header_Bank13:
	channelcount 3
	channel 4, Cry_15_Ch4_Bank13
	channel 5, Cry_15_Ch5_Bank13
	channel 7, Cry_15_Ch7_Bank13

Cry_16_Header_Bank13:
	channelcount 3
	channel 4, Cry_16_Ch4_Bank13
	channel 5, Cry_16_Ch5_Bank13
	channel 7, Cry_16_Ch7_Bank13

Cry_17_Header_Bank13:
	channelcount 3
	channel 4, Cry_17_Ch4_Bank13
	channel 5, Cry_17_Ch5_Bank13
	channel 7, Cry_17_Ch7_Bank13

Cry_18_Header_Bank13:
	channelcount 3
	channel 4, Cry_18_Ch4_Bank13
	channel 5, Cry_18_Ch5_Bank13
	channel 7, Cry_18_Ch7_Bank13

Cry_19_Header_Bank13:
	channelcount 3
	channel 4, Cry_19_Ch4_Bank13
	channel 5, Cry_19_Ch5_Bank13
	channel 7, Cry_19_Ch7_Bank13

Cry_1A_Header_Bank13:
	channelcount 3
	channel 4, Cry_1A_Ch4_Bank13
	channel 5, Cry_1A_Ch5_Bank13
	channel 7, Cry_1A_Ch7_Bank13

Cry_1B_Header_Bank13:
	channelcount 3
	channel 4, Cry_1B_Ch4_Bank13
	channel 5, Cry_1B_Ch5_Bank13
	channel 7, Cry_1B_Ch7_Bank13

Cry_1C_Header_Bank13:
	channelcount 3
	channel 4, Cry_1C_Ch4_Bank13
	channel 5, Cry_1C_Ch5_Bank13
	channel 7, Cry_1C_Ch7_Bank13

Cry_1D_Header_Bank13:
	channelcount 3
	channel 4, Cry_1D_Ch4_Bank13
	channel 5, Cry_1D_Ch5_Bank13
	channel 7, Cry_1D_Ch7_Bank13

Cry_1E_Header_Bank13:
	channelcount 3
	channel 4, Cry_1E_Ch4_Bank13
	channel 5, Cry_1E_Ch5_Bank13
	channel 7, Cry_1E_Ch7_Bank13

Cry_1F_Header_Bank13:
	channelcount 3
	channel 4, Cry_1F_Ch4_Bank13
	channel 5, Cry_1F_Ch5_Bank13
	channel 7, Cry_1F_Ch7_Bank13

Cry_20_Header_Bank13:
	channelcount 3
	channel 4, Cry_20_Ch4_Bank13
	channel 5, Cry_20_Ch5_Bank13
	channel 7, Cry_20_Ch7_Bank13

Cry_21_Header_Bank13:
	channelcount 3
	channel 4, Cry_21_Ch4_Bank13
	channel 5, Cry_21_Ch5_Bank13
	channel 7, Cry_21_Ch7_Bank13

Cry_22_Header_Bank13:
	channelcount 3
	channel 4, Cry_22_Ch4_Bank13
	channel 5, Cry_22_Ch5_Bank13
	channel 7, Cry_22_Ch7_Bank13

Cry_23_Header_Bank13:
	channelcount 3
	channel 4, Cry_23_Ch4_Bank13
	channel 5, Cry_23_Ch5_Bank13
	channel 7, Cry_23_Ch7_Bank13

Cry_24_Header_Bank13:
	channelcount 3
	channel 4, Cry_24_Ch4_Bank13
	channel 5, Cry_24_Ch5_Bank13
	channel 7, Cry_24_Ch7_Bank13

Cry_25_Header_Bank13:
	channelcount 3
	channel 4, Cry_25_Ch4_Bank13
	channel 5, Cry_25_Ch5_Bank13
	channel 7, Cry_25_Ch7_Bank13

UnusedCry_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $0F, $E0, $80, $07
	soundeffect_note $0F, $F0, $84, $07
	soundeffect_note $0F, $C3, $E0, $05
	soundeffect_note $0F, $C4, $00, $06
	soundeffect_note $0A, $6C, $80, $07
	soundeffect_note $08, $71, $84, $07
	endchannel

UnusedCry_Ch5_Bank13:
	unknownmusic0xde $05
	soundeffect_note $0F, $A0, $41, $07
	soundeffect_note $0F, $B0, $43, $07
	soundeffect_note $0F, $93, $B1, $05
	soundeffect_note $0F, $94, $C1, $05
	soundeffect_note $0A, $4C, $41, $07
	soundeffect_note $08, $31, $46, $07
	endchannel

UnusedCry_Ch7_Bank13:
	soundeffect_percussion $02, $F2, $4C
	soundeffect_percussion $06, $E0, $3A
	soundeffect_percussion $0F, $D0, $3A
	soundeffect_percussion $08, $D0, $2C
	soundeffect_percussion $06, $E6, $4C
	soundeffect_percussion $0C, $7D, $4C
	soundeffect_percussion $0F, $D3, $4C
	endchannel

Cry_09_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $0F, $F7, $A0, $07
	soundeffect_note $06, $E6, $A3, $07
	soundeffect_note $0A, $F4, $A0, $07
	unknownmusic0xde $A5
	soundeffect_note $0A, $F6, $D8, $07
	soundeffect_note $04, $E3, $D7, $07
	soundeffect_note $0F, $F2, $D8, $07
	endchannel

Cry_09_Ch5_Bank13:
	unknownmusic0xde $05
	soundeffect_note $02, $08, $00, $00
	soundeffect_note $0F, $A7, $A1, $06
	soundeffect_note $06, $86, $A2, $06
	soundeffect_note $0A, $74, $A1, $06
	unknownmusic0xde $5F
	soundeffect_note $0A, $76, $D6, $06
	soundeffect_note $04, $83, $D9, $06
	soundeffect_note $0F, $A2, $D7, $06
	endchannel

Cry_09_Ch7_Bank13:
	soundeffect_percussion $02, $F2, $3C
	soundeffect_percussion $08, $E4, $3E
	soundeffect_percussion $0F, $D7, $3C
	soundeffect_percussion $06, $C5, $3B
	soundeffect_percussion $06, $E4, $3D
	soundeffect_percussion $08, $B6, $3C
	soundeffect_percussion $06, $D4, $3D
	soundeffect_percussion $08, $C1, $3B
	endchannel

Cry_23_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $0F, $F7, $C0, $07
	soundeffect_note $06, $E4, $C1, $07
	soundeffect_note $0A, $F6, $C0, $07
	soundeffect_note $04, $D3, $C2, $07
	soundeffect_note $08, $C1, $C0, $07
	endchannel

Cry_23_Ch5_Bank13:
	unknownmusic0xde $5F
	soundeffect_note $0F, $97, $81, $07
	soundeffect_note $06, $84, $80, $07
	soundeffect_note $0A, $96, $81, $07
	soundeffect_note $0F, $83, $81, $07
	endchannel

Cry_23_Ch7_Bank13:
	soundeffect_percussion $03, $F2, $3C
	soundeffect_percussion $0D, $E6, $2C
	soundeffect_percussion $0F, $D7, $3C
	soundeffect_percussion $08, $C1, $2C
	endchannel

Cry_24_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $0F, $F7, $80, $06
	soundeffect_note $0A, $E6, $84, $06
	soundeffect_note $0F, $D7, $90, $06
	soundeffect_note $08, $D5, $90, $06
	soundeffect_note $06, $C4, $88, $06
	soundeffect_note $05, $D3, $70, $06
	soundeffect_note $04, $D3, $60, $06
	soundeffect_note $08, $C1, $40, $06
	endchannel

Cry_24_Ch5_Bank13:
	unknownmusic0xde $05
	soundeffect_note $0F, $B7, $41, $06
	soundeffect_note $0A, $96, $42, $06
	soundeffect_note $0F, $A7, $51, $06
	soundeffect_note $08, $A5, $51, $06
	soundeffect_note $06, $94, $47, $06
	soundeffect_note $05, $A3, $31, $06
	soundeffect_note $04, $93, $22, $06
	soundeffect_note $08, $71, $01, $06
	endchannel

Cry_24_Ch7_Bank13:
	soundeffect_percussion $0F, $E4, $3C
	soundeffect_percussion $0A, $C7, $4C
	soundeffect_percussion $0A, $C7, $3C
	soundeffect_percussion $0C, $B7, $4C
	soundeffect_percussion $0F, $A2, $5C
	endchannel

Cry_11_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $06, $F7, $A0, $07
	soundeffect_note $08, $E6, $A4, $07
	soundeffect_note $04, $D6, $A0, $07
	soundeffect_note $0F, $D3, $20, $07
	soundeffect_note $08, $C3, $23, $07
	soundeffect_note $02, $C2, $28, $07
	soundeffect_note $08, $B1, $30, $07
	endchannel

Cry_11_Ch5_Bank13:
	unknownmusic0xde $0A
	soundeffect_note $04, $08, $00, $00
	soundeffect_note $06, $A7, $41, $07
	soundeffect_note $08, $86, $43, $07
	soundeffect_note $04, $76, $41, $07
	soundeffect_note $0D, $83, $C2, $06
	soundeffect_note $07, $73, $C1, $06
	soundeffect_note $03, $82, $CC, $06
	soundeffect_note $08, $71, $D8, $06
	endchannel

Cry_11_Ch7_Bank13:
	soundeffect_percussion $02, $F2, $4C
	soundeffect_percussion $06, $E6, $3A
	soundeffect_percussion $04, $D7, $3A
	soundeffect_percussion $06, $D6, $2C
	soundeffect_percussion $08, $E5, $3C
	soundeffect_percussion $0C, $D2, $3D
	soundeffect_percussion $08, $D1, $2C
	endchannel

Cry_25_Ch4_Bank13:
	unknownmusic0xde $A5
	soundeffect_note $06, $F4, $40, $07
	soundeffect_note $0F, $E3, $30, $07
	soundeffect_note $04, $F4, $40, $07
	soundeffect_note $05, $B3, $48, $07
	soundeffect_note $08, $D1, $50, $07
	endchannel

Cry_25_Ch5_Bank13:
	unknownmusic0xde $77
	soundeffect_note $06, $C3, $12, $07
	soundeffect_note $0F, $B3, $04, $07
	soundeffect_note $03, $C3, $12, $07
	soundeffect_note $04, $C3, $21, $07
	soundeffect_note $08, $B1, $32, $07
	endchannel

Cry_25_Ch7_Bank13:
	soundeffect_percussion $08, $D6, $2C
	soundeffect_percussion $0C, $C6, $3C
	soundeffect_percussion $0A, $B6, $2C
	soundeffect_percussion $08, $91, $1C
	endchannel

Cry_03_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $04, $F7, $08, $06
	soundeffect_note $06, $E6, $00, $06
	soundeffect_note $06, $D7, $F0, $05
	soundeffect_note $06, $C4, $E0, $05
	soundeffect_note $05, $D3, $C0, $05
	soundeffect_note $04, $D3, $A0, $05
	soundeffect_note $08, $E1, $80, $05
	endchannel

Cry_03_Ch5_Bank13:
	unknownmusic0xde $0A
	soundeffect_note $04, $C7, $04, $05
	soundeffect_note $06, $A6, $02, $05
	soundeffect_note $06, $97, $F1, $04
	soundeffect_note $04, $B4, $E1, $04
	soundeffect_note $05, $A3, $C2, $04
	soundeffect_note $04, $B3, $A3, $04
	soundeffect_note $08, $C1, $82, $04
	endchannel

Cry_03_Ch7_Bank13:
	soundeffect_percussion $0C, $E4, $4C
	soundeffect_percussion $0A, $C7, $5C
	soundeffect_percussion $0C, $B6, $4C
	soundeffect_percussion $0F, $A2, $5C
	endchannel

Cry_0F_Ch4_Bank13:
	unknownmusic0xde $F1
	soundeffect_note $04, $F7, $C0, $07
	soundeffect_note $0C, $E6, $C2, $07
	soundeffect_note $06, $B5, $80, $06
	soundeffect_note $04, $C4, $70, $06
	soundeffect_note $04, $B5, $60, $06
	soundeffect_note $08, $C1, $40, $06
	endchannel

Cry_0F_Ch5_Bank13:
	unknownmusic0xde $CC
	soundeffect_note $03, $C7, $81, $07
	soundeffect_note $0C, $B6, $80, $07
	soundeffect_note $06, $A5, $41, $06
	soundeffect_note $04, $C4, $32, $06
	soundeffect_note $06, $B5, $21, $06
	soundeffect_note $08, $A1, $02, $06
	endchannel

Cry_0F_Ch7_Bank13:
	soundeffect_percussion $03, $E4, $3C
	soundeffect_percussion $0C, $D6, $2C
	soundeffect_percussion $04, $E4, $3C
	soundeffect_percussion $08, $B7, $5C
	soundeffect_percussion $0F, $C2, $5D
	endchannel

Cry_10_Ch4_Bank13:
	unknownmusic0xde $C9
	soundeffect_note $08, $F7, $80, $06
	soundeffect_note $02, $F7, $60, $06
	soundeffect_note $01, $E7, $40, $06
	soundeffect_note $01, $E7, $20, $06
	soundeffect_note $0F, $D1, $00, $06
	soundeffect_note $04, $C7, $40, $07
	soundeffect_note $04, $A7, $30, $07
	soundeffect_note $0F, $91, $20, $07
	endchannel

Cry_10_Ch5_Bank13:
	unknownmusic0xde $79
	soundeffect_note $0A, $E7, $82, $06
	soundeffect_note $02, $E7, $62, $06
	soundeffect_note $01, $D7, $42, $06
	soundeffect_note $01, $D7, $22, $06
	soundeffect_note $0F, $C1, $02, $06
	soundeffect_note $04, $B7, $42, $07
	soundeffect_note $02, $97, $32, $07
	soundeffect_note $0F, $81, $22, $07
	endchannel

Cry_10_Ch7_Bank13:
	soundeffect_percussion $04, $74, $21
	soundeffect_percussion $04, $74, $10
	soundeffect_percussion $04, $71, $20
	endchannel

Cry_00_Ch4_Bank13:
	unknownmusic0xde 245
	soundeffect_note 4, 243, 24, 7
	soundeffect_note 15, 229, 152, 7
	soundeffect_note 8, 145, 88, 7
	endchannel

Cry_00_Ch5_Bank13:
	unknownmusic0xde 160
	soundeffect_note 5, 179, 8, 7
	soundeffect_note 15, 197, 136, 7
	soundeffect_note 8, 113, 72, 7
	endchannel

Cry_00_Ch7_Bank13:
	soundeffect_percussion 3, 161, 28
	soundeffect_percussion 14, 148, 44
	soundeffect_percussion 8, 129, 28
	endchannel

Cry_0E_Ch4_Bank13:
	unknownmusic0xde $A5
	soundeffect_note $04, $E1, $00, $07
	soundeffect_note $04, $F2, $80, $07
	soundeffect_note $02, $92, $40, $07
	soundeffect_note $08, $E1, $00, $06
	endchannel

Cry_0E_Ch5_Bank13:
	unknownmusic0xde $0A
	soundeffect_note $04, $B1, $E1, $06
	soundeffect_note $03, $C2, $E1, $06
	soundeffect_note $03, $62, $81, $06
	soundeffect_note $08, $B1, $E1, $05
	endchannel

Cry_0E_Ch7_Bank13:
	soundeffect_percussion $02, $61, $32
	soundeffect_percussion $02, $61, $21
	soundeffect_percussion $08, $61, $11
	endchannel


Cry_06_Ch4_Bank13:
	unknownmusic0xde $FA
	soundeffect_note $06, $83, $47, $02
	soundeffect_note $0F, $62, $26, $02
	soundeffect_note $04, $52, $45, $02
	soundeffect_note $09, $63, $06, $02
	soundeffect_note $0F, $82, $25, $02
	soundeffect_note $0F, $42, $07, $02
Cry_06_Ch5_Bank13:
	endchannel

Cry_06_Ch7_Bank13:
	soundeffect_percussion $08, $D4, $8C
	soundeffect_percussion $04, $E2, $9C
	soundeffect_percussion $0F, $C6, $8C
	soundeffect_percussion $08, $E4, $AC
	soundeffect_percussion $0F, $D7, $9C
	soundeffect_percussion $0F, $F2, $AC
	endchannel

Cry_07_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $04, $F3, $E0, $06
	soundeffect_note $0F, $E4, $40, $06
	soundeffect_note $08, $C1, $20, $06
	endchannel

Cry_07_Ch5_Bank13:
	unknownmusic0xde $0A
	soundeffect_note $03, $C3, $83, $06
	soundeffect_note $0E, $B4, $02, $06
	soundeffect_note $08, $A1, $01, $06
	endchannel

Cry_07_Ch7_Bank13:
	soundeffect_percussion $04, $D3, $5C
	soundeffect_percussion $0F, $E6, $4C
	soundeffect_percussion $08, $B1, $5C
	endchannel

Cry_05_Ch4_Bank13:
	unknownmusic0xde $0A
	soundeffect_note $06, $E2, $00, $05
	soundeffect_note $06, $E3, $80, $05
	soundeffect_note $06, $D3, $70, $05
	soundeffect_note $08, $A1, $60, $05
	endchannel

Cry_05_Ch5_Bank13:
	unknownmusic0xde $F5
	soundeffect_note $06, $E2, $82, $04
	soundeffect_note $06, $D3, $01, $05
	soundeffect_note $06, $B2, $E2, $04
	soundeffect_note $08, $81, $C1, $04
Cry_05_Ch7_Bank13:
	endchannel

Cry_0B_Ch4_Bank13:
	unknownmusic0xde $CC
	soundeffect_note $04, $F1, $00, $07
	soundeffect_note $04, $E1, $80, $07
	soundeffect_note $04, $D1, $40, $07
	soundeffect_note $04, $E1, $40, $07
	soundeffect_note $04, $F1, $80, $07
	soundeffect_note $04, $D1, $00, $07
	soundeffect_note $04, $F1, $01, $07
	soundeffect_note $04, $D1, $82, $07
	soundeffect_note $04, $C1, $42, $07
	soundeffect_note $08, $B1, $41, $07
	endchannel

Cry_0B_Ch5_Bank13:
	unknownmusic0xde $44
	soundeffect_note $0C, $08, $00, $00
	soundeffect_note $04, $F1, $01, $07
	soundeffect_note $04, $E1, $82, $07
	soundeffect_note $04, $D1, $41, $07
	soundeffect_note $04, $E1, $41, $07
	soundeffect_note $04, $F1, $82, $07
	soundeffect_note $08, $D1, $01, $07
	endchannel

Cry_0B_Ch7_Bank13:
	soundeffect_percussion $0F, $08, $00
	soundeffect_percussion $04, $08, $00
	soundeffect_percussion $04, $D1, $4C
	soundeffect_percussion $04, $B1, $2C
	soundeffect_percussion $04, $D1, $3C
	soundeffect_percussion $04, $B1, $3C
	soundeffect_percussion $04, $C1, $2C
	soundeffect_percussion $08, $A1, $4C
	endchannel

Cry_0C_Ch4_Bank13:
	unknownmusic0xde $CC
	soundeffect_note $08, $F5, $00, $06
	soundeffect_note $02, $D2, $38, $06
	soundeffect_note $02, $C2, $30, $06
	soundeffect_note $02, $C2, $28, $06
	soundeffect_note $02, $B2, $20, $06
	soundeffect_note $02, $B2, $10, $06
	soundeffect_note $02, $A2, $18, $06
	soundeffect_note $02, $B2, $10, $06
	soundeffect_note $08, $C1, $20, $06
	endchannel

Cry_0C_Ch5_Bank13:
	unknownmusic0xde $44
	soundeffect_note $0C, $C3, $C0, $05
	soundeffect_note $03, $B1, $F9, $05
	soundeffect_note $02, $A1, $F1, $05
	soundeffect_note $02, $A1, $E9, $05
	soundeffect_note $02, $91, $E1, $05
	soundeffect_note $02, $91, $D9, $05
	soundeffect_note $02, $81, $D1, $05
	soundeffect_note $02, $91, $D9, $05
	soundeffect_note $08, $91, $E1, $05
Cry_0C_Ch7_Bank13:
	endchannel

Cry_02_Ch4_Bank13:
	unknownmusic0xde $00
	soundeffect_note $08, $F5, $80, $04
	soundeffect_note $02, $E1, $E0, $05
	soundeffect_note $08, $D1, $DC, $05
	endchannel

Cry_02_Ch5_Bank13:
	unknownmusic0xde $A5
	soundeffect_note $07, $95, $41, $04
	soundeffect_note $02, $81, $21, $05
	soundeffect_note $08, $61, $1A, $05
Cry_02_Ch7_Bank13:
	endchannel

Cry_0D_Ch4_Bank13:
	unknownmusic0xde $88
	soundeffect_note $05, $F2, $50, $06
	soundeffect_note $09, $D1, $60, $06
	soundeffect_note $05, $E2, $12, $06
	soundeffect_note $09, $C1, $22, $06
	soundeffect_note $05, $F2, $10, $06
	soundeffect_note $06, $D1, $20, $06
	soundeffect_note $FD, $02, $FC, $73
	endchannel

Cry_0D_Ch5_Bank13:
	unknownmusic0xde $40
	soundeffect_note $04, $08, $00, $00
	soundeffect_note $05, $F2, $51, $06
	soundeffect_note $09, $D1, $61, $06
	soundeffect_note $05, $E2, $14, $06
	soundeffect_note $08, $C1, $24, $06
	soundeffect_note $05, $F2, $11, $06
	soundeffect_note $0C, $D1, $21, $06
	soundeffect_note $05, $E2, $14, $06
	soundeffect_note $08, $C1, $24, $06
	soundeffect_note $05, $F2, $11, $06
	soundeffect_note $04, $D1, $21, $06
	endchannel

Cry_0D_Ch7_Bank13:
	soundeffect_percussion $06, $D2, $1C
	soundeffect_percussion $09, $B1, $2C
	soundeffect_percussion $08, $C2, $2C
	soundeffect_percussion $09, $B1, $3C
	soundeffect_percussion $06, $C2, $2C
	soundeffect_percussion $09, $A2, $3C
	soundeffect_percussion $07, $C2, $2C
	soundeffect_percussion $05, $A1, $3C
	soundeffect_percussion $09, $C2, $2C
	soundeffect_percussion $04, $A1, $3C
	endchannel

Cry_01_Ch4_Bank13:
	unknownmusic0xde $A0
	soundeffect_note $04, $F3, $00, $06
	soundeffect_note $08, $D5, $60, $07
	soundeffect_note $03, $E2, $20, $07
	soundeffect_note $08, $D1, $10, $07
	endchannel

Cry_01_Ch5_Bank13:
	unknownmusic0xde $5A
	soundeffect_note $05, $B3, $F1, $06
	soundeffect_note $07, $C5, $52, $07
	soundeffect_note $03, $A2, $11, $07
	soundeffect_note $08, $B1, $01, $06
	endchannel

Cry_01_Ch7_Bank13:
	soundeffect_percussion $03, $A2, $3C
	soundeffect_percussion $0C, $94, $2C
	soundeffect_percussion $03, $82, $1C
	soundeffect_percussion $08, $71, $2C
	endchannel

Cry_0A_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $08, $F7, $E0, $06
	soundeffect_note $06, $E6, $E5, $06
	soundeffect_note $03, $F4, $E0, $06
	soundeffect_note $03, $F6, $D0, $06
	soundeffect_note $03, $E3, $C0, $06
	soundeffect_note $04, $F2, $B0, $06
	soundeffect_note $0F, $A2, $C8, $06
	endchannel

Cry_0A_Ch5_Bank13:
	unknownmusic0xde $05
	soundeffect_note $03, $08, $00, $00
	soundeffect_note $08, $A7, $A1, $06
	soundeffect_note $06, $86, $A3, $06
	soundeffect_note $03, $74, $A1, $06
	soundeffect_note $03, $76, $91, $06
	soundeffect_note $03, $83, $82, $06
	soundeffect_note $04, $A2, $71, $06
	soundeffect_note $0F, $72, $89, $06
	endchannel

Cry_0A_Ch7_Bank13:
	soundeffect_percussion $02, $F2, $3C
	soundeffect_percussion $08, $E4, $3E
	soundeffect_percussion $08, $D7, $3C
	soundeffect_percussion $05, $C5, $3B
	soundeffect_percussion $03, $D4, $2C
	soundeffect_percussion $02, $B6, $3C
	soundeffect_percussion $03, $A4, $2C
	soundeffect_percussion $08, $91, $3C
	endchannel

Cry_08_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $0F, $F6, $65, $05
	soundeffect_note $0A, $E4, $7C, $05
	soundeffect_note $03, $C2, $5C, $05
	soundeffect_note $0F, $B2, $3C, $05
	endchannel

Cry_08_Ch5_Bank13:
	unknownmusic0xde $5A
	soundeffect_note $0E, $D6, $03, $05
	soundeffect_note $09, $B4, $1B, $05
	soundeffect_note $04, $92, $FA, $04
	soundeffect_note $0F, $A2, $DB, $04
	endchannel

Cry_08_Ch7_Bank13:
	soundeffect_percussion $0C, $E6, $4C
	soundeffect_percussion $0B, $D7, $5C
	soundeffect_percussion $0F, $C2, $4C
	endchannel

Cry_04_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $04, $F7, $A0, $06
	soundeffect_note $08, $E6, $A4, $06
	soundeffect_note $04, $D6, $A0, $06
	soundeffect_note $0C, $D3, $20, $06
	soundeffect_note $08, $C3, $24, $06
	soundeffect_note $04, $C2, $20, $06
	soundeffect_note $08, $B1, $10, $06
	endchannel

Cry_04_Ch5_Bank13:
	unknownmusic0xde $5A
	soundeffect_note $04, $E7, $01, $06
	soundeffect_note $08, $D6, $03, $06
	soundeffect_note $04, $C6, $01, $06
	soundeffect_note $0C, $C3, $81, $05
	soundeffect_note $08, $B3, $83, $05
	soundeffect_note $04, $B2, $82, $05
	soundeffect_note $08, $A1, $71, $05
	endchannel

Cry_04_Ch7_Bank13:
	soundeffect_percussion $07, $D6, $5C
	soundeffect_percussion $08, $E6, $4C
	soundeffect_percussion $04, $D4, $5C
	soundeffect_percussion $04, $D4, $4C
	soundeffect_percussion $07, $C3, $4C
	soundeffect_percussion $08, $A1, $5C
	endchannel

Cry_19_Ch4_Bank13:
	unknownmusic0xde $1B
	soundeffect_note $07, $D2, $40, $07
	soundeffect_note $0F, $E5, $60, $07
	soundeffect_note $18, $C1, $30, $07
	endchannel

Cry_19_Ch5_Bank13:
	unknownmusic0xde $81
	soundeffect_note $02, $C2, $01, $07
	soundeffect_note $04, $C2, $08, $07
	soundeffect_note $0F, $D7, $41, $07
	soundeffect_note $18, $A2, $01, $07
Cry_19_Ch7_Bank13:
	endchannel

Cry_16_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $0F, $D7, $80, $07
	soundeffect_note $04, $E6, $A0, $07
	soundeffect_note $0F, $D2, $40, $07
	endchannel

Cry_16_Ch5_Bank13:
	unknownmusic0xde $5A
	soundeffect_note $0F, $C7, $53, $07
	soundeffect_note $05, $B6, $72, $07
	soundeffect_note $0F, $C2, $11, $07
	endchannel

Cry_16_Ch7_Bank13:
	soundeffect_percussion $0D, $F6, $4C
	soundeffect_percussion $04, $E6, $3C
	soundeffect_percussion $0F, $F2, $4C
	endchannel

Cry_1B_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $06, $F7, $C0, $06
	soundeffect_note $0F, $E7, $00, $07
	soundeffect_note $04, $F4, $F0, $06
	soundeffect_note $04, $E4, $E0, $06
	soundeffect_note $08, $D1, $D0, $06
	endchannel

Cry_1B_Ch5_Bank13:
	unknownmusic0xde $0A
	soundeffect_note $07, $E6, $81, $06
	soundeffect_note $0E, $D5, $C1, $06
	soundeffect_note $04, $C4, $B1, $06
	soundeffect_note $04, $D4, $A1, $06
	soundeffect_note $08, $C1, $91, $06
	endchannel

Cry_1B_Ch7_Bank13:
	soundeffect_percussion $0A, $A6, $3C
	soundeffect_percussion $0E, $94, $2C
	soundeffect_percussion $05, $A3, $3C
	soundeffect_percussion $08, $91, $2C
	endchannel

Cry_12_Ch4_Bank13:
	unknownmusic0xde $A5
	soundeffect_note $0C, $F2, $40, $04
	soundeffect_note $0F, $E3, $A0, $04
	soundeffect_note $04, $D2, $90, $04
	soundeffect_note $08, $D1, $80, $04
	endchannel

Cry_12_Ch5_Bank13:
	unknownmusic0xde $EE
	soundeffect_note $0B, $D2, $38, $04
	soundeffect_note $0E, $C6, $98, $04
	soundeffect_note $03, $B2, $88, $04
	soundeffect_note $08, $B1, $78, $04
	endchannel

Cry_12_Ch7_Bank13:
	soundeffect_percussion $0A, $E6, $6C
	soundeffect_percussion $0F, $D2, $5C
	soundeffect_percussion $03, $C2, $6C
	soundeffect_percussion $08, $D1, $5C
	endchannel

Cry_13_Ch4_Bank13:
	unknownmusic0xde $33
	soundeffect_note $0F, $F6, $C0, $05
	soundeffect_note $08, $E3, $BC, $05
	soundeffect_note $06, $D2, $D0, $05
	soundeffect_note $06, $B2, $E0, $05
	soundeffect_note $06, $C2, $F0, $05
	soundeffect_note $08, $B1, $00, $06
	endchannel

Cry_13_Ch5_Bank13:
	unknownmusic0xde $99
	soundeffect_note $0E, $C6, $B1, $04
	soundeffect_note $07, $C3, $AD, $04
	soundeffect_note $05, $B2, $C1, $04
	soundeffect_note $08, $92, $D1, $04
	soundeffect_note $06, $A2, $E1, $04
	soundeffect_note $08, $91, $F1, $04
	endchannel

Cry_13_Ch7_Bank13:
	soundeffect_percussion $0A, $E6, $5C
	soundeffect_percussion $0A, $D6, $6C
	soundeffect_percussion $04, $C2, $4C
	soundeffect_percussion $06, $D3, $5C
	soundeffect_percussion $08, $B3, $4C
	soundeffect_percussion $08, $A1, $5C
	endchannel

Cry_14_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $08, $E4, $90, $07
	soundeffect_note $0F, $F5, $C0, $07
	soundeffect_note $08, $D1, $D8, $07
	endchannel

Cry_14_Ch5_Bank13:
	unknownmusic0xde $A5
	soundeffect_note $0A, $C4, $71, $07
	soundeffect_note $0F, $B6, $A2, $07
	soundeffect_note $08, $A1, $B7, $07
	endchannel

Cry_14_Ch7_Bank13:
	soundeffect_percussion $08, $E4, $4C
	soundeffect_percussion $0E, $C4, $3C
	soundeffect_percussion $08, $D1, $2C
	endchannel

Cry_1E_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $06, $F2, $00, $06
	soundeffect_note $06, $E2, $40, $06
	soundeffect_note $06, $D2, $80, $06
	soundeffect_note $06, $E2, $C0, $06
	soundeffect_note $06, $D2, $00, $07
	soundeffect_note $06, $C2, $40, $07
	soundeffect_note $06, $B2, $80, $07
	soundeffect_note $08, $A1, $C0, $07
	endchannel

Cry_1E_Ch5_Bank13:
	unknownmusic0xde $11
	soundeffect_note $03, $08, $01, $00
	soundeffect_note $06, $C2, $C1, $05
	soundeffect_note $06, $B2, $02, $06
	soundeffect_note $06, $A2, $41, $06
	soundeffect_note $06, $B2, $82, $06
	soundeffect_note $06, $A2, $C2, $06
	soundeffect_note $06, $92, $01, $07
	soundeffect_note $06, $A2, $42, $07
	soundeffect_note $08, $81, $81, $07
	endchannel

Cry_1E_Ch7_Bank13:
	soundeffect_percussion $06, $08, $01
	soundeffect_percussion $05, $E2, $5C
	soundeffect_percussion $05, $C2, $4C
	soundeffect_percussion $05, $D2, $3C
	soundeffect_percussion $05, $B2, $2C
	soundeffect_percussion $05, $C2, $1C
	soundeffect_percussion $05, $A2, $1B
	soundeffect_percussion $05, $92, $1A
	soundeffect_percussion $08, $81, $18
	endchannel

Cry_15_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $04, $F3, $80, $07
	soundeffect_note $0F, $E7, $00, $07
	soundeffect_note $08, $D3, $10, $07
	soundeffect_note $04, $C2, $00, $07
	soundeffect_note $04, $D2, $F0, $06
	soundeffect_note $08, $C1, $E0, $06
	endchannel

Cry_15_Ch5_Bank13:
	unknownmusic0xde $5A
	soundeffect_note $06, $C3, $01, $07
	soundeffect_note $0E, $B7, $81, $06
	soundeffect_note $07, $B3, $92, $06
	soundeffect_note $03, $A2, $81, $06
	soundeffect_note $04, $B2, $72, $06
	soundeffect_note $08, $A1, $61, $06
	endchannel

Cry_15_Ch7_Bank13:
	soundeffect_percussion $06, $E3, $5C
	soundeffect_percussion $0E, $D6, $4C
	soundeffect_percussion $06, $C6, $3C
	soundeffect_percussion $03, $B3, $4C
	soundeffect_percussion $03, $A2, $5C
	soundeffect_percussion $08, $B1, $6C
	endchannel

Cry_17_Ch4_Bank13:
	unknownmusic0xde $0F
	soundeffect_note $0F, $F7, $00, $05
	soundeffect_note $0F, $E7, $08, $05
	soundeffect_note $08, $B4, $80, $04
	soundeffect_note $0F, $A2, $60, $04
	endchannel

Cry_17_Ch5_Bank13:
	unknownmusic0xde $44
	soundeffect_note $0E, $D7, $81, $04
	soundeffect_note $0E, $C7, $89, $04
	soundeffect_note $0A, $B4, $01, $04
	soundeffect_note $0F, $C2, $E1, $03
	endchannel

Cry_17_Ch7_Bank13:
	soundeffect_percussion $0E, $F7, $7C
	soundeffect_percussion $0C, $F6, $6C
	soundeffect_percussion $09, $E4, $7C
	soundeffect_percussion $0F, $E2, $6C
	endchannel

Cry_1C_Ch4_Bank13:
	unknownmusic0xde $F5
	soundeffect_note $07, $D6, $E1, $07
	soundeffect_note $06, $C6, $E2, $07
	soundeffect_note $09, $D6, $E1, $07
	soundeffect_note $07, $C6, $E0, $07
	soundeffect_note $05, $B6, $E2, $07
	soundeffect_note $07, $C6, $E1, $07
	soundeffect_note $06, $B6, $E0, $07
	soundeffect_note $08, $A1, $DF, $07
	endchannel

Cry_1C_Ch5_Bank13:
	unknownmusic0xde $44
	soundeffect_note $06, $C3, $C9, $07
	soundeffect_note $06, $B3, $C7, $07
	soundeffect_note $0A, $C4, $C3, $07
	soundeffect_note $08, $B4, $C7, $07
	soundeffect_note $06, $C3, $C9, $07
	soundeffect_note $0F, $A2, $C5, $07
	endchannel

Cry_1C_Ch7_Bank13:
	soundeffect_percussion $0D, $19, $7C
	soundeffect_percussion $0D, $F7, $8C
	soundeffect_percussion $0C, $D6, $7C
	soundeffect_percussion $08, $C4, $6C
	soundeffect_percussion $0F, $B3, $5C
	endchannel

Cry_1A_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $06, $F7, $40, $07
	soundeffect_note $0C, $E6, $44, $07
	soundeffect_note $06, $D5, $50, $07
	soundeffect_note $04, $C3, $60, $07
	soundeffect_note $03, $C3, $80, $07
	soundeffect_note $08, $D1, $A0, $07
	endchannel

Cry_1A_Ch5_Bank13:
	unknownmusic0xde $0A
	soundeffect_note $06, $C7, $01, $07
	soundeffect_note $0B, $B6, $02, $07
	soundeffect_note $06, $A5, $11, $07
	soundeffect_note $04, $93, $21, $07
	soundeffect_note $03, $A3, $41, $07
	soundeffect_note $08, $91, $62, $07
	endchannel

Cry_1A_Ch7_Bank13:
	soundeffect_percussion $03, $E2, $3C
	soundeffect_percussion $08, $D6, $4C
	soundeffect_percussion $05, $D4, $3C
	soundeffect_percussion $0C, $C7, $4C
	soundeffect_percussion $02, $E2, $3C
	soundeffect_percussion $08, $D1, $2C
	endchannel

Cry_1D_Ch4_Bank13:
	unknownmusic0xde $F4
	soundeffect_note $0F, $F0, $05, $07
	soundeffect_note $0A, $E0, $00, $07
	soundeffect_note $06, $B4, $10, $07
	soundeffect_note $04, $D3, $00, $07
	soundeffect_note $06, $B2, $20, $06
	soundeffect_note $08, $A1, $24, $06
	endchannel

Cry_1D_Ch5_Bank13:
	unknownmusic0xde $22
	soundeffect_note $0F, $B0, $C3, $06
	soundeffect_note $0A, $A0, $C1, $06
	soundeffect_note $06, $84, $D2, $06
	soundeffect_note $04, $93, $C1, $06
	soundeffect_note $06, $82, $E1, $05
	soundeffect_note $08, $61, $E8, $05
	endchannel

Cry_1D_Ch7_Bank13:
	soundeffect_percussion $06, $E6, $4C
	soundeffect_percussion $0F, $D6, $3C
	soundeffect_percussion $0A, $C5, $4A
	soundeffect_percussion $01, $B2, $5B
	soundeffect_percussion $0F, $C2, $4C
	endchannel

Cry_18_Ch4_Bank13:
	unknownmusic0xde $50
	soundeffect_note $0A, $F5, $80, $06
	soundeffect_note $03, $E2, $A0, $06
	soundeffect_note $03, $F2, $C0, $06
	soundeffect_note $03, $E2, $E0, $06
	soundeffect_note $03, $D2, $00, $07
	soundeffect_note $03, $C2, $E0, $06
	soundeffect_note $03, $D2, $C0, $06
	soundeffect_note $08, $C1, $A0, $06
	endchannel

Cry_18_Ch5_Bank13:
	unknownmusic0xde $0F
	soundeffect_note $09, $D5, $31, $06
	soundeffect_note $03, $D2, $52, $06
	soundeffect_note $03, $E2, $71, $06
	soundeffect_note $03, $B2, $91, $06
	soundeffect_note $03, $C2, $B2, $06
	soundeffect_note $03, $B2, $91, $06
	soundeffect_note $03, $C2, $71, $06
	soundeffect_note $08, $B1, $51, $06
	endchannel

Cry_18_Ch7_Bank13:
	soundeffect_percussion $06, $E3, $4C
	soundeffect_percussion $04, $C3, $3C
	soundeffect_percussion $05, $D4, $3C
	soundeffect_percussion $04, $C4, $2C
	soundeffect_percussion $06, $B4, $3C
	soundeffect_percussion $08, $C1, $2C
	endchannel

Cry_1F_Ch4_Bank13:
	unknownmusic0xde $A5
	soundeffect_note $03, $F4, $41, $06
	soundeffect_note $0D, $D6, $21, $07
	soundeffect_note $08, $F4, $19, $07
	soundeffect_note $08, $C1, $1A, $07
	endchannel

Cry_1F_Ch5_Bank13:
	unknownmusic0xde $CC
	soundeffect_note $04, $F4, $80, $05
	soundeffect_note $0E, $E6, $E0, $06
	soundeffect_note $08, $D5, $D8, $06
	soundeffect_note $08, $D1, $DC, $06
	endchannel

Cry_1F_Ch7_Bank13:
	soundeffect_percussion $05, $C4, $46
	soundeffect_percussion $0D, $A5, $44
	soundeffect_percussion $08, $C4, $45
	soundeffect_percussion $08, $B1, $44
	endchannel

Cry_20_Ch4_Bank13:
	unknownmusic0xde $F0
	soundeffect_note $0D, $F1, $11, $05
	soundeffect_note $0D, $E1, $15, $05
	soundeffect_note $0D, $E1, $11, $05
	soundeffect_note $08, $D1, $11, $05
	endchannel

Cry_20_Ch5_Bank13:
	unknownmusic0xde $15
	soundeffect_note $0C, $E1, $0C, $05
	soundeffect_note $0C, $D1, $10, $05
	soundeffect_note $0E, $C1, $0C, $05
	soundeffect_note $08, $C1, $0A, $05
	endchannel

Cry_20_Ch7_Bank13:
	soundeffect_percussion $0E, $F2, $65
	soundeffect_percussion $0D, $E2, $55
	soundeffect_percussion $0E, $D2, $56
	soundeffect_percussion $08, $D1, $66
	endchannel

Cry_21_Ch4_Bank13:
	unknownmusic0xde $1B
	soundeffect_note $03, $F3, $64, $05
	soundeffect_note $02, $E2, $44, $05
	soundeffect_note $05, $D1, $22, $05
	soundeffect_note $02, $B2, $84, $04
	soundeffect_note $08, $D1, $A2, $04
	soundeffect_note $03, $F3, $24, $05
	soundeffect_note $04, $E4, $E4, $04
	soundeffect_note $08, $D1, $02, $05
	endchannel

Cry_21_Ch5_Bank13:
	unknownmusic0xde $CC
	soundeffect_note $03, $D3, $60, $05
	soundeffect_note $02, $C2, $40, $05
	soundeffect_note $05, $C1, $20, $05
	soundeffect_note $02, $92, $80, $04
	soundeffect_note $08, $C1, $A0, $04
	soundeffect_note $03, $D3, $20, $05
	soundeffect_note $03, $C4, $E0, $04
	soundeffect_note $08, $C1, $00, $05
Cry_21_Ch7_Bank13:
	endchannel

Cry_22_Ch4_Bank13:
	unknownmusic0xde $11
	soundeffect_note $02, $3D, $81, $03
	soundeffect_note $07, $F5, $01, $06
	soundeffect_note $01, $C2, $81, $04
	soundeffect_note $08, $91, $81, $03
	endchannel

Cry_22_Ch5_Bank13:
	unknownmusic0xde $EE
	soundeffect_note $02, $3E, $B0, $05
	soundeffect_note $07, $D5, $5D, $07
	soundeffect_note $01, $B2, $B0, $06
	soundeffect_note $08, $61, $B0, $05
	endchannel

Cry_22_Ch7_Bank13:
	soundeffect_percussion $02, $92, $49
	soundeffect_percussion $07, $B5, $29
	soundeffect_percussion $01, $A2, $39
	soundeffect_percussion $08, $91, $49
	endchannel
