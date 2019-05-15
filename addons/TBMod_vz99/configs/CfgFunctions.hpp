/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    class TBMod_vz99
    {
        tag = QUOTE(DOUBLES(ADDON,COMPONENT));

        class functions
        {
            file = "\TBMod_vz99\functions";

            class canDeployWeapon {};
            class canPickupWeapon {};
            class canSelectNextMagazine {};
            class doDeployWeapon {};
            class doPickupWeapon {};
            class doReload {};
            class doSelectNextMagazine {};
            class handleFired {};
            class handlePlayerVehicleChanged {};
            class levelToGround {};
        };
    };
};
