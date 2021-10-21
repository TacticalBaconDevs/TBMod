#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_rolle", "_arsenalType", "_target", ["_loadGear", true]];

ACE_player setVariable ["TB_rolle", _rolle, true];
[_rolle] call FUNC(setAttributes);

// CrashHelper
if (isNull _target) then {
    if (_arsenalType in ["", "CUSTOM"]) exitWith {};

    {
        if (_arsenalType isEqualTo getText (configOf _x >> "arsenalType")) exitWith
        {
            _target = _x;
        };
    }
    forEach vehicles;

    [_target, _rolle] call FUNC(setArsenal);
} else {
    [_target, _rolle] call FUNC(setArsenal);
};

systemChat format ["Du bist nun: %1 (%2)", [_rolle] call FUNC(getRollenName), _arsenalType];

if (_loadGear) then
{
    removeAllWeapons ACE_player;
    removeAllItems ACE_player;
    removeAllAssignedItems ACE_player;
    removeUniform ACE_player;
    removeVest ACE_player;
    removeBackpack ACE_player;
    removeHeadgear ACE_player;
    removeGoggles ACE_player;

    [] call FUNC(loadDefault);
};
