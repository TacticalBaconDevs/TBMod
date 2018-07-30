/*
	Author: Willi "shukari" Graff
*/
params ["_logic", "", "_activated"];

private _pos = getPos _logic;
private _unit = attachedTo _logic;
deleteVehicle _logic;

if !(local _logic) exitWith {};
if !(_activated) exitWith {};
if (isNull _unit) exitWith {};

{
    [_x, "PATH"] remoteExec ["disableAI", _x];
    doStop _x;
} forEach (units _unit);

true
