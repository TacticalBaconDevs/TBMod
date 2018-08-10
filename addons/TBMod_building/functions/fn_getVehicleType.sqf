/*
    Author: Willi "shukari" Graff
*/
private _info = [];

if (_target getVariable ["TBMod_Building_Cranwagen", false]) then {_info pushBack "Kranwagen"};
if (_target getVariable ["TBMod_Building_PlaceablesCargo", -1] > 0) then {_info pushBack "Ressourcenfahrzeug"};
if ([_target] call ace_medical_fnc_isMedicalVehicle) then {_info pushBack "Sanitätsfahrzeug"};
if ([_target] call ace_repair_fnc_isRepairVehicle) then {_info pushBack "Reparaturfahrzeug"};
if ([_target] call ace_refuel_fnc_getFuel > 0) then {_info pushBack "Tankwagen"};
if (_target getVariable ["ace_rearm_isSupplyVehicle", false] ||
    getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ace_rearm_defaultSupply") > 0) then {_info pushBack "Munitionswagen"};

hint (_info joinString "\n");