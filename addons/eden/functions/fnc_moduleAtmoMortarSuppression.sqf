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

// TODO: wieder deaktivierbare Module machen
//["%1", _this] call EFUNC(main,debug);

if (!is3DEN && {_mode == "init"} && {_isActivated}) then
{
    // Check for Target
    private _syncObjs = (synchronizedObjects _logic) select {_x isKindOf "TB_eden_atmoTarget"};
    if (_syncObjs isEqualTo []) exitWith {systemChat "AtmoMortarSuppression braucht gesyncte Targets!"};

    ["TB_atmo_event_atmoMortarSuppression", [_syncObjs]] call CBA_fnc_serverEvent;
};
