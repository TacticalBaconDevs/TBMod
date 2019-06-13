/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric, IDarky
*/

#define addCategory(EDITORSUB) editorCategory = "EdCat_TB_skins"; \
            editorSubcategory = EdSubcat_TB_skins_##EDITORSUB; \
            faction = "BLU_F"; \
            side = 1;\
            scope = 2;\
            scopeCurator = 2

class CfgVehicles
{
    // Uniformen
    class B_Soldier_F;
    class B_RangeMaster_F;
    class O_officer_F;

    // Fahrzeuge
    class B_Heli_Light_01_F;
    class I_Heli_light_03_unarmed_F;
    class I_Heli_light_03_dynamicLoadout_F;
    class B_MRAP_01_F;
    class B_MRAP_01_hmg_F;
    class B_MBT_01_TUSK_F;
    class I_MRAP_03_F;
    class I_APC_Wheeled_03_cannon_F;
    class I_Heli_Transport_02_F;
    class I_MRAP_03_hmg_F;

    class I_G_Offroad_01_F;
    class SUV_01_base_F;
    class Offroad_02_unarmed_base_F;
    class Offroad_02_LMG_base_F;
    class Offroad_02_AT_base_F;

    ///////////////////////Polizei Uniformen//////////////////////////

    class TB_Uniform_Sek: B_Soldier_F
    {
        scope = 1;
        displayName = "SEK Uniform";
        author = "nimda";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_Sek_U";
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\uniforms\polizei_sek.paa"};
    };

    class TB_Uniform_Kommissar: B_Soldier_F
    {
        scope = 1;
        displayName = "Kommissar Uniform";
        author = "nimda";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_kommissar_U";
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\uniforms\polizei_kommissar.paa"};
    };

    class TB_Uniform_rekrut: B_RangeMaster_F
    {
        scope = 1;
        displayName = "Rekruten Uniform";
        author = "nimda";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_rekrut_U";
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\uniforms\polizei_rekrut.paa"};
    };

    class TB_Uniform_presi: O_officer_F
    {
        scope = 1;
        displayName = "Präsidenten Uniform";
        author = "nimda";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_presi_U";
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\uniforms\polizei_presi.paa"};
    };

    ///////////////////////Polizei Fahrzeuge//////////////////////////

    class TB_Vehicles_sek_light: B_Heli_Light_01_F
    {
        displayName = "SEK Hummingbird";
        author = "nimda";
        addCategory(Polizei);
        hiddenSelections[] = {"camo1"};
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_sek_light.paa"};
    };

    class TB_Vehicles_sek_hellcat: I_Heli_light_03_unarmed_F
    {
        displayName = "SEK Hellcat";
        author = "nimda";
        addCategory(Polizei);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_sek_hellcat.paa"};
    };

    class TB_Vehicles_polizei_hellcat: I_Heli_light_03_unarmed_F
    {
        displayName = "Polizei Hellcat";
        author = "nimda";
        addCategory(Polizei);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_polizei_hellcat.paa"};
    };

