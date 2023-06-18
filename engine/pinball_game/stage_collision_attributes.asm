LoadStageCollisionAttributes: ; 0xe578
	ld a, [wCurrentStage]
	sla a
	ld c, a
	ld b, $0
	ld hl, StageCollisionAttributesPointers
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	and a
	jr z, .asm_e598
	ld a, [wStageCollisionState]
	sla a
	ld c, a
	sla a
	add c
	ld c, a
	ld b, $0  ; bc = 6 * [wStageCollisionState]
	add hl, bc
.asm_e598
	ld de, wStageCollisionMapPointer
	ld b, $6
.asm_e59d
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_e59d
	call LoadCollisionAttributes
	ret

StageCollisionAttributesPointers: ; 0xe5a7
	dw StageRedFieldTopCollisionAttributesPointers
	dw StageRedFieldBottomCollisionAttributesPointers
	dw StageBlueFieldTopCollisionAttributesPointers
	dw StageBlueFieldBottomCollisionAttributesPointers
	dw StageGoldFieldTopCollisionAttributesPointers
	dw StageGoldFieldBottomCollisionAttributesPointers
	dw StageSilverFieldTopCollisionAttributesPointers
	dw StageSilverFieldBottomCollisionAttributesPointers
	dw StageRubyFieldTopCollisionAttributesPointers
	dw StageRubyFieldBottomCollisionAttributesPointers
	dw StageSapphireFieldTopCollisionAttributesPointers
	dw StageSapphireFieldBottomCollisionAttributesPointers
	dw StageGengarBonusCollisionAttributesPointers
	dw StageGengarBonusCollisionAttributesPointers
	dw StageMewtwoBonusCollisionAttributesPointers
	dw StageMewtwoBonusCollisionAttributesPointers
	dw StageMeowthBonusCollisionAttributesPointers
	dw StageMeowthBonusCollisionAttributesPointers
	dw StageDiglettBonusCollisionAttributesPointers
	dw StageDiglettBonusCollisionAttributesPointers
	dw StageSeelBonusCollisionAttributesPointers
	dw StageSeelBonusCollisionAttributesPointers

StageRedFieldTopCollisionAttributesPointers: ; 0xe5c7
	db $01  ; multiple pair entries
	dwb StageRedFieldTopCollisionAttributes0, Bank(StageRedFieldTopCollisionAttributes0)
	dwb StageRedFieldTopCollisionMasks0, Bank(StageRedFieldTopCollisionMasks0)
	dwb StageRedFieldTopCollisionAttributes1, Bank(StageRedFieldTopCollisionAttributes1)
	dwb StageRedFieldTopCollisionMasks0, Bank(StageRedFieldTopCollisionMasks0)
	dwb StageRedFieldTopCollisionAttributes2, Bank(StageRedFieldTopCollisionAttributes2)
	dwb StageRedFieldTopCollisionMasks1, Bank(StageRedFieldTopCollisionMasks1)
	dwb StageRedFieldTopCollisionAttributes3, Bank(StageRedFieldTopCollisionAttributes3)
	dwb StageRedFieldTopCollisionMasks1, Bank(StageRedFieldTopCollisionMasks1)
	dwb StageRedFieldTopCollisionAttributes4, Bank(StageRedFieldTopCollisionAttributes4)
	dwb StageRedFieldTopCollisionMasks2, Bank(StageRedFieldTopCollisionMasks2)
	dwb StageRedFieldTopCollisionAttributes5, Bank(StageRedFieldTopCollisionAttributes5)
	dwb StageRedFieldTopCollisionMasks2, Bank(StageRedFieldTopCollisionMasks2)
	dwb StageRedFieldTopCollisionAttributes6, Bank(StageRedFieldTopCollisionAttributes6)
	dwb StageRedFieldTopCollisionMasks3, Bank(StageRedFieldTopCollisionMasks3)
	dwb StageRedFieldTopCollisionAttributes7, Bank(StageRedFieldTopCollisionAttributes7)
	dwb StageRedFieldTopCollisionMasks3, Bank(StageRedFieldTopCollisionMasks3)

