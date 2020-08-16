#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define BLACKLIST ["ACE_BFT_", "trace_", "tb_eos"]
params [
        ["_save", false, [false]],
        ["_storagearray", [], []]
    ];

if (_save) then
{
    {
        private _marker = _x;

        if (BLACKLIST findIf {([toLower _marker, toLower _x] call CBA_fnc_find) != -1} == -1 && markerShape _x != "POLYLINE") then
        {
            _storagearray pushBack (_marker call BIS_fnc_markerToString);
        };
    }
    forEach allMapMarkers;
}
else // load
{
    (allMapMarkers select {(_x select [0, 13]) == "_USER_DEFINED"}) call CBA_fnc_deleteEntity;
    (allMapMarkers select {private _marker = _x; BLACKLIST findIf {([toLower _marker, toLower _x] call CBA_fnc_find) != -1} == -1}) call CBA_fnc_deleteEntity;
    {
        _x call BIS_fnc_stringToMarker;
    }
    forEach _storagearray;
};

(format ["[TBMod_persistence] Marker wurden ge%1.", ["laden", "speichert"] select _save]) remoteExecCall ["systemChat"];
_storagearray;
