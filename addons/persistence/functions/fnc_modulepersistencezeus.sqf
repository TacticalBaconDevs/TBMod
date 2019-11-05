#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_logic", "", "_activated"];

if !(local _logic) exitWith {true};
deleteVehicle _logic;
if !(_activated) exitWith {true};

[] spawn
{
    private _dialogResult = ["Persistence", [
            ["Operation", ["Speichern", "Laden"], 0],
            ["Ort", ["Server", "Lokal"], 0]
        ]] call Ares_fnc_showChooseDialog;
    if (_dialogResult isEqualTo []) exitWith {systemChat "[TBMod_persistence] Abbruch"};
    _dialogResult params ["_operation", "_ort"];

    private _save = _operation == 0;
    private _server = _ort == 0;
    private _saves = if (_server) then
    {
        call FUNC(getSavedNamesFromServer);
    }
    else
    {
        profileNamespace getVariable [QGVAR(savedNames), []];
    };

    private _diagType = if (_save) then {["Save Name", "", ""]} else {["Save Name", _saves, 0]};
    _dialogResult = ["Persistence", [_diagType]] call Ares_fnc_showChooseDialog;
    if (_dialogResult isEqualTo []) exitWith {systemChat "[TBMod_persistence] Abbruch"};
    if (call FUNC(ping)) then {
        if (_save) then
        {
            _dialogResult params ["_name"];
            [true, _name, !_server] remoteExec [QFUNC(persistence), 2];
        }
        else
        {
            _dialogResult params ["_id"];
            [false, _saves select _id, !_server] remoteExec [QFUNC(persistence), 2];
        };
    }
    else
    {
        if (_save) then
        {
            [true, _name, false, true] call FUNC(persistence);
        }
        else
        {
            systemChat "Server kann nicht erreicht werden. Laden nicht möglich";
        };
    };
};

true;
