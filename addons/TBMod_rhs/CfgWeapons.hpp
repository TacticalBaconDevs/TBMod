/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgWeapons
{
    class GrenadeLauncher;
    class Throw: GrenadeLauncher {
        muzzles[] += {"TB_IR_Grenade"};

        class ThrowMuzzle;

        class TB_IR_Grenade: ThrowMuzzle {
            magazines[] = {"TB_rhs_mag_IR_Handgrenade"};
        };
    };
};