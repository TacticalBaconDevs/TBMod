/*
  TB_EOS_fnc_shk_pos - Random position generator for Arma 2
  Author: Shuko (IRC: shuko@quakenet, Email: miika@miikajarvinen.fi)
  Version: 0.1
  MODIFIED BY: shukari [TacticalBacon.de]
  
  Parameters for marker area based position:
    Area              String              Marker to define area from which the position is taken.
    Water             Boolean             Allow position on water? Optional, default is false.
  
  Usage examples:
    myPos = ["markerName"] execvm "TB_EOS_fnc_shk_pos.sqf";
    myPos = ["myMarker1",true] execvm "TB_EOS_fnc_shk_pos.sqf";
*/
params ["_area", ["_water", false]];

(getMarkerPos _area) params ["_cx", "_cy"];
_cx = abs _cx;
_cy = abs _cy;

(getMarkerSize _area) params ["_rx", "_ry"];

private _ad = (markerDir _area) * -1;
private _cd = cos _ad;
private _sd = sin _ad;

private _loop = true;
private _pos = [0,0,0];
while {_loop} do
{
    private _tx = (random (_rx * 2)) - _rx;
    private _ty = (random (_ry * 2)) - _ry;
    private _xo = if (_ad != 0) then {_cx + (_cd * _tx - _sd * _ty)} else {_cx + _tx};
    private _yo = if (_ad != 0) then {_cy + (_sd * _tx + _cd * _ty)} else {_cy + _ty};
    _pos = [_xo, _yo, 0];
    
    if (_water) then
    {
        _loop = false;
    }
    else
    {
        _loop = surfaceIsWater [_pos select 0,_pos select 1];
    };
};

_pos
