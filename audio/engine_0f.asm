Func_3c000: ; 0x3c000
	push hl
	push de
	push bc
	push af
	call Func_3cb1b
	ld hl, wChannel1
	ld de, wdeb0 - wChannel1
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
	call Func_3cb15
	pop af
	pop bc
	pop de
	pop hl
	ret

Func_3c042: ; 0x3c042
	ld a, [de]
	inc de
	and $7
	ld [wdeae], a
	ld c, a
	ld b, $0
	ld hl, ChannelPointers
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

Unused_3c08b: ; 3c08b
; ???
	ld hl, $c405
	ld a, $09

PlaySong_BankF: ; 0x3c090
	push de
	call Func_3c000
	pop de
	call Func_3cb1b
	ld hl, wde9b
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SongHeaderPointers0F
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
.asm_3c0ac
	push af
	call Func_3c042
	call Func_3cadf
	pop af
	dec a
	jr nz, .asm_3c0ac
	call Func_3cb15
	ret

Unused_3c0bb: ; 3c0bb
; ???
	ld bc, $cd55
	ld [hl], c
	ld d, h

PlaySoundEffect_BankF: ; 0x3c0c0
	call Func_3cb1b
	ld hl, wde9b
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SoundEffects
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
.asm_3c0d7
	push af
	call Func_3c042
	ld hl, $0002
	add hl, bc
	set 3, [hl]
	call Func_3cadf
	pop af
	dec a
	jr nz, .asm_3c0d7
	call Func_3cb15
	ret

Unused_3c0ec: ; 0x3c0ec
; ???
	db $C3, $57, $41, $CD

PlayCry_BankF: ; 0x3c0f0
; Plays a Pokemon cry.
; Input: e = mon id
	call Func_3cb1b
	ld a, e
	and a
	ret z
	dec e
	ld d, $0
	ld hl, CryData
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
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
	ld hl, CryBasePointers
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
.asm_3c12a
	push af
	call Func_3c042
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
	jr nc, .asm_3c15b
	ld hl, $0017
	add hl, bc
	ld a, [wdeaa]
	ld [hli], a
	ld a, [wdeab]
	ld [hl], a
.asm_3c15b
	call Func_3cadf
	pop af
	dec a
	jr nz, .asm_3c12a
	ld a, [wdeac]
	and a
	jr nz, .asm_3c173
	ld a, [wde98]
	ld [wdeac], a
	ld a, $77
	ld [wde98], a
.asm_3c173
	ld a, $1
	ld [wdead], a
	call Func_3cb15
	ret

Unused_3c17c; ; 0x3c17c
; ???
	db $CD, $2E, $45, $CA

Func_3c180: ; 0x3c180
	ld a, [wdd00]
	and a
	ret z
	xor a
	ld [wde97], a
	ld [wde99], a
	ld bc, wChannel1
.asm_3c18f
	ld hl, $0002
	add hl, bc
	bit 0, [hl]
	jp z, .asm_3c22d
	ld hl, $0014
	add hl, bc
	ld a, [hl]
	cp $2
	jr c, .asm_3c1a4
	dec [hl]
	jr .asm_3c1c1

.asm_3c1a4
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
	call Func_3c670
.asm_3c1c1
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
	call Func_3c4f0
	call Func_3c632
	ld a, [wdead]
	and a
	jr z, .asm_3c20a
	ld a, [wde97]
	cp $4
	jr nc, .asm_3c219
	ld hl, wChannel5 + 2
	bit 0, [hl]
	jr nz, .asm_3c204
	ld hl, wChannel6 + 2
	bit 0, [hl]
	jr nz, .asm_3c204
	ld hl, wChannel7 + 2
	bit 0, [hl]
	jr nz, .asm_3c204
	ld hl, wChannel8 + 2
	bit 0, [hl]
	jr z, .asm_3c20a
.asm_3c204
	ld hl, $000b
	add hl, bc
	set 5, [hl]
.asm_3c20a
	ld a, [wde97]
	cp $4
	jr nc, .asm_3c219
	ld hl, $00ca
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_3c227
.asm_3c219
	call Func_3c24d
	ld hl, $0019
	add hl, bc
	ld a, [wde99]
	or [hl]
	ld [wde99], a
.asm_3c227
	ld hl, $000b
	add hl, bc
	xor a
	ld [hl], a
.asm_3c22d
	ld hl, $0032
	add hl, bc
	ld c, l
	ld b, h
	ld a, [wde97]
	inc a
	ld [wde97], a
	cp $8
	jp nz, .asm_3c18f
	call Func_3c40d
	ld a, [wde98]
	ld [rNR50], a
	ld a, [wde99]
	ld [rNR51], a
	ret

Func_3c24d: ; 0x3c24d
	ld hl, PointerTable_3c25e
	ld a, [wde97]
	and $7
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

PointerTable_3c25e: ; 0x3c25e
	dw Func_3c26e
	dw Func_3c2e0
	dw Func_3c349
	dw Func_3c3cf
	dw Func_3c26e
	dw Func_3c2e0
	dw Func_3c349
	dw Func_3c3cf

Func_3c26e: ; 0x3c26e
	ld hl, $000b
	add hl, bc
	bit 3, [hl]
	jr z, .asm_3c27b
	ld a, [wde9a]
	ld [rNR10], a
.asm_3c27b
	bit 5, [hl]
	jr nz, .asm_3c2ba
	bit 4, [hl]
	jr nz, .asm_3c2c6
	bit 6, [hl]
	jr nz, .asm_3c2b4
	bit 1, [hl]
	jr z, .asm_3c295
	ld a, [wde93]
	ld [rNR13], a
	ld a, [wde94]
	ld [rNR14], a
.asm_3c295
	bit 2, [hl]
	jr z, .asm_3c2a5
	ld a, [wde92]
	ld [rNR12], a
	ld a, [wde94]
	or $80
	ld [rNR14], a
.asm_3c2a5
	bit 0, [hl]
	ret z
	ld a, [wde91]
	ld d, a
	ld a, [rNR11]
	and $3f
	or d
	ld [rNR11], a
	ret

.asm_3c2b4
	ld a, [wde93]
	ld [rNR13], a
	ret

.asm_3c2ba
	ld a, $8
	ld [rNR12], a
	ld a, [wde94]
	or $80
	ld [rNR14], a
	ret

.asm_3c2c6
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

Func_3c2e0: ; 0x3c2e0
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_3c323
	bit 4, [hl]
	jr nz, .asm_3c32f
	bit 6, [hl]
	jr nz, .asm_3c31d
	bit 1, [hl]
	jr z, .asm_3c2fe
	ld a, [wde93]
	ld [rNR23], a
	ld a, [wde94]
	ld [rNR24], a
.asm_3c2fe
	bit 2, [hl]
	jr z, .asm_3c30e
	ld a, [wde92]
	ld [rNR22], a
	ld a, [wde94]
	or $80
	ld [rNR24], a
.asm_3c30e
	bit 0, [hl]
	ret z
	ld a, [wde91]
	ld d, a
	ld a, [rNR21]
	and $3f
	or d
	ld [rNR21], a
	ret

.asm_3c31d
	ld a, [wde93]
	ld [rNR23], a
	ret

.asm_3c323
	ld a, $8
	ld [rNR22], a
	ld a, [wde94]
	or $80
	ld [rNR24], a
	ret

.asm_3c32f
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

Func_3c349: ; 0x3c349
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_3c387
	bit 4, [hl]
	jr nz, .asm_3c38b
	bit 6, [hl]
	jr nz, .asm_3c381
	bit 1, [hl]
	jr z, .asm_3c367
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	ld [rNR34], a
.asm_3c367
	bit 2, [hl]
	ret z
	xor a
	ld [rNR30], a
	call LoadWavePattern
	ld a, $80
	ld [rNR30], a
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	or $80
	ld [rNR34], a
	ret

.asm_3c381
	ld a, [wde93]
	ld [rNR33], a
	ret

.asm_3c387
	xor a
	ld [rNR30], a
	ret

.asm_3c38b
	ld a, $3f
	ld [rNR31], a
	xor a
	ld [rNR30], a
	call LoadWavePattern
	ld a, $80
	ld [rNR30], a
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	or $80
	ld [rNR34], a
	ret

