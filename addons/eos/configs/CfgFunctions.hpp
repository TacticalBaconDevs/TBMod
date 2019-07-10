/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    class TBMod_eos
    {
        tag = ADDON;

        class modules
        {
            file = "\TBMod_eos\core";

            class core {};
            class moduleZone {};
            class bastionCore {};
            class moduleBastion {};
            class unitPools {};
        };

        class functions
        {
            file = "\TBMod_eos\functions";

            class spawnVehicle {};
            class spawnGroup {};
            class findSafePos {};
            class setCargo {};
            class shk_patrol {};
            class shk_buildingpos {};
            class transportUnload {};
            class fileExists {};
        };
    };
};
