ResolveUnownBonusGameObjectCollisions:
	call Func_183b7_Unown
	callba PlayLowTimeSfx
	ld a, [wTimeRanOut]
	and a
	ret z
	xor a
	ld [wTimeRanOut], a
	ld a, $1
	ld [wFlippersDisabled], a
	call LoadFlippersPalette
	callba StopTimer
	ld a, [wd6a2]
	cp $5
	ret nc
	ld a, $1
	ld [wd6a8], a
	ret

Func_183b7_Unown: ; 0x183b7
	ld a, [wd653]
	and a
	ret nz
	ld a, [wBallXPos + 1]
	cp $8a
	ret nc
	ld a, $1
	ld [wStageCollisionState], a
	ld [wd653], a
	callba LoadStageCollisionAttributes
	call Func_183db_Unown
	call Func_18d91_Unown
	ret

Func_183db_Unown: ; 0x183db
	ld a, [wStageCollisionState]
	sla a
	ld c, a
	ld b, $0
	ld hl, TileDataPointers_183f8_Unown
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_183ee
	ld hl, TileDataPointers_1842e_Unown
.asm_183ee
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(TileDataPointers_183f8_Unown)
	call QueueGraphicsToLoad
	ret

TileDataPointers_183f8_Unown:
	dw TileData_183fc_Unown
	dw TileData_183ff_Unown

TileData_183fc_Unown: ; 0x183fc
	db $01
	dw TileData_18402_Unown

TileData_183ff_Unown: ; 0x183ff
	db $01
	dw TileData_18418_Unown

TileData_18402_Unown: ; 0x18402
	dw LoadTileLists
	db $06 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $113
	db $D4

	db $02 ; number of tiles
	dw vBGMap + $132
	db $D5, $D6

	db $02 ; number of tiles
	dw vBGMap + $152
	db $D9, $D7

	db $01 ; number of tiles
	dw vBGMap + $172
	db $D8

	db $00 ; terminator

TileData_18418_Unown: ; 0x18418
	dw LoadTileLists
	db $06 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $113
	db $12

	db $02 ; number of tiles
	dw vBGMap + $132
	db $0C, $0D

	db $02 ; number of tiles
	dw vBGMap + $152
	db $07, $08

	db $01 ; number of tiles
	dw vBGMap + $172
	db $03

	db $00 ; terminator

TileDataPointers_1842e_Unown:
	dw TileData_18432_Unown
	dw TileData_18435_Unown

TileData_18432_Unown: ; 0x18432
	db $01
	dw TileData_18438_Unown

TileData_18435_Unown: ; 0x18435
	db $01
	dw TileData_1844e_Unown

TileData_18438_Unown: ; 0x18438
	dw LoadTileLists
	db $06 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $113
	db $D4

	db $02 ; number of tiles
	dw vBGMap + $132
	db $D5, $D6

	db $02 ; number of tiles
	dw vBGMap + $152
	db $D9, $D7

	db $01 ; number of tiles
	dw vBGMap + $172
	db $D8

	db $00 ; terminator

TileData_1844e_Unown: ; 0x1844e
	dw LoadTileLists
	db $06 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $113
	db $21

	db $02 ; number of tiles
	dw vBGMap + $132
	db $15, $16

	db $02 ; number of tiles
	dw vBGMap + $152
	db $0A, $0B

	db $01 ; number of tiles
	dw vBGMap + $172
	db $03

	db $00 ; terminator

Func_18d72_Unown: ; 0x18d72
	ld a, [wd656]
	sla a
	ld c, a
	ld b, $0
	ld hl, TileDataPointers_18ddb_Unown
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_18d85
	ld hl, TileDataPointers_18ed1_Unown
.asm_18d85
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, Bank(TileDataPointers_18ddb_Unown)
	call QueueGraphicsToLoad
	ret

Func_18d91_Unown: ; 0x18d91
	ld a, [wd656]
	and a
	ld hl, Data_18dc9_Unown
	jr z, .asm_18d9d
	ld hl, Data_18dd2_Unown
.asm_18d9d
	ld de, wStageCollisionMap + $c7
	call Func_18db2_Unown
	ld de, wStageCollisionMap + $ae
	call Func_18db2_Unown
	ld de, wStageCollisionMap + $123
	call Func_18db2_Unown
	ld de, wStageCollisionMap + $14d
	; fall through

Func_18db2_Unown: ; 0x18db2
	push hl
	ld b, $3
.asm_18db5
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, e
	add $1e
	ld e, a
	jr nc, .asm_18dc4
	inc d
.asm_18dc4
	dec b
	jr nz, .asm_18db5
	pop hl
	ret

Data_18dc9_Unown:
	db $19, $1A, $1B
	db $1C, $27, $1D
	db $1E, $1F, $20

Data_18dd2_Unown:
	db $00, $00, $00
	db $00, $00, $00
	db $00, $00, $00

TileDataPointers_18ddb_Unown:
	dw TileData_18ddf_Unown
	dw TileData_18df4_Unown

TileData_18ddf_Unown: ; 0x18ddf
	db $01
	dw TileData_18e09_Unown

