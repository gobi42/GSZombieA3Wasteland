
/*__________________________________________
  Script by Sickboy (sb _at_ 6thSense.eu)
  Version: v0.1
__________________________________________*/
T_INIT = false;
T_Server = false; T_Client = false; T_JIP = false;

if (playersNumber east + playersNumber west + playersNumber resistance + playersNumber civilian > 0) then { T_MP = true } else { T_MP = false };

if (isServer) then
{
	T_Server = true;
	if (!(isNull player)) then { T_Client = true };
	T_INIT = true;
} else {
	T_Client = true;
	if (isNull player) then
	{
		T_JIP = true;
		[] spawn { waitUntil { !(isNull player) }; T_INIT = true };
	} else {
		  T_INIT = true;
		};
};
/*_________________________________________________________
	Any script that has to work with the player object will have to wait until T_INIT == true
		waitUntil { T_INIT };
	SinglePlayer: !T_MP
	MultiPlayer: T_MP
	Dedicated Server: T_Server && !T_Client
	Dedicated Server or ServerClient: T_Server
	ClientOnly: T_Client && !T_Server
	Client or ServerClient: T_Client
	Client or ServerClient, NOT JIP: T_Client && !T_JIP
	JIP Client: T_JIP
_________________________________________________________*/
if(T_Server)then
{
	_infectedZone=["zoneAuto","zoneAuto_1","zoneAuto_2","zoneAuto_3","zoneAuto_4","zoneAuto_5","zoneAuto_6","zoneAuto_7","zoneAuto_8","zoneAuto_9","zoneAuto_10","zoneAuto_11"]; // zones to infect
	
	{
		private ["_markName","_markPos","_mPosX","_mPosY","_mkrY","_mkrX","_detectorName","_x"];
		_markName=_x;
		_markPos=MarkerPos _markName;
		_mPosX=_markPos select 0;
		_mPosY=_markPos select 1;
		_mkrY= getmarkerSize _markName select 0;
		_mkrX= getmarkerSize _markName select 1;
		_detectorName=_x;
		//deleteMarker _x;
		_x=createTrigger["EmptyDetector",_markPos];
		//_x setTriggerArea[(_mkrX*3),(_mkrX*3),0,false];
		_x setTriggerArea[(_mkrX),(_mkrX),0,false];
		_x setTriggerActivation ["west", "PRESENT", false];
		_x setTriggerStatements ["this","thisTrigger spawn INF_fnc_autopop","thisTrigger spawn INF_fnc_playerLeavingZone;"];
		sleep 0.1;
	} forEach _infectedZone;
};
