#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// initalisiert die TB Rolle nach dem spawnen
[] spawn FUNC(waitUntilLoaded);

// Variablen
if (isNil "TB_blacklistRollen") then {TB_blacklistRollen = []};
if (isNil "TB_blacklistRollen_custom") then {TB_blacklistRollen_custom = []};
if (isNil "TB_blacklistRollen_themen") then {TB_blacklistRollen_themen = []};

["ace_arsenal_displayClosed", {
    if (!isNil "TB_arsenal_kiste") then {TB_arsenal_kiste hideObject false};
}] call CBA_fnc_addEventHandler;

["ace_arsenal_displayOpened", {
    if (!isNil "TB_arsenal_kiste") then {TB_arsenal_kiste hideObject true};
}] call CBA_fnc_addEventHandler;

// kein Müll
[
    "CAManBase",
    "Put",
    {
        params ["_unit", "_container", "_item"];

        if (local _unit && {!((_unit nearEntities ["TB_arsenal_base", 6]) isEqualTo [])}) then
        {
            if (typeOf _container == "GroundWeaponHolder") then {deleteVehicle _container};
        };
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;

