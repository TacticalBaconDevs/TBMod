#include "../script_component.hpp"
#define ADD(VALUE) _einfluss = _einfluss + (VALUE);
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params [["_input", false, [false]]];

if (GVAR(recoilCoef) == -1 && _input) then {GVAR(recoilCoef) = 1};
if (GVAR(recoilCoef) == -1) exitWith {};

// TODO: Automatisch
{
    ace_overheating_cacheSilencerData setVariable _x;
}
forEach [
    ["rhsusf_acc_nt4_black", 4],    //2.4
    ["rhsusf_acc_nt4_tan", 4],      //2.4
    ["rhsusf_acc_rotex5_tan", 4],   //2.4
    ["rhsusf_acc_rotex5_grey", 4],  //2.4
    ["rhsusf_acc_sfmb556", 1.25],   //1.25
    ["rhsusf_acc_sf3p556", 1.25]    //1.25
];

#ifdef ENABLE_PERFORMANCE_COUNTERS
[
    "RecoilSystem",
    {
        private _return = [];

        _return pushBack (format ["getCustomAimCoef: %1", (getCustomAimCoef _unit) toFixed 2]);

        _return joinString "<br/>";
    },
    [1]
] call ace_common_fnc_watchVariable;
#endif

[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    (linearConversion [0, 1, GET_PAIN_PERCEIVED(ACE_player), 1, 5, true]) + (ACE_player getVariable [QEGVAR(medical_engine,aimFracture), 0])
}] call EFUNC(common,arithmeticSetSource);

TB_cacheWeaponType = ([currentWeapon player] call BIS_fnc_itemType) select 1;
TB_recoilFreeze = -1;

["weapon", {
    params ["_unit", "_newWeapon"];
    TB_cacheWeaponType = ([_newWeapon] call BIS_fnc_itemType) select 1;
}] call CBA_fnc_addPlayerEventHandler;

TB_recoilID = ["ace_firedPlayer", {
    if (GVAR(recoilCoef) == -1) exitWith {["ace_firedPlayer", TB_recoilID] call CBA_fnc_removePlayerEventHandler};
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    if (toLower _weapon in ["throw", "put"]) exitWith {};
    if (TB_recoilFreeze >= diag_tickTime) exitWith {};
    if (vehicle _unit != _unit) exitWith {_unit setUnitRecoilCoefficient 0.1};

    private _suppressed = L_Suppress_Suppress_sys_Threshold;
    private _suppressed2 = (L_Suppress_Suppress_sys_intensity * ((L_Suppress_Suppress_sys_Threshold - 8) / (30 - 8))) max 1;
    private _customAimCoef = getCustomAimCoef _unit;
    private _recoil = /*TB_recoilStart+*/  _customAimCoef + _fatigue + _suppressed;

    ["Threshold: %1 | suppressedVal: %2 | AimCoef: %3 | fatigue: %4",
            _suppressed,
            _suppressed2,
            _customAimCoef,
            _fatigue
        ] call FUNC(debug);

    private _einfluss = 0;
    private _deploy = isWeaponDeployed _unit;
    private _rested = isWeaponRested _unit;

    // Spezielle WaffenStats
    if (TB_cacheWeaponType == "MachineGun") then {ADD(100)};
    if (TB_cacheWeaponType == "SniperRifle" && {_deploy}) then {ADD(-50)};
    if ("rhs_weap_mk17" in toLower _weapon) then {
        ADD(50);
        if !("rhsusf_20Rnd_762x51_SR25" in toLower _magazine) then {ADD(50)};
    };

    // Externe Einflüsse
    if (_rested) then {ADD(-10)};
    if (_deploy) then {ADD(-30)};

    // Waffen Einflüsse
    if (isClass (configfile >> "CfgPatches" >> "rhsusf_main") && _weapon == primaryWeapon _unit) then
    {
        (primaryWeaponItems _unit) params ["_silencer", "", "", "_bipod"];

        // Silencer
        private _muzzleHider = (toLower _silencer) in ["rhsusf_acc_sf3p556", "rhsusf_acc_sfmb556"];
        if (_mode == "Single" && {_muzzleHider}) then {ADD(-20)};
        if (_silencer != "" && {!_muzzleHider}) then {ADD(-10)};

        // Grip
        if (_bipod != "" && !_deploy && _bipod != "rhsusf_acc_harris_bipod") then {ADD(-10)};
    };

    if (_weapon == handgunWeapon _unit) then
    {
        (handgunItems _unit) params ["_silencer", "", "", "_bipod"];

        if (_silencer != "") then {ADD(-10)};
    };

    _einfluss = 1 + (_einfluss / 100);
    ["Recoil: %1 | Influ: %2 | AimCoef: %3 | Type: %4 | mode: %5 | deploy: %6 | rested: %7", // TODO Change
            (_recoil max 0.5) * GVAR(recoilCoef),
            _recoil max 0.5,
            getCustomAimCoef _unit,
            TB_cacheWeaponType,
            _mode,
            _deploy,
            _rested
        ] call FUNC(debug);
    _unit setUnitRecoilCoefficient (((_recoil max 0.5) * ) * GVAR(recoilCoef));

    TB_recoilFreeze = diag_tickTime + 1;
}] call CBA_fnc_addEventHandler;
