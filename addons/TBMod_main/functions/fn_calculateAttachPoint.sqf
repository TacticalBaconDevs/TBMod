/*
    Author: Eric Ruhland
    Berechnet den außeren Punkt eines Object innerhalb der Sicht
    Parameter:
    1: Player
    2: searchvector  vectorNormalized ((positionCameraToWorld [0,0,0.6]) vectorDiff (positionCameraToWorld [0,0,0]))
    Rückgabe:
       Position
*/
params ["_player", "_searchvector"];

_startpos = eyepos _player; 
private _min = 0; 
private _max = 4; 


while{ _max -_min >= 0.1} do {
_testdistance = (_max+_min)/2;
_testpos1 = _startpos vectorAdd (_searchvector vectorMultiply _testdistance );
_testpos2 = _startpos vectorAdd (_searchvector vectorMultiply _max );
_intersect1 = lineIntersects [ _startpos , _testpos1, player];
_intersect2 = lineIntersects [ _testpos1 ,_testpos2 , player];
if (_intersect1 && !_intersect2) then {
    _max = _testdistance;
};
if (!_intersect1 && _intersect2) then {
    _min = _testdistance;
};
if (_intersect1 && _intersect2) then {
    _max = _testdistance;
};
if (!_intersect1 && !_intersect2) exitWith {
    false;
};
};
_result = _startpos vectorAdd (_searchvector vectorMultiply (_max+_min)/2);
_result;
