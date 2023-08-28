LoadBallGfx: ; 0xdcc3
	xor a
	ld [wd4c8], a
	ld a, [wBallType]
	ld b, a
	add b
	add b ; multiply ball type id by 3
	ld c, a
	ld b, 0
	ld hl, BallGfxPointers
	add hl, bc ; hl points to entry in BallGfxPointers
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, d
	ld l, e ; hl = gfx pointer, a = bank of gfx
	ld de, vTilesOB tile $40
	ld bc, $0200
	call LoadOrCopyVRAMData
	ret

BallGfxPointers:
	dwb PinballPokeballGfx, Bank(PinballPokeballGfx)
	dwb PinballGreatballGfx, Bank(PinballGreatballGfx)
	dwb PinballUltraballGfx, Bank(PinballUltraballGfx)
	dwb PinballMasterballGfx, Bank(PinballMasterballGfx)
	dwb PinballGSBallGfx, Bank(PinballGSBallGfx)

LoadMiniBallGfx: ; 0xdd12
	ld a, $1
	ld [wd4c8], a
	ld a, [wBallType]
	ld b, a
	add b
	add b ; multiply ball type id by 3
	ld c, a
	ld b, 0
	ld hl, MiniBallGfxPointers
	add hl, bc ; hl points to entry in MiniBallGfxPointers
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, d
	ld l, e ; hl = gfx pointer, a = bank of gfx
	ld de, vTilesOB tile $40
	ld bc, $0200
	call LoadOrCopyVRAMData
	ret

MiniBallGfxPointers:
	dwb PinballPokeballMiniGfx, Bank(PinballPokeballMiniGfx)
	dwb PinballGreatballMiniGfx, Bank(PinballGreatballMiniGfx)
	dwb PinballUltraballMiniGfx, Bank(PinballUltraballMiniGfx)
	dwb PinballMasterballMiniGfx, Bank(PinballMasterballMiniGfx)
	dwb PinballGSBallMiniGfx, Bank(PinballGSBallMiniGfx)

LoadSuperMiniPinballGfx: ; 0xdd62
; Loads the mini pinball graphics, which are used when entering the Slot or Ditto caves.
	ld a, $2
	ld [wd4c8], a
	ld a, $2a
	ld hl, PinballBallSuperMiniGfx
	ld de, vTilesOB tile $40
	ld bc, $0200
	call LoadOrCopyVRAMData
	ret
