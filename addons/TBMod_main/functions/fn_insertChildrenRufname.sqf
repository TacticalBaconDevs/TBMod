#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_this", "_name"];
params ["_target", "_player", "_params"];

private _actions = [];

if (count _name <= 2) exitWith {_actions};

for "_i" from 1 to 4 do
{
    _actions pushBack [
        [
            str _i,
            format ["%1%2", _name, _i],
            "",
            {
                params ["_target", "_player", "_params"];
                systemChat format ['%1 wurde als Rufname gesetzt!', _params];
                (group ACE_player) setGroupIdGlobal [_params]
            },
            {true},
            {},
            _name
        ] call ace_interact_menu_fnc_createAction,
        [],
        _target
    ];
};

_actions
