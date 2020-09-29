/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgWeapons
{
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
        //picture = "\rhsusf\addons\rhsusf_inventoryicons\data\vests\rhsusf_spcs_ucp_saw_ca.paa"; // wird in TBMod_rhs gesetzt
    };

    class V_PlateCarrierGL_rgr;
    class V_PlateCarrierGL_mtp : V_PlateCarrierGL_rgr
    {
        class ItemInfo;
    };
    class TB_vest_sps_ocp : V_PlateCarrierGL_mtp // SPS Schutzweste in OCP Tier 4
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
        displayName = "SPS Tier 4 (OCP)"; // "Carrier GL Rig (MTP)"
    };

    class GMG_F;
    class GMG_40mm : GMG_F
    {
        magazines[] += {"TB_Smoke_Grenades"};
    };

    class HelmetBase;
    class H_Watchcap_blk : HelmetBase
    {
        class ItemInfo;
    };
    class TB_headgear_beanie_eric : H_Watchcap_blk // Beanie (Eric)
    {
        class ItemInfo : ItemInfo
        {
            class HitpointsProtectionInfo
            {
                class Head
                {
                    armor = 6; // 0
                    hitpointName = "HitHead";
                    passThrough = 0.5; // 1
                };
            };
            mass = 24; // 6
        };
        displayName = "Beanie (Eric)";
    };

    class weapon_VLSBase;
    class weapon_VLS_01 : weapon_VLSBase // Mk41 VLS
    {
        displayName = "BGM-109 Tomahawk";
        reloadTime = 2; // 10
        magazineReloadTime = 2; // 120
    };

    class CannonCore;
    class mortar_155mm_AMOS : CannonCore
    {
        class Burst1;
        class Single1;
    };
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
        class Burst1 : Burst1
        {
            reloadTime = 2; // 6
        };
        class Burst2 : Burst1
        {
            reloadTime = 2; // 6
        };
        class Burst3 : Burst1
        {
            reloadTime = 2; // 6
        };
        class Burst4 : Burst1
        {
            reloadTime = 2; // 6
        };
        class Burst5 : Burst1
        {
            reloadTime = 2; //  6
        };
        class Single1 : Single1
        {
            reloadTime = 2; // 6
        };
        class Single2 : Single1
        {
            reloadTime = 2; // 6
        };
        class Single3 : Single1
        {
            reloadTime = 2; // 6
        };
        class Single4 : Single1
        {
            reloadTime = 2; // 6
        };
        class Single5 : Single1
        {
            reloadTime = 2; //  6
        };
    };

    class cannon_105mm: CannonCore
    {
        class player;
    };
    class cannon_105mm_VTOL_01 : cannon_105mm // VTOL 105mm
    {
        displayName = "Zorn der Athene";
        class player : player
        {
            reloadTime = 2; // 5
        };
    };

    class gatling_20mm;
    class gatling_20mm_VTOL_01 : gatling_20mm // VTOL 20mm
    {
        displayName = "Zorn des Zeus"; // "Minigun 20Â mm"
    };

    class autocannon_Base_F;
    class autocannon_40mm_CTWS : autocannon_Base_F
    {
        class player;
    };
    class autocannon_40mm_VTOL_01 : autocannon_40mm_CTWS // VTOL 40mm
    {
        displayName = "Zorn des Hephaistos";
        class player : player
        {
            reloadTime = 0.02; // 0.3
        };
    };

    class MGun;
    class LMG_RCWS : MGun
    {
        class manual;
    };
    class LMG_Minigun : LMG_RCWS
    {
        class manual : manual
        {
            multiplier = 1; // 3
            reloadTime = 0.05; // 0.075
        };
    };
};
