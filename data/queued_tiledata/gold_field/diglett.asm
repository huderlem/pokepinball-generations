TileListDataPointers_14a11_GoldField: ; 0x14a11
	dw TileListData_14a1d_GoldField
	dw TileListData_14a20_GoldField
	dw TileListData_14a23_GoldField
	dw TileListData_14a26_GoldField
	dw TileListData_14a29_GoldField
	dw TileListData_14a2c_GoldField

TileListData_14a1d_GoldField: ; 0x14a1d
	db $01
	dw TileListData_14a2f_GoldField

TileListData_14a20_GoldField: ; 0x14a20
	db $01
	dw TileListData_14a3d_GoldField

TileListData_14a23_GoldField: ; 0x14a23
	db $01
	dw TileListData_14a4b_GoldField

TileListData_14a26_GoldField: ; 0x14a26
	db $01
	dw TileListData_14a59_GoldField

TileListData_14a29_GoldField: ; 0x14a29
	db $01
	dw TileListData_14a67_GoldField

TileListData_14a2c_GoldField: ; 0x14a2c
	db $01
	dw TileListData_14a75_GoldField

TileListData_14a2f_GoldField: ; 0x14a2f
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $a3
	db $4C, $4D

	db $02 ; number of tiles
	dw vBGMap + $c3
	db $4E, $4F

	db $00  ; terminator

TileListData_14a3d_GoldField: ; 0x14a3d
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $a3
	db $50, $51

	db $02 ; number of tiles
	dw vBGMap + $c3
	db $52, $53

	db $00  ; terminator

TileListData_14a4b_GoldField: ; 0x14a4b
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $a3
	db $54, $80

	db $02 ; number of tiles
	dw vBGMap + $c3
	db $55, $80

	db $00  ; terminator

TileListData_14a59_GoldField: ; 0x14a59
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $af
	db $56, $57

	db $02 ; number of tiles
	dw vBGMap + $cf
	db $58, $59

	db $00  ; terminator

TileListData_14a67_GoldField: ; 0x14a67
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $af
	db $5a, $5b

	db $02 ; number of tiles
	dw vBGMap + $cf
	db $5c, $5d

	db $00  ; terminator

TileListData_14a75_GoldField: ; 0x14a75
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $af
	db $80, $5e

	db $02 ; number of tiles
	dw vBGMap + $cf
	db $80, $5f

	db $00  ; terminator

TileListDataPointers_14a83_GoldField:
	dw TileListData_14a8f_GoldField
	dw TileListData_14a92_GoldField
	dw TileListData_14a95_GoldField
	dw TileListData_14a98_GoldField
	dw TileListData_14a9b_GoldField
	dw TileListData_14a9e_GoldField

TileListData_14a8f_GoldField: ; 0x14a8f
	db $01
	dw TileListData_14aa1_GoldField

TileListData_14a92_GoldField: ; 0x14a92
	db $01
	dw TileListData_14aaf_GoldField

TileListData_14a95_GoldField: ; 0x14a95
	db $01
	dw TileListData_14abd_GoldField

TileListData_14a98_GoldField: ; 0x14a98
	db $01
	dw TileListData_14acb_GoldField

TileListData_14a9b_GoldField: ; 0x14a9b
	db $01
	dw TileListData_14ad9_GoldField

TileListData_14a9e_GoldField: ; 0x14a9e
	db $01
	dw TileListData_14ae7_GoldField

TileListData_14aa1_GoldField: ; 0x14aa1
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $a3
	db $54, $55

	db $02 ; number of tiles
	dw vBGMap + $c3
	db $56, $57

	db $00

TileListData_14aaf_GoldField: ; 0x14aaf
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $a3
	db $58, $59

	db $02 ; number of tiles
	dw vBGMap + $c3
	db $5A, $5B

	db $00 ; terminator

TileListData_14abd_GoldField: ; 0x14abd
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $a3
	db $5C, $80

	db $02 ; number of tiles
	dw vBGMap + $c3
	db $5D, $80

	db $00 ; terminator

TileListData_14acb_GoldField: ; 0x14acb
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $af
	db $55, $54

	db $02 ; number of tiles
	dw vBGMap + $cf
	db $57, $56

	db $00 ; terminator

TileListData_14ad9_GoldField: ; 0x14ad9
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $af
	db $59, $58

	db $02 ; number of tiles
	dw vBGMap + $cf
	db $5B, $5A

	db $00 ; terminator

TileListData_14ae7_GoldField: ; 0x14ae7
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $af
	db $80, $5C

	db $02 ; number of tiles
	dw vBGMap + $cf
	db $80, $5D

	db $00 ; terminator

Data_14af5_GoldField: ; 0x14af5
	dw Data_14b05_GoldField
	dw Data_14b0e_GoldField
	dw Data_14b17_GoldField
	dw Data_14b20_GoldField
	dw Data_14b29_GoldField
	dw Data_14b32_GoldField
	dw Data_14b3b_GoldField
	dw Data_14b44_GoldField

