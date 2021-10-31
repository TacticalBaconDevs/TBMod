/*
    Part of the TBMod ( https://github.com/TacticalBaconDevs/TBMod )
    Developed by http://tacticalbacon.de
*/
class Extended_PreInit_EventHandlers
{
    class ADDON
    {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

//Möglicher weise Probleme mit Medical wenn Person ausgeladen wird
class Extended_GetIn_EventHandlers {
    class All {
        class GVAR(GetIn) {
            getIn = QUOTE(_this call FUNC(handleGetIn));
        };
    };
};

class Extended_GetOut_EventHandlers {
    class All {
        class GVAR(GetOut) {
            getOut = QUOTE(_this call FUNC(handleGetOut));
        };
    };
};

class Extended_FiredBis_EventHandlers {
    class All {
        class GVAR(Fired) {
            fired = QUOTE(_this call FUNC(handleFired));
        };
    };
};

class Extended_Hit_EventHandlers {
    class All {
        class GVAR(Hit) {
            hit = QUOTE(_this call FUNC(handleHit));
        };
    };
};
