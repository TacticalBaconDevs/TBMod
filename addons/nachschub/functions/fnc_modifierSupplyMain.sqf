#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

private _newActionName = -1;

if (_target getVariable ['TBMod_Nachschub_kisten', -1] >= 0) then {_newActionName = _target getVariable ['TBMod_Nachschub_kisten', -1]};

_actionData set [1, format ["%1%2",
        _actionData select 1,
        [format [" (%1 Kisten)", _newActionName], ""] select (_newActionName == -1)
    ]];
