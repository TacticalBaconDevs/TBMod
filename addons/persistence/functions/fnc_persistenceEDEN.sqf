#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define HITPOINTS [["hitengine", "Enh_damageEngine"], ["hitgun", "Enh_damageGun"], ["hitfuel", "Enh_damageFuelTank"], ["hitturret", "Enh_damageTurret"], ["hithull", "Enh_hull"], ["hitrglass", "Enh_damageWindows"], ["hitglass1", "Enh_damageWindows1"], ["hitglass2", "Enh_damageWindows2"], ["hitglass3", "Enh_damageWindows3"], ["hitglass4", "Enh_damageWindows4"], ["hitglass5", "Enh_damageWindows5"], ["hitglass6", "Enh_damageWindows6"], ["hitlfwheel", "Enh_damageLFWheel"], ["hitrfwheel", "Enh_damageRFWheel"], ["hitlf2wheel","Enh_damageLF2Wheel"], ["hitrf2wheel", "Enh_damageRF2Wheel"], ["hitlmwheel", "Enh_damageLMWheel"], ["hitrmwheel", "Enh_damageRMWheel"], ["hitlbwheel", "Enh_damageLBWheel"], ["hitrbwheel", "Enh_damageRBWheel"], ["hitbody", "Enh_damageVehBody"], ["hitltrack", "Enh_damageLTrack"], ["hitrtrack","Enh_damageRTrack"], ["hitavionics", "Enh_damageAvionics"], ["hitrrotor", "Enh_damageMainRotor"], ["hitvrotor", "Enh_damageTailRotor"], ["hitengine2", "Enh_engine2"], ["hitfuel2", "Enh_fuel2"], ["hitlaileron", "Enh_hitlaileron"], ["hitraileron", "Enh_hitraileron"], ["hitlcrudder", "Enh_hitlcrudder"], ["hitrrudder", "Enh_hitrrudder"], ["hitlcelevator", "Enh_hitlcelevator"], ["hitrelevator", "Enh_hitrelevator"], ["#gear_f_lights", "Enh_gear_f_lights"]]
params [
        ["_name", "", [""]],
        ["_addToEditor", false, [false]]
    ];
if (!is3DEN) exitWith {systemChat "[TBMod_persistence] Nur im Eden Editor verfügbar."};
if (_name == "") exitWith {systemChat "[TBMod_persistence] Kein Name angegeben"};

(profileNamespace getVariable [format ["TBMod_persistence_%1", _name], [[], [], [], []]]) params ["", "_markers", "_objecte", "_vehicles"];

if (!_addToEditor) then
{
    delete3DENEntities ((all3DENEntities select 0) select {!((_x get3DENAttribute "ControlMP") select 0 || (_x get3DENAttribute "ControlSP") select 0)});
    delete3DENEntities (all3DENEntities select 5);
};

// Markers
private _newMarker = "";
{
    _x params ["_marker", "_pos", "_color", "_size", "_type", "_alpha", "_brush", "_dir", "_shape", "_text"];

    _newMarker = create3DENEntity ["Marker", _type, ASLToATL _pos];
    _newMarker set3DENAttribute ["markerName", _marker];
    _newMarker set3DENAttribute ["baseColor", _color];
    _newMarker set3DENAttribute ["size2", _size];
    _newMarker set3DENAttribute ["markerType", _shape];
    _newMarker set3DENAttribute ["alpha", _alpha];
    _newMarker set3DENAttribute ["brush", _brush];
    _newMarker set3DENAttribute ["rotation", _dir];
    _newMarker set3DENAttribute ["text", _text]; // TODO: wird nicht angezeigt, obwohl es hier gesetzt wird, in der Console geht dieser Code mit Text
}
forEach _markers;

// Objects
private _obj = nil;
{
    _x params ["_classname", "_pos", "_dir", "_up", "_sim"];

    _obj = create3DENEntity ["Object", _classname, ASLToATL _pos, true];
    if (isNil "_obj") then
    {
        systemChat format ["[TBMod_persistence] Error creating object %1", _classname];
    }
    else
    {
        _obj set3DENAttribute ["rotation", [_dir, _up] call FUNC(vector2Eden)];
        _obj set3DENAttribute ["enableSimulation", _sim];
    };
}
forEach _objecte;

// Vehicles
private _vehicle = nil;
{
    _x params ["_class", "_pos", "_dir", "_up", "_sim", "", "", "_dmg", "", "_fuel", "_crew"];

    _vehicle = create3DENEntity ["Object", _class, ASLToATL _pos, (_crew select 1) isEqualTo []];
    if (isNil "_vehicle") then
    {
        systemChat format ["[TBMod_persistence] Error creating vehicle %1", _class];
    }
    else
    {
        _vehicle set3DENAttribute ["rotation", [_dir, _up] call FUNC(vector2Eden)];
        _vehicle set3DENAttribute ["fuel", _fuel];
        _vehicle set3DENAttribute ["enableSimulation", _sim];

        if !(_dmg isEqualTo []) then
        {
            _dmg params ["_hitNames", "_dmgValues"];

            private _part = "";
            private _index = -1;
            {
                _part = _x;
                _index = (HITPOINTS findIf {(_x select 0) == _part});

                if (_index != -1) then
                {
                    _vehicle set3DENAttribute [(HITPOINTS select _index) select 1, _dmgValues select _forEachIndex];
                };
            }
            forEach _hitNames;
        };
    };
}
forEach _vehicles;

systemChat format["[TBMod_persistence] Save mit Namen '%1' wurde in 3den geladen!", _name];
