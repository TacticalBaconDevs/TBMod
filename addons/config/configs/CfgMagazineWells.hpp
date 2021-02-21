/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgMagazineWells
{
    class UGL_40x36
    {
        ADDON[] = {"3Rnd_Smoke_Grenade_shell_precise"};
    };

    class TB_magwell_6Rnd_45_FMJ
    {
        ADDON[] = {"TB_mag_45_FMJ"};
    };

    class TB_magwell_10Rnd_338
    {
        TB_10Rnd_338[] =
       {
            "TB_mag_10Rnd_338_LS_Tracer",
            "TB_mag_10Rnd_338_LS_DIM"
       };
    };
    class TB_magwell_100Rnd_338
    {
        TB_100Rnd_338[] =
        {
            "TB_mag_100Rnd_338_LS_Tracer",
            "TB_mag_100Rnd_338_LS_DIM"
        };
    };
    class CBA_408CT_Inter
    {
        ace_ballistics[] = {"ACE_7Rnd_408_305gr_Mag","TB_mag_7Rnd_M200_Tracer"}; // "ACE_7Rnd_408_305gr_Mag"
    };
    class TB_magwell_20Rnd_570x28
    {
        TB_20Rnd_570x28[] = {"TB_20Rnd_570x28"};
    };
    class TB_magwell_40mm_FV510
    {
        TB_magwell_40mm_FV510[] =
        {
            "TB_mag_40Rnd_40mm_APFSDS",
            "TB_mag_40Rnd_40mm_GPR",
            "TB_mag_20Rnd_40mm_IR_Loal_missiles"
        };
    };
};
