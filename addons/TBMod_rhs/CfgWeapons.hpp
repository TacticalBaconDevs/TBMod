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
            "\TBMod_skins\pictures\vests\TB_black_vest_spc_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_spc_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_spc_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_spc_01.paa"
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
            "\TBMod_skins\pictures\vests\TB_black_vest_ucp_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_ucp_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_ucp_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_ucp_01.paa"
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
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_01.paa"
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
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_01.paa"
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
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_SWAT_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_SWAT_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_SWAT_01.paa",
            "\TBMod_skins\pictures\vests\TB_black_vest_mbav_SWAT_01.paa"
        };
        picture = "\A3\Characters_F_Mark\Data\UI\icon_carrier_spec_rig_blk.paa";
    };

    class RocketPods;
    class rhs_weap_FFARLauncher : RocketPods // Hydra (M151 HEPD)
    {
        modes[] = {"Far_AI","Burst"}; // "Far_AI","Single","Two","Four","Eight","Twelve","TwentyFour","Burst"
    };

    class rhs_weap_FFARLauncher_M229 : rhs_weap_FFARLauncher // Hydra (M229 HEPD)
    {
        modes[] = {"Far_AI","Burst"}; // "Far_AI","Single","Two","Four","Eight","Twelve","TwentyFour","Burst"
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
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\headgear\TB_Shemagh_black.paa"};
    };

    // Skin schwarzer Helm S.W.A.T.
    class rhsusf_opscore_bk_pelt;
    class TB_helmet_SWAT_01: rhsusf_opscore_bk_pelt
    {
        displayName = "S.W.A.T.";
        author = "Eron";
        hiddenSelectionsTextures[] = {"\TBMod_skins\pictures\headgear\TB_black_helmet_SWAT_01.paa"};
    };

    class launch_O_Titan_F;
    class rhs_weap_fgm148: launch_O_Titan_F // FGM-148 Javelin
    {
        mass = 176.37; // 152.46
    };

    class Launcher_Base_F;
    class rhs_weap_smaw: Launcher_Base_F // MK153 Mod 0 SMAW (Black)
    {
        mass = 132.25; // 34
    };

    class rhs_weap_maaws: Launcher_Base_F // M3 MAAWS
    {
        mass = 154.32; // 38.4
    };

    class rhs_weap_M136: Launcher_Base_F // M136 (HEAT)
    {
        mass = 143.3; // 30.3
    };

    class rhs_weap_M136_hedp: rhs_weap_M136 // M136 (HEDP)
    {
        mass = 88.18; // 30.3
    };

    class rhs_weap_M136_hp: rhs_weap_M136 // M136 (HP)
    {
        mass = 66.13; // 30.3
    };

    class rhs_weap_m72a7: rhs_weap_M136 // M72A7
    {
        mass = 71.63; // 15.8
    };

    class rhs_weap_fim92: rhs_weap_M136 // FIM-92F
    {
        mass = 132.25; // 92.35
    };
};
