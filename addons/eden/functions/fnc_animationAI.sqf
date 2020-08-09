#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_unit", ["_value", ""], ["_forceStart", false]];

if (!alive _unit || _value == "") exitWith {};
// Im 3den erste Position zeigen
if (is3DEN) exitWith {_unit switchMove _value};
// Auf Bereitschaft warten
if (!_forceStart && isNil QEGVAR(main,initDone)) exitWith
{
    [{!isNil QEGVAR(main,initDone)}, {_this call FUNC(animationAI)}, [_unit, _value, true]] call CBA_fnc_waitUntilAndExecute;
};

// Funktionalitäten
[_unit, "ANIM"] remoteExec ["disableAI", _unit];
[_unit, "PATH"] remoteExec ["disableAI", _unit];
_unit setVariable ["acex_headless_blacklist", true, true];

if (dynamicSimulationEnabled (group _unit) || !simulationEnabled _unit) exitWith
{
    [{simulationEnabled (_this # 0)}, LINKFUNC(animationAI), _this] call CBA_fnc_waitUntilAndExecute;
};

[{
    params ["_unit", "_value"];
    [_unit, _value, 2] call ace_common_fnc_doAnimation;

    if (_unit getVariable ["animDisableOverride", false]) exitWith {};

    _unit setVariable [QGVAR(inAnim), true];

    if (isNil QGVAR(disableANIM)) then
    {
        GVAR(disableANIM) = {
            params ["_unit", ["_chain", true]];

            // Selber kampffähig machen
            if (_unit getVariable [QGVAR(inAnim), false]) then
            {
                [_unit, "ALL"] remoteExec ["enableAI", _unit];
                [_unit, "", 1] call ace_common_fnc_doAnimation;
                _unit setVariable [QGVAR(inAnim), false];
            };

            if (_chain isEqualType true && {!_chain}) exitWith {};

            {
                if (_unit getVariable [QGVAR(inAnim), false]) then {[_x, false] call GVAR(disableANIM)};
            }
            forEach (_unit nearEntities ["Man", 15]);
        };
    };

    _unit addEventHandler ["HandleDamage", GVAR(disableANIM)];
    _unit addEventHandler ["FiredNear", GVAR(disableANIM)];
}, _this, random 5 + random 5] call CBA_fnc_waitAndExecute;
