/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target", "_player", "_params"];

// Add children to this action
private _actions = [];
{
    private _action = [name _x, name _x, "", {[_this select 2] spawn TB_fnc_teleport}, {true}, {}, _x] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _target];
    false;
}
count ((units (group ACE_player)) - [ACE_player]);

_actions