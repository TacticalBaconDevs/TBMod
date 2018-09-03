/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class TBMod_zusatzStuff_LV
{
    tag = "TB_EOS";
    
    class modules
    {
        file = "\TBMod_zusatzStuff\eos\core";
        class core {};
        class spawn {};
        class unitPools {};
        class fileExists {};
        class bastionCore {};
        class bastionSpawn {};
    };
    
    class functions
    {
        file = "\TBMod_zusatzStuff\eos\functions";
        class spawnVehicle {};
        class spawnGroup {};
        class setSkill {};
        class findSafePos {};
        class setCargo {};
        class shk_patrol {};
        class shk_pos {};
        class shk_getPos {};
        class shk_buildingpos {};
        class transportUnload {};
        class moduleZone {};
        class moduleBastion {};
    };
};
