/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
class CfgLoadouts {
    class All {
        uniform[] = {"U_B_CTRG_1", "U_B_CTRG_3"};
        backpack[] = {""};
        vest[] = {"V_PlateCarrier2_blk"};
        headgear[] = {"H_HelmetB_light", "H_HelmetB_light_black", "H_HelmetB_light_snakeskin"};
        goggles[] = {""};
        nvgs[] = {""};
        primary[] = {
            {"arifle_SPAR_01_blk_F", "optic_Holosight_blk_F", "muzzle_snds_M"},
            {"arifle_SPAR_01_snd_F", "optic_Holosight_blk_F", "muzzle_snds_M"}
        };
        secondary[] = {"hgun_ACPC2_F"};
        magazines[] = {
            {"30Rnd_556x45_Stanag", 6},
            {"30Rnd_556x45_Stanag_Tracer_Red", 2},
            {"9Rnd_45ACP_Mag", 2},
            {"HandGrenade", 2},
            {"SmokeShell", 2},
            {"SmokeShellRed", 1},
            {"SmokeShellGreen", 1}
        };
        items[] = {
            {"ACE_fieldDressing", 4},
            {"ACE_packingBandage", 4},
            {"ACE_elasticBandage", 4},
            {"ACE_quikclot", 4},
            {"ACE_morphine", 1}
        };
    };
	class GVAR(poppy_01): All {};
    class GVAR(poppy_02): All {};
    class GVAR(poppy_03): All {};
    class GVAR(poppy_04): All {};
    class GVAR(poppy_05): All {};
    class GVAR(poppy_06): All {};
    class GVAR(poppy_07): All {};
    class GVAR(poppy_08): All {};
    
};
