#include "script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call EFUNC(main,isTBMission)) exitWith {};

["CBA_loadingScreenDone", {
    call FUNC(schauspieler);
    call FUNC(inkognitoSystem);
}] call CBA_fnc_addEventHandler;
