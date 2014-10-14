//	@file Version: 1.0
//	@file Name: loadGunStore.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:13
//	@file Args:

#include "dialog\gunstoreDefines.sqf";
disableSerialization;

private ["_gunshopDialog", "_Dialog", "_playerMoney", "_owner"];
_gunshopDialog = createDialog "gunshopd";

_Dialog = findDisplay gunshop_DIALOG;
_playerMoney = _Dialog displayCtrl gunshop_money;
_playerMoney ctrlSetText format["Cash: $%1", player getVariable "cmoney"];
if(!isNil "_this") then {_owner = _this select 0;};
if(!isNil "_owner") then {currentOwnerName = name _owner;};
if(!isNil "_owner") then {currentOwnerID = _owner;};

{
	disableSerialization;
	_dialog = findDisplay gunshop_DIALOG;
	while {!isNull _dialog} do
	{
		_escMenu = findDisplay 49;
		if (!isNull _escMenu) exitWith { _escMenu closeDisplay 0 }; // Force close Esc menu if open
		sleep 0.1;
	};
};