LoadWavePattern: ; 0x3c3a6
	push hl
	ld a, [wde92]
	and $f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, WavePatterns_BankF
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

Func_3c3cf: ; 0x3c3cf
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_3c3f1
	bit 4, [hl]
	jr nz, .asm_3c3fa
	bit 1, [hl]
	jr z, .asm_3c3e4
	ld a, [wde93]
	ld [rNR43], a
.asm_3c3e4
	bit 2, [hl]
	ret z
	ld a, [wde92]
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

.asm_3c3f1
	ld a, $8
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

.asm_3c3fa
	ld a, $3f
	ld [rNR41], a
	ld a, [wde92]
	ld [rNR42], a
	ld a, [wde93]
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	ret

Func_3c40d: ; 0x3c40d
	ld a, [wdea2]
	and a
	ret z
	ld a, [wdea3]
	and a
	jr z, .asm_3c41d
	dec a
	ld [wdea3], a
	ret

.asm_3c41d
	ld a, [wdea2]
	ld d, a
	and $7f
	ld [wdea3], a
	ld a, [wde98]
	and $7
	bit 7, d
	jr nz, .asm_3c448
	and a
	jr z, .asm_3c435
	dec a
	jr .asm_3c454

.asm_3c435
	ld a, [wdea4]
	ld e, a
	ld a, [wdea5]
	ld d, a
	push bc
	call PlaySong_BankF
	pop bc
	ld hl, wdea2
	set 7, [hl]
	ret

.asm_3c448
	cp $7
	jr nc, .asm_3c44f
	inc a
	jr .asm_3c454

.asm_3c44f
	xor a
	ld [wdea2], a
	ret

.asm_3c454
	ld d, a
	swap a
	or d
	ld [wde98], a
	ret

Func_3c45c: ; 0x3c45c
	ld hl, $0003
	add hl, bc
	bit 1, [hl]
	ret z
	ld hl, $0014
	add hl, bc
	ld a, [hl]
	ld hl, wde95
	sub [hl]
	jr nc, .asm_3c470
	ld a, $1
.asm_3c470
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
	jr nc, .asm_3c4ab
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
	jr .asm_3c4c9

.asm_3c4ab
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
.asm_3c4c9
	push bc
	ld hl, wde95
	ld b, $0
.asm_3c4cf
	inc b
	ld a, e
	sub [hl]
	ld e, a
	jr nc, .asm_3c4cf
	ld a, d
	and a
	jr z, .asm_3c4dc
	dec d
	jr .asm_3c4cf

.asm_3c4dc
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

Func_3c4f0: ; 0x3c4f0
	ld hl, $0003
	add hl, bc
	bit 2, [hl]
	jr z, .asm_3c50b
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
.asm_3c50b
	ld hl, $0003
	add hl, bc
	bit 4, [hl]
	jr z, .asm_3c529
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
.asm_3c529
	ld hl, $0003
	add hl, bc
	bit 1, [hl]
	jp z, .asm_3c5c1
	ld hl, $000f
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0004
	add hl, bc
	bit 1, [hl]
	jr z, .asm_3c574
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
	jp c, .asm_3c5a1
	jr nz, .asm_3c5b4
	ld hl, $001f
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .asm_3c5a1
	jr .asm_3c5b4

.asm_3c574
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
	jr c, .asm_3c5a1
	jr nz, .asm_3c5b4
	ld hl, $001f
	add hl, bc
	ld a, e
	cp [hl]
	jr nc, .asm_3c5b4
.asm_3c5a1
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
.asm_3c5b4
	ld hl, $000f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $000b
	add hl, bc
	set 1, [hl]
.asm_3c5c1
	ld hl, $0003
	add hl, bc
	bit 0, [hl]
	jr z, .asm_3c61a
	ld hl, $001b
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_3c5e3
	ld hl, $001d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_3c61a
	ld d, a
	ld hl, $001e
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .asm_3c5e6
.asm_3c5e3
	dec [hl]
	jr .asm_3c61a

.asm_3c5e6
	ld a, [hl]
	swap [hl]
	or [hl]
	ld [hl], a
	ld a, [wde93]
	ld e, a
	ld hl, $0004
	add hl, bc
	bit 0, [hl]
	jr z, .asm_3c605
	res 0, [hl]
	ld a, d
	and $f
	ld d, a
	ld a, e
	sub d
	jr nc, .asm_3c611
	ld a, $0
	jr .asm_3c611

.asm_3c605
	set 0, [hl]
	ld a, d
	and $f0
	swap a
	add e
	jr nc, .asm_3c611
	ld a, $ff
.asm_3c611
	ld [wde93], a
	ld hl, $000b
	add hl, bc
	set 6, [hl]
.asm_3c61a
	ld hl, $0003
	add hl, bc
	bit 3, [hl]
	ret z
	ld hl, $0024
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_3c62b
	dec [hl]
	ret

.asm_3c62b
	ld hl, $000b
	add hl, bc
	set 5, [hl]
	ret

Func_3c632: ; 0x3c632
	ld hl, $0002
	add hl, bc
	bit 4, [hl]
	ret z
	ld a, [wde9f]
	and a
	jr z, .asm_3c644
	dec a
	ld [wde9f], a
	ret

.asm_3c644
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

Func_3c670: ; 0x3c670
	call Func_3ca10
	cp $ff
	jr z, .asm_3c6c9
	cp $d0
	jr c, .asm_3c680
.asm_3c67b
	call Func_3c786
	jr Func_3c670

.asm_3c680
	ld hl, $0002
	add hl, bc
	bit 3, [hl]
	jp nz, Func_3c723
	bit 5, [hl]
	jp nz, Func_3c723
	bit 4, [hl]
	jp nz, Func_3c750
	ld a, [wde96]
	and $f
	call Func_3ca5b
	ld a, [wde96]
	swap a
	and $f
	jr z, .asm_3c6c2
	ld hl, $0011
	add hl, bc
	ld [hl], a
	ld e, a
	ld hl, $0012
	add hl, bc
	ld d, [hl]
	call Func_3ca2b
	ld hl, $000f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $000b
	add hl, bc
	set 4, [hl]
	jp Func_3c45c

.asm_3c6c2
	ld hl, $000b
	add hl, bc
	set 5, [hl]
	ret

.asm_3c6c9
	ld hl, $0002
	add hl, bc
	bit 1, [hl]
	jr nz, .asm_3c67b
	ld a, [wde97]
	cp $4
	jr nc, .asm_3c6e0
	ld hl, $00ca
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_3c6f6
.asm_3c6e0
	ld hl, $0002
	add hl, bc
	bit 5, [hl]
	call nz, Func_3c704
	ld a, [wde97]
	cp $4
	jr nz, .asm_3c6f6
	xor a
	ld [rNR10], a
	ld [wde9a], a
.asm_3c6f6
	ld hl, $0002
	add hl, bc
	res 0, [hl]
	ld hl, $0000
	add hl, bc
	xor a
	ld [hli], a
	ld [hli], a
	ret

Func_3c704: ; 0x3c704
	ld a, [wde97]
	cp $4
	ret nz
	xor a
	ld hl, wChannel6 + $26
	ld [hli], a
	ld [hl], a
	ld hl, wChannel8 + $26
	ld [hli], a
	ld [hl], a
	ld a, [wdeac]
	ld [wde98], a
	xor a
	ld [wdeac], a
	ld [wdead], a
	ret

Func_3c723: ; 0x3c723
	ld hl, $000b
	add hl, bc
	set 4, [hl]
	ld a, [wde96]
	call Func_3ca5b
	call Func_3ca10
	ld hl, $000e
	add hl, bc
	ld [hl], a
	call Func_3ca10
	ld hl, $000f
	add hl, bc
	ld [hl], a
	ld a, [wde97]
	and $3
	cp $3
	ret z
	call Func_3ca10
	ld hl, $0010
	add hl, bc
	ld [hl], a
	ret

Func_3c750: ; 0x3c750
	ld a, [wde97]
	cp $3
	ret nz
	ld a, [wde96]
	and $f
	call Func_3ca5b
	ld a, [wdea1]
	ld e, a
	ld d, $0
	ld hl, Data_3cba2
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

