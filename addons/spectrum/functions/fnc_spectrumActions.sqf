#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_modus", "_values"];
private _SELF = FUNC(spectrumActions);

switch (_modus) do
{
    case "MouseButtonDown":
    {
        _values params ["", "_button", "", "", "_shift", "_ctrl", "_alt"];

        private _alldisplay = alldisplays;
        if (!visiblemap && {_alldisplay find (finddisplay 46) == count _alldisplay - 2}) then
        {
            if (_button == 0) then {["startScan", [_ctrl]] call _SELF};
        };
    };

    case "MouseButtonUp":
    {
        _values params ["", "_button", "", "", "_shift", "_ctrl", "_alt"];

        private _alldisplay = alldisplays;
        if (!visiblemap && {_alldisplay find (finddisplay 46) == count _alldisplay - 2}) then
        {
            if (_button == 0) then {["resetScan"] call _SELF};
        };
    };

    case "MouseZChanged":
    {
        ["resetScan"] call _SELF;
        missionNamespace setVariable ["#EM_Progress", 0];
        missionnamespace setVariable ["#EM_Transmit", false];
    };

    case "startScan":
    {
        _values params ["_scanModus"];

        missionnamespace setVariable ["#EM_Transmit", _scanModus];
        missionNamespace setVariable ["#EM_Progress", 0];

        if (isNil QGVAR(scanning) || {scriptDone GVAR(scanning)}) then
        {
            GVAR(scanning) = _scanModus spawn
            {
                ((uiNamespace getVariable "rscweaponspectrumanalyzergeneric") displayctrl 5802) ctrlSetText (["SCANNING...", "TRANSMIT..."] select _this);

                waitUntil {
                    uiSleep 0.1;
                    private _prog = missionNamespace getVariable ["#EM_Progress", 0];
                    missionNamespace setVariable ["#EM_Progress", _prog + 0.01];
                    playSound (["ACE_Javelin_Locked", "ACE_Javelin_Locking"] select _this); //kestrel4500_exit_button_click
                    _prog >= 1
                };

                [["scanReturn", "transferReturn"] select _this] call FUNC(spectrumActions);

                playSound "ACE_Sound_Click";
            };
        };
    };

    case "scanReturn":
    {
        private _values = missionNamespace getVariable ["#EM_Values", []];
        private _max = -100;
        private _maxFreq = -1;
        {
            private _strength = _values param [(_values find _x) + 1, 0];
            if (_max < _strength) then
            {
                _max = _strength;
                _maxFreq = _x;
            };
        }
        forEach (_values select {_x >= (missionNamespace getVariable ["#EM_SelMin", 0]) && _x <= (missionNamespace getVariable ["#EM_SelMax", 1])});

        if (_maxFreq != -1) then
        {
            ((uiNamespace getVariable "rscweaponspectrumanalyzergeneric") displayctrl 5802) ctrlSetText (["TO WEAK", format [">>> %1 <<<", _maxFreq]] select (_max > -36));
        };
    };

    case "transferReturn":
    {
        ((uiNamespace getVariable "rscweaponspectrumanalyzergeneric") displayctrl 5802) ctrlSetText "TRANSMITTED";
    };

    case "MouseZChanged":
    {
        ["resetScan"] call _SELF;
        missionNamespace setVariable ["#EM_Progress", 0];
        missionnamespace setVariable ["#EM_Transmit", false];
    };

    case "resetScan":
    {
        if (!isNil QGVAR(scanning) && {!scriptDone GVAR(scanning)}) then
        {
            terminate GVAR(scanning);
            missionNamespace setVariable ["#EM_Progress", 0];
            missionnamespace setVariable ["#EM_Transmit", false];
            playSound "HintCollapse";
            ((uiNamespace getVariable "rscweaponspectrumanalyzergeneric") displayctrl 5802) ctrlSetText "";
        };
    };

};
