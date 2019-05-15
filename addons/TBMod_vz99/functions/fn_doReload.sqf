#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
params ["_mortarVeh", "_player"];

// If we have a round loaded, exit
if (!((magazinesAmmoFull _mortarVeh) isEqualTo [])) exitWith {};

// Make sure empty mag is removed so it "autoloads"
private _loadedEmpty = _mortarVeh magazinesTurret [0];
if !(_loadedEmpty isEqualTo []) then
{
    _mortarVeh removeMagazinesTurret [_loadedEmpty select 0, [0]];
};

private _magToLoad = TB_vz99_nextReload;
if (_magToLoad == "") exitWith {};

private _baseMag = getText (configFile >> "CfgMagazines" >> _magToLoad >> "TB_vz99_base");

// HE - Impact can be done by basic HE shells or the multi-fuze, only use multi if we have no basic
if ((_baseMag == "TB_vz99_HE") && {!(_baseMag in (magazines _player))}) then
{
    _baseMag = "TB_vz99_HE_multi";
    _magToLoad = if (_magToLoad == "TB_vz99_HE") then {"TB_vz99_HE_multi"} else {"TB_vz99_HE_multi_charge0"};
};

if !(_baseMag in (magazines _player)) exitWith
{
    ["No Ammo"] call ace_common_fnc_displayTextStructured;
};

_player removeMagazine _baseMag;

_mortarVeh addMagazineTurret [_magToLoad, [0]];
