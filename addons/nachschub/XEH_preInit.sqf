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

if !(call EFUNC(main,isTBMission)) exitWith {};

// Munition aus FahrzeugMunikisten direkt ins ArmaInventar
["ace_cargoLoaded", {
    params ["_item", "_vehicle"];

    if ((toLower (typeOf _item)) select [0, 20] in ["tb_supply_uk_vehicle", "tb_supply_uk_warrior"]) then
    {
        {
            _vehicle addMagazineCargoGlobal [_x, 1];
        }
        forEach (magazineCargo _item);

        deletevehicle _item;
        //systemChat "Kisteninhalt wurde ins Inventar geladen";
    };
}] call CBA_fnc_addEventHandler;

ADDON = true;
