TileDataPointers_1e91e_SilverField:
	dw TileData_1e926_SilverField
	dw TileData_1e929_SilverField
	dw TileData_1e92c_SilverField
	dw TileData_1e931_SilverField

TileData_1e926_SilverField: ; 0x1e926
	db $01
	dw TileData_1e936_SilverField

TileData_1e929_SilverField: ; 0x1e929
	db $01
	dw TileData_1e93f_SilverField

TileData_1e92c_SilverField: ; 0x1e92c
	db $02
	dw TileData_1e948_SilverField
	dw TileData_1e952_SilverField

TileData_1e931_SilverField: ; 0x1e931
	db $02
	dw TileData_1e95c_SilverField
	dw TileData_1e966_SilverField

TileData_1e936_SilverField: ; 0x1e936
	dw LoadTileLists
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $229
	db $EE, $EF

	db $00 ; terminator

TileData_1e93f_SilverField: ; 0x1e93f
	dw LoadTileLists
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $229
	db $F0, $F1

	db $00 ; terminator

TileData_1e948_SilverField: ; 0x1e948
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1F
	dw StageSilverFieldBottomBaseGameBoyGfx + $9F0
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e952_SilverField: ; 0x1e952
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $21
	dw StageSilverFieldBottomBaseGameBoyGfx + $A10
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e95c_SilverField: ; 0x1e95c
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1F
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1BC0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e966_SilverField: ; 0x1e966
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $21
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1BE0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileDataPointers_1e970_SilverField:
	dw TileData_1e978_SilverField
	dw TileData_1e97d_SilverField
	dw TileData_1e980_SilverField
	dw TileData_1e983_SilverField

TileData_1e978_SilverField: ; 0x1e978
	db $02
	dw TileData_1e986_SilverField
	dw TileData_1e98F_SilverField

TileData_1e97d_SilverField: ; 0x1e97d
	db $01
	dw TileData_1e99b_SilverField

TileData_1e980_SilverField: ; 0x1e980
	db $01
	dw TileData_1e9a4_SilverField

TileData_1e983_SilverField: ; 0x1e983
	db $01
	dw TileData_1e9b2_SilverField

TileData_1e986_SilverField: ; 0x1e986
	dw LoadTileLists
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $229
	db $F0, $F1

	db $00 ; terminator

TileData_1e98F_SilverField: ; 0x1e98F
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $224
	db $D8

	db $01 ; number of tiles
	dw vBGMap + $22f
	db $EC

	db $00 ; terminator

TileData_1e99b_SilverField: ; 0x1e99b
	dw LoadTileLists
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $229
	db $F2, $F3

	db $00 ; terminator

TileData_1e9a4_SilverField: ; 0x1e9a4
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw $9809
	db $15, $16

	db $02 ; terminator
	dw vBGMap + $29
	db $17, $18

	db $00 ; terminator

TileData_1e9b2_SilverField: ; 0x1e9b2
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $9
	db $19, $1A

	db $02 ; terminator
	dw vBGMap + $29
	db $1B, $1C

	db $00 ; terminator
