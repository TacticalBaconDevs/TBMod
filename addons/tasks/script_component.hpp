/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define COMPONENT tasks
#include "\x\TBMod\addons\common\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#include "\x\TBMod\addons\common\script_macros.hpp"

#define STATE_NotInitialised 0
#define STATE_Initialised 1
#define STATE_Completed 2
#define STATE_Failed 3
