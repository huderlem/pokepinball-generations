TileDataPointers_1f1b5_SapphireField:
	dw TileData_1f1bd_SapphireField
	dw TileData_1f1c0_SapphireField
	dw TileData_1f1c3_SapphireField
	dw TileData_1f1c6_SapphireField

TileData_1f1bd_SapphireField: ; 0x1f1bd
	db $01
	dw TileData_1f1c9_SapphireField

TileData_1f1c0_SapphireField: ; 0x1f1c0
	db $01
	dw TileData_1f1d7_SapphireField

TileData_1f1c3_SapphireField: ; 0x1f1c3
	db $01
	dw TileData_1f1e5_SapphireField

TileData_1f1c6_SapphireField: ; 0x1f1c6
	db $01
	dw TileData_1f1f3_SapphireField

TileData_1f1c9_SapphireField: ; 0x1f1c9
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $189
	db $70, $71

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $72, $73

	db $00 ; terminator

TileData_1f1d7_SapphireField: ; 0x1f1d7
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $189
	db $74, $75

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $76, $77

	db $00 ; terminator

TileData_1f1e5_SapphireField: ; 0x1f1e5
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $189
	db $78, $79

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $7A, $7B

	db $00 ; terminator

TileData_1f1f3_SapphireField: ; 0x1f1f3
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $189
	db $7C, $7D

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $7E, $7F

	db $00 ; terminator

TileDataPointers_1f201_SapphireField:
	dw TileData_1f209_SapphireField
	dw TileData_1f20c_SapphireField
	dw TileData_1f20f_SapphireField
	dw TileData_1f212_SapphireField

TileData_1f209_SapphireField: ; 0x1f209
	db $01
	dw TileData_1f215_SapphireField

TileData_1f20c_SapphireField: ; 0x1f20c
	db $01
	dw TileData_1f228_SapphireField

TileData_1f20f_SapphireField: ; 0x1f20f
	db $01
	dw TileData_1f23b_SapphireField

TileData_1f212_SapphireField: ; 0x1f212
	db $01
	dw TileData_1f24e_SapphireField

TileData_1f215_SapphireField: ; 0x1f215
	dw LoadTileLists
	db $06 ; total number of tiles

	db $02 ; number of otiles
	dw vBGMap + $189
	db $6C, $6D

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $6E, $6F

	db $02
	dw vBGMap + $1c9
	db $70, $71

	db $00 ; terminator

TileData_1f228_SapphireField: ; 0x1f228
	dw LoadTileLists
	db $06 ; total number of tiles

	db $02 ; number of otiles
	dw vBGMap + $189
	db $72, $80

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $73, $74

	db $02
	dw vBGMap + $1c9
	db $75, $80

	db $00 ; terminator

TileData_1f23b_SapphireField: ; 0x1f23b
	dw LoadTileLists
	db $06 ; total number of tiles

	db $02 ; number of otiles
	dw vBGMap + $189
	db $76, $77

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $78, $79

	db $02
	dw vBGMap + $1c9
	db $7A, $7B

	db $00 ; terminator

TileData_1f24e_SapphireField: ; 0x1f24e
	dw LoadTileLists
	db $06 ; total number of tiles

	db $02 ; number of otiles
	dw vBGMap + $189
	db $80, $7C

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $7D, $7E

	db $02
	dw vBGMap + $1c9
	db $80, $7F

	db $00 ; terminator
