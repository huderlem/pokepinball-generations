TileDataPointers_1f1b5_SilverField:
	dw TileData_1f1bd_SilverField
	dw TileData_1f1c0_SilverField
	dw TileData_1f1c3_SilverField
	dw TileData_1f1c6_SilverField

TileData_1f1bd_SilverField: ; 0x1f1bd
	db $01
	dw TileData_1f1c9_SilverField

TileData_1f1c0_SilverField: ; 0x1f1c0
	db $01
	dw TileData_1f1d7_SilverField

TileData_1f1c3_SilverField: ; 0x1f1c3
	db $01
	dw TileData_1f1e5_SilverField

TileData_1f1c6_SilverField: ; 0x1f1c6
	db $01
	dw TileData_1f1f3_SilverField

TileData_1f1c9_SilverField: ; 0x1f1c9
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $189
	db $70, $71

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $72, $73

	db $00 ; terminator

TileData_1f1d7_SilverField: ; 0x1f1d7
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $189
	db $74, $75

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $76, $77

	db $00 ; terminator

TileData_1f1e5_SilverField: ; 0x1f1e5
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $189
	db $78, $79

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $7A, $7B

	db $00 ; terminator

TileData_1f1f3_SilverField: ; 0x1f1f3
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $189
	db $7C, $7D

	db $02 ; number of tiles
	dw vBGMap + $1a9
	db $7E, $7F

	db $00 ; terminator

TileDataPointers_1f201_SilverField:
	dw TileData_1f209_SilverField
	dw TileData_1f20c_SilverField
	dw TileData_1f20f_SilverField
	dw TileData_1f212_SilverField

TileData_1f209_SilverField: ; 0x1f209
	db $01
	dw TileData_1f215_SilverField

TileData_1f20c_SilverField: ; 0x1f20c
	db $01
	dw TileData_1f228_SilverField

TileData_1f20f_SilverField: ; 0x1f20f
	db $01
	dw TileData_1f23b_SilverField

TileData_1f212_SilverField: ; 0x1f212
	db $01
	dw TileData_1f24e_SilverField

TileData_1f215_SilverField: ; 0x1f215
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

TileData_1f228_SilverField: ; 0x1f228
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

TileData_1f23b_SilverField: ; 0x1f23b
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

TileData_1f24e_SilverField: ; 0x1f24e
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
