TileDataPointers_1eb61_SilverField:
	dw TileDataPointers_1eb6b_SilverField
	dw TileDataPointers_1eb75_SilverField
	dw TileDataPointers_1eb7f_SilverField
	dw TileDataPointers_1eb87_SilverField
	dw TileDataPointers_1eb8f_SilverField

TileDataPointers_1eb6b_SilverField: ; 0x1eb6b
	dw TileData_1eb97_SilverField
	dw TileData_1eb9a_SilverField
	dw TileData_1eb9d_SilverField
	dw TileData_1eba0_SilverField
	dw TileData_1eba3_SilverField

TileDataPointers_1eb75_SilverField: ; 0x1eb75
	dw TileData_1eba6_SilverField
	dw TileData_1eba9_SilverField
	dw TileData_1ebac_SilverField
	dw TileData_1ebaf_SilverField
	dw TileData_1ebb2_SilverField

TileDataPointers_1eb7f_SilverField: ; 0x1eb7f
	dw TileData_1ebb5_SilverField
	dw TileData_1ebb8_SilverField
	dw TileData_1ebbb_SilverField
	dw TileData_1ebbe_SilverField

TileDataPointers_1eb87_SilverField: ; 0x1eb87
	dw TileData_1ebc1_SilverField
	dw TileData_1ebc6_SilverField
	dw TileData_1ebcb_SilverField
	dw TileData_1ebd0_SilverField

TileDataPointers_1eb8f_SilverField: ; 0x1eb8f
	dw TileData_1ebd5_SilverField
	dw TileData_1ebda_SilverField
	dw TileData_1ebdf_SilverField
	dw TileData_1ebe4_SilverField

TileData_1eb97_SilverField: ; 0x1eb97
	db $01
	dw TileData_1ebe9_SilverField

TileData_1eb9a_SilverField: ; 0x1eb9a
	db $01
	dw TileData_1ebf9_SilverField

TileData_1eb9d_SilverField: ; 0x1eb9d
	db $01
	dw TileData_1ec09_SilverField

TileData_1eba0_SilverField: ; 0x1eba0
	db $01
	dw TileData_1ec19_SilverField

TileData_1eba3_SilverField: ; 0x1eba3
	db $01
	dw TileData_1ec29_SilverField

TileData_1eba6_SilverField: ; 0x1eba6
	db $01
	dw TileData_1ec39_SilverField

TileData_1eba9_SilverField: ; 0x1eba9
	db $01
	dw TileData_1ec49_SilverField

TileData_1ebac_SilverField: ; 0x1ebac
	db $01
	dw TileData_1ec59_SilverField

TileData_1ebaf_SilverField: ; 0x1ebaf
	db $01
	dw TileData_1ec69_SilverField

TileData_1ebb2_SilverField: ; 0x1ebb2
	db $01
	dw TileData_1ec79_SilverField

TileData_1ebb5_SilverField: ; 0x1ebb5
	db $01
	dw TileData_1ec89_SilverField

TileData_1ebb8_SilverField: ; 0x1ebb8
	db $01
	dw TileData_1ec93_SilverField

TileData_1ebbb_SilverField: ; 0x1ebbb
	db $01
	dw TileData_1ec9d_SilverField

TileData_1ebbe_SilverField: ; 0x1ebbe
	db $01
	dw TileData_1eca7_SilverField

TileData_1ebc1_SilverField: ; 0x1ebc1
	db $02
	dw TileData_1ecb1_SilverField
	dw TileData_1ecbb_SilverField

TileData_1ebc6_SilverField: ; 0x1ebc6
	db $02
	dw TileData_1ecc5_SilverField
	dw TileData_1eccf_SilverField

TileData_1ebcb_SilverField: ; 0x1ebcb
	db $02
	dw TileData_1ecd9_SilverField
	dw TileData_1ece3_SilverField

TileData_1ebd0_SilverField: ; 0x1ebd0
	db $02
	dw TileData_1eced_SilverField
	dw TileData_1ecf7_SilverField

TileData_1ebd5_SilverField: ; 0x1ebd5
	db $02
	dw TileData_1ed01_SilverField
	dw TileData_1ed0b_SilverField

