/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target"];

hint format ["Der Tank des Fahrzeugs scheint %1 zu sein", (fuel _target) call {
    if (_this > 0.9) exitWith {"voll"};
    if (_this > 0.75) exitWith {"nicht ganz voll"};
    if (_this > 0.45) exitWith {"nur halb voll"};
    if (_this > 0.25) exitWith {"fast leer"};
    "leer"
}];