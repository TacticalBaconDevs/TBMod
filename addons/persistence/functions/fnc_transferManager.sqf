#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    ["_savename", "", []],
    ["_toServer", false , [false]]
];

if (_savename == "") exitWith {"[TBMod_persistence] Kein Name angegeben" remoteExecCall ["systemChat"]};
if (!isServer) exitWith {"[TBMod_persistence] Transfer nur vom Server startbar." remoteExecCall ["systemChat"]};
if (!isRemoteExecuted) exitWith {"[TBMod_persistence] Transfer nur über remoteExec startbar." remoteExecCall ["systemChat"]}; // TODO: wird in persistence per call aufgerufen o.O

format["[TBMod_persistence] Transfer von Save %1 %2 Server gestartet", _name, ["vom", "zum"] select _toServer] remoteExecCall ["systemChat"];

[format ["TBMod_persistence_%1", _savename], remoteExecutedOwner, _toServer] call FUNC(transfer);
if(_toServer) then {
    private _savedNames = profileNamespace getVariable [QGVAR(savedNames), []];
    _savedNames pushBackUnique _savename;
    profileNamespace setVariable [QGVAR(savedNames), _savedNames];
    saveProfileNamespace;
}
else
{
    [[_savename],
    {
        params ["_name"];
        private _savedNames = profileNamespace getVariable [QGVAR(savedNames), []];
        _savedNames pushBackUnique _name;
        profileNamespace setVariable [QGVAR(savedNames), _savedNames];
        saveProfileNamespace;
        GVAR(transfer) = true;
        publicVariable QGVAR(transfer);
    }] remoteExecCall ["call", remoteExecutedOwner];
};
waitUntil {GVAR(transfer)};
format["[TBMod_persistence] Transfer von Save %1 %2 Server beendet", _name, ["vom", "zum"] select _toServer] remoteExecCall ["systemChat"];