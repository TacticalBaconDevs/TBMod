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

    private _posACE_player = ASLtoAGL (getPosASL ACE_player);
    private _sourcepos = _source modelToWorld (_source selectionPosition _selection);
    if !(
        alive ACE_player 
        && {!(ACE_player getVariable ["ACE_isUnconscious", false])}
        && ACE_player == vehicle ACE_player
        && (_posACE_player distance _sourcepos) < 21
    ) exitWith {
        systemChat format ["DEBUG(startRopeinHandsPFH) alive %1 isuncouncios %2 isinVehicle %3 distance %4 distancecheck %5", alive ACE_player, (ACE_player getVariable ["ACE_isUnconscious", false]), ACE_player != vehicle ACE_player, _posACE_player distance _sourcepos, (_posACE_player distance _sourcepos) > 20];
        call TB_fnc_dropRope;
        systemChat "Dropped Rope";
    }
}, 0, [_source, _selection, _helper]] call cba_fnc_addPerFrameHandler;

ACE_player setVariable ["TB_Rope_idPFH", _idPFH];
