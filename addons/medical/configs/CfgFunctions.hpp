/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CfgFunctions
{
    // REPLACEMENT - ace
    class ace
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
        class medical_treatment
        {
            tag = "ace_medical_treatment";
            class getBandageTime
            {
                file = QPATHTOF(replacement\fnc_getBandageTime.sqf);
            };
        };
    };
};
