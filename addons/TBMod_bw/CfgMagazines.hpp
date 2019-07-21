/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgMagazines
{
    class BWA3_10Rnd_127x99_G82;
    class BWA3_10Rnd_127x99_G82_Raufoss : BWA3_10Rnd_127x99_G82 // 50.cal HEIAP-T (High-Explosive Incendiary/Armor-Piercing Ammunition Tracer) BW
    {
        descriptionShort = ".50Cal HEIAP-T Magazine BW";
        displayName = "High-Explosive Incendiary/Armor-Piercing Ammunition Tracer";
        displayNameShort = ".50Cal HEIAP-T BW";

        mass = 28; // 20
        tracersEvery = 1; // 0
    };

    class BWA3_10Rnd_127x99_G82_Raufoss_Tracer;
    class BWA3_10Rnd_127x99_G82_Raufoss_Tracer_Dim : BWA3_10Rnd_127x99_G82_Raufoss_Tracer // 50.cal Long-Range Sniper BW
    {
        descriptionShort = ".50Cal LRS BW";
        displayName = ".50Cal Long-Range Sniper Magazine";
        displayNameShort = ".50Cal LRS BW";

        mass = 17; // 20
    };


};