#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
    Pickup

    Arguments:
    0: Target <OBJECT>
    1: fromGround <boolean>

    Return Value:
    None
*/
params ["_target", "_fromGround"];

// Sanity Checks
if (isNull _target) exitWith {systemChat format ["ERROR(pickupRope): _target %1 _fromGround %2 ", _target, _fromGround]};
if (!alive _target) exitWith {systemChat "Ziel ist zerstört"};

if (_fromGround) then //_target = helper
{
    private _rope = _target getVariable [QGVAR(ropeObj), objNull];
    private _source = _rope getVariable [QGVAR(ropeSource), objNull];
    private _selection = getText (configfile >> "CfgVehicles" >> typeOf _source >> "slingLoadMemoryPoint");
    if (_selection == "") exitWith {systemChat format ["ERROR(pickupRope): no Slingloadposition found on _source %1", _source]};

    _target attachTo [ACE_player, [-0.02, -0.04, -0.0], "righthandmiddle1"];

    _target setVariable [QGVAR(isCarry), true, true];
    ACE_player setVariable [QGVAR(ropeHelper), _target];
    [_source, _selection, _target] call FUNC(startRopeinHandsPFH);
}
else  //_target = helicopter
{
    private _helper = createVehicle [QGVAR(ropeInvisibleObject), position ACE_player, [], 0, "CAN_COLLIDE"];

    private _selection = getText (configfile >> "CfgVehicles" >> typeOf _target >> "slingLoadMemoryPoint");
    if (_selection == "") exitWith {systemChat format ["ERROR(pickupRope): no Slingloadposition found on _target %1", _target]};

    //[[_helper, 0, [], TB_Rope_PickupAction], []] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, _helper];
    //[_helper, 0, [], TB_Rope_PickupAction] call ace_interact_menu_fnc_addActionToObject;//TODO execute global
    [QGVAR(addPickupActionEvent), [_helper]] call CBA_fnc_globalEvent;

    _helper attachTo [ACE_player, [-0.02, -0.04, -0.0], "righthandmiddle1"];
    private _rope = ropeCreate [_target, _selection, _helper, [0, 0, 0], 22];

    ACE_player setVariable [QGVAR(ropeHelper), _helper];
    _helper setVariable [QGVAR(ropeObj), _rope, true];
    _helper setVariable [QGVAR(isCarry), true, true];
    _rope setVariable [QGVAR(ropeHelper), _helper, true];
    _rope setVariable [QGVAR(ropeSource), _target, true];

    [_target, _selection, _helper] call FUNC(startRopeinHandsPFH);
}
