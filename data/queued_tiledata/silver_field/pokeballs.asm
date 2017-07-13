TileDataPointers_1f2b9_SilverField:
	dw TileData_1f2c1_SilverField
	dw TileData_1f2cc_SilverField
	dw TileData_1f2d7_SilverField
	dw TileData_1f2e2_SilverField

TileData_1f2c1_SilverField: ; 0x1f2c1
	db $06 ; total number of tiles

	db $06 ; number of tiles
	dw vBGMap + $107
	db $B0, $B1, $B0, $B1, $B0, $B1

	db $00 ; terminator

TileData_1f2cc_SilverField: ; 0x1f2cc
	db $06 ; total number of tiles

	db $06 ; number of tiles
	dw vBGMap + $107
	db $AE, $AF, $B0, $B1, $B0, $B1

	db $00 ; terminator

TileData_1f2d7_SilverField: ; 0x1f2d7
	db $06 ; total number of tiles

	db $06 ; number of tiles
	dw vBGMap + $107
	db $AE, $AF, $AE, $AF, $B0, $B1

	db $00 ; terminator

TileData_1f2e2_SilverField: ; 0x1f2e2
	db $06 ; total number of tiles

	db $06 ; number of tiles
	dw vBGMap + $107
	db $AE, $AF, $AE, $AF, $AE, $AF

	db $00 ; terminator
