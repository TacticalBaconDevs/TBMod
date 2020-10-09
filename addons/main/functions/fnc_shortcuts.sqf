#include "../script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    https://github.com/CBATeam/CBA_A3/wiki/Keybinding
    https://github.com/CBATeam/CBA_A3/blob/master/addons/keybinding/fnc_addKeybind.sqf
    https://community.bistudio.com/wiki/DIK_KeyCodes
*/
[
    "TBMod",
    QEGVAR(key,hideGUI),
    "Zeigt/Verbirgt die GUI",
    {
        diwako_dui_main_toggled_off = !diwako_dui_main_toggled_off;
        ["diwako_dui_main_hudToggled", [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
        systemChat format ["HUD ist nun %1", ["sichtbar" , "unsichtbar"] select diwako_dui_main_toggled_off];
    },
    {},
    [DIK_J, [false, true, true]] // [Shift, Strg, Alt]
] call CBA_fnc_addKeybind;

[
    "TBMod",
    QEGVAR(key,curatorCamEars),
    ["Zeusohren an/aus", "Du hörst entweder um deinen Spieler oder die ZeusCam"],
    {
        if (isNil "TB_main_spectator") then {TB_main_spectator = false};

        TB_main_spectator = !TB_main_spectator;

        //[ACE_player, TB_main_spectator] call TFAR_fnc_forceSpectator;
        ACE_player setVariable ["TFAR_curatorCamEars", TB_main_spectator, true];
        TFAR_curatorCamEars = TB_main_spectator;

        systemChat format ["TFAR-Spectator: %1", TB_main_spectator];
    },
    {},
    [DIK_END, [true, false, false]] // SHIFT + ENDE
] call CBA_fnc_addKeybind;

// Shortcuts für LVL2
if !(getPlayerUID ACE_player in (call TB_lvl2)) exitWith {};

[
    "TBMod",
    QEGVAR(key,gcam),
    "Öffnet GCAM",
    {
        [ACE_player] spawn FUNC(showGCAM);
        ["TB_informAdminsAndZeus", ["%1 hat GCAM gestartet!", profileName]] call CBA_fnc_globalEvent;
        systemChat "GCAM gestartet!";
    },
    {},
    [DIK_END, [false, true, false]] // STRG + ENDE
] call CBA_fnc_addKeybind;

[
    "TBMod",
    QEGVAR(key,spectator),
    "Öffnet den Spectator",
    {
        // https://ace3mod.com/wiki/framework/spectator-framework.html
        [allPlayers, []] call ace_spectator_fnc_updateUnits;
        [[side player], player call BIS_fnc_enemySides] call ace_spectator_fnc_updateSides;
        [[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
        [[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes;
        [2, player, -2] call ace_spectator_fnc_setCameraAttributes;
        [true, false, false] call ace_spectator_fnc_setSpectator;

        ["TB_informAdminsAndZeus", ["%1 hat den Spectator gestartet!", profileName]] call CBA_fnc_globalEvent;
    },
    {},
    [DIK_END, [true, true, false]] // SHIFT + STRG + ENDE
] call CBA_fnc_addKeybind;

#ifdef DISABLE_COMPILE_CACHE
[
    "TBMod",
    QEGVAR(key,recompile),
    "Recompiled alle Skripte",
    {
        systemChat "### RECOMPILE ###";
        diag_log "### RECOMPILE ###";
        [] call ACE_PREP_RECOMPILE;

        #ifdef ENABLE_PERFORMANCE_COUNTERS
        [] call ace_common_fnc_dumpPerformanceCounters;
        systemChat "### PerformanceCounters in RPT ###";
        #endif

        false
    },
    {},
    [DIK_Q, [true, true, true]], // STRG + ALT + SHIFT + Q
    false,
    0,
    true
] call CBA_fnc_addKeybind;
#endif

// Shortcuts für LVL 3
if !(getPlayerUID ACE_player in (call TB_lvl3)) exitWith {};

[
    "TBMod",
    QEGVAR(key,zeusCreate),
    "Zeus erstellen",
    {
        private _zeusModule = ACE_player getVariable ["TB_Admin_Zeus", objNull];

        if (isNull _zeusModule) then
        {
            if (!isNull (getAssignedCuratorLogic ACE_player)) exitWith {systemChat "Du hast bereits einen Zeus!"};
            ["TB_addZeus", ACE_player] call CBA_fnc_serverEvent;
        }
        else
        {
            deleteVehicle _zeusModule;
            ACE_player setVariable ["TB_Admin_Zeus", nil];
            ["TB_informAdminsAndZeus", ["%1 ist kein Zeus mehr", profileName]] call CBA_fnc_globalEvent;
            systemChat "Zeus gelöscht";
        };
    },
    {},
    [DIK_END, [false, false, true]] // ALT + ENDE
] call CBA_fnc_addKeybind;
