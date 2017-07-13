TileDataPointers_1df66_SilverField:
	dw TileData_1df74_SilverField
	dw TileData_1df77_SilverField
	dw TileData_1df7a_SilverField
	dw TileData_1df7f_SilverField
	dw TileData_1df84_SilverField
	dw TileData_1df89_SilverField
	dw TileData_1df8e_SilverField

TileData_1df74_SilverField: ; 0x1df74
	db $01
	dw TileData_1df93_SilverField

TileData_1df77_SilverField: ; 0x1df77
	db $01
	dw TileData_1df9f_SilverField

TileData_1df7a_SilverField: ; 0x1df7a
	db $02
	dw TileData_1dfab_SilverField
	dw TileData_1dfb5_SilverField

TileData_1df7f_SilverField: ; 0x1df7f
	db $02
	dw TileData_1dfbf_SilverField
	dw TileData_1dfc9_SilverField

TileData_1df84_SilverField: ; 0x1df84
	db $02
	dw TileData_1dfd3_SilverField
	dw TileData_1dfdd_SilverField

TileData_1df89_SilverField: ; 0x1df89
	db $02
	dw TileData_1dfe7_SilverField
	dw TileData_1dff1_SilverField

TileData_1df8e_SilverField: ; 0x1df8e
	db $02
	dw TileData_1dffb_SilverField
	dw TileData_1e005_SilverField

TileData_1df93_SilverField: ; 0x1df93
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $A3
	db $4A

	db $01 ; number of tiles
	dw vBGMap + $C3
	db $4B

	db $00 ; terminator

TileData_1df9f_SilverField: ; 0x1df9f
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $A3
	db $4C

	db $01 ; number of tiles
	dw vBGMap + $C3
	db $4D

	db $00 ; terminator

TileData_1dfab_SilverField: ; 0x1dfab
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $4E
	dw StageSilverFieldBottomBaseGameBoyGfx + $CE0
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1dfb5_SilverField: ; 0x1dfb5
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $51
	dw StageSilverFieldBottomBaseGameBoyGfx + $D10
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1dfbf_SilverField: ; 0x1dfbf
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $4E
	dw StageSilverFieldBottomBaseGameBoyGfx + $D30
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1dfc9_SilverField: ; 0x1dfc9
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $51
	dw StageSilverFieldBottomBaseGameBoyGfx + $D60
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1dfd3_SilverField: ; 0x1dfd3
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $4E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $20B0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1dfdd_SilverField: ; 0x1dfdd
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $51
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $20E0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1dfe7_SilverField: ; 0x1dfe7
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $4E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2100
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1dff1_SilverField: ; 0x1dff1
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $51
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2130
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1dffb_SilverField: ; 0x1dffb
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $4E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2150
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e005_SilverField: ; 0x1e005
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $51
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2180
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileDataPointers_1e00f_SilverField:
	dw TileData_1e01d_SilverField
	dw TileData_1e020_SilverField
	dw TileData_1e023_SilverField
	dw TileData_1e026_SilverField
	dw TileData_1e029_SilverField
	dw TileData_1e02c_SilverField
	dw TileData_1e02f_SilverField

TileData_1e01d_SilverField: ; 0x1e01d
	db $01
	dw TileData_1e032_SilverField

TileData_1e020_SilverField: ; 0x1e020
	db $01
	dw TileData_1e03e_SilverField

TileData_1e023_SilverField: ; 0x1e023
	db $01
	dw TileData_1e04a_SilverField

TileData_1e026_SilverField: ; 0x1e026
	db $01
	dw TileData_1e05c_SilverField

TileData_1e029_SilverField: ; 0x1e029
	db $01
	dw TileData_1e06e_SilverField

TileData_1e02c_SilverField: ; 0x1e02c
	db $01
	dw TileData_1e080_SilverField

TileData_1e02f_SilverField: ; 0x1e02f
	db $01
	dw TileData_1e092_SilverField

TileData_1e032_SilverField: ; 0x1e032
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $A3
	db $35

	db $01 ; number of tiles
	dw vBGMap + $C3
	db $36

	db $00 ; terminator

