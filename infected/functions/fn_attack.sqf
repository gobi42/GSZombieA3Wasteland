private ["_me","_this","_myTarget","_myzone","_initialPos","_imHere","_target","_isInVehicle","_targetPos","_distance","_asleep","_killCount"];
if (isServer)then
{
	_me=_this select 0;
	[_me] joinSilent infectedattacker;
	_me disableAI "FSM";
	_me disableConversation true;
	_me setVariable ["BIS_noCoreConversations", true];
	_myTarget= _this select 1;
	_myzone=_this select 2;
	_initialPos=_this select 3;
	_imHere=false;
	missionNamespace setVariable [format ["%1_nextTarget",_me], _myTarget];
	Attacking = Attacking + 1;
	while{(alive _me)and(count _myTarget != 0)}do
	{
		_nextTarget = missionNamespace getVariable [format ["%1_nextTarget",_me], []];
		if ((str _nextTarget) != (str _myTarget)) then
		{
			_myTarget= _nextTarget;
		};
		_target= _myTarget select 0;
		if(!(vehicle _target isKindOf "man"))then
		{
			_isInVehicle=missionNamespace getVariable [format ["%1_playerIn", _target],[]];
			if(!(_isInVehicle select 0))then
			{
				_target=_isInVehicle select 1;
			};
		};
		_targetPos = getposATL _target;
		if(surfaceIsWater _targetPos) then
		{
			_targetPos = getposASL _target;
		};
		_distance=(_targetPos distance _me);
		(_me)doMove(_targetPos);
		_me setSpeedMode "FULL";
		if((_distance<=20)and(!_imHere))then
		{
			_imHere=true;
			//[_me, "idle"] spawn INF_fnc_NextSound;
			[[_me,"idle"], "INF_fnc_NextSound"] call BIS_fnc_MP;
		};
		if(_distance<=2.5)then
		{	
			if ((alive _me) and (alive _target))then
			{
				_me switchMove "AwopPercMstpSgthWnonDnon_throw";
				sleep 0.2;
				_target setDamage (damage _target + 0.34);
				//[_me, "punch"] spawn INF_fnc_NextSound;
				[[_me,"punch"], "INF_fnc_NextSound"] call BIS_fnc_MP;
				sleep 2;
			};
		};
		if(!alive _target)then
		{
			sleep 2;
			_myTarget=[_me,_myzone] call INF_fnc_NearestTarget;
		};
		if(_distance>100)then
		{
			_myTarget=[_me,_myzone] call INF_fnc_NearestTarget;
		};
		
		_asleep= 1+(random 1);
		sleep _asleep;
	};
	if(!alive _me)then
	{
		infectedkilled = infectedkilled + 1;
		Attacking = Attacking - 1;
		_killCount = missionNamespace getVariable [format ["%1_killCount", _myzone], []];
		missionNamespace setVariable [format ["%1_killCount", _myzone], (_killCount + 1)];
		_me removeAllEventHandlers "hit";
		sleep 120;
		deleteVehicle _me;
	}else{
		Attacking = Attacking - 1;
		[_me,_myzone,_initialPos] spawn INF_fnc_roam;
	};
};