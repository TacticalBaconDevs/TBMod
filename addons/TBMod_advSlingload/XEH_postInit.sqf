#include "script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call EFUNC(main,isTBMission)) exitWith {};

["TB_Rope_attachto", {[(_this select 0), (_this select 1), [0, 0, -1]] ropeAttachTo (_this select 2)}] call CBA_fnc_addEventHandler;
