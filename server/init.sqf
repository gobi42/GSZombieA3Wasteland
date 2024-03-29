//	@file Version: 1.1
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Description: The server init.
//	@file Args:

if (!isServer) exitWith {};

externalConfigFolder = "A3Wasteland_settings";

vChecksum = compileFinal format ["'%1'", call generateKey];

//Execute Server Side Scripts.
call compile preprocessFileLineNumbers "server\antihack\setup.sqf";
[] execVM "server\admins.sqf";
[] execVM "server\functions\serverVars.sqf";
_serverCompileHandle = [] execVM "server\functions\serverCompile.sqf";
[] execVM "server\functions\broadcaster.sqf";
[] execVM "server\functions\relations.sqf";
[] execVM (externalConfigFolder + "\init.sqf");

waitUntil {scriptDone _serverCompileHandle};

// Broadcast server rules
if (loadFile (externalConfigFolder + "\serverRules.sqf") != "") then
{
	[[[call compile preprocessFileLineNumbers (externalConfigFolder + "\serverRules.sqf")], "client\functions\defineServerRules.sqf"], "BIS_fnc_execVM", true, true] call TPG_fnc_MP;
};

diag_log "WASTELAND SERVER - Server Compile Finished";

"requestCompensateNegativeScore" addPublicVariableEventHandler { (_this select 1) call removeNegativeScore };

// load default config
call compile preprocessFileLineNumbers "server\default_config.sqf";

// load external config
if (loadFile (externalConfigFolder + "\main_config.sqf") != "") then
{
    call compile preprocessFileLineNumbers (externalConfigFolder + "\main_config.sqf");
}
else
{
	diag_log format["[WARNING] A3W configuration file '%1\main_config.sqf' was not found. Using default settings!", externalConfigFolder];
	diag_log "[WARNING] For more information go to http://forums.a3wasteland.com/";
};

A3W_startingMoney = compileFinal str A3W_startingMoney;
A3W_showGunStoreStatus = compileFinal str A3W_showGunStoreStatus;
A3W_gunStoreIntruderWarning = compileFinal str A3W_gunStoreIntruderWarning;
A3W_playerSaving = compileFinal str A3W_playerSaving;
A3W_combatAbortDelay = compileFinal str A3W_combatAbortDelay;
A3W_unlimitedStamina = compileFinal str A3W_unlimitedStamina;
A3W_bleedingTime = compileFinal str A3W_bleedingTime;
A3W_teamPlayersMap = compileFinal str A3W_teamPlayersMap;
A3W_remoteBombStoreRadius = compileFinal str A3W_remoteBombStoreRadius;

// Broadcast config variables
publicVariable "A3W_startingMoney";
publicVariable "A3W_showGunStoreStatus";
publicVariable "A3W_gunStoreIntruderWarning";
publicVariable "A3W_playerSaving";
publicVariable "A3W_combatAbortDelay";
publicVariable "A3W_unlimitedStamina";
publicVariable "A3W_bleedingTime";
publicVariable "A3W_teamPlayersMap";
publicVariable "A3W_remoteBombStoreRadius";

_playerSavingOn = ["A3W_playerSaving"] call isConfigOn;
_baseSavingOn = ["A3W_baseSaving"] call isConfigOn;
_boxSavingOn = ["A3W_boxSaving"] call isConfigOn;
_staticWeaponSavingOn = ["A3W_staticWeaponSaving"] call isConfigOn;
_warchestSavingOn = ["A3W_warchestSaving"] call isConfigOn;
_warchestMoneySavingOn = ["A3W_warchestMoneySaving"] call isConfigOn;
_beaconSavingOn = ["A3W_spawnBeaconSaving"] call isConfigOn;

_serverSavingOn = (_baseSavingOn || _boxSavingOn || _staticWeaponSavingOn || {_warchestSavingOn} || {_warchestMoneySavingOn} || {_beaconSavingOn});

_setupPlayerDB = [] spawn {}; // blank script to feed scriptDone a non-nil value

