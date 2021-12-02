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

    class rhs_mag_agm65;
    class rhs_mag_agm65b : rhs_mag_agm65
    {
        hardpoints[] = {"B_BOMB_PYLON","RHS_HP_AGM65","B_GBU12","I_GBU12"}; // "RHS_HP_AGM65","RHS_HP_AGM65_3x"
    };

    class rhs_mag_agm65d : rhs_mag_agm65
    {
        hardpoints[] = {"B_BOMB_PYLON","RHS_HP_AGM65","B_GBU12","I_GBU12"}; // "RHS_HP_AGM65","RHS_HP_AGM65_3x"
    };

    class rhs_mag_agm65e : rhs_mag_agm65
    {
        hardpoints[] = {"B_BOMB_PYLON","RHS_HP_AGM65","B_GBU12","I_GBU12"}; // "RHS_HP_AGM65","RHS_HP_AGM65_3x"
    };

    class rhs_mag_agm65f : rhs_mag_agm65
    {
        hardpoints[] = {"B_BOMB_PYLON","RHS_HP_AGM65","B_GBU12","I_GBU12"}; // "RHS_HP_AGM65","RHS_HP_AGM65_3x"
    };

    class rhs_mag_agm65h : rhs_mag_agm65 // AGM-65H CCD
    {
        hardpoints[] = {"B_BOMB_PYLON","RHS_HP_AGM65","B_GBU12","I_GBU12"}; // "RHS_HP_AGM65","RHS_HP_AGM65_3x"

        descriptionShort = "[AS]"; // n.a
        displayName = "AGM-65 CCD [GUID]"; // "AGM-65H"
        displayNameShort = "[AUTOSEEK]"; // "TV"
    };

    class TB_mag_MPR_10Rnd_Slug : rhsusf_8Rnd_Slug  // MPR Slugshot
    {
        ammo = "TB_ammo_MPR_Slug";
        author = "TBMod";
        count = 10;
        descriptionShort = "20-Gauge Slugshot<br />Rounds: 10<br />Used in: MPR";
        displayName = "10Rnd Slugshot";
        displayNameShort = "10Rnd Slugshot";
        mass = 14;
        picture = "\a3\Weapons_F_Enoch\MagazineProxies\data\UI\icon_6Rnd_12Gauge_Slug_ca.paa";
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

    class rhsusf_mag_17Rnd_9x19_FMJ;
    class TB_mag_33Rnd_9x19_FMJ : rhsusf_mag_17Rnd_9x19_FMJ
    {
        count = 33;
        descriptionShort = "Caliber: 9x19mm Parabellum<br/>Rounds: 33<br/>Used in: Glock 18";
        displayName = "33rnd Glock M882 FMJ";
        mass = 11.63;
    };

    class rhsusf_mag_17Rnd_9x19_JHP;
    class TB_mag_33Rnd_9x19_JHP : rhsusf_mag_17Rnd_9x19_JHP
    {
        count = 33;
        descriptionShort = "Caliber: 9x19mm Parabellum<br/>Rounds: 33<br/>Used in: Glock 18";
        displayName = "33rnd Glock M882 JHP";
        mass = 11.63;
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

    class rhs_mag_m134_pylon_base;
    class rhs_mag_m134_pylon_3000 : rhs_mag_m134_pylon_base // AH-6 7.62mm Minigun
    {
        tracersEvery = 1; // 3
    };

    class VehicleMagazine;
    class rhs_mag_ATAS_2 : VehicleMagazine // ATAS
    {
        hardpoints[] = {"RHS_HP_ATAS","RHS_HP_MELB","RHS_HP_MELB_L","RHS_HP_FFAR_USMC"}; // "RHS_HP_ATAS","RHS_HP_MELB","RHS_HP_MELB_L"
    };

    class 24Rnd_PG_missiles;
    class rhs_mag_DAGR_4 : 24Rnd_PG_missiles // 4x DAGR RHS
    {
        descriptionShort = "DAGR 4x"; // "SALH"
        displayName = "DAGR x4"; // "DAGR"
        displayNameShort = "DAGR 4x"; // "SALH"
        hardpoints[] = {"RHS_HP_HELLFIRE_SINGLE","RHS_HP_MELB_M134","RHS_HP_MELB","RHS_HP_MELB_L","RHS_HP_FFAR_USMC","B_MISSILE_PYLON"}; // "RHS_HP_HELLFIRE_SINGLE"
    };

    class rhs_mag_DAGR_8 : rhs_mag_DAGR_4 // 8x DAGR RHS
    {
        descriptionShort = "DAGR 8x"; // "SALH"
        displayName = "DAGR x8"; // "DAGR (M310)"
        displayNameShort = "DAGR 8x"; // "SALH"
        hardpoints[] = {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB","RHS_HP_FFAR_USMC","B_MISSILE_PYLON"}; // "RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"
    };

    class rhs_mag_DAGR_16 : rhs_mag_DAGR_8 // 16x DAGR RHS
    {
        descriptionShort = "DAGR 16x"; // "SALH"
        displayName = "DAGR x16"; // "DAGR (M299)"
        displayNameShort = "DAGR 16x"; //"SALH"
        hardpoints[] = {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","B_MISSILE_PYLON"}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK"}
    };

    class rhs_mag_Sidewinder_2;
    class rhs_mag_aim9m_2 : rhs_mag_Sidewinder_2 // AIM-9
    {
        hardpoints[] = {"RHS_HP_AIM9_2x","TB_Pylon_MQ_9_Sky_Guardian"}; // "RHS_HP_AIM9_2x"
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

    class rhsusf_100Rnd_556x45_M855_soft_pouch;
    class rhsusf_200Rnd_556x45_M855_soft_pouch : rhsusf_100Rnd_556x45_M855_soft_pouch // 200rnd M249 Softpack M855
    {
        displayname = "200rnd 5.56x45mm"; // "200rnd M249 Box M855"
        displaynameshort = "200rnd M249"; // "M855"
        lastRoundsTracer = 10;
    };

    class rhsusf_200Rnd_556x45_M855_mixed_soft_pouch : rhsusf_200Rnd_556x45_M855_soft_pouch // 200rnd M249 Softpack M855 Tracer
    {
        ammo = "rhs_ammo_556x45_M855_Ball_Red"; // "rhs_ammo_556x45_M855A1_Ball_Red"
        displayname = "200rnd 5.56x45mm (Tracer)"; // "200rnd M249 Box M855 (Mixed)"
        displaynameshort = "200rnd (Tracer)"; // "M855 (Mixed)"
        lastRoundsTracer = 10; // 0
    };

    class rhsusf_50Rnd_762x51_m61_ap;
    class rhsusf_100Rnd_762x51_m61_ap : rhsusf_50Rnd_762x51_m61_ap // 100rnd M240 Box M61 AP
    {
        lastRoundsTracer = 10;
        tracersEvery = 0; // 5
    };

    class rhsusf_50Rnd_762x51_m62_tracer;
    class rhsusf_100Rnd_762x51_m62_tracer : rhsusf_50Rnd_762x51_m62_tracer // 100rnd M240 Box M62 AP Tracer
    {
        displayname = "100rnd M62 AP (Tracer)"; // "100rnd M240 Box M62 (Tracer)"
        displayNameShort = "M62 AP (Tracer)"; // "M62 Tracer"
        tracersEvery = 5; // 5
        lastRoundsTracer = 10; // 0
    };

    class rhs_mag_100Rnd_556x45_Mk318_cmag;
    class TB_mag_100Rnd_556x45_Mk318_tracer : rhs_mag_100Rnd_556x45_Mk318_cmag // 100Rnd M27IAR Tracer
    {
        displayName = "100rnd Mk318 Mod 1 (Tracer)";
        displaynameshort = "100rnd (Tracer)";
        tracersEvery = 5;
        lastRoundsTracer = 10; // 0
    };

    class TB_mag_100Rnd_556x45_Mk318_dim : TB_mag_100Rnd_556x45_Mk318_tracer // 100Rnd M27IAR DIM
    {
        ammo = "TB_ammo_556x45_Mk318_DIM";
        displayName = "100rnd Mk318 Mod 1 (DIM)";
        displaynameshort = "100rnd (DIM)";
        tracersEvery = 5;
        lastRoundsTracer = 10; // 0
    };

    class 30Rnd_556x45_Stanag;
    class rhs_mag_30Rnd_556x45_M855A1_Stanag : 30Rnd_556x45_Stanag // 30Rnd STANAG M855A1 alle Magazine
    {
        lastRoundsTracer = 5; // 0
    };

    class rhs_mag_30Rnd_556x45_Mk318_SCAR;
    class rhs_mag_30Rnd_556x45_Mk318_SCAR_Pull : rhs_mag_30Rnd_556x45_Mk318_SCAR // Mk16 Standardmunition
    {
        lastRoundsTracer = 5; // 0
    };

    class 6Rnd_ACE_Hellfire_AGM114K;
    class PylonRack_1Rnd_ACE_Hellfire_AGM114K : 6Rnd_ACE_Hellfire_AGM114K // ACE AGM-114K
    {
        hardpoints[] = {"RHS_HP_MELB_M134","RHS_HP_MELB","RHS_HP_FFAR_USMC"}; // "B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"
    };

    class PylonRack_3Rnd_ACE_Hellfire_AGM114K : 6Rnd_ACE_Hellfire_AGM114K // ACE AGM-114K 3x
    {
        hardpoints[] = {"RHS_HP_MELB_M134","RHS_HP_LONGBOW_RACK","RHS_HP_FFAR_USMC"}; // "B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"
    };

    class PylonRack_4Rnd_ACE_Hellfire_AGM114K : 6Rnd_ACE_Hellfire_AGM114K // ACE AGM-114K 4x
    {
        hardpoints[] = {"RHS_HP_LONGBOW_RACK","CUP_NATO_HELO_LARGE","RHS_HP_HELLFIRE_RACK","TB_Pylon_MQ_9_Sky_Guardian"}; // {"UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK"}
    };

    class PylonRack_1Rnd_ACE_Hellfire_AGM114N : PylonRack_1Rnd_ACE_Hellfire_AGM114K // ACE AGM-114N
    {
        hardpoints[] = {"RHS_HP_MELB_M134","RHS_HP_MELB","RHS_HP_FFAR_USMC"}; // "B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"
    };

    class PylonRack_3Rnd_ACE_Hellfire_AGM114N : PylonRack_3Rnd_ACE_Hellfire_AGM114K // ACE AGM-114N 3x
    {
        hardpoints[] = {"RHS_HP_MELB_M134","RHS_HP_LONGBOW_RACK","RHS_HP_FFAR_USMC"}; // "B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"
    };

    class PylonRack_4Rnd_ACE_Hellfire_AGM114N : PylonRack_4Rnd_ACE_Hellfire_AGM114K // ACE AGM-114N 4x
    {
        hardpoints[] = {"RHS_HP_LONGBOW_RACK","CUP_NATO_HELO_LARGE","RHS_HP_HELLFIRE_RACK","TB_Pylon_MQ_9_Sky_Guardian"}; // {"UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK"}
    };

    class PylonRack_1Rnd_ACE_Hellfire_AGM114L : PylonRack_1Rnd_ACE_Hellfire_AGM114K // ACE AGM-114L
    {
        hardpoints[] = {"RHS_HP_MELB_M134","RHS_HP_MELB","RHS_HP_FFAR_USMC","RHS_HP_LONGBOW_RACK","CUP_NATO_HELO_LARGE","RHS_HP_HELLFIRE_RACK"}; // {"B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"}
    };

    class PylonRack_3Rnd_ACE_Hellfire_AGM114L : PylonRack_3Rnd_ACE_Hellfire_AGM114K // ACE AGM-114L 3x
    {
        hardpoints[] = {"RHS_HP_MELB_M134","RHS_HP_MELB","RHS_HP_FFAR_USMC","RHS_HP_LONGBOW_RACK","CUP_NATO_HELO_LARGE","RHS_HP_HELLFIRE_RACK"}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"}
    };

    class PylonRack_4Rnd_ACE_Hellfire_AGM114L : PylonRack_4Rnd_ACE_Hellfire_AGM114K // ACE AGM-114L 4x
    {
        hardpoints[] = {"RHS_HP_LONGBOW_RACK","CUP_NATO_HELO_LARGE","RHS_HP_HELLFIRE_RACK","TB_Pylon_MQ_9_Sky_Guardian"}; // {"UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK"}
    };

    class rhs_mag_AGM114K;
    class rhs_mag_AGM114K_2 : rhs_mag_AGM114K
    {
        hardpoints[] = {}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"}
    };

    class rhs_mag_AGM114K_4 : rhs_mag_AGM114K_2
    {
        hardpoints[] = {}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"}
    };

    class rhs_mag_AGM114M;
    class rhs_mag_AGM114M_2 : rhs_mag_AGM114M
    {
        hardpoints[] = {}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"}
    };

    class rhs_mag_AGM114M_4 : rhs_mag_AGM114M_2
    {
        hardpoints[] = {}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"}
    };

    class rhs_mag_AGM114N;
    class rhs_mag_AGM114N_2 : rhs_mag_AGM114N
    {
        hardpoints[] = {}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"}
    };

    class rhs_mag_AGM114N_4 : rhs_mag_AGM114N_2
    {
        hardpoints[] = {}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"}
    };

    class rhs_mag_AGM114L;
    class rhs_mag_AGM114L_2 : rhs_mag_AGM114L
    {
        hardpoints[] = {}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"}
    };

    class rhs_mag_AGM114L_4 : rhs_mag_AGM114L_2
    {
        hardpoints[] = {}; // {"RHS_HP_HELLFIRE_RACK","RHS_HP_LONGBOW_RACK","RHS_HP_MELB"}
    };
};
