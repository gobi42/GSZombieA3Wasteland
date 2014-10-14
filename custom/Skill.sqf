// Loops on the server to set all AI to a certain skill level

sleep 1;
if NOT(isServer) exitWith {};

drSkillWest = "Med";
drSkillEast = "Low";
drSkillRes = "Low";

sleep 5;
//player globalChat "DR Skill active";
_registeredUnits = [];
_allUnits = [];
_man  = objNull;

_skillArray = [];
_skillWest = [];
_skillEast = [];
_skillRes = [];

_baseSkill = 0.3;

// Settings from a forum post by Champy_UK
// Adjusted by Drongo

// DEFAULT SETTINGS (MEDIUM)
_medium = [
// AimingAccuracy
0.2,
// AimingShake
0.65,
// AimingSpeed
0.95,
// Endurance
0.4,
// SpotDistance
0.93,
// SpotTime
0.7,
// Courage
0.8,
// ReloadSpeed
0.2,
// Commanding
1,
// General
0.3
];

_high = [
// AimingAccuracy
0.2,
// AimingShake
0.65,
// AimingSpeed
0.95,
// Endurance
0.4,
// SpotDistance
0.93,
// SpotTime
0.7,
// Courage
0.8,
// ReloadSpeed
0.2,
// Commanding
1,
// General
0.3
];

_low = [
// AimingAccuracy
0.2,
// AimingShake
0.65,
// AimingSpeed
0.95,
// Endurance
0.4,
// SpotDistance
0.93,
// SpotTime
0.7,
// Courage
0.8,
// ReloadSpeed
0.2,
// Commanding
1,
// General
0.3
];

if (drSkillWest == "High") then {_skillWest = _high};
if (drSkillWest == "Med") then {_skillWest = _medium};
if (drSkillWest == "Low") then {_skillWest = _low};

if (drSkillEast == "High") then {_skillEast = _high};
if (drSkillEast == "Med") then {_skillEast = _medium};
if (drSkillEast == "Low") then {_skillEast = _low};

if (drSkillRes == "High") then {_skillRes = _high};
if (drSkillRes == "Med") then {_skillRes = _medium};
if (drSkillRes == "Low") then {_skillRes = _low};

_go = true;
while {(_go)} do {
	_allunits = allUnits;
	while {((count _allUnits) > 0)} do {
		_man  = _allUnits select 0;
		_allUnits = _allUnits - [_man];
		if NOT(_man  in _registeredUnits) then {
			//player sideChat format ["DR Skill registered %1",_man];
			_registeredUnits = _registeredUnits + [_man ];
			_skillArray = _medium;
			if ((side _man) == West) then {_skillArray = _skillWest};
			if ((side _man) == East) then {_skillArray = _skillEast};
			if ((side _man) == Resistance) then {_skillArray = _skillRes};
			
			_man setSkill _baseSkill;
			_man setSkill ["aimingAccuracy",(_skillArray select 0)];
			_man setSkill ["aimingShake",(_skillArray select 1)];
			_man setSkill ["aimingSpeed",(_skillArray select 2)];
			_man setSkill ["endurance",(_skillArray select 3)];
			_man setSkill ["spotDistance",(_skillArray select 4)];
			_man setSkill ["spotTime",(_skillArray select 5)];
			_man setSkill ["courage",(_skillArray select 6)];
			_man setSkill ["reloadspeed",(_skillArray select 7)];
			_man setSkill ["commanding",(_skillArray select 8)];
			_man setSkill ["general",(_skillArray select 9)];
		};
	};
	sleep 50;
};