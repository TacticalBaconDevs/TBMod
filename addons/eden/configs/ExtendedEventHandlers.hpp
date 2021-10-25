/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_PreStart_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
        serverInit = QUOTE(call COMPILE_SCRIPT(XEH_preServerInit));
    };
};

class Extended_PostInit_EventHandlers
{
    class ADDON
    {
        clientInit = QUOTE(call COMPILE_SCRIPT(XEH_postClientInit));
    };
};
