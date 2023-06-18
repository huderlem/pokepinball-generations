TileDataPointers_1eb61_SapphireField:
	dw TileDataPointers_1eb6b_SapphireField
	dw TileDataPointers_1eb75_SapphireField
	dw TileDataPointers_1eb7f_SapphireField
	dw TileDataPointers_1eb87_SapphireField
	dw TileDataPointers_1eb8f_SapphireField

TileDataPointers_1eb6b_SapphireField: ; 0x1eb6b
	dw TileData_1eb97_SapphireField
	dw TileData_1eb9a_SapphireField
	dw TileData_1eb9d_SapphireField
	dw TileData_1eba0_SapphireField
	dw TileData_1eba3_SapphireField

TileDataPointers_1eb75_SapphireField: ; 0x1eb75
	dw TileData_1eba6_SapphireField
	dw TileData_1eba9_SapphireField
	dw TileData_1ebac_SapphireField
	dw TileData_1ebaf_SapphireField
	dw TileData_1ebb2_SapphireField

TileDataPointers_1eb7f_SapphireField: ; 0x1eb7f
	dw TileData_1ebb5_SapphireField
	dw TileData_1ebb8_SapphireField
	dw TileData_1ebbb_SapphireField
	dw TileData_1ebbe_SapphireField

TileDataPointers_1eb87_SapphireField: ; 0x1eb87
	dw TileData_1ebc1_SapphireField
	dw TileData_1ebc6_SapphireField
	dw TileData_1ebcb_SapphireField
	dw TileData_1ebd0_SapphireField

TileDataPointers_1eb8f_SapphireField: ; 0x1eb8f
	dw TileData_1ebd5_SapphireField
	dw TileData_1ebda_SapphireField
	dw TileData_1ebdf_SapphireField
	dw TileData_1ebe4_SapphireField

TileData_1eb97_SapphireField: ; 0x1eb97
	db $01
	dw TileData_1ebe9_SapphireField

TileData_1eb9a_SapphireField: ; 0x1eb9a
	db $01
	dw TileData_1ebf9_SapphireField

TileData_1eb9d_SapphireField: ; 0x1eb9d
	db $01
	dw TileData_1ec09_SapphireField

TileData_1eba0_SapphireField: ; 0x1eba0
	db $01
	dw TileData_1ec19_SapphireField

TileData_1eba3_SapphireField: ; 0x1eba3
	db $01
	dw TileData_1ec29_SapphireField

TileData_1eba6_SapphireField: ; 0x1eba6
	db $01
	dw TileData_1ec39_SapphireField

TileData_1eba9_SapphireField: ; 0x1eba9
	db $01
	dw TileData_1ec49_SapphireField

TileData_1ebac_SapphireField: ; 0x1ebac
	db $01
	dw TileData_1ec59_SapphireField

TileData_1ebaf_SapphireField: ; 0x1ebaf
	db $01
	dw TileData_1ec69_SapphireField

TileData_1ebb2_SapphireField: ; 0x1ebb2
	db $01
	dw TileData_1ec79_SapphireField

TileData_1ebb5_SapphireField: ; 0x1ebb5
	db $01
	dw TileData_1ec89_SapphireField

TileData_1ebb8_SapphireField: ; 0x1ebb8
	db $01
	dw TileData_1ec93_SapphireField

TileData_1ebbb_SapphireField: ; 0x1ebbb
	db $01
	dw TileData_1ec9d_SapphireField

TileData_1ebbe_SapphireField: ; 0x1ebbe
	db $01
	dw TileData_1eca7_SapphireField

TileData_1ebc1_SapphireField: ; 0x1ebc1
	db $02
	dw TileData_1ecb1_SapphireField
	dw TileData_1ecbb_SapphireField

TileData_1ebc6_SapphireField: ; 0x1ebc6
	db $02
	dw TileData_1ecc5_SapphireField
	dw TileData_1eccf_SapphireField

TileData_1ebcb_SapphireField: ; 0x1ebcb
	db $02
	dw TileData_1ecd9_SapphireField
	dw TileData_1ece3_SapphireField

TileData_1ebd0_SapphireField: ; 0x1ebd0
	db $02
	dw TileData_1eced_SapphireField
	dw TileData_1ecf7_SapphireField

TileData_1ebd5_SapphireField: ; 0x1ebd5
	db $02
	dw TileData_1ed01_SapphireField
	dw TileData_1ed0b_SapphireField

TileData_1ebda_SapphireField: ; 0x1ebda
	db $02
	dw TileData_1ed15_SapphireField
	dw TileData_1ed1f_SapphireField

TileData_1ebdf_SapphireField: ; 0x1ebdf
	db $02
	dw TileData_1ed01_SapphireField
	dw TileData_1ed0b_SapphireField

TileData_1ebe4_SapphireField: ; 0x1ebe4
	db $02
	dw TileData_1ed15_SapphireField
	dw TileData_1ed1f_SapphireField

TileData_1ebe9_SapphireField: ; 0x1ebe9
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

TileData_1ebf9_SapphireField: ; 0x1ebf9
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

TileData_1ec09_SapphireField: ; 0x1ec09
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

