/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric
*/

class cfgWeapons
{
    class Uniform_Base;
    class UniformItem;
    class TB_Uniform_Sek_U: Uniform_Base
    {
        scope = 2;
        picture = "\A3\characters_f\data\ui\icon_U_B_CombatUniform_mcam_ca.paa";
        displayName = "SEK Uniform";
        author = "IDarky";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_original_F.p3d";
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "TB_Uniform_Sek";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    
    class TB_Uniform_Kommissar_U: Uniform_Base
    {
        scope = 2;
        picture = "\A3\characters_f\data\ui\icon_U_B_CombatUniform_mcam_ca.paa";
        displayName = "Kommissar Uniform";
        author = "IDarky";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_original_F.p3d";
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "TB_Uniform_Kommissar";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    
    class TB_Uniform_rekrut_U: Uniform_Base
    {
        scope = 2;
        picture = "\A3\characters_f\data\ui\icon_U_B_CombatUniform_mcam_ca.paa";
        displayName = "Rekruten Uniform";
        author = "IDarky";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_original_F.p3d";
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "TB_Uniform_Rekrut";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    
    class TB_Uniform_presi_U: Uniform_Base
    {
        scope = 2;
        picture = "\A3\characters_f\data\ui\icon_U_B_CombatUniform_mcam_ca.paa";
        displayName = "Präsidenten Uniform";
        author = "IDarky";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_universal_F.p3d";
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "TB_Uniform_presi";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    
    
    
};



///////////////////////////////////7
/*

class CfgWeapons
{
    class Uniform_Base;
    class TB_Uniform_SEK_U: Uniform_Base
    {
        scope = 2;
        picture = "\A3\characters_f\data\ui\icon_U_B_CombatUniform_mcam_ca.paa";
        displayName = "G3 M81/Green";
        author = "DArky";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_original_F.p3d";
        class ItemInfo: UniformItem
        {
            uniformModel = "-";
            uniformClass = "TB_Uniform_Sek";
            containerClass = "Supply40";
            mass = 40;
        };
    };
    
    
    class TB_Uniform_SEK: Uniform_Base
    {
        displayName = "SEK Uniform";
        author = "IDarky";
        model = "\A3\Characters_F\Common\Suitpacks\suitpack_original_F.p3d";
        hiddenSelections[] = {"camo"};
        picture = "\TBMod_Skins\pictures\polizei_sek.paa";
        
        
    };
    
    class U_B_CTRG_1;
    class TB_Uniform_Kommissar: U_B_CTRG_1
    {
        displayName = "Kommissar Uniform";
        author = "IDarky";
        hiddenSelectionsTextures[] = {"\TBMod_Skins\pictures\polizei_kommissar.paa"};
    };
    
    class U_Competitor;
    class TB_Uniform_Polizist: U_Competitor
    {
        displayName = "Rekruten Uniform";
        author = "IDarky";
        hiddenSelectionsTextures[] = {"\TBMod_Skins\pictures\polizei_normal.paa"};
    };
};
*/