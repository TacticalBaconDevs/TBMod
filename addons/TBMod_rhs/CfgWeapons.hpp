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

    class rhs_weap_m32_Base_F;
    class rhs_weap_m32 : rhs_weap_m32_Base_F // M32 Grenadelauncher
    {
        magazines[] = {"rhsusf_mag_6Rnd_M714_white", "rhsusf_mag_6Rnd_M397_HET"};// {"rhsusf_mag_6Rnd_M441_HE","rhsusf_mag_6Rnd_M433_HEDP","rhsusf_mag_6Rnd_M397_HET","rhsusf_mag_6Rnd_M576_Buckshot","rhsusf_mag_6Rnd_M781_Practice","rhsusf_mag_6Rnd_m4009","rhsusf_mag_6Rnd_M585_white","rhsusf_mag_6Rnd_m661_green","rhsusf_mag_6Rnd_m662_red","rhsusf_mag_6Rnd_M713_red","rhsusf_mag_6Rnd_M714_white","rhsusf_mag_6Rnd_M715_green","rhsusf_mag_6Rnd_M716_yellow"}
    };
};
