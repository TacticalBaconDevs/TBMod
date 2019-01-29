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
            ["Ort", ["Server", "Lokal"], 0]
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

    if (_save) then
    {
        _dialogResult params ["_name"];
        _saves pushBackUnique _name;

        if (_server) then
        {
            [true, _name] remoteExec ["TB_fnc_persistence", 2];
            [profileNamespace, "TB_persistence_savedNames", _saves] call BIS_fnc_setServerVariable;
            [] remoteExec ["saveProfileNamespace", 2];
        }
        else
        {
            [true, _name, true] call TB_fnc_persistence;
            profileNamespace setVariable ["TB_persistence_savedNames", _saves];
            saveProfileNamespace;
        };
    }
    else
    {
        _dialogResult params ["_id"];

        if (_server) then
        {
            [false, saves select _id] remoteExec ["TB_fnc_persistence", 2];
        }
        else
        {
            [false, saves select _id, true] call TB_fnc_persistence;
        };
    };
};

true;
