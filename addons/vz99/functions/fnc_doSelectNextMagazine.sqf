#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
params ["_magazineClassname"];

TB_vz99_nextReload = _magazineClassname;
systemChat format ["Es wird '%1' als nächstes geladen!", [_magazineClassname, true] call EFUNC(main,displayName)];
