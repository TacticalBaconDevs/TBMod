if (!isServer) exitWith {{"[TBMod_zusatzStuff] EOS-SPAWN: nur auf Server ausführen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};
if (!canSuspend) exitWith {{"[TBMod_zusatzStuff] EOS-SPAWN: nur per spawn aufrufen" remoteExecCall [_x]} forEach ["systemChat", "diag_log"]};

params [
        ["_JIPmkr", [], [[]]],
        ["_infantry", [], [[]]],
        ["_LVeh", [], [[]]],
        ["_AVeh", [], [[]]],
        ["_SVeh", [], [[]]],
        ["_settings", [], [[]]],
        ["_basSettings", [], [[]]]
    ];

_infantry params [["_PApatrols", 0, [0]], ["_PAgroupSize", 0, [0]]];
_LVeh params [["_LVehGroups", 0, [0]], ["_LVgroupSize", 0, [0]]];
_AVeh params [["_AVehGroups", 0, [0]]];
_SVeh params [["_CHGroups", 0, [0]], ["_CHgroupSize", 0, [0]]];

private _PAgroupArray = [1, 1];
if (_PAgroupSize == 1) then {_PAgroupArray = [2 ,4]};
if (_PAgroupSize == 2) then {_PAgroupArray = [4, 8]};
if (_PAgroupSize == 3) then {_PAgroupArray = [8, 12]};
if (_PAgroupSize == 4) then {_PAgroupArray = [12, 16]};
if (_PAgroupSize == 5) then {_PAgroupArray = [16, 20]};


private _LVgroupArray = [1, 1];
if (_LVgroupSize == 1) then {_LVgroupArray = [2, 4]};
if (_LVgroupSize == 2) then {_LVgroupArray = [4, 8]};
if (_LVgroupSize == 3) then {_LVgroupArray = [8, 12]};
if (_LVgroupSize == 4) then {_LVgroupArray = [12, 16]};
if (_LVgroupSize == 5) then {_LVgroupArray = [16, 20]};

private _CHgroupArray = [0, 0];
if (_CHgroupSize == 1) then {_CHgroupArray = [2, 4]};
if (_CHgroupSize == 2) then {_CHgroupArray = [4, 8]};
if (_CHgroupSize == 3) then {_CHgroupArray = [8, 12]};
if (_CHgroupSize == 4) then {_CHgroupArray = [12, 16]};
if (_CHgroupSize == 5) then {_CHgroupArray = [16, 20]};

waitUntil {!isNil "tb_server" && {!isNull tb_server}};

{
    private _eosMarkers = tb_server getVariable ["EOSmarkers", []];
    _eosMarkers pushBack _x;
    tb_server setVariable ["EOSmarkers", _eosMarkers, true];
    
    [
        _x,
        [_PApatrols, _PAgroupArray],
        [_LVehGroups, _LVgroupArray],
        [_AVehGroups],
        [_CHGroups, _CHgroupArray],
        _settings,
        _basSettings
    ] spawn TB_EOS_fnc_bastionCore;
}
forEach _JIPmkr;
