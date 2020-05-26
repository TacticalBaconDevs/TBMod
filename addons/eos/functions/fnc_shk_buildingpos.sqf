#include "../script_component.hpp"
/*
  SHK_buildingpos.sqf
  Shuko of LDD Kyllikki (kyllikki.fi)
  IRC: shuko @ quakenet
  Version: 0.12
  MODIFIED BY: shukari [TacticalBacon.de]
*/
params [
        "_opos",
        "_men",
        "_rad"
    ];

if !(isServer) exitWith {systemChat "[TBMod_eos] EOS: SHK_buildingpos nur auf dem Server ausführen"};

private _bpos = [];
{
    _bpos append (_x buildingPos -1);
}
forEach (nearestObjects [_opos, ["House", "Building"], _rad]);

{
    if (_bpos isEqualTo []) exitWith {systemChat "[TBMod_eos] EOS: Es gibt zuwenig Gebäude zum Besetzen!"};
    private _pos = selectRandom _bpos;
    _bpos = _bpos - [_pos];

    private _dir = abs (((_pos select 0) - (_opos select 0)) atan2 ((_pos select 1) - (_opos select 1)));
    _x setFormDir _dir;
    _x setDir _dir;
    _x setPos _pos;

    doStop _x;
    [_x, "UP"] remoteExecCall ["setUnitPos", _x];
    [_x, "PATH"] remoteExecCall ["disableAI", _x];
}
forEach _men;
