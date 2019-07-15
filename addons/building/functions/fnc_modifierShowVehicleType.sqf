#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_args", ""];
_args params ["_target", "_player", "_params", "_actionData"];

private _newActionName = [];

if (_target getVariable ["TBMod_Building_kranWagen", false]) then {_newActionName pushBack "Kra"};
if (_target getVariable ["TBMod_Building_resourcenCargo", -1] > 0) then {_newActionName pushBack "Res"};
if ([_target] call ace_medical_fnc_isMedicalVehicle) then {_newActionName pushBack "Med"};
if ([_target] call ace_repair_fnc_isRepairVehicle) then {_newActionName pushBack "Rep"};
if ([_target] call ace_refuel_fnc_getFuel > 0) then {_newActionName pushBack "Tan"};
if (_target getVariable ["ace_rearm_isSupplyVehicle", false] ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ace_rearm_defaultSupply") > 0) then {_newActionName pushBack "Mun"};

if (count _newActionName > 2) then {_newActionName = ["Utils"]};

_actionData set [1, format ["%1%2",
        [_actionData select 1, "Aktionen"] select (_actionData select 1 == "Interaktionen"),
        [format [" (%1)",
                _newActionName joinString ","
            ], ""] select (_newActionName isEqualTo [])
    ]];
