#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

["CBA_loadingScreenDone", {
    call FUNC(schauspieler);
    call FUNC(inkognitoSystem);
}] call CBA_fnc_addEventHandler;
