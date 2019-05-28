/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define SET_NAME(CLASSE,PARENT,DISPNAME) class CLASSE : PARENT { displayName = DISPNAME; }

class CfgWeapons
{
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class ACE_atropine: ACE_ItemCore
    {
        displayName = "Ketamin-Autoinjektor";
        descriptionShort = "Wird verwendet um leichte Schmerzen zu lindern.";
        descriptionUse = "Ein Schmerzmittel um leichte Schmerzen zu behandeln.";
    };

    class ACE_adenosine: ACE_ItemCore
    {
        displayName = "Adenosin-Autoinjektor";
        descriptionShort = "Stabilisiert den Herzschlag.";
        descriptionUse = "Stabilisiert den Herzschlag.";
    };

    SET_NAME(ACE_bloodIV, ACE_ItemCore, "Blut IV (2000ml)");
    SET_NAME(ACE_bloodIV_500, ACE_bloodIV, "Blut IV (1000ml)");
    SET_NAME(ACE_bloodIV_250, ACE_bloodIV, "Blut IV (500ml)");

    SET_NAME(ACE_salineIV, ACE_ItemCore, "Kochsalzlösung (500ml)");
    SET_NAME(ACE_salineIV_500, ACE_salineIV,  "Kochsalzlösung (250ml)");
    SET_NAME(ACE_salineIV_250, ACE_salineIV, "Kochsalzlösung (125ml)");
};
