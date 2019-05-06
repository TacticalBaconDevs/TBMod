/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
# define ADD_PRECISE_SMOKE(TYPE) class TYPE; \
    class TYPE##_precise : TYPE \
    { \
        simulation = "shotSmoke"; \
        deflecting = 0; \
        deflectionSlowDown = 0.1; \
        deflectionDirDistribution = 0; \
        timeToLive = 120; \
    }

class CfgAmmo
{
    // RHS
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_green);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_red);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_white);
    ADD_PRECISE_SMOKE(rhs_40mm_smoke_yellow);

    class rhs_g_vog25;
    class rhs_g_vg40sz : rhs_g_vog25 { // Unterlauf-Stungrenade 
        deflection = 0;
        fuseDistance = 10;
    };

    class rhsusf_40mm_HE;
    class TB_rhs_40mm_HEDP : rhsusf_40mm_HE { // Unterlauf-HEDP ;hat gewollt kaum Wirkung gegen KPz
        ace_frag_enabled = 0;
        ace_frag_force = 0;
        hit = 70;
        indirectHit = 65;
        indirectHitRange = 0.9;
    };
    
    class TB_rhsusf_40mm_HE : rhsusf_40mm_HE { // Unterlauf-HE
        caliber = 0.15;
        deflection = 0;
        explosive = 1;
        fuseDistance = 10;
        hit = 9;
        indirectHit = 8.5;
        indirectHitRange = 10.5;
    };

    class B_IRStrobe;
    class TB_rhs_40mm_IR_Grenade : B_IRStrobe { // Unterlauf-IR Granate
        ace_frag_enabled = 0;
        ace_frag_force = 0;
        cost = 0;
        dangerRadiusHit = 0;
        deflecting = 0;
        hit = 0;
        indirectHit = 0;
        indirectHitRange = 0;
        irTarget = 1;
        irTargetSize = 2;
        laserTarget = 1;
        lockSeekRadius = 100;
        model = "\A3\Weapons_f\Data\bullettracer\tracer_yellow";
        timeToLive = 900;
        tracerColor[] = {0.9,0.9,0.1,1};
        tracerColorR[] = {0.9,0.9,0.1,1};
        tracerEndTime = 2;
        tracerScale= 1.2;
        tracerStartTime = 0.04;
        visibleFire = 0;
        visibleFireTime = 0;
        visualTarget = 1;
        visualTargetSize = 2;
    };

    class TB_IR_Grenade : B_IRStrobe { // IR Handgranate
        ace_frag_enabled = 0;
        ace_frag_force = 0;
        cost = 0;
        dangerRadiusHit = 0;
        deflecting = 0;
        hit = 0;
        indirectHit = 0;
        indirectHitRange = 0;        
        irTarget = 1;
        irTargetSize = 2;
        laserTarget = 1;
        lockSeekRadius = 100;
        timeToLive = 900;
        visibleFire = 0;
        visibleFireTime = 0;
        visualTarget = 1;
        visualTargetSize = 2;
    };

    class rhsusf_40mm_HEDP;
    class TB_rhs_40mm_Delay : rhsusf_40mm_HEDP { // Unterlauf-Delay Grenade
        deflecting = 0;
        explosionAngle = 360;
        explosionTime = 4;
        fuseDistance = 9;
        hit = 0;
        indirectHit = 6;
        indirectHitRange = 6.5;
        model = "\A3\Weapons_f\Data\bullettracer\tracer_yellow";
        tracerColor[] = {0.9,0.9,0.1,1};
        tracerColorR[] = {0.9,0.9,0.1,1};
        tracerEndTime = 3.98;
        tracerScale= 1.2;
        tracerStartTime = 0.04;
        visibleFire = 0.3;
        visibleFireTime = 1;
    };

    class rhs_ammo_12g_slug;
    class TB_rhs_ammo_40mm_Slugshot : rhs_ammo_12g_slug { // Unterlauf-Slug
        caliber = 2;
        deflecting = 0;
        hit = 25;
    };

    class rhsusf_40mm_white;
    class TB_rhsusf_40mm_white : rhsusf_40mm_white { // Flare White
        timeToLive = 180;
    };

    class rhsusf_40mm_green;
    class TB_rhsusf_40mm_green : rhsusf_40mm_green { // Flare Green
        timeToLive = 180;
    };

    class rhsusf_40mm_red;
    class TB_rhsusf_40mm_red : rhsusf_40mm_red { // Flare Red
        timeToLive = 180;
    };
};
