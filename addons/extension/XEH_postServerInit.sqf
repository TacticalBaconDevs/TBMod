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

    // DeadCauses
    if (GVAR(deadCauses)) then
    {
        ["ace_killed", {
            params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

            if (!isPlayer _unit) exitWith {};
            if (!isNull _killer && isNull _instigator) then {_instigator = effectiveCommander _killer};

            private _msg = format ["%1 (%2) von %3 (%4) durch %5", [_unit] call ace_common_fnc_getName, typeOf _unit, [_instigator] call ace_common_fnc_getName, typeOf _instigator, _causeOfDeath];
            private _type = if (isPlayer _instigator) then {"PVP_KILLED"} else {"KILLED"};
            ["logger", "#log", ["deadcauses", _type, _msg]] call FUNC(callExtension);
        }] call CBA_fnc_addEventHandler;
    };
};
