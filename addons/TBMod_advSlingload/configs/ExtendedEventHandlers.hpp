/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_PostInit_EventHandlers
{
    class TBMod_advSlingload
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_advSlingload\XEH_postClientInit.sqf'";
        init = "call compile preprocessFileLineNumbers '\TBMod_advSlingload\XEH_postInit.sqf'";
    };
};

class Extended_PreInit_EventHandlers
{
    class TBMod_advSlingload
    {
        init = "call compile preprocessFileLineNumbers '\TBMod_advSlingload\XEH_preInit.sqf'";
    };
};
