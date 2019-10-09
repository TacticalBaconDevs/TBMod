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

systemChat format ["injured: %1", _this];
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
        private _bewusstlos = _logic getVariable ["bewusstlos", true];
        private _anzahl = _logic getVariable ["anzahl", 1];
        private _schadenTyp = call compile (_logic getVariable ["schadenTyp", "[]"]);
        private _wundOrte = call compile (_logic getVariable ["wundOrte", "[]"]);

        [_syncObjs, _bewusstlos, _anzahl, _schadenTyp, _wundOrte] spawn
        {
            params ["_syncObjs", "_bewusstlos", "_anzahl", "_schadenTyp", "_wundOrte"];

            uiSleep 2; // etwas delay

            {
                private _unit = _x;

                for "_i" from 1 to _anzahl do
                {
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

                    private _array = [0, 0, 0, 0, 0, 0, 0.5 + random 1, 40 + random 20, 60 + random 20, _bewusstlos];
                    _array set [["head", "body", "hand_r", "hand_l", "leg_r", "leg_l"] find (selectRandom _wundOrte), 1];

                    [_unit, selectRandom _schadenTyp, _array] spawn Achilles_fnc_setACEInjury;
                };
            }
            forEach _syncObjs;
        };
    };
};
