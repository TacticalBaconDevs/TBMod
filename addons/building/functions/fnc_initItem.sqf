#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
    "_obj",
    "_item"
];

_obj setVariable ["TB_building_addInfos", [_item], true];

// Actions
private _pickupAction = [
    "pickupAction_" + _item,
    localize "STR_PLACE_PickUpAction",
    "",
    {
        params ["_target", "_player", "_argumente"];
        _argumente params ["_item"];

        deleteVehicle _target;
        _player addItem _item;
    },
    {true},
    nil,
    [_item],
    nil,
    4
] call ace_interact_menu_fnc_createAction;

[
    _obj,
    0,
    ["ACE_MainActions"],
    _pickupAction
] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", [0, -2] select isDedicated, true];

if !((typeOf _obj) in ["Land_PortableLight_single_F", "Land_MedicalTent_01_white_generic_open_F"]) then
{
    _obj enableSimulation false;
    [_obj, false] remoteExecCall ["enableSimulationGlobal", 2];
};

// Medic
if ((typeOf _obj) in ["Land_MedicalTent_01_white_generic_open_F", "Land_Stretcher_01_F", "Land_IntravenStand_01_2bags_F", "Land_MedicalTent_01_floor_light_F"]) then
{
    _obj setVariable ["ace_medical_isMedicalFacility", true, true];
};
