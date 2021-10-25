#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
["CAManBase", "HitPart", {
    {
        _x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];

        if (typeOf _projectile == "tb_ammo_taser") exitWith
        {
            private _isKI = !isPlayer _target;
            if (_target != _shooter) then {[_target, [2, 0] select _isKI, 1] remoteExec ["rhs_fnc_flashbang_effect", _target]};

            if (_isKI && !(_target getVariable ["ace_medical_statemachine_AIUnconsciousness", ace_medical_statemachine_AIUnconsciousness])) then
            {
                _target setVariable ["ace_medical_statemachine_AIUnconsciousness", true, true];
                [{_x setVariable ["ace_medical_statemachine_AIUnconsciousness", false, true]}, _target, 21] call CBA_fnc_waitAndExecute;
            };

            [_target, true, 20, true] call ace_medical_fnc_setUnconscious;

            ["TB_informAdminsAndZeus", ["%1 hat %2 getasert!", [_shooter] call ace_common_fnc_getName, [_target] call ace_common_fnc_getName]] call CBA_fnc_globalEvent;
        };
    }
    forEach _this;
}] call CBA_fnc_addClassEventHandler;
