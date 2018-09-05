/*
    Author: shukari
*/
params ["_target", "_player", "_params"];

// Add children to this action
private _actions = [];
{
    if (side _x == playerSide && ({isPlayer _x} count (units _x)) > 0) then
    {
        private _action = [groupId _x, format ["%1 (%2)" ,groupId _x, name (leader _x)], "", {[_this select 2] spawn TB_fnc_teleport}, {true}, {}, leader _x] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _target];
    };
    
    false;
}
count allGroups;

_actions