TileData_1ec19_SapphireField: ; 0x1ec19
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

TileData_1ec29_SapphireField: ; 0x1ec29
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

TileData_1ec39_SapphireField: ; 0x1ec39
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

TileData_1ec49_SapphireField: ; 0x1ec49
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

TileData_1ec59_SapphireField: ; 0x1ec59
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

TileData_1ec69_SapphireField: ; 0x1ec69
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

TileData_1ec79_SapphireField: ; 0x1ec79
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

TileData_1ec89_SapphireField: ; 0x1ec89
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $15
	dw StageSapphireFieldBottomBaseGameBoyGfx + $950
	db Bank(StageSapphireFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ec93_SapphireField: ; 0x1ec93
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $15
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1F40
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ec9d_SapphireField: ; 0x1ec9d
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $15
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1F60
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1eca7_SapphireField: ; 0x1eca7
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $15
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1F80
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ecb1_SapphireField: ; 0x1ecb1
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $19
	dw StageSapphireFieldBottomBaseGameBoyGfx + $990
	db Bank(StageSapphireFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ecbb_SapphireField: ; 0x1ecbb
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1B
	dw StageSapphireFieldBottomBaseGameBoyGfx + $9B0
	db Bank(StageSapphireFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ecc5_SapphireField: ; 0x1ecc5
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $19
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2270
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1eccf_SapphireField: ; 0x1eccf
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1B
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2290
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ecd9_SapphireField: ; 0x1ecd9
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $19
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $22B0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ece3_SapphireField: ; 0x1ece3
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1B
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $22D0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1eced_SapphireField: ; 0x1eced
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $19
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $22F0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ecf7_SapphireField: ; 0x1ecf7
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1B
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $2310
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed01_SapphireField: ; 0x1ed01
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $23
	dw StageSapphireFieldBottomBaseGameBoyGfx + $A30
	db Bank(StageSapphireFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ed0b_SapphireField: ; 0x1ed0b
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $25
	dw StageSapphireFieldBottomBaseGameBoyGfx + $A50
	db Bank(StageSapphireFieldBottomBaseGameBoyGfx)
	db $00

TileData_1ed15_SapphireField: ; 0x1ed15
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $23
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C00
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed1f_SapphireField: ; 0x1ed1f
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $25
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C20
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed29_SapphireField: ; 0x1ed29
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $23
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C40
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed33_SapphireField: ; 0x1ed33
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $25
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C60
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1e3d_SapphireField: ; 0x1e3d
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $23
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1C80
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_1ed47_SapphireField: ; 0x1ed47
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $25
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1CA0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileDataPointers_1ed51_SapphireField: ; 0x1ed51
	dw TileDataPointers_1ed5b_SapphireField
	dw TileDataPointers_1ed65_SapphireField
	dw TileDataPointers_1ed6f_SapphireField
	dw TileDataPointers_1ed77_SapphireField
	dw TileDataPointers_1ed7f_SapphireField

TileDataPointers_1ed5b_SapphireField: ; 0x1ed5b
	dw TileData_1ed87_SapphireField
	dw TileData_1ed8a_SapphireField
	dw TileData_1ed8d_SapphireField
	dw TileData_1ed90_SapphireField
	dw TileData_1ed93_SapphireField

TileDataPointers_1ed65_SapphireField: ; 0x1ed65
	dw TileData_1ed96_SapphireField
	dw TileData_1ed99_SapphireField
	dw TileData_1ed9c_SapphireField
	dw TileData_1ed9f_SapphireField
	dw TileData_1eda2_SapphireField

TileDataPointers_1ed6f_SapphireField: ; 0x1ed6f
	dw TileData_1eda5_SapphireField
	dw TileData_1eda8_SapphireField
	dw TileData_1edab_SapphireField
	dw TileData_1edae_SapphireField

TileDataPointers_1ed77_SapphireField: ; 0x1ed77
	dw TileData_1edb1_SapphireField
	dw TileData_1edb4_SapphireField
	dw TileData_1edb7_SapphireField
	dw TileData_1edba_SapphireField

TileDataPointers_1ed7f_SapphireField: ; 0x1ed7f
	dw TileData_1edbd_SapphireField
	dw TileData_1edc0_SapphireField
	dw TileData_1edc3_SapphireField
	dw TileData_1edc6_SapphireField

TileData_1ed87_SapphireField: ; 0x1ed87
	db $01
	dw TileData_1edc9_SapphireField

TileData_1ed8a_SapphireField: ; 0x1ed8a
	db $01
	dw TileData_1edd9_SapphireField

TileData_1ed8d_SapphireField: ; 0x1ed8d
	db $01
	dw TileData_1ede9_SapphireField

TileData_1ed90_SapphireField: ; 0x1ed90
	db $01
	dw TileData_1edf9_SapphireField

TileData_1ed93_SapphireField: ; 0x1ed93
	db $01
	dw TileData_1ee09_SapphireField

TileData_1ed96_SapphireField: ; 0x1ed96
	db $01
	dw TileData_1ee19_SapphireField

TileData_1ed99_SapphireField: ; 0x1ed99
	db $01
	dw TileData_1ee29_SapphireField

TileData_1ed9c_SapphireField: ; 0x1ed9c
	db $01
	dw TileData_1ee39_SapphireField

TileData_1ed9f_SapphireField: ; 0x1ed9f
	db $01
	dw TileData_1ee49_SapphireField

TileData_1eda2_SapphireField: ; 0x1eda2
	db $01
	dw TileData_1ee59_SapphireField

TileData_1eda5_SapphireField: ; 0x1eda5
	db $01
	dw TileData_1ee69_SapphireField

TileData_1eda8_SapphireField: ; 0x1eda8
	db $01
	dw TileData_1ee75_SapphireField

TileData_1edab_SapphireField: ; 0x1edab
	db $01
	dw TileData_1ee81_SapphireField

TileData_1edae_SapphireField: ; 0x1edae
	db $01
	dw TileData_1ee8d_SapphireField

TileData_1edb1_SapphireField: ; 0x1edb1
	db $01
	dw TileData_1ee99_SapphireField

TileData_1edb4_SapphireField: ; 0x1edb4
	db $01
	dw TileData_1eea7_SapphireField

TileData_1edb7_SapphireField: ; 0x1edb7
	db $01
	dw TileData_1eeb5_SapphireField

TileData_1edba_SapphireField: ; 0x1edba
	db $01
	dw TileData_1eec3_SapphireField

TileData_1edbd_SapphireField: ; 0x1edbd
	db $01
	dw TileData_1eed1_SapphireField

TileData_1edc0_SapphireField: ; 0x1edc0
	db $01
	dw TileData_1eedf_SapphireField

TileData_1edc3_SapphireField: ; 0x1edc3
	db $01
	dw TileData_1eeed_SapphireField

TileData_1edc6_SapphireField: ; 0x1edc6
	db $01
	dw TileData_1eefb_SapphireField

TileData_1edc9_SapphireField: ; 0x1edc9
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

TileData_1edd9_SapphireField: ; 0x1edd9
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

TileData_1ede9_SapphireField: ; 0x1ede9
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

TileData_1edf9_SapphireField: ; 0x1edf9
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

TileData_1ee09_SapphireField: ; 0x1ee09
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

TileData_1ee19_SapphireField: ; 0x1ee19
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

TileData_1ee29_SapphireField: ; 0x1ee29
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

TileData_1ee39_SapphireField: ; 0x1ee39
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

TileData_1ee49_SapphireField: ; 0x1ee49
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

TileData_1ee59_SapphireField: ; 0x1ee59
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

TileData_1ee69_SapphireField: ; 0x1ee69
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $48
	db $05

	db $01 ; number of tiles
	dw vBGMap + $68
	db $06

	db $00 ; terminator

TileData_1ee75_SapphireField: ; 0x1ee75
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $48
	db $07

	db $01 ; number of tiles
	dw vBGMap + $68
	db $08

	db $00 ; terminator

TileData_1ee81_SapphireField: ; 0x1ee81
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $48
	db $09

	db $01 ; number of tiles
	dw vBGMap + $68
	db $0A

	db $00 ; terminator

TileData_1ee8d_SapphireField: ; 0x1ee8d
	dw LoadTileLists
	db $02 ; total number of tiles

	db $01 ; number of tiles
	dw vBGMap + $48
	db $0B

	db $01 ; number of tiles
	dw vBGMap + $68
	db $0C

	db $00 ; terminator

TileData_1ee99_SapphireField: ; 0x1ee99
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $4B
	db $26, $27

	db $02 ; number of tiles
	dw vBGMap + $6B
	db $28, $29

	db $00 ; terminator

TileData_1eea7_SapphireField: ; 0x1eea7
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $4B
	db $2A, $2B

	db $02 ; number of tiles
	dw vBGMap + $6B
	db $2C, $2D

	db $00 ; terminator

TileData_1eeb5_SapphireField: ; 0x1eeb5
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $4B
	db $2E, $2F

	db $02 ; number of tiles
	dw vBGMap + $6B
	db $30, $31

	db $00 ; terminator

TileData_1eec3_SapphireField: ; 0x1eec3
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $4B
	db $32, $33

	db $02 ; number of tiles
	dw vBGMap + $6B
	db $34, $35

	db $00 ; terminator

TileData_1eed1_SapphireField: ; 0x1eed1
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $49
	db $16, $17

	db $02 ; number of tiles
	dw vBGMap + $69
	db $18, $19

	db $00 ; terminator

TileData_1eedf_SapphireField: ; 0x1eedf
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $49
	db $1A, $1B

	db $02 ; number of tiles
	dw vBGMap + $69
	db $1C, $1D

	db $00 ; terminator

TileData_1eeed_SapphireField: ; 0x1eeed
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $49
	db $1E, $1F

	db $02 ; number of tiles
	dw vBGMap + $69
	db $20, $21

	db $00 ; terminator

TileData_1eefb_SapphireField: ; 0x1eefb
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $49
	db $22, $23

	db $02 ; number of tiles
	dw vBGMap + $69
	db $24, $25

	db $00 ; terminator
