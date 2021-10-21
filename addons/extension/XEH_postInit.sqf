#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

// ### Highlight
if (isNil QGVAR(highlightLog)) then {GVAR(highlightLog) = false};
if (hasInterface && {GVAR(highlightLog)} && {!isNil QGVAR(loggingExtension)} && {GVAR(loggingExtension)}) then
{
    GVAR(highlightLog) = 1 == ["logging", "register", ["highlight", "#HighlightLog.log"], true] call FUNC(callExtension);

    if (GVAR(highlightLog)) then
    {
        ["ace_killed", {
            params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

            if (!isNull _killer && isNull _instigator) then {_instigator = effectiveCommander _killer};

            if (!isNull _instigator && _instigator in [player, ace_player]) then
            {
                ["logging", "#log", ["highlight", "KILLED", format ["%1 durch %2", typeOf _unit, _causeOfDeath]]] call FUNC(callExtension);
            };
        }] call CBA_fnc_addEventHandler;
    };
};