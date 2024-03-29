#include "../script_component.hpp"
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

private _selection = getText (configOf _target >> "slingLoadMemoryPoint");
if (_selection == "") exitWith {systemChat format ["ERROR(dropRopefromChopper): no Slingloadposition found on _target %1", _target]};

private _posSlingload = _target modelToWorld (_target selectionPosition _selection);
private _helper = createVehicle [QGVAR(ropeInvisibleObject), [0, 0, 0], [], 0, "CAN_COLLIDE"];

_helper setPos [_posSlingload select 0, _posSlingload select 1, (_posSlingload select 2) - 1];

[QGVAR(addPickupActionEvent), [_helper]] call CBA_fnc_globalEvent;
private _rope = ropeCreate [_target, _selection, _helper, [0, 0, 0], 1];

[[_rope, 3, 22]] remoteExecCall ["ropeUnwind", _target];

_helper setVariable [QGVAR(ropeObj), _rope, true];
_helper setVariable [QGVAR(isCarry), false, true];
_rope setVariable [QGVAR(ropeHelper), _helper, true];
_rope setVariable [QGVAR(ropeSource), _target, true];
