#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
    Creates a Lastenseil with no end attached

    Arguments:
    0: Target <OBJECT>

    Return Value:
    None
*/
params ["_target"];

// Sanity Checks
if (isNull _target) exitWith {systemChat format ["ERROR(dropRopefromChopper): no Target"]};
if (!alive _target) exitWith {systemChat "Was zerstört ist sollte nicht benutzt werden"};

private _selection = getText (configfile >> "CfgVehicles" >> typeOf _target >> "slingLoadMemoryPoint");
if (_selection == "") exitWith {systemChat format ["ERROR(dropRopefromChopper): no Slingloadposition found on _target %1", _target]};

private _posSlingload = _target modelToWorld (_target selectionPosition _selection);
private _helper = createVehicle ["TB_Rope_InvisibleObject", [0, 0, 0], [], 0, "CAN_COLLIDE"];

_helper setPos [_posSlingload select 0, _posSlingload select 1, (_posSlingload select 2) - 1];

//[[_helper, 0, [], TB_Rope_PickupAction], []] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, _helper];
//[, 0, [], TB_Rope_PickupAction] call ace_interact_menu_fnc_addActionToObject;//TODO execute global
["TB_Rope_addPickupAction", [_helper]] call CBA_fnc_globalEvent;
private _rope = ropeCreate [_target, _selection, _helper, [0, 0, 0], 1];
//ropeUnwind [_rope, 3, 22];
[[_rope, 3, 22]] remoteExecCall ["ropeUnwind", _target];

_helper setVariable ["TB_Rope_rope", _rope, true];
_helper setVariable ["TB_Rope_is_carry", false, true];
_rope setVariable ["TB_Rope_helper", _helper, true];
_rope setVariable ["TB_Rope_Source", _target, true];
