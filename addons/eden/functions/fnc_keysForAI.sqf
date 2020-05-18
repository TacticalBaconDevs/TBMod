#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_unit", "_value"];

if (!alive _unit && _value != "" && _value != "[]") exitWith {};

{
    private _obj = missionNamespace getVariable [_x, objNull];
    if (isNull _obj || !alive _obj) exitWith {(format ["[TBMod_main] KeysForAI: Auto mit dem Namen '%1' wurde nicht gefunden!", _x]) remoteExecCall ["systemChat"]};
    [_unit, _obj, true] call ace_vehiclelock_fnc_addKeyForVehicle;
}
forEach (call compile _value);
