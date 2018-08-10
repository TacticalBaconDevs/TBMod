TB_Item_liveMonitor_isActive = false;
TB_Item_delay = time;

//diag_log "[TB_Items] liveMonitor ist bereit!";

TB_Items_fnc_lm_keyRefresh = {
    if (!(isNil {uiNamespace getVariable 'TB_Item_liveMonitor_display'}) && TB_Item_delay < time) then 
    {
        TB_Item_delay = time + 0.5;
        TB_Item_liveMonitor_time = time - 100;
        TB_Item_liveMonitor_update = switch (TB_Item_liveMonitor_update) do
        {
            case 1 : {2};
            case 2 : {5};
            case 5 : {10};
            default {1};
        };

        ((uiNamespace getVariable 'TB_Item_liveMonitor_display') displayCtrl 9104) ctrlSetStructuredText parseText format["%1s",TB_Item_liveMonitor_update];

        systemChat format["Refresh time changed to %1s", TB_Item_liveMonitor_update]
    };
    
    false
};
TB_Items_fnc_lm_keyClose = {
    if (!isNil {uiNamespace getVariable 'TB_Item_liveMonitor_display'}) then 
    {
        call TB_Items_fnc_lm_remove;
    };
    
    false
};

[
    "TB_Items",
    "liveMonitor_keyRefresh",
    "[lifeMonitor] Key for Refresh",
    {call TB_Items_fnc_lm_keyRefresh},
    "",
    [
        200,
        [
            false,
            false,
            false
        ]
    ]
] call CBA_fnc_addKeybind;

[
    "TB_Items",
    "liveMonitor_keyClose",
    "[lifeMonitor] Key for Close",
    {call TB_Items_fnc_lm_keyClose},
    "",
    [
        208,
        [
            false,
            false,
            false
        ]
    ]
] call CBA_fnc_addKeybind;
