/* ----------------------------------------------------------------------------
Function: TB_Items_fnc_lm_loop

Description:
    It´s a each frame handler and will animated the display 'TB_Item_liveMonitor'
    Also it will check the timer 'TB_Item_liveMonitor_time', if a value have to update

Parameters:
    nothing

Passed Arguments:
    nothing

Returns:
    nothing

Author:
    Taranis [TacticalBacon.de]
---------------------------------------------------------------------------- */
[
    "EV_liveMonitor_eachFrame",
    "onEachFrame",
    {
        if (TB_Item_liveMonitor_initialized) then 
        {
            //------------------------ VALUE UPDATE ------------------------
            disableSerialization;
            private _displayCtrl = uiNamespace getVariable 'TB_Item_liveMonitor_display';
            
            if (time - TB_Item_liveMonitor_time > TB_Item_liveMonitor_update) exitwith
            {
                //Reset
                TB_Item_liveMonitor_time = time;

                if !(isNil "TB_Item_liveMonitor_unit") then
                {
                    if (TB_Item_liveMonitor_unit distance player > 10) exitWith {systemChat "[Live Monitor] Connection lost!"; TB_Item_liveMonitor_unit = nil};

                    private _heartRate_player = [0,floor((1 - ace_advanced_fatigue_anReserve / 2300) * 120) + floor(random[-4, 0, 4])] select (TB_Item_liveMonitor_unit isEqualTo player);

                    TB_Item_liveMonitor_ace_heartrate = _heartRate_player + (TB_Item_liveMonitor_unit getVariable "ace_medical_heartrate");
                    TB_Item_liveMonitor_ace_bloodvolume = TB_Item_liveMonitor_unit getVariable "ace_medical_bloodvolume";
                    TB_Item_liveMonitor_ace_bloodpressure = TB_Item_liveMonitor_unit getVariable "ace_medical_bloodpressure";
                    TB_Item_liveMonitor_ace_bloodpressure = [round ((TB_Item_liveMonitor_ace_bloodpressure select 0) + floor(random[-3, 0, 3])), round ((TB_Item_liveMonitor_ace_bloodpressure select 1) + floor(random[-3, 0, 3]))]
                } else {
                    TB_Item_liveMonitor_ace_heartrate = 0;
                    TB_Item_liveMonitor_ace_bloodvolume = 100;
                    TB_Item_liveMonitor_ace_bloodpressure = ["000","000"];
                };

                private _text1 = parseText str (round TB_Item_liveMonitor_ace_heartrate);
                private _text2 = parseText format["%1/%2", TB_Item_liveMonitor_ace_bloodpressure select 0, TB_Item_liveMonitor_ace_bloodpressure select 1];
                private _text3 = parseText format["Lost: - %1ml", round (floor((100 - TB_Item_liveMonitor_ace_bloodvolume) * 1428.57143 / 1000) * 10)];

                (_displayCtrl displayCtrl 9101) ctrlSetStructuredText _text1;
                (_displayCtrl displayCtrl 9102) ctrlSetStructuredText _text2;

                if (TB_Item_liveMonitor_ace_bloodvolume < 93) then {
                    (_displayCtrl displayCtrl 9103) ctrlSetStructuredText _text3;
                } else {
                    (_displayCtrl displayCtrl 9103) ctrlSetStructuredText parseText "Lost: no info";
                };
            };

            //------------------------ ANIMATION HEARTBEAT ------------------------
            if (!(TB_Item_liveMonitor_ace_heartrate isEqualTo 0) && TB_Item_liveMonitor_nextBeat < time) then 
            {
                TB_Item_liveMonitor_nextBeat = time + 60 / TB_Item_liveMonitor_ace_heartrate;
                TB_Item_liveMonitor_beatCounter = TB_Item_liveMonitor_beatCounter + ([1,2] select (TB_Item_liveMonitor_beatCounter % 5 isEqualTo 4));

                private _control = _displayCtrl displayCtrl (9110 + TB_Item_liveMonitor_beatCounter % 5);
                _control ctrlSetPosition [0.2125, 0, 0.0425, 0.3];
                _control ctrlCommit 0;
                _control ctrlSetPosition [-0.0425, 0, 0.0425, 0.3];
                _control ctrlCommit 1;
            };
        };
    }
] call BIS_fnc_addStackedEventHandler;