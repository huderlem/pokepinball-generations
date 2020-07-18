LoadChinchouStateTable_RubyField:
	dw LoadChinchouState0_RubyField
	dw LoadChinchouState1_RubyField
	dw LoadChinchouState2_RubyField
	dw LoadChinchouState3_RubyField

LoadChinchouState0_RubyField: ;0x16918
	db $02
	dw TileData_16921_RubyField
	dw TransitionToUnlitChinchou_RubyField

LoadChinchouState1_RubyField: ;0x1691b
	db $02
	dw TileData_16934_RubyField
    dw TransitionToLitChinchou_RubyField

LoadChinchouState2_RubyField: ;0x1691e
	db $02
	dw TileData_16947_RubyField
	dw TransitionToUnlitChinchou_RubyField
	
LoadChinchouState3_RubyField: ;0x1691e
	db $02
	dw TileData_16947_RubyField
	dw TransitionToLitChinchou_RubyField

TileData_16921_RubyField: ; 0x16921
	dw LoadTileLists
	db $03

	db $02
	dw vBGMap + $1E7
	db $C6, $C7

	db $01
	dw vBGMap + $207
	db $C8

	db $00

TileData_16934_RubyField: ; 0x16934
	dw LoadTileLists
	db $03

	db $02
	dw vBGMap + $1E7
	db $C6, $C7

	db $01
	dw vBGMap + $207
	db $C8

	db $00

TileData_16947_RubyField: ; 0x16947
	dw LoadTileLists
	db $03

	db $02
	dw vBGMap + $1E7
	db $CA, $CB

	db $01
	dw vBGMap + $207
	db $CC

	db $00

TileDataPointers_16980_RubyField: ;for lower field indicator
	dw TileData_16984_RubyField
	dw TileData_16987_RubyField

TileData_16984_RubyField: ; 0x16984
	db $01
	dw TileData_1698a_RubyField

TileData_16987_RubyField: ; 0x16987
	db $01
	dw TileData_16998_RubyField

TileData_1698a_RubyField: ; 0x1698a
	dw LoadTileLists
	db $04

	db $02
	dw vBGMap + $40
	db $BC, $BD

	db $02
	dw vBGMap + $60
	db $BE, $BF

	db $00

TileData_16998_RubyField: ; 0x16998
	dw LoadTileLists
	db $04

	db $02
	dw vBGMap + $40
	db $C0, $C1

	db $02
	dw vBGMap + $60
	db $C2, $C3

	db $00

TransitionToLitChinchou_RubyField:
    dw LoadPalettes
	db $08
	db $04 ; number of colors
	db $18
	dw StageRubyFieldTopBGPalette3Lit
	db Bank(StageRubyFieldTopBGPalette3Lit)
	db $00 ; terminator
	
TransitionToUnlitChinchou_RubyField:
    dw LoadPalettes
	db $08
	db $04 ; number of colors
	db $18
	dw StageRubyFieldTopBGPalette3Unlit
	db Bank(StageRubyFieldTopBGPalette3Unlit)
	db $00 ; terminator
