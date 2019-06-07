/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
["help", {
    systemChat ("TB-Mod Version: "+ getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr"));
    systemChat "#tasten, #rechte, #zeus, #fps, #safe, #hideGroup, #setGroup, #kompass, #clearCache, #hideGUI, #spectator(s)";
}, "all"] call CBA_fnc_registerChatCommand;

["tasten", {
    systemChat "SHIFT + ENDE -> [LVL0] TFAR vom Spieler lösen, folgt der ZeusCam";
    systemChat "STRG + ENDE  -> [LVL2] GCAM";
    systemChat "SHIFT + STRG + ENDE -> [LVL2] Spectator";
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

["spectators", {
    systemChat format ["Spectator: %1", (([] call ace_spectator_fnc_players) select {alive _x}) apply {name _x}];
}, "all"] call CBA_fnc_registerChatCommand;

["hideGUI", {
    diwako_dui_main_toggled_off = !diwako_dui_main_toggled_off;
    ["diwako_dui_main_hudToggled", [diwako_dui_main_toggled_off]] call CBA_fnc_localEvent;
    systemChat format ["HUD ist nun %1", ["sichtbar" , "unsichtbar"] select diwako_dui_main_toggled_off];
}, "all"] call CBA_fnc_registerChatCommand;

if !(getPlayerUID player in (call TB_lvl2)) exitWith {};

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
    switch (_this select 0) do {
        case "1":
        {
            [true] remoteExec ["TB_fnc_safe"];
            systemChat "SafeStart wurde global aktiviert!";
        };
        case "0":
        {
            [false] remoteExec ["TB_fnc_safe"];
            systemChat "SafeStart wurde global deaktiviert!";
        };
        default
        {
            systemChat format ["SafeStart wurde global %1aktiviert!", ["de", ""] select (isNil "TB_safeInfo")];
            [isNil "TB_safeInfo"] remoteExec ["TB_fnc_safe"];
        };
    };

    ["TB_informAdminsAndZeus", ["%1 hat den SAFE Status geändert!", profileName]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;

["hideGroup", {
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
    
    ["TB_informAdminsAndZeus", ["%1 hat die Gruppe '%2' %3sichtbar gemacht!", profileName, groupId (group player), ["", "un"] select ((group player) getVariable ["ace_map_hideBlueForceMarker", false])]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;

["setGroup", {
    params ["_grpName"];
    if (_grpName == "") exitWith {systemChat "Kein Name wurde angegeben!"};

    private _unit = cursorObject;
    if (!isPlayer _unit) then {_unit = objNull};
    if (isNull _unit) then {_unit = ACE_player};

    systemChat format ["Gruppe '%1', mit Leader %3, heißt nun '%2'!", groupId (group _unit), _grpName, name (leader _unit)];
    ["TB_informAdminsAndZeus", ["%1 hat die Gruppe '%2' von %4 auf '%3' umbenannt!", profileName, groupId (group _unit), _grpName, name (leader _unit)]] call CBA_fnc_globalEvent;
    
    (group _unit) setGroupIdGlobal [_grpName];
}, "all"] call CBA_fnc_registerChatCommand;

["spectator", {
    //if (isNil "TB_spectator") then {TB_spectator = false};
    //TB_spectator = !TB_spectator;
    
    // https://ace3mod.com/wiki/framework/spectator-framework.html
    [allPlayers, []] call ace_spectator_fnc_updateUnits;
    [[side player], player call BIS_fnc_enemySides] call ace_spectator_fnc_updateSides;
    [[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
    [[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes;
    [2, player, -2] call ace_spectator_fnc_setCameraAttributes;
    [true, false, false] call ace_spectator_fnc_setSpectator;
    
    ["TB_informAdminsAndZeus", ["%1 hat den Spectator gestartet!", profileName]] call CBA_fnc_globalEvent;
    //systemChat format ["Spectator ist nun %1aktiviert!", ["de" , ""] select TB_spectator];
}, "all"] call CBA_fnc_registerChatCommand;

if !(getPlayerUID player in (call TB_lvl3)) exitWith {};

["clearCache", {
    params ["_target"];
    [] remoteExec ["TB_fnc_clearCache", [player, 2] select (_target == "server")];

   ["TB_informAdminsAndZeus", ["%1 hat den Cache gecleared (%2)!", profileName, ["Lokal", "Server"] select (_target == "server")]] call CBA_fnc_globalEvent;
}, "all"] call CBA_fnc_registerChatCommand;
