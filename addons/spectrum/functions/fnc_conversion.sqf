#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
params ["_value"];

private _modus = GVAR(conversionModus);
if (_modus isEqualType 0) then {_modus = str _modus};

if (_value < 0 || _value > 1) exitWith {systemChat format ["conversion Fehler: %1", _this]};

switch (_modus) do
{
    case "0";
    case "linear": {_value};

    case "1";
    case "expo": {linearConversion [exp 0, exp 4, exp (_value * 4), 0, 1, true]};

    case "2";
    case "square": {linearConversion [0^2, 1^2, _value^2, 0, 1, true]};
};

/*
test = [];
for "_i" from 0 to 1.1 step 0.1 do {
    test pushBack [_i, linearConversion [exp 0, exp 3, exp (_i * 3), 0, 1, false]]
};
test
*/
