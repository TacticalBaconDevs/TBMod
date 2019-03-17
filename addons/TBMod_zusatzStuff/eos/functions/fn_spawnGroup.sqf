/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)

    Complete rewrite and modification:
        shukari
*/
if (!isServer) exitWith {};

params [
        "_pos",
        "_grpSize",
        "_faction",
        "_side"
    ];

private _isWater = surfaceiswater _pos;
private _pool = [_faction, parseNumber _isWater] call TB_EOS_fnc_unitPools;

if (_isWater && {_pool isEqualTo []}) then
{
    {(format ["[WARN][EOS][spawnGroup] es sind keine diver definiert -> surfaceWater %2 -> %1", _this, _isWater]) remoteExecCall [_x]} forEach ["systemChat", "diag_log"];
    _pool = [_faction, 0] call TB_EOS_fnc_unitPools;
};

if (isNil "_pool" || {_pool isEqualTo []}) exitWith
{
    {(format ["[ERROR][EOS][spawnGroup] pool ist leer/kaputt -> surfaceWater %2 -> %1", _this, _isWater]) remoteExecCall [_x]} forEach ["systemChat", "diag_log"];
    grpNull;
};

private _grp = createGroup [_side, true];
for "_i" from 1 to round (_grpSize) do
{
    _grp createUnit [selectRandom _pool, _pos, [], 6, "FORM"];
};

_grp allowFleeing 0;

_grp
