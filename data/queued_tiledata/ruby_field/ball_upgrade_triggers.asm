TileDataPointers_15511_RubyField:
	dw TileData_1551d_RubyField
	dw TileData_15523_RubyField
	dw TileData_1552a_RubyField

TileDataPointers_15517_RubyField:
	dw TileData_15530_RubyField
	dw TileData_15536_RubyField
	dw TileData_1553d_RubyField

TileData_1551d_RubyField: ; 0x1551d
	db $01 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $E7
	db $ac

	db $00 ; terminator

TileData_15523_RubyField: ; 0x15523
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $C9
	db $ad, $ae

	db $00 ; terminator

TileData_1552a_RubyField: ; 0x1552a
	db $01 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $CC
	db $af

	db $00 ; terminator

TileData_15530_RubyField: ; 0x15530
	db $01 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $E7
	db $66

	db $00 ; terminator

TileData_15536_RubyField: ; 0x15536
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $C9
	db $68, $69

	db $00 ; terminator

TileData_1553d_RubyField: ; 0x1553d
	db $01 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $CC
	db $6a

	db $00 ; terminator

TileDataPointers_15543_RubyField:
	dw TileData_1554f_RubyField
	dw TileData_15555_RubyField
	dw TileData_1555c_RubyField

TileDataPointers_15549_RubyField:
	dw TileData_15562_RubyField
	dw TileData_15568_RubyField
	dw TileData_1556F_RubyField

TileData_1554f_RubyField: ; 0x1554f
	db $01 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $e7
	db $3D

	db $00 ; terminator

TileData_15555_RubyField: ; 0x15555
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $c9
	db $3F, $40

	db $00 ; terminator

TileData_1555c_RubyField: ; 0x1555c
	db $01 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $cc
	db $41

	db $00 ; terminator

TileData_15562_RubyField: ; 0x15562
	db $01 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $e7
	db $37

	db $00 ; terminator

TileData_15568_RubyField: ; 0x15568
	db $02 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $c9
	db $39, $3a

	db $00 ; terminator

TileData_1556F_RubyField: ; 0x1556F
	db $01 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $cc
	db $3B

	db $00 ; terminator
