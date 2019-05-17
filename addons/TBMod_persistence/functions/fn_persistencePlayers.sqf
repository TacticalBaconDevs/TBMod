#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_save", false, [false]],
        ["_storagearray", [], []]
    ];

if (_save) then
{
    if (isNil "TB_disconnectCache") then {TB_disconnectCache = []};
    {
        private _unit = _x;
        private _uid = getPlayerUID _unit;

        private _pos = getPosASL _unit;
        _pos set [2, (_pos select 2) + 0.5];

        private _array = [
            _uid,
            getUnitLoadout _unit,
            _pos,
            getDir _unit,
            _unit getVariable ["TB_arsenalType", ""],
            _unit getVariable ["TB_rolle", ""],
            group _unit,
            _unit getVariable ["TB_team", "MAIN"]
        ];

        private _find = [TB_disconnectCache, _uid] call BIS_fnc_findNestedElement;
        if (_find isEqualTo []) then
        {
            TB_disconnectCache pushBack _array;
        }
        else
        {
            TB_disconnectCache set [_find select 0, _array];
        };
    }
    forEach allPlayers;

    _storagearray = TB_disconnectCache;
    publicVariable "TB_disconnectCache";
}
else // load
{
    TB_disconnectCache = _storagearray;
    publicVariable "TB_disconnectCache";

    {
        private _find = [TB_disconnectCache, getPlayerUID _x] call BIS_fnc_findNestedElement;
        if !(_find isEqualTo []) then
        {
            (TB_disconnectCache select (_find select 0)) params ["_uid", "_gear", "_pos", "_dir", "_arsenalType", "_rolle", "_group", "_team"];

            [_x] joinSilent _group;

            if !(_rolle isEqualTo "" || _arsenalType isEqualTo "") then
            {
                _x setVariable ["TB_arsenalType", _arsenalType, true];
                [_rolle, _arsenalType, objNull, false] remoteExec [QEFUNC(arsenal,changeRolle), _x];
            };

            _x setUnitLoadout _gear;

            _x setVariable ["TB_team", _team, true];
            _x assignTeam _team;

            [_x, false] remoteExec ["allowDamage", _x];
            _x setDir _dir;
            _x setPosASL _pos;

            _x spawn
            {
                uiSleep 10;
                [_this, true] remoteExec ["allowDamage", _this];
            };
        };
    }
    forEach allPlayers;
};

(format ["[TBMod_persistence] Positionen aller Spieler wurden ge%1.", ["laden und gesetzt", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;
