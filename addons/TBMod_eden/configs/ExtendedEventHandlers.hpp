/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_PostInit_EventHandlers
{
    class TBMod_eden
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_eden\XEH_postClientInit.sqf'";
        serverInit = "call compile preprocessFileLineNumbers '\TBMod_eden\XEH_postServerInit.sqf'";
    };
};
