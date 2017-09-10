BallSavedText:
	scrolling_text_normal 5, 20, 0, 16
	db "BALL SAVED @"

ShootAgainText:
	scrolling_text_normal 4, 20, 0, 16
	db "SHOOT AGAIN @"

EndOfBallBonusText:
	scrolling_text_normal 1, 20, 0, 19
	db "END OF BALL BONUS @"

FieldMultiplierText:
	scrolling_text_normal 0, 20, 0, 20
	db "FIELD MULTIPLIER x0 @"

FieldMultiplierSpecialBonusText:
	scrolling_text_nopause 7, 51
	db "FIELD MULTIPLIER SPECIAL BONUS @"

DigitsText1to8:
	scrolling_text 7, 51, 6, 20, 2, 15
	db "12345678 @"

BonusMultiplierText:
	scrolling_text_normal 0, 20, 0, 21
	db "BONUS MULTIPLIER x0  @"

ExtraBallText:
	scrolling_text_normal 5, 20, 0, 16
	db "EXTRA BALL @"

ExtraBallSpecialBonusText:
	scrolling_text_nopause 7, 45
	db "EXTRA BALL SPECIAL BONUS @"

DigitsText1to9:
	scrolling_text 7, 45, 5, 20, 2, 15
	db "123456789 @"

LetsGetPokemonText:
	scrolling_text_normal 1, 20, 0, 19
	db "LET`S GET POKeMON @"

PokemonRanAwayText:
	scrolling_text_normal 2, 20, 0, 19
	db "POKeMON RAN AWAY @"

PokemonCaughtSpecialBonusText:
	scrolling_text_nopause 7, 49
	db "POKeMON CAUGHT SPECIAL BONUS @"

OneBillionText:
	scrolling_text 7, 46, 5, 20, 2, 19
	db "1,000,000,000 @"

HitText:
	stationary_text 4, 0, 64
	db "HIT @"

Data_2a2a:
	stationary_text 8, 1, 64

	db $00, $00 ; unused

FlippedText:
	stationary_text 2, 0, 64
	db "FLIPPED @"

CatchModeTileFlippedScoreStationaryTextHeader:
	stationary_text 10, 1, 64

	db $00, $00 ; unused

JackpotText:
	stationary_text 2, 0, 180
	db "JACKPOT @"

CatchModeJackpotScoreStationaryTextHeader:
	stationary_text 10, 1, 180

	db $00, $00 ; unused

YouGotAText:
	scrolling_text_nopause 5, 30
	db "YOU GOT A @"

YouGotAnText:
	scrolling_text_nopause 5, 31
	db "YOU GOT AN @"

Data_2a79:
	scrolling_text 5, 30, 0, 20, 2, 17
	db "                 @"

Data_2a91:
	scrolling_text 5, 31, 0, 20, 2, 17
	db "                 @"

StartTrainingText:
	scrolling_text_normal 3, 20, 0, 18
	db "START TRAINING @"

FindItemsText:
	scrolling_text_normal 5, 20, 0, 16
	db "FIND ITEMS @"

StartBreedingText:
	db $05, $54, $43, $14, $00, $37
	db "START BREEDING @"

EvolutionFailedText:
	scrolling_text_normal 2, 20, 0, 19
	db "EVOLUTION FAILED @"

BreedingFailedText:
	db $05, $54, $42, $14, $00, $39
	db "BREEDING FAILED @"

ItEvolvedIntoAText:
	scrolling_text_nopause 5, 38
	db "IT EVOLVED INTO A @"

EggHatchedIntoAText:
	db $05, $54, $00, $00, $00, $26
	db "IT HATCHED INTO A @"

ItEvolvedIntoAnText:
	scrolling_text_nopause 5, 39
	db "IT EVOLVED INTO AN @"

EggHatchedIntoAnText:
	db $05, $54, $00, $00, $00, $27
	db "IT HATCHED INTO AN @"

Data_2b1c:
	scrolling_text 5, 38, 0, 20, 2, 17
	db "                 @"

Data_2b34:
	scrolling_text 5, 39, 0, 20, 2, 17
	db "                 @"

EvolutionSpecialBonusText:
	scrolling_text_nopause 7, 44
	db "EVOLUTION SPECIAL BONUS @"

Data_2b6b:
	scrolling_text 7, 44, 6, 20, 2, 15
	db "12345678 @"

PokemonIsTiredText:
	scrolling_text_normal 2, 20, 0, 19
	db "POKeMON IS TIRED @"

ItemNotFoundText:
	scrolling_text_normal 3, 20, 0, 18
	db "ITEM NOT FOUND @"

KeepWalkingText:
	db $05, $54, $43, $14, $00, $35
	db "KEEP WALKING @"

PokemonRecoveredText:
	scrolling_text_normal 1, 20, 0, 19
	db "POKeMON RECOVERED @"

TryNextPlaceText:
	scrolling_text_normal 3, 20, 0, 18
	db "TRY NEXT PLACE @"

