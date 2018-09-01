if (!isServer) exitWith {};

params ["_vehicle", "_grpSize" , "_grp", "_faction", "_cargoType"];

private _cargoPool = [_faction, _cargoType] call eos_fnc_getunitpool;
private _side = side (leader _grp);
private _emptySeats = _vehicle emptyPositions "cargo";

_grpSize params ["_grpMin", "_grpMax"];             
private _r = floor(random (_grpMax - _grpMin));                            
private _grpSize = _r + _grpMin;

if (_emptySeats > 0) then
{
    if (_grpSize > _emptySeats) then {_grpSize = _emptySeats};                    

    for "_i" from 1 to _grpSize do
    {                    
        (selectRandom _cargoPool) createUnit [getPos _vehicle, _grp];
    };
    
    {_x moveInCargo _vehicle} forEach (units _grp);
};                        
