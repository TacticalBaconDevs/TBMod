#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if (!GVAR(enable) || !isNil QGVAR(actions)) exitWith {};
GVAR(actions) = true;

// Interaktionen
private _action = ["SpectrumDevice", "SpectrumDevice", "", {}, {GVAR(enable) && {GVAR(receive)}}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Reset", "Reset", "", {[] call FUNC(setDisplayValues)}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "SpectrumDevice"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Bereiche", "Bereiche", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "SpectrumDevice"], _action] call ace_interact_menu_fnc_addActionToObject;

for "_i" from 0 to 500 step 100 do
{
    private _name = format ["%1-%2MHz", _i, _i + 100];
    _action = [_name, _name, "", {[_this # 2] call FUNC(setDisplayValues)}, {true}, nil, [_i, _i + 100]] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "SpectrumDevice", "Bereiche"], _action] call ace_interact_menu_fnc_addActionToObject;
};
