/* ----------------------------------------------------------------------------
Function: TB_Items_fnc_lm_initialize
Description:
    Create the display and all necessary variables to get the UI 'TB_Item_liveMonitor' running

Parameters:
    nothing

Passed Arguments:
    nothing

Returns:
    nothing

Author:
    Taranis [TacticalBacon.de]
---------------------------------------------------------------------------- */
if (isNil {(uiNamespace getVariable 'TB_Item_liveMonitor_display')}) then 
{
	TB_Item_liveMonitor_initialized = false;
	[0] spawn TB_Items_fnc_lm_animated;

	//Setting for an faster Update
	TB_Item_liveMonitor_update = 2;
	TB_Item_liveMonitor_isActive = true;

	TB_Item_delay = time;

	//Timings and Counter
	TB_Item_liveMonitor_time = 0;
	TB_Item_liveMonitor_nextBeat = 0;
	TB_Item_liveMonitor_beatCounter = 1;

	//First time, important
	TB_Item_liveMonitor_ace_heartrate = 0;
	TB_Item_liveMonitor_ace_bloodvolume = 100;
	TB_Item_liveMonitor_ace_bloodpressure = ["000","000"];
};

	