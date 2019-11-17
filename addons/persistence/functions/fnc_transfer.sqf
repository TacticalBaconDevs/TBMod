#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_name", "", []],
        ["_client", 0, []],
        ["_toServer", true, []]
    ];

if (_name == "") exitWith {"[TBMod_persistence] Kein Name angegeben" remoteExecCall ["systemChat"]};
if (!isServer) exitWith {"[TBMod_persistence] Transfer nur vom Server startbar." remoteExecCall ["systemChat"]};

GVAR(transfer) = false;
publicVariable QGVAR(transfer);

if (_toServer) then
{
    [[_name], {
        params ["_name"];

        [[_name, profileNamespace getVariable [format ["TBMod_persistence_%1", _name], []]], {
                params ["_name","_data"];

                profileNamespace setVariable [format ["TBMod_persistence_%1", _name], _data];
                private _savedNames = profileNamespace getVariable [QGVAR(savedNames), []];
                _savedNames pushBackUnique _name;
                profileNamespace setVariable [QGVAR(savedNames), _savedNames];

                saveProfileNamespace;
                GVAR(transfer) = true;
                publicVariable QGVAR(transfer);
        }] remoteExecCall ["call", 2];
    }] remoteExecCall ["call", _client];
}
else
{
    [[_name, profileNamespace getVariable [format ["TBMod_persistence_%1", _name], []]],
    {
        params ["_name","_data"];

        profileNamespace setVariable [format ["TBMod_persistence_%1", _name], _data];
        private _savedNames = profileNamespace getVariable [QGVAR(savedNames), []];
        _savedNames pushBackUnique _name;
        profileNamespace setVariable [QGVAR(savedNames), _savedNames];

        saveProfileNamespace;
        GVAR(transfer) = true;
        publicVariable QGVAR(transfer);
    }] remoteExecCall ["call", _client];
};

waitUntil {GVAR(transfer)}
