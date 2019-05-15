#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target", "_player", "_params"];

// Add children to this action
private _actions = [];
{
    _x params ["_name", "_obj"];

    if (!isNil "_x") then
    {
        private _action = [_name, _name, "", {[_this select 2] spawn FUNC(teleport)}, {true}, {}, _obj] call ace_interact_menu_fnc_createAction;
        _actions pushBack [_action, [], _target];
    };
}
forEach TB_main_fobs;

_actions