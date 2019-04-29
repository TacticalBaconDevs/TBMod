/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
params ["", "_player"];

[
    {
        [
            2,
            [],
            {
                private _posATL = ACE_player getRelPos [0.5, 0]; // in front of player
                _posATL set [2, (getPosATL ACE_player) select 2];

                private _mortarVeh = "TB_vz99_mortar" createVehicle _posATL;
                _mortarVeh setPosATL _posATL;

                // TODO: von außen nachladbar machen

                ACE_player removeWeapon "TB_vz99_carryWeapon";

                // Level and set starting turret dir to player's dir:
                [_mortarVeh, getDir ACE_player] call TB_fnc_levelToGround;

                // Move in auto
                ACE_player moveInGunner _mortarVeh;
            },
            {},
            "Baue auf..."
        ] call ace_common_fnc_progressBar;
    },
    []
] call CBA_fnc_execNextFrame; // Delay a frame for interaction menu

_player playAction "SecondaryWeapon";
