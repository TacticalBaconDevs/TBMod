/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    class TBMod_nachschub
    {
        tag = QUOTE(DOUBLES(ADDON,COMPONENT));

        class functions
        {
            file = "\TBMod_nachschub\functions";
            class insertChildrenDeleteBox {};
            class modifierSupplyMain {};
            class createSupply {};
        };
    };
};