/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
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
    // Konverter String to Array
    // {
        // private _value = _logic getVariable _x;
        // if (!isNil "_value" && _value isEqualType "") then {_logic setVariable [_x, call compile _value]};
    // }
    // forEach [];
    
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

    if (count _markers > 1500) then {
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
        
        private _trg = createTrigger ["EmptyDetector", _pos];
        _trg setTriggerArea [_gridHalb, _gridHalb, 0, true];
        _trg setTriggerActivation ["ANY", "PRESENT", true];
        _trg setTriggerStatements ["this", format ["
            private _list = thisList select {_x isKindOf 'CAManBase'};
            if (_list isEqualTo []) exitWith {};
            
            private _array = [
                [west countSide _list, 'colorBLUFOR'],
                [east countSide _list, 'colorOPFOR'],
                [independent countSide _list, 'colorIndependent'],
                [civilian countSide _list, 'colorCivilian']
            ];
            
            _array sort false;
            
            '%1' setMarkerColor ((_array select 0) select 1);
            '%1' setMarkerAlpha %2;
        ", _markerName, (_gridAlpha + 0.1) min 1], ""];
        _trg setTriggerTimeout _timeoutArray;
    }
    forEach (_markers inAreaArray _area);
};
