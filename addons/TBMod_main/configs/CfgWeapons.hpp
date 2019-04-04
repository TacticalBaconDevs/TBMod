/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define SET_NAME(CLASSE,DISPNAME,GEWICHT,PICNAME) class CLASSE : ACE_ItemCore { \
        picture = PICNAME;\
        displayName = DISPNAME; \
        class ItemInfo: CBA_MiscItem_ItemInfo { \
            mass = GEWICHT; \
        }; \
    }

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
        displayName = "Adenosine-Autoinjektor";
        descriptionShort = "Stabiliesiert und stärkt den Hezschlag.";
        descriptionUse = "Stabiliesiert und stärkt den Hezschlag.";
    };

    SET_NAME(ACE_bloodIV, "Blut IV (2000ml)", 10, "\z\ace\addons\medical\ui\items\bloodIV_x_ca.paa");
    SET_NAME(ACE_bloodIV_500, "Blut IV (1000ml)", 5, "\z\ace\addons\medical\ui\items\bloodIV_x_ca.paa");
    SET_NAME(ACE_bloodIV_250, "Blut IV (500ml)", 2.5, "\z\ace\addons\medical\ui\items\bloodIV_x_ca.paa");

    SET_NAME(ACE_plasmaIV, "Plasma IV (1000ml)", 10, "\z\ace\addons\medical\ui\items\plasmaIV_x_ca.paa");
    SET_NAME(ACE_plasmaIV_500, "Plasma IV (500ml)", 5, "\z\ace\addons\medical\ui\items\plasmaIV_x_ca.paa");
    SET_NAME(ACE_plasmaIV_250, "Plasma IV (250ml)", 2.5, "\z\ace\addons\medical\ui\items\plasmaIV_x_ca.paa");

    SET_NAME(ACE_salineIV, "Kochsalzlösung (500ml)", 10, "\z\ace\addons\medical\ui\items\salineIV_x_ca.paa");
    SET_NAME(ACE_salineIV_500, "Kochsalzlösung (250ml)", 5, "\z\ace\addons\medical\ui\items\salineIV_x_ca.paa");
    SET_NAME(ACE_salineIV_250, "Kochsalzlösung (125ml)", 2.5, "\z\ace\addons\medical\ui\items\salineIV_x_ca.paa");
};
