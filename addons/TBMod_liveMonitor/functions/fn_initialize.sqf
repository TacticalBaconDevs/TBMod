/* ----------------------------------------------------------------------------
Part of the TBMod ( https://github.com/shukari/TBMod )
Developed by http://tacticalbacon.de

Function: TB_liveMonitor_fnc_initialize

Description:
    Create the display and all necessary variables to get the UI 'TB_liveMonitor_gui' running

Parameters:
    nothing

Passed Arguments:
    nothing

Returns:
    nothing

Author:
    Taranis [TacticalBacon.de]
---------------------------------------------------------------------------- */
if (isNull (uiNamespace getVariable ['TB_liveMonitor_display', displayNull])) then 
{
    TB_liveMonitor_initialized = false;
    [0] spawn TB_liveMonitor_fnc_animated;

    //Setting for an faster Update
    TB_liveMonitor_update = 2;
    TB_liveMonitor_isActive = true;

    TB_liveMonitor_delay = time;

    //Timings and Counter
    TB_liveMonitor_time = 0;
    TB_liveMonitor_nextBeat = 0;
    TB_liveMonitor_beatCounter = 1;

    //First time, important
    TB_liveMonitor_ace_heartrate = 0;
    TB_liveMonitor_ace_bloodvolume = 100;
    TB_liveMonitor_ace_bloodpressure = ["000", "000"];
};
