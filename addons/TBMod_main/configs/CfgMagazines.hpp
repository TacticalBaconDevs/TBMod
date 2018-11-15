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
        
        mass = 36; //12
    };

    class SmokeShell;
    class TB_SmokeShell : SmokeShell
    {
        ammo = "TB_SmokeShell";
    
        author = "TBMod";
        
        displayName = "Instant";
        displayNameShort = "Instant";
        descriptionShort = "Instant";
    };
};

class CfgWeapons
{
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"TB_InstantSmoke"};

        class ThrowMuzzle;
        class TB_InstantSmoke: ThrowMuzzle {
            magazines[] = {"TB_SmokeShell"};
        };
    };
};
