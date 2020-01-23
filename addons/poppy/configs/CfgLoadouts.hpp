/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Created by https://github.com/BaerMitUmlaut/Poppy
    Changed by http://tacticalbacon.de

    Wiki: https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes
*/
#define ADDCLASSLOADOUT(NUM) class GVAR(poppy_##NUM): All {}

class CfgLoadouts
{
    class All
    {
        uniform[] = {"U_B_CTRG_1", "U_B_CTRG_3"};
        backpack[] = {};
        vest[] = {"V_PlateCarrier2_blk"};
        headgear[] = {"H_HelmetB_light", "H_HelmetB_light_black", "H_HelmetB_light_snakeskin"};
        goggles[] = {};
        nvgs[] = {};
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

    ADDCLASSLOADOUT(01);
    ADDCLASSLOADOUT(02);
    ADDCLASSLOADOUT(03);
    ADDCLASSLOADOUT(04);
    ADDCLASSLOADOUT(05);
    ADDCLASSLOADOUT(06);
    ADDCLASSLOADOUT(07);
    ADDCLASSLOADOUT(08);
    ADDCLASSLOADOUT(09);
    ADDCLASSLOADOUT(10);

};
