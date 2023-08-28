TileDataPointers_1e91e_SapphireField:
	dw TileData_1e926_SapphireField
	dw TileData_1e929_SapphireField
	dw TileData_1e92c_SapphireField
	dw TileData_1e931_SapphireField

TileData_1e926_SapphireField: ; 0x1e926
	db $01
	dw TileData_1e936_SapphireField

TileData_1e929_SapphireField: ; 0x1e929
	db $01
	dw TileData_1e93f_SapphireField

TileData_1e92c_SapphireField: ; 0x1e92c
	db $02
	dw TileData_1e948_SapphireField
	dw TileData_1e952_SapphireField

TileData_1e931_SapphireField: ; 0x1e931
	db $02
	dw TileData_1e95c_SapphireField
	dw TileData_1e966_SapphireField

TileData_1e936_SapphireField: ; 0x1e936
	dw LoadTileLists
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $229
	db $EE, $EF

	db $00 ; terminator

TileData_1e93f_SapphireField: ; 0x1e93f
	dw LoadTileLists
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $229
	db $F0, $F1

	db $00 ; terminator

TileData_1e948_SapphireField: ; 0x1e948
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1F
	dw StageSapphireFieldBottomBaseGameBoyGfx + $9F0
	db Bank(StageSapphireFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e952_SapphireField: ; 0x1e952
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $21
	dw StageSapphireFieldBottomBaseGameBoyGfx + $A10
	db Bank(StageSapphireFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e95c_SapphireField: ; 0x1e95c
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1F
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1BC0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e966_SapphireField: ; 0x1e966
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $21
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1BE0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileDataPointers_1e970_SapphireField:
	dw TileData_1e978_SapphireField
	dw TileData_1e97d_SapphireField
	dw TileData_1e980_SapphireField
	dw TileData_1e983_SapphireField

TileData_1e978_SapphireField: ; 0x1e978
	db $02
	dw TileData_1e986_SapphireField
	dw TileData_1e98F_SapphireField

TileData_1e97d_SapphireField: ; 0x1e97d
	db $01
	dw TileData_1e99b_SapphireField

TileData_1e980_SapphireField: ; 0x1e980
	db $01
	dw TileData_1e9a4_SapphireField

TileData_1e983_SapphireField: ; 0x1e983
	db $01
	dw TileData_1e9b2_SapphireField

TileData_1e986_SapphireField: ; 0x1e986
	dw LoadTileLists
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $229
	db $F0, $F1

	db $00 ; terminator

TileData_1e98F_SapphireField: ; 0x1e98F
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $224
	db $D8

	db $01 ; number of tiles
	dw vBGMap + $22f
	db $EC

	db $00 ; terminator

TileData_1e99b_SapphireField: ; 0x1e99b
	dw LoadTileLists
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $229
	db $F2, $F3

	db $00 ; terminator

TileData_1e9a4_SapphireField: ; 0x1e9a4
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw $9809
	db $15, $16

	db $02 ; terminator
	dw vBGMap + $29
	db $17, $18

	db $00 ; terminator

TileData_1e9b2_SapphireField: ; 0x1e9b2
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $9
	db $19, $1A

	db $02 ; terminator
	dw vBGMap + $29
	db $1B, $1C

	db $00 ; terminator
