TryReleaseRoamingDogs:
; Checks if the current map is BURNED_TOWER and releases the roaming dogs, if they haven't
; previously been released. Plays a short cutscene, too.
	ld a, [wCurrentMap]
	cp BURNED_TOWER
	ret nz
	ld a, [wRoamingDogsStatus]
	bit 0, a
	ret nz ; they were previously released
	set 0, a
	ld [wRoamingDogsStatus], a ; set the "released" flag
	; Play cutscene
	call LoadMapPalettesIntoDestinationPalettes
	call FadeOut

	; Load Graphics for cutscene
	call DisableLCD
	; load mini sprites for the dogs
	ld hl, RoamingDogsMiniGfx
	ld a, Bank(RoamingDogsMiniGfx)
	ld de, vTilesOB tile $40
	ld bc, (RoamingDogsMiniGfx_End - RoamingDogsMiniGfx)
	call LoadOrCopyVRAMData
	call ClearOAMBuffer
	call EnableLCD

	; Handle animation for cutscene
	
	; Load black portal sprite
	ld a, Bank(RoamingDogsBlackPalette)
	ld hl, RoamingDogsBlackPalette
	ld de, $0040 ; OAM palettes, and load starting at first OAM palette slot.
	ld bc, $0008
	call FarCopyPalettes
	ld e, $85
	call AnimateDog
	ld e, $86
	call AnimateDog
	ld e, $87
	call AnimateDog
	call FadeOut
	call ClearOAMBuffer
	call DisableLCD
	callba LoadStageData
	callba DrawSpritesForStage
	callba LoadMapBillboardTileData
	ld b, 20
.loop
	call DelayFrame
	dec b
	jr nz, .loop
	call EnableLCD
	call FadeIn
	call FillBottomMessageBufferWithBlackTile
	call EnableBottomText
	ld hl, wScrollingText1
	ld de, ReleasedBeastsText
	call LoadScrollingText
.waitForScrollingText
	callba UpdateBottomText
	rst AdvanceFrame
	ld a, [wBottomTextEnabled]
	and a
	jr nz, .waitForScrollingText
	ret

ENTRANCE_FRAMES EQU $1A
ENTRANCE_JUMP_HEIGHT EQU $28
ENTRANCE_Y_OFFSET EQU $18
JUMP_AWAY_FRAMES EQU $30
JUMP_AWAY_HEIGHT EQU $10

DrawPortal:
	ld a, $88
	ld bc, $0000
	call LoadOAMData2
	ret

LoadDogsCutsceneBlackPalette:
	ld a, Bank(RoamingDogsBlackPalette)
	ld hl, RoamingDogsBlackPalette
	ld de, $0048 ; OAM palettes, and load starting at first OAM palette slot.
	ld bc, $0008
	call FarCopyPalettes
	ret

AnimateDog:
; e = dog oam id
	push de
	call LoadDogsCutsceneBlackPalette
	pop de
	push de
	call AnimateDogEntrance
	pop de
	call AnimateDogJumpAway
	ret

AnimateDogEntrance:
; e = dog OAM id
	push de
	lb de, $39, $39
	call PlaySoundEffect
	pop de
	ld d, 0
.loop
	push de
	call ClearOAMBuffer
	call GetSineIndexForFrame_Entrance
	call Sine
	; e = sin(a)
	ld bc, ENTRANCE_JUMP_HEIGHT
	call MultiplyBCByEAndRoundToMostSignificantShort
	call NegateBC
	; bc = number of pixels to travel upward
	ld a, c
	add ENTRANCE_Y_OFFSET
	ld c, a
	pop de
	push de
	ld a, e ; e contains the oam id
	ld b, 0
	call LoadOAMData2
	call DrawPortal
	call DelayFrame
	pop de
	inc d
	ld a, d
	cp ENTRANCE_FRAMES
	jr c, .loop
	ld bc, 3
	ld hl, MiniDogPalettes