Data_14b05_GoldField: ; 0x14b05
	db $04
	dw Data_14b4d_GoldField
	dw Data_14b57_GoldField
	dw Data_14b61_GoldField
	dw Data_14b6b_GoldField

Data_14b0e_GoldField: ; 0x14b0e
	db $04
	dw Data_14b75_GoldField
	dw Data_14b7f_GoldField
	dw Data_14b89_GoldField
	dw Data_14b93_GoldField

Data_14b17_GoldField: ; 0x14b17
	db $04
	dw Data_14b9d_GoldField
	dw Data_14ba7_GoldField
	dw Data_14bb1_GoldField
	dw Data_14bbb_GoldField

Data_14b20_GoldField: ; 0x14b20
	db $04
	dw Data_14bc5_GoldField
	dw Data_14bcf_GoldField
	dw Data_14bd9_GoldField
	dw Data_14be3_GoldField

Data_14b29_GoldField: ; 0x14b29
	db $04
	dw Data_14bed_GoldField
	dw Data_14bf7_GoldField
	dw Data_14c01_GoldField
	dw Data_14c0b_GoldField

Data_14b32_GoldField: ; 0x14b32
	db $04
	dw Data_14c15_GoldField
	dw Data_14c1f_GoldField
	dw Data_14c29_GoldField
	dw Data_14c33_GoldField

Data_14b3b_GoldField: ; 0x14b3b
	db $04
	dw Data_14c3d_GoldField
	dw Data_14c47_GoldField
	dw Data_14c51_GoldField
	dw Data_14c5b_GoldField

Data_14b44_GoldField: ; 0x14b44
	db $04
	dw Data_14c65_GoldField
	dw Data_14c6f_GoldField
	dw Data_14c79_GoldField
	dw Data_14c83_GoldField

Data_14b4d_GoldField: ; 0x14b4d
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $26
	dw StageGoldFieldBottomBaseGameBoyGfx + $a60
	db Bank(StageGoldFieldBottomBaseGameBoyGfx)
	db $00 ; terminator

Data_14b57_GoldField: ; 0x14b57
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $29
	dw StageGoldFieldBottomBaseGameBoyGfx + $a90
	db Bank(StageGoldFieldBottomBaseGameBoyGfx)
	db $00 ; terminator

Data_14b61_GoldField: ; 0x14b61
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $2C
	dw StageGoldFieldBottomBaseGameBoyGfx + $ac0
	db Bank(StageGoldFieldBottomBaseGameBoyGfx)
	db $00 ; terminator

Data_14b6b_GoldField: ; 0x14b6b
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $2F
	dw StageGoldFieldBottomBaseGameBoyGfx + $af0
	db Bank(StageGoldFieldBottomBaseGameBoyGfx)
	db $00 ; terminator

Data_14b75_GoldField: ; 0x14b75
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $26
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $720
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14b7f_GoldField: ; 0x14b7f
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $29
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $750
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14b89_GoldField: ; 0x14b89
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $2C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $780
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14b93_GoldField: ; 0x14b93
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $2F
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $7B0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14b9d_GoldField: ; 0x14b9d
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $26
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $7C0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14ba7_GoldField: ; 0x14ba7
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $29
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $7F0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14bb1_GoldField: ; 0x14bb1
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $2C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $820
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14bbb_GoldField: ; 0x14bbb
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $2F
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $850
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14bc5_GoldField: ; 0x14bc5
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $26
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $860
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14bcf_GoldField: ; 0x14bcf
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $29
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $890
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14bd9_GoldField: ; 0x14bd9
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $2C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $8C0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14be3_GoldField: ; 0x14be3
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $2F
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $8F0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14bed_GoldField: ; 0x14bed
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $30
	dw StageGoldFieldBottomBaseGameBoyGfx + $B00
	db Bank(StageGoldFieldBottomBaseGameBoyGfx)
	db $00 ; terminator

Data_14bf7_GoldField: ; 0x14bf7
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $33
	dw StageGoldFieldBottomBaseGameBoyGfx + $B30
	db Bank(StageGoldFieldBottomBaseGameBoyGfx)
	db $00 ; terminator

Data_14c01_GoldField: ; 0x14c01
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $36
	dw StageGoldFieldBottomBaseGameBoyGfx + $B60
	db Bank(StageGoldFieldBottomBaseGameBoyGfx)
	db $00 ; terminator

Data_14c0b_GoldField: ; 0x14c0b
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $39
	dw StageGoldFieldBottomBaseGameBoyGfx + $B90
	db Bank(StageGoldFieldBottomBaseGameBoyGfx)
	db $00 ; terminator

Data_14c15_GoldField: ; 0x14c15
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $30
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $900
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c1f_GoldField: ; 0x14c1f
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $33
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $930
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c29_GoldField: ; 0x14c29
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $36
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $960
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c33_GoldField: ; 0x14c33
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $39
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $990
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c3d_GoldField: ; 0x14c3d
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $30
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $9A0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c47_GoldField: ; 0x14c47
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $33
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $9D0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c51_GoldField: ; 0x14c51
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $36
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $A00
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c5b_GoldField: ; 0x14c5b
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $39
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $A30
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c65_GoldField: ; 0x14c65
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $30
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $A40
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c6f_GoldField: ; 0x14c6f
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $33
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $A70
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c79_GoldField: ; 0x14c79
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $36
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $AA0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

