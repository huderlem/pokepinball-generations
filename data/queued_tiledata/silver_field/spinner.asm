TileDataPointers_1cb60_SilverField:
	dw TileData_1cb80_SilverField
	dw TileData_1cb85_SilverField
	dw TileData_1cb8a_SilverField
	dw TileData_1cb8f_SilverField
	dw TileData_1cb94_SilverField
	dw TileData_1cb99_SilverField
	dw TileData_1cb9e_SilverField
	dw TileData_1cba3_SilverField
	dw TileData_1cba8_SilverField
	dw TileData_1cbad_SilverField
	dw TileData_1cbb2_SilverField
	dw TileData_1cbb7_SilverField
	dw TileData_1cbbc_SilverField
	dw TileData_1cbc1_SilverField
	dw TileData_1cbc6_SilverField
	dw TileData_1cbcb_SilverField

TileData_1cb80_SilverField: ; 0x1cb80
	db $02
	dw TileData_1cbd0_SilverField
	dw TileData_1cbda_SilverField

TileData_1cb85_SilverField: ; 0x1cb85
	db $02
	dw TileData_1cbe4_SilverField
	dw TileData_1cbee_SilverField

TileData_1cb8a_SilverField: ; 0x1cb8a
	db $02
	dw TileData_1cbf8_SilverField
	dw TileData_1cc02_SilverField

TileData_1cb8f_SilverField: ; 0x1cb8f
	db $02
	dw TileData_1cc0c_SilverField
	dw TileData_1cc16_SilverField

TileData_1cb94_SilverField: ; 0x1cb94
	db $02
	dw TileData_1cc20_SilverField
	dw TileData_1cc2a_SilverField

TileData_1cb99_SilverField: ; 0x1cb99
	db $02
	dw TileData_1cc34_SilverField
	dw TileData_1cc3e_SilverField

TileData_1cb9e_SilverField: ; 0x1cb9e
	db $02
	dw TileData_1cc48_SilverField
	dw TileData_1cc52_SilverField

TileData_1cba3_SilverField: ; 0x1cba3
	db $02
	dw TileData_1cc5c_SilverField
	dw TileData_1cc66_SilverField

TileData_1cba8_SilverField: ; 0x1cba8
	db $02
	dw TileData_1cc70_SilverField
	dw TileData_1cc7a_SilverField

TileData_1cbad_SilverField: ; 0x1cbad
	db $02
	dw TileData_1cc84_SilverField
	dw TileData_1cc8e_SilverField

TileData_1cbb2_SilverField: ; 0x1cbb2
	db $02
	dw TileData_1cc98_SilverField
	dw TileData_1cca2_SilverField

TileData_1cbb7_SilverField: ; 0x1cbb7
	db $02
	dw TileData_1ccac_SilverField
	dw TileData_1ccb6_SilverField

TileData_1cbbc_SilverField: ; 0x1cbbc
	db $02
	dw TileData_1ccc0_SilverField
	dw TileData_1ccca_SilverField

TileData_1cbc1_SilverField: ; 0x1cbc1
	db $02
	dw TileData_1ccd4_SilverField
	dw TileData_1ccde_SilverField

TileData_1cbc6_SilverField: ; 0x1cbc6
	db $02
	dw TileData_1cce8_SilverField
	dw TileData_1ccf2_SilverField

TileData_1cbcb_SilverField: ; 0x1cbcb
	db $02
	dw TileData_1ccfc_SilverField
	dw TileData_1cd06_SilverField

TileData_1cbd0_SilverField: ; 0xcbd0
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageSilverFieldTopBaseGameBoyGfx + $c20
	db Bank(StageSilverFieldTopBaseGameBoyGfx)
	db $00 ; terminator

TileData_1cbda_SilverField: ; 0xcbda
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageSilverFieldTopBaseGameBoyGfx + $c40
	db Bank(StageSilverFieldTopBaseGameBoyGfx)
	db $00 ; terminator

TileData_1cbe4_SilverField: ; 0xcbe4
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1800
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cbee_SilverField: ; 0xcbee
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1820
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cbf8_SilverField: ; 0xcbf8
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1840
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc02_SilverField: ; 0xcc02
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1860
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc0c_SilverField: ; 0xcc0c
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1880
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc16_SilverField: ; 0xcc16
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $18A0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc20_SilverField: ; 0xcc20
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $18C0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc2a_SilverField: ; 0xcc2a
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $18E0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc34_SilverField: ; 0xcc34
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1900
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc3e_SilverField: ; 0xcc3e
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1920
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc48_SilverField: ; 0xcc48
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1940
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc52_SilverField: ; 0xcc52
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1960
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc5c_SilverField: ; 0xcc5c
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1980
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc66_SilverField: ; 0xcc66
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $19A0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc70_SilverField: ; 0xcc70
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $19C0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc7a_SilverField: ; 0xcc7a
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $19E0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc84_SilverField: ; 0xcc84
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1A00
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc8e_SilverField: ; 0xcc8e
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1A20
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cc98_SilverField: ; 0xcc98
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1A40
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cca2_SilverField: ; 0xcca2
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1A60
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1ccac_SilverField: ; 0xccac
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1A80
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1ccb6_SilverField: ; 0xccb6
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1AA0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1ccc0_SilverField: ; 0xccc0
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1AC0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1ccca_SilverField: ; 0xccca
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1AE0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1ccd4_SilverField: ; 0xccd4
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1B00
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1ccde_SilverField: ; 0xccde
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1B20
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cce8_SilverField: ; 0xcce8
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1B40
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1ccf2_SilverField: ; 0xccf2
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1B60
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1ccfc_SilverField: ; 0xccfc
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1B80
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileData_1cd06_SilverField: ; 0xcd06
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $6E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1BA0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00 ; terminator