.findDogLoop
	ld a, [hli]
	cp e
	jr z, .foundDog
	add hl, bc
	jr .findDogLoop
.foundDog
	ld a, [hli]
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld h, b
	ld l, c
	ld de, $0048 ; OAM palettes, and load starting at first OAM palette slot.
	ld bc, $0008
	call FarCopyPalettes
	ld a, 60
.pauseLoop
	push af
	call DelayFrame
	pop af
	dec a
	jr nz, .pauseLoop
	ret

AnimateDogJumpAway:
; e = dog oam id
	ld d, 0
.loop
	ld c, 15
	call DModulus
	jr nz, .noSoundEffect
	push de
	lb de, $5, $5
	call PlaySoundEffect
	pop de
.noSoundEffect
	push de	
	call ClearOAMBuffer
	call GetXOffsetForFrame_JumpAway
	ld b, d
	pop de ; recall register e, which contains dog oam id
	push de
	ld d, a
	push de
	ld d, b
	call GetSineIndexForFrame_JumpAway
	call Sine
	; e = sin(a)
	ld bc, JUMP_AWAY_HEIGHT
	call MultiplyBCByEAndRoundToMostSignificantShort
	call NegativAbsC
	pop de
	ld b, d
	; bc = sprite pixel offsets
	ld a, e ; e contains dog oam id
	call LoadOAMData2
	call DrawPortal
	call DelayFrame
	pop de
	inc d
	ld a, d
	cp JUMP_AWAY_FRAMES
	jr c, .loop
	ret

DModulus:
; Checks if d is evenly divisble by register c.
	ld a, d
.loop
	and a
	jr z, .success
	cp c
	jr c, .failure
	sub c
	jr .loop
.failure
	inc a
	ret
.success
	xor a
	ret

NegateBC:
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	ret

NegativAbsC:
; c = negative absolute value of c
	ld a, c
	cp $7F
	ret nc
	cpl
	inc a
	ld c, a
	ret

GetSineIndexForFrame_Entrance:
	ld a, d
	add d
	add d
	add d
	ret

GetSineIndexForFrame_JumpAway:
	; d = current frame
	ld a, d
	add d
	add d
	add d
	add a
	ret

GetXOffsetForFrame_JumpAway:
	; d = current frame
	; e = dog oam id.  use the bit 0 to determine jumping direction
	; return result in a
	ld a, d
	add d
	bit 0, e
	ret z
	; jumping left, so negate the value
	cpl
	inc a
	ret

RoamingDogsBlackPalette:
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0
	RGB 0, 0, 0

MiniDogPalettes:
	db $85
	dba MiniSuicunePalette
	db $86
	dba MiniRaikouPalette
	db $87
	dba MiniEnteiPalette

MiniSuicunePalette:
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 10, 9, 31
	RGB 0, 0, 0

MiniRaikouPalette:
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 15, 10, 3
	RGB 0, 0, 0

MiniEnteiPalette:
	RGB 31, 31, 31
	RGB 31, 19, 10
	RGB 31, 7, 1
	RGB 0, 0, 0

LoadMapPalettesIntoDestinationPalettes:
	ld hl, wPaletteData + $30
	ld de, rBGPI
	ld b, $30
	ld c, e
	inc c
	call WaitForLCD
.asm_da4
	call Func_61b
.asm_da7
	ld a, [rSTAT]
	and $3
	jr nz, .asm_da7  ; wait for lcd controller to finish transferring data
	ld a, b
	ld [de], a
	ld a, [$ff00+c]
	ld [hli], a
	inc b
	ld a, b
	ld [de], a
	ld a, [$ff00+c]
	ld [hli], a
	inc b
	ld a, b
	ld [de], a
	ld a, [$ff00+c]
	ld [hli], a
	inc b
	ld a, b
	ld [de], a
	ld a, [$ff00+c]
	ld [hli], a
	inc b
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ld a, b
	cp $40
	jr nz, .asm_da4
	ret
