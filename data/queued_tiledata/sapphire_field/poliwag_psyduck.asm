TileDataPointers_1e00f_SapphireField:
	dw SapphireFieldButtonNotHitPointer ;button is not hit
	dw SapphireFieldButtonHitPointer ;button is hit
	dw TileData_1e023_SapphireField
	dw TileData_1e026_SapphireField
	dw TileData_1e029_SapphireField
	dw TileData_1e02c_SapphireField
	dw TileData_1e02f_SapphireField

SapphireFieldButtonNotHitPointer: ; 0x1e01d
	db $01
	dw SapphireFieldButtonNotHitTileData

SapphireFieldButtonHitPointer: ; 0x1e020
	db $01
	dw SapphireFieldButtonHitTileData

TileData_1e023_SapphireField: ; 0x1e023
	db $01
	dw TileData_1e04a_SapphireField

TileData_1e026_SapphireField: ; 0x1e026
	db $01
	dw TileData_1e05c_SapphireField

TileData_1e029_SapphireField: ; 0x1e029
	db $01
	dw TileData_1e06e_SapphireField

TileData_1e02c_SapphireField: ; 0x1e02c
	db $01
	dw TileData_1e080_SapphireField

TileData_1e02f_SapphireField: ; 0x1e02f
	db $01
	dw TileData_1e092_SapphireField

SapphireFieldButtonNotHitTileData: ; 0x1e032
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $A3
	db $35

	db $01 ; number of tiles
	dw vBGMap + $C3
	db $36

	db $00 ; terminator

SapphireFieldButtonHitTileData: ; 0x1e03e
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $A3
	db $37

	db $01 ; number of tiles
	dw vBGMap + $C3
	db $38

	db $00 ; terminator

TileData_1e04a_SapphireField: ; 0x1e04a
	dw LoadTileLists
	db $05 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $90
	db $4F

	db $02 ; number of tiles
	dw vBGMap + $AF
	db $50, $51

	db $02 ; number of tiles
	dw vBGMap + $CF
	db $52, $53

	db $00 ; terminator

TileData_1e05c_SapphireField: ; 0x1e05c
	dw LoadTileLists
	db $05 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $90
	db $54

	db $02 ; number of tiles
	dw vBGMap + $AF
	db $55, $56

	db $02 ; number of tiles
	dw vBGMap + $CF
	db $57, $58

	db $00 ; terminator

TileData_1e06e_SapphireField: ; 0x1e06e
	dw LoadTileLists
	db $05 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $90
	db $59

	db $02 ; number of tiles
	dw vBGMap + $AF
	db $5A, $5B

	db $02 ; number of tiles
	dw vBGMap + $CF
	db $5C, $5D

	db $00 ; terminator

TileData_1e080_SapphireField: ; 0x1e080
	dw LoadTileLists
	db $05 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $90
	db $59

	db $02 ; number of tiles
	dw vBGMap + $AF
	db $5A, $5E

	db $02 ; number of tiles
	dw vBGMap + $CF
	db $5C, $5F

	db $00 ; terminator

TileData_1e092_SapphireField: ; 0x1e092
	dw LoadTileLists
	db $05 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $90
	db $60

	db $02 ; number of tiles
	dw vBGMap + $AF
	db $61, $62

	db $02 ; number of tiles
	dw vBGMap + $CF
	db $63, $64

	db $00 ; terminator

TileDataPointers_1e1d6_SapphireField:
	dw SapphireFieldUnown0TilesPointer
	dw SapphireFieldUnown1TilesPointer
	dw SapphireFieldUnown2TilesPointer
	dw SapphireFieldUnown3TilesPointer
	dw TileData_1e1fe_SapphireField
	dw TileData_1e201_SapphireField
	dw TileData_1e204_SapphireField
	dw TileData_1e207_SapphireField
	dw TileData_1e20a_SapphireField
	dw TileData_1e20d_SapphireField
	dw TileData_1e210_SapphireField
	dw TileData_1e213_SapphireField
	dw TileData_1e216_SapphireField
	dw TileData_1e219_SapphireField
	
SapphireFieldUnown0TilesPointer: ; 0x1e1f2
	db $01
	dw SapphireFieldUnown0TileData

SapphireFieldUnown1TilesPointer: ; 0x1e1f5
	db $01
	dw SapphireFieldUnown1TileData

SapphireFieldUnown2TilesPointer: ; 0x1e1f8
	db $01
	dw SapphireFieldUnown2TileData

SapphireFieldUnown3TilesPointer: ; 0x1e1fb
	db $01
	dw SapphireFieldUnown3TileData

TileData_1e1fe_SapphireField: ; 0x1e1fe
	db $01
	dw TileData_1e28c_SapphireField

TileData_1e201_SapphireField: ; 0x1e201
	db $01
	dw TileData_1e2a2_SapphireField

TileData_1e204_SapphireField: ; 0x1e204
	db $01
	dw TileData_1e2b8_SapphireField

