/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_PreStart_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers
{
    class TB_Land_TTowerSmall_1_F
    {
        class ADDON // geht nicht -.-, kA warum, zu müde jetzt
        {
            init = QUOTE([ARR_2('InitPost: %1', str _this)] call DFUNC(main,debug); [ARR_2(_this select 0, 20000)] call TFAR_antennas_fnc_initRadioTower); // clientInit
        };
    };
};

class Extended_Deleted_EventHandlers
{
    class TB_Land_TTowerSmall_1_F // geht nicht -.-, kA warum, zu müde jetzt
    {
        ADDON = QUOTE([ARR_2('Delete: %1', str _this)] call DFUNC(main,debug); (_this param [ARR_2(0, _this)]) call tfar_antennas_fnc_deleteRadioTower);
    };
};
