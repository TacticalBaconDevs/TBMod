/* ----------------------------------------------------------------------------
Part of the TBMod ( https://github.com/shukari/TBMod )
Developed by http://tacticalbacon.de

Function: TB_liveMonitor_fnc_canShow

Description:
    Check for the item "TB_liveMonitor_monitor"

Parameters:
    nothing

Passed Arguments:
    nothing

Returns:
    ... - Return a TRUE, if the player has the item 'TB_liveMonitor_monitor' [BOOLEAN]

Author:
    Taranis [TacticalBacon.de]
---------------------------------------------------------------------------- */
("TB_liveMonitor_monitor" in (uniformItems player)) || ("TB_liveMonitor_monitor" in (vestItems player))