/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)
  
    Complete rewrite and modification:
        shukari
*/
params [
        "_position",
        "_side",
        "_faction",
        "_type"
    ];

private _vehiclePool = [_faction, _type] call TB_EOS_fnc_unitPools;
if (_vehiclePool isEqualTo []) exitWith {[]};

_vehiclePool params ["_vehicleType"];
[_position, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle;
