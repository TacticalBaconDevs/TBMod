#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
["help", {
    systemChat ("TB-Mod Version: "+ getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr"));
    systemChat "#tasten, #rechte, #zeus, #fps, #safe, #hideGroup, #setGroup, #kompass, #clearCache, #hideGUI";
}, "all"] call CBA_fnc_registerChatCommand;

["tasten", {
    systemChat "STRG + ENDE  -> [LVL2] GCAM";
    systemChat "SHIFT + ENDE -> [LVL2] TFAR vom Spieler lösen, folgt der ZeusCam";
    systemChat "ALT + ENDE   -> [LVL3] Zeus in der Mission erstellen";
}, "all"] call CBA_fnc_registerChatCommand;

["rechte", {
    if (getPlayerUID player in (call TB_lvl3)) exitWith {systemChat "### Rechte Level -> LVL3 (Admin)"};
    if (getPlayerUID player in (call TB_lvl2)) exitWith {systemChat "### Rechte Level -> LVL2 (Spezi)"};
    systemChat "### Rechte Level -> LVL1 (Normalo)"
}, "all"] call CBA_fnc_registerChatCommand;

["zeus", {
    systemChat format ["Aktive Zeus: %1", ((allCurators select {isPlayer (getAssignedCuratorUnit _x)}) apply {name (getAssignedCuratorUnit _x)}) joinString ", "];
}, "all"] call CBA_fnc_registerChatCommand;

["fps", {
    if (player in (call BIS_fnc_listCuratorPlayers)) then
    {
        TB_fpsMonitor_zeus = !TB_fpsMonitor_zeus;
        systemChat format ["Zeus-FPS ist nun %1aktiviert!", ["de", ""] select TB_fpsMonitor_zeus];
    }
    else
    {
        systemChat "Dieser Befehl ist nur für ZeusSpieler relevant!";
    };
}, "all"] call CBA_fnc_registerChatCommand;

["safe", {
    if (getPlayerUID player in (call TB_lvl2)) then
    {
        switch (_this select 0) do {
            case "1":
            {
                [true] remoteExec [QFUNC(safe)];
                systemChat "SafeStart wurde global aktiviert!";
            };
            case "0":
            {
                [false] remoteExec [QFUNC(safe)];
                systemChat "SafeStart wurde global deaktiviert!";
            };
            default
            {
                systemChat format ["SafeStart wurde global %1aktiviert!", ["de", ""] select (isNil "TB_safeInfo")];
                [isNil "TB_safeInfo"] remoteExec [QFUNC(safe)];
            };
        };

        ["TB_informAdminsAndZeus", ["%1 hat den SAFE Status geändert!", profileName]] call CBA_fnc_globalEvent;
    };
}, "all"] call CBA_fnc_registerChatCommand;

["hideGroup", {
    if (getPlayerUID player in (call TB_lvl2)) then
    {
        switch (_this select 0) do {
            case "1":
            {
                (group player) setVariable ["ace_map_hideBlueForceMarker", true, true];
                systemChat "Gruppe ist nun unsichtbar!";
            };
            case "0":
            {
                (group player) setVariable ["ace_map_hideBlueForceMarker", false, true];
                systemChat "Gruppe ist nun unsichtbar!";
            };
            default
            {
                systemChat format ["Gruppe ist nun %1sichtbar!", ["un", ""] select ((group player) getVariable ["ace_map_hideBlueForceMarker", false])];
                (group player) setVariable ["ace_map_hideBlueForceMarker", !((group player) getVariable ["ace_map_hideBlueForceMarker", false]), true];
            };
        };
    };
}, "all"] call CBA_fnc_registerChatCommand;

["setGroup", {
    if (getPlayerUID player in (call TB_lvl2)) then
    {
        params ["_grpName"];
        if (_grpName == "") exitWith {systemChat "Kein Name wurde angegeben!"};

        private _unit = cursorObject;
        if (!isPlayer _unit) then {_unit = objNull};
        if (isNull _unit) then {_unit = ACE_player};

        systemChat format ["Gruppe '%1', mit Leader %3, heißt nun '%2'!", groupId (group _unit), _grpName, name (leader _unit)];
        (group _unit) setGroupIdGlobal [_grpName];
    };
}, "all"] call CBA_fnc_registerChatCommand;

["clearCache", {
    if (getPlayerUID player in (call TB_lvl3)) then
    {
        params ["_target"];
        [] remoteExec [QEFUNC(persistence,clearCache), [player, 2] select (_target == "server")];
    }
    else
    {
        systemChat "Nicht deine Gehaltsstufe!";
    };
}, "all"] call CBA_fnc_registerChatCommand;

["hideGUI", {
    diwako_dui_main_toggled_off = !diwako_dui_main_toggled_off;
    ["diwako_dui_main_hudToggled", [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
    systemChat format ["HUD ist nun %1", ["sichtbar" , "unsichtbar"] select diwako_dui_main_toggled_off];
}, "all"] call CBA_fnc_registerChatCommand;
