#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call EFUNC(main,isTBMission)) exitWith {};

// Warten auf Tasks
[{!isNil QGVAR(tasks)}, {
    GVAR(states) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(states);

    GVAR(loaded) = [];
    GVAR(pause) = false;
    GVAR(loadedTasks) = [GVAR(tasks)] call FUNC(loadTask);

    GVAR(taskLoop) = [LINKFUNC(loop), 1, GVAR(loadedTasks)] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_waitUntilAndExecute;
