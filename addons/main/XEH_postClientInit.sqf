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

// HeadlessClient
#ifdef DEBUG_MODE_FULL
GVAR(activeSimManager) = true;
#endif
if (GVAR(activeSimManager)) then
{
    #ifdef DEBUG_MODE_FULL
    [
        "SimManager",
        {
            private _units = allUnits - allPlayers;

            private _return = [];
            _return pushBack (format ["hcManagers: %1", GVAR(hcManagers)]);
            _return pushBack (format ["simUnits: %1 / %2", {simulationEnabled _x} count _units, count _units]);

            _return joinString "<br/>";
        },
        [2]
    ] call ace_common_fnc_watchVariable;
    #endif

    if (!isMultiplayer || (!hasInterface && !isDedicated)) then
    {
        if (isNil QGVAR(hcManagers)) then {GVAR(hcManagers) = []};
        GVAR(hcManagers) pushBackUnique player;
        GVAR(hcManagers) = GVAR(hcManagers) select {!isNil "_x" || {isNull _x}};
        publicVariable QGVAR(hcManagers);

        TRACE_1("simManager start",GVAR(hcManagers));
        [{call FUNC(simManager)}, 5] call CBA_fnc_addPerFrameHandler;
    };
};

// Normaler Client
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
