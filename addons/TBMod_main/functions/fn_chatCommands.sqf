/*
    Author: shukari
*/

systemChat "### ChatCommands initalisiert. Nutze #help für Hilfe.";
["help", {
    systemChat ("TB-Mod Version: "+ getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr"));
    systemChat "#tasten, #rechte, #zeus, #safe, #hideGroup, #setGroup";
}, "all"] call CBA_fnc_registerChatCommand;

["tasten", {
    systemChat "STRG + ENDE  -> [LVL2] GCAM";
    systemChat "SHIFT + ENDE -> [LVL2] TFAR vom Spieler lösen, folgt der ZeusCam";
    systemChat "ALT + ENDE   -> [LVL3] Zeus in der Mission erstellen";
}, "all"] call CBA_fnc_registerChatCommand;

["rechte", {
    if (getPlayerUID player in TB_lvl3) exitWith {systemChat "### Rechte Level -> LVL3 (Admin)"};
    if (getPlayerUID player in TB_lvl2) exitWith {systemChat "### Rechte Level -> LVL2 (Spezi)"};
    systemChat "### Rechte Level -> LVL1 (Normalo)"
}, "all"] call CBA_fnc_registerChatCommand;

["zeus", {
    systemChat format ["Aktive Zeus: %1", ((allCurators select {isPlayer (getAssignedCuratorUnit _x)}) apply {name _x}) joinString ", "];
}, "all"] call CBA_fnc_registerChatCommand;

["fps", {
    if (player in (call BIS_fnc_listCuratorPlayers)) then
    {
        TB_fpsMonitor_zeus = !TB_fpsMonitor_zeus;
        systemChat format ["Zeus-FPS ist nun %1aktiviert!", ["de", ""] select TB_fpsMonitor_zeus];
    };
}, "all"] call CBA_fnc_registerChatCommand;

["safe", {
    if (getPlayerUID player in (TB_lvl3 + TB_lvl2)) then 
    {
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
    };
}, "all"] call CBA_fnc_registerChatCommand;

["hideGroup", {
    if (getPlayerUID player in (TB_lvl3 + TB_lvl2)) then 
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
    if (getPlayerUID player in (TB_lvl3 + TB_lvl2)) then 
    {
        if (_this select 0 == "") exitWith {systemChat "Kein Name wurde angegeben!"};
        systemChat format ["Gruppe %1 heißt nun %2!", groupId group cursorObject, _this select 0];
        (group cursorObject) setGroupIdGlobal [_this select 0];
    };
}, "all"] call CBA_fnc_registerChatCommand;
