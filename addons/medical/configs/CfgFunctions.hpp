/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    // REPLACEMENT - ace3
    class ACE3
    {
        
        class medical_status
        {
            tag = "ace_medical_status";
            class hasStableVitals
            {
                file = QPATHTOF(replacement\fnc_hasStableVitals.sqf);
            };
        };
        class medical_statemachine
        {
            tag = "ace_medical_statemachine";
            class handleStateUnconscious
            {
                file = QPATHTOF(replacement\fnc_handleStateUnconscious.sqf);
            };
        };
    };
};
