/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define addCategory(EDITORSUB) editorCategory = "EdCat_TB_skins"; \
            editorSubcategory = EdSubcat_TB_skins_##EDITORSUB; \
            faction = "BLU_F"; \
            side = 1;\
            scope = 2;\
            scopeCurator = 2
class CfgVehicles
{
    // ExtraSkin
    class RHS_UH60M;
    class TB_Vehicles_USA_UH60_MEV: RHS_UH60M
    {
        displayName = "UH-60 MEV";
        author = "Eron";
        addCategory(USA);
        hiddenSelectionsTextures[] = {
            "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_fuselage_mev_co.paa",
            "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_engine_mev_co.paa",
            "rhsusf\addons\rhsusf_a2port_air\uh60m\data\default_co.paa",
            "rhsusf\addons\rhsusf_a2port_air\uh60m\data\uh60m_dust_filter_co.paa"
        };
    };
};

