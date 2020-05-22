#include "../script_component.hpp"
/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
if (!GVAR(enable)) exitWith {};

[_this # 0, random [420, 443, 480]] call FUNC(createTransmitter);
