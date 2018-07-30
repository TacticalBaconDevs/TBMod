/*
	Author: Willi "shukari" Graff
*/
params [
		["_obj", objNull, [objNull]],
		["_time", 5, [0]],
		["_messages", true, [true]]
	];

if (_obj isKindOf "Man") then
{
	if (_obj isEqualTo ACE_player) exitWith {systemChat "Zu Dir selber teleportieren ist nicht hilfreich."};

	if (_messages) then
	{
		systemChat "Halte Dich bereit, Teleport wird vorbereitet...";
		format ["Achtung, %1 teleportet zu Dir!", profileName] remoteExecCall ["systemChat", _obj];
	};
	
	uiSleep _time;
	
	private _vehicle = vehicle _obj;
	if (_vehicle != _obj) then
	{
		if !(player moveInAny _vehicle) then
		{
			"Das Fahrzeug beim Teleportspieler ist voll, warte etwas!" remoteExecCall ["systemChat", _obj];
			uiSleep 5;
			_this spawn BBQC_fnc_teleport;
		};
	}
	else
	{
		player setDir ((getDir _obj) + (10 - random 20));
		player setPos (_obj modelToWorld [0, -1, 0]);
	};
}
else
{
	if (_obj isKindOf "TB_spezial_fobBase") then
	{
		player setDir ((getDir _obj) + (10 - random 20));
		player setPos (_obj modelToWorld [0, -2, 0]);
	}
	else
	{
		systemChat "Teleport nur auf Personen/Flaggen/FOBs möglich!";
	};
};
