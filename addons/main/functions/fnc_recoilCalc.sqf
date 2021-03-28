#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if (_this isEqualTo []) then
{
    private _weaponState = weaponState ACE_player;
    _this = [ACE_player, _weaponState # 0, _weaponState # 1, _weaponState # 2, nil, _weaponState # 3];
};
params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

if ((toLower _weapon) in ["throw", "put"] || !(_muzzle in [primaryWeapon _unit, handgunWeapon _unit])) exitWith {1};
if (vehicle _unit != _unit) exitWith {0.1};

private _suppressed = linearConversion [L_Suppress_Suppress_sys_intensity / 3, L_Suppress_Suppress_sys_intensity, L_Suppress_Suppress_sys_intensity * (L_Suppress_Suppress_sys_Threshold / 30), 0, 0.5, true];
private _aimCoef = linearConversion [0, 5, getCustomAimCoef _unit, 0, 1, true];
private _recoil = GVAR(recoilStart) + _aimCoef + _suppressed;
private _deploy = isWeaponDeployed _unit;
private _rested = isWeaponRested _unit;

// Spezielle WaffenStats
if (GVAR(cacheWeaponType) == "MachineGun") then {ADD(_recoil, 2)};
if (GVAR(cacheWeaponType) == "SniperRifle" && {_deploy}) then {ADD(_recoil, -0.5)};
if ("rhs_weap_mk17" in (toLower _weapon)) then
{
    if !("rhs_mag_20Rnd_SCAR_762x51_" in (toLower _magazine) || "rhs_mag_30Rnd_556x45_Mk318_SCAR_" in (toLower _magazine)) then {ADD(_recoil, 0.5)};
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

((_recoil max 0.5) * GVAR(recoilCoef))

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
