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

    class RocketPods;
    class rhs_weap_FFARLauncher : RocketPods // Hydra (M151 HEPD)
    {
        modes[] = {"Far_AI","Burst"}; // "Far_AI","Single","Two","Four","Eight","Twelve","TwentyFour","Burst"
    };

    class rhs_weap_FFARLauncher_M229 : rhs_weap_FFARLauncher // Hydra (M229 HEPD)
    {
        modes[] = {"Far_AI","Burst"}; // "Far_AI","Single","Two","Four","Eight","Twelve","TwentyFour","Burst"
    };
};
