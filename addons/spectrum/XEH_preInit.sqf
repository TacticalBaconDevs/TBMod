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

[
    QGVAR(enable),
    "CHECKBOX",
    "Aktivieren",
    ["TBMod", QUOTE(COMPONENT)],
    true,
    1,
    {
        if (_this) then
        {
            call FUNC(initInteractions);
        }
        else
        {
            {GVAR(transmitters) setVariable [_x, nil]} forEach (allVariables GVAR(transmitters));
            missionNamespace setVariable ["#EM_Values", []];
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(cone),
    "SLIDER",
    "spectrumDeviceCone",
    ["TBMod", QUOTE(COMPONENT)],
    [5, 90, 20, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(range),
    "SLIDER",
    "spectrumDeviceRange",
    ["TBMod", QUOTE(COMPONENT)],
    [10, 2000, 300, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(conversionModus),
    "LIST",
    "conversionModus",
    ["TBMod", QUOTE(COMPONENT)],
    [[0, 1, 2], ["linear", "expo", "square"], 1],
    1
] call CBA_fnc_addSetting;

ADDON = true;
