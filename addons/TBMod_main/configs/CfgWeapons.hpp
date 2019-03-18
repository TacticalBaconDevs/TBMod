/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define SET_NAME(CLASSE,DISPNAME) class CLASSE: ACE_ItemCore {displayName = DISPNAME;};

class CfgWeapons
{
    class ACE_ItemCore;
    class ACE_atropine: ACE_ItemCore
    {
        displayName = "Ketamin-Autoinjektor";
        descriptionShort = "Wird verwendet um leichte Schmerzen zu lindern.";
        descriptionUse = "Ein Schmerzmittel um leichte Schmerzen zu behandeln.";
    };
    
    SET_NAME(ACE_bloodIV, "Blut IV (2000ml)");
    SET_NAME(ACE_bloodIV_500, "Blut IV (1000ml)");
    SET_NAME(ACE_bloodIV_250, "Blut IV (500ml)");
    
    SET_NAME(ACE_plasmaIV, "Plasma IV (1000ml)");
    SET_NAME(ACE_plasmaIV_500, "Plasma IV (500ml)");
    SET_NAME(ACE_plasmaIV_250, "Plasma IV (250ml)");
    
    SET_NAME(ACE_salineIV, "Kochsalzlösung (500ml)");
    SET_NAME(ACE_salineIV_500, "Kochsalzlösung (250ml)");
    SET_NAME(ACE_salineIV_250, "Kochsalzlösung (125ml)");
};
