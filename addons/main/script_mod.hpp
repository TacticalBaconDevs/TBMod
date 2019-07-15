/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define PREFIX TBMod

#include "script_version.hpp"

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define REQUIRED_VERSION 1.92
#define REQUIRED_CBA_VERSION {3,12,0}
#define REQUIRED_ACE_VERSION {3,12,6}

/*
    Mod spezifische Makros
*/
#ifdef DISABLE_COMPILE_CACHE
    #define PREP_OTHERFOLDER(fncName,path) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(path\DOUBLES(fnc,fncName).sqf)
#else
    #define PREP_OTHERFOLDER(fncName,path) [QPATHTOF(path\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define DEBUG_MODE_FULL
#define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS