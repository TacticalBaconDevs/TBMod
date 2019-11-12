#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target"];

if (isNull _target || typeOf _target == "") exitwith {false};

((ACE_player getVariable ["ACE_IsEngineer", 0]) in [true, 1, 2] || (ACE_player getVariable ["TB_rolle", ""]) == "pionier")
    && {"ToolKit" in ([ACE_player] call ace_common_fnc_uniqueItems)}
    && {((GVAR(clearPlaceables)) findIf {(_x isEqualType "" && {_target isKindOf _x}) || (_x isEqualType objNull && {_target isEqualTo _x})} != -1)}
    && {_target distance ACE_player < 5}
