#include "script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    see https://github.com/CBATeam/CBA_A3/blob/master/addons/settings/fnc_init.sqf
*/
ADDON = false;
PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Kisteninhalt direkt ins ArmaInventar
if (isServer) then
{
    ["ace_cargoLoaded", {
        params ["_item", "_vehicle"];

        private _config = configOf _item;
        if (!isNumber (_config >> QGVAR(isTB)) || {!isNumber (_config >> QGVAR(directly2Inv))}) exitWith {};

        if (getNumber (_config >> QGVAR(directly2Inv)) == 1) then
        {
            {_vehicle addItemCargoGlobal [_x, 1]} forEach (itemCargo _item);
            {_vehicle addWeaponCargoGlobal [_x, 1]} forEach (weaponCargo _item);
            {_vehicle addBackpackCargoGlobal [_x, 1]} forEach (backpackCargo _item);
            {_vehicle addMagazineCargoGlobal [_x, 1]} forEach (magazineCargo _item);

            deleteVehicle _item;
        };
    }] call CBA_fnc_addEventHandler;
};


ADDON = true;
