/*
    Part of the TBMod ( https://github.com/shukari/TBMod )
    Developed by http://tacticalbacon.de
*/

// Persistence
for "_i" from 1 to 5 do
{
    profileNamespace setVariable [format ["TB_persistent_buildings_%1", _i], nil];
    profileNamespace setVariable [format ["TB_persistence_%1", _i], nil];
};

// Inkognitiosystem
profileNamespace setVariable ["TB_umziehen", nil];

saveProfileNamespace;
