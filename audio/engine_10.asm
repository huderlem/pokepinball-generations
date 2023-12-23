Func_40000:
	push hl
	push de
	push bc
	push af
	call Func_40b1b
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
	call Func_40b15
	pop af
	pop bc
	pop de
	pop hl
	ret

Func_40042:
	ld a, [de]
	inc de
	and $7
	ld [wdeae], a
	ld c, a
	ld b, $0
	ld hl, ChannelPointers_Bank10
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

Unused_4008b: ; 4008b
	db $d8, $d9, $da, $53, $30

PlaySong_Bank10:
	push de
	call Func_40000
	pop de
	call Func_40b1b
	ld hl, wde9b
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SongHeaderPointers_Bank10
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
.asm_400ac
	push af
	call Func_40042
	call Func_40adf
	pop af
	dec a
	jr nz, .asm_400ac
	call Func_40b15
	ret

Unused_400bb: ; 400bb
	db $2e, $3d, $3e, $0d, $0e

PlaySoundEffect_Bank10:
	call Func_40b1b
	ld hl, wde9b
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, SoundEffects_Bank10
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
.asm_400d7
	push af
	call Func_40042
	ld hl, $0002
	add hl, bc
	set 3, [hl]
	call Func_40adf
	pop af
	dec a
	jr nz, .asm_400d7
	call Func_40b15
	ret

Unused_400ec:
; ???
	db $77, $EF, $F0, $F1

PlayCry_Bank10:
; Plays a Pokemon cry.
; Input: e = mon id
	call Func_40b1b
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
	ld hl, CryBasePointers_Bank10
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
.asm_4012a
	push af
	call Func_40042
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
	jr nc, .asm_4015b
	ld hl, $0017
	add hl, bc
	ld a, [wdeaa]
	ld [hli], a
	ld a, [wdeab]
	ld [hl], a
.asm_4015b
	call Func_40adf
	pop af
	dec a
	jr nz, .asm_4012a
	ld a, [wdeac]
	and a
	jr nz, .asm_40173
	ld a, [wde98]
	ld [wdeac], a
	ld a, $77
	ld [wde98], a
.asm_40173
	ld a, $1
	ld [wdead], a
	call Func_40b15
	ret

Unused_4017c: ; 0x4017c
; ???
	db $EE, $CD, $51, $30

Func_40180:
	ld a, [wdd00]
	and a
	ret z
	xor a
	ld [wde97], a
	ld [wde99], a
	ld bc, wChannel0
.asm_4018f
	ld hl, $0002
	add hl, bc
	bit 0, [hl]
	jp z, .asm_4022d
	ld hl, $0014
	add hl, bc
	ld a, [hl]
	cp $2
	jr c, .asm_401a4
	dec [hl]
	jr .asm_401c1

.asm_401a4
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
	call Func_40670
.asm_401c1
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
	call Func_404f0
	call Func_40632
	ld a, [wdead]
	and a
	jr z, .asm_4020a
	ld a, [wde97]
	cp $4
	jr nc, .asm_40219
	ld hl, wChannel4 + 2
	bit 0, [hl]
	jr nz, .asm_40204
	ld hl, wChannel5 + 2
	bit 0, [hl]
	jr nz, .asm_40204
	ld hl, wChannel6 + 2
	bit 0, [hl]
	jr nz, .asm_40204
	ld hl, wChannel7 + 2
	bit 0, [hl]
	jr z, .asm_4020a
.asm_40204
	ld hl, $000b
	add hl, bc
	set 5, [hl]
.asm_4020a
	ld a, [wde97]
	cp $4
	jr nc, .asm_40219
	ld hl, $00ca
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_40227
.asm_40219
	call Func_4024d
	ld hl, $0019
	add hl, bc
	ld a, [wde99]
	or [hl]
	ld [wde99], a
.asm_40227
	ld hl, $000b
	add hl, bc
	xor a
	ld [hl], a
