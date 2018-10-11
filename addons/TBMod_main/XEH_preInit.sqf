/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: shukari
*/
if !(call TB_fnc_isTBMission) exitWith {};

// Default Values
if (isNil "TB_extremSanisystem") then {TB_extremSanisystem = false};
if (isNil "TB_crashHelfer") then {TB_crashHelfer = true};
if (isNil "TB_doorBreach") then {TB_doorBreach = false};
if (isNil "TB_recoilCoef") then {TB_recoilCoef = 1};

// HeadlessClient - setGroupOwner Fix
["CAManBase", "Local", {
    params ["_entity", "_isLocal"];
    
    if (_isLocal && ((getUnitLoadout _entity) isEqualTo [[],[],[],[],[],[],"","",[],["","","","","",""]])) then
    {
        _entity setUnitLoadout (getUnitLoadout (typeOf _entity));
    };
}] call CBA_fnc_addClassEventHandler;
