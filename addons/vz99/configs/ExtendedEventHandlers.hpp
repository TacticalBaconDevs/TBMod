/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
class Extended_PostInit_EventHandlers
{
    class TBMod_vz99
    {
        clientInit = "call compile preProcessFileLineNumbers '\TBMod_vz99\XEH_postInit.sqf'";
    };
};

class Extended_FiredBIS_EventHandlers
{
    class TB_vz99_mortar
    {
        class TBMod_vz99
        {
            firedBIS = QUOTE(_this call FUNC(handleFired));
        };
    };
};
