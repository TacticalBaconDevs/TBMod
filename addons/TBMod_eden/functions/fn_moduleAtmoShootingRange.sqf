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
        _x setVariable ["acex_headless_blacklist", true, true];
        _x setBehaviour "COMBAT";
        _x setCombatMode "BLUE";
        _x setUnitPos (["UP", "MIDDLE"] select (floor random 2));
        _x spawn {uiSleep 2; _this disableAI "ALL"};
    }
    forEach _syncObjs;

    ["TB_atmo_event_atmoShootingRange", [_syncObjs]] call CBA_fnc_serverEvent;
};
