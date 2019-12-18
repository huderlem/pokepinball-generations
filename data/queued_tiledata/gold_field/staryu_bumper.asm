LoadChinchouStateTable:
	dw LoadChinchouState0
	dw LoadChinchouState1
	dw LoadChinchouState2
	dw LoadChinchouState3

LoadChinchouState0: ;0x16918
	db $02
	dw TileData_16921_GoldField
	dw TransitionToUnlitChinchou

LoadChinchouState1: ;0x1691b
	db $02
	dw TileData_16934_GoldField
    dw TransitionToLitChinchou

LoadChinchouState2: ;0x1691e
	db $02
	dw TileData_16947_GoldField
	dw TransitionToUnlitChinchou
	
LoadChinchouState3: ;0x1691e
	db $02
	dw TileData_16947_GoldField
	dw TransitionToLitChinchou

TileData_16921_GoldField: ; 0x16921
	dw LoadTileLists
	db $03

	db $02
	dw vBGMap + $1E7
	db $C6, $C7

	db $01
	dw vBGMap + $207
	db $C8

	db $00

TileData_16934_GoldField: ; 0x16934
	dw LoadTileLists
	db $03

	db $02
	dw vBGMap + $1E7
	db $C6, $C7

	db $01
	dw vBGMap + $207
	db $C8

	db $00

TileData_16947_GoldField: ; 0x16947
	dw LoadTileLists
	db $03

	db $02
	dw vBGMap + $1E7
	db $CA, $CB

	db $01
	dw vBGMap + $207
	db $CC

	db $00

TileDataPointers_16980_GoldField: ;for lower field indicator
	dw TileData_16984_GoldField
	dw TileData_16987_GoldField

TileData_16984_GoldField: ; 0x16984
	db $01
	dw TileData_1698a_GoldField

TileData_16987_GoldField: ; 0x16987
	db $01
	dw TileData_16998_GoldField

TileData_1698a_GoldField: ; 0x1698a
	dw LoadTileLists
	db $04

	db $02
	dw vBGMap + $40
	db $BC, $BD

	db $02
	dw vBGMap + $60
	db $BE, $BF

	db $00

TileData_16998_GoldField: ; 0x16998
	dw LoadTileLists
	db $04

	db $02
	dw vBGMap + $40
	db $C0, $C1

	db $02
	dw vBGMap + $60
	db $C2, $C3

	db $00

TransitionToLitChinchou:
    dw LoadPalettes
	db $08
	db $04 ; number of colors
	db $18
	dw StageGoldFieldTopBGPalette3Lit
	db Bank(StageGoldFieldTopBGPalette3Lit)
	db $00 ; terminator
	
TransitionToUnlitChinchou:
    dw LoadPalettes
	db $08
	db $04 ; number of colors
	db $18
	dw StageGoldFieldTopBGPalette3Unlit
	db Bank(StageGoldFieldTopBGPalette3Unlit)
	db $00 ; terminator
