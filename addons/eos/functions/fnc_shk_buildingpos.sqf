#include "../script_component.hpp"
/*
  SHK_buildingpos.sqf
  Shuko of LDD Kyllikki (kyllikki.fi)
  IRC: shuko @ quakenet
  Version: 0.12
  MODIFIED BY: shukari [TacticalBacon.de]

  Syntax:
    nul = [position,unitList,radius,priority,height,disableMove,stance,hide] execvm "shk_buildingpos.sqf"

  Required Parameters:
    Origo        Position       Position from where building positions are searched for.
    Units        Array          Units to be moved.

  Optional Parameters:
    Radius       Integer        Range from the origo to look for building positions. Default is 20.
    Priority     Integer        Building position priority.
                   0:             Random, default value.
                   1:             Ground floor has highest prio, roof positions are last to be filled.
                   2:             Roof has top prio, ground level lowest.
    Height       Array          Filter for positions.
                   [min,max]    Minimum and maximum height from ground for valid positions.
    DisableMove  Boolean        Issues disableai "move" to all units.
    Stance       Boolean        Issues setunitpos "up" to all units.
    Hide         Array          Hiding does not prevent the units from detecting and engaging enemies.
                                It's only meant to be used for preventing the units being detected from far away.
                   Portition    Amount of units to be hidden. Valid values between 0 and 1;
                   Condition    Condition to reveal the hidden units.

  Examples:
    nul = [getpos hq,[man1,man2,man3]] execvm "shk_buildingpos.sqf"
    nul = [getpos house,[sniper1,sniper2],20,2] execvm "shk_buildingpos.sqf"
    nul = [getpos house,units grpAlpha,30,0,[1,4]] execvm "shk_buildingpos.sqf"
    nul = [getpos house,bmen1,20,0,[],true,true,[0.5,"SHK_revealHouseUnits"]] execvm "shk_buildingpos.sqf"

  Todo:
    Patrol (switch positions)
    Change prio (for example lower level units moves to roof)
    Position
      object: take pos and dir
      array: [[x,y,z],dir]
    Multiple unit groups per script. [[parameters],[parameters2],[parameters]]
      Goal is to get all units into one _men array.
*/
params [
        "_opos",
        "_men",
        "_rad"
    ];

if !(isServer) exitWith {};

private _bpos = [];
{
    _bpos append (_x buildingPos -1);
}
forEach (nearestObjects [_opos, ["House", "Building"], _rad]);

{
    if (_bpos isEqualTo []) exitWith {systemChat "[TB_eos] EOS: Es gibt zuwenig Gebäude zum Besetzen!"};
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
