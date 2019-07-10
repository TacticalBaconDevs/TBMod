/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_PostInit_EventHandlers
{
    class TBMod_eden
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_eden\XEH_postClientInit.sqf'";
    };
};

class Extended_PreInit_EventHandlers
{
    class TBMod_main
    {
        serverInit = "call compile preprocessFileLineNumbers '\TBMod_eden\XEH_preServerInit.sqf'";
    };
};