TileData_1e03e_SilverField: ; 0x1e03e
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $A3
	db $37

	db $01 ; number of tiles
	dw vBGMap + $C3
	db $38

	db $00 ; terminator

TileData_1e04a_SilverField: ; 0x1e04a
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

TileData_1e05c_SilverField: ; 0x1e05c
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

TileData_1e06e_SilverField: ; 0x1e06e
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

TileData_1e080_SilverField: ; 0x1e080
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

TileData_1e092_SilverField: ; 0x1e092
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

TileDataPointers_1e0a4_SilverField:
	dw TileData_1e0b8_SilverField
	dw TileData_1e0bf_SilverField
	dw TileData_1e0c6_SilverField
	dw TileData_1e0cd_SilverField
	dw TileData_1e0d4_SilverField
	dw TileData_1e0d9_SilverField
	dw TileData_1e0de_SilverField
	dw TileData_1e0e3_SilverField
	dw TileData_1e0e8_SilverField
	dw TileData_1e0ed_SilverField

TileData_1e0b8_SilverField: ; 0x1e0b8
	db $03
	dw TileData_1e0f0_SilverField
	dw TileData_1e0fa_SilverField
	dw TileData_1e104_SilverField

TileData_1e0bf_SilverField: ; 0x1e0bf
	db $03
	dw TileData_1e10e_SilverField
	dw TileData_1e118_SilverField
	dw TileData_1e122_SilverField

TileData_1e0c6_SilverField: ; 0x1e0c6
	db $03
	dw TileData_1e12c_SilverField
	dw TileData_1e136_SilverField
	dw TileData_1e140_SilverField

TileData_1e0cd_SilverField: ; 0x1e0cd
	db $03
	dw TileData_1e14a_SilverField
	dw TileData_1e154_SilverField
	dw TileData_1e15e_SilverField

TileData_1e0d4_SilverField: ; 0x1e0d4
	db $02
	dw TileData_1e168_SilverField
	dw TileData_1e172_SilverField

TileData_1e0d9_SilverField: ; 0x1e0d9
	db $02
	dw TileData_1e17c_SilverField
	dw TileData_1e186_SilverField

TileData_1e0de_SilverField: ; 0x1e0de
	db $02
	dw TileData_1e190_SilverField
	dw TileData_1e19a_SilverField

TileData_1e0e3_SilverField: ; 0x1e0e3
	db $02
	dw TileData_1e1a4_SilverField
	dw TileData_1e1ae_SilverField

TileData_1e0e8_SilverField: ; 0x1e0e8
	db $02
	dw TileData_1e1b8_SilverField
	dw TileData_1e1c2_SilverField

TileData_1e0ed_SilverField: ; 0x1e0ed
	db $01
	dw TileData_1e1cc_SilverField

TileData_1e0f0_SilverField: ; 0x1e0f0
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageSilverFieldBottomBaseGameBoyGfx + $C10
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e0fa_SilverField: ; 0x1e0fa
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageSilverFieldBottomBaseGameBoyGfx + $C40
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e104_SilverField: ; 0x1e104
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $47
	dw StageSilverFieldBottomBaseGameBoyGfx + $C70
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e10e_SilverField: ; 0x1e10e
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1FC0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e118_SilverField: ; 0x1e118
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2050
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e122_SilverField: ; 0x1e122
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $47
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2080
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e12c_SilverField: ; 0x1e12c
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1FF0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e136_SilverField: ; 0x1e136
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2050
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e140_SilverField: ; 0x1e140
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $47
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2080
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e14a_SilverField: ; 0x1e14a
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2020
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e154_SilverField: ; 0x1e154
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2050
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e15e_SilverField: ; 0x1e15e
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $47
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2080
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e168_SilverField: ; 0x1e168
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $58
	dw StageSilverFieldBottomBaseGameBoyGfx + $D80
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e172_SilverField: ; 0x1e172
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $5A
	dw StageSilverFieldBottomBaseGameBoyGfx + $DA0
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e17c_SilverField: ; 0x1e17c
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $58
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $21A0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e186_SilverField: ; 0x1e186
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $5A
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $21E0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e190_SilverField: ; 0x1e190
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $58
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $21A0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e19a_SilverField: ; 0x1e19a
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $5A
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2210
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e1a4_SilverField: ; 0x1e1a4
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $58
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $21C0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e1ae_SilverField: ; 0x1e1ae
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $5A
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2240
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e1b8_SilverField: ; 0x1e1b8
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageSilverFieldBottomBaseGameBoyGfx + $C40
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e1c2_SilverField: ; 0x1e1c2
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $47
	dw StageSilverFieldBottomBaseGameBoyGfx + $C70
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1e1cc_SilverField: ; 0x1e1cc
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $58
	dw StageSilverFieldBottomBaseGameBoyGfx + $D80
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileDataPointers_1e1d6_SilverField:
	dw TileData_1e1f2_SilverField
	dw TileData_1e1f5_SilverField
	dw TileData_1e1f8_SilverField
	dw TileData_1e1fb_SilverField
	dw TileData_1e1fe_SilverField
	dw TileData_1e201_SilverField
	dw TileData_1e204_SilverField
	dw TileData_1e207_SilverField
	dw TileData_1e20a_SilverField
	dw TileData_1e20d_SilverField
	dw TileData_1e210_SilverField
	dw TileData_1e213_SilverField
	dw TileData_1e216_SilverField
	dw TileData_1e219_SilverField
	