.asm_4022d
	ld hl, $0032
	add hl, bc
	ld c, l
	ld b, h
	ld a, [wde97]
	inc a
	ld [wde97], a
	cp $8
	jp nz, .asm_4018f
	call Func_4040d
	ld a, [wde98]
	ld [rNR50], a
	ld a, [wde99]
	ld [rNR51], a
	ret

Func_4024d:
	ld hl, PointerTable_4025e
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

PointerTable_4025e:
	dw Func_4026e
	dw Func_402e0
	dw Func_40349
	dw Func_403cf
	dw Func_4026e
	dw Func_402e0
	dw Func_40349
	dw Func_403cf

Func_4026e:
	ld hl, $000b
	add hl, bc
	bit 3, [hl]
	jr z, .asm_4027b
	ld a, [wde9a]
	ld [rNR10], a
.asm_4027b
	bit 5, [hl]
	jr nz, .asm_402ba
	bit 4, [hl]
	jr nz, .asm_402c6
	bit 6, [hl]
	jr nz, .asm_402b4
	bit 1, [hl]
	jr z, .asm_40295
	ld a, [wde93]
	ld [rNR13], a
	ld a, [wde94]
	ld [rNR14], a
.asm_40295
	bit 2, [hl]
	jr z, .asm_402a5
	ld a, [wde92]
	ld [rNR12], a
	ld a, [wde94]
	or $80
	ld [rNR14], a
.asm_402a5
	bit 0, [hl]
	ret z
	ld a, [wde91]
	ld d, a
	ld a, [rNR11]
	and $3f
	or d
	ld [rNR11], a
	ret

.asm_402b4
	ld a, [wde93]
	ld [rNR13], a
	ret

.asm_402ba
	ld a, $8
	ld [rNR12], a
	ld a, [wde94]
	or $80
	ld [rNR14], a
	ret

.asm_402c6
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

Func_402e0:
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_40323
	bit 4, [hl]
	jr nz, .asm_4032f
	bit 6, [hl]
	jr nz, .asm_4031d
	bit 1, [hl]
	jr z, .asm_402fe
	ld a, [wde93]
	ld [rNR23], a
	ld a, [wde94]
	ld [rNR24], a
.asm_402fe
	bit 2, [hl]
	jr z, .asm_4030e
	ld a, [wde92]
	ld [rNR22], a
	ld a, [wde94]
	or $80
	ld [rNR24], a
.asm_4030e
	bit 0, [hl]
	ret z
	ld a, [wde91]
	ld d, a
	ld a, [rNR21]
	and $3f
	or d
	ld [rNR21], a
	ret

.asm_4031d
	ld a, [wde93]
	ld [rNR23], a
	ret

.asm_40323
	ld a, $8
	ld [rNR22], a
	ld a, [wde94]
	or $80
	ld [rNR24], a
	ret

.asm_4032f
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

Func_40349:
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_40387
	bit 4, [hl]
	jr nz, .asm_4038b
	bit 6, [hl]
	jr nz, .asm_40381
	bit 1, [hl]
	jr z, .asm_40367
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	ld [rNR34], a
.asm_40367
	bit 2, [hl]
	ret z
	xor a
	ld [rNR30], a
	call LoadWavePattern_Bank10
	ld a, $80
	ld [rNR30], a
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	or $80
	ld [rNR34], a
	ret

.asm_40381
	ld a, [wde93]
	ld [rNR33], a
	ret

.asm_40387
	xor a
	ld [rNR30], a
	ret

.asm_4038b
	ld a, $3f
	ld [rNR31], a
	xor a
	ld [rNR30], a
	call LoadWavePattern_Bank10
	ld a, $80
	ld [rNR30], a
	ld a, [wde93]
	ld [rNR33], a
	ld a, [wde94]
	or $80
	ld [rNR34], a
	ret

LoadWavePattern_Bank10:
	push hl
	ld a, [wde92]
	and $f
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, WavePatterns_Bank10
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

