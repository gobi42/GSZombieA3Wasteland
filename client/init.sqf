//@file Version: 1.1
//@file Name: init.sqf
//@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev, [KoS] Bewilderbeest
//@file Created: 20/11/2012 05:19
//@file Description: The client init.

if (isDedicated) exitWith {};

if (!isServer) then
{
	waitUntil {!isNil "A3W_network_compileFuncs"};
	
	_networkCompile = [] spawn A3W_network_compileFuncs;
	A3W_network_compileFuncs = nil;
	
	waitUntil {scriptDone _networkCompile};
};

waitUntil {!isNil "A3W_serverSetupComplete"};

[] execVM "client\functions\bannedNames.sqf";

showPlayerIcons = true;
mutexScriptInProgress = false;
respawnDialogActive = false;
groupManagmentActive = false;
pvar_PlayerTeamKiller = objNull;
doCancelAction = false;
currentMissionsMarkers = [];
currentRadarMarkers = [];

//Initialization Variables
playerCompiledScripts = false;
playerSetupComplete = false;

waitUntil {!isNull player};
waitUntil {time > 0.1};

removeAllWeapons player;
player switchMove "";

// initialize actions and inventory
"client\actions" call mf_init;
"client\inventory" call mf_init;
"client\items" call mf_init;

//Call client compile list.
call compile preprocessFileLineNumbers "client\functions\clientCompile.sqf";

//Stop people being civ's.
if !(playerSide in [BLUFOR,OPFOR,INDEPENDENT]) exitWith
{
	endMission "LOSER";
};

//Setup player events.
if (!isNil "client_initEH") then { player removeEventHandler ["Respawn", client_initEH] };
player addEventHandler ["Respawn", { _this spawn onRespawn }];
player addEventHandler ["Killed", { _this spawn onKilled }];

A3W_scriptThreads pushBack execVM "client\functions\evalManagedActions.sqf";

//Player setup
player call playerSetupStart;

// Deal with money here
_baseMoney = ["A3W_startingMoney", 100] call getPublicVar;
player setVariable ["cmoney", _baseMoney, true];

// Player saving - Load from iniDB
if (["A3W_playerSaving"] call isConfigOn) then
{
	call compile preprocessFileLineNumbers "persistence\players\c_setupPlayerDB.sqf";
	call fn_requestPlayerData;
	
	waitUntil {!isNil "playerData_loaded"};
	
	[] spawn
	{
		// Save player every 60s
		while {true} do
		{
			sleep 60;
			call fn_savePlayerData;
		};
	};
};

if (isNil "playerData_alive") then
{
	player call playerSetupGear;
};

player call playerSetupEnd;

diag_log format ["Player starting with $%1", player getVariable ["cmoney", 0]];

[] execVM "territory\client\hideDisabledTerritories.sqf";

// Territory system enabled?
if (count (["config_territory_markers", []] call getPublicVar) > 0) then
{
	territoryActivityHandler = "territory\client\territoryActivityHandler.sqf" call mf_compile;
	[] execVM "territory\client\setupCaptureTriggers.sqf";
};

//Setup player menu scroll action.
//[] execVM "client\clientEvents\onMouseWheel.sqf";

//Setup Key Handler
waitUntil {!isNull findDisplay 46};
(findDisplay 46) displayAddEventHandler ["KeyDown", onKeyPress];
//(findDisplay 46) displayAddEventHandler ["KeyUp", onKeyRelease];

call compile preprocessFileLineNumbers "client\functions\setupClientPVars.sqf";

//client Executes
A3W_scriptThreads pushBack execVM "client\systems\hud\playerHud.sqf";
[] execVM "client\functions\initSurvival.sqf";
[] spawn updateMissionsMarkers;
// [] call updateRadarMarkers;

[] spawn
{
	[] execVM "client\functions\createGunStoreMarkers.sqf";
	[] execVM "client\functions\createGeneralStoreMarkers.sqf";
	[] execVM "client\functions\createVehicleStoreMarkers.sqf";
};

[] spawn playerSpawn;

A3W_scriptThreads pushBack execVM "addons\fpsFix\vehicleManager.sqf";
A3W_scriptThreads pushBack execVM "addons\Lootspawner\LSclientScan.sqf";
[] execVM "client\functions\drawPlayerIcons.sqf";
[] execVM "addons\far_revive\FAR_revive_init.sqf";

if (["A3W_teamPlayersMap"] call isConfigOn) then
{
	[] execVM "client\functions\drawPlayerMarkers.sqf";
};

// update player's spawn beaoon
{
	if (_x getVariable ["ownerUID",""] == getPlayerUID player) then
	{
		_x setVariable ["ownerName", name player, true];
		_x setVariable ["side", playerSide, true];
	};
} forEach pvar_spawn_beacons;
