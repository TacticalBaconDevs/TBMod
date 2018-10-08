#include "\a3\editor_f\Data\Scripts\dikCodes.h"
/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de

    Author: Chris 'Taranis'
    
    DIK Codes -> https://community.bistudio.com/wiki/DIK_KeyCodes
*/
TB_liveMonitor_isActive = false;

[
    "TB_liveMonitor",
    "liveMonitor_keyRefresh",
    ["Änderungsrate verändern", "Verändert die Refreshrate des Monitors"],
    {
        private _display = uiNamespace getVariable ["TB_liveMonitor_display", displayNull];
        if (!isNull _display && TB_liveMonitor_delay < time) then 
        {
            TB_liveMonitor_delay = time + 0.5;
            TB_liveMonitor_time = time - 100;
            TB_liveMonitor_update = switch (TB_liveMonitor_update) do
            {
                case 1 : {2};
                case 2 : {5};
                case 5 : {10};
                default {1};
            };

            (_display displayCtrl 9104) ctrlSetStructuredText parseText format["%1s",TB_liveMonitor_update];

            systemChat format ["Änderungsrate auf %1s geändert", TB_liveMonitor_update];
        };
        
        false // andere Tasten nicht überschreiben
    },
    {},
    [DIK_UP, [false, false, false]]
] call CBA_fnc_addKeybind;

[
    "TB_liveMonitor",
    "liveMonitor_keyClose",
    ["schließen", "Schließt den Monitor"],
    {
        if (!isNull (uiNamespace getVariable ["TB_liveMonitor_display", displayNull])) then 
        {
            call TB_liveMonitor_fnc_remove;
        };
        
        false // andere Tasten nicht überschreiben
    },
    {},
    [DIK_DOWN, [false, false, false]]
] call CBA_fnc_addKeybind;
