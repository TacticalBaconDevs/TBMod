#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
GVAR(transfer) = false;
publicVariable QGVAR(transfer);

[[ACE_player], 
{
    params ["_target"];

    _transferData = profileNamespace getVariable [QGVAR(savedNames), []];

    [[_transferData], 
    {
        params ["_data"];

        GVAR(savedNamesServer) = _data;

        GVAR(transfer) = true;
        publicVariable QGVAR(transfer);
    }] remoteExec ["call", _target];
}] remoteExec ["call", 2];


waitUntil {GVAR(transfer)};
GVAR(savedNamesServer);