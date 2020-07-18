TileDataPointers_169ed_RubyField:
	dw TileDataPointers_169f7_RubyField
	dw TileDataPointers_16a01_RubyField
	dw TileDataPointers_16a0b_RubyField
	dw TileDataPointers_16a0f_RubyField
	dw TileDataPointers_16a13_RubyField

TileDataPointers_169f7_RubyField: ; 0x169f7
	dw TileData_16a17_RubyField
	dw TileData_16a1e_RubyField
	dw TileData_16a25_RubyField
	dw TileData_16a2c_RubyField
	dw TileData_16a33_RubyField

TileDataPointers_16a01_RubyField: ; 0x16a01
	dw TileData_16a3a_RubyField
	dw TileData_16a41_RubyField
	dw TileData_16a48_RubyField
	dw TileData_16a4f_RubyField
	dw TileData_16a56_RubyField

TileDataPointers_16a0b_RubyField: ; 0x16a0b
	dw TileData_16a5d_RubyField
	dw TileData_16a60_RubyField

TileDataPointers_16a0f_RubyField: ; 0x16a0f
	dw TileData_16a63_RubyField
	dw TileData_16a66_RubyField

TileDataPointers_16a13_RubyField: ; 0x16a13
	dw TileData_16a69_RubyField
	dw TileData_16a6e_RubyField

TileData_16a17_RubyField: ; 0x16a17
	db $03
	dw TileData_16a73_RubyField
	dw TileData_16a7d_RubyField
	dw TileData_16a87_RubyField

TileData_16a1e_RubyField: ; 0x16a1e
	db $03
	dw TileData_16a91_RubyField
	dw TileData_16a9b_RubyField
	dw TileData_16aa5_RubyField

TileData_16a25_RubyField: ; 0x16a25
	db $03
	dw TileData_16aaf_RubyField
	dw TileData_16ab9_RubyField
	dw TileData_16ac3_RubyField

TileData_16a2c_RubyField: ; 0x16a2c
	db $03
	dw TileData_16acd_RubyField
	dw TileData_16ad7_RubyField
	dw TileData_16ae1_RubyField

TileData_16a33_RubyField: ; 0x16a33
	db $03
	dw TileData_16aeb_RubyField
	dw TileData_16af5_RubyField
	dw TileData_16aff_RubyField

TileData_16a3a_RubyField: ; 0x16a3a
	db $03
	dw TileData_16b09_RubyField
	dw TileData_16b13_RubyField
	dw TileData_16b1d_RubyField

TileData_16a41_RubyField: ; 0x16a41
	db $03
	dw TileData_16b27_RubyField
	dw TileData_16b31_RubyField
	dw TileData_16b3b_RubyField

TileData_16a48_RubyField: ; 0x16a48
	db $03
	dw TileData_16b45_RubyField
	dw TileData_16b4f_RubyField
	dw TileData_16b59_RubyField

TileData_16a4f_RubyField: ; 0x16a4f
	db $03
	dw TileData_16b63_RubyField
	dw TileData_16b6d_RubyField
	dw TileData_16b77_RubyField

TileData_16a56_RubyField: ; 0x16a56
	db $03
	dw TileData_16b81_RubyField
	dw TileData_16b8b_RubyField
	dw TileData_16b95_RubyField

TileData_16a5d_RubyField: ; 0x16a5d
	db $01
	dw TileData_16b9f_RubyField

TileData_16a60_RubyField: ; 0x16a60
	db $01
	dw TileData_16ba9_RubyField

TileData_16a63_RubyField: ; 0x16a63
	db $01
	dw TileData_16bb3_RubyField

TileData_16a66_RubyField: ; 0x16a66
	db $01
	dw TileData_16bbd_RubyField

TileData_16a69_RubyField: ; 0x16a69
	db $02
	dw TileData_16bc7_RubyField
	dw TileData_16bd1_RubyField

