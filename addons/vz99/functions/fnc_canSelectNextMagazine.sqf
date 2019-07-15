#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
params ["_magazineClassname"];

(getText (configFile >> "CfgMagazines" >> _magazineClassname >> "TB_vz99_base")) in (magazines ace_player)
