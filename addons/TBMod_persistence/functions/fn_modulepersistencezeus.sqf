/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
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
            ["Ort", ["Server", "Lokal"], 0],
        ]] call Ares_fnc_showChooseDialog;
    if (_dialogResult isEqualTo []) exitWith {systemChat "[TBMod_persistence] Abbruch"};
    _dialogResult params ["_operation", "_ort"];

    private _save = _operation == 0;
    private _server = _ort == 0;
    private _saves = if (_server) then
    {
        [profileNamespace, "TB_persistence_savedNames", []] call BIS_fnc_getServerVariable;
    }
    else
    {
        profileNamespace getVariable ["TB_persistence_savedNames", []];
    };

    private _diagType = if (_save) then {["Save Name", "", ""]} else {["Save Name", _saves, 0]};
    _dialogResult = ["Persistence", [_diagType]] call Ares_fnc_showChooseDialog;
    if (_dialogResult isEqualTo []) exitWith {systemChat "[TBMod_persistence] Abbruch"};
    _dialogResult params ["_nameOrId"];

    if (_save) then
    {
        _saves pushBackUnique _nameOrId;

        if (_server) then
        {
            [true, _nameOrId] remoteExec ["TB_fnc_persistence", 2];
            [profileNamespace, "TB_persistence_savedNames", _saves] call BIS_fnc_setServerVariable;
        }
        else
        {
            [true, _nameOrId, true] call TB_fnc_persistence;
            profileNamespace setVariable ["TB_persistence_savedNames", _saves];
        };
    }
    else
    {
        [false, _saves select _nameOrId] remoteExec ["TB_fnc_persistence", 2];
    };
};

true;
