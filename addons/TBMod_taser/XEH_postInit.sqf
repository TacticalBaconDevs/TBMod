/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
if !(call TB_fnc_isTBMission) exitWith {};

["CAManBase", "HitPart", {
    {
        _x params ["_target", "_shooter", "_projectile", "_position", "_velocity", "_selection", "_ammo", "_vector", "_radius", "_surfaceType", "_isDirect"];
        
        if (typeOf _projectile == "tb_ammo_taser") exitWith
        {
            //[_target, [2, 0] select (isPlayer _target), [5, 2] select (isPlayer _target)] remoteExec ["rhs_fnc_flashbang_effect", _target];
            [_target, 0, 1] remoteExec ["rhs_fnc_flashbang_effect", _target];
            [_target, true, 20, true] call ace_medical_fnc_setUnconscious;
        };
    }
    forEach _this;
}] call CBA_fnc_addClassEventHandler;
