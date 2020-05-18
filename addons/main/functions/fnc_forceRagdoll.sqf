#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://killzonekid.com/arma-scripting-tutorials-forced-ragdoll/

    Example: call TBMod_main_fnc_forceRagdoll
*/
if (!canSuspend) exitWith {};
if (vehicle ACE_player != ACE_player) exitWith {};

[
    {
        private _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
        _rag setMass 1e10;
        _rag attachTo [ACE_player, [0,0,0], "Spine3"];
        _rag setVelocity [0,0,10];
        ACE_player allowDamage false;
        detach _rag;

        [
            {
                deleteVehicle _this;
                ACE_player allowDamage true;
            },
            _rag,
            0.2
        ] call CBA_fnc_waitAndExecute;
    },
    [],
    1
] call CBA_fnc_waitAndExecute;
