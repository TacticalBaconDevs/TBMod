/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)
  
    Complete rewrite and modification:
        shukari
*/
params ["_mkr", "_veh", ["_parachuteJump", false]];
_veh params ["_vehicle", "", "_grp", "_cargoGrp"];

private _pos = [_mkr, false] call TB_EOS_fnc_shk_pos;
private _pad = createVehicle ["Land_HelipadEmpty_F", _pos, [], 0, "NONE"]; 

{_x allowFleeing 0} forEach ((units _grp) + (units _cargoGrp));        

private _wp1 = _grp addWaypoint [_pos, 0]; 

if (_parachuteJump) then
{
    _wp1 setWaypointType "SCRIPTED";
    _wp1 setWaypointScript "\achilles\functions_f_achilles\scripts\fn_wpParadrop.sqf";
    
    waitUntil {uiSleep 1; ({isNull (objectParent _x)} count (units _cargoGrp)) == 0};
}
else
{
    _wp1 setWaypointSpeed "FULL";  
    _wp1 setWaypointType "TR UNLOAD";
    _wp1 setWaypointStatements ["true", "(vehicle this) LAND 'GET OUT';"]; 
    
    waitUntil {uiSleep 1; _vehicle distance2D _pad < 40};
    _cargoGrp leaveVehicle _vehicle;
    waitUntil {uiSleep 1; ({isNull (objectParent _x)} count (units _cargoGrp)) == 0};
};

[_cargoGrp, _mkr] call TB_EOS_fnc_shk_patrol;

private _wp2 = _grp addWaypoint [[0,0,0], 0];  
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "{this deleteVehicleCrew _x} forEach (crew this); deleteVehicle this;"];  

deleteVehicle _pad;
