
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgCloudlets
{
    class RHS_flashbang_10;
    class RHS_flashbang_20: RHS_flashbang_10
    {
        beforeDestroyScript = QPATHTOF(tb_flashbang_20m.sqf);
    };
};
