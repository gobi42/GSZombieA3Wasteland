//	@file Version: 1.0
//	@file Name: config.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:13
//	@file Description: Main config.

// For SERVER CONFIG, values are in server\init.sqf

// Towns and cities array
// Marker Name, Diameter, City Name
cityList = compileFinal str
[
	["Town_1", 200, "Novy Sobor"],
	["Town_2", 150, "Balota"],
	["Town_3", 100, "Sosnovka"],
	["Town_4", 200, "Pogorevka"],
	["Town_5", 200, "Vybor"],
	["Town_6", 300, "Krasnostav"],
	["Town_7", 250, "Airfield"],
	["Town_8", 350, "Grishino"],
	["Town_9", 250, "Pustoshka"],
	["Town_10", 200, "Zelenogorsk"],
	["Town_11", 100, "Dubrovka"],
	["Town_12", 240, "Stary Sobor"],
	["Town_13", 150, "Khelm"],
	["Town_14", 250, "Berezino"],  
	["Town_15", 100, "Gvozdno"],
	["Town_16", 175, "Elecktrozavodsk"],
	["Town_17", 175, "Pavlovo"],
	["Town_18", 100, "Shakhovka"],
	["Town_19", 250, "Polana"],
	["Town_20", 250, "Dolina"],
	["Town_21", 200, "Komarovo"],
	["Town_22", 200, "Kamenka"],
	["Town_23", 100, "Bor"],
	["Town_24", 200, "Kozlovka"],
	["Town_25", 200, "Rogovo"],
	["Town_26", 150, "Kabanino"],
	["Town_27", 150, "Vyshnoye"],
	["Town_28", 200, "Nadezhdino"],
	["Town_29", 400, "Chernogorsk"],
	["Town_30", 200, "Mogilevka"],
	["Town_31", 150, "Petrovka"],
	["Town_32", 250, "Gorka"],
	["Town_33", 200, "Guglovo"],
	["Town_34", 200, "Staroye"],
	["Town_35", 200, "Kamyshovo"],
	["Town_36", 200, "Tulga"],
	["Town_37", 200, "Msta"],
	["Town_38", 250, "Solnichniy"],
	["Town_39", 200, "Orlovets"],
	["Town_40", 200, "Nizhnoye"],
	["Town_41", 200, "Lopatino"],
	["Town_42", 250, "NE Airstrip"]
];

/*
militarylist = compileFinal str
[
	["milSpawn_1"],
	["milSpawn_2"],
	["milSpawn_3"]
];
*/

config_items_jerrycans_max = compileFinal "1";
config_items_syphon_hose_max = compileFinal "1";

config_refuel_amount_default = compileFinal "0.25";
config_refuel_amounts = compileFinal str
[
	["Quadbike_01_base_F", 0.50],
	["Tank", 0.10],
	["Air", 0.10]
];

// NOTE: Player saving and money settings moved to external config (A3Wasteland_settings\main_config.sqf), default values are set in server\default_config.sqf

// Is player saving enabled?
// config_player_saving_enabled = compileFinal "0";

// How much do players spawn with?
// config_initial_spawn_money = compileFinal "100";

// Territory system definitions. See territory/README.md for more details.
//
// Format is:
// 1 - Territory marker name. Must begin with 'TERRITORY_'
// 2 - Descriptive name
// 3 - Monetary value
// 4 - Territory category, currently unused. See territory/README.md for details.
config_territory_markers = compileFinal str
[
	["TERRITORY_STARY_SOBOR", "Stary Sobor", 200, "TOWN"],
	["TERRITORY_NOVY_SOBOR", "Novy Sobor", 200, "TOWN"],
	["TERRITORY_KABANINO", "Kabanino", 100, "TOWN"],
	["TERRITORY_AIRFIELD", "Airfield", 500, "AIRFIELD"],
	["TERRITORY_LOPATINO", "Lopatino", 100, "TOWN"],
	["TERRITORY_VYBOR", "Vybor", 100, "TOWN"],
	["TERRITORY_PUSTOSHKA", "Pustoshka", 200, "TOWN"],
	["TERRITORY_SOSNOVKA", "Sosnovka", 200, "TOWN"],
	["TERRITORY_ZELENOGORSK", "Zelenogorsk", 200, "TOWN"],
	["TERRITORY_PAVLOVO", "Pavlovo", 200, "TOWN"],
	["TERRITORY_KAMENKA", "Kamenka", 200, "TOWN"],
	["TERRITORY_KOMAROVO", "Komarovo", 200, "TOWN"],
	["TERRITORY_BOR", "BOR", 100, "TOWN"],
	["TERRITORY_KOZLOVKA", "Kozlovka", 200, "TOWN"],
	["TERRITORY_BALOTA", "Balota", 200, "TOWN"],
	["TERRITORY_POGOREVKA", "Pogorevka", 200, "TOWN"],
	["TERRITORY_ROGOVO", "Rogovo", 100, "TOWN"],
	["TERRITORY_GRISHINO", "Grishino", 200, "TOWN"],
	["TERRITORY_VYSHNOYE", "Vyshnoye", 200, "TOWN"],
	["TERRITORY_MOGILEVKA", "Mogilevka", 200, "TOWN"],
	["TERRITORY_PETROVKA", "Petrovka", 200, "TOWN"],
	["TERRITORY_GVOZDNO", "Gvozdno", 200, "TOWN"],
	["TERRITORY_DUBROVKA", "Dubrovka", 200, "TOWN"],
	["TERRITORY_GORKA", "Gorka", 200, "TOWN"],
	["TERRITORY_GUGLOVO", "Guglovo", 200, "TOWN"],
	["TERRITORY_SHAKHOVKA", "Shakhovka", 200, "TOWN"],
	["TERRITORY_STAROYE", "Staroye", 200, "TOWN"],
	["TERRITORY_ELEKTROZAVODSK", "Elektrozavodsk", 200, "TOWN"],
	["TERRITORY_CHERNOGORSK", "Chernogorsk", 200, "TOWN"],
	["TERRITORY_KAMYSHOVO", "Kamyshovo", 200, "TOWN"],
	["TERRITORY_TULGA", "Tulga", 200, "TOWN"],
	["TERRITORY_MSTA", "Msta", 200, "TOWN"],
	["TERRITORY_DOLINA", "Dolina", 200, "TOWN"],
	["TERRITORY_SOLNICHNIY", "Solnichniy", 200, "TOWN"],
	["TERRITORY_FACTORY", "Factory", 200, "TOWN"],
	["TERRITORY_ORLOVETS", "Orlovets", 200, "TOWN"],
	["TERRITORY_POLANA", "Polana", 200, "TOWN"],
	["TERRITORY_NIZHNOYE", "Nizhnoye", 200, "TOWN"],
	["TERRITORY_BEREZINO", "Berezino", 200, "TOWN"],
	["TERRITORY_KHELM", "Khelm", 200, "TOWN"],
	["TERRITORY_EAST_MARINA", "East Marina", 200, "TOWN"],
	["TERRITORY_KRASNOSTAV", "Krasnostav", 200, "TOWN"],
	["TERRITORY_NEAIRSTRIP", "NE Airstrip", 500, "AIRFIELD"]
];

