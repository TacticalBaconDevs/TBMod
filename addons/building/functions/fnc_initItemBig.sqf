#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    "_building",
    ["_resourcen", 50]
];

_building setVariable ["TB_building_addInfos", [_resourcen], true];

private _bbr = boundingBoxReal _building;
private _range = (((abs (((_bbr # 1) # 1) - ((_bbr # 0) # 1))) / 2) max ((abs (((_bbr # 1) # 0) - ((_bbr # 0) # 0))) / 2)) min 9;
private _typeOf = typeOf _building;

private _pickupAction = [
    format ["destroy_%1_%2", _typeOf, random 999999],
    "Zurückbauen",
    "",
    {
        params ["_target", "_player", "_argumente"];
        _argumente params ["_building", "_resourcen"];

        ((nearestObjects [ACE_player, [], 50]) select {(_x getVariable ["TBMod_Building_resourcenCargo", -1]) >= 0}) params [["_truck", objNull]];
        if (isNull _truck) exitWith {systemChat "Kein Resourcentruck in der Nähe"};

        _truck setVariable ["TBMod_Building_resourcenCargo", (_truck getVariable ["TBMod_Building_resourcenCargo", 0]) + round (_resourcen / 2), true];

        deleteVehicle _target;
    },
    {((ACE_player getVariable ['ACE_IsEngineer', 0]) in [true, 1, 2] || (ACE_player getVariable ['TB_rolle', '']) == 'pionier') && 'ToolKit' in ([ACE_player] call ace_common_fnc_uniqueItems)},
    nil,
    [_building, _resourcen],
    nil,
    (_range - 1) max 5
] call ace_interact_menu_fnc_createAction;

[_building, 0, ["ACE_MainActions"], _pickupAction] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", [0, -2] select isDedicated, true];

// Attribute
if (_typeOf in ["Land_Medevac_house_V1_F", "Land_MedicalTent_01_white_generic_open_F"]) then {_building setVariable ["ace_medical_isMedicalFacility", true, true]};
if (_typeOf in ["Land_BarGate_F"]) then {[_building, false] remoteExecCall ["allowDamage", _building]};
if (_typeOf in ["B_Slingload_01_Repair_F"]) then {_building enableRopeAttach false};
