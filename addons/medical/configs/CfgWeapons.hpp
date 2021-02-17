/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define SET_NAME(CLASSE,PARENT,DISPNAME) class CLASSE : PARENT { displayName = DISPNAME; }

class CfgWeapons
{
    class ACE_ItemCore;

    SET_NAME(ACE_bloodIV, ACE_ItemCore, "Blut IV (2800ml)");
    SET_NAME(ACE_bloodIV_500, ACE_bloodIV, "Blut IV (1400ml)");
    SET_NAME(ACE_bloodIV_250, ACE_bloodIV, "Blut IV (700ml)");

    SET_NAME(ACE_plasmaIV, ACE_ItemCore, "Plasmalösung (1400ml)");
    SET_NAME(ACE_plasmaIV_500, ACE_plasmaIV,  "Plasmalösung (700ml)");
    SET_NAME(ACE_plasmaIV_250, ACE_plasmaIV, "Plasmalösung (350ml)");

    SET_NAME(ACE_salineIV, ACE_ItemCore, "Kochsalzlösung (700ml)");
    SET_NAME(ACE_salineIV_500, ACE_salineIV,  "Kochsalzlösung (350ml)");
    SET_NAME(ACE_salineIV_250, ACE_salineIV,  "Kochsalzlösung (125ml)");

    class ACE_adenosine : ACE_ItemCore
    {
        descriptionShort = "Erhöhung der Blutgerinnung"; // "Used to counter effects of Epinephrine"
        descriptionUse = "Bei drohendem Ausbluten zu verwenden"; //"A drug used to counter the effects of Epinephrine"
        displayName = "Thrombin"; //"Adenosine autoinjector"
    };
};
