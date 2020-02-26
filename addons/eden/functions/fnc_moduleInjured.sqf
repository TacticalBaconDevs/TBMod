#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [
        ["_mode", "", [""]],
        ["_input", [], [[]]]
    ];
_input params [
        ["_logic", objNull, [objNull]],
        ["_isActivated", true, [true]],
        ["_isCuratorPlaced", false, [true]]
    ];

if (!is3DEN && {_mode == "init"}) then
{
    // Check for Objects
    private _syncObjs = (synchronizedObjects _logic) select {!(_x isKindOf "EmptyDetector") && _x isKindOf "CAManBase"};
    if (_syncObjs isEqualTo []) exitWith {systemChat "ModuleInjured braucht gesyncte Soldaten!"};

    // prepair Module
    {
        doStop _x;
        _x setVariable ["acex_headless_blacklist", true, true];
        _x setBehaviour "CARELESS";
        _x setCombatMode "BLUE";
        _x setUnitPos "DOWN";
        [_x, "MOVE"] remoteExecCall ["disableAI", _x];
        _x spawn {uiSleep 1; [_this, "MOVE"] remoteExecCall ["disableAI", _this]};
        _x setVariable ["Vcm_Disable", true, true];
    }
    forEach _syncObjs;
    if (_isActivated) then
    {
        private _strength = _logic getVariable ["strength", 0.75];
        private _anzahl = _logic getVariable ["anzahl", 1];
        private _schadenTyp = call compile (_logic getVariable ["schadenTyp", "[]"]);
        private _wundOrte = call compile (_logic getVariable ["wundOrte", "[]"]);

        [_syncObjs, _strength, _anzahl, _schadenTyp, _wundOrte] spawn
        {
            params ["_syncObjs", "_strength", "_anzahl", "_schadenTyp", "_wundOrte"];

            uiSleep 2; // etwas delay

            {
                private _unit = _x;

                if (local _unit) then {
                    {
                        _x params ["_key", "_value"];
                        _unit setVariable ["ace_medical_"+ _key, _value, true];
                    }
                    forEach [
                        ["enableUnconsciousnessAI", 2],
                        ["preventInstaDeath", true],
                        ["amountOfReviveLives", 5],
                        ["enableRevive", 2]
                    ];
                    for "_i" from 1 to _anzahl do
                    {
                        [_unit, _strength, selectRandom _wundOrte, selectRandom _schadenTyp] call ace_medical_fnc_addDamageToUnit;
                    };
                };
            }
            forEach _syncObjs;
        };
    };
};
