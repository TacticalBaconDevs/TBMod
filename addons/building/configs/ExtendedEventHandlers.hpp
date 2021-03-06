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
            init = QUOTE(['InitPost: %1', str _this] call EFUNC(main,debug); [_this select 0, 20000] call TFAR_antennas_fnc_initRadioTower); // clientInit
        };
    };
};

class Extended_Deleted_EventHandlers
{
    class TB_Land_TTowerSmall_1_F // geht nicht -.-, kA warum, zu müde jetzt
    {
        ADDON = QUOTE(['Delete: %1', str _this] call EFUNC(main,debug); (_this param [0,_this]) call tfar_antennas_fnc_deleteRadioTower);
    };
};
