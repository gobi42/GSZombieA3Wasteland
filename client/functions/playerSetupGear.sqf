//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove radio
//_player unlinkItem "ItemRadio";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
//_player linkItem "NVGoggles";

_player addBackpack "B_AssaultPack_rgr";

_player addMagazine "9Rnd_45ACP_Mag";
_player addWeapon "hgun_ACPC2_F";
_player addMagazine "9Rnd_45ACP_Mag";
_player addMagazine "9Rnd_45ACP_Mag";
_player addMagazine "9Rnd_45ACP_Mag";
_player addItem "FirstAidKit";
_player selectWeapon "hgun_ACPC2_F";

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
//_null = []execVM "custom\Player.sqf";
};

if (( getPlayerUID _player) in ["76561198079546085"]) then { 
/*// "Exported from Arsenal by gobi";

// "Remove existing items";
removeAllWeapons _player;
removeAllItems _player;
removeAllAssignedItems _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;

// "Add containers";
_player forceAddUniform "Urban_RS";
for "_i" from 1 to 2 do {_player addItemToUniform "FirstAidKit";};
//_player addItemToUniform "FirstAidKit";
_player addVest "V_PlateCarrier1_blk";
//for "_i" from 1 to 3 do {_player addItemToVest "16Rnd_9x21_Mag";};
//_player addItemToVest "Chemlight_green";
for "_i" from 1 to 6 do {_player addItemToVest "hlc_30rnd_556x45_EPR";};
for "_i" from 1 to 5 do {_player addItemToVest "hlc_30rnd_556x45_SOST";};
_player addBackpack "B_FieldPack_blk";
_player addItemToBackpack "ToolKit";
for "_i" from 1 to 4 do {_player addItemToBackpack "DemoCharge_Remote_Mag";};
_player addHeadgear "H_Cap_blk";
//_player addGoggles "G_Bandanna_shades";

// "Add weapons";
_player addWeapon "hlc_rifle_RU5562";
_player addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC";
_player addPrimaryWeaponItem "FHQ_acc_ANPEQ15_black";
_player addPrimaryWeaponItem "FHQ_optic_AC12136";

// "Add items";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemRadio";
_player linkItem "ItemGPS";
_player linkItem "Binocular";
_player linkItem "bandanna_shades_nvg";
// "Set identity";
//_player setFace "GreekHead_A3_01";
//_player setSpeaker "Male01ENG";
*/
// "Exported from Arsenal by gobi";

// "Remove existing items";
removeAllWeapons _player;
removeAllItems _player;
removeAllAssignedItems _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;

// "Add containers";
_player forceAddUniform "U_mas_usd_B_CombatUniform_mcam_vest1";
for "_i" from 1 to 4 do {_player addItemToUniform "FirstAidKit";};
_player addVest "V_mas_usr_PlateCarrierGL_rgr_g";
_player addItemToVest "acc_flashlight";
for "_i" from 1 to 10 do {_player addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_player addItemToVest "HandGrenade";};
_player addBackpack "B_Carryall_oucamo";
_player addItemToBackpack "ToolKit";
for "_i" from 1 to 4 do {_player addItemToBackpack "HandGrenade";};
for "_i" from 1 to 15 do {_player addItemToBackpack "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_player addItemToBackpack "DemoCharge_Remote_Mag";};
_player addHeadgear "H_Cap_blk";

// "Add weapons";
_player addWeapon "hlc_rifle_RU5562";
_player addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC";
_player addPrimaryWeaponItem "FHQ_optic_AC12136";
_player addWeapon "Binocular";

// "Add items";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemRadio";
_player linkItem "ItemGPS";
_player linkItem "Bandanna_shades_nvg";

// "Set identity";
//_player setFace "GreekHead_A3_01";
//_player setSpeaker "Male01ENG";
[_player,"MANW"] call bis_fnc_setUnitInsignia;

};
if (( getPlayerUID _player) in ["76561198060596172"]) then { 
// "Exported from Arsenal by Odin";

// "Remove existing items";
removeAllWeapons _player;
removeAllItems _player;
removeAllAssignedItems _player;
removeUniform _player;
removeVest _player;
removeBackpack _player;
removeHeadgear _player;
removeGoggles _player;

// "Add containers";
_player forceAddUniform "wood_RS";
for "_i" from 1 to 2 do {_player addItemToUniform "Chemlight_yellow";};
for "_i" from 1 to 4 do {_player addItemToUniform "17Rnd_mas_9x21_Mag";};
_player addItemToUniform "Trixie_5x762_Mag";
_player addVest "V_PlateCarrierH_CTRG";
_player addItemToVest "FirstAidKit";
_player addItemToVest "acc_flashlight";
_player addItemToVest "muzzle_mas_snds_Mc";
for "_i" from 1 to 5 do {_player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_player addItemToVest "SmokeShell";};
for "_i" from 1 to 5 do {_player addItemToVest "Trixie_5x762_Mag";};
_player addBackpack "B_Carryall_cbr";
_player addItemToBackpack "Medikit";
for "_i" from 1 to 6 do {_player addItemToBackpack "HandGrenade";};
_player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
for "_i" from 1 to 8 do {_player addItemToBackpack "Trixie_5x762_Mag";};
for "_i" from 1 to 2 do {_player addItemToBackpack "17Rnd_mas_9x21_Mag";};
_player addItemToBackpack "mas_PG7V";
_player addHeadgear "BaseballCap_wood";
_player addGoggles "G_Bandanna_beast";

// "Add weapons";
_player addWeapon "Trixie_M24";
_player addPrimaryWeaponItem "Trixie_Cyclone_Camo";
_player addPrimaryWeaponItem "acc_flashlight";
_player addPrimaryWeaponItem "Trixie_LSMARK4_Delta";
_player addWeapon "mas_launch_RPG7_F";
_player addWeapon "hgun_mas_m9_F";
_player addHandgunItem "muzzle_mas_snds_L";
_player addHandgunItem "optic_Yorris";
_player addWeapon "Rangefinder";

// "Add items";
_player linkItem "ItemMap";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
_player linkItem "ItemRadio";
_player linkItem "ItemGPS";
_player linkItem "NVGoggles_mas";

// "Set identity";
_player setFace "WhiteHead_17";
_player setSpeaker "Male04ENGB";


};