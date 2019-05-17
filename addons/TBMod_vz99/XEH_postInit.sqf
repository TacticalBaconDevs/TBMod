#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
if (!hasInterface) exitWith {};

TB_vz99_nextReload = "TB_vz99_HE";

// Add keybinds
[
    "TBMod",
    "TB_vz99_reload",
    "Reload VZ99",
    {
        private _mortarVeh = vehicle ACE_player;
        if ((_mortarVeh == ACE_player) || {!(_mortarVeh isKindOf "TB_vz99_mortar")}) exitWith {false};
        if !([ACE_player, _mortarVeh, []] call ace_common_fnc_canInteractWith) exitWith {false};

        [_mortarVeh, ACE_player] call FUNC(doReload);

        true
    },
    {false},
    [19, [false, false, false]],
    false
] call CBA_fnc_addKeybind; // R Key

["vehicle", {_this call FUNC(handlePlayerVehicleChanged)}, true] call CBA_fnc_addPlayerEventHandler;
