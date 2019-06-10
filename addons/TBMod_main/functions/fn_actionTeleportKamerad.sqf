#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _units = units (group ACE_player);

if (count _units <= 1) exitWith {systemChat "Du bist der einzige in der Gruppe!"};

_units = _units apply {[ACE_player distance2D _x, _x]};
_units sort false;

[(_units select 0) select 1] spawn FUNC(teleport);