TileDataPointers_1cd10_SilverField:
	dw TileData_1cd30_SilverField
	dw TileData_1cd33_SilverField
	dw TileData_1cd36_SilverField
	dw TileData_1cd39_SilverField
	dw TileData_1cd3c_SilverField
	dw TileData_1cd3f_SilverField
	dw TileData_1cd42_SilverField
	dw TileData_1cd45_SilverField
	dw TileData_1cd48_SilverField
	dw TileData_1cd4b_SilverField
	dw TileData_1cd4e_SilverField
	dw TileData_1cd51_SilverField
	dw TileData_1cd54_SilverField
	dw TileData_1cd57_SilverField
	dw TileData_1cd5a_SilverField
	dw TileData_1cd5d_SilverField

TileData_1cd30_SilverField: ; 0x1cd30
	db $01
	dw TileData_1cd60_SilverField

TileData_1cd33_SilverField: ; 0x1cd33
	db $01
	dw TileData_1cd6e_SilverField

TileData_1cd36_SilverField: ; 0x1cd36
	db $01
	dw TileData_1cd7c_SilverField

TileData_1cd39_SilverField: ; 0x1cd39
	db $01
	dw TileData_1cd8a_SilverField

TileData_1cd3c_SilverField: ; 0x1cd3c
	db $01
	dw TileData_1cd98_SilverField

TileData_1cd3f_SilverField: ; 0x1cd3f
	db $01
	dw TileData_1cda6_SilverField

TileData_1cd42_SilverField: ; 0x1cd42
	db $01
	dw TileData_1cdb4_SilverField

TileData_1cd45_SilverField: ; 0x1cd45
	db $01
	dw TileData_1cdc2_SilverField

TileData_1cd48_SilverField: ; 0x1cd48
	db $01
	dw TileData_1cdd0_SilverField

TileData_1cd4b_SilverField: ; 0x1cd4b
	db $01
	dw TileData_1cdde_SilverField

TileData_1cd4e_SilverField: ; 0x1cd4e
	db $01
	dw TileData_1cdec_SilverField

TileData_1cd51_SilverField: ; 0x1cd51
	db $01
	dw TileData_1cdfa_SilverField

TileData_1cd54_SilverField: ; 0x1cd54
	db $01
	dw TileData_1ce08_SilverField

TileData_1cd57_SilverField: ; 0x1cd57
	db $01
	dw TileData_1ce16_SilverField

TileData_1cd5a_SilverField: ; 0x1cd5a
	db $01
	dw TileData_1ce24_SilverField

TileData_1cd5d_SilverField: ; 0x1cd5d
	db $01
	dw TileData_1ce32_SilverField

TileData_1cd60_SilverField: ; 0x1cd60
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $4A, $4B

	db $00 ; terminator

TileData_1cd6e_SilverField: ; 0x1cd6e
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $4C, $4D

	db $00 ; terminator

TileData_1cd7c_SilverField: ; 0x1cd7c
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $4E, $4F

	db $00 ; terminator

TileData_1cd8a_SilverField: ; 0x1cd8a
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $50, $51

	db $00 ; terminator

TileData_1cd98_SilverField: ; 0x1cd98
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $52, $53

	db $00 ; terminator

TileData_1cda6_SilverField: ; 0x1cda6
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $54, $55

	db $00 ; terminator

TileData_1cdb4_SilverField: ; 0x1cdb4
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $56, $57

	db $00 ; terminator

TileData_1cdc2_SilverField: ; 0x1cdc2
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $58, $59

	db $00 ; terminator

TileData_1cdd0_SilverField: ; 0x1cdd0
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $48, $49

	db $02 ; number of tiles
	dw vBGMap + $163
	db $58, $59

	db $00 ; terminator

TileData_1cdde_SilverField: ; 0x1cdde
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $5C, $5D

	db $02 ; number of tiles
	dw vBGMap + $163
	db $58, $59

	db $00 ; terminator

TileData_1cdec_SilverField: ; 0x1cdec
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $5E, $5F

	db $02 ; number of tiles
	dw vBGMap + $163
	db $58, $59

	db $00 ; terminator

TileData_1cdfa_SilverField: ; 0x1cdfa
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $60, $61

	db $02 ; number of tiles
	dw vBGMap + $163
	db $58, $59

	db $00 ; terminator

TileData_1ce08_SilverField: ; 0x1ce08
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $62, $63

	db $02 ; number of tiles
	dw vBGMap + $163
	db $58, $59

	db $00 ; terminator

TileData_1ce16_SilverField: ; 0x1ce16
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $64, $65

	db $02 ; number of tiles
	dw vBGMap + $163
	db $58, $59

	db $00 ; terminator

TileData_1ce24_SilverField: ; 0x1ce24
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $66, $67

	db $02 ; number of tiles
	dw vBGMap + $163
	db $58, $59

	db $00 ; terminator

TileData_1ce32_SilverField: ; 0x1ce32
	dw LoadTileLists
	db $04 ; total number of tiles

	db $02 ; number of tiles
	dw vBGMap + $143
	db $68, $69

	db $02 ; number of tiles
	dw vBGMap + $163
	db $6A, $6B

	db $00 ; terminator
