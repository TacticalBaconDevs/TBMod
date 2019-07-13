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
#define CALL_XEHPREP ADDON = false; \
    PREP_RECOMPILE_START; \
    #include "XEH_PREP.hpp" \
    PREP_RECOMPILE_END; \
    ADDON = true
