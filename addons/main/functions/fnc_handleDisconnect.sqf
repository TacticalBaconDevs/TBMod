#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_unit", "", "_uid", ""];

private _pos = getPosASL _unit;
_pos set [2, (_pos select 2) + 0.5];

private _array = [
    _uid,
    getUnitLoadout _unit,
    _pos,
    getDir _unit,
    _unit getVariable ["TB_arsenalType", ""],
    _unit getVariable ["TB_rolle", ""],
    group _unit,
    _unit getVariable ["TB_team", "MAIN"]
];

// falsch TODO
[missionNamespace, [QGVAR(disconnectCache), _array]] remoteExecCall ["setVariable", 2];

deleteVehicle _unit;

false;
