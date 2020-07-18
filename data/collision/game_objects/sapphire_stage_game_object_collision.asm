SapphireStageBumpersCollisionAttributes:
	db $00  ; flat list
	db $34, $3F, $39, $3C, $38, $37, $3F, $33, $32, $3E, $3D, $3B, $3A, $3E, $36, $35, $31, $30
	db $FF ; terminator

SapphireStageBumpersCollisionData:
	db $06, $0B  ; x, y bounding box
	db $01, $30, $66  ; id, x, y
	db $02, $6F, $66  ; id, x, y
	db $FF ; terminator

SapphireStageShellderCollisionAttributes:
	db $00  ; flat list
	db $5E, $5F, $60, $61, $62, $63, $64, $65, $98, $66, $67, $68, $69, $6A, $6B, $99, $6C, $6D, $6E, $6F
	db $FF ; terminator

SapphireStageShellderCollisionData:
	db $0E, $0E  ; x, y bounding box
	db $03, $3A, $56  ; id, x, y
	db $04, $4F, $45  ; id, x, y
	db $05, $64, $56  ; id, x, y
	db $FF ; terminator

SapphireStageSpinnerCollisionData:
	db $08, $04  ; x, y bounding box
	db $06, $92, $6A  ; id, x, y
	db $FF ; terminator

SapphireStageBoardTriggersCollisionData:
	db $09, $09  ; x, y bounding box
	db $07, $15, $43  ; id, x, y
	db $08, $8B, $43  ; id, x, y
	db $09, $10, $8C  ; id, x, y
	db $0A, $8F, $8C  ; id, x, y
	db $FF ; terminator

SapphireStageCloysterCollisionData:
	db $06, $05  ; x, y bounding box
	db $0B, $73, $78  ; id, x, y
	db $FF ; terminator

SapphireStageSlowpokeCollisionData:
	db $06, $05  ; x, y bounding box
	db $0C, $2C, $78  ; id, x, y
	db $FF ; terminator

SapphireStagePikachuCollisionData:
	db $03, $05  ; x, y bounding box
	db $0D, $0E, $7C  ; id, x, y
	db $0E, $92, $7C  ; id, x, y
	db $FF ; terminator

SapphireStageBonusMultiplierCollisionAttributes:
	db $00  ; flat list
	db $56, $59, $58, $57, $1C, $5A, $5B, $5C, $5D, $1D
	db $FF ; terminator

SapphireStageBonusMultiplierCollisionData:
	db $09, $08  ; x, y bounding box
	db $0F, $2C, $20  ; id, x, y
	db $10, $74, $20  ; id, x, y
	db $FF ; terminator

SapphireStagePsyduckPoliwagCollisionAttributes:
	db $00  ; flat list
	db $5E, $5F, $24, $25
	db $FF ; terminator

SapphireStagePsyduckPoliwagCollisionData:
	db $08, $0C  ; x, y bounding box
	db $11, $22, $3E  ; id, x, y
	db $12, $7D, $3D  ; id, x, y
	db $FF ; terminator

SapphireStagePinballUpgradeTriggersCollisionData:
	db $06, $05  ; x, y bounding box
	db $13, $37, $34  ; id, x, y
	db $14, $4F, $2F  ; id, x, y
	db $15, $67, $35  ; id, x, y
	db $FF ; terminator

SapphireStageCAVELightsCollisionData:
	db $05, $03  ; x, y bounding box
	db $16, $0E, $65  ; id, x, y
	db $17, $1E, $65  ; id, x, y
	db $18, $82, $65  ; id, x, y
	db $19, $92, $65  ; id, x, y
	db $FF ; terminator

SapphireStageSlotCollisionData:
	db $04, $04  ; x, y bounding box
	db $1A, $50, $16  ; id, x, y
	db $FF ; terminator

SapphireStageWildPokemonCollisionAttributes:
	db $00  ; flat list
	db $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF
	db $FF ; terminator

SapphireStageWildPokemonCollisionData:
	db $1A, $1A  ; x, y bounding box
	db $1B, $50, $40  ; id, x, y
	db $FF ; terminator

SapphireTopEvolutionTrinketCoords: ; 0x1c6d7
; First byte is just non-zero to signify that the array hasn't ended.
; Second byte is x coordinate.
; Third byte is y coordinate.
	db $01, $44, $11
	db $01, $23, $1B
	db $01, $65, $1B
	db $01, $0D, $2E
	db $01, $7A, $2E
	db $01, $05, $48
	db $01, $44, $88
	db $01, $83, $48
	db $01, $02, $6E
	db $01, $2E, $88
	db $01, $59, $88
	db $01, $85, $6E
	db $00

SapphireBottomEvolutionTrinketCoords:
; First byte is just non-zero to signify that the array hasn't ended.
; Second byte is x coordinate.
; Third byte is y coordinate.
	db $01, $33, $1B
	db $01, $55, $1B
	db $01, $29, $1F
	db $01, $5F, $1F
	db $01, $1D, $35
	db $01, $6B, $35
	db $00

SapphireStageLaunchAlleyCollisionData:
	db $08, $08  ; x, y bounding box
	db $1C, $A8, $98  ; id, x, y
	db $FF ; terminator