YeahYouGotItText:
	scrolling_text_normal 2, 20, 0, 19
	db "YEAH! YOU GOT IT @"

EvolutionTypeGetTextPointers:
	dw GetThunderStoneText
	dw GetMoonStoneText
	dw GetFireStoneText
	dw GetLeafStoneText
	dw GetWaterStoneText
	dw GetLinkCableText
	dw GetExperienceText
	dw TakeStepsText

GetExperienceText:
	scrolling_text_normal 3, 20, 0, 18
	db "GET EXPERIENCE @"

GetFireStoneText:
	scrolling_text_normal 2, 20, 0, 19
	db "GET A FIRE STONE @"

GetWaterStoneText:
	scrolling_text_normal 1, 20, 0, 19
	db "GET A WATER STONE @"

GetThunderStoneText:
	scrolling_text_normal 0, 20, 0, 20
	db "GET A THUNDER STONE @"

GetLeafStoneText:
	scrolling_text_normal 2, 20, 0, 19
	db "GET A LEAF STONE @"

GetMoonStoneText:
	scrolling_text_normal 2, 20, 0, 19
	db "GET A MOON STONE @"

GetLinkCableText:
	scrolling_text_normal 2, 20, 0, 19
	db "GET A LINK CABLE @"

TakeStepsText:
	db $05, $54, $42, $14, $00, $38
	db "TAKE MANY STEPS @"

MapMoveFailedText:
	scrolling_text_normal 2, 20, 0, 18
	db "MAP MOVE FAILED @"

ArrivedAtMapText:
	scrolling_text_nopause 5, 31
	db "ARRIVED AT @"

StartFromMapText:
	scrolling_text_nopause 5, 31
	db "START FROM @"

GoToDiglettStageText:
	scrolling_text_normal 0, 20, 0, 20
	db "GO TO DIGLETT STAGE @"

GoToGengarStageText:
	scrolling_text_normal 1, 20, 0, 20
	db "GO TO GENGAR STAGE @"

GoToMewtwoStageText:
	scrolling_text_normal 1, 20, 0, 20
	db "GO TO MEWTWO STAGE @"

GoToMeowthStageText:
	scrolling_text_normal 1, 20, 0, 20
	db "GO TO MEOWTH STAGE @"

GoToSeelStageText:
	scrolling_text_normal 2, 20, 0, 19
	db "GO TO SEEL STAGE @"

EndGengarStageText:
	scrolling_text_normal 2, 20, 0, 19
	db "END GENGAR STAGE @"

EndMewtwoStageText:
	scrolling_text_normal 2, 20, 0, 19
	db "END MEWTWO STAGE @"

EndDiglettStageText:
	scrolling_text_normal 1, 20, 0, 19
	db "END DIGLETT STAGE @"

EndMeowthStageText:
	scrolling_text_normal 2, 20, 0, 19
	db "END MEOWTH STAGE @"

EndSeelStageText:
	scrolling_text_normal 3, 20, 0, 18
	db "END SEEL STAGE @"

GengarStageClearedText:
	scrolling_text_normal 0, 20, 0, 21
	db "GENGAR STAGE CLEARED @"

MewtwoStageClearedText:
	scrolling_text_normal 0, 20, 0, 21
	db "MEWTWO STAGE CLEARED @"

DiglettStageClearedText:
	scrolling_text_normal -1, 20, 0, 21
	db "DIGLETT STAGE CLEARED @"

MeowthStageClearedText:
	scrolling_text_normal 0, 20, 0, 21
	db "MEOWTH STAGE CLEARED @"

SeelStageClearedText:
	scrolling_text_normal 1, 20, 0, 20
	db "SEEL STAGE CLEARED @"

NumPokemonCaughtText:
	db "  0 POKeMON CAUGHT@"

NumPokemonEvolvedText:
	db "  0 POKeMON EVOLVED@"

BellsproutCounterText:
	db "  0 BELLSPROUT@"

DugtrioCounterText:
	db "  0 DUGTRIO@"

CaveShotCounterText:
	db "  0 CAVE SHOTS@"

SpinnerTurnsCounterText:
	db "  0 SPINNER TURNS@"

BonusPointsText:
	db " BONUS@"

SubtotalPointsText:
	db " SUBTOTAL@"

MultiplierPointsText:
	db " MULTIPLIER@"

TotalPointsText:
	db " TOTAL@"

ScoreText:
	db " SCORE@"

GameOverText:
	db "     GAME  OVER     @"

PsyduckCounterText:
	db "  0 PSYDUCK@"

PoliwagCounterText:
	db "  0 POLIWAG@"

CloysterCounterText:
	db "  0 CLOYSTER@"

SlowpokeCounterText:
	db "  0 SLOWPOKE@"

ReleasedBeastsText:
	db $05, $54, $42, $14, $00, $38
	db "RELEASED BEASTS @"
