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
        private _temperature = ACE_player getVariable [format ["ace_overheating_%1_temp", _weapon], 0];
        private _scaledTemperature = linearConversion [0, 1000, _temperature, 0, 1, true];
        ([_weapon] call ace_overheating_fnc_getWeaponData) params ["_dispersion", "_slowdownFactor", "_jamChance"];
        private _stanceMod = [1, 0.5, 0, 0, 0] select (["STAND", "CROUCH", "PRONE", "UNDEFINED", ""] find (stance ACE_player));

        private _return = [];
        _return pushBack (format ["EngineRecoil: %1", (unitRecoilCoefficient ACE_player) toFixed 2]);
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

GVAR(cacheWeaponType) = ([currentWeapon player] call BIS_fnc_itemType) select 1;
GVAR(recoilFreeze) = -1;
GVAR(fnc_recoil) = {
    BEGIN_COUNTER(recoilFNC);
    if (GVAR(recoilCoef) == -1) exitWith
    {
        ["ace_firedPlayer", GVAR(recoilID)] call CBA_fnc_removePlayerEventHandler;
        END_COUNTER(recoilFNC);
    };

    //params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
    params ["_unit", "_weapon", "_muzzle", "_mode", "", "_magazine"];

    if (GVAR(recoilFreeze) >= diag_tickTime) exitWith {END_COUNTER(recoilFNC)};
    if ((toLower _weapon) in ["throw", "put"] || !(_muzzle in [primaryWeapon _unit, handgunWeapon _unit])) exitWith
    {
        TRACE_4("Reset setUnitRecoilCoefficient because _muzzle is not primary/handgun", _this, (toLower _weapon) in ["throw", "put"], primaryWeapon _unit, handgunWeapon _unit);
        _unit setUnitRecoilCoefficient 1;
        END_COUNTER(recoilFNC);
    };
    if (vehicle _unit != _unit) exitWith
    {
        TRACE_1("Set setUnitRecoilCoefficient 0.1 because in vehicle", _this);
        _unit setUnitRecoilCoefficient 0.1;
        END_COUNTER(recoilFNC);
    };

    /*
        // Neuer Ansatz
        private _einfluss = (getCustomAimCoef _unit) + GVAR(recoilStart);
        private _deploy = isWeaponDeployed _unit;
        private _rested = isWeaponRested _unit;
        // Spezielle WaffenStats
        if (GVAR(cacheWeaponType) == "MachineGun") then {ADD(_einfluss,100)};
        if (GVAR(cacheWeaponType) == "SniperRifle" && {_deploy}) then {ADD(_einfluss,-50)};
        if ("rhs_weap_mk17" in (toLower _weapon)) then
        {
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
    */

    /*
        Noch umzusetzende Ideen:
            - automatisch Sachen auf alle Schalldämpfer usw beziehen
            - Supression weiter ausbauen
            - Blut Faktor / Medizinische Faktoren rein
            - Verwackelfaktor mit rein GGF diesen auch beeinflussen
            - Munition bzw Kaliber Unterschiede
            - Compatible Munition anders behandeln MK17 (andere Munition anderes behandeln)
    */

    private _recoil = GVAR(recoilStart) + (getCustomAimCoef _unit) + _suppressed;
    private _deploy = isWeaponDeployed _unit;
    private _rested = isWeaponRested _unit;

    // Spezielle WaffenStats
    if (GVAR(cacheWeaponType) == "MachineGun") then {ADD(_recoil, 2)};
    if (GVAR(cacheWeaponType) == "SniperRifle" && {_deploy}) then {ADD(_recoil, -0.5)};
    if ("rhs_weap_mk17" in (toLower _weapon)) then
    {
        ADD(_recoil, 1);
        if !("rhsusf_20rnd_762x51_sr25" in (toLower _magazine)) then {ADD(_recoil, 1)};
    };

    // Externe Einflüsse
    if (_rested) then {ADD(_recoil, -0.2)};
    if (_deploy) then {ADD(_recoil, -0.3)};

    // Waffen Einflüsse
    if (isClass (configfile >> "CfgPatches" >> "rhsusf_main") && _weapon == primaryWeapon _unit) then // TODO: check ob waffe von RHS, sonst auch nicht
    {
        (primaryWeaponItems _unit) params ["_silencer", "", "", "_bipod"];

        // Silencer
        private _muzzleHider = (toLower _silencer) in ["rhsusf_acc_sf3p556", "rhsusf_acc_sfmb556"];
        if (_mode == "Single" && {_muzzleHider}) then {ADD(_recoil, -0.2)};
        if (_silencer != "" && {!_muzzleHider}) then {ADD(_recoil, -0.1)};

        // Grip
        if (_bipod != "" && !_deploy && _bipod != "rhsusf_acc_harris_bipod") then {ADD(_recoil, -0.1)};
    };

    if (_weapon == handgunWeapon _unit) then
    {
        (handgunItems _unit) params ["_silencer", "", "", "_bipod"];

        if (_silencer != "") then {ADD(_recoil, -0.1)};
    };

    _unit setUnitRecoilCoefficient ((_recoil max 0.5) * GVAR(recoilCoef));

    GVAR(recoilFreeze) = diag_tickTime + 1;
};

["weapon", {
    params ["_unit", "_newWeapon"];
    GVAR(cacheWeaponType) = ([_newWeapon] call BIS_fnc_itemType) select 1;

    // ["_unit", "_weapon", "_muzzle", "_mode", "", "_magazine"]
    [_unit, _newWeapon, _newWeapon, "Single", nil, currentMagazine player] call FNC(recoil);
}] call CBA_fnc_addPlayerEventHandler;

GVAR(recoilID) = ["ace_firedPlayer", LINKFUNC(recoil)] call CBA_fnc_addEventHandler;
