/*
    Author: shukari
*/
params ["_logic", "", "_activated"];

private _unit = attachedTo _logic;
private _pos = getPos _logic;
private _local = local _logic;
deleteVehicle _logic;

if !(_local) exitWith {true};
if !(_activated) exitWith {true};
if (isNull _unit) exitWith {true};

{
    [_x, "PATH"] remoteExec ["disableAI", _x];
    doStop _x;
}
forEach (units _unit);

true
