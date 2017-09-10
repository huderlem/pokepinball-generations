ChooseWildMon:
	xor a
	ld [wSpecialMode], a
	ld [wSpecialModeState], a ;set ??? to 0
	call CheckRoamingDog
	jr c, .saveMonId
	call CheckForCelebi
	jr c, .saveMonId
	ld a, [wCurrentStage]
	sla a
	ld c, a ;store twice current stage to use a pointer offset
	ld b, $0
	ld hl, MapWildMonsPointers
	add hl, bc
	ld a, [hli] ;hl = pointer to wild mon pointer table
	ld h, [hl]
	ld l, a
	ld a, [wCurrentMap]
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr z, .foundMap
	cp $FF
	jr z, .mapNotFound
	inc hl
	inc hl
	jr .loop
.mapNotFound
	; Major error.  Wild mon data not found for current map. Default to Red stage pallet town, I guess.
	ld hl, RedStageWildMonsPointers + 1
.foundMap
	; [hl] = pointer to wild mons for map
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GenRandom
	and $f
	call CheckForMew ;a = $10 if mew, else is less
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wRareMonsFlag]  ; this gets set to $08 when the rare mons should be used.
	sla a
	ld c, a
	add hl, bc
	ld a, [hl]  ; a contains mon id. overshoots by 1 if mew, causing mew to be loaded
.saveMonId
	dec a
	ld [wCurrentCatchEmMon], a ;stores 1 less than ID
	ld a, [wCurrentStage]
	srl a
	sla a
	sla a
	sla a
	ld b, a
	ld a, [wBallType]
	add b
	ld [wLogTableNumber], a
	ld a, [wNumMapMoves]
	sla a
	sla a
	sla a
	sla a
	ld b, a
	ld a, [wRareMonsFlag]
	or b
	ld b, a
	ld [wLogMapMoves],a
	ret

CheckForMew:
; Sets the encountered mon to Mew if the following conditions are met:
;   1. Random number in register a equals $f
;   2. The current map is Indigo Plateau (it does a roundabout way of checking this)
;   3. The right alley has been hit three times
;   4. The Mewtwo Bonus Stage completion counter equals 2.
	push af
	cp $f  ; random number equals $f (1 in 16)
	jr nz, .NotMew
	ld a, [wCurrentMap]
	cp INDIGO_PLATEAU
	jr nz, .NotMew
	ld a, [wRareMonsFlag]
	cp $8
	jr nz, .NotMew
	ld a, [wNumMewtwoBonusCompletions]
	cp NUM_MEWTWO_COMPLETIONS_FOR_MEW
	jr nz, .NotMew
	pop af
	xor a
	ld [wNumMewtwoBonusCompletions], a
	ld a, $10
	ret

.NotMew
	pop af
	ret

CheckForCelebi:
; If Celebi should be encountered, set carry flag, and return mon id in register a.
; Celebi should be encountered in the following scenario:
;  1. Map is ILEX_FOREST
;  2. Ball upgrade is GS_BALL
;  3. Rare mons is activated
;  4. 25% chance
	ld a, [wCurrentMap]
	cp ILEX_FOREST
	jr nz, .notCelebi
	ld a, [wBallType]
	cp GS_BALL
	jr nz, .notCelebi
	ld a, [wRareMonsFlag]
	cp $8
	jr nz, .notCelebi
	call GenRandom
	cp $40 ; 25% chance
	jr nc, .notCelebi
	ld a, CELEBI
	scf
	ret
.notCelebi
	xor a
	ret

CheckRoamingDog:
; If a roaming dog is encountered, set carry flag, and return mon id in register a.
	ld a, [wRoamingDogsStatus]
	bit 0, a
	jr z, .noDog
	call GenRandom
	cp $20 ; chance/256 of rolling a wild dog encounter
	jr nc, .noDog
	; Pick one of the three dogs.
.getValidNumberLoop
	call GenRandom
	and $3
	cp 3
	jr z, .getValidNumberLoop
	ld d, a
	inc a
	ld b, a
	; Register b now has either 1, 2, or 3
	ld a, [wRoamingDogsStatus]
	ld c, a
	; Check if the dog specified by register b has already been caught
.shiftLoop
	srl c
	dec b
	jr nz, .shiftLoop
	bit 0, c
	jr nz, .noDog ; roaming dog has already been caught
	; Get the mon id for the roaming dog encounter.
	ld hl, RoamingDogs
	ld b, 0
	ld c, d
	add hl, bc
	ld a, [hl]
	scf
	ret
.noDog
	xor a
	ret

RoamingDogs:
	db RAIKOU
	db ENTEI
	db SUICUNE

INCLUDE "data/wild_mons.asm"
