/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob ( https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/ )
  
    Complete rewrite and modification:
        shukari
        Eric Ruhlnd
*/
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

_houseInfantry params ["_hpPatrols", "_hpGroupSize", ["_hpPatrolsIncrease", 0], ["_hpGroupSizeIncrease", 0]];
_infantry params ["_papatrols", "_pagroupSize", ["_paPatrolsIncrease", 0], ["_paGroupSizeIncrease", 0]];
_LVeh params ["_lvvehGroups", "_lvgroupSize", ["_lvGroupsIncrease", 0], ["_lvGroupSizeIncrease", 0]];
_AVgrp params ["_AVehGroups", ["_AVGroupsIncrease", 0]];
_SVgrp params ["_SVehGroups", ["_SVGroupsIncrease", 0]];
_CHGrp params ["_chGroups", "_chgroupSize", ["_chGroupsIncrease", 0], ["_chGroupSizeIncrease", 0]];

private _HPgroupArray = [_hpPatrols, _hpGroupSize, _hpPatrolsIncrease, _hpGroupSizeIncrease];
private _PAgroupArray = [_paPatrols, _paGroupSize, _paPatrolsIncrease, _paGroupSizeIncrease];
private _LVgroupArray = [_lvPatrols, _lvGroupSize, _lvPatrolsIncrease, _lvGroupSizeIncrease];
private _CHgroupArray = [_chGroups, _chgroupSize, _chGroupsIncrease, _chGroupSizeIncrease];



waitUntil {!isNil "tb_server" && {!isNull tb_server}};

{
    private _eosMarkers = tb_server getVariable ["EOSmarkers", []];
    _eosMarkers pushBack _x;
    tb_server setVariable ["EOSmarkers", _eosMarkers, true];
    
    [
        _x,
        _HPgroupArray,
        _PAgroupArray,
        _LVgroupArray,
        [_AVehGroups, _AVGroupsIncrease], 
        [_SVehGroups, _SVGroupsIncrease], 
        _CHgroupArray,
        _settings
    ] spawn TB_EOS_fnc_core;
}
forEach _jipMkr;