Func_403cf:
	ld hl, $000b
	add hl, bc
	bit 5, [hl]
	jr nz, .asm_403f1
	bit 4, [hl]
	jr nz, .asm_403fa
	bit 1, [hl]
	jr z, .asm_403e4
	ld a, [wde93]
	ld [rNR43], a
.asm_403e4
	bit 2, [hl]
	ret z
	ld a, [wde92]
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

.asm_403f1
	ld a, $8
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

.asm_403fa
	ld a, $3f
	ld [rNR41], a
	ld a, [wde92]
	ld [rNR42], a
	ld a, [wde93]
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	ret

Func_4040d:
	ld a, [wdea2]
	and a
	ret z
	ld a, [wdea3]
	and a
	jr z, .asm_4041d
	dec a
	ld [wdea3], a
	ret

.asm_4041d
	ld a, [wdea2]
	ld d, a
	and $7f
	ld [wdea3], a
	ld a, [wde98]
	and $7
	bit 7, d
	jr nz, .asm_40448
	and a
	jr z, .asm_40435
	dec a
	jr .asm_40454

.asm_40435
	ld a, [wdea4]
	ld e, a
	ld a, [wdea5]
	ld d, a
	push bc
	call PlaySong_Bank10
	pop bc
	ld hl, wdea2
	set 7, [hl]
	ret

.asm_40448
	cp $7
	jr nc, .asm_4044f
	inc a
	jr .asm_40454

.asm_4044f
	xor a
	ld [wdea2], a
	ret

.asm_40454
	ld d, a
	swap a
	or d
	ld [wde98], a
	ret

Func_4045c:
	ld hl, $0003
	add hl, bc
	bit 1, [hl]
	ret z
	ld hl, $0014
	add hl, bc
	ld a, [hl]
	ld hl, wde95
	sub [hl]
	jr nc, .asm_40470
	ld a, $1
.asm_40470
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
	jr nc, .asm_404ab
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
	jr .asm_404c9

.asm_404ab
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
.asm_404c9
	push bc
	ld hl, wde95
	ld b, $0
.asm_404cf
	inc b
	ld a, e
	sub [hl]
	ld e, a
	jr nc, .asm_404cf
	ld a, d
	and a
	jr z, .asm_404dc
	dec d
	jr .asm_404cf

.asm_404dc
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

Func_404f0:
	ld hl, $0003
	add hl, bc
	bit 2, [hl]
	jr z, .asm_4050b
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
.asm_4050b
	ld hl, $0003
	add hl, bc
	bit 4, [hl]
	jr z, .asm_40529
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
.asm_40529
	ld hl, $0003
	add hl, bc
	bit 1, [hl]
	jp z, .asm_405c1
	ld hl, $000f
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0004
	add hl, bc
	bit 1, [hl]
	jr z, .asm_40574
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
	jp c, .asm_405a1
	jr nz, .asm_405b4
	ld hl, $001f
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .asm_405a1
	jr .asm_405b4

.asm_40574
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
	jr c, .asm_405a1
	jr nz, .asm_405b4
	ld hl, $001f
	add hl, bc
	ld a, e
	cp [hl]
	jr nc, .asm_405b4
.asm_405a1
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
.asm_405b4
	ld hl, $000f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $000b
	add hl, bc
	set 1, [hl]
.asm_405c1
	ld hl, $0003
	add hl, bc
	bit 0, [hl]
	jr z, .asm_4061a
	ld hl, $001b
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_405e3
	ld hl, $001d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4061a
	ld d, a
	ld hl, $001e
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .asm_405e6
.asm_405e3
	dec [hl]
	jr .asm_4061a

.asm_405e6
	ld a, [hl]
	swap [hl]
	or [hl]
	ld [hl], a
	ld a, [wde93]
	ld e, a
	ld hl, $0004
	add hl, bc
	bit 0, [hl]
	jr z, .asm_40605
	res 0, [hl]
	ld a, d
	and $f
	ld d, a
	ld a, e
	sub d
	jr nc, .asm_40611
	ld a, $0
	jr .asm_40611

