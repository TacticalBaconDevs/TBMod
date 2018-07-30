/*
	Author: Willi "shukari" Graff
*/
params ["_logic", "", "_activated"];

private _pos = getPos _logic;
deleteVehicle _logic;

if !(local _logic) exitWith {};
if !(_activated) exitWith {};

if (isNil "TB_featureType") then
{
    TB_featureType = [];
    publicVariable "TB_featureType";
};

{
    _x setFeatureType 0;
    [_x, 0] remoteExec ["setFeatureType"];
} forEach TB_featureType;

{
    if (_x setFeatureType 2) then {
        [_x, 2] remoteExec ["setFeatureType"];
        TB_featureType pushBackUnique _x;
    };
} forEach (nearestObjects [_pos, [], 500]);

publicVariable "TB_featureType";

true
