#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_fob"];

// bereits gesetzte löschen
{
    if !(_x isEqualTo _fob) then {deleteVehicle _x};
} forEach (entities (typeOf _fob));

if (isNil "TB_main_fobs") then {TB_main_fobs = []};
private _displayname = getText (configOf _fob >> "displayName");
TB_main_fobs set [getNumber (configOf _fob >> "fobNumber"), [_displayname, _fob]];
publicVariable "TB_main_fobs";

private _marker = createMarker [_displayname, getPos _fob];
_marker setMarkerText _displayname;
_marker setMarkerType "hd_flag";
(format ["%1 wurde errichtet!", _displayname]) remoteExecCall ["systemChat"];
