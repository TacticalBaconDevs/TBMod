#include "../script_component.hpp"
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

#ifdef DEBUG_MODE_FULL
[
    "RecoilSystem",
    {
        private _suppressed = linearConversion [0, L_Suppress_Suppress_sys_intensity, L_Suppress_Suppress_sys_intensity * (L_Suppress_Suppress_sys_Threshold / 30), 0, 1, true];
        private _customAimCoef = getCustomAimCoef ACE_player;
        private _weapon = currentWeapon ACE_player;
        private _temperature = ACE_player getVariable [format ["ace_overheating_%1_temp", _weapon], 0];
        private _scaledTemperature = linearConversion [0, 1000, _temperature, 0, 1, true];
        ([_weapon] call ace_overheating_fnc_getWeaponData) params ["_dispersion", "_slowdownFactor", "_jamChance"];
        private _stanceMod = [1, 0.5, 0, 0, 0] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find (stance ACE_player));

        private _return = [];
        _return pushBack (format ["Fatigue: %1", (getFatigue ACE_player) toFixed 2]);
        _return pushBack (format ["AlignStatus: %1", L_Align_Align_sys_currentAlignStatus toFixed 2]);
        _return pushBack (format ["Temperature: %1 - %2", _temperature toFixed 2, _scaledTemperature toFixed 2]);
        _return pushBack (format ["Disp/Slow/Jam: %1 - %2 - %3", _dispersion toFixed 2, _slowdownFactor toFixed 2, _jamChance toFixed 2]);
        _return pushBack (format ["StanceMod: %1 - %2", _stanceMod toFixed 2, stance ACE_player]);
        _return pushBack (format ["CustomAimCoef: %1", _customAimCoef toFixed 2]);
        _return pushBack (format ["SuppressValue: %1", _suppressed toFixed 2]);
        //_return pushBack (format ["RecoilBasis: %1", (TB_recoilStart + _suppressed +  _customAimCoef) toFixed 2]);

        _return joinString "<br/>";
    },
    [7]
] call ace_common_fnc_watchVariable;
#endif

/*[missionNamespace, "ACE_setCustomAimCoef", QUOTE(ADDON), {
    (linearConversion [0, 1, GET_PAIN_PERCEIVED(ACE_player), 1, 5, true]) + (ACE_player getVariable [QEGVAR(medical_engine,aimFracture), 0])
}] call EFUNC(common,arithmeticSetSource);*/

TB_cacheWeaponType = ([currentWeapon player] call BIS_fnc_itemType) select 1;
TB_recoilFreeze = -1;

["weapon", {
    params ["_unit", "_newWeapon"];
    TB_cacheWeaponType = ([_newWeapon] call BIS_fnc_itemType) select 1;
}] call CBA_fnc_addPlayerEventHandler;

<<<<<<< HEAD
GVAR(recoilID) = ["ace_firedPlayer", {
    BEGIN_COUNTER(recoilFNC);
    if (GVAR(recoilCoef) == -1) exitWith
    {
        ["ace_firedPlayer", GVAR(recoilID)] call CBA_fnc_removePlayerEventHandler;
        END_COUNTER(recoilFNC);
    };

    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    if (_muzzle != primaryWeapon _unit && _muzzle != handgunWeapon _unit) exitWith {END_COUNTER(recoilFNC)};
    if (TB_recoilFreeze >= diag_tickTime) exitWith {END_COUNTER(recoilFNC)};
    if (vehicle _unit != _unit) exitWith {_unit setUnitRecoilCoefficient 0.1; END_COUNTER(recoilFNC)};

    private _suppressed = linearConversion [0, L_Suppress_Suppress_sys_intensity, L_Suppress_Suppress_sys_intensity * (L_Suppress_Suppress_sys_Threshold / 30), 0, 1, true];
    private _customAimCoef = getCustomAimCoef _unit;
    private _recoil = TB_recoilStart + _suppressed +  _customAimCoef;

    private _einfluss = (getCustomAimCoef _unit) + GVAR(recoilStart);
    private _deploy = isWeaponDeployed _unit;
    private _rested = isWeaponRested _unit;

    // Spezielle WaffenStats
    if (TB_cacheWeaponType == "MachineGun") then {ADD(_einfluss,100)};
    if (TB_cacheWeaponType == "SniperRifle" && {_deploy}) then {ADD(_einfluss,-50)};
    if ("rhs_weap_mk17" in toLower _weapon) then {
        ADD(_einfluss,50);
        if !("rhsusf_20rnd_762x51_sr25" in toLower _magazine) then {ADD(_einfluss,50)};
    };

    // Externe Einflüsse
    if (_rested) then {ADD(_einfluss,-10)};
    if (_deploy) then {ADD(_einfluss,-30)};

    // Waffen Einflüsse
    if (isClass (configfile >> "CfgPatches" >> "rhsusf_main") && _weapon == primaryWeapon _unit) then
    {
        (primaryWeaponItems _unit) params ["_silencer", "", "", "_bipod"];

        // Silencer
        private _muzzleHider = (toLower _silencer) in ["rhsusf_acc_sf3p556", "rhsusf_acc_sfmb556"];
        if (_mode == "Single" && {_muzzleHider}) then {ADD(_einfluss,-20)};
        if (_silencer != "" && {!_muzzleHider}) then {ADD(_einfluss,-10)};

        // Grip
        if (_bipod != "" && !_deploy && _bipod != "rhsusf_acc_harris_bipod") then {ADD(_einfluss,-10)};
    };

    if (_weapon == handgunWeapon _unit) then
    {
        (handgunItems _unit) params ["_silencer", "", "", "_bipod"];

        if (_silencer != "") then {ADD(_einfluss,-10)};
    };

    //_einfluss = 1 + (_einfluss / 100);
    /*["Recoil: %1 | Influ: %2 | AimCoef: %3 | Type: %4 | mode: %5 | deploy: %6 | rested: %7", // TODO Change
            (_recoil max 0.5) * GVAR(recoilCoef),
            _recoil max 0.5,
            getCustomAimCoef _unit,
            TB_cacheWeaponType,
            _mode,
            _deploy,
            _rested
        ] call FUNC(debug);*/
    _unit setUnitRecoilCoefficient (((_recoil max 0.5) * 1) * GVAR(recoilCoef));

    TB_recoilFreeze = diag_tickTime + 1;
    END_COUNTER(recoilFNC);
}] call CBA_fnc_addEventHandler;
