#include "../script_macros.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://killzonekid.com/arma-scripting-tutorials-attach-to-relative/
*/
params ["_obj1", "_obj2"];

_obj1 attachTo [_obj2];
private _v = _obj2 worldToModelVisual [0,0,0];
_obj1 setVectorDirAndUp [
        (_obj2 worldToModelVisual (vectorDirVisual _obj1)) vectorDiff _v,
        (_obj2 worldToModelVisual (vectorUpVisual _obj1)) vectorDiff _v
    ];
