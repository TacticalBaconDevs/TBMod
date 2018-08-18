/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgWeapons
{
    class Pistol_Base_F;
    class hgun_Pistol_heavy_01_F : Pistol_Base_F {
        class Single;
    };
    class TB_weap_taser : hgun_Pistol_heavy_01_F
    {
        author = "TBMod";
        baseWeapon = "tb_weap_taser";
        displayName = "Taser";
        descriptionShort = "Taser";
        magazines[] = {
            "tb_mag_taser"
        };
        
        class Single : Single {
            sounds[] = {"StandardSound", "SilencedSound"};
            class BaseSoundModeType {
                closure1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\closure_4_Five_01", 0.316228, 1, 10};
                closure2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\closure_4_Five_02", 0.316228, 1.1, 10};
                soundClosure[] = {"closure1", 0.5, "closure2", 0.5};
             };
            class StandardSound: BaseSoundModeType {
                begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_01", 1, 1, 600};
                begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_02", 1, 1, 600};
                begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_03", 1, 1, 600};
                soundBegin[] = {"begin1", 0.33, "begin2", 0.33, "begin2", 0.34};
                class SoundTails {
                    class TailInterior {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_interior", 1, 1, 600};
                        frequency = 1;
                        volume = "interior";
                    };
                    class TailTrees {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_trees", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*trees";
                    };
                    class TailForest {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_forest", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*forest";
                    };
                    class TailMeadows {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_meadows", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
                    };
                    class TailHouses {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_houses", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*houses";
                    };
                };
                SoundSetShot[] = {"4Five_silencerShot_SoundSet", "4Five_silencerTail_SoundSet", "4Five_silencerInteriorTail_SoundSet"};
                closure1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\closure_4_Five_01", 0.316228, 1, 10};
                closure2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\closure_4_Five_02", 0.316228, 1.1, 10};
                soundClosure[] = {"closure1", 0.5, "closure2", 0.5};
            };
            class SilencedSound: BaseSoundModeType {
                begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_01", 1, 1, 600};
                begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_02", 1, 1, 600};
                begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_03", 1, 1, 600};
                soundBegin[] = {"begin1", 0.33, "begin2", 0.33, "begin2", 0.34};
                class SoundTails {
                    class TailInterior {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_interior", 1, 1, 600};
                        frequency = 1;
                        volume = "interior";
                    };
                    class TailTrees {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_trees", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*trees";
                    };
                    class TailForest {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_forest", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*forest";
                    };
                    class TailMeadows {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_meadows", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
                    };
                    class TailHouses {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_houses", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*houses";
                    };
                };
                SoundSetShot[] = {"4Five_silencerShot_SoundSet", "4Five_silencerTail_SoundSet", "4Five_silencerInteriorTail_SoundSet"};
                closure1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\closure_4_Five_01", 0.316228, 1, 10};
                closure2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\closure_4_Five_02", 0.316228, 1.1, 10};
                soundClosure[] = {"closure1", 0.5, "closure2", 0.5};
            };
            recoil = "recoil_pistol_heavy";
            recoilProne = "recoil_prone_pistol_heavy";
            reloadTime = 0.1;
            dispersion = 0.00435;
            minRange = 5;
            minRangeProbab = 0.3;
            midRange = 25;
            midRangeProbab = 0.6;
            maxRange = 50;
            maxRangeProbab = 0.1;
            aiRateOfFire = 2;
            aiRateOfFireDistance = 25;
            multiplier = 1;
            burst = 1;
            burstRangeMax = -1;
            sound[] = {"", 10, 1};
            soundBegin[] = {"sound", 1};
            soundBeginWater[] = {"sound", 1};
            soundClosure[] = {"sound", 1};
            soundEnd[] = {};
            soundLoop[] = {};
            soundContinuous = 0;
            weaponSoundEffect = "";
            ffCount = 1;
            ffMagnitude = 0.5;
            ffFrequency = 11;
            flash = "gunfire";
            flashSize = 0.1;
            autoFire = 0;
            useAction = 0;
            useActionTitle = "";
            showToPlayer = 1;
            artilleryDispersion = 1;
            artilleryCharge = 1;
            canShootInWater = 0;
            displayName = "Halbautom.";
            textureType = "semi";
            aiDispersionCoefY = 1.7;
            aiDispersionCoefX = 1.4;
            soundBurst = 0;
            requiredOpticType = -1;
            aiRateOfFireDispersion = 1;
        };
    };
};
