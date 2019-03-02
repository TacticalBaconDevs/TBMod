/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    class TBMod_arsenal
    {
        tag = "TB";

        class functions
        {
            file = "\TBMod_arsenal\functions";
            class actionMain {};
            class changeRolle {};
            class getRollenName {};
            class isArsenalType {};
            class loadDefault {};
            class modifierChangeArsenalType {};
            class modifierMainAction {};
            class modifierRollenname {};
            class setArsenal {};
            class setAttributes {};
            class waitUntilLoaded {};
            class whitelist {};
            class deleteAny {};
        };

        class arsenal
        {
            file = "\TBMod_arsenal\arsenal";
            class arsenalUSA {};
            class arsenalRUSS {};
            class arsenalBW {};
            class arsenalVANILLA {};
            class arsenalThemen {};
        };

        class arsenalThemen
        {
            file = "\TBMod_arsenal\arsenal\themen";
            class arsenalUSAVietnam {};
            class arsenalRUSSSimple {};
            class arsenalVANILLACOP {};
            class arsenalSWOPRebuplik {};
        };
    };
};