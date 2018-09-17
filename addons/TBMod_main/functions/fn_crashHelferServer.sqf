/*
    Author: shukari
*/
params [["_input", false, [false]]];

if (!TB_crashHelfer && _input) then {TB_crashHelfer = true};
if (!TB_crashHelfer) exitWith {};

addMissionEventHandler ["HandleDisconnect",
{
    params ["_unit", "", "_uid", ""];
    
    private _pos = getPosASL _unit;
    _pos set [2, (_pos select 2) + 0.5];
    
    private _array = [
            _uid,
            getUnitLoadout _unit,
            _pos,
            getDir _unit,
            _unit getVariable ["TB_arsenalType", ""],
            _unit getVariable ["TB_rolle", ""],
            group _unit,
            _unit getVariable ["TB_team", "MAIN"]
        ];
    
    private _find = [TB_disconnectCache, _uid] call BIS_fnc_findNestedElement;
    if (_find isEqualTo []) then
    {
        TB_disconnectCache pushBack _array;
    }
    else
    {
        TB_disconnectCache set [_find select 0, _array];
    };
    
    publicVariable "TB_disconnectCache";
    deleteVehicle _unit;
    
    false;
}];

["CBA_teamColorChanged", {
    params ["_unit", "_team"];
    _unit setVariable ["TB_team", _team];
}] call CBA_fnc_addEventHandler;
