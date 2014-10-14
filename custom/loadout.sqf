waitUntil {!isNull player};       //to prevent MP / JIP issues

_unit = _this select 0;
removeallassigneditems _unit;
removeallcontainers _unit;
removeallweapons _unit;
removebackpack _unit;
removeuniform _unit;
removevest _unit;

_unit addbackpack "B_AssaultPack_blk"; 
_unit addvest "Urban_PlateCarrier1"; 
_unit addheadgear "H_Cap_blk";
//_unit addgoggles "G_Bandanna_shades";

_unit adduniform "Urban_RS";
_unit addmagazines ["30rnd_556x45_Stanag",21];
//_unit addmagazines ["DemoCharge_Remote_Mag",3]; 
_unit addweapon "hlc_rifle_RU556"; 
_unit addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC"; 
_unit addPrimaryWeaponItem "FHQ_optic_AC12136"; 
_unit addPrimaryWeaponItem "FHQ_acc_ANPEQ15_black"; 
_unit additem "Bandanna_shades_nvg";
_unit additem "ItemMap";
_unit additem "ItemCompass";
_unit additem "ItemWatch";
_unit additem "ItemRadio";
_unit additem "ItemGPS";
_unit additem "Binocular";
_unit additem "cse_m_tablet";
_unit assignItem "Bandanna_shades_nvg";
_unit assignItem "ItemMap";
_unit assignItem "ItemCompass";
_unit assignItem "ItemWatch";
_unit assignItem "ItemRadio";
_unit assignItem "ItemGPS";
_unit assignItem "Binocular";
_unit enableFatigue false;
_unit setFatigue 0; 
_unit setUnitRecoilCoeffient 0 

if(true) exitWith{};