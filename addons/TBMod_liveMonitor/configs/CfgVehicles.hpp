/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: Chris 'Taranis'
*/
class CfgVehicles
{
    class Man;
    class CAManBase: Man
    {
        class ACE_Actions
        {
            class ACE_MainActions
            {
                class TB_liveMonitor_connect
                {
                    displayName = "Mit Patienten verbinden";
                    icon = "\TBMod_liveMonitor\pictures\medical_cross_lm.paa";
                    condition = "call TB_liveMonitor_fnc_canShow";
                    statement = "TB_liveMonitor_unit = _target;";
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};    
                };
            };
        };
        class ACE_SelfActions
        {
            class Medical
            {
                class TB_liveMonitor_connectSelf
                {
                    displayName = "Selber verbinden";
                    icon = "\TBMod_liveMonitor\pictures\medical_cross_lm.paa";
                    condition = "call TB_liveMonitor_fnc_canShow";
                    statement = "TB_liveMonitor_unit = player;";
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};    
                };
            };

            class ACE_Equipment
            {
                class TB_liveMonitor_show
                {
                    displayName = "Live Monitor";
                    condition = "call TB_liveMonitor_fnc_canShow";
                    showDisabled = 0;
                    priority = 0.1;
                    icon = "\TBMod_liveMonitor\pictures\medical_cross_lm.paa";
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"}; 

                    class TB_liveMonitor_open
                    {
                        displayName = "Öffnen";
                        condition = "call TB_liveMonitor_fnc_canShow && !TB_liveMonitor_isActive";
                        statement = "call TB_liveMonitor_fnc_initialize";
                        showDisabled = 0;
                        priority = 0.2;
                        icon = "\TBMod_liveMonitor\pictures\medical_cross_lm.paa";
                        exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"}; 
                    };

                    class TB_liveMonitor_hide
                    {
                        displayName = "Schließen";
                        condition = "TB_liveMonitor_isActive";
                        statement = "call TB_liveMonitor_fnc_remove";
                        showDisabled = 0;
                        priority = 0.3;
                        icon = "\TBMod_liveMonitor\pictures\medical_cross_lm.paa";
                        exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"}; 
                    };
                };
            };
        };
    };
};