TileData_1ebda_SilverField: ; 0x1ebda
	db $02
	dw TileData_1ed15_SilverField
	dw TileData_1ed1f_SilverField

TileData_1ebdf_SilverField: ; 0x1ebdf
	db $02
	dw TileData_1ed01_SilverField
	dw TileData_1ed0b_SilverField

TileData_1ebe4_SilverField: ; 0x1ebe4
	db $02
	dw TileData_1ed15_SilverField
	dw TileData_1ed1f_SilverField

TileData_1ebe9_SilverField: ; 0x1ebe9
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $3D

	db $01 ; number of tiles
	dw vBGMap + $84
	db $17

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $3D

	db $00 ; terminator

TileData_1ebf9_SilverField: ; 0x1ebf9
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $3E

	db $01 ; number of tiles
	dw vBGMap + $84
	db $17

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $3D

	db $00 ; terminator

TileData_1ec09_SilverField: ; 0x1ec09
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $3E

	db $01 ; number of tiles
	dw vBGMap + $84
	db $18

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $3D

	db $00 ; terminator

TileData_1ec19_SilverField: ; 0x1ec19
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $3E

	db $01 ; number of tiles
	dw vBGMap + $84
	db $18

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $3E

	db $00 ; terminator

TileData_1ec29_SilverField: ; 0x1ec29
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $3D

	db $01 ; number of tiles
	dw vBGMap + $84
	db $18

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $3D

	db $00 ; terminator

TileData_1ec39_SilverField: ; 0x1ec39
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $3F

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $1D

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $3F

	db $00 ; terminator

TileData_1ec49_SilverField: ; 0x1ec49
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $40

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $1D

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $3F

	db $00 ; terminator

TileData_1ec59_SilverField: ; 0x1ec59
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $40

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $1E

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $3F

	db $00 ; terminator

TileData_1ec69_SilverField: ; 0x1ec69
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $40

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $1E

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $40

	db $00 ; terminator

TileData_1ec79_SilverField: ; 0x1ec79
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $40

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $1D

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $40

	db $00 ; terminator

