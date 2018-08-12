/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
    
    Author: Eric Ruhland
    Creates a Rope with no end attached
    
    Arguments:
    0: Source <OBJECT>
    1: Selection <STRING>
    2: Helper <OBJECT>
    Return Value:
    None
*/
params ["_source", "_selection", "_helper"];

private _idPFH = [{
    params ["_args", "_idPFH"];
    _args params ["_source", "_selection", "_helper"];

    private _posplayer = getPosASL player;
    private _sourcepos = ATLtoASL (_source modelToWorld (_source selectionPosition _selection));
    if !(
        alive player 
        && {!(player getVariable ["ACE_isUnconscious", false])}
        && player == vehicle player
        && (_posplayer distance _sourcepos) < 21
    ) exitWith {
        systemChat format ["DEBUG(startRopeinHandsPFH) alive %1 isuncouncios %2 isinVehicle %3 distance %4 distancecheck %5", alive player, (player getVariable ["ACE_isUnconscious", false]), player != vehicle player, _posplayer distance _sourcepos, (_posplayer distance _sourcepos) > 21];
        call TB_fnc_dropRope;
        hint "Dropped Rope";
    }
}, 0, [_source, _selection, _helper]] call cba_fnc_addPerFrameHandler;
_helper setVariable ["TB_Rope_idPFH", _idPFH];
