_LoadStageDataUnownBonus:
	callba LoadBallGraphics
	call LoadFlippersPalette
	call Func_18d72_Unown
	ld a, [wLoadingSavedGame]
	callba LoadTimerGraphics
	and a
	ret z
	call Func_183db_Unown
	call Func_18d91_Unown
	ret