Func_3c786: ; 0x3c786
	ld a, [wde96]
	sub $d0
	ld e, a
	ld d, $0
	ld hl, PointerTable_3c797
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

PointerTable_3c797: ; 0x3c797
	dw Func_3c9b6
	dw Func_3c9b6
	dw Func_3c9b6
	dw Func_3c9b6
	dw Func_3c9b6
	dw Func_3c9b6
	dw Func_3c9b6
	dw Func_3c9b6
	dw Func_3c973
	dw Func_3c9c1
	dw Func_3c9aa
	dw Func_3c994
	dw Func_3c9a1
	dw Func_3c987
	dw Func_3c939
	dw Func_3c951
	dw Func_3c8ff
	dw Func_3c8c4
	dw Func_3c8b5
	dw Func_3c95f
	dw Func_3c9ca
	dw Func_3c9da
	dw Func_3c926
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c9e9
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3ca05
	dw Func_3ca0b
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c7f7
	dw Func_3c885
	dw Func_3c88e
	dw Func_3c833
	dw Func_3c843
	dw Func_3c80d
	dw Func_3c7f8

Func_3c7f7: ; 0x3c7f7
	ret

Func_3c7f8: ; 0x3c7f8
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

Func_3c80d: ; 0x3c80d
	call Func_3ca10
	ld e, a
	call Func_3ca10
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

Func_3c833: ; 0x3c833
	call Func_3ca10
	ld e, a
	call Func_3ca10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_3c843: ; 0x3c843
	call Func_3ca10
	ld hl, $0002
	add hl, bc
	bit 2, [hl]
	jr nz, .asm_3c859
	and a
	jr z, .asm_3c862
	dec a
	set 2, [hl]
	ld hl, $0016
	add hl, bc
	ld [hl], a
.asm_3c859
	ld hl, $0016
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_3c872
	dec [hl]
.asm_3c862
	call Func_3ca10
	ld e, a
	call Func_3ca10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.asm_3c872
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

Func_3c885: ; 0x3c885
	call Func_3ca10
	ld hl, $000c
	add hl, bc
	ld [hl], a
	ret

Func_3c88e: ; 0x3c88e
	call Func_3ca10
	ld hl, $000c
	add hl, bc
	cp [hl]
	jr z, .asm_3c8a5
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

.asm_3c8a5
	call Func_3ca10
	ld e, a
	call Func_3ca10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_3c8b5: ; 0x3c8b5
	call Func_3ca10
	ld hl, $0025
	add hl, bc
	ld [hl], a
	ld hl, $0003
	add hl, bc
	set 3, [hl]
	ret

Func_3c8c4: ; 0x3c8c4
	ld hl, $0003
	add hl, bc
	set 0, [hl]
	ld hl, $0004
	add hl, bc
	res 0, [hl]
	call Func_3ca10
	ld hl, $001c
	add hl, bc
	ld [hl], a
	ld hl, $001b
	add hl, bc
	ld [hl], a
	call Func_3ca10
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

Func_3c8ff: ; 0x3c8ff
	call Func_3ca10
	ld [wde95], a
	call Func_3ca10
	ld d, a
	and $f
	ld e, a
	ld a, d
	swap a
	and $f
	ld d, a
	call Func_3ca2b
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

Func_3c926: ; 0x3c926
	ld hl, $0003
	add hl, bc
	set 4, [hl]
	ld hl, $0027
	add hl, bc
	call Func_3ca10
	ld [hld], a
	call Func_3ca10
	ld [hl], a
	ret

Func_3c939: ; 0x3c939
	ld hl, $0003
	add hl, bc
	set 2, [hl]
	call Func_3ca10
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

Func_3c951: ; 0x3c951
	ld hl, $0002
	add hl, bc
	bit 3, [hl]
	jr z, .asm_3c95c
	res 3, [hl]
	ret

.asm_3c95c
	set 3, [hl]
	ret

Func_3c95f: ; 0x3c95f
	ld hl, $0002
	add hl, bc
	bit 4, [hl]
	jr z, .asm_3c96a
	res 4, [hl]
	ret

.asm_3c96a
	set 4, [hl]
	call Func_3ca10
	ld [wdea1], a
	ret

Func_3c973: ; 0x3c973
	call Func_3ca10
	ld hl, $0028
	add hl, bc
	ld [hl], a
	ld a, [wde97]
	and $3
	cp $3
	ret z
	call Func_3c9a1
	ret

Func_3c987: ; 0x3c987
	call Func_3ca10
	ld [wde9a], a
	ld hl, $000b
	add hl, bc
	set 3, [hl]
	ret

Func_3c994: ; 0x3c994
	call Func_3ca10
	rrca
	rrca
	and $c0
	ld hl, $000d
	add hl, bc
	ld [hl], a
	ret

Func_3c9a1: ; 0x3c9a1
	call Func_3ca10
	ld hl, $000e
	add hl, bc
	ld [hl], a
	ret

Func_3c9aa: ; 0x3c9aa
	call Func_3ca10
	ld d, a
	call Func_3ca10
	ld e, a
	call Func_3ca95
	ret

Func_3c9b6: ; 0x3c9b6
	ld hl, $0012
	add hl, bc
	ld a, [wde96]
	and $7
	ld [hl], a
	ret

Func_3c9c1: ; 0x3c9c1
	call Func_3ca10
	ld hl, $0013
	add hl, bc
	ld [hl], a
	ret

Func_3c9ca: ; 0x3c9ca
	ld a, [wde97]
	call Func_3caf4
	call Func_3ca10
	ld hl, $0019
	add hl, bc
	and [hl]
	ld [hl], a
	ret

Func_3c9da: ; 0x3c9da
	call Func_3ca10
	ld a, [wdea2]
	and a
	ret nz
	ld a, [wde96]
	ld [wde98], a
	ret

Func_3c9e9: ; 0x3c9e9
	call Func_3ca10
	; cast to s16
	ld e, a
	cp $80
	jr nc, .asm_3c9f5
	ld d, $0
	jr .asm_3c9f7

.asm_3c9f5
	ld d, $ff
.asm_3c9f7
	ld hl, $0017
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call Func_3ca95
	ret

Func_3ca05: ; 0x3ca05
	ld a, $1
	ld [wdead], a
	ret

Func_3ca0b: ; 0x3ca0b
	xor a
	ld [wdead], a
	ret

Func_3ca10: ; 0x3ca10
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

Func_3ca2b: ; 0x3ca2b
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
	ld de, Data_3cb20 
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop af
.asm_3ca4b
	cp $7
	jr nc, .asm_3ca56
	sra d
	rr e
	inc a
	jr .asm_3ca4b

.asm_3ca56
	ld a, d
	and $7
	ld d, a
	ret

Func_3ca5b: ; 0x3ca5b
	inc a
	ld e, a
	ld d, $0
	ld hl, $0028
	add hl, bc
	ld a, [hl]
	ld l, $0
	call Func_3ca86
	ld a, l
	ld hl, $0017
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0015
	add hl, bc
	ld l, [hl]
	call Func_3ca86
	ld e, l
	ld d, h
	ld hl, $0015
	add hl, bc
	ld [hl], e
	ld hl, $0014
	add hl, bc
	ld [hl], d
	ret

Func_3ca86: ; 0x3ca86
	ld h, $0
.asm_3ca88
	srl a
	jr nc, .asm_3ca8d
	add hl, de
.asm_3ca8d
	sla e
	rl d
	and a
	jr nz, .asm_3ca88
	ret

Func_3ca95: ; 0x3ca95
	push bc
	ld a, [wde97]
	cp $4
	jr nc, .asm_3cab7
	ld bc, wChannel1
	call Func_3cad1
	ld bc, wChannel2
	call Func_3cad1
	ld bc, wChannel3
	call Func_3cad1
	ld bc, wChannel4
	call Func_3cad1
	jr .asm_3cacf

.asm_3cab7
	ld bc, wChannel5
	call Func_3cad1
	ld bc, wChannel6
	call Func_3cad1
	ld bc, wChannel7
	call Func_3cad1
	ld bc, wChannel8
	call Func_3cad1
.asm_3cacf
	pop bc
	ret

Func_3cad1: ; 0x3cad1
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

