/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_unit", "_value"];

if (!alive _unit || _value == "") exitWith {};

waitUntil {time > 0 && !isNil "TB_init_done"};

[_unit, "ANIM"] remoteExec ["disableAI", _unit];
[_unit, _value, 2] call ace_common_fnc_doAnimation;
_unit setVariable ["TB_inAnim", true];

TB_disableANIM = {
    params ["_unit"];

    // Selber kampffähig machen
    if (_unit getVariable ["TB_inAnim", false]) then {
        [_unit, "ANIM"] remoteExec ["enableAI", _unit];
        [_unit, "", 1] call ace_common_fnc_doAnimation;
        _unit setVariable ["TB_inAnim", false];
    };

    {
        if (_unit getVariable ["TB_inAnim", false]) then {[_x] call TB_disableANIM};
    }
    forEach (_unit nearEntities ["Man", 15]);
};

_unit addEventHandler ["HandleDamage", TB_disableANIM];
_unit addEventHandler ["FiredNear", TB_disableANIM];
