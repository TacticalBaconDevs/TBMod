#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

// MISSION POOL
if (isNil QFUNC(unitPools_custom) && {["unitPools.sqf"] call EFUNC(main,fileExists)}) then
{
    FUNC(unitPools_custom) = compile preprocessFileLineNumbers "unitPools.sqf";
};
