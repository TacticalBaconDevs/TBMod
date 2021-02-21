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
        serverInit = QUOTE(call COMPILE_FILE(XEH_preServerInit));
    };
};

class Extended_PostInit_EventHandlers
{
    class ADDON
    {
        clientInit = QUOTE(call COMPILE_FILE(XEH_postClientInit));
        serverInit = QUOTE(call COMPILE_FILE(XEH_postServerInit));
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_InitPost_EventHandlers
{
    class TB_spezial_fobBase
    {
        class ADDON {serverInit = QUOTE(_this call FUNC(initFOB));};
    };

    #define EMPTY_VANILLA_INV(CLASSE) class CLASSE {class ADDON  {serverInit = QUOTE(_this call FUNC(clearArmaInv));};}
    EMPTY_VANILLA_INV(LandVehicle);
    EMPTY_VANILLA_INV(Car);
    EMPTY_VANILLA_INV(Tank);
    EMPTY_VANILLA_INV(Motorcycle);

    EMPTY_VANILLA_INV(Air);
    EMPTY_VANILLA_INV(Helicopter);
    EMPTY_VANILLA_INV(Plane);

    EMPTY_VANILLA_INV(Ship);
};

class Extended_Killed_EventHandlers
{
    class CAManBase
    {
        class TBModExt_statstracker
        {
            killed = "['TB_Kill', [(_this # 0) getVariable ['ace_medical_lastDamageSource', objNull], _this # 0]] call CBA_fnc_globalEvent;";
        };
    };
};
