#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (!GVAR(crashHelfer) && _input) then {GVAR(crashHelfer) = true};
if (!GVAR(crashHelfer)) exitWith {};

if (isNil QGVAR(disconnectCache)) then {GVAR(disconnectCache) = [false] call CBA_fnc_createNamespace};

addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];

["CBA_teamColorChanged", {
    params ["_unit", "_team"];
    _unit setVariable ["TB_team", _team];
}] call CBA_fnc_addEventHandler;
