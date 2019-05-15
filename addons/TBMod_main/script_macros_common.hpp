/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
#define QUOTE(var1) #var1
#define ARR_2(ARG1,ARG2) ARG1, ARG2

/*
    From CBA https://github.com/CBATeam/CBA_A3/blob/master/addons/main/script_macros_common.hpp
*/
#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3

//#define ADDON TB
//#define COMPONENT main

#define FUNC(var1) TRIPLES(DOUBLES(ADDON,COMPONENT),fnc,var1)
#define EFUNC(var1,var2) TRIPLES(DOUBLES(ADDON,var1),fnc,var2)

