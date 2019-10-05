/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
class CfgMagazines
{
    class 8Rnd_82mm_Mo_shells;

    // HE
    class TB_vz99_HE : 8Rnd_82mm_Mo_shells
    {
        picture = QPATHTOF(ui\shell_ca.paa);
        author = "PabstMirror";
        count = 1;
        mass = 20;

        TB_vz99_base = "TB_vz99_HE";
        displayName = "vz99 60mm HE Impact Fuze";
        descriptionShort = "60mm HE Shell<br/>For use in the vz99 mortar<br/>With a basic impact fuze";
        displayNameShort = "HE-IMP-C1";
        ammo = "TB_vz99_ammo_he";
        initSpeed = 110;
        scope = 2;
        ace_arsenal_hide = -1;
    };
    class TB_vz99_HE_charge0: TB_vz99_HE
    {
        initSpeed = 70;
        scope = 1;
        displayNameShort = "HE-IMP-C0";
    };

    // HE w/ multi fuze
    class TB_vz99_HE_multi : TB_vz99_HE
    {
        TB_vz99_base = "TB_vz99_HE_multi";
        displayName = "vz99 60mm HE Multi Fuze";
        descriptionShort = "60mm HE Shell<br/>For use in the vz99 mortar<br/>ith a multi-option fuze (Impact, Near Surface, Proximity)";
        displayNameShort = "HE-IMP-C1";
        initSpeed = 110;
        TB_vz99_fuze = "";
    };
    class TB_vz99_HE_multi_charge0 : TB_vz99_HE_multi
    {
        initSpeed = 70;
        scope = 1;
        displayNameShort = "HE-IMP-C0";
    };
    class TB_vz99_HE_PRX : TB_vz99_HE_multi
    {
        TB_vz99_base = "TB_vz99_HE_multi";
        displayNameShort = "HE-PRX-C1";
        initSpeed = 110;
        TB_vz99_fuze = "prx";
        scope = 1;
    };
    class TB_vz99_HE_PRX_charge0: TB_vz99_HE_PRX
    {
        initSpeed = 70;
        scope = 1;
        displayNameShort = "HE-PRX-C0";
    };

    // Smokes
    class TB_vz99_smokeWhite : TB_vz99_HE
    {
        TB_vz99_base = "TB_vz99_smokeWhite";
        displayName = "vz99 60mm Smoke (White)";
        descriptionShort = "60mm HE White Smoke Shell<br/>For use in the vz99 mortar";
        displayNameShort = "SMOKE-C1 (White)";
        ammo = "TB_vz99_ammo_smokeWhite";
        initSpeed = 110;
    };
    class TB_vz99_smokeWhite_charge0 : TB_vz99_smokeWhite
    {
        initSpeed = 70;
        scope = 1;
        displayNameShort = "SMOKE-C0 (White)";
    };

    class TB_vz99_smokeRed : TB_vz99_HE
    {
        TB_vz99_base = "TB_vz99_smokeRed";
        displayName = "vz99 60mm Smoke (Red)";
        descriptionShort = "60mm HE Red Smoke Shell<br/>For use in the vz99 mortar";
        displayNameShort = "SMOKE-C1 (Red)";
        ammo = "TB_vz99_ammo_smokeRed";
        initSpeed = 110;
    };
    class TB_vz99_smokeRed_charge0 : TB_vz99_smokeRed
    {
        initSpeed = 70;
        scope = 1;
        displayNameShort = "SMOKE-C0 (Red)";
    };

    // Flare
    class TB_vz99_flare : TB_vz99_HE
    {
        TB_vz99_base = "TB_vz99_flare";
        displayName = "vz99 60mm Flare (White)";
        descriptionShort = "60mm HE Flare Shell<br/>For use in the vz99 mortar";
        displayNameShort = "FLARE-C1";
        ammo = "TB_vz99_ammo_flare";
        initSpeed = 110;
    };
    class TB_vz99_flare_charge0 : TB_vz99_flare
    {
        initSpeed = 70;
        scope = 1;
        displayNameShort = "FLARE-C0";
    };
};
