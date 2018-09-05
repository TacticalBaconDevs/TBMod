/*
    Author: shukari
*/
params ["_target"];

private _maxFuel = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ace_refuel_fuelCapacity");
if (_maxFuel == 0) then {_maxFuel = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "fuelCapacity")};
private _fuel = fuel _target;

hint format ["Fahrzeug verfügt über %1L von %2L", floor (_fuel * _maxFuel), _maxFuel, round ((floor (_fuel * _maxFuel)) * 100 / _maxFuel), "%"];