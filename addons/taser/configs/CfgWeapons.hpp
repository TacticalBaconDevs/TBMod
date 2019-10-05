/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: Eric Ruhland
*/
class CfgWeapons
{
    class Pistol_Base_F;
    class hgun_Pistol_heavy_01_F : Pistol_Base_F {
        class Single;
        class WeaponSlotsInfo;
    };
    class TB_weap_taser : hgun_Pistol_heavy_01_F
    {
        author = "TBMod";
        baseWeapon = "tb_weap_taser";
        displayName = "Taser";
        descriptionShort = "Taser";
        magazines[] = {
            "TB_mag_taser"
        };

        class WeaponSlotsInfo : WeaponSlotsInfo
        {
            mass = 42; // 21
        };

        class Single : Single
        {
            class BaseSoundModeType
            {
                closure1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\closure_4_Five_01", 0.316228, 1, 10};
                closure2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\closure_4_Five_02", 0.316228, 1.1, 10};
                soundClosure[] = {"closure1", 0.5, "closure2", 0.5};
            };
            class StandardSound: BaseSoundModeType
            {
                begin1[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_01", 1, 1, 600};
                begin2[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_02", 1, 1, 600};
                begin3[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_short_03", 1, 1, 600};
                soundBegin[] = {"begin1", 0.33, "begin2", 0.33, "begin2", 0.34};
                class SoundTails
                {
                    class TailInterior
                    {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_interior", 1, 1, 600};
                        frequency = 1;
                        volume = "interior";
                    };
                    class TailTrees
                    {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_trees", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*trees";
                    };
                    class TailForest
                    {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_forest", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*forest";
                    };
                    class TailMeadows
                    {
                        sound[] = {"A3\Sounds_F\arsenal\weapons\Pistols\4-Five\Silencer_4-Five_tail_meadows", 1, 1, 600};
                        frequency = 1;
                        volume = "(1-interior/1.4)*(meadows/2 max sea/2)";
                    };
                    class TailHouses
                    {
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
        };
    };
};
