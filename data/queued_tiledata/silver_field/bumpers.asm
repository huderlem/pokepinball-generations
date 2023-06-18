TileDataPointers_1ceca_SilverField:
	dw TileData_1ced2_SilverField
	dw TileData_1ced5_SilverField
	dw TileData_1ced8_SilverField
	dw TileData_1cedb_SilverField

TileData_1ced2_SilverField: ; 0x1ced2
	db $01
	dw TileData_1cede_SilverField

TileData_1ced5_SilverField: ; 0x1ced5
	db $01
	dw TileData_1cef5_SilverField

TileData_1ced8_SilverField: ; 0x1ced8
	db $01
	dw TileData_1cf0c_SilverField

TileData_1cedb_SilverField: ; 0x1cedb
	db $01
	dw TileData_1cf23_SilverField

TileData_1cede_SilverField: ; 0x1cede
	dw LoadTileLists
	db $07 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $124
	db $61

	db $02 ; number of tiles
	dw vBGMap + $144
	db $62, $63

	db $02 ; number of tiles
	dw vBGMap + $164
	db $64, $65

	db $02 ; number of tiles
	dw vBGMap + $185
	db $66, $67

	db $00 ; number of tiles

TileData_1cef5_SilverField: ; 0x1cef5
	dw LoadTileLists
	db $07 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $124
	db $68

	db $02 ; number of tiles
	dw vBGMap + $144
	db $69, $6A

	db $02 ; number of tiles
	dw vBGMap + $164
	db $6B, $6C

	db $02 ; number of tiles
	dw vBGMap + $185
	db $6D, $6E

	db $00 ; number of tiles

TileData_1cf0c_SilverField: ; 0x1cf0c
	dw LoadTileLists
	db $07 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $12F
	db $6F

	db $02 ; number of tiles
	dw vBGMap + $14E
	db $70, $71

	db $02 ; number of tiles
	dw vBGMap + $16E
	db $72, $73

	db $02 ; number of tiles
	dw vBGMap + $18D
	db $74, $75

	db $00 ; number of tiles

TileData_1cf23_SilverField: ; 0x1cf23
	dw LoadTileLists
	db $07 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $12F
	db $76

	db $02 ; number of tiles
	dw vBGMap + $14E
	db $77, $78

	db $02 ; number of tiles
	dw vBGMap + $16E
	db $79, $7A

	db $02 ; number of tiles
	dw vBGMap + $18D
	db $7B, $7C

	db $00 ; number of tiles

TileDataPointers_1cf3a_SilverField:
	dw TileData_1cf42_SilverField
	dw TileData_1cf45_SilverField
	dw TileData_1cf48_SilverField
	dw TileData_1cf4b_SilverField

TileData_1cf42_SilverField: ; 0x1cf42
	db $01
	dw TileData_1cf4e_SilverField

TileData_1cf45_SilverField: ; 0x1cf45
	db $01
	dw TileData_1cf65_SilverField

TileData_1cf48_SilverField: ; 0x1cf48
	db $01
	dw TileData_1cf7c_SilverField

TileData_1cf4b_SilverField: ; 0x1cf4b
	db $01
	dw TileData_1cf93_SilverField

TileData_1cf4e_SilverField: ; 0x1cf4e
	dw LoadTileLists
	db $07 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $124
	db $39

	db $02 ; number of tiles
	dw vBGMap + $144
	db $3A, $3B

	db $02 ; number of tiles
	dw vBGMap + $164
	db $3C, $3D

	db $02 ; number of tiles
	dw vBGMap + $185
	db $3E, $3F

	db $00 ; terminator

TileData_1cf65_SilverField: ; 0x1cf65
	dw LoadTileLists
	db $07 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $124
	db $40

	db $02 ; number of tiles
	dw vBGMap + $144
	db $41, $42

	db $02 ; number of tiles
	dw vBGMap + $164
	db $43, $44

	db $02 ; number of tiles
	dw vBGMap + $185
	db $45, $46

	db $00 ; terminator

TileData_1cf7c_SilverField: ; 0x1cf7c
	dw LoadTileLists
	db $07 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $12F
	db $39

	db $02 ; number of tiles
	dw vBGMap + $14E
	db $3B, $3A

	db $02 ; number of tiles
	dw vBGMap + $16E
	db $3D, $3C

	db $02 ; number of tiles
	dw vBGMap + $18D
	db $3F, $3E

	db $00 ; terminator

TileData_1cf93_SilverField: ; 0x1cf93
	dw LoadTileLists
	db $07 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $12F
	db $40

	db $02 ; number of tiles
	dw vBGMap + $14E
	db $42, $41

	db $02 ; number of tiles
	dw vBGMap + $16E
	db $44, $43

	db $02 ; number of tiles
	dw vBGMap + $18D
	db $46, $45

	db $00 ; terminator
