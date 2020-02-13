class CfgMagazines
{
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
};
