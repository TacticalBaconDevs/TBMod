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
if (isNil "_vehiclePool" || {_vehiclePool isEqualTo []}) exitWith
{
    {(format ["[ERROR][EOS][spawnVehicle] pool ist leer/kaputt -> %1", _this]) remoteExecCall [_x]} forEach ["systemChat", "diag_log"];
    [];
};

_vehiclePool params ["_vehicleType", ""];
[_position, 0, _vehicleType, _side] call BIS_fnc_spawnVehicle;
