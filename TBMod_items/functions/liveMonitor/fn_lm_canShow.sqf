/* ----------------------------------------------------------------------------
Function: TB_Items_fnc_lm_canShow

Description:
    Check for the item "TB_Item_liveMonitor"

Parameters:
    nothing

Passed Arguments:
    nothing

Returns:
    ... - Return a TRUE, if the player has the item 'TB_Item_liveMonitor' [BOOLEAN]

Author:
    Taranis [TacticalBacon.de]
---------------------------------------------------------------------------- */
("TB_Item_liveMonitor" in (uniformItems player)) || ("TB_Item_liveMonitor" in (vestItems player))