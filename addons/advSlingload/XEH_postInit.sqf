#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call EFUNC(main,isTBMission)) exitWith {};

[QGVAR(attachToEvent), {[(_this # 0), (_this # 1), [0, 0, -1]] ropeAttachTo (_this # 2)}] call CBA_fnc_addEventHandler;
