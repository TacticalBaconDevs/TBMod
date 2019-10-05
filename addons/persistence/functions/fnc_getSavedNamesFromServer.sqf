#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
GVAR(transfer) = false;
publicVariable QGVAR(transfer);

[[], {
    [profileNamespace getVariable [QGVAR(savedNames), []],
    {
        GVAR(savedNamesServer) = _this;
        GVAR(transfer) = true;
        publicVariable QGVAR(transfer);
    }] remoteExecCall ["call", remoteExecutedOwner];
}] remoteExecCall ["call", 2];

waitUntil {GVAR(transfer)};
GVAR(savedNamesServer);
