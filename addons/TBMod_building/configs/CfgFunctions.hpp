/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    class TBMod_building
    {
        tag = QUOTE(Double(ADDON,COMPONENT));

        class functions
        {
            file = "\TBMod_building\functions";
            class placePlaceables {};
            class placePlaceablesBig {};
            class initItem {};
            class initItemBig {};
            class moduleRessourcenFahrzeug {};
            class moduleKranFahrzeug {};
            class modifierShowVehicleType {};
            class getFuel {};
            class getVehicleType {};
        };
    };
};