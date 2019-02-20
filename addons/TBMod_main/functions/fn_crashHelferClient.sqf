/*
    Author: shukari
*/
params [["_input", false, [false]]];

if (!TB_crashHelfer && _input) then {TB_crashHelfer = true};
if (!TB_crashHelfer) exitWith {};

waitUntil {!isNil "TB_disconnectCache"};
private _find = [TB_disconnectCache, getPlayerUID player] call BIS_fnc_findNestedElement;
if !(_find isEqualTo []) then
{
    (TB_disconnectCache select (_find select 0)) params ["_uid", "_gear", "_pos", "_dir", "_arsenalType", "_rolle", "_group", "_team"];
    
    [player] joinSilent _group;
    
    if !(_rolle isEqualTo "" || _arsenalType isEqualTo "") then {
        player setVariable ["TB_arsenalType", _arsenalType, true];
        [_rolle, _arsenalType, objNull, false] call TB_fnc_changeRolle;
    };

    player setUnitLoadout _gear;
    
    private _dialogResult = ["Spawnmethode auswählen", [
            ["COMBOBOX", "Spawnmethode", ["zur Gruppe", "zum Crashort", "nichts machen"], 0, true]
        ]] call Achilles_fnc_showChooseDialog;
    
    player setVariable ["TB_team", _team, true];
    player assignTeam _team;    
    
    if (_dialogResult isEqualTo []) exitWith {};
    _dialogResult params ["_id"];
    
    player allowDamage false;
    
    if (_id == 0) then
    {
        player setDir _dir;
        player setPosASL _pos;
    };
    
    if (_id == 1) then
    {
        if ({if (alive _x && {_x != player}) exitWith {[_x] spawn TB_fnc_teleport; 1}; false} count (units (group player)) == 0) then
        {
            systemChat "Nicht möglich, keine lebenden Personen zum Teleporten da, zurück zur alten Pos!";
            player setDir _dir;
            player setPosASL _pos;
        };
    };
    
    [] spawn
    {
        uiSleep 10;
        player allowDamage true;
    };
};
