#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    FNC: TBMod_medical_fnc_injureModule
    Example: [_logic] spawn TBMod_medical_fnc_injureModule
*/
params ["_logic", ["_units", []]];

private _strength = _logic getVariable ["strength", 0.75];
private _anzahl = _logic getVariable ["anzahl", 1];
private _schadenTyp = _logic getVariable ["schadenTyp", "[]"];
if (_schadenTyp isEqualType "") then {_schadenTyp = call compile _schadenTyp};
private _wundOrte = _logic getVariable ["wundOrte", "[]"];
if (_wundOrte isEqualType "") then {_wundOrte = call compile _wundOrte};
private _bewusstlos = _logic getVariable ["bewusstlos", false];
private _keepAlive = _logic getVariable ["keepAlive", false];
private _preventHealing = _logic getVariable ["preventHealing", false];

// mit SPAWN wird es per EDEN aufgerufen
if (canSuspend) then
{
    waitUntil {time > 0 && !isNil QEGVAR(main,initDone)};
    uiSleep 10; // etwas delay wird benötigt
};

{
    private _pathAI = _x checkAIFeature "PATH";
    [_x, "PATH"] remoteExecCall ["disableAI", _x];

    if (_preventHealing) then
    {
        _x setVariable ["ace_medical_ai_lastHit", 9e+9, true];
        _x setVariable ["ace_medical_ai_lastFired", 9e+9, true];
    };
    _x setVariable ["ace_medical_fatalDamageSource", 3, true];
    _x setVariable ["ace_medical_statemachine_AIUnconsciousness", true, true];

    for "_i" from 1 to _anzahl do
    {
        [_x, _strength, selectRandom _wundOrte, selectRandom _schadenTyp] remoteExec ["ace_medical_fnc_addDamageToUnit", _x];
    };

    if (_bewusstlos) then
    {
        _x setVariable ["ace_medical_bloodVolume", 4.5, true];
        [_x, true] call ace_medical_fnc_setUnconscious;
    };
    if (_keepAlive) then {["add", _x] call FUNC(keepAlive)};

    [_x, ["PATH", _pathAI]] remoteExecCall ["enableAIFeature", _x];
}
forEach _units;