Func_3cadf: ; 0x3cadf
	call Func_3cb06
	ld a, [wdeae]
	jr .asm_3caea

	ld a, [wde97]
.asm_3caea
	call Func_3caf4
	ld hl, $0002
	add hl, bc
	set 0, [hl]
	ret

Func_3caf4: ; 0x3caf4
	push de
	and $3
	ld e, a
	ld d, $0
	ld hl, Data_3cc8e
	add hl, de
	ld a, [hl]
	ld hl, $0019
	add hl, bc
	ld [hl], a
	pop de
	ret

Func_3cb06: ; 0x3cb06
	ld a, [wdeae]
	and $3
	cp $0
	ret nz
	xor a
	ld [rNR10], a
	ld [wde9a], a
	ret

Func_3cb15: ; 0x3cb15
	ld a, $1
	ld [wdd00], a
	ret

Func_3cb1b: ; 0x3cb1b
	xor a
	ld [wdd00], a
	ret

Data_3cb20:
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

WavePatterns_BankF:
WavePattern0_BankF: ; 0x3cb52
	db $02, $46, $8A, $CE, $FF, $FE, $ED, $DC, $CB, $A9, $87, $65, $44, $33, $22, $11
WavePattern1_BankF: ; 0x3cb62
	db $02, $46, $8A, $CE, $EF, $FF, $FE, $EE, $DD, $CB, $A9, $87, $65, $43, $22, $11
WavePattern2_BankF: ; 0x3cb72
	db $01, $23, $43, $21, $FE, $CA, $8A, $CE, $01, $23, $43, $21, $FE, $CA, $8A, $CE
WavePattern3_BankF: ; 0x3cb82
	db $00, $11, $22, $33, $44, $33, $22, $11, $FF, $EE, $CC, $AA, $88, $AA, $CC, $EE
WavePattern4_BankF: ; 0x3cb92
	db $00, $11, $22, $33, $44, $33, $22, $11, $FF, $EE, $CC, $AA, $88, $AA, $CC, $EE

Data_3cba2:
; related to percussion instruments
	dw Data_3cbae
	dw Data_3cbce
	dw Data_3cbee
	dw Data_3cbee
	dw Data_3cbee
	dw Data_3cbee

Data_3cbae: ; 0x3cbae
	dw Data_3cc12
	dw Data_3cc13
	dw Data_3cc17
	dw Data_3cc1b
	dw Data_3cc1f
	dw Data_3cc26
	dw Data_3cc0e
	dw Data_3cc31
	dw Data_3cc35
	dw Data_3cc3c
	dw Data_3cc43
	dw Data_3cc47
	dw Data_3cc64
	dw Data_3cc12
	dw Data_3cc12
	dw Data_3cc12

Data_3cbce: ; 0x3cbce
	dw Data_3cc12
	dw Data_3cc0e
	dw Data_3cc17
	dw Data_3cc1b
	dw Data_3cc1f
	dw Data_3cc60
	dw Data_3cc2d
	dw Data_3cc68
	dw Data_3cc52
	dw Data_3cc59
	dw Data_3cc87
	dw Data_3cc47
	dw Data_3cc4b
	dw Data_3cc12
	dw Data_3cc12
	dw Data_3cc12

Data_3cbee: ; 0x3cbee
	dw Data_3cc12
	dw Data_3cc43
	dw Data_3cc47
	dw Data_3cc1b
	dw Data_3cc1f
	dw Data_3cc6f
	dw Data_3cc73
	dw Data_3cc77
	dw Data_3cc35
	dw Data_3cc3c
	dw Data_3cc7b
	dw Data_3cc7f
	dw Data_3cc83
	dw Data_3cc12
	dw Data_3cc12
	dw Data_3cc12

Data_3cc0e: ; 0x3cc0e
	db $20, $11, $11
	db $FF ; terminator

Data_3cc12: ; 0x3cc12
	db $FF ; terminator

Data_3cc13: ; 0x3cc13
	db $20, $91, $33
	db $FF ; terminator

Data_3cc17: ; 0x3cc17
	db $20, $51, $32
	db $FF ; terminator

Data_3cc1b: ; 0x3cc1b
	db $20, $81, $31
	db $FF ; terminator

Data_3cc1f: ; 0x3cc1f
	db $21, $71, $70, $20, $11, $11
	db $FF ; terminator

Data_3cc26: ; 0x3cc26
	db $30, $82, $4C, $22, $61, $20
	db $FF ; terminator

Data_3cc2d: ; 0x3cc2d
	db $30, $91, $18
	db $FF ; terminator

Data_3cc31: ; 0x3cc31
	db $27, $92, $10
	db $FF ; terminator

Data_3cc35: ; 0x3cc35
	db $33, $91, $00, $33, $11, $00
	db $FF ; terminator

Data_3cc3c: ; 0x3cc3c
	db $33, $91, $11, $33, $11, $00
	db $FF ; terminator

Data_3cc43: ; 0x3cc43
	db $01, $18, $01
	db $FF ; terminator

Data_3cc47: ; 0x3cc47
	db $01, $28, $01
	db $FF ; terminator

Data_3cc4b: ; 0x3cc4b
	db $33, $88, $15, $20, $65, $12
	db $FF ; terminator

Data_3cc52: ; 0x3cc52
	db $33, $51, $21, $33, $11, $11
	db $FF ; terminator

Data_3cc59: ; 0x3cc59
	db $33, $51, $50, $33, $11, $11
	db $FF ; terminator

Data_3cc60: ; 0x3cc60
	db $20, $A1, $31
	db $FF ; terminator

Data_3cc64: ; 0x3cc64
	db $20, $84, $12
	db $FF ; terminator

Data_3cc68: ; 0x3cc68
	db $33, $81, $00, $33, $11, $00
	db $FF ; terminator

Data_3cc6f: ; 0x3cc6f
	db $01, $38, $01
	db $FF ; terminator

Data_3cc73: ; 0x3cc73
	db $01, $48, $01
	db $FF ; terminator

Data_3cc77: ; 0x3cc77
	db $01, $58, $01
	db $FF ; terminator

Data_3cc7b: ; 0x3cc7b
	db $01, $68, $01
	db $FF ; terminator

Data_3cc7f: ; 0x3cc7f
	db $01, $78, $01
	db $FF ; terminator

Data_3cc83: ; 0x3cc83
	db $01, $88, $01
	db $FF ; terminator

Data_3cc87: ; 0x3cc87
	db $33, $81, $21, $33, $11, $11
	db $FF ; terminator

Data_3cc8e: ; 0x3cc8e
	db $11, $22, $44, $88

ChannelPointers: ; 0x3cc92
	dw wChannel1
	dw wChannel2
	dw wChannel3
	dw wChannel4
	dw wChannel5
	dw wChannel6
	dw wChannel7
	dw wChannel8

SongHeaderPointers0F: ; 0x3cca2
	dw Music_Nothing0F
	dw Music_BlueField
	dw Music_CatchEmRed
	dw Music_HurryUpRed
	dw Music_Pokedex
	dw Music_GastlyInTheGraveyard
	dw Music_HaunterInTheGraveyard
	dw Music_GengarInTheGraveyard

INCLUDE "audio/music/nothing0f.asm"
INCLUDE "audio/music/bluefield.asm"
INCLUDE "audio/music/catchemred.asm"
INCLUDE "audio/music/pokedex.asm"
INCLUDE "audio/music/hurryupred.asm"
INCLUDE "audio/music/gastlyinthegraveyard.asm"
INCLUDE "audio/music/haunterinthegraveyard.asm"
INCLUDE "audio/music/gengarinthegraveyard.asm"

