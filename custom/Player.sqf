private "_player";
_player = this;

_player enableFatigue false;
null = [this] execVM "loadout.sqf";
_player addeventhandler ["respawn","_this execVM 'loadout.sqf'"];
_player setFatigue 0; 
_player setUnitRecoilCoefficient 0