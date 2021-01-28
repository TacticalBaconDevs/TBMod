#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (GVAR(recoilCoef) == -1 && _input) then {GVAR(recoilCoef) = 1};
if (GVAR(recoilCoef) == -1) exitWith {};

#ifdef DEBUG_MODE_FULL
[
    "RecoilSystem",
    {
        private _suppressed = linearConversion [0, L_Suppress_Suppress_sys_intensity, L_Suppress_Suppress_sys_intensity * (L_Suppress_Suppress_sys_Threshold / 30), 0, 1, true];
        private _customAimCoef = getCustomAimCoef ACE_player;
        private _weapon = currentWeapon ACE_player;
        if (_weapon isEqualTo "") then {_weapon = "KEINE"};
        private _temperature = ACE_player getVariable [format ["ace_overheating_%1_temp", _weapon], 0];
        private _scaledTemperature = linearConversion [0, 1000, _temperature, 0, 1, true];
        ([_weapon] call ace_overheating_fnc_getWeaponData) params ["_dispersion", "_slowdownFactor", "_jamChance"];
        private _stanceMod = [1, 0.5, 0, 0, 0] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find (stance ACE_player));

        private _return = [];
        _return pushBack (format ["EngineRecoil: %1 | RecoilCalc: %2", (unitRecoilCoefficient ACE_player) toFixed 2, ([] call FUNC(recoilCalc)) toFixed 2]);
        _return pushBack (format ["Fatigue: %1", (getFatigue ACE_player) toFixed 2]);
        _return pushBack (format ["AlignStatus: %1", L_Align_Align_sys_currentAlignStatus toFixed 2]);
        _return pushBack (format ["Overheating: %1 - %2", _temperature toFixed 2, _scaledTemperature toFixed 2]);
        _return pushBack (format ["Disp/Slow/Jam: %1 - %2 - %3", _dispersion toFixed 2, _slowdownFactor toFixed 2, _jamChance toFixed 2]);
        _return pushBack (format ["StanceMod: %1 - %2", _stanceMod toFixed 2, stance ACE_player]);
        _return pushBack (format ["CustomAimCoef: %1", _customAimCoef toFixed 2]);
        _return pushBack (format ["SuppressValue: %1", _suppressed toFixed 2]);

        _return joinString "<br/>";
    },
    [8]
] call ace_common_fnc_watchVariable;
#endif

/*[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    (linearConversion [0, 1, GET_PAIN_PERCEIVED(ACE_player), 1, 5, true]) + (ACE_player getVariable [QEGVAR(medical_engine,aimFracture), 0])
}] call EFUNC(common,arithmeticSetSource);*/

// TODO: Automatisch
/*{
    ace_overheating_cacheSilencerData setVariable _x;
}
forEach [
    ["rhsusf_acc_nt4_black", 4],    //2.4
    ["rhsusf_acc_nt4_tan", 4],      //2.4
    ["rhsusf_acc_rotex5_tan", 4],   //2.4
    ["rhsusf_acc_rotex5_grey", 4],  //2.4
    ["rhsusf_acc_sfmb556", 1.25],   //1.25
    ["rhsusf_acc_sf3p556", 1.25]    //1.25
];*/

GVAR(cacheWeaponType) = ([currentWeapon player] call BIS_fnc_itemType) select 1;
GVAR(recoilFreeze) = -1;

// nach Fahrzeug verlassen noch damit FFV 0.1 recoil weg kommt

["weapon", {
    params ["_unit", "_newWeapon"];
    GVAR(cacheWeaponType) = ([_newWeapon] call BIS_fnc_itemType) select 1;
    private _recoil = [] call FUNC(recoilCalc);
    TRACE_1("Recoil nach Waffenwechsel", _recoil);
    _unit setUnitRecoilCoefficient _recoil;
}] call CBA_fnc_addPlayerEventHandler;

GVAR(recoilID) = ["ace_firedPlayer", {
    if (GVAR(recoilCoef) == -1 || !GVAR(recoilSystem)) exitWith {["ace_firedPlayer", GVAR(recoilID)] call CBA_fnc_removePlayerEventHandler};
    if (GVAR(recoilFreeze) >= diag_tickTime) exitWith {};
    BEGIN_COUNTER(recoilFiredPlayer);

    private _recoil = _this call FUNC(recoilCalc);
    TRACE_1("recoil nach Schuss", _recoil);
    _unit setUnitRecoilCoefficient _recoil;

    GVAR(recoilFreeze) = diag_tickTime + 1;
    END_COUNTER(recoilFiredPlayer);
}] call CBA_fnc_addEventHandler;
