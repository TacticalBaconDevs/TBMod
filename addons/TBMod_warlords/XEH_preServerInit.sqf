#include "../script_macros.hpp"
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
    [] spawn {waitUntil {"Shukari hat vergessen die schweren AddonSettings zu laden!" remoteExecCall ["systemChat"]; uiSleep 60; !ace_map_BFT_Enabled}};
};

// ServerDifficulty
if (isMultiplayer && (difficultyOption "commands") == 0) then
{
    [] spawn {waitUntil {"Shukari hat vergessen die ServerSchwierigkeits-Einstellungen zu laden!" remoteExecCall ["systemChat"]; uiSleep 60; (difficultyOption "commands") != 0}};
};
