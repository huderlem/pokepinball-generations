MapWildMonsPointers:
	dw RedStageWildMonsPointers
	dw RedStageWildMonsPointers
	dw BlueStageWildMonsPointers
	dw BlueStageWildMonsPointers
	dw GoldStageWildMonsPointers
	dw GoldStageWildMonsPointers
	dw SilverStageWildMonsPointers
	dw SilverStageWildMonsPointers
	dw RubyStageWildMonsPointers
	dw RubyStageWildMonsPointers
	dw SapphireStageWildMonsPointers
	dw SapphireStageWildMonsPointers

RedStageWildMonsPointers:
	dbw PALLET_TOWN,       RedStagePalletTownWildMons
	dbw VIRIDIAN_FOREST,   RedStageViridianForestWildMons
	dbw PEWTER_CITY,       RedStagePewterCityWildMons
	dbw CERULEAN_CITY,     RedStageCeruleanCityWildMons
	dbw VERMILION_SEASIDE, RedStageVermilionSeasideWildMons
	dbw ROCK_MOUNTAIN,     RedStageRockMountainWildMons
	dbw LAVENDER_TOWN,     RedStageLavenderTownWildMons
	dbw CYCLING_ROAD,      RedStageCyclingRoadWildMons
	dbw SAFARI_ZONE,       RedStageSafariZoneWildMons
	dbw SEAFOAM_ISLANDS,   RedStageSeafoamIslandsWildMons
	dbw CINNABAR_ISLAND,   RedStageCinnabarIslandWildMons
	dbw INDIGO_PLATEAU,    RedStageIndigoPlateauWildMons
	db $FF ; terminator

BlueStageWildMonsPointers:
	dbw VIRIDIAN_CITY,     BlueStageViridianCityWildMons
	dbw VIRIDIAN_FOREST,   BlueStageViridianForestWildMons
	dbw MT_MOON,           BlueStageMtMoonWildMons
	dbw CERULEAN_CITY,     BlueStageCeruleanCityWildMons
	dbw VERMILION_STREETS, BlueStageVermilionStreetsWildMons
	dbw ROCK_MOUNTAIN,     BlueStageRockMountainWildMons
	dbw CELADON_CITY,      BlueStageCeladonCityWildMons
	dbw FUCHSIA_CITY,      BlueStageFuchsiaCityWildMons
	dbw SAFARI_ZONE,       BlueStageSafariZoneWildMons
	dbw SAFFRON_CITY,      BlueStageSaffronCityWildMons
	dbw CINNABAR_ISLAND,   BlueStageCinnabarIslandWildMons
	dbw INDIGO_PLATEAU,    BlueStageIndigoPlateauWildMons
	db $FF ; terminator

GoldStageWildMonsPointers:
	dbw NEW_BARK_TOWN,   GoldStageNewBarkTownMons
	dbw VIOLET_CITY,     GoldStageVioletCityWildMons
	dbw RUINS_OF_ALPH,   GoldStageRuinsOfAlphWildMons
	dbw LAKE_OF_RAGE,    GoldStageLakeOfRageWildMons
	dbw ECRUTEAK_CITY,   GoldStageEcruteakCityWildMons
	dbw ILEX_FOREST,     GoldStageIlexForestWildMons
	dbw GOLDENROD_CITY,  GoldStageGoldenrodCityWildMons
	dbw OLIVINE_CITY,    GoldStageOlivineCityWildMons
	dbw ICE_PATH,        GoldStageIcePathWildMons
	dbw DARK_CAVE,       GoldStageDarkCaveWildMons
	dbw BURNED_TOWER,    GoldStageBurnedTowerWildMons
	dbw TIN_TOWER,       GoldStageTinTowerWildMons
	dbw BLACKTHORN_CITY, GoldStageBlackthornCityWildMons
	dbw MT_SILVER,       GoldStageMtSilverWildMons
	db $FF ; terminator