TileData_1e1f2_SilverField: ; 0x1e1f2
	db $01
	dw TileData_1e21c_SilverField

TileData_1e1f5_SilverField: ; 0x1e1f5
	db $01
	dw TileData_1e238_SilverField

TileData_1e1f8_SilverField: ; 0x1e1f8
	db $01
	dw TileData_1e254_SilverField

TileData_1e1fb_SilverField: ; 0x1e1fb
	db $01
	dw TileData_1e270_SilverField

TileData_1e1fe_SilverField: ; 0x1e1fe
	db $01
	dw TileData_1e28c_SilverField

TileData_1e201_SilverField: ; 0x1e201
	db $01
	dw TileData_1e2a2_SilverField

TileData_1e204_SilverField: ; 0x1e204
	db $01
	dw TileData_1e2b8_SilverField

TileData_1e207_SilverField: ; 0x1e207
	db $01
	dw TileData_1e2ce_SilverField

TileData_1e20a_SilverField: ; 0x1e20a
	db $01
	dw TileData_1e2e4_SilverField

TileData_1e20d_SilverField: ; 0x1e20d
	db $01
	dw TileData_1e2fa_SilverField

TileData_1e210_SilverField: ; 0x1e210
	db $01
	dw TileData_1e310_SilverField

TileData_1e213_SilverField: ; 0x1e213
	db $01
	dw TileData_1e326_SilverField

TileData_1e216_SilverField: ; 0x1e216
	db $01
	dw TileData_1e336_SilverField

TileData_1e219_SilverField: ; 0x1e219
	db $01
	dw TileData_1e346_SilverField

TileData_1e21c_SilverField: ; 0x1e21c
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

TileData_1e238_SilverField: ; 0x1e238
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

TileData_1e254_SilverField: ; 0x1e254
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

TileData_1e270_SilverField: ; 0x1e270
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

TileData_1e28c_SilverField: ; 0x1e28c
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

TileData_1e2a2_SilverField: ; 0x1e2a2
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

TileData_1e2b8_SilverField: ; 0x1e2b8
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

TileData_1e2ce_SilverField: ; 0x1e2ce
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

TileData_1e2e4_SilverField: ; 0x1e2e4
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

TileData_1e2fa_SilverField: ; 0x1e2fa
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

TileData_1e310_SilverField: ; 0x1e310
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

TileData_1e326_SilverField: ; 0x1e326
	dw LoadTileLists
	db $06 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $65, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $6D, $71, $68

	db $00 ; terminator

TileData_1e336_SilverField: ; 0x1e336
	dw LoadTileLists
	db $06 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $65, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $66, $74, $68

	db $00 ; terminator

TileData_1e346_SilverField: ; 0x1e346
	dw LoadTileLists
	db $06 ; total number of tiles

	db $03 ; number of tiles
	dw vBGMap + $91
	db $4D, $65, $4E

	db $03 ; number of tiles
	dw vBGMap + $B1
	db $66, $67, $77

	db $00 ; terminator
