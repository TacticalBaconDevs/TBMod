/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};
//if !(isDedicated) exitWith {};
//if (getMissionConfigValue ["performanceTest", 0] != 1) exitWith {};

"TBModExt_Monitoring" callExtension missionName;

TB_extensionQueue = [];

// EndlossCode in Scheduled Enviroment
// Scriptlag Check
[] spawn {
    TB_sl = 0; // kurzer Name
    
    [{
        private _slValue = TB_sl;
        TB_sl = 0;
        
        TB_extensionQueue pushBack ["scriptlag", _slValue];
    }, 5] call CBA_fnc_addPerFrameHandler;
    
    waitUntil
    {
        TB_sl = TB_sl + 1;
        false;
    };
};


// ServerFPS
TB_sf = [diag_fps, diag_fpsmin];
[{
    TB_sf params ["_diag_fps", "_diag_fpsmin"];
    TB_sf = [(_diag_fps + diag_fps) / 2, (_diag_fpsmin + diag_fpsmin) / 2];
}, 1] call CBA_fnc_addPerFrameHandler;

[{
    private _slValue = TB_sf;
    TB_sf = [diag_fps, diag_fpsmin];
    
    TB_extensionQueue pushBack ["fps", TB_sf];
}, 5] call CBA_fnc_addPerFrameHandler;


// FSM CPS
execFSM "\TBModExt_monitoring\monitor.fsm";


// Send to Extension
[{
    if !(TB_extensionQueue isEqualTo []) then
    {
        private _value = TB_extensionQueue;
        TB_extensionQueue = [];
        
        "TBModExt_Monitoring" callExtension ["sendQueue", _value];
    };
}, 5] call CBA_fnc_addPerFrameHandler;