// Do we need any persistence?
if (_playerSavingOn || _serverSavingOn) then
{
	// Our custom iniDB methods which fixes some issues with the current iniDB addon release
	call compile preProcessFileLineNumbers "persistence\fn_inidb_custom.sqf";
	
	_verIniDB = call iniDB_version;
	
	if (_verIniDB == "") then
	{
		diag_log "[INFO] ### ERROR ### A3W NOT running with iniDB!";
		diag_log "[INFO] ### ERROR ### Make sure iniDB.dll is in your Arma 3 folder, or otherwise that you have the @inidbi mod enabled!";
	}
	else
	{
		diag_log format ["[INFO] A3W running with iniDB v%1", _verIniDB];
	};

	// Have we got player persistence enabled?
	if (_playerSavingOn) then
	{
		_setupPlayerDB = execVM "persistence\players\s_setupPlayerDB.sqf";
	};

	// Have we got server persistence enabled?
	if (_serverSavingOn) then
	{
		execVM "persistence\world\oLoad.sqf";
	};
	
	{
		diag_log format ["[INFO] A3W %1 = %2", _x select 0, if (_x select 1) then { "ON" } else { "OFF" }];
	}
	forEach
	[
		["playerSaving", _playerSavingOn],
		["baseSaving", _baseSavingOn],
		["boxSaving", _boxSavingOn],
		["staticWeaponSaving", _staticWeaponSavingOn],
		["warchestSaving", _warchestSavingOn],
		["warchestMoneySaving", _warchestMoneySavingOn],
		["spawnBeaconSaving", _beaconSavingOn]
	];
};

call compile preprocessFileLineNumbers "server\functions\createTownMarkers.sqf";

_createTriggers = execVM "territory\server\createCaptureTriggers.sqf";

[_setupPlayerDB, _createTriggers] spawn
{
	waitUntil {sleep 0.1; {scriptDone _x} count _this == count _this};
	A3W_serverSetupComplete = compileFinal "true";
	publicVariable "A3W_serverSetupComplete";
};

if (!isNil "A3W_startHour" || !isNil "A3W_moonLight") then
{
	private ["_monthDay", "_startHour"];
	_monthDay = if (["A3W_moonLight"] call isConfigOn) then { 10 } else { 25 };
	_startHour = ["A3W_startHour", date select 2] call getPublicVar;
	setDate [2035, 6, _monthDay, _startHour, 0];
};

if (!isNil "A3W_timeMultiplier") then
{
	setTimeMultiplier (["A3W_timeMultiplier", 1] call getPublicVar);
};

if ((isNil "A3W_buildingLoot" && {["A3W_buildingLootWeapons"] call isConfigOn || {["A3W_buildingLootSupplies"] call isConfigOn}}) || {["A3W_buildingLoot"] call isConfigOn}) then 
{
	diag_log "[INFO] A3W loot spawning is ENABLED";
	execVM "addons\Lootspawner\Lootspawner.sqf";
};

[] execVM "server\functions\serverTimeSync.sqf";

if (["A3W_serverSpawning"] call isConfigOn) then
{
    diag_log "WASTELAND SERVER - Initializing Server Spawning";
	
	if (["A3W_heliSpawning"] call isConfigOn) then
	{
		_heliSpawn = [] execVM "server\functions\staticHeliSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _heliSpawn};
	};
	
	if (["A3W_vehicleSpawning"] call isConfigOn) then
	{
		_vehSpawn = [] execVM "server\functions\vehicleSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _vehSpawn};
	};
	
	if (["A3W_planeSpawning"] call isConfigOn) then
	{
		_planeSpawn = [] execVM "server\functions\planeSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _planeSpawn};
	};
	
	if (["A3W_boatSpawning"] call isConfigOn) then
	{
		_boatSpawn = [] execVM "server\functions\boatSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _boatSpawn};
	};
	
	if (["A3W_baseBuilding"] call isConfigOn) then
	{
		_objSpawn = [] execVM "server\functions\objectsSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _objSpawn};
	};
	
	if (["A3W_boxSpawning"] call isConfigOn) then
	{
		_boxSpawn = [] execVM "server\functions\boxSpawning.sqf";
		waitUntil {sleep 0.1; scriptDone _boxSpawn};
	};
};

["A3W_quit", "onPlayerDisconnected", { [_id, _uid, _name] spawn fn_onPlayerDisconnected }] call BIS_fnc_addStackedEventHandler;

if (count (["config_territory_markers", []] call getPublicVar) > 0) then
{
	diag_log "[INFO] A3W territory capturing is ENABLED";
	[] execVM "territory\server\monitorTerritories.sqf";
}
else
{
	diag_log "[INFO] A3W territory capturing is DISABLED";
};

//Execute Server Missions.
if (["A3W_serverMissions"] call isConfigOn) then
{
	diag_log "WASTELAND SERVER - Initializing Missions";
    [] execVM "server\missions\sideMissionController.sqf";
    sleep 5;
    [] execVM "server\missions\mainMissionController.sqf";
	sleep 5;
	[] execVM "server\missions\moneyMissionController.sqf";
};

// Start clean-up loop
[] execVM "server\WastelandServClean.sqf";
