/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class CBA_Extended_EventHandlers;

class CfgVehicles
{
    // ###################### ACE-MEDICAL-ANPASSUNGEN ######################
    class Item_Base_F;
    class ACE_atropineItem: Item_Base_F
    {
        displayName = "Ketamin-Autoinjektor";
    };

    #define ATROPINE_OVERRIDE(EXTR_NAME) class EXTR_NAME { \
            class Morphine; \
            class Atropine: Morphine { \
                displayName = "Ketamin injizieren"; \
            }; \
        }
    #define OVERRIDE_IV(CLASSE,PARENT,NAME) class CLASSE: PARENT { \
            displayName = #NAME; \
        }
    #define OVERRIDE_PART(EXTR_NAME) class EXTR_NAME { \
            class Morphine; \
            class Atropine: Morphine { \
                displayName = "Ketamin injizieren"; \
            }; \
            \
            class fieldDressing; \
            OVERRIDE_IV(BloodIV, fieldDressing, Blutransfusion (2000ml)); \
            OVERRIDE_IV(BloodIV_500, BloodIV, Blutransfusion (1000ml)); \
            OVERRIDE_IV(BloodIV_250, BloodIV, Blutransfusion (500ml)); \
            \
            OVERRIDE_IV(SalineIV, BloodIV, Kochsalztransfusion (500ml)); \
            OVERRIDE_IV(SalineIV_500, SalineIV, Kochsalztransfusion (250ml)); \
            OVERRIDE_IV(SalineIV_250, SalineIV, Kochsalztransfusion (125ml)); \
        }
    #define OVERRIDES OVERRIDE_PART(ACE_ArmLeft); \
        OVERRIDE_PART(ACE_ArmRight); \
        OVERRIDE_PART(ACE_LegLeft); \
        OVERRIDE_PART(ACE_LegRight)

    class Man;
    class CAManBase: Man
    {
        class ACE_SelfActions
        {
            class Medical
            {
                ATROPINE_OVERRIDE(ACE_ArmLeft);
                ATROPINE_OVERRIDE(ACE_ArmRight);
                ATROPINE_OVERRIDE(ACE_LegLeft);
                ATROPINE_OVERRIDE(ACE_LegRight);
            };
        };

        class ACE_Actions
        {
            OVERRIDES;

            class ACE_MainActions
            {
                class Medical
                {
                    OVERRIDES;
                };
            };
        };
    };
};