SilverStageWildMonsPointers:
	dbw NEW_BARK_TOWN,   SilverStageNewBarkTownMons
	dbw VIOLET_CITY,     SilverStageVioletCityWildMons
	dbw DARK_CAVE,       SilverStageDarkCaveWildMons
	dbw MAHOGANY_TOWN,   SilverStageMahoganyTownWildMons
	dbw AZALEA_TOWN,     SilverStageAzaleaTownWildMons
	dbw ILEX_FOREST,     SilverStageIlexForestWildMons
	dbw NATIONAL_PARK,   SilverStageNationalParkWildMons
	dbw OLIVINE_CITY,    SilverStageOlivineCityWildMons
	dbw ICE_PATH,        SilverStageIcePathWildMons
	dbw MT_MORTAR,       SilverStageMtMortarWildMons
	dbw BURNED_TOWER,    SilverStageBurnedTowerWildMons
	dbw WHIRL_ISLANDS,   SilverStageWhirlIslandsWildMons
	dbw BLACKTHORN_CITY, SilverStageBlackthornCityWildMons
	dbw MT_SILVER,       SilverStageMtSilverWildMons
	db $FF ; terminator

RubyStageWildMonsPointers:
	dbw NEW_BARK_TOWN,   RubyStageNewBarkTownMons
	dbw VIOLET_CITY,     RubyStageVioletCityWildMons
	dbw RUINS_OF_ALPH,   RubyStageRuinsOfAlphWildMons
	dbw LAKE_OF_RAGE,    RubyStageLakeOfRageWildMons
	dbw ECRUTEAK_CITY,   RubyStageEcruteakCityWildMons
	dbw ILEX_FOREST,     RubyStageIlexForestWildMons
	dbw GOLDENROD_CITY,  RubyStageGoldenrodCityWildMons
	dbw OLIVINE_CITY,    RubyStageOlivineCityWildMons
	dbw ICE_PATH,        RubyStageIcePathWildMons
	dbw DARK_CAVE,       RubyStageDarkCaveWildMons
	dbw BURNED_TOWER,    RubyStageBurnedTowerWildMons
	dbw TIN_TOWER,       RubyStageTinTowerWildMons
	dbw BLACKTHORN_CITY, RubyStageBlackthornCityWildMons
	dbw MT_SILVER,       RubyStageMtSilverWildMons
	db $FF ; terminator

SapphireStageWildMonsPointers:
	dbw NEW_BARK_TOWN,   SapphireStageNewBarkTownMons
	dbw VIOLET_CITY,     SapphireStageVioletCityWildMons
	dbw DARK_CAVE,       SapphireStageDarkCaveWildMons
	dbw MAHOGANY_TOWN,   SapphireStageMahoganyTownWildMons
	dbw AZALEA_TOWN,     SapphireStageAzaleaTownWildMons
	dbw ILEX_FOREST,     SapphireStageIlexForestWildMons
	dbw NATIONAL_PARK,   SapphireStageNationalParkWildMons
	dbw OLIVINE_CITY,    SapphireStageOlivineCityWildMons
	dbw ICE_PATH,        SapphireStageIcePathWildMons
	dbw MT_MORTAR,       SapphireStageMtMortarWildMons
	dbw BURNED_TOWER,    SapphireStageBurnedTowerWildMons
	dbw WHIRL_ISLANDS,   SapphireStageWhirlIslandsWildMons
	dbw BLACKTHORN_CITY, SapphireStageBlackthornCityWildMons
	dbw MT_SILVER,       SapphireStageMtSilverWildMons
	db $FF ; terminator

INCLUDE "data/red_wild_mons.asm"
INCLUDE "data/blue_wild_mons.asm"
INCLUDE "data/gold_wild_mons.asm"
INCLUDE "data/silver_wild_mons.asm"
INCLUDE "data/ruby_wild_mons.asm"
INCLUDE "data/sapphire_wild_mons.asm"
