/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Creates a Rope with no end attached
    
    Arguments:
    0: Target <OBJECT>
    
    Return Value:
    None
*/

params["_target"];
ATLtoASL (_target modelToWorld (_target selectionPosition "slingload0"));//DODO
_helper = createVehicle ["Land_HelipadEmpty_F", , [0, 0, 0], 0, "CAN_COLLIDE"];//TODO
private _pickupaction = ["Pickup Rope", "Pickup Rope", "", {[_target, true] call TB_fnc_pickupRope;}, {!(_target getVariable ["TB_Rope_is_carry", false])}] call ace_interact_menu_fnc_createAction;
[_helper, 0, [], _pickupaction] call ace_interact_menu_fnc_addActionToObject;
_rope = ropeCreate [_target, "slingload0", _helper, [0, 0, 0], 20];
_helper setVariable ["TB_Rope_rope", _rope, true];
_helper setVariable ["TB_Rope_is_carry", false, true];
_rope setVariable ["TB_Rope_helper", _helper, true];
_rope setVariable ["TB_Rope_Source", _target, true];
