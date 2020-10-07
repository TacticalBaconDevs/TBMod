/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    // REPLACEMENT - ace
    class ace_medical_status
    {
        class medical_status
        {
            class hasStableVitals
            {
                file = QPATHTOF(replacement\fnc_hasStableVitals.sqf);
            };
        };
    };

    class ace_medical_damage
    {
        class medical_damage
        {
            class determineIfFatal
            {
                file = QPATHTOF(replacement\fnc_determineIfFatal.sqf);
            };
        };
    };
};
