/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgMagazines
{
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

    class VehicleMagazine;
    class magazine_Missile_HARM_x1 : VehicleMagazine // AGM-88 HARM
    {
        descriptionShort = "Anti-Radar [SEAD]"; // "Medium-range, anti-radiation, air-to-surface missile with high-explosive warhead"
        displayName = "AGM-88 [SEAD]"; // "AGM-88C HARM x1"
        displayNameShort = "Anti-Radar [SEAD]"; // "ARM"
    };

    class magazine_Missile_AMRAAM_C_x1;
    class PylonMissile_Missile_AMRAAM_C_x1 : magazine_Missile_AMRAAM_C_x1
    {
        hardpoints[] = {"B_AMRAAM_C","I_AMRAAM_C"};
    };

    class magazine_Missile_AMRAAM_D_x1;
    class PylonMissile_Missile_AMRAAM_D_x1 : magazine_Missile_AMRAAM_D_x1
    {
        hardpoints[] = {"B_AMRAAM_D"};
    };

    class magazine_Missile_BIM9X_x1;
    class PylonMissile_Missile_BIM9X_x1 : magazine_Missile_BIM9X_x1
    {
        hardpoints[] = {"B_BIM9X","I_BIM9X","B_AMRAAM_C","I_AMRAAM_C","B_AMRAAM_D"}; // {"B_BIM9X","I_BIM9X"};
    };

    class 300Rnd_20mm_shells;
    class PylonWeapon_300Rnd_20mm_shells : 300Rnd_20mm_shells // 20mm Twin Gun
    {
        count = 600; // 300
        hardpoints[] = {"B_A143_BUZZARD_CENTER_PYLON","20MM_TWIN_CANNON","RHS_HP_HELLFIRE_RACK","RHS_HP_FFAR_USMC"}; // "B_A143_BUZZARD_CENTER_PYLON","20MM_TWIN_CANNON"
        tracersEvery = 1; // 5
    };

    class 1000Rnd_Gatling_30mm_Plane_CAS_01_F : VehicleMagazine // 30mm Gatling GAU-8
    {
        muzzleImpulseFactor[] = {-0.1,1.8}; // {-0.1,1}
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

    class ace_hot_1_6Rnd;
    class ace_hot_1_PylonRack_1Rnd : ace_hot_1_6Rnd // HOT 1
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"}
    };

    class ace_hot_1_PylonRack_3Rnd : ace_hot_1_6Rnd // HOT 1 x3
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"};
    };

    class ace_hot_1_PylonRack_4Rnd : ace_hot_1_6Rnd // HOT 1 x4
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"};
    };

    class ace_hot_2_6Rnd;
    class ace_hot_2_PylonRack_1Rnd : ace_hot_2_6Rnd // HOT 2
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"}
    };

    class ace_hot_2_PylonRack_3Rnd : ace_hot_2_6Rnd // HOT 2 x3
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"};
    };

    class ace_hot_2_PylonRack_4Rnd : ace_hot_2_6Rnd // HOT 2 x4
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"};
    };

    class ace_hot_2MP_6Rnd;
    class ace_hot_2MP_PylonRack_1Rnd : ace_hot_2MP_6Rnd // HOT 2MP
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"}
    };

    class ace_hot_2MP_PylonRack_3Rnd : ace_hot_2MP_6Rnd // HOT 2MP x3
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"};
    };

    class ace_hot_2MP_PylonRack_4Rnd : ace_hot_2MP_6Rnd // HOT 2MP x4
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"};
    };

    class ace_hot_3_6Rnd;
    class ace_hot_3_PylonRack_1Rnd : ace_hot_3_6Rnd // HOT 3
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","SCALPEL_1RND_EJECTOR","B_ASRRAM_EJECTOR","UNI_SCALPEL","CUP_NATO_HELO_SMALL","CUP_NATO_HELO_LARGE","RHS_HP_MELB"}
    };

    class ace_hot_3_PylonRack_3Rnd : ace_hot_3_6Rnd // HOT 3 x3
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"};
    };

    class ace_hot_3_PylonRack_4Rnd : ace_hot_3_6Rnd // HOT 3 x4
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","UNI_SCALPEL","CUP_NATO_HELO_LARGE","RHS_HP_LONGBOW_RACK"};
    };

    class 24Rnd_PG_missiles;
    class PylonRack_12Rnd_PG_missiles : 24Rnd_PG_missiles // Vanilla DAGR
    {
        hardpoints[] = {}; // {"B_MISSILE_PYLON","DAGR"}
    };

    class 1Rnd_HE_Grenade_shell;
    class ACE_HuntIR_M203 : 1Rnd_HE_Grenade_shell // HuntIR
    {
        initSpeed = 160; // 80
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
    class SLAMDirectionalMine_Wire_Mag : ATMine_Range_Mag // M4A1 SLAM
    {
        mass = 22.04; // 20
    };

    class AMP_Breaching_Charge_Mag : SLAMDirectionalMine_Wire_Mag // Breaching Charge
    {
        mass = 8.82; // 10
    };

    class APERSMineDispenser_Mag : SatchelCharge_Remote_Mag // APERS Mine Dispenser
    {
        mass = 77.14; // 60
    };

    class ClaymoreDirectionalMine_Remote_Mag : CA_Magazine // Claymore
    {
        mass = 22.04; // 20
    };

    class 3Rnd_Smoke_Grenade_shell;
    class 3Rnd_Smoke_Grenade_shell_precise : 3Rnd_Smoke_Grenade_shell
    {
        ammo = "G_40mm_Smoke_precise";
        author = "TBMod";

        displayName = "3-Schuss-AIM-Rauchmunition (weiß)";
        displayNameShort = "Weißer AIM Rauch";
        descriptionShort = "Typ: AIM-Rauchmunition - weiß <br />Patronen: 3<br />Eingesetzt von: 3GL";

        mass = 20; // 12
    };

    class B_IR_Grenade;
    class TB_rhs_mag_40mm_IR_Grenade : B_IR_Grenade // Umbenennung zu TB_40mm_IR_Grenade
    {
        ammo = "TB_rhs_40mm_IR_Grenade";
        author = "TBMod";

        descriptionShort = "TB IR Grenade Round<br />Caliber: 40 mm<br />Rounds: 1<br />Used in: M203, M320, M79";
        displayName = "TB 40mm IR Grenade Round";
        displaynameshort = "TB IR Grenade";

        initSpeed = 80; // 18 (Granate)
        mass = 5; // 8
        picture = "\z\ace\addons\huntir\data\m_m1070_ca.paa";
        tracersEvery = 1; // 0
    };

    class TB_Smoke_Grenades : 3Rnd_Smoke_Grenade_shell
    {
        ammo = "TB_G_40mm_Smoke";
        author = "TBMod";
        displayName = "Smoke 40mm";
        displayNameShort = "Smoke 40mm";

        count = 24;
        initSpeed = 241; // 80
    };

    class 6Rnd_45ACP_Cylinder;
    class TB_mag_45_FMJ : 6Rnd_45ACP_Cylinder // 45. FMJ Magazin
    {
        ammo = "TB_45_FMJ";
        author = "TBMod";
        displayName = "45. cal FMJ";
        displayNameShort = "45. cal FMJ";
    };

    class ACE_10Rnd_338_300gr_HPBT_Mag;
    class TB_mag_10Rnd_338_LS_Tracer : ACE_10Rnd_338_300gr_HPBT_Mag // Lapua Scenar
    {
        ammo = "TB_ammo_338_LS";
        author = "TBMod";
        descriptionShort = "Caliber: 8.6x70mm (250gr Lapua Scenar)<br />Rounds: 10"; // "Caliber: 8.6x70mm (300gr Lapua Scenar)<br />Rounds: 10";
        displayName = ".338 Lapua Scenar Tracer";
        displayNameShort = ".338 Lapua Scenar Tracer";
        mass = 8.816;
        tracersEvery = 1;
    };

    class TB_mag_10Rnd_338_LS_DIM : TB_mag_10Rnd_338_LS_Tracer // Lapua Scenar DIM
    {
        ammo = "TB_ammo_338_LS_DIM";
        displayName = ".338 Lapua Scenar DIM";
        displayNameShort = ".338 Lapua Scenar DIM";
    };

    class TB_mag_100Rnd_338_LS_Tracer : TB_mag_10Rnd_338_LS_Tracer // Lapua Scenar MG
    {
        count = 100;
        descriptionShort = "Caliber: 8.6x70mm (250gr Lapua Scenar)<br />Rounds: 100"; // "Caliber: 8.6x70mm (300gr Lapua Scenar)<br />Rounds: 10"
        mass = 61.712;
        picture = "\A3\Weapons_F_Exp\Data\UI\icon_200Rnd_556x45_Box_Tracer_Red_F_ca.paa";
        tracersEvery = 2;
    };

    class TB_mag_100Rnd_338_LS_DIM : TB_mag_100Rnd_338_LS_Tracer // Lapua Scenar MG DIM
    {
        ammo = "TB_ammo_338_LS_DIM";
        displayName = ".338 Lapua Scenar DIM";
        displayNameShort = ".338 Lapua Scenar DIM";
        picture = "\A3\Weapons_F_Exp\Data\UI\icon_200Rnd_556x45_Box_F_ca.paa";
    };

    class 60Rnd_CMFlare_Chaff_Magazine;
    class TB_mag_CMFlare_Chaff_72Rnd : 60Rnd_CMFlare_Chaff_Magazine // CM Flare Chaff
    {
        ammo = "TB_ammo_CMFlare_Chaff";
        author = "TBMod";
        count = 72;
        descriptionShort = "Wirkung gegen IR/Radar";
        displayName = "Flare/Chaff x72";
        displayNameShort = "Flare/Chaff";
        hardpoints[] = {"TB_cm_dispenser_UH_80_1","TB_cm_dispenser_UH_80_2","TB_cm_dispenser_UH_80_3","TB_cm_dispenser_UH_80_4"};
        initSpeed = 18;
        pylonWeapon = "TB_weap_CMLauncher";
    };

    class TB_mag_CMFlare_Chaff_72Rnd_Burst : TB_mag_CMFlare_Chaff_72Rnd // CM Flare Chaff Burst
    {
        ammo = "TB_ammo_CMFlare_Chaff_Burst";
        descriptionShort = "Wirkung gegen IR/Radar, Feuerstoß";
        displayName = "B Flare/Chaff x72";
        displayNameShort = "B Flare/Chaff";
        pylonWeapon = "TB_weap_CMLauncher_Burst";
    };

    class TB_mag_LWIRCM_144_60 : CA_Magazine // LWIRCM 60
    {
        ammo = "TB_ammo_LWIRCM_60";
        author = "TBMod";
        count = 144;
        descriptionShort = "Wirkung gegen IR, 60 Sekunden";
        displayName = "LWIRCM x144/60";
        displayNameShort = "LWIRCM";
        hardpoints[] = {"TB_cm_dispenser_UH_80_1","TB_cm_dispenser_UH_80_2","TB_cm_dispenser_UH_80_3","TB_cm_dispenser_UH_80_4"};
        initSpeed = 1;
        pylonWeapon = "TB_weap_LWIRCM_144_60";
    };

    class TB_mag_LWIRCM_144_45 : TB_mag_LWIRCM_144_60 // LWIRCM 45
    {
        ammo = "TB_ammo_LWIRCM_45";
        descriptionShort = "Wirkung gegen IR, 45 Sekunden";
        displayName = "LWIRCM x144/45";
        pylonWeapon = "TB_weap_LWIRCM_144_45";
    };

    class TB_mag_LWIRCM_144_30 : TB_mag_LWIRCM_144_60 // LWIRCM 30
    {
        ammo = "TB_ammo_LWIRCM_30";
        descriptionShort = "Wirkung gegen IR, 30 Sekunden";
        displayName = "LWIRCM x144/30";
        pylonWeapon = "TB_weap_LWIRCM_144_30";
    };
};