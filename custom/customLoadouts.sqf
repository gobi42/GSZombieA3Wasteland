private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = this;

if (( getPlayerUID _player) in ["76561198079546085"]) then { 
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
_player forceAddUniform "Night1_RS";
_player addItemToUniform "FirstAidKit";
_player addVest "V_PlateCarrier1_blk";
//for "_i" from 1 to 3 do {_player addItemToVest "16Rnd_9x21_Mag";};
//_player addItemToVest "Chemlight_green";
for "_i" from 1 to 6 do {_player addItemToVest "hlc_30rnd_556x45_EPR";};
_player addBackpack "B_AssaultPack_blk";
_player addItemToBackpack "ToolKit";
for "_i" from 1 to 5 do {_player addItemToBackpack "hlc_30rnd_556x45_SOST";};
for "_i" from 1 to 2 do {_player addItemToBackpack "DemoCharge_Remote_Mag";};
_player addHeadgear "H_Cap_blk";
_player addGoggles "G_Bandanna_shades";

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

// "Set identity";
//_player setFace "GreekHead_A3_01";
//_player setSpeaker "Male01ENG";
