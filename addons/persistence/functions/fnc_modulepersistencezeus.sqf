#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if (!local _logic || !_activated) exitWith {true};
deleteVehicle _logic;

[
    "Persistence",
    [
        [
            "COMBO",
            ["Operation", "Auswahl ob gespeichert oder geladen werden soll."],
            [[0, 1], ["Speichern", "Laden"], 0],
            true
        ],
        [
            "COMBO",
            ["Ort", "Auswahl wo gespeichert bzw her geladen werden soll."],
            [[0, 1], ["Lokal", "Server"], 0],
            true
        ]
    ],
    {
        _this spawn { // TODO: colleren Weg finden
            params ["_values", "_args"];
            _values params ["_operation", "_ort"];
            _args params ["_ping"];

            private _save = _operation == 0;
            private _server = _ort == 1;

            private _saves = if (_server) then
            {
                call FUNC(getSavedNamesFromServer);
            }
            else
            {
                profileNamespace getVariable [QGVAR(savedNames), []];
            };

            if (!_save && {_saves isEqualTo []}) exitWith {systemChat "Keine Saves zum Laden verfügbar!"};

            private _diagType = if (_save) then
            {
                ["EDIT", "Speichername", [""], true];
            }
            else
            {
                ["COMBO", "Speichername", [_saves, _saves, (count _saves) - 1], true];
            };

            [
                "Persistence",
                [_diagType],
                {
                    params ["_values", "_args"];
                    _values params ["_name"];
                    _args params ["_ping", "_save", "_server"];

                    if (_ping) then
                    {
                        [_save, _name, !_server] remoteExec [QFUNC(persistence), 2];
                    }
                    else
                    {
                        if (_save) then
                        {
                            [true, _name, false, true] spawn FUNC(persistence);
                        }
                        else
                        {
                            systemChat "Server kann nicht erreicht werden. Laden nicht möglich";
                        };
                    };
                },
                {},
                [_ping, _save, _server]
            ] call zen_dialog_fnc_create;
        };
    },
    {},
    [call FUNC(ping)]
] call zen_dialog_fnc_create;

true;
