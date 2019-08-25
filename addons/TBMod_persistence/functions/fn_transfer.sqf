#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_name", "", []],
        ["_toServer", true, []]
    ];

if (_name == "") exitWith {"[TBMod_persistence] Kein Name angegeben" remoteExecCall ["systemChat"]};

GVAR(transfer) = false;
publicVariable QGVAR(transfer);

if (_toserver) then {
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
    }] remoteExec ["call", 2];

} else {
    
    [[_name, ACE_player], 
    {
        params ["_name", "_target"];

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
        }] remoteExec ["call", _target];
    }] remoteExec ["call", 2];
};

waitUntil {GVAR(transfer)}