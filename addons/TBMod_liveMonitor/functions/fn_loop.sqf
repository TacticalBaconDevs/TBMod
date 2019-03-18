/* ----------------------------------------------------------------------------
Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
Developed by http://tacticalbacon.de

Function: TB_liveMonitor_fnc_loop

Description:
    It´s a each frame handler and will animated the display 'TB_liveMonitor_gui'
    Also it will check the timer 'TB_liveMonitor_time', if a value have to update

Parameters:
    nothing

Passed Arguments:
    nothing

Returns:
    nothing

Author:
    Taranis [TacticalBacon.de]
---------------------------------------------------------------------------- */
TB_liveMonitor_pefhID = [{
    if (TB_liveMonitor_initialized) then
    {
        //------------------------ VALUE UPDATE ------------------------
        disableSerialization;
        private _displayCtrl = uiNamespace getVariable ['TB_liveMonitor_display', displayNull];

        if (time - TB_liveMonitor_time > TB_liveMonitor_update) exitwith
        {
            //Reset
            TB_liveMonitor_time = time;

            if !(isNil "TB_liveMonitor_unit") then
            {
                if (TB_liveMonitor_unit distance player > 10) exitWith
                {
                    systemChat "[LiveMonitor] Verbindung verloren!";
                    TB_liveMonitor_unit = nil;
                };

                private _heartRate_player = [0,floor((1 - ace_advanced_fatigue_anReserve / 2300) * 120) + floor(random[-4, 0, 4])] select (TB_liveMonitor_unit isEqualTo player);

                TB_liveMonitor_ace_heartrate = _heartRate_player + (TB_liveMonitor_unit getVariable "ace_medical_heartrate");
                TB_liveMonitor_ace_bloodvolume = TB_liveMonitor_unit getVariable "ace_medical_bloodvolume";
                TB_liveMonitor_ace_bloodpressure = TB_liveMonitor_unit getVariable "ace_medical_bloodpressure";
                TB_liveMonitor_ace_bloodpressure = [round ((TB_liveMonitor_ace_bloodpressure select 0) + floor (random [-3, 0, 3])), round ((TB_liveMonitor_ace_bloodpressure select 1) + floor (random [-3, 0, 3]))]
            }
            else
            {
                TB_liveMonitor_ace_heartrate = 0;
                TB_liveMonitor_ace_bloodvolume = 100;
                TB_liveMonitor_ace_bloodpressure = ["000","000"];
            };

            private _text1 = parseText str (round TB_liveMonitor_ace_heartrate);
            private _text2 = parseText format["%1/%2", 0 max (TB_liveMonitor_ace_bloodpressure select 0), 0 max (TB_liveMonitor_ace_bloodpressure select 1)];
            private _text3 = parseText format["Verlust: - %1ml", round (floor((100 - TB_liveMonitor_ace_bloodvolume) * 1428.57143 / 1000) * 10)];

            (_displayCtrl displayCtrl 9101) ctrlSetStructuredText _text1;
            (_displayCtrl displayCtrl 9102) ctrlSetStructuredText _text2;

            if (TB_liveMonitor_ace_bloodvolume < 93) then
            {
                (_displayCtrl displayCtrl 9103) ctrlSetStructuredText _text3;
            }
            else
            {
                (_displayCtrl displayCtrl 9103) ctrlSetStructuredText parseText "keine Info";
            };
        };

        //------------------------ ANIMATION HEARTBEAT ------------------------
        if (!(TB_liveMonitor_ace_heartrate isEqualTo 0) && TB_liveMonitor_nextBeat < time) then
        {
            TB_liveMonitor_nextBeat = time + 60 / TB_liveMonitor_ace_heartrate;
            TB_liveMonitor_beatCounter = TB_liveMonitor_beatCounter + ([1,2] select (TB_liveMonitor_beatCounter % 5 isEqualTo 4));

            private _control = _displayCtrl displayCtrl (9110 + TB_liveMonitor_beatCounter % 5);
            _control ctrlSetPosition [0.2125, 0, 0.0425, 0.3];
            _control ctrlCommit 0;
            _control ctrlSetPosition [-0.0425, 0, 0.0425, 0.3];
            _control ctrlCommit 1;
        };
    };
}, 1] call CBA_fnc_addPerFrameHandler;