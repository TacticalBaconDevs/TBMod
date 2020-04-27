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

    class GMG_F;
    class GMG_40mm : GMG_F
    {
        magazines[] += {"TB_Smoke_Grenades"};
    };
};
