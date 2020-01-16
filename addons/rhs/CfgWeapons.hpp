/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgWeapons
{
    class mortar_155mm_AMOS;
    class weapon_ShipCannon_120mm : mortar_155mm_AMOS
    {
        magazines[] = {
            "magazine_ShipCannon_120mm_HE_shells_x32",
            "magazine_ShipCannon_120mm_HE_guided_shells_x2",
            "magazine_ShipCannon_120mm_HE_LG_shells_x2",
            "magazine_ShipCannon_120mm_HE_cluster_shells_x2",
            "magazine_ShipCannon_120mm_mine_shells_x6",
            "magazine_ShipCannon_120mm_smoke_shells_x6",
            "magazine_ShipCannon_120mm_AT_mine_shells_x6"
        };
        dispersion = 0.0005; // 0.002
        magazineReloadTime = 1; // 7
    };

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

    class weapon_LGBLauncherBase;
    class Bomb_04_Plane_CAS_01_F : weapon_LGBLauncherBase // GBU-12
    {
        displayName = "Laserguided Bomb";
    };

    class BombCluster_01_F : Bomb_04_Plane_CAS_01_F // CBU-85 HE Mines Cluster
    {
        displayName = "HE Minen Cluster";
    };

    class BombCluster_02_F : BombCluster_01_F // RBK-500F AT Mines Cluster
    {
        displayName = "AT Minen Cluster";
    };

    class BombCluster_03_F : BombCluster_01_F // BL-778 HE Cluster
    {
        displayName = "HE Cluster";
    };

    class Mk82BombLauncher : RocketPods // Mk-82
    {
        displayName = "Airburst Bomb";
    };

    // Skin schwarzes Shemagh
    class H_ShemagOpen_khk;
    class TB_Shemagh_black: H_ShemagOpen_khk
    {
        displayName = "Shemag Black";
        author = "Eron";
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\headgear\TB_Shemagh_black.paa)};
    };

    // Skin schwarzer Helm S.W.A.T.
    class rhsusf_opscore_bk_pelt;
    class TB_helmet_SWAT_01: rhsusf_opscore_bk_pelt
    {
        displayName = "S.W.A.T.";
        author = "Eron";
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\headgear\TB_black_helmet_SWAT_01.paa)};
    };

    class launch_O_Titan_F;
    class rhs_weap_fgm148: launch_O_Titan_F // FGM-148 Javelin
    {
        aimTransitionSpeed = 0.16; // 0.5
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

    class rhs_weap_M136;
    class TB_rhs_weap_M136_CS: rhs_weap_M136 // M136 HEAT (CS)
    {
        ace_overpressure_angle = 20; // 60
        ace_overpressure_range = 0.75; // 10
        aimTransitionSpeed = 0.36; // 0.75
        descriptionShort = "Rocket launcher<br/>Caliber: 84mm<br/>Type: Single-shot Anti-Tank Confined Spaces"; // ""Rocket launcher<br/>Caliber: 84mm<br/>Type: Single-shot Anti-Tank";"
        displayName = "M136 CS (HEAT)"; // "M136 (HEAT)"
        mass = 143.26; // 30.3
    };

    class rhs_weap_M136_used;
    class TB_rhs_weap_M136_CS_used: rhs_weap_M136_used // M136 HEAT (CS) - USED
    {
        descriptionShort = "Used rocket launcher<br/>Caliber: 84mm<br/>Type: Used Single-shot Anti-Tank Confined Spaces"; // "Used rocket launcher<br/>Caliber: 84mm<br/>Type: Used launcher tube";
        displayName = "M136 CS HEAT (Used)"; // "M136 HEAT (used)"
        mass = 143.26; // 30.3
    };

    class rhs_weap_M136_hedp: rhs_weap_M136 // M136 HEDP
    {
        aimTransitionSpeed = 0.65; // 0.75
        mass = 82.65; // 30.3
    };

    class rhs_weap_M136_hp: rhs_weap_M136 // M136 HP
    {
        aimTransitionSpeed = 0.36; // 0.75
        mass = 148.77; // 30.3
    };

    class rhs_weap_m72a7: rhs_weap_M136 // M72A7
    {
        ace_overpressure_angle = 40; // 60
        ace_overpressure_range = 7.5; // 10
        descriptionShort = "Rocket launcher<br/>Caliber: 66mm<br/>Type: Single-shot High-explosive"; // "Rocket launcher<br/>Caliber: 66mm<br/>Type: Single-shot Anti-Tank"
        displayName = "M72E10 (HE)"; // "M72A7"
        mass = 55.1; // 15.8
    };

    class rhs_weap_fim92: rhs_weap_M136 // FIM-92F
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
        magazineWell[] = {"CBA_762x51_SCAR", "AK_545x39", "CBA_545x39_AK", "CBA_545x39_RPK","STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL","AK_762x39","CBA_762x39_AK","CBA_762x39_RPK","CBA_762x51_AR10","CBA_762x51_AR10_L","CBA_762x51_AR10_XL"};
        magazines[] += {"rhs_mag_20Rnd_SCAR_762x51_mk316_special_LRS"};
        ACE_barrelLength = 330;
        ACE_barrelTwist = 177.8;
    };

    class rhs_weap_SCAR_H_LB_Base;
    class rhs_weap_mk17_LB: rhs_weap_SCAR_H_LB_Base // Mk17 LB
    {
        magazineWell[] = {"CBA_762x51_SCAR", "AK_545x39", "CBA_545x39_AK", "CBA_545x39_RPK","STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL","AK_762x39","CBA_762x39_AK","CBA_762x39_RPK","CBA_762x51_AR10","CBA_762x51_AR10_L","CBA_762x51_AR10_XL"};
        magazines[] += {"rhs_mag_20Rnd_SCAR_762x51_mk316_special_LRS"};
        ACE_barrelLength = 510;
        ACE_barrelTwist = 177.8;
        aimTransitionSpeed = 0.36; // 1
    };

    class rhs_weap_SCAR_H_STD_Base;
    class rhs_weap_mk17_STD: rhs_weap_SCAR_H_STD_Base // Mk17 STD
    {
        magazineWell[] = {"CBA_762x51_SCAR", "AK_545x39", "CBA_545x39_AK", "CBA_545x39_RPK","STANAG_556x45","STANAG_556x45_Large","CBA_556x45_STANAG","CBA_556x45_STANAG_L","CBA_556x45_STANAG_XL","CBA_556x45_STANAG_2D","CBA_556x45_STANAG_2D_XL","AK_762x39","CBA_762x39_AK","CBA_762x39_RPK","CBA_762x51_AR10","CBA_762x51_AR10_L","CBA_762x51_AR10_XL"};
        magazines[] += {"rhs_mag_20Rnd_SCAR_762x51_mk316_special_LRS"};
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

    class ACE_ItemCore;
    class ACE_Clacker: ACE_ItemCore // M57 Firing Device
    {
        mass = 7.71; // 3
    };

    class ACE_M26_Clacker: ACE_Clacker // M152 Firing Device
    {
        mass = 27.55; // 3
    };
};
