/*
 	Author: Willi "shukari" Graff
*/
params [
	"_obj",
	["_resourcen", 50]
];

_obj setVariable ["TB_building_addInfos", [_resourcen], true];

// Actions
private _bbr = boundingBoxReal _obj;
private _range = ((abs (((_bbr select 1) select 1) - ((_bbr select 0) select 1))) / 2) max ((abs (((_bbr select 1) select 0) - ((_bbr select 0) select 0))) / 2);

private _pickupAction = [
	format ["destroy_%1_%2", typeOf _obj, random 999999],
	"Zurückbauen",
	"",
	{
		params ["_target", "_player", "_argumente"];
		_argumente params ["_obj", "_resourcen"];
		
		private _trucks = (nearestObjects [ACE_player, [], 50]) select {(_x getVariable ["TBMod_Building_PlaceablesCargo", -1]) >= 0};
		if (_trucks isEqualTo []) exitWith {systemChat "Kein Resourcentruck in der Nähe!"};
		private _truck = _trucks select 0;

		_truck setVariable ["TBMod_Building_PlaceablesCargo", (_truck getVariable ["TBMod_Building_PlaceablesCargo", 0]) + round (_resourcen / 2), true];
		
		deleteVehicle _target;
	},
	{(ACE_player getVariable ['ACE_IsEngineer', 0]) > 0 && (ACE_player getVariable ['TB_rolle', '']) == 'pionier' && ("ToolKit" in (items ACE_player))},
	nil,
	[_obj, _resourcen],
	nil,
	(_range - 1) max 5
] call ace_interact_menu_fnc_createAction;

[
	_obj,
	0,
	["ACE_MainActions"],
	_pickupAction
] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", [0, -2] select isDedicated, true];

// Medic
if ((typeOf _obj) in ["Land_Medevac_house_V1_F", "Land_MedicalTent_01_white_generic_open_F"]) then
{
    _obj setVariable ["ace_medical_isMedicalFacility", true, true];
};

// Antenne
if ((typeOf _obj) in ["Land_TTowerSmall_1_F"]) then
{
    [_obj, 10000] call TFAR_antennas_fnc_initRadioTower;
};

// Antenne
if ((typeOf _obj) in ["Land_BarGate_F"]) then
{
    [_obj, false] remoteExecCall ["allowDamage", _obj];
};

// Repair
if ((typeOf _obj) in ["B_Slingload_01_Repair_F"]) then
{
    _obj enableRopeAttach false;
};
