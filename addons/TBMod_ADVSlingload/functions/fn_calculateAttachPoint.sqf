/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Berechnet den außeren Punkt eines Object innerhalb der Sicht
    
    Arguments:
    0: Player <OBJECT>
    1: searchvector (vectorNormalized ((positionCameraToWorld [0, 0, 0.6]) vectorDiff (positionCameraToWorld [0, 0, 0])))
    
    Return Value:
    Position
*/
params ["_player", "_searchVector"];
//Sanity Checks
if (isNull _player) exitWith {systemChat format ["ERROR(calculateAttachPoint): _player %1  _searchVector %2 ", _player, _searchVector]};

private _startPos = eyepos _player; 
private _min = 0; 
private _max = 4; 

while {_max - _min >= 0.1} do
{
    private _testDistance = (_max + _min) / 2;
    private _testpos1 = _startPos vectorAdd (_searchVector vectorMultiply _testDistance);
    private _testpos2 = _startPos vectorAdd (_searchVector vectorMultiply _max);
    private _intersect1 = lineIntersects [_startPos, _testpos1, player];
    private _intersect2 = lineIntersects [_testpos1, _testpos2, player];
    
    if (_intersect1) then {_max = _testDistance};
    if (!_intersect1 && _intersect2) then {_min = _testDistance};
    if (!_intersect1 && !_intersect2) exitWith {false};
};

_startPos vectorAdd (_searchVector vectorMultiply ((_max + _min) / 2))
