DrawSpritesForStage: ; 0x84b7
; Draw sprites (OAM data) for the current stage.
	ld a, [wCurrentStage]
	call CallInFollowingTable
CallTable_84bd: ; 0x84bd
	padded_dab DrawSpritesRedFieldTop       ; STAGE_RED_FIELD_TOP
	padded_dab DrawSpritesRedFieldBottom    ; STAGE_RED_FIELD_BOTTOM
	padded_dab DrawSpritesBlueFieldTop      ; STAGE_BLUE_FIELD_TOP
	padded_dab DrawSpritesBlueFieldBottom   ; STAGE_BLUE_FIELD_BOTTOM
	padded_dab DrawSpritesGoldFieldTop      ; STAGE_GOLD_FIELD_TOP
	padded_dab DrawSpritesGoldFieldBottom   ; STAGE_GOLD_FIELD_BOTTOM
	padded_dab DrawSpritesSilverFieldTop    ; STAGE_SILVER_FIELD_TOP
	padded_dab DrawSpritesSilverFieldBottom ; STAGE_SILVER_FIELD_BOTTOM
	padded_dab DrawSpritesGengarBonus
	padded_dab DrawSpritesGengarBonus       ; STAGE_GENGAR_BONUS
	padded_dab DrawSpritesMewtwoBonus
	padded_dab DrawSpritesMewtwoBonus       ; STAGE_MEWTWO_BONUS
	padded_dab DrawSpritesMeowthBonus
	padded_dab DrawSpritesMeowthBonus       ; STAGE_MEOWTH_BONUS
	padded_dab DrawSpritesDiglettBonus
	padded_dab DrawSpritesDiglettBonus      ; STAGE_DIGLETT_BONUS
	padded_dab DrawSpritesSeelBonus
	padded_dab DrawSpritesSeelBonus         ; STAGE_SEEL_BONUS
	padded_dab DrawSpritesUnownBonus
	padded_dab DrawSpritesUnownBonus        ; STAGE_UNOWN_BONUS

UnusedFunc_84fd:
; unused
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .not_cgb
	ld a, $1
	ld [rVBK], a
	xor a
	call .FillAttrsOrBGMap
	xor a
	ld [rVBK], a
.not_cgb
	ld a, $81
	call .FillAttrsOrBGMap
	ld de, wBottomMessageBuffer + $47
	call Func_8524
	ret

.FillAttrsOrBGMap: ; 8519 (2:4519)
	hlCoord 0, 0, vBGWin
	ld b, $20
.loop
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .loop
	ret
