FieldSelectKanto_PaletteData:
	db $08
	db $08 ; number of colors
	db $00 ; bg colors
	dw FieldSelectScreenPalettes_Kanto
	db Bank(FieldSelectScreenPalettes_Kanto)
	db $00 ; terminator

FieldSelectJohto_PaletteData:
	db $08
	db $08 ; number of colors
	db $00 ; bg colors
	dw FieldSelectScreenPalettes_Johto
	db Bank(FieldSelectScreenPalettes_Johto)
	db $00 ; terminator
