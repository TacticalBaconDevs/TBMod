/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class Mode_SemiAuto;
class Mode_FullAuto;
class player;

class CfgWeapons
{
    class CannonCore;
    class mortar_155mm_AMOS : CannonCore
    {
        class Mode_Burst;
        class Mode_SemiAuto;
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
        modes[] = {"Single1","Single2","Single3","Single4","Single5","Burst1","Burst2","Burst3","Burst4","Burst5"};
        class Burst1 : Mode_Burst
        {
            aiDispersionCoefX = 1.9;
            aiDispersionCoefY = 2.4;
            aiRateOfFire = 2;
            aiRateOfFireDispersion = 1;
            aiRateOfFireDistance = 500;
            artilleryCharge = 0.18;
            artilleryDispersion = 2.5;
            autoFire = 0;
            burst = 6;
            burstRangeMax = -1;
            canShootInWater = 0;
            dispersion = 0.0005;
            displayName = "Burst (close)";
            ffCount = 1;
            ffFrequency = 11;
            ffMagnitude = 0.5;
            flash = "gunfire";
            flashSize = 0.1;
            maxRange = 2000;
            maxRangeProbab = 0.5;
            midRange = 1500;
            midRangeProbab = 0.7;
            minRange = 800;
            minRangeProbab = 0.5;
            multiplier = 1;
            recoil = "recoil_auto_primary_3outof10";
            recoilProne = "recoil_auto_primary_prone_3outof10";
            reloadSound[] = {"A3\sounds_f\dummysound",1,1,20};
            reloadTime = 3; // 6
            requiredOpticType = -1;
            showToPlayer = 0;
            sound[] = {"",10,1};
            soundBegin[] = {"sound",1};
            soundBeginWater[] = {"sound",1};
            soundBurst = 0;
            soundClosure[] = {"sound",1};
            soundContinuous = 0;
            soundEnd[] = {"sound",1};
            soundLoop[] = {"sound",1};
            sounds[] = {"StandardSound"};
            class StandardSound
            {
                begin1[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_155mm\sochor_155mm_distant",2.51189,1,1500};
                soundBegin[] = {"begin1",1};
            };
            textureType = "burst";
            useAction = 0;
            useActionTitle = "";
            weaponSoundEffect = "";
        };
        class Single1 : Mode_SemiAuto
        {
            aiDispersionCoefX = 1.4;
            aiDispersionCoefY = 1.7;
            aiRateOfFire = 1;
            aiRateOfFireDispersion = 1;
            aiRateOfFireDistance = 10;
            artilleryCharge = 0.18;
            artilleryDispersion = 0.8;
            autoFire = 0;
            burst = 1;
            burstRangeMax = -1;
            canShootInWater = 0;
            dispersion = 0.0002;
            displayName = "Semi (close)";
            multiplier = 1;
            recoil = "recoil_single_primary_3outof10";
            recoilProne = "recoil_single_primary_prone_3outof10";
            reloadSound[] = {"A3\sounds_f\dummysound",1,1,20};
            reloadTime = 1.75; // 8
            requiredOpticType = -1;
            showToPlayer = 1;
            soundBurst = 0;
            soundContinuous = 0;
            sound[] = {"",10,1};
            soundBegin[] = {"sound",1};
            soundBeginWater[] = {"sound",1};
            soundClosure[] = {"sound",1};
            soundEnd[] = {};
            soundLoop[] = {};
            sounds[] = {"StandardSound"};
            class StandardSound
            {
                begin1[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_155mm\sochor_155mm_distant",2.51189,1,1500};
                soundBegin[] = {"begin1",1};
            };
            textureType = "semi";
            useAction = 0;
            useActionTitle = "";
            weaponSoundEffect = "";
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

    class H_HelmetB;
    class H_HelmetB_TI_tna_F : H_HelmetB
    {
        class ItemInfo;
    };
    class TB_headgear_sps_ucp : H_HelmetB_TI_tna_F // SPS Helm UCP
    {
        class ItemInfo : ItemInfo
        {
            class HitpointsProtectionInfo
            {
                class Face
                {
                    armor = 7; // 4
                    hitpointName = "HitFace";
                    passThrough = 0.3; // 0.5
                };
                class Head
                {
                    armor = 9; // 6
                    hitpointName = "HitHead";
                    passThrough = 0.2; // 0.5
                };
            };
            mass = 71.63; // 30
        };
        displayName = "SPS (UCP)";
        picture = "\A3\Characters_F\data\ui\icon_H_Crew_Helmet_Heli_B_CA.paa";
    };