SoundEffects: ; 0x3e3ce
	dw SoundEffect0
	dw SoundEffect1
	dw SoundEffect2
	dw SoundEffect3
	dw SoundEffect4
	dw SoundEffect5
	dw SoundEffect6
	dw SoundEffect7
	dw SoundEffect8
	dw SoundEffect9
	dw SoundEffect10
	dw SoundEffect11
	dw SoundEffect12
	dw SoundEffect13
	dw SoundEffect14
	dw SoundEffect15
	dw SoundEffect16
	dw SoundEffect17
	dw SoundEffect18
	dw SoundEffect19
	dw SoundEffect20
	dw SoundEffect21
	dw SoundEffect22
	dw SoundEffect23
	dw SoundEffect24
	dw SoundEffect25
	dw SoundEffect26
	dw SoundEffect27
	dw SoundEffect28
	dw SoundEffect29
	dw SoundEffect30
	dw SoundEffect31
	dw SoundEffect32
	dw SoundEffect33
	dw SoundEffect34
	dw SoundEffect35
	dw SoundEffect36
	dw SoundEffect37
	dw SoundEffect38
	dw SoundEffect39
	dw SoundEffect40
	dw SoundEffect41
	dw SoundEffect42
	dw SoundEffect43
	dw SoundEffect44
	dw SoundEffect45
	dw SoundEffect46
	dw SoundEffect47
	dw SoundEffect48
	dw SoundEffect49
	dw SoundEffect50
	dw SoundEffect51
	dw SoundEffect52
	dw SoundEffect53
	dw SoundEffect54
	dw SoundEffect55
	dw SoundEffect56
	dw SoundEffect57
	dw SoundEffect58
	dw SoundEffect59
	dw SoundEffect60
	dw SoundEffect61
	dw SoundEffect62
	dw SoundEffect63
	dw SoundEffect64
	dw SoundEffect65
	dw SoundEffect66
	dw SoundEffect67
	dw SoundEffect68
	dw SoundEffect69
	dw SoundEffect70
	dw SoundEffect71
	dw SoundEffect72
	dw SoundEffect73
	dw SoundEffect74
	dw SoundEffect75
	dw SoundEffect76
	dw SoundEffect77

SoundEffect0: ; 0x3e46a
	dr $3e46a, $3e480

SoundEffect1: ; 0x3e480
	dr $3e480, $3e49a

SoundEffect2: ; 0x3e49a
	dr $3e49a, $3e4ba

SoundEffect3: ; 0x3e4ba
	dr $3e4ba, $3e4d0

SoundEffect4: ; 0x3e4d0
	dr $3e4d0, $3e4e0

SoundEffect5: ; 0x3e4e0
	dr $3e4e0, $3e4f0

SoundEffect6: ; 0x3e4f0
	dr $3e4f0, $3e500

SoundEffect7: ; 0x3e500
	dr $3e500, $3e51a

SoundEffect8: ; 0x3e51a
	dr $3e51a, $3e52e

SoundEffect9: ; 0x3e52e
	dr $3e52e, $3e544

SoundEffect10: ; 0x3e544
	dr $3e544, $3e554

SoundEffect11: ; 0x3e554
	dr $3e554, $3e57c

SoundEffect12: ; 0x3e57c
	dr $3e57c, $3e589

SoundEffect13: ; 0x3e589
	dr $3e589, $3e59f

SoundEffect14: ; 0x3e59f
	dr $3e59f, $3e5b5

SoundEffect15: ; 0x3e5b5
	dr $3e5b5, $3e5c5

SoundEffect16: ; 0x3e5c5
	dr $3e5c5, $3e5e2

SoundEffect17: ; 0x3e5e2
	dr $3e5e2, $3e5f4

SoundEffect18: ; 0x3e5f4
	dr $3e5f4, $3e606

SoundEffect19: ; 0x3e606
	dr $3e606, $3e618

SoundEffect20: ; 0x3e618
	dr $3e618, $3e62a

SoundEffect21: ; 0x3e62a
	dr $3e62a, $3e63c

SoundEffect22: ; 0x3e63c
	dr $3e63c, $3e64e

SoundEffect23: ; 0x3e64e
	dr $3e64e, $3e660

SoundEffect24: ; 0x3e660
	dr $3e660, $3e672

SoundEffect25: ; 0x3e672
	dr $3e672, $3e684

SoundEffect26: ; 0x3e684
	dr $3e684, $3e696

SoundEffect27: ; 0x3e696
	dr $3e696, $3e6a8

SoundEffect28: ; 0x3e6a8
	dr $3e6a8, $3e6ba

SoundEffect29: ; 0x3e6ba
	dr $3e6ba, $3e6cc

SoundEffect30: ; 0x3e6cc
	dr $3e6cc, $3e6de

SoundEffect31: ; 0x3e6de
	dr $3e6de, $3e6f0

SoundEffect32: ; 0x3e6f0
	dr $3e6f0, $3e702

SoundEffect33: ; 0x3e702
	dr $3e702, $3e71a

SoundEffect34: ; 0x3e71a
	dr $3e71a, $3e75d

SoundEffect35: ; 0x3e75d
	dr $3e75d, $3e810

SoundEffect36: ; 0x3e810
	dr $3e810, $3e8ae

SoundEffect37: ; 0x3e8ae
	dr $3e8ae, $3e96d

SoundEffect38: ; 0x3e96d
	dr $3e96d, $3ea25

SoundEffect39: ; 0x3ea25
	dr $3ea25, $3ea68

SoundEffect40: ; 0x3ea68
	dr $3ea68, $3ea82

SoundEffect41: ; 0x3ea82
	dr $3ea82, $3eb17

SoundEffect42: ; 0x3eb17
	dr $3eb17, $3ebf9

SoundEffect43: ; 0x3ebf9
	dr $3ebf9, $3ec17

SoundEffect44: ; 0x3ec17
	dr $3ec17, $3ec31

SoundEffect45: ; 0x3ec31
	dr $3ec31, $3ec4b

SoundEffect46: ; 0x3ec4b
	dr $3ec4b, $3ec7d

SoundEffect47: ; 0x3ec7d
	dr $3ec7d, $3ec8f

SoundEffect48: ; 0x3ec8f
	dr $3ec8f, $3eca7

SoundEffect49: ; 0x3eca7
	dr $3eca7, $3ecb7

SoundEffect50: ; 0x3ecb7
	dr $3ecb7, $3ecd1

SoundEffect51: ; 0x3ecd1
	dr $3ecd1, $3ece9

SoundEffect52: ; 0x3ece9
	dr $3ece9, $3ecff

SoundEffect53: ; 0x3ecff
	dr $3ecff, $3ed15

SoundEffect54: ; 0x3ed15
	dr $3ed15, $3ed31

SoundEffect55: ; 0x3ed31
	dr $3ed31, $3ed4d

SoundEffect56: ; 0x3ed4d
	dr $3ed4d, $3ed65

SoundEffect57: ; 0x3ed65
	dr $3ed65, $3ed78

SoundEffect58: ; 0x3ed78
	dr $3ed78, $3ed98

SoundEffect59: ; 0x3ed98
	dr $3ed98, $3edb0

SoundEffect60: ; 0x3edb0
	dr $3edb0, $3edc0

SoundEffect61: ; 0x3edc0
	dr $3edc0, $3edd0

SoundEffect62: ; 0x3edd0
	dr $3edd0, $3ede3

SoundEffect63: ; 0x3ede3
	dr $3ede3, $3edf3

SoundEffect64: ; 0x3edf3
	dr $3edf3, $3ee1c

SoundEffect65: ; 0x3ee1c
	dr $3ee1c, $3ee32

SoundEffect66: ; 0x3ee32
	dr $3ee32, $3ee48

SoundEffect67: ; 0x3ee48
	dr $3ee48, $3ee5e

SoundEffect68: ; 0x3ee5e
	dr $3ee5e, $3ee78

SoundEffect69: ; 0x3ee78
	dr $3ee78, $3ee92

SoundEffect70: ; 0x3ee92
	dr $3ee92, $3eeaa

SoundEffect71: ; 0x3eeaa
	dr $3eeaa, $3eec4

SoundEffect72: ; 0x3eec4
	dr $3eec4, $3eed4

SoundEffect73: ; 0x3eed4
	dr $3eed4, $3eeea

SoundEffect74: ; 0x3eeea
	dr $3eeea, $3ef00

SoundEffect75: ; 0x3ef00
	dr $3ef00, $3ef16

SoundEffect76: ; 0x3ef16
	dr $3ef16, $3ef27

SoundEffect77: ; 0x3ef27
	dr $3ef27, $3ef63

