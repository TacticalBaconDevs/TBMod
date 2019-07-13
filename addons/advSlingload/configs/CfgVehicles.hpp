/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgVehicles
{
    class ReammoBox_F;
    class GVAR(ropeInvisibleObject) : ReammoBox_F
    {
        displayName = "Unsichtbares Object";
        author = "TBMod";

        scope = 1;
        scopeCurator = 1;

        disableInventory = 1;

        ace_cargo_canLoad = 0;
        ace_cargo_size = -1;
        DLC = "Expansion";
        model = "\A3\Weapons_F\DummyNVG.p3d";
    };
};
