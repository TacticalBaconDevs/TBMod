#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
params ["_mortarVeh", ["_desiredAngle", false, [false, 0]]];

private _vUp = vectorUp _mortarVeh;
(_vUp call CBA_fnc_vect2Polar) params ["", "_dir", "_elev"];

private _angleDiff = ((_dir - (getDir _mortarVeh)) + 180) % 360 - 180;

if (abs _angleDiff > 1) then
{
    _mortarVeh setDir _dir;
    _mortarVeh setVectorUp _vUp;
};

private _neededElev = (90 - _elev) / 180;
if (abs (_neededElev - (_mortarVeh animationPhase "level")) > 0.01) then
{
    _mortarVeh animate ["level", _neededElev, true];
};

if (_desiredAngle isEqualType 0) then
{
    private _angDiff = {
        params ["_a", "_b"];

        private _ret = _a - _b;
        while {_ret < -180} do {_ret = _ret + 360};
        while {_ret > 180} do {_ret = _ret - 360};
        _ret
    };

    private _dirFix = [_desiredAngle, getDir _mortarVeh] call _angDiff;

    if ((abs _dirFix) > 1) then
    {
        _mortarVeh animate ["dirFix", 0.5 - (_dirFix / 360), true];
    };
};
