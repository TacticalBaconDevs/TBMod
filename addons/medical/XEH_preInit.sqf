#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    see https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
    QGVAR(coef_global),
    "SLIDER",
    ["MedicSystemCoef", "Bestimmt die Zeiten für medizinische Aktionen (kleiner = weniger Zeit)"],
    ["TBMod", QUOTE(COMPONENT)],
    [0.1, 2, 1, 1],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(fatalDamageSource_player),
    "LIST",
    "FatalDamageSource Player",
    ["TBMod", QUOTE(COMPONENT)],
    [[0, 1, 2, 3, 4], ["Only large hits to vital organs", "Sum of trauma", "Either", "No Fatals", "ACE_VALUE"], 4],
    1,
    {
        if (_this < 4 && !isDedicated) then {player setVariable ["ace_medical_fatalDamageSource", _this, true]};
    }
] call CBA_fnc_addSetting;

[
    QGVAR(selfTreatMalus),
    "SLIDER",
    ["selfTreatMalus", "Wie viel Prozent MEHR Zeit braucht eine Selbstbehandlung"],
    ["TBMod", QUOTE(COMPONENT)],
    [0, 2, 0.4, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(saniBoost),
    "SLIDER",
    ["saniBoost", "Wie viel Prozent SCHNELLER von der Zeit her ist ein Sani"],
    ["TBMod", QUOTE(COMPONENT)],
    [0, 2, 0.1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(arztBoost),
    "SLIDER",
    ["arztBoost", "Wie viel Prozent SCHNELLER von der Zeit her ist ein Arzt"],
    ["TBMod", QUOTE(COMPONENT)],
    [0, 2, 0.3, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(vehicleBoost),
    "SLIDER",
    ["vehicleBoost", "Wie viel Prozent SCHNELLER von der Zeit her ist ein MedicalFahrzeug"],
    ["TBMod", QUOTE(COMPONENT)],
    [0, 2, 0.1, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(facilityBoost),
    "SLIDER",
    ["facilityBoost", "Wie viel Prozent SCHNELLER von der Zeit her ist ein MedicalGebäude"],
    ["TBMod", QUOTE(COMPONENT)],
    [0, 2, 0.3, 2],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(healthRegen),
    "SLIDER",
    ["healthRegen", "Wenn man volle Ausdauer hat und ruhig steht, regeniert man leicht Blut und genähte Wunden/Prellungen werden geschlossen, Zeit in Sekunden."],
    ["TBMod", QUOTE(COMPONENT)],
    [-1, 10 * 60, 60, 0],
    1,
    {
        if (!isNil QGVAR(healthRegen_idPFH)) then {[GVAR(healthRegen_idPFH)] call CBA_fnc_removePerFrameHandler};
        if (GVAR(healthRegen) <= 0) exitWith {};
        
        GVAR(healthRegen_idPFH) = [LINKFUNC(healthRegenPEFH), GVAR(healthRegen)] call CBA_fnc_addPerFrameHandler;
    }
] call CBA_fnc_addSetting;

[
    QGVAR(unconsciousMode),
    "LIST",
    "unconsciousMode",
    ["TBMod", QUOTE(COMPONENT)],
    [[0, 1, 2], ["Vanilla", "SpectatorSelf", "SpectatorTeam"], 1],
    1
] call CBA_fnc_addSetting;

["ace_unconscious", {
    params ["_unit", "_unconscious"];

    if (GVAR(unconsciousMode) == 0 || {_unit != ACE_player}) exitWith {};

    // Spectator nur selber
    if (GVAR(unconsciousMode) == 1) then
    {
        if (_unconscious) then
        {
            // [[_unit], []] call ace_spectator_fnc_updateUnits
            ace_spectator_unitWhitelist = [_unit];
            ace_spectator_unitBlacklist = [];

            [[2], [0,1]] call ace_spectator_fnc_updateCameraModes;
            [[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes;
            [2, _unit, -2] call ace_spectator_fnc_setCameraAttributes;

            [true, true, false] call ace_spectator_fnc_setSpectator;
        }
        else
        {
            [false, false, false] call ace_spectator_fnc_setSpectator;
        };
    };

    // Spectator ganzes Team
    if (GVAR(unconsciousMode) == 2) then
    {
        if (_unconscious) then
        {
            ace_spectator_unitWhitelist = [];
            ace_spectator_unitBlacklist = [];

            [[side _unit], _unit call BIS_fnc_enemySides] call ace_spectator_fnc_updateSides;
            [[1,2], [0]] call ace_spectator_fnc_updateCameraModes;
            [[-2,-1], [0,1,2,3,4,5,6,7]] call ace_spectator_fnc_updateVisionModes;
            [2, _unit, -2] call ace_spectator_fnc_setCameraAttributes;

            [true, true, false] call ace_spectator_fnc_setSpectator;
        }
        else
        {
            [false, false, false] call ace_spectator_fnc_setSpectator;
        };
    };
}] call CBA_fnc_addEventHandler;

["unit", {
    params ["_new"];

    if (GVAR(unconsciousMode) in [1, 2] && !(_new getVariable ["ACE_isUnconscious", false])) then
    {
        [false, false, false] call ace_spectator_fnc_setSpectator;
    };
}] call CBA_fnc_addPlayerEventHandler;


// DEBUG Code
/*#ifdef DEBUG_MODE_FULL
    call compile preprocessFileLineNumbers "z\ace\addons\medical\dev\debugDisplay.sqf";
    call compile preprocessFileLineNumbers "z\ace\addons\medical\dev\watchVariable.sqf";

    ["ace_medical_FatalVitals", {(format ["%1 -> FatalVitals damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;
    ["ace_medical_Bleedout", {(format ["%1 -> Bleedout damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;
    ["ace_medical_FatalInjury", {(format ["%1 -> FatalInjury damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;

    [QGVAR(FatalInjuryHead), {systemChat (format ["%1 -> FatalInjuryHead damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState])}] call CBA_fnc_addEventHandler;
    [QGVAR(FatalInjuryBody), {systemChat (format ["%1 -> FatalInjuryBody damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState])}] call CBA_fnc_addEventHandler;
    [QGVAR(FatalInjuryTrauma), {systemChat (format ["%1 -> FatalInjuryTrauma damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState])}] call CBA_fnc_addEventHandler;
#endif*/

ADDON = true;
