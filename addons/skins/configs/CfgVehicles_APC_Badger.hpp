/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

class TB_Vehicles_Wald_Badger : B_APC_Wheeled_01_cannon_F // Badger APC
{
    armor = 320; // 215 zuvor durch Eron generft
    author = "Eron";
    audible = 6; // 14
    crewCrashProtection = 0.25; // 1.25
    displayName = "Badger APC (Wald)";
    enginePower = 600; // 506.25
    normalSpeedForwardCoef = 0.9; // 0.52
    addCategoryBLU(Truppentransporter);
    hiddenSelectionsTextures[] =
    {
        QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_3.paa),
        QPATHTOF(pictures\vehicles\TB_Vehicles_Patria_AMW_3.paa),
        QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_3.paa),
        "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
        QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_5.paa)
    };
    editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wald_Patria_AMW.jpg);
    class TextureSources : TextureSources
    {
        class Desert
        {
            displayName = "Wüste";
            textures[] =
            {
                QPATHTOF(pictures\vehicles\TB_Vehicles_Patria_AMW_1.paa),
                QPATHTOF(pictures\vehicles\TB_Vehicles_Patria_AMW_2.paa),
                QPATHTOF(pictures\vehicles\TB_Vehicles_Patria_AMW_1.paa),
                "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
                "\a3\Armor_F\Data\cage_sand_CO.paa"
            };
        };
        class Green
        {
            displayName = "3-Farb-Flecktarn";
            textures[] =
            {
                QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_3.paa),
                QPATHTOF(pictures\vehicles\TB_Vehicles_Patria_AMW_3.paa),
                QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_3.paa),
                "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
                QPATHTOF(pictures\vehicles\TB_Vehicles_BW_Pandur_5.paa)
            };
        };
        class Olive
        {
            displayName = "Oliv";
            textures[] = {"A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_base_olive_CO.paa","A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_adds_olive_co.paa","A3\Armor_F_Exp\APC_Wheeled_01\data\APC_Wheeled_01_tows_olive_co.paa","a3\Armor_F\Data\camonet_NATO_Green_CO.paa","a3\Armor_F\Data\cage_olive_CO.paa"};
        };
        class Sand
        {
            displayName = "Sand";
            textures[] = {"a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_base_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_adds_co.paa","a3\armor_f_beta\APC_Wheeled_01\data\APC_Wheeled_01_tows_co.paa","a3\Armor_F\Data\camonet_NATO_Desert_CO.paa","a3\Armor_F\Data\cage_sand_CO.paa"};
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
        class showSLATTurret
        {
            animPeriod = 0.001;
            author = "Bohemia Interactive";
            displayName = "Slat-Käfig anzeigen (Geschützturm)";
            initPhase = 1; // 0
            mass = -50;
            source = "user";
        };
        class showBags
        {
            animPeriod = 0.001;
            author = "Bohemia Interactive";
            displayName = "Rucksäcke anzeigen (Geschützturm)";
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
            forceAnimate[] = {"showCamonetCannon",1};
            forceAnimate2[] = {"showCamonetCannon",0};
            initPhase = 1; // 0
            mass = -50;
            source = "user";
        };
    };
    class Components : Components
    {
        class SensorsManagerComponent
        {
            class Components
            {
                class ManSensorComponent : SensorTemplateMan
                {
                    aimDown = 22.5; // 0
                    angleRangeHorizontal = 360; // 60
                    angleRangeVertical = 67.5; // 60
                    color[] = {1,0,0,1}; // {1,0.5,1,1};
                    maxTrackableSpeed = 400; // 1e+010;
                    typeRecognitionDistance = 40; // 0

                    class GroundTarget : GroundTarget
                    {
                        maxRange = 40; // 500
                        minRange = 40; // 500
                    };
                    delete AirTarget;
                };
            };
        };
        class VehicleSystemsDisplayManagerComponentLeft : VehicleSystemsTemplateLeftDriver
        {
            class Components : Components
            {
                class SensorDisplay
                {
                    componentType = "SensorsDisplayComponent";
                    range[] = {40};
                    resource = "RscCustomInfoSensors";
                };
                class MinimapDisplay : MinimapDisplay
                {
                    resource = "RscCustomInfoMiniMap";
                };
            };
        };
        class VehicleSystemsDisplayManagerComponentRight : VehicleSystemsTemplateRightDriver
        {
            class Components : Components
            {
                class SensorDisplay
                {
                    componentType = "SensorsDisplayComponent";
                    range[] = {40};
                    resource = "RscCustomInfoSensors";
                };
                class MinimapDisplay : MinimapDisplay
                {
                    resource = "RscCustomInfoMiniMap";
                };
            };
        };
    };
    class Turrets : Turrets
    {
        class MainTurret : MainTurret
        {
            weapons[] = {"TB_weapon_40mm_CTWS", "TB_weapon_127_coax"};

            discreteDistance[] =
            {
                100,200,300,400,500,600,700,800,900,1000,
                1100,1200,1300,1400,1500,1600,1700,1800,
                1900,2000,2100,2200,2300,2400,2500,2600,
                2700,2800,2900,3000,3100,3200,3300,3400,
                3500,3600,3700,3800,3900,4000
            };
            magazines[] =
            {
                "TB_mag_40Rnd_40mm_GPR",
                "TB_mag_40Rnd_40mm_GPR",
                "TB_mag_40Rnd_40mm_APFSDS",
                "TB_mag_40Rnd_40mm_APFSDS",
                "TB_mag_200Rnd_127x99_Tracer_Red",
                "TB_mag_200Rnd_127x99_Tracer_Red",
                "TB_mag_200Rnd_127x99_Tracer_Red",
                "TB_mag_200Rnd_127x99_Tracer_Red"
            };
            class OpticsIn : Optics_Gunner_APC_01
            {
                class Wide : Wide
                {
                    thermalMode[] = {0,1};
                };
                class Medium : Medium
                {
                    thermalMode[] = {0,1};
                };
                class Narrow : Narrow
                {
                    thermalMode[] = {0,1};
                };
            };
            class Turrets : Turrets
            {
                class CommanderOptics : CommanderOptics
                {
                    class OpticsIn: Optics_Commander_01
                        {
                        class Wide: Wide
                        {
                            thermalMode[] = {0,1};
                        };
                        class Medium: Medium
                        {
                            thermalMode[] = {0,1};
                        };
                        class Narrow: Narrow
                        {
                            thermalMode[] = {0,1};
                        };
                    };
                };
            };
        };
    };

    // ### ArmaInventar selber gemacht, deswegen Löschung standardmäßig umgehen
    EGVAR(main,disableCargoCleanup) = 1;

    class TransportItems
    {
        MACRO_ADDITEM(ACE_quikclot, 20);
        MACRO_ADDITEM(ACE_morphine, 4);
        MACRO_ADDITEM(ACE_salineIV, 4);
        MACRO_ADDITEM(ToolKit, 1);
        MACRO_ADDITEM(ACE_EntrenchingTool, 1);
        MACRO_ADDITEM(ACE_wirecutter, 1);
        MACRO_ADDITEM(ACE_UAVBattery, 1);
    };
    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(rhsusf_100Rnd_762x51_m62_tracer, 8);
        MACRO_ADDMAGAZINE(rhsusf_200Rnd_556x45_M855_mixed_soft_pouch_coyote, 4);
        MACRO_ADDMAGAZINE(TB_mag_100Rnd_338_LS_Tracer, 8);
        MACRO_ADDMAGAZINE(rhs_mag_30Rnd_556x45_M855A1_EPM_Pull_Tracer_Red, 30);
        MACRO_ADDMAGAZINE(rhs_mag_mk3a2, 8);
        MACRO_ADDMAGAZINE(SmokeShell, 8);
        MACRO_ADDMAGAZINE(ACE_HuntIR_M203, 2);
        MACRO_ADDMAGAZINE(AMP_Breaching_Charge_Mag, 4);
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_Slugshot, 4);
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_HE, 8);
        MACRO_ADDMAGAZINE(TB_rhs_mag_40mm_HEDP, 8);
        MACRO_ADDMAGAZINE(Laserbatteries, 1);
        MACRO_ADDMAGAZINE(rhs_fim92_mag, 2);
    };
    class TransportWeapons
    {
        MACRO_ADDWEAPON(TB_rhs_weap_M136_CS, 2);
        MACRO_ADDWEAPON(rhs_weap_fim92, 1);
    };
};

class TB_Vehicles_Wueste_Badger : TB_Vehicles_Wald_Badger // Badger APC
{
    displayName = "Badger APC (Wüste)";
    author = "Eron";
    addCategoryBLU(Truppentransporter);
    hiddenSelectionsTextures[] =
    {
        QPATHTOF(pictures\vehicles\TB_Vehicles_Patria_AMW_1.paa),
        QPATHTOF(pictures\vehicles\TB_Vehicles_Patria_AMW_2.paa),
        QPATHTOF(pictures\vehicles\TB_Vehicles_Patria_AMW_1.paa),
        "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
        "\a3\Armor_F\Data\cage_sand_CO.paa"
    };
    editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wueste_Patria_AMW.jpg);
};