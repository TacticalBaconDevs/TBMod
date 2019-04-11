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
    "TBMod_key_hideGUI",
    "Zeigt/Verbirgt die GUI",
    {
        ["diwako_dui_enable_compass", !diwako_dui_enable_compass] call CBA_settings_fnc_set;
        ["diwako_dui_namelist", !diwako_dui_enable_compass] call CBA_settings_fnc_set;
        systemChat format ["HUD ist nun %1", ["sichtbar" , "unsichtbar"] select !diwako_dui_enable_compass];
    },
    {},
    [DIK_J, [false, false, true]] // [Shift, Strg, Alt]
] call CBA_fnc_addKeybind;


// Shortcuts für LVL2
if !(getPlayerUID ACE_player in (call TB_lvl2)) exitWith {};

[
    "TBMod",
    "TBMod_key_gcam",
    "Öffnet GCAM",
    {

        [ACE_player] spawn TB_fnc_showGCAM;
        ["TB_informAdminsAndZeus", ["%1 hat GCAM gestartet!", profileName]] call CBA_fnc_globalEvent;
        systemChat "GCAM gestartet!";
    },
    {},
    [DIK_END, [false, true, false]] // STRG + ENDE
] call CBA_fnc_addKeybind;

[
    "TBMod",
    "TBMod_key_curatorCamEars",
    ["Zeusohren an/aus", "Du hörst entweder um deinen Spieler oder die ZeusCam"],
    {
        if (isNil "TB_main_spectator") then {TB_main_spectator = false};

        TB_main_spectator = !TB_main_spectator;

        //[ACE_player, TB_main_spectator] call TFAR_fnc_forceSpectator;
        ACE_player setVariable ["TFAR_curatorCamEars", TB_main_spectator, true];

        systemChat format ["TFAR-Spectator: %1", TB_main_spectator];
    },
    {},
    [DIK_END, [true, false, false]] // SHIFT + ENDE
] call CBA_fnc_addKeybind;


// Shortcuts für LVL 3
if !(getPlayerUID ACE_player in (call TB_lvl3)) exitWith {};


[
    "TBMod",
    "TBMod_key_zeusCreate",
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