StageRedFieldBottomCollisionAttributesPointers: ; 0xe5f8
	db $00  ; single pair entry
	dwb StageRedFieldBottomCollisionAttributes, Bank(StageRedFieldBottomCollisionAttributes)
	dwb StageRedFieldBottomCollisionMasks, Bank(StageRedFieldBottomCollisionMasks)

StageBlueFieldTopCollisionAttributesPointers: ; 0xe601
	db $01  ; multiple pair entries
	dwb StageBlueFieldTopCollisionAttributesBallEntrance, Bank(StageBlueFieldTopCollisionAttributesBallEntrance)
	dwb StageBlueFieldTopCollisionMasks, Bank(StageBlueFieldTopCollisionMasks)
	dwb StageBlueFieldTopCollisionAttributes, Bank(StageBlueFieldTopCollisionAttributes)
	dwb StageBlueFieldTopCollisionMasks, Bank(StageBlueFieldTopCollisionMasks)

StageBlueFieldBottomCollisionAttributesPointers: ; 0xe60e
	db $00  ; single pair entry
	dwb StageBlueFieldBottomCollisionAttributes, Bank(StageBlueFieldBottomCollisionAttributes)
	dwb StageBlueFieldBottomCollisionMasks, Bank(StageBlueFieldBottomCollisionMasks)

StageGoldFieldTopCollisionAttributesPointers: ; 0xe5c7
	db $01  ; multiple pair entries
	dwb StageGoldFieldTopCollisionAttributes0, Bank(StageGoldFieldTopCollisionAttributes0)
	dwb StageGoldFieldTopCollisionMasks0, Bank(StageGoldFieldTopCollisionMasks0)
	dwb StageGoldFieldTopCollisionAttributes1, Bank(StageGoldFieldTopCollisionAttributes1)
	dwb StageGoldFieldTopCollisionMasks0, Bank(StageGoldFieldTopCollisionMasks0)
	dwb StageGoldFieldTopCollisionAttributes2, Bank(StageGoldFieldTopCollisionAttributes2)
	dwb StageGoldFieldTopCollisionMasks1, Bank(StageGoldFieldTopCollisionMasks1)
	dwb StageGoldFieldTopCollisionAttributes3, Bank(StageGoldFieldTopCollisionAttributes3)
	dwb StageGoldFieldTopCollisionMasks1, Bank(StageGoldFieldTopCollisionMasks1)
	dwb StageGoldFieldTopCollisionAttributes4, Bank(StageGoldFieldTopCollisionAttributes4)
	dwb StageGoldFieldTopCollisionMasks2, Bank(StageGoldFieldTopCollisionMasks2)
	dwb StageGoldFieldTopCollisionAttributes5, Bank(StageGoldFieldTopCollisionAttributes5)
	dwb StageGoldFieldTopCollisionMasks2, Bank(StageGoldFieldTopCollisionMasks2)
	dwb StageGoldFieldTopCollisionAttributes6, Bank(StageGoldFieldTopCollisionAttributes6)
	dwb StageGoldFieldTopCollisionMasks3, Bank(StageGoldFieldTopCollisionMasks3)
	dwb StageGoldFieldTopCollisionAttributes7, Bank(StageGoldFieldTopCollisionAttributes7)
	dwb StageGoldFieldTopCollisionMasks3, Bank(StageGoldFieldTopCollisionMasks3)

StageGoldFieldBottomCollisionAttributesPointers: ; 0xe5f8
	db $00  ; single pair entry
	dwb StageGoldFieldBottomCollisionAttributes, Bank(StageGoldFieldBottomCollisionAttributes)
	dwb StageGoldFieldBottomCollisionMasks, Bank(StageGoldFieldBottomCollisionMasks)

