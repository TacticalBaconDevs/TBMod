#include "../script_macros.hpp"
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

if (_toserver) then {
    [[_name], 
    {
        params ["_name"];

        _transferData = profileNamespace getVariable [format ["TB_persistence_%1", _name], []];

        [[_name, _transferData], 
            {
                params ["_name","_data"];

                profileNamespace setVariable [format ["TB_persistence_%1", _name], _data];
                _savednames = profileNamespace getVariable [QGVAR(savedNames), []];
                _savednames pushBackUnique _name;
                profileNamespace setVariable [QGVAR(savedNames), _savednames];

                saveProfileNamespace;
                GVAR(transfer) = true;
                publicVariable QGVAR(transfer);
        }] remoteExecCall ["call", 2];
    }] remoteExecCall ["call", _client];
} else {
    _transferData = profileNamespace getVariable [format ["TB_persistence_%1", _name], []];
    [[_name, _transferData], 
    {
        params ["_name","_data"];

        profileNamespace setVariable [format ["TB_persistence_%1", _name], _data];
        _savednames = profileNamespace getVariable [QGVAR(savedNames), []];
        _savednames pushBackUnique _name;
        profileNamespace setVariable [QGVAR(savedNames), _savednames];

        saveProfileNamespace;
        GVAR(transfer) = true;
        publicVariable QGVAR(transfer);
    }] remoteExecCall ["call", _client];
};

waitUntil {GVAR(transfer)}