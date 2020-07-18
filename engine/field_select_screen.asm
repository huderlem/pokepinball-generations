HandleFieldSelectScreen: ; 0xd6d3
	ld a, [wScreenState]
	rst JumpTable  ; calls JumpToFuncInTable
FieldSelectScreenFunctions: ; 0xd6d7
	dw LoadFieldSelectScreen
	dw ChooseFieldToPlay
	dw ExitFieldSelectScreen

LoadFieldSelectScreen: ; 0xd6dd
	ld a, $43
	ld [hLCDC], a
	ld a, $e4
	ld [wBGP], a
	ld a, $d2
	ld [wOBP0], a
	ld [wOBP1], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld [wWhichFieldSelectRegion], a ; KANTO
	xor a
	ld hl, FieldSelectGfxPointers
	call LoadVideoData
	call ClearOAMBuffer
	ld a, $8
	ld [wFieldSelectBlinkingBorderFrame], a
	call SetAllPalettesWhite
	ld a, Bank(Music_FieldSelect)
	call SetSongBank
	ld de, MUSIC_FIELD_SELECT
	call PlaySong
	call EnableLCD
	call FadeIn
	ld hl, wScreenState
	inc [hl]
	ret

FieldSelectGfxPointers: ; 0xd71c
	dw FieldSelectGfxList_Initial
	dw FieldSelectGfxList_Kanto
	dw FieldSelectGfxList_Johto
	dw FieldSelectGfxList_Hoenn

FieldSelectGfxList_Initial: ; 0xd730
	VIDEO_DATA_TILES    FieldSelectScreenGfx, vTilesSH - $110, $d10
	VIDEO_DATA_TILEMAP  FieldSelectTilemap_Kanto, vBGMap, $240
	VIDEO_DATA_BGATTR   FieldSelectBGAttributes_Kanto, vBGMap, $240
	VIDEO_DATA_PALETTES FieldSelectScreenPalettes_Kanto, $48
	db $FF, $FF ; terminators

FieldSelectGfxList_Kanto:
	VIDEO_DATA_TILES    FieldSelectGfx_Kanto, vTilesSH, (FieldSelectGfx_Kanto_End - FieldSelectGfx_Kanto)
	VIDEO_DATA_TILEMAP  FieldSelectTilemap_Kanto, vBGMap, (FieldSelectTilemap_Kanto_End - FieldSelectTilemap_Kanto)
	VIDEO_DATA_PALETTES FieldSelectScreenPalettes_Kanto, $48
	db $FF, $FF ; terminators

FieldSelectGfxList_Johto:
	VIDEO_DATA_TILES    FieldSelectGfx_Johto, vTilesSH, (FieldSelectGfx_Johto_End - FieldSelectGfx_Johto)
	VIDEO_DATA_TILEMAP  FieldSelectTilemap_Johto, vBGMap, (FieldSelectTilemap_Johto_End - FieldSelectTilemap_Johto)
	VIDEO_DATA_PALETTES FieldSelectScreenPalettes_Johto, $48
	db $FF, $FF ; terminators

FieldSelectGfxList_Hoenn:
	VIDEO_DATA_TILES    FieldSelectGfx_Johto, vTilesSH, (FieldSelectGfx_Johto_End - FieldSelectGfx_Johto)
	VIDEO_DATA_TILEMAP  FieldSelectTilemap_Johto, vBGMap, (FieldSelectTilemap_Johto_End - FieldSelectTilemap_Johto)
	VIDEO_DATA_PALETTES FieldSelectScreenPalettes_Johto, $48
	db $FF, $FF ; terminators

ChooseFieldToPlay: ; 0xd74e
	call MoveFieldSelectCursor
	ld hl, FieldSelectBorderAnimationData
	call AnimateBlinkingFieldSelectBorder
	ld a, [hNewlyPressedButtons]
	and (D_UP | D_DOWN)
	jp nz, ChangeFieldSelectRegion
	ld a, [hNewlyPressedButtons]
	and (A_BUTTON | B_BUTTON)
	ret z
	ld [wFieldSelectPressedButton], a
	ld a, $18  ; number of frames to blink the border after selecting the Field
	ld [wFieldSelectBlinkingBorderTimer], a
	ld a, $1
	ld [wFieldSelectBlinkingBorderFrame], a
	lb de, $00, $01
	call PlaySoundEffect
	ld hl, wScreenState
	inc [hl]
	ret

INCLUDE "data/queued_tiledata/field_select_switch_regions.asm"

ChangeFieldSelectRegion:
	bit BIT_D_UP, a
	jr z, .checkDown
	ld a, [wWhichFieldSelectRegion]
	cp REGION_KANTO
	ret z
	dec a
	jr .move
.checkDown
	bit BIT_D_DOWN, a
	jr z, .done
	ld a, [wWhichFieldSelectRegion]
	cp REGION_HOENN
	ret z
	inc a
.move
	push af
	call ClearOAMBuffer
	call FadeOut
	call DisableLCD
	pop af
	ld [wWhichFieldSelectRegion], a
	inc a
	ld hl, FieldSelectGfxPointers
	call LoadVideoData
.done
	call SetAllPalettesWhite
	call EnableLCD
	call FadeIn
	ret

