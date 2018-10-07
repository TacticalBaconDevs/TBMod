/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
params ["_target"];

private _maxFuel = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "ace_refuel_fuelCapacity");
if (_maxFuel == 0) then {_maxFuel = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "fuelCapacity")};
private _fuel = fuel _target;

hint format ["Der Tank des Fahrzeugs scheint %1 zu sein", _fuel call {
    if (_this > 0.9) exitWith {"voll"};
    if (_this > 0.75) exitWith {"nicht ganz voll"};
    if (_this > 0.45) exitWith {"nur halb voll"};
    if (_this > 0.25) exitWith {"fast leer"};
    "leer"
}];