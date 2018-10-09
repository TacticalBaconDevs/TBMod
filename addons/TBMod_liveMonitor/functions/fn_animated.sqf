/* ----------------------------------------------------------------------------
Part of the TBMod ( https://github.com/shukari/TBMod )
Developed by http://tacticalbacon.de

Function: TB_liveMonitor_fnc_animated

Description:
    After creation, the display get an animation at the beginning

Parameters:
    _mode - Start or Close Animation
        0 = Start
        1 = Close

Passed Arguments:
    nothing

Returns:
    nothing

Author:
    Taranis [TacticalBacon.de]
---------------------------------------------------------------------------- */
disableSerialization;
private _mode = param[0];

if (_mode isEqualTo 0) then
{
    1337 cutRsc ["TB_liveMonitor_gui", "PLAIN", 0, false];
    private _displayCtrl = uiNamespace getVariable ['TB_liveMonitor_display', displayNull];

    private _control = _displayCtrl displayCtrl 9101;
    _control ctrlSetFade 1;
    _control ctrlCommit 0;

    //Start the move the display up
    _control = _displayCtrl displayCtrl 9099;
    _control ctrlSetPosition [safezoneW + safezoneX - 0.565, safezoneH + safezoneY - 0.65];
    _control ctrlCommit 1;
    waitUntil {ctrlCommitted (_displayCtrl displayCtrl 9099)};

    //Turn the display on
    _control = _displayCtrl displayCtrl 9120;
    _control ctrlSetFade 1;
    _control ctrlCommit 1;
    _control = _displayCtrl displayCtrl 9101;
    _control ctrlSetFade 0;
    _control ctrlCommit 1;
    waitUntil {ctrlCommitted (_displayCtrl displayCtrl 9120)};

    TB_liveMonitor_initialized = true;
};

if (_mode isEqualTo 1) then
{
    private _displayCtrl = uiNamespace getVariable ['TB_liveMonitor_display', displayNull];
    
    //Turn the display off
    private _control = _displayCtrl displayCtrl 9101;
    _control ctrlSetFade 1;
    _control ctrlCommit 1;
    _control = _displayCtrl displayCtrl 9120;
    _control ctrlSetFade 0;
    _control ctrlCommit 1;
    waitUntil {ctrlCommitted (_displayCtrl displayCtrl 9120)};

    //Start the move the display down
    _control = _displayCtrl displayCtrl 9099;
    _control ctrlSetPosition [safezoneW + safezoneX - 0.565, safezoneH + safezoneY + 0.1];
    _control ctrlCommit 1;
    waitUntil {ctrlCommitted (_displayCtrl displayCtrl 9099)};

    1337 cutFadeOut 0;
    uiNamespace setVariable ['TB_liveMonitor_display', nil];
};

