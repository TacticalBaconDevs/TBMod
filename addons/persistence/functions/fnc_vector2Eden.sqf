#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )

    Return the Eden X Y Rotation of an object by its VectorDirAndUp
    Credit: Ian Banks @foxhound.international

    Modification by http://tacticalbacon.de
*/
params [
        ["_vectorDir", [0,0,0], []],
        ["_vectorUp", [0,0,0], []]
    ];

private _result = [0,0,0];
private _aside = _vectorDir vectorCrossProduct _vectorUp;
_aside params ["", "_asideY", "_asideZ"];

_vectorDir params ["_dirX"];
_vectorUp params ["_upX", "_upY", "_upZ"];

if (abs _upX < 0.999999) then
{
    _yRot = -asin _upX;
    _signCosY = if (cos _yRot < 0) then {-1} else {1};
    _xRot = (_upY * _signCosY) atan2 (_upZ * _signCosY);
    _zRot = (_dirX * _signCosY) atan2 (_aside select 0 * _signCosY);

    _result = [_xRot, _yRot, _zRot];
}
else
{
    _zRot = 0;

    if (_upX < 0) then
    {
        _yRot = 90;
        _xRot = _asideY atan2 _asideZ;
    }
    else
    {
        _yRot = -90;
        _xRot = (-_asideY) atan2 (-_asideZ);
    };

    _result = [_xRot, _yRot, _zRot];
};

_result;