.asm_40605
	set 0, [hl]
	ld a, d
	and $f0
	swap a
	add e
	jr nc, .asm_40611
	ld a, $ff
.asm_40611
	ld [wde93], a
	ld hl, $000b
	add hl, bc
	set 6, [hl]
.asm_4061a
	ld hl, $0003
	add hl, bc
	bit 3, [hl]
	ret z
	ld hl, $0024
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_4062b
	dec [hl]
	ret

.asm_4062b
	ld hl, $000b
	add hl, bc
	set 5, [hl]
	ret

Func_40632:
	ld hl, $0002
	add hl, bc
	bit 4, [hl]
	ret z
	ld a, [wde9f]
	and a
	jr z, .asm_40644
	dec a
	ld [wde9f], a
	ret

.asm_40644
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

Func_40670:
	call Func_40a10
	cp $ff
	jr z, .asm_406c9
	cp $d0
	jr c, .asm_40680
.asm_4067b
	call Func_40786
	jr Func_40670

.asm_40680
	ld hl, $0002
	add hl, bc
	bit 3, [hl]
	jp nz, Func_40723
	bit 5, [hl]
	jp nz, Func_40723
	bit 4, [hl]
	jp nz, Func_40750
	ld a, [wde96]
	and $f
	call Func_40a5b
	ld a, [wde96]
	swap a
	and $f
	jr z, .asm_406c2
	ld hl, $0011
	add hl, bc
	ld [hl], a
	ld e, a
	ld hl, $0012
	add hl, bc
	ld d, [hl]
	call Func_40a2b
	ld hl, $000f
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $000b
	add hl, bc
	set 4, [hl]
	jp Func_4045c

.asm_406c2
	ld hl, $000b
	add hl, bc
	set 5, [hl]
	ret

.asm_406c9
	ld hl, $0002
	add hl, bc
	bit 1, [hl]
	jr nz, .asm_4067b
	ld a, [wde97]
	cp $4
	jr nc, .asm_406e0
	ld hl, $00ca
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_406f6
.asm_406e0
	ld hl, $0002
	add hl, bc
	bit 5, [hl]
	call nz, Func_40704
	ld a, [wde97]
	cp $4
	jr nz, .asm_406f6
	xor a
	ld [rNR10], a
	ld [wde9a], a
.asm_406f6
	ld hl, $0002
	add hl, bc
	res 0, [hl]
	ld hl, $0000
	add hl, bc
	xor a
	ld [hli], a
	ld [hli], a
	ret

Func_40704:
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

Func_40723:
	ld hl, $000b
	add hl, bc
	set 4, [hl]
	ld a, [wde96]
	call Func_40a5b
	call Func_40a10
	ld hl, $000e
	add hl, bc
	ld [hl], a
	call Func_40a10
	ld hl, $000f
	add hl, bc
	ld [hl], a
	ld a, [wde97]
	and $3
	cp $3
	ret z
	call Func_40a10
	ld hl, $0010
	add hl, bc
	ld [hl], a
	ret

Func_40750:
	ld a, [wde97]
	cp $3
	ret nz
	ld a, [wde96]
	and $f
	call Func_40a5b
	ld a, [wdea1]
	ld e, a
	ld d, $0
	ld hl, Drumkits_Bank10
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

Func_40786:
	ld a, [wde96]
	sub $d0
	ld e, a
	ld d, $0
	ld hl, PointerTable_40797
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

PointerTable_40797:
	dw Func_409b6
	dw Func_409b6
	dw Func_409b6
	dw Func_409b6
	dw Func_409b6
	dw Func_409b6
	dw Func_409b6
	dw Func_409b6
	dw Func_40973
	dw Func_409c1
	dw Func_409aa
	dw Func_40994
	dw Func_409a1
	dw Func_40987
	dw Func_40939
	dw Func_40951
	dw Func_408ff
	dw Func_408c4
	dw Func_408b5
	dw Func_4095f
	dw Func_409ca
	dw Func_409da
	dw Func_40926
	dw Func_407f7
	dw Func_407f7
	dw Func_409e9
	dw Func_407f7
	dw Func_407f7
	dw Func_40a05
	dw Func_40a0b
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_407f7
	dw Func_40885
	dw Func_4088e
	dw Func_40833
	dw Func_40843
	dw Func_4080d
	dw Func_407f8

