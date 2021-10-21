#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Deaktivierbar per:
        - Eden Setting unter Inventar -> "Inventar nicht löschen"
        - per Konfig über "TBMod_main_disableCargoCleanup = 1;"
*/
params ["_vehicle"];

if !(alive _vehicle) exitWith {};
if (_vehicle getVariable [QGVAR(disableCargoCleanup), false]) exitWith {};
if (getNumber (configOf _vehicle >> QGVAR(disableCargoCleanup)) == 1) exitWith {};

clearBackpackCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
