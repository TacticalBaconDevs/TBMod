/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Pickup 
    
    Arguments:
    0: Target <OBJECT>
    1: fromGround <boolean>

    Return Value:
    None
*/
params["_target", "_fromGround"];
//Sanity Checks
if (isNull _target) exitWith {systemChat format ["ERROR(pickupRope): _target %1  _fromGround %2 ", _target, _fromGround]};
if (!alive _target) exitWith {hint "Was zerstört ist sollte nicht benutzt werden"};

if (_fromGround) then //_target = helper
{
    private _rope = _target getVariable ['TB_Rope_rope', objNull];
    private _source = _rope getVariable ['TB_Rope_Source', objNull];
    private _selection = getText (configfile >> "CfgVehicles" >> typeOf _source >> "slingLoadMemoryPoint");
    if (_selection == "") exitWith {systemChat format ["ERROR(pickupRope): no Slingloadposition found on _source %1   ", _source]};
    
    _target attachTo [player, [-0.02, -0.04, -0.0], "righthandmiddle1"];
    
    _target setVariable ["TB_Rope_is_carry", true, true];
    player setVariable ["TB_Rope_helper", _target];
    [_source, _selection, _target] call TB_fnc_startRopeinHandsPFH;
} else  //_target = helicopter
{
    private _helper = createVehicle ["TB_Rope_InvisableObject", position player, [], 0, "CAN_COLLIDE"];

    private _selection = getText (configfile >> "CfgVehicles" >> typeOf _target >> "slingLoadMemoryPoint");
    if (_selection == "") exitWith {systemChat format ["ERROR(pickupRope): no Slingloadposition found on _source %1   ", _source]};

    //[[_helper, 0, [], TB_Rope_PickupAction], []] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, _helper];
    //[_helper, 0, [], TB_Rope_PickupAction] call ace_interact_menu_fnc_addActionToObject;//TODO execute global
    ["TB_Rope_addPickupAction", [_helper]] call CBA_fnc_globalEvent;

    _helper attachTo [player, [-0.02, -0.04, -0.0], "righthandmiddle1"];
    private _rope = ropeCreate [_target, _selection, _helper, [0, 0, 0], 20];
    
    player setVariable ["TB_Rope_helper", _helper];
    _helper setVariable ["TB_Rope_rope", _rope, true];
    _helper setVariable ["TB_Rope_is_carry", true, true];
    _rope setVariable ["TB_Rope_helper", _helper, true];
    _rope setVariable ["TB_Rope_Source", _target, true];
    [_target, _selection, _helper] call TB_fnc_startRopeinHandsPFH;
}
