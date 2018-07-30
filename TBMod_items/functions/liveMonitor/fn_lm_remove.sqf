/* ----------------------------------------------------------------------------
Function: TB_Items_fnc_lm_remove

Description:
    Close the display and clear all variables

Parameters:
    nothing

Passed Arguments:
    nothing

Returns:
    nothing

Author:
    Taranis [TacticalBacon.de]
---------------------------------------------------------------------------- */
["EV_liveMonitor_eachFrame", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;

TB_Item_liveMonitor_initialized = false;
[1] spawn TB_Items_fnc_lm_animated;

TB_Item_liveMonitor_display = nil;
TB_Item_liveMonitor_update = nil;

//Timings and Counter
TB_Item_liveMonitor_time = nil;
TB_Item_liveMonitor_nextBeat = nil;
TB_Item_liveMonitor_beatCounter = nil;

//First time, important
TB_Item_liveMonitor_ace_heartrate = nil;
TB_Item_liveMonitor_ace_bloodvolume = nil;
TB_Item_liveMonitor_ace_bloodpressure = nil;

TB_Item_liveMonitor_isActive = false;
TB_Item_liveMonitor_unit = nil;