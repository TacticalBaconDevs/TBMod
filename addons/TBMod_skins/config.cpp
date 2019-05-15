class CfgPatches
{
    class TBMod_skins
    {
        name = "TBMod skins";

        author = "Eric";

        weapons[] = {
            "TB_Uniform_SEK_U",
            "TB_Uniform_Kommissar_U",
            "TB_Uniform_Polizist_U",
            "TB_Uniform_presi_U"
        };

        vehicles[] = {
            "TB_Uniform_Sek",
            "TB_Uniform_Kommissar",
            "TB_Uniform_rekrut",
            "TB_Uniform_presi",
            "TB_Vehicles_sek_light",
            "TB_Vehicles_polizei_hellcat",
            "TB_Vehicles_sek_hellcat",
            "TB_Vehicles_polizei_hunter"
        };

        requiredAddons[] = {"TBMod_main"};
        addonRootClass = "TBMod_main";
    };
};

// Configs
#include "script_macros.hpp"
#include "configs\CfgVehicles.hpp"
#include "configs\CfgWeapons.hpp"
#include "configs\CfgEditorCategories.hpp"
#include "configs\CfgEditorSubcategories.hpp"
