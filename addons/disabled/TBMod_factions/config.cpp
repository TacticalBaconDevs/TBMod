class CfgPatches
{
    class TBMod_factions
    {
        name = "TBMod Factions";

        units[] = {
            // I_TB_Drogen
            "I_ITBDrogen_Drogenheandler_01",
            "I_ITBDrogen_Drogenheandler_02",
            "I_ITBDrogen_Drogenheandler_03",
            "I_ITBDrogen_Drogenheandler_04",
            "I_ITBDrogen_Drogenboss_01",
            "I_ITBDrogen_Drogenboss_02",
            "I_ITBDrogen_OffroadSupport_01",
            "I_ITBDrogen_SuvBoss_01",

            // CIV_TB
            "C_TB_Konsument_Heroin_01",
            "C_TB_Konsument_Heroin_02",
            "C_TB_Konsument_Cocain_01",
            "C_TB_Konsument_Cocain_02"
        };
        weapons[] = {};

        requiredAddons[] = {
            "TBMod_main",
            "A3_Characters_F"
        };
        addonRootClass = "TBMod_main";
    };
};

class CfgFactionClasses
{
    class CIV_TB
    {
        displayName = "[TB] Zivilisten";
        side = 3;
        flag = "\a3\Data_f\Flags\flag_FIA_co.paa";
        icon = "\a3\Data_f\Flags\flag_FIA_co.paa";
        priority = 0;
    };
    class I_TB_Drogen
    {
        displayName = "[TB] Drogenhaendler";
        side = 2;
        flag = "\A3\ui_f\data\map\markers\flags\AAF_ca.paa";
        icon = "\A3\ui_f\data\map\markers\flags\AAF_ca.paa";
        priority = 0;
    };
    class I_TB_badboys
    {
        displayName = "[TB] Kleinkriminelle";
        side = 2;
        flag = "\A3\ui_f\data\map\markers\flags\AltisColonial_ca.paa";
        icon = "\A3\ui_f\data\map\markers\flags\AltisColonial_ca.paa";
        priority = 0;
    };
    class I_TB_Waffen
    {
        displayName = "[TB] Waffenschieber";
        side = 2;
        flag = "\A3\ui_f\data\map\markers\flags\FIA_ca.paa";
        icon = "\A3\ui_f\data\map\markers\flags\FIA_ca.paa";
        priority = 0;
    };
};

class EventHandlers;
class CBA_Extended_EventHandlers_base;
class CfgVehicles
{
    #include "CIV_TB\CfgVehicles.hpp"
    #include "I_TB_Drogen\CfgVehicles.hpp"
};

class CfgGroups
{
    #include "CIV_TB\CfgGroups.hpp"
    #include "I_TB_Drogen\CfgGroups.hpp"
};
