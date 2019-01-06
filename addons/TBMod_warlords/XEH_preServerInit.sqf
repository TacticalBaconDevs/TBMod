/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/

if !(call TB_fnc_isWLMission) exitWith {};

// KI ist keine Muniversorgung
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
    [] spawn {waitUntil {"Shukari hat vergessen die schweren AddonSettings zu laden!" remoteExecCall ["systemChat"]; uiSleep 60; false}};
};

// ServerDifficulty
if (isMultiplayer && (difficultyOption "commands") == 0) then
{
    [] spawn {waitUntil {"Shukari hat vergessen die ServerSchwierigkeits-Einstellungen zu laden!" remoteExecCall ["systemChat"]; uiSleep 60; false}};
};
