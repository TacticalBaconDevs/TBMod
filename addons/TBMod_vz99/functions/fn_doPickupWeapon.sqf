#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
params ["_target", "_player"];

{
    _x params ["_xClassname", "_xAmmo"];

    if (_xAmmo > 0) then
    {
        [
            _player,
            getText (configFile >> "CfgMagazines" >> _xClassname >> "TB_vz99_base"),
            "",
            _xAmmo
        ] call ace_common_fnc_addToInventory;
    };
}
forEach (magazinesAmmoFull _target);

deleteVehicle _target;
_player addWeapon "TB_vz99_carryWeapon";