StageSilverFieldTopCollisionAttributesPointers: ; 0xe601
	db $01  ; multiple pair entries
	dwb StageSilverFieldTopCollisionAttributesBallEntrance, Bank(StageSilverFieldTopCollisionAttributesBallEntrance)
	dwb StageSilverFieldTopCollisionMasks, Bank(StageSilverFieldTopCollisionMasks)
	dwb StageSilverFieldTopCollisionAttributes, Bank(StageSilverFieldTopCollisionAttributes)
	dwb StageSilverFieldTopCollisionMasks, Bank(StageSilverFieldTopCollisionMasks)

StageSilverFieldBottomCollisionAttributesPointers: ; 0xe60e
	db $00  ; single pair entry
	dwb StageSilverFieldBottomCollisionAttributes, Bank(StageSilverFieldBottomCollisionAttributes)
	dwb StageSilverFieldBottomCollisionMasks, Bank(StageSilverFieldBottomCollisionMasks)

StageRubyFieldTopCollisionAttributesPointers: ; 0xe5c7
	db $01  ; multiple pair entries
	dwb StageRubyFieldTopCollisionAttributes0, Bank(StageRubyFieldTopCollisionAttributes0)
	dwb StageRubyFieldTopCollisionMasks0, Bank(StageRubyFieldTopCollisionMasks0)
	dwb StageRubyFieldTopCollisionAttributes1, Bank(StageRubyFieldTopCollisionAttributes1)
	dwb StageRubyFieldTopCollisionMasks0, Bank(StageRubyFieldTopCollisionMasks0)
	dwb StageRubyFieldTopCollisionAttributes2, Bank(StageRubyFieldTopCollisionAttributes2)
	dwb StageRubyFieldTopCollisionMasks1, Bank(StageRubyFieldTopCollisionMasks1)
	dwb StageRubyFieldTopCollisionAttributes3, Bank(StageRubyFieldTopCollisionAttributes3)
	dwb StageRubyFieldTopCollisionMasks1, Bank(StageRubyFieldTopCollisionMasks1)
	dwb StageRubyFieldTopCollisionAttributes4, Bank(StageRubyFieldTopCollisionAttributes4)
	dwb StageRubyFieldTopCollisionMasks2, Bank(StageRubyFieldTopCollisionMasks2)
	dwb StageRubyFieldTopCollisionAttributes5, Bank(StageRubyFieldTopCollisionAttributes5)
	dwb StageRubyFieldTopCollisionMasks2, Bank(StageRubyFieldTopCollisionMasks2)
	dwb StageRubyFieldTopCollisionAttributes6, Bank(StageRubyFieldTopCollisionAttributes6)
	dwb StageRubyFieldTopCollisionMasks3, Bank(StageRubyFieldTopCollisionMasks3)
	dwb StageRubyFieldTopCollisionAttributes7, Bank(StageRubyFieldTopCollisionAttributes7)
	dwb StageRubyFieldTopCollisionMasks3, Bank(StageRubyFieldTopCollisionMasks3)

StageRubyFieldBottomCollisionAttributesPointers: ; 0xe5f8
	db $00  ; single pair entry
	dwb StageRubyFieldBottomCollisionAttributes, Bank(StageRubyFieldBottomCollisionAttributes)
	dwb StageRubyFieldBottomCollisionMasks, Bank(StageRubyFieldBottomCollisionMasks)

StageSapphireFieldTopCollisionAttributesPointers: ; 0xe601
	db $01  ; multiple pair entries
	dwb StageSapphireFieldTopCollisionAttributesBallEntrance, Bank(StageSapphireFieldTopCollisionAttributesBallEntrance)
	dwb StageSapphireFieldTopCollisionMasks, Bank(StageSapphireFieldTopCollisionMasks)
	dwb StageSapphireFieldTopCollisionAttributes, Bank(StageSapphireFieldTopCollisionAttributes)
	dwb StageSapphireFieldTopCollisionMasks, Bank(StageSapphireFieldTopCollisionMasks)

