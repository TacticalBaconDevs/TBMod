/* ----------------------------------------------------------------------------
Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
Developed by http://tacticalbacon.de

Function: TB_liveMonitor_fnc_remove

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
if (!isNil "TB_liveMonitor_pefhID") then {[TB_liveMonitor_pefhID] call CBA_fnc_removePerFrameHandler};

TB_liveMonitor_initialized = false;
[1] spawn TB_liveMonitor_fnc_animated;

TB_liveMonitor_display = nil;
TB_liveMonitor_update = nil;

// Timings and Counter
TB_liveMonitor_time = nil;
TB_liveMonitor_nextBeat = nil;
TB_liveMonitor_beatCounter = nil;

// First time, important
TB_liveMonitor_ace_heartrate = nil;
TB_liveMonitor_ace_bloodvolume = nil;
TB_liveMonitor_ace_bloodpressure = nil;

TB_liveMonitor_isActive = false;
TB_liveMonitor_unit = nil;