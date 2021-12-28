/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric, IDarky
*/

#define addCategoryBLU(EDITORSUB) editorCategory = "EdCat_TB_skins"; \
            editorSubcategory = EdSubcat_TB_skins_##EDITORSUB; \
            faction = "BLU_F"; \
            side = 1;\
            scope = 2;\
            scopeCurator = 2

#define addCategoryOPF(EDITORSUB) editorCategory = "EdCat_TB_skins"; \
            editorSubcategory = EdSubcat_TB_skins_##EDITORSUB; \
            faction = "OPF_F"; \
            side = 0;\
            scope = 2;\
            scopeCurator = 2

class SensorTemplateDataLink;
class SensorTemplateActiveRadar;
class SensorTemplatePassiveRadar;
class SensorTemplateLaser;
class SensorTemplateNV;

class SensorTemplateIR;
class SensorTemplateMan : SensorTemplateIR
{
    class GroundTarget;
    class AirTarget;
};

class DefaultVehicleSystemsDisplayManagerRight
{
    class Components;
};
class VehicleSystemsTemplateRightDriver : DefaultVehicleSystemsDisplayManagerRight
{
    class Components : Components
    {
        class CrewDisplay;
        class EmptyDisplay;
        class MineDetectorDisplay;
        class MinimapDisplay;
        class SlingLoadDisplay;
        class UAVDisplay;
        class VehicleCommanderDisplay;
        class VehiclePrimaryGunnerDisplay;
    };
};
class VehicleSystemsTemplateRightPilot : DefaultVehicleSystemsDisplayManagerRight
{
    class Components;
};

class DefaultVehicleSystemsDisplayManagerLeft
{
    class Components;
};
class VehicleSystemsTemplateLeftDriver : DefaultVehicleSystemsDisplayManagerLeft
{
    class Components : Components
    {
        class CrewDisplay;
        class EmptyDisplay;
        class MineDetectorDisplay;
        class MinimapDisplay;
        class SlingLoadDisplay;
        class UAVDisplay;
        class VehicleCommanderDisplay;
        class VehiclePrimaryGunnerDisplay;
    };
};
class VehicleSystemsTemplateLeftPilot : DefaultVehicleSystemsDisplayManagerLeft
{
    class Components;
};

class Optics_Armored;
class Optics_Commander_01 : Optics_Armored
{
    class Wide;
    class Medium;
    class Narrow;
};
class Optics_Gunner_APC_01 : Optics_Armored
{
    class Wide;
    class Medium;
    class Narrow;
};
class Optics_Gunner_APC_02 : Optics_Armored
{
    class Wide;
    class Medium;
    class Narrow;
};

class CfgVehicles
{
    // Uniformen
    class B_Soldier_F;
    class B_RangeMaster_F;
    class O_officer_F;
    class I_C_Soldier_Para_2_F;

    // Fahrzeuge
    class I_Plane_Fighter_03_dynamicLoadout_F;
    class B_Heli_Light_01_F;
    class I_Heli_light_03_unarmed_F;
    class B_MRAP_01_F;
    class B_MRAP_01_hmg_F;
    class I_Heli_Transport_02_F;
    class I_MRAP_03_hmg_F;

    class I_G_Offroad_01_F;
    class SUV_01_base_F;
    class Offroad_02_unarmed_base_F;
    class Offroad_02_LMG_base_F;
    class Offroad_02_AT_base_F;
    class O_MBT_02_base_F;

    ///////////////////////Polizei Uniformen//////////////////////////

