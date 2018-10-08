/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_PostInit_EventHandlers
{
    class TBMod_ADVSlingload
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_ADVSlingload\XEH_postClientInit.sqf'";
        init = "call compile preprocessFileLineNumbers '\TBMod_ADVSlingload\XEH_postInit.sqf'";
    };
};

class Extended_PreInit_EventHandlers
{
    class TBMod_ADVSlingload
    {
        init = "call compile preprocessFileLineNumbers '\TBMod_ADVSlingload\XEH_preInit.sqf'";
    };
};
