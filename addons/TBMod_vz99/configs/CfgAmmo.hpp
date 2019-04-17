/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Original by https://github.com/BourbonWarfare/POTATO
    Modified by http://tacticalbacon.de
*/
class CfgAmmo
{
    class SmokeShellArty;
    class ShotDeployBase;
    class Sh_82mm_AMOS;
    class Flare_82mm_AMOS_White;

    // Smokes:
    class TB_vz99_deploy_smokeWhite : SmokeShellArty
    {
        smokeColor[] = {1,1,1,1};
        //effectsSmoke = QEGVAR(filledSmoke,bigSmoke);
    };
    class TB_vz99_deploy_smokeRed : SmokeShellArty
    {
        smokeColor[] = {1,0,0,1};
        //effectsSmoke = QEGVAR(filledSmoke,bigSmoke);
    };
    class TB_vz99_ammo_smokeWhite : ShotDeployBase
    {
        model = "\A3\weapons_f\ammo\shell";
        submunitionAmmo = "TB_vz99_deploy_smokeWhite";
    };
    class TB_vz99_ammo_smokeRed : ShotDeployBase
    {
        model = "\A3\weapons_f\ammo\shell";
        submunitionAmmo = "TB_vz99_deploy_smokeRed";
    };

    // Flare:
    class TB_vz99_ammo_flare : Flare_82mm_AMOS_White
    {
        flareSize = 6;
        intensity = 2000000;
        timeToLive = 45;
    };

    //HE:
    class TB_vz99_ammo_he : Sh_82mm_AMOS
    {
        // Quelle: https://www.universal-dsg.com/product/60-mm-mortar-bomb-he-explosive-practice/
        ace_frag_enabled = 1;  // Enable fragmentation (0-disabled, 1-enabled)
        ace_frag_metal = 1600;  // Amount of metal being fragmented (grams) - information below
        ace_frag_charge = 200;  // Amount of explosive filler (grams) - information below
        ace_frag_gurney_c = 2843;  // Gurney velocity constant for explosive type - information below
        ace_frag_gurney_k = 3/5;  // Gurney shape factor - information below
        ace_frag_classes[] = {"ace_frag_medium","ace_frag_medium_HD"};
        ace_frag_force = 1;

        // effectFly = "ArtilleryTrails"; //Fun but not don't make any sense

        fuseDistance = 50; //The minimum distance any explosive projectile has to travel, before it becomes armed and thus explodes on impact.
        hit = 170;
        indirectHit = 10;
        indirectHitRange = 9;

        muzzleEffect = "";
        class CamShakeExplode
        {
            power = "(82*0.2)";
            duration = "((round (82^0.5))*0.2 max 0.2)";
            frequency = 20;
            distance = "((18 + 82^0.5)*8)";
        };
        class CamShakeHit
        {
            power = 82;
            duration = "((round (82^0.25))*0.2 max 0.2)";
            frequency = 20;
            distance = 1;
        };
        class CamShakeFire
        {
            power = "(82^0.25)";
            duration = "((round (82^0.5))*0.2 max 0.2)";
            frequency = 20;
            distance = "((82^0.5)*8)";
        };
        class CamShakePlayerFire
        {
            power = 0.01;
            duration = 0.1;
            frequency = 20;
            distance = 1;
        };
    };
    class TB_vz99_ammo_he_airburst : TB_vz99_ammo_he
    {
        simulation = "shotRocket";
        timeToLive = 0;

        ace_frag_classes[] = {"ACE_frag_large", "ACE_frag_large_HD"}; //HD have move air friction
        hit = 80;
        indirectHit = 30;
        indirectHitRange = 25;

        // explosionEffects = "HERocketExplosion"; //ExploAmmoExplosion, HEShellExplosion
        // CraterEffects = "";
    };
};
