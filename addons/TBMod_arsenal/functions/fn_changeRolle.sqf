/*
    Author: shukari
*/
params ["_rolle", "_arsenalType", "_target", ["_loadGear", true]];

ACE_player setVariable ['TB_rolle', _rolle, true];
[_rolle] call TB_fnc_setAttributes;

// CrashHelper
if (isNull _target) then {
    if (_arsenalType in ["", "CUSTOM"]) exitWith {};
    
    {
        if (_arsenalType == getText (configFile >> "CfgVehicles" >> typeOf _x >> "arsenalType")) exitWith
        {
            _target = _x;
        };
    }
    forEach vehicles;
    
    [_target, _rolle] call TB_fnc_setArsenal;
} else {
    [_target, _rolle] call TB_fnc_setArsenal;
};

systemChat format ["Du bist nun: %1 (%2)", [_rolle] call TB_fnc_getRollenName, _arsenalType];

if (_loadGear) then
{
    removeAllWeapons player;
    removeAllItems player;
    removeAllAssignedItems player;
    removeUniform player;
    removeVest player;
    removeBackpack player;
    removeHeadgear player;
    removeGoggles player;
    
    [] call TB_fnc_loadDefault;
};
