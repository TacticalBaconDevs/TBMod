/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgWeaponHandling
{
    class Recoil
    {
        impulseCoef = 1;  // 1 common coefficient for weapon-based recoil configuration values, increase to make all recoils stronger, decrease to make them all weaker
        kickVisual = 0.6; // 0.6 multiplier for extra camera-only movement for weapon kickback
        prone = 1.25;     // 1.25 coefficient of recoil forces while in prone (this is further multiplied by weapon resting coefficients)
    };

    class Stabilization
    {
        characterPoints[] = {"lElbow","rElbow"};
        deployBipodTime = 1.3; // 0.4
        deployedCoef = 0.03; // 0.1
        deployedProneCoef = 0.01; // 0.02
        deployedRecoil = 0.15; // 0.5
        deployedRecoilPersistent = 0;
        deployTime = 0.2;
        groundLimits[] = {0.139626,0.314159};
        objectLimits[] = {0.349066,0.837758};
        restingCoef = 0.06; // 0.4
        restingProneCoef = 0.03; // 0.08
        restingRecoil = 0.25; // 0.5
        restingRecoilPersistent = 0; // 0.5
        undeployBipodTime = 0.65; // 0.3
        undeployTime = 0.2;
        upperBodyRadius = 0.12;
        weaponPoints[] = {"Usti hlavne","Konec hlavne"};
        weaponRadius = 0.4;
    };

    class SwayDistortion
    {
        decay = 7;
        gunnerCoef = 1.2;
        maximum = 7; // 10
        rate = 4; // 14
    };
};
