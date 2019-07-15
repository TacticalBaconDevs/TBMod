#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
private _info = [];

if (_target getVariable ["TBMod_Building_kranWagen", false]) then {_info pushBack "Kranwagen"};
if (_target getVariable ["TBMod_Building_resourcenCargo", -1] > 0) then {_info pushBack "Ressourcenfahrzeug"};
if ([_target] call ace_medical_fnc_isMedicalVehicle) then {_info pushBack "Sanitätsfahrzeug"};
if ([_target] call ace_repair_fnc_isRepairVehicle) then {_info pushBack "Reparaturfahrzeug"};
if ([_target] call ace_refuel_fnc_getFuel > 0) then {_info pushBack "Tankwagen"};
if (_target getVariable ["ace_rearm_isSupplyVehicle", false] ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ace_rearm_defaultSupply") > 0) then {_info pushBack "Munitionswagen"};

if !(_info isEqualTo []) then {hint (_info joinString "\n")};
