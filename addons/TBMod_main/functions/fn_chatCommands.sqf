/*
    Author: Willi "shukari" Graff
*/

systemChat "### ChatCommands initalisiert. Nutze #help für Hilfe.";
["help", {
    systemChat ("TB-Mod Version: "+ getText (configfile >> "CfgPatches" >> "TBMod_main" >> "versionStr"));
    systemChat "#tasten, #rechte, #zeus";
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
    private _zeusNames = "";
    {
        _zeusNames = format ["%1%2, ", _zeusNames, name getAssignedCuratorUnit _x];
    } forEach allCurators;
    systemChat ("Aktive Zeus: "+ _zeusNames);
}, "all"] call CBA_fnc_registerChatCommand;
