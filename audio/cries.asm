LoadCryData:
	ld a, [wScratchBuffer]
	ld d, a
	ld a, [wScratchBuffer + 1]
	ld e, a
	dec de
	ld hl, CryData
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld de, wScratchBuffer
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

CryData:
; Each entry is in the following format:
; [base cry id], [pitch], [length
	dw $000F, $0080, $0081  ; BULBASAUR
	dw $000F, $0020, $0100  ; IVYSAUR
	dw $000F, $0000, $0140  ; VENUSAUR
	dw $0004, $0060, $00C0  ; CHARMANDER
	dw $0004, $0020, $00C0  ; CHARMELEON
	dw $0004, $0000, $0100  ; CHARIZARD
	dw $001D, $0060, $00C0  ; SQUIRTLE
	dw $001D, $0020, $00C0  ; WARTORTLE
	dw $0013, $0000, $0100  ; BLASTOISE
	dw $0016, $0080, $00A0  ; CATERPIE
	dw $001C, $00CC, $0081  ; METAPOD
	dw $0016, $0077, $00C0  ; BUTTERFREE
	dw $0015, $00EE, $0081  ; WEEDLE
	dw $0013, $00FF, $0081  ; KAKUNA
	dw $0013, $0060, $0100  ; BEEDRILL
	dw $000E, $00DF, $0084  ; PIDGEY
	dw $0014, $0028, $0140  ; PIDGEOTTO
	dw $0014, $0011, $017F  ; PIDGEOT
	dw $0022, $0000, $0100  ; RATTATA
	dw $0022, $0020, $017F  ; RATICATE
	dw $0010, $0000, $0100  ; SPEAROW
	dw $0018, $0040, $0120  ; FEAROW
	dw $0017, $0012, $00C0  ; EKANS
	dw $0017, $00E0, $0090  ; ARBOK
	dw $000F, $00EE, $0081  ; PIKACHU
	dw $0009, $00EE, $0088  ; RAICHU
	dw $0000, $0020, $00C0  ; SANDSHREW
	dw $0000, $00FF, $017F  ; SANDSLASH
	dw $0001, $0000, $0100  ; NIDORAN_F
	dw $0001, $002C, $0160  ; NIDORINA
	dw $000A, $0000, $0100  ; NIDOQUEEN
	dw $0000, $0000, $0100  ; NIDORAN_M
	dw $0000, $002C, $0140  ; NIDORINO
	dw $0009, $0000, $0100  ; NIDOKING
	dw $0019, $00CC, $0081  ; CLEFAIRY
	dw $0019, $00AA, $00A0  ; CLEFABLE
	dw $0024, $004F, $0090  ; VULPIX
	dw $0024, $0088, $00E0  ; NINETALES
	dw $000E, $00FF, $00B5  ; JIGGLYPUFF
	dw $000E, $0068, $00E0  ; WIGGLYTUFF
	dw $001D, $00E0, $0100  ; ZUBAT
	dw $001D, $00FA, $0100  ; GOLBAT
	dw $0008, $00DD, $0081  ; ODDISH
	dw $0008, $00AA, $00C0  ; GLOOM
	dw $0023, $0022, $017F  ; VILEPLUME
	dw $001E, $0020, $0160  ; PARAS
	dw $001E, $0042, $017F  ; PARASECT
	dw $001A, $0044, $00C0  ; VENONAT
	dw $001A, $0029, $0100  ; VENOMOTH
	dw $000B, $00AA, $0081  ; DIGLETT
	dw $000B, $002A, $0090  ; DUGTRIO
	dw $0019, $0077, $0090  ; MEOWTH
	dw $0019, $0099, $017F  ; PERSIAN
	dw $0021, $0020, $00E0  ; PSYDUCK
	dw $0021, $00FF, $00C0  ; GOLDUCK
	dw $000A, $00DD, $00E0  ; MANKEY
	dw $000A, $00AF, $00C0  ; PRIMEAPE
	dw $001F, $0020, $00C0  ; GROWLITHE
	dw $0015, $0000, $0100  ; ARCANINE
	dw $000E, $00FF, $017F  ; POLIWAG
	dw $000E, $0077, $00E0  ; POLIWHIRL
	dw $000E, $0000, $017F  ; POLIWRATH
	dw $001C, $00C0, $0081  ; ABRA
	dw $001C, $00A8, $0140  ; KADABRA
	dw $001C, $0098, $017F  ; ALAKAZAM
	dw $001F, $00EE, $0081  ; MACHOP
	dw $001F, $0048, $00E0  ; MACHOKE
	dw $001F, $0008, $0140  ; MACHAMP
	dw $0021, $0055, $0081  ; BELLSPROUT
	dw $0025, $0044, $00A0  ; WEEPINBELL
	dw $0025, $0066, $014C  ; VICTREEBEL
	dw $001A, $0000, $0100  ; TENTACOOL
	dw $001A, $00EE, $017F  ; TENTACRUEL
	dw $0024, $00F0, $0090  ; GEODUDE
	dw $0024, $0000, $0100  ; GRAVELER
	dw $0012, $00E0, $00C0  ; GOLEM
	dw $0025, $0000, $0100  ; PONYTA
	dw $0025, $0020, $0140  ; RAPIDASH
	dw $0002, $0000, $0100  ; SLOWPOKE
	dw $001F, $0000, $0100  ; SLOWBRO
	dw $001C, $0080, $00E0  ; MAGNEMITE
	dw $001C, $0020, $0140  ; MAGNETON
	dw $0010, $00DD, $0081  ; FARFETCH_D
	dw $000B, $00BB, $0081  ; DODUO
	dw $000B, $0099, $00A0  ; DODRIO
	dw $000C, $0088, $0140  ; SEEL
	dw $000C, $0023, $017F  ; DEWGONG
	dw $0005, $0000, $0100  ; GRIMER
	dw $0007, $00EF, $017F  ; MUK
	dw $0018, $0000, $0100  ; SHELLDER
	dw $0018, $006F, $0160  ; CLOYSTER
	dw $001C, $0000, $0100  ; GASTLY
	dw $001C, $0030, $00C0  ; HAUNTER
	dw $0007, $0000, $017F  ; GENGAR
	dw $0017, $00FF, $0140  ; ONIX
	dw $000D, $0088, $00A0  ; DROWZEE
	dw $000D, $00EE, $00C0  ; HYPNO
	dw $0020, $0020, $0160  ; KRABBY
	dw $0020, $00EE, $0160  ; KINGLER
	dw $0006, $00ED, $0100  ; VOLTORB
	dw $0006, $00A8, $0110  ; ELECTRODE
	dw $000B, $0000, $0100  ; EXEGGCUTE
	dw $000D, $0000, $0100  ; EXEGGUTOR
	dw $0019, $0000, $0100  ; CUBONE
	dw $0008, $004F, $00E0  ; MAROWAK
	dw $0012, $0080, $0140  ; HITMONLEE
	dw $000C, $00EE, $0140  ; HITMONCHAN
	dw $000C, $0000, $0100  ; LICKITUNG
	dw $0012, $00E6, $015D  ; KOFFING
	dw $0012, $00FF, $017F  ; WEEZING
	dw $0004, $0000, $0100  ; RHYHORN
	dw $0011, $0000, $0100  ; RHYDON
	dw $0014, $000A, $0140  ; CHANSEY
	dw $0012, $0000, $0100  ; TANGELA
	dw $0003, $0000, $0100  ; KANGASKHAN
	dw $0019, $0099, $0090  ; HORSEA
	dw $0019, $003C, $0081  ; SEADRA
	dw $0016, $0080, $00C0  ; GOLDEEN
	dw $0016, $0010, $017F  ; SEAKING
	dw $001E, $0002, $00A0  ; STARYU
	dw $001E, $0000, $0100  ; STARMIE
	dw $0020, $0008, $00C0  ; MR_MIME
	dw $0016, $0000, $0100  ; SCYTHER
	dw $000D, $00FF, $017F  ; JYNX
	dw $0006, $008F, $017F  ; ELECTABUZZ
	dw $0004, $00FF, $00B0  ; MAGMAR
	dw $0014, $0000, $0100  ; PINSIR
	dw $001D, $0011, $00C0  ; TAUROS
	dw $0017, $0080, $0080  ; MAGIKARP
	dw $0017, $0000, $0100  ; GYARADOS
	dw $001B, $0000, $0100  ; LAPRAS
	dw $000E, $00FF, $017F  ; DITTO
	dw $001A, $0088, $00E0  ; EEVEE
	dw $001A, $00AA, $017F  ; VAPOREON
	dw $001A, $003D, $0100  ; JOLTEON
	dw $001A, $0010, $00A0  ; FLAREON
	dw $0025, $00AA, $017F  ; PORYGON
	dw $001F, $00F0, $0081  ; OMANYTE
	dw $001F, $00FF, $00C0  ; OMASTAR
	dw $0016, $00BB, $00C0  ; KABUTO
	dw $0018, $00EE, $0081  ; KABUTOPS
	dw $0023, $0020, $0170  ; AERODACTYL
	dw $0005, $0055, $0081  ; SNORLAX
	dw $0009, $0080, $00C0  ; ARTICUNO
	dw $0018, $00FF, $0100  ; ZAPDOS
	dw $0009, $00F8, $00C0  ; MOLTRES
	dw $000F, $0060, $00C0  ; DRATINI
	dw $000F, $0040, $0100  ; DRAGONAIR
	dw $000F, $003C, $0140  ; DRAGONITE
	dw $001E, $0099, $017F  ; MEWTWO
	dw $001E, $00EE, $017F  ; MEW
	dw $001E, $00EE, $017F  ; CHIKORITA
	dw $001E, $00EE, $017F  ; BAYLEEF
	dw $001E, $00EE, $017F  ; MEGANIUM
	dw $001E, $00EE, $017F  ; CYNDAQUIL
	dw $001E, $00EE, $017F  ; QUILAVA
	dw $001E, $00EE, $017F  ; TYPHLOSION
	dw $001E, $00EE, $017F  ; TOTODILE
	dw $001E, $00EE, $017F  ; CROCONAW
	dw $001E, $00EE, $017F  ; FERALIGATR
	dw $001E, $00EE, $017F  ; SENTRET
	dw $001E, $00EE, $017F  ; FURRET
	dw $001E, $00EE, $017F  ; HOOTHOOT
	dw $001E, $00EE, $017F  ; NOCTOWL
	dw $001E, $00EE, $017F  ; LEDYBA
	dw $001E, $00EE, $017F  ; LEDIAN
	dw $001E, $00EE, $017F  ; SPINARAK
	dw $001E, $00EE, $017F  ; ARIADOS
	dw $001E, $00EE, $017F  ; CROBAT
	dw $001E, $00EE, $017F  ; CHINCHOU
	dw $001E, $00EE, $017F  ; LANTURN
	dw $001E, $00EE, $017F  ; PICHU
	dw $001E, $00EE, $017F  ; CLEFFA
	dw $001E, $00EE, $017F  ; IGGLYBUFF
	dw $001E, $00EE, $017F  ; TOGEPI
	dw $001E, $00EE, $017F  ; TOGETIC
	dw $001E, $00EE, $017F  ; NATU
	dw $001E, $00EE, $017F  ; XATU
	dw $001E, $00EE, $017F  ; MAREEP
	dw $001E, $00EE, $017F  ; FLAAFFY
	dw $001E, $00EE, $017F  ; AMPHAROS
	dw $001E, $00EE, $017F  ; BELLOSSOM
	dw $001E, $00EE, $017F  ; MARILL
	dw $001E, $00EE, $017F  ; AZUMARILL
	dw $001E, $00EE, $017F  ; SUDOWOODO
	dw $001E, $00EE, $017F  ; POLITOED
	dw $001E, $00EE, $017F  ; HOPPIP
	dw $001E, $00EE, $017F  ; SKIPLOOM
	dw $001E, $00EE, $017F  ; JUMPLUFF
	dw $001E, $00EE, $017F  ; AIPOM
	dw $001E, $00EE, $017F  ; SUNKERN
	dw $001E, $00EE, $017F  ; SUNFLORA
	dw $001E, $00EE, $017F  ; YANMA
	dw $001E, $00EE, $017F  ; WOOPER
	dw $001E, $00EE, $017F  ; QUAGSIRE
	dw $001E, $00EE, $017F  ; ESPEON
	dw $001E, $00EE, $017F  ; UMBREON
	dw $001E, $00EE, $017F  ; MURKROW
	dw $001E, $00EE, $017F  ; SLOWKING
	dw $001E, $00EE, $017F  ; MISDREAVUS
	dw $001E, $00EE, $017F  ; UNOWN
	dw $001E, $00EE, $017F  ; WOBBUFFET
	dw $001E, $00EE, $017F  ; GIRAFARIG
	dw $001E, $00EE, $017F  ; PINECO
	dw $001E, $00EE, $017F  ; FORRETRESS
	dw $001E, $00EE, $017F  ; DUNSPARCE
	dw $001E, $00EE, $017F  ; GLIGAR
	dw $001E, $00EE, $017F  ; STEELIX
	dw $001E, $00EE, $017F  ; SNUBBULL
	dw $001E, $00EE, $017F  ; GRANBULL
	dw $001E, $00EE, $017F  ; QWILFISH
	dw $001E, $00EE, $017F  ; SCIZOR
	dw $001E, $00EE, $017F  ; SHUCKLE
	dw $001E, $00EE, $017F  ; HERACROSS
	dw $001E, $00EE, $017F  ; SNEASEL
	dw $001E, $00EE, $017F  ; TEDDIURSA
	dw $001E, $00EE, $017F  ; URSARING
	dw $001E, $00EE, $017F  ; SLUGMA
	dw $001E, $00EE, $017F  ; MAGCARGO
	dw $001E, $00EE, $017F  ; SWINUB
	dw $001E, $00EE, $017F  ; PILOSWINE
	dw $001E, $00EE, $017F  ; CORSOLA
	dw $001E, $00EE, $017F  ; REMORAID
	dw $001E, $00EE, $017F  ; OCTILLERY
	dw $001E, $00EE, $017F  ; DELIBIRD
	dw $001E, $00EE, $017F  ; MANTINE
	dw $001E, $00EE, $017F  ; SKARMORY
	dw $001E, $00EE, $017F  ; HOUNDOUR
	dw $001E, $00EE, $017F  ; HOUNDOOM
	dw $001E, $00EE, $017F  ; KINGDRA
	dw $001E, $00EE, $017F  ; PHANPY
	dw $001E, $00EE, $017F  ; DONPHAN
	dw $001E, $00EE, $017F  ; PORYGON2
	dw $001E, $00EE, $017F  ; STANTLER
	dw $001E, $00EE, $017F  ; SMEARGLE
	dw $001E, $00EE, $017F  ; TYROGUE
	dw $001E, $00EE, $017F  ; HITMONTOP
	dw $001E, $00EE, $017F  ; SMOOCHUM
	dw $001E, $00EE, $017F  ; ELEKID
	dw $001E, $00EE, $017F  ; MAGBY
	dw $001E, $00EE, $017F  ; MILTANK
	dw $001E, $00EE, $017F  ; BLISSEY
	dw $001E, $00EE, $017F  ; RAIKOU
	dw $001E, $00EE, $017F  ; ENTEI
	dw $001E, $00EE, $017F  ; SUICUNE
	dw $001E, $00EE, $017F  ; LARVITAR
	dw $001E, $00EE, $017F  ; PUPITAR
	dw $001E, $00EE, $017F  ; TYRANITAR
	dw $001E, $00EE, $017F  ; LUGIA
	dw $001E, $00EE, $017F  ; HO_OH
	dw $001E, $00EE, $017F  ; CELEBI
	dw $001E, $00EE, $017F  ; TREECKO
	dw $001E, $00EE, $017F  ; GROVYLE
	dw $001E, $00EE, $017F  ; SCEPTILE
	dw $001E, $00EE, $017F  ; TORCHIC
	dw $001E, $00EE, $017F  ; COMBUSKEN
	dw $001E, $00EE, $017F  ; BLAZIKEN
	dw $001E, $00EE, $017F  ; MUDKIP
	dw $001E, $00EE, $017F  ; MARSHTOMP
	dw $001E, $00EE, $017F  ; SWAMPERT
	dw $001E, $00EE, $017F  ; POOCHYENA
	dw $001E, $00EE, $017F  ; MIGHTYENA
	dw $001E, $00EE, $017F  ; ZIGZAGOON
	dw $001E, $00EE, $017F  ; LINOONE
	dw $001E, $00EE, $017F  ; WURMPLE
	dw $001E, $00EE, $017F  ; SILCOON
	dw $001E, $00EE, $017F  ; BEAUTIFLY
	dw $001E, $00EE, $017F  ; CASCOON
	dw $001E, $00EE, $017F  ; DUSTOX
	dw $001E, $00EE, $017F  ; LOTAD
	dw $001E, $00EE, $017F  ; LOMBRE
	dw $001E, $00EE, $017F  ; LUDICOLO
	dw $001E, $00EE, $017F  ; SEEDOT
	dw $001E, $00EE, $017F  ; NUZLEAF
	dw $001E, $00EE, $017F  ; SHIFTRY
	dw $001E, $00EE, $017F  ; TAILLOW
	dw $001E, $00EE, $017F  ; SWELLOW
	dw $001E, $00EE, $017F  ; WINGULL
	dw $001E, $00EE, $017F  ; PELIPPER
	dw $001E, $00EE, $017F  ; RALTS
	dw $001E, $00EE, $017F  ; KIRLIA
	dw $001E, $00EE, $017F  ; GARDEVOIR
	dw $001E, $00EE, $017F  ; SURSKIT
	dw $001E, $00EE, $017F  ; MASQUERAIN
	dw $001E, $00EE, $017F  ; SHROOMISH
	dw $001E, $00EE, $017F  ; BRELOOM
	dw $001E, $00EE, $017F  ; SLAKOTH
	dw $001E, $00EE, $017F  ; VIGOROTH
	dw $001E, $00EE, $017F  ; SLAKING
	dw $001E, $00EE, $017F  ; NINCADA
	dw $001E, $00EE, $017F  ; NINJASK
	dw $001E, $00EE, $017F  ; SHEDINJA
	dw $001E, $00EE, $017F  ; WHISMUR
	dw $001E, $00EE, $017F  ; LOUDRED
	dw $001E, $00EE, $017F  ; EXPLOUD
	dw $001E, $00EE, $017F  ; MAKUHITA
	dw $001E, $00EE, $017F  ; HARIYAMA
	dw $001E, $00EE, $017F  ; AZURILL
	dw $001E, $00EE, $017F  ; NOSEPASS
	dw $001E, $00EE, $017F  ; SKITTY
	dw $001E, $00EE, $017F  ; DELCATTY
	dw $001E, $00EE, $017F  ; SABLEYE
	dw $001E, $00EE, $017F  ; MAWILE
	dw $001E, $00EE, $017F  ; ARON
	dw $001E, $00EE, $017F  ; LAIRON
	dw $001E, $00EE, $017F  ; AGGRON
	dw $001E, $00EE, $017F  ; MEDITITE
	dw $001E, $00EE, $017F  ; MEDICHAM
	dw $001E, $00EE, $017F  ; ELECTRIKE
	dw $001E, $00EE, $017F  ; MANECTRIC
	dw $001E, $00EE, $017F  ; PLUSLE
	dw $001E, $00EE, $017F  ; MINUN
	dw $001E, $00EE, $017F  ; VOLBEAT
	dw $001E, $00EE, $017F  ; ILLUMISE
	dw $001E, $00EE, $017F  ; ROSELIA
	dw $001E, $00EE, $017F  ; GULPIN
	dw $001E, $00EE, $017F  ; SWALOT
	dw $001E, $00EE, $017F  ; CARVANHA
	dw $001E, $00EE, $017F  ; SHARPEDO
	dw $001E, $00EE, $017F  ; WAILMER
	dw $001E, $00EE, $017F  ; WAILORD
	dw $001E, $00EE, $017F  ; NUMEL
	dw $001E, $00EE, $017F  ; CAMERUPT
	dw $001E, $00EE, $017F  ; TORKOAL
	dw $001E, $00EE, $017F  ; SPOINK
	dw $001E, $00EE, $017F  ; GRUMPIG
	dw $001E, $00EE, $017F  ; SPINDA
	dw $001E, $00EE, $017F  ; TRAPINCH
	dw $001E, $00EE, $017F  ; VIBRAVA
	dw $001E, $00EE, $017F  ; FLYGON
	dw $001E, $00EE, $017F  ; CACNEA
	dw $001E, $00EE, $017F  ; CACTURNE
	dw $001E, $00EE, $017F  ; SWABLU
	dw $001E, $00EE, $017F  ; ALTARIA
	dw $001E, $00EE, $017F  ; ZANGOOSE
	dw $001E, $00EE, $017F  ; SEVIPER
	dw $001E, $00EE, $017F  ; LUNATONE
	dw $001E, $00EE, $017F  ; SOLROCK
	dw $001E, $00EE, $017F  ; BARBOACH
	dw $001E, $00EE, $017F  ; WHISCASH
	dw $001E, $00EE, $017F  ; CORPHISH
	dw $001E, $00EE, $017F  ; CRAWDAUNT
	dw $001E, $00EE, $017F  ; BALTOY
	dw $001E, $00EE, $017F  ; CLAYDOL
	dw $001E, $00EE, $017F  ; LILEEP
	dw $001E, $00EE, $017F  ; CRADILY
	dw $001E, $00EE, $017F  ; ANORITH
	dw $001E, $00EE, $017F  ; ARMALDO
	dw $001E, $00EE, $017F  ; FEEBAS
	dw $001E, $00EE, $017F  ; MILOTIC
	dw $001E, $00EE, $017F  ; CASTFORM
	dw $001E, $00EE, $017F  ; KECLEON
	dw $001E, $00EE, $017F  ; SHUPPET
	dw $001E, $00EE, $017F  ; BANETTE
	dw $001E, $00EE, $017F  ; DUSKULL
	dw $001E, $00EE, $017F  ; DUSCLOPS
	dw $001E, $00EE, $017F  ; TROPIUS
	dw $001E, $00EE, $017F  ; CHIMECHO
	dw $001E, $00EE, $017F  ; ABSOL
	dw $001E, $00EE, $017F  ; WYNAUT
	dw $001E, $00EE, $017F  ; SNORUNT
	dw $001E, $00EE, $017F  ; GLALIE
	dw $001E, $00EE, $017F  ; SPHEAL
	dw $001E, $00EE, $017F  ; SEALEO
	dw $001E, $00EE, $017F  ; WALREIN
	dw $001E, $00EE, $017F  ; CLAMPERL
	dw $001E, $00EE, $017F  ; HUNTAIL
	dw $001E, $00EE, $017F  ; GOREBYSS
	dw $001E, $00EE, $017F  ; RELICANTH
	dw $001E, $00EE, $017F  ; LUVDISC
	dw $001E, $00EE, $017F  ; BAGON
	dw $001E, $00EE, $017F  ; SHELGON
	dw $001E, $00EE, $017F  ; SALAMENCE
	dw $001E, $00EE, $017F  ; BELDUM
	dw $001E, $00EE, $017F  ; METANG
	dw $001E, $00EE, $017F  ; METAGROSS
	dw $001E, $00EE, $017F  ; REGIROCK
	dw $001E, $00EE, $017F  ; REGICE
	dw $001E, $00EE, $017F  ; REGISTEEL
	dw $001E, $00EE, $017F  ; LATIAS
	dw $001E, $00EE, $017F  ; LATIOS
	dw $001E, $00EE, $017F  ; KYOGRE
	dw $001E, $00EE, $017F  ; GROUDON
	dw $001E, $00EE, $017F  ; RAYQUAZA
	dw $001E, $00EE, $017F  ; JIRACHI
	dw $001E, $00EE, $017F  ; DEOXYS