TileData_1ec89_SilverField: ; 0x1ec89
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $15
	dw StageSilverFieldBottomBaseGameBoyGfx + $950
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ec93_SilverField: ; 0x1ec93
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $15
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1F40
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ec9d_SilverField: ; 0x1ec9d
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $15
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1F60
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1eca7_SilverField: ; 0x1eca7
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $15
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1F80
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ecb1_SilverField: ; 0x1ecb1
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $19
	dw StageSilverFieldBottomBaseGameBoyGfx + $990
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ecbb_SilverField: ; 0x1ecbb
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1B
	dw StageSilverFieldBottomBaseGameBoyGfx + $9B0
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ecc5_SilverField: ; 0x1ecc5
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $19
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2270
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1eccf_SilverField: ; 0x1eccf
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1B
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2290
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ecd9_SilverField: ; 0x1ecd9
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $19
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $22B0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ece3_SilverField: ; 0x1ece3
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1B
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $22D0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1eced_SilverField: ; 0x1eced
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $19
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $22F0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ecf7_SilverField: ; 0x1ecf7
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1B
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2310
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed01_SilverField: ; 0x1ed01
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $23
	dw StageSilverFieldBottomBaseGameBoyGfx + $A30
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ed0b_SilverField: ; 0x1ed0b
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $25
	dw StageSilverFieldBottomBaseGameBoyGfx + $A50
	db Bank(StageSilverFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ed15_SilverField: ; 0x1ed15
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $23
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C00
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed1f_SilverField: ; 0x1ed1f
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $25
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C20
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed29_SilverField: ; 0x1ed29
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $23
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C40
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed33_SilverField: ; 0x1ed33
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $25
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C60
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e3d_SilverField: ; 0x1e3d
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $23
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C80
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed47_SilverField: ; 0x1ed47
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $25
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1CA0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileDataPointers_1ed51_SilverField: ; 0x1ed51
	dw TileDataPointers_1ed5b_SilverField
	dw TileDataPointers_1ed65_SilverField
	dw TileDataPointers_1ed6f_SilverField
	dw TileDataPointers_1ed77_SilverField
	dw TileDataPointers_1ed7f_SilverField

TileDataPointers_1ed5b_SilverField: ; 0x1ed5b
	dw TileData_1ed87_SilverField
	dw TileData_1ed8a_SilverField
	dw TileData_1ed8d_SilverField
	dw TileData_1ed90_SilverField
	dw TileData_1ed93_SilverField

TileDataPointers_1ed65_SilverField: ; 0x1ed65
	dw TileData_1ed96_SilverField
	dw TileData_1ed99_SilverField
	dw TileData_1ed9c_SilverField
	dw TileData_1ed9f_SilverField
	dw TileData_1eda2_SilverField

TileDataPointers_1ed6f_SilverField: ; 0x1ed6f
	dw TileData_1eda5_SilverField
	dw TileData_1eda8_SilverField
	dw TileData_1edab_SilverField
	dw TileData_1edae_SilverField

TileDataPointers_1ed77_SilverField: ; 0x1ed77
	dw TileData_1edb1_SilverField
	dw TileData_1edb4_SilverField
	dw TileData_1edb7_SilverField
	dw TileData_1edba_SilverField

TileDataPointers_1ed7f_SilverField: ; 0x1ed7f
	dw TileData_1edbd_SilverField
	dw TileData_1edc0_SilverField
	dw TileData_1edc3_SilverField
	dw TileData_1edc6_SilverField

TileData_1ed87_SilverField: ; 0x1ed87
	db $01
	dw TileData_1edc9_SilverField

TileData_1ed8a_SilverField: ; 0x1ed8a
	db $01
	dw TileData_1edd9_SilverField

TileData_1ed8d_SilverField: ; 0x1ed8d
	db $01
	dw TileData_1ede9_SilverField

TileData_1ed90_SilverField: ; 0x1ed90
	db $01
	dw TileData_1edf9_SilverField

TileData_1ed93_SilverField: ; 0x1ed93
	db $01
	dw TileData_1ee09_SilverField

TileData_1ed96_SilverField: ; 0x1ed96
	db $01
	dw TileData_1ee19_SilverField

TileData_1ed99_SilverField: ; 0x1ed99
	db $01
	dw TileData_1ee29_SilverField

TileData_1ed9c_SilverField: ; 0x1ed9c
	db $01
	dw TileData_1ee39_SilverField

TileData_1ed9f_SilverField: ; 0x1ed9f
	db $01
	dw TileData_1ee49_SilverField

TileData_1eda2_SilverField: ; 0x1eda2
	db $01
	dw TileData_1ee59_SilverField

TileData_1eda5_SilverField: ; 0x1eda5
	db $01
	dw TileData_1ee69_SilverField

TileData_1eda8_SilverField: ; 0x1eda8
	db $01
	dw TileData_1ee75_SilverField

TileData_1edab_SilverField: ; 0x1edab
	db $01
	dw TileData_1ee81_SilverField

TileData_1edae_SilverField: ; 0x1edae
	db $01
	dw TileData_1ee8d_SilverField

TileData_1edb1_SilverField: ; 0x1edb1
	db $01
	dw TileData_1ee99_SilverField

TileData_1edb4_SilverField: ; 0x1edb4
	db $01
	dw TileData_1eea7_SilverField

TileData_1edb7_SilverField: ; 0x1edb7
	db $01
	dw TileData_1eeb5_SilverField

TileData_1edba_SilverField: ; 0x1edba
	db $01
	dw TileData_1eec3_SilverField

TileData_1edbd_SilverField: ; 0x1edbd
	db $01
	dw TileData_1eed1_SilverField

TileData_1edc0_SilverField: ; 0x1edc0
	db $01
	dw TileData_1eedf_SilverField

TileData_1edc3_SilverField: ; 0x1edc3
	db $01
	dw TileData_1eeed_SilverField

TileData_1edc6_SilverField: ; 0x1edc6
	db $01
	dw TileData_1eefb_SilverField

TileData_1edc9_SilverField: ; 0x1edc9
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $31

	db $01 ; number of tiles
	dw vBGMap + $84
	db $0D

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $7C

	db $00 ; terminator

TileData_1edd9_SilverField: ; 0x1edd9
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $32

	db $01 ; number of tiles
	dw vBGMap + $84
	db $0D

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $7C

	db $00 ; terminator

TileData_1ede9_SilverField: ; 0x1ede9
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $32

	db $01 ; number of tiles
	dw vBGMap + $84
	db $0E

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $7C

	db $00 ; terminator

TileData_1edf9_SilverField: ; 0x1edf9
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $32

	db $01 ; number of tiles
	dw vBGMap + $84
	db $0E

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $7D

	db $00 ; terminator

TileData_1ee09_SilverField: ; 0x1ee09
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $64
	db $31

	db $01 ; number of tiles
	dw vBGMap + $84
	db $0E

	db $01 ; number of tiles
	dw vBGMap + $A5
	db $7C

	db $00 ; terminator

TileData_1ee19_SilverField: ; 0x1ee19
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $33

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $0F

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $7E

	db $00 ; terminator

TileData_1ee29_SilverField: ; 0x1ee29
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $34

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $0F

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $7E

	db $00 ; terminator

TileData_1ee39_SilverField: ; 0x1ee39
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $34

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $10

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $7E

	db $00 ; terminator

TileData_1ee49_SilverField: ; 0x1ee49
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $34

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $10

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $7F

	db $00 ; terminator

TileData_1ee59_SilverField: ; 0x1ee59
	dw LoadTileLists
	db $03 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $6F
	db $33

	db $01 ; number of tiles
	dw vBGMap + $8F
	db $10

	db $01 ; number of tiles
	dw vBGMap + $AE
	db $7E

	db $00 ; terminator

TileData_1ee69_SilverField: ; 0x1ee69
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $48
	db $05

	db $01 ; number of tiles
	dw vBGMap + $68
	db $06

	db $00 ; terminator

TileData_1ee75_SilverField: ; 0x1ee75
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $48
	db $07

	db $01 ; number of tiles
	dw vBGMap + $68
	db $08

	db $00 ; terminator

TileData_1ee81_SilverField: ; 0x1ee81
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $48
	db $09

	db $01 ; number of tiles
	dw vBGMap + $68
	db $0A

	db $00 ; terminator

TileData_1ee8d_SilverField: ; 0x1ee8d
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $48
	db $0B

	db $01 ; number of tiles
	dw vBGMap + $68
	db $0C

	db $00 ; terminator

TileData_1ee99_SilverField: ; 0x1ee99
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $4B
	db $26, $27

	db $02 ; number of tiles
	dw vBGMap + $6B
	db $28, $29

	db $00 ; terminator

TileData_1eea7_SilverField: ; 0x1eea7
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $4B
	db $2A, $2B

	db $02 ; number of tiles
	dw vBGMap + $6B
	db $2C, $2D

	db $00 ; terminator

TileData_1eeb5_SilverField: ; 0x1eeb5
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $4B
	db $2E, $2F

	db $02 ; number of tiles
	dw vBGMap + $6B
	db $30, $31

	db $00 ; terminator

TileData_1eec3_SilverField: ; 0x1eec3
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $4B
	db $32, $33

	db $02 ; number of tiles
	dw vBGMap + $6B
	db $34, $35

	db $00 ; terminator

TileData_1eed1_SilverField: ; 0x1eed1
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $49
	db $16, $17

	db $02 ; number of tiles
	dw vBGMap + $69
	db $18, $19

	db $00 ; terminator

TileData_1eedf_SilverField: ; 0x1eedf
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $49
	db $1A, $1B

	db $02 ; number of tiles
	dw vBGMap + $69
	db $1C, $1D

	db $00 ; terminator

TileData_1eeed_SilverField: ; 0x1eeed
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $49
	db $1E, $1F

	db $02 ; number of tiles
	dw vBGMap + $69
	db $20, $21

	db $00 ; terminator

TileData_1eefb_SilverField: ; 0x1eefb
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $49
	db $22, $23

	db $02 ; number of tiles
	dw vBGMap + $69
	db $24, $25

	db $00 ; terminator
