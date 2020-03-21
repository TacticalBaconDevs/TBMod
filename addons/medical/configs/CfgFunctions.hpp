/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    // REPLACEMENT - ace
    class ace
    {
        tag = "ace_medical_status";
        class medical_status
        {
            tag = "ace_medical_status";
            class hasStableVitals
            {   tag = "ace_medical_status";
                file = QPATHTOF(replacement\fnc_hasStableVitals.sqf);
            };
        };
    };
};
