private ["_spawnmrk","_wp1"];


n1 = round((random 5) + 0.5);
if (n1 == 1) then
	{
		_spawnmrk = (_this select 0);
	};
if (n1 == 2) then
	{
		_spawnmrk = (_this select 1);
	};
if (n1 == 3) then
	{
		_spawnmrk = (_this select 2);
	};
if (n1 == 4) then
	{
		_spawnmrk = (_this select 3);
	};
if (n1 == 5) then
	{
		_spawnmrk = (_this select 4);
	};
Chkgrp14 = [getMarkerPos _spawnmrk, EAST, (configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry" >> "HAF_InfTeam")] call BIS_fnc_spawnGroup;
_wp1 = Chkgrp14 addwaypoint [getMarkerPos "wp11", 1000];
_wp1 setWaypointCombatMode "RED";
_wp1 setWaypointtype "SAD";