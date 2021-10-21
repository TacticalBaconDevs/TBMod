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
    // Check for Mortars
    private _syncObjs = (synchronizedObjects _logic) select {_x isKindOf "Mortar_01_base_F"}; //"Artillery" in (getArray (configOf _x >> "availableForSupportTypes"))
    if (_syncObjs isEqualTo []) exitWith {systemChat "AtmoMortarSupport braucht gesyncte Mortars!"};

    {
        doStop _x;
        _x setVariable ["acex_headless_blacklist", true, true];
        _x setBehaviour "COMBAT";
        _x setCombatMode "BLUE";
        _x lock 2;
        //_x setFuel 0;
        _x addEventHandler ["Fired", {
            (_this # 6) setPos [0, 0, 1000];
            deleteVehicle (_this # 6),
        }];
    }
    forEach _syncObjs;

    ["TB_atmo_event_amtoMortarSupport", [_syncObjs]] call CBA_fnc_serverEvent;
};
