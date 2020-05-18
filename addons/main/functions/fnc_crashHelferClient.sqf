#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (!GVAR(crashHelfer) && _input) then {GVAR(crashHelfer) = true};
if (!GVAR(crashHelfer)) exitWith {};

[
    {!isNil "TB_disconnectCache"},
    {
        private _find = [TB_disconnectCache, getPlayerUID player] call BIS_fnc_findNestedElement;
        if !(_find isEqualTo []) then
        {
            (TB_disconnectCache select (_find select 0)) params ["_uid", "_gear", "_pos", "_dir", "_arsenalType", "_rolle", "_group", "_team"];

            [player] joinSilent _group;

            if !(_rolle isEqualTo "" || _arsenalType isEqualTo "") then {
                player setVariable ["TB_arsenalType", _arsenalType, true];
                [_rolle, _arsenalType, objNull, false] call EFUNC(arsenal,changeRolle);
            };

            player setUnitLoadout _gear;

            [
                "Spawnmethode auswählen",
                [
                    [
                        "LIST",
                        "Spawnmethode",
                        [[], ["zur Gruppe", "zum Crashort", "nichts machen"], 0, 3]
                    ]
                ],
                {
                    params ["_values", "_args"];
                    _values params ["_id"];
                    _args params ["_uid", "_gear", "_pos", "_dir", "_arsenalType", "_rolle", "_group", "_team"];

                    player setVariable ["TB_team", _team, true];
                    player assignTeam _team;

                    player allowDamage false;

                    if (_id == 0) then
                    {
                        if ({if (alive _x && {_x != player}) exitWith {[_x] spawn FUNC(teleport); 1}; false} count (units (group player)) == 0) then
                        {
                            systemChat "Nicht möglich, keine lebenden Personen zum Teleporten da, zurück zur alten Pos!";
                            player setDir _dir;
                            player setPosASL _pos;
                        };
                    };

                    if (_id == 1) then
                    {
                        player setDir _dir;
                        player setPosASL _pos;
                    };

                    [] spawn
                    {
                        uiSleep 10;
                        player allowDamage true;
                    };
                },
                {},
                TB_disconnectCache select (_find select 0)
            ] call zen_dialog_fnc_create;
        };
    }
] call CBA_fnc_waitUntilAndExecute;