Func_407f7:
	ret

Func_407f8:
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

Func_4080d:
	call Func_40a10
	ld e, a
	call Func_40a10
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

Func_40833:
	call Func_40a10
	ld e, a
	call Func_40a10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_40843:
	call Func_40a10
	ld hl, $0002
	add hl, bc
	bit 2, [hl]
	jr nz, .asm_40859
	and a
	jr z, .asm_40862
	dec a
	set 2, [hl]
	ld hl, $0016
	add hl, bc
	ld [hl], a
.asm_40859
	ld hl, $0016
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_40872
	dec [hl]
.asm_40862
	call Func_40a10
	ld e, a
	call Func_40a10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.asm_40872
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

Func_40885:
	call Func_40a10
	ld hl, $000c
	add hl, bc
	ld [hl], a
	ret

Func_4088e:
	call Func_40a10
	ld hl, $000c
	add hl, bc
	cp [hl]
	jr z, .asm_408a5
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

.asm_408a5
	call Func_40a10
	ld e, a
	call Func_40a10
	ld d, a
	ld hl, $0005
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

Func_408b5:
	call Func_40a10
	ld hl, $0025
	add hl, bc
	ld [hl], a
	ld hl, $0003
	add hl, bc
	set 3, [hl]
	ret

Func_408c4:
	ld hl, $0003
	add hl, bc
	set 0, [hl]
	ld hl, $0004
	add hl, bc
	res 0, [hl]
	call Func_40a10
	ld hl, $001c
	add hl, bc
	ld [hl], a
	ld hl, $001b
	add hl, bc
	ld [hl], a
	call Func_40a10
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

Func_408ff:
	call Func_40a10
	ld [wde95], a
	call Func_40a10
	ld d, a
	and $f
	ld e, a
	ld a, d
	swap a
	and $f
	ld d, a
	call Func_40a2b
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

Func_40926:
	ld hl, $0003
	add hl, bc
	set 4, [hl]
	ld hl, $0027
	add hl, bc
	call Func_40a10
	ld [hld], a
	call Func_40a10
	ld [hl], a
	ret

Func_40939:
	ld hl, $0003
	add hl, bc
	set 2, [hl]
	call Func_40a10
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

Func_40951:
	ld hl, $0002
	add hl, bc
	bit 3, [hl]
	jr z, .asm_4095c
	res 3, [hl]
	ret

.asm_4095c
	set 3, [hl]
	ret

Func_4095f:
	ld hl, $0002
	add hl, bc
	bit 4, [hl]
	jr z, .asm_4096a
	res 4, [hl]
	ret

.asm_4096a
	set 4, [hl]
	call Func_40a10
	ld [wdea1], a
	ret

Func_40973:
	call Func_40a10
	ld hl, $0028
	add hl, bc
	ld [hl], a
	ld a, [wde97]
	and $3
	cp $3
	ret z
	call Func_409a1
	ret

Func_40987:
	call Func_40a10
	ld [wde9a], a
	ld hl, $000b
	add hl, bc
	set 3, [hl]
	ret

Func_40994:
	call Func_40a10
	rrca
	rrca
	and $c0
	ld hl, $000d
	add hl, bc
	ld [hl], a
	ret

Func_409a1:
	call Func_40a10
	ld hl, $000e
	add hl, bc
	ld [hl], a
	ret

Func_409aa:
	call Func_40a10
	ld d, a
	call Func_40a10
	ld e, a
	call Func_40a95
	ret

Func_409b6:
	ld hl, $0012
	add hl, bc
	ld a, [wde96]
	and $7
	ld [hl], a
	ret

Func_409c1:
	call Func_40a10
	ld hl, $0013
	add hl, bc
	ld [hl], a
	ret

