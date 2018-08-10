/*
    Author: Willi "shukari" Graff
*/
params ["_target", "_player", "_params"];

// Add children to this action
private _actions = [];
{
    private _action = [str _x, format ["%1 (%2m)", [_x] call TB_fnc_displayName, round (_target distance2D _x)], "", {deleteVehicle (_this select 2)}, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _target];
    false;
}
count ((nearestObjects [_target, ["ReammoBox_F", "ACE_Wheel", "ACE_Track"], 5]) - [_target]);

_actions