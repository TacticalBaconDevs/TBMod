/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: shukari
*/
params ["_target"];

ACE_player getVariable ["TB_arsenalType", ""] == getText (configFile >> "CfgVehicles" >> typeOf _target >> "arsenalType");
