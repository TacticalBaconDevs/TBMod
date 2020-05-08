
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
// BIN_fnc_updateSpectrumAnalyzerInput
params [["_forced",false,[false]]];
private _alldisplay = alldisplays;

if (_forced || {!visiblemap && {_alldisplay find finddisplay 46 == count _alldisplay - 2}}) then {
    if (cameraview == "gunner" || _forced) then {
        _scrollUp = (inputaction "prevAction");
        _scrollDown = (inputaction "nextAction") * 3;

        if (_scrollUp > 0 || _scrollDown > 0) exitwith {
            _scroll = ((_scrollUp - _scrollDown) max -1 min +1);

            private _fMin =             (missionnamespace getvariable [            "#EM_FMin",            -1]);
            private _fMax =             (missionnamespace getvariable [            "#EM_FMax",            -1]);
            private _fWidth = _fMax - _fMin;

            private _selMin =             (missionnamespace getvariable [            "#EM_SelMin",            -1]);
            private _selMax =             (missionnamespace getvariable [            "#EM_SelMax",            -1]);
            private _selWidth = _selMax - _selMin;
            private _selWidthHalf = _selWidth / 2;

            //_selMin = (_selMin + _scroll * (_fWidth * 0.025)) max _fMin min (_fMax - _selWidth);
            _selMin = (_selMin + _scroll * _selWidth) max (_fMin - _selWidthHalf) min (_fMax - _selWidth + _selWidthHalf);

            (missionnamespace setvariable [            "#EM_SelMin",_selMin]);
            (missionnamespace setvariable [            "#EM_SelMax",_selMin + _selWidth]);
        };
    };
};
