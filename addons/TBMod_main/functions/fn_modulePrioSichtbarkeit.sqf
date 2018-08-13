/*
    Author: Willi "shukari" Graff
*/
params ["_logic", "", "_activated"];

private _pos = getPos _logic;
private _local = local _logic;
deleteVehicle _logic;

if !(_local) exitWith {true};
if !(_activated) exitWith {true};

if (isNil "TB_featureType") then
{
    TB_featureType = [];
    publicVariable "TB_featureType";
};

{
    _x setFeatureType 0;
    [_x, 0] remoteExec ["setFeatureType"];
} forEach TB_featureType;

TB_featureType = [];
publicVariable "TB_featureType";

{
    if (_x setFeatureType 2) then {
        [_x, 2] remoteExec ["setFeatureType"];
        TB_featureType pushBackUnique _x;
    };
} forEach (nearestObjects [_pos, [], 300]);

publicVariable "TB_featureType";

true
