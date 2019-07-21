#include "script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call EFUNC(main,isTBMission)) exitWith {};

// MISSION POOL
if (isNil "TB_EOS_fnc_unitPools_custom" && {["unitPools.sqf"] call FUNC(fileExists)}) then
{
    TB_EOS_fnc_unitPools_custom = compile preprocessFileLineNumbers "unitPools.sqf";
};
