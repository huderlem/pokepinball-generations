HandleBallLoss: ; 0xdc49
	ld a, [wCurrentStage]
	rst JumpTable  ; calls JumpToFuncInTable
CallTable_dc4d: ; 0xdc4d
	dw HandleBallLossRedField     ; STAGE_RED_FIELD_TOP
	dw HandleBallLossRedField     ; STAGE_RED_FIELD_BOTTOM
	dw HandleBallLossBlueField    ; STAGE_BLUE_FIELD_TOP
	dw HandleBallLossBlueField    ; STAGE_BLUE_FIELD_TOP
	dw HandleBallLossGoldField    ; STAGE_GOLD_FIELD_TOP
	dw HandleBallLossGoldField    ; STAGE_GOLD_FIELD_BOTTOM
	dw HandleBallLossSilverField  ; STAGE_SILVER_FIELD_TOP
	dw HandleBallLossSilverField  ; STAGE_SILVER_FIELD_TOP
	dw HandleBallLossGengarBonus  ; STAGE_GENGAR_BONUS
	dw HandleBallLossGengarBonus  ; STAGE_GENGAR_BONUS
	dw HandleBallLossMewtwoBonus  ; STAGE_MEWTWO_BONUS
	dw HandleBallLossMewtwoBonus  ; STAGE_MEWTWO_BONUS
	dw HandleBallLossMeowthBonus  ; STAGE_MEOWTH_BONUS
	dw HandleBallLossMeowthBonus  ; STAGE_MEOWTH_BONUS
	dw HandleBallLossDiglettBonus ; STAGE_DIGLETT_BONUS
	dw HandleBallLossDiglettBonus ; STAGE_DIGLETT_BONUS
	dw HandleBallLossSeelBonus    ; STAGE_SEEL_BONUS
	dw HandleBallLossSeelBonus    ; STAGE_SEEL_BONUS

ShowBallLossText: ; 0xdc6d
; Input: de = pointer to scrolling text header
	push de
	call FillBottomMessageBufferWithBlackTile
	call Func_30db
	ld hl, wScrollingText3
	pop de
	call LoadScrollingText
	ret
