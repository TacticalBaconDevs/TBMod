/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    // ###################### TFAR RADIOS leichter ######################
    class TFAR_Bag_Base;
    class TFAR_rt1523g: TFAR_Bag_Base
    {
        maximumLoad = 80; // 50
        mass = 15; // 80
    };
    class TFAR_rt1523g_big: TFAR_rt1523g
    {
        maximumLoad = 160; // 160
        mass = 30; // 160
    };
    class TFAR_rt1523g_sage: TFAR_rt1523g
    {
        maximumLoad = 117; // 100
        mass = 22; // 120
    };
};
