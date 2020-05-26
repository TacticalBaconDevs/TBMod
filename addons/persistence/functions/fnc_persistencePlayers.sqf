#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_save", false, [false]],
        ["_storagearray", [], []]
    ];

if (_save) then
{
    {[_x, nil, getPlayerUID _unit] call FUNC(handleDisconnect)} forEach allPlayers;
    [2, QGVAR(disconnectCache)/*, missionNamespace, true*/] call FUNC(transferVar);

    _storagearray = +GVAR(disconnectCache);
    GVAR(disconnectCache) = nil;
}
else // load
{
    [missionNamespace, [QGVAR(disconnectCache), _storagearray]] remoteExecCall ["setVariable", 2];
    {[false, false] call FUNC(crashHelferClient)} forEach allPlayers;
};

(format ["[TBMod_persistence] Positionen aller Spieler wurden ge%1.", ["laden und gesetzt", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;
