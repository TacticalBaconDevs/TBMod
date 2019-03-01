/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

enableEnvironment [false, true];
enableSaving [false, false];

//CBA_XEH_expectedLoadingScreens
// ["CBA_XEH_loadingScreenStarted", {
    // params ["_loadingScreen"];
    // private _msg = format ["CBA_XEH_loadingScreenStarted: %1", _loadingScreen];
    // diag_log _msg;
    // systemChat _msg;
// }] call CBA_fnc_addEventHandler;

// ["CBA_XEH_loadingScreenEnded", {
    // params ["_loadingScreen"];
    // private _msg = format ["CBA_XEH_loadingScreenEnded: %1", _loadingScreen];
    // diag_log _msg;
    // systemChat _msg;
// }] call CBA_fnc_addEventHandler;

["CBA_loadingScreenDone", {
    [] call TB_fnc_doorBreach;
    [] call TB_fnc_recoilSystem;
    [] spawn TB_fnc_crashHelferClient;
    [] spawn TB_fnc_shortcuts;
    [] call TB_fnc_chatCommands;
    [] call TB_fnc_extremMedicMode;
    [] spawn TB_fnc_miscStuff;
    [] call TB_fnc_addBriefingEntries;

    TB_init_done = true;
    publicVariableServer "TB_init_done";
}] call CBA_fnc_addEventHandler;