CryBasePointers: ; 0x3ef63
	dw Cry_00_Header_BankF
	dw Cry_01_Header_BankF
	dw Cry_02_Header_BankF
	dw Cry_03_Header_BankF
	dw Cry_04_Header_BankF
	dw Cry_05_Header_BankF
	dw Cry_06_Header_BankF
	dw Cry_07_Header_BankF
	dw Cry_08_Header_BankF
	dw Cry_09_Header_BankF
	dw Cry_0A_Header_BankF
	dw Cry_0B_Header_BankF
	dw Cry_0C_Header_BankF
	dw Cry_0D_Header_BankF
	dw Cry_0E_Header_BankF
	dw Cry_0F_Header_BankF
	dw Cry_10_Header_BankF
	dw Cry_11_Header_BankF
	dw Cry_12_Header_BankF
	dw Cry_13_Header_BankF
	dw Cry_14_Header_BankF
	dw Cry_15_Header_BankF
	dw Cry_16_Header_BankF
	dw Cry_17_Header_BankF
	dw Cry_18_Header_BankF
	dw Cry_19_Header_BankF
	dw Cry_1A_Header_BankF
	dw Cry_1B_Header_BankF
	dw Cry_1C_Header_BankF
	dw Cry_1D_Header_BankF
	dw Cry_1E_Header_BankF
	dw Cry_1F_Header_BankF
	dw Cry_20_Header_BankF
	dw Cry_21_Header_BankF
	dw Cry_22_Header_BankF
	dw Cry_23_Header_BankF
	dw Cry_24_Header_BankF
	dw Cry_25_Header_BankF

