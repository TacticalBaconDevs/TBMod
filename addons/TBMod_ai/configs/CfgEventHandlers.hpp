/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_InitPost_EventHandlers
{
    #define STAIYIN(CLASSE) class CLASSE { \
        init = "(_this select 0) allowCrewInImmobile true";\
    }

    STAIYIN(Wheeled_APC_F);
    STAIYIN(Tank);
};
