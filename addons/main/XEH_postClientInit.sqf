#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

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
    [] call FUNC(doorBreach);
    [] call FUNC(recoilSystem);
    [] spawn FUNC(crashHelferClient);
    [] spawn FUNC(shortcuts);
    [] call FUNC(chatCommands);
    [] call FUNC(extremMedicMode);
    [] spawn FUNC(miscStuff);
    [] call FUNC(addBriefingEntries);
    [] spawn FUNC(firstJoin);
    [nil, false] call FUNC(safe);

    TB_init_done = true;
    publicVariableServer "TB_init_done";
}] call CBA_fnc_addEventHandler;