StageSapphireFieldBottomCollisionAttributesPointers: ; 0xe60e
	db $00  ; single pair entry
	dwb StageSapphireFieldBottomCollisionAttributes, Bank(StageSapphireFieldBottomCollisionAttributes)
	dwb StageSapphireFieldBottomCollisionMasks, Bank(StageSapphireFieldBottomCollisionMasks)

StageGengarBonusCollisionAttributesPointers: ; 0xe615
	db $01  ; multiple pair entries
	dwb StageGengarBonusCollisionAttributesBallEntrance, Bank(StageGengarBonusCollisionAttributesBallEntrance)
	dwb StageGengarBonusCollisionMasks, Bank(StageGengarBonusCollisionMasks)
	dwb StageGengarBonusCollisionAttributes, Bank(StageGengarBonusCollisionAttributes)
	dwb StageGengarBonusCollisionMasks, Bank(StageGengarBonusCollisionMasks)

StageMewtwoBonusCollisionAttributesPointers: ; 0xe622
	db $01  ; multiple pair entries
	dwb StageMewtwoBonusCollisionAttributesBallEntrance, Bank(StageMewtwoBonusCollisionAttributesBallEntrance)
	dwb StageMewtwoBonusCollisionMasks, Bank(StageMewtwoBonusCollisionMasks)
	dwb StageMewtwoBonusCollisionAttributes, Bank(StageMewtwoBonusCollisionAttributes)
	dwb StageMewtwoBonusCollisionMasks, Bank(StageMewtwoBonusCollisionMasks)

StageMeowthBonusCollisionAttributesPointers: ; 0xe62f
	db $01  ; multiple pair entries
	dwb StageMeowthBonusCollisionAttributesBallEntrance, Bank(StageMeowthBonusCollisionAttributesBallEntrance)
	dwb StageMeowthBonusCollisionMasks, Bank(StageMeowthBonusCollisionMasks)
	dwb StageMeowthBonusCollisionAttributes, Bank(StageMeowthBonusCollisionAttributes)
	dwb StageMeowthBonusCollisionMasks, Bank(StageMeowthBonusCollisionMasks)

StageDiglettBonusCollisionAttributesPointers: ; 0xe63c
	db $01  ; multiple pair entries
	dwb StageDiglettBonusCollisionAttributesBallEntrance, Bank(StageDiglettBonusCollisionAttributesBallEntrance)
	dwb StageDiglettBonusCollisionMasks, Bank(StageDiglettBonusCollisionMasks)
	dwb StageDiglettBonusCollisionAttributes, Bank(StageDiglettBonusCollisionAttributes)
	dwb StageDiglettBonusCollisionMasks, Bank(StageDiglettBonusCollisionMasks)

StageSeelBonusCollisionAttributesPointers: ; 0xe649
	db $01  ; multiple pair entries
	dwb StageSeelBonusCollisionAttributesBallEntrance, Bank(StageSeelBonusCollisionAttributesBallEntrance)
	dwb StageSeelBonusCollisionMasks, Bank(StageSeelBonusCollisionMasks)
	dwb StageSeelBonusCollisionAttributes, Bank(StageSeelBonusCollisionAttributes)
	dwb StageSeelBonusCollisionMasks, Bank(StageSeelBonusCollisionMasks)

LoadCollisionAttributes: ; 0xe656
; Loads the stage's collision attributes into RAM
; Input:  [wStageCollisionMapPointer] = pointer to collision attributes map
;         [wStageCollisionMapBank] = ROM bank of collision attributes map
	ld hl, wStageCollisionMapPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wStageCollisionMapBank]
	ld de, wStageCollisionMap
	ld bc, $0300
	call FarCopyData
	ld hl, wStageCollisionMapPointer
	ld [hl], (wStageCollisionMap & $ff)
	inc hl
	ld [hl], (wStageCollisionMap >> 8)
	inc hl
	ld [hl], $0  ; Bank 0, because the data is in WRAM, so it doesn't matter which bank is saved
	ret
