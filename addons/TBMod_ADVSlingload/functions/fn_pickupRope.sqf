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

if (isNull _target) exitWith {hint "Target nicht gefunden"};
if (!alive _target) exitWith {hint "Was zerstört ist sollte nicht benutzt werden"};

if(_fromGround) then //_target = helper
{
    _target attachTo [player, [-0.02,-0.04,-0.0], "righthandmiddle1"];
    _target setVariable ["TB_Rope_is_carry", true, true];
    player setVariable ["TB_Rope_helper", _target];

} else  //_target = helicopter
{
    _helper = createVehicle ["Land_HelipadEmpty_F", position player, [], 0, "CAN_COLLIDE"];
    private _pickupaction = ["Pickup Rope", "Pickup Rope", "", {[_target, true] call TB_fnc_pickupRope;}, {!(_target getVariable ["TB_Rope_is_carry", false])}] call ace_interact_menu_fnc_createAction;
    [_helper, 0, [], _pickupaction] call ace_interact_menu_fnc_addActionToObject;
    _helper attachTo [player, [-0.02, -0.04, -0.0], "righthandmiddle1"];
    _rope = ropeCreate [_target, "slingload0", _helper, [0, 0, 0], 20];
    player setVariable ["TB_Rope_helper", _helper];
    _helper setVariable ["TB_Rope_rope", _rope, true];
    _helper setVariable ["TB_Rope_is_carry",true, true];
    _rope setVariable ["TB_Rope_helper", _helper, true];
    _rope setVariable ["TB_Rope_Source", _target, true];
    //addeventhandler
}