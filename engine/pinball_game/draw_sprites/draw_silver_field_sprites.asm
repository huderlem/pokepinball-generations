DrawSpritesSilverFieldTop: ; 0x1f330
	ld bc, $7f00
	callba DrawTimer
	call DrawShellderSprites_SilverField
	call DrawSpinner_SilverField
	call DrawSlowpoke_SilverField
	call DrawCloyster_SilverField
	callba DrawPinball
	call DrawEvolutionIndicatorArrows_SilverFieldTop
	call DrawEvolutionTrinket_SilverFieldTop
	ret

DrawSpritesSilverFieldBottom: ; 0x1f35a
	ld bc, $7f00
	callba DrawTimer
	callba DrawMonCaptureAnimation
	call DrawAnimatedMon_SilverStage
	call DrawPikachuSavers_SilverStage
	callba DrawFlippers
	callba DrawPinball
	call DrawEvolutionIndicatorArrows_SilverFieldBottom
	call DrawEvolutionTrinket_SilverFieldBottom
	call DrawSlotGlow_SilverField
	ret

DrawShellderSprites_SilverField: ; 0x1f395
	ld de, wShellder1Animation_Unused
	ld hl, Data_1f3cf_SilverField
	call DrawShellderSprite_SilverField
	ld de, wShellder2Animation_Unused
	ld hl, Data_1f3d5_SilverField
	call DrawShellderSprite_SilverField
	ld de, wShellder3Animation_Unused
	ld hl, Data_1f3db_SilverField
	; fall through

DrawShellderSprite_SilverField: ; 0x1f3ad
	ld a, [hSCX]
	ld b, a
	ld a, [hli]
	sub b
	ld b, a
	ld a, [hSCY]
	ld c, a
	ld a, [hli]
	sub c
	ld c, a
	ld a, [wWhichAnimatedShellder]
	sub [hl]
	inc hl
	jr z, .asm_1f3c4
	ld a, $0
	jr .asm_1f3c6

.asm_1f3c4
	ld a, $1
.asm_1f3c6
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call LoadOAMData
	ret

Data_1f3cf_SilverField:
	db $48, $2D ; background scroll offsets (x, y)
	db $01
	db $E0, $E1, $E0 ; OAM ids

Data_1f3d5_SilverField:
	db $33, $3E ; background scroll offsets (x, y)
	db $00
	db $E0, $E1, $E0 ; OAM ids

Data_1f3db_SilverField:
	db $5D, $3E ; background scroll offsets (x, y)
	db $02
	db $E0, $E1, $E0 ; OAM ids

DrawSpinner_SilverField: ; 0x1f3e1
	ld a, $8a
	ld hl, hSCX
	sub [hl]
	ld b, a
	ld a, $53
	ld hl, hSCY
	sub [hl]
	ld c, a
	ld a, [wd50a]
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, SpinnerOAMIds_SilverField
	add hl, de
	ld a, [hl]
	call LoadOAMData
	ret

SpinnerOAMIds_SilverField:
	db $E8, $E9, $EA, $EB, $EC, $ED

DrawSlowpoke_SilverField: ; 0x1f408
	ld a, $18
	ld hl, hSCX
	sub [hl]
	ld b, a
	ld a, $5f
	ld hl, hSCY
	sub [hl]
	ld c, a
	ld a, [wSlowpokeAnimationFrame]
	ld e, a
	ld d, $0
	ld hl, SlowpokeOAMIds_SilverField
	add hl, de
	ld a, [hl]
	call LoadOAMData
	ret

SlowpokeOAMIds_SilverField:
	db $E2, $E3, $E4

DrawCloyster_SilverField: ; 0x1f428
	ld a, $70
	ld hl, hSCX
	sub [hl]
	ld b, a
	ld a, $59
	ld hl, hSCY
	sub [hl]
	ld c, a
	ld a, [wCloysterAnimationFrame]
	ld e, a
	ld d, $0
	ld hl, CloysterOAMIds_SilverField
	add hl, de
	ld a, [hl]
	call LoadOAMData
	ret

CloysterOAMIds_SilverField:
	db $E5, $E6, $E7

DrawPikachuSavers_SilverStage: ; 0x1f448
	ld a, [hSCX]
	ld d, a
	ld a, [hSCY]
	ld e, a
	ld a, [wPikachuSaverSlotRewardActive]
	and a
	ld a, [wWhichPikachuSaverSide]
	jr z, .asm_1f473
	ld a, [wd51c]
	and a
	jr nz, .asm_1f469
	ld a, [hNumFramesDropped]
	srl a
	srl a
	srl a
	and $1
	jr .asm_1f473

.asm_1f469
	ld a, [wBallXPos + 1]
	cp $50
	ld a, $1
	jr nc, .asm_1f473
	xor a
.asm_1f473
	sla a
	ld c, a
	ld b, $0
	ld hl, PikachuSaverOAMOffsets_SilverStage
	add hl, bc
	ld a, [hli]
	sub d
	ld b, a
	ld a, [hli]
	sub e
	ld c, a
	ld a, [wPikachuSaverAnimationFrame]
	add $e
	call LoadOAMData
	ret

PikachuSaverOAMOffsets_SilverStage:
	dw $7E0F
	dw $7E92

