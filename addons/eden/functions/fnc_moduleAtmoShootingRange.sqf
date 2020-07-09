#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];

if (!is3DEN && {_mode == "init"} && {_isActivated}) then
{
    // Check for Soldiers
    private _syncObjs = (synchronizedObjects _logic) select {_x isKindOf "CAManBase"};
    if (_syncObjs isEqualTo []) exitWith {systemChat "AtmoShootingRange braucht gesyncte Soldaten!"};

    {
        doStop _x;
        _x setVariable ["acex_headless_blacklist", true, true];
        _x setBehaviour "COMBAT";
        _x setCombatMode "BLUE";
        _x setUnitPos (selectRandom ["UP", "MIDDLE"]);
        [_x, "MOVE"] remoteExecCall ["disableAI", _x];
        [{[_this, "PATH"] remoteExecCall ["disableAI", _this]}, _x, 1] call CBA_fnc_waitAndExecute;
        _x setVariable ["Vcm_Disable", true, true];
    }
    forEach _syncObjs;

    ["TB_atmo_event_atmoShootingRange", [_syncObjs]] call CBA_fnc_serverEvent;
};