    class TB_Uniform_Sek: B_Soldier_F
    {
        scope = 1;
        displayName = "SEK Uniform";
        author = "nimda";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_Sek_U";
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\uniforms\polizei_sek.paa)};
    };

    class TB_Uniform_Kommissar: B_Soldier_F
    {
        scope = 1;
        displayName = "Kommissar Uniform";
        author = "nimda";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_kommissar_U";
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\uniforms\polizei_kommissar.paa)};
    };

    class TB_Uniform_rekrut: B_RangeMaster_F
    {
        scope = 1;
        displayName = "Rekruten Uniform";
        author = "nimda";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_rekrut_U";
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\uniforms\polizei_rekrut.paa)};
    };

    class TB_Uniform_presi: O_officer_F
    {
        scope = 1;
        displayName = "Präsidenten Uniform";
        author = "nimda";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_presi_U";
        hiddenSelections[] = {"Camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\uniforms\polizei_presi.paa)};
    };

    class TB_Soldier_IS_1_black: I_C_Soldier_Para_2_F
    {
        scope = 2;
        displayName = "IS_1";
        author = "Eron";
        nakedUniform = "U_BasicBody";
        uniformClass = "TB_Uniform_IS_1_black_U";
        hiddenSelections[] = {"camo1","camo2"};
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\uniforms\TB_Uniform_IS_1_black.paa),QPATHTOF(pictures\uniforms\TB_Uniform_IS_1_black.paa)};
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Soldier_IS_1_black.jpg);
    };

    ///////////////////////Polizei Fahrzeuge//////////////////////////

    class TB_Vehicles_sek_light: B_Heli_Light_01_F
    {
        displayName = "SEK Hummingbird";
        author = "nimda";
        addCategoryBLU(Polizei);
        hiddenSelections[] = {"camo1"};
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_sek_light.paa)};
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_sek_light.jpg);
    };

    class TB_Vehicles_sek_hellcat: I_Heli_light_03_unarmed_F
    {
        displayName = "SEK Hellcat";
        author = "nimda";
        addCategoryBLU(Polizei);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_sek_hellcat.paa)};
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_sek_hellcat.jpg);
    };

    class TB_Vehicles_polizei_hellcat: I_Heli_light_03_unarmed_F
    {
        displayName = "Polizei Hellcat";
        author = "nimda";
        addCategoryBLU(Polizei);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_polizei_hellcat.paa)};
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_polizei_hellcat.jpg);
    };

    class TB_Vehicles_polizei_hunter: B_MRAP_01_F
    {
        displayName = "M-ATV Polizei";
        author = "nimda";
        addCategoryBLU(Polizei);
        hiddenSelections[] = {"Camo1", "Camo2", "riotpolice"};
        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\vehicles\TB_Vehicles_polizei_hunter_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_polizei_hunter_1.paa),
            ""
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_polizei_hunter.jpg);
    };

    /////////////////////// Panzer //////////////////////////

    class B_MBT_01_cannon_F;
    class B_MBT_01_TUSK_F : B_MBT_01_cannon_F
    {
        class TextureSources;
        class AnimationSources;
    };
    class TB_Vehicles_Wueste_Merkava : B_MBT_01_TUSK_F // Merkava Mk4
    {
        displayName = "Merkava Mk4";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_1.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_2.paa),
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Merkava.jpg);

        class TextureSources : TextureSources
        {
            class Desert
            {
                displayName = "Wüste";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_1.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Merkava_2.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
                };
            };
            class Olive
            {
                displayName = "Oliv";
                textures[] =
                {
                    "A3\Armor_F_Exp\MBT_01\data\MBT_01_body_olive_CO.paa",
                    "A3\Armor_F_Exp\MBT_01\data\MBT_01_tow_olive_CO.paa",
                    "A3\Armor_F_Exp\MBT_01\data\mbt_addons_olive_CO.paa",
                    "a3\Armor_F\Data\camonet_NATO_Green_CO.paa"
                };
            };
            class Sand
            {
                displayName = "Sand";
                textures[] =
                {
                    "A3\armor_f_gamma\MBT_01\Data\MBT_01_body_CO.paa",
                    "A3\armor_f_gamma\MBT_01\Data\MBT_01_tow_CO.paa",
                    "a3\armor_f_epc\mbt_01\data\mbt_addons_co.paa",
                    "a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
                };
            };
        };
        class AnimationSources : AnimationSources
        {
            class showBags
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Rucksäcke anzeigen (Rumpf)";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showCamonetHull
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Tarnnetz anzeigen (Rumpf)";
                forceAnimate[] = {"showCamonetPlates1",1,"showCamonetPlates2",1};
                forceAnimate2[] = {"showCamonetPlates1",0,"showCamonetPlates2",0};
                forceAnimatePhase = 1;
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showCamonetCannon
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                source = "user";
            };
            class showCamonetPlates1
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                source = "user";
            };
            class showCamonetPlates2
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                source = "user";
            };
            class showCamonetTurret
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Tarnnetz anzeigen (Rumpf)";
                forceAnimate[] = {"showCamonetCannon",1};
                forceAnimate2[] = {"showCamonetCannon",0};
                forceAnimatePhase = 1;
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
        };
    };

    class TB_Vehicles_Wald_Merkava : TB_Vehicles_Wueste_Merkava // Merkava Mk4
    {
        displayName = "Merkava Mk4";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            "A3\Armor_F_Exp\MBT_01\data\MBT_01_body_olive_CO.paa",
            "A3\Armor_F_Exp\MBT_01\data\MBT_01_tow_olive_CO.paa",
            "A3\Armor_F_Exp\MBT_01\data\mbt_addons_olive_CO.paa",
            "a3\Armor_F\Data\camonet_NATO_Green_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Merkava_2.jpg);
    };

    class I_MBT_03_base_F;
    class I_MBT_03_cannon_F : I_MBT_03_base_F
    {
        class TextureSources;
        class AnimationSources;
    };
    class TB_Vehicles_Wald_Leopard_2 : I_MBT_03_cannon_F // Leopard 2A7+
    {
        displayName = "Leopard 2A7+";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_3.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_4.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_5.paa),
            "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Leopard_2.jpg);

        class TextureSources : TextureSources
        {
            class Olive
            {
                displayName = "Oliv";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_3.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_4.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_5.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa"
                };
            };
            class Desert
            {
                displayName = "Wüste";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_1.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_2.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
                };
            };
        };

        class AnimationSources : AnimationSources
        {
            class showCamonetCannon
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                source = "user";
            };
            class showCamonetCannon1
            {
                animPeriod = 0.001;
                initPhase = 1; // 0
                source = "user";
            };
            class showCamonetHull
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Tarnnetz anzeigen (Rumpf)";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showCamonetTurret
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Tarnnetz anzeigen (Geschützturm)";
                forceAnimate[] = {"showCamonetCannon",1,"showCamonetCannon1",1};
                forceAnimate2[] = {"showCamonetCannon",0,"showCamonetCannon1",0};
                forceAnimatePhase = 1;
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
        };
    };

    class TB_Vehicles_Wueste_Leopard_2 : TB_Vehicles_Wald_Leopard_2 // Leopard 2A7+
    {
        displayName = "Leopard 2A7+";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_1.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Leopard_2.paa),
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Leopard.jpg);
    };

    class LT_01_cannon_base_F;
    class I_LT_01_cannon_F : LT_01_cannon_base_F
    {
        class TextureSources;
    };
    class TB_Vehicles_Wald_Wiesel_2_Mk20 : I_LT_01_cannon_F // Wiesel 2 (Mk20)
    {
        audible = 4; // 18
        camouflage = 4; // 8
        displayName = "Wiesel 2 (Mk20)";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_1.paa),
            "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
            "\A3\armor_f\data\cage_olive_co.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wald_Wiesel_2_Mk20.jpg);

        class TextureSources : TextureSources
        {
            class Green
            {
                displayName = "Wald";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_1.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
                    "\A3\armor_f\data\cage_olive_co.paa"
                };
            };
            class Desert
            {
                displayName = "Wüste";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_2.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_3.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
                    "\a3\Armor_F\Data\cage_sand_CO.paa"
                };
            };
        };
    };

    class TB_Vehicles_Wueste_Wiesel_2_Mk20 : TB_Vehicles_Wald_Wiesel_2_Mk20 // Wiesel 2 (Mk20)
    {
        displayName = "Wiesel 2 (Mk20)";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_3.paa),
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
            "\a3\Armor_F\Data\cage_sand_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wueste_Wiesel_2_Mk20.jpg);
    };

    class LT_01_base_F;
    class LT_01_AT_base_F : LT_01_base_F
    {
        class Turrets;
    };
    class I_LT_01_AT_F : LT_01_AT_base_F
    {
        class TextureSources;
        class Turrets : Turrets
        {
            class MainTurret;
        };
    };
    class TB_Vehicles_Wald_Wiesel_2_AT : I_LT_01_AT_F // Wiesel 2 (AT)
    {
        audible = 4; // 18
        camouflage = 4; // 8
        displayName = "Wiesel 2 (AT)";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_5.paa),
            "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
            "\A3\armor_f\data\cage_olive_co.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wald_Wiesel_2_AT.jpg);

        class TextureSources : TextureSources
        {
            class Green
            {
                displayName = "Wald";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_5.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
                    "\A3\armor_f\data\cage_olive_co.paa"
                };
            };
            class Desert
            {
                displayName = "Wüste";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_2.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_3.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
                    "\a3\Armor_F\Data\cage_sand_CO.paa"
                };
            };
        };
        class Turrets: Turrets
        {
            class MainTurret: MainTurret
            {
                magazines[] =
                {
                    "SmokeLauncherMag","ace_hot_3_2Rnd","ace_hot_3_2Rnd","ace_hot_3_2Rnd",
                    "100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red",
                    "100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"
                }; // {"SmokeLauncherMag","ace_hot_2_2Rnd","ace_hot_2_2Rnd","ace_hot_2_2Rnd","ace_hot_2MP_2Rnd","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"};
            };
        };
    };

    class TB_Vehicles_Wueste_Wiesel_2_AT : TB_Vehicles_Wald_Wiesel_2_AT // Wiesel 2 (AT)
    {
        displayName = "Wiesel 2 (AT)";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_4.paa),
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
            "\a3\Armor_F\Data\cage_sand_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wueste_Wiesel_2_AT.jpg);
    };

    class LT_01_scout_base_F;
    class I_LT_01_scout_F : LT_01_scout_base_F
    {
        class TextureSources;
    };
    class TB_Vehicles_Wald_Wiesel_2_AFF : I_LT_01_scout_F // Wiesel 2 (AFF)
    {
        audible = 4; // 18
        camouflage = 4; // 8
        displayName = "Wiesel 2 (AFF)";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_6.paa),
            "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
            "\A3\armor_f\data\cage_olive_co.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wald_Wiesel_2_AFF.jpg);

        class TextureSources : TextureSources
        {
            class Green
            {
                displayName = "Wald";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_6.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
                    "\A3\armor_f\data\cage_olive_co.paa"
                };
            };
            class Desert
            {
                displayName = "Wüste";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_2.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_3.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
                    "\a3\Armor_F\Data\cage_sand_CO.paa"
                };
            };
        };
    };

    class TB_Vehicles_Wueste_Wiesel_2_AFF : TB_Vehicles_Wald_Wiesel_2_AFF // Wiesel 2 (AFF)
    {
        displayName = "Wiesel 2 (AFF)";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_7.paa),
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
            "\a3\Armor_F\Data\cage_sand_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wueste_Wiesel_2_AFF.jpg);
    };

    class LT_01_AA_base_F;
    class I_LT_01_AA_F : LT_01_AA_base_F
    {
        class TextureSources;
    };
    class TB_Vehicles_Wald_Wiesel_2_FlaRaWaTrg : I_LT_01_AA_F // Wiesel 2 (FlaRaWaTrg)
    {
        audible = 4; // 18
        camouflage = 4; // 8
        displayName = "Wiesel 2 (FlaRaWaTrg)";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_5.paa),
            "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
            "\A3\armor_f\data\cage_olive_co.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wald_Wiesel_2_FlaRaWaTrg.jpg);

        class TextureSources : TextureSources
        {
            class Green
            {
                displayName = "Wald";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_5.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
                    "\A3\armor_f\data\cage_olive_co.paa"
                };
            };
            class Desert
            {
                displayName = "Wüste";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_2.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_4.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
                    "\a3\Armor_F\Data\cage_sand_CO.paa"
                };
            };
        };
    };

    class TB_Vehicles_Wueste_Wiesel_2_FlaRaWaTrg : TB_Vehicles_Wald_Wiesel_2_FlaRaWaTrg // Wiesel 2 (FlaRaWaTrg)
    {
        displayName = "Wiesel 2 (FlaRaWaTrg)";
        author = "Eron";
        addCategoryBLU(Panzer);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_Wiesel2_4.paa),
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
            "\a3\Armor_F\Data\cage_sand_CO.paa"
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wueste_Wiesel_2_FlaRaWaTrg.jpg);
    };

    /////////////////////// Truppentransporter//////////////////////////

    class Tank;
    class Tank_F : Tank
    {
        class Turrets;
    };
    class APC_Tracked_03_base_F : Tank_F
    {
        class Turrets : Turrets
        {
            class MainTurret;
        };
    };
    class I_APC_tracked_03_base_F : APC_Tracked_03_base_F
    {
        class AnimationSources;
        class HitPoints;
    };
    class I_APC_tracked_03_cannon_F : I_APC_tracked_03_base_F // FV510 Warrior
    {
        class TextureSources;
        class AnimationSources : AnimationSources
        {
            class showSLATHull;
            class showSLATTurret;
            class showBags;
            class showBags2;
            class showCamonetHull;
            class showCamonetTurret;
            class showTools;
        };
        class HitPoints : HitPoints
        {
            class HitHull;
        };
        class Components;
    };

    #include "CfgVehicles_FV510Warrior.hpp"

    class Car_F;
    class Wheeled_APC_F: Car_F
	{
		class Turrets
		{
			class MainTurret;
		};
	};
    class APC_Wheeled_01_base_F : Wheeled_APC_F
    {
        class Turrets : Turrets
        {
            class MainTurret : MainTurret
            {
                class CommanderOptics;
            };
        };
    };
    class B_APC_Wheeled_01_base_F : APC_Wheeled_01_base_F
    {
        class AnimationSources;
    };
    class B_APC_Wheeled_01_cannon_F : B_APC_Wheeled_01_base_F // Badger APC
    {
        class TextureSources;
        class Components;
        class AnimationSources : AnimationSources
        {
            class showSLATHull;
            class showSLATTurret;
            class showBags;
            class showCamonetCannon;
            class showCamonetHull;
            class showCamonetTurret;
        };
    };

    #include "CfgVehicles_APC_Badger.hpp"

    class I_APC_Wheeled_03_base_F;
    class I_APC_Wheeled_03_cannon_F : I_APC_Wheeled_03_base_F
    {
        class TextureSources;
        class AnimationSources;
    };
    class TB_Vehicles_Wald_Pandur : I_APC_Wheeled_03_cannon_F // Pandur II APC
    {
        armor = 245; // 200
        audible = 16; // 5
        displayName = "Pandur II APC (Wald)";
        author = "Eron";
        addCategoryBLU(Truppentransporter);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_1.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_3.paa),
            "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_5.paa)
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_BW_Pandur.jpg);

        class TextureSources : TextureSources
        {
            class Desert
            {
                displayName = "Wüste";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_1.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_2.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_3.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
                    QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_5.paa)
                };
            };
            class Green
            {
                displayName = "3-Farb-Flecktarn";
                textures[] =
                {
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_0.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_1.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_2.paa),
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_3.paa),
                    "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
                    QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_5.paa)
                };
            };
        };

        class AnimationSources : AnimationSources
        {
            class showSLATHull
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Slat-Käfig anzeigen (Rumpf)";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showBags
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Rucksäcke anzeigen (Rumpf)";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showBags2
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Rucksäcke anzeigen (Geschützturm)";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showCamonetHull
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Tarnnetz anzeigen (Rumpf)";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
            class showTools
            {
                animPeriod = 0.001;
                author = "Bohemia Interactive";
                displayName = "Werkzeug anzeigen";
                initPhase = 1; // 0
                mass = -50;
                source = "user";
            };
        };
    };

    class TB_Vehicles_Wueste_Pandur : TB_Vehicles_Wald_Pandur // Pandur II APC
    {
        displayName = "Pandur II APC (Wüste)";
        author = "Eron";
        addCategoryBLU(Truppentransporter);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_1.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_3.paa),
            "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
            QPATHTOF(pictures\vehicles\TB_Vehicles_USA_Pandur_5.paa)
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Pandur.jpg);
    };

    class MRAP_03_base_F;
    class I_MRAP_03_F : MRAP_03_base_F
    {
        class TextureSources;
    };
    class TB_Vehicles_Strider: I_MRAP_03_F // Fennek
    {
        displayName = "Fennek";
        author = "Eron";
        addCategoryBLU(Truppentransporter);
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_Strider_0.paa),QPATHTOF(pictures\vehicles\TB_Vehicles_Strider_0.paa)};
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Strider.jpg);

        class TextureSources : TextureSources
        {
            class Green
            {
                displayName = "3-Farb-Flecktarn";
                textures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_Strider_0.paa),QPATHTOF(pictures\vehicles\TB_Vehicles_Strider_0.paa)};
            };
            class Blufor
            {
                author = "Bohemia Interactive";
                displayName = "BLUFOR";
                factions[] = {"BLU_F"};
                textures[] = {"\a3\soft_f_beta\MRAP_03\Data\mrap_03_ext_co.paa","\a3\data_f\vehicles\turret_co.paa"};
            };
        };
    };

    ///////////////////////Fluggeräte//////////////////////////

    class Heli_light_03_base_F;
    class Heli_light_03_dynamicLoadout_base_F : Heli_light_03_base_F
    {
        class Turrets;
    };
    class I_Heli_light_03_dynamicLoadout_F : Heli_light_03_dynamicLoadout_base_F
    {
        class Turrets : Turrets
        {
            class MainTurret;
        };
        class Components;
    };

    #include "CfgVehicles_AW159Wildcat.hpp"

    class TB_Vehicles_BW_Hellcat: I_Heli_light_03_unarmed_F
    {
        displayName = "Hellcat BW (unbewaffnet)";
        author = "TBMod";
        addCategoryBLU(Fluggeraete);
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_AW159_Wildcat.paa)};
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_BW_Hellcat.jpg);
    };

    class TB_Vehicles_BW_Hellcat_2: TB_Vehicles_AW159_Wildcat
    {
        displayName = "Hellcat BW (bewaffnet)";
        author = "TBMod";
        addCategoryBLU(Fluggeraete);
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Hellcat.paa)};
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_BW_Hellcat_2.jpg);
    };

    class TB_Vehicles_BW_Merlin: I_Heli_Transport_02_F
    {
        displayName = "Merlin BW";
        author = "Eron";
        addCategoryBLU(Fluggeraete);
        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Merlin_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Merlin_1.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Merlin_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Merlin_3.paa)
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_BW_Merlin.jpg);
    };

    class TB_Vehicles_L159_Albatros: I_Plane_Fighter_03_dynamicLoadout_F
    {
        displayName = "L-159 Albatros";
        author = "Eron";
        addCategoryBLU(Fluggeraete);
        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\vehicles\TB_Vehicles_L-159_1.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_L-159_2.paa)
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_L159_Albatros.jpg);
    };

    ///////////////////////PMC Fahrzeuge//////////////////////////

    class B_G_Offroad_01_F : I_G_Offroad_01_F {
        class EventHandlers;
    };
    class TB_Vehicles_PMC_Pickup: B_G_Offroad_01_F
    {
        displayName = "Pickup";
        author = "Eron";
        addCategoryBLU(PMC);
        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Pickup_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Pickup_0.paa)
        };

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false];";
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_PMC_Pickup.jpg);
    };

    class C_SUV_01_F : SUV_01_base_F {
        class EventHandlers;
    };
    class TB_Vehicles_PMC_SUV: C_SUV_01_F
    {
        displayName = "SUV";
        author = "Eron";
        addCategoryBLU(PMC);
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Suv_0.paa)};

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false];";
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_PMC_SUV.jpg);
    };

    //////////Texturen werden manuell geladen

    class I_C_Offroad_02_unarmed_F : Offroad_02_unarmed_base_F {
        class EventHandlers;
    };
    class TB_Vehicles_PMC_Jeep: I_C_Offroad_02_unarmed_F
    {
        displayName = "Jeep";
        author = "Eron";
        addCategoryBLU(PMC);
        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa)
        };

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false];"; // (_this select 0) setObjectTexture [0,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [1,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [2,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa']; (_this select 0) setObjectTexture [3,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa'];
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_PMC_Jeep.jpg);
    };

    class I_C_Offroad_02_LMG_F : Offroad_02_LMG_base_F {
        class EventHandlers;
    };
    class TB_Vehicles_PMC_Jeep_2: I_C_Offroad_02_LMG_F
    {
        displayName = "Jeep LMG";
        author = "Eron";
        addCategoryBLU(PMC);
        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa)
        };

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false];"; // (_this select 0) setObjectTexture [0,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [1,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [2,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa']; (_this select 0) setObjectTexture [3,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa'];
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_PMC_Jeep_2.jpg);
    };

    class I_C_Offroad_02_AT_F : Offroad_02_AT_base_F {
        class EventHandlers;
    };
    class TB_Vehicles_PMC_Jeep_3: I_C_Offroad_02_AT_F
    {
        displayName = "Jeep AT";
        author = "Eron";
        addCategoryBLU(PMC);
        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa)
        };

        class EventHandlers: EventHandlers
        {
            init = "(_this select 0) setVariable ['BIS_enableRandomization', false];"; //  (_this select 0) setObjectTexture [0,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [1,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_0.paa']; (_this select 0) setObjectTexture [2,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa']; (_this select 0) setObjectTexture [3,'\TBMod_skins\pictures\vehicles\TB_Vehicles_PMC_Jeep_2.paa'];
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_PMC_Jeep_3.jpg);
    };

    ////////// Skins für Rucksäcke

    class B_Bergen_tna_F;
    class TB_backpacks_bergen_m81 : B_Bergen_tna_F
    {
        displayName = "Bergen (M81)";
        author = "Eron";
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\backpacks\TB_backpacks_bergen_m81.paa)}; // "\A3\Supplies_F_Exp\Bags\Data\Bergen_tna_CO.paa"
    };

    class TB_backpacks_bergen_urban : B_Bergen_tna_F
    {
        displayName = "Bergen (Urban)";
        author = "Eron";
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\backpacks\TB_backpacks_bergen_urban.paa)}; // "\A3\Supplies_F_Exp\Bags\Data\Bergen_tna_CO.paa"
        picture = "\A3\Weapons_F\Ammoboxes\Bags\data\UI\icon_B_C_Tortila_oucamo.paa"; // "\A3\Supplies_F_Exp\Bags\Data\UI\Icon_B_Bergen_tna_CA.paa"
    };

    class TB_backpacks_bergen_multitarn : B_Bergen_tna_F
    {
        displayName = "Bergen (Multitarn)";
        author = "Eron";
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\backpacks\TB_backpacks_bergen_multitarn.paa)}; // "\A3\Supplies_F_Exp\Bags\Data\Bergen_tna_CO.paa"
        picture = "\A3\Weapons_F\Ammoboxes\Bags\data\UI\icon_B_C_Tortila_hex.paa"; // "\A3\Supplies_F_Exp\Bags\Data\UI\Icon_B_Bergen_tna_CA.paa"
    };

    class B_Bergen_hex_F;
    class TB_backpacks_bergen_marpad_d : B_Bergen_hex_F
    {
        displayName = "Bergen (Marpad-D)";
        author = "Eron";
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\backpacks\TB_backpacks_bergen_marpad_d.paa)}; // "\A3\Supplies_F_Exp\Bags\Data\Bergen_hex_CO.paa"
        picture = "\A3\Weapons_F\Ammoboxes\Bags\data\UI\icon_B_C_Tortila_hex.paa"; // "\A3\Supplies_F_Exp\Bags\Data\UI\Icon_B_Bergen_hex_CA.paa"
    };

    class TB_backpacks_bergen_marpad_wd : B_Bergen_hex_F
    {
        displayName = "Bergen (Marpad-WD)";
        author = "Eron";
        hiddenSelectionsTextures[] = {QPATHTOF(pictures\backpacks\TB_backpacks_bergen_marpad_wd.paa)}; // "\A3\Supplies_F_Exp\Bags\Data\Bergen_hex_CO.paa"
    };

    //////////////////// OPFOR /////////////////////

    class O_MBT_02_cannon_F : O_MBT_02_base_F {
        class EventHandlers;
    };
    class TB_Vehicles_T100 : O_MBT_02_cannon_F {
        displayName = "T-100";
        author = "Eron";
        addCategoryOPF(Arid);

        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\vehicles\TB_Vehicles_RU_T100_0.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_RU_T100_1.paa),
            QPATHTOF(pictures\vehicles\TB_Vehicles_RU_T100_2.paa),
            "A3\Armor_F\Data\camonet_CSAT_HEX_Desert_CO.paa"
        };

        class EventHandlers : EventHandlers {
            init = ""; // "if (local (_this select 0)) then {[(_this select 0), """", [], false] call bis_fnc_initVehicle;};";
        };
        editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_T100.jpg);
    };

    // Skin FlaRak Kit
    class AA_01_base_F;
    class B_static_AA_F : AA_01_base_F
    {
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOF(pictures\statics\TB_stationäre_Luftabwehr.paa),
            QPATHTOF(pictures\statics\TB_stationäre_Luftabwehr.paa)
        };
    };
};