Func_409ca:
	ld a, [wde97]
	call Func_40af4
	call Func_40a10
	ld hl, $0019
	add hl, bc
	and [hl]
	ld [hl], a
	ret

Func_409da:
	call Func_40a10
	ld a, [wdea2]
	and a
	ret nz
	ld a, [wde96]
	ld [wde98], a
	ret

Func_409e9:
	call Func_40a10
	; cast to s16
	ld e, a
	cp $80
	jr nc, .asm_409f5
	ld d, $0
	jr .asm_409f7

.asm_409f5
	ld d, $ff
.asm_409f7
	ld hl, $0017
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	call Func_40a95
	ret

Func_40a05:
	ld a, $1
	ld [wdead], a
	ret

Func_40a0b:
	xor a
	ld [wdead], a
	ret

Func_40a10:
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

Func_40a2b:
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
	ld de, Data_40b20
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop af
.asm_40a4b
	cp $7
	jr nc, .asm_40a56
	sra d
	rr e
	inc a
	jr .asm_40a4b

.asm_40a56
	ld a, d
	and $7
	ld d, a
	ret

Func_40a5b:
	inc a
	ld e, a
	ld d, $0
	ld hl, $0028
	add hl, bc
	ld a, [hl]
	ld l, $0
	call Func_40a86
	ld a, l
	ld hl, $0017
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $0015
	add hl, bc
	ld l, [hl]
	call Func_40a86
	ld e, l
	ld d, h
	ld hl, $0015
	add hl, bc
	ld [hl], e
	ld hl, $0014
	add hl, bc
	ld [hl], d
	ret

Func_40a86:
	ld h, $0
.asm_40a88
	srl a
	jr nc, .asm_40a8d
	add hl, de
.asm_40a8d
	sla e
	rl d
	and a
	jr nz, .asm_40a88
	ret

Func_40a95:
	push bc
	ld a, [wde97]
	cp $4
	jr nc, .asm_40ab7
	ld bc, wChannel0
	call Func_40ad1
	ld bc, wChannel1
	call Func_40ad1
	ld bc, wChannel2
	call Func_40ad1
	ld bc, wChannel3
	call Func_40ad1
	jr .asm_40acf

.asm_40ab7
	ld bc, wChannel4
	call Func_40ad1
	ld bc, wChannel5
	call Func_40ad1
	ld bc, wChannel6
	call Func_40ad1
	ld bc, wChannel7
	call Func_40ad1
.asm_40acf
	pop bc
	ret

Func_40ad1:
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

Func_40adf:
	call Func_40b06
	ld a, [wdeae]
	jr .asm_40aea

	ld a, [wde97]
.asm_40aea
	call Func_40af4
	ld hl, $0002
	add hl, bc
	set 0, [hl]
	ret

Func_40af4:
	push de
	and $3
	ld e, a
	ld d, $0
	ld hl, Data_40c8e
	add hl, de
	ld a, [hl]
	ld hl, $0019
	add hl, bc
	ld [hl], a
	pop de
	ret

Func_40b06:
	ld a, [wdeae]
	and $3
	cp $0
	ret nz
	xor a
	ld [rNR10], a
	ld [wde9a], a
	ret

Func_40b15:
	ld a, $1
	ld [wdd00], a
	ret

Func_40b1b:
	xor a
	ld [wdd00], a
	ret

Data_40b20:
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

WavePatterns_Bank10:
INCLUDE "audio/wave_samples.asm"

INCLUDE "audio/drumkits_10.asm"

Data_40c8e:
	db $11, $22, $44, $88

ChannelPointers_Bank10:
	dw wChannel0
	dw wChannel1
	dw wChannel2
	dw wChannel3
	dw wChannel4
	dw wChannel5
	dw wChannel6
	dw wChannel7

SongHeaderPointers_Bank10:
	dw Music_Nothing10
	dw Music_BlueField
	dw Music_CatchEmBlue
	dw Music_HurryUpBlue
	dw Music_HiScore
	dw Music_GameOver

