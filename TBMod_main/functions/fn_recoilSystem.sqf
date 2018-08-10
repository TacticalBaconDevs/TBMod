/*
    Author: Willi "shukari" Graff
*/
params [["_input", false, [false]]];

if (TB_recoilCoef == -1 && _input) then {TB_recoilCoef = 1};
if (TB_recoilCoef == -1) exitWith {};

TB_cacheType = [];
player addEventHandler ["FIRED", {
    if (TB_recoilCoef == -1) exitWith {player removeEventHandler ["FIRED", _thisEventHandler]};
    params ["", "_weapon"];
    
    if (TB_cacheType isEqualTo [] || {TB_cacheType # 0 != _weapon}) then {TB_cacheType = [_weapon, ([currentWeapon player] call BIS_fnc_itemType)#1]};
    TB_cacheType params ["", "_wType", "_time"];
    
    if (_time >= diag_tickTime) exitWith {};
    
    private _deploy = isWeaponDeployed player;
    private _recoil = getCustomAimCoef player;
    
    if (_wType isEqualTo "MachineGun") then {_recoil = _recoil + ([2, 0] select _deploy)};
    if (_wType isEqualTo "SniperRifle" && {_deploy}) then {_recoil = _recoil - 1};
    if (isWeaponRested player) then {_recoil = _recoil - 0.3};
    if (_deploy) then {_recoil = _recoil - 0.6};
    
    player setUnitRecoilCoefficient _recoil;
    
    TB_cacheType set [2, diag_tickTime + 2];
}];
