/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob ( https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/ )
  
    Complete rewrite and modification:
        shukari
*/
if (!isServer) exitWith {{"[TBMod_zusatzStuff] EOS-SPAWN: nur auf Server ausführen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};
if (!canSuspend) exitWith {{"[TBMod_zusatzStuff] EOS-SPAWN: nur per spawn aufrufen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};

params [
        ["_JIPmkr", [], [[]]],
        ["_infantry", [], [[]]],
        ["_LVeh", [], [[]]],
        ["_AVeh", [], [[]]],
        ["_CHVeh", [], [[]]],
        ["_settings", [], [[]]],
        ["_basSettings", [], [[]]]
    ];

_infantry params ["_papatrols", "_pagroupSize", ["_paPatrolsIncrease", 0], ["_paGroupSizeIncrease", 0]];
_LVeh params ["_lvvehGroups", "_lvgroupSize", ["_lvGroupsIncrease", 0], ["_lvGroupSizeIncrease", 0]];
_AVeh params ["_AVehGroups", ["_AVGroupsIncrease", 0]];
_CHVeh params ["_chGroups", "_chgroupSize", ["_chGroupsIncrease", 0], ["_chGroupSizeIncrease", 0]];

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
        _PAgroupArray,
        _LVgroupArray,
        [_AVehGroups, _AVGroupsIncrease],
        _CHgroupArray,
        _settings,
        _basSettings
    ] spawn TB_EOS_fnc_bastionCore;
}
forEach _JIPmkr;
