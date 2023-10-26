#include "../script_component.hpp"
#define ALL_BODY_PARTS ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
    FNC: TBMod_medical_fnc_calcTreatmentTime
*/
params ["_args", "_idPFH"];

private _state = [player, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState;
if (_state != "Injured" || (vehicle player == player && speed player > 7) || ace_advanced_fatigue_anReserve / 2300 < 0.8 ||
        (0 max ((player getVariable ["ace_medical_pain", 0]) - (player getVariable ["ace_medical_painSuppress", 0])) min 1) > 0.05 ||
        (player getVariable ["ace_medical_woundBleeding", 0]) > 0) exitWith {};

// BLOOD VOLUME
private _volume = player getVariable ["ace_medical_bloodVolume", 6];
private _lost = 6 - _volume;
private _bloodAdd = _lost * 0.005;
player setVariable ["ace_medical_bloodVolume", (_volume + _bloodAdd) min 6];

// eine Prellung entfernen
private _prellungsId = -1;
private _openWounds = player getVariable ["ace_medical_openWounds", createHashMap];
{
    private _openWounds = _y;
    _prellungsId = _openWounds findIf {(ace_medical_damage_woundClassNamesComplex select (_x # 0)) find "Contusion" != -1};
    if (_prellungsId != -1) exitWith {_openWounds deleteAt _prellungsId};
}
forEach _openWounds;

// Genähte Wunden entfernen
private _stitched = nil;
{
    private _stitchedWounds = _y;
    _stitched = _stitchedWounds deleteAt 0;
    if (!isNil "_stitched") exitWith {};
}
forEach (player getVariable ["ace_medical_stitchedWounds", createHashMap]);

// ace_medical_bodyPartDamage updaten
private _updateBodyPartVisuals = false;
{
    private _openWoundsCount = {_x # 1 > 0} count (_openWounds getOrDefault [_x, []]);
    private _bodyPartDamage = player getVariable ["ace_medical_bodyPartDamage", [0,0,0,0,0,0]];
    private _currentBodyPartDamage = _bodyPartDamage # _forEachIndex;

    if (_openWoundsCount <= 0 && _currentBodyPartDamage > 0) then
    {
        _bodyPartDamage set [_forEachIndex, 0];
        player setVariable ["ace_medical_bodyPartDamage", _bodyPartDamage, true];
        
        switch (_x) do {
            case "head": { [player, true, false, false, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
            case "body": { [player, false, true, false, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
            case "leftarm";
            case "rightarm": { [player, false, false, true, false] call ace_medical_engine_fnc_updateBodyPartVisuals; };
            default { [player, false, false, false, true] call ace_medical_engine_fnc_updateBodyPartVisuals; };
        };

        _updateBodyPartVisuals = true;
    };
}
forEach ALL_BODY_PARTS;

/*["[healthRegen] Blut hinzu: %1ml (nun: %5ml) | Prellung geheilt: %2 | Genähte geheilt: %3 | updateBodyPartVisuals: %4",
        (_bloodAdd * 1000) toFixed 0,
        _prellungsId != -1,
        !isNil "_stitched",
        _updateBodyPartVisuals,
        player getVariable ["ace_medical_bloodVolume", 6]
    ] call EFUNC(main,debug);*/