TileData_18df4_Unown: ; 0x18df4
	db $0A
	dw TileData_18e6d_Unown
	dw TileData_18e77_Unown
	dw TileData_18e81_Unown
	dw TileData_18e8b_Unown
	dw TileData_18e95_Unown
	dw TileData_18e9f_Unown
	dw TileData_18ea9_Unown
	dw TileData_18eb3_Unown
	dw TileData_18ebd_Unown
	dw TileData_18ec7_Unown

TileData_18e09_Unown: ; 0x18e09
	dw Func_11d2
	db $30, $03
	dw $9640
	dw GengarBonusGroundGfx + $E40
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18e6d_Unown: ; 0x18e6d
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $64
	dw GengarBonusGroundGfx
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18e77_Unown: ; 0x18e77
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $67
	dw GengarBonusGroundGfx + $30
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18e81_Unown: ; 0x18e81
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $6A
	dw GengarBonusGroundGfx + $60
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18e8b_Unown: ; 0x18e8b
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $6D
	dw GengarBonusGroundGfx + $90
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18e95_Unown: ; 0x18e95
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $70
	dw GengarBonusGroundGfx + $C0
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18e9f_Unown: ; 0x18e9f
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $73
	dw GengarBonusGroundGfx + $F0
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18ea9_Unown: ; 0x18ea9
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $76
	dw GengarBonusGroundGfx + $120
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18eb3_Unown: ; 0x18eb3
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $79
	dw GengarBonusGroundGfx + $150
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18ebd_Unown: ; 0x18ebd
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $7C
	dw GengarBonusGroundGfx + $180
	db Bank(GengarBonusGroundGfx)
	db $00

TileData_18ec7_Unown: ; 0x18ec7
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $7F
	dw GengarBonusGroundGfx + $1B0
	db Bank(GengarBonusGroundGfx)
	db $00

TileDataPointers_18ed1_Unown:
	dw TileData_18ed5_Unown
	dw TileData_18ede_Unown

TileData_18ed5_Unown: ; 0x18ed5
	db $04
	dw TileData_18ee7_Unown
	dw TileData_18f03_Unown
	dw TileData_18f19_Unown
	dw TileData_18f2f_Unown

TileData_18ede_Unown: ; 0x18ede
	db $04
	dw TileData_18f4b_Unown
	dw TileData_18f67_Unown
	dw TileData_18f7d_Unown
	dw TileData_18f93_Unown

TileData_18ee7_Unown: ; 0x18ee7
	dw LoadTileLists
	db $0C ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $67
	db $26, $27, $28

	db $03 ; number of tiles
	dw vBGMap + $87
	db $1C, $1D, $1E

	db $03 ; number of tiles
	dw vBGMap + $A7
	db $3A, $13, $14

	db $03 ; number of tiles
	dw vBGMap + $C7
	db $31, $32, $09

	db $00 ; terminator

TileData_18f03_Unown: ; 0x18f03
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $6E
	db $47, $48, $49

	db $03 ; number of tiles
	dw vBGMap + $8E
	db $3A, $13, $14

	db $03 ; number of tiles
	dw vBGMap + $AE
	db $31, $32, $3B

	db $00 ; terminator ; number of tiles

TileData_18f19_Unown: ; 0x18f19
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $E3
	db $23, $24, $25

	db $03 ; number of tiles
	dw vBGMap + $103
	db $19, $1A, $1B

	db $03 ; number of tiles
	dw vBGMap + $123
	db $0E, $0F, $10

	db $00 ; terminator ; number of tiles

TileData_18f2f_Unown: ; 0x18f2f
	dw LoadTileLists
	db $0C ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $ED
	db $26, $27, $28

	db $03 ; number of tiles
	dw vBGMap + $10D
	db $1C, $1D, $1E

	db $03 ; number of tiles
	dw vBGMap + $12D
	db $12, $13, $14

	db $03 ; number of tiles
	dw vBGMap + $14D
	db $07, $08, $09

	db $00 ; terminator

TileData_18f4b_Unown: ; 0x18f4b
	dw LoadTileLists
	db $0C ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $67
	db $D9, $D9, $D9

	db $03 ; number of tiles
	dw vBGMap + $87
	db $D9, $D9, $D9

	db $03 ; number of tiles
	dw vBGMap + $A7
	db $74, $75, $76

	db $03 ; number of tiles
	dw vBGMap + $C7
	db $77, $78, $79

	db $00 ; terminator

TileData_18f67_Unown: ; 0x18f67
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $6E
	db $D9, $D9, $D9

	db $03 ; number of tiles
	dw vBGMap + $8E
	db $74, $75, $76

	db $03 ; number of tiles
	dw vBGMap + $AE
	db $77, $78, $7F

	db $00 ; terminator ; number of tiles

TileData_18f7d_Unown: ; 0x18f7d
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $E3
	db $DB, $38, $39

	db $03 ; number of tiles
	dw vBGMap + $103
	db $7A, $7B, $7C

	db $03 ; number of tiles
	dw vBGMap + $123
	db $7D, $7E, $7F

	db $00 ; terminator ; number of tiles

TileData_18f93_Unown: ; 0x18f93
	dw LoadTileLists
	db $0C ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $ED
	db $D9, $D9, $D9

	db $03 ; number of tiles
	dw vBGMap + $10D
	db $D9, $D9, $D9

	db $03 ; number of tiles
	dw vBGMap + $12D
	db $74, $75, $76

	db $03 ; number of tiles
	dw vBGMap + $14D
	db $77, $78, $79

	db $00 ; terminator
