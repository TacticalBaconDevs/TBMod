#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    see https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if !(call EFUNC(main,isTBMission)) exitWith {};

if (isServer) then
{
    GVAR(transmitters) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(transmitters);
};

[
    QGVAR(cone),
    "SLIDER",
    "spectrumDeviceCone",
    ["TBMod", QUOTE(ADDON)],
    [10, 90, 30, 0]
] call CBA_fnc_addSetting;

[
    QGVAR(range),
    "SLIDER",
    "spectrumDeviceRange",
    ["TBMod", QUOTE(ADDON)],
    [10, 2000, 300, 0]
] call CBA_fnc_addSetting;

ADDON = true;
