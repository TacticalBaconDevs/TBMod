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
    private _syncSoldiers = (synchronizedObjects _logic) select {_x isKindOf "CAManBase"};
    if (_syncSoldiers isEqualTo []) exitWith {systemChat "AtmoFireSuppression braucht gesyncte Soldaten!"};

    // Check for Target
    private _syncTargets = (synchronizedObjects _logic) select {_x isKindOf "TB_eden_atmoTarget"};
    if (_syncTargets isEqualTo []) exitWith {systemChat "AtmoFireSuppression braucht gesyncte Targets!"};

    {
        doStop _x;
        _x setVariable ["acex_headless_blacklist", true, true];
        _x setBehaviour "COMBAT";
        _x setCombatMode "YELLOW";
        _x setUnitPos (selectRandom ["UP", "MIDDLE"]);
        [_x, "PATH"] remoteExecCall ["disableAI", _x];
        _x spawn {uiSleep 1; [_this, "PATH"] remoteExecCall ["disableAI", _this]};
        _x lookAt (selectRandom _syncTargets);
        _x setVariable ["Vcm_Disable", true, true];
    }
    forEach _syncSoldiers;

    ["TB_atmo_event_atmoFireSuppression", [_syncSoldiers, _syncTargets]] call CBA_fnc_serverEvent;
};
