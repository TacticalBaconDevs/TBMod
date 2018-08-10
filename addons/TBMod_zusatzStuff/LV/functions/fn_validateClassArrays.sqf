//LV_fnc_validateClassArrays.sqf - removes possible empty arrays - 1.0 - by SPUn / Kaarto Media
params [["_input", [], [[]]]];

_input select {
    _x != "" && isClass (configFile >> "CfgVehicles" >> _x)
};
