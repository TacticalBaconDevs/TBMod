/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

// ### DevAbfrage
TB_serverBuild = productVersion select 3;
publicVariable "TB_serverBuild";


// ### CrashHelfer
TB_disconnectCache = [];
publicVariable "TB_disconnectCache";


// ### RECHTE & ChatCommands
TB_lvl3 = compileFinal (str [
    "_SP_PLAYER_",
    "76561198029318101", /* shukari */
    "76561198053478498", /* Sponst */
    "76561198040057152", /* Culli */
    "76561198047437015" /* BeLink */
]);
publicVariable "TB_lvl3";

TB_lvl2 = compileFinal (str ((call TB_lvl3) + [
    "76561198066861232" /* Darky */
]));
publicVariable "TB_lvl2";
