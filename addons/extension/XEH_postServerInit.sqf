#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if (!isNil QGVAR(loggingExtension) && GVAR(loggingExtension)) then
{
    // Admin Logging
    if (GVAR(adminLog)) then
    {
        [
            "TB_informAdminsAndZeus",
            {
                ["logger", "#log", ["adminlog", "LOG", if (_this isEqualType []) then {format _this} else {_this}]] call FUNC(callExtension);
            }
        ] call CBA_fnc_addEventHandler;
    };
};
