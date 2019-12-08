InitUnownBonusStage:
	ld a, [wLoadingSavedGame]
	and a
	jr z, .asm_180ac
	xor a
	ld [wd674], a
	ld a, $8
	ld [wd690], a
	ld [wd6a1], a
	ret
.asm_180ac
	ld a, $1
	ld [wDisableHorizontalScrollForBallStart], a
	ld a, [wBallType]
	ld [wBallTypeBackup], a
	xor a
	ld [wd4c8], a
	ld [wBallType], a
	ld [wCompletedBonusStage], a
	xor a
	ld [wd67b], a
	ld [wd695], a
	ld hl, wd6a2
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wd656], a
	ld bc, $0130  ; 1 minute 30 seconds
	callba StartTimer
	ld a, Bank(Music_GastlyInTheGraveyard)
	call SetSongBank
	ld de, MUSIC_GASTLY_GRAVEYARD
	call PlaySong
	ret