INCLUDE "audio/music/nothing10.asm"
INCLUDE "audio/music/bluefield.asm"
INCLUDE "audio/music/catchemblue.asm"
INCLUDE "audio/music/hiscore.asm"
INCLUDE "audio/music/gameover.asm"
INCLUDE "audio/music/hurryupblue.asm"

SoundEffects_Bank10:
	dw Sfx_SoundEffect0_Bank10
	dw Sfx_SoundEffect1_Bank10
	dw Sfx_SoundEffect2_Bank10
	dw Sfx_SoundEffect3_Bank10
	dw Sfx_SoundEffect4_Bank10
	dw Sfx_SoundEffect5_Bank10
	dw Sfx_SoundEffect6_Bank10
	dw Sfx_SoundEffect7_Bank10
	dw Sfx_SoundEffect8_Bank10
	dw Sfx_SoundEffect9_Bank10
	dw Sfx_SoundEffect10_Bank10
	dw Sfx_SoundEffect11_Bank10
	dw Sfx_SoundEffect12_Bank10
	dw Sfx_SoundEffect13_Bank10
	dw Sfx_SoundEffect14_Bank10
	dw Sfx_SoundEffect15_Bank10
	dw Sfx_SoundEffect16_Bank10
	dw Sfx_SoundEffect17_Bank10
	dw Sfx_SoundEffect18_Bank10
	dw Sfx_SoundEffect19_Bank10
	dw Sfx_SoundEffect20_Bank10
	dw Sfx_SoundEffect21_Bank10
	dw Sfx_SoundEffect22_Bank10
	dw Sfx_SoundEffect23_Bank10
	dw Sfx_SoundEffect24_Bank10
	dw Sfx_SoundEffect25_Bank10
	dw Sfx_SoundEffect26_Bank10
	dw Sfx_SoundEffect27_Bank10
	dw Sfx_SoundEffect28_Bank10
	dw Sfx_SoundEffect29_Bank10
	dw Sfx_SoundEffect30_Bank10
	dw Sfx_SoundEffect31_Bank10
	dw Sfx_SoundEffect32_Bank10
	dw Sfx_SoundEffect33_Bank10
	dw Sfx_SoundEffect34_Bank10
	dw Sfx_SoundEffect35_Bank10
	dw Sfx_SoundEffect36_Bank10
	dw Sfx_SoundEffect37_Bank10
	dw Sfx_SoundEffect38_Bank10
	dw Sfx_SoundEffect39_Bank10
	dw Sfx_SoundEffect40_Bank10
	dw Sfx_SoundEffect41_Bank10
	dw Sfx_SoundEffect42_Bank10
	dw Sfx_SoundEffect43_Bank10
	dw Sfx_SoundEffect44_Bank10
	dw Sfx_SoundEffect45_Bank10
	dw Sfx_SoundEffect46_Bank10
	dw Sfx_SoundEffect47_Bank10
	dw Sfx_SoundEffect48_Bank10
	dw Sfx_SoundEffect49_Bank10
	dw Sfx_SoundEffect50_Bank10
	dw Sfx_SoundEffect51_Bank10
	dw Sfx_SoundEffect52_Bank10
	dw Sfx_SoundEffect53_Bank10
	dw Sfx_SoundEffect54_Bank10
	dw Sfx_SoundEffect55_Bank10
	dw Sfx_SoundEffect56_Bank10
	dw Sfx_SoundEffect57_Bank10
	dw Sfx_SoundEffect58_Bank10
	dw Sfx_SoundEffect59_Bank10
	dw Sfx_SoundEffect60_Bank10
	dw Sfx_SoundEffect61_Bank10
	dw Sfx_SoundEffect62_Bank10
	dw Sfx_SoundEffect63_Bank10
	dw Sfx_SoundEffect64_Bank10
	dw Sfx_SoundEffect65_Bank10
	dw Sfx_SoundEffect66_Bank10
	dw Sfx_SoundEffect67_Bank10
	dw Sfx_SoundEffect68_Bank10
	dw Sfx_SoundEffect69_Bank10
	dw Sfx_SoundEffect70_Bank10
	dw Sfx_SoundEffect71_Bank10
	dw Sfx_SoundEffect72_Bank10
	dw Sfx_SoundEffect73_Bank10
	dw Sfx_SoundEffect74_Bank10
	dw Sfx_SoundEffect75_Bank10
	dw Sfx_SoundEffect76_Bank10
	dw Sfx_SoundEffect77_Bank10

