#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _rolle = ACE_player getVariable ["TB_rolle", ""];

if (_rolle == "") exitWith {};

[_rolle] call FUNC(setAttributes);
