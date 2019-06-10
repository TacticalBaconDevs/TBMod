/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de

    from CBA https://github.com/CBATeam/CBA_A3/blob/master/addons/main/script_macros_common.hpp
*/
#define QUOTE(var1) #var1
#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
#define ADDONTAG(var1) QUOTE(DOUBLES(ADDON,COMPONENT))

#define FUNC(var1) TRIPLES(DOUBLES(ADDON,COMPONENT),fnc,var1)
#define EFUNC(var1,var2) TRIPLES(DOUBLES(ADDON,var1),fnc,var2)
#define QFUNC(var1) QUOTE(FUNC(var1))
#define QEFUNC(var1,var2) QUOTE(EFUNC(var1,var2))

#define GVAR(var1) DOUBLES(ADDON,var1)
#define EGVAR(var1,var2) TRIPLES(PREFIX,var1,var2)
#define QGVAR(var1) QUOTE(GVAR(var1))
#define QEGVAR(var1,var2) QUOTE(EGVAR(var1,var2))
