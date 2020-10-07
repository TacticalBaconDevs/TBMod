#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call FUNC(isTBMission)) exitWith {};

enableEnvironment [true, true];
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
    [] call FUNC(crashHelferClient);
    [] call FUNC(shortcuts);
    [] call FUNC(chatCommands);
    [] call FUNC(extremMedicMode);
    [] call FUNC(miscStuff);
    [] call FUNC(addBriefingEntries);
    [] call FUNC(firstJoin);
    [nil, false] call FUNC(safe);

    GVAR(initDone) = true;
    publicVariableServer QGVAR(initDone);
}] call CBA_fnc_addEventHandler;
