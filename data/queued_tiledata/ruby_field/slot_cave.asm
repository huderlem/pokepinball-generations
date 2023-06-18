TileDataPointers_1644d_RubyField:
	dw TileData_16455_RubyField
	dw TileData_16458_RubyField
	dw TileData_1645b_RubyField
	dw TileData_16460_RubyField

TileData_16455_RubyField: ; 0x16455
	db $01
	dw TileData_16465_RubyField

TileData_16458_RubyField: ; 0x16458
	db $01
	dw TileData_1646f_RubyField

TileData_1645b_RubyField: ; 0x1645b
	db $02
	dw TileData_16479_RubyField
	dw TileData_16483_RubyField

TileData_16460_RubyField: ; 0x16460
	db $02
	dw TileData_1648D_RubyField
	dw TileData_16497_RubyField

TileData_16465_RubyField: ; 0x16465
	dw Func_11d2
	db $20, $02
	dw vTilesSH tile $46
	dw StageRubyFieldTopBaseGameBoyGfx + $1c0
	db Bank(StageRubyFieldTopBaseGameBoyGfx)
	db $00

TileData_1646f_RubyField: ; 0x1646f
	dw Func_11d2
	db $20, $02
	dw vTilesSH tile $46
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $340
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16479_RubyField: ; 0x16479
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $48
	dw StageRedFieldBottomBaseGameBoyGfx + $c80
	db Bank(StageRedFieldBottomBaseGameBoyGfx)
	db $00

TileData_16483_RubyField: ; 0x16483
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $4A
	dw StageRedFieldBottomBaseGameBoyGfx + $CA0
	db Bank(StageRedFieldBottomBaseGameBoyGfx)
	db $00

TileData_1648D_RubyField: ; 0x1648D
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $48
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $340
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16497_RubyField: ; 0x16497
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $4A
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $360
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileDataPointers_164a1_RubyField:
	dw TileData_164a9_RubyField
	dw TileData_164ac_RubyField
	dw TileData_164af_RubyField
	dw TileData_164b2_RubyField

TileData_164a9_RubyField: ; 0x164a9
	db $01
	dw TileData_164b5_RubyField

TileData_164ac_RubyField: ; 0x164ac
	db $01
	dw TileData_164be_RubyField

TileData_164af_RubyField: ; 0x164af
	db $01
	dw TileData_164c7_RubyField

TileData_164b2_RubyField: ; 0x164b2
	db $01
	dw TileData_164d5_RubyField

TileData_164b5_RubyField: ; 0x164b5
	dw LoadTileLists
	db $02

	db $02
	dw vBGMap + $229
	db $d4, $d5

	db $00

TileData_164be_RubyField: ; 0x164be
	dw LoadTileLists
	db $02

	db $02

	dw vBGMap + $229
	db $d6, $d7

	db $00

TileData_164c7_RubyField: ; 0x164c7
	dw LoadTileLists
	db $04

	db $02
	dw vBGMap + $9
	db $38, $39

	db $02
	dw vBGMap + $29
	db $3a, $3b

	db $00

TileData_164d5_RubyField: ; 0x164d5
	dw LoadTileLists
	db $04

	db $02
	dw vBGMap + $9
	db $3c, $3d

	db $02
	dw vBGMap + $29
	db $3e, $3f

	db $00
