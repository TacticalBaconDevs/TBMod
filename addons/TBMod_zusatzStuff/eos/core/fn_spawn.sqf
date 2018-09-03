if (!isServer) exitWith {{"[TBMod_zusatzStuff] EOS-SPAWN: nur auf Server ausführen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};
if (!canSuspend) exitWith {{"[TBMod_zusatzStuff] EOS-SPAWN: nur per spawn aufrufen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};

params [
        "_jipMkr",
        "_houseInfantry",
        "_infantry",
        "_LVeh",
        "_AVgrp",
        "_SVgrp",
        "_CHGrp",
        "_settings"
    ];

_houseInfantry params ["_hpPatrols", "_hpGroupSize", ["_hpGroupProbability", 100]];
_infantry params ["_PApatrols", "_PAgroupSize", ["_PAgroupProbability", 100]];
_LVeh params ["_LVehGroups", "_LVgroupSize", ["_LVgroupProbability", 100]];
_AVgrp params ["_AVehGroups", ["_AVgroupProbability", 100]];
_SVgrp params ["_SVehGroups", ["_SVgroupProbability", 100]];
_CHGrp params ["_CHGroups", "_CHgroupSize", ["_CHgroupProbability", 100]];

private _HPgroupArray = [1, 1];
if (_hpGroupProbability > floor (random 100)) then
{
    if (_hpGroupSize == 1) then {_HPgroupArray = [2, 4]};
    if (_hpGroupSize == 2) then {_HPgroupArray = [4, 8]};
    if (_hpGroupSize == 3) then {_HPgroupArray = [8, 12]};
    if (_hpGroupSize == 4) then {_HPgroupArray = [12, 16]};
    if (_hpGroupSize == 5) then {_HPgroupArray = [16, 20]};
}
else
{
    _hpPatrols = 0;
};

private _PAgroupArray = [1, 1];
if (_PAgroupProbability > floor (random 100)) then
{    
    if (_PAgroupSize == 1) then {_PAgroupArray = [2, 4]};
    if (_PAgroupSize == 2) then {_PAgroupArray = [4, 8]};
    if (_PAgroupSize == 3) then {_PAgroupArray = [8, 12]};
    if (_PAgroupSize == 4) then {_PAgroupArray = [12, 16]};
    if (_PAgroupSize == 5) then {_PAgroupArray = [16, 20]};
}
else
{
    _PApatrols = 0;
};    

private _LVgroupArray = [0, 0];
if (_LVgroupProbability > floor (random 100)) then
{
    if (_LVgroupSize == 1) then {_LVgroupArray = [2, 4]};
    if (_LVgroupSize == 2) then {_LVgroupArray = [4, 8]};
    if (_LVgroupSize == 3) then {_LVgroupArray = [8, 12]};
    if (_LVgroupSize == 4) then {_LVgroupArray = [12, 16]};
    if (_LVgroupSize == 5) then {_LVgroupArray = [16, 20]};
}
else
{
    _LVehGroups = 0;
};

if !(_AVgroupProbability > floor (random 100)) then {_AVehGroups = 0};

if !(_SVgroupProbability > floor (random 100)) then {_SVehGroups = 0};

private _CHgroupArray = [0, 0];
if (_CHgroupProbability > floor (random 100)) then
{
    if (_CHgroupSize == 1) then {_CHgroupArray = [2, 4]};
    if (_CHgroupSize == 2) then {_CHgroupArray = [4, 8]};
    if (_CHgroupSize == 3) then {_CHgroupArray = [8, 12]};
    if (_CHgroupSize == 4) then {_CHgroupArray = [12, 16]};
    if (_CHgroupSize == 5) then {_CHgroupArray = [16, 20]};
}
else
{
    _CHGroups = 0;
};

waitUntil {!isNil "tb_server" && {!isNull tb_server}};

{
    private _eosMarkers = tb_server getVariable ["EOSmarkers", []];
    _eosMarkers pushBack _x;
    tb_server setVariable ["EOSmarkers", _eosMarkers, true];
    
    [
        _x,
        [_hpPatrols, _HPgroupArray],
        [_PApatrols, _PAgroupArray],
        [_LVehGroups, _LVgroupArray],
        [_AVehGroups, _SVehGroups, _CHGroups, _CHgroupArray],
        _settings
    ] spawn TB_EOS_fnc_core;
}
forEach _jipMkr;
