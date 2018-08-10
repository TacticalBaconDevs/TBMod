//LV_fnc_ACAIkilled.sqf - removed dead bodies and wrecks when in valid distance

params ["_unit"];
private _sUnits = _unit getVariable ["syncedUnit", []];
private _dissapearDistance = _unit getVariable ["dissapearDistance", 100];

if !(_unit getVariable ["LV_KEEP", false]) then {
    if (isMultiplayer) then {_sUnits = _sUnits append (call TB_LV_fnc_getPlayers)};
    
    private _nsUnit = objNull;
    if !(_sUnits isEqualTo []) then {
        _nsUnit = _sUnits#0;
        {
            if (_x distance _unit < _nsUnit distance _unit) then {
                _nsUnit = _x;
            };
        } forEach _sUnits;
    };    
        
    if (!isNull _nsUnit && {(_unit distance _nsUnit) > _dissapearDistance}) exitWith {
        deleteVehicle _unit;
    };
};