    class TB_Vehicles_polizei_hunter: B_MRAP_01_F
    {
        displayName = "M-ATV Polizei";
        author = "nimda";
        addCategory(Polizei);
        hiddenSelections[] = {"Camo1", "Camo2", "riotpolice"};
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_polizei_hunter_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_polizei_hunter_1.paa",
            ""
        };
    };

    ///////////////////////USA Fahrzeuge//////////////////////////

    class TB_Vehicles_USA_hunter: B_MRAP_01_F
    {
        displayName = "M-ATV Sand";
        author = "Eron";
        addCategory(USA);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_hunter_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_hunter_1.paa",
            ""
        };
    };

    class TB_Vehicles_USA_hunter_smg: B_MRAP_01_hmg_F
    {
        displayName = "M-ATV Sand (smg)";
        author = "Eron";
        addCategory(USA);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_hunter_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_hunter_1.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_hunter_smg_2.paa"
        };
    };

    class TB_Vehicles_USA_Merkava: B_MBT_01_TUSK_F
    {
        displayName = "Merkava Mk4 Sand";
        author = "Eron";
        addCategory(USA);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_Merkava_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_Merkava_1.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_Merkava_2.paa"
        };
    };

    class TB_Vehicles_USA_Pandur: I_APC_Wheeled_03_cannon_F
    {
        displayName = "Pandur Sand";
        author = "Eron";
        addCategory(USA);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_Pandur_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_Pandur_1.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_Pandur_2.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_Pandur_3.paa",
            "",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_USA_Pandur_5.paa"
        };
    };

    ///////////////////////BW Fahrzeuge//////////////////////////

    class TB_Vehicles_BW_Pandur: I_APC_Wheeled_03_cannon_F
    {
        displayName = "Pandur Wald";
        author = "Eron";
        addCategory(BW);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Pandur_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Pandur_1.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Pandur_2.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Pandur_3.paa",
            "",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Pandur_5.paa"
        };
    };

    class TB_Vehicles_BW_Merlin: I_Heli_Transport_02_F
    {
        displayName = "Merlin BW";
        author = "Eron";
        addCategory(BW);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Merlin_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Merlin_1.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Merlin_2.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Merlin_3.paa"
        };
    };

    class TB_Vehicles_BW_hunter: B_MRAP_01_F
    {
        displayName = "M-ATV Wald";
        author = "Eron";
        addCategory(BW);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_hunter_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_hunter_1.paa",
            ""
        };
    };

    class TB_Vehicles_BW_hunter_smg: B_MRAP_01_hmg_F
    {
        displayName = "M-ATV Wald (smg)";
        author = "Eron";
        addCategory(BW);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_hunter_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_hunter_1.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_hunter_smg_2.paa"
        };
    };

    class TB_Vehicles_BW_Strider: I_MRAP_03_F
    {
        displayName = "Strider Wald";
        author = "Eron";
        addCategory(BW);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Strider_0.paa",
            ""
        };
    };

    class TB_Vehicles_BW_Strider_smg: I_MRAP_03_hmg_F
    {
        displayName = "Strider Wald (smg)";
        author = "Eron";
        addCategory(BW);
        hiddenSelectionsTextures[] = {
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Strider_0.paa",
            "\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Strider_1.paa"
        };
    };

    class TB_Vehicles_BW_Hellcat: I_Heli_light_03_unarmed_F
    {
        displayName = "Hellcat (unbewaffnet)";
        author = "Eron";
        addCategory(BW);
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Hellcat.paa"};
    };

    class TB_Vehicles_BW_Hellcat_2: I_Heli_light_03_dynamicLoadout_F
    {
        displayName = "Hellcat (bewaffnet)";
        author = "Eron";
        addCategory(BW);
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_BW_Hellcat.paa"};
    };

    ///////////////////////PMC Fahrzeuge//////////////////////////

    class B_G_Offroad_01_F : I_G_Offroad_01_F {
        class EventHandlers;
    };

    class C_SUV_01_F : SUV_01_base_F {
        class EventHandlers;
    };

    class I_C_Offroad_02_unarmed_F : Offroad_02_unarmed_base_F {
        class EventHandlers;
    };

    class I_C_Offroad_02_LMG_F : Offroad_02_LMG_base_F {
        class EventHandlers;
    };

    class I_C_Offroad_02_AT_F : Offroad_02_AT_base_F {
        class EventHandlers;
    };

    class TB_Vehicles_PMC_Pickup: B_G_Offroad_01_F
    {
        displayName = "Pickup";
        author = "Eron";
        addCategory(PMC);
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Pickup_0.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Pickup_0.paa"};

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false];";
        };
    };

    class TB_Vehicles_PMC_SUV: C_SUV_01_F
    {
        displayName = "SUV";
        author = "Eron";
        addCategory(PMC);
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Suv_0.paa"};

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false];";
        };
    };

    //////////Texturen werden manuell geladen

    class TB_Vehicles_PMC_Jeep: I_C_Offroad_02_unarmed_F
    {
        displayName = "Jeep";
        author = "Eron";
        addCategory(PMC);
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa"};

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false]; (_this select 0) setObjectTexture [0,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [1,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [2,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa']; (_this select 0) setObjectTexture [3,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa'];";
        };
    };

    class TB_Vehicles_PMC_Jeep_2: I_C_Offroad_02_LMG_F
    {
        displayName = "Jeep LMG";
        author = "Eron";
        addCategory(PMC);
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa"};

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false]; (_this select 0) setObjectTexture [0,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [1,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [2,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa']; (_this select 0) setObjectTexture [3,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa'];";
        };
    };

    class TB_Vehicles_PMC_Jeep_3: I_C_Offroad_02_AT_F
    {
        displayName = "Jeep AT";
        author = "Eron";
        addCategory(PMC);
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa", "\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa"};

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false]; (_this select 0) setObjectTexture [0,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [1,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [2,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa']; (_this select 0) setObjectTexture [3,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa'];";
        };
    };
};
