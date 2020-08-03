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

if !(call EFUNC(main,isTBMission)) exitWith {};

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
    "CHECKBOX",
    ["healthRegen", "Wenn man volle Ausdauer hat und ruhig steht, regeniert man leicht Blut und genähte Wunden/Prellungen werden geschlossen"],
    ["TBMod", QUOTE(COMPONENT)],
    true,
    1,
    {
        if (_this) then
        {
            [{
                params ["_args", "_idPFH"];

                if !(GVAR(healthRegen)) exitWith {[_idPFH] call CBA_fnc_removePerFrameHandler};

                private _state = [player, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState;
                if (_state != "Injured" || (vehicle player == player && speed player > 7) || ace_advanced_fatigue_anReserve / 2300 < 0.8 ||
                        (0 max ((player getVariable ["ace_medical_pain", 0]) - (player getVariable ["ace_medical_painSuppress", 0])) min 1) > 0.05 ||
                        (player getVariable ["ace_medical_woundBleeding", 0]) > 0) exitWith {};

                // BLOOD VOLUME
                private _volume = player getVariable ["ace_medical_bloodVolume", 6];
                private _lost = 6 - _volume;
                player setVariable ["ace_medical_bloodVolume", (_volume + (_lost * 0.005)) min 6];

                // WOUNDS / PRELLUNGEN
                //{
                //    _x params ["_classID", "_bodyPartN", "_amountOf", "_bleedingRate", "_damage"];
                //    ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"] select _bodyPartN
                //    private _className = ace_medical_damage_woundClassNamesComplex select _classID;
                //} forEach (player getVariable ["ace_medical_openWounds", []]);

                // Prellungen entfernen
                private _openWounds = (player getVariable ["ace_medical_openWounds", []]) select {(_x # 2) > 0};
                private _prellungsId = _openWounds findIf {(ace_medical_damage_woundClassNamesComplex select (_x # 0)) find "Contusion" != -1};
                if (_prellungsId != -1) then
                {
                    _openWounds deleteAt _prellungsId;
                    player setVariable ["ace_medical_openWounds", _openWounds, true];
                };

                // Genähte Wunden entfernen
                private _stitchedWounds = player getVariable ["ace_medical_stitchedWounds", []];
                private _stitched = _stitchedWounds deleteAt 0;
                if (!isNil "_stitched") then {player setVariable ["ace_medical_stitchedWounds", _stitchedWounds, true]};

                // ace_medical_bodyPartDamage updaten
                private _updateBodyPartVisuals = false;
                for "_i" from 0 to 5 do
                {
                    private _partIndex = _i;
                    if ((_openWounds findIf {
                                _x params ["", "_bodyPartN", "_amountOf"];
                                (_partIndex ==_bodyPartN) && {_amountOf > 0}
                            }) == -1) then {
                        private _bodyPartDamage = player getVariable ["ace_medical_bodyPartDamage", [0,0,0,0,0,0]];
                        _bodyPartDamage set [_partIndex, 0];
                        player setVariable ["ace_medical_bodyPartDamage", _bodyPartDamage, true];

                        switch (_partIndex) do
                        {
                            case 0: { [player, true, false, false, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
                            case 1: { [player, false, true, false, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
                            case 2;
                            case 3: { [player, false, false, true, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
                            default { [player, false, false, false, true] call ace_medical_engine_fnc_updateBodyPartVisuals; };
                        };

                        _updateBodyPartVisuals = true;
                    };
                };

                ["[healthRegen] Blut hinzu: %1ml | Prellung geheilt: %2 | Genähte geheilt: %3 | updateBodyPartVisuals: %4",
                        ((player getVariable ["ace_medical_bloodVolume", 6]) - _volume) * 1000 toFixed 0,
                        _prellungsId != -1,
                        !isNil "_stitched",
                        _updateBodyPartVisuals] call EFUNC(main,debug);
            }, 3 * 60] call CBA_fnc_addPerFrameHandler;
        };
    }
] call CBA_fnc_addSetting;

[
    QGVAR(unconsciousMode),
    "LIST",
    "unconsciousMode",
    ["TBMod", QUOTE(COMPONENT)],
    [[0, 1, 2], ["Vanilla", "CamOverHead", "Spectator"], 0],
    1
] call CBA_fnc_addSetting;

["ace_unconscious", {
    params ["_unit", "_unconscious"];

    if (GVAR(unconsciousMode) == 0 || {_unit != ACE_player}) exitWith {};

    //[true] call FUNC(handleEffects);
    //[false, 2] call ace_medical_feedback_fnc_effectUnconscious;
    //ace_common_OldIsCamera = true;

    // CamOverHead
    if (GVAR(unconsciousMode) == 1) then
    {
        if (_unconscious && isNil QGVAR(cam)) then
        {
            ACE_player setVariable ["ace_medical_feedback_effectUnconsciousTimeout", CBA_missionTime + (10 * 60)];

            GVAR(cam) = "camera" camCreate (getPos _unit);
            GVAR(cam) camSetTarget _unit;
            GVAR(cam) cameraEffect ["internal", "BACK"];
            GVAR(cam) camSetRelPos [0, 0, 3];
            GVAR(cam) camCommit 0;
            showCinemaBorder false;
        }
        else
        {
            _unit switchCamera "INTERNAL";
            GVAR(cam) CameraEffect ["Terminate", "Back"];
            camDestroy GVAR(cam);
            GVAR(cam) = null;
        };
    };

    // Spectator
    if (GVAR(unconsciousMode) == 2) then
    {
        if (_unconscious) then
        {
            [[_unit], []] call ace_spectator_fnc_updateUnits;
            [[side _unit], _unit call BIS_fnc_enemySides] call ace_spectator_fnc_updateSides;
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
}] call CBA_fnc_addEventHandler;


// DEBUG Code
#ifdef DEBUG_MODE_FULL
    call compile preprocessFileLineNumbers "z\ace\addons\medical\dev\debugDisplay.sqf";
    call compile preprocessFileLineNumbers "z\ace\addons\medical\dev\watchVariable.sqf";

    ["ace_medical_FatalVitals", {(format ["%1 -> FatalVitals damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;
    ["ace_medical_Bleedout", {(format ["%1 -> Bleedout damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;
    ["ace_medical_FatalInjury", {(format ["%1 -> FatalInjury damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState]) remoteExecCall ["systemChat"]}] call CBA_fnc_addEventHandler;

    [QGVAR(FatalInjuryHead), {systemChat (format ["%1 -> FatalInjuryHead damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState])}] call CBA_fnc_addEventHandler;
    [QGVAR(FatalInjuryBody), {systemChat (format ["%1 -> FatalInjuryBody damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState])}] call CBA_fnc_addEventHandler;
    [QGVAR(FatalInjuryTrauma), {systemChat (format ["%1 -> FatalInjuryTrauma damit im %2", [_this] call ace_common_fnc_getName, [_this, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState])}] call CBA_fnc_addEventHandler;
#endif

ADDON = true;
