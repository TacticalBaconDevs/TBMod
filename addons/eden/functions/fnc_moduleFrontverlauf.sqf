#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];

if (!is3DEN && {_mode == "init"} && {_isActivated}) then
{
    private _gridSize = _logic getVariable ["gridSize", 100];
    (getPos _logic) params ["_posX", "_posY"];
    (_logic getVariable ["objectarea", []]) params [["_width", 500], ["_height", 500]];

    private _start = [_posX - _width, _posY + _height];
    private _ende = [_posX + _width, _posY - _height];
    private _gridHalb = _gridSize / 2;

    _start params ["_startX", "_startY"];
    _startX = _startX - (_startX % _gridHalb);
    _startY = _startY - (_startY % _gridHalb);
    if (_startX % _gridSize == 0) then {_startX = _startX - _gridHalb};
    if (_startY % _gridSize == 0) then {_startY = _startY + _gridHalb};

    _ende params ["_endeX", "_endeY"];
    _endeX = _endeX - (_endeX % _gridHalb);
    _endeY = _endeY - (_endeY % _gridHalb);
    if (_endeX % _gridSize == 0) then {_endeX = _endeX + _gridHalb};
    if (_endeY % _gridSize == 0) then {_endeY = _endeY - _gridHalb};

    private _markers = [];

    for "_iX" from _startX to _endeX step _gridSize do
    {
        for "_iY" from _startY to _endeY step -_gridSize do
        {
            _markers pushBack [_iX, _iY]
        };
    };

    if (count _markers > 1500) then
    {
        private _msg = format ["ACHTUNG, es sollen über 1500 Gitterzonen (derzeit: %1) erstellt werden,
            das ist zuviel, vergrößere die Gittergröße!", count _markers];
        systemChat _msg;
        hint _msg;
    };

    private _randomSalt = random 999999;
    private _activateTime = _logic getVariable ["activateTime", 60];
    private _timeoutArray = [_activateTime * 0.7, _activateTime, _activateTime * 1.3, false];
    private _unknowColor = _logic getVariable ["unknownColor", "ColorUNKNOWN"];
    private _gridAlpha = _logic getVariable ["gridAlpha", 0.7];
    private _gridType = _logic getVariable ["gridType", "Solid"];
    private _area = [getPos _logic];
    _area append (_logic getVariable ["objectarea",[]]);
    private _playerSide = _logic getVariable ["playerSide", "opfor"];

    // Triggercode
    private _triggerHead = "
        private _list = thisList select {alive _x && (_x isKindOf 'CAManBase' || _x isKindOf 'LandVehicle')};
        private _array = [];
        private _mostFactionColor = 'empty';
        private _player = (call CBA_fnc_players) param [0, objNull];

        if (!(_list isEqualTo []) && !isNull _player) then
        {
    ";

    if (_logic getVariable ["modus", "mostside"] == "mostside") then
    {
        _triggerHead = _triggerHead + "
            _array = [
                [west countSide _list, 'colorBLUFOR'],
                [east countSide _list, 'colorOPFOR'],
                [independent countSide _list, 'colorIndependent'],
                [civilian countSide _list, 'colorCivilian']
            ];

            _array sort false;

            _mostFactionColor = (_array select 0) select 1;
        ";
    };

    if (_logic getVariable ["modus", "most"] == "mostenemy") then
    {
        _triggerHead = _triggerHead + "
            private _enemys = [];
            private _friendly = [];
            private _playerSide = call compile '%4';
            {
                if ([_playerSide, _x] call BIS_fnc_sideIsFriendly) then {_friendly pushBack _x};
                if ([_playerSide, _x] call BIS_fnc_sideIsEnemy) then {_enemys pushBack _x};
            }
            forEach [opfor, independent, blufor];

            private _countEnemys = 0;
            {_countEnemys = _countEnemys + (_x countSide _list)} forEach _enemys;
            private _countFriendly = 0;
            {_countFriendly = _countFriendly + (_x countSide _list)} forEach _friendly;

            _mostFactionColor = if (_countEnemys >= _countFriendly) then {'colorOPFOR'} else {'colorBLUFOR'};
        ";
    };

    if (_logic getVariable ["modus", "most"] == "mostenemy_known") then
    {
        _triggerHead = _triggerHead + "
            _array = [
                [_player countFriendly _list, 'colorBLUFOR'],
                [_player countEnemy _list, 'colorOPFOR'],
                [_player countUnknown _list, 'ColorUNKNOWN']
            ];

            _array sort false;

            _mostFactionColor = (_array select 0) select 1;
        ";
    };

    if (_logic getVariable ["modus", "most"] == "enemyfree") then
    {
        _triggerHead = _triggerHead + "
            private _enemys = [];
            private _playerSide = call compile '%4';
            {
                if ([_playerSide, _x] call BIS_fnc_sideIsEnemy) then {_enemys pushBack _x};
            }
            forEach [opfor, independent, blufor];

            private _countEnemys = 0;
            {_countEnemys = _countEnemys + (_x countSide _list)} forEach _enemys;
            private _countFriendly = 0;

            _mostFactionColor = if (_countEnemys > 0) then {'colorOPFOR'} else {'colorBLUFOR'};
        ";
    };

    if (_logic getVariable ["modus", "most"] == "enemyfree_known") then
    {
        _triggerHead = _triggerHead + "
            _mostFactionColor = if (_player countEnemy _list > 0) then {'colorOPFOR'} else {'colorBLUFOR'};
        ";
    };

    private _triggerCode = _triggerHead + "
        };

        if (_mostFactionColor == 'empty') then
        {
            '%1' setMarkerColor '%3';
            '%1' setMarkerAlpha ((%2 - 0.2) max 0.1);
        }
        else
        {
            '%1' setMarkerColor _mostFactionColor;
            '%1' setMarkerAlpha %2;
            thisTrigger setVariable ['TB_mostFaction', _mostFactionColor];
        };
    ";

    private _triggerCondition = _triggerHead + "
        };

        private _triggerMost = thisTrigger getVariable ['TB_mostFaction', 'empty'];
        _triggerMost != _mostFactionColor && _mostFactionColor != 'empty'
    ";

    {
        _x params ["_iX", "_iY"];
        private _pos = [_iX, _iY];
        private _markerName = format ["trace_%1_%2_%3", _iX, _iY, _randomSalt];
        private _mkr = createMarker [_markerName, _pos];
        _mkr setMarkerShape "RECTANGLE";
        _mkr setMarkerBrush _gridType;
        _mkr setMarkerColor _unknowColor;
        _mkr setMarkerAlpha _gridAlpha;
        _mkr setMarkerSize [_gridHalb, _gridHalb];

        private _trg = createTrigger ["EmptyDetector", _pos, false];
        _trg setTriggerArea [_gridHalb, _gridHalb, 0, true];
        _trg setTriggerActivation ["ANY", "PRESENT", true];
        _tempTriggerCondition = format [_triggerCondition, _markerName, (_gridAlpha + 0.2) min 1, _unknowColor, _playerSide];
        _tempTriggerCode = format [_triggerCode, _markerName, (_gridAlpha + 0.2) min 1, _unknowColor, _playerSide];
        _trg setTriggerStatements [_tempTriggerCondition, _tempTriggerCode, ""];
        _trg setTriggerTimeout _timeoutArray;
    }
    forEach (_markers inAreaArray _area);
};