TileData_16a6e_RubyField: ; 0x16a6e
	db $02
	dw TileData_16bdb_RubyField
	dw TileData_16be5_RubyField

TileData_16a73_RubyField: ; 0x16a73
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3A
	dw StageRubyFieldBottomBaseGameBoyGfx + $ba0
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16a7d_RubyField: ; 0x16a7d
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3D
	dw StageRubyFieldBottomBaseGameBoyGfx + $bd0
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16a87_RubyField: ; 0x16a87
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $40
	dw StageRubyFieldBottomBaseGameBoyGfx + $c00
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16a91_RubyField: ; 0x16a91
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3A
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $380
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16a9b_RubyField: ; 0x16a9b
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3D
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $3B0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16aa5_RubyField: ; 0x16aa5
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $40
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $3E0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16aaf_RubyField: ; 0x16aaf
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3A
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $3F0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16ab9_RubyField: ; 0x16ab9
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3D
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $420
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16ac3_RubyField: ; 0x16ac3
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $40
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $450
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16acd_RubyField: ; 0x16acd
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3A
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $460
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16ad7_RubyField: ; 0x16ad7
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3D
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $490
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16ae1_RubyField: ; 0x16ae1
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $40
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $4C0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16aeb_RubyField: ; 0x16aeb
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3A
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $F30
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16af5_RubyField: ; 0x16af5
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $3D
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $F60
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16aff_RubyField: ; 0x16aff
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $40
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $F90
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b09_RubyField: ; 0x16b09
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageRubyFieldBottomBaseGameBoyGfx + $c10
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16b13_RubyField: ; 0x16b13
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageRubyFieldBottomBaseGameBoyGfx + $c40
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16b1d_RubyField: ; 0x16b1d
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $47
	dw StageRubyFieldBottomBaseGameBoyGfx + $c70
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16b27_RubyField: ; 0x16b27
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $4D0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b31_RubyField: ; 0x16b31
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $500
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b3b_RubyField: ; 0x16b3b
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $47
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $530
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b45_RubyField: ; 0x16b45
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $540
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b4f_RubyField: ; 0x16b4f
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $570
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b59_RubyField: ; 0x16b59
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $47
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $5A0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b63_RubyField: ; 0x16b63
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $5B0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b6d_RubyField: ; 0x16b6d
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $5E0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b77_RubyField: ; 0x16b77
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $47
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $610
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b81_RubyField: ; 0x16b81
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $41
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1010
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b8b_RubyField: ; 0x16b8b
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $44
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1040
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b95_RubyField: ; 0x16b95
	dw Func_11d2
	db $10, $01
	dw vTilesBG tile $47
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1070
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16b9f_RubyField: ; 0x16b9f
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $20
	dw StageRubyFieldBottomBaseGameBoyGfx + $a00
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16ba9_RubyField: ; 0x16ba9
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $20
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $1080
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16bb3_RubyField: ; 0x16bb3
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $23
	dw StageRubyFieldBottomBaseGameBoyGfx + $a30
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16bbd_RubyField: ; 0x16bbd
	dw Func_11d2
	db $30, $03
	dw vTilesBG tile $23
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $10B0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16bc7_RubyField: ; 0x16bc7
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1C
	dw StageRubyFieldBottomBaseGameBoyGfx + $9c0
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16bd1_RubyField: ; 0x16bd1
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1E
	dw StageRubyFieldBottomBaseGameBoyGfx + $9e0
	db Bank(StageRubyFieldBottomBaseGameBoyGfx)
	db $00

TileData_16bdb_RubyField: ; 0x16bdb
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1C
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $6E0
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileData_16be5_RubyField: ; 0x16be5
	dw Func_11d2
	db $20, $02
	dw vTilesBG tile $1E
	dw StageRedFieldBottomIndicatorsGfx_Gameboy + $700
	db Bank(StageRedFieldBottomIndicatorsGfx_Gameboy)
	db $00

