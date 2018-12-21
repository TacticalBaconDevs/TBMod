/*
    Author: shukari
*/
params ["_target", "_shooter", "_bullet", "_position", "_velocity", "_selection", "_ammo", "_direction", "_radius", "_surface", "_direct"];

// TB_trackHit = true;
if (!isNil "TB_trackHit" && {TB_trackHit}) then
{
    hint format ["Target: %1\nBullet: %2\nVelocity: %3\nSelection: %4\nAmmo: %5\nDir: %6\nRadius: %7\nSurface: %8\nDirect: %9",
        _target, _bullet, _velocity, _selection, _ammo, _direction, _radius, _surface, _direct];
};

// BisThing
if (_target getVariable ["TB_ausbildung_popUpTargets", ""] == "" || _target getVariable ["TB_ausbildung_popUpTargets", ""] == "0") exitWith
{
    if (isNil "TB_bisFNC_hitPart") then {TB_bisFNC_hitPart = compileFinal preprocessFileLineNumbers "\A3\Structures_F\Training\data\scripts\TargetP_Inf_F_hitPart.sqf"};
    _this call TB_bisFNC_hitPart;
};

// --- abort if no hit or script is in progress
if (!("target" in _selection) || _target animationPhase "Terc" > 0) exitWith {true};

// --- drop target
_target animate ["Terc", 1]; 
_target setDamage 0;

// --- raise target
// _target animate ["Terc", 0];


true
