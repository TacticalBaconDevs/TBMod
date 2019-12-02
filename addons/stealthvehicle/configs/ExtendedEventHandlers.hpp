/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_PreInit_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

//Möglicher weise Probleme mit Medical wenn Person ausgeladen wird
class Extended_GetIn_EventHandlers {
    class All {
        class GVAR(GetIn) {
            GetIn = QUOTE([_this] call FUNC(handleGetIn));
        };
    };
};

class Extended_GetOut_EventHandlers {
    class All {
        class GVAR(GetOut) {
            GetOut = QUOTE([_this] call FUNC(handleGetOut));
        };
    };
};
