/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
class Extended_PostInit_EventHandlers
{
    class TBMod_Eden
    {
        clientInit = "call compile preprocessFileLineNumbers '\TBMod_main\XEH_postClientInit.sqf'";
    };
};