TileData_1e207_SapphireField: ; 0x1e207
	db $01
	dw TileData_1e2ce_SapphireField

TileData_1e20a_SapphireField: ; 0x1e20a
	db $01
	dw TileData_1e2e4_SapphireField

TileData_1e20d_SapphireField: ; 0x1e20d
	db $01
	dw TileData_1e2fa_SapphireField

TileData_1e210_SapphireField: ; 0x1e210
	db $01
	dw TileData_1e310_SapphireField

TileData_1e213_SapphireField: ; 0x1e213
	db $01
	dw TileData_1e326_SapphireField

TileData_1e216_SapphireField: ; 0x1e216
	db $01
	dw TileData_1e336_SapphireField

TileData_1e219_SapphireField: ; 0x1e219
	db $01
	dw TileData_1e346_SapphireField

SapphireFieldUnown0TileData: ; 0x1e21c
	dw LoadTileLists
	db $0C ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $60
	db $36, $37, $38

	db $03 ; number of tiles
	dw vBGMap + $80
	db $39, $3A, $3B

	db $03 ; number of tiles
	dw vBGMap + $A0
	db $4C, $4D, $4E

	db $03 ; number of tiles
	dw vBGMap + $C0
	db $4F, $50, $51

	db $00 ; terminator

SapphireFieldUnown1TileData: ; 0x1e238
	dw LoadTileLists
	db $0C ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $60
	db $3C, $37, $38

	db $03 ; number of tiles
	dw vBGMap + $80
	db $3D, $3E, $3B

	db $03 ; number of tiles
	dw vBGMap + $A0
	db $52, $53, $54

	db $03 ; number of tiles
	dw vBGMap + $C0
	db $55, $56, $57

	db $00 ; terminator

SapphireFieldUnown2TileData: ; 0x1e254
	dw LoadTileLists
	db $0C ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $60
	db $40, $41, $38

	db $03 ; number of tiles
	dw vBGMap + $80
	db $42, $43, $3B

	db $03 ; number of tiles
	dw vBGMap + $A0
	db $52, $53, $54

	db $03 ; number of tiles
	dw vBGMap + $C0
	db $55, $56, $57

	db $00 ; terminator

SapphireFieldUnown3TileData: ; 0x1e270
	dw LoadTileLists
	db $0C ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $60
	db $36, $46, $47

	db $03 ; number of tiles
	dw vBGMap + $80
	db $48, $49, $4A

	db $03 ; number of tiles
	dw vBGMap + $A0
	db $52, $53, $54

	db $03 ; number of tiles
	dw vBGMap + $C0
	db $55, $56, $57

	db $00 ; terminator

TileData_1e28c_SapphireField: ; 0x1e28c
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $65, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $66, $67, $68

	db $03 ; number of tiles
	dw vBGMap + $D1
	db $69, $6A, $6B

	db $00 ; terminator

TileData_1e2a2_SapphireField: ; 0x1e2a2
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $6C, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $6D, $6E, $68

	db $03 ; number of tiles
	dw vBGMap + $D1
	db $6F, $70, $6B

	db $00 ; terminator

TileData_1e2b8_SapphireField: ; 0x1e2b8
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $6C, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $66, $72, $68

	db $03 ; number of tiles
	dw vBGMap + $D1
	db $69, $73, $6B

	db $00 ; terminator

TileData_1e2ce_SapphireField: ; 0x1e2ce
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $75, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $66, $76, $77

	db $03 ; number of tiles
	dw vBGMap + $D1
	db $69, $78, $79

	db $00 ; terminator

TileData_1e2e4_SapphireField: ; 0x1e2e4
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $80
	db $3F, $3A, $3B

	db $03 ; number of tiles
	dw vBGMap + $A0
	db $4C, $4D, $4E

	db $03 ; number of tiles
	dw vBGMap + $C0
	db $4F, $50, $51

	db $00 ; terminator

TileData_1e2fa_SapphireField: ; 0x1e2fa
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $80
	db $44, $45, $3B

	db $03 ; number of tiles
	dw vBGMap + $A0
	db $4C, $4D, $4E

	db $03 ; number of tiles
	dw vBGMap + $C0
	db $4F, $50, $51

	db $00 ; terminator

TileData_1e310_SapphireField: ; 0x1e310
	dw LoadTileLists
	db $09 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $80
	db $39, $4B, $4A

	db $03 ; number of tiles
	dw vBGMap + $A0
	db $4C, $4D, $4E

	db $03 ; number of tiles
	dw vBGMap + $C0
	db $4F, $50, $51

	db $00 ; terminator

TileData_1e326_SapphireField: ; 0x1e326
	dw LoadTileLists
	db $06 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $65, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $6D, $71, $68

	db $00 ; terminator

TileData_1e336_SapphireField: ; 0x1e336
	dw LoadTileLists
	db $06 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $65, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $66, $74, $68

	db $00 ; terminator

TileData_1e346_SapphireField: ; 0x1e346
	dw LoadTileLists
	db $06 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $65, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $66, $67, $77

	db $00 ; terminator
