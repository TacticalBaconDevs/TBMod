/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    class B_TacticalPack_Base;
    class BWA3_TacticalPack_Fleck : B_TacticalPack_Base // Taktischer Rucksack
    {
        mass = 50; // 12
        maximumLoad = 280; // 96
    };

    class Bag_Base;
    class BWA3_PatrolPack_Fleck : Bag_Base // Kampfrucksack - äquivalent zum Bergen Rucksack
    {
        mass = 104; // 60
        maximumLoad = 500; // 320
    };
};