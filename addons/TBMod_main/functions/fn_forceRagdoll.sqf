/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://killzonekid.com/arma-scripting-tutorials-forced-ragdoll/
*/
if (!canSuspend) exitWith {};
if (vehicle player != player) exitWith {};
uiSleep 1;

private _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_rag setMass 1e10;
_rag attachTo [player, [0,0,0], "Spine3"];
_rag setVelocity [0,0,10];
player allowDamage false;
detach _rag;

_rag spawn {
    deleteVehicle _this;
    player allowDamage true;
};
