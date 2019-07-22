#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target", "_player", "_params"];
	private _actions = [];
    for "_i" from 1 to 9 do
	{
		private _flagge = format ["Flagge %1", _i];
		_actions pushBack [
			[
				str _i,
				_flagge,
				"",
				{
					params ["_target", "_player", "_params"];
					_target forceFlagTexture format ["\TBMod_skins\pictures\flags\Flagge_%1.paa",_params]
				},
				{true},
				{},
				_i
			] call ace_interact_menu_fnc_createAction,
			[],
			_target
    	];
    };

    _actions