/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

// Original
// /*flashbang effect for grenades with range effectivnes 20m*/
// [_this, 20] call rhs_fnc_flashbang;

/*
    flashbang script - checking for effects
    hooked to particles onDestruction event

    a: reyhard
    modified: TacticalBacon-Team
*/
private _projectile = _this;
private _distance = 20;
private _units = _projectile nearEntities ["CAManBase", _distance];
private _projectileHigh = [_projectile select 0, _projectile select 1, (_projectile select 2) + 0.5];

{
    private _eyePos = eyePos _x;

    if (alive _x && {!lineIntersects [_eyePos, AGLtoASL _projectileHigh, _x]}) then
    {
        private _strength = linearConversion [0, _distance, _x distance _projectile, 2, 0];
        [_x, [2, 0] select (isPlayer _x), _strength] remoteExec ["rhs_fnc_flashbang_effect", _x];
    };
}
foreach _units;
