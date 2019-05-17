#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];

if (!is3DEN && {_mode == "init"} && {_isActivated}) then
{
    // Check for LZ Module
    private _syncObjs = (synchronizedObjects _logic) select {_x isKindOf "TB_eden_atmoReinforcementLZ" || _x isKindOf "TB_eden_atmoLZ"};
    if (_syncObjs isEqualTo []) exitWith {systemChat "AtmoCore-Modul braucht ein AtmoLZ-Modul gesynct!"};
    private _lzLogic = selectRandom _syncObjs;

    // Check for EndPoints Module
    _syncObjs = ((synchronizedObjects _lzLogic) + (synchronizedObjects _logic)) select {_x isKindOf "TB_eden_atmoReinforcementEndpoint" || _x isKindOf "TB_eden_endpoint"};
    if (_syncObjs isEqualTo []) exitWith {systemChat "AtmoCore-Modul braucht mindestens ein AtmoEndpoint-Modul gesynct!"};
    private _endPoint = selectRandom _syncObjs;

    // Check for Vehicle
    _syncObjs = ((synchronizedObjects _lzLogic) + (synchronizedObjects _logic)) select {_x isKindOf "Air" || _x isKindOf "LandVehicle"};
    if (_syncObjs isEqualTo []) exitWith {systemChat "AtmoCore-Modul braucht ein leeres Fahrzeug gesynct!"};
    private _vehicle = selectRandom _syncObjs;
    _vehicle setVariable ["acex_headless_blacklist", true, true];

    if (_vehicle isKindOf "Air") then
    {
        if ((entities "HeliH") isEqualTo []) then
        {
            private _heli = createVehicle ["Land_HelipadSquare_F", [0,0,0], [], 0, "CAN_COLLIDE"];
            _heli setDir (getDir _lzLogic);
            _heli setPos (getPos _lzLogic);
        };
        _vehicle flyInHeight 40;
    };

    // Crew up if empty
    private _grp = grpNull;
    if ((crew _vehicle) isEqualTo []) then
    {
        _grp = createGroup west;
        createvehiclecrew _vehicle;
        (crew _vehicle) joinsilent _grp;
        _grp addVehicle _vehicle;
    }
    else
    {
        _grp = group ((crew _vehicle) select 0);
    };
    _grp setVariable ["acex_headless_blacklist", true, true];

    // Setup Waypoints
    private _wp = _grp addWaypoint [getPos _logic, 50];
    _wp setWaypointType "MOVE";
    _wp setWaypointStatements ["true", format [QUOTE([this, %1] spawn FUNC(atmoCoreAction)), getPos _endPoint]];

    _wp = _grp addWaypoint [getPos _lzLogic, 5];
    _wp setWaypointType "TR UNLOAD";
    _wp setWaypointTimeout [5, 10, 20];

    _wp = _grp addWaypoint [getPos _lzLogic, 5];
    _wp setWaypointType "CYCLE";
};
