/*
    Author: shukari
*/
params ["_target"];

ACE_player getVariable ["TB_arsenalType", ""] == getText (configFile >> "CfgVehicles" >> typeOf _target >> "arsenalType");