CryData: ; 0x3efaf
; Each entry is in the following format:
; [base cry id], [pitch], [length
	dw $000F, $0080, $0081  ; BULBASAUR
	dw $000F, $0020, $0100  ; IVYSAUR
	dw $000F, $0000, $0140  ; VENUSAUR
	dw $0004, $0060, $00C0  ; CHARMANDER
	dw $0004, $0020, $00C0  ; CHARMELEON
	dw $0004, $0000, $0100  ; CHARIZARD
	dw $001D, $0060, $00C0  ; SQUIRTLE
	dw $001D, $0020, $00C0  ; WARTORTLE
	dw $0013, $0000, $0100  ; BLASTOISE
	dw $0016, $0080, $00A0  ; CATERPIE
	dw $001C, $00CC, $0081  ; METAPOD
	dw $0016, $0077, $00C0  ; BUTTERFREE
	dw $0015, $00EE, $0081  ; WEEDLE
	dw $0013, $00FF, $0081  ; KAKUNA
	dw $0013, $0060, $0100  ; BEEDRILL
	dw $000E, $00DF, $0084  ; PIDGEY
	dw $0014, $0028, $0140  ; PIDGEOTTO
	dw $0014, $0011, $017F  ; PIDGEOT
	dw $0022, $0000, $0100  ; RATTATA
	dw $0022, $0020, $017F  ; RATICATE
	dw $0010, $0000, $0100  ; SPEAROW
	dw $0018, $0040, $0120  ; FEAROW
	dw $0017, $0012, $00C0  ; EKANS
	dw $0017, $00E0, $0090  ; ARBOK
	dw $000F, $00EE, $0081  ; PIKACHU
	dw $0009, $00EE, $0088  ; RAICHU
	dw $0000, $0020, $00C0  ; SANDSHREW
	dw $0000, $00FF, $017F  ; SANDSLASH
	dw $0001, $0000, $0100  ; NIDORAN_F
	dw $0001, $002C, $0160  ; NIDORINA
	dw $000A, $0000, $0100  ; NIDOQUEEN
	dw $0000, $0000, $0100  ; NIDORAN_M
	dw $0000, $002C, $0140  ; NIDORINO
	dw $0009, $0000, $0100  ; NIDOKING
	dw $0019, $00CC, $0081  ; CLEFAIRY
	dw $0019, $00AA, $00A0  ; CLEFABLE
	dw $0024, $004F, $0090  ; VULPIX
	dw $0024, $0088, $00E0  ; NINETALES
	dw $000E, $00FF, $00B5  ; JIGGLYPUFF
	dw $000E, $0068, $00E0  ; WIGGLYTUFF
	dw $001D, $00E0, $0100  ; ZUBAT
	dw $001D, $00FA, $0100  ; GOLBAT
	dw $0008, $00DD, $0081  ; ODDISH
	dw $0008, $00AA, $00C0  ; GLOOM
	dw $0023, $0022, $017F  ; VILEPLUME
	dw $001E, $0020, $0160  ; PARAS
	dw $001E, $0042, $017F  ; PARASECT
	dw $001A, $0044, $00C0  ; VENONAT
	dw $001A, $0029, $0100  ; VENOMOTH
	dw $000B, $00AA, $0081  ; DIGLETT
	dw $000B, $002A, $0090  ; DUGTRIO
	dw $0019, $0077, $0090  ; MEOWTH
	dw $0019, $0099, $017F  ; PERSIAN
	dw $0021, $0020, $00E0  ; PSYDUCK
	dw $0021, $00FF, $00C0  ; GOLDUCK
	dw $000A, $00DD, $00E0  ; MANKEY
	dw $000A, $00AF, $00C0  ; PRIMEAPE
	dw $001F, $0020, $00C0  ; GROWLITHE
	dw $0015, $0000, $0100  ; ARCANINE
	dw $000E, $00FF, $017F  ; POLIWAG
	dw $000E, $0077, $00E0  ; POLIWHIRL
	dw $000E, $0000, $017F  ; POLIWRATH
	dw $001C, $00C0, $0081  ; ABRA
	dw $001C, $00A8, $0140  ; KADABRA
	dw $001C, $0098, $017F  ; ALAKAZAM
	dw $001F, $00EE, $0081  ; MACHOP
	dw $001F, $0048, $00E0  ; MACHOKE
	dw $001F, $0008, $0140  ; MACHAMP
	dw $0021, $0055, $0081  ; BELLSPROUT
	dw $0025, $0044, $00A0  ; WEEPINBELL
	dw $0025, $0066, $014C  ; VICTREEBEL
	dw $001A, $0000, $0100  ; TENTACOOL
	dw $001A, $00EE, $017F  ; TENTACRUEL
	dw $0024, $00F0, $0090  ; GEODUDE
	dw $0024, $0000, $0100  ; GRAVELER
	dw $0012, $00E0, $00C0  ; GOLEM
	dw $0025, $0000, $0100  ; PONYTA
	dw $0025, $0020, $0140  ; RAPIDASH
	dw $0002, $0000, $0100  ; SLOWPOKE
	dw $001F, $0000, $0100  ; SLOWBRO
	dw $001C, $0080, $00E0  ; MAGNEMITE
	dw $001C, $0020, $0140  ; MAGNETON
	dw $0010, $00DD, $0081  ; FARFETCH_D
	dw $000B, $00BB, $0081  ; DODUO
	dw $000B, $0099, $00A0  ; DODRIO
	dw $000C, $0088, $0140  ; SEEL
	dw $000C, $0023, $017F  ; DEWGONG
	dw $0005, $0000, $0100  ; GRIMER
	dw $0007, $00EF, $017F  ; MUK
	dw $0018, $0000, $0100  ; SHELLDER
	dw $0018, $006F, $0160  ; CLOYSTER
	dw $001C, $0000, $0100  ; GASTLY
	dw $001C, $0030, $00C0  ; HAUNTER
	dw $0007, $0000, $017F  ; GENGAR
	dw $0017, $00FF, $0140  ; ONIX
	dw $000D, $0088, $00A0  ; DROWZEE
	dw $000D, $00EE, $00C0  ; HYPNO
	dw $0020, $0020, $0160  ; KRABBY
	dw $0020, $00EE, $0160  ; KINGLER
	dw $0006, $00ED, $0100  ; VOLTORB
	dw $0006, $00A8, $0110  ; ELECTRODE
	dw $000B, $0000, $0100  ; EXEGGCUTE
	dw $000D, $0000, $0100  ; EXEGGUTOR
	dw $0019, $0000, $0100  ; CUBONE
	dw $0008, $004F, $00E0  ; MAROWAK
	dw $0012, $0080, $0140  ; HITMONLEE
	dw $000C, $00EE, $0140  ; HITMONCHAN
	dw $000C, $0000, $0100  ; LICKITUNG
	dw $0012, $00E6, $015D  ; KOFFING
	dw $0012, $00FF, $017F  ; WEEZING
	dw $0004, $0000, $0100  ; RHYHORN
	dw $0011, $0000, $0100  ; RHYDON
	dw $0014, $000A, $0140  ; CHANSEY
	dw $0012, $0000, $0100  ; TANGELA
	dw $0003, $0000, $0100  ; KANGASKHAN
	dw $0019, $0099, $0090  ; HORSEA
	dw $0019, $003C, $0081  ; SEADRA
	dw $0016, $0080, $00C0  ; GOLDEEN
	dw $0016, $0010, $017F  ; SEAKING
	dw $001E, $0002, $00A0  ; STARYU
	dw $001E, $0000, $0100  ; STARMIE
	dw $0020, $0008, $00C0  ; MR_MIME
	dw $0016, $0000, $0100  ; SCYTHER
	dw $000D, $00FF, $017F  ; JYNX
	dw $0006, $008F, $017F  ; ELECTABUZZ
	dw $0004, $00FF, $00B0  ; MAGMAR
	dw $0014, $0000, $0100  ; PINSIR
	dw $001D, $0011, $00C0  ; TAUROS
	dw $0017, $0080, $0080  ; MAGIKARP
	dw $0017, $0000, $0100  ; GYARADOS
	dw $001B, $0000, $0100  ; LAPRAS
	dw $000E, $00FF, $017F  ; DITTO
	dw $001A, $0088, $00E0  ; EEVEE
	dw $001A, $00AA, $017F  ; VAPOREON
	dw $001A, $003D, $0100  ; JOLTEON
	dw $001A, $0010, $00A0  ; FLAREON
	dw $0025, $00AA, $017F  ; PORYGON
	dw $001F, $00F0, $0081  ; OMANYTE
	dw $001F, $00FF, $00C0  ; OMASTAR
	dw $0016, $00BB, $00C0  ; KABUTO
	dw $0018, $00EE, $0081  ; KABUTOPS
	dw $0023, $0020, $0170  ; AERODACTYL
	dw $0005, $0055, $0081  ; SNORLAX
	dw $0009, $0080, $00C0  ; ARTICUNO
	dw $0018, $00FF, $0100  ; ZAPDOS
	dw $0009, $00F8, $00C0  ; MOLTRES
	dw $000F, $0060, $00C0  ; DRATINI
	dw $000F, $0040, $0100  ; DRAGONAIR
	dw $000F, $003C, $0140  ; DRAGONITE
	dw $001E, $0099, $017F  ; MEWTWO
	dw $001E, $00EE, $017F  ; MEW

Cry_00_Header_BankF: ; 0x3f339
	channelcount 3
	channel 4, Data_3f733
	channel 5, Data_3f742
	channel 7, Data_3f751

Cry_01_Header_BankF: ; 0x3f342
	channelcount 3
	channel 4, Data_3f943
	channel 5, Data_3f956
	channel 7, Data_3f969

Cry_02_Header_BankF: ; 0x3f34b
	channelcount 3
	channel 4, Data_3f8b8
	channel 5, Data_3f8c7
	channel 7, Data_3f8d5

Cry_03_Header_BankF: ; 0x3f354
	channelcount 3
	channel 4, Data_3f652
	channel 5, Data_3f671
	channel 7, Data_3f690

Cry_04_Header_BankF: ; 0x3f35d
	channelcount 3
	channel 4, Data_3fa01
	channel 5, Data_3fa20
	channel 7, Data_3fa3f

Cry_05_Header_BankF: ; 0x3f366
	channelcount 3
	channel 4, Data_3f7e1
	channel 5, Data_3f7f4
	channel 7, Data_3f806

Cry_06_Header_BankF: ; 0x3f36f
	channelcount 3
	channel 4, Data_3f78b
	channel 5, Data_3f7a5
	channel 7, Data_3f7a6

Cry_07_Header_BankF: ; 0x3f378
	channelcount 3
	channel 4, Data_3f7b9
	channel 5, Data_3f7c8
	channel 7, Data_3f7d7

Cry_08_Header_BankF: ; 0x3f381
	channelcount 3
	channel 4, Data_3f9d1
	channel 5, Data_3f9e4
	channel 7, Data_3f9f7

Cry_09_Header_BankF: ; 0x3f38a
	channelcount 3
	channel 4, Data_3f4db
	channel 5, Data_3f4f8
	channel 7, Data_3f519

Cry_0A_Header_BankF: ; 0x3f393
	channelcount 3
	channel 4, Data_3f976
	channel 5, Data_3f995
	channel 7, Data_3f9b8

Cry_0B_Header_BankF: ; 0x3f39c
	channelcount 3
	channel 4, Data_3f807
	channel 5, Data_3f832
	channel 7, Data_3f851

Cry_0C_Header_BankF: ; 0x3f3a5
	channelcount 3
	channel 4, Data_3f86a
	channel 5, Data_3f891
	channel 7, Data_3f8b7

Cry_0D_Header_BankF: ; 0x3f3ae
	channelcount 3
	channel 4, Data_3f8d6
	channel 5, Data_3f8f5
	channel 7, Data_3f924

Cry_0E_Header_BankF: ; 0x3f
	channelcount 3
	channel 4, Data_3f75b
	channel 5, Data_3f76e
	channel 7, Data_3f781

Cry_0F_Header_BankF: ; 0x3f
	channelcount 3
	channel 4, Data_3f69d
	channel 5, Data_3f6b8
	channel 7, Data_3f6d3

Cry_10_Header_BankF: ; 0x3f3b7
	channelcount 3
	channel 4, Data_3f6e3
	channel 5, Data_3f706
	channel 7, Data_3f729

Cry_11_Header_BankF: ; 0x3f3c0
	channelcount 3
	channel 4, Data_3f5bf
	channel 5, Data_3f5de
	channel 7, Data_3f601

Cry_12_Header_BankF: ; 0x3f3c9
	channelcount 3
	channel 4, Data_3fad7
	channel 5, Data_3faea
	channel 7, Data_3fafd

Cry_13_Header_BankF: ; 0x3f3d2
	channelcount 3
	channel 4, Data_3fb0a
	channel 5, Data_3fb25
	channel 7, Data_3fb40

Cry_14_Header_BankF: ; 0x3f3db
	channelcount 3
	channel 4, Data_3fb53
	channel 5, Data_3fb62
	channel 7, Data_3fb71

Cry_15_Header_BankF: ; 0x3f3e4
	channelcount 3
	channel 4, Data_3fbe1
	channel 5, Data_3fbfc
	channel 7, Data_3fc17

Cry_16_Header_BankF: ; 0x3f3ed
	channelcount 3
	channel 4, Data_3fa74
	channel 5, Data_3fa83
	channel 7, Data_3fa92

Cry_17_Header_BankF: ; 0x3f3f6
	channelcount 3
	channel 4, Data_3fc2a
	channel 5, Data_3fc3d
	channel 7, Data_3fc50

Cry_18_Header_BankF: ; 0x3f3ff
	channelcount 3
	channel 4, Data_3fd3a
	channel 5, Data_3fd5d
	channel 7, Data_3fd80

Cry_19_Header_BankF: ; 0x3f408
	channelcount 3
	channel 4, Data_3fa52
	channel 5, Data_3fa61
	channel 7, Data_3fa73

Cry_1A_Header_BankF: ; 0x3f411
	channelcount 3
	channel 4, Data_3fcab
	channel 5, Data_3fcc6
	channel 7, Data_3fce1

Cry_1B_Header_BankF: ; 0x3f41a
	channelcount 3
	channel 4, Data_3fa9c
	channel 5, Data_3fab3
	channel 7, Data_3faca

Cry_1C_Header_BankF: ; 0x3f423
	channelcount 3
	channel 4, Data_3fc5d
	channel 5, Data_3fc80
	channel 7, Data_3fc9b

Cry_1D_Header_BankF: ; 0x3f42c
	channelcount 3
	channel 4, Data_3fcf4
	channel 5, Data_3fd0f
	channel 7, Data_3fd2a

Cry_1E_Header_BankF: ; 0x3f435
	channelcount 3
	channel 4, Data_3fb7b
	channel 5, Data_3fb9e
	channel 7, Data_3fbc5

Cry_1F_Header_BankF: ; 0x3f43e
	channelcount 3
	channel 4, Data_3fd93
	channel 5, Data_3fda6
	channel 7, Data_3fdb9

Cry_20_Header_BankF: ; 0x3f447
	channelcount 3
	channel 4, Data_3fdc6
	channel 5, Data_3fdd9
	channel 7, Data_3fdec

Cry_21_Header_BankF: ; 0x3f450
	channelcount 3
	channel 4, Data_3fdf9
	channel 5, Data_3fe1c
	channel 7, Data_3fe3e

Cry_22_Header_BankF: ; 0x3f459
	channelcount 3
	channel 4, Data_3fe3f
	channel 5, Data_3fe52
	channel 7, Data_3fe65

Cry_23_Header_BankF: ; 0x3f462
	channelcount 3
	channel 4, Data_3f532
	channel 5, Data_3f549
	channel 7, Data_3f55c

Cry_24_Header_BankF: ; 0x3f46b
	channelcount 3
	channel 4, Data_3f569
	channel 5, Data_3f58c
	channel 7, Data_3f5af

Cry_25_Header_BankF: ; 0x3f474
	channelcount 3
	channel 4, Data_3f617
	channel 5, Data_3f62e
	channel 7, Data_3f645

	dr $3f48f, $3f4db

Data_3f4db:
	dr $3f4db, $3f4f8

Data_3f4f8:
	dr $3f4f8, $3f519

Data_3f519:
	dr $3f519, $3f532

Data_3f532:
	dr $3f532, $3f549

Data_3f549:
	dr $3f549, $3f55c

Data_3f55c:
	dr $3f55c, $3f569

Data_3f569:
	dr $3f569, $3f58c

Data_3f58c:
	dr $3f58c, $3f5af

Data_3f5af:
	dr $3f5af, $3f5bf

Data_3f5bf:
	dr $3f5bf, $3f5de

Data_3f5de:
	dr $3f5de, $3f601

Data_3f601:
	dr $3f601, $3f617

Data_3f617:
	dr $3f617, $3f62e

Data_3f62e:
	dr $3f62e, $3f645

Data_3f645:
	dr $3f645, $3f652

Data_3f652:
	dr $3f652, $3f671

Data_3f671:
	dr $3f671, $3f690

Data_3f690:
	dr $3f690, $3f69d

Data_3f69d:
	dr $3f69d, $3f6b8

Data_3f6b8:
	dr $3f6b8, $3f6d3

Data_3f6d3:
	dr $3f6d3, $3f6e3

Data_3f6e3:
	dr $3f6e3, $3f706

Data_3f706:
	dr $3f706, $3f729

Data_3f729:
	dr $3f729, $3f733

Data_3f733:
	dr $3f733, $3f742

Data_3f742:
	dr $3f742, $3f751

Data_3f751:
	dr $3f751, $3f75b

Data_3f75b:
	dr $3f75b, $3f76e

Data_3f76e:
	dr $3f76e, $3f781

Data_3f781:
	dr $3f781, $3f78b

Data_3f78b:
	dr $3f78b, $3f7a5

Data_3f7a5:
	dr $3f7a5, $3f7a6

Data_3f7a6:
	dr $3f7a6, $3f7b9

Data_3f7b9:
	dr $3f7b9, $3f7c8

Data_3f7c8:
	dr $3f7c8, $3f7d7

Data_3f7d7:
	dr $3f7d7, $3f7e1

Data_3f7e1:
	dr $3f7e1, $3f7f4

Data_3f7f4:
	dr $3f7f4, $3f806

Data_3f806:
	dr $3f806, $3f807

Data_3f807:
	dr $3f807, $3f832

Data_3f832:
	dr $3f832, $3f851

Data_3f851:
	dr $3f851, $3f86a

Data_3f86a:
	dr $3f86a, $3f891

Data_3f891:
	dr $3f891, $3f8b7

Data_3f8b7:
	dr $3f8b7, $3f8b8

Data_3f8b8:
	dr $3f8b8, $3f8c7

Data_3f8c7:
	dr $3f8c7, $3f8d5

Data_3f8d5:
	dr $3f8d5, $3f8d6

Data_3f8d6:
	dr $3f8d6, $3f8f5

Data_3f8f5:
	dr $3f8f5, $3f924

Data_3f924:
	dr $3f924, $3f943

Data_3f943:
	dr $3f943, $3f956

Data_3f956:
	dr $3f956, $3f969

Data_3f969:
	dr $3f969, $3f976

Data_3f976:
	dr $3f976, $3f995

Data_3f995:
	dr $3f995, $3f9b8

Data_3f9b8:
	dr $3f9b8, $3f9d1

Data_3f9d1:
	dr $3f9d1, $3f9e4

Data_3f9e4:
	dr $3f9e4, $3f9f7

Data_3f9f7:
	dr $3f9f7, $3fa01

Data_3fa01:
	dr $3fa01, $3fa20

Data_3fa20:
	dr $3fa20, $3fa3f

Data_3fa3f:
	dr $3fa3f, $3fa52

Data_3fa52:
	dr $3fa52, $3fa61

Data_3fa61:
	dr $3fa61, $3fa73

Data_3fa73:
	dr $3fa73, $3fa74

Data_3fa74:
	dr $3fa74, $3fa83

Data_3fa83:
	dr $3fa83, $3fa92

Data_3fa92:
	dr $3fa92, $3fa9c

Data_3fa9c:
	dr $3fa9c, $3fab3

Data_3fab3:
	dr $3fab3, $3faca

Data_3faca:
	dr $3faca, $3fad7

Data_3fad7:
	dr $3fad7, $3faea

Data_3faea:
	dr $3faea, $3fafd

Data_3fafd:
	dr $3fafd, $3fb0a

Data_3fb0a:
	dr $3fb0a, $3fb25

Data_3fb25:
	dr $3fb25, $3fb40

Data_3fb40:
	dr $3fb40, $3fb53

Data_3fb53:
	dr $3fb53, $3fb62

Data_3fb62:
	dr $3fb62, $3fb71

Data_3fb71:
	dr $3fb71, $3fb7b

Data_3fb7b:
	dr $3fb7b, $3fb9e

Data_3fb9e:
	dr $3fb9e, $3fbc5

Data_3fbc5:
	dr $3fbc5, $3fbe1

Data_3fbe1:
	dr $3fbe1, $3fbfc

Data_3fbfc:
	dr $3fbfc, $3fc17

Data_3fc17:
	dr $3fc17, $3fc2a

Data_3fc2a:
	dr $3fc2a, $3fc3d

Data_3fc3d:
	dr $3fc3d, $3fc50

Data_3fc50:
	dr $3fc50, $3fc5d

Data_3fc5d:
	dr $3fc5d, $3fc80

Data_3fc80:
	dr $3fc80, $3fc9b

Data_3fc9b:
	dr $3fc9b, $3fcab

Data_3fcab:
	dr $3fcab, $3fcc6

Data_3fcc6:
	dr $3fcc6, $3fce1

Data_3fce1:
	dr $3fce1, $3fcf4

Data_3fcf4:
	dr $3fcf4, $3fd0f

Data_3fd0f:
	dr $3fd0f, $3fd2a

Data_3fd2a:
	dr $3fd2a, $3fd3a

Data_3fd3a:
	dr $3fd3a, $3fd5d

Data_3fd5d:
	dr $3fd5d, $3fd80

Data_3fd80:
	dr $3fd80, $3fd93

Data_3fd93:
	dr $3fd93, $3fda6

Data_3fda6:
	dr $3fda6, $3fdb9

Data_3fdb9:
	dr $3fdb9, $3fdc6

Data_3fdc6:
	dr $3fdc6, $3fdd9

Data_3fdd9:
	dr $3fdd9, $3fdec

Data_3fdec:
	dr $3fdec, $3fdf9

Data_3fdf9:
	dr $3fdf9, $3fe1c

Data_3fe1c:
	dr $3fe1c, $3fe3e

Data_3fe3e:
	dr $3fe3e, $3fe3f

Data_3fe3f:
	dr $3fe3f, $3fe52

Data_3fe52:
	dr $3fe52, $3fe65

Data_3fe65:
	dr $3fe65, $3fe72
