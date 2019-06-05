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
        mass = 176.37; // 286.88
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
        displayName = "AT Laser Guided"; // "Laser Guided"
        displayNameMFDFormat = "AT LASER GUID"; // "LASER GUID"
        displayNameShort = "AT Laser Guided"; // "155mm Laser Guided"
    };

    class magazine_Bomb_SDB_x1;
    class PylonRack_Bomb_SDB_x4 : magazine_Bomb_SDB_x1 // SDB x4 
    {
        hardpoints[] = {"B_SDB_QUAD_RAIL","B_BOMB_PYLON"}; // "B_SDB_QUAD_RAIL"
    };

    class 4Rnd_Bomb_04_F;
    class PylonMissile_1Rnd_Bomb_04_F : 4Rnd_Bomb_04_F // GBU-12 HE
    {
        descriptionShort = "227kg LG HE Bomb"; // "500lb, high-explosive, laser-guided bomb"
        displayName = "GBU-12 LG HE"; // "GBU-12"
        displayNameShort = "LG HE Bomb"; // "Bomb"
        model = "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_02_F.p3d"; // "\A3\Weapons_F\DynamicLoadout\PylonMissile_1x_Bomb_04_F.p3d"
    };

    class PylonMissile_1Rnd_BombCluster_01_F;
    class PylonMissile_1Rnd_BombCluster_02_F : PylonMissile_1Rnd_BombCluster_01_F // CBU-85 Mine Cluster
    {
        hardpoints[] = {"B_BOMB_PYLON"}; // "O_BOMB_PYLON_HELI"

        descriptionShort = "LG AT-Mines Cluster"; // "500lb, high-explosive, laser-guided bomb"
        displayName = "LG AT-Mines Cluster"; // "GBU-12"
        displayNameShort = "LG AT-Mines Cluster"; // "Bomb"
    };

    class rhs_mag_agm65;
    class rhs_mag_agm65b : rhs_mag_agm65 // AGM-65B TV
    {
        hardpoints[] = {"B_BOMB_PYLON","RHS_HP_AGM65"}; // "RHS_HP_AGM65","RHS_HP_AGM65_3x"

        descriptionShort = "AGM-65B TV"; // n.a
        displayName = "AGM-65B TV Autoseek"; // "AGM-65B"
        displayNameShort = "AGM-65B TV"; // "TV"
    };

    class 10Rnd_RHS_50BMG_Box;
    class rhsusf_mag_10Rnd_STD_50BMG_M33 : 10Rnd_RHS_50BMG_Box // 50.cal Anti-Personnel ursprünglich
    {
        descriptionShort = ".50Cal Anti-Materiel Magazine"; // "10RD .50BMG M33 Ball M107 Magazine"
        displayName = ".50Cal Anti-Materiel"; // "10rnd M107 M33"
        displayNameShort = ".50Cal Anti-Materiel"; // "M33 Ball"

        mass = 28; // 41.14
    };

    class rhsusf_mag_10Rnd_STD_50BMG_mk211 : rhsusf_mag_10Rnd_STD_50BMG_M33 // 50.cal Anti-Materiel ursprünglich
    {
        descriptionShort = ".50Cal High Penetration Magazine"; // "10RD .50BMG Mk 211 HEIAP M107 Magazine"
        displayName = ".50Cal High Penetration"; // "10rnd M107 M33"
        displayNameShort = ".50Cal High Penetration"; // "M33 Ball"

        mass = 20; // 41.14
    };

    class rhsusf_mag_6Rnd_M433_HEDP;
    class rhsusf_mag_6Rnd_M714_white : rhsusf_mag_6Rnd_M433_HEDP // M32 Smoke
    {
        ammo = "rhs_40mm_smoke_white_precise"; // "rhs_40mm_smoke_white"

        descriptionShort = "M32 Smoke"; // "Type: Charge<br />Rounds: 1<br />Used on: Ground"
        displayName = "M32 Smoke"; // "M112 Demolition Block"
        displayNameShort = "M32 Smoke"; // n.a

        initSpeed = 480; // 80
        mass = 25; // 30.36
    };

    class rhs_mag_M397_HET;
    class rhsusf_mag_6Rnd_M397_HET : rhs_mag_M397_HET // M32 Airburst
    {
        descriptionShort = "M32 Airburst"; // "Type: High Explosive Timed<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79"
        displayName = "M32 Airburst"; // "6rnd M397 HET Grenades"
        displayNameShort = "M32 Airburst"; // HET Grenade

        initSpeed = 480; // 80
        mass = 25; // 30.36
    };

    class PylonMissile_1Rnd_BombCluster_03_F : PylonMissile_1Rnd_BombCluster_01_F // BL-778 HE Cluster
    {
        descriptionShort = "LG HE Cluster"; // "580lb, laser-guided cluster bomb"
        displayName = "LG HE Cluster"; // "BL778 Cluster x1"
        displayNameShort = "LG HE Cluster"; // "Cluster Bomb"
    };
};
