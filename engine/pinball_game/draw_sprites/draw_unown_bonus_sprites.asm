DrawSpritesUnownBonus:
	ld bc, $7f00
	callba DrawTimer
	callba DrawFlippers
	callba DrawPinball
	ret
