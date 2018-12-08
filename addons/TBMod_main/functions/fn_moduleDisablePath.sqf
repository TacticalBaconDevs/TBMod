/*
    Author: shukari
*/
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
private _pos = getPos _logic;
deleteVehicle _logic;
if !(_activated) exitWith {true};
if (isNull _unit) exitWith {true};

{
    [_x, "PATH"] remoteExec ["disableAI", _x];
    doStop _x;
}
forEach (units _unit);

true
