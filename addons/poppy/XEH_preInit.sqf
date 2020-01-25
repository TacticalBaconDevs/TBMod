#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
	Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de

    see https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if !(call EFUNC(main,isTBMission)) exitWith {};


{
    [_x, "InitPost", {
        params ["_unit"];
        if (local _unit) then {[_unit, typeOf _unit] call FUNC(applyLoadout)};
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    [_x, "Local", {
        params ["_unit"];
        if (local _unit) then {[_unit, typeOf _unit] call FUNC(applyLoadout)};
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [QGVAR(blufor_01), QGVAR(opfor_01), QGVAR(ind_01)];



ADDON = true;
