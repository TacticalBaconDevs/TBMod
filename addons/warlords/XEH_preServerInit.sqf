#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

if !(call FUNC(isWLMission)) exitWith {};

// KI ist keine Muniversorgung - ServerKI
[
    "CAManBase",
    "Killed",
    {
        params ["_unit", "_killer", "_instigator", "_useEffects"];

        if (local _unit) then
        {
            removeAllItems _unit;
            removeAllWeapons _unit;
            removeAllAssignedItems _unit;
            removeAllItemsWithMagazines _unit;
        };
    },
    true,
    [],
    true
] call CBA_fnc_addClassEventHandler;

// AddonSettingsCheck
if (isMultiplayer && ace_map_BFT_Enabled) then
{
    [{
        "Shukari hat vergessen die schweren AddonSettings zu laden!" remoteExecCall ["systemChat"];
        if (!ace_map_BFT_Enabled) then {[_this # 1] call CBA_fnc_removePerFrameHandler;};
    }, 60] call CBA_fnc_addPerFrameHandler;
};

// ServerDifficulty
if (isMultiplayer && (difficultyOption "commands") == 0) then
{
    [{
        "Shukari hat vergessen die ServerSchwierigkeits-Einstellungen zu laden!" remoteExecCall ["systemChat"];
        if ((difficultyOption "commands") != 0) then {[_this # 1] call CBA_fnc_removePerFrameHandler;};
    }, 60] call CBA_fnc_addPerFrameHandler;
};
