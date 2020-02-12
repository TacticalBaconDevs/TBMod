/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgMagazines
{
    class rhs_mag_m713_Red;
    class rhs_mag_m713_Red_precise : rhs_mag_m713_Red
    {
        ammo = "rhs_40mm_smoke_red_precise";
        author = "TBMod";

        descriptionShort = "Type: AIM Smoke Round - Red<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "M713A Red Smoke Round";
        displaynameshort = "Red AIM Smoke";

        mass = 5; //5
    };

    class rhs_mag_m714_White;
    class rhs_mag_m714_White_precise : rhs_mag_m714_White
    {
        ammo = "rhs_40mm_smoke_white_precise";
        author = "TBMod";

        descriptionShort = "Type: AIM Smoke Round - White<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "M714A White Smoke Round";
        displaynameshort = "White AIM Smoke";

        mass = 5; //5
    };

    class rhs_mag_m715_Green;
    class rhs_mag_m715_Green_precise : rhs_mag_m715_Green
    {
        ammo = "rhs_40mm_smoke_green_precise";
        author = "TBMod";

        descriptionShort = "Type: AIM Smoke Round - Green<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "M715A Green Smoke Round";
        displaynameshort = "Green AIM Smoke";

        mass = 5; //5
    };

    class rhs_mag_m716_Yellow;
    class rhs_mag_m716_Yellow_precise : rhs_mag_m716_Yellow
    {
        ammo = "rhs_40mm_smoke_yellow_precise";
        author = "TBMod";

        descriptionShort = "Type: AIM Smoke Round - Yellow<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "M716A Yellow Smoke Round";
        displaynameshort = "Yellow AIM Smoke";

        mass = 5; //5
    };

    class CA_LauncherMagazine;
    class rhs_fgm148_magazine_AT : CA_LauncherMagazine
    {
        mass = 159.79; // 286.88
    };

    class rhs_mag_M433_HEDP;
    class TB_rhs_mag_40mm_HEDP : rhs_mag_M433_HEDP // Umbenennung zu TB_HEDP
    {
        ammo = "TB_rhs_40mm_HEDP";
        author = "TBMod";

        descriptionShort = "Type: TB HEDP Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm HEDP Grenade Round";
        displaynameshort = "TB HEDP Grenade";

        mass = 5; // 5.06
    };

    class rhs_mag_M441_HE;
    class TB_rhs_mag_40mm_HE : rhs_mag_M441_HE // Umbenennung zu TB_HE
    {
        ammo = "TB_rhsusf_40mm_HET";
        author = "TBMod";

        descriptionShort = "Type: TB HET Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm HET Grenade Round";
        displaynameshort = "TB HET Grenade";

        mass = 5; // 5.06
    };

    class rhsusf_8Rnd_Slug;
    class TB_rhs_mag_40mm_Slugshot : rhsusf_8Rnd_Slug // Umbenennung zu TB_Slugshot
    {
        ammo = "TB_rhs_ammo_40mm_Slugshot";
        author = "TBMod";

        descriptionShort = "Type: TB Slugshot Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm Slugshot Grenade Round";
        displaynameshort = "TB Slugshot Grenade";

        count = 1; // 8
        mass = 5; // 5.06
        picture = "\rhsusf\addons\rhsusf_weapons\icons\m576_buckshot_ca.paa";
    };

    class rhs_mag_M585_white;
    class TB_rhs_mag_M585_white : rhs_mag_M585_white // White Flare
    {
        ammo = "TB_rhsusf_40mm_white";
        author = "TBMod";

        descriptionShort = "Type: TB White Flare Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm White Flare Grenade Round";
        displaynameshort = "TB White Flare Grenade";

        mass = 3; // 5.06
    };

    class rhs_mag_m661_green;
    class TB_rhs_mag_m661_green : rhs_mag_m661_green // Green Flare
    {
        ammo = "TB_rhsusf_40mm_green";
        author = "TBMod";

        descriptionShort = "Type: TB Green Flare Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm Green Flare Grenade Round";
        displaynameshort = "TB Green Flare Grenade";

        mass = 3; // 5.06
    };

    class rhs_mag_m662_red;
    class TB_rhs_mag_m662_red : rhs_mag_m662_red // Red Flare
    {
        ammo = "TB_rhsusf_40mm_red";
        author = "TBMod";

        descriptionShort = "Type: TB Red Flare Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm Red Flare Grenade Round";
        displaynameshort = "TB Red Flare Grenade";

        mass = 3; // 5.06
    };

    class 2Rnd_155mm_Mo_Cluster;
    class magazine_ShipCannon_120mm_HE_cluster_shells_x2 : 2Rnd_155mm_Mo_Cluster // Mk45 Hammer HE Cluster
    {
        count = 18; // 2
    };

    class 6Rnd_155mm_Mo_mine;
    class magazine_ShipCannon_120mm_mine_shells_x6 : 6Rnd_155mm_Mo_mine // Mk45 Hammer HE Minen Cluster
    {
        count = 18; // 6
    };

    class 6Rnd_155mm_Mo_smoke;
    class magazine_ShipCannon_120mm_smoke_shells_x6 : 6Rnd_155mm_Mo_smoke // Mk45 Hammer Rauchwand
    {
        count = 18; // 6
    };

    class 6Rnd_155mm_Mo_AT_mine;
    class magazine_ShipCannon_120mm_AT_mine_shells_x6 : 6Rnd_155mm_Mo_AT_mine // Mk45 Hammer AT Minen Cluster
    {
        count = 18; // 6
    };

    class 2Rnd_155mm_Mo_LG;
    class magazine_ShipCannon_120mm_HE_LG_shells_x2 : 2Rnd_155mm_Mo_LG // Mk45 Hammer AT Laserguided
    {
        count = 18; // 2
    };

    class magazine_Bomb_SDB_x1;
    class PylonRack_Bomb_SDB_x4 : magazine_Bomb_SDB_x1 // SDB x4
    {
        hardpoints[] = {"B_SDB_QUAD_RAIL","B_BOMB_PYLON","B_GBU12","I_GBU12"}; // "B_SDB_QUAD_RAIL"
        descriptionShort = "[LG]"; // "250lb, high-explosive, infrared/laser-guided bomb"
        displayName = "4x SDB [LG]"; // "GBU SDB x4"
        displayNameShort = "[LG]"; // "Bomb"
    };

    class rhs_mag_agm65;
    class rhs_mag_agm65h : rhs_mag_agm65 // AGM-65H CCD
    {
        hardpoints[] = {"B_BOMB_PYLON","RHS_HP_AGM65","B_GBU12","I_GBU12"}; // "RHS_HP_AGM65","RHS_HP_AGM65_3x"

        descriptionShort = "[AS]"; // n.a
        displayName = "AGM-65 CCD [GUID]"; // "AGM-65H"
        displayNameShort = "[AUTOSEEK]"; // "TV"
    };

    class 10Rnd_RHS_50BMG_Box;
    class rhsusf_mag_10Rnd_STD_50BMG_M33 : 10Rnd_RHS_50BMG_Box // 50.cal Long-Range Sniper
    {
        author = "TBMod";
        descriptionShort = ".50Cal LRS"; // "10RD .50BMG M33 Ball M107 Magazine"
        displayName = ".50Cal Long-Range Sniper Magazine"; // "10rnd M107 M33"
        displayNameShort = ".50Cal LRS"; // "M33 Ball"

        mass = 17; // 41.14
        tracersEvery = 1; // 0
    };

    class rhsusf_mag_10Rnd_STD_50BMG_mk211 : rhsusf_mag_10Rnd_STD_50BMG_M33 // 50.cal HEIAP-T (High-Explosive Incendiary/Armor-Piercing Ammunition Tracer)
    {
        author = "TBMod";
        descriptionShort = ".50Cal HEIAP-T Magazine"; // "10RD .50BMG Mk 211 HEIAP M107 Magazine"
        displayName = "High-Explosive Incendiary/Armor-Piercing Ammunition Tracer"; // "10rnd M107 M33"
        displayNameShort = ".50Cal HEIAP-T"; // "M33 Ball"

        mass = 28; // 41.14
    };

    class rhs_mag_20Rnd_SCAR_762x51_mk316_special;
    class rhs_mag_20Rnd_SCAR_762x51_mk316_special_LRS : rhs_mag_20Rnd_SCAR_762x51_mk316_special // 7.62mm Long-Range Sniper
    {
        ammo = "rhs_ammo_762x51_M118_Special_Ball_LRS";
        author = "TBMod";
        descriptionShort = "7.62mm LRS"; // "Caliber: 7.62x51mm NATO (M993 AP)<br />Rounds: 20"
        displayName = "7.62mm Long-Range Sniper Magazine"; // "7.62mm 20Rnd Mag (M993 AP)"
        displayNameShort = "7.62mm LRS"; // "7.62mm AP"

        mass = 14; // 16.24
    };

    class rhs_mag_20Rnd_SCAR_762x51_m80_ball;
    class rhs_mag_20Rnd_SCAR_762x51_m80a1_epr : rhs_mag_20Rnd_SCAR_762x51_m80_ball // 7.62mm Subsonic Low Visible
    {
        author = "TBMod";
        descriptionShort = "7.62mm SDLV"; // "Caliber: 7.62x51mm SD<br />Rounds: 20<br />Used in: Mk18 ABR"
        displayName = "7.62mm Subsonic Low Visible Magazine"; // "7.62mm 20Rnd SD Mag"
        displayNameShort = "7.62mm SDLV"; // "7.62mm SD"

        mass = 14; // 16.24
    };

    class VehicleMagazine;
    class magazine_Missile_HARM_x1 : VehicleMagazine // AGM-88 HARM
    {
        descriptionShort = "Anti-Radar [SEAD]"; // "Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead"
        displayName = "AGM-88 [SEAD]"; // "AGM-88C HARM x1"
        displayNameShort = "Anti-Radar [SEAD]"; // "ARM"
    };

    class 2Rnd_Mk82;
    class PylonMissile_1Rnd_Mk82_F : 2Rnd_Mk82 // Mk-82
    {
        displayName = "HE Airburst Bomb"; // "Mk82"
        displayNameShort = "Unguided"; // "Bomb"
    };

    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F : VehicleMagazine // A-10 GAU-8
    {
        muzzleImpulseFactor[] = {0,5.1};
    };

    class magazine_Bomb_GBU12_x1;
    class PylonMissile_Bomb_GBU12_x1 : magazine_Bomb_GBU12_x1 // GBU-12 HE F/A-18 Version - überflüssig/irritierend
    {
        hardpoints[] = {""}; // "B_GBU12","I_GBU12"
    };

    class 4Rnd_Bomb_04_F;
    class PylonMissile_1Rnd_Bomb_04_F : 4Rnd_Bomb_04_F // GBU-12 HE
    {
        descriptionShort = "[LG]"; // "500lb, high-explosive, laser-guided bomb"
        displayName = "HE Bomb [LG]"; // "GBU-12"
        displayNameShort = "[LG]"; // "Bomb"
        hardpoints[] = {"B_BOMB_PYLON","B_GBU12","I_GBU12"}; // "B_BOMB_PYLON"
    };

    class PylonMissile_1Rnd_BombCluster_01_F : PylonMissile_1Rnd_Bomb_04_F // CBU-85 HE Mines Cluster
    {
        descriptionShort = "[LG]"; // "750lb, laser-guided cluster bomb"
        displayName = "HE-Mines Cluster [LG]"; // "CBU-85 Cluster x1"
        displayNameShort = "[LG]"; // "Cluster Bomb"
    };

    class PylonMissile_1Rnd_BombCluster_02_F : PylonMissile_1Rnd_BombCluster_01_F // RBK-500F AT Mines Cluster
    {
        descriptionShort = "[LG]"; // "500lb, high-explosive, laser-guided bomb"
        displayName = "AT-Mines Cluster [LG]"; // "GBU-12"
        displayNameShort = "[LG]"; // "Bomb"
        hardpoints[] = {"B_BOMB_PYLON","B_GBU12","I_GBU12"}; // "O_BOMB_PYLON_HELI"
        mass = 340; // 470
    };

    class PylonMissile_1Rnd_BombCluster_03_F : PylonMissile_1Rnd_BombCluster_01_F // BL-778 HE Cluster
    {
        descriptionShort = "[LG]"; // "580lb, laser-guided cluster bomb"
        displayName = "HE Cluster [LG]"; // "BL778 Cluster x1"
        displayNameShort = "[LG]"; // "Cluster Bomb"
    };

    class rhs_mag_gau19_air_base;
    class rhsusf_mag_gau19_melb_left : rhs_mag_gau19_air_base // AH-6 12.7x99mm Left
    {
        hardpoints[] = {"RHS_HP_MELB_L","RHS_HP_MELB_M134"}; // "RHS_HP_MELB_L"
        displayname = "12.7x99mm SLAP Left"; // "12.7x99mm SLAP"
    };

    class rhsusf_mag_gau19_melb_right : rhs_mag_gau19_air_base // AH-6 12.7x99mm Right
    {
        hardpoints[] = {"RHS_HP_MELB_R","RHS_HP_MELB_M134"}; // "RHS_HP_MELB_R"
        displayname = "12.7x99mm SLAP Right"; // "12.7x99mm SLAP"
    };

    class 6Rnd_ACE_Hellfire_AGM114K;
    class PylonRack_1Rnd_ACE_Hellfire_AGM114K : 6Rnd_ACE_Hellfire_AGM114K // AH-6 AGM-114K
    {
        hardpoints[] = {"RHS_HP_MELB_M134","B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB","RHS_HP_FFAR_USMC"}; // "B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"
    };

    class PylonRack_3Rnd_ACE_Hellfire_AGM114K : 6Rnd_ACE_Hellfire_AGM114K // AH-6 AGM-114K 3x
    {
        hardpoints[] = {"RHS_HP_MELB_M134","B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK","RHS_HP_FFAR_USMC"}; // "B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"
    };

    class PylonRack_1Rnd_ACE_Hellfire_AGM114N : PylonRack_1Rnd_ACE_Hellfire_AGM114K // AH-6 AGM-114N
    {
        hardpoints[] = {"RHS_HP_MELB_M134","B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB","RHS_HP_FFAR_USMC"}; // "B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"
    };

    class PylonRack_3Rnd_ACE_Hellfire_AGM114N : PylonRack_3Rnd_ACE_Hellfire_AGM114K // AH-6 AGM-114N 3x
    {
        hardpoints[] = {"RHS_HP_MELB_M134","B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK","RHS_HP_FFAR_USMC"}; // "B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"
    };

    class rhs_mag_ATAS_2 : VehicleMagazine // ATAS
    {
        hardpoints[] = {"RHS_HP_ATAS","RHS_HP_MELB","RHS_HP_MELB_L","RHS_HP_FFAR_USMC"}; // "RHS_HP_ATAS","RHS_HP_MELB","RHS_HP_MELB_L"
    };

    class rhs_mag_smaw_HEAA : CA_LauncherMagazine // Mk.6 HEAA SMAW
    {
        mass = 88.16; // 136.4
    };

    class rhs_mag_smaw_HEDP : CA_LauncherMagazine // Mk.3 HEDP SMAW
    {
        mass = 49.59; // 129.8
    };

    class rhs_mag_maaws_HEAT : CA_LauncherMagazine // FFV751 HEAT MAAWS
    {
        mass = 126.73; // 88.2
    };

    class rhs_mag_maaws_HEDP : CA_LauncherMagazine // FFV502 HEDP MAAWS
    {
        initSpeed = 290; // 230
        mass = 88.16; // 72.77
    };

    class rhs_mag_maaws_HE : CA_LauncherMagazine // FFV441 HE MAAWS
    {
        initSpeed = 290; // 255
        mass = 44.08; // 68.36
    };

    class Titan_AA;
    class rhs_fim92_mag : Titan_AA // FIM-92F Stinger
    {
        mass = 60.61; // 120
    };

    class rhs_m136_mag;
    class rhs_m136_CS_mag : rhs_m136_mag // M136 HEAT (CS)
    {
        descriptionshort = "Type: HEAT Confined Spaces"; // "Type: High Explosive Anti Tank"
        displayName = "M136 HEAT (CS)"; // "M136 HEAT"
    };

    class rhs_m136_hedp_mag;
    class rhs_m72a7_mag : rhs_m136_hedp_mag // M72A7
    {
        descriptionshort = "Type: High Explosive"; // "Type: High Explosive, Dual Purpose"
        displayName = "M72E10 (HE)"; // "M72 HEDP"
    };

    class 1Rnd_HE_Grenade_shell;
    class ACE_HuntIR_M203 : 1Rnd_HE_Grenade_shell // HuntIR
    {
        initSpeed = 160; // 80
    };

    class rhsusf_100Rnd_556x45_M855_soft_pouch;
    class rhsusf_200Rnd_556x45_M855_soft_pouch : rhsusf_100Rnd_556x45_M855_soft_pouch // 200rnd M249 Softpack M855
    {
        displayname = "200rnd 5.56x45mm"; // "200rnd M249 Box M855"
        displaynameshort = "200rnd M249"; // "M855"
    };

    class rhsusf_200Rnd_556x45_M855_mixed_soft_pouch : rhsusf_200Rnd_556x45_M855_soft_pouch // 200rnd M249 Softpack M855 Tracer
    {
        ammo = "rhs_ammo_556x45_M855_Ball_Red"; // "rhs_ammo_556x45_M855A1_Ball_Red"
        displayname = "200rnd 5.56x45mm (Tracer)"; // "200rnd M249 Box M855 (Mixed)"
        displaynameshort = "200rnd (Tracer)"; // "M855 (Mixed)"
    };

    class rhsusf_50Rnd_762x51_m61_ap;
    class rhsusf_100Rnd_762x51_m61_ap : rhsusf_50Rnd_762x51_m61_ap // 100rnd M240 Box M61 AP
    {
        tracersEvery = 0; // 5
    };

    class rhsusf_50Rnd_762x51_m62_tracer;
    class rhsusf_100Rnd_762x51_m62_tracer : rhsusf_50Rnd_762x51_m62_tracer // 100rnd M240 Box M62 AP Tracer
    {
        displayname = "100rnd M62 AP (Tracer)"; // "100rnd M240 Box M62 (Tracer)"
        displayNameShort = "M62 AP Tracer"; // "M62 Tracer"
        tracersEvery = 1; // 5
    };

    class CA_Magazine;
    class SatchelCharge_Remote_Mag : CA_Magazine // M183 Demolition Charge Assembly
    {
        mass = 66.12; // 80
        indirectHitRange = 14; // 5
    };

    class DemoCharge_Remote_Mag : SatchelCharge_Remote_Mag // M112 Demolition Block
    {
        mass = 11.02; // 20
    };

    class ATMine_Range_Mag;
    class SLAMDirectionalMine_Wire_Mag : SatchelCharge_Remote_Mag // M4A1 SLAM
    {
        mass = 22.04; // 20
    };

    class AMP_Breaching_Charge_Mag : SLAMDirectionalMine_Wire_Mag // Breaching Charge
    {
        mass = 8.82; // 10
    };

    class APERSMineDispenser_Mag : SLAMDirectionalMine_Wire_Mag // APERS Mine Dispenser
    {
        mass = 77.14; // 60
    };


    class ClaymoreDirectionalMine_Remote_Mag : CA_Magazine // Claymore
    {
        mass = 22.04; // 20
    };

};
