#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (!VAR(crashHelfer) && _input) then {VAR(crashHelfer) = true};
if (!VAR(crashHelfer)) exitWith {};

addMissionEventHandler ["HandleDisconnect",
{
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

    private _find = [VAR(disconnectCache), _uid] call BIS_fnc_findNestedElement;
    if (_find isEqualTo []) then
    {
        VAR(disconnectCache) pushBack _array;
    }
    else
    {
        VAR(disconnectCache) set [_find select 0, _array];
    };

    publicVariable QVAR(disconnectCache);
    deleteVehicle _unit;

    false;
}];

["CBA_teamColorChanged", {
    params ["_unit", "_team"];
    _unit setVariable ["TB_team", _team];
}] call CBA_fnc_addEventHandler;
