#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_freq", []], ["_sel", 10]];

missionNamespace setVariable ["#EM_FMin", _freq param [0, 0]];
missionNamespace setVariable ["#EM_FMax", _freq param [1, 550]];

missionNamespace setVariable ["#EM_SelMin", (_freq param [0, 0]) - (_sel / 2)];
missionNamespace setVariable ["#EM_SelMax", (_freq param [0, 0]) + (_sel / 2)];
