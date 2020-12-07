/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgWeapons
{
    // Skin schwarze Weste
    class rhsusf_spc_patchless_radio;
    class SPC_Black_01: rhsusf_spc_patchless_radio
    {
        displayName = "SPC Black";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\vests\TB_black_vest_spc_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_spc_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_spc_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_spc_01.paa)
        };
        picture = "\A3\Characters_F_Mark\Data\UI\icon_carrier_spec_rig_blk.paa";
    };

    // Skin schwarze Weste
    class rhsusf_spcs_ucp_rifleman;
    class UCP_Black_01: rhsusf_spcs_ucp_rifleman
    {
        displayName = "UCP Black";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\vests\TB_black_vest_ucp_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_ucp_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_ucp_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_ucp_01.paa)
        };
        picture = "\A3\Characters_F_Mark\Data\UI\icon_carrier_spec_rig_blk.paa";
    };

    // Skin schwarze Weste
    class rhsusf_mbav_mg;
    class MBAV_Black_01: rhsusf_mbav_mg
    {
        displayName = "MBAV Black";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_01.paa)
        };
        picture = "\A3\Characters_F_Mark\Data\UI\icon_carrier_spec_rig_blk.paa";
    };

    // Skin schwarze Weste
    class rhsusf_mbav_medic;
    class MBAV_Black_02: rhsusf_mbav_medic
    {
        displayName = "MBAV Black";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_01.paa)
        };
        picture = "\A3\Characters_F_Mark\Data\UI\icon_carrier_spec_rig_blk.paa";
    };

    // Skin S.W.A.T. Weste
    class rhsusf_mbav_light;
    class TB_vest_SWAT: rhsusf_mbav_light
    {
        displayName = "S.W.A.T.";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_SWAT_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_SWAT_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_SWAT_01.paa),
            QPATHTOEF(skins,pictures\vests\TB_black_vest_mbav_SWAT_01.paa)
        };
        picture = "\A3\Characters_F_Mark\Data\UI\icon_carrier_spec_rig_blk.paa";
    };

    // Skin Weste IS
    class rhs_6sh92;
    class TB_vest_IS_01: rhs_6sh92
    {
        displayName = "ISIS Weste1 (Black)";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\vests\TB_vest_IS_01A.paa),
            QPATHTOEF(skins,pictures\vests\TB_vest_IS_01B.paa)
        };
    };

    class RocketPods;
    class rhs_weap_FFARLauncher : RocketPods // Hydra (M151 HEPD)
    {
        modes[] = {"Far_AI","Single","Burst"}; // "Far_AI","Single","Two","Four","Eight","Twelve","TwentyFour","Burst"
    };

    class rhs_weap_FFARLauncher_M229 : rhs_weap_FFARLauncher // Hydra (M229 HEPD)
    {
        modes[] = {"Far_AI","Single","Burst"}; // "Far_AI","Single","Two","Four","Eight","Twelve","TwentyFour","Burst"
    };



    // Skin schwarzer Helm S.W.A.T.
    class rhsusf_opscore_bk_pelt;
    class TB_helmet_SWAT_01: rhsusf_opscore_bk_pelt
    {
        displayName = "S.W.A.T.";
        author = "Eron";
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\headgear\TB_black_helmet_SWAT_01.paa)};
    };

    //Skin Sanihelm Delta Force
    class TB_helmet_Sani_A_Black: rhsusf_opscore_bk_pelt
    {
        displayName = "Sani Delta Force";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\headgear\TB_headgear_SaniA01.paa),
            QPATHTOEF(skins,pictures\headgear\TB_headgear_SaniA02.paa)};
    };

    //Skin Sanihelm USMC Urban
    class rhsusf_opscore_mar_fg_pelt;
    class TB_helmet_Sani_B_Grey: rhsusf_opscore_mar_fg_pelt
    {
        displayName = "Sani Urban";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\headgear\TB_headgear_SaniB01.paa),
            QPATHTOEF(skins,pictures\headgear\TB_headgear_SaniB02.paa),
            QPATHTOEF(skins,pictures\headgear\TB_headgear_SaniB03.paa)};
        picture = "\rhsusf\addons\rhsusf_inventoryicons\data\headgear\rhsusf_opscore_mar_ut_pelt_ca.paa";
    };

    //Skin Sanihelm Ranger Green
    class TB_helmet_Sani_C_Green: rhsusf_opscore_mar_fg_pelt
    {
        displayName = "Sani Green";
        author = "Eron";
        hiddenSelectionsTextures[] = {
            QPATHTOEF(skins,pictures\headgear\TB_headgear_SaniC01.paa),
            QPATHTOEF(skins,pictures\headgear\TB_headgear_SaniC02.paa),
            QPATHTOEF(skins,pictures\headgear\TB_headgear_SaniC03.paa)};
    };

    class launch_O_Titan_F;
    class rhs_weap_fgm148: launch_O_Titan_F // FGM-148 Javelin
    {
        mass = 176.37; // 152.46
    };

    class Launcher_Base_F;
    class rhs_weap_smaw: Launcher_Base_F // MK153 Mod 0 SMAW (Black)
    {
        aimTransitionSpeed = 0.46; // 0.5
        mass = 110.2; // 34
    };

    class rhs_weap_maaws: Launcher_Base_F // M3 MAAWS
    {
        aimTransitionSpeed = 0.32; // 0.5
        mass = 137.75; // 38.4
    };

    class rhs_weap_M136: Launcher_Base_F // M136 HEAT
    {
        aimTransitionSpeed = 0.50; // 0.75
        mass = 147.67; // 30.3
    };

    class rhs_weap_M136_hedp: rhs_weap_M136 // M136 HEDP
    {
        aimTransitionSpeed = 0.65; // 0.75
        mass = 147.67; // 30.3
    };

    class TB_rhs_weap_M136_CS: rhs_weap_M136 // M136 HEAT (CS)
    {
        aimTransitionSpeed = 0.22; // 0.75
        ace_overpressure_angle = 20; // 60
        ace_overpressure_range = 0.75; // 10
        descriptionShort = "Rocket launcher<br/>Caliber: 84mm<br/>Type: Single-shot Anti-Tank Confined Spaces"; // ""Rocket launcher<br/>Caliber: 84mm<br/>Type: Single-shot Anti-Tank";"
        displayName = "M136 CS (HEAT)"; // "M136 (HEAT)"
        magazines[] = {"rhs_m136_mag"}; // "rhs_m136_mag"
        mass = 187.34; // 30.3
    };

    class rhs_weap_M136_used;
    class TB_rhs_weap_M136_CS_used: rhs_weap_M136_used // M136 HEAT (CS) - USED
    {
        descriptionShort = "Used rocket launcher<br/>Caliber: 84mm<br/>Type: Used Single-shot Anti-Tank Confined Spaces"; // "Used rocket launcher<br/>Caliber: 84mm<br/>Type: Used launcher tube";
        displayName = "M136 CS HEAT (Used)"; // "M136 HEAT (used)"
        mass = 107.99; // 30.3
    };

    class rhs_weap_m72a7: rhs_weap_M136 // M72A7
    {
        ace_overpressure_angle = 40; // 60
        ace_overpressure_range = 7.5; // 10
        descriptionShort = "Rocket launcher<br/>Caliber: 66mm<br/>Type: Single-shot High-explosive"; // "Rocket launcher<br/>Caliber: 66mm<br/>Type: Single-shot Anti-Tank"
        displayName = "M72E10 (HE)"; // "M72A7"
        mass = 55.1; // 15.8
    };

    class rhs_weap_fim92: launch_O_Titan_F // FIM-92F
    {
        aimTransitionSpeed = 0.5; // 0.6
        mass = 132.25; // 92.35
    };

    class rhs_weap_SCAR_Base;
    class rhs_weap_SCAR_H_Base: rhs_weap_SCAR_Base // Mk17 Base Class
    {
        ACE_Overheating_dispersion = 0.75;
        ace_overheating_mrbs = 3000;
        ACE_RailHeightAboveBore = 3.13162;
    };

    class rhs_weap_SCAR_H_CQC_Base;
    class rhs_weap_mk17_CQC: rhs_weap_SCAR_H_CQC_Base // Mk17 CQC
    {
        displayName = "Mk 16 Mod 0 (CQC)"; // Mk 17 Mod 0 (CQC)
        magazineWell[] = {"AK_545x39","CBA_545x39_AK","CBA_545x39_RPK","STANAG_556x45","CBA_556x45_STANAG"};
        magazines[] += {"rhs_mag_30Rnd_556x45_Mk318_SCAR_Ranger"};
        ACE_barrelLength = 330;
        ACE_barrelTwist = 177.8;
    };

    class rhs_weap_SCAR_H_LB_Base;
    class rhs_weap_mk17_LB: rhs_weap_SCAR_H_LB_Base // Mk17 LB
    {
        magazineWell[] = {"SVD_762x54R","Rahim_762x54","M14_762x51","CBA_762x54R_SVD","CBA_762x51_SCAR","AK_762x39","CBA_762x51_AR10","CBA_762x51_AR10_L","CBA_762x51_AR10_XL"};
        magazines[] += {"rhs_mag_20Rnd_SCAR_762x51_m80a1_epr"};
        ACE_barrelLength = 510;
        ACE_barrelTwist = 177.8;
        aimTransitionSpeed = 0.36; // 1
    };

    class rhs_weap_SCAR_H_STD_Base;
    class rhs_weap_mk17_STD: rhs_weap_SCAR_H_STD_Base // Mk17 STD
    {
        magazineWell[] = {"CBA_762x51_SCAR","AK_762x39","CBA_762x39_AK","CBA_762x39_RPK","CBA_762x51_AR10","CBA_762x51_AR10_L","CBA_762x51_AR10_XL"};
        magazines[] += {"rhs_mag_20Rnd_SCAR_762x51_m80a1_epr"};
        ACE_barrelLength = 410;
        ACE_barrelTwist = 177.8;
        aimTransitionSpeed = 0.76; // 1
    };

    class rhs_weap_m240_base;
    class rhs_weap_m240G: rhs_weap_m240_base // M240G
    {
        ace_overheating_mrbs = 750; // 3000
        aimTransitionSpeed = 0.16; // 0.5
    };

    class rhs_weap_m249_pip_S;
    class rhs_weap_m249_light_S: rhs_weap_m249_pip_S // M249
    {
        ace_overheating_mrbs = 750; // 3000
        aimTransitionSpeed = 0.36; // 0.5
    };

    class rhs_weap_M107_Base_F;
    class rhs_weap_M107: rhs_weap_M107_Base_F // M107
    {
        aimTransitionSpeed = 0.26; // 0.5
    };

    class rhs_weap_orsis_Base_F;
    class rhs_weap_t5000 : rhs_weap_orsis_Base_F
    {
        class Mode_SemiAuto;
    };
    class TB_rhs_weap_mk22_ASR : rhs_weap_t5000 // Mk22 ASR
    {
        ACE_barrelLength = 698.5;
        ACE_barrelTwist = 254;
        ace_overheating_mrbs = 3000;
        ACE_RailHeightAboveBore = 2.12198;
        author = "TBMod";
        baseWeapon = "TB_rhs_weap_mk22_ASR";
        displayName = "Mk22 ASR";
        magazineWell[] = {"TB_magwell_10Rnd_338"};
        magazines[] += {"TB_mag_10Rnd_338_LS_Tracer"};

        class Single : Mode_SemiAuto
            {
                aiDispersionCoefX = 1.4;
                aiDispersionCoefY = 1.7;
                aiRateOfFire = 2;
                aiRateOfFireDispersion = 1;
                aiRateOfFireDistance = 500;
                artilleryCharge = 1;
                artilleryDispersion = 1;
                autoFire = 0;
                burst = 1;
                burstRangeMax = -1;
                canShootInWater = 0;
                dispersion = 0.0001018;
                displayName = "Semi";
                ffCount = 1;
                ffFrequency = 11;
                ffMagnitude = 0.5;
                flash = "gunfire";
                flashSize = 0.1;
                maxRange = 400;
                maxRangeProbab = 0.04;
                midRange = 250;
                midRangeProbab = 0.7;
                minRange = 2;
                minRangeProbab = 0.3;
                multiplier = 1;
                recoil = "recoil_single_primary_3outof10";
                recoilProne = "recoil_single_primary_prone_3outof10";
                reloadTime = 1.6;
                requiredOpticType = -1;
                showToPlayer = 1;
                class SilencedSound
                    {
                        soundSetShot[] = {"RHS_sd_orsis_Shot_SoundSet","RHS_sd_mmg1_Tail_SoundSet"};
                    };
                sound[] = {"",10,1};
                soundBegin[] = {"sound",1};
                soundBeginWater[] = {"sound",1};
                soundBurst = 0;
                soundClosure[] = {"sound",1};
                soundContinuous = 0;
                soundEnd[] = {};
                soundLoop[] = {};
                sounds[] = {"StandardSound","SilencedSound"};
                class StandardSound
                    {
                        soundSetShot[] = {"RHS_orsis_Shot_SoundSet","RHS_rifle2_Tail_SoundSet"};
                    };
                textureType = "semi";
                useAction = 0;
                useActionTitle = "";
                weaponSoundEffect = "";
            };
    };

    class rhs_weap_m27iar;
    class rhs_weap_m27iar_grip : rhs_weap_m27iar
    {
        class WeaponSlotsInfo;
    };
    class TB_weap_m27iar : rhs_weap_m27iar_grip
    {
        author = "TBMod";
        baseWeapon = "TB_weap_m27iar";
        displayName = "M27 IAR";
        magazines[] = {"TB_mag_100Rnd_556x45_Mk318_tracer"};
        magazineWell[] = {"TB_magwell_100Rnd_556","CBA_556x45_STANAG_2D","CBA_556x45_STANAG"};
        class WeaponSlotsInfo : WeaponSlotsInfo
        {
            mass = 79.344;
        };
    };

    class rhs_altyn;
    class rhs_altyn_visordown : rhs_altyn
    {
        class ItemInfo;
    };
    class TB_headgear_bomb_suit : rhs_altyn_visordown // EOD Bomb Suit Headgear
    {
        class ItemInfo : ItemInfo
        {
            class HitpointsProtectionInfo
            {
                class Face
                {
                    armor = 10;
                    explosionShielding	= 0.85;
                    hitpointName = "HitFace";
                    passThrough = 0.8;
                };
                class Head
                {
                    armor = 10;
                    explosionShielding	= 0.85;
                    hitpointName = "HitHead";
                    passThrough = 0.4;
                };
            };
            author = "TBMod";
            mass = 110.2;
        };
        descriptionShort = "Explosive Resistant";
        displayName = "Advanced Bomb Suit Headgear";
    };

    class rhsusf_ach_helmet_ocp;
    class rhsusf_opscore_01: rhsusf_ach_helmet_ocp
    {
        class ItemInfo;
    };
    class rhsusf_hgu56p: rhsusf_opscore_01 // RHS Heli-Pilotenhelme
    {
        class ItemInfo: ItemInfo
        {
            mass = 77.14; // 40

            class HitpointsProtectionInfo
            {
                class Head
                {
                    armor = 10; // 6
                    hitpointName = "HitHead";
                    passThrough = 0.4; // 0.5
                };
                class Face
                {
                    armor = 10;
                    hitpointName = "HitFace";
                    passThrough = 0.8;
                };
            };
        };
    };
    class rhsusf_ihadss: rhsusf_opscore_01 // IHADSS Heli-Pilotenhelm
    {
        class ItemInfo: ItemInfo
        {
            mass = 77.14; // 40

            class HitpointsProtectionInfo
            {
                class Head
                {
                    armor = 10; // 6
                    hitpointName = "HitHead";
                    passThrough = 0.1; // 0.5
                };
                class Face
                {
                    armor = 10;
                    hitpointName = "HitFace";
                    passThrough = 0.1;
                };
            };
        };
    };

    class V_PlateCarrierIAGL_dgtl;
    class TB_vest_sps_ucp : V_PlateCarrierIAGL_dgtl // SPS Schutzweste in UCP Tier 4
    {
        picture = "\rhsusf\addons\rhsusf_inventoryicons\data\vests\rhsusf_spcs_ucp_saw_ca.paa";
    };

};