TileDataPointers_16bef_RubyField:
	dw TileDataPointers_16bf9_RubyField
	dw TileDataPointers_16c03_RubyField
	dw TileDataPointers_16c0d_RubyField
	dw TileDataPointers_16c11_RubyField
	dw TileDataPointers_16c15_RubyField

TileDataPointers_16bf9_RubyField: ; 0x16bf9
	dw TileData_16c19_RubyField
	dw TileData_16c1c_RubyField
	dw TileData_16c1f_RubyField
	dw TileData_16c22_RubyField
	dw TileData_16c25_RubyField

TileDataPointers_16c03_RubyField: ; 0x16c03
	dw TileData_16c28_RubyField
	dw TileData_16c2b_RubyField
	dw TileData_16c2e_RubyField
	dw TileData_16c31_RubyField
	dw TileData_16c34_RubyField

TileDataPointers_16c0d_RubyField: ; 0x16c0d
	dw TileData_16c37_RubyField
	dw TileData_16c3a_RubyField

TileDataPointers_16c11_RubyField: ; 0x16c11
	dw TileData_16c3d_RubyField
	dw TileData_16c40_RubyField

TileDataPointers_16c15_RubyField: ; 0x16c15
	dw TileData_16c43_RubyField
	dw TileData_16c46_RubyField

TileData_16c19_RubyField: ; 0x16c19
	db $01
	dw TileData_16c49_RubyField

TileData_16c1c_RubyField: ; 0x16c1c
	db $01
	dw TileData_16c63_RubyField

TileData_16c1f_RubyField: ; 0x16c1f
	db $01
	dw TileData_16c7d_RubyField

TileData_16c22_RubyField: ; 0x16c22
	db $01
	dw TileData_16c97_RubyField

TileData_16c25_RubyField: ; 0x16c25
	db $01
	dw TileData_16cb1_RubyField

TileData_16c28_RubyField: ; 0x16c28
	db $01
	dw TileData_16ccb_RubyField

TileData_16c2b_RubyField: ; 0x16c2b
	db $01
	dw TileData_16ce5_RubyField

TileData_16c2e_RubyField: ; 0x16c2e
	db $01
	dw TileData_16cff_RubyField

TileData_16c31_RubyField: ; 0x16c31
	db $01
	dw TileData_16d19_RubyField

TileData_16c34_RubyField: ; 0x16c34
	db $01
	dw TileData_16d33_RubyField

TileData_16c37_RubyField: ; 0x16c37
	db $01
	dw TileData_16d4d_RubyField

TileData_16c3a_RubyField: ; 0x16c3a
	db $01
	dw TileData_16d5a_RubyField

TileData_16c3d_RubyField: ; 0x16c3d
	db $01
	dw TileData_16d67_RubyField

TileData_16c40_RubyField: ; 0x16c40
	db $01
	dw TileData_16d74_RubyField

TileData_16c43_RubyField: ; 0x16c43
	db $01
	dw TileData_16d81_RubyField

TileData_16c46_RubyField: ; 0x16c46
	db $01
	dw TileData_16d8f_RubyField

TileData_16c49_RubyField: ; 0x16c49
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $23
	db $5E

	db $02
	dw vBGMap + $43
	db $5F, $60

	db $02
	dw vBGMap + $64
	db $61, $62

	db $01
	dw vBGMap + $85
	db $63

	db $01
	dw vBGMap + $A5
	db $64

	db $00

TileData_16c63_RubyField: ; 0x16c63
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $23
	db $65

	db $02
	dw vBGMap + $43
	db $66, $67

	db $02
	dw vBGMap + $64
	db $61, $62

	db $01
	dw vBGMap + $85
	db $63

	db $01
	dw vBGMap + $A5
	db $64

	db $00

TileData_16c7d_RubyField: ; 0x16c7d
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $23
	db $65

	db $02
	dw vBGMap + $43
	db $66, $67

	db $02
	dw vBGMap + $64
	db $68, $69

	db $01
	dw vBGMap + $85
	db $63

	db $01
	dw vBGMap + $A5
	db $64

	db $00