ExitFieldSelectScreen: ; 0xd774
	ld a, [wFieldSelectPressedButton]  ; this holds the button that was pressed (A or B)
	bit BIT_A_BUTTON, a
	jr z, .didntPressA
	ld hl, FieldSelectConfirmationAnimationData
	call AnimateBlinkingFieldSelectBorder
	ld a, [wFieldSelectBlinkingBorderTimer]
	dec a
	ld [wFieldSelectBlinkingBorderTimer], a
	ret nz
.didntPressA
	ld a, [hJoypadState]
	push af
	call FadeOut
	call DisableLCD
	ld a, [wFieldSelectPressedButton]
	bit BIT_A_BUTTON, a
	jr z, .pressedB
	ld a, [wWhichFieldSelectRegion]
	sla a
	ld c, a
	ld a, [wSelectedFieldIndex]
	add c
	ld c, a
	ld b, $0
	ld hl, StartingStages
	add hl, bc
	ld a, [hl]
	ld [wCurrentStage], a
	pop af
	xor a
	ld [wSavedGame], a
	ld hl, wPartyMons
	ld de, sSaveGame
	ld bc, $04c4
	call SaveData
	xor a
	ld [wLoadingSavedGame], a
	; Start a game of Pinball
	ld a, SCREEN_PINBALL_GAME
	ld [wCurrentScreen], a
	xor a
	ld [wScreenState], a
	ret

.pressedB
	pop af
	ld a, SCREEN_TITLESCREEN
	ld [wCurrentScreen], a
	xor a
	ld [wScreenState], a
	ret

StartingStages: ; 0xd7d1
; wSelectedFieldIndex is used to index this array
	db STAGE_RED_FIELD_BOTTOM, STAGE_BLUE_FIELD_BOTTOM
	db STAGE_GOLD_FIELD_BOTTOM, STAGE_SILVER_FIELD_BOTTOM
	db STAGE_RUBY_FIELD_BOTTOM, STAGE_SAPPHIRE_FIELD_BOTTOM

MoveFieldSelectCursor: ; 0xd7d3
; When the player presses Right or Left, the stage is
; illuminated with a blinking border.  This function keeps tracks
; of which field is currently selected.
	ld a, [hPressedButtons]
	ld b, a
	ld a, [wSelectedFieldIndex]
	bit BIT_D_LEFT, b
	jr z, .didntPressLeft
	and a
	ret z  ; if cursor is already hovering over Red stage, don't do anything
	dec a  ; move cursor over Red stage
	ld [wSelectedFieldIndex], a
	lb de, $00, $3c
	call PlaySoundEffect
	ret

.didntPressLeft
	bit BIT_D_RIGHT, b
	ret z
	cp $1
	ret z  ; if cursor is already hovering over Blue stage, don't do anything
	inc a  ; move cursor over Red stage
	ld [wSelectedFieldIndex], a
	lb de, $00, $3d
	call PlaySoundEffect
	ret

AnimateBlinkingFieldSelectBorder: ; 0xd7fb
; This makes the border of the currently-selected Field blink in the Field Select screen.
	push hl
	ld a, [wSelectedFieldIndex]
	sla a
	ld c, a
	ld b, $0
	ld hl, FieldSelectBorderOAMPixelOffsetData
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [wd915]
	sla a
	ld e, a
	ld d, $0
	pop hl
	push hl
	add hl, de
	ld a, [hl]
	call LoadOAMData
	ld a, [wFieldSelectBlinkingBorderFrame]
	dec a
	jr nz, .asm_d838
	inc hl
	inc hl
	ld a, [hl]
	and a
	jr z, .asm_d82b
	ld a, [wd915]
	inc a
.asm_d82b
	ld [wd915], a
	sla a
	ld c, a
	ld b, $0
	pop hl
	push hl
	inc hl
	add hl, bc
	ld a, [hl]
.asm_d838
	ld [wFieldSelectBlinkingBorderFrame], a
	call UpdateRegionArrows
	pop hl
	ret

FieldSelectBorderAnimationData:
; [OAM id][duration]
	db $9e, $08
	db $9f, $08
	db $9e, $08
	db $a0, $08
	db $00  ; terminator

FieldSelectConfirmationAnimationData:
; [OAM id][duration]
	db $9F, $03
	db $A0, $03
	db $9F, $03
	db $A0, $03
	db $00  ; terminator

FieldSelectBorderOAMPixelOffsetData:
	dw $2A42
	dw $7242

UpdateRegionArrows:
	ld hl, wOAMBufferEnd - 8
	; Up Arrow
	ld a, [wWhichFieldSelectRegion]
	cp REGION_KANTO
	jr z, .skipUpArrow
	call .increaseOAMBufferSize
	ld a, [wFieldSelectBlinkingBorderFrame]
	srl a
	srl a
	add $20
	ld [hli], a
	ld a, $54
	ld [hli], a
	ld a, $6f
	ld [hli], a
	ld a, $40
	ld [hli], a
.skipUpArrow
	ld a, [wWhichFieldSelectRegion]	
	cp REGION_HOENN
	jr z, .skipDownArrow
	call .increaseOAMBufferSize
	ld a, [wFieldSelectBlinkingBorderFrame]
	srl a
	srl a
	add $84
	ld [hli], a
	ld a, $54
	ld [hli], a
	ld a, $6f
	ld [hli], a
	ld a, $00
	ld [hli], a
.skipDownArrow
	ret
.increaseOAMBufferSize
	ld a, [wOAMBufferSize]
	add 4
	ld [wOAMBufferSize], a
	ret
