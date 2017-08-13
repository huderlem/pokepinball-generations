MapWildMonsPointers:
	dw RedStageWildMonsPointers
	dw RedStageWildMonsPointers
	dw BlueStageWildMonsPointers
	dw BlueStageWildMonsPointers
	dw GoldStageWildMonsPointers
	dw GoldStageWildMonsPointers
	dw SilverStageWildMonsPointers
	dw SilverStageWildMonsPointers

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

SilverStageWildMonsPointers:
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

INCLUDE "data/red_wild_mons.asm"
INCLUDE "data/blue_wild_mons.asm"
INCLUDE "data/gold_wild_mons.asm"
INCLUDE "data/silver_wild_mons.asm"
