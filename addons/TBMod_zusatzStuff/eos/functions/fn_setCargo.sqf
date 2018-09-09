/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author:
        bangabob (https://forums.bohemia.net/forums/topic/144150-enemy-occupation-system-eos/)
  
    Complete rewrite and modification:
        shukari
*/
if (!isServer) exitWith {};

params [
        "_vehicle",
        "_grpSize",
        "_side",
        "_faction",
        "_cargoType"
    ];


private _cargoPool = [_faction, _cargoType] call TB_EOS_fnc_unitPools;
private _emptySeats = _vehicle emptyPositions "cargo";
private _grp = createGroup _side;

if (_emptySeats > 0) then
{
    if (_grpSize > _emptySeats) then {_grpSize = _emptySeats};

    for "_i" from 1 to _grpSize do
    {                    
        private _unit = _grp createUnit [selectRandom _cargoPool, [0,0,0], [], 0, "CAN_COLLIDE"];
        _unit moveInAny _vehicle;
    };
};

_grp
