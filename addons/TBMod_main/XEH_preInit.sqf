/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

// Default Values
if (isNil "TB_extremSanisystem") then {TB_extremSanisystem = false};
if (isNil "TB_crashHelfer") then {TB_crashHelfer = true};
if (isNil "TB_doorBreach") then {TB_doorBreach = false};
if (isNil "TB_recoilCoef") then {TB_recoilCoef = 1.25};
if (isNil "TB_recoilStart") then {TB_recoilStart = 0.75};
if (isNil "TB_fpsMonitor_client") then {TB_fpsMonitor_client = true};
if (isNil "TB_fpsMonitor_zeus") then {TB_fpsMonitor_zeus = true};

["CAManBase", "Local", {
    params ["_entity", "_isLocal"];
    
    // HeadlessClient - setGroupOwner Fix
    if (_isLocal && (uniform _entity) isEqualTo "") then //((getUnitLoadout _entity) isEqualTo [[],[],[],[],[],[],"","",[],["","","","","",""]])
    {
        _entity setUnitLoadout (getUnitLoadout (typeOf _entity));
    };
    
    // UGL Limiter
    //if () then
    //{
        // TODO: ingame tests
    //};
}] call CBA_fnc_addClassEventHandler;
