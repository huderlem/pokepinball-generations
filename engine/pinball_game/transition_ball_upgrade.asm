INCLUDE "data/queued_tiledata/ball_upgrade.asm"

TransitionPinballUpgrade: ; 0x155a7
	ld a, [wBallType]
	ld c, a
	sla c
	ld b, $0
	ld hl, PinballUpgradeTransition_TileDataPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, Bank(PinballUpgradeTransition_TileDataPointers)
	call QueueGraphicsToLoad
	; fall through

TransitionPinballUpgradePalette: ; 0x155bb
	ld a, [wBallType]
	sla a
	ld c, a
	ld b, $0
	ld hl, PinballUpgradeTransitionPalettes
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, BANK(PinballUpgradeTransitionPalettes)
	ld de, LoadPalettes
	call QueueGraphicsToLoadWithFunc
	ret