INCLUDE "audio/sfx_10.asm"

CryBasePointers_Bank10:
	dw Cry_00_Bank10
	dw Cry_01_Bank10
	dw Cry_02_Bank10
	dw Cry_03_Bank10
	dw Cry_04_Bank10
	dw Cry_05_Bank10
	dw Cry_06_Bank10
	dw Cry_07_Bank10
	dw Cry_08_Bank10
	dw Cry_09_Bank10
	dw Cry_0A_Bank10
	dw Cry_0B_Bank10
	dw Cry_0C_Bank10
	dw Cry_0D_Bank10
	dw Cry_0E_Bank10
	dw Cry_0F_Bank10
	dw Cry_10_Bank10
	dw Cry_11_Bank10
	dw Cry_12_Bank10
	dw Cry_13_Bank10
	dw Cry_14_Bank10
	dw Cry_15_Bank10
	dw Cry_16_Bank10
	dw Cry_17_Bank10
	dw Cry_18_Bank10
	dw Cry_19_Bank10
	dw Cry_1A_Bank10
	dw Cry_1B_Bank10
	dw Cry_1C_Bank10
	dw Cry_1D_Bank10
	dw Cry_1E_Bank10
	dw Cry_1F_Bank10
	dw Cry_20_Bank10
	dw Cry_21_Bank10
	dw Cry_22_Bank10
	dw Cry_23_Bank10
	dw Cry_24_Bank10
	dw Cry_25_Bank10
	dw Cry_26_Bank10 ; MARILL BASE
	dw Cry_27_Bank10 ; MAREEP BASE
	dw Cry_28_Bank10 ; HOOTHOOT BASE
	dw Cry_29_Bank10 ; SENTRET BASE
	dw Cry_2A_Bank10 ; SPINARAK BASE
	dw Cry_2B_Bank10 ; CYNDAQUIL BASE
	dw Cry_2C_Bank10 ; TOGEPI BASE
	dw Cry_2D_Bank10 ; TOGETIC BASE
	dw Cry_2E_Bank10 ; GIRAFARIG BASE
	dw Cry_2F_Bank10 ; RAIKOU BASE
	dw Cry_30_Bank10 ; TEDDIURSA BASE
	dw Cry_31_Bank10 ; SLOWKING BASE
	dw Cry_32_Bank10 ; NATU BASE
	dw Cry_33_Bank10 ; CLEFFA BASE
;dw Cry_2C_Bank10 ; GLIGAR BASE
;dw Cry_2D_Bank10 ; SLUGMA BASE
;dw Cry_26_Bank10 ; LEDYBA BASE
;dw Cry_27_Bank10 ; ENTEI BASE
;dw Cry_28_Bank10 ; WOOPER BASE
;dw Cry_29_Bank10 ; MANTINE BASE
;dw Cry_2A_Bank10 ; TYPHLOSION BASE
;dw Cry_2B_Bank10 ; CHIKORITA BASE
;dw Cry_2C_Bank10 ; TOTODILE BASE
;dw Cry_2D_Bank10 ; SUNFLORA BASE
;dw Cry_26_Bank10 ; AMPHAROS BASE
;dw Cry_27_Bank10 ; MAGCARGO BASE
;dw Cry_28_Bank10 ; PICHU BASE
;dw Cry_29_Bank10 ; AIPOM BASE
;dw Cry_2A_Bank10 ; DUNSPARCE BASE
;dw Cry_2B_Bank10 ; DONPHAN BASE
INCLUDE "audio/cries_10.asm"
