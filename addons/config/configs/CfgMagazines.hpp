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

    class 300Rnd_20mm_shells;
    class PylonWeapon_300Rnd_20mm_shells : 300Rnd_20mm_shells // 20mm Twin Gun
    {
        hardpoints[] = {"B_A143_BUZZARD_CENTER_PYLON","20MM_TWIN_CANNON"}; // "B_A143_BUZZARD_CENTER_PYLON","20MM_TWIN_CANNON"
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
        displayName = "Smoke 40mm";
        displayNameShort = "Smoke 40mm";

        count = 24;
        initSpeed = 241; // 80
    };

    class 6Rnd_45ACP_Cylinder;
    class TB_mag_45_FMJ : 6Rnd_45ACP_Cylinder // 45. FMJ Magazin
    {
        ammo = "TB_45_FMJ";
        displayName = "45. cal FMJ";
        displayNameShort = "45. cal FMJ";
    };
};