    class TB_headgear_sps_ocp : TB_headgear_sps_ucp // SPS Helm OCP
    {
        displayName = "SPS (OCP)";
    };

    class V_PlateCarrierIA2_dgtl;
    class V_PlateCarrierIAGL_dgtl : V_PlateCarrierIA2_dgtl
    {
        class ItemInfo;
    };
    class TB_vest_sps_ucp_classV : V_PlateCarrierIAGL_dgtl // SPS Schutzweste in UCP Tier 5
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
            containerClass = "Supply160"; // "Supply120"
            mass = 308.56; // 80
        };
        descriptionShort = "Armor Level V D"; // "Sprengstoffresistent"
        displayName = "SPS V D (UCP)"; // "Boden-Luft-Granatwerfer-Tragegurt (Tarnfarbe)"
        //picture = "\rhsusf\addons\rhsusf_inventoryicons\data\vests\rhsusf_spcs_ucp_saw_ca.paa"; // wird in TBMod_rhs gesetzt
    };

    class V_PlateCarrierGL_rgr;
    class V_PlateCarrierGL_mtp : V_PlateCarrierGL_rgr
    {
        class ItemInfo;
    };
    class TB_vest_sps_ocp_classV : V_PlateCarrierGL_mtp // SPS Schutzweste in OCP Tier 5
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
                    passThrough = 0.4; // 0.5
                };
                class Body
                {
                    hitpointName = "HitBody";
                    passThrough = 0.2; // 0.6
                };
                class Chest
                {
                    armor = 39; // 78
                    hitpointName = "HitChest";
                    passThrough = 0.2; // 0.6
                };
                class Diaphragm
                {
                    armor = 39; // 78
                    hitpointName = "HitDiaphragm";
                    passThrough = 0.2; // 0.6
                };
                class Neck
                {
                    armor = 28; // 8
                    hitpointName = "HitNeck";
                    passThrough = 0.4; // 0.5
                };
                class Pelvis
                {
                    armor = 31; // 16
                    hitpointName = "HitPelvis";
                    passThrough = 0.2; // 0.3
                };
            };
            containerClass = "Supply160"; // "Supply140"
            mass = 308.56; // 100
        };
        descriptionShort = "Armor Level V D"; // "Sprengstoffresistent"
        displayName = "SPS V D (OCP)"; // "Carrier GL Rig (MTP)"
    };

    class Vest_Camo_Base;
    class V_PlateCarrier1_blk : Vest_Camo_Base
    {
        class ItemInfo;
    };
    class TB_platecarrier_light_black_classIII : V_PlateCarrier1_blk
    {
        class ItemInfo : ItemInfo
        {
            author = "TBMod";
            containerClass = "Supply170"; // "Supply140"
            mass = 114.608; // 100

            class HitpointsProtectionInfo
            {
                class Abdomen
                {
                    armor = 22.5; // 16
                    hitpointName = "HitAbdomen";
                    passThrough = 0.2; // 0.3
                };
                class Body
                {
                    hitpointName = "HitBody";
                    passThrough = 0.2; // 0.3
                };
                class Chest
                {
                    armor = 22.5; // 16
                    hitpointName = "HitChest";
                    passThrough = 0.2; // 0.3
                };
                class Diaphragm
                {
                    armor = 22.5; // 16
                    hitpointName = "HitDiaphragm";
                    passThrough = 0.2; // 0.3
                };
            };
        };
        descriptionShort = "Armor Level III B"; // "Armor Level III"
        displayName = "Platecarrier III B"; // "Carrier Lite (Black)"
    };

    class Vest_NoCamo_Base;
    class V_TacVestIR_blk : Vest_NoCamo_Base
    {
        class ItemInfo;
    };
    class TB_vest_tactical_black_classII : V_TacVestIR_blk
    {
        class ItemInfo : ItemInfo
        {
            author = "TBMod";
            containerClass = "Supply120"; // "Supply140"
            mass = 35.264; // 50

            class HitpointsProtectionInfo
            {
                class Abdomen
                {
                    armor = 8;
                    hitpointName = "HitAbdomen";
                    passThrough = 0.6; // 0.5
                };
                class Body
                {
                    hitpointName = "HitBody";
                    passThrough = 0.2; // 0.5
                };
                class Chest
                {
                    armor = 8;
                    hitpointName = "HitChest";
                    passThrough = 0.2; // 0.5
                };
                class Diaphragm
                {
                    armor = 8;
                    hitpointName = "HitDiaphragm";
                    passThrough = 0.2; // 0.5
                };
            };
        };
        descriptionShort = "Armor Level II B";
        displayName = "Tactical Vest II B";
    };

    class V_EOD_base_F;
    class V_EOD_olive_F : V_EOD_base_F
    {
        class ItemInfo;
    };
    class TB_vest_bomb_suit : V_EOD_olive_F // EOD Bomb Suit Vest
    {
        class ItemInfo : ItemInfo
        {
            class HitpointsProtectionInfo
            {
                class Body
                {
                    hitpointName = "HitBody";
                    passThrough = 0.1;
                };
                class Abdomen
                {
                    armor = 31;
                    explosionShielding = 0.7;
                    hitpointName = "HitAbdomen";
                    passThrough = 0.5;
                };
                class Chest
                {
                    armor = 31;
                    explosionShielding = 0.7;
                    hitpointName = "HitChest";
                    passThrough = 0.5;
                };
                class Diaphragm
                {
                    armor = 31;
                    explosionShielding = 0.7;
                    hitpointName = "HitDiaphragm";
                    passThrough = 0.5;
                };
                class Pelvis
                {
                    armor = 31;
                    explosionShielding = 0.7;
                    hitpointName = "HitPelvis";
                    passThrough = 0.5;
                };
                class Neck
                {
                    armor = 5;
                    explosionShielding = 0.8;
                    hitpointName = "HitNeck";
                    passThrough = 0.9;
                };
                class Legs
                {
                    armor = 5;
                    explosionShielding = 0.8;
                    hitpointName = "HitLegs";
                    passThrough = 0.9;
                };
                class Arms
                {
                    armor = 5;
                    explosionShielding = 0.8;
                    hitpointName = "HitArms";
                    passThrough = 0.9;
                };
                class Hands
                {
                    armor = 0;
                    explosionShielding = 1.1;
                    hitpointName = "HitHands";
                    passThrough = 1.1;
                };
            };
            containerClass = "Supply0";
            mass = 661.2;
        };
        author = "TBMod";
        descriptionShort = "Armor Level IV E";
        displayName = "Bomb Suit Vest IV E";
    };

    class Uniform_Base;
    class U_B_HeliPilotCoveralls : Uniform_Base
    {
        class ItemInfo;
    };
    class TB_uniform_bomb_suit : U_B_HeliPilotCoveralls // EOD Bomb Suit Uniform
    {
        ACE_GForceCoef = 0;
        author = "TBMod";
        displayName = "Bomb Suit";

        class ItemInfo : ItemInfo
        {
            containerClass = "Supply120";
            mass = 154.28;
            scope = 2;
        };
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

    class ACE_NVG_Wide;
    class TB_NVG_widescreen : ACE_NVG_Wide
    {
        author = "TBMod";
        descriptionShort = "NVG Wide (Permission for use needed)";
        displayName = "NVG Wide (Permission for use needed)";
    };

    class DetectorCore;
    class MineDetector : DetectorCore
    {
        class ItemInfo;
    };
    class TB_MineDetector : MineDetector
    {
        author = "TBMod";
        detectRange = 5;
        displayName = "Minensonde";

        class ItemInfo : ItemInfo
        {
            mass = 66.12;
        };
    };

    class LMG_03_base_F;
    class LMG_03_F : LMG_03_base_F
    {
        class close;
        class FullAutoSLow;
        class WeaponSlotsInfo;
    };
    class TB_weap_Mk48 : LMG_03_F // Mk48 Mod 2
    {
        aimTransitionSpeed = 0.32; // 0.5
        author = "TBMod";
        baseWeapon = "TB_weap_Mk48";
        descriptionShort = "Medium Machine Gun<br />Caliber: 8.6x70 mm";
        displayName = "Mk48 Mod 2";
        magazines[] = {"TB_mag_100Rnd_338_LS_Tracer"};
        magazineWell[] = {"TB_magwell_100Rnd_338"};
        modes[] = {"FullAutoLow","FullAutoHigh","close","short","medium","far_optic1","far_optic2"};
        recoil = "TB_recoil_mk48";
        class short : close
        {
            dispersion = 0.00073;
            reloadTime = 0.3;
            showToPlayer = 0;
        };
        class FullAutoLow : FullAutoSLow
        {
            dispersion = 0.00073;
            multiplier = 1;
            reloadTime = 0.3;
            textureType = "burst";
        };
        class FullAutoHigh : FullAutoLow
        {
            dispersion = 0.00073;
            multiplier = 1;
            reloadTime = 0.15;
            textureType = "fullAuto";
        };
        class WeaponSlotsInfo : WeaponSlotsInfo
        {
            mass = 200.564;
        };
    };

    class Pistol_Base_F;
    class hgun_Pistol_heavy_02_F : Pistol_Base_F
    {
        class Single;
    };
    class TB_weapon_rhino60 : hgun_Pistol_heavy_02_F // .500 Revolver
    {
        author = "TBMod";
        baseWeapon = "TB_weapon_rhino60";
        descriptionShort = "Tactical Revolver<br />Caliber: .500 FMJ";
        displayName = "Rhino 60";
        magazines[] = {"TB_mag_6Rnd_500_FMJ"};
        magazineWell[] = {"TB_magwell_6Rnd_500_FMJ"};
        modes[] = {"manual"};

        class manual : Single
        {
            sounds[] = {"StandardSound"};
            class BaseSoundModeType;
            class StandardSound: BaseSoundModeType
            {
                soundsetshot[] = {"GM6Lynx_Shot_SoundSet","GM6Lynx_Tail_SoundSet","GM6Lynx_InteriorTail_SoundSet"};
            };
        };
    };

    class srifle_DMR_02_F;
    class TB_weapon_338_noreen : srifle_DMR_02_F // Noreen "Bad News" ULR
    {
        magazines[] = {"TB_mag_10Rnd_338_LS_Tracer"}; // {"10Rnd_338_Mag"}
        magazineWell[] = {"TB_magwell_10Rnd_338"}; // {"MAR10_338"}
    };

    class hgun_ACPC2_F;
    class TB_FN_Five_Seven : hgun_ACPC2_F // 5.7mm FN Five-Seven Pistole
    {
        author = "TBMod";
        baseWeapon = "TB_FN_Five_Seven";
        descriptionShort = "Handgun<br />Caliber: 5.7x28mm"; // "Handgun<br />Caliber: .45 ACP"
        displayName = "FN Five-Seven";
        magazines[] = {"TB_20Rnd_570x28"};
        magazineWell[] = {"TB_magwell_20Rnd_570x28"};
    };

    class Rifle_Base_F;
    class arifle_ARX_base_F : Rifle_Base_F
    {
        canShootInWater = 1; // 0
        magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG"}; // {"30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_green_mag_Tracer"};
        magazineWell[] = {"STANAG_556x45","CBA_556x45_STANAG"}; // {"Katiba_65x39","CBA_65x39_Katiba"};
        modes[] = {"FullAuto","Single","single_medium_optics1","single_far_optics2","fullauto_medium"};
        class Single : Mode_SemiAuto
        {
            dispersion = 0.00116;
            textureType = "burst";
        };
        class FullAuto : Mode_FullAuto
        {
            autoFire = 1;
            burst = 1;
            dispersion = 0.00116;
            reloadTime = 0.067;
            textureType = "fullAuto";
        };
        class Secondary : Rifle_Base_F
        {
            canShootInWater = 1;
            magazines[] = {"TB_mag_10Rnd_50BW_Mag_F"};
            magazineWell[] = {"TB_magwell_MPR"};
            modes[] = {"Single"};
            class Single : Mode_SemiAuto
            {
                reloadTime = 0.15; // 0.3
                dispersion = 0.00145;
            };
        };
    };
    class arifle_ARX_blk_F : arifle_ARX_base_F {};
    class TB_weapon_MPR : arifle_ARX_blk_F // Multi Purpose Rifle
    {
        author = "TBMod";
        baseWeapon = "TB_weapon_MPR"; // "arifle_ARX_blk_F"
        descriptionShort = "Multi Purpose Rifle<br />Caliber: 5.56mm / 12.7mm"; // "Sturmgewehr<br />Kaliber: 6,5x39 mm / 0,50 BW"
        displayName = "MPR"; // "Typ 115 6,5 mm (Schwarz)"
    };

    class LMG_RCWS;
    class LMG_Minigun : LMG_RCWS
    {
        class manual;
    };
    class LMG_Minigun_Transport : LMG_Minigun // M134 Minigun UH-80 links
    {
        modes[] = {"manual","close","short","medium","far"};
        class manual : manual
        {
            dispersion = 0.0049;
            multiplier = 1; // 3
            reloadTime = 0.015; // 0.075
        };
    };
    class LMG_Minigun_Transport2 : LMG_Minigun_Transport // M134 Minigun UH-80 rechts
    {
        modes[] = {"manual","close","short","medium","far"};
        class manual : manual
        {
            dispersion = 0.0049;
            multiplier = 1; // 3
            reloadTime = 0.015; // 0.075
        };
    };

    class cannon_105mm : CannonCore
    {
        class player;
    };
    class cannon_105mm_VTOL_01 : cannon_105mm // Gunship 105mm
    {
        class player : player
        {
            reloadTime = 1.5; // 5
        };
    };

    class gatling_20mm : CannonCore
    {
        class manual;
    };
    class gatling_20mm_VTOL_01 : gatling_20mm // Gunship 20mm
    {
        class manual : manual
        {
            reloadTime = 0.01; // 0.03
        };
    };

    class autocannon_Base_F;
    class autocannon_40mm_CTWS : autocannon_Base_F
    {
        class Mode_FullAuto;
        class AP : autocannon_Base_F
        {
            class player;
        };
        class HE : autocannon_Base_F
        {
            class player;
        };
    };
    class TB_weapon_40mm_CTWS : autocannon_40mm_CTWS // 40mm Cannon Badger
    {
        author = "TBMod";
        baseWeapon = "TB_weapon_40mm_CTWS";
        muzzles[] = {"HE","AP"};
        magazineWell[] = {"TB_magwell_40mm_CTWS"};
        reloadMagazineSound[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_120mm\Cannon_120mm_Reload_01",2.51189,1,10};
        reloadSound[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_120mm\Cannon_120mm_Reload_01",2.51189,1,10};
        class AP : autocannon_Base_F
        {
            displayName = "CTWS AP";
            magazineReloadTime = 3;
            magazines[] = {"TB_mag_40Rnd_40mm_APFSDS"};
            modes[] = {"player","close","short","medium","far"};
            class player : player
            {
                burst = 1;
                dispersion = 0.0002;
                displayName = "Halb";
                multiplier = 1;
                reloadTime = 0.6;
                textureType = "burst";
            };
        };
        class HE : autocannon_Base_F
        {
            displayName = "CTWS HE";
            magazineReloadTime = 3;
            magazines[] = {"TB_mag_40Rnd_40mm_GPR"};
            modes[] = {"player","close","short","medium","far"};

            class player : player
            {
                burst = 1;
                dispersion = 0.0002;
                displayName = "Halb";
                multiplier = 1;
                reloadTime = 0.6;
                textureType = "burst";
            };
        };
    };

    class HMG_127;
    class HMG_127_AFV : HMG_127
    {
        class manual;
    };
    class TB_weapon_127_coax : HMG_127_AFV // 12.7mm Coaxial
    {
        baseWeapon = "TB_weapon_coax_Badger";
        magazineReloadTime = 6;
        magazines[] = {"TB_mag_200Rnd_127x99_Tracer_Red"};
        modes[] = {"manual","close","short","medium","far"};
        class manual : manual
        {
            burst = 1;
            dispersion = 0.0006;
            displayName = "12.7mm HMG Tracer (Red)";
            multiplier = 1;
            reloadTime = 0.1;
            textureType = "fullAuto";
        };
    };

    class autocannon_40mm_VTOL_01 : autocannon_40mm_CTWS // Gunship 40mm
    {
        class player : Mode_FullAuto
        {
            reloadTime = 0.1; // 0.3
        };
    };

    class autocannon_30mm_CTWS : autocannon_Base_F
    {
        class AP;
        class HE;
    };
    class autocannon_30mm : autocannon_30mm_CTWS
    {
        class AP : AP
        {
            class player;
        };
        class HE : HE
        {
            class player;
        };
    };
    class TB_autocannon_CT40 : autocannon_30mm // 40mm Cannon FV510 Warrior
    {
        author = "TBMod";
        baseWeapon = "TB_autocannon_CT40";
        muzzles[] = {"HE","AP"};
        magazineWell[] = {"TB_magwell_40mm_FV510"};
        reloadMagazineSound[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_120mm\Cannon_120mm_Reload_01",2.51189,1,10};
        reloadSound[] = {"A3\Sounds_F\arsenal\weapons_vehicles\cannon_120mm\Cannon_120mm_Reload_01",2.51189,1,10};
        class AP : AP
        {
            displayName = "CTAS40 AP";
            magazineReloadTime = 1.5;
            magazines[] = {"TB_mag_40Rnd_40mm_APFSDS","TB_mag_40Rnd_40mm_HVEP"};
            modes[] = {"player","burst","close","short","medium","far"};
            class player : player
            {
                burst = 1;
                dispersion = 0.0002;
                displayName = "Halb";
                multiplier = 1;
                reloadTime = 0.6;
                textureType = "burst";
            };
            class burst : player
            {
                burst = 1;
                dispersion = 0.0002;
                displayName = "Voll";
                multiplier = 1;
                reloadTime = 0.3;
                textureType = "fullAuto";
            };
        };
        class HE : HE
        {
            displayName = "CTAS40 HE";
            magazineReloadTime = 1.5;
            magazines[] = {"TB_mag_40Rnd_40mm_GPR"};
            modes[] = {"player","burst","close","short","medium","far"};

            class player : player
            {
                burst = 1;
                dispersion = 0.0002;
                displayName = "Halb";
                multiplier = 1;
                reloadTime = 0.6;
                textureType = "burst";
            };
            class burst : player
            {
                burst = 1;
                dispersion = 0.0002;
                displayName = "Voll";
                multiplier = 1;
                reloadTime = 0.3;
                textureType = "fullAuto";
            };
        };
        class GunParticles
        {
            class Effect
            {
                directionName = "Konec hlavne";
                effectName = "AutoCannonFired";
                positionName = "Usti hlavne";
            };
            class Shell
            {
                directionName = "gunnerview"; // "shell_eject_dir"
                effectName = "TB_cloudlets_40mm_FV510"; // "MachineGun1"
                positionName = "Konec hlavne"; // "shell_eject_pos"   Neu: End of Barrel
            };
        };
    };

    class LMG_coax;
    class ACE_LMG_coax_L94A1_mem3 : LMG_coax
    {
        class manual;
    };
    class TB_coax_L94A1 : ACE_LMG_coax_L94A1_mem3 // Coaxial FV510 Warrior
    {
        baseWeapon = "TB_coax_L94A1";
        magazineReloadTime = 4;
        magazines[] = {"2000Rnd_762x51_Belt_T_Red"};
        modes[] = {"manual","close","short","medium","far"};
        class manual : manual
        {
            burst = 1;
            dispersion = 0.0011;
            displayName = "L94A1 coaxial 7.62mm";
            multiplier = 1;
            reloadTime = 0.11;
            textureType = "fullAuto";
        };
        class GunParticles
        {
            class effect1
            {
                directionName = "konec hlavne3";
                effectName = ""; // "MachineGunCloud"
                positionName = "usti hlavne3";
            };
        };
    };

    class SmokeLauncher;
    class CMFlareLauncher : SmokeLauncher
    {
        class Burst;
    };
    class TB_weap_CMLauncher : CMFlareLauncher // CM Flare Chaff
    {
        baseWeapon = "TB_weap_CMLauncher";
        magazines[] = {"TB_mag_CMFlare_Chaff_72Rnd"};
        modes[] = {"Burst","Timed","AIBurst"};
        class Burst : Burst // P(Treffer,0.85)= 5.36%
        {
            burst = 18;
            dispersion = 0.75;
            displayName = "Feuerstoß 18/1";
            multiplier = 1;
            reloadTime = 0.055;
        };
        class Timed : Burst // P(Treffer,0.85)= 85% auf 8,7% sinkend innerhalb von 5 Sek
        {
            burst = 36;
            dispersion = 0.75;
            displayName = "Verzögert 36/12";
            multiplier = 1;
            reloadTime = 0.333;
        };
        class AIBurst : Burst
        {
            showToPlayer = 0;
        };
    };

    class TB_weap_CMLauncher_Burst : CMFlareLauncher // CM Flare Chaff Burst
    {
        baseWeapon = "TB_weap_CMLauncher_B";
        magazines[] = {"TB_mag_CMFlare_Chaff_72Rnd_Burst"};
        modes[] = {"Burst","AIBurst"};
        class Burst : Burst // P(Treffer,0.85)= 5.36%
        {
            burst = 18;
            dispersion = 0.75;
            displayName = "nur Feuerstoß 18/1";
            multiplier = 1;
            reloadTime = 0.055;
        };
        class AIBurst : Burst
        {
            showToPlayer = 0;
        };
    };

    class MGunCore;
    class MGun : MGunCore
    {
        class Mode_Burst;
    };
    class TB_weap_LWIRCM_144_60 : MGun // LWIRCM 60
    {
        baseWeapon = "TB_weap_LWIRCM_144_60";
        magazines[] = {"TB_mag_LWIRCM_144_60"};
        modes[] = {"LWIRCM_60","AILWIRCM_60"};
        scope = 2;
        simulation = "cmlauncher";
        class LWIRCM_60 : Mode_Burst // P(Treffer,0.85)= 85% auf 14,22% sinkend innerhalb von 5 Sek
        {
            aiDispersionCoefX = 1.9;
            aiDispersionCoefY = 2.4;
            aiRateOfFire = 2;
            aiRateOfFireDispersion = 1;
            aiRateOfFireDistance = 500;
            artilleryCharge = 1;
            artilleryDispersion = 1;
            autoFire = 0;
            burst = 144;
            canShootInWater = 0;
            dispersion = 0.1;
            displayName = "LWIRCM 144/60";
            ffCount = 1;
            ffFrequency = 11;
            ffMagnitude = 0.5;
            flash = "gunfire";
            flashSize = 0.1;
            maxRange = 200;
            maxRangeProbab = 0.04;
            midRange = 60;
            midRangeProbab = 0.58;
            minRange = 0;
            minRangeProbab = 0.3;
            multiplier = 1;
            recoil = "recoil_auto_primary_3outof10";
            recoilProne = "recoil_auto_primary_prone_3outof10";
            reloadTime = 0.416;
            requiredOpticType = -1;
            showToPlayer = 1;
            soundBurst = 0;
            soundContinuos = 0;
            soundContinuous = 0;
            textureType = "fullAuto";
            useAction = 0;
            useActionTitle = "";
            weaponSoundEffect = "";
        };
        class AILWIRCM_60 : LWIRCM_60
        {
            showToPlayer = 0;
        };
    };
    class TB_weap_LWIRCM_144_45 : TB_weap_LWIRCM_144_60 // LWIRCM 45
    {
        baseWeapon = "TB_weap_LWIRCM_144_45";
        magazines[] = {"TB_mag_LWIRCM_144_45"};
        modes[] = {"LWIRCM_45","AILWIRCM_45"};
        class LWIRCM_45 : LWIRCM_60 // P(Treffer,0.85)= 85% auf 7,42% sinkend innerhalb von 5 Sek
        {
            burst = 144;
            dispersion = 0.1;
            displayName = "LWIRCM 144/45";
            multiplier = 1;
            reloadTime = 0.3125;
        };
        class AILWIRCM_45 : LWIRCM_45
        {
            showToPlayer = 0;
        };
    };
    class TB_weap_LWIRCM_144_30 : TB_weap_LWIRCM_144_60 // LWIRCM 30
    {
        baseWeapon = "TB_weap_LWIRCM_144_30";
        magazines[] = {"TB_mag_LWIRCM_144_30"};
        modes[] = {"LWIRCM_30","AILWIRCM_30"};
        class LWIRCM_30 : LWIRCM_60 // P(Treffer,0.85)= 85% auf 2,02% sinkend innerhalb von 5 Sek
        {
            burst = 144;
            dispersion = 0.1;
            displayName = "LWIRCM 144/30";
            multiplier = 1;
            reloadTime = 0.208;
        };
        class AILWIRCM_30 : LWIRCM_30
        {
            showToPlayer = 0;
        };
    };
};
