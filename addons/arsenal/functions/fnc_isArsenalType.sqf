#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_target"];

ACE_player getVariable ["TB_arsenalType", ""] == getText (configFile >> "CfgVehicles" >> typeOf _target >> "arsenalType");
