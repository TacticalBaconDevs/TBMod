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

format["[TBMod_persistence] Transfer von Variable %1 %2 Server gestartet", _name, ["vom", "zum"] select _toServer] remoteExecCall ["systemChat"];

if (_toServer) then
{
    
    [[_name], {
        params ["_name"];

        [[_name, profileNamespace getVariable [_name, []]], {
                params ["_name","_data"];

                profileNamespace setVariable [_name, _data];
                saveProfileNamespace;
                GVAR(transfer) = true;
                publicVariable QGVAR(transfer);
        }] remoteExecCall ["call", 2];
    }] remoteExecCall ["call", _client];
}
else
{
    [[_name, profileNamespace getVariable [_name, []]],
    {
        params ["_name","_data"];

        profileNamespace setVariable [_name, _data];
        saveProfileNamespace;
        GVAR(transfer) = true;
        publicVariable QGVAR(transfer);
    }] remoteExecCall ["call", _client];
};
waitUntil {GVAR(transfer)};
format["[TBMod_persistence] Transfer von Variable %1 %2 Server beendet", _name, ["vom", "zum"] select _toServer] remoteExecCall ["systemChat"];