TileData_16c97_RubyField: ; 0x16c97
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $23
	db $65

	db $02
	dw vBGMap + $43
	db $66, $67

	db $02
	dw vBGMap + $64
	db $68, $69

	db $01
	dw vBGMap + $85
	db $6A

	db $01
	dw vBGMap + $A5
	db $6B

	db $00

TileData_16cb1_RubyField: ; 0x16cb1
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $23
	db $5E

	db $02
	dw vBGMap + $43
	db $5F, $60

	db $02
	dw vBGMap + $64
	db $68, $69

	db $01
	dw vBGMap + $85
	db $6A

	db $01
	dw vBGMap + $A5
	db $6B

	db $00

TileData_16ccb_RubyField: ; 0x16ccb
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $30
	db $6C

	db $02
	dw vBGMap + $4F
	db $6D, $6E

	db $02
	dw vBGMap + $6E
	db $6F, $70

	db $01
	dw vBGMap + $8E
	db $71

	db $01
	dw vBGMap + $AE
	db $72

	db $00

TileData_16ce5_RubyField: ; 0x16ce5
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $30
	db $73

	db $02
	dw vBGMap + $4F
	db $74, $75

	db $02
	dw vBGMap + $6E
	db $6F, $70

	db $01
	dw vBGMap + $8E
	db $71

	db $01
	dw vBGMap + $AE
	db $72

	db $00

TileData_16cff_RubyField: ; 0x16cff
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $30
	db $73

	db $02
	dw vBGMap + $4F
	db $74, $75

	db $02
	dw vBGMap + $6E
	db $76, $77

	db $01
	dw vBGMap + $8E
	db $71

	db $01
	dw vBGMap + $AE
	db $72

	db $00

TileData_16d19_RubyField: ; 0x16d19
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $30
	db $73

	db $02
	dw vBGMap + $4F
	db $74, $75

	db $02
	dw vBGMap + $6E
	db $76, $77

	db $01
	dw vBGMap + $8E
	db $78

	db $01
	dw vBGMap + $AE
	db $79

	db $00

TileData_16d33_RubyField: ; 0x16d33
	dw LoadTileLists
	db $07

	db $01
	dw vBGMap + $30
	db $6C

	db $02
	dw vBGMap + $4F
	db $6D, $6E

	db $02
	dw vBGMap + $6E
	db $76, $77

	db $01
	dw vBGMap + $8E
	db $78

	db $01
	dw vBGMap + $AE
	db $79

	db $00

TileData_16d4d_RubyField: ; 0x16d4d
	dw LoadTileLists
	db $03

	db $01
	dw vBGMap + $6
	db $48

	db $02
	dw vBGMap + $26
	db $49, $4A

	db $00

TileData_16d5a_RubyField: ; 0x16d5a
	dw LoadTileLists
	db $03

	db $01
	dw vBGMap + $6
	db $4B

	db $02
	dw vBGMap + $26
	db $4C, $4D

	db $00

TileData_16d67_RubyField: ; 0x16d67
	dw LoadTileLists
	db $03

	db $01
	dw vBGMap + $D
	db $4E

	db $02
	dw vBGMap + $2C
	db $4F, $50

	db $00

TileData_16d74_RubyField: ; 0x16d74
	dw LoadTileLists
	db $03

	db $01
	dw vBGMap + $D
	db $51

	db $02
	dw vBGMap + $2C
	db $52, $53

	db $00

TileData_16d81_RubyField: ; 0x16d81
	dw LoadTileLists
	db $04

	db $02
	dw vBGMap + $49
	db $40, $41

	db $02
	dw vBGMap + $69
	db $42, $43

	db $00

TileData_16d8f_RubyField: ; 0x16d8f
	dw LoadTileLists
	db $04

	db $02
	dw vBGMap + $49
	db $44, $45

	db $02
	dw vBGMap + $69
	db $46, $47

	db $00
