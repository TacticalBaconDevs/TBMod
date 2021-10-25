/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    Author: IDarky
*/
class TB_supply_BRD_ammo : WRAPPER_NAME(Box_NATO_Ammo_F)
{
    PUBLIC_NAME_CAT("Munition",BRD);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(gm_30Rnd_556x45mm_B_T_M856_stanag_gry,20);
        MACRO_ADDMAGAZINE(gm_30Rnd_556x45mm_B_T_DM21_g36_blk,20);
        MACRO_ADDMAGAZINE(gm_20Rnd_762x51mm_B_T_DM21A2_g3_blk,20);
        MACRO_ADDMAGAZINE(gm_120Rnd_762x51mm_B_T_DM21A1_mg3_grn,6);
    };
};

class TB_supply_BRD_grena : WRAPPER_NAME(Box_NATO_Grenades_F)
{
    PUBLIC_NAME_CAT("Granaten",BRD);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(gm_1rnd_67mm_heat_dm22a1_g3,20);
        MACRO_ADDMAGAZINE(gm_smokeshell_wht_dm25,10);
        MACRO_ADDMAGAZINE(gm_smokeshell_red_dm23,10);
        MACRO_ADDMAGAZINE(gm_smokeshell_org_dm32,10);

        MACRO_ADDMAGAZINE(gm_handgrenade_frag_dm51a1,10);        // Splitternade
    };
};

class TB_supply_BRD_launcherAmmo : WRAPPER_NAME(Box_NATO_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("Panzerfaust Munition",BRD);

    class TransportMagazines
    {
        MACRO_ADDMAGAZINE(gm_1Rnd_60mm_heat_dm32_pzf3,2);
        MACRO_ADDMAGAZINE(gm_1Rnd_60mm_heat_dm12_pzf3,2);
        MACRO_ADDMAGAZINE(gm_1Rnd_60mm_heat_dm22_pzf3,2);
        MACRO_ADDMAGAZINE(gm_1Rnd_44x537mm_heat_dm32_pzf44_2,5);
    };
};

class TB_supply_BRD_oneUse_AA : WRAPPER_NAME(Box_EAST_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("O-U Werfer AA",BRD);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(gm_fim43_oli,10);
    };
};

class TB_supply_BRD_oneUse_AT : WRAPPER_NAME(Box_EAST_WpsLaunch_F)
{
    PUBLIC_NAME_CAT("O-U Werfer AT",BRD);

    class TransportWeapons
    {
        MACRO_ADDWEAPON(gm_m72a3_oli,10);
    };
};