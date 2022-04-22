/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/

class TB_Vehicles_Wald_Warrior : I_APC_tracked_03_cannon_F
{
    displayName = "FV510 Warrior IFV (Wald)";
    author = "Eron";
    addCategoryBLU(Truppentransporter);
    clutchStrength = 85; // 40
    enginePower = 544; // 485
    normalSpeedForwardCoef = 0.82; // 0.6
    peakTorque = 2000; // 2610
    redRpm = 2050; // 2600
    crewCrashProtection = 0.1; // 0.25
    hiddenSelectionsTextures[] =
    {
        QPATHTOF(pictures\vehicles\TB_Vehicles_FV510_2.paa),
        QPATHTOF(pictures\vehicles\TB_Vehicles_FV510_3.paa),
        "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
        "\A3\armor_f\data\cage_olive_co.paa"
    };
    editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wald_FV510.jpg);

    class TextureSources : TextureSources
    {
        class Green
        {
            displayName = "Grün";
            textures[] =
            {
                QPATHTOF(pictures\vehicles\TB_Vehicles_FV510_2.paa),
                QPATHTOF(pictures\vehicles\TB_Vehicles_FV510_3.paa),
                "\a3\Armor_F\Data\camonet_NATO_Green_CO.paa",
                "\A3\armor_f\data\cage_olive_co.paa"
            };
        };
        class Sand
        {
            displayName = "Sand";
            textures[] =
            {
                QPATHTOF(pictures\vehicles\TB_Vehicles_FV510_0.paa),
                QPATHTOF(pictures\vehicles\TB_Vehicles_FV510_1.paa),
                "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
                "\a3\Armor_F\Data\cage_sand_CO.paa"
            };
        };
    };

    animationList[] = {"showBags",1,"showBags2",1,"showCamonetHull",1,"showCamonetTurret",1,"showTools",1,"showSLATHull",1,"showSLATTurret",1};
    class AnimationSources : AnimationSources
    {
        class showSLATHull : showSLATHull
        {
            initPhase = 1; // 0
        };
        class showSLATTurret : showSLATTurret
        {
            initPhase = 1; // 0
        };
        class showBags : showBags
        {
            initPhase = 1; // 0
        };
        class showBags2 : showBags2
        {
            forceAnimatePhase = 1; // 0
            initPhase = 1; // 0
        };
        class showCamonetHull : showCamonetHull
        {
            initPhase = 1; // 0
        };
        class showCamonetTurret : showCamonetTurret
        {
            initPhase = 1; // 0
        };
        class showTools : showTools
        {
            initPhase = 1; // 0
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

                    #ifdef GroundTarget
                        class GroundTarget : GroundTarget
                    #else
                        class GroundTarget // Problem mit StarWars, desswegen ohne Parent
                    #endif
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

    class HitPoints : HitPoints
    {
        class HitHull : HitHull
        {
            armor = 0.69; // 0.3 neuer Wert entspricht 621 HP
            explosionShielding = 0.35; // 0.2
        };
    };

    class Turrets : Turrets
    {
        class MainTurret : MainTurret
        {
            weapons[] = {"TB_autocannon_CT40", "TB_coax_L94A1"};

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
                "TB_mag_40Rnd_40mm_GPR",
                "TB_mag_40Rnd_40mm_APFSDS",
                "TB_mag_40Rnd_40mm_APFSDS",
                "2000Rnd_762x51_Belt_T_Red",
                "2000Rnd_762x51_Belt_T_Red"
            };
            class OpticsIn : Optics_Gunner_APC_02
            {
                class Wide : Wide
                {
                    thermalMode[] = {0,1}; // {"2,3"}
                };
                class Medium : Medium
                {
                    thermalMode[] = {0,1}; // {"2,3"}
                };
                class Narrow : Narrow
                {
                    thermalMode[] = {0,1}; // {"2,3"}
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

class TB_Vehicles_Wueste_Warrior : TB_Vehicles_Wald_Warrior // FV510 Warrior
{
    displayName = "FV510 Warrior IFV (Wüste)";
    author = "Eron";
    addCategoryBLU(Truppentransporter);
    hiddenSelectionsTextures[] =
    {
        QPATHTOF(pictures\vehicles\TB_Vehicles_FV510_0.paa),
        QPATHTOF(pictures\vehicles\TB_Vehicles_FV510_1.paa),
        "\a3\Armor_F\Data\camonet_NATO_Desert_CO.paa",
        "\a3\Armor_F\Data\cage_sand_CO.paa"
    };
    editorPreview = QPATHTOF(pictures\editorPreview\TB_Vehicles_Wueste_FV510.jpg);
};
