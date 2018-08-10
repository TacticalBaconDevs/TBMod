/*
    Author: Willi "shukari" Graff
*/
private _units = units (group ACE_player);

if (count _units <= 1) exitWith {systemChat "Du bist der einzigste in der Gruppe!"};

_units = _units apply {[ACE_player distance2D _x, _x]};
_units sort false;

[(_units select 0) select 1] spawn TB_fnc_teleport;
