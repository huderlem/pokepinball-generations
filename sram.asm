INCLUDE "macros.asm"
INCLUDE "constants/pokemon_constants.asm"

SECTION "SRAM 0", SRAM

saved_data: MACRO
\1:: ds \2
\1Signature:: ds 2
\1Checksum:: dw
\1Backup:: ds \2
\1BackupSignature:: ds 2
\1BackupChecksum:: dw
ENDM

	saved_data sHighScores, $104  ; a000
	saved_data sPokedexFlags, (NUM_POKEMON + 1)
	saved_data sKeyConfigs, $e
	saved_data sSaveGame, $4c3    ; a36C

	ds $23d
sRNGMod:: ; afff