DrawEvolutionIndicatorArrows_SilverFieldTop: ; 0x1f48f
	ld a, [wEvolutionObjectsDisabled]
	and a
	ret nz
	ld a, [hNumFramesDropped]
	bit 4, a
	ret z
	ld de, wIndicatorStates + 5
	ld hl, EvolutionIndicatorArrowsOAM_SilverFieldTop
	ld b, $6
	jr DrawEvolutionIndicatorArrows_SilverField

DrawEvolutionIndicatorArrows_SilverFieldBottom: ; 0x1f4a3
	ld a, [wEvolutionObjectsDisabled]
	and a
	ret nz
	ld a, [hNumFramesDropped]
	bit 4, a
	ret z
	ld de, wIndicatorStates + 11
	ld hl, EvolutionIndicatorArrowsOAM_SilverFieldBottom
	ld b, $8
DrawEvolutionIndicatorArrows_SilverField:
	push bc
	ld a, [hSCX]
	ld b, a
	ld a, [hli]
	sub b
	ld b, a
	ld a, [hSCY]
	ld c, a
	ld a, [hli]
	sub c
	ld c, a
	ld a, [de]
	and a
	ld a, [hli]
	call nz, LoadOAMData
	pop bc
	inc de
	dec b
	jr nz, DrawEvolutionIndicatorArrows_SilverField
	ret

EvolutionIndicatorArrowsOAM_SilverFieldTop: ; 0x1f4ce
 ; Each entry is:
 ; [OAM x/y Offsets],[OAM Id]
	db $0D, $37
	db $EE

	db $35, $0D
	db $F1

	db $8E, $4E
	db $F4

	db $36, $64
	db $EF

	db $4C, $49
	db $EE

	db $61, $64
	db $F0

EvolutionIndicatorArrowsOAM_SilverFieldBottom: ; 0x1f4e0
 ; Each entry is 3 bytes:
 ; [OAM x/y Offsets],[OAM Id]
	db $2D, $13
	db $32

	db $6A, $13
	db $33

	db $25, $2D
	db $34

	db $73, $2D
	db $35

	db $38, $14
	db $36

	db $66, $14
	db $36

	db $79, $40
	db $37

	db $89, $40
	db $37

DrawEvolutionTrinket_SilverFieldTop: ; 0x1f4f8
	ld a, [wEvolutionObjectsDisabled]
	and a
	ret z
	ld de, wd566
	ld hl, EvolutionTrinketOAMOffsets_SilverFieldTop
	ld b, $c
	ld c, $47
	jr DrawEvolutionTrinket_SilverField

DrawEvolutionTrinket_SilverFieldBottom: ; 0x1f509
	ld a, [wEvolutionObjectsDisabled]
	and a
	ret z
	ld de, wd572
	ld hl, EvolutionTrinketOAMOffsets_SilverFieldBottom
	ld b, $6
	ld c, $40
DrawEvolutionTrinket_SilverField: ; 0x1f518
	push bc
	ld a, [de]
	add c
	cp c
	push af
	ld a, [hSCX]
	ld b, a
	ld a, [hli]
	sub b
	ld b, a
	ld a, [hSCY]
	ld c, a
	ld a, [hli]
	sub c
	ld c, a
	ld a, [hNumFramesDropped]
	and $e
	jr nz, .asm_1f530
	dec c
.asm_1f530
	pop af
	call nz, LoadOAMData
	pop bc
	inc de
	dec b
	jr nz, DrawEvolutionTrinket_SilverField
	ret

EvolutionTrinketOAMOffsets_SilverFieldTop: ; 0x1f53a
; OAM data x, y offsets
	db $4C, $08
	db $2B, $12
	db $6D, $12
	db $15, $25
	db $82, $25
	db $0D, $3F
	db $4C, $7F
	db $8B, $3F
	db $0A, $65
	db $36, $7F
	db $61, $7F
	db $8D, $65

EvolutionTrinketOAMOffsets_SilverFieldBottom: ; 0x1f552
; OAM data x, y offsets
	db $3B, $12
	db $5D, $12
	db $31, $16
	db $67, $16
	db $25, $2C
	db $73, $2C

DrawSlotGlow_SilverField: ; 0x1f55e
; Draws the glowing animation surround the slot cave entrance.
	ld a, [wSlotIsOpen]
	and a
	ret z
	ld a, [wSlotGlowingAnimationCounter]
	inc a
	ld [wSlotGlowingAnimationCounter], a
	ld a, $40
	ld hl, hSCX
	sub [hl]
	ld b, a
	ld a, $1
	ld hl, hSCY
	sub [hl]
	ld c, a
	ld a, [wSlotGlowingAnimationCounter]
	srl a
	srl a
	srl a
	and $3
	add $4f
	cp $52
	call nz, LoadOAMData
	ret

DrawAnimatedMon_SilverStage: ; 0x1f58b
	ld a, [wWildMonIsHittable]
	and a
	ret z
	ld a, $50
	ld hl, hSCX
	sub [hl]
	ld b, a
	ld a, $3e
	ld hl, hSCY
	sub [hl]
	ld c, a
	ld a, [wCurrentAnimatedMonSpriteFrame]
	ld e, a
	ld d, $0
	ld hl, AnimatedMonOAMIds_SilverStage
	add hl, de
	ld a, [hl]
	call LoadOAMData
	ret

AnimatedMonOAMIds_SilverStage:
	db $26, $27, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F, $30, $31
