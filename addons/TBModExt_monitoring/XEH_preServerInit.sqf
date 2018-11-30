/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};
//if !(isDedicated) exitWith {};
//if (getMissionConfigValue ["performanceTest", 0] != 1) exitWith {};

"TBModExt_Monitoring" callExtension missionName;

TB_extensionQueue = [];
if (isNil "TB_intervall") then {TB_intervall = 60};

// Scriptlag Check - EndlossCode in Scheduled Enviroment
//TB_sl = 0;
//[] spawn {waitUntil {TB_sl = TB_sl + 1; false}};


[{
    //TB_extensionQueue pushBack ["scriptlag", TB_sl]; TB_sl = 0;
    TB_extensionQueue pushBack ["fps", diag_fps];
    TB_extensionQueue pushBack ["minfps", diag_fpsMin];
    
    TB_extensionQueue pushBack ["allKI", {!isPlayer _x} count allUnits];
    TB_extensionQueue pushBack ["simKI", {!isPlayer _x && simulationEnabled _x} count allUnits];
    TB_extensionQueue pushBack ["allVehicles", count vehicles];
    TB_extensionQueue pushBack ["simVehicles", {simulationEnabled _x} count vehicles];
    TB_extensionQueue pushBack ["allEntities", count (entities [[], [], true, true])];
    TB_extensionQueue pushBack ["simEntities", {simulationEnabled _x} count (entities [[], [], true, true])];
    
    TB_extensionQueue pushBack ["activeScripts", (diag_activeScripts select 0) + (diag_activeScripts select 1) + (diag_activeScripts select 2) + (diag_activeScripts select 3)];
    TB_extensionQueue pushBack ["activeSQF", count diag_activeSQFScripts];
}, TB_intervall] call CBA_fnc_addPerFrameHandler;


// FSM CPS
execFSM "\TBModExt_monitoring\monitor.fsm";


// Send to Extension
[{
    if !(TB_extensionQueue isEqualTo []) then
    {
        "TBModExt_Monitoring" callExtension ["sendQueue", TB_extensionQueue];
        TB_extensionQueue = [];
    };
}, TB_intervall] call CBA_fnc_addPerFrameHandler;
