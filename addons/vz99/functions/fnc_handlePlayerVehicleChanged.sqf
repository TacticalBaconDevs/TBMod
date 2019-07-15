#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
params ["_player", "_mortarVeh"];

if (isNull _player) exitWith {};
if (isNull _mortarVeh) exitWith {};
if !(_mortarVeh isKindOf "TB_vz99_mortar") exitWith {};

// Disable vehicle's NVG system based on if player is equiped
// Needed as we are in GUNNER view, so we need to use vehicle's vision system
_mortarVeh disableNVGEquipment ((hmd _player) == "");

[
    {
        params ["_args", "_pfID"];
        _args params ["_player", "_mortarVeh", "_levelCheck"];

        if ((!alive _player) || {!alive _mortarVeh} || {ACE_player != _player}) exitWith
        {
            [_pfID] call CBA_fnc_removePerFrameHandler;
        };

        if ((vehicle _player) != _mortarVeh) exitWith
        {
            [_pfID] call CBA_fnc_removePerFrameHandler;

            if (((_player distance _mortarVeh) < 5) && {[_mortarVeh, _player] call FUNC(canPickupWeapon)} && {[_player, _mortarVeh, []] call ace_common_fnc_canInteractWith}) then
            {
                private _weaponDir = _mortarVeh weaponDirection (currentWeapon _mortarVeh);
                private _azimuth = (_weaponDir select 0) atan2 (_weaponDir select 1);

                _player setDir _azimuth;
                [_mortarVeh, _player] call FUNC(doPickupWeapon);
            };
        };

        // Check leveling system
        if (CBA_missionTime > _levelCheck) then
        {
            _args set [2, CBA_missionTime + 5];
            [_mortarVeh, false] call FUNC(levelToGround);
        };

    },
    0,
    [_player, _mortarVeh, CBA_missionTime + 1]
] call CBA_fnc_addPerFrameHandler;
