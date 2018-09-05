/*
    Author: shukari
*/
params ["_args", "_target"];
_args params ["", "", "", "_actionData"];

_actionData set [1, ["Baustelle: BLOCKIERT", "Baustelle: FREI"] select ((_target nearEntities ["CAManBase", _target getVariable ['placeables_range', 6]]) isEqualTo [])];
