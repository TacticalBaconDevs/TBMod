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

    class RocketPods;
    class Mk82BombLauncher : RocketPods // Mk-82
    {
        displayName = "Airburst Bomb";
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


    class H_HelmetB;
    class H_HelmetB_TI_tna_F : H_HelmetB
    {
        class ItemInfo;
    };
    class TB_headgear_sps_ucp : H_HelmetB_TI_tna_F // SPS Helm
    {
        class ItemInfo : ItemInfo
        {
            class HitpointsProtectionInfo
            {
                class Face
                {
                    armor = 7; // 4
                    hitpointName = "HitFace";
                    passThrough = 0.4; // 0.5
                };
                class Head
                {
                    armor = 9; // 6
                    hitpointName = "HitHead";
                    passThrough = 0.3; // 0.5
                };
            };
            mass = 71.63; // 30
        };
        displayName = "SPS (UCP)"; // Tarn-Kampfhelm
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\headgear\TB_headgear_sps_ucp.paa)}; // \A3\Characters_F_Exp\BLUFOR\Data\H_HelmetB_TI_tna_F_co.paa
        picture = "\A3\Characters_F\data\ui\icon_H_Crew_Helmet_Heli_B_CA.paa";
    };

    class V_PlateCarrierIA2_dgtl;
    class V_PlateCarrierIAGL_dgtl : V_PlateCarrierIA2_dgtl
    {
        class ItemInfo;
    };
    class TB_vest_sps_ucp : V_PlateCarrierIAGL_dgtl // SPS Schutzweste in UCP Tier 4
    {
        class ItemInfo : ItemInfo
        {
            class HitpointsProtectionInfo
            {
                class Abdomen
                {
                    armor = 39; // 16
                    hitpointName = "HitAbdomen";
                    passThrough = 0.2; // 0.3
                };
                class Arms
                {
                    armor = 25; // 8
                    hitpointName = "HitArms";
                    passThrough = 0.3; // 0.5
                };
                class Body
                {
                    hitpointName = "HitBody";
                    passThrough = 0.1; // 0.6
                };
                class Chest
                {
                    armor = 39; // 78
                    hitpointName = "HitChest";
                    passThrough = 0.1; // 0.6
                };
                class Diaphragm
                {
                    armor = 39; // 78
                    hitpointName = "HitDiaphragm";
                    passThrough = 0.1; // 0.6
                };
                class Neck
                {
                    armor = 28; // 8
                    hitpointName = "HitNeck";
                    passThrough = 0.3; // 0.5
                };
                class Pelvis
                {
                    armor = 31; // 16
                    hitpointName = "HitPelvis";
                    passThrough = 0.2; // 0.3
                };
            };
            mass = 286.52; // 100
        };
        descriptionShort = "Panzerungsstufe IV"; // "Sprengstoffresistent"
        displayName = "SPS Tier 4 (UCP)"; // "Boden-Luft-Granatwerfer-Tragegurt (Tarnfarbe)"
        hiddenSelectionsTextures[] = {QPATHTOEF(skins,pictures\vests\TB_vest_sps_ucp_01.paa),QPATHTOEF(skins,pictures\vests\TB_vest_sps_ucp_02.paa)};
        picture = "\rhsusf\addons\rhsusf_inventoryicons\data\vests\rhsusf_spcs_ucp_saw_ca.paa";
    };

};
