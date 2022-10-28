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

// Based on: https://github.com/kellerkompanie/kellerkompanie-mods/blob/master/addons/loot/XEH_postInitClient.sqf
GVAR(transferAction_statement) = {
    params ["_target", "_player", "_vehicle"];
    {_vehicle addItemCargoGlobal [_x, 1]} forEach (itemCargo _target);
    {_vehicle addWeaponCargoGlobal [_x, 1]} forEach (weaponCargo _target);
    {_vehicle addBackpackCargoGlobal [_x, 1]} forEach (backpackCargo _target);
    {_vehicle addMagazineCargoGlobal [_x, 1]} forEach (magazineCargo _target);
    deleteVehicle _target;
};

GVAR(transferAction_nearestObjects) = {
    params ["_target", "_player"];

    (nearestObjects [_player, ace_cargo_cargoHolderTypes, 10]) select {
        (_x != _target) && {([_target, _x] call ace_interaction_fnc_getInteractionDistance) < 10}
    }
};

// Based on: https://github.com/kellerkompanie/kellerkompanie-mods/blob/master/addons/loot/XEH_postInitClient.sqf
GVAR(transferAction) = [
    QGVAR(transferAction), "Transfer ins Inventar", "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa",
    {
        params ["_target", "_player"];

        ([_target, _player] call GVAR(transferAction_nearestObjects)) params [["_nearestVehicle", objNull]];
        if !(isNull _nearestVehicle) then {[_target, _player, _nearestVehicle] call GVAR(transferAction_statement)};
    },
    {
        alive _target &&
        {locked _target < 2} &&
        {[_player, _target, ["isNotSwimming"]] call ace_common_fnc_canInteractWith} &&
        {
            ((nearestObjects [_player, ace_cargo_cargoHolderTypes, 10]) findIf {
                (_x != _target) && {([_target, _x] call ace_interaction_fnc_getInteractionDistance) < 10}
            }) != -1
        }
    },
    {
        private _vehicles = [_target, _player] call GVAR(transferAction_nearestObjects);
        [_vehicles, GVAR(transferAction_statement), _target] call ace_interact_menu_fnc_createVehiclesActions;
    }
] call ace_interact_menu_fnc_createAction;

ADDON = true;