Data_14c83_GoldField: ; 0x14c83
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $39
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $AD0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileListDataPointers_14c8d_GoldField:
	dw Data_14c9d_GoldField
	dw Data_14ca0_GoldField
	dw Data_14ca3_GoldField
	dw Data_14ca6_GoldField
	dw Data_14ca9_GoldField
	dw Data_14cac_GoldField
	dw Data_14caf_GoldField
	dw Data_14cb2_GoldField

Data_14c9d_GoldField: ; 0x14c9d
	db $01
	dw TileListData_14cb5_GoldField

Data_14ca0_GoldField: ; 0x14ca0
	db $01
	dw TileListData_14ccf_GoldField

Data_14ca3_GoldField: ; 0x14ca3
	db $01
	dw TileListData_14ce9_GoldField

Data_14ca6_GoldField: ; 0x14ca6
	db $01
	dw TileListData_14d03_GoldField

Data_14ca9_GoldField: ; 0x14ca9
	db $01
	dw TileListData_14d1d_GoldField

Data_14cac_GoldField: ; 0x14cac
	db $01
	dw TileListData_14d37_GoldField

Data_14caf_GoldField: ; 0x14caf
	db $01
	dw TileListData_14d51_GoldField

Data_14cb2_GoldField: ; 0x14cb2
	db $01
	dw TileListData_14d6b_GoldField

TileListData_14cb5_GoldField: ; 0x14cb5
	dw LoadTileLists
	db $0A ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $80
	db $06, $07

	db $03 ; number of tiles
	dw vBGMap + $a0
	db $08, $09, $0A

	db $03 ; number of tiles
	dw vBGMap + $c0
	db $0B, $0C, $0D

	db $02 ; number of tiles
	dw vBGMap + $e0
	db $0E, $0F

	db $00 ; terminator

TileListData_14ccf_GoldField: ; 0x14ccf
	dw LoadTileLists
	db $0A ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $80
	db $06, $07

	db $03 ; number of tiles
	dw vBGMap + $a0
	db $10, $11, $0A

	db $03 ; number of tiles
	dw vBGMap + $c0
	db $12, $13, $0D

	db $02 ; number of tiles
	dw vBGMap + $e0
	db $14, $15

	db $00 ; terminator

TileListData_14ce9_GoldField: ; 0x14ce9
	dw LoadTileLists
	db $0A ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $80
	db $06, $07

	db $03 ; number of tiles
	dw vBGMap + $a0
	db $10, $16, $17

	db $03 ; number of tiles
	dw vBGMap + $c0
	db $12, $18, $19

	db $02 ; number of tiles
	dw vBGMap + $e0
	db $14, $15

	db $00 ; terminator

TileListData_14d03_GoldField: ; 0x14d03
	dw LoadTileLists
	db $0A ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $80
	db $1A, $1B

	db $03 ; number of tiles
	dw vBGMap + $a0
	db $1C, $1D, $17

	db $03 ; number of tiles
	dw vBGMap + $c0
	db $12, $18, $19

	db $02 ; number of tiles
	dw vBGMap + $e0
	db $14, $15

	db $00 ; terminator

TileListData_14d1d_GoldField: ; 014d1d
	dw LoadTileLists
	db $0A ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $92
	db $07, $06

	db $03 ; number of tiles
	dw vBGMap + $b1
	db $0A, $1E, $08

	db $03 ; number of tiles
	dw vBGMap + $d1
	db $22, $0C, $24

	db $02 ; number of tiles
	dw vBGMap + $f2
	db $0F, $0E

	db $00 ; terminator

TileListData_14d37_GoldField: ; 0x14d37
	dw LoadTileLists
	db $0A ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $92
	db $07, $06

	db $03 ; number of tiles
	dw vBGMap + $b1
	db $0A, $1F, $10

	db $03 ; number of tiles
	dw vBGMap + $d1
	db $22, $13, $25

	db $02 ; number of tiles
	dw vBGMap + $f2
	db $15, $14

	db $00 ; terminator

TileListData_14d51_GoldField: ; 0x14d51
	dw LoadTileLists
	db $0A ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $92
	db $07, $06

	db $03 ; number of tiles
	dw vBGMap + $b1
	db $17, $20, $10

	db $03 ; number of tiles
	dw vBGMap + $d1
	db $23, $18, $25

	db $02 ; number of tiles
	dw vBGMap + $f2
	db $15, $14

	db $00 ; terminator

TileListData_14d6b_GoldField: ; 0x14d6b
	dw LoadTileLists
	db $0A ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $92
	db $1B, $1A

	db $03 ; number of tiles
	dw vBGMap + $b1
	db $17, $21, $1C

	db $03 ; number of tiles
	dw vBGMap + $d1
	db $23, $18, $25

	db $02 ; number of tiles
	dw vBGMap + $f2
	db $15, $14

	db $00 ; terminator
