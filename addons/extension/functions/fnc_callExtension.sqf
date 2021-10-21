#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    ["_alias", "host", [""]],
    ["_cmd", "", [""]],
    ["_data", nil, [[], ""]],
    ["_codeReturn", false, [false]]
];

// Darf nicht <Suspend> dann kommt nichts zurück
//if (!canSuspend) exitWith {"ERROR: Suspending not allowed in this contex"};

private _array = [_cmd];
if (!isNil {_data}) then {_array pushBack _data};

("TBModExtensionHost" callExtension [_alias, _array]) params ["_result", "_returnCode", "_errorCode"];
_result = if (_result select [0,1] == "[" && _result select [(count _result) - 1] == "]") then {parseSimpleArray _result} else {_result};

if (_errorCode < 0 || {_returnCode < 0}) then
{
    private _msg = format ["[TBMod_Extension][ERROR] Etwas ist schief gelaufen: %1 [%2 | %3] -> %4", _result, _errorCode, _returnCode, _this];
    diag_log _msg;
    systemChat _msg;
};

// TODO: Darf nicht <Suspend> dann kommt nichts zurück
/*if (_returnCode > 1) then
{
    _result = [_returnCode] call FUNC(getFromCache);
};*/

if (_codeReturn) then {_returnCode} else {_